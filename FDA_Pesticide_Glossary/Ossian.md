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
-3.225774, 0.1806964, -2.294399, 1, 0, 0, 1,
-3.020425, 0.3901645, -1.321147, 1, 0.007843138, 0, 1,
-2.923957, -0.453296, -0.6530534, 1, 0.01176471, 0, 1,
-2.781908, -1.156197, 0.1980214, 1, 0.01960784, 0, 1,
-2.70604, 1.055724, -1.291344, 1, 0.02352941, 0, 1,
-2.638358, -0.5164593, -2.535006, 1, 0.03137255, 0, 1,
-2.625966, -1.882165, -2.835646, 1, 0.03529412, 0, 1,
-2.56932, -0.4509344, -1.494658, 1, 0.04313726, 0, 1,
-2.50982, 0.6104606, 0.1726357, 1, 0.04705882, 0, 1,
-2.428447, -1.157777, -3.192894, 1, 0.05490196, 0, 1,
-2.427685, -0.4555829, -3.130184, 1, 0.05882353, 0, 1,
-2.352075, 0.7597628, 0.6954366, 1, 0.06666667, 0, 1,
-2.245024, 0.6494148, -1.858904, 1, 0.07058824, 0, 1,
-2.241666, 1.549566, -2.64299, 1, 0.07843138, 0, 1,
-2.201712, 0.2952486, -2.442384, 1, 0.08235294, 0, 1,
-2.200313, 0.279903, -1.231002, 1, 0.09019608, 0, 1,
-2.176382, 2.400388, -0.3727759, 1, 0.09411765, 0, 1,
-2.164955, -0.1961207, -1.989355, 1, 0.1019608, 0, 1,
-2.145634, -0.4226483, -1.94018, 1, 0.1098039, 0, 1,
-2.143931, -0.3016009, -1.000092, 1, 0.1137255, 0, 1,
-2.135005, 0.1354915, -1.388656, 1, 0.1215686, 0, 1,
-2.1303, 0.9912085, -2.747828, 1, 0.1254902, 0, 1,
-2.12548, 0.9517464, -0.355798, 1, 0.1333333, 0, 1,
-2.115201, 0.2443192, 0.6724538, 1, 0.1372549, 0, 1,
-2.115133, 0.2841448, -1.528473, 1, 0.145098, 0, 1,
-2.077283, 0.7385497, -1.078366, 1, 0.1490196, 0, 1,
-2.073827, -0.8086335, -2.204524, 1, 0.1568628, 0, 1,
-2.047837, -0.6253473, -1.655329, 1, 0.1607843, 0, 1,
-2.00881, 0.1968336, -1.153392, 1, 0.1686275, 0, 1,
-1.971256, -0.001209239, -1.337287, 1, 0.172549, 0, 1,
-1.933555, -0.411267, -1.234582, 1, 0.1803922, 0, 1,
-1.898694, 0.182418, -1.45521, 1, 0.1843137, 0, 1,
-1.898678, -0.7337819, -1.217376, 1, 0.1921569, 0, 1,
-1.880642, -0.8909447, -2.802784, 1, 0.1960784, 0, 1,
-1.878021, -0.2737076, -0.4710541, 1, 0.2039216, 0, 1,
-1.877498, -2.341591, -3.788262, 1, 0.2117647, 0, 1,
-1.873388, 0.1109325, -1.535798, 1, 0.2156863, 0, 1,
-1.865892, 0.9966328, -1.255281, 1, 0.2235294, 0, 1,
-1.85511, -2.481769, -3.718966, 1, 0.227451, 0, 1,
-1.846981, 0.04317453, -1.779955, 1, 0.2352941, 0, 1,
-1.822635, 0.9625744, -1.853911, 1, 0.2392157, 0, 1,
-1.81583, -0.5562969, -2.483079, 1, 0.2470588, 0, 1,
-1.807665, 0.4990241, 0.3205153, 1, 0.2509804, 0, 1,
-1.804019, 0.9971257, -0.9911798, 1, 0.2588235, 0, 1,
-1.801938, 0.2651966, -1.568481, 1, 0.2627451, 0, 1,
-1.786797, -0.1945208, -1.028483, 1, 0.2705882, 0, 1,
-1.753114, -0.2572199, -0.8751558, 1, 0.2745098, 0, 1,
-1.751699, 0.9750432, -1.15914, 1, 0.282353, 0, 1,
-1.748833, -0.1698848, -2.678022, 1, 0.2862745, 0, 1,
-1.7376, 2.119487, 0.1198397, 1, 0.2941177, 0, 1,
-1.706545, 0.1882252, -1.397182, 1, 0.3019608, 0, 1,
-1.692557, -0.02495302, 0.4892515, 1, 0.3058824, 0, 1,
-1.678348, -1.147341, -1.714109, 1, 0.3137255, 0, 1,
-1.673635, -0.3093501, 0.2133504, 1, 0.3176471, 0, 1,
-1.669631, -1.015759, -2.598982, 1, 0.3254902, 0, 1,
-1.629019, -0.3702605, -3.257071, 1, 0.3294118, 0, 1,
-1.613137, -0.7990508, -0.964491, 1, 0.3372549, 0, 1,
-1.612482, 0.2992149, -2.920745, 1, 0.3411765, 0, 1,
-1.607045, -1.410278, -1.217423, 1, 0.3490196, 0, 1,
-1.605134, -1.138085, -2.419532, 1, 0.3529412, 0, 1,
-1.597859, -1.459932, -3.216734, 1, 0.3607843, 0, 1,
-1.588569, -0.6033939, -0.4970729, 1, 0.3647059, 0, 1,
-1.584363, -1.400714, -1.551, 1, 0.372549, 0, 1,
-1.574881, 0.4989673, -2.874659, 1, 0.3764706, 0, 1,
-1.570137, -0.8850699, -3.083706, 1, 0.3843137, 0, 1,
-1.569505, 0.5996884, -2.240467, 1, 0.3882353, 0, 1,
-1.557718, -1.098709, -3.607231, 1, 0.3960784, 0, 1,
-1.557703, -0.3130883, -0.7509671, 1, 0.4039216, 0, 1,
-1.553663, -0.6093338, -1.396915, 1, 0.4078431, 0, 1,
-1.542263, 0.3227703, -0.5012614, 1, 0.4156863, 0, 1,
-1.54145, 0.6664239, -0.9811889, 1, 0.4196078, 0, 1,
-1.53783, 0.7106721, -1.51793, 1, 0.427451, 0, 1,
-1.533057, -1.006541, 0.2636282, 1, 0.4313726, 0, 1,
-1.516508, -0.3261743, 0.3598703, 1, 0.4392157, 0, 1,
-1.498853, -0.6290604, -1.777139, 1, 0.4431373, 0, 1,
-1.496941, 0.3725112, -0.5952884, 1, 0.4509804, 0, 1,
-1.486119, 0.1915416, -0.6853243, 1, 0.454902, 0, 1,
-1.471434, -0.2620377, -0.8407705, 1, 0.4627451, 0, 1,
-1.453986, 0.7812742, 0.06935969, 1, 0.4666667, 0, 1,
-1.445474, 0.2036109, -1.95816, 1, 0.4745098, 0, 1,
-1.441406, 0.5076009, -1.587052, 1, 0.4784314, 0, 1,
-1.406913, 0.8215852, -2.238102, 1, 0.4862745, 0, 1,
-1.400363, 0.4631566, -0.8364446, 1, 0.4901961, 0, 1,
-1.395697, -0.5861426, -0.9812733, 1, 0.4980392, 0, 1,
-1.391289, -0.1181485, -2.258256, 1, 0.5058824, 0, 1,
-1.389752, 0.6971543, -1.130469, 1, 0.509804, 0, 1,
-1.388589, -0.3291097, -3.204973, 1, 0.5176471, 0, 1,
-1.382445, 1.576317, -1.944221, 1, 0.5215687, 0, 1,
-1.362675, 1.36745, -0.3859434, 1, 0.5294118, 0, 1,
-1.341274, 0.7408033, -0.9947815, 1, 0.5333334, 0, 1,
-1.339735, 0.008629358, -2.101969, 1, 0.5411765, 0, 1,
-1.335377, 1.396104, -1.438853, 1, 0.5450981, 0, 1,
-1.331964, -0.5524476, -2.485079, 1, 0.5529412, 0, 1,
-1.33043, -0.1783327, -2.500958, 1, 0.5568628, 0, 1,
-1.326554, 1.491753, -0.1751541, 1, 0.5647059, 0, 1,
-1.307529, -1.521665, -2.662166, 1, 0.5686275, 0, 1,
-1.298115, 0.3829993, -3.162976, 1, 0.5764706, 0, 1,
-1.283804, -0.1962273, -2.582494, 1, 0.5803922, 0, 1,
-1.283589, -0.730959, -2.017012, 1, 0.5882353, 0, 1,
-1.27247, 0.1014627, -1.589442, 1, 0.5921569, 0, 1,
-1.271134, -0.2807925, -3.006732, 1, 0.6, 0, 1,
-1.269876, 1.652284, -0.3906589, 1, 0.6078432, 0, 1,
-1.267459, -0.9501631, -4.271047, 1, 0.6117647, 0, 1,
-1.266064, -1.852555, -3.643173, 1, 0.6196079, 0, 1,
-1.253515, -0.3578321, -1.226756, 1, 0.6235294, 0, 1,
-1.248626, 0.1166192, -2.201378, 1, 0.6313726, 0, 1,
-1.245479, 0.5885164, -0.7086223, 1, 0.6352941, 0, 1,
-1.241614, -0.3857272, -3.220156, 1, 0.6431373, 0, 1,
-1.237059, -2.257416, -1.821082, 1, 0.6470588, 0, 1,
-1.220001, -0.4039309, -3.71484, 1, 0.654902, 0, 1,
-1.219884, 1.148273, -1.323103, 1, 0.6588235, 0, 1,
-1.218634, -0.2848107, -0.8402517, 1, 0.6666667, 0, 1,
-1.213715, -2.279184, -2.615474, 1, 0.6705883, 0, 1,
-1.212305, 0.3698362, 0.1677275, 1, 0.6784314, 0, 1,
-1.211898, 1.58598, -1.901724, 1, 0.682353, 0, 1,
-1.20384, -0.1997444, -1.907391, 1, 0.6901961, 0, 1,
-1.199768, 0.6149203, -1.039588, 1, 0.6941177, 0, 1,
-1.198736, 1.034175, -1.772988, 1, 0.7019608, 0, 1,
-1.192568, 0.01836165, -3.047017, 1, 0.7098039, 0, 1,
-1.192168, -2.985831, -3.595725, 1, 0.7137255, 0, 1,
-1.189595, -2.031402, -2.307674, 1, 0.7215686, 0, 1,
-1.185584, 1.08922, -1.917814, 1, 0.7254902, 0, 1,
-1.18057, 0.8176643, -0.4841485, 1, 0.7333333, 0, 1,
-1.176927, 1.647243, 1.216498, 1, 0.7372549, 0, 1,
-1.165255, 0.6982943, -1.785652, 1, 0.7450981, 0, 1,
-1.156354, 1.455348, 0.6437331, 1, 0.7490196, 0, 1,
-1.154116, 1.139497, -1.357424, 1, 0.7568628, 0, 1,
-1.152661, 0.1422019, -1.571935, 1, 0.7607843, 0, 1,
-1.151075, -0.536696, -2.645864, 1, 0.7686275, 0, 1,
-1.150855, -0.8809443, -3.005338, 1, 0.772549, 0, 1,
-1.145159, 0.8932537, 1.089531, 1, 0.7803922, 0, 1,
-1.142387, 0.3912556, -0.2955743, 1, 0.7843137, 0, 1,
-1.137174, 1.343203, -1.103281, 1, 0.7921569, 0, 1,
-1.119676, -0.3403134, -2.049245, 1, 0.7960784, 0, 1,
-1.119604, 0.5675347, -0.2570709, 1, 0.8039216, 0, 1,
-1.108998, -0.9253139, -1.959645, 1, 0.8117647, 0, 1,
-1.104447, -1.847186, -4.836653, 1, 0.8156863, 0, 1,
-1.102139, 0.1114505, -1.363949, 1, 0.8235294, 0, 1,
-1.099714, 0.4338737, -3.543159, 1, 0.827451, 0, 1,
-1.09711, -1.635334, -3.172086, 1, 0.8352941, 0, 1,
-1.094702, 0.1181134, -1.582807, 1, 0.8392157, 0, 1,
-1.090303, -0.3788389, -1.794561, 1, 0.8470588, 0, 1,
-1.090259, -0.595464, -1.237851, 1, 0.8509804, 0, 1,
-1.071072, 0.8302996, -0.6175822, 1, 0.8588235, 0, 1,
-1.058128, -0.4136102, -2.11703, 1, 0.8627451, 0, 1,
-1.055645, -0.7964401, -1.653917, 1, 0.8705882, 0, 1,
-1.04392, -0.6318779, -2.857473, 1, 0.8745098, 0, 1,
-1.04192, -0.7076988, -1.859599, 1, 0.8823529, 0, 1,
-1.034478, -0.6680398, -2.584023, 1, 0.8862745, 0, 1,
-1.031097, -0.1298284, -1.519223, 1, 0.8941177, 0, 1,
-1.026819, -0.3512705, -2.239819, 1, 0.8980392, 0, 1,
-1.025075, -0.1526461, -1.359575, 1, 0.9058824, 0, 1,
-1.018642, -1.357602, -2.341779, 1, 0.9137255, 0, 1,
-1.014697, -0.5833095, -1.971887, 1, 0.9176471, 0, 1,
-1.007618, -1.449069, -2.674813, 1, 0.9254902, 0, 1,
-1.004096, 1.119174, 1.57187, 1, 0.9294118, 0, 1,
-0.9997535, -1.285108, -3.072906, 1, 0.9372549, 0, 1,
-0.9921731, 0.3859522, -1.790475, 1, 0.9411765, 0, 1,
-0.9908524, 0.9486961, -0.962847, 1, 0.9490196, 0, 1,
-0.9876831, -0.1123646, -3.297004, 1, 0.9529412, 0, 1,
-0.9876086, -1.131504, -1.820347, 1, 0.9607843, 0, 1,
-0.9869702, 0.2458664, -0.8255046, 1, 0.9647059, 0, 1,
-0.9858934, 0.2642519, -1.535468, 1, 0.972549, 0, 1,
-0.985044, -1.51893, -2.126114, 1, 0.9764706, 0, 1,
-0.9844989, -0.2307649, -1.210829, 1, 0.9843137, 0, 1,
-0.9837513, -0.2374207, -1.275679, 1, 0.9882353, 0, 1,
-0.9809945, 0.8202183, -0.0465373, 1, 0.9960784, 0, 1,
-0.9749973, 0.8869253, -2.884415, 0.9960784, 1, 0, 1,
-0.9583894, 0.5119644, -1.784483, 0.9921569, 1, 0, 1,
-0.9391376, -0.6363025, -2.736827, 0.9843137, 1, 0, 1,
-0.9390551, -0.3090748, -1.708564, 0.9803922, 1, 0, 1,
-0.936553, -1.172773, -0.5144376, 0.972549, 1, 0, 1,
-0.9362024, 0.2118667, -0.7998487, 0.9686275, 1, 0, 1,
-0.934619, -0.8430662, -1.501026, 0.9607843, 1, 0, 1,
-0.933326, -0.8613651, -2.579635, 0.9568627, 1, 0, 1,
-0.9272178, -0.1116278, -2.97866, 0.9490196, 1, 0, 1,
-0.9232825, 1.612145, 1.066844, 0.945098, 1, 0, 1,
-0.9227969, 0.9952021, -1.302537, 0.9372549, 1, 0, 1,
-0.9153, 0.02488103, -1.394198, 0.9333333, 1, 0, 1,
-0.9085758, -1.862045, -4.449147, 0.9254902, 1, 0, 1,
-0.9084122, 0.8962798, -2.091483, 0.9215686, 1, 0, 1,
-0.9079159, -1.277789, -1.812644, 0.9137255, 1, 0, 1,
-0.9053057, -1.108731, -1.185084, 0.9098039, 1, 0, 1,
-0.9023665, 1.083638, -1.74471, 0.9019608, 1, 0, 1,
-0.8972532, -0.2555656, -2.021911, 0.8941177, 1, 0, 1,
-0.8940129, 0.6235269, -2.843864, 0.8901961, 1, 0, 1,
-0.8912335, 0.08949593, -1.181018, 0.8823529, 1, 0, 1,
-0.8860188, -0.0935633, -0.9245335, 0.8784314, 1, 0, 1,
-0.8844881, -0.06746975, -2.221551, 0.8705882, 1, 0, 1,
-0.8796455, 1.302494, -0.1061562, 0.8666667, 1, 0, 1,
-0.8789897, -0.6141112, -0.7545462, 0.8588235, 1, 0, 1,
-0.8786328, -0.1020831, -1.131024, 0.854902, 1, 0, 1,
-0.8760047, -0.2014366, -4.12277, 0.8470588, 1, 0, 1,
-0.8753214, 0.4951876, -2.722383, 0.8431373, 1, 0, 1,
-0.8659891, -0.2925366, -1.401092, 0.8352941, 1, 0, 1,
-0.853969, 1.179356, 0.4974935, 0.8313726, 1, 0, 1,
-0.8445222, -0.0755491, -1.622076, 0.8235294, 1, 0, 1,
-0.8371587, 0.7015063, -1.489204, 0.8196079, 1, 0, 1,
-0.8288485, 0.007868871, -2.617579, 0.8117647, 1, 0, 1,
-0.8276381, -1.11034, -1.508562, 0.8078431, 1, 0, 1,
-0.8248404, -2.77659, -3.045216, 0.8, 1, 0, 1,
-0.824634, 0.03133464, -1.866264, 0.7921569, 1, 0, 1,
-0.8168522, -0.1010297, -0.7245296, 0.7882353, 1, 0, 1,
-0.8159963, -0.1864737, -0.4036429, 0.7803922, 1, 0, 1,
-0.8126081, -0.4805138, -1.90576, 0.7764706, 1, 0, 1,
-0.8119298, 0.2763843, -0.9576298, 0.7686275, 1, 0, 1,
-0.8001592, 0.5379738, 0.07082485, 0.7647059, 1, 0, 1,
-0.7967582, -0.04959319, -0.6840016, 0.7568628, 1, 0, 1,
-0.7939575, 0.5047131, -1.846377, 0.7529412, 1, 0, 1,
-0.7924188, -0.3771141, -1.282385, 0.7450981, 1, 0, 1,
-0.7913907, 0.3171417, -0.8373005, 0.7411765, 1, 0, 1,
-0.7910488, -1.239864, -1.736935, 0.7333333, 1, 0, 1,
-0.7897528, -0.6699396, -1.082656, 0.7294118, 1, 0, 1,
-0.7878909, -2.305263, -2.794915, 0.7215686, 1, 0, 1,
-0.7821331, -0.1642147, -0.444795, 0.7176471, 1, 0, 1,
-0.7793471, -1.701638, -3.455008, 0.7098039, 1, 0, 1,
-0.7790696, 0.9716065, -0.2110148, 0.7058824, 1, 0, 1,
-0.7734618, 0.5218732, -0.7987392, 0.6980392, 1, 0, 1,
-0.7719934, 1.031233, -0.6632527, 0.6901961, 1, 0, 1,
-0.7685434, 1.568416, -1.849329, 0.6862745, 1, 0, 1,
-0.7659965, -0.3763294, -1.809569, 0.6784314, 1, 0, 1,
-0.7616795, 0.4770462, -0.1574996, 0.6745098, 1, 0, 1,
-0.7604762, -0.171828, -2.868426, 0.6666667, 1, 0, 1,
-0.7596436, -0.8827919, -3.133953, 0.6627451, 1, 0, 1,
-0.7595092, 0.4960406, 0.5713784, 0.654902, 1, 0, 1,
-0.7567741, -0.609362, -2.543042, 0.6509804, 1, 0, 1,
-0.7555284, -0.09900578, -2.355206, 0.6431373, 1, 0, 1,
-0.7545522, -0.4680161, 0.8511894, 0.6392157, 1, 0, 1,
-0.7543336, -0.8099812, -2.991558, 0.6313726, 1, 0, 1,
-0.746994, -0.6763341, -3.913296, 0.627451, 1, 0, 1,
-0.7454212, 1.140822, -1.048469, 0.6196079, 1, 0, 1,
-0.7427312, -0.7907711, -1.911118, 0.6156863, 1, 0, 1,
-0.7340866, -0.3446871, -1.898402, 0.6078432, 1, 0, 1,
-0.7207968, 0.3306747, -0.3659233, 0.6039216, 1, 0, 1,
-0.7177647, 1.23956, -0.7815686, 0.5960785, 1, 0, 1,
-0.7127684, -0.040301, -0.49998, 0.5882353, 1, 0, 1,
-0.7126039, -1.247248, -2.303948, 0.5843138, 1, 0, 1,
-0.7119097, 1.117542, -1.452594, 0.5764706, 1, 0, 1,
-0.7107269, -1.685098, -1.582002, 0.572549, 1, 0, 1,
-0.7037236, 0.829731, -2.616179, 0.5647059, 1, 0, 1,
-0.6942315, -0.06290596, -1.488903, 0.5607843, 1, 0, 1,
-0.693643, 0.06604236, -3.44144, 0.5529412, 1, 0, 1,
-0.6923637, -1.087068, -1.854654, 0.5490196, 1, 0, 1,
-0.6920364, 0.9441682, -0.3725403, 0.5411765, 1, 0, 1,
-0.6895964, -2.346366, -2.845633, 0.5372549, 1, 0, 1,
-0.6885253, 1.354824, -0.927038, 0.5294118, 1, 0, 1,
-0.6860005, -0.5344014, -1.407165, 0.5254902, 1, 0, 1,
-0.6807489, -1.244911, -3.484029, 0.5176471, 1, 0, 1,
-0.6804425, 2.237623, -0.09952705, 0.5137255, 1, 0, 1,
-0.6691115, -0.1337651, -1.182996, 0.5058824, 1, 0, 1,
-0.6659053, -0.04949897, -0.4566011, 0.5019608, 1, 0, 1,
-0.6650538, -1.636976, -2.112082, 0.4941176, 1, 0, 1,
-0.6647391, 0.5433346, -0.6800274, 0.4862745, 1, 0, 1,
-0.6598399, -0.3656586, -1.981487, 0.4823529, 1, 0, 1,
-0.656889, 0.1682077, -3.397773, 0.4745098, 1, 0, 1,
-0.6559379, -0.6154816, -3.672479, 0.4705882, 1, 0, 1,
-0.6526302, -0.04169627, -0.6873529, 0.4627451, 1, 0, 1,
-0.6520361, 0.4388039, 1.565505, 0.4588235, 1, 0, 1,
-0.6501935, -0.8714523, -1.901849, 0.4509804, 1, 0, 1,
-0.6486738, 0.05742931, -2.51791, 0.4470588, 1, 0, 1,
-0.6462135, 0.7021048, 1.365926, 0.4392157, 1, 0, 1,
-0.6388333, 1.225416, -1.223784, 0.4352941, 1, 0, 1,
-0.6380135, 0.2369734, -1.288199, 0.427451, 1, 0, 1,
-0.6365579, -0.4198861, -2.339894, 0.4235294, 1, 0, 1,
-0.6361601, -0.9275218, -2.891196, 0.4156863, 1, 0, 1,
-0.6312677, 0.345604, -1.724879, 0.4117647, 1, 0, 1,
-0.6304526, 0.05963163, -1.157017, 0.4039216, 1, 0, 1,
-0.6288537, 0.3507448, -0.6548408, 0.3960784, 1, 0, 1,
-0.628634, 0.9177726, -0.5633481, 0.3921569, 1, 0, 1,
-0.6286294, -0.608822, -4.062461, 0.3843137, 1, 0, 1,
-0.6279024, 0.3558204, -1.134734, 0.3803922, 1, 0, 1,
-0.6265689, -0.02431999, -1.087233, 0.372549, 1, 0, 1,
-0.6207421, -0.3684407, -2.471809, 0.3686275, 1, 0, 1,
-0.6163455, -0.66254, -2.472742, 0.3607843, 1, 0, 1,
-0.6148385, 1.488352, -0.7584347, 0.3568628, 1, 0, 1,
-0.6122537, -0.3414025, -1.392645, 0.3490196, 1, 0, 1,
-0.6089236, -0.7229651, -2.900851, 0.345098, 1, 0, 1,
-0.6076481, 0.870749, -1.732264, 0.3372549, 1, 0, 1,
-0.6056103, -1.014181, -1.210802, 0.3333333, 1, 0, 1,
-0.5975332, 0.005409527, -2.343265, 0.3254902, 1, 0, 1,
-0.593433, -1.139732, -3.970214, 0.3215686, 1, 0, 1,
-0.5927508, 0.8128601, -0.6564006, 0.3137255, 1, 0, 1,
-0.5922872, -2.554557, -3.760728, 0.3098039, 1, 0, 1,
-0.5921609, -1.138156, -2.926009, 0.3019608, 1, 0, 1,
-0.5920755, -1.680077, -2.756542, 0.2941177, 1, 0, 1,
-0.5903186, -0.905474, -2.033571, 0.2901961, 1, 0, 1,
-0.5877126, -1.284281, -2.000028, 0.282353, 1, 0, 1,
-0.5832744, -1.276909, -1.371992, 0.2784314, 1, 0, 1,
-0.5827393, -0.1996932, -1.615475, 0.2705882, 1, 0, 1,
-0.5710589, -0.1031395, -3.421431, 0.2666667, 1, 0, 1,
-0.5638657, 1.64795, -0.3174256, 0.2588235, 1, 0, 1,
-0.5611355, -0.7709476, -3.550389, 0.254902, 1, 0, 1,
-0.5562122, 0.5006022, -1.513184, 0.2470588, 1, 0, 1,
-0.5530416, 0.3899402, -0.7884315, 0.2431373, 1, 0, 1,
-0.5483008, 1.364213, 1.090922, 0.2352941, 1, 0, 1,
-0.5458808, 0.1046671, -1.146279, 0.2313726, 1, 0, 1,
-0.5410345, -0.04713476, -2.268023, 0.2235294, 1, 0, 1,
-0.5406372, -0.7119586, -4.866589, 0.2196078, 1, 0, 1,
-0.5397072, 0.8794061, -3.401469, 0.2117647, 1, 0, 1,
-0.5327516, 1.751632, 0.7562516, 0.2078431, 1, 0, 1,
-0.5261658, 1.156144, 1.115263, 0.2, 1, 0, 1,
-0.5216938, -1.808347, -4.243945, 0.1921569, 1, 0, 1,
-0.52078, -2.157409, -4.452795, 0.1882353, 1, 0, 1,
-0.5195586, 0.6903855, -0.2424764, 0.1803922, 1, 0, 1,
-0.5187259, 0.4429649, -1.618877, 0.1764706, 1, 0, 1,
-0.517574, 1.324174, 1.053416, 0.1686275, 1, 0, 1,
-0.5169179, -1.452563, -2.961451, 0.1647059, 1, 0, 1,
-0.5124434, 1.345437, -2.832894, 0.1568628, 1, 0, 1,
-0.5110422, -0.7796686, -1.720284, 0.1529412, 1, 0, 1,
-0.5073873, 1.805985, 1.215324, 0.145098, 1, 0, 1,
-0.5043702, 0.02103037, -1.11769, 0.1411765, 1, 0, 1,
-0.5033435, -0.8748997, -3.271092, 0.1333333, 1, 0, 1,
-0.5030175, -1.522858, -3.923376, 0.1294118, 1, 0, 1,
-0.5010861, 1.187743, -1.716217, 0.1215686, 1, 0, 1,
-0.4983679, 1.936849, -0.8357878, 0.1176471, 1, 0, 1,
-0.4976746, 0.7567999, -0.3964906, 0.1098039, 1, 0, 1,
-0.496823, -0.4505953, 0.05816649, 0.1058824, 1, 0, 1,
-0.4923056, -0.4476404, -2.394262, 0.09803922, 1, 0, 1,
-0.489296, 0.4509924, -0.7052066, 0.09019608, 1, 0, 1,
-0.4892292, -0.1864806, -1.234889, 0.08627451, 1, 0, 1,
-0.4846851, 1.133299, -0.07717238, 0.07843138, 1, 0, 1,
-0.4826152, -0.7346067, -2.370415, 0.07450981, 1, 0, 1,
-0.4816443, -0.4044223, -3.38581, 0.06666667, 1, 0, 1,
-0.4815275, -0.1769639, -1.662321, 0.0627451, 1, 0, 1,
-0.4782431, 0.3609392, -1.135325, 0.05490196, 1, 0, 1,
-0.4763844, -0.07463921, -0.5383353, 0.05098039, 1, 0, 1,
-0.4716932, -0.423645, -1.983357, 0.04313726, 1, 0, 1,
-0.4668022, -0.8710848, -2.630872, 0.03921569, 1, 0, 1,
-0.4652835, 0.06740931, -0.4704397, 0.03137255, 1, 0, 1,
-0.4650457, -0.06383248, -0.6485885, 0.02745098, 1, 0, 1,
-0.461033, -0.6957801, -3.28118, 0.01960784, 1, 0, 1,
-0.4562522, -0.3650354, -2.930328, 0.01568628, 1, 0, 1,
-0.4546531, -1.023643, -1.811897, 0.007843138, 1, 0, 1,
-0.4378867, -0.7300763, -2.098105, 0.003921569, 1, 0, 1,
-0.4374554, 0.1251534, 0.08060007, 0, 1, 0.003921569, 1,
-0.4337199, -0.6115999, -1.561811, 0, 1, 0.01176471, 1,
-0.4320535, 1.46918, 1.41545, 0, 1, 0.01568628, 1,
-0.430689, -0.6378008, -1.806794, 0, 1, 0.02352941, 1,
-0.4291239, 1.353521, -0.8837011, 0, 1, 0.02745098, 1,
-0.4282686, -0.04209121, -1.568761, 0, 1, 0.03529412, 1,
-0.4155214, 1.458114, -0.9075555, 0, 1, 0.03921569, 1,
-0.4125373, 0.3884534, -1.815227, 0, 1, 0.04705882, 1,
-0.4098927, 1.897991, -0.04989057, 0, 1, 0.05098039, 1,
-0.4063649, -0.01647367, -2.129192, 0, 1, 0.05882353, 1,
-0.4042596, -0.1385818, -3.273474, 0, 1, 0.0627451, 1,
-0.4034405, 0.5825456, 0.01552616, 0, 1, 0.07058824, 1,
-0.4002931, -0.6972193, -2.94936, 0, 1, 0.07450981, 1,
-0.3968817, -0.1208553, -2.901335, 0, 1, 0.08235294, 1,
-0.3966395, -0.3079424, -0.6280698, 0, 1, 0.08627451, 1,
-0.3963472, -1.536022, -3.964493, 0, 1, 0.09411765, 1,
-0.3960568, -0.06323583, -1.619727, 0, 1, 0.1019608, 1,
-0.3925736, 0.4105715, -1.022924, 0, 1, 0.1058824, 1,
-0.3891506, 0.3706569, -0.6138768, 0, 1, 0.1137255, 1,
-0.389009, 1.14796, 0.7292448, 0, 1, 0.1176471, 1,
-0.3864881, 0.3332149, 0.3342117, 0, 1, 0.1254902, 1,
-0.3863384, 1.307166, 0.1952886, 0, 1, 0.1294118, 1,
-0.383085, -0.4836297, -2.20327, 0, 1, 0.1372549, 1,
-0.38287, 0.5726072, 0.2542316, 0, 1, 0.1411765, 1,
-0.37979, -1.275971, -2.164365, 0, 1, 0.1490196, 1,
-0.3788063, -0.5093578, -3.526643, 0, 1, 0.1529412, 1,
-0.3763305, -0.03362725, -2.415307, 0, 1, 0.1607843, 1,
-0.3762722, -0.2990074, -0.5724519, 0, 1, 0.1647059, 1,
-0.3754034, -0.4629212, -3.076681, 0, 1, 0.172549, 1,
-0.3713522, -0.05215592, -2.339092, 0, 1, 0.1764706, 1,
-0.3702863, 0.151748, -1.062452, 0, 1, 0.1843137, 1,
-0.3655484, -0.3390541, -2.222411, 0, 1, 0.1882353, 1,
-0.3654663, -1.82484, -1.335009, 0, 1, 0.1960784, 1,
-0.3633044, 0.6986488, 1.726035, 0, 1, 0.2039216, 1,
-0.3631319, -0.1453052, -0.3640078, 0, 1, 0.2078431, 1,
-0.362465, -0.6843597, -1.635474, 0, 1, 0.2156863, 1,
-0.3572848, 0.1057594, 0.1745974, 0, 1, 0.2196078, 1,
-0.3572352, -1.720727, -2.202537, 0, 1, 0.227451, 1,
-0.3568369, 0.7126842, -2.19811, 0, 1, 0.2313726, 1,
-0.3562927, -0.2253137, -2.653557, 0, 1, 0.2392157, 1,
-0.355081, -0.594209, -2.989255, 0, 1, 0.2431373, 1,
-0.3541877, -0.7844878, -2.331696, 0, 1, 0.2509804, 1,
-0.349372, -0.120777, -0.2769689, 0, 1, 0.254902, 1,
-0.3475461, -0.3003833, -2.081253, 0, 1, 0.2627451, 1,
-0.3447901, -1.453555, -3.116566, 0, 1, 0.2666667, 1,
-0.3442505, 0.473888, -0.06475484, 0, 1, 0.2745098, 1,
-0.3433569, -0.4228817, -2.057274, 0, 1, 0.2784314, 1,
-0.3385051, -1.148457, -2.757576, 0, 1, 0.2862745, 1,
-0.3372862, 1.442426, 0.9145534, 0, 1, 0.2901961, 1,
-0.335378, -0.889422, -2.659881, 0, 1, 0.2980392, 1,
-0.3290286, 0.3622516, -1.324164, 0, 1, 0.3058824, 1,
-0.3269216, 0.002721263, -1.807229, 0, 1, 0.3098039, 1,
-0.3174386, 0.9561716, 0.1497227, 0, 1, 0.3176471, 1,
-0.3157058, 1.177532, -0.09145176, 0, 1, 0.3215686, 1,
-0.3153118, -0.7732192, -1.616567, 0, 1, 0.3294118, 1,
-0.3144337, -0.7507401, -3.265209, 0, 1, 0.3333333, 1,
-0.3142118, 0.5697682, -0.7611877, 0, 1, 0.3411765, 1,
-0.3134497, 0.6310291, -1.918355, 0, 1, 0.345098, 1,
-0.3133941, 0.5289932, 0.2301046, 0, 1, 0.3529412, 1,
-0.3103221, 1.239349, 0.6178654, 0, 1, 0.3568628, 1,
-0.3093743, 0.8330826, -1.923125, 0, 1, 0.3647059, 1,
-0.3054383, -0.3220578, -1.647612, 0, 1, 0.3686275, 1,
-0.304775, -0.2808953, -2.710671, 0, 1, 0.3764706, 1,
-0.30056, -1.039899, -1.418602, 0, 1, 0.3803922, 1,
-0.2990524, 1.561471, 0.8157094, 0, 1, 0.3882353, 1,
-0.2980025, 0.5574594, -1.570952, 0, 1, 0.3921569, 1,
-0.2972409, -0.06445839, -3.138064, 0, 1, 0.4, 1,
-0.2969138, 0.5185161, -2.425107, 0, 1, 0.4078431, 1,
-0.2942815, -1.162564, -2.628515, 0, 1, 0.4117647, 1,
-0.2941161, -1.872273, -1.380412, 0, 1, 0.4196078, 1,
-0.2912277, -0.1232498, -2.726218, 0, 1, 0.4235294, 1,
-0.2811434, -0.1495763, -1.590737, 0, 1, 0.4313726, 1,
-0.2760387, -1.298531, -3.840234, 0, 1, 0.4352941, 1,
-0.2744897, -0.1568547, -1.887003, 0, 1, 0.4431373, 1,
-0.2720885, -0.9341916, -3.535183, 0, 1, 0.4470588, 1,
-0.2682752, 0.2754555, -2.30441, 0, 1, 0.454902, 1,
-0.2680456, -0.5064707, -1.982003, 0, 1, 0.4588235, 1,
-0.2677246, -0.08731899, -2.109305, 0, 1, 0.4666667, 1,
-0.2595208, -0.5930098, -2.330701, 0, 1, 0.4705882, 1,
-0.2588023, 0.7576652, -0.5839159, 0, 1, 0.4784314, 1,
-0.2579658, 0.8944727, 2.92589, 0, 1, 0.4823529, 1,
-0.2574299, -1.215421, -2.547611, 0, 1, 0.4901961, 1,
-0.254806, 1.051668, 0.5876785, 0, 1, 0.4941176, 1,
-0.253642, 0.5662408, -0.1530748, 0, 1, 0.5019608, 1,
-0.2472103, -3.492359, -4.878583, 0, 1, 0.509804, 1,
-0.2451283, 1.543563, 1.621068, 0, 1, 0.5137255, 1,
-0.2439913, 1.274422, -0.4503371, 0, 1, 0.5215687, 1,
-0.2435386, -0.6512423, -3.657614, 0, 1, 0.5254902, 1,
-0.2417861, -0.06165731, -0.9074355, 0, 1, 0.5333334, 1,
-0.2343173, 0.155576, -1.645965, 0, 1, 0.5372549, 1,
-0.2249909, -0.1727603, -1.927825, 0, 1, 0.5450981, 1,
-0.2244869, -0.1366169, -3.364522, 0, 1, 0.5490196, 1,
-0.2210482, 0.3875476, -0.2197615, 0, 1, 0.5568628, 1,
-0.215679, 0.7388933, -0.5066169, 0, 1, 0.5607843, 1,
-0.2153697, -1.042132, -2.482251, 0, 1, 0.5686275, 1,
-0.2149167, -0.4666056, -3.498141, 0, 1, 0.572549, 1,
-0.2136313, 0.14001, -1.730354, 0, 1, 0.5803922, 1,
-0.211791, -0.2976241, -2.610652, 0, 1, 0.5843138, 1,
-0.2099734, -0.9714332, -3.481169, 0, 1, 0.5921569, 1,
-0.2041324, -1.719433, -3.943097, 0, 1, 0.5960785, 1,
-0.203907, 0.6485667, 0.01411465, 0, 1, 0.6039216, 1,
-0.1972245, -0.07447057, -2.871305, 0, 1, 0.6117647, 1,
-0.1967076, 0.7831838, -1.801501, 0, 1, 0.6156863, 1,
-0.1958863, -2.286335, -2.202713, 0, 1, 0.6235294, 1,
-0.1918711, 1.437721, 0.519837, 0, 1, 0.627451, 1,
-0.1909794, -0.752087, -2.714181, 0, 1, 0.6352941, 1,
-0.1901557, 0.8197626, -0.9837273, 0, 1, 0.6392157, 1,
-0.1830973, -1.105644, -1.899859, 0, 1, 0.6470588, 1,
-0.1604962, 0.5735987, 1.587011, 0, 1, 0.6509804, 1,
-0.1579096, 0.3593381, 0.6441666, 0, 1, 0.6588235, 1,
-0.1570745, 0.79185, 1.279924, 0, 1, 0.6627451, 1,
-0.1569185, -0.3052822, -2.529209, 0, 1, 0.6705883, 1,
-0.1567768, 1.466145, 0.8168145, 0, 1, 0.6745098, 1,
-0.1539609, 0.7843256, -0.4352784, 0, 1, 0.682353, 1,
-0.1494285, -1.585623, -1.686326, 0, 1, 0.6862745, 1,
-0.1473797, -0.5781233, -3.281018, 0, 1, 0.6941177, 1,
-0.1457266, 0.9970946, -1.446608, 0, 1, 0.7019608, 1,
-0.1439918, -1.41003, -4.707467, 0, 1, 0.7058824, 1,
-0.1429832, 1.248487, -2.146618, 0, 1, 0.7137255, 1,
-0.140982, -0.4220313, -3.34268, 0, 1, 0.7176471, 1,
-0.1404916, 0.3082159, 0.5194751, 0, 1, 0.7254902, 1,
-0.1402274, 1.841232, -1.351015, 0, 1, 0.7294118, 1,
-0.1398823, -0.1886863, -1.573883, 0, 1, 0.7372549, 1,
-0.1397956, 0.9807276, 0.659273, 0, 1, 0.7411765, 1,
-0.1390287, 0.3603783, -2.721214, 0, 1, 0.7490196, 1,
-0.1378772, 0.119199, -1.146749, 0, 1, 0.7529412, 1,
-0.1372923, 0.2565902, 0.06059176, 0, 1, 0.7607843, 1,
-0.1334141, -0.126116, -1.685825, 0, 1, 0.7647059, 1,
-0.1228469, -1.07113, -3.60927, 0, 1, 0.772549, 1,
-0.1199195, 1.877297, -3.028801, 0, 1, 0.7764706, 1,
-0.1176765, 2.69101, -0.565958, 0, 1, 0.7843137, 1,
-0.1153085, 0.3550263, -0.9622871, 0, 1, 0.7882353, 1,
-0.1143452, 1.160125, 0.4683892, 0, 1, 0.7960784, 1,
-0.11387, -0.5022287, -4.424726, 0, 1, 0.8039216, 1,
-0.11135, 0.9465523, -0.3094946, 0, 1, 0.8078431, 1,
-0.105827, 0.2682434, -0.8119277, 0, 1, 0.8156863, 1,
-0.1048054, -0.4660661, -3.042393, 0, 1, 0.8196079, 1,
-0.10246, 0.5525089, -1.078319, 0, 1, 0.827451, 1,
-0.1018753, 0.1459326, -0.08044463, 0, 1, 0.8313726, 1,
-0.09551431, -0.6518232, -4.189107, 0, 1, 0.8392157, 1,
-0.09392479, -0.2445204, -3.171689, 0, 1, 0.8431373, 1,
-0.08433639, 0.5344133, -0.7124957, 0, 1, 0.8509804, 1,
-0.08083104, 0.2267974, -0.7345939, 0, 1, 0.854902, 1,
-0.07410973, 0.9279115, -2.058452, 0, 1, 0.8627451, 1,
-0.07047249, 1.537816, 0.003408422, 0, 1, 0.8666667, 1,
-0.06829514, -0.4879798, -3.921361, 0, 1, 0.8745098, 1,
-0.06320047, 2.072108, 0.5528859, 0, 1, 0.8784314, 1,
-0.05218265, 1.218426, -0.8251334, 0, 1, 0.8862745, 1,
-0.05151109, -0.3784716, -3.799894, 0, 1, 0.8901961, 1,
-0.05111032, -0.7019857, -4.985834, 0, 1, 0.8980392, 1,
-0.05077599, -0.7406929, -4.823617, 0, 1, 0.9058824, 1,
-0.04997164, 0.3316608, -0.1715195, 0, 1, 0.9098039, 1,
-0.04940726, 0.596473, -0.3927781, 0, 1, 0.9176471, 1,
-0.04815814, -1.025491, -4.869811, 0, 1, 0.9215686, 1,
-0.04595586, 0.8927752, 1.150024, 0, 1, 0.9294118, 1,
-0.0451897, 0.1081833, -1.233343, 0, 1, 0.9333333, 1,
-0.0448571, 0.139046, 0.7851645, 0, 1, 0.9411765, 1,
-0.04074921, 1.737756, 1.136368, 0, 1, 0.945098, 1,
-0.03861367, -2.288593, -1.743981, 0, 1, 0.9529412, 1,
-0.03514578, 0.6030036, 1.417082, 0, 1, 0.9568627, 1,
-0.03231117, -0.2082924, -4.042259, 0, 1, 0.9647059, 1,
-0.03167814, 0.4451125, 0.2570772, 0, 1, 0.9686275, 1,
-0.02836983, -0.5989402, -1.973934, 0, 1, 0.9764706, 1,
-0.02462544, -0.9580395, -3.142407, 0, 1, 0.9803922, 1,
-0.02228525, 1.305292, -0.4395026, 0, 1, 0.9882353, 1,
-0.01342642, 0.8377993, 1.628045, 0, 1, 0.9921569, 1,
-0.01098199, 1.471128, 1.137458, 0, 1, 1, 1,
-0.008850088, -1.416695, -3.728812, 0, 0.9921569, 1, 1,
-0.008689732, 1.060702, 1.452345, 0, 0.9882353, 1, 1,
-0.007986774, 1.236177, 0.7676315, 0, 0.9803922, 1, 1,
-0.006963498, 0.1554586, -1.219174, 0, 0.9764706, 1, 1,
-0.002094898, 1.332421, -1.123241, 0, 0.9686275, 1, 1,
0.002834257, -0.9828212, 2.707549, 0, 0.9647059, 1, 1,
0.00442119, 0.6325759, 0.5024644, 0, 0.9568627, 1, 1,
0.004617163, 0.1460198, -0.7459903, 0, 0.9529412, 1, 1,
0.006066039, 1.463973, 0.7642126, 0, 0.945098, 1, 1,
0.009307082, -0.1779636, 2.038956, 0, 0.9411765, 1, 1,
0.009798484, -1.119391, 3.99297, 0, 0.9333333, 1, 1,
0.01188901, 0.3529646, 0.9093103, 0, 0.9294118, 1, 1,
0.01749499, 0.1820092, 0.2334332, 0, 0.9215686, 1, 1,
0.02317332, -0.1510756, 1.827835, 0, 0.9176471, 1, 1,
0.0254588, 0.4184129, 1.216074, 0, 0.9098039, 1, 1,
0.03201582, -0.7503327, 2.259206, 0, 0.9058824, 1, 1,
0.03259225, 0.09819499, -0.2558372, 0, 0.8980392, 1, 1,
0.0328727, 0.8343022, -0.7013136, 0, 0.8901961, 1, 1,
0.03382207, -0.07960035, 2.837227, 0, 0.8862745, 1, 1,
0.03981266, 1.344902, -0.2648576, 0, 0.8784314, 1, 1,
0.04090806, -0.2426139, 2.104006, 0, 0.8745098, 1, 1,
0.0414773, -0.7560793, 2.652639, 0, 0.8666667, 1, 1,
0.04182353, 0.2404649, 0.3730752, 0, 0.8627451, 1, 1,
0.04388553, -1.437309, 4.044093, 0, 0.854902, 1, 1,
0.04452655, -1.332774, 2.100256, 0, 0.8509804, 1, 1,
0.04620625, -0.4139498, 0.3955163, 0, 0.8431373, 1, 1,
0.0483572, 0.6282884, 1.008436, 0, 0.8392157, 1, 1,
0.05499095, 2.091605, 1.574014, 0, 0.8313726, 1, 1,
0.05558233, -0.4161522, 4.005054, 0, 0.827451, 1, 1,
0.05702186, -0.07314796, 0.9509387, 0, 0.8196079, 1, 1,
0.06247245, -0.1653683, 1.902442, 0, 0.8156863, 1, 1,
0.06579964, 0.7048778, 0.09704144, 0, 0.8078431, 1, 1,
0.06868429, -1.454878, 5.975411, 0, 0.8039216, 1, 1,
0.07036991, -1.03894, 2.422535, 0, 0.7960784, 1, 1,
0.075011, -0.7634936, 2.7501, 0, 0.7882353, 1, 1,
0.0802275, 1.001902, -0.4758101, 0, 0.7843137, 1, 1,
0.08258858, -0.7490755, 1.970589, 0, 0.7764706, 1, 1,
0.08426875, -0.9309601, 2.687809, 0, 0.772549, 1, 1,
0.08456808, 0.2156729, 0.9774581, 0, 0.7647059, 1, 1,
0.08785935, -0.6779313, 3.700814, 0, 0.7607843, 1, 1,
0.09402026, 0.5723821, -0.5394224, 0, 0.7529412, 1, 1,
0.09402502, 0.7233305, 0.1650763, 0, 0.7490196, 1, 1,
0.09442487, 1.689327, -1.512092, 0, 0.7411765, 1, 1,
0.09553263, -0.6256264, 3.579501, 0, 0.7372549, 1, 1,
0.09654382, 1.040382, 0.4605398, 0, 0.7294118, 1, 1,
0.1004798, -0.02812584, 3.709556, 0, 0.7254902, 1, 1,
0.1014144, -0.3889059, 5.033895, 0, 0.7176471, 1, 1,
0.1015378, -0.2176366, 1.392161, 0, 0.7137255, 1, 1,
0.102583, -1.222113, 4.631312, 0, 0.7058824, 1, 1,
0.1086967, 0.2238949, 1.968495, 0, 0.6980392, 1, 1,
0.1089262, -0.2237602, 1.96472, 0, 0.6941177, 1, 1,
0.1141345, -0.631644, 2.508866, 0, 0.6862745, 1, 1,
0.1167302, 0.7353448, 1.87658, 0, 0.682353, 1, 1,
0.1187454, -2.226701, 2.547154, 0, 0.6745098, 1, 1,
0.1196393, 0.8122723, -0.6653136, 0, 0.6705883, 1, 1,
0.1199697, -2.380218, 2.634747, 0, 0.6627451, 1, 1,
0.1200688, -1.063915, 2.27006, 0, 0.6588235, 1, 1,
0.1242302, 1.071459, 1.257952, 0, 0.6509804, 1, 1,
0.1257855, 0.2068221, -0.9521391, 0, 0.6470588, 1, 1,
0.1280827, 1.10368, 1.208945, 0, 0.6392157, 1, 1,
0.1285335, 0.7368134, -0.2533762, 0, 0.6352941, 1, 1,
0.133127, -0.4099364, 1.216316, 0, 0.627451, 1, 1,
0.1449772, 1.07227, 0.7297261, 0, 0.6235294, 1, 1,
0.1467917, -0.151515, 4.04182, 0, 0.6156863, 1, 1,
0.1476584, -1.954299, 2.671418, 0, 0.6117647, 1, 1,
0.1477856, -0.5439549, 2.384084, 0, 0.6039216, 1, 1,
0.1522447, 0.734117, -0.2575905, 0, 0.5960785, 1, 1,
0.1541454, 0.08248892, 2.72223, 0, 0.5921569, 1, 1,
0.1550786, 0.6573663, 2.736888, 0, 0.5843138, 1, 1,
0.1560741, -0.9690694, 2.130582, 0, 0.5803922, 1, 1,
0.1570671, 0.4334991, -0.004714881, 0, 0.572549, 1, 1,
0.1595594, 0.5658302, -0.3986652, 0, 0.5686275, 1, 1,
0.1622423, 1.472786, -0.4347211, 0, 0.5607843, 1, 1,
0.16522, -1.460984, 2.844749, 0, 0.5568628, 1, 1,
0.165713, 0.5374889, 0.4569688, 0, 0.5490196, 1, 1,
0.1669181, -1.03221, 1.14163, 0, 0.5450981, 1, 1,
0.1704188, 0.00316563, 0.5182576, 0, 0.5372549, 1, 1,
0.1715134, -0.4057912, 2.536715, 0, 0.5333334, 1, 1,
0.1750573, -0.3552128, 2.21222, 0, 0.5254902, 1, 1,
0.1772309, -1.280651, 0.7303231, 0, 0.5215687, 1, 1,
0.1773865, 0.8900757, -0.03001621, 0, 0.5137255, 1, 1,
0.1905502, -0.1499808, 1.00194, 0, 0.509804, 1, 1,
0.1905766, 1.183615, -0.7113158, 0, 0.5019608, 1, 1,
0.191701, -0.8559625, 2.254159, 0, 0.4941176, 1, 1,
0.2014604, -0.3532827, 3.141531, 0, 0.4901961, 1, 1,
0.2016828, -0.7993753, 2.178071, 0, 0.4823529, 1, 1,
0.2023235, -0.6086854, 3.064272, 0, 0.4784314, 1, 1,
0.2102894, -0.790058, 3.859476, 0, 0.4705882, 1, 1,
0.2149471, -0.4672592, 4.68727, 0, 0.4666667, 1, 1,
0.2175905, -0.4985112, 2.810658, 0, 0.4588235, 1, 1,
0.2199586, 1.766729, 1.183993, 0, 0.454902, 1, 1,
0.2222628, 2.141573, -0.3308315, 0, 0.4470588, 1, 1,
0.2311464, -0.3376402, 2.31969, 0, 0.4431373, 1, 1,
0.2312196, 0.2444215, -0.1627923, 0, 0.4352941, 1, 1,
0.2312401, 0.8455022, 1.054282, 0, 0.4313726, 1, 1,
0.2312854, -0.6646702, 2.839448, 0, 0.4235294, 1, 1,
0.2324401, 0.1298397, -0.3138942, 0, 0.4196078, 1, 1,
0.2347766, 0.3230499, 0.004728961, 0, 0.4117647, 1, 1,
0.2348888, 0.8172219, 0.5319105, 0, 0.4078431, 1, 1,
0.2359666, 0.6446483, 0.9614172, 0, 0.4, 1, 1,
0.23755, 0.879584, 1.956599, 0, 0.3921569, 1, 1,
0.2391609, -1.669905, 2.467977, 0, 0.3882353, 1, 1,
0.2393067, 0.2009716, 0.7076092, 0, 0.3803922, 1, 1,
0.246626, 1.595452, 0.3611917, 0, 0.3764706, 1, 1,
0.2528447, -0.2650023, 1.658879, 0, 0.3686275, 1, 1,
0.2561426, 0.5932686, 1.131014, 0, 0.3647059, 1, 1,
0.2569929, -0.05865686, 0.765394, 0, 0.3568628, 1, 1,
0.2585239, 1.930755, -0.08228303, 0, 0.3529412, 1, 1,
0.2590972, -0.2301136, 1.768141, 0, 0.345098, 1, 1,
0.2656774, 0.07206884, 1.529266, 0, 0.3411765, 1, 1,
0.2709595, -0.3483112, 3.826679, 0, 0.3333333, 1, 1,
0.2741326, 0.8868849, -0.9123894, 0, 0.3294118, 1, 1,
0.2796308, 0.2558664, -2.026754, 0, 0.3215686, 1, 1,
0.2809153, 0.7725981, -0.3365259, 0, 0.3176471, 1, 1,
0.2816707, -0.07528947, -0.4545079, 0, 0.3098039, 1, 1,
0.2855009, -1.311699, 2.050586, 0, 0.3058824, 1, 1,
0.2917958, -1.663949, 3.12267, 0, 0.2980392, 1, 1,
0.2935987, -0.2168564, 1.35341, 0, 0.2901961, 1, 1,
0.2940227, -0.7473318, 2.023946, 0, 0.2862745, 1, 1,
0.296765, -1.33019, 2.673675, 0, 0.2784314, 1, 1,
0.2972265, 1.077572, -0.3456498, 0, 0.2745098, 1, 1,
0.2973479, 0.85675, 0.3905168, 0, 0.2666667, 1, 1,
0.2998678, 1.889154, 0.2081353, 0, 0.2627451, 1, 1,
0.3024006, -0.06251212, 2.522788, 0, 0.254902, 1, 1,
0.3032892, -0.3954804, 1.424438, 0, 0.2509804, 1, 1,
0.3038473, 0.4214018, 0.6301452, 0, 0.2431373, 1, 1,
0.3076336, 0.5470521, 0.8396399, 0, 0.2392157, 1, 1,
0.3095442, 0.3250899, 2.920183, 0, 0.2313726, 1, 1,
0.3103476, 0.4886282, 1.179159, 0, 0.227451, 1, 1,
0.3138624, 0.8107463, 1.43238, 0, 0.2196078, 1, 1,
0.3141733, -1.849378, 3.181901, 0, 0.2156863, 1, 1,
0.31639, 1.085971, -0.6339027, 0, 0.2078431, 1, 1,
0.3206647, 2.414384, 0.9552391, 0, 0.2039216, 1, 1,
0.3245407, -0.8336912, 2.364308, 0, 0.1960784, 1, 1,
0.324773, 0.522955, 0.4865138, 0, 0.1882353, 1, 1,
0.331532, -1.413894, 2.92475, 0, 0.1843137, 1, 1,
0.3345723, -0.2461751, 1.509526, 0, 0.1764706, 1, 1,
0.3350158, 0.2769425, 1.223922, 0, 0.172549, 1, 1,
0.3360723, 1.324775, 2.610461, 0, 0.1647059, 1, 1,
0.3391759, 0.4009787, 1.034078, 0, 0.1607843, 1, 1,
0.3402812, -1.068439, 3.402073, 0, 0.1529412, 1, 1,
0.3477144, 0.07658179, 1.875382, 0, 0.1490196, 1, 1,
0.3481665, -0.2281341, 1.365316, 0, 0.1411765, 1, 1,
0.3526339, -1.092633, 3.159631, 0, 0.1372549, 1, 1,
0.3567067, -0.6678157, 3.115541, 0, 0.1294118, 1, 1,
0.3595052, 1.099545, -0.2536092, 0, 0.1254902, 1, 1,
0.3609976, 2.478006, -1.933761, 0, 0.1176471, 1, 1,
0.3651614, 0.5722344, 0.3234735, 0, 0.1137255, 1, 1,
0.3697117, -2.266309, 1.289662, 0, 0.1058824, 1, 1,
0.3699925, -0.0005033775, 2.706248, 0, 0.09803922, 1, 1,
0.3712607, 0.7863739, -0.08636787, 0, 0.09411765, 1, 1,
0.3722, 0.847126, 1.753795, 0, 0.08627451, 1, 1,
0.3771361, 0.5121247, 1.466964, 0, 0.08235294, 1, 1,
0.3782569, 0.6655731, 2.251234, 0, 0.07450981, 1, 1,
0.3824389, 0.04480959, 1.23579, 0, 0.07058824, 1, 1,
0.3837508, 0.031734, 0.8402699, 0, 0.0627451, 1, 1,
0.3893149, 1.857267, -0.7823582, 0, 0.05882353, 1, 1,
0.3982197, 1.88241, -0.7591946, 0, 0.05098039, 1, 1,
0.3982907, 1.134748, -0.4272995, 0, 0.04705882, 1, 1,
0.4018277, 1.320322, 1.1327, 0, 0.03921569, 1, 1,
0.4047222, -0.1663193, 0.8924833, 0, 0.03529412, 1, 1,
0.4064218, 0.216546, 1.834549, 0, 0.02745098, 1, 1,
0.4080063, 0.3296367, 2.150169, 0, 0.02352941, 1, 1,
0.4090243, 0.7983448, -0.09094916, 0, 0.01568628, 1, 1,
0.4160932, 1.641347, 1.040404, 0, 0.01176471, 1, 1,
0.4190783, 0.3154331, -0.3877474, 0, 0.003921569, 1, 1,
0.4280252, 0.03583006, 1.349416, 0.003921569, 0, 1, 1,
0.4285312, -0.8960562, 4.135591, 0.007843138, 0, 1, 1,
0.4288266, 0.9291402, 0.3923512, 0.01568628, 0, 1, 1,
0.4290195, -1.400295, 3.190558, 0.01960784, 0, 1, 1,
0.4290827, -0.2745379, 3.494577, 0.02745098, 0, 1, 1,
0.4312324, 0.7904065, -0.2939959, 0.03137255, 0, 1, 1,
0.4334919, 1.929145, -1.365207, 0.03921569, 0, 1, 1,
0.4396409, -1.334048, 3.084386, 0.04313726, 0, 1, 1,
0.447121, 0.2501183, 1.502719, 0.05098039, 0, 1, 1,
0.4489891, 0.07300982, 2.597841, 0.05490196, 0, 1, 1,
0.4526214, 1.634427, -0.4094523, 0.0627451, 0, 1, 1,
0.4527791, 1.960882, -0.9106737, 0.06666667, 0, 1, 1,
0.463013, 0.9771799, -0.6605315, 0.07450981, 0, 1, 1,
0.4703454, -0.9761989, 2.85185, 0.07843138, 0, 1, 1,
0.474272, 1.268267, 1.003303, 0.08627451, 0, 1, 1,
0.4747845, -0.1937533, 1.068728, 0.09019608, 0, 1, 1,
0.4806795, 0.7072245, 0.4328066, 0.09803922, 0, 1, 1,
0.4832536, 0.05767444, 0.575525, 0.1058824, 0, 1, 1,
0.4853119, 0.686993, 0.06587197, 0.1098039, 0, 1, 1,
0.491411, 1.927006, 0.4633458, 0.1176471, 0, 1, 1,
0.4944177, 2.850652, -1.219989, 0.1215686, 0, 1, 1,
0.4950882, 0.4385047, 0.7646208, 0.1294118, 0, 1, 1,
0.4977001, -0.5536734, 4.016768, 0.1333333, 0, 1, 1,
0.5016518, 0.1214333, 0.8331721, 0.1411765, 0, 1, 1,
0.5022925, 0.769877, 1.475859, 0.145098, 0, 1, 1,
0.5027829, -0.7338395, 2.200969, 0.1529412, 0, 1, 1,
0.5032483, -2.637475, 3.012051, 0.1568628, 0, 1, 1,
0.5035272, 0.6265583, 0.1697028, 0.1647059, 0, 1, 1,
0.5071424, -0.0039571, 2.696567, 0.1686275, 0, 1, 1,
0.5156143, -0.1088367, 2.648913, 0.1764706, 0, 1, 1,
0.5186723, -0.8204803, 1.671132, 0.1803922, 0, 1, 1,
0.5250095, -1.127439, 2.535469, 0.1882353, 0, 1, 1,
0.5318311, -1.824679, 2.748331, 0.1921569, 0, 1, 1,
0.5347045, 0.6636017, 1.230059, 0.2, 0, 1, 1,
0.5357703, 0.2955115, 1.159098, 0.2078431, 0, 1, 1,
0.5381147, -2.910393, 4.000395, 0.2117647, 0, 1, 1,
0.5384899, -0.3105238, 2.456802, 0.2196078, 0, 1, 1,
0.5439586, -0.06903922, 1.426359, 0.2235294, 0, 1, 1,
0.5470532, 0.883301, -0.3799141, 0.2313726, 0, 1, 1,
0.5475212, -0.3285486, 4.203006, 0.2352941, 0, 1, 1,
0.5497855, -0.6507168, 3.727683, 0.2431373, 0, 1, 1,
0.550453, 0.01799618, 1.336153, 0.2470588, 0, 1, 1,
0.5506736, -1.659407, 1.876456, 0.254902, 0, 1, 1,
0.5550678, 1.074568, 0.4428293, 0.2588235, 0, 1, 1,
0.5585968, -2.285242, 2.548706, 0.2666667, 0, 1, 1,
0.5636953, 0.6483234, 1.09903, 0.2705882, 0, 1, 1,
0.5679985, 0.7153232, -0.1373484, 0.2784314, 0, 1, 1,
0.5690558, -1.318553, 1.832698, 0.282353, 0, 1, 1,
0.5704619, 2.611469, 0.85469, 0.2901961, 0, 1, 1,
0.5715788, -1.413727, 4.338601, 0.2941177, 0, 1, 1,
0.5768389, -0.8722048, 3.773803, 0.3019608, 0, 1, 1,
0.580291, -0.8033949, 1.134755, 0.3098039, 0, 1, 1,
0.5813411, -0.0651245, 3.127296, 0.3137255, 0, 1, 1,
0.5823312, -1.028055, 2.844522, 0.3215686, 0, 1, 1,
0.5826002, 0.5735351, 0.7098656, 0.3254902, 0, 1, 1,
0.5829502, 1.120721, 0.7024361, 0.3333333, 0, 1, 1,
0.5843016, -1.635295, 3.182952, 0.3372549, 0, 1, 1,
0.5868579, 0.5495692, 1.214734, 0.345098, 0, 1, 1,
0.5871688, 0.7810781, 0.6690146, 0.3490196, 0, 1, 1,
0.5920067, 0.009479447, 1.382645, 0.3568628, 0, 1, 1,
0.6010778, -0.1166576, 2.631704, 0.3607843, 0, 1, 1,
0.6032414, 0.1762845, 1.123021, 0.3686275, 0, 1, 1,
0.6071481, 0.3121955, -0.4844404, 0.372549, 0, 1, 1,
0.6074629, -1.639026, 5.094064, 0.3803922, 0, 1, 1,
0.6081098, 1.371041, -0.8862715, 0.3843137, 0, 1, 1,
0.6121288, -0.8177564, 1.92844, 0.3921569, 0, 1, 1,
0.6140396, -1.181883, 3.516762, 0.3960784, 0, 1, 1,
0.6148703, -0.1013672, 2.310169, 0.4039216, 0, 1, 1,
0.6154477, -0.2379857, 2.27712, 0.4117647, 0, 1, 1,
0.6215867, 0.2821991, 1.3818, 0.4156863, 0, 1, 1,
0.6300457, -0.08775261, 0.9672472, 0.4235294, 0, 1, 1,
0.6333519, 1.033203, 1.626106, 0.427451, 0, 1, 1,
0.6339458, -1.378223, 3.11664, 0.4352941, 0, 1, 1,
0.6350754, 0.6787498, 1.214565, 0.4392157, 0, 1, 1,
0.6359789, 0.1187574, 0.1308741, 0.4470588, 0, 1, 1,
0.6430012, -0.882199, 3.566184, 0.4509804, 0, 1, 1,
0.6474454, -0.791038, 3.278368, 0.4588235, 0, 1, 1,
0.6493605, 0.3715869, -1.079445, 0.4627451, 0, 1, 1,
0.6591644, 1.146094, -0.4453526, 0.4705882, 0, 1, 1,
0.6660728, 0.8522913, -1.072644, 0.4745098, 0, 1, 1,
0.6694517, 1.039734, 2.846964, 0.4823529, 0, 1, 1,
0.6699777, 0.9244173, 2.226523, 0.4862745, 0, 1, 1,
0.670435, 0.5712257, 1.032464, 0.4941176, 0, 1, 1,
0.6744691, 2.261601, 1.89435, 0.5019608, 0, 1, 1,
0.683779, -0.1701812, 1.034376, 0.5058824, 0, 1, 1,
0.6875431, 0.1637026, 1.062042, 0.5137255, 0, 1, 1,
0.6905769, 0.04818182, 1.891474, 0.5176471, 0, 1, 1,
0.6913271, 0.6965656, 0.6665623, 0.5254902, 0, 1, 1,
0.6923615, -0.3046549, 1.397847, 0.5294118, 0, 1, 1,
0.694221, -1.11149, 2.440588, 0.5372549, 0, 1, 1,
0.6949704, 1.06872, 1.906062, 0.5411765, 0, 1, 1,
0.695937, 0.3915619, 1.185902, 0.5490196, 0, 1, 1,
0.6974686, 0.05583136, 2.060358, 0.5529412, 0, 1, 1,
0.6991563, 1.505462, 0.06671816, 0.5607843, 0, 1, 1,
0.7010112, 0.4222689, -0.1073084, 0.5647059, 0, 1, 1,
0.7027644, 0.3057106, 0.2551486, 0.572549, 0, 1, 1,
0.7027819, 0.3295504, 1.795378, 0.5764706, 0, 1, 1,
0.7054394, -0.01279358, 2.280314, 0.5843138, 0, 1, 1,
0.7065506, -0.7970693, 1.379156, 0.5882353, 0, 1, 1,
0.7109991, 0.9719377, 0.2383618, 0.5960785, 0, 1, 1,
0.7115604, -0.2546431, 0.741316, 0.6039216, 0, 1, 1,
0.7140336, -0.7531343, 4.14472, 0.6078432, 0, 1, 1,
0.7148786, 0.6587496, -0.2259153, 0.6156863, 0, 1, 1,
0.7165908, 0.5379238, -0.9989831, 0.6196079, 0, 1, 1,
0.7166377, -0.4221222, 1.023235, 0.627451, 0, 1, 1,
0.7171699, -0.6959093, 4.018863, 0.6313726, 0, 1, 1,
0.7189837, -0.7677294, 2.715007, 0.6392157, 0, 1, 1,
0.7220811, 1.340518, 0.3578582, 0.6431373, 0, 1, 1,
0.7232374, 1.978132, 1.258082, 0.6509804, 0, 1, 1,
0.7271072, -0.4545685, 0.4017186, 0.654902, 0, 1, 1,
0.7336963, 0.4541931, 0.4123069, 0.6627451, 0, 1, 1,
0.7392674, -2.245719, 3.276494, 0.6666667, 0, 1, 1,
0.7426282, 0.1125735, 2.699519, 0.6745098, 0, 1, 1,
0.7428722, 0.9843233, -0.2406625, 0.6784314, 0, 1, 1,
0.7491779, -0.7499323, 1.816828, 0.6862745, 0, 1, 1,
0.7493844, -0.384263, 3.182751, 0.6901961, 0, 1, 1,
0.7507699, 0.5859162, 2.218565, 0.6980392, 0, 1, 1,
0.7512138, 1.124015, -0.1443412, 0.7058824, 0, 1, 1,
0.7556997, -1.548688, 1.853627, 0.7098039, 0, 1, 1,
0.7561712, -0.1560993, 1.311582, 0.7176471, 0, 1, 1,
0.7622383, 1.191556, -0.3242038, 0.7215686, 0, 1, 1,
0.7646674, 0.6272938, 1.91916, 0.7294118, 0, 1, 1,
0.7648104, -0.5058375, 3.305196, 0.7333333, 0, 1, 1,
0.7675099, 0.5832006, 2.218633, 0.7411765, 0, 1, 1,
0.7776356, 1.509133, 0.833721, 0.7450981, 0, 1, 1,
0.7787117, -0.2843783, 0.8483522, 0.7529412, 0, 1, 1,
0.7830317, -0.48994, 2.916273, 0.7568628, 0, 1, 1,
0.7841455, 0.9844366, -0.360414, 0.7647059, 0, 1, 1,
0.7842267, 0.1929849, 0.8173713, 0.7686275, 0, 1, 1,
0.7857093, -1.456105, 2.861265, 0.7764706, 0, 1, 1,
0.7891313, 0.05544867, 2.770355, 0.7803922, 0, 1, 1,
0.7895886, -0.06531107, 0.4979181, 0.7882353, 0, 1, 1,
0.7918074, 0.009879991, 1.286996, 0.7921569, 0, 1, 1,
0.7924954, 1.098632, -1.102756, 0.8, 0, 1, 1,
0.7949088, -0.006486217, -0.2281232, 0.8078431, 0, 1, 1,
0.8127181, -0.5604146, 4.080009, 0.8117647, 0, 1, 1,
0.816452, 0.3892575, 0.9916294, 0.8196079, 0, 1, 1,
0.8204119, 1.023177, 0.08275016, 0.8235294, 0, 1, 1,
0.8356631, -1.23134, 3.040728, 0.8313726, 0, 1, 1,
0.84092, -0.3446834, 2.703933, 0.8352941, 0, 1, 1,
0.8431271, 1.708443, 0.06402703, 0.8431373, 0, 1, 1,
0.8491643, 0.1493454, -0.2973542, 0.8470588, 0, 1, 1,
0.8536193, 0.7740025, 0.9529727, 0.854902, 0, 1, 1,
0.8551902, 0.1470453, 2.443798, 0.8588235, 0, 1, 1,
0.8559763, -1.801372, 4.056222, 0.8666667, 0, 1, 1,
0.8589184, 0.8028213, -1.281455, 0.8705882, 0, 1, 1,
0.8661954, 0.2621343, 1.818101, 0.8784314, 0, 1, 1,
0.8687971, -0.9018164, 0.2015169, 0.8823529, 0, 1, 1,
0.8692108, -0.4772432, 2.73332, 0.8901961, 0, 1, 1,
0.8711874, -0.02849891, 1.718545, 0.8941177, 0, 1, 1,
0.8762675, 0.6851202, 0.8646201, 0.9019608, 0, 1, 1,
0.8850977, 0.2927511, 1.076096, 0.9098039, 0, 1, 1,
0.8853998, 0.3210269, 2.252807, 0.9137255, 0, 1, 1,
0.8859425, -1.108935, 2.11035, 0.9215686, 0, 1, 1,
0.8887258, -2.311604, 3.005007, 0.9254902, 0, 1, 1,
0.8915068, -0.6731191, 3.070064, 0.9333333, 0, 1, 1,
0.8945096, -0.6931814, 1.757953, 0.9372549, 0, 1, 1,
0.8980172, 0.8180457, 2.155378, 0.945098, 0, 1, 1,
0.9002205, -0.3753129, 3.240448, 0.9490196, 0, 1, 1,
0.9014683, -0.06246657, 1.048903, 0.9568627, 0, 1, 1,
0.9054654, -0.5997928, 1.427166, 0.9607843, 0, 1, 1,
0.9073128, -0.4139826, 1.190623, 0.9686275, 0, 1, 1,
0.9088039, -0.9921281, 2.658001, 0.972549, 0, 1, 1,
0.91108, 0.5774238, -0.5167294, 0.9803922, 0, 1, 1,
0.9123979, 0.3489579, 2.100747, 0.9843137, 0, 1, 1,
0.9170685, -0.6655625, 1.472977, 0.9921569, 0, 1, 1,
0.9201221, 0.9036494, 1.469863, 0.9960784, 0, 1, 1,
0.9206467, 0.6208051, 1.492723, 1, 0, 0.9960784, 1,
0.9278552, 0.8586667, -0.227277, 1, 0, 0.9882353, 1,
0.9282563, -1.184963, 3.646013, 1, 0, 0.9843137, 1,
0.9298105, -0.06174133, 2.913082, 1, 0, 0.9764706, 1,
0.9372137, -0.2680691, 2.158797, 1, 0, 0.972549, 1,
0.9395712, 0.5194408, 0.3634335, 1, 0, 0.9647059, 1,
0.9396661, -0.3797547, 2.052884, 1, 0, 0.9607843, 1,
0.9407045, 0.6418046, 2.014398, 1, 0, 0.9529412, 1,
0.9412494, 0.8825945, 0.3029268, 1, 0, 0.9490196, 1,
0.9416459, -0.3795096, 3.917855, 1, 0, 0.9411765, 1,
0.9477181, -1.42431, 0.939715, 1, 0, 0.9372549, 1,
0.9513188, 0.5902468, 1.163969, 1, 0, 0.9294118, 1,
0.9516295, 0.5545146, 2.128096, 1, 0, 0.9254902, 1,
0.9538159, -0.6361843, 2.062831, 1, 0, 0.9176471, 1,
0.9686621, 0.04512429, 1.848516, 1, 0, 0.9137255, 1,
0.9727324, 0.383982, 1.734305, 1, 0, 0.9058824, 1,
0.9731289, 0.7460103, 0.6912593, 1, 0, 0.9019608, 1,
0.9732221, 0.7255388, -0.9416624, 1, 0, 0.8941177, 1,
0.9750181, -0.500078, 2.406961, 1, 0, 0.8862745, 1,
0.9788764, 0.4091497, 0.5900354, 1, 0, 0.8823529, 1,
0.9862527, -0.3657894, 3.014004, 1, 0, 0.8745098, 1,
0.9886419, 0.2618889, 1.730493, 1, 0, 0.8705882, 1,
0.9901388, 1.166659, 1.713774, 1, 0, 0.8627451, 1,
0.9951063, 0.1136644, 0.9556784, 1, 0, 0.8588235, 1,
0.9976859, 0.6668765, 1.452357, 1, 0, 0.8509804, 1,
1.003699, -2.234135, 4.122567, 1, 0, 0.8470588, 1,
1.010978, 1.235647, 0.1197906, 1, 0, 0.8392157, 1,
1.01214, -1.719905, 1.680455, 1, 0, 0.8352941, 1,
1.017472, 1.14413, -0.1631699, 1, 0, 0.827451, 1,
1.019001, -1.453106, 4.749028, 1, 0, 0.8235294, 1,
1.01923, 0.4291293, -0.8250253, 1, 0, 0.8156863, 1,
1.031691, -1.97498, 1.660704, 1, 0, 0.8117647, 1,
1.033892, 0.1538209, 0.7652453, 1, 0, 0.8039216, 1,
1.037961, -0.4663561, 1.92021, 1, 0, 0.7960784, 1,
1.040189, -2.995957, 2.924514, 1, 0, 0.7921569, 1,
1.044409, -0.1684307, 2.04889, 1, 0, 0.7843137, 1,
1.04886, -0.2870448, 2.074166, 1, 0, 0.7803922, 1,
1.048935, -0.009773525, 1.379797, 1, 0, 0.772549, 1,
1.049614, 0.2539346, 1.577881, 1, 0, 0.7686275, 1,
1.053434, 0.2342495, 1.793209, 1, 0, 0.7607843, 1,
1.058536, -0.8207157, 2.067665, 1, 0, 0.7568628, 1,
1.060122, -0.3114736, 2.679996, 1, 0, 0.7490196, 1,
1.068273, -0.8504555, 0.86697, 1, 0, 0.7450981, 1,
1.076206, 0.1849706, 1.694, 1, 0, 0.7372549, 1,
1.090433, 0.9430047, 1.892897, 1, 0, 0.7333333, 1,
1.091325, 0.1655574, 2.105378, 1, 0, 0.7254902, 1,
1.091619, 0.02110325, 2.450607, 1, 0, 0.7215686, 1,
1.09263, -0.7473104, 3.585337, 1, 0, 0.7137255, 1,
1.097528, -0.175744, 1.830482, 1, 0, 0.7098039, 1,
1.098491, 0.4481559, 1.41651, 1, 0, 0.7019608, 1,
1.102455, 0.8978677, 0.3616713, 1, 0, 0.6941177, 1,
1.108915, -0.2771077, 2.847786, 1, 0, 0.6901961, 1,
1.118437, 1.292168, 1.915372, 1, 0, 0.682353, 1,
1.123395, -0.3834599, 2.165746, 1, 0, 0.6784314, 1,
1.126283, -0.18188, 1.782386, 1, 0, 0.6705883, 1,
1.135209, 0.5546728, 1.728685, 1, 0, 0.6666667, 1,
1.140289, 1.380691, -0.8086768, 1, 0, 0.6588235, 1,
1.142738, -0.01064578, -0.5738149, 1, 0, 0.654902, 1,
1.163484, -0.9692748, 1.203053, 1, 0, 0.6470588, 1,
1.163635, 1.471327, 2.989337, 1, 0, 0.6431373, 1,
1.16651, 0.895801, 1.614293, 1, 0, 0.6352941, 1,
1.167853, 0.6821909, 0.8196769, 1, 0, 0.6313726, 1,
1.171328, -1.069689, 1.743031, 1, 0, 0.6235294, 1,
1.199475, 1.082303, 2.465678, 1, 0, 0.6196079, 1,
1.201359, 0.226228, 4.065874, 1, 0, 0.6117647, 1,
1.215737, -1.417537, 2.576956, 1, 0, 0.6078432, 1,
1.224924, -0.2299332, 0.7342487, 1, 0, 0.6, 1,
1.227614, 0.1201393, 0.5443838, 1, 0, 0.5921569, 1,
1.228521, -0.05832597, 2.226812, 1, 0, 0.5882353, 1,
1.229549, 3.071292, -1.777674, 1, 0, 0.5803922, 1,
1.245756, 0.3069707, 2.465725, 1, 0, 0.5764706, 1,
1.246359, -0.1775225, 2.545197, 1, 0, 0.5686275, 1,
1.24823, 0.1639999, 1.871839, 1, 0, 0.5647059, 1,
1.249237, 0.3382517, 0.6261781, 1, 0, 0.5568628, 1,
1.256645, 2.194526, -0.8665397, 1, 0, 0.5529412, 1,
1.269371, 2.326784, 0.2119495, 1, 0, 0.5450981, 1,
1.271227, -0.9186359, 2.487907, 1, 0, 0.5411765, 1,
1.279296, -0.8855376, 1.928888, 1, 0, 0.5333334, 1,
1.284009, -1.481769, 2.628556, 1, 0, 0.5294118, 1,
1.290018, 0.7225735, 1.880334, 1, 0, 0.5215687, 1,
1.292628, 0.3401659, -0.5030919, 1, 0, 0.5176471, 1,
1.304215, -0.8438599, 2.60881, 1, 0, 0.509804, 1,
1.312048, -0.4587179, 2.020759, 1, 0, 0.5058824, 1,
1.314229, 0.8289807, 1.491984, 1, 0, 0.4980392, 1,
1.323907, 0.004081773, 1.077874, 1, 0, 0.4901961, 1,
1.325186, 0.3056871, 1.085628, 1, 0, 0.4862745, 1,
1.333, 1.133554, 0.7060012, 1, 0, 0.4784314, 1,
1.34049, 1.815618, -0.7544117, 1, 0, 0.4745098, 1,
1.341976, -1.171594, 1.217403, 1, 0, 0.4666667, 1,
1.344699, 0.1869515, 2.252894, 1, 0, 0.4627451, 1,
1.361677, -0.6770533, 4.227043, 1, 0, 0.454902, 1,
1.366839, -0.4227573, 3.193542, 1, 0, 0.4509804, 1,
1.395939, -1.381476, 3.530424, 1, 0, 0.4431373, 1,
1.415712, 0.02052133, 2.616167, 1, 0, 0.4392157, 1,
1.427385, 1.234577, 0.4414411, 1, 0, 0.4313726, 1,
1.427783, -0.4186755, 2.820281, 1, 0, 0.427451, 1,
1.431365, -0.4362881, -0.2143537, 1, 0, 0.4196078, 1,
1.432243, 0.07899045, 2.086081, 1, 0, 0.4156863, 1,
1.438849, -1.608602, 3.921893, 1, 0, 0.4078431, 1,
1.439933, 0.1427749, 0.4489511, 1, 0, 0.4039216, 1,
1.448054, 0.7024686, 1.754993, 1, 0, 0.3960784, 1,
1.449855, 1.32689, 0.325351, 1, 0, 0.3882353, 1,
1.45474, 0.6992962, 0.8798715, 1, 0, 0.3843137, 1,
1.471279, 1.54065, 1.536795, 1, 0, 0.3764706, 1,
1.488743, -1.052496, 2.158569, 1, 0, 0.372549, 1,
1.499746, -0.5860288, 1.684007, 1, 0, 0.3647059, 1,
1.508675, 1.786338, 1.009154, 1, 0, 0.3607843, 1,
1.531686, 0.6094451, 2.330827, 1, 0, 0.3529412, 1,
1.534525, 0.04862792, 1.597573, 1, 0, 0.3490196, 1,
1.540897, 0.3002763, 1.711998, 1, 0, 0.3411765, 1,
1.54376, -2.079079, 1.223102, 1, 0, 0.3372549, 1,
1.546124, -1.104447, 2.900644, 1, 0, 0.3294118, 1,
1.552481, 0.419643, 1.309391, 1, 0, 0.3254902, 1,
1.557558, -0.9876447, 1.85219, 1, 0, 0.3176471, 1,
1.560379, 0.1779374, 1.76906, 1, 0, 0.3137255, 1,
1.56377, 1.783286, 0.2041391, 1, 0, 0.3058824, 1,
1.565291, 0.9689979, 0.05255775, 1, 0, 0.2980392, 1,
1.571462, -0.3393642, 1.169022, 1, 0, 0.2941177, 1,
1.574684, 0.774044, 2.46565, 1, 0, 0.2862745, 1,
1.589992, 0.2101089, -0.08154645, 1, 0, 0.282353, 1,
1.593816, 1.358265, 0.7671309, 1, 0, 0.2745098, 1,
1.594841, 0.5647126, 1.986732, 1, 0, 0.2705882, 1,
1.597284, -0.9157642, -0.230574, 1, 0, 0.2627451, 1,
1.598617, 1.131191, 1.574441, 1, 0, 0.2588235, 1,
1.614289, 0.9786128, 1.181484, 1, 0, 0.2509804, 1,
1.646733, 0.2440549, 1.977682, 1, 0, 0.2470588, 1,
1.651231, 0.3187857, 1.725175, 1, 0, 0.2392157, 1,
1.656922, -0.2525091, 2.130126, 1, 0, 0.2352941, 1,
1.657623, 0.3237243, -0.850743, 1, 0, 0.227451, 1,
1.661271, -0.3915309, 2.432873, 1, 0, 0.2235294, 1,
1.671584, 1.255401, 0.9040158, 1, 0, 0.2156863, 1,
1.690163, -0.9415668, 2.332848, 1, 0, 0.2117647, 1,
1.696859, 0.02684695, -0.03873204, 1, 0, 0.2039216, 1,
1.719441, -1.346817, 2.267162, 1, 0, 0.1960784, 1,
1.732588, 0.495228, 1.775258, 1, 0, 0.1921569, 1,
1.761572, 1.168314, 2.907054, 1, 0, 0.1843137, 1,
1.769207, -0.3691703, 1.51301, 1, 0, 0.1803922, 1,
1.770958, 0.0793189, 2.560631, 1, 0, 0.172549, 1,
1.7746, -0.02653289, 2.700668, 1, 0, 0.1686275, 1,
1.787656, 0.947309, 1.553028, 1, 0, 0.1607843, 1,
1.817066, -0.4030447, 0.3115878, 1, 0, 0.1568628, 1,
1.845565, -0.1716868, 1.994617, 1, 0, 0.1490196, 1,
1.909486, -0.477875, -0.03422083, 1, 0, 0.145098, 1,
1.913476, 0.9176903, 0.8043806, 1, 0, 0.1372549, 1,
1.917409, -0.2270367, 1.276131, 1, 0, 0.1333333, 1,
1.92706, 0.1602473, 1.936513, 1, 0, 0.1254902, 1,
1.931165, -0.3480721, 2.760153, 1, 0, 0.1215686, 1,
1.940142, 1.559274, 0.6647872, 1, 0, 0.1137255, 1,
1.946519, 0.8900602, -0.02211322, 1, 0, 0.1098039, 1,
1.95128, -1.513329, 2.192349, 1, 0, 0.1019608, 1,
1.956457, -0.779963, 2.365813, 1, 0, 0.09411765, 1,
1.958338, -1.507148, 3.983021, 1, 0, 0.09019608, 1,
1.965028, -2.353637, 1.793556, 1, 0, 0.08235294, 1,
1.965924, 1.174664, 1.969828, 1, 0, 0.07843138, 1,
1.994187, 0.7866724, 1.039184, 1, 0, 0.07058824, 1,
2.012208, -1.276629, 1.373887, 1, 0, 0.06666667, 1,
2.092366, 0.9359929, 1.551982, 1, 0, 0.05882353, 1,
2.108956, -1.382775, 2.311035, 1, 0, 0.05490196, 1,
2.133534, 1.734862, 1.012215, 1, 0, 0.04705882, 1,
2.200552, -1.291443, 3.667919, 1, 0, 0.04313726, 1,
2.255658, -0.4153037, 0.9159582, 1, 0, 0.03529412, 1,
2.320878, -0.5483239, 1.488026, 1, 0, 0.03137255, 1,
2.403668, -1.305744, 2.133163, 1, 0, 0.02352941, 1,
2.410531, 0.02242074, 1.202295, 1, 0, 0.01960784, 1,
2.630749, -0.2628424, 1.781895, 1, 0, 0.01176471, 1,
2.815863, -0.1509233, -0.6024447, 1, 0, 0.007843138, 1
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
-0.2049556, -4.604898, -6.843765, 0, -0.5, 0.5, 0.5,
-0.2049556, -4.604898, -6.843765, 1, -0.5, 0.5, 0.5,
-0.2049556, -4.604898, -6.843765, 1, 1.5, 0.5, 0.5,
-0.2049556, -4.604898, -6.843765, 0, 1.5, 0.5, 0.5
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
-4.249832, -0.2105334, -6.843765, 0, -0.5, 0.5, 0.5,
-4.249832, -0.2105334, -6.843765, 1, -0.5, 0.5, 0.5,
-4.249832, -0.2105334, -6.843765, 1, 1.5, 0.5, 0.5,
-4.249832, -0.2105334, -6.843765, 0, 1.5, 0.5, 0.5
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
-4.249832, -4.604898, 0.4947886, 0, -0.5, 0.5, 0.5,
-4.249832, -4.604898, 0.4947886, 1, -0.5, 0.5, 0.5,
-4.249832, -4.604898, 0.4947886, 1, 1.5, 0.5, 0.5,
-4.249832, -4.604898, 0.4947886, 0, 1.5, 0.5, 0.5
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
-3, -3.590814, -5.150253,
2, -3.590814, -5.150253,
-3, -3.590814, -5.150253,
-3, -3.759828, -5.432505,
-2, -3.590814, -5.150253,
-2, -3.759828, -5.432505,
-1, -3.590814, -5.150253,
-1, -3.759828, -5.432505,
0, -3.590814, -5.150253,
0, -3.759828, -5.432505,
1, -3.590814, -5.150253,
1, -3.759828, -5.432505,
2, -3.590814, -5.150253,
2, -3.759828, -5.432505
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
-3, -4.097856, -5.997009, 0, -0.5, 0.5, 0.5,
-3, -4.097856, -5.997009, 1, -0.5, 0.5, 0.5,
-3, -4.097856, -5.997009, 1, 1.5, 0.5, 0.5,
-3, -4.097856, -5.997009, 0, 1.5, 0.5, 0.5,
-2, -4.097856, -5.997009, 0, -0.5, 0.5, 0.5,
-2, -4.097856, -5.997009, 1, -0.5, 0.5, 0.5,
-2, -4.097856, -5.997009, 1, 1.5, 0.5, 0.5,
-2, -4.097856, -5.997009, 0, 1.5, 0.5, 0.5,
-1, -4.097856, -5.997009, 0, -0.5, 0.5, 0.5,
-1, -4.097856, -5.997009, 1, -0.5, 0.5, 0.5,
-1, -4.097856, -5.997009, 1, 1.5, 0.5, 0.5,
-1, -4.097856, -5.997009, 0, 1.5, 0.5, 0.5,
0, -4.097856, -5.997009, 0, -0.5, 0.5, 0.5,
0, -4.097856, -5.997009, 1, -0.5, 0.5, 0.5,
0, -4.097856, -5.997009, 1, 1.5, 0.5, 0.5,
0, -4.097856, -5.997009, 0, 1.5, 0.5, 0.5,
1, -4.097856, -5.997009, 0, -0.5, 0.5, 0.5,
1, -4.097856, -5.997009, 1, -0.5, 0.5, 0.5,
1, -4.097856, -5.997009, 1, 1.5, 0.5, 0.5,
1, -4.097856, -5.997009, 0, 1.5, 0.5, 0.5,
2, -4.097856, -5.997009, 0, -0.5, 0.5, 0.5,
2, -4.097856, -5.997009, 1, -0.5, 0.5, 0.5,
2, -4.097856, -5.997009, 1, 1.5, 0.5, 0.5,
2, -4.097856, -5.997009, 0, 1.5, 0.5, 0.5
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
-3.316399, -3, -5.150253,
-3.316399, 3, -5.150253,
-3.316399, -3, -5.150253,
-3.471971, -3, -5.432505,
-3.316399, -2, -5.150253,
-3.471971, -2, -5.432505,
-3.316399, -1, -5.150253,
-3.471971, -1, -5.432505,
-3.316399, 0, -5.150253,
-3.471971, 0, -5.432505,
-3.316399, 1, -5.150253,
-3.471971, 1, -5.432505,
-3.316399, 2, -5.150253,
-3.471971, 2, -5.432505,
-3.316399, 3, -5.150253,
-3.471971, 3, -5.432505
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
-3.783115, -3, -5.997009, 0, -0.5, 0.5, 0.5,
-3.783115, -3, -5.997009, 1, -0.5, 0.5, 0.5,
-3.783115, -3, -5.997009, 1, 1.5, 0.5, 0.5,
-3.783115, -3, -5.997009, 0, 1.5, 0.5, 0.5,
-3.783115, -2, -5.997009, 0, -0.5, 0.5, 0.5,
-3.783115, -2, -5.997009, 1, -0.5, 0.5, 0.5,
-3.783115, -2, -5.997009, 1, 1.5, 0.5, 0.5,
-3.783115, -2, -5.997009, 0, 1.5, 0.5, 0.5,
-3.783115, -1, -5.997009, 0, -0.5, 0.5, 0.5,
-3.783115, -1, -5.997009, 1, -0.5, 0.5, 0.5,
-3.783115, -1, -5.997009, 1, 1.5, 0.5, 0.5,
-3.783115, -1, -5.997009, 0, 1.5, 0.5, 0.5,
-3.783115, 0, -5.997009, 0, -0.5, 0.5, 0.5,
-3.783115, 0, -5.997009, 1, -0.5, 0.5, 0.5,
-3.783115, 0, -5.997009, 1, 1.5, 0.5, 0.5,
-3.783115, 0, -5.997009, 0, 1.5, 0.5, 0.5,
-3.783115, 1, -5.997009, 0, -0.5, 0.5, 0.5,
-3.783115, 1, -5.997009, 1, -0.5, 0.5, 0.5,
-3.783115, 1, -5.997009, 1, 1.5, 0.5, 0.5,
-3.783115, 1, -5.997009, 0, 1.5, 0.5, 0.5,
-3.783115, 2, -5.997009, 0, -0.5, 0.5, 0.5,
-3.783115, 2, -5.997009, 1, -0.5, 0.5, 0.5,
-3.783115, 2, -5.997009, 1, 1.5, 0.5, 0.5,
-3.783115, 2, -5.997009, 0, 1.5, 0.5, 0.5,
-3.783115, 3, -5.997009, 0, -0.5, 0.5, 0.5,
-3.783115, 3, -5.997009, 1, -0.5, 0.5, 0.5,
-3.783115, 3, -5.997009, 1, 1.5, 0.5, 0.5,
-3.783115, 3, -5.997009, 0, 1.5, 0.5, 0.5
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
-3.316399, -3.590814, -4,
-3.316399, -3.590814, 4,
-3.316399, -3.590814, -4,
-3.471971, -3.759828, -4,
-3.316399, -3.590814, -2,
-3.471971, -3.759828, -2,
-3.316399, -3.590814, 0,
-3.471971, -3.759828, 0,
-3.316399, -3.590814, 2,
-3.471971, -3.759828, 2,
-3.316399, -3.590814, 4,
-3.471971, -3.759828, 4
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
-3.783115, -4.097856, -4, 0, -0.5, 0.5, 0.5,
-3.783115, -4.097856, -4, 1, -0.5, 0.5, 0.5,
-3.783115, -4.097856, -4, 1, 1.5, 0.5, 0.5,
-3.783115, -4.097856, -4, 0, 1.5, 0.5, 0.5,
-3.783115, -4.097856, -2, 0, -0.5, 0.5, 0.5,
-3.783115, -4.097856, -2, 1, -0.5, 0.5, 0.5,
-3.783115, -4.097856, -2, 1, 1.5, 0.5, 0.5,
-3.783115, -4.097856, -2, 0, 1.5, 0.5, 0.5,
-3.783115, -4.097856, 0, 0, -0.5, 0.5, 0.5,
-3.783115, -4.097856, 0, 1, -0.5, 0.5, 0.5,
-3.783115, -4.097856, 0, 1, 1.5, 0.5, 0.5,
-3.783115, -4.097856, 0, 0, 1.5, 0.5, 0.5,
-3.783115, -4.097856, 2, 0, -0.5, 0.5, 0.5,
-3.783115, -4.097856, 2, 1, -0.5, 0.5, 0.5,
-3.783115, -4.097856, 2, 1, 1.5, 0.5, 0.5,
-3.783115, -4.097856, 2, 0, 1.5, 0.5, 0.5,
-3.783115, -4.097856, 4, 0, -0.5, 0.5, 0.5,
-3.783115, -4.097856, 4, 1, -0.5, 0.5, 0.5,
-3.783115, -4.097856, 4, 1, 1.5, 0.5, 0.5,
-3.783115, -4.097856, 4, 0, 1.5, 0.5, 0.5
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
-3.316399, -3.590814, -5.150253,
-3.316399, 3.169747, -5.150253,
-3.316399, -3.590814, 6.13983,
-3.316399, 3.169747, 6.13983,
-3.316399, -3.590814, -5.150253,
-3.316399, -3.590814, 6.13983,
-3.316399, 3.169747, -5.150253,
-3.316399, 3.169747, 6.13983,
-3.316399, -3.590814, -5.150253,
2.906487, -3.590814, -5.150253,
-3.316399, -3.590814, 6.13983,
2.906487, -3.590814, 6.13983,
-3.316399, 3.169747, -5.150253,
2.906487, 3.169747, -5.150253,
-3.316399, 3.169747, 6.13983,
2.906487, 3.169747, 6.13983,
2.906487, -3.590814, -5.150253,
2.906487, 3.169747, -5.150253,
2.906487, -3.590814, 6.13983,
2.906487, 3.169747, 6.13983,
2.906487, -3.590814, -5.150253,
2.906487, -3.590814, 6.13983,
2.906487, 3.169747, -5.150253,
2.906487, 3.169747, 6.13983
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
var radius = 7.772957;
var distance = 34.58277;
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
mvMatrix.translate( 0.2049556, 0.2105334, -0.4947886 );
mvMatrix.scale( 1.350543, 1.243133, 0.7443944 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.58277);
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


