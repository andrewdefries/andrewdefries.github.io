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
-3.229197, -2.323563, -1.357111, 1, 0, 0, 1,
-2.776536, -1.912669, -3.44369, 1, 0.007843138, 0, 1,
-2.632364, -0.5422308, -1.085472, 1, 0.01176471, 0, 1,
-2.574897, 0.09012622, -1.687012, 1, 0.01960784, 0, 1,
-2.527442, -0.5474593, -1.228524, 1, 0.02352941, 0, 1,
-2.523688, 1.046694, -3.771243, 1, 0.03137255, 0, 1,
-2.497432, -0.1671659, -1.047552, 1, 0.03529412, 0, 1,
-2.480511, -0.2087512, -0.6236799, 1, 0.04313726, 0, 1,
-2.467075, -1.79803, -2.261998, 1, 0.04705882, 0, 1,
-2.449295, 0.01112428, -2.307871, 1, 0.05490196, 0, 1,
-2.426673, -2.041821, -1.415125, 1, 0.05882353, 0, 1,
-2.417567, 0.2638709, -1.939434, 1, 0.06666667, 0, 1,
-2.375694, -0.6106001, -2.791247, 1, 0.07058824, 0, 1,
-2.28472, -0.8602055, -2.500134, 1, 0.07843138, 0, 1,
-2.267676, -0.3889899, -0.5423198, 1, 0.08235294, 0, 1,
-2.254146, 0.233185, -2.004939, 1, 0.09019608, 0, 1,
-2.230434, 2.09358, -2.246372, 1, 0.09411765, 0, 1,
-2.208272, -0.8652048, -1.498081, 1, 0.1019608, 0, 1,
-2.203857, 1.353654, -1.451777, 1, 0.1098039, 0, 1,
-2.154893, -0.03020103, 1.171697, 1, 0.1137255, 0, 1,
-2.12104, 0.7125118, -1.843861, 1, 0.1215686, 0, 1,
-2.118367, 0.07255332, 0.2597144, 1, 0.1254902, 0, 1,
-2.109996, -1.690833, -3.572182, 1, 0.1333333, 0, 1,
-2.100824, -0.1288079, -1.772531, 1, 0.1372549, 0, 1,
-2.052746, -0.2862794, -1.455729, 1, 0.145098, 0, 1,
-2.01646, 1.389059, -0.03617237, 1, 0.1490196, 0, 1,
-2.01634, -0.5050241, -2.001289, 1, 0.1568628, 0, 1,
-2.010635, -1.242417, -2.644563, 1, 0.1607843, 0, 1,
-1.994769, 0.01474091, -2.785755, 1, 0.1686275, 0, 1,
-1.933197, -0.3344705, -3.833781, 1, 0.172549, 0, 1,
-1.89539, -1.167176, -3.101158, 1, 0.1803922, 0, 1,
-1.845408, 0.6839415, 0.4188883, 1, 0.1843137, 0, 1,
-1.843233, 0.110585, -1.789061, 1, 0.1921569, 0, 1,
-1.820096, -1.07536, -1.82654, 1, 0.1960784, 0, 1,
-1.818018, 2.022937, -0.7341697, 1, 0.2039216, 0, 1,
-1.812484, 0.7980053, -1.206135, 1, 0.2117647, 0, 1,
-1.789985, 0.1163169, -1.795159, 1, 0.2156863, 0, 1,
-1.789308, -0.9752504, -3.492133, 1, 0.2235294, 0, 1,
-1.785837, -0.06772728, -1.142399, 1, 0.227451, 0, 1,
-1.777001, -0.3943039, -2.947053, 1, 0.2352941, 0, 1,
-1.767812, 0.5301206, -1.054591, 1, 0.2392157, 0, 1,
-1.754788, -0.7131023, -2.184823, 1, 0.2470588, 0, 1,
-1.744255, 1.766631, -0.761107, 1, 0.2509804, 0, 1,
-1.710976, -0.6684803, -1.58906, 1, 0.2588235, 0, 1,
-1.705493, -0.2162923, -1.648029, 1, 0.2627451, 0, 1,
-1.697786, -0.6256468, -1.998538, 1, 0.2705882, 0, 1,
-1.669556, 1.016382, -0.1887663, 1, 0.2745098, 0, 1,
-1.658251, -0.6877428, -3.226406, 1, 0.282353, 0, 1,
-1.644405, 0.1565426, -0.6851687, 1, 0.2862745, 0, 1,
-1.631302, 2.21648, -0.2677344, 1, 0.2941177, 0, 1,
-1.627094, 0.5052707, -0.05733831, 1, 0.3019608, 0, 1,
-1.613797, 1.690202, -1.146316, 1, 0.3058824, 0, 1,
-1.602212, -0.2296877, -0.5403171, 1, 0.3137255, 0, 1,
-1.580728, 1.656716, -2.284669, 1, 0.3176471, 0, 1,
-1.548682, -0.6324777, -2.014889, 1, 0.3254902, 0, 1,
-1.546261, -0.5363458, -1.128399, 1, 0.3294118, 0, 1,
-1.536422, 0.4334334, -0.8683311, 1, 0.3372549, 0, 1,
-1.521471, 1.183719, -0.384619, 1, 0.3411765, 0, 1,
-1.518803, 0.4236426, -2.470483, 1, 0.3490196, 0, 1,
-1.515613, 0.1884887, -0.7842191, 1, 0.3529412, 0, 1,
-1.509424, -0.1695798, -1.925582, 1, 0.3607843, 0, 1,
-1.502314, 0.09673943, -1.131992, 1, 0.3647059, 0, 1,
-1.485289, 0.6834791, -1.802406, 1, 0.372549, 0, 1,
-1.485146, 0.3928527, -1.915379, 1, 0.3764706, 0, 1,
-1.4822, 0.9098646, -1.273364, 1, 0.3843137, 0, 1,
-1.478245, 0.3517034, -1.81088, 1, 0.3882353, 0, 1,
-1.475483, 0.0194212, -2.421529, 1, 0.3960784, 0, 1,
-1.467211, -0.2182218, -1.83162, 1, 0.4039216, 0, 1,
-1.463024, -1.503415, -4.031197, 1, 0.4078431, 0, 1,
-1.462183, 0.6097047, -1.200124, 1, 0.4156863, 0, 1,
-1.457498, -0.4387932, 0.07866428, 1, 0.4196078, 0, 1,
-1.457283, -0.8017704, -2.707195, 1, 0.427451, 0, 1,
-1.456757, 1.094198, -0.8886639, 1, 0.4313726, 0, 1,
-1.454107, -1.361208, -0.6692143, 1, 0.4392157, 0, 1,
-1.437425, 0.8568154, -0.817159, 1, 0.4431373, 0, 1,
-1.420476, -0.6009063, -1.223169, 1, 0.4509804, 0, 1,
-1.415124, -0.5374441, -3.695071, 1, 0.454902, 0, 1,
-1.410182, 0.6253264, 0.3497728, 1, 0.4627451, 0, 1,
-1.406994, 0.4268471, -1.403698, 1, 0.4666667, 0, 1,
-1.398432, 0.1739672, -2.071884, 1, 0.4745098, 0, 1,
-1.396154, 0.2641348, -0.9041418, 1, 0.4784314, 0, 1,
-1.390056, 0.5520868, 0.7755729, 1, 0.4862745, 0, 1,
-1.385963, 0.2570174, -0.1605744, 1, 0.4901961, 0, 1,
-1.385002, -0.2702236, -0.02734577, 1, 0.4980392, 0, 1,
-1.383838, -0.4391478, -1.527002, 1, 0.5058824, 0, 1,
-1.380543, -0.3151311, -1.750448, 1, 0.509804, 0, 1,
-1.379143, -0.5300546, -2.543406, 1, 0.5176471, 0, 1,
-1.378115, -1.920359, -2.360569, 1, 0.5215687, 0, 1,
-1.370087, -0.4719791, -1.179554, 1, 0.5294118, 0, 1,
-1.360343, -0.3267622, -0.9056717, 1, 0.5333334, 0, 1,
-1.356321, 1.010219, 0.1898566, 1, 0.5411765, 0, 1,
-1.346352, 0.09704915, -1.812462, 1, 0.5450981, 0, 1,
-1.325917, 0.002449858, -2.848032, 1, 0.5529412, 0, 1,
-1.323509, -0.4178262, -0.5085645, 1, 0.5568628, 0, 1,
-1.32045, 0.04172922, -2.960299, 1, 0.5647059, 0, 1,
-1.307744, 0.5387484, -1.988459, 1, 0.5686275, 0, 1,
-1.307105, 0.8337719, -0.06008778, 1, 0.5764706, 0, 1,
-1.293516, 0.8080946, -0.8840475, 1, 0.5803922, 0, 1,
-1.293114, 0.7456785, -0.7053463, 1, 0.5882353, 0, 1,
-1.286447, 1.354715, -0.736881, 1, 0.5921569, 0, 1,
-1.281015, -0.3074058, -0.9885269, 1, 0.6, 0, 1,
-1.280984, -1.183333, -2.544772, 1, 0.6078432, 0, 1,
-1.275399, -0.8657776, -2.509243, 1, 0.6117647, 0, 1,
-1.269678, 2.333165, 0.5294253, 1, 0.6196079, 0, 1,
-1.254874, -0.7037888, -0.3058259, 1, 0.6235294, 0, 1,
-1.247242, 0.4858876, -2.883523, 1, 0.6313726, 0, 1,
-1.23723, 0.952287, -0.7088467, 1, 0.6352941, 0, 1,
-1.236081, -0.8549021, -1.487606, 1, 0.6431373, 0, 1,
-1.233238, -0.5832986, -3.153489, 1, 0.6470588, 0, 1,
-1.226801, 0.8401804, -3.307168, 1, 0.654902, 0, 1,
-1.22167, -2.551664, -4.043676, 1, 0.6588235, 0, 1,
-1.221578, -0.5184417, -4.121341, 1, 0.6666667, 0, 1,
-1.221091, 0.907479, -1.177773, 1, 0.6705883, 0, 1,
-1.21815, 0.1442746, -2.754399, 1, 0.6784314, 0, 1,
-1.210033, 0.1556671, -2.769555, 1, 0.682353, 0, 1,
-1.208745, -1.246269, -2.008405, 1, 0.6901961, 0, 1,
-1.201581, -0.5588713, -2.789393, 1, 0.6941177, 0, 1,
-1.191002, 1.790874, 0.9206787, 1, 0.7019608, 0, 1,
-1.178599, -0.736015, -0.3547791, 1, 0.7098039, 0, 1,
-1.174449, -0.9456132, -3.5785, 1, 0.7137255, 0, 1,
-1.17317, -0.2558917, -1.039234, 1, 0.7215686, 0, 1,
-1.170798, 1.129586, 2.222444, 1, 0.7254902, 0, 1,
-1.168824, 0.7720518, -2.640387, 1, 0.7333333, 0, 1,
-1.166731, 1.062939, -2.367641, 1, 0.7372549, 0, 1,
-1.161371, 0.5737193, -2.227573, 1, 0.7450981, 0, 1,
-1.154955, 1.11814, -0.1500583, 1, 0.7490196, 0, 1,
-1.149009, -0.2042828, -2.275855, 1, 0.7568628, 0, 1,
-1.142594, 0.6104879, -1.005077, 1, 0.7607843, 0, 1,
-1.134748, 0.9522035, -0.9432138, 1, 0.7686275, 0, 1,
-1.128173, -0.2791076, -0.985248, 1, 0.772549, 0, 1,
-1.119998, -0.606654, -0.8800611, 1, 0.7803922, 0, 1,
-1.110247, 1.947161, -0.9718753, 1, 0.7843137, 0, 1,
-1.109636, -1.856129, -1.247727, 1, 0.7921569, 0, 1,
-1.109357, -0.2747043, -2.5849, 1, 0.7960784, 0, 1,
-1.108906, -0.5705737, -4.124306, 1, 0.8039216, 0, 1,
-1.108485, 1.329643, -1.520638, 1, 0.8117647, 0, 1,
-1.101541, -0.02300824, -1.619198, 1, 0.8156863, 0, 1,
-1.097313, 0.8491911, -1.786629, 1, 0.8235294, 0, 1,
-1.093692, 0.5393306, -0.976939, 1, 0.827451, 0, 1,
-1.088662, 0.02167864, -2.657073, 1, 0.8352941, 0, 1,
-1.085867, -0.7820088, -3.273895, 1, 0.8392157, 0, 1,
-1.085746, -0.1636875, -0.02421881, 1, 0.8470588, 0, 1,
-1.082967, -0.665808, -1.52987, 1, 0.8509804, 0, 1,
-1.082753, -0.7019392, -2.843985, 1, 0.8588235, 0, 1,
-1.080027, 2.006881, 0.5609429, 1, 0.8627451, 0, 1,
-1.07762, -0.3815901, -1.346213, 1, 0.8705882, 0, 1,
-1.077166, 0.02876803, -1.259166, 1, 0.8745098, 0, 1,
-1.073127, 0.4110864, -3.29805, 1, 0.8823529, 0, 1,
-1.066962, -0.2660698, -1.288971, 1, 0.8862745, 0, 1,
-1.058854, 0.457856, -1.762679, 1, 0.8941177, 0, 1,
-1.057758, 0.06472988, -2.668357, 1, 0.8980392, 0, 1,
-1.057746, 0.28509, -0.1131206, 1, 0.9058824, 0, 1,
-1.053202, 1.666668, -0.06643344, 1, 0.9137255, 0, 1,
-1.052444, 0.1313988, -0.9962707, 1, 0.9176471, 0, 1,
-1.043231, -1.004469, -2.506211, 1, 0.9254902, 0, 1,
-1.042992, 0.2150324, -5.15984, 1, 0.9294118, 0, 1,
-1.042226, 0.5887942, -2.852995, 1, 0.9372549, 0, 1,
-1.032881, -1.31528, -0.9914312, 1, 0.9411765, 0, 1,
-1.028136, -0.09128194, -1.602944, 1, 0.9490196, 0, 1,
-1.024347, -0.9703851, -1.94336, 1, 0.9529412, 0, 1,
-1.022456, 0.1306598, -1.536585, 1, 0.9607843, 0, 1,
-1.021824, 0.2176247, -1.268277, 1, 0.9647059, 0, 1,
-1.020951, 2.719659, -0.2085699, 1, 0.972549, 0, 1,
-1.018275, -0.9396954, -2.367789, 1, 0.9764706, 0, 1,
-1.014428, -0.6709189, -3.89124, 1, 0.9843137, 0, 1,
-1.013558, 0.2300932, -1.811484, 1, 0.9882353, 0, 1,
-1.012256, 2.601932, -0.3944248, 1, 0.9960784, 0, 1,
-1.010203, 0.1610815, -0.1461968, 0.9960784, 1, 0, 1,
-1.007159, -0.8262745, -3.141178, 0.9921569, 1, 0, 1,
-1.006633, 0.8079877, -0.6171658, 0.9843137, 1, 0, 1,
-1.001429, -0.4561939, -1.739132, 0.9803922, 1, 0, 1,
-0.996794, 0.3594168, -2.201345, 0.972549, 1, 0, 1,
-0.9963257, 1.049295, -0.7690781, 0.9686275, 1, 0, 1,
-0.990217, 0.9667594, -1.249726, 0.9607843, 1, 0, 1,
-0.9798775, 0.05861021, -2.277389, 0.9568627, 1, 0, 1,
-0.9745806, 2.236404, 0.05242947, 0.9490196, 1, 0, 1,
-0.9718277, -0.6680605, -0.2032103, 0.945098, 1, 0, 1,
-0.9691368, 0.2161713, -3.948247, 0.9372549, 1, 0, 1,
-0.965232, -0.9077867, -3.149777, 0.9333333, 1, 0, 1,
-0.9557476, 0.4318853, -2.490301, 0.9254902, 1, 0, 1,
-0.9556931, -1.051682, -2.672933, 0.9215686, 1, 0, 1,
-0.9509935, 0.01583767, -0.5510428, 0.9137255, 1, 0, 1,
-0.9491304, 1.419793, -0.6360007, 0.9098039, 1, 0, 1,
-0.9472333, -0.08387826, -1.329088, 0.9019608, 1, 0, 1,
-0.9433903, -0.08078358, -1.36092, 0.8941177, 1, 0, 1,
-0.942863, 0.7139553, 0.03015629, 0.8901961, 1, 0, 1,
-0.9422296, -0.741634, -2.072535, 0.8823529, 1, 0, 1,
-0.9345003, -1.073676, -2.663098, 0.8784314, 1, 0, 1,
-0.9338906, -2.100083, -2.044776, 0.8705882, 1, 0, 1,
-0.9214985, 0.3652897, 0.00332747, 0.8666667, 1, 0, 1,
-0.915595, -0.3109962, -2.411771, 0.8588235, 1, 0, 1,
-0.910167, 0.1526184, -0.8850822, 0.854902, 1, 0, 1,
-0.9066361, -0.5599734, -2.52814, 0.8470588, 1, 0, 1,
-0.9013236, 0.1956198, -0.9983894, 0.8431373, 1, 0, 1,
-0.9005256, 1.329914, -2.244859, 0.8352941, 1, 0, 1,
-0.899947, -1.375185, -3.012997, 0.8313726, 1, 0, 1,
-0.8955576, -0.6814292, -1.343861, 0.8235294, 1, 0, 1,
-0.8952488, 1.425431, -2.40342, 0.8196079, 1, 0, 1,
-0.8934321, -1.054933, -2.42625, 0.8117647, 1, 0, 1,
-0.8927343, -0.2765116, 0.1675526, 0.8078431, 1, 0, 1,
-0.8872705, -2.084794, -3.212546, 0.8, 1, 0, 1,
-0.8628775, 1.26067, -1.027593, 0.7921569, 1, 0, 1,
-0.85989, 0.3101988, -0.7807869, 0.7882353, 1, 0, 1,
-0.8576934, -1.797315, -4.375153, 0.7803922, 1, 0, 1,
-0.8331661, -0.5764312, -3.933527, 0.7764706, 1, 0, 1,
-0.8278594, -0.1738904, -2.830848, 0.7686275, 1, 0, 1,
-0.8270115, -0.2859735, -1.042454, 0.7647059, 1, 0, 1,
-0.822704, -0.3835917, -1.182281, 0.7568628, 1, 0, 1,
-0.8209175, -0.94305, -2.664722, 0.7529412, 1, 0, 1,
-0.8189113, 1.352988, 0.2166489, 0.7450981, 1, 0, 1,
-0.8157895, 2.574484, -2.421904, 0.7411765, 1, 0, 1,
-0.8150548, 1.331454, -0.2217634, 0.7333333, 1, 0, 1,
-0.8112667, 0.2068381, -0.8527117, 0.7294118, 1, 0, 1,
-0.8093967, -0.5710567, -3.045059, 0.7215686, 1, 0, 1,
-0.8093322, 0.3537348, -1.390992, 0.7176471, 1, 0, 1,
-0.8067224, 0.6881642, -0.3941823, 0.7098039, 1, 0, 1,
-0.7965878, -1.363738, -2.322795, 0.7058824, 1, 0, 1,
-0.7937884, 0.1550539, -0.9560844, 0.6980392, 1, 0, 1,
-0.7935469, -0.2517859, -2.992106, 0.6901961, 1, 0, 1,
-0.7931026, -0.1588643, -1.427823, 0.6862745, 1, 0, 1,
-0.7924252, -1.029312, -3.769066, 0.6784314, 1, 0, 1,
-0.7867615, 0.2903226, 0.8408217, 0.6745098, 1, 0, 1,
-0.785578, 1.624889, 1.70229, 0.6666667, 1, 0, 1,
-0.7843862, 1.401685, -2.329942, 0.6627451, 1, 0, 1,
-0.7782007, 0.3779619, -0.01993457, 0.654902, 1, 0, 1,
-0.7773343, 0.3346719, -0.2496749, 0.6509804, 1, 0, 1,
-0.7757738, -1.347029, -3.211152, 0.6431373, 1, 0, 1,
-0.7719512, -1.385721, -3.33462, 0.6392157, 1, 0, 1,
-0.7708346, -0.3075457, -3.801016, 0.6313726, 1, 0, 1,
-0.7704641, -1.061742, -2.677887, 0.627451, 1, 0, 1,
-0.7506248, -1.057347, -1.188007, 0.6196079, 1, 0, 1,
-0.7497257, 0.05929152, -0.110379, 0.6156863, 1, 0, 1,
-0.7444847, -0.7180997, -3.368668, 0.6078432, 1, 0, 1,
-0.7420151, 0.8317817, 0.1481746, 0.6039216, 1, 0, 1,
-0.7394843, 0.7598134, -1.303691, 0.5960785, 1, 0, 1,
-0.7376233, 0.5925889, -0.1056696, 0.5882353, 1, 0, 1,
-0.7367148, 0.08504053, -0.7848344, 0.5843138, 1, 0, 1,
-0.7342062, -0.3910511, -1.70884, 0.5764706, 1, 0, 1,
-0.7286312, 1.109006, -1.384041, 0.572549, 1, 0, 1,
-0.7272866, 0.5999478, -0.663633, 0.5647059, 1, 0, 1,
-0.7262279, -0.8887496, -3.06141, 0.5607843, 1, 0, 1,
-0.7247846, -0.9415102, -2.136097, 0.5529412, 1, 0, 1,
-0.723123, 0.4633232, 0.6171679, 0.5490196, 1, 0, 1,
-0.7214945, -1.074443, -1.426227, 0.5411765, 1, 0, 1,
-0.7195999, 1.012161, -0.4670483, 0.5372549, 1, 0, 1,
-0.717665, 0.4825582, 0.5590954, 0.5294118, 1, 0, 1,
-0.716961, 1.257112, -1.325824, 0.5254902, 1, 0, 1,
-0.7131195, -1.600056, -1.834164, 0.5176471, 1, 0, 1,
-0.7123945, 0.805727, -0.2894319, 0.5137255, 1, 0, 1,
-0.7092645, -0.7254479, -1.905551, 0.5058824, 1, 0, 1,
-0.708243, -0.1107244, -1.788888, 0.5019608, 1, 0, 1,
-0.7037864, -0.6942278, -2.102159, 0.4941176, 1, 0, 1,
-0.6921482, -0.02400561, -1.154305, 0.4862745, 1, 0, 1,
-0.6879812, -0.876921, -4.97128, 0.4823529, 1, 0, 1,
-0.6869619, -1.518109, -2.995978, 0.4745098, 1, 0, 1,
-0.6846131, 0.05256404, -2.240391, 0.4705882, 1, 0, 1,
-0.6832591, 1.148292, -1.746335, 0.4627451, 1, 0, 1,
-0.6827656, -2.510189, -2.542212, 0.4588235, 1, 0, 1,
-0.6809725, 1.040787, 0.9803671, 0.4509804, 1, 0, 1,
-0.6805963, -0.2147444, -1.641122, 0.4470588, 1, 0, 1,
-0.6745833, 0.8578206, -0.01125575, 0.4392157, 1, 0, 1,
-0.6715347, 0.6263969, -0.4128937, 0.4352941, 1, 0, 1,
-0.6688255, 1.546047, -0.4391, 0.427451, 1, 0, 1,
-0.6664043, -0.2560308, -2.932696, 0.4235294, 1, 0, 1,
-0.6637847, -2.035913, -3.521374, 0.4156863, 1, 0, 1,
-0.6605616, 0.6828187, -1.307413, 0.4117647, 1, 0, 1,
-0.6584597, 0.4027572, -1.746617, 0.4039216, 1, 0, 1,
-0.6569263, -0.6893696, 0.9257842, 0.3960784, 1, 0, 1,
-0.6567379, -0.1335991, -1.838794, 0.3921569, 1, 0, 1,
-0.6557672, -0.8478802, -4.359938, 0.3843137, 1, 0, 1,
-0.6554187, 0.2722357, -1.706826, 0.3803922, 1, 0, 1,
-0.6550057, 0.5148162, -1.586152, 0.372549, 1, 0, 1,
-0.6543758, 0.3482379, -0.6402618, 0.3686275, 1, 0, 1,
-0.6457809, 0.4726403, -1.621774, 0.3607843, 1, 0, 1,
-0.6439944, 0.2975317, -0.3064384, 0.3568628, 1, 0, 1,
-0.6362011, 0.3237606, 0.5191985, 0.3490196, 1, 0, 1,
-0.6346166, 1.004522, 0.218744, 0.345098, 1, 0, 1,
-0.6326643, -0.3632312, 1.071497, 0.3372549, 1, 0, 1,
-0.6287444, 1.143935, -0.9352325, 0.3333333, 1, 0, 1,
-0.6260064, 0.8080894, 0.04377393, 0.3254902, 1, 0, 1,
-0.6250821, -0.05182088, -1.459403, 0.3215686, 1, 0, 1,
-0.62181, -0.121634, 0.7691172, 0.3137255, 1, 0, 1,
-0.6183252, 1.238804, 0.9394976, 0.3098039, 1, 0, 1,
-0.616748, -0.2511888, -1.368785, 0.3019608, 1, 0, 1,
-0.6118331, -0.9482172, -2.783635, 0.2941177, 1, 0, 1,
-0.610365, -1.020531, -2.452284, 0.2901961, 1, 0, 1,
-0.6090681, 0.7715254, -1.234824, 0.282353, 1, 0, 1,
-0.6078946, 0.982152, -1.698259, 0.2784314, 1, 0, 1,
-0.6077997, -0.2880539, -1.894659, 0.2705882, 1, 0, 1,
-0.6067163, -0.907023, -3.067078, 0.2666667, 1, 0, 1,
-0.5951112, -0.8648816, -3.80501, 0.2588235, 1, 0, 1,
-0.5899931, -0.1923261, -2.994883, 0.254902, 1, 0, 1,
-0.5883958, 0.6863081, -1.884425, 0.2470588, 1, 0, 1,
-0.585551, 0.1815143, -0.819995, 0.2431373, 1, 0, 1,
-0.5845613, -0.5866439, -2.107655, 0.2352941, 1, 0, 1,
-0.5825088, -2.016824, -3.332387, 0.2313726, 1, 0, 1,
-0.5711261, -0.4477641, -0.2896256, 0.2235294, 1, 0, 1,
-0.5710026, -1.155142, -3.920322, 0.2196078, 1, 0, 1,
-0.5703408, 0.7552128, -1.218778, 0.2117647, 1, 0, 1,
-0.569566, 1.092926, 1.013608, 0.2078431, 1, 0, 1,
-0.5673227, 0.4115221, -2.94839, 0.2, 1, 0, 1,
-0.5666095, 0.3084277, -1.536874, 0.1921569, 1, 0, 1,
-0.5529594, 1.001173, -1.101386, 0.1882353, 1, 0, 1,
-0.5509241, 0.6181513, -0.9848225, 0.1803922, 1, 0, 1,
-0.5507246, 1.457578, 0.1036107, 0.1764706, 1, 0, 1,
-0.5426446, -1.082525, -2.224458, 0.1686275, 1, 0, 1,
-0.5410049, 0.4546466, -1.170574, 0.1647059, 1, 0, 1,
-0.5396873, 2.539773, -0.3720383, 0.1568628, 1, 0, 1,
-0.5365416, -0.1128794, -1.063026, 0.1529412, 1, 0, 1,
-0.5318797, 0.6072536, -1.870153, 0.145098, 1, 0, 1,
-0.5225013, 0.3567535, -1.061501, 0.1411765, 1, 0, 1,
-0.5201999, -0.4087918, -3.801855, 0.1333333, 1, 0, 1,
-0.5178488, 0.5470264, -0.5844206, 0.1294118, 1, 0, 1,
-0.5170121, -0.4492381, -2.73463, 0.1215686, 1, 0, 1,
-0.5165492, 0.6351845, 0.8711051, 0.1176471, 1, 0, 1,
-0.5082146, -0.6402465, -4.397666, 0.1098039, 1, 0, 1,
-0.5079915, 1.036042, -0.8838518, 0.1058824, 1, 0, 1,
-0.5074249, -0.199435, -0.7413658, 0.09803922, 1, 0, 1,
-0.4987565, -1.323778, -3.148446, 0.09019608, 1, 0, 1,
-0.4976152, 0.3864679, 1.031167, 0.08627451, 1, 0, 1,
-0.4968157, 0.4416323, -0.1771759, 0.07843138, 1, 0, 1,
-0.4953395, -1.592849, -3.984717, 0.07450981, 1, 0, 1,
-0.493952, -0.8360335, -3.077892, 0.06666667, 1, 0, 1,
-0.4934092, -0.4392349, -2.043178, 0.0627451, 1, 0, 1,
-0.4882932, -0.03817978, -0.8660041, 0.05490196, 1, 0, 1,
-0.484974, -1.837793, -3.849515, 0.05098039, 1, 0, 1,
-0.4838687, 1.41358, 0.6207281, 0.04313726, 1, 0, 1,
-0.4819386, -1.251715, -2.894915, 0.03921569, 1, 0, 1,
-0.481469, 1.048849, -1.037191, 0.03137255, 1, 0, 1,
-0.4800573, -0.6970197, -1.590227, 0.02745098, 1, 0, 1,
-0.4770952, -1.922183, -3.641751, 0.01960784, 1, 0, 1,
-0.4735467, -0.008062872, -3.378803, 0.01568628, 1, 0, 1,
-0.468547, 1.65604, -0.2545542, 0.007843138, 1, 0, 1,
-0.4678975, 0.2854467, -1.255837, 0.003921569, 1, 0, 1,
-0.4656944, 0.3053932, -1.027712, 0, 1, 0.003921569, 1,
-0.4636078, 0.4852753, -2.164216, 0, 1, 0.01176471, 1,
-0.4628518, 1.123138, 0.2582333, 0, 1, 0.01568628, 1,
-0.4617599, 0.1375669, -3.733473, 0, 1, 0.02352941, 1,
-0.4579535, -3.397619, -2.906435, 0, 1, 0.02745098, 1,
-0.4546728, -0.6893995, -0.7506693, 0, 1, 0.03529412, 1,
-0.4389274, 0.1872845, -0.8065553, 0, 1, 0.03921569, 1,
-0.4322891, 0.1055077, -1.309534, 0, 1, 0.04705882, 1,
-0.431207, 0.9745129, -0.3796845, 0, 1, 0.05098039, 1,
-0.4230163, -0.1771134, -1.657164, 0, 1, 0.05882353, 1,
-0.4222613, 0.8295625, -0.3456826, 0, 1, 0.0627451, 1,
-0.4198105, -0.7274309, -3.016945, 0, 1, 0.07058824, 1,
-0.4121391, 1.105407, 0.3198402, 0, 1, 0.07450981, 1,
-0.4113424, -0.5948733, -2.229169, 0, 1, 0.08235294, 1,
-0.4076856, -0.8697464, -3.440938, 0, 1, 0.08627451, 1,
-0.4067458, -0.2878883, -2.520382, 0, 1, 0.09411765, 1,
-0.4041072, 0.7665666, -2.450289, 0, 1, 0.1019608, 1,
-0.3964359, 0.3930291, -0.5142177, 0, 1, 0.1058824, 1,
-0.3933481, -1.075202, -2.766384, 0, 1, 0.1137255, 1,
-0.3920696, -0.2602336, -3.217389, 0, 1, 0.1176471, 1,
-0.3915969, -2.113342, -4.542526, 0, 1, 0.1254902, 1,
-0.3821721, 0.7470269, -0.7019033, 0, 1, 0.1294118, 1,
-0.3820444, 0.2605113, -1.791789, 0, 1, 0.1372549, 1,
-0.3714804, 0.6852768, -1.946214, 0, 1, 0.1411765, 1,
-0.3697994, 0.1498366, -0.9565749, 0, 1, 0.1490196, 1,
-0.3662879, -0.1796127, -2.834718, 0, 1, 0.1529412, 1,
-0.3624213, 0.9859367, 0.5516062, 0, 1, 0.1607843, 1,
-0.358525, 1.982585, -1.190816, 0, 1, 0.1647059, 1,
-0.3583685, -0.6623748, -2.678284, 0, 1, 0.172549, 1,
-0.3565173, -0.6510382, -3.993606, 0, 1, 0.1764706, 1,
-0.3549969, -1.705069, -3.138072, 0, 1, 0.1843137, 1,
-0.3519313, 0.6418569, 0.02809862, 0, 1, 0.1882353, 1,
-0.3492808, -0.4241816, -1.463573, 0, 1, 0.1960784, 1,
-0.348573, -0.9049014, -2.048666, 0, 1, 0.2039216, 1,
-0.3476323, 0.8140172, 0.2039894, 0, 1, 0.2078431, 1,
-0.3454086, 0.6053333, -1.422286, 0, 1, 0.2156863, 1,
-0.3448065, -1.566276, -3.868615, 0, 1, 0.2196078, 1,
-0.3438249, 0.03531082, -2.192823, 0, 1, 0.227451, 1,
-0.3436897, 0.3249717, -1.452806, 0, 1, 0.2313726, 1,
-0.3416452, 0.9984575, -0.1819869, 0, 1, 0.2392157, 1,
-0.3372193, -0.7837716, -3.212873, 0, 1, 0.2431373, 1,
-0.3370676, 0.06025678, -1.143746, 0, 1, 0.2509804, 1,
-0.3365492, -0.5170059, -1.838622, 0, 1, 0.254902, 1,
-0.3334727, 2.319158, -0.6887406, 0, 1, 0.2627451, 1,
-0.327238, -2.241266, -3.207622, 0, 1, 0.2666667, 1,
-0.3267986, -0.5781213, -1.735854, 0, 1, 0.2745098, 1,
-0.3258723, 1.647363, 1.597293, 0, 1, 0.2784314, 1,
-0.3246946, -1.720064, -4.023076, 0, 1, 0.2862745, 1,
-0.3215476, -0.2453122, -0.887497, 0, 1, 0.2901961, 1,
-0.3211668, 0.6422817, -1.273682, 0, 1, 0.2980392, 1,
-0.3184339, 1.100839, -0.1718833, 0, 1, 0.3058824, 1,
-0.3157929, 0.3481287, -1.169096, 0, 1, 0.3098039, 1,
-0.3147592, 2.540539, -0.01836448, 0, 1, 0.3176471, 1,
-0.3137849, -0.02351029, -1.987588, 0, 1, 0.3215686, 1,
-0.3103119, 0.683641, -1.268483, 0, 1, 0.3294118, 1,
-0.3057252, 0.1595487, -1.449014, 0, 1, 0.3333333, 1,
-0.3031444, 0.1285946, -2.565815, 0, 1, 0.3411765, 1,
-0.3030996, -0.952632, -2.898069, 0, 1, 0.345098, 1,
-0.3029128, -0.2791072, -3.757956, 0, 1, 0.3529412, 1,
-0.3020033, 0.1465217, 1.723314, 0, 1, 0.3568628, 1,
-0.2990594, -0.585305, -3.73539, 0, 1, 0.3647059, 1,
-0.2963724, -2.192226, -2.519513, 0, 1, 0.3686275, 1,
-0.2908524, -0.8741956, -2.61613, 0, 1, 0.3764706, 1,
-0.2860064, -0.01792128, -2.143593, 0, 1, 0.3803922, 1,
-0.2825819, 0.7586948, -0.4125178, 0, 1, 0.3882353, 1,
-0.2811022, 1.036091, -0.543634, 0, 1, 0.3921569, 1,
-0.2790589, -0.8139622, -3.787197, 0, 1, 0.4, 1,
-0.2719052, -1.423349, -3.803584, 0, 1, 0.4078431, 1,
-0.2708851, -1.747322, -1.843148, 0, 1, 0.4117647, 1,
-0.2703122, 0.326655, 0.07604028, 0, 1, 0.4196078, 1,
-0.2696357, -0.3302428, -1.356513, 0, 1, 0.4235294, 1,
-0.2615085, 2.355906, 0.2324841, 0, 1, 0.4313726, 1,
-0.2610474, 1.3776, 0.7689921, 0, 1, 0.4352941, 1,
-0.2574427, -0.799499, -4.562985, 0, 1, 0.4431373, 1,
-0.2566028, 1.610806, -1.656413, 0, 1, 0.4470588, 1,
-0.2562836, -0.2128555, -2.461371, 0, 1, 0.454902, 1,
-0.2561091, -1.577863, -2.586953, 0, 1, 0.4588235, 1,
-0.2546674, -0.5932413, -1.983621, 0, 1, 0.4666667, 1,
-0.2540735, 1.401945, 0.7558656, 0, 1, 0.4705882, 1,
-0.2515334, 0.3110977, -0.3781762, 0, 1, 0.4784314, 1,
-0.2483903, 1.421354, -0.4496773, 0, 1, 0.4823529, 1,
-0.2434277, -0.8491625, -2.630707, 0, 1, 0.4901961, 1,
-0.2432542, -0.1735908, -1.18844, 0, 1, 0.4941176, 1,
-0.2378303, -0.03291932, -1.446504, 0, 1, 0.5019608, 1,
-0.2362778, 0.7017738, -1.251919, 0, 1, 0.509804, 1,
-0.232708, -0.6502217, -3.024967, 0, 1, 0.5137255, 1,
-0.2319232, -1.567726, -3.347677, 0, 1, 0.5215687, 1,
-0.2311481, 0.6821612, -0.4607817, 0, 1, 0.5254902, 1,
-0.2295747, 0.5031027, -0.3925186, 0, 1, 0.5333334, 1,
-0.2294741, 0.5189648, 0.4073615, 0, 1, 0.5372549, 1,
-0.223785, 1.183695, 0.3847448, 0, 1, 0.5450981, 1,
-0.2210948, -0.6631797, -2.326252, 0, 1, 0.5490196, 1,
-0.2194052, 0.4121273, -1.055062, 0, 1, 0.5568628, 1,
-0.2183938, -1.21678, -3.302716, 0, 1, 0.5607843, 1,
-0.2174474, -1.659529, -3.864011, 0, 1, 0.5686275, 1,
-0.2162014, -1.60722, -5.459559, 0, 1, 0.572549, 1,
-0.2152531, 0.1712188, -1.275682, 0, 1, 0.5803922, 1,
-0.2099199, 2.221271, -0.4758224, 0, 1, 0.5843138, 1,
-0.2087157, 0.87654, -0.1444764, 0, 1, 0.5921569, 1,
-0.2084849, 1.176885, -0.4460528, 0, 1, 0.5960785, 1,
-0.2069867, -0.2058171, -4.139088, 0, 1, 0.6039216, 1,
-0.2046698, 0.1928235, 0.7581885, 0, 1, 0.6117647, 1,
-0.2046542, -1.513164, -1.765031, 0, 1, 0.6156863, 1,
-0.2038474, 0.6482764, -0.3479476, 0, 1, 0.6235294, 1,
-0.2002274, 0.4223008, 0.8301699, 0, 1, 0.627451, 1,
-0.198226, -1.627471, -4.720601, 0, 1, 0.6352941, 1,
-0.1933873, 2.040755, -1.594365, 0, 1, 0.6392157, 1,
-0.1924236, -0.4633057, -3.266681, 0, 1, 0.6470588, 1,
-0.191651, -1.150103, -1.768609, 0, 1, 0.6509804, 1,
-0.190589, 0.1592861, -0.6577622, 0, 1, 0.6588235, 1,
-0.1892303, 0.1749717, 0.8532054, 0, 1, 0.6627451, 1,
-0.1891885, 0.4606567, -1.797365, 0, 1, 0.6705883, 1,
-0.1883317, 1.729599, 2.101001, 0, 1, 0.6745098, 1,
-0.1872894, 0.4920362, -1.047664, 0, 1, 0.682353, 1,
-0.1796002, -1.782442, -4.071346, 0, 1, 0.6862745, 1,
-0.177908, 0.973268, -1.162722, 0, 1, 0.6941177, 1,
-0.1762014, -0.9003596, -1.178182, 0, 1, 0.7019608, 1,
-0.1685403, -0.3203424, -4.205326, 0, 1, 0.7058824, 1,
-0.1652286, 1.276418, 0.1339312, 0, 1, 0.7137255, 1,
-0.1580761, 0.04506919, -0.9529414, 0, 1, 0.7176471, 1,
-0.1570722, -0.8689261, -1.510517, 0, 1, 0.7254902, 1,
-0.1559394, 0.2542263, -0.7083157, 0, 1, 0.7294118, 1,
-0.1543621, -0.4787862, -3.385, 0, 1, 0.7372549, 1,
-0.15353, -1.15296, -4.549195, 0, 1, 0.7411765, 1,
-0.1500121, -0.8178858, -2.861792, 0, 1, 0.7490196, 1,
-0.1447859, 0.1091035, 0.3520053, 0, 1, 0.7529412, 1,
-0.1402765, 1.399788, 1.14908, 0, 1, 0.7607843, 1,
-0.139601, -0.7676994, -4.417379, 0, 1, 0.7647059, 1,
-0.1393543, 0.4418359, 0.2282738, 0, 1, 0.772549, 1,
-0.138804, 0.07056131, -0.5680268, 0, 1, 0.7764706, 1,
-0.1318078, 0.2441223, -2.221818, 0, 1, 0.7843137, 1,
-0.124387, -0.4295395, -3.088169, 0, 1, 0.7882353, 1,
-0.1232172, -0.4644727, -4.578496, 0, 1, 0.7960784, 1,
-0.1213286, -2.737676, -4.510993, 0, 1, 0.8039216, 1,
-0.121274, 1.295417, -0.2153897, 0, 1, 0.8078431, 1,
-0.1180451, 1.395489, 1.074053, 0, 1, 0.8156863, 1,
-0.1096618, -0.3094649, -1.948871, 0, 1, 0.8196079, 1,
-0.1077352, 0.1228661, -1.326685, 0, 1, 0.827451, 1,
-0.1051495, -0.3372647, -2.286752, 0, 1, 0.8313726, 1,
-0.1003937, -0.782189, -2.81706, 0, 1, 0.8392157, 1,
-0.1001313, 0.7414255, 2.906297, 0, 1, 0.8431373, 1,
-0.09732661, -0.03721158, -0.8524441, 0, 1, 0.8509804, 1,
-0.09706654, -0.8047575, -2.754268, 0, 1, 0.854902, 1,
-0.09632173, 0.5425667, 1.312429, 0, 1, 0.8627451, 1,
-0.0936227, -0.09427977, -2.603701, 0, 1, 0.8666667, 1,
-0.08828208, -0.001973914, -1.055243, 0, 1, 0.8745098, 1,
-0.08708069, 2.221712, -0.3200608, 0, 1, 0.8784314, 1,
-0.08216589, 0.4860946, -0.4908649, 0, 1, 0.8862745, 1,
-0.08133846, -0.5006094, -4.139683, 0, 1, 0.8901961, 1,
-0.07343959, -0.5894026, -2.774599, 0, 1, 0.8980392, 1,
-0.07204065, -1.404953, -4.807736, 0, 1, 0.9058824, 1,
-0.07132887, 1.833781, -0.6846763, 0, 1, 0.9098039, 1,
-0.07105371, 0.5833306, 1.040666, 0, 1, 0.9176471, 1,
-0.06942932, 0.2444682, -0.5721959, 0, 1, 0.9215686, 1,
-0.0691696, 0.2217484, -0.8118199, 0, 1, 0.9294118, 1,
-0.06858233, -0.06663415, -3.903994, 0, 1, 0.9333333, 1,
-0.06416082, -0.4173317, -3.268367, 0, 1, 0.9411765, 1,
-0.05686289, 0.3940102, 0.6794766, 0, 1, 0.945098, 1,
-0.05496142, -0.3859991, -4.397599, 0, 1, 0.9529412, 1,
-0.05001251, 0.5486022, -1.214662, 0, 1, 0.9568627, 1,
-0.04898561, 1.37956, -1.411416, 0, 1, 0.9647059, 1,
-0.04766997, 0.8124767, 0.521208, 0, 1, 0.9686275, 1,
-0.04553104, 0.9748687, 1.762721, 0, 1, 0.9764706, 1,
-0.04367982, 0.9933449, 0.810568, 0, 1, 0.9803922, 1,
-0.03970454, 1.897826, -0.7090212, 0, 1, 0.9882353, 1,
-0.0369247, 0.9074624, -0.1994405, 0, 1, 0.9921569, 1,
-0.03475914, 1.964045, 0.02913306, 0, 1, 1, 1,
-0.0322878, 0.5966256, -0.1610865, 0, 0.9921569, 1, 1,
-0.03011853, 1.218122, -0.3015907, 0, 0.9882353, 1, 1,
-0.01944905, 1.601047, 1.550148, 0, 0.9803922, 1, 1,
-0.01648634, 1.367591, -1.099355, 0, 0.9764706, 1, 1,
-0.01331174, 0.8247242, -0.2428012, 0, 0.9686275, 1, 1,
-0.01323477, 0.9215437, 2.689359, 0, 0.9647059, 1, 1,
-0.01307076, -0.9349817, -2.496471, 0, 0.9568627, 1, 1,
-0.01019212, 0.1223586, -1.568489, 0, 0.9529412, 1, 1,
-0.007769171, -0.5074129, -2.849315, 0, 0.945098, 1, 1,
-0.007499427, -0.190072, -4.281032, 0, 0.9411765, 1, 1,
-0.00332043, -0.6091609, -3.533709, 0, 0.9333333, 1, 1,
-0.001542746, -1.063921, -2.237425, 0, 0.9294118, 1, 1,
-0.0006966575, 1.269563, 0.555065, 0, 0.9215686, 1, 1,
0.0002302822, 0.4651968, -0.4966266, 0, 0.9176471, 1, 1,
0.001757876, 2.093491, 1.156636, 0, 0.9098039, 1, 1,
0.002685067, 1.476124, -0.2693199, 0, 0.9058824, 1, 1,
0.002898433, 0.1013635, 0.4977087, 0, 0.8980392, 1, 1,
0.003997161, 0.3185565, 1.222383, 0, 0.8901961, 1, 1,
0.00641736, -1.7767, 2.556928, 0, 0.8862745, 1, 1,
0.01402928, -0.4572202, 1.860432, 0, 0.8784314, 1, 1,
0.01982786, 0.4342641, 0.3945454, 0, 0.8745098, 1, 1,
0.02467878, -0.2912933, 2.932612, 0, 0.8666667, 1, 1,
0.02468087, 0.7920675, -1.884172, 0, 0.8627451, 1, 1,
0.02508573, 1.463243, 1.053702, 0, 0.854902, 1, 1,
0.03095718, 0.7514716, 0.7678623, 0, 0.8509804, 1, 1,
0.03100332, 0.6290323, 1.316072, 0, 0.8431373, 1, 1,
0.03110584, 0.04905032, 0.008635128, 0, 0.8392157, 1, 1,
0.03226825, 0.2639202, 1.657778, 0, 0.8313726, 1, 1,
0.03336447, 0.4956614, 1.765816, 0, 0.827451, 1, 1,
0.03710082, -0.6917208, 1.960014, 0, 0.8196079, 1, 1,
0.04262377, -0.7946369, 2.386326, 0, 0.8156863, 1, 1,
0.04313427, -0.867508, 2.88984, 0, 0.8078431, 1, 1,
0.04521061, -0.6446879, 2.759586, 0, 0.8039216, 1, 1,
0.04998274, -1.333766, 2.961952, 0, 0.7960784, 1, 1,
0.05022544, -0.6455992, 4.426981, 0, 0.7882353, 1, 1,
0.05367655, -2.007526, 3.128335, 0, 0.7843137, 1, 1,
0.05518696, 0.6657118, -0.08552492, 0, 0.7764706, 1, 1,
0.05694403, -0.9868162, 3.684103, 0, 0.772549, 1, 1,
0.05859993, -0.9040976, 2.218337, 0, 0.7647059, 1, 1,
0.06166422, 1.451479, -0.2852686, 0, 0.7607843, 1, 1,
0.06434543, 0.06652374, 0.3726164, 0, 0.7529412, 1, 1,
0.06515694, 0.6632473, -0.6133765, 0, 0.7490196, 1, 1,
0.06650174, -0.1681377, 1.446177, 0, 0.7411765, 1, 1,
0.07022248, -1.466578, 3.10433, 0, 0.7372549, 1, 1,
0.07114774, -1.208115, 1.781513, 0, 0.7294118, 1, 1,
0.07342751, -1.566201, 2.953433, 0, 0.7254902, 1, 1,
0.07633488, -2.45317, 2.944538, 0, 0.7176471, 1, 1,
0.08004224, 0.3416911, 2.346997, 0, 0.7137255, 1, 1,
0.08069174, 1.030134, 0.7400144, 0, 0.7058824, 1, 1,
0.0824462, -0.4088186, 1.999893, 0, 0.6980392, 1, 1,
0.08612043, 1.842534, 1.012538, 0, 0.6941177, 1, 1,
0.08929902, 0.2102124, 0.3905015, 0, 0.6862745, 1, 1,
0.09125768, -0.1732011, 1.436449, 0, 0.682353, 1, 1,
0.09332181, -0.6408819, 1.857462, 0, 0.6745098, 1, 1,
0.09653072, -0.4769627, 3.280212, 0, 0.6705883, 1, 1,
0.09803688, 0.03828396, 1.59365, 0, 0.6627451, 1, 1,
0.09935948, 0.7218917, 0.5399291, 0, 0.6588235, 1, 1,
0.1051148, 1.130054, -1.114167, 0, 0.6509804, 1, 1,
0.105508, -0.1792092, 3.256947, 0, 0.6470588, 1, 1,
0.1063691, -0.09673116, 3.308421, 0, 0.6392157, 1, 1,
0.1074642, -0.7994897, 4.379737, 0, 0.6352941, 1, 1,
0.1093836, 0.1065717, 0.4883897, 0, 0.627451, 1, 1,
0.1097892, 0.1886515, 0.5310914, 0, 0.6235294, 1, 1,
0.1102985, 0.2709449, -0.1143769, 0, 0.6156863, 1, 1,
0.1114446, -0.3997813, 0.2755763, 0, 0.6117647, 1, 1,
0.1137242, -0.2939878, 3.006934, 0, 0.6039216, 1, 1,
0.1140294, -1.144855, 2.649901, 0, 0.5960785, 1, 1,
0.1186892, 0.9226276, 1.54718, 0, 0.5921569, 1, 1,
0.129182, 0.5844765, -0.1638725, 0, 0.5843138, 1, 1,
0.1362775, 0.9933242, 0.9345188, 0, 0.5803922, 1, 1,
0.1385269, 0.5019054, -2.114728, 0, 0.572549, 1, 1,
0.1398118, 1.164097, 0.3939124, 0, 0.5686275, 1, 1,
0.1417089, 1.587722, 1.257427, 0, 0.5607843, 1, 1,
0.1429956, -0.1370154, 3.60956, 0, 0.5568628, 1, 1,
0.1439584, 0.6287581, 0.5294419, 0, 0.5490196, 1, 1,
0.1494425, 0.443165, -0.4192233, 0, 0.5450981, 1, 1,
0.1508349, 1.363347, -0.9586176, 0, 0.5372549, 1, 1,
0.1520022, -1.463406, 4.475331, 0, 0.5333334, 1, 1,
0.1556728, 0.6825272, -1.204071, 0, 0.5254902, 1, 1,
0.1570517, -0.3092531, 3.456004, 0, 0.5215687, 1, 1,
0.1578632, -1.235386, 3.069429, 0, 0.5137255, 1, 1,
0.162508, 0.4189473, -1.173917, 0, 0.509804, 1, 1,
0.1652877, 0.7414452, 0.0538239, 0, 0.5019608, 1, 1,
0.1699497, -0.6040388, 0.9829648, 0, 0.4941176, 1, 1,
0.1814665, 0.5906348, -0.3693476, 0, 0.4901961, 1, 1,
0.1844002, -0.1213908, 2.931187, 0, 0.4823529, 1, 1,
0.1877988, -1.738736, 2.658919, 0, 0.4784314, 1, 1,
0.1885348, 0.7597355, 0.7542259, 0, 0.4705882, 1, 1,
0.1897229, 0.04818498, -2.148008, 0, 0.4666667, 1, 1,
0.1903622, -1.359653, 1.765671, 0, 0.4588235, 1, 1,
0.1912404, 0.3762379, 1.147141, 0, 0.454902, 1, 1,
0.1955647, -0.8065125, 1.729823, 0, 0.4470588, 1, 1,
0.1970983, 0.3420695, 0.5765583, 0, 0.4431373, 1, 1,
0.2012458, 1.414715, -2.804331, 0, 0.4352941, 1, 1,
0.2074108, -0.185107, 2.012049, 0, 0.4313726, 1, 1,
0.2122617, 1.943066, -1.125954, 0, 0.4235294, 1, 1,
0.2166993, -0.636657, 2.288951, 0, 0.4196078, 1, 1,
0.2168156, -0.4409813, 1.909034, 0, 0.4117647, 1, 1,
0.2175121, -0.1865094, 1.993293, 0, 0.4078431, 1, 1,
0.2181975, 1.327236, -0.6129097, 0, 0.4, 1, 1,
0.2188284, -0.9761386, 1.502818, 0, 0.3921569, 1, 1,
0.2203517, 1.194262, -0.3928486, 0, 0.3882353, 1, 1,
0.2208848, -0.3400651, 2.039776, 0, 0.3803922, 1, 1,
0.2227849, 0.1459748, 1.256519, 0, 0.3764706, 1, 1,
0.2249126, 0.6607135, 0.3113729, 0, 0.3686275, 1, 1,
0.2249239, 1.099643, 1.59541, 0, 0.3647059, 1, 1,
0.2252222, 0.08487971, 0.9450116, 0, 0.3568628, 1, 1,
0.2262886, 0.3327233, 1.402291, 0, 0.3529412, 1, 1,
0.2279337, 1.601701, 0.9718039, 0, 0.345098, 1, 1,
0.2280481, -0.9028419, 1.633187, 0, 0.3411765, 1, 1,
0.2306266, 0.1335476, 0.5076544, 0, 0.3333333, 1, 1,
0.2328141, 0.6716651, -0.7107005, 0, 0.3294118, 1, 1,
0.2338023, 0.6721079, 1.054388, 0, 0.3215686, 1, 1,
0.2346256, 0.4034568, -0.634531, 0, 0.3176471, 1, 1,
0.2354569, 0.6815234, -0.9154856, 0, 0.3098039, 1, 1,
0.2365452, -0.488679, 1.80133, 0, 0.3058824, 1, 1,
0.2373796, 0.2609493, 0.4469919, 0, 0.2980392, 1, 1,
0.2392782, 0.72298, 0.8938755, 0, 0.2901961, 1, 1,
0.2395475, -3.001641, 2.028462, 0, 0.2862745, 1, 1,
0.2399573, 1.665434, -0.7064791, 0, 0.2784314, 1, 1,
0.2410787, -0.4275989, 1.206037, 0, 0.2745098, 1, 1,
0.2412578, -1.203051, 2.532878, 0, 0.2666667, 1, 1,
0.2418273, -0.3158508, 2.342869, 0, 0.2627451, 1, 1,
0.248634, -1.392455, 3.194714, 0, 0.254902, 1, 1,
0.2506122, -0.5337213, 1.103242, 0, 0.2509804, 1, 1,
0.2529564, 0.3346868, 0.3727168, 0, 0.2431373, 1, 1,
0.2574674, 0.4564015, -0.1302182, 0, 0.2392157, 1, 1,
0.266181, 0.5964808, 0.2586276, 0, 0.2313726, 1, 1,
0.2683881, -2.212679, 2.42557, 0, 0.227451, 1, 1,
0.2719584, -1.016772, 3.303739, 0, 0.2196078, 1, 1,
0.277707, 0.9122373, 0.8013026, 0, 0.2156863, 1, 1,
0.2843806, -0.01435006, 1.029161, 0, 0.2078431, 1, 1,
0.2880633, -0.3464408, 1.123475, 0, 0.2039216, 1, 1,
0.2983707, -0.001479264, 1.7467, 0, 0.1960784, 1, 1,
0.3011792, 0.1003003, 1.375079, 0, 0.1882353, 1, 1,
0.3091191, 1.270344, -0.3739597, 0, 0.1843137, 1, 1,
0.3091313, 0.209145, 0.6626539, 0, 0.1764706, 1, 1,
0.3102587, 1.509718, -0.7123176, 0, 0.172549, 1, 1,
0.3134067, -0.09030771, 1.557878, 0, 0.1647059, 1, 1,
0.3145819, -0.5395256, 3.045735, 0, 0.1607843, 1, 1,
0.315074, 0.4499482, 0.4414794, 0, 0.1529412, 1, 1,
0.3150986, 1.956501, 1.133671, 0, 0.1490196, 1, 1,
0.3238807, 0.309175, 1.23459, 0, 0.1411765, 1, 1,
0.3269578, 0.5103704, -0.1059457, 0, 0.1372549, 1, 1,
0.3300524, 0.907271, -0.2882517, 0, 0.1294118, 1, 1,
0.3315456, 0.4285626, 1.913383, 0, 0.1254902, 1, 1,
0.3354934, -0.4320587, 0.7311018, 0, 0.1176471, 1, 1,
0.3355806, 0.9569821, 0.2834311, 0, 0.1137255, 1, 1,
0.3380035, -0.4664026, 2.741368, 0, 0.1058824, 1, 1,
0.3383859, -0.6583806, 3.330809, 0, 0.09803922, 1, 1,
0.3404853, 0.685254, -0.2256119, 0, 0.09411765, 1, 1,
0.3431309, -0.390425, 2.105041, 0, 0.08627451, 1, 1,
0.3434854, 0.3967689, 0.1587356, 0, 0.08235294, 1, 1,
0.3453323, 1.382156, -0.2150995, 0, 0.07450981, 1, 1,
0.3499365, 1.122552, 0.01650947, 0, 0.07058824, 1, 1,
0.3533178, 0.07685421, 2.027134, 0, 0.0627451, 1, 1,
0.3587113, -1.846787, 2.310227, 0, 0.05882353, 1, 1,
0.3605302, -0.937206, 1.839653, 0, 0.05098039, 1, 1,
0.3656569, -1.72248, 3.469977, 0, 0.04705882, 1, 1,
0.366948, -1.670227, 3.007185, 0, 0.03921569, 1, 1,
0.3742975, 0.02741384, 2.926016, 0, 0.03529412, 1, 1,
0.3743716, -1.664631, 4.315463, 0, 0.02745098, 1, 1,
0.3766972, 2.179586, 0.30052, 0, 0.02352941, 1, 1,
0.3830196, -0.180466, 1.909204, 0, 0.01568628, 1, 1,
0.3842469, -0.02133904, 1.269696, 0, 0.01176471, 1, 1,
0.3850947, -0.4358605, 2.135375, 0, 0.003921569, 1, 1,
0.3868984, -1.311461, 2.795057, 0.003921569, 0, 1, 1,
0.3879419, 1.954033, -1.616693, 0.007843138, 0, 1, 1,
0.3919379, 0.6963657, 0.965449, 0.01568628, 0, 1, 1,
0.3919597, -0.1534632, 0.4948059, 0.01960784, 0, 1, 1,
0.3993622, -0.406234, 2.368676, 0.02745098, 0, 1, 1,
0.3994142, 0.01753528, 3.799727, 0.03137255, 0, 1, 1,
0.404889, 0.7988814, -0.4241536, 0.03921569, 0, 1, 1,
0.4094902, -1.211716, 2.68738, 0.04313726, 0, 1, 1,
0.4136156, -1.462317, 2.896408, 0.05098039, 0, 1, 1,
0.4178012, -0.07609936, 0.9941331, 0.05490196, 0, 1, 1,
0.4251024, 0.6198611, 0.5163941, 0.0627451, 0, 1, 1,
0.4252678, -0.1677305, 2.330264, 0.06666667, 0, 1, 1,
0.4269686, 0.1706031, 0.8499901, 0.07450981, 0, 1, 1,
0.4295819, 0.4634422, 1.946902, 0.07843138, 0, 1, 1,
0.4335445, 1.432228, 0.8254491, 0.08627451, 0, 1, 1,
0.439999, -0.24259, 1.727253, 0.09019608, 0, 1, 1,
0.4404158, 1.109061, 0.08500857, 0.09803922, 0, 1, 1,
0.44109, 1.286919, 0.5381756, 0.1058824, 0, 1, 1,
0.4530868, 0.2967281, 2.075091, 0.1098039, 0, 1, 1,
0.4573323, -0.2487437, 1.927145, 0.1176471, 0, 1, 1,
0.4602928, 0.4888873, 1.402444, 0.1215686, 0, 1, 1,
0.4603429, -0.01499225, 2.722168, 0.1294118, 0, 1, 1,
0.4623675, 0.5752255, 1.07796, 0.1333333, 0, 1, 1,
0.4662754, 0.2380562, 2.354297, 0.1411765, 0, 1, 1,
0.4739335, -0.1929321, 2.281121, 0.145098, 0, 1, 1,
0.4783796, 0.289932, -0.01368504, 0.1529412, 0, 1, 1,
0.4818409, 0.03906466, 2.298071, 0.1568628, 0, 1, 1,
0.4984377, -0.5640281, 2.888156, 0.1647059, 0, 1, 1,
0.5046199, -0.1771921, 1.969623, 0.1686275, 0, 1, 1,
0.5046542, -2.107336, 2.258926, 0.1764706, 0, 1, 1,
0.5046592, 1.987229, 0.9589564, 0.1803922, 0, 1, 1,
0.5056054, 0.1466375, 2.134209, 0.1882353, 0, 1, 1,
0.5071757, -1.544039, 1.890779, 0.1921569, 0, 1, 1,
0.5075468, 0.9905033, 1.283002, 0.2, 0, 1, 1,
0.5095921, -1.21456, 3.997239, 0.2078431, 0, 1, 1,
0.5198905, 0.358029, -0.5391763, 0.2117647, 0, 1, 1,
0.525776, -1.620957, 3.217939, 0.2196078, 0, 1, 1,
0.5262882, 1.577446, 0.7556636, 0.2235294, 0, 1, 1,
0.528617, 1.538608, 0.5182813, 0.2313726, 0, 1, 1,
0.5286793, -1.049245, 1.429995, 0.2352941, 0, 1, 1,
0.5302641, 0.5316629, 1.909686, 0.2431373, 0, 1, 1,
0.5304598, -0.08063429, 0.596697, 0.2470588, 0, 1, 1,
0.5351895, -0.07054593, 2.720321, 0.254902, 0, 1, 1,
0.5370166, 1.82808, 1.366733, 0.2588235, 0, 1, 1,
0.5557705, 0.880809, 0.6988254, 0.2666667, 0, 1, 1,
0.557628, -0.1233095, 1.903868, 0.2705882, 0, 1, 1,
0.5578511, -1.196829, 3.610727, 0.2784314, 0, 1, 1,
0.5586526, -1.451873, 2.884962, 0.282353, 0, 1, 1,
0.564915, -1.749993, 2.025861, 0.2901961, 0, 1, 1,
0.5667324, 0.3019114, 1.69554, 0.2941177, 0, 1, 1,
0.568244, 0.561163, 0.6148291, 0.3019608, 0, 1, 1,
0.5683561, -0.02353827, 0.5323235, 0.3098039, 0, 1, 1,
0.573509, 0.2307595, 2.492839, 0.3137255, 0, 1, 1,
0.5745295, -0.6086373, 1.714339, 0.3215686, 0, 1, 1,
0.574896, -0.8590413, 2.382064, 0.3254902, 0, 1, 1,
0.5749069, 0.1310177, 0.4928691, 0.3333333, 0, 1, 1,
0.5805959, -0.9290822, 1.51611, 0.3372549, 0, 1, 1,
0.5830889, -1.595918, 3.292001, 0.345098, 0, 1, 1,
0.5887285, -0.9956716, 3.913587, 0.3490196, 0, 1, 1,
0.5924217, 0.4950104, -0.4715358, 0.3568628, 0, 1, 1,
0.5946206, 0.351313, 0.4285024, 0.3607843, 0, 1, 1,
0.5977209, 0.2121033, 1.524474, 0.3686275, 0, 1, 1,
0.5985453, 0.6823426, 0.7067683, 0.372549, 0, 1, 1,
0.6087284, 0.1670442, 2.153471, 0.3803922, 0, 1, 1,
0.6116416, 0.1907991, 2.581513, 0.3843137, 0, 1, 1,
0.6119533, -0.203802, 1.498239, 0.3921569, 0, 1, 1,
0.6147299, 0.05946114, 0.2594614, 0.3960784, 0, 1, 1,
0.629142, 1.527993, 0.1086946, 0.4039216, 0, 1, 1,
0.6305199, 0.07631657, 2.775874, 0.4117647, 0, 1, 1,
0.6342354, -0.9339961, 2.344237, 0.4156863, 0, 1, 1,
0.6369481, 1.762045, 1.735201, 0.4235294, 0, 1, 1,
0.6447938, 2.072349, 2.167582, 0.427451, 0, 1, 1,
0.6466618, 0.03816393, 3.410404, 0.4352941, 0, 1, 1,
0.6466827, -1.370923, 2.746284, 0.4392157, 0, 1, 1,
0.6588452, 0.4065038, 0.0605529, 0.4470588, 0, 1, 1,
0.6661333, -3.409598, 1.753627, 0.4509804, 0, 1, 1,
0.668062, -1.003693, 0.604411, 0.4588235, 0, 1, 1,
0.6717583, -0.547989, 3.535671, 0.4627451, 0, 1, 1,
0.6721984, 0.3202977, 1.645636, 0.4705882, 0, 1, 1,
0.6734641, 0.7365586, 2.306936, 0.4745098, 0, 1, 1,
0.6740823, -0.5586284, 2.310802, 0.4823529, 0, 1, 1,
0.6750585, -0.6449625, 2.784583, 0.4862745, 0, 1, 1,
0.677066, -2.357048, 1.717445, 0.4941176, 0, 1, 1,
0.6810098, 0.600705, -0.1768764, 0.5019608, 0, 1, 1,
0.6840732, -1.532049, 1.958921, 0.5058824, 0, 1, 1,
0.6841739, -1.214584, 1.481446, 0.5137255, 0, 1, 1,
0.6846898, -1.419748, 3.101949, 0.5176471, 0, 1, 1,
0.6936008, -0.9633968, 4.475829, 0.5254902, 0, 1, 1,
0.6957217, -0.341352, 2.647947, 0.5294118, 0, 1, 1,
0.6968997, -1.227327, 1.274129, 0.5372549, 0, 1, 1,
0.6997278, -1.190322, 2.106684, 0.5411765, 0, 1, 1,
0.7026512, 0.733792, -1.125821, 0.5490196, 0, 1, 1,
0.7047384, -2.011482, 2.649861, 0.5529412, 0, 1, 1,
0.7071092, 0.7144545, -0.4127601, 0.5607843, 0, 1, 1,
0.7104512, -1.293458, 0.9145083, 0.5647059, 0, 1, 1,
0.7118509, 0.2118703, 1.851688, 0.572549, 0, 1, 1,
0.7124341, -0.8647599, 1.731476, 0.5764706, 0, 1, 1,
0.71658, -1.279258, 2.260046, 0.5843138, 0, 1, 1,
0.7197509, -0.6301709, 0.9891162, 0.5882353, 0, 1, 1,
0.7200949, 0.05972914, 1.010935, 0.5960785, 0, 1, 1,
0.7236365, 1.180763, -0.07003593, 0.6039216, 0, 1, 1,
0.7266875, -0.08434821, 0.8712166, 0.6078432, 0, 1, 1,
0.7333575, -0.8116349, 3.363204, 0.6156863, 0, 1, 1,
0.7359015, -0.03584354, 2.494661, 0.6196079, 0, 1, 1,
0.7376631, -0.1311243, 2.68265, 0.627451, 0, 1, 1,
0.7446384, -0.2738513, 1.760488, 0.6313726, 0, 1, 1,
0.7515037, -0.03058475, 1.021983, 0.6392157, 0, 1, 1,
0.7612198, -0.8483436, 0.7378721, 0.6431373, 0, 1, 1,
0.7627901, -0.2533699, 2.753562, 0.6509804, 0, 1, 1,
0.7640806, -0.08550803, 2.798634, 0.654902, 0, 1, 1,
0.7779738, 0.1792684, 1.505508, 0.6627451, 0, 1, 1,
0.7779887, -0.8162236, 2.029314, 0.6666667, 0, 1, 1,
0.7792006, -1.11093, 3.136212, 0.6745098, 0, 1, 1,
0.7809566, 0.2817286, 3.492399, 0.6784314, 0, 1, 1,
0.7882213, 0.08386593, 0.2202597, 0.6862745, 0, 1, 1,
0.7906753, -2.080087, 1.942185, 0.6901961, 0, 1, 1,
0.7912846, 0.3460611, 1.759188, 0.6980392, 0, 1, 1,
0.7917562, 0.05047727, 1.083749, 0.7058824, 0, 1, 1,
0.7997297, -0.07487655, 1.140002, 0.7098039, 0, 1, 1,
0.8035369, -1.969251, 2.931957, 0.7176471, 0, 1, 1,
0.8143823, 0.8110015, 0.210199, 0.7215686, 0, 1, 1,
0.8165653, -2.250284, 3.227742, 0.7294118, 0, 1, 1,
0.8237262, -0.2833611, 0.8425397, 0.7333333, 0, 1, 1,
0.8369481, 0.900229, -0.696289, 0.7411765, 0, 1, 1,
0.8402876, 0.8586412, 1.065684, 0.7450981, 0, 1, 1,
0.8444814, -0.4513213, 2.498751, 0.7529412, 0, 1, 1,
0.844511, 0.1951176, 2.111856, 0.7568628, 0, 1, 1,
0.8469813, 1.784382, -0.2390935, 0.7647059, 0, 1, 1,
0.8558392, -1.072644, 3.675798, 0.7686275, 0, 1, 1,
0.8575802, 0.7604735, 1.263022, 0.7764706, 0, 1, 1,
0.8607754, -0.01293574, 0.6097836, 0.7803922, 0, 1, 1,
0.8646879, -1.256275, 2.195354, 0.7882353, 0, 1, 1,
0.8733202, -0.7848864, 2.568725, 0.7921569, 0, 1, 1,
0.8735442, -0.223107, 0.7598069, 0.8, 0, 1, 1,
0.8749519, -1.066902, 1.765867, 0.8078431, 0, 1, 1,
0.8767667, 0.9502955, 0.3637482, 0.8117647, 0, 1, 1,
0.8781862, -0.1694301, 2.21486, 0.8196079, 0, 1, 1,
0.8786305, 0.4361421, 0.9176155, 0.8235294, 0, 1, 1,
0.8802661, -0.4918233, 1.006744, 0.8313726, 0, 1, 1,
0.8834227, -1.631845, 3.566444, 0.8352941, 0, 1, 1,
0.8855577, -0.6045902, 2.505402, 0.8431373, 0, 1, 1,
0.8923163, 0.1004413, 2.472814, 0.8470588, 0, 1, 1,
0.8983181, 0.1228051, 3.339043, 0.854902, 0, 1, 1,
0.8992941, -1.27291, 2.305576, 0.8588235, 0, 1, 1,
0.9121625, -0.44008, 0.09077254, 0.8666667, 0, 1, 1,
0.9152706, -0.8100289, 3.304184, 0.8705882, 0, 1, 1,
0.9278977, -0.4214506, 0.6550686, 0.8784314, 0, 1, 1,
0.9314702, 0.7647763, 1.524969, 0.8823529, 0, 1, 1,
0.9338055, -0.9329101, 2.853048, 0.8901961, 0, 1, 1,
0.935416, -0.4407729, 2.547798, 0.8941177, 0, 1, 1,
0.9407842, -0.1842616, 1.474806, 0.9019608, 0, 1, 1,
0.9455076, -0.2775133, 2.309896, 0.9098039, 0, 1, 1,
0.9497883, -1.211032, 1.371972, 0.9137255, 0, 1, 1,
0.951044, -0.7397344, 1.693146, 0.9215686, 0, 1, 1,
0.9566963, -1.219817, 5.265709, 0.9254902, 0, 1, 1,
0.964876, 2.376648, 1.296272, 0.9333333, 0, 1, 1,
0.9674599, 0.5591449, 2.067718, 0.9372549, 0, 1, 1,
0.9781992, -0.1623452, 1.1564, 0.945098, 0, 1, 1,
0.9845548, 1.620115, 0.4408199, 0.9490196, 0, 1, 1,
0.984559, 0.765972, 2.079603, 0.9568627, 0, 1, 1,
0.9869799, -0.05114698, 1.784245, 0.9607843, 0, 1, 1,
0.9871281, 1.053874, -0.5855685, 0.9686275, 0, 1, 1,
0.9886042, -1.579237, 0.7773728, 0.972549, 0, 1, 1,
0.9954589, -0.01086908, 3.194879, 0.9803922, 0, 1, 1,
1.005075, -1.107142, 2.13253, 0.9843137, 0, 1, 1,
1.008497, 1.776693, 0.7103257, 0.9921569, 0, 1, 1,
1.013248, 1.134877, 0.9150355, 0.9960784, 0, 1, 1,
1.01708, -0.2405404, 1.018411, 1, 0, 0.9960784, 1,
1.020728, 0.4819086, 2.816273, 1, 0, 0.9882353, 1,
1.024658, 2.747378, -0.5106315, 1, 0, 0.9843137, 1,
1.026243, 0.3857121, 0.5366828, 1, 0, 0.9764706, 1,
1.035062, 0.8453062, 2.699906, 1, 0, 0.972549, 1,
1.039734, -0.7289766, 2.519415, 1, 0, 0.9647059, 1,
1.041493, -1.418005, 2.514353, 1, 0, 0.9607843, 1,
1.044149, 1.54078, 0.9020535, 1, 0, 0.9529412, 1,
1.052901, -0.52978, 1.377883, 1, 0, 0.9490196, 1,
1.055454, 1.491984, 0.6647874, 1, 0, 0.9411765, 1,
1.055475, -1.390698, 3.055243, 1, 0, 0.9372549, 1,
1.056187, -1.592235, 5.139498, 1, 0, 0.9294118, 1,
1.065018, -0.1838569, 2.074533, 1, 0, 0.9254902, 1,
1.065166, 0.4444241, 1.529599, 1, 0, 0.9176471, 1,
1.06604, 0.8862997, 0.2816088, 1, 0, 0.9137255, 1,
1.067334, -0.6440902, 0.7563086, 1, 0, 0.9058824, 1,
1.088298, 0.4640034, 0.8548229, 1, 0, 0.9019608, 1,
1.093712, 0.4048245, 1.825403, 1, 0, 0.8941177, 1,
1.097929, -0.03136465, 1.287231, 1, 0, 0.8862745, 1,
1.098115, -1.080169, 2.319333, 1, 0, 0.8823529, 1,
1.100635, -0.1010534, 1.711169, 1, 0, 0.8745098, 1,
1.102796, -0.9831613, 2.861716, 1, 0, 0.8705882, 1,
1.103117, 0.5007637, 0.4882491, 1, 0, 0.8627451, 1,
1.106028, -0.7448258, 1.974537, 1, 0, 0.8588235, 1,
1.112172, -2.867651, 2.516826, 1, 0, 0.8509804, 1,
1.119094, 0.8995314, 0.918912, 1, 0, 0.8470588, 1,
1.120199, 0.7505921, 1.474775, 1, 0, 0.8392157, 1,
1.131829, 1.406558, -0.3625502, 1, 0, 0.8352941, 1,
1.135733, -0.6819013, 4.10844, 1, 0, 0.827451, 1,
1.147881, 0.6058655, 1.938037, 1, 0, 0.8235294, 1,
1.151646, 1.270131, 2.179664, 1, 0, 0.8156863, 1,
1.163494, -0.1821307, 2.643632, 1, 0, 0.8117647, 1,
1.165006, 0.3443483, 1.545037, 1, 0, 0.8039216, 1,
1.175733, -0.5157097, 1.431507, 1, 0, 0.7960784, 1,
1.17774, -1.369465, 1.838121, 1, 0, 0.7921569, 1,
1.185701, -0.03344993, 0.8360814, 1, 0, 0.7843137, 1,
1.189729, 0.220918, 1.89986, 1, 0, 0.7803922, 1,
1.206225, -2.633424, 2.450241, 1, 0, 0.772549, 1,
1.209912, 0.9410858, 0.7849692, 1, 0, 0.7686275, 1,
1.210576, 0.3705167, 1.47326, 1, 0, 0.7607843, 1,
1.211964, 0.9965031, 1.959243, 1, 0, 0.7568628, 1,
1.219176, 0.03395186, 2.290722, 1, 0, 0.7490196, 1,
1.222485, -0.2527412, 2.167208, 1, 0, 0.7450981, 1,
1.226671, 0.2374309, 1.341218, 1, 0, 0.7372549, 1,
1.239654, 1.923021, 2.565019, 1, 0, 0.7333333, 1,
1.245747, -1.117736, 1.948429, 1, 0, 0.7254902, 1,
1.250996, 1.132135, 1.974913, 1, 0, 0.7215686, 1,
1.252549, 0.7899504, 0.2281734, 1, 0, 0.7137255, 1,
1.253143, 0.5876675, 0.167112, 1, 0, 0.7098039, 1,
1.256084, 0.0146637, 2.146416, 1, 0, 0.7019608, 1,
1.27407, 1.051017, 1.275146, 1, 0, 0.6941177, 1,
1.276293, 0.04940859, 1.271238, 1, 0, 0.6901961, 1,
1.28797, 0.1220886, -0.6767976, 1, 0, 0.682353, 1,
1.290415, -0.1952431, 0.8799108, 1, 0, 0.6784314, 1,
1.301552, 0.8109608, 2.513967, 1, 0, 0.6705883, 1,
1.306991, 0.2432431, 3.238214, 1, 0, 0.6666667, 1,
1.317872, -0.2199945, 2.718825, 1, 0, 0.6588235, 1,
1.319165, 0.4088259, 0.3607567, 1, 0, 0.654902, 1,
1.327714, 1.012965, 1.735085, 1, 0, 0.6470588, 1,
1.327753, 1.569496, 0.7761543, 1, 0, 0.6431373, 1,
1.343129, -0.05776205, 2.686333, 1, 0, 0.6352941, 1,
1.351792, 0.377301, -0.3608092, 1, 0, 0.6313726, 1,
1.356678, 1.041972, 1.938734, 1, 0, 0.6235294, 1,
1.384456, 1.575491, -0.6935921, 1, 0, 0.6196079, 1,
1.392002, -0.191746, 1.321423, 1, 0, 0.6117647, 1,
1.404303, -0.7313191, 3.071983, 1, 0, 0.6078432, 1,
1.405492, 0.1239859, 1.534132, 1, 0, 0.6, 1,
1.415976, -1.854141, 2.228541, 1, 0, 0.5921569, 1,
1.416313, 0.2950388, 1.410324, 1, 0, 0.5882353, 1,
1.417299, 0.3376736, 2.756397, 1, 0, 0.5803922, 1,
1.422427, 0.2053076, 1.607598, 1, 0, 0.5764706, 1,
1.424733, -0.4414828, 2.487355, 1, 0, 0.5686275, 1,
1.427064, 0.3331757, 3.182119, 1, 0, 0.5647059, 1,
1.430773, -0.7756485, 2.263145, 1, 0, 0.5568628, 1,
1.433251, 0.648508, 0.3148753, 1, 0, 0.5529412, 1,
1.447267, -0.6083563, 0.6101143, 1, 0, 0.5450981, 1,
1.447534, 0.4108827, 0.6803176, 1, 0, 0.5411765, 1,
1.459252, -1.399336, 1.553695, 1, 0, 0.5333334, 1,
1.45966, -2.227567, 3.879788, 1, 0, 0.5294118, 1,
1.471026, -1.651677, 2.550599, 1, 0, 0.5215687, 1,
1.475981, 0.8974447, 1.454271, 1, 0, 0.5176471, 1,
1.492346, 0.101301, 0.6891431, 1, 0, 0.509804, 1,
1.493542, -0.7653138, 1.906969, 1, 0, 0.5058824, 1,
1.496998, 0.6344332, 0.9456808, 1, 0, 0.4980392, 1,
1.497621, -0.948074, 1.659498, 1, 0, 0.4901961, 1,
1.509393, -1.076835, 1.148032, 1, 0, 0.4862745, 1,
1.519432, -0.4478391, 1.282412, 1, 0, 0.4784314, 1,
1.529718, -0.6248117, 1.55105, 1, 0, 0.4745098, 1,
1.530879, 0.123703, 1.500409, 1, 0, 0.4666667, 1,
1.533889, -0.1172303, 2.017322, 1, 0, 0.4627451, 1,
1.547743, -1.845389, 2.656576, 1, 0, 0.454902, 1,
1.56583, 0.2858315, 1.968553, 1, 0, 0.4509804, 1,
1.57933, -0.01440724, 3.013628, 1, 0, 0.4431373, 1,
1.579966, 0.9995264, 2.495476, 1, 0, 0.4392157, 1,
1.590329, 0.3338516, 1.146722, 1, 0, 0.4313726, 1,
1.59224, 0.5260245, 3.006114, 1, 0, 0.427451, 1,
1.593875, 1.699307, 1.749711, 1, 0, 0.4196078, 1,
1.5947, 0.160387, 0.3577918, 1, 0, 0.4156863, 1,
1.607368, -0.464381, 2.276293, 1, 0, 0.4078431, 1,
1.613258, -1.466969, 2.906118, 1, 0, 0.4039216, 1,
1.615707, 2.154073, 2.097068, 1, 0, 0.3960784, 1,
1.61639, 0.6070101, 1.733139, 1, 0, 0.3882353, 1,
1.622641, 0.3399769, 0.722679, 1, 0, 0.3843137, 1,
1.627421, -0.5311408, 2.38577, 1, 0, 0.3764706, 1,
1.634456, 2.157347, 0.9360179, 1, 0, 0.372549, 1,
1.647885, 1.043501, 0.8371845, 1, 0, 0.3647059, 1,
1.659919, -0.2882141, 0.9888169, 1, 0, 0.3607843, 1,
1.668515, 0.1411489, 1.936209, 1, 0, 0.3529412, 1,
1.68209, 0.6063136, 0.6255583, 1, 0, 0.3490196, 1,
1.685913, 0.2401838, -0.06311431, 1, 0, 0.3411765, 1,
1.701129, 0.786966, 2.819596, 1, 0, 0.3372549, 1,
1.703334, -2.08766, 2.762225, 1, 0, 0.3294118, 1,
1.703544, -0.354733, 0.9126391, 1, 0, 0.3254902, 1,
1.705356, 0.02590455, 2.506319, 1, 0, 0.3176471, 1,
1.7247, 0.486156, 2.84442, 1, 0, 0.3137255, 1,
1.753697, 0.3297071, 0.4077295, 1, 0, 0.3058824, 1,
1.754039, -0.07450633, 0.6580952, 1, 0, 0.2980392, 1,
1.762439, -0.6427978, 1.652426, 1, 0, 0.2941177, 1,
1.768528, -0.3947353, 2.469124, 1, 0, 0.2862745, 1,
1.772549, 0.4750531, 1.105967, 1, 0, 0.282353, 1,
1.775586, -1.003201, 0.1522807, 1, 0, 0.2745098, 1,
1.781187, 0.5385165, 0.5065533, 1, 0, 0.2705882, 1,
1.804105, 1.19766, 0.4858426, 1, 0, 0.2627451, 1,
1.804474, -0.1109333, 3.36221, 1, 0, 0.2588235, 1,
1.810172, -0.9583555, 0.2276317, 1, 0, 0.2509804, 1,
1.825348, 0.7859984, 2.57727, 1, 0, 0.2470588, 1,
1.840619, -0.2536474, 1.550485, 1, 0, 0.2392157, 1,
1.846829, 0.9410143, 1.611872, 1, 0, 0.2352941, 1,
1.849603, 0.7681549, 1.641642, 1, 0, 0.227451, 1,
1.860122, 1.163021, -0.7278448, 1, 0, 0.2235294, 1,
1.880104, -2.26439, 0.1446161, 1, 0, 0.2156863, 1,
1.918593, 0.1052901, 1.711711, 1, 0, 0.2117647, 1,
1.923656, -0.5896147, 0.6511963, 1, 0, 0.2039216, 1,
1.924861, -0.210976, 2.245051, 1, 0, 0.1960784, 1,
1.940184, 1.03438, -0.7672328, 1, 0, 0.1921569, 1,
1.942624, 0.330162, 0.1922499, 1, 0, 0.1843137, 1,
1.949652, 0.9035884, 2.730142, 1, 0, 0.1803922, 1,
1.950103, 0.009469096, 0.2194261, 1, 0, 0.172549, 1,
1.958969, -0.3599394, 2.18766, 1, 0, 0.1686275, 1,
2.003929, -1.138761, 0.6238402, 1, 0, 0.1607843, 1,
2.00398, -0.07620014, 1.364299, 1, 0, 0.1568628, 1,
2.011815, 0.1918114, 0.8684043, 1, 0, 0.1490196, 1,
2.014009, 0.9262315, 2.556604, 1, 0, 0.145098, 1,
2.034987, 0.7347265, 0.2718825, 1, 0, 0.1372549, 1,
2.035524, 2.01588, -0.4199797, 1, 0, 0.1333333, 1,
2.039648, -0.09017251, -0.3662861, 1, 0, 0.1254902, 1,
2.03984, 0.1372148, 2.324795, 1, 0, 0.1215686, 1,
2.096462, 0.3314401, 1.448699, 1, 0, 0.1137255, 1,
2.154835, 0.4625649, 1.621081, 1, 0, 0.1098039, 1,
2.171311, 0.9324797, 0.461558, 1, 0, 0.1019608, 1,
2.181438, 2.118102, 1.166115, 1, 0, 0.09411765, 1,
2.206537, 1.274587, 1.190861, 1, 0, 0.09019608, 1,
2.243607, 0.8584105, 1.673278, 1, 0, 0.08235294, 1,
2.252952, 0.03032843, 2.062026, 1, 0, 0.07843138, 1,
2.260639, -0.2615727, 0.595033, 1, 0, 0.07058824, 1,
2.332515, -1.540646, 3.762964, 1, 0, 0.06666667, 1,
2.348604, 0.6104477, 3.354601, 1, 0, 0.05882353, 1,
2.360949, 1.232544, 1.398476, 1, 0, 0.05490196, 1,
2.426508, 0.3377654, 1.296146, 1, 0, 0.04705882, 1,
2.67567, 0.7835481, 0.5684862, 1, 0, 0.04313726, 1,
2.900621, -0.1552446, 1.586885, 1, 0, 0.03529412, 1,
2.989622, 0.7481077, 2.929092, 1, 0, 0.03137255, 1,
3.114847, -0.6463543, 2.446893, 1, 0, 0.02352941, 1,
3.121744, -1.127485, 3.810457, 1, 0, 0.01960784, 1,
3.124863, 0.3264514, 4.152762, 1, 0, 0.01176471, 1,
3.165107, -0.4112965, 2.229607, 1, 0, 0.007843138, 1
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
-0.03204513, -4.453206, -7.277493, 0, -0.5, 0.5, 0.5,
-0.03204513, -4.453206, -7.277493, 1, -0.5, 0.5, 0.5,
-0.03204513, -4.453206, -7.277493, 1, 1.5, 0.5, 0.5,
-0.03204513, -4.453206, -7.277493, 0, 1.5, 0.5, 0.5
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
-4.313031, -0.3311104, -7.277493, 0, -0.5, 0.5, 0.5,
-4.313031, -0.3311104, -7.277493, 1, -0.5, 0.5, 0.5,
-4.313031, -0.3311104, -7.277493, 1, 1.5, 0.5, 0.5,
-4.313031, -0.3311104, -7.277493, 0, 1.5, 0.5, 0.5
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
-4.313031, -4.453206, -0.09692502, 0, -0.5, 0.5, 0.5,
-4.313031, -4.453206, -0.09692502, 1, -0.5, 0.5, 0.5,
-4.313031, -4.453206, -0.09692502, 1, 1.5, 0.5, 0.5,
-4.313031, -4.453206, -0.09692502, 0, 1.5, 0.5, 0.5
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
-3, -3.501953, -5.620439,
3, -3.501953, -5.620439,
-3, -3.501953, -5.620439,
-3, -3.660495, -5.896614,
-2, -3.501953, -5.620439,
-2, -3.660495, -5.896614,
-1, -3.501953, -5.620439,
-1, -3.660495, -5.896614,
0, -3.501953, -5.620439,
0, -3.660495, -5.896614,
1, -3.501953, -5.620439,
1, -3.660495, -5.896614,
2, -3.501953, -5.620439,
2, -3.660495, -5.896614,
3, -3.501953, -5.620439,
3, -3.660495, -5.896614
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
"-3",
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
-3, -3.977579, -6.448966, 0, -0.5, 0.5, 0.5,
-3, -3.977579, -6.448966, 1, -0.5, 0.5, 0.5,
-3, -3.977579, -6.448966, 1, 1.5, 0.5, 0.5,
-3, -3.977579, -6.448966, 0, 1.5, 0.5, 0.5,
-2, -3.977579, -6.448966, 0, -0.5, 0.5, 0.5,
-2, -3.977579, -6.448966, 1, -0.5, 0.5, 0.5,
-2, -3.977579, -6.448966, 1, 1.5, 0.5, 0.5,
-2, -3.977579, -6.448966, 0, 1.5, 0.5, 0.5,
-1, -3.977579, -6.448966, 0, -0.5, 0.5, 0.5,
-1, -3.977579, -6.448966, 1, -0.5, 0.5, 0.5,
-1, -3.977579, -6.448966, 1, 1.5, 0.5, 0.5,
-1, -3.977579, -6.448966, 0, 1.5, 0.5, 0.5,
0, -3.977579, -6.448966, 0, -0.5, 0.5, 0.5,
0, -3.977579, -6.448966, 1, -0.5, 0.5, 0.5,
0, -3.977579, -6.448966, 1, 1.5, 0.5, 0.5,
0, -3.977579, -6.448966, 0, 1.5, 0.5, 0.5,
1, -3.977579, -6.448966, 0, -0.5, 0.5, 0.5,
1, -3.977579, -6.448966, 1, -0.5, 0.5, 0.5,
1, -3.977579, -6.448966, 1, 1.5, 0.5, 0.5,
1, -3.977579, -6.448966, 0, 1.5, 0.5, 0.5,
2, -3.977579, -6.448966, 0, -0.5, 0.5, 0.5,
2, -3.977579, -6.448966, 1, -0.5, 0.5, 0.5,
2, -3.977579, -6.448966, 1, 1.5, 0.5, 0.5,
2, -3.977579, -6.448966, 0, 1.5, 0.5, 0.5,
3, -3.977579, -6.448966, 0, -0.5, 0.5, 0.5,
3, -3.977579, -6.448966, 1, -0.5, 0.5, 0.5,
3, -3.977579, -6.448966, 1, 1.5, 0.5, 0.5,
3, -3.977579, -6.448966, 0, 1.5, 0.5, 0.5
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
-3.325111, -3, -5.620439,
-3.325111, 2, -5.620439,
-3.325111, -3, -5.620439,
-3.489765, -3, -5.896614,
-3.325111, -2, -5.620439,
-3.489765, -2, -5.896614,
-3.325111, -1, -5.620439,
-3.489765, -1, -5.896614,
-3.325111, 0, -5.620439,
-3.489765, 0, -5.896614,
-3.325111, 1, -5.620439,
-3.489765, 1, -5.896614,
-3.325111, 2, -5.620439,
-3.489765, 2, -5.896614
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
"2"
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
-3.819071, -3, -6.448966, 0, -0.5, 0.5, 0.5,
-3.819071, -3, -6.448966, 1, -0.5, 0.5, 0.5,
-3.819071, -3, -6.448966, 1, 1.5, 0.5, 0.5,
-3.819071, -3, -6.448966, 0, 1.5, 0.5, 0.5,
-3.819071, -2, -6.448966, 0, -0.5, 0.5, 0.5,
-3.819071, -2, -6.448966, 1, -0.5, 0.5, 0.5,
-3.819071, -2, -6.448966, 1, 1.5, 0.5, 0.5,
-3.819071, -2, -6.448966, 0, 1.5, 0.5, 0.5,
-3.819071, -1, -6.448966, 0, -0.5, 0.5, 0.5,
-3.819071, -1, -6.448966, 1, -0.5, 0.5, 0.5,
-3.819071, -1, -6.448966, 1, 1.5, 0.5, 0.5,
-3.819071, -1, -6.448966, 0, 1.5, 0.5, 0.5,
-3.819071, 0, -6.448966, 0, -0.5, 0.5, 0.5,
-3.819071, 0, -6.448966, 1, -0.5, 0.5, 0.5,
-3.819071, 0, -6.448966, 1, 1.5, 0.5, 0.5,
-3.819071, 0, -6.448966, 0, 1.5, 0.5, 0.5,
-3.819071, 1, -6.448966, 0, -0.5, 0.5, 0.5,
-3.819071, 1, -6.448966, 1, -0.5, 0.5, 0.5,
-3.819071, 1, -6.448966, 1, 1.5, 0.5, 0.5,
-3.819071, 1, -6.448966, 0, 1.5, 0.5, 0.5,
-3.819071, 2, -6.448966, 0, -0.5, 0.5, 0.5,
-3.819071, 2, -6.448966, 1, -0.5, 0.5, 0.5,
-3.819071, 2, -6.448966, 1, 1.5, 0.5, 0.5,
-3.819071, 2, -6.448966, 0, 1.5, 0.5, 0.5
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
-3.325111, -3.501953, -4,
-3.325111, -3.501953, 4,
-3.325111, -3.501953, -4,
-3.489765, -3.660495, -4,
-3.325111, -3.501953, -2,
-3.489765, -3.660495, -2,
-3.325111, -3.501953, 0,
-3.489765, -3.660495, 0,
-3.325111, -3.501953, 2,
-3.489765, -3.660495, 2,
-3.325111, -3.501953, 4,
-3.489765, -3.660495, 4
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
-3.819071, -3.977579, -4, 0, -0.5, 0.5, 0.5,
-3.819071, -3.977579, -4, 1, -0.5, 0.5, 0.5,
-3.819071, -3.977579, -4, 1, 1.5, 0.5, 0.5,
-3.819071, -3.977579, -4, 0, 1.5, 0.5, 0.5,
-3.819071, -3.977579, -2, 0, -0.5, 0.5, 0.5,
-3.819071, -3.977579, -2, 1, -0.5, 0.5, 0.5,
-3.819071, -3.977579, -2, 1, 1.5, 0.5, 0.5,
-3.819071, -3.977579, -2, 0, 1.5, 0.5, 0.5,
-3.819071, -3.977579, 0, 0, -0.5, 0.5, 0.5,
-3.819071, -3.977579, 0, 1, -0.5, 0.5, 0.5,
-3.819071, -3.977579, 0, 1, 1.5, 0.5, 0.5,
-3.819071, -3.977579, 0, 0, 1.5, 0.5, 0.5,
-3.819071, -3.977579, 2, 0, -0.5, 0.5, 0.5,
-3.819071, -3.977579, 2, 1, -0.5, 0.5, 0.5,
-3.819071, -3.977579, 2, 1, 1.5, 0.5, 0.5,
-3.819071, -3.977579, 2, 0, 1.5, 0.5, 0.5,
-3.819071, -3.977579, 4, 0, -0.5, 0.5, 0.5,
-3.819071, -3.977579, 4, 1, -0.5, 0.5, 0.5,
-3.819071, -3.977579, 4, 1, 1.5, 0.5, 0.5,
-3.819071, -3.977579, 4, 0, 1.5, 0.5, 0.5
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
-3.325111, -3.501953, -5.620439,
-3.325111, 2.839732, -5.620439,
-3.325111, -3.501953, 5.426589,
-3.325111, 2.839732, 5.426589,
-3.325111, -3.501953, -5.620439,
-3.325111, -3.501953, 5.426589,
-3.325111, 2.839732, -5.620439,
-3.325111, 2.839732, 5.426589,
-3.325111, -3.501953, -5.620439,
3.261021, -3.501953, -5.620439,
-3.325111, -3.501953, 5.426589,
3.261021, -3.501953, 5.426589,
-3.325111, 2.839732, -5.620439,
3.261021, 2.839732, -5.620439,
-3.325111, 2.839732, 5.426589,
3.261021, 2.839732, 5.426589,
3.261021, -3.501953, -5.620439,
3.261021, 2.839732, -5.620439,
3.261021, -3.501953, 5.426589,
3.261021, 2.839732, 5.426589,
3.261021, -3.501953, -5.620439,
3.261021, -3.501953, 5.426589,
3.261021, 2.839732, -5.620439,
3.261021, 2.839732, 5.426589
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
var radius = 7.657194;
var distance = 34.06772;
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
mvMatrix.translate( 0.03204513, 0.3311104, 0.09692502 );
mvMatrix.scale( 1.257052, 1.305506, 0.7494422 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.06772);
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
gl.drawArrays(gl.LINES, 0, 16);
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
gl.drawElements(gl.TRIANGLES, 42, gl.UNSIGNED_SHORT, 0);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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


