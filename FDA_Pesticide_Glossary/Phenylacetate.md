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
-3.295691, -0.4988269, -1.775727, 1, 0, 0, 1,
-2.829777, 1.615375, 0.450986, 1, 0.007843138, 0, 1,
-2.748238, 1.517627, -1.925203, 1, 0.01176471, 0, 1,
-2.734091, -1.111961, -0.26149, 1, 0.01960784, 0, 1,
-2.627973, -0.2524694, -1.906354, 1, 0.02352941, 0, 1,
-2.446151, -0.2449141, -0.8691111, 1, 0.03137255, 0, 1,
-2.295255, 0.8319755, -2.518233, 1, 0.03529412, 0, 1,
-2.264332, 0.6895209, -2.704617, 1, 0.04313726, 0, 1,
-2.218405, -0.2189302, -1.968905, 1, 0.04705882, 0, 1,
-2.199912, 0.8523489, 0.4342228, 1, 0.05490196, 0, 1,
-2.176461, -1.42075, -2.708584, 1, 0.05882353, 0, 1,
-2.1678, 0.006859814, -2.50003, 1, 0.06666667, 0, 1,
-2.148387, 0.6968343, -1.422275, 1, 0.07058824, 0, 1,
-2.120972, -1.025251, -2.318313, 1, 0.07843138, 0, 1,
-2.05851, 0.6974915, -1.671836, 1, 0.08235294, 0, 1,
-2.036182, -0.2062285, -2.88248, 1, 0.09019608, 0, 1,
-2.025841, 0.1974385, -1.486608, 1, 0.09411765, 0, 1,
-2.025366, 0.2259634, -1.049953, 1, 0.1019608, 0, 1,
-1.951853, -0.5423753, -1.080555, 1, 0.1098039, 0, 1,
-1.951079, 0.4178957, -2.222881, 1, 0.1137255, 0, 1,
-1.932109, -1.714962, -1.180233, 1, 0.1215686, 0, 1,
-1.927504, -0.7391852, -1.866329, 1, 0.1254902, 0, 1,
-1.897949, -1.596278, -3.238778, 1, 0.1333333, 0, 1,
-1.877588, -0.3158889, -0.865835, 1, 0.1372549, 0, 1,
-1.857795, 1.258928, -1.551952, 1, 0.145098, 0, 1,
-1.836197, -1.399134, -1.15671, 1, 0.1490196, 0, 1,
-1.797739, -0.5593857, -0.983979, 1, 0.1568628, 0, 1,
-1.792418, -1.167754, -1.913057, 1, 0.1607843, 0, 1,
-1.78849, -0.510725, -2.12669, 1, 0.1686275, 0, 1,
-1.777974, -0.3545263, -2.922018, 1, 0.172549, 0, 1,
-1.747358, -1.797871, -2.484134, 1, 0.1803922, 0, 1,
-1.746207, -1.611664, -2.505381, 1, 0.1843137, 0, 1,
-1.743483, -0.5155683, -3.902456, 1, 0.1921569, 0, 1,
-1.735187, 0.4331402, -3.111721, 1, 0.1960784, 0, 1,
-1.733435, -0.6447731, -2.319952, 1, 0.2039216, 0, 1,
-1.724396, 0.6661319, 1.038495, 1, 0.2117647, 0, 1,
-1.720997, 0.4988731, -3.241606, 1, 0.2156863, 0, 1,
-1.719643, 0.8594341, -1.924407, 1, 0.2235294, 0, 1,
-1.719369, -0.5038224, -1.916583, 1, 0.227451, 0, 1,
-1.711235, -1.21168, -2.332425, 1, 0.2352941, 0, 1,
-1.709416, 0.06595211, -0.7525519, 1, 0.2392157, 0, 1,
-1.708418, -0.2790156, -2.178331, 1, 0.2470588, 0, 1,
-1.70052, 0.8694838, -2.501843, 1, 0.2509804, 0, 1,
-1.661332, 0.827081, -1.199177, 1, 0.2588235, 0, 1,
-1.642798, -0.6122369, -2.026915, 1, 0.2627451, 0, 1,
-1.63018, 0.4342079, -1.109579, 1, 0.2705882, 0, 1,
-1.625853, -1.116614, -3.00484, 1, 0.2745098, 0, 1,
-1.622552, 0.2125239, -1.781246, 1, 0.282353, 0, 1,
-1.619587, -0.1099521, -2.262613, 1, 0.2862745, 0, 1,
-1.607034, 0.4150566, 0.190411, 1, 0.2941177, 0, 1,
-1.606057, 1.74936, -0.7265382, 1, 0.3019608, 0, 1,
-1.605034, -1.552269, -2.827647, 1, 0.3058824, 0, 1,
-1.598849, -0.3574229, -1.080516, 1, 0.3137255, 0, 1,
-1.588554, 0.5133945, -0.3100756, 1, 0.3176471, 0, 1,
-1.580827, -0.8954943, -2.954275, 1, 0.3254902, 0, 1,
-1.572228, -0.09436633, -2.206318, 1, 0.3294118, 0, 1,
-1.571623, 0.3520981, -1.814503, 1, 0.3372549, 0, 1,
-1.570625, -1.680491, -2.145988, 1, 0.3411765, 0, 1,
-1.56288, 0.8301018, 0.9276154, 1, 0.3490196, 0, 1,
-1.554359, -0.8907574, -1.530213, 1, 0.3529412, 0, 1,
-1.553047, 1.523268, -0.6921526, 1, 0.3607843, 0, 1,
-1.544976, 0.2166553, 0.4633817, 1, 0.3647059, 0, 1,
-1.529225, 1.087058, -1.455614, 1, 0.372549, 0, 1,
-1.521326, 0.5642285, -0.7590783, 1, 0.3764706, 0, 1,
-1.517724, 1.515106, -1.811906, 1, 0.3843137, 0, 1,
-1.511528, -0.4407582, -2.213215, 1, 0.3882353, 0, 1,
-1.509573, 0.7893941, -1.917821, 1, 0.3960784, 0, 1,
-1.508667, -0.44425, -0.3142951, 1, 0.4039216, 0, 1,
-1.507638, 0.2472509, -1.35357, 1, 0.4078431, 0, 1,
-1.4926, 0.8876193, -2.544826, 1, 0.4156863, 0, 1,
-1.492147, 0.1881413, -1.135003, 1, 0.4196078, 0, 1,
-1.485053, -0.6728572, -2.636345, 1, 0.427451, 0, 1,
-1.480733, 1.62635, -1.030085, 1, 0.4313726, 0, 1,
-1.456057, 0.239331, 1.204937, 1, 0.4392157, 0, 1,
-1.448024, -0.1347342, -1.274472, 1, 0.4431373, 0, 1,
-1.445249, 0.6178403, -1.153879, 1, 0.4509804, 0, 1,
-1.436871, -1.17646, -1.031117, 1, 0.454902, 0, 1,
-1.428996, 0.9743223, -0.08466391, 1, 0.4627451, 0, 1,
-1.427679, -0.6311315, -1.928874, 1, 0.4666667, 0, 1,
-1.425366, 1.53769, -1.817237, 1, 0.4745098, 0, 1,
-1.422784, -1.088623, -3.414238, 1, 0.4784314, 0, 1,
-1.415679, -1.762587, -1.343729, 1, 0.4862745, 0, 1,
-1.403089, -0.6880955, -1.968747, 1, 0.4901961, 0, 1,
-1.386569, 0.8267037, -2.549893, 1, 0.4980392, 0, 1,
-1.365048, -0.5836559, -0.5755557, 1, 0.5058824, 0, 1,
-1.351825, 0.4845113, -0.4833323, 1, 0.509804, 0, 1,
-1.350304, -0.5098256, -2.590852, 1, 0.5176471, 0, 1,
-1.346725, 0.7920969, -2.049294, 1, 0.5215687, 0, 1,
-1.345154, -1.773201, -1.841313, 1, 0.5294118, 0, 1,
-1.34342, 0.3104395, -1.413596, 1, 0.5333334, 0, 1,
-1.325984, 0.8235564, -1.595597, 1, 0.5411765, 0, 1,
-1.324367, -0.3892428, -0.1688397, 1, 0.5450981, 0, 1,
-1.322017, 0.3048719, -1.990345, 1, 0.5529412, 0, 1,
-1.319448, -1.053245, -2.715905, 1, 0.5568628, 0, 1,
-1.315462, -0.2262999, -2.472101, 1, 0.5647059, 0, 1,
-1.313788, -1.154402, -2.283793, 1, 0.5686275, 0, 1,
-1.31246, 0.7803832, -0.4030426, 1, 0.5764706, 0, 1,
-1.307125, 2.787738, 0.9224093, 1, 0.5803922, 0, 1,
-1.298508, -0.6809879, -1.383041, 1, 0.5882353, 0, 1,
-1.296612, 0.2600758, -2.06865, 1, 0.5921569, 0, 1,
-1.293741, -1.489289, -2.214645, 1, 0.6, 0, 1,
-1.290519, -1.225774, -2.995426, 1, 0.6078432, 0, 1,
-1.280905, 0.8053763, -0.01239939, 1, 0.6117647, 0, 1,
-1.278851, 0.05956558, 0.3050131, 1, 0.6196079, 0, 1,
-1.277504, 0.01766614, -2.882824, 1, 0.6235294, 0, 1,
-1.276796, -0.7365444, -4.626287, 1, 0.6313726, 0, 1,
-1.274804, 1.408623, -0.219952, 1, 0.6352941, 0, 1,
-1.274612, 0.3429974, -2.149573, 1, 0.6431373, 0, 1,
-1.270967, -0.3533789, -2.579122, 1, 0.6470588, 0, 1,
-1.266415, 0.4324951, -3.070826, 1, 0.654902, 0, 1,
-1.265147, 1.397973, -0.5639569, 1, 0.6588235, 0, 1,
-1.243977, 1.028153, 0.5167181, 1, 0.6666667, 0, 1,
-1.243674, 0.2694725, -2.604057, 1, 0.6705883, 0, 1,
-1.235261, 0.3548746, -1.646868, 1, 0.6784314, 0, 1,
-1.234298, -0.5411087, -1.789154, 1, 0.682353, 0, 1,
-1.230391, 0.03859299, -2.065489, 1, 0.6901961, 0, 1,
-1.229256, 1.177782, -0.8094173, 1, 0.6941177, 0, 1,
-1.228097, 0.1642952, -2.273633, 1, 0.7019608, 0, 1,
-1.22406, -0.8578882, -2.48773, 1, 0.7098039, 0, 1,
-1.214381, 2.127613, 0.3509634, 1, 0.7137255, 0, 1,
-1.211629, -0.2996948, 0.2315128, 1, 0.7215686, 0, 1,
-1.208769, -0.6354705, -3.560825, 1, 0.7254902, 0, 1,
-1.193211, -1.19435, -2.74824, 1, 0.7333333, 0, 1,
-1.176763, 0.08737227, -1.943097, 1, 0.7372549, 0, 1,
-1.16303, 0.2448604, -1.363727, 1, 0.7450981, 0, 1,
-1.16129, 0.4878018, -0.6022301, 1, 0.7490196, 0, 1,
-1.161114, -0.06944307, -1.475669, 1, 0.7568628, 0, 1,
-1.146839, 2.449813, 0.5460789, 1, 0.7607843, 0, 1,
-1.14448, -0.9398522, -1.305134, 1, 0.7686275, 0, 1,
-1.140826, -0.4498537, -1.172386, 1, 0.772549, 0, 1,
-1.13918, 0.5164939, -0.7769757, 1, 0.7803922, 0, 1,
-1.135572, -1.823066, -2.882159, 1, 0.7843137, 0, 1,
-1.125592, 0.8423105, -0.8808639, 1, 0.7921569, 0, 1,
-1.123905, -0.4124065, -1.648063, 1, 0.7960784, 0, 1,
-1.122518, 0.3597739, -0.9206423, 1, 0.8039216, 0, 1,
-1.119099, -1.308617, -3.539407, 1, 0.8117647, 0, 1,
-1.114317, -0.5459371, -1.455115, 1, 0.8156863, 0, 1,
-1.11182, -0.8475045, -4.935136, 1, 0.8235294, 0, 1,
-1.109789, 0.4111058, -2.5595, 1, 0.827451, 0, 1,
-1.106873, -0.6305839, -3.11996, 1, 0.8352941, 0, 1,
-1.10624, 0.2689103, -0.4787142, 1, 0.8392157, 0, 1,
-1.095926, -0.1734139, -1.992425, 1, 0.8470588, 0, 1,
-1.094267, 0.8167862, -1.846207, 1, 0.8509804, 0, 1,
-1.090119, -0.6626746, -1.509297, 1, 0.8588235, 0, 1,
-1.087379, -2.237731, -1.196106, 1, 0.8627451, 0, 1,
-1.08634, 0.7267795, 0.793933, 1, 0.8705882, 0, 1,
-1.083331, 0.1490314, 0.7562346, 1, 0.8745098, 0, 1,
-1.08215, 0.4047822, -0.469109, 1, 0.8823529, 0, 1,
-1.078846, 0.4093499, -2.845694, 1, 0.8862745, 0, 1,
-1.067878, -1.637452, -3.809561, 1, 0.8941177, 0, 1,
-1.065938, 0.1339057, 0.3073253, 1, 0.8980392, 0, 1,
-1.063501, -0.4176317, -0.5545201, 1, 0.9058824, 0, 1,
-1.058931, -0.2686549, -1.593256, 1, 0.9137255, 0, 1,
-1.05784, -1.123197, -1.661329, 1, 0.9176471, 0, 1,
-1.057419, 0.1312109, -1.063308, 1, 0.9254902, 0, 1,
-1.05636, 2.368952, -0.7484118, 1, 0.9294118, 0, 1,
-1.048071, -1.359238, -3.728156, 1, 0.9372549, 0, 1,
-1.045973, -0.4006647, -0.9681237, 1, 0.9411765, 0, 1,
-1.039594, 1.67025, -0.4631069, 1, 0.9490196, 0, 1,
-1.038415, -1.317977, -3.453502, 1, 0.9529412, 0, 1,
-1.02929, -0.6788499, -4.057209, 1, 0.9607843, 0, 1,
-1.026991, 0.3278157, -1.578467, 1, 0.9647059, 0, 1,
-1.022142, 0.2305565, -0.3383331, 1, 0.972549, 0, 1,
-1.020318, -2.815278, -1.628742, 1, 0.9764706, 0, 1,
-1.014594, 0.6804432, -1.271359, 1, 0.9843137, 0, 1,
-1.01253, 0.6303467, -1.020866, 1, 0.9882353, 0, 1,
-1.012286, -0.5231861, -1.361858, 1, 0.9960784, 0, 1,
-1.007459, -0.529754, -1.796199, 0.9960784, 1, 0, 1,
-0.9955021, -2.142329, -1.854831, 0.9921569, 1, 0, 1,
-0.9903256, 0.7218522, -1.960309, 0.9843137, 1, 0, 1,
-0.988213, 0.9755806, -0.06709399, 0.9803922, 1, 0, 1,
-0.9851021, 1.3222, -2.637476, 0.972549, 1, 0, 1,
-0.9746487, -1.068627, -2.077886, 0.9686275, 1, 0, 1,
-0.9698177, -0.07555312, -1.661337, 0.9607843, 1, 0, 1,
-0.9694245, -1.012812, -1.027642, 0.9568627, 1, 0, 1,
-0.9636617, -0.4980545, -2.811953, 0.9490196, 1, 0, 1,
-0.9615269, -0.09098975, -0.4963384, 0.945098, 1, 0, 1,
-0.957554, 1.757037, -0.9906152, 0.9372549, 1, 0, 1,
-0.952765, -0.1085277, -0.5566896, 0.9333333, 1, 0, 1,
-0.9466532, 2.117041, -0.9430781, 0.9254902, 1, 0, 1,
-0.9446777, 0.8434736, 0.5929415, 0.9215686, 1, 0, 1,
-0.9441648, 1.540535, -0.2244406, 0.9137255, 1, 0, 1,
-0.9361411, -2.064848, -3.552451, 0.9098039, 1, 0, 1,
-0.9337781, -0.5087005, -1.813027, 0.9019608, 1, 0, 1,
-0.9321794, 0.5755479, -1.581668, 0.8941177, 1, 0, 1,
-0.9320067, 0.517049, -1.34101, 0.8901961, 1, 0, 1,
-0.9303569, -1.12616, -1.754539, 0.8823529, 1, 0, 1,
-0.9266618, 0.02427995, -2.07193, 0.8784314, 1, 0, 1,
-0.9234812, 0.8077609, -0.508155, 0.8705882, 1, 0, 1,
-0.9223375, -0.9143836, -2.509207, 0.8666667, 1, 0, 1,
-0.9209691, -1.049855, -2.923425, 0.8588235, 1, 0, 1,
-0.9152181, -0.4807953, -2.732946, 0.854902, 1, 0, 1,
-0.9124497, -0.2450134, -2.054124, 0.8470588, 1, 0, 1,
-0.9056938, -0.9061266, -2.687413, 0.8431373, 1, 0, 1,
-0.8907899, -1.349582, -1.548085, 0.8352941, 1, 0, 1,
-0.8843805, -0.5208182, -0.9094015, 0.8313726, 1, 0, 1,
-0.8675783, -0.4072039, -0.8729303, 0.8235294, 1, 0, 1,
-0.8630388, 0.5858868, -2.970714, 0.8196079, 1, 0, 1,
-0.859984, -0.4109967, -2.287634, 0.8117647, 1, 0, 1,
-0.8569589, -0.0986887, -1.455409, 0.8078431, 1, 0, 1,
-0.8565335, 0.5575102, -0.1599436, 0.8, 1, 0, 1,
-0.8527074, 0.4330427, -0.4476431, 0.7921569, 1, 0, 1,
-0.8448753, 1.536365, -1.270686, 0.7882353, 1, 0, 1,
-0.8424298, -1.628996, -2.140978, 0.7803922, 1, 0, 1,
-0.8416354, 1.128715, -0.5708078, 0.7764706, 1, 0, 1,
-0.8357849, 0.2545418, -1.913812, 0.7686275, 1, 0, 1,
-0.8308589, 0.1975664, -3.461778, 0.7647059, 1, 0, 1,
-0.8283203, -0.09499066, -2.834397, 0.7568628, 1, 0, 1,
-0.8240824, -0.2001036, -2.256495, 0.7529412, 1, 0, 1,
-0.8219521, -2.065857, -2.437059, 0.7450981, 1, 0, 1,
-0.8106849, -0.5189492, -0.6142295, 0.7411765, 1, 0, 1,
-0.8050067, 0.4723541, -1.900758, 0.7333333, 1, 0, 1,
-0.8044115, -0.3267885, -2.001197, 0.7294118, 1, 0, 1,
-0.7970833, -1.489716, -3.263366, 0.7215686, 1, 0, 1,
-0.793906, 1.250254, 0.623655, 0.7176471, 1, 0, 1,
-0.7924728, 1.0742, -1.364203, 0.7098039, 1, 0, 1,
-0.7772341, 0.9129099, -1.072116, 0.7058824, 1, 0, 1,
-0.7705365, -0.03724733, -1.793329, 0.6980392, 1, 0, 1,
-0.7695328, -1.01281, -3.606276, 0.6901961, 1, 0, 1,
-0.7687537, -0.1075678, -1.512168, 0.6862745, 1, 0, 1,
-0.7605105, 0.08905631, -3.285643, 0.6784314, 1, 0, 1,
-0.7590603, -0.9806828, -3.210536, 0.6745098, 1, 0, 1,
-0.7484475, -0.4803516, -1.460841, 0.6666667, 1, 0, 1,
-0.7468061, 0.328335, -1.545214, 0.6627451, 1, 0, 1,
-0.7459943, -1.11045, -3.030439, 0.654902, 1, 0, 1,
-0.739987, -0.9599411, -3.140344, 0.6509804, 1, 0, 1,
-0.7297028, -1.018174, -3.477235, 0.6431373, 1, 0, 1,
-0.72714, -0.5465401, -2.868575, 0.6392157, 1, 0, 1,
-0.7270045, -1.441823, -0.4012637, 0.6313726, 1, 0, 1,
-0.7201205, 1.459356, -1.579221, 0.627451, 1, 0, 1,
-0.7181107, -0.2623546, -0.8698801, 0.6196079, 1, 0, 1,
-0.7136618, 0.8282042, -1.763603, 0.6156863, 1, 0, 1,
-0.7083498, 1.10839, -1.406752, 0.6078432, 1, 0, 1,
-0.7063985, 0.9463044, -0.3994906, 0.6039216, 1, 0, 1,
-0.7002777, 1.442136, -2.346137, 0.5960785, 1, 0, 1,
-0.6946715, 2.827741, -0.04187758, 0.5882353, 1, 0, 1,
-0.6940964, 0.7673318, -0.8705712, 0.5843138, 1, 0, 1,
-0.6920398, 0.8571706, -0.2501381, 0.5764706, 1, 0, 1,
-0.6778854, -1.6112, -3.155359, 0.572549, 1, 0, 1,
-0.6769968, -0.7061972, -3.216612, 0.5647059, 1, 0, 1,
-0.6749848, -1.824877, -3.199428, 0.5607843, 1, 0, 1,
-0.6671435, -0.7629917, -3.673991, 0.5529412, 1, 0, 1,
-0.6663345, 0.4582672, -1.785588, 0.5490196, 1, 0, 1,
-0.6609578, 0.1401401, -2.308365, 0.5411765, 1, 0, 1,
-0.6588603, 0.7991425, -1.143772, 0.5372549, 1, 0, 1,
-0.6580595, -0.471813, -3.041642, 0.5294118, 1, 0, 1,
-0.654126, -0.1285308, -1.605056, 0.5254902, 1, 0, 1,
-0.6490302, 1.649683, 1.203601, 0.5176471, 1, 0, 1,
-0.6489062, 0.06043727, -2.118599, 0.5137255, 1, 0, 1,
-0.6473859, -0.1527361, -1.358067, 0.5058824, 1, 0, 1,
-0.6472874, -1.499616, -2.67455, 0.5019608, 1, 0, 1,
-0.6433004, -0.4009606, -0.4476742, 0.4941176, 1, 0, 1,
-0.6374568, 0.8469153, -0.115265, 0.4862745, 1, 0, 1,
-0.6257886, 3.139392, -0.4663316, 0.4823529, 1, 0, 1,
-0.6252277, 0.2505912, -1.911802, 0.4745098, 1, 0, 1,
-0.6231075, -1.664518, -2.384221, 0.4705882, 1, 0, 1,
-0.6218899, -1.528206, -1.479467, 0.4627451, 1, 0, 1,
-0.6146228, 0.4769371, -0.9084103, 0.4588235, 1, 0, 1,
-0.606087, -1.081081, -1.7688, 0.4509804, 1, 0, 1,
-0.6028689, 1.531402, -1.666003, 0.4470588, 1, 0, 1,
-0.6010246, 0.2937661, -1.324069, 0.4392157, 1, 0, 1,
-0.5981852, -0.3728157, -0.768243, 0.4352941, 1, 0, 1,
-0.5968037, 0.3495606, -1.26916, 0.427451, 1, 0, 1,
-0.5951822, 1.186747, -0.03789885, 0.4235294, 1, 0, 1,
-0.5947679, -0.124102, -1.405384, 0.4156863, 1, 0, 1,
-0.5926853, 0.07931183, -1.195156, 0.4117647, 1, 0, 1,
-0.589833, 0.1982265, -0.5395479, 0.4039216, 1, 0, 1,
-0.5896268, 1.271873, -0.3051886, 0.3960784, 1, 0, 1,
-0.5849914, -0.5217363, -3.408595, 0.3921569, 1, 0, 1,
-0.5823583, 0.6882812, -1.229243, 0.3843137, 1, 0, 1,
-0.5816825, -0.7471979, -1.902493, 0.3803922, 1, 0, 1,
-0.5812477, 0.5232986, 0.02156592, 0.372549, 1, 0, 1,
-0.5782951, -0.9519232, -3.14415, 0.3686275, 1, 0, 1,
-0.5750741, 0.7055406, -2.719903, 0.3607843, 1, 0, 1,
-0.574326, 1.706875, 0.2706121, 0.3568628, 1, 0, 1,
-0.570905, 0.3810446, -1.600306, 0.3490196, 1, 0, 1,
-0.5689125, 0.08009276, -2.128922, 0.345098, 1, 0, 1,
-0.568418, 1.512669, -0.0833851, 0.3372549, 1, 0, 1,
-0.5641601, -1.104139, -2.410222, 0.3333333, 1, 0, 1,
-0.5630557, -0.6890157, -1.675633, 0.3254902, 1, 0, 1,
-0.557959, 1.298442, -0.3085515, 0.3215686, 1, 0, 1,
-0.55664, 0.7616196, -0.7567873, 0.3137255, 1, 0, 1,
-0.550446, -0.9951923, -1.786982, 0.3098039, 1, 0, 1,
-0.5501271, 0.5208878, -1.214945, 0.3019608, 1, 0, 1,
-0.5477488, 0.7902269, 0.7572475, 0.2941177, 1, 0, 1,
-0.5452448, 3.000721, 0.2900268, 0.2901961, 1, 0, 1,
-0.5425015, 0.05446339, -0.6136782, 0.282353, 1, 0, 1,
-0.5406873, 0.5078734, -0.6268311, 0.2784314, 1, 0, 1,
-0.5380363, 0.9700055, -0.1427006, 0.2705882, 1, 0, 1,
-0.537662, -0.3685637, -1.510396, 0.2666667, 1, 0, 1,
-0.5324661, 1.849668, -0.4109112, 0.2588235, 1, 0, 1,
-0.5319899, -1.856327, -2.488662, 0.254902, 1, 0, 1,
-0.531229, 1.38032, -0.5368698, 0.2470588, 1, 0, 1,
-0.5296755, -0.5982527, -3.331314, 0.2431373, 1, 0, 1,
-0.5293283, 1.212331, -0.1157746, 0.2352941, 1, 0, 1,
-0.5288612, 0.4362441, -0.1552763, 0.2313726, 1, 0, 1,
-0.5280088, 0.1784565, -2.083066, 0.2235294, 1, 0, 1,
-0.5176029, -0.5106233, -2.263067, 0.2196078, 1, 0, 1,
-0.5174533, -0.7556282, -2.105997, 0.2117647, 1, 0, 1,
-0.5174249, 0.9794058, -1.205865, 0.2078431, 1, 0, 1,
-0.5168057, 0.4883651, -0.4965325, 0.2, 1, 0, 1,
-0.5141685, -0.6337541, -0.9844071, 0.1921569, 1, 0, 1,
-0.5133771, 0.5617455, -1.726496, 0.1882353, 1, 0, 1,
-0.5126487, 1.294132, -0.1388882, 0.1803922, 1, 0, 1,
-0.5105742, -1.009487, -1.855133, 0.1764706, 1, 0, 1,
-0.5075902, -1.030865, -1.901726, 0.1686275, 1, 0, 1,
-0.5036718, 2.047802, -1.407832, 0.1647059, 1, 0, 1,
-0.5034599, -2.184668, -1.715371, 0.1568628, 1, 0, 1,
-0.5009308, 0.3134138, -0.3237838, 0.1529412, 1, 0, 1,
-0.4918716, 0.1700083, -3.423373, 0.145098, 1, 0, 1,
-0.4893564, -0.6454661, -2.410973, 0.1411765, 1, 0, 1,
-0.488541, -0.0745114, -1.796415, 0.1333333, 1, 0, 1,
-0.4860908, 1.43817, 0.6146818, 0.1294118, 1, 0, 1,
-0.4835402, -0.4841528, -2.570605, 0.1215686, 1, 0, 1,
-0.4822153, 1.755956, -1.354899, 0.1176471, 1, 0, 1,
-0.468778, -0.2391723, -1.227033, 0.1098039, 1, 0, 1,
-0.464863, 0.3627164, -1.632353, 0.1058824, 1, 0, 1,
-0.4630723, -0.4122669, -1.553381, 0.09803922, 1, 0, 1,
-0.4616778, -0.8764747, -2.538974, 0.09019608, 1, 0, 1,
-0.4601565, 1.669439, -1.838917, 0.08627451, 1, 0, 1,
-0.4567615, 1.410887, -1.219939, 0.07843138, 1, 0, 1,
-0.4549981, -2.145673, -4.644406, 0.07450981, 1, 0, 1,
-0.4516052, -0.4680403, -2.789068, 0.06666667, 1, 0, 1,
-0.4503021, 1.511112, -0.07546271, 0.0627451, 1, 0, 1,
-0.4479219, -0.4092795, -1.540075, 0.05490196, 1, 0, 1,
-0.4443254, -1.284719, -2.590512, 0.05098039, 1, 0, 1,
-0.4433943, -1.945181, -2.933059, 0.04313726, 1, 0, 1,
-0.4407603, -0.7039807, -2.19415, 0.03921569, 1, 0, 1,
-0.4384915, -0.1978753, -1.317184, 0.03137255, 1, 0, 1,
-0.4381414, 0.8579307, -0.9235789, 0.02745098, 1, 0, 1,
-0.4378038, 0.4568877, 0.00946913, 0.01960784, 1, 0, 1,
-0.437358, -3.312881, -2.687129, 0.01568628, 1, 0, 1,
-0.4351115, 0.2326505, -1.651711, 0.007843138, 1, 0, 1,
-0.4310418, 0.4714914, -0.6787593, 0.003921569, 1, 0, 1,
-0.4276303, -0.2982187, -2.419972, 0, 1, 0.003921569, 1,
-0.4227594, -1.493238, -2.553515, 0, 1, 0.01176471, 1,
-0.4209622, -1.620125, -2.535642, 0, 1, 0.01568628, 1,
-0.4200083, -0.5742142, -2.047819, 0, 1, 0.02352941, 1,
-0.4182082, 0.3810576, -0.7144905, 0, 1, 0.02745098, 1,
-0.4181781, 0.7017729, -0.2156094, 0, 1, 0.03529412, 1,
-0.4169606, -0.01796789, -2.082033, 0, 1, 0.03921569, 1,
-0.415553, 1.958924, 0.2657132, 0, 1, 0.04705882, 1,
-0.4128544, -0.5860834, -3.826875, 0, 1, 0.05098039, 1,
-0.4121709, 0.04002509, -2.069458, 0, 1, 0.05882353, 1,
-0.4056332, -0.2871959, -3.428878, 0, 1, 0.0627451, 1,
-0.4045474, 0.09260261, -1.48067, 0, 1, 0.07058824, 1,
-0.4036771, 1.335082, -0.1088395, 0, 1, 0.07450981, 1,
-0.4036639, 0.6099008, -0.5036688, 0, 1, 0.08235294, 1,
-0.3938377, -1.091006, -1.464581, 0, 1, 0.08627451, 1,
-0.3936208, 0.1461342, -2.688701, 0, 1, 0.09411765, 1,
-0.3920135, 2.531592, 0.02491153, 0, 1, 0.1019608, 1,
-0.3914187, 0.05943977, 0.5209001, 0, 1, 0.1058824, 1,
-0.3843878, 0.04856828, -1.952889, 0, 1, 0.1137255, 1,
-0.3783067, 0.8547484, 0.7616044, 0, 1, 0.1176471, 1,
-0.3749591, 0.9083066, -1.039182, 0, 1, 0.1254902, 1,
-0.3721734, 1.912824, -0.7707729, 0, 1, 0.1294118, 1,
-0.3705909, -0.02936827, -2.3146, 0, 1, 0.1372549, 1,
-0.3664139, -1.263049, -1.469881, 0, 1, 0.1411765, 1,
-0.3625901, -0.502597, -1.705342, 0, 1, 0.1490196, 1,
-0.3589149, 0.7421797, -0.429588, 0, 1, 0.1529412, 1,
-0.3587443, 0.1683082, -1.312399, 0, 1, 0.1607843, 1,
-0.3585947, 1.437413, 0.1168112, 0, 1, 0.1647059, 1,
-0.3585092, -1.100589, -2.64916, 0, 1, 0.172549, 1,
-0.3560119, 1.104381, -1.286868, 0, 1, 0.1764706, 1,
-0.3550708, 0.1704002, -1.303212, 0, 1, 0.1843137, 1,
-0.3488747, -0.05961673, -0.9171562, 0, 1, 0.1882353, 1,
-0.3476432, 2.738513, -1.291702, 0, 1, 0.1960784, 1,
-0.3451846, 0.1307147, -0.684302, 0, 1, 0.2039216, 1,
-0.3408374, 0.348673, -0.3028098, 0, 1, 0.2078431, 1,
-0.337715, -1.661712, -3.299443, 0, 1, 0.2156863, 1,
-0.3338877, -1.708476, -2.065006, 0, 1, 0.2196078, 1,
-0.3300537, 1.988487, -2.06353, 0, 1, 0.227451, 1,
-0.3182939, -0.5474654, -1.76268, 0, 1, 0.2313726, 1,
-0.3181972, 0.07084814, -1.506006, 0, 1, 0.2392157, 1,
-0.3175522, -0.2168192, -3.120973, 0, 1, 0.2431373, 1,
-0.3174516, -0.6999315, -3.939992, 0, 1, 0.2509804, 1,
-0.3154358, -0.2493072, -2.130023, 0, 1, 0.254902, 1,
-0.3053483, -0.3074252, -3.99339, 0, 1, 0.2627451, 1,
-0.2997363, -1.191428, -1.927049, 0, 1, 0.2666667, 1,
-0.2962641, 1.052134, -0.1307432, 0, 1, 0.2745098, 1,
-0.2947898, 1.019067, -0.8584642, 0, 1, 0.2784314, 1,
-0.2861924, -0.1166884, -0.5424348, 0, 1, 0.2862745, 1,
-0.2795827, -1.113808, -3.057816, 0, 1, 0.2901961, 1,
-0.2763404, 0.09238636, 0.4344153, 0, 1, 0.2980392, 1,
-0.2744093, 0.9709437, -0.1093445, 0, 1, 0.3058824, 1,
-0.2726265, 0.4913931, -0.0379432, 0, 1, 0.3098039, 1,
-0.2692907, -1.704132, -0.6574295, 0, 1, 0.3176471, 1,
-0.2686398, 1.539483, -0.01424307, 0, 1, 0.3215686, 1,
-0.267055, -0.9884609, -3.32987, 0, 1, 0.3294118, 1,
-0.2670308, -0.920443, -3.221528, 0, 1, 0.3333333, 1,
-0.2660766, 1.76716, -0.1831635, 0, 1, 0.3411765, 1,
-0.2660476, -0.5073818, -2.878181, 0, 1, 0.345098, 1,
-0.264475, -1.096819, -2.882164, 0, 1, 0.3529412, 1,
-0.2611614, -0.7024239, -2.251723, 0, 1, 0.3568628, 1,
-0.2563331, 1.084043, 0.1410226, 0, 1, 0.3647059, 1,
-0.2543693, 0.1890171, -0.6549584, 0, 1, 0.3686275, 1,
-0.2542188, -0.3991213, -2.652326, 0, 1, 0.3764706, 1,
-0.252077, 0.8853376, 0.5220106, 0, 1, 0.3803922, 1,
-0.2490648, -0.759957, -2.268287, 0, 1, 0.3882353, 1,
-0.2468309, 1.055024, -0.210252, 0, 1, 0.3921569, 1,
-0.2400805, -1.616639, -1.708722, 0, 1, 0.4, 1,
-0.235799, -0.418711, -3.38518, 0, 1, 0.4078431, 1,
-0.2339617, 0.8307418, 0.3437107, 0, 1, 0.4117647, 1,
-0.2333681, -0.7907852, -2.12456, 0, 1, 0.4196078, 1,
-0.2326604, -1.243948, -4.658622, 0, 1, 0.4235294, 1,
-0.231943, 0.20347, -0.6034647, 0, 1, 0.4313726, 1,
-0.2302484, -2.424036, -2.374024, 0, 1, 0.4352941, 1,
-0.2289414, 0.5145369, -0.449825, 0, 1, 0.4431373, 1,
-0.2180292, -1.295523, -4.634548, 0, 1, 0.4470588, 1,
-0.2121372, 2.105247, -0.4947422, 0, 1, 0.454902, 1,
-0.2076444, 1.279488, -2.070938, 0, 1, 0.4588235, 1,
-0.2027934, 0.5487013, -1.253844, 0, 1, 0.4666667, 1,
-0.2027707, -0.2462195, -1.389769, 0, 1, 0.4705882, 1,
-0.2015697, -0.02863998, -2.905769, 0, 1, 0.4784314, 1,
-0.2013736, 0.8959458, -2.053639, 0, 1, 0.4823529, 1,
-0.2013128, 0.3209406, -0.2901565, 0, 1, 0.4901961, 1,
-0.1997294, 0.3056819, -0.6850545, 0, 1, 0.4941176, 1,
-0.1994789, -0.3081498, -1.153191, 0, 1, 0.5019608, 1,
-0.1990124, -0.8324527, -1.876703, 0, 1, 0.509804, 1,
-0.1982247, -0.2994863, -1.679366, 0, 1, 0.5137255, 1,
-0.1968447, 0.1197862, -3.669143, 0, 1, 0.5215687, 1,
-0.1962007, 0.5924172, -0.4932486, 0, 1, 0.5254902, 1,
-0.1862065, -0.7312915, -2.036701, 0, 1, 0.5333334, 1,
-0.1814695, -2.279085, -2.878239, 0, 1, 0.5372549, 1,
-0.1801896, -0.4286901, -2.75196, 0, 1, 0.5450981, 1,
-0.1789966, -0.4597724, -1.110425, 0, 1, 0.5490196, 1,
-0.1743311, 0.1462641, -1.868735, 0, 1, 0.5568628, 1,
-0.1703061, -1.160497, -1.187353, 0, 1, 0.5607843, 1,
-0.1680928, -2.105365, -4.040987, 0, 1, 0.5686275, 1,
-0.162005, -0.2275464, -0.884599, 0, 1, 0.572549, 1,
-0.160531, 0.2732229, -1.298383, 0, 1, 0.5803922, 1,
-0.1591975, -0.3725269, -2.736586, 0, 1, 0.5843138, 1,
-0.1574319, 0.3817152, -0.6953017, 0, 1, 0.5921569, 1,
-0.1532435, -0.07076196, -1.812891, 0, 1, 0.5960785, 1,
-0.1512749, 0.06254608, -0.09143922, 0, 1, 0.6039216, 1,
-0.1489117, 2.077943, 2.46926, 0, 1, 0.6117647, 1,
-0.1410822, -0.002078146, -0.3690813, 0, 1, 0.6156863, 1,
-0.1406139, -0.488036, -2.205625, 0, 1, 0.6235294, 1,
-0.1334319, 0.7627391, 2.164869, 0, 1, 0.627451, 1,
-0.1321306, 0.8012093, -1.727001, 0, 1, 0.6352941, 1,
-0.1245891, 1.346599, 0.1845807, 0, 1, 0.6392157, 1,
-0.1227604, -1.004251, -3.513623, 0, 1, 0.6470588, 1,
-0.114791, -0.9698012, -3.283118, 0, 1, 0.6509804, 1,
-0.1127498, -1.106853, -4.91831, 0, 1, 0.6588235, 1,
-0.1114089, -2.924126, -3.881223, 0, 1, 0.6627451, 1,
-0.1081368, 0.3682753, 1.350423, 0, 1, 0.6705883, 1,
-0.1074913, 0.8026686, -0.8691041, 0, 1, 0.6745098, 1,
-0.1058536, 0.4390984, -0.8997819, 0, 1, 0.682353, 1,
-0.0998417, -0.714155, -2.323521, 0, 1, 0.6862745, 1,
-0.09671883, 0.5670317, 0.5407551, 0, 1, 0.6941177, 1,
-0.08904169, -0.9154155, -2.099686, 0, 1, 0.7019608, 1,
-0.08379322, -1.320735, -1.64269, 0, 1, 0.7058824, 1,
-0.08248185, 0.5194013, -0.07766651, 0, 1, 0.7137255, 1,
-0.08247116, -0.9623421, -3.999188, 0, 1, 0.7176471, 1,
-0.07025334, -0.007652387, -1.865863, 0, 1, 0.7254902, 1,
-0.06779847, 0.2333583, -1.333193, 0, 1, 0.7294118, 1,
-0.06420714, -0.6175887, -4.59869, 0, 1, 0.7372549, 1,
-0.06177855, -0.5527862, -3.196956, 0, 1, 0.7411765, 1,
-0.05991056, -1.067903, -3.422293, 0, 1, 0.7490196, 1,
-0.05960348, 0.1670086, 0.3336997, 0, 1, 0.7529412, 1,
-0.05937253, -0.1134963, -4.554396, 0, 1, 0.7607843, 1,
-0.05699044, 0.7995154, -0.5160733, 0, 1, 0.7647059, 1,
-0.05386095, -0.2834538, -3.399044, 0, 1, 0.772549, 1,
-0.05269188, -1.669418, -3.427423, 0, 1, 0.7764706, 1,
-0.05228106, 0.7256551, 0.4363852, 0, 1, 0.7843137, 1,
-0.05159575, 1.205148, 0.1443265, 0, 1, 0.7882353, 1,
-0.0508032, 0.4514982, -0.7474542, 0, 1, 0.7960784, 1,
-0.04697495, 0.008134616, -2.984935, 0, 1, 0.8039216, 1,
-0.04694413, -1.040705, -3.873015, 0, 1, 0.8078431, 1,
-0.04509366, -0.4712207, -4.084868, 0, 1, 0.8156863, 1,
-0.04237928, 0.6757047, 0.3111256, 0, 1, 0.8196079, 1,
-0.03634557, 0.0400731, -0.9217363, 0, 1, 0.827451, 1,
-0.03509777, 0.5375114, -2.460013, 0, 1, 0.8313726, 1,
-0.03419927, 0.1464993, -0.1657298, 0, 1, 0.8392157, 1,
-0.03382792, 1.061885, -0.2285545, 0, 1, 0.8431373, 1,
-0.02950432, 1.372485, -0.246281, 0, 1, 0.8509804, 1,
-0.02909246, -0.6815748, -1.897232, 0, 1, 0.854902, 1,
-0.0286697, -0.8445369, -4.638079, 0, 1, 0.8627451, 1,
-0.02825598, -0.873268, -4.012714, 0, 1, 0.8666667, 1,
-0.02546795, 0.08944526, 0.5879464, 0, 1, 0.8745098, 1,
-0.02162825, 0.5198904, 0.9284987, 0, 1, 0.8784314, 1,
-0.01728913, 0.2960144, -1.205996, 0, 1, 0.8862745, 1,
-0.0160765, -0.7236057, -3.567955, 0, 1, 0.8901961, 1,
-0.01565818, -0.565729, -2.44377, 0, 1, 0.8980392, 1,
-0.01269707, 0.4018259, 0.755909, 0, 1, 0.9058824, 1,
-0.009319736, -0.5695639, -3.319846, 0, 1, 0.9098039, 1,
-0.008469699, -0.6849197, -3.947544, 0, 1, 0.9176471, 1,
-0.007552335, -1.661945, -5.229991, 0, 1, 0.9215686, 1,
-0.001097018, 1.301314, -1.142951, 0, 1, 0.9294118, 1,
0.002538885, -2.529018, 4.483153, 0, 1, 0.9333333, 1,
0.007549398, -0.9139466, 3.02669, 0, 1, 0.9411765, 1,
0.007772648, 0.009596824, 1.783837, 0, 1, 0.945098, 1,
0.00964951, -0.7327722, 1.434396, 0, 1, 0.9529412, 1,
0.01108548, -0.3059048, 3.251042, 0, 1, 0.9568627, 1,
0.01786779, 1.173787, -0.7732795, 0, 1, 0.9647059, 1,
0.0190134, 0.9229555, -0.95709, 0, 1, 0.9686275, 1,
0.01942404, 0.04429962, -0.2042259, 0, 1, 0.9764706, 1,
0.02572468, -1.615382, 3.867082, 0, 1, 0.9803922, 1,
0.02703722, 0.5491989, -0.4551306, 0, 1, 0.9882353, 1,
0.02858421, 1.224747, -0.2523147, 0, 1, 0.9921569, 1,
0.03301079, 0.0810548, 0.08494229, 0, 1, 1, 1,
0.03482567, -1.152972, 3.298979, 0, 0.9921569, 1, 1,
0.03658886, -0.8370057, 5.427835, 0, 0.9882353, 1, 1,
0.04162901, 0.730035, -0.5082285, 0, 0.9803922, 1, 1,
0.04467588, -0.6506675, 3.71166, 0, 0.9764706, 1, 1,
0.04527869, 0.3360131, -0.2204622, 0, 0.9686275, 1, 1,
0.05603296, 0.8971134, -0.3857564, 0, 0.9647059, 1, 1,
0.05944072, -0.2802825, 2.948481, 0, 0.9568627, 1, 1,
0.05947625, 0.3749127, 0.720341, 0, 0.9529412, 1, 1,
0.06028476, -0.1943295, 2.460061, 0, 0.945098, 1, 1,
0.06256798, 1.64938, 0.5996374, 0, 0.9411765, 1, 1,
0.06563802, 0.3573435, 0.8214766, 0, 0.9333333, 1, 1,
0.06970035, -0.152872, 4.458739, 0, 0.9294118, 1, 1,
0.07004743, -0.687564, 2.534402, 0, 0.9215686, 1, 1,
0.07081429, -0.6191607, 4.219961, 0, 0.9176471, 1, 1,
0.07186132, -0.8726471, 2.996167, 0, 0.9098039, 1, 1,
0.07190316, 1.158012, 0.034437, 0, 0.9058824, 1, 1,
0.07216359, -0.6553475, 2.849771, 0, 0.8980392, 1, 1,
0.07277846, 0.3383223, 1.739213, 0, 0.8901961, 1, 1,
0.07566986, 0.5170571, 0.9770699, 0, 0.8862745, 1, 1,
0.07907961, 0.2495887, -0.5073794, 0, 0.8784314, 1, 1,
0.07932474, 0.6295516, -1.053336, 0, 0.8745098, 1, 1,
0.083617, 0.7894168, -0.9083581, 0, 0.8666667, 1, 1,
0.08871508, 0.01382381, 2.290941, 0, 0.8627451, 1, 1,
0.09229559, 0.01367585, 1.884646, 0, 0.854902, 1, 1,
0.09240693, 0.973525, -0.7577559, 0, 0.8509804, 1, 1,
0.0928693, -0.2608609, 1.389093, 0, 0.8431373, 1, 1,
0.09599704, -0.09813418, 3.715502, 0, 0.8392157, 1, 1,
0.09701524, 0.2011844, 2.646567, 0, 0.8313726, 1, 1,
0.09877555, -0.09536146, 2.367857, 0, 0.827451, 1, 1,
0.1006763, 0.122375, -0.1229699, 0, 0.8196079, 1, 1,
0.1077271, -0.3616418, 1.863061, 0, 0.8156863, 1, 1,
0.109876, 0.8346685, -0.1337924, 0, 0.8078431, 1, 1,
0.1129692, 1.526273, -0.8908089, 0, 0.8039216, 1, 1,
0.1132099, 0.2567947, -0.5801733, 0, 0.7960784, 1, 1,
0.1138722, -1.194163, 3.041463, 0, 0.7882353, 1, 1,
0.1142363, -0.1185981, 2.775298, 0, 0.7843137, 1, 1,
0.1186102, 0.881898, -0.07284709, 0, 0.7764706, 1, 1,
0.1188318, 0.9368936, -0.2539791, 0, 0.772549, 1, 1,
0.1194028, 1.045836, -0.2622049, 0, 0.7647059, 1, 1,
0.120725, -0.6705666, 2.609126, 0, 0.7607843, 1, 1,
0.1217632, -0.4296776, 3.899972, 0, 0.7529412, 1, 1,
0.1232481, -0.1200199, 2.152434, 0, 0.7490196, 1, 1,
0.1313484, 1.614926, -0.2675441, 0, 0.7411765, 1, 1,
0.1333144, -1.432469, 1.415191, 0, 0.7372549, 1, 1,
0.1349331, -1.604933, 4.548164, 0, 0.7294118, 1, 1,
0.135424, -0.8266962, 2.658425, 0, 0.7254902, 1, 1,
0.1455014, -0.3105976, 3.233675, 0, 0.7176471, 1, 1,
0.1472086, -0.1576278, 1.899111, 0, 0.7137255, 1, 1,
0.1491593, 1.919687, -0.09527005, 0, 0.7058824, 1, 1,
0.1528851, -0.06383972, 2.53061, 0, 0.6980392, 1, 1,
0.159616, 0.1060926, 0.901255, 0, 0.6941177, 1, 1,
0.1643423, 0.6394113, 0.3693223, 0, 0.6862745, 1, 1,
0.1675398, -0.8049922, 2.565646, 0, 0.682353, 1, 1,
0.1685851, -0.735164, 1.801036, 0, 0.6745098, 1, 1,
0.1687572, -0.5471693, 4.190689, 0, 0.6705883, 1, 1,
0.1702504, 0.9397836, 1.471777, 0, 0.6627451, 1, 1,
0.1732011, 0.3070693, 1.079033, 0, 0.6588235, 1, 1,
0.1736258, -1.067695, 2.313312, 0, 0.6509804, 1, 1,
0.1777471, -0.5848401, 2.468369, 0, 0.6470588, 1, 1,
0.1796294, -0.02775593, 0.01461797, 0, 0.6392157, 1, 1,
0.1818193, 2.624633, 0.0519769, 0, 0.6352941, 1, 1,
0.1828388, 0.03828863, 2.419229, 0, 0.627451, 1, 1,
0.1833524, 0.5424171, 1.171522, 0, 0.6235294, 1, 1,
0.1889784, -2.502674, 3.939356, 0, 0.6156863, 1, 1,
0.1907046, 1.823138, 1.111727, 0, 0.6117647, 1, 1,
0.1924632, 0.1641515, 2.398866, 0, 0.6039216, 1, 1,
0.1926238, 0.1182269, 2.004128, 0, 0.5960785, 1, 1,
0.1943406, 1.419082, 1.761959, 0, 0.5921569, 1, 1,
0.1963776, 0.5819927, 1.030653, 0, 0.5843138, 1, 1,
0.1975713, 1.166988, 0.6716857, 0, 0.5803922, 1, 1,
0.1982628, 0.2401795, 1.928048, 0, 0.572549, 1, 1,
0.200465, -0.9934858, 4.420733, 0, 0.5686275, 1, 1,
0.2050524, -0.05478959, 2.353281, 0, 0.5607843, 1, 1,
0.2053115, -0.4870882, 3.199567, 0, 0.5568628, 1, 1,
0.2082182, 0.7328277, 1.448699, 0, 0.5490196, 1, 1,
0.2147385, -1.202956, 2.502122, 0, 0.5450981, 1, 1,
0.2173805, 0.4379571, -0.1032058, 0, 0.5372549, 1, 1,
0.2208081, -0.08072875, 1.287279, 0, 0.5333334, 1, 1,
0.223323, 1.962329, -0.1311429, 0, 0.5254902, 1, 1,
0.2315602, 0.9924203, 0.4658481, 0, 0.5215687, 1, 1,
0.2337373, -0.7964514, 2.665091, 0, 0.5137255, 1, 1,
0.2417914, -0.8280413, 2.569593, 0, 0.509804, 1, 1,
0.2421012, -2.078717, 3.098783, 0, 0.5019608, 1, 1,
0.2452189, 0.6034694, -0.1899213, 0, 0.4941176, 1, 1,
0.2459601, 2.490373, -1.694386, 0, 0.4901961, 1, 1,
0.2502795, 0.6683221, -0.1630162, 0, 0.4823529, 1, 1,
0.2588281, 1.021291, 1.13899, 0, 0.4784314, 1, 1,
0.2612593, -0.03459747, 2.517098, 0, 0.4705882, 1, 1,
0.2623509, 0.3691931, 1.525279, 0, 0.4666667, 1, 1,
0.265372, -0.4961569, 1.988922, 0, 0.4588235, 1, 1,
0.2679176, -1.363692, 3.54022, 0, 0.454902, 1, 1,
0.2696695, 0.3301736, 1.274281, 0, 0.4470588, 1, 1,
0.2718001, -0.8413444, 2.718466, 0, 0.4431373, 1, 1,
0.2748688, 0.5083265, 1.380384, 0, 0.4352941, 1, 1,
0.2749638, 0.4476288, 2.019077, 0, 0.4313726, 1, 1,
0.2776066, -0.8067737, 2.385448, 0, 0.4235294, 1, 1,
0.2825136, -0.1691391, 0.9697429, 0, 0.4196078, 1, 1,
0.2825463, -0.11342, 2.472327, 0, 0.4117647, 1, 1,
0.282815, 1.180846, -2.379768, 0, 0.4078431, 1, 1,
0.284742, -0.004501204, 2.98101, 0, 0.4, 1, 1,
0.286303, 1.081263, -0.07527459, 0, 0.3921569, 1, 1,
0.2878674, -1.083049, 3.221229, 0, 0.3882353, 1, 1,
0.2880035, 0.3257143, 1.571996, 0, 0.3803922, 1, 1,
0.29068, 1.144776, -1.190555, 0, 0.3764706, 1, 1,
0.2909715, -1.039661, 2.359984, 0, 0.3686275, 1, 1,
0.2925918, -1.306516, 2.216493, 0, 0.3647059, 1, 1,
0.2956546, 2.004307, -0.9999809, 0, 0.3568628, 1, 1,
0.3004276, -1.39672, 3.290525, 0, 0.3529412, 1, 1,
0.3069459, 2.040909, 1.728567, 0, 0.345098, 1, 1,
0.3103626, 0.09664375, 2.144549, 0, 0.3411765, 1, 1,
0.3125996, -0.5872519, 2.823682, 0, 0.3333333, 1, 1,
0.3161385, -0.6067293, 3.217674, 0, 0.3294118, 1, 1,
0.3189127, -0.5773629, 2.201045, 0, 0.3215686, 1, 1,
0.3197863, 2.195957, -1.109062, 0, 0.3176471, 1, 1,
0.3273816, -0.8410432, 4.434756, 0, 0.3098039, 1, 1,
0.33436, -0.8140475, 3.510909, 0, 0.3058824, 1, 1,
0.3345786, -0.5969378, 1.51013, 0, 0.2980392, 1, 1,
0.3355706, 0.1693235, 0.8360047, 0, 0.2901961, 1, 1,
0.3400925, 0.8164148, 0.8082425, 0, 0.2862745, 1, 1,
0.3454047, -1.161411, 3.392551, 0, 0.2784314, 1, 1,
0.345531, -1.618361, 4.523671, 0, 0.2745098, 1, 1,
0.3489027, -0.9726361, 1.126307, 0, 0.2666667, 1, 1,
0.3495788, 0.4966471, 0.2619807, 0, 0.2627451, 1, 1,
0.3496272, 0.9586791, 1.516514, 0, 0.254902, 1, 1,
0.3580801, 0.3278585, -0.1145325, 0, 0.2509804, 1, 1,
0.3583576, -0.7224966, 3.193951, 0, 0.2431373, 1, 1,
0.3583798, -0.5310708, 3.134099, 0, 0.2392157, 1, 1,
0.3588439, 0.3231329, 0.9630213, 0, 0.2313726, 1, 1,
0.36107, -2.208579, 2.40268, 0, 0.227451, 1, 1,
0.366069, 1.535833, 0.5735044, 0, 0.2196078, 1, 1,
0.3715179, -0.8205047, 2.857988, 0, 0.2156863, 1, 1,
0.3751152, -2.204708, 3.738999, 0, 0.2078431, 1, 1,
0.3818215, 0.3221504, 2.174213, 0, 0.2039216, 1, 1,
0.3844996, -0.4372874, 2.747472, 0, 0.1960784, 1, 1,
0.3850502, -0.8671035, 4.804022, 0, 0.1882353, 1, 1,
0.3861567, -0.4551422, 1.799316, 0, 0.1843137, 1, 1,
0.3945783, -0.3064491, 3.108852, 0, 0.1764706, 1, 1,
0.4003819, 0.02870055, 1.763252, 0, 0.172549, 1, 1,
0.4009315, 0.05952097, 2.044575, 0, 0.1647059, 1, 1,
0.4046567, -1.184449, 3.384621, 0, 0.1607843, 1, 1,
0.4085831, 2.074194, 1.393086, 0, 0.1529412, 1, 1,
0.4124958, -0.5465282, 1.455591, 0, 0.1490196, 1, 1,
0.4142427, -0.4115444, 2.158151, 0, 0.1411765, 1, 1,
0.4191763, 0.5130957, -0.2776772, 0, 0.1372549, 1, 1,
0.42021, 0.9955866, 2.314615, 0, 0.1294118, 1, 1,
0.4231054, -1.845193, 1.406294, 0, 0.1254902, 1, 1,
0.4231943, 1.655166, 0.4503923, 0, 0.1176471, 1, 1,
0.4234914, 0.5851642, 2.409158, 0, 0.1137255, 1, 1,
0.4236723, 1.787788, -0.1089913, 0, 0.1058824, 1, 1,
0.4241442, 0.1913416, 0.4999942, 0, 0.09803922, 1, 1,
0.4274822, -0.02222282, 2.105751, 0, 0.09411765, 1, 1,
0.4320886, 0.2988269, 2.099709, 0, 0.08627451, 1, 1,
0.4321997, -0.3124633, 1.725303, 0, 0.08235294, 1, 1,
0.4323628, -0.3396778, 1.714354, 0, 0.07450981, 1, 1,
0.433504, 0.4893773, 0.846671, 0, 0.07058824, 1, 1,
0.435273, -0.9857798, 1.40019, 0, 0.0627451, 1, 1,
0.4362405, -1.424889, 4.497925, 0, 0.05882353, 1, 1,
0.4377541, -0.4226601, 2.990036, 0, 0.05098039, 1, 1,
0.439272, -0.1668243, 0.9532239, 0, 0.04705882, 1, 1,
0.4409334, -0.3392928, 3.254854, 0, 0.03921569, 1, 1,
0.4432044, 0.1197303, 2.164803, 0, 0.03529412, 1, 1,
0.4496734, -0.7500297, 3.258032, 0, 0.02745098, 1, 1,
0.4573935, -1.102263, 3.118362, 0, 0.02352941, 1, 1,
0.4577425, -2.697963, 3.703336, 0, 0.01568628, 1, 1,
0.4655579, 0.2932289, 0.8245684, 0, 0.01176471, 1, 1,
0.4686341, 0.4449815, 1.611301, 0, 0.003921569, 1, 1,
0.4692304, 0.2763461, 1.719583, 0.003921569, 0, 1, 1,
0.47053, 0.1214788, 3.490436, 0.007843138, 0, 1, 1,
0.4736758, 0.07722132, 0.0923669, 0.01568628, 0, 1, 1,
0.4748178, -0.654684, 3.800253, 0.01960784, 0, 1, 1,
0.4748488, -0.2988456, 1.67861, 0.02745098, 0, 1, 1,
0.4754225, 0.2676419, 1.355903, 0.03137255, 0, 1, 1,
0.477792, -0.7032534, 3.202443, 0.03921569, 0, 1, 1,
0.4789732, 0.551129, 1.407443, 0.04313726, 0, 1, 1,
0.481035, 2.080535, -0.04019324, 0.05098039, 0, 1, 1,
0.4812849, -0.5802054, 1.658704, 0.05490196, 0, 1, 1,
0.4860695, 1.122392, 2.018373, 0.0627451, 0, 1, 1,
0.4866645, 0.150394, 0.01055262, 0.06666667, 0, 1, 1,
0.487435, 1.523607, 0.5622492, 0.07450981, 0, 1, 1,
0.4875996, 0.8489329, -1.694024, 0.07843138, 0, 1, 1,
0.4910862, 0.01274902, 0.8119062, 0.08627451, 0, 1, 1,
0.4925094, 0.6994007, -0.6628365, 0.09019608, 0, 1, 1,
0.4925722, -0.5393159, 1.703992, 0.09803922, 0, 1, 1,
0.4955355, 0.1564078, 0.4073147, 0.1058824, 0, 1, 1,
0.4962017, -1.313564, 2.685135, 0.1098039, 0, 1, 1,
0.4983964, -0.9938424, 1.619851, 0.1176471, 0, 1, 1,
0.4988287, 0.9969932, -0.510624, 0.1215686, 0, 1, 1,
0.4990175, -0.443464, 2.870771, 0.1294118, 0, 1, 1,
0.5040166, -1.371812, 3.717289, 0.1333333, 0, 1, 1,
0.5117797, 0.8073453, 0.7927403, 0.1411765, 0, 1, 1,
0.5138466, 0.9835834, 0.7856051, 0.145098, 0, 1, 1,
0.5235849, 0.5296565, 1.187731, 0.1529412, 0, 1, 1,
0.5264471, 2.352729, 0.4284339, 0.1568628, 0, 1, 1,
0.5264904, 0.7207758, 0.7072766, 0.1647059, 0, 1, 1,
0.5268931, -0.8624159, 2.524052, 0.1686275, 0, 1, 1,
0.530104, 0.9697233, 0.4166858, 0.1764706, 0, 1, 1,
0.5329069, 0.2340146, -0.0927769, 0.1803922, 0, 1, 1,
0.5335867, -0.8796672, 2.579179, 0.1882353, 0, 1, 1,
0.5341317, -1.158759, 2.849756, 0.1921569, 0, 1, 1,
0.5350111, -0.4159917, 0.8165653, 0.2, 0, 1, 1,
0.5356225, -1.441458, 3.54722, 0.2078431, 0, 1, 1,
0.5390773, 1.33553, -0.1578643, 0.2117647, 0, 1, 1,
0.5427753, -1.773569, 3.035644, 0.2196078, 0, 1, 1,
0.5438851, 2.322479, -0.3672691, 0.2235294, 0, 1, 1,
0.5446016, 0.4732129, 1.099067, 0.2313726, 0, 1, 1,
0.54636, 1.23593, 0.2830013, 0.2352941, 0, 1, 1,
0.5492163, 0.7945856, 0.1069124, 0.2431373, 0, 1, 1,
0.555819, -0.2733572, 0.6249071, 0.2470588, 0, 1, 1,
0.5570541, -1.138326, 2.156747, 0.254902, 0, 1, 1,
0.5589901, -1.144242, 4.222824, 0.2588235, 0, 1, 1,
0.5597633, 0.706586, -0.01635376, 0.2666667, 0, 1, 1,
0.5602241, 0.6228285, -0.31585, 0.2705882, 0, 1, 1,
0.5611778, 0.4778178, 0.08639853, 0.2784314, 0, 1, 1,
0.5614577, -0.2596285, 0.9522218, 0.282353, 0, 1, 1,
0.5625727, -0.5618501, 2.839785, 0.2901961, 0, 1, 1,
0.5670155, 0.8689964, 0.2287768, 0.2941177, 0, 1, 1,
0.5691438, 0.5311564, 0.8550375, 0.3019608, 0, 1, 1,
0.570997, -1.730792, 1.96149, 0.3098039, 0, 1, 1,
0.5750255, 0.4883742, 0.5687616, 0.3137255, 0, 1, 1,
0.5756187, 0.6494619, 0.6234114, 0.3215686, 0, 1, 1,
0.5808226, 0.8688592, 0.3335576, 0.3254902, 0, 1, 1,
0.582351, -0.3278047, 1.525338, 0.3333333, 0, 1, 1,
0.5828952, -0.05888386, 1.820259, 0.3372549, 0, 1, 1,
0.5850822, 0.1040065, 1.564086, 0.345098, 0, 1, 1,
0.585951, 1.158352, 0.9822174, 0.3490196, 0, 1, 1,
0.592198, 0.4544944, -0.7605177, 0.3568628, 0, 1, 1,
0.5934062, -1.198712, 2.017305, 0.3607843, 0, 1, 1,
0.5943127, 0.4524501, 0.2765797, 0.3686275, 0, 1, 1,
0.5947561, -0.8307458, 3.280236, 0.372549, 0, 1, 1,
0.5962678, 0.8358781, 1.733098, 0.3803922, 0, 1, 1,
0.6028154, 1.777972, -0.01268308, 0.3843137, 0, 1, 1,
0.6032054, 1.247769, 2.234127, 0.3921569, 0, 1, 1,
0.6053759, 1.557869, 1.330253, 0.3960784, 0, 1, 1,
0.6067257, 0.5851479, 0.3803825, 0.4039216, 0, 1, 1,
0.6073062, -0.3750813, 2.073235, 0.4117647, 0, 1, 1,
0.6090463, 0.5679257, -0.3337328, 0.4156863, 0, 1, 1,
0.6099468, -1.056549, 3.415284, 0.4235294, 0, 1, 1,
0.6203078, -1.239968, 2.853657, 0.427451, 0, 1, 1,
0.621834, 0.31693, 1.508854, 0.4352941, 0, 1, 1,
0.6270044, 0.9476259, -0.6476243, 0.4392157, 0, 1, 1,
0.6288201, -0.6983276, 1.671392, 0.4470588, 0, 1, 1,
0.6306742, -1.389245, 2.716436, 0.4509804, 0, 1, 1,
0.6348279, -0.9328915, 1.861813, 0.4588235, 0, 1, 1,
0.6349943, -1.685295, 2.024228, 0.4627451, 0, 1, 1,
0.6364515, -0.1037538, 2.379862, 0.4705882, 0, 1, 1,
0.6385068, -0.2021334, 1.764565, 0.4745098, 0, 1, 1,
0.6416033, -0.1675196, 1.10208, 0.4823529, 0, 1, 1,
0.6492893, 0.8791553, 1.305613, 0.4862745, 0, 1, 1,
0.6493185, 0.4427421, 0.6926944, 0.4941176, 0, 1, 1,
0.6505925, 0.0631259, 1.263803, 0.5019608, 0, 1, 1,
0.6525467, -0.4360781, -0.1489815, 0.5058824, 0, 1, 1,
0.6528236, 1.481027, 0.2941637, 0.5137255, 0, 1, 1,
0.6549429, -1.016627, 3.055685, 0.5176471, 0, 1, 1,
0.6569847, 1.496946, 0.07622724, 0.5254902, 0, 1, 1,
0.661135, -1.876555, 3.03971, 0.5294118, 0, 1, 1,
0.6633411, -0.1875251, 0.6114409, 0.5372549, 0, 1, 1,
0.6633485, -2.106942, 3.615371, 0.5411765, 0, 1, 1,
0.6644203, 1.325677, 0.07793377, 0.5490196, 0, 1, 1,
0.669111, 0.1070945, 0.1176187, 0.5529412, 0, 1, 1,
0.6746319, 1.126635, 0.4950399, 0.5607843, 0, 1, 1,
0.6808338, -0.537167, 2.522898, 0.5647059, 0, 1, 1,
0.6839093, 0.3091285, 1.94648, 0.572549, 0, 1, 1,
0.6846248, -1.042647, 1.563086, 0.5764706, 0, 1, 1,
0.6867698, -0.9208068, 2.246351, 0.5843138, 0, 1, 1,
0.6873491, -1.582447, 1.239729, 0.5882353, 0, 1, 1,
0.6898342, 0.940886, 0.1106678, 0.5960785, 0, 1, 1,
0.6917269, -0.02652592, 1.747727, 0.6039216, 0, 1, 1,
0.6934267, -0.139734, 0.9520826, 0.6078432, 0, 1, 1,
0.693541, 0.9959111, 0.0006377092, 0.6156863, 0, 1, 1,
0.6940312, -1.50378, 2.549289, 0.6196079, 0, 1, 1,
0.6988214, 1.112435, 1.21077, 0.627451, 0, 1, 1,
0.7053385, 0.748121, 1.440082, 0.6313726, 0, 1, 1,
0.7063562, -0.1447884, 3.960967, 0.6392157, 0, 1, 1,
0.7208043, 0.2037594, 2.892144, 0.6431373, 0, 1, 1,
0.7218645, 1.249663, -0.115791, 0.6509804, 0, 1, 1,
0.7233149, 1.292095, 0.1154734, 0.654902, 0, 1, 1,
0.7242348, -0.2635697, 0.5901332, 0.6627451, 0, 1, 1,
0.72442, -1.078457, 3.337837, 0.6666667, 0, 1, 1,
0.727233, 1.602667, 0.6880372, 0.6745098, 0, 1, 1,
0.7272757, 0.4603693, 2.788499, 0.6784314, 0, 1, 1,
0.731388, 1.038707, 1.629588, 0.6862745, 0, 1, 1,
0.7345409, 0.5260992, 1.109051, 0.6901961, 0, 1, 1,
0.7382643, -1.219254, 1.638397, 0.6980392, 0, 1, 1,
0.7435167, -0.0447763, 0.8753031, 0.7058824, 0, 1, 1,
0.7435871, -1.104774, 0.01816733, 0.7098039, 0, 1, 1,
0.7512494, -1.105683, 2.377031, 0.7176471, 0, 1, 1,
0.7523307, 1.338913, 1.70435, 0.7215686, 0, 1, 1,
0.7538071, 0.7026374, 0.6297438, 0.7294118, 0, 1, 1,
0.7541639, 0.1000273, 0.7935387, 0.7333333, 0, 1, 1,
0.7565055, -0.9456298, 4.593766, 0.7411765, 0, 1, 1,
0.757215, 0.7955134, 1.271681, 0.7450981, 0, 1, 1,
0.7616677, 0.4246966, 1.692518, 0.7529412, 0, 1, 1,
0.7722864, 1.065127, 0.8729572, 0.7568628, 0, 1, 1,
0.7725112, -0.1177282, 1.915324, 0.7647059, 0, 1, 1,
0.7753044, 0.3601465, 3.485516, 0.7686275, 0, 1, 1,
0.7917307, 0.1491552, -1.569743, 0.7764706, 0, 1, 1,
0.7984936, -0.05150411, 2.714046, 0.7803922, 0, 1, 1,
0.799866, 0.1070845, 2.277371, 0.7882353, 0, 1, 1,
0.806665, -0.6230143, 1.301628, 0.7921569, 0, 1, 1,
0.8151619, 1.741554, -0.4271025, 0.8, 0, 1, 1,
0.8264468, -0.03911233, 1.074687, 0.8078431, 0, 1, 1,
0.828651, 1.253605, -0.1271788, 0.8117647, 0, 1, 1,
0.8311449, 1.127806, 1.201348, 0.8196079, 0, 1, 1,
0.8325243, 1.70633, 1.282776, 0.8235294, 0, 1, 1,
0.8334979, 0.1772739, 3.256922, 0.8313726, 0, 1, 1,
0.835974, -0.2217851, 1.351068, 0.8352941, 0, 1, 1,
0.8370205, -0.1646076, 0.7976941, 0.8431373, 0, 1, 1,
0.8414942, 0.4607843, -0.2082094, 0.8470588, 0, 1, 1,
0.8465123, 1.210742, -0.01337396, 0.854902, 0, 1, 1,
0.8489029, 0.3505422, 0.2383383, 0.8588235, 0, 1, 1,
0.8518604, -0.9265322, 2.987415, 0.8666667, 0, 1, 1,
0.8536316, 0.886131, 3.244217, 0.8705882, 0, 1, 1,
0.8560655, 0.2308096, 2.329678, 0.8784314, 0, 1, 1,
0.8596255, -1.554457, 2.151676, 0.8823529, 0, 1, 1,
0.86998, -0.4359701, 2.008807, 0.8901961, 0, 1, 1,
0.8705047, 0.07164021, 1.795521, 0.8941177, 0, 1, 1,
0.8713954, 0.1876923, 2.93932, 0.9019608, 0, 1, 1,
0.8724273, 1.372909, 0.7475247, 0.9098039, 0, 1, 1,
0.8740218, -1.113403, 1.828731, 0.9137255, 0, 1, 1,
0.8810265, -0.7136042, 2.663764, 0.9215686, 0, 1, 1,
0.8811675, -0.159798, 1.107091, 0.9254902, 0, 1, 1,
0.8890895, -0.02317527, 2.216812, 0.9333333, 0, 1, 1,
0.8893979, 0.1702404, 1.738026, 0.9372549, 0, 1, 1,
0.8916856, 1.081643, 1.416566, 0.945098, 0, 1, 1,
0.8934632, -0.7026112, 1.887637, 0.9490196, 0, 1, 1,
0.896958, 0.2132316, -1.185765, 0.9568627, 0, 1, 1,
0.9034372, -0.2728017, 2.488358, 0.9607843, 0, 1, 1,
0.9058296, -0.2593446, 1.184265, 0.9686275, 0, 1, 1,
0.9093747, 0.3216595, 2.593517, 0.972549, 0, 1, 1,
0.9097502, 2.057537, -0.6609707, 0.9803922, 0, 1, 1,
0.9102681, 0.2640898, 0.7089897, 0.9843137, 0, 1, 1,
0.9178465, -1.398588, 3.29113, 0.9921569, 0, 1, 1,
0.9266638, -2.16545, 0.2571723, 0.9960784, 0, 1, 1,
0.9335744, 1.591601, -0.1767825, 1, 0, 0.9960784, 1,
0.9357303, 1.24157, -1.242414, 1, 0, 0.9882353, 1,
0.9396156, 0.6225171, 2.08816, 1, 0, 0.9843137, 1,
0.9421191, 0.3821073, 2.157322, 1, 0, 0.9764706, 1,
0.9427843, 1.393187, 0.4977679, 1, 0, 0.972549, 1,
0.9459893, -2.433111, 1.887845, 1, 0, 0.9647059, 1,
0.9544556, -1.184782, 1.271328, 1, 0, 0.9607843, 1,
0.9599642, -0.7342889, 4.880967, 1, 0, 0.9529412, 1,
0.9665395, -1.873513, 2.723948, 1, 0, 0.9490196, 1,
0.9687768, -0.3794351, 0.422503, 1, 0, 0.9411765, 1,
0.9730743, -0.9153928, 1.619656, 1, 0, 0.9372549, 1,
0.9732311, -1.348387, 1.899605, 1, 0, 0.9294118, 1,
0.9760445, -0.8015279, 0.03400792, 1, 0, 0.9254902, 1,
0.9765542, 0.5334849, 1.825736, 1, 0, 0.9176471, 1,
0.9789415, -0.4530228, 2.174115, 1, 0, 0.9137255, 1,
0.9942616, 0.8220422, -0.9784888, 1, 0, 0.9058824, 1,
0.9988804, -1.314419, 2.721827, 1, 0, 0.9019608, 1,
0.9993004, -0.3432846, 0.6365308, 1, 0, 0.8941177, 1,
1.023554, -0.3699453, 1.632586, 1, 0, 0.8862745, 1,
1.02603, -0.05394088, 1.063661, 1, 0, 0.8823529, 1,
1.030757, 0.9826583, 1.060919, 1, 0, 0.8745098, 1,
1.034698, -1.298535, 1.438284, 1, 0, 0.8705882, 1,
1.034791, -0.8340991, 3.130405, 1, 0, 0.8627451, 1,
1.035344, -0.6609125, 3.240008, 1, 0, 0.8588235, 1,
1.038786, 1.256944, 0.8746955, 1, 0, 0.8509804, 1,
1.041041, -0.03798181, 1.699022, 1, 0, 0.8470588, 1,
1.050831, 1.560866, 0.7878132, 1, 0, 0.8392157, 1,
1.059125, 0.1317006, 0.6620105, 1, 0, 0.8352941, 1,
1.0682, 1.063166, -0.07494981, 1, 0, 0.827451, 1,
1.075208, 1.484937, 0.2512875, 1, 0, 0.8235294, 1,
1.076662, -0.1845449, 2.527901, 1, 0, 0.8156863, 1,
1.079367, 0.04844696, 2.300942, 1, 0, 0.8117647, 1,
1.091787, -0.5456117, 3.017877, 1, 0, 0.8039216, 1,
1.094703, 0.7119141, 2.024306, 1, 0, 0.7960784, 1,
1.095445, -1.514815, 2.711843, 1, 0, 0.7921569, 1,
1.100905, 0.1167528, 1.154076, 1, 0, 0.7843137, 1,
1.102493, -0.1914971, 2.172351, 1, 0, 0.7803922, 1,
1.109888, -0.3779759, 2.072965, 1, 0, 0.772549, 1,
1.113185, -0.6257587, 2.39853, 1, 0, 0.7686275, 1,
1.115734, -0.9624795, -0.1743609, 1, 0, 0.7607843, 1,
1.116826, 1.037578, 1.057924, 1, 0, 0.7568628, 1,
1.130265, 0.918057, 1.798516, 1, 0, 0.7490196, 1,
1.135696, -0.3914638, 3.237937, 1, 0, 0.7450981, 1,
1.139933, -0.1123464, 0.4350512, 1, 0, 0.7372549, 1,
1.141544, 1.262084, 2.195341, 1, 0, 0.7333333, 1,
1.145452, 0.304442, 0.4275284, 1, 0, 0.7254902, 1,
1.149274, -0.6008106, 1.304183, 1, 0, 0.7215686, 1,
1.149966, 1.646478, 0.1460432, 1, 0, 0.7137255, 1,
1.156627, 0.1933246, 0.4018767, 1, 0, 0.7098039, 1,
1.162448, -0.1424997, 0.3957716, 1, 0, 0.7019608, 1,
1.172049, -0.4899701, 2.645267, 1, 0, 0.6941177, 1,
1.173698, -1.817151, 3.142704, 1, 0, 0.6901961, 1,
1.175367, -1.083725, 2.697723, 1, 0, 0.682353, 1,
1.182343, -2.022887, 3.215358, 1, 0, 0.6784314, 1,
1.192325, 0.03326831, 0.5839037, 1, 0, 0.6705883, 1,
1.197809, 1.292099, 1.563116, 1, 0, 0.6666667, 1,
1.200555, 2.602023, 0.4392256, 1, 0, 0.6588235, 1,
1.204075, 0.2632397, 2.162229, 1, 0, 0.654902, 1,
1.209318, -0.4161594, 2.401475, 1, 0, 0.6470588, 1,
1.223881, 0.06691513, 1.911911, 1, 0, 0.6431373, 1,
1.226779, -0.6754326, 1.585543, 1, 0, 0.6352941, 1,
1.234292, 0.6466019, 2.954189, 1, 0, 0.6313726, 1,
1.243547, -0.8149968, 1.143848, 1, 0, 0.6235294, 1,
1.244062, -0.7198041, 3.007108, 1, 0, 0.6196079, 1,
1.251189, 0.2385674, 1.936146, 1, 0, 0.6117647, 1,
1.251872, 1.585898, 2.060464, 1, 0, 0.6078432, 1,
1.256811, -1.472242, 1.198734, 1, 0, 0.6, 1,
1.2574, 1.864032, 0.5091254, 1, 0, 0.5921569, 1,
1.258176, 0.9034932, 0.7216798, 1, 0, 0.5882353, 1,
1.270455, 0.03871189, 0.5491458, 1, 0, 0.5803922, 1,
1.27096, -0.02043259, 2.02057, 1, 0, 0.5764706, 1,
1.274701, -0.7299727, 0.1694605, 1, 0, 0.5686275, 1,
1.275191, 1.546627, 0.2589498, 1, 0, 0.5647059, 1,
1.290941, -1.672827, 1.605408, 1, 0, 0.5568628, 1,
1.296606, 0.6401038, 0.3578378, 1, 0, 0.5529412, 1,
1.310258, 0.9471661, 1.256554, 1, 0, 0.5450981, 1,
1.318114, -1.127364, 2.293652, 1, 0, 0.5411765, 1,
1.327008, -0.01185987, 2.193012, 1, 0, 0.5333334, 1,
1.328106, 0.4285347, 1.07435, 1, 0, 0.5294118, 1,
1.343193, -0.6013347, 1.832925, 1, 0, 0.5215687, 1,
1.34378, 0.3608397, 2.169051, 1, 0, 0.5176471, 1,
1.355746, -1.051708, 1.52884, 1, 0, 0.509804, 1,
1.355873, -0.2348949, 0.8957699, 1, 0, 0.5058824, 1,
1.359926, -0.7981033, 1.860551, 1, 0, 0.4980392, 1,
1.378487, -0.2710582, 3.249345, 1, 0, 0.4901961, 1,
1.397207, -1.603096, 2.394954, 1, 0, 0.4862745, 1,
1.407302, -0.2611685, 1.712986, 1, 0, 0.4784314, 1,
1.411051, 1.559868, 2.095701, 1, 0, 0.4745098, 1,
1.435217, 1.303092, 2.176285, 1, 0, 0.4666667, 1,
1.437722, -1.688527, 2.156844, 1, 0, 0.4627451, 1,
1.449513, 0.8636964, 2.228241, 1, 0, 0.454902, 1,
1.473316, 0.1018229, 0.5709409, 1, 0, 0.4509804, 1,
1.476069, 1.08552, 1.373937, 1, 0, 0.4431373, 1,
1.491104, -2.02106, 1.377884, 1, 0, 0.4392157, 1,
1.491347, -0.8004986, 0.7112088, 1, 0, 0.4313726, 1,
1.497343, -0.2371225, 2.302202, 1, 0, 0.427451, 1,
1.502882, 0.3566401, 1.16081, 1, 0, 0.4196078, 1,
1.504483, -0.5150821, 3.560995, 1, 0, 0.4156863, 1,
1.512419, 0.8909039, 1.013114, 1, 0, 0.4078431, 1,
1.515866, 0.04907909, 2.24566, 1, 0, 0.4039216, 1,
1.526416, -0.7965046, 1.734566, 1, 0, 0.3960784, 1,
1.532127, 0.9692168, 2.89773, 1, 0, 0.3882353, 1,
1.548934, 0.4593715, 2.187627, 1, 0, 0.3843137, 1,
1.554114, -1.353533, 2.860411, 1, 0, 0.3764706, 1,
1.56033, -0.1638807, 0.03071419, 1, 0, 0.372549, 1,
1.561705, -0.4821276, 0.8507829, 1, 0, 0.3647059, 1,
1.563791, -0.7853934, 3.408544, 1, 0, 0.3607843, 1,
1.566491, -0.8159015, 3.082546, 1, 0, 0.3529412, 1,
1.575033, 0.5218062, 2.253354, 1, 0, 0.3490196, 1,
1.591125, 1.033381, 2.519758, 1, 0, 0.3411765, 1,
1.591884, 1.380725, -0.6039196, 1, 0, 0.3372549, 1,
1.601056, -0.7972244, 2.90131, 1, 0, 0.3294118, 1,
1.604629, -0.7988566, 2.24255, 1, 0, 0.3254902, 1,
1.614948, 0.2762446, 1.453867, 1, 0, 0.3176471, 1,
1.618765, -0.01013878, 1.525178, 1, 0, 0.3137255, 1,
1.621446, -0.7197738, 2.605794, 1, 0, 0.3058824, 1,
1.626073, 0.165943, 2.001405, 1, 0, 0.2980392, 1,
1.635231, 1.536328, -0.01780679, 1, 0, 0.2941177, 1,
1.660746, -1.310064, 2.594111, 1, 0, 0.2862745, 1,
1.67078, -0.1514501, 1.682561, 1, 0, 0.282353, 1,
1.686944, 0.003355741, 1.42705, 1, 0, 0.2745098, 1,
1.698431, 0.8553134, 1.294287, 1, 0, 0.2705882, 1,
1.708227, 0.4002312, 1.162397, 1, 0, 0.2627451, 1,
1.714471, 0.8385828, -0.5920904, 1, 0, 0.2588235, 1,
1.735961, -0.8553032, 4.326668, 1, 0, 0.2509804, 1,
1.738858, -0.6133069, 1.243203, 1, 0, 0.2470588, 1,
1.74264, 2.009788, 3.459786, 1, 0, 0.2392157, 1,
1.753166, -0.5324493, 2.790273, 1, 0, 0.2352941, 1,
1.758236, -2.140165, -0.2305477, 1, 0, 0.227451, 1,
1.773996, 1.031492, 0.1224867, 1, 0, 0.2235294, 1,
1.790122, 0.2534674, 2.117356, 1, 0, 0.2156863, 1,
1.791643, 1.17925, 0.5176047, 1, 0, 0.2117647, 1,
1.806279, 0.1822934, 1.031854, 1, 0, 0.2039216, 1,
1.821237, 1.972118, 1.461723, 1, 0, 0.1960784, 1,
1.848906, 0.3347174, 0.8985691, 1, 0, 0.1921569, 1,
1.860612, 0.5198296, 0.3226439, 1, 0, 0.1843137, 1,
1.862644, -0.8488858, 2.249198, 1, 0, 0.1803922, 1,
1.880734, 1.326797, 1.469665, 1, 0, 0.172549, 1,
1.907441, -1.034289, 2.305122, 1, 0, 0.1686275, 1,
1.923217, -1.116408, 2.527001, 1, 0, 0.1607843, 1,
1.923633, 2.265206, 0.426347, 1, 0, 0.1568628, 1,
1.940438, 1.420243, 1.005329, 1, 0, 0.1490196, 1,
1.950818, -0.7049705, 0.6480526, 1, 0, 0.145098, 1,
1.971692, 0.2589355, 1.648518, 1, 0, 0.1372549, 1,
1.979637, 1.332497, 0.7897786, 1, 0, 0.1333333, 1,
1.982275, -0.2694789, 0.4070692, 1, 0, 0.1254902, 1,
1.990637, 0.0130201, 1.348387, 1, 0, 0.1215686, 1,
2.004608, -0.8556955, 2.023227, 1, 0, 0.1137255, 1,
2.012571, 1.063696, 0.7769745, 1, 0, 0.1098039, 1,
2.060833, -2.737576, 2.102946, 1, 0, 0.1019608, 1,
2.061392, 1.152731, 1.45392, 1, 0, 0.09411765, 1,
2.10202, -1.164648, 1.088352, 1, 0, 0.09019608, 1,
2.117763, -0.3686696, 3.543254, 1, 0, 0.08235294, 1,
2.120587, -1.397938, 2.297587, 1, 0, 0.07843138, 1,
2.124201, -0.3936093, 1.085053, 1, 0, 0.07058824, 1,
2.134125, -0.3150792, 0.9270511, 1, 0, 0.06666667, 1,
2.213808, -1.12644, -0.17709, 1, 0, 0.05882353, 1,
2.220255, -0.4955422, 1.102331, 1, 0, 0.05490196, 1,
2.335154, -2.776223, 2.30827, 1, 0, 0.04705882, 1,
2.34535, 1.336626, 1.622636, 1, 0, 0.04313726, 1,
2.380982, 0.1282822, 2.039495, 1, 0, 0.03529412, 1,
2.435798, -0.1785813, 3.73049, 1, 0, 0.03137255, 1,
2.620276, -0.5946505, 2.338395, 1, 0, 0.02352941, 1,
2.643894, 0.5312237, 0.06360599, 1, 0, 0.01960784, 1,
3.333154, 0.3573429, 1.082598, 1, 0, 0.01176471, 1,
3.337632, 0.07131992, 2.236425, 1, 0, 0.007843138, 1
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
0.02097082, -4.406541, -7.036493, 0, -0.5, 0.5, 0.5,
0.02097082, -4.406541, -7.036493, 1, -0.5, 0.5, 0.5,
0.02097082, -4.406541, -7.036493, 1, 1.5, 0.5, 0.5,
0.02097082, -4.406541, -7.036493, 0, 1.5, 0.5, 0.5
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
-4.420039, -0.08674431, -7.036493, 0, -0.5, 0.5, 0.5,
-4.420039, -0.08674431, -7.036493, 1, -0.5, 0.5, 0.5,
-4.420039, -0.08674431, -7.036493, 1, 1.5, 0.5, 0.5,
-4.420039, -0.08674431, -7.036493, 0, 1.5, 0.5, 0.5
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
-4.420039, -4.406541, 0.09892154, 0, -0.5, 0.5, 0.5,
-4.420039, -4.406541, 0.09892154, 1, -0.5, 0.5, 0.5,
-4.420039, -4.406541, 0.09892154, 1, 1.5, 0.5, 0.5,
-4.420039, -4.406541, 0.09892154, 0, 1.5, 0.5, 0.5
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
-3, -3.409665, -5.389859,
3, -3.409665, -5.389859,
-3, -3.409665, -5.389859,
-3, -3.575811, -5.664298,
-2, -3.409665, -5.389859,
-2, -3.575811, -5.664298,
-1, -3.409665, -5.389859,
-1, -3.575811, -5.664298,
0, -3.409665, -5.389859,
0, -3.575811, -5.664298,
1, -3.409665, -5.389859,
1, -3.575811, -5.664298,
2, -3.409665, -5.389859,
2, -3.575811, -5.664298,
3, -3.409665, -5.389859,
3, -3.575811, -5.664298
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
-3, -3.908103, -6.213176, 0, -0.5, 0.5, 0.5,
-3, -3.908103, -6.213176, 1, -0.5, 0.5, 0.5,
-3, -3.908103, -6.213176, 1, 1.5, 0.5, 0.5,
-3, -3.908103, -6.213176, 0, 1.5, 0.5, 0.5,
-2, -3.908103, -6.213176, 0, -0.5, 0.5, 0.5,
-2, -3.908103, -6.213176, 1, -0.5, 0.5, 0.5,
-2, -3.908103, -6.213176, 1, 1.5, 0.5, 0.5,
-2, -3.908103, -6.213176, 0, 1.5, 0.5, 0.5,
-1, -3.908103, -6.213176, 0, -0.5, 0.5, 0.5,
-1, -3.908103, -6.213176, 1, -0.5, 0.5, 0.5,
-1, -3.908103, -6.213176, 1, 1.5, 0.5, 0.5,
-1, -3.908103, -6.213176, 0, 1.5, 0.5, 0.5,
0, -3.908103, -6.213176, 0, -0.5, 0.5, 0.5,
0, -3.908103, -6.213176, 1, -0.5, 0.5, 0.5,
0, -3.908103, -6.213176, 1, 1.5, 0.5, 0.5,
0, -3.908103, -6.213176, 0, 1.5, 0.5, 0.5,
1, -3.908103, -6.213176, 0, -0.5, 0.5, 0.5,
1, -3.908103, -6.213176, 1, -0.5, 0.5, 0.5,
1, -3.908103, -6.213176, 1, 1.5, 0.5, 0.5,
1, -3.908103, -6.213176, 0, 1.5, 0.5, 0.5,
2, -3.908103, -6.213176, 0, -0.5, 0.5, 0.5,
2, -3.908103, -6.213176, 1, -0.5, 0.5, 0.5,
2, -3.908103, -6.213176, 1, 1.5, 0.5, 0.5,
2, -3.908103, -6.213176, 0, 1.5, 0.5, 0.5,
3, -3.908103, -6.213176, 0, -0.5, 0.5, 0.5,
3, -3.908103, -6.213176, 1, -0.5, 0.5, 0.5,
3, -3.908103, -6.213176, 1, 1.5, 0.5, 0.5,
3, -3.908103, -6.213176, 0, 1.5, 0.5, 0.5
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
-3.39519, -3, -5.389859,
-3.39519, 3, -5.389859,
-3.39519, -3, -5.389859,
-3.565999, -3, -5.664298,
-3.39519, -2, -5.389859,
-3.565999, -2, -5.664298,
-3.39519, -1, -5.389859,
-3.565999, -1, -5.664298,
-3.39519, 0, -5.389859,
-3.565999, 0, -5.664298,
-3.39519, 1, -5.389859,
-3.565999, 1, -5.664298,
-3.39519, 2, -5.389859,
-3.565999, 2, -5.664298,
-3.39519, 3, -5.389859,
-3.565999, 3, -5.664298
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
-3.907614, -3, -6.213176, 0, -0.5, 0.5, 0.5,
-3.907614, -3, -6.213176, 1, -0.5, 0.5, 0.5,
-3.907614, -3, -6.213176, 1, 1.5, 0.5, 0.5,
-3.907614, -3, -6.213176, 0, 1.5, 0.5, 0.5,
-3.907614, -2, -6.213176, 0, -0.5, 0.5, 0.5,
-3.907614, -2, -6.213176, 1, -0.5, 0.5, 0.5,
-3.907614, -2, -6.213176, 1, 1.5, 0.5, 0.5,
-3.907614, -2, -6.213176, 0, 1.5, 0.5, 0.5,
-3.907614, -1, -6.213176, 0, -0.5, 0.5, 0.5,
-3.907614, -1, -6.213176, 1, -0.5, 0.5, 0.5,
-3.907614, -1, -6.213176, 1, 1.5, 0.5, 0.5,
-3.907614, -1, -6.213176, 0, 1.5, 0.5, 0.5,
-3.907614, 0, -6.213176, 0, -0.5, 0.5, 0.5,
-3.907614, 0, -6.213176, 1, -0.5, 0.5, 0.5,
-3.907614, 0, -6.213176, 1, 1.5, 0.5, 0.5,
-3.907614, 0, -6.213176, 0, 1.5, 0.5, 0.5,
-3.907614, 1, -6.213176, 0, -0.5, 0.5, 0.5,
-3.907614, 1, -6.213176, 1, -0.5, 0.5, 0.5,
-3.907614, 1, -6.213176, 1, 1.5, 0.5, 0.5,
-3.907614, 1, -6.213176, 0, 1.5, 0.5, 0.5,
-3.907614, 2, -6.213176, 0, -0.5, 0.5, 0.5,
-3.907614, 2, -6.213176, 1, -0.5, 0.5, 0.5,
-3.907614, 2, -6.213176, 1, 1.5, 0.5, 0.5,
-3.907614, 2, -6.213176, 0, 1.5, 0.5, 0.5,
-3.907614, 3, -6.213176, 0, -0.5, 0.5, 0.5,
-3.907614, 3, -6.213176, 1, -0.5, 0.5, 0.5,
-3.907614, 3, -6.213176, 1, 1.5, 0.5, 0.5,
-3.907614, 3, -6.213176, 0, 1.5, 0.5, 0.5
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
-3.39519, -3.409665, -4,
-3.39519, -3.409665, 4,
-3.39519, -3.409665, -4,
-3.565999, -3.575811, -4,
-3.39519, -3.409665, -2,
-3.565999, -3.575811, -2,
-3.39519, -3.409665, 0,
-3.565999, -3.575811, 0,
-3.39519, -3.409665, 2,
-3.565999, -3.575811, 2,
-3.39519, -3.409665, 4,
-3.565999, -3.575811, 4
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
-3.907614, -3.908103, -4, 0, -0.5, 0.5, 0.5,
-3.907614, -3.908103, -4, 1, -0.5, 0.5, 0.5,
-3.907614, -3.908103, -4, 1, 1.5, 0.5, 0.5,
-3.907614, -3.908103, -4, 0, 1.5, 0.5, 0.5,
-3.907614, -3.908103, -2, 0, -0.5, 0.5, 0.5,
-3.907614, -3.908103, -2, 1, -0.5, 0.5, 0.5,
-3.907614, -3.908103, -2, 1, 1.5, 0.5, 0.5,
-3.907614, -3.908103, -2, 0, 1.5, 0.5, 0.5,
-3.907614, -3.908103, 0, 0, -0.5, 0.5, 0.5,
-3.907614, -3.908103, 0, 1, -0.5, 0.5, 0.5,
-3.907614, -3.908103, 0, 1, 1.5, 0.5, 0.5,
-3.907614, -3.908103, 0, 0, 1.5, 0.5, 0.5,
-3.907614, -3.908103, 2, 0, -0.5, 0.5, 0.5,
-3.907614, -3.908103, 2, 1, -0.5, 0.5, 0.5,
-3.907614, -3.908103, 2, 1, 1.5, 0.5, 0.5,
-3.907614, -3.908103, 2, 0, 1.5, 0.5, 0.5,
-3.907614, -3.908103, 4, 0, -0.5, 0.5, 0.5,
-3.907614, -3.908103, 4, 1, -0.5, 0.5, 0.5,
-3.907614, -3.908103, 4, 1, 1.5, 0.5, 0.5,
-3.907614, -3.908103, 4, 0, 1.5, 0.5, 0.5
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
-3.39519, -3.409665, -5.389859,
-3.39519, 3.236176, -5.389859,
-3.39519, -3.409665, 5.587702,
-3.39519, 3.236176, 5.587702,
-3.39519, -3.409665, -5.389859,
-3.39519, -3.409665, 5.587702,
-3.39519, 3.236176, -5.389859,
-3.39519, 3.236176, 5.587702,
-3.39519, -3.409665, -5.389859,
3.437132, -3.409665, -5.389859,
-3.39519, -3.409665, 5.587702,
3.437132, -3.409665, 5.587702,
-3.39519, 3.236176, -5.389859,
3.437132, 3.236176, -5.389859,
-3.39519, 3.236176, 5.587702,
3.437132, 3.236176, 5.587702,
3.437132, -3.409665, -5.389859,
3.437132, 3.236176, -5.389859,
3.437132, -3.409665, 5.587702,
3.437132, 3.236176, 5.587702,
3.437132, -3.409665, -5.389859,
3.437132, -3.409665, 5.587702,
3.437132, 3.236176, -5.389859,
3.437132, 3.236176, 5.587702
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
var radius = 7.763032;
var distance = 34.5386;
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
mvMatrix.translate( -0.02097082, 0.08674431, -0.09892154 );
mvMatrix.scale( 1.228505, 1.262977, 0.764609 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.5386);
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
Phenylacetate<-read.table("Phenylacetate.xyz")
```

```
## Error in read.table("Phenylacetate.xyz"): no lines available in input
```

```r
x<-Phenylacetate$V2
```

```
## Error in eval(expr, envir, enclos): object 'Phenylacetate' not found
```

```r
y<-Phenylacetate$V3
```

```
## Error in eval(expr, envir, enclos): object 'Phenylacetate' not found
```

```r
z<-Phenylacetate$V4
```

```
## Error in eval(expr, envir, enclos): object 'Phenylacetate' not found
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
-3.295691, -0.4988269, -1.775727, 0, 0, 1, 1, 1,
-2.829777, 1.615375, 0.450986, 1, 0, 0, 1, 1,
-2.748238, 1.517627, -1.925203, 1, 0, 0, 1, 1,
-2.734091, -1.111961, -0.26149, 1, 0, 0, 1, 1,
-2.627973, -0.2524694, -1.906354, 1, 0, 0, 1, 1,
-2.446151, -0.2449141, -0.8691111, 1, 0, 0, 1, 1,
-2.295255, 0.8319755, -2.518233, 0, 0, 0, 1, 1,
-2.264332, 0.6895209, -2.704617, 0, 0, 0, 1, 1,
-2.218405, -0.2189302, -1.968905, 0, 0, 0, 1, 1,
-2.199912, 0.8523489, 0.4342228, 0, 0, 0, 1, 1,
-2.176461, -1.42075, -2.708584, 0, 0, 0, 1, 1,
-2.1678, 0.006859814, -2.50003, 0, 0, 0, 1, 1,
-2.148387, 0.6968343, -1.422275, 0, 0, 0, 1, 1,
-2.120972, -1.025251, -2.318313, 1, 1, 1, 1, 1,
-2.05851, 0.6974915, -1.671836, 1, 1, 1, 1, 1,
-2.036182, -0.2062285, -2.88248, 1, 1, 1, 1, 1,
-2.025841, 0.1974385, -1.486608, 1, 1, 1, 1, 1,
-2.025366, 0.2259634, -1.049953, 1, 1, 1, 1, 1,
-1.951853, -0.5423753, -1.080555, 1, 1, 1, 1, 1,
-1.951079, 0.4178957, -2.222881, 1, 1, 1, 1, 1,
-1.932109, -1.714962, -1.180233, 1, 1, 1, 1, 1,
-1.927504, -0.7391852, -1.866329, 1, 1, 1, 1, 1,
-1.897949, -1.596278, -3.238778, 1, 1, 1, 1, 1,
-1.877588, -0.3158889, -0.865835, 1, 1, 1, 1, 1,
-1.857795, 1.258928, -1.551952, 1, 1, 1, 1, 1,
-1.836197, -1.399134, -1.15671, 1, 1, 1, 1, 1,
-1.797739, -0.5593857, -0.983979, 1, 1, 1, 1, 1,
-1.792418, -1.167754, -1.913057, 1, 1, 1, 1, 1,
-1.78849, -0.510725, -2.12669, 0, 0, 1, 1, 1,
-1.777974, -0.3545263, -2.922018, 1, 0, 0, 1, 1,
-1.747358, -1.797871, -2.484134, 1, 0, 0, 1, 1,
-1.746207, -1.611664, -2.505381, 1, 0, 0, 1, 1,
-1.743483, -0.5155683, -3.902456, 1, 0, 0, 1, 1,
-1.735187, 0.4331402, -3.111721, 1, 0, 0, 1, 1,
-1.733435, -0.6447731, -2.319952, 0, 0, 0, 1, 1,
-1.724396, 0.6661319, 1.038495, 0, 0, 0, 1, 1,
-1.720997, 0.4988731, -3.241606, 0, 0, 0, 1, 1,
-1.719643, 0.8594341, -1.924407, 0, 0, 0, 1, 1,
-1.719369, -0.5038224, -1.916583, 0, 0, 0, 1, 1,
-1.711235, -1.21168, -2.332425, 0, 0, 0, 1, 1,
-1.709416, 0.06595211, -0.7525519, 0, 0, 0, 1, 1,
-1.708418, -0.2790156, -2.178331, 1, 1, 1, 1, 1,
-1.70052, 0.8694838, -2.501843, 1, 1, 1, 1, 1,
-1.661332, 0.827081, -1.199177, 1, 1, 1, 1, 1,
-1.642798, -0.6122369, -2.026915, 1, 1, 1, 1, 1,
-1.63018, 0.4342079, -1.109579, 1, 1, 1, 1, 1,
-1.625853, -1.116614, -3.00484, 1, 1, 1, 1, 1,
-1.622552, 0.2125239, -1.781246, 1, 1, 1, 1, 1,
-1.619587, -0.1099521, -2.262613, 1, 1, 1, 1, 1,
-1.607034, 0.4150566, 0.190411, 1, 1, 1, 1, 1,
-1.606057, 1.74936, -0.7265382, 1, 1, 1, 1, 1,
-1.605034, -1.552269, -2.827647, 1, 1, 1, 1, 1,
-1.598849, -0.3574229, -1.080516, 1, 1, 1, 1, 1,
-1.588554, 0.5133945, -0.3100756, 1, 1, 1, 1, 1,
-1.580827, -0.8954943, -2.954275, 1, 1, 1, 1, 1,
-1.572228, -0.09436633, -2.206318, 1, 1, 1, 1, 1,
-1.571623, 0.3520981, -1.814503, 0, 0, 1, 1, 1,
-1.570625, -1.680491, -2.145988, 1, 0, 0, 1, 1,
-1.56288, 0.8301018, 0.9276154, 1, 0, 0, 1, 1,
-1.554359, -0.8907574, -1.530213, 1, 0, 0, 1, 1,
-1.553047, 1.523268, -0.6921526, 1, 0, 0, 1, 1,
-1.544976, 0.2166553, 0.4633817, 1, 0, 0, 1, 1,
-1.529225, 1.087058, -1.455614, 0, 0, 0, 1, 1,
-1.521326, 0.5642285, -0.7590783, 0, 0, 0, 1, 1,
-1.517724, 1.515106, -1.811906, 0, 0, 0, 1, 1,
-1.511528, -0.4407582, -2.213215, 0, 0, 0, 1, 1,
-1.509573, 0.7893941, -1.917821, 0, 0, 0, 1, 1,
-1.508667, -0.44425, -0.3142951, 0, 0, 0, 1, 1,
-1.507638, 0.2472509, -1.35357, 0, 0, 0, 1, 1,
-1.4926, 0.8876193, -2.544826, 1, 1, 1, 1, 1,
-1.492147, 0.1881413, -1.135003, 1, 1, 1, 1, 1,
-1.485053, -0.6728572, -2.636345, 1, 1, 1, 1, 1,
-1.480733, 1.62635, -1.030085, 1, 1, 1, 1, 1,
-1.456057, 0.239331, 1.204937, 1, 1, 1, 1, 1,
-1.448024, -0.1347342, -1.274472, 1, 1, 1, 1, 1,
-1.445249, 0.6178403, -1.153879, 1, 1, 1, 1, 1,
-1.436871, -1.17646, -1.031117, 1, 1, 1, 1, 1,
-1.428996, 0.9743223, -0.08466391, 1, 1, 1, 1, 1,
-1.427679, -0.6311315, -1.928874, 1, 1, 1, 1, 1,
-1.425366, 1.53769, -1.817237, 1, 1, 1, 1, 1,
-1.422784, -1.088623, -3.414238, 1, 1, 1, 1, 1,
-1.415679, -1.762587, -1.343729, 1, 1, 1, 1, 1,
-1.403089, -0.6880955, -1.968747, 1, 1, 1, 1, 1,
-1.386569, 0.8267037, -2.549893, 1, 1, 1, 1, 1,
-1.365048, -0.5836559, -0.5755557, 0, 0, 1, 1, 1,
-1.351825, 0.4845113, -0.4833323, 1, 0, 0, 1, 1,
-1.350304, -0.5098256, -2.590852, 1, 0, 0, 1, 1,
-1.346725, 0.7920969, -2.049294, 1, 0, 0, 1, 1,
-1.345154, -1.773201, -1.841313, 1, 0, 0, 1, 1,
-1.34342, 0.3104395, -1.413596, 1, 0, 0, 1, 1,
-1.325984, 0.8235564, -1.595597, 0, 0, 0, 1, 1,
-1.324367, -0.3892428, -0.1688397, 0, 0, 0, 1, 1,
-1.322017, 0.3048719, -1.990345, 0, 0, 0, 1, 1,
-1.319448, -1.053245, -2.715905, 0, 0, 0, 1, 1,
-1.315462, -0.2262999, -2.472101, 0, 0, 0, 1, 1,
-1.313788, -1.154402, -2.283793, 0, 0, 0, 1, 1,
-1.31246, 0.7803832, -0.4030426, 0, 0, 0, 1, 1,
-1.307125, 2.787738, 0.9224093, 1, 1, 1, 1, 1,
-1.298508, -0.6809879, -1.383041, 1, 1, 1, 1, 1,
-1.296612, 0.2600758, -2.06865, 1, 1, 1, 1, 1,
-1.293741, -1.489289, -2.214645, 1, 1, 1, 1, 1,
-1.290519, -1.225774, -2.995426, 1, 1, 1, 1, 1,
-1.280905, 0.8053763, -0.01239939, 1, 1, 1, 1, 1,
-1.278851, 0.05956558, 0.3050131, 1, 1, 1, 1, 1,
-1.277504, 0.01766614, -2.882824, 1, 1, 1, 1, 1,
-1.276796, -0.7365444, -4.626287, 1, 1, 1, 1, 1,
-1.274804, 1.408623, -0.219952, 1, 1, 1, 1, 1,
-1.274612, 0.3429974, -2.149573, 1, 1, 1, 1, 1,
-1.270967, -0.3533789, -2.579122, 1, 1, 1, 1, 1,
-1.266415, 0.4324951, -3.070826, 1, 1, 1, 1, 1,
-1.265147, 1.397973, -0.5639569, 1, 1, 1, 1, 1,
-1.243977, 1.028153, 0.5167181, 1, 1, 1, 1, 1,
-1.243674, 0.2694725, -2.604057, 0, 0, 1, 1, 1,
-1.235261, 0.3548746, -1.646868, 1, 0, 0, 1, 1,
-1.234298, -0.5411087, -1.789154, 1, 0, 0, 1, 1,
-1.230391, 0.03859299, -2.065489, 1, 0, 0, 1, 1,
-1.229256, 1.177782, -0.8094173, 1, 0, 0, 1, 1,
-1.228097, 0.1642952, -2.273633, 1, 0, 0, 1, 1,
-1.22406, -0.8578882, -2.48773, 0, 0, 0, 1, 1,
-1.214381, 2.127613, 0.3509634, 0, 0, 0, 1, 1,
-1.211629, -0.2996948, 0.2315128, 0, 0, 0, 1, 1,
-1.208769, -0.6354705, -3.560825, 0, 0, 0, 1, 1,
-1.193211, -1.19435, -2.74824, 0, 0, 0, 1, 1,
-1.176763, 0.08737227, -1.943097, 0, 0, 0, 1, 1,
-1.16303, 0.2448604, -1.363727, 0, 0, 0, 1, 1,
-1.16129, 0.4878018, -0.6022301, 1, 1, 1, 1, 1,
-1.161114, -0.06944307, -1.475669, 1, 1, 1, 1, 1,
-1.146839, 2.449813, 0.5460789, 1, 1, 1, 1, 1,
-1.14448, -0.9398522, -1.305134, 1, 1, 1, 1, 1,
-1.140826, -0.4498537, -1.172386, 1, 1, 1, 1, 1,
-1.13918, 0.5164939, -0.7769757, 1, 1, 1, 1, 1,
-1.135572, -1.823066, -2.882159, 1, 1, 1, 1, 1,
-1.125592, 0.8423105, -0.8808639, 1, 1, 1, 1, 1,
-1.123905, -0.4124065, -1.648063, 1, 1, 1, 1, 1,
-1.122518, 0.3597739, -0.9206423, 1, 1, 1, 1, 1,
-1.119099, -1.308617, -3.539407, 1, 1, 1, 1, 1,
-1.114317, -0.5459371, -1.455115, 1, 1, 1, 1, 1,
-1.11182, -0.8475045, -4.935136, 1, 1, 1, 1, 1,
-1.109789, 0.4111058, -2.5595, 1, 1, 1, 1, 1,
-1.106873, -0.6305839, -3.11996, 1, 1, 1, 1, 1,
-1.10624, 0.2689103, -0.4787142, 0, 0, 1, 1, 1,
-1.095926, -0.1734139, -1.992425, 1, 0, 0, 1, 1,
-1.094267, 0.8167862, -1.846207, 1, 0, 0, 1, 1,
-1.090119, -0.6626746, -1.509297, 1, 0, 0, 1, 1,
-1.087379, -2.237731, -1.196106, 1, 0, 0, 1, 1,
-1.08634, 0.7267795, 0.793933, 1, 0, 0, 1, 1,
-1.083331, 0.1490314, 0.7562346, 0, 0, 0, 1, 1,
-1.08215, 0.4047822, -0.469109, 0, 0, 0, 1, 1,
-1.078846, 0.4093499, -2.845694, 0, 0, 0, 1, 1,
-1.067878, -1.637452, -3.809561, 0, 0, 0, 1, 1,
-1.065938, 0.1339057, 0.3073253, 0, 0, 0, 1, 1,
-1.063501, -0.4176317, -0.5545201, 0, 0, 0, 1, 1,
-1.058931, -0.2686549, -1.593256, 0, 0, 0, 1, 1,
-1.05784, -1.123197, -1.661329, 1, 1, 1, 1, 1,
-1.057419, 0.1312109, -1.063308, 1, 1, 1, 1, 1,
-1.05636, 2.368952, -0.7484118, 1, 1, 1, 1, 1,
-1.048071, -1.359238, -3.728156, 1, 1, 1, 1, 1,
-1.045973, -0.4006647, -0.9681237, 1, 1, 1, 1, 1,
-1.039594, 1.67025, -0.4631069, 1, 1, 1, 1, 1,
-1.038415, -1.317977, -3.453502, 1, 1, 1, 1, 1,
-1.02929, -0.6788499, -4.057209, 1, 1, 1, 1, 1,
-1.026991, 0.3278157, -1.578467, 1, 1, 1, 1, 1,
-1.022142, 0.2305565, -0.3383331, 1, 1, 1, 1, 1,
-1.020318, -2.815278, -1.628742, 1, 1, 1, 1, 1,
-1.014594, 0.6804432, -1.271359, 1, 1, 1, 1, 1,
-1.01253, 0.6303467, -1.020866, 1, 1, 1, 1, 1,
-1.012286, -0.5231861, -1.361858, 1, 1, 1, 1, 1,
-1.007459, -0.529754, -1.796199, 1, 1, 1, 1, 1,
-0.9955021, -2.142329, -1.854831, 0, 0, 1, 1, 1,
-0.9903256, 0.7218522, -1.960309, 1, 0, 0, 1, 1,
-0.988213, 0.9755806, -0.06709399, 1, 0, 0, 1, 1,
-0.9851021, 1.3222, -2.637476, 1, 0, 0, 1, 1,
-0.9746487, -1.068627, -2.077886, 1, 0, 0, 1, 1,
-0.9698177, -0.07555312, -1.661337, 1, 0, 0, 1, 1,
-0.9694245, -1.012812, -1.027642, 0, 0, 0, 1, 1,
-0.9636617, -0.4980545, -2.811953, 0, 0, 0, 1, 1,
-0.9615269, -0.09098975, -0.4963384, 0, 0, 0, 1, 1,
-0.957554, 1.757037, -0.9906152, 0, 0, 0, 1, 1,
-0.952765, -0.1085277, -0.5566896, 0, 0, 0, 1, 1,
-0.9466532, 2.117041, -0.9430781, 0, 0, 0, 1, 1,
-0.9446777, 0.8434736, 0.5929415, 0, 0, 0, 1, 1,
-0.9441648, 1.540535, -0.2244406, 1, 1, 1, 1, 1,
-0.9361411, -2.064848, -3.552451, 1, 1, 1, 1, 1,
-0.9337781, -0.5087005, -1.813027, 1, 1, 1, 1, 1,
-0.9321794, 0.5755479, -1.581668, 1, 1, 1, 1, 1,
-0.9320067, 0.517049, -1.34101, 1, 1, 1, 1, 1,
-0.9303569, -1.12616, -1.754539, 1, 1, 1, 1, 1,
-0.9266618, 0.02427995, -2.07193, 1, 1, 1, 1, 1,
-0.9234812, 0.8077609, -0.508155, 1, 1, 1, 1, 1,
-0.9223375, -0.9143836, -2.509207, 1, 1, 1, 1, 1,
-0.9209691, -1.049855, -2.923425, 1, 1, 1, 1, 1,
-0.9152181, -0.4807953, -2.732946, 1, 1, 1, 1, 1,
-0.9124497, -0.2450134, -2.054124, 1, 1, 1, 1, 1,
-0.9056938, -0.9061266, -2.687413, 1, 1, 1, 1, 1,
-0.8907899, -1.349582, -1.548085, 1, 1, 1, 1, 1,
-0.8843805, -0.5208182, -0.9094015, 1, 1, 1, 1, 1,
-0.8675783, -0.4072039, -0.8729303, 0, 0, 1, 1, 1,
-0.8630388, 0.5858868, -2.970714, 1, 0, 0, 1, 1,
-0.859984, -0.4109967, -2.287634, 1, 0, 0, 1, 1,
-0.8569589, -0.0986887, -1.455409, 1, 0, 0, 1, 1,
-0.8565335, 0.5575102, -0.1599436, 1, 0, 0, 1, 1,
-0.8527074, 0.4330427, -0.4476431, 1, 0, 0, 1, 1,
-0.8448753, 1.536365, -1.270686, 0, 0, 0, 1, 1,
-0.8424298, -1.628996, -2.140978, 0, 0, 0, 1, 1,
-0.8416354, 1.128715, -0.5708078, 0, 0, 0, 1, 1,
-0.8357849, 0.2545418, -1.913812, 0, 0, 0, 1, 1,
-0.8308589, 0.1975664, -3.461778, 0, 0, 0, 1, 1,
-0.8283203, -0.09499066, -2.834397, 0, 0, 0, 1, 1,
-0.8240824, -0.2001036, -2.256495, 0, 0, 0, 1, 1,
-0.8219521, -2.065857, -2.437059, 1, 1, 1, 1, 1,
-0.8106849, -0.5189492, -0.6142295, 1, 1, 1, 1, 1,
-0.8050067, 0.4723541, -1.900758, 1, 1, 1, 1, 1,
-0.8044115, -0.3267885, -2.001197, 1, 1, 1, 1, 1,
-0.7970833, -1.489716, -3.263366, 1, 1, 1, 1, 1,
-0.793906, 1.250254, 0.623655, 1, 1, 1, 1, 1,
-0.7924728, 1.0742, -1.364203, 1, 1, 1, 1, 1,
-0.7772341, 0.9129099, -1.072116, 1, 1, 1, 1, 1,
-0.7705365, -0.03724733, -1.793329, 1, 1, 1, 1, 1,
-0.7695328, -1.01281, -3.606276, 1, 1, 1, 1, 1,
-0.7687537, -0.1075678, -1.512168, 1, 1, 1, 1, 1,
-0.7605105, 0.08905631, -3.285643, 1, 1, 1, 1, 1,
-0.7590603, -0.9806828, -3.210536, 1, 1, 1, 1, 1,
-0.7484475, -0.4803516, -1.460841, 1, 1, 1, 1, 1,
-0.7468061, 0.328335, -1.545214, 1, 1, 1, 1, 1,
-0.7459943, -1.11045, -3.030439, 0, 0, 1, 1, 1,
-0.739987, -0.9599411, -3.140344, 1, 0, 0, 1, 1,
-0.7297028, -1.018174, -3.477235, 1, 0, 0, 1, 1,
-0.72714, -0.5465401, -2.868575, 1, 0, 0, 1, 1,
-0.7270045, -1.441823, -0.4012637, 1, 0, 0, 1, 1,
-0.7201205, 1.459356, -1.579221, 1, 0, 0, 1, 1,
-0.7181107, -0.2623546, -0.8698801, 0, 0, 0, 1, 1,
-0.7136618, 0.8282042, -1.763603, 0, 0, 0, 1, 1,
-0.7083498, 1.10839, -1.406752, 0, 0, 0, 1, 1,
-0.7063985, 0.9463044, -0.3994906, 0, 0, 0, 1, 1,
-0.7002777, 1.442136, -2.346137, 0, 0, 0, 1, 1,
-0.6946715, 2.827741, -0.04187758, 0, 0, 0, 1, 1,
-0.6940964, 0.7673318, -0.8705712, 0, 0, 0, 1, 1,
-0.6920398, 0.8571706, -0.2501381, 1, 1, 1, 1, 1,
-0.6778854, -1.6112, -3.155359, 1, 1, 1, 1, 1,
-0.6769968, -0.7061972, -3.216612, 1, 1, 1, 1, 1,
-0.6749848, -1.824877, -3.199428, 1, 1, 1, 1, 1,
-0.6671435, -0.7629917, -3.673991, 1, 1, 1, 1, 1,
-0.6663345, 0.4582672, -1.785588, 1, 1, 1, 1, 1,
-0.6609578, 0.1401401, -2.308365, 1, 1, 1, 1, 1,
-0.6588603, 0.7991425, -1.143772, 1, 1, 1, 1, 1,
-0.6580595, -0.471813, -3.041642, 1, 1, 1, 1, 1,
-0.654126, -0.1285308, -1.605056, 1, 1, 1, 1, 1,
-0.6490302, 1.649683, 1.203601, 1, 1, 1, 1, 1,
-0.6489062, 0.06043727, -2.118599, 1, 1, 1, 1, 1,
-0.6473859, -0.1527361, -1.358067, 1, 1, 1, 1, 1,
-0.6472874, -1.499616, -2.67455, 1, 1, 1, 1, 1,
-0.6433004, -0.4009606, -0.4476742, 1, 1, 1, 1, 1,
-0.6374568, 0.8469153, -0.115265, 0, 0, 1, 1, 1,
-0.6257886, 3.139392, -0.4663316, 1, 0, 0, 1, 1,
-0.6252277, 0.2505912, -1.911802, 1, 0, 0, 1, 1,
-0.6231075, -1.664518, -2.384221, 1, 0, 0, 1, 1,
-0.6218899, -1.528206, -1.479467, 1, 0, 0, 1, 1,
-0.6146228, 0.4769371, -0.9084103, 1, 0, 0, 1, 1,
-0.606087, -1.081081, -1.7688, 0, 0, 0, 1, 1,
-0.6028689, 1.531402, -1.666003, 0, 0, 0, 1, 1,
-0.6010246, 0.2937661, -1.324069, 0, 0, 0, 1, 1,
-0.5981852, -0.3728157, -0.768243, 0, 0, 0, 1, 1,
-0.5968037, 0.3495606, -1.26916, 0, 0, 0, 1, 1,
-0.5951822, 1.186747, -0.03789885, 0, 0, 0, 1, 1,
-0.5947679, -0.124102, -1.405384, 0, 0, 0, 1, 1,
-0.5926853, 0.07931183, -1.195156, 1, 1, 1, 1, 1,
-0.589833, 0.1982265, -0.5395479, 1, 1, 1, 1, 1,
-0.5896268, 1.271873, -0.3051886, 1, 1, 1, 1, 1,
-0.5849914, -0.5217363, -3.408595, 1, 1, 1, 1, 1,
-0.5823583, 0.6882812, -1.229243, 1, 1, 1, 1, 1,
-0.5816825, -0.7471979, -1.902493, 1, 1, 1, 1, 1,
-0.5812477, 0.5232986, 0.02156592, 1, 1, 1, 1, 1,
-0.5782951, -0.9519232, -3.14415, 1, 1, 1, 1, 1,
-0.5750741, 0.7055406, -2.719903, 1, 1, 1, 1, 1,
-0.574326, 1.706875, 0.2706121, 1, 1, 1, 1, 1,
-0.570905, 0.3810446, -1.600306, 1, 1, 1, 1, 1,
-0.5689125, 0.08009276, -2.128922, 1, 1, 1, 1, 1,
-0.568418, 1.512669, -0.0833851, 1, 1, 1, 1, 1,
-0.5641601, -1.104139, -2.410222, 1, 1, 1, 1, 1,
-0.5630557, -0.6890157, -1.675633, 1, 1, 1, 1, 1,
-0.557959, 1.298442, -0.3085515, 0, 0, 1, 1, 1,
-0.55664, 0.7616196, -0.7567873, 1, 0, 0, 1, 1,
-0.550446, -0.9951923, -1.786982, 1, 0, 0, 1, 1,
-0.5501271, 0.5208878, -1.214945, 1, 0, 0, 1, 1,
-0.5477488, 0.7902269, 0.7572475, 1, 0, 0, 1, 1,
-0.5452448, 3.000721, 0.2900268, 1, 0, 0, 1, 1,
-0.5425015, 0.05446339, -0.6136782, 0, 0, 0, 1, 1,
-0.5406873, 0.5078734, -0.6268311, 0, 0, 0, 1, 1,
-0.5380363, 0.9700055, -0.1427006, 0, 0, 0, 1, 1,
-0.537662, -0.3685637, -1.510396, 0, 0, 0, 1, 1,
-0.5324661, 1.849668, -0.4109112, 0, 0, 0, 1, 1,
-0.5319899, -1.856327, -2.488662, 0, 0, 0, 1, 1,
-0.531229, 1.38032, -0.5368698, 0, 0, 0, 1, 1,
-0.5296755, -0.5982527, -3.331314, 1, 1, 1, 1, 1,
-0.5293283, 1.212331, -0.1157746, 1, 1, 1, 1, 1,
-0.5288612, 0.4362441, -0.1552763, 1, 1, 1, 1, 1,
-0.5280088, 0.1784565, -2.083066, 1, 1, 1, 1, 1,
-0.5176029, -0.5106233, -2.263067, 1, 1, 1, 1, 1,
-0.5174533, -0.7556282, -2.105997, 1, 1, 1, 1, 1,
-0.5174249, 0.9794058, -1.205865, 1, 1, 1, 1, 1,
-0.5168057, 0.4883651, -0.4965325, 1, 1, 1, 1, 1,
-0.5141685, -0.6337541, -0.9844071, 1, 1, 1, 1, 1,
-0.5133771, 0.5617455, -1.726496, 1, 1, 1, 1, 1,
-0.5126487, 1.294132, -0.1388882, 1, 1, 1, 1, 1,
-0.5105742, -1.009487, -1.855133, 1, 1, 1, 1, 1,
-0.5075902, -1.030865, -1.901726, 1, 1, 1, 1, 1,
-0.5036718, 2.047802, -1.407832, 1, 1, 1, 1, 1,
-0.5034599, -2.184668, -1.715371, 1, 1, 1, 1, 1,
-0.5009308, 0.3134138, -0.3237838, 0, 0, 1, 1, 1,
-0.4918716, 0.1700083, -3.423373, 1, 0, 0, 1, 1,
-0.4893564, -0.6454661, -2.410973, 1, 0, 0, 1, 1,
-0.488541, -0.0745114, -1.796415, 1, 0, 0, 1, 1,
-0.4860908, 1.43817, 0.6146818, 1, 0, 0, 1, 1,
-0.4835402, -0.4841528, -2.570605, 1, 0, 0, 1, 1,
-0.4822153, 1.755956, -1.354899, 0, 0, 0, 1, 1,
-0.468778, -0.2391723, -1.227033, 0, 0, 0, 1, 1,
-0.464863, 0.3627164, -1.632353, 0, 0, 0, 1, 1,
-0.4630723, -0.4122669, -1.553381, 0, 0, 0, 1, 1,
-0.4616778, -0.8764747, -2.538974, 0, 0, 0, 1, 1,
-0.4601565, 1.669439, -1.838917, 0, 0, 0, 1, 1,
-0.4567615, 1.410887, -1.219939, 0, 0, 0, 1, 1,
-0.4549981, -2.145673, -4.644406, 1, 1, 1, 1, 1,
-0.4516052, -0.4680403, -2.789068, 1, 1, 1, 1, 1,
-0.4503021, 1.511112, -0.07546271, 1, 1, 1, 1, 1,
-0.4479219, -0.4092795, -1.540075, 1, 1, 1, 1, 1,
-0.4443254, -1.284719, -2.590512, 1, 1, 1, 1, 1,
-0.4433943, -1.945181, -2.933059, 1, 1, 1, 1, 1,
-0.4407603, -0.7039807, -2.19415, 1, 1, 1, 1, 1,
-0.4384915, -0.1978753, -1.317184, 1, 1, 1, 1, 1,
-0.4381414, 0.8579307, -0.9235789, 1, 1, 1, 1, 1,
-0.4378038, 0.4568877, 0.00946913, 1, 1, 1, 1, 1,
-0.437358, -3.312881, -2.687129, 1, 1, 1, 1, 1,
-0.4351115, 0.2326505, -1.651711, 1, 1, 1, 1, 1,
-0.4310418, 0.4714914, -0.6787593, 1, 1, 1, 1, 1,
-0.4276303, -0.2982187, -2.419972, 1, 1, 1, 1, 1,
-0.4227594, -1.493238, -2.553515, 1, 1, 1, 1, 1,
-0.4209622, -1.620125, -2.535642, 0, 0, 1, 1, 1,
-0.4200083, -0.5742142, -2.047819, 1, 0, 0, 1, 1,
-0.4182082, 0.3810576, -0.7144905, 1, 0, 0, 1, 1,
-0.4181781, 0.7017729, -0.2156094, 1, 0, 0, 1, 1,
-0.4169606, -0.01796789, -2.082033, 1, 0, 0, 1, 1,
-0.415553, 1.958924, 0.2657132, 1, 0, 0, 1, 1,
-0.4128544, -0.5860834, -3.826875, 0, 0, 0, 1, 1,
-0.4121709, 0.04002509, -2.069458, 0, 0, 0, 1, 1,
-0.4056332, -0.2871959, -3.428878, 0, 0, 0, 1, 1,
-0.4045474, 0.09260261, -1.48067, 0, 0, 0, 1, 1,
-0.4036771, 1.335082, -0.1088395, 0, 0, 0, 1, 1,
-0.4036639, 0.6099008, -0.5036688, 0, 0, 0, 1, 1,
-0.3938377, -1.091006, -1.464581, 0, 0, 0, 1, 1,
-0.3936208, 0.1461342, -2.688701, 1, 1, 1, 1, 1,
-0.3920135, 2.531592, 0.02491153, 1, 1, 1, 1, 1,
-0.3914187, 0.05943977, 0.5209001, 1, 1, 1, 1, 1,
-0.3843878, 0.04856828, -1.952889, 1, 1, 1, 1, 1,
-0.3783067, 0.8547484, 0.7616044, 1, 1, 1, 1, 1,
-0.3749591, 0.9083066, -1.039182, 1, 1, 1, 1, 1,
-0.3721734, 1.912824, -0.7707729, 1, 1, 1, 1, 1,
-0.3705909, -0.02936827, -2.3146, 1, 1, 1, 1, 1,
-0.3664139, -1.263049, -1.469881, 1, 1, 1, 1, 1,
-0.3625901, -0.502597, -1.705342, 1, 1, 1, 1, 1,
-0.3589149, 0.7421797, -0.429588, 1, 1, 1, 1, 1,
-0.3587443, 0.1683082, -1.312399, 1, 1, 1, 1, 1,
-0.3585947, 1.437413, 0.1168112, 1, 1, 1, 1, 1,
-0.3585092, -1.100589, -2.64916, 1, 1, 1, 1, 1,
-0.3560119, 1.104381, -1.286868, 1, 1, 1, 1, 1,
-0.3550708, 0.1704002, -1.303212, 0, 0, 1, 1, 1,
-0.3488747, -0.05961673, -0.9171562, 1, 0, 0, 1, 1,
-0.3476432, 2.738513, -1.291702, 1, 0, 0, 1, 1,
-0.3451846, 0.1307147, -0.684302, 1, 0, 0, 1, 1,
-0.3408374, 0.348673, -0.3028098, 1, 0, 0, 1, 1,
-0.337715, -1.661712, -3.299443, 1, 0, 0, 1, 1,
-0.3338877, -1.708476, -2.065006, 0, 0, 0, 1, 1,
-0.3300537, 1.988487, -2.06353, 0, 0, 0, 1, 1,
-0.3182939, -0.5474654, -1.76268, 0, 0, 0, 1, 1,
-0.3181972, 0.07084814, -1.506006, 0, 0, 0, 1, 1,
-0.3175522, -0.2168192, -3.120973, 0, 0, 0, 1, 1,
-0.3174516, -0.6999315, -3.939992, 0, 0, 0, 1, 1,
-0.3154358, -0.2493072, -2.130023, 0, 0, 0, 1, 1,
-0.3053483, -0.3074252, -3.99339, 1, 1, 1, 1, 1,
-0.2997363, -1.191428, -1.927049, 1, 1, 1, 1, 1,
-0.2962641, 1.052134, -0.1307432, 1, 1, 1, 1, 1,
-0.2947898, 1.019067, -0.8584642, 1, 1, 1, 1, 1,
-0.2861924, -0.1166884, -0.5424348, 1, 1, 1, 1, 1,
-0.2795827, -1.113808, -3.057816, 1, 1, 1, 1, 1,
-0.2763404, 0.09238636, 0.4344153, 1, 1, 1, 1, 1,
-0.2744093, 0.9709437, -0.1093445, 1, 1, 1, 1, 1,
-0.2726265, 0.4913931, -0.0379432, 1, 1, 1, 1, 1,
-0.2692907, -1.704132, -0.6574295, 1, 1, 1, 1, 1,
-0.2686398, 1.539483, -0.01424307, 1, 1, 1, 1, 1,
-0.267055, -0.9884609, -3.32987, 1, 1, 1, 1, 1,
-0.2670308, -0.920443, -3.221528, 1, 1, 1, 1, 1,
-0.2660766, 1.76716, -0.1831635, 1, 1, 1, 1, 1,
-0.2660476, -0.5073818, -2.878181, 1, 1, 1, 1, 1,
-0.264475, -1.096819, -2.882164, 0, 0, 1, 1, 1,
-0.2611614, -0.7024239, -2.251723, 1, 0, 0, 1, 1,
-0.2563331, 1.084043, 0.1410226, 1, 0, 0, 1, 1,
-0.2543693, 0.1890171, -0.6549584, 1, 0, 0, 1, 1,
-0.2542188, -0.3991213, -2.652326, 1, 0, 0, 1, 1,
-0.252077, 0.8853376, 0.5220106, 1, 0, 0, 1, 1,
-0.2490648, -0.759957, -2.268287, 0, 0, 0, 1, 1,
-0.2468309, 1.055024, -0.210252, 0, 0, 0, 1, 1,
-0.2400805, -1.616639, -1.708722, 0, 0, 0, 1, 1,
-0.235799, -0.418711, -3.38518, 0, 0, 0, 1, 1,
-0.2339617, 0.8307418, 0.3437107, 0, 0, 0, 1, 1,
-0.2333681, -0.7907852, -2.12456, 0, 0, 0, 1, 1,
-0.2326604, -1.243948, -4.658622, 0, 0, 0, 1, 1,
-0.231943, 0.20347, -0.6034647, 1, 1, 1, 1, 1,
-0.2302484, -2.424036, -2.374024, 1, 1, 1, 1, 1,
-0.2289414, 0.5145369, -0.449825, 1, 1, 1, 1, 1,
-0.2180292, -1.295523, -4.634548, 1, 1, 1, 1, 1,
-0.2121372, 2.105247, -0.4947422, 1, 1, 1, 1, 1,
-0.2076444, 1.279488, -2.070938, 1, 1, 1, 1, 1,
-0.2027934, 0.5487013, -1.253844, 1, 1, 1, 1, 1,
-0.2027707, -0.2462195, -1.389769, 1, 1, 1, 1, 1,
-0.2015697, -0.02863998, -2.905769, 1, 1, 1, 1, 1,
-0.2013736, 0.8959458, -2.053639, 1, 1, 1, 1, 1,
-0.2013128, 0.3209406, -0.2901565, 1, 1, 1, 1, 1,
-0.1997294, 0.3056819, -0.6850545, 1, 1, 1, 1, 1,
-0.1994789, -0.3081498, -1.153191, 1, 1, 1, 1, 1,
-0.1990124, -0.8324527, -1.876703, 1, 1, 1, 1, 1,
-0.1982247, -0.2994863, -1.679366, 1, 1, 1, 1, 1,
-0.1968447, 0.1197862, -3.669143, 0, 0, 1, 1, 1,
-0.1962007, 0.5924172, -0.4932486, 1, 0, 0, 1, 1,
-0.1862065, -0.7312915, -2.036701, 1, 0, 0, 1, 1,
-0.1814695, -2.279085, -2.878239, 1, 0, 0, 1, 1,
-0.1801896, -0.4286901, -2.75196, 1, 0, 0, 1, 1,
-0.1789966, -0.4597724, -1.110425, 1, 0, 0, 1, 1,
-0.1743311, 0.1462641, -1.868735, 0, 0, 0, 1, 1,
-0.1703061, -1.160497, -1.187353, 0, 0, 0, 1, 1,
-0.1680928, -2.105365, -4.040987, 0, 0, 0, 1, 1,
-0.162005, -0.2275464, -0.884599, 0, 0, 0, 1, 1,
-0.160531, 0.2732229, -1.298383, 0, 0, 0, 1, 1,
-0.1591975, -0.3725269, -2.736586, 0, 0, 0, 1, 1,
-0.1574319, 0.3817152, -0.6953017, 0, 0, 0, 1, 1,
-0.1532435, -0.07076196, -1.812891, 1, 1, 1, 1, 1,
-0.1512749, 0.06254608, -0.09143922, 1, 1, 1, 1, 1,
-0.1489117, 2.077943, 2.46926, 1, 1, 1, 1, 1,
-0.1410822, -0.002078146, -0.3690813, 1, 1, 1, 1, 1,
-0.1406139, -0.488036, -2.205625, 1, 1, 1, 1, 1,
-0.1334319, 0.7627391, 2.164869, 1, 1, 1, 1, 1,
-0.1321306, 0.8012093, -1.727001, 1, 1, 1, 1, 1,
-0.1245891, 1.346599, 0.1845807, 1, 1, 1, 1, 1,
-0.1227604, -1.004251, -3.513623, 1, 1, 1, 1, 1,
-0.114791, -0.9698012, -3.283118, 1, 1, 1, 1, 1,
-0.1127498, -1.106853, -4.91831, 1, 1, 1, 1, 1,
-0.1114089, -2.924126, -3.881223, 1, 1, 1, 1, 1,
-0.1081368, 0.3682753, 1.350423, 1, 1, 1, 1, 1,
-0.1074913, 0.8026686, -0.8691041, 1, 1, 1, 1, 1,
-0.1058536, 0.4390984, -0.8997819, 1, 1, 1, 1, 1,
-0.0998417, -0.714155, -2.323521, 0, 0, 1, 1, 1,
-0.09671883, 0.5670317, 0.5407551, 1, 0, 0, 1, 1,
-0.08904169, -0.9154155, -2.099686, 1, 0, 0, 1, 1,
-0.08379322, -1.320735, -1.64269, 1, 0, 0, 1, 1,
-0.08248185, 0.5194013, -0.07766651, 1, 0, 0, 1, 1,
-0.08247116, -0.9623421, -3.999188, 1, 0, 0, 1, 1,
-0.07025334, -0.007652387, -1.865863, 0, 0, 0, 1, 1,
-0.06779847, 0.2333583, -1.333193, 0, 0, 0, 1, 1,
-0.06420714, -0.6175887, -4.59869, 0, 0, 0, 1, 1,
-0.06177855, -0.5527862, -3.196956, 0, 0, 0, 1, 1,
-0.05991056, -1.067903, -3.422293, 0, 0, 0, 1, 1,
-0.05960348, 0.1670086, 0.3336997, 0, 0, 0, 1, 1,
-0.05937253, -0.1134963, -4.554396, 0, 0, 0, 1, 1,
-0.05699044, 0.7995154, -0.5160733, 1, 1, 1, 1, 1,
-0.05386095, -0.2834538, -3.399044, 1, 1, 1, 1, 1,
-0.05269188, -1.669418, -3.427423, 1, 1, 1, 1, 1,
-0.05228106, 0.7256551, 0.4363852, 1, 1, 1, 1, 1,
-0.05159575, 1.205148, 0.1443265, 1, 1, 1, 1, 1,
-0.0508032, 0.4514982, -0.7474542, 1, 1, 1, 1, 1,
-0.04697495, 0.008134616, -2.984935, 1, 1, 1, 1, 1,
-0.04694413, -1.040705, -3.873015, 1, 1, 1, 1, 1,
-0.04509366, -0.4712207, -4.084868, 1, 1, 1, 1, 1,
-0.04237928, 0.6757047, 0.3111256, 1, 1, 1, 1, 1,
-0.03634557, 0.0400731, -0.9217363, 1, 1, 1, 1, 1,
-0.03509777, 0.5375114, -2.460013, 1, 1, 1, 1, 1,
-0.03419927, 0.1464993, -0.1657298, 1, 1, 1, 1, 1,
-0.03382792, 1.061885, -0.2285545, 1, 1, 1, 1, 1,
-0.02950432, 1.372485, -0.246281, 1, 1, 1, 1, 1,
-0.02909246, -0.6815748, -1.897232, 0, 0, 1, 1, 1,
-0.0286697, -0.8445369, -4.638079, 1, 0, 0, 1, 1,
-0.02825598, -0.873268, -4.012714, 1, 0, 0, 1, 1,
-0.02546795, 0.08944526, 0.5879464, 1, 0, 0, 1, 1,
-0.02162825, 0.5198904, 0.9284987, 1, 0, 0, 1, 1,
-0.01728913, 0.2960144, -1.205996, 1, 0, 0, 1, 1,
-0.0160765, -0.7236057, -3.567955, 0, 0, 0, 1, 1,
-0.01565818, -0.565729, -2.44377, 0, 0, 0, 1, 1,
-0.01269707, 0.4018259, 0.755909, 0, 0, 0, 1, 1,
-0.009319736, -0.5695639, -3.319846, 0, 0, 0, 1, 1,
-0.008469699, -0.6849197, -3.947544, 0, 0, 0, 1, 1,
-0.007552335, -1.661945, -5.229991, 0, 0, 0, 1, 1,
-0.001097018, 1.301314, -1.142951, 0, 0, 0, 1, 1,
0.002538885, -2.529018, 4.483153, 1, 1, 1, 1, 1,
0.007549398, -0.9139466, 3.02669, 1, 1, 1, 1, 1,
0.007772648, 0.009596824, 1.783837, 1, 1, 1, 1, 1,
0.00964951, -0.7327722, 1.434396, 1, 1, 1, 1, 1,
0.01108548, -0.3059048, 3.251042, 1, 1, 1, 1, 1,
0.01786779, 1.173787, -0.7732795, 1, 1, 1, 1, 1,
0.0190134, 0.9229555, -0.95709, 1, 1, 1, 1, 1,
0.01942404, 0.04429962, -0.2042259, 1, 1, 1, 1, 1,
0.02572468, -1.615382, 3.867082, 1, 1, 1, 1, 1,
0.02703722, 0.5491989, -0.4551306, 1, 1, 1, 1, 1,
0.02858421, 1.224747, -0.2523147, 1, 1, 1, 1, 1,
0.03301079, 0.0810548, 0.08494229, 1, 1, 1, 1, 1,
0.03482567, -1.152972, 3.298979, 1, 1, 1, 1, 1,
0.03658886, -0.8370057, 5.427835, 1, 1, 1, 1, 1,
0.04162901, 0.730035, -0.5082285, 1, 1, 1, 1, 1,
0.04467588, -0.6506675, 3.71166, 0, 0, 1, 1, 1,
0.04527869, 0.3360131, -0.2204622, 1, 0, 0, 1, 1,
0.05603296, 0.8971134, -0.3857564, 1, 0, 0, 1, 1,
0.05944072, -0.2802825, 2.948481, 1, 0, 0, 1, 1,
0.05947625, 0.3749127, 0.720341, 1, 0, 0, 1, 1,
0.06028476, -0.1943295, 2.460061, 1, 0, 0, 1, 1,
0.06256798, 1.64938, 0.5996374, 0, 0, 0, 1, 1,
0.06563802, 0.3573435, 0.8214766, 0, 0, 0, 1, 1,
0.06970035, -0.152872, 4.458739, 0, 0, 0, 1, 1,
0.07004743, -0.687564, 2.534402, 0, 0, 0, 1, 1,
0.07081429, -0.6191607, 4.219961, 0, 0, 0, 1, 1,
0.07186132, -0.8726471, 2.996167, 0, 0, 0, 1, 1,
0.07190316, 1.158012, 0.034437, 0, 0, 0, 1, 1,
0.07216359, -0.6553475, 2.849771, 1, 1, 1, 1, 1,
0.07277846, 0.3383223, 1.739213, 1, 1, 1, 1, 1,
0.07566986, 0.5170571, 0.9770699, 1, 1, 1, 1, 1,
0.07907961, 0.2495887, -0.5073794, 1, 1, 1, 1, 1,
0.07932474, 0.6295516, -1.053336, 1, 1, 1, 1, 1,
0.083617, 0.7894168, -0.9083581, 1, 1, 1, 1, 1,
0.08871508, 0.01382381, 2.290941, 1, 1, 1, 1, 1,
0.09229559, 0.01367585, 1.884646, 1, 1, 1, 1, 1,
0.09240693, 0.973525, -0.7577559, 1, 1, 1, 1, 1,
0.0928693, -0.2608609, 1.389093, 1, 1, 1, 1, 1,
0.09599704, -0.09813418, 3.715502, 1, 1, 1, 1, 1,
0.09701524, 0.2011844, 2.646567, 1, 1, 1, 1, 1,
0.09877555, -0.09536146, 2.367857, 1, 1, 1, 1, 1,
0.1006763, 0.122375, -0.1229699, 1, 1, 1, 1, 1,
0.1077271, -0.3616418, 1.863061, 1, 1, 1, 1, 1,
0.109876, 0.8346685, -0.1337924, 0, 0, 1, 1, 1,
0.1129692, 1.526273, -0.8908089, 1, 0, 0, 1, 1,
0.1132099, 0.2567947, -0.5801733, 1, 0, 0, 1, 1,
0.1138722, -1.194163, 3.041463, 1, 0, 0, 1, 1,
0.1142363, -0.1185981, 2.775298, 1, 0, 0, 1, 1,
0.1186102, 0.881898, -0.07284709, 1, 0, 0, 1, 1,
0.1188318, 0.9368936, -0.2539791, 0, 0, 0, 1, 1,
0.1194028, 1.045836, -0.2622049, 0, 0, 0, 1, 1,
0.120725, -0.6705666, 2.609126, 0, 0, 0, 1, 1,
0.1217632, -0.4296776, 3.899972, 0, 0, 0, 1, 1,
0.1232481, -0.1200199, 2.152434, 0, 0, 0, 1, 1,
0.1313484, 1.614926, -0.2675441, 0, 0, 0, 1, 1,
0.1333144, -1.432469, 1.415191, 0, 0, 0, 1, 1,
0.1349331, -1.604933, 4.548164, 1, 1, 1, 1, 1,
0.135424, -0.8266962, 2.658425, 1, 1, 1, 1, 1,
0.1455014, -0.3105976, 3.233675, 1, 1, 1, 1, 1,
0.1472086, -0.1576278, 1.899111, 1, 1, 1, 1, 1,
0.1491593, 1.919687, -0.09527005, 1, 1, 1, 1, 1,
0.1528851, -0.06383972, 2.53061, 1, 1, 1, 1, 1,
0.159616, 0.1060926, 0.901255, 1, 1, 1, 1, 1,
0.1643423, 0.6394113, 0.3693223, 1, 1, 1, 1, 1,
0.1675398, -0.8049922, 2.565646, 1, 1, 1, 1, 1,
0.1685851, -0.735164, 1.801036, 1, 1, 1, 1, 1,
0.1687572, -0.5471693, 4.190689, 1, 1, 1, 1, 1,
0.1702504, 0.9397836, 1.471777, 1, 1, 1, 1, 1,
0.1732011, 0.3070693, 1.079033, 1, 1, 1, 1, 1,
0.1736258, -1.067695, 2.313312, 1, 1, 1, 1, 1,
0.1777471, -0.5848401, 2.468369, 1, 1, 1, 1, 1,
0.1796294, -0.02775593, 0.01461797, 0, 0, 1, 1, 1,
0.1818193, 2.624633, 0.0519769, 1, 0, 0, 1, 1,
0.1828388, 0.03828863, 2.419229, 1, 0, 0, 1, 1,
0.1833524, 0.5424171, 1.171522, 1, 0, 0, 1, 1,
0.1889784, -2.502674, 3.939356, 1, 0, 0, 1, 1,
0.1907046, 1.823138, 1.111727, 1, 0, 0, 1, 1,
0.1924632, 0.1641515, 2.398866, 0, 0, 0, 1, 1,
0.1926238, 0.1182269, 2.004128, 0, 0, 0, 1, 1,
0.1943406, 1.419082, 1.761959, 0, 0, 0, 1, 1,
0.1963776, 0.5819927, 1.030653, 0, 0, 0, 1, 1,
0.1975713, 1.166988, 0.6716857, 0, 0, 0, 1, 1,
0.1982628, 0.2401795, 1.928048, 0, 0, 0, 1, 1,
0.200465, -0.9934858, 4.420733, 0, 0, 0, 1, 1,
0.2050524, -0.05478959, 2.353281, 1, 1, 1, 1, 1,
0.2053115, -0.4870882, 3.199567, 1, 1, 1, 1, 1,
0.2082182, 0.7328277, 1.448699, 1, 1, 1, 1, 1,
0.2147385, -1.202956, 2.502122, 1, 1, 1, 1, 1,
0.2173805, 0.4379571, -0.1032058, 1, 1, 1, 1, 1,
0.2208081, -0.08072875, 1.287279, 1, 1, 1, 1, 1,
0.223323, 1.962329, -0.1311429, 1, 1, 1, 1, 1,
0.2315602, 0.9924203, 0.4658481, 1, 1, 1, 1, 1,
0.2337373, -0.7964514, 2.665091, 1, 1, 1, 1, 1,
0.2417914, -0.8280413, 2.569593, 1, 1, 1, 1, 1,
0.2421012, -2.078717, 3.098783, 1, 1, 1, 1, 1,
0.2452189, 0.6034694, -0.1899213, 1, 1, 1, 1, 1,
0.2459601, 2.490373, -1.694386, 1, 1, 1, 1, 1,
0.2502795, 0.6683221, -0.1630162, 1, 1, 1, 1, 1,
0.2588281, 1.021291, 1.13899, 1, 1, 1, 1, 1,
0.2612593, -0.03459747, 2.517098, 0, 0, 1, 1, 1,
0.2623509, 0.3691931, 1.525279, 1, 0, 0, 1, 1,
0.265372, -0.4961569, 1.988922, 1, 0, 0, 1, 1,
0.2679176, -1.363692, 3.54022, 1, 0, 0, 1, 1,
0.2696695, 0.3301736, 1.274281, 1, 0, 0, 1, 1,
0.2718001, -0.8413444, 2.718466, 1, 0, 0, 1, 1,
0.2748688, 0.5083265, 1.380384, 0, 0, 0, 1, 1,
0.2749638, 0.4476288, 2.019077, 0, 0, 0, 1, 1,
0.2776066, -0.8067737, 2.385448, 0, 0, 0, 1, 1,
0.2825136, -0.1691391, 0.9697429, 0, 0, 0, 1, 1,
0.2825463, -0.11342, 2.472327, 0, 0, 0, 1, 1,
0.282815, 1.180846, -2.379768, 0, 0, 0, 1, 1,
0.284742, -0.004501204, 2.98101, 0, 0, 0, 1, 1,
0.286303, 1.081263, -0.07527459, 1, 1, 1, 1, 1,
0.2878674, -1.083049, 3.221229, 1, 1, 1, 1, 1,
0.2880035, 0.3257143, 1.571996, 1, 1, 1, 1, 1,
0.29068, 1.144776, -1.190555, 1, 1, 1, 1, 1,
0.2909715, -1.039661, 2.359984, 1, 1, 1, 1, 1,
0.2925918, -1.306516, 2.216493, 1, 1, 1, 1, 1,
0.2956546, 2.004307, -0.9999809, 1, 1, 1, 1, 1,
0.3004276, -1.39672, 3.290525, 1, 1, 1, 1, 1,
0.3069459, 2.040909, 1.728567, 1, 1, 1, 1, 1,
0.3103626, 0.09664375, 2.144549, 1, 1, 1, 1, 1,
0.3125996, -0.5872519, 2.823682, 1, 1, 1, 1, 1,
0.3161385, -0.6067293, 3.217674, 1, 1, 1, 1, 1,
0.3189127, -0.5773629, 2.201045, 1, 1, 1, 1, 1,
0.3197863, 2.195957, -1.109062, 1, 1, 1, 1, 1,
0.3273816, -0.8410432, 4.434756, 1, 1, 1, 1, 1,
0.33436, -0.8140475, 3.510909, 0, 0, 1, 1, 1,
0.3345786, -0.5969378, 1.51013, 1, 0, 0, 1, 1,
0.3355706, 0.1693235, 0.8360047, 1, 0, 0, 1, 1,
0.3400925, 0.8164148, 0.8082425, 1, 0, 0, 1, 1,
0.3454047, -1.161411, 3.392551, 1, 0, 0, 1, 1,
0.345531, -1.618361, 4.523671, 1, 0, 0, 1, 1,
0.3489027, -0.9726361, 1.126307, 0, 0, 0, 1, 1,
0.3495788, 0.4966471, 0.2619807, 0, 0, 0, 1, 1,
0.3496272, 0.9586791, 1.516514, 0, 0, 0, 1, 1,
0.3580801, 0.3278585, -0.1145325, 0, 0, 0, 1, 1,
0.3583576, -0.7224966, 3.193951, 0, 0, 0, 1, 1,
0.3583798, -0.5310708, 3.134099, 0, 0, 0, 1, 1,
0.3588439, 0.3231329, 0.9630213, 0, 0, 0, 1, 1,
0.36107, -2.208579, 2.40268, 1, 1, 1, 1, 1,
0.366069, 1.535833, 0.5735044, 1, 1, 1, 1, 1,
0.3715179, -0.8205047, 2.857988, 1, 1, 1, 1, 1,
0.3751152, -2.204708, 3.738999, 1, 1, 1, 1, 1,
0.3818215, 0.3221504, 2.174213, 1, 1, 1, 1, 1,
0.3844996, -0.4372874, 2.747472, 1, 1, 1, 1, 1,
0.3850502, -0.8671035, 4.804022, 1, 1, 1, 1, 1,
0.3861567, -0.4551422, 1.799316, 1, 1, 1, 1, 1,
0.3945783, -0.3064491, 3.108852, 1, 1, 1, 1, 1,
0.4003819, 0.02870055, 1.763252, 1, 1, 1, 1, 1,
0.4009315, 0.05952097, 2.044575, 1, 1, 1, 1, 1,
0.4046567, -1.184449, 3.384621, 1, 1, 1, 1, 1,
0.4085831, 2.074194, 1.393086, 1, 1, 1, 1, 1,
0.4124958, -0.5465282, 1.455591, 1, 1, 1, 1, 1,
0.4142427, -0.4115444, 2.158151, 1, 1, 1, 1, 1,
0.4191763, 0.5130957, -0.2776772, 0, 0, 1, 1, 1,
0.42021, 0.9955866, 2.314615, 1, 0, 0, 1, 1,
0.4231054, -1.845193, 1.406294, 1, 0, 0, 1, 1,
0.4231943, 1.655166, 0.4503923, 1, 0, 0, 1, 1,
0.4234914, 0.5851642, 2.409158, 1, 0, 0, 1, 1,
0.4236723, 1.787788, -0.1089913, 1, 0, 0, 1, 1,
0.4241442, 0.1913416, 0.4999942, 0, 0, 0, 1, 1,
0.4274822, -0.02222282, 2.105751, 0, 0, 0, 1, 1,
0.4320886, 0.2988269, 2.099709, 0, 0, 0, 1, 1,
0.4321997, -0.3124633, 1.725303, 0, 0, 0, 1, 1,
0.4323628, -0.3396778, 1.714354, 0, 0, 0, 1, 1,
0.433504, 0.4893773, 0.846671, 0, 0, 0, 1, 1,
0.435273, -0.9857798, 1.40019, 0, 0, 0, 1, 1,
0.4362405, -1.424889, 4.497925, 1, 1, 1, 1, 1,
0.4377541, -0.4226601, 2.990036, 1, 1, 1, 1, 1,
0.439272, -0.1668243, 0.9532239, 1, 1, 1, 1, 1,
0.4409334, -0.3392928, 3.254854, 1, 1, 1, 1, 1,
0.4432044, 0.1197303, 2.164803, 1, 1, 1, 1, 1,
0.4496734, -0.7500297, 3.258032, 1, 1, 1, 1, 1,
0.4573935, -1.102263, 3.118362, 1, 1, 1, 1, 1,
0.4577425, -2.697963, 3.703336, 1, 1, 1, 1, 1,
0.4655579, 0.2932289, 0.8245684, 1, 1, 1, 1, 1,
0.4686341, 0.4449815, 1.611301, 1, 1, 1, 1, 1,
0.4692304, 0.2763461, 1.719583, 1, 1, 1, 1, 1,
0.47053, 0.1214788, 3.490436, 1, 1, 1, 1, 1,
0.4736758, 0.07722132, 0.0923669, 1, 1, 1, 1, 1,
0.4748178, -0.654684, 3.800253, 1, 1, 1, 1, 1,
0.4748488, -0.2988456, 1.67861, 1, 1, 1, 1, 1,
0.4754225, 0.2676419, 1.355903, 0, 0, 1, 1, 1,
0.477792, -0.7032534, 3.202443, 1, 0, 0, 1, 1,
0.4789732, 0.551129, 1.407443, 1, 0, 0, 1, 1,
0.481035, 2.080535, -0.04019324, 1, 0, 0, 1, 1,
0.4812849, -0.5802054, 1.658704, 1, 0, 0, 1, 1,
0.4860695, 1.122392, 2.018373, 1, 0, 0, 1, 1,
0.4866645, 0.150394, 0.01055262, 0, 0, 0, 1, 1,
0.487435, 1.523607, 0.5622492, 0, 0, 0, 1, 1,
0.4875996, 0.8489329, -1.694024, 0, 0, 0, 1, 1,
0.4910862, 0.01274902, 0.8119062, 0, 0, 0, 1, 1,
0.4925094, 0.6994007, -0.6628365, 0, 0, 0, 1, 1,
0.4925722, -0.5393159, 1.703992, 0, 0, 0, 1, 1,
0.4955355, 0.1564078, 0.4073147, 0, 0, 0, 1, 1,
0.4962017, -1.313564, 2.685135, 1, 1, 1, 1, 1,
0.4983964, -0.9938424, 1.619851, 1, 1, 1, 1, 1,
0.4988287, 0.9969932, -0.510624, 1, 1, 1, 1, 1,
0.4990175, -0.443464, 2.870771, 1, 1, 1, 1, 1,
0.5040166, -1.371812, 3.717289, 1, 1, 1, 1, 1,
0.5117797, 0.8073453, 0.7927403, 1, 1, 1, 1, 1,
0.5138466, 0.9835834, 0.7856051, 1, 1, 1, 1, 1,
0.5235849, 0.5296565, 1.187731, 1, 1, 1, 1, 1,
0.5264471, 2.352729, 0.4284339, 1, 1, 1, 1, 1,
0.5264904, 0.7207758, 0.7072766, 1, 1, 1, 1, 1,
0.5268931, -0.8624159, 2.524052, 1, 1, 1, 1, 1,
0.530104, 0.9697233, 0.4166858, 1, 1, 1, 1, 1,
0.5329069, 0.2340146, -0.0927769, 1, 1, 1, 1, 1,
0.5335867, -0.8796672, 2.579179, 1, 1, 1, 1, 1,
0.5341317, -1.158759, 2.849756, 1, 1, 1, 1, 1,
0.5350111, -0.4159917, 0.8165653, 0, 0, 1, 1, 1,
0.5356225, -1.441458, 3.54722, 1, 0, 0, 1, 1,
0.5390773, 1.33553, -0.1578643, 1, 0, 0, 1, 1,
0.5427753, -1.773569, 3.035644, 1, 0, 0, 1, 1,
0.5438851, 2.322479, -0.3672691, 1, 0, 0, 1, 1,
0.5446016, 0.4732129, 1.099067, 1, 0, 0, 1, 1,
0.54636, 1.23593, 0.2830013, 0, 0, 0, 1, 1,
0.5492163, 0.7945856, 0.1069124, 0, 0, 0, 1, 1,
0.555819, -0.2733572, 0.6249071, 0, 0, 0, 1, 1,
0.5570541, -1.138326, 2.156747, 0, 0, 0, 1, 1,
0.5589901, -1.144242, 4.222824, 0, 0, 0, 1, 1,
0.5597633, 0.706586, -0.01635376, 0, 0, 0, 1, 1,
0.5602241, 0.6228285, -0.31585, 0, 0, 0, 1, 1,
0.5611778, 0.4778178, 0.08639853, 1, 1, 1, 1, 1,
0.5614577, -0.2596285, 0.9522218, 1, 1, 1, 1, 1,
0.5625727, -0.5618501, 2.839785, 1, 1, 1, 1, 1,
0.5670155, 0.8689964, 0.2287768, 1, 1, 1, 1, 1,
0.5691438, 0.5311564, 0.8550375, 1, 1, 1, 1, 1,
0.570997, -1.730792, 1.96149, 1, 1, 1, 1, 1,
0.5750255, 0.4883742, 0.5687616, 1, 1, 1, 1, 1,
0.5756187, 0.6494619, 0.6234114, 1, 1, 1, 1, 1,
0.5808226, 0.8688592, 0.3335576, 1, 1, 1, 1, 1,
0.582351, -0.3278047, 1.525338, 1, 1, 1, 1, 1,
0.5828952, -0.05888386, 1.820259, 1, 1, 1, 1, 1,
0.5850822, 0.1040065, 1.564086, 1, 1, 1, 1, 1,
0.585951, 1.158352, 0.9822174, 1, 1, 1, 1, 1,
0.592198, 0.4544944, -0.7605177, 1, 1, 1, 1, 1,
0.5934062, -1.198712, 2.017305, 1, 1, 1, 1, 1,
0.5943127, 0.4524501, 0.2765797, 0, 0, 1, 1, 1,
0.5947561, -0.8307458, 3.280236, 1, 0, 0, 1, 1,
0.5962678, 0.8358781, 1.733098, 1, 0, 0, 1, 1,
0.6028154, 1.777972, -0.01268308, 1, 0, 0, 1, 1,
0.6032054, 1.247769, 2.234127, 1, 0, 0, 1, 1,
0.6053759, 1.557869, 1.330253, 1, 0, 0, 1, 1,
0.6067257, 0.5851479, 0.3803825, 0, 0, 0, 1, 1,
0.6073062, -0.3750813, 2.073235, 0, 0, 0, 1, 1,
0.6090463, 0.5679257, -0.3337328, 0, 0, 0, 1, 1,
0.6099468, -1.056549, 3.415284, 0, 0, 0, 1, 1,
0.6203078, -1.239968, 2.853657, 0, 0, 0, 1, 1,
0.621834, 0.31693, 1.508854, 0, 0, 0, 1, 1,
0.6270044, 0.9476259, -0.6476243, 0, 0, 0, 1, 1,
0.6288201, -0.6983276, 1.671392, 1, 1, 1, 1, 1,
0.6306742, -1.389245, 2.716436, 1, 1, 1, 1, 1,
0.6348279, -0.9328915, 1.861813, 1, 1, 1, 1, 1,
0.6349943, -1.685295, 2.024228, 1, 1, 1, 1, 1,
0.6364515, -0.1037538, 2.379862, 1, 1, 1, 1, 1,
0.6385068, -0.2021334, 1.764565, 1, 1, 1, 1, 1,
0.6416033, -0.1675196, 1.10208, 1, 1, 1, 1, 1,
0.6492893, 0.8791553, 1.305613, 1, 1, 1, 1, 1,
0.6493185, 0.4427421, 0.6926944, 1, 1, 1, 1, 1,
0.6505925, 0.0631259, 1.263803, 1, 1, 1, 1, 1,
0.6525467, -0.4360781, -0.1489815, 1, 1, 1, 1, 1,
0.6528236, 1.481027, 0.2941637, 1, 1, 1, 1, 1,
0.6549429, -1.016627, 3.055685, 1, 1, 1, 1, 1,
0.6569847, 1.496946, 0.07622724, 1, 1, 1, 1, 1,
0.661135, -1.876555, 3.03971, 1, 1, 1, 1, 1,
0.6633411, -0.1875251, 0.6114409, 0, 0, 1, 1, 1,
0.6633485, -2.106942, 3.615371, 1, 0, 0, 1, 1,
0.6644203, 1.325677, 0.07793377, 1, 0, 0, 1, 1,
0.669111, 0.1070945, 0.1176187, 1, 0, 0, 1, 1,
0.6746319, 1.126635, 0.4950399, 1, 0, 0, 1, 1,
0.6808338, -0.537167, 2.522898, 1, 0, 0, 1, 1,
0.6839093, 0.3091285, 1.94648, 0, 0, 0, 1, 1,
0.6846248, -1.042647, 1.563086, 0, 0, 0, 1, 1,
0.6867698, -0.9208068, 2.246351, 0, 0, 0, 1, 1,
0.6873491, -1.582447, 1.239729, 0, 0, 0, 1, 1,
0.6898342, 0.940886, 0.1106678, 0, 0, 0, 1, 1,
0.6917269, -0.02652592, 1.747727, 0, 0, 0, 1, 1,
0.6934267, -0.139734, 0.9520826, 0, 0, 0, 1, 1,
0.693541, 0.9959111, 0.0006377092, 1, 1, 1, 1, 1,
0.6940312, -1.50378, 2.549289, 1, 1, 1, 1, 1,
0.6988214, 1.112435, 1.21077, 1, 1, 1, 1, 1,
0.7053385, 0.748121, 1.440082, 1, 1, 1, 1, 1,
0.7063562, -0.1447884, 3.960967, 1, 1, 1, 1, 1,
0.7208043, 0.2037594, 2.892144, 1, 1, 1, 1, 1,
0.7218645, 1.249663, -0.115791, 1, 1, 1, 1, 1,
0.7233149, 1.292095, 0.1154734, 1, 1, 1, 1, 1,
0.7242348, -0.2635697, 0.5901332, 1, 1, 1, 1, 1,
0.72442, -1.078457, 3.337837, 1, 1, 1, 1, 1,
0.727233, 1.602667, 0.6880372, 1, 1, 1, 1, 1,
0.7272757, 0.4603693, 2.788499, 1, 1, 1, 1, 1,
0.731388, 1.038707, 1.629588, 1, 1, 1, 1, 1,
0.7345409, 0.5260992, 1.109051, 1, 1, 1, 1, 1,
0.7382643, -1.219254, 1.638397, 1, 1, 1, 1, 1,
0.7435167, -0.0447763, 0.8753031, 0, 0, 1, 1, 1,
0.7435871, -1.104774, 0.01816733, 1, 0, 0, 1, 1,
0.7512494, -1.105683, 2.377031, 1, 0, 0, 1, 1,
0.7523307, 1.338913, 1.70435, 1, 0, 0, 1, 1,
0.7538071, 0.7026374, 0.6297438, 1, 0, 0, 1, 1,
0.7541639, 0.1000273, 0.7935387, 1, 0, 0, 1, 1,
0.7565055, -0.9456298, 4.593766, 0, 0, 0, 1, 1,
0.757215, 0.7955134, 1.271681, 0, 0, 0, 1, 1,
0.7616677, 0.4246966, 1.692518, 0, 0, 0, 1, 1,
0.7722864, 1.065127, 0.8729572, 0, 0, 0, 1, 1,
0.7725112, -0.1177282, 1.915324, 0, 0, 0, 1, 1,
0.7753044, 0.3601465, 3.485516, 0, 0, 0, 1, 1,
0.7917307, 0.1491552, -1.569743, 0, 0, 0, 1, 1,
0.7984936, -0.05150411, 2.714046, 1, 1, 1, 1, 1,
0.799866, 0.1070845, 2.277371, 1, 1, 1, 1, 1,
0.806665, -0.6230143, 1.301628, 1, 1, 1, 1, 1,
0.8151619, 1.741554, -0.4271025, 1, 1, 1, 1, 1,
0.8264468, -0.03911233, 1.074687, 1, 1, 1, 1, 1,
0.828651, 1.253605, -0.1271788, 1, 1, 1, 1, 1,
0.8311449, 1.127806, 1.201348, 1, 1, 1, 1, 1,
0.8325243, 1.70633, 1.282776, 1, 1, 1, 1, 1,
0.8334979, 0.1772739, 3.256922, 1, 1, 1, 1, 1,
0.835974, -0.2217851, 1.351068, 1, 1, 1, 1, 1,
0.8370205, -0.1646076, 0.7976941, 1, 1, 1, 1, 1,
0.8414942, 0.4607843, -0.2082094, 1, 1, 1, 1, 1,
0.8465123, 1.210742, -0.01337396, 1, 1, 1, 1, 1,
0.8489029, 0.3505422, 0.2383383, 1, 1, 1, 1, 1,
0.8518604, -0.9265322, 2.987415, 1, 1, 1, 1, 1,
0.8536316, 0.886131, 3.244217, 0, 0, 1, 1, 1,
0.8560655, 0.2308096, 2.329678, 1, 0, 0, 1, 1,
0.8596255, -1.554457, 2.151676, 1, 0, 0, 1, 1,
0.86998, -0.4359701, 2.008807, 1, 0, 0, 1, 1,
0.8705047, 0.07164021, 1.795521, 1, 0, 0, 1, 1,
0.8713954, 0.1876923, 2.93932, 1, 0, 0, 1, 1,
0.8724273, 1.372909, 0.7475247, 0, 0, 0, 1, 1,
0.8740218, -1.113403, 1.828731, 0, 0, 0, 1, 1,
0.8810265, -0.7136042, 2.663764, 0, 0, 0, 1, 1,
0.8811675, -0.159798, 1.107091, 0, 0, 0, 1, 1,
0.8890895, -0.02317527, 2.216812, 0, 0, 0, 1, 1,
0.8893979, 0.1702404, 1.738026, 0, 0, 0, 1, 1,
0.8916856, 1.081643, 1.416566, 0, 0, 0, 1, 1,
0.8934632, -0.7026112, 1.887637, 1, 1, 1, 1, 1,
0.896958, 0.2132316, -1.185765, 1, 1, 1, 1, 1,
0.9034372, -0.2728017, 2.488358, 1, 1, 1, 1, 1,
0.9058296, -0.2593446, 1.184265, 1, 1, 1, 1, 1,
0.9093747, 0.3216595, 2.593517, 1, 1, 1, 1, 1,
0.9097502, 2.057537, -0.6609707, 1, 1, 1, 1, 1,
0.9102681, 0.2640898, 0.7089897, 1, 1, 1, 1, 1,
0.9178465, -1.398588, 3.29113, 1, 1, 1, 1, 1,
0.9266638, -2.16545, 0.2571723, 1, 1, 1, 1, 1,
0.9335744, 1.591601, -0.1767825, 1, 1, 1, 1, 1,
0.9357303, 1.24157, -1.242414, 1, 1, 1, 1, 1,
0.9396156, 0.6225171, 2.08816, 1, 1, 1, 1, 1,
0.9421191, 0.3821073, 2.157322, 1, 1, 1, 1, 1,
0.9427843, 1.393187, 0.4977679, 1, 1, 1, 1, 1,
0.9459893, -2.433111, 1.887845, 1, 1, 1, 1, 1,
0.9544556, -1.184782, 1.271328, 0, 0, 1, 1, 1,
0.9599642, -0.7342889, 4.880967, 1, 0, 0, 1, 1,
0.9665395, -1.873513, 2.723948, 1, 0, 0, 1, 1,
0.9687768, -0.3794351, 0.422503, 1, 0, 0, 1, 1,
0.9730743, -0.9153928, 1.619656, 1, 0, 0, 1, 1,
0.9732311, -1.348387, 1.899605, 1, 0, 0, 1, 1,
0.9760445, -0.8015279, 0.03400792, 0, 0, 0, 1, 1,
0.9765542, 0.5334849, 1.825736, 0, 0, 0, 1, 1,
0.9789415, -0.4530228, 2.174115, 0, 0, 0, 1, 1,
0.9942616, 0.8220422, -0.9784888, 0, 0, 0, 1, 1,
0.9988804, -1.314419, 2.721827, 0, 0, 0, 1, 1,
0.9993004, -0.3432846, 0.6365308, 0, 0, 0, 1, 1,
1.023554, -0.3699453, 1.632586, 0, 0, 0, 1, 1,
1.02603, -0.05394088, 1.063661, 1, 1, 1, 1, 1,
1.030757, 0.9826583, 1.060919, 1, 1, 1, 1, 1,
1.034698, -1.298535, 1.438284, 1, 1, 1, 1, 1,
1.034791, -0.8340991, 3.130405, 1, 1, 1, 1, 1,
1.035344, -0.6609125, 3.240008, 1, 1, 1, 1, 1,
1.038786, 1.256944, 0.8746955, 1, 1, 1, 1, 1,
1.041041, -0.03798181, 1.699022, 1, 1, 1, 1, 1,
1.050831, 1.560866, 0.7878132, 1, 1, 1, 1, 1,
1.059125, 0.1317006, 0.6620105, 1, 1, 1, 1, 1,
1.0682, 1.063166, -0.07494981, 1, 1, 1, 1, 1,
1.075208, 1.484937, 0.2512875, 1, 1, 1, 1, 1,
1.076662, -0.1845449, 2.527901, 1, 1, 1, 1, 1,
1.079367, 0.04844696, 2.300942, 1, 1, 1, 1, 1,
1.091787, -0.5456117, 3.017877, 1, 1, 1, 1, 1,
1.094703, 0.7119141, 2.024306, 1, 1, 1, 1, 1,
1.095445, -1.514815, 2.711843, 0, 0, 1, 1, 1,
1.100905, 0.1167528, 1.154076, 1, 0, 0, 1, 1,
1.102493, -0.1914971, 2.172351, 1, 0, 0, 1, 1,
1.109888, -0.3779759, 2.072965, 1, 0, 0, 1, 1,
1.113185, -0.6257587, 2.39853, 1, 0, 0, 1, 1,
1.115734, -0.9624795, -0.1743609, 1, 0, 0, 1, 1,
1.116826, 1.037578, 1.057924, 0, 0, 0, 1, 1,
1.130265, 0.918057, 1.798516, 0, 0, 0, 1, 1,
1.135696, -0.3914638, 3.237937, 0, 0, 0, 1, 1,
1.139933, -0.1123464, 0.4350512, 0, 0, 0, 1, 1,
1.141544, 1.262084, 2.195341, 0, 0, 0, 1, 1,
1.145452, 0.304442, 0.4275284, 0, 0, 0, 1, 1,
1.149274, -0.6008106, 1.304183, 0, 0, 0, 1, 1,
1.149966, 1.646478, 0.1460432, 1, 1, 1, 1, 1,
1.156627, 0.1933246, 0.4018767, 1, 1, 1, 1, 1,
1.162448, -0.1424997, 0.3957716, 1, 1, 1, 1, 1,
1.172049, -0.4899701, 2.645267, 1, 1, 1, 1, 1,
1.173698, -1.817151, 3.142704, 1, 1, 1, 1, 1,
1.175367, -1.083725, 2.697723, 1, 1, 1, 1, 1,
1.182343, -2.022887, 3.215358, 1, 1, 1, 1, 1,
1.192325, 0.03326831, 0.5839037, 1, 1, 1, 1, 1,
1.197809, 1.292099, 1.563116, 1, 1, 1, 1, 1,
1.200555, 2.602023, 0.4392256, 1, 1, 1, 1, 1,
1.204075, 0.2632397, 2.162229, 1, 1, 1, 1, 1,
1.209318, -0.4161594, 2.401475, 1, 1, 1, 1, 1,
1.223881, 0.06691513, 1.911911, 1, 1, 1, 1, 1,
1.226779, -0.6754326, 1.585543, 1, 1, 1, 1, 1,
1.234292, 0.6466019, 2.954189, 1, 1, 1, 1, 1,
1.243547, -0.8149968, 1.143848, 0, 0, 1, 1, 1,
1.244062, -0.7198041, 3.007108, 1, 0, 0, 1, 1,
1.251189, 0.2385674, 1.936146, 1, 0, 0, 1, 1,
1.251872, 1.585898, 2.060464, 1, 0, 0, 1, 1,
1.256811, -1.472242, 1.198734, 1, 0, 0, 1, 1,
1.2574, 1.864032, 0.5091254, 1, 0, 0, 1, 1,
1.258176, 0.9034932, 0.7216798, 0, 0, 0, 1, 1,
1.270455, 0.03871189, 0.5491458, 0, 0, 0, 1, 1,
1.27096, -0.02043259, 2.02057, 0, 0, 0, 1, 1,
1.274701, -0.7299727, 0.1694605, 0, 0, 0, 1, 1,
1.275191, 1.546627, 0.2589498, 0, 0, 0, 1, 1,
1.290941, -1.672827, 1.605408, 0, 0, 0, 1, 1,
1.296606, 0.6401038, 0.3578378, 0, 0, 0, 1, 1,
1.310258, 0.9471661, 1.256554, 1, 1, 1, 1, 1,
1.318114, -1.127364, 2.293652, 1, 1, 1, 1, 1,
1.327008, -0.01185987, 2.193012, 1, 1, 1, 1, 1,
1.328106, 0.4285347, 1.07435, 1, 1, 1, 1, 1,
1.343193, -0.6013347, 1.832925, 1, 1, 1, 1, 1,
1.34378, 0.3608397, 2.169051, 1, 1, 1, 1, 1,
1.355746, -1.051708, 1.52884, 1, 1, 1, 1, 1,
1.355873, -0.2348949, 0.8957699, 1, 1, 1, 1, 1,
1.359926, -0.7981033, 1.860551, 1, 1, 1, 1, 1,
1.378487, -0.2710582, 3.249345, 1, 1, 1, 1, 1,
1.397207, -1.603096, 2.394954, 1, 1, 1, 1, 1,
1.407302, -0.2611685, 1.712986, 1, 1, 1, 1, 1,
1.411051, 1.559868, 2.095701, 1, 1, 1, 1, 1,
1.435217, 1.303092, 2.176285, 1, 1, 1, 1, 1,
1.437722, -1.688527, 2.156844, 1, 1, 1, 1, 1,
1.449513, 0.8636964, 2.228241, 0, 0, 1, 1, 1,
1.473316, 0.1018229, 0.5709409, 1, 0, 0, 1, 1,
1.476069, 1.08552, 1.373937, 1, 0, 0, 1, 1,
1.491104, -2.02106, 1.377884, 1, 0, 0, 1, 1,
1.491347, -0.8004986, 0.7112088, 1, 0, 0, 1, 1,
1.497343, -0.2371225, 2.302202, 1, 0, 0, 1, 1,
1.502882, 0.3566401, 1.16081, 0, 0, 0, 1, 1,
1.504483, -0.5150821, 3.560995, 0, 0, 0, 1, 1,
1.512419, 0.8909039, 1.013114, 0, 0, 0, 1, 1,
1.515866, 0.04907909, 2.24566, 0, 0, 0, 1, 1,
1.526416, -0.7965046, 1.734566, 0, 0, 0, 1, 1,
1.532127, 0.9692168, 2.89773, 0, 0, 0, 1, 1,
1.548934, 0.4593715, 2.187627, 0, 0, 0, 1, 1,
1.554114, -1.353533, 2.860411, 1, 1, 1, 1, 1,
1.56033, -0.1638807, 0.03071419, 1, 1, 1, 1, 1,
1.561705, -0.4821276, 0.8507829, 1, 1, 1, 1, 1,
1.563791, -0.7853934, 3.408544, 1, 1, 1, 1, 1,
1.566491, -0.8159015, 3.082546, 1, 1, 1, 1, 1,
1.575033, 0.5218062, 2.253354, 1, 1, 1, 1, 1,
1.591125, 1.033381, 2.519758, 1, 1, 1, 1, 1,
1.591884, 1.380725, -0.6039196, 1, 1, 1, 1, 1,
1.601056, -0.7972244, 2.90131, 1, 1, 1, 1, 1,
1.604629, -0.7988566, 2.24255, 1, 1, 1, 1, 1,
1.614948, 0.2762446, 1.453867, 1, 1, 1, 1, 1,
1.618765, -0.01013878, 1.525178, 1, 1, 1, 1, 1,
1.621446, -0.7197738, 2.605794, 1, 1, 1, 1, 1,
1.626073, 0.165943, 2.001405, 1, 1, 1, 1, 1,
1.635231, 1.536328, -0.01780679, 1, 1, 1, 1, 1,
1.660746, -1.310064, 2.594111, 0, 0, 1, 1, 1,
1.67078, -0.1514501, 1.682561, 1, 0, 0, 1, 1,
1.686944, 0.003355741, 1.42705, 1, 0, 0, 1, 1,
1.698431, 0.8553134, 1.294287, 1, 0, 0, 1, 1,
1.708227, 0.4002312, 1.162397, 1, 0, 0, 1, 1,
1.714471, 0.8385828, -0.5920904, 1, 0, 0, 1, 1,
1.735961, -0.8553032, 4.326668, 0, 0, 0, 1, 1,
1.738858, -0.6133069, 1.243203, 0, 0, 0, 1, 1,
1.74264, 2.009788, 3.459786, 0, 0, 0, 1, 1,
1.753166, -0.5324493, 2.790273, 0, 0, 0, 1, 1,
1.758236, -2.140165, -0.2305477, 0, 0, 0, 1, 1,
1.773996, 1.031492, 0.1224867, 0, 0, 0, 1, 1,
1.790122, 0.2534674, 2.117356, 0, 0, 0, 1, 1,
1.791643, 1.17925, 0.5176047, 1, 1, 1, 1, 1,
1.806279, 0.1822934, 1.031854, 1, 1, 1, 1, 1,
1.821237, 1.972118, 1.461723, 1, 1, 1, 1, 1,
1.848906, 0.3347174, 0.8985691, 1, 1, 1, 1, 1,
1.860612, 0.5198296, 0.3226439, 1, 1, 1, 1, 1,
1.862644, -0.8488858, 2.249198, 1, 1, 1, 1, 1,
1.880734, 1.326797, 1.469665, 1, 1, 1, 1, 1,
1.907441, -1.034289, 2.305122, 1, 1, 1, 1, 1,
1.923217, -1.116408, 2.527001, 1, 1, 1, 1, 1,
1.923633, 2.265206, 0.426347, 1, 1, 1, 1, 1,
1.940438, 1.420243, 1.005329, 1, 1, 1, 1, 1,
1.950818, -0.7049705, 0.6480526, 1, 1, 1, 1, 1,
1.971692, 0.2589355, 1.648518, 1, 1, 1, 1, 1,
1.979637, 1.332497, 0.7897786, 1, 1, 1, 1, 1,
1.982275, -0.2694789, 0.4070692, 1, 1, 1, 1, 1,
1.990637, 0.0130201, 1.348387, 0, 0, 1, 1, 1,
2.004608, -0.8556955, 2.023227, 1, 0, 0, 1, 1,
2.012571, 1.063696, 0.7769745, 1, 0, 0, 1, 1,
2.060833, -2.737576, 2.102946, 1, 0, 0, 1, 1,
2.061392, 1.152731, 1.45392, 1, 0, 0, 1, 1,
2.10202, -1.164648, 1.088352, 1, 0, 0, 1, 1,
2.117763, -0.3686696, 3.543254, 0, 0, 0, 1, 1,
2.120587, -1.397938, 2.297587, 0, 0, 0, 1, 1,
2.124201, -0.3936093, 1.085053, 0, 0, 0, 1, 1,
2.134125, -0.3150792, 0.9270511, 0, 0, 0, 1, 1,
2.213808, -1.12644, -0.17709, 0, 0, 0, 1, 1,
2.220255, -0.4955422, 1.102331, 0, 0, 0, 1, 1,
2.335154, -2.776223, 2.30827, 0, 0, 0, 1, 1,
2.34535, 1.336626, 1.622636, 1, 1, 1, 1, 1,
2.380982, 0.1282822, 2.039495, 1, 1, 1, 1, 1,
2.435798, -0.1785813, 3.73049, 1, 1, 1, 1, 1,
2.620276, -0.5946505, 2.338395, 1, 1, 1, 1, 1,
2.643894, 0.5312237, 0.06360599, 1, 1, 1, 1, 1,
3.333154, 0.3573429, 1.082598, 1, 1, 1, 1, 1,
3.337632, 0.07131992, 2.236425, 1, 1, 1, 1, 1
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
var radius = 9.624147;
var distance = 33.80441;
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
mvMatrix.translate( -0.02097082, 0.08674431, -0.09892154 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.80441);
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