```r
open3d()
```

```
## glX 
##   2
```

```r
Ossian<-read.table("Ossian.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Ossian$V2
```

```
## Error in eval(expr, envir, enclos): object 'Ossian' not found
```

```r
y<-Ossian$V3
```

```
## Error in eval(expr, envir, enclos): object 'Ossian' not found
```

```r
z<-Ossian$V4
```

```
## Error in eval(expr, envir, enclos): object 'Ossian' not found
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
-3.225774, 0.1806964, -2.294399, 0, 0, 1, 1, 1,
-3.020425, 0.3901645, -1.321147, 1, 0, 0, 1, 1,
-2.923957, -0.453296, -0.6530534, 1, 0, 0, 1, 1,
-2.781908, -1.156197, 0.1980214, 1, 0, 0, 1, 1,
-2.70604, 1.055724, -1.291344, 1, 0, 0, 1, 1,
-2.638358, -0.5164593, -2.535006, 1, 0, 0, 1, 1,
-2.625966, -1.882165, -2.835646, 0, 0, 0, 1, 1,
-2.56932, -0.4509344, -1.494658, 0, 0, 0, 1, 1,
-2.50982, 0.6104606, 0.1726357, 0, 0, 0, 1, 1,
-2.428447, -1.157777, -3.192894, 0, 0, 0, 1, 1,
-2.427685, -0.4555829, -3.130184, 0, 0, 0, 1, 1,
-2.352075, 0.7597628, 0.6954366, 0, 0, 0, 1, 1,
-2.245024, 0.6494148, -1.858904, 0, 0, 0, 1, 1,
-2.241666, 1.549566, -2.64299, 1, 1, 1, 1, 1,
-2.201712, 0.2952486, -2.442384, 1, 1, 1, 1, 1,
-2.200313, 0.279903, -1.231002, 1, 1, 1, 1, 1,
-2.176382, 2.400388, -0.3727759, 1, 1, 1, 1, 1,
-2.164955, -0.1961207, -1.989355, 1, 1, 1, 1, 1,
-2.145634, -0.4226483, -1.94018, 1, 1, 1, 1, 1,
-2.143931, -0.3016009, -1.000092, 1, 1, 1, 1, 1,
-2.135005, 0.1354915, -1.388656, 1, 1, 1, 1, 1,
-2.1303, 0.9912085, -2.747828, 1, 1, 1, 1, 1,
-2.12548, 0.9517464, -0.355798, 1, 1, 1, 1, 1,
-2.115201, 0.2443192, 0.6724538, 1, 1, 1, 1, 1,
-2.115133, 0.2841448, -1.528473, 1, 1, 1, 1, 1,
-2.077283, 0.7385497, -1.078366, 1, 1, 1, 1, 1,
-2.073827, -0.8086335, -2.204524, 1, 1, 1, 1, 1,
-2.047837, -0.6253473, -1.655329, 1, 1, 1, 1, 1,
-2.00881, 0.1968336, -1.153392, 0, 0, 1, 1, 1,
-1.971256, -0.001209239, -1.337287, 1, 0, 0, 1, 1,
-1.933555, -0.411267, -1.234582, 1, 0, 0, 1, 1,
-1.898694, 0.182418, -1.45521, 1, 0, 0, 1, 1,
-1.898678, -0.7337819, -1.217376, 1, 0, 0, 1, 1,
-1.880642, -0.8909447, -2.802784, 1, 0, 0, 1, 1,
-1.878021, -0.2737076, -0.4710541, 0, 0, 0, 1, 1,
-1.877498, -2.341591, -3.788262, 0, 0, 0, 1, 1,
-1.873388, 0.1109325, -1.535798, 0, 0, 0, 1, 1,
-1.865892, 0.9966328, -1.255281, 0, 0, 0, 1, 1,
-1.85511, -2.481769, -3.718966, 0, 0, 0, 1, 1,
-1.846981, 0.04317453, -1.779955, 0, 0, 0, 1, 1,
-1.822635, 0.9625744, -1.853911, 0, 0, 0, 1, 1,
-1.81583, -0.5562969, -2.483079, 1, 1, 1, 1, 1,
-1.807665, 0.4990241, 0.3205153, 1, 1, 1, 1, 1,
-1.804019, 0.9971257, -0.9911798, 1, 1, 1, 1, 1,
-1.801938, 0.2651966, -1.568481, 1, 1, 1, 1, 1,
-1.786797, -0.1945208, -1.028483, 1, 1, 1, 1, 1,
-1.753114, -0.2572199, -0.8751558, 1, 1, 1, 1, 1,
-1.751699, 0.9750432, -1.15914, 1, 1, 1, 1, 1,
-1.748833, -0.1698848, -2.678022, 1, 1, 1, 1, 1,
-1.7376, 2.119487, 0.1198397, 1, 1, 1, 1, 1,
-1.706545, 0.1882252, -1.397182, 1, 1, 1, 1, 1,
-1.692557, -0.02495302, 0.4892515, 1, 1, 1, 1, 1,
-1.678348, -1.147341, -1.714109, 1, 1, 1, 1, 1,
-1.673635, -0.3093501, 0.2133504, 1, 1, 1, 1, 1,
-1.669631, -1.015759, -2.598982, 1, 1, 1, 1, 1,
-1.629019, -0.3702605, -3.257071, 1, 1, 1, 1, 1,
-1.613137, -0.7990508, -0.964491, 0, 0, 1, 1, 1,
-1.612482, 0.2992149, -2.920745, 1, 0, 0, 1, 1,
-1.607045, -1.410278, -1.217423, 1, 0, 0, 1, 1,
-1.605134, -1.138085, -2.419532, 1, 0, 0, 1, 1,
-1.597859, -1.459932, -3.216734, 1, 0, 0, 1, 1,
-1.588569, -0.6033939, -0.4970729, 1, 0, 0, 1, 1,
-1.584363, -1.400714, -1.551, 0, 0, 0, 1, 1,
-1.574881, 0.4989673, -2.874659, 0, 0, 0, 1, 1,
-1.570137, -0.8850699, -3.083706, 0, 0, 0, 1, 1,
-1.569505, 0.5996884, -2.240467, 0, 0, 0, 1, 1,
-1.557718, -1.098709, -3.607231, 0, 0, 0, 1, 1,
-1.557703, -0.3130883, -0.7509671, 0, 0, 0, 1, 1,
-1.553663, -0.6093338, -1.396915, 0, 0, 0, 1, 1,
-1.542263, 0.3227703, -0.5012614, 1, 1, 1, 1, 1,
-1.54145, 0.6664239, -0.9811889, 1, 1, 1, 1, 1,
-1.53783, 0.7106721, -1.51793, 1, 1, 1, 1, 1,
-1.533057, -1.006541, 0.2636282, 1, 1, 1, 1, 1,
-1.516508, -0.3261743, 0.3598703, 1, 1, 1, 1, 1,
-1.498853, -0.6290604, -1.777139, 1, 1, 1, 1, 1,
-1.496941, 0.3725112, -0.5952884, 1, 1, 1, 1, 1,
-1.486119, 0.1915416, -0.6853243, 1, 1, 1, 1, 1,
-1.471434, -0.2620377, -0.8407705, 1, 1, 1, 1, 1,
-1.453986, 0.7812742, 0.06935969, 1, 1, 1, 1, 1,
-1.445474, 0.2036109, -1.95816, 1, 1, 1, 1, 1,
-1.441406, 0.5076009, -1.587052, 1, 1, 1, 1, 1,
-1.406913, 0.8215852, -2.238102, 1, 1, 1, 1, 1,
-1.400363, 0.4631566, -0.8364446, 1, 1, 1, 1, 1,
-1.395697, -0.5861426, -0.9812733, 1, 1, 1, 1, 1,
-1.391289, -0.1181485, -2.258256, 0, 0, 1, 1, 1,
-1.389752, 0.6971543, -1.130469, 1, 0, 0, 1, 1,
-1.388589, -0.3291097, -3.204973, 1, 0, 0, 1, 1,
-1.382445, 1.576317, -1.944221, 1, 0, 0, 1, 1,
-1.362675, 1.36745, -0.3859434, 1, 0, 0, 1, 1,
-1.341274, 0.7408033, -0.9947815, 1, 0, 0, 1, 1,
-1.339735, 0.008629358, -2.101969, 0, 0, 0, 1, 1,
-1.335377, 1.396104, -1.438853, 0, 0, 0, 1, 1,
-1.331964, -0.5524476, -2.485079, 0, 0, 0, 1, 1,
-1.33043, -0.1783327, -2.500958, 0, 0, 0, 1, 1,
-1.326554, 1.491753, -0.1751541, 0, 0, 0, 1, 1,
-1.307529, -1.521665, -2.662166, 0, 0, 0, 1, 1,
-1.298115, 0.3829993, -3.162976, 0, 0, 0, 1, 1,
-1.283804, -0.1962273, -2.582494, 1, 1, 1, 1, 1,
-1.283589, -0.730959, -2.017012, 1, 1, 1, 1, 1,
-1.27247, 0.1014627, -1.589442, 1, 1, 1, 1, 1,
-1.271134, -0.2807925, -3.006732, 1, 1, 1, 1, 1,
-1.269876, 1.652284, -0.3906589, 1, 1, 1, 1, 1,
-1.267459, -0.9501631, -4.271047, 1, 1, 1, 1, 1,
-1.266064, -1.852555, -3.643173, 1, 1, 1, 1, 1,
-1.253515, -0.3578321, -1.226756, 1, 1, 1, 1, 1,
-1.248626, 0.1166192, -2.201378, 1, 1, 1, 1, 1,
-1.245479, 0.5885164, -0.7086223, 1, 1, 1, 1, 1,
-1.241614, -0.3857272, -3.220156, 1, 1, 1, 1, 1,
-1.237059, -2.257416, -1.821082, 1, 1, 1, 1, 1,
-1.220001, -0.4039309, -3.71484, 1, 1, 1, 1, 1,
-1.219884, 1.148273, -1.323103, 1, 1, 1, 1, 1,
-1.218634, -0.2848107, -0.8402517, 1, 1, 1, 1, 1,
-1.213715, -2.279184, -2.615474, 0, 0, 1, 1, 1,
-1.212305, 0.3698362, 0.1677275, 1, 0, 0, 1, 1,
-1.211898, 1.58598, -1.901724, 1, 0, 0, 1, 1,
-1.20384, -0.1997444, -1.907391, 1, 0, 0, 1, 1,
-1.199768, 0.6149203, -1.039588, 1, 0, 0, 1, 1,
-1.198736, 1.034175, -1.772988, 1, 0, 0, 1, 1,
-1.192568, 0.01836165, -3.047017, 0, 0, 0, 1, 1,
-1.192168, -2.985831, -3.595725, 0, 0, 0, 1, 1,
-1.189595, -2.031402, -2.307674, 0, 0, 0, 1, 1,
-1.185584, 1.08922, -1.917814, 0, 0, 0, 1, 1,
-1.18057, 0.8176643, -0.4841485, 0, 0, 0, 1, 1,
-1.176927, 1.647243, 1.216498, 0, 0, 0, 1, 1,
-1.165255, 0.6982943, -1.785652, 0, 0, 0, 1, 1,
-1.156354, 1.455348, 0.6437331, 1, 1, 1, 1, 1,
-1.154116, 1.139497, -1.357424, 1, 1, 1, 1, 1,
-1.152661, 0.1422019, -1.571935, 1, 1, 1, 1, 1,
-1.151075, -0.536696, -2.645864, 1, 1, 1, 1, 1,
-1.150855, -0.8809443, -3.005338, 1, 1, 1, 1, 1,
-1.145159, 0.8932537, 1.089531, 1, 1, 1, 1, 1,
-1.142387, 0.3912556, -0.2955743, 1, 1, 1, 1, 1,
-1.137174, 1.343203, -1.103281, 1, 1, 1, 1, 1,
-1.119676, -0.3403134, -2.049245, 1, 1, 1, 1, 1,
-1.119604, 0.5675347, -0.2570709, 1, 1, 1, 1, 1,
-1.108998, -0.9253139, -1.959645, 1, 1, 1, 1, 1,
-1.104447, -1.847186, -4.836653, 1, 1, 1, 1, 1,
-1.102139, 0.1114505, -1.363949, 1, 1, 1, 1, 1,
-1.099714, 0.4338737, -3.543159, 1, 1, 1, 1, 1,
-1.09711, -1.635334, -3.172086, 1, 1, 1, 1, 1,
-1.094702, 0.1181134, -1.582807, 0, 0, 1, 1, 1,
-1.090303, -0.3788389, -1.794561, 1, 0, 0, 1, 1,
-1.090259, -0.595464, -1.237851, 1, 0, 0, 1, 1,
-1.071072, 0.8302996, -0.6175822, 1, 0, 0, 1, 1,
-1.058128, -0.4136102, -2.11703, 1, 0, 0, 1, 1,
-1.055645, -0.7964401, -1.653917, 1, 0, 0, 1, 1,
-1.04392, -0.6318779, -2.857473, 0, 0, 0, 1, 1,
-1.04192, -0.7076988, -1.859599, 0, 0, 0, 1, 1,
-1.034478, -0.6680398, -2.584023, 0, 0, 0, 1, 1,
-1.031097, -0.1298284, -1.519223, 0, 0, 0, 1, 1,
-1.026819, -0.3512705, -2.239819, 0, 0, 0, 1, 1,
-1.025075, -0.1526461, -1.359575, 0, 0, 0, 1, 1,
-1.018642, -1.357602, -2.341779, 0, 0, 0, 1, 1,
-1.014697, -0.5833095, -1.971887, 1, 1, 1, 1, 1,
-1.007618, -1.449069, -2.674813, 1, 1, 1, 1, 1,
-1.004096, 1.119174, 1.57187, 1, 1, 1, 1, 1,
-0.9997535, -1.285108, -3.072906, 1, 1, 1, 1, 1,
-0.9921731, 0.3859522, -1.790475, 1, 1, 1, 1, 1,
-0.9908524, 0.9486961, -0.962847, 1, 1, 1, 1, 1,
-0.9876831, -0.1123646, -3.297004, 1, 1, 1, 1, 1,
-0.9876086, -1.131504, -1.820347, 1, 1, 1, 1, 1,
-0.9869702, 0.2458664, -0.8255046, 1, 1, 1, 1, 1,
-0.9858934, 0.2642519, -1.535468, 1, 1, 1, 1, 1,
-0.985044, -1.51893, -2.126114, 1, 1, 1, 1, 1,
-0.9844989, -0.2307649, -1.210829, 1, 1, 1, 1, 1,
-0.9837513, -0.2374207, -1.275679, 1, 1, 1, 1, 1,
-0.9809945, 0.8202183, -0.0465373, 1, 1, 1, 1, 1,
-0.9749973, 0.8869253, -2.884415, 1, 1, 1, 1, 1,
-0.9583894, 0.5119644, -1.784483, 0, 0, 1, 1, 1,
-0.9391376, -0.6363025, -2.736827, 1, 0, 0, 1, 1,
-0.9390551, -0.3090748, -1.708564, 1, 0, 0, 1, 1,
-0.936553, -1.172773, -0.5144376, 1, 0, 0, 1, 1,
-0.9362024, 0.2118667, -0.7998487, 1, 0, 0, 1, 1,
-0.934619, -0.8430662, -1.501026, 1, 0, 0, 1, 1,
-0.933326, -0.8613651, -2.579635, 0, 0, 0, 1, 1,
-0.9272178, -0.1116278, -2.97866, 0, 0, 0, 1, 1,
-0.9232825, 1.612145, 1.066844, 0, 0, 0, 1, 1,
-0.9227969, 0.9952021, -1.302537, 0, 0, 0, 1, 1,
-0.9153, 0.02488103, -1.394198, 0, 0, 0, 1, 1,
-0.9085758, -1.862045, -4.449147, 0, 0, 0, 1, 1,
-0.9084122, 0.8962798, -2.091483, 0, 0, 0, 1, 1,
-0.9079159, -1.277789, -1.812644, 1, 1, 1, 1, 1,
-0.9053057, -1.108731, -1.185084, 1, 1, 1, 1, 1,
-0.9023665, 1.083638, -1.74471, 1, 1, 1, 1, 1,
-0.8972532, -0.2555656, -2.021911, 1, 1, 1, 1, 1,
-0.8940129, 0.6235269, -2.843864, 1, 1, 1, 1, 1,
-0.8912335, 0.08949593, -1.181018, 1, 1, 1, 1, 1,
-0.8860188, -0.0935633, -0.9245335, 1, 1, 1, 1, 1,
-0.8844881, -0.06746975, -2.221551, 1, 1, 1, 1, 1,
-0.8796455, 1.302494, -0.1061562, 1, 1, 1, 1, 1,
-0.8789897, -0.6141112, -0.7545462, 1, 1, 1, 1, 1,
-0.8786328, -0.1020831, -1.131024, 1, 1, 1, 1, 1,
-0.8760047, -0.2014366, -4.12277, 1, 1, 1, 1, 1,
-0.8753214, 0.4951876, -2.722383, 1, 1, 1, 1, 1,
-0.8659891, -0.2925366, -1.401092, 1, 1, 1, 1, 1,
-0.853969, 1.179356, 0.4974935, 1, 1, 1, 1, 1,
-0.8445222, -0.0755491, -1.622076, 0, 0, 1, 1, 1,
-0.8371587, 0.7015063, -1.489204, 1, 0, 0, 1, 1,
-0.8288485, 0.007868871, -2.617579, 1, 0, 0, 1, 1,
-0.8276381, -1.11034, -1.508562, 1, 0, 0, 1, 1,
-0.8248404, -2.77659, -3.045216, 1, 0, 0, 1, 1,
-0.824634, 0.03133464, -1.866264, 1, 0, 0, 1, 1,
-0.8168522, -0.1010297, -0.7245296, 0, 0, 0, 1, 1,
-0.8159963, -0.1864737, -0.4036429, 0, 0, 0, 1, 1,
-0.8126081, -0.4805138, -1.90576, 0, 0, 0, 1, 1,
-0.8119298, 0.2763843, -0.9576298, 0, 0, 0, 1, 1,
-0.8001592, 0.5379738, 0.07082485, 0, 0, 0, 1, 1,
-0.7967582, -0.04959319, -0.6840016, 0, 0, 0, 1, 1,
-0.7939575, 0.5047131, -1.846377, 0, 0, 0, 1, 1,
-0.7924188, -0.3771141, -1.282385, 1, 1, 1, 1, 1,
-0.7913907, 0.3171417, -0.8373005, 1, 1, 1, 1, 1,
-0.7910488, -1.239864, -1.736935, 1, 1, 1, 1, 1,
-0.7897528, -0.6699396, -1.082656, 1, 1, 1, 1, 1,
-0.7878909, -2.305263, -2.794915, 1, 1, 1, 1, 1,
-0.7821331, -0.1642147, -0.444795, 1, 1, 1, 1, 1,
-0.7793471, -1.701638, -3.455008, 1, 1, 1, 1, 1,
-0.7790696, 0.9716065, -0.2110148, 1, 1, 1, 1, 1,
-0.7734618, 0.5218732, -0.7987392, 1, 1, 1, 1, 1,
-0.7719934, 1.031233, -0.6632527, 1, 1, 1, 1, 1,
-0.7685434, 1.568416, -1.849329, 1, 1, 1, 1, 1,
-0.7659965, -0.3763294, -1.809569, 1, 1, 1, 1, 1,
-0.7616795, 0.4770462, -0.1574996, 1, 1, 1, 1, 1,
-0.7604762, -0.171828, -2.868426, 1, 1, 1, 1, 1,
-0.7596436, -0.8827919, -3.133953, 1, 1, 1, 1, 1,
-0.7595092, 0.4960406, 0.5713784, 0, 0, 1, 1, 1,
-0.7567741, -0.609362, -2.543042, 1, 0, 0, 1, 1,
-0.7555284, -0.09900578, -2.355206, 1, 0, 0, 1, 1,
-0.7545522, -0.4680161, 0.8511894, 1, 0, 0, 1, 1,
-0.7543336, -0.8099812, -2.991558, 1, 0, 0, 1, 1,
-0.746994, -0.6763341, -3.913296, 1, 0, 0, 1, 1,
-0.7454212, 1.140822, -1.048469, 0, 0, 0, 1, 1,
-0.7427312, -0.7907711, -1.911118, 0, 0, 0, 1, 1,
-0.7340866, -0.3446871, -1.898402, 0, 0, 0, 1, 1,
-0.7207968, 0.3306747, -0.3659233, 0, 0, 0, 1, 1,
-0.7177647, 1.23956, -0.7815686, 0, 0, 0, 1, 1,
-0.7127684, -0.040301, -0.49998, 0, 0, 0, 1, 1,
-0.7126039, -1.247248, -2.303948, 0, 0, 0, 1, 1,
-0.7119097, 1.117542, -1.452594, 1, 1, 1, 1, 1,
-0.7107269, -1.685098, -1.582002, 1, 1, 1, 1, 1,
-0.7037236, 0.829731, -2.616179, 1, 1, 1, 1, 1,
-0.6942315, -0.06290596, -1.488903, 1, 1, 1, 1, 1,
-0.693643, 0.06604236, -3.44144, 1, 1, 1, 1, 1,
-0.6923637, -1.087068, -1.854654, 1, 1, 1, 1, 1,
-0.6920364, 0.9441682, -0.3725403, 1, 1, 1, 1, 1,
-0.6895964, -2.346366, -2.845633, 1, 1, 1, 1, 1,
-0.6885253, 1.354824, -0.927038, 1, 1, 1, 1, 1,
-0.6860005, -0.5344014, -1.407165, 1, 1, 1, 1, 1,
-0.6807489, -1.244911, -3.484029, 1, 1, 1, 1, 1,
-0.6804425, 2.237623, -0.09952705, 1, 1, 1, 1, 1,
-0.6691115, -0.1337651, -1.182996, 1, 1, 1, 1, 1,
-0.6659053, -0.04949897, -0.4566011, 1, 1, 1, 1, 1,
-0.6650538, -1.636976, -2.112082, 1, 1, 1, 1, 1,
-0.6647391, 0.5433346, -0.6800274, 0, 0, 1, 1, 1,
-0.6598399, -0.3656586, -1.981487, 1, 0, 0, 1, 1,
-0.656889, 0.1682077, -3.397773, 1, 0, 0, 1, 1,
-0.6559379, -0.6154816, -3.672479, 1, 0, 0, 1, 1,
-0.6526302, -0.04169627, -0.6873529, 1, 0, 0, 1, 1,
-0.6520361, 0.4388039, 1.565505, 1, 0, 0, 1, 1,
-0.6501935, -0.8714523, -1.901849, 0, 0, 0, 1, 1,
-0.6486738, 0.05742931, -2.51791, 0, 0, 0, 1, 1,
-0.6462135, 0.7021048, 1.365926, 0, 0, 0, 1, 1,
-0.6388333, 1.225416, -1.223784, 0, 0, 0, 1, 1,
-0.6380135, 0.2369734, -1.288199, 0, 0, 0, 1, 1,
-0.6365579, -0.4198861, -2.339894, 0, 0, 0, 1, 1,
-0.6361601, -0.9275218, -2.891196, 0, 0, 0, 1, 1,
-0.6312677, 0.345604, -1.724879, 1, 1, 1, 1, 1,
-0.6304526, 0.05963163, -1.157017, 1, 1, 1, 1, 1,
-0.6288537, 0.3507448, -0.6548408, 1, 1, 1, 1, 1,
-0.628634, 0.9177726, -0.5633481, 1, 1, 1, 1, 1,
-0.6286294, -0.608822, -4.062461, 1, 1, 1, 1, 1,
-0.6279024, 0.3558204, -1.134734, 1, 1, 1, 1, 1,
-0.6265689, -0.02431999, -1.087233, 1, 1, 1, 1, 1,
-0.6207421, -0.3684407, -2.471809, 1, 1, 1, 1, 1,
-0.6163455, -0.66254, -2.472742, 1, 1, 1, 1, 1,
-0.6148385, 1.488352, -0.7584347, 1, 1, 1, 1, 1,
-0.6122537, -0.3414025, -1.392645, 1, 1, 1, 1, 1,
-0.6089236, -0.7229651, -2.900851, 1, 1, 1, 1, 1,
-0.6076481, 0.870749, -1.732264, 1, 1, 1, 1, 1,
-0.6056103, -1.014181, -1.210802, 1, 1, 1, 1, 1,
-0.5975332, 0.005409527, -2.343265, 1, 1, 1, 1, 1,
-0.593433, -1.139732, -3.970214, 0, 0, 1, 1, 1,
-0.5927508, 0.8128601, -0.6564006, 1, 0, 0, 1, 1,
-0.5922872, -2.554557, -3.760728, 1, 0, 0, 1, 1,
-0.5921609, -1.138156, -2.926009, 1, 0, 0, 1, 1,
-0.5920755, -1.680077, -2.756542, 1, 0, 0, 1, 1,
-0.5903186, -0.905474, -2.033571, 1, 0, 0, 1, 1,
-0.5877126, -1.284281, -2.000028, 0, 0, 0, 1, 1,
-0.5832744, -1.276909, -1.371992, 0, 0, 0, 1, 1,
-0.5827393, -0.1996932, -1.615475, 0, 0, 0, 1, 1,
-0.5710589, -0.1031395, -3.421431, 0, 0, 0, 1, 1,
-0.5638657, 1.64795, -0.3174256, 0, 0, 0, 1, 1,
-0.5611355, -0.7709476, -3.550389, 0, 0, 0, 1, 1,
-0.5562122, 0.5006022, -1.513184, 0, 0, 0, 1, 1,
-0.5530416, 0.3899402, -0.7884315, 1, 1, 1, 1, 1,
-0.5483008, 1.364213, 1.090922, 1, 1, 1, 1, 1,
-0.5458808, 0.1046671, -1.146279, 1, 1, 1, 1, 1,
-0.5410345, -0.04713476, -2.268023, 1, 1, 1, 1, 1,
-0.5406372, -0.7119586, -4.866589, 1, 1, 1, 1, 1,
-0.5397072, 0.8794061, -3.401469, 1, 1, 1, 1, 1,
-0.5327516, 1.751632, 0.7562516, 1, 1, 1, 1, 1,
-0.5261658, 1.156144, 1.115263, 1, 1, 1, 1, 1,
-0.5216938, -1.808347, -4.243945, 1, 1, 1, 1, 1,
-0.52078, -2.157409, -4.452795, 1, 1, 1, 1, 1,
-0.5195586, 0.6903855, -0.2424764, 1, 1, 1, 1, 1,
-0.5187259, 0.4429649, -1.618877, 1, 1, 1, 1, 1,
-0.517574, 1.324174, 1.053416, 1, 1, 1, 1, 1,
-0.5169179, -1.452563, -2.961451, 1, 1, 1, 1, 1,
-0.5124434, 1.345437, -2.832894, 1, 1, 1, 1, 1,
-0.5110422, -0.7796686, -1.720284, 0, 0, 1, 1, 1,
-0.5073873, 1.805985, 1.215324, 1, 0, 0, 1, 1,
-0.5043702, 0.02103037, -1.11769, 1, 0, 0, 1, 1,
-0.5033435, -0.8748997, -3.271092, 1, 0, 0, 1, 1,
-0.5030175, -1.522858, -3.923376, 1, 0, 0, 1, 1,
-0.5010861, 1.187743, -1.716217, 1, 0, 0, 1, 1,
-0.4983679, 1.936849, -0.8357878, 0, 0, 0, 1, 1,
-0.4976746, 0.7567999, -0.3964906, 0, 0, 0, 1, 1,
-0.496823, -0.4505953, 0.05816649, 0, 0, 0, 1, 1,
-0.4923056, -0.4476404, -2.394262, 0, 0, 0, 1, 1,
-0.489296, 0.4509924, -0.7052066, 0, 0, 0, 1, 1,
-0.4892292, -0.1864806, -1.234889, 0, 0, 0, 1, 1,
-0.4846851, 1.133299, -0.07717238, 0, 0, 0, 1, 1,
-0.4826152, -0.7346067, -2.370415, 1, 1, 1, 1, 1,
-0.4816443, -0.4044223, -3.38581, 1, 1, 1, 1, 1,
-0.4815275, -0.1769639, -1.662321, 1, 1, 1, 1, 1,
-0.4782431, 0.3609392, -1.135325, 1, 1, 1, 1, 1,
-0.4763844, -0.07463921, -0.5383353, 1, 1, 1, 1, 1,
-0.4716932, -0.423645, -1.983357, 1, 1, 1, 1, 1,
-0.4668022, -0.8710848, -2.630872, 1, 1, 1, 1, 1,
-0.4652835, 0.06740931, -0.4704397, 1, 1, 1, 1, 1,
-0.4650457, -0.06383248, -0.6485885, 1, 1, 1, 1, 1,
-0.461033, -0.6957801, -3.28118, 1, 1, 1, 1, 1,
-0.4562522, -0.3650354, -2.930328, 1, 1, 1, 1, 1,
-0.4546531, -1.023643, -1.811897, 1, 1, 1, 1, 1,
-0.4378867, -0.7300763, -2.098105, 1, 1, 1, 1, 1,
-0.4374554, 0.1251534, 0.08060007, 1, 1, 1, 1, 1,
-0.4337199, -0.6115999, -1.561811, 1, 1, 1, 1, 1,
-0.4320535, 1.46918, 1.41545, 0, 0, 1, 1, 1,
-0.430689, -0.6378008, -1.806794, 1, 0, 0, 1, 1,
-0.4291239, 1.353521, -0.8837011, 1, 0, 0, 1, 1,
-0.4282686, -0.04209121, -1.568761, 1, 0, 0, 1, 1,
-0.4155214, 1.458114, -0.9075555, 1, 0, 0, 1, 1,
-0.4125373, 0.3884534, -1.815227, 1, 0, 0, 1, 1,
-0.4098927, 1.897991, -0.04989057, 0, 0, 0, 1, 1,
-0.4063649, -0.01647367, -2.129192, 0, 0, 0, 1, 1,
-0.4042596, -0.1385818, -3.273474, 0, 0, 0, 1, 1,
-0.4034405, 0.5825456, 0.01552616, 0, 0, 0, 1, 1,
-0.4002931, -0.6972193, -2.94936, 0, 0, 0, 1, 1,
-0.3968817, -0.1208553, -2.901335, 0, 0, 0, 1, 1,
-0.3966395, -0.3079424, -0.6280698, 0, 0, 0, 1, 1,
-0.3963472, -1.536022, -3.964493, 1, 1, 1, 1, 1,
-0.3960568, -0.06323583, -1.619727, 1, 1, 1, 1, 1,
-0.3925736, 0.4105715, -1.022924, 1, 1, 1, 1, 1,
-0.3891506, 0.3706569, -0.6138768, 1, 1, 1, 1, 1,
-0.389009, 1.14796, 0.7292448, 1, 1, 1, 1, 1,
-0.3864881, 0.3332149, 0.3342117, 1, 1, 1, 1, 1,
-0.3863384, 1.307166, 0.1952886, 1, 1, 1, 1, 1,
-0.383085, -0.4836297, -2.20327, 1, 1, 1, 1, 1,
-0.38287, 0.5726072, 0.2542316, 1, 1, 1, 1, 1,
-0.37979, -1.275971, -2.164365, 1, 1, 1, 1, 1,
-0.3788063, -0.5093578, -3.526643, 1, 1, 1, 1, 1,
-0.3763305, -0.03362725, -2.415307, 1, 1, 1, 1, 1,
-0.3762722, -0.2990074, -0.5724519, 1, 1, 1, 1, 1,
-0.3754034, -0.4629212, -3.076681, 1, 1, 1, 1, 1,
-0.3713522, -0.05215592, -2.339092, 1, 1, 1, 1, 1,
-0.3702863, 0.151748, -1.062452, 0, 0, 1, 1, 1,
-0.3655484, -0.3390541, -2.222411, 1, 0, 0, 1, 1,
-0.3654663, -1.82484, -1.335009, 1, 0, 0, 1, 1,
-0.3633044, 0.6986488, 1.726035, 1, 0, 0, 1, 1,
-0.3631319, -0.1453052, -0.3640078, 1, 0, 0, 1, 1,
-0.362465, -0.6843597, -1.635474, 1, 0, 0, 1, 1,
-0.3572848, 0.1057594, 0.1745974, 0, 0, 0, 1, 1,
-0.3572352, -1.720727, -2.202537, 0, 0, 0, 1, 1,
-0.3568369, 0.7126842, -2.19811, 0, 0, 0, 1, 1,
-0.3562927, -0.2253137, -2.653557, 0, 0, 0, 1, 1,
-0.355081, -0.594209, -2.989255, 0, 0, 0, 1, 1,
-0.3541877, -0.7844878, -2.331696, 0, 0, 0, 1, 1,
-0.349372, -0.120777, -0.2769689, 0, 0, 0, 1, 1,
-0.3475461, -0.3003833, -2.081253, 1, 1, 1, 1, 1,
-0.3447901, -1.453555, -3.116566, 1, 1, 1, 1, 1,
-0.3442505, 0.473888, -0.06475484, 1, 1, 1, 1, 1,
-0.3433569, -0.4228817, -2.057274, 1, 1, 1, 1, 1,
-0.3385051, -1.148457, -2.757576, 1, 1, 1, 1, 1,
-0.3372862, 1.442426, 0.9145534, 1, 1, 1, 1, 1,
-0.335378, -0.889422, -2.659881, 1, 1, 1, 1, 1,
-0.3290286, 0.3622516, -1.324164, 1, 1, 1, 1, 1,
-0.3269216, 0.002721263, -1.807229, 1, 1, 1, 1, 1,
-0.3174386, 0.9561716, 0.1497227, 1, 1, 1, 1, 1,
-0.3157058, 1.177532, -0.09145176, 1, 1, 1, 1, 1,
-0.3153118, -0.7732192, -1.616567, 1, 1, 1, 1, 1,
-0.3144337, -0.7507401, -3.265209, 1, 1, 1, 1, 1,
-0.3142118, 0.5697682, -0.7611877, 1, 1, 1, 1, 1,
-0.3134497, 0.6310291, -1.918355, 1, 1, 1, 1, 1,
-0.3133941, 0.5289932, 0.2301046, 0, 0, 1, 1, 1,
-0.3103221, 1.239349, 0.6178654, 1, 0, 0, 1, 1,
-0.3093743, 0.8330826, -1.923125, 1, 0, 0, 1, 1,
-0.3054383, -0.3220578, -1.647612, 1, 0, 0, 1, 1,
-0.304775, -0.2808953, -2.710671, 1, 0, 0, 1, 1,
-0.30056, -1.039899, -1.418602, 1, 0, 0, 1, 1,
-0.2990524, 1.561471, 0.8157094, 0, 0, 0, 1, 1,
-0.2980025, 0.5574594, -1.570952, 0, 0, 0, 1, 1,
-0.2972409, -0.06445839, -3.138064, 0, 0, 0, 1, 1,
-0.2969138, 0.5185161, -2.425107, 0, 0, 0, 1, 1,
-0.2942815, -1.162564, -2.628515, 0, 0, 0, 1, 1,
-0.2941161, -1.872273, -1.380412, 0, 0, 0, 1, 1,
-0.2912277, -0.1232498, -2.726218, 0, 0, 0, 1, 1,
-0.2811434, -0.1495763, -1.590737, 1, 1, 1, 1, 1,
-0.2760387, -1.298531, -3.840234, 1, 1, 1, 1, 1,
-0.2744897, -0.1568547, -1.887003, 1, 1, 1, 1, 1,
-0.2720885, -0.9341916, -3.535183, 1, 1, 1, 1, 1,
-0.2682752, 0.2754555, -2.30441, 1, 1, 1, 1, 1,
-0.2680456, -0.5064707, -1.982003, 1, 1, 1, 1, 1,
-0.2677246, -0.08731899, -2.109305, 1, 1, 1, 1, 1,
-0.2595208, -0.5930098, -2.330701, 1, 1, 1, 1, 1,
-0.2588023, 0.7576652, -0.5839159, 1, 1, 1, 1, 1,
-0.2579658, 0.8944727, 2.92589, 1, 1, 1, 1, 1,
-0.2574299, -1.215421, -2.547611, 1, 1, 1, 1, 1,
-0.254806, 1.051668, 0.5876785, 1, 1, 1, 1, 1,
-0.253642, 0.5662408, -0.1530748, 1, 1, 1, 1, 1,
-0.2472103, -3.492359, -4.878583, 1, 1, 1, 1, 1,
-0.2451283, 1.543563, 1.621068, 1, 1, 1, 1, 1,
-0.2439913, 1.274422, -0.4503371, 0, 0, 1, 1, 1,
-0.2435386, -0.6512423, -3.657614, 1, 0, 0, 1, 1,
-0.2417861, -0.06165731, -0.9074355, 1, 0, 0, 1, 1,
-0.2343173, 0.155576, -1.645965, 1, 0, 0, 1, 1,
-0.2249909, -0.1727603, -1.927825, 1, 0, 0, 1, 1,
-0.2244869, -0.1366169, -3.364522, 1, 0, 0, 1, 1,
-0.2210482, 0.3875476, -0.2197615, 0, 0, 0, 1, 1,
-0.215679, 0.7388933, -0.5066169, 0, 0, 0, 1, 1,
-0.2153697, -1.042132, -2.482251, 0, 0, 0, 1, 1,
-0.2149167, -0.4666056, -3.498141, 0, 0, 0, 1, 1,
-0.2136313, 0.14001, -1.730354, 0, 0, 0, 1, 1,
-0.211791, -0.2976241, -2.610652, 0, 0, 0, 1, 1,
-0.2099734, -0.9714332, -3.481169, 0, 0, 0, 1, 1,
-0.2041324, -1.719433, -3.943097, 1, 1, 1, 1, 1,
-0.203907, 0.6485667, 0.01411465, 1, 1, 1, 1, 1,
-0.1972245, -0.07447057, -2.871305, 1, 1, 1, 1, 1,
-0.1967076, 0.7831838, -1.801501, 1, 1, 1, 1, 1,
-0.1958863, -2.286335, -2.202713, 1, 1, 1, 1, 1,
-0.1918711, 1.437721, 0.519837, 1, 1, 1, 1, 1,
-0.1909794, -0.752087, -2.714181, 1, 1, 1, 1, 1,
-0.1901557, 0.8197626, -0.9837273, 1, 1, 1, 1, 1,
-0.1830973, -1.105644, -1.899859, 1, 1, 1, 1, 1,
-0.1604962, 0.5735987, 1.587011, 1, 1, 1, 1, 1,
-0.1579096, 0.3593381, 0.6441666, 1, 1, 1, 1, 1,
-0.1570745, 0.79185, 1.279924, 1, 1, 1, 1, 1,
-0.1569185, -0.3052822, -2.529209, 1, 1, 1, 1, 1,
-0.1567768, 1.466145, 0.8168145, 1, 1, 1, 1, 1,
-0.1539609, 0.7843256, -0.4352784, 1, 1, 1, 1, 1,
-0.1494285, -1.585623, -1.686326, 0, 0, 1, 1, 1,
-0.1473797, -0.5781233, -3.281018, 1, 0, 0, 1, 1,
-0.1457266, 0.9970946, -1.446608, 1, 0, 0, 1, 1,
-0.1439918, -1.41003, -4.707467, 1, 0, 0, 1, 1,
-0.1429832, 1.248487, -2.146618, 1, 0, 0, 1, 1,
-0.140982, -0.4220313, -3.34268, 1, 0, 0, 1, 1,
-0.1404916, 0.3082159, 0.5194751, 0, 0, 0, 1, 1,
-0.1402274, 1.841232, -1.351015, 0, 0, 0, 1, 1,
-0.1398823, -0.1886863, -1.573883, 0, 0, 0, 1, 1,
-0.1397956, 0.9807276, 0.659273, 0, 0, 0, 1, 1,
-0.1390287, 0.3603783, -2.721214, 0, 0, 0, 1, 1,
-0.1378772, 0.119199, -1.146749, 0, 0, 0, 1, 1,
-0.1372923, 0.2565902, 0.06059176, 0, 0, 0, 1, 1,
-0.1334141, -0.126116, -1.685825, 1, 1, 1, 1, 1,
-0.1228469, -1.07113, -3.60927, 1, 1, 1, 1, 1,
-0.1199195, 1.877297, -3.028801, 1, 1, 1, 1, 1,
-0.1176765, 2.69101, -0.565958, 1, 1, 1, 1, 1,
-0.1153085, 0.3550263, -0.9622871, 1, 1, 1, 1, 1,
-0.1143452, 1.160125, 0.4683892, 1, 1, 1, 1, 1,
-0.11387, -0.5022287, -4.424726, 1, 1, 1, 1, 1,
-0.11135, 0.9465523, -0.3094946, 1, 1, 1, 1, 1,
-0.105827, 0.2682434, -0.8119277, 1, 1, 1, 1, 1,
-0.1048054, -0.4660661, -3.042393, 1, 1, 1, 1, 1,
-0.10246, 0.5525089, -1.078319, 1, 1, 1, 1, 1,
-0.1018753, 0.1459326, -0.08044463, 1, 1, 1, 1, 1,
-0.09551431, -0.6518232, -4.189107, 1, 1, 1, 1, 1,
-0.09392479, -0.2445204, -3.171689, 1, 1, 1, 1, 1,
-0.08433639, 0.5344133, -0.7124957, 1, 1, 1, 1, 1,
-0.08083104, 0.2267974, -0.7345939, 0, 0, 1, 1, 1,
-0.07410973, 0.9279115, -2.058452, 1, 0, 0, 1, 1,
-0.07047249, 1.537816, 0.003408422, 1, 0, 0, 1, 1,
-0.06829514, -0.4879798, -3.921361, 1, 0, 0, 1, 1,
-0.06320047, 2.072108, 0.5528859, 1, 0, 0, 1, 1,
-0.05218265, 1.218426, -0.8251334, 1, 0, 0, 1, 1,
-0.05151109, -0.3784716, -3.799894, 0, 0, 0, 1, 1,
-0.05111032, -0.7019857, -4.985834, 0, 0, 0, 1, 1,
-0.05077599, -0.7406929, -4.823617, 0, 0, 0, 1, 1,
-0.04997164, 0.3316608, -0.1715195, 0, 0, 0, 1, 1,
-0.04940726, 0.596473, -0.3927781, 0, 0, 0, 1, 1,
-0.04815814, -1.025491, -4.869811, 0, 0, 0, 1, 1,
-0.04595586, 0.8927752, 1.150024, 0, 0, 0, 1, 1,
-0.0451897, 0.1081833, -1.233343, 1, 1, 1, 1, 1,
-0.0448571, 0.139046, 0.7851645, 1, 1, 1, 1, 1,
-0.04074921, 1.737756, 1.136368, 1, 1, 1, 1, 1,
-0.03861367, -2.288593, -1.743981, 1, 1, 1, 1, 1,
-0.03514578, 0.6030036, 1.417082, 1, 1, 1, 1, 1,
-0.03231117, -0.2082924, -4.042259, 1, 1, 1, 1, 1,
-0.03167814, 0.4451125, 0.2570772, 1, 1, 1, 1, 1,
-0.02836983, -0.5989402, -1.973934, 1, 1, 1, 1, 1,
-0.02462544, -0.9580395, -3.142407, 1, 1, 1, 1, 1,
-0.02228525, 1.305292, -0.4395026, 1, 1, 1, 1, 1,
-0.01342642, 0.8377993, 1.628045, 1, 1, 1, 1, 1,
-0.01098199, 1.471128, 1.137458, 1, 1, 1, 1, 1,
-0.008850088, -1.416695, -3.728812, 1, 1, 1, 1, 1,
-0.008689732, 1.060702, 1.452345, 1, 1, 1, 1, 1,
-0.007986774, 1.236177, 0.7676315, 1, 1, 1, 1, 1,
-0.006963498, 0.1554586, -1.219174, 0, 0, 1, 1, 1,
-0.002094898, 1.332421, -1.123241, 1, 0, 0, 1, 1,
0.002834257, -0.9828212, 2.707549, 1, 0, 0, 1, 1,
0.00442119, 0.6325759, 0.5024644, 1, 0, 0, 1, 1,
0.004617163, 0.1460198, -0.7459903, 1, 0, 0, 1, 1,
0.006066039, 1.463973, 0.7642126, 1, 0, 0, 1, 1,
0.009307082, -0.1779636, 2.038956, 0, 0, 0, 1, 1,
0.009798484, -1.119391, 3.99297, 0, 0, 0, 1, 1,
0.01188901, 0.3529646, 0.9093103, 0, 0, 0, 1, 1,
0.01749499, 0.1820092, 0.2334332, 0, 0, 0, 1, 1,
0.02317332, -0.1510756, 1.827835, 0, 0, 0, 1, 1,
0.0254588, 0.4184129, 1.216074, 0, 0, 0, 1, 1,
0.03201582, -0.7503327, 2.259206, 0, 0, 0, 1, 1,
0.03259225, 0.09819499, -0.2558372, 1, 1, 1, 1, 1,
0.0328727, 0.8343022, -0.7013136, 1, 1, 1, 1, 1,
0.03382207, -0.07960035, 2.837227, 1, 1, 1, 1, 1,
0.03981266, 1.344902, -0.2648576, 1, 1, 1, 1, 1,
0.04090806, -0.2426139, 2.104006, 1, 1, 1, 1, 1,
0.0414773, -0.7560793, 2.652639, 1, 1, 1, 1, 1,
0.04182353, 0.2404649, 0.3730752, 1, 1, 1, 1, 1,
0.04388553, -1.437309, 4.044093, 1, 1, 1, 1, 1,
0.04452655, -1.332774, 2.100256, 1, 1, 1, 1, 1,
0.04620625, -0.4139498, 0.3955163, 1, 1, 1, 1, 1,
0.0483572, 0.6282884, 1.008436, 1, 1, 1, 1, 1,
0.05499095, 2.091605, 1.574014, 1, 1, 1, 1, 1,
0.05558233, -0.4161522, 4.005054, 1, 1, 1, 1, 1,
0.05702186, -0.07314796, 0.9509387, 1, 1, 1, 1, 1,
0.06247245, -0.1653683, 1.902442, 1, 1, 1, 1, 1,
0.06579964, 0.7048778, 0.09704144, 0, 0, 1, 1, 1,
0.06868429, -1.454878, 5.975411, 1, 0, 0, 1, 1,
0.07036991, -1.03894, 2.422535, 1, 0, 0, 1, 1,
0.075011, -0.7634936, 2.7501, 1, 0, 0, 1, 1,
0.0802275, 1.001902, -0.4758101, 1, 0, 0, 1, 1,
0.08258858, -0.7490755, 1.970589, 1, 0, 0, 1, 1,
0.08426875, -0.9309601, 2.687809, 0, 0, 0, 1, 1,
0.08456808, 0.2156729, 0.9774581, 0, 0, 0, 1, 1,
0.08785935, -0.6779313, 3.700814, 0, 0, 0, 1, 1,
0.09402026, 0.5723821, -0.5394224, 0, 0, 0, 1, 1,
0.09402502, 0.7233305, 0.1650763, 0, 0, 0, 1, 1,
0.09442487, 1.689327, -1.512092, 0, 0, 0, 1, 1,
0.09553263, -0.6256264, 3.579501, 0, 0, 0, 1, 1,
0.09654382, 1.040382, 0.4605398, 1, 1, 1, 1, 1,
0.1004798, -0.02812584, 3.709556, 1, 1, 1, 1, 1,
0.1014144, -0.3889059, 5.033895, 1, 1, 1, 1, 1,
0.1015378, -0.2176366, 1.392161, 1, 1, 1, 1, 1,
0.102583, -1.222113, 4.631312, 1, 1, 1, 1, 1,
0.1086967, 0.2238949, 1.968495, 1, 1, 1, 1, 1,
0.1089262, -0.2237602, 1.96472, 1, 1, 1, 1, 1,
0.1141345, -0.631644, 2.508866, 1, 1, 1, 1, 1,
0.1167302, 0.7353448, 1.87658, 1, 1, 1, 1, 1,
0.1187454, -2.226701, 2.547154, 1, 1, 1, 1, 1,
0.1196393, 0.8122723, -0.6653136, 1, 1, 1, 1, 1,
0.1199697, -2.380218, 2.634747, 1, 1, 1, 1, 1,
0.1200688, -1.063915, 2.27006, 1, 1, 1, 1, 1,
0.1242302, 1.071459, 1.257952, 1, 1, 1, 1, 1,
0.1257855, 0.2068221, -0.9521391, 1, 1, 1, 1, 1,
0.1280827, 1.10368, 1.208945, 0, 0, 1, 1, 1,
0.1285335, 0.7368134, -0.2533762, 1, 0, 0, 1, 1,
0.133127, -0.4099364, 1.216316, 1, 0, 0, 1, 1,
0.1449772, 1.07227, 0.7297261, 1, 0, 0, 1, 1,
0.1467917, -0.151515, 4.04182, 1, 0, 0, 1, 1,
0.1476584, -1.954299, 2.671418, 1, 0, 0, 1, 1,
0.1477856, -0.5439549, 2.384084, 0, 0, 0, 1, 1,
0.1522447, 0.734117, -0.2575905, 0, 0, 0, 1, 1,
0.1541454, 0.08248892, 2.72223, 0, 0, 0, 1, 1,
0.1550786, 0.6573663, 2.736888, 0, 0, 0, 1, 1,
0.1560741, -0.9690694, 2.130582, 0, 0, 0, 1, 1,
0.1570671, 0.4334991, -0.004714881, 0, 0, 0, 1, 1,
0.1595594, 0.5658302, -0.3986652, 0, 0, 0, 1, 1,
0.1622423, 1.472786, -0.4347211, 1, 1, 1, 1, 1,
0.16522, -1.460984, 2.844749, 1, 1, 1, 1, 1,
0.165713, 0.5374889, 0.4569688, 1, 1, 1, 1, 1,
0.1669181, -1.03221, 1.14163, 1, 1, 1, 1, 1,
0.1704188, 0.00316563, 0.5182576, 1, 1, 1, 1, 1,
0.1715134, -0.4057912, 2.536715, 1, 1, 1, 1, 1,
0.1750573, -0.3552128, 2.21222, 1, 1, 1, 1, 1,
0.1772309, -1.280651, 0.7303231, 1, 1, 1, 1, 1,
0.1773865, 0.8900757, -0.03001621, 1, 1, 1, 1, 1,
0.1905502, -0.1499808, 1.00194, 1, 1, 1, 1, 1,
0.1905766, 1.183615, -0.7113158, 1, 1, 1, 1, 1,
0.191701, -0.8559625, 2.254159, 1, 1, 1, 1, 1,
0.2014604, -0.3532827, 3.141531, 1, 1, 1, 1, 1,
0.2016828, -0.7993753, 2.178071, 1, 1, 1, 1, 1,
0.2023235, -0.6086854, 3.064272, 1, 1, 1, 1, 1,
0.2102894, -0.790058, 3.859476, 0, 0, 1, 1, 1,
0.2149471, -0.4672592, 4.68727, 1, 0, 0, 1, 1,
0.2175905, -0.4985112, 2.810658, 1, 0, 0, 1, 1,
0.2199586, 1.766729, 1.183993, 1, 0, 0, 1, 1,
0.2222628, 2.141573, -0.3308315, 1, 0, 0, 1, 1,
0.2311464, -0.3376402, 2.31969, 1, 0, 0, 1, 1,
0.2312196, 0.2444215, -0.1627923, 0, 0, 0, 1, 1,
0.2312401, 0.8455022, 1.054282, 0, 0, 0, 1, 1,
0.2312854, -0.6646702, 2.839448, 0, 0, 0, 1, 1,
0.2324401, 0.1298397, -0.3138942, 0, 0, 0, 1, 1,
0.2347766, 0.3230499, 0.004728961, 0, 0, 0, 1, 1,
0.2348888, 0.8172219, 0.5319105, 0, 0, 0, 1, 1,
0.2359666, 0.6446483, 0.9614172, 0, 0, 0, 1, 1,
0.23755, 0.879584, 1.956599, 1, 1, 1, 1, 1,
0.2391609, -1.669905, 2.467977, 1, 1, 1, 1, 1,
0.2393067, 0.2009716, 0.7076092, 1, 1, 1, 1, 1,
0.246626, 1.595452, 0.3611917, 1, 1, 1, 1, 1,
0.2528447, -0.2650023, 1.658879, 1, 1, 1, 1, 1,
0.2561426, 0.5932686, 1.131014, 1, 1, 1, 1, 1,
0.2569929, -0.05865686, 0.765394, 1, 1, 1, 1, 1,
0.2585239, 1.930755, -0.08228303, 1, 1, 1, 1, 1,
0.2590972, -0.2301136, 1.768141, 1, 1, 1, 1, 1,
0.2656774, 0.07206884, 1.529266, 1, 1, 1, 1, 1,
0.2709595, -0.3483112, 3.826679, 1, 1, 1, 1, 1,
0.2741326, 0.8868849, -0.9123894, 1, 1, 1, 1, 1,
0.2796308, 0.2558664, -2.026754, 1, 1, 1, 1, 1,
0.2809153, 0.7725981, -0.3365259, 1, 1, 1, 1, 1,
0.2816707, -0.07528947, -0.4545079, 1, 1, 1, 1, 1,
0.2855009, -1.311699, 2.050586, 0, 0, 1, 1, 1,
0.2917958, -1.663949, 3.12267, 1, 0, 0, 1, 1,
0.2935987, -0.2168564, 1.35341, 1, 0, 0, 1, 1,
0.2940227, -0.7473318, 2.023946, 1, 0, 0, 1, 1,
0.296765, -1.33019, 2.673675, 1, 0, 0, 1, 1,
0.2972265, 1.077572, -0.3456498, 1, 0, 0, 1, 1,
0.2973479, 0.85675, 0.3905168, 0, 0, 0, 1, 1,
0.2998678, 1.889154, 0.2081353, 0, 0, 0, 1, 1,
0.3024006, -0.06251212, 2.522788, 0, 0, 0, 1, 1,
0.3032892, -0.3954804, 1.424438, 0, 0, 0, 1, 1,
0.3038473, 0.4214018, 0.6301452, 0, 0, 0, 1, 1,
0.3076336, 0.5470521, 0.8396399, 0, 0, 0, 1, 1,
0.3095442, 0.3250899, 2.920183, 0, 0, 0, 1, 1,
0.3103476, 0.4886282, 1.179159, 1, 1, 1, 1, 1,
0.3138624, 0.8107463, 1.43238, 1, 1, 1, 1, 1,
0.3141733, -1.849378, 3.181901, 1, 1, 1, 1, 1,
0.31639, 1.085971, -0.6339027, 1, 1, 1, 1, 1,
0.3206647, 2.414384, 0.9552391, 1, 1, 1, 1, 1,
0.3245407, -0.8336912, 2.364308, 1, 1, 1, 1, 1,
0.324773, 0.522955, 0.4865138, 1, 1, 1, 1, 1,
0.331532, -1.413894, 2.92475, 1, 1, 1, 1, 1,
0.3345723, -0.2461751, 1.509526, 1, 1, 1, 1, 1,
0.3350158, 0.2769425, 1.223922, 1, 1, 1, 1, 1,
0.3360723, 1.324775, 2.610461, 1, 1, 1, 1, 1,
0.3391759, 0.4009787, 1.034078, 1, 1, 1, 1, 1,
0.3402812, -1.068439, 3.402073, 1, 1, 1, 1, 1,
0.3477144, 0.07658179, 1.875382, 1, 1, 1, 1, 1,
0.3481665, -0.2281341, 1.365316, 1, 1, 1, 1, 1,
0.3526339, -1.092633, 3.159631, 0, 0, 1, 1, 1,
0.3567067, -0.6678157, 3.115541, 1, 0, 0, 1, 1,
0.3595052, 1.099545, -0.2536092, 1, 0, 0, 1, 1,
0.3609976, 2.478006, -1.933761, 1, 0, 0, 1, 1,
0.3651614, 0.5722344, 0.3234735, 1, 0, 0, 1, 1,
0.3697117, -2.266309, 1.289662, 1, 0, 0, 1, 1,
0.3699925, -0.0005033775, 2.706248, 0, 0, 0, 1, 1,
0.3712607, 0.7863739, -0.08636787, 0, 0, 0, 1, 1,
0.3722, 0.847126, 1.753795, 0, 0, 0, 1, 1,
0.3771361, 0.5121247, 1.466964, 0, 0, 0, 1, 1,
0.3782569, 0.6655731, 2.251234, 0, 0, 0, 1, 1,
0.3824389, 0.04480959, 1.23579, 0, 0, 0, 1, 1,
0.3837508, 0.031734, 0.8402699, 0, 0, 0, 1, 1,
0.3893149, 1.857267, -0.7823582, 1, 1, 1, 1, 1,
0.3982197, 1.88241, -0.7591946, 1, 1, 1, 1, 1,
0.3982907, 1.134748, -0.4272995, 1, 1, 1, 1, 1,
0.4018277, 1.320322, 1.1327, 1, 1, 1, 1, 1,
0.4047222, -0.1663193, 0.8924833, 1, 1, 1, 1, 1,
0.4064218, 0.216546, 1.834549, 1, 1, 1, 1, 1,
0.4080063, 0.3296367, 2.150169, 1, 1, 1, 1, 1,
0.4090243, 0.7983448, -0.09094916, 1, 1, 1, 1, 1,
0.4160932, 1.641347, 1.040404, 1, 1, 1, 1, 1,
0.4190783, 0.3154331, -0.3877474, 1, 1, 1, 1, 1,
0.4280252, 0.03583006, 1.349416, 1, 1, 1, 1, 1,
0.4285312, -0.8960562, 4.135591, 1, 1, 1, 1, 1,
0.4288266, 0.9291402, 0.3923512, 1, 1, 1, 1, 1,
0.4290195, -1.400295, 3.190558, 1, 1, 1, 1, 1,
0.4290827, -0.2745379, 3.494577, 1, 1, 1, 1, 1,
0.4312324, 0.7904065, -0.2939959, 0, 0, 1, 1, 1,
0.4334919, 1.929145, -1.365207, 1, 0, 0, 1, 1,
0.4396409, -1.334048, 3.084386, 1, 0, 0, 1, 1,
0.447121, 0.2501183, 1.502719, 1, 0, 0, 1, 1,
0.4489891, 0.07300982, 2.597841, 1, 0, 0, 1, 1,
0.4526214, 1.634427, -0.4094523, 1, 0, 0, 1, 1,
0.4527791, 1.960882, -0.9106737, 0, 0, 0, 1, 1,
0.463013, 0.9771799, -0.6605315, 0, 0, 0, 1, 1,
0.4703454, -0.9761989, 2.85185, 0, 0, 0, 1, 1,
0.474272, 1.268267, 1.003303, 0, 0, 0, 1, 1,
0.4747845, -0.1937533, 1.068728, 0, 0, 0, 1, 1,
0.4806795, 0.7072245, 0.4328066, 0, 0, 0, 1, 1,
0.4832536, 0.05767444, 0.575525, 0, 0, 0, 1, 1,
0.4853119, 0.686993, 0.06587197, 1, 1, 1, 1, 1,
0.491411, 1.927006, 0.4633458, 1, 1, 1, 1, 1,
0.4944177, 2.850652, -1.219989, 1, 1, 1, 1, 1,
0.4950882, 0.4385047, 0.7646208, 1, 1, 1, 1, 1,
0.4977001, -0.5536734, 4.016768, 1, 1, 1, 1, 1,
0.5016518, 0.1214333, 0.8331721, 1, 1, 1, 1, 1,
0.5022925, 0.769877, 1.475859, 1, 1, 1, 1, 1,
0.5027829, -0.7338395, 2.200969, 1, 1, 1, 1, 1,
0.5032483, -2.637475, 3.012051, 1, 1, 1, 1, 1,
0.5035272, 0.6265583, 0.1697028, 1, 1, 1, 1, 1,
0.5071424, -0.0039571, 2.696567, 1, 1, 1, 1, 1,
0.5156143, -0.1088367, 2.648913, 1, 1, 1, 1, 1,
0.5186723, -0.8204803, 1.671132, 1, 1, 1, 1, 1,
0.5250095, -1.127439, 2.535469, 1, 1, 1, 1, 1,
0.5318311, -1.824679, 2.748331, 1, 1, 1, 1, 1,
0.5347045, 0.6636017, 1.230059, 0, 0, 1, 1, 1,
0.5357703, 0.2955115, 1.159098, 1, 0, 0, 1, 1,
0.5381147, -2.910393, 4.000395, 1, 0, 0, 1, 1,
0.5384899, -0.3105238, 2.456802, 1, 0, 0, 1, 1,
0.5439586, -0.06903922, 1.426359, 1, 0, 0, 1, 1,
0.5470532, 0.883301, -0.3799141, 1, 0, 0, 1, 1,
0.5475212, -0.3285486, 4.203006, 0, 0, 0, 1, 1,
0.5497855, -0.6507168, 3.727683, 0, 0, 0, 1, 1,
0.550453, 0.01799618, 1.336153, 0, 0, 0, 1, 1,
0.5506736, -1.659407, 1.876456, 0, 0, 0, 1, 1,
0.5550678, 1.074568, 0.4428293, 0, 0, 0, 1, 1,
0.5585968, -2.285242, 2.548706, 0, 0, 0, 1, 1,
0.5636953, 0.6483234, 1.09903, 0, 0, 0, 1, 1,
0.5679985, 0.7153232, -0.1373484, 1, 1, 1, 1, 1,
0.5690558, -1.318553, 1.832698, 1, 1, 1, 1, 1,
0.5704619, 2.611469, 0.85469, 1, 1, 1, 1, 1,
0.5715788, -1.413727, 4.338601, 1, 1, 1, 1, 1,
0.5768389, -0.8722048, 3.773803, 1, 1, 1, 1, 1,
0.580291, -0.8033949, 1.134755, 1, 1, 1, 1, 1,
0.5813411, -0.0651245, 3.127296, 1, 1, 1, 1, 1,
0.5823312, -1.028055, 2.844522, 1, 1, 1, 1, 1,
0.5826002, 0.5735351, 0.7098656, 1, 1, 1, 1, 1,
0.5829502, 1.120721, 0.7024361, 1, 1, 1, 1, 1,
0.5843016, -1.635295, 3.182952, 1, 1, 1, 1, 1,
0.5868579, 0.5495692, 1.214734, 1, 1, 1, 1, 1,
0.5871688, 0.7810781, 0.6690146, 1, 1, 1, 1, 1,
0.5920067, 0.009479447, 1.382645, 1, 1, 1, 1, 1,
0.6010778, -0.1166576, 2.631704, 1, 1, 1, 1, 1,
0.6032414, 0.1762845, 1.123021, 0, 0, 1, 1, 1,
0.6071481, 0.3121955, -0.4844404, 1, 0, 0, 1, 1,
0.6074629, -1.639026, 5.094064, 1, 0, 0, 1, 1,
0.6081098, 1.371041, -0.8862715, 1, 0, 0, 1, 1,
0.6121288, -0.8177564, 1.92844, 1, 0, 0, 1, 1,
0.6140396, -1.181883, 3.516762, 1, 0, 0, 1, 1,
0.6148703, -0.1013672, 2.310169, 0, 0, 0, 1, 1,
0.6154477, -0.2379857, 2.27712, 0, 0, 0, 1, 1,
0.6215867, 0.2821991, 1.3818, 0, 0, 0, 1, 1,
0.6300457, -0.08775261, 0.9672472, 0, 0, 0, 1, 1,
0.6333519, 1.033203, 1.626106, 0, 0, 0, 1, 1,
0.6339458, -1.378223, 3.11664, 0, 0, 0, 1, 1,
0.6350754, 0.6787498, 1.214565, 0, 0, 0, 1, 1,
0.6359789, 0.1187574, 0.1308741, 1, 1, 1, 1, 1,
0.6430012, -0.882199, 3.566184, 1, 1, 1, 1, 1,
0.6474454, -0.791038, 3.278368, 1, 1, 1, 1, 1,
0.6493605, 0.3715869, -1.079445, 1, 1, 1, 1, 1,
0.6591644, 1.146094, -0.4453526, 1, 1, 1, 1, 1,
0.6660728, 0.8522913, -1.072644, 1, 1, 1, 1, 1,
0.6694517, 1.039734, 2.846964, 1, 1, 1, 1, 1,
0.6699777, 0.9244173, 2.226523, 1, 1, 1, 1, 1,
0.670435, 0.5712257, 1.032464, 1, 1, 1, 1, 1,
0.6744691, 2.261601, 1.89435, 1, 1, 1, 1, 1,
0.683779, -0.1701812, 1.034376, 1, 1, 1, 1, 1,
0.6875431, 0.1637026, 1.062042, 1, 1, 1, 1, 1,
0.6905769, 0.04818182, 1.891474, 1, 1, 1, 1, 1,
0.6913271, 0.6965656, 0.6665623, 1, 1, 1, 1, 1,
0.6923615, -0.3046549, 1.397847, 1, 1, 1, 1, 1,
0.694221, -1.11149, 2.440588, 0, 0, 1, 1, 1,
0.6949704, 1.06872, 1.906062, 1, 0, 0, 1, 1,
0.695937, 0.3915619, 1.185902, 1, 0, 0, 1, 1,
0.6974686, 0.05583136, 2.060358, 1, 0, 0, 1, 1,
0.6991563, 1.505462, 0.06671816, 1, 0, 0, 1, 1,
0.7010112, 0.4222689, -0.1073084, 1, 0, 0, 1, 1,
0.7027644, 0.3057106, 0.2551486, 0, 0, 0, 1, 1,
0.7027819, 0.3295504, 1.795378, 0, 0, 0, 1, 1,
0.7054394, -0.01279358, 2.280314, 0, 0, 0, 1, 1,
0.7065506, -0.7970693, 1.379156, 0, 0, 0, 1, 1,
0.7109991, 0.9719377, 0.2383618, 0, 0, 0, 1, 1,
0.7115604, -0.2546431, 0.741316, 0, 0, 0, 1, 1,
0.7140336, -0.7531343, 4.14472, 0, 0, 0, 1, 1,
0.7148786, 0.6587496, -0.2259153, 1, 1, 1, 1, 1,
0.7165908, 0.5379238, -0.9989831, 1, 1, 1, 1, 1,
0.7166377, -0.4221222, 1.023235, 1, 1, 1, 1, 1,
0.7171699, -0.6959093, 4.018863, 1, 1, 1, 1, 1,
0.7189837, -0.7677294, 2.715007, 1, 1, 1, 1, 1,
0.7220811, 1.340518, 0.3578582, 1, 1, 1, 1, 1,
0.7232374, 1.978132, 1.258082, 1, 1, 1, 1, 1,
0.7271072, -0.4545685, 0.4017186, 1, 1, 1, 1, 1,
0.7336963, 0.4541931, 0.4123069, 1, 1, 1, 1, 1,
0.7392674, -2.245719, 3.276494, 1, 1, 1, 1, 1,
0.7426282, 0.1125735, 2.699519, 1, 1, 1, 1, 1,
0.7428722, 0.9843233, -0.2406625, 1, 1, 1, 1, 1,
0.7491779, -0.7499323, 1.816828, 1, 1, 1, 1, 1,
0.7493844, -0.384263, 3.182751, 1, 1, 1, 1, 1,
0.7507699, 0.5859162, 2.218565, 1, 1, 1, 1, 1,
0.7512138, 1.124015, -0.1443412, 0, 0, 1, 1, 1,
0.7556997, -1.548688, 1.853627, 1, 0, 0, 1, 1,
0.7561712, -0.1560993, 1.311582, 1, 0, 0, 1, 1,
0.7622383, 1.191556, -0.3242038, 1, 0, 0, 1, 1,
0.7646674, 0.6272938, 1.91916, 1, 0, 0, 1, 1,
0.7648104, -0.5058375, 3.305196, 1, 0, 0, 1, 1,
0.7675099, 0.5832006, 2.218633, 0, 0, 0, 1, 1,
0.7776356, 1.509133, 0.833721, 0, 0, 0, 1, 1,
0.7787117, -0.2843783, 0.8483522, 0, 0, 0, 1, 1,
0.7830317, -0.48994, 2.916273, 0, 0, 0, 1, 1,
0.7841455, 0.9844366, -0.360414, 0, 0, 0, 1, 1,
0.7842267, 0.1929849, 0.8173713, 0, 0, 0, 1, 1,
0.7857093, -1.456105, 2.861265, 0, 0, 0, 1, 1,
0.7891313, 0.05544867, 2.770355, 1, 1, 1, 1, 1,
0.7895886, -0.06531107, 0.4979181, 1, 1, 1, 1, 1,
0.7918074, 0.009879991, 1.286996, 1, 1, 1, 1, 1,
0.7924954, 1.098632, -1.102756, 1, 1, 1, 1, 1,
0.7949088, -0.006486217, -0.2281232, 1, 1, 1, 1, 1,
0.8127181, -0.5604146, 4.080009, 1, 1, 1, 1, 1,
0.816452, 0.3892575, 0.9916294, 1, 1, 1, 1, 1,
0.8204119, 1.023177, 0.08275016, 1, 1, 1, 1, 1,
0.8356631, -1.23134, 3.040728, 1, 1, 1, 1, 1,
0.84092, -0.3446834, 2.703933, 1, 1, 1, 1, 1,
0.8431271, 1.708443, 0.06402703, 1, 1, 1, 1, 1,
0.8491643, 0.1493454, -0.2973542, 1, 1, 1, 1, 1,
0.8536193, 0.7740025, 0.9529727, 1, 1, 1, 1, 1,
0.8551902, 0.1470453, 2.443798, 1, 1, 1, 1, 1,
0.8559763, -1.801372, 4.056222, 1, 1, 1, 1, 1,
0.8589184, 0.8028213, -1.281455, 0, 0, 1, 1, 1,
0.8661954, 0.2621343, 1.818101, 1, 0, 0, 1, 1,
0.8687971, -0.9018164, 0.2015169, 1, 0, 0, 1, 1,
0.8692108, -0.4772432, 2.73332, 1, 0, 0, 1, 1,
0.8711874, -0.02849891, 1.718545, 1, 0, 0, 1, 1,
0.8762675, 0.6851202, 0.8646201, 1, 0, 0, 1, 1,
0.8850977, 0.2927511, 1.076096, 0, 0, 0, 1, 1,
0.8853998, 0.3210269, 2.252807, 0, 0, 0, 1, 1,
0.8859425, -1.108935, 2.11035, 0, 0, 0, 1, 1,
0.8887258, -2.311604, 3.005007, 0, 0, 0, 1, 1,
0.8915068, -0.6731191, 3.070064, 0, 0, 0, 1, 1,
0.8945096, -0.6931814, 1.757953, 0, 0, 0, 1, 1,
0.8980172, 0.8180457, 2.155378, 0, 0, 0, 1, 1,
0.9002205, -0.3753129, 3.240448, 1, 1, 1, 1, 1,
0.9014683, -0.06246657, 1.048903, 1, 1, 1, 1, 1,
0.9054654, -0.5997928, 1.427166, 1, 1, 1, 1, 1,
0.9073128, -0.4139826, 1.190623, 1, 1, 1, 1, 1,
0.9088039, -0.9921281, 2.658001, 1, 1, 1, 1, 1,
0.91108, 0.5774238, -0.5167294, 1, 1, 1, 1, 1,
0.9123979, 0.3489579, 2.100747, 1, 1, 1, 1, 1,
0.9170685, -0.6655625, 1.472977, 1, 1, 1, 1, 1,
0.9201221, 0.9036494, 1.469863, 1, 1, 1, 1, 1,
0.9206467, 0.6208051, 1.492723, 1, 1, 1, 1, 1,
0.9278552, 0.8586667, -0.227277, 1, 1, 1, 1, 1,
0.9282563, -1.184963, 3.646013, 1, 1, 1, 1, 1,
0.9298105, -0.06174133, 2.913082, 1, 1, 1, 1, 1,
0.9372137, -0.2680691, 2.158797, 1, 1, 1, 1, 1,
0.9395712, 0.5194408, 0.3634335, 1, 1, 1, 1, 1,
0.9396661, -0.3797547, 2.052884, 0, 0, 1, 1, 1,
0.9407045, 0.6418046, 2.014398, 1, 0, 0, 1, 1,
0.9412494, 0.8825945, 0.3029268, 1, 0, 0, 1, 1,
0.9416459, -0.3795096, 3.917855, 1, 0, 0, 1, 1,
0.9477181, -1.42431, 0.939715, 1, 0, 0, 1, 1,
0.9513188, 0.5902468, 1.163969, 1, 0, 0, 1, 1,
0.9516295, 0.5545146, 2.128096, 0, 0, 0, 1, 1,
0.9538159, -0.6361843, 2.062831, 0, 0, 0, 1, 1,
0.9686621, 0.04512429, 1.848516, 0, 0, 0, 1, 1,
0.9727324, 0.383982, 1.734305, 0, 0, 0, 1, 1,
0.9731289, 0.7460103, 0.6912593, 0, 0, 0, 1, 1,
0.9732221, 0.7255388, -0.9416624, 0, 0, 0, 1, 1,
0.9750181, -0.500078, 2.406961, 0, 0, 0, 1, 1,
0.9788764, 0.4091497, 0.5900354, 1, 1, 1, 1, 1,
0.9862527, -0.3657894, 3.014004, 1, 1, 1, 1, 1,
0.9886419, 0.2618889, 1.730493, 1, 1, 1, 1, 1,
0.9901388, 1.166659, 1.713774, 1, 1, 1, 1, 1,
0.9951063, 0.1136644, 0.9556784, 1, 1, 1, 1, 1,
0.9976859, 0.6668765, 1.452357, 1, 1, 1, 1, 1,
1.003699, -2.234135, 4.122567, 1, 1, 1, 1, 1,
1.010978, 1.235647, 0.1197906, 1, 1, 1, 1, 1,
1.01214, -1.719905, 1.680455, 1, 1, 1, 1, 1,
1.017472, 1.14413, -0.1631699, 1, 1, 1, 1, 1,
1.019001, -1.453106, 4.749028, 1, 1, 1, 1, 1,
1.01923, 0.4291293, -0.8250253, 1, 1, 1, 1, 1,
1.031691, -1.97498, 1.660704, 1, 1, 1, 1, 1,
1.033892, 0.1538209, 0.7652453, 1, 1, 1, 1, 1,
1.037961, -0.4663561, 1.92021, 1, 1, 1, 1, 1,
1.040189, -2.995957, 2.924514, 0, 0, 1, 1, 1,
1.044409, -0.1684307, 2.04889, 1, 0, 0, 1, 1,
1.04886, -0.2870448, 2.074166, 1, 0, 0, 1, 1,
1.048935, -0.009773525, 1.379797, 1, 0, 0, 1, 1,
1.049614, 0.2539346, 1.577881, 1, 0, 0, 1, 1,
1.053434, 0.2342495, 1.793209, 1, 0, 0, 1, 1,
1.058536, -0.8207157, 2.067665, 0, 0, 0, 1, 1,
1.060122, -0.3114736, 2.679996, 0, 0, 0, 1, 1,
1.068273, -0.8504555, 0.86697, 0, 0, 0, 1, 1,
1.076206, 0.1849706, 1.694, 0, 0, 0, 1, 1,
1.090433, 0.9430047, 1.892897, 0, 0, 0, 1, 1,
1.091325, 0.1655574, 2.105378, 0, 0, 0, 1, 1,
1.091619, 0.02110325, 2.450607, 0, 0, 0, 1, 1,
1.09263, -0.7473104, 3.585337, 1, 1, 1, 1, 1,
1.097528, -0.175744, 1.830482, 1, 1, 1, 1, 1,
1.098491, 0.4481559, 1.41651, 1, 1, 1, 1, 1,
1.102455, 0.8978677, 0.3616713, 1, 1, 1, 1, 1,
1.108915, -0.2771077, 2.847786, 1, 1, 1, 1, 1,
1.118437, 1.292168, 1.915372, 1, 1, 1, 1, 1,
1.123395, -0.3834599, 2.165746, 1, 1, 1, 1, 1,
1.126283, -0.18188, 1.782386, 1, 1, 1, 1, 1,
1.135209, 0.5546728, 1.728685, 1, 1, 1, 1, 1,
1.140289, 1.380691, -0.8086768, 1, 1, 1, 1, 1,
1.142738, -0.01064578, -0.5738149, 1, 1, 1, 1, 1,
1.163484, -0.9692748, 1.203053, 1, 1, 1, 1, 1,
1.163635, 1.471327, 2.989337, 1, 1, 1, 1, 1,
1.16651, 0.895801, 1.614293, 1, 1, 1, 1, 1,
1.167853, 0.6821909, 0.8196769, 1, 1, 1, 1, 1,
1.171328, -1.069689, 1.743031, 0, 0, 1, 1, 1,
1.199475, 1.082303, 2.465678, 1, 0, 0, 1, 1,
1.201359, 0.226228, 4.065874, 1, 0, 0, 1, 1,
1.215737, -1.417537, 2.576956, 1, 0, 0, 1, 1,
1.224924, -0.2299332, 0.7342487, 1, 0, 0, 1, 1,
1.227614, 0.1201393, 0.5443838, 1, 0, 0, 1, 1,
1.228521, -0.05832597, 2.226812, 0, 0, 0, 1, 1,
1.229549, 3.071292, -1.777674, 0, 0, 0, 1, 1,
1.245756, 0.3069707, 2.465725, 0, 0, 0, 1, 1,
1.246359, -0.1775225, 2.545197, 0, 0, 0, 1, 1,
1.24823, 0.1639999, 1.871839, 0, 0, 0, 1, 1,
1.249237, 0.3382517, 0.6261781, 0, 0, 0, 1, 1,
1.256645, 2.194526, -0.8665397, 0, 0, 0, 1, 1,
1.269371, 2.326784, 0.2119495, 1, 1, 1, 1, 1,
1.271227, -0.9186359, 2.487907, 1, 1, 1, 1, 1,
1.279296, -0.8855376, 1.928888, 1, 1, 1, 1, 1,
1.284009, -1.481769, 2.628556, 1, 1, 1, 1, 1,
1.290018, 0.7225735, 1.880334, 1, 1, 1, 1, 1,
1.292628, 0.3401659, -0.5030919, 1, 1, 1, 1, 1,
1.304215, -0.8438599, 2.60881, 1, 1, 1, 1, 1,
1.312048, -0.4587179, 2.020759, 1, 1, 1, 1, 1,
1.314229, 0.8289807, 1.491984, 1, 1, 1, 1, 1,
1.323907, 0.004081773, 1.077874, 1, 1, 1, 1, 1,
1.325186, 0.3056871, 1.085628, 1, 1, 1, 1, 1,
1.333, 1.133554, 0.7060012, 1, 1, 1, 1, 1,
1.34049, 1.815618, -0.7544117, 1, 1, 1, 1, 1,
1.341976, -1.171594, 1.217403, 1, 1, 1, 1, 1,
1.344699, 0.1869515, 2.252894, 1, 1, 1, 1, 1,
1.361677, -0.6770533, 4.227043, 0, 0, 1, 1, 1,
1.366839, -0.4227573, 3.193542, 1, 0, 0, 1, 1,
1.395939, -1.381476, 3.530424, 1, 0, 0, 1, 1,
1.415712, 0.02052133, 2.616167, 1, 0, 0, 1, 1,
1.427385, 1.234577, 0.4414411, 1, 0, 0, 1, 1,
1.427783, -0.4186755, 2.820281, 1, 0, 0, 1, 1,
1.431365, -0.4362881, -0.2143537, 0, 0, 0, 1, 1,
1.432243, 0.07899045, 2.086081, 0, 0, 0, 1, 1,
1.438849, -1.608602, 3.921893, 0, 0, 0, 1, 1,
1.439933, 0.1427749, 0.4489511, 0, 0, 0, 1, 1,
1.448054, 0.7024686, 1.754993, 0, 0, 0, 1, 1,
1.449855, 1.32689, 0.325351, 0, 0, 0, 1, 1,
1.45474, 0.6992962, 0.8798715, 0, 0, 0, 1, 1,
1.471279, 1.54065, 1.536795, 1, 1, 1, 1, 1,
1.488743, -1.052496, 2.158569, 1, 1, 1, 1, 1,
1.499746, -0.5860288, 1.684007, 1, 1, 1, 1, 1,
1.508675, 1.786338, 1.009154, 1, 1, 1, 1, 1,
1.531686, 0.6094451, 2.330827, 1, 1, 1, 1, 1,
1.534525, 0.04862792, 1.597573, 1, 1, 1, 1, 1,
1.540897, 0.3002763, 1.711998, 1, 1, 1, 1, 1,
1.54376, -2.079079, 1.223102, 1, 1, 1, 1, 1,
1.546124, -1.104447, 2.900644, 1, 1, 1, 1, 1,
1.552481, 0.419643, 1.309391, 1, 1, 1, 1, 1,
1.557558, -0.9876447, 1.85219, 1, 1, 1, 1, 1,
1.560379, 0.1779374, 1.76906, 1, 1, 1, 1, 1,
1.56377, 1.783286, 0.2041391, 1, 1, 1, 1, 1,
1.565291, 0.9689979, 0.05255775, 1, 1, 1, 1, 1,
1.571462, -0.3393642, 1.169022, 1, 1, 1, 1, 1,
1.574684, 0.774044, 2.46565, 0, 0, 1, 1, 1,
1.589992, 0.2101089, -0.08154645, 1, 0, 0, 1, 1,
1.593816, 1.358265, 0.7671309, 1, 0, 0, 1, 1,
1.594841, 0.5647126, 1.986732, 1, 0, 0, 1, 1,
1.597284, -0.9157642, -0.230574, 1, 0, 0, 1, 1,
1.598617, 1.131191, 1.574441, 1, 0, 0, 1, 1,
1.614289, 0.9786128, 1.181484, 0, 0, 0, 1, 1,
1.646733, 0.2440549, 1.977682, 0, 0, 0, 1, 1,
1.651231, 0.3187857, 1.725175, 0, 0, 0, 1, 1,
1.656922, -0.2525091, 2.130126, 0, 0, 0, 1, 1,
1.657623, 0.3237243, -0.850743, 0, 0, 0, 1, 1,
1.661271, -0.3915309, 2.432873, 0, 0, 0, 1, 1,
1.671584, 1.255401, 0.9040158, 0, 0, 0, 1, 1,
1.690163, -0.9415668, 2.332848, 1, 1, 1, 1, 1,
1.696859, 0.02684695, -0.03873204, 1, 1, 1, 1, 1,
1.719441, -1.346817, 2.267162, 1, 1, 1, 1, 1,
1.732588, 0.495228, 1.775258, 1, 1, 1, 1, 1,
1.761572, 1.168314, 2.907054, 1, 1, 1, 1, 1,
1.769207, -0.3691703, 1.51301, 1, 1, 1, 1, 1,
1.770958, 0.0793189, 2.560631, 1, 1, 1, 1, 1,
1.7746, -0.02653289, 2.700668, 1, 1, 1, 1, 1,
1.787656, 0.947309, 1.553028, 1, 1, 1, 1, 1,
1.817066, -0.4030447, 0.3115878, 1, 1, 1, 1, 1,
1.845565, -0.1716868, 1.994617, 1, 1, 1, 1, 1,
1.909486, -0.477875, -0.03422083, 1, 1, 1, 1, 1,
1.913476, 0.9176903, 0.8043806, 1, 1, 1, 1, 1,
1.917409, -0.2270367, 1.276131, 1, 1, 1, 1, 1,
1.92706, 0.1602473, 1.936513, 1, 1, 1, 1, 1,
1.931165, -0.3480721, 2.760153, 0, 0, 1, 1, 1,
1.940142, 1.559274, 0.6647872, 1, 0, 0, 1, 1,
1.946519, 0.8900602, -0.02211322, 1, 0, 0, 1, 1,
1.95128, -1.513329, 2.192349, 1, 0, 0, 1, 1,
1.956457, -0.779963, 2.365813, 1, 0, 0, 1, 1,
1.958338, -1.507148, 3.983021, 1, 0, 0, 1, 1,
1.965028, -2.353637, 1.793556, 0, 0, 0, 1, 1,
1.965924, 1.174664, 1.969828, 0, 0, 0, 1, 1,
1.994187, 0.7866724, 1.039184, 0, 0, 0, 1, 1,
2.012208, -1.276629, 1.373887, 0, 0, 0, 1, 1,
2.092366, 0.9359929, 1.551982, 0, 0, 0, 1, 1,
2.108956, -1.382775, 2.311035, 0, 0, 0, 1, 1,
2.133534, 1.734862, 1.012215, 0, 0, 0, 1, 1,
2.200552, -1.291443, 3.667919, 1, 1, 1, 1, 1,
2.255658, -0.4153037, 0.9159582, 1, 1, 1, 1, 1,
2.320878, -0.5483239, 1.488026, 1, 1, 1, 1, 1,
2.403668, -1.305744, 2.133163, 1, 1, 1, 1, 1,
2.410531, 0.02242074, 1.202295, 1, 1, 1, 1, 1,
2.630749, -0.2628424, 1.781895, 1, 1, 1, 1, 1,
2.815863, -0.1509233, -0.6024447, 1, 1, 1, 1, 1
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
var radius = 9.621038;
var distance = 33.79349;
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
mvMatrix.translate( 0.2049555, 0.2105334, -0.4947886 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.79349);
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
