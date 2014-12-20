---
output:
  html_document:
    self_contained: no
---

```r
library(knitr)
knit_hooks$set(webgl = hook_webgl)
cat('<script type="text/javascript">', readLines(system.file('WebGL', 'CanvasMatrix.js', package = 'rgl')), '</script>', sep = '\n')
```

<script type="text/javascript">
CanvasMatrix4=function(m){if(typeof m=='object'){if("length"in m&&m.length>=16){this.load(m[0],m[1],m[2],m[3],m[4],m[5],m[6],m[7],m[8],m[9],m[10],m[11],m[12],m[13],m[14],m[15]);return}else if(m instanceof CanvasMatrix4){this.load(m);return}}this.makeIdentity()};CanvasMatrix4.prototype.load=function(){if(arguments.length==1&&typeof arguments[0]=='object'){var matrix=arguments[0];if("length"in matrix&&matrix.length==16){this.m11=matrix[0];this.m12=matrix[1];this.m13=matrix[2];this.m14=matrix[3];this.m21=matrix[4];this.m22=matrix[5];this.m23=matrix[6];this.m24=matrix[7];this.m31=matrix[8];this.m32=matrix[9];this.m33=matrix[10];this.m34=matrix[11];this.m41=matrix[12];this.m42=matrix[13];this.m43=matrix[14];this.m44=matrix[15];return}if(arguments[0]instanceof CanvasMatrix4){this.m11=matrix.m11;this.m12=matrix.m12;this.m13=matrix.m13;this.m14=matrix.m14;this.m21=matrix.m21;this.m22=matrix.m22;this.m23=matrix.m23;this.m24=matrix.m24;this.m31=matrix.m31;this.m32=matrix.m32;this.m33=matrix.m33;this.m34=matrix.m34;this.m41=matrix.m41;this.m42=matrix.m42;this.m43=matrix.m43;this.m44=matrix.m44;return}}this.makeIdentity()};CanvasMatrix4.prototype.getAsArray=function(){return[this.m11,this.m12,this.m13,this.m14,this.m21,this.m22,this.m23,this.m24,this.m31,this.m32,this.m33,this.m34,this.m41,this.m42,this.m43,this.m44]};CanvasMatrix4.prototype.getAsWebGLFloatArray=function(){return new WebGLFloatArray(this.getAsArray())};CanvasMatrix4.prototype.makeIdentity=function(){this.m11=1;this.m12=0;this.m13=0;this.m14=0;this.m21=0;this.m22=1;this.m23=0;this.m24=0;this.m31=0;this.m32=0;this.m33=1;this.m34=0;this.m41=0;this.m42=0;this.m43=0;this.m44=1};CanvasMatrix4.prototype.transpose=function(){var tmp=this.m12;this.m12=this.m21;this.m21=tmp;tmp=this.m13;this.m13=this.m31;this.m31=tmp;tmp=this.m14;this.m14=this.m41;this.m41=tmp;tmp=this.m23;this.m23=this.m32;this.m32=tmp;tmp=this.m24;this.m24=this.m42;this.m42=tmp;tmp=this.m34;this.m34=this.m43;this.m43=tmp};CanvasMatrix4.prototype.invert=function(){var det=this._determinant4x4();if(Math.abs(det)<1e-8)return null;this._makeAdjoint();this.m11/=det;this.m12/=det;this.m13/=det;this.m14/=det;this.m21/=det;this.m22/=det;this.m23/=det;this.m24/=det;this.m31/=det;this.m32/=det;this.m33/=det;this.m34/=det;this.m41/=det;this.m42/=det;this.m43/=det;this.m44/=det};CanvasMatrix4.prototype.translate=function(x,y,z){if(x==undefined)x=0;if(y==undefined)y=0;if(z==undefined)z=0;var matrix=new CanvasMatrix4();matrix.m41=x;matrix.m42=y;matrix.m43=z;this.multRight(matrix)};CanvasMatrix4.prototype.scale=function(x,y,z){if(x==undefined)x=1;if(z==undefined){if(y==undefined){y=x;z=x}else z=1}else if(y==undefined)y=x;var matrix=new CanvasMatrix4();matrix.m11=x;matrix.m22=y;matrix.m33=z;this.multRight(matrix)};CanvasMatrix4.prototype.rotate=function(angle,x,y,z){angle=angle/180*Math.PI;angle/=2;var sinA=Math.sin(angle);var cosA=Math.cos(angle);var sinA2=sinA*sinA;var length=Math.sqrt(x*x+y*y+z*z);if(length==0){x=0;y=0;z=1}else if(length!=1){x/=length;y/=length;z/=length}var mat=new CanvasMatrix4();if(x==1&&y==0&&z==0){mat.m11=1;mat.m12=0;mat.m13=0;mat.m21=0;mat.m22=1-2*sinA2;mat.m23=2*sinA*cosA;mat.m31=0;mat.m32=-2*sinA*cosA;mat.m33=1-2*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else if(x==0&&y==1&&z==0){mat.m11=1-2*sinA2;mat.m12=0;mat.m13=-2*sinA*cosA;mat.m21=0;mat.m22=1;mat.m23=0;mat.m31=2*sinA*cosA;mat.m32=0;mat.m33=1-2*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else if(x==0&&y==0&&z==1){mat.m11=1-2*sinA2;mat.m12=2*sinA*cosA;mat.m13=0;mat.m21=-2*sinA*cosA;mat.m22=1-2*sinA2;mat.m23=0;mat.m31=0;mat.m32=0;mat.m33=1;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else{var x2=x*x;var y2=y*y;var z2=z*z;mat.m11=1-2*(y2+z2)*sinA2;mat.m12=2*(x*y*sinA2+z*sinA*cosA);mat.m13=2*(x*z*sinA2-y*sinA*cosA);mat.m21=2*(y*x*sinA2-z*sinA*cosA);mat.m22=1-2*(z2+x2)*sinA2;mat.m23=2*(y*z*sinA2+x*sinA*cosA);mat.m31=2*(z*x*sinA2+y*sinA*cosA);mat.m32=2*(z*y*sinA2-x*sinA*cosA);mat.m33=1-2*(x2+y2)*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}this.multRight(mat)};CanvasMatrix4.prototype.multRight=function(mat){var m11=(this.m11*mat.m11+this.m12*mat.m21+this.m13*mat.m31+this.m14*mat.m41);var m12=(this.m11*mat.m12+this.m12*mat.m22+this.m13*mat.m32+this.m14*mat.m42);var m13=(this.m11*mat.m13+this.m12*mat.m23+this.m13*mat.m33+this.m14*mat.m43);var m14=(this.m11*mat.m14+this.m12*mat.m24+this.m13*mat.m34+this.m14*mat.m44);var m21=(this.m21*mat.m11+this.m22*mat.m21+this.m23*mat.m31+this.m24*mat.m41);var m22=(this.m21*mat.m12+this.m22*mat.m22+this.m23*mat.m32+this.m24*mat.m42);var m23=(this.m21*mat.m13+this.m22*mat.m23+this.m23*mat.m33+this.m24*mat.m43);var m24=(this.m21*mat.m14+this.m22*mat.m24+this.m23*mat.m34+this.m24*mat.m44);var m31=(this.m31*mat.m11+this.m32*mat.m21+this.m33*mat.m31+this.m34*mat.m41);var m32=(this.m31*mat.m12+this.m32*mat.m22+this.m33*mat.m32+this.m34*mat.m42);var m33=(this.m31*mat.m13+this.m32*mat.m23+this.m33*mat.m33+this.m34*mat.m43);var m34=(this.m31*mat.m14+this.m32*mat.m24+this.m33*mat.m34+this.m34*mat.m44);var m41=(this.m41*mat.m11+this.m42*mat.m21+this.m43*mat.m31+this.m44*mat.m41);var m42=(this.m41*mat.m12+this.m42*mat.m22+this.m43*mat.m32+this.m44*mat.m42);var m43=(this.m41*mat.m13+this.m42*mat.m23+this.m43*mat.m33+this.m44*mat.m43);var m44=(this.m41*mat.m14+this.m42*mat.m24+this.m43*mat.m34+this.m44*mat.m44);this.m11=m11;this.m12=m12;this.m13=m13;this.m14=m14;this.m21=m21;this.m22=m22;this.m23=m23;this.m24=m24;this.m31=m31;this.m32=m32;this.m33=m33;this.m34=m34;this.m41=m41;this.m42=m42;this.m43=m43;this.m44=m44};CanvasMatrix4.prototype.multLeft=function(mat){var m11=(mat.m11*this.m11+mat.m12*this.m21+mat.m13*this.m31+mat.m14*this.m41);var m12=(mat.m11*this.m12+mat.m12*this.m22+mat.m13*this.m32+mat.m14*this.m42);var m13=(mat.m11*this.m13+mat.m12*this.m23+mat.m13*this.m33+mat.m14*this.m43);var m14=(mat.m11*this.m14+mat.m12*this.m24+mat.m13*this.m34+mat.m14*this.m44);var m21=(mat.m21*this.m11+mat.m22*this.m21+mat.m23*this.m31+mat.m24*this.m41);var m22=(mat.m21*this.m12+mat.m22*this.m22+mat.m23*this.m32+mat.m24*this.m42);var m23=(mat.m21*this.m13+mat.m22*this.m23+mat.m23*this.m33+mat.m24*this.m43);var m24=(mat.m21*this.m14+mat.m22*this.m24+mat.m23*this.m34+mat.m24*this.m44);var m31=(mat.m31*this.m11+mat.m32*this.m21+mat.m33*this.m31+mat.m34*this.m41);var m32=(mat.m31*this.m12+mat.m32*this.m22+mat.m33*this.m32+mat.m34*this.m42);var m33=(mat.m31*this.m13+mat.m32*this.m23+mat.m33*this.m33+mat.m34*this.m43);var m34=(mat.m31*this.m14+mat.m32*this.m24+mat.m33*this.m34+mat.m34*this.m44);var m41=(mat.m41*this.m11+mat.m42*this.m21+mat.m43*this.m31+mat.m44*this.m41);var m42=(mat.m41*this.m12+mat.m42*this.m22+mat.m43*this.m32+mat.m44*this.m42);var m43=(mat.m41*this.m13+mat.m42*this.m23+mat.m43*this.m33+mat.m44*this.m43);var m44=(mat.m41*this.m14+mat.m42*this.m24+mat.m43*this.m34+mat.m44*this.m44);this.m11=m11;this.m12=m12;this.m13=m13;this.m14=m14;this.m21=m21;this.m22=m22;this.m23=m23;this.m24=m24;this.m31=m31;this.m32=m32;this.m33=m33;this.m34=m34;this.m41=m41;this.m42=m42;this.m43=m43;this.m44=m44};CanvasMatrix4.prototype.ortho=function(left,right,bottom,top,near,far){var tx=(left+right)/(left-right);var ty=(top+bottom)/(top-bottom);var tz=(far+near)/(far-near);var matrix=new CanvasMatrix4();matrix.m11=2/(left-right);matrix.m12=0;matrix.m13=0;matrix.m14=0;matrix.m21=0;matrix.m22=2/(top-bottom);matrix.m23=0;matrix.m24=0;matrix.m31=0;matrix.m32=0;matrix.m33=-2/(far-near);matrix.m34=0;matrix.m41=tx;matrix.m42=ty;matrix.m43=tz;matrix.m44=1;this.multRight(matrix)};CanvasMatrix4.prototype.frustum=function(left,right,bottom,top,near,far){var matrix=new CanvasMatrix4();var A=(right+left)/(right-left);var B=(top+bottom)/(top-bottom);var C=-(far+near)/(far-near);var D=-(2*far*near)/(far-near);matrix.m11=(2*near)/(right-left);matrix.m12=0;matrix.m13=0;matrix.m14=0;matrix.m21=0;matrix.m22=2*near/(top-bottom);matrix.m23=0;matrix.m24=0;matrix.m31=A;matrix.m32=B;matrix.m33=C;matrix.m34=-1;matrix.m41=0;matrix.m42=0;matrix.m43=D;matrix.m44=0;this.multRight(matrix)};CanvasMatrix4.prototype.perspective=function(fovy,aspect,zNear,zFar){var top=Math.tan(fovy*Math.PI/360)*zNear;var bottom=-top;var left=aspect*bottom;var right=aspect*top;this.frustum(left,right,bottom,top,zNear,zFar)};CanvasMatrix4.prototype.lookat=function(eyex,eyey,eyez,centerx,centery,centerz,upx,upy,upz){var matrix=new CanvasMatrix4();var zx=eyex-centerx;var zy=eyey-centery;var zz=eyez-centerz;var mag=Math.sqrt(zx*zx+zy*zy+zz*zz);if(mag){zx/=mag;zy/=mag;zz/=mag}var yx=upx;var yy=upy;var yz=upz;xx=yy*zz-yz*zy;xy=-yx*zz+yz*zx;xz=yx*zy-yy*zx;yx=zy*xz-zz*xy;yy=-zx*xz+zz*xx;yx=zx*xy-zy*xx;mag=Math.sqrt(xx*xx+xy*xy+xz*xz);if(mag){xx/=mag;xy/=mag;xz/=mag}mag=Math.sqrt(yx*yx+yy*yy+yz*yz);if(mag){yx/=mag;yy/=mag;yz/=mag}matrix.m11=xx;matrix.m12=xy;matrix.m13=xz;matrix.m14=0;matrix.m21=yx;matrix.m22=yy;matrix.m23=yz;matrix.m24=0;matrix.m31=zx;matrix.m32=zy;matrix.m33=zz;matrix.m34=0;matrix.m41=0;matrix.m42=0;matrix.m43=0;matrix.m44=1;matrix.translate(-eyex,-eyey,-eyez);this.multRight(matrix)};CanvasMatrix4.prototype._determinant2x2=function(a,b,c,d){return a*d-b*c};CanvasMatrix4.prototype._determinant3x3=function(a1,a2,a3,b1,b2,b3,c1,c2,c3){return a1*this._determinant2x2(b2,b3,c2,c3)-b1*this._determinant2x2(a2,a3,c2,c3)+c1*this._determinant2x2(a2,a3,b2,b3)};CanvasMatrix4.prototype._determinant4x4=function(){var a1=this.m11;var b1=this.m12;var c1=this.m13;var d1=this.m14;var a2=this.m21;var b2=this.m22;var c2=this.m23;var d2=this.m24;var a3=this.m31;var b3=this.m32;var c3=this.m33;var d3=this.m34;var a4=this.m41;var b4=this.m42;var c4=this.m43;var d4=this.m44;return a1*this._determinant3x3(b2,b3,b4,c2,c3,c4,d2,d3,d4)-b1*this._determinant3x3(a2,a3,a4,c2,c3,c4,d2,d3,d4)+c1*this._determinant3x3(a2,a3,a4,b2,b3,b4,d2,d3,d4)-d1*this._determinant3x3(a2,a3,a4,b2,b3,b4,c2,c3,c4)};CanvasMatrix4.prototype._makeAdjoint=function(){var a1=this.m11;var b1=this.m12;var c1=this.m13;var d1=this.m14;var a2=this.m21;var b2=this.m22;var c2=this.m23;var d2=this.m24;var a3=this.m31;var b3=this.m32;var c3=this.m33;var d3=this.m34;var a4=this.m41;var b4=this.m42;var c4=this.m43;var d4=this.m44;this.m11=this._determinant3x3(b2,b3,b4,c2,c3,c4,d2,d3,d4);this.m21=-this._determinant3x3(a2,a3,a4,c2,c3,c4,d2,d3,d4);this.m31=this._determinant3x3(a2,a3,a4,b2,b3,b4,d2,d3,d4);this.m41=-this._determinant3x3(a2,a3,a4,b2,b3,b4,c2,c3,c4);this.m12=-this._determinant3x3(b1,b3,b4,c1,c3,c4,d1,d3,d4);this.m22=this._determinant3x3(a1,a3,a4,c1,c3,c4,d1,d3,d4);this.m32=-this._determinant3x3(a1,a3,a4,b1,b3,b4,d1,d3,d4);this.m42=this._determinant3x3(a1,a3,a4,b1,b3,b4,c1,c3,c4);this.m13=this._determinant3x3(b1,b2,b4,c1,c2,c4,d1,d2,d4);this.m23=-this._determinant3x3(a1,a2,a4,c1,c2,c4,d1,d2,d4);this.m33=this._determinant3x3(a1,a2,a4,b1,b2,b4,d1,d2,d4);this.m43=-this._determinant3x3(a1,a2,a4,b1,b2,b4,c1,c2,c4);this.m14=-this._determinant3x3(b1,b2,b3,c1,c2,c3,d1,d2,d3);this.m24=this._determinant3x3(a1,a2,a3,c1,c2,c3,d1,d2,d3);this.m34=-this._determinant3x3(a1,a2,a3,b1,b2,b3,d1,d2,d3);this.m44=this._determinant3x3(a1,a2,a3,b1,b2,b3,c1,c2,c3)}
</script>

This works fine.


```r
x <- sort(rnorm(1000))
y <- rnorm(1000)
z <- rnorm(1000) + atan2(x,y)
plot3d(x, y, z, col=rainbow(1000))
```

<canvas id="testgltextureCanvas" style="display: none;" width="256" height="256">
Your browser does not support the HTML5 canvas element.</canvas>
<!-- ****** points object 7 ****** -->
<script id="testglvshader7" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
gl_PointSize = 3.;
vCol = aCol;
}
</script>
<script id="testglfshader7" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 9 ****** -->
<script id="testglvshader9" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader9" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** text object 10 ****** -->
<script id="testglvshader10" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader10" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** text object 11 ****** -->
<script id="testglvshader11" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader11" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 12 ****** -->
<script id="testglvshader12" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader12" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 13 ****** -->
<script id="testglvshader13" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader13" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 14 ****** -->
<script id="testglvshader14" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader14" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 15 ****** -->
<script id="testglvshader15" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader15" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 16 ****** -->
<script id="testglvshader16" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader16" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 17 ****** -->
<script id="testglvshader17" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader17" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 18 ****** -->
<script id="testglvshader18" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader18" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<script type="text/javascript"> 
function getShader ( gl, id ){
var shaderScript = document.getElementById ( id );
var str = "";
var k = shaderScript.firstChild;
while ( k ){
if ( k.nodeType == 3 ) str += k.textContent;
k = k.nextSibling;
}
var shader;
if ( shaderScript.type == "x-shader/x-fragment" )
shader = gl.createShader ( gl.FRAGMENT_SHADER );
else if ( shaderScript.type == "x-shader/x-vertex" )
shader = gl.createShader(gl.VERTEX_SHADER);
else return null;
gl.shaderSource(shader, str);
gl.compileShader(shader);
if (gl.getShaderParameter(shader, gl.COMPILE_STATUS) == 0)
alert(gl.getShaderInfoLog(shader));
return shader;
}
var min = Math.min;
var max = Math.max;
var sqrt = Math.sqrt;
var sin = Math.sin;
var acos = Math.acos;
var tan = Math.tan;
var SQRT2 = Math.SQRT2;
var PI = Math.PI;
var log = Math.log;
var exp = Math.exp;
function testglwebGLStart() {
var debug = function(msg) {
document.getElementById("testgldebug").innerHTML = msg;
}
debug("");
var canvas = document.getElementById("testglcanvas");
if (!window.WebGLRenderingContext){
debug(" Your browser does not support WebGL. See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var gl;
try {
// Try to grab the standard context. If it fails, fallback to experimental.
gl = canvas.getContext("webgl") 
|| canvas.getContext("experimental-webgl");
}
catch(e) {}
if ( !gl ) {
debug(" Your browser appears to support WebGL, but did not create a WebGL context.  See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var width = 505;  var height = 505;
canvas.width = width;   canvas.height = height;
var prMatrix = new CanvasMatrix4();
var mvMatrix = new CanvasMatrix4();
var normMatrix = new CanvasMatrix4();
var saveMat = new CanvasMatrix4();
saveMat.makeIdentity();
var distance;
var posLoc = 0;
var colLoc = 1;
var zoom = new Object();
var fov = new Object();
var userMatrix = new Object();
var activeSubscene = 1;
zoom[1] = 1;
fov[1] = 30;
userMatrix[1] = new CanvasMatrix4();
userMatrix[1].load([
1, 0, 0, 0,
0, 0.3420201, -0.9396926, 0,
0, 0.9396926, 0.3420201, 0,
0, 0, 0, 1
]);
function getPowerOfTwo(value) {
var pow = 1;
while(pow<value) {
pow *= 2;
}
return pow;
}
function handleLoadedTexture(texture, textureCanvas) {
gl.pixelStorei(gl.UNPACK_FLIP_Y_WEBGL, true);
gl.bindTexture(gl.TEXTURE_2D, texture);
gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA, gl.RGBA, gl.UNSIGNED_BYTE, textureCanvas);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.LINEAR);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.LINEAR_MIPMAP_NEAREST);
gl.generateMipmap(gl.TEXTURE_2D);
gl.bindTexture(gl.TEXTURE_2D, null);
}
function loadImageToTexture(filename, texture) {   
var canvas = document.getElementById("testgltextureCanvas");
var ctx = canvas.getContext("2d");
var image = new Image();
image.onload = function() {
var w = image.width;
var h = image.height;
var canvasX = getPowerOfTwo(w);
var canvasY = getPowerOfTwo(h);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.imageSmoothingEnabled = true;
ctx.drawImage(image, 0, 0, canvasX, canvasY);
handleLoadedTexture(texture, canvas);
drawScene();
}
image.src = filename;
}  	   
function drawTextToCanvas(text, cex) {
var canvasX, canvasY;
var textX, textY;
var textHeight = 20 * cex;
var textColour = "white";
var fontFamily = "Arial";
var backgroundColour = "rgba(0,0,0,0)";
var canvas = document.getElementById("testgltextureCanvas");
var ctx = canvas.getContext("2d");
ctx.font = textHeight+"px "+fontFamily;
canvasX = 1;
var widths = [];
for (var i = 0; i < text.length; i++)  {
widths[i] = ctx.measureText(text[i]).width;
canvasX = (widths[i] > canvasX) ? widths[i] : canvasX;
}	  
canvasX = getPowerOfTwo(canvasX);
var offset = 2*textHeight; // offset to first baseline
var skip = 2*textHeight;   // skip between baselines	  
canvasY = getPowerOfTwo(offset + text.length*skip);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.fillStyle = backgroundColour;
ctx.fillRect(0, 0, ctx.canvas.width, ctx.canvas.height);
ctx.fillStyle = textColour;
ctx.textAlign = "left";
ctx.textBaseline = "alphabetic";
ctx.font = textHeight+"px "+fontFamily;
for(var i = 0; i < text.length; i++) {
textY = i*skip + offset;
ctx.fillText(text[i], 0,  textY);
}
return {canvasX:canvasX, canvasY:canvasY,
widths:widths, textHeight:textHeight,
offset:offset, skip:skip};
}
// ****** points object 7 ******
var prog7  = gl.createProgram();
gl.attachShader(prog7, getShader( gl, "testglvshader7" ));
gl.attachShader(prog7, getShader( gl, "testglfshader7" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog7, 0, "aPos");
gl.bindAttribLocation(prog7, 1, "aCol");
gl.linkProgram(prog7);
var v=new Float32Array([
-2.954436, -0.0004282033, -2.805343, 1, 0, 0, 1,
-2.888402, 0.08949302, -2.560578, 1, 0.007843138, 0, 1,
-2.847907, 0.2464422, -2.139263, 1, 0.01176471, 0, 1,
-2.779133, -0.1011758, -2.474152, 1, 0.01960784, 0, 1,
-2.745245, 0.2552059, -0.4709892, 1, 0.02352941, 0, 1,
-2.697028, -0.3660038, -2.065295, 1, 0.03137255, 0, 1,
-2.540327, 0.9761321, -1.126051, 1, 0.03529412, 0, 1,
-2.517135, -0.002257026, -0.7016437, 1, 0.04313726, 0, 1,
-2.451874, 0.1769772, -1.897665, 1, 0.04705882, 0, 1,
-2.433854, 1.32741, -1.737177, 1, 0.05490196, 0, 1,
-2.419116, -2.104074, -2.834821, 1, 0.05882353, 0, 1,
-2.388374, -0.919829, -3.842544, 1, 0.06666667, 0, 1,
-2.335918, 0.2943082, -2.580581, 1, 0.07058824, 0, 1,
-2.333151, 0.03043236, -1.22793, 1, 0.07843138, 0, 1,
-2.330639, -0.2202873, -1.352709, 1, 0.08235294, 0, 1,
-2.297215, -2.35543, -3.358922, 1, 0.09019608, 0, 1,
-2.24948, -0.6176749, -1.191163, 1, 0.09411765, 0, 1,
-2.234369, -0.9538909, -3.689794, 1, 0.1019608, 0, 1,
-2.231687, -1.915323, -1.836069, 1, 0.1098039, 0, 1,
-2.179326, -0.8341555, -1.97459, 1, 0.1137255, 0, 1,
-2.11402, 0.5909207, -0.01685044, 1, 0.1215686, 0, 1,
-2.07932, -1.207471, -3.24019, 1, 0.1254902, 0, 1,
-2.078189, -0.3835725, -0.644603, 1, 0.1333333, 0, 1,
-2.051878, 1.427743, 0.2632056, 1, 0.1372549, 0, 1,
-2.039258, -0.4318251, -0.6247212, 1, 0.145098, 0, 1,
-2.016655, 0.5446463, -3.013578, 1, 0.1490196, 0, 1,
-2.008723, -0.05933439, -1.831171, 1, 0.1568628, 0, 1,
-1.981597, -0.6971947, -1.768309, 1, 0.1607843, 0, 1,
-1.976847, -0.520963, -1.013989, 1, 0.1686275, 0, 1,
-1.970872, -1.503653, -1.662034, 1, 0.172549, 0, 1,
-1.958876, 1.11068, -0.6085415, 1, 0.1803922, 0, 1,
-1.930206, -1.202346, -1.070726, 1, 0.1843137, 0, 1,
-1.91765, -0.8575681, -0.7813399, 1, 0.1921569, 0, 1,
-1.905742, -0.2973353, -1.810189, 1, 0.1960784, 0, 1,
-1.890544, 0.2753609, -0.998111, 1, 0.2039216, 0, 1,
-1.886283, 1.219636, -2.464064, 1, 0.2117647, 0, 1,
-1.878368, -0.06835715, -1.74633, 1, 0.2156863, 0, 1,
-1.852632, -0.3344655, -1.024787, 1, 0.2235294, 0, 1,
-1.842775, 0.4078884, -0.5463237, 1, 0.227451, 0, 1,
-1.839588, -0.4080608, -1.895198, 1, 0.2352941, 0, 1,
-1.826786, 1.67893, -1.628524, 1, 0.2392157, 0, 1,
-1.81548, -1.913888, -3.801204, 1, 0.2470588, 0, 1,
-1.805648, -0.01306307, -2.131839, 1, 0.2509804, 0, 1,
-1.789034, -0.7060266, -2.18929, 1, 0.2588235, 0, 1,
-1.778569, 0.3384255, -0.9619251, 1, 0.2627451, 0, 1,
-1.754888, 0.351111, -1.509562, 1, 0.2705882, 0, 1,
-1.744711, 1.492477, -1.139448, 1, 0.2745098, 0, 1,
-1.742234, 2.194054, 0.7746187, 1, 0.282353, 0, 1,
-1.735622, -0.2334582, -1.113322, 1, 0.2862745, 0, 1,
-1.724389, 0.5126967, -1.915833, 1, 0.2941177, 0, 1,
-1.716838, 0.8461803, -0.5420027, 1, 0.3019608, 0, 1,
-1.698257, -1.498646, -3.113533, 1, 0.3058824, 0, 1,
-1.694673, 0.8915545, -0.5480619, 1, 0.3137255, 0, 1,
-1.694106, 0.191246, -2.048858, 1, 0.3176471, 0, 1,
-1.680163, -1.595068, -1.16451, 1, 0.3254902, 0, 1,
-1.663948, 0.2685853, -1.042547, 1, 0.3294118, 0, 1,
-1.651067, 0.8268443, -2.029937, 1, 0.3372549, 0, 1,
-1.638038, 0.1597851, -1.111, 1, 0.3411765, 0, 1,
-1.625785, 1.243871, -1.589294, 1, 0.3490196, 0, 1,
-1.623916, 0.4148486, -1.210588, 1, 0.3529412, 0, 1,
-1.619403, 0.1651028, -1.097931, 1, 0.3607843, 0, 1,
-1.614636, -2.787872, -2.293769, 1, 0.3647059, 0, 1,
-1.596222, 1.758899, -2.151453, 1, 0.372549, 0, 1,
-1.567312, -1.012435, -2.742877, 1, 0.3764706, 0, 1,
-1.55636, 0.04281802, -2.27251, 1, 0.3843137, 0, 1,
-1.544097, -0.7868578, -0.8163158, 1, 0.3882353, 0, 1,
-1.543965, -0.8067825, -1.419632, 1, 0.3960784, 0, 1,
-1.535171, 1.248297, -2.503441, 1, 0.4039216, 0, 1,
-1.532144, -1.659001, 0.5029764, 1, 0.4078431, 0, 1,
-1.511931, -0.06784701, -2.418388, 1, 0.4156863, 0, 1,
-1.508834, 0.3606791, -1.171831, 1, 0.4196078, 0, 1,
-1.507033, 0.1567053, -0.5045902, 1, 0.427451, 0, 1,
-1.505701, -0.6585546, -2.440722, 1, 0.4313726, 0, 1,
-1.505011, -1.13669, -2.332977, 1, 0.4392157, 0, 1,
-1.502197, 1.455783, -0.6760153, 1, 0.4431373, 0, 1,
-1.489587, -0.1340588, -3.172987, 1, 0.4509804, 0, 1,
-1.488162, -0.3019831, 0.5436487, 1, 0.454902, 0, 1,
-1.461894, -0.1657735, -0.4434239, 1, 0.4627451, 0, 1,
-1.455747, -0.0254261, -1.446579, 1, 0.4666667, 0, 1,
-1.437999, 0.004914906, -2.945606, 1, 0.4745098, 0, 1,
-1.435213, -1.105773, -1.456023, 1, 0.4784314, 0, 1,
-1.428326, -0.1017177, -1.020387, 1, 0.4862745, 0, 1,
-1.42413, 0.02366018, -0.6936204, 1, 0.4901961, 0, 1,
-1.422193, 0.6124369, -2.304947, 1, 0.4980392, 0, 1,
-1.420811, 0.1099506, -0.7178813, 1, 0.5058824, 0, 1,
-1.420459, -0.8282061, -3.909267, 1, 0.509804, 0, 1,
-1.419646, 1.632049, -2.216174, 1, 0.5176471, 0, 1,
-1.417428, -0.2969933, -0.6481721, 1, 0.5215687, 0, 1,
-1.413364, -0.8588495, -2.094981, 1, 0.5294118, 0, 1,
-1.412694, -0.2766061, -0.3704415, 1, 0.5333334, 0, 1,
-1.402248, -0.7568442, -1.549821, 1, 0.5411765, 0, 1,
-1.393753, -0.2524332, -2.720253, 1, 0.5450981, 0, 1,
-1.391423, 0.2933103, -0.905333, 1, 0.5529412, 0, 1,
-1.385933, -1.8343, -1.372978, 1, 0.5568628, 0, 1,
-1.356343, -0.3897342, -2.292185, 1, 0.5647059, 0, 1,
-1.352358, -0.206, -0.4327197, 1, 0.5686275, 0, 1,
-1.347542, -1.563139, -1.442882, 1, 0.5764706, 0, 1,
-1.329354, 3.087894, -0.507544, 1, 0.5803922, 0, 1,
-1.328679, 2.709873, 0.149929, 1, 0.5882353, 0, 1,
-1.326073, -0.7352204, -2.928317, 1, 0.5921569, 0, 1,
-1.322057, 0.4275535, 0.2271465, 1, 0.6, 0, 1,
-1.31254, 1.059973, 0.5550617, 1, 0.6078432, 0, 1,
-1.300247, -0.1071335, -1.635783, 1, 0.6117647, 0, 1,
-1.29371, -0.9336962, -4.311845, 1, 0.6196079, 0, 1,
-1.292988, 0.6617021, -2.553599, 1, 0.6235294, 0, 1,
-1.292555, 1.160763, -0.6376975, 1, 0.6313726, 0, 1,
-1.277867, -0.9148467, -2.066855, 1, 0.6352941, 0, 1,
-1.263826, -0.7128133, -2.689926, 1, 0.6431373, 0, 1,
-1.244013, -0.1883675, -0.2187014, 1, 0.6470588, 0, 1,
-1.237259, 0.5641453, -0.8627976, 1, 0.654902, 0, 1,
-1.237218, 0.7757816, -0.5645314, 1, 0.6588235, 0, 1,
-1.221661, 0.05482813, -0.2818215, 1, 0.6666667, 0, 1,
-1.221444, -0.03192458, -0.05259807, 1, 0.6705883, 0, 1,
-1.211133, -0.6564776, 0.09615283, 1, 0.6784314, 0, 1,
-1.208818, -0.788106, -2.660301, 1, 0.682353, 0, 1,
-1.207996, -0.7060965, -4.064864, 1, 0.6901961, 0, 1,
-1.206285, -0.5891687, -1.280415, 1, 0.6941177, 0, 1,
-1.193461, 0.2977087, -0.2241126, 1, 0.7019608, 0, 1,
-1.193413, 0.5265754, -1.822548, 1, 0.7098039, 0, 1,
-1.191757, -0.9208466, -2.563843, 1, 0.7137255, 0, 1,
-1.175329, 0.5446782, -0.9709598, 1, 0.7215686, 0, 1,
-1.170641, 1.454306, -1.073494, 1, 0.7254902, 0, 1,
-1.155285, 0.6552271, -1.745053, 1, 0.7333333, 0, 1,
-1.149915, 0.7160164, -1.894451, 1, 0.7372549, 0, 1,
-1.14647, -1.88122, -1.412674, 1, 0.7450981, 0, 1,
-1.13374, 0.3223068, -1.511902, 1, 0.7490196, 0, 1,
-1.133071, 0.1039061, -0.980868, 1, 0.7568628, 0, 1,
-1.121553, -0.02534044, -0.9281905, 1, 0.7607843, 0, 1,
-1.119408, -0.6038789, -3.38703, 1, 0.7686275, 0, 1,
-1.118968, -0.6317071, -0.8077333, 1, 0.772549, 0, 1,
-1.116665, 0.1073677, -2.524982, 1, 0.7803922, 0, 1,
-1.114992, -0.9378258, -3.262092, 1, 0.7843137, 0, 1,
-1.109399, -0.08747125, -0.739309, 1, 0.7921569, 0, 1,
-1.095435, 0.2877554, -0.6221478, 1, 0.7960784, 0, 1,
-1.095101, -0.3731741, -1.117838, 1, 0.8039216, 0, 1,
-1.087654, -1.301194, -3.925902, 1, 0.8117647, 0, 1,
-1.083354, -0.1498113, 0.1559468, 1, 0.8156863, 0, 1,
-1.071722, 1.446757, -0.8128198, 1, 0.8235294, 0, 1,
-1.071012, 0.2574851, -0.1809202, 1, 0.827451, 0, 1,
-1.068123, 2.041356, -1.288156, 1, 0.8352941, 0, 1,
-1.063216, -0.5797533, -2.322428, 1, 0.8392157, 0, 1,
-1.060268, 1.355846, -0.1058289, 1, 0.8470588, 0, 1,
-1.056456, 0.5541455, -1.227318, 1, 0.8509804, 0, 1,
-1.05591, -0.5326303, -2.485954, 1, 0.8588235, 0, 1,
-1.051105, -0.007416845, 1.887274, 1, 0.8627451, 0, 1,
-1.048497, 0.386721, -0.07165417, 1, 0.8705882, 0, 1,
-1.046798, 0.869837, -1.411436, 1, 0.8745098, 0, 1,
-1.039402, 0.37257, -1.456559, 1, 0.8823529, 0, 1,
-1.038797, 0.6744886, -3.2869, 1, 0.8862745, 0, 1,
-1.033755, 0.5360281, -1.817812, 1, 0.8941177, 0, 1,
-1.031713, 1.633118, 0.173795, 1, 0.8980392, 0, 1,
-1.031089, 0.671369, -2.063402, 1, 0.9058824, 0, 1,
-1.027819, -0.3609081, -1.309328, 1, 0.9137255, 0, 1,
-1.02725, -0.7951599, -2.361959, 1, 0.9176471, 0, 1,
-1.0252, -0.02993997, -2.022235, 1, 0.9254902, 0, 1,
-1.025178, 0.5208281, 0.3418764, 1, 0.9294118, 0, 1,
-1.024207, 0.8086846, -0.9911664, 1, 0.9372549, 0, 1,
-1.023294, -0.1934545, -2.348783, 1, 0.9411765, 0, 1,
-1.021099, -0.410505, -0.9125263, 1, 0.9490196, 0, 1,
-1.019454, -0.756311, 0.1715034, 1, 0.9529412, 0, 1,
-1.01896, -1.065603, -2.446462, 1, 0.9607843, 0, 1,
-1.01859, 0.1200207, -0.9590106, 1, 0.9647059, 0, 1,
-1.014819, -0.5419875, -2.815762, 1, 0.972549, 0, 1,
-0.9916009, -1.019441, -1.586316, 1, 0.9764706, 0, 1,
-0.9864916, 0.5386323, 0.512902, 1, 0.9843137, 0, 1,
-0.9821717, 0.07319625, -1.223137, 1, 0.9882353, 0, 1,
-0.9796571, 0.6532137, -1.469432, 1, 0.9960784, 0, 1,
-0.9792309, 0.873473, -2.471076, 0.9960784, 1, 0, 1,
-0.9784496, -0.5053516, -1.601347, 0.9921569, 1, 0, 1,
-0.978281, 0.0486768, -2.563736, 0.9843137, 1, 0, 1,
-0.9775059, -0.8773784, -2.162334, 0.9803922, 1, 0, 1,
-0.9770378, -1.099078, -2.39058, 0.972549, 1, 0, 1,
-0.9762989, 1.078012, -1.882676, 0.9686275, 1, 0, 1,
-0.9762266, 1.457177, 1.057848, 0.9607843, 1, 0, 1,
-0.9732177, 0.5796914, -1.735771, 0.9568627, 1, 0, 1,
-0.9620651, -1.376093, -1.526377, 0.9490196, 1, 0, 1,
-0.9597109, -0.9788865, -1.017625, 0.945098, 1, 0, 1,
-0.9545439, 0.8606292, -1.167619, 0.9372549, 1, 0, 1,
-0.9544606, 0.5632582, 0.5030681, 0.9333333, 1, 0, 1,
-0.950175, 1.078485, -0.3589308, 0.9254902, 1, 0, 1,
-0.9472904, -0.2400513, -1.208407, 0.9215686, 1, 0, 1,
-0.9460756, 0.03919538, -1.735279, 0.9137255, 1, 0, 1,
-0.9419899, 1.199313, 0.04467687, 0.9098039, 1, 0, 1,
-0.9405343, -0.1919743, -1.671373, 0.9019608, 1, 0, 1,
-0.9360209, 0.9978244, -1.136262, 0.8941177, 1, 0, 1,
-0.9350515, 1.322402, -0.4670752, 0.8901961, 1, 0, 1,
-0.9291438, -0.02632858, -1.491227, 0.8823529, 1, 0, 1,
-0.9266307, -0.9997475, -2.286394, 0.8784314, 1, 0, 1,
-0.922834, 0.1460963, -5.028308, 0.8705882, 1, 0, 1,
-0.9220963, -0.7271724, -2.048777, 0.8666667, 1, 0, 1,
-0.9174816, 0.8339638, -0.08509611, 0.8588235, 1, 0, 1,
-0.9115509, 0.2278784, -1.023628, 0.854902, 1, 0, 1,
-0.9110163, 0.5608565, 0.6923635, 0.8470588, 1, 0, 1,
-0.9107342, 0.08684466, -0.08082139, 0.8431373, 1, 0, 1,
-0.9095618, 0.5866756, -0.9585506, 0.8352941, 1, 0, 1,
-0.9081715, -1.302974, -2.233263, 0.8313726, 1, 0, 1,
-0.9023463, 1.549734, -1.567756, 0.8235294, 1, 0, 1,
-0.9020927, 0.02617999, -2.840817, 0.8196079, 1, 0, 1,
-0.9004192, -0.1660695, -1.492292, 0.8117647, 1, 0, 1,
-0.8918652, -0.6403994, -2.942405, 0.8078431, 1, 0, 1,
-0.891774, -0.8425478, -1.365407, 0.8, 1, 0, 1,
-0.8894246, -0.2015222, -0.8682753, 0.7921569, 1, 0, 1,
-0.8839744, 0.6451004, -1.614442, 0.7882353, 1, 0, 1,
-0.8829306, -0.07547921, -2.90275, 0.7803922, 1, 0, 1,
-0.8818403, 0.9395155, -1.047707, 0.7764706, 1, 0, 1,
-0.8809562, 0.4185755, 0.4540887, 0.7686275, 1, 0, 1,
-0.8762123, 0.7067903, 0.2807435, 0.7647059, 1, 0, 1,
-0.8722027, 0.4830545, -2.606057, 0.7568628, 1, 0, 1,
-0.8718731, 1.665364, -0.8395404, 0.7529412, 1, 0, 1,
-0.8710276, 0.3908969, -0.4725406, 0.7450981, 1, 0, 1,
-0.870518, -1.453932, -1.717862, 0.7411765, 1, 0, 1,
-0.8701052, -1.758584, -2.026898, 0.7333333, 1, 0, 1,
-0.8677592, 1.603433, -0.4306397, 0.7294118, 1, 0, 1,
-0.8611086, 0.2361422, -0.44089, 0.7215686, 1, 0, 1,
-0.8543913, -0.4101356, -1.316652, 0.7176471, 1, 0, 1,
-0.8517166, 0.1124315, -2.504636, 0.7098039, 1, 0, 1,
-0.8489568, 1.871087, -1.836338, 0.7058824, 1, 0, 1,
-0.8410307, 0.04094348, -0.4715888, 0.6980392, 1, 0, 1,
-0.8366165, 0.2696641, -1.111744, 0.6901961, 1, 0, 1,
-0.8362901, -1.357668, -3.681371, 0.6862745, 1, 0, 1,
-0.8354386, -1.107043, -1.904442, 0.6784314, 1, 0, 1,
-0.8338392, -0.6996481, -2.127329, 0.6745098, 1, 0, 1,
-0.8323022, -0.6897166, -3.000282, 0.6666667, 1, 0, 1,
-0.8282588, 0.5837203, -0.7671206, 0.6627451, 1, 0, 1,
-0.8255613, 0.2955538, -0.258628, 0.654902, 1, 0, 1,
-0.8227311, 0.1100072, -2.26777, 0.6509804, 1, 0, 1,
-0.8184244, -1.995017, -2.66224, 0.6431373, 1, 0, 1,
-0.8166867, -1.947735, -0.8717908, 0.6392157, 1, 0, 1,
-0.8091667, 0.4453272, -0.6259624, 0.6313726, 1, 0, 1,
-0.8068457, -0.9949341, -3.492157, 0.627451, 1, 0, 1,
-0.8039755, 0.01820218, -1.544786, 0.6196079, 1, 0, 1,
-0.8037371, 1.404244, -0.8150907, 0.6156863, 1, 0, 1,
-0.7953888, -0.5961767, -1.362009, 0.6078432, 1, 0, 1,
-0.7938322, 0.8462722, -0.9997029, 0.6039216, 1, 0, 1,
-0.792697, -0.6677323, -2.22946, 0.5960785, 1, 0, 1,
-0.7911023, -1.00692, -1.598955, 0.5882353, 1, 0, 1,
-0.7909428, -0.7357565, -4.302469, 0.5843138, 1, 0, 1,
-0.7880648, -1.019854, -4.523201, 0.5764706, 1, 0, 1,
-0.7831104, 0.0867572, -2.739665, 0.572549, 1, 0, 1,
-0.7821746, -0.04805957, -1.005955, 0.5647059, 1, 0, 1,
-0.7789064, -0.5157477, -1.853154, 0.5607843, 1, 0, 1,
-0.7714965, 0.8361703, -0.7867883, 0.5529412, 1, 0, 1,
-0.7714217, 0.02934436, -2.093125, 0.5490196, 1, 0, 1,
-0.7609954, -0.3329156, -2.376645, 0.5411765, 1, 0, 1,
-0.7603174, 1.550868, 0.1509973, 0.5372549, 1, 0, 1,
-0.7585684, 0.6472705, -0.1788414, 0.5294118, 1, 0, 1,
-0.7583793, 0.267053, -1.22772, 0.5254902, 1, 0, 1,
-0.7538327, -0.2900493, -1.581076, 0.5176471, 1, 0, 1,
-0.7492593, -0.1671917, -2.670465, 0.5137255, 1, 0, 1,
-0.7484055, -0.06506595, -2.646685, 0.5058824, 1, 0, 1,
-0.7477165, -1.000096, -2.141359, 0.5019608, 1, 0, 1,
-0.7444214, 0.753601, -1.222158, 0.4941176, 1, 0, 1,
-0.7338669, -0.03336002, -1.650993, 0.4862745, 1, 0, 1,
-0.7330559, 0.09979865, -0.9611558, 0.4823529, 1, 0, 1,
-0.7317678, 0.3370569, -0.7860737, 0.4745098, 1, 0, 1,
-0.7282746, -0.1256735, -2.702349, 0.4705882, 1, 0, 1,
-0.7276034, 0.3596258, 0.2556611, 0.4627451, 1, 0, 1,
-0.7270202, -0.906444, -3.772232, 0.4588235, 1, 0, 1,
-0.724305, 0.4028527, -1.325253, 0.4509804, 1, 0, 1,
-0.7223647, 0.3898231, -2.741153, 0.4470588, 1, 0, 1,
-0.7200074, -0.3209717, -4.295819, 0.4392157, 1, 0, 1,
-0.7077624, -0.5317066, -1.703048, 0.4352941, 1, 0, 1,
-0.7063131, 1.460196, -0.6614068, 0.427451, 1, 0, 1,
-0.7044975, -0.9916723, -2.712788, 0.4235294, 1, 0, 1,
-0.7001806, -1.535157, -1.264193, 0.4156863, 1, 0, 1,
-0.6997786, -1.007503, -4.179, 0.4117647, 1, 0, 1,
-0.6992369, 1.309153, -0.2132025, 0.4039216, 1, 0, 1,
-0.6928746, 0.1981816, 0.1342241, 0.3960784, 1, 0, 1,
-0.6902797, -1.104764, -3.894557, 0.3921569, 1, 0, 1,
-0.6887197, 0.7498115, -0.8238127, 0.3843137, 1, 0, 1,
-0.6681048, -0.6191602, -2.370933, 0.3803922, 1, 0, 1,
-0.6673665, -0.776212, -3.004337, 0.372549, 1, 0, 1,
-0.66523, 1.605028, -0.09265519, 0.3686275, 1, 0, 1,
-0.6616104, -1.730662, -3.049757, 0.3607843, 1, 0, 1,
-0.6525605, -0.08130442, -1.422959, 0.3568628, 1, 0, 1,
-0.6506239, 0.649994, 1.364897, 0.3490196, 1, 0, 1,
-0.6500182, -1.224016, -2.62311, 0.345098, 1, 0, 1,
-0.6487842, -0.5015163, -0.6778481, 0.3372549, 1, 0, 1,
-0.6448206, -0.3033221, -1.473248, 0.3333333, 1, 0, 1,
-0.6386043, 0.3400383, -0.0005699027, 0.3254902, 1, 0, 1,
-0.6376781, -2.103814, -4.031728, 0.3215686, 1, 0, 1,
-0.6376682, -0.997583, -0.9389121, 0.3137255, 1, 0, 1,
-0.6367732, 0.2020625, -5.005283, 0.3098039, 1, 0, 1,
-0.6259527, 1.203045, -2.307857, 0.3019608, 1, 0, 1,
-0.6249039, -0.1533628, -2.559701, 0.2941177, 1, 0, 1,
-0.6220587, 1.951571, 0.4324178, 0.2901961, 1, 0, 1,
-0.6193312, -0.5901536, -1.886562, 0.282353, 1, 0, 1,
-0.6108049, 1.158386, -2.257346, 0.2784314, 1, 0, 1,
-0.6103196, 1.973762, -0.2429007, 0.2705882, 1, 0, 1,
-0.6097078, 1.147624, -0.9536983, 0.2666667, 1, 0, 1,
-0.6044043, -1.697171, -2.657233, 0.2588235, 1, 0, 1,
-0.601757, 0.1353907, -0.8148699, 0.254902, 1, 0, 1,
-0.5958889, -0.6093357, -3.10519, 0.2470588, 1, 0, 1,
-0.5958598, -1.888972, -3.378795, 0.2431373, 1, 0, 1,
-0.589929, 0.3848067, -2.331888, 0.2352941, 1, 0, 1,
-0.5897183, -0.4550416, -3.55945, 0.2313726, 1, 0, 1,
-0.5883429, -0.2768188, -3.019514, 0.2235294, 1, 0, 1,
-0.584731, 0.423892, -0.870274, 0.2196078, 1, 0, 1,
-0.5835024, -0.5262389, -1.760539, 0.2117647, 1, 0, 1,
-0.5720479, -1.636164, -1.288442, 0.2078431, 1, 0, 1,
-0.5699967, 0.8814936, 1.264238, 0.2, 1, 0, 1,
-0.5668705, -0.8260464, -3.624542, 0.1921569, 1, 0, 1,
-0.5655366, 1.624105, 1.672698, 0.1882353, 1, 0, 1,
-0.5653652, -0.3165707, -3.356421, 0.1803922, 1, 0, 1,
-0.5635251, 0.0632803, -2.367009, 0.1764706, 1, 0, 1,
-0.5607514, -0.5455698, -0.9288772, 0.1686275, 1, 0, 1,
-0.5561182, -0.5478686, -0.298063, 0.1647059, 1, 0, 1,
-0.5531057, 0.4567406, -1.629132, 0.1568628, 1, 0, 1,
-0.5524208, -0.1543012, -3.135896, 0.1529412, 1, 0, 1,
-0.550173, -0.4420013, -0.5376673, 0.145098, 1, 0, 1,
-0.5495977, 0.2436437, -2.334734, 0.1411765, 1, 0, 1,
-0.546065, -0.4957839, -4.634632, 0.1333333, 1, 0, 1,
-0.5409336, 0.3006736, -1.777207, 0.1294118, 1, 0, 1,
-0.5409057, 0.4900481, -0.4491931, 0.1215686, 1, 0, 1,
-0.5373831, 1.373223, -0.9881787, 0.1176471, 1, 0, 1,
-0.535646, 0.2974081, -0.3195388, 0.1098039, 1, 0, 1,
-0.535355, 0.5868043, -0.701805, 0.1058824, 1, 0, 1,
-0.5275333, -1.115827, -2.193864, 0.09803922, 1, 0, 1,
-0.5271406, 0.9593433, -1.45923, 0.09019608, 1, 0, 1,
-0.5260811, -0.2425013, -3.478364, 0.08627451, 1, 0, 1,
-0.5205557, 0.5323526, -0.1753128, 0.07843138, 1, 0, 1,
-0.5166997, -1.967591, -1.266733, 0.07450981, 1, 0, 1,
-0.5161062, 1.430879, -2.556782, 0.06666667, 1, 0, 1,
-0.5152826, -1.374379, -5.112424, 0.0627451, 1, 0, 1,
-0.5145271, -0.8426301, -3.522021, 0.05490196, 1, 0, 1,
-0.5086108, -0.02863861, -1.924116, 0.05098039, 1, 0, 1,
-0.5057107, -1.421402, -0.154707, 0.04313726, 1, 0, 1,
-0.5008683, -1.04647, -3.381037, 0.03921569, 1, 0, 1,
-0.5007831, -0.4743221, -3.748011, 0.03137255, 1, 0, 1,
-0.4986066, -0.9385875, -3.441054, 0.02745098, 1, 0, 1,
-0.492279, -0.5405823, -0.9726815, 0.01960784, 1, 0, 1,
-0.4903114, -1.701727, -2.37969, 0.01568628, 1, 0, 1,
-0.4875695, -0.3783033, -3.35864, 0.007843138, 1, 0, 1,
-0.487339, -0.03449388, -1.970933, 0.003921569, 1, 0, 1,
-0.4871188, 0.3431412, 2.102756, 0, 1, 0.003921569, 1,
-0.4810894, -1.62424, -1.001639, 0, 1, 0.01176471, 1,
-0.4785497, -0.218345, -1.192347, 0, 1, 0.01568628, 1,
-0.473204, -0.9541326, -1.25259, 0, 1, 0.02352941, 1,
-0.4686489, 1.836803, 0.7957451, 0, 1, 0.02745098, 1,
-0.4672233, -1.158817, -3.820574, 0, 1, 0.03529412, 1,
-0.4620373, 0.4591213, -0.2623199, 0, 1, 0.03921569, 1,
-0.4556737, 0.4324318, -1.024984, 0, 1, 0.04705882, 1,
-0.4537405, -0.8614994, -2.469305, 0, 1, 0.05098039, 1,
-0.4490358, -0.6580151, -1.756212, 0, 1, 0.05882353, 1,
-0.4474962, -1.916033, -4.927588, 0, 1, 0.0627451, 1,
-0.4417059, -0.5507569, -2.802718, 0, 1, 0.07058824, 1,
-0.441333, -0.1743921, -3.898256, 0, 1, 0.07450981, 1,
-0.432301, 0.3577229, -1.646885, 0, 1, 0.08235294, 1,
-0.4302144, 1.51655, -1.843426, 0, 1, 0.08627451, 1,
-0.4274645, -1.036676, -2.793314, 0, 1, 0.09411765, 1,
-0.4250534, 1.853909, -0.8696028, 0, 1, 0.1019608, 1,
-0.4246303, -0.4461354, -2.004194, 0, 1, 0.1058824, 1,
-0.4198492, -0.891884, -3.795111, 0, 1, 0.1137255, 1,
-0.4197981, 0.5831024, 0.2168527, 0, 1, 0.1176471, 1,
-0.4123622, -0.3535545, -1.393113, 0, 1, 0.1254902, 1,
-0.4113722, 0.004771852, -0.5898081, 0, 1, 0.1294118, 1,
-0.4045652, 0.8168998, -2.0322, 0, 1, 0.1372549, 1,
-0.3992382, -1.611124, -2.528174, 0, 1, 0.1411765, 1,
-0.398747, -1.679128, -2.748167, 0, 1, 0.1490196, 1,
-0.3984049, 0.6645646, -0.5295889, 0, 1, 0.1529412, 1,
-0.3964191, 0.4566877, 0.9541592, 0, 1, 0.1607843, 1,
-0.38714, 2.061371, -0.6505159, 0, 1, 0.1647059, 1,
-0.382795, -0.02554736, -0.845661, 0, 1, 0.172549, 1,
-0.3804332, 0.0607089, -2.43141, 0, 1, 0.1764706, 1,
-0.3755544, -1.474165, -2.575669, 0, 1, 0.1843137, 1,
-0.3723135, 1.255681, -1.098376, 0, 1, 0.1882353, 1,
-0.3698074, -0.2085869, -1.439694, 0, 1, 0.1960784, 1,
-0.3640156, 0.1486358, 0.4942092, 0, 1, 0.2039216, 1,
-0.3585218, -0.3110036, -1.370146, 0, 1, 0.2078431, 1,
-0.3581889, -0.6300027, -4.185479, 0, 1, 0.2156863, 1,
-0.3558628, -0.9980713, -3.198271, 0, 1, 0.2196078, 1,
-0.3549503, 1.167227, 1.015017, 0, 1, 0.227451, 1,
-0.3531083, -0.3948238, -3.937351, 0, 1, 0.2313726, 1,
-0.3508758, 0.03152061, -0.1274854, 0, 1, 0.2392157, 1,
-0.3501616, -1.364486, -2.58373, 0, 1, 0.2431373, 1,
-0.3463552, -0.7751867, -3.980093, 0, 1, 0.2509804, 1,
-0.3454508, 0.04186274, -0.9351478, 0, 1, 0.254902, 1,
-0.3431542, 0.5616747, 0.259472, 0, 1, 0.2627451, 1,
-0.3428148, -0.5725373, -2.150245, 0, 1, 0.2666667, 1,
-0.341883, 0.3359711, 0.6533999, 0, 1, 0.2745098, 1,
-0.3379891, -0.3976912, -3.39059, 0, 1, 0.2784314, 1,
-0.3357451, 0.2643549, -1.281134, 0, 1, 0.2862745, 1,
-0.3301341, -0.1203538, -1.953538, 0, 1, 0.2901961, 1,
-0.3298969, -0.4382138, -3.583148, 0, 1, 0.2980392, 1,
-0.3289274, 0.7372855, -0.3479107, 0, 1, 0.3058824, 1,
-0.3266593, 0.2900338, -2.48653, 0, 1, 0.3098039, 1,
-0.3214735, 2.007079, -0.3537866, 0, 1, 0.3176471, 1,
-0.3202554, 0.2259008, -1.08072, 0, 1, 0.3215686, 1,
-0.3140308, -0.1170656, 0.3828077, 0, 1, 0.3294118, 1,
-0.3103436, -0.2747911, -0.1738161, 0, 1, 0.3333333, 1,
-0.3099553, 0.8252569, -2.095119, 0, 1, 0.3411765, 1,
-0.3076926, -0.1693197, -1.103726, 0, 1, 0.345098, 1,
-0.3071528, 0.0003071222, -1.885954, 0, 1, 0.3529412, 1,
-0.3068888, 0.692026, 0.7889105, 0, 1, 0.3568628, 1,
-0.3054166, 0.3058737, 0.7749338, 0, 1, 0.3647059, 1,
-0.3048812, -0.8676756, -3.392553, 0, 1, 0.3686275, 1,
-0.3030471, -1.156054, -4.18943, 0, 1, 0.3764706, 1,
-0.3011491, -0.6610802, -2.39736, 0, 1, 0.3803922, 1,
-0.3009932, 1.923031, -0.4490888, 0, 1, 0.3882353, 1,
-0.3006184, 1.494556, -0.132448, 0, 1, 0.3921569, 1,
-0.29786, 0.4208058, 0.1077723, 0, 1, 0.4, 1,
-0.2959078, 0.04413345, -2.138839, 0, 1, 0.4078431, 1,
-0.2945881, -0.77687, -2.277415, 0, 1, 0.4117647, 1,
-0.2916945, -1.000332, -3.504093, 0, 1, 0.4196078, 1,
-0.2902681, 0.1148255, 1.499418, 0, 1, 0.4235294, 1,
-0.2846423, -0.3126249, -2.05663, 0, 1, 0.4313726, 1,
-0.2826686, 1.268843, -1.461679, 0, 1, 0.4352941, 1,
-0.2797932, -0.3190759, 0.1364664, 0, 1, 0.4431373, 1,
-0.2783124, 0.5599878, 0.8402448, 0, 1, 0.4470588, 1,
-0.2717016, 0.5219149, 1.28319, 0, 1, 0.454902, 1,
-0.2662468, -0.5388423, -2.480222, 0, 1, 0.4588235, 1,
-0.2609509, -0.7230482, -2.009133, 0, 1, 0.4666667, 1,
-0.2537202, -0.863892, -3.16412, 0, 1, 0.4705882, 1,
-0.2524547, -0.8738894, -2.02816, 0, 1, 0.4784314, 1,
-0.2480875, 0.7473025, -0.5495124, 0, 1, 0.4823529, 1,
-0.2480693, 0.2975135, 0.8828595, 0, 1, 0.4901961, 1,
-0.2429285, -0.7202272, -2.494834, 0, 1, 0.4941176, 1,
-0.2416545, 0.1989826, -0.9247912, 0, 1, 0.5019608, 1,
-0.2358758, -0.5594336, -4.825149, 0, 1, 0.509804, 1,
-0.2317389, 0.3791943, -0.3915974, 0, 1, 0.5137255, 1,
-0.2284218, 0.6971687, -1.584878, 0, 1, 0.5215687, 1,
-0.2265292, 1.369369, 0.81053, 0, 1, 0.5254902, 1,
-0.2254406, 0.2436703, -0.414796, 0, 1, 0.5333334, 1,
-0.2201497, 1.025604, -0.5528843, 0, 1, 0.5372549, 1,
-0.2127937, 0.03042762, -0.6307376, 0, 1, 0.5450981, 1,
-0.2123031, 0.5305831, 0.4208643, 0, 1, 0.5490196, 1,
-0.2104394, -1.433427, -3.801461, 0, 1, 0.5568628, 1,
-0.2049749, -1.324705, -2.685532, 0, 1, 0.5607843, 1,
-0.2035913, -0.850367, -1.200928, 0, 1, 0.5686275, 1,
-0.1991751, 1.379245, 0.4939852, 0, 1, 0.572549, 1,
-0.1988522, -1.216707, -2.452299, 0, 1, 0.5803922, 1,
-0.1878192, 1.000423, -1.028739, 0, 1, 0.5843138, 1,
-0.1873082, -2.156125, -3.381056, 0, 1, 0.5921569, 1,
-0.1866296, -0.1948994, -4.997386, 0, 1, 0.5960785, 1,
-0.1856732, 0.0635325, -1.390569, 0, 1, 0.6039216, 1,
-0.1847698, 0.04652321, -1.981905, 0, 1, 0.6117647, 1,
-0.184633, 0.1490813, -0.1676651, 0, 1, 0.6156863, 1,
-0.1824803, -0.1004779, -4.451664, 0, 1, 0.6235294, 1,
-0.1823377, -0.03744356, -1.810058, 0, 1, 0.627451, 1,
-0.1805641, -0.03928379, 0.4645545, 0, 1, 0.6352941, 1,
-0.1789795, 0.7000994, 1.957332, 0, 1, 0.6392157, 1,
-0.1743817, -0.06359493, -2.716858, 0, 1, 0.6470588, 1,
-0.1671935, 1.280796, -0.285841, 0, 1, 0.6509804, 1,
-0.1626526, 0.0225327, -1.352729, 0, 1, 0.6588235, 1,
-0.1625136, 0.3380255, -0.03589931, 0, 1, 0.6627451, 1,
-0.1623622, 1.417452, -1.677173, 0, 1, 0.6705883, 1,
-0.1588702, -0.512937, -3.461457, 0, 1, 0.6745098, 1,
-0.1561855, -0.3521414, -3.785819, 0, 1, 0.682353, 1,
-0.1497498, -0.6035352, -4.28489, 0, 1, 0.6862745, 1,
-0.1473468, 0.05670827, -0.7603136, 0, 1, 0.6941177, 1,
-0.1447731, 0.9376073, -1.101284, 0, 1, 0.7019608, 1,
-0.1426941, -1.297789, -1.855827, 0, 1, 0.7058824, 1,
-0.1425982, 1.105363, 1.301612, 0, 1, 0.7137255, 1,
-0.1425449, 1.207503, 1.268152, 0, 1, 0.7176471, 1,
-0.1345096, -0.4840202, -2.448543, 0, 1, 0.7254902, 1,
-0.1297488, -0.1563145, -1.332127, 0, 1, 0.7294118, 1,
-0.1252223, 0.08921351, -0.06322148, 0, 1, 0.7372549, 1,
-0.1202639, -1.179701, -3.380226, 0, 1, 0.7411765, 1,
-0.1183217, -0.9049165, -2.899918, 0, 1, 0.7490196, 1,
-0.1164475, -0.9989805, -3.727048, 0, 1, 0.7529412, 1,
-0.1158047, -0.2914386, -3.71662, 0, 1, 0.7607843, 1,
-0.1155665, -2.029769, -2.784425, 0, 1, 0.7647059, 1,
-0.1150222, 1.362043, 0.7723134, 0, 1, 0.772549, 1,
-0.1133846, -2.716795, -2.755661, 0, 1, 0.7764706, 1,
-0.1109787, 0.2192718, 0.1739892, 0, 1, 0.7843137, 1,
-0.1089594, -1.197111, -2.688119, 0, 1, 0.7882353, 1,
-0.1040352, 0.1048021, -0.8965027, 0, 1, 0.7960784, 1,
-0.1011998, 0.301465, 0.02726982, 0, 1, 0.8039216, 1,
-0.09740616, 0.00778312, -2.782326, 0, 1, 0.8078431, 1,
-0.09696423, -0.2965384, -3.765331, 0, 1, 0.8156863, 1,
-0.09380206, 1.987211, 0.2561643, 0, 1, 0.8196079, 1,
-0.09256562, 0.5715793, 0.3240406, 0, 1, 0.827451, 1,
-0.08962769, -0.4294491, -3.785091, 0, 1, 0.8313726, 1,
-0.08637189, 0.006000425, -1.335472, 0, 1, 0.8392157, 1,
-0.08532495, -1.100551, -3.020727, 0, 1, 0.8431373, 1,
-0.07851321, 0.5546101, -0.7519415, 0, 1, 0.8509804, 1,
-0.07618167, -0.7871984, -3.697165, 0, 1, 0.854902, 1,
-0.07489837, 0.1651321, 0.05960046, 0, 1, 0.8627451, 1,
-0.07454275, -2.534147, -3.593657, 0, 1, 0.8666667, 1,
-0.07369935, 0.4599091, 0.05074826, 0, 1, 0.8745098, 1,
-0.07277598, 0.8719499, 0.4566352, 0, 1, 0.8784314, 1,
-0.07204004, -0.2238346, -3.060729, 0, 1, 0.8862745, 1,
-0.07162063, -2.341748, -4.05337, 0, 1, 0.8901961, 1,
-0.06967711, -0.9167633, -2.492899, 0, 1, 0.8980392, 1,
-0.06734468, -3.173717, -4.423866, 0, 1, 0.9058824, 1,
-0.06628031, -0.6526236, -2.770748, 0, 1, 0.9098039, 1,
-0.06535093, 0.354044, 0.646895, 0, 1, 0.9176471, 1,
-0.06442336, 0.2437162, 1.492681, 0, 1, 0.9215686, 1,
-0.06422044, -0.04700202, -1.366929, 0, 1, 0.9294118, 1,
-0.06416332, -0.2822026, -4.091273, 0, 1, 0.9333333, 1,
-0.05992405, 0.4803701, -0.7487023, 0, 1, 0.9411765, 1,
-0.05784108, 0.5713955, 0.4484588, 0, 1, 0.945098, 1,
-0.05755411, -2.016719, -2.298939, 0, 1, 0.9529412, 1,
-0.05693835, 0.3553167, -2.079201, 0, 1, 0.9568627, 1,
-0.05644181, -0.00247721, -1.405662, 0, 1, 0.9647059, 1,
-0.05487599, 0.1005098, 0.1604036, 0, 1, 0.9686275, 1,
-0.05030911, -0.1760669, -3.940304, 0, 1, 0.9764706, 1,
-0.04815726, -0.5251597, -4.045207, 0, 1, 0.9803922, 1,
-0.04577213, 0.4655615, -0.2981893, 0, 1, 0.9882353, 1,
-0.04432838, -0.8418821, -2.575357, 0, 1, 0.9921569, 1,
-0.04236583, 3.095293, 1.01831, 0, 1, 1, 1,
-0.03967884, 0.3299894, -0.1895095, 0, 0.9921569, 1, 1,
-0.03281573, -1.025545, -3.762385, 0, 0.9882353, 1, 1,
-0.03193549, -1.142635, -3.345851, 0, 0.9803922, 1, 1,
-0.0306707, 0.05589445, -0.9646652, 0, 0.9764706, 1, 1,
-0.02987366, 1.831494, 1.41538, 0, 0.9686275, 1, 1,
-0.02663973, -0.5752852, -3.459409, 0, 0.9647059, 1, 1,
-0.02543224, 1.221695, 1.651551, 0, 0.9568627, 1, 1,
-0.02424213, -0.2373036, -3.828743, 0, 0.9529412, 1, 1,
-0.02256404, -0.4074924, -2.391159, 0, 0.945098, 1, 1,
-0.02186519, 0.3517036, -0.5060764, 0, 0.9411765, 1, 1,
-0.01857075, 1.290442, 0.7348064, 0, 0.9333333, 1, 1,
-0.007416894, 1.143819, 0.3148111, 0, 0.9294118, 1, 1,
-0.005859212, 0.3368579, 1.188612, 0, 0.9215686, 1, 1,
-0.001341892, 1.36585, -1.444405, 0, 0.9176471, 1, 1,
0.00205204, -0.4719281, 2.105442, 0, 0.9098039, 1, 1,
0.004639847, -1.317389, 2.061839, 0, 0.9058824, 1, 1,
0.006660432, 1.575908, -0.5726427, 0, 0.8980392, 1, 1,
0.006700174, -0.4799178, 4.433546, 0, 0.8901961, 1, 1,
0.01266939, -0.1237444, 3.883226, 0, 0.8862745, 1, 1,
0.0178023, 0.1716326, 1.488366, 0, 0.8784314, 1, 1,
0.02050293, 0.9393016, 2.136639, 0, 0.8745098, 1, 1,
0.02077209, -0.3258878, 1.494261, 0, 0.8666667, 1, 1,
0.02080934, -2.871778, 4.078086, 0, 0.8627451, 1, 1,
0.02411034, -0.05117341, 3.308733, 0, 0.854902, 1, 1,
0.0251714, 0.8283056, -1.109645, 0, 0.8509804, 1, 1,
0.02669309, 0.3984692, 0.9817815, 0, 0.8431373, 1, 1,
0.02872179, 1.098604, 0.9607147, 0, 0.8392157, 1, 1,
0.03057033, -0.060646, 2.94579, 0, 0.8313726, 1, 1,
0.03091988, -0.2491863, 2.842023, 0, 0.827451, 1, 1,
0.03183727, 0.626074, 1.077627, 0, 0.8196079, 1, 1,
0.03293661, -0.1659041, 4.708149, 0, 0.8156863, 1, 1,
0.03349103, 0.5769239, -0.4026388, 0, 0.8078431, 1, 1,
0.03599122, -1.269214, 3.057296, 0, 0.8039216, 1, 1,
0.03694069, 0.9067581, 1.118716, 0, 0.7960784, 1, 1,
0.03726679, 0.1350047, -0.3884856, 0, 0.7882353, 1, 1,
0.03771929, -0.3283089, 2.189935, 0, 0.7843137, 1, 1,
0.03842935, 0.4139953, -1.030429, 0, 0.7764706, 1, 1,
0.03941132, 0.6977463, -1.863268, 0, 0.772549, 1, 1,
0.04133715, -1.448835, 2.170653, 0, 0.7647059, 1, 1,
0.04470262, -0.3859694, 2.826786, 0, 0.7607843, 1, 1,
0.04527328, -0.479347, 2.783232, 0, 0.7529412, 1, 1,
0.04555884, 0.9423753, 0.6608766, 0, 0.7490196, 1, 1,
0.05047212, -0.3324326, 3.348818, 0, 0.7411765, 1, 1,
0.05152677, 0.05032237, 0.7144285, 0, 0.7372549, 1, 1,
0.05198073, 0.2752596, -0.1237886, 0, 0.7294118, 1, 1,
0.05772674, 0.5745819, 0.9678419, 0, 0.7254902, 1, 1,
0.05970975, 0.3684556, -0.6644585, 0, 0.7176471, 1, 1,
0.07670319, -0.1177115, 1.981841, 0, 0.7137255, 1, 1,
0.07698354, -1.855478, 3.794462, 0, 0.7058824, 1, 1,
0.07883582, 1.572593, -2.600803, 0, 0.6980392, 1, 1,
0.08279175, 1.266782, 0.2290161, 0, 0.6941177, 1, 1,
0.08818913, 0.3364204, 1.524934, 0, 0.6862745, 1, 1,
0.09053798, -1.801315, 3.835531, 0, 0.682353, 1, 1,
0.09516107, -1.458381, 2.161489, 0, 0.6745098, 1, 1,
0.0966258, 1.48451, 0.9368783, 0, 0.6705883, 1, 1,
0.09736769, 1.578217, -0.810762, 0, 0.6627451, 1, 1,
0.0992361, -0.1646142, 2.884257, 0, 0.6588235, 1, 1,
0.09966841, -0.2932245, 3.617851, 0, 0.6509804, 1, 1,
0.1075858, -0.6694168, 3.751933, 0, 0.6470588, 1, 1,
0.1079391, -0.06723034, 1.691713, 0, 0.6392157, 1, 1,
0.1184698, -2.691562, 2.007173, 0, 0.6352941, 1, 1,
0.1237328, -0.4405389, 3.005577, 0, 0.627451, 1, 1,
0.1258841, -1.211506, 3.939305, 0, 0.6235294, 1, 1,
0.128717, -0.2660593, 1.296519, 0, 0.6156863, 1, 1,
0.134364, -0.4933449, 2.672921, 0, 0.6117647, 1, 1,
0.139357, -0.5654719, 2.39686, 0, 0.6039216, 1, 1,
0.1430451, -0.3727178, 3.979022, 0, 0.5960785, 1, 1,
0.1456601, -1.606218, 1.720895, 0, 0.5921569, 1, 1,
0.1617856, -0.2331607, 1.466064, 0, 0.5843138, 1, 1,
0.1625177, 0.8422446, 0.4448054, 0, 0.5803922, 1, 1,
0.1631521, -0.3407405, 3.424917, 0, 0.572549, 1, 1,
0.1691286, -1.324571, 3.792637, 0, 0.5686275, 1, 1,
0.1712701, 0.8651761, -0.5483983, 0, 0.5607843, 1, 1,
0.1744908, 0.3591955, -1.146828, 0, 0.5568628, 1, 1,
0.1749044, -1.263379, 4.915327, 0, 0.5490196, 1, 1,
0.1764439, 0.2839593, 0.7936311, 0, 0.5450981, 1, 1,
0.1770039, -0.6880718, 2.788791, 0, 0.5372549, 1, 1,
0.1784245, 0.1589556, 0.2018841, 0, 0.5333334, 1, 1,
0.1809978, 0.0197081, -0.4191795, 0, 0.5254902, 1, 1,
0.1845523, 0.8365884, -0.5045872, 0, 0.5215687, 1, 1,
0.1851949, 0.6045226, -0.06703259, 0, 0.5137255, 1, 1,
0.1882697, -0.995379, 0.9130369, 0, 0.509804, 1, 1,
0.1898843, 0.02175715, 1.818116, 0, 0.5019608, 1, 1,
0.1902567, 0.3548732, 2.407929, 0, 0.4941176, 1, 1,
0.1911535, -0.6230221, 3.528538, 0, 0.4901961, 1, 1,
0.1911752, 1.702646, 0.6875538, 0, 0.4823529, 1, 1,
0.1917716, -0.6473158, 2.757254, 0, 0.4784314, 1, 1,
0.1938684, -1.374674, 2.365341, 0, 0.4705882, 1, 1,
0.1971708, 0.192871, 0.3751878, 0, 0.4666667, 1, 1,
0.2062898, 0.3104131, 1.220991, 0, 0.4588235, 1, 1,
0.2069747, -0.8726829, 3.917887, 0, 0.454902, 1, 1,
0.2082939, -1.095838, 2.395384, 0, 0.4470588, 1, 1,
0.2083854, -0.4659412, 3.143023, 0, 0.4431373, 1, 1,
0.2089993, 0.628054, 0.5789886, 0, 0.4352941, 1, 1,
0.2094477, -0.5626257, 2.07699, 0, 0.4313726, 1, 1,
0.2096081, 0.6309803, 0.1549181, 0, 0.4235294, 1, 1,
0.2113128, 0.1710236, 0.920307, 0, 0.4196078, 1, 1,
0.2138296, -1.6272, 4.240118, 0, 0.4117647, 1, 1,
0.218852, -0.4443928, 2.428243, 0, 0.4078431, 1, 1,
0.2190892, -0.08413612, 2.686685, 0, 0.4, 1, 1,
0.2197909, 0.0585461, 2.316191, 0, 0.3921569, 1, 1,
0.2202821, 0.877313, 0.09021445, 0, 0.3882353, 1, 1,
0.2204048, -0.9623174, 4.274081, 0, 0.3803922, 1, 1,
0.2246498, -0.3438009, 1.810833, 0, 0.3764706, 1, 1,
0.2252144, 1.053879, -0.18521, 0, 0.3686275, 1, 1,
0.2269461, 1.816901, -1.097039, 0, 0.3647059, 1, 1,
0.2272334, 1.591565, 0.3545846, 0, 0.3568628, 1, 1,
0.2370463, -0.08249968, 2.099565, 0, 0.3529412, 1, 1,
0.245828, -1.640142, 3.446439, 0, 0.345098, 1, 1,
0.249088, -0.6451613, 3.0505, 0, 0.3411765, 1, 1,
0.2506362, -0.962074, 3.626519, 0, 0.3333333, 1, 1,
0.2516803, -0.7216522, 2.333285, 0, 0.3294118, 1, 1,
0.253315, 0.1832873, 0.2694477, 0, 0.3215686, 1, 1,
0.2543654, 0.7250394, -0.9707943, 0, 0.3176471, 1, 1,
0.2556107, -0.6617748, 3.98921, 0, 0.3098039, 1, 1,
0.2586095, -0.8668302, 2.132693, 0, 0.3058824, 1, 1,
0.2592358, 0.153847, 1.11488, 0, 0.2980392, 1, 1,
0.2718409, -0.6662409, 2.459045, 0, 0.2901961, 1, 1,
0.2760299, 1.199155, -0.9156576, 0, 0.2862745, 1, 1,
0.2783397, -1.112992, 2.527146, 0, 0.2784314, 1, 1,
0.2784689, -0.3176869, 4.603786, 0, 0.2745098, 1, 1,
0.2801029, 1.565534, 1.231241, 0, 0.2666667, 1, 1,
0.2839617, -0.9653151, 2.531335, 0, 0.2627451, 1, 1,
0.2846259, 0.6203561, 0.9309931, 0, 0.254902, 1, 1,
0.2880606, 1.046164, 1.202516, 0, 0.2509804, 1, 1,
0.2951515, -0.4426279, 3.61144, 0, 0.2431373, 1, 1,
0.2985944, -0.5255029, 2.882506, 0, 0.2392157, 1, 1,
0.2991324, 1.025623, -0.8094495, 0, 0.2313726, 1, 1,
0.3005584, 0.4332583, 0.1316557, 0, 0.227451, 1, 1,
0.303572, 0.2230071, 1.340027, 0, 0.2196078, 1, 1,
0.3041905, 2.125418, 0.6675037, 0, 0.2156863, 1, 1,
0.3046165, -0.5060903, 3.402358, 0, 0.2078431, 1, 1,
0.3085565, 2.118797, 1.302078, 0, 0.2039216, 1, 1,
0.3125888, 1.595609, -1.251714, 0, 0.1960784, 1, 1,
0.3137766, -1.241903, 2.3156, 0, 0.1882353, 1, 1,
0.3139231, 0.3322469, 0.09573831, 0, 0.1843137, 1, 1,
0.3158573, 0.1135617, 1.379159, 0, 0.1764706, 1, 1,
0.3268706, -0.6286581, 1.468796, 0, 0.172549, 1, 1,
0.3285151, -0.9932672, 3.966078, 0, 0.1647059, 1, 1,
0.3314843, -1.080624, 3.302107, 0, 0.1607843, 1, 1,
0.3367359, -0.1750577, 1.229801, 0, 0.1529412, 1, 1,
0.3422836, -1.280489, 4.910027, 0, 0.1490196, 1, 1,
0.3444774, 0.2677794, 1.922821, 0, 0.1411765, 1, 1,
0.3467106, -2.927247, 4.789255, 0, 0.1372549, 1, 1,
0.3495753, -0.5665717, 2.890447, 0, 0.1294118, 1, 1,
0.3543623, -0.621045, 3.64562, 0, 0.1254902, 1, 1,
0.3585633, -0.06364555, 0.739458, 0, 0.1176471, 1, 1,
0.3606876, -0.9880759, 2.713933, 0, 0.1137255, 1, 1,
0.3608373, 1.106325, 0.08601272, 0, 0.1058824, 1, 1,
0.3618856, -1.744344, 2.634698, 0, 0.09803922, 1, 1,
0.3649452, -0.5585889, 1.762177, 0, 0.09411765, 1, 1,
0.3662815, -0.2374002, 1.896083, 0, 0.08627451, 1, 1,
0.3700525, 0.9495099, 2.50947, 0, 0.08235294, 1, 1,
0.3704937, 0.8329301, 0.03922315, 0, 0.07450981, 1, 1,
0.3776514, -0.9798931, 1.55338, 0, 0.07058824, 1, 1,
0.3793858, -1.139916, 2.668826, 0, 0.0627451, 1, 1,
0.3803268, 0.3087266, 1.593441, 0, 0.05882353, 1, 1,
0.3818626, 0.9977362, 1.201997, 0, 0.05098039, 1, 1,
0.3826809, -1.90291, 3.750922, 0, 0.04705882, 1, 1,
0.3843405, -1.903239, 3.46626, 0, 0.03921569, 1, 1,
0.3844562, 0.8110952, -0.7000228, 0, 0.03529412, 1, 1,
0.3859367, -0.09851945, 2.926014, 0, 0.02745098, 1, 1,
0.3882486, 1.943753, 2.077987, 0, 0.02352941, 1, 1,
0.3900771, 0.9799975, 1.185687, 0, 0.01568628, 1, 1,
0.3900831, -0.9262425, 0.935783, 0, 0.01176471, 1, 1,
0.3987876, 0.6090241, -0.2584586, 0, 0.003921569, 1, 1,
0.4014214, -0.09299017, 1.939533, 0.003921569, 0, 1, 1,
0.4037246, -1.473098, 2.443325, 0.007843138, 0, 1, 1,
0.4055311, 0.31828, 0.6577894, 0.01568628, 0, 1, 1,
0.4074138, 0.7271863, 0.3114473, 0.01960784, 0, 1, 1,
0.4081384, 1.372645, 2.487293, 0.02745098, 0, 1, 1,
0.4085023, -0.2206436, -0.1539137, 0.03137255, 0, 1, 1,
0.4131435, 0.09272839, 2.699778, 0.03921569, 0, 1, 1,
0.4134753, 1.118691, -0.2691823, 0.04313726, 0, 1, 1,
0.4142665, 0.561864, 2.870525, 0.05098039, 0, 1, 1,
0.4156604, 1.529786, 0.6112611, 0.05490196, 0, 1, 1,
0.4181703, 0.5666375, 1.087551, 0.0627451, 0, 1, 1,
0.4194596, 0.4317412, 1.142179, 0.06666667, 0, 1, 1,
0.4235578, 0.9415964, -0.7113461, 0.07450981, 0, 1, 1,
0.4252077, -0.8596587, 2.487245, 0.07843138, 0, 1, 1,
0.4255125, -0.1155085, 0.07307991, 0.08627451, 0, 1, 1,
0.4267528, -0.7722169, 3.288072, 0.09019608, 0, 1, 1,
0.4295757, 0.8932088, 0.1896232, 0.09803922, 0, 1, 1,
0.4335655, -1.061431, 2.343977, 0.1058824, 0, 1, 1,
0.4363049, -2.456363, 3.362664, 0.1098039, 0, 1, 1,
0.4370869, -0.4109171, 2.437669, 0.1176471, 0, 1, 1,
0.4452109, 1.319899, 1.81392, 0.1215686, 0, 1, 1,
0.4477479, -0.1566911, 1.288413, 0.1294118, 0, 1, 1,
0.4501242, 0.2845999, 1.224003, 0.1333333, 0, 1, 1,
0.453884, -0.04694379, 1.859408, 0.1411765, 0, 1, 1,
0.4555705, 1.052201, 0.4545515, 0.145098, 0, 1, 1,
0.4599121, -0.9995437, 2.608721, 0.1529412, 0, 1, 1,
0.463921, 0.6617517, -0.2115464, 0.1568628, 0, 1, 1,
0.4669077, 0.01996915, 1.304229, 0.1647059, 0, 1, 1,
0.473283, -0.3961861, -0.2566207, 0.1686275, 0, 1, 1,
0.4741286, -0.1165582, 2.52797, 0.1764706, 0, 1, 1,
0.4777149, -1.319319, 3.960587, 0.1803922, 0, 1, 1,
0.478933, -0.5335727, 1.378235, 0.1882353, 0, 1, 1,
0.4900176, -1.513802, 1.893728, 0.1921569, 0, 1, 1,
0.4918447, 0.5391846, 1.523939, 0.2, 0, 1, 1,
0.4924373, 0.5973479, -0.3956754, 0.2078431, 0, 1, 1,
0.4928432, -1.577732, 3.07856, 0.2117647, 0, 1, 1,
0.4941196, -0.4422658, 2.110363, 0.2196078, 0, 1, 1,
0.4956889, -0.6942781, 2.217785, 0.2235294, 0, 1, 1,
0.4973728, -0.42789, 1.408863, 0.2313726, 0, 1, 1,
0.5011494, -2.172767, 4.251865, 0.2352941, 0, 1, 1,
0.5017337, -0.3277699, 1.372638, 0.2431373, 0, 1, 1,
0.5041696, -0.7968004, 2.233233, 0.2470588, 0, 1, 1,
0.5134982, -1.000349, 3.328441, 0.254902, 0, 1, 1,
0.522985, -0.2016331, 0.8732719, 0.2588235, 0, 1, 1,
0.5249099, -0.2314973, 0.8023526, 0.2666667, 0, 1, 1,
0.5255805, -0.5355877, 1.144723, 0.2705882, 0, 1, 1,
0.5273896, -1.797265, 3.284743, 0.2784314, 0, 1, 1,
0.5353537, -0.7738038, 2.258317, 0.282353, 0, 1, 1,
0.5356424, 0.6038253, 0.5635233, 0.2901961, 0, 1, 1,
0.5366824, 0.3290316, 0.613056, 0.2941177, 0, 1, 1,
0.5382398, -1.089744, 3.595744, 0.3019608, 0, 1, 1,
0.5423548, -1.095142, 1.498701, 0.3098039, 0, 1, 1,
0.5461709, 0.5289924, 1.824401, 0.3137255, 0, 1, 1,
0.5485426, 0.2856505, 1.332042, 0.3215686, 0, 1, 1,
0.5582588, 0.8468691, 1.333669, 0.3254902, 0, 1, 1,
0.5619816, -0.214566, -0.02074529, 0.3333333, 0, 1, 1,
0.565847, -0.6753615, 1.152227, 0.3372549, 0, 1, 1,
0.5784279, 0.9399248, 0.3691087, 0.345098, 0, 1, 1,
0.5799131, -1.238853, 2.326, 0.3490196, 0, 1, 1,
0.5866557, 0.4740209, -0.05304446, 0.3568628, 0, 1, 1,
0.5910338, 0.8225697, 0.805361, 0.3607843, 0, 1, 1,
0.5947704, -0.6260614, 3.305873, 0.3686275, 0, 1, 1,
0.5961561, -0.6276293, 1.781636, 0.372549, 0, 1, 1,
0.5971888, -0.5341703, 2.572785, 0.3803922, 0, 1, 1,
0.6005595, -0.5380053, 2.266824, 0.3843137, 0, 1, 1,
0.6028314, -1.345741, 3.551816, 0.3921569, 0, 1, 1,
0.6054491, 1.671705, 1.530761, 0.3960784, 0, 1, 1,
0.6070038, 0.2410667, 2.483702, 0.4039216, 0, 1, 1,
0.6113299, -1.329153, 3.084587, 0.4117647, 0, 1, 1,
0.612425, -0.6630272, 4.414258, 0.4156863, 0, 1, 1,
0.6157035, 1.329724, 1.066375, 0.4235294, 0, 1, 1,
0.6193662, 0.03751699, 2.833688, 0.427451, 0, 1, 1,
0.6245232, 1.659416, 0.344744, 0.4352941, 0, 1, 1,
0.6274708, -0.5875037, -0.1819519, 0.4392157, 0, 1, 1,
0.6316366, 1.285938, -0.4885817, 0.4470588, 0, 1, 1,
0.6324058, 1.029537, 1.718527, 0.4509804, 0, 1, 1,
0.6358724, 0.5975536, 2.5367, 0.4588235, 0, 1, 1,
0.6410086, 0.5362075, 2.215317, 0.4627451, 0, 1, 1,
0.6445903, 0.004523868, 0.777981, 0.4705882, 0, 1, 1,
0.6474671, 0.6621398, 1.749239, 0.4745098, 0, 1, 1,
0.651216, -1.216042, 1.993719, 0.4823529, 0, 1, 1,
0.6622286, -0.1605999, 1.59923, 0.4862745, 0, 1, 1,
0.6635773, -0.1327951, 1.962599, 0.4941176, 0, 1, 1,
0.6640331, -0.3496, 2.00658, 0.5019608, 0, 1, 1,
0.6650106, 0.8172802, 0.607437, 0.5058824, 0, 1, 1,
0.6670774, 1.697989, 2.078769, 0.5137255, 0, 1, 1,
0.6701052, -0.5753894, 2.921792, 0.5176471, 0, 1, 1,
0.6718946, 2.401377, 1.4547, 0.5254902, 0, 1, 1,
0.6750339, 0.5340158, 1.536492, 0.5294118, 0, 1, 1,
0.6770853, -1.353459, 3.565114, 0.5372549, 0, 1, 1,
0.6803738, 0.7911722, -0.7288276, 0.5411765, 0, 1, 1,
0.6821053, 0.4105326, 0.4148938, 0.5490196, 0, 1, 1,
0.6827853, -0.2740386, 2.252697, 0.5529412, 0, 1, 1,
0.6854086, -0.4903111, 3.068976, 0.5607843, 0, 1, 1,
0.690916, -1.457129, 3.467098, 0.5647059, 0, 1, 1,
0.692144, -0.8256211, 4.235529, 0.572549, 0, 1, 1,
0.6955991, 1.223083, 1.611171, 0.5764706, 0, 1, 1,
0.6979285, 1.626707, 0.2366708, 0.5843138, 0, 1, 1,
0.6980589, 0.03257001, 2.769481, 0.5882353, 0, 1, 1,
0.6992849, 0.0156897, 2.523996, 0.5960785, 0, 1, 1,
0.7047296, 0.6345147, 1.46089, 0.6039216, 0, 1, 1,
0.7062788, -0.6125317, 2.015079, 0.6078432, 0, 1, 1,
0.7163117, -0.9121734, 3.246334, 0.6156863, 0, 1, 1,
0.7251585, -0.1888112, 2.797167, 0.6196079, 0, 1, 1,
0.7254661, 1.100141, 0.2615152, 0.627451, 0, 1, 1,
0.72701, -1.817088, 3.772012, 0.6313726, 0, 1, 1,
0.7425359, -1.156132, 2.420777, 0.6392157, 0, 1, 1,
0.7434114, 0.8090913, -0.006816932, 0.6431373, 0, 1, 1,
0.7435383, 1.637965, 0.3511613, 0.6509804, 0, 1, 1,
0.7436216, 1.076495, 0.8305902, 0.654902, 0, 1, 1,
0.7461902, 0.3519329, 0.4431938, 0.6627451, 0, 1, 1,
0.751162, 1.149429, 1.974349, 0.6666667, 0, 1, 1,
0.767092, 1.790143, 0.1558869, 0.6745098, 0, 1, 1,
0.7852933, 0.03216301, 1.256187, 0.6784314, 0, 1, 1,
0.7872101, -1.443887, 1.412057, 0.6862745, 0, 1, 1,
0.7889959, 0.5277773, 0.9410878, 0.6901961, 0, 1, 1,
0.7916437, 1.319661, 0.6462062, 0.6980392, 0, 1, 1,
0.7939873, 0.4728535, 0.2954469, 0.7058824, 0, 1, 1,
0.796412, -1.183912, 0.7185163, 0.7098039, 0, 1, 1,
0.7987425, 0.1389122, 1.635776, 0.7176471, 0, 1, 1,
0.8085941, -0.9135477, 1.890016, 0.7215686, 0, 1, 1,
0.8111607, 0.11275, 0.8126165, 0.7294118, 0, 1, 1,
0.8131971, -0.443853, 1.095109, 0.7333333, 0, 1, 1,
0.814553, -0.4387989, 2.10769, 0.7411765, 0, 1, 1,
0.8166009, -0.493551, 2.390121, 0.7450981, 0, 1, 1,
0.8169475, -0.6826711, 1.440386, 0.7529412, 0, 1, 1,
0.816988, 1.059449, 1.557534, 0.7568628, 0, 1, 1,
0.8183897, 0.6448913, 1.007774, 0.7647059, 0, 1, 1,
0.8187532, -0.2323845, 3.376217, 0.7686275, 0, 1, 1,
0.8193689, -0.3029698, 3.15761, 0.7764706, 0, 1, 1,
0.8194798, 2.236209, -0.1725496, 0.7803922, 0, 1, 1,
0.8203208, 0.1986987, 1.50954, 0.7882353, 0, 1, 1,
0.820591, -0.1996961, 2.366968, 0.7921569, 0, 1, 1,
0.8211916, -0.7471411, 2.275387, 0.8, 0, 1, 1,
0.8280908, -0.5630506, 3.387884, 0.8078431, 0, 1, 1,
0.8305431, 1.700585, -1.103359, 0.8117647, 0, 1, 1,
0.8317707, -0.8032206, 4.170599, 0.8196079, 0, 1, 1,
0.8327751, -0.8156399, 4.244104, 0.8235294, 0, 1, 1,
0.8329038, 0.1821113, 1.147678, 0.8313726, 0, 1, 1,
0.8390276, -0.6594379, 1.907456, 0.8352941, 0, 1, 1,
0.8436126, -0.03229294, 1.936055, 0.8431373, 0, 1, 1,
0.8452334, 0.6258075, 0.05377241, 0.8470588, 0, 1, 1,
0.8469011, 1.374498, 1.945456, 0.854902, 0, 1, 1,
0.8499874, -2.541904, 2.135504, 0.8588235, 0, 1, 1,
0.8532696, -0.0569443, 1.232358, 0.8666667, 0, 1, 1,
0.8541886, 0.991621, -0.4216464, 0.8705882, 0, 1, 1,
0.8665181, 2.070681, 1.775973, 0.8784314, 0, 1, 1,
0.8729653, 0.9758199, 0.7573159, 0.8823529, 0, 1, 1,
0.874436, 0.2830777, 0.5696112, 0.8901961, 0, 1, 1,
0.8757341, 0.02531146, 2.432988, 0.8941177, 0, 1, 1,
0.8810543, 0.9957358, 0.490322, 0.9019608, 0, 1, 1,
0.8819779, -0.800765, 3.98147, 0.9098039, 0, 1, 1,
0.8821602, 1.657366, 1.217071, 0.9137255, 0, 1, 1,
0.8849366, -0.487811, 3.424522, 0.9215686, 0, 1, 1,
0.8857484, 0.5951178, 1.170732, 0.9254902, 0, 1, 1,
0.8899383, 1.041745, 0.9008461, 0.9333333, 0, 1, 1,
0.8922397, 1.555548, 1.539258, 0.9372549, 0, 1, 1,
0.8943858, 0.7307236, 1.313165, 0.945098, 0, 1, 1,
0.8947446, -1.927694, 1.275619, 0.9490196, 0, 1, 1,
0.8961875, 0.07615973, 3.506667, 0.9568627, 0, 1, 1,
0.8980517, -0.8401046, 3.85034, 0.9607843, 0, 1, 1,
0.8981004, -1.028157, 1.875828, 0.9686275, 0, 1, 1,
0.8999354, -1.406201, 3.360882, 0.972549, 0, 1, 1,
0.9035478, 0.7674826, 1.528052, 0.9803922, 0, 1, 1,
0.9086866, 1.354915, 0.2030634, 0.9843137, 0, 1, 1,
0.9091613, -0.1762083, 0.8789147, 0.9921569, 0, 1, 1,
0.9115584, -0.01842785, 2.525741, 0.9960784, 0, 1, 1,
0.9148338, -0.4451907, 3.503093, 1, 0, 0.9960784, 1,
0.9198691, -0.3052446, 2.034536, 1, 0, 0.9882353, 1,
0.9309105, 1.664749, 0.7660351, 1, 0, 0.9843137, 1,
0.9313678, 1.967735, -0.1158877, 1, 0, 0.9764706, 1,
0.9335363, 1.186419, 1.535508, 1, 0, 0.972549, 1,
0.9352005, 0.6204202, 0.6083701, 1, 0, 0.9647059, 1,
0.9374897, 1.058293, 0.6901256, 1, 0, 0.9607843, 1,
0.9407389, -1.420515, 3.109832, 1, 0, 0.9529412, 1,
0.9545491, 0.5768881, 1.062721, 1, 0, 0.9490196, 1,
0.9657294, 0.4792748, -0.08968777, 1, 0, 0.9411765, 1,
0.9736338, -0.06154773, 0.3094515, 1, 0, 0.9372549, 1,
0.9749142, 0.6911035, 2.040537, 1, 0, 0.9294118, 1,
0.9755479, -0.1680277, 2.290042, 1, 0, 0.9254902, 1,
0.9834957, -0.2852111, 2.649266, 1, 0, 0.9176471, 1,
0.9843678, -0.5855591, 2.622848, 1, 0, 0.9137255, 1,
0.9898124, -1.621893, 3.774344, 1, 0, 0.9058824, 1,
0.9967747, 0.1006723, 0.1723395, 1, 0, 0.9019608, 1,
0.9972847, -0.3720671, 3.462322, 1, 0, 0.8941177, 1,
0.9988634, -1.235788, 3.037489, 1, 0, 0.8862745, 1,
0.9991454, -0.4783483, -0.0246227, 1, 0, 0.8823529, 1,
1.006502, -0.03399225, 1.58604, 1, 0, 0.8745098, 1,
1.009451, 1.184789, 0.1294618, 1, 0, 0.8705882, 1,
1.011382, -1.329781, 1.768767, 1, 0, 0.8627451, 1,
1.015044, -2.565201, 2.574037, 1, 0, 0.8588235, 1,
1.022303, 0.7674724, 1.108066, 1, 0, 0.8509804, 1,
1.022609, -0.1550377, 2.473663, 1, 0, 0.8470588, 1,
1.035767, -1.362143, 2.819075, 1, 0, 0.8392157, 1,
1.038449, -0.7483643, 3.309388, 1, 0, 0.8352941, 1,
1.047684, -1.179992, -0.5509855, 1, 0, 0.827451, 1,
1.048707, -0.4481551, 1.444573, 1, 0, 0.8235294, 1,
1.053228, 2.115543, 1.756885, 1, 0, 0.8156863, 1,
1.058122, -0.2260604, 1.597105, 1, 0, 0.8117647, 1,
1.059981, -0.1303344, 0.2750607, 1, 0, 0.8039216, 1,
1.060371, -1.546615, 0.5701631, 1, 0, 0.7960784, 1,
1.061402, 0.482089, 0.5787339, 1, 0, 0.7921569, 1,
1.062749, -2.110703, 3.364147, 1, 0, 0.7843137, 1,
1.064869, -1.812003, 3.126909, 1, 0, 0.7803922, 1,
1.065483, 1.204737, 1.00275, 1, 0, 0.772549, 1,
1.069629, -0.6802196, 2.642215, 1, 0, 0.7686275, 1,
1.079357, 0.2717101, -0.08022355, 1, 0, 0.7607843, 1,
1.081963, -0.7463619, 3.412189, 1, 0, 0.7568628, 1,
1.082785, 0.3713904, 1.794897, 1, 0, 0.7490196, 1,
1.082903, -0.0831046, 0.2028618, 1, 0, 0.7450981, 1,
1.091687, -0.3459456, 3.101009, 1, 0, 0.7372549, 1,
1.095651, -0.7569372, 2.182503, 1, 0, 0.7333333, 1,
1.104646, 1.043052, 1.476982, 1, 0, 0.7254902, 1,
1.107486, -0.137914, 1.954374, 1, 0, 0.7215686, 1,
1.112429, 0.493133, 1.649298, 1, 0, 0.7137255, 1,
1.112619, 0.04844628, 3.308826, 1, 0, 0.7098039, 1,
1.121857, -1.550474, 1.482037, 1, 0, 0.7019608, 1,
1.122281, -0.521803, 1.422214, 1, 0, 0.6941177, 1,
1.128524, -1.16544, 1.301595, 1, 0, 0.6901961, 1,
1.136832, -0.3491632, 2.812904, 1, 0, 0.682353, 1,
1.138054, -2.60744, 3.705694, 1, 0, 0.6784314, 1,
1.147881, 1.956819, 0.1289807, 1, 0, 0.6705883, 1,
1.15142, 0.2572823, 0.08273438, 1, 0, 0.6666667, 1,
1.152774, -0.4390292, 1.515074, 1, 0, 0.6588235, 1,
1.167417, -1.098452, 4.551229, 1, 0, 0.654902, 1,
1.171623, 0.637641, 4.004824, 1, 0, 0.6470588, 1,
1.176343, 2.627374, -0.5516968, 1, 0, 0.6431373, 1,
1.176803, -1.566618, 4.869195, 1, 0, 0.6352941, 1,
1.178525, -0.3425951, 1.874167, 1, 0, 0.6313726, 1,
1.191479, 0.9723884, 1.854994, 1, 0, 0.6235294, 1,
1.198509, 1.359599, -1.870039, 1, 0, 0.6196079, 1,
1.201678, -0.1542666, 2.340299, 1, 0, 0.6117647, 1,
1.20909, 1.146239, -0.7235816, 1, 0, 0.6078432, 1,
1.220886, 0.0444638, 2.773845, 1, 0, 0.6, 1,
1.220894, -0.4798845, 0.8944685, 1, 0, 0.5921569, 1,
1.221931, -0.8089273, 2.732523, 1, 0, 0.5882353, 1,
1.231197, 0.02833638, 3.858349, 1, 0, 0.5803922, 1,
1.233251, -0.905426, 0.8489067, 1, 0, 0.5764706, 1,
1.23403, -0.7287028, 3.309013, 1, 0, 0.5686275, 1,
1.234453, -0.2166519, 0.3861289, 1, 0, 0.5647059, 1,
1.235862, 0.7483723, 1.574885, 1, 0, 0.5568628, 1,
1.242471, 0.7107104, -0.5324245, 1, 0, 0.5529412, 1,
1.243625, 2.353758, 3.048646, 1, 0, 0.5450981, 1,
1.244354, 1.415431, 0.364513, 1, 0, 0.5411765, 1,
1.271469, -1.091069, 2.964034, 1, 0, 0.5333334, 1,
1.291869, 0.4853793, 0.9042825, 1, 0, 0.5294118, 1,
1.301137, -0.2483722, 1.163335, 1, 0, 0.5215687, 1,
1.302941, -2.581775, 3.113886, 1, 0, 0.5176471, 1,
1.310683, -1.879687, 1.618939, 1, 0, 0.509804, 1,
1.311189, -0.7165579, 3.775141, 1, 0, 0.5058824, 1,
1.322288, 0.6518453, 1.83186, 1, 0, 0.4980392, 1,
1.327261, -0.0783551, 1.142084, 1, 0, 0.4901961, 1,
1.332743, 0.1249794, 0.3819906, 1, 0, 0.4862745, 1,
1.338387, -0.04346909, 1.262181, 1, 0, 0.4784314, 1,
1.346358, 0.366673, 1.760869, 1, 0, 0.4745098, 1,
1.348564, 1.118914, 2.308237, 1, 0, 0.4666667, 1,
1.355986, -1.060887, 2.010808, 1, 0, 0.4627451, 1,
1.357862, -0.3857139, 1.842598, 1, 0, 0.454902, 1,
1.370647, -0.4631859, 1.703658, 1, 0, 0.4509804, 1,
1.374169, -1.209133, 2.127668, 1, 0, 0.4431373, 1,
1.380052, -1.347272, 2.909753, 1, 0, 0.4392157, 1,
1.385936, 0.2949958, 1.400259, 1, 0, 0.4313726, 1,
1.389485, -0.08007836, 1.536826, 1, 0, 0.427451, 1,
1.390782, -0.6353136, 0.3123298, 1, 0, 0.4196078, 1,
1.413348, 1.075261, 1.960425, 1, 0, 0.4156863, 1,
1.414065, -0.6987222, 1.778358, 1, 0, 0.4078431, 1,
1.420262, -1.25623, 1.284577, 1, 0, 0.4039216, 1,
1.430086, 0.8684089, 1.321962, 1, 0, 0.3960784, 1,
1.441116, -0.191634, 2.074227, 1, 0, 0.3882353, 1,
1.446434, -0.4911247, 2.781605, 1, 0, 0.3843137, 1,
1.459064, 1.616566, 0.318609, 1, 0, 0.3764706, 1,
1.460124, -1.241411, 2.649503, 1, 0, 0.372549, 1,
1.461898, -0.8009732, 2.370757, 1, 0, 0.3647059, 1,
1.463225, -0.1029837, 0.7665185, 1, 0, 0.3607843, 1,
1.471027, 0.5182524, 1.070616, 1, 0, 0.3529412, 1,
1.481454, 0.05705725, 2.639698, 1, 0, 0.3490196, 1,
1.490456, 0.9516805, 1.600076, 1, 0, 0.3411765, 1,
1.515241, 1.042808, -0.1230854, 1, 0, 0.3372549, 1,
1.538145, 1.497025, 0.2428697, 1, 0, 0.3294118, 1,
1.545626, 0.5315444, 2.495078, 1, 0, 0.3254902, 1,
1.549742, -2.68617, 2.847091, 1, 0, 0.3176471, 1,
1.55639, -0.07001758, 3.773807, 1, 0, 0.3137255, 1,
1.556778, 0.1646722, 0.6228764, 1, 0, 0.3058824, 1,
1.559725, 0.7471591, 1.316238, 1, 0, 0.2980392, 1,
1.560608, -0.4405718, 1.102185, 1, 0, 0.2941177, 1,
1.567011, -0.5179219, 0.9048691, 1, 0, 0.2862745, 1,
1.579447, 1.111531, 1.383657, 1, 0, 0.282353, 1,
1.614744, 0.7067968, 0.717871, 1, 0, 0.2745098, 1,
1.619427, 0.9435626, 0.6369671, 1, 0, 0.2705882, 1,
1.663555, -0.8384504, 0.5038198, 1, 0, 0.2627451, 1,
1.664356, -1.257388, 1.350197, 1, 0, 0.2588235, 1,
1.669233, 1.145431, 1.653059, 1, 0, 0.2509804, 1,
1.707195, 0.6618734, 0.3665074, 1, 0, 0.2470588, 1,
1.719228, -1.148006, 1.730825, 1, 0, 0.2392157, 1,
1.725569, 0.008940198, 3.115626, 1, 0, 0.2352941, 1,
1.734169, 0.5692897, 2.356697, 1, 0, 0.227451, 1,
1.740804, 0.02516421, 0.4437237, 1, 0, 0.2235294, 1,
1.747162, 2.382457, 0.7968529, 1, 0, 0.2156863, 1,
1.76918, -0.44182, 2.246541, 1, 0, 0.2117647, 1,
1.786039, -0.5233329, 1.513713, 1, 0, 0.2039216, 1,
1.788034, -0.159992, 3.832799, 1, 0, 0.1960784, 1,
1.798464, -1.264229, 2.043774, 1, 0, 0.1921569, 1,
1.810677, 0.8061852, -1.129848, 1, 0, 0.1843137, 1,
1.817868, -0.2971389, 0.9296457, 1, 0, 0.1803922, 1,
1.858049, -0.3154579, 1.234474, 1, 0, 0.172549, 1,
1.869829, -0.1399061, 3.389436, 1, 0, 0.1686275, 1,
1.932957, -1.499477, 1.446732, 1, 0, 0.1607843, 1,
1.941048, 0.6675422, 0.126923, 1, 0, 0.1568628, 1,
1.955696, -0.697907, 3.648834, 1, 0, 0.1490196, 1,
1.976379, -0.5422593, 3.628575, 1, 0, 0.145098, 1,
1.98071, 0.6879551, -1.932402, 1, 0, 0.1372549, 1,
1.991579, -0.03420201, 1.620672, 1, 0, 0.1333333, 1,
2.013915, 0.6738935, 1.400493, 1, 0, 0.1254902, 1,
2.01817, -0.3215761, 1.990642, 1, 0, 0.1215686, 1,
2.019618, 1.058649, 1.858453, 1, 0, 0.1137255, 1,
2.032789, 0.882273, 0.4525872, 1, 0, 0.1098039, 1,
2.066097, 0.6189563, -0.4251961, 1, 0, 0.1019608, 1,
2.086444, 0.5205312, 2.020561, 1, 0, 0.09411765, 1,
2.12216, 0.2927669, 2.434558, 1, 0, 0.09019608, 1,
2.123209, 0.6367099, -0.4215199, 1, 0, 0.08235294, 1,
2.134144, 1.427367, -0.5440037, 1, 0, 0.07843138, 1,
2.15877, 0.7736614, -0.1887361, 1, 0, 0.07058824, 1,
2.192542, 0.8336565, 0.8361728, 1, 0, 0.06666667, 1,
2.246733, 0.3005631, 3.396419, 1, 0, 0.05882353, 1,
2.300826, -0.524967, 2.506109, 1, 0, 0.05490196, 1,
2.417863, 0.5399885, -0.4450135, 1, 0, 0.04705882, 1,
2.428576, 0.1535824, 4.338816, 1, 0, 0.04313726, 1,
2.432647, -0.3125984, 2.73412, 1, 0, 0.03529412, 1,
2.555283, 1.061283, 1.436282, 1, 0, 0.03137255, 1,
2.621369, 1.037473, 1.237467, 1, 0, 0.02352941, 1,
2.737699, -0.794421, -0.5665299, 1, 0, 0.01960784, 1,
2.861714, 1.18042, 0.4062957, 1, 0, 0.01176471, 1,
3.484713, 0.3281448, 0.6346053, 1, 0, 0.007843138, 1
]);
var buf7 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf7);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc7 = gl.getUniformLocation(prog7,"mvMatrix");
var prMatLoc7 = gl.getUniformLocation(prog7,"prMatrix");
// ****** text object 9 ******
var prog9  = gl.createProgram();
gl.attachShader(prog9, getShader( gl, "testglvshader9" ));
gl.attachShader(prog9, getShader( gl, "testglfshader9" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog9, 0, "aPos");
gl.bindAttribLocation(prog9, 1, "aCol");
gl.linkProgram(prog9);
var texts = [
"x"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX9 = texinfo.canvasX;
var canvasY9 = texinfo.canvasY;
var ofsLoc9 = gl.getAttribLocation(prog9, "aOfs");
var texture9 = gl.createTexture();
var texLoc9 = gl.getAttribLocation(prog9, "aTexcoord");
var sampler9 = gl.getUniformLocation(prog9,"uSampler");
handleLoadedTexture(texture9, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
0.2651386, -4.236314, -6.812128, 0, -0.5, 0.5, 0.5,
0.2651386, -4.236314, -6.812128, 1, -0.5, 0.5, 0.5,
0.2651386, -4.236314, -6.812128, 1, 1.5, 0.5, 0.5,
0.2651386, -4.236314, -6.812128, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf9 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf9);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf9 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf9);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc9 = gl.getUniformLocation(prog9,"mvMatrix");
var prMatLoc9 = gl.getUniformLocation(prog9,"prMatrix");
var textScaleLoc9 = gl.getUniformLocation(prog9,"textScale");
// ****** text object 10 ******
var prog10  = gl.createProgram();
gl.attachShader(prog10, getShader( gl, "testglvshader10" ));
gl.attachShader(prog10, getShader( gl, "testglfshader10" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog10, 0, "aPos");
gl.bindAttribLocation(prog10, 1, "aCol");
gl.linkProgram(prog10);
var texts = [
"y"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX10 = texinfo.canvasX;
var canvasY10 = texinfo.canvasY;
var ofsLoc10 = gl.getAttribLocation(prog10, "aOfs");
var texture10 = gl.createTexture();
var texLoc10 = gl.getAttribLocation(prog10, "aTexcoord");
var sampler10 = gl.getUniformLocation(prog10,"uSampler");
handleLoadedTexture(texture10, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-4.045872, -0.03921187, -6.812128, 0, -0.5, 0.5, 0.5,
-4.045872, -0.03921187, -6.812128, 1, -0.5, 0.5, 0.5,
-4.045872, -0.03921187, -6.812128, 1, 1.5, 0.5, 0.5,
-4.045872, -0.03921187, -6.812128, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf10 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf10);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf10 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf10);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc10 = gl.getUniformLocation(prog10,"mvMatrix");
var prMatLoc10 = gl.getUniformLocation(prog10,"prMatrix");
var textScaleLoc10 = gl.getUniformLocation(prog10,"textScale");
// ****** text object 11 ******
var prog11  = gl.createProgram();
gl.attachShader(prog11, getShader( gl, "testglvshader11" ));
gl.attachShader(prog11, getShader( gl, "testglfshader11" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog11, 0, "aPos");
gl.bindAttribLocation(prog11, 1, "aCol");
gl.linkProgram(prog11);
var texts = [
"z"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX11 = texinfo.canvasX;
var canvasY11 = texinfo.canvasY;
var ofsLoc11 = gl.getAttribLocation(prog11, "aOfs");
var texture11 = gl.createTexture();
var texLoc11 = gl.getAttribLocation(prog11, "aTexcoord");
var sampler11 = gl.getUniformLocation(prog11,"uSampler");
handleLoadedTexture(texture11, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-4.045872, -4.236314, -0.09854865, 0, -0.5, 0.5, 0.5,
-4.045872, -4.236314, -0.09854865, 1, -0.5, 0.5, 0.5,
-4.045872, -4.236314, -0.09854865, 1, 1.5, 0.5, 0.5,
-4.045872, -4.236314, -0.09854865, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf11 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf11);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf11 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf11);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc11 = gl.getUniformLocation(prog11,"mvMatrix");
var prMatLoc11 = gl.getUniformLocation(prog11,"prMatrix");
var textScaleLoc11 = gl.getUniformLocation(prog11,"textScale");
// ****** lines object 12 ******
var prog12  = gl.createProgram();
gl.attachShader(prog12, getShader( gl, "testglvshader12" ));
gl.attachShader(prog12, getShader( gl, "testglfshader12" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog12, 0, "aPos");
gl.bindAttribLocation(prog12, 1, "aCol");
gl.linkProgram(prog12);
var v=new Float32Array([
-2, -3.267752, -5.262841,
3, -3.267752, -5.262841,
-2, -3.267752, -5.262841,
-2, -3.429179, -5.521055,
-1, -3.267752, -5.262841,
-1, -3.429179, -5.521055,
0, -3.267752, -5.262841,
0, -3.429179, -5.521055,
1, -3.267752, -5.262841,
1, -3.429179, -5.521055,
2, -3.267752, -5.262841,
2, -3.429179, -5.521055,
3, -3.267752, -5.262841,
3, -3.429179, -5.521055
]);
var buf12 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf12);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc12 = gl.getUniformLocation(prog12,"mvMatrix");
var prMatLoc12 = gl.getUniformLocation(prog12,"prMatrix");
// ****** text object 13 ******
var prog13  = gl.createProgram();
gl.attachShader(prog13, getShader( gl, "testglvshader13" ));
gl.attachShader(prog13, getShader( gl, "testglfshader13" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog13, 0, "aPos");
gl.bindAttribLocation(prog13, 1, "aCol");
gl.linkProgram(prog13);
var texts = [
"-2",
"-1",
"0",
"1",
"2",
"3"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX13 = texinfo.canvasX;
var canvasY13 = texinfo.canvasY;
var ofsLoc13 = gl.getAttribLocation(prog13, "aOfs");
var texture13 = gl.createTexture();
var texLoc13 = gl.getAttribLocation(prog13, "aTexcoord");
var sampler13 = gl.getUniformLocation(prog13,"uSampler");
handleLoadedTexture(texture13, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-2, -3.752033, -6.037485, 0, -0.5, 0.5, 0.5,
-2, -3.752033, -6.037485, 1, -0.5, 0.5, 0.5,
-2, -3.752033, -6.037485, 1, 1.5, 0.5, 0.5,
-2, -3.752033, -6.037485, 0, 1.5, 0.5, 0.5,
-1, -3.752033, -6.037485, 0, -0.5, 0.5, 0.5,
-1, -3.752033, -6.037485, 1, -0.5, 0.5, 0.5,
-1, -3.752033, -6.037485, 1, 1.5, 0.5, 0.5,
-1, -3.752033, -6.037485, 0, 1.5, 0.5, 0.5,
0, -3.752033, -6.037485, 0, -0.5, 0.5, 0.5,
0, -3.752033, -6.037485, 1, -0.5, 0.5, 0.5,
0, -3.752033, -6.037485, 1, 1.5, 0.5, 0.5,
0, -3.752033, -6.037485, 0, 1.5, 0.5, 0.5,
1, -3.752033, -6.037485, 0, -0.5, 0.5, 0.5,
1, -3.752033, -6.037485, 1, -0.5, 0.5, 0.5,
1, -3.752033, -6.037485, 1, 1.5, 0.5, 0.5,
1, -3.752033, -6.037485, 0, 1.5, 0.5, 0.5,
2, -3.752033, -6.037485, 0, -0.5, 0.5, 0.5,
2, -3.752033, -6.037485, 1, -0.5, 0.5, 0.5,
2, -3.752033, -6.037485, 1, 1.5, 0.5, 0.5,
2, -3.752033, -6.037485, 0, 1.5, 0.5, 0.5,
3, -3.752033, -6.037485, 0, -0.5, 0.5, 0.5,
3, -3.752033, -6.037485, 1, -0.5, 0.5, 0.5,
3, -3.752033, -6.037485, 1, 1.5, 0.5, 0.5,
3, -3.752033, -6.037485, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<6; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11,
12, 13, 14, 12, 14, 15,
16, 17, 18, 16, 18, 19,
20, 21, 22, 20, 22, 23
]);
var buf13 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf13);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf13 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf13);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc13 = gl.getUniformLocation(prog13,"mvMatrix");
var prMatLoc13 = gl.getUniformLocation(prog13,"prMatrix");
var textScaleLoc13 = gl.getUniformLocation(prog13,"textScale");
// ****** lines object 14 ******
var prog14  = gl.createProgram();
gl.attachShader(prog14, getShader( gl, "testglvshader14" ));
gl.attachShader(prog14, getShader( gl, "testglfshader14" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog14, 0, "aPos");
gl.bindAttribLocation(prog14, 1, "aCol");
gl.linkProgram(prog14);
var v=new Float32Array([
-3.051023, -3, -5.262841,
-3.051023, 3, -5.262841,
-3.051023, -3, -5.262841,
-3.216831, -3, -5.521055,
-3.051023, -2, -5.262841,
-3.216831, -2, -5.521055,
-3.051023, -1, -5.262841,
-3.216831, -1, -5.521055,
-3.051023, 0, -5.262841,
-3.216831, 0, -5.521055,
-3.051023, 1, -5.262841,
-3.216831, 1, -5.521055,
-3.051023, 2, -5.262841,
-3.216831, 2, -5.521055,
-3.051023, 3, -5.262841,
-3.216831, 3, -5.521055
]);
var buf14 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf14);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc14 = gl.getUniformLocation(prog14,"mvMatrix");
var prMatLoc14 = gl.getUniformLocation(prog14,"prMatrix");
// ****** text object 15 ******
var prog15  = gl.createProgram();
gl.attachShader(prog15, getShader( gl, "testglvshader15" ));
gl.attachShader(prog15, getShader( gl, "testglfshader15" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog15, 0, "aPos");
gl.bindAttribLocation(prog15, 1, "aCol");
gl.linkProgram(prog15);
var texts = [
"-3",
"-2",
"-1",
"0",
"1",
"2",
"3"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX15 = texinfo.canvasX;
var canvasY15 = texinfo.canvasY;
var ofsLoc15 = gl.getAttribLocation(prog15, "aOfs");
var texture15 = gl.createTexture();
var texLoc15 = gl.getAttribLocation(prog15, "aTexcoord");
var sampler15 = gl.getUniformLocation(prog15,"uSampler");
handleLoadedTexture(texture15, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-3.548447, -3, -6.037485, 0, -0.5, 0.5, 0.5,
-3.548447, -3, -6.037485, 1, -0.5, 0.5, 0.5,
-3.548447, -3, -6.037485, 1, 1.5, 0.5, 0.5,
-3.548447, -3, -6.037485, 0, 1.5, 0.5, 0.5,
-3.548447, -2, -6.037485, 0, -0.5, 0.5, 0.5,
-3.548447, -2, -6.037485, 1, -0.5, 0.5, 0.5,
-3.548447, -2, -6.037485, 1, 1.5, 0.5, 0.5,
-3.548447, -2, -6.037485, 0, 1.5, 0.5, 0.5,
-3.548447, -1, -6.037485, 0, -0.5, 0.5, 0.5,
-3.548447, -1, -6.037485, 1, -0.5, 0.5, 0.5,
-3.548447, -1, -6.037485, 1, 1.5, 0.5, 0.5,
-3.548447, -1, -6.037485, 0, 1.5, 0.5, 0.5,
-3.548447, 0, -6.037485, 0, -0.5, 0.5, 0.5,
-3.548447, 0, -6.037485, 1, -0.5, 0.5, 0.5,
-3.548447, 0, -6.037485, 1, 1.5, 0.5, 0.5,
-3.548447, 0, -6.037485, 0, 1.5, 0.5, 0.5,
-3.548447, 1, -6.037485, 0, -0.5, 0.5, 0.5,
-3.548447, 1, -6.037485, 1, -0.5, 0.5, 0.5,
-3.548447, 1, -6.037485, 1, 1.5, 0.5, 0.5,
-3.548447, 1, -6.037485, 0, 1.5, 0.5, 0.5,
-3.548447, 2, -6.037485, 0, -0.5, 0.5, 0.5,
-3.548447, 2, -6.037485, 1, -0.5, 0.5, 0.5,
-3.548447, 2, -6.037485, 1, 1.5, 0.5, 0.5,
-3.548447, 2, -6.037485, 0, 1.5, 0.5, 0.5,
-3.548447, 3, -6.037485, 0, -0.5, 0.5, 0.5,
-3.548447, 3, -6.037485, 1, -0.5, 0.5, 0.5,
-3.548447, 3, -6.037485, 1, 1.5, 0.5, 0.5,
-3.548447, 3, -6.037485, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<7; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11,
12, 13, 14, 12, 14, 15,
16, 17, 18, 16, 18, 19,
20, 21, 22, 20, 22, 23,
24, 25, 26, 24, 26, 27
]);
var buf15 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf15);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf15 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf15);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc15 = gl.getUniformLocation(prog15,"mvMatrix");
var prMatLoc15 = gl.getUniformLocation(prog15,"prMatrix");
var textScaleLoc15 = gl.getUniformLocation(prog15,"textScale");
// ****** lines object 16 ******
var prog16  = gl.createProgram();
gl.attachShader(prog16, getShader( gl, "testglvshader16" ));
gl.attachShader(prog16, getShader( gl, "testglfshader16" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog16, 0, "aPos");
gl.bindAttribLocation(prog16, 1, "aCol");
gl.linkProgram(prog16);
var v=new Float32Array([
-3.051023, -3.267752, -4,
-3.051023, -3.267752, 4,
-3.051023, -3.267752, -4,
-3.216831, -3.429179, -4,
-3.051023, -3.267752, -2,
-3.216831, -3.429179, -2,
-3.051023, -3.267752, 0,
-3.216831, -3.429179, 0,
-3.051023, -3.267752, 2,
-3.216831, -3.429179, 2,
-3.051023, -3.267752, 4,
-3.216831, -3.429179, 4
]);
var buf16 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf16);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc16 = gl.getUniformLocation(prog16,"mvMatrix");
var prMatLoc16 = gl.getUniformLocation(prog16,"prMatrix");
// ****** text object 17 ******
var prog17  = gl.createProgram();
gl.attachShader(prog17, getShader( gl, "testglvshader17" ));
gl.attachShader(prog17, getShader( gl, "testglfshader17" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog17, 0, "aPos");
gl.bindAttribLocation(prog17, 1, "aCol");
gl.linkProgram(prog17);
var texts = [
"-4",
"-2",
"0",
"2",
"4"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX17 = texinfo.canvasX;
var canvasY17 = texinfo.canvasY;
var ofsLoc17 = gl.getAttribLocation(prog17, "aOfs");
var texture17 = gl.createTexture();
var texLoc17 = gl.getAttribLocation(prog17, "aTexcoord");
var sampler17 = gl.getUniformLocation(prog17,"uSampler");
handleLoadedTexture(texture17, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-3.548447, -3.752033, -4, 0, -0.5, 0.5, 0.5,
-3.548447, -3.752033, -4, 1, -0.5, 0.5, 0.5,
-3.548447, -3.752033, -4, 1, 1.5, 0.5, 0.5,
-3.548447, -3.752033, -4, 0, 1.5, 0.5, 0.5,
-3.548447, -3.752033, -2, 0, -0.5, 0.5, 0.5,
-3.548447, -3.752033, -2, 1, -0.5, 0.5, 0.5,
-3.548447, -3.752033, -2, 1, 1.5, 0.5, 0.5,
-3.548447, -3.752033, -2, 0, 1.5, 0.5, 0.5,
-3.548447, -3.752033, 0, 0, -0.5, 0.5, 0.5,
-3.548447, -3.752033, 0, 1, -0.5, 0.5, 0.5,
-3.548447, -3.752033, 0, 1, 1.5, 0.5, 0.5,
-3.548447, -3.752033, 0, 0, 1.5, 0.5, 0.5,
-3.548447, -3.752033, 2, 0, -0.5, 0.5, 0.5,
-3.548447, -3.752033, 2, 1, -0.5, 0.5, 0.5,
-3.548447, -3.752033, 2, 1, 1.5, 0.5, 0.5,
-3.548447, -3.752033, 2, 0, 1.5, 0.5, 0.5,
-3.548447, -3.752033, 4, 0, -0.5, 0.5, 0.5,
-3.548447, -3.752033, 4, 1, -0.5, 0.5, 0.5,
-3.548447, -3.752033, 4, 1, 1.5, 0.5, 0.5,
-3.548447, -3.752033, 4, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<5; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11,
12, 13, 14, 12, 14, 15,
16, 17, 18, 16, 18, 19
]);
var buf17 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf17);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf17 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf17);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc17 = gl.getUniformLocation(prog17,"mvMatrix");
var prMatLoc17 = gl.getUniformLocation(prog17,"prMatrix");
var textScaleLoc17 = gl.getUniformLocation(prog17,"textScale");
// ****** lines object 18 ******
var prog18  = gl.createProgram();
gl.attachShader(prog18, getShader( gl, "testglvshader18" ));
gl.attachShader(prog18, getShader( gl, "testglfshader18" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog18, 0, "aPos");
gl.bindAttribLocation(prog18, 1, "aCol");
gl.linkProgram(prog18);
var v=new Float32Array([
-3.051023, -3.267752, -5.262841,
-3.051023, 3.189328, -5.262841,
-3.051023, -3.267752, 5.065743,
-3.051023, 3.189328, 5.065743,
-3.051023, -3.267752, -5.262841,
-3.051023, -3.267752, 5.065743,
-3.051023, 3.189328, -5.262841,
-3.051023, 3.189328, 5.065743,
-3.051023, -3.267752, -5.262841,
3.5813, -3.267752, -5.262841,
-3.051023, -3.267752, 5.065743,
3.5813, -3.267752, 5.065743,
-3.051023, 3.189328, -5.262841,
3.5813, 3.189328, -5.262841,
-3.051023, 3.189328, 5.065743,
3.5813, 3.189328, 5.065743,
3.5813, -3.267752, -5.262841,
3.5813, 3.189328, -5.262841,
3.5813, -3.267752, 5.065743,
3.5813, 3.189328, 5.065743,
3.5813, -3.267752, -5.262841,
3.5813, -3.267752, 5.065743,
3.5813, 3.189328, -5.262841,
3.5813, 3.189328, 5.065743
]);
var buf18 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf18);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc18 = gl.getUniformLocation(prog18,"mvMatrix");
var prMatLoc18 = gl.getUniformLocation(prog18,"prMatrix");
gl.enable(gl.DEPTH_TEST);
gl.depthFunc(gl.LEQUAL);
gl.clearDepth(1.0);
gl.clearColor(1,1,1,1);
var xOffs = yOffs = 0,  drag  = 0;
function multMV(M, v) {
return [M.m11*v[0] + M.m12*v[1] + M.m13*v[2] + M.m14*v[3],
M.m21*v[0] + M.m22*v[1] + M.m23*v[2] + M.m24*v[3],
M.m31*v[0] + M.m32*v[1] + M.m33*v[2] + M.m34*v[3],
M.m41*v[0] + M.m42*v[1] + M.m43*v[2] + M.m44*v[3]];
}
drawScene();
function drawScene(){
gl.depthMask(true);
gl.disable(gl.BLEND);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
// ***** subscene 1 ****
gl.viewport(0, 0, 504, 504);
gl.scissor(0, 0, 504, 504);
gl.clearColor(1, 1, 1, 1);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
var radius = 7.406009;
var distance = 32.95017;
var t = tan(fov[1]*PI/360);
var near = distance - radius;
var far = distance + radius;
var hlen = t*near;
var aspect = 1;
prMatrix.makeIdentity();
if (aspect > 1)
prMatrix.frustum(-hlen*aspect*zoom[1], hlen*aspect*zoom[1], 
-hlen*zoom[1], hlen*zoom[1], near, far);
else  
prMatrix.frustum(-hlen*zoom[1], hlen*zoom[1], 
-hlen*zoom[1]/aspect, hlen*zoom[1]/aspect, 
near, far);
mvMatrix.makeIdentity();
mvMatrix.translate( -0.2651386, 0.03921187, 0.09854865 );
mvMatrix.scale( 1.207348, 1.240115, 0.7752779 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.95017);
// ****** points object 7 *******
gl.useProgram(prog7);
gl.bindBuffer(gl.ARRAY_BUFFER, buf7);
gl.uniformMatrix4fv( prMatLoc7, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc7, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.enableVertexAttribArray( colLoc );
gl.vertexAttribPointer(colLoc, 4, gl.FLOAT, false, 28, 12);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawArrays(gl.POINTS, 0, 1000);
// ****** text object 9 *******
gl.useProgram(prog9);
gl.bindBuffer(gl.ARRAY_BUFFER, buf9);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf9);
gl.uniformMatrix4fv( prMatLoc9, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc9, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc9, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc9 );
gl.vertexAttribPointer(texLoc9, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture9);
gl.uniform1i( sampler9, 0);
gl.enableVertexAttribArray( ofsLoc9 );
gl.vertexAttribPointer(ofsLoc9, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** text object 10 *******
gl.useProgram(prog10);
gl.bindBuffer(gl.ARRAY_BUFFER, buf10);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf10);
gl.uniformMatrix4fv( prMatLoc10, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc10, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc10, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc10 );
gl.vertexAttribPointer(texLoc10, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture10);
gl.uniform1i( sampler10, 0);
gl.enableVertexAttribArray( ofsLoc10 );
gl.vertexAttribPointer(ofsLoc10, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** text object 11 *******
gl.useProgram(prog11);
gl.bindBuffer(gl.ARRAY_BUFFER, buf11);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf11);
gl.uniformMatrix4fv( prMatLoc11, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc11, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc11, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc11 );
gl.vertexAttribPointer(texLoc11, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture11);
gl.uniform1i( sampler11, 0);
gl.enableVertexAttribArray( ofsLoc11 );
gl.vertexAttribPointer(ofsLoc11, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** lines object 12 *******
gl.useProgram(prog12);
gl.bindBuffer(gl.ARRAY_BUFFER, buf12);
gl.uniformMatrix4fv( prMatLoc12, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc12, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 14);
// ****** text object 13 *******
gl.useProgram(prog13);
gl.bindBuffer(gl.ARRAY_BUFFER, buf13);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf13);
gl.uniformMatrix4fv( prMatLoc13, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc13, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc13, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc13 );
gl.vertexAttribPointer(texLoc13, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture13);
gl.uniform1i( sampler13, 0);
gl.enableVertexAttribArray( ofsLoc13 );
gl.vertexAttribPointer(ofsLoc13, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
// ****** lines object 14 *******
gl.useProgram(prog14);
gl.bindBuffer(gl.ARRAY_BUFFER, buf14);
gl.uniformMatrix4fv( prMatLoc14, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc14, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 16);
// ****** text object 15 *******
gl.useProgram(prog15);
gl.bindBuffer(gl.ARRAY_BUFFER, buf15);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf15);
gl.uniformMatrix4fv( prMatLoc15, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc15, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc15, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc15 );
gl.vertexAttribPointer(texLoc15, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture15);
gl.uniform1i( sampler15, 0);
gl.enableVertexAttribArray( ofsLoc15 );
gl.vertexAttribPointer(ofsLoc15, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 42, gl.UNSIGNED_SHORT, 0);
// ****** lines object 16 *******
gl.useProgram(prog16);
gl.bindBuffer(gl.ARRAY_BUFFER, buf16);
gl.uniformMatrix4fv( prMatLoc16, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc16, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 12);
// ****** text object 17 *******
gl.useProgram(prog17);
gl.bindBuffer(gl.ARRAY_BUFFER, buf17);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf17);
gl.uniformMatrix4fv( prMatLoc17, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc17, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc17, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc17 );
gl.vertexAttribPointer(texLoc17, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture17);
gl.uniform1i( sampler17, 0);
gl.enableVertexAttribArray( ofsLoc17 );
gl.vertexAttribPointer(ofsLoc17, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
// ****** lines object 18 *******
gl.useProgram(prog18);
gl.bindBuffer(gl.ARRAY_BUFFER, buf18);
gl.uniformMatrix4fv( prMatLoc18, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc18, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 24);
gl.flush ();
}
var vpx0 = {
1: 0
};
var vpy0 = {
1: 0
};
var vpWidths = {
1: 504
};
var vpHeights = {
1: 504
};
var activeModel = {
1: 1
};
var activeProjection = {
1: 1
};
var whichSubscene = function(coords){
if (0 <= coords.x && coords.x <= 504 && 0 <= coords.y && coords.y <= 504) return(1);
return(1);
}
var translateCoords = function(subsceneid, coords){
return {x:coords.x - vpx0[subsceneid], y:coords.y - vpy0[subsceneid]};
}
var vlen = function(v) {
return sqrt(v[0]*v[0] + v[1]*v[1] + v[2]*v[2])
}
var xprod = function(a, b) {
return [a[1]*b[2] - a[2]*b[1],
a[2]*b[0] - a[0]*b[2],
a[0]*b[1] - a[1]*b[0]];
}
var screenToVector = function(x, y) {
var width = vpWidths[activeSubscene];
var height = vpHeights[activeSubscene];
var radius = max(width, height)/2.0;
var cx = width/2.0;
var cy = height/2.0;
var px = (x-cx)/radius;
var py = (y-cy)/radius;
var plen = sqrt(px*px+py*py);
if (plen > 1.e-6) { 
px = px/plen;
py = py/plen;
}
var angle = (SQRT2 - plen)/SQRT2*PI/2;
var z = sin(angle);
var zlen = sqrt(1.0 - z*z);
px = px * zlen;
py = py * zlen;
return [px, py, z];
}
var rotBase;
var trackballdown = function(x,y) {
rotBase = screenToVector(x, y);
saveMat.load(userMatrix[activeModel[activeSubscene]]);
}
var trackballmove = function(x,y) {
var rotCurrent = screenToVector(x,y);
var dot = rotBase[0]*rotCurrent[0] + 
rotBase[1]*rotCurrent[1] + 
rotBase[2]*rotCurrent[2];
var angle = acos( dot/vlen(rotBase)/vlen(rotCurrent) )*180./PI;
var axis = xprod(rotBase, rotCurrent);
userMatrix[activeModel[activeSubscene]].load(saveMat);
userMatrix[activeModel[activeSubscene]].rotate(angle, axis[0], axis[1], axis[2]);
drawScene();
}
var y0zoom = 0;
var zoom0 = 1;
var zoomdown = function(x, y) {
y0zoom = y;
zoom0 = log(zoom[activeProjection[activeSubscene]]);
}
var zoommove = function(x, y) {
zoom[activeProjection[activeSubscene]] = exp(zoom0 + (y-y0zoom)/height);
drawScene();
}
var y0fov = 0;
var fov0 = 1;
var fovdown = function(x, y) {
y0fov = y;
fov0 = fov[activeProjection[activeSubscene]];
}
var fovmove = function(x, y) {
fov[activeProjection[activeSubscene]] = max(1, min(179, fov0 + 180*(y-y0fov)/height));
drawScene();
}
var mousedown = [trackballdown, zoomdown, fovdown];
var mousemove = [trackballmove, zoommove, fovmove];
function relMouseCoords(event){
var totalOffsetX = 0;
var totalOffsetY = 0;
var currentElement = canvas;
do{
totalOffsetX += currentElement.offsetLeft;
totalOffsetY += currentElement.offsetTop;
}
while(currentElement = currentElement.offsetParent)
var canvasX = event.pageX - totalOffsetX;
var canvasY = event.pageY - totalOffsetY;
return {x:canvasX, y:canvasY}
}
canvas.onmousedown = function ( ev ){
if (!ev.which) // Use w3c defns in preference to MS
switch (ev.button) {
case 0: ev.which = 1; break;
case 1: 
case 4: ev.which = 2; break;
case 2: ev.which = 3;
}
drag = ev.which;
var f = mousedown[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height-coords.y;
activeSubscene = whichSubscene(coords);
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y); 
ev.preventDefault();
}
}    
canvas.onmouseup = function ( ev ){	
drag = 0;
}
canvas.onmouseout = canvas.onmouseup;
canvas.onmousemove = function ( ev ){
if ( drag == 0 ) return;
var f = mousemove[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height - coords.y;
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y);
}
}
var wheelHandler = function(ev) {
var del = 1.1;
if (ev.shiftKey) del = 1.01;
var ds = ((ev.detail || ev.wheelDelta) > 0) ? del : (1 / del);
zoom[activeProjection[activeSubscene]] *= ds;
drawScene();
ev.preventDefault();
};
canvas.addEventListener("DOMMouseScroll", wheelHandler, false);
canvas.addEventListener("mousewheel", wheelHandler, false);
}
</script>
<canvas id="testglcanvas" width="1" height="1"></canvas> 
<p id="testgldebug">
You must enable Javascript to view this page properly.</p>
<script>testglwebGLStart();</script>

The following a 3D image is of Atrazine rendered from the 3D conformer file derived from here (http://pubchem.ncbi.nlm.nih.gov/compound/2256). The atoms are represented as spheres Nitrogen as blue, carbon as black, hydrogen as white, and chlorine as blue.