```r
open3d()
```

```
## glX 
##   2
```

```r
Naproanilide<-read.table("Naproanilide.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Naproanilide$V2
```

```
## Error in eval(expr, envir, enclos): object 'Naproanilide' not found
```

```r
y<-Naproanilide$V3
```

```
## Error in eval(expr, envir, enclos): object 'Naproanilide' not found
```

```r
z<-Naproanilide$V4
```

```
## Error in eval(expr, envir, enclos): object 'Naproanilide' not found
```

```r
atomcolor=c(rep("blue", 1), rep("red", 5), rep("black", 7), rep("white", 15))
#spheres3d(x, y, z, col=rainbow(1000))
spheres3d(x, y, z, col=atomcolor)
```

<canvas id="testgl2textureCanvas" style="display: none;" width="256" height="256">
Your browser does not support the HTML5 canvas element.</canvas>
<!-- ****** spheres object 25 ****** -->
<script id="testgl2vshader25" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec3 aNorm;
uniform mat4 normMatrix;
varying vec3 vNormal;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
vNormal = normalize((normMatrix * vec4(aNorm, 1.)).xyz);
}
</script>
<script id="testgl2fshader25" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec3 vNormal;
void main(void) {
vec3 eye = normalize(-vPosition.xyz);
const vec3 emission = vec3(0., 0., 0.);
const vec3 ambient1 = vec3(0., 0., 0.);
const vec3 specular1 = vec3(1., 1., 1.);// light*material
const float shininess1 = 50.;
vec4 colDiff1 = vec4(vCol.rgb * vec3(1., 1., 1.), vCol.a);
const vec3 lightDir1 = vec3(0., 0., 1.);
vec3 halfVec1 = normalize(lightDir1 + eye);
vec4 lighteffect = vec4(emission, 0.);
vec3 n = normalize(vNormal);
n = -faceforward(n, n, eye);
vec3 col1 = ambient1;
float nDotL1 = dot(n, lightDir1);
col1 = col1 + max(nDotL1, 0.) * colDiff1.rgb;
col1 = col1 + pow(max(dot(halfVec1, n), 0.), shininess1) * specular1;
lighteffect = lighteffect + vec4(col1, colDiff1.a);
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
function testgl2webGLStart() {
var debug = function(msg) {
document.getElementById("testgl2debug").innerHTML = msg;
}
debug("");
var canvas = document.getElementById("testgl2canvas");
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
var activeSubscene = 19;
zoom[19] = 1;
fov[19] = 30;
userMatrix[19] = new CanvasMatrix4();
userMatrix[19].load([
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
var canvas = document.getElementById("testgl2textureCanvas");
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
// ****** sphere object ******
var v=new Float32Array([
-1, 0, 0,
1, 0, 0,
0, -1, 0,
0, 1, 0,
0, 0, -1,
0, 0, 1,
-0.7071068, 0, -0.7071068,
-0.7071068, -0.7071068, 0,
0, -0.7071068, -0.7071068,
-0.7071068, 0, 0.7071068,
0, -0.7071068, 0.7071068,
-0.7071068, 0.7071068, 0,
0, 0.7071068, -0.7071068,
0, 0.7071068, 0.7071068,
0.7071068, -0.7071068, 0,
0.7071068, 0, -0.7071068,
0.7071068, 0, 0.7071068,
0.7071068, 0.7071068, 0,
-0.9349975, 0, -0.3546542,
-0.9349975, -0.3546542, 0,
-0.77044, -0.4507894, -0.4507894,
0, -0.3546542, -0.9349975,
-0.3546542, 0, -0.9349975,
-0.4507894, -0.4507894, -0.77044,
-0.3546542, -0.9349975, 0,
0, -0.9349975, -0.3546542,
-0.4507894, -0.77044, -0.4507894,
-0.9349975, 0, 0.3546542,
-0.77044, -0.4507894, 0.4507894,
0, -0.9349975, 0.3546542,
-0.4507894, -0.77044, 0.4507894,
-0.3546542, 0, 0.9349975,
0, -0.3546542, 0.9349975,
-0.4507894, -0.4507894, 0.77044,
-0.9349975, 0.3546542, 0,
-0.77044, 0.4507894, -0.4507894,
0, 0.9349975, -0.3546542,
-0.3546542, 0.9349975, 0,
-0.4507894, 0.77044, -0.4507894,
0, 0.3546542, -0.9349975,
-0.4507894, 0.4507894, -0.77044,
-0.77044, 0.4507894, 0.4507894,
0, 0.3546542, 0.9349975,
-0.4507894, 0.4507894, 0.77044,
0, 0.9349975, 0.3546542,
-0.4507894, 0.77044, 0.4507894,
0.9349975, -0.3546542, 0,
0.9349975, 0, -0.3546542,
0.77044, -0.4507894, -0.4507894,
0.3546542, -0.9349975, 0,
0.4507894, -0.77044, -0.4507894,
0.3546542, 0, -0.9349975,
0.4507894, -0.4507894, -0.77044,
0.9349975, 0, 0.3546542,
0.77044, -0.4507894, 0.4507894,
0.3546542, 0, 0.9349975,
0.4507894, -0.4507894, 0.77044,
0.4507894, -0.77044, 0.4507894,
0.9349975, 0.3546542, 0,
0.77044, 0.4507894, -0.4507894,
0.4507894, 0.4507894, -0.77044,
0.3546542, 0.9349975, 0,
0.4507894, 0.77044, -0.4507894,
0.77044, 0.4507894, 0.4507894,
0.4507894, 0.77044, 0.4507894,
0.4507894, 0.4507894, 0.77044
]);
var f=new Uint16Array([
0, 18, 19,
6, 20, 18,
7, 19, 20,
19, 18, 20,
4, 21, 22,
8, 23, 21,
6, 22, 23,
22, 21, 23,
2, 24, 25,
7, 26, 24,
8, 25, 26,
25, 24, 26,
7, 20, 26,
6, 23, 20,
8, 26, 23,
26, 20, 23,
0, 19, 27,
7, 28, 19,
9, 27, 28,
27, 19, 28,
2, 29, 24,
10, 30, 29,
7, 24, 30,
24, 29, 30,
5, 31, 32,
9, 33, 31,
10, 32, 33,
32, 31, 33,
9, 28, 33,
7, 30, 28,
10, 33, 30,
33, 28, 30,
0, 34, 18,
11, 35, 34,
6, 18, 35,
18, 34, 35,
3, 36, 37,
12, 38, 36,
11, 37, 38,
37, 36, 38,
4, 22, 39,
6, 40, 22,
12, 39, 40,
39, 22, 40,
6, 35, 40,
11, 38, 35,
12, 40, 38,
40, 35, 38,
0, 27, 34,
9, 41, 27,
11, 34, 41,
34, 27, 41,
5, 42, 31,
13, 43, 42,
9, 31, 43,
31, 42, 43,
3, 37, 44,
11, 45, 37,
13, 44, 45,
44, 37, 45,
11, 41, 45,
9, 43, 41,
13, 45, 43,
45, 41, 43,
1, 46, 47,
14, 48, 46,
15, 47, 48,
47, 46, 48,
2, 25, 49,
8, 50, 25,
14, 49, 50,
49, 25, 50,
4, 51, 21,
15, 52, 51,
8, 21, 52,
21, 51, 52,
15, 48, 52,
14, 50, 48,
8, 52, 50,
52, 48, 50,
1, 53, 46,
16, 54, 53,
14, 46, 54,
46, 53, 54,
5, 32, 55,
10, 56, 32,
16, 55, 56,
55, 32, 56,
2, 49, 29,
14, 57, 49,
10, 29, 57,
29, 49, 57,
14, 54, 57,
16, 56, 54,
10, 57, 56,
57, 54, 56,
1, 47, 58,
15, 59, 47,
17, 58, 59,
58, 47, 59,
4, 39, 51,
12, 60, 39,
15, 51, 60,
51, 39, 60,
3, 61, 36,
17, 62, 61,
12, 36, 62,
36, 61, 62,
17, 59, 62,
15, 60, 59,
12, 62, 60,
62, 59, 60,
1, 58, 53,
17, 63, 58,
16, 53, 63,
53, 58, 63,
3, 44, 61,
13, 64, 44,
17, 61, 64,
61, 44, 64,
5, 55, 42,
16, 65, 55,
13, 42, 65,
42, 55, 65,
16, 63, 65,
17, 64, 63,
13, 65, 64,
65, 63, 64
]);
var sphereBuf = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, sphereBuf);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var sphereIbuf = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, sphereIbuf);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
// ****** spheres object 25 ******
var prog25  = gl.createProgram();
gl.attachShader(prog25, getShader( gl, "testgl2vshader25" ));
gl.attachShader(prog25, getShader( gl, "testgl2fshader25" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog25, 0, "aPos");
gl.bindAttribLocation(prog25, 1, "aCol");
gl.linkProgram(prog25);
var v=new Float32Array([
-3.229197, -2.323563, -1.357111, 0, 0, 1, 1, 1,
-2.776536, -1.912669, -3.44369, 1, 0, 0, 1, 1,
-2.632364, -0.5422308, -1.085472, 1, 0, 0, 1, 1,
-2.574897, 0.09012622, -1.687012, 1, 0, 0, 1, 1,
-2.527442, -0.5474593, -1.228524, 1, 0, 0, 1, 1,
-2.523688, 1.046694, -3.771243, 1, 0, 0, 1, 1,
-2.497432, -0.1671659, -1.047552, 0, 0, 0, 1, 1,
-2.480511, -0.2087512, -0.6236799, 0, 0, 0, 1, 1,
-2.467075, -1.79803, -2.261998, 0, 0, 0, 1, 1,
-2.449295, 0.01112428, -2.307871, 0, 0, 0, 1, 1,
-2.426673, -2.041821, -1.415125, 0, 0, 0, 1, 1,
-2.417567, 0.2638709, -1.939434, 0, 0, 0, 1, 1,
-2.375694, -0.6106001, -2.791247, 0, 0, 0, 1, 1,
-2.28472, -0.8602055, -2.500134, 1, 1, 1, 1, 1,
-2.267676, -0.3889899, -0.5423198, 1, 1, 1, 1, 1,
-2.254146, 0.233185, -2.004939, 1, 1, 1, 1, 1,
-2.230434, 2.09358, -2.246372, 1, 1, 1, 1, 1,
-2.208272, -0.8652048, -1.498081, 1, 1, 1, 1, 1,
-2.203857, 1.353654, -1.451777, 1, 1, 1, 1, 1,
-2.154893, -0.03020103, 1.171697, 1, 1, 1, 1, 1,
-2.12104, 0.7125118, -1.843861, 1, 1, 1, 1, 1,
-2.118367, 0.07255332, 0.2597144, 1, 1, 1, 1, 1,
-2.109996, -1.690833, -3.572182, 1, 1, 1, 1, 1,
-2.100824, -0.1288079, -1.772531, 1, 1, 1, 1, 1,
-2.052746, -0.2862794, -1.455729, 1, 1, 1, 1, 1,
-2.01646, 1.389059, -0.03617237, 1, 1, 1, 1, 1,
-2.01634, -0.5050241, -2.001289, 1, 1, 1, 1, 1,
-2.010635, -1.242417, -2.644563, 1, 1, 1, 1, 1,
-1.994769, 0.01474091, -2.785755, 0, 0, 1, 1, 1,
-1.933197, -0.3344705, -3.833781, 1, 0, 0, 1, 1,
-1.89539, -1.167176, -3.101158, 1, 0, 0, 1, 1,
-1.845408, 0.6839415, 0.4188883, 1, 0, 0, 1, 1,
-1.843233, 0.110585, -1.789061, 1, 0, 0, 1, 1,
-1.820096, -1.07536, -1.82654, 1, 0, 0, 1, 1,
-1.818018, 2.022937, -0.7341697, 0, 0, 0, 1, 1,
-1.812484, 0.7980053, -1.206135, 0, 0, 0, 1, 1,
-1.789985, 0.1163169, -1.795159, 0, 0, 0, 1, 1,
-1.789308, -0.9752504, -3.492133, 0, 0, 0, 1, 1,
-1.785837, -0.06772728, -1.142399, 0, 0, 0, 1, 1,
-1.777001, -0.3943039, -2.947053, 0, 0, 0, 1, 1,
-1.767812, 0.5301206, -1.054591, 0, 0, 0, 1, 1,
-1.754788, -0.7131023, -2.184823, 1, 1, 1, 1, 1,
-1.744255, 1.766631, -0.761107, 1, 1, 1, 1, 1,
-1.710976, -0.6684803, -1.58906, 1, 1, 1, 1, 1,
-1.705493, -0.2162923, -1.648029, 1, 1, 1, 1, 1,
-1.697786, -0.6256468, -1.998538, 1, 1, 1, 1, 1,
-1.669556, 1.016382, -0.1887663, 1, 1, 1, 1, 1,
-1.658251, -0.6877428, -3.226406, 1, 1, 1, 1, 1,
-1.644405, 0.1565426, -0.6851687, 1, 1, 1, 1, 1,
-1.631302, 2.21648, -0.2677344, 1, 1, 1, 1, 1,
-1.627094, 0.5052707, -0.05733831, 1, 1, 1, 1, 1,
-1.613797, 1.690202, -1.146316, 1, 1, 1, 1, 1,
-1.602212, -0.2296877, -0.5403171, 1, 1, 1, 1, 1,
-1.580728, 1.656716, -2.284669, 1, 1, 1, 1, 1,
-1.548682, -0.6324777, -2.014889, 1, 1, 1, 1, 1,
-1.546261, -0.5363458, -1.128399, 1, 1, 1, 1, 1,
-1.536422, 0.4334334, -0.8683311, 0, 0, 1, 1, 1,
-1.521471, 1.183719, -0.384619, 1, 0, 0, 1, 1,
-1.518803, 0.4236426, -2.470483, 1, 0, 0, 1, 1,
-1.515613, 0.1884887, -0.7842191, 1, 0, 0, 1, 1,
-1.509424, -0.1695798, -1.925582, 1, 0, 0, 1, 1,
-1.502314, 0.09673943, -1.131992, 1, 0, 0, 1, 1,
-1.485289, 0.6834791, -1.802406, 0, 0, 0, 1, 1,
-1.485146, 0.3928527, -1.915379, 0, 0, 0, 1, 1,
-1.4822, 0.9098646, -1.273364, 0, 0, 0, 1, 1,
-1.478245, 0.3517034, -1.81088, 0, 0, 0, 1, 1,
-1.475483, 0.0194212, -2.421529, 0, 0, 0, 1, 1,
-1.467211, -0.2182218, -1.83162, 0, 0, 0, 1, 1,
-1.463024, -1.503415, -4.031197, 0, 0, 0, 1, 1,
-1.462183, 0.6097047, -1.200124, 1, 1, 1, 1, 1,
-1.457498, -0.4387932, 0.07866428, 1, 1, 1, 1, 1,
-1.457283, -0.8017704, -2.707195, 1, 1, 1, 1, 1,
-1.456757, 1.094198, -0.8886639, 1, 1, 1, 1, 1,
-1.454107, -1.361208, -0.6692143, 1, 1, 1, 1, 1,
-1.437425, 0.8568154, -0.817159, 1, 1, 1, 1, 1,
-1.420476, -0.6009063, -1.223169, 1, 1, 1, 1, 1,
-1.415124, -0.5374441, -3.695071, 1, 1, 1, 1, 1,
-1.410182, 0.6253264, 0.3497728, 1, 1, 1, 1, 1,
-1.406994, 0.4268471, -1.403698, 1, 1, 1, 1, 1,
-1.398432, 0.1739672, -2.071884, 1, 1, 1, 1, 1,
-1.396154, 0.2641348, -0.9041418, 1, 1, 1, 1, 1,
-1.390056, 0.5520868, 0.7755729, 1, 1, 1, 1, 1,
-1.385963, 0.2570174, -0.1605744, 1, 1, 1, 1, 1,
-1.385002, -0.2702236, -0.02734577, 1, 1, 1, 1, 1,
-1.383838, -0.4391478, -1.527002, 0, 0, 1, 1, 1,
-1.380543, -0.3151311, -1.750448, 1, 0, 0, 1, 1,
-1.379143, -0.5300546, -2.543406, 1, 0, 0, 1, 1,
-1.378115, -1.920359, -2.360569, 1, 0, 0, 1, 1,
-1.370087, -0.4719791, -1.179554, 1, 0, 0, 1, 1,
-1.360343, -0.3267622, -0.9056717, 1, 0, 0, 1, 1,
-1.356321, 1.010219, 0.1898566, 0, 0, 0, 1, 1,
-1.346352, 0.09704915, -1.812462, 0, 0, 0, 1, 1,
-1.325917, 0.002449858, -2.848032, 0, 0, 0, 1, 1,
-1.323509, -0.4178262, -0.5085645, 0, 0, 0, 1, 1,
-1.32045, 0.04172922, -2.960299, 0, 0, 0, 1, 1,
-1.307744, 0.5387484, -1.988459, 0, 0, 0, 1, 1,
-1.307105, 0.8337719, -0.06008778, 0, 0, 0, 1, 1,
-1.293516, 0.8080946, -0.8840475, 1, 1, 1, 1, 1,
-1.293114, 0.7456785, -0.7053463, 1, 1, 1, 1, 1,
-1.286447, 1.354715, -0.736881, 1, 1, 1, 1, 1,
-1.281015, -0.3074058, -0.9885269, 1, 1, 1, 1, 1,
-1.280984, -1.183333, -2.544772, 1, 1, 1, 1, 1,
-1.275399, -0.8657776, -2.509243, 1, 1, 1, 1, 1,
-1.269678, 2.333165, 0.5294253, 1, 1, 1, 1, 1,
-1.254874, -0.7037888, -0.3058259, 1, 1, 1, 1, 1,
-1.247242, 0.4858876, -2.883523, 1, 1, 1, 1, 1,
-1.23723, 0.952287, -0.7088467, 1, 1, 1, 1, 1,
-1.236081, -0.8549021, -1.487606, 1, 1, 1, 1, 1,
-1.233238, -0.5832986, -3.153489, 1, 1, 1, 1, 1,
-1.226801, 0.8401804, -3.307168, 1, 1, 1, 1, 1,
-1.22167, -2.551664, -4.043676, 1, 1, 1, 1, 1,
-1.221578, -0.5184417, -4.121341, 1, 1, 1, 1, 1,
-1.221091, 0.907479, -1.177773, 0, 0, 1, 1, 1,
-1.21815, 0.1442746, -2.754399, 1, 0, 0, 1, 1,
-1.210033, 0.1556671, -2.769555, 1, 0, 0, 1, 1,
-1.208745, -1.246269, -2.008405, 1, 0, 0, 1, 1,
-1.201581, -0.5588713, -2.789393, 1, 0, 0, 1, 1,
-1.191002, 1.790874, 0.9206787, 1, 0, 0, 1, 1,
-1.178599, -0.736015, -0.3547791, 0, 0, 0, 1, 1,
-1.174449, -0.9456132, -3.5785, 0, 0, 0, 1, 1,
-1.17317, -0.2558917, -1.039234, 0, 0, 0, 1, 1,
-1.170798, 1.129586, 2.222444, 0, 0, 0, 1, 1,
-1.168824, 0.7720518, -2.640387, 0, 0, 0, 1, 1,
-1.166731, 1.062939, -2.367641, 0, 0, 0, 1, 1,
-1.161371, 0.5737193, -2.227573, 0, 0, 0, 1, 1,
-1.154955, 1.11814, -0.1500583, 1, 1, 1, 1, 1,
-1.149009, -0.2042828, -2.275855, 1, 1, 1, 1, 1,
-1.142594, 0.6104879, -1.005077, 1, 1, 1, 1, 1,
-1.134748, 0.9522035, -0.9432138, 1, 1, 1, 1, 1,
-1.128173, -0.2791076, -0.985248, 1, 1, 1, 1, 1,
-1.119998, -0.606654, -0.8800611, 1, 1, 1, 1, 1,
-1.110247, 1.947161, -0.9718753, 1, 1, 1, 1, 1,
-1.109636, -1.856129, -1.247727, 1, 1, 1, 1, 1,
-1.109357, -0.2747043, -2.5849, 1, 1, 1, 1, 1,
-1.108906, -0.5705737, -4.124306, 1, 1, 1, 1, 1,
-1.108485, 1.329643, -1.520638, 1, 1, 1, 1, 1,
-1.101541, -0.02300824, -1.619198, 1, 1, 1, 1, 1,
-1.097313, 0.8491911, -1.786629, 1, 1, 1, 1, 1,
-1.093692, 0.5393306, -0.976939, 1, 1, 1, 1, 1,
-1.088662, 0.02167864, -2.657073, 1, 1, 1, 1, 1,
-1.085867, -0.7820088, -3.273895, 0, 0, 1, 1, 1,
-1.085746, -0.1636875, -0.02421881, 1, 0, 0, 1, 1,
-1.082967, -0.665808, -1.52987, 1, 0, 0, 1, 1,
-1.082753, -0.7019392, -2.843985, 1, 0, 0, 1, 1,
-1.080027, 2.006881, 0.5609429, 1, 0, 0, 1, 1,
-1.07762, -0.3815901, -1.346213, 1, 0, 0, 1, 1,
-1.077166, 0.02876803, -1.259166, 0, 0, 0, 1, 1,
-1.073127, 0.4110864, -3.29805, 0, 0, 0, 1, 1,
-1.066962, -0.2660698, -1.288971, 0, 0, 0, 1, 1,
-1.058854, 0.457856, -1.762679, 0, 0, 0, 1, 1,
-1.057758, 0.06472988, -2.668357, 0, 0, 0, 1, 1,
-1.057746, 0.28509, -0.1131206, 0, 0, 0, 1, 1,
-1.053202, 1.666668, -0.06643344, 0, 0, 0, 1, 1,
-1.052444, 0.1313988, -0.9962707, 1, 1, 1, 1, 1,
-1.043231, -1.004469, -2.506211, 1, 1, 1, 1, 1,
-1.042992, 0.2150324, -5.15984, 1, 1, 1, 1, 1,
-1.042226, 0.5887942, -2.852995, 1, 1, 1, 1, 1,
-1.032881, -1.31528, -0.9914312, 1, 1, 1, 1, 1,
-1.028136, -0.09128194, -1.602944, 1, 1, 1, 1, 1,
-1.024347, -0.9703851, -1.94336, 1, 1, 1, 1, 1,
-1.022456, 0.1306598, -1.536585, 1, 1, 1, 1, 1,
-1.021824, 0.2176247, -1.268277, 1, 1, 1, 1, 1,
-1.020951, 2.719659, -0.2085699, 1, 1, 1, 1, 1,
-1.018275, -0.9396954, -2.367789, 1, 1, 1, 1, 1,
-1.014428, -0.6709189, -3.89124, 1, 1, 1, 1, 1,
-1.013558, 0.2300932, -1.811484, 1, 1, 1, 1, 1,
-1.012256, 2.601932, -0.3944248, 1, 1, 1, 1, 1,
-1.010203, 0.1610815, -0.1461968, 1, 1, 1, 1, 1,
-1.007159, -0.8262745, -3.141178, 0, 0, 1, 1, 1,
-1.006633, 0.8079877, -0.6171658, 1, 0, 0, 1, 1,
-1.001429, -0.4561939, -1.739132, 1, 0, 0, 1, 1,
-0.996794, 0.3594168, -2.201345, 1, 0, 0, 1, 1,
-0.9963257, 1.049295, -0.7690781, 1, 0, 0, 1, 1,
-0.990217, 0.9667594, -1.249726, 1, 0, 0, 1, 1,
-0.9798775, 0.05861021, -2.277389, 0, 0, 0, 1, 1,
-0.9745806, 2.236404, 0.05242947, 0, 0, 0, 1, 1,
-0.9718277, -0.6680605, -0.2032103, 0, 0, 0, 1, 1,
-0.9691368, 0.2161713, -3.948247, 0, 0, 0, 1, 1,
-0.965232, -0.9077867, -3.149777, 0, 0, 0, 1, 1,
-0.9557476, 0.4318853, -2.490301, 0, 0, 0, 1, 1,
-0.9556931, -1.051682, -2.672933, 0, 0, 0, 1, 1,
-0.9509935, 0.01583767, -0.5510428, 1, 1, 1, 1, 1,
-0.9491304, 1.419793, -0.6360007, 1, 1, 1, 1, 1,
-0.9472333, -0.08387826, -1.329088, 1, 1, 1, 1, 1,
-0.9433903, -0.08078358, -1.36092, 1, 1, 1, 1, 1,
-0.942863, 0.7139553, 0.03015629, 1, 1, 1, 1, 1,
-0.9422296, -0.741634, -2.072535, 1, 1, 1, 1, 1,
-0.9345003, -1.073676, -2.663098, 1, 1, 1, 1, 1,
-0.9338906, -2.100083, -2.044776, 1, 1, 1, 1, 1,
-0.9214985, 0.3652897, 0.00332747, 1, 1, 1, 1, 1,
-0.915595, -0.3109962, -2.411771, 1, 1, 1, 1, 1,
-0.910167, 0.1526184, -0.8850822, 1, 1, 1, 1, 1,
-0.9066361, -0.5599734, -2.52814, 1, 1, 1, 1, 1,
-0.9013236, 0.1956198, -0.9983894, 1, 1, 1, 1, 1,
-0.9005256, 1.329914, -2.244859, 1, 1, 1, 1, 1,
-0.899947, -1.375185, -3.012997, 1, 1, 1, 1, 1,
-0.8955576, -0.6814292, -1.343861, 0, 0, 1, 1, 1,
-0.8952488, 1.425431, -2.40342, 1, 0, 0, 1, 1,
-0.8934321, -1.054933, -2.42625, 1, 0, 0, 1, 1,
-0.8927343, -0.2765116, 0.1675526, 1, 0, 0, 1, 1,
-0.8872705, -2.084794, -3.212546, 1, 0, 0, 1, 1,
-0.8628775, 1.26067, -1.027593, 1, 0, 0, 1, 1,
-0.85989, 0.3101988, -0.7807869, 0, 0, 0, 1, 1,
-0.8576934, -1.797315, -4.375153, 0, 0, 0, 1, 1,
-0.8331661, -0.5764312, -3.933527, 0, 0, 0, 1, 1,
-0.8278594, -0.1738904, -2.830848, 0, 0, 0, 1, 1,
-0.8270115, -0.2859735, -1.042454, 0, 0, 0, 1, 1,
-0.822704, -0.3835917, -1.182281, 0, 0, 0, 1, 1,
-0.8209175, -0.94305, -2.664722, 0, 0, 0, 1, 1,
-0.8189113, 1.352988, 0.2166489, 1, 1, 1, 1, 1,
-0.8157895, 2.574484, -2.421904, 1, 1, 1, 1, 1,
-0.8150548, 1.331454, -0.2217634, 1, 1, 1, 1, 1,
-0.8112667, 0.2068381, -0.8527117, 1, 1, 1, 1, 1,
-0.8093967, -0.5710567, -3.045059, 1, 1, 1, 1, 1,
-0.8093322, 0.3537348, -1.390992, 1, 1, 1, 1, 1,
-0.8067224, 0.6881642, -0.3941823, 1, 1, 1, 1, 1,
-0.7965878, -1.363738, -2.322795, 1, 1, 1, 1, 1,
-0.7937884, 0.1550539, -0.9560844, 1, 1, 1, 1, 1,
-0.7935469, -0.2517859, -2.992106, 1, 1, 1, 1, 1,
-0.7931026, -0.1588643, -1.427823, 1, 1, 1, 1, 1,
-0.7924252, -1.029312, -3.769066, 1, 1, 1, 1, 1,
-0.7867615, 0.2903226, 0.8408217, 1, 1, 1, 1, 1,
-0.785578, 1.624889, 1.70229, 1, 1, 1, 1, 1,
-0.7843862, 1.401685, -2.329942, 1, 1, 1, 1, 1,
-0.7782007, 0.3779619, -0.01993457, 0, 0, 1, 1, 1,
-0.7773343, 0.3346719, -0.2496749, 1, 0, 0, 1, 1,
-0.7757738, -1.347029, -3.211152, 1, 0, 0, 1, 1,
-0.7719512, -1.385721, -3.33462, 1, 0, 0, 1, 1,
-0.7708346, -0.3075457, -3.801016, 1, 0, 0, 1, 1,
-0.7704641, -1.061742, -2.677887, 1, 0, 0, 1, 1,
-0.7506248, -1.057347, -1.188007, 0, 0, 0, 1, 1,
-0.7497257, 0.05929152, -0.110379, 0, 0, 0, 1, 1,
-0.7444847, -0.7180997, -3.368668, 0, 0, 0, 1, 1,
-0.7420151, 0.8317817, 0.1481746, 0, 0, 0, 1, 1,
-0.7394843, 0.7598134, -1.303691, 0, 0, 0, 1, 1,
-0.7376233, 0.5925889, -0.1056696, 0, 0, 0, 1, 1,
-0.7367148, 0.08504053, -0.7848344, 0, 0, 0, 1, 1,
-0.7342062, -0.3910511, -1.70884, 1, 1, 1, 1, 1,
-0.7286312, 1.109006, -1.384041, 1, 1, 1, 1, 1,
-0.7272866, 0.5999478, -0.663633, 1, 1, 1, 1, 1,
-0.7262279, -0.8887496, -3.06141, 1, 1, 1, 1, 1,
-0.7247846, -0.9415102, -2.136097, 1, 1, 1, 1, 1,
-0.723123, 0.4633232, 0.6171679, 1, 1, 1, 1, 1,
-0.7214945, -1.074443, -1.426227, 1, 1, 1, 1, 1,
-0.7195999, 1.012161, -0.4670483, 1, 1, 1, 1, 1,
-0.717665, 0.4825582, 0.5590954, 1, 1, 1, 1, 1,
-0.716961, 1.257112, -1.325824, 1, 1, 1, 1, 1,
-0.7131195, -1.600056, -1.834164, 1, 1, 1, 1, 1,
-0.7123945, 0.805727, -0.2894319, 1, 1, 1, 1, 1,
-0.7092645, -0.7254479, -1.905551, 1, 1, 1, 1, 1,
-0.708243, -0.1107244, -1.788888, 1, 1, 1, 1, 1,
-0.7037864, -0.6942278, -2.102159, 1, 1, 1, 1, 1,
-0.6921482, -0.02400561, -1.154305, 0, 0, 1, 1, 1,
-0.6879812, -0.876921, -4.97128, 1, 0, 0, 1, 1,
-0.6869619, -1.518109, -2.995978, 1, 0, 0, 1, 1,
-0.6846131, 0.05256404, -2.240391, 1, 0, 0, 1, 1,
-0.6832591, 1.148292, -1.746335, 1, 0, 0, 1, 1,
-0.6827656, -2.510189, -2.542212, 1, 0, 0, 1, 1,
-0.6809725, 1.040787, 0.9803671, 0, 0, 0, 1, 1,
-0.6805963, -0.2147444, -1.641122, 0, 0, 0, 1, 1,
-0.6745833, 0.8578206, -0.01125575, 0, 0, 0, 1, 1,
-0.6715347, 0.6263969, -0.4128937, 0, 0, 0, 1, 1,
-0.6688255, 1.546047, -0.4391, 0, 0, 0, 1, 1,
-0.6664043, -0.2560308, -2.932696, 0, 0, 0, 1, 1,
-0.6637847, -2.035913, -3.521374, 0, 0, 0, 1, 1,
-0.6605616, 0.6828187, -1.307413, 1, 1, 1, 1, 1,
-0.6584597, 0.4027572, -1.746617, 1, 1, 1, 1, 1,
-0.6569263, -0.6893696, 0.9257842, 1, 1, 1, 1, 1,
-0.6567379, -0.1335991, -1.838794, 1, 1, 1, 1, 1,
-0.6557672, -0.8478802, -4.359938, 1, 1, 1, 1, 1,
-0.6554187, 0.2722357, -1.706826, 1, 1, 1, 1, 1,
-0.6550057, 0.5148162, -1.586152, 1, 1, 1, 1, 1,
-0.6543758, 0.3482379, -0.6402618, 1, 1, 1, 1, 1,
-0.6457809, 0.4726403, -1.621774, 1, 1, 1, 1, 1,
-0.6439944, 0.2975317, -0.3064384, 1, 1, 1, 1, 1,
-0.6362011, 0.3237606, 0.5191985, 1, 1, 1, 1, 1,
-0.6346166, 1.004522, 0.218744, 1, 1, 1, 1, 1,
-0.6326643, -0.3632312, 1.071497, 1, 1, 1, 1, 1,
-0.6287444, 1.143935, -0.9352325, 1, 1, 1, 1, 1,
-0.6260064, 0.8080894, 0.04377393, 1, 1, 1, 1, 1,
-0.6250821, -0.05182088, -1.459403, 0, 0, 1, 1, 1,
-0.62181, -0.121634, 0.7691172, 1, 0, 0, 1, 1,
-0.6183252, 1.238804, 0.9394976, 1, 0, 0, 1, 1,
-0.616748, -0.2511888, -1.368785, 1, 0, 0, 1, 1,
-0.6118331, -0.9482172, -2.783635, 1, 0, 0, 1, 1,
-0.610365, -1.020531, -2.452284, 1, 0, 0, 1, 1,
-0.6090681, 0.7715254, -1.234824, 0, 0, 0, 1, 1,
-0.6078946, 0.982152, -1.698259, 0, 0, 0, 1, 1,
-0.6077997, -0.2880539, -1.894659, 0, 0, 0, 1, 1,
-0.6067163, -0.907023, -3.067078, 0, 0, 0, 1, 1,
-0.5951112, -0.8648816, -3.80501, 0, 0, 0, 1, 1,
-0.5899931, -0.1923261, -2.994883, 0, 0, 0, 1, 1,
-0.5883958, 0.6863081, -1.884425, 0, 0, 0, 1, 1,
-0.585551, 0.1815143, -0.819995, 1, 1, 1, 1, 1,
-0.5845613, -0.5866439, -2.107655, 1, 1, 1, 1, 1,
-0.5825088, -2.016824, -3.332387, 1, 1, 1, 1, 1,
-0.5711261, -0.4477641, -0.2896256, 1, 1, 1, 1, 1,
-0.5710026, -1.155142, -3.920322, 1, 1, 1, 1, 1,
-0.5703408, 0.7552128, -1.218778, 1, 1, 1, 1, 1,
-0.569566, 1.092926, 1.013608, 1, 1, 1, 1, 1,
-0.5673227, 0.4115221, -2.94839, 1, 1, 1, 1, 1,
-0.5666095, 0.3084277, -1.536874, 1, 1, 1, 1, 1,
-0.5529594, 1.001173, -1.101386, 1, 1, 1, 1, 1,
-0.5509241, 0.6181513, -0.9848225, 1, 1, 1, 1, 1,
-0.5507246, 1.457578, 0.1036107, 1, 1, 1, 1, 1,
-0.5426446, -1.082525, -2.224458, 1, 1, 1, 1, 1,
-0.5410049, 0.4546466, -1.170574, 1, 1, 1, 1, 1,
-0.5396873, 2.539773, -0.3720383, 1, 1, 1, 1, 1,
-0.5365416, -0.1128794, -1.063026, 0, 0, 1, 1, 1,
-0.5318797, 0.6072536, -1.870153, 1, 0, 0, 1, 1,
-0.5225013, 0.3567535, -1.061501, 1, 0, 0, 1, 1,
-0.5201999, -0.4087918, -3.801855, 1, 0, 0, 1, 1,
-0.5178488, 0.5470264, -0.5844206, 1, 0, 0, 1, 1,
-0.5170121, -0.4492381, -2.73463, 1, 0, 0, 1, 1,
-0.5165492, 0.6351845, 0.8711051, 0, 0, 0, 1, 1,
-0.5082146, -0.6402465, -4.397666, 0, 0, 0, 1, 1,
-0.5079915, 1.036042, -0.8838518, 0, 0, 0, 1, 1,
-0.5074249, -0.199435, -0.7413658, 0, 0, 0, 1, 1,
-0.4987565, -1.323778, -3.148446, 0, 0, 0, 1, 1,
-0.4976152, 0.3864679, 1.031167, 0, 0, 0, 1, 1,
-0.4968157, 0.4416323, -0.1771759, 0, 0, 0, 1, 1,
-0.4953395, -1.592849, -3.984717, 1, 1, 1, 1, 1,
-0.493952, -0.8360335, -3.077892, 1, 1, 1, 1, 1,
-0.4934092, -0.4392349, -2.043178, 1, 1, 1, 1, 1,
-0.4882932, -0.03817978, -0.8660041, 1, 1, 1, 1, 1,
-0.484974, -1.837793, -3.849515, 1, 1, 1, 1, 1,
-0.4838687, 1.41358, 0.6207281, 1, 1, 1, 1, 1,
-0.4819386, -1.251715, -2.894915, 1, 1, 1, 1, 1,
-0.481469, 1.048849, -1.037191, 1, 1, 1, 1, 1,
-0.4800573, -0.6970197, -1.590227, 1, 1, 1, 1, 1,
-0.4770952, -1.922183, -3.641751, 1, 1, 1, 1, 1,
-0.4735467, -0.008062872, -3.378803, 1, 1, 1, 1, 1,
-0.468547, 1.65604, -0.2545542, 1, 1, 1, 1, 1,
-0.4678975, 0.2854467, -1.255837, 1, 1, 1, 1, 1,
-0.4656944, 0.3053932, -1.027712, 1, 1, 1, 1, 1,
-0.4636078, 0.4852753, -2.164216, 1, 1, 1, 1, 1,
-0.4628518, 1.123138, 0.2582333, 0, 0, 1, 1, 1,
-0.4617599, 0.1375669, -3.733473, 1, 0, 0, 1, 1,
-0.4579535, -3.397619, -2.906435, 1, 0, 0, 1, 1,
-0.4546728, -0.6893995, -0.7506693, 1, 0, 0, 1, 1,
-0.4389274, 0.1872845, -0.8065553, 1, 0, 0, 1, 1,
-0.4322891, 0.1055077, -1.309534, 1, 0, 0, 1, 1,
-0.431207, 0.9745129, -0.3796845, 0, 0, 0, 1, 1,
-0.4230163, -0.1771134, -1.657164, 0, 0, 0, 1, 1,
-0.4222613, 0.8295625, -0.3456826, 0, 0, 0, 1, 1,
-0.4198105, -0.7274309, -3.016945, 0, 0, 0, 1, 1,
-0.4121391, 1.105407, 0.3198402, 0, 0, 0, 1, 1,
-0.4113424, -0.5948733, -2.229169, 0, 0, 0, 1, 1,
-0.4076856, -0.8697464, -3.440938, 0, 0, 0, 1, 1,
-0.4067458, -0.2878883, -2.520382, 1, 1, 1, 1, 1,
-0.4041072, 0.7665666, -2.450289, 1, 1, 1, 1, 1,
-0.3964359, 0.3930291, -0.5142177, 1, 1, 1, 1, 1,
-0.3933481, -1.075202, -2.766384, 1, 1, 1, 1, 1,
-0.3920696, -0.2602336, -3.217389, 1, 1, 1, 1, 1,
-0.3915969, -2.113342, -4.542526, 1, 1, 1, 1, 1,
-0.3821721, 0.7470269, -0.7019033, 1, 1, 1, 1, 1,
-0.3820444, 0.2605113, -1.791789, 1, 1, 1, 1, 1,
-0.3714804, 0.6852768, -1.946214, 1, 1, 1, 1, 1,
-0.3697994, 0.1498366, -0.9565749, 1, 1, 1, 1, 1,
-0.3662879, -0.1796127, -2.834718, 1, 1, 1, 1, 1,
-0.3624213, 0.9859367, 0.5516062, 1, 1, 1, 1, 1,
-0.358525, 1.982585, -1.190816, 1, 1, 1, 1, 1,
-0.3583685, -0.6623748, -2.678284, 1, 1, 1, 1, 1,
-0.3565173, -0.6510382, -3.993606, 1, 1, 1, 1, 1,
-0.3549969, -1.705069, -3.138072, 0, 0, 1, 1, 1,
-0.3519313, 0.6418569, 0.02809862, 1, 0, 0, 1, 1,
-0.3492808, -0.4241816, -1.463573, 1, 0, 0, 1, 1,
-0.348573, -0.9049014, -2.048666, 1, 0, 0, 1, 1,
-0.3476323, 0.8140172, 0.2039894, 1, 0, 0, 1, 1,
-0.3454086, 0.6053333, -1.422286, 1, 0, 0, 1, 1,
-0.3448065, -1.566276, -3.868615, 0, 0, 0, 1, 1,
-0.3438249, 0.03531082, -2.192823, 0, 0, 0, 1, 1,
-0.3436897, 0.3249717, -1.452806, 0, 0, 0, 1, 1,
-0.3416452, 0.9984575, -0.1819869, 0, 0, 0, 1, 1,
-0.3372193, -0.7837716, -3.212873, 0, 0, 0, 1, 1,
-0.3370676, 0.06025678, -1.143746, 0, 0, 0, 1, 1,
-0.3365492, -0.5170059, -1.838622, 0, 0, 0, 1, 1,
-0.3334727, 2.319158, -0.6887406, 1, 1, 1, 1, 1,
-0.327238, -2.241266, -3.207622, 1, 1, 1, 1, 1,
-0.3267986, -0.5781213, -1.735854, 1, 1, 1, 1, 1,
-0.3258723, 1.647363, 1.597293, 1, 1, 1, 1, 1,
-0.3246946, -1.720064, -4.023076, 1, 1, 1, 1, 1,
-0.3215476, -0.2453122, -0.887497, 1, 1, 1, 1, 1,
-0.3211668, 0.6422817, -1.273682, 1, 1, 1, 1, 1,
-0.3184339, 1.100839, -0.1718833, 1, 1, 1, 1, 1,
-0.3157929, 0.3481287, -1.169096, 1, 1, 1, 1, 1,
-0.3147592, 2.540539, -0.01836448, 1, 1, 1, 1, 1,
-0.3137849, -0.02351029, -1.987588, 1, 1, 1, 1, 1,
-0.3103119, 0.683641, -1.268483, 1, 1, 1, 1, 1,
-0.3057252, 0.1595487, -1.449014, 1, 1, 1, 1, 1,
-0.3031444, 0.1285946, -2.565815, 1, 1, 1, 1, 1,
-0.3030996, -0.952632, -2.898069, 1, 1, 1, 1, 1,
-0.3029128, -0.2791072, -3.757956, 0, 0, 1, 1, 1,
-0.3020033, 0.1465217, 1.723314, 1, 0, 0, 1, 1,
-0.2990594, -0.585305, -3.73539, 1, 0, 0, 1, 1,
-0.2963724, -2.192226, -2.519513, 1, 0, 0, 1, 1,
-0.2908524, -0.8741956, -2.61613, 1, 0, 0, 1, 1,
-0.2860064, -0.01792128, -2.143593, 1, 0, 0, 1, 1,
-0.2825819, 0.7586948, -0.4125178, 0, 0, 0, 1, 1,
-0.2811022, 1.036091, -0.543634, 0, 0, 0, 1, 1,
-0.2790589, -0.8139622, -3.787197, 0, 0, 0, 1, 1,
-0.2719052, -1.423349, -3.803584, 0, 0, 0, 1, 1,
-0.2708851, -1.747322, -1.843148, 0, 0, 0, 1, 1,
-0.2703122, 0.326655, 0.07604028, 0, 0, 0, 1, 1,
-0.2696357, -0.3302428, -1.356513, 0, 0, 0, 1, 1,
-0.2615085, 2.355906, 0.2324841, 1, 1, 1, 1, 1,
-0.2610474, 1.3776, 0.7689921, 1, 1, 1, 1, 1,
-0.2574427, -0.799499, -4.562985, 1, 1, 1, 1, 1,
-0.2566028, 1.610806, -1.656413, 1, 1, 1, 1, 1,
-0.2562836, -0.2128555, -2.461371, 1, 1, 1, 1, 1,
-0.2561091, -1.577863, -2.586953, 1, 1, 1, 1, 1,
-0.2546674, -0.5932413, -1.983621, 1, 1, 1, 1, 1,
-0.2540735, 1.401945, 0.7558656, 1, 1, 1, 1, 1,
-0.2515334, 0.3110977, -0.3781762, 1, 1, 1, 1, 1,
-0.2483903, 1.421354, -0.4496773, 1, 1, 1, 1, 1,
-0.2434277, -0.8491625, -2.630707, 1, 1, 1, 1, 1,
-0.2432542, -0.1735908, -1.18844, 1, 1, 1, 1, 1,
-0.2378303, -0.03291932, -1.446504, 1, 1, 1, 1, 1,
-0.2362778, 0.7017738, -1.251919, 1, 1, 1, 1, 1,
-0.232708, -0.6502217, -3.024967, 1, 1, 1, 1, 1,
-0.2319232, -1.567726, -3.347677, 0, 0, 1, 1, 1,
-0.2311481, 0.6821612, -0.4607817, 1, 0, 0, 1, 1,
-0.2295747, 0.5031027, -0.3925186, 1, 0, 0, 1, 1,
-0.2294741, 0.5189648, 0.4073615, 1, 0, 0, 1, 1,
-0.223785, 1.183695, 0.3847448, 1, 0, 0, 1, 1,
-0.2210948, -0.6631797, -2.326252, 1, 0, 0, 1, 1,
-0.2194052, 0.4121273, -1.055062, 0, 0, 0, 1, 1,
-0.2183938, -1.21678, -3.302716, 0, 0, 0, 1, 1,
-0.2174474, -1.659529, -3.864011, 0, 0, 0, 1, 1,
-0.2162014, -1.60722, -5.459559, 0, 0, 0, 1, 1,
-0.2152531, 0.1712188, -1.275682, 0, 0, 0, 1, 1,
-0.2099199, 2.221271, -0.4758224, 0, 0, 0, 1, 1,
-0.2087157, 0.87654, -0.1444764, 0, 0, 0, 1, 1,
-0.2084849, 1.176885, -0.4460528, 1, 1, 1, 1, 1,
-0.2069867, -0.2058171, -4.139088, 1, 1, 1, 1, 1,
-0.2046698, 0.1928235, 0.7581885, 1, 1, 1, 1, 1,
-0.2046542, -1.513164, -1.765031, 1, 1, 1, 1, 1,
-0.2038474, 0.6482764, -0.3479476, 1, 1, 1, 1, 1,
-0.2002274, 0.4223008, 0.8301699, 1, 1, 1, 1, 1,
-0.198226, -1.627471, -4.720601, 1, 1, 1, 1, 1,
-0.1933873, 2.040755, -1.594365, 1, 1, 1, 1, 1,
-0.1924236, -0.4633057, -3.266681, 1, 1, 1, 1, 1,
-0.191651, -1.150103, -1.768609, 1, 1, 1, 1, 1,
-0.190589, 0.1592861, -0.6577622, 1, 1, 1, 1, 1,
-0.1892303, 0.1749717, 0.8532054, 1, 1, 1, 1, 1,
-0.1891885, 0.4606567, -1.797365, 1, 1, 1, 1, 1,
-0.1883317, 1.729599, 2.101001, 1, 1, 1, 1, 1,
-0.1872894, 0.4920362, -1.047664, 1, 1, 1, 1, 1,
-0.1796002, -1.782442, -4.071346, 0, 0, 1, 1, 1,
-0.177908, 0.973268, -1.162722, 1, 0, 0, 1, 1,
-0.1762014, -0.9003596, -1.178182, 1, 0, 0, 1, 1,
-0.1685403, -0.3203424, -4.205326, 1, 0, 0, 1, 1,
-0.1652286, 1.276418, 0.1339312, 1, 0, 0, 1, 1,
-0.1580761, 0.04506919, -0.9529414, 1, 0, 0, 1, 1,
-0.1570722, -0.8689261, -1.510517, 0, 0, 0, 1, 1,
-0.1559394, 0.2542263, -0.7083157, 0, 0, 0, 1, 1,
-0.1543621, -0.4787862, -3.385, 0, 0, 0, 1, 1,
-0.15353, -1.15296, -4.549195, 0, 0, 0, 1, 1,
-0.1500121, -0.8178858, -2.861792, 0, 0, 0, 1, 1,
-0.1447859, 0.1091035, 0.3520053, 0, 0, 0, 1, 1,
-0.1402765, 1.399788, 1.14908, 0, 0, 0, 1, 1,
-0.139601, -0.7676994, -4.417379, 1, 1, 1, 1, 1,
-0.1393543, 0.4418359, 0.2282738, 1, 1, 1, 1, 1,
-0.138804, 0.07056131, -0.5680268, 1, 1, 1, 1, 1,
-0.1318078, 0.2441223, -2.221818, 1, 1, 1, 1, 1,
-0.124387, -0.4295395, -3.088169, 1, 1, 1, 1, 1,
-0.1232172, -0.4644727, -4.578496, 1, 1, 1, 1, 1,
-0.1213286, -2.737676, -4.510993, 1, 1, 1, 1, 1,
-0.121274, 1.295417, -0.2153897, 1, 1, 1, 1, 1,
-0.1180451, 1.395489, 1.074053, 1, 1, 1, 1, 1,
-0.1096618, -0.3094649, -1.948871, 1, 1, 1, 1, 1,
-0.1077352, 0.1228661, -1.326685, 1, 1, 1, 1, 1,
-0.1051495, -0.3372647, -2.286752, 1, 1, 1, 1, 1,
-0.1003937, -0.782189, -2.81706, 1, 1, 1, 1, 1,
-0.1001313, 0.7414255, 2.906297, 1, 1, 1, 1, 1,
-0.09732661, -0.03721158, -0.8524441, 1, 1, 1, 1, 1,
-0.09706654, -0.8047575, -2.754268, 0, 0, 1, 1, 1,
-0.09632173, 0.5425667, 1.312429, 1, 0, 0, 1, 1,
-0.0936227, -0.09427977, -2.603701, 1, 0, 0, 1, 1,
-0.08828208, -0.001973914, -1.055243, 1, 0, 0, 1, 1,
-0.08708069, 2.221712, -0.3200608, 1, 0, 0, 1, 1,
-0.08216589, 0.4860946, -0.4908649, 1, 0, 0, 1, 1,
-0.08133846, -0.5006094, -4.139683, 0, 0, 0, 1, 1,
-0.07343959, -0.5894026, -2.774599, 0, 0, 0, 1, 1,
-0.07204065, -1.404953, -4.807736, 0, 0, 0, 1, 1,
-0.07132887, 1.833781, -0.6846763, 0, 0, 0, 1, 1,
-0.07105371, 0.5833306, 1.040666, 0, 0, 0, 1, 1,
-0.06942932, 0.2444682, -0.5721959, 0, 0, 0, 1, 1,
-0.0691696, 0.2217484, -0.8118199, 0, 0, 0, 1, 1,
-0.06858233, -0.06663415, -3.903994, 1, 1, 1, 1, 1,
-0.06416082, -0.4173317, -3.268367, 1, 1, 1, 1, 1,
-0.05686289, 0.3940102, 0.6794766, 1, 1, 1, 1, 1,
-0.05496142, -0.3859991, -4.397599, 1, 1, 1, 1, 1,
-0.05001251, 0.5486022, -1.214662, 1, 1, 1, 1, 1,
-0.04898561, 1.37956, -1.411416, 1, 1, 1, 1, 1,
-0.04766997, 0.8124767, 0.521208, 1, 1, 1, 1, 1,
-0.04553104, 0.9748687, 1.762721, 1, 1, 1, 1, 1,
-0.04367982, 0.9933449, 0.810568, 1, 1, 1, 1, 1,
-0.03970454, 1.897826, -0.7090212, 1, 1, 1, 1, 1,
-0.0369247, 0.9074624, -0.1994405, 1, 1, 1, 1, 1,
-0.03475914, 1.964045, 0.02913306, 1, 1, 1, 1, 1,
-0.0322878, 0.5966256, -0.1610865, 1, 1, 1, 1, 1,
-0.03011853, 1.218122, -0.3015907, 1, 1, 1, 1, 1,
-0.01944905, 1.601047, 1.550148, 1, 1, 1, 1, 1,
-0.01648634, 1.367591, -1.099355, 0, 0, 1, 1, 1,
-0.01331174, 0.8247242, -0.2428012, 1, 0, 0, 1, 1,
-0.01323477, 0.9215437, 2.689359, 1, 0, 0, 1, 1,
-0.01307076, -0.9349817, -2.496471, 1, 0, 0, 1, 1,
-0.01019212, 0.1223586, -1.568489, 1, 0, 0, 1, 1,
-0.007769171, -0.5074129, -2.849315, 1, 0, 0, 1, 1,
-0.007499427, -0.190072, -4.281032, 0, 0, 0, 1, 1,
-0.00332043, -0.6091609, -3.533709, 0, 0, 0, 1, 1,
-0.001542746, -1.063921, -2.237425, 0, 0, 0, 1, 1,
-0.0006966575, 1.269563, 0.555065, 0, 0, 0, 1, 1,
0.0002302822, 0.4651968, -0.4966266, 0, 0, 0, 1, 1,
0.001757876, 2.093491, 1.156636, 0, 0, 0, 1, 1,
0.002685067, 1.476124, -0.2693199, 0, 0, 0, 1, 1,
0.002898433, 0.1013635, 0.4977087, 1, 1, 1, 1, 1,
0.003997161, 0.3185565, 1.222383, 1, 1, 1, 1, 1,
0.00641736, -1.7767, 2.556928, 1, 1, 1, 1, 1,
0.01402928, -0.4572202, 1.860432, 1, 1, 1, 1, 1,
0.01982786, 0.4342641, 0.3945454, 1, 1, 1, 1, 1,
0.02467878, -0.2912933, 2.932612, 1, 1, 1, 1, 1,
0.02468087, 0.7920675, -1.884172, 1, 1, 1, 1, 1,
0.02508573, 1.463243, 1.053702, 1, 1, 1, 1, 1,
0.03095718, 0.7514716, 0.7678623, 1, 1, 1, 1, 1,
0.03100332, 0.6290323, 1.316072, 1, 1, 1, 1, 1,
0.03110584, 0.04905032, 0.008635128, 1, 1, 1, 1, 1,
0.03226825, 0.2639202, 1.657778, 1, 1, 1, 1, 1,
0.03336447, 0.4956614, 1.765816, 1, 1, 1, 1, 1,
0.03710082, -0.6917208, 1.960014, 1, 1, 1, 1, 1,
0.04262377, -0.7946369, 2.386326, 1, 1, 1, 1, 1,
0.04313427, -0.867508, 2.88984, 0, 0, 1, 1, 1,
0.04521061, -0.6446879, 2.759586, 1, 0, 0, 1, 1,
0.04998274, -1.333766, 2.961952, 1, 0, 0, 1, 1,
0.05022544, -0.6455992, 4.426981, 1, 0, 0, 1, 1,
0.05367655, -2.007526, 3.128335, 1, 0, 0, 1, 1,
0.05518696, 0.6657118, -0.08552492, 1, 0, 0, 1, 1,
0.05694403, -0.9868162, 3.684103, 0, 0, 0, 1, 1,
0.05859993, -0.9040976, 2.218337, 0, 0, 0, 1, 1,
0.06166422, 1.451479, -0.2852686, 0, 0, 0, 1, 1,
0.06434543, 0.06652374, 0.3726164, 0, 0, 0, 1, 1,
0.06515694, 0.6632473, -0.6133765, 0, 0, 0, 1, 1,
0.06650174, -0.1681377, 1.446177, 0, 0, 0, 1, 1,
0.07022248, -1.466578, 3.10433, 0, 0, 0, 1, 1,
0.07114774, -1.208115, 1.781513, 1, 1, 1, 1, 1,
0.07342751, -1.566201, 2.953433, 1, 1, 1, 1, 1,
0.07633488, -2.45317, 2.944538, 1, 1, 1, 1, 1,
0.08004224, 0.3416911, 2.346997, 1, 1, 1, 1, 1,
0.08069174, 1.030134, 0.7400144, 1, 1, 1, 1, 1,
0.0824462, -0.4088186, 1.999893, 1, 1, 1, 1, 1,
0.08612043, 1.842534, 1.012538, 1, 1, 1, 1, 1,
0.08929902, 0.2102124, 0.3905015, 1, 1, 1, 1, 1,
0.09125768, -0.1732011, 1.436449, 1, 1, 1, 1, 1,
0.09332181, -0.6408819, 1.857462, 1, 1, 1, 1, 1,
0.09653072, -0.4769627, 3.280212, 1, 1, 1, 1, 1,
0.09803688, 0.03828396, 1.59365, 1, 1, 1, 1, 1,
0.09935948, 0.7218917, 0.5399291, 1, 1, 1, 1, 1,
0.1051148, 1.130054, -1.114167, 1, 1, 1, 1, 1,
0.105508, -0.1792092, 3.256947, 1, 1, 1, 1, 1,
0.1063691, -0.09673116, 3.308421, 0, 0, 1, 1, 1,
0.1074642, -0.7994897, 4.379737, 1, 0, 0, 1, 1,
0.1093836, 0.1065717, 0.4883897, 1, 0, 0, 1, 1,
0.1097892, 0.1886515, 0.5310914, 1, 0, 0, 1, 1,
0.1102985, 0.2709449, -0.1143769, 1, 0, 0, 1, 1,
0.1114446, -0.3997813, 0.2755763, 1, 0, 0, 1, 1,
0.1137242, -0.2939878, 3.006934, 0, 0, 0, 1, 1,
0.1140294, -1.144855, 2.649901, 0, 0, 0, 1, 1,
0.1186892, 0.9226276, 1.54718, 0, 0, 0, 1, 1,
0.129182, 0.5844765, -0.1638725, 0, 0, 0, 1, 1,
0.1362775, 0.9933242, 0.9345188, 0, 0, 0, 1, 1,
0.1385269, 0.5019054, -2.114728, 0, 0, 0, 1, 1,
0.1398118, 1.164097, 0.3939124, 0, 0, 0, 1, 1,
0.1417089, 1.587722, 1.257427, 1, 1, 1, 1, 1,
0.1429956, -0.1370154, 3.60956, 1, 1, 1, 1, 1,
0.1439584, 0.6287581, 0.5294419, 1, 1, 1, 1, 1,
0.1494425, 0.443165, -0.4192233, 1, 1, 1, 1, 1,
0.1508349, 1.363347, -0.9586176, 1, 1, 1, 1, 1,
0.1520022, -1.463406, 4.475331, 1, 1, 1, 1, 1,
0.1556728, 0.6825272, -1.204071, 1, 1, 1, 1, 1,
0.1570517, -0.3092531, 3.456004, 1, 1, 1, 1, 1,
0.1578632, -1.235386, 3.069429, 1, 1, 1, 1, 1,
0.162508, 0.4189473, -1.173917, 1, 1, 1, 1, 1,
0.1652877, 0.7414452, 0.0538239, 1, 1, 1, 1, 1,
0.1699497, -0.6040388, 0.9829648, 1, 1, 1, 1, 1,
0.1814665, 0.5906348, -0.3693476, 1, 1, 1, 1, 1,
0.1844002, -0.1213908, 2.931187, 1, 1, 1, 1, 1,
0.1877988, -1.738736, 2.658919, 1, 1, 1, 1, 1,
0.1885348, 0.7597355, 0.7542259, 0, 0, 1, 1, 1,
0.1897229, 0.04818498, -2.148008, 1, 0, 0, 1, 1,
0.1903622, -1.359653, 1.765671, 1, 0, 0, 1, 1,
0.1912404, 0.3762379, 1.147141, 1, 0, 0, 1, 1,
0.1955647, -0.8065125, 1.729823, 1, 0, 0, 1, 1,
0.1970983, 0.3420695, 0.5765583, 1, 0, 0, 1, 1,
0.2012458, 1.414715, -2.804331, 0, 0, 0, 1, 1,
0.2074108, -0.185107, 2.012049, 0, 0, 0, 1, 1,
0.2122617, 1.943066, -1.125954, 0, 0, 0, 1, 1,
0.2166993, -0.636657, 2.288951, 0, 0, 0, 1, 1,
0.2168156, -0.4409813, 1.909034, 0, 0, 0, 1, 1,
0.2175121, -0.1865094, 1.993293, 0, 0, 0, 1, 1,
0.2181975, 1.327236, -0.6129097, 0, 0, 0, 1, 1,
0.2188284, -0.9761386, 1.502818, 1, 1, 1, 1, 1,
0.2203517, 1.194262, -0.3928486, 1, 1, 1, 1, 1,
0.2208848, -0.3400651, 2.039776, 1, 1, 1, 1, 1,
0.2227849, 0.1459748, 1.256519, 1, 1, 1, 1, 1,
0.2249126, 0.6607135, 0.3113729, 1, 1, 1, 1, 1,
0.2249239, 1.099643, 1.59541, 1, 1, 1, 1, 1,
0.2252222, 0.08487971, 0.9450116, 1, 1, 1, 1, 1,
0.2262886, 0.3327233, 1.402291, 1, 1, 1, 1, 1,
0.2279337, 1.601701, 0.9718039, 1, 1, 1, 1, 1,
0.2280481, -0.9028419, 1.633187, 1, 1, 1, 1, 1,
0.2306266, 0.1335476, 0.5076544, 1, 1, 1, 1, 1,
0.2328141, 0.6716651, -0.7107005, 1, 1, 1, 1, 1,
0.2338023, 0.6721079, 1.054388, 1, 1, 1, 1, 1,
0.2346256, 0.4034568, -0.634531, 1, 1, 1, 1, 1,
0.2354569, 0.6815234, -0.9154856, 1, 1, 1, 1, 1,
0.2365452, -0.488679, 1.80133, 0, 0, 1, 1, 1,
0.2373796, 0.2609493, 0.4469919, 1, 0, 0, 1, 1,
0.2392782, 0.72298, 0.8938755, 1, 0, 0, 1, 1,
0.2395475, -3.001641, 2.028462, 1, 0, 0, 1, 1,
0.2399573, 1.665434, -0.7064791, 1, 0, 0, 1, 1,
0.2410787, -0.4275989, 1.206037, 1, 0, 0, 1, 1,
0.2412578, -1.203051, 2.532878, 0, 0, 0, 1, 1,
0.2418273, -0.3158508, 2.342869, 0, 0, 0, 1, 1,
0.248634, -1.392455, 3.194714, 0, 0, 0, 1, 1,
0.2506122, -0.5337213, 1.103242, 0, 0, 0, 1, 1,
0.2529564, 0.3346868, 0.3727168, 0, 0, 0, 1, 1,
0.2574674, 0.4564015, -0.1302182, 0, 0, 0, 1, 1,
0.266181, 0.5964808, 0.2586276, 0, 0, 0, 1, 1,
0.2683881, -2.212679, 2.42557, 1, 1, 1, 1, 1,
0.2719584, -1.016772, 3.303739, 1, 1, 1, 1, 1,
0.277707, 0.9122373, 0.8013026, 1, 1, 1, 1, 1,
0.2843806, -0.01435006, 1.029161, 1, 1, 1, 1, 1,
0.2880633, -0.3464408, 1.123475, 1, 1, 1, 1, 1,
0.2983707, -0.001479264, 1.7467, 1, 1, 1, 1, 1,
0.3011792, 0.1003003, 1.375079, 1, 1, 1, 1, 1,
0.3091191, 1.270344, -0.3739597, 1, 1, 1, 1, 1,
0.3091313, 0.209145, 0.6626539, 1, 1, 1, 1, 1,
0.3102587, 1.509718, -0.7123176, 1, 1, 1, 1, 1,
0.3134067, -0.09030771, 1.557878, 1, 1, 1, 1, 1,
0.3145819, -0.5395256, 3.045735, 1, 1, 1, 1, 1,
0.315074, 0.4499482, 0.4414794, 1, 1, 1, 1, 1,
0.3150986, 1.956501, 1.133671, 1, 1, 1, 1, 1,
0.3238807, 0.309175, 1.23459, 1, 1, 1, 1, 1,
0.3269578, 0.5103704, -0.1059457, 0, 0, 1, 1, 1,
0.3300524, 0.907271, -0.2882517, 1, 0, 0, 1, 1,
0.3315456, 0.4285626, 1.913383, 1, 0, 0, 1, 1,
0.3354934, -0.4320587, 0.7311018, 1, 0, 0, 1, 1,
0.3355806, 0.9569821, 0.2834311, 1, 0, 0, 1, 1,
0.3380035, -0.4664026, 2.741368, 1, 0, 0, 1, 1,
0.3383859, -0.6583806, 3.330809, 0, 0, 0, 1, 1,
0.3404853, 0.685254, -0.2256119, 0, 0, 0, 1, 1,
0.3431309, -0.390425, 2.105041, 0, 0, 0, 1, 1,
0.3434854, 0.3967689, 0.1587356, 0, 0, 0, 1, 1,
0.3453323, 1.382156, -0.2150995, 0, 0, 0, 1, 1,
0.3499365, 1.122552, 0.01650947, 0, 0, 0, 1, 1,
0.3533178, 0.07685421, 2.027134, 0, 0, 0, 1, 1,
0.3587113, -1.846787, 2.310227, 1, 1, 1, 1, 1,
0.3605302, -0.937206, 1.839653, 1, 1, 1, 1, 1,
0.3656569, -1.72248, 3.469977, 1, 1, 1, 1, 1,
0.366948, -1.670227, 3.007185, 1, 1, 1, 1, 1,
0.3742975, 0.02741384, 2.926016, 1, 1, 1, 1, 1,
0.3743716, -1.664631, 4.315463, 1, 1, 1, 1, 1,
0.3766972, 2.179586, 0.30052, 1, 1, 1, 1, 1,
0.3830196, -0.180466, 1.909204, 1, 1, 1, 1, 1,
0.3842469, -0.02133904, 1.269696, 1, 1, 1, 1, 1,
0.3850947, -0.4358605, 2.135375, 1, 1, 1, 1, 1,
0.3868984, -1.311461, 2.795057, 1, 1, 1, 1, 1,
0.3879419, 1.954033, -1.616693, 1, 1, 1, 1, 1,
0.3919379, 0.6963657, 0.965449, 1, 1, 1, 1, 1,
0.3919597, -0.1534632, 0.4948059, 1, 1, 1, 1, 1,
0.3993622, -0.406234, 2.368676, 1, 1, 1, 1, 1,
0.3994142, 0.01753528, 3.799727, 0, 0, 1, 1, 1,
0.404889, 0.7988814, -0.4241536, 1, 0, 0, 1, 1,
0.4094902, -1.211716, 2.68738, 1, 0, 0, 1, 1,
0.4136156, -1.462317, 2.896408, 1, 0, 0, 1, 1,
0.4178012, -0.07609936, 0.9941331, 1, 0, 0, 1, 1,
0.4251024, 0.6198611, 0.5163941, 1, 0, 0, 1, 1,
0.4252678, -0.1677305, 2.330264, 0, 0, 0, 1, 1,
0.4269686, 0.1706031, 0.8499901, 0, 0, 0, 1, 1,
0.4295819, 0.4634422, 1.946902, 0, 0, 0, 1, 1,
0.4335445, 1.432228, 0.8254491, 0, 0, 0, 1, 1,
0.439999, -0.24259, 1.727253, 0, 0, 0, 1, 1,
0.4404158, 1.109061, 0.08500857, 0, 0, 0, 1, 1,
0.44109, 1.286919, 0.5381756, 0, 0, 0, 1, 1,
0.4530868, 0.2967281, 2.075091, 1, 1, 1, 1, 1,
0.4573323, -0.2487437, 1.927145, 1, 1, 1, 1, 1,
0.4602928, 0.4888873, 1.402444, 1, 1, 1, 1, 1,
0.4603429, -0.01499225, 2.722168, 1, 1, 1, 1, 1,
0.4623675, 0.5752255, 1.07796, 1, 1, 1, 1, 1,
0.4662754, 0.2380562, 2.354297, 1, 1, 1, 1, 1,
0.4739335, -0.1929321, 2.281121, 1, 1, 1, 1, 1,
0.4783796, 0.289932, -0.01368504, 1, 1, 1, 1, 1,
0.4818409, 0.03906466, 2.298071, 1, 1, 1, 1, 1,
0.4984377, -0.5640281, 2.888156, 1, 1, 1, 1, 1,
0.5046199, -0.1771921, 1.969623, 1, 1, 1, 1, 1,
0.5046542, -2.107336, 2.258926, 1, 1, 1, 1, 1,
0.5046592, 1.987229, 0.9589564, 1, 1, 1, 1, 1,
0.5056054, 0.1466375, 2.134209, 1, 1, 1, 1, 1,
0.5071757, -1.544039, 1.890779, 1, 1, 1, 1, 1,
0.5075468, 0.9905033, 1.283002, 0, 0, 1, 1, 1,
0.5095921, -1.21456, 3.997239, 1, 0, 0, 1, 1,
0.5198905, 0.358029, -0.5391763, 1, 0, 0, 1, 1,
0.525776, -1.620957, 3.217939, 1, 0, 0, 1, 1,
0.5262882, 1.577446, 0.7556636, 1, 0, 0, 1, 1,
0.528617, 1.538608, 0.5182813, 1, 0, 0, 1, 1,
0.5286793, -1.049245, 1.429995, 0, 0, 0, 1, 1,
0.5302641, 0.5316629, 1.909686, 0, 0, 0, 1, 1,
0.5304598, -0.08063429, 0.596697, 0, 0, 0, 1, 1,
0.5351895, -0.07054593, 2.720321, 0, 0, 0, 1, 1,
0.5370166, 1.82808, 1.366733, 0, 0, 0, 1, 1,
0.5557705, 0.880809, 0.6988254, 0, 0, 0, 1, 1,
0.557628, -0.1233095, 1.903868, 0, 0, 0, 1, 1,
0.5578511, -1.196829, 3.610727, 1, 1, 1, 1, 1,
0.5586526, -1.451873, 2.884962, 1, 1, 1, 1, 1,
0.564915, -1.749993, 2.025861, 1, 1, 1, 1, 1,
0.5667324, 0.3019114, 1.69554, 1, 1, 1, 1, 1,
0.568244, 0.561163, 0.6148291, 1, 1, 1, 1, 1,
0.5683561, -0.02353827, 0.5323235, 1, 1, 1, 1, 1,
0.573509, 0.2307595, 2.492839, 1, 1, 1, 1, 1,
0.5745295, -0.6086373, 1.714339, 1, 1, 1, 1, 1,
0.574896, -0.8590413, 2.382064, 1, 1, 1, 1, 1,
0.5749069, 0.1310177, 0.4928691, 1, 1, 1, 1, 1,
0.5805959, -0.9290822, 1.51611, 1, 1, 1, 1, 1,
0.5830889, -1.595918, 3.292001, 1, 1, 1, 1, 1,
0.5887285, -0.9956716, 3.913587, 1, 1, 1, 1, 1,
0.5924217, 0.4950104, -0.4715358, 1, 1, 1, 1, 1,
0.5946206, 0.351313, 0.4285024, 1, 1, 1, 1, 1,
0.5977209, 0.2121033, 1.524474, 0, 0, 1, 1, 1,
0.5985453, 0.6823426, 0.7067683, 1, 0, 0, 1, 1,
0.6087284, 0.1670442, 2.153471, 1, 0, 0, 1, 1,
0.6116416, 0.1907991, 2.581513, 1, 0, 0, 1, 1,
0.6119533, -0.203802, 1.498239, 1, 0, 0, 1, 1,
0.6147299, 0.05946114, 0.2594614, 1, 0, 0, 1, 1,
0.629142, 1.527993, 0.1086946, 0, 0, 0, 1, 1,
0.6305199, 0.07631657, 2.775874, 0, 0, 0, 1, 1,
0.6342354, -0.9339961, 2.344237, 0, 0, 0, 1, 1,
0.6369481, 1.762045, 1.735201, 0, 0, 0, 1, 1,
0.6447938, 2.072349, 2.167582, 0, 0, 0, 1, 1,
0.6466618, 0.03816393, 3.410404, 0, 0, 0, 1, 1,
0.6466827, -1.370923, 2.746284, 0, 0, 0, 1, 1,
0.6588452, 0.4065038, 0.0605529, 1, 1, 1, 1, 1,
0.6661333, -3.409598, 1.753627, 1, 1, 1, 1, 1,
0.668062, -1.003693, 0.604411, 1, 1, 1, 1, 1,
0.6717583, -0.547989, 3.535671, 1, 1, 1, 1, 1,
0.6721984, 0.3202977, 1.645636, 1, 1, 1, 1, 1,
0.6734641, 0.7365586, 2.306936, 1, 1, 1, 1, 1,
0.6740823, -0.5586284, 2.310802, 1, 1, 1, 1, 1,
0.6750585, -0.6449625, 2.784583, 1, 1, 1, 1, 1,
0.677066, -2.357048, 1.717445, 1, 1, 1, 1, 1,
0.6810098, 0.600705, -0.1768764, 1, 1, 1, 1, 1,
0.6840732, -1.532049, 1.958921, 1, 1, 1, 1, 1,
0.6841739, -1.214584, 1.481446, 1, 1, 1, 1, 1,
0.6846898, -1.419748, 3.101949, 1, 1, 1, 1, 1,
0.6936008, -0.9633968, 4.475829, 1, 1, 1, 1, 1,
0.6957217, -0.341352, 2.647947, 1, 1, 1, 1, 1,
0.6968997, -1.227327, 1.274129, 0, 0, 1, 1, 1,
0.6997278, -1.190322, 2.106684, 1, 0, 0, 1, 1,
0.7026512, 0.733792, -1.125821, 1, 0, 0, 1, 1,
0.7047384, -2.011482, 2.649861, 1, 0, 0, 1, 1,
0.7071092, 0.7144545, -0.4127601, 1, 0, 0, 1, 1,
0.7104512, -1.293458, 0.9145083, 1, 0, 0, 1, 1,
0.7118509, 0.2118703, 1.851688, 0, 0, 0, 1, 1,
0.7124341, -0.8647599, 1.731476, 0, 0, 0, 1, 1,
0.71658, -1.279258, 2.260046, 0, 0, 0, 1, 1,
0.7197509, -0.6301709, 0.9891162, 0, 0, 0, 1, 1,
0.7200949, 0.05972914, 1.010935, 0, 0, 0, 1, 1,
0.7236365, 1.180763, -0.07003593, 0, 0, 0, 1, 1,
0.7266875, -0.08434821, 0.8712166, 0, 0, 0, 1, 1,
0.7333575, -0.8116349, 3.363204, 1, 1, 1, 1, 1,
0.7359015, -0.03584354, 2.494661, 1, 1, 1, 1, 1,
0.7376631, -0.1311243, 2.68265, 1, 1, 1, 1, 1,
0.7446384, -0.2738513, 1.760488, 1, 1, 1, 1, 1,
0.7515037, -0.03058475, 1.021983, 1, 1, 1, 1, 1,
0.7612198, -0.8483436, 0.7378721, 1, 1, 1, 1, 1,
0.7627901, -0.2533699, 2.753562, 1, 1, 1, 1, 1,
0.7640806, -0.08550803, 2.798634, 1, 1, 1, 1, 1,
0.7779738, 0.1792684, 1.505508, 1, 1, 1, 1, 1,
0.7779887, -0.8162236, 2.029314, 1, 1, 1, 1, 1,
0.7792006, -1.11093, 3.136212, 1, 1, 1, 1, 1,
0.7809566, 0.2817286, 3.492399, 1, 1, 1, 1, 1,
0.7882213, 0.08386593, 0.2202597, 1, 1, 1, 1, 1,
0.7906753, -2.080087, 1.942185, 1, 1, 1, 1, 1,
0.7912846, 0.3460611, 1.759188, 1, 1, 1, 1, 1,
0.7917562, 0.05047727, 1.083749, 0, 0, 1, 1, 1,
0.7997297, -0.07487655, 1.140002, 1, 0, 0, 1, 1,
0.8035369, -1.969251, 2.931957, 1, 0, 0, 1, 1,
0.8143823, 0.8110015, 0.210199, 1, 0, 0, 1, 1,
0.8165653, -2.250284, 3.227742, 1, 0, 0, 1, 1,
0.8237262, -0.2833611, 0.8425397, 1, 0, 0, 1, 1,
0.8369481, 0.900229, -0.696289, 0, 0, 0, 1, 1,
0.8402876, 0.8586412, 1.065684, 0, 0, 0, 1, 1,
0.8444814, -0.4513213, 2.498751, 0, 0, 0, 1, 1,
0.844511, 0.1951176, 2.111856, 0, 0, 0, 1, 1,
0.8469813, 1.784382, -0.2390935, 0, 0, 0, 1, 1,
0.8558392, -1.072644, 3.675798, 0, 0, 0, 1, 1,
0.8575802, 0.7604735, 1.263022, 0, 0, 0, 1, 1,
0.8607754, -0.01293574, 0.6097836, 1, 1, 1, 1, 1,
0.8646879, -1.256275, 2.195354, 1, 1, 1, 1, 1,
0.8733202, -0.7848864, 2.568725, 1, 1, 1, 1, 1,
0.8735442, -0.223107, 0.7598069, 1, 1, 1, 1, 1,
0.8749519, -1.066902, 1.765867, 1, 1, 1, 1, 1,
0.8767667, 0.9502955, 0.3637482, 1, 1, 1, 1, 1,
0.8781862, -0.1694301, 2.21486, 1, 1, 1, 1, 1,
0.8786305, 0.4361421, 0.9176155, 1, 1, 1, 1, 1,
0.8802661, -0.4918233, 1.006744, 1, 1, 1, 1, 1,
0.8834227, -1.631845, 3.566444, 1, 1, 1, 1, 1,
0.8855577, -0.6045902, 2.505402, 1, 1, 1, 1, 1,
0.8923163, 0.1004413, 2.472814, 1, 1, 1, 1, 1,
0.8983181, 0.1228051, 3.339043, 1, 1, 1, 1, 1,
0.8992941, -1.27291, 2.305576, 1, 1, 1, 1, 1,
0.9121625, -0.44008, 0.09077254, 1, 1, 1, 1, 1,
0.9152706, -0.8100289, 3.304184, 0, 0, 1, 1, 1,
0.9278977, -0.4214506, 0.6550686, 1, 0, 0, 1, 1,
0.9314702, 0.7647763, 1.524969, 1, 0, 0, 1, 1,
0.9338055, -0.9329101, 2.853048, 1, 0, 0, 1, 1,
0.935416, -0.4407729, 2.547798, 1, 0, 0, 1, 1,
0.9407842, -0.1842616, 1.474806, 1, 0, 0, 1, 1,
0.9455076, -0.2775133, 2.309896, 0, 0, 0, 1, 1,
0.9497883, -1.211032, 1.371972, 0, 0, 0, 1, 1,
0.951044, -0.7397344, 1.693146, 0, 0, 0, 1, 1,
0.9566963, -1.219817, 5.265709, 0, 0, 0, 1, 1,
0.964876, 2.376648, 1.296272, 0, 0, 0, 1, 1,
0.9674599, 0.5591449, 2.067718, 0, 0, 0, 1, 1,
0.9781992, -0.1623452, 1.1564, 0, 0, 0, 1, 1,
0.9845548, 1.620115, 0.4408199, 1, 1, 1, 1, 1,
0.984559, 0.765972, 2.079603, 1, 1, 1, 1, 1,
0.9869799, -0.05114698, 1.784245, 1, 1, 1, 1, 1,
0.9871281, 1.053874, -0.5855685, 1, 1, 1, 1, 1,
0.9886042, -1.579237, 0.7773728, 1, 1, 1, 1, 1,
0.9954589, -0.01086908, 3.194879, 1, 1, 1, 1, 1,
1.005075, -1.107142, 2.13253, 1, 1, 1, 1, 1,
1.008497, 1.776693, 0.7103257, 1, 1, 1, 1, 1,
1.013248, 1.134877, 0.9150355, 1, 1, 1, 1, 1,
1.01708, -0.2405404, 1.018411, 1, 1, 1, 1, 1,
1.020728, 0.4819086, 2.816273, 1, 1, 1, 1, 1,
1.024658, 2.747378, -0.5106315, 1, 1, 1, 1, 1,
1.026243, 0.3857121, 0.5366828, 1, 1, 1, 1, 1,
1.035062, 0.8453062, 2.699906, 1, 1, 1, 1, 1,
1.039734, -0.7289766, 2.519415, 1, 1, 1, 1, 1,
1.041493, -1.418005, 2.514353, 0, 0, 1, 1, 1,
1.044149, 1.54078, 0.9020535, 1, 0, 0, 1, 1,
1.052901, -0.52978, 1.377883, 1, 0, 0, 1, 1,
1.055454, 1.491984, 0.6647874, 1, 0, 0, 1, 1,
1.055475, -1.390698, 3.055243, 1, 0, 0, 1, 1,
1.056187, -1.592235, 5.139498, 1, 0, 0, 1, 1,
1.065018, -0.1838569, 2.074533, 0, 0, 0, 1, 1,
1.065166, 0.4444241, 1.529599, 0, 0, 0, 1, 1,
1.06604, 0.8862997, 0.2816088, 0, 0, 0, 1, 1,
1.067334, -0.6440902, 0.7563086, 0, 0, 0, 1, 1,
1.088298, 0.4640034, 0.8548229, 0, 0, 0, 1, 1,
1.093712, 0.4048245, 1.825403, 0, 0, 0, 1, 1,
1.097929, -0.03136465, 1.287231, 0, 0, 0, 1, 1,
1.098115, -1.080169, 2.319333, 1, 1, 1, 1, 1,
1.100635, -0.1010534, 1.711169, 1, 1, 1, 1, 1,
1.102796, -0.9831613, 2.861716, 1, 1, 1, 1, 1,
1.103117, 0.5007637, 0.4882491, 1, 1, 1, 1, 1,
1.106028, -0.7448258, 1.974537, 1, 1, 1, 1, 1,
1.112172, -2.867651, 2.516826, 1, 1, 1, 1, 1,
1.119094, 0.8995314, 0.918912, 1, 1, 1, 1, 1,
1.120199, 0.7505921, 1.474775, 1, 1, 1, 1, 1,
1.131829, 1.406558, -0.3625502, 1, 1, 1, 1, 1,
1.135733, -0.6819013, 4.10844, 1, 1, 1, 1, 1,
1.147881, 0.6058655, 1.938037, 1, 1, 1, 1, 1,
1.151646, 1.270131, 2.179664, 1, 1, 1, 1, 1,
1.163494, -0.1821307, 2.643632, 1, 1, 1, 1, 1,
1.165006, 0.3443483, 1.545037, 1, 1, 1, 1, 1,
1.175733, -0.5157097, 1.431507, 1, 1, 1, 1, 1,
1.17774, -1.369465, 1.838121, 0, 0, 1, 1, 1,
1.185701, -0.03344993, 0.8360814, 1, 0, 0, 1, 1,
1.189729, 0.220918, 1.89986, 1, 0, 0, 1, 1,
1.206225, -2.633424, 2.450241, 1, 0, 0, 1, 1,
1.209912, 0.9410858, 0.7849692, 1, 0, 0, 1, 1,
1.210576, 0.3705167, 1.47326, 1, 0, 0, 1, 1,
1.211964, 0.9965031, 1.959243, 0, 0, 0, 1, 1,
1.219176, 0.03395186, 2.290722, 0, 0, 0, 1, 1,
1.222485, -0.2527412, 2.167208, 0, 0, 0, 1, 1,
1.226671, 0.2374309, 1.341218, 0, 0, 0, 1, 1,
1.239654, 1.923021, 2.565019, 0, 0, 0, 1, 1,
1.245747, -1.117736, 1.948429, 0, 0, 0, 1, 1,
1.250996, 1.132135, 1.974913, 0, 0, 0, 1, 1,
1.252549, 0.7899504, 0.2281734, 1, 1, 1, 1, 1,
1.253143, 0.5876675, 0.167112, 1, 1, 1, 1, 1,
1.256084, 0.0146637, 2.146416, 1, 1, 1, 1, 1,
1.27407, 1.051017, 1.275146, 1, 1, 1, 1, 1,
1.276293, 0.04940859, 1.271238, 1, 1, 1, 1, 1,
1.28797, 0.1220886, -0.6767976, 1, 1, 1, 1, 1,
1.290415, -0.1952431, 0.8799108, 1, 1, 1, 1, 1,
1.301552, 0.8109608, 2.513967, 1, 1, 1, 1, 1,
1.306991, 0.2432431, 3.238214, 1, 1, 1, 1, 1,
1.317872, -0.2199945, 2.718825, 1, 1, 1, 1, 1,
1.319165, 0.4088259, 0.3607567, 1, 1, 1, 1, 1,
1.327714, 1.012965, 1.735085, 1, 1, 1, 1, 1,
1.327753, 1.569496, 0.7761543, 1, 1, 1, 1, 1,
1.343129, -0.05776205, 2.686333, 1, 1, 1, 1, 1,
1.351792, 0.377301, -0.3608092, 1, 1, 1, 1, 1,
1.356678, 1.041972, 1.938734, 0, 0, 1, 1, 1,
1.384456, 1.575491, -0.6935921, 1, 0, 0, 1, 1,
1.392002, -0.191746, 1.321423, 1, 0, 0, 1, 1,
1.404303, -0.7313191, 3.071983, 1, 0, 0, 1, 1,
1.405492, 0.1239859, 1.534132, 1, 0, 0, 1, 1,
1.415976, -1.854141, 2.228541, 1, 0, 0, 1, 1,
1.416313, 0.2950388, 1.410324, 0, 0, 0, 1, 1,
1.417299, 0.3376736, 2.756397, 0, 0, 0, 1, 1,
1.422427, 0.2053076, 1.607598, 0, 0, 0, 1, 1,
1.424733, -0.4414828, 2.487355, 0, 0, 0, 1, 1,
1.427064, 0.3331757, 3.182119, 0, 0, 0, 1, 1,
1.430773, -0.7756485, 2.263145, 0, 0, 0, 1, 1,
1.433251, 0.648508, 0.3148753, 0, 0, 0, 1, 1,
1.447267, -0.6083563, 0.6101143, 1, 1, 1, 1, 1,
1.447534, 0.4108827, 0.6803176, 1, 1, 1, 1, 1,
1.459252, -1.399336, 1.553695, 1, 1, 1, 1, 1,
1.45966, -2.227567, 3.879788, 1, 1, 1, 1, 1,
1.471026, -1.651677, 2.550599, 1, 1, 1, 1, 1,
1.475981, 0.8974447, 1.454271, 1, 1, 1, 1, 1,
1.492346, 0.101301, 0.6891431, 1, 1, 1, 1, 1,
1.493542, -0.7653138, 1.906969, 1, 1, 1, 1, 1,
1.496998, 0.6344332, 0.9456808, 1, 1, 1, 1, 1,
1.497621, -0.948074, 1.659498, 1, 1, 1, 1, 1,
1.509393, -1.076835, 1.148032, 1, 1, 1, 1, 1,
1.519432, -0.4478391, 1.282412, 1, 1, 1, 1, 1,
1.529718, -0.6248117, 1.55105, 1, 1, 1, 1, 1,
1.530879, 0.123703, 1.500409, 1, 1, 1, 1, 1,
1.533889, -0.1172303, 2.017322, 1, 1, 1, 1, 1,
1.547743, -1.845389, 2.656576, 0, 0, 1, 1, 1,
1.56583, 0.2858315, 1.968553, 1, 0, 0, 1, 1,
1.57933, -0.01440724, 3.013628, 1, 0, 0, 1, 1,
1.579966, 0.9995264, 2.495476, 1, 0, 0, 1, 1,
1.590329, 0.3338516, 1.146722, 1, 0, 0, 1, 1,
1.59224, 0.5260245, 3.006114, 1, 0, 0, 1, 1,
1.593875, 1.699307, 1.749711, 0, 0, 0, 1, 1,
1.5947, 0.160387, 0.3577918, 0, 0, 0, 1, 1,
1.607368, -0.464381, 2.276293, 0, 0, 0, 1, 1,
1.613258, -1.466969, 2.906118, 0, 0, 0, 1, 1,
1.615707, 2.154073, 2.097068, 0, 0, 0, 1, 1,
1.61639, 0.6070101, 1.733139, 0, 0, 0, 1, 1,
1.622641, 0.3399769, 0.722679, 0, 0, 0, 1, 1,
1.627421, -0.5311408, 2.38577, 1, 1, 1, 1, 1,
1.634456, 2.157347, 0.9360179, 1, 1, 1, 1, 1,
1.647885, 1.043501, 0.8371845, 1, 1, 1, 1, 1,
1.659919, -0.2882141, 0.9888169, 1, 1, 1, 1, 1,
1.668515, 0.1411489, 1.936209, 1, 1, 1, 1, 1,
1.68209, 0.6063136, 0.6255583, 1, 1, 1, 1, 1,
1.685913, 0.2401838, -0.06311431, 1, 1, 1, 1, 1,
1.701129, 0.786966, 2.819596, 1, 1, 1, 1, 1,
1.703334, -2.08766, 2.762225, 1, 1, 1, 1, 1,
1.703544, -0.354733, 0.9126391, 1, 1, 1, 1, 1,
1.705356, 0.02590455, 2.506319, 1, 1, 1, 1, 1,
1.7247, 0.486156, 2.84442, 1, 1, 1, 1, 1,
1.753697, 0.3297071, 0.4077295, 1, 1, 1, 1, 1,
1.754039, -0.07450633, 0.6580952, 1, 1, 1, 1, 1,
1.762439, -0.6427978, 1.652426, 1, 1, 1, 1, 1,
1.768528, -0.3947353, 2.469124, 0, 0, 1, 1, 1,
1.772549, 0.4750531, 1.105967, 1, 0, 0, 1, 1,
1.775586, -1.003201, 0.1522807, 1, 0, 0, 1, 1,
1.781187, 0.5385165, 0.5065533, 1, 0, 0, 1, 1,
1.804105, 1.19766, 0.4858426, 1, 0, 0, 1, 1,
1.804474, -0.1109333, 3.36221, 1, 0, 0, 1, 1,
1.810172, -0.9583555, 0.2276317, 0, 0, 0, 1, 1,
1.825348, 0.7859984, 2.57727, 0, 0, 0, 1, 1,
1.840619, -0.2536474, 1.550485, 0, 0, 0, 1, 1,
1.846829, 0.9410143, 1.611872, 0, 0, 0, 1, 1,
1.849603, 0.7681549, 1.641642, 0, 0, 0, 1, 1,
1.860122, 1.163021, -0.7278448, 0, 0, 0, 1, 1,
1.880104, -2.26439, 0.1446161, 0, 0, 0, 1, 1,
1.918593, 0.1052901, 1.711711, 1, 1, 1, 1, 1,
1.923656, -0.5896147, 0.6511963, 1, 1, 1, 1, 1,
1.924861, -0.210976, 2.245051, 1, 1, 1, 1, 1,
1.940184, 1.03438, -0.7672328, 1, 1, 1, 1, 1,
1.942624, 0.330162, 0.1922499, 1, 1, 1, 1, 1,
1.949652, 0.9035884, 2.730142, 1, 1, 1, 1, 1,
1.950103, 0.009469096, 0.2194261, 1, 1, 1, 1, 1,
1.958969, -0.3599394, 2.18766, 1, 1, 1, 1, 1,
2.003929, -1.138761, 0.6238402, 1, 1, 1, 1, 1,
2.00398, -0.07620014, 1.364299, 1, 1, 1, 1, 1,
2.011815, 0.1918114, 0.8684043, 1, 1, 1, 1, 1,
2.014009, 0.9262315, 2.556604, 1, 1, 1, 1, 1,
2.034987, 0.7347265, 0.2718825, 1, 1, 1, 1, 1,
2.035524, 2.01588, -0.4199797, 1, 1, 1, 1, 1,
2.039648, -0.09017251, -0.3662861, 1, 1, 1, 1, 1,
2.03984, 0.1372148, 2.324795, 0, 0, 1, 1, 1,
2.096462, 0.3314401, 1.448699, 1, 0, 0, 1, 1,
2.154835, 0.4625649, 1.621081, 1, 0, 0, 1, 1,
2.171311, 0.9324797, 0.461558, 1, 0, 0, 1, 1,
2.181438, 2.118102, 1.166115, 1, 0, 0, 1, 1,
2.206537, 1.274587, 1.190861, 1, 0, 0, 1, 1,
2.243607, 0.8584105, 1.673278, 0, 0, 0, 1, 1,
2.252952, 0.03032843, 2.062026, 0, 0, 0, 1, 1,
2.260639, -0.2615727, 0.595033, 0, 0, 0, 1, 1,
2.332515, -1.540646, 3.762964, 0, 0, 0, 1, 1,
2.348604, 0.6104477, 3.354601, 0, 0, 0, 1, 1,
2.360949, 1.232544, 1.398476, 0, 0, 0, 1, 1,
2.426508, 0.3377654, 1.296146, 0, 0, 0, 1, 1,
2.67567, 0.7835481, 0.5684862, 1, 1, 1, 1, 1,
2.900621, -0.1552446, 1.586885, 1, 1, 1, 1, 1,
2.989622, 0.7481077, 2.929092, 1, 1, 1, 1, 1,
3.114847, -0.6463543, 2.446893, 1, 1, 1, 1, 1,
3.121744, -1.127485, 3.810457, 1, 1, 1, 1, 1,
3.124863, 0.3264514, 4.152762, 1, 1, 1, 1, 1,
3.165107, -0.4112965, 2.229607, 1, 1, 1, 1, 1
]);
var values25 = v;
var normLoc25 = gl.getAttribLocation(prog25, "aNorm");
var mvMatLoc25 = gl.getUniformLocation(prog25,"mvMatrix");
var prMatLoc25 = gl.getUniformLocation(prog25,"prMatrix");
var normMatLoc25 = gl.getUniformLocation(prog25,"normMatrix");
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
// ***** subscene 19 ****
gl.viewport(0, 0, 504, 504);
gl.scissor(0, 0, 504, 504);
gl.clearColor(1, 1, 1, 1);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
var radius = 9.509324;
var distance = 33.4011;
var t = tan(fov[19]*PI/360);
var near = distance - radius;
var far = distance + radius;
var hlen = t*near;
var aspect = 1;
prMatrix.makeIdentity();
if (aspect > 1)
prMatrix.frustum(-hlen*aspect*zoom[19], hlen*aspect*zoom[19], 
-hlen*zoom[19], hlen*zoom[19], near, far);
else  
prMatrix.frustum(-hlen*zoom[19], hlen*zoom[19], 
-hlen*zoom[19]/aspect, hlen*zoom[19]/aspect, 
near, far);
mvMatrix.makeIdentity();
mvMatrix.translate( 0.03204489, 0.3311104, 0.09692502 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.4011);
normMatrix.makeIdentity();
normMatrix.scale( 1, 1, 1 );   
normMatrix.multRight( userMatrix[19] );
// ****** spheres object 25 *******
gl.useProgram(prog25);
gl.bindBuffer(gl.ARRAY_BUFFER, sphereBuf);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, sphereIbuf);
gl.uniformMatrix4fv( prMatLoc25, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc25, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniformMatrix4fv( normMatLoc25, false, new Float32Array(normMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.enableVertexAttribArray(normLoc25 );
gl.vertexAttribPointer(normLoc25,  3, gl.FLOAT, false, 12,  0);
gl.disableVertexAttribArray( colLoc );
var sphereNorm = new CanvasMatrix4();
sphereNorm.scale(1, 1, 1);
sphereNorm.multRight(normMatrix);
gl.uniformMatrix4fv( normMatLoc25, false, new Float32Array(sphereNorm.getAsArray()) );
for (var i = 0; i < 1000; i++) {
var sphereMV = new CanvasMatrix4();
var baseofs = i*8
var ofs = baseofs + 7;	       
var scale = values25[ofs];
sphereMV.scale(1*scale, 1*scale, 1*scale);
sphereMV.translate(values25[baseofs], 
values25[baseofs+1], 
values25[baseofs+2]);
sphereMV.multRight(mvMatrix);
gl.uniformMatrix4fv( mvMatLoc25, false, new Float32Array(sphereMV.getAsArray()) );
ofs = baseofs + 3;       
gl.vertexAttrib4f( colLoc, values25[ofs], 
values25[ofs+1], 
values25[ofs+2],
values25[ofs+3] );
gl.drawElements(gl.TRIANGLES, 384, gl.UNSIGNED_SHORT, 0);
}
gl.flush ();
}
var vpx0 = {
19: 0
};
var vpy0 = {
19: 0
};
var vpWidths = {
19: 504
};
var vpHeights = {
19: 504
};
var activeModel = {
19: 19
};
var activeProjection = {
19: 19
};
var whichSubscene = function(coords){
if (0 <= coords.x && coords.x <= 504 && 0 <= coords.y && coords.y <= 504) return(19);
return(19);
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
<canvas id="testgl2canvas" width="1" height="1"></canvas> 
<p id="testgl2debug">
You must enable Javascript to view this page properly.</p>
<script>testgl2webGLStart();</script>