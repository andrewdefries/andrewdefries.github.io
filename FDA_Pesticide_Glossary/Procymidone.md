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
-3.184126, 0.5719287, -1.917721, 1, 0, 0, 1,
-2.795849, 0.5074655, -2.385519, 1, 0.007843138, 0, 1,
-2.765802, -0.9770947, -0.934182, 1, 0.01176471, 0, 1,
-2.677005, -0.24874, -0.4761845, 1, 0.01960784, 0, 1,
-2.611583, 0.09330781, -1.649928, 1, 0.02352941, 0, 1,
-2.603365, -0.7753826, -1.131408, 1, 0.03137255, 0, 1,
-2.53503, 0.4846801, -2.889865, 1, 0.03529412, 0, 1,
-2.529946, 0.07882196, -2.554672, 1, 0.04313726, 0, 1,
-2.494821, 0.3642086, -1.891387, 1, 0.04705882, 0, 1,
-2.484501, -0.877702, -0.8370107, 1, 0.05490196, 0, 1,
-2.482473, -0.408702, -2.528822, 1, 0.05882353, 0, 1,
-2.364412, -0.2879984, -3.502061, 1, 0.06666667, 0, 1,
-2.346318, 1.099003, -2.152415, 1, 0.07058824, 0, 1,
-2.331449, -0.5123539, -1.829752, 1, 0.07843138, 0, 1,
-2.313162, -0.3041382, 0.8493507, 1, 0.08235294, 0, 1,
-2.285861, -2.390056, -2.085664, 1, 0.09019608, 0, 1,
-2.284418, 0.6595358, -1.673492, 1, 0.09411765, 0, 1,
-2.225749, -0.607044, -1.976911, 1, 0.1019608, 0, 1,
-2.22568, 0.002836601, -2.866316, 1, 0.1098039, 0, 1,
-2.209579, -0.07500708, -2.073545, 1, 0.1137255, 0, 1,
-2.125463, 1.556355, -0.3569234, 1, 0.1215686, 0, 1,
-2.113149, 0.8289178, -0.05569777, 1, 0.1254902, 0, 1,
-2.103628, -0.4685228, -2.909097, 1, 0.1333333, 0, 1,
-2.100157, 0.03065045, -0.8459616, 1, 0.1372549, 0, 1,
-2.08781, -1.569288, -3.040235, 1, 0.145098, 0, 1,
-2.082785, 0.883525, -1.595202, 1, 0.1490196, 0, 1,
-2.054095, -1.256519, -1.047726, 1, 0.1568628, 0, 1,
-2.053034, 0.6098135, -1.215859, 1, 0.1607843, 0, 1,
-2.049083, -0.4292938, -1.976878, 1, 0.1686275, 0, 1,
-2.031238, -1.393277, -1.019619, 1, 0.172549, 0, 1,
-2.028773, -0.4385075, -1.735764, 1, 0.1803922, 0, 1,
-2.012403, -0.01927372, -2.887183, 1, 0.1843137, 0, 1,
-2.001462, 0.6404108, -1.075949, 1, 0.1921569, 0, 1,
-1.981789, 0.427536, -3.752314, 1, 0.1960784, 0, 1,
-1.981549, 0.3425944, -0.4909326, 1, 0.2039216, 0, 1,
-1.974642, -1.047888, -2.610442, 1, 0.2117647, 0, 1,
-1.966919, 0.3923994, -2.808616, 1, 0.2156863, 0, 1,
-1.959149, 0.09270711, -1.02078, 1, 0.2235294, 0, 1,
-1.953364, 0.488096, -1.485156, 1, 0.227451, 0, 1,
-1.906199, 0.30499, -2.323056, 1, 0.2352941, 0, 1,
-1.889691, 1.535617, 0.09634005, 1, 0.2392157, 0, 1,
-1.885602, -1.810841, -1.764358, 1, 0.2470588, 0, 1,
-1.884366, 0.2484311, -1.777005, 1, 0.2509804, 0, 1,
-1.882684, 0.6814499, -1.331333, 1, 0.2588235, 0, 1,
-1.869529, 0.3349559, -0.1626564, 1, 0.2627451, 0, 1,
-1.865215, -0.51705, -0.1347847, 1, 0.2705882, 0, 1,
-1.860178, -0.2224977, -1.831472, 1, 0.2745098, 0, 1,
-1.852744, 1.997391, -0.706383, 1, 0.282353, 0, 1,
-1.84964, 0.6125622, 1.249161, 1, 0.2862745, 0, 1,
-1.848964, -1.027643, -1.778626, 1, 0.2941177, 0, 1,
-1.84889, -1.47811, -0.4747636, 1, 0.3019608, 0, 1,
-1.83682, 0.04976856, -0.9265555, 1, 0.3058824, 0, 1,
-1.834579, 0.8545189, -0.1101249, 1, 0.3137255, 0, 1,
-1.834573, 1.256578, 0.1441474, 1, 0.3176471, 0, 1,
-1.834088, 0.09094517, 0.6754435, 1, 0.3254902, 0, 1,
-1.831269, 0.2732831, -1.420174, 1, 0.3294118, 0, 1,
-1.825441, -1.450696, -3.633178, 1, 0.3372549, 0, 1,
-1.814219, 1.761686, 0.1396376, 1, 0.3411765, 0, 1,
-1.81186, -0.8375213, -3.492393, 1, 0.3490196, 0, 1,
-1.808345, -0.422246, -1.402937, 1, 0.3529412, 0, 1,
-1.760693, -0.8633621, -2.962645, 1, 0.3607843, 0, 1,
-1.747987, -0.506098, -0.438593, 1, 0.3647059, 0, 1,
-1.716315, 0.1533856, 0.8582988, 1, 0.372549, 0, 1,
-1.715334, -1.389078, -3.440871, 1, 0.3764706, 0, 1,
-1.71351, -0.6923988, -2.358267, 1, 0.3843137, 0, 1,
-1.703986, 0.7423999, -2.01387, 1, 0.3882353, 0, 1,
-1.70092, -1.432686, -1.9515, 1, 0.3960784, 0, 1,
-1.695644, 0.3308375, -2.029735, 1, 0.4039216, 0, 1,
-1.691706, 0.3333178, -2.426004, 1, 0.4078431, 0, 1,
-1.669989, 0.7590756, -0.5848882, 1, 0.4156863, 0, 1,
-1.669907, -0.6909378, -1.232062, 1, 0.4196078, 0, 1,
-1.662633, -0.6829927, -1.561238, 1, 0.427451, 0, 1,
-1.647002, -0.3412592, -1.40774, 1, 0.4313726, 0, 1,
-1.638228, -0.9808916, -3.133606, 1, 0.4392157, 0, 1,
-1.635526, -0.5669985, -1.317834, 1, 0.4431373, 0, 1,
-1.628919, 0.5182416, -2.338335, 1, 0.4509804, 0, 1,
-1.604169, 0.3320469, -1.745999, 1, 0.454902, 0, 1,
-1.598718, 0.4354673, -0.08384074, 1, 0.4627451, 0, 1,
-1.597411, 0.2957605, -2.752012, 1, 0.4666667, 0, 1,
-1.59613, 0.2031623, -1.235852, 1, 0.4745098, 0, 1,
-1.592444, -0.1807823, -1.032467, 1, 0.4784314, 0, 1,
-1.591862, -0.7915176, -0.691242, 1, 0.4862745, 0, 1,
-1.588827, -0.05466476, -0.6925619, 1, 0.4901961, 0, 1,
-1.579178, -0.1854284, -1.914443, 1, 0.4980392, 0, 1,
-1.572015, -1.359618, -2.981902, 1, 0.5058824, 0, 1,
-1.568976, 0.2024702, -2.496028, 1, 0.509804, 0, 1,
-1.553965, -0.4684567, -0.3611155, 1, 0.5176471, 0, 1,
-1.551466, 1.685362, -1.926692, 1, 0.5215687, 0, 1,
-1.54929, 1.130447, -1.240985, 1, 0.5294118, 0, 1,
-1.512918, 0.9987388, -1.232498, 1, 0.5333334, 0, 1,
-1.506679, 0.1467165, -2.142312, 1, 0.5411765, 0, 1,
-1.504707, 0.3087873, -1.585874, 1, 0.5450981, 0, 1,
-1.496667, -0.2685254, -2.451462, 1, 0.5529412, 0, 1,
-1.488159, -0.377214, -0.5192407, 1, 0.5568628, 0, 1,
-1.474146, 0.2797579, -2.400464, 1, 0.5647059, 0, 1,
-1.472458, -0.147094, -1.889449, 1, 0.5686275, 0, 1,
-1.457731, 1.75282, -0.2074355, 1, 0.5764706, 0, 1,
-1.445673, -0.169557, -3.293814, 1, 0.5803922, 0, 1,
-1.445619, -1.542805, -2.34646, 1, 0.5882353, 0, 1,
-1.440057, 0.6799885, -2.095645, 1, 0.5921569, 0, 1,
-1.436933, 0.381614, -3.739895, 1, 0.6, 0, 1,
-1.435309, 0.08881114, -2.556444, 1, 0.6078432, 0, 1,
-1.423094, -2.021477, -3.268981, 1, 0.6117647, 0, 1,
-1.421061, -0.9032117, -1.915381, 1, 0.6196079, 0, 1,
-1.415129, 0.5728769, -0.1056436, 1, 0.6235294, 0, 1,
-1.40976, 0.8067938, -1.62336, 1, 0.6313726, 0, 1,
-1.401287, -1.313771, -3.211431, 1, 0.6352941, 0, 1,
-1.396116, 1.035951, -0.4932022, 1, 0.6431373, 0, 1,
-1.386606, 1.541319, -0.3766511, 1, 0.6470588, 0, 1,
-1.38153, 0.04234041, -0.2748896, 1, 0.654902, 0, 1,
-1.3563, 0.8536516, -1.589322, 1, 0.6588235, 0, 1,
-1.344966, -0.1937761, -1.101504, 1, 0.6666667, 0, 1,
-1.3433, -0.0396451, -0.8402321, 1, 0.6705883, 0, 1,
-1.336415, -1.300095, -3.29684, 1, 0.6784314, 0, 1,
-1.332669, 0.7502504, -1.632083, 1, 0.682353, 0, 1,
-1.332403, 0.8868371, -1.939976, 1, 0.6901961, 0, 1,
-1.315972, -0.06770806, -0.6599247, 1, 0.6941177, 0, 1,
-1.312907, 0.1147785, -2.332673, 1, 0.7019608, 0, 1,
-1.311293, -0.4152947, -1.155096, 1, 0.7098039, 0, 1,
-1.292042, 0.9355021, -0.8372229, 1, 0.7137255, 0, 1,
-1.292016, 0.708208, -0.2826666, 1, 0.7215686, 0, 1,
-1.288186, -0.8756856, -2.083546, 1, 0.7254902, 0, 1,
-1.276936, -0.02062462, -0.7346207, 1, 0.7333333, 0, 1,
-1.275211, -0.5422294, -1.267362, 1, 0.7372549, 0, 1,
-1.273451, 0.6070122, -1.745732, 1, 0.7450981, 0, 1,
-1.270725, -1.953582, -1.170771, 1, 0.7490196, 0, 1,
-1.263355, -0.2492759, -0.4278184, 1, 0.7568628, 0, 1,
-1.25675, 0.4083429, -1.69715, 1, 0.7607843, 0, 1,
-1.247553, 1.189847, -0.675359, 1, 0.7686275, 0, 1,
-1.231989, -0.6073673, -1.775049, 1, 0.772549, 0, 1,
-1.222977, 0.365052, -0.4335362, 1, 0.7803922, 0, 1,
-1.219474, 0.7535151, -1.998914, 1, 0.7843137, 0, 1,
-1.213462, 1.524105, -1.876078, 1, 0.7921569, 0, 1,
-1.209122, -0.3048093, -2.198646, 1, 0.7960784, 0, 1,
-1.198937, 0.7330132, -1.082553, 1, 0.8039216, 0, 1,
-1.190994, 0.5247763, -1.852893, 1, 0.8117647, 0, 1,
-1.182932, 0.05099415, -2.388567, 1, 0.8156863, 0, 1,
-1.180008, 0.7676626, -0.6959359, 1, 0.8235294, 0, 1,
-1.178462, 0.2083778, -1.521106, 1, 0.827451, 0, 1,
-1.177253, -1.246719, -2.556736, 1, 0.8352941, 0, 1,
-1.170383, -0.02591665, -0.2336737, 1, 0.8392157, 0, 1,
-1.167339, -0.5144252, -1.289233, 1, 0.8470588, 0, 1,
-1.16715, 0.6795422, -0.9757752, 1, 0.8509804, 0, 1,
-1.165457, -0.5760741, -3.246541, 1, 0.8588235, 0, 1,
-1.158627, -0.4865143, -1.941484, 1, 0.8627451, 0, 1,
-1.150418, -1.053272, -2.339435, 1, 0.8705882, 0, 1,
-1.144457, 0.894312, -1.252062, 1, 0.8745098, 0, 1,
-1.143117, 0.6805945, -1.591808, 1, 0.8823529, 0, 1,
-1.127536, -0.6090295, -4.964591, 1, 0.8862745, 0, 1,
-1.122779, 1.077129, -1.19952, 1, 0.8941177, 0, 1,
-1.116997, 1.34925, -0.6061881, 1, 0.8980392, 0, 1,
-1.116385, -1.352108, -1.705846, 1, 0.9058824, 0, 1,
-1.111091, -2.422579, -2.591463, 1, 0.9137255, 0, 1,
-1.107694, -0.7778797, -1.782119, 1, 0.9176471, 0, 1,
-1.105582, 0.7677496, 0.05712564, 1, 0.9254902, 0, 1,
-1.098304, 0.9423283, -1.192664, 1, 0.9294118, 0, 1,
-1.096119, -0.330288, -2.46533, 1, 0.9372549, 0, 1,
-1.095788, 1.37343, -0.01119834, 1, 0.9411765, 0, 1,
-1.087895, -0.9546925, -1.959551, 1, 0.9490196, 0, 1,
-1.075634, 0.7908978, -2.362185, 1, 0.9529412, 0, 1,
-1.075152, -1.097091, -3.777235, 1, 0.9607843, 0, 1,
-1.073546, 0.5335942, -0.7677338, 1, 0.9647059, 0, 1,
-1.073155, 0.1759797, -2.996959, 1, 0.972549, 0, 1,
-1.066793, 0.5592795, -1.155925, 1, 0.9764706, 0, 1,
-1.058243, 0.5728264, -0.9058005, 1, 0.9843137, 0, 1,
-1.042514, 1.462974, 0.0528629, 1, 0.9882353, 0, 1,
-1.037125, -0.585971, -2.668821, 1, 0.9960784, 0, 1,
-1.036884, -0.1513666, -0.4825504, 0.9960784, 1, 0, 1,
-1.036379, -0.7928919, -1.073189, 0.9921569, 1, 0, 1,
-1.021914, 0.6920598, -2.570986, 0.9843137, 1, 0, 1,
-1.021012, -0.1592204, -2.039848, 0.9803922, 1, 0, 1,
-1.011824, -1.722465, -1.53477, 0.972549, 1, 0, 1,
-1.007809, 0.2065626, 0.3697706, 0.9686275, 1, 0, 1,
-1.002251, -0.01077136, -2.139243, 0.9607843, 1, 0, 1,
-1.000949, 0.5151474, -0.2232855, 0.9568627, 1, 0, 1,
-1.000256, -0.5134107, 0.02759798, 0.9490196, 1, 0, 1,
-0.9939289, -1.128716, -2.406717, 0.945098, 1, 0, 1,
-0.9907258, -0.2707852, -1.016374, 0.9372549, 1, 0, 1,
-0.9850535, -0.7981172, -2.560023, 0.9333333, 1, 0, 1,
-0.9820327, -0.2611034, -2.404844, 0.9254902, 1, 0, 1,
-0.9818809, 0.753253, -1.337823, 0.9215686, 1, 0, 1,
-0.9803083, -0.100496, -1.729729, 0.9137255, 1, 0, 1,
-0.9798493, -0.9246122, -3.105274, 0.9098039, 1, 0, 1,
-0.9767551, 0.9831104, -1.560503, 0.9019608, 1, 0, 1,
-0.9726011, 0.175066, -0.8611484, 0.8941177, 1, 0, 1,
-0.9665787, -1.692668, -4.507833, 0.8901961, 1, 0, 1,
-0.9615242, 0.07523033, -1.888193, 0.8823529, 1, 0, 1,
-0.9565586, 0.1112574, -0.6656571, 0.8784314, 1, 0, 1,
-0.9545706, 1.697005, -2.948107, 0.8705882, 1, 0, 1,
-0.9533416, 1.829016, 0.08760066, 0.8666667, 1, 0, 1,
-0.9501311, 0.07849094, -0.07337972, 0.8588235, 1, 0, 1,
-0.941941, -0.7432772, -1.515364, 0.854902, 1, 0, 1,
-0.9411987, 1.132275, -1.605843, 0.8470588, 1, 0, 1,
-0.9398499, 0.5090353, -0.7761078, 0.8431373, 1, 0, 1,
-0.9388833, -1.010086, -3.238866, 0.8352941, 1, 0, 1,
-0.9376063, -0.7560194, -0.1679501, 0.8313726, 1, 0, 1,
-0.9367653, -1.143376, -1.845217, 0.8235294, 1, 0, 1,
-0.9321709, -0.3720172, -1.695734, 0.8196079, 1, 0, 1,
-0.9316773, -0.2562758, -2.931571, 0.8117647, 1, 0, 1,
-0.9316231, -1.357654, -4.106669, 0.8078431, 1, 0, 1,
-0.9310783, -0.4465098, -3.01466, 0.8, 1, 0, 1,
-0.9221074, -0.5655951, -2.713088, 0.7921569, 1, 0, 1,
-0.9200056, -0.08075367, -3.19966, 0.7882353, 1, 0, 1,
-0.9140739, -0.892737, -0.5388358, 0.7803922, 1, 0, 1,
-0.9082322, 1.429031, -0.3027087, 0.7764706, 1, 0, 1,
-0.8991654, -1.008268, -3.102123, 0.7686275, 1, 0, 1,
-0.8961657, -0.5780438, -2.659899, 0.7647059, 1, 0, 1,
-0.894574, 0.4105831, -1.656231, 0.7568628, 1, 0, 1,
-0.8920832, -0.8783992, -1.734184, 0.7529412, 1, 0, 1,
-0.8855509, 1.926522, -2.008077, 0.7450981, 1, 0, 1,
-0.8815448, 2.460559, -0.6245146, 0.7411765, 1, 0, 1,
-0.8795198, 0.6392449, -0.02496415, 0.7333333, 1, 0, 1,
-0.8790349, -0.4195858, -0.8274129, 0.7294118, 1, 0, 1,
-0.8789591, -1.364151, -3.067831, 0.7215686, 1, 0, 1,
-0.8753748, 0.5279241, -0.1107839, 0.7176471, 1, 0, 1,
-0.8719915, 0.6212577, -1.853478, 0.7098039, 1, 0, 1,
-0.8682348, -0.6426396, -2.857473, 0.7058824, 1, 0, 1,
-0.8655077, 0.2922725, -1.599028, 0.6980392, 1, 0, 1,
-0.8648168, -0.3670317, -2.204816, 0.6901961, 1, 0, 1,
-0.8575351, 0.9579077, -1.875953, 0.6862745, 1, 0, 1,
-0.8564741, 1.121122, -3.539544, 0.6784314, 1, 0, 1,
-0.8546196, -0.314635, -1.41855, 0.6745098, 1, 0, 1,
-0.854079, 1.915599, -1.878088, 0.6666667, 1, 0, 1,
-0.8514093, 0.8927671, -0.5360915, 0.6627451, 1, 0, 1,
-0.8491052, -0.5366117, -4.190532, 0.654902, 1, 0, 1,
-0.8415971, 1.586067, -0.1165606, 0.6509804, 1, 0, 1,
-0.8403292, -0.100826, -2.699047, 0.6431373, 1, 0, 1,
-0.8392827, 0.8350283, -2.028324, 0.6392157, 1, 0, 1,
-0.829739, -0.3715169, -2.062616, 0.6313726, 1, 0, 1,
-0.8249527, 0.2789509, -1.793726, 0.627451, 1, 0, 1,
-0.8245992, -1.200891, -2.835552, 0.6196079, 1, 0, 1,
-0.8176235, 1.325157, -1.537658, 0.6156863, 1, 0, 1,
-0.8172758, -0.9718066, -0.9899726, 0.6078432, 1, 0, 1,
-0.8095924, -1.737386, -2.960696, 0.6039216, 1, 0, 1,
-0.8092413, -0.8467108, -3.906521, 0.5960785, 1, 0, 1,
-0.8080475, 0.8199467, -2.41669, 0.5882353, 1, 0, 1,
-0.8045655, 0.8444394, -0.289951, 0.5843138, 1, 0, 1,
-0.8037278, 1.893933, 1.298043, 0.5764706, 1, 0, 1,
-0.7975318, -0.5166932, -3.663687, 0.572549, 1, 0, 1,
-0.7950186, -0.241435, -3.302738, 0.5647059, 1, 0, 1,
-0.7929066, 1.520343, -1.811073, 0.5607843, 1, 0, 1,
-0.7842967, -0.2416385, -1.674061, 0.5529412, 1, 0, 1,
-0.7808899, 0.1246269, -2.120075, 0.5490196, 1, 0, 1,
-0.7770224, -1.507583, -2.263437, 0.5411765, 1, 0, 1,
-0.7709764, -0.4053065, -1.159072, 0.5372549, 1, 0, 1,
-0.7701177, -0.4380636, -2.49387, 0.5294118, 1, 0, 1,
-0.7689072, -0.7856066, -0.9548306, 0.5254902, 1, 0, 1,
-0.7681952, -1.466822, -1.458652, 0.5176471, 1, 0, 1,
-0.766711, -1.507133, -2.858812, 0.5137255, 1, 0, 1,
-0.7607306, -0.8121902, -3.591048, 0.5058824, 1, 0, 1,
-0.7588967, 1.2633, 0.2710151, 0.5019608, 1, 0, 1,
-0.756752, -0.4264547, -3.073929, 0.4941176, 1, 0, 1,
-0.7558068, -2.080353, -1.876808, 0.4862745, 1, 0, 1,
-0.752768, 0.5318988, -2.001345, 0.4823529, 1, 0, 1,
-0.7525218, 0.316956, 0.378505, 0.4745098, 1, 0, 1,
-0.7490845, -0.2894014, -2.261808, 0.4705882, 1, 0, 1,
-0.7483655, -0.8155181, -1.801502, 0.4627451, 1, 0, 1,
-0.7483027, 2.351849, -0.4201348, 0.4588235, 1, 0, 1,
-0.7452316, -0.3401397, -1.782377, 0.4509804, 1, 0, 1,
-0.7433225, 1.594879, -1.06389, 0.4470588, 1, 0, 1,
-0.7286236, -1.74338, -2.053916, 0.4392157, 1, 0, 1,
-0.7279487, -0.8800871, -1.511452, 0.4352941, 1, 0, 1,
-0.7233945, -0.5815849, -1.902093, 0.427451, 1, 0, 1,
-0.7215621, -0.2973244, -3.850497, 0.4235294, 1, 0, 1,
-0.7186049, -0.4465013, -1.119046, 0.4156863, 1, 0, 1,
-0.7144694, 0.552187, 0.7188537, 0.4117647, 1, 0, 1,
-0.710299, -1.881486, -1.074902, 0.4039216, 1, 0, 1,
-0.7004533, -0.7558161, -4.897017, 0.3960784, 1, 0, 1,
-0.6999318, -0.07562108, -0.2729084, 0.3921569, 1, 0, 1,
-0.6976972, -0.2124484, 0.2744946, 0.3843137, 1, 0, 1,
-0.6968327, 0.6722698, -1.797371, 0.3803922, 1, 0, 1,
-0.6959664, -0.8436371, -2.340957, 0.372549, 1, 0, 1,
-0.6873391, -0.2660624, -2.155985, 0.3686275, 1, 0, 1,
-0.6847448, 0.105836, -1.275677, 0.3607843, 1, 0, 1,
-0.6798705, -0.7772766, -0.9608586, 0.3568628, 1, 0, 1,
-0.6755427, -0.9591107, -2.741236, 0.3490196, 1, 0, 1,
-0.6706989, 0.7318879, -1.337478, 0.345098, 1, 0, 1,
-0.6676519, -0.3170241, -1.678874, 0.3372549, 1, 0, 1,
-0.662896, 1.179176, -1.466401, 0.3333333, 1, 0, 1,
-0.6626792, -0.5017889, -1.227708, 0.3254902, 1, 0, 1,
-0.6566036, -0.244427, -1.893954, 0.3215686, 1, 0, 1,
-0.6565899, 2.988624, -0.3289033, 0.3137255, 1, 0, 1,
-0.6458231, 0.553369, -1.747119, 0.3098039, 1, 0, 1,
-0.6451885, -0.09265435, -2.85402, 0.3019608, 1, 0, 1,
-0.6450019, 0.4107975, 0.3255035, 0.2941177, 1, 0, 1,
-0.6449677, -0.1678661, -1.894325, 0.2901961, 1, 0, 1,
-0.6391646, 1.061593, -0.569162, 0.282353, 1, 0, 1,
-0.6368539, 0.3110118, -2.51763, 0.2784314, 1, 0, 1,
-0.6326219, -0.05943177, -0.3885801, 0.2705882, 1, 0, 1,
-0.6300744, -0.3063477, -3.867648, 0.2666667, 1, 0, 1,
-0.6285043, 0.4376813, -1.878997, 0.2588235, 1, 0, 1,
-0.6283156, -0.1313518, -0.9349519, 0.254902, 1, 0, 1,
-0.6278633, 0.924776, -0.409244, 0.2470588, 1, 0, 1,
-0.6268241, -1.190235, -2.039356, 0.2431373, 1, 0, 1,
-0.6246417, 0.2916264, -1.179142, 0.2352941, 1, 0, 1,
-0.6234833, -1.444162, -1.99785, 0.2313726, 1, 0, 1,
-0.623134, -0.7388487, -2.855289, 0.2235294, 1, 0, 1,
-0.6207752, -1.891077, -2.518938, 0.2196078, 1, 0, 1,
-0.6152116, 0.2706939, -1.136883, 0.2117647, 1, 0, 1,
-0.6102365, -0.5957696, -2.106022, 0.2078431, 1, 0, 1,
-0.6081666, 0.6478142, -2.888725, 0.2, 1, 0, 1,
-0.6064557, 0.4701211, -1.707231, 0.1921569, 1, 0, 1,
-0.6054672, 1.236694, -0.6392317, 0.1882353, 1, 0, 1,
-0.6033695, -0.28081, -4.034692, 0.1803922, 1, 0, 1,
-0.5983292, 1.431606, -0.2647443, 0.1764706, 1, 0, 1,
-0.5979725, 0.03034418, -1.480619, 0.1686275, 1, 0, 1,
-0.5976219, -0.2087634, -3.702091, 0.1647059, 1, 0, 1,
-0.5872021, 1.458067, 0.5507617, 0.1568628, 1, 0, 1,
-0.5839098, 2.025956, 0.04785461, 0.1529412, 1, 0, 1,
-0.5794523, -2.175189, -3.568134, 0.145098, 1, 0, 1,
-0.5773128, 1.217279, 1.929988, 0.1411765, 1, 0, 1,
-0.5762689, -0.6829148, -3.27823, 0.1333333, 1, 0, 1,
-0.5739787, 2.265115, -1.362421, 0.1294118, 1, 0, 1,
-0.5691711, 0.01496589, -3.436347, 0.1215686, 1, 0, 1,
-0.5684087, 0.3091093, -0.8267387, 0.1176471, 1, 0, 1,
-0.5628678, 0.03268621, -2.48396, 0.1098039, 1, 0, 1,
-0.5562829, -1.223983, -2.108064, 0.1058824, 1, 0, 1,
-0.5497365, 2.323318, 0.4712216, 0.09803922, 1, 0, 1,
-0.5483151, -0.2760254, -1.73638, 0.09019608, 1, 0, 1,
-0.5482586, 1.272408, 1.870072, 0.08627451, 1, 0, 1,
-0.5422918, -0.3315721, -1.603282, 0.07843138, 1, 0, 1,
-0.5413455, -2.027224, -2.429589, 0.07450981, 1, 0, 1,
-0.5385005, -0.6805936, -2.047988, 0.06666667, 1, 0, 1,
-0.5369915, -0.7023968, -2.912526, 0.0627451, 1, 0, 1,
-0.5359539, 1.366235, -0.8744388, 0.05490196, 1, 0, 1,
-0.5325668, -0.6866391, -1.43342, 0.05098039, 1, 0, 1,
-0.5295345, -1.644911, -3.347868, 0.04313726, 1, 0, 1,
-0.528944, -0.08964273, -1.690505, 0.03921569, 1, 0, 1,
-0.5289395, -0.01368013, -1.682861, 0.03137255, 1, 0, 1,
-0.5272654, 0.3216439, -1.788169, 0.02745098, 1, 0, 1,
-0.5260077, -1.172914, -2.74624, 0.01960784, 1, 0, 1,
-0.5085437, 0.9956382, -0.0940729, 0.01568628, 1, 0, 1,
-0.5074419, 0.5039179, 0.05696608, 0.007843138, 1, 0, 1,
-0.5072975, 1.900945, 2.186486, 0.003921569, 1, 0, 1,
-0.5039849, -0.9973444, -3.035021, 0, 1, 0.003921569, 1,
-0.5015458, 0.05609003, 1.010828, 0, 1, 0.01176471, 1,
-0.4994628, -0.5496809, -2.140343, 0, 1, 0.01568628, 1,
-0.4932741, -0.1304017, 0.2970344, 0, 1, 0.02352941, 1,
-0.4902333, -1.053427, -2.975351, 0, 1, 0.02745098, 1,
-0.4890124, 0.1537699, -0.6957417, 0, 1, 0.03529412, 1,
-0.4863647, 1.798887, -0.6325757, 0, 1, 0.03921569, 1,
-0.4799884, -0.8762529, -5.191478, 0, 1, 0.04705882, 1,
-0.4772071, 0.3972881, -1.259972, 0, 1, 0.05098039, 1,
-0.4696848, -1.39239, -3.147017, 0, 1, 0.05882353, 1,
-0.4637093, -1.103492, -3.677818, 0, 1, 0.0627451, 1,
-0.4621261, 0.3898759, -2.163518, 0, 1, 0.07058824, 1,
-0.4615853, -0.1711947, -2.638189, 0, 1, 0.07450981, 1,
-0.4603464, -0.1408083, -2.144535, 0, 1, 0.08235294, 1,
-0.4577524, 0.01127007, -2.683299, 0, 1, 0.08627451, 1,
-0.4575395, -1.280581, -3.307238, 0, 1, 0.09411765, 1,
-0.4563622, 0.5181617, -1.277386, 0, 1, 0.1019608, 1,
-0.4542988, 0.2674519, -1.004912, 0, 1, 0.1058824, 1,
-0.44939, -0.8541301, -2.604779, 0, 1, 0.1137255, 1,
-0.4492472, 0.4158775, -0.7694576, 0, 1, 0.1176471, 1,
-0.4473569, 0.9267005, -1.537644, 0, 1, 0.1254902, 1,
-0.44712, 0.4463034, -1.996581, 0, 1, 0.1294118, 1,
-0.4460247, -0.6244467, -2.254033, 0, 1, 0.1372549, 1,
-0.4448599, 0.1495107, -0.6775557, 0, 1, 0.1411765, 1,
-0.4423107, 0.869984, -0.4966378, 0, 1, 0.1490196, 1,
-0.441663, 0.2017034, -1.692279, 0, 1, 0.1529412, 1,
-0.4414817, 0.7090458, 0.3784493, 0, 1, 0.1607843, 1,
-0.4404204, 0.5692495, -1.350907, 0, 1, 0.1647059, 1,
-0.4336578, 1.315484, -0.1761899, 0, 1, 0.172549, 1,
-0.4312632, 1.451046, -0.2620817, 0, 1, 0.1764706, 1,
-0.4249232, 0.6248794, -1.787379, 0, 1, 0.1843137, 1,
-0.4207251, -0.8136117, -2.642528, 0, 1, 0.1882353, 1,
-0.4180953, 0.6835698, -0.7386662, 0, 1, 0.1960784, 1,
-0.4133599, 0.7972926, -0.6833005, 0, 1, 0.2039216, 1,
-0.4119135, -0.5816616, -2.214771, 0, 1, 0.2078431, 1,
-0.4112791, 1.200619, 0.2066165, 0, 1, 0.2156863, 1,
-0.4093687, 0.1132113, -2.279717, 0, 1, 0.2196078, 1,
-0.4071203, 1.141683, 0.4918695, 0, 1, 0.227451, 1,
-0.4032983, 0.5148602, -0.7616947, 0, 1, 0.2313726, 1,
-0.4029849, -0.7209386, -1.954671, 0, 1, 0.2392157, 1,
-0.4029789, -0.5856674, -1.763467, 0, 1, 0.2431373, 1,
-0.3996713, 0.9073033, -0.06150795, 0, 1, 0.2509804, 1,
-0.3994876, 0.7995375, -0.06623915, 0, 1, 0.254902, 1,
-0.396586, 1.578571, -0.2695171, 0, 1, 0.2627451, 1,
-0.3952684, 1.14589, -0.298496, 0, 1, 0.2666667, 1,
-0.389829, 1.66634, 0.2439544, 0, 1, 0.2745098, 1,
-0.3881393, -1.041477, -3.41564, 0, 1, 0.2784314, 1,
-0.3856072, -0.279259, -1.392632, 0, 1, 0.2862745, 1,
-0.3847523, 1.12848, -0.758811, 0, 1, 0.2901961, 1,
-0.3833408, 2.572891, 0.01168956, 0, 1, 0.2980392, 1,
-0.3815702, 1.128405, -1.459663, 0, 1, 0.3058824, 1,
-0.3792275, 0.09598345, -0.8427305, 0, 1, 0.3098039, 1,
-0.3788359, -1.654706, -2.100686, 0, 1, 0.3176471, 1,
-0.3787405, -0.6564454, -2.704734, 0, 1, 0.3215686, 1,
-0.3784805, -0.1976463, -2.736362, 0, 1, 0.3294118, 1,
-0.3732851, -0.7170764, -1.28454, 0, 1, 0.3333333, 1,
-0.3643709, -1.969257, -2.697018, 0, 1, 0.3411765, 1,
-0.3588648, 0.1657228, -0.1479558, 0, 1, 0.345098, 1,
-0.3542361, -0.5701426, -1.420627, 0, 1, 0.3529412, 1,
-0.3539626, -0.7190264, -2.241909, 0, 1, 0.3568628, 1,
-0.350922, 0.5907414, -1.373497, 0, 1, 0.3647059, 1,
-0.3501491, -0.3674172, -2.557306, 0, 1, 0.3686275, 1,
-0.3382236, 0.4988713, -0.6523051, 0, 1, 0.3764706, 1,
-0.3301504, 0.6315161, -1.076548, 0, 1, 0.3803922, 1,
-0.3283356, -0.005038154, -1.569363, 0, 1, 0.3882353, 1,
-0.3260601, 0.6488669, 0.2953666, 0, 1, 0.3921569, 1,
-0.3214848, -0.8078411, -2.607952, 0, 1, 0.4, 1,
-0.3173397, -0.01005002, -1.466515, 0, 1, 0.4078431, 1,
-0.316187, 0.3529201, -0.3912737, 0, 1, 0.4117647, 1,
-0.3160625, 1.919951, -0.2634992, 0, 1, 0.4196078, 1,
-0.312424, 0.4633474, -1.378266, 0, 1, 0.4235294, 1,
-0.3105873, 0.9290727, -1.99265, 0, 1, 0.4313726, 1,
-0.3097844, 0.9011543, -2.173605, 0, 1, 0.4352941, 1,
-0.3019406, 0.5530832, -1.955513, 0, 1, 0.4431373, 1,
-0.2985813, -0.8290395, -3.883343, 0, 1, 0.4470588, 1,
-0.2962354, -1.55482, -2.748811, 0, 1, 0.454902, 1,
-0.2958199, 1.712929, -0.4099136, 0, 1, 0.4588235, 1,
-0.2856914, 1.24848, 0.07672834, 0, 1, 0.4666667, 1,
-0.283844, -1.641532, -2.026124, 0, 1, 0.4705882, 1,
-0.2831538, -1.578963, -3.436814, 0, 1, 0.4784314, 1,
-0.2808737, 1.173799, 0.07334691, 0, 1, 0.4823529, 1,
-0.2772106, -0.1078507, -0.5460358, 0, 1, 0.4901961, 1,
-0.2702417, -0.05541423, -1.469049, 0, 1, 0.4941176, 1,
-0.2657558, -1.056366, -1.599254, 0, 1, 0.5019608, 1,
-0.2641133, -0.175039, -3.650413, 0, 1, 0.509804, 1,
-0.2630193, 0.3767061, -0.2824148, 0, 1, 0.5137255, 1,
-0.2594609, 0.3187936, -2.243959, 0, 1, 0.5215687, 1,
-0.2548386, 0.3702843, -0.3708616, 0, 1, 0.5254902, 1,
-0.2514811, 1.581697, 0.5920125, 0, 1, 0.5333334, 1,
-0.2510294, 1.007656, -0.133863, 0, 1, 0.5372549, 1,
-0.2491165, -2.077981, -3.210755, 0, 1, 0.5450981, 1,
-0.2447774, -1.778534, -4.100411, 0, 1, 0.5490196, 1,
-0.2416512, 0.5714989, -0.2996143, 0, 1, 0.5568628, 1,
-0.240769, 0.160799, -0.9605522, 0, 1, 0.5607843, 1,
-0.2396074, 0.3655177, -1.009409, 0, 1, 0.5686275, 1,
-0.2379642, 1.23056, 0.7304071, 0, 1, 0.572549, 1,
-0.237934, 1.519419, -0.110327, 0, 1, 0.5803922, 1,
-0.2347805, -1.214225, -2.8582, 0, 1, 0.5843138, 1,
-0.2266929, 0.7739045, 0.4872217, 0, 1, 0.5921569, 1,
-0.2264611, -0.1198485, -2.496842, 0, 1, 0.5960785, 1,
-0.2251494, -0.04262203, 0.1269473, 0, 1, 0.6039216, 1,
-0.2226036, -0.2111962, -4.050088, 0, 1, 0.6117647, 1,
-0.2199081, 1.836936, -0.3006243, 0, 1, 0.6156863, 1,
-0.2185747, 0.009955012, -2.111655, 0, 1, 0.6235294, 1,
-0.2183062, -0.8432215, -3.135261, 0, 1, 0.627451, 1,
-0.2176576, 0.5179587, -1.237013, 0, 1, 0.6352941, 1,
-0.2093756, 0.1571435, -1.565167, 0, 1, 0.6392157, 1,
-0.2093546, -0.2058666, -3.73553, 0, 1, 0.6470588, 1,
-0.2064737, -2.857071, -2.967036, 0, 1, 0.6509804, 1,
-0.2057176, 0.6044991, -1.629748, 0, 1, 0.6588235, 1,
-0.2034465, -0.04390649, -1.532613, 0, 1, 0.6627451, 1,
-0.1997611, -1.121076, -4.465323, 0, 1, 0.6705883, 1,
-0.1991902, -0.3510936, -3.136518, 0, 1, 0.6745098, 1,
-0.1983998, 0.7773572, -0.7693323, 0, 1, 0.682353, 1,
-0.1979823, -1.090889, -1.730258, 0, 1, 0.6862745, 1,
-0.194236, -1.99284, -3.10432, 0, 1, 0.6941177, 1,
-0.1932008, 0.8147159, -0.4362999, 0, 1, 0.7019608, 1,
-0.1912955, 0.948605, -1.488428, 0, 1, 0.7058824, 1,
-0.1909641, -0.7051422, -1.954493, 0, 1, 0.7137255, 1,
-0.1872794, 0.4267911, -0.7599583, 0, 1, 0.7176471, 1,
-0.183531, 1.125408, 0.1290136, 0, 1, 0.7254902, 1,
-0.1833365, 0.775125, -0.2800196, 0, 1, 0.7294118, 1,
-0.1779075, -2.256103, -2.792828, 0, 1, 0.7372549, 1,
-0.1728474, -1.306163, -4.230962, 0, 1, 0.7411765, 1,
-0.1619672, -0.924246, -3.520094, 0, 1, 0.7490196, 1,
-0.1578479, -0.9585614, -2.314881, 0, 1, 0.7529412, 1,
-0.1571783, 0.6927002, -1.375792, 0, 1, 0.7607843, 1,
-0.1532592, -0.2391501, -2.284814, 0, 1, 0.7647059, 1,
-0.1530393, -2.201481, -1.024323, 0, 1, 0.772549, 1,
-0.1520316, 0.04187677, -2.48552, 0, 1, 0.7764706, 1,
-0.1519619, -0.5117456, -2.502102, 0, 1, 0.7843137, 1,
-0.1516785, 0.1023846, 0.05403046, 0, 1, 0.7882353, 1,
-0.1501602, -0.8784092, -2.700578, 0, 1, 0.7960784, 1,
-0.1484576, -0.4673324, -2.804641, 0, 1, 0.8039216, 1,
-0.1460977, 1.102451, 0.4805441, 0, 1, 0.8078431, 1,
-0.1380236, -1.451798, -4.241659, 0, 1, 0.8156863, 1,
-0.1380057, -0.9489977, -3.818993, 0, 1, 0.8196079, 1,
-0.1363283, -0.08831592, -0.7686556, 0, 1, 0.827451, 1,
-0.1333877, -1.519045, -1.403937, 0, 1, 0.8313726, 1,
-0.1328346, 0.5693845, 2.257548, 0, 1, 0.8392157, 1,
-0.1300573, -0.9055232, -2.904744, 0, 1, 0.8431373, 1,
-0.1295161, -1.628788, -5.183077, 0, 1, 0.8509804, 1,
-0.127433, 0.2926275, -0.9554389, 0, 1, 0.854902, 1,
-0.1204259, 1.780856, 0.104733, 0, 1, 0.8627451, 1,
-0.1198126, -1.139993, -2.870396, 0, 1, 0.8666667, 1,
-0.1139024, -0.1302982, -2.061107, 0, 1, 0.8745098, 1,
-0.1113059, -0.2623203, -2.728661, 0, 1, 0.8784314, 1,
-0.1111025, -1.02909, -4.792247, 0, 1, 0.8862745, 1,
-0.1097738, -1.360706, -3.855111, 0, 1, 0.8901961, 1,
-0.1066318, -1.922366, -4.474893, 0, 1, 0.8980392, 1,
-0.105304, -1.816466, -2.942427, 0, 1, 0.9058824, 1,
-0.1050935, 1.568805, 0.1250714, 0, 1, 0.9098039, 1,
-0.1014153, -1.208537, -2.671745, 0, 1, 0.9176471, 1,
-0.0985151, 0.5204442, 0.7779678, 0, 1, 0.9215686, 1,
-0.09612927, 0.6511035, -1.716814, 0, 1, 0.9294118, 1,
-0.09348066, -2.365297, -3.101044, 0, 1, 0.9333333, 1,
-0.09200713, -0.1436832, -3.174065, 0, 1, 0.9411765, 1,
-0.09165889, -1.579187, -0.8460902, 0, 1, 0.945098, 1,
-0.08904945, 0.5788528, -1.174446, 0, 1, 0.9529412, 1,
-0.08839952, 0.0480045, 0.3073169, 0, 1, 0.9568627, 1,
-0.08757378, 0.225894, 0.7603889, 0, 1, 0.9647059, 1,
-0.0868976, 1.085635, -0.7983416, 0, 1, 0.9686275, 1,
-0.08378024, 0.5082181, -1.627339, 0, 1, 0.9764706, 1,
-0.07537583, 0.3082219, 0.3794944, 0, 1, 0.9803922, 1,
-0.07245196, -0.3642603, -4.430262, 0, 1, 0.9882353, 1,
-0.07180441, 0.370113, -0.1282231, 0, 1, 0.9921569, 1,
-0.06331945, 1.004416, 0.4642203, 0, 1, 1, 1,
-0.06300323, -0.1410389, -3.006897, 0, 0.9921569, 1, 1,
-0.04763164, 0.3856894, -1.48631, 0, 0.9882353, 1, 1,
-0.04670586, 0.02643885, -2.212153, 0, 0.9803922, 1, 1,
-0.04616319, 3.373576, 0.4878694, 0, 0.9764706, 1, 1,
-0.04534492, 1.494914, -0.2651142, 0, 0.9686275, 1, 1,
-0.04252474, -0.6063713, -3.909215, 0, 0.9647059, 1, 1,
-0.04002197, 0.9773894, 1.809045, 0, 0.9568627, 1, 1,
-0.03449977, 0.8557799, -0.6360037, 0, 0.9529412, 1, 1,
-0.03390666, 1.522982, -0.511822, 0, 0.945098, 1, 1,
-0.03070898, 1.430293, 1.07415, 0, 0.9411765, 1, 1,
-0.0300529, 0.3798907, 1.116894, 0, 0.9333333, 1, 1,
-0.02319051, 0.7129554, 0.3162622, 0, 0.9294118, 1, 1,
-0.02175148, -0.1173679, -2.926547, 0, 0.9215686, 1, 1,
-0.02034369, 0.7096797, 0.2929964, 0, 0.9176471, 1, 1,
-0.0202003, -0.1220603, -2.115745, 0, 0.9098039, 1, 1,
-0.02017495, 0.6780747, 1.032643, 0, 0.9058824, 1, 1,
-0.01802935, -0.1727121, -3.638911, 0, 0.8980392, 1, 1,
-0.01512107, -1.145085, -2.637423, 0, 0.8901961, 1, 1,
-0.01350196, 0.2184893, -0.4244249, 0, 0.8862745, 1, 1,
-0.01290955, -0.06794915, -3.317601, 0, 0.8784314, 1, 1,
-0.01209639, 0.7454367, -1.026227, 0, 0.8745098, 1, 1,
-0.01086296, 1.027991, 0.3615313, 0, 0.8666667, 1, 1,
-0.008150621, 0.4561463, 0.4265085, 0, 0.8627451, 1, 1,
-0.007128137, -1.389687, -4.340312, 0, 0.854902, 1, 1,
-0.005383086, -0.1326686, -3.29374, 0, 0.8509804, 1, 1,
-0.004935359, 0.3755576, 0.5099524, 0, 0.8431373, 1, 1,
-0.00299789, -1.499027, -2.742915, 0, 0.8392157, 1, 1,
0.001439771, 1.523139, -1.144799, 0, 0.8313726, 1, 1,
0.001822111, -0.1222267, 3.737595, 0, 0.827451, 1, 1,
0.001900107, -0.396976, 4.006242, 0, 0.8196079, 1, 1,
0.00475499, -1.147588, 2.296226, 0, 0.8156863, 1, 1,
0.006089, 1.386749, 0.6378821, 0, 0.8078431, 1, 1,
0.008251744, 0.3856494, 0.5531333, 0, 0.8039216, 1, 1,
0.01156366, 0.2371128, 0.0548068, 0, 0.7960784, 1, 1,
0.01215898, 0.6693066, -0.4187277, 0, 0.7882353, 1, 1,
0.01970329, 0.7976983, -0.5770739, 0, 0.7843137, 1, 1,
0.02115136, -0.09213264, 4.759669, 0, 0.7764706, 1, 1,
0.02385967, -1.250308, 2.022858, 0, 0.772549, 1, 1,
0.02405908, -1.254533, 3.043683, 0, 0.7647059, 1, 1,
0.02554276, -0.41679, 1.58318, 0, 0.7607843, 1, 1,
0.02716984, -1.285205, 2.531537, 0, 0.7529412, 1, 1,
0.02744664, 0.5671616, -1.100801, 0, 0.7490196, 1, 1,
0.02922389, -0.4372293, 1.291916, 0, 0.7411765, 1, 1,
0.03015129, 0.1460208, 0.6890887, 0, 0.7372549, 1, 1,
0.03139733, -0.5532663, 1.174903, 0, 0.7294118, 1, 1,
0.03395239, 2.290673, 1.949781, 0, 0.7254902, 1, 1,
0.03631704, -0.6242968, 4.117542, 0, 0.7176471, 1, 1,
0.03638912, 1.497186, 0.9016597, 0, 0.7137255, 1, 1,
0.03736205, -1.554313, 2.929521, 0, 0.7058824, 1, 1,
0.0383725, 0.504907, -0.6759542, 0, 0.6980392, 1, 1,
0.03873889, 0.9307261, 0.6683927, 0, 0.6941177, 1, 1,
0.04015579, 0.4137302, 0.7350758, 0, 0.6862745, 1, 1,
0.0413898, 1.204855, -2.388227, 0, 0.682353, 1, 1,
0.04549451, -0.6525064, 1.657711, 0, 0.6745098, 1, 1,
0.04781923, -0.06577059, 2.147975, 0, 0.6705883, 1, 1,
0.05250807, -0.520942, 3.928321, 0, 0.6627451, 1, 1,
0.05884551, -0.2508808, 3.491257, 0, 0.6588235, 1, 1,
0.06632183, 0.3322937, 1.018831, 0, 0.6509804, 1, 1,
0.06812778, 0.3893048, 1.4038, 0, 0.6470588, 1, 1,
0.06831943, -0.6202795, 4.232407, 0, 0.6392157, 1, 1,
0.07010632, -0.1631385, 1.342374, 0, 0.6352941, 1, 1,
0.07247186, -0.121794, 0.7312032, 0, 0.627451, 1, 1,
0.08377372, -0.06264655, 4.793264, 0, 0.6235294, 1, 1,
0.0910917, -0.6888385, 3.178083, 0, 0.6156863, 1, 1,
0.09240704, 0.4501161, -0.1659678, 0, 0.6117647, 1, 1,
0.09321199, -0.363142, 3.282357, 0, 0.6039216, 1, 1,
0.09501534, -0.3160292, 2.501984, 0, 0.5960785, 1, 1,
0.09549773, -0.0412974, 3.996828, 0, 0.5921569, 1, 1,
0.09654157, -1.438375, 3.628754, 0, 0.5843138, 1, 1,
0.09912347, 0.3804012, -0.5541048, 0, 0.5803922, 1, 1,
0.1032807, 0.4065817, -1.282601, 0, 0.572549, 1, 1,
0.1045097, 0.1220253, 0.744291, 0, 0.5686275, 1, 1,
0.1137862, -0.1776205, 1.585588, 0, 0.5607843, 1, 1,
0.1185983, 0.3798069, -0.9327433, 0, 0.5568628, 1, 1,
0.1216685, -0.2531725, 2.880579, 0, 0.5490196, 1, 1,
0.1224791, 0.8397063, 1.225552, 0, 0.5450981, 1, 1,
0.1228122, -0.9304147, 5.497722, 0, 0.5372549, 1, 1,
0.1258821, -0.754694, 3.684713, 0, 0.5333334, 1, 1,
0.1270183, 0.09215132, 1.060333, 0, 0.5254902, 1, 1,
0.1277552, -0.6364014, 3.510918, 0, 0.5215687, 1, 1,
0.1287109, 0.9348232, 0.3221084, 0, 0.5137255, 1, 1,
0.1302099, -0.2527432, 3.071362, 0, 0.509804, 1, 1,
0.133266, 0.1818537, 1.170085, 0, 0.5019608, 1, 1,
0.1333426, -0.5105323, 2.804719, 0, 0.4941176, 1, 1,
0.1343627, -0.9448383, 2.291057, 0, 0.4901961, 1, 1,
0.1356934, 1.196503, -0.2671311, 0, 0.4823529, 1, 1,
0.1378973, -1.297824, 3.634723, 0, 0.4784314, 1, 1,
0.1403527, -1.111073, 3.420218, 0, 0.4705882, 1, 1,
0.1404323, -0.09045572, 3.269383, 0, 0.4666667, 1, 1,
0.1407362, -0.312145, 4.028303, 0, 0.4588235, 1, 1,
0.1455286, -0.8825931, 0.7791119, 0, 0.454902, 1, 1,
0.1539321, 1.780924, -1.239811, 0, 0.4470588, 1, 1,
0.1611853, 0.1904144, 0.3423886, 0, 0.4431373, 1, 1,
0.1634721, -0.02015203, 1.819155, 0, 0.4352941, 1, 1,
0.166045, 0.3632852, 1.148678, 0, 0.4313726, 1, 1,
0.1700171, -0.9426773, 1.665555, 0, 0.4235294, 1, 1,
0.1707263, 1.336873, -0.762127, 0, 0.4196078, 1, 1,
0.1746946, 1.24212, 1.908467, 0, 0.4117647, 1, 1,
0.1808708, 0.5828479, 0.5391145, 0, 0.4078431, 1, 1,
0.185279, 1.533969, 1.014435, 0, 0.4, 1, 1,
0.1898056, -0.4860732, 3.796134, 0, 0.3921569, 1, 1,
0.1927765, -0.2817931, 2.310758, 0, 0.3882353, 1, 1,
0.19615, 1.249432, 2.233289, 0, 0.3803922, 1, 1,
0.1992915, 0.3387068, 3.356838, 0, 0.3764706, 1, 1,
0.2005002, -0.9037688, 2.134902, 0, 0.3686275, 1, 1,
0.2005611, 0.1693805, -0.7434137, 0, 0.3647059, 1, 1,
0.2008656, 1.169851, 0.9468585, 0, 0.3568628, 1, 1,
0.2016069, -0.7504461, 3.235577, 0, 0.3529412, 1, 1,
0.2032186, -0.408873, 4.003762, 0, 0.345098, 1, 1,
0.2036943, 0.7138587, 0.5032403, 0, 0.3411765, 1, 1,
0.2062061, 0.948905, 1.302679, 0, 0.3333333, 1, 1,
0.2073652, 0.4178682, 1.785117, 0, 0.3294118, 1, 1,
0.2091591, 0.08410057, 1.483436, 0, 0.3215686, 1, 1,
0.2112157, 0.1470098, 0.9717829, 0, 0.3176471, 1, 1,
0.2121686, -0.6541573, 1.406609, 0, 0.3098039, 1, 1,
0.2123342, 0.02255043, 1.528992, 0, 0.3058824, 1, 1,
0.2131979, -0.5981816, 4.035066, 0, 0.2980392, 1, 1,
0.2136481, -0.7505736, 1.543978, 0, 0.2901961, 1, 1,
0.2158718, 0.8101737, -0.7377335, 0, 0.2862745, 1, 1,
0.216244, 1.660375, 0.9816855, 0, 0.2784314, 1, 1,
0.217609, -0.2032827, 2.023601, 0, 0.2745098, 1, 1,
0.2215352, -0.2450249, 1.240075, 0, 0.2666667, 1, 1,
0.2222234, 0.7565002, -0.714949, 0, 0.2627451, 1, 1,
0.222631, -0.06245564, -0.3105263, 0, 0.254902, 1, 1,
0.2239431, 0.2833692, 0.456952, 0, 0.2509804, 1, 1,
0.2241072, 0.2878034, -0.3744789, 0, 0.2431373, 1, 1,
0.2272466, 0.2175468, -0.3537595, 0, 0.2392157, 1, 1,
0.237114, 0.07804286, 1.242745, 0, 0.2313726, 1, 1,
0.2375654, 1.18138, -2.472338, 0, 0.227451, 1, 1,
0.2381149, 0.7585453, -0.791261, 0, 0.2196078, 1, 1,
0.2390234, 0.08037173, 3.243991, 0, 0.2156863, 1, 1,
0.2426826, -0.4189075, 2.993066, 0, 0.2078431, 1, 1,
0.2465487, 0.6129365, 0.9250704, 0, 0.2039216, 1, 1,
0.2494225, 0.4448469, -0.3622868, 0, 0.1960784, 1, 1,
0.2561414, 0.3248326, 0.1147127, 0, 0.1882353, 1, 1,
0.2612581, 1.174411, 0.5803521, 0, 0.1843137, 1, 1,
0.2620513, 0.2767048, 2.318058, 0, 0.1764706, 1, 1,
0.2664919, -1.156243, 1.874448, 0, 0.172549, 1, 1,
0.2709772, -1.150108, 4.600288, 0, 0.1647059, 1, 1,
0.2719644, 1.272252, -0.204916, 0, 0.1607843, 1, 1,
0.2802444, -0.2005728, 3.339304, 0, 0.1529412, 1, 1,
0.2869912, -0.329933, 1.896995, 0, 0.1490196, 1, 1,
0.2880134, -1.887361, 2.288189, 0, 0.1411765, 1, 1,
0.2881711, -0.06095151, 2.724349, 0, 0.1372549, 1, 1,
0.2936889, -0.6539353, 4.754735, 0, 0.1294118, 1, 1,
0.2981188, -1.4858, 3.38737, 0, 0.1254902, 1, 1,
0.299205, 0.100321, 0.8726408, 0, 0.1176471, 1, 1,
0.3098396, -0.2141846, 2.041798, 0, 0.1137255, 1, 1,
0.3104985, -0.07063231, 1.768138, 0, 0.1058824, 1, 1,
0.3109576, -1.572599, 2.251343, 0, 0.09803922, 1, 1,
0.3117874, 1.351367, 0.9521028, 0, 0.09411765, 1, 1,
0.3164709, 1.014745, -0.9096282, 0, 0.08627451, 1, 1,
0.3194497, -1.156995, 4.393678, 0, 0.08235294, 1, 1,
0.3218955, -0.5634756, 2.357969, 0, 0.07450981, 1, 1,
0.3218976, -0.9738916, 3.922617, 0, 0.07058824, 1, 1,
0.3232433, 0.2987081, 1.061417, 0, 0.0627451, 1, 1,
0.3284472, 0.787524, 0.9479599, 0, 0.05882353, 1, 1,
0.329628, -0.6812182, 2.521721, 0, 0.05098039, 1, 1,
0.3349442, 0.02410054, 1.29653, 0, 0.04705882, 1, 1,
0.3353428, 0.01130825, 3.821313, 0, 0.03921569, 1, 1,
0.3419065, -1.734633, 4.998185, 0, 0.03529412, 1, 1,
0.3422435, 2.619225, -0.8232727, 0, 0.02745098, 1, 1,
0.3468496, -0.3609473, 1.913976, 0, 0.02352941, 1, 1,
0.3516802, -0.6298749, 2.688494, 0, 0.01568628, 1, 1,
0.3524792, 0.1756227, 2.524852, 0, 0.01176471, 1, 1,
0.3581079, -0.006267056, 2.622195, 0, 0.003921569, 1, 1,
0.3592725, 0.3730445, 2.104396, 0.003921569, 0, 1, 1,
0.3601741, -0.3672674, 0.6166195, 0.007843138, 0, 1, 1,
0.3617179, 1.523958, 0.7718937, 0.01568628, 0, 1, 1,
0.3626975, -1.75674, 3.349419, 0.01960784, 0, 1, 1,
0.3678992, -2.103799, 2.848852, 0.02745098, 0, 1, 1,
0.3739144, 1.374582, 0.8936216, 0.03137255, 0, 1, 1,
0.3740781, -0.9819763, 3.516125, 0.03921569, 0, 1, 1,
0.3775298, 0.07159422, 1.90679, 0.04313726, 0, 1, 1,
0.3819162, 0.9539334, 0.8166354, 0.05098039, 0, 1, 1,
0.388146, -0.05605183, 1.508422, 0.05490196, 0, 1, 1,
0.3914463, 0.2239004, 1.515917, 0.0627451, 0, 1, 1,
0.3972581, 0.4428895, 1.440139, 0.06666667, 0, 1, 1,
0.3986459, -0.9653715, 3.392389, 0.07450981, 0, 1, 1,
0.4009299, 0.1239295, 2.243129, 0.07843138, 0, 1, 1,
0.4009928, -1.038612, 3.45171, 0.08627451, 0, 1, 1,
0.4085148, 0.4135575, 0.4443613, 0.09019608, 0, 1, 1,
0.4115518, 0.01248283, 0.8737583, 0.09803922, 0, 1, 1,
0.4207539, -1.154803, 3.835054, 0.1058824, 0, 1, 1,
0.4220992, -0.9592741, 1.144711, 0.1098039, 0, 1, 1,
0.4272486, 1.454087, 2.173753, 0.1176471, 0, 1, 1,
0.433009, -0.1152185, 3.065579, 0.1215686, 0, 1, 1,
0.4429061, -0.05678564, 2.066772, 0.1294118, 0, 1, 1,
0.4496165, -0.02740901, 0.8678731, 0.1333333, 0, 1, 1,
0.4500914, -0.7436295, 1.322528, 0.1411765, 0, 1, 1,
0.4514266, -0.6407665, 2.177801, 0.145098, 0, 1, 1,
0.4527661, -0.8931282, 3.053978, 0.1529412, 0, 1, 1,
0.4600238, -1.581224, 1.932904, 0.1568628, 0, 1, 1,
0.4643082, -1.817769, 2.583593, 0.1647059, 0, 1, 1,
0.475982, -0.1153643, 1.680943, 0.1686275, 0, 1, 1,
0.493247, -0.6567062, 1.579329, 0.1764706, 0, 1, 1,
0.5006297, 1.047236, 0.8738359, 0.1803922, 0, 1, 1,
0.5021943, -1.070892, 2.495421, 0.1882353, 0, 1, 1,
0.502694, -1.693257, 2.354909, 0.1921569, 0, 1, 1,
0.5047296, 0.8818955, 0.2160792, 0.2, 0, 1, 1,
0.5048428, 0.6463543, 0.6026714, 0.2078431, 0, 1, 1,
0.5080429, 1.155457, 0.5654728, 0.2117647, 0, 1, 1,
0.5086707, -1.42209, 2.620528, 0.2196078, 0, 1, 1,
0.513019, 1.646175, 0.9121783, 0.2235294, 0, 1, 1,
0.5148622, 0.1143773, 0.8126589, 0.2313726, 0, 1, 1,
0.5189473, 0.7715172, -1.944844, 0.2352941, 0, 1, 1,
0.5227686, -0.8598327, 3.654981, 0.2431373, 0, 1, 1,
0.5261263, 0.7003981, 1.205749, 0.2470588, 0, 1, 1,
0.5319965, 0.6959414, -0.6839294, 0.254902, 0, 1, 1,
0.5377349, -0.7839925, 2.154118, 0.2588235, 0, 1, 1,
0.5428768, 0.5819009, 1.011798, 0.2666667, 0, 1, 1,
0.5464535, 1.056628, 1.554531, 0.2705882, 0, 1, 1,
0.552915, 0.3136729, -1.16676, 0.2784314, 0, 1, 1,
0.5563934, -1.456666, 3.919999, 0.282353, 0, 1, 1,
0.5657635, -0.7933272, 2.262197, 0.2901961, 0, 1, 1,
0.5673465, -0.05170004, 1.778944, 0.2941177, 0, 1, 1,
0.5704321, 1.202633, 1.044504, 0.3019608, 0, 1, 1,
0.5716162, -0.1735109, 2.141326, 0.3098039, 0, 1, 1,
0.5735171, -0.2597858, 3.952529, 0.3137255, 0, 1, 1,
0.576111, -0.5037684, 3.365782, 0.3215686, 0, 1, 1,
0.5780679, -0.4128329, 2.544354, 0.3254902, 0, 1, 1,
0.5808015, -0.7472937, 3.010846, 0.3333333, 0, 1, 1,
0.5891459, 0.5443188, 0.5581878, 0.3372549, 0, 1, 1,
0.5915083, 1.12173, 2.064826, 0.345098, 0, 1, 1,
0.5923356, 2.023291, 0.2626719, 0.3490196, 0, 1, 1,
0.5934649, -1.21491, 1.937162, 0.3568628, 0, 1, 1,
0.5954211, -0.2665424, 1.635574, 0.3607843, 0, 1, 1,
0.598187, -0.3180676, 1.724076, 0.3686275, 0, 1, 1,
0.601015, 0.3948374, 0.922012, 0.372549, 0, 1, 1,
0.602747, 1.617937, 1.141315, 0.3803922, 0, 1, 1,
0.6059859, -2.485052, 0.8139364, 0.3843137, 0, 1, 1,
0.6071324, 1.108448, 0.6462908, 0.3921569, 0, 1, 1,
0.6108004, 0.3370216, 1.352103, 0.3960784, 0, 1, 1,
0.6146201, -0.8652265, 3.487395, 0.4039216, 0, 1, 1,
0.6167922, -0.04100157, 1.953267, 0.4117647, 0, 1, 1,
0.6197673, -0.3415015, 1.342872, 0.4156863, 0, 1, 1,
0.6198021, -0.07135132, 0.8404538, 0.4235294, 0, 1, 1,
0.6265915, 0.6165327, 1.977935, 0.427451, 0, 1, 1,
0.6298717, 1.238484, 1.382283, 0.4352941, 0, 1, 1,
0.6332318, 1.09724, 0.1326272, 0.4392157, 0, 1, 1,
0.6418685, -0.6599547, 1.259777, 0.4470588, 0, 1, 1,
0.6509808, 0.7662839, -0.02827724, 0.4509804, 0, 1, 1,
0.6553895, 1.187388, 2.246943, 0.4588235, 0, 1, 1,
0.6582169, -0.3863413, 2.803757, 0.4627451, 0, 1, 1,
0.6596894, -1.907404, 5.093207, 0.4705882, 0, 1, 1,
0.6653063, 0.3052891, 0.6231002, 0.4745098, 0, 1, 1,
0.6717041, -0.06237464, 0.7412844, 0.4823529, 0, 1, 1,
0.6761262, -0.3786565, 3.535855, 0.4862745, 0, 1, 1,
0.6765283, 1.280311, 1.519246, 0.4941176, 0, 1, 1,
0.6777043, -0.2297306, 1.173143, 0.5019608, 0, 1, 1,
0.6780562, 0.03607367, 2.117894, 0.5058824, 0, 1, 1,
0.6823416, 0.8014997, -1.18515, 0.5137255, 0, 1, 1,
0.6827267, 0.2011745, -0.3843988, 0.5176471, 0, 1, 1,
0.6828408, 0.7846527, 2.102972, 0.5254902, 0, 1, 1,
0.6847995, 0.6184058, 1.403534, 0.5294118, 0, 1, 1,
0.6854708, 2.767043, -0.9951701, 0.5372549, 0, 1, 1,
0.6884003, 0.2380642, 0.339479, 0.5411765, 0, 1, 1,
0.6892035, -0.6366655, 0.8024449, 0.5490196, 0, 1, 1,
0.6901839, -0.2928739, 2.18241, 0.5529412, 0, 1, 1,
0.6906694, 1.65185, 1.256809, 0.5607843, 0, 1, 1,
0.6929125, 0.9957509, -0.8436759, 0.5647059, 0, 1, 1,
0.6960329, 0.6741809, 1.561129, 0.572549, 0, 1, 1,
0.6986939, -1.395936, 1.957781, 0.5764706, 0, 1, 1,
0.7002152, 0.8734697, 0.2295445, 0.5843138, 0, 1, 1,
0.7033709, 0.5105354, 0.5895743, 0.5882353, 0, 1, 1,
0.7041481, -0.6933655, 1.349136, 0.5960785, 0, 1, 1,
0.7085102, 0.6766264, 0.2199948, 0.6039216, 0, 1, 1,
0.7126909, -3.92005, 3.185826, 0.6078432, 0, 1, 1,
0.7136382, -0.9560462, 2.982506, 0.6156863, 0, 1, 1,
0.7177428, 0.3594771, 0.7061989, 0.6196079, 0, 1, 1,
0.7185965, -0.7586194, 3.950646, 0.627451, 0, 1, 1,
0.7256253, 0.5878475, 1.848276, 0.6313726, 0, 1, 1,
0.7285035, 0.6285932, 1.501191, 0.6392157, 0, 1, 1,
0.7307406, 0.1750208, 0.8553097, 0.6431373, 0, 1, 1,
0.7354934, -1.673787, 2.499852, 0.6509804, 0, 1, 1,
0.7367019, 0.2866304, 1.70558, 0.654902, 0, 1, 1,
0.7452297, -0.2512482, 1.494036, 0.6627451, 0, 1, 1,
0.7534289, -1.322042, 3.269413, 0.6666667, 0, 1, 1,
0.7535035, 0.644972, 1.914884, 0.6745098, 0, 1, 1,
0.7542185, -0.14875, 2.069506, 0.6784314, 0, 1, 1,
0.7558546, 0.3739411, 0.9982823, 0.6862745, 0, 1, 1,
0.7589343, -0.6987232, 1.901743, 0.6901961, 0, 1, 1,
0.7610604, -0.7915776, 1.955196, 0.6980392, 0, 1, 1,
0.767957, -1.436192, 3.010114, 0.7058824, 0, 1, 1,
0.7735087, -2.466658, 2.658931, 0.7098039, 0, 1, 1,
0.7740325, -0.05095643, 3.035433, 0.7176471, 0, 1, 1,
0.7745748, -1.222232, 2.876716, 0.7215686, 0, 1, 1,
0.7767173, 1.232519, 2.122911, 0.7294118, 0, 1, 1,
0.7831191, -0.3727483, 2.031497, 0.7333333, 0, 1, 1,
0.7841207, 0.1315457, -0.424477, 0.7411765, 0, 1, 1,
0.7873871, -1.257926, 0.1725363, 0.7450981, 0, 1, 1,
0.7880691, 1.68843, 0.9310404, 0.7529412, 0, 1, 1,
0.8065982, 0.2566478, 2.762562, 0.7568628, 0, 1, 1,
0.8118688, 0.3837799, 0.7635702, 0.7647059, 0, 1, 1,
0.8147708, 0.8551687, 0.4951646, 0.7686275, 0, 1, 1,
0.8191449, 0.7569885, 1.429356, 0.7764706, 0, 1, 1,
0.8204005, -2.466794, 5.017652, 0.7803922, 0, 1, 1,
0.8298869, -0.6986921, 1.46424, 0.7882353, 0, 1, 1,
0.8386601, -0.2288477, 2.348711, 0.7921569, 0, 1, 1,
0.8389411, 0.6400553, 0.2192787, 0.8, 0, 1, 1,
0.8421453, 0.31608, 0.8918681, 0.8078431, 0, 1, 1,
0.8433992, 1.213714, 0.4115372, 0.8117647, 0, 1, 1,
0.8502213, -1.107376, 2.977756, 0.8196079, 0, 1, 1,
0.8514979, 1.114076, 1.673303, 0.8235294, 0, 1, 1,
0.8560652, 0.3633422, 2.666859, 0.8313726, 0, 1, 1,
0.8568453, 1.102114, 0.8892252, 0.8352941, 0, 1, 1,
0.8570538, -0.1812729, -0.02546895, 0.8431373, 0, 1, 1,
0.8602443, -0.8765898, 1.376612, 0.8470588, 0, 1, 1,
0.8659397, -0.3969004, 3.336617, 0.854902, 0, 1, 1,
0.8673575, 1.236975, 0.1157575, 0.8588235, 0, 1, 1,
0.8678054, -0.02852448, 0.647392, 0.8666667, 0, 1, 1,
0.8694332, 0.7718127, 1.279218, 0.8705882, 0, 1, 1,
0.8728023, -1.022982, 3.099751, 0.8784314, 0, 1, 1,
0.8757261, -0.7687691, 2.236088, 0.8823529, 0, 1, 1,
0.8762965, 0.74944, 1.125749, 0.8901961, 0, 1, 1,
0.8788551, 0.03781555, 0.7528183, 0.8941177, 0, 1, 1,
0.8825001, -0.7324632, 1.126313, 0.9019608, 0, 1, 1,
0.8851733, 0.1472007, 1.966876, 0.9098039, 0, 1, 1,
0.8894554, -0.6894923, 2.470286, 0.9137255, 0, 1, 1,
0.8914617, -1.306069, 1.432998, 0.9215686, 0, 1, 1,
0.8918246, -0.4533919, 1.14116, 0.9254902, 0, 1, 1,
0.8963963, -0.8962833, 4.50764, 0.9333333, 0, 1, 1,
0.9144747, 0.5441507, 2.960565, 0.9372549, 0, 1, 1,
0.9160221, 2.344553, 0.3754928, 0.945098, 0, 1, 1,
0.9191316, -0.3565772, 2.033785, 0.9490196, 0, 1, 1,
0.9245219, -0.9737669, 1.01256, 0.9568627, 0, 1, 1,
0.930559, 1.645407, 1.72898, 0.9607843, 0, 1, 1,
0.9318152, -0.09388895, 0.06874945, 0.9686275, 0, 1, 1,
0.9406083, -0.9215582, 0.291812, 0.972549, 0, 1, 1,
0.947849, 0.1593405, 0.447862, 0.9803922, 0, 1, 1,
0.9488929, 0.4857056, -0.4368935, 0.9843137, 0, 1, 1,
0.9513558, 0.5503583, 1.314342, 0.9921569, 0, 1, 1,
0.95279, -1.096555, 1.334074, 0.9960784, 0, 1, 1,
0.9530043, -0.3392266, 1.396298, 1, 0, 0.9960784, 1,
0.9614954, 2.509971, -2.034812, 1, 0, 0.9882353, 1,
0.9651636, 0.5321488, 2.091114, 1, 0, 0.9843137, 1,
0.9672741, -1.324396, 1.691888, 1, 0, 0.9764706, 1,
0.9687276, -1.613679, 2.506728, 1, 0, 0.972549, 1,
0.9833069, -0.006259813, 0.04899316, 1, 0, 0.9647059, 1,
0.9863404, 0.05881041, 0.6283283, 1, 0, 0.9607843, 1,
0.9891286, -0.5902666, 3.039829, 1, 0, 0.9529412, 1,
0.9893252, -0.9282628, 3.549088, 1, 0, 0.9490196, 1,
0.9908139, -0.9280148, 0.7650598, 1, 0, 0.9411765, 1,
0.9958926, -1.353133, 3.093807, 1, 0, 0.9372549, 1,
1.001659, -0.1095903, -0.3898924, 1, 0, 0.9294118, 1,
1.002766, 1.134868, 1.094468, 1, 0, 0.9254902, 1,
1.009406, 1.15433, -1.142758, 1, 0, 0.9176471, 1,
1.009443, -1.521581, 0.3364275, 1, 0, 0.9137255, 1,
1.01662, 0.5778096, 1.31128, 1, 0, 0.9058824, 1,
1.017475, 1.159069, 1.171688, 1, 0, 0.9019608, 1,
1.017689, -0.8261386, -0.2610879, 1, 0, 0.8941177, 1,
1.024041, 1.097732, -1.722796, 1, 0, 0.8862745, 1,
1.028526, -1.115184, 2.093247, 1, 0, 0.8823529, 1,
1.030402, 1.411389, -2.200911, 1, 0, 0.8745098, 1,
1.030644, 0.2297265, 0.03702685, 1, 0, 0.8705882, 1,
1.041508, 1.022907, -1.367726, 1, 0, 0.8627451, 1,
1.042358, 0.8836685, 1.388093, 1, 0, 0.8588235, 1,
1.045499, -1.222235, 3.244569, 1, 0, 0.8509804, 1,
1.048371, 1.816448, 0.09732408, 1, 0, 0.8470588, 1,
1.048613, -1.074364, 1.361623, 1, 0, 0.8392157, 1,
1.049934, -0.5678008, 2.535025, 1, 0, 0.8352941, 1,
1.05211, 0.9373409, 0.5305661, 1, 0, 0.827451, 1,
1.053574, 0.225446, 0.8581949, 1, 0, 0.8235294, 1,
1.05385, 0.9375392, 1.254941, 1, 0, 0.8156863, 1,
1.054634, -0.3355361, 3.325198, 1, 0, 0.8117647, 1,
1.05957, 0.6020126, 1.188795, 1, 0, 0.8039216, 1,
1.064386, -1.166009, 2.387848, 1, 0, 0.7960784, 1,
1.067679, 0.9363658, 0.853555, 1, 0, 0.7921569, 1,
1.068071, 0.3749775, 0.6619941, 1, 0, 0.7843137, 1,
1.070895, -1.079938, 3.6011, 1, 0, 0.7803922, 1,
1.077282, -1.940165, 3.440085, 1, 0, 0.772549, 1,
1.086369, 0.3610015, 1.132906, 1, 0, 0.7686275, 1,
1.088991, -0.9507554, 3.247979, 1, 0, 0.7607843, 1,
1.090465, -0.150879, 1.75474, 1, 0, 0.7568628, 1,
1.092167, 0.03034992, 2.809298, 1, 0, 0.7490196, 1,
1.105522, 2.751787, 0.1886503, 1, 0, 0.7450981, 1,
1.113814, 0.8333927, 1.077483, 1, 0, 0.7372549, 1,
1.130503, -0.100209, 3.267566, 1, 0, 0.7333333, 1,
1.132081, 0.6903927, 0.428034, 1, 0, 0.7254902, 1,
1.13894, -1.509366, 1.21831, 1, 0, 0.7215686, 1,
1.149948, 1.275799, 0.9546378, 1, 0, 0.7137255, 1,
1.166291, 0.4957039, 0.8323622, 1, 0, 0.7098039, 1,
1.170195, -1.872756, 3.151789, 1, 0, 0.7019608, 1,
1.184451, 0.3175521, 1.367237, 1, 0, 0.6941177, 1,
1.186583, -0.02599838, 0.7382704, 1, 0, 0.6901961, 1,
1.190701, 0.4555567, 2.000988, 1, 0, 0.682353, 1,
1.190954, 0.590447, 0.2782091, 1, 0, 0.6784314, 1,
1.192654, 1.158835, 0.6532168, 1, 0, 0.6705883, 1,
1.199057, -0.5000248, 2.769581, 1, 0, 0.6666667, 1,
1.208606, 1.497736, -0.9453632, 1, 0, 0.6588235, 1,
1.209076, -0.4332708, 0.3602642, 1, 0, 0.654902, 1,
1.217315, -0.3407969, 2.925872, 1, 0, 0.6470588, 1,
1.218912, -0.1940068, 1.865064, 1, 0, 0.6431373, 1,
1.223335, 0.9861312, 1.961136, 1, 0, 0.6352941, 1,
1.225169, -0.6830151, 0.5202775, 1, 0, 0.6313726, 1,
1.227996, 1.216772, 0.6732253, 1, 0, 0.6235294, 1,
1.228141, -0.5446446, 2.023297, 1, 0, 0.6196079, 1,
1.254057, 0.04398675, 3.25343, 1, 0, 0.6117647, 1,
1.259706, 0.8527629, 0.1057129, 1, 0, 0.6078432, 1,
1.272098, -2.287132, 1.963174, 1, 0, 0.6, 1,
1.272926, -0.2007039, 5.01972, 1, 0, 0.5921569, 1,
1.27888, -0.1500001, 0.4971075, 1, 0, 0.5882353, 1,
1.280737, -0.1568503, 1.716575, 1, 0, 0.5803922, 1,
1.285632, 0.7290133, -0.6311966, 1, 0, 0.5764706, 1,
1.289501, -0.01480195, 2.271892, 1, 0, 0.5686275, 1,
1.291885, 0.2396567, 0.5666055, 1, 0, 0.5647059, 1,
1.308161, 0.7970695, -0.135438, 1, 0, 0.5568628, 1,
1.308787, 0.3491995, 2.308029, 1, 0, 0.5529412, 1,
1.309576, 1.094926, -0.5268037, 1, 0, 0.5450981, 1,
1.318502, 0.1862531, 2.469048, 1, 0, 0.5411765, 1,
1.329451, 1.506155, 0.6658981, 1, 0, 0.5333334, 1,
1.331708, -0.0007163861, 1.572121, 1, 0, 0.5294118, 1,
1.338883, -0.6412182, 2.940938, 1, 0, 0.5215687, 1,
1.342287, 1.129422, 0.5664718, 1, 0, 0.5176471, 1,
1.344072, -0.4791333, -0.0003126383, 1, 0, 0.509804, 1,
1.351737, 1.011251, 1.796435, 1, 0, 0.5058824, 1,
1.361377, -2.474292, 2.174965, 1, 0, 0.4980392, 1,
1.369063, -1.27568, 2.585559, 1, 0, 0.4901961, 1,
1.370516, -0.4898171, 1.380212, 1, 0, 0.4862745, 1,
1.37183, 0.2187604, 1.284889, 1, 0, 0.4784314, 1,
1.378006, 1.475881, 0.7252579, 1, 0, 0.4745098, 1,
1.380236, 0.6073937, 2.568586, 1, 0, 0.4666667, 1,
1.383285, 0.3064365, 0.6757076, 1, 0, 0.4627451, 1,
1.387672, -0.8226653, 1.436312, 1, 0, 0.454902, 1,
1.391268, 1.404944, 1.157132, 1, 0, 0.4509804, 1,
1.395203, 0.8787261, 0.643593, 1, 0, 0.4431373, 1,
1.397664, 0.8863036, 1.795662, 1, 0, 0.4392157, 1,
1.437878, 0.01486336, 2.27236, 1, 0, 0.4313726, 1,
1.439969, -0.2984674, 2.996455, 1, 0, 0.427451, 1,
1.445944, -0.3655306, 2.394696, 1, 0, 0.4196078, 1,
1.447587, 0.8795845, 0.2219987, 1, 0, 0.4156863, 1,
1.448254, -1.989612, 3.95836, 1, 0, 0.4078431, 1,
1.455714, 1.071276, 1.418273, 1, 0, 0.4039216, 1,
1.471061, 0.2332809, 3.266234, 1, 0, 0.3960784, 1,
1.471803, 0.4434681, 2.08055, 1, 0, 0.3882353, 1,
1.479424, -2.129691, 2.965391, 1, 0, 0.3843137, 1,
1.484192, -0.6154131, 3.516275, 1, 0, 0.3764706, 1,
1.485871, 1.249151, 1.711062, 1, 0, 0.372549, 1,
1.495066, 0.4938098, 0.6343514, 1, 0, 0.3647059, 1,
1.514605, -0.639012, 2.28256, 1, 0, 0.3607843, 1,
1.51612, 0.3332595, 2.404218, 1, 0, 0.3529412, 1,
1.51614, 1.966035, 1.805175, 1, 0, 0.3490196, 1,
1.518839, 1.254765, 1.427487, 1, 0, 0.3411765, 1,
1.522925, -1.157707, 1.929531, 1, 0, 0.3372549, 1,
1.534922, -1.203332, 0.4747877, 1, 0, 0.3294118, 1,
1.537516, 0.9127337, 2.811537, 1, 0, 0.3254902, 1,
1.545207, 0.3317375, -0.1360214, 1, 0, 0.3176471, 1,
1.561388, -0.9771525, 2.29168, 1, 0, 0.3137255, 1,
1.56254, -1.764117, 2.486357, 1, 0, 0.3058824, 1,
1.568631, 0.2636207, -0.4234931, 1, 0, 0.2980392, 1,
1.593555, 1.352076, 1.686125, 1, 0, 0.2941177, 1,
1.619764, -1.17396, 2.29538, 1, 0, 0.2862745, 1,
1.620102, -0.05890269, 1.487354, 1, 0, 0.282353, 1,
1.624494, -2.27184, 2.720716, 1, 0, 0.2745098, 1,
1.641902, -1.336107, 1.224491, 1, 0, 0.2705882, 1,
1.644494, -0.71966, 1.122653, 1, 0, 0.2627451, 1,
1.660483, 0.2963042, 1.750671, 1, 0, 0.2588235, 1,
1.67868, -0.2151571, 0.8383107, 1, 0, 0.2509804, 1,
1.703288, -0.7911322, 2.748626, 1, 0, 0.2470588, 1,
1.719863, -0.3979081, 0.325134, 1, 0, 0.2392157, 1,
1.743084, 0.04131487, 3.224391, 1, 0, 0.2352941, 1,
1.74437, 0.2429209, 2.321657, 1, 0, 0.227451, 1,
1.758106, 0.6407366, 1.194307, 1, 0, 0.2235294, 1,
1.761217, -1.425169, 1.170413, 1, 0, 0.2156863, 1,
1.775571, 0.3493692, 0.05283392, 1, 0, 0.2117647, 1,
1.790441, 0.9626736, 2.775298, 1, 0, 0.2039216, 1,
1.790777, -0.9914562, 0.7488344, 1, 0, 0.1960784, 1,
1.805951, 0.6197664, -0.4832645, 1, 0, 0.1921569, 1,
1.808658, -0.06398634, 2.872848, 1, 0, 0.1843137, 1,
1.811246, -0.1252139, 0.5388061, 1, 0, 0.1803922, 1,
1.819221, -0.7371536, 1.636748, 1, 0, 0.172549, 1,
1.836228, -1.309, 1.553169, 1, 0, 0.1686275, 1,
1.859826, -0.09445833, 0.5240666, 1, 0, 0.1607843, 1,
1.863209, 0.2662796, 0.6998633, 1, 0, 0.1568628, 1,
1.87418, 0.405176, 1.971475, 1, 0, 0.1490196, 1,
1.883666, 0.6110873, 1.300941, 1, 0, 0.145098, 1,
1.890455, -0.5578752, 3.117047, 1, 0, 0.1372549, 1,
1.940582, -0.1319176, 1.887697, 1, 0, 0.1333333, 1,
1.967598, 0.9443282, 1.405823, 1, 0, 0.1254902, 1,
2.002257, -0.3182222, 1.731, 1, 0, 0.1215686, 1,
2.044875, 0.6691583, 2.145141, 1, 0, 0.1137255, 1,
2.099406, 0.1977038, 2.238364, 1, 0, 0.1098039, 1,
2.150173, -1.278125, 3.289427, 1, 0, 0.1019608, 1,
2.183539, 0.07166444, 0.5043839, 1, 0, 0.09411765, 1,
2.280976, 2.963315, 1.63274, 1, 0, 0.09019608, 1,
2.299948, -1.257954, 2.124788, 1, 0, 0.08235294, 1,
2.353335, 0.7919806, 0.2728958, 1, 0, 0.07843138, 1,
2.402656, 1.235244, 2.499797, 1, 0, 0.07058824, 1,
2.414513, 2.510669, 0.08200629, 1, 0, 0.06666667, 1,
2.455651, 1.239182, 0.5056866, 1, 0, 0.05882353, 1,
2.464251, -0.6222886, 1.681214, 1, 0, 0.05490196, 1,
2.483759, 0.602264, 2.224583, 1, 0, 0.04705882, 1,
2.494179, 1.365491, 0.2536486, 1, 0, 0.04313726, 1,
2.610065, 0.5649095, 2.125382, 1, 0, 0.03529412, 1,
2.626916, 0.2541252, 1.04829, 1, 0, 0.03137255, 1,
2.645987, -0.6288244, 0.2883775, 1, 0, 0.02352941, 1,
2.736844, 0.5486473, 2.04866, 1, 0, 0.01960784, 1,
3.082829, 0.9630462, 1.124116, 1, 0, 0.01176471, 1,
3.457555, -0.6040276, 3.197202, 1, 0, 0.007843138, 1
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
0.1367145, -5.15632, -7.003297, 0, -0.5, 0.5, 0.5,
0.1367145, -5.15632, -7.003297, 1, -0.5, 0.5, 0.5,
0.1367145, -5.15632, -7.003297, 1, 1.5, 0.5, 0.5,
0.1367145, -5.15632, -7.003297, 0, 1.5, 0.5, 0.5
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
-4.309891, -0.2732368, -7.003297, 0, -0.5, 0.5, 0.5,
-4.309891, -0.2732368, -7.003297, 1, -0.5, 0.5, 0.5,
-4.309891, -0.2732368, -7.003297, 1, 1.5, 0.5, 0.5,
-4.309891, -0.2732368, -7.003297, 0, 1.5, 0.5, 0.5
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
-4.309891, -5.15632, 0.1531222, 0, -0.5, 0.5, 0.5,
-4.309891, -5.15632, 0.1531222, 1, -0.5, 0.5, 0.5,
-4.309891, -5.15632, 0.1531222, 1, 1.5, 0.5, 0.5,
-4.309891, -5.15632, 0.1531222, 0, 1.5, 0.5, 0.5
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
-3, -4.029454, -5.351816,
3, -4.029454, -5.351816,
-3, -4.029454, -5.351816,
-3, -4.217265, -5.627063,
-2, -4.029454, -5.351816,
-2, -4.217265, -5.627063,
-1, -4.029454, -5.351816,
-1, -4.217265, -5.627063,
0, -4.029454, -5.351816,
0, -4.217265, -5.627063,
1, -4.029454, -5.351816,
1, -4.217265, -5.627063,
2, -4.029454, -5.351816,
2, -4.217265, -5.627063,
3, -4.029454, -5.351816,
3, -4.217265, -5.627063
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
-3, -4.592887, -6.177557, 0, -0.5, 0.5, 0.5,
-3, -4.592887, -6.177557, 1, -0.5, 0.5, 0.5,
-3, -4.592887, -6.177557, 1, 1.5, 0.5, 0.5,
-3, -4.592887, -6.177557, 0, 1.5, 0.5, 0.5,
-2, -4.592887, -6.177557, 0, -0.5, 0.5, 0.5,
-2, -4.592887, -6.177557, 1, -0.5, 0.5, 0.5,
-2, -4.592887, -6.177557, 1, 1.5, 0.5, 0.5,
-2, -4.592887, -6.177557, 0, 1.5, 0.5, 0.5,
-1, -4.592887, -6.177557, 0, -0.5, 0.5, 0.5,
-1, -4.592887, -6.177557, 1, -0.5, 0.5, 0.5,
-1, -4.592887, -6.177557, 1, 1.5, 0.5, 0.5,
-1, -4.592887, -6.177557, 0, 1.5, 0.5, 0.5,
0, -4.592887, -6.177557, 0, -0.5, 0.5, 0.5,
0, -4.592887, -6.177557, 1, -0.5, 0.5, 0.5,
0, -4.592887, -6.177557, 1, 1.5, 0.5, 0.5,
0, -4.592887, -6.177557, 0, 1.5, 0.5, 0.5,
1, -4.592887, -6.177557, 0, -0.5, 0.5, 0.5,
1, -4.592887, -6.177557, 1, -0.5, 0.5, 0.5,
1, -4.592887, -6.177557, 1, 1.5, 0.5, 0.5,
1, -4.592887, -6.177557, 0, 1.5, 0.5, 0.5,
2, -4.592887, -6.177557, 0, -0.5, 0.5, 0.5,
2, -4.592887, -6.177557, 1, -0.5, 0.5, 0.5,
2, -4.592887, -6.177557, 1, 1.5, 0.5, 0.5,
2, -4.592887, -6.177557, 0, 1.5, 0.5, 0.5,
3, -4.592887, -6.177557, 0, -0.5, 0.5, 0.5,
3, -4.592887, -6.177557, 1, -0.5, 0.5, 0.5,
3, -4.592887, -6.177557, 1, 1.5, 0.5, 0.5,
3, -4.592887, -6.177557, 0, 1.5, 0.5, 0.5
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
-3.283751, -2, -5.351816,
-3.283751, 2, -5.351816,
-3.283751, -2, -5.351816,
-3.454774, -2, -5.627063,
-3.283751, 0, -5.351816,
-3.454774, 0, -5.627063,
-3.283751, 2, -5.351816,
-3.454774, 2, -5.627063
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
"0",
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
-3.796821, -2, -6.177557, 0, -0.5, 0.5, 0.5,
-3.796821, -2, -6.177557, 1, -0.5, 0.5, 0.5,
-3.796821, -2, -6.177557, 1, 1.5, 0.5, 0.5,
-3.796821, -2, -6.177557, 0, 1.5, 0.5, 0.5,
-3.796821, 0, -6.177557, 0, -0.5, 0.5, 0.5,
-3.796821, 0, -6.177557, 1, -0.5, 0.5, 0.5,
-3.796821, 0, -6.177557, 1, 1.5, 0.5, 0.5,
-3.796821, 0, -6.177557, 0, 1.5, 0.5, 0.5,
-3.796821, 2, -6.177557, 0, -0.5, 0.5, 0.5,
-3.796821, 2, -6.177557, 1, -0.5, 0.5, 0.5,
-3.796821, 2, -6.177557, 1, 1.5, 0.5, 0.5,
-3.796821, 2, -6.177557, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<3; i++) 
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
8, 9, 10, 8, 10, 11
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
-3.283751, -4.029454, -4,
-3.283751, -4.029454, 4,
-3.283751, -4.029454, -4,
-3.454774, -4.217265, -4,
-3.283751, -4.029454, -2,
-3.454774, -4.217265, -2,
-3.283751, -4.029454, 0,
-3.454774, -4.217265, 0,
-3.283751, -4.029454, 2,
-3.454774, -4.217265, 2,
-3.283751, -4.029454, 4,
-3.454774, -4.217265, 4
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
-3.796821, -4.592887, -4, 0, -0.5, 0.5, 0.5,
-3.796821, -4.592887, -4, 1, -0.5, 0.5, 0.5,
-3.796821, -4.592887, -4, 1, 1.5, 0.5, 0.5,
-3.796821, -4.592887, -4, 0, 1.5, 0.5, 0.5,
-3.796821, -4.592887, -2, 0, -0.5, 0.5, 0.5,
-3.796821, -4.592887, -2, 1, -0.5, 0.5, 0.5,
-3.796821, -4.592887, -2, 1, 1.5, 0.5, 0.5,
-3.796821, -4.592887, -2, 0, 1.5, 0.5, 0.5,
-3.796821, -4.592887, 0, 0, -0.5, 0.5, 0.5,
-3.796821, -4.592887, 0, 1, -0.5, 0.5, 0.5,
-3.796821, -4.592887, 0, 1, 1.5, 0.5, 0.5,
-3.796821, -4.592887, 0, 0, 1.5, 0.5, 0.5,
-3.796821, -4.592887, 2, 0, -0.5, 0.5, 0.5,
-3.796821, -4.592887, 2, 1, -0.5, 0.5, 0.5,
-3.796821, -4.592887, 2, 1, 1.5, 0.5, 0.5,
-3.796821, -4.592887, 2, 0, 1.5, 0.5, 0.5,
-3.796821, -4.592887, 4, 0, -0.5, 0.5, 0.5,
-3.796821, -4.592887, 4, 1, -0.5, 0.5, 0.5,
-3.796821, -4.592887, 4, 1, 1.5, 0.5, 0.5,
-3.796821, -4.592887, 4, 0, 1.5, 0.5, 0.5
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
-3.283751, -4.029454, -5.351816,
-3.283751, 3.482981, -5.351816,
-3.283751, -4.029454, 5.65806,
-3.283751, 3.482981, 5.65806,
-3.283751, -4.029454, -5.351816,
-3.283751, -4.029454, 5.65806,
-3.283751, 3.482981, -5.351816,
-3.283751, 3.482981, 5.65806,
-3.283751, -4.029454, -5.351816,
3.55718, -4.029454, -5.351816,
-3.283751, -4.029454, 5.65806,
3.55718, -4.029454, 5.65806,
-3.283751, 3.482981, -5.351816,
3.55718, 3.482981, -5.351816,
-3.283751, 3.482981, 5.65806,
3.55718, 3.482981, 5.65806,
3.55718, -4.029454, -5.351816,
3.55718, 3.482981, -5.351816,
3.55718, -4.029454, 5.65806,
3.55718, 3.482981, 5.65806,
3.55718, -4.029454, -5.351816,
3.55718, -4.029454, 5.65806,
3.55718, 3.482981, -5.351816,
3.55718, 3.482981, 5.65806
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
var radius = 7.999956;
var distance = 35.59271;
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
mvMatrix.translate( -0.1367145, 0.2732368, -0.1531222 );
mvMatrix.scale( 1.264405, 1.151386, 0.7856318 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.59271);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
Procymidone<-read.table("Procymidone.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Procymidone$V2
```

```
## Error in eval(expr, envir, enclos): object 'Procymidone' not found
```

```r
y<-Procymidone$V3
```

```
## Error in eval(expr, envir, enclos): object 'Procymidone' not found
```

```r
z<-Procymidone$V4
```

```
## Error in eval(expr, envir, enclos): object 'Procymidone' not found
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
-3.184126, 0.5719287, -1.917721, 0, 0, 1, 1, 1,
-2.795849, 0.5074655, -2.385519, 1, 0, 0, 1, 1,
-2.765802, -0.9770947, -0.934182, 1, 0, 0, 1, 1,
-2.677005, -0.24874, -0.4761845, 1, 0, 0, 1, 1,
-2.611583, 0.09330781, -1.649928, 1, 0, 0, 1, 1,
-2.603365, -0.7753826, -1.131408, 1, 0, 0, 1, 1,
-2.53503, 0.4846801, -2.889865, 0, 0, 0, 1, 1,
-2.529946, 0.07882196, -2.554672, 0, 0, 0, 1, 1,
-2.494821, 0.3642086, -1.891387, 0, 0, 0, 1, 1,
-2.484501, -0.877702, -0.8370107, 0, 0, 0, 1, 1,
-2.482473, -0.408702, -2.528822, 0, 0, 0, 1, 1,
-2.364412, -0.2879984, -3.502061, 0, 0, 0, 1, 1,
-2.346318, 1.099003, -2.152415, 0, 0, 0, 1, 1,
-2.331449, -0.5123539, -1.829752, 1, 1, 1, 1, 1,
-2.313162, -0.3041382, 0.8493507, 1, 1, 1, 1, 1,
-2.285861, -2.390056, -2.085664, 1, 1, 1, 1, 1,
-2.284418, 0.6595358, -1.673492, 1, 1, 1, 1, 1,
-2.225749, -0.607044, -1.976911, 1, 1, 1, 1, 1,
-2.22568, 0.002836601, -2.866316, 1, 1, 1, 1, 1,
-2.209579, -0.07500708, -2.073545, 1, 1, 1, 1, 1,
-2.125463, 1.556355, -0.3569234, 1, 1, 1, 1, 1,
-2.113149, 0.8289178, -0.05569777, 1, 1, 1, 1, 1,
-2.103628, -0.4685228, -2.909097, 1, 1, 1, 1, 1,
-2.100157, 0.03065045, -0.8459616, 1, 1, 1, 1, 1,
-2.08781, -1.569288, -3.040235, 1, 1, 1, 1, 1,
-2.082785, 0.883525, -1.595202, 1, 1, 1, 1, 1,
-2.054095, -1.256519, -1.047726, 1, 1, 1, 1, 1,
-2.053034, 0.6098135, -1.215859, 1, 1, 1, 1, 1,
-2.049083, -0.4292938, -1.976878, 0, 0, 1, 1, 1,
-2.031238, -1.393277, -1.019619, 1, 0, 0, 1, 1,
-2.028773, -0.4385075, -1.735764, 1, 0, 0, 1, 1,
-2.012403, -0.01927372, -2.887183, 1, 0, 0, 1, 1,
-2.001462, 0.6404108, -1.075949, 1, 0, 0, 1, 1,
-1.981789, 0.427536, -3.752314, 1, 0, 0, 1, 1,
-1.981549, 0.3425944, -0.4909326, 0, 0, 0, 1, 1,
-1.974642, -1.047888, -2.610442, 0, 0, 0, 1, 1,
-1.966919, 0.3923994, -2.808616, 0, 0, 0, 1, 1,
-1.959149, 0.09270711, -1.02078, 0, 0, 0, 1, 1,
-1.953364, 0.488096, -1.485156, 0, 0, 0, 1, 1,
-1.906199, 0.30499, -2.323056, 0, 0, 0, 1, 1,
-1.889691, 1.535617, 0.09634005, 0, 0, 0, 1, 1,
-1.885602, -1.810841, -1.764358, 1, 1, 1, 1, 1,
-1.884366, 0.2484311, -1.777005, 1, 1, 1, 1, 1,
-1.882684, 0.6814499, -1.331333, 1, 1, 1, 1, 1,
-1.869529, 0.3349559, -0.1626564, 1, 1, 1, 1, 1,
-1.865215, -0.51705, -0.1347847, 1, 1, 1, 1, 1,
-1.860178, -0.2224977, -1.831472, 1, 1, 1, 1, 1,
-1.852744, 1.997391, -0.706383, 1, 1, 1, 1, 1,
-1.84964, 0.6125622, 1.249161, 1, 1, 1, 1, 1,
-1.848964, -1.027643, -1.778626, 1, 1, 1, 1, 1,
-1.84889, -1.47811, -0.4747636, 1, 1, 1, 1, 1,
-1.83682, 0.04976856, -0.9265555, 1, 1, 1, 1, 1,
-1.834579, 0.8545189, -0.1101249, 1, 1, 1, 1, 1,
-1.834573, 1.256578, 0.1441474, 1, 1, 1, 1, 1,
-1.834088, 0.09094517, 0.6754435, 1, 1, 1, 1, 1,
-1.831269, 0.2732831, -1.420174, 1, 1, 1, 1, 1,
-1.825441, -1.450696, -3.633178, 0, 0, 1, 1, 1,
-1.814219, 1.761686, 0.1396376, 1, 0, 0, 1, 1,
-1.81186, -0.8375213, -3.492393, 1, 0, 0, 1, 1,
-1.808345, -0.422246, -1.402937, 1, 0, 0, 1, 1,
-1.760693, -0.8633621, -2.962645, 1, 0, 0, 1, 1,
-1.747987, -0.506098, -0.438593, 1, 0, 0, 1, 1,
-1.716315, 0.1533856, 0.8582988, 0, 0, 0, 1, 1,
-1.715334, -1.389078, -3.440871, 0, 0, 0, 1, 1,
-1.71351, -0.6923988, -2.358267, 0, 0, 0, 1, 1,
-1.703986, 0.7423999, -2.01387, 0, 0, 0, 1, 1,
-1.70092, -1.432686, -1.9515, 0, 0, 0, 1, 1,
-1.695644, 0.3308375, -2.029735, 0, 0, 0, 1, 1,
-1.691706, 0.3333178, -2.426004, 0, 0, 0, 1, 1,
-1.669989, 0.7590756, -0.5848882, 1, 1, 1, 1, 1,
-1.669907, -0.6909378, -1.232062, 1, 1, 1, 1, 1,
-1.662633, -0.6829927, -1.561238, 1, 1, 1, 1, 1,
-1.647002, -0.3412592, -1.40774, 1, 1, 1, 1, 1,
-1.638228, -0.9808916, -3.133606, 1, 1, 1, 1, 1,
-1.635526, -0.5669985, -1.317834, 1, 1, 1, 1, 1,
-1.628919, 0.5182416, -2.338335, 1, 1, 1, 1, 1,
-1.604169, 0.3320469, -1.745999, 1, 1, 1, 1, 1,
-1.598718, 0.4354673, -0.08384074, 1, 1, 1, 1, 1,
-1.597411, 0.2957605, -2.752012, 1, 1, 1, 1, 1,
-1.59613, 0.2031623, -1.235852, 1, 1, 1, 1, 1,
-1.592444, -0.1807823, -1.032467, 1, 1, 1, 1, 1,
-1.591862, -0.7915176, -0.691242, 1, 1, 1, 1, 1,
-1.588827, -0.05466476, -0.6925619, 1, 1, 1, 1, 1,
-1.579178, -0.1854284, -1.914443, 1, 1, 1, 1, 1,
-1.572015, -1.359618, -2.981902, 0, 0, 1, 1, 1,
-1.568976, 0.2024702, -2.496028, 1, 0, 0, 1, 1,
-1.553965, -0.4684567, -0.3611155, 1, 0, 0, 1, 1,
-1.551466, 1.685362, -1.926692, 1, 0, 0, 1, 1,
-1.54929, 1.130447, -1.240985, 1, 0, 0, 1, 1,
-1.512918, 0.9987388, -1.232498, 1, 0, 0, 1, 1,
-1.506679, 0.1467165, -2.142312, 0, 0, 0, 1, 1,
-1.504707, 0.3087873, -1.585874, 0, 0, 0, 1, 1,
-1.496667, -0.2685254, -2.451462, 0, 0, 0, 1, 1,
-1.488159, -0.377214, -0.5192407, 0, 0, 0, 1, 1,
-1.474146, 0.2797579, -2.400464, 0, 0, 0, 1, 1,
-1.472458, -0.147094, -1.889449, 0, 0, 0, 1, 1,
-1.457731, 1.75282, -0.2074355, 0, 0, 0, 1, 1,
-1.445673, -0.169557, -3.293814, 1, 1, 1, 1, 1,
-1.445619, -1.542805, -2.34646, 1, 1, 1, 1, 1,
-1.440057, 0.6799885, -2.095645, 1, 1, 1, 1, 1,
-1.436933, 0.381614, -3.739895, 1, 1, 1, 1, 1,
-1.435309, 0.08881114, -2.556444, 1, 1, 1, 1, 1,
-1.423094, -2.021477, -3.268981, 1, 1, 1, 1, 1,
-1.421061, -0.9032117, -1.915381, 1, 1, 1, 1, 1,
-1.415129, 0.5728769, -0.1056436, 1, 1, 1, 1, 1,
-1.40976, 0.8067938, -1.62336, 1, 1, 1, 1, 1,
-1.401287, -1.313771, -3.211431, 1, 1, 1, 1, 1,
-1.396116, 1.035951, -0.4932022, 1, 1, 1, 1, 1,
-1.386606, 1.541319, -0.3766511, 1, 1, 1, 1, 1,
-1.38153, 0.04234041, -0.2748896, 1, 1, 1, 1, 1,
-1.3563, 0.8536516, -1.589322, 1, 1, 1, 1, 1,
-1.344966, -0.1937761, -1.101504, 1, 1, 1, 1, 1,
-1.3433, -0.0396451, -0.8402321, 0, 0, 1, 1, 1,
-1.336415, -1.300095, -3.29684, 1, 0, 0, 1, 1,
-1.332669, 0.7502504, -1.632083, 1, 0, 0, 1, 1,
-1.332403, 0.8868371, -1.939976, 1, 0, 0, 1, 1,
-1.315972, -0.06770806, -0.6599247, 1, 0, 0, 1, 1,
-1.312907, 0.1147785, -2.332673, 1, 0, 0, 1, 1,
-1.311293, -0.4152947, -1.155096, 0, 0, 0, 1, 1,
-1.292042, 0.9355021, -0.8372229, 0, 0, 0, 1, 1,
-1.292016, 0.708208, -0.2826666, 0, 0, 0, 1, 1,
-1.288186, -0.8756856, -2.083546, 0, 0, 0, 1, 1,
-1.276936, -0.02062462, -0.7346207, 0, 0, 0, 1, 1,
-1.275211, -0.5422294, -1.267362, 0, 0, 0, 1, 1,
-1.273451, 0.6070122, -1.745732, 0, 0, 0, 1, 1,
-1.270725, -1.953582, -1.170771, 1, 1, 1, 1, 1,
-1.263355, -0.2492759, -0.4278184, 1, 1, 1, 1, 1,
-1.25675, 0.4083429, -1.69715, 1, 1, 1, 1, 1,
-1.247553, 1.189847, -0.675359, 1, 1, 1, 1, 1,
-1.231989, -0.6073673, -1.775049, 1, 1, 1, 1, 1,
-1.222977, 0.365052, -0.4335362, 1, 1, 1, 1, 1,
-1.219474, 0.7535151, -1.998914, 1, 1, 1, 1, 1,
-1.213462, 1.524105, -1.876078, 1, 1, 1, 1, 1,
-1.209122, -0.3048093, -2.198646, 1, 1, 1, 1, 1,
-1.198937, 0.7330132, -1.082553, 1, 1, 1, 1, 1,
-1.190994, 0.5247763, -1.852893, 1, 1, 1, 1, 1,
-1.182932, 0.05099415, -2.388567, 1, 1, 1, 1, 1,
-1.180008, 0.7676626, -0.6959359, 1, 1, 1, 1, 1,
-1.178462, 0.2083778, -1.521106, 1, 1, 1, 1, 1,
-1.177253, -1.246719, -2.556736, 1, 1, 1, 1, 1,
-1.170383, -0.02591665, -0.2336737, 0, 0, 1, 1, 1,
-1.167339, -0.5144252, -1.289233, 1, 0, 0, 1, 1,
-1.16715, 0.6795422, -0.9757752, 1, 0, 0, 1, 1,
-1.165457, -0.5760741, -3.246541, 1, 0, 0, 1, 1,
-1.158627, -0.4865143, -1.941484, 1, 0, 0, 1, 1,
-1.150418, -1.053272, -2.339435, 1, 0, 0, 1, 1,
-1.144457, 0.894312, -1.252062, 0, 0, 0, 1, 1,
-1.143117, 0.6805945, -1.591808, 0, 0, 0, 1, 1,
-1.127536, -0.6090295, -4.964591, 0, 0, 0, 1, 1,
-1.122779, 1.077129, -1.19952, 0, 0, 0, 1, 1,
-1.116997, 1.34925, -0.6061881, 0, 0, 0, 1, 1,
-1.116385, -1.352108, -1.705846, 0, 0, 0, 1, 1,
-1.111091, -2.422579, -2.591463, 0, 0, 0, 1, 1,
-1.107694, -0.7778797, -1.782119, 1, 1, 1, 1, 1,
-1.105582, 0.7677496, 0.05712564, 1, 1, 1, 1, 1,
-1.098304, 0.9423283, -1.192664, 1, 1, 1, 1, 1,
-1.096119, -0.330288, -2.46533, 1, 1, 1, 1, 1,
-1.095788, 1.37343, -0.01119834, 1, 1, 1, 1, 1,
-1.087895, -0.9546925, -1.959551, 1, 1, 1, 1, 1,
-1.075634, 0.7908978, -2.362185, 1, 1, 1, 1, 1,
-1.075152, -1.097091, -3.777235, 1, 1, 1, 1, 1,
-1.073546, 0.5335942, -0.7677338, 1, 1, 1, 1, 1,
-1.073155, 0.1759797, -2.996959, 1, 1, 1, 1, 1,
-1.066793, 0.5592795, -1.155925, 1, 1, 1, 1, 1,
-1.058243, 0.5728264, -0.9058005, 1, 1, 1, 1, 1,
-1.042514, 1.462974, 0.0528629, 1, 1, 1, 1, 1,
-1.037125, -0.585971, -2.668821, 1, 1, 1, 1, 1,
-1.036884, -0.1513666, -0.4825504, 1, 1, 1, 1, 1,
-1.036379, -0.7928919, -1.073189, 0, 0, 1, 1, 1,
-1.021914, 0.6920598, -2.570986, 1, 0, 0, 1, 1,
-1.021012, -0.1592204, -2.039848, 1, 0, 0, 1, 1,
-1.011824, -1.722465, -1.53477, 1, 0, 0, 1, 1,
-1.007809, 0.2065626, 0.3697706, 1, 0, 0, 1, 1,
-1.002251, -0.01077136, -2.139243, 1, 0, 0, 1, 1,
-1.000949, 0.5151474, -0.2232855, 0, 0, 0, 1, 1,
-1.000256, -0.5134107, 0.02759798, 0, 0, 0, 1, 1,
-0.9939289, -1.128716, -2.406717, 0, 0, 0, 1, 1,
-0.9907258, -0.2707852, -1.016374, 0, 0, 0, 1, 1,
-0.9850535, -0.7981172, -2.560023, 0, 0, 0, 1, 1,
-0.9820327, -0.2611034, -2.404844, 0, 0, 0, 1, 1,
-0.9818809, 0.753253, -1.337823, 0, 0, 0, 1, 1,
-0.9803083, -0.100496, -1.729729, 1, 1, 1, 1, 1,
-0.9798493, -0.9246122, -3.105274, 1, 1, 1, 1, 1,
-0.9767551, 0.9831104, -1.560503, 1, 1, 1, 1, 1,
-0.9726011, 0.175066, -0.8611484, 1, 1, 1, 1, 1,
-0.9665787, -1.692668, -4.507833, 1, 1, 1, 1, 1,
-0.9615242, 0.07523033, -1.888193, 1, 1, 1, 1, 1,
-0.9565586, 0.1112574, -0.6656571, 1, 1, 1, 1, 1,
-0.9545706, 1.697005, -2.948107, 1, 1, 1, 1, 1,
-0.9533416, 1.829016, 0.08760066, 1, 1, 1, 1, 1,
-0.9501311, 0.07849094, -0.07337972, 1, 1, 1, 1, 1,
-0.941941, -0.7432772, -1.515364, 1, 1, 1, 1, 1,
-0.9411987, 1.132275, -1.605843, 1, 1, 1, 1, 1,
-0.9398499, 0.5090353, -0.7761078, 1, 1, 1, 1, 1,
-0.9388833, -1.010086, -3.238866, 1, 1, 1, 1, 1,
-0.9376063, -0.7560194, -0.1679501, 1, 1, 1, 1, 1,
-0.9367653, -1.143376, -1.845217, 0, 0, 1, 1, 1,
-0.9321709, -0.3720172, -1.695734, 1, 0, 0, 1, 1,
-0.9316773, -0.2562758, -2.931571, 1, 0, 0, 1, 1,
-0.9316231, -1.357654, -4.106669, 1, 0, 0, 1, 1,
-0.9310783, -0.4465098, -3.01466, 1, 0, 0, 1, 1,
-0.9221074, -0.5655951, -2.713088, 1, 0, 0, 1, 1,
-0.9200056, -0.08075367, -3.19966, 0, 0, 0, 1, 1,
-0.9140739, -0.892737, -0.5388358, 0, 0, 0, 1, 1,
-0.9082322, 1.429031, -0.3027087, 0, 0, 0, 1, 1,
-0.8991654, -1.008268, -3.102123, 0, 0, 0, 1, 1,
-0.8961657, -0.5780438, -2.659899, 0, 0, 0, 1, 1,
-0.894574, 0.4105831, -1.656231, 0, 0, 0, 1, 1,
-0.8920832, -0.8783992, -1.734184, 0, 0, 0, 1, 1,
-0.8855509, 1.926522, -2.008077, 1, 1, 1, 1, 1,
-0.8815448, 2.460559, -0.6245146, 1, 1, 1, 1, 1,
-0.8795198, 0.6392449, -0.02496415, 1, 1, 1, 1, 1,
-0.8790349, -0.4195858, -0.8274129, 1, 1, 1, 1, 1,
-0.8789591, -1.364151, -3.067831, 1, 1, 1, 1, 1,
-0.8753748, 0.5279241, -0.1107839, 1, 1, 1, 1, 1,
-0.8719915, 0.6212577, -1.853478, 1, 1, 1, 1, 1,
-0.8682348, -0.6426396, -2.857473, 1, 1, 1, 1, 1,
-0.8655077, 0.2922725, -1.599028, 1, 1, 1, 1, 1,
-0.8648168, -0.3670317, -2.204816, 1, 1, 1, 1, 1,
-0.8575351, 0.9579077, -1.875953, 1, 1, 1, 1, 1,
-0.8564741, 1.121122, -3.539544, 1, 1, 1, 1, 1,
-0.8546196, -0.314635, -1.41855, 1, 1, 1, 1, 1,
-0.854079, 1.915599, -1.878088, 1, 1, 1, 1, 1,
-0.8514093, 0.8927671, -0.5360915, 1, 1, 1, 1, 1,
-0.8491052, -0.5366117, -4.190532, 0, 0, 1, 1, 1,
-0.8415971, 1.586067, -0.1165606, 1, 0, 0, 1, 1,
-0.8403292, -0.100826, -2.699047, 1, 0, 0, 1, 1,
-0.8392827, 0.8350283, -2.028324, 1, 0, 0, 1, 1,
-0.829739, -0.3715169, -2.062616, 1, 0, 0, 1, 1,
-0.8249527, 0.2789509, -1.793726, 1, 0, 0, 1, 1,
-0.8245992, -1.200891, -2.835552, 0, 0, 0, 1, 1,
-0.8176235, 1.325157, -1.537658, 0, 0, 0, 1, 1,
-0.8172758, -0.9718066, -0.9899726, 0, 0, 0, 1, 1,
-0.8095924, -1.737386, -2.960696, 0, 0, 0, 1, 1,
-0.8092413, -0.8467108, -3.906521, 0, 0, 0, 1, 1,
-0.8080475, 0.8199467, -2.41669, 0, 0, 0, 1, 1,
-0.8045655, 0.8444394, -0.289951, 0, 0, 0, 1, 1,
-0.8037278, 1.893933, 1.298043, 1, 1, 1, 1, 1,
-0.7975318, -0.5166932, -3.663687, 1, 1, 1, 1, 1,
-0.7950186, -0.241435, -3.302738, 1, 1, 1, 1, 1,
-0.7929066, 1.520343, -1.811073, 1, 1, 1, 1, 1,
-0.7842967, -0.2416385, -1.674061, 1, 1, 1, 1, 1,
-0.7808899, 0.1246269, -2.120075, 1, 1, 1, 1, 1,
-0.7770224, -1.507583, -2.263437, 1, 1, 1, 1, 1,
-0.7709764, -0.4053065, -1.159072, 1, 1, 1, 1, 1,
-0.7701177, -0.4380636, -2.49387, 1, 1, 1, 1, 1,
-0.7689072, -0.7856066, -0.9548306, 1, 1, 1, 1, 1,
-0.7681952, -1.466822, -1.458652, 1, 1, 1, 1, 1,
-0.766711, -1.507133, -2.858812, 1, 1, 1, 1, 1,
-0.7607306, -0.8121902, -3.591048, 1, 1, 1, 1, 1,
-0.7588967, 1.2633, 0.2710151, 1, 1, 1, 1, 1,
-0.756752, -0.4264547, -3.073929, 1, 1, 1, 1, 1,
-0.7558068, -2.080353, -1.876808, 0, 0, 1, 1, 1,
-0.752768, 0.5318988, -2.001345, 1, 0, 0, 1, 1,
-0.7525218, 0.316956, 0.378505, 1, 0, 0, 1, 1,
-0.7490845, -0.2894014, -2.261808, 1, 0, 0, 1, 1,
-0.7483655, -0.8155181, -1.801502, 1, 0, 0, 1, 1,
-0.7483027, 2.351849, -0.4201348, 1, 0, 0, 1, 1,
-0.7452316, -0.3401397, -1.782377, 0, 0, 0, 1, 1,
-0.7433225, 1.594879, -1.06389, 0, 0, 0, 1, 1,
-0.7286236, -1.74338, -2.053916, 0, 0, 0, 1, 1,
-0.7279487, -0.8800871, -1.511452, 0, 0, 0, 1, 1,
-0.7233945, -0.5815849, -1.902093, 0, 0, 0, 1, 1,
-0.7215621, -0.2973244, -3.850497, 0, 0, 0, 1, 1,
-0.7186049, -0.4465013, -1.119046, 0, 0, 0, 1, 1,
-0.7144694, 0.552187, 0.7188537, 1, 1, 1, 1, 1,
-0.710299, -1.881486, -1.074902, 1, 1, 1, 1, 1,
-0.7004533, -0.7558161, -4.897017, 1, 1, 1, 1, 1,
-0.6999318, -0.07562108, -0.2729084, 1, 1, 1, 1, 1,
-0.6976972, -0.2124484, 0.2744946, 1, 1, 1, 1, 1,
-0.6968327, 0.6722698, -1.797371, 1, 1, 1, 1, 1,
-0.6959664, -0.8436371, -2.340957, 1, 1, 1, 1, 1,
-0.6873391, -0.2660624, -2.155985, 1, 1, 1, 1, 1,
-0.6847448, 0.105836, -1.275677, 1, 1, 1, 1, 1,
-0.6798705, -0.7772766, -0.9608586, 1, 1, 1, 1, 1,
-0.6755427, -0.9591107, -2.741236, 1, 1, 1, 1, 1,
-0.6706989, 0.7318879, -1.337478, 1, 1, 1, 1, 1,
-0.6676519, -0.3170241, -1.678874, 1, 1, 1, 1, 1,
-0.662896, 1.179176, -1.466401, 1, 1, 1, 1, 1,
-0.6626792, -0.5017889, -1.227708, 1, 1, 1, 1, 1,
-0.6566036, -0.244427, -1.893954, 0, 0, 1, 1, 1,
-0.6565899, 2.988624, -0.3289033, 1, 0, 0, 1, 1,
-0.6458231, 0.553369, -1.747119, 1, 0, 0, 1, 1,
-0.6451885, -0.09265435, -2.85402, 1, 0, 0, 1, 1,
-0.6450019, 0.4107975, 0.3255035, 1, 0, 0, 1, 1,
-0.6449677, -0.1678661, -1.894325, 1, 0, 0, 1, 1,
-0.6391646, 1.061593, -0.569162, 0, 0, 0, 1, 1,
-0.6368539, 0.3110118, -2.51763, 0, 0, 0, 1, 1,
-0.6326219, -0.05943177, -0.3885801, 0, 0, 0, 1, 1,
-0.6300744, -0.3063477, -3.867648, 0, 0, 0, 1, 1,
-0.6285043, 0.4376813, -1.878997, 0, 0, 0, 1, 1,
-0.6283156, -0.1313518, -0.9349519, 0, 0, 0, 1, 1,
-0.6278633, 0.924776, -0.409244, 0, 0, 0, 1, 1,
-0.6268241, -1.190235, -2.039356, 1, 1, 1, 1, 1,
-0.6246417, 0.2916264, -1.179142, 1, 1, 1, 1, 1,
-0.6234833, -1.444162, -1.99785, 1, 1, 1, 1, 1,
-0.623134, -0.7388487, -2.855289, 1, 1, 1, 1, 1,
-0.6207752, -1.891077, -2.518938, 1, 1, 1, 1, 1,
-0.6152116, 0.2706939, -1.136883, 1, 1, 1, 1, 1,
-0.6102365, -0.5957696, -2.106022, 1, 1, 1, 1, 1,
-0.6081666, 0.6478142, -2.888725, 1, 1, 1, 1, 1,
-0.6064557, 0.4701211, -1.707231, 1, 1, 1, 1, 1,
-0.6054672, 1.236694, -0.6392317, 1, 1, 1, 1, 1,
-0.6033695, -0.28081, -4.034692, 1, 1, 1, 1, 1,
-0.5983292, 1.431606, -0.2647443, 1, 1, 1, 1, 1,
-0.5979725, 0.03034418, -1.480619, 1, 1, 1, 1, 1,
-0.5976219, -0.2087634, -3.702091, 1, 1, 1, 1, 1,
-0.5872021, 1.458067, 0.5507617, 1, 1, 1, 1, 1,
-0.5839098, 2.025956, 0.04785461, 0, 0, 1, 1, 1,
-0.5794523, -2.175189, -3.568134, 1, 0, 0, 1, 1,
-0.5773128, 1.217279, 1.929988, 1, 0, 0, 1, 1,
-0.5762689, -0.6829148, -3.27823, 1, 0, 0, 1, 1,
-0.5739787, 2.265115, -1.362421, 1, 0, 0, 1, 1,
-0.5691711, 0.01496589, -3.436347, 1, 0, 0, 1, 1,
-0.5684087, 0.3091093, -0.8267387, 0, 0, 0, 1, 1,
-0.5628678, 0.03268621, -2.48396, 0, 0, 0, 1, 1,
-0.5562829, -1.223983, -2.108064, 0, 0, 0, 1, 1,
-0.5497365, 2.323318, 0.4712216, 0, 0, 0, 1, 1,
-0.5483151, -0.2760254, -1.73638, 0, 0, 0, 1, 1,
-0.5482586, 1.272408, 1.870072, 0, 0, 0, 1, 1,
-0.5422918, -0.3315721, -1.603282, 0, 0, 0, 1, 1,
-0.5413455, -2.027224, -2.429589, 1, 1, 1, 1, 1,
-0.5385005, -0.6805936, -2.047988, 1, 1, 1, 1, 1,
-0.5369915, -0.7023968, -2.912526, 1, 1, 1, 1, 1,
-0.5359539, 1.366235, -0.8744388, 1, 1, 1, 1, 1,
-0.5325668, -0.6866391, -1.43342, 1, 1, 1, 1, 1,
-0.5295345, -1.644911, -3.347868, 1, 1, 1, 1, 1,
-0.528944, -0.08964273, -1.690505, 1, 1, 1, 1, 1,
-0.5289395, -0.01368013, -1.682861, 1, 1, 1, 1, 1,
-0.5272654, 0.3216439, -1.788169, 1, 1, 1, 1, 1,
-0.5260077, -1.172914, -2.74624, 1, 1, 1, 1, 1,
-0.5085437, 0.9956382, -0.0940729, 1, 1, 1, 1, 1,
-0.5074419, 0.5039179, 0.05696608, 1, 1, 1, 1, 1,
-0.5072975, 1.900945, 2.186486, 1, 1, 1, 1, 1,
-0.5039849, -0.9973444, -3.035021, 1, 1, 1, 1, 1,
-0.5015458, 0.05609003, 1.010828, 1, 1, 1, 1, 1,
-0.4994628, -0.5496809, -2.140343, 0, 0, 1, 1, 1,
-0.4932741, -0.1304017, 0.2970344, 1, 0, 0, 1, 1,
-0.4902333, -1.053427, -2.975351, 1, 0, 0, 1, 1,
-0.4890124, 0.1537699, -0.6957417, 1, 0, 0, 1, 1,
-0.4863647, 1.798887, -0.6325757, 1, 0, 0, 1, 1,
-0.4799884, -0.8762529, -5.191478, 1, 0, 0, 1, 1,
-0.4772071, 0.3972881, -1.259972, 0, 0, 0, 1, 1,
-0.4696848, -1.39239, -3.147017, 0, 0, 0, 1, 1,
-0.4637093, -1.103492, -3.677818, 0, 0, 0, 1, 1,
-0.4621261, 0.3898759, -2.163518, 0, 0, 0, 1, 1,
-0.4615853, -0.1711947, -2.638189, 0, 0, 0, 1, 1,
-0.4603464, -0.1408083, -2.144535, 0, 0, 0, 1, 1,
-0.4577524, 0.01127007, -2.683299, 0, 0, 0, 1, 1,
-0.4575395, -1.280581, -3.307238, 1, 1, 1, 1, 1,
-0.4563622, 0.5181617, -1.277386, 1, 1, 1, 1, 1,
-0.4542988, 0.2674519, -1.004912, 1, 1, 1, 1, 1,
-0.44939, -0.8541301, -2.604779, 1, 1, 1, 1, 1,
-0.4492472, 0.4158775, -0.7694576, 1, 1, 1, 1, 1,
-0.4473569, 0.9267005, -1.537644, 1, 1, 1, 1, 1,
-0.44712, 0.4463034, -1.996581, 1, 1, 1, 1, 1,
-0.4460247, -0.6244467, -2.254033, 1, 1, 1, 1, 1,
-0.4448599, 0.1495107, -0.6775557, 1, 1, 1, 1, 1,
-0.4423107, 0.869984, -0.4966378, 1, 1, 1, 1, 1,
-0.441663, 0.2017034, -1.692279, 1, 1, 1, 1, 1,
-0.4414817, 0.7090458, 0.3784493, 1, 1, 1, 1, 1,
-0.4404204, 0.5692495, -1.350907, 1, 1, 1, 1, 1,
-0.4336578, 1.315484, -0.1761899, 1, 1, 1, 1, 1,
-0.4312632, 1.451046, -0.2620817, 1, 1, 1, 1, 1,
-0.4249232, 0.6248794, -1.787379, 0, 0, 1, 1, 1,
-0.4207251, -0.8136117, -2.642528, 1, 0, 0, 1, 1,
-0.4180953, 0.6835698, -0.7386662, 1, 0, 0, 1, 1,
-0.4133599, 0.7972926, -0.6833005, 1, 0, 0, 1, 1,
-0.4119135, -0.5816616, -2.214771, 1, 0, 0, 1, 1,
-0.4112791, 1.200619, 0.2066165, 1, 0, 0, 1, 1,
-0.4093687, 0.1132113, -2.279717, 0, 0, 0, 1, 1,
-0.4071203, 1.141683, 0.4918695, 0, 0, 0, 1, 1,
-0.4032983, 0.5148602, -0.7616947, 0, 0, 0, 1, 1,
-0.4029849, -0.7209386, -1.954671, 0, 0, 0, 1, 1,
-0.4029789, -0.5856674, -1.763467, 0, 0, 0, 1, 1,
-0.3996713, 0.9073033, -0.06150795, 0, 0, 0, 1, 1,
-0.3994876, 0.7995375, -0.06623915, 0, 0, 0, 1, 1,
-0.396586, 1.578571, -0.2695171, 1, 1, 1, 1, 1,
-0.3952684, 1.14589, -0.298496, 1, 1, 1, 1, 1,
-0.389829, 1.66634, 0.2439544, 1, 1, 1, 1, 1,
-0.3881393, -1.041477, -3.41564, 1, 1, 1, 1, 1,
-0.3856072, -0.279259, -1.392632, 1, 1, 1, 1, 1,
-0.3847523, 1.12848, -0.758811, 1, 1, 1, 1, 1,
-0.3833408, 2.572891, 0.01168956, 1, 1, 1, 1, 1,
-0.3815702, 1.128405, -1.459663, 1, 1, 1, 1, 1,
-0.3792275, 0.09598345, -0.8427305, 1, 1, 1, 1, 1,
-0.3788359, -1.654706, -2.100686, 1, 1, 1, 1, 1,
-0.3787405, -0.6564454, -2.704734, 1, 1, 1, 1, 1,
-0.3784805, -0.1976463, -2.736362, 1, 1, 1, 1, 1,
-0.3732851, -0.7170764, -1.28454, 1, 1, 1, 1, 1,
-0.3643709, -1.969257, -2.697018, 1, 1, 1, 1, 1,
-0.3588648, 0.1657228, -0.1479558, 1, 1, 1, 1, 1,
-0.3542361, -0.5701426, -1.420627, 0, 0, 1, 1, 1,
-0.3539626, -0.7190264, -2.241909, 1, 0, 0, 1, 1,
-0.350922, 0.5907414, -1.373497, 1, 0, 0, 1, 1,
-0.3501491, -0.3674172, -2.557306, 1, 0, 0, 1, 1,
-0.3382236, 0.4988713, -0.6523051, 1, 0, 0, 1, 1,
-0.3301504, 0.6315161, -1.076548, 1, 0, 0, 1, 1,
-0.3283356, -0.005038154, -1.569363, 0, 0, 0, 1, 1,
-0.3260601, 0.6488669, 0.2953666, 0, 0, 0, 1, 1,
-0.3214848, -0.8078411, -2.607952, 0, 0, 0, 1, 1,
-0.3173397, -0.01005002, -1.466515, 0, 0, 0, 1, 1,
-0.316187, 0.3529201, -0.3912737, 0, 0, 0, 1, 1,
-0.3160625, 1.919951, -0.2634992, 0, 0, 0, 1, 1,
-0.312424, 0.4633474, -1.378266, 0, 0, 0, 1, 1,
-0.3105873, 0.9290727, -1.99265, 1, 1, 1, 1, 1,
-0.3097844, 0.9011543, -2.173605, 1, 1, 1, 1, 1,
-0.3019406, 0.5530832, -1.955513, 1, 1, 1, 1, 1,
-0.2985813, -0.8290395, -3.883343, 1, 1, 1, 1, 1,
-0.2962354, -1.55482, -2.748811, 1, 1, 1, 1, 1,
-0.2958199, 1.712929, -0.4099136, 1, 1, 1, 1, 1,
-0.2856914, 1.24848, 0.07672834, 1, 1, 1, 1, 1,
-0.283844, -1.641532, -2.026124, 1, 1, 1, 1, 1,
-0.2831538, -1.578963, -3.436814, 1, 1, 1, 1, 1,
-0.2808737, 1.173799, 0.07334691, 1, 1, 1, 1, 1,
-0.2772106, -0.1078507, -0.5460358, 1, 1, 1, 1, 1,
-0.2702417, -0.05541423, -1.469049, 1, 1, 1, 1, 1,
-0.2657558, -1.056366, -1.599254, 1, 1, 1, 1, 1,
-0.2641133, -0.175039, -3.650413, 1, 1, 1, 1, 1,
-0.2630193, 0.3767061, -0.2824148, 1, 1, 1, 1, 1,
-0.2594609, 0.3187936, -2.243959, 0, 0, 1, 1, 1,
-0.2548386, 0.3702843, -0.3708616, 1, 0, 0, 1, 1,
-0.2514811, 1.581697, 0.5920125, 1, 0, 0, 1, 1,
-0.2510294, 1.007656, -0.133863, 1, 0, 0, 1, 1,
-0.2491165, -2.077981, -3.210755, 1, 0, 0, 1, 1,
-0.2447774, -1.778534, -4.100411, 1, 0, 0, 1, 1,
-0.2416512, 0.5714989, -0.2996143, 0, 0, 0, 1, 1,
-0.240769, 0.160799, -0.9605522, 0, 0, 0, 1, 1,
-0.2396074, 0.3655177, -1.009409, 0, 0, 0, 1, 1,
-0.2379642, 1.23056, 0.7304071, 0, 0, 0, 1, 1,
-0.237934, 1.519419, -0.110327, 0, 0, 0, 1, 1,
-0.2347805, -1.214225, -2.8582, 0, 0, 0, 1, 1,
-0.2266929, 0.7739045, 0.4872217, 0, 0, 0, 1, 1,
-0.2264611, -0.1198485, -2.496842, 1, 1, 1, 1, 1,
-0.2251494, -0.04262203, 0.1269473, 1, 1, 1, 1, 1,
-0.2226036, -0.2111962, -4.050088, 1, 1, 1, 1, 1,
-0.2199081, 1.836936, -0.3006243, 1, 1, 1, 1, 1,
-0.2185747, 0.009955012, -2.111655, 1, 1, 1, 1, 1,
-0.2183062, -0.8432215, -3.135261, 1, 1, 1, 1, 1,
-0.2176576, 0.5179587, -1.237013, 1, 1, 1, 1, 1,
-0.2093756, 0.1571435, -1.565167, 1, 1, 1, 1, 1,
-0.2093546, -0.2058666, -3.73553, 1, 1, 1, 1, 1,
-0.2064737, -2.857071, -2.967036, 1, 1, 1, 1, 1,
-0.2057176, 0.6044991, -1.629748, 1, 1, 1, 1, 1,
-0.2034465, -0.04390649, -1.532613, 1, 1, 1, 1, 1,
-0.1997611, -1.121076, -4.465323, 1, 1, 1, 1, 1,
-0.1991902, -0.3510936, -3.136518, 1, 1, 1, 1, 1,
-0.1983998, 0.7773572, -0.7693323, 1, 1, 1, 1, 1,
-0.1979823, -1.090889, -1.730258, 0, 0, 1, 1, 1,
-0.194236, -1.99284, -3.10432, 1, 0, 0, 1, 1,
-0.1932008, 0.8147159, -0.4362999, 1, 0, 0, 1, 1,
-0.1912955, 0.948605, -1.488428, 1, 0, 0, 1, 1,
-0.1909641, -0.7051422, -1.954493, 1, 0, 0, 1, 1,
-0.1872794, 0.4267911, -0.7599583, 1, 0, 0, 1, 1,
-0.183531, 1.125408, 0.1290136, 0, 0, 0, 1, 1,
-0.1833365, 0.775125, -0.2800196, 0, 0, 0, 1, 1,
-0.1779075, -2.256103, -2.792828, 0, 0, 0, 1, 1,
-0.1728474, -1.306163, -4.230962, 0, 0, 0, 1, 1,
-0.1619672, -0.924246, -3.520094, 0, 0, 0, 1, 1,
-0.1578479, -0.9585614, -2.314881, 0, 0, 0, 1, 1,
-0.1571783, 0.6927002, -1.375792, 0, 0, 0, 1, 1,
-0.1532592, -0.2391501, -2.284814, 1, 1, 1, 1, 1,
-0.1530393, -2.201481, -1.024323, 1, 1, 1, 1, 1,
-0.1520316, 0.04187677, -2.48552, 1, 1, 1, 1, 1,
-0.1519619, -0.5117456, -2.502102, 1, 1, 1, 1, 1,
-0.1516785, 0.1023846, 0.05403046, 1, 1, 1, 1, 1,
-0.1501602, -0.8784092, -2.700578, 1, 1, 1, 1, 1,
-0.1484576, -0.4673324, -2.804641, 1, 1, 1, 1, 1,
-0.1460977, 1.102451, 0.4805441, 1, 1, 1, 1, 1,
-0.1380236, -1.451798, -4.241659, 1, 1, 1, 1, 1,
-0.1380057, -0.9489977, -3.818993, 1, 1, 1, 1, 1,
-0.1363283, -0.08831592, -0.7686556, 1, 1, 1, 1, 1,
-0.1333877, -1.519045, -1.403937, 1, 1, 1, 1, 1,
-0.1328346, 0.5693845, 2.257548, 1, 1, 1, 1, 1,
-0.1300573, -0.9055232, -2.904744, 1, 1, 1, 1, 1,
-0.1295161, -1.628788, -5.183077, 1, 1, 1, 1, 1,
-0.127433, 0.2926275, -0.9554389, 0, 0, 1, 1, 1,
-0.1204259, 1.780856, 0.104733, 1, 0, 0, 1, 1,
-0.1198126, -1.139993, -2.870396, 1, 0, 0, 1, 1,
-0.1139024, -0.1302982, -2.061107, 1, 0, 0, 1, 1,
-0.1113059, -0.2623203, -2.728661, 1, 0, 0, 1, 1,
-0.1111025, -1.02909, -4.792247, 1, 0, 0, 1, 1,
-0.1097738, -1.360706, -3.855111, 0, 0, 0, 1, 1,
-0.1066318, -1.922366, -4.474893, 0, 0, 0, 1, 1,
-0.105304, -1.816466, -2.942427, 0, 0, 0, 1, 1,
-0.1050935, 1.568805, 0.1250714, 0, 0, 0, 1, 1,
-0.1014153, -1.208537, -2.671745, 0, 0, 0, 1, 1,
-0.0985151, 0.5204442, 0.7779678, 0, 0, 0, 1, 1,
-0.09612927, 0.6511035, -1.716814, 0, 0, 0, 1, 1,
-0.09348066, -2.365297, -3.101044, 1, 1, 1, 1, 1,
-0.09200713, -0.1436832, -3.174065, 1, 1, 1, 1, 1,
-0.09165889, -1.579187, -0.8460902, 1, 1, 1, 1, 1,
-0.08904945, 0.5788528, -1.174446, 1, 1, 1, 1, 1,
-0.08839952, 0.0480045, 0.3073169, 1, 1, 1, 1, 1,
-0.08757378, 0.225894, 0.7603889, 1, 1, 1, 1, 1,
-0.0868976, 1.085635, -0.7983416, 1, 1, 1, 1, 1,
-0.08378024, 0.5082181, -1.627339, 1, 1, 1, 1, 1,
-0.07537583, 0.3082219, 0.3794944, 1, 1, 1, 1, 1,
-0.07245196, -0.3642603, -4.430262, 1, 1, 1, 1, 1,
-0.07180441, 0.370113, -0.1282231, 1, 1, 1, 1, 1,
-0.06331945, 1.004416, 0.4642203, 1, 1, 1, 1, 1,
-0.06300323, -0.1410389, -3.006897, 1, 1, 1, 1, 1,
-0.04763164, 0.3856894, -1.48631, 1, 1, 1, 1, 1,
-0.04670586, 0.02643885, -2.212153, 1, 1, 1, 1, 1,
-0.04616319, 3.373576, 0.4878694, 0, 0, 1, 1, 1,
-0.04534492, 1.494914, -0.2651142, 1, 0, 0, 1, 1,
-0.04252474, -0.6063713, -3.909215, 1, 0, 0, 1, 1,
-0.04002197, 0.9773894, 1.809045, 1, 0, 0, 1, 1,
-0.03449977, 0.8557799, -0.6360037, 1, 0, 0, 1, 1,
-0.03390666, 1.522982, -0.511822, 1, 0, 0, 1, 1,
-0.03070898, 1.430293, 1.07415, 0, 0, 0, 1, 1,
-0.0300529, 0.3798907, 1.116894, 0, 0, 0, 1, 1,
-0.02319051, 0.7129554, 0.3162622, 0, 0, 0, 1, 1,
-0.02175148, -0.1173679, -2.926547, 0, 0, 0, 1, 1,
-0.02034369, 0.7096797, 0.2929964, 0, 0, 0, 1, 1,
-0.0202003, -0.1220603, -2.115745, 0, 0, 0, 1, 1,
-0.02017495, 0.6780747, 1.032643, 0, 0, 0, 1, 1,
-0.01802935, -0.1727121, -3.638911, 1, 1, 1, 1, 1,
-0.01512107, -1.145085, -2.637423, 1, 1, 1, 1, 1,
-0.01350196, 0.2184893, -0.4244249, 1, 1, 1, 1, 1,
-0.01290955, -0.06794915, -3.317601, 1, 1, 1, 1, 1,
-0.01209639, 0.7454367, -1.026227, 1, 1, 1, 1, 1,
-0.01086296, 1.027991, 0.3615313, 1, 1, 1, 1, 1,
-0.008150621, 0.4561463, 0.4265085, 1, 1, 1, 1, 1,
-0.007128137, -1.389687, -4.340312, 1, 1, 1, 1, 1,
-0.005383086, -0.1326686, -3.29374, 1, 1, 1, 1, 1,
-0.004935359, 0.3755576, 0.5099524, 1, 1, 1, 1, 1,
-0.00299789, -1.499027, -2.742915, 1, 1, 1, 1, 1,
0.001439771, 1.523139, -1.144799, 1, 1, 1, 1, 1,
0.001822111, -0.1222267, 3.737595, 1, 1, 1, 1, 1,
0.001900107, -0.396976, 4.006242, 1, 1, 1, 1, 1,
0.00475499, -1.147588, 2.296226, 1, 1, 1, 1, 1,
0.006089, 1.386749, 0.6378821, 0, 0, 1, 1, 1,
0.008251744, 0.3856494, 0.5531333, 1, 0, 0, 1, 1,
0.01156366, 0.2371128, 0.0548068, 1, 0, 0, 1, 1,
0.01215898, 0.6693066, -0.4187277, 1, 0, 0, 1, 1,
0.01970329, 0.7976983, -0.5770739, 1, 0, 0, 1, 1,
0.02115136, -0.09213264, 4.759669, 1, 0, 0, 1, 1,
0.02385967, -1.250308, 2.022858, 0, 0, 0, 1, 1,
0.02405908, -1.254533, 3.043683, 0, 0, 0, 1, 1,
0.02554276, -0.41679, 1.58318, 0, 0, 0, 1, 1,
0.02716984, -1.285205, 2.531537, 0, 0, 0, 1, 1,
0.02744664, 0.5671616, -1.100801, 0, 0, 0, 1, 1,
0.02922389, -0.4372293, 1.291916, 0, 0, 0, 1, 1,
0.03015129, 0.1460208, 0.6890887, 0, 0, 0, 1, 1,
0.03139733, -0.5532663, 1.174903, 1, 1, 1, 1, 1,
0.03395239, 2.290673, 1.949781, 1, 1, 1, 1, 1,
0.03631704, -0.6242968, 4.117542, 1, 1, 1, 1, 1,
0.03638912, 1.497186, 0.9016597, 1, 1, 1, 1, 1,
0.03736205, -1.554313, 2.929521, 1, 1, 1, 1, 1,
0.0383725, 0.504907, -0.6759542, 1, 1, 1, 1, 1,
0.03873889, 0.9307261, 0.6683927, 1, 1, 1, 1, 1,
0.04015579, 0.4137302, 0.7350758, 1, 1, 1, 1, 1,
0.0413898, 1.204855, -2.388227, 1, 1, 1, 1, 1,
0.04549451, -0.6525064, 1.657711, 1, 1, 1, 1, 1,
0.04781923, -0.06577059, 2.147975, 1, 1, 1, 1, 1,
0.05250807, -0.520942, 3.928321, 1, 1, 1, 1, 1,
0.05884551, -0.2508808, 3.491257, 1, 1, 1, 1, 1,
0.06632183, 0.3322937, 1.018831, 1, 1, 1, 1, 1,
0.06812778, 0.3893048, 1.4038, 1, 1, 1, 1, 1,
0.06831943, -0.6202795, 4.232407, 0, 0, 1, 1, 1,
0.07010632, -0.1631385, 1.342374, 1, 0, 0, 1, 1,
0.07247186, -0.121794, 0.7312032, 1, 0, 0, 1, 1,
0.08377372, -0.06264655, 4.793264, 1, 0, 0, 1, 1,
0.0910917, -0.6888385, 3.178083, 1, 0, 0, 1, 1,
0.09240704, 0.4501161, -0.1659678, 1, 0, 0, 1, 1,
0.09321199, -0.363142, 3.282357, 0, 0, 0, 1, 1,
0.09501534, -0.3160292, 2.501984, 0, 0, 0, 1, 1,
0.09549773, -0.0412974, 3.996828, 0, 0, 0, 1, 1,
0.09654157, -1.438375, 3.628754, 0, 0, 0, 1, 1,
0.09912347, 0.3804012, -0.5541048, 0, 0, 0, 1, 1,
0.1032807, 0.4065817, -1.282601, 0, 0, 0, 1, 1,
0.1045097, 0.1220253, 0.744291, 0, 0, 0, 1, 1,
0.1137862, -0.1776205, 1.585588, 1, 1, 1, 1, 1,
0.1185983, 0.3798069, -0.9327433, 1, 1, 1, 1, 1,
0.1216685, -0.2531725, 2.880579, 1, 1, 1, 1, 1,
0.1224791, 0.8397063, 1.225552, 1, 1, 1, 1, 1,
0.1228122, -0.9304147, 5.497722, 1, 1, 1, 1, 1,
0.1258821, -0.754694, 3.684713, 1, 1, 1, 1, 1,
0.1270183, 0.09215132, 1.060333, 1, 1, 1, 1, 1,
0.1277552, -0.6364014, 3.510918, 1, 1, 1, 1, 1,
0.1287109, 0.9348232, 0.3221084, 1, 1, 1, 1, 1,
0.1302099, -0.2527432, 3.071362, 1, 1, 1, 1, 1,
0.133266, 0.1818537, 1.170085, 1, 1, 1, 1, 1,
0.1333426, -0.5105323, 2.804719, 1, 1, 1, 1, 1,
0.1343627, -0.9448383, 2.291057, 1, 1, 1, 1, 1,
0.1356934, 1.196503, -0.2671311, 1, 1, 1, 1, 1,
0.1378973, -1.297824, 3.634723, 1, 1, 1, 1, 1,
0.1403527, -1.111073, 3.420218, 0, 0, 1, 1, 1,
0.1404323, -0.09045572, 3.269383, 1, 0, 0, 1, 1,
0.1407362, -0.312145, 4.028303, 1, 0, 0, 1, 1,
0.1455286, -0.8825931, 0.7791119, 1, 0, 0, 1, 1,
0.1539321, 1.780924, -1.239811, 1, 0, 0, 1, 1,
0.1611853, 0.1904144, 0.3423886, 1, 0, 0, 1, 1,
0.1634721, -0.02015203, 1.819155, 0, 0, 0, 1, 1,
0.166045, 0.3632852, 1.148678, 0, 0, 0, 1, 1,
0.1700171, -0.9426773, 1.665555, 0, 0, 0, 1, 1,
0.1707263, 1.336873, -0.762127, 0, 0, 0, 1, 1,
0.1746946, 1.24212, 1.908467, 0, 0, 0, 1, 1,
0.1808708, 0.5828479, 0.5391145, 0, 0, 0, 1, 1,
0.185279, 1.533969, 1.014435, 0, 0, 0, 1, 1,
0.1898056, -0.4860732, 3.796134, 1, 1, 1, 1, 1,
0.1927765, -0.2817931, 2.310758, 1, 1, 1, 1, 1,
0.19615, 1.249432, 2.233289, 1, 1, 1, 1, 1,
0.1992915, 0.3387068, 3.356838, 1, 1, 1, 1, 1,
0.2005002, -0.9037688, 2.134902, 1, 1, 1, 1, 1,
0.2005611, 0.1693805, -0.7434137, 1, 1, 1, 1, 1,
0.2008656, 1.169851, 0.9468585, 1, 1, 1, 1, 1,
0.2016069, -0.7504461, 3.235577, 1, 1, 1, 1, 1,
0.2032186, -0.408873, 4.003762, 1, 1, 1, 1, 1,
0.2036943, 0.7138587, 0.5032403, 1, 1, 1, 1, 1,
0.2062061, 0.948905, 1.302679, 1, 1, 1, 1, 1,
0.2073652, 0.4178682, 1.785117, 1, 1, 1, 1, 1,
0.2091591, 0.08410057, 1.483436, 1, 1, 1, 1, 1,
0.2112157, 0.1470098, 0.9717829, 1, 1, 1, 1, 1,
0.2121686, -0.6541573, 1.406609, 1, 1, 1, 1, 1,
0.2123342, 0.02255043, 1.528992, 0, 0, 1, 1, 1,
0.2131979, -0.5981816, 4.035066, 1, 0, 0, 1, 1,
0.2136481, -0.7505736, 1.543978, 1, 0, 0, 1, 1,
0.2158718, 0.8101737, -0.7377335, 1, 0, 0, 1, 1,
0.216244, 1.660375, 0.9816855, 1, 0, 0, 1, 1,
0.217609, -0.2032827, 2.023601, 1, 0, 0, 1, 1,
0.2215352, -0.2450249, 1.240075, 0, 0, 0, 1, 1,
0.2222234, 0.7565002, -0.714949, 0, 0, 0, 1, 1,
0.222631, -0.06245564, -0.3105263, 0, 0, 0, 1, 1,
0.2239431, 0.2833692, 0.456952, 0, 0, 0, 1, 1,
0.2241072, 0.2878034, -0.3744789, 0, 0, 0, 1, 1,
0.2272466, 0.2175468, -0.3537595, 0, 0, 0, 1, 1,
0.237114, 0.07804286, 1.242745, 0, 0, 0, 1, 1,
0.2375654, 1.18138, -2.472338, 1, 1, 1, 1, 1,
0.2381149, 0.7585453, -0.791261, 1, 1, 1, 1, 1,
0.2390234, 0.08037173, 3.243991, 1, 1, 1, 1, 1,
0.2426826, -0.4189075, 2.993066, 1, 1, 1, 1, 1,
0.2465487, 0.6129365, 0.9250704, 1, 1, 1, 1, 1,
0.2494225, 0.4448469, -0.3622868, 1, 1, 1, 1, 1,
0.2561414, 0.3248326, 0.1147127, 1, 1, 1, 1, 1,
0.2612581, 1.174411, 0.5803521, 1, 1, 1, 1, 1,
0.2620513, 0.2767048, 2.318058, 1, 1, 1, 1, 1,
0.2664919, -1.156243, 1.874448, 1, 1, 1, 1, 1,
0.2709772, -1.150108, 4.600288, 1, 1, 1, 1, 1,
0.2719644, 1.272252, -0.204916, 1, 1, 1, 1, 1,
0.2802444, -0.2005728, 3.339304, 1, 1, 1, 1, 1,
0.2869912, -0.329933, 1.896995, 1, 1, 1, 1, 1,
0.2880134, -1.887361, 2.288189, 1, 1, 1, 1, 1,
0.2881711, -0.06095151, 2.724349, 0, 0, 1, 1, 1,
0.2936889, -0.6539353, 4.754735, 1, 0, 0, 1, 1,
0.2981188, -1.4858, 3.38737, 1, 0, 0, 1, 1,
0.299205, 0.100321, 0.8726408, 1, 0, 0, 1, 1,
0.3098396, -0.2141846, 2.041798, 1, 0, 0, 1, 1,
0.3104985, -0.07063231, 1.768138, 1, 0, 0, 1, 1,
0.3109576, -1.572599, 2.251343, 0, 0, 0, 1, 1,
0.3117874, 1.351367, 0.9521028, 0, 0, 0, 1, 1,
0.3164709, 1.014745, -0.9096282, 0, 0, 0, 1, 1,
0.3194497, -1.156995, 4.393678, 0, 0, 0, 1, 1,
0.3218955, -0.5634756, 2.357969, 0, 0, 0, 1, 1,
0.3218976, -0.9738916, 3.922617, 0, 0, 0, 1, 1,
0.3232433, 0.2987081, 1.061417, 0, 0, 0, 1, 1,
0.3284472, 0.787524, 0.9479599, 1, 1, 1, 1, 1,
0.329628, -0.6812182, 2.521721, 1, 1, 1, 1, 1,
0.3349442, 0.02410054, 1.29653, 1, 1, 1, 1, 1,
0.3353428, 0.01130825, 3.821313, 1, 1, 1, 1, 1,
0.3419065, -1.734633, 4.998185, 1, 1, 1, 1, 1,
0.3422435, 2.619225, -0.8232727, 1, 1, 1, 1, 1,
0.3468496, -0.3609473, 1.913976, 1, 1, 1, 1, 1,
0.3516802, -0.6298749, 2.688494, 1, 1, 1, 1, 1,
0.3524792, 0.1756227, 2.524852, 1, 1, 1, 1, 1,
0.3581079, -0.006267056, 2.622195, 1, 1, 1, 1, 1,
0.3592725, 0.3730445, 2.104396, 1, 1, 1, 1, 1,
0.3601741, -0.3672674, 0.6166195, 1, 1, 1, 1, 1,
0.3617179, 1.523958, 0.7718937, 1, 1, 1, 1, 1,
0.3626975, -1.75674, 3.349419, 1, 1, 1, 1, 1,
0.3678992, -2.103799, 2.848852, 1, 1, 1, 1, 1,
0.3739144, 1.374582, 0.8936216, 0, 0, 1, 1, 1,
0.3740781, -0.9819763, 3.516125, 1, 0, 0, 1, 1,
0.3775298, 0.07159422, 1.90679, 1, 0, 0, 1, 1,
0.3819162, 0.9539334, 0.8166354, 1, 0, 0, 1, 1,
0.388146, -0.05605183, 1.508422, 1, 0, 0, 1, 1,
0.3914463, 0.2239004, 1.515917, 1, 0, 0, 1, 1,
0.3972581, 0.4428895, 1.440139, 0, 0, 0, 1, 1,
0.3986459, -0.9653715, 3.392389, 0, 0, 0, 1, 1,
0.4009299, 0.1239295, 2.243129, 0, 0, 0, 1, 1,
0.4009928, -1.038612, 3.45171, 0, 0, 0, 1, 1,
0.4085148, 0.4135575, 0.4443613, 0, 0, 0, 1, 1,
0.4115518, 0.01248283, 0.8737583, 0, 0, 0, 1, 1,
0.4207539, -1.154803, 3.835054, 0, 0, 0, 1, 1,
0.4220992, -0.9592741, 1.144711, 1, 1, 1, 1, 1,
0.4272486, 1.454087, 2.173753, 1, 1, 1, 1, 1,
0.433009, -0.1152185, 3.065579, 1, 1, 1, 1, 1,
0.4429061, -0.05678564, 2.066772, 1, 1, 1, 1, 1,
0.4496165, -0.02740901, 0.8678731, 1, 1, 1, 1, 1,
0.4500914, -0.7436295, 1.322528, 1, 1, 1, 1, 1,
0.4514266, -0.6407665, 2.177801, 1, 1, 1, 1, 1,
0.4527661, -0.8931282, 3.053978, 1, 1, 1, 1, 1,
0.4600238, -1.581224, 1.932904, 1, 1, 1, 1, 1,
0.4643082, -1.817769, 2.583593, 1, 1, 1, 1, 1,
0.475982, -0.1153643, 1.680943, 1, 1, 1, 1, 1,
0.493247, -0.6567062, 1.579329, 1, 1, 1, 1, 1,
0.5006297, 1.047236, 0.8738359, 1, 1, 1, 1, 1,
0.5021943, -1.070892, 2.495421, 1, 1, 1, 1, 1,
0.502694, -1.693257, 2.354909, 1, 1, 1, 1, 1,
0.5047296, 0.8818955, 0.2160792, 0, 0, 1, 1, 1,
0.5048428, 0.6463543, 0.6026714, 1, 0, 0, 1, 1,
0.5080429, 1.155457, 0.5654728, 1, 0, 0, 1, 1,
0.5086707, -1.42209, 2.620528, 1, 0, 0, 1, 1,
0.513019, 1.646175, 0.9121783, 1, 0, 0, 1, 1,
0.5148622, 0.1143773, 0.8126589, 1, 0, 0, 1, 1,
0.5189473, 0.7715172, -1.944844, 0, 0, 0, 1, 1,
0.5227686, -0.8598327, 3.654981, 0, 0, 0, 1, 1,
0.5261263, 0.7003981, 1.205749, 0, 0, 0, 1, 1,
0.5319965, 0.6959414, -0.6839294, 0, 0, 0, 1, 1,
0.5377349, -0.7839925, 2.154118, 0, 0, 0, 1, 1,
0.5428768, 0.5819009, 1.011798, 0, 0, 0, 1, 1,
0.5464535, 1.056628, 1.554531, 0, 0, 0, 1, 1,
0.552915, 0.3136729, -1.16676, 1, 1, 1, 1, 1,
0.5563934, -1.456666, 3.919999, 1, 1, 1, 1, 1,
0.5657635, -0.7933272, 2.262197, 1, 1, 1, 1, 1,
0.5673465, -0.05170004, 1.778944, 1, 1, 1, 1, 1,
0.5704321, 1.202633, 1.044504, 1, 1, 1, 1, 1,
0.5716162, -0.1735109, 2.141326, 1, 1, 1, 1, 1,
0.5735171, -0.2597858, 3.952529, 1, 1, 1, 1, 1,
0.576111, -0.5037684, 3.365782, 1, 1, 1, 1, 1,
0.5780679, -0.4128329, 2.544354, 1, 1, 1, 1, 1,
0.5808015, -0.7472937, 3.010846, 1, 1, 1, 1, 1,
0.5891459, 0.5443188, 0.5581878, 1, 1, 1, 1, 1,
0.5915083, 1.12173, 2.064826, 1, 1, 1, 1, 1,
0.5923356, 2.023291, 0.2626719, 1, 1, 1, 1, 1,
0.5934649, -1.21491, 1.937162, 1, 1, 1, 1, 1,
0.5954211, -0.2665424, 1.635574, 1, 1, 1, 1, 1,
0.598187, -0.3180676, 1.724076, 0, 0, 1, 1, 1,
0.601015, 0.3948374, 0.922012, 1, 0, 0, 1, 1,
0.602747, 1.617937, 1.141315, 1, 0, 0, 1, 1,
0.6059859, -2.485052, 0.8139364, 1, 0, 0, 1, 1,
0.6071324, 1.108448, 0.6462908, 1, 0, 0, 1, 1,
0.6108004, 0.3370216, 1.352103, 1, 0, 0, 1, 1,
0.6146201, -0.8652265, 3.487395, 0, 0, 0, 1, 1,
0.6167922, -0.04100157, 1.953267, 0, 0, 0, 1, 1,
0.6197673, -0.3415015, 1.342872, 0, 0, 0, 1, 1,
0.6198021, -0.07135132, 0.8404538, 0, 0, 0, 1, 1,
0.6265915, 0.6165327, 1.977935, 0, 0, 0, 1, 1,
0.6298717, 1.238484, 1.382283, 0, 0, 0, 1, 1,
0.6332318, 1.09724, 0.1326272, 0, 0, 0, 1, 1,
0.6418685, -0.6599547, 1.259777, 1, 1, 1, 1, 1,
0.6509808, 0.7662839, -0.02827724, 1, 1, 1, 1, 1,
0.6553895, 1.187388, 2.246943, 1, 1, 1, 1, 1,
0.6582169, -0.3863413, 2.803757, 1, 1, 1, 1, 1,
0.6596894, -1.907404, 5.093207, 1, 1, 1, 1, 1,
0.6653063, 0.3052891, 0.6231002, 1, 1, 1, 1, 1,
0.6717041, -0.06237464, 0.7412844, 1, 1, 1, 1, 1,
0.6761262, -0.3786565, 3.535855, 1, 1, 1, 1, 1,
0.6765283, 1.280311, 1.519246, 1, 1, 1, 1, 1,
0.6777043, -0.2297306, 1.173143, 1, 1, 1, 1, 1,
0.6780562, 0.03607367, 2.117894, 1, 1, 1, 1, 1,
0.6823416, 0.8014997, -1.18515, 1, 1, 1, 1, 1,
0.6827267, 0.2011745, -0.3843988, 1, 1, 1, 1, 1,
0.6828408, 0.7846527, 2.102972, 1, 1, 1, 1, 1,
0.6847995, 0.6184058, 1.403534, 1, 1, 1, 1, 1,
0.6854708, 2.767043, -0.9951701, 0, 0, 1, 1, 1,
0.6884003, 0.2380642, 0.339479, 1, 0, 0, 1, 1,
0.6892035, -0.6366655, 0.8024449, 1, 0, 0, 1, 1,
0.6901839, -0.2928739, 2.18241, 1, 0, 0, 1, 1,
0.6906694, 1.65185, 1.256809, 1, 0, 0, 1, 1,
0.6929125, 0.9957509, -0.8436759, 1, 0, 0, 1, 1,
0.6960329, 0.6741809, 1.561129, 0, 0, 0, 1, 1,
0.6986939, -1.395936, 1.957781, 0, 0, 0, 1, 1,
0.7002152, 0.8734697, 0.2295445, 0, 0, 0, 1, 1,
0.7033709, 0.5105354, 0.5895743, 0, 0, 0, 1, 1,
0.7041481, -0.6933655, 1.349136, 0, 0, 0, 1, 1,
0.7085102, 0.6766264, 0.2199948, 0, 0, 0, 1, 1,
0.7126909, -3.92005, 3.185826, 0, 0, 0, 1, 1,
0.7136382, -0.9560462, 2.982506, 1, 1, 1, 1, 1,
0.7177428, 0.3594771, 0.7061989, 1, 1, 1, 1, 1,
0.7185965, -0.7586194, 3.950646, 1, 1, 1, 1, 1,
0.7256253, 0.5878475, 1.848276, 1, 1, 1, 1, 1,
0.7285035, 0.6285932, 1.501191, 1, 1, 1, 1, 1,
0.7307406, 0.1750208, 0.8553097, 1, 1, 1, 1, 1,
0.7354934, -1.673787, 2.499852, 1, 1, 1, 1, 1,
0.7367019, 0.2866304, 1.70558, 1, 1, 1, 1, 1,
0.7452297, -0.2512482, 1.494036, 1, 1, 1, 1, 1,
0.7534289, -1.322042, 3.269413, 1, 1, 1, 1, 1,
0.7535035, 0.644972, 1.914884, 1, 1, 1, 1, 1,
0.7542185, -0.14875, 2.069506, 1, 1, 1, 1, 1,
0.7558546, 0.3739411, 0.9982823, 1, 1, 1, 1, 1,
0.7589343, -0.6987232, 1.901743, 1, 1, 1, 1, 1,
0.7610604, -0.7915776, 1.955196, 1, 1, 1, 1, 1,
0.767957, -1.436192, 3.010114, 0, 0, 1, 1, 1,
0.7735087, -2.466658, 2.658931, 1, 0, 0, 1, 1,
0.7740325, -0.05095643, 3.035433, 1, 0, 0, 1, 1,
0.7745748, -1.222232, 2.876716, 1, 0, 0, 1, 1,
0.7767173, 1.232519, 2.122911, 1, 0, 0, 1, 1,
0.7831191, -0.3727483, 2.031497, 1, 0, 0, 1, 1,
0.7841207, 0.1315457, -0.424477, 0, 0, 0, 1, 1,
0.7873871, -1.257926, 0.1725363, 0, 0, 0, 1, 1,
0.7880691, 1.68843, 0.9310404, 0, 0, 0, 1, 1,
0.8065982, 0.2566478, 2.762562, 0, 0, 0, 1, 1,
0.8118688, 0.3837799, 0.7635702, 0, 0, 0, 1, 1,
0.8147708, 0.8551687, 0.4951646, 0, 0, 0, 1, 1,
0.8191449, 0.7569885, 1.429356, 0, 0, 0, 1, 1,
0.8204005, -2.466794, 5.017652, 1, 1, 1, 1, 1,
0.8298869, -0.6986921, 1.46424, 1, 1, 1, 1, 1,
0.8386601, -0.2288477, 2.348711, 1, 1, 1, 1, 1,
0.8389411, 0.6400553, 0.2192787, 1, 1, 1, 1, 1,
0.8421453, 0.31608, 0.8918681, 1, 1, 1, 1, 1,
0.8433992, 1.213714, 0.4115372, 1, 1, 1, 1, 1,
0.8502213, -1.107376, 2.977756, 1, 1, 1, 1, 1,
0.8514979, 1.114076, 1.673303, 1, 1, 1, 1, 1,
0.8560652, 0.3633422, 2.666859, 1, 1, 1, 1, 1,
0.8568453, 1.102114, 0.8892252, 1, 1, 1, 1, 1,
0.8570538, -0.1812729, -0.02546895, 1, 1, 1, 1, 1,
0.8602443, -0.8765898, 1.376612, 1, 1, 1, 1, 1,
0.8659397, -0.3969004, 3.336617, 1, 1, 1, 1, 1,
0.8673575, 1.236975, 0.1157575, 1, 1, 1, 1, 1,
0.8678054, -0.02852448, 0.647392, 1, 1, 1, 1, 1,
0.8694332, 0.7718127, 1.279218, 0, 0, 1, 1, 1,
0.8728023, -1.022982, 3.099751, 1, 0, 0, 1, 1,
0.8757261, -0.7687691, 2.236088, 1, 0, 0, 1, 1,
0.8762965, 0.74944, 1.125749, 1, 0, 0, 1, 1,
0.8788551, 0.03781555, 0.7528183, 1, 0, 0, 1, 1,
0.8825001, -0.7324632, 1.126313, 1, 0, 0, 1, 1,
0.8851733, 0.1472007, 1.966876, 0, 0, 0, 1, 1,
0.8894554, -0.6894923, 2.470286, 0, 0, 0, 1, 1,
0.8914617, -1.306069, 1.432998, 0, 0, 0, 1, 1,
0.8918246, -0.4533919, 1.14116, 0, 0, 0, 1, 1,
0.8963963, -0.8962833, 4.50764, 0, 0, 0, 1, 1,
0.9144747, 0.5441507, 2.960565, 0, 0, 0, 1, 1,
0.9160221, 2.344553, 0.3754928, 0, 0, 0, 1, 1,
0.9191316, -0.3565772, 2.033785, 1, 1, 1, 1, 1,
0.9245219, -0.9737669, 1.01256, 1, 1, 1, 1, 1,
0.930559, 1.645407, 1.72898, 1, 1, 1, 1, 1,
0.9318152, -0.09388895, 0.06874945, 1, 1, 1, 1, 1,
0.9406083, -0.9215582, 0.291812, 1, 1, 1, 1, 1,
0.947849, 0.1593405, 0.447862, 1, 1, 1, 1, 1,
0.9488929, 0.4857056, -0.4368935, 1, 1, 1, 1, 1,
0.9513558, 0.5503583, 1.314342, 1, 1, 1, 1, 1,
0.95279, -1.096555, 1.334074, 1, 1, 1, 1, 1,
0.9530043, -0.3392266, 1.396298, 1, 1, 1, 1, 1,
0.9614954, 2.509971, -2.034812, 1, 1, 1, 1, 1,
0.9651636, 0.5321488, 2.091114, 1, 1, 1, 1, 1,
0.9672741, -1.324396, 1.691888, 1, 1, 1, 1, 1,
0.9687276, -1.613679, 2.506728, 1, 1, 1, 1, 1,
0.9833069, -0.006259813, 0.04899316, 1, 1, 1, 1, 1,
0.9863404, 0.05881041, 0.6283283, 0, 0, 1, 1, 1,
0.9891286, -0.5902666, 3.039829, 1, 0, 0, 1, 1,
0.9893252, -0.9282628, 3.549088, 1, 0, 0, 1, 1,
0.9908139, -0.9280148, 0.7650598, 1, 0, 0, 1, 1,
0.9958926, -1.353133, 3.093807, 1, 0, 0, 1, 1,
1.001659, -0.1095903, -0.3898924, 1, 0, 0, 1, 1,
1.002766, 1.134868, 1.094468, 0, 0, 0, 1, 1,
1.009406, 1.15433, -1.142758, 0, 0, 0, 1, 1,
1.009443, -1.521581, 0.3364275, 0, 0, 0, 1, 1,
1.01662, 0.5778096, 1.31128, 0, 0, 0, 1, 1,
1.017475, 1.159069, 1.171688, 0, 0, 0, 1, 1,
1.017689, -0.8261386, -0.2610879, 0, 0, 0, 1, 1,
1.024041, 1.097732, -1.722796, 0, 0, 0, 1, 1,
1.028526, -1.115184, 2.093247, 1, 1, 1, 1, 1,
1.030402, 1.411389, -2.200911, 1, 1, 1, 1, 1,
1.030644, 0.2297265, 0.03702685, 1, 1, 1, 1, 1,
1.041508, 1.022907, -1.367726, 1, 1, 1, 1, 1,
1.042358, 0.8836685, 1.388093, 1, 1, 1, 1, 1,
1.045499, -1.222235, 3.244569, 1, 1, 1, 1, 1,
1.048371, 1.816448, 0.09732408, 1, 1, 1, 1, 1,
1.048613, -1.074364, 1.361623, 1, 1, 1, 1, 1,
1.049934, -0.5678008, 2.535025, 1, 1, 1, 1, 1,
1.05211, 0.9373409, 0.5305661, 1, 1, 1, 1, 1,
1.053574, 0.225446, 0.8581949, 1, 1, 1, 1, 1,
1.05385, 0.9375392, 1.254941, 1, 1, 1, 1, 1,
1.054634, -0.3355361, 3.325198, 1, 1, 1, 1, 1,
1.05957, 0.6020126, 1.188795, 1, 1, 1, 1, 1,
1.064386, -1.166009, 2.387848, 1, 1, 1, 1, 1,
1.067679, 0.9363658, 0.853555, 0, 0, 1, 1, 1,
1.068071, 0.3749775, 0.6619941, 1, 0, 0, 1, 1,
1.070895, -1.079938, 3.6011, 1, 0, 0, 1, 1,
1.077282, -1.940165, 3.440085, 1, 0, 0, 1, 1,
1.086369, 0.3610015, 1.132906, 1, 0, 0, 1, 1,
1.088991, -0.9507554, 3.247979, 1, 0, 0, 1, 1,
1.090465, -0.150879, 1.75474, 0, 0, 0, 1, 1,
1.092167, 0.03034992, 2.809298, 0, 0, 0, 1, 1,
1.105522, 2.751787, 0.1886503, 0, 0, 0, 1, 1,
1.113814, 0.8333927, 1.077483, 0, 0, 0, 1, 1,
1.130503, -0.100209, 3.267566, 0, 0, 0, 1, 1,
1.132081, 0.6903927, 0.428034, 0, 0, 0, 1, 1,
1.13894, -1.509366, 1.21831, 0, 0, 0, 1, 1,
1.149948, 1.275799, 0.9546378, 1, 1, 1, 1, 1,
1.166291, 0.4957039, 0.8323622, 1, 1, 1, 1, 1,
1.170195, -1.872756, 3.151789, 1, 1, 1, 1, 1,
1.184451, 0.3175521, 1.367237, 1, 1, 1, 1, 1,
1.186583, -0.02599838, 0.7382704, 1, 1, 1, 1, 1,
1.190701, 0.4555567, 2.000988, 1, 1, 1, 1, 1,
1.190954, 0.590447, 0.2782091, 1, 1, 1, 1, 1,
1.192654, 1.158835, 0.6532168, 1, 1, 1, 1, 1,
1.199057, -0.5000248, 2.769581, 1, 1, 1, 1, 1,
1.208606, 1.497736, -0.9453632, 1, 1, 1, 1, 1,
1.209076, -0.4332708, 0.3602642, 1, 1, 1, 1, 1,
1.217315, -0.3407969, 2.925872, 1, 1, 1, 1, 1,
1.218912, -0.1940068, 1.865064, 1, 1, 1, 1, 1,
1.223335, 0.9861312, 1.961136, 1, 1, 1, 1, 1,
1.225169, -0.6830151, 0.5202775, 1, 1, 1, 1, 1,
1.227996, 1.216772, 0.6732253, 0, 0, 1, 1, 1,
1.228141, -0.5446446, 2.023297, 1, 0, 0, 1, 1,
1.254057, 0.04398675, 3.25343, 1, 0, 0, 1, 1,
1.259706, 0.8527629, 0.1057129, 1, 0, 0, 1, 1,
1.272098, -2.287132, 1.963174, 1, 0, 0, 1, 1,
1.272926, -0.2007039, 5.01972, 1, 0, 0, 1, 1,
1.27888, -0.1500001, 0.4971075, 0, 0, 0, 1, 1,
1.280737, -0.1568503, 1.716575, 0, 0, 0, 1, 1,
1.285632, 0.7290133, -0.6311966, 0, 0, 0, 1, 1,
1.289501, -0.01480195, 2.271892, 0, 0, 0, 1, 1,
1.291885, 0.2396567, 0.5666055, 0, 0, 0, 1, 1,
1.308161, 0.7970695, -0.135438, 0, 0, 0, 1, 1,
1.308787, 0.3491995, 2.308029, 0, 0, 0, 1, 1,
1.309576, 1.094926, -0.5268037, 1, 1, 1, 1, 1,
1.318502, 0.1862531, 2.469048, 1, 1, 1, 1, 1,
1.329451, 1.506155, 0.6658981, 1, 1, 1, 1, 1,
1.331708, -0.0007163861, 1.572121, 1, 1, 1, 1, 1,
1.338883, -0.6412182, 2.940938, 1, 1, 1, 1, 1,
1.342287, 1.129422, 0.5664718, 1, 1, 1, 1, 1,
1.344072, -0.4791333, -0.0003126383, 1, 1, 1, 1, 1,
1.351737, 1.011251, 1.796435, 1, 1, 1, 1, 1,
1.361377, -2.474292, 2.174965, 1, 1, 1, 1, 1,
1.369063, -1.27568, 2.585559, 1, 1, 1, 1, 1,
1.370516, -0.4898171, 1.380212, 1, 1, 1, 1, 1,
1.37183, 0.2187604, 1.284889, 1, 1, 1, 1, 1,
1.378006, 1.475881, 0.7252579, 1, 1, 1, 1, 1,
1.380236, 0.6073937, 2.568586, 1, 1, 1, 1, 1,
1.383285, 0.3064365, 0.6757076, 1, 1, 1, 1, 1,
1.387672, -0.8226653, 1.436312, 0, 0, 1, 1, 1,
1.391268, 1.404944, 1.157132, 1, 0, 0, 1, 1,
1.395203, 0.8787261, 0.643593, 1, 0, 0, 1, 1,
1.397664, 0.8863036, 1.795662, 1, 0, 0, 1, 1,
1.437878, 0.01486336, 2.27236, 1, 0, 0, 1, 1,
1.439969, -0.2984674, 2.996455, 1, 0, 0, 1, 1,
1.445944, -0.3655306, 2.394696, 0, 0, 0, 1, 1,
1.447587, 0.8795845, 0.2219987, 0, 0, 0, 1, 1,
1.448254, -1.989612, 3.95836, 0, 0, 0, 1, 1,
1.455714, 1.071276, 1.418273, 0, 0, 0, 1, 1,
1.471061, 0.2332809, 3.266234, 0, 0, 0, 1, 1,
1.471803, 0.4434681, 2.08055, 0, 0, 0, 1, 1,
1.479424, -2.129691, 2.965391, 0, 0, 0, 1, 1,
1.484192, -0.6154131, 3.516275, 1, 1, 1, 1, 1,
1.485871, 1.249151, 1.711062, 1, 1, 1, 1, 1,
1.495066, 0.4938098, 0.6343514, 1, 1, 1, 1, 1,
1.514605, -0.639012, 2.28256, 1, 1, 1, 1, 1,
1.51612, 0.3332595, 2.404218, 1, 1, 1, 1, 1,
1.51614, 1.966035, 1.805175, 1, 1, 1, 1, 1,
1.518839, 1.254765, 1.427487, 1, 1, 1, 1, 1,
1.522925, -1.157707, 1.929531, 1, 1, 1, 1, 1,
1.534922, -1.203332, 0.4747877, 1, 1, 1, 1, 1,
1.537516, 0.9127337, 2.811537, 1, 1, 1, 1, 1,
1.545207, 0.3317375, -0.1360214, 1, 1, 1, 1, 1,
1.561388, -0.9771525, 2.29168, 1, 1, 1, 1, 1,
1.56254, -1.764117, 2.486357, 1, 1, 1, 1, 1,
1.568631, 0.2636207, -0.4234931, 1, 1, 1, 1, 1,
1.593555, 1.352076, 1.686125, 1, 1, 1, 1, 1,
1.619764, -1.17396, 2.29538, 0, 0, 1, 1, 1,
1.620102, -0.05890269, 1.487354, 1, 0, 0, 1, 1,
1.624494, -2.27184, 2.720716, 1, 0, 0, 1, 1,
1.641902, -1.336107, 1.224491, 1, 0, 0, 1, 1,
1.644494, -0.71966, 1.122653, 1, 0, 0, 1, 1,
1.660483, 0.2963042, 1.750671, 1, 0, 0, 1, 1,
1.67868, -0.2151571, 0.8383107, 0, 0, 0, 1, 1,
1.703288, -0.7911322, 2.748626, 0, 0, 0, 1, 1,
1.719863, -0.3979081, 0.325134, 0, 0, 0, 1, 1,
1.743084, 0.04131487, 3.224391, 0, 0, 0, 1, 1,
1.74437, 0.2429209, 2.321657, 0, 0, 0, 1, 1,
1.758106, 0.6407366, 1.194307, 0, 0, 0, 1, 1,
1.761217, -1.425169, 1.170413, 0, 0, 0, 1, 1,
1.775571, 0.3493692, 0.05283392, 1, 1, 1, 1, 1,
1.790441, 0.9626736, 2.775298, 1, 1, 1, 1, 1,
1.790777, -0.9914562, 0.7488344, 1, 1, 1, 1, 1,
1.805951, 0.6197664, -0.4832645, 1, 1, 1, 1, 1,
1.808658, -0.06398634, 2.872848, 1, 1, 1, 1, 1,
1.811246, -0.1252139, 0.5388061, 1, 1, 1, 1, 1,
1.819221, -0.7371536, 1.636748, 1, 1, 1, 1, 1,
1.836228, -1.309, 1.553169, 1, 1, 1, 1, 1,
1.859826, -0.09445833, 0.5240666, 1, 1, 1, 1, 1,
1.863209, 0.2662796, 0.6998633, 1, 1, 1, 1, 1,
1.87418, 0.405176, 1.971475, 1, 1, 1, 1, 1,
1.883666, 0.6110873, 1.300941, 1, 1, 1, 1, 1,
1.890455, -0.5578752, 3.117047, 1, 1, 1, 1, 1,
1.940582, -0.1319176, 1.887697, 1, 1, 1, 1, 1,
1.967598, 0.9443282, 1.405823, 1, 1, 1, 1, 1,
2.002257, -0.3182222, 1.731, 0, 0, 1, 1, 1,
2.044875, 0.6691583, 2.145141, 1, 0, 0, 1, 1,
2.099406, 0.1977038, 2.238364, 1, 0, 0, 1, 1,
2.150173, -1.278125, 3.289427, 1, 0, 0, 1, 1,
2.183539, 0.07166444, 0.5043839, 1, 0, 0, 1, 1,
2.280976, 2.963315, 1.63274, 1, 0, 0, 1, 1,
2.299948, -1.257954, 2.124788, 0, 0, 0, 1, 1,
2.353335, 0.7919806, 0.2728958, 0, 0, 0, 1, 1,
2.402656, 1.235244, 2.499797, 0, 0, 0, 1, 1,
2.414513, 2.510669, 0.08200629, 0, 0, 0, 1, 1,
2.455651, 1.239182, 0.5056866, 0, 0, 0, 1, 1,
2.464251, -0.6222886, 1.681214, 0, 0, 0, 1, 1,
2.483759, 0.602264, 2.224583, 0, 0, 0, 1, 1,
2.494179, 1.365491, 0.2536486, 1, 1, 1, 1, 1,
2.610065, 0.5649095, 2.125382, 1, 1, 1, 1, 1,
2.626916, 0.2541252, 1.04829, 1, 1, 1, 1, 1,
2.645987, -0.6288244, 0.2883775, 1, 1, 1, 1, 1,
2.736844, 0.5486473, 2.04866, 1, 1, 1, 1, 1,
3.082829, 0.9630462, 1.124116, 1, 1, 1, 1, 1,
3.457555, -0.6040276, 3.197202, 1, 1, 1, 1, 1
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
var radius = 9.870407;
var distance = 34.66939;
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
mvMatrix.translate( -0.1367145, 0.2732368, -0.1531222 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.66939);
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