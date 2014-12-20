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
-3.243478, 0.6017746, -1.713264, 1, 0, 0, 1,
-2.793999, 1.348866, 0.08215718, 1, 0.007843138, 0, 1,
-2.62846, -1.375922, -4.275506, 1, 0.01176471, 0, 1,
-2.538668, 0.831175, -0.5755649, 1, 0.01960784, 0, 1,
-2.456081, -0.301819, -1.051568, 1, 0.02352941, 0, 1,
-2.444774, 0.9978384, -0.3163023, 1, 0.03137255, 0, 1,
-2.379054, 0.4522483, -0.7647699, 1, 0.03529412, 0, 1,
-2.364088, -0.05898866, -1.17241, 1, 0.04313726, 0, 1,
-2.358664, 0.3724743, -2.074249, 1, 0.04705882, 0, 1,
-2.327389, -0.245756, -1.060324, 1, 0.05490196, 0, 1,
-2.298763, -0.6369467, -1.897245, 1, 0.05882353, 0, 1,
-2.29582, -0.0723956, -2.092211, 1, 0.06666667, 0, 1,
-2.288107, -0.6657502, -0.5551692, 1, 0.07058824, 0, 1,
-2.265698, 1.002364, -1.462006, 1, 0.07843138, 0, 1,
-2.11943, -0.0768342, -1.855438, 1, 0.08235294, 0, 1,
-2.080335, 0.3340958, -0.3457972, 1, 0.09019608, 0, 1,
-2.075175, 1.464228, 0.04927277, 1, 0.09411765, 0, 1,
-2.072911, 0.6736216, -0.9015732, 1, 0.1019608, 0, 1,
-2.038585, -0.9627086, -2.635841, 1, 0.1098039, 0, 1,
-2.006407, -0.5775637, -1.741322, 1, 0.1137255, 0, 1,
-1.999597, -1.635767, -2.092904, 1, 0.1215686, 0, 1,
-1.994417, -0.1296132, -0.5956549, 1, 0.1254902, 0, 1,
-1.992397, -0.5434945, -1.466467, 1, 0.1333333, 0, 1,
-1.991515, 1.550634, -1.500148, 1, 0.1372549, 0, 1,
-1.990388, -0.2545498, -1.020867, 1, 0.145098, 0, 1,
-1.974506, 0.6354005, -2.979038, 1, 0.1490196, 0, 1,
-1.969323, -1.312668, -3.121849, 1, 0.1568628, 0, 1,
-1.963674, 0.2257868, 0.6565498, 1, 0.1607843, 0, 1,
-1.926105, 0.3069622, -2.346609, 1, 0.1686275, 0, 1,
-1.920409, -1.131144, -1.350861, 1, 0.172549, 0, 1,
-1.893658, -1.495547, -1.175708, 1, 0.1803922, 0, 1,
-1.866901, 0.623364, -3.058471, 1, 0.1843137, 0, 1,
-1.859126, -0.5302263, -2.671122, 1, 0.1921569, 0, 1,
-1.831038, -0.2829658, -1.601164, 1, 0.1960784, 0, 1,
-1.783809, -2.351994, -4.528953, 1, 0.2039216, 0, 1,
-1.770142, -0.4080127, 0.6495507, 1, 0.2117647, 0, 1,
-1.747695, -1.454545, -1.164253, 1, 0.2156863, 0, 1,
-1.737873, 0.7591864, -0.3226604, 1, 0.2235294, 0, 1,
-1.717316, -2.347659, -2.649313, 1, 0.227451, 0, 1,
-1.705615, 0.2762159, -2.638012, 1, 0.2352941, 0, 1,
-1.695233, 1.376648, -0.2236937, 1, 0.2392157, 0, 1,
-1.683977, -0.6140539, -1.849678, 1, 0.2470588, 0, 1,
-1.679656, -1.189347, -2.450748, 1, 0.2509804, 0, 1,
-1.672502, 0.5066277, -2.712092, 1, 0.2588235, 0, 1,
-1.630953, -0.05069049, -0.05961432, 1, 0.2627451, 0, 1,
-1.615364, -1.558889, -0.6476297, 1, 0.2705882, 0, 1,
-1.596918, 0.4718272, -2.002284, 1, 0.2745098, 0, 1,
-1.595638, 2.484984, 0.5162958, 1, 0.282353, 0, 1,
-1.582093, 0.1447398, -0.8710339, 1, 0.2862745, 0, 1,
-1.58117, 0.4698634, -0.4070847, 1, 0.2941177, 0, 1,
-1.578241, 0.4221842, -0.3048573, 1, 0.3019608, 0, 1,
-1.568423, -0.08458453, -1.689833, 1, 0.3058824, 0, 1,
-1.548441, -0.383772, -1.537014, 1, 0.3137255, 0, 1,
-1.547876, -0.8672875, -1.249513, 1, 0.3176471, 0, 1,
-1.545538, 0.3397245, -0.128123, 1, 0.3254902, 0, 1,
-1.537374, 0.5686914, -2.125009, 1, 0.3294118, 0, 1,
-1.523742, -0.2067188, -2.215247, 1, 0.3372549, 0, 1,
-1.512825, -0.4396646, -3.0682, 1, 0.3411765, 0, 1,
-1.50539, -0.369715, -1.858327, 1, 0.3490196, 0, 1,
-1.483456, -0.4154809, -2.205904, 1, 0.3529412, 0, 1,
-1.482834, -1.022905, -1.213244, 1, 0.3607843, 0, 1,
-1.475776, 0.2984115, -1.180552, 1, 0.3647059, 0, 1,
-1.474721, -0.7200903, -1.584274, 1, 0.372549, 0, 1,
-1.472459, 0.2391294, -1.711569, 1, 0.3764706, 0, 1,
-1.470305, -1.928132, -1.471946, 1, 0.3843137, 0, 1,
-1.470271, -1.522842, -2.147382, 1, 0.3882353, 0, 1,
-1.456417, 1.245283, -0.162285, 1, 0.3960784, 0, 1,
-1.451968, 0.6273271, -0.5287993, 1, 0.4039216, 0, 1,
-1.436096, 1.658586, -1.219299, 1, 0.4078431, 0, 1,
-1.425819, -1.74856, -3.125428, 1, 0.4156863, 0, 1,
-1.425337, 0.7171732, 0.2747166, 1, 0.4196078, 0, 1,
-1.422574, -0.332406, -2.577215, 1, 0.427451, 0, 1,
-1.416331, 1.572793, -0.2454351, 1, 0.4313726, 0, 1,
-1.406704, 1.566885, 0.0723386, 1, 0.4392157, 0, 1,
-1.403497, 0.2641151, -0.5336695, 1, 0.4431373, 0, 1,
-1.398714, 0.6019825, -1.061929, 1, 0.4509804, 0, 1,
-1.397976, 0.8328407, -2.96886, 1, 0.454902, 0, 1,
-1.389454, -1.12773, -3.73643, 1, 0.4627451, 0, 1,
-1.384419, -1.511341, -2.461478, 1, 0.4666667, 0, 1,
-1.380334, 0.3135445, -0.2427384, 1, 0.4745098, 0, 1,
-1.378385, -0.5116352, -0.7231956, 1, 0.4784314, 0, 1,
-1.376946, 0.9426528, -0.5215092, 1, 0.4862745, 0, 1,
-1.373582, -0.4058739, -3.311184, 1, 0.4901961, 0, 1,
-1.368182, -0.38602, -1.51152, 1, 0.4980392, 0, 1,
-1.367914, 2.308893, -1.298362, 1, 0.5058824, 0, 1,
-1.36709, 0.969142, -2.71117, 1, 0.509804, 0, 1,
-1.352054, -1.607536, -3.149231, 1, 0.5176471, 0, 1,
-1.337048, 0.6321344, -1.569966, 1, 0.5215687, 0, 1,
-1.336582, -1.760438, -2.700817, 1, 0.5294118, 0, 1,
-1.333976, -0.07628743, -2.56671, 1, 0.5333334, 0, 1,
-1.331297, -0.3588249, -1.408565, 1, 0.5411765, 0, 1,
-1.324995, -1.695441, -1.958837, 1, 0.5450981, 0, 1,
-1.321284, 0.8120895, -2.317486, 1, 0.5529412, 0, 1,
-1.307417, 1.236374, 0.09883693, 1, 0.5568628, 0, 1,
-1.305865, -0.02992484, -1.890473, 1, 0.5647059, 0, 1,
-1.301536, -1.429151, -1.954694, 1, 0.5686275, 0, 1,
-1.295831, 0.6485611, -0.427518, 1, 0.5764706, 0, 1,
-1.294164, -0.1396386, -1.522224, 1, 0.5803922, 0, 1,
-1.284618, 0.5779399, -0.4284903, 1, 0.5882353, 0, 1,
-1.274328, 0.7736591, -1.461894, 1, 0.5921569, 0, 1,
-1.270648, -0.1666819, -1.232661, 1, 0.6, 0, 1,
-1.269762, -1.108899, -2.266752, 1, 0.6078432, 0, 1,
-1.268725, 0.4709574, -0.75467, 1, 0.6117647, 0, 1,
-1.265539, -0.5252019, -1.810335, 1, 0.6196079, 0, 1,
-1.264724, -0.8421162, -3.771037, 1, 0.6235294, 0, 1,
-1.261577, 0.5461301, 0.3627538, 1, 0.6313726, 0, 1,
-1.260812, 0.7211679, -1.819187, 1, 0.6352941, 0, 1,
-1.25483, -0.8599033, -1.484762, 1, 0.6431373, 0, 1,
-1.251133, -0.8707501, -3.181056, 1, 0.6470588, 0, 1,
-1.244385, 0.1639003, -2.688508, 1, 0.654902, 0, 1,
-1.236209, -0.01054105, -2.15941, 1, 0.6588235, 0, 1,
-1.226483, 2.190386, -1.088655, 1, 0.6666667, 0, 1,
-1.214438, -0.869033, -1.745551, 1, 0.6705883, 0, 1,
-1.203699, 2.440899, -0.1340474, 1, 0.6784314, 0, 1,
-1.202925, -0.6514238, -1.67758, 1, 0.682353, 0, 1,
-1.194779, 0.5829417, -1.83994, 1, 0.6901961, 0, 1,
-1.192596, -1.562624, -2.698145, 1, 0.6941177, 0, 1,
-1.189483, -1.08041, -3.117395, 1, 0.7019608, 0, 1,
-1.18223, 0.4851931, -1.267627, 1, 0.7098039, 0, 1,
-1.178999, 0.2657854, -3.351201, 1, 0.7137255, 0, 1,
-1.164408, 0.2526698, 0.2638177, 1, 0.7215686, 0, 1,
-1.16094, -0.05737982, -1.406834, 1, 0.7254902, 0, 1,
-1.160732, 1.223174, -1.083364, 1, 0.7333333, 0, 1,
-1.154557, -0.8684765, 0.3267595, 1, 0.7372549, 0, 1,
-1.134975, -0.3399077, -0.5074981, 1, 0.7450981, 0, 1,
-1.132404, 0.5805312, -1.899488, 1, 0.7490196, 0, 1,
-1.130144, -2.2208, -2.568186, 1, 0.7568628, 0, 1,
-1.127823, -1.461568, -3.122988, 1, 0.7607843, 0, 1,
-1.125788, 0.7437355, 0.6175197, 1, 0.7686275, 0, 1,
-1.123503, -0.7353908, -1.171505, 1, 0.772549, 0, 1,
-1.112413, -0.4567952, -2.44802, 1, 0.7803922, 0, 1,
-1.098299, -1.68976, -0.4831441, 1, 0.7843137, 0, 1,
-1.096821, -0.5291343, -2.59095, 1, 0.7921569, 0, 1,
-1.093987, 0.8624558, -1.146324, 1, 0.7960784, 0, 1,
-1.088657, -0.1206892, -1.538835, 1, 0.8039216, 0, 1,
-1.086995, -0.4416149, -1.872254, 1, 0.8117647, 0, 1,
-1.085176, -1.920339, -2.680933, 1, 0.8156863, 0, 1,
-1.084724, -0.2863147, -1.62714, 1, 0.8235294, 0, 1,
-1.067344, -0.02212813, -1.822499, 1, 0.827451, 0, 1,
-1.066647, 0.1532601, -2.108517, 1, 0.8352941, 0, 1,
-1.061569, -2.392752, -3.812717, 1, 0.8392157, 0, 1,
-1.061251, -1.505637, -3.359864, 1, 0.8470588, 0, 1,
-1.057745, 1.152778, -0.8956462, 1, 0.8509804, 0, 1,
-1.057494, -0.292484, -1.786834, 1, 0.8588235, 0, 1,
-1.056879, -0.3831888, -2.28384, 1, 0.8627451, 0, 1,
-1.056411, 1.022784, -1.341585, 1, 0.8705882, 0, 1,
-1.050506, -1.009571, -1.87706, 1, 0.8745098, 0, 1,
-1.046797, -0.4868954, -2.958661, 1, 0.8823529, 0, 1,
-1.046764, 0.7531779, -0.3367162, 1, 0.8862745, 0, 1,
-1.044542, -1.205681, -1.896946, 1, 0.8941177, 0, 1,
-1.044356, -0.8712206, -2.753829, 1, 0.8980392, 0, 1,
-1.037392, -1.079055, -2.842569, 1, 0.9058824, 0, 1,
-1.023878, 0.6253716, 0.1564683, 1, 0.9137255, 0, 1,
-1.021718, 0.01328756, -1.806321, 1, 0.9176471, 0, 1,
-1.016071, -2.290442, -4.64134, 1, 0.9254902, 0, 1,
-1.015622, 0.503448, -0.1547976, 1, 0.9294118, 0, 1,
-1.015173, 0.7940789, -0.929824, 1, 0.9372549, 0, 1,
-1.014296, 0.8723673, -0.943971, 1, 0.9411765, 0, 1,
-1.013086, 1.524114, -1.534618, 1, 0.9490196, 0, 1,
-1.012678, -0.8942058, -1.111595, 1, 0.9529412, 0, 1,
-1.008609, 1.506655, -0.675335, 1, 0.9607843, 0, 1,
-1.008039, -0.2516747, -2.73811, 1, 0.9647059, 0, 1,
-1.006773, -1.465475, -3.043665, 1, 0.972549, 0, 1,
-0.9999804, -1.047142, -1.607934, 1, 0.9764706, 0, 1,
-0.9998782, -0.339485, -2.948997, 1, 0.9843137, 0, 1,
-0.9974304, 0.7422854, 1.034198, 1, 0.9882353, 0, 1,
-0.992521, -0.142786, -2.332309, 1, 0.9960784, 0, 1,
-0.9923025, 0.4622647, -1.223089, 0.9960784, 1, 0, 1,
-0.9855031, 0.08188312, -0.8938091, 0.9921569, 1, 0, 1,
-0.9839838, 0.611617, -0.473664, 0.9843137, 1, 0, 1,
-0.9820985, 0.2091304, -0.6146101, 0.9803922, 1, 0, 1,
-0.9819683, -0.05006276, -2.004662, 0.972549, 1, 0, 1,
-0.9735796, -0.2173494, -2.984339, 0.9686275, 1, 0, 1,
-0.9688121, 0.00148416, -2.38146, 0.9607843, 1, 0, 1,
-0.9677472, -0.8568121, -3.142646, 0.9568627, 1, 0, 1,
-0.9672757, 0.8497432, 0.2641422, 0.9490196, 1, 0, 1,
-0.964453, -0.05326706, -0.006506335, 0.945098, 1, 0, 1,
-0.9638576, 0.1468322, -0.7109166, 0.9372549, 1, 0, 1,
-0.9444399, 0.3748597, 0.6421365, 0.9333333, 1, 0, 1,
-0.9384485, -0.4622427, -2.047692, 0.9254902, 1, 0, 1,
-0.937195, -0.6423705, -2.287272, 0.9215686, 1, 0, 1,
-0.9271076, 0.1530746, -3.337456, 0.9137255, 1, 0, 1,
-0.9235892, 2.883983, -0.2349094, 0.9098039, 1, 0, 1,
-0.9179071, -0.9006484, -0.4608636, 0.9019608, 1, 0, 1,
-0.9099222, -1.615515, -2.485362, 0.8941177, 1, 0, 1,
-0.9041309, -1.269195, -1.812558, 0.8901961, 1, 0, 1,
-0.9015203, -1.06899, -2.110891, 0.8823529, 1, 0, 1,
-0.8973048, 1.820392, -0.07923861, 0.8784314, 1, 0, 1,
-0.8947546, -0.1689092, 0.293262, 0.8705882, 1, 0, 1,
-0.8943224, 1.069404, -1.207825, 0.8666667, 1, 0, 1,
-0.8828281, 0.6729246, -0.8711971, 0.8588235, 1, 0, 1,
-0.8813523, -1.084915, -4.11661, 0.854902, 1, 0, 1,
-0.8810167, 1.419093, -0.2290975, 0.8470588, 1, 0, 1,
-0.8807857, -1.100075, -2.469391, 0.8431373, 1, 0, 1,
-0.877627, -0.1059899, -4.005063, 0.8352941, 1, 0, 1,
-0.8700343, 0.135821, -0.3210466, 0.8313726, 1, 0, 1,
-0.8685853, -1.204156, -2.387459, 0.8235294, 1, 0, 1,
-0.86707, 0.5118375, 0.2019397, 0.8196079, 1, 0, 1,
-0.8667272, -0.5439869, -2.796595, 0.8117647, 1, 0, 1,
-0.8619415, 1.434065, -0.9015492, 0.8078431, 1, 0, 1,
-0.8589358, 0.8771262, -1.751206, 0.8, 1, 0, 1,
-0.8524917, 2.121662, 0.637081, 0.7921569, 1, 0, 1,
-0.8466616, 1.706983, 0.06963994, 0.7882353, 1, 0, 1,
-0.8445963, -1.508428, -2.555871, 0.7803922, 1, 0, 1,
-0.8443608, 0.02673742, -3.613605, 0.7764706, 1, 0, 1,
-0.8391468, 0.7444319, -1.798894, 0.7686275, 1, 0, 1,
-0.8387683, 0.6968139, -0.1783554, 0.7647059, 1, 0, 1,
-0.8354234, -0.5706913, -2.238939, 0.7568628, 1, 0, 1,
-0.8328462, 1.545001, 0.04699386, 0.7529412, 1, 0, 1,
-0.8319886, 2.070281, -0.4253324, 0.7450981, 1, 0, 1,
-0.8240077, 0.8220708, -0.2519217, 0.7411765, 1, 0, 1,
-0.8197817, 0.2338151, -2.918909, 0.7333333, 1, 0, 1,
-0.8088567, 1.337689, -0.5097002, 0.7294118, 1, 0, 1,
-0.8076674, -0.1637497, -0.8501999, 0.7215686, 1, 0, 1,
-0.802993, 0.4590057, 0.480969, 0.7176471, 1, 0, 1,
-0.7941858, 1.448705, 0.287431, 0.7098039, 1, 0, 1,
-0.7917329, 0.1601377, -1.638826, 0.7058824, 1, 0, 1,
-0.7904373, 0.1453858, -2.446402, 0.6980392, 1, 0, 1,
-0.7873766, 0.6971331, -0.1333781, 0.6901961, 1, 0, 1,
-0.7853386, -0.0949482, -4.039704, 0.6862745, 1, 0, 1,
-0.7838319, -0.111595, -0.7864454, 0.6784314, 1, 0, 1,
-0.7825058, -0.09417464, -2.199607, 0.6745098, 1, 0, 1,
-0.7747355, -0.1085055, -1.410111, 0.6666667, 1, 0, 1,
-0.7725493, 2.728729, -0.02477573, 0.6627451, 1, 0, 1,
-0.769057, 1.468758, -1.088371, 0.654902, 1, 0, 1,
-0.767468, -0.5253239, -2.620879, 0.6509804, 1, 0, 1,
-0.7662084, 0.2442611, -2.446653, 0.6431373, 1, 0, 1,
-0.7653494, 1.314516, 0.3514753, 0.6392157, 1, 0, 1,
-0.7649897, 0.487558, 1.402324, 0.6313726, 1, 0, 1,
-0.7639594, 0.5475849, -1.606867, 0.627451, 1, 0, 1,
-0.7622665, 1.439871, -1.217262, 0.6196079, 1, 0, 1,
-0.7613201, -0.704941, -0.3703242, 0.6156863, 1, 0, 1,
-0.7457975, -0.4222138, -0.8785285, 0.6078432, 1, 0, 1,
-0.7404084, 2.078954, 0.7860823, 0.6039216, 1, 0, 1,
-0.7370295, 1.794727, 1.683964, 0.5960785, 1, 0, 1,
-0.7359917, 0.4090098, -1.303821, 0.5882353, 1, 0, 1,
-0.7313238, -1.830951, -2.280021, 0.5843138, 1, 0, 1,
-0.7270481, 0.3210805, -2.419231, 0.5764706, 1, 0, 1,
-0.7252085, -1.650445, -2.835956, 0.572549, 1, 0, 1,
-0.7243217, 0.3863808, -2.042866, 0.5647059, 1, 0, 1,
-0.7242821, 1.61583, -1.346523, 0.5607843, 1, 0, 1,
-0.7211122, 1.243697, -1.589191, 0.5529412, 1, 0, 1,
-0.7206959, -1.147817, -1.499529, 0.5490196, 1, 0, 1,
-0.7093286, 0.6084933, 0.5572348, 0.5411765, 1, 0, 1,
-0.6978002, 0.0240917, -3.463753, 0.5372549, 1, 0, 1,
-0.6868961, 0.07881816, -1.81612, 0.5294118, 1, 0, 1,
-0.6834201, 1.309339, -0.8360552, 0.5254902, 1, 0, 1,
-0.6762761, 1.151028, -3.627229, 0.5176471, 1, 0, 1,
-0.6757127, -0.1702843, -3.046904, 0.5137255, 1, 0, 1,
-0.6711723, -1.072074, -3.08211, 0.5058824, 1, 0, 1,
-0.6703505, 0.4623036, -0.8580605, 0.5019608, 1, 0, 1,
-0.6666504, -0.615389, -0.8716904, 0.4941176, 1, 0, 1,
-0.6663204, 1.64907, 0.3288732, 0.4862745, 1, 0, 1,
-0.661716, 0.8815557, -0.6354043, 0.4823529, 1, 0, 1,
-0.6596204, 0.6210096, -0.213678, 0.4745098, 1, 0, 1,
-0.6585771, -0.1048612, -1.415087, 0.4705882, 1, 0, 1,
-0.653438, -0.4771299, -1.333243, 0.4627451, 1, 0, 1,
-0.6492226, -1.423812, -2.174188, 0.4588235, 1, 0, 1,
-0.6444928, -0.3337361, -1.322504, 0.4509804, 1, 0, 1,
-0.6437771, 0.240843, -1.657378, 0.4470588, 1, 0, 1,
-0.6389864, -1.641343, -1.624528, 0.4392157, 1, 0, 1,
-0.6378993, 0.7174773, -3.247892, 0.4352941, 1, 0, 1,
-0.6369175, 0.4291322, -0.8230868, 0.427451, 1, 0, 1,
-0.6351112, -0.6094831, -3.786208, 0.4235294, 1, 0, 1,
-0.6334828, 1.027264, -1.67461, 0.4156863, 1, 0, 1,
-0.6295372, 1.743306, 0.3651457, 0.4117647, 1, 0, 1,
-0.6249229, 0.1066255, -1.611975, 0.4039216, 1, 0, 1,
-0.6241987, 0.05166388, -1.236714, 0.3960784, 1, 0, 1,
-0.6235688, 1.744176, -1.111129, 0.3921569, 1, 0, 1,
-0.6229512, -0.8723651, -1.755132, 0.3843137, 1, 0, 1,
-0.6175465, -0.3696486, -1.511125, 0.3803922, 1, 0, 1,
-0.6142879, 1.00143, 0.4293484, 0.372549, 1, 0, 1,
-0.6117185, -1.579307, -3.147588, 0.3686275, 1, 0, 1,
-0.6095218, 0.8565664, 1.105725, 0.3607843, 1, 0, 1,
-0.6044967, 1.488812, -0.6608253, 0.3568628, 1, 0, 1,
-0.6011865, 0.07891325, -1.041212, 0.3490196, 1, 0, 1,
-0.5937403, 1.266416, -1.029522, 0.345098, 1, 0, 1,
-0.589839, -0.3432972, -3.348129, 0.3372549, 1, 0, 1,
-0.5894773, -1.237896, -1.73241, 0.3333333, 1, 0, 1,
-0.5894511, -2.036513, -2.582169, 0.3254902, 1, 0, 1,
-0.5887193, -0.4587303, -1.579419, 0.3215686, 1, 0, 1,
-0.5860856, -0.94762, -2.273463, 0.3137255, 1, 0, 1,
-0.5858266, -0.640195, -3.767401, 0.3098039, 1, 0, 1,
-0.583694, 1.57628, -1.443895, 0.3019608, 1, 0, 1,
-0.5808029, 0.1502833, -2.365834, 0.2941177, 1, 0, 1,
-0.5802536, -0.1033728, -1.401789, 0.2901961, 1, 0, 1,
-0.5792768, 0.6621024, 0.08868652, 0.282353, 1, 0, 1,
-0.5792631, 0.2792921, -1.88385, 0.2784314, 1, 0, 1,
-0.5724931, -1.013063, -4.24363, 0.2705882, 1, 0, 1,
-0.5709728, 0.8136506, -0.7114438, 0.2666667, 1, 0, 1,
-0.5674673, -0.3910208, -3.123486, 0.2588235, 1, 0, 1,
-0.5666133, 0.3342553, -1.225573, 0.254902, 1, 0, 1,
-0.5640686, 0.1185467, -3.356926, 0.2470588, 1, 0, 1,
-0.5593781, 0.8086383, 0.1228107, 0.2431373, 1, 0, 1,
-0.5577122, 0.05557052, -2.079068, 0.2352941, 1, 0, 1,
-0.5492131, -1.398694, -2.738583, 0.2313726, 1, 0, 1,
-0.54656, 1.677464, 0.2305455, 0.2235294, 1, 0, 1,
-0.5426477, -0.4619862, -2.874928, 0.2196078, 1, 0, 1,
-0.5413089, 1.942789, -0.2780519, 0.2117647, 1, 0, 1,
-0.5397246, 0.8392864, -0.3833562, 0.2078431, 1, 0, 1,
-0.5381724, -0.9603909, -2.615733, 0.2, 1, 0, 1,
-0.532428, 0.39017, -1.508283, 0.1921569, 1, 0, 1,
-0.5249731, 0.9210206, -0.4690318, 0.1882353, 1, 0, 1,
-0.5206829, 1.594751, -2.580467, 0.1803922, 1, 0, 1,
-0.5197092, 0.3134242, -1.27395, 0.1764706, 1, 0, 1,
-0.5191137, 0.8175862, -0.009963426, 0.1686275, 1, 0, 1,
-0.5141608, -0.1332274, -3.113323, 0.1647059, 1, 0, 1,
-0.5046722, 0.3582196, 1.306862, 0.1568628, 1, 0, 1,
-0.5039431, 1.334598, 0.3789528, 0.1529412, 1, 0, 1,
-0.5034279, 1.081692, -1.592567, 0.145098, 1, 0, 1,
-0.5030605, 0.6224838, -1.692837, 0.1411765, 1, 0, 1,
-0.5009053, -1.249242, -2.200712, 0.1333333, 1, 0, 1,
-0.497512, -0.4951384, -4.176449, 0.1294118, 1, 0, 1,
-0.4941941, 0.5285168, -0.9773573, 0.1215686, 1, 0, 1,
-0.4894013, -0.1420144, -3.703336, 0.1176471, 1, 0, 1,
-0.4858017, -0.2170195, -1.328285, 0.1098039, 1, 0, 1,
-0.4851811, -2.038786, -2.590443, 0.1058824, 1, 0, 1,
-0.4850754, -2.706856, -2.913904, 0.09803922, 1, 0, 1,
-0.4846987, 1.004556, 0.5371428, 0.09019608, 1, 0, 1,
-0.4830129, 0.07710302, -0.0187821, 0.08627451, 1, 0, 1,
-0.4797474, 1.048849, -2.097542, 0.07843138, 1, 0, 1,
-0.4785964, -0.5550163, -3.156667, 0.07450981, 1, 0, 1,
-0.4780834, -1.493198, -4.386191, 0.06666667, 1, 0, 1,
-0.4745003, 0.3238832, -1.817351, 0.0627451, 1, 0, 1,
-0.474164, 0.393458, -1.712456, 0.05490196, 1, 0, 1,
-0.4732418, -1.14155, -4.693132, 0.05098039, 1, 0, 1,
-0.4720471, 0.03818132, -0.705304, 0.04313726, 1, 0, 1,
-0.4714278, -0.9351976, -2.585756, 0.03921569, 1, 0, 1,
-0.4698953, 1.303608, 0.03959728, 0.03137255, 1, 0, 1,
-0.4692819, -1.792595, -2.358668, 0.02745098, 1, 0, 1,
-0.4669712, 0.9197375, 0.5718797, 0.01960784, 1, 0, 1,
-0.4647311, 0.9828818, -0.6784619, 0.01568628, 1, 0, 1,
-0.461366, -1.16242, -1.793086, 0.007843138, 1, 0, 1,
-0.4542795, -0.4701337, -1.930525, 0.003921569, 1, 0, 1,
-0.4531082, 2.012213, 0.6633195, 0, 1, 0.003921569, 1,
-0.4518114, 0.3648948, -0.3142837, 0, 1, 0.01176471, 1,
-0.4512965, 1.30727, -2.115437, 0, 1, 0.01568628, 1,
-0.4509538, 0.7358722, -0.4729196, 0, 1, 0.02352941, 1,
-0.4452711, 0.3269373, -0.2570677, 0, 1, 0.02745098, 1,
-0.4448154, 0.7200295, -0.7230169, 0, 1, 0.03529412, 1,
-0.4439328, -2.920611, -3.19, 0, 1, 0.03921569, 1,
-0.4352601, -1.223583, -2.735484, 0, 1, 0.04705882, 1,
-0.4290888, 0.4925366, -2.121428, 0, 1, 0.05098039, 1,
-0.428365, 0.5802106, -1.14652, 0, 1, 0.05882353, 1,
-0.4189973, -0.2443912, -1.340332, 0, 1, 0.0627451, 1,
-0.4074457, -0.5989199, -4.48028, 0, 1, 0.07058824, 1,
-0.4052505, -0.1624064, -3.062827, 0, 1, 0.07450981, 1,
-0.4050202, 0.06641235, -3.062352, 0, 1, 0.08235294, 1,
-0.4047343, 0.0598139, -2.645416, 0, 1, 0.08627451, 1,
-0.4037637, -0.7078038, -4.528907, 0, 1, 0.09411765, 1,
-0.4022381, -0.2750695, -1.245733, 0, 1, 0.1019608, 1,
-0.4013316, 1.350165, 1.20473, 0, 1, 0.1058824, 1,
-0.4012482, 0.4430304, -1.869653, 0, 1, 0.1137255, 1,
-0.3986513, 0.3330419, -2.093259, 0, 1, 0.1176471, 1,
-0.3972092, 0.3338996, -2.244098, 0, 1, 0.1254902, 1,
-0.3971235, 2.250024, 0.4035832, 0, 1, 0.1294118, 1,
-0.3861163, 0.3773098, 1.183016, 0, 1, 0.1372549, 1,
-0.3825829, 0.2220086, 0.3662798, 0, 1, 0.1411765, 1,
-0.3722211, 1.57538, 0.2504116, 0, 1, 0.1490196, 1,
-0.3700419, -0.1472067, -1.755104, 0, 1, 0.1529412, 1,
-0.3681625, -0.2769057, -1.84091, 0, 1, 0.1607843, 1,
-0.3636975, -0.8099229, -2.394976, 0, 1, 0.1647059, 1,
-0.3621505, -2.328837, -2.268354, 0, 1, 0.172549, 1,
-0.3604571, 0.2792787, -1.231005, 0, 1, 0.1764706, 1,
-0.3598812, 0.286624, -0.8731361, 0, 1, 0.1843137, 1,
-0.3587891, -0.2157889, 0.04742339, 0, 1, 0.1882353, 1,
-0.358417, -0.2275064, -1.714945, 0, 1, 0.1960784, 1,
-0.3583681, -0.7467164, -2.101583, 0, 1, 0.2039216, 1,
-0.3578852, 0.2604084, -0.03888672, 0, 1, 0.2078431, 1,
-0.3509039, -0.5017386, -3.34601, 0, 1, 0.2156863, 1,
-0.3493999, -0.4187859, -4.427639, 0, 1, 0.2196078, 1,
-0.3482666, 1.222845, -0.8782765, 0, 1, 0.227451, 1,
-0.3462757, 0.4122403, -0.2058234, 0, 1, 0.2313726, 1,
-0.3433133, -0.6932068, -1.792179, 0, 1, 0.2392157, 1,
-0.3428656, 0.01523859, -2.27273, 0, 1, 0.2431373, 1,
-0.3423655, -0.6197266, -1.664211, 0, 1, 0.2509804, 1,
-0.3410628, -0.4690805, -2.836221, 0, 1, 0.254902, 1,
-0.3316028, 0.5360065, 0.3013583, 0, 1, 0.2627451, 1,
-0.32855, 0.9098614, 0.4547763, 0, 1, 0.2666667, 1,
-0.3271372, -0.058133, -1.976372, 0, 1, 0.2745098, 1,
-0.323217, -1.234179, -3.062257, 0, 1, 0.2784314, 1,
-0.3218482, 2.02388, 0.9410648, 0, 1, 0.2862745, 1,
-0.3218242, 2.997988, -0.6103994, 0, 1, 0.2901961, 1,
-0.3211708, 1.40489, 1.419519, 0, 1, 0.2980392, 1,
-0.3176255, -2.044305, -1.993935, 0, 1, 0.3058824, 1,
-0.3116201, -0.3508906, -3.099183, 0, 1, 0.3098039, 1,
-0.3112777, -0.8599286, -3.463404, 0, 1, 0.3176471, 1,
-0.3025074, -1.274596, -1.762373, 0, 1, 0.3215686, 1,
-0.3017206, -0.2091949, -1.255534, 0, 1, 0.3294118, 1,
-0.2999055, -1.512736, -2.323691, 0, 1, 0.3333333, 1,
-0.2981775, 0.4113393, -0.9038545, 0, 1, 0.3411765, 1,
-0.2950054, 0.6348963, 0.8799245, 0, 1, 0.345098, 1,
-0.2922418, -0.936445, -2.210342, 0, 1, 0.3529412, 1,
-0.2916239, -1.471196, -5.364587, 0, 1, 0.3568628, 1,
-0.2915275, -0.2556316, -2.444556, 0, 1, 0.3647059, 1,
-0.2897513, 1.076878, -1.171299, 0, 1, 0.3686275, 1,
-0.2882146, 0.8518548, -1.264204, 0, 1, 0.3764706, 1,
-0.2855733, -0.9561425, -2.57545, 0, 1, 0.3803922, 1,
-0.2715226, 0.3245889, 0.6732619, 0, 1, 0.3882353, 1,
-0.2671094, 1.411099, -0.6841774, 0, 1, 0.3921569, 1,
-0.2654293, -0.8243276, -4.137762, 0, 1, 0.4, 1,
-0.2615653, 0.4978072, -0.9188347, 0, 1, 0.4078431, 1,
-0.2592464, -0.4547586, -3.414907, 0, 1, 0.4117647, 1,
-0.2561785, 0.5225203, 0.06461905, 0, 1, 0.4196078, 1,
-0.2536333, 0.3873827, -2.176666, 0, 1, 0.4235294, 1,
-0.2477273, -1.172441, -2.066098, 0, 1, 0.4313726, 1,
-0.2475708, -0.6276081, -2.041271, 0, 1, 0.4352941, 1,
-0.245294, 1.18201, -1.580174, 0, 1, 0.4431373, 1,
-0.2420994, 0.8329331, -1.362242, 0, 1, 0.4470588, 1,
-0.2420561, 1.246741, 1.467215, 0, 1, 0.454902, 1,
-0.2406808, -0.03225707, -0.2680191, 0, 1, 0.4588235, 1,
-0.2404921, 0.4017926, 0.6244556, 0, 1, 0.4666667, 1,
-0.2376995, -0.8025882, -3.533011, 0, 1, 0.4705882, 1,
-0.2374313, 0.7114799, -0.9220024, 0, 1, 0.4784314, 1,
-0.2320352, 1.281361, -0.0490474, 0, 1, 0.4823529, 1,
-0.2284837, 0.1902784, -0.127066, 0, 1, 0.4901961, 1,
-0.2280173, -0.6669669, -4.199244, 0, 1, 0.4941176, 1,
-0.2257412, -0.4515931, -3.582846, 0, 1, 0.5019608, 1,
-0.2252284, -0.2642695, -2.423499, 0, 1, 0.509804, 1,
-0.2237291, 1.25182, 0.3802151, 0, 1, 0.5137255, 1,
-0.2234959, 0.00300944, -1.960299, 0, 1, 0.5215687, 1,
-0.2224269, -0.09744106, -0.6922356, 0, 1, 0.5254902, 1,
-0.2213775, 0.6893981, -1.34219, 0, 1, 0.5333334, 1,
-0.2213666, -0.1172321, -1.773597, 0, 1, 0.5372549, 1,
-0.2151604, 1.586769, -0.2064266, 0, 1, 0.5450981, 1,
-0.2129068, 0.5854525, 0.5852014, 0, 1, 0.5490196, 1,
-0.2123641, -0.5755039, -4.218649, 0, 1, 0.5568628, 1,
-0.2021128, 1.029024, -0.5224832, 0, 1, 0.5607843, 1,
-0.1981292, 0.47002, -1.186403, 0, 1, 0.5686275, 1,
-0.1969359, -0.9124759, -4.352163, 0, 1, 0.572549, 1,
-0.1948612, -0.7222499, -0.3413112, 0, 1, 0.5803922, 1,
-0.1917402, -0.8177672, -3.747244, 0, 1, 0.5843138, 1,
-0.1899326, -1.567108, -1.343298, 0, 1, 0.5921569, 1,
-0.1824879, 1.152295, -0.1498009, 0, 1, 0.5960785, 1,
-0.1808147, -0.5267335, -2.98109, 0, 1, 0.6039216, 1,
-0.1807506, -0.1054617, -0.9127307, 0, 1, 0.6117647, 1,
-0.1776426, -0.8278647, -4.460932, 0, 1, 0.6156863, 1,
-0.1766264, -0.5539776, -1.631453, 0, 1, 0.6235294, 1,
-0.1712237, -1.633274, -1.164035, 0, 1, 0.627451, 1,
-0.1702575, -1.922385, -3.696262, 0, 1, 0.6352941, 1,
-0.1661198, -0.311981, -2.347577, 0, 1, 0.6392157, 1,
-0.1657761, -0.01455517, -2.390343, 0, 1, 0.6470588, 1,
-0.1656963, -0.4594649, -2.777797, 0, 1, 0.6509804, 1,
-0.1631685, 1.373651, 0.7230752, 0, 1, 0.6588235, 1,
-0.1626333, -0.07696214, -1.518134, 0, 1, 0.6627451, 1,
-0.1600525, -1.983172, -2.672696, 0, 1, 0.6705883, 1,
-0.1546354, 0.1529769, -0.005759609, 0, 1, 0.6745098, 1,
-0.152353, 1.599131, -0.7775552, 0, 1, 0.682353, 1,
-0.1509999, 0.2648614, 1.021193, 0, 1, 0.6862745, 1,
-0.1501199, 0.3916158, -2.43138, 0, 1, 0.6941177, 1,
-0.1470582, -1.046595, -3.109887, 0, 1, 0.7019608, 1,
-0.1458953, -0.02416596, -4.30948, 0, 1, 0.7058824, 1,
-0.1447818, -0.2201442, -2.359572, 0, 1, 0.7137255, 1,
-0.1415949, -1.495794, -3.038859, 0, 1, 0.7176471, 1,
-0.1408521, -0.2007461, -1.601598, 0, 1, 0.7254902, 1,
-0.136954, -0.1338331, -1.387427, 0, 1, 0.7294118, 1,
-0.1335706, -0.7128499, -2.562503, 0, 1, 0.7372549, 1,
-0.1300848, -1.563692, -1.244198, 0, 1, 0.7411765, 1,
-0.1287456, -1.00166, -3.046381, 0, 1, 0.7490196, 1,
-0.1246156, -0.3385406, -5.132329, 0, 1, 0.7529412, 1,
-0.1233782, -0.04190874, -2.164983, 0, 1, 0.7607843, 1,
-0.1220699, -1.182756, -2.35948, 0, 1, 0.7647059, 1,
-0.1212108, 1.525231, 1.581032, 0, 1, 0.772549, 1,
-0.1207252, -2.037488, -3.64721, 0, 1, 0.7764706, 1,
-0.1205164, 0.9443157, 0.875391, 0, 1, 0.7843137, 1,
-0.1174379, -0.2943901, -0.7987103, 0, 1, 0.7882353, 1,
-0.1169333, -0.03607303, -1.501556, 0, 1, 0.7960784, 1,
-0.1169301, -0.4930493, -3.330673, 0, 1, 0.8039216, 1,
-0.1141833, -0.4345105, -1.141133, 0, 1, 0.8078431, 1,
-0.1133669, 0.1508526, -3.607343, 0, 1, 0.8156863, 1,
-0.106101, -0.7634507, -4.471097, 0, 1, 0.8196079, 1,
-0.1035596, -0.4553048, -3.178456, 0, 1, 0.827451, 1,
-0.102544, -0.4729418, -1.079491, 0, 1, 0.8313726, 1,
-0.1012855, 0.01118227, -1.566209, 0, 1, 0.8392157, 1,
-0.1004049, 0.8309971, -1.258256, 0, 1, 0.8431373, 1,
-0.09180985, -0.786445, -1.953024, 0, 1, 0.8509804, 1,
-0.08988293, -1.861587, -2.826327, 0, 1, 0.854902, 1,
-0.08860573, -0.09865957, -3.634668, 0, 1, 0.8627451, 1,
-0.0833076, 0.1860037, -0.5764134, 0, 1, 0.8666667, 1,
-0.08195769, -0.4833713, -2.858725, 0, 1, 0.8745098, 1,
-0.08081166, 0.8363416, 0.8550976, 0, 1, 0.8784314, 1,
-0.07770057, -0.6188973, -4.655628, 0, 1, 0.8862745, 1,
-0.07719506, -1.442925, -3.748893, 0, 1, 0.8901961, 1,
-0.07461247, 1.874063, -1.112353, 0, 1, 0.8980392, 1,
-0.07424053, -0.9984785, -3.113469, 0, 1, 0.9058824, 1,
-0.07310755, -1.8676, -3.307968, 0, 1, 0.9098039, 1,
-0.06926788, 0.4373537, 0.3367898, 0, 1, 0.9176471, 1,
-0.06592781, -1.764972, -2.550577, 0, 1, 0.9215686, 1,
-0.06483421, 0.3566444, 0.434539, 0, 1, 0.9294118, 1,
-0.06345727, 1.401054, -0.3978453, 0, 1, 0.9333333, 1,
-0.06251723, -2.083032, -3.401116, 0, 1, 0.9411765, 1,
-0.06250071, -0.07106209, -3.426316, 0, 1, 0.945098, 1,
-0.06182944, -0.139675, -3.351631, 0, 1, 0.9529412, 1,
-0.06040331, -0.1921944, -3.380825, 0, 1, 0.9568627, 1,
-0.05912488, -1.314122, -4.202127, 0, 1, 0.9647059, 1,
-0.05382968, -0.5105677, -2.167997, 0, 1, 0.9686275, 1,
-0.05109103, 1.386828, 0.3873766, 0, 1, 0.9764706, 1,
-0.04090353, -1.345764, -3.648482, 0, 1, 0.9803922, 1,
-0.03806498, 0.2945025, -1.510188, 0, 1, 0.9882353, 1,
-0.0337812, 0.6694826, 0.1138781, 0, 1, 0.9921569, 1,
-0.03326149, -1.014214, -3.3386, 0, 1, 1, 1,
-0.03118709, 0.266402, -0.7139706, 0, 0.9921569, 1, 1,
-0.02956597, 1.424585, 0.7393886, 0, 0.9882353, 1, 1,
-0.02907416, -0.5552052, -3.918968, 0, 0.9803922, 1, 1,
-0.0237605, 1.038622, -1.63249, 0, 0.9764706, 1, 1,
-0.02262589, 1.716488, 1.152167, 0, 0.9686275, 1, 1,
-0.01085421, 0.0516833, -2.834883, 0, 0.9647059, 1, 1,
-0.009762831, 1.419413, -2.05071, 0, 0.9568627, 1, 1,
-0.007591477, -1.674763, -2.941235, 0, 0.9529412, 1, 1,
-0.007102083, 0.1473821, -0.4812121, 0, 0.945098, 1, 1,
-0.004736759, -0.5743335, -3.165344, 0, 0.9411765, 1, 1,
-0.004216666, -0.09898253, -3.43684, 0, 0.9333333, 1, 1,
-0.003944153, -0.3936462, -4.867926, 0, 0.9294118, 1, 1,
-0.001174902, 1.84705, -0.9828339, 0, 0.9215686, 1, 1,
0.002642402, 0.6202715, 0.7067909, 0, 0.9176471, 1, 1,
0.003827734, 2.242689, -0.2416852, 0, 0.9098039, 1, 1,
0.00675683, -1.068948, 4.167413, 0, 0.9058824, 1, 1,
0.009945593, 0.4494514, -0.231296, 0, 0.8980392, 1, 1,
0.01436388, -0.564332, 4.646998, 0, 0.8901961, 1, 1,
0.01745742, 0.110497, 1.436478, 0, 0.8862745, 1, 1,
0.02129931, -1.346864, 2.586821, 0, 0.8784314, 1, 1,
0.02455239, -0.1664809, 2.892505, 0, 0.8745098, 1, 1,
0.02486593, -0.019662, 3.915731, 0, 0.8666667, 1, 1,
0.02492605, 0.4901336, -0.8469285, 0, 0.8627451, 1, 1,
0.03038818, 1.537937, 0.1654761, 0, 0.854902, 1, 1,
0.03395113, 0.3025752, -1.53923, 0, 0.8509804, 1, 1,
0.0365365, 0.2055543, 2.780261, 0, 0.8431373, 1, 1,
0.03735451, -0.03359911, 2.959641, 0, 0.8392157, 1, 1,
0.03785608, 1.232657, -2.255256, 0, 0.8313726, 1, 1,
0.04043275, 0.8057085, -0.2506723, 0, 0.827451, 1, 1,
0.04326979, -0.5903587, 3.369101, 0, 0.8196079, 1, 1,
0.04983677, -1.263515, 1.123492, 0, 0.8156863, 1, 1,
0.04994845, -1.648423, 4.32608, 0, 0.8078431, 1, 1,
0.06147174, -0.003654342, 2.499524, 0, 0.8039216, 1, 1,
0.06437209, -1.103332, 2.772941, 0, 0.7960784, 1, 1,
0.0720543, -0.1752722, 2.646381, 0, 0.7882353, 1, 1,
0.0728711, -1.24374, 3.064958, 0, 0.7843137, 1, 1,
0.07386444, 0.0296274, 1.421905, 0, 0.7764706, 1, 1,
0.07714026, -0.6671811, 3.855793, 0, 0.772549, 1, 1,
0.07795821, 0.6139151, 0.5746108, 0, 0.7647059, 1, 1,
0.07979386, -0.02571523, 0.8066846, 0, 0.7607843, 1, 1,
0.08028413, 0.1176753, 1.896619, 0, 0.7529412, 1, 1,
0.08184264, 0.7195657, -0.1528996, 0, 0.7490196, 1, 1,
0.08533498, -0.2331969, 2.986344, 0, 0.7411765, 1, 1,
0.0932685, -1.388788, 3.42778, 0, 0.7372549, 1, 1,
0.09453474, -1.376572, 3.729073, 0, 0.7294118, 1, 1,
0.09620488, -2.599435, 3.565198, 0, 0.7254902, 1, 1,
0.097369, 0.8181696, 1.424545, 0, 0.7176471, 1, 1,
0.09797122, 2.267084, 0.5556692, 0, 0.7137255, 1, 1,
0.09949747, -0.7514805, 4.474971, 0, 0.7058824, 1, 1,
0.1003966, -0.06906051, 1.983807, 0, 0.6980392, 1, 1,
0.1027124, -1.356779, 2.721085, 0, 0.6941177, 1, 1,
0.1028856, -1.163509, 4.423987, 0, 0.6862745, 1, 1,
0.1032771, -0.9168299, 2.361632, 0, 0.682353, 1, 1,
0.1058293, 0.7544408, -0.4521079, 0, 0.6745098, 1, 1,
0.1075648, 0.1625594, 1.822078, 0, 0.6705883, 1, 1,
0.1076802, 1.177528, 1.475734, 0, 0.6627451, 1, 1,
0.109201, -0.01313606, 2.191407, 0, 0.6588235, 1, 1,
0.1102104, -0.01395828, 1.461555, 0, 0.6509804, 1, 1,
0.1106959, -1.934818, 3.972941, 0, 0.6470588, 1, 1,
0.1123582, -1.965219, 3.158841, 0, 0.6392157, 1, 1,
0.1129, 0.09697434, 1.382209, 0, 0.6352941, 1, 1,
0.117501, 0.3359101, 2.171095, 0, 0.627451, 1, 1,
0.1179244, 1.150838, 0.07965698, 0, 0.6235294, 1, 1,
0.1212942, 1.600758, -1.505395, 0, 0.6156863, 1, 1,
0.1223431, -0.7976529, 3.705719, 0, 0.6117647, 1, 1,
0.1265625, 0.2566532, 0.9588251, 0, 0.6039216, 1, 1,
0.1306408, -0.2467727, 1.352777, 0, 0.5960785, 1, 1,
0.1317401, 0.5779431, 2.178714, 0, 0.5921569, 1, 1,
0.1327065, 1.027577, 1.345022, 0, 0.5843138, 1, 1,
0.1349309, -1.154017, 2.757753, 0, 0.5803922, 1, 1,
0.1356934, -1.103929, 2.74192, 0, 0.572549, 1, 1,
0.1399284, 0.9799348, -0.02796318, 0, 0.5686275, 1, 1,
0.1485542, 1.405194, 0.2997002, 0, 0.5607843, 1, 1,
0.1486987, 1.012803, -0.906367, 0, 0.5568628, 1, 1,
0.1495548, 0.603358, 0.6646376, 0, 0.5490196, 1, 1,
0.1540601, 1.641861, -0.4169339, 0, 0.5450981, 1, 1,
0.1656297, 0.4555382, -1.952697, 0, 0.5372549, 1, 1,
0.1709037, -2.170475, 4.061152, 0, 0.5333334, 1, 1,
0.1751692, 2.120753, 0.7727038, 0, 0.5254902, 1, 1,
0.1771034, -0.6797537, 2.464436, 0, 0.5215687, 1, 1,
0.1779819, 1.741059, -0.9589428, 0, 0.5137255, 1, 1,
0.1794773, 0.6183928, 1.215459, 0, 0.509804, 1, 1,
0.1796954, 0.09006429, 2.084251, 0, 0.5019608, 1, 1,
0.1821781, 0.6499827, 0.1727798, 0, 0.4941176, 1, 1,
0.18418, -0.4337183, 2.837198, 0, 0.4901961, 1, 1,
0.1876152, -0.2411936, 4.427851, 0, 0.4823529, 1, 1,
0.1896657, 1.731999, -1.823404, 0, 0.4784314, 1, 1,
0.1933951, 0.517499, 1.337232, 0, 0.4705882, 1, 1,
0.1982363, -0.6394172, 3.929957, 0, 0.4666667, 1, 1,
0.1989114, -2.124623, 5.510311, 0, 0.4588235, 1, 1,
0.1997226, -0.5426556, 3.877751, 0, 0.454902, 1, 1,
0.2057217, 0.1668732, 0.2084704, 0, 0.4470588, 1, 1,
0.2092109, -1.242167, 2.507396, 0, 0.4431373, 1, 1,
0.210485, -0.07476558, 1.506909, 0, 0.4352941, 1, 1,
0.211277, -0.7009797, 2.779977, 0, 0.4313726, 1, 1,
0.2149232, 0.7607893, 0.8586929, 0, 0.4235294, 1, 1,
0.2186833, 0.1573032, 1.441978, 0, 0.4196078, 1, 1,
0.2235032, 0.9990506, -0.3898517, 0, 0.4117647, 1, 1,
0.2302848, -1.218776, 3.58285, 0, 0.4078431, 1, 1,
0.2303358, 0.3183029, 1.023656, 0, 0.4, 1, 1,
0.2319754, 0.0835107, 1.624555, 0, 0.3921569, 1, 1,
0.2340949, -0.2357474, 3.063425, 0, 0.3882353, 1, 1,
0.2359277, 0.6499019, 0.05388646, 0, 0.3803922, 1, 1,
0.2396465, -0.55613, 0.8558084, 0, 0.3764706, 1, 1,
0.2447893, 0.3080248, 0.6645553, 0, 0.3686275, 1, 1,
0.2453048, 0.08750262, 1.394136, 0, 0.3647059, 1, 1,
0.2454351, -1.631703, 1.599812, 0, 0.3568628, 1, 1,
0.2496214, 0.1095164, 2.148988, 0, 0.3529412, 1, 1,
0.2536665, 0.844056, -1.575252, 0, 0.345098, 1, 1,
0.2576092, -0.4073547, 1.905602, 0, 0.3411765, 1, 1,
0.2605159, -1.766615, 3.607432, 0, 0.3333333, 1, 1,
0.2701792, 1.815784, 0.4235688, 0, 0.3294118, 1, 1,
0.2703931, -0.3851904, 1.561841, 0, 0.3215686, 1, 1,
0.2757284, -1.292904, 3.723597, 0, 0.3176471, 1, 1,
0.277132, -0.6189373, 2.137408, 0, 0.3098039, 1, 1,
0.28133, -0.8841212, 2.730828, 0, 0.3058824, 1, 1,
0.2823744, -0.9455771, 3.30511, 0, 0.2980392, 1, 1,
0.2833202, 0.2452251, 0.4255996, 0, 0.2901961, 1, 1,
0.2840305, 0.2293392, 1.963086, 0, 0.2862745, 1, 1,
0.2852327, 0.05684992, 2.184469, 0, 0.2784314, 1, 1,
0.2863401, -1.748621, 2.61551, 0, 0.2745098, 1, 1,
0.2885915, 0.8006431, 1.375999, 0, 0.2666667, 1, 1,
0.2907814, 0.3437025, -0.5072682, 0, 0.2627451, 1, 1,
0.2917145, 0.7073956, -0.4178166, 0, 0.254902, 1, 1,
0.2931126, -0.2353573, 2.379967, 0, 0.2509804, 1, 1,
0.3030959, -0.4976541, 3.260771, 0, 0.2431373, 1, 1,
0.3033966, -0.1627906, 2.286135, 0, 0.2392157, 1, 1,
0.3094313, -0.9536348, 4.068736, 0, 0.2313726, 1, 1,
0.3170702, 1.22738, 1.196647, 0, 0.227451, 1, 1,
0.3177855, 1.321771, -0.4703374, 0, 0.2196078, 1, 1,
0.3205107, -0.6378239, 2.123886, 0, 0.2156863, 1, 1,
0.321277, -0.07321997, 2.337861, 0, 0.2078431, 1, 1,
0.3231266, -0.2652416, 3.580023, 0, 0.2039216, 1, 1,
0.3254427, -1.318373, 4.773116, 0, 0.1960784, 1, 1,
0.3285933, -0.09117111, 0.5304722, 0, 0.1882353, 1, 1,
0.3335643, -0.2408684, 4.286476, 0, 0.1843137, 1, 1,
0.3348739, 1.005522, 1.516127, 0, 0.1764706, 1, 1,
0.3350872, -0.3551951, 2.806607, 0, 0.172549, 1, 1,
0.3374659, 0.4334642, 0.6997821, 0, 0.1647059, 1, 1,
0.3415821, -0.2788557, 2.276537, 0, 0.1607843, 1, 1,
0.3441069, 2.239023, 0.400893, 0, 0.1529412, 1, 1,
0.3481652, -2.631677, 3.367682, 0, 0.1490196, 1, 1,
0.3548229, -0.6592282, 2.952063, 0, 0.1411765, 1, 1,
0.3577538, -0.7306674, 3.687986, 0, 0.1372549, 1, 1,
0.3609947, -0.5384606, 2.84829, 0, 0.1294118, 1, 1,
0.3614574, -0.4131994, 3.233579, 0, 0.1254902, 1, 1,
0.3682716, -0.3153529, 1.718211, 0, 0.1176471, 1, 1,
0.3684176, 0.5126463, 0.3232046, 0, 0.1137255, 1, 1,
0.3684231, -0.354467, 1.696281, 0, 0.1058824, 1, 1,
0.3689033, -1.350546, 2.082444, 0, 0.09803922, 1, 1,
0.3695917, -0.2815268, 2.662929, 0, 0.09411765, 1, 1,
0.3705913, -1.589136, 3.23772, 0, 0.08627451, 1, 1,
0.3733179, -0.3295621, 3.4501, 0, 0.08235294, 1, 1,
0.3739828, -0.08076817, 0.8065357, 0, 0.07450981, 1, 1,
0.375511, 0.1580179, 0.7905477, 0, 0.07058824, 1, 1,
0.3762771, 1.61496, 1.341042, 0, 0.0627451, 1, 1,
0.3832217, -1.054266, 2.561898, 0, 0.05882353, 1, 1,
0.3854046, -0.005483231, 0.8176908, 0, 0.05098039, 1, 1,
0.3856217, -0.4181385, 1.741084, 0, 0.04705882, 1, 1,
0.3883063, 0.6264233, 2.608694, 0, 0.03921569, 1, 1,
0.3886653, -0.8247772, 2.950028, 0, 0.03529412, 1, 1,
0.3897719, 0.4305217, 1.409316, 0, 0.02745098, 1, 1,
0.3900806, -1.611438, 1.994625, 0, 0.02352941, 1, 1,
0.3977502, -0.1126374, 3.536209, 0, 0.01568628, 1, 1,
0.3985816, -0.1530273, 0.8857695, 0, 0.01176471, 1, 1,
0.4012298, 2.314195, 1.370678, 0, 0.003921569, 1, 1,
0.4029166, -0.6504126, 3.408096, 0.003921569, 0, 1, 1,
0.4074916, 1.839731, 0.3881209, 0.007843138, 0, 1, 1,
0.4105066, -0.4293236, 1.252971, 0.01568628, 0, 1, 1,
0.4108163, -0.449036, 2.353346, 0.01960784, 0, 1, 1,
0.4112896, 0.2216485, 0.430646, 0.02745098, 0, 1, 1,
0.412679, -0.1880459, 0.6346991, 0.03137255, 0, 1, 1,
0.4137589, -0.2501329, 1.56602, 0.03921569, 0, 1, 1,
0.4174695, -1.057637, 2.971233, 0.04313726, 0, 1, 1,
0.419502, -0.9780654, 3.100713, 0.05098039, 0, 1, 1,
0.4211944, -1.416764, 3.791451, 0.05490196, 0, 1, 1,
0.4212733, 0.5234936, 0.002150039, 0.0627451, 0, 1, 1,
0.4255382, 0.5721921, 2.461564, 0.06666667, 0, 1, 1,
0.4272445, 0.7336154, -0.3244121, 0.07450981, 0, 1, 1,
0.4341623, 0.9828627, 1.320513, 0.07843138, 0, 1, 1,
0.4361832, 0.7674968, -0.5003413, 0.08627451, 0, 1, 1,
0.4381501, -0.2119452, 1.851581, 0.09019608, 0, 1, 1,
0.4390876, -0.5492328, 1.851288, 0.09803922, 0, 1, 1,
0.4420473, -0.7996791, 0.9811022, 0.1058824, 0, 1, 1,
0.4448263, 3.275467, -0.6965154, 0.1098039, 0, 1, 1,
0.449257, 0.7535059, 0.2320617, 0.1176471, 0, 1, 1,
0.4508479, -1.50309, 3.734312, 0.1215686, 0, 1, 1,
0.4573563, 0.1560406, 1.628665, 0.1294118, 0, 1, 1,
0.4574313, -0.5248697, 0.9056639, 0.1333333, 0, 1, 1,
0.460684, -1.158453, 1.354447, 0.1411765, 0, 1, 1,
0.4715696, -2.653113, 2.894284, 0.145098, 0, 1, 1,
0.4720707, -1.132599, 3.347799, 0.1529412, 0, 1, 1,
0.4728884, 0.8081998, 1.472041, 0.1568628, 0, 1, 1,
0.4762329, -0.240625, 0.4864059, 0.1647059, 0, 1, 1,
0.4773858, -0.4476222, 1.711441, 0.1686275, 0, 1, 1,
0.4816585, -0.8993225, 3.369697, 0.1764706, 0, 1, 1,
0.4860114, 1.063804, 2.133604, 0.1803922, 0, 1, 1,
0.4870249, -2.036577, 3.513831, 0.1882353, 0, 1, 1,
0.4886714, -0.04771208, 0.9458569, 0.1921569, 0, 1, 1,
0.4933389, -1.24826, 2.91201, 0.2, 0, 1, 1,
0.4943565, -0.1742266, 1.875758, 0.2078431, 0, 1, 1,
0.4949435, 0.5669194, 2.678302, 0.2117647, 0, 1, 1,
0.4952744, 1.613506, -0.5037089, 0.2196078, 0, 1, 1,
0.5018817, 0.5362118, 1.563037, 0.2235294, 0, 1, 1,
0.5098193, 1.792339, -1.115807, 0.2313726, 0, 1, 1,
0.5098805, 0.4238505, 1.618812, 0.2352941, 0, 1, 1,
0.512023, 0.2111607, 0.3009517, 0.2431373, 0, 1, 1,
0.517053, 1.066723, 1.065567, 0.2470588, 0, 1, 1,
0.5190528, -1.795816, 1.710716, 0.254902, 0, 1, 1,
0.5224311, 0.7177768, 1.432171, 0.2588235, 0, 1, 1,
0.5287384, 0.4707558, -0.8545965, 0.2666667, 0, 1, 1,
0.5313325, -0.7303345, 2.05284, 0.2705882, 0, 1, 1,
0.5329288, -0.2740037, 2.097285, 0.2784314, 0, 1, 1,
0.5341614, 0.5772341, 1.158719, 0.282353, 0, 1, 1,
0.5349556, -1.108323, 3.916489, 0.2901961, 0, 1, 1,
0.5367118, 1.327503, -0.7289189, 0.2941177, 0, 1, 1,
0.5439427, 0.5668778, 0.6090663, 0.3019608, 0, 1, 1,
0.5447728, -1.00872, 3.945708, 0.3098039, 0, 1, 1,
0.5451723, 0.3728704, 1.110289, 0.3137255, 0, 1, 1,
0.5455334, -0.05089673, 0.7264224, 0.3215686, 0, 1, 1,
0.5460173, -1.486938, 2.844041, 0.3254902, 0, 1, 1,
0.5491968, 0.4309375, 2.201038, 0.3333333, 0, 1, 1,
0.5515732, -0.3731701, 1.887194, 0.3372549, 0, 1, 1,
0.5524562, 1.910407, 1.690368, 0.345098, 0, 1, 1,
0.5530582, 0.001276337, 2.609712, 0.3490196, 0, 1, 1,
0.5546407, 0.1110514, 1.43391, 0.3568628, 0, 1, 1,
0.5589809, -0.4869732, 1.300842, 0.3607843, 0, 1, 1,
0.5654137, 0.1434743, 2.714299, 0.3686275, 0, 1, 1,
0.5720203, -1.228788, 3.189178, 0.372549, 0, 1, 1,
0.5743913, -0.2315879, 3.385061, 0.3803922, 0, 1, 1,
0.5746203, -0.8521033, 2.429837, 0.3843137, 0, 1, 1,
0.5755181, 1.193095, 1.302245, 0.3921569, 0, 1, 1,
0.5794715, -0.7766538, 2.6086, 0.3960784, 0, 1, 1,
0.5845961, -1.61606, 3.75467, 0.4039216, 0, 1, 1,
0.585228, 1.458532, 0.8022351, 0.4117647, 0, 1, 1,
0.5961313, 2.109942, -0.5040202, 0.4156863, 0, 1, 1,
0.5965247, 0.1183496, 0.9282681, 0.4235294, 0, 1, 1,
0.59911, -0.7290818, 1.158253, 0.427451, 0, 1, 1,
0.6002832, -0.07080634, 2.581096, 0.4352941, 0, 1, 1,
0.604204, 0.8148025, -0.5143766, 0.4392157, 0, 1, 1,
0.6094633, 1.667967, 0.03290173, 0.4470588, 0, 1, 1,
0.6106508, -0.311348, 1.995465, 0.4509804, 0, 1, 1,
0.6223173, 0.05386472, -0.03198668, 0.4588235, 0, 1, 1,
0.6240407, -0.6620078, 2.290325, 0.4627451, 0, 1, 1,
0.6256736, 0.8914825, 0.9206126, 0.4705882, 0, 1, 1,
0.6264591, 0.1396011, 0.3810922, 0.4745098, 0, 1, 1,
0.6267021, 0.2351782, 0.4448409, 0.4823529, 0, 1, 1,
0.6272315, 0.3438879, 1.065693, 0.4862745, 0, 1, 1,
0.6276641, 0.2174075, 0.6802467, 0.4941176, 0, 1, 1,
0.6280218, 0.6655393, 1.61175, 0.5019608, 0, 1, 1,
0.6339292, 0.9331733, 0.3364188, 0.5058824, 0, 1, 1,
0.6343461, -0.7649203, 1.910449, 0.5137255, 0, 1, 1,
0.6349647, -0.2094678, 3.576243, 0.5176471, 0, 1, 1,
0.6361974, 0.9845105, 0.4698131, 0.5254902, 0, 1, 1,
0.6382617, -0.3620216, 1.581556, 0.5294118, 0, 1, 1,
0.6404777, 1.190803, 0.9778557, 0.5372549, 0, 1, 1,
0.642356, 1.392135, -0.5061697, 0.5411765, 0, 1, 1,
0.6429131, -0.2840754, 1.470098, 0.5490196, 0, 1, 1,
0.6461062, 0.827035, 1.322757, 0.5529412, 0, 1, 1,
0.656948, -0.685495, 1.044013, 0.5607843, 0, 1, 1,
0.6581026, -0.3713382, 2.528815, 0.5647059, 0, 1, 1,
0.660879, -0.7361478, 3.393521, 0.572549, 0, 1, 1,
0.6617643, -0.1065924, 1.783713, 0.5764706, 0, 1, 1,
0.6777318, 0.3737145, 1.839426, 0.5843138, 0, 1, 1,
0.6780713, 0.3279117, 1.052485, 0.5882353, 0, 1, 1,
0.6797792, 0.4822931, 0.5584127, 0.5960785, 0, 1, 1,
0.6849965, 0.9189819, 0.326912, 0.6039216, 0, 1, 1,
0.6854922, -0.1419832, 2.396064, 0.6078432, 0, 1, 1,
0.6894864, -1.040009, 2.414384, 0.6156863, 0, 1, 1,
0.6914458, 0.5081361, 0.4946748, 0.6196079, 0, 1, 1,
0.6948893, -1.462839, 2.93618, 0.627451, 0, 1, 1,
0.6954664, 1.058396, 0.4930395, 0.6313726, 0, 1, 1,
0.6977642, -1.437522, 1.491251, 0.6392157, 0, 1, 1,
0.7001486, 0.6011942, 1.649636, 0.6431373, 0, 1, 1,
0.7064927, 0.4974141, -0.2263218, 0.6509804, 0, 1, 1,
0.7083178, -0.6769953, 1.268536, 0.654902, 0, 1, 1,
0.7128051, 0.501651, 1.002461, 0.6627451, 0, 1, 1,
0.721383, 0.7817683, -0.06239287, 0.6666667, 0, 1, 1,
0.722953, -1.577241, 3.289814, 0.6745098, 0, 1, 1,
0.7262878, -0.8814282, 3.835867, 0.6784314, 0, 1, 1,
0.7382942, 0.2150251, 1.729768, 0.6862745, 0, 1, 1,
0.7424557, 1.291847, -1.56123, 0.6901961, 0, 1, 1,
0.7513267, -0.7226906, 2.700572, 0.6980392, 0, 1, 1,
0.7513941, -0.1910724, 0.8667867, 0.7058824, 0, 1, 1,
0.7695717, -0.0405171, 1.644495, 0.7098039, 0, 1, 1,
0.7703211, -0.3037659, 0.4978037, 0.7176471, 0, 1, 1,
0.7710661, -1.52311, 2.666619, 0.7215686, 0, 1, 1,
0.7770488, 1.383397, -0.9309491, 0.7294118, 0, 1, 1,
0.7791296, -0.01067937, 0.4997827, 0.7333333, 0, 1, 1,
0.7866694, 0.2921458, 2.095796, 0.7411765, 0, 1, 1,
0.8039306, -1.783661, 4.626166, 0.7450981, 0, 1, 1,
0.8048642, 1.05005, 1.789847, 0.7529412, 0, 1, 1,
0.8134326, -0.5854917, 1.0375, 0.7568628, 0, 1, 1,
0.816565, 0.469939, 0.1262287, 0.7647059, 0, 1, 1,
0.8191397, -0.5726678, 1.228562, 0.7686275, 0, 1, 1,
0.8216619, 1.678055, -0.6043882, 0.7764706, 0, 1, 1,
0.8243555, 0.1601353, 2.216454, 0.7803922, 0, 1, 1,
0.8251299, 1.909903, -0.2778972, 0.7882353, 0, 1, 1,
0.8265802, -0.7899534, 2.921689, 0.7921569, 0, 1, 1,
0.8298193, 1.018549, 0.8529618, 0.8, 0, 1, 1,
0.8320146, -0.865483, 1.236139, 0.8078431, 0, 1, 1,
0.8325738, -0.3168173, 0.1251719, 0.8117647, 0, 1, 1,
0.833357, 0.9773987, 0.5273752, 0.8196079, 0, 1, 1,
0.8341374, -0.03684266, 1.334541, 0.8235294, 0, 1, 1,
0.8387105, 0.5241784, 2.140684, 0.8313726, 0, 1, 1,
0.8409753, 3.06764, -1.244693, 0.8352941, 0, 1, 1,
0.8472927, -0.3187636, 2.208722, 0.8431373, 0, 1, 1,
0.8558985, 0.1798532, 1.93389, 0.8470588, 0, 1, 1,
0.8564959, 2.110321, 2.062521, 0.854902, 0, 1, 1,
0.8683739, -1.2412, 2.969969, 0.8588235, 0, 1, 1,
0.8796548, 0.9483159, 0.4429905, 0.8666667, 0, 1, 1,
0.8818007, 0.8129141, 1.232689, 0.8705882, 0, 1, 1,
0.8914286, -1.054945, 2.407431, 0.8784314, 0, 1, 1,
0.8930005, -1.417592, 2.590295, 0.8823529, 0, 1, 1,
0.8937017, 0.2812075, 0.6240497, 0.8901961, 0, 1, 1,
0.8937154, 0.0643254, -0.1397677, 0.8941177, 0, 1, 1,
0.8960573, -0.1525564, 3.140347, 0.9019608, 0, 1, 1,
0.9011905, 0.3857543, 2.365274, 0.9098039, 0, 1, 1,
0.9031496, 0.8517706, 0.1633414, 0.9137255, 0, 1, 1,
0.9080563, -1.219545, 2.360911, 0.9215686, 0, 1, 1,
0.910895, -0.3199927, 1.307309, 0.9254902, 0, 1, 1,
0.9200573, -0.656758, 0.4545154, 0.9333333, 0, 1, 1,
0.9279521, -0.7198362, 1.908322, 0.9372549, 0, 1, 1,
0.9315988, -0.7881386, 1.100027, 0.945098, 0, 1, 1,
0.936475, -0.1952198, 0.4358838, 0.9490196, 0, 1, 1,
0.938626, 1.007721, 0.07784292, 0.9568627, 0, 1, 1,
0.944737, -0.9118987, 4.236942, 0.9607843, 0, 1, 1,
0.9455236, -0.2054206, 1.763358, 0.9686275, 0, 1, 1,
0.9558088, -0.2879561, 2.518758, 0.972549, 0, 1, 1,
0.9558107, -0.0445251, 1.776483, 0.9803922, 0, 1, 1,
0.9579505, -0.7403294, 1.432558, 0.9843137, 0, 1, 1,
0.9580028, 0.457808, 1.278251, 0.9921569, 0, 1, 1,
0.9590191, -0.446822, -0.3266507, 0.9960784, 0, 1, 1,
0.9690701, 0.7115048, 0.1051386, 1, 0, 0.9960784, 1,
0.9796249, 0.7121681, 1.726968, 1, 0, 0.9882353, 1,
0.9886472, 1.288396, -0.8780802, 1, 0, 0.9843137, 1,
0.9952669, 1.446147, 3.184277, 1, 0, 0.9764706, 1,
0.9954424, -0.5915162, 2.879244, 1, 0, 0.972549, 1,
0.9962124, 0.2832281, 1.188272, 1, 0, 0.9647059, 1,
1.00628, 0.1472139, 1.260535, 1, 0, 0.9607843, 1,
1.01758, -1.049053, 1.699715, 1, 0, 0.9529412, 1,
1.019876, -0.4500413, 1.529407, 1, 0, 0.9490196, 1,
1.041006, 0.3345873, 0.7457212, 1, 0, 0.9411765, 1,
1.043646, -0.2639252, 2.485457, 1, 0, 0.9372549, 1,
1.043788, -1.079432, 1.603183, 1, 0, 0.9294118, 1,
1.046807, 0.309542, 1.700812, 1, 0, 0.9254902, 1,
1.055192, -0.5402719, 1.103732, 1, 0, 0.9176471, 1,
1.057653, -0.08957366, 1.971734, 1, 0, 0.9137255, 1,
1.059624, -1.804996, 4.789212, 1, 0, 0.9058824, 1,
1.06258, -0.5986902, 3.638477, 1, 0, 0.9019608, 1,
1.069934, -0.5205293, 3.968566, 1, 0, 0.8941177, 1,
1.073172, 2.25032, 0.6042901, 1, 0, 0.8862745, 1,
1.076289, 1.095334, -0.03077549, 1, 0, 0.8823529, 1,
1.08016, 0.09476469, 0.7293609, 1, 0, 0.8745098, 1,
1.085575, 1.429566, 1.306358, 1, 0, 0.8705882, 1,
1.102876, 1.978713, 1.658314, 1, 0, 0.8627451, 1,
1.105851, 0.558183, 0.772256, 1, 0, 0.8588235, 1,
1.116493, 0.6969503, 2.64867, 1, 0, 0.8509804, 1,
1.117669, 0.7462222, 2.545961, 1, 0, 0.8470588, 1,
1.118977, 0.3412459, 2.19439, 1, 0, 0.8392157, 1,
1.121165, -0.7954847, 3.007001, 1, 0, 0.8352941, 1,
1.124185, 0.7939522, 0.4799698, 1, 0, 0.827451, 1,
1.127042, -0.2982797, 1.425841, 1, 0, 0.8235294, 1,
1.131498, 0.5381652, 0.763317, 1, 0, 0.8156863, 1,
1.139605, -1.22369, 2.283536, 1, 0, 0.8117647, 1,
1.145484, 0.1547154, 2.543626, 1, 0, 0.8039216, 1,
1.149475, 0.4231158, 1.88772, 1, 0, 0.7960784, 1,
1.160601, -0.6116972, 4.410149, 1, 0, 0.7921569, 1,
1.160965, 0.09382775, 2.178628, 1, 0, 0.7843137, 1,
1.161456, 0.2657561, 0.2397873, 1, 0, 0.7803922, 1,
1.181541, -0.08801582, 2.92286, 1, 0, 0.772549, 1,
1.186011, 0.491861, -0.8488229, 1, 0, 0.7686275, 1,
1.187505, -1.874023, 3.669961, 1, 0, 0.7607843, 1,
1.188254, 0.4848109, 0.3918552, 1, 0, 0.7568628, 1,
1.197361, -0.2524707, 1.239869, 1, 0, 0.7490196, 1,
1.198305, 0.2756288, 2.156134, 1, 0, 0.7450981, 1,
1.212372, 0.06607663, 1.528561, 1, 0, 0.7372549, 1,
1.215513, 0.6778162, 1.42327, 1, 0, 0.7333333, 1,
1.218473, -0.02461194, 0.8853879, 1, 0, 0.7254902, 1,
1.223993, -1.053081, 2.232875, 1, 0, 0.7215686, 1,
1.229897, -1.448078, -0.2874018, 1, 0, 0.7137255, 1,
1.24118, -0.664315, 2.187577, 1, 0, 0.7098039, 1,
1.246271, 2.05082, 2.01206, 1, 0, 0.7019608, 1,
1.255859, 0.2343066, 1.027012, 1, 0, 0.6941177, 1,
1.258908, -0.9066694, 2.152723, 1, 0, 0.6901961, 1,
1.26226, -2.487545, 2.232962, 1, 0, 0.682353, 1,
1.264873, 0.4253044, 3.466142, 1, 0, 0.6784314, 1,
1.266841, 0.03255169, -0.2642954, 1, 0, 0.6705883, 1,
1.272241, -1.214227, 2.160432, 1, 0, 0.6666667, 1,
1.273727, 0.9204227, 0.05407489, 1, 0, 0.6588235, 1,
1.276528, 0.1488165, 2.24878, 1, 0, 0.654902, 1,
1.280873, 0.8256205, 0.5641524, 1, 0, 0.6470588, 1,
1.290202, -0.1752673, 0.7151884, 1, 0, 0.6431373, 1,
1.291893, -0.3573361, 0.9308714, 1, 0, 0.6352941, 1,
1.291984, 0.2070164, 0.4354117, 1, 0, 0.6313726, 1,
1.293523, -0.8997244, 3.080592, 1, 0, 0.6235294, 1,
1.294707, 1.556822, 0.6963224, 1, 0, 0.6196079, 1,
1.299835, 0.4051431, 0.5826997, 1, 0, 0.6117647, 1,
1.299946, -0.4491054, 0.1000252, 1, 0, 0.6078432, 1,
1.300235, -1.741851, 1.260406, 1, 0, 0.6, 1,
1.302467, -2.216156, 3.80886, 1, 0, 0.5921569, 1,
1.302971, -1.108391, 2.082066, 1, 0, 0.5882353, 1,
1.307517, 1.153097, -0.5147433, 1, 0, 0.5803922, 1,
1.308875, 1.160754, 1.941542, 1, 0, 0.5764706, 1,
1.311977, -1.745363, 2.329038, 1, 0, 0.5686275, 1,
1.313393, -0.09790004, 0.9982894, 1, 0, 0.5647059, 1,
1.329904, -0.303426, 2.537557, 1, 0, 0.5568628, 1,
1.33119, -0.3410774, 1.083632, 1, 0, 0.5529412, 1,
1.338024, 1.284537, 1.022961, 1, 0, 0.5450981, 1,
1.338583, 0.2456039, 0.07576836, 1, 0, 0.5411765, 1,
1.343859, -1.415106, 1.422165, 1, 0, 0.5333334, 1,
1.344915, 1.329062, 0.4160337, 1, 0, 0.5294118, 1,
1.35143, 0.7262989, 2.10457, 1, 0, 0.5215687, 1,
1.366837, 0.8291464, 0.2715647, 1, 0, 0.5176471, 1,
1.377862, -0.1445113, 3.162077, 1, 0, 0.509804, 1,
1.3836, 0.4750405, -0.7569245, 1, 0, 0.5058824, 1,
1.40023, 0.03437511, 0.6410232, 1, 0, 0.4980392, 1,
1.404588, -0.4501988, 1.640607, 1, 0, 0.4901961, 1,
1.405994, -0.7638257, 2.073937, 1, 0, 0.4862745, 1,
1.410909, -0.4135739, 0.3923885, 1, 0, 0.4784314, 1,
1.425732, 0.4860653, 1.605411, 1, 0, 0.4745098, 1,
1.426042, 1.06792, 0.2333532, 1, 0, 0.4666667, 1,
1.433668, -0.9079926, 0.1500488, 1, 0, 0.4627451, 1,
1.439535, -0.5050033, 3.863802, 1, 0, 0.454902, 1,
1.442968, 0.2574111, 0.7514226, 1, 0, 0.4509804, 1,
1.46054, -2.326929, 2.290296, 1, 0, 0.4431373, 1,
1.466607, 0.6268352, 0.6122501, 1, 0, 0.4392157, 1,
1.479608, 0.4370292, 0.4625017, 1, 0, 0.4313726, 1,
1.486264, -1.124279, 2.354657, 1, 0, 0.427451, 1,
1.495879, 1.170184, 0.5012256, 1, 0, 0.4196078, 1,
1.495946, 1.728169, 3.003144, 1, 0, 0.4156863, 1,
1.499739, 0.5830916, 1.246043, 1, 0, 0.4078431, 1,
1.516393, 0.1996764, 1.529236, 1, 0, 0.4039216, 1,
1.526029, -1.844652, 3.206288, 1, 0, 0.3960784, 1,
1.533278, -0.8919252, 1.571021, 1, 0, 0.3882353, 1,
1.540984, 0.5845906, 0.8756132, 1, 0, 0.3843137, 1,
1.54961, -1.273874, 1.405722, 1, 0, 0.3764706, 1,
1.552014, -1.449764, 2.095555, 1, 0, 0.372549, 1,
1.555564, 0.03017788, 3.135103, 1, 0, 0.3647059, 1,
1.570585, 0.4784272, 0.8061864, 1, 0, 0.3607843, 1,
1.571945, 1.81987, 1.611674, 1, 0, 0.3529412, 1,
1.584407, 0.2071689, 0.6866201, 1, 0, 0.3490196, 1,
1.604441, 0.9562044, 0.2301739, 1, 0, 0.3411765, 1,
1.611192, 0.4037124, 0.6909789, 1, 0, 0.3372549, 1,
1.615824, 0.1623705, 2.206072, 1, 0, 0.3294118, 1,
1.616063, 0.1763012, 2.193334, 1, 0, 0.3254902, 1,
1.625471, -0.1384941, 0.3914222, 1, 0, 0.3176471, 1,
1.645213, 0.05227158, 1.36891, 1, 0, 0.3137255, 1,
1.646183, -1.439007, 2.500556, 1, 0, 0.3058824, 1,
1.646873, 2.689329, 1.076425, 1, 0, 0.2980392, 1,
1.660938, 0.05364627, 2.042904, 1, 0, 0.2941177, 1,
1.668996, 0.3617982, 2.709958, 1, 0, 0.2862745, 1,
1.671029, 1.219899, -0.436857, 1, 0, 0.282353, 1,
1.673018, -0.1923956, 0.8207132, 1, 0, 0.2745098, 1,
1.683203, 0.5042114, 2.046079, 1, 0, 0.2705882, 1,
1.706435, -0.527372, 1.248023, 1, 0, 0.2627451, 1,
1.711941, -2.079819, 3.396715, 1, 0, 0.2588235, 1,
1.741113, 0.5519847, 0.5141742, 1, 0, 0.2509804, 1,
1.743543, 0.6019951, 2.242242, 1, 0, 0.2470588, 1,
1.747487, 1.839235, 1.873845, 1, 0, 0.2392157, 1,
1.754993, 0.4726986, 0.3553699, 1, 0, 0.2352941, 1,
1.762093, 0.2097131, 0.9231714, 1, 0, 0.227451, 1,
1.765187, -1.261564, 1.479599, 1, 0, 0.2235294, 1,
1.77176, 1.449521, -0.5365577, 1, 0, 0.2156863, 1,
1.777243, -1.811171, 2.267864, 1, 0, 0.2117647, 1,
1.805516, -0.6695282, 2.248428, 1, 0, 0.2039216, 1,
1.81765, 0.5118018, 1.808128, 1, 0, 0.1960784, 1,
1.827306, 1.340375, 0.5674409, 1, 0, 0.1921569, 1,
1.846341, -0.7438493, 0.4581207, 1, 0, 0.1843137, 1,
1.848682, 0.190289, 0.896566, 1, 0, 0.1803922, 1,
1.853832, 0.1984098, -0.8676232, 1, 0, 0.172549, 1,
1.860681, 1.208632, 1.29679, 1, 0, 0.1686275, 1,
1.866501, 0.2308307, 2.838088, 1, 0, 0.1607843, 1,
1.869573, 1.743768, 0.4708843, 1, 0, 0.1568628, 1,
1.874017, 0.4473278, -0.1545233, 1, 0, 0.1490196, 1,
1.909158, -0.6429346, 0.6947178, 1, 0, 0.145098, 1,
1.91694, -0.3318262, 3.148045, 1, 0, 0.1372549, 1,
1.926293, 0.9063284, 0.9612499, 1, 0, 0.1333333, 1,
1.937871, -0.7081234, 0.8553006, 1, 0, 0.1254902, 1,
1.940025, -1.224566, 1.697738, 1, 0, 0.1215686, 1,
1.947717, 1.117992, -0.9304541, 1, 0, 0.1137255, 1,
1.97207, -0.008492331, 1.010866, 1, 0, 0.1098039, 1,
1.976537, -0.6997301, 2.796835, 1, 0, 0.1019608, 1,
1.977517, 0.9592537, 1.058624, 1, 0, 0.09411765, 1,
1.983268, 0.4605426, -0.09885985, 1, 0, 0.09019608, 1,
1.988539, 0.4762695, 0.6944446, 1, 0, 0.08235294, 1,
2.002895, -0.1124207, 2.913333, 1, 0, 0.07843138, 1,
2.12073, 1.151495, 0.232748, 1, 0, 0.07058824, 1,
2.125597, 0.8551188, 1.031567, 1, 0, 0.06666667, 1,
2.12978, 0.05849022, -0.4634381, 1, 0, 0.05882353, 1,
2.133595, 0.2672213, 0.9509764, 1, 0, 0.05490196, 1,
2.185004, 0.5126811, 0.2333935, 1, 0, 0.04705882, 1,
2.310036, -1.097779, 1.272849, 1, 0, 0.04313726, 1,
2.483307, -0.4494367, 0.9071566, 1, 0, 0.03529412, 1,
2.508538, -2.016853, 1.477085, 1, 0, 0.03137255, 1,
2.520932, 0.3586751, -0.1575636, 1, 0, 0.02352941, 1,
2.684617, 0.298544, 1.731897, 1, 0, 0.01960784, 1,
2.787349, -1.990653, 3.416866, 1, 0, 0.01176471, 1,
2.795289, -0.8292835, 0.7197092, 1, 0, 0.007843138, 1
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
-0.2240945, -3.970846, -7.207882, 0, -0.5, 0.5, 0.5,
-0.2240945, -3.970846, -7.207882, 1, -0.5, 0.5, 0.5,
-0.2240945, -3.970846, -7.207882, 1, 1.5, 0.5, 0.5,
-0.2240945, -3.970846, -7.207882, 0, 1.5, 0.5, 0.5
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
-4.267049, 0.1774281, -7.207882, 0, -0.5, 0.5, 0.5,
-4.267049, 0.1774281, -7.207882, 1, -0.5, 0.5, 0.5,
-4.267049, 0.1774281, -7.207882, 1, 1.5, 0.5, 0.5,
-4.267049, 0.1774281, -7.207882, 0, 1.5, 0.5, 0.5
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
-4.267049, -3.970846, 0.07286167, 0, -0.5, 0.5, 0.5,
-4.267049, -3.970846, 0.07286167, 1, -0.5, 0.5, 0.5,
-4.267049, -3.970846, 0.07286167, 1, 1.5, 0.5, 0.5,
-4.267049, -3.970846, 0.07286167, 0, 1.5, 0.5, 0.5
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
-3, -3.013552, -5.527711,
2, -3.013552, -5.527711,
-3, -3.013552, -5.527711,
-3, -3.173101, -5.807739,
-2, -3.013552, -5.527711,
-2, -3.173101, -5.807739,
-1, -3.013552, -5.527711,
-1, -3.173101, -5.807739,
0, -3.013552, -5.527711,
0, -3.173101, -5.807739,
1, -3.013552, -5.527711,
1, -3.173101, -5.807739,
2, -3.013552, -5.527711,
2, -3.173101, -5.807739
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
"2"
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
-3, -3.492199, -6.367796, 0, -0.5, 0.5, 0.5,
-3, -3.492199, -6.367796, 1, -0.5, 0.5, 0.5,
-3, -3.492199, -6.367796, 1, 1.5, 0.5, 0.5,
-3, -3.492199, -6.367796, 0, 1.5, 0.5, 0.5,
-2, -3.492199, -6.367796, 0, -0.5, 0.5, 0.5,
-2, -3.492199, -6.367796, 1, -0.5, 0.5, 0.5,
-2, -3.492199, -6.367796, 1, 1.5, 0.5, 0.5,
-2, -3.492199, -6.367796, 0, 1.5, 0.5, 0.5,
-1, -3.492199, -6.367796, 0, -0.5, 0.5, 0.5,
-1, -3.492199, -6.367796, 1, -0.5, 0.5, 0.5,
-1, -3.492199, -6.367796, 1, 1.5, 0.5, 0.5,
-1, -3.492199, -6.367796, 0, 1.5, 0.5, 0.5,
0, -3.492199, -6.367796, 0, -0.5, 0.5, 0.5,
0, -3.492199, -6.367796, 1, -0.5, 0.5, 0.5,
0, -3.492199, -6.367796, 1, 1.5, 0.5, 0.5,
0, -3.492199, -6.367796, 0, 1.5, 0.5, 0.5,
1, -3.492199, -6.367796, 0, -0.5, 0.5, 0.5,
1, -3.492199, -6.367796, 1, -0.5, 0.5, 0.5,
1, -3.492199, -6.367796, 1, 1.5, 0.5, 0.5,
1, -3.492199, -6.367796, 0, 1.5, 0.5, 0.5,
2, -3.492199, -6.367796, 0, -0.5, 0.5, 0.5,
2, -3.492199, -6.367796, 1, -0.5, 0.5, 0.5,
2, -3.492199, -6.367796, 1, 1.5, 0.5, 0.5,
2, -3.492199, -6.367796, 0, 1.5, 0.5, 0.5
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
-3.33406, -2, -5.527711,
-3.33406, 3, -5.527711,
-3.33406, -2, -5.527711,
-3.489558, -2, -5.807739,
-3.33406, -1, -5.527711,
-3.489558, -1, -5.807739,
-3.33406, 0, -5.527711,
-3.489558, 0, -5.807739,
-3.33406, 1, -5.527711,
-3.489558, 1, -5.807739,
-3.33406, 2, -5.527711,
-3.489558, 2, -5.807739,
-3.33406, 3, -5.527711,
-3.489558, 3, -5.807739
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
-3.800555, -2, -6.367796, 0, -0.5, 0.5, 0.5,
-3.800555, -2, -6.367796, 1, -0.5, 0.5, 0.5,
-3.800555, -2, -6.367796, 1, 1.5, 0.5, 0.5,
-3.800555, -2, -6.367796, 0, 1.5, 0.5, 0.5,
-3.800555, -1, -6.367796, 0, -0.5, 0.5, 0.5,
-3.800555, -1, -6.367796, 1, -0.5, 0.5, 0.5,
-3.800555, -1, -6.367796, 1, 1.5, 0.5, 0.5,
-3.800555, -1, -6.367796, 0, 1.5, 0.5, 0.5,
-3.800555, 0, -6.367796, 0, -0.5, 0.5, 0.5,
-3.800555, 0, -6.367796, 1, -0.5, 0.5, 0.5,
-3.800555, 0, -6.367796, 1, 1.5, 0.5, 0.5,
-3.800555, 0, -6.367796, 0, 1.5, 0.5, 0.5,
-3.800555, 1, -6.367796, 0, -0.5, 0.5, 0.5,
-3.800555, 1, -6.367796, 1, -0.5, 0.5, 0.5,
-3.800555, 1, -6.367796, 1, 1.5, 0.5, 0.5,
-3.800555, 1, -6.367796, 0, 1.5, 0.5, 0.5,
-3.800555, 2, -6.367796, 0, -0.5, 0.5, 0.5,
-3.800555, 2, -6.367796, 1, -0.5, 0.5, 0.5,
-3.800555, 2, -6.367796, 1, 1.5, 0.5, 0.5,
-3.800555, 2, -6.367796, 0, 1.5, 0.5, 0.5,
-3.800555, 3, -6.367796, 0, -0.5, 0.5, 0.5,
-3.800555, 3, -6.367796, 1, -0.5, 0.5, 0.5,
-3.800555, 3, -6.367796, 1, 1.5, 0.5, 0.5,
-3.800555, 3, -6.367796, 0, 1.5, 0.5, 0.5
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
-3.33406, -3.013552, -4,
-3.33406, -3.013552, 4,
-3.33406, -3.013552, -4,
-3.489558, -3.173101, -4,
-3.33406, -3.013552, -2,
-3.489558, -3.173101, -2,
-3.33406, -3.013552, 0,
-3.489558, -3.173101, 0,
-3.33406, -3.013552, 2,
-3.489558, -3.173101, 2,
-3.33406, -3.013552, 4,
-3.489558, -3.173101, 4
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
-3.800555, -3.492199, -4, 0, -0.5, 0.5, 0.5,
-3.800555, -3.492199, -4, 1, -0.5, 0.5, 0.5,
-3.800555, -3.492199, -4, 1, 1.5, 0.5, 0.5,
-3.800555, -3.492199, -4, 0, 1.5, 0.5, 0.5,
-3.800555, -3.492199, -2, 0, -0.5, 0.5, 0.5,
-3.800555, -3.492199, -2, 1, -0.5, 0.5, 0.5,
-3.800555, -3.492199, -2, 1, 1.5, 0.5, 0.5,
-3.800555, -3.492199, -2, 0, 1.5, 0.5, 0.5,
-3.800555, -3.492199, 0, 0, -0.5, 0.5, 0.5,
-3.800555, -3.492199, 0, 1, -0.5, 0.5, 0.5,
-3.800555, -3.492199, 0, 1, 1.5, 0.5, 0.5,
-3.800555, -3.492199, 0, 0, 1.5, 0.5, 0.5,
-3.800555, -3.492199, 2, 0, -0.5, 0.5, 0.5,
-3.800555, -3.492199, 2, 1, -0.5, 0.5, 0.5,
-3.800555, -3.492199, 2, 1, 1.5, 0.5, 0.5,
-3.800555, -3.492199, 2, 0, 1.5, 0.5, 0.5,
-3.800555, -3.492199, 4, 0, -0.5, 0.5, 0.5,
-3.800555, -3.492199, 4, 1, -0.5, 0.5, 0.5,
-3.800555, -3.492199, 4, 1, 1.5, 0.5, 0.5,
-3.800555, -3.492199, 4, 0, 1.5, 0.5, 0.5
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
-3.33406, -3.013552, -5.527711,
-3.33406, 3.368408, -5.527711,
-3.33406, -3.013552, 5.673434,
-3.33406, 3.368408, 5.673434,
-3.33406, -3.013552, -5.527711,
-3.33406, -3.013552, 5.673434,
-3.33406, 3.368408, -5.527711,
-3.33406, 3.368408, 5.673434,
-3.33406, -3.013552, -5.527711,
2.885871, -3.013552, -5.527711,
-3.33406, -3.013552, 5.673434,
2.885871, -3.013552, 5.673434,
-3.33406, 3.368408, -5.527711,
2.885871, 3.368408, -5.527711,
-3.33406, 3.368408, 5.673434,
2.885871, 3.368408, 5.673434,
2.885871, -3.013552, -5.527711,
2.885871, 3.368408, -5.527711,
2.885871, -3.013552, 5.673434,
2.885871, 3.368408, 5.673434,
2.885871, -3.013552, -5.527711,
2.885871, -3.013552, 5.673434,
2.885871, 3.368408, -5.527711,
2.885871, 3.368408, 5.673434
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
var radius = 7.643249;
var distance = 34.00568;
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
mvMatrix.translate( 0.2240945, -0.1774281, -0.07286167 );
mvMatrix.scale( 1.328637, 1.294905, 0.7377844 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.00568);
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
Naproanilide<-read.table("Naproanilide.xyz")
```

```
## Error in read.table("Naproanilide.xyz"): no lines available in input
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
-3.243478, 0.6017746, -1.713264, 0, 0, 1, 1, 1,
-2.793999, 1.348866, 0.08215718, 1, 0, 0, 1, 1,
-2.62846, -1.375922, -4.275506, 1, 0, 0, 1, 1,
-2.538668, 0.831175, -0.5755649, 1, 0, 0, 1, 1,
-2.456081, -0.301819, -1.051568, 1, 0, 0, 1, 1,
-2.444774, 0.9978384, -0.3163023, 1, 0, 0, 1, 1,
-2.379054, 0.4522483, -0.7647699, 0, 0, 0, 1, 1,
-2.364088, -0.05898866, -1.17241, 0, 0, 0, 1, 1,
-2.358664, 0.3724743, -2.074249, 0, 0, 0, 1, 1,
-2.327389, -0.245756, -1.060324, 0, 0, 0, 1, 1,
-2.298763, -0.6369467, -1.897245, 0, 0, 0, 1, 1,
-2.29582, -0.0723956, -2.092211, 0, 0, 0, 1, 1,
-2.288107, -0.6657502, -0.5551692, 0, 0, 0, 1, 1,
-2.265698, 1.002364, -1.462006, 1, 1, 1, 1, 1,
-2.11943, -0.0768342, -1.855438, 1, 1, 1, 1, 1,
-2.080335, 0.3340958, -0.3457972, 1, 1, 1, 1, 1,
-2.075175, 1.464228, 0.04927277, 1, 1, 1, 1, 1,
-2.072911, 0.6736216, -0.9015732, 1, 1, 1, 1, 1,
-2.038585, -0.9627086, -2.635841, 1, 1, 1, 1, 1,
-2.006407, -0.5775637, -1.741322, 1, 1, 1, 1, 1,
-1.999597, -1.635767, -2.092904, 1, 1, 1, 1, 1,
-1.994417, -0.1296132, -0.5956549, 1, 1, 1, 1, 1,
-1.992397, -0.5434945, -1.466467, 1, 1, 1, 1, 1,
-1.991515, 1.550634, -1.500148, 1, 1, 1, 1, 1,
-1.990388, -0.2545498, -1.020867, 1, 1, 1, 1, 1,
-1.974506, 0.6354005, -2.979038, 1, 1, 1, 1, 1,
-1.969323, -1.312668, -3.121849, 1, 1, 1, 1, 1,
-1.963674, 0.2257868, 0.6565498, 1, 1, 1, 1, 1,
-1.926105, 0.3069622, -2.346609, 0, 0, 1, 1, 1,
-1.920409, -1.131144, -1.350861, 1, 0, 0, 1, 1,
-1.893658, -1.495547, -1.175708, 1, 0, 0, 1, 1,
-1.866901, 0.623364, -3.058471, 1, 0, 0, 1, 1,
-1.859126, -0.5302263, -2.671122, 1, 0, 0, 1, 1,
-1.831038, -0.2829658, -1.601164, 1, 0, 0, 1, 1,
-1.783809, -2.351994, -4.528953, 0, 0, 0, 1, 1,
-1.770142, -0.4080127, 0.6495507, 0, 0, 0, 1, 1,
-1.747695, -1.454545, -1.164253, 0, 0, 0, 1, 1,
-1.737873, 0.7591864, -0.3226604, 0, 0, 0, 1, 1,
-1.717316, -2.347659, -2.649313, 0, 0, 0, 1, 1,
-1.705615, 0.2762159, -2.638012, 0, 0, 0, 1, 1,
-1.695233, 1.376648, -0.2236937, 0, 0, 0, 1, 1,
-1.683977, -0.6140539, -1.849678, 1, 1, 1, 1, 1,
-1.679656, -1.189347, -2.450748, 1, 1, 1, 1, 1,
-1.672502, 0.5066277, -2.712092, 1, 1, 1, 1, 1,
-1.630953, -0.05069049, -0.05961432, 1, 1, 1, 1, 1,
-1.615364, -1.558889, -0.6476297, 1, 1, 1, 1, 1,
-1.596918, 0.4718272, -2.002284, 1, 1, 1, 1, 1,
-1.595638, 2.484984, 0.5162958, 1, 1, 1, 1, 1,
-1.582093, 0.1447398, -0.8710339, 1, 1, 1, 1, 1,
-1.58117, 0.4698634, -0.4070847, 1, 1, 1, 1, 1,
-1.578241, 0.4221842, -0.3048573, 1, 1, 1, 1, 1,
-1.568423, -0.08458453, -1.689833, 1, 1, 1, 1, 1,
-1.548441, -0.383772, -1.537014, 1, 1, 1, 1, 1,
-1.547876, -0.8672875, -1.249513, 1, 1, 1, 1, 1,
-1.545538, 0.3397245, -0.128123, 1, 1, 1, 1, 1,
-1.537374, 0.5686914, -2.125009, 1, 1, 1, 1, 1,
-1.523742, -0.2067188, -2.215247, 0, 0, 1, 1, 1,
-1.512825, -0.4396646, -3.0682, 1, 0, 0, 1, 1,
-1.50539, -0.369715, -1.858327, 1, 0, 0, 1, 1,
-1.483456, -0.4154809, -2.205904, 1, 0, 0, 1, 1,
-1.482834, -1.022905, -1.213244, 1, 0, 0, 1, 1,
-1.475776, 0.2984115, -1.180552, 1, 0, 0, 1, 1,
-1.474721, -0.7200903, -1.584274, 0, 0, 0, 1, 1,
-1.472459, 0.2391294, -1.711569, 0, 0, 0, 1, 1,
-1.470305, -1.928132, -1.471946, 0, 0, 0, 1, 1,
-1.470271, -1.522842, -2.147382, 0, 0, 0, 1, 1,
-1.456417, 1.245283, -0.162285, 0, 0, 0, 1, 1,
-1.451968, 0.6273271, -0.5287993, 0, 0, 0, 1, 1,
-1.436096, 1.658586, -1.219299, 0, 0, 0, 1, 1,
-1.425819, -1.74856, -3.125428, 1, 1, 1, 1, 1,
-1.425337, 0.7171732, 0.2747166, 1, 1, 1, 1, 1,
-1.422574, -0.332406, -2.577215, 1, 1, 1, 1, 1,
-1.416331, 1.572793, -0.2454351, 1, 1, 1, 1, 1,
-1.406704, 1.566885, 0.0723386, 1, 1, 1, 1, 1,
-1.403497, 0.2641151, -0.5336695, 1, 1, 1, 1, 1,
-1.398714, 0.6019825, -1.061929, 1, 1, 1, 1, 1,
-1.397976, 0.8328407, -2.96886, 1, 1, 1, 1, 1,
-1.389454, -1.12773, -3.73643, 1, 1, 1, 1, 1,
-1.384419, -1.511341, -2.461478, 1, 1, 1, 1, 1,
-1.380334, 0.3135445, -0.2427384, 1, 1, 1, 1, 1,
-1.378385, -0.5116352, -0.7231956, 1, 1, 1, 1, 1,
-1.376946, 0.9426528, -0.5215092, 1, 1, 1, 1, 1,
-1.373582, -0.4058739, -3.311184, 1, 1, 1, 1, 1,
-1.368182, -0.38602, -1.51152, 1, 1, 1, 1, 1,
-1.367914, 2.308893, -1.298362, 0, 0, 1, 1, 1,
-1.36709, 0.969142, -2.71117, 1, 0, 0, 1, 1,
-1.352054, -1.607536, -3.149231, 1, 0, 0, 1, 1,
-1.337048, 0.6321344, -1.569966, 1, 0, 0, 1, 1,
-1.336582, -1.760438, -2.700817, 1, 0, 0, 1, 1,
-1.333976, -0.07628743, -2.56671, 1, 0, 0, 1, 1,
-1.331297, -0.3588249, -1.408565, 0, 0, 0, 1, 1,
-1.324995, -1.695441, -1.958837, 0, 0, 0, 1, 1,
-1.321284, 0.8120895, -2.317486, 0, 0, 0, 1, 1,
-1.307417, 1.236374, 0.09883693, 0, 0, 0, 1, 1,
-1.305865, -0.02992484, -1.890473, 0, 0, 0, 1, 1,
-1.301536, -1.429151, -1.954694, 0, 0, 0, 1, 1,
-1.295831, 0.6485611, -0.427518, 0, 0, 0, 1, 1,
-1.294164, -0.1396386, -1.522224, 1, 1, 1, 1, 1,
-1.284618, 0.5779399, -0.4284903, 1, 1, 1, 1, 1,
-1.274328, 0.7736591, -1.461894, 1, 1, 1, 1, 1,
-1.270648, -0.1666819, -1.232661, 1, 1, 1, 1, 1,
-1.269762, -1.108899, -2.266752, 1, 1, 1, 1, 1,
-1.268725, 0.4709574, -0.75467, 1, 1, 1, 1, 1,
-1.265539, -0.5252019, -1.810335, 1, 1, 1, 1, 1,
-1.264724, -0.8421162, -3.771037, 1, 1, 1, 1, 1,
-1.261577, 0.5461301, 0.3627538, 1, 1, 1, 1, 1,
-1.260812, 0.7211679, -1.819187, 1, 1, 1, 1, 1,
-1.25483, -0.8599033, -1.484762, 1, 1, 1, 1, 1,
-1.251133, -0.8707501, -3.181056, 1, 1, 1, 1, 1,
-1.244385, 0.1639003, -2.688508, 1, 1, 1, 1, 1,
-1.236209, -0.01054105, -2.15941, 1, 1, 1, 1, 1,
-1.226483, 2.190386, -1.088655, 1, 1, 1, 1, 1,
-1.214438, -0.869033, -1.745551, 0, 0, 1, 1, 1,
-1.203699, 2.440899, -0.1340474, 1, 0, 0, 1, 1,
-1.202925, -0.6514238, -1.67758, 1, 0, 0, 1, 1,
-1.194779, 0.5829417, -1.83994, 1, 0, 0, 1, 1,
-1.192596, -1.562624, -2.698145, 1, 0, 0, 1, 1,
-1.189483, -1.08041, -3.117395, 1, 0, 0, 1, 1,
-1.18223, 0.4851931, -1.267627, 0, 0, 0, 1, 1,
-1.178999, 0.2657854, -3.351201, 0, 0, 0, 1, 1,
-1.164408, 0.2526698, 0.2638177, 0, 0, 0, 1, 1,
-1.16094, -0.05737982, -1.406834, 0, 0, 0, 1, 1,
-1.160732, 1.223174, -1.083364, 0, 0, 0, 1, 1,
-1.154557, -0.8684765, 0.3267595, 0, 0, 0, 1, 1,
-1.134975, -0.3399077, -0.5074981, 0, 0, 0, 1, 1,
-1.132404, 0.5805312, -1.899488, 1, 1, 1, 1, 1,
-1.130144, -2.2208, -2.568186, 1, 1, 1, 1, 1,
-1.127823, -1.461568, -3.122988, 1, 1, 1, 1, 1,
-1.125788, 0.7437355, 0.6175197, 1, 1, 1, 1, 1,
-1.123503, -0.7353908, -1.171505, 1, 1, 1, 1, 1,
-1.112413, -0.4567952, -2.44802, 1, 1, 1, 1, 1,
-1.098299, -1.68976, -0.4831441, 1, 1, 1, 1, 1,
-1.096821, -0.5291343, -2.59095, 1, 1, 1, 1, 1,
-1.093987, 0.8624558, -1.146324, 1, 1, 1, 1, 1,
-1.088657, -0.1206892, -1.538835, 1, 1, 1, 1, 1,
-1.086995, -0.4416149, -1.872254, 1, 1, 1, 1, 1,
-1.085176, -1.920339, -2.680933, 1, 1, 1, 1, 1,
-1.084724, -0.2863147, -1.62714, 1, 1, 1, 1, 1,
-1.067344, -0.02212813, -1.822499, 1, 1, 1, 1, 1,
-1.066647, 0.1532601, -2.108517, 1, 1, 1, 1, 1,
-1.061569, -2.392752, -3.812717, 0, 0, 1, 1, 1,
-1.061251, -1.505637, -3.359864, 1, 0, 0, 1, 1,
-1.057745, 1.152778, -0.8956462, 1, 0, 0, 1, 1,
-1.057494, -0.292484, -1.786834, 1, 0, 0, 1, 1,
-1.056879, -0.3831888, -2.28384, 1, 0, 0, 1, 1,
-1.056411, 1.022784, -1.341585, 1, 0, 0, 1, 1,
-1.050506, -1.009571, -1.87706, 0, 0, 0, 1, 1,
-1.046797, -0.4868954, -2.958661, 0, 0, 0, 1, 1,
-1.046764, 0.7531779, -0.3367162, 0, 0, 0, 1, 1,
-1.044542, -1.205681, -1.896946, 0, 0, 0, 1, 1,
-1.044356, -0.8712206, -2.753829, 0, 0, 0, 1, 1,
-1.037392, -1.079055, -2.842569, 0, 0, 0, 1, 1,
-1.023878, 0.6253716, 0.1564683, 0, 0, 0, 1, 1,
-1.021718, 0.01328756, -1.806321, 1, 1, 1, 1, 1,
-1.016071, -2.290442, -4.64134, 1, 1, 1, 1, 1,
-1.015622, 0.503448, -0.1547976, 1, 1, 1, 1, 1,
-1.015173, 0.7940789, -0.929824, 1, 1, 1, 1, 1,
-1.014296, 0.8723673, -0.943971, 1, 1, 1, 1, 1,
-1.013086, 1.524114, -1.534618, 1, 1, 1, 1, 1,
-1.012678, -0.8942058, -1.111595, 1, 1, 1, 1, 1,
-1.008609, 1.506655, -0.675335, 1, 1, 1, 1, 1,
-1.008039, -0.2516747, -2.73811, 1, 1, 1, 1, 1,
-1.006773, -1.465475, -3.043665, 1, 1, 1, 1, 1,
-0.9999804, -1.047142, -1.607934, 1, 1, 1, 1, 1,
-0.9998782, -0.339485, -2.948997, 1, 1, 1, 1, 1,
-0.9974304, 0.7422854, 1.034198, 1, 1, 1, 1, 1,
-0.992521, -0.142786, -2.332309, 1, 1, 1, 1, 1,
-0.9923025, 0.4622647, -1.223089, 1, 1, 1, 1, 1,
-0.9855031, 0.08188312, -0.8938091, 0, 0, 1, 1, 1,
-0.9839838, 0.611617, -0.473664, 1, 0, 0, 1, 1,
-0.9820985, 0.2091304, -0.6146101, 1, 0, 0, 1, 1,
-0.9819683, -0.05006276, -2.004662, 1, 0, 0, 1, 1,
-0.9735796, -0.2173494, -2.984339, 1, 0, 0, 1, 1,
-0.9688121, 0.00148416, -2.38146, 1, 0, 0, 1, 1,
-0.9677472, -0.8568121, -3.142646, 0, 0, 0, 1, 1,
-0.9672757, 0.8497432, 0.2641422, 0, 0, 0, 1, 1,
-0.964453, -0.05326706, -0.006506335, 0, 0, 0, 1, 1,
-0.9638576, 0.1468322, -0.7109166, 0, 0, 0, 1, 1,
-0.9444399, 0.3748597, 0.6421365, 0, 0, 0, 1, 1,
-0.9384485, -0.4622427, -2.047692, 0, 0, 0, 1, 1,
-0.937195, -0.6423705, -2.287272, 0, 0, 0, 1, 1,
-0.9271076, 0.1530746, -3.337456, 1, 1, 1, 1, 1,
-0.9235892, 2.883983, -0.2349094, 1, 1, 1, 1, 1,
-0.9179071, -0.9006484, -0.4608636, 1, 1, 1, 1, 1,
-0.9099222, -1.615515, -2.485362, 1, 1, 1, 1, 1,
-0.9041309, -1.269195, -1.812558, 1, 1, 1, 1, 1,
-0.9015203, -1.06899, -2.110891, 1, 1, 1, 1, 1,
-0.8973048, 1.820392, -0.07923861, 1, 1, 1, 1, 1,
-0.8947546, -0.1689092, 0.293262, 1, 1, 1, 1, 1,
-0.8943224, 1.069404, -1.207825, 1, 1, 1, 1, 1,
-0.8828281, 0.6729246, -0.8711971, 1, 1, 1, 1, 1,
-0.8813523, -1.084915, -4.11661, 1, 1, 1, 1, 1,
-0.8810167, 1.419093, -0.2290975, 1, 1, 1, 1, 1,
-0.8807857, -1.100075, -2.469391, 1, 1, 1, 1, 1,
-0.877627, -0.1059899, -4.005063, 1, 1, 1, 1, 1,
-0.8700343, 0.135821, -0.3210466, 1, 1, 1, 1, 1,
-0.8685853, -1.204156, -2.387459, 0, 0, 1, 1, 1,
-0.86707, 0.5118375, 0.2019397, 1, 0, 0, 1, 1,
-0.8667272, -0.5439869, -2.796595, 1, 0, 0, 1, 1,
-0.8619415, 1.434065, -0.9015492, 1, 0, 0, 1, 1,
-0.8589358, 0.8771262, -1.751206, 1, 0, 0, 1, 1,
-0.8524917, 2.121662, 0.637081, 1, 0, 0, 1, 1,
-0.8466616, 1.706983, 0.06963994, 0, 0, 0, 1, 1,
-0.8445963, -1.508428, -2.555871, 0, 0, 0, 1, 1,
-0.8443608, 0.02673742, -3.613605, 0, 0, 0, 1, 1,
-0.8391468, 0.7444319, -1.798894, 0, 0, 0, 1, 1,
-0.8387683, 0.6968139, -0.1783554, 0, 0, 0, 1, 1,
-0.8354234, -0.5706913, -2.238939, 0, 0, 0, 1, 1,
-0.8328462, 1.545001, 0.04699386, 0, 0, 0, 1, 1,
-0.8319886, 2.070281, -0.4253324, 1, 1, 1, 1, 1,
-0.8240077, 0.8220708, -0.2519217, 1, 1, 1, 1, 1,
-0.8197817, 0.2338151, -2.918909, 1, 1, 1, 1, 1,
-0.8088567, 1.337689, -0.5097002, 1, 1, 1, 1, 1,
-0.8076674, -0.1637497, -0.8501999, 1, 1, 1, 1, 1,
-0.802993, 0.4590057, 0.480969, 1, 1, 1, 1, 1,
-0.7941858, 1.448705, 0.287431, 1, 1, 1, 1, 1,
-0.7917329, 0.1601377, -1.638826, 1, 1, 1, 1, 1,
-0.7904373, 0.1453858, -2.446402, 1, 1, 1, 1, 1,
-0.7873766, 0.6971331, -0.1333781, 1, 1, 1, 1, 1,
-0.7853386, -0.0949482, -4.039704, 1, 1, 1, 1, 1,
-0.7838319, -0.111595, -0.7864454, 1, 1, 1, 1, 1,
-0.7825058, -0.09417464, -2.199607, 1, 1, 1, 1, 1,
-0.7747355, -0.1085055, -1.410111, 1, 1, 1, 1, 1,
-0.7725493, 2.728729, -0.02477573, 1, 1, 1, 1, 1,
-0.769057, 1.468758, -1.088371, 0, 0, 1, 1, 1,
-0.767468, -0.5253239, -2.620879, 1, 0, 0, 1, 1,
-0.7662084, 0.2442611, -2.446653, 1, 0, 0, 1, 1,
-0.7653494, 1.314516, 0.3514753, 1, 0, 0, 1, 1,
-0.7649897, 0.487558, 1.402324, 1, 0, 0, 1, 1,
-0.7639594, 0.5475849, -1.606867, 1, 0, 0, 1, 1,
-0.7622665, 1.439871, -1.217262, 0, 0, 0, 1, 1,
-0.7613201, -0.704941, -0.3703242, 0, 0, 0, 1, 1,
-0.7457975, -0.4222138, -0.8785285, 0, 0, 0, 1, 1,
-0.7404084, 2.078954, 0.7860823, 0, 0, 0, 1, 1,
-0.7370295, 1.794727, 1.683964, 0, 0, 0, 1, 1,
-0.7359917, 0.4090098, -1.303821, 0, 0, 0, 1, 1,
-0.7313238, -1.830951, -2.280021, 0, 0, 0, 1, 1,
-0.7270481, 0.3210805, -2.419231, 1, 1, 1, 1, 1,
-0.7252085, -1.650445, -2.835956, 1, 1, 1, 1, 1,
-0.7243217, 0.3863808, -2.042866, 1, 1, 1, 1, 1,
-0.7242821, 1.61583, -1.346523, 1, 1, 1, 1, 1,
-0.7211122, 1.243697, -1.589191, 1, 1, 1, 1, 1,
-0.7206959, -1.147817, -1.499529, 1, 1, 1, 1, 1,
-0.7093286, 0.6084933, 0.5572348, 1, 1, 1, 1, 1,
-0.6978002, 0.0240917, -3.463753, 1, 1, 1, 1, 1,
-0.6868961, 0.07881816, -1.81612, 1, 1, 1, 1, 1,
-0.6834201, 1.309339, -0.8360552, 1, 1, 1, 1, 1,
-0.6762761, 1.151028, -3.627229, 1, 1, 1, 1, 1,
-0.6757127, -0.1702843, -3.046904, 1, 1, 1, 1, 1,
-0.6711723, -1.072074, -3.08211, 1, 1, 1, 1, 1,
-0.6703505, 0.4623036, -0.8580605, 1, 1, 1, 1, 1,
-0.6666504, -0.615389, -0.8716904, 1, 1, 1, 1, 1,
-0.6663204, 1.64907, 0.3288732, 0, 0, 1, 1, 1,
-0.661716, 0.8815557, -0.6354043, 1, 0, 0, 1, 1,
-0.6596204, 0.6210096, -0.213678, 1, 0, 0, 1, 1,
-0.6585771, -0.1048612, -1.415087, 1, 0, 0, 1, 1,
-0.653438, -0.4771299, -1.333243, 1, 0, 0, 1, 1,
-0.6492226, -1.423812, -2.174188, 1, 0, 0, 1, 1,
-0.6444928, -0.3337361, -1.322504, 0, 0, 0, 1, 1,
-0.6437771, 0.240843, -1.657378, 0, 0, 0, 1, 1,
-0.6389864, -1.641343, -1.624528, 0, 0, 0, 1, 1,
-0.6378993, 0.7174773, -3.247892, 0, 0, 0, 1, 1,
-0.6369175, 0.4291322, -0.8230868, 0, 0, 0, 1, 1,
-0.6351112, -0.6094831, -3.786208, 0, 0, 0, 1, 1,
-0.6334828, 1.027264, -1.67461, 0, 0, 0, 1, 1,
-0.6295372, 1.743306, 0.3651457, 1, 1, 1, 1, 1,
-0.6249229, 0.1066255, -1.611975, 1, 1, 1, 1, 1,
-0.6241987, 0.05166388, -1.236714, 1, 1, 1, 1, 1,
-0.6235688, 1.744176, -1.111129, 1, 1, 1, 1, 1,
-0.6229512, -0.8723651, -1.755132, 1, 1, 1, 1, 1,
-0.6175465, -0.3696486, -1.511125, 1, 1, 1, 1, 1,
-0.6142879, 1.00143, 0.4293484, 1, 1, 1, 1, 1,
-0.6117185, -1.579307, -3.147588, 1, 1, 1, 1, 1,
-0.6095218, 0.8565664, 1.105725, 1, 1, 1, 1, 1,
-0.6044967, 1.488812, -0.6608253, 1, 1, 1, 1, 1,
-0.6011865, 0.07891325, -1.041212, 1, 1, 1, 1, 1,
-0.5937403, 1.266416, -1.029522, 1, 1, 1, 1, 1,
-0.589839, -0.3432972, -3.348129, 1, 1, 1, 1, 1,
-0.5894773, -1.237896, -1.73241, 1, 1, 1, 1, 1,
-0.5894511, -2.036513, -2.582169, 1, 1, 1, 1, 1,
-0.5887193, -0.4587303, -1.579419, 0, 0, 1, 1, 1,
-0.5860856, -0.94762, -2.273463, 1, 0, 0, 1, 1,
-0.5858266, -0.640195, -3.767401, 1, 0, 0, 1, 1,
-0.583694, 1.57628, -1.443895, 1, 0, 0, 1, 1,
-0.5808029, 0.1502833, -2.365834, 1, 0, 0, 1, 1,
-0.5802536, -0.1033728, -1.401789, 1, 0, 0, 1, 1,
-0.5792768, 0.6621024, 0.08868652, 0, 0, 0, 1, 1,
-0.5792631, 0.2792921, -1.88385, 0, 0, 0, 1, 1,
-0.5724931, -1.013063, -4.24363, 0, 0, 0, 1, 1,
-0.5709728, 0.8136506, -0.7114438, 0, 0, 0, 1, 1,
-0.5674673, -0.3910208, -3.123486, 0, 0, 0, 1, 1,
-0.5666133, 0.3342553, -1.225573, 0, 0, 0, 1, 1,
-0.5640686, 0.1185467, -3.356926, 0, 0, 0, 1, 1,
-0.5593781, 0.8086383, 0.1228107, 1, 1, 1, 1, 1,
-0.5577122, 0.05557052, -2.079068, 1, 1, 1, 1, 1,
-0.5492131, -1.398694, -2.738583, 1, 1, 1, 1, 1,
-0.54656, 1.677464, 0.2305455, 1, 1, 1, 1, 1,
-0.5426477, -0.4619862, -2.874928, 1, 1, 1, 1, 1,
-0.5413089, 1.942789, -0.2780519, 1, 1, 1, 1, 1,
-0.5397246, 0.8392864, -0.3833562, 1, 1, 1, 1, 1,
-0.5381724, -0.9603909, -2.615733, 1, 1, 1, 1, 1,
-0.532428, 0.39017, -1.508283, 1, 1, 1, 1, 1,
-0.5249731, 0.9210206, -0.4690318, 1, 1, 1, 1, 1,
-0.5206829, 1.594751, -2.580467, 1, 1, 1, 1, 1,
-0.5197092, 0.3134242, -1.27395, 1, 1, 1, 1, 1,
-0.5191137, 0.8175862, -0.009963426, 1, 1, 1, 1, 1,
-0.5141608, -0.1332274, -3.113323, 1, 1, 1, 1, 1,
-0.5046722, 0.3582196, 1.306862, 1, 1, 1, 1, 1,
-0.5039431, 1.334598, 0.3789528, 0, 0, 1, 1, 1,
-0.5034279, 1.081692, -1.592567, 1, 0, 0, 1, 1,
-0.5030605, 0.6224838, -1.692837, 1, 0, 0, 1, 1,
-0.5009053, -1.249242, -2.200712, 1, 0, 0, 1, 1,
-0.497512, -0.4951384, -4.176449, 1, 0, 0, 1, 1,
-0.4941941, 0.5285168, -0.9773573, 1, 0, 0, 1, 1,
-0.4894013, -0.1420144, -3.703336, 0, 0, 0, 1, 1,
-0.4858017, -0.2170195, -1.328285, 0, 0, 0, 1, 1,
-0.4851811, -2.038786, -2.590443, 0, 0, 0, 1, 1,
-0.4850754, -2.706856, -2.913904, 0, 0, 0, 1, 1,
-0.4846987, 1.004556, 0.5371428, 0, 0, 0, 1, 1,
-0.4830129, 0.07710302, -0.0187821, 0, 0, 0, 1, 1,
-0.4797474, 1.048849, -2.097542, 0, 0, 0, 1, 1,
-0.4785964, -0.5550163, -3.156667, 1, 1, 1, 1, 1,
-0.4780834, -1.493198, -4.386191, 1, 1, 1, 1, 1,
-0.4745003, 0.3238832, -1.817351, 1, 1, 1, 1, 1,
-0.474164, 0.393458, -1.712456, 1, 1, 1, 1, 1,
-0.4732418, -1.14155, -4.693132, 1, 1, 1, 1, 1,
-0.4720471, 0.03818132, -0.705304, 1, 1, 1, 1, 1,
-0.4714278, -0.9351976, -2.585756, 1, 1, 1, 1, 1,
-0.4698953, 1.303608, 0.03959728, 1, 1, 1, 1, 1,
-0.4692819, -1.792595, -2.358668, 1, 1, 1, 1, 1,
-0.4669712, 0.9197375, 0.5718797, 1, 1, 1, 1, 1,
-0.4647311, 0.9828818, -0.6784619, 1, 1, 1, 1, 1,
-0.461366, -1.16242, -1.793086, 1, 1, 1, 1, 1,
-0.4542795, -0.4701337, -1.930525, 1, 1, 1, 1, 1,
-0.4531082, 2.012213, 0.6633195, 1, 1, 1, 1, 1,
-0.4518114, 0.3648948, -0.3142837, 1, 1, 1, 1, 1,
-0.4512965, 1.30727, -2.115437, 0, 0, 1, 1, 1,
-0.4509538, 0.7358722, -0.4729196, 1, 0, 0, 1, 1,
-0.4452711, 0.3269373, -0.2570677, 1, 0, 0, 1, 1,
-0.4448154, 0.7200295, -0.7230169, 1, 0, 0, 1, 1,
-0.4439328, -2.920611, -3.19, 1, 0, 0, 1, 1,
-0.4352601, -1.223583, -2.735484, 1, 0, 0, 1, 1,
-0.4290888, 0.4925366, -2.121428, 0, 0, 0, 1, 1,
-0.428365, 0.5802106, -1.14652, 0, 0, 0, 1, 1,
-0.4189973, -0.2443912, -1.340332, 0, 0, 0, 1, 1,
-0.4074457, -0.5989199, -4.48028, 0, 0, 0, 1, 1,
-0.4052505, -0.1624064, -3.062827, 0, 0, 0, 1, 1,
-0.4050202, 0.06641235, -3.062352, 0, 0, 0, 1, 1,
-0.4047343, 0.0598139, -2.645416, 0, 0, 0, 1, 1,
-0.4037637, -0.7078038, -4.528907, 1, 1, 1, 1, 1,
-0.4022381, -0.2750695, -1.245733, 1, 1, 1, 1, 1,
-0.4013316, 1.350165, 1.20473, 1, 1, 1, 1, 1,
-0.4012482, 0.4430304, -1.869653, 1, 1, 1, 1, 1,
-0.3986513, 0.3330419, -2.093259, 1, 1, 1, 1, 1,
-0.3972092, 0.3338996, -2.244098, 1, 1, 1, 1, 1,
-0.3971235, 2.250024, 0.4035832, 1, 1, 1, 1, 1,
-0.3861163, 0.3773098, 1.183016, 1, 1, 1, 1, 1,
-0.3825829, 0.2220086, 0.3662798, 1, 1, 1, 1, 1,
-0.3722211, 1.57538, 0.2504116, 1, 1, 1, 1, 1,
-0.3700419, -0.1472067, -1.755104, 1, 1, 1, 1, 1,
-0.3681625, -0.2769057, -1.84091, 1, 1, 1, 1, 1,
-0.3636975, -0.8099229, -2.394976, 1, 1, 1, 1, 1,
-0.3621505, -2.328837, -2.268354, 1, 1, 1, 1, 1,
-0.3604571, 0.2792787, -1.231005, 1, 1, 1, 1, 1,
-0.3598812, 0.286624, -0.8731361, 0, 0, 1, 1, 1,
-0.3587891, -0.2157889, 0.04742339, 1, 0, 0, 1, 1,
-0.358417, -0.2275064, -1.714945, 1, 0, 0, 1, 1,
-0.3583681, -0.7467164, -2.101583, 1, 0, 0, 1, 1,
-0.3578852, 0.2604084, -0.03888672, 1, 0, 0, 1, 1,
-0.3509039, -0.5017386, -3.34601, 1, 0, 0, 1, 1,
-0.3493999, -0.4187859, -4.427639, 0, 0, 0, 1, 1,
-0.3482666, 1.222845, -0.8782765, 0, 0, 0, 1, 1,
-0.3462757, 0.4122403, -0.2058234, 0, 0, 0, 1, 1,
-0.3433133, -0.6932068, -1.792179, 0, 0, 0, 1, 1,
-0.3428656, 0.01523859, -2.27273, 0, 0, 0, 1, 1,
-0.3423655, -0.6197266, -1.664211, 0, 0, 0, 1, 1,
-0.3410628, -0.4690805, -2.836221, 0, 0, 0, 1, 1,
-0.3316028, 0.5360065, 0.3013583, 1, 1, 1, 1, 1,
-0.32855, 0.9098614, 0.4547763, 1, 1, 1, 1, 1,
-0.3271372, -0.058133, -1.976372, 1, 1, 1, 1, 1,
-0.323217, -1.234179, -3.062257, 1, 1, 1, 1, 1,
-0.3218482, 2.02388, 0.9410648, 1, 1, 1, 1, 1,
-0.3218242, 2.997988, -0.6103994, 1, 1, 1, 1, 1,
-0.3211708, 1.40489, 1.419519, 1, 1, 1, 1, 1,
-0.3176255, -2.044305, -1.993935, 1, 1, 1, 1, 1,
-0.3116201, -0.3508906, -3.099183, 1, 1, 1, 1, 1,
-0.3112777, -0.8599286, -3.463404, 1, 1, 1, 1, 1,
-0.3025074, -1.274596, -1.762373, 1, 1, 1, 1, 1,
-0.3017206, -0.2091949, -1.255534, 1, 1, 1, 1, 1,
-0.2999055, -1.512736, -2.323691, 1, 1, 1, 1, 1,
-0.2981775, 0.4113393, -0.9038545, 1, 1, 1, 1, 1,
-0.2950054, 0.6348963, 0.8799245, 1, 1, 1, 1, 1,
-0.2922418, -0.936445, -2.210342, 0, 0, 1, 1, 1,
-0.2916239, -1.471196, -5.364587, 1, 0, 0, 1, 1,
-0.2915275, -0.2556316, -2.444556, 1, 0, 0, 1, 1,
-0.2897513, 1.076878, -1.171299, 1, 0, 0, 1, 1,
-0.2882146, 0.8518548, -1.264204, 1, 0, 0, 1, 1,
-0.2855733, -0.9561425, -2.57545, 1, 0, 0, 1, 1,
-0.2715226, 0.3245889, 0.6732619, 0, 0, 0, 1, 1,
-0.2671094, 1.411099, -0.6841774, 0, 0, 0, 1, 1,
-0.2654293, -0.8243276, -4.137762, 0, 0, 0, 1, 1,
-0.2615653, 0.4978072, -0.9188347, 0, 0, 0, 1, 1,
-0.2592464, -0.4547586, -3.414907, 0, 0, 0, 1, 1,
-0.2561785, 0.5225203, 0.06461905, 0, 0, 0, 1, 1,
-0.2536333, 0.3873827, -2.176666, 0, 0, 0, 1, 1,
-0.2477273, -1.172441, -2.066098, 1, 1, 1, 1, 1,
-0.2475708, -0.6276081, -2.041271, 1, 1, 1, 1, 1,
-0.245294, 1.18201, -1.580174, 1, 1, 1, 1, 1,
-0.2420994, 0.8329331, -1.362242, 1, 1, 1, 1, 1,
-0.2420561, 1.246741, 1.467215, 1, 1, 1, 1, 1,
-0.2406808, -0.03225707, -0.2680191, 1, 1, 1, 1, 1,
-0.2404921, 0.4017926, 0.6244556, 1, 1, 1, 1, 1,
-0.2376995, -0.8025882, -3.533011, 1, 1, 1, 1, 1,
-0.2374313, 0.7114799, -0.9220024, 1, 1, 1, 1, 1,
-0.2320352, 1.281361, -0.0490474, 1, 1, 1, 1, 1,
-0.2284837, 0.1902784, -0.127066, 1, 1, 1, 1, 1,
-0.2280173, -0.6669669, -4.199244, 1, 1, 1, 1, 1,
-0.2257412, -0.4515931, -3.582846, 1, 1, 1, 1, 1,
-0.2252284, -0.2642695, -2.423499, 1, 1, 1, 1, 1,
-0.2237291, 1.25182, 0.3802151, 1, 1, 1, 1, 1,
-0.2234959, 0.00300944, -1.960299, 0, 0, 1, 1, 1,
-0.2224269, -0.09744106, -0.6922356, 1, 0, 0, 1, 1,
-0.2213775, 0.6893981, -1.34219, 1, 0, 0, 1, 1,
-0.2213666, -0.1172321, -1.773597, 1, 0, 0, 1, 1,
-0.2151604, 1.586769, -0.2064266, 1, 0, 0, 1, 1,
-0.2129068, 0.5854525, 0.5852014, 1, 0, 0, 1, 1,
-0.2123641, -0.5755039, -4.218649, 0, 0, 0, 1, 1,
-0.2021128, 1.029024, -0.5224832, 0, 0, 0, 1, 1,
-0.1981292, 0.47002, -1.186403, 0, 0, 0, 1, 1,
-0.1969359, -0.9124759, -4.352163, 0, 0, 0, 1, 1,
-0.1948612, -0.7222499, -0.3413112, 0, 0, 0, 1, 1,
-0.1917402, -0.8177672, -3.747244, 0, 0, 0, 1, 1,
-0.1899326, -1.567108, -1.343298, 0, 0, 0, 1, 1,
-0.1824879, 1.152295, -0.1498009, 1, 1, 1, 1, 1,
-0.1808147, -0.5267335, -2.98109, 1, 1, 1, 1, 1,
-0.1807506, -0.1054617, -0.9127307, 1, 1, 1, 1, 1,
-0.1776426, -0.8278647, -4.460932, 1, 1, 1, 1, 1,
-0.1766264, -0.5539776, -1.631453, 1, 1, 1, 1, 1,
-0.1712237, -1.633274, -1.164035, 1, 1, 1, 1, 1,
-0.1702575, -1.922385, -3.696262, 1, 1, 1, 1, 1,
-0.1661198, -0.311981, -2.347577, 1, 1, 1, 1, 1,
-0.1657761, -0.01455517, -2.390343, 1, 1, 1, 1, 1,
-0.1656963, -0.4594649, -2.777797, 1, 1, 1, 1, 1,
-0.1631685, 1.373651, 0.7230752, 1, 1, 1, 1, 1,
-0.1626333, -0.07696214, -1.518134, 1, 1, 1, 1, 1,
-0.1600525, -1.983172, -2.672696, 1, 1, 1, 1, 1,
-0.1546354, 0.1529769, -0.005759609, 1, 1, 1, 1, 1,
-0.152353, 1.599131, -0.7775552, 1, 1, 1, 1, 1,
-0.1509999, 0.2648614, 1.021193, 0, 0, 1, 1, 1,
-0.1501199, 0.3916158, -2.43138, 1, 0, 0, 1, 1,
-0.1470582, -1.046595, -3.109887, 1, 0, 0, 1, 1,
-0.1458953, -0.02416596, -4.30948, 1, 0, 0, 1, 1,
-0.1447818, -0.2201442, -2.359572, 1, 0, 0, 1, 1,
-0.1415949, -1.495794, -3.038859, 1, 0, 0, 1, 1,
-0.1408521, -0.2007461, -1.601598, 0, 0, 0, 1, 1,
-0.136954, -0.1338331, -1.387427, 0, 0, 0, 1, 1,
-0.1335706, -0.7128499, -2.562503, 0, 0, 0, 1, 1,
-0.1300848, -1.563692, -1.244198, 0, 0, 0, 1, 1,
-0.1287456, -1.00166, -3.046381, 0, 0, 0, 1, 1,
-0.1246156, -0.3385406, -5.132329, 0, 0, 0, 1, 1,
-0.1233782, -0.04190874, -2.164983, 0, 0, 0, 1, 1,
-0.1220699, -1.182756, -2.35948, 1, 1, 1, 1, 1,
-0.1212108, 1.525231, 1.581032, 1, 1, 1, 1, 1,
-0.1207252, -2.037488, -3.64721, 1, 1, 1, 1, 1,
-0.1205164, 0.9443157, 0.875391, 1, 1, 1, 1, 1,
-0.1174379, -0.2943901, -0.7987103, 1, 1, 1, 1, 1,
-0.1169333, -0.03607303, -1.501556, 1, 1, 1, 1, 1,
-0.1169301, -0.4930493, -3.330673, 1, 1, 1, 1, 1,
-0.1141833, -0.4345105, -1.141133, 1, 1, 1, 1, 1,
-0.1133669, 0.1508526, -3.607343, 1, 1, 1, 1, 1,
-0.106101, -0.7634507, -4.471097, 1, 1, 1, 1, 1,
-0.1035596, -0.4553048, -3.178456, 1, 1, 1, 1, 1,
-0.102544, -0.4729418, -1.079491, 1, 1, 1, 1, 1,
-0.1012855, 0.01118227, -1.566209, 1, 1, 1, 1, 1,
-0.1004049, 0.8309971, -1.258256, 1, 1, 1, 1, 1,
-0.09180985, -0.786445, -1.953024, 1, 1, 1, 1, 1,
-0.08988293, -1.861587, -2.826327, 0, 0, 1, 1, 1,
-0.08860573, -0.09865957, -3.634668, 1, 0, 0, 1, 1,
-0.0833076, 0.1860037, -0.5764134, 1, 0, 0, 1, 1,
-0.08195769, -0.4833713, -2.858725, 1, 0, 0, 1, 1,
-0.08081166, 0.8363416, 0.8550976, 1, 0, 0, 1, 1,
-0.07770057, -0.6188973, -4.655628, 1, 0, 0, 1, 1,
-0.07719506, -1.442925, -3.748893, 0, 0, 0, 1, 1,
-0.07461247, 1.874063, -1.112353, 0, 0, 0, 1, 1,
-0.07424053, -0.9984785, -3.113469, 0, 0, 0, 1, 1,
-0.07310755, -1.8676, -3.307968, 0, 0, 0, 1, 1,
-0.06926788, 0.4373537, 0.3367898, 0, 0, 0, 1, 1,
-0.06592781, -1.764972, -2.550577, 0, 0, 0, 1, 1,
-0.06483421, 0.3566444, 0.434539, 0, 0, 0, 1, 1,
-0.06345727, 1.401054, -0.3978453, 1, 1, 1, 1, 1,
-0.06251723, -2.083032, -3.401116, 1, 1, 1, 1, 1,
-0.06250071, -0.07106209, -3.426316, 1, 1, 1, 1, 1,
-0.06182944, -0.139675, -3.351631, 1, 1, 1, 1, 1,
-0.06040331, -0.1921944, -3.380825, 1, 1, 1, 1, 1,
-0.05912488, -1.314122, -4.202127, 1, 1, 1, 1, 1,
-0.05382968, -0.5105677, -2.167997, 1, 1, 1, 1, 1,
-0.05109103, 1.386828, 0.3873766, 1, 1, 1, 1, 1,
-0.04090353, -1.345764, -3.648482, 1, 1, 1, 1, 1,
-0.03806498, 0.2945025, -1.510188, 1, 1, 1, 1, 1,
-0.0337812, 0.6694826, 0.1138781, 1, 1, 1, 1, 1,
-0.03326149, -1.014214, -3.3386, 1, 1, 1, 1, 1,
-0.03118709, 0.266402, -0.7139706, 1, 1, 1, 1, 1,
-0.02956597, 1.424585, 0.7393886, 1, 1, 1, 1, 1,
-0.02907416, -0.5552052, -3.918968, 1, 1, 1, 1, 1,
-0.0237605, 1.038622, -1.63249, 0, 0, 1, 1, 1,
-0.02262589, 1.716488, 1.152167, 1, 0, 0, 1, 1,
-0.01085421, 0.0516833, -2.834883, 1, 0, 0, 1, 1,
-0.009762831, 1.419413, -2.05071, 1, 0, 0, 1, 1,
-0.007591477, -1.674763, -2.941235, 1, 0, 0, 1, 1,
-0.007102083, 0.1473821, -0.4812121, 1, 0, 0, 1, 1,
-0.004736759, -0.5743335, -3.165344, 0, 0, 0, 1, 1,
-0.004216666, -0.09898253, -3.43684, 0, 0, 0, 1, 1,
-0.003944153, -0.3936462, -4.867926, 0, 0, 0, 1, 1,
-0.001174902, 1.84705, -0.9828339, 0, 0, 0, 1, 1,
0.002642402, 0.6202715, 0.7067909, 0, 0, 0, 1, 1,
0.003827734, 2.242689, -0.2416852, 0, 0, 0, 1, 1,
0.00675683, -1.068948, 4.167413, 0, 0, 0, 1, 1,
0.009945593, 0.4494514, -0.231296, 1, 1, 1, 1, 1,
0.01436388, -0.564332, 4.646998, 1, 1, 1, 1, 1,
0.01745742, 0.110497, 1.436478, 1, 1, 1, 1, 1,
0.02129931, -1.346864, 2.586821, 1, 1, 1, 1, 1,
0.02455239, -0.1664809, 2.892505, 1, 1, 1, 1, 1,
0.02486593, -0.019662, 3.915731, 1, 1, 1, 1, 1,
0.02492605, 0.4901336, -0.8469285, 1, 1, 1, 1, 1,
0.03038818, 1.537937, 0.1654761, 1, 1, 1, 1, 1,
0.03395113, 0.3025752, -1.53923, 1, 1, 1, 1, 1,
0.0365365, 0.2055543, 2.780261, 1, 1, 1, 1, 1,
0.03735451, -0.03359911, 2.959641, 1, 1, 1, 1, 1,
0.03785608, 1.232657, -2.255256, 1, 1, 1, 1, 1,
0.04043275, 0.8057085, -0.2506723, 1, 1, 1, 1, 1,
0.04326979, -0.5903587, 3.369101, 1, 1, 1, 1, 1,
0.04983677, -1.263515, 1.123492, 1, 1, 1, 1, 1,
0.04994845, -1.648423, 4.32608, 0, 0, 1, 1, 1,
0.06147174, -0.003654342, 2.499524, 1, 0, 0, 1, 1,
0.06437209, -1.103332, 2.772941, 1, 0, 0, 1, 1,
0.0720543, -0.1752722, 2.646381, 1, 0, 0, 1, 1,
0.0728711, -1.24374, 3.064958, 1, 0, 0, 1, 1,
0.07386444, 0.0296274, 1.421905, 1, 0, 0, 1, 1,
0.07714026, -0.6671811, 3.855793, 0, 0, 0, 1, 1,
0.07795821, 0.6139151, 0.5746108, 0, 0, 0, 1, 1,
0.07979386, -0.02571523, 0.8066846, 0, 0, 0, 1, 1,
0.08028413, 0.1176753, 1.896619, 0, 0, 0, 1, 1,
0.08184264, 0.7195657, -0.1528996, 0, 0, 0, 1, 1,
0.08533498, -0.2331969, 2.986344, 0, 0, 0, 1, 1,
0.0932685, -1.388788, 3.42778, 0, 0, 0, 1, 1,
0.09453474, -1.376572, 3.729073, 1, 1, 1, 1, 1,
0.09620488, -2.599435, 3.565198, 1, 1, 1, 1, 1,
0.097369, 0.8181696, 1.424545, 1, 1, 1, 1, 1,
0.09797122, 2.267084, 0.5556692, 1, 1, 1, 1, 1,
0.09949747, -0.7514805, 4.474971, 1, 1, 1, 1, 1,
0.1003966, -0.06906051, 1.983807, 1, 1, 1, 1, 1,
0.1027124, -1.356779, 2.721085, 1, 1, 1, 1, 1,
0.1028856, -1.163509, 4.423987, 1, 1, 1, 1, 1,
0.1032771, -0.9168299, 2.361632, 1, 1, 1, 1, 1,
0.1058293, 0.7544408, -0.4521079, 1, 1, 1, 1, 1,
0.1075648, 0.1625594, 1.822078, 1, 1, 1, 1, 1,
0.1076802, 1.177528, 1.475734, 1, 1, 1, 1, 1,
0.109201, -0.01313606, 2.191407, 1, 1, 1, 1, 1,
0.1102104, -0.01395828, 1.461555, 1, 1, 1, 1, 1,
0.1106959, -1.934818, 3.972941, 1, 1, 1, 1, 1,
0.1123582, -1.965219, 3.158841, 0, 0, 1, 1, 1,
0.1129, 0.09697434, 1.382209, 1, 0, 0, 1, 1,
0.117501, 0.3359101, 2.171095, 1, 0, 0, 1, 1,
0.1179244, 1.150838, 0.07965698, 1, 0, 0, 1, 1,
0.1212942, 1.600758, -1.505395, 1, 0, 0, 1, 1,
0.1223431, -0.7976529, 3.705719, 1, 0, 0, 1, 1,
0.1265625, 0.2566532, 0.9588251, 0, 0, 0, 1, 1,
0.1306408, -0.2467727, 1.352777, 0, 0, 0, 1, 1,
0.1317401, 0.5779431, 2.178714, 0, 0, 0, 1, 1,
0.1327065, 1.027577, 1.345022, 0, 0, 0, 1, 1,
0.1349309, -1.154017, 2.757753, 0, 0, 0, 1, 1,
0.1356934, -1.103929, 2.74192, 0, 0, 0, 1, 1,
0.1399284, 0.9799348, -0.02796318, 0, 0, 0, 1, 1,
0.1485542, 1.405194, 0.2997002, 1, 1, 1, 1, 1,
0.1486987, 1.012803, -0.906367, 1, 1, 1, 1, 1,
0.1495548, 0.603358, 0.6646376, 1, 1, 1, 1, 1,
0.1540601, 1.641861, -0.4169339, 1, 1, 1, 1, 1,
0.1656297, 0.4555382, -1.952697, 1, 1, 1, 1, 1,
0.1709037, -2.170475, 4.061152, 1, 1, 1, 1, 1,
0.1751692, 2.120753, 0.7727038, 1, 1, 1, 1, 1,
0.1771034, -0.6797537, 2.464436, 1, 1, 1, 1, 1,
0.1779819, 1.741059, -0.9589428, 1, 1, 1, 1, 1,
0.1794773, 0.6183928, 1.215459, 1, 1, 1, 1, 1,
0.1796954, 0.09006429, 2.084251, 1, 1, 1, 1, 1,
0.1821781, 0.6499827, 0.1727798, 1, 1, 1, 1, 1,
0.18418, -0.4337183, 2.837198, 1, 1, 1, 1, 1,
0.1876152, -0.2411936, 4.427851, 1, 1, 1, 1, 1,
0.1896657, 1.731999, -1.823404, 1, 1, 1, 1, 1,
0.1933951, 0.517499, 1.337232, 0, 0, 1, 1, 1,
0.1982363, -0.6394172, 3.929957, 1, 0, 0, 1, 1,
0.1989114, -2.124623, 5.510311, 1, 0, 0, 1, 1,
0.1997226, -0.5426556, 3.877751, 1, 0, 0, 1, 1,
0.2057217, 0.1668732, 0.2084704, 1, 0, 0, 1, 1,
0.2092109, -1.242167, 2.507396, 1, 0, 0, 1, 1,
0.210485, -0.07476558, 1.506909, 0, 0, 0, 1, 1,
0.211277, -0.7009797, 2.779977, 0, 0, 0, 1, 1,
0.2149232, 0.7607893, 0.8586929, 0, 0, 0, 1, 1,
0.2186833, 0.1573032, 1.441978, 0, 0, 0, 1, 1,
0.2235032, 0.9990506, -0.3898517, 0, 0, 0, 1, 1,
0.2302848, -1.218776, 3.58285, 0, 0, 0, 1, 1,
0.2303358, 0.3183029, 1.023656, 0, 0, 0, 1, 1,
0.2319754, 0.0835107, 1.624555, 1, 1, 1, 1, 1,
0.2340949, -0.2357474, 3.063425, 1, 1, 1, 1, 1,
0.2359277, 0.6499019, 0.05388646, 1, 1, 1, 1, 1,
0.2396465, -0.55613, 0.8558084, 1, 1, 1, 1, 1,
0.2447893, 0.3080248, 0.6645553, 1, 1, 1, 1, 1,
0.2453048, 0.08750262, 1.394136, 1, 1, 1, 1, 1,
0.2454351, -1.631703, 1.599812, 1, 1, 1, 1, 1,
0.2496214, 0.1095164, 2.148988, 1, 1, 1, 1, 1,
0.2536665, 0.844056, -1.575252, 1, 1, 1, 1, 1,
0.2576092, -0.4073547, 1.905602, 1, 1, 1, 1, 1,
0.2605159, -1.766615, 3.607432, 1, 1, 1, 1, 1,
0.2701792, 1.815784, 0.4235688, 1, 1, 1, 1, 1,
0.2703931, -0.3851904, 1.561841, 1, 1, 1, 1, 1,
0.2757284, -1.292904, 3.723597, 1, 1, 1, 1, 1,
0.277132, -0.6189373, 2.137408, 1, 1, 1, 1, 1,
0.28133, -0.8841212, 2.730828, 0, 0, 1, 1, 1,
0.2823744, -0.9455771, 3.30511, 1, 0, 0, 1, 1,
0.2833202, 0.2452251, 0.4255996, 1, 0, 0, 1, 1,
0.2840305, 0.2293392, 1.963086, 1, 0, 0, 1, 1,
0.2852327, 0.05684992, 2.184469, 1, 0, 0, 1, 1,
0.2863401, -1.748621, 2.61551, 1, 0, 0, 1, 1,
0.2885915, 0.8006431, 1.375999, 0, 0, 0, 1, 1,
0.2907814, 0.3437025, -0.5072682, 0, 0, 0, 1, 1,
0.2917145, 0.7073956, -0.4178166, 0, 0, 0, 1, 1,
0.2931126, -0.2353573, 2.379967, 0, 0, 0, 1, 1,
0.3030959, -0.4976541, 3.260771, 0, 0, 0, 1, 1,
0.3033966, -0.1627906, 2.286135, 0, 0, 0, 1, 1,
0.3094313, -0.9536348, 4.068736, 0, 0, 0, 1, 1,
0.3170702, 1.22738, 1.196647, 1, 1, 1, 1, 1,
0.3177855, 1.321771, -0.4703374, 1, 1, 1, 1, 1,
0.3205107, -0.6378239, 2.123886, 1, 1, 1, 1, 1,
0.321277, -0.07321997, 2.337861, 1, 1, 1, 1, 1,
0.3231266, -0.2652416, 3.580023, 1, 1, 1, 1, 1,
0.3254427, -1.318373, 4.773116, 1, 1, 1, 1, 1,
0.3285933, -0.09117111, 0.5304722, 1, 1, 1, 1, 1,
0.3335643, -0.2408684, 4.286476, 1, 1, 1, 1, 1,
0.3348739, 1.005522, 1.516127, 1, 1, 1, 1, 1,
0.3350872, -0.3551951, 2.806607, 1, 1, 1, 1, 1,
0.3374659, 0.4334642, 0.6997821, 1, 1, 1, 1, 1,
0.3415821, -0.2788557, 2.276537, 1, 1, 1, 1, 1,
0.3441069, 2.239023, 0.400893, 1, 1, 1, 1, 1,
0.3481652, -2.631677, 3.367682, 1, 1, 1, 1, 1,
0.3548229, -0.6592282, 2.952063, 1, 1, 1, 1, 1,
0.3577538, -0.7306674, 3.687986, 0, 0, 1, 1, 1,
0.3609947, -0.5384606, 2.84829, 1, 0, 0, 1, 1,
0.3614574, -0.4131994, 3.233579, 1, 0, 0, 1, 1,
0.3682716, -0.3153529, 1.718211, 1, 0, 0, 1, 1,
0.3684176, 0.5126463, 0.3232046, 1, 0, 0, 1, 1,
0.3684231, -0.354467, 1.696281, 1, 0, 0, 1, 1,
0.3689033, -1.350546, 2.082444, 0, 0, 0, 1, 1,
0.3695917, -0.2815268, 2.662929, 0, 0, 0, 1, 1,
0.3705913, -1.589136, 3.23772, 0, 0, 0, 1, 1,
0.3733179, -0.3295621, 3.4501, 0, 0, 0, 1, 1,
0.3739828, -0.08076817, 0.8065357, 0, 0, 0, 1, 1,
0.375511, 0.1580179, 0.7905477, 0, 0, 0, 1, 1,
0.3762771, 1.61496, 1.341042, 0, 0, 0, 1, 1,
0.3832217, -1.054266, 2.561898, 1, 1, 1, 1, 1,
0.3854046, -0.005483231, 0.8176908, 1, 1, 1, 1, 1,
0.3856217, -0.4181385, 1.741084, 1, 1, 1, 1, 1,
0.3883063, 0.6264233, 2.608694, 1, 1, 1, 1, 1,
0.3886653, -0.8247772, 2.950028, 1, 1, 1, 1, 1,
0.3897719, 0.4305217, 1.409316, 1, 1, 1, 1, 1,
0.3900806, -1.611438, 1.994625, 1, 1, 1, 1, 1,
0.3977502, -0.1126374, 3.536209, 1, 1, 1, 1, 1,
0.3985816, -0.1530273, 0.8857695, 1, 1, 1, 1, 1,
0.4012298, 2.314195, 1.370678, 1, 1, 1, 1, 1,
0.4029166, -0.6504126, 3.408096, 1, 1, 1, 1, 1,
0.4074916, 1.839731, 0.3881209, 1, 1, 1, 1, 1,
0.4105066, -0.4293236, 1.252971, 1, 1, 1, 1, 1,
0.4108163, -0.449036, 2.353346, 1, 1, 1, 1, 1,
0.4112896, 0.2216485, 0.430646, 1, 1, 1, 1, 1,
0.412679, -0.1880459, 0.6346991, 0, 0, 1, 1, 1,
0.4137589, -0.2501329, 1.56602, 1, 0, 0, 1, 1,
0.4174695, -1.057637, 2.971233, 1, 0, 0, 1, 1,
0.419502, -0.9780654, 3.100713, 1, 0, 0, 1, 1,
0.4211944, -1.416764, 3.791451, 1, 0, 0, 1, 1,
0.4212733, 0.5234936, 0.002150039, 1, 0, 0, 1, 1,
0.4255382, 0.5721921, 2.461564, 0, 0, 0, 1, 1,
0.4272445, 0.7336154, -0.3244121, 0, 0, 0, 1, 1,
0.4341623, 0.9828627, 1.320513, 0, 0, 0, 1, 1,
0.4361832, 0.7674968, -0.5003413, 0, 0, 0, 1, 1,
0.4381501, -0.2119452, 1.851581, 0, 0, 0, 1, 1,
0.4390876, -0.5492328, 1.851288, 0, 0, 0, 1, 1,
0.4420473, -0.7996791, 0.9811022, 0, 0, 0, 1, 1,
0.4448263, 3.275467, -0.6965154, 1, 1, 1, 1, 1,
0.449257, 0.7535059, 0.2320617, 1, 1, 1, 1, 1,
0.4508479, -1.50309, 3.734312, 1, 1, 1, 1, 1,
0.4573563, 0.1560406, 1.628665, 1, 1, 1, 1, 1,
0.4574313, -0.5248697, 0.9056639, 1, 1, 1, 1, 1,
0.460684, -1.158453, 1.354447, 1, 1, 1, 1, 1,
0.4715696, -2.653113, 2.894284, 1, 1, 1, 1, 1,
0.4720707, -1.132599, 3.347799, 1, 1, 1, 1, 1,
0.4728884, 0.8081998, 1.472041, 1, 1, 1, 1, 1,
0.4762329, -0.240625, 0.4864059, 1, 1, 1, 1, 1,
0.4773858, -0.4476222, 1.711441, 1, 1, 1, 1, 1,
0.4816585, -0.8993225, 3.369697, 1, 1, 1, 1, 1,
0.4860114, 1.063804, 2.133604, 1, 1, 1, 1, 1,
0.4870249, -2.036577, 3.513831, 1, 1, 1, 1, 1,
0.4886714, -0.04771208, 0.9458569, 1, 1, 1, 1, 1,
0.4933389, -1.24826, 2.91201, 0, 0, 1, 1, 1,
0.4943565, -0.1742266, 1.875758, 1, 0, 0, 1, 1,
0.4949435, 0.5669194, 2.678302, 1, 0, 0, 1, 1,
0.4952744, 1.613506, -0.5037089, 1, 0, 0, 1, 1,
0.5018817, 0.5362118, 1.563037, 1, 0, 0, 1, 1,
0.5098193, 1.792339, -1.115807, 1, 0, 0, 1, 1,
0.5098805, 0.4238505, 1.618812, 0, 0, 0, 1, 1,
0.512023, 0.2111607, 0.3009517, 0, 0, 0, 1, 1,
0.517053, 1.066723, 1.065567, 0, 0, 0, 1, 1,
0.5190528, -1.795816, 1.710716, 0, 0, 0, 1, 1,
0.5224311, 0.7177768, 1.432171, 0, 0, 0, 1, 1,
0.5287384, 0.4707558, -0.8545965, 0, 0, 0, 1, 1,
0.5313325, -0.7303345, 2.05284, 0, 0, 0, 1, 1,
0.5329288, -0.2740037, 2.097285, 1, 1, 1, 1, 1,
0.5341614, 0.5772341, 1.158719, 1, 1, 1, 1, 1,
0.5349556, -1.108323, 3.916489, 1, 1, 1, 1, 1,
0.5367118, 1.327503, -0.7289189, 1, 1, 1, 1, 1,
0.5439427, 0.5668778, 0.6090663, 1, 1, 1, 1, 1,
0.5447728, -1.00872, 3.945708, 1, 1, 1, 1, 1,
0.5451723, 0.3728704, 1.110289, 1, 1, 1, 1, 1,
0.5455334, -0.05089673, 0.7264224, 1, 1, 1, 1, 1,
0.5460173, -1.486938, 2.844041, 1, 1, 1, 1, 1,
0.5491968, 0.4309375, 2.201038, 1, 1, 1, 1, 1,
0.5515732, -0.3731701, 1.887194, 1, 1, 1, 1, 1,
0.5524562, 1.910407, 1.690368, 1, 1, 1, 1, 1,
0.5530582, 0.001276337, 2.609712, 1, 1, 1, 1, 1,
0.5546407, 0.1110514, 1.43391, 1, 1, 1, 1, 1,
0.5589809, -0.4869732, 1.300842, 1, 1, 1, 1, 1,
0.5654137, 0.1434743, 2.714299, 0, 0, 1, 1, 1,
0.5720203, -1.228788, 3.189178, 1, 0, 0, 1, 1,
0.5743913, -0.2315879, 3.385061, 1, 0, 0, 1, 1,
0.5746203, -0.8521033, 2.429837, 1, 0, 0, 1, 1,
0.5755181, 1.193095, 1.302245, 1, 0, 0, 1, 1,
0.5794715, -0.7766538, 2.6086, 1, 0, 0, 1, 1,
0.5845961, -1.61606, 3.75467, 0, 0, 0, 1, 1,
0.585228, 1.458532, 0.8022351, 0, 0, 0, 1, 1,
0.5961313, 2.109942, -0.5040202, 0, 0, 0, 1, 1,
0.5965247, 0.1183496, 0.9282681, 0, 0, 0, 1, 1,
0.59911, -0.7290818, 1.158253, 0, 0, 0, 1, 1,
0.6002832, -0.07080634, 2.581096, 0, 0, 0, 1, 1,
0.604204, 0.8148025, -0.5143766, 0, 0, 0, 1, 1,
0.6094633, 1.667967, 0.03290173, 1, 1, 1, 1, 1,
0.6106508, -0.311348, 1.995465, 1, 1, 1, 1, 1,
0.6223173, 0.05386472, -0.03198668, 1, 1, 1, 1, 1,
0.6240407, -0.6620078, 2.290325, 1, 1, 1, 1, 1,
0.6256736, 0.8914825, 0.9206126, 1, 1, 1, 1, 1,
0.6264591, 0.1396011, 0.3810922, 1, 1, 1, 1, 1,
0.6267021, 0.2351782, 0.4448409, 1, 1, 1, 1, 1,
0.6272315, 0.3438879, 1.065693, 1, 1, 1, 1, 1,
0.6276641, 0.2174075, 0.6802467, 1, 1, 1, 1, 1,
0.6280218, 0.6655393, 1.61175, 1, 1, 1, 1, 1,
0.6339292, 0.9331733, 0.3364188, 1, 1, 1, 1, 1,
0.6343461, -0.7649203, 1.910449, 1, 1, 1, 1, 1,
0.6349647, -0.2094678, 3.576243, 1, 1, 1, 1, 1,
0.6361974, 0.9845105, 0.4698131, 1, 1, 1, 1, 1,
0.6382617, -0.3620216, 1.581556, 1, 1, 1, 1, 1,
0.6404777, 1.190803, 0.9778557, 0, 0, 1, 1, 1,
0.642356, 1.392135, -0.5061697, 1, 0, 0, 1, 1,
0.6429131, -0.2840754, 1.470098, 1, 0, 0, 1, 1,
0.6461062, 0.827035, 1.322757, 1, 0, 0, 1, 1,
0.656948, -0.685495, 1.044013, 1, 0, 0, 1, 1,
0.6581026, -0.3713382, 2.528815, 1, 0, 0, 1, 1,
0.660879, -0.7361478, 3.393521, 0, 0, 0, 1, 1,
0.6617643, -0.1065924, 1.783713, 0, 0, 0, 1, 1,
0.6777318, 0.3737145, 1.839426, 0, 0, 0, 1, 1,
0.6780713, 0.3279117, 1.052485, 0, 0, 0, 1, 1,
0.6797792, 0.4822931, 0.5584127, 0, 0, 0, 1, 1,
0.6849965, 0.9189819, 0.326912, 0, 0, 0, 1, 1,
0.6854922, -0.1419832, 2.396064, 0, 0, 0, 1, 1,
0.6894864, -1.040009, 2.414384, 1, 1, 1, 1, 1,
0.6914458, 0.5081361, 0.4946748, 1, 1, 1, 1, 1,
0.6948893, -1.462839, 2.93618, 1, 1, 1, 1, 1,
0.6954664, 1.058396, 0.4930395, 1, 1, 1, 1, 1,
0.6977642, -1.437522, 1.491251, 1, 1, 1, 1, 1,
0.7001486, 0.6011942, 1.649636, 1, 1, 1, 1, 1,
0.7064927, 0.4974141, -0.2263218, 1, 1, 1, 1, 1,
0.7083178, -0.6769953, 1.268536, 1, 1, 1, 1, 1,
0.7128051, 0.501651, 1.002461, 1, 1, 1, 1, 1,
0.721383, 0.7817683, -0.06239287, 1, 1, 1, 1, 1,
0.722953, -1.577241, 3.289814, 1, 1, 1, 1, 1,
0.7262878, -0.8814282, 3.835867, 1, 1, 1, 1, 1,
0.7382942, 0.2150251, 1.729768, 1, 1, 1, 1, 1,
0.7424557, 1.291847, -1.56123, 1, 1, 1, 1, 1,
0.7513267, -0.7226906, 2.700572, 1, 1, 1, 1, 1,
0.7513941, -0.1910724, 0.8667867, 0, 0, 1, 1, 1,
0.7695717, -0.0405171, 1.644495, 1, 0, 0, 1, 1,
0.7703211, -0.3037659, 0.4978037, 1, 0, 0, 1, 1,
0.7710661, -1.52311, 2.666619, 1, 0, 0, 1, 1,
0.7770488, 1.383397, -0.9309491, 1, 0, 0, 1, 1,
0.7791296, -0.01067937, 0.4997827, 1, 0, 0, 1, 1,
0.7866694, 0.2921458, 2.095796, 0, 0, 0, 1, 1,
0.8039306, -1.783661, 4.626166, 0, 0, 0, 1, 1,
0.8048642, 1.05005, 1.789847, 0, 0, 0, 1, 1,
0.8134326, -0.5854917, 1.0375, 0, 0, 0, 1, 1,
0.816565, 0.469939, 0.1262287, 0, 0, 0, 1, 1,
0.8191397, -0.5726678, 1.228562, 0, 0, 0, 1, 1,
0.8216619, 1.678055, -0.6043882, 0, 0, 0, 1, 1,
0.8243555, 0.1601353, 2.216454, 1, 1, 1, 1, 1,
0.8251299, 1.909903, -0.2778972, 1, 1, 1, 1, 1,
0.8265802, -0.7899534, 2.921689, 1, 1, 1, 1, 1,
0.8298193, 1.018549, 0.8529618, 1, 1, 1, 1, 1,
0.8320146, -0.865483, 1.236139, 1, 1, 1, 1, 1,
0.8325738, -0.3168173, 0.1251719, 1, 1, 1, 1, 1,
0.833357, 0.9773987, 0.5273752, 1, 1, 1, 1, 1,
0.8341374, -0.03684266, 1.334541, 1, 1, 1, 1, 1,
0.8387105, 0.5241784, 2.140684, 1, 1, 1, 1, 1,
0.8409753, 3.06764, -1.244693, 1, 1, 1, 1, 1,
0.8472927, -0.3187636, 2.208722, 1, 1, 1, 1, 1,
0.8558985, 0.1798532, 1.93389, 1, 1, 1, 1, 1,
0.8564959, 2.110321, 2.062521, 1, 1, 1, 1, 1,
0.8683739, -1.2412, 2.969969, 1, 1, 1, 1, 1,
0.8796548, 0.9483159, 0.4429905, 1, 1, 1, 1, 1,
0.8818007, 0.8129141, 1.232689, 0, 0, 1, 1, 1,
0.8914286, -1.054945, 2.407431, 1, 0, 0, 1, 1,
0.8930005, -1.417592, 2.590295, 1, 0, 0, 1, 1,
0.8937017, 0.2812075, 0.6240497, 1, 0, 0, 1, 1,
0.8937154, 0.0643254, -0.1397677, 1, 0, 0, 1, 1,
0.8960573, -0.1525564, 3.140347, 1, 0, 0, 1, 1,
0.9011905, 0.3857543, 2.365274, 0, 0, 0, 1, 1,
0.9031496, 0.8517706, 0.1633414, 0, 0, 0, 1, 1,
0.9080563, -1.219545, 2.360911, 0, 0, 0, 1, 1,
0.910895, -0.3199927, 1.307309, 0, 0, 0, 1, 1,
0.9200573, -0.656758, 0.4545154, 0, 0, 0, 1, 1,
0.9279521, -0.7198362, 1.908322, 0, 0, 0, 1, 1,
0.9315988, -0.7881386, 1.100027, 0, 0, 0, 1, 1,
0.936475, -0.1952198, 0.4358838, 1, 1, 1, 1, 1,
0.938626, 1.007721, 0.07784292, 1, 1, 1, 1, 1,
0.944737, -0.9118987, 4.236942, 1, 1, 1, 1, 1,
0.9455236, -0.2054206, 1.763358, 1, 1, 1, 1, 1,
0.9558088, -0.2879561, 2.518758, 1, 1, 1, 1, 1,
0.9558107, -0.0445251, 1.776483, 1, 1, 1, 1, 1,
0.9579505, -0.7403294, 1.432558, 1, 1, 1, 1, 1,
0.9580028, 0.457808, 1.278251, 1, 1, 1, 1, 1,
0.9590191, -0.446822, -0.3266507, 1, 1, 1, 1, 1,
0.9690701, 0.7115048, 0.1051386, 1, 1, 1, 1, 1,
0.9796249, 0.7121681, 1.726968, 1, 1, 1, 1, 1,
0.9886472, 1.288396, -0.8780802, 1, 1, 1, 1, 1,
0.9952669, 1.446147, 3.184277, 1, 1, 1, 1, 1,
0.9954424, -0.5915162, 2.879244, 1, 1, 1, 1, 1,
0.9962124, 0.2832281, 1.188272, 1, 1, 1, 1, 1,
1.00628, 0.1472139, 1.260535, 0, 0, 1, 1, 1,
1.01758, -1.049053, 1.699715, 1, 0, 0, 1, 1,
1.019876, -0.4500413, 1.529407, 1, 0, 0, 1, 1,
1.041006, 0.3345873, 0.7457212, 1, 0, 0, 1, 1,
1.043646, -0.2639252, 2.485457, 1, 0, 0, 1, 1,
1.043788, -1.079432, 1.603183, 1, 0, 0, 1, 1,
1.046807, 0.309542, 1.700812, 0, 0, 0, 1, 1,
1.055192, -0.5402719, 1.103732, 0, 0, 0, 1, 1,
1.057653, -0.08957366, 1.971734, 0, 0, 0, 1, 1,
1.059624, -1.804996, 4.789212, 0, 0, 0, 1, 1,
1.06258, -0.5986902, 3.638477, 0, 0, 0, 1, 1,
1.069934, -0.5205293, 3.968566, 0, 0, 0, 1, 1,
1.073172, 2.25032, 0.6042901, 0, 0, 0, 1, 1,
1.076289, 1.095334, -0.03077549, 1, 1, 1, 1, 1,
1.08016, 0.09476469, 0.7293609, 1, 1, 1, 1, 1,
1.085575, 1.429566, 1.306358, 1, 1, 1, 1, 1,
1.102876, 1.978713, 1.658314, 1, 1, 1, 1, 1,
1.105851, 0.558183, 0.772256, 1, 1, 1, 1, 1,
1.116493, 0.6969503, 2.64867, 1, 1, 1, 1, 1,
1.117669, 0.7462222, 2.545961, 1, 1, 1, 1, 1,
1.118977, 0.3412459, 2.19439, 1, 1, 1, 1, 1,
1.121165, -0.7954847, 3.007001, 1, 1, 1, 1, 1,
1.124185, 0.7939522, 0.4799698, 1, 1, 1, 1, 1,
1.127042, -0.2982797, 1.425841, 1, 1, 1, 1, 1,
1.131498, 0.5381652, 0.763317, 1, 1, 1, 1, 1,
1.139605, -1.22369, 2.283536, 1, 1, 1, 1, 1,
1.145484, 0.1547154, 2.543626, 1, 1, 1, 1, 1,
1.149475, 0.4231158, 1.88772, 1, 1, 1, 1, 1,
1.160601, -0.6116972, 4.410149, 0, 0, 1, 1, 1,
1.160965, 0.09382775, 2.178628, 1, 0, 0, 1, 1,
1.161456, 0.2657561, 0.2397873, 1, 0, 0, 1, 1,
1.181541, -0.08801582, 2.92286, 1, 0, 0, 1, 1,
1.186011, 0.491861, -0.8488229, 1, 0, 0, 1, 1,
1.187505, -1.874023, 3.669961, 1, 0, 0, 1, 1,
1.188254, 0.4848109, 0.3918552, 0, 0, 0, 1, 1,
1.197361, -0.2524707, 1.239869, 0, 0, 0, 1, 1,
1.198305, 0.2756288, 2.156134, 0, 0, 0, 1, 1,
1.212372, 0.06607663, 1.528561, 0, 0, 0, 1, 1,
1.215513, 0.6778162, 1.42327, 0, 0, 0, 1, 1,
1.218473, -0.02461194, 0.8853879, 0, 0, 0, 1, 1,
1.223993, -1.053081, 2.232875, 0, 0, 0, 1, 1,
1.229897, -1.448078, -0.2874018, 1, 1, 1, 1, 1,
1.24118, -0.664315, 2.187577, 1, 1, 1, 1, 1,
1.246271, 2.05082, 2.01206, 1, 1, 1, 1, 1,
1.255859, 0.2343066, 1.027012, 1, 1, 1, 1, 1,
1.258908, -0.9066694, 2.152723, 1, 1, 1, 1, 1,
1.26226, -2.487545, 2.232962, 1, 1, 1, 1, 1,
1.264873, 0.4253044, 3.466142, 1, 1, 1, 1, 1,
1.266841, 0.03255169, -0.2642954, 1, 1, 1, 1, 1,
1.272241, -1.214227, 2.160432, 1, 1, 1, 1, 1,
1.273727, 0.9204227, 0.05407489, 1, 1, 1, 1, 1,
1.276528, 0.1488165, 2.24878, 1, 1, 1, 1, 1,
1.280873, 0.8256205, 0.5641524, 1, 1, 1, 1, 1,
1.290202, -0.1752673, 0.7151884, 1, 1, 1, 1, 1,
1.291893, -0.3573361, 0.9308714, 1, 1, 1, 1, 1,
1.291984, 0.2070164, 0.4354117, 1, 1, 1, 1, 1,
1.293523, -0.8997244, 3.080592, 0, 0, 1, 1, 1,
1.294707, 1.556822, 0.6963224, 1, 0, 0, 1, 1,
1.299835, 0.4051431, 0.5826997, 1, 0, 0, 1, 1,
1.299946, -0.4491054, 0.1000252, 1, 0, 0, 1, 1,
1.300235, -1.741851, 1.260406, 1, 0, 0, 1, 1,
1.302467, -2.216156, 3.80886, 1, 0, 0, 1, 1,
1.302971, -1.108391, 2.082066, 0, 0, 0, 1, 1,
1.307517, 1.153097, -0.5147433, 0, 0, 0, 1, 1,
1.308875, 1.160754, 1.941542, 0, 0, 0, 1, 1,
1.311977, -1.745363, 2.329038, 0, 0, 0, 1, 1,
1.313393, -0.09790004, 0.9982894, 0, 0, 0, 1, 1,
1.329904, -0.303426, 2.537557, 0, 0, 0, 1, 1,
1.33119, -0.3410774, 1.083632, 0, 0, 0, 1, 1,
1.338024, 1.284537, 1.022961, 1, 1, 1, 1, 1,
1.338583, 0.2456039, 0.07576836, 1, 1, 1, 1, 1,
1.343859, -1.415106, 1.422165, 1, 1, 1, 1, 1,
1.344915, 1.329062, 0.4160337, 1, 1, 1, 1, 1,
1.35143, 0.7262989, 2.10457, 1, 1, 1, 1, 1,
1.366837, 0.8291464, 0.2715647, 1, 1, 1, 1, 1,
1.377862, -0.1445113, 3.162077, 1, 1, 1, 1, 1,
1.3836, 0.4750405, -0.7569245, 1, 1, 1, 1, 1,
1.40023, 0.03437511, 0.6410232, 1, 1, 1, 1, 1,
1.404588, -0.4501988, 1.640607, 1, 1, 1, 1, 1,
1.405994, -0.7638257, 2.073937, 1, 1, 1, 1, 1,
1.410909, -0.4135739, 0.3923885, 1, 1, 1, 1, 1,
1.425732, 0.4860653, 1.605411, 1, 1, 1, 1, 1,
1.426042, 1.06792, 0.2333532, 1, 1, 1, 1, 1,
1.433668, -0.9079926, 0.1500488, 1, 1, 1, 1, 1,
1.439535, -0.5050033, 3.863802, 0, 0, 1, 1, 1,
1.442968, 0.2574111, 0.7514226, 1, 0, 0, 1, 1,
1.46054, -2.326929, 2.290296, 1, 0, 0, 1, 1,
1.466607, 0.6268352, 0.6122501, 1, 0, 0, 1, 1,
1.479608, 0.4370292, 0.4625017, 1, 0, 0, 1, 1,
1.486264, -1.124279, 2.354657, 1, 0, 0, 1, 1,
1.495879, 1.170184, 0.5012256, 0, 0, 0, 1, 1,
1.495946, 1.728169, 3.003144, 0, 0, 0, 1, 1,
1.499739, 0.5830916, 1.246043, 0, 0, 0, 1, 1,
1.516393, 0.1996764, 1.529236, 0, 0, 0, 1, 1,
1.526029, -1.844652, 3.206288, 0, 0, 0, 1, 1,
1.533278, -0.8919252, 1.571021, 0, 0, 0, 1, 1,
1.540984, 0.5845906, 0.8756132, 0, 0, 0, 1, 1,
1.54961, -1.273874, 1.405722, 1, 1, 1, 1, 1,
1.552014, -1.449764, 2.095555, 1, 1, 1, 1, 1,
1.555564, 0.03017788, 3.135103, 1, 1, 1, 1, 1,
1.570585, 0.4784272, 0.8061864, 1, 1, 1, 1, 1,
1.571945, 1.81987, 1.611674, 1, 1, 1, 1, 1,
1.584407, 0.2071689, 0.6866201, 1, 1, 1, 1, 1,
1.604441, 0.9562044, 0.2301739, 1, 1, 1, 1, 1,
1.611192, 0.4037124, 0.6909789, 1, 1, 1, 1, 1,
1.615824, 0.1623705, 2.206072, 1, 1, 1, 1, 1,
1.616063, 0.1763012, 2.193334, 1, 1, 1, 1, 1,
1.625471, -0.1384941, 0.3914222, 1, 1, 1, 1, 1,
1.645213, 0.05227158, 1.36891, 1, 1, 1, 1, 1,
1.646183, -1.439007, 2.500556, 1, 1, 1, 1, 1,
1.646873, 2.689329, 1.076425, 1, 1, 1, 1, 1,
1.660938, 0.05364627, 2.042904, 1, 1, 1, 1, 1,
1.668996, 0.3617982, 2.709958, 0, 0, 1, 1, 1,
1.671029, 1.219899, -0.436857, 1, 0, 0, 1, 1,
1.673018, -0.1923956, 0.8207132, 1, 0, 0, 1, 1,
1.683203, 0.5042114, 2.046079, 1, 0, 0, 1, 1,
1.706435, -0.527372, 1.248023, 1, 0, 0, 1, 1,
1.711941, -2.079819, 3.396715, 1, 0, 0, 1, 1,
1.741113, 0.5519847, 0.5141742, 0, 0, 0, 1, 1,
1.743543, 0.6019951, 2.242242, 0, 0, 0, 1, 1,
1.747487, 1.839235, 1.873845, 0, 0, 0, 1, 1,
1.754993, 0.4726986, 0.3553699, 0, 0, 0, 1, 1,
1.762093, 0.2097131, 0.9231714, 0, 0, 0, 1, 1,
1.765187, -1.261564, 1.479599, 0, 0, 0, 1, 1,
1.77176, 1.449521, -0.5365577, 0, 0, 0, 1, 1,
1.777243, -1.811171, 2.267864, 1, 1, 1, 1, 1,
1.805516, -0.6695282, 2.248428, 1, 1, 1, 1, 1,
1.81765, 0.5118018, 1.808128, 1, 1, 1, 1, 1,
1.827306, 1.340375, 0.5674409, 1, 1, 1, 1, 1,
1.846341, -0.7438493, 0.4581207, 1, 1, 1, 1, 1,
1.848682, 0.190289, 0.896566, 1, 1, 1, 1, 1,
1.853832, 0.1984098, -0.8676232, 1, 1, 1, 1, 1,
1.860681, 1.208632, 1.29679, 1, 1, 1, 1, 1,
1.866501, 0.2308307, 2.838088, 1, 1, 1, 1, 1,
1.869573, 1.743768, 0.4708843, 1, 1, 1, 1, 1,
1.874017, 0.4473278, -0.1545233, 1, 1, 1, 1, 1,
1.909158, -0.6429346, 0.6947178, 1, 1, 1, 1, 1,
1.91694, -0.3318262, 3.148045, 1, 1, 1, 1, 1,
1.926293, 0.9063284, 0.9612499, 1, 1, 1, 1, 1,
1.937871, -0.7081234, 0.8553006, 1, 1, 1, 1, 1,
1.940025, -1.224566, 1.697738, 0, 0, 1, 1, 1,
1.947717, 1.117992, -0.9304541, 1, 0, 0, 1, 1,
1.97207, -0.008492331, 1.010866, 1, 0, 0, 1, 1,
1.976537, -0.6997301, 2.796835, 1, 0, 0, 1, 1,
1.977517, 0.9592537, 1.058624, 1, 0, 0, 1, 1,
1.983268, 0.4605426, -0.09885985, 1, 0, 0, 1, 1,
1.988539, 0.4762695, 0.6944446, 0, 0, 0, 1, 1,
2.002895, -0.1124207, 2.913333, 0, 0, 0, 1, 1,
2.12073, 1.151495, 0.232748, 0, 0, 0, 1, 1,
2.125597, 0.8551188, 1.031567, 0, 0, 0, 1, 1,
2.12978, 0.05849022, -0.4634381, 0, 0, 0, 1, 1,
2.133595, 0.2672213, 0.9509764, 0, 0, 0, 1, 1,
2.185004, 0.5126811, 0.2333935, 0, 0, 0, 1, 1,
2.310036, -1.097779, 1.272849, 1, 1, 1, 1, 1,
2.483307, -0.4494367, 0.9071566, 1, 1, 1, 1, 1,
2.508538, -2.016853, 1.477085, 1, 1, 1, 1, 1,
2.520932, 0.3586751, -0.1575636, 1, 1, 1, 1, 1,
2.684617, 0.298544, 1.731897, 1, 1, 1, 1, 1,
2.787349, -1.990653, 3.416866, 1, 1, 1, 1, 1,
2.795289, -0.8292835, 0.7197092, 1, 1, 1, 1, 1
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
var radius = 9.487468;
var distance = 33.32433;
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
mvMatrix.translate( 0.2240945, -0.1774281, -0.07286167 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.32433);
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
