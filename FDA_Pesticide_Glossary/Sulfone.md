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
-3.132985, 2.888847, -1.804696, 1, 0, 0, 1,
-2.86321, -0.6542917, -0.7156469, 1, 0.007843138, 0, 1,
-2.841543, 0.8403068, -2.308546, 1, 0.01176471, 0, 1,
-2.654031, -0.7134024, -2.191711, 1, 0.01960784, 0, 1,
-2.607007, 1.574197, -0.7173107, 1, 0.02352941, 0, 1,
-2.601248, 1.112568, -0.9489032, 1, 0.03137255, 0, 1,
-2.594903, 0.261808, -1.217512, 1, 0.03529412, 0, 1,
-2.59105, 1.890393, -2.12704, 1, 0.04313726, 0, 1,
-2.52984, 1.03531, 0.1194513, 1, 0.04705882, 0, 1,
-2.528778, 0.771971, -1.878801, 1, 0.05490196, 0, 1,
-2.465932, 0.2125215, -2.89552, 1, 0.05882353, 0, 1,
-2.380898, 1.368292, -0.3503022, 1, 0.06666667, 0, 1,
-2.245065, 0.9775304, -1.647646, 1, 0.07058824, 0, 1,
-2.227701, -0.1819795, -1.622607, 1, 0.07843138, 0, 1,
-2.146839, 0.366184, -1.167147, 1, 0.08235294, 0, 1,
-2.144776, -1.46839, -3.671175, 1, 0.09019608, 0, 1,
-2.142163, 1.149495, -0.1953032, 1, 0.09411765, 0, 1,
-2.128307, 1.446895, -0.3233619, 1, 0.1019608, 0, 1,
-2.110989, 0.4914753, -1.299467, 1, 0.1098039, 0, 1,
-2.091089, -0.2343885, -2.039137, 1, 0.1137255, 0, 1,
-2.087466, 0.1350767, -1.02246, 1, 0.1215686, 0, 1,
-2.081429, -2.027524, -3.840756, 1, 0.1254902, 0, 1,
-2.076633, 0.7281597, -1.414061, 1, 0.1333333, 0, 1,
-2.065216, 1.766099, -0.6363313, 1, 0.1372549, 0, 1,
-2.058064, -0.5800026, -0.7139412, 1, 0.145098, 0, 1,
-2.05445, 0.0776929, -3.057855, 1, 0.1490196, 0, 1,
-2.048914, 0.9317219, -1.265694, 1, 0.1568628, 0, 1,
-2.023327, 0.4188973, -0.9812937, 1, 0.1607843, 0, 1,
-2.021468, 0.1811425, -1.999606, 1, 0.1686275, 0, 1,
-2.011869, -0.2611119, -2.823087, 1, 0.172549, 0, 1,
-1.979576, -1.529637, -2.323295, 1, 0.1803922, 0, 1,
-1.959692, 0.516215, -2.365938, 1, 0.1843137, 0, 1,
-1.958494, 0.5758125, -0.4577377, 1, 0.1921569, 0, 1,
-1.956565, -0.9150005, -3.186674, 1, 0.1960784, 0, 1,
-1.955742, -0.348279, -2.422016, 1, 0.2039216, 0, 1,
-1.917757, -1.637962, -0.549119, 1, 0.2117647, 0, 1,
-1.908509, 0.3566538, -2.63983, 1, 0.2156863, 0, 1,
-1.900443, 0.2200521, 1.928449, 1, 0.2235294, 0, 1,
-1.857383, 1.172224, -0.186383, 1, 0.227451, 0, 1,
-1.839851, 1.180401, -1.416886, 1, 0.2352941, 0, 1,
-1.819584, 0.421208, -1.058445, 1, 0.2392157, 0, 1,
-1.818085, -0.293887, -1.636338, 1, 0.2470588, 0, 1,
-1.781896, -0.6234976, -3.512009, 1, 0.2509804, 0, 1,
-1.764095, -0.7071698, -2.740311, 1, 0.2588235, 0, 1,
-1.73803, 1.212465, 0.713926, 1, 0.2627451, 0, 1,
-1.720212, 0.1043038, -1.97183, 1, 0.2705882, 0, 1,
-1.718859, -1.024989, -4.284082, 1, 0.2745098, 0, 1,
-1.707939, -0.5044287, -1.38894, 1, 0.282353, 0, 1,
-1.698975, -0.6812804, -1.288465, 1, 0.2862745, 0, 1,
-1.67724, 0.9378206, -2.000324, 1, 0.2941177, 0, 1,
-1.676513, 1.131367, -1.326875, 1, 0.3019608, 0, 1,
-1.674202, -0.9946721, -2.779584, 1, 0.3058824, 0, 1,
-1.651136, 1.185457, -2.079062, 1, 0.3137255, 0, 1,
-1.638949, 0.3190137, -2.038416, 1, 0.3176471, 0, 1,
-1.63267, 1.663514, 1.4228, 1, 0.3254902, 0, 1,
-1.631029, -1.180952, -1.680852, 1, 0.3294118, 0, 1,
-1.626327, -1.048593, -3.621371, 1, 0.3372549, 0, 1,
-1.6248, 0.8648575, -0.3529331, 1, 0.3411765, 0, 1,
-1.614853, -1.134655, -2.570602, 1, 0.3490196, 0, 1,
-1.613235, -0.09659372, -0.4944962, 1, 0.3529412, 0, 1,
-1.602367, -1.697111, -4.045536, 1, 0.3607843, 0, 1,
-1.599663, 0.1496666, -0.3056453, 1, 0.3647059, 0, 1,
-1.596308, 0.09080818, -0.7267154, 1, 0.372549, 0, 1,
-1.594965, 0.9997958, -0.2610818, 1, 0.3764706, 0, 1,
-1.587063, 0.1334307, -2.001033, 1, 0.3843137, 0, 1,
-1.564848, 0.7213586, -2.274443, 1, 0.3882353, 0, 1,
-1.555753, 0.2650288, -2.381964, 1, 0.3960784, 0, 1,
-1.551508, 0.6359379, -2.067314, 1, 0.4039216, 0, 1,
-1.544945, 1.866043, -0.6969497, 1, 0.4078431, 0, 1,
-1.528009, -0.0279364, 0.4284806, 1, 0.4156863, 0, 1,
-1.523082, 0.3520449, -1.518225, 1, 0.4196078, 0, 1,
-1.508554, -0.1637272, -2.236648, 1, 0.427451, 0, 1,
-1.498272, -0.2136049, -1.373808, 1, 0.4313726, 0, 1,
-1.488026, 2.869237, -0.5474813, 1, 0.4392157, 0, 1,
-1.485202, 0.4643854, -2.796879, 1, 0.4431373, 0, 1,
-1.467938, 1.971627, -0.2124615, 1, 0.4509804, 0, 1,
-1.461759, 1.466498, -1.66124, 1, 0.454902, 0, 1,
-1.454404, 1.971844, -0.7782184, 1, 0.4627451, 0, 1,
-1.450117, -0.611276, -1.121216, 1, 0.4666667, 0, 1,
-1.431685, -0.09723509, -0.6645814, 1, 0.4745098, 0, 1,
-1.42654, -0.9429889, -1.227901, 1, 0.4784314, 0, 1,
-1.425603, 1.32937, -2.635038, 1, 0.4862745, 0, 1,
-1.420129, 0.7080435, 0.5063523, 1, 0.4901961, 0, 1,
-1.416036, -0.4731692, -1.295232, 1, 0.4980392, 0, 1,
-1.410517, -0.472209, -0.7553415, 1, 0.5058824, 0, 1,
-1.408231, -0.6445585, -3.319412, 1, 0.509804, 0, 1,
-1.407234, -0.08548663, -2.754557, 1, 0.5176471, 0, 1,
-1.392516, -2.653528, -3.628669, 1, 0.5215687, 0, 1,
-1.378141, -1.275299, -2.855844, 1, 0.5294118, 0, 1,
-1.373213, -0.6871309, -1.936511, 1, 0.5333334, 0, 1,
-1.363884, 1.714121, -0.7358378, 1, 0.5411765, 0, 1,
-1.351851, -1.447485, -1.656235, 1, 0.5450981, 0, 1,
-1.344348, 0.6799685, -1.549398, 1, 0.5529412, 0, 1,
-1.340701, -0.2179787, -1.379543, 1, 0.5568628, 0, 1,
-1.322635, 0.7177411, -2.724786, 1, 0.5647059, 0, 1,
-1.319173, 2.202579, -0.939561, 1, 0.5686275, 0, 1,
-1.317703, 0.137322, -0.370169, 1, 0.5764706, 0, 1,
-1.307255, 1.297921, -0.1048503, 1, 0.5803922, 0, 1,
-1.299007, -1.198035, -0.1156305, 1, 0.5882353, 0, 1,
-1.297282, -0.5343196, -1.059407, 1, 0.5921569, 0, 1,
-1.296216, 0.8816172, -0.2562391, 1, 0.6, 0, 1,
-1.290204, -0.2625116, -2.555536, 1, 0.6078432, 0, 1,
-1.286224, 1.530306, -0.6187448, 1, 0.6117647, 0, 1,
-1.268907, -0.7022281, -3.02221, 1, 0.6196079, 0, 1,
-1.26692, 0.4007886, -3.020583, 1, 0.6235294, 0, 1,
-1.253298, 0.1016396, -2.258104, 1, 0.6313726, 0, 1,
-1.233111, 1.114639, 0.5261537, 1, 0.6352941, 0, 1,
-1.217681, -0.08525643, -1.189649, 1, 0.6431373, 0, 1,
-1.209634, 1.585872, 0.3523808, 1, 0.6470588, 0, 1,
-1.208564, 0.582259, -2.610689, 1, 0.654902, 0, 1,
-1.195445, -0.3828914, -1.804014, 1, 0.6588235, 0, 1,
-1.192289, 1.004817, -0.4432358, 1, 0.6666667, 0, 1,
-1.187879, -0.1731924, -1.456741, 1, 0.6705883, 0, 1,
-1.184005, -1.50434, -1.934435, 1, 0.6784314, 0, 1,
-1.182891, 0.2411385, -0.06168618, 1, 0.682353, 0, 1,
-1.176121, -0.3162421, -2.398009, 1, 0.6901961, 0, 1,
-1.168066, -0.07860616, -1.544363, 1, 0.6941177, 0, 1,
-1.165226, 0.9961275, -1.176761, 1, 0.7019608, 0, 1,
-1.147643, -0.7687845, -2.122355, 1, 0.7098039, 0, 1,
-1.139301, 0.06658053, -1.164653, 1, 0.7137255, 0, 1,
-1.131765, -1.341971, -2.142588, 1, 0.7215686, 0, 1,
-1.127897, 1.83179, -2.142298, 1, 0.7254902, 0, 1,
-1.127378, 0.8507516, -0.8877124, 1, 0.7333333, 0, 1,
-1.123355, 1.310466, -1.182899, 1, 0.7372549, 0, 1,
-1.123331, 1.121071, -1.159523, 1, 0.7450981, 0, 1,
-1.121681, 0.7692166, -1.271188, 1, 0.7490196, 0, 1,
-1.11708, 1.593735, -0.7291267, 1, 0.7568628, 0, 1,
-1.114622, -0.01917263, -2.003894, 1, 0.7607843, 0, 1,
-1.114196, -0.506287, -1.093986, 1, 0.7686275, 0, 1,
-1.110214, -2.042299, -3.058266, 1, 0.772549, 0, 1,
-1.105428, 0.2534548, -0.02457716, 1, 0.7803922, 0, 1,
-1.095742, 0.252475, -0.962456, 1, 0.7843137, 0, 1,
-1.095072, -0.5433066, -4.325485, 1, 0.7921569, 0, 1,
-1.090706, -0.05970452, -0.3985881, 1, 0.7960784, 0, 1,
-1.087145, -1.843171, -0.9577245, 1, 0.8039216, 0, 1,
-1.080179, -2.134955, -2.974192, 1, 0.8117647, 0, 1,
-1.079343, 1.462207, -2.080934, 1, 0.8156863, 0, 1,
-1.077738, 1.667163, 0.1266011, 1, 0.8235294, 0, 1,
-1.077484, 0.973635, -2.668401, 1, 0.827451, 0, 1,
-1.076647, 0.6112319, 0.06569014, 1, 0.8352941, 0, 1,
-1.06901, -1.507627, -3.797931, 1, 0.8392157, 0, 1,
-1.068621, 0.1585538, -0.696434, 1, 0.8470588, 0, 1,
-1.067084, -1.003406, -1.226549, 1, 0.8509804, 0, 1,
-1.061107, 0.9792636, -0.7751721, 1, 0.8588235, 0, 1,
-1.058698, -1.474301, -2.753303, 1, 0.8627451, 0, 1,
-1.057568, -0.06866976, -1.491308, 1, 0.8705882, 0, 1,
-1.055923, -0.6858355, -2.541728, 1, 0.8745098, 0, 1,
-1.052078, -0.4088605, -2.788479, 1, 0.8823529, 0, 1,
-1.048493, 0.2888792, -1.339966, 1, 0.8862745, 0, 1,
-1.04826, 0.1374185, -1.308701, 1, 0.8941177, 0, 1,
-1.046594, -0.07075597, -2.909739, 1, 0.8980392, 0, 1,
-1.036434, 0.628454, -1.478089, 1, 0.9058824, 0, 1,
-1.035284, 0.6752327, -1.934198, 1, 0.9137255, 0, 1,
-1.02875, -0.9513081, -3.401395, 1, 0.9176471, 0, 1,
-1.014538, -0.2550842, -3.274482, 1, 0.9254902, 0, 1,
-1.005924, 0.5594038, 0.5654213, 1, 0.9294118, 0, 1,
-1.002677, -0.4410813, -1.690382, 1, 0.9372549, 0, 1,
-0.999845, 1.914031, 0.5742454, 1, 0.9411765, 0, 1,
-0.9950222, 0.4937422, -0.128884, 1, 0.9490196, 0, 1,
-0.9938627, -1.6916, -1.467373, 1, 0.9529412, 0, 1,
-0.9892883, -0.2843924, -2.323167, 1, 0.9607843, 0, 1,
-0.9887294, -0.2831873, -2.500404, 1, 0.9647059, 0, 1,
-0.9880941, -0.3637526, -2.236696, 1, 0.972549, 0, 1,
-0.9819666, 0.3541096, -0.4257967, 1, 0.9764706, 0, 1,
-0.9783171, -0.3465747, -1.841586, 1, 0.9843137, 0, 1,
-0.9719899, -0.5161624, -2.148999, 1, 0.9882353, 0, 1,
-0.9689132, 0.394528, -0.6808568, 1, 0.9960784, 0, 1,
-0.9647635, 0.1830939, -0.888317, 0.9960784, 1, 0, 1,
-0.9554424, 1.035228, 0.8543911, 0.9921569, 1, 0, 1,
-0.9426744, 0.2889903, -1.103923, 0.9843137, 1, 0, 1,
-0.9238115, 0.8794796, 0.09468542, 0.9803922, 1, 0, 1,
-0.9198628, 0.2064453, -1.706014, 0.972549, 1, 0, 1,
-0.9107422, 0.3711767, -2.661483, 0.9686275, 1, 0, 1,
-0.9069884, -0.963958, -0.5210972, 0.9607843, 1, 0, 1,
-0.9026046, -1.154424, -2.681303, 0.9568627, 1, 0, 1,
-0.9014075, 0.6075806, -0.5991715, 0.9490196, 1, 0, 1,
-0.8911301, 0.8584135, -0.04602809, 0.945098, 1, 0, 1,
-0.888272, -0.637592, -4.028635, 0.9372549, 1, 0, 1,
-0.8792084, 0.1379952, -0.2155783, 0.9333333, 1, 0, 1,
-0.8769035, 0.555212, 0.2729719, 0.9254902, 1, 0, 1,
-0.8751537, 0.6281567, -1.42224, 0.9215686, 1, 0, 1,
-0.8744336, 0.779665, -2.651671, 0.9137255, 1, 0, 1,
-0.8736918, -0.1159036, -2.029866, 0.9098039, 1, 0, 1,
-0.8731452, -0.1221506, -1.781413, 0.9019608, 1, 0, 1,
-0.8667892, -1.513122, -2.441483, 0.8941177, 1, 0, 1,
-0.8638198, 1.035486, -0.1989822, 0.8901961, 1, 0, 1,
-0.8611684, -0.1845009, -2.804922, 0.8823529, 1, 0, 1,
-0.8611357, -0.8277114, -2.35275, 0.8784314, 1, 0, 1,
-0.8561334, 0.166732, -3.785959, 0.8705882, 1, 0, 1,
-0.8557767, -0.3631334, -2.154032, 0.8666667, 1, 0, 1,
-0.8551575, 1.025514, -0.1661044, 0.8588235, 1, 0, 1,
-0.8464099, -0.3116884, -0.5153365, 0.854902, 1, 0, 1,
-0.8427792, -0.9573731, -2.86584, 0.8470588, 1, 0, 1,
-0.8401187, -0.1738069, -2.263877, 0.8431373, 1, 0, 1,
-0.8357594, -0.8147321, -2.348019, 0.8352941, 1, 0, 1,
-0.8328434, 0.6005767, -0.2185228, 0.8313726, 1, 0, 1,
-0.8314592, 0.7554771, -2.008767, 0.8235294, 1, 0, 1,
-0.8243154, -0.6361133, -3.478324, 0.8196079, 1, 0, 1,
-0.8161939, -1.278014, -2.702089, 0.8117647, 1, 0, 1,
-0.8152181, -1.369987, -1.519562, 0.8078431, 1, 0, 1,
-0.8139901, 0.03204151, -0.9051385, 0.8, 1, 0, 1,
-0.8133, 0.05630068, -2.804631, 0.7921569, 1, 0, 1,
-0.8113812, -0.2967927, -1.546651, 0.7882353, 1, 0, 1,
-0.8074259, -0.6364415, -2.104913, 0.7803922, 1, 0, 1,
-0.8054102, -0.3914489, -1.361708, 0.7764706, 1, 0, 1,
-0.7908501, -2.895119, -3.885567, 0.7686275, 1, 0, 1,
-0.7841573, -0.2458103, -1.868099, 0.7647059, 1, 0, 1,
-0.7840487, -1.029524, -1.600761, 0.7568628, 1, 0, 1,
-0.7828857, -0.6310763, -3.319547, 0.7529412, 1, 0, 1,
-0.7814324, 1.26548, -0.6609101, 0.7450981, 1, 0, 1,
-0.7803096, -1.102036, -2.409867, 0.7411765, 1, 0, 1,
-0.778129, -0.6783216, -2.806901, 0.7333333, 1, 0, 1,
-0.7776578, -0.4052626, -1.002829, 0.7294118, 1, 0, 1,
-0.7757965, -1.17458, -2.455489, 0.7215686, 1, 0, 1,
-0.7735536, -0.2037816, -1.205086, 0.7176471, 1, 0, 1,
-0.773115, 0.6491613, -0.4504994, 0.7098039, 1, 0, 1,
-0.7695296, 1.598866, -1.632178, 0.7058824, 1, 0, 1,
-0.7668399, -1.90626, -1.803384, 0.6980392, 1, 0, 1,
-0.7595417, 1.01725, 0.09811875, 0.6901961, 1, 0, 1,
-0.755656, 1.41112, -0.8176082, 0.6862745, 1, 0, 1,
-0.7550426, 0.7202584, -0.1849008, 0.6784314, 1, 0, 1,
-0.7517135, 1.290317, -0.8764985, 0.6745098, 1, 0, 1,
-0.7503782, -0.5828397, -3.809968, 0.6666667, 1, 0, 1,
-0.7502255, -0.1069598, -1.002705, 0.6627451, 1, 0, 1,
-0.7429149, -0.643636, -3.561929, 0.654902, 1, 0, 1,
-0.7411141, 0.1326039, -1.778139, 0.6509804, 1, 0, 1,
-0.7404787, -0.7390534, -5.104893, 0.6431373, 1, 0, 1,
-0.7348254, 0.3283126, 0.003755576, 0.6392157, 1, 0, 1,
-0.7344574, -0.303622, -1.00878, 0.6313726, 1, 0, 1,
-0.7335389, 2.24157, -0.3453208, 0.627451, 1, 0, 1,
-0.7312715, 1.91062, -0.942223, 0.6196079, 1, 0, 1,
-0.7297932, 0.7060643, 0.4018499, 0.6156863, 1, 0, 1,
-0.7272077, -1.077122, -2.71659, 0.6078432, 1, 0, 1,
-0.7270331, 0.4019699, -0.6003939, 0.6039216, 1, 0, 1,
-0.7170622, -1.238033, -2.068197, 0.5960785, 1, 0, 1,
-0.714958, -0.008823834, -0.5735582, 0.5882353, 1, 0, 1,
-0.7148013, 0.9042493, 1.206964, 0.5843138, 1, 0, 1,
-0.7133605, 0.4474347, -0.64858, 0.5764706, 1, 0, 1,
-0.7106866, -0.4204462, -3.836214, 0.572549, 1, 0, 1,
-0.7105135, 0.8475261, 1.772704, 0.5647059, 1, 0, 1,
-0.7048119, 0.6817041, -0.2437035, 0.5607843, 1, 0, 1,
-0.6986408, 0.4762842, -1.706642, 0.5529412, 1, 0, 1,
-0.6951312, 1.809426, -1.434091, 0.5490196, 1, 0, 1,
-0.6948187, 0.4107722, 0.02910699, 0.5411765, 1, 0, 1,
-0.6947668, 0.472777, -2.287875, 0.5372549, 1, 0, 1,
-0.6904762, -0.2098233, -0.1524415, 0.5294118, 1, 0, 1,
-0.6842899, 0.4032374, -1.199592, 0.5254902, 1, 0, 1,
-0.6808107, -0.5161515, -2.087436, 0.5176471, 1, 0, 1,
-0.678898, -0.2983122, -3.308794, 0.5137255, 1, 0, 1,
-0.6758803, -0.9091617, -4.287559, 0.5058824, 1, 0, 1,
-0.6725821, 0.6024137, -0.6749678, 0.5019608, 1, 0, 1,
-0.66562, 0.6885694, 1.381868, 0.4941176, 1, 0, 1,
-0.6584191, 0.2290698, -1.951113, 0.4862745, 1, 0, 1,
-0.6536567, 0.1369584, -0.1627205, 0.4823529, 1, 0, 1,
-0.6494061, -0.4788013, -3.713178, 0.4745098, 1, 0, 1,
-0.6455347, -1.021805, -3.629849, 0.4705882, 1, 0, 1,
-0.6450917, -0.3709294, -2.44607, 0.4627451, 1, 0, 1,
-0.6429054, -0.1953948, -1.111468, 0.4588235, 1, 0, 1,
-0.6398174, 2.287849, -2.851024, 0.4509804, 1, 0, 1,
-0.6374775, -0.7799834, -1.110464, 0.4470588, 1, 0, 1,
-0.6322082, -0.9308032, -1.183316, 0.4392157, 1, 0, 1,
-0.6298335, -0.7617162, -2.585516, 0.4352941, 1, 0, 1,
-0.6239105, 1.258695, -0.2550819, 0.427451, 1, 0, 1,
-0.6209586, -0.2460161, -3.339798, 0.4235294, 1, 0, 1,
-0.6173135, 0.4274584, -0.4885381, 0.4156863, 1, 0, 1,
-0.6155578, -0.06309282, -1.181346, 0.4117647, 1, 0, 1,
-0.6136395, -0.8925676, -1.35136, 0.4039216, 1, 0, 1,
-0.6136182, -1.27169, -4.021998, 0.3960784, 1, 0, 1,
-0.6116977, 0.04004778, -0.5892711, 0.3921569, 1, 0, 1,
-0.6112745, 0.4050773, -1.364259, 0.3843137, 1, 0, 1,
-0.6081183, -0.4556346, -1.763409, 0.3803922, 1, 0, 1,
-0.6016626, -0.09332313, -2.750278, 0.372549, 1, 0, 1,
-0.5963935, -0.8739405, -3.149016, 0.3686275, 1, 0, 1,
-0.5907627, 0.709087, -0.9196792, 0.3607843, 1, 0, 1,
-0.5903806, 0.2929717, -0.9586716, 0.3568628, 1, 0, 1,
-0.586571, -0.2165658, -1.258094, 0.3490196, 1, 0, 1,
-0.5807601, 0.5554962, 0.8295341, 0.345098, 1, 0, 1,
-0.5767041, -1.427823, -4.064931, 0.3372549, 1, 0, 1,
-0.5759103, 0.6416671, -0.8347717, 0.3333333, 1, 0, 1,
-0.5744926, 0.03958085, -1.488651, 0.3254902, 1, 0, 1,
-0.5692139, 2.12654, 0.7086302, 0.3215686, 1, 0, 1,
-0.564561, 1.323632, -0.4574901, 0.3137255, 1, 0, 1,
-0.5576802, 0.1520833, -0.4661235, 0.3098039, 1, 0, 1,
-0.5538006, 0.4248938, -1.893221, 0.3019608, 1, 0, 1,
-0.5495935, 3.004933, -0.50571, 0.2941177, 1, 0, 1,
-0.5374404, -2.48656, -4.674901, 0.2901961, 1, 0, 1,
-0.5372116, -0.2472984, -2.441987, 0.282353, 1, 0, 1,
-0.5330054, 0.7034736, -1.852917, 0.2784314, 1, 0, 1,
-0.5317255, 1.340049, 0.7141047, 0.2705882, 1, 0, 1,
-0.5257103, 0.3004999, -0.2596902, 0.2666667, 1, 0, 1,
-0.5190529, 0.2294517, -1.806237, 0.2588235, 1, 0, 1,
-0.5152064, -0.9418169, -2.869012, 0.254902, 1, 0, 1,
-0.5139791, -0.8240235, -2.990743, 0.2470588, 1, 0, 1,
-0.5136654, 0.7253709, -0.8736908, 0.2431373, 1, 0, 1,
-0.5131924, 1.359252, 0.9832689, 0.2352941, 1, 0, 1,
-0.5097038, -0.7928365, -3.430275, 0.2313726, 1, 0, 1,
-0.5090797, -0.9964299, -3.806994, 0.2235294, 1, 0, 1,
-0.5045587, -1.905407, -1.689476, 0.2196078, 1, 0, 1,
-0.5030109, -0.6571325, 0.47258, 0.2117647, 1, 0, 1,
-0.5022212, 0.5519065, -2.846334, 0.2078431, 1, 0, 1,
-0.4992995, -0.2634375, -1.946522, 0.2, 1, 0, 1,
-0.4992891, 1.004892, -0.7827073, 0.1921569, 1, 0, 1,
-0.4990633, 0.3856714, -1.243107, 0.1882353, 1, 0, 1,
-0.4962188, 1.659992, -0.6252752, 0.1803922, 1, 0, 1,
-0.4937469, -0.6749288, -3.463582, 0.1764706, 1, 0, 1,
-0.4893635, 0.8536021, -0.8928303, 0.1686275, 1, 0, 1,
-0.4871675, -0.1709801, -1.636585, 0.1647059, 1, 0, 1,
-0.4859735, -1.375239, -3.709001, 0.1568628, 1, 0, 1,
-0.485405, 0.3263875, -0.7056212, 0.1529412, 1, 0, 1,
-0.4828964, -0.2015646, -1.955903, 0.145098, 1, 0, 1,
-0.4814787, -0.7716361, -3.106239, 0.1411765, 1, 0, 1,
-0.4801756, -1.11499, -1.960831, 0.1333333, 1, 0, 1,
-0.4779395, -1.112622, -2.059269, 0.1294118, 1, 0, 1,
-0.4758688, -0.3319842, -3.750113, 0.1215686, 1, 0, 1,
-0.4746001, 1.753663, 0.1603578, 0.1176471, 1, 0, 1,
-0.4699391, -0.4078448, -1.159002, 0.1098039, 1, 0, 1,
-0.467474, 1.189032, -1.825335, 0.1058824, 1, 0, 1,
-0.464267, 0.1535773, -0.3673809, 0.09803922, 1, 0, 1,
-0.4579853, -0.6042264, -1.506269, 0.09019608, 1, 0, 1,
-0.456666, 1.778922, -0.6540644, 0.08627451, 1, 0, 1,
-0.4512735, -0.2382642, -3.099545, 0.07843138, 1, 0, 1,
-0.4486585, 0.3338281, 0.2056504, 0.07450981, 1, 0, 1,
-0.4427527, -0.3814407, -3.438586, 0.06666667, 1, 0, 1,
-0.441611, -0.06752297, -2.935906, 0.0627451, 1, 0, 1,
-0.4390205, -0.6562757, -1.377389, 0.05490196, 1, 0, 1,
-0.4365836, -0.2069214, -1.91054, 0.05098039, 1, 0, 1,
-0.4318289, -0.640409, -3.034538, 0.04313726, 1, 0, 1,
-0.4304115, 0.7033093, -1.167169, 0.03921569, 1, 0, 1,
-0.4271595, -1.169337, -4.091674, 0.03137255, 1, 0, 1,
-0.426232, -0.7288057, -3.292423, 0.02745098, 1, 0, 1,
-0.4216154, 0.2501276, 0.330086, 0.01960784, 1, 0, 1,
-0.4212998, -0.9237969, -1.520413, 0.01568628, 1, 0, 1,
-0.4192885, -0.6060327, -2.558549, 0.007843138, 1, 0, 1,
-0.4145236, 1.047463, -0.3072784, 0.003921569, 1, 0, 1,
-0.4110423, -0.1242488, -2.843961, 0, 1, 0.003921569, 1,
-0.4092343, -0.5544825, -2.641061, 0, 1, 0.01176471, 1,
-0.4087079, 0.8220016, 1.389159, 0, 1, 0.01568628, 1,
-0.4036283, -0.604925, -2.534673, 0, 1, 0.02352941, 1,
-0.4027707, -1.435363, -2.876316, 0, 1, 0.02745098, 1,
-0.4009878, -1.26222, -1.478485, 0, 1, 0.03529412, 1,
-0.4005472, 0.2022566, -0.7929052, 0, 1, 0.03921569, 1,
-0.391658, 1.313711, 0.833662, 0, 1, 0.04705882, 1,
-0.3916377, -2.018175, -1.916113, 0, 1, 0.05098039, 1,
-0.3900872, 0.9201862, -2.486391, 0, 1, 0.05882353, 1,
-0.3862096, 0.7670351, 0.5760078, 0, 1, 0.0627451, 1,
-0.3857016, 1.026384, -0.02456917, 0, 1, 0.07058824, 1,
-0.3834059, -0.786571, -3.728936, 0, 1, 0.07450981, 1,
-0.3813004, 1.280312, -0.0406829, 0, 1, 0.08235294, 1,
-0.3731502, -1.613196, -2.869245, 0, 1, 0.08627451, 1,
-0.3710202, 1.414724, -0.1352895, 0, 1, 0.09411765, 1,
-0.3700134, 2.489073, -2.248564, 0, 1, 0.1019608, 1,
-0.3661549, 2.339185, 1.1436, 0, 1, 0.1058824, 1,
-0.3648221, -0.2585772, -3.75199, 0, 1, 0.1137255, 1,
-0.3592419, -0.02975797, -1.742633, 0, 1, 0.1176471, 1,
-0.3572751, 0.8052331, -1.190226, 0, 1, 0.1254902, 1,
-0.354551, 2.889408, 0.095103, 0, 1, 0.1294118, 1,
-0.3520975, 0.8203197, -0.5794719, 0, 1, 0.1372549, 1,
-0.348345, -0.781301, -1.758502, 0, 1, 0.1411765, 1,
-0.3422779, -1.924619, -3.789213, 0, 1, 0.1490196, 1,
-0.3409206, 1.523521, -0.9865354, 0, 1, 0.1529412, 1,
-0.3406734, 1.973075, -0.5859203, 0, 1, 0.1607843, 1,
-0.3383883, -2.311971, -2.630607, 0, 1, 0.1647059, 1,
-0.3382458, 2.639996, -0.02326059, 0, 1, 0.172549, 1,
-0.3333801, 0.509273, -2.090691, 0, 1, 0.1764706, 1,
-0.3310848, -0.5391601, -2.121736, 0, 1, 0.1843137, 1,
-0.3271255, 0.4911039, -1.102358, 0, 1, 0.1882353, 1,
-0.3250779, -0.1512784, -3.043398, 0, 1, 0.1960784, 1,
-0.3215592, 0.6613508, 0.9211996, 0, 1, 0.2039216, 1,
-0.3215221, -0.7913492, -2.005339, 0, 1, 0.2078431, 1,
-0.317148, 0.7524704, -1.283997, 0, 1, 0.2156863, 1,
-0.306565, 1.596628, -0.4484021, 0, 1, 0.2196078, 1,
-0.3058138, 0.5885463, -1.322376, 0, 1, 0.227451, 1,
-0.304792, -0.2151951, -1.07041, 0, 1, 0.2313726, 1,
-0.2958456, -0.1154768, -3.449233, 0, 1, 0.2392157, 1,
-0.2924936, -0.4935999, -3.903471, 0, 1, 0.2431373, 1,
-0.291617, -1.022398, -5.394865, 0, 1, 0.2509804, 1,
-0.2896281, 0.3437315, -1.191386, 0, 1, 0.254902, 1,
-0.2895735, 0.5953359, 0.03955009, 0, 1, 0.2627451, 1,
-0.2888234, -0.3209858, -3.709367, 0, 1, 0.2666667, 1,
-0.2864009, -0.9243879, -2.94738, 0, 1, 0.2745098, 1,
-0.2676868, -0.5706158, -2.305763, 0, 1, 0.2784314, 1,
-0.2613107, -0.484127, -2.314389, 0, 1, 0.2862745, 1,
-0.2591847, 1.090725, 0.1425459, 0, 1, 0.2901961, 1,
-0.2588996, 0.133521, -2.292359, 0, 1, 0.2980392, 1,
-0.2553726, -1.110074, -3.521202, 0, 1, 0.3058824, 1,
-0.2544078, -0.3998096, -3.593748, 0, 1, 0.3098039, 1,
-0.2532567, 0.4740074, -1.757123, 0, 1, 0.3176471, 1,
-0.2529996, -0.2040622, -1.801084, 0, 1, 0.3215686, 1,
-0.2497854, -0.8836067, -2.40235, 0, 1, 0.3294118, 1,
-0.249378, -0.3683856, -2.527275, 0, 1, 0.3333333, 1,
-0.2489833, -0.5395198, -3.03439, 0, 1, 0.3411765, 1,
-0.2471575, 1.186248, 0.2064754, 0, 1, 0.345098, 1,
-0.2461196, 0.6751148, 1.601094, 0, 1, 0.3529412, 1,
-0.240058, 0.4269084, 0.6021426, 0, 1, 0.3568628, 1,
-0.2392301, 0.1918465, -0.9558309, 0, 1, 0.3647059, 1,
-0.2384292, 0.9213805, 0.4007327, 0, 1, 0.3686275, 1,
-0.2330127, -0.5431, -2.273134, 0, 1, 0.3764706, 1,
-0.2326465, 0.7806956, -0.9867237, 0, 1, 0.3803922, 1,
-0.2316865, 0.4342158, -0.06775449, 0, 1, 0.3882353, 1,
-0.2204625, -0.3554154, -3.695696, 0, 1, 0.3921569, 1,
-0.2190062, -0.5009851, -3.080001, 0, 1, 0.4, 1,
-0.2141421, -1.104302, -3.72095, 0, 1, 0.4078431, 1,
-0.2140613, -1.892055, -0.2582487, 0, 1, 0.4117647, 1,
-0.2121492, 0.9091178, 0.5519752, 0, 1, 0.4196078, 1,
-0.2060135, 0.5334402, -0.9896048, 0, 1, 0.4235294, 1,
-0.2041586, 0.3832506, 0.02546813, 0, 1, 0.4313726, 1,
-0.2008705, 1.703025, -1.904627, 0, 1, 0.4352941, 1,
-0.1998261, 2.171267, 0.4565528, 0, 1, 0.4431373, 1,
-0.198638, -0.8837089, -4.945257, 0, 1, 0.4470588, 1,
-0.1975084, -0.7874934, -3.477581, 0, 1, 0.454902, 1,
-0.19491, -1.712595, -2.022919, 0, 1, 0.4588235, 1,
-0.1942196, 1.388977, 0.138362, 0, 1, 0.4666667, 1,
-0.193664, 2.355027, -0.5735682, 0, 1, 0.4705882, 1,
-0.1905229, 0.3883426, -0.4103062, 0, 1, 0.4784314, 1,
-0.1898814, 0.9923989, -0.4409413, 0, 1, 0.4823529, 1,
-0.1880918, -0.6586367, -4.443439, 0, 1, 0.4901961, 1,
-0.1877899, 0.6232637, -0.2610938, 0, 1, 0.4941176, 1,
-0.1761488, 0.1558643, -0.1398816, 0, 1, 0.5019608, 1,
-0.1717816, 0.6350435, -1.450521, 0, 1, 0.509804, 1,
-0.1709667, -0.8018082, -1.670414, 0, 1, 0.5137255, 1,
-0.1707795, 1.339887, 1.350133, 0, 1, 0.5215687, 1,
-0.1659428, -0.5637025, -1.25974, 0, 1, 0.5254902, 1,
-0.1650682, 2.011761, -0.4058264, 0, 1, 0.5333334, 1,
-0.1638793, 0.8046134, -0.6902589, 0, 1, 0.5372549, 1,
-0.1516432, 0.8657298, -1.127505, 0, 1, 0.5450981, 1,
-0.1462, 1.259652, -0.4033797, 0, 1, 0.5490196, 1,
-0.1459648, 0.5625782, -0.7611886, 0, 1, 0.5568628, 1,
-0.1446573, -1.101986, -3.47353, 0, 1, 0.5607843, 1,
-0.1409244, 1.02418, -1.614353, 0, 1, 0.5686275, 1,
-0.1369718, -0.1332173, -2.295519, 0, 1, 0.572549, 1,
-0.1348348, -0.5597406, -3.324361, 0, 1, 0.5803922, 1,
-0.1305734, 1.185101, -0.7006826, 0, 1, 0.5843138, 1,
-0.130553, -0.007617194, -0.7810965, 0, 1, 0.5921569, 1,
-0.1289089, 1.549353, 0.3309516, 0, 1, 0.5960785, 1,
-0.1258852, -0.190992, -2.228971, 0, 1, 0.6039216, 1,
-0.1119466, -0.9662353, -1.883076, 0, 1, 0.6117647, 1,
-0.1107207, 0.2933806, -1.323252, 0, 1, 0.6156863, 1,
-0.1105424, -0.2785733, -3.167221, 0, 1, 0.6235294, 1,
-0.1064697, 0.1082003, 0.2984113, 0, 1, 0.627451, 1,
-0.1019779, 0.922627, -0.6932861, 0, 1, 0.6352941, 1,
-0.1017339, -1.393067, -2.450731, 0, 1, 0.6392157, 1,
-0.09226798, -0.8168476, -2.296201, 0, 1, 0.6470588, 1,
-0.09149719, 0.9883449, -1.046819, 0, 1, 0.6509804, 1,
-0.08490373, 0.8133073, 0.5219263, 0, 1, 0.6588235, 1,
-0.07627354, 1.069901, 0.6138309, 0, 1, 0.6627451, 1,
-0.07082833, -0.1863111, -1.820821, 0, 1, 0.6705883, 1,
-0.06982259, 2.2719, 0.8236318, 0, 1, 0.6745098, 1,
-0.06965644, -0.4419175, -3.053448, 0, 1, 0.682353, 1,
-0.0688142, 0.8200228, 0.8014006, 0, 1, 0.6862745, 1,
-0.06829935, -0.05852868, -3.585228, 0, 1, 0.6941177, 1,
-0.06727852, -0.7587233, -4.323001, 0, 1, 0.7019608, 1,
-0.06646496, 0.002571315, -2.693868, 0, 1, 0.7058824, 1,
-0.06580357, -0.1583036, -2.788266, 0, 1, 0.7137255, 1,
-0.06426997, 1.646287, 0.3184794, 0, 1, 0.7176471, 1,
-0.06347568, -1.267318, -3.772334, 0, 1, 0.7254902, 1,
-0.06229014, 0.1815343, 0.00374545, 0, 1, 0.7294118, 1,
-0.06135889, 1.506035, 0.0295443, 0, 1, 0.7372549, 1,
-0.05913277, -0.2462319, -1.102492, 0, 1, 0.7411765, 1,
-0.05698539, -0.8689829, -3.267839, 0, 1, 0.7490196, 1,
-0.05565243, -0.531837, -1.577151, 0, 1, 0.7529412, 1,
-0.0536717, 0.9839124, -0.8386512, 0, 1, 0.7607843, 1,
-0.05311516, 1.101556, -0.5983119, 0, 1, 0.7647059, 1,
-0.05100745, -1.26824, -3.64997, 0, 1, 0.772549, 1,
-0.04916523, -0.545682, -2.26652, 0, 1, 0.7764706, 1,
-0.04398129, -0.9157453, -3.097507, 0, 1, 0.7843137, 1,
-0.04304194, 0.3544644, 0.5341757, 0, 1, 0.7882353, 1,
-0.03924489, -1.905873, -2.71739, 0, 1, 0.7960784, 1,
-0.03729638, -0.7343805, -3.541284, 0, 1, 0.8039216, 1,
-0.0371456, 0.8256895, -0.4833366, 0, 1, 0.8078431, 1,
-0.03335794, -0.8219485, -4.718625, 0, 1, 0.8156863, 1,
-0.02851614, 0.7088557, 0.04917323, 0, 1, 0.8196079, 1,
-0.02640744, -0.1995312, -1.570001, 0, 1, 0.827451, 1,
-0.02458226, 0.9632595, -0.4493305, 0, 1, 0.8313726, 1,
-0.02330021, 0.2099102, -0.1072935, 0, 1, 0.8392157, 1,
-0.01617963, -1.001742, -3.574562, 0, 1, 0.8431373, 1,
-0.01450003, -0.7349572, -3.930368, 0, 1, 0.8509804, 1,
-0.01424992, -0.866308, -2.53465, 0, 1, 0.854902, 1,
-0.0138671, -0.242546, -4.077744, 0, 1, 0.8627451, 1,
-0.01272578, 1.347259, -1.150779, 0, 1, 0.8666667, 1,
-0.006439673, 1.392547, 0.2081218, 0, 1, 0.8745098, 1,
-0.005962345, 1.439484, 1.714995, 0, 1, 0.8784314, 1,
-0.005718049, -1.006845, -2.643722, 0, 1, 0.8862745, 1,
-0.005609896, 0.1918463, 1.628129, 0, 1, 0.8901961, 1,
-0.001735498, -0.3147424, -3.336672, 0, 1, 0.8980392, 1,
0.004174246, -1.089904, 3.857038, 0, 1, 0.9058824, 1,
0.005616891, 1.425926, 0.4406867, 0, 1, 0.9098039, 1,
0.007142803, 0.4817797, 2.70427, 0, 1, 0.9176471, 1,
0.01495053, -0.6997116, 3.557236, 0, 1, 0.9215686, 1,
0.01829118, -1.801702, 5.389086, 0, 1, 0.9294118, 1,
0.02690505, 0.9157664, 0.1680185, 0, 1, 0.9333333, 1,
0.02898421, -0.01849935, 3.393417, 0, 1, 0.9411765, 1,
0.03280894, 0.3706376, -0.7847858, 0, 1, 0.945098, 1,
0.03447772, 0.4918707, 2.040236, 0, 1, 0.9529412, 1,
0.03904047, -0.8415747, 3.087339, 0, 1, 0.9568627, 1,
0.04030916, 0.8505368, 1.817924, 0, 1, 0.9647059, 1,
0.04172703, 0.9619646, 0.135295, 0, 1, 0.9686275, 1,
0.04354902, -0.7191598, 3.094321, 0, 1, 0.9764706, 1,
0.05159235, -1.543025, 3.113675, 0, 1, 0.9803922, 1,
0.05409087, 0.2746477, 2.102759, 0, 1, 0.9882353, 1,
0.05898958, 1.400203, 2.591659, 0, 1, 0.9921569, 1,
0.06071618, 0.2758873, 1.520867, 0, 1, 1, 1,
0.06259926, 0.4580843, 0.07426258, 0, 0.9921569, 1, 1,
0.06595286, -0.5278742, 2.608629, 0, 0.9882353, 1, 1,
0.06807927, 0.8755475, 0.523424, 0, 0.9803922, 1, 1,
0.06835867, 0.9838036, 0.1618832, 0, 0.9764706, 1, 1,
0.07076224, -0.8763723, 2.943284, 0, 0.9686275, 1, 1,
0.07424048, 0.82792, 0.2374848, 0, 0.9647059, 1, 1,
0.07438544, 1.476088, -0.02085086, 0, 0.9568627, 1, 1,
0.07973487, 1.662913, 0.1239555, 0, 0.9529412, 1, 1,
0.07986456, 0.005413167, 2.10287, 0, 0.945098, 1, 1,
0.08553831, -0.481452, 1.205756, 0, 0.9411765, 1, 1,
0.0864218, 1.683109, -1.440542, 0, 0.9333333, 1, 1,
0.08804021, -1.526507, 2.864955, 0, 0.9294118, 1, 1,
0.09288191, 1.194349, 0.5186982, 0, 0.9215686, 1, 1,
0.09369978, 2.95875, -0.743089, 0, 0.9176471, 1, 1,
0.09942593, 1.244731, 2.010992, 0, 0.9098039, 1, 1,
0.1034604, 2.707667, 0.8345289, 0, 0.9058824, 1, 1,
0.1079142, -0.8195351, 3.331008, 0, 0.8980392, 1, 1,
0.1080396, 0.1871316, -0.4214484, 0, 0.8901961, 1, 1,
0.108205, 0.5206153, 0.1202339, 0, 0.8862745, 1, 1,
0.1105846, -0.5402727, 2.822023, 0, 0.8784314, 1, 1,
0.1110841, 0.9931555, 0.9616062, 0, 0.8745098, 1, 1,
0.1143654, 1.504419, 0.5002198, 0, 0.8666667, 1, 1,
0.1150202, -0.8551695, 3.88273, 0, 0.8627451, 1, 1,
0.1152983, -1.245232, 2.872962, 0, 0.854902, 1, 1,
0.1185838, -0.2169144, 2.83779, 0, 0.8509804, 1, 1,
0.1202354, -0.4345893, 3.521181, 0, 0.8431373, 1, 1,
0.1217163, 0.8964373, 1.086164, 0, 0.8392157, 1, 1,
0.1231252, 0.01084042, 2.897121, 0, 0.8313726, 1, 1,
0.1251043, 1.610643, 0.2970285, 0, 0.827451, 1, 1,
0.1305769, 0.7064934, -1.843823, 0, 0.8196079, 1, 1,
0.1309083, 0.7087932, -0.6235185, 0, 0.8156863, 1, 1,
0.1310879, 0.3807862, 0.1541935, 0, 0.8078431, 1, 1,
0.1336274, 1.125476, 0.9048502, 0, 0.8039216, 1, 1,
0.135832, 1.013793, -0.3428851, 0, 0.7960784, 1, 1,
0.1405984, 0.1454325, 2.14466, 0, 0.7882353, 1, 1,
0.1409634, -0.1722707, 2.046684, 0, 0.7843137, 1, 1,
0.1413919, -1.132373, 3.366607, 0, 0.7764706, 1, 1,
0.1422383, 0.486211, -0.3286178, 0, 0.772549, 1, 1,
0.1424916, -0.2703655, 0.7747114, 0, 0.7647059, 1, 1,
0.1436789, 0.6644722, 0.4419473, 0, 0.7607843, 1, 1,
0.1472968, 0.7584151, 0.5422369, 0, 0.7529412, 1, 1,
0.1473499, 0.320804, 0.9479502, 0, 0.7490196, 1, 1,
0.148583, -0.3004503, 3.339831, 0, 0.7411765, 1, 1,
0.1508689, 0.5971147, 2.039107, 0, 0.7372549, 1, 1,
0.1551579, -0.7677405, 4.528074, 0, 0.7294118, 1, 1,
0.163099, 1.584657, 0.7326149, 0, 0.7254902, 1, 1,
0.1659182, 0.01879114, 2.268758, 0, 0.7176471, 1, 1,
0.1659227, 0.03216665, 0.1964244, 0, 0.7137255, 1, 1,
0.1671004, -2.072602, 3.065406, 0, 0.7058824, 1, 1,
0.1673644, -0.6510127, 1.919132, 0, 0.6980392, 1, 1,
0.1675101, 0.5554467, 0.842678, 0, 0.6941177, 1, 1,
0.1759588, -1.499875, 3.339727, 0, 0.6862745, 1, 1,
0.1805549, -1.306371, 2.303289, 0, 0.682353, 1, 1,
0.1809808, -1.841267, 4.176676, 0, 0.6745098, 1, 1,
0.1818728, 1.486968, -0.601827, 0, 0.6705883, 1, 1,
0.1863902, 0.6858844, 0.05282196, 0, 0.6627451, 1, 1,
0.1880118, -0.5219571, 3.111391, 0, 0.6588235, 1, 1,
0.1910644, 1.294105, 0.2647076, 0, 0.6509804, 1, 1,
0.1928605, 0.5232146, 1.767556, 0, 0.6470588, 1, 1,
0.1972622, -0.336163, 2.313618, 0, 0.6392157, 1, 1,
0.2000045, 1.102957, -0.04097288, 0, 0.6352941, 1, 1,
0.2017843, 0.9924543, -0.007237575, 0, 0.627451, 1, 1,
0.2027413, -1.012056, 2.998186, 0, 0.6235294, 1, 1,
0.2030375, -0.7255041, 2.111367, 0, 0.6156863, 1, 1,
0.2031747, -2.220328, 2.790524, 0, 0.6117647, 1, 1,
0.2040921, -1.931934, 3.913291, 0, 0.6039216, 1, 1,
0.2044678, 0.4632924, 1.298955, 0, 0.5960785, 1, 1,
0.2053024, -0.3772708, 3.082625, 0, 0.5921569, 1, 1,
0.2093789, 0.4800644, 2.409132, 0, 0.5843138, 1, 1,
0.2094228, 1.027359, 0.148493, 0, 0.5803922, 1, 1,
0.2195327, -0.153804, 0.9805041, 0, 0.572549, 1, 1,
0.2198635, 0.7678238, -0.6027445, 0, 0.5686275, 1, 1,
0.2199096, 0.9123, -0.5489623, 0, 0.5607843, 1, 1,
0.2205178, 0.6567206, 0.1012296, 0, 0.5568628, 1, 1,
0.2211054, -0.3161474, 2.95454, 0, 0.5490196, 1, 1,
0.2223682, 0.4424708, 0.9028841, 0, 0.5450981, 1, 1,
0.2239269, -1.73866, 4.073507, 0, 0.5372549, 1, 1,
0.2269255, 1.545397, -0.2630692, 0, 0.5333334, 1, 1,
0.2301107, 0.3117234, 0.2533889, 0, 0.5254902, 1, 1,
0.2307681, -0.8219349, 3.454024, 0, 0.5215687, 1, 1,
0.2343431, -1.981553, 3.75249, 0, 0.5137255, 1, 1,
0.2356343, -0.1517911, 2.747518, 0, 0.509804, 1, 1,
0.2402095, 1.829616, -1.277575, 0, 0.5019608, 1, 1,
0.2410804, 1.286972, -0.7130383, 0, 0.4941176, 1, 1,
0.2442384, 0.1585342, 0.6414023, 0, 0.4901961, 1, 1,
0.2477771, -0.6255601, 1.878965, 0, 0.4823529, 1, 1,
0.2521585, 0.4041142, 0.7425521, 0, 0.4784314, 1, 1,
0.2534702, 0.0781935, -0.004405997, 0, 0.4705882, 1, 1,
0.2566274, 0.01538324, 0.7334717, 0, 0.4666667, 1, 1,
0.2597454, -0.3144449, 3.117812, 0, 0.4588235, 1, 1,
0.2603399, 1.442897, 2.015844, 0, 0.454902, 1, 1,
0.2613975, 1.396622, 1.434317, 0, 0.4470588, 1, 1,
0.2617342, -1.703189, 3.304202, 0, 0.4431373, 1, 1,
0.2661358, -0.5389462, 3.606047, 0, 0.4352941, 1, 1,
0.2707101, -0.3365449, 1.635917, 0, 0.4313726, 1, 1,
0.2766191, 0.579506, 1.373351, 0, 0.4235294, 1, 1,
0.2789679, -0.6215158, 2.020619, 0, 0.4196078, 1, 1,
0.2813581, 0.8440426, -0.06139012, 0, 0.4117647, 1, 1,
0.2859581, 1.229741, -0.5797061, 0, 0.4078431, 1, 1,
0.2879387, -1.64217, 3.466627, 0, 0.4, 1, 1,
0.2892574, -0.8292118, 3.991219, 0, 0.3921569, 1, 1,
0.29655, 0.7301538, -0.39813, 0, 0.3882353, 1, 1,
0.2968199, 0.1092932, 1.826372, 0, 0.3803922, 1, 1,
0.3033565, 0.4082704, -0.2909083, 0, 0.3764706, 1, 1,
0.3044489, -2.256594, 2.520931, 0, 0.3686275, 1, 1,
0.3055812, 0.01657068, 0.5107874, 0, 0.3647059, 1, 1,
0.3085223, -0.8245047, 2.983243, 0, 0.3568628, 1, 1,
0.3164666, 0.05670456, 1.107309, 0, 0.3529412, 1, 1,
0.3165564, -0.6326857, 3.78421, 0, 0.345098, 1, 1,
0.3188811, 0.4377443, 0.7760632, 0, 0.3411765, 1, 1,
0.3212122, -0.5446517, 1.301139, 0, 0.3333333, 1, 1,
0.3272345, 1.501113, 1.325078, 0, 0.3294118, 1, 1,
0.3293597, -1.034823, 2.474248, 0, 0.3215686, 1, 1,
0.3294445, -0.4343722, 2.133705, 0, 0.3176471, 1, 1,
0.332618, -1.650355, 3.160282, 0, 0.3098039, 1, 1,
0.3335955, -0.3336987, 0.601485, 0, 0.3058824, 1, 1,
0.3343387, -0.8924702, 0.900098, 0, 0.2980392, 1, 1,
0.335524, -1.171132, 1.259086, 0, 0.2901961, 1, 1,
0.3381622, 0.1114269, 3.411304, 0, 0.2862745, 1, 1,
0.34014, -1.307175, 3.557379, 0, 0.2784314, 1, 1,
0.3411596, -0.6016357, 1.596675, 0, 0.2745098, 1, 1,
0.3433321, 0.615387, 0.2710264, 0, 0.2666667, 1, 1,
0.3439282, 0.8285809, -1.283327, 0, 0.2627451, 1, 1,
0.3461222, 0.4261849, 2.460019, 0, 0.254902, 1, 1,
0.3478341, -0.3169948, 2.135154, 0, 0.2509804, 1, 1,
0.3481879, -1.753957, 1.966027, 0, 0.2431373, 1, 1,
0.3494645, -0.4889118, 2.790191, 0, 0.2392157, 1, 1,
0.3497238, 0.309901, 1.051358, 0, 0.2313726, 1, 1,
0.3519059, -0.569883, 2.543437, 0, 0.227451, 1, 1,
0.3534012, 0.1827097, 2.192657, 0, 0.2196078, 1, 1,
0.3534758, 0.6330444, 1.801063, 0, 0.2156863, 1, 1,
0.3537477, -0.7580453, 3.458184, 0, 0.2078431, 1, 1,
0.3548929, 0.7776176, 0.7194096, 0, 0.2039216, 1, 1,
0.358719, 0.3118457, -1.052553, 0, 0.1960784, 1, 1,
0.359256, 0.8035588, 0.5103233, 0, 0.1882353, 1, 1,
0.3629982, -0.6264127, 3.680123, 0, 0.1843137, 1, 1,
0.3675254, 1.705265, 1.321776, 0, 0.1764706, 1, 1,
0.3706313, -0.5793712, 2.2838, 0, 0.172549, 1, 1,
0.3718003, 0.9069387, 0.4699703, 0, 0.1647059, 1, 1,
0.3734362, 0.3847602, 1.598298, 0, 0.1607843, 1, 1,
0.3745034, -0.4349402, 0.8715333, 0, 0.1529412, 1, 1,
0.375303, 0.989279, -0.5809415, 0, 0.1490196, 1, 1,
0.375349, -0.2943445, -0.02513606, 0, 0.1411765, 1, 1,
0.3759231, 1.30708, 0.6514652, 0, 0.1372549, 1, 1,
0.3765869, 0.3157217, 1.578939, 0, 0.1294118, 1, 1,
0.3790703, -0.8510248, 2.61828, 0, 0.1254902, 1, 1,
0.3808764, -0.6973762, 3.558401, 0, 0.1176471, 1, 1,
0.3823383, 2.125335, -0.7175963, 0, 0.1137255, 1, 1,
0.3835641, -0.8876722, 3.760844, 0, 0.1058824, 1, 1,
0.3860421, -1.22667, 2.98467, 0, 0.09803922, 1, 1,
0.3867765, -0.07204414, 3.951122, 0, 0.09411765, 1, 1,
0.3935675, -0.3705063, 3.642931, 0, 0.08627451, 1, 1,
0.3953561, -1.084416, 3.742252, 0, 0.08235294, 1, 1,
0.4029923, -1.774838, 3.323398, 0, 0.07450981, 1, 1,
0.4037206, 2.594761, 0.1749782, 0, 0.07058824, 1, 1,
0.4053367, -0.08129474, 2.131861, 0, 0.0627451, 1, 1,
0.4054987, 0.4374335, 2.033131, 0, 0.05882353, 1, 1,
0.4061346, 1.969973, -1.017249, 0, 0.05098039, 1, 1,
0.4095137, -1.696037, 2.715183, 0, 0.04705882, 1, 1,
0.4101706, -1.005828, 4.251657, 0, 0.03921569, 1, 1,
0.41039, 0.07077188, 0.311452, 0, 0.03529412, 1, 1,
0.41328, 0.5401796, 0.8830184, 0, 0.02745098, 1, 1,
0.4136412, 1.278552, 0.7888272, 0, 0.02352941, 1, 1,
0.4142388, 1.609496, 0.1828286, 0, 0.01568628, 1, 1,
0.4220552, -0.2815209, 3.597512, 0, 0.01176471, 1, 1,
0.4242491, 0.525768, 0.5030292, 0, 0.003921569, 1, 1,
0.4257354, -0.3295405, 2.281605, 0.003921569, 0, 1, 1,
0.4266227, 1.541484, 0.520807, 0.007843138, 0, 1, 1,
0.4281157, 0.5894871, 1.398229, 0.01568628, 0, 1, 1,
0.4288022, -0.25569, 2.138935, 0.01960784, 0, 1, 1,
0.4305376, 1.206432, 0.5102453, 0.02745098, 0, 1, 1,
0.4310508, -1.235869, 4.858283, 0.03137255, 0, 1, 1,
0.4320498, 1.401685, -1.303023, 0.03921569, 0, 1, 1,
0.433005, -0.6220506, 0.4650904, 0.04313726, 0, 1, 1,
0.433944, -0.5715894, 3.240553, 0.05098039, 0, 1, 1,
0.4340108, 0.5014131, 0.3456812, 0.05490196, 0, 1, 1,
0.4346684, -1.764893, 2.900576, 0.0627451, 0, 1, 1,
0.4401036, -0.3460142, 3.79618, 0.06666667, 0, 1, 1,
0.4412697, -0.7493424, 0.9850689, 0.07450981, 0, 1, 1,
0.4414302, -0.1943706, 2.814564, 0.07843138, 0, 1, 1,
0.444864, -0.4146546, 2.891758, 0.08627451, 0, 1, 1,
0.4480084, 0.6259716, 1.592102, 0.09019608, 0, 1, 1,
0.4507935, -0.7365001, 1.590156, 0.09803922, 0, 1, 1,
0.4565478, 0.7433595, 0.4528186, 0.1058824, 0, 1, 1,
0.4582134, -0.5576171, 1.521013, 0.1098039, 0, 1, 1,
0.4608417, -0.6131354, 2.793937, 0.1176471, 0, 1, 1,
0.4611976, 0.2001207, -0.6322647, 0.1215686, 0, 1, 1,
0.4669653, 1.437847, 0.9105718, 0.1294118, 0, 1, 1,
0.4676076, 0.6712071, -0.7724928, 0.1333333, 0, 1, 1,
0.4704499, 0.1225959, 1.093586, 0.1411765, 0, 1, 1,
0.4714701, -0.3226062, 2.24905, 0.145098, 0, 1, 1,
0.4746614, -1.011243, 2.548206, 0.1529412, 0, 1, 1,
0.4754516, -0.2934684, 2.230332, 0.1568628, 0, 1, 1,
0.4779928, 2.015915, -1.003252, 0.1647059, 0, 1, 1,
0.4803404, -0.4126415, 2.445682, 0.1686275, 0, 1, 1,
0.4837549, -0.3242914, 1.266384, 0.1764706, 0, 1, 1,
0.4838597, 0.1695651, 0.8348461, 0.1803922, 0, 1, 1,
0.4850882, 0.003676623, 0.5894346, 0.1882353, 0, 1, 1,
0.4900083, 1.90403, -1.281746, 0.1921569, 0, 1, 1,
0.4907992, 1.247441, -0.3793374, 0.2, 0, 1, 1,
0.4943728, -1.654538, 3.098429, 0.2078431, 0, 1, 1,
0.4957628, -0.4907184, 3.081399, 0.2117647, 0, 1, 1,
0.4958375, 0.3943141, 2.750198, 0.2196078, 0, 1, 1,
0.4965361, 1.038112, 1.403941, 0.2235294, 0, 1, 1,
0.4972836, -0.2771181, 2.667948, 0.2313726, 0, 1, 1,
0.4976902, 0.8374478, 1.600422, 0.2352941, 0, 1, 1,
0.4998012, -1.054124, 4.08331, 0.2431373, 0, 1, 1,
0.5005469, -1.044608, 3.220222, 0.2470588, 0, 1, 1,
0.5072098, 0.2013623, 2.163908, 0.254902, 0, 1, 1,
0.5079415, 1.966047, -0.006529084, 0.2588235, 0, 1, 1,
0.5080695, 0.7541089, 0.9474227, 0.2666667, 0, 1, 1,
0.5083976, 0.6050297, 1.505026, 0.2705882, 0, 1, 1,
0.5094287, -0.7770761, 1.995615, 0.2784314, 0, 1, 1,
0.5120729, -0.6903241, 1.612671, 0.282353, 0, 1, 1,
0.513819, 1.462928, -0.03752412, 0.2901961, 0, 1, 1,
0.5189535, -0.7347401, 3.536068, 0.2941177, 0, 1, 1,
0.5222983, -0.02486037, 0.7286926, 0.3019608, 0, 1, 1,
0.5227256, -0.5173653, 3.219283, 0.3098039, 0, 1, 1,
0.5243476, -0.0843685, 1.02079, 0.3137255, 0, 1, 1,
0.5245364, -1.671874, 2.273737, 0.3215686, 0, 1, 1,
0.5310516, -0.5755299, 2.512654, 0.3254902, 0, 1, 1,
0.5351322, -2.035768, 2.40476, 0.3333333, 0, 1, 1,
0.5396985, -0.723973, 2.983036, 0.3372549, 0, 1, 1,
0.5409978, 1.010081, -0.5800731, 0.345098, 0, 1, 1,
0.5502984, -1.297123, 2.724571, 0.3490196, 0, 1, 1,
0.5533376, 0.4040235, 0.3712241, 0.3568628, 0, 1, 1,
0.5597372, -1.102427, 1.614454, 0.3607843, 0, 1, 1,
0.5611131, 0.6364627, 1.721649, 0.3686275, 0, 1, 1,
0.562737, 0.2235265, 1.762806, 0.372549, 0, 1, 1,
0.5639087, -0.7176139, 3.589566, 0.3803922, 0, 1, 1,
0.5651706, -0.3867167, 3.136595, 0.3843137, 0, 1, 1,
0.5731396, -0.241976, 2.322828, 0.3921569, 0, 1, 1,
0.5758237, -0.03774237, 1.239199, 0.3960784, 0, 1, 1,
0.5788178, -0.2248952, 1.871721, 0.4039216, 0, 1, 1,
0.5892798, -2.585001, 4.386239, 0.4117647, 0, 1, 1,
0.5900257, 0.5523415, 0.840647, 0.4156863, 0, 1, 1,
0.5989127, -1.13542, 2.741473, 0.4235294, 0, 1, 1,
0.5993922, -0.811657, 2.917726, 0.427451, 0, 1, 1,
0.5995546, -0.2013762, 3.074021, 0.4352941, 0, 1, 1,
0.6162341, -0.1998439, 1.366336, 0.4392157, 0, 1, 1,
0.6168678, 1.797173, 0.5177095, 0.4470588, 0, 1, 1,
0.6182974, -0.3937533, 0.8642147, 0.4509804, 0, 1, 1,
0.6220395, 0.8171642, 0.8642789, 0.4588235, 0, 1, 1,
0.6239843, 0.3235425, 1.282285, 0.4627451, 0, 1, 1,
0.6241202, -1.117259, 2.068183, 0.4705882, 0, 1, 1,
0.6289082, 1.061841, 1.059374, 0.4745098, 0, 1, 1,
0.6298286, 1.909741, -0.629144, 0.4823529, 0, 1, 1,
0.6340235, -0.598128, 2.748765, 0.4862745, 0, 1, 1,
0.6359022, -0.6515301, 2.392424, 0.4941176, 0, 1, 1,
0.6386502, 0.1851507, 2.52563, 0.5019608, 0, 1, 1,
0.6476014, 1.096136, 2.768446, 0.5058824, 0, 1, 1,
0.6519004, -0.02025776, 0.4814432, 0.5137255, 0, 1, 1,
0.6554599, -1.932083, 4.059147, 0.5176471, 0, 1, 1,
0.6557875, 0.8334472, 0.4054645, 0.5254902, 0, 1, 1,
0.6577839, 0.2018085, 1.213849, 0.5294118, 0, 1, 1,
0.658145, 0.7902142, 0.631755, 0.5372549, 0, 1, 1,
0.6601644, -0.2565066, 2.438569, 0.5411765, 0, 1, 1,
0.664625, 0.6289737, -0.7569943, 0.5490196, 0, 1, 1,
0.6685437, 0.4216048, 1.503901, 0.5529412, 0, 1, 1,
0.6701375, -0.9099103, 3.399335, 0.5607843, 0, 1, 1,
0.6797359, -0.09649648, 2.246916, 0.5647059, 0, 1, 1,
0.6814329, -0.411469, 1.177689, 0.572549, 0, 1, 1,
0.691664, 0.5618556, 2.149267, 0.5764706, 0, 1, 1,
0.6955885, 1.037421, 1.340238, 0.5843138, 0, 1, 1,
0.698978, -0.9725014, 2.06923, 0.5882353, 0, 1, 1,
0.7021201, -0.1582917, 1.334484, 0.5960785, 0, 1, 1,
0.7128279, 1.519857, 0.3140492, 0.6039216, 0, 1, 1,
0.7173363, 0.2032075, 1.74837, 0.6078432, 0, 1, 1,
0.7176467, 1.563948, 2.548449, 0.6156863, 0, 1, 1,
0.7185876, 0.7567614, 1.188508, 0.6196079, 0, 1, 1,
0.7236537, -0.005792684, 1.378255, 0.627451, 0, 1, 1,
0.7262225, 0.5773643, -2.003699, 0.6313726, 0, 1, 1,
0.7282534, 0.1306318, 1.979176, 0.6392157, 0, 1, 1,
0.7283182, -2.719801, 2.793881, 0.6431373, 0, 1, 1,
0.7303024, 0.9267995, -1.01858, 0.6509804, 0, 1, 1,
0.7361019, -1.275138, 2.873447, 0.654902, 0, 1, 1,
0.7372818, 0.1181896, 1.105358, 0.6627451, 0, 1, 1,
0.7378332, 0.2964883, 0.3238843, 0.6666667, 0, 1, 1,
0.7399391, 2.046742, 1.528393, 0.6745098, 0, 1, 1,
0.7404317, 0.5296067, 0.9515178, 0.6784314, 0, 1, 1,
0.7443715, 0.3916828, 0.6004596, 0.6862745, 0, 1, 1,
0.7500799, 0.5000013, 2.465687, 0.6901961, 0, 1, 1,
0.7522439, 0.1857452, 3.481858, 0.6980392, 0, 1, 1,
0.7647392, 0.6953263, 1.93647, 0.7058824, 0, 1, 1,
0.7662418, 0.9854254, 1.163833, 0.7098039, 0, 1, 1,
0.7679207, -0.850627, 3.420322, 0.7176471, 0, 1, 1,
0.7716339, -0.2091298, 2.517428, 0.7215686, 0, 1, 1,
0.774892, 0.2793814, 1.758829, 0.7294118, 0, 1, 1,
0.7775367, -0.01566317, 0.7036631, 0.7333333, 0, 1, 1,
0.7823341, -0.2908906, 1.472145, 0.7411765, 0, 1, 1,
0.7839447, -0.6367524, 3.296502, 0.7450981, 0, 1, 1,
0.7849287, 0.1371516, -0.3382785, 0.7529412, 0, 1, 1,
0.7930214, 0.7039412, 0.04824836, 0.7568628, 0, 1, 1,
0.7932228, 0.1269355, 0.1243151, 0.7647059, 0, 1, 1,
0.7932832, 0.904628, 0.7607638, 0.7686275, 0, 1, 1,
0.8001925, -0.2230428, 2.052248, 0.7764706, 0, 1, 1,
0.8028802, 0.6848876, 2.508672, 0.7803922, 0, 1, 1,
0.8078931, 0.7425882, 0.630161, 0.7882353, 0, 1, 1,
0.8084961, 1.16873, -0.7855721, 0.7921569, 0, 1, 1,
0.8111631, 0.2791333, 2.48762, 0.8, 0, 1, 1,
0.8147622, 1.062962, 1.070151, 0.8078431, 0, 1, 1,
0.8169361, 0.9801604, 2.327035, 0.8117647, 0, 1, 1,
0.8225312, 0.7941534, 0.6076067, 0.8196079, 0, 1, 1,
0.8252412, 1.373685, 2.130551, 0.8235294, 0, 1, 1,
0.8295082, 0.7879908, 0.4753777, 0.8313726, 0, 1, 1,
0.8322355, -1.382771, 3.288003, 0.8352941, 0, 1, 1,
0.8334261, -1.208678, 4.048327, 0.8431373, 0, 1, 1,
0.8335187, -0.2755849, 0.6087267, 0.8470588, 0, 1, 1,
0.8422618, 0.8480384, 1.100599, 0.854902, 0, 1, 1,
0.8466524, 0.9928468, 2.424797, 0.8588235, 0, 1, 1,
0.8507106, 0.1224812, 2.772257, 0.8666667, 0, 1, 1,
0.8569188, 0.695479, 0.7634455, 0.8705882, 0, 1, 1,
0.8620993, -2.853066, 3.739757, 0.8784314, 0, 1, 1,
0.8623428, 2.002273, -0.8874458, 0.8823529, 0, 1, 1,
0.8629876, 0.2071514, 0.571621, 0.8901961, 0, 1, 1,
0.8716021, 2.165813, -0.2267217, 0.8941177, 0, 1, 1,
0.8746715, 0.6865859, 1.10462, 0.9019608, 0, 1, 1,
0.876383, -0.3064886, 0.7735375, 0.9098039, 0, 1, 1,
0.878444, 0.1933652, 3.376206, 0.9137255, 0, 1, 1,
0.8809705, 0.5154486, 1.454932, 0.9215686, 0, 1, 1,
0.8887356, -0.4425963, 2.958776, 0.9254902, 0, 1, 1,
0.8943325, -1.009465, 3.597022, 0.9333333, 0, 1, 1,
0.8967298, -0.8888758, 3.632456, 0.9372549, 0, 1, 1,
0.899654, -0.0975355, 0.6435159, 0.945098, 0, 1, 1,
0.9040443, -2.14656, 3.137861, 0.9490196, 0, 1, 1,
0.9096689, -0.3608044, 2.472145, 0.9568627, 0, 1, 1,
0.9103892, -0.4232858, 3.009263, 0.9607843, 0, 1, 1,
0.9110454, -0.6073826, 2.865328, 0.9686275, 0, 1, 1,
0.9130314, 0.3056558, 2.408479, 0.972549, 0, 1, 1,
0.9144756, -0.7009709, 1.14014, 0.9803922, 0, 1, 1,
0.9146281, 1.677493, -1.356547, 0.9843137, 0, 1, 1,
0.9180319, -1.002477, 1.050551, 0.9921569, 0, 1, 1,
0.9190179, 1.160305, 1.836862, 0.9960784, 0, 1, 1,
0.9252566, -1.06266, 0.9336596, 1, 0, 0.9960784, 1,
0.925355, 0.2322388, 1.360748, 1, 0, 0.9882353, 1,
0.9442945, 2.419145, 0.8995308, 1, 0, 0.9843137, 1,
0.948745, 0.9732947, -0.3743194, 1, 0, 0.9764706, 1,
0.9613683, 0.05648118, 2.086778, 1, 0, 0.972549, 1,
0.9615517, 0.8650483, 1.651044, 1, 0, 0.9647059, 1,
0.9640555, 2.892885, 1.32396, 1, 0, 0.9607843, 1,
0.9696073, 0.2879345, 1.920094, 1, 0, 0.9529412, 1,
0.9716213, 0.9165912, 0.1678867, 1, 0, 0.9490196, 1,
0.971724, -1.380129, 4.205446, 1, 0, 0.9411765, 1,
0.9786699, 0.358123, 1.653686, 1, 0, 0.9372549, 1,
0.981958, 1.526641, 1.556993, 1, 0, 0.9294118, 1,
0.9872479, -1.630719, 3.17681, 1, 0, 0.9254902, 1,
0.9886201, -1.895496, 1.650163, 1, 0, 0.9176471, 1,
0.989266, -0.9537781, 3.239175, 1, 0, 0.9137255, 1,
0.9913362, 2.019172, 0.423174, 1, 0, 0.9058824, 1,
0.9966385, -0.2641858, 2.720183, 1, 0, 0.9019608, 1,
1.001253, -1.418429, 2.986245, 1, 0, 0.8941177, 1,
1.001275, -1.689851, 3.439203, 1, 0, 0.8862745, 1,
1.009994, -0.9209455, 1.310315, 1, 0, 0.8823529, 1,
1.015684, -0.3815413, 1.466446, 1, 0, 0.8745098, 1,
1.017687, -0.05645549, 0.3389588, 1, 0, 0.8705882, 1,
1.022513, 2.385025, -0.2101, 1, 0, 0.8627451, 1,
1.025975, -0.8404398, 4.205591, 1, 0, 0.8588235, 1,
1.02645, -1.141591, 1.796071, 1, 0, 0.8509804, 1,
1.029369, -0.7270548, 1.703017, 1, 0, 0.8470588, 1,
1.032178, -1.96449, 1.850799, 1, 0, 0.8392157, 1,
1.033222, 0.7977874, 2.490901, 1, 0, 0.8352941, 1,
1.03388, -0.4820055, 2.105052, 1, 0, 0.827451, 1,
1.038963, -0.06578157, 2.955768, 1, 0, 0.8235294, 1,
1.04326, -0.8299434, 1.519777, 1, 0, 0.8156863, 1,
1.046457, 1.525239, 0.3094214, 1, 0, 0.8117647, 1,
1.048913, 0.7031002, 1.342534, 1, 0, 0.8039216, 1,
1.05141, 0.6063682, 0.3846634, 1, 0, 0.7960784, 1,
1.062177, 0.8913583, 1.300549, 1, 0, 0.7921569, 1,
1.062378, -0.08517726, 1.090422, 1, 0, 0.7843137, 1,
1.065708, 1.338994, 0.4150133, 1, 0, 0.7803922, 1,
1.066787, -0.3754993, 1.445832, 1, 0, 0.772549, 1,
1.070684, 0.01055594, 2.78319, 1, 0, 0.7686275, 1,
1.072868, -1.029021, 2.491671, 1, 0, 0.7607843, 1,
1.074239, -1.266244, 3.143565, 1, 0, 0.7568628, 1,
1.076581, -0.1199375, 1.738511, 1, 0, 0.7490196, 1,
1.078744, -1.584942, 2.126307, 1, 0, 0.7450981, 1,
1.083218, -1.578705, 3.331709, 1, 0, 0.7372549, 1,
1.085883, 1.433945, 1.366922, 1, 0, 0.7333333, 1,
1.088252, 1.01029, 0.6757589, 1, 0, 0.7254902, 1,
1.089559, 0.3773299, 1.031925, 1, 0, 0.7215686, 1,
1.09351, -0.9213615, 0.4084596, 1, 0, 0.7137255, 1,
1.100317, -0.9399505, 2.746759, 1, 0, 0.7098039, 1,
1.10978, -0.04340251, 1.489573, 1, 0, 0.7019608, 1,
1.113306, -2.45777, 4.2304, 1, 0, 0.6941177, 1,
1.118457, -0.3224938, 1.065782, 1, 0, 0.6901961, 1,
1.118656, 1.745128, 0.07602793, 1, 0, 0.682353, 1,
1.118682, 1.824023, -0.2234804, 1, 0, 0.6784314, 1,
1.119415, 0.2073443, 1.169078, 1, 0, 0.6705883, 1,
1.133688, 1.494003, -0.5749882, 1, 0, 0.6666667, 1,
1.148296, 0.7135133, 0.609069, 1, 0, 0.6588235, 1,
1.148715, 1.324492, -0.08295541, 1, 0, 0.654902, 1,
1.150481, -0.7957259, 1.147205, 1, 0, 0.6470588, 1,
1.156368, -0.1942336, 0.5768718, 1, 0, 0.6431373, 1,
1.167244, -0.985315, 1.445291, 1, 0, 0.6352941, 1,
1.183427, -0.295245, 2.347381, 1, 0, 0.6313726, 1,
1.187181, -0.3535846, 2.202919, 1, 0, 0.6235294, 1,
1.200094, 0.3812133, 0.1804998, 1, 0, 0.6196079, 1,
1.201265, 0.3643042, 0.7839888, 1, 0, 0.6117647, 1,
1.228729, -0.5687606, 3.516771, 1, 0, 0.6078432, 1,
1.238811, -0.7253183, 3.204313, 1, 0, 0.6, 1,
1.257207, -0.0001153354, 0.8349235, 1, 0, 0.5921569, 1,
1.260556, -1.036957, 1.120304, 1, 0, 0.5882353, 1,
1.26395, -0.9769533, 1.792608, 1, 0, 0.5803922, 1,
1.266636, 0.208689, 0.7165354, 1, 0, 0.5764706, 1,
1.271836, 0.8912959, 1.757564, 1, 0, 0.5686275, 1,
1.282317, 0.2256072, 0.244367, 1, 0, 0.5647059, 1,
1.283194, 0.07368288, 1.9655, 1, 0, 0.5568628, 1,
1.287327, 1.666034, 1.379961, 1, 0, 0.5529412, 1,
1.289557, 0.03501235, 2.034106, 1, 0, 0.5450981, 1,
1.30575, 0.9705363, -0.1477875, 1, 0, 0.5411765, 1,
1.308383, -0.802963, 2.258561, 1, 0, 0.5333334, 1,
1.315029, -0.373809, 1.065838, 1, 0, 0.5294118, 1,
1.316785, 0.4981168, 2.666322, 1, 0, 0.5215687, 1,
1.322124, -0.7772191, 2.18934, 1, 0, 0.5176471, 1,
1.340747, 1.115694, -0.8214363, 1, 0, 0.509804, 1,
1.342344, -0.3800206, 1.308191, 1, 0, 0.5058824, 1,
1.356809, -1.105181, 2.263999, 1, 0, 0.4980392, 1,
1.360052, -0.2741007, 0.886252, 1, 0, 0.4901961, 1,
1.378001, -0.08729426, 1.403316, 1, 0, 0.4862745, 1,
1.380836, 0.7549955, 1.950826, 1, 0, 0.4784314, 1,
1.388025, -0.9090609, 1.272035, 1, 0, 0.4745098, 1,
1.400048, -0.2282721, -0.5640556, 1, 0, 0.4666667, 1,
1.400744, 1.954126, 1.286947, 1, 0, 0.4627451, 1,
1.403397, -0.258759, 0.5409922, 1, 0, 0.454902, 1,
1.407163, -0.7579283, 1.622182, 1, 0, 0.4509804, 1,
1.415918, 0.4007202, 0.3423861, 1, 0, 0.4431373, 1,
1.437979, 1.151414, 0.9568237, 1, 0, 0.4392157, 1,
1.452409, -0.7180302, 1.803851, 1, 0, 0.4313726, 1,
1.46436, -0.8839209, 3.277568, 1, 0, 0.427451, 1,
1.470996, 2.245877, -0.08890834, 1, 0, 0.4196078, 1,
1.477815, 1.104369, -0.4322388, 1, 0, 0.4156863, 1,
1.48226, 1.737106, 1.057931, 1, 0, 0.4078431, 1,
1.489584, -0.6868765, 1.480125, 1, 0, 0.4039216, 1,
1.502025, -0.363184, 2.156802, 1, 0, 0.3960784, 1,
1.52395, -0.6706411, 2.186801, 1, 0, 0.3882353, 1,
1.536341, -2.161443, 1.996179, 1, 0, 0.3843137, 1,
1.540211, 0.8444618, -1.490467, 1, 0, 0.3764706, 1,
1.545347, 0.9947204, 0.4602146, 1, 0, 0.372549, 1,
1.553958, 0.8533526, 0.8836565, 1, 0, 0.3647059, 1,
1.555086, -1.609862, 4.437648, 1, 0, 0.3607843, 1,
1.556985, -0.3868164, 1.802491, 1, 0, 0.3529412, 1,
1.557358, -1.015285, 3.609256, 1, 0, 0.3490196, 1,
1.570956, -0.9796448, 1.70676, 1, 0, 0.3411765, 1,
1.584593, -2.681486, 5.663449, 1, 0, 0.3372549, 1,
1.592188, 1.783281, 0.3522617, 1, 0, 0.3294118, 1,
1.595584, -0.6836829, 1.003757, 1, 0, 0.3254902, 1,
1.598459, 0.2888049, 3.559544, 1, 0, 0.3176471, 1,
1.604228, 0.637578, 2.785149, 1, 0, 0.3137255, 1,
1.607241, -0.3100538, 0.6793872, 1, 0, 0.3058824, 1,
1.628377, 0.4240625, 1.06093, 1, 0, 0.2980392, 1,
1.628872, -0.7677031, 1.015923, 1, 0, 0.2941177, 1,
1.634455, -1.11729, 1.892851, 1, 0, 0.2862745, 1,
1.653107, -0.9307509, 3.117695, 1, 0, 0.282353, 1,
1.657045, -1.328707, 2.280655, 1, 0, 0.2745098, 1,
1.677564, -1.346576, 4.066398, 1, 0, 0.2705882, 1,
1.67848, 0.2111714, 2.65434, 1, 0, 0.2627451, 1,
1.688369, 0.2087748, 2.067218, 1, 0, 0.2588235, 1,
1.69932, -1.643182, 1.459865, 1, 0, 0.2509804, 1,
1.717104, 0.4193188, 1.321911, 1, 0, 0.2470588, 1,
1.726606, 1.645308, -0.06658351, 1, 0, 0.2392157, 1,
1.800503, 0.4543569, 0.9776078, 1, 0, 0.2352941, 1,
1.815616, 0.5137066, 0.8508143, 1, 0, 0.227451, 1,
1.829577, -0.3593943, 3.240161, 1, 0, 0.2235294, 1,
1.832727, 0.8602774, 1.692943, 1, 0, 0.2156863, 1,
1.833432, 0.9750415, 0.6511161, 1, 0, 0.2117647, 1,
1.834406, -2.389538, 2.814147, 1, 0, 0.2039216, 1,
1.83765, 0.3421057, 0.74479, 1, 0, 0.1960784, 1,
1.858151, 0.02893358, 1.234825, 1, 0, 0.1921569, 1,
1.878879, 1.443908, -0.2122347, 1, 0, 0.1843137, 1,
1.882073, -1.450714, 3.450685, 1, 0, 0.1803922, 1,
1.888651, 0.3033381, 1.780905, 1, 0, 0.172549, 1,
1.899017, -1.765543, 2.571947, 1, 0, 0.1686275, 1,
1.916123, 0.2561571, 1.067495, 1, 0, 0.1607843, 1,
1.924535, -1.24636, 2.162255, 1, 0, 0.1568628, 1,
1.930333, -1.290449, 2.904443, 1, 0, 0.1490196, 1,
1.980009, 0.7434883, 0.9967628, 1, 0, 0.145098, 1,
1.999429, 1.008254, 2.030388, 1, 0, 0.1372549, 1,
2.001074, -1.002047, 1.248947, 1, 0, 0.1333333, 1,
2.054952, -0.7021107, 0.7719216, 1, 0, 0.1254902, 1,
2.06535, 0.3014096, 4.334693, 1, 0, 0.1215686, 1,
2.092309, -0.8113119, 0.7515132, 1, 0, 0.1137255, 1,
2.095997, 0.8228194, -0.3490995, 1, 0, 0.1098039, 1,
2.160161, 1.237867, 0.2697724, 1, 0, 0.1019608, 1,
2.221522, 0.05497951, 1.465947, 1, 0, 0.09411765, 1,
2.2445, 1.32203, 0.8540435, 1, 0, 0.09019608, 1,
2.253735, 1.117772, 1.693606, 1, 0, 0.08235294, 1,
2.259718, -0.2480553, 2.63881, 1, 0, 0.07843138, 1,
2.27222, -1.075714, 2.325044, 1, 0, 0.07058824, 1,
2.364479, 1.191405, 2.078032, 1, 0, 0.06666667, 1,
2.365518, -0.7421044, 3.526816, 1, 0, 0.05882353, 1,
2.382488, -0.2811028, 2.366806, 1, 0, 0.05490196, 1,
2.425815, -0.565079, 1.951645, 1, 0, 0.04705882, 1,
2.443149, 0.8143272, 2.076671, 1, 0, 0.04313726, 1,
2.460914, 0.7332936, 3.215866, 1, 0, 0.03529412, 1,
2.464589, -0.6377227, 2.732337, 1, 0, 0.03137255, 1,
2.47383, -0.1503866, 0.2484507, 1, 0, 0.02352941, 1,
2.608082, 1.240401, 1.557276, 1, 0, 0.01960784, 1,
3.039253, -0.3241742, 2.71699, 1, 0, 0.01176471, 1,
3.136705, -0.5171633, 0.1567539, 1, 0, 0.007843138, 1
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
0.001859903, -3.895178, -7.269248, 0, -0.5, 0.5, 0.5,
0.001859903, -3.895178, -7.269248, 1, -0.5, 0.5, 0.5,
0.001859903, -3.895178, -7.269248, 1, 1.5, 0.5, 0.5,
0.001859903, -3.895178, -7.269248, 0, 1.5, 0.5, 0.5
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
-4.195698, 0.05490673, -7.269248, 0, -0.5, 0.5, 0.5,
-4.195698, 0.05490673, -7.269248, 1, -0.5, 0.5, 0.5,
-4.195698, 0.05490673, -7.269248, 1, 1.5, 0.5, 0.5,
-4.195698, 0.05490673, -7.269248, 0, 1.5, 0.5, 0.5
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
-4.195698, -3.895178, 0.1342921, 0, -0.5, 0.5, 0.5,
-4.195698, -3.895178, 0.1342921, 1, -0.5, 0.5, 0.5,
-4.195698, -3.895178, 0.1342921, 1, 1.5, 0.5, 0.5,
-4.195698, -3.895178, 0.1342921, 0, 1.5, 0.5, 0.5
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
-3, -2.98362, -5.560739,
3, -2.98362, -5.560739,
-3, -2.98362, -5.560739,
-3, -3.135546, -5.845491,
-2, -2.98362, -5.560739,
-2, -3.135546, -5.845491,
-1, -2.98362, -5.560739,
-1, -3.135546, -5.845491,
0, -2.98362, -5.560739,
0, -3.135546, -5.845491,
1, -2.98362, -5.560739,
1, -3.135546, -5.845491,
2, -2.98362, -5.560739,
2, -3.135546, -5.845491,
3, -2.98362, -5.560739,
3, -3.135546, -5.845491
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
-3, -3.439399, -6.414994, 0, -0.5, 0.5, 0.5,
-3, -3.439399, -6.414994, 1, -0.5, 0.5, 0.5,
-3, -3.439399, -6.414994, 1, 1.5, 0.5, 0.5,
-3, -3.439399, -6.414994, 0, 1.5, 0.5, 0.5,
-2, -3.439399, -6.414994, 0, -0.5, 0.5, 0.5,
-2, -3.439399, -6.414994, 1, -0.5, 0.5, 0.5,
-2, -3.439399, -6.414994, 1, 1.5, 0.5, 0.5,
-2, -3.439399, -6.414994, 0, 1.5, 0.5, 0.5,
-1, -3.439399, -6.414994, 0, -0.5, 0.5, 0.5,
-1, -3.439399, -6.414994, 1, -0.5, 0.5, 0.5,
-1, -3.439399, -6.414994, 1, 1.5, 0.5, 0.5,
-1, -3.439399, -6.414994, 0, 1.5, 0.5, 0.5,
0, -3.439399, -6.414994, 0, -0.5, 0.5, 0.5,
0, -3.439399, -6.414994, 1, -0.5, 0.5, 0.5,
0, -3.439399, -6.414994, 1, 1.5, 0.5, 0.5,
0, -3.439399, -6.414994, 0, 1.5, 0.5, 0.5,
1, -3.439399, -6.414994, 0, -0.5, 0.5, 0.5,
1, -3.439399, -6.414994, 1, -0.5, 0.5, 0.5,
1, -3.439399, -6.414994, 1, 1.5, 0.5, 0.5,
1, -3.439399, -6.414994, 0, 1.5, 0.5, 0.5,
2, -3.439399, -6.414994, 0, -0.5, 0.5, 0.5,
2, -3.439399, -6.414994, 1, -0.5, 0.5, 0.5,
2, -3.439399, -6.414994, 1, 1.5, 0.5, 0.5,
2, -3.439399, -6.414994, 0, 1.5, 0.5, 0.5,
3, -3.439399, -6.414994, 0, -0.5, 0.5, 0.5,
3, -3.439399, -6.414994, 1, -0.5, 0.5, 0.5,
3, -3.439399, -6.414994, 1, 1.5, 0.5, 0.5,
3, -3.439399, -6.414994, 0, 1.5, 0.5, 0.5
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
-3.227031, -2, -5.560739,
-3.227031, 3, -5.560739,
-3.227031, -2, -5.560739,
-3.388475, -2, -5.845491,
-3.227031, -1, -5.560739,
-3.388475, -1, -5.845491,
-3.227031, 0, -5.560739,
-3.388475, 0, -5.845491,
-3.227031, 1, -5.560739,
-3.388475, 1, -5.845491,
-3.227031, 2, -5.560739,
-3.388475, 2, -5.845491,
-3.227031, 3, -5.560739,
-3.388475, 3, -5.845491
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
-3.711364, -2, -6.414994, 0, -0.5, 0.5, 0.5,
-3.711364, -2, -6.414994, 1, -0.5, 0.5, 0.5,
-3.711364, -2, -6.414994, 1, 1.5, 0.5, 0.5,
-3.711364, -2, -6.414994, 0, 1.5, 0.5, 0.5,
-3.711364, -1, -6.414994, 0, -0.5, 0.5, 0.5,
-3.711364, -1, -6.414994, 1, -0.5, 0.5, 0.5,
-3.711364, -1, -6.414994, 1, 1.5, 0.5, 0.5,
-3.711364, -1, -6.414994, 0, 1.5, 0.5, 0.5,
-3.711364, 0, -6.414994, 0, -0.5, 0.5, 0.5,
-3.711364, 0, -6.414994, 1, -0.5, 0.5, 0.5,
-3.711364, 0, -6.414994, 1, 1.5, 0.5, 0.5,
-3.711364, 0, -6.414994, 0, 1.5, 0.5, 0.5,
-3.711364, 1, -6.414994, 0, -0.5, 0.5, 0.5,
-3.711364, 1, -6.414994, 1, -0.5, 0.5, 0.5,
-3.711364, 1, -6.414994, 1, 1.5, 0.5, 0.5,
-3.711364, 1, -6.414994, 0, 1.5, 0.5, 0.5,
-3.711364, 2, -6.414994, 0, -0.5, 0.5, 0.5,
-3.711364, 2, -6.414994, 1, -0.5, 0.5, 0.5,
-3.711364, 2, -6.414994, 1, 1.5, 0.5, 0.5,
-3.711364, 2, -6.414994, 0, 1.5, 0.5, 0.5,
-3.711364, 3, -6.414994, 0, -0.5, 0.5, 0.5,
-3.711364, 3, -6.414994, 1, -0.5, 0.5, 0.5,
-3.711364, 3, -6.414994, 1, 1.5, 0.5, 0.5,
-3.711364, 3, -6.414994, 0, 1.5, 0.5, 0.5
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
-3.227031, -2.98362, -4,
-3.227031, -2.98362, 4,
-3.227031, -2.98362, -4,
-3.388475, -3.135546, -4,
-3.227031, -2.98362, -2,
-3.388475, -3.135546, -2,
-3.227031, -2.98362, 0,
-3.388475, -3.135546, 0,
-3.227031, -2.98362, 2,
-3.388475, -3.135546, 2,
-3.227031, -2.98362, 4,
-3.388475, -3.135546, 4
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
-3.711364, -3.439399, -4, 0, -0.5, 0.5, 0.5,
-3.711364, -3.439399, -4, 1, -0.5, 0.5, 0.5,
-3.711364, -3.439399, -4, 1, 1.5, 0.5, 0.5,
-3.711364, -3.439399, -4, 0, 1.5, 0.5, 0.5,
-3.711364, -3.439399, -2, 0, -0.5, 0.5, 0.5,
-3.711364, -3.439399, -2, 1, -0.5, 0.5, 0.5,
-3.711364, -3.439399, -2, 1, 1.5, 0.5, 0.5,
-3.711364, -3.439399, -2, 0, 1.5, 0.5, 0.5,
-3.711364, -3.439399, 0, 0, -0.5, 0.5, 0.5,
-3.711364, -3.439399, 0, 1, -0.5, 0.5, 0.5,
-3.711364, -3.439399, 0, 1, 1.5, 0.5, 0.5,
-3.711364, -3.439399, 0, 0, 1.5, 0.5, 0.5,
-3.711364, -3.439399, 2, 0, -0.5, 0.5, 0.5,
-3.711364, -3.439399, 2, 1, -0.5, 0.5, 0.5,
-3.711364, -3.439399, 2, 1, 1.5, 0.5, 0.5,
-3.711364, -3.439399, 2, 0, 1.5, 0.5, 0.5,
-3.711364, -3.439399, 4, 0, -0.5, 0.5, 0.5,
-3.711364, -3.439399, 4, 1, -0.5, 0.5, 0.5,
-3.711364, -3.439399, 4, 1, 1.5, 0.5, 0.5,
-3.711364, -3.439399, 4, 0, 1.5, 0.5, 0.5
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
-3.227031, -2.98362, -5.560739,
-3.227031, 3.093434, -5.560739,
-3.227031, -2.98362, 5.829323,
-3.227031, 3.093434, 5.829323,
-3.227031, -2.98362, -5.560739,
-3.227031, -2.98362, 5.829323,
-3.227031, 3.093434, -5.560739,
-3.227031, 3.093434, 5.829323,
-3.227031, -2.98362, -5.560739,
3.23075, -2.98362, -5.560739,
-3.227031, -2.98362, 5.829323,
3.23075, -2.98362, 5.829323,
-3.227031, 3.093434, -5.560739,
3.23075, 3.093434, -5.560739,
-3.227031, 3.093434, 5.829323,
3.23075, 3.093434, 5.829323,
3.23075, -2.98362, -5.560739,
3.23075, 3.093434, -5.560739,
3.23075, -2.98362, 5.829323,
3.23075, 3.093434, 5.829323,
3.23075, -2.98362, -5.560739,
3.23075, -2.98362, 5.829323,
3.23075, 3.093434, -5.560739,
3.23075, 3.093434, 5.829323
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
var radius = 7.707969;
var distance = 34.29363;
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
mvMatrix.translate( -0.001859903, -0.05490673, -0.1342921 );
mvMatrix.scale( 1.290537, 1.371389, 0.7316911 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.29363);
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
Sulfone<-read.table("Sulfone.xyz")
```

```
## Error in read.table("Sulfone.xyz"): no lines available in input
```

```r
x<-Sulfone$V2
```

```
## Error in eval(expr, envir, enclos): object 'Sulfone' not found
```

```r
y<-Sulfone$V3
```

```
## Error in eval(expr, envir, enclos): object 'Sulfone' not found
```

```r
z<-Sulfone$V4
```

```
## Error in eval(expr, envir, enclos): object 'Sulfone' not found
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
-3.132985, 2.888847, -1.804696, 0, 0, 1, 1, 1,
-2.86321, -0.6542917, -0.7156469, 1, 0, 0, 1, 1,
-2.841543, 0.8403068, -2.308546, 1, 0, 0, 1, 1,
-2.654031, -0.7134024, -2.191711, 1, 0, 0, 1, 1,
-2.607007, 1.574197, -0.7173107, 1, 0, 0, 1, 1,
-2.601248, 1.112568, -0.9489032, 1, 0, 0, 1, 1,
-2.594903, 0.261808, -1.217512, 0, 0, 0, 1, 1,
-2.59105, 1.890393, -2.12704, 0, 0, 0, 1, 1,
-2.52984, 1.03531, 0.1194513, 0, 0, 0, 1, 1,
-2.528778, 0.771971, -1.878801, 0, 0, 0, 1, 1,
-2.465932, 0.2125215, -2.89552, 0, 0, 0, 1, 1,
-2.380898, 1.368292, -0.3503022, 0, 0, 0, 1, 1,
-2.245065, 0.9775304, -1.647646, 0, 0, 0, 1, 1,
-2.227701, -0.1819795, -1.622607, 1, 1, 1, 1, 1,
-2.146839, 0.366184, -1.167147, 1, 1, 1, 1, 1,
-2.144776, -1.46839, -3.671175, 1, 1, 1, 1, 1,
-2.142163, 1.149495, -0.1953032, 1, 1, 1, 1, 1,
-2.128307, 1.446895, -0.3233619, 1, 1, 1, 1, 1,
-2.110989, 0.4914753, -1.299467, 1, 1, 1, 1, 1,
-2.091089, -0.2343885, -2.039137, 1, 1, 1, 1, 1,
-2.087466, 0.1350767, -1.02246, 1, 1, 1, 1, 1,
-2.081429, -2.027524, -3.840756, 1, 1, 1, 1, 1,
-2.076633, 0.7281597, -1.414061, 1, 1, 1, 1, 1,
-2.065216, 1.766099, -0.6363313, 1, 1, 1, 1, 1,
-2.058064, -0.5800026, -0.7139412, 1, 1, 1, 1, 1,
-2.05445, 0.0776929, -3.057855, 1, 1, 1, 1, 1,
-2.048914, 0.9317219, -1.265694, 1, 1, 1, 1, 1,
-2.023327, 0.4188973, -0.9812937, 1, 1, 1, 1, 1,
-2.021468, 0.1811425, -1.999606, 0, 0, 1, 1, 1,
-2.011869, -0.2611119, -2.823087, 1, 0, 0, 1, 1,
-1.979576, -1.529637, -2.323295, 1, 0, 0, 1, 1,
-1.959692, 0.516215, -2.365938, 1, 0, 0, 1, 1,
-1.958494, 0.5758125, -0.4577377, 1, 0, 0, 1, 1,
-1.956565, -0.9150005, -3.186674, 1, 0, 0, 1, 1,
-1.955742, -0.348279, -2.422016, 0, 0, 0, 1, 1,
-1.917757, -1.637962, -0.549119, 0, 0, 0, 1, 1,
-1.908509, 0.3566538, -2.63983, 0, 0, 0, 1, 1,
-1.900443, 0.2200521, 1.928449, 0, 0, 0, 1, 1,
-1.857383, 1.172224, -0.186383, 0, 0, 0, 1, 1,
-1.839851, 1.180401, -1.416886, 0, 0, 0, 1, 1,
-1.819584, 0.421208, -1.058445, 0, 0, 0, 1, 1,
-1.818085, -0.293887, -1.636338, 1, 1, 1, 1, 1,
-1.781896, -0.6234976, -3.512009, 1, 1, 1, 1, 1,
-1.764095, -0.7071698, -2.740311, 1, 1, 1, 1, 1,
-1.73803, 1.212465, 0.713926, 1, 1, 1, 1, 1,
-1.720212, 0.1043038, -1.97183, 1, 1, 1, 1, 1,
-1.718859, -1.024989, -4.284082, 1, 1, 1, 1, 1,
-1.707939, -0.5044287, -1.38894, 1, 1, 1, 1, 1,
-1.698975, -0.6812804, -1.288465, 1, 1, 1, 1, 1,
-1.67724, 0.9378206, -2.000324, 1, 1, 1, 1, 1,
-1.676513, 1.131367, -1.326875, 1, 1, 1, 1, 1,
-1.674202, -0.9946721, -2.779584, 1, 1, 1, 1, 1,
-1.651136, 1.185457, -2.079062, 1, 1, 1, 1, 1,
-1.638949, 0.3190137, -2.038416, 1, 1, 1, 1, 1,
-1.63267, 1.663514, 1.4228, 1, 1, 1, 1, 1,
-1.631029, -1.180952, -1.680852, 1, 1, 1, 1, 1,
-1.626327, -1.048593, -3.621371, 0, 0, 1, 1, 1,
-1.6248, 0.8648575, -0.3529331, 1, 0, 0, 1, 1,
-1.614853, -1.134655, -2.570602, 1, 0, 0, 1, 1,
-1.613235, -0.09659372, -0.4944962, 1, 0, 0, 1, 1,
-1.602367, -1.697111, -4.045536, 1, 0, 0, 1, 1,
-1.599663, 0.1496666, -0.3056453, 1, 0, 0, 1, 1,
-1.596308, 0.09080818, -0.7267154, 0, 0, 0, 1, 1,
-1.594965, 0.9997958, -0.2610818, 0, 0, 0, 1, 1,
-1.587063, 0.1334307, -2.001033, 0, 0, 0, 1, 1,
-1.564848, 0.7213586, -2.274443, 0, 0, 0, 1, 1,
-1.555753, 0.2650288, -2.381964, 0, 0, 0, 1, 1,
-1.551508, 0.6359379, -2.067314, 0, 0, 0, 1, 1,
-1.544945, 1.866043, -0.6969497, 0, 0, 0, 1, 1,
-1.528009, -0.0279364, 0.4284806, 1, 1, 1, 1, 1,
-1.523082, 0.3520449, -1.518225, 1, 1, 1, 1, 1,
-1.508554, -0.1637272, -2.236648, 1, 1, 1, 1, 1,
-1.498272, -0.2136049, -1.373808, 1, 1, 1, 1, 1,
-1.488026, 2.869237, -0.5474813, 1, 1, 1, 1, 1,
-1.485202, 0.4643854, -2.796879, 1, 1, 1, 1, 1,
-1.467938, 1.971627, -0.2124615, 1, 1, 1, 1, 1,
-1.461759, 1.466498, -1.66124, 1, 1, 1, 1, 1,
-1.454404, 1.971844, -0.7782184, 1, 1, 1, 1, 1,
-1.450117, -0.611276, -1.121216, 1, 1, 1, 1, 1,
-1.431685, -0.09723509, -0.6645814, 1, 1, 1, 1, 1,
-1.42654, -0.9429889, -1.227901, 1, 1, 1, 1, 1,
-1.425603, 1.32937, -2.635038, 1, 1, 1, 1, 1,
-1.420129, 0.7080435, 0.5063523, 1, 1, 1, 1, 1,
-1.416036, -0.4731692, -1.295232, 1, 1, 1, 1, 1,
-1.410517, -0.472209, -0.7553415, 0, 0, 1, 1, 1,
-1.408231, -0.6445585, -3.319412, 1, 0, 0, 1, 1,
-1.407234, -0.08548663, -2.754557, 1, 0, 0, 1, 1,
-1.392516, -2.653528, -3.628669, 1, 0, 0, 1, 1,
-1.378141, -1.275299, -2.855844, 1, 0, 0, 1, 1,
-1.373213, -0.6871309, -1.936511, 1, 0, 0, 1, 1,
-1.363884, 1.714121, -0.7358378, 0, 0, 0, 1, 1,
-1.351851, -1.447485, -1.656235, 0, 0, 0, 1, 1,
-1.344348, 0.6799685, -1.549398, 0, 0, 0, 1, 1,
-1.340701, -0.2179787, -1.379543, 0, 0, 0, 1, 1,
-1.322635, 0.7177411, -2.724786, 0, 0, 0, 1, 1,
-1.319173, 2.202579, -0.939561, 0, 0, 0, 1, 1,
-1.317703, 0.137322, -0.370169, 0, 0, 0, 1, 1,
-1.307255, 1.297921, -0.1048503, 1, 1, 1, 1, 1,
-1.299007, -1.198035, -0.1156305, 1, 1, 1, 1, 1,
-1.297282, -0.5343196, -1.059407, 1, 1, 1, 1, 1,
-1.296216, 0.8816172, -0.2562391, 1, 1, 1, 1, 1,
-1.290204, -0.2625116, -2.555536, 1, 1, 1, 1, 1,
-1.286224, 1.530306, -0.6187448, 1, 1, 1, 1, 1,
-1.268907, -0.7022281, -3.02221, 1, 1, 1, 1, 1,
-1.26692, 0.4007886, -3.020583, 1, 1, 1, 1, 1,
-1.253298, 0.1016396, -2.258104, 1, 1, 1, 1, 1,
-1.233111, 1.114639, 0.5261537, 1, 1, 1, 1, 1,
-1.217681, -0.08525643, -1.189649, 1, 1, 1, 1, 1,
-1.209634, 1.585872, 0.3523808, 1, 1, 1, 1, 1,
-1.208564, 0.582259, -2.610689, 1, 1, 1, 1, 1,
-1.195445, -0.3828914, -1.804014, 1, 1, 1, 1, 1,
-1.192289, 1.004817, -0.4432358, 1, 1, 1, 1, 1,
-1.187879, -0.1731924, -1.456741, 0, 0, 1, 1, 1,
-1.184005, -1.50434, -1.934435, 1, 0, 0, 1, 1,
-1.182891, 0.2411385, -0.06168618, 1, 0, 0, 1, 1,
-1.176121, -0.3162421, -2.398009, 1, 0, 0, 1, 1,
-1.168066, -0.07860616, -1.544363, 1, 0, 0, 1, 1,
-1.165226, 0.9961275, -1.176761, 1, 0, 0, 1, 1,
-1.147643, -0.7687845, -2.122355, 0, 0, 0, 1, 1,
-1.139301, 0.06658053, -1.164653, 0, 0, 0, 1, 1,
-1.131765, -1.341971, -2.142588, 0, 0, 0, 1, 1,
-1.127897, 1.83179, -2.142298, 0, 0, 0, 1, 1,
-1.127378, 0.8507516, -0.8877124, 0, 0, 0, 1, 1,
-1.123355, 1.310466, -1.182899, 0, 0, 0, 1, 1,
-1.123331, 1.121071, -1.159523, 0, 0, 0, 1, 1,
-1.121681, 0.7692166, -1.271188, 1, 1, 1, 1, 1,
-1.11708, 1.593735, -0.7291267, 1, 1, 1, 1, 1,
-1.114622, -0.01917263, -2.003894, 1, 1, 1, 1, 1,
-1.114196, -0.506287, -1.093986, 1, 1, 1, 1, 1,
-1.110214, -2.042299, -3.058266, 1, 1, 1, 1, 1,
-1.105428, 0.2534548, -0.02457716, 1, 1, 1, 1, 1,
-1.095742, 0.252475, -0.962456, 1, 1, 1, 1, 1,
-1.095072, -0.5433066, -4.325485, 1, 1, 1, 1, 1,
-1.090706, -0.05970452, -0.3985881, 1, 1, 1, 1, 1,
-1.087145, -1.843171, -0.9577245, 1, 1, 1, 1, 1,
-1.080179, -2.134955, -2.974192, 1, 1, 1, 1, 1,
-1.079343, 1.462207, -2.080934, 1, 1, 1, 1, 1,
-1.077738, 1.667163, 0.1266011, 1, 1, 1, 1, 1,
-1.077484, 0.973635, -2.668401, 1, 1, 1, 1, 1,
-1.076647, 0.6112319, 0.06569014, 1, 1, 1, 1, 1,
-1.06901, -1.507627, -3.797931, 0, 0, 1, 1, 1,
-1.068621, 0.1585538, -0.696434, 1, 0, 0, 1, 1,
-1.067084, -1.003406, -1.226549, 1, 0, 0, 1, 1,
-1.061107, 0.9792636, -0.7751721, 1, 0, 0, 1, 1,
-1.058698, -1.474301, -2.753303, 1, 0, 0, 1, 1,
-1.057568, -0.06866976, -1.491308, 1, 0, 0, 1, 1,
-1.055923, -0.6858355, -2.541728, 0, 0, 0, 1, 1,
-1.052078, -0.4088605, -2.788479, 0, 0, 0, 1, 1,
-1.048493, 0.2888792, -1.339966, 0, 0, 0, 1, 1,
-1.04826, 0.1374185, -1.308701, 0, 0, 0, 1, 1,
-1.046594, -0.07075597, -2.909739, 0, 0, 0, 1, 1,
-1.036434, 0.628454, -1.478089, 0, 0, 0, 1, 1,
-1.035284, 0.6752327, -1.934198, 0, 0, 0, 1, 1,
-1.02875, -0.9513081, -3.401395, 1, 1, 1, 1, 1,
-1.014538, -0.2550842, -3.274482, 1, 1, 1, 1, 1,
-1.005924, 0.5594038, 0.5654213, 1, 1, 1, 1, 1,
-1.002677, -0.4410813, -1.690382, 1, 1, 1, 1, 1,
-0.999845, 1.914031, 0.5742454, 1, 1, 1, 1, 1,
-0.9950222, 0.4937422, -0.128884, 1, 1, 1, 1, 1,
-0.9938627, -1.6916, -1.467373, 1, 1, 1, 1, 1,
-0.9892883, -0.2843924, -2.323167, 1, 1, 1, 1, 1,
-0.9887294, -0.2831873, -2.500404, 1, 1, 1, 1, 1,
-0.9880941, -0.3637526, -2.236696, 1, 1, 1, 1, 1,
-0.9819666, 0.3541096, -0.4257967, 1, 1, 1, 1, 1,
-0.9783171, -0.3465747, -1.841586, 1, 1, 1, 1, 1,
-0.9719899, -0.5161624, -2.148999, 1, 1, 1, 1, 1,
-0.9689132, 0.394528, -0.6808568, 1, 1, 1, 1, 1,
-0.9647635, 0.1830939, -0.888317, 1, 1, 1, 1, 1,
-0.9554424, 1.035228, 0.8543911, 0, 0, 1, 1, 1,
-0.9426744, 0.2889903, -1.103923, 1, 0, 0, 1, 1,
-0.9238115, 0.8794796, 0.09468542, 1, 0, 0, 1, 1,
-0.9198628, 0.2064453, -1.706014, 1, 0, 0, 1, 1,
-0.9107422, 0.3711767, -2.661483, 1, 0, 0, 1, 1,
-0.9069884, -0.963958, -0.5210972, 1, 0, 0, 1, 1,
-0.9026046, -1.154424, -2.681303, 0, 0, 0, 1, 1,
-0.9014075, 0.6075806, -0.5991715, 0, 0, 0, 1, 1,
-0.8911301, 0.8584135, -0.04602809, 0, 0, 0, 1, 1,
-0.888272, -0.637592, -4.028635, 0, 0, 0, 1, 1,
-0.8792084, 0.1379952, -0.2155783, 0, 0, 0, 1, 1,
-0.8769035, 0.555212, 0.2729719, 0, 0, 0, 1, 1,
-0.8751537, 0.6281567, -1.42224, 0, 0, 0, 1, 1,
-0.8744336, 0.779665, -2.651671, 1, 1, 1, 1, 1,
-0.8736918, -0.1159036, -2.029866, 1, 1, 1, 1, 1,
-0.8731452, -0.1221506, -1.781413, 1, 1, 1, 1, 1,
-0.8667892, -1.513122, -2.441483, 1, 1, 1, 1, 1,
-0.8638198, 1.035486, -0.1989822, 1, 1, 1, 1, 1,
-0.8611684, -0.1845009, -2.804922, 1, 1, 1, 1, 1,
-0.8611357, -0.8277114, -2.35275, 1, 1, 1, 1, 1,
-0.8561334, 0.166732, -3.785959, 1, 1, 1, 1, 1,
-0.8557767, -0.3631334, -2.154032, 1, 1, 1, 1, 1,
-0.8551575, 1.025514, -0.1661044, 1, 1, 1, 1, 1,
-0.8464099, -0.3116884, -0.5153365, 1, 1, 1, 1, 1,
-0.8427792, -0.9573731, -2.86584, 1, 1, 1, 1, 1,
-0.8401187, -0.1738069, -2.263877, 1, 1, 1, 1, 1,
-0.8357594, -0.8147321, -2.348019, 1, 1, 1, 1, 1,
-0.8328434, 0.6005767, -0.2185228, 1, 1, 1, 1, 1,
-0.8314592, 0.7554771, -2.008767, 0, 0, 1, 1, 1,
-0.8243154, -0.6361133, -3.478324, 1, 0, 0, 1, 1,
-0.8161939, -1.278014, -2.702089, 1, 0, 0, 1, 1,
-0.8152181, -1.369987, -1.519562, 1, 0, 0, 1, 1,
-0.8139901, 0.03204151, -0.9051385, 1, 0, 0, 1, 1,
-0.8133, 0.05630068, -2.804631, 1, 0, 0, 1, 1,
-0.8113812, -0.2967927, -1.546651, 0, 0, 0, 1, 1,
-0.8074259, -0.6364415, -2.104913, 0, 0, 0, 1, 1,
-0.8054102, -0.3914489, -1.361708, 0, 0, 0, 1, 1,
-0.7908501, -2.895119, -3.885567, 0, 0, 0, 1, 1,
-0.7841573, -0.2458103, -1.868099, 0, 0, 0, 1, 1,
-0.7840487, -1.029524, -1.600761, 0, 0, 0, 1, 1,
-0.7828857, -0.6310763, -3.319547, 0, 0, 0, 1, 1,
-0.7814324, 1.26548, -0.6609101, 1, 1, 1, 1, 1,
-0.7803096, -1.102036, -2.409867, 1, 1, 1, 1, 1,
-0.778129, -0.6783216, -2.806901, 1, 1, 1, 1, 1,
-0.7776578, -0.4052626, -1.002829, 1, 1, 1, 1, 1,
-0.7757965, -1.17458, -2.455489, 1, 1, 1, 1, 1,
-0.7735536, -0.2037816, -1.205086, 1, 1, 1, 1, 1,
-0.773115, 0.6491613, -0.4504994, 1, 1, 1, 1, 1,
-0.7695296, 1.598866, -1.632178, 1, 1, 1, 1, 1,
-0.7668399, -1.90626, -1.803384, 1, 1, 1, 1, 1,
-0.7595417, 1.01725, 0.09811875, 1, 1, 1, 1, 1,
-0.755656, 1.41112, -0.8176082, 1, 1, 1, 1, 1,
-0.7550426, 0.7202584, -0.1849008, 1, 1, 1, 1, 1,
-0.7517135, 1.290317, -0.8764985, 1, 1, 1, 1, 1,
-0.7503782, -0.5828397, -3.809968, 1, 1, 1, 1, 1,
-0.7502255, -0.1069598, -1.002705, 1, 1, 1, 1, 1,
-0.7429149, -0.643636, -3.561929, 0, 0, 1, 1, 1,
-0.7411141, 0.1326039, -1.778139, 1, 0, 0, 1, 1,
-0.7404787, -0.7390534, -5.104893, 1, 0, 0, 1, 1,
-0.7348254, 0.3283126, 0.003755576, 1, 0, 0, 1, 1,
-0.7344574, -0.303622, -1.00878, 1, 0, 0, 1, 1,
-0.7335389, 2.24157, -0.3453208, 1, 0, 0, 1, 1,
-0.7312715, 1.91062, -0.942223, 0, 0, 0, 1, 1,
-0.7297932, 0.7060643, 0.4018499, 0, 0, 0, 1, 1,
-0.7272077, -1.077122, -2.71659, 0, 0, 0, 1, 1,
-0.7270331, 0.4019699, -0.6003939, 0, 0, 0, 1, 1,
-0.7170622, -1.238033, -2.068197, 0, 0, 0, 1, 1,
-0.714958, -0.008823834, -0.5735582, 0, 0, 0, 1, 1,
-0.7148013, 0.9042493, 1.206964, 0, 0, 0, 1, 1,
-0.7133605, 0.4474347, -0.64858, 1, 1, 1, 1, 1,
-0.7106866, -0.4204462, -3.836214, 1, 1, 1, 1, 1,
-0.7105135, 0.8475261, 1.772704, 1, 1, 1, 1, 1,
-0.7048119, 0.6817041, -0.2437035, 1, 1, 1, 1, 1,
-0.6986408, 0.4762842, -1.706642, 1, 1, 1, 1, 1,
-0.6951312, 1.809426, -1.434091, 1, 1, 1, 1, 1,
-0.6948187, 0.4107722, 0.02910699, 1, 1, 1, 1, 1,
-0.6947668, 0.472777, -2.287875, 1, 1, 1, 1, 1,
-0.6904762, -0.2098233, -0.1524415, 1, 1, 1, 1, 1,
-0.6842899, 0.4032374, -1.199592, 1, 1, 1, 1, 1,
-0.6808107, -0.5161515, -2.087436, 1, 1, 1, 1, 1,
-0.678898, -0.2983122, -3.308794, 1, 1, 1, 1, 1,
-0.6758803, -0.9091617, -4.287559, 1, 1, 1, 1, 1,
-0.6725821, 0.6024137, -0.6749678, 1, 1, 1, 1, 1,
-0.66562, 0.6885694, 1.381868, 1, 1, 1, 1, 1,
-0.6584191, 0.2290698, -1.951113, 0, 0, 1, 1, 1,
-0.6536567, 0.1369584, -0.1627205, 1, 0, 0, 1, 1,
-0.6494061, -0.4788013, -3.713178, 1, 0, 0, 1, 1,
-0.6455347, -1.021805, -3.629849, 1, 0, 0, 1, 1,
-0.6450917, -0.3709294, -2.44607, 1, 0, 0, 1, 1,
-0.6429054, -0.1953948, -1.111468, 1, 0, 0, 1, 1,
-0.6398174, 2.287849, -2.851024, 0, 0, 0, 1, 1,
-0.6374775, -0.7799834, -1.110464, 0, 0, 0, 1, 1,
-0.6322082, -0.9308032, -1.183316, 0, 0, 0, 1, 1,
-0.6298335, -0.7617162, -2.585516, 0, 0, 0, 1, 1,
-0.6239105, 1.258695, -0.2550819, 0, 0, 0, 1, 1,
-0.6209586, -0.2460161, -3.339798, 0, 0, 0, 1, 1,
-0.6173135, 0.4274584, -0.4885381, 0, 0, 0, 1, 1,
-0.6155578, -0.06309282, -1.181346, 1, 1, 1, 1, 1,
-0.6136395, -0.8925676, -1.35136, 1, 1, 1, 1, 1,
-0.6136182, -1.27169, -4.021998, 1, 1, 1, 1, 1,
-0.6116977, 0.04004778, -0.5892711, 1, 1, 1, 1, 1,
-0.6112745, 0.4050773, -1.364259, 1, 1, 1, 1, 1,
-0.6081183, -0.4556346, -1.763409, 1, 1, 1, 1, 1,
-0.6016626, -0.09332313, -2.750278, 1, 1, 1, 1, 1,
-0.5963935, -0.8739405, -3.149016, 1, 1, 1, 1, 1,
-0.5907627, 0.709087, -0.9196792, 1, 1, 1, 1, 1,
-0.5903806, 0.2929717, -0.9586716, 1, 1, 1, 1, 1,
-0.586571, -0.2165658, -1.258094, 1, 1, 1, 1, 1,
-0.5807601, 0.5554962, 0.8295341, 1, 1, 1, 1, 1,
-0.5767041, -1.427823, -4.064931, 1, 1, 1, 1, 1,
-0.5759103, 0.6416671, -0.8347717, 1, 1, 1, 1, 1,
-0.5744926, 0.03958085, -1.488651, 1, 1, 1, 1, 1,
-0.5692139, 2.12654, 0.7086302, 0, 0, 1, 1, 1,
-0.564561, 1.323632, -0.4574901, 1, 0, 0, 1, 1,
-0.5576802, 0.1520833, -0.4661235, 1, 0, 0, 1, 1,
-0.5538006, 0.4248938, -1.893221, 1, 0, 0, 1, 1,
-0.5495935, 3.004933, -0.50571, 1, 0, 0, 1, 1,
-0.5374404, -2.48656, -4.674901, 1, 0, 0, 1, 1,
-0.5372116, -0.2472984, -2.441987, 0, 0, 0, 1, 1,
-0.5330054, 0.7034736, -1.852917, 0, 0, 0, 1, 1,
-0.5317255, 1.340049, 0.7141047, 0, 0, 0, 1, 1,
-0.5257103, 0.3004999, -0.2596902, 0, 0, 0, 1, 1,
-0.5190529, 0.2294517, -1.806237, 0, 0, 0, 1, 1,
-0.5152064, -0.9418169, -2.869012, 0, 0, 0, 1, 1,
-0.5139791, -0.8240235, -2.990743, 0, 0, 0, 1, 1,
-0.5136654, 0.7253709, -0.8736908, 1, 1, 1, 1, 1,
-0.5131924, 1.359252, 0.9832689, 1, 1, 1, 1, 1,
-0.5097038, -0.7928365, -3.430275, 1, 1, 1, 1, 1,
-0.5090797, -0.9964299, -3.806994, 1, 1, 1, 1, 1,
-0.5045587, -1.905407, -1.689476, 1, 1, 1, 1, 1,
-0.5030109, -0.6571325, 0.47258, 1, 1, 1, 1, 1,
-0.5022212, 0.5519065, -2.846334, 1, 1, 1, 1, 1,
-0.4992995, -0.2634375, -1.946522, 1, 1, 1, 1, 1,
-0.4992891, 1.004892, -0.7827073, 1, 1, 1, 1, 1,
-0.4990633, 0.3856714, -1.243107, 1, 1, 1, 1, 1,
-0.4962188, 1.659992, -0.6252752, 1, 1, 1, 1, 1,
-0.4937469, -0.6749288, -3.463582, 1, 1, 1, 1, 1,
-0.4893635, 0.8536021, -0.8928303, 1, 1, 1, 1, 1,
-0.4871675, -0.1709801, -1.636585, 1, 1, 1, 1, 1,
-0.4859735, -1.375239, -3.709001, 1, 1, 1, 1, 1,
-0.485405, 0.3263875, -0.7056212, 0, 0, 1, 1, 1,
-0.4828964, -0.2015646, -1.955903, 1, 0, 0, 1, 1,
-0.4814787, -0.7716361, -3.106239, 1, 0, 0, 1, 1,
-0.4801756, -1.11499, -1.960831, 1, 0, 0, 1, 1,
-0.4779395, -1.112622, -2.059269, 1, 0, 0, 1, 1,
-0.4758688, -0.3319842, -3.750113, 1, 0, 0, 1, 1,
-0.4746001, 1.753663, 0.1603578, 0, 0, 0, 1, 1,
-0.4699391, -0.4078448, -1.159002, 0, 0, 0, 1, 1,
-0.467474, 1.189032, -1.825335, 0, 0, 0, 1, 1,
-0.464267, 0.1535773, -0.3673809, 0, 0, 0, 1, 1,
-0.4579853, -0.6042264, -1.506269, 0, 0, 0, 1, 1,
-0.456666, 1.778922, -0.6540644, 0, 0, 0, 1, 1,
-0.4512735, -0.2382642, -3.099545, 0, 0, 0, 1, 1,
-0.4486585, 0.3338281, 0.2056504, 1, 1, 1, 1, 1,
-0.4427527, -0.3814407, -3.438586, 1, 1, 1, 1, 1,
-0.441611, -0.06752297, -2.935906, 1, 1, 1, 1, 1,
-0.4390205, -0.6562757, -1.377389, 1, 1, 1, 1, 1,
-0.4365836, -0.2069214, -1.91054, 1, 1, 1, 1, 1,
-0.4318289, -0.640409, -3.034538, 1, 1, 1, 1, 1,
-0.4304115, 0.7033093, -1.167169, 1, 1, 1, 1, 1,
-0.4271595, -1.169337, -4.091674, 1, 1, 1, 1, 1,
-0.426232, -0.7288057, -3.292423, 1, 1, 1, 1, 1,
-0.4216154, 0.2501276, 0.330086, 1, 1, 1, 1, 1,
-0.4212998, -0.9237969, -1.520413, 1, 1, 1, 1, 1,
-0.4192885, -0.6060327, -2.558549, 1, 1, 1, 1, 1,
-0.4145236, 1.047463, -0.3072784, 1, 1, 1, 1, 1,
-0.4110423, -0.1242488, -2.843961, 1, 1, 1, 1, 1,
-0.4092343, -0.5544825, -2.641061, 1, 1, 1, 1, 1,
-0.4087079, 0.8220016, 1.389159, 0, 0, 1, 1, 1,
-0.4036283, -0.604925, -2.534673, 1, 0, 0, 1, 1,
-0.4027707, -1.435363, -2.876316, 1, 0, 0, 1, 1,
-0.4009878, -1.26222, -1.478485, 1, 0, 0, 1, 1,
-0.4005472, 0.2022566, -0.7929052, 1, 0, 0, 1, 1,
-0.391658, 1.313711, 0.833662, 1, 0, 0, 1, 1,
-0.3916377, -2.018175, -1.916113, 0, 0, 0, 1, 1,
-0.3900872, 0.9201862, -2.486391, 0, 0, 0, 1, 1,
-0.3862096, 0.7670351, 0.5760078, 0, 0, 0, 1, 1,
-0.3857016, 1.026384, -0.02456917, 0, 0, 0, 1, 1,
-0.3834059, -0.786571, -3.728936, 0, 0, 0, 1, 1,
-0.3813004, 1.280312, -0.0406829, 0, 0, 0, 1, 1,
-0.3731502, -1.613196, -2.869245, 0, 0, 0, 1, 1,
-0.3710202, 1.414724, -0.1352895, 1, 1, 1, 1, 1,
-0.3700134, 2.489073, -2.248564, 1, 1, 1, 1, 1,
-0.3661549, 2.339185, 1.1436, 1, 1, 1, 1, 1,
-0.3648221, -0.2585772, -3.75199, 1, 1, 1, 1, 1,
-0.3592419, -0.02975797, -1.742633, 1, 1, 1, 1, 1,
-0.3572751, 0.8052331, -1.190226, 1, 1, 1, 1, 1,
-0.354551, 2.889408, 0.095103, 1, 1, 1, 1, 1,
-0.3520975, 0.8203197, -0.5794719, 1, 1, 1, 1, 1,
-0.348345, -0.781301, -1.758502, 1, 1, 1, 1, 1,
-0.3422779, -1.924619, -3.789213, 1, 1, 1, 1, 1,
-0.3409206, 1.523521, -0.9865354, 1, 1, 1, 1, 1,
-0.3406734, 1.973075, -0.5859203, 1, 1, 1, 1, 1,
-0.3383883, -2.311971, -2.630607, 1, 1, 1, 1, 1,
-0.3382458, 2.639996, -0.02326059, 1, 1, 1, 1, 1,
-0.3333801, 0.509273, -2.090691, 1, 1, 1, 1, 1,
-0.3310848, -0.5391601, -2.121736, 0, 0, 1, 1, 1,
-0.3271255, 0.4911039, -1.102358, 1, 0, 0, 1, 1,
-0.3250779, -0.1512784, -3.043398, 1, 0, 0, 1, 1,
-0.3215592, 0.6613508, 0.9211996, 1, 0, 0, 1, 1,
-0.3215221, -0.7913492, -2.005339, 1, 0, 0, 1, 1,
-0.317148, 0.7524704, -1.283997, 1, 0, 0, 1, 1,
-0.306565, 1.596628, -0.4484021, 0, 0, 0, 1, 1,
-0.3058138, 0.5885463, -1.322376, 0, 0, 0, 1, 1,
-0.304792, -0.2151951, -1.07041, 0, 0, 0, 1, 1,
-0.2958456, -0.1154768, -3.449233, 0, 0, 0, 1, 1,
-0.2924936, -0.4935999, -3.903471, 0, 0, 0, 1, 1,
-0.291617, -1.022398, -5.394865, 0, 0, 0, 1, 1,
-0.2896281, 0.3437315, -1.191386, 0, 0, 0, 1, 1,
-0.2895735, 0.5953359, 0.03955009, 1, 1, 1, 1, 1,
-0.2888234, -0.3209858, -3.709367, 1, 1, 1, 1, 1,
-0.2864009, -0.9243879, -2.94738, 1, 1, 1, 1, 1,
-0.2676868, -0.5706158, -2.305763, 1, 1, 1, 1, 1,
-0.2613107, -0.484127, -2.314389, 1, 1, 1, 1, 1,
-0.2591847, 1.090725, 0.1425459, 1, 1, 1, 1, 1,
-0.2588996, 0.133521, -2.292359, 1, 1, 1, 1, 1,
-0.2553726, -1.110074, -3.521202, 1, 1, 1, 1, 1,
-0.2544078, -0.3998096, -3.593748, 1, 1, 1, 1, 1,
-0.2532567, 0.4740074, -1.757123, 1, 1, 1, 1, 1,
-0.2529996, -0.2040622, -1.801084, 1, 1, 1, 1, 1,
-0.2497854, -0.8836067, -2.40235, 1, 1, 1, 1, 1,
-0.249378, -0.3683856, -2.527275, 1, 1, 1, 1, 1,
-0.2489833, -0.5395198, -3.03439, 1, 1, 1, 1, 1,
-0.2471575, 1.186248, 0.2064754, 1, 1, 1, 1, 1,
-0.2461196, 0.6751148, 1.601094, 0, 0, 1, 1, 1,
-0.240058, 0.4269084, 0.6021426, 1, 0, 0, 1, 1,
-0.2392301, 0.1918465, -0.9558309, 1, 0, 0, 1, 1,
-0.2384292, 0.9213805, 0.4007327, 1, 0, 0, 1, 1,
-0.2330127, -0.5431, -2.273134, 1, 0, 0, 1, 1,
-0.2326465, 0.7806956, -0.9867237, 1, 0, 0, 1, 1,
-0.2316865, 0.4342158, -0.06775449, 0, 0, 0, 1, 1,
-0.2204625, -0.3554154, -3.695696, 0, 0, 0, 1, 1,
-0.2190062, -0.5009851, -3.080001, 0, 0, 0, 1, 1,
-0.2141421, -1.104302, -3.72095, 0, 0, 0, 1, 1,
-0.2140613, -1.892055, -0.2582487, 0, 0, 0, 1, 1,
-0.2121492, 0.9091178, 0.5519752, 0, 0, 0, 1, 1,
-0.2060135, 0.5334402, -0.9896048, 0, 0, 0, 1, 1,
-0.2041586, 0.3832506, 0.02546813, 1, 1, 1, 1, 1,
-0.2008705, 1.703025, -1.904627, 1, 1, 1, 1, 1,
-0.1998261, 2.171267, 0.4565528, 1, 1, 1, 1, 1,
-0.198638, -0.8837089, -4.945257, 1, 1, 1, 1, 1,
-0.1975084, -0.7874934, -3.477581, 1, 1, 1, 1, 1,
-0.19491, -1.712595, -2.022919, 1, 1, 1, 1, 1,
-0.1942196, 1.388977, 0.138362, 1, 1, 1, 1, 1,
-0.193664, 2.355027, -0.5735682, 1, 1, 1, 1, 1,
-0.1905229, 0.3883426, -0.4103062, 1, 1, 1, 1, 1,
-0.1898814, 0.9923989, -0.4409413, 1, 1, 1, 1, 1,
-0.1880918, -0.6586367, -4.443439, 1, 1, 1, 1, 1,
-0.1877899, 0.6232637, -0.2610938, 1, 1, 1, 1, 1,
-0.1761488, 0.1558643, -0.1398816, 1, 1, 1, 1, 1,
-0.1717816, 0.6350435, -1.450521, 1, 1, 1, 1, 1,
-0.1709667, -0.8018082, -1.670414, 1, 1, 1, 1, 1,
-0.1707795, 1.339887, 1.350133, 0, 0, 1, 1, 1,
-0.1659428, -0.5637025, -1.25974, 1, 0, 0, 1, 1,
-0.1650682, 2.011761, -0.4058264, 1, 0, 0, 1, 1,
-0.1638793, 0.8046134, -0.6902589, 1, 0, 0, 1, 1,
-0.1516432, 0.8657298, -1.127505, 1, 0, 0, 1, 1,
-0.1462, 1.259652, -0.4033797, 1, 0, 0, 1, 1,
-0.1459648, 0.5625782, -0.7611886, 0, 0, 0, 1, 1,
-0.1446573, -1.101986, -3.47353, 0, 0, 0, 1, 1,
-0.1409244, 1.02418, -1.614353, 0, 0, 0, 1, 1,
-0.1369718, -0.1332173, -2.295519, 0, 0, 0, 1, 1,
-0.1348348, -0.5597406, -3.324361, 0, 0, 0, 1, 1,
-0.1305734, 1.185101, -0.7006826, 0, 0, 0, 1, 1,
-0.130553, -0.007617194, -0.7810965, 0, 0, 0, 1, 1,
-0.1289089, 1.549353, 0.3309516, 1, 1, 1, 1, 1,
-0.1258852, -0.190992, -2.228971, 1, 1, 1, 1, 1,
-0.1119466, -0.9662353, -1.883076, 1, 1, 1, 1, 1,
-0.1107207, 0.2933806, -1.323252, 1, 1, 1, 1, 1,
-0.1105424, -0.2785733, -3.167221, 1, 1, 1, 1, 1,
-0.1064697, 0.1082003, 0.2984113, 1, 1, 1, 1, 1,
-0.1019779, 0.922627, -0.6932861, 1, 1, 1, 1, 1,
-0.1017339, -1.393067, -2.450731, 1, 1, 1, 1, 1,
-0.09226798, -0.8168476, -2.296201, 1, 1, 1, 1, 1,
-0.09149719, 0.9883449, -1.046819, 1, 1, 1, 1, 1,
-0.08490373, 0.8133073, 0.5219263, 1, 1, 1, 1, 1,
-0.07627354, 1.069901, 0.6138309, 1, 1, 1, 1, 1,
-0.07082833, -0.1863111, -1.820821, 1, 1, 1, 1, 1,
-0.06982259, 2.2719, 0.8236318, 1, 1, 1, 1, 1,
-0.06965644, -0.4419175, -3.053448, 1, 1, 1, 1, 1,
-0.0688142, 0.8200228, 0.8014006, 0, 0, 1, 1, 1,
-0.06829935, -0.05852868, -3.585228, 1, 0, 0, 1, 1,
-0.06727852, -0.7587233, -4.323001, 1, 0, 0, 1, 1,
-0.06646496, 0.002571315, -2.693868, 1, 0, 0, 1, 1,
-0.06580357, -0.1583036, -2.788266, 1, 0, 0, 1, 1,
-0.06426997, 1.646287, 0.3184794, 1, 0, 0, 1, 1,
-0.06347568, -1.267318, -3.772334, 0, 0, 0, 1, 1,
-0.06229014, 0.1815343, 0.00374545, 0, 0, 0, 1, 1,
-0.06135889, 1.506035, 0.0295443, 0, 0, 0, 1, 1,
-0.05913277, -0.2462319, -1.102492, 0, 0, 0, 1, 1,
-0.05698539, -0.8689829, -3.267839, 0, 0, 0, 1, 1,
-0.05565243, -0.531837, -1.577151, 0, 0, 0, 1, 1,
-0.0536717, 0.9839124, -0.8386512, 0, 0, 0, 1, 1,
-0.05311516, 1.101556, -0.5983119, 1, 1, 1, 1, 1,
-0.05100745, -1.26824, -3.64997, 1, 1, 1, 1, 1,
-0.04916523, -0.545682, -2.26652, 1, 1, 1, 1, 1,
-0.04398129, -0.9157453, -3.097507, 1, 1, 1, 1, 1,
-0.04304194, 0.3544644, 0.5341757, 1, 1, 1, 1, 1,
-0.03924489, -1.905873, -2.71739, 1, 1, 1, 1, 1,
-0.03729638, -0.7343805, -3.541284, 1, 1, 1, 1, 1,
-0.0371456, 0.8256895, -0.4833366, 1, 1, 1, 1, 1,
-0.03335794, -0.8219485, -4.718625, 1, 1, 1, 1, 1,
-0.02851614, 0.7088557, 0.04917323, 1, 1, 1, 1, 1,
-0.02640744, -0.1995312, -1.570001, 1, 1, 1, 1, 1,
-0.02458226, 0.9632595, -0.4493305, 1, 1, 1, 1, 1,
-0.02330021, 0.2099102, -0.1072935, 1, 1, 1, 1, 1,
-0.01617963, -1.001742, -3.574562, 1, 1, 1, 1, 1,
-0.01450003, -0.7349572, -3.930368, 1, 1, 1, 1, 1,
-0.01424992, -0.866308, -2.53465, 0, 0, 1, 1, 1,
-0.0138671, -0.242546, -4.077744, 1, 0, 0, 1, 1,
-0.01272578, 1.347259, -1.150779, 1, 0, 0, 1, 1,
-0.006439673, 1.392547, 0.2081218, 1, 0, 0, 1, 1,
-0.005962345, 1.439484, 1.714995, 1, 0, 0, 1, 1,
-0.005718049, -1.006845, -2.643722, 1, 0, 0, 1, 1,
-0.005609896, 0.1918463, 1.628129, 0, 0, 0, 1, 1,
-0.001735498, -0.3147424, -3.336672, 0, 0, 0, 1, 1,
0.004174246, -1.089904, 3.857038, 0, 0, 0, 1, 1,
0.005616891, 1.425926, 0.4406867, 0, 0, 0, 1, 1,
0.007142803, 0.4817797, 2.70427, 0, 0, 0, 1, 1,
0.01495053, -0.6997116, 3.557236, 0, 0, 0, 1, 1,
0.01829118, -1.801702, 5.389086, 0, 0, 0, 1, 1,
0.02690505, 0.9157664, 0.1680185, 1, 1, 1, 1, 1,
0.02898421, -0.01849935, 3.393417, 1, 1, 1, 1, 1,
0.03280894, 0.3706376, -0.7847858, 1, 1, 1, 1, 1,
0.03447772, 0.4918707, 2.040236, 1, 1, 1, 1, 1,
0.03904047, -0.8415747, 3.087339, 1, 1, 1, 1, 1,
0.04030916, 0.8505368, 1.817924, 1, 1, 1, 1, 1,
0.04172703, 0.9619646, 0.135295, 1, 1, 1, 1, 1,
0.04354902, -0.7191598, 3.094321, 1, 1, 1, 1, 1,
0.05159235, -1.543025, 3.113675, 1, 1, 1, 1, 1,
0.05409087, 0.2746477, 2.102759, 1, 1, 1, 1, 1,
0.05898958, 1.400203, 2.591659, 1, 1, 1, 1, 1,
0.06071618, 0.2758873, 1.520867, 1, 1, 1, 1, 1,
0.06259926, 0.4580843, 0.07426258, 1, 1, 1, 1, 1,
0.06595286, -0.5278742, 2.608629, 1, 1, 1, 1, 1,
0.06807927, 0.8755475, 0.523424, 1, 1, 1, 1, 1,
0.06835867, 0.9838036, 0.1618832, 0, 0, 1, 1, 1,
0.07076224, -0.8763723, 2.943284, 1, 0, 0, 1, 1,
0.07424048, 0.82792, 0.2374848, 1, 0, 0, 1, 1,
0.07438544, 1.476088, -0.02085086, 1, 0, 0, 1, 1,
0.07973487, 1.662913, 0.1239555, 1, 0, 0, 1, 1,
0.07986456, 0.005413167, 2.10287, 1, 0, 0, 1, 1,
0.08553831, -0.481452, 1.205756, 0, 0, 0, 1, 1,
0.0864218, 1.683109, -1.440542, 0, 0, 0, 1, 1,
0.08804021, -1.526507, 2.864955, 0, 0, 0, 1, 1,
0.09288191, 1.194349, 0.5186982, 0, 0, 0, 1, 1,
0.09369978, 2.95875, -0.743089, 0, 0, 0, 1, 1,
0.09942593, 1.244731, 2.010992, 0, 0, 0, 1, 1,
0.1034604, 2.707667, 0.8345289, 0, 0, 0, 1, 1,
0.1079142, -0.8195351, 3.331008, 1, 1, 1, 1, 1,
0.1080396, 0.1871316, -0.4214484, 1, 1, 1, 1, 1,
0.108205, 0.5206153, 0.1202339, 1, 1, 1, 1, 1,
0.1105846, -0.5402727, 2.822023, 1, 1, 1, 1, 1,
0.1110841, 0.9931555, 0.9616062, 1, 1, 1, 1, 1,
0.1143654, 1.504419, 0.5002198, 1, 1, 1, 1, 1,
0.1150202, -0.8551695, 3.88273, 1, 1, 1, 1, 1,
0.1152983, -1.245232, 2.872962, 1, 1, 1, 1, 1,
0.1185838, -0.2169144, 2.83779, 1, 1, 1, 1, 1,
0.1202354, -0.4345893, 3.521181, 1, 1, 1, 1, 1,
0.1217163, 0.8964373, 1.086164, 1, 1, 1, 1, 1,
0.1231252, 0.01084042, 2.897121, 1, 1, 1, 1, 1,
0.1251043, 1.610643, 0.2970285, 1, 1, 1, 1, 1,
0.1305769, 0.7064934, -1.843823, 1, 1, 1, 1, 1,
0.1309083, 0.7087932, -0.6235185, 1, 1, 1, 1, 1,
0.1310879, 0.3807862, 0.1541935, 0, 0, 1, 1, 1,
0.1336274, 1.125476, 0.9048502, 1, 0, 0, 1, 1,
0.135832, 1.013793, -0.3428851, 1, 0, 0, 1, 1,
0.1405984, 0.1454325, 2.14466, 1, 0, 0, 1, 1,
0.1409634, -0.1722707, 2.046684, 1, 0, 0, 1, 1,
0.1413919, -1.132373, 3.366607, 1, 0, 0, 1, 1,
0.1422383, 0.486211, -0.3286178, 0, 0, 0, 1, 1,
0.1424916, -0.2703655, 0.7747114, 0, 0, 0, 1, 1,
0.1436789, 0.6644722, 0.4419473, 0, 0, 0, 1, 1,
0.1472968, 0.7584151, 0.5422369, 0, 0, 0, 1, 1,
0.1473499, 0.320804, 0.9479502, 0, 0, 0, 1, 1,
0.148583, -0.3004503, 3.339831, 0, 0, 0, 1, 1,
0.1508689, 0.5971147, 2.039107, 0, 0, 0, 1, 1,
0.1551579, -0.7677405, 4.528074, 1, 1, 1, 1, 1,
0.163099, 1.584657, 0.7326149, 1, 1, 1, 1, 1,
0.1659182, 0.01879114, 2.268758, 1, 1, 1, 1, 1,
0.1659227, 0.03216665, 0.1964244, 1, 1, 1, 1, 1,
0.1671004, -2.072602, 3.065406, 1, 1, 1, 1, 1,
0.1673644, -0.6510127, 1.919132, 1, 1, 1, 1, 1,
0.1675101, 0.5554467, 0.842678, 1, 1, 1, 1, 1,
0.1759588, -1.499875, 3.339727, 1, 1, 1, 1, 1,
0.1805549, -1.306371, 2.303289, 1, 1, 1, 1, 1,
0.1809808, -1.841267, 4.176676, 1, 1, 1, 1, 1,
0.1818728, 1.486968, -0.601827, 1, 1, 1, 1, 1,
0.1863902, 0.6858844, 0.05282196, 1, 1, 1, 1, 1,
0.1880118, -0.5219571, 3.111391, 1, 1, 1, 1, 1,
0.1910644, 1.294105, 0.2647076, 1, 1, 1, 1, 1,
0.1928605, 0.5232146, 1.767556, 1, 1, 1, 1, 1,
0.1972622, -0.336163, 2.313618, 0, 0, 1, 1, 1,
0.2000045, 1.102957, -0.04097288, 1, 0, 0, 1, 1,
0.2017843, 0.9924543, -0.007237575, 1, 0, 0, 1, 1,
0.2027413, -1.012056, 2.998186, 1, 0, 0, 1, 1,
0.2030375, -0.7255041, 2.111367, 1, 0, 0, 1, 1,
0.2031747, -2.220328, 2.790524, 1, 0, 0, 1, 1,
0.2040921, -1.931934, 3.913291, 0, 0, 0, 1, 1,
0.2044678, 0.4632924, 1.298955, 0, 0, 0, 1, 1,
0.2053024, -0.3772708, 3.082625, 0, 0, 0, 1, 1,
0.2093789, 0.4800644, 2.409132, 0, 0, 0, 1, 1,
0.2094228, 1.027359, 0.148493, 0, 0, 0, 1, 1,
0.2195327, -0.153804, 0.9805041, 0, 0, 0, 1, 1,
0.2198635, 0.7678238, -0.6027445, 0, 0, 0, 1, 1,
0.2199096, 0.9123, -0.5489623, 1, 1, 1, 1, 1,
0.2205178, 0.6567206, 0.1012296, 1, 1, 1, 1, 1,
0.2211054, -0.3161474, 2.95454, 1, 1, 1, 1, 1,
0.2223682, 0.4424708, 0.9028841, 1, 1, 1, 1, 1,
0.2239269, -1.73866, 4.073507, 1, 1, 1, 1, 1,
0.2269255, 1.545397, -0.2630692, 1, 1, 1, 1, 1,
0.2301107, 0.3117234, 0.2533889, 1, 1, 1, 1, 1,
0.2307681, -0.8219349, 3.454024, 1, 1, 1, 1, 1,
0.2343431, -1.981553, 3.75249, 1, 1, 1, 1, 1,
0.2356343, -0.1517911, 2.747518, 1, 1, 1, 1, 1,
0.2402095, 1.829616, -1.277575, 1, 1, 1, 1, 1,
0.2410804, 1.286972, -0.7130383, 1, 1, 1, 1, 1,
0.2442384, 0.1585342, 0.6414023, 1, 1, 1, 1, 1,
0.2477771, -0.6255601, 1.878965, 1, 1, 1, 1, 1,
0.2521585, 0.4041142, 0.7425521, 1, 1, 1, 1, 1,
0.2534702, 0.0781935, -0.004405997, 0, 0, 1, 1, 1,
0.2566274, 0.01538324, 0.7334717, 1, 0, 0, 1, 1,
0.2597454, -0.3144449, 3.117812, 1, 0, 0, 1, 1,
0.2603399, 1.442897, 2.015844, 1, 0, 0, 1, 1,
0.2613975, 1.396622, 1.434317, 1, 0, 0, 1, 1,
0.2617342, -1.703189, 3.304202, 1, 0, 0, 1, 1,
0.2661358, -0.5389462, 3.606047, 0, 0, 0, 1, 1,
0.2707101, -0.3365449, 1.635917, 0, 0, 0, 1, 1,
0.2766191, 0.579506, 1.373351, 0, 0, 0, 1, 1,
0.2789679, -0.6215158, 2.020619, 0, 0, 0, 1, 1,
0.2813581, 0.8440426, -0.06139012, 0, 0, 0, 1, 1,
0.2859581, 1.229741, -0.5797061, 0, 0, 0, 1, 1,
0.2879387, -1.64217, 3.466627, 0, 0, 0, 1, 1,
0.2892574, -0.8292118, 3.991219, 1, 1, 1, 1, 1,
0.29655, 0.7301538, -0.39813, 1, 1, 1, 1, 1,
0.2968199, 0.1092932, 1.826372, 1, 1, 1, 1, 1,
0.3033565, 0.4082704, -0.2909083, 1, 1, 1, 1, 1,
0.3044489, -2.256594, 2.520931, 1, 1, 1, 1, 1,
0.3055812, 0.01657068, 0.5107874, 1, 1, 1, 1, 1,
0.3085223, -0.8245047, 2.983243, 1, 1, 1, 1, 1,
0.3164666, 0.05670456, 1.107309, 1, 1, 1, 1, 1,
0.3165564, -0.6326857, 3.78421, 1, 1, 1, 1, 1,
0.3188811, 0.4377443, 0.7760632, 1, 1, 1, 1, 1,
0.3212122, -0.5446517, 1.301139, 1, 1, 1, 1, 1,
0.3272345, 1.501113, 1.325078, 1, 1, 1, 1, 1,
0.3293597, -1.034823, 2.474248, 1, 1, 1, 1, 1,
0.3294445, -0.4343722, 2.133705, 1, 1, 1, 1, 1,
0.332618, -1.650355, 3.160282, 1, 1, 1, 1, 1,
0.3335955, -0.3336987, 0.601485, 0, 0, 1, 1, 1,
0.3343387, -0.8924702, 0.900098, 1, 0, 0, 1, 1,
0.335524, -1.171132, 1.259086, 1, 0, 0, 1, 1,
0.3381622, 0.1114269, 3.411304, 1, 0, 0, 1, 1,
0.34014, -1.307175, 3.557379, 1, 0, 0, 1, 1,
0.3411596, -0.6016357, 1.596675, 1, 0, 0, 1, 1,
0.3433321, 0.615387, 0.2710264, 0, 0, 0, 1, 1,
0.3439282, 0.8285809, -1.283327, 0, 0, 0, 1, 1,
0.3461222, 0.4261849, 2.460019, 0, 0, 0, 1, 1,
0.3478341, -0.3169948, 2.135154, 0, 0, 0, 1, 1,
0.3481879, -1.753957, 1.966027, 0, 0, 0, 1, 1,
0.3494645, -0.4889118, 2.790191, 0, 0, 0, 1, 1,
0.3497238, 0.309901, 1.051358, 0, 0, 0, 1, 1,
0.3519059, -0.569883, 2.543437, 1, 1, 1, 1, 1,
0.3534012, 0.1827097, 2.192657, 1, 1, 1, 1, 1,
0.3534758, 0.6330444, 1.801063, 1, 1, 1, 1, 1,
0.3537477, -0.7580453, 3.458184, 1, 1, 1, 1, 1,
0.3548929, 0.7776176, 0.7194096, 1, 1, 1, 1, 1,
0.358719, 0.3118457, -1.052553, 1, 1, 1, 1, 1,
0.359256, 0.8035588, 0.5103233, 1, 1, 1, 1, 1,
0.3629982, -0.6264127, 3.680123, 1, 1, 1, 1, 1,
0.3675254, 1.705265, 1.321776, 1, 1, 1, 1, 1,
0.3706313, -0.5793712, 2.2838, 1, 1, 1, 1, 1,
0.3718003, 0.9069387, 0.4699703, 1, 1, 1, 1, 1,
0.3734362, 0.3847602, 1.598298, 1, 1, 1, 1, 1,
0.3745034, -0.4349402, 0.8715333, 1, 1, 1, 1, 1,
0.375303, 0.989279, -0.5809415, 1, 1, 1, 1, 1,
0.375349, -0.2943445, -0.02513606, 1, 1, 1, 1, 1,
0.3759231, 1.30708, 0.6514652, 0, 0, 1, 1, 1,
0.3765869, 0.3157217, 1.578939, 1, 0, 0, 1, 1,
0.3790703, -0.8510248, 2.61828, 1, 0, 0, 1, 1,
0.3808764, -0.6973762, 3.558401, 1, 0, 0, 1, 1,
0.3823383, 2.125335, -0.7175963, 1, 0, 0, 1, 1,
0.3835641, -0.8876722, 3.760844, 1, 0, 0, 1, 1,
0.3860421, -1.22667, 2.98467, 0, 0, 0, 1, 1,
0.3867765, -0.07204414, 3.951122, 0, 0, 0, 1, 1,
0.3935675, -0.3705063, 3.642931, 0, 0, 0, 1, 1,
0.3953561, -1.084416, 3.742252, 0, 0, 0, 1, 1,
0.4029923, -1.774838, 3.323398, 0, 0, 0, 1, 1,
0.4037206, 2.594761, 0.1749782, 0, 0, 0, 1, 1,
0.4053367, -0.08129474, 2.131861, 0, 0, 0, 1, 1,
0.4054987, 0.4374335, 2.033131, 1, 1, 1, 1, 1,
0.4061346, 1.969973, -1.017249, 1, 1, 1, 1, 1,
0.4095137, -1.696037, 2.715183, 1, 1, 1, 1, 1,
0.4101706, -1.005828, 4.251657, 1, 1, 1, 1, 1,
0.41039, 0.07077188, 0.311452, 1, 1, 1, 1, 1,
0.41328, 0.5401796, 0.8830184, 1, 1, 1, 1, 1,
0.4136412, 1.278552, 0.7888272, 1, 1, 1, 1, 1,
0.4142388, 1.609496, 0.1828286, 1, 1, 1, 1, 1,
0.4220552, -0.2815209, 3.597512, 1, 1, 1, 1, 1,
0.4242491, 0.525768, 0.5030292, 1, 1, 1, 1, 1,
0.4257354, -0.3295405, 2.281605, 1, 1, 1, 1, 1,
0.4266227, 1.541484, 0.520807, 1, 1, 1, 1, 1,
0.4281157, 0.5894871, 1.398229, 1, 1, 1, 1, 1,
0.4288022, -0.25569, 2.138935, 1, 1, 1, 1, 1,
0.4305376, 1.206432, 0.5102453, 1, 1, 1, 1, 1,
0.4310508, -1.235869, 4.858283, 0, 0, 1, 1, 1,
0.4320498, 1.401685, -1.303023, 1, 0, 0, 1, 1,
0.433005, -0.6220506, 0.4650904, 1, 0, 0, 1, 1,
0.433944, -0.5715894, 3.240553, 1, 0, 0, 1, 1,
0.4340108, 0.5014131, 0.3456812, 1, 0, 0, 1, 1,
0.4346684, -1.764893, 2.900576, 1, 0, 0, 1, 1,
0.4401036, -0.3460142, 3.79618, 0, 0, 0, 1, 1,
0.4412697, -0.7493424, 0.9850689, 0, 0, 0, 1, 1,
0.4414302, -0.1943706, 2.814564, 0, 0, 0, 1, 1,
0.444864, -0.4146546, 2.891758, 0, 0, 0, 1, 1,
0.4480084, 0.6259716, 1.592102, 0, 0, 0, 1, 1,
0.4507935, -0.7365001, 1.590156, 0, 0, 0, 1, 1,
0.4565478, 0.7433595, 0.4528186, 0, 0, 0, 1, 1,
0.4582134, -0.5576171, 1.521013, 1, 1, 1, 1, 1,
0.4608417, -0.6131354, 2.793937, 1, 1, 1, 1, 1,
0.4611976, 0.2001207, -0.6322647, 1, 1, 1, 1, 1,
0.4669653, 1.437847, 0.9105718, 1, 1, 1, 1, 1,
0.4676076, 0.6712071, -0.7724928, 1, 1, 1, 1, 1,
0.4704499, 0.1225959, 1.093586, 1, 1, 1, 1, 1,
0.4714701, -0.3226062, 2.24905, 1, 1, 1, 1, 1,
0.4746614, -1.011243, 2.548206, 1, 1, 1, 1, 1,
0.4754516, -0.2934684, 2.230332, 1, 1, 1, 1, 1,
0.4779928, 2.015915, -1.003252, 1, 1, 1, 1, 1,
0.4803404, -0.4126415, 2.445682, 1, 1, 1, 1, 1,
0.4837549, -0.3242914, 1.266384, 1, 1, 1, 1, 1,
0.4838597, 0.1695651, 0.8348461, 1, 1, 1, 1, 1,
0.4850882, 0.003676623, 0.5894346, 1, 1, 1, 1, 1,
0.4900083, 1.90403, -1.281746, 1, 1, 1, 1, 1,
0.4907992, 1.247441, -0.3793374, 0, 0, 1, 1, 1,
0.4943728, -1.654538, 3.098429, 1, 0, 0, 1, 1,
0.4957628, -0.4907184, 3.081399, 1, 0, 0, 1, 1,
0.4958375, 0.3943141, 2.750198, 1, 0, 0, 1, 1,
0.4965361, 1.038112, 1.403941, 1, 0, 0, 1, 1,
0.4972836, -0.2771181, 2.667948, 1, 0, 0, 1, 1,
0.4976902, 0.8374478, 1.600422, 0, 0, 0, 1, 1,
0.4998012, -1.054124, 4.08331, 0, 0, 0, 1, 1,
0.5005469, -1.044608, 3.220222, 0, 0, 0, 1, 1,
0.5072098, 0.2013623, 2.163908, 0, 0, 0, 1, 1,
0.5079415, 1.966047, -0.006529084, 0, 0, 0, 1, 1,
0.5080695, 0.7541089, 0.9474227, 0, 0, 0, 1, 1,
0.5083976, 0.6050297, 1.505026, 0, 0, 0, 1, 1,
0.5094287, -0.7770761, 1.995615, 1, 1, 1, 1, 1,
0.5120729, -0.6903241, 1.612671, 1, 1, 1, 1, 1,
0.513819, 1.462928, -0.03752412, 1, 1, 1, 1, 1,
0.5189535, -0.7347401, 3.536068, 1, 1, 1, 1, 1,
0.5222983, -0.02486037, 0.7286926, 1, 1, 1, 1, 1,
0.5227256, -0.5173653, 3.219283, 1, 1, 1, 1, 1,
0.5243476, -0.0843685, 1.02079, 1, 1, 1, 1, 1,
0.5245364, -1.671874, 2.273737, 1, 1, 1, 1, 1,
0.5310516, -0.5755299, 2.512654, 1, 1, 1, 1, 1,
0.5351322, -2.035768, 2.40476, 1, 1, 1, 1, 1,
0.5396985, -0.723973, 2.983036, 1, 1, 1, 1, 1,
0.5409978, 1.010081, -0.5800731, 1, 1, 1, 1, 1,
0.5502984, -1.297123, 2.724571, 1, 1, 1, 1, 1,
0.5533376, 0.4040235, 0.3712241, 1, 1, 1, 1, 1,
0.5597372, -1.102427, 1.614454, 1, 1, 1, 1, 1,
0.5611131, 0.6364627, 1.721649, 0, 0, 1, 1, 1,
0.562737, 0.2235265, 1.762806, 1, 0, 0, 1, 1,
0.5639087, -0.7176139, 3.589566, 1, 0, 0, 1, 1,
0.5651706, -0.3867167, 3.136595, 1, 0, 0, 1, 1,
0.5731396, -0.241976, 2.322828, 1, 0, 0, 1, 1,
0.5758237, -0.03774237, 1.239199, 1, 0, 0, 1, 1,
0.5788178, -0.2248952, 1.871721, 0, 0, 0, 1, 1,
0.5892798, -2.585001, 4.386239, 0, 0, 0, 1, 1,
0.5900257, 0.5523415, 0.840647, 0, 0, 0, 1, 1,
0.5989127, -1.13542, 2.741473, 0, 0, 0, 1, 1,
0.5993922, -0.811657, 2.917726, 0, 0, 0, 1, 1,
0.5995546, -0.2013762, 3.074021, 0, 0, 0, 1, 1,
0.6162341, -0.1998439, 1.366336, 0, 0, 0, 1, 1,
0.6168678, 1.797173, 0.5177095, 1, 1, 1, 1, 1,
0.6182974, -0.3937533, 0.8642147, 1, 1, 1, 1, 1,
0.6220395, 0.8171642, 0.8642789, 1, 1, 1, 1, 1,
0.6239843, 0.3235425, 1.282285, 1, 1, 1, 1, 1,
0.6241202, -1.117259, 2.068183, 1, 1, 1, 1, 1,
0.6289082, 1.061841, 1.059374, 1, 1, 1, 1, 1,
0.6298286, 1.909741, -0.629144, 1, 1, 1, 1, 1,
0.6340235, -0.598128, 2.748765, 1, 1, 1, 1, 1,
0.6359022, -0.6515301, 2.392424, 1, 1, 1, 1, 1,
0.6386502, 0.1851507, 2.52563, 1, 1, 1, 1, 1,
0.6476014, 1.096136, 2.768446, 1, 1, 1, 1, 1,
0.6519004, -0.02025776, 0.4814432, 1, 1, 1, 1, 1,
0.6554599, -1.932083, 4.059147, 1, 1, 1, 1, 1,
0.6557875, 0.8334472, 0.4054645, 1, 1, 1, 1, 1,
0.6577839, 0.2018085, 1.213849, 1, 1, 1, 1, 1,
0.658145, 0.7902142, 0.631755, 0, 0, 1, 1, 1,
0.6601644, -0.2565066, 2.438569, 1, 0, 0, 1, 1,
0.664625, 0.6289737, -0.7569943, 1, 0, 0, 1, 1,
0.6685437, 0.4216048, 1.503901, 1, 0, 0, 1, 1,
0.6701375, -0.9099103, 3.399335, 1, 0, 0, 1, 1,
0.6797359, -0.09649648, 2.246916, 1, 0, 0, 1, 1,
0.6814329, -0.411469, 1.177689, 0, 0, 0, 1, 1,
0.691664, 0.5618556, 2.149267, 0, 0, 0, 1, 1,
0.6955885, 1.037421, 1.340238, 0, 0, 0, 1, 1,
0.698978, -0.9725014, 2.06923, 0, 0, 0, 1, 1,
0.7021201, -0.1582917, 1.334484, 0, 0, 0, 1, 1,
0.7128279, 1.519857, 0.3140492, 0, 0, 0, 1, 1,
0.7173363, 0.2032075, 1.74837, 0, 0, 0, 1, 1,
0.7176467, 1.563948, 2.548449, 1, 1, 1, 1, 1,
0.7185876, 0.7567614, 1.188508, 1, 1, 1, 1, 1,
0.7236537, -0.005792684, 1.378255, 1, 1, 1, 1, 1,
0.7262225, 0.5773643, -2.003699, 1, 1, 1, 1, 1,
0.7282534, 0.1306318, 1.979176, 1, 1, 1, 1, 1,
0.7283182, -2.719801, 2.793881, 1, 1, 1, 1, 1,
0.7303024, 0.9267995, -1.01858, 1, 1, 1, 1, 1,
0.7361019, -1.275138, 2.873447, 1, 1, 1, 1, 1,
0.7372818, 0.1181896, 1.105358, 1, 1, 1, 1, 1,
0.7378332, 0.2964883, 0.3238843, 1, 1, 1, 1, 1,
0.7399391, 2.046742, 1.528393, 1, 1, 1, 1, 1,
0.7404317, 0.5296067, 0.9515178, 1, 1, 1, 1, 1,
0.7443715, 0.3916828, 0.6004596, 1, 1, 1, 1, 1,
0.7500799, 0.5000013, 2.465687, 1, 1, 1, 1, 1,
0.7522439, 0.1857452, 3.481858, 1, 1, 1, 1, 1,
0.7647392, 0.6953263, 1.93647, 0, 0, 1, 1, 1,
0.7662418, 0.9854254, 1.163833, 1, 0, 0, 1, 1,
0.7679207, -0.850627, 3.420322, 1, 0, 0, 1, 1,
0.7716339, -0.2091298, 2.517428, 1, 0, 0, 1, 1,
0.774892, 0.2793814, 1.758829, 1, 0, 0, 1, 1,
0.7775367, -0.01566317, 0.7036631, 1, 0, 0, 1, 1,
0.7823341, -0.2908906, 1.472145, 0, 0, 0, 1, 1,
0.7839447, -0.6367524, 3.296502, 0, 0, 0, 1, 1,
0.7849287, 0.1371516, -0.3382785, 0, 0, 0, 1, 1,
0.7930214, 0.7039412, 0.04824836, 0, 0, 0, 1, 1,
0.7932228, 0.1269355, 0.1243151, 0, 0, 0, 1, 1,
0.7932832, 0.904628, 0.7607638, 0, 0, 0, 1, 1,
0.8001925, -0.2230428, 2.052248, 0, 0, 0, 1, 1,
0.8028802, 0.6848876, 2.508672, 1, 1, 1, 1, 1,
0.8078931, 0.7425882, 0.630161, 1, 1, 1, 1, 1,
0.8084961, 1.16873, -0.7855721, 1, 1, 1, 1, 1,
0.8111631, 0.2791333, 2.48762, 1, 1, 1, 1, 1,
0.8147622, 1.062962, 1.070151, 1, 1, 1, 1, 1,
0.8169361, 0.9801604, 2.327035, 1, 1, 1, 1, 1,
0.8225312, 0.7941534, 0.6076067, 1, 1, 1, 1, 1,
0.8252412, 1.373685, 2.130551, 1, 1, 1, 1, 1,
0.8295082, 0.7879908, 0.4753777, 1, 1, 1, 1, 1,
0.8322355, -1.382771, 3.288003, 1, 1, 1, 1, 1,
0.8334261, -1.208678, 4.048327, 1, 1, 1, 1, 1,
0.8335187, -0.2755849, 0.6087267, 1, 1, 1, 1, 1,
0.8422618, 0.8480384, 1.100599, 1, 1, 1, 1, 1,
0.8466524, 0.9928468, 2.424797, 1, 1, 1, 1, 1,
0.8507106, 0.1224812, 2.772257, 1, 1, 1, 1, 1,
0.8569188, 0.695479, 0.7634455, 0, 0, 1, 1, 1,
0.8620993, -2.853066, 3.739757, 1, 0, 0, 1, 1,
0.8623428, 2.002273, -0.8874458, 1, 0, 0, 1, 1,
0.8629876, 0.2071514, 0.571621, 1, 0, 0, 1, 1,
0.8716021, 2.165813, -0.2267217, 1, 0, 0, 1, 1,
0.8746715, 0.6865859, 1.10462, 1, 0, 0, 1, 1,
0.876383, -0.3064886, 0.7735375, 0, 0, 0, 1, 1,
0.878444, 0.1933652, 3.376206, 0, 0, 0, 1, 1,
0.8809705, 0.5154486, 1.454932, 0, 0, 0, 1, 1,
0.8887356, -0.4425963, 2.958776, 0, 0, 0, 1, 1,
0.8943325, -1.009465, 3.597022, 0, 0, 0, 1, 1,
0.8967298, -0.8888758, 3.632456, 0, 0, 0, 1, 1,
0.899654, -0.0975355, 0.6435159, 0, 0, 0, 1, 1,
0.9040443, -2.14656, 3.137861, 1, 1, 1, 1, 1,
0.9096689, -0.3608044, 2.472145, 1, 1, 1, 1, 1,
0.9103892, -0.4232858, 3.009263, 1, 1, 1, 1, 1,
0.9110454, -0.6073826, 2.865328, 1, 1, 1, 1, 1,
0.9130314, 0.3056558, 2.408479, 1, 1, 1, 1, 1,
0.9144756, -0.7009709, 1.14014, 1, 1, 1, 1, 1,
0.9146281, 1.677493, -1.356547, 1, 1, 1, 1, 1,
0.9180319, -1.002477, 1.050551, 1, 1, 1, 1, 1,
0.9190179, 1.160305, 1.836862, 1, 1, 1, 1, 1,
0.9252566, -1.06266, 0.9336596, 1, 1, 1, 1, 1,
0.925355, 0.2322388, 1.360748, 1, 1, 1, 1, 1,
0.9442945, 2.419145, 0.8995308, 1, 1, 1, 1, 1,
0.948745, 0.9732947, -0.3743194, 1, 1, 1, 1, 1,
0.9613683, 0.05648118, 2.086778, 1, 1, 1, 1, 1,
0.9615517, 0.8650483, 1.651044, 1, 1, 1, 1, 1,
0.9640555, 2.892885, 1.32396, 0, 0, 1, 1, 1,
0.9696073, 0.2879345, 1.920094, 1, 0, 0, 1, 1,
0.9716213, 0.9165912, 0.1678867, 1, 0, 0, 1, 1,
0.971724, -1.380129, 4.205446, 1, 0, 0, 1, 1,
0.9786699, 0.358123, 1.653686, 1, 0, 0, 1, 1,
0.981958, 1.526641, 1.556993, 1, 0, 0, 1, 1,
0.9872479, -1.630719, 3.17681, 0, 0, 0, 1, 1,
0.9886201, -1.895496, 1.650163, 0, 0, 0, 1, 1,
0.989266, -0.9537781, 3.239175, 0, 0, 0, 1, 1,
0.9913362, 2.019172, 0.423174, 0, 0, 0, 1, 1,
0.9966385, -0.2641858, 2.720183, 0, 0, 0, 1, 1,
1.001253, -1.418429, 2.986245, 0, 0, 0, 1, 1,
1.001275, -1.689851, 3.439203, 0, 0, 0, 1, 1,
1.009994, -0.9209455, 1.310315, 1, 1, 1, 1, 1,
1.015684, -0.3815413, 1.466446, 1, 1, 1, 1, 1,
1.017687, -0.05645549, 0.3389588, 1, 1, 1, 1, 1,
1.022513, 2.385025, -0.2101, 1, 1, 1, 1, 1,
1.025975, -0.8404398, 4.205591, 1, 1, 1, 1, 1,
1.02645, -1.141591, 1.796071, 1, 1, 1, 1, 1,
1.029369, -0.7270548, 1.703017, 1, 1, 1, 1, 1,
1.032178, -1.96449, 1.850799, 1, 1, 1, 1, 1,
1.033222, 0.7977874, 2.490901, 1, 1, 1, 1, 1,
1.03388, -0.4820055, 2.105052, 1, 1, 1, 1, 1,
1.038963, -0.06578157, 2.955768, 1, 1, 1, 1, 1,
1.04326, -0.8299434, 1.519777, 1, 1, 1, 1, 1,
1.046457, 1.525239, 0.3094214, 1, 1, 1, 1, 1,
1.048913, 0.7031002, 1.342534, 1, 1, 1, 1, 1,
1.05141, 0.6063682, 0.3846634, 1, 1, 1, 1, 1,
1.062177, 0.8913583, 1.300549, 0, 0, 1, 1, 1,
1.062378, -0.08517726, 1.090422, 1, 0, 0, 1, 1,
1.065708, 1.338994, 0.4150133, 1, 0, 0, 1, 1,
1.066787, -0.3754993, 1.445832, 1, 0, 0, 1, 1,
1.070684, 0.01055594, 2.78319, 1, 0, 0, 1, 1,
1.072868, -1.029021, 2.491671, 1, 0, 0, 1, 1,
1.074239, -1.266244, 3.143565, 0, 0, 0, 1, 1,
1.076581, -0.1199375, 1.738511, 0, 0, 0, 1, 1,
1.078744, -1.584942, 2.126307, 0, 0, 0, 1, 1,
1.083218, -1.578705, 3.331709, 0, 0, 0, 1, 1,
1.085883, 1.433945, 1.366922, 0, 0, 0, 1, 1,
1.088252, 1.01029, 0.6757589, 0, 0, 0, 1, 1,
1.089559, 0.3773299, 1.031925, 0, 0, 0, 1, 1,
1.09351, -0.9213615, 0.4084596, 1, 1, 1, 1, 1,
1.100317, -0.9399505, 2.746759, 1, 1, 1, 1, 1,
1.10978, -0.04340251, 1.489573, 1, 1, 1, 1, 1,
1.113306, -2.45777, 4.2304, 1, 1, 1, 1, 1,
1.118457, -0.3224938, 1.065782, 1, 1, 1, 1, 1,
1.118656, 1.745128, 0.07602793, 1, 1, 1, 1, 1,
1.118682, 1.824023, -0.2234804, 1, 1, 1, 1, 1,
1.119415, 0.2073443, 1.169078, 1, 1, 1, 1, 1,
1.133688, 1.494003, -0.5749882, 1, 1, 1, 1, 1,
1.148296, 0.7135133, 0.609069, 1, 1, 1, 1, 1,
1.148715, 1.324492, -0.08295541, 1, 1, 1, 1, 1,
1.150481, -0.7957259, 1.147205, 1, 1, 1, 1, 1,
1.156368, -0.1942336, 0.5768718, 1, 1, 1, 1, 1,
1.167244, -0.985315, 1.445291, 1, 1, 1, 1, 1,
1.183427, -0.295245, 2.347381, 1, 1, 1, 1, 1,
1.187181, -0.3535846, 2.202919, 0, 0, 1, 1, 1,
1.200094, 0.3812133, 0.1804998, 1, 0, 0, 1, 1,
1.201265, 0.3643042, 0.7839888, 1, 0, 0, 1, 1,
1.228729, -0.5687606, 3.516771, 1, 0, 0, 1, 1,
1.238811, -0.7253183, 3.204313, 1, 0, 0, 1, 1,
1.257207, -0.0001153354, 0.8349235, 1, 0, 0, 1, 1,
1.260556, -1.036957, 1.120304, 0, 0, 0, 1, 1,
1.26395, -0.9769533, 1.792608, 0, 0, 0, 1, 1,
1.266636, 0.208689, 0.7165354, 0, 0, 0, 1, 1,
1.271836, 0.8912959, 1.757564, 0, 0, 0, 1, 1,
1.282317, 0.2256072, 0.244367, 0, 0, 0, 1, 1,
1.283194, 0.07368288, 1.9655, 0, 0, 0, 1, 1,
1.287327, 1.666034, 1.379961, 0, 0, 0, 1, 1,
1.289557, 0.03501235, 2.034106, 1, 1, 1, 1, 1,
1.30575, 0.9705363, -0.1477875, 1, 1, 1, 1, 1,
1.308383, -0.802963, 2.258561, 1, 1, 1, 1, 1,
1.315029, -0.373809, 1.065838, 1, 1, 1, 1, 1,
1.316785, 0.4981168, 2.666322, 1, 1, 1, 1, 1,
1.322124, -0.7772191, 2.18934, 1, 1, 1, 1, 1,
1.340747, 1.115694, -0.8214363, 1, 1, 1, 1, 1,
1.342344, -0.3800206, 1.308191, 1, 1, 1, 1, 1,
1.356809, -1.105181, 2.263999, 1, 1, 1, 1, 1,
1.360052, -0.2741007, 0.886252, 1, 1, 1, 1, 1,
1.378001, -0.08729426, 1.403316, 1, 1, 1, 1, 1,
1.380836, 0.7549955, 1.950826, 1, 1, 1, 1, 1,
1.388025, -0.9090609, 1.272035, 1, 1, 1, 1, 1,
1.400048, -0.2282721, -0.5640556, 1, 1, 1, 1, 1,
1.400744, 1.954126, 1.286947, 1, 1, 1, 1, 1,
1.403397, -0.258759, 0.5409922, 0, 0, 1, 1, 1,
1.407163, -0.7579283, 1.622182, 1, 0, 0, 1, 1,
1.415918, 0.4007202, 0.3423861, 1, 0, 0, 1, 1,
1.437979, 1.151414, 0.9568237, 1, 0, 0, 1, 1,
1.452409, -0.7180302, 1.803851, 1, 0, 0, 1, 1,
1.46436, -0.8839209, 3.277568, 1, 0, 0, 1, 1,
1.470996, 2.245877, -0.08890834, 0, 0, 0, 1, 1,
1.477815, 1.104369, -0.4322388, 0, 0, 0, 1, 1,
1.48226, 1.737106, 1.057931, 0, 0, 0, 1, 1,
1.489584, -0.6868765, 1.480125, 0, 0, 0, 1, 1,
1.502025, -0.363184, 2.156802, 0, 0, 0, 1, 1,
1.52395, -0.6706411, 2.186801, 0, 0, 0, 1, 1,
1.536341, -2.161443, 1.996179, 0, 0, 0, 1, 1,
1.540211, 0.8444618, -1.490467, 1, 1, 1, 1, 1,
1.545347, 0.9947204, 0.4602146, 1, 1, 1, 1, 1,
1.553958, 0.8533526, 0.8836565, 1, 1, 1, 1, 1,
1.555086, -1.609862, 4.437648, 1, 1, 1, 1, 1,
1.556985, -0.3868164, 1.802491, 1, 1, 1, 1, 1,
1.557358, -1.015285, 3.609256, 1, 1, 1, 1, 1,
1.570956, -0.9796448, 1.70676, 1, 1, 1, 1, 1,
1.584593, -2.681486, 5.663449, 1, 1, 1, 1, 1,
1.592188, 1.783281, 0.3522617, 1, 1, 1, 1, 1,
1.595584, -0.6836829, 1.003757, 1, 1, 1, 1, 1,
1.598459, 0.2888049, 3.559544, 1, 1, 1, 1, 1,
1.604228, 0.637578, 2.785149, 1, 1, 1, 1, 1,
1.607241, -0.3100538, 0.6793872, 1, 1, 1, 1, 1,
1.628377, 0.4240625, 1.06093, 1, 1, 1, 1, 1,
1.628872, -0.7677031, 1.015923, 1, 1, 1, 1, 1,
1.634455, -1.11729, 1.892851, 0, 0, 1, 1, 1,
1.653107, -0.9307509, 3.117695, 1, 0, 0, 1, 1,
1.657045, -1.328707, 2.280655, 1, 0, 0, 1, 1,
1.677564, -1.346576, 4.066398, 1, 0, 0, 1, 1,
1.67848, 0.2111714, 2.65434, 1, 0, 0, 1, 1,
1.688369, 0.2087748, 2.067218, 1, 0, 0, 1, 1,
1.69932, -1.643182, 1.459865, 0, 0, 0, 1, 1,
1.717104, 0.4193188, 1.321911, 0, 0, 0, 1, 1,
1.726606, 1.645308, -0.06658351, 0, 0, 0, 1, 1,
1.800503, 0.4543569, 0.9776078, 0, 0, 0, 1, 1,
1.815616, 0.5137066, 0.8508143, 0, 0, 0, 1, 1,
1.829577, -0.3593943, 3.240161, 0, 0, 0, 1, 1,
1.832727, 0.8602774, 1.692943, 0, 0, 0, 1, 1,
1.833432, 0.9750415, 0.6511161, 1, 1, 1, 1, 1,
1.834406, -2.389538, 2.814147, 1, 1, 1, 1, 1,
1.83765, 0.3421057, 0.74479, 1, 1, 1, 1, 1,
1.858151, 0.02893358, 1.234825, 1, 1, 1, 1, 1,
1.878879, 1.443908, -0.2122347, 1, 1, 1, 1, 1,
1.882073, -1.450714, 3.450685, 1, 1, 1, 1, 1,
1.888651, 0.3033381, 1.780905, 1, 1, 1, 1, 1,
1.899017, -1.765543, 2.571947, 1, 1, 1, 1, 1,
1.916123, 0.2561571, 1.067495, 1, 1, 1, 1, 1,
1.924535, -1.24636, 2.162255, 1, 1, 1, 1, 1,
1.930333, -1.290449, 2.904443, 1, 1, 1, 1, 1,
1.980009, 0.7434883, 0.9967628, 1, 1, 1, 1, 1,
1.999429, 1.008254, 2.030388, 1, 1, 1, 1, 1,
2.001074, -1.002047, 1.248947, 1, 1, 1, 1, 1,
2.054952, -0.7021107, 0.7719216, 1, 1, 1, 1, 1,
2.06535, 0.3014096, 4.334693, 0, 0, 1, 1, 1,
2.092309, -0.8113119, 0.7515132, 1, 0, 0, 1, 1,
2.095997, 0.8228194, -0.3490995, 1, 0, 0, 1, 1,
2.160161, 1.237867, 0.2697724, 1, 0, 0, 1, 1,
2.221522, 0.05497951, 1.465947, 1, 0, 0, 1, 1,
2.2445, 1.32203, 0.8540435, 1, 0, 0, 1, 1,
2.253735, 1.117772, 1.693606, 0, 0, 0, 1, 1,
2.259718, -0.2480553, 2.63881, 0, 0, 0, 1, 1,
2.27222, -1.075714, 2.325044, 0, 0, 0, 1, 1,
2.364479, 1.191405, 2.078032, 0, 0, 0, 1, 1,
2.365518, -0.7421044, 3.526816, 0, 0, 0, 1, 1,
2.382488, -0.2811028, 2.366806, 0, 0, 0, 1, 1,
2.425815, -0.565079, 1.951645, 0, 0, 0, 1, 1,
2.443149, 0.8143272, 2.076671, 1, 1, 1, 1, 1,
2.460914, 0.7332936, 3.215866, 1, 1, 1, 1, 1,
2.464589, -0.6377227, 2.732337, 1, 1, 1, 1, 1,
2.47383, -0.1503866, 0.2484507, 1, 1, 1, 1, 1,
2.608082, 1.240401, 1.557276, 1, 1, 1, 1, 1,
3.039253, -0.3241742, 2.71699, 1, 1, 1, 1, 1,
3.136705, -0.5171633, 0.1567539, 1, 1, 1, 1, 1
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
var radius = 9.547185;
var distance = 33.53408;
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
mvMatrix.translate( -0.001859903, -0.05490673, -0.1342921 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.53408);
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
