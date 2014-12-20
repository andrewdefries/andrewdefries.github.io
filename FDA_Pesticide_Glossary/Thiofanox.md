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
-3.372332, 0.2536137, -0.7340069, 1, 0, 0, 1,
-2.61234, -0.8792066, -1.648007, 1, 0.007843138, 0, 1,
-2.521608, -1.498732, -1.287009, 1, 0.01176471, 0, 1,
-2.484655, -1.879802, -2.624634, 1, 0.01960784, 0, 1,
-2.463142, -1.97325, -2.304314, 1, 0.02352941, 0, 1,
-2.455114, 0.6731442, -0.436444, 1, 0.03137255, 0, 1,
-2.454073, -0.4137081, -2.732963, 1, 0.03529412, 0, 1,
-2.433538, 0.2477549, -2.67863, 1, 0.04313726, 0, 1,
-2.390871, -0.9618009, -2.843085, 1, 0.04705882, 0, 1,
-2.365234, 1.453287, -1.805494, 1, 0.05490196, 0, 1,
-2.340944, 0.05953488, -2.959448, 1, 0.05882353, 0, 1,
-2.318936, -0.4870719, -1.430835, 1, 0.06666667, 0, 1,
-2.287871, -0.1344, -2.3815, 1, 0.07058824, 0, 1,
-2.274606, 0.1629638, -2.39325, 1, 0.07843138, 0, 1,
-2.179965, 2.654981, -0.6425458, 1, 0.08235294, 0, 1,
-2.168124, 0.3015321, -1.696727, 1, 0.09019608, 0, 1,
-2.159853, 1.137517, -0.5581304, 1, 0.09411765, 0, 1,
-2.084556, -0.5519339, -1.579875, 1, 0.1019608, 0, 1,
-2.049352, -1.189617, -1.997432, 1, 0.1098039, 0, 1,
-2.043099, -0.3049948, -2.857722, 1, 0.1137255, 0, 1,
-2.036355, -0.4203514, -2.602748, 1, 0.1215686, 0, 1,
-2.01156, -0.1532776, -3.277301, 1, 0.1254902, 0, 1,
-1.991986, 1.067558, -1.704953, 1, 0.1333333, 0, 1,
-1.985747, -0.2663841, -2.322224, 1, 0.1372549, 0, 1,
-1.947257, 1.296977, -2.351649, 1, 0.145098, 0, 1,
-1.891335, 0.7059129, -1.678773, 1, 0.1490196, 0, 1,
-1.886645, -0.4168191, -0.669663, 1, 0.1568628, 0, 1,
-1.871708, -1.219033, -3.554133, 1, 0.1607843, 0, 1,
-1.871649, -0.7061942, -0.4476372, 1, 0.1686275, 0, 1,
-1.870294, 0.3915194, -2.149741, 1, 0.172549, 0, 1,
-1.850493, -0.7600951, -2.517287, 1, 0.1803922, 0, 1,
-1.81743, 0.3265538, -1.568412, 1, 0.1843137, 0, 1,
-1.805667, 0.7438504, -0.2598472, 1, 0.1921569, 0, 1,
-1.793592, -0.5442217, -3.368284, 1, 0.1960784, 0, 1,
-1.779998, 0.02753044, -3.43441, 1, 0.2039216, 0, 1,
-1.760141, -0.7639522, -1.570675, 1, 0.2117647, 0, 1,
-1.756017, 1.313079, -2.026657, 1, 0.2156863, 0, 1,
-1.750163, 2.267803, -0.3627074, 1, 0.2235294, 0, 1,
-1.749236, 0.07106224, -1.573929, 1, 0.227451, 0, 1,
-1.733621, -1.429115, -2.025783, 1, 0.2352941, 0, 1,
-1.724441, 0.1009163, -2.97108, 1, 0.2392157, 0, 1,
-1.708876, 0.1426501, -1.625877, 1, 0.2470588, 0, 1,
-1.690422, -2.697047, -2.197812, 1, 0.2509804, 0, 1,
-1.678378, -0.7588789, -2.642301, 1, 0.2588235, 0, 1,
-1.675729, -1.173861, -1.968684, 1, 0.2627451, 0, 1,
-1.672742, 1.084566, -1.905601, 1, 0.2705882, 0, 1,
-1.653032, -0.2389986, -2.189666, 1, 0.2745098, 0, 1,
-1.649754, -0.001738837, -2.322212, 1, 0.282353, 0, 1,
-1.60524, -0.1675496, -1.739936, 1, 0.2862745, 0, 1,
-1.571119, 1.635649, 0.005604736, 1, 0.2941177, 0, 1,
-1.560828, -0.5983045, -2.903331, 1, 0.3019608, 0, 1,
-1.555683, -0.06143694, -2.956208, 1, 0.3058824, 0, 1,
-1.546693, 1.56829, -1.136515, 1, 0.3137255, 0, 1,
-1.527851, -0.05994924, -0.8132669, 1, 0.3176471, 0, 1,
-1.525459, 0.7161211, -1.384131, 1, 0.3254902, 0, 1,
-1.523819, 0.5347111, -1.688082, 1, 0.3294118, 0, 1,
-1.519614, 1.85428, 0.09532563, 1, 0.3372549, 0, 1,
-1.518612, -0.5919839, -2.294958, 1, 0.3411765, 0, 1,
-1.517792, -0.2333268, -0.5445064, 1, 0.3490196, 0, 1,
-1.507529, -0.747727, 0.1293077, 1, 0.3529412, 0, 1,
-1.493527, 0.6415414, -2.780588, 1, 0.3607843, 0, 1,
-1.493065, 0.05590622, -0.403641, 1, 0.3647059, 0, 1,
-1.491737, 0.374408, 0.005691897, 1, 0.372549, 0, 1,
-1.486208, -0.2484777, -0.9955715, 1, 0.3764706, 0, 1,
-1.48356, -0.2239246, -0.9318717, 1, 0.3843137, 0, 1,
-1.479761, 1.416316, -2.292658, 1, 0.3882353, 0, 1,
-1.474681, 0.7247106, -1.284835, 1, 0.3960784, 0, 1,
-1.473152, -0.1293596, -0.8531499, 1, 0.4039216, 0, 1,
-1.46424, 0.9181232, -0.4583803, 1, 0.4078431, 0, 1,
-1.463547, 1.200389, -1.336515, 1, 0.4156863, 0, 1,
-1.461024, 0.8291385, -1.218328, 1, 0.4196078, 0, 1,
-1.459137, 0.3861388, -3.200184, 1, 0.427451, 0, 1,
-1.454608, 1.610526, -0.9684088, 1, 0.4313726, 0, 1,
-1.451646, -0.2744619, -3.151376, 1, 0.4392157, 0, 1,
-1.435451, 1.830969, -0.2387819, 1, 0.4431373, 0, 1,
-1.431327, -0.7752408, -1.498881, 1, 0.4509804, 0, 1,
-1.429471, 0.3146482, -0.09499202, 1, 0.454902, 0, 1,
-1.428936, -0.2733181, -1.736733, 1, 0.4627451, 0, 1,
-1.422481, -1.252293, -2.389379, 1, 0.4666667, 0, 1,
-1.421654, 1.293032, -0.890353, 1, 0.4745098, 0, 1,
-1.416643, -0.974564, -3.424265, 1, 0.4784314, 0, 1,
-1.415489, -0.2578125, -0.4261655, 1, 0.4862745, 0, 1,
-1.407283, -1.581843, -1.438563, 1, 0.4901961, 0, 1,
-1.407044, -1.66348, -1.313747, 1, 0.4980392, 0, 1,
-1.406999, -3.145346, -1.705927, 1, 0.5058824, 0, 1,
-1.406144, 1.497338, -0.3358154, 1, 0.509804, 0, 1,
-1.393845, -0.9381598, -2.989902, 1, 0.5176471, 0, 1,
-1.39294, -1.650675, -1.879503, 1, 0.5215687, 0, 1,
-1.391889, -2.013417, -3.053081, 1, 0.5294118, 0, 1,
-1.370104, 1.816645, -0.1955859, 1, 0.5333334, 0, 1,
-1.367902, 0.7158349, -2.090057, 1, 0.5411765, 0, 1,
-1.363189, 0.6430923, -0.5494848, 1, 0.5450981, 0, 1,
-1.354235, -1.424199, -3.17924, 1, 0.5529412, 0, 1,
-1.349865, 0.5525734, -1.48801, 1, 0.5568628, 0, 1,
-1.34824, 0.3809893, -2.013183, 1, 0.5647059, 0, 1,
-1.347364, 0.03387161, -0.426992, 1, 0.5686275, 0, 1,
-1.347164, 0.5018424, -0.552977, 1, 0.5764706, 0, 1,
-1.343174, 0.4190985, -1.806583, 1, 0.5803922, 0, 1,
-1.341374, 0.7072342, 1.360082, 1, 0.5882353, 0, 1,
-1.339357, -2.381153, -1.262708, 1, 0.5921569, 0, 1,
-1.336291, 0.1621845, -3.487083, 1, 0.6, 0, 1,
-1.336207, -0.1576325, -2.800283, 1, 0.6078432, 0, 1,
-1.334775, -0.581031, -3.817949, 1, 0.6117647, 0, 1,
-1.330244, -1.419036, -2.209669, 1, 0.6196079, 0, 1,
-1.319816, 1.260981, -0.182614, 1, 0.6235294, 0, 1,
-1.319348, -0.822521, -1.11368, 1, 0.6313726, 0, 1,
-1.313439, -0.836754, -1.063683, 1, 0.6352941, 0, 1,
-1.311876, -0.2393547, -2.804764, 1, 0.6431373, 0, 1,
-1.308076, -0.5413995, -1.534491, 1, 0.6470588, 0, 1,
-1.308071, 0.4799115, -0.9462295, 1, 0.654902, 0, 1,
-1.307989, 1.10244, -0.6011599, 1, 0.6588235, 0, 1,
-1.3066, 0.2508439, -2.547541, 1, 0.6666667, 0, 1,
-1.303282, -0.8170062, -2.167877, 1, 0.6705883, 0, 1,
-1.290784, -1.880825, -2.201703, 1, 0.6784314, 0, 1,
-1.287329, 0.2742364, -0.5246471, 1, 0.682353, 0, 1,
-1.283026, -0.4826006, -3.511311, 1, 0.6901961, 0, 1,
-1.278032, 0.007889665, 0.159987, 1, 0.6941177, 0, 1,
-1.271471, -0.2640917, -1.031307, 1, 0.7019608, 0, 1,
-1.258259, -0.5739475, -1.650255, 1, 0.7098039, 0, 1,
-1.256799, 2.343119, -0.6449132, 1, 0.7137255, 0, 1,
-1.251485, -0.8082727, -3.215888, 1, 0.7215686, 0, 1,
-1.248282, 1.168545, -1.244129, 1, 0.7254902, 0, 1,
-1.245824, 1.649105, 0.2843093, 1, 0.7333333, 0, 1,
-1.232635, -0.6927993, -4.203814, 1, 0.7372549, 0, 1,
-1.231514, -0.4496593, -1.250396, 1, 0.7450981, 0, 1,
-1.223665, -1.840723, -2.120041, 1, 0.7490196, 0, 1,
-1.215655, 0.6492098, -0.6737913, 1, 0.7568628, 0, 1,
-1.207581, 1.001291, -0.9202087, 1, 0.7607843, 0, 1,
-1.204315, 0.1863963, -0.7054818, 1, 0.7686275, 0, 1,
-1.201948, -0.1155963, -0.7083358, 1, 0.772549, 0, 1,
-1.200794, 0.7574587, -1.956468, 1, 0.7803922, 0, 1,
-1.194514, 1.355223, 0.6947671, 1, 0.7843137, 0, 1,
-1.191983, 0.3509268, -1.654202, 1, 0.7921569, 0, 1,
-1.19197, -0.7051239, -2.461683, 1, 0.7960784, 0, 1,
-1.188336, -0.8246238, -3.33245, 1, 0.8039216, 0, 1,
-1.188125, -1.815309, -3.448572, 1, 0.8117647, 0, 1,
-1.187701, -0.7403844, -2.71258, 1, 0.8156863, 0, 1,
-1.180306, 0.538062, -2.515656, 1, 0.8235294, 0, 1,
-1.174832, -0.3788576, -1.335483, 1, 0.827451, 0, 1,
-1.169352, 1.79672, -0.6108625, 1, 0.8352941, 0, 1,
-1.165452, 1.090046, -0.3255848, 1, 0.8392157, 0, 1,
-1.158158, -1.180464, -2.733612, 1, 0.8470588, 0, 1,
-1.154273, 0.7121149, -0.5779783, 1, 0.8509804, 0, 1,
-1.150846, -0.7478483, -1.36986, 1, 0.8588235, 0, 1,
-1.150751, -0.24558, -0.2364066, 1, 0.8627451, 0, 1,
-1.144645, -0.02969513, -2.345574, 1, 0.8705882, 0, 1,
-1.142142, 0.9531098, 0.10777, 1, 0.8745098, 0, 1,
-1.138675, 0.5763871, -2.522377, 1, 0.8823529, 0, 1,
-1.137354, 2.706594, 1.234719, 1, 0.8862745, 0, 1,
-1.132276, 1.58138, -0.4212594, 1, 0.8941177, 0, 1,
-1.130821, -0.98488, -1.510781, 1, 0.8980392, 0, 1,
-1.128564, -0.9581795, -3.970809, 1, 0.9058824, 0, 1,
-1.127424, 1.867609, -0.4720859, 1, 0.9137255, 0, 1,
-1.12057, -0.05741803, -0.8149298, 1, 0.9176471, 0, 1,
-1.119808, 0.3964901, -1.687079, 1, 0.9254902, 0, 1,
-1.112693, -0.1795633, -2.743644, 1, 0.9294118, 0, 1,
-1.11092, -0.01435251, -1.754488, 1, 0.9372549, 0, 1,
-1.091804, -1.455965, -3.209846, 1, 0.9411765, 0, 1,
-1.077913, 1.726272, -1.263733, 1, 0.9490196, 0, 1,
-1.069268, 0.07054681, -2.412913, 1, 0.9529412, 0, 1,
-1.062837, -0.9728363, -4.47884, 1, 0.9607843, 0, 1,
-1.05645, 0.3371857, -0.895318, 1, 0.9647059, 0, 1,
-1.053865, 1.096174, -0.8261787, 1, 0.972549, 0, 1,
-1.047007, -2.121215, -3.472371, 1, 0.9764706, 0, 1,
-1.045618, -0.6826188, -3.090344, 1, 0.9843137, 0, 1,
-1.041341, -0.8845419, -2.775409, 1, 0.9882353, 0, 1,
-1.039106, -0.7307906, -1.65848, 1, 0.9960784, 0, 1,
-1.036427, 1.460592, -0.3416643, 0.9960784, 1, 0, 1,
-1.035221, 0.2910246, -0.9963505, 0.9921569, 1, 0, 1,
-1.034379, 1.562722, 0.5739899, 0.9843137, 1, 0, 1,
-1.019825, -1.405271, -2.018818, 0.9803922, 1, 0, 1,
-1.017467, -0.4642684, -3.815031, 0.972549, 1, 0, 1,
-1.016542, 0.874115, -0.7393943, 0.9686275, 1, 0, 1,
-1.003633, 0.2269247, -1.955789, 0.9607843, 1, 0, 1,
-0.9952645, 0.2753209, -0.7184598, 0.9568627, 1, 0, 1,
-0.9867529, -0.961341, -0.2956751, 0.9490196, 1, 0, 1,
-0.9866577, 0.08485918, -0.7964926, 0.945098, 1, 0, 1,
-0.9866254, 2.544992, -2.668512, 0.9372549, 1, 0, 1,
-0.9860427, -1.823612, -2.942584, 0.9333333, 1, 0, 1,
-0.9846143, 0.4113535, -1.731771, 0.9254902, 1, 0, 1,
-0.9755263, 0.7587718, -2.246871, 0.9215686, 1, 0, 1,
-0.9706658, -1.65427, -4.190906, 0.9137255, 1, 0, 1,
-0.9648001, -1.671351, -2.647639, 0.9098039, 1, 0, 1,
-0.9633759, 0.03581966, 0.003971744, 0.9019608, 1, 0, 1,
-0.9608773, -0.2529911, -1.127169, 0.8941177, 1, 0, 1,
-0.9598719, 0.4156756, 0.4390034, 0.8901961, 1, 0, 1,
-0.9538433, -1.502473, -2.377403, 0.8823529, 1, 0, 1,
-0.9529698, -1.214332, -3.308962, 0.8784314, 1, 0, 1,
-0.9467477, 0.4962639, -0.928131, 0.8705882, 1, 0, 1,
-0.9358299, 0.336891, -1.432034, 0.8666667, 1, 0, 1,
-0.9343143, 1.439976, -1.389305, 0.8588235, 1, 0, 1,
-0.931383, 0.45252, -1.670837, 0.854902, 1, 0, 1,
-0.928217, -1.645661, -2.625482, 0.8470588, 1, 0, 1,
-0.9269039, -0.8734819, -2.852666, 0.8431373, 1, 0, 1,
-0.9238368, -0.3164301, -0.6012297, 0.8352941, 1, 0, 1,
-0.9096904, -0.4781977, -0.4028852, 0.8313726, 1, 0, 1,
-0.9085666, -0.8906173, -1.631076, 0.8235294, 1, 0, 1,
-0.8954061, -0.8132842, -2.577623, 0.8196079, 1, 0, 1,
-0.8952954, 0.005890336, -3.011438, 0.8117647, 1, 0, 1,
-0.8932973, 0.3451501, -1.703336, 0.8078431, 1, 0, 1,
-0.8914199, -0.6314431, -3.040996, 0.8, 1, 0, 1,
-0.8894711, -0.257315, -4.071162, 0.7921569, 1, 0, 1,
-0.8881086, 2.066991, 0.05527755, 0.7882353, 1, 0, 1,
-0.8869939, -0.5554373, -2.484682, 0.7803922, 1, 0, 1,
-0.8853329, -2.078363, -3.119116, 0.7764706, 1, 0, 1,
-0.883035, 2.204653, -1.510643, 0.7686275, 1, 0, 1,
-0.8813146, 1.594919, -1.778556, 0.7647059, 1, 0, 1,
-0.8812281, -0.9106259, -2.360599, 0.7568628, 1, 0, 1,
-0.8769864, -0.7932029, -2.546858, 0.7529412, 1, 0, 1,
-0.8758304, 0.4251369, 1.825472, 0.7450981, 1, 0, 1,
-0.8674635, 1.367168, -0.4601499, 0.7411765, 1, 0, 1,
-0.8624772, -0.4981597, -2.666102, 0.7333333, 1, 0, 1,
-0.8597799, 0.07967157, -2.382266, 0.7294118, 1, 0, 1,
-0.8539237, 0.9545987, -1.61347, 0.7215686, 1, 0, 1,
-0.8508359, 0.9065543, -2.909148, 0.7176471, 1, 0, 1,
-0.849261, -0.5143367, -2.537917, 0.7098039, 1, 0, 1,
-0.8438989, 0.9720353, -0.856985, 0.7058824, 1, 0, 1,
-0.8429478, 0.3385805, -1.845669, 0.6980392, 1, 0, 1,
-0.8369898, -0.2308173, -2.88827, 0.6901961, 1, 0, 1,
-0.8354469, -1.29417, -3.429508, 0.6862745, 1, 0, 1,
-0.8302915, -1.264135, -3.202526, 0.6784314, 1, 0, 1,
-0.8253922, 1.460367, -0.03721142, 0.6745098, 1, 0, 1,
-0.8243148, 0.3197586, -1.426215, 0.6666667, 1, 0, 1,
-0.8226857, 0.09436388, -3.205985, 0.6627451, 1, 0, 1,
-0.8217915, -0.05018599, -1.911346, 0.654902, 1, 0, 1,
-0.8172733, -0.5799696, -2.834363, 0.6509804, 1, 0, 1,
-0.8168288, 0.2950429, -0.8806149, 0.6431373, 1, 0, 1,
-0.8152015, -1.588506, -1.431983, 0.6392157, 1, 0, 1,
-0.8147017, 0.5120009, -0.743731, 0.6313726, 1, 0, 1,
-0.8140808, -0.4447087, -2.220432, 0.627451, 1, 0, 1,
-0.8137358, 0.4153248, -0.1055145, 0.6196079, 1, 0, 1,
-0.811911, 2.895857, -0.2058788, 0.6156863, 1, 0, 1,
-0.8106695, 0.001115103, -0.5137019, 0.6078432, 1, 0, 1,
-0.8063449, 2.358289, -1.579658, 0.6039216, 1, 0, 1,
-0.8039005, 1.305099, -0.3323626, 0.5960785, 1, 0, 1,
-0.8022404, -0.6080868, -2.846196, 0.5882353, 1, 0, 1,
-0.7937558, 1.30026, 0.7034299, 0.5843138, 1, 0, 1,
-0.7817431, 0.2803026, -1.760624, 0.5764706, 1, 0, 1,
-0.7779476, -0.1646537, -2.053635, 0.572549, 1, 0, 1,
-0.774913, 1.908401, -0.90005, 0.5647059, 1, 0, 1,
-0.7748726, 2.157814, -2.034296, 0.5607843, 1, 0, 1,
-0.772559, -0.6128388, -3.114744, 0.5529412, 1, 0, 1,
-0.7640367, -1.214733, -2.413411, 0.5490196, 1, 0, 1,
-0.7636331, -0.7045389, -3.893796, 0.5411765, 1, 0, 1,
-0.7614877, 0.09586287, -1.024384, 0.5372549, 1, 0, 1,
-0.7582442, -0.2106141, -1.917741, 0.5294118, 1, 0, 1,
-0.756575, -1.331908, -2.338055, 0.5254902, 1, 0, 1,
-0.7509078, -0.5640574, -2.879437, 0.5176471, 1, 0, 1,
-0.7502006, -0.06759766, -1.178032, 0.5137255, 1, 0, 1,
-0.7487387, -1.095501, -3.847007, 0.5058824, 1, 0, 1,
-0.7466193, 0.269296, -1.622963, 0.5019608, 1, 0, 1,
-0.7426738, -2.445783, -2.345481, 0.4941176, 1, 0, 1,
-0.7417014, -0.8409595, -3.558675, 0.4862745, 1, 0, 1,
-0.739127, -1.85536, -2.484932, 0.4823529, 1, 0, 1,
-0.7362938, 0.2455113, -1.035133, 0.4745098, 1, 0, 1,
-0.7332005, -2.005023, -2.932398, 0.4705882, 1, 0, 1,
-0.7221865, 0.7269446, -0.6137288, 0.4627451, 1, 0, 1,
-0.7175178, 0.8725321, -0.2832983, 0.4588235, 1, 0, 1,
-0.711406, 0.7212799, -1.189022, 0.4509804, 1, 0, 1,
-0.7037045, -1.362423, -3.829396, 0.4470588, 1, 0, 1,
-0.7035292, 0.8635625, -1.949098, 0.4392157, 1, 0, 1,
-0.6899047, 1.52935, 1.112436, 0.4352941, 1, 0, 1,
-0.6876338, 1.324275, 1.69365, 0.427451, 1, 0, 1,
-0.6871451, 0.7411392, 1.161135, 0.4235294, 1, 0, 1,
-0.6861375, 1.441221, -2.236069, 0.4156863, 1, 0, 1,
-0.685775, 1.481011, -2.019806, 0.4117647, 1, 0, 1,
-0.6838528, -1.473041, -3.027734, 0.4039216, 1, 0, 1,
-0.6814377, -0.4098263, -2.718745, 0.3960784, 1, 0, 1,
-0.6799825, -0.5386977, -3.965852, 0.3921569, 1, 0, 1,
-0.6751922, -0.6523295, -0.4285519, 0.3843137, 1, 0, 1,
-0.669346, -1.384012, -1.917798, 0.3803922, 1, 0, 1,
-0.6686315, 1.712262, -0.2152587, 0.372549, 1, 0, 1,
-0.6674959, -1.570177, -1.134955, 0.3686275, 1, 0, 1,
-0.6670548, 1.357842, 1.317208, 0.3607843, 1, 0, 1,
-0.6651592, -0.5148417, -1.506354, 0.3568628, 1, 0, 1,
-0.6648568, -0.9164716, -0.4962422, 0.3490196, 1, 0, 1,
-0.664306, -1.033246, -1.790015, 0.345098, 1, 0, 1,
-0.6636651, 0.1577242, 1.201708, 0.3372549, 1, 0, 1,
-0.6606903, 0.7325473, -0.9958605, 0.3333333, 1, 0, 1,
-0.6499185, 0.3213012, -0.4720836, 0.3254902, 1, 0, 1,
-0.6491486, -0.9597242, -1.935069, 0.3215686, 1, 0, 1,
-0.6488736, -0.5967313, -2.478539, 0.3137255, 1, 0, 1,
-0.6488569, -0.4218748, -2.048154, 0.3098039, 1, 0, 1,
-0.6470091, 0.1310263, -1.984633, 0.3019608, 1, 0, 1,
-0.6437348, 0.7050114, 0.005223192, 0.2941177, 1, 0, 1,
-0.6407526, 2.18733, -0.01412051, 0.2901961, 1, 0, 1,
-0.6357291, -0.9004759, -4.219029, 0.282353, 1, 0, 1,
-0.6330339, -0.02920085, -0.6427917, 0.2784314, 1, 0, 1,
-0.6320339, 0.8431678, -1.089864, 0.2705882, 1, 0, 1,
-0.6312454, -1.138964, -1.915087, 0.2666667, 1, 0, 1,
-0.6271986, 1.803522, -1.47239, 0.2588235, 1, 0, 1,
-0.6244524, 1.38829, 0.7388539, 0.254902, 1, 0, 1,
-0.6173009, 0.4681512, -2.085199, 0.2470588, 1, 0, 1,
-0.615933, 0.03197102, 0.21801, 0.2431373, 1, 0, 1,
-0.6131217, -1.16579, -2.357356, 0.2352941, 1, 0, 1,
-0.6123525, 1.201751, -0.7118611, 0.2313726, 1, 0, 1,
-0.610428, -0.3444132, -1.893149, 0.2235294, 1, 0, 1,
-0.6102057, -0.4569528, -2.641304, 0.2196078, 1, 0, 1,
-0.6049897, 2.030933, -1.276017, 0.2117647, 1, 0, 1,
-0.6031578, -0.721972, -2.644098, 0.2078431, 1, 0, 1,
-0.6000696, -0.2766057, -3.486634, 0.2, 1, 0, 1,
-0.5972411, -0.2155425, -2.171265, 0.1921569, 1, 0, 1,
-0.5965838, -0.3640209, -3.470315, 0.1882353, 1, 0, 1,
-0.5889887, -0.6883538, -2.211706, 0.1803922, 1, 0, 1,
-0.5887104, -0.9356773, -3.178348, 0.1764706, 1, 0, 1,
-0.58765, -1.412797, -3.843514, 0.1686275, 1, 0, 1,
-0.5773277, 0.5088984, 0.2851807, 0.1647059, 1, 0, 1,
-0.5751814, -0.2093161, -3.109428, 0.1568628, 1, 0, 1,
-0.5682732, 0.427427, -1.987345, 0.1529412, 1, 0, 1,
-0.5617525, 0.01443054, -2.916859, 0.145098, 1, 0, 1,
-0.5555993, -0.125046, -1.794496, 0.1411765, 1, 0, 1,
-0.55472, -0.1724698, -1.67251, 0.1333333, 1, 0, 1,
-0.5529826, 0.07788915, -1.654688, 0.1294118, 1, 0, 1,
-0.5529625, 1.309232, -1.205567, 0.1215686, 1, 0, 1,
-0.5516709, -1.411529, -3.761914, 0.1176471, 1, 0, 1,
-0.5467988, 1.229816, -0.6534893, 0.1098039, 1, 0, 1,
-0.5456029, 1.030575, -0.6909624, 0.1058824, 1, 0, 1,
-0.5452047, -0.158367, -1.895407, 0.09803922, 1, 0, 1,
-0.5448558, 1.528173, -0.5121705, 0.09019608, 1, 0, 1,
-0.5434704, -0.7384132, -2.088448, 0.08627451, 1, 0, 1,
-0.5375263, -0.9947804, -3.383555, 0.07843138, 1, 0, 1,
-0.5347405, 0.03939141, -1.429211, 0.07450981, 1, 0, 1,
-0.5305462, -0.716906, -3.562486, 0.06666667, 1, 0, 1,
-0.5303099, 0.7998127, 0.7685391, 0.0627451, 1, 0, 1,
-0.5276091, -0.8058101, -3.874831, 0.05490196, 1, 0, 1,
-0.5255436, 0.04816386, -2.311552, 0.05098039, 1, 0, 1,
-0.5252022, 0.4485816, -1.099688, 0.04313726, 1, 0, 1,
-0.5154415, 0.3962343, 0.1357943, 0.03921569, 1, 0, 1,
-0.5144302, -0.1074714, -3.373677, 0.03137255, 1, 0, 1,
-0.5115381, 0.6884552, -0.1712536, 0.02745098, 1, 0, 1,
-0.5059401, 0.8577238, -0.6180099, 0.01960784, 1, 0, 1,
-0.5033489, 0.06045142, -2.851679, 0.01568628, 1, 0, 1,
-0.4982473, 1.94922, -0.2464689, 0.007843138, 1, 0, 1,
-0.4933912, -0.9153571, -3.403237, 0.003921569, 1, 0, 1,
-0.4915693, 0.5661024, -0.222714, 0, 1, 0.003921569, 1,
-0.4871658, -1.647391, -2.815319, 0, 1, 0.01176471, 1,
-0.4864738, -0.695383, -2.095048, 0, 1, 0.01568628, 1,
-0.4832217, 2.349691, 0.4850763, 0, 1, 0.02352941, 1,
-0.4779777, 1.307485, -1.148859, 0, 1, 0.02745098, 1,
-0.4703556, 1.330355, -0.7238163, 0, 1, 0.03529412, 1,
-0.4697332, -2.147162, -3.232121, 0, 1, 0.03921569, 1,
-0.4679465, -0.8234271, -5.444579, 0, 1, 0.04705882, 1,
-0.4672155, -2.341437, -1.109475, 0, 1, 0.05098039, 1,
-0.4638967, 0.259511, -1.362805, 0, 1, 0.05882353, 1,
-0.4629254, -0.927989, -1.925278, 0, 1, 0.0627451, 1,
-0.4615324, 0.03825463, -3.256986, 0, 1, 0.07058824, 1,
-0.4595628, -0.03851993, -2.894264, 0, 1, 0.07450981, 1,
-0.4574507, -0.3980066, -0.8100636, 0, 1, 0.08235294, 1,
-0.4517808, 0.5434893, 0.6181445, 0, 1, 0.08627451, 1,
-0.4490638, 1.056374, 0.1088916, 0, 1, 0.09411765, 1,
-0.4442798, -0.5858014, -2.353578, 0, 1, 0.1019608, 1,
-0.4439816, 1.763879, -0.5093802, 0, 1, 0.1058824, 1,
-0.4421994, 0.7271948, -0.9524791, 0, 1, 0.1137255, 1,
-0.4397403, 0.7994921, -0.5571095, 0, 1, 0.1176471, 1,
-0.4387689, 0.624988, -1.222572, 0, 1, 0.1254902, 1,
-0.4352862, -0.3566012, -2.317407, 0, 1, 0.1294118, 1,
-0.4337861, -0.06852539, -1.435451, 0, 1, 0.1372549, 1,
-0.4288979, 0.557212, -1.12363, 0, 1, 0.1411765, 1,
-0.4244308, -0.7089555, -3.475848, 0, 1, 0.1490196, 1,
-0.4235895, -1.273202, -4.488048, 0, 1, 0.1529412, 1,
-0.4201286, -0.2866386, -2.226051, 0, 1, 0.1607843, 1,
-0.4195513, -1.786495, -3.156529, 0, 1, 0.1647059, 1,
-0.4186657, 0.5275955, 0.4333763, 0, 1, 0.172549, 1,
-0.4165286, 1.059877, -1.639082, 0, 1, 0.1764706, 1,
-0.4120997, -1.972523, -2.267321, 0, 1, 0.1843137, 1,
-0.4072775, -0.521062, -3.462516, 0, 1, 0.1882353, 1,
-0.406182, -0.5544785, -2.425664, 0, 1, 0.1960784, 1,
-0.4038003, 1.329537, -1.439289, 0, 1, 0.2039216, 1,
-0.3974727, -0.1057231, -1.63462, 0, 1, 0.2078431, 1,
-0.3938444, -0.210847, 0.04892482, 0, 1, 0.2156863, 1,
-0.3926444, 0.2648263, -0.3698257, 0, 1, 0.2196078, 1,
-0.3920404, 0.6092914, 0.1265906, 0, 1, 0.227451, 1,
-0.3916371, -0.01842527, -0.5528066, 0, 1, 0.2313726, 1,
-0.3910181, 2.211758, -1.01071, 0, 1, 0.2392157, 1,
-0.3857842, 1.13928, 0.02186115, 0, 1, 0.2431373, 1,
-0.3819117, 0.9030426, 0.4685892, 0, 1, 0.2509804, 1,
-0.3799614, 0.8910127, -1.016796, 0, 1, 0.254902, 1,
-0.3798175, 1.107513, 0.966003, 0, 1, 0.2627451, 1,
-0.3796536, 0.3211164, -0.4610643, 0, 1, 0.2666667, 1,
-0.3760715, 0.7885582, 1.348423, 0, 1, 0.2745098, 1,
-0.3737986, 0.3363444, -1.676124, 0, 1, 0.2784314, 1,
-0.3684998, -0.5328868, -2.183713, 0, 1, 0.2862745, 1,
-0.3658923, -0.2326678, -2.312614, 0, 1, 0.2901961, 1,
-0.3636205, -2.015467, -1.390174, 0, 1, 0.2980392, 1,
-0.361688, -1.189262, -3.93058, 0, 1, 0.3058824, 1,
-0.3615139, -0.1951554, -3.572981, 0, 1, 0.3098039, 1,
-0.3615076, 0.3549365, 0.8881665, 0, 1, 0.3176471, 1,
-0.3592628, -0.1827456, -0.6789585, 0, 1, 0.3215686, 1,
-0.3570445, 0.8647296, -0.8594016, 0, 1, 0.3294118, 1,
-0.343128, -2.504047, -2.701545, 0, 1, 0.3333333, 1,
-0.3386881, 0.1216314, -0.8478642, 0, 1, 0.3411765, 1,
-0.3378317, -1.877515, -2.950878, 0, 1, 0.345098, 1,
-0.3375624, -0.6612221, -2.833303, 0, 1, 0.3529412, 1,
-0.3375327, 1.315131, 0.6647355, 0, 1, 0.3568628, 1,
-0.3340867, 0.02961377, -1.783647, 0, 1, 0.3647059, 1,
-0.3333334, 0.8188989, 0.3890162, 0, 1, 0.3686275, 1,
-0.3245788, 0.4816188, 0.3990386, 0, 1, 0.3764706, 1,
-0.3233762, -0.05617685, -1.574779, 0, 1, 0.3803922, 1,
-0.3154497, -0.007997432, -2.585327, 0, 1, 0.3882353, 1,
-0.3140507, 1.409486, 0.01804048, 0, 1, 0.3921569, 1,
-0.3128234, -0.09758073, -2.437728, 0, 1, 0.4, 1,
-0.3116405, -0.5041111, -2.926485, 0, 1, 0.4078431, 1,
-0.3087211, -0.04504632, -1.613855, 0, 1, 0.4117647, 1,
-0.3069659, 1.78831, -1.588017, 0, 1, 0.4196078, 1,
-0.3043073, 0.0671295, -1.138054, 0, 1, 0.4235294, 1,
-0.2962247, -0.09889042, -1.79282, 0, 1, 0.4313726, 1,
-0.2908849, -3.545498, -2.952698, 0, 1, 0.4352941, 1,
-0.2891925, -0.1306073, -0.9813351, 0, 1, 0.4431373, 1,
-0.2887116, 0.2791474, -0.143286, 0, 1, 0.4470588, 1,
-0.2884892, -0.436369, -3.813704, 0, 1, 0.454902, 1,
-0.2884621, 1.490783, 0.6107188, 0, 1, 0.4588235, 1,
-0.2880043, -1.387957, -2.637325, 0, 1, 0.4666667, 1,
-0.2872983, 0.1284033, -2.435247, 0, 1, 0.4705882, 1,
-0.2825526, -0.7214328, -3.105021, 0, 1, 0.4784314, 1,
-0.2816202, -1.471171, -2.289177, 0, 1, 0.4823529, 1,
-0.2745815, 0.07133378, -1.452729, 0, 1, 0.4901961, 1,
-0.2735748, 0.2891284, -2.116693, 0, 1, 0.4941176, 1,
-0.2691318, -1.166759, -4.727006, 0, 1, 0.5019608, 1,
-0.2660559, -1.025772, -3.836589, 0, 1, 0.509804, 1,
-0.2649501, -0.9242902, -3.605323, 0, 1, 0.5137255, 1,
-0.2621017, 0.6975375, -0.4071694, 0, 1, 0.5215687, 1,
-0.2619272, 0.7297045, -0.3981082, 0, 1, 0.5254902, 1,
-0.25949, -2.058748, -3.311855, 0, 1, 0.5333334, 1,
-0.255539, 1.091179, 0.4260786, 0, 1, 0.5372549, 1,
-0.2552662, -0.6978194, -4.005841, 0, 1, 0.5450981, 1,
-0.2514672, -1.097607, -2.266397, 0, 1, 0.5490196, 1,
-0.2514129, 0.01604117, -0.8932734, 0, 1, 0.5568628, 1,
-0.2487523, 0.9313776, -0.4379533, 0, 1, 0.5607843, 1,
-0.2458837, -0.6695028, -0.9416426, 0, 1, 0.5686275, 1,
-0.2447103, -0.8106324, -2.129695, 0, 1, 0.572549, 1,
-0.244095, 0.970914, 0.5842248, 0, 1, 0.5803922, 1,
-0.2436639, -0.4092482, -1.390379, 0, 1, 0.5843138, 1,
-0.2405848, -0.3655995, -1.419703, 0, 1, 0.5921569, 1,
-0.2375098, 2.257358, 1.408428, 0, 1, 0.5960785, 1,
-0.2310239, -0.79967, -4.341271, 0, 1, 0.6039216, 1,
-0.2288945, -0.3392047, -2.229821, 0, 1, 0.6117647, 1,
-0.2270012, 0.1192756, -0.584681, 0, 1, 0.6156863, 1,
-0.2156418, 0.5355689, -0.1962906, 0, 1, 0.6235294, 1,
-0.2134109, -0.05214384, 1.065674, 0, 1, 0.627451, 1,
-0.2108413, -0.5471997, -1.991501, 0, 1, 0.6352941, 1,
-0.2102861, -0.01098398, -1.238129, 0, 1, 0.6392157, 1,
-0.2089038, -1.170737, -3.711953, 0, 1, 0.6470588, 1,
-0.2070872, -1.164959, -3.885673, 0, 1, 0.6509804, 1,
-0.2066807, 1.423017, 0.893945, 0, 1, 0.6588235, 1,
-0.1996135, 0.9913145, -1.333343, 0, 1, 0.6627451, 1,
-0.1995019, -0.4861023, -3.615506, 0, 1, 0.6705883, 1,
-0.1947481, 0.70981, -1.951365, 0, 1, 0.6745098, 1,
-0.1945981, -0.3164555, -1.706887, 0, 1, 0.682353, 1,
-0.1902679, -0.3422982, -3.886007, 0, 1, 0.6862745, 1,
-0.188305, 1.204763, 0.1075255, 0, 1, 0.6941177, 1,
-0.1846838, 2.113116, -0.8131825, 0, 1, 0.7019608, 1,
-0.1760949, 1.254473, -0.5525817, 0, 1, 0.7058824, 1,
-0.1693343, 0.106429, -0.02821639, 0, 1, 0.7137255, 1,
-0.1686011, -0.8834094, -4.150563, 0, 1, 0.7176471, 1,
-0.1579413, 1.364449, -1.750034, 0, 1, 0.7254902, 1,
-0.1561075, 0.6334687, 0.6349003, 0, 1, 0.7294118, 1,
-0.1529248, -1.078708, -4.316436, 0, 1, 0.7372549, 1,
-0.1507261, -0.01760239, -2.108552, 0, 1, 0.7411765, 1,
-0.1501019, -0.391631, -3.466692, 0, 1, 0.7490196, 1,
-0.1445405, 0.4431073, 2.442359, 0, 1, 0.7529412, 1,
-0.1424878, 1.652845, 0.6843609, 0, 1, 0.7607843, 1,
-0.1400682, -0.9848883, -3.166569, 0, 1, 0.7647059, 1,
-0.1388678, 0.2158198, -1.045288, 0, 1, 0.772549, 1,
-0.1369351, -1.188647, -2.599347, 0, 1, 0.7764706, 1,
-0.1324546, 1.168159, -0.1241727, 0, 1, 0.7843137, 1,
-0.130026, 1.658877, 0.2414013, 0, 1, 0.7882353, 1,
-0.1255706, -1.954137, -2.901669, 0, 1, 0.7960784, 1,
-0.1241591, -0.6004182, -2.578705, 0, 1, 0.8039216, 1,
-0.1231105, -0.2429143, 0.2079747, 0, 1, 0.8078431, 1,
-0.1183053, 0.7009698, -0.03643019, 0, 1, 0.8156863, 1,
-0.1164059, 1.411068, 1.649015, 0, 1, 0.8196079, 1,
-0.1134584, 2.316516, -0.3368365, 0, 1, 0.827451, 1,
-0.1120867, -0.068774, -1.701329, 0, 1, 0.8313726, 1,
-0.1060577, 0.7046131, 0.1027554, 0, 1, 0.8392157, 1,
-0.1023891, -1.730304, -2.979224, 0, 1, 0.8431373, 1,
-0.1021873, -0.3274109, -2.864421, 0, 1, 0.8509804, 1,
-0.09869658, 0.06863491, 0.3258569, 0, 1, 0.854902, 1,
-0.09745438, -2.501109, -4.020288, 0, 1, 0.8627451, 1,
-0.09659502, 1.001892, -0.4876111, 0, 1, 0.8666667, 1,
-0.09602901, 1.967206, 0.5981088, 0, 1, 0.8745098, 1,
-0.09536564, 1.112587, -0.893527, 0, 1, 0.8784314, 1,
-0.09179698, 0.6722415, -1.384273, 0, 1, 0.8862745, 1,
-0.09074872, 0.8403478, -1.08917, 0, 1, 0.8901961, 1,
-0.09069995, 0.7956983, -1.813157, 0, 1, 0.8980392, 1,
-0.0891167, -0.7481996, -3.299504, 0, 1, 0.9058824, 1,
-0.08888746, 0.7137929, 0.4827823, 0, 1, 0.9098039, 1,
-0.08759616, -0.1511178, -2.257509, 0, 1, 0.9176471, 1,
-0.08612563, -1.547622, -3.3841, 0, 1, 0.9215686, 1,
-0.084544, 0.7268229, -0.6467416, 0, 1, 0.9294118, 1,
-0.08108383, 0.6410308, 1.748433, 0, 1, 0.9333333, 1,
-0.07661653, -0.0129031, -2.46416, 0, 1, 0.9411765, 1,
-0.07585526, 0.2460084, -0.9408932, 0, 1, 0.945098, 1,
-0.07349353, -0.05330437, -1.68385, 0, 1, 0.9529412, 1,
-0.07233623, 1.260218, 0.3451211, 0, 1, 0.9568627, 1,
-0.07087792, 0.6647071, 0.5451404, 0, 1, 0.9647059, 1,
-0.07002746, 0.390507, -0.6465717, 0, 1, 0.9686275, 1,
-0.06936056, 0.8661659, 1.049529, 0, 1, 0.9764706, 1,
-0.06879747, 1.622462, -0.9449317, 0, 1, 0.9803922, 1,
-0.06588609, -0.3655904, -4.52668, 0, 1, 0.9882353, 1,
-0.06583451, -0.001902801, -2.099778, 0, 1, 0.9921569, 1,
-0.06323278, 1.348335, -0.3738589, 0, 1, 1, 1,
-0.06299936, -1.191048, -2.757757, 0, 0.9921569, 1, 1,
-0.06145211, 0.6807287, -1.309846, 0, 0.9882353, 1, 1,
-0.06091063, -1.896045, -3.467371, 0, 0.9803922, 1, 1,
-0.05994467, 0.4355992, 0.8912072, 0, 0.9764706, 1, 1,
-0.05811758, -0.2477504, -2.654793, 0, 0.9686275, 1, 1,
-0.05805168, -1.129822, -3.242544, 0, 0.9647059, 1, 1,
-0.05779378, 0.3570049, -0.9748475, 0, 0.9568627, 1, 1,
-0.05292873, -0.3187726, -4.140028, 0, 0.9529412, 1, 1,
-0.05256503, -0.9026771, -2.561817, 0, 0.945098, 1, 1,
-0.05167047, -1.068644, -4.80842, 0, 0.9411765, 1, 1,
-0.04954388, 0.3658699, -0.5318076, 0, 0.9333333, 1, 1,
-0.04905147, -0.8321514, -4.314849, 0, 0.9294118, 1, 1,
-0.04880642, -1.476389, -1.801836, 0, 0.9215686, 1, 1,
-0.04864985, 0.4778304, 0.9893652, 0, 0.9176471, 1, 1,
-0.04088047, -0.8646488, -4.308645, 0, 0.9098039, 1, 1,
-0.04030586, 0.07509781, -0.4862631, 0, 0.9058824, 1, 1,
-0.03805211, -0.4960622, -4.70928, 0, 0.8980392, 1, 1,
-0.03712603, -0.8866482, -2.110048, 0, 0.8901961, 1, 1,
-0.03550325, 0.9655758, -0.8254381, 0, 0.8862745, 1, 1,
-0.03332135, 1.110141, 0.7136251, 0, 0.8784314, 1, 1,
-0.03193831, 1.429227, 0.3431373, 0, 0.8745098, 1, 1,
-0.03145518, -0.2148905, -1.863603, 0, 0.8666667, 1, 1,
-0.03069286, 0.6242533, -0.1830962, 0, 0.8627451, 1, 1,
-0.02690965, -0.8003071, -2.344624, 0, 0.854902, 1, 1,
-0.0268993, 2.713601, -0.4192862, 0, 0.8509804, 1, 1,
-0.022299, 0.3120515, 0.5502679, 0, 0.8431373, 1, 1,
-0.02177283, 1.714286, -1.021427, 0, 0.8392157, 1, 1,
-0.01641393, -1.027439, -2.477813, 0, 0.8313726, 1, 1,
-0.0143311, -2.244588, -4.08116, 0, 0.827451, 1, 1,
-0.01430425, 0.05253417, -1.032966, 0, 0.8196079, 1, 1,
-0.01045767, 1.408606, -1.053383, 0, 0.8156863, 1, 1,
-0.008692958, -1.065294, -3.609273, 0, 0.8078431, 1, 1,
-0.008517972, -1.654757, -2.709879, 0, 0.8039216, 1, 1,
-0.007071125, -1.110367, -5.953503, 0, 0.7960784, 1, 1,
-0.006206806, -0.7364578, -4.893791, 0, 0.7882353, 1, 1,
-0.004858296, -0.4376867, -2.707678, 0, 0.7843137, 1, 1,
-0.002940838, 0.2654033, -0.622745, 0, 0.7764706, 1, 1,
-0.002814734, 0.0507796, -0.5448812, 0, 0.772549, 1, 1,
-0.001820514, 0.6304392, -1.77556, 0, 0.7647059, 1, 1,
0.0007797095, -1.224461, 4.093254, 0, 0.7607843, 1, 1,
0.000832749, 0.1687499, 0.9134439, 0, 0.7529412, 1, 1,
0.0009651499, 0.1786454, 0.5508837, 0, 0.7490196, 1, 1,
0.004615278, -0.01353516, 3.838701, 0, 0.7411765, 1, 1,
0.009807098, -0.1213557, 2.032583, 0, 0.7372549, 1, 1,
0.01034581, -0.5292081, 3.259675, 0, 0.7294118, 1, 1,
0.01047941, -1.054115, 2.735195, 0, 0.7254902, 1, 1,
0.01496075, -0.1033932, 2.421536, 0, 0.7176471, 1, 1,
0.01551987, 0.5795528, -0.7289811, 0, 0.7137255, 1, 1,
0.02204446, 0.3878486, 0.5822917, 0, 0.7058824, 1, 1,
0.02329296, 1.399402, -0.2150776, 0, 0.6980392, 1, 1,
0.02981268, 1.506305, 0.6284798, 0, 0.6941177, 1, 1,
0.03564709, -0.9134042, 4.343678, 0, 0.6862745, 1, 1,
0.03590263, 2.230031, 0.01280604, 0, 0.682353, 1, 1,
0.03673727, -0.4125786, 3.148089, 0, 0.6745098, 1, 1,
0.03679043, 2.497443, 0.8399345, 0, 0.6705883, 1, 1,
0.03723088, 1.149794, 2.204038, 0, 0.6627451, 1, 1,
0.03959527, -1.775284, 4.197744, 0, 0.6588235, 1, 1,
0.04309731, -0.4181296, 4.218492, 0, 0.6509804, 1, 1,
0.04635075, -0.7065396, 3.494483, 0, 0.6470588, 1, 1,
0.04711974, -1.044653, 3.405783, 0, 0.6392157, 1, 1,
0.05364905, -0.5510496, 1.652492, 0, 0.6352941, 1, 1,
0.0551138, 0.7325007, 1.643473, 0, 0.627451, 1, 1,
0.0675704, 0.4308167, 0.1813724, 0, 0.6235294, 1, 1,
0.0723273, 1.67995, 1.305184, 0, 0.6156863, 1, 1,
0.07363748, 0.1666344, 0.6246441, 0, 0.6117647, 1, 1,
0.07428876, 1.324656, 0.3457402, 0, 0.6039216, 1, 1,
0.07463468, -0.5506967, 3.420363, 0, 0.5960785, 1, 1,
0.07915289, -0.2634741, 2.801229, 0, 0.5921569, 1, 1,
0.07999294, 0.01545714, 1.485578, 0, 0.5843138, 1, 1,
0.08174474, -0.09902047, 2.302547, 0, 0.5803922, 1, 1,
0.08362591, 1.220474, 0.1853109, 0, 0.572549, 1, 1,
0.08426806, -0.09150561, 2.74994, 0, 0.5686275, 1, 1,
0.08431754, 1.682238, 1.541713, 0, 0.5607843, 1, 1,
0.08437663, 1.457191, -0.4003445, 0, 0.5568628, 1, 1,
0.08474313, 0.3147107, 0.8283796, 0, 0.5490196, 1, 1,
0.08533952, -0.09820004, 1.655053, 0, 0.5450981, 1, 1,
0.08789968, -0.2842522, 2.673805, 0, 0.5372549, 1, 1,
0.09143404, 2.130939, 2.233555, 0, 0.5333334, 1, 1,
0.09262012, -1.081908, 2.545336, 0, 0.5254902, 1, 1,
0.09578785, 1.119666, -0.3376186, 0, 0.5215687, 1, 1,
0.09915545, -0.9794929, 4.739033, 0, 0.5137255, 1, 1,
0.101462, 0.1557624, 0.2935263, 0, 0.509804, 1, 1,
0.1018527, 0.4897416, 0.1474791, 0, 0.5019608, 1, 1,
0.1029248, 0.0829834, 1.396754, 0, 0.4941176, 1, 1,
0.1107091, -1.414403, 2.137698, 0, 0.4901961, 1, 1,
0.1133661, 0.677316, 1.146402, 0, 0.4823529, 1, 1,
0.1169406, -1.484177, 3.572688, 0, 0.4784314, 1, 1,
0.121702, 1.255439, -1.527634, 0, 0.4705882, 1, 1,
0.1242857, 0.3135651, 0.438809, 0, 0.4666667, 1, 1,
0.1286286, 0.6110865, 0.2552867, 0, 0.4588235, 1, 1,
0.1293098, -0.2681628, 0.9718117, 0, 0.454902, 1, 1,
0.1293681, -0.9565478, 2.991374, 0, 0.4470588, 1, 1,
0.1433394, -0.7946525, 2.56349, 0, 0.4431373, 1, 1,
0.1437226, 0.7222053, -0.03025117, 0, 0.4352941, 1, 1,
0.1564286, 1.529864, 0.04920382, 0, 0.4313726, 1, 1,
0.1576982, -0.8077376, 4.194764, 0, 0.4235294, 1, 1,
0.1612426, 0.4583175, -0.1752379, 0, 0.4196078, 1, 1,
0.1640355, -0.6962527, 2.9313, 0, 0.4117647, 1, 1,
0.1640618, 1.612169, 1.239059, 0, 0.4078431, 1, 1,
0.1654448, 0.2416476, 0.3209347, 0, 0.4, 1, 1,
0.1683996, 0.08690742, 0.7396954, 0, 0.3921569, 1, 1,
0.1685718, 0.5048838, 0.4207767, 0, 0.3882353, 1, 1,
0.1699369, -0.6839598, 3.411307, 0, 0.3803922, 1, 1,
0.1702672, 0.9528181, 0.4265356, 0, 0.3764706, 1, 1,
0.1718587, -1.148259, 3.854627, 0, 0.3686275, 1, 1,
0.1764663, 0.2351781, 1.344724, 0, 0.3647059, 1, 1,
0.1774899, 2.486662, -1.012877, 0, 0.3568628, 1, 1,
0.1786813, -1.939476, 2.922844, 0, 0.3529412, 1, 1,
0.1841672, 0.1207673, 0.7243069, 0, 0.345098, 1, 1,
0.1897418, 0.8939701, -0.8310738, 0, 0.3411765, 1, 1,
0.1975849, -0.3766306, 2.226613, 0, 0.3333333, 1, 1,
0.2044811, -0.3121857, 2.16883, 0, 0.3294118, 1, 1,
0.2079224, -2.250123, 3.625835, 0, 0.3215686, 1, 1,
0.2105629, 0.8103904, 0.003248584, 0, 0.3176471, 1, 1,
0.2123575, -2.749815, 3.885033, 0, 0.3098039, 1, 1,
0.2137516, 0.9125948, -1.429906, 0, 0.3058824, 1, 1,
0.2157222, 0.05853197, 2.426468, 0, 0.2980392, 1, 1,
0.2158121, 1.070871, -0.2412647, 0, 0.2901961, 1, 1,
0.2158172, 0.9466003, -1.192847, 0, 0.2862745, 1, 1,
0.218527, 1.207921, -0.3825058, 0, 0.2784314, 1, 1,
0.2205771, 1.309617, 2.254733, 0, 0.2745098, 1, 1,
0.2220173, -0.1977388, 2.936662, 0, 0.2666667, 1, 1,
0.2227498, 1.006553, 0.4699034, 0, 0.2627451, 1, 1,
0.2228228, 0.3811802, -0.1853801, 0, 0.254902, 1, 1,
0.2230787, 1.582593, 1.021861, 0, 0.2509804, 1, 1,
0.2232704, -0.9537124, 1.781386, 0, 0.2431373, 1, 1,
0.2233394, 0.1697723, -0.007561605, 0, 0.2392157, 1, 1,
0.226044, -1.902288, 2.492481, 0, 0.2313726, 1, 1,
0.2266997, 0.9694815, 0.6990923, 0, 0.227451, 1, 1,
0.2341149, 1.765312, 0.03936825, 0, 0.2196078, 1, 1,
0.2372237, 2.549143, 0.4046887, 0, 0.2156863, 1, 1,
0.2380996, -1.129391, 3.708324, 0, 0.2078431, 1, 1,
0.2491767, -1.529979, 2.9899, 0, 0.2039216, 1, 1,
0.2529126, 0.4657872, 0.1685136, 0, 0.1960784, 1, 1,
0.2541077, 0.05074276, -0.1498295, 0, 0.1882353, 1, 1,
0.2563856, -2.388752, 3.132615, 0, 0.1843137, 1, 1,
0.2659763, -1.221604, 3.20289, 0, 0.1764706, 1, 1,
0.268069, 0.2979082, 0.9873508, 0, 0.172549, 1, 1,
0.2706212, 0.5595778, 1.902681, 0, 0.1647059, 1, 1,
0.2730164, 0.7311982, -0.1201796, 0, 0.1607843, 1, 1,
0.2741195, -0.0801001, 1.769612, 0, 0.1529412, 1, 1,
0.2750253, -1.339118, 3.171098, 0, 0.1490196, 1, 1,
0.2753963, 0.2024854, 2.118344, 0, 0.1411765, 1, 1,
0.2770008, 1.0198, 0.1000046, 0, 0.1372549, 1, 1,
0.2772118, -0.3710552, 0.1914575, 0, 0.1294118, 1, 1,
0.2776726, 0.8644941, 1.453372, 0, 0.1254902, 1, 1,
0.2788838, -1.534679, 5.106998, 0, 0.1176471, 1, 1,
0.2814121, -0.8762983, 2.213368, 0, 0.1137255, 1, 1,
0.2892304, -0.8218183, 3.468713, 0, 0.1058824, 1, 1,
0.2932336, -0.0120037, 2.049871, 0, 0.09803922, 1, 1,
0.2939619, 0.1659213, 2.148254, 0, 0.09411765, 1, 1,
0.2959116, 1.281332, 2.046816, 0, 0.08627451, 1, 1,
0.2988511, -0.492684, 2.574056, 0, 0.08235294, 1, 1,
0.3056314, -2.18813, 2.010449, 0, 0.07450981, 1, 1,
0.3096901, 1.983838, 0.8633283, 0, 0.07058824, 1, 1,
0.3108654, 0.6265963, -0.4869528, 0, 0.0627451, 1, 1,
0.3123203, -1.602009, 4.15819, 0, 0.05882353, 1, 1,
0.3213909, 0.3186394, -0.4226167, 0, 0.05098039, 1, 1,
0.3268599, -0.8591224, 3.623088, 0, 0.04705882, 1, 1,
0.3286429, -0.2008768, 2.721561, 0, 0.03921569, 1, 1,
0.331655, 2.439658, 3.693825, 0, 0.03529412, 1, 1,
0.3326276, -0.8253642, 2.629642, 0, 0.02745098, 1, 1,
0.3348091, 0.7292668, 1.806298, 0, 0.02352941, 1, 1,
0.3382586, -0.5868735, 1.794513, 0, 0.01568628, 1, 1,
0.3422877, -1.553929, 3.382343, 0, 0.01176471, 1, 1,
0.3451084, -0.1078844, 1.356792, 0, 0.003921569, 1, 1,
0.3492119, -1.778889, 3.389046, 0.003921569, 0, 1, 1,
0.3682831, -0.4445635, 3.170176, 0.007843138, 0, 1, 1,
0.3701406, -1.10008, 2.895063, 0.01568628, 0, 1, 1,
0.3737234, 1.024472, 0.712329, 0.01960784, 0, 1, 1,
0.3763358, 1.15305, -0.4690314, 0.02745098, 0, 1, 1,
0.378125, -1.230946, 2.085109, 0.03137255, 0, 1, 1,
0.3800605, -1.906577, 1.869936, 0.03921569, 0, 1, 1,
0.3802072, 1.95284, 0.5039431, 0.04313726, 0, 1, 1,
0.3804158, -2.0987, 2.692553, 0.05098039, 0, 1, 1,
0.3805993, 0.2592354, 1.113315, 0.05490196, 0, 1, 1,
0.3819027, 0.7807691, 0.431587, 0.0627451, 0, 1, 1,
0.3853412, 2.2085, 1.817255, 0.06666667, 0, 1, 1,
0.3897044, -0.9977357, 1.673734, 0.07450981, 0, 1, 1,
0.3921529, 0.08914062, 0.8192727, 0.07843138, 0, 1, 1,
0.3934577, 0.151071, 1.73194, 0.08627451, 0, 1, 1,
0.3971635, 0.6175184, 2.76203, 0.09019608, 0, 1, 1,
0.398331, -0.4833505, 3.704608, 0.09803922, 0, 1, 1,
0.4057537, 0.5902312, 1.54692, 0.1058824, 0, 1, 1,
0.4093791, 2.576837, -0.3368846, 0.1098039, 0, 1, 1,
0.4103568, -2.358108, 2.694065, 0.1176471, 0, 1, 1,
0.4157328, 0.2500676, 0.5491639, 0.1215686, 0, 1, 1,
0.4263766, -0.07497913, 2.719756, 0.1294118, 0, 1, 1,
0.4346461, -1.193097, 2.1401, 0.1333333, 0, 1, 1,
0.4364209, 0.7219743, 0.2512271, 0.1411765, 0, 1, 1,
0.4445829, 0.102594, 1.555999, 0.145098, 0, 1, 1,
0.4471116, 0.5321902, 1.336968, 0.1529412, 0, 1, 1,
0.447729, -1.640373, 2.277308, 0.1568628, 0, 1, 1,
0.4523565, -0.9214975, 3.321418, 0.1647059, 0, 1, 1,
0.453479, 1.452775, 1.041163, 0.1686275, 0, 1, 1,
0.4541264, -0.8996089, 3.296914, 0.1764706, 0, 1, 1,
0.458145, 0.1453277, -0.2126739, 0.1803922, 0, 1, 1,
0.460012, 0.0350858, 1.1841, 0.1882353, 0, 1, 1,
0.463771, -0.1325093, 1.551036, 0.1921569, 0, 1, 1,
0.4716375, 0.8807121, 1.850257, 0.2, 0, 1, 1,
0.4772449, 0.01618651, 0.5912284, 0.2078431, 0, 1, 1,
0.483196, -0.886591, -0.5656708, 0.2117647, 0, 1, 1,
0.4882124, -1.229555, 1.480665, 0.2196078, 0, 1, 1,
0.4955223, 1.295933, -0.5797481, 0.2235294, 0, 1, 1,
0.498808, 0.1064272, 0.1936039, 0.2313726, 0, 1, 1,
0.501838, 0.8253267, 0.4726132, 0.2352941, 0, 1, 1,
0.5079384, 1.301992, 1.464726, 0.2431373, 0, 1, 1,
0.5162833, -1.582767, 3.97275, 0.2470588, 0, 1, 1,
0.5173181, -0.6755234, 2.746318, 0.254902, 0, 1, 1,
0.5263739, -1.13559, 0.5462583, 0.2588235, 0, 1, 1,
0.5317946, -0.738369, 3.556436, 0.2666667, 0, 1, 1,
0.538958, -0.7145463, 3.110106, 0.2705882, 0, 1, 1,
0.5399759, 0.06813278, 0.7940039, 0.2784314, 0, 1, 1,
0.5422812, 0.7723522, 2.27108, 0.282353, 0, 1, 1,
0.5424969, -1.46925, 2.871514, 0.2901961, 0, 1, 1,
0.5488315, 0.7401783, -1.359808, 0.2941177, 0, 1, 1,
0.5489669, 0.4445611, 1.551368, 0.3019608, 0, 1, 1,
0.549289, 0.2745434, 0.5259994, 0.3098039, 0, 1, 1,
0.5501391, 0.3671674, 1.388721, 0.3137255, 0, 1, 1,
0.5577714, 1.168495, 0.03347789, 0.3215686, 0, 1, 1,
0.5627189, 0.9630951, 1.602854, 0.3254902, 0, 1, 1,
0.5665562, 0.09014911, -0.6948869, 0.3333333, 0, 1, 1,
0.5666636, 0.9231571, 1.272906, 0.3372549, 0, 1, 1,
0.5736129, 0.5267826, 1.296613, 0.345098, 0, 1, 1,
0.577224, -0.05802287, 0.9397228, 0.3490196, 0, 1, 1,
0.5809525, 0.2589716, -1.494017, 0.3568628, 0, 1, 1,
0.5852184, -0.4906395, 1.922798, 0.3607843, 0, 1, 1,
0.5882127, 0.1323536, 3.104174, 0.3686275, 0, 1, 1,
0.5909037, -0.8903726, 1.978995, 0.372549, 0, 1, 1,
0.5910112, 1.694648, -0.7582989, 0.3803922, 0, 1, 1,
0.5934034, -0.2325822, 2.085786, 0.3843137, 0, 1, 1,
0.5946154, 1.495121, 0.8889017, 0.3921569, 0, 1, 1,
0.598496, -1.820051, 2.509165, 0.3960784, 0, 1, 1,
0.5986426, -0.1289055, 1.579474, 0.4039216, 0, 1, 1,
0.6008578, -0.3650771, 3.518823, 0.4117647, 0, 1, 1,
0.6023095, -1.250773, 2.240121, 0.4156863, 0, 1, 1,
0.6034607, 0.1087944, 1.243365, 0.4235294, 0, 1, 1,
0.6039655, -0.2940723, 2.236456, 0.427451, 0, 1, 1,
0.6089196, -0.1547751, 2.646085, 0.4352941, 0, 1, 1,
0.6120527, -1.289338, 2.347291, 0.4392157, 0, 1, 1,
0.6148431, -0.0523813, 1.071458, 0.4470588, 0, 1, 1,
0.6153352, 1.712807, -1.187986, 0.4509804, 0, 1, 1,
0.6172684, -0.3847143, 3.093317, 0.4588235, 0, 1, 1,
0.6181634, -1.116314, 2.571846, 0.4627451, 0, 1, 1,
0.6214184, 0.4506818, 0.7700135, 0.4705882, 0, 1, 1,
0.6220965, 0.8367437, 0.7807888, 0.4745098, 0, 1, 1,
0.6282298, 0.7555674, 0.5551882, 0.4823529, 0, 1, 1,
0.6285869, 1.776737, 0.6676056, 0.4862745, 0, 1, 1,
0.6374433, 1.980234, 0.6069681, 0.4941176, 0, 1, 1,
0.641481, 0.05188334, 0.6105303, 0.5019608, 0, 1, 1,
0.6427161, 0.6175103, -0.618576, 0.5058824, 0, 1, 1,
0.6600869, -1.072583, 3.237146, 0.5137255, 0, 1, 1,
0.6686464, 0.8700557, 0.6574844, 0.5176471, 0, 1, 1,
0.6736916, -0.9759139, 1.683492, 0.5254902, 0, 1, 1,
0.6746064, -1.606142, 2.899094, 0.5294118, 0, 1, 1,
0.6750954, -0.05877877, 1.197549, 0.5372549, 0, 1, 1,
0.6779162, 0.7924136, 2.494041, 0.5411765, 0, 1, 1,
0.6813648, -0.7337702, 3.342277, 0.5490196, 0, 1, 1,
0.6821054, -2.090201, 3.737461, 0.5529412, 0, 1, 1,
0.6823633, -0.07923944, 0.7455111, 0.5607843, 0, 1, 1,
0.6842852, -0.405915, 1.406651, 0.5647059, 0, 1, 1,
0.6848736, -0.1870539, -0.7735052, 0.572549, 0, 1, 1,
0.6871656, -1.63888, 2.046456, 0.5764706, 0, 1, 1,
0.6877072, 2.374709, 0.2697153, 0.5843138, 0, 1, 1,
0.688965, -1.114684, 4.102458, 0.5882353, 0, 1, 1,
0.6905614, 1.005197, 0.8224912, 0.5960785, 0, 1, 1,
0.6915317, 0.3787432, 2.007667, 0.6039216, 0, 1, 1,
0.6925765, -1.442832, 2.700445, 0.6078432, 0, 1, 1,
0.6973377, 0.3167676, 0.7194779, 0.6156863, 0, 1, 1,
0.6995988, 2.376023, -0.1597078, 0.6196079, 0, 1, 1,
0.7064393, -0.6342409, 2.274541, 0.627451, 0, 1, 1,
0.7079552, 0.01573156, 2.857214, 0.6313726, 0, 1, 1,
0.7083351, -0.4113501, 2.850323, 0.6392157, 0, 1, 1,
0.7094054, 0.2458573, 1.271791, 0.6431373, 0, 1, 1,
0.7126771, 0.2038235, 1.786924, 0.6509804, 0, 1, 1,
0.7154501, 2.624357, -0.01097028, 0.654902, 0, 1, 1,
0.7165918, 0.8564572, 2.82991, 0.6627451, 0, 1, 1,
0.7203112, -0.09588848, 1.858915, 0.6666667, 0, 1, 1,
0.7215438, 0.2068474, 1.897321, 0.6745098, 0, 1, 1,
0.7308586, 0.6268724, 1.180369, 0.6784314, 0, 1, 1,
0.7345633, 0.4970223, -0.2321483, 0.6862745, 0, 1, 1,
0.737256, 0.8296024, 1.098251, 0.6901961, 0, 1, 1,
0.7416048, -1.043185, 3.874521, 0.6980392, 0, 1, 1,
0.7447086, -0.9428806, 2.851599, 0.7058824, 0, 1, 1,
0.7456737, 0.2544253, -0.9689798, 0.7098039, 0, 1, 1,
0.7565095, -0.3010659, 3.853177, 0.7176471, 0, 1, 1,
0.7631392, -2.560403, 2.608081, 0.7215686, 0, 1, 1,
0.7664229, -0.8187182, 1.191204, 0.7294118, 0, 1, 1,
0.7669507, -1.201391, 2.204694, 0.7333333, 0, 1, 1,
0.7678415, 0.9742994, 1.215077, 0.7411765, 0, 1, 1,
0.7733579, -0.1833437, 3.383488, 0.7450981, 0, 1, 1,
0.7748333, 1.100835, 0.6177985, 0.7529412, 0, 1, 1,
0.7793838, 0.4825253, 2.784114, 0.7568628, 0, 1, 1,
0.7830736, 0.4202341, 0.0711807, 0.7647059, 0, 1, 1,
0.7875207, 0.8355229, 2.185209, 0.7686275, 0, 1, 1,
0.7912065, 0.3087285, 3.223048, 0.7764706, 0, 1, 1,
0.7917299, -0.5636837, 2.495103, 0.7803922, 0, 1, 1,
0.797091, 0.9087876, 0.1460339, 0.7882353, 0, 1, 1,
0.7991055, -0.01368248, 1.772694, 0.7921569, 0, 1, 1,
0.8011794, 0.2999345, 0.2726142, 0.8, 0, 1, 1,
0.8107529, -1.608215, 1.921214, 0.8078431, 0, 1, 1,
0.8169874, 0.078481, 0.4943504, 0.8117647, 0, 1, 1,
0.821595, -2.250562, 2.057657, 0.8196079, 0, 1, 1,
0.8240358, 0.06572182, 1.138229, 0.8235294, 0, 1, 1,
0.8265074, 0.5370805, 1.275361, 0.8313726, 0, 1, 1,
0.8323147, -0.4451814, 2.027612, 0.8352941, 0, 1, 1,
0.8367701, -1.665743, 4.782416, 0.8431373, 0, 1, 1,
0.8369205, -0.2532993, 0.7119721, 0.8470588, 0, 1, 1,
0.8482312, 0.6439768, 1.389369, 0.854902, 0, 1, 1,
0.8514937, -1.321499, 2.737497, 0.8588235, 0, 1, 1,
0.8539991, 0.8802696, -0.1805858, 0.8666667, 0, 1, 1,
0.8737974, 1.064834, 1.782299, 0.8705882, 0, 1, 1,
0.8747814, -0.2349675, 3.288793, 0.8784314, 0, 1, 1,
0.8754269, -2.319647, 3.682563, 0.8823529, 0, 1, 1,
0.8791472, 2.172873, 0.5219147, 0.8901961, 0, 1, 1,
0.8831326, 0.8964595, -0.9514313, 0.8941177, 0, 1, 1,
0.8837256, 0.9750722, 0.1331966, 0.9019608, 0, 1, 1,
0.8896672, -0.4785225, 2.572664, 0.9098039, 0, 1, 1,
0.8971353, 0.3126458, 1.571774, 0.9137255, 0, 1, 1,
0.9054035, -1.765026, 3.327201, 0.9215686, 0, 1, 1,
0.9099496, -1.979581, 2.486689, 0.9254902, 0, 1, 1,
0.912567, -0.2435896, 1.067661, 0.9333333, 0, 1, 1,
0.915198, 0.5439132, 1.379781, 0.9372549, 0, 1, 1,
0.9212483, 0.9633858, 0.3268713, 0.945098, 0, 1, 1,
0.9355621, -1.338959, 2.779445, 0.9490196, 0, 1, 1,
0.9364895, 0.7612332, 0.5968361, 0.9568627, 0, 1, 1,
0.9427394, -1.881383, 2.794182, 0.9607843, 0, 1, 1,
0.9478366, -2.043429, 1.923284, 0.9686275, 0, 1, 1,
0.9482118, -0.1483148, 1.385486, 0.972549, 0, 1, 1,
0.9487141, -0.3939847, 1.426957, 0.9803922, 0, 1, 1,
0.950862, 0.1731262, -0.08025426, 0.9843137, 0, 1, 1,
0.9512243, 1.473139, 1.165799, 0.9921569, 0, 1, 1,
0.9519873, -0.6188896, 1.346132, 0.9960784, 0, 1, 1,
0.9525591, -1.20036, 2.02544, 1, 0, 0.9960784, 1,
0.9550819, -0.01420007, 0.5222431, 1, 0, 0.9882353, 1,
0.9557954, 1.565497, 0.2260076, 1, 0, 0.9843137, 1,
0.956124, -0.06485475, 3.069476, 1, 0, 0.9764706, 1,
0.9654474, 0.3124182, 1.197012, 1, 0, 0.972549, 1,
0.9655293, -0.2874132, 2.05983, 1, 0, 0.9647059, 1,
0.9678635, 0.2994786, 1.884863, 1, 0, 0.9607843, 1,
0.9729925, -3.197634, 4.288777, 1, 0, 0.9529412, 1,
0.9777585, -0.6141932, 0.7051513, 1, 0, 0.9490196, 1,
0.9779375, 0.42656, 2.777283, 1, 0, 0.9411765, 1,
0.9823617, -0.1573578, 2.7427, 1, 0, 0.9372549, 1,
0.9878712, -0.9249768, 2.059942, 1, 0, 0.9294118, 1,
0.9888422, -0.2064836, 1.16145, 1, 0, 0.9254902, 1,
0.9905508, -1.872643, 2.536632, 1, 0, 0.9176471, 1,
0.9972451, 0.7633368, 0.1721738, 1, 0, 0.9137255, 1,
1.001409, -1.045413, 2.001339, 1, 0, 0.9058824, 1,
1.001953, 0.506986, 1.344787, 1, 0, 0.9019608, 1,
1.011141, 0.1033081, -0.5499999, 1, 0, 0.8941177, 1,
1.015457, 1.242058, 1.070497, 1, 0, 0.8862745, 1,
1.016297, 2.201389, -0.5043289, 1, 0, 0.8823529, 1,
1.020671, -0.9045799, 3.958398, 1, 0, 0.8745098, 1,
1.021083, -0.7067543, 0.1334169, 1, 0, 0.8705882, 1,
1.021101, 0.8633496, 0.6553053, 1, 0, 0.8627451, 1,
1.027604, 0.1531428, 1.502687, 1, 0, 0.8588235, 1,
1.049329, -0.4408961, 1.977741, 1, 0, 0.8509804, 1,
1.053205, -0.3974043, 1.904342, 1, 0, 0.8470588, 1,
1.057906, -1.254114, 3.605401, 1, 0, 0.8392157, 1,
1.064566, 0.9488877, 1.028033, 1, 0, 0.8352941, 1,
1.064634, 0.3929122, -0.4668257, 1, 0, 0.827451, 1,
1.066506, -0.6460162, 1.345133, 1, 0, 0.8235294, 1,
1.067876, -1.733391, 2.927705, 1, 0, 0.8156863, 1,
1.068947, -0.6920683, 2.495224, 1, 0, 0.8117647, 1,
1.070795, -0.1492218, 1.758894, 1, 0, 0.8039216, 1,
1.071113, -0.884523, 1.563605, 1, 0, 0.7960784, 1,
1.075762, -0.9172443, 2.722076, 1, 0, 0.7921569, 1,
1.078378, 1.706246, 1.427468, 1, 0, 0.7843137, 1,
1.080864, -2.545281, 3.439209, 1, 0, 0.7803922, 1,
1.08116, -1.471418, 2.419389, 1, 0, 0.772549, 1,
1.097604, 0.01923004, 2.525793, 1, 0, 0.7686275, 1,
1.108751, 1.431627, 0.7936924, 1, 0, 0.7607843, 1,
1.110626, -0.547831, 0.01608617, 1, 0, 0.7568628, 1,
1.111512, -0.5176296, 1.96125, 1, 0, 0.7490196, 1,
1.118009, 1.340274, -0.2801607, 1, 0, 0.7450981, 1,
1.118623, 0.04013548, 1.226669, 1, 0, 0.7372549, 1,
1.123517, 0.5245181, -0.4302824, 1, 0, 0.7333333, 1,
1.129134, 1.61004, 2.518931, 1, 0, 0.7254902, 1,
1.131619, 1.443163, -0.3384343, 1, 0, 0.7215686, 1,
1.134645, 0.1113261, 2.064854, 1, 0, 0.7137255, 1,
1.134863, 0.4775702, 2.647523, 1, 0, 0.7098039, 1,
1.13626, -0.05333636, 0.7492633, 1, 0, 0.7019608, 1,
1.138912, 1.807831, 0.498192, 1, 0, 0.6941177, 1,
1.139994, -0.009366054, 1.789662, 1, 0, 0.6901961, 1,
1.150174, -0.2959463, 3.451216, 1, 0, 0.682353, 1,
1.15675, -0.7160878, 2.160765, 1, 0, 0.6784314, 1,
1.160272, 1.299778, 2.227061, 1, 0, 0.6705883, 1,
1.16132, -0.07184494, 2.970636, 1, 0, 0.6666667, 1,
1.16189, 0.09126412, -0.2410647, 1, 0, 0.6588235, 1,
1.162196, 1.405447, 1.080991, 1, 0, 0.654902, 1,
1.16232, -0.3995389, 1.712159, 1, 0, 0.6470588, 1,
1.168535, -0.456684, 0.7924846, 1, 0, 0.6431373, 1,
1.169289, -0.4487493, 2.281735, 1, 0, 0.6352941, 1,
1.183175, -1.619249, 2.224787, 1, 0, 0.6313726, 1,
1.190163, 0.4553733, 0.5137287, 1, 0, 0.6235294, 1,
1.190625, -0.5275061, 1.213773, 1, 0, 0.6196079, 1,
1.197093, -1.645373, 2.244683, 1, 0, 0.6117647, 1,
1.210441, 0.4008969, -0.3295776, 1, 0, 0.6078432, 1,
1.211445, -0.2943302, 2.238742, 1, 0, 0.6, 1,
1.211664, -0.2049674, 2.892567, 1, 0, 0.5921569, 1,
1.211689, 1.816869, 0.7651672, 1, 0, 0.5882353, 1,
1.216377, -0.3984513, 2.068323, 1, 0, 0.5803922, 1,
1.227442, 1.083369, -0.4021781, 1, 0, 0.5764706, 1,
1.232971, -1.200573, 2.870229, 1, 0, 0.5686275, 1,
1.245363, 0.09328987, -0.09909564, 1, 0, 0.5647059, 1,
1.257284, 0.1898531, 0.2782212, 1, 0, 0.5568628, 1,
1.260629, -2.04467, 3.141922, 1, 0, 0.5529412, 1,
1.262012, 0.436584, 2.238425, 1, 0, 0.5450981, 1,
1.286002, 1.752557, -0.7835477, 1, 0, 0.5411765, 1,
1.293453, -0.2824079, 1.694468, 1, 0, 0.5333334, 1,
1.307823, 1.156803, 1.978107, 1, 0, 0.5294118, 1,
1.327148, -0.6827036, 1.972262, 1, 0, 0.5215687, 1,
1.328281, -0.5419596, 2.352329, 1, 0, 0.5176471, 1,
1.334525, 0.3429007, -0.278209, 1, 0, 0.509804, 1,
1.341255, -0.1777982, 2.205387, 1, 0, 0.5058824, 1,
1.346737, -0.8177909, 4.280306, 1, 0, 0.4980392, 1,
1.355334, 0.9460562, 1.048208, 1, 0, 0.4901961, 1,
1.356663, 0.6616903, 0.6217592, 1, 0, 0.4862745, 1,
1.385319, -0.8639786, 1.44003, 1, 0, 0.4784314, 1,
1.390992, 0.1357333, 1.804815, 1, 0, 0.4745098, 1,
1.400623, 0.2954521, 1.42673, 1, 0, 0.4666667, 1,
1.411298, -0.5228153, 0.8619426, 1, 0, 0.4627451, 1,
1.411554, 0.2891164, -0.4710596, 1, 0, 0.454902, 1,
1.411982, -0.9503844, 2.219957, 1, 0, 0.4509804, 1,
1.417164, 1.001533, -0.2624395, 1, 0, 0.4431373, 1,
1.427178, -1.167466, 3.815144, 1, 0, 0.4392157, 1,
1.43194, 1.729086, 0.2151113, 1, 0, 0.4313726, 1,
1.433636, -1.376096, 0.9060693, 1, 0, 0.427451, 1,
1.438809, -0.6742389, 2.476057, 1, 0, 0.4196078, 1,
1.44082, 0.703525, 1.850466, 1, 0, 0.4156863, 1,
1.441051, 1.121787, 1.62083, 1, 0, 0.4078431, 1,
1.45048, -0.14279, 0.7249527, 1, 0, 0.4039216, 1,
1.453636, -0.3967274, 1.801462, 1, 0, 0.3960784, 1,
1.458448, -1.339172, 1.762808, 1, 0, 0.3882353, 1,
1.478704, 1.384484, -0.5682902, 1, 0, 0.3843137, 1,
1.484743, 0.3749501, 0.9295045, 1, 0, 0.3764706, 1,
1.493813, -1.904699, 2.397162, 1, 0, 0.372549, 1,
1.500558, 2.302598, -1.150694, 1, 0, 0.3647059, 1,
1.502167, -0.280009, 0.005235358, 1, 0, 0.3607843, 1,
1.504258, -0.8418978, 2.501737, 1, 0, 0.3529412, 1,
1.505444, 0.5242939, 1.772401, 1, 0, 0.3490196, 1,
1.52671, 0.6560347, 2.311918, 1, 0, 0.3411765, 1,
1.552219, -0.4409677, 1.802354, 1, 0, 0.3372549, 1,
1.562535, -1.333372, 2.550606, 1, 0, 0.3294118, 1,
1.567219, -0.4485793, 2.597282, 1, 0, 0.3254902, 1,
1.585898, 0.1421507, 0.5638098, 1, 0, 0.3176471, 1,
1.590049, 0.360638, 1.514319, 1, 0, 0.3137255, 1,
1.617373, 1.080725, 1.993402, 1, 0, 0.3058824, 1,
1.623212, -1.073128, 2.653386, 1, 0, 0.2980392, 1,
1.647321, -2.421689, 2.411422, 1, 0, 0.2941177, 1,
1.661943, -0.1960915, 0.8899153, 1, 0, 0.2862745, 1,
1.672626, -0.4291046, 2.588237, 1, 0, 0.282353, 1,
1.672632, 0.7458934, 1.697156, 1, 0, 0.2745098, 1,
1.684952, 1.710393, 0.9807338, 1, 0, 0.2705882, 1,
1.686666, -0.0868263, 1.71807, 1, 0, 0.2627451, 1,
1.688188, -1.253719, 2.411736, 1, 0, 0.2588235, 1,
1.696474, -0.8387246, 3.575732, 1, 0, 0.2509804, 1,
1.698529, 0.1793776, 3.371138, 1, 0, 0.2470588, 1,
1.719739, -0.7202439, 0.5268322, 1, 0, 0.2392157, 1,
1.739351, 0.864792, 0.9237329, 1, 0, 0.2352941, 1,
1.762335, -0.08274361, 2.372195, 1, 0, 0.227451, 1,
1.803719, 0.03879206, 2.385625, 1, 0, 0.2235294, 1,
1.812202, 0.02422936, 1.003112, 1, 0, 0.2156863, 1,
1.813847, -0.3642195, 1.151423, 1, 0, 0.2117647, 1,
1.916917, -1.147038, 1.99089, 1, 0, 0.2039216, 1,
1.92008, 0.2989374, 2.215477, 1, 0, 0.1960784, 1,
1.922765, 0.471063, -0.3369961, 1, 0, 0.1921569, 1,
1.923041, 1.865319, 1.45164, 1, 0, 0.1843137, 1,
1.936381, 1.470099, 1.737703, 1, 0, 0.1803922, 1,
1.938759, -1.825096, 4.887123, 1, 0, 0.172549, 1,
1.943434, -1.457086, 1.473442, 1, 0, 0.1686275, 1,
1.961279, -0.06523981, 1.646657, 1, 0, 0.1607843, 1,
1.977529, -1.291988, 1.003531, 1, 0, 0.1568628, 1,
2.048951, -1.922369, 3.246207, 1, 0, 0.1490196, 1,
2.073683, -0.09343212, 0.4720673, 1, 0, 0.145098, 1,
2.104121, 0.1059707, 1.871874, 1, 0, 0.1372549, 1,
2.114935, 0.8090919, 1.277416, 1, 0, 0.1333333, 1,
2.122394, 0.3951613, 2.548526, 1, 0, 0.1254902, 1,
2.123804, 1.236848, 0.6572021, 1, 0, 0.1215686, 1,
2.148682, -0.3843019, 1.205868, 1, 0, 0.1137255, 1,
2.184001, -0.6902064, 1.333879, 1, 0, 0.1098039, 1,
2.195517, 0.9606078, 1.168221, 1, 0, 0.1019608, 1,
2.198633, 1.119466, 2.015841, 1, 0, 0.09411765, 1,
2.21091, 1.583814, 1.210183, 1, 0, 0.09019608, 1,
2.222111, -1.008825, 1.714707, 1, 0, 0.08235294, 1,
2.224253, 1.042119, 0.3998995, 1, 0, 0.07843138, 1,
2.238666, 0.02475824, 2.878004, 1, 0, 0.07058824, 1,
2.281809, -1.742123, 1.277889, 1, 0, 0.06666667, 1,
2.318516, 0.6970431, 1.875561, 1, 0, 0.05882353, 1,
2.351197, -1.17519, 1.47733, 1, 0, 0.05490196, 1,
2.42651, -0.8907393, 2.38313, 1, 0, 0.04705882, 1,
2.503395, 0.5131877, 1.373698, 1, 0, 0.04313726, 1,
2.55515, 0.1767011, 1.181723, 1, 0, 0.03529412, 1,
2.595172, 1.773357, 1.537668, 1, 0, 0.03137255, 1,
2.602005, 0.2389538, 0.498711, 1, 0, 0.02352941, 1,
2.612557, -2.055203, 0.8023728, 1, 0, 0.01960784, 1,
2.680356, -1.665759, 0.9677467, 1, 0, 0.01176471, 1,
2.775035, 0.3556695, 0.2139537, 1, 0, 0.007843138, 1
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
-0.2986485, -4.637308, -7.828258, 0, -0.5, 0.5, 0.5,
-0.2986485, -4.637308, -7.828258, 1, -0.5, 0.5, 0.5,
-0.2986485, -4.637308, -7.828258, 1, 1.5, 0.5, 0.5,
-0.2986485, -4.637308, -7.828258, 0, 1.5, 0.5, 0.5
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
-4.414311, -0.3248206, -7.828258, 0, -0.5, 0.5, 0.5,
-4.414311, -0.3248206, -7.828258, 1, -0.5, 0.5, 0.5,
-4.414311, -0.3248206, -7.828258, 1, 1.5, 0.5, 0.5,
-4.414311, -0.3248206, -7.828258, 0, 1.5, 0.5, 0.5
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
-4.414311, -4.637308, -0.4232523, 0, -0.5, 0.5, 0.5,
-4.414311, -4.637308, -0.4232523, 1, -0.5, 0.5, 0.5,
-4.414311, -4.637308, -0.4232523, 1, 1.5, 0.5, 0.5,
-4.414311, -4.637308, -0.4232523, 0, 1.5, 0.5, 0.5
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
-3, -3.642118, -6.119411,
2, -3.642118, -6.119411,
-3, -3.642118, -6.119411,
-3, -3.807983, -6.404219,
-2, -3.642118, -6.119411,
-2, -3.807983, -6.404219,
-1, -3.642118, -6.119411,
-1, -3.807983, -6.404219,
0, -3.642118, -6.119411,
0, -3.807983, -6.404219,
1, -3.642118, -6.119411,
1, -3.807983, -6.404219,
2, -3.642118, -6.119411,
2, -3.807983, -6.404219
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
-3, -4.139713, -6.973835, 0, -0.5, 0.5, 0.5,
-3, -4.139713, -6.973835, 1, -0.5, 0.5, 0.5,
-3, -4.139713, -6.973835, 1, 1.5, 0.5, 0.5,
-3, -4.139713, -6.973835, 0, 1.5, 0.5, 0.5,
-2, -4.139713, -6.973835, 0, -0.5, 0.5, 0.5,
-2, -4.139713, -6.973835, 1, -0.5, 0.5, 0.5,
-2, -4.139713, -6.973835, 1, 1.5, 0.5, 0.5,
-2, -4.139713, -6.973835, 0, 1.5, 0.5, 0.5,
-1, -4.139713, -6.973835, 0, -0.5, 0.5, 0.5,
-1, -4.139713, -6.973835, 1, -0.5, 0.5, 0.5,
-1, -4.139713, -6.973835, 1, 1.5, 0.5, 0.5,
-1, -4.139713, -6.973835, 0, 1.5, 0.5, 0.5,
0, -4.139713, -6.973835, 0, -0.5, 0.5, 0.5,
0, -4.139713, -6.973835, 1, -0.5, 0.5, 0.5,
0, -4.139713, -6.973835, 1, 1.5, 0.5, 0.5,
0, -4.139713, -6.973835, 0, 1.5, 0.5, 0.5,
1, -4.139713, -6.973835, 0, -0.5, 0.5, 0.5,
1, -4.139713, -6.973835, 1, -0.5, 0.5, 0.5,
1, -4.139713, -6.973835, 1, 1.5, 0.5, 0.5,
1, -4.139713, -6.973835, 0, 1.5, 0.5, 0.5,
2, -4.139713, -6.973835, 0, -0.5, 0.5, 0.5,
2, -4.139713, -6.973835, 1, -0.5, 0.5, 0.5,
2, -4.139713, -6.973835, 1, 1.5, 0.5, 0.5,
2, -4.139713, -6.973835, 0, 1.5, 0.5, 0.5
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
-3.464543, -3, -6.119411,
-3.464543, 2, -6.119411,
-3.464543, -3, -6.119411,
-3.622838, -3, -6.404219,
-3.464543, -2, -6.119411,
-3.622838, -2, -6.404219,
-3.464543, -1, -6.119411,
-3.622838, -1, -6.404219,
-3.464543, 0, -6.119411,
-3.622838, 0, -6.404219,
-3.464543, 1, -6.119411,
-3.622838, 1, -6.404219,
-3.464543, 2, -6.119411,
-3.622838, 2, -6.404219
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
-3.939427, -3, -6.973835, 0, -0.5, 0.5, 0.5,
-3.939427, -3, -6.973835, 1, -0.5, 0.5, 0.5,
-3.939427, -3, -6.973835, 1, 1.5, 0.5, 0.5,
-3.939427, -3, -6.973835, 0, 1.5, 0.5, 0.5,
-3.939427, -2, -6.973835, 0, -0.5, 0.5, 0.5,
-3.939427, -2, -6.973835, 1, -0.5, 0.5, 0.5,
-3.939427, -2, -6.973835, 1, 1.5, 0.5, 0.5,
-3.939427, -2, -6.973835, 0, 1.5, 0.5, 0.5,
-3.939427, -1, -6.973835, 0, -0.5, 0.5, 0.5,
-3.939427, -1, -6.973835, 1, -0.5, 0.5, 0.5,
-3.939427, -1, -6.973835, 1, 1.5, 0.5, 0.5,
-3.939427, -1, -6.973835, 0, 1.5, 0.5, 0.5,
-3.939427, 0, -6.973835, 0, -0.5, 0.5, 0.5,
-3.939427, 0, -6.973835, 1, -0.5, 0.5, 0.5,
-3.939427, 0, -6.973835, 1, 1.5, 0.5, 0.5,
-3.939427, 0, -6.973835, 0, 1.5, 0.5, 0.5,
-3.939427, 1, -6.973835, 0, -0.5, 0.5, 0.5,
-3.939427, 1, -6.973835, 1, -0.5, 0.5, 0.5,
-3.939427, 1, -6.973835, 1, 1.5, 0.5, 0.5,
-3.939427, 1, -6.973835, 0, 1.5, 0.5, 0.5,
-3.939427, 2, -6.973835, 0, -0.5, 0.5, 0.5,
-3.939427, 2, -6.973835, 1, -0.5, 0.5, 0.5,
-3.939427, 2, -6.973835, 1, 1.5, 0.5, 0.5,
-3.939427, 2, -6.973835, 0, 1.5, 0.5, 0.5
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
-3.464543, -3.642118, -4,
-3.464543, -3.642118, 4,
-3.464543, -3.642118, -4,
-3.622838, -3.807983, -4,
-3.464543, -3.642118, -2,
-3.622838, -3.807983, -2,
-3.464543, -3.642118, 0,
-3.622838, -3.807983, 0,
-3.464543, -3.642118, 2,
-3.622838, -3.807983, 2,
-3.464543, -3.642118, 4,
-3.622838, -3.807983, 4
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
-3.939427, -4.139713, -4, 0, -0.5, 0.5, 0.5,
-3.939427, -4.139713, -4, 1, -0.5, 0.5, 0.5,
-3.939427, -4.139713, -4, 1, 1.5, 0.5, 0.5,
-3.939427, -4.139713, -4, 0, 1.5, 0.5, 0.5,
-3.939427, -4.139713, -2, 0, -0.5, 0.5, 0.5,
-3.939427, -4.139713, -2, 1, -0.5, 0.5, 0.5,
-3.939427, -4.139713, -2, 1, 1.5, 0.5, 0.5,
-3.939427, -4.139713, -2, 0, 1.5, 0.5, 0.5,
-3.939427, -4.139713, 0, 0, -0.5, 0.5, 0.5,
-3.939427, -4.139713, 0, 1, -0.5, 0.5, 0.5,
-3.939427, -4.139713, 0, 1, 1.5, 0.5, 0.5,
-3.939427, -4.139713, 0, 0, 1.5, 0.5, 0.5,
-3.939427, -4.139713, 2, 0, -0.5, 0.5, 0.5,
-3.939427, -4.139713, 2, 1, -0.5, 0.5, 0.5,
-3.939427, -4.139713, 2, 1, 1.5, 0.5, 0.5,
-3.939427, -4.139713, 2, 0, 1.5, 0.5, 0.5,
-3.939427, -4.139713, 4, 0, -0.5, 0.5, 0.5,
-3.939427, -4.139713, 4, 1, -0.5, 0.5, 0.5,
-3.939427, -4.139713, 4, 1, 1.5, 0.5, 0.5,
-3.939427, -4.139713, 4, 0, 1.5, 0.5, 0.5
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
-3.464543, -3.642118, -6.119411,
-3.464543, 2.992477, -6.119411,
-3.464543, -3.642118, 5.272906,
-3.464543, 2.992477, 5.272906,
-3.464543, -3.642118, -6.119411,
-3.464543, -3.642118, 5.272906,
-3.464543, 2.992477, -6.119411,
-3.464543, 2.992477, 5.272906,
-3.464543, -3.642118, -6.119411,
2.867246, -3.642118, -6.119411,
-3.464543, -3.642118, 5.272906,
2.867246, -3.642118, 5.272906,
-3.464543, 2.992477, -6.119411,
2.867246, 2.992477, -6.119411,
-3.464543, 2.992477, 5.272906,
2.867246, 2.992477, 5.272906,
2.867246, -3.642118, -6.119411,
2.867246, 2.992477, -6.119411,
2.867246, -3.642118, 5.272906,
2.867246, 2.992477, 5.272906,
2.867246, -3.642118, -6.119411,
2.867246, -3.642118, 5.272906,
2.867246, 2.992477, -6.119411,
2.867246, 2.992477, 5.272906
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
var radius = 7.809533;
var distance = 34.74549;
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
mvMatrix.translate( 0.2986485, 0.3248206, 0.4232523 );
mvMatrix.scale( 1.33356, 1.272696, 0.7411855 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.74549);
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
Thiofanox<-read.table("Thiofanox.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Thiofanox$V2
```

```
## Error in eval(expr, envir, enclos): object 'Thiofanox' not found
```

```r
y<-Thiofanox$V3
```

```
## Error in eval(expr, envir, enclos): object 'Thiofanox' not found
```

```r
z<-Thiofanox$V4
```

```
## Error in eval(expr, envir, enclos): object 'Thiofanox' not found
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
-3.372332, 0.2536137, -0.7340069, 0, 0, 1, 1, 1,
-2.61234, -0.8792066, -1.648007, 1, 0, 0, 1, 1,
-2.521608, -1.498732, -1.287009, 1, 0, 0, 1, 1,
-2.484655, -1.879802, -2.624634, 1, 0, 0, 1, 1,
-2.463142, -1.97325, -2.304314, 1, 0, 0, 1, 1,
-2.455114, 0.6731442, -0.436444, 1, 0, 0, 1, 1,
-2.454073, -0.4137081, -2.732963, 0, 0, 0, 1, 1,
-2.433538, 0.2477549, -2.67863, 0, 0, 0, 1, 1,
-2.390871, -0.9618009, -2.843085, 0, 0, 0, 1, 1,
-2.365234, 1.453287, -1.805494, 0, 0, 0, 1, 1,
-2.340944, 0.05953488, -2.959448, 0, 0, 0, 1, 1,
-2.318936, -0.4870719, -1.430835, 0, 0, 0, 1, 1,
-2.287871, -0.1344, -2.3815, 0, 0, 0, 1, 1,
-2.274606, 0.1629638, -2.39325, 1, 1, 1, 1, 1,
-2.179965, 2.654981, -0.6425458, 1, 1, 1, 1, 1,
-2.168124, 0.3015321, -1.696727, 1, 1, 1, 1, 1,
-2.159853, 1.137517, -0.5581304, 1, 1, 1, 1, 1,
-2.084556, -0.5519339, -1.579875, 1, 1, 1, 1, 1,
-2.049352, -1.189617, -1.997432, 1, 1, 1, 1, 1,
-2.043099, -0.3049948, -2.857722, 1, 1, 1, 1, 1,
-2.036355, -0.4203514, -2.602748, 1, 1, 1, 1, 1,
-2.01156, -0.1532776, -3.277301, 1, 1, 1, 1, 1,
-1.991986, 1.067558, -1.704953, 1, 1, 1, 1, 1,
-1.985747, -0.2663841, -2.322224, 1, 1, 1, 1, 1,
-1.947257, 1.296977, -2.351649, 1, 1, 1, 1, 1,
-1.891335, 0.7059129, -1.678773, 1, 1, 1, 1, 1,
-1.886645, -0.4168191, -0.669663, 1, 1, 1, 1, 1,
-1.871708, -1.219033, -3.554133, 1, 1, 1, 1, 1,
-1.871649, -0.7061942, -0.4476372, 0, 0, 1, 1, 1,
-1.870294, 0.3915194, -2.149741, 1, 0, 0, 1, 1,
-1.850493, -0.7600951, -2.517287, 1, 0, 0, 1, 1,
-1.81743, 0.3265538, -1.568412, 1, 0, 0, 1, 1,
-1.805667, 0.7438504, -0.2598472, 1, 0, 0, 1, 1,
-1.793592, -0.5442217, -3.368284, 1, 0, 0, 1, 1,
-1.779998, 0.02753044, -3.43441, 0, 0, 0, 1, 1,
-1.760141, -0.7639522, -1.570675, 0, 0, 0, 1, 1,
-1.756017, 1.313079, -2.026657, 0, 0, 0, 1, 1,
-1.750163, 2.267803, -0.3627074, 0, 0, 0, 1, 1,
-1.749236, 0.07106224, -1.573929, 0, 0, 0, 1, 1,
-1.733621, -1.429115, -2.025783, 0, 0, 0, 1, 1,
-1.724441, 0.1009163, -2.97108, 0, 0, 0, 1, 1,
-1.708876, 0.1426501, -1.625877, 1, 1, 1, 1, 1,
-1.690422, -2.697047, -2.197812, 1, 1, 1, 1, 1,
-1.678378, -0.7588789, -2.642301, 1, 1, 1, 1, 1,
-1.675729, -1.173861, -1.968684, 1, 1, 1, 1, 1,
-1.672742, 1.084566, -1.905601, 1, 1, 1, 1, 1,
-1.653032, -0.2389986, -2.189666, 1, 1, 1, 1, 1,
-1.649754, -0.001738837, -2.322212, 1, 1, 1, 1, 1,
-1.60524, -0.1675496, -1.739936, 1, 1, 1, 1, 1,
-1.571119, 1.635649, 0.005604736, 1, 1, 1, 1, 1,
-1.560828, -0.5983045, -2.903331, 1, 1, 1, 1, 1,
-1.555683, -0.06143694, -2.956208, 1, 1, 1, 1, 1,
-1.546693, 1.56829, -1.136515, 1, 1, 1, 1, 1,
-1.527851, -0.05994924, -0.8132669, 1, 1, 1, 1, 1,
-1.525459, 0.7161211, -1.384131, 1, 1, 1, 1, 1,
-1.523819, 0.5347111, -1.688082, 1, 1, 1, 1, 1,
-1.519614, 1.85428, 0.09532563, 0, 0, 1, 1, 1,
-1.518612, -0.5919839, -2.294958, 1, 0, 0, 1, 1,
-1.517792, -0.2333268, -0.5445064, 1, 0, 0, 1, 1,
-1.507529, -0.747727, 0.1293077, 1, 0, 0, 1, 1,
-1.493527, 0.6415414, -2.780588, 1, 0, 0, 1, 1,
-1.493065, 0.05590622, -0.403641, 1, 0, 0, 1, 1,
-1.491737, 0.374408, 0.005691897, 0, 0, 0, 1, 1,
-1.486208, -0.2484777, -0.9955715, 0, 0, 0, 1, 1,
-1.48356, -0.2239246, -0.9318717, 0, 0, 0, 1, 1,
-1.479761, 1.416316, -2.292658, 0, 0, 0, 1, 1,
-1.474681, 0.7247106, -1.284835, 0, 0, 0, 1, 1,
-1.473152, -0.1293596, -0.8531499, 0, 0, 0, 1, 1,
-1.46424, 0.9181232, -0.4583803, 0, 0, 0, 1, 1,
-1.463547, 1.200389, -1.336515, 1, 1, 1, 1, 1,
-1.461024, 0.8291385, -1.218328, 1, 1, 1, 1, 1,
-1.459137, 0.3861388, -3.200184, 1, 1, 1, 1, 1,
-1.454608, 1.610526, -0.9684088, 1, 1, 1, 1, 1,
-1.451646, -0.2744619, -3.151376, 1, 1, 1, 1, 1,
-1.435451, 1.830969, -0.2387819, 1, 1, 1, 1, 1,
-1.431327, -0.7752408, -1.498881, 1, 1, 1, 1, 1,
-1.429471, 0.3146482, -0.09499202, 1, 1, 1, 1, 1,
-1.428936, -0.2733181, -1.736733, 1, 1, 1, 1, 1,
-1.422481, -1.252293, -2.389379, 1, 1, 1, 1, 1,
-1.421654, 1.293032, -0.890353, 1, 1, 1, 1, 1,
-1.416643, -0.974564, -3.424265, 1, 1, 1, 1, 1,
-1.415489, -0.2578125, -0.4261655, 1, 1, 1, 1, 1,
-1.407283, -1.581843, -1.438563, 1, 1, 1, 1, 1,
-1.407044, -1.66348, -1.313747, 1, 1, 1, 1, 1,
-1.406999, -3.145346, -1.705927, 0, 0, 1, 1, 1,
-1.406144, 1.497338, -0.3358154, 1, 0, 0, 1, 1,
-1.393845, -0.9381598, -2.989902, 1, 0, 0, 1, 1,
-1.39294, -1.650675, -1.879503, 1, 0, 0, 1, 1,
-1.391889, -2.013417, -3.053081, 1, 0, 0, 1, 1,
-1.370104, 1.816645, -0.1955859, 1, 0, 0, 1, 1,
-1.367902, 0.7158349, -2.090057, 0, 0, 0, 1, 1,
-1.363189, 0.6430923, -0.5494848, 0, 0, 0, 1, 1,
-1.354235, -1.424199, -3.17924, 0, 0, 0, 1, 1,
-1.349865, 0.5525734, -1.48801, 0, 0, 0, 1, 1,
-1.34824, 0.3809893, -2.013183, 0, 0, 0, 1, 1,
-1.347364, 0.03387161, -0.426992, 0, 0, 0, 1, 1,
-1.347164, 0.5018424, -0.552977, 0, 0, 0, 1, 1,
-1.343174, 0.4190985, -1.806583, 1, 1, 1, 1, 1,
-1.341374, 0.7072342, 1.360082, 1, 1, 1, 1, 1,
-1.339357, -2.381153, -1.262708, 1, 1, 1, 1, 1,
-1.336291, 0.1621845, -3.487083, 1, 1, 1, 1, 1,
-1.336207, -0.1576325, -2.800283, 1, 1, 1, 1, 1,
-1.334775, -0.581031, -3.817949, 1, 1, 1, 1, 1,
-1.330244, -1.419036, -2.209669, 1, 1, 1, 1, 1,
-1.319816, 1.260981, -0.182614, 1, 1, 1, 1, 1,
-1.319348, -0.822521, -1.11368, 1, 1, 1, 1, 1,
-1.313439, -0.836754, -1.063683, 1, 1, 1, 1, 1,
-1.311876, -0.2393547, -2.804764, 1, 1, 1, 1, 1,
-1.308076, -0.5413995, -1.534491, 1, 1, 1, 1, 1,
-1.308071, 0.4799115, -0.9462295, 1, 1, 1, 1, 1,
-1.307989, 1.10244, -0.6011599, 1, 1, 1, 1, 1,
-1.3066, 0.2508439, -2.547541, 1, 1, 1, 1, 1,
-1.303282, -0.8170062, -2.167877, 0, 0, 1, 1, 1,
-1.290784, -1.880825, -2.201703, 1, 0, 0, 1, 1,
-1.287329, 0.2742364, -0.5246471, 1, 0, 0, 1, 1,
-1.283026, -0.4826006, -3.511311, 1, 0, 0, 1, 1,
-1.278032, 0.007889665, 0.159987, 1, 0, 0, 1, 1,
-1.271471, -0.2640917, -1.031307, 1, 0, 0, 1, 1,
-1.258259, -0.5739475, -1.650255, 0, 0, 0, 1, 1,
-1.256799, 2.343119, -0.6449132, 0, 0, 0, 1, 1,
-1.251485, -0.8082727, -3.215888, 0, 0, 0, 1, 1,
-1.248282, 1.168545, -1.244129, 0, 0, 0, 1, 1,
-1.245824, 1.649105, 0.2843093, 0, 0, 0, 1, 1,
-1.232635, -0.6927993, -4.203814, 0, 0, 0, 1, 1,
-1.231514, -0.4496593, -1.250396, 0, 0, 0, 1, 1,
-1.223665, -1.840723, -2.120041, 1, 1, 1, 1, 1,
-1.215655, 0.6492098, -0.6737913, 1, 1, 1, 1, 1,
-1.207581, 1.001291, -0.9202087, 1, 1, 1, 1, 1,
-1.204315, 0.1863963, -0.7054818, 1, 1, 1, 1, 1,
-1.201948, -0.1155963, -0.7083358, 1, 1, 1, 1, 1,
-1.200794, 0.7574587, -1.956468, 1, 1, 1, 1, 1,
-1.194514, 1.355223, 0.6947671, 1, 1, 1, 1, 1,
-1.191983, 0.3509268, -1.654202, 1, 1, 1, 1, 1,
-1.19197, -0.7051239, -2.461683, 1, 1, 1, 1, 1,
-1.188336, -0.8246238, -3.33245, 1, 1, 1, 1, 1,
-1.188125, -1.815309, -3.448572, 1, 1, 1, 1, 1,
-1.187701, -0.7403844, -2.71258, 1, 1, 1, 1, 1,
-1.180306, 0.538062, -2.515656, 1, 1, 1, 1, 1,
-1.174832, -0.3788576, -1.335483, 1, 1, 1, 1, 1,
-1.169352, 1.79672, -0.6108625, 1, 1, 1, 1, 1,
-1.165452, 1.090046, -0.3255848, 0, 0, 1, 1, 1,
-1.158158, -1.180464, -2.733612, 1, 0, 0, 1, 1,
-1.154273, 0.7121149, -0.5779783, 1, 0, 0, 1, 1,
-1.150846, -0.7478483, -1.36986, 1, 0, 0, 1, 1,
-1.150751, -0.24558, -0.2364066, 1, 0, 0, 1, 1,
-1.144645, -0.02969513, -2.345574, 1, 0, 0, 1, 1,
-1.142142, 0.9531098, 0.10777, 0, 0, 0, 1, 1,
-1.138675, 0.5763871, -2.522377, 0, 0, 0, 1, 1,
-1.137354, 2.706594, 1.234719, 0, 0, 0, 1, 1,
-1.132276, 1.58138, -0.4212594, 0, 0, 0, 1, 1,
-1.130821, -0.98488, -1.510781, 0, 0, 0, 1, 1,
-1.128564, -0.9581795, -3.970809, 0, 0, 0, 1, 1,
-1.127424, 1.867609, -0.4720859, 0, 0, 0, 1, 1,
-1.12057, -0.05741803, -0.8149298, 1, 1, 1, 1, 1,
-1.119808, 0.3964901, -1.687079, 1, 1, 1, 1, 1,
-1.112693, -0.1795633, -2.743644, 1, 1, 1, 1, 1,
-1.11092, -0.01435251, -1.754488, 1, 1, 1, 1, 1,
-1.091804, -1.455965, -3.209846, 1, 1, 1, 1, 1,
-1.077913, 1.726272, -1.263733, 1, 1, 1, 1, 1,
-1.069268, 0.07054681, -2.412913, 1, 1, 1, 1, 1,
-1.062837, -0.9728363, -4.47884, 1, 1, 1, 1, 1,
-1.05645, 0.3371857, -0.895318, 1, 1, 1, 1, 1,
-1.053865, 1.096174, -0.8261787, 1, 1, 1, 1, 1,
-1.047007, -2.121215, -3.472371, 1, 1, 1, 1, 1,
-1.045618, -0.6826188, -3.090344, 1, 1, 1, 1, 1,
-1.041341, -0.8845419, -2.775409, 1, 1, 1, 1, 1,
-1.039106, -0.7307906, -1.65848, 1, 1, 1, 1, 1,
-1.036427, 1.460592, -0.3416643, 1, 1, 1, 1, 1,
-1.035221, 0.2910246, -0.9963505, 0, 0, 1, 1, 1,
-1.034379, 1.562722, 0.5739899, 1, 0, 0, 1, 1,
-1.019825, -1.405271, -2.018818, 1, 0, 0, 1, 1,
-1.017467, -0.4642684, -3.815031, 1, 0, 0, 1, 1,
-1.016542, 0.874115, -0.7393943, 1, 0, 0, 1, 1,
-1.003633, 0.2269247, -1.955789, 1, 0, 0, 1, 1,
-0.9952645, 0.2753209, -0.7184598, 0, 0, 0, 1, 1,
-0.9867529, -0.961341, -0.2956751, 0, 0, 0, 1, 1,
-0.9866577, 0.08485918, -0.7964926, 0, 0, 0, 1, 1,
-0.9866254, 2.544992, -2.668512, 0, 0, 0, 1, 1,
-0.9860427, -1.823612, -2.942584, 0, 0, 0, 1, 1,
-0.9846143, 0.4113535, -1.731771, 0, 0, 0, 1, 1,
-0.9755263, 0.7587718, -2.246871, 0, 0, 0, 1, 1,
-0.9706658, -1.65427, -4.190906, 1, 1, 1, 1, 1,
-0.9648001, -1.671351, -2.647639, 1, 1, 1, 1, 1,
-0.9633759, 0.03581966, 0.003971744, 1, 1, 1, 1, 1,
-0.9608773, -0.2529911, -1.127169, 1, 1, 1, 1, 1,
-0.9598719, 0.4156756, 0.4390034, 1, 1, 1, 1, 1,
-0.9538433, -1.502473, -2.377403, 1, 1, 1, 1, 1,
-0.9529698, -1.214332, -3.308962, 1, 1, 1, 1, 1,
-0.9467477, 0.4962639, -0.928131, 1, 1, 1, 1, 1,
-0.9358299, 0.336891, -1.432034, 1, 1, 1, 1, 1,
-0.9343143, 1.439976, -1.389305, 1, 1, 1, 1, 1,
-0.931383, 0.45252, -1.670837, 1, 1, 1, 1, 1,
-0.928217, -1.645661, -2.625482, 1, 1, 1, 1, 1,
-0.9269039, -0.8734819, -2.852666, 1, 1, 1, 1, 1,
-0.9238368, -0.3164301, -0.6012297, 1, 1, 1, 1, 1,
-0.9096904, -0.4781977, -0.4028852, 1, 1, 1, 1, 1,
-0.9085666, -0.8906173, -1.631076, 0, 0, 1, 1, 1,
-0.8954061, -0.8132842, -2.577623, 1, 0, 0, 1, 1,
-0.8952954, 0.005890336, -3.011438, 1, 0, 0, 1, 1,
-0.8932973, 0.3451501, -1.703336, 1, 0, 0, 1, 1,
-0.8914199, -0.6314431, -3.040996, 1, 0, 0, 1, 1,
-0.8894711, -0.257315, -4.071162, 1, 0, 0, 1, 1,
-0.8881086, 2.066991, 0.05527755, 0, 0, 0, 1, 1,
-0.8869939, -0.5554373, -2.484682, 0, 0, 0, 1, 1,
-0.8853329, -2.078363, -3.119116, 0, 0, 0, 1, 1,
-0.883035, 2.204653, -1.510643, 0, 0, 0, 1, 1,
-0.8813146, 1.594919, -1.778556, 0, 0, 0, 1, 1,
-0.8812281, -0.9106259, -2.360599, 0, 0, 0, 1, 1,
-0.8769864, -0.7932029, -2.546858, 0, 0, 0, 1, 1,
-0.8758304, 0.4251369, 1.825472, 1, 1, 1, 1, 1,
-0.8674635, 1.367168, -0.4601499, 1, 1, 1, 1, 1,
-0.8624772, -0.4981597, -2.666102, 1, 1, 1, 1, 1,
-0.8597799, 0.07967157, -2.382266, 1, 1, 1, 1, 1,
-0.8539237, 0.9545987, -1.61347, 1, 1, 1, 1, 1,
-0.8508359, 0.9065543, -2.909148, 1, 1, 1, 1, 1,
-0.849261, -0.5143367, -2.537917, 1, 1, 1, 1, 1,
-0.8438989, 0.9720353, -0.856985, 1, 1, 1, 1, 1,
-0.8429478, 0.3385805, -1.845669, 1, 1, 1, 1, 1,
-0.8369898, -0.2308173, -2.88827, 1, 1, 1, 1, 1,
-0.8354469, -1.29417, -3.429508, 1, 1, 1, 1, 1,
-0.8302915, -1.264135, -3.202526, 1, 1, 1, 1, 1,
-0.8253922, 1.460367, -0.03721142, 1, 1, 1, 1, 1,
-0.8243148, 0.3197586, -1.426215, 1, 1, 1, 1, 1,
-0.8226857, 0.09436388, -3.205985, 1, 1, 1, 1, 1,
-0.8217915, -0.05018599, -1.911346, 0, 0, 1, 1, 1,
-0.8172733, -0.5799696, -2.834363, 1, 0, 0, 1, 1,
-0.8168288, 0.2950429, -0.8806149, 1, 0, 0, 1, 1,
-0.8152015, -1.588506, -1.431983, 1, 0, 0, 1, 1,
-0.8147017, 0.5120009, -0.743731, 1, 0, 0, 1, 1,
-0.8140808, -0.4447087, -2.220432, 1, 0, 0, 1, 1,
-0.8137358, 0.4153248, -0.1055145, 0, 0, 0, 1, 1,
-0.811911, 2.895857, -0.2058788, 0, 0, 0, 1, 1,
-0.8106695, 0.001115103, -0.5137019, 0, 0, 0, 1, 1,
-0.8063449, 2.358289, -1.579658, 0, 0, 0, 1, 1,
-0.8039005, 1.305099, -0.3323626, 0, 0, 0, 1, 1,
-0.8022404, -0.6080868, -2.846196, 0, 0, 0, 1, 1,
-0.7937558, 1.30026, 0.7034299, 0, 0, 0, 1, 1,
-0.7817431, 0.2803026, -1.760624, 1, 1, 1, 1, 1,
-0.7779476, -0.1646537, -2.053635, 1, 1, 1, 1, 1,
-0.774913, 1.908401, -0.90005, 1, 1, 1, 1, 1,
-0.7748726, 2.157814, -2.034296, 1, 1, 1, 1, 1,
-0.772559, -0.6128388, -3.114744, 1, 1, 1, 1, 1,
-0.7640367, -1.214733, -2.413411, 1, 1, 1, 1, 1,
-0.7636331, -0.7045389, -3.893796, 1, 1, 1, 1, 1,
-0.7614877, 0.09586287, -1.024384, 1, 1, 1, 1, 1,
-0.7582442, -0.2106141, -1.917741, 1, 1, 1, 1, 1,
-0.756575, -1.331908, -2.338055, 1, 1, 1, 1, 1,
-0.7509078, -0.5640574, -2.879437, 1, 1, 1, 1, 1,
-0.7502006, -0.06759766, -1.178032, 1, 1, 1, 1, 1,
-0.7487387, -1.095501, -3.847007, 1, 1, 1, 1, 1,
-0.7466193, 0.269296, -1.622963, 1, 1, 1, 1, 1,
-0.7426738, -2.445783, -2.345481, 1, 1, 1, 1, 1,
-0.7417014, -0.8409595, -3.558675, 0, 0, 1, 1, 1,
-0.739127, -1.85536, -2.484932, 1, 0, 0, 1, 1,
-0.7362938, 0.2455113, -1.035133, 1, 0, 0, 1, 1,
-0.7332005, -2.005023, -2.932398, 1, 0, 0, 1, 1,
-0.7221865, 0.7269446, -0.6137288, 1, 0, 0, 1, 1,
-0.7175178, 0.8725321, -0.2832983, 1, 0, 0, 1, 1,
-0.711406, 0.7212799, -1.189022, 0, 0, 0, 1, 1,
-0.7037045, -1.362423, -3.829396, 0, 0, 0, 1, 1,
-0.7035292, 0.8635625, -1.949098, 0, 0, 0, 1, 1,
-0.6899047, 1.52935, 1.112436, 0, 0, 0, 1, 1,
-0.6876338, 1.324275, 1.69365, 0, 0, 0, 1, 1,
-0.6871451, 0.7411392, 1.161135, 0, 0, 0, 1, 1,
-0.6861375, 1.441221, -2.236069, 0, 0, 0, 1, 1,
-0.685775, 1.481011, -2.019806, 1, 1, 1, 1, 1,
-0.6838528, -1.473041, -3.027734, 1, 1, 1, 1, 1,
-0.6814377, -0.4098263, -2.718745, 1, 1, 1, 1, 1,
-0.6799825, -0.5386977, -3.965852, 1, 1, 1, 1, 1,
-0.6751922, -0.6523295, -0.4285519, 1, 1, 1, 1, 1,
-0.669346, -1.384012, -1.917798, 1, 1, 1, 1, 1,
-0.6686315, 1.712262, -0.2152587, 1, 1, 1, 1, 1,
-0.6674959, -1.570177, -1.134955, 1, 1, 1, 1, 1,
-0.6670548, 1.357842, 1.317208, 1, 1, 1, 1, 1,
-0.6651592, -0.5148417, -1.506354, 1, 1, 1, 1, 1,
-0.6648568, -0.9164716, -0.4962422, 1, 1, 1, 1, 1,
-0.664306, -1.033246, -1.790015, 1, 1, 1, 1, 1,
-0.6636651, 0.1577242, 1.201708, 1, 1, 1, 1, 1,
-0.6606903, 0.7325473, -0.9958605, 1, 1, 1, 1, 1,
-0.6499185, 0.3213012, -0.4720836, 1, 1, 1, 1, 1,
-0.6491486, -0.9597242, -1.935069, 0, 0, 1, 1, 1,
-0.6488736, -0.5967313, -2.478539, 1, 0, 0, 1, 1,
-0.6488569, -0.4218748, -2.048154, 1, 0, 0, 1, 1,
-0.6470091, 0.1310263, -1.984633, 1, 0, 0, 1, 1,
-0.6437348, 0.7050114, 0.005223192, 1, 0, 0, 1, 1,
-0.6407526, 2.18733, -0.01412051, 1, 0, 0, 1, 1,
-0.6357291, -0.9004759, -4.219029, 0, 0, 0, 1, 1,
-0.6330339, -0.02920085, -0.6427917, 0, 0, 0, 1, 1,
-0.6320339, 0.8431678, -1.089864, 0, 0, 0, 1, 1,
-0.6312454, -1.138964, -1.915087, 0, 0, 0, 1, 1,
-0.6271986, 1.803522, -1.47239, 0, 0, 0, 1, 1,
-0.6244524, 1.38829, 0.7388539, 0, 0, 0, 1, 1,
-0.6173009, 0.4681512, -2.085199, 0, 0, 0, 1, 1,
-0.615933, 0.03197102, 0.21801, 1, 1, 1, 1, 1,
-0.6131217, -1.16579, -2.357356, 1, 1, 1, 1, 1,
-0.6123525, 1.201751, -0.7118611, 1, 1, 1, 1, 1,
-0.610428, -0.3444132, -1.893149, 1, 1, 1, 1, 1,
-0.6102057, -0.4569528, -2.641304, 1, 1, 1, 1, 1,
-0.6049897, 2.030933, -1.276017, 1, 1, 1, 1, 1,
-0.6031578, -0.721972, -2.644098, 1, 1, 1, 1, 1,
-0.6000696, -0.2766057, -3.486634, 1, 1, 1, 1, 1,
-0.5972411, -0.2155425, -2.171265, 1, 1, 1, 1, 1,
-0.5965838, -0.3640209, -3.470315, 1, 1, 1, 1, 1,
-0.5889887, -0.6883538, -2.211706, 1, 1, 1, 1, 1,
-0.5887104, -0.9356773, -3.178348, 1, 1, 1, 1, 1,
-0.58765, -1.412797, -3.843514, 1, 1, 1, 1, 1,
-0.5773277, 0.5088984, 0.2851807, 1, 1, 1, 1, 1,
-0.5751814, -0.2093161, -3.109428, 1, 1, 1, 1, 1,
-0.5682732, 0.427427, -1.987345, 0, 0, 1, 1, 1,
-0.5617525, 0.01443054, -2.916859, 1, 0, 0, 1, 1,
-0.5555993, -0.125046, -1.794496, 1, 0, 0, 1, 1,
-0.55472, -0.1724698, -1.67251, 1, 0, 0, 1, 1,
-0.5529826, 0.07788915, -1.654688, 1, 0, 0, 1, 1,
-0.5529625, 1.309232, -1.205567, 1, 0, 0, 1, 1,
-0.5516709, -1.411529, -3.761914, 0, 0, 0, 1, 1,
-0.5467988, 1.229816, -0.6534893, 0, 0, 0, 1, 1,
-0.5456029, 1.030575, -0.6909624, 0, 0, 0, 1, 1,
-0.5452047, -0.158367, -1.895407, 0, 0, 0, 1, 1,
-0.5448558, 1.528173, -0.5121705, 0, 0, 0, 1, 1,
-0.5434704, -0.7384132, -2.088448, 0, 0, 0, 1, 1,
-0.5375263, -0.9947804, -3.383555, 0, 0, 0, 1, 1,
-0.5347405, 0.03939141, -1.429211, 1, 1, 1, 1, 1,
-0.5305462, -0.716906, -3.562486, 1, 1, 1, 1, 1,
-0.5303099, 0.7998127, 0.7685391, 1, 1, 1, 1, 1,
-0.5276091, -0.8058101, -3.874831, 1, 1, 1, 1, 1,
-0.5255436, 0.04816386, -2.311552, 1, 1, 1, 1, 1,
-0.5252022, 0.4485816, -1.099688, 1, 1, 1, 1, 1,
-0.5154415, 0.3962343, 0.1357943, 1, 1, 1, 1, 1,
-0.5144302, -0.1074714, -3.373677, 1, 1, 1, 1, 1,
-0.5115381, 0.6884552, -0.1712536, 1, 1, 1, 1, 1,
-0.5059401, 0.8577238, -0.6180099, 1, 1, 1, 1, 1,
-0.5033489, 0.06045142, -2.851679, 1, 1, 1, 1, 1,
-0.4982473, 1.94922, -0.2464689, 1, 1, 1, 1, 1,
-0.4933912, -0.9153571, -3.403237, 1, 1, 1, 1, 1,
-0.4915693, 0.5661024, -0.222714, 1, 1, 1, 1, 1,
-0.4871658, -1.647391, -2.815319, 1, 1, 1, 1, 1,
-0.4864738, -0.695383, -2.095048, 0, 0, 1, 1, 1,
-0.4832217, 2.349691, 0.4850763, 1, 0, 0, 1, 1,
-0.4779777, 1.307485, -1.148859, 1, 0, 0, 1, 1,
-0.4703556, 1.330355, -0.7238163, 1, 0, 0, 1, 1,
-0.4697332, -2.147162, -3.232121, 1, 0, 0, 1, 1,
-0.4679465, -0.8234271, -5.444579, 1, 0, 0, 1, 1,
-0.4672155, -2.341437, -1.109475, 0, 0, 0, 1, 1,
-0.4638967, 0.259511, -1.362805, 0, 0, 0, 1, 1,
-0.4629254, -0.927989, -1.925278, 0, 0, 0, 1, 1,
-0.4615324, 0.03825463, -3.256986, 0, 0, 0, 1, 1,
-0.4595628, -0.03851993, -2.894264, 0, 0, 0, 1, 1,
-0.4574507, -0.3980066, -0.8100636, 0, 0, 0, 1, 1,
-0.4517808, 0.5434893, 0.6181445, 0, 0, 0, 1, 1,
-0.4490638, 1.056374, 0.1088916, 1, 1, 1, 1, 1,
-0.4442798, -0.5858014, -2.353578, 1, 1, 1, 1, 1,
-0.4439816, 1.763879, -0.5093802, 1, 1, 1, 1, 1,
-0.4421994, 0.7271948, -0.9524791, 1, 1, 1, 1, 1,
-0.4397403, 0.7994921, -0.5571095, 1, 1, 1, 1, 1,
-0.4387689, 0.624988, -1.222572, 1, 1, 1, 1, 1,
-0.4352862, -0.3566012, -2.317407, 1, 1, 1, 1, 1,
-0.4337861, -0.06852539, -1.435451, 1, 1, 1, 1, 1,
-0.4288979, 0.557212, -1.12363, 1, 1, 1, 1, 1,
-0.4244308, -0.7089555, -3.475848, 1, 1, 1, 1, 1,
-0.4235895, -1.273202, -4.488048, 1, 1, 1, 1, 1,
-0.4201286, -0.2866386, -2.226051, 1, 1, 1, 1, 1,
-0.4195513, -1.786495, -3.156529, 1, 1, 1, 1, 1,
-0.4186657, 0.5275955, 0.4333763, 1, 1, 1, 1, 1,
-0.4165286, 1.059877, -1.639082, 1, 1, 1, 1, 1,
-0.4120997, -1.972523, -2.267321, 0, 0, 1, 1, 1,
-0.4072775, -0.521062, -3.462516, 1, 0, 0, 1, 1,
-0.406182, -0.5544785, -2.425664, 1, 0, 0, 1, 1,
-0.4038003, 1.329537, -1.439289, 1, 0, 0, 1, 1,
-0.3974727, -0.1057231, -1.63462, 1, 0, 0, 1, 1,
-0.3938444, -0.210847, 0.04892482, 1, 0, 0, 1, 1,
-0.3926444, 0.2648263, -0.3698257, 0, 0, 0, 1, 1,
-0.3920404, 0.6092914, 0.1265906, 0, 0, 0, 1, 1,
-0.3916371, -0.01842527, -0.5528066, 0, 0, 0, 1, 1,
-0.3910181, 2.211758, -1.01071, 0, 0, 0, 1, 1,
-0.3857842, 1.13928, 0.02186115, 0, 0, 0, 1, 1,
-0.3819117, 0.9030426, 0.4685892, 0, 0, 0, 1, 1,
-0.3799614, 0.8910127, -1.016796, 0, 0, 0, 1, 1,
-0.3798175, 1.107513, 0.966003, 1, 1, 1, 1, 1,
-0.3796536, 0.3211164, -0.4610643, 1, 1, 1, 1, 1,
-0.3760715, 0.7885582, 1.348423, 1, 1, 1, 1, 1,
-0.3737986, 0.3363444, -1.676124, 1, 1, 1, 1, 1,
-0.3684998, -0.5328868, -2.183713, 1, 1, 1, 1, 1,
-0.3658923, -0.2326678, -2.312614, 1, 1, 1, 1, 1,
-0.3636205, -2.015467, -1.390174, 1, 1, 1, 1, 1,
-0.361688, -1.189262, -3.93058, 1, 1, 1, 1, 1,
-0.3615139, -0.1951554, -3.572981, 1, 1, 1, 1, 1,
-0.3615076, 0.3549365, 0.8881665, 1, 1, 1, 1, 1,
-0.3592628, -0.1827456, -0.6789585, 1, 1, 1, 1, 1,
-0.3570445, 0.8647296, -0.8594016, 1, 1, 1, 1, 1,
-0.343128, -2.504047, -2.701545, 1, 1, 1, 1, 1,
-0.3386881, 0.1216314, -0.8478642, 1, 1, 1, 1, 1,
-0.3378317, -1.877515, -2.950878, 1, 1, 1, 1, 1,
-0.3375624, -0.6612221, -2.833303, 0, 0, 1, 1, 1,
-0.3375327, 1.315131, 0.6647355, 1, 0, 0, 1, 1,
-0.3340867, 0.02961377, -1.783647, 1, 0, 0, 1, 1,
-0.3333334, 0.8188989, 0.3890162, 1, 0, 0, 1, 1,
-0.3245788, 0.4816188, 0.3990386, 1, 0, 0, 1, 1,
-0.3233762, -0.05617685, -1.574779, 1, 0, 0, 1, 1,
-0.3154497, -0.007997432, -2.585327, 0, 0, 0, 1, 1,
-0.3140507, 1.409486, 0.01804048, 0, 0, 0, 1, 1,
-0.3128234, -0.09758073, -2.437728, 0, 0, 0, 1, 1,
-0.3116405, -0.5041111, -2.926485, 0, 0, 0, 1, 1,
-0.3087211, -0.04504632, -1.613855, 0, 0, 0, 1, 1,
-0.3069659, 1.78831, -1.588017, 0, 0, 0, 1, 1,
-0.3043073, 0.0671295, -1.138054, 0, 0, 0, 1, 1,
-0.2962247, -0.09889042, -1.79282, 1, 1, 1, 1, 1,
-0.2908849, -3.545498, -2.952698, 1, 1, 1, 1, 1,
-0.2891925, -0.1306073, -0.9813351, 1, 1, 1, 1, 1,
-0.2887116, 0.2791474, -0.143286, 1, 1, 1, 1, 1,
-0.2884892, -0.436369, -3.813704, 1, 1, 1, 1, 1,
-0.2884621, 1.490783, 0.6107188, 1, 1, 1, 1, 1,
-0.2880043, -1.387957, -2.637325, 1, 1, 1, 1, 1,
-0.2872983, 0.1284033, -2.435247, 1, 1, 1, 1, 1,
-0.2825526, -0.7214328, -3.105021, 1, 1, 1, 1, 1,
-0.2816202, -1.471171, -2.289177, 1, 1, 1, 1, 1,
-0.2745815, 0.07133378, -1.452729, 1, 1, 1, 1, 1,
-0.2735748, 0.2891284, -2.116693, 1, 1, 1, 1, 1,
-0.2691318, -1.166759, -4.727006, 1, 1, 1, 1, 1,
-0.2660559, -1.025772, -3.836589, 1, 1, 1, 1, 1,
-0.2649501, -0.9242902, -3.605323, 1, 1, 1, 1, 1,
-0.2621017, 0.6975375, -0.4071694, 0, 0, 1, 1, 1,
-0.2619272, 0.7297045, -0.3981082, 1, 0, 0, 1, 1,
-0.25949, -2.058748, -3.311855, 1, 0, 0, 1, 1,
-0.255539, 1.091179, 0.4260786, 1, 0, 0, 1, 1,
-0.2552662, -0.6978194, -4.005841, 1, 0, 0, 1, 1,
-0.2514672, -1.097607, -2.266397, 1, 0, 0, 1, 1,
-0.2514129, 0.01604117, -0.8932734, 0, 0, 0, 1, 1,
-0.2487523, 0.9313776, -0.4379533, 0, 0, 0, 1, 1,
-0.2458837, -0.6695028, -0.9416426, 0, 0, 0, 1, 1,
-0.2447103, -0.8106324, -2.129695, 0, 0, 0, 1, 1,
-0.244095, 0.970914, 0.5842248, 0, 0, 0, 1, 1,
-0.2436639, -0.4092482, -1.390379, 0, 0, 0, 1, 1,
-0.2405848, -0.3655995, -1.419703, 0, 0, 0, 1, 1,
-0.2375098, 2.257358, 1.408428, 1, 1, 1, 1, 1,
-0.2310239, -0.79967, -4.341271, 1, 1, 1, 1, 1,
-0.2288945, -0.3392047, -2.229821, 1, 1, 1, 1, 1,
-0.2270012, 0.1192756, -0.584681, 1, 1, 1, 1, 1,
-0.2156418, 0.5355689, -0.1962906, 1, 1, 1, 1, 1,
-0.2134109, -0.05214384, 1.065674, 1, 1, 1, 1, 1,
-0.2108413, -0.5471997, -1.991501, 1, 1, 1, 1, 1,
-0.2102861, -0.01098398, -1.238129, 1, 1, 1, 1, 1,
-0.2089038, -1.170737, -3.711953, 1, 1, 1, 1, 1,
-0.2070872, -1.164959, -3.885673, 1, 1, 1, 1, 1,
-0.2066807, 1.423017, 0.893945, 1, 1, 1, 1, 1,
-0.1996135, 0.9913145, -1.333343, 1, 1, 1, 1, 1,
-0.1995019, -0.4861023, -3.615506, 1, 1, 1, 1, 1,
-0.1947481, 0.70981, -1.951365, 1, 1, 1, 1, 1,
-0.1945981, -0.3164555, -1.706887, 1, 1, 1, 1, 1,
-0.1902679, -0.3422982, -3.886007, 0, 0, 1, 1, 1,
-0.188305, 1.204763, 0.1075255, 1, 0, 0, 1, 1,
-0.1846838, 2.113116, -0.8131825, 1, 0, 0, 1, 1,
-0.1760949, 1.254473, -0.5525817, 1, 0, 0, 1, 1,
-0.1693343, 0.106429, -0.02821639, 1, 0, 0, 1, 1,
-0.1686011, -0.8834094, -4.150563, 1, 0, 0, 1, 1,
-0.1579413, 1.364449, -1.750034, 0, 0, 0, 1, 1,
-0.1561075, 0.6334687, 0.6349003, 0, 0, 0, 1, 1,
-0.1529248, -1.078708, -4.316436, 0, 0, 0, 1, 1,
-0.1507261, -0.01760239, -2.108552, 0, 0, 0, 1, 1,
-0.1501019, -0.391631, -3.466692, 0, 0, 0, 1, 1,
-0.1445405, 0.4431073, 2.442359, 0, 0, 0, 1, 1,
-0.1424878, 1.652845, 0.6843609, 0, 0, 0, 1, 1,
-0.1400682, -0.9848883, -3.166569, 1, 1, 1, 1, 1,
-0.1388678, 0.2158198, -1.045288, 1, 1, 1, 1, 1,
-0.1369351, -1.188647, -2.599347, 1, 1, 1, 1, 1,
-0.1324546, 1.168159, -0.1241727, 1, 1, 1, 1, 1,
-0.130026, 1.658877, 0.2414013, 1, 1, 1, 1, 1,
-0.1255706, -1.954137, -2.901669, 1, 1, 1, 1, 1,
-0.1241591, -0.6004182, -2.578705, 1, 1, 1, 1, 1,
-0.1231105, -0.2429143, 0.2079747, 1, 1, 1, 1, 1,
-0.1183053, 0.7009698, -0.03643019, 1, 1, 1, 1, 1,
-0.1164059, 1.411068, 1.649015, 1, 1, 1, 1, 1,
-0.1134584, 2.316516, -0.3368365, 1, 1, 1, 1, 1,
-0.1120867, -0.068774, -1.701329, 1, 1, 1, 1, 1,
-0.1060577, 0.7046131, 0.1027554, 1, 1, 1, 1, 1,
-0.1023891, -1.730304, -2.979224, 1, 1, 1, 1, 1,
-0.1021873, -0.3274109, -2.864421, 1, 1, 1, 1, 1,
-0.09869658, 0.06863491, 0.3258569, 0, 0, 1, 1, 1,
-0.09745438, -2.501109, -4.020288, 1, 0, 0, 1, 1,
-0.09659502, 1.001892, -0.4876111, 1, 0, 0, 1, 1,
-0.09602901, 1.967206, 0.5981088, 1, 0, 0, 1, 1,
-0.09536564, 1.112587, -0.893527, 1, 0, 0, 1, 1,
-0.09179698, 0.6722415, -1.384273, 1, 0, 0, 1, 1,
-0.09074872, 0.8403478, -1.08917, 0, 0, 0, 1, 1,
-0.09069995, 0.7956983, -1.813157, 0, 0, 0, 1, 1,
-0.0891167, -0.7481996, -3.299504, 0, 0, 0, 1, 1,
-0.08888746, 0.7137929, 0.4827823, 0, 0, 0, 1, 1,
-0.08759616, -0.1511178, -2.257509, 0, 0, 0, 1, 1,
-0.08612563, -1.547622, -3.3841, 0, 0, 0, 1, 1,
-0.084544, 0.7268229, -0.6467416, 0, 0, 0, 1, 1,
-0.08108383, 0.6410308, 1.748433, 1, 1, 1, 1, 1,
-0.07661653, -0.0129031, -2.46416, 1, 1, 1, 1, 1,
-0.07585526, 0.2460084, -0.9408932, 1, 1, 1, 1, 1,
-0.07349353, -0.05330437, -1.68385, 1, 1, 1, 1, 1,
-0.07233623, 1.260218, 0.3451211, 1, 1, 1, 1, 1,
-0.07087792, 0.6647071, 0.5451404, 1, 1, 1, 1, 1,
-0.07002746, 0.390507, -0.6465717, 1, 1, 1, 1, 1,
-0.06936056, 0.8661659, 1.049529, 1, 1, 1, 1, 1,
-0.06879747, 1.622462, -0.9449317, 1, 1, 1, 1, 1,
-0.06588609, -0.3655904, -4.52668, 1, 1, 1, 1, 1,
-0.06583451, -0.001902801, -2.099778, 1, 1, 1, 1, 1,
-0.06323278, 1.348335, -0.3738589, 1, 1, 1, 1, 1,
-0.06299936, -1.191048, -2.757757, 1, 1, 1, 1, 1,
-0.06145211, 0.6807287, -1.309846, 1, 1, 1, 1, 1,
-0.06091063, -1.896045, -3.467371, 1, 1, 1, 1, 1,
-0.05994467, 0.4355992, 0.8912072, 0, 0, 1, 1, 1,
-0.05811758, -0.2477504, -2.654793, 1, 0, 0, 1, 1,
-0.05805168, -1.129822, -3.242544, 1, 0, 0, 1, 1,
-0.05779378, 0.3570049, -0.9748475, 1, 0, 0, 1, 1,
-0.05292873, -0.3187726, -4.140028, 1, 0, 0, 1, 1,
-0.05256503, -0.9026771, -2.561817, 1, 0, 0, 1, 1,
-0.05167047, -1.068644, -4.80842, 0, 0, 0, 1, 1,
-0.04954388, 0.3658699, -0.5318076, 0, 0, 0, 1, 1,
-0.04905147, -0.8321514, -4.314849, 0, 0, 0, 1, 1,
-0.04880642, -1.476389, -1.801836, 0, 0, 0, 1, 1,
-0.04864985, 0.4778304, 0.9893652, 0, 0, 0, 1, 1,
-0.04088047, -0.8646488, -4.308645, 0, 0, 0, 1, 1,
-0.04030586, 0.07509781, -0.4862631, 0, 0, 0, 1, 1,
-0.03805211, -0.4960622, -4.70928, 1, 1, 1, 1, 1,
-0.03712603, -0.8866482, -2.110048, 1, 1, 1, 1, 1,
-0.03550325, 0.9655758, -0.8254381, 1, 1, 1, 1, 1,
-0.03332135, 1.110141, 0.7136251, 1, 1, 1, 1, 1,
-0.03193831, 1.429227, 0.3431373, 1, 1, 1, 1, 1,
-0.03145518, -0.2148905, -1.863603, 1, 1, 1, 1, 1,
-0.03069286, 0.6242533, -0.1830962, 1, 1, 1, 1, 1,
-0.02690965, -0.8003071, -2.344624, 1, 1, 1, 1, 1,
-0.0268993, 2.713601, -0.4192862, 1, 1, 1, 1, 1,
-0.022299, 0.3120515, 0.5502679, 1, 1, 1, 1, 1,
-0.02177283, 1.714286, -1.021427, 1, 1, 1, 1, 1,
-0.01641393, -1.027439, -2.477813, 1, 1, 1, 1, 1,
-0.0143311, -2.244588, -4.08116, 1, 1, 1, 1, 1,
-0.01430425, 0.05253417, -1.032966, 1, 1, 1, 1, 1,
-0.01045767, 1.408606, -1.053383, 1, 1, 1, 1, 1,
-0.008692958, -1.065294, -3.609273, 0, 0, 1, 1, 1,
-0.008517972, -1.654757, -2.709879, 1, 0, 0, 1, 1,
-0.007071125, -1.110367, -5.953503, 1, 0, 0, 1, 1,
-0.006206806, -0.7364578, -4.893791, 1, 0, 0, 1, 1,
-0.004858296, -0.4376867, -2.707678, 1, 0, 0, 1, 1,
-0.002940838, 0.2654033, -0.622745, 1, 0, 0, 1, 1,
-0.002814734, 0.0507796, -0.5448812, 0, 0, 0, 1, 1,
-0.001820514, 0.6304392, -1.77556, 0, 0, 0, 1, 1,
0.0007797095, -1.224461, 4.093254, 0, 0, 0, 1, 1,
0.000832749, 0.1687499, 0.9134439, 0, 0, 0, 1, 1,
0.0009651499, 0.1786454, 0.5508837, 0, 0, 0, 1, 1,
0.004615278, -0.01353516, 3.838701, 0, 0, 0, 1, 1,
0.009807098, -0.1213557, 2.032583, 0, 0, 0, 1, 1,
0.01034581, -0.5292081, 3.259675, 1, 1, 1, 1, 1,
0.01047941, -1.054115, 2.735195, 1, 1, 1, 1, 1,
0.01496075, -0.1033932, 2.421536, 1, 1, 1, 1, 1,
0.01551987, 0.5795528, -0.7289811, 1, 1, 1, 1, 1,
0.02204446, 0.3878486, 0.5822917, 1, 1, 1, 1, 1,
0.02329296, 1.399402, -0.2150776, 1, 1, 1, 1, 1,
0.02981268, 1.506305, 0.6284798, 1, 1, 1, 1, 1,
0.03564709, -0.9134042, 4.343678, 1, 1, 1, 1, 1,
0.03590263, 2.230031, 0.01280604, 1, 1, 1, 1, 1,
0.03673727, -0.4125786, 3.148089, 1, 1, 1, 1, 1,
0.03679043, 2.497443, 0.8399345, 1, 1, 1, 1, 1,
0.03723088, 1.149794, 2.204038, 1, 1, 1, 1, 1,
0.03959527, -1.775284, 4.197744, 1, 1, 1, 1, 1,
0.04309731, -0.4181296, 4.218492, 1, 1, 1, 1, 1,
0.04635075, -0.7065396, 3.494483, 1, 1, 1, 1, 1,
0.04711974, -1.044653, 3.405783, 0, 0, 1, 1, 1,
0.05364905, -0.5510496, 1.652492, 1, 0, 0, 1, 1,
0.0551138, 0.7325007, 1.643473, 1, 0, 0, 1, 1,
0.0675704, 0.4308167, 0.1813724, 1, 0, 0, 1, 1,
0.0723273, 1.67995, 1.305184, 1, 0, 0, 1, 1,
0.07363748, 0.1666344, 0.6246441, 1, 0, 0, 1, 1,
0.07428876, 1.324656, 0.3457402, 0, 0, 0, 1, 1,
0.07463468, -0.5506967, 3.420363, 0, 0, 0, 1, 1,
0.07915289, -0.2634741, 2.801229, 0, 0, 0, 1, 1,
0.07999294, 0.01545714, 1.485578, 0, 0, 0, 1, 1,
0.08174474, -0.09902047, 2.302547, 0, 0, 0, 1, 1,
0.08362591, 1.220474, 0.1853109, 0, 0, 0, 1, 1,
0.08426806, -0.09150561, 2.74994, 0, 0, 0, 1, 1,
0.08431754, 1.682238, 1.541713, 1, 1, 1, 1, 1,
0.08437663, 1.457191, -0.4003445, 1, 1, 1, 1, 1,
0.08474313, 0.3147107, 0.8283796, 1, 1, 1, 1, 1,
0.08533952, -0.09820004, 1.655053, 1, 1, 1, 1, 1,
0.08789968, -0.2842522, 2.673805, 1, 1, 1, 1, 1,
0.09143404, 2.130939, 2.233555, 1, 1, 1, 1, 1,
0.09262012, -1.081908, 2.545336, 1, 1, 1, 1, 1,
0.09578785, 1.119666, -0.3376186, 1, 1, 1, 1, 1,
0.09915545, -0.9794929, 4.739033, 1, 1, 1, 1, 1,
0.101462, 0.1557624, 0.2935263, 1, 1, 1, 1, 1,
0.1018527, 0.4897416, 0.1474791, 1, 1, 1, 1, 1,
0.1029248, 0.0829834, 1.396754, 1, 1, 1, 1, 1,
0.1107091, -1.414403, 2.137698, 1, 1, 1, 1, 1,
0.1133661, 0.677316, 1.146402, 1, 1, 1, 1, 1,
0.1169406, -1.484177, 3.572688, 1, 1, 1, 1, 1,
0.121702, 1.255439, -1.527634, 0, 0, 1, 1, 1,
0.1242857, 0.3135651, 0.438809, 1, 0, 0, 1, 1,
0.1286286, 0.6110865, 0.2552867, 1, 0, 0, 1, 1,
0.1293098, -0.2681628, 0.9718117, 1, 0, 0, 1, 1,
0.1293681, -0.9565478, 2.991374, 1, 0, 0, 1, 1,
0.1433394, -0.7946525, 2.56349, 1, 0, 0, 1, 1,
0.1437226, 0.7222053, -0.03025117, 0, 0, 0, 1, 1,
0.1564286, 1.529864, 0.04920382, 0, 0, 0, 1, 1,
0.1576982, -0.8077376, 4.194764, 0, 0, 0, 1, 1,
0.1612426, 0.4583175, -0.1752379, 0, 0, 0, 1, 1,
0.1640355, -0.6962527, 2.9313, 0, 0, 0, 1, 1,
0.1640618, 1.612169, 1.239059, 0, 0, 0, 1, 1,
0.1654448, 0.2416476, 0.3209347, 0, 0, 0, 1, 1,
0.1683996, 0.08690742, 0.7396954, 1, 1, 1, 1, 1,
0.1685718, 0.5048838, 0.4207767, 1, 1, 1, 1, 1,
0.1699369, -0.6839598, 3.411307, 1, 1, 1, 1, 1,
0.1702672, 0.9528181, 0.4265356, 1, 1, 1, 1, 1,
0.1718587, -1.148259, 3.854627, 1, 1, 1, 1, 1,
0.1764663, 0.2351781, 1.344724, 1, 1, 1, 1, 1,
0.1774899, 2.486662, -1.012877, 1, 1, 1, 1, 1,
0.1786813, -1.939476, 2.922844, 1, 1, 1, 1, 1,
0.1841672, 0.1207673, 0.7243069, 1, 1, 1, 1, 1,
0.1897418, 0.8939701, -0.8310738, 1, 1, 1, 1, 1,
0.1975849, -0.3766306, 2.226613, 1, 1, 1, 1, 1,
0.2044811, -0.3121857, 2.16883, 1, 1, 1, 1, 1,
0.2079224, -2.250123, 3.625835, 1, 1, 1, 1, 1,
0.2105629, 0.8103904, 0.003248584, 1, 1, 1, 1, 1,
0.2123575, -2.749815, 3.885033, 1, 1, 1, 1, 1,
0.2137516, 0.9125948, -1.429906, 0, 0, 1, 1, 1,
0.2157222, 0.05853197, 2.426468, 1, 0, 0, 1, 1,
0.2158121, 1.070871, -0.2412647, 1, 0, 0, 1, 1,
0.2158172, 0.9466003, -1.192847, 1, 0, 0, 1, 1,
0.218527, 1.207921, -0.3825058, 1, 0, 0, 1, 1,
0.2205771, 1.309617, 2.254733, 1, 0, 0, 1, 1,
0.2220173, -0.1977388, 2.936662, 0, 0, 0, 1, 1,
0.2227498, 1.006553, 0.4699034, 0, 0, 0, 1, 1,
0.2228228, 0.3811802, -0.1853801, 0, 0, 0, 1, 1,
0.2230787, 1.582593, 1.021861, 0, 0, 0, 1, 1,
0.2232704, -0.9537124, 1.781386, 0, 0, 0, 1, 1,
0.2233394, 0.1697723, -0.007561605, 0, 0, 0, 1, 1,
0.226044, -1.902288, 2.492481, 0, 0, 0, 1, 1,
0.2266997, 0.9694815, 0.6990923, 1, 1, 1, 1, 1,
0.2341149, 1.765312, 0.03936825, 1, 1, 1, 1, 1,
0.2372237, 2.549143, 0.4046887, 1, 1, 1, 1, 1,
0.2380996, -1.129391, 3.708324, 1, 1, 1, 1, 1,
0.2491767, -1.529979, 2.9899, 1, 1, 1, 1, 1,
0.2529126, 0.4657872, 0.1685136, 1, 1, 1, 1, 1,
0.2541077, 0.05074276, -0.1498295, 1, 1, 1, 1, 1,
0.2563856, -2.388752, 3.132615, 1, 1, 1, 1, 1,
0.2659763, -1.221604, 3.20289, 1, 1, 1, 1, 1,
0.268069, 0.2979082, 0.9873508, 1, 1, 1, 1, 1,
0.2706212, 0.5595778, 1.902681, 1, 1, 1, 1, 1,
0.2730164, 0.7311982, -0.1201796, 1, 1, 1, 1, 1,
0.2741195, -0.0801001, 1.769612, 1, 1, 1, 1, 1,
0.2750253, -1.339118, 3.171098, 1, 1, 1, 1, 1,
0.2753963, 0.2024854, 2.118344, 1, 1, 1, 1, 1,
0.2770008, 1.0198, 0.1000046, 0, 0, 1, 1, 1,
0.2772118, -0.3710552, 0.1914575, 1, 0, 0, 1, 1,
0.2776726, 0.8644941, 1.453372, 1, 0, 0, 1, 1,
0.2788838, -1.534679, 5.106998, 1, 0, 0, 1, 1,
0.2814121, -0.8762983, 2.213368, 1, 0, 0, 1, 1,
0.2892304, -0.8218183, 3.468713, 1, 0, 0, 1, 1,
0.2932336, -0.0120037, 2.049871, 0, 0, 0, 1, 1,
0.2939619, 0.1659213, 2.148254, 0, 0, 0, 1, 1,
0.2959116, 1.281332, 2.046816, 0, 0, 0, 1, 1,
0.2988511, -0.492684, 2.574056, 0, 0, 0, 1, 1,
0.3056314, -2.18813, 2.010449, 0, 0, 0, 1, 1,
0.3096901, 1.983838, 0.8633283, 0, 0, 0, 1, 1,
0.3108654, 0.6265963, -0.4869528, 0, 0, 0, 1, 1,
0.3123203, -1.602009, 4.15819, 1, 1, 1, 1, 1,
0.3213909, 0.3186394, -0.4226167, 1, 1, 1, 1, 1,
0.3268599, -0.8591224, 3.623088, 1, 1, 1, 1, 1,
0.3286429, -0.2008768, 2.721561, 1, 1, 1, 1, 1,
0.331655, 2.439658, 3.693825, 1, 1, 1, 1, 1,
0.3326276, -0.8253642, 2.629642, 1, 1, 1, 1, 1,
0.3348091, 0.7292668, 1.806298, 1, 1, 1, 1, 1,
0.3382586, -0.5868735, 1.794513, 1, 1, 1, 1, 1,
0.3422877, -1.553929, 3.382343, 1, 1, 1, 1, 1,
0.3451084, -0.1078844, 1.356792, 1, 1, 1, 1, 1,
0.3492119, -1.778889, 3.389046, 1, 1, 1, 1, 1,
0.3682831, -0.4445635, 3.170176, 1, 1, 1, 1, 1,
0.3701406, -1.10008, 2.895063, 1, 1, 1, 1, 1,
0.3737234, 1.024472, 0.712329, 1, 1, 1, 1, 1,
0.3763358, 1.15305, -0.4690314, 1, 1, 1, 1, 1,
0.378125, -1.230946, 2.085109, 0, 0, 1, 1, 1,
0.3800605, -1.906577, 1.869936, 1, 0, 0, 1, 1,
0.3802072, 1.95284, 0.5039431, 1, 0, 0, 1, 1,
0.3804158, -2.0987, 2.692553, 1, 0, 0, 1, 1,
0.3805993, 0.2592354, 1.113315, 1, 0, 0, 1, 1,
0.3819027, 0.7807691, 0.431587, 1, 0, 0, 1, 1,
0.3853412, 2.2085, 1.817255, 0, 0, 0, 1, 1,
0.3897044, -0.9977357, 1.673734, 0, 0, 0, 1, 1,
0.3921529, 0.08914062, 0.8192727, 0, 0, 0, 1, 1,
0.3934577, 0.151071, 1.73194, 0, 0, 0, 1, 1,
0.3971635, 0.6175184, 2.76203, 0, 0, 0, 1, 1,
0.398331, -0.4833505, 3.704608, 0, 0, 0, 1, 1,
0.4057537, 0.5902312, 1.54692, 0, 0, 0, 1, 1,
0.4093791, 2.576837, -0.3368846, 1, 1, 1, 1, 1,
0.4103568, -2.358108, 2.694065, 1, 1, 1, 1, 1,
0.4157328, 0.2500676, 0.5491639, 1, 1, 1, 1, 1,
0.4263766, -0.07497913, 2.719756, 1, 1, 1, 1, 1,
0.4346461, -1.193097, 2.1401, 1, 1, 1, 1, 1,
0.4364209, 0.7219743, 0.2512271, 1, 1, 1, 1, 1,
0.4445829, 0.102594, 1.555999, 1, 1, 1, 1, 1,
0.4471116, 0.5321902, 1.336968, 1, 1, 1, 1, 1,
0.447729, -1.640373, 2.277308, 1, 1, 1, 1, 1,
0.4523565, -0.9214975, 3.321418, 1, 1, 1, 1, 1,
0.453479, 1.452775, 1.041163, 1, 1, 1, 1, 1,
0.4541264, -0.8996089, 3.296914, 1, 1, 1, 1, 1,
0.458145, 0.1453277, -0.2126739, 1, 1, 1, 1, 1,
0.460012, 0.0350858, 1.1841, 1, 1, 1, 1, 1,
0.463771, -0.1325093, 1.551036, 1, 1, 1, 1, 1,
0.4716375, 0.8807121, 1.850257, 0, 0, 1, 1, 1,
0.4772449, 0.01618651, 0.5912284, 1, 0, 0, 1, 1,
0.483196, -0.886591, -0.5656708, 1, 0, 0, 1, 1,
0.4882124, -1.229555, 1.480665, 1, 0, 0, 1, 1,
0.4955223, 1.295933, -0.5797481, 1, 0, 0, 1, 1,
0.498808, 0.1064272, 0.1936039, 1, 0, 0, 1, 1,
0.501838, 0.8253267, 0.4726132, 0, 0, 0, 1, 1,
0.5079384, 1.301992, 1.464726, 0, 0, 0, 1, 1,
0.5162833, -1.582767, 3.97275, 0, 0, 0, 1, 1,
0.5173181, -0.6755234, 2.746318, 0, 0, 0, 1, 1,
0.5263739, -1.13559, 0.5462583, 0, 0, 0, 1, 1,
0.5317946, -0.738369, 3.556436, 0, 0, 0, 1, 1,
0.538958, -0.7145463, 3.110106, 0, 0, 0, 1, 1,
0.5399759, 0.06813278, 0.7940039, 1, 1, 1, 1, 1,
0.5422812, 0.7723522, 2.27108, 1, 1, 1, 1, 1,
0.5424969, -1.46925, 2.871514, 1, 1, 1, 1, 1,
0.5488315, 0.7401783, -1.359808, 1, 1, 1, 1, 1,
0.5489669, 0.4445611, 1.551368, 1, 1, 1, 1, 1,
0.549289, 0.2745434, 0.5259994, 1, 1, 1, 1, 1,
0.5501391, 0.3671674, 1.388721, 1, 1, 1, 1, 1,
0.5577714, 1.168495, 0.03347789, 1, 1, 1, 1, 1,
0.5627189, 0.9630951, 1.602854, 1, 1, 1, 1, 1,
0.5665562, 0.09014911, -0.6948869, 1, 1, 1, 1, 1,
0.5666636, 0.9231571, 1.272906, 1, 1, 1, 1, 1,
0.5736129, 0.5267826, 1.296613, 1, 1, 1, 1, 1,
0.577224, -0.05802287, 0.9397228, 1, 1, 1, 1, 1,
0.5809525, 0.2589716, -1.494017, 1, 1, 1, 1, 1,
0.5852184, -0.4906395, 1.922798, 1, 1, 1, 1, 1,
0.5882127, 0.1323536, 3.104174, 0, 0, 1, 1, 1,
0.5909037, -0.8903726, 1.978995, 1, 0, 0, 1, 1,
0.5910112, 1.694648, -0.7582989, 1, 0, 0, 1, 1,
0.5934034, -0.2325822, 2.085786, 1, 0, 0, 1, 1,
0.5946154, 1.495121, 0.8889017, 1, 0, 0, 1, 1,
0.598496, -1.820051, 2.509165, 1, 0, 0, 1, 1,
0.5986426, -0.1289055, 1.579474, 0, 0, 0, 1, 1,
0.6008578, -0.3650771, 3.518823, 0, 0, 0, 1, 1,
0.6023095, -1.250773, 2.240121, 0, 0, 0, 1, 1,
0.6034607, 0.1087944, 1.243365, 0, 0, 0, 1, 1,
0.6039655, -0.2940723, 2.236456, 0, 0, 0, 1, 1,
0.6089196, -0.1547751, 2.646085, 0, 0, 0, 1, 1,
0.6120527, -1.289338, 2.347291, 0, 0, 0, 1, 1,
0.6148431, -0.0523813, 1.071458, 1, 1, 1, 1, 1,
0.6153352, 1.712807, -1.187986, 1, 1, 1, 1, 1,
0.6172684, -0.3847143, 3.093317, 1, 1, 1, 1, 1,
0.6181634, -1.116314, 2.571846, 1, 1, 1, 1, 1,
0.6214184, 0.4506818, 0.7700135, 1, 1, 1, 1, 1,
0.6220965, 0.8367437, 0.7807888, 1, 1, 1, 1, 1,
0.6282298, 0.7555674, 0.5551882, 1, 1, 1, 1, 1,
0.6285869, 1.776737, 0.6676056, 1, 1, 1, 1, 1,
0.6374433, 1.980234, 0.6069681, 1, 1, 1, 1, 1,
0.641481, 0.05188334, 0.6105303, 1, 1, 1, 1, 1,
0.6427161, 0.6175103, -0.618576, 1, 1, 1, 1, 1,
0.6600869, -1.072583, 3.237146, 1, 1, 1, 1, 1,
0.6686464, 0.8700557, 0.6574844, 1, 1, 1, 1, 1,
0.6736916, -0.9759139, 1.683492, 1, 1, 1, 1, 1,
0.6746064, -1.606142, 2.899094, 1, 1, 1, 1, 1,
0.6750954, -0.05877877, 1.197549, 0, 0, 1, 1, 1,
0.6779162, 0.7924136, 2.494041, 1, 0, 0, 1, 1,
0.6813648, -0.7337702, 3.342277, 1, 0, 0, 1, 1,
0.6821054, -2.090201, 3.737461, 1, 0, 0, 1, 1,
0.6823633, -0.07923944, 0.7455111, 1, 0, 0, 1, 1,
0.6842852, -0.405915, 1.406651, 1, 0, 0, 1, 1,
0.6848736, -0.1870539, -0.7735052, 0, 0, 0, 1, 1,
0.6871656, -1.63888, 2.046456, 0, 0, 0, 1, 1,
0.6877072, 2.374709, 0.2697153, 0, 0, 0, 1, 1,
0.688965, -1.114684, 4.102458, 0, 0, 0, 1, 1,
0.6905614, 1.005197, 0.8224912, 0, 0, 0, 1, 1,
0.6915317, 0.3787432, 2.007667, 0, 0, 0, 1, 1,
0.6925765, -1.442832, 2.700445, 0, 0, 0, 1, 1,
0.6973377, 0.3167676, 0.7194779, 1, 1, 1, 1, 1,
0.6995988, 2.376023, -0.1597078, 1, 1, 1, 1, 1,
0.7064393, -0.6342409, 2.274541, 1, 1, 1, 1, 1,
0.7079552, 0.01573156, 2.857214, 1, 1, 1, 1, 1,
0.7083351, -0.4113501, 2.850323, 1, 1, 1, 1, 1,
0.7094054, 0.2458573, 1.271791, 1, 1, 1, 1, 1,
0.7126771, 0.2038235, 1.786924, 1, 1, 1, 1, 1,
0.7154501, 2.624357, -0.01097028, 1, 1, 1, 1, 1,
0.7165918, 0.8564572, 2.82991, 1, 1, 1, 1, 1,
0.7203112, -0.09588848, 1.858915, 1, 1, 1, 1, 1,
0.7215438, 0.2068474, 1.897321, 1, 1, 1, 1, 1,
0.7308586, 0.6268724, 1.180369, 1, 1, 1, 1, 1,
0.7345633, 0.4970223, -0.2321483, 1, 1, 1, 1, 1,
0.737256, 0.8296024, 1.098251, 1, 1, 1, 1, 1,
0.7416048, -1.043185, 3.874521, 1, 1, 1, 1, 1,
0.7447086, -0.9428806, 2.851599, 0, 0, 1, 1, 1,
0.7456737, 0.2544253, -0.9689798, 1, 0, 0, 1, 1,
0.7565095, -0.3010659, 3.853177, 1, 0, 0, 1, 1,
0.7631392, -2.560403, 2.608081, 1, 0, 0, 1, 1,
0.7664229, -0.8187182, 1.191204, 1, 0, 0, 1, 1,
0.7669507, -1.201391, 2.204694, 1, 0, 0, 1, 1,
0.7678415, 0.9742994, 1.215077, 0, 0, 0, 1, 1,
0.7733579, -0.1833437, 3.383488, 0, 0, 0, 1, 1,
0.7748333, 1.100835, 0.6177985, 0, 0, 0, 1, 1,
0.7793838, 0.4825253, 2.784114, 0, 0, 0, 1, 1,
0.7830736, 0.4202341, 0.0711807, 0, 0, 0, 1, 1,
0.7875207, 0.8355229, 2.185209, 0, 0, 0, 1, 1,
0.7912065, 0.3087285, 3.223048, 0, 0, 0, 1, 1,
0.7917299, -0.5636837, 2.495103, 1, 1, 1, 1, 1,
0.797091, 0.9087876, 0.1460339, 1, 1, 1, 1, 1,
0.7991055, -0.01368248, 1.772694, 1, 1, 1, 1, 1,
0.8011794, 0.2999345, 0.2726142, 1, 1, 1, 1, 1,
0.8107529, -1.608215, 1.921214, 1, 1, 1, 1, 1,
0.8169874, 0.078481, 0.4943504, 1, 1, 1, 1, 1,
0.821595, -2.250562, 2.057657, 1, 1, 1, 1, 1,
0.8240358, 0.06572182, 1.138229, 1, 1, 1, 1, 1,
0.8265074, 0.5370805, 1.275361, 1, 1, 1, 1, 1,
0.8323147, -0.4451814, 2.027612, 1, 1, 1, 1, 1,
0.8367701, -1.665743, 4.782416, 1, 1, 1, 1, 1,
0.8369205, -0.2532993, 0.7119721, 1, 1, 1, 1, 1,
0.8482312, 0.6439768, 1.389369, 1, 1, 1, 1, 1,
0.8514937, -1.321499, 2.737497, 1, 1, 1, 1, 1,
0.8539991, 0.8802696, -0.1805858, 1, 1, 1, 1, 1,
0.8737974, 1.064834, 1.782299, 0, 0, 1, 1, 1,
0.8747814, -0.2349675, 3.288793, 1, 0, 0, 1, 1,
0.8754269, -2.319647, 3.682563, 1, 0, 0, 1, 1,
0.8791472, 2.172873, 0.5219147, 1, 0, 0, 1, 1,
0.8831326, 0.8964595, -0.9514313, 1, 0, 0, 1, 1,
0.8837256, 0.9750722, 0.1331966, 1, 0, 0, 1, 1,
0.8896672, -0.4785225, 2.572664, 0, 0, 0, 1, 1,
0.8971353, 0.3126458, 1.571774, 0, 0, 0, 1, 1,
0.9054035, -1.765026, 3.327201, 0, 0, 0, 1, 1,
0.9099496, -1.979581, 2.486689, 0, 0, 0, 1, 1,
0.912567, -0.2435896, 1.067661, 0, 0, 0, 1, 1,
0.915198, 0.5439132, 1.379781, 0, 0, 0, 1, 1,
0.9212483, 0.9633858, 0.3268713, 0, 0, 0, 1, 1,
0.9355621, -1.338959, 2.779445, 1, 1, 1, 1, 1,
0.9364895, 0.7612332, 0.5968361, 1, 1, 1, 1, 1,
0.9427394, -1.881383, 2.794182, 1, 1, 1, 1, 1,
0.9478366, -2.043429, 1.923284, 1, 1, 1, 1, 1,
0.9482118, -0.1483148, 1.385486, 1, 1, 1, 1, 1,
0.9487141, -0.3939847, 1.426957, 1, 1, 1, 1, 1,
0.950862, 0.1731262, -0.08025426, 1, 1, 1, 1, 1,
0.9512243, 1.473139, 1.165799, 1, 1, 1, 1, 1,
0.9519873, -0.6188896, 1.346132, 1, 1, 1, 1, 1,
0.9525591, -1.20036, 2.02544, 1, 1, 1, 1, 1,
0.9550819, -0.01420007, 0.5222431, 1, 1, 1, 1, 1,
0.9557954, 1.565497, 0.2260076, 1, 1, 1, 1, 1,
0.956124, -0.06485475, 3.069476, 1, 1, 1, 1, 1,
0.9654474, 0.3124182, 1.197012, 1, 1, 1, 1, 1,
0.9655293, -0.2874132, 2.05983, 1, 1, 1, 1, 1,
0.9678635, 0.2994786, 1.884863, 0, 0, 1, 1, 1,
0.9729925, -3.197634, 4.288777, 1, 0, 0, 1, 1,
0.9777585, -0.6141932, 0.7051513, 1, 0, 0, 1, 1,
0.9779375, 0.42656, 2.777283, 1, 0, 0, 1, 1,
0.9823617, -0.1573578, 2.7427, 1, 0, 0, 1, 1,
0.9878712, -0.9249768, 2.059942, 1, 0, 0, 1, 1,
0.9888422, -0.2064836, 1.16145, 0, 0, 0, 1, 1,
0.9905508, -1.872643, 2.536632, 0, 0, 0, 1, 1,
0.9972451, 0.7633368, 0.1721738, 0, 0, 0, 1, 1,
1.001409, -1.045413, 2.001339, 0, 0, 0, 1, 1,
1.001953, 0.506986, 1.344787, 0, 0, 0, 1, 1,
1.011141, 0.1033081, -0.5499999, 0, 0, 0, 1, 1,
1.015457, 1.242058, 1.070497, 0, 0, 0, 1, 1,
1.016297, 2.201389, -0.5043289, 1, 1, 1, 1, 1,
1.020671, -0.9045799, 3.958398, 1, 1, 1, 1, 1,
1.021083, -0.7067543, 0.1334169, 1, 1, 1, 1, 1,
1.021101, 0.8633496, 0.6553053, 1, 1, 1, 1, 1,
1.027604, 0.1531428, 1.502687, 1, 1, 1, 1, 1,
1.049329, -0.4408961, 1.977741, 1, 1, 1, 1, 1,
1.053205, -0.3974043, 1.904342, 1, 1, 1, 1, 1,
1.057906, -1.254114, 3.605401, 1, 1, 1, 1, 1,
1.064566, 0.9488877, 1.028033, 1, 1, 1, 1, 1,
1.064634, 0.3929122, -0.4668257, 1, 1, 1, 1, 1,
1.066506, -0.6460162, 1.345133, 1, 1, 1, 1, 1,
1.067876, -1.733391, 2.927705, 1, 1, 1, 1, 1,
1.068947, -0.6920683, 2.495224, 1, 1, 1, 1, 1,
1.070795, -0.1492218, 1.758894, 1, 1, 1, 1, 1,
1.071113, -0.884523, 1.563605, 1, 1, 1, 1, 1,
1.075762, -0.9172443, 2.722076, 0, 0, 1, 1, 1,
1.078378, 1.706246, 1.427468, 1, 0, 0, 1, 1,
1.080864, -2.545281, 3.439209, 1, 0, 0, 1, 1,
1.08116, -1.471418, 2.419389, 1, 0, 0, 1, 1,
1.097604, 0.01923004, 2.525793, 1, 0, 0, 1, 1,
1.108751, 1.431627, 0.7936924, 1, 0, 0, 1, 1,
1.110626, -0.547831, 0.01608617, 0, 0, 0, 1, 1,
1.111512, -0.5176296, 1.96125, 0, 0, 0, 1, 1,
1.118009, 1.340274, -0.2801607, 0, 0, 0, 1, 1,
1.118623, 0.04013548, 1.226669, 0, 0, 0, 1, 1,
1.123517, 0.5245181, -0.4302824, 0, 0, 0, 1, 1,
1.129134, 1.61004, 2.518931, 0, 0, 0, 1, 1,
1.131619, 1.443163, -0.3384343, 0, 0, 0, 1, 1,
1.134645, 0.1113261, 2.064854, 1, 1, 1, 1, 1,
1.134863, 0.4775702, 2.647523, 1, 1, 1, 1, 1,
1.13626, -0.05333636, 0.7492633, 1, 1, 1, 1, 1,
1.138912, 1.807831, 0.498192, 1, 1, 1, 1, 1,
1.139994, -0.009366054, 1.789662, 1, 1, 1, 1, 1,
1.150174, -0.2959463, 3.451216, 1, 1, 1, 1, 1,
1.15675, -0.7160878, 2.160765, 1, 1, 1, 1, 1,
1.160272, 1.299778, 2.227061, 1, 1, 1, 1, 1,
1.16132, -0.07184494, 2.970636, 1, 1, 1, 1, 1,
1.16189, 0.09126412, -0.2410647, 1, 1, 1, 1, 1,
1.162196, 1.405447, 1.080991, 1, 1, 1, 1, 1,
1.16232, -0.3995389, 1.712159, 1, 1, 1, 1, 1,
1.168535, -0.456684, 0.7924846, 1, 1, 1, 1, 1,
1.169289, -0.4487493, 2.281735, 1, 1, 1, 1, 1,
1.183175, -1.619249, 2.224787, 1, 1, 1, 1, 1,
1.190163, 0.4553733, 0.5137287, 0, 0, 1, 1, 1,
1.190625, -0.5275061, 1.213773, 1, 0, 0, 1, 1,
1.197093, -1.645373, 2.244683, 1, 0, 0, 1, 1,
1.210441, 0.4008969, -0.3295776, 1, 0, 0, 1, 1,
1.211445, -0.2943302, 2.238742, 1, 0, 0, 1, 1,
1.211664, -0.2049674, 2.892567, 1, 0, 0, 1, 1,
1.211689, 1.816869, 0.7651672, 0, 0, 0, 1, 1,
1.216377, -0.3984513, 2.068323, 0, 0, 0, 1, 1,
1.227442, 1.083369, -0.4021781, 0, 0, 0, 1, 1,
1.232971, -1.200573, 2.870229, 0, 0, 0, 1, 1,
1.245363, 0.09328987, -0.09909564, 0, 0, 0, 1, 1,
1.257284, 0.1898531, 0.2782212, 0, 0, 0, 1, 1,
1.260629, -2.04467, 3.141922, 0, 0, 0, 1, 1,
1.262012, 0.436584, 2.238425, 1, 1, 1, 1, 1,
1.286002, 1.752557, -0.7835477, 1, 1, 1, 1, 1,
1.293453, -0.2824079, 1.694468, 1, 1, 1, 1, 1,
1.307823, 1.156803, 1.978107, 1, 1, 1, 1, 1,
1.327148, -0.6827036, 1.972262, 1, 1, 1, 1, 1,
1.328281, -0.5419596, 2.352329, 1, 1, 1, 1, 1,
1.334525, 0.3429007, -0.278209, 1, 1, 1, 1, 1,
1.341255, -0.1777982, 2.205387, 1, 1, 1, 1, 1,
1.346737, -0.8177909, 4.280306, 1, 1, 1, 1, 1,
1.355334, 0.9460562, 1.048208, 1, 1, 1, 1, 1,
1.356663, 0.6616903, 0.6217592, 1, 1, 1, 1, 1,
1.385319, -0.8639786, 1.44003, 1, 1, 1, 1, 1,
1.390992, 0.1357333, 1.804815, 1, 1, 1, 1, 1,
1.400623, 0.2954521, 1.42673, 1, 1, 1, 1, 1,
1.411298, -0.5228153, 0.8619426, 1, 1, 1, 1, 1,
1.411554, 0.2891164, -0.4710596, 0, 0, 1, 1, 1,
1.411982, -0.9503844, 2.219957, 1, 0, 0, 1, 1,
1.417164, 1.001533, -0.2624395, 1, 0, 0, 1, 1,
1.427178, -1.167466, 3.815144, 1, 0, 0, 1, 1,
1.43194, 1.729086, 0.2151113, 1, 0, 0, 1, 1,
1.433636, -1.376096, 0.9060693, 1, 0, 0, 1, 1,
1.438809, -0.6742389, 2.476057, 0, 0, 0, 1, 1,
1.44082, 0.703525, 1.850466, 0, 0, 0, 1, 1,
1.441051, 1.121787, 1.62083, 0, 0, 0, 1, 1,
1.45048, -0.14279, 0.7249527, 0, 0, 0, 1, 1,
1.453636, -0.3967274, 1.801462, 0, 0, 0, 1, 1,
1.458448, -1.339172, 1.762808, 0, 0, 0, 1, 1,
1.478704, 1.384484, -0.5682902, 0, 0, 0, 1, 1,
1.484743, 0.3749501, 0.9295045, 1, 1, 1, 1, 1,
1.493813, -1.904699, 2.397162, 1, 1, 1, 1, 1,
1.500558, 2.302598, -1.150694, 1, 1, 1, 1, 1,
1.502167, -0.280009, 0.005235358, 1, 1, 1, 1, 1,
1.504258, -0.8418978, 2.501737, 1, 1, 1, 1, 1,
1.505444, 0.5242939, 1.772401, 1, 1, 1, 1, 1,
1.52671, 0.6560347, 2.311918, 1, 1, 1, 1, 1,
1.552219, -0.4409677, 1.802354, 1, 1, 1, 1, 1,
1.562535, -1.333372, 2.550606, 1, 1, 1, 1, 1,
1.567219, -0.4485793, 2.597282, 1, 1, 1, 1, 1,
1.585898, 0.1421507, 0.5638098, 1, 1, 1, 1, 1,
1.590049, 0.360638, 1.514319, 1, 1, 1, 1, 1,
1.617373, 1.080725, 1.993402, 1, 1, 1, 1, 1,
1.623212, -1.073128, 2.653386, 1, 1, 1, 1, 1,
1.647321, -2.421689, 2.411422, 1, 1, 1, 1, 1,
1.661943, -0.1960915, 0.8899153, 0, 0, 1, 1, 1,
1.672626, -0.4291046, 2.588237, 1, 0, 0, 1, 1,
1.672632, 0.7458934, 1.697156, 1, 0, 0, 1, 1,
1.684952, 1.710393, 0.9807338, 1, 0, 0, 1, 1,
1.686666, -0.0868263, 1.71807, 1, 0, 0, 1, 1,
1.688188, -1.253719, 2.411736, 1, 0, 0, 1, 1,
1.696474, -0.8387246, 3.575732, 0, 0, 0, 1, 1,
1.698529, 0.1793776, 3.371138, 0, 0, 0, 1, 1,
1.719739, -0.7202439, 0.5268322, 0, 0, 0, 1, 1,
1.739351, 0.864792, 0.9237329, 0, 0, 0, 1, 1,
1.762335, -0.08274361, 2.372195, 0, 0, 0, 1, 1,
1.803719, 0.03879206, 2.385625, 0, 0, 0, 1, 1,
1.812202, 0.02422936, 1.003112, 0, 0, 0, 1, 1,
1.813847, -0.3642195, 1.151423, 1, 1, 1, 1, 1,
1.916917, -1.147038, 1.99089, 1, 1, 1, 1, 1,
1.92008, 0.2989374, 2.215477, 1, 1, 1, 1, 1,
1.922765, 0.471063, -0.3369961, 1, 1, 1, 1, 1,
1.923041, 1.865319, 1.45164, 1, 1, 1, 1, 1,
1.936381, 1.470099, 1.737703, 1, 1, 1, 1, 1,
1.938759, -1.825096, 4.887123, 1, 1, 1, 1, 1,
1.943434, -1.457086, 1.473442, 1, 1, 1, 1, 1,
1.961279, -0.06523981, 1.646657, 1, 1, 1, 1, 1,
1.977529, -1.291988, 1.003531, 1, 1, 1, 1, 1,
2.048951, -1.922369, 3.246207, 1, 1, 1, 1, 1,
2.073683, -0.09343212, 0.4720673, 1, 1, 1, 1, 1,
2.104121, 0.1059707, 1.871874, 1, 1, 1, 1, 1,
2.114935, 0.8090919, 1.277416, 1, 1, 1, 1, 1,
2.122394, 0.3951613, 2.548526, 1, 1, 1, 1, 1,
2.123804, 1.236848, 0.6572021, 0, 0, 1, 1, 1,
2.148682, -0.3843019, 1.205868, 1, 0, 0, 1, 1,
2.184001, -0.6902064, 1.333879, 1, 0, 0, 1, 1,
2.195517, 0.9606078, 1.168221, 1, 0, 0, 1, 1,
2.198633, 1.119466, 2.015841, 1, 0, 0, 1, 1,
2.21091, 1.583814, 1.210183, 1, 0, 0, 1, 1,
2.222111, -1.008825, 1.714707, 0, 0, 0, 1, 1,
2.224253, 1.042119, 0.3998995, 0, 0, 0, 1, 1,
2.238666, 0.02475824, 2.878004, 0, 0, 0, 1, 1,
2.281809, -1.742123, 1.277889, 0, 0, 0, 1, 1,
2.318516, 0.6970431, 1.875561, 0, 0, 0, 1, 1,
2.351197, -1.17519, 1.47733, 0, 0, 0, 1, 1,
2.42651, -0.8907393, 2.38313, 0, 0, 0, 1, 1,
2.503395, 0.5131877, 1.373698, 1, 1, 1, 1, 1,
2.55515, 0.1767011, 1.181723, 1, 1, 1, 1, 1,
2.595172, 1.773357, 1.537668, 1, 1, 1, 1, 1,
2.602005, 0.2389538, 0.498711, 1, 1, 1, 1, 1,
2.612557, -2.055203, 0.8023728, 1, 1, 1, 1, 1,
2.680356, -1.665759, 0.9677467, 1, 1, 1, 1, 1,
2.775035, 0.3556695, 0.2139537, 1, 1, 1, 1, 1
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
var radius = 9.655794;
var distance = 33.91557;
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
mvMatrix.translate( 0.2986486, 0.3248206, 0.4232523 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.91557);
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
