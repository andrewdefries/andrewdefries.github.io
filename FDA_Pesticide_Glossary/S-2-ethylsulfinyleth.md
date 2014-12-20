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
-3.362144, 0.2477214, -1.26775, 1, 0, 0, 1,
-3.079979, 0.3308466, 0.2124224, 1, 0.007843138, 0, 1,
-3.075654, -1.016226, -1.195974, 1, 0.01176471, 0, 1,
-2.599594, -0.5246749, -2.136712, 1, 0.01960784, 0, 1,
-2.473092, -1.034054, -1.313745, 1, 0.02352941, 0, 1,
-2.454397, 1.549425, -1.484183, 1, 0.03137255, 0, 1,
-2.428285, -0.7949857, -1.669046, 1, 0.03529412, 0, 1,
-2.393524, -0.1984335, -1.851915, 1, 0.04313726, 0, 1,
-2.36911, 0.414979, -2.383321, 1, 0.04705882, 0, 1,
-2.365338, 0.3702236, -1.889516, 1, 0.05490196, 0, 1,
-2.34692, 0.5497193, -3.228866, 1, 0.05882353, 0, 1,
-2.23874, 1.151686, -0.1314364, 1, 0.06666667, 0, 1,
-2.186433, 0.7840855, -0.5935876, 1, 0.07058824, 0, 1,
-2.183262, 0.9492736, -1.964098, 1, 0.07843138, 0, 1,
-2.118456, -0.3511352, -3.78589, 1, 0.08235294, 0, 1,
-2.091669, -0.099889, -1.551801, 1, 0.09019608, 0, 1,
-2.075257, 0.600304, -1.281716, 1, 0.09411765, 0, 1,
-2.03382, -0.7581192, -1.494143, 1, 0.1019608, 0, 1,
-2.00913, 1.957875, -1.985923, 1, 0.1098039, 0, 1,
-1.997288, -0.5699815, -0.9851506, 1, 0.1137255, 0, 1,
-1.985303, -0.1051777, -0.8213003, 1, 0.1215686, 0, 1,
-1.969282, 0.784093, -3.020679, 1, 0.1254902, 0, 1,
-1.949668, -0.09679256, -1.678014, 1, 0.1333333, 0, 1,
-1.90882, -0.06309941, -2.009767, 1, 0.1372549, 0, 1,
-1.899529, 0.6824362, -0.889223, 1, 0.145098, 0, 1,
-1.883409, -0.5010208, 0.5150933, 1, 0.1490196, 0, 1,
-1.861329, -0.126197, -3.073952, 1, 0.1568628, 0, 1,
-1.859087, -1.16445, -2.398872, 1, 0.1607843, 0, 1,
-1.845815, -1.619417, -2.896405, 1, 0.1686275, 0, 1,
-1.83686, 0.6258244, -1.170012, 1, 0.172549, 0, 1,
-1.814528, -0.9834605, -0.5557098, 1, 0.1803922, 0, 1,
-1.778818, -0.4211939, -2.393359, 1, 0.1843137, 0, 1,
-1.761248, -1.742778, -2.456345, 1, 0.1921569, 0, 1,
-1.752497, 1.114242, -2.819571, 1, 0.1960784, 0, 1,
-1.71974, 1.562114, 0.6358496, 1, 0.2039216, 0, 1,
-1.701705, 0.1494143, -1.213204, 1, 0.2117647, 0, 1,
-1.694825, -0.08161525, -2.59961, 1, 0.2156863, 0, 1,
-1.693116, -0.9033328, -1.08425, 1, 0.2235294, 0, 1,
-1.690335, 0.3190573, -1.724806, 1, 0.227451, 0, 1,
-1.66067, 0.6351174, -0.2497119, 1, 0.2352941, 0, 1,
-1.643782, 1.706762, -1.581872, 1, 0.2392157, 0, 1,
-1.636715, -0.4009744, -1.630292, 1, 0.2470588, 0, 1,
-1.623487, 0.1953667, -1.691913, 1, 0.2509804, 0, 1,
-1.615288, 0.437059, 1.192606, 1, 0.2588235, 0, 1,
-1.603066, -0.0661017, -0.07876115, 1, 0.2627451, 0, 1,
-1.600867, 0.4526907, -1.897259, 1, 0.2705882, 0, 1,
-1.585739, -1.034141, -0.5171321, 1, 0.2745098, 0, 1,
-1.564822, 0.6845233, -1.756765, 1, 0.282353, 0, 1,
-1.539945, 0.4627348, -2.155559, 1, 0.2862745, 0, 1,
-1.53695, 1.184886, 0.2088913, 1, 0.2941177, 0, 1,
-1.530584, 1.416977, 0.7545297, 1, 0.3019608, 0, 1,
-1.498936, 0.4631065, -0.8833236, 1, 0.3058824, 0, 1,
-1.495521, -1.526194, -2.338054, 1, 0.3137255, 0, 1,
-1.491262, -0.7826952, -1.555517, 1, 0.3176471, 0, 1,
-1.489691, -0.995141, -0.07379279, 1, 0.3254902, 0, 1,
-1.483937, -1.140441, -2.563723, 1, 0.3294118, 0, 1,
-1.47516, -0.09036376, -2.382751, 1, 0.3372549, 0, 1,
-1.473628, -0.07978474, -0.6255249, 1, 0.3411765, 0, 1,
-1.465966, -0.0514314, -2.451016, 1, 0.3490196, 0, 1,
-1.461364, 2.85403, -1.130045, 1, 0.3529412, 0, 1,
-1.458478, 0.3118721, -1.224281, 1, 0.3607843, 0, 1,
-1.455177, 0.2342187, -3.316952, 1, 0.3647059, 0, 1,
-1.453345, 0.9627355, -1.03239, 1, 0.372549, 0, 1,
-1.452374, 1.569048, -2.739113, 1, 0.3764706, 0, 1,
-1.45186, -1.026803, -1.912683, 1, 0.3843137, 0, 1,
-1.435019, 0.2519792, -1.40559, 1, 0.3882353, 0, 1,
-1.418612, -0.6854994, -2.667088, 1, 0.3960784, 0, 1,
-1.417975, -0.2632409, -1.036488, 1, 0.4039216, 0, 1,
-1.409949, -0.6909311, -3.301027, 1, 0.4078431, 0, 1,
-1.407937, -0.2576247, -2.542579, 1, 0.4156863, 0, 1,
-1.399223, -0.653881, -2.454234, 1, 0.4196078, 0, 1,
-1.39081, -1.571697, -1.47846, 1, 0.427451, 0, 1,
-1.378123, 1.390221, -0.9834707, 1, 0.4313726, 0, 1,
-1.376881, 1.37374, 0.4963757, 1, 0.4392157, 0, 1,
-1.376157, 0.0336248, -0.7532285, 1, 0.4431373, 0, 1,
-1.368588, 0.02084384, -0.3491596, 1, 0.4509804, 0, 1,
-1.367828, 0.5683842, -0.3323897, 1, 0.454902, 0, 1,
-1.362501, 0.7771596, 0.3933395, 1, 0.4627451, 0, 1,
-1.357561, -0.01083738, -1.948852, 1, 0.4666667, 0, 1,
-1.348565, -0.4673226, -2.353183, 1, 0.4745098, 0, 1,
-1.348061, 1.279667, -2.774066, 1, 0.4784314, 0, 1,
-1.345163, 0.1220738, 0.3156881, 1, 0.4862745, 0, 1,
-1.345074, 0.3096123, -2.481556, 1, 0.4901961, 0, 1,
-1.34263, 1.750716, -1.13866, 1, 0.4980392, 0, 1,
-1.323725, -1.346258, -5.019677, 1, 0.5058824, 0, 1,
-1.323316, 0.6897715, -2.568514, 1, 0.509804, 0, 1,
-1.320986, -0.347251, -1.274387, 1, 0.5176471, 0, 1,
-1.320832, 0.5989942, -1.358509, 1, 0.5215687, 0, 1,
-1.319957, -0.1542172, -1.938967, 1, 0.5294118, 0, 1,
-1.316964, 0.2228698, -0.508393, 1, 0.5333334, 0, 1,
-1.307978, -3.47805, -3.04302, 1, 0.5411765, 0, 1,
-1.279399, 0.6192747, -1.465668, 1, 0.5450981, 0, 1,
-1.276965, 0.7703223, -0.811863, 1, 0.5529412, 0, 1,
-1.273823, -0.1520443, -1.559758, 1, 0.5568628, 0, 1,
-1.269845, -0.6475928, -4.020417, 1, 0.5647059, 0, 1,
-1.268181, 0.9272618, -0.7963669, 1, 0.5686275, 0, 1,
-1.264377, 1.273441, -0.07146722, 1, 0.5764706, 0, 1,
-1.263954, 0.1672376, -2.539412, 1, 0.5803922, 0, 1,
-1.256624, -0.8384326, -2.069457, 1, 0.5882353, 0, 1,
-1.252944, 1.188733, -1.139852, 1, 0.5921569, 0, 1,
-1.252712, 0.2859375, -1.197417, 1, 0.6, 0, 1,
-1.245438, 1.427623, -2.092297, 1, 0.6078432, 0, 1,
-1.241849, -0.01185821, -3.008456, 1, 0.6117647, 0, 1,
-1.240216, -0.3907797, -1.121002, 1, 0.6196079, 0, 1,
-1.235642, -1.304833, -3.958877, 1, 0.6235294, 0, 1,
-1.231277, -0.04794019, -2.862112, 1, 0.6313726, 0, 1,
-1.230284, -0.04250415, 0.009139653, 1, 0.6352941, 0, 1,
-1.228787, -0.1316615, -0.3165845, 1, 0.6431373, 0, 1,
-1.228574, -0.04700643, -2.633426, 1, 0.6470588, 0, 1,
-1.221601, 0.05318244, -2.759078, 1, 0.654902, 0, 1,
-1.220732, 1.723123, -1.403226, 1, 0.6588235, 0, 1,
-1.218212, -0.2730447, -1.425442, 1, 0.6666667, 0, 1,
-1.216952, -1.46396, -4.111598, 1, 0.6705883, 0, 1,
-1.213871, -0.02753191, -0.1162373, 1, 0.6784314, 0, 1,
-1.21147, 0.6219021, -1.072168, 1, 0.682353, 0, 1,
-1.205887, -1.706706, -2.973133, 1, 0.6901961, 0, 1,
-1.199461, 1.271926, -1.768265, 1, 0.6941177, 0, 1,
-1.197978, -0.7864846, -0.753994, 1, 0.7019608, 0, 1,
-1.192396, -0.2496937, -2.211945, 1, 0.7098039, 0, 1,
-1.18576, -0.4390984, -0.6124468, 1, 0.7137255, 0, 1,
-1.178473, 0.2821687, -0.6462345, 1, 0.7215686, 0, 1,
-1.166753, 0.1061583, -1.953966, 1, 0.7254902, 0, 1,
-1.152212, 0.4055918, 0.4770737, 1, 0.7333333, 0, 1,
-1.13351, -1.130277, -2.810845, 1, 0.7372549, 0, 1,
-1.126107, -0.157389, -1.128451, 1, 0.7450981, 0, 1,
-1.116221, 0.6656841, 0.2297053, 1, 0.7490196, 0, 1,
-1.114462, 0.1821623, -2.068329, 1, 0.7568628, 0, 1,
-1.110362, 0.2623618, -2.324978, 1, 0.7607843, 0, 1,
-1.108989, 0.6783018, -1.41356, 1, 0.7686275, 0, 1,
-1.10572, -0.4169631, -0.9245696, 1, 0.772549, 0, 1,
-1.104434, 0.5509648, -1.256358, 1, 0.7803922, 0, 1,
-1.097678, 0.3878196, 0.6102436, 1, 0.7843137, 0, 1,
-1.095283, -3.152772, -1.450496, 1, 0.7921569, 0, 1,
-1.094307, 0.9232371, 0.05987559, 1, 0.7960784, 0, 1,
-1.087859, -0.2980897, -1.99656, 1, 0.8039216, 0, 1,
-1.084611, -0.7850136, -4.893362, 1, 0.8117647, 0, 1,
-1.082842, -0.800454, -1.136861, 1, 0.8156863, 0, 1,
-1.075244, -1.106705, -3.358188, 1, 0.8235294, 0, 1,
-1.073411, -0.2267124, -1.37345, 1, 0.827451, 0, 1,
-1.072651, -0.07958625, -1.993068, 1, 0.8352941, 0, 1,
-1.067158, -1.461532, -1.522116, 1, 0.8392157, 0, 1,
-1.060277, -0.06072216, -1.691163, 1, 0.8470588, 0, 1,
-1.053983, -1.063567, -2.278096, 1, 0.8509804, 0, 1,
-1.052816, -1.814725, -4.280264, 1, 0.8588235, 0, 1,
-1.049197, 0.3994607, 0.2114456, 1, 0.8627451, 0, 1,
-1.03195, 1.140424, -0.4200851, 1, 0.8705882, 0, 1,
-1.018124, 0.2447573, -0.2561626, 1, 0.8745098, 0, 1,
-1.01064, 0.9590674, -0.3059352, 1, 0.8823529, 0, 1,
-1.002909, 0.7230926, -0.6109274, 1, 0.8862745, 0, 1,
-0.9949272, -0.4511481, -3.850882, 1, 0.8941177, 0, 1,
-0.9926421, 0.5379785, -1.486066, 1, 0.8980392, 0, 1,
-0.9822348, 0.09173527, -1.909063, 1, 0.9058824, 0, 1,
-0.9765379, 0.8533371, -0.8096774, 1, 0.9137255, 0, 1,
-0.9699365, 2.038696, 0.1161134, 1, 0.9176471, 0, 1,
-0.9675889, 0.1449581, -1.782183, 1, 0.9254902, 0, 1,
-0.966588, -0.1707983, -3.076003, 1, 0.9294118, 0, 1,
-0.9605026, 1.467781, -1.21849, 1, 0.9372549, 0, 1,
-0.9585676, 0.6396881, -0.02827012, 1, 0.9411765, 0, 1,
-0.9567891, 0.1724388, -0.9287341, 1, 0.9490196, 0, 1,
-0.9470299, 0.464292, -0.5462338, 1, 0.9529412, 0, 1,
-0.9408621, 0.9972962, -0.7678013, 1, 0.9607843, 0, 1,
-0.9389381, -2.203221, -1.248722, 1, 0.9647059, 0, 1,
-0.936933, 1.004308, -1.801946, 1, 0.972549, 0, 1,
-0.9321358, 1.545021, -0.9497089, 1, 0.9764706, 0, 1,
-0.9256521, -0.3634328, -2.000247, 1, 0.9843137, 0, 1,
-0.9219626, 0.4322048, -0.008094648, 1, 0.9882353, 0, 1,
-0.9209285, 0.5776197, -2.117738, 1, 0.9960784, 0, 1,
-0.9180776, -0.3064265, -3.247666, 0.9960784, 1, 0, 1,
-0.9131296, 0.1816241, -0.9793552, 0.9921569, 1, 0, 1,
-0.9077266, -1.12944, -0.8397536, 0.9843137, 1, 0, 1,
-0.9042557, 2.433062, -0.383945, 0.9803922, 1, 0, 1,
-0.9014684, -0.6224113, -3.220157, 0.972549, 1, 0, 1,
-0.901338, 1.313033, -0.6455402, 0.9686275, 1, 0, 1,
-0.9008282, -1.399885, -3.739491, 0.9607843, 1, 0, 1,
-0.8995132, -0.314627, -2.319567, 0.9568627, 1, 0, 1,
-0.8990695, -1.389135, -1.139078, 0.9490196, 1, 0, 1,
-0.8981678, -0.1804964, 0.2347946, 0.945098, 1, 0, 1,
-0.8903422, 0.8626242, 0.1359795, 0.9372549, 1, 0, 1,
-0.8891562, 0.5445442, -0.7780092, 0.9333333, 1, 0, 1,
-0.888822, -0.4004142, -0.8223675, 0.9254902, 1, 0, 1,
-0.8864124, -0.7603431, -2.428195, 0.9215686, 1, 0, 1,
-0.8859035, -0.2416857, -0.9748083, 0.9137255, 1, 0, 1,
-0.875705, -1.015378, -1.461245, 0.9098039, 1, 0, 1,
-0.8696747, -0.5334376, -0.9839014, 0.9019608, 1, 0, 1,
-0.8661387, 0.9217716, -0.1823466, 0.8941177, 1, 0, 1,
-0.8631008, 0.3202086, -0.344779, 0.8901961, 1, 0, 1,
-0.8520144, 0.09240177, -0.970687, 0.8823529, 1, 0, 1,
-0.8514232, 0.1402819, -0.6396674, 0.8784314, 1, 0, 1,
-0.8483073, -0.6512579, -1.183704, 0.8705882, 1, 0, 1,
-0.843868, -0.2470624, -0.3162577, 0.8666667, 1, 0, 1,
-0.8435632, -0.6253114, -0.3223124, 0.8588235, 1, 0, 1,
-0.8390862, 0.9749584, -0.9066397, 0.854902, 1, 0, 1,
-0.832717, -1.800151, -2.894677, 0.8470588, 1, 0, 1,
-0.8254923, 0.5775074, -2.31959, 0.8431373, 1, 0, 1,
-0.8214861, -0.3993405, -2.978639, 0.8352941, 1, 0, 1,
-0.8182579, -0.501492, -1.099782, 0.8313726, 1, 0, 1,
-0.8110886, 0.2866285, -1.092574, 0.8235294, 1, 0, 1,
-0.8009414, 0.4358222, -0.9570632, 0.8196079, 1, 0, 1,
-0.7862361, -0.9036656, -2.727257, 0.8117647, 1, 0, 1,
-0.7837653, 0.5182163, -1.282274, 0.8078431, 1, 0, 1,
-0.783671, 0.6066541, -1.404216, 0.8, 1, 0, 1,
-0.7725621, -0.5912551, -1.677979, 0.7921569, 1, 0, 1,
-0.7678328, 0.1300631, -2.009871, 0.7882353, 1, 0, 1,
-0.7627228, -0.2280822, -2.085188, 0.7803922, 1, 0, 1,
-0.757376, -0.3522489, -2.291906, 0.7764706, 1, 0, 1,
-0.7569489, 0.646921, -0.5245566, 0.7686275, 1, 0, 1,
-0.7565491, -0.5341761, -0.8133898, 0.7647059, 1, 0, 1,
-0.750955, -0.954604, -2.088336, 0.7568628, 1, 0, 1,
-0.7460858, 0.7892894, -0.4959449, 0.7529412, 1, 0, 1,
-0.744242, 0.5584176, 0.26546, 0.7450981, 1, 0, 1,
-0.741555, 0.1043894, -0.867637, 0.7411765, 1, 0, 1,
-0.7380056, 1.641426, 0.7663004, 0.7333333, 1, 0, 1,
-0.7371868, 1.598588, -1.761888, 0.7294118, 1, 0, 1,
-0.7293126, 0.6906142, -0.4517826, 0.7215686, 1, 0, 1,
-0.7290974, 0.3322239, 1.522457, 0.7176471, 1, 0, 1,
-0.7242228, -0.374723, -1.520014, 0.7098039, 1, 0, 1,
-0.7226231, 1.007533, -1.307245, 0.7058824, 1, 0, 1,
-0.7220942, -0.6870609, -2.17699, 0.6980392, 1, 0, 1,
-0.7105902, -1.339278, -4.170085, 0.6901961, 1, 0, 1,
-0.7085419, -0.8277821, -2.640636, 0.6862745, 1, 0, 1,
-0.7046849, 0.2814152, -0.9361527, 0.6784314, 1, 0, 1,
-0.6988023, 0.4070447, -0.3565412, 0.6745098, 1, 0, 1,
-0.696428, -0.1466327, -1.233712, 0.6666667, 1, 0, 1,
-0.6931442, 1.396201, 0.8759218, 0.6627451, 1, 0, 1,
-0.6931184, 1.245962, -0.3272733, 0.654902, 1, 0, 1,
-0.6812388, -2.030067, -2.116066, 0.6509804, 1, 0, 1,
-0.6806926, -1.043121, -1.750324, 0.6431373, 1, 0, 1,
-0.6788607, -0.7772196, -2.564413, 0.6392157, 1, 0, 1,
-0.6769441, 0.6633253, 0.6547753, 0.6313726, 1, 0, 1,
-0.6758243, -1.163013, -1.084057, 0.627451, 1, 0, 1,
-0.6697302, 0.2827881, -1.089499, 0.6196079, 1, 0, 1,
-0.6689683, -0.5989849, -2.344555, 0.6156863, 1, 0, 1,
-0.664052, -0.1949868, -1.318476, 0.6078432, 1, 0, 1,
-0.6635348, -0.5969327, -1.247256, 0.6039216, 1, 0, 1,
-0.6628187, -0.136424, -1.240604, 0.5960785, 1, 0, 1,
-0.6591831, -0.4104154, -2.591449, 0.5882353, 1, 0, 1,
-0.6587985, -0.7326754, -1.745272, 0.5843138, 1, 0, 1,
-0.6585934, 0.2717895, -2.376063, 0.5764706, 1, 0, 1,
-0.6552473, -0.05381973, -2.072329, 0.572549, 1, 0, 1,
-0.650049, 0.371996, -1.654703, 0.5647059, 1, 0, 1,
-0.6495501, 0.4473614, -0.5113745, 0.5607843, 1, 0, 1,
-0.64923, 0.06954294, -1.607781, 0.5529412, 1, 0, 1,
-0.6451077, 0.08717316, -3.824915, 0.5490196, 1, 0, 1,
-0.6427138, 0.9841914, -0.7798511, 0.5411765, 1, 0, 1,
-0.6408593, 0.7292677, -1.060638, 0.5372549, 1, 0, 1,
-0.6388608, 0.3075869, -1.044082, 0.5294118, 1, 0, 1,
-0.6371108, -1.271088, -2.488024, 0.5254902, 1, 0, 1,
-0.6221395, 1.138749, 0.7313169, 0.5176471, 1, 0, 1,
-0.6220702, -2.311854, -2.044691, 0.5137255, 1, 0, 1,
-0.616237, -2.363003, -2.777416, 0.5058824, 1, 0, 1,
-0.6115028, -0.1184348, -2.072819, 0.5019608, 1, 0, 1,
-0.6102206, -1.534059, -2.310128, 0.4941176, 1, 0, 1,
-0.6018374, 1.935399, 0.8212312, 0.4862745, 1, 0, 1,
-0.5941603, -0.2200794, -0.8118004, 0.4823529, 1, 0, 1,
-0.5880609, -0.5055693, -2.940692, 0.4745098, 1, 0, 1,
-0.5860602, 0.2007357, -3.052901, 0.4705882, 1, 0, 1,
-0.585385, -0.4103436, -1.312352, 0.4627451, 1, 0, 1,
-0.5827631, 0.1993057, -1.532021, 0.4588235, 1, 0, 1,
-0.580606, -1.749138, -1.895619, 0.4509804, 1, 0, 1,
-0.5801536, 0.7150651, 0.1485537, 0.4470588, 1, 0, 1,
-0.5776884, -0.1401498, -2.397152, 0.4392157, 1, 0, 1,
-0.5764537, -0.3940245, -2.291631, 0.4352941, 1, 0, 1,
-0.5744507, -0.1147485, -1.905414, 0.427451, 1, 0, 1,
-0.5683461, -0.887382, -2.145338, 0.4235294, 1, 0, 1,
-0.5674168, 1.805802, -0.1553367, 0.4156863, 1, 0, 1,
-0.5619709, 0.11443, -0.3832451, 0.4117647, 1, 0, 1,
-0.5563331, -0.6163053, -2.49333, 0.4039216, 1, 0, 1,
-0.555558, 0.3886121, -0.8989221, 0.3960784, 1, 0, 1,
-0.553083, 1.101215, -0.9929538, 0.3921569, 1, 0, 1,
-0.5514511, -2.09949, -1.966593, 0.3843137, 1, 0, 1,
-0.5404783, -0.2461875, -2.50896, 0.3803922, 1, 0, 1,
-0.5388278, 0.7407385, -2.524613, 0.372549, 1, 0, 1,
-0.5377351, 0.1379731, -0.6636195, 0.3686275, 1, 0, 1,
-0.5376378, -1.408833, -2.823086, 0.3607843, 1, 0, 1,
-0.5285538, -0.9105765, -2.90551, 0.3568628, 1, 0, 1,
-0.528521, 0.8230643, 0.008637603, 0.3490196, 1, 0, 1,
-0.5278066, 0.9802496, -0.5568457, 0.345098, 1, 0, 1,
-0.5163807, 0.4779904, -1.233051, 0.3372549, 1, 0, 1,
-0.5152439, 0.09095091, -1.120469, 0.3333333, 1, 0, 1,
-0.5141349, -0.2868784, -0.5984358, 0.3254902, 1, 0, 1,
-0.5138209, 0.1597969, -2.729544, 0.3215686, 1, 0, 1,
-0.5136641, 0.6844792, -1.486295, 0.3137255, 1, 0, 1,
-0.5107394, -0.7917543, -3.738591, 0.3098039, 1, 0, 1,
-0.4988801, 1.597105, 1.022112, 0.3019608, 1, 0, 1,
-0.4974887, -1.551241, -3.909765, 0.2941177, 1, 0, 1,
-0.4963067, 0.3247051, -2.267302, 0.2901961, 1, 0, 1,
-0.4911068, -0.9225518, -2.03607, 0.282353, 1, 0, 1,
-0.4901387, 0.01400538, -1.551482, 0.2784314, 1, 0, 1,
-0.4792735, 0.1875394, -0.8712575, 0.2705882, 1, 0, 1,
-0.4790959, -1.775956, -2.069511, 0.2666667, 1, 0, 1,
-0.4768213, -0.6095724, -1.964631, 0.2588235, 1, 0, 1,
-0.4725078, -0.2709805, -1.676442, 0.254902, 1, 0, 1,
-0.4703418, -0.4196269, -1.910834, 0.2470588, 1, 0, 1,
-0.4687456, 0.02930324, -1.232257, 0.2431373, 1, 0, 1,
-0.4644594, -1.604681, -2.780197, 0.2352941, 1, 0, 1,
-0.462418, 0.5722205, 1.235546, 0.2313726, 1, 0, 1,
-0.4622097, 0.05519465, -1.742399, 0.2235294, 1, 0, 1,
-0.4543885, -1.082419, -3.104874, 0.2196078, 1, 0, 1,
-0.4493226, 0.2126007, -0.7323148, 0.2117647, 1, 0, 1,
-0.4486602, -1.040412, -2.566942, 0.2078431, 1, 0, 1,
-0.4484248, -0.4123707, -1.773398, 0.2, 1, 0, 1,
-0.4482567, -1.83067, -2.962644, 0.1921569, 1, 0, 1,
-0.4443837, 0.5417072, -1.053946, 0.1882353, 1, 0, 1,
-0.4418831, -0.5670205, -2.602309, 0.1803922, 1, 0, 1,
-0.4376035, 0.03769914, -1.503095, 0.1764706, 1, 0, 1,
-0.4373669, 0.7565324, 0.3512457, 0.1686275, 1, 0, 1,
-0.436416, -0.1449832, -2.885618, 0.1647059, 1, 0, 1,
-0.4352823, -0.3378228, -1.375693, 0.1568628, 1, 0, 1,
-0.4330734, 0.2304454, -1.193456, 0.1529412, 1, 0, 1,
-0.4315188, -0.2787209, -3.51637, 0.145098, 1, 0, 1,
-0.4291677, 1.029108, -0.7021883, 0.1411765, 1, 0, 1,
-0.4141423, 0.8087462, -1.840062, 0.1333333, 1, 0, 1,
-0.4079065, 0.4146521, 0.2967866, 0.1294118, 1, 0, 1,
-0.4014641, -2.531412, -1.978033, 0.1215686, 1, 0, 1,
-0.3975094, 1.796631, -2.354464, 0.1176471, 1, 0, 1,
-0.3973041, -0.6745749, -2.216862, 0.1098039, 1, 0, 1,
-0.3957138, -0.5985085, -4.739337, 0.1058824, 1, 0, 1,
-0.3951497, -2.05118, -2.202775, 0.09803922, 1, 0, 1,
-0.3879854, -0.6736459, -2.435966, 0.09019608, 1, 0, 1,
-0.3856375, 0.4585912, -0.6532586, 0.08627451, 1, 0, 1,
-0.3803219, 0.2409809, 0.2628072, 0.07843138, 1, 0, 1,
-0.3758846, 0.09572159, -0.4011219, 0.07450981, 1, 0, 1,
-0.373181, 0.2038684, 1.062731, 0.06666667, 1, 0, 1,
-0.369592, 0.7740245, -1.229434, 0.0627451, 1, 0, 1,
-0.3625322, -1.22587, -1.722992, 0.05490196, 1, 0, 1,
-0.3583128, 0.8180087, 0.6969419, 0.05098039, 1, 0, 1,
-0.3573183, -2.240606, -3.013903, 0.04313726, 1, 0, 1,
-0.3569764, 0.6202827, 0.146627, 0.03921569, 1, 0, 1,
-0.3557915, -0.9595777, -3.436506, 0.03137255, 1, 0, 1,
-0.3555904, -0.6707248, -2.005494, 0.02745098, 1, 0, 1,
-0.3543558, -1.176071, -3.196384, 0.01960784, 1, 0, 1,
-0.3517753, 0.06040612, -0.9828306, 0.01568628, 1, 0, 1,
-0.3512685, 0.7954984, 0.4908636, 0.007843138, 1, 0, 1,
-0.3496378, -0.8847739, -2.621336, 0.003921569, 1, 0, 1,
-0.3466222, -0.3330113, -1.701152, 0, 1, 0.003921569, 1,
-0.3451727, -1.046359, -3.794581, 0, 1, 0.01176471, 1,
-0.3433972, -0.193093, -2.710574, 0, 1, 0.01568628, 1,
-0.3414283, 0.1953092, -0.5077777, 0, 1, 0.02352941, 1,
-0.3402306, 0.4948934, 1.147503, 0, 1, 0.02745098, 1,
-0.3396531, 0.1708014, -0.5563412, 0, 1, 0.03529412, 1,
-0.3382425, 2.451309, 1.449024, 0, 1, 0.03921569, 1,
-0.3367271, -0.3078214, -1.783747, 0, 1, 0.04705882, 1,
-0.3344295, -1.28423, -1.460767, 0, 1, 0.05098039, 1,
-0.3344057, 0.8388873, 0.5029599, 0, 1, 0.05882353, 1,
-0.3201663, 0.4478917, -1.727167, 0, 1, 0.0627451, 1,
-0.3191651, 0.4734462, -0.7173231, 0, 1, 0.07058824, 1,
-0.317969, -0.4525569, -3.816152, 0, 1, 0.07450981, 1,
-0.3157411, 0.5806748, -0.5324537, 0, 1, 0.08235294, 1,
-0.31543, 0.2676491, -0.2815555, 0, 1, 0.08627451, 1,
-0.3113101, 0.9398628, -0.8406122, 0, 1, 0.09411765, 1,
-0.3091959, -0.4650975, -3.885188, 0, 1, 0.1019608, 1,
-0.3062567, 0.03522218, -2.736285, 0, 1, 0.1058824, 1,
-0.3059819, 1.347562, -0.006717447, 0, 1, 0.1137255, 1,
-0.3036235, 0.2763041, -2.116134, 0, 1, 0.1176471, 1,
-0.3032241, -0.280577, -4.362754, 0, 1, 0.1254902, 1,
-0.3021191, 0.5818323, -1.578651, 0, 1, 0.1294118, 1,
-0.2982241, -0.2375832, -1.060551, 0, 1, 0.1372549, 1,
-0.2949299, 1.491829, -1.103629, 0, 1, 0.1411765, 1,
-0.2892858, -1.121127, -3.74811, 0, 1, 0.1490196, 1,
-0.2829153, -0.3113137, -2.043473, 0, 1, 0.1529412, 1,
-0.2827424, -0.05484558, -0.6026971, 0, 1, 0.1607843, 1,
-0.2823476, 1.947948, 0.466729, 0, 1, 0.1647059, 1,
-0.280741, -0.9258751, -4.066607, 0, 1, 0.172549, 1,
-0.2752203, -0.07860344, -1.406372, 0, 1, 0.1764706, 1,
-0.2737892, 0.6535787, -1.057021, 0, 1, 0.1843137, 1,
-0.2722381, -0.07758347, -1.966775, 0, 1, 0.1882353, 1,
-0.2706112, 1.366679, -1.275295, 0, 1, 0.1960784, 1,
-0.2668262, 0.448848, -2.294865, 0, 1, 0.2039216, 1,
-0.2647264, -0.923652, -4.149035, 0, 1, 0.2078431, 1,
-0.2643007, -0.9424099, -2.173568, 0, 1, 0.2156863, 1,
-0.2637758, -0.8728415, -2.443222, 0, 1, 0.2196078, 1,
-0.2619251, 0.3040321, -1.080569, 0, 1, 0.227451, 1,
-0.257259, 0.5985609, 0.004098025, 0, 1, 0.2313726, 1,
-0.2563204, -0.3950849, -3.168539, 0, 1, 0.2392157, 1,
-0.2536218, -1.909118, -3.901106, 0, 1, 0.2431373, 1,
-0.251423, -0.4803534, -3.517944, 0, 1, 0.2509804, 1,
-0.2454014, -0.490345, -1.964659, 0, 1, 0.254902, 1,
-0.2404077, 0.6019173, -0.7633429, 0, 1, 0.2627451, 1,
-0.2397042, -0.4867644, -2.703893, 0, 1, 0.2666667, 1,
-0.2386669, 0.5889474, 0.7652447, 0, 1, 0.2745098, 1,
-0.2337025, -0.629504, -0.9494962, 0, 1, 0.2784314, 1,
-0.2311262, 0.2650752, -0.8085633, 0, 1, 0.2862745, 1,
-0.2298933, 0.3913627, -0.1042371, 0, 1, 0.2901961, 1,
-0.2298624, -0.3505905, -0.7342632, 0, 1, 0.2980392, 1,
-0.2292178, 1.605295, -0.9158739, 0, 1, 0.3058824, 1,
-0.2290455, -0.8512669, -2.400483, 0, 1, 0.3098039, 1,
-0.2240115, 1.297931, -1.399083, 0, 1, 0.3176471, 1,
-0.2238478, -0.7163452, -2.953646, 0, 1, 0.3215686, 1,
-0.2229836, -0.4030237, -5.038395, 0, 1, 0.3294118, 1,
-0.2210079, 0.934387, -0.7709588, 0, 1, 0.3333333, 1,
-0.2162174, -0.2003167, -3.480875, 0, 1, 0.3411765, 1,
-0.2043867, -2.162787, -2.592794, 0, 1, 0.345098, 1,
-0.2031598, -0.4091042, -4.198774, 0, 1, 0.3529412, 1,
-0.1988317, -1.62438, -1.208008, 0, 1, 0.3568628, 1,
-0.1968168, 1.563734, 1.25818, 0, 1, 0.3647059, 1,
-0.1900127, -0.8176842, -2.768188, 0, 1, 0.3686275, 1,
-0.187755, 0.3087081, -0.7181553, 0, 1, 0.3764706, 1,
-0.1877326, 1.206552, 0.8252051, 0, 1, 0.3803922, 1,
-0.1864014, 1.464903, -0.3434216, 0, 1, 0.3882353, 1,
-0.1831181, -0.3609461, -5.124979, 0, 1, 0.3921569, 1,
-0.1788121, -0.5434342, -4.576939, 0, 1, 0.4, 1,
-0.1742917, -0.08384469, -1.394098, 0, 1, 0.4078431, 1,
-0.1736509, -0.4220801, -3.103302, 0, 1, 0.4117647, 1,
-0.1729995, -1.027244, -4.650113, 0, 1, 0.4196078, 1,
-0.1642769, 0.2174489, -1.054968, 0, 1, 0.4235294, 1,
-0.1631121, -0.6455035, -3.020633, 0, 1, 0.4313726, 1,
-0.1625758, 0.3517869, 0.4372432, 0, 1, 0.4352941, 1,
-0.1603084, 0.457308, -1.310799, 0, 1, 0.4431373, 1,
-0.1602181, 2.164785, -0.05823233, 0, 1, 0.4470588, 1,
-0.1593197, -0.469889, -2.401397, 0, 1, 0.454902, 1,
-0.1577382, 0.04677419, -1.094518, 0, 1, 0.4588235, 1,
-0.1537491, -0.4690215, -1.114855, 0, 1, 0.4666667, 1,
-0.1536158, -1.53421, -3.665761, 0, 1, 0.4705882, 1,
-0.1528564, 0.3173797, 0.5622137, 0, 1, 0.4784314, 1,
-0.1522914, -0.2709042, -3.987782, 0, 1, 0.4823529, 1,
-0.1497895, 0.4276801, -1.165625, 0, 1, 0.4901961, 1,
-0.147586, 0.4954833, -0.4830612, 0, 1, 0.4941176, 1,
-0.1473976, -1.423974, -3.057763, 0, 1, 0.5019608, 1,
-0.145384, 1.095316, -0.9033658, 0, 1, 0.509804, 1,
-0.1420617, -0.447515, -3.465412, 0, 1, 0.5137255, 1,
-0.140847, -1.06026, -3.155694, 0, 1, 0.5215687, 1,
-0.1395461, 0.3866804, -0.4933991, 0, 1, 0.5254902, 1,
-0.1364101, -0.09574843, -2.459883, 0, 1, 0.5333334, 1,
-0.1358679, 0.9577843, -0.9120248, 0, 1, 0.5372549, 1,
-0.1330688, -0.2886523, -1.008894, 0, 1, 0.5450981, 1,
-0.1280031, 0.2298424, -2.176473, 0, 1, 0.5490196, 1,
-0.127463, 0.5998092, -0.4363634, 0, 1, 0.5568628, 1,
-0.1260377, -0.6939016, -2.601831, 0, 1, 0.5607843, 1,
-0.1253144, -0.1527209, -1.26926, 0, 1, 0.5686275, 1,
-0.1249577, -0.1915255, -2.405606, 0, 1, 0.572549, 1,
-0.1249413, -1.144346, -3.169303, 0, 1, 0.5803922, 1,
-0.1235461, 0.4936385, -0.5872585, 0, 1, 0.5843138, 1,
-0.1216966, 0.441909, -1.302746, 0, 1, 0.5921569, 1,
-0.1207392, -1.133004, -4.692186, 0, 1, 0.5960785, 1,
-0.1123723, -1.662062, -1.995401, 0, 1, 0.6039216, 1,
-0.1109606, -0.2156893, -3.78563, 0, 1, 0.6117647, 1,
-0.1076418, 0.1407968, 1.382658, 0, 1, 0.6156863, 1,
-0.1075018, -0.1794739, -2.935974, 0, 1, 0.6235294, 1,
-0.1054227, -0.119543, -4.244853, 0, 1, 0.627451, 1,
-0.1027489, 0.7097332, -1.859132, 0, 1, 0.6352941, 1,
-0.101578, -0.7264606, -4.499329, 0, 1, 0.6392157, 1,
-0.09159245, -0.7851551, -2.347622, 0, 1, 0.6470588, 1,
-0.08965561, -0.839298, -2.481415, 0, 1, 0.6509804, 1,
-0.0845539, 1.44285, 0.6097515, 0, 1, 0.6588235, 1,
-0.08323843, 0.8076915, -0.496414, 0, 1, 0.6627451, 1,
-0.08018508, -1.348737, -1.971249, 0, 1, 0.6705883, 1,
-0.07814007, 2.14475, -1.07034, 0, 1, 0.6745098, 1,
-0.07477244, 0.8113545, -0.558918, 0, 1, 0.682353, 1,
-0.07381199, 1.33666, -0.2475898, 0, 1, 0.6862745, 1,
-0.07091873, -1.603421, -2.590719, 0, 1, 0.6941177, 1,
-0.06763762, -1.393706, -2.707959, 0, 1, 0.7019608, 1,
-0.06635915, -0.06084146, -1.423998, 0, 1, 0.7058824, 1,
-0.06544165, -0.246479, -1.996351, 0, 1, 0.7137255, 1,
-0.06216098, -0.9772903, -4.412941, 0, 1, 0.7176471, 1,
-0.06033814, -0.2138554, -4.51992, 0, 1, 0.7254902, 1,
-0.05945781, -2.013848, -3.586111, 0, 1, 0.7294118, 1,
-0.05906293, -0.723856, -3.748304, 0, 1, 0.7372549, 1,
-0.05812122, 0.261921, -0.9552506, 0, 1, 0.7411765, 1,
-0.04732357, 0.6809464, -0.1654377, 0, 1, 0.7490196, 1,
-0.04708823, 0.7652496, 0.08113444, 0, 1, 0.7529412, 1,
-0.04332426, -0.9841087, -3.965672, 0, 1, 0.7607843, 1,
-0.04300785, -0.1956023, -3.328525, 0, 1, 0.7647059, 1,
-0.04220773, 0.7348464, 0.01689863, 0, 1, 0.772549, 1,
-0.04202339, -0.4507714, -1.966875, 0, 1, 0.7764706, 1,
-0.03897896, -1.407637, -2.992448, 0, 1, 0.7843137, 1,
-0.03883794, -1.032296, -3.001747, 0, 1, 0.7882353, 1,
-0.03805508, -0.1839722, -1.831507, 0, 1, 0.7960784, 1,
-0.03183269, 1.10643, -1.375049, 0, 1, 0.8039216, 1,
-0.02866793, 1.390658, 1.239197, 0, 1, 0.8078431, 1,
-0.02773187, 0.5651671, 0.1996858, 0, 1, 0.8156863, 1,
-0.02715451, -0.08163526, -1.444553, 0, 1, 0.8196079, 1,
-0.02480364, 1.065976, 0.8426144, 0, 1, 0.827451, 1,
-0.02092957, 0.5038815, -0.5501969, 0, 1, 0.8313726, 1,
-0.01982469, 0.4974809, 1.880137, 0, 1, 0.8392157, 1,
-0.01496048, 1.301968, 0.4266283, 0, 1, 0.8431373, 1,
-0.01461052, 0.5920997, 0.7873783, 0, 1, 0.8509804, 1,
-0.01402656, -0.5309031, -0.5778105, 0, 1, 0.854902, 1,
-0.01231521, -0.8019074, -3.239664, 0, 1, 0.8627451, 1,
-0.01209602, -0.2797103, -2.225251, 0, 1, 0.8666667, 1,
-0.01208705, 0.1472337, -0.3133899, 0, 1, 0.8745098, 1,
-0.01190286, -0.6265653, -3.294418, 0, 1, 0.8784314, 1,
-0.00745351, -0.243693, -2.552438, 0, 1, 0.8862745, 1,
-0.002228233, 1.282479, -0.3441356, 0, 1, 0.8901961, 1,
0.0001423745, -0.9676092, 2.562183, 0, 1, 0.8980392, 1,
0.00311123, -0.1009917, 2.618581, 0, 1, 0.9058824, 1,
0.003196946, -0.5294315, 2.640034, 0, 1, 0.9098039, 1,
0.003884676, -1.55773, 2.73708, 0, 1, 0.9176471, 1,
0.005235746, 1.223784, -0.8286675, 0, 1, 0.9215686, 1,
0.006612861, 0.01534183, 1.50187, 0, 1, 0.9294118, 1,
0.008488221, 0.241445, -0.1919954, 0, 1, 0.9333333, 1,
0.009299444, -0.8137575, 2.899772, 0, 1, 0.9411765, 1,
0.0105038, 1.315843, -0.9926296, 0, 1, 0.945098, 1,
0.0113275, 0.7413177, 0.1279546, 0, 1, 0.9529412, 1,
0.0121718, -0.257545, 2.258989, 0, 1, 0.9568627, 1,
0.01356281, 0.7011243, 0.04303415, 0, 1, 0.9647059, 1,
0.01422443, -0.5347335, 3.444348, 0, 1, 0.9686275, 1,
0.01462219, -1.136676, 5.731266, 0, 1, 0.9764706, 1,
0.01462497, -1.286371, 3.891018, 0, 1, 0.9803922, 1,
0.01531709, 0.728678, 0.8952247, 0, 1, 0.9882353, 1,
0.01986158, 0.654283, -0.08575625, 0, 1, 0.9921569, 1,
0.02246135, -0.8238867, 2.388116, 0, 1, 1, 1,
0.02378414, -0.7921519, 2.051219, 0, 0.9921569, 1, 1,
0.02571157, -0.9644491, 2.899096, 0, 0.9882353, 1, 1,
0.02625644, 1.183609, -1.250556, 0, 0.9803922, 1, 1,
0.02679144, -0.01049065, 1.615023, 0, 0.9764706, 1, 1,
0.02691501, -0.006693905, 1.457881, 0, 0.9686275, 1, 1,
0.03167772, -0.5532141, 1.399053, 0, 0.9647059, 1, 1,
0.03395178, 1.103856, -0.04117021, 0, 0.9568627, 1, 1,
0.03402801, -2.353639, 2.946313, 0, 0.9529412, 1, 1,
0.03480066, 2.106902, -0.05219279, 0, 0.945098, 1, 1,
0.03566324, -1.056196, 3.128252, 0, 0.9411765, 1, 1,
0.03654606, 0.4456701, 0.4057179, 0, 0.9333333, 1, 1,
0.0369328, 0.2996947, -1.509829, 0, 0.9294118, 1, 1,
0.0409767, -1.722596, 3.306528, 0, 0.9215686, 1, 1,
0.04141808, -0.4140726, 2.827686, 0, 0.9176471, 1, 1,
0.04335741, 1.273467, 1.015481, 0, 0.9098039, 1, 1,
0.04534798, -0.7265509, 2.852902, 0, 0.9058824, 1, 1,
0.04584524, 1.668223, -0.8047159, 0, 0.8980392, 1, 1,
0.04755688, -0.699866, 1.814697, 0, 0.8901961, 1, 1,
0.05299609, 0.1104513, 0.1857711, 0, 0.8862745, 1, 1,
0.05358292, -1.451496, 3.611356, 0, 0.8784314, 1, 1,
0.05464715, 1.483585, -0.1120734, 0, 0.8745098, 1, 1,
0.05548501, 0.4743754, -0.0374446, 0, 0.8666667, 1, 1,
0.05653236, 0.6662796, 2.204098, 0, 0.8627451, 1, 1,
0.05716512, 2.301304, 0.003929184, 0, 0.854902, 1, 1,
0.05812407, -0.5791129, 4.078957, 0, 0.8509804, 1, 1,
0.05981798, 2.789624, -0.7570536, 0, 0.8431373, 1, 1,
0.06262277, 0.8135242, 0.4690652, 0, 0.8392157, 1, 1,
0.06526776, 0.3125671, 2.118733, 0, 0.8313726, 1, 1,
0.06579754, 0.3870554, 0.7695822, 0, 0.827451, 1, 1,
0.06593141, 0.4877281, 2.124307, 0, 0.8196079, 1, 1,
0.06942681, 0.5010889, -0.1869832, 0, 0.8156863, 1, 1,
0.07177171, 0.1969614, 0.4110859, 0, 0.8078431, 1, 1,
0.07266249, 1.175614, -1.953037, 0, 0.8039216, 1, 1,
0.07355659, -1.288239, 2.407637, 0, 0.7960784, 1, 1,
0.07600589, 0.4557961, 0.02479671, 0, 0.7882353, 1, 1,
0.07618272, -1.229227, 3.576281, 0, 0.7843137, 1, 1,
0.07725883, 1.190271, 0.3980336, 0, 0.7764706, 1, 1,
0.07890274, 1.513589, 0.1765759, 0, 0.772549, 1, 1,
0.08000476, -0.4806293, 3.795613, 0, 0.7647059, 1, 1,
0.08629061, 0.2551764, -0.4568649, 0, 0.7607843, 1, 1,
0.08768985, 1.523749, 1.539701, 0, 0.7529412, 1, 1,
0.09337691, 0.5896789, 0.416536, 0, 0.7490196, 1, 1,
0.09361625, -1.066168, 3.358551, 0, 0.7411765, 1, 1,
0.09591131, 0.09627774, 1.376147, 0, 0.7372549, 1, 1,
0.09939676, -0.6978561, 1.414191, 0, 0.7294118, 1, 1,
0.1004033, 0.05712077, 1.431414, 0, 0.7254902, 1, 1,
0.1028758, 1.362673, 0.8513411, 0, 0.7176471, 1, 1,
0.1076818, -0.8908976, 3.822659, 0, 0.7137255, 1, 1,
0.1103154, 2.52265, -0.003602054, 0, 0.7058824, 1, 1,
0.1148774, 0.6256357, 0.8926774, 0, 0.6980392, 1, 1,
0.115665, 0.589716, -1.454718, 0, 0.6941177, 1, 1,
0.1187941, 0.7796395, -0.8972346, 0, 0.6862745, 1, 1,
0.1200171, 0.0703778, 0.2507139, 0, 0.682353, 1, 1,
0.1233942, -0.2588975, 2.0663, 0, 0.6745098, 1, 1,
0.1314697, -0.9700276, 3.279421, 0, 0.6705883, 1, 1,
0.1315778, 1.157193, -1.803857, 0, 0.6627451, 1, 1,
0.1334915, 1.004002, -0.6104621, 0, 0.6588235, 1, 1,
0.1339469, 0.7421677, 1.534377, 0, 0.6509804, 1, 1,
0.1349134, -1.231929, 1.319665, 0, 0.6470588, 1, 1,
0.1362378, -0.9190093, 1.592421, 0, 0.6392157, 1, 1,
0.1422693, -0.410786, 2.341097, 0, 0.6352941, 1, 1,
0.1447275, -0.9791396, 1.714163, 0, 0.627451, 1, 1,
0.1478661, -0.1768104, 2.176022, 0, 0.6235294, 1, 1,
0.1496404, 0.5177172, 0.5296724, 0, 0.6156863, 1, 1,
0.150379, 1.276953, -0.8208168, 0, 0.6117647, 1, 1,
0.1528203, -0.652547, 1.28055, 0, 0.6039216, 1, 1,
0.1535058, 0.8057899, -1.27168, 0, 0.5960785, 1, 1,
0.1535654, -0.0810973, 2.407896, 0, 0.5921569, 1, 1,
0.1543148, 1.375054, -0.02410234, 0, 0.5843138, 1, 1,
0.1625007, 0.8972588, -0.6881284, 0, 0.5803922, 1, 1,
0.1632032, 1.653475, 0.2313002, 0, 0.572549, 1, 1,
0.1652403, 1.449723, 0.112052, 0, 0.5686275, 1, 1,
0.1671646, 0.9866661, -0.05292467, 0, 0.5607843, 1, 1,
0.1690906, 0.704345, -1.863475, 0, 0.5568628, 1, 1,
0.1713095, -1.790597, 4.631445, 0, 0.5490196, 1, 1,
0.1773743, -1.161361, 2.787573, 0, 0.5450981, 1, 1,
0.1823506, -0.5308059, 3.330755, 0, 0.5372549, 1, 1,
0.1824431, 1.066703, 1.10871, 0, 0.5333334, 1, 1,
0.1827448, 2.561058, -0.1336408, 0, 0.5254902, 1, 1,
0.1834982, 0.7203379, 1.437636, 0, 0.5215687, 1, 1,
0.1929309, 0.1388758, 2.67908, 0, 0.5137255, 1, 1,
0.1935461, -0.1900426, 2.133172, 0, 0.509804, 1, 1,
0.1958808, -0.4065556, 5.036045, 0, 0.5019608, 1, 1,
0.2011319, -0.4558251, 3.904532, 0, 0.4941176, 1, 1,
0.2026246, -0.6518776, 3.68659, 0, 0.4901961, 1, 1,
0.2061933, -1.263516, 3.222933, 0, 0.4823529, 1, 1,
0.2139914, 0.1467171, 1.604788, 0, 0.4784314, 1, 1,
0.2208852, 0.8544266, 0.8476942, 0, 0.4705882, 1, 1,
0.2290374, -1.481699, 3.041682, 0, 0.4666667, 1, 1,
0.2292121, 0.09075991, 2.766548, 0, 0.4588235, 1, 1,
0.2308632, -0.1563818, 1.637476, 0, 0.454902, 1, 1,
0.2331813, 1.264346, 0.5833179, 0, 0.4470588, 1, 1,
0.233932, 2.302719, 1.40072, 0, 0.4431373, 1, 1,
0.2355871, -1.270553, 3.418169, 0, 0.4352941, 1, 1,
0.2363554, 0.3758108, 3.835055, 0, 0.4313726, 1, 1,
0.2435451, 1.361132, -0.1569898, 0, 0.4235294, 1, 1,
0.2446173, -0.6426463, 5.016777, 0, 0.4196078, 1, 1,
0.2486733, -0.7514604, 3.63627, 0, 0.4117647, 1, 1,
0.251718, -0.1887676, 3.427855, 0, 0.4078431, 1, 1,
0.2525679, 0.9827338, 0.02575555, 0, 0.4, 1, 1,
0.25876, 1.474985, -0.4257747, 0, 0.3921569, 1, 1,
0.2603854, -0.7610919, 3.759738, 0, 0.3882353, 1, 1,
0.2638358, 0.8739071, 0.4630585, 0, 0.3803922, 1, 1,
0.264212, -0.03365869, 1.242583, 0, 0.3764706, 1, 1,
0.2676585, 1.030401, -0.4150331, 0, 0.3686275, 1, 1,
0.2706931, 0.7370014, -0.0488268, 0, 0.3647059, 1, 1,
0.2730881, -0.6725149, 1.040371, 0, 0.3568628, 1, 1,
0.273855, 2.476395, -1.16719, 0, 0.3529412, 1, 1,
0.2752143, 1.402665, 0.3455557, 0, 0.345098, 1, 1,
0.2778608, 0.2669005, 0.8720732, 0, 0.3411765, 1, 1,
0.2851034, -0.6849506, 2.489194, 0, 0.3333333, 1, 1,
0.2855184, 0.8720577, -0.6545746, 0, 0.3294118, 1, 1,
0.2867825, 0.05057377, 3.106588, 0, 0.3215686, 1, 1,
0.2879426, -1.336294, 3.402052, 0, 0.3176471, 1, 1,
0.2908676, 1.401264, 1.10147, 0, 0.3098039, 1, 1,
0.2916024, -1.912, 3.005564, 0, 0.3058824, 1, 1,
0.2932758, 1.022356, 1.385366, 0, 0.2980392, 1, 1,
0.2940608, 1.632007, -0.9223204, 0, 0.2901961, 1, 1,
0.2954897, 0.2646693, 0.5381284, 0, 0.2862745, 1, 1,
0.2982053, 0.8745362, 0.8042542, 0, 0.2784314, 1, 1,
0.3002122, -0.3146051, 3.727592, 0, 0.2745098, 1, 1,
0.3020818, -0.03385371, 1.189758, 0, 0.2666667, 1, 1,
0.302126, -1.639854, 2.20671, 0, 0.2627451, 1, 1,
0.3026828, 1.275531, 0.9343654, 0, 0.254902, 1, 1,
0.3032882, -0.5641685, 3.102023, 0, 0.2509804, 1, 1,
0.3043504, 0.145264, 1.303646, 0, 0.2431373, 1, 1,
0.3063858, 0.8484651, -0.3330304, 0, 0.2392157, 1, 1,
0.308171, 0.4907896, 1.570132, 0, 0.2313726, 1, 1,
0.3103371, -0.8826119, 4.431367, 0, 0.227451, 1, 1,
0.3156394, 0.1988507, -1.118228, 0, 0.2196078, 1, 1,
0.3187161, -0.6821064, 2.667212, 0, 0.2156863, 1, 1,
0.3193969, 0.3900151, 0.9153805, 0, 0.2078431, 1, 1,
0.321139, -0.08688868, 1.707547, 0, 0.2039216, 1, 1,
0.3228439, 0.8300153, 0.1842047, 0, 0.1960784, 1, 1,
0.3236341, 0.6465105, -0.02670674, 0, 0.1882353, 1, 1,
0.3311006, -1.504662, 3.343027, 0, 0.1843137, 1, 1,
0.3315282, -0.5979195, 2.001154, 0, 0.1764706, 1, 1,
0.3332275, 0.03416608, 2.120863, 0, 0.172549, 1, 1,
0.3338639, -0.353135, 3.392862, 0, 0.1647059, 1, 1,
0.3372153, 0.6359988, -0.3448624, 0, 0.1607843, 1, 1,
0.3383526, -0.2320503, -0.05327506, 0, 0.1529412, 1, 1,
0.3402583, 1.17323, -0.271569, 0, 0.1490196, 1, 1,
0.3411637, 0.2407883, 1.086094, 0, 0.1411765, 1, 1,
0.3450343, 1.220053, 0.234291, 0, 0.1372549, 1, 1,
0.3450902, 0.2608238, 0.110406, 0, 0.1294118, 1, 1,
0.3489068, -0.1488319, 1.808185, 0, 0.1254902, 1, 1,
0.3517178, 1.08477, 0.7171022, 0, 0.1176471, 1, 1,
0.3520662, 0.9323217, 1.207637, 0, 0.1137255, 1, 1,
0.3522545, 0.7720786, 0.2883464, 0, 0.1058824, 1, 1,
0.3524108, 0.851514, 0.6223059, 0, 0.09803922, 1, 1,
0.3532486, -1.004165, 2.03038, 0, 0.09411765, 1, 1,
0.354617, -1.178303, 3.924504, 0, 0.08627451, 1, 1,
0.3553618, 0.3514662, 0.7914178, 0, 0.08235294, 1, 1,
0.3577908, 0.114233, 1.863309, 0, 0.07450981, 1, 1,
0.367823, -0.02190371, 0.1291767, 0, 0.07058824, 1, 1,
0.3727283, -0.06219001, 1.781795, 0, 0.0627451, 1, 1,
0.3732397, -1.117133, 5.130235, 0, 0.05882353, 1, 1,
0.3819848, -0.9621503, 1.484537, 0, 0.05098039, 1, 1,
0.3830421, 0.655038, -0.2998895, 0, 0.04705882, 1, 1,
0.3887829, -0.7816715, 3.31627, 0, 0.03921569, 1, 1,
0.3899667, 1.065154, 0.6739042, 0, 0.03529412, 1, 1,
0.3911796, 1.894975, 0.9044814, 0, 0.02745098, 1, 1,
0.4005567, 0.8396441, 1.585552, 0, 0.02352941, 1, 1,
0.4013582, -0.004835838, 0.9933408, 0, 0.01568628, 1, 1,
0.4130855, -1.449154, 2.924163, 0, 0.01176471, 1, 1,
0.4131011, -0.7924973, 1.438983, 0, 0.003921569, 1, 1,
0.4152781, 0.4792429, 0.5765206, 0.003921569, 0, 1, 1,
0.4161522, 0.02244274, 1.110972, 0.007843138, 0, 1, 1,
0.4204076, -0.2025793, 1.234735, 0.01568628, 0, 1, 1,
0.4357263, -0.1881291, 0.8837925, 0.01960784, 0, 1, 1,
0.4397763, 0.7115075, -1.320248, 0.02745098, 0, 1, 1,
0.4417248, 0.3181872, 1.853507, 0.03137255, 0, 1, 1,
0.4438336, -0.1213071, 1.459661, 0.03921569, 0, 1, 1,
0.4498242, 0.05741354, 1.983169, 0.04313726, 0, 1, 1,
0.4525182, 0.2410201, 0.9527214, 0.05098039, 0, 1, 1,
0.4569818, 0.2235856, 0.7970256, 0.05490196, 0, 1, 1,
0.4593767, -0.7629812, 1.964056, 0.0627451, 0, 1, 1,
0.4599358, 0.002533298, 0.9550144, 0.06666667, 0, 1, 1,
0.4649577, -0.05912425, 1.694675, 0.07450981, 0, 1, 1,
0.4686066, 0.7357317, 0.8495838, 0.07843138, 0, 1, 1,
0.4718946, -1.174082, 3.115515, 0.08627451, 0, 1, 1,
0.477448, 0.6030313, 1.461292, 0.09019608, 0, 1, 1,
0.4796427, -2.713681, 2.725515, 0.09803922, 0, 1, 1,
0.4871917, -1.307435, 2.642155, 0.1058824, 0, 1, 1,
0.4881009, 0.2887953, 1.082075, 0.1098039, 0, 1, 1,
0.4926677, 0.5701387, 1.744179, 0.1176471, 0, 1, 1,
0.494027, 0.5011846, 0.4587674, 0.1215686, 0, 1, 1,
0.4979365, -1.007073, 2.57772, 0.1294118, 0, 1, 1,
0.4979614, 0.022866, 0.6972035, 0.1333333, 0, 1, 1,
0.5132908, -0.3333816, 2.36915, 0.1411765, 0, 1, 1,
0.5185779, -0.5795504, 4.562175, 0.145098, 0, 1, 1,
0.5255362, 3.171593, -0.2900912, 0.1529412, 0, 1, 1,
0.5271953, -0.7374282, 2.005482, 0.1568628, 0, 1, 1,
0.5274959, -0.2500565, 2.545622, 0.1647059, 0, 1, 1,
0.5307314, -1.71459, 3.030649, 0.1686275, 0, 1, 1,
0.5420259, 2.832274, 0.6227683, 0.1764706, 0, 1, 1,
0.545495, 0.5212837, 0.687693, 0.1803922, 0, 1, 1,
0.5513988, -0.4919866, 3.09671, 0.1882353, 0, 1, 1,
0.5520781, -1.133162, 2.753703, 0.1921569, 0, 1, 1,
0.5572442, -0.3932066, 1.369853, 0.2, 0, 1, 1,
0.5584794, -0.2524645, 0.7983054, 0.2078431, 0, 1, 1,
0.5648059, 0.4489121, 0.6402363, 0.2117647, 0, 1, 1,
0.5648965, -0.2845312, 0.516038, 0.2196078, 0, 1, 1,
0.5663639, 1.100589, -0.1213174, 0.2235294, 0, 1, 1,
0.5672684, 0.03341857, 0.6454723, 0.2313726, 0, 1, 1,
0.5690969, -0.4318614, 1.892973, 0.2352941, 0, 1, 1,
0.5724788, 0.4601165, 1.221142, 0.2431373, 0, 1, 1,
0.57472, -1.288872, 3.515848, 0.2470588, 0, 1, 1,
0.5752149, 0.1920165, 1.138194, 0.254902, 0, 1, 1,
0.5906073, -0.8387091, 2.372541, 0.2588235, 0, 1, 1,
0.5919195, 0.4485557, 0.2865354, 0.2666667, 0, 1, 1,
0.5961074, 0.9414594, 0.9229861, 0.2705882, 0, 1, 1,
0.5981176, 0.434321, -0.6555481, 0.2784314, 0, 1, 1,
0.5987347, -0.958885, 3.888941, 0.282353, 0, 1, 1,
0.6001846, -0.7661693, 1.477144, 0.2901961, 0, 1, 1,
0.6071339, 1.465595, -0.5361753, 0.2941177, 0, 1, 1,
0.6084459, -1.318384, 1.965513, 0.3019608, 0, 1, 1,
0.6088122, -1.472541, 1.533987, 0.3098039, 0, 1, 1,
0.6099494, -1.879726, 3.717502, 0.3137255, 0, 1, 1,
0.6103973, 0.8769365, -0.0638489, 0.3215686, 0, 1, 1,
0.6105903, -0.2640752, 1.902825, 0.3254902, 0, 1, 1,
0.6137461, 0.8111869, 1.194012, 0.3333333, 0, 1, 1,
0.6149052, -1.360715, 2.599813, 0.3372549, 0, 1, 1,
0.6167446, 0.5736899, 0.2046244, 0.345098, 0, 1, 1,
0.6199149, 0.04459857, 2.015583, 0.3490196, 0, 1, 1,
0.6200241, -0.8596227, 0.8024039, 0.3568628, 0, 1, 1,
0.6244347, 0.2182838, 0.07674561, 0.3607843, 0, 1, 1,
0.6251476, -0.6468781, 3.480389, 0.3686275, 0, 1, 1,
0.6252747, -1.078595, 2.456246, 0.372549, 0, 1, 1,
0.6259812, -0.446335, 2.898496, 0.3803922, 0, 1, 1,
0.6299205, 0.3736656, 1.449638, 0.3843137, 0, 1, 1,
0.6352783, 1.730567, 1.151107, 0.3921569, 0, 1, 1,
0.6354672, 0.2569372, 0.6513066, 0.3960784, 0, 1, 1,
0.6356916, -0.7355393, 4.469043, 0.4039216, 0, 1, 1,
0.6371491, -0.4585748, 1.425415, 0.4117647, 0, 1, 1,
0.6371711, 0.1247685, -0.4565818, 0.4156863, 0, 1, 1,
0.6371799, 1.458166, 1.782689, 0.4235294, 0, 1, 1,
0.6401228, 1.349154, -0.9948276, 0.427451, 0, 1, 1,
0.641856, -1.09022, 2.574649, 0.4352941, 0, 1, 1,
0.6430615, -0.314353, 1.834947, 0.4392157, 0, 1, 1,
0.6450763, 1.300557, 0.2933159, 0.4470588, 0, 1, 1,
0.6457875, -1.169915, 4.146579, 0.4509804, 0, 1, 1,
0.6462532, 0.9416317, 0.01551777, 0.4588235, 0, 1, 1,
0.6501706, -0.3397257, 0.8849707, 0.4627451, 0, 1, 1,
0.6511742, 0.09696074, 3.120889, 0.4705882, 0, 1, 1,
0.653473, -0.5591322, 3.166615, 0.4745098, 0, 1, 1,
0.6559489, -0.3176431, 2.872864, 0.4823529, 0, 1, 1,
0.6572389, -0.8168019, 3.174714, 0.4862745, 0, 1, 1,
0.6615995, -0.7973709, 1.914761, 0.4941176, 0, 1, 1,
0.6631387, -0.7491884, 1.860236, 0.5019608, 0, 1, 1,
0.6658206, -1.759567, 2.555087, 0.5058824, 0, 1, 1,
0.6679417, 0.2744458, -0.7404228, 0.5137255, 0, 1, 1,
0.6701083, 0.04118617, 0.562601, 0.5176471, 0, 1, 1,
0.670126, 0.04554583, -0.2681664, 0.5254902, 0, 1, 1,
0.6705495, 0.3034553, 1.842779, 0.5294118, 0, 1, 1,
0.672977, -1.344825, 2.394719, 0.5372549, 0, 1, 1,
0.6731619, -0.8058532, 3.123302, 0.5411765, 0, 1, 1,
0.674692, 1.516797, 0.3275867, 0.5490196, 0, 1, 1,
0.6795327, -1.331535, 1.57548, 0.5529412, 0, 1, 1,
0.6818938, -0.9085242, 1.95538, 0.5607843, 0, 1, 1,
0.6862271, 1.030189, -0.5224146, 0.5647059, 0, 1, 1,
0.6883184, 0.5214891, 2.167783, 0.572549, 0, 1, 1,
0.6884646, 0.6720288, 1.841255, 0.5764706, 0, 1, 1,
0.695495, -0.5835941, 2.369642, 0.5843138, 0, 1, 1,
0.6961532, -0.2258592, 2.805872, 0.5882353, 0, 1, 1,
0.7004576, -0.7037924, 3.847599, 0.5960785, 0, 1, 1,
0.7029634, -0.79804, 4.366141, 0.6039216, 0, 1, 1,
0.7036815, -0.909113, 3.741891, 0.6078432, 0, 1, 1,
0.7040375, -1.395835, 2.723782, 0.6156863, 0, 1, 1,
0.7046146, 2.692841, 1.673068, 0.6196079, 0, 1, 1,
0.7058818, -1.162485, 1.721442, 0.627451, 0, 1, 1,
0.7104213, 0.1936387, 2.516171, 0.6313726, 0, 1, 1,
0.7151467, -0.1456195, 1.675697, 0.6392157, 0, 1, 1,
0.718326, 0.204946, -1.690145, 0.6431373, 0, 1, 1,
0.7205129, -0.1813246, 2.99979, 0.6509804, 0, 1, 1,
0.7214025, -0.3226654, 1.912111, 0.654902, 0, 1, 1,
0.7225723, 0.4342231, 0.6736682, 0.6627451, 0, 1, 1,
0.7230749, -0.7030885, 2.34377, 0.6666667, 0, 1, 1,
0.724568, 1.09306, -1.222095, 0.6745098, 0, 1, 1,
0.7272931, -0.9123667, 1.736063, 0.6784314, 0, 1, 1,
0.7282258, 0.1768991, 0.551064, 0.6862745, 0, 1, 1,
0.733321, 1.986962, -0.2393729, 0.6901961, 0, 1, 1,
0.7341156, 1.231831, 2.170108, 0.6980392, 0, 1, 1,
0.7353446, 0.5723957, -0.08616009, 0.7058824, 0, 1, 1,
0.7392728, 0.2164159, 0.5006995, 0.7098039, 0, 1, 1,
0.7399791, 0.4801286, -0.1432877, 0.7176471, 0, 1, 1,
0.7431679, -0.3229511, 2.615448, 0.7215686, 0, 1, 1,
0.7483001, -0.2111102, 2.375769, 0.7294118, 0, 1, 1,
0.7490727, 0.9207667, 1.698781, 0.7333333, 0, 1, 1,
0.7507523, -0.4557636, 2.335444, 0.7411765, 0, 1, 1,
0.7537533, 0.9141308, 2.671291, 0.7450981, 0, 1, 1,
0.7580618, -0.06057529, 0.8763301, 0.7529412, 0, 1, 1,
0.7591382, -0.3902205, 1.322261, 0.7568628, 0, 1, 1,
0.7745179, 0.8852227, 0.1254162, 0.7647059, 0, 1, 1,
0.7803065, -0.9493402, 1.23479, 0.7686275, 0, 1, 1,
0.7803928, 1.502075, 1.839102, 0.7764706, 0, 1, 1,
0.7884055, -0.8757463, 2.48472, 0.7803922, 0, 1, 1,
0.7947201, -1.421017, 2.928123, 0.7882353, 0, 1, 1,
0.7981016, -0.9245988, 3.117459, 0.7921569, 0, 1, 1,
0.7987723, 0.5916039, 0.5901876, 0.8, 0, 1, 1,
0.8025489, 1.073271, -0.5336553, 0.8078431, 0, 1, 1,
0.8113942, 0.9087346, -0.1690913, 0.8117647, 0, 1, 1,
0.8138277, 0.8704867, 0.3722748, 0.8196079, 0, 1, 1,
0.8175793, 1.514674, 0.04560748, 0.8235294, 0, 1, 1,
0.8191703, 1.416246, 2.227534, 0.8313726, 0, 1, 1,
0.8265033, 0.6059539, 0.8503075, 0.8352941, 0, 1, 1,
0.8270086, 0.4569094, 0.7420843, 0.8431373, 0, 1, 1,
0.8327445, 0.6063366, -0.2197962, 0.8470588, 0, 1, 1,
0.839669, -0.07912728, -0.2276151, 0.854902, 0, 1, 1,
0.8397875, 0.21705, 1.736183, 0.8588235, 0, 1, 1,
0.8438563, 0.8594292, 0.6045174, 0.8666667, 0, 1, 1,
0.8494848, 1.888695, 1.23255, 0.8705882, 0, 1, 1,
0.852551, -0.7771697, 1.550447, 0.8784314, 0, 1, 1,
0.8580878, -1.077698, 2.256109, 0.8823529, 0, 1, 1,
0.8598202, -0.3541422, 3.503299, 0.8901961, 0, 1, 1,
0.8649074, -1.941833, 2.37312, 0.8941177, 0, 1, 1,
0.8661292, 0.03269748, 0.7852329, 0.9019608, 0, 1, 1,
0.8716996, -0.3136488, 2.04436, 0.9098039, 0, 1, 1,
0.8733255, 0.1268029, -0.05744065, 0.9137255, 0, 1, 1,
0.8736987, 0.5725206, 2.301495, 0.9215686, 0, 1, 1,
0.8747648, 0.3713426, -0.1450678, 0.9254902, 0, 1, 1,
0.8759703, 0.8230678, 1.107568, 0.9333333, 0, 1, 1,
0.8768269, -0.1175303, 2.031415, 0.9372549, 0, 1, 1,
0.8815623, 1.669317, 2.515956, 0.945098, 0, 1, 1,
0.8829643, -1.018608, 3.215428, 0.9490196, 0, 1, 1,
0.8848873, -2.998124, 2.803101, 0.9568627, 0, 1, 1,
0.8901247, 0.4122835, 0.1786349, 0.9607843, 0, 1, 1,
0.8942747, -1.525863, 2.769518, 0.9686275, 0, 1, 1,
0.8989912, -1.464306, 2.984522, 0.972549, 0, 1, 1,
0.9033129, 0.9933243, -0.8351153, 0.9803922, 0, 1, 1,
0.9041506, 0.1406122, 0.5025316, 0.9843137, 0, 1, 1,
0.9043661, -1.03312, 2.845452, 0.9921569, 0, 1, 1,
0.9057068, -1.183226, 2.235279, 0.9960784, 0, 1, 1,
0.9088424, 0.3392602, -0.3343776, 1, 0, 0.9960784, 1,
0.9092256, -0.4504884, 1.247373, 1, 0, 0.9882353, 1,
0.9205962, 2.306828, 1.410881, 1, 0, 0.9843137, 1,
0.9246554, 1.109136, 0.05625438, 1, 0, 0.9764706, 1,
0.9276038, -0.05015782, 1.360165, 1, 0, 0.972549, 1,
0.9280885, 0.405605, 0.3209717, 1, 0, 0.9647059, 1,
0.9309026, -1.010906, 2.464388, 1, 0, 0.9607843, 1,
0.9352839, -2.395633, 3.292582, 1, 0, 0.9529412, 1,
0.9393563, 0.8961972, -0.4829494, 1, 0, 0.9490196, 1,
0.9393693, -1.260028, 5.909833, 1, 0, 0.9411765, 1,
0.9523714, -0.3184696, 1.682234, 1, 0, 0.9372549, 1,
0.9524395, 0.3421521, 1.983267, 1, 0, 0.9294118, 1,
0.9585968, 1.997329, 0.7660781, 1, 0, 0.9254902, 1,
0.9652169, -0.2848983, 1.323455, 1, 0, 0.9176471, 1,
0.9655448, 1.28446, 2.063681, 1, 0, 0.9137255, 1,
0.9840862, -0.2225163, 0.4565389, 1, 0, 0.9058824, 1,
0.9857539, 1.065795, -1.18098, 1, 0, 0.9019608, 1,
0.9857823, 1.293947, 2.268593, 1, 0, 0.8941177, 1,
0.9863374, 0.9996241, 0.1092073, 1, 0, 0.8862745, 1,
1.006496, 0.1153179, 3.83171, 1, 0, 0.8823529, 1,
1.010569, -0.1158596, 1.146468, 1, 0, 0.8745098, 1,
1.012879, -0.8937241, 1.995952, 1, 0, 0.8705882, 1,
1.020492, 1.982971, -1.409709, 1, 0, 0.8627451, 1,
1.025263, -1.166068, 2.41838, 1, 0, 0.8588235, 1,
1.025456, -1.972412, 2.348811, 1, 0, 0.8509804, 1,
1.031274, 1.144902, 2.381561, 1, 0, 0.8470588, 1,
1.03894, 0.2860503, 0.824477, 1, 0, 0.8392157, 1,
1.041698, 1.694407, 0.9331874, 1, 0, 0.8352941, 1,
1.044008, -0.3715633, 2.71889, 1, 0, 0.827451, 1,
1.044911, 1.479677, -1.011162, 1, 0, 0.8235294, 1,
1.060427, 0.8299698, 0.3531286, 1, 0, 0.8156863, 1,
1.061411, 0.07322638, 1.063129, 1, 0, 0.8117647, 1,
1.062144, -0.05839104, 0.7965636, 1, 0, 0.8039216, 1,
1.071914, 0.2209216, 0.8135301, 1, 0, 0.7960784, 1,
1.074885, 0.5515132, 1.051601, 1, 0, 0.7921569, 1,
1.076849, 0.02647555, 3.175768, 1, 0, 0.7843137, 1,
1.083427, 2.03331, 0.1547615, 1, 0, 0.7803922, 1,
1.093428, -0.5434199, 3.309914, 1, 0, 0.772549, 1,
1.095321, 1.587982, -0.1806369, 1, 0, 0.7686275, 1,
1.096593, 0.5621988, -0.6704747, 1, 0, 0.7607843, 1,
1.102209, -1.079888, 0.07354629, 1, 0, 0.7568628, 1,
1.109581, -0.4809503, 2.911065, 1, 0, 0.7490196, 1,
1.114525, 1.010232, 0.7802508, 1, 0, 0.7450981, 1,
1.116966, -0.1512882, 2.386228, 1, 0, 0.7372549, 1,
1.11953, -0.8865258, 0.9440578, 1, 0, 0.7333333, 1,
1.12874, -1.56889, 2.761332, 1, 0, 0.7254902, 1,
1.132492, -1.301741, 2.377143, 1, 0, 0.7215686, 1,
1.132885, -0.168071, 3.626777, 1, 0, 0.7137255, 1,
1.134923, -0.9385339, 2.298207, 1, 0, 0.7098039, 1,
1.141086, 0.7379202, 1.849607, 1, 0, 0.7019608, 1,
1.142798, 0.2953339, 1.225527, 1, 0, 0.6941177, 1,
1.145255, -0.9246697, 2.984108, 1, 0, 0.6901961, 1,
1.146813, 0.9038026, 0.7861985, 1, 0, 0.682353, 1,
1.178047, 0.9546154, 0.701325, 1, 0, 0.6784314, 1,
1.197689, -0.0741789, 2.062914, 1, 0, 0.6705883, 1,
1.199116, 0.630246, 1.768343, 1, 0, 0.6666667, 1,
1.201965, -0.9073235, 3.219689, 1, 0, 0.6588235, 1,
1.207624, 0.191942, 1.879224, 1, 0, 0.654902, 1,
1.221273, -0.1866086, 1.770748, 1, 0, 0.6470588, 1,
1.232623, 0.5683333, 0.5809234, 1, 0, 0.6431373, 1,
1.232978, 1.737556, 0.4583443, 1, 0, 0.6352941, 1,
1.23481, -0.9569424, 1.752307, 1, 0, 0.6313726, 1,
1.235781, -0.3302765, 0.9826283, 1, 0, 0.6235294, 1,
1.246348, -0.9378729, 3.533634, 1, 0, 0.6196079, 1,
1.255303, 0.0757404, 2.358578, 1, 0, 0.6117647, 1,
1.255497, -1.34389, 2.629399, 1, 0, 0.6078432, 1,
1.259937, 0.05582806, 2.979295, 1, 0, 0.6, 1,
1.260256, 0.8903617, 0.9655816, 1, 0, 0.5921569, 1,
1.278549, 0.08666503, 3.528719, 1, 0, 0.5882353, 1,
1.282376, 1.451033, 1.770171, 1, 0, 0.5803922, 1,
1.283027, 0.1430727, 1.47091, 1, 0, 0.5764706, 1,
1.292866, 1.319308, 2.246329, 1, 0, 0.5686275, 1,
1.293589, -0.2920729, 0.8391136, 1, 0, 0.5647059, 1,
1.296884, 0.7891055, 0.3406909, 1, 0, 0.5568628, 1,
1.301278, 0.222209, 1.320734, 1, 0, 0.5529412, 1,
1.310788, 0.6761575, 0.3677891, 1, 0, 0.5450981, 1,
1.315923, 0.6223304, 1.801646, 1, 0, 0.5411765, 1,
1.317457, 0.04061491, 1.804453, 1, 0, 0.5333334, 1,
1.324277, 0.02619651, 2.360549, 1, 0, 0.5294118, 1,
1.326986, 1.38659, -1.156447, 1, 0, 0.5215687, 1,
1.329695, -0.2543861, 1.155928, 1, 0, 0.5176471, 1,
1.336036, -0.4386317, -0.1920216, 1, 0, 0.509804, 1,
1.336163, 0.06691761, 0.4045739, 1, 0, 0.5058824, 1,
1.343404, 0.2547222, 1.59594, 1, 0, 0.4980392, 1,
1.346982, 0.5636329, -0.7880499, 1, 0, 0.4901961, 1,
1.357572, -0.7276639, 0.06462374, 1, 0, 0.4862745, 1,
1.35919, -0.3361296, 2.479581, 1, 0, 0.4784314, 1,
1.361165, 0.03247733, 0.1015096, 1, 0, 0.4745098, 1,
1.3667, -1.295734, 2.396492, 1, 0, 0.4666667, 1,
1.369627, -1.526904, 1.644179, 1, 0, 0.4627451, 1,
1.374389, 0.1113124, 1.953961, 1, 0, 0.454902, 1,
1.378499, -0.6129413, 0.6327007, 1, 0, 0.4509804, 1,
1.384558, -0.5380447, 1.718579, 1, 0, 0.4431373, 1,
1.389085, 0.5199873, 0.7486852, 1, 0, 0.4392157, 1,
1.389635, -0.6580658, 1.230362, 1, 0, 0.4313726, 1,
1.391214, -0.316686, 1.108895, 1, 0, 0.427451, 1,
1.417459, 0.6058704, 1.234778, 1, 0, 0.4196078, 1,
1.432683, 1.375862, 1.847641, 1, 0, 0.4156863, 1,
1.44586, -1.864161, -0.2679433, 1, 0, 0.4078431, 1,
1.466286, -0.4209913, 1.459383, 1, 0, 0.4039216, 1,
1.477282, -0.5913397, 1.024076, 1, 0, 0.3960784, 1,
1.490699, -0.3698694, 0.4467865, 1, 0, 0.3882353, 1,
1.491699, -0.7192466, 1.565348, 1, 0, 0.3843137, 1,
1.508891, -0.6719316, 3.064067, 1, 0, 0.3764706, 1,
1.509046, 0.59953, 2.508626, 1, 0, 0.372549, 1,
1.513939, -0.4206163, 1.098513, 1, 0, 0.3647059, 1,
1.551749, -0.1388653, 1.773736, 1, 0, 0.3607843, 1,
1.552553, -1.347718, 2.633601, 1, 0, 0.3529412, 1,
1.552779, -0.8144067, 1.744596, 1, 0, 0.3490196, 1,
1.558007, -1.64317, 3.751373, 1, 0, 0.3411765, 1,
1.562726, -1.429031, 3.013938, 1, 0, 0.3372549, 1,
1.573173, 0.5693478, 0.9732402, 1, 0, 0.3294118, 1,
1.585874, 0.4427889, 0.03414375, 1, 0, 0.3254902, 1,
1.588811, -0.7083164, 2.18352, 1, 0, 0.3176471, 1,
1.607119, 0.07413734, 1.239683, 1, 0, 0.3137255, 1,
1.614479, 1.41106, 0.8986644, 1, 0, 0.3058824, 1,
1.620708, 0.5283004, 1.657431, 1, 0, 0.2980392, 1,
1.633039, -0.1541202, 0.9935023, 1, 0, 0.2941177, 1,
1.63877, -0.1222227, 0.3765144, 1, 0, 0.2862745, 1,
1.652766, 0.1788313, 2.840435, 1, 0, 0.282353, 1,
1.656993, -0.3481285, 0.3318506, 1, 0, 0.2745098, 1,
1.679261, -0.2876115, 1.853757, 1, 0, 0.2705882, 1,
1.701258, -0.2860253, 1.231278, 1, 0, 0.2627451, 1,
1.721907, -3.568778, 2.642736, 1, 0, 0.2588235, 1,
1.733493, 1.026497, 0.9636208, 1, 0, 0.2509804, 1,
1.74142, 0.6060559, 0.6340067, 1, 0, 0.2470588, 1,
1.758804, 0.494945, 2.513018, 1, 0, 0.2392157, 1,
1.779437, 0.8946918, 1.223042, 1, 0, 0.2352941, 1,
1.779847, -0.3864937, 2.022879, 1, 0, 0.227451, 1,
1.803105, -0.6671872, 2.06005, 1, 0, 0.2235294, 1,
1.83124, -0.08728244, 2.156563, 1, 0, 0.2156863, 1,
1.863713, -1.500071, 2.429229, 1, 0, 0.2117647, 1,
1.867192, -0.5406854, 1.115185, 1, 0, 0.2039216, 1,
1.868485, 1.721586, -0.01390053, 1, 0, 0.1960784, 1,
1.876529, -0.2556011, 2.696807, 1, 0, 0.1921569, 1,
1.876781, 1.468645, 0.2199071, 1, 0, 0.1843137, 1,
1.890716, 0.1424599, 1.509816, 1, 0, 0.1803922, 1,
1.928944, -1.430065, 1.183406, 1, 0, 0.172549, 1,
1.943506, -0.7696447, 1.595019, 1, 0, 0.1686275, 1,
1.948149, -0.3983406, 1.645607, 1, 0, 0.1607843, 1,
1.951029, 0.5558697, 2.865297, 1, 0, 0.1568628, 1,
2.017365, 0.09914155, 2.661929, 1, 0, 0.1490196, 1,
2.019295, 1.905301, 2.427875, 1, 0, 0.145098, 1,
2.053185, 1.030596, 1.526333, 1, 0, 0.1372549, 1,
2.054435, 0.9343246, 3.010071, 1, 0, 0.1333333, 1,
2.06583, -1.16799, 1.496708, 1, 0, 0.1254902, 1,
2.082183, 0.4695214, 1.164522, 1, 0, 0.1215686, 1,
2.1285, -1.581744, 3.474596, 1, 0, 0.1137255, 1,
2.134536, -1.204431, 3.753022, 1, 0, 0.1098039, 1,
2.163838, 1.407458, 0.5509026, 1, 0, 0.1019608, 1,
2.187232, 1.194002, -0.3962667, 1, 0, 0.09411765, 1,
2.201197, -0.7695358, 0.9320425, 1, 0, 0.09019608, 1,
2.246307, 2.364121, 1.368818, 1, 0, 0.08235294, 1,
2.250845, 0.3629809, 0.7077373, 1, 0, 0.07843138, 1,
2.264894, 0.2629774, 2.621952, 1, 0, 0.07058824, 1,
2.274602, -0.2694395, 1.775666, 1, 0, 0.06666667, 1,
2.318829, 1.260103, 0.5511184, 1, 0, 0.05882353, 1,
2.3646, 1.822778, 2.183774, 1, 0, 0.05490196, 1,
2.369618, -1.061525, 1.491014, 1, 0, 0.04705882, 1,
2.385843, 0.974004, 0.9057565, 1, 0, 0.04313726, 1,
2.433584, 0.8778929, 0.3919373, 1, 0, 0.03529412, 1,
2.507007, 0.3181054, 1.250689, 1, 0, 0.03137255, 1,
2.517908, 1.5697, 0.6609604, 1, 0, 0.02352941, 1,
2.536605, -0.8228423, 2.295357, 1, 0, 0.01960784, 1,
3.245769, -0.512513, 2.242153, 1, 0, 0.01176471, 1,
3.373482, -1.26532, 2.501372, 1, 0, 0.007843138, 1
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
0.005669236, -4.71127, -6.99538, 0, -0.5, 0.5, 0.5,
0.005669236, -4.71127, -6.99538, 1, -0.5, 0.5, 0.5,
0.005669236, -4.71127, -6.99538, 1, 1.5, 0.5, 0.5,
0.005669236, -4.71127, -6.99538, 0, 1.5, 0.5, 0.5
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
-4.503832, -0.1985924, -6.99538, 0, -0.5, 0.5, 0.5,
-4.503832, -0.1985924, -6.99538, 1, -0.5, 0.5, 0.5,
-4.503832, -0.1985924, -6.99538, 1, 1.5, 0.5, 0.5,
-4.503832, -0.1985924, -6.99538, 0, 1.5, 0.5, 0.5
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
-4.503832, -4.71127, 0.3924272, 0, -0.5, 0.5, 0.5,
-4.503832, -4.71127, 0.3924272, 1, -0.5, 0.5, 0.5,
-4.503832, -4.71127, 0.3924272, 1, 1.5, 0.5, 0.5,
-4.503832, -4.71127, 0.3924272, 0, 1.5, 0.5, 0.5
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
-3, -3.669883, -5.290501,
3, -3.669883, -5.290501,
-3, -3.669883, -5.290501,
-3, -3.843448, -5.574647,
-2, -3.669883, -5.290501,
-2, -3.843448, -5.574647,
-1, -3.669883, -5.290501,
-1, -3.843448, -5.574647,
0, -3.669883, -5.290501,
0, -3.843448, -5.574647,
1, -3.669883, -5.290501,
1, -3.843448, -5.574647,
2, -3.669883, -5.290501,
2, -3.843448, -5.574647,
3, -3.669883, -5.290501,
3, -3.843448, -5.574647
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
-3, -4.190577, -6.142941, 0, -0.5, 0.5, 0.5,
-3, -4.190577, -6.142941, 1, -0.5, 0.5, 0.5,
-3, -4.190577, -6.142941, 1, 1.5, 0.5, 0.5,
-3, -4.190577, -6.142941, 0, 1.5, 0.5, 0.5,
-2, -4.190577, -6.142941, 0, -0.5, 0.5, 0.5,
-2, -4.190577, -6.142941, 1, -0.5, 0.5, 0.5,
-2, -4.190577, -6.142941, 1, 1.5, 0.5, 0.5,
-2, -4.190577, -6.142941, 0, 1.5, 0.5, 0.5,
-1, -4.190577, -6.142941, 0, -0.5, 0.5, 0.5,
-1, -4.190577, -6.142941, 1, -0.5, 0.5, 0.5,
-1, -4.190577, -6.142941, 1, 1.5, 0.5, 0.5,
-1, -4.190577, -6.142941, 0, 1.5, 0.5, 0.5,
0, -4.190577, -6.142941, 0, -0.5, 0.5, 0.5,
0, -4.190577, -6.142941, 1, -0.5, 0.5, 0.5,
0, -4.190577, -6.142941, 1, 1.5, 0.5, 0.5,
0, -4.190577, -6.142941, 0, 1.5, 0.5, 0.5,
1, -4.190577, -6.142941, 0, -0.5, 0.5, 0.5,
1, -4.190577, -6.142941, 1, -0.5, 0.5, 0.5,
1, -4.190577, -6.142941, 1, 1.5, 0.5, 0.5,
1, -4.190577, -6.142941, 0, 1.5, 0.5, 0.5,
2, -4.190577, -6.142941, 0, -0.5, 0.5, 0.5,
2, -4.190577, -6.142941, 1, -0.5, 0.5, 0.5,
2, -4.190577, -6.142941, 1, 1.5, 0.5, 0.5,
2, -4.190577, -6.142941, 0, 1.5, 0.5, 0.5,
3, -4.190577, -6.142941, 0, -0.5, 0.5, 0.5,
3, -4.190577, -6.142941, 1, -0.5, 0.5, 0.5,
3, -4.190577, -6.142941, 1, 1.5, 0.5, 0.5,
3, -4.190577, -6.142941, 0, 1.5, 0.5, 0.5
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
-3.463178, -3, -5.290501,
-3.463178, 3, -5.290501,
-3.463178, -3, -5.290501,
-3.63662, -3, -5.574647,
-3.463178, -2, -5.290501,
-3.63662, -2, -5.574647,
-3.463178, -1, -5.290501,
-3.63662, -1, -5.574647,
-3.463178, 0, -5.290501,
-3.63662, 0, -5.574647,
-3.463178, 1, -5.290501,
-3.63662, 1, -5.574647,
-3.463178, 2, -5.290501,
-3.63662, 2, -5.574647,
-3.463178, 3, -5.290501,
-3.63662, 3, -5.574647
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
-3.983505, -3, -6.142941, 0, -0.5, 0.5, 0.5,
-3.983505, -3, -6.142941, 1, -0.5, 0.5, 0.5,
-3.983505, -3, -6.142941, 1, 1.5, 0.5, 0.5,
-3.983505, -3, -6.142941, 0, 1.5, 0.5, 0.5,
-3.983505, -2, -6.142941, 0, -0.5, 0.5, 0.5,
-3.983505, -2, -6.142941, 1, -0.5, 0.5, 0.5,
-3.983505, -2, -6.142941, 1, 1.5, 0.5, 0.5,
-3.983505, -2, -6.142941, 0, 1.5, 0.5, 0.5,
-3.983505, -1, -6.142941, 0, -0.5, 0.5, 0.5,
-3.983505, -1, -6.142941, 1, -0.5, 0.5, 0.5,
-3.983505, -1, -6.142941, 1, 1.5, 0.5, 0.5,
-3.983505, -1, -6.142941, 0, 1.5, 0.5, 0.5,
-3.983505, 0, -6.142941, 0, -0.5, 0.5, 0.5,
-3.983505, 0, -6.142941, 1, -0.5, 0.5, 0.5,
-3.983505, 0, -6.142941, 1, 1.5, 0.5, 0.5,
-3.983505, 0, -6.142941, 0, 1.5, 0.5, 0.5,
-3.983505, 1, -6.142941, 0, -0.5, 0.5, 0.5,
-3.983505, 1, -6.142941, 1, -0.5, 0.5, 0.5,
-3.983505, 1, -6.142941, 1, 1.5, 0.5, 0.5,
-3.983505, 1, -6.142941, 0, 1.5, 0.5, 0.5,
-3.983505, 2, -6.142941, 0, -0.5, 0.5, 0.5,
-3.983505, 2, -6.142941, 1, -0.5, 0.5, 0.5,
-3.983505, 2, -6.142941, 1, 1.5, 0.5, 0.5,
-3.983505, 2, -6.142941, 0, 1.5, 0.5, 0.5,
-3.983505, 3, -6.142941, 0, -0.5, 0.5, 0.5,
-3.983505, 3, -6.142941, 1, -0.5, 0.5, 0.5,
-3.983505, 3, -6.142941, 1, 1.5, 0.5, 0.5,
-3.983505, 3, -6.142941, 0, 1.5, 0.5, 0.5
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
-3.463178, -3.669883, -4,
-3.463178, -3.669883, 4,
-3.463178, -3.669883, -4,
-3.63662, -3.843448, -4,
-3.463178, -3.669883, -2,
-3.63662, -3.843448, -2,
-3.463178, -3.669883, 0,
-3.63662, -3.843448, 0,
-3.463178, -3.669883, 2,
-3.63662, -3.843448, 2,
-3.463178, -3.669883, 4,
-3.63662, -3.843448, 4
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
-3.983505, -4.190577, -4, 0, -0.5, 0.5, 0.5,
-3.983505, -4.190577, -4, 1, -0.5, 0.5, 0.5,
-3.983505, -4.190577, -4, 1, 1.5, 0.5, 0.5,
-3.983505, -4.190577, -4, 0, 1.5, 0.5, 0.5,
-3.983505, -4.190577, -2, 0, -0.5, 0.5, 0.5,
-3.983505, -4.190577, -2, 1, -0.5, 0.5, 0.5,
-3.983505, -4.190577, -2, 1, 1.5, 0.5, 0.5,
-3.983505, -4.190577, -2, 0, 1.5, 0.5, 0.5,
-3.983505, -4.190577, 0, 0, -0.5, 0.5, 0.5,
-3.983505, -4.190577, 0, 1, -0.5, 0.5, 0.5,
-3.983505, -4.190577, 0, 1, 1.5, 0.5, 0.5,
-3.983505, -4.190577, 0, 0, 1.5, 0.5, 0.5,
-3.983505, -4.190577, 2, 0, -0.5, 0.5, 0.5,
-3.983505, -4.190577, 2, 1, -0.5, 0.5, 0.5,
-3.983505, -4.190577, 2, 1, 1.5, 0.5, 0.5,
-3.983505, -4.190577, 2, 0, 1.5, 0.5, 0.5,
-3.983505, -4.190577, 4, 0, -0.5, 0.5, 0.5,
-3.983505, -4.190577, 4, 1, -0.5, 0.5, 0.5,
-3.983505, -4.190577, 4, 1, 1.5, 0.5, 0.5,
-3.983505, -4.190577, 4, 0, 1.5, 0.5, 0.5
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
-3.463178, -3.669883, -5.290501,
-3.463178, 3.272698, -5.290501,
-3.463178, -3.669883, 6.075356,
-3.463178, 3.272698, 6.075356,
-3.463178, -3.669883, -5.290501,
-3.463178, -3.669883, 6.075356,
-3.463178, 3.272698, -5.290501,
-3.463178, 3.272698, 6.075356,
-3.463178, -3.669883, -5.290501,
3.474516, -3.669883, -5.290501,
-3.463178, -3.669883, 6.075356,
3.474516, -3.669883, 6.075356,
-3.463178, 3.272698, -5.290501,
3.474516, 3.272698, -5.290501,
-3.463178, 3.272698, 6.075356,
3.474516, 3.272698, 6.075356,
3.474516, -3.669883, -5.290501,
3.474516, 3.272698, -5.290501,
3.474516, -3.669883, 6.075356,
3.474516, 3.272698, 6.075356,
3.474516, -3.669883, -5.290501,
3.474516, -3.669883, 6.075356,
3.474516, 3.272698, -5.290501,
3.474516, 3.272698, 6.075356
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
var radius = 8.018848;
var distance = 35.67676;
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
mvMatrix.translate( -0.005669236, 0.1985924, -0.3924272 );
mvMatrix.scale( 1.249714, 1.248834, 0.7628229 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.67676);
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
S-2-ethylsulfinyleth<-read.table("S-2-ethylsulfinyleth.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-S-2-ethylsulfinyleth$V2
```

```
## Error in eval(expr, envir, enclos): object 'S' not found
```

```r
y<-S-2-ethylsulfinyleth$V3
```

```
## Error in eval(expr, envir, enclos): object 'S' not found
```

```r
z<-S-2-ethylsulfinyleth$V4
```

```
## Error in eval(expr, envir, enclos): object 'S' not found
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
-3.362144, 0.2477214, -1.26775, 0, 0, 1, 1, 1,
-3.079979, 0.3308466, 0.2124224, 1, 0, 0, 1, 1,
-3.075654, -1.016226, -1.195974, 1, 0, 0, 1, 1,
-2.599594, -0.5246749, -2.136712, 1, 0, 0, 1, 1,
-2.473092, -1.034054, -1.313745, 1, 0, 0, 1, 1,
-2.454397, 1.549425, -1.484183, 1, 0, 0, 1, 1,
-2.428285, -0.7949857, -1.669046, 0, 0, 0, 1, 1,
-2.393524, -0.1984335, -1.851915, 0, 0, 0, 1, 1,
-2.36911, 0.414979, -2.383321, 0, 0, 0, 1, 1,
-2.365338, 0.3702236, -1.889516, 0, 0, 0, 1, 1,
-2.34692, 0.5497193, -3.228866, 0, 0, 0, 1, 1,
-2.23874, 1.151686, -0.1314364, 0, 0, 0, 1, 1,
-2.186433, 0.7840855, -0.5935876, 0, 0, 0, 1, 1,
-2.183262, 0.9492736, -1.964098, 1, 1, 1, 1, 1,
-2.118456, -0.3511352, -3.78589, 1, 1, 1, 1, 1,
-2.091669, -0.099889, -1.551801, 1, 1, 1, 1, 1,
-2.075257, 0.600304, -1.281716, 1, 1, 1, 1, 1,
-2.03382, -0.7581192, -1.494143, 1, 1, 1, 1, 1,
-2.00913, 1.957875, -1.985923, 1, 1, 1, 1, 1,
-1.997288, -0.5699815, -0.9851506, 1, 1, 1, 1, 1,
-1.985303, -0.1051777, -0.8213003, 1, 1, 1, 1, 1,
-1.969282, 0.784093, -3.020679, 1, 1, 1, 1, 1,
-1.949668, -0.09679256, -1.678014, 1, 1, 1, 1, 1,
-1.90882, -0.06309941, -2.009767, 1, 1, 1, 1, 1,
-1.899529, 0.6824362, -0.889223, 1, 1, 1, 1, 1,
-1.883409, -0.5010208, 0.5150933, 1, 1, 1, 1, 1,
-1.861329, -0.126197, -3.073952, 1, 1, 1, 1, 1,
-1.859087, -1.16445, -2.398872, 1, 1, 1, 1, 1,
-1.845815, -1.619417, -2.896405, 0, 0, 1, 1, 1,
-1.83686, 0.6258244, -1.170012, 1, 0, 0, 1, 1,
-1.814528, -0.9834605, -0.5557098, 1, 0, 0, 1, 1,
-1.778818, -0.4211939, -2.393359, 1, 0, 0, 1, 1,
-1.761248, -1.742778, -2.456345, 1, 0, 0, 1, 1,
-1.752497, 1.114242, -2.819571, 1, 0, 0, 1, 1,
-1.71974, 1.562114, 0.6358496, 0, 0, 0, 1, 1,
-1.701705, 0.1494143, -1.213204, 0, 0, 0, 1, 1,
-1.694825, -0.08161525, -2.59961, 0, 0, 0, 1, 1,
-1.693116, -0.9033328, -1.08425, 0, 0, 0, 1, 1,
-1.690335, 0.3190573, -1.724806, 0, 0, 0, 1, 1,
-1.66067, 0.6351174, -0.2497119, 0, 0, 0, 1, 1,
-1.643782, 1.706762, -1.581872, 0, 0, 0, 1, 1,
-1.636715, -0.4009744, -1.630292, 1, 1, 1, 1, 1,
-1.623487, 0.1953667, -1.691913, 1, 1, 1, 1, 1,
-1.615288, 0.437059, 1.192606, 1, 1, 1, 1, 1,
-1.603066, -0.0661017, -0.07876115, 1, 1, 1, 1, 1,
-1.600867, 0.4526907, -1.897259, 1, 1, 1, 1, 1,
-1.585739, -1.034141, -0.5171321, 1, 1, 1, 1, 1,
-1.564822, 0.6845233, -1.756765, 1, 1, 1, 1, 1,
-1.539945, 0.4627348, -2.155559, 1, 1, 1, 1, 1,
-1.53695, 1.184886, 0.2088913, 1, 1, 1, 1, 1,
-1.530584, 1.416977, 0.7545297, 1, 1, 1, 1, 1,
-1.498936, 0.4631065, -0.8833236, 1, 1, 1, 1, 1,
-1.495521, -1.526194, -2.338054, 1, 1, 1, 1, 1,
-1.491262, -0.7826952, -1.555517, 1, 1, 1, 1, 1,
-1.489691, -0.995141, -0.07379279, 1, 1, 1, 1, 1,
-1.483937, -1.140441, -2.563723, 1, 1, 1, 1, 1,
-1.47516, -0.09036376, -2.382751, 0, 0, 1, 1, 1,
-1.473628, -0.07978474, -0.6255249, 1, 0, 0, 1, 1,
-1.465966, -0.0514314, -2.451016, 1, 0, 0, 1, 1,
-1.461364, 2.85403, -1.130045, 1, 0, 0, 1, 1,
-1.458478, 0.3118721, -1.224281, 1, 0, 0, 1, 1,
-1.455177, 0.2342187, -3.316952, 1, 0, 0, 1, 1,
-1.453345, 0.9627355, -1.03239, 0, 0, 0, 1, 1,
-1.452374, 1.569048, -2.739113, 0, 0, 0, 1, 1,
-1.45186, -1.026803, -1.912683, 0, 0, 0, 1, 1,
-1.435019, 0.2519792, -1.40559, 0, 0, 0, 1, 1,
-1.418612, -0.6854994, -2.667088, 0, 0, 0, 1, 1,
-1.417975, -0.2632409, -1.036488, 0, 0, 0, 1, 1,
-1.409949, -0.6909311, -3.301027, 0, 0, 0, 1, 1,
-1.407937, -0.2576247, -2.542579, 1, 1, 1, 1, 1,
-1.399223, -0.653881, -2.454234, 1, 1, 1, 1, 1,
-1.39081, -1.571697, -1.47846, 1, 1, 1, 1, 1,
-1.378123, 1.390221, -0.9834707, 1, 1, 1, 1, 1,
-1.376881, 1.37374, 0.4963757, 1, 1, 1, 1, 1,
-1.376157, 0.0336248, -0.7532285, 1, 1, 1, 1, 1,
-1.368588, 0.02084384, -0.3491596, 1, 1, 1, 1, 1,
-1.367828, 0.5683842, -0.3323897, 1, 1, 1, 1, 1,
-1.362501, 0.7771596, 0.3933395, 1, 1, 1, 1, 1,
-1.357561, -0.01083738, -1.948852, 1, 1, 1, 1, 1,
-1.348565, -0.4673226, -2.353183, 1, 1, 1, 1, 1,
-1.348061, 1.279667, -2.774066, 1, 1, 1, 1, 1,
-1.345163, 0.1220738, 0.3156881, 1, 1, 1, 1, 1,
-1.345074, 0.3096123, -2.481556, 1, 1, 1, 1, 1,
-1.34263, 1.750716, -1.13866, 1, 1, 1, 1, 1,
-1.323725, -1.346258, -5.019677, 0, 0, 1, 1, 1,
-1.323316, 0.6897715, -2.568514, 1, 0, 0, 1, 1,
-1.320986, -0.347251, -1.274387, 1, 0, 0, 1, 1,
-1.320832, 0.5989942, -1.358509, 1, 0, 0, 1, 1,
-1.319957, -0.1542172, -1.938967, 1, 0, 0, 1, 1,
-1.316964, 0.2228698, -0.508393, 1, 0, 0, 1, 1,
-1.307978, -3.47805, -3.04302, 0, 0, 0, 1, 1,
-1.279399, 0.6192747, -1.465668, 0, 0, 0, 1, 1,
-1.276965, 0.7703223, -0.811863, 0, 0, 0, 1, 1,
-1.273823, -0.1520443, -1.559758, 0, 0, 0, 1, 1,
-1.269845, -0.6475928, -4.020417, 0, 0, 0, 1, 1,
-1.268181, 0.9272618, -0.7963669, 0, 0, 0, 1, 1,
-1.264377, 1.273441, -0.07146722, 0, 0, 0, 1, 1,
-1.263954, 0.1672376, -2.539412, 1, 1, 1, 1, 1,
-1.256624, -0.8384326, -2.069457, 1, 1, 1, 1, 1,
-1.252944, 1.188733, -1.139852, 1, 1, 1, 1, 1,
-1.252712, 0.2859375, -1.197417, 1, 1, 1, 1, 1,
-1.245438, 1.427623, -2.092297, 1, 1, 1, 1, 1,
-1.241849, -0.01185821, -3.008456, 1, 1, 1, 1, 1,
-1.240216, -0.3907797, -1.121002, 1, 1, 1, 1, 1,
-1.235642, -1.304833, -3.958877, 1, 1, 1, 1, 1,
-1.231277, -0.04794019, -2.862112, 1, 1, 1, 1, 1,
-1.230284, -0.04250415, 0.009139653, 1, 1, 1, 1, 1,
-1.228787, -0.1316615, -0.3165845, 1, 1, 1, 1, 1,
-1.228574, -0.04700643, -2.633426, 1, 1, 1, 1, 1,
-1.221601, 0.05318244, -2.759078, 1, 1, 1, 1, 1,
-1.220732, 1.723123, -1.403226, 1, 1, 1, 1, 1,
-1.218212, -0.2730447, -1.425442, 1, 1, 1, 1, 1,
-1.216952, -1.46396, -4.111598, 0, 0, 1, 1, 1,
-1.213871, -0.02753191, -0.1162373, 1, 0, 0, 1, 1,
-1.21147, 0.6219021, -1.072168, 1, 0, 0, 1, 1,
-1.205887, -1.706706, -2.973133, 1, 0, 0, 1, 1,
-1.199461, 1.271926, -1.768265, 1, 0, 0, 1, 1,
-1.197978, -0.7864846, -0.753994, 1, 0, 0, 1, 1,
-1.192396, -0.2496937, -2.211945, 0, 0, 0, 1, 1,
-1.18576, -0.4390984, -0.6124468, 0, 0, 0, 1, 1,
-1.178473, 0.2821687, -0.6462345, 0, 0, 0, 1, 1,
-1.166753, 0.1061583, -1.953966, 0, 0, 0, 1, 1,
-1.152212, 0.4055918, 0.4770737, 0, 0, 0, 1, 1,
-1.13351, -1.130277, -2.810845, 0, 0, 0, 1, 1,
-1.126107, -0.157389, -1.128451, 0, 0, 0, 1, 1,
-1.116221, 0.6656841, 0.2297053, 1, 1, 1, 1, 1,
-1.114462, 0.1821623, -2.068329, 1, 1, 1, 1, 1,
-1.110362, 0.2623618, -2.324978, 1, 1, 1, 1, 1,
-1.108989, 0.6783018, -1.41356, 1, 1, 1, 1, 1,
-1.10572, -0.4169631, -0.9245696, 1, 1, 1, 1, 1,
-1.104434, 0.5509648, -1.256358, 1, 1, 1, 1, 1,
-1.097678, 0.3878196, 0.6102436, 1, 1, 1, 1, 1,
-1.095283, -3.152772, -1.450496, 1, 1, 1, 1, 1,
-1.094307, 0.9232371, 0.05987559, 1, 1, 1, 1, 1,
-1.087859, -0.2980897, -1.99656, 1, 1, 1, 1, 1,
-1.084611, -0.7850136, -4.893362, 1, 1, 1, 1, 1,
-1.082842, -0.800454, -1.136861, 1, 1, 1, 1, 1,
-1.075244, -1.106705, -3.358188, 1, 1, 1, 1, 1,
-1.073411, -0.2267124, -1.37345, 1, 1, 1, 1, 1,
-1.072651, -0.07958625, -1.993068, 1, 1, 1, 1, 1,
-1.067158, -1.461532, -1.522116, 0, 0, 1, 1, 1,
-1.060277, -0.06072216, -1.691163, 1, 0, 0, 1, 1,
-1.053983, -1.063567, -2.278096, 1, 0, 0, 1, 1,
-1.052816, -1.814725, -4.280264, 1, 0, 0, 1, 1,
-1.049197, 0.3994607, 0.2114456, 1, 0, 0, 1, 1,
-1.03195, 1.140424, -0.4200851, 1, 0, 0, 1, 1,
-1.018124, 0.2447573, -0.2561626, 0, 0, 0, 1, 1,
-1.01064, 0.9590674, -0.3059352, 0, 0, 0, 1, 1,
-1.002909, 0.7230926, -0.6109274, 0, 0, 0, 1, 1,
-0.9949272, -0.4511481, -3.850882, 0, 0, 0, 1, 1,
-0.9926421, 0.5379785, -1.486066, 0, 0, 0, 1, 1,
-0.9822348, 0.09173527, -1.909063, 0, 0, 0, 1, 1,
-0.9765379, 0.8533371, -0.8096774, 0, 0, 0, 1, 1,
-0.9699365, 2.038696, 0.1161134, 1, 1, 1, 1, 1,
-0.9675889, 0.1449581, -1.782183, 1, 1, 1, 1, 1,
-0.966588, -0.1707983, -3.076003, 1, 1, 1, 1, 1,
-0.9605026, 1.467781, -1.21849, 1, 1, 1, 1, 1,
-0.9585676, 0.6396881, -0.02827012, 1, 1, 1, 1, 1,
-0.9567891, 0.1724388, -0.9287341, 1, 1, 1, 1, 1,
-0.9470299, 0.464292, -0.5462338, 1, 1, 1, 1, 1,
-0.9408621, 0.9972962, -0.7678013, 1, 1, 1, 1, 1,
-0.9389381, -2.203221, -1.248722, 1, 1, 1, 1, 1,
-0.936933, 1.004308, -1.801946, 1, 1, 1, 1, 1,
-0.9321358, 1.545021, -0.9497089, 1, 1, 1, 1, 1,
-0.9256521, -0.3634328, -2.000247, 1, 1, 1, 1, 1,
-0.9219626, 0.4322048, -0.008094648, 1, 1, 1, 1, 1,
-0.9209285, 0.5776197, -2.117738, 1, 1, 1, 1, 1,
-0.9180776, -0.3064265, -3.247666, 1, 1, 1, 1, 1,
-0.9131296, 0.1816241, -0.9793552, 0, 0, 1, 1, 1,
-0.9077266, -1.12944, -0.8397536, 1, 0, 0, 1, 1,
-0.9042557, 2.433062, -0.383945, 1, 0, 0, 1, 1,
-0.9014684, -0.6224113, -3.220157, 1, 0, 0, 1, 1,
-0.901338, 1.313033, -0.6455402, 1, 0, 0, 1, 1,
-0.9008282, -1.399885, -3.739491, 1, 0, 0, 1, 1,
-0.8995132, -0.314627, -2.319567, 0, 0, 0, 1, 1,
-0.8990695, -1.389135, -1.139078, 0, 0, 0, 1, 1,
-0.8981678, -0.1804964, 0.2347946, 0, 0, 0, 1, 1,
-0.8903422, 0.8626242, 0.1359795, 0, 0, 0, 1, 1,
-0.8891562, 0.5445442, -0.7780092, 0, 0, 0, 1, 1,
-0.888822, -0.4004142, -0.8223675, 0, 0, 0, 1, 1,
-0.8864124, -0.7603431, -2.428195, 0, 0, 0, 1, 1,
-0.8859035, -0.2416857, -0.9748083, 1, 1, 1, 1, 1,
-0.875705, -1.015378, -1.461245, 1, 1, 1, 1, 1,
-0.8696747, -0.5334376, -0.9839014, 1, 1, 1, 1, 1,
-0.8661387, 0.9217716, -0.1823466, 1, 1, 1, 1, 1,
-0.8631008, 0.3202086, -0.344779, 1, 1, 1, 1, 1,
-0.8520144, 0.09240177, -0.970687, 1, 1, 1, 1, 1,
-0.8514232, 0.1402819, -0.6396674, 1, 1, 1, 1, 1,
-0.8483073, -0.6512579, -1.183704, 1, 1, 1, 1, 1,
-0.843868, -0.2470624, -0.3162577, 1, 1, 1, 1, 1,
-0.8435632, -0.6253114, -0.3223124, 1, 1, 1, 1, 1,
-0.8390862, 0.9749584, -0.9066397, 1, 1, 1, 1, 1,
-0.832717, -1.800151, -2.894677, 1, 1, 1, 1, 1,
-0.8254923, 0.5775074, -2.31959, 1, 1, 1, 1, 1,
-0.8214861, -0.3993405, -2.978639, 1, 1, 1, 1, 1,
-0.8182579, -0.501492, -1.099782, 1, 1, 1, 1, 1,
-0.8110886, 0.2866285, -1.092574, 0, 0, 1, 1, 1,
-0.8009414, 0.4358222, -0.9570632, 1, 0, 0, 1, 1,
-0.7862361, -0.9036656, -2.727257, 1, 0, 0, 1, 1,
-0.7837653, 0.5182163, -1.282274, 1, 0, 0, 1, 1,
-0.783671, 0.6066541, -1.404216, 1, 0, 0, 1, 1,
-0.7725621, -0.5912551, -1.677979, 1, 0, 0, 1, 1,
-0.7678328, 0.1300631, -2.009871, 0, 0, 0, 1, 1,
-0.7627228, -0.2280822, -2.085188, 0, 0, 0, 1, 1,
-0.757376, -0.3522489, -2.291906, 0, 0, 0, 1, 1,
-0.7569489, 0.646921, -0.5245566, 0, 0, 0, 1, 1,
-0.7565491, -0.5341761, -0.8133898, 0, 0, 0, 1, 1,
-0.750955, -0.954604, -2.088336, 0, 0, 0, 1, 1,
-0.7460858, 0.7892894, -0.4959449, 0, 0, 0, 1, 1,
-0.744242, 0.5584176, 0.26546, 1, 1, 1, 1, 1,
-0.741555, 0.1043894, -0.867637, 1, 1, 1, 1, 1,
-0.7380056, 1.641426, 0.7663004, 1, 1, 1, 1, 1,
-0.7371868, 1.598588, -1.761888, 1, 1, 1, 1, 1,
-0.7293126, 0.6906142, -0.4517826, 1, 1, 1, 1, 1,
-0.7290974, 0.3322239, 1.522457, 1, 1, 1, 1, 1,
-0.7242228, -0.374723, -1.520014, 1, 1, 1, 1, 1,
-0.7226231, 1.007533, -1.307245, 1, 1, 1, 1, 1,
-0.7220942, -0.6870609, -2.17699, 1, 1, 1, 1, 1,
-0.7105902, -1.339278, -4.170085, 1, 1, 1, 1, 1,
-0.7085419, -0.8277821, -2.640636, 1, 1, 1, 1, 1,
-0.7046849, 0.2814152, -0.9361527, 1, 1, 1, 1, 1,
-0.6988023, 0.4070447, -0.3565412, 1, 1, 1, 1, 1,
-0.696428, -0.1466327, -1.233712, 1, 1, 1, 1, 1,
-0.6931442, 1.396201, 0.8759218, 1, 1, 1, 1, 1,
-0.6931184, 1.245962, -0.3272733, 0, 0, 1, 1, 1,
-0.6812388, -2.030067, -2.116066, 1, 0, 0, 1, 1,
-0.6806926, -1.043121, -1.750324, 1, 0, 0, 1, 1,
-0.6788607, -0.7772196, -2.564413, 1, 0, 0, 1, 1,
-0.6769441, 0.6633253, 0.6547753, 1, 0, 0, 1, 1,
-0.6758243, -1.163013, -1.084057, 1, 0, 0, 1, 1,
-0.6697302, 0.2827881, -1.089499, 0, 0, 0, 1, 1,
-0.6689683, -0.5989849, -2.344555, 0, 0, 0, 1, 1,
-0.664052, -0.1949868, -1.318476, 0, 0, 0, 1, 1,
-0.6635348, -0.5969327, -1.247256, 0, 0, 0, 1, 1,
-0.6628187, -0.136424, -1.240604, 0, 0, 0, 1, 1,
-0.6591831, -0.4104154, -2.591449, 0, 0, 0, 1, 1,
-0.6587985, -0.7326754, -1.745272, 0, 0, 0, 1, 1,
-0.6585934, 0.2717895, -2.376063, 1, 1, 1, 1, 1,
-0.6552473, -0.05381973, -2.072329, 1, 1, 1, 1, 1,
-0.650049, 0.371996, -1.654703, 1, 1, 1, 1, 1,
-0.6495501, 0.4473614, -0.5113745, 1, 1, 1, 1, 1,
-0.64923, 0.06954294, -1.607781, 1, 1, 1, 1, 1,
-0.6451077, 0.08717316, -3.824915, 1, 1, 1, 1, 1,
-0.6427138, 0.9841914, -0.7798511, 1, 1, 1, 1, 1,
-0.6408593, 0.7292677, -1.060638, 1, 1, 1, 1, 1,
-0.6388608, 0.3075869, -1.044082, 1, 1, 1, 1, 1,
-0.6371108, -1.271088, -2.488024, 1, 1, 1, 1, 1,
-0.6221395, 1.138749, 0.7313169, 1, 1, 1, 1, 1,
-0.6220702, -2.311854, -2.044691, 1, 1, 1, 1, 1,
-0.616237, -2.363003, -2.777416, 1, 1, 1, 1, 1,
-0.6115028, -0.1184348, -2.072819, 1, 1, 1, 1, 1,
-0.6102206, -1.534059, -2.310128, 1, 1, 1, 1, 1,
-0.6018374, 1.935399, 0.8212312, 0, 0, 1, 1, 1,
-0.5941603, -0.2200794, -0.8118004, 1, 0, 0, 1, 1,
-0.5880609, -0.5055693, -2.940692, 1, 0, 0, 1, 1,
-0.5860602, 0.2007357, -3.052901, 1, 0, 0, 1, 1,
-0.585385, -0.4103436, -1.312352, 1, 0, 0, 1, 1,
-0.5827631, 0.1993057, -1.532021, 1, 0, 0, 1, 1,
-0.580606, -1.749138, -1.895619, 0, 0, 0, 1, 1,
-0.5801536, 0.7150651, 0.1485537, 0, 0, 0, 1, 1,
-0.5776884, -0.1401498, -2.397152, 0, 0, 0, 1, 1,
-0.5764537, -0.3940245, -2.291631, 0, 0, 0, 1, 1,
-0.5744507, -0.1147485, -1.905414, 0, 0, 0, 1, 1,
-0.5683461, -0.887382, -2.145338, 0, 0, 0, 1, 1,
-0.5674168, 1.805802, -0.1553367, 0, 0, 0, 1, 1,
-0.5619709, 0.11443, -0.3832451, 1, 1, 1, 1, 1,
-0.5563331, -0.6163053, -2.49333, 1, 1, 1, 1, 1,
-0.555558, 0.3886121, -0.8989221, 1, 1, 1, 1, 1,
-0.553083, 1.101215, -0.9929538, 1, 1, 1, 1, 1,
-0.5514511, -2.09949, -1.966593, 1, 1, 1, 1, 1,
-0.5404783, -0.2461875, -2.50896, 1, 1, 1, 1, 1,
-0.5388278, 0.7407385, -2.524613, 1, 1, 1, 1, 1,
-0.5377351, 0.1379731, -0.6636195, 1, 1, 1, 1, 1,
-0.5376378, -1.408833, -2.823086, 1, 1, 1, 1, 1,
-0.5285538, -0.9105765, -2.90551, 1, 1, 1, 1, 1,
-0.528521, 0.8230643, 0.008637603, 1, 1, 1, 1, 1,
-0.5278066, 0.9802496, -0.5568457, 1, 1, 1, 1, 1,
-0.5163807, 0.4779904, -1.233051, 1, 1, 1, 1, 1,
-0.5152439, 0.09095091, -1.120469, 1, 1, 1, 1, 1,
-0.5141349, -0.2868784, -0.5984358, 1, 1, 1, 1, 1,
-0.5138209, 0.1597969, -2.729544, 0, 0, 1, 1, 1,
-0.5136641, 0.6844792, -1.486295, 1, 0, 0, 1, 1,
-0.5107394, -0.7917543, -3.738591, 1, 0, 0, 1, 1,
-0.4988801, 1.597105, 1.022112, 1, 0, 0, 1, 1,
-0.4974887, -1.551241, -3.909765, 1, 0, 0, 1, 1,
-0.4963067, 0.3247051, -2.267302, 1, 0, 0, 1, 1,
-0.4911068, -0.9225518, -2.03607, 0, 0, 0, 1, 1,
-0.4901387, 0.01400538, -1.551482, 0, 0, 0, 1, 1,
-0.4792735, 0.1875394, -0.8712575, 0, 0, 0, 1, 1,
-0.4790959, -1.775956, -2.069511, 0, 0, 0, 1, 1,
-0.4768213, -0.6095724, -1.964631, 0, 0, 0, 1, 1,
-0.4725078, -0.2709805, -1.676442, 0, 0, 0, 1, 1,
-0.4703418, -0.4196269, -1.910834, 0, 0, 0, 1, 1,
-0.4687456, 0.02930324, -1.232257, 1, 1, 1, 1, 1,
-0.4644594, -1.604681, -2.780197, 1, 1, 1, 1, 1,
-0.462418, 0.5722205, 1.235546, 1, 1, 1, 1, 1,
-0.4622097, 0.05519465, -1.742399, 1, 1, 1, 1, 1,
-0.4543885, -1.082419, -3.104874, 1, 1, 1, 1, 1,
-0.4493226, 0.2126007, -0.7323148, 1, 1, 1, 1, 1,
-0.4486602, -1.040412, -2.566942, 1, 1, 1, 1, 1,
-0.4484248, -0.4123707, -1.773398, 1, 1, 1, 1, 1,
-0.4482567, -1.83067, -2.962644, 1, 1, 1, 1, 1,
-0.4443837, 0.5417072, -1.053946, 1, 1, 1, 1, 1,
-0.4418831, -0.5670205, -2.602309, 1, 1, 1, 1, 1,
-0.4376035, 0.03769914, -1.503095, 1, 1, 1, 1, 1,
-0.4373669, 0.7565324, 0.3512457, 1, 1, 1, 1, 1,
-0.436416, -0.1449832, -2.885618, 1, 1, 1, 1, 1,
-0.4352823, -0.3378228, -1.375693, 1, 1, 1, 1, 1,
-0.4330734, 0.2304454, -1.193456, 0, 0, 1, 1, 1,
-0.4315188, -0.2787209, -3.51637, 1, 0, 0, 1, 1,
-0.4291677, 1.029108, -0.7021883, 1, 0, 0, 1, 1,
-0.4141423, 0.8087462, -1.840062, 1, 0, 0, 1, 1,
-0.4079065, 0.4146521, 0.2967866, 1, 0, 0, 1, 1,
-0.4014641, -2.531412, -1.978033, 1, 0, 0, 1, 1,
-0.3975094, 1.796631, -2.354464, 0, 0, 0, 1, 1,
-0.3973041, -0.6745749, -2.216862, 0, 0, 0, 1, 1,
-0.3957138, -0.5985085, -4.739337, 0, 0, 0, 1, 1,
-0.3951497, -2.05118, -2.202775, 0, 0, 0, 1, 1,
-0.3879854, -0.6736459, -2.435966, 0, 0, 0, 1, 1,
-0.3856375, 0.4585912, -0.6532586, 0, 0, 0, 1, 1,
-0.3803219, 0.2409809, 0.2628072, 0, 0, 0, 1, 1,
-0.3758846, 0.09572159, -0.4011219, 1, 1, 1, 1, 1,
-0.373181, 0.2038684, 1.062731, 1, 1, 1, 1, 1,
-0.369592, 0.7740245, -1.229434, 1, 1, 1, 1, 1,
-0.3625322, -1.22587, -1.722992, 1, 1, 1, 1, 1,
-0.3583128, 0.8180087, 0.6969419, 1, 1, 1, 1, 1,
-0.3573183, -2.240606, -3.013903, 1, 1, 1, 1, 1,
-0.3569764, 0.6202827, 0.146627, 1, 1, 1, 1, 1,
-0.3557915, -0.9595777, -3.436506, 1, 1, 1, 1, 1,
-0.3555904, -0.6707248, -2.005494, 1, 1, 1, 1, 1,
-0.3543558, -1.176071, -3.196384, 1, 1, 1, 1, 1,
-0.3517753, 0.06040612, -0.9828306, 1, 1, 1, 1, 1,
-0.3512685, 0.7954984, 0.4908636, 1, 1, 1, 1, 1,
-0.3496378, -0.8847739, -2.621336, 1, 1, 1, 1, 1,
-0.3466222, -0.3330113, -1.701152, 1, 1, 1, 1, 1,
-0.3451727, -1.046359, -3.794581, 1, 1, 1, 1, 1,
-0.3433972, -0.193093, -2.710574, 0, 0, 1, 1, 1,
-0.3414283, 0.1953092, -0.5077777, 1, 0, 0, 1, 1,
-0.3402306, 0.4948934, 1.147503, 1, 0, 0, 1, 1,
-0.3396531, 0.1708014, -0.5563412, 1, 0, 0, 1, 1,
-0.3382425, 2.451309, 1.449024, 1, 0, 0, 1, 1,
-0.3367271, -0.3078214, -1.783747, 1, 0, 0, 1, 1,
-0.3344295, -1.28423, -1.460767, 0, 0, 0, 1, 1,
-0.3344057, 0.8388873, 0.5029599, 0, 0, 0, 1, 1,
-0.3201663, 0.4478917, -1.727167, 0, 0, 0, 1, 1,
-0.3191651, 0.4734462, -0.7173231, 0, 0, 0, 1, 1,
-0.317969, -0.4525569, -3.816152, 0, 0, 0, 1, 1,
-0.3157411, 0.5806748, -0.5324537, 0, 0, 0, 1, 1,
-0.31543, 0.2676491, -0.2815555, 0, 0, 0, 1, 1,
-0.3113101, 0.9398628, -0.8406122, 1, 1, 1, 1, 1,
-0.3091959, -0.4650975, -3.885188, 1, 1, 1, 1, 1,
-0.3062567, 0.03522218, -2.736285, 1, 1, 1, 1, 1,
-0.3059819, 1.347562, -0.006717447, 1, 1, 1, 1, 1,
-0.3036235, 0.2763041, -2.116134, 1, 1, 1, 1, 1,
-0.3032241, -0.280577, -4.362754, 1, 1, 1, 1, 1,
-0.3021191, 0.5818323, -1.578651, 1, 1, 1, 1, 1,
-0.2982241, -0.2375832, -1.060551, 1, 1, 1, 1, 1,
-0.2949299, 1.491829, -1.103629, 1, 1, 1, 1, 1,
-0.2892858, -1.121127, -3.74811, 1, 1, 1, 1, 1,
-0.2829153, -0.3113137, -2.043473, 1, 1, 1, 1, 1,
-0.2827424, -0.05484558, -0.6026971, 1, 1, 1, 1, 1,
-0.2823476, 1.947948, 0.466729, 1, 1, 1, 1, 1,
-0.280741, -0.9258751, -4.066607, 1, 1, 1, 1, 1,
-0.2752203, -0.07860344, -1.406372, 1, 1, 1, 1, 1,
-0.2737892, 0.6535787, -1.057021, 0, 0, 1, 1, 1,
-0.2722381, -0.07758347, -1.966775, 1, 0, 0, 1, 1,
-0.2706112, 1.366679, -1.275295, 1, 0, 0, 1, 1,
-0.2668262, 0.448848, -2.294865, 1, 0, 0, 1, 1,
-0.2647264, -0.923652, -4.149035, 1, 0, 0, 1, 1,
-0.2643007, -0.9424099, -2.173568, 1, 0, 0, 1, 1,
-0.2637758, -0.8728415, -2.443222, 0, 0, 0, 1, 1,
-0.2619251, 0.3040321, -1.080569, 0, 0, 0, 1, 1,
-0.257259, 0.5985609, 0.004098025, 0, 0, 0, 1, 1,
-0.2563204, -0.3950849, -3.168539, 0, 0, 0, 1, 1,
-0.2536218, -1.909118, -3.901106, 0, 0, 0, 1, 1,
-0.251423, -0.4803534, -3.517944, 0, 0, 0, 1, 1,
-0.2454014, -0.490345, -1.964659, 0, 0, 0, 1, 1,
-0.2404077, 0.6019173, -0.7633429, 1, 1, 1, 1, 1,
-0.2397042, -0.4867644, -2.703893, 1, 1, 1, 1, 1,
-0.2386669, 0.5889474, 0.7652447, 1, 1, 1, 1, 1,
-0.2337025, -0.629504, -0.9494962, 1, 1, 1, 1, 1,
-0.2311262, 0.2650752, -0.8085633, 1, 1, 1, 1, 1,
-0.2298933, 0.3913627, -0.1042371, 1, 1, 1, 1, 1,
-0.2298624, -0.3505905, -0.7342632, 1, 1, 1, 1, 1,
-0.2292178, 1.605295, -0.9158739, 1, 1, 1, 1, 1,
-0.2290455, -0.8512669, -2.400483, 1, 1, 1, 1, 1,
-0.2240115, 1.297931, -1.399083, 1, 1, 1, 1, 1,
-0.2238478, -0.7163452, -2.953646, 1, 1, 1, 1, 1,
-0.2229836, -0.4030237, -5.038395, 1, 1, 1, 1, 1,
-0.2210079, 0.934387, -0.7709588, 1, 1, 1, 1, 1,
-0.2162174, -0.2003167, -3.480875, 1, 1, 1, 1, 1,
-0.2043867, -2.162787, -2.592794, 1, 1, 1, 1, 1,
-0.2031598, -0.4091042, -4.198774, 0, 0, 1, 1, 1,
-0.1988317, -1.62438, -1.208008, 1, 0, 0, 1, 1,
-0.1968168, 1.563734, 1.25818, 1, 0, 0, 1, 1,
-0.1900127, -0.8176842, -2.768188, 1, 0, 0, 1, 1,
-0.187755, 0.3087081, -0.7181553, 1, 0, 0, 1, 1,
-0.1877326, 1.206552, 0.8252051, 1, 0, 0, 1, 1,
-0.1864014, 1.464903, -0.3434216, 0, 0, 0, 1, 1,
-0.1831181, -0.3609461, -5.124979, 0, 0, 0, 1, 1,
-0.1788121, -0.5434342, -4.576939, 0, 0, 0, 1, 1,
-0.1742917, -0.08384469, -1.394098, 0, 0, 0, 1, 1,
-0.1736509, -0.4220801, -3.103302, 0, 0, 0, 1, 1,
-0.1729995, -1.027244, -4.650113, 0, 0, 0, 1, 1,
-0.1642769, 0.2174489, -1.054968, 0, 0, 0, 1, 1,
-0.1631121, -0.6455035, -3.020633, 1, 1, 1, 1, 1,
-0.1625758, 0.3517869, 0.4372432, 1, 1, 1, 1, 1,
-0.1603084, 0.457308, -1.310799, 1, 1, 1, 1, 1,
-0.1602181, 2.164785, -0.05823233, 1, 1, 1, 1, 1,
-0.1593197, -0.469889, -2.401397, 1, 1, 1, 1, 1,
-0.1577382, 0.04677419, -1.094518, 1, 1, 1, 1, 1,
-0.1537491, -0.4690215, -1.114855, 1, 1, 1, 1, 1,
-0.1536158, -1.53421, -3.665761, 1, 1, 1, 1, 1,
-0.1528564, 0.3173797, 0.5622137, 1, 1, 1, 1, 1,
-0.1522914, -0.2709042, -3.987782, 1, 1, 1, 1, 1,
-0.1497895, 0.4276801, -1.165625, 1, 1, 1, 1, 1,
-0.147586, 0.4954833, -0.4830612, 1, 1, 1, 1, 1,
-0.1473976, -1.423974, -3.057763, 1, 1, 1, 1, 1,
-0.145384, 1.095316, -0.9033658, 1, 1, 1, 1, 1,
-0.1420617, -0.447515, -3.465412, 1, 1, 1, 1, 1,
-0.140847, -1.06026, -3.155694, 0, 0, 1, 1, 1,
-0.1395461, 0.3866804, -0.4933991, 1, 0, 0, 1, 1,
-0.1364101, -0.09574843, -2.459883, 1, 0, 0, 1, 1,
-0.1358679, 0.9577843, -0.9120248, 1, 0, 0, 1, 1,
-0.1330688, -0.2886523, -1.008894, 1, 0, 0, 1, 1,
-0.1280031, 0.2298424, -2.176473, 1, 0, 0, 1, 1,
-0.127463, 0.5998092, -0.4363634, 0, 0, 0, 1, 1,
-0.1260377, -0.6939016, -2.601831, 0, 0, 0, 1, 1,
-0.1253144, -0.1527209, -1.26926, 0, 0, 0, 1, 1,
-0.1249577, -0.1915255, -2.405606, 0, 0, 0, 1, 1,
-0.1249413, -1.144346, -3.169303, 0, 0, 0, 1, 1,
-0.1235461, 0.4936385, -0.5872585, 0, 0, 0, 1, 1,
-0.1216966, 0.441909, -1.302746, 0, 0, 0, 1, 1,
-0.1207392, -1.133004, -4.692186, 1, 1, 1, 1, 1,
-0.1123723, -1.662062, -1.995401, 1, 1, 1, 1, 1,
-0.1109606, -0.2156893, -3.78563, 1, 1, 1, 1, 1,
-0.1076418, 0.1407968, 1.382658, 1, 1, 1, 1, 1,
-0.1075018, -0.1794739, -2.935974, 1, 1, 1, 1, 1,
-0.1054227, -0.119543, -4.244853, 1, 1, 1, 1, 1,
-0.1027489, 0.7097332, -1.859132, 1, 1, 1, 1, 1,
-0.101578, -0.7264606, -4.499329, 1, 1, 1, 1, 1,
-0.09159245, -0.7851551, -2.347622, 1, 1, 1, 1, 1,
-0.08965561, -0.839298, -2.481415, 1, 1, 1, 1, 1,
-0.0845539, 1.44285, 0.6097515, 1, 1, 1, 1, 1,
-0.08323843, 0.8076915, -0.496414, 1, 1, 1, 1, 1,
-0.08018508, -1.348737, -1.971249, 1, 1, 1, 1, 1,
-0.07814007, 2.14475, -1.07034, 1, 1, 1, 1, 1,
-0.07477244, 0.8113545, -0.558918, 1, 1, 1, 1, 1,
-0.07381199, 1.33666, -0.2475898, 0, 0, 1, 1, 1,
-0.07091873, -1.603421, -2.590719, 1, 0, 0, 1, 1,
-0.06763762, -1.393706, -2.707959, 1, 0, 0, 1, 1,
-0.06635915, -0.06084146, -1.423998, 1, 0, 0, 1, 1,
-0.06544165, -0.246479, -1.996351, 1, 0, 0, 1, 1,
-0.06216098, -0.9772903, -4.412941, 1, 0, 0, 1, 1,
-0.06033814, -0.2138554, -4.51992, 0, 0, 0, 1, 1,
-0.05945781, -2.013848, -3.586111, 0, 0, 0, 1, 1,
-0.05906293, -0.723856, -3.748304, 0, 0, 0, 1, 1,
-0.05812122, 0.261921, -0.9552506, 0, 0, 0, 1, 1,
-0.04732357, 0.6809464, -0.1654377, 0, 0, 0, 1, 1,
-0.04708823, 0.7652496, 0.08113444, 0, 0, 0, 1, 1,
-0.04332426, -0.9841087, -3.965672, 0, 0, 0, 1, 1,
-0.04300785, -0.1956023, -3.328525, 1, 1, 1, 1, 1,
-0.04220773, 0.7348464, 0.01689863, 1, 1, 1, 1, 1,
-0.04202339, -0.4507714, -1.966875, 1, 1, 1, 1, 1,
-0.03897896, -1.407637, -2.992448, 1, 1, 1, 1, 1,
-0.03883794, -1.032296, -3.001747, 1, 1, 1, 1, 1,
-0.03805508, -0.1839722, -1.831507, 1, 1, 1, 1, 1,
-0.03183269, 1.10643, -1.375049, 1, 1, 1, 1, 1,
-0.02866793, 1.390658, 1.239197, 1, 1, 1, 1, 1,
-0.02773187, 0.5651671, 0.1996858, 1, 1, 1, 1, 1,
-0.02715451, -0.08163526, -1.444553, 1, 1, 1, 1, 1,
-0.02480364, 1.065976, 0.8426144, 1, 1, 1, 1, 1,
-0.02092957, 0.5038815, -0.5501969, 1, 1, 1, 1, 1,
-0.01982469, 0.4974809, 1.880137, 1, 1, 1, 1, 1,
-0.01496048, 1.301968, 0.4266283, 1, 1, 1, 1, 1,
-0.01461052, 0.5920997, 0.7873783, 1, 1, 1, 1, 1,
-0.01402656, -0.5309031, -0.5778105, 0, 0, 1, 1, 1,
-0.01231521, -0.8019074, -3.239664, 1, 0, 0, 1, 1,
-0.01209602, -0.2797103, -2.225251, 1, 0, 0, 1, 1,
-0.01208705, 0.1472337, -0.3133899, 1, 0, 0, 1, 1,
-0.01190286, -0.6265653, -3.294418, 1, 0, 0, 1, 1,
-0.00745351, -0.243693, -2.552438, 1, 0, 0, 1, 1,
-0.002228233, 1.282479, -0.3441356, 0, 0, 0, 1, 1,
0.0001423745, -0.9676092, 2.562183, 0, 0, 0, 1, 1,
0.00311123, -0.1009917, 2.618581, 0, 0, 0, 1, 1,
0.003196946, -0.5294315, 2.640034, 0, 0, 0, 1, 1,
0.003884676, -1.55773, 2.73708, 0, 0, 0, 1, 1,
0.005235746, 1.223784, -0.8286675, 0, 0, 0, 1, 1,
0.006612861, 0.01534183, 1.50187, 0, 0, 0, 1, 1,
0.008488221, 0.241445, -0.1919954, 1, 1, 1, 1, 1,
0.009299444, -0.8137575, 2.899772, 1, 1, 1, 1, 1,
0.0105038, 1.315843, -0.9926296, 1, 1, 1, 1, 1,
0.0113275, 0.7413177, 0.1279546, 1, 1, 1, 1, 1,
0.0121718, -0.257545, 2.258989, 1, 1, 1, 1, 1,
0.01356281, 0.7011243, 0.04303415, 1, 1, 1, 1, 1,
0.01422443, -0.5347335, 3.444348, 1, 1, 1, 1, 1,
0.01462219, -1.136676, 5.731266, 1, 1, 1, 1, 1,
0.01462497, -1.286371, 3.891018, 1, 1, 1, 1, 1,
0.01531709, 0.728678, 0.8952247, 1, 1, 1, 1, 1,
0.01986158, 0.654283, -0.08575625, 1, 1, 1, 1, 1,
0.02246135, -0.8238867, 2.388116, 1, 1, 1, 1, 1,
0.02378414, -0.7921519, 2.051219, 1, 1, 1, 1, 1,
0.02571157, -0.9644491, 2.899096, 1, 1, 1, 1, 1,
0.02625644, 1.183609, -1.250556, 1, 1, 1, 1, 1,
0.02679144, -0.01049065, 1.615023, 0, 0, 1, 1, 1,
0.02691501, -0.006693905, 1.457881, 1, 0, 0, 1, 1,
0.03167772, -0.5532141, 1.399053, 1, 0, 0, 1, 1,
0.03395178, 1.103856, -0.04117021, 1, 0, 0, 1, 1,
0.03402801, -2.353639, 2.946313, 1, 0, 0, 1, 1,
0.03480066, 2.106902, -0.05219279, 1, 0, 0, 1, 1,
0.03566324, -1.056196, 3.128252, 0, 0, 0, 1, 1,
0.03654606, 0.4456701, 0.4057179, 0, 0, 0, 1, 1,
0.0369328, 0.2996947, -1.509829, 0, 0, 0, 1, 1,
0.0409767, -1.722596, 3.306528, 0, 0, 0, 1, 1,
0.04141808, -0.4140726, 2.827686, 0, 0, 0, 1, 1,
0.04335741, 1.273467, 1.015481, 0, 0, 0, 1, 1,
0.04534798, -0.7265509, 2.852902, 0, 0, 0, 1, 1,
0.04584524, 1.668223, -0.8047159, 1, 1, 1, 1, 1,
0.04755688, -0.699866, 1.814697, 1, 1, 1, 1, 1,
0.05299609, 0.1104513, 0.1857711, 1, 1, 1, 1, 1,
0.05358292, -1.451496, 3.611356, 1, 1, 1, 1, 1,
0.05464715, 1.483585, -0.1120734, 1, 1, 1, 1, 1,
0.05548501, 0.4743754, -0.0374446, 1, 1, 1, 1, 1,
0.05653236, 0.6662796, 2.204098, 1, 1, 1, 1, 1,
0.05716512, 2.301304, 0.003929184, 1, 1, 1, 1, 1,
0.05812407, -0.5791129, 4.078957, 1, 1, 1, 1, 1,
0.05981798, 2.789624, -0.7570536, 1, 1, 1, 1, 1,
0.06262277, 0.8135242, 0.4690652, 1, 1, 1, 1, 1,
0.06526776, 0.3125671, 2.118733, 1, 1, 1, 1, 1,
0.06579754, 0.3870554, 0.7695822, 1, 1, 1, 1, 1,
0.06593141, 0.4877281, 2.124307, 1, 1, 1, 1, 1,
0.06942681, 0.5010889, -0.1869832, 1, 1, 1, 1, 1,
0.07177171, 0.1969614, 0.4110859, 0, 0, 1, 1, 1,
0.07266249, 1.175614, -1.953037, 1, 0, 0, 1, 1,
0.07355659, -1.288239, 2.407637, 1, 0, 0, 1, 1,
0.07600589, 0.4557961, 0.02479671, 1, 0, 0, 1, 1,
0.07618272, -1.229227, 3.576281, 1, 0, 0, 1, 1,
0.07725883, 1.190271, 0.3980336, 1, 0, 0, 1, 1,
0.07890274, 1.513589, 0.1765759, 0, 0, 0, 1, 1,
0.08000476, -0.4806293, 3.795613, 0, 0, 0, 1, 1,
0.08629061, 0.2551764, -0.4568649, 0, 0, 0, 1, 1,
0.08768985, 1.523749, 1.539701, 0, 0, 0, 1, 1,
0.09337691, 0.5896789, 0.416536, 0, 0, 0, 1, 1,
0.09361625, -1.066168, 3.358551, 0, 0, 0, 1, 1,
0.09591131, 0.09627774, 1.376147, 0, 0, 0, 1, 1,
0.09939676, -0.6978561, 1.414191, 1, 1, 1, 1, 1,
0.1004033, 0.05712077, 1.431414, 1, 1, 1, 1, 1,
0.1028758, 1.362673, 0.8513411, 1, 1, 1, 1, 1,
0.1076818, -0.8908976, 3.822659, 1, 1, 1, 1, 1,
0.1103154, 2.52265, -0.003602054, 1, 1, 1, 1, 1,
0.1148774, 0.6256357, 0.8926774, 1, 1, 1, 1, 1,
0.115665, 0.589716, -1.454718, 1, 1, 1, 1, 1,
0.1187941, 0.7796395, -0.8972346, 1, 1, 1, 1, 1,
0.1200171, 0.0703778, 0.2507139, 1, 1, 1, 1, 1,
0.1233942, -0.2588975, 2.0663, 1, 1, 1, 1, 1,
0.1314697, -0.9700276, 3.279421, 1, 1, 1, 1, 1,
0.1315778, 1.157193, -1.803857, 1, 1, 1, 1, 1,
0.1334915, 1.004002, -0.6104621, 1, 1, 1, 1, 1,
0.1339469, 0.7421677, 1.534377, 1, 1, 1, 1, 1,
0.1349134, -1.231929, 1.319665, 1, 1, 1, 1, 1,
0.1362378, -0.9190093, 1.592421, 0, 0, 1, 1, 1,
0.1422693, -0.410786, 2.341097, 1, 0, 0, 1, 1,
0.1447275, -0.9791396, 1.714163, 1, 0, 0, 1, 1,
0.1478661, -0.1768104, 2.176022, 1, 0, 0, 1, 1,
0.1496404, 0.5177172, 0.5296724, 1, 0, 0, 1, 1,
0.150379, 1.276953, -0.8208168, 1, 0, 0, 1, 1,
0.1528203, -0.652547, 1.28055, 0, 0, 0, 1, 1,
0.1535058, 0.8057899, -1.27168, 0, 0, 0, 1, 1,
0.1535654, -0.0810973, 2.407896, 0, 0, 0, 1, 1,
0.1543148, 1.375054, -0.02410234, 0, 0, 0, 1, 1,
0.1625007, 0.8972588, -0.6881284, 0, 0, 0, 1, 1,
0.1632032, 1.653475, 0.2313002, 0, 0, 0, 1, 1,
0.1652403, 1.449723, 0.112052, 0, 0, 0, 1, 1,
0.1671646, 0.9866661, -0.05292467, 1, 1, 1, 1, 1,
0.1690906, 0.704345, -1.863475, 1, 1, 1, 1, 1,
0.1713095, -1.790597, 4.631445, 1, 1, 1, 1, 1,
0.1773743, -1.161361, 2.787573, 1, 1, 1, 1, 1,
0.1823506, -0.5308059, 3.330755, 1, 1, 1, 1, 1,
0.1824431, 1.066703, 1.10871, 1, 1, 1, 1, 1,
0.1827448, 2.561058, -0.1336408, 1, 1, 1, 1, 1,
0.1834982, 0.7203379, 1.437636, 1, 1, 1, 1, 1,
0.1929309, 0.1388758, 2.67908, 1, 1, 1, 1, 1,
0.1935461, -0.1900426, 2.133172, 1, 1, 1, 1, 1,
0.1958808, -0.4065556, 5.036045, 1, 1, 1, 1, 1,
0.2011319, -0.4558251, 3.904532, 1, 1, 1, 1, 1,
0.2026246, -0.6518776, 3.68659, 1, 1, 1, 1, 1,
0.2061933, -1.263516, 3.222933, 1, 1, 1, 1, 1,
0.2139914, 0.1467171, 1.604788, 1, 1, 1, 1, 1,
0.2208852, 0.8544266, 0.8476942, 0, 0, 1, 1, 1,
0.2290374, -1.481699, 3.041682, 1, 0, 0, 1, 1,
0.2292121, 0.09075991, 2.766548, 1, 0, 0, 1, 1,
0.2308632, -0.1563818, 1.637476, 1, 0, 0, 1, 1,
0.2331813, 1.264346, 0.5833179, 1, 0, 0, 1, 1,
0.233932, 2.302719, 1.40072, 1, 0, 0, 1, 1,
0.2355871, -1.270553, 3.418169, 0, 0, 0, 1, 1,
0.2363554, 0.3758108, 3.835055, 0, 0, 0, 1, 1,
0.2435451, 1.361132, -0.1569898, 0, 0, 0, 1, 1,
0.2446173, -0.6426463, 5.016777, 0, 0, 0, 1, 1,
0.2486733, -0.7514604, 3.63627, 0, 0, 0, 1, 1,
0.251718, -0.1887676, 3.427855, 0, 0, 0, 1, 1,
0.2525679, 0.9827338, 0.02575555, 0, 0, 0, 1, 1,
0.25876, 1.474985, -0.4257747, 1, 1, 1, 1, 1,
0.2603854, -0.7610919, 3.759738, 1, 1, 1, 1, 1,
0.2638358, 0.8739071, 0.4630585, 1, 1, 1, 1, 1,
0.264212, -0.03365869, 1.242583, 1, 1, 1, 1, 1,
0.2676585, 1.030401, -0.4150331, 1, 1, 1, 1, 1,
0.2706931, 0.7370014, -0.0488268, 1, 1, 1, 1, 1,
0.2730881, -0.6725149, 1.040371, 1, 1, 1, 1, 1,
0.273855, 2.476395, -1.16719, 1, 1, 1, 1, 1,
0.2752143, 1.402665, 0.3455557, 1, 1, 1, 1, 1,
0.2778608, 0.2669005, 0.8720732, 1, 1, 1, 1, 1,
0.2851034, -0.6849506, 2.489194, 1, 1, 1, 1, 1,
0.2855184, 0.8720577, -0.6545746, 1, 1, 1, 1, 1,
0.2867825, 0.05057377, 3.106588, 1, 1, 1, 1, 1,
0.2879426, -1.336294, 3.402052, 1, 1, 1, 1, 1,
0.2908676, 1.401264, 1.10147, 1, 1, 1, 1, 1,
0.2916024, -1.912, 3.005564, 0, 0, 1, 1, 1,
0.2932758, 1.022356, 1.385366, 1, 0, 0, 1, 1,
0.2940608, 1.632007, -0.9223204, 1, 0, 0, 1, 1,
0.2954897, 0.2646693, 0.5381284, 1, 0, 0, 1, 1,
0.2982053, 0.8745362, 0.8042542, 1, 0, 0, 1, 1,
0.3002122, -0.3146051, 3.727592, 1, 0, 0, 1, 1,
0.3020818, -0.03385371, 1.189758, 0, 0, 0, 1, 1,
0.302126, -1.639854, 2.20671, 0, 0, 0, 1, 1,
0.3026828, 1.275531, 0.9343654, 0, 0, 0, 1, 1,
0.3032882, -0.5641685, 3.102023, 0, 0, 0, 1, 1,
0.3043504, 0.145264, 1.303646, 0, 0, 0, 1, 1,
0.3063858, 0.8484651, -0.3330304, 0, 0, 0, 1, 1,
0.308171, 0.4907896, 1.570132, 0, 0, 0, 1, 1,
0.3103371, -0.8826119, 4.431367, 1, 1, 1, 1, 1,
0.3156394, 0.1988507, -1.118228, 1, 1, 1, 1, 1,
0.3187161, -0.6821064, 2.667212, 1, 1, 1, 1, 1,
0.3193969, 0.3900151, 0.9153805, 1, 1, 1, 1, 1,
0.321139, -0.08688868, 1.707547, 1, 1, 1, 1, 1,
0.3228439, 0.8300153, 0.1842047, 1, 1, 1, 1, 1,
0.3236341, 0.6465105, -0.02670674, 1, 1, 1, 1, 1,
0.3311006, -1.504662, 3.343027, 1, 1, 1, 1, 1,
0.3315282, -0.5979195, 2.001154, 1, 1, 1, 1, 1,
0.3332275, 0.03416608, 2.120863, 1, 1, 1, 1, 1,
0.3338639, -0.353135, 3.392862, 1, 1, 1, 1, 1,
0.3372153, 0.6359988, -0.3448624, 1, 1, 1, 1, 1,
0.3383526, -0.2320503, -0.05327506, 1, 1, 1, 1, 1,
0.3402583, 1.17323, -0.271569, 1, 1, 1, 1, 1,
0.3411637, 0.2407883, 1.086094, 1, 1, 1, 1, 1,
0.3450343, 1.220053, 0.234291, 0, 0, 1, 1, 1,
0.3450902, 0.2608238, 0.110406, 1, 0, 0, 1, 1,
0.3489068, -0.1488319, 1.808185, 1, 0, 0, 1, 1,
0.3517178, 1.08477, 0.7171022, 1, 0, 0, 1, 1,
0.3520662, 0.9323217, 1.207637, 1, 0, 0, 1, 1,
0.3522545, 0.7720786, 0.2883464, 1, 0, 0, 1, 1,
0.3524108, 0.851514, 0.6223059, 0, 0, 0, 1, 1,
0.3532486, -1.004165, 2.03038, 0, 0, 0, 1, 1,
0.354617, -1.178303, 3.924504, 0, 0, 0, 1, 1,
0.3553618, 0.3514662, 0.7914178, 0, 0, 0, 1, 1,
0.3577908, 0.114233, 1.863309, 0, 0, 0, 1, 1,
0.367823, -0.02190371, 0.1291767, 0, 0, 0, 1, 1,
0.3727283, -0.06219001, 1.781795, 0, 0, 0, 1, 1,
0.3732397, -1.117133, 5.130235, 1, 1, 1, 1, 1,
0.3819848, -0.9621503, 1.484537, 1, 1, 1, 1, 1,
0.3830421, 0.655038, -0.2998895, 1, 1, 1, 1, 1,
0.3887829, -0.7816715, 3.31627, 1, 1, 1, 1, 1,
0.3899667, 1.065154, 0.6739042, 1, 1, 1, 1, 1,
0.3911796, 1.894975, 0.9044814, 1, 1, 1, 1, 1,
0.4005567, 0.8396441, 1.585552, 1, 1, 1, 1, 1,
0.4013582, -0.004835838, 0.9933408, 1, 1, 1, 1, 1,
0.4130855, -1.449154, 2.924163, 1, 1, 1, 1, 1,
0.4131011, -0.7924973, 1.438983, 1, 1, 1, 1, 1,
0.4152781, 0.4792429, 0.5765206, 1, 1, 1, 1, 1,
0.4161522, 0.02244274, 1.110972, 1, 1, 1, 1, 1,
0.4204076, -0.2025793, 1.234735, 1, 1, 1, 1, 1,
0.4357263, -0.1881291, 0.8837925, 1, 1, 1, 1, 1,
0.4397763, 0.7115075, -1.320248, 1, 1, 1, 1, 1,
0.4417248, 0.3181872, 1.853507, 0, 0, 1, 1, 1,
0.4438336, -0.1213071, 1.459661, 1, 0, 0, 1, 1,
0.4498242, 0.05741354, 1.983169, 1, 0, 0, 1, 1,
0.4525182, 0.2410201, 0.9527214, 1, 0, 0, 1, 1,
0.4569818, 0.2235856, 0.7970256, 1, 0, 0, 1, 1,
0.4593767, -0.7629812, 1.964056, 1, 0, 0, 1, 1,
0.4599358, 0.002533298, 0.9550144, 0, 0, 0, 1, 1,
0.4649577, -0.05912425, 1.694675, 0, 0, 0, 1, 1,
0.4686066, 0.7357317, 0.8495838, 0, 0, 0, 1, 1,
0.4718946, -1.174082, 3.115515, 0, 0, 0, 1, 1,
0.477448, 0.6030313, 1.461292, 0, 0, 0, 1, 1,
0.4796427, -2.713681, 2.725515, 0, 0, 0, 1, 1,
0.4871917, -1.307435, 2.642155, 0, 0, 0, 1, 1,
0.4881009, 0.2887953, 1.082075, 1, 1, 1, 1, 1,
0.4926677, 0.5701387, 1.744179, 1, 1, 1, 1, 1,
0.494027, 0.5011846, 0.4587674, 1, 1, 1, 1, 1,
0.4979365, -1.007073, 2.57772, 1, 1, 1, 1, 1,
0.4979614, 0.022866, 0.6972035, 1, 1, 1, 1, 1,
0.5132908, -0.3333816, 2.36915, 1, 1, 1, 1, 1,
0.5185779, -0.5795504, 4.562175, 1, 1, 1, 1, 1,
0.5255362, 3.171593, -0.2900912, 1, 1, 1, 1, 1,
0.5271953, -0.7374282, 2.005482, 1, 1, 1, 1, 1,
0.5274959, -0.2500565, 2.545622, 1, 1, 1, 1, 1,
0.5307314, -1.71459, 3.030649, 1, 1, 1, 1, 1,
0.5420259, 2.832274, 0.6227683, 1, 1, 1, 1, 1,
0.545495, 0.5212837, 0.687693, 1, 1, 1, 1, 1,
0.5513988, -0.4919866, 3.09671, 1, 1, 1, 1, 1,
0.5520781, -1.133162, 2.753703, 1, 1, 1, 1, 1,
0.5572442, -0.3932066, 1.369853, 0, 0, 1, 1, 1,
0.5584794, -0.2524645, 0.7983054, 1, 0, 0, 1, 1,
0.5648059, 0.4489121, 0.6402363, 1, 0, 0, 1, 1,
0.5648965, -0.2845312, 0.516038, 1, 0, 0, 1, 1,
0.5663639, 1.100589, -0.1213174, 1, 0, 0, 1, 1,
0.5672684, 0.03341857, 0.6454723, 1, 0, 0, 1, 1,
0.5690969, -0.4318614, 1.892973, 0, 0, 0, 1, 1,
0.5724788, 0.4601165, 1.221142, 0, 0, 0, 1, 1,
0.57472, -1.288872, 3.515848, 0, 0, 0, 1, 1,
0.5752149, 0.1920165, 1.138194, 0, 0, 0, 1, 1,
0.5906073, -0.8387091, 2.372541, 0, 0, 0, 1, 1,
0.5919195, 0.4485557, 0.2865354, 0, 0, 0, 1, 1,
0.5961074, 0.9414594, 0.9229861, 0, 0, 0, 1, 1,
0.5981176, 0.434321, -0.6555481, 1, 1, 1, 1, 1,
0.5987347, -0.958885, 3.888941, 1, 1, 1, 1, 1,
0.6001846, -0.7661693, 1.477144, 1, 1, 1, 1, 1,
0.6071339, 1.465595, -0.5361753, 1, 1, 1, 1, 1,
0.6084459, -1.318384, 1.965513, 1, 1, 1, 1, 1,
0.6088122, -1.472541, 1.533987, 1, 1, 1, 1, 1,
0.6099494, -1.879726, 3.717502, 1, 1, 1, 1, 1,
0.6103973, 0.8769365, -0.0638489, 1, 1, 1, 1, 1,
0.6105903, -0.2640752, 1.902825, 1, 1, 1, 1, 1,
0.6137461, 0.8111869, 1.194012, 1, 1, 1, 1, 1,
0.6149052, -1.360715, 2.599813, 1, 1, 1, 1, 1,
0.6167446, 0.5736899, 0.2046244, 1, 1, 1, 1, 1,
0.6199149, 0.04459857, 2.015583, 1, 1, 1, 1, 1,
0.6200241, -0.8596227, 0.8024039, 1, 1, 1, 1, 1,
0.6244347, 0.2182838, 0.07674561, 1, 1, 1, 1, 1,
0.6251476, -0.6468781, 3.480389, 0, 0, 1, 1, 1,
0.6252747, -1.078595, 2.456246, 1, 0, 0, 1, 1,
0.6259812, -0.446335, 2.898496, 1, 0, 0, 1, 1,
0.6299205, 0.3736656, 1.449638, 1, 0, 0, 1, 1,
0.6352783, 1.730567, 1.151107, 1, 0, 0, 1, 1,
0.6354672, 0.2569372, 0.6513066, 1, 0, 0, 1, 1,
0.6356916, -0.7355393, 4.469043, 0, 0, 0, 1, 1,
0.6371491, -0.4585748, 1.425415, 0, 0, 0, 1, 1,
0.6371711, 0.1247685, -0.4565818, 0, 0, 0, 1, 1,
0.6371799, 1.458166, 1.782689, 0, 0, 0, 1, 1,
0.6401228, 1.349154, -0.9948276, 0, 0, 0, 1, 1,
0.641856, -1.09022, 2.574649, 0, 0, 0, 1, 1,
0.6430615, -0.314353, 1.834947, 0, 0, 0, 1, 1,
0.6450763, 1.300557, 0.2933159, 1, 1, 1, 1, 1,
0.6457875, -1.169915, 4.146579, 1, 1, 1, 1, 1,
0.6462532, 0.9416317, 0.01551777, 1, 1, 1, 1, 1,
0.6501706, -0.3397257, 0.8849707, 1, 1, 1, 1, 1,
0.6511742, 0.09696074, 3.120889, 1, 1, 1, 1, 1,
0.653473, -0.5591322, 3.166615, 1, 1, 1, 1, 1,
0.6559489, -0.3176431, 2.872864, 1, 1, 1, 1, 1,
0.6572389, -0.8168019, 3.174714, 1, 1, 1, 1, 1,
0.6615995, -0.7973709, 1.914761, 1, 1, 1, 1, 1,
0.6631387, -0.7491884, 1.860236, 1, 1, 1, 1, 1,
0.6658206, -1.759567, 2.555087, 1, 1, 1, 1, 1,
0.6679417, 0.2744458, -0.7404228, 1, 1, 1, 1, 1,
0.6701083, 0.04118617, 0.562601, 1, 1, 1, 1, 1,
0.670126, 0.04554583, -0.2681664, 1, 1, 1, 1, 1,
0.6705495, 0.3034553, 1.842779, 1, 1, 1, 1, 1,
0.672977, -1.344825, 2.394719, 0, 0, 1, 1, 1,
0.6731619, -0.8058532, 3.123302, 1, 0, 0, 1, 1,
0.674692, 1.516797, 0.3275867, 1, 0, 0, 1, 1,
0.6795327, -1.331535, 1.57548, 1, 0, 0, 1, 1,
0.6818938, -0.9085242, 1.95538, 1, 0, 0, 1, 1,
0.6862271, 1.030189, -0.5224146, 1, 0, 0, 1, 1,
0.6883184, 0.5214891, 2.167783, 0, 0, 0, 1, 1,
0.6884646, 0.6720288, 1.841255, 0, 0, 0, 1, 1,
0.695495, -0.5835941, 2.369642, 0, 0, 0, 1, 1,
0.6961532, -0.2258592, 2.805872, 0, 0, 0, 1, 1,
0.7004576, -0.7037924, 3.847599, 0, 0, 0, 1, 1,
0.7029634, -0.79804, 4.366141, 0, 0, 0, 1, 1,
0.7036815, -0.909113, 3.741891, 0, 0, 0, 1, 1,
0.7040375, -1.395835, 2.723782, 1, 1, 1, 1, 1,
0.7046146, 2.692841, 1.673068, 1, 1, 1, 1, 1,
0.7058818, -1.162485, 1.721442, 1, 1, 1, 1, 1,
0.7104213, 0.1936387, 2.516171, 1, 1, 1, 1, 1,
0.7151467, -0.1456195, 1.675697, 1, 1, 1, 1, 1,
0.718326, 0.204946, -1.690145, 1, 1, 1, 1, 1,
0.7205129, -0.1813246, 2.99979, 1, 1, 1, 1, 1,
0.7214025, -0.3226654, 1.912111, 1, 1, 1, 1, 1,
0.7225723, 0.4342231, 0.6736682, 1, 1, 1, 1, 1,
0.7230749, -0.7030885, 2.34377, 1, 1, 1, 1, 1,
0.724568, 1.09306, -1.222095, 1, 1, 1, 1, 1,
0.7272931, -0.9123667, 1.736063, 1, 1, 1, 1, 1,
0.7282258, 0.1768991, 0.551064, 1, 1, 1, 1, 1,
0.733321, 1.986962, -0.2393729, 1, 1, 1, 1, 1,
0.7341156, 1.231831, 2.170108, 1, 1, 1, 1, 1,
0.7353446, 0.5723957, -0.08616009, 0, 0, 1, 1, 1,
0.7392728, 0.2164159, 0.5006995, 1, 0, 0, 1, 1,
0.7399791, 0.4801286, -0.1432877, 1, 0, 0, 1, 1,
0.7431679, -0.3229511, 2.615448, 1, 0, 0, 1, 1,
0.7483001, -0.2111102, 2.375769, 1, 0, 0, 1, 1,
0.7490727, 0.9207667, 1.698781, 1, 0, 0, 1, 1,
0.7507523, -0.4557636, 2.335444, 0, 0, 0, 1, 1,
0.7537533, 0.9141308, 2.671291, 0, 0, 0, 1, 1,
0.7580618, -0.06057529, 0.8763301, 0, 0, 0, 1, 1,
0.7591382, -0.3902205, 1.322261, 0, 0, 0, 1, 1,
0.7745179, 0.8852227, 0.1254162, 0, 0, 0, 1, 1,
0.7803065, -0.9493402, 1.23479, 0, 0, 0, 1, 1,
0.7803928, 1.502075, 1.839102, 0, 0, 0, 1, 1,
0.7884055, -0.8757463, 2.48472, 1, 1, 1, 1, 1,
0.7947201, -1.421017, 2.928123, 1, 1, 1, 1, 1,
0.7981016, -0.9245988, 3.117459, 1, 1, 1, 1, 1,
0.7987723, 0.5916039, 0.5901876, 1, 1, 1, 1, 1,
0.8025489, 1.073271, -0.5336553, 1, 1, 1, 1, 1,
0.8113942, 0.9087346, -0.1690913, 1, 1, 1, 1, 1,
0.8138277, 0.8704867, 0.3722748, 1, 1, 1, 1, 1,
0.8175793, 1.514674, 0.04560748, 1, 1, 1, 1, 1,
0.8191703, 1.416246, 2.227534, 1, 1, 1, 1, 1,
0.8265033, 0.6059539, 0.8503075, 1, 1, 1, 1, 1,
0.8270086, 0.4569094, 0.7420843, 1, 1, 1, 1, 1,
0.8327445, 0.6063366, -0.2197962, 1, 1, 1, 1, 1,
0.839669, -0.07912728, -0.2276151, 1, 1, 1, 1, 1,
0.8397875, 0.21705, 1.736183, 1, 1, 1, 1, 1,
0.8438563, 0.8594292, 0.6045174, 1, 1, 1, 1, 1,
0.8494848, 1.888695, 1.23255, 0, 0, 1, 1, 1,
0.852551, -0.7771697, 1.550447, 1, 0, 0, 1, 1,
0.8580878, -1.077698, 2.256109, 1, 0, 0, 1, 1,
0.8598202, -0.3541422, 3.503299, 1, 0, 0, 1, 1,
0.8649074, -1.941833, 2.37312, 1, 0, 0, 1, 1,
0.8661292, 0.03269748, 0.7852329, 1, 0, 0, 1, 1,
0.8716996, -0.3136488, 2.04436, 0, 0, 0, 1, 1,
0.8733255, 0.1268029, -0.05744065, 0, 0, 0, 1, 1,
0.8736987, 0.5725206, 2.301495, 0, 0, 0, 1, 1,
0.8747648, 0.3713426, -0.1450678, 0, 0, 0, 1, 1,
0.8759703, 0.8230678, 1.107568, 0, 0, 0, 1, 1,
0.8768269, -0.1175303, 2.031415, 0, 0, 0, 1, 1,
0.8815623, 1.669317, 2.515956, 0, 0, 0, 1, 1,
0.8829643, -1.018608, 3.215428, 1, 1, 1, 1, 1,
0.8848873, -2.998124, 2.803101, 1, 1, 1, 1, 1,
0.8901247, 0.4122835, 0.1786349, 1, 1, 1, 1, 1,
0.8942747, -1.525863, 2.769518, 1, 1, 1, 1, 1,
0.8989912, -1.464306, 2.984522, 1, 1, 1, 1, 1,
0.9033129, 0.9933243, -0.8351153, 1, 1, 1, 1, 1,
0.9041506, 0.1406122, 0.5025316, 1, 1, 1, 1, 1,
0.9043661, -1.03312, 2.845452, 1, 1, 1, 1, 1,
0.9057068, -1.183226, 2.235279, 1, 1, 1, 1, 1,
0.9088424, 0.3392602, -0.3343776, 1, 1, 1, 1, 1,
0.9092256, -0.4504884, 1.247373, 1, 1, 1, 1, 1,
0.9205962, 2.306828, 1.410881, 1, 1, 1, 1, 1,
0.9246554, 1.109136, 0.05625438, 1, 1, 1, 1, 1,
0.9276038, -0.05015782, 1.360165, 1, 1, 1, 1, 1,
0.9280885, 0.405605, 0.3209717, 1, 1, 1, 1, 1,
0.9309026, -1.010906, 2.464388, 0, 0, 1, 1, 1,
0.9352839, -2.395633, 3.292582, 1, 0, 0, 1, 1,
0.9393563, 0.8961972, -0.4829494, 1, 0, 0, 1, 1,
0.9393693, -1.260028, 5.909833, 1, 0, 0, 1, 1,
0.9523714, -0.3184696, 1.682234, 1, 0, 0, 1, 1,
0.9524395, 0.3421521, 1.983267, 1, 0, 0, 1, 1,
0.9585968, 1.997329, 0.7660781, 0, 0, 0, 1, 1,
0.9652169, -0.2848983, 1.323455, 0, 0, 0, 1, 1,
0.9655448, 1.28446, 2.063681, 0, 0, 0, 1, 1,
0.9840862, -0.2225163, 0.4565389, 0, 0, 0, 1, 1,
0.9857539, 1.065795, -1.18098, 0, 0, 0, 1, 1,
0.9857823, 1.293947, 2.268593, 0, 0, 0, 1, 1,
0.9863374, 0.9996241, 0.1092073, 0, 0, 0, 1, 1,
1.006496, 0.1153179, 3.83171, 1, 1, 1, 1, 1,
1.010569, -0.1158596, 1.146468, 1, 1, 1, 1, 1,
1.012879, -0.8937241, 1.995952, 1, 1, 1, 1, 1,
1.020492, 1.982971, -1.409709, 1, 1, 1, 1, 1,
1.025263, -1.166068, 2.41838, 1, 1, 1, 1, 1,
1.025456, -1.972412, 2.348811, 1, 1, 1, 1, 1,
1.031274, 1.144902, 2.381561, 1, 1, 1, 1, 1,
1.03894, 0.2860503, 0.824477, 1, 1, 1, 1, 1,
1.041698, 1.694407, 0.9331874, 1, 1, 1, 1, 1,
1.044008, -0.3715633, 2.71889, 1, 1, 1, 1, 1,
1.044911, 1.479677, -1.011162, 1, 1, 1, 1, 1,
1.060427, 0.8299698, 0.3531286, 1, 1, 1, 1, 1,
1.061411, 0.07322638, 1.063129, 1, 1, 1, 1, 1,
1.062144, -0.05839104, 0.7965636, 1, 1, 1, 1, 1,
1.071914, 0.2209216, 0.8135301, 1, 1, 1, 1, 1,
1.074885, 0.5515132, 1.051601, 0, 0, 1, 1, 1,
1.076849, 0.02647555, 3.175768, 1, 0, 0, 1, 1,
1.083427, 2.03331, 0.1547615, 1, 0, 0, 1, 1,
1.093428, -0.5434199, 3.309914, 1, 0, 0, 1, 1,
1.095321, 1.587982, -0.1806369, 1, 0, 0, 1, 1,
1.096593, 0.5621988, -0.6704747, 1, 0, 0, 1, 1,
1.102209, -1.079888, 0.07354629, 0, 0, 0, 1, 1,
1.109581, -0.4809503, 2.911065, 0, 0, 0, 1, 1,
1.114525, 1.010232, 0.7802508, 0, 0, 0, 1, 1,
1.116966, -0.1512882, 2.386228, 0, 0, 0, 1, 1,
1.11953, -0.8865258, 0.9440578, 0, 0, 0, 1, 1,
1.12874, -1.56889, 2.761332, 0, 0, 0, 1, 1,
1.132492, -1.301741, 2.377143, 0, 0, 0, 1, 1,
1.132885, -0.168071, 3.626777, 1, 1, 1, 1, 1,
1.134923, -0.9385339, 2.298207, 1, 1, 1, 1, 1,
1.141086, 0.7379202, 1.849607, 1, 1, 1, 1, 1,
1.142798, 0.2953339, 1.225527, 1, 1, 1, 1, 1,
1.145255, -0.9246697, 2.984108, 1, 1, 1, 1, 1,
1.146813, 0.9038026, 0.7861985, 1, 1, 1, 1, 1,
1.178047, 0.9546154, 0.701325, 1, 1, 1, 1, 1,
1.197689, -0.0741789, 2.062914, 1, 1, 1, 1, 1,
1.199116, 0.630246, 1.768343, 1, 1, 1, 1, 1,
1.201965, -0.9073235, 3.219689, 1, 1, 1, 1, 1,
1.207624, 0.191942, 1.879224, 1, 1, 1, 1, 1,
1.221273, -0.1866086, 1.770748, 1, 1, 1, 1, 1,
1.232623, 0.5683333, 0.5809234, 1, 1, 1, 1, 1,
1.232978, 1.737556, 0.4583443, 1, 1, 1, 1, 1,
1.23481, -0.9569424, 1.752307, 1, 1, 1, 1, 1,
1.235781, -0.3302765, 0.9826283, 0, 0, 1, 1, 1,
1.246348, -0.9378729, 3.533634, 1, 0, 0, 1, 1,
1.255303, 0.0757404, 2.358578, 1, 0, 0, 1, 1,
1.255497, -1.34389, 2.629399, 1, 0, 0, 1, 1,
1.259937, 0.05582806, 2.979295, 1, 0, 0, 1, 1,
1.260256, 0.8903617, 0.9655816, 1, 0, 0, 1, 1,
1.278549, 0.08666503, 3.528719, 0, 0, 0, 1, 1,
1.282376, 1.451033, 1.770171, 0, 0, 0, 1, 1,
1.283027, 0.1430727, 1.47091, 0, 0, 0, 1, 1,
1.292866, 1.319308, 2.246329, 0, 0, 0, 1, 1,
1.293589, -0.2920729, 0.8391136, 0, 0, 0, 1, 1,
1.296884, 0.7891055, 0.3406909, 0, 0, 0, 1, 1,
1.301278, 0.222209, 1.320734, 0, 0, 0, 1, 1,
1.310788, 0.6761575, 0.3677891, 1, 1, 1, 1, 1,
1.315923, 0.6223304, 1.801646, 1, 1, 1, 1, 1,
1.317457, 0.04061491, 1.804453, 1, 1, 1, 1, 1,
1.324277, 0.02619651, 2.360549, 1, 1, 1, 1, 1,
1.326986, 1.38659, -1.156447, 1, 1, 1, 1, 1,
1.329695, -0.2543861, 1.155928, 1, 1, 1, 1, 1,
1.336036, -0.4386317, -0.1920216, 1, 1, 1, 1, 1,
1.336163, 0.06691761, 0.4045739, 1, 1, 1, 1, 1,
1.343404, 0.2547222, 1.59594, 1, 1, 1, 1, 1,
1.346982, 0.5636329, -0.7880499, 1, 1, 1, 1, 1,
1.357572, -0.7276639, 0.06462374, 1, 1, 1, 1, 1,
1.35919, -0.3361296, 2.479581, 1, 1, 1, 1, 1,
1.361165, 0.03247733, 0.1015096, 1, 1, 1, 1, 1,
1.3667, -1.295734, 2.396492, 1, 1, 1, 1, 1,
1.369627, -1.526904, 1.644179, 1, 1, 1, 1, 1,
1.374389, 0.1113124, 1.953961, 0, 0, 1, 1, 1,
1.378499, -0.6129413, 0.6327007, 1, 0, 0, 1, 1,
1.384558, -0.5380447, 1.718579, 1, 0, 0, 1, 1,
1.389085, 0.5199873, 0.7486852, 1, 0, 0, 1, 1,
1.389635, -0.6580658, 1.230362, 1, 0, 0, 1, 1,
1.391214, -0.316686, 1.108895, 1, 0, 0, 1, 1,
1.417459, 0.6058704, 1.234778, 0, 0, 0, 1, 1,
1.432683, 1.375862, 1.847641, 0, 0, 0, 1, 1,
1.44586, -1.864161, -0.2679433, 0, 0, 0, 1, 1,
1.466286, -0.4209913, 1.459383, 0, 0, 0, 1, 1,
1.477282, -0.5913397, 1.024076, 0, 0, 0, 1, 1,
1.490699, -0.3698694, 0.4467865, 0, 0, 0, 1, 1,
1.491699, -0.7192466, 1.565348, 0, 0, 0, 1, 1,
1.508891, -0.6719316, 3.064067, 1, 1, 1, 1, 1,
1.509046, 0.59953, 2.508626, 1, 1, 1, 1, 1,
1.513939, -0.4206163, 1.098513, 1, 1, 1, 1, 1,
1.551749, -0.1388653, 1.773736, 1, 1, 1, 1, 1,
1.552553, -1.347718, 2.633601, 1, 1, 1, 1, 1,
1.552779, -0.8144067, 1.744596, 1, 1, 1, 1, 1,
1.558007, -1.64317, 3.751373, 1, 1, 1, 1, 1,
1.562726, -1.429031, 3.013938, 1, 1, 1, 1, 1,
1.573173, 0.5693478, 0.9732402, 1, 1, 1, 1, 1,
1.585874, 0.4427889, 0.03414375, 1, 1, 1, 1, 1,
1.588811, -0.7083164, 2.18352, 1, 1, 1, 1, 1,
1.607119, 0.07413734, 1.239683, 1, 1, 1, 1, 1,
1.614479, 1.41106, 0.8986644, 1, 1, 1, 1, 1,
1.620708, 0.5283004, 1.657431, 1, 1, 1, 1, 1,
1.633039, -0.1541202, 0.9935023, 1, 1, 1, 1, 1,
1.63877, -0.1222227, 0.3765144, 0, 0, 1, 1, 1,
1.652766, 0.1788313, 2.840435, 1, 0, 0, 1, 1,
1.656993, -0.3481285, 0.3318506, 1, 0, 0, 1, 1,
1.679261, -0.2876115, 1.853757, 1, 0, 0, 1, 1,
1.701258, -0.2860253, 1.231278, 1, 0, 0, 1, 1,
1.721907, -3.568778, 2.642736, 1, 0, 0, 1, 1,
1.733493, 1.026497, 0.9636208, 0, 0, 0, 1, 1,
1.74142, 0.6060559, 0.6340067, 0, 0, 0, 1, 1,
1.758804, 0.494945, 2.513018, 0, 0, 0, 1, 1,
1.779437, 0.8946918, 1.223042, 0, 0, 0, 1, 1,
1.779847, -0.3864937, 2.022879, 0, 0, 0, 1, 1,
1.803105, -0.6671872, 2.06005, 0, 0, 0, 1, 1,
1.83124, -0.08728244, 2.156563, 0, 0, 0, 1, 1,
1.863713, -1.500071, 2.429229, 1, 1, 1, 1, 1,
1.867192, -0.5406854, 1.115185, 1, 1, 1, 1, 1,
1.868485, 1.721586, -0.01390053, 1, 1, 1, 1, 1,
1.876529, -0.2556011, 2.696807, 1, 1, 1, 1, 1,
1.876781, 1.468645, 0.2199071, 1, 1, 1, 1, 1,
1.890716, 0.1424599, 1.509816, 1, 1, 1, 1, 1,
1.928944, -1.430065, 1.183406, 1, 1, 1, 1, 1,
1.943506, -0.7696447, 1.595019, 1, 1, 1, 1, 1,
1.948149, -0.3983406, 1.645607, 1, 1, 1, 1, 1,
1.951029, 0.5558697, 2.865297, 1, 1, 1, 1, 1,
2.017365, 0.09914155, 2.661929, 1, 1, 1, 1, 1,
2.019295, 1.905301, 2.427875, 1, 1, 1, 1, 1,
2.053185, 1.030596, 1.526333, 1, 1, 1, 1, 1,
2.054435, 0.9343246, 3.010071, 1, 1, 1, 1, 1,
2.06583, -1.16799, 1.496708, 1, 1, 1, 1, 1,
2.082183, 0.4695214, 1.164522, 0, 0, 1, 1, 1,
2.1285, -1.581744, 3.474596, 1, 0, 0, 1, 1,
2.134536, -1.204431, 3.753022, 1, 0, 0, 1, 1,
2.163838, 1.407458, 0.5509026, 1, 0, 0, 1, 1,
2.187232, 1.194002, -0.3962667, 1, 0, 0, 1, 1,
2.201197, -0.7695358, 0.9320425, 1, 0, 0, 1, 1,
2.246307, 2.364121, 1.368818, 0, 0, 0, 1, 1,
2.250845, 0.3629809, 0.7077373, 0, 0, 0, 1, 1,
2.264894, 0.2629774, 2.621952, 0, 0, 0, 1, 1,
2.274602, -0.2694395, 1.775666, 0, 0, 0, 1, 1,
2.318829, 1.260103, 0.5511184, 0, 0, 0, 1, 1,
2.3646, 1.822778, 2.183774, 0, 0, 0, 1, 1,
2.369618, -1.061525, 1.491014, 0, 0, 0, 1, 1,
2.385843, 0.974004, 0.9057565, 1, 1, 1, 1, 1,
2.433584, 0.8778929, 0.3919373, 1, 1, 1, 1, 1,
2.507007, 0.3181054, 1.250689, 1, 1, 1, 1, 1,
2.517908, 1.5697, 0.6609604, 1, 1, 1, 1, 1,
2.536605, -0.8228423, 2.295357, 1, 1, 1, 1, 1,
3.245769, -0.512513, 2.242153, 1, 1, 1, 1, 1,
3.373482, -1.26532, 2.501372, 1, 1, 1, 1, 1
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
var radius = 9.878765;
var distance = 34.69875;
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
mvMatrix.translate( -0.005669117, 0.1985924, -0.3924272 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.69875);
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
