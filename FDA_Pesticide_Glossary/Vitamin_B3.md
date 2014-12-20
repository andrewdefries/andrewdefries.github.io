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
-3.681654, -0.007865515, -0.06622977, 1, 0, 0, 1,
-3.215289, -0.6920755, -1.546358, 1, 0.007843138, 0, 1,
-2.703204, -1.293362, -3.395157, 1, 0.01176471, 0, 1,
-2.666353, -1.010451, -3.500131, 1, 0.01960784, 0, 1,
-2.658538, 2.271203, -1.513087, 1, 0.02352941, 0, 1,
-2.62443, 0.3704127, -0.4158654, 1, 0.03137255, 0, 1,
-2.52784, 0.722669, -1.102592, 1, 0.03529412, 0, 1,
-2.429292, 0.6435232, -0.4143441, 1, 0.04313726, 0, 1,
-2.423839, 0.7439265, -0.693126, 1, 0.04705882, 0, 1,
-2.344556, 0.0267088, -0.3189781, 1, 0.05490196, 0, 1,
-2.344302, 1.397947, -0.5022501, 1, 0.05882353, 0, 1,
-2.33436, -0.4802109, -1.826957, 1, 0.06666667, 0, 1,
-2.333743, -1.315602, -3.662221, 1, 0.07058824, 0, 1,
-2.308713, -1.676701, -1.981986, 1, 0.07843138, 0, 1,
-2.290788, 0.706379, -0.2376772, 1, 0.08235294, 0, 1,
-2.280829, -0.6560166, -3.039002, 1, 0.09019608, 0, 1,
-2.278511, 0.09233169, -1.140675, 1, 0.09411765, 0, 1,
-2.248589, 0.600445, -1.481589, 1, 0.1019608, 0, 1,
-2.18609, 0.3173773, -0.9222214, 1, 0.1098039, 0, 1,
-2.16817, 0.365478, 0.4214407, 1, 0.1137255, 0, 1,
-2.163871, -0.5053593, -0.3239864, 1, 0.1215686, 0, 1,
-2.0799, 0.07908709, -1.038397, 1, 0.1254902, 0, 1,
-2.070406, -1.56974, -2.947011, 1, 0.1333333, 0, 1,
-2.055505, -0.6957234, -2.118082, 1, 0.1372549, 0, 1,
-2.047261, 1.34957, -2.04073, 1, 0.145098, 0, 1,
-2.041537, 0.1115578, -1.102723, 1, 0.1490196, 0, 1,
-2.040625, 0.009623614, 0.0906624, 1, 0.1568628, 0, 1,
-2.039359, -0.8540877, -1.156353, 1, 0.1607843, 0, 1,
-2.021129, -1.604648, -0.2883973, 1, 0.1686275, 0, 1,
-2.010601, 1.615029, -1.627601, 1, 0.172549, 0, 1,
-1.967839, -0.06975532, -0.6659299, 1, 0.1803922, 0, 1,
-1.947743, 1.384976, -2.027445, 1, 0.1843137, 0, 1,
-1.912466, 0.4951633, -2.557346, 1, 0.1921569, 0, 1,
-1.902906, -0.4649842, -2.015383, 1, 0.1960784, 0, 1,
-1.89668, -2.733364, -3.873897, 1, 0.2039216, 0, 1,
-1.894691, 1.339074, 1.221842, 1, 0.2117647, 0, 1,
-1.884282, -0.5939617, -0.6949717, 1, 0.2156863, 0, 1,
-1.882333, -2.353374, -3.033159, 1, 0.2235294, 0, 1,
-1.837709, 0.8464305, -0.4502326, 1, 0.227451, 0, 1,
-1.836056, -1.324924, -1.428377, 1, 0.2352941, 0, 1,
-1.835587, -1.969237, -2.753585, 1, 0.2392157, 0, 1,
-1.827886, -0.6571254, -2.471734, 1, 0.2470588, 0, 1,
-1.807676, -0.1830779, -2.950985, 1, 0.2509804, 0, 1,
-1.796807, 0.03046954, -0.1735641, 1, 0.2588235, 0, 1,
-1.793659, 0.9348441, 0.1241288, 1, 0.2627451, 0, 1,
-1.782644, -1.574435, -3.64344, 1, 0.2705882, 0, 1,
-1.781362, 0.5049185, -1.006101, 1, 0.2745098, 0, 1,
-1.772772, -0.3437552, -0.468253, 1, 0.282353, 0, 1,
-1.768689, -0.5372427, -2.497828, 1, 0.2862745, 0, 1,
-1.764491, 1.39183, -1.748348, 1, 0.2941177, 0, 1,
-1.723351, -0.162473, -2.146661, 1, 0.3019608, 0, 1,
-1.694942, -0.4809587, -0.2773423, 1, 0.3058824, 0, 1,
-1.692615, -0.6138073, -2.918695, 1, 0.3137255, 0, 1,
-1.655906, 1.153409, -0.5410517, 1, 0.3176471, 0, 1,
-1.646737, -1.219662, -1.968247, 1, 0.3254902, 0, 1,
-1.637481, -0.8316718, -0.8626018, 1, 0.3294118, 0, 1,
-1.629845, -0.3561096, -1.825246, 1, 0.3372549, 0, 1,
-1.612165, -0.9887467, -2.327709, 1, 0.3411765, 0, 1,
-1.600409, 0.906544, -1.230886, 1, 0.3490196, 0, 1,
-1.556499, 1.074041, 0.05467461, 1, 0.3529412, 0, 1,
-1.530182, 0.2449692, -0.8041784, 1, 0.3607843, 0, 1,
-1.52029, -1.101616, 0.5659872, 1, 0.3647059, 0, 1,
-1.518556, 0.2975442, -0.5099912, 1, 0.372549, 0, 1,
-1.503185, 0.5743694, -0.6606743, 1, 0.3764706, 0, 1,
-1.496285, -0.3094053, -2.827774, 1, 0.3843137, 0, 1,
-1.490137, -0.5747965, -3.786248, 1, 0.3882353, 0, 1,
-1.48693, -0.3496097, -1.730958, 1, 0.3960784, 0, 1,
-1.486613, 0.06410568, -1.642063, 1, 0.4039216, 0, 1,
-1.486387, -0.5290104, -1.830664, 1, 0.4078431, 0, 1,
-1.486354, 0.01783474, -1.000561, 1, 0.4156863, 0, 1,
-1.482446, -0.8221487, -3.81088, 1, 0.4196078, 0, 1,
-1.482322, 0.2757004, -3.302775, 1, 0.427451, 0, 1,
-1.481681, 1.437328, -2.298301, 1, 0.4313726, 0, 1,
-1.480049, 0.4004126, 0.6176718, 1, 0.4392157, 0, 1,
-1.463905, 2.518325, -0.5021329, 1, 0.4431373, 0, 1,
-1.461464, 0.4316457, -3.506643, 1, 0.4509804, 0, 1,
-1.458447, 0.9493145, -1.643439, 1, 0.454902, 0, 1,
-1.436437, 0.3467937, -2.850233, 1, 0.4627451, 0, 1,
-1.435383, -0.2139694, -0.9769562, 1, 0.4666667, 0, 1,
-1.434543, -0.547631, -0.5076174, 1, 0.4745098, 0, 1,
-1.429205, -0.6668468, -0.9417334, 1, 0.4784314, 0, 1,
-1.4286, 1.484524, -0.5582721, 1, 0.4862745, 0, 1,
-1.413801, 0.8987222, -0.7538432, 1, 0.4901961, 0, 1,
-1.411178, 0.7634089, -0.8560738, 1, 0.4980392, 0, 1,
-1.403275, -0.2098854, -1.283579, 1, 0.5058824, 0, 1,
-1.379602, 0.5056205, -0.4286439, 1, 0.509804, 0, 1,
-1.367959, -0.2904528, -1.554756, 1, 0.5176471, 0, 1,
-1.364375, -0.6700045, -1.906932, 1, 0.5215687, 0, 1,
-1.35098, -0.152781, -1.216989, 1, 0.5294118, 0, 1,
-1.342854, -1.243092, -2.137791, 1, 0.5333334, 0, 1,
-1.321945, 0.5032151, -1.477757, 1, 0.5411765, 0, 1,
-1.318464, -0.1276404, -1.591474, 1, 0.5450981, 0, 1,
-1.300493, -0.4451266, -1.350598, 1, 0.5529412, 0, 1,
-1.299981, -1.802479, -3.226514, 1, 0.5568628, 0, 1,
-1.292677, -0.122487, -1.245404, 1, 0.5647059, 0, 1,
-1.286277, 0.6475895, 0.3652095, 1, 0.5686275, 0, 1,
-1.282557, -0.4843805, -1.399566, 1, 0.5764706, 0, 1,
-1.263283, 0.5827288, -2.59553, 1, 0.5803922, 0, 1,
-1.261168, 0.2827092, -2.75221, 1, 0.5882353, 0, 1,
-1.254709, 1.771436, -2.15491, 1, 0.5921569, 0, 1,
-1.249367, -1.663007, -2.981868, 1, 0.6, 0, 1,
-1.236008, 0.02470728, -2.337864, 1, 0.6078432, 0, 1,
-1.2285, -0.866825, -2.587011, 1, 0.6117647, 0, 1,
-1.225227, 0.9660932, 0.6384256, 1, 0.6196079, 0, 1,
-1.210337, 1.780518, -0.3215718, 1, 0.6235294, 0, 1,
-1.202886, 0.1633764, -1.673798, 1, 0.6313726, 0, 1,
-1.20085, -0.4838003, -0.8209471, 1, 0.6352941, 0, 1,
-1.183371, -0.4663483, -2.744408, 1, 0.6431373, 0, 1,
-1.173801, 0.8046933, -0.6823488, 1, 0.6470588, 0, 1,
-1.169658, 0.9281855, -0.2658349, 1, 0.654902, 0, 1,
-1.167487, -0.1910063, -1.00168, 1, 0.6588235, 0, 1,
-1.161646, 1.004777, 0.04828811, 1, 0.6666667, 0, 1,
-1.147384, -0.06269848, -2.331768, 1, 0.6705883, 0, 1,
-1.145241, -0.2469228, -2.275252, 1, 0.6784314, 0, 1,
-1.143221, 0.6325293, -0.3211978, 1, 0.682353, 0, 1,
-1.142466, -0.04516017, -2.578359, 1, 0.6901961, 0, 1,
-1.138077, -0.9627073, -1.32383, 1, 0.6941177, 0, 1,
-1.127995, 0.47844, 0.1283858, 1, 0.7019608, 0, 1,
-1.126329, 0.7891473, -1.44172, 1, 0.7098039, 0, 1,
-1.125766, -1.026991, -1.285407, 1, 0.7137255, 0, 1,
-1.114494, -0.1272309, -0.2034064, 1, 0.7215686, 0, 1,
-1.106712, -1.21172, -2.927922, 1, 0.7254902, 0, 1,
-1.104877, 1.368873, 0.5999622, 1, 0.7333333, 0, 1,
-1.104178, -0.4582436, -4.025207, 1, 0.7372549, 0, 1,
-1.103093, -1.169809, -1.939083, 1, 0.7450981, 0, 1,
-1.100488, -1.857334, -3.108364, 1, 0.7490196, 0, 1,
-1.095025, -0.8775606, -2.580656, 1, 0.7568628, 0, 1,
-1.085582, 0.1658479, 0.2634254, 1, 0.7607843, 0, 1,
-1.079021, 1.135031, -0.8140366, 1, 0.7686275, 0, 1,
-1.072668, -0.08677036, -3.288955, 1, 0.772549, 0, 1,
-1.072635, 0.1052687, -0.8610137, 1, 0.7803922, 0, 1,
-1.0645, -1.297064, -3.361147, 1, 0.7843137, 0, 1,
-1.060753, 1.722381, -0.02148448, 1, 0.7921569, 0, 1,
-1.057366, 0.9835471, -1.104534, 1, 0.7960784, 0, 1,
-1.044703, 2.030101, -0.0710314, 1, 0.8039216, 0, 1,
-1.038596, 0.6586134, 0.2455426, 1, 0.8117647, 0, 1,
-1.034566, 0.07230831, -2.716522, 1, 0.8156863, 0, 1,
-1.029475, -1.122293, -2.987801, 1, 0.8235294, 0, 1,
-1.016876, 1.438697, 0.9885014, 1, 0.827451, 0, 1,
-1.01529, 1.144154, -0.3638654, 1, 0.8352941, 0, 1,
-1.009384, -0.05420841, -1.814883, 1, 0.8392157, 0, 1,
-0.9935616, 1.836512, -1.666892, 1, 0.8470588, 0, 1,
-0.9927635, 0.2872298, -2.013847, 1, 0.8509804, 0, 1,
-0.9818687, 0.4322359, -2.646641, 1, 0.8588235, 0, 1,
-0.9780909, -0.210971, -0.9591825, 1, 0.8627451, 0, 1,
-0.9753149, -0.9572197, -2.276346, 1, 0.8705882, 0, 1,
-0.9712214, 0.1909961, -1.442878, 1, 0.8745098, 0, 1,
-0.9600251, -0.6017373, -2.156416, 1, 0.8823529, 0, 1,
-0.9588653, -0.2281075, -2.726181, 1, 0.8862745, 0, 1,
-0.950898, 0.2920199, -2.710644, 1, 0.8941177, 0, 1,
-0.9497926, -1.650494, -1.653956, 1, 0.8980392, 0, 1,
-0.9401669, 0.4333347, -1.575923, 1, 0.9058824, 0, 1,
-0.9365649, 0.2988147, -1.34434, 1, 0.9137255, 0, 1,
-0.9355669, -0.542455, -4.642648, 1, 0.9176471, 0, 1,
-0.9343112, 0.2309907, -1.52363, 1, 0.9254902, 0, 1,
-0.9324416, -0.2771332, -1.432946, 1, 0.9294118, 0, 1,
-0.9319667, 0.3258276, -1.912313, 1, 0.9372549, 0, 1,
-0.9307157, -1.377583, -1.977144, 1, 0.9411765, 0, 1,
-0.9272423, -0.8015952, -2.071355, 1, 0.9490196, 0, 1,
-0.9241232, -0.6760888, -2.987607, 1, 0.9529412, 0, 1,
-0.9216065, -0.6355422, -2.70944, 1, 0.9607843, 0, 1,
-0.9174561, -0.4490303, -3.415144, 1, 0.9647059, 0, 1,
-0.9159347, -0.4222606, -2.569128, 1, 0.972549, 0, 1,
-0.9099755, 0.5174064, -0.5504037, 1, 0.9764706, 0, 1,
-0.9005601, 1.493733, -1.412945, 1, 0.9843137, 0, 1,
-0.8985172, 0.5808417, -0.2455768, 1, 0.9882353, 0, 1,
-0.8982921, 0.2847061, -1.017057, 1, 0.9960784, 0, 1,
-0.8978492, 1.606676, -1.664924, 0.9960784, 1, 0, 1,
-0.8970876, 0.8555313, -1.748552, 0.9921569, 1, 0, 1,
-0.8968368, 1.091652, -1.875221, 0.9843137, 1, 0, 1,
-0.8951532, -0.2720486, -2.454213, 0.9803922, 1, 0, 1,
-0.8858886, 0.1451925, -1.360154, 0.972549, 1, 0, 1,
-0.8840282, -0.2255733, -2.649186, 0.9686275, 1, 0, 1,
-0.8776931, 0.396199, -1.347599, 0.9607843, 1, 0, 1,
-0.864536, -0.2429358, -2.061266, 0.9568627, 1, 0, 1,
-0.8592414, -0.4033948, -2.920378, 0.9490196, 1, 0, 1,
-0.8575638, -1.296569, -3.190067, 0.945098, 1, 0, 1,
-0.8562557, -0.5157096, -1.209028, 0.9372549, 1, 0, 1,
-0.8476968, 2.049294, 0.1282978, 0.9333333, 1, 0, 1,
-0.8468423, 0.4610085, -0.3416325, 0.9254902, 1, 0, 1,
-0.8410774, -1.227883, -2.019098, 0.9215686, 1, 0, 1,
-0.8410651, -1.119882, -3.910733, 0.9137255, 1, 0, 1,
-0.8373922, -0.5104216, -2.361448, 0.9098039, 1, 0, 1,
-0.8364348, -0.1151348, -2.762514, 0.9019608, 1, 0, 1,
-0.8364304, 0.7817924, 0.9583572, 0.8941177, 1, 0, 1,
-0.8350478, 0.2323432, -3.41523, 0.8901961, 1, 0, 1,
-0.8344453, 0.6783009, 0.1666393, 0.8823529, 1, 0, 1,
-0.830451, 0.8749789, -0.2869249, 0.8784314, 1, 0, 1,
-0.82918, 0.8821256, -2.263134, 0.8705882, 1, 0, 1,
-0.8239555, 0.007291903, -1.311825, 0.8666667, 1, 0, 1,
-0.8228148, 1.077256, 0.3715791, 0.8588235, 1, 0, 1,
-0.8201599, -0.6228399, -0.02714978, 0.854902, 1, 0, 1,
-0.8196346, 0.8683634, -2.029388, 0.8470588, 1, 0, 1,
-0.8135415, 0.9210566, -1.944515, 0.8431373, 1, 0, 1,
-0.8100016, 0.02243663, -4.598667, 0.8352941, 1, 0, 1,
-0.8015842, -0.4709125, -2.039354, 0.8313726, 1, 0, 1,
-0.7986706, 0.7825884, -1.603339, 0.8235294, 1, 0, 1,
-0.7985727, -0.1460238, -1.852437, 0.8196079, 1, 0, 1,
-0.7907127, 0.322785, -0.2318034, 0.8117647, 1, 0, 1,
-0.7881274, 1.463775, 0.08826592, 0.8078431, 1, 0, 1,
-0.7764875, -1.445464, -3.014661, 0.8, 1, 0, 1,
-0.7710381, 1.865182, -0.375319, 0.7921569, 1, 0, 1,
-0.7664803, -0.9745331, -2.011075, 0.7882353, 1, 0, 1,
-0.7654897, 0.2668914, -0.04491478, 0.7803922, 1, 0, 1,
-0.7627771, 0.8811775, -0.7004485, 0.7764706, 1, 0, 1,
-0.7603053, 0.8374633, 1.323122, 0.7686275, 1, 0, 1,
-0.7586015, -1.421432, -2.509218, 0.7647059, 1, 0, 1,
-0.7561558, 1.177374, 0.03206879, 0.7568628, 1, 0, 1,
-0.7546458, 1.448124, -1.230318, 0.7529412, 1, 0, 1,
-0.7532097, 1.711394, 1.485375, 0.7450981, 1, 0, 1,
-0.747583, 1.927473, -2.534527, 0.7411765, 1, 0, 1,
-0.7376702, -0.4208405, -1.667858, 0.7333333, 1, 0, 1,
-0.737607, 0.6542556, -1.698306, 0.7294118, 1, 0, 1,
-0.7352489, 0.1768793, -1.107516, 0.7215686, 1, 0, 1,
-0.7319165, 0.6549066, 0.2010317, 0.7176471, 1, 0, 1,
-0.7303244, 0.9231716, 0.216878, 0.7098039, 1, 0, 1,
-0.7273998, 0.007384425, -1.619433, 0.7058824, 1, 0, 1,
-0.7230456, 1.755025, -0.1882943, 0.6980392, 1, 0, 1,
-0.7213796, -1.137789, -2.91696, 0.6901961, 1, 0, 1,
-0.7198867, 0.04491453, -1.275559, 0.6862745, 1, 0, 1,
-0.7132194, 1.88366, 0.01338306, 0.6784314, 1, 0, 1,
-0.7131279, -0.5128994, -3.034931, 0.6745098, 1, 0, 1,
-0.7101627, 0.5495333, -1.841881, 0.6666667, 1, 0, 1,
-0.709317, -1.649568, -3.316115, 0.6627451, 1, 0, 1,
-0.7090781, 1.120315, 0.739796, 0.654902, 1, 0, 1,
-0.708378, -0.6092871, -0.8509818, 0.6509804, 1, 0, 1,
-0.7011176, -0.4786958, -1.618256, 0.6431373, 1, 0, 1,
-0.6953699, 1.2131, -0.6458379, 0.6392157, 1, 0, 1,
-0.6921631, 0.146225, -0.0229168, 0.6313726, 1, 0, 1,
-0.6886356, -0.2564445, -2.37815, 0.627451, 1, 0, 1,
-0.6810151, 1.425521, -0.3619094, 0.6196079, 1, 0, 1,
-0.6809624, -0.6847109, -1.779078, 0.6156863, 1, 0, 1,
-0.6738629, 0.7444888, -0.5546526, 0.6078432, 1, 0, 1,
-0.6678856, -0.4945377, -2.431983, 0.6039216, 1, 0, 1,
-0.6672168, -0.1422364, -0.8821936, 0.5960785, 1, 0, 1,
-0.6644014, 0.9290588, -0.6855615, 0.5882353, 1, 0, 1,
-0.6633696, -0.9314686, -2.850389, 0.5843138, 1, 0, 1,
-0.6624346, 0.03527436, -1.631474, 0.5764706, 1, 0, 1,
-0.6613986, 0.2386553, -0.6402776, 0.572549, 1, 0, 1,
-0.6581637, -0.7622431, -3.073693, 0.5647059, 1, 0, 1,
-0.6551716, -0.02850289, -0.6920187, 0.5607843, 1, 0, 1,
-0.6519551, 0.597346, 2.223274, 0.5529412, 1, 0, 1,
-0.6488629, 0.1895936, -2.080373, 0.5490196, 1, 0, 1,
-0.6438583, -1.014607, -3.038377, 0.5411765, 1, 0, 1,
-0.6429909, -1.526864, -3.414885, 0.5372549, 1, 0, 1,
-0.6427836, -0.4242052, -2.855047, 0.5294118, 1, 0, 1,
-0.6333215, 0.5219645, -1.813791, 0.5254902, 1, 0, 1,
-0.6205192, -0.7480274, -2.321925, 0.5176471, 1, 0, 1,
-0.6202676, 0.6999629, -0.4041637, 0.5137255, 1, 0, 1,
-0.617696, -0.6945421, -2.104914, 0.5058824, 1, 0, 1,
-0.6162895, 0.7927807, -1.871695, 0.5019608, 1, 0, 1,
-0.6137007, 0.2010308, -2.598433, 0.4941176, 1, 0, 1,
-0.6111981, 1.362435, -1.859565, 0.4862745, 1, 0, 1,
-0.5964639, 1.011814, -0.6668385, 0.4823529, 1, 0, 1,
-0.5961137, -1.714554, -2.049783, 0.4745098, 1, 0, 1,
-0.5955613, 1.298503, -1.606407, 0.4705882, 1, 0, 1,
-0.5884576, 0.6019252, 0.0002451507, 0.4627451, 1, 0, 1,
-0.5774214, -1.763716, -1.453207, 0.4588235, 1, 0, 1,
-0.5735043, 1.53119, 0.5065246, 0.4509804, 1, 0, 1,
-0.5675862, -0.8459814, -2.455423, 0.4470588, 1, 0, 1,
-0.5667819, 1.223196, -1.885668, 0.4392157, 1, 0, 1,
-0.5660772, -1.65867, -2.907257, 0.4352941, 1, 0, 1,
-0.5657477, 1.2324, -0.373497, 0.427451, 1, 0, 1,
-0.5653481, 0.5729765, -1.020758, 0.4235294, 1, 0, 1,
-0.5650282, 0.2293985, 0.8288004, 0.4156863, 1, 0, 1,
-0.5648168, 0.3421995, 0.5748996, 0.4117647, 1, 0, 1,
-0.5646095, -0.6382728, -2.893814, 0.4039216, 1, 0, 1,
-0.5637076, -0.4933316, -2.105303, 0.3960784, 1, 0, 1,
-0.563589, 0.4471297, -1.247199, 0.3921569, 1, 0, 1,
-0.5624176, 0.2144184, -2.68483, 0.3843137, 1, 0, 1,
-0.5543259, -0.612099, -0.9173499, 0.3803922, 1, 0, 1,
-0.5522233, 0.4124813, -2.483207, 0.372549, 1, 0, 1,
-0.5521807, 0.5184744, -0.1571237, 0.3686275, 1, 0, 1,
-0.5505954, -1.073916, -3.376567, 0.3607843, 1, 0, 1,
-0.5497314, 0.2862613, -1.55608, 0.3568628, 1, 0, 1,
-0.5450961, -0.09756803, -1.757716, 0.3490196, 1, 0, 1,
-0.5429348, 0.451149, -0.7495969, 0.345098, 1, 0, 1,
-0.5393703, 0.5356797, -2.741574, 0.3372549, 1, 0, 1,
-0.5378114, -0.3967429, -0.4251159, 0.3333333, 1, 0, 1,
-0.5368187, -0.7902908, -1.037803, 0.3254902, 1, 0, 1,
-0.5240975, -0.238312, -0.9971224, 0.3215686, 1, 0, 1,
-0.5238215, 2.114252, 0.2418685, 0.3137255, 1, 0, 1,
-0.5204492, -0.4692049, -1.81948, 0.3098039, 1, 0, 1,
-0.5091401, 0.2392401, -0.2677979, 0.3019608, 1, 0, 1,
-0.5019209, 0.306328, 0.06869216, 0.2941177, 1, 0, 1,
-0.5002688, 0.9647533, 0.6404377, 0.2901961, 1, 0, 1,
-0.4993031, -0.4183919, -0.5797608, 0.282353, 1, 0, 1,
-0.4958772, 0.9824982, 0.09175345, 0.2784314, 1, 0, 1,
-0.4932661, -0.5082908, -1.826365, 0.2705882, 1, 0, 1,
-0.4897323, 1.026139, -1.431336, 0.2666667, 1, 0, 1,
-0.4886114, 0.1053075, -0.7035717, 0.2588235, 1, 0, 1,
-0.4884844, 0.9298661, -1.013964, 0.254902, 1, 0, 1,
-0.4859441, -1.406406, -2.531075, 0.2470588, 1, 0, 1,
-0.4828006, -0.6950807, -3.797837, 0.2431373, 1, 0, 1,
-0.482641, -0.5388661, -3.156934, 0.2352941, 1, 0, 1,
-0.480689, 0.3199241, -0.2400305, 0.2313726, 1, 0, 1,
-0.4749269, -1.05459, -3.2298, 0.2235294, 1, 0, 1,
-0.4698527, -1.149575, -2.983581, 0.2196078, 1, 0, 1,
-0.4673187, -0.09090801, -2.982159, 0.2117647, 1, 0, 1,
-0.4637007, -0.9037845, -1.958147, 0.2078431, 1, 0, 1,
-0.4618456, 2.017981, -0.1862812, 0.2, 1, 0, 1,
-0.4608733, -0.6283137, -3.994481, 0.1921569, 1, 0, 1,
-0.4588993, 0.8726934, -0.3026776, 0.1882353, 1, 0, 1,
-0.4575635, -0.1328671, -2.661864, 0.1803922, 1, 0, 1,
-0.453996, 0.7337565, 1.491496, 0.1764706, 1, 0, 1,
-0.4507596, 0.7380871, -2.153457, 0.1686275, 1, 0, 1,
-0.4501739, 1.504967, 0.8755455, 0.1647059, 1, 0, 1,
-0.4375444, 0.2546034, -2.14101, 0.1568628, 1, 0, 1,
-0.4335871, 0.6135423, -0.6883466, 0.1529412, 1, 0, 1,
-0.4326171, 0.2822233, -0.4731691, 0.145098, 1, 0, 1,
-0.4316032, 0.04449734, -2.665198, 0.1411765, 1, 0, 1,
-0.4262256, 0.2533181, 0.3995906, 0.1333333, 1, 0, 1,
-0.4256091, 0.9438273, -0.1734615, 0.1294118, 1, 0, 1,
-0.416495, -0.6656182, -3.665725, 0.1215686, 1, 0, 1,
-0.4131543, 0.7896968, -0.9567708, 0.1176471, 1, 0, 1,
-0.4106293, 0.3368752, -4.307958, 0.1098039, 1, 0, 1,
-0.4101734, 0.05337282, 0.1489698, 0.1058824, 1, 0, 1,
-0.4094526, 1.549228, -0.2247625, 0.09803922, 1, 0, 1,
-0.4067258, -1.131629, -3.943322, 0.09019608, 1, 0, 1,
-0.4061898, -0.7424679, -4.64037, 0.08627451, 1, 0, 1,
-0.4047044, 0.2030126, -0.1750443, 0.07843138, 1, 0, 1,
-0.4046353, -0.1154056, -1.038367, 0.07450981, 1, 0, 1,
-0.404319, 1.144284, -0.1717615, 0.06666667, 1, 0, 1,
-0.3906932, -0.7324172, -3.81831, 0.0627451, 1, 0, 1,
-0.3871371, 0.7997982, -1.169172, 0.05490196, 1, 0, 1,
-0.3868676, 1.168508, 2.220441, 0.05098039, 1, 0, 1,
-0.3747523, -1.177892, -1.431886, 0.04313726, 1, 0, 1,
-0.3729703, -2.967083, -1.071676, 0.03921569, 1, 0, 1,
-0.3703579, 1.605758, -0.4484537, 0.03137255, 1, 0, 1,
-0.3701752, -0.9226027, -1.913364, 0.02745098, 1, 0, 1,
-0.368865, 0.4616396, -0.7083485, 0.01960784, 1, 0, 1,
-0.3660466, -0.1959133, -2.836305, 0.01568628, 1, 0, 1,
-0.3641873, 1.148648, 1.14649, 0.007843138, 1, 0, 1,
-0.3641535, -1.200403, -0.1352035, 0.003921569, 1, 0, 1,
-0.3626233, -1.031458, -2.090143, 0, 1, 0.003921569, 1,
-0.3623617, -1.186686, -2.351917, 0, 1, 0.01176471, 1,
-0.3607608, -0.4691079, -2.348119, 0, 1, 0.01568628, 1,
-0.355949, -0.2443788, -2.191251, 0, 1, 0.02352941, 1,
-0.354692, 0.6136308, 0.123946, 0, 1, 0.02745098, 1,
-0.3537656, -0.0460147, -1.501542, 0, 1, 0.03529412, 1,
-0.3534868, 0.7649355, -0.1077778, 0, 1, 0.03921569, 1,
-0.3515386, -1.951266, -1.799935, 0, 1, 0.04705882, 1,
-0.3497092, 0.0935825, -0.5736799, 0, 1, 0.05098039, 1,
-0.3496627, -0.1379945, -2.698024, 0, 1, 0.05882353, 1,
-0.3481954, 1.798107, 0.8735421, 0, 1, 0.0627451, 1,
-0.3442855, 1.353799, 0.2127628, 0, 1, 0.07058824, 1,
-0.3423128, -0.1891319, -2.031973, 0, 1, 0.07450981, 1,
-0.341229, -0.01577765, -0.8121553, 0, 1, 0.08235294, 1,
-0.3370363, -0.3650836, -1.886519, 0, 1, 0.08627451, 1,
-0.3344641, -0.5251513, -1.238244, 0, 1, 0.09411765, 1,
-0.3327537, 0.05768318, -1.964308, 0, 1, 0.1019608, 1,
-0.3315646, 0.3002088, -0.274736, 0, 1, 0.1058824, 1,
-0.3269883, -0.6660601, -2.174259, 0, 1, 0.1137255, 1,
-0.326574, -1.019309, -4.116955, 0, 1, 0.1176471, 1,
-0.3214436, -0.5813976, -1.503406, 0, 1, 0.1254902, 1,
-0.3150346, 0.1605294, -2.694187, 0, 1, 0.1294118, 1,
-0.3137861, 0.9899139, 0.01740976, 0, 1, 0.1372549, 1,
-0.3135801, -0.95015, -2.964506, 0, 1, 0.1411765, 1,
-0.3110545, 0.2197144, -1.592057, 0, 1, 0.1490196, 1,
-0.3097088, -1.183628, -3.067606, 0, 1, 0.1529412, 1,
-0.3020728, 1.884607, 0.1908315, 0, 1, 0.1607843, 1,
-0.2945117, 1.197264, -1.619367, 0, 1, 0.1647059, 1,
-0.2921896, -0.58915, -2.069358, 0, 1, 0.172549, 1,
-0.2917053, -0.714866, -1.961025, 0, 1, 0.1764706, 1,
-0.2913338, 0.5048475, -0.288377, 0, 1, 0.1843137, 1,
-0.2887185, -1.633996, -4.740484, 0, 1, 0.1882353, 1,
-0.2852587, -0.1522456, -1.444643, 0, 1, 0.1960784, 1,
-0.2849739, -0.04976305, -3.750103, 0, 1, 0.2039216, 1,
-0.2813387, -1.860243, -2.869219, 0, 1, 0.2078431, 1,
-0.2776438, -3.569317, -1.351271, 0, 1, 0.2156863, 1,
-0.2761427, 1.371945, -0.1258613, 0, 1, 0.2196078, 1,
-0.2704075, -0.2787666, -3.400178, 0, 1, 0.227451, 1,
-0.2691588, 1.00605, 0.09416179, 0, 1, 0.2313726, 1,
-0.2658382, 0.4653643, -0.6720066, 0, 1, 0.2392157, 1,
-0.2647868, -0.3677801, -2.764249, 0, 1, 0.2431373, 1,
-0.2646475, -0.6112663, -3.422654, 0, 1, 0.2509804, 1,
-0.2641333, -1.095704, -3.351016, 0, 1, 0.254902, 1,
-0.2638935, 0.2133365, 0.19949, 0, 1, 0.2627451, 1,
-0.2573562, -0.3506396, 0.00917098, 0, 1, 0.2666667, 1,
-0.2572942, 0.5767373, 0.6499, 0, 1, 0.2745098, 1,
-0.2509933, 0.5536268, -1.224288, 0, 1, 0.2784314, 1,
-0.250933, -0.1798092, -1.234915, 0, 1, 0.2862745, 1,
-0.2455641, 1.050897, 0.4134893, 0, 1, 0.2901961, 1,
-0.2447175, -0.3735744, -2.574299, 0, 1, 0.2980392, 1,
-0.2422579, 0.3204223, -1.521442, 0, 1, 0.3058824, 1,
-0.2416947, -0.4395642, -2.830553, 0, 1, 0.3098039, 1,
-0.2416908, 0.5874788, 0.5741513, 0, 1, 0.3176471, 1,
-0.2404005, 1.451768, -1.054761, 0, 1, 0.3215686, 1,
-0.2362082, -2.135334, -3.989911, 0, 1, 0.3294118, 1,
-0.2346119, -0.4128298, -3.576336, 0, 1, 0.3333333, 1,
-0.2293372, 0.4128494, -0.6842693, 0, 1, 0.3411765, 1,
-0.2278153, -1.164612, -1.906964, 0, 1, 0.345098, 1,
-0.2278025, -0.06698819, -2.560493, 0, 1, 0.3529412, 1,
-0.2194597, 0.8349627, -1.873203, 0, 1, 0.3568628, 1,
-0.208076, -0.4215695, -2.758343, 0, 1, 0.3647059, 1,
-0.2016893, 0.862104, 1.960056, 0, 1, 0.3686275, 1,
-0.1981752, 1.805949, 0.2225949, 0, 1, 0.3764706, 1,
-0.1967034, -1.168992, -2.849963, 0, 1, 0.3803922, 1,
-0.1934895, -0.4059437, -3.097255, 0, 1, 0.3882353, 1,
-0.1895627, 2.212454, -0.9206762, 0, 1, 0.3921569, 1,
-0.1894018, -0.6528002, -3.56761, 0, 1, 0.4, 1,
-0.1879378, 0.2056034, -1.403265, 0, 1, 0.4078431, 1,
-0.1878295, 1.552323, -2.183549, 0, 1, 0.4117647, 1,
-0.185998, 0.5671896, -0.9573902, 0, 1, 0.4196078, 1,
-0.1814345, 0.4923802, -0.7921668, 0, 1, 0.4235294, 1,
-0.1774381, -0.9221532, -2.735623, 0, 1, 0.4313726, 1,
-0.1752341, -0.3723328, -2.825849, 0, 1, 0.4352941, 1,
-0.1751966, -1.905793, -2.35595, 0, 1, 0.4431373, 1,
-0.1708962, 0.9299798, 0.3422272, 0, 1, 0.4470588, 1,
-0.1694743, 1.151462, -1.639403, 0, 1, 0.454902, 1,
-0.1638573, -0.9165829, -3.498968, 0, 1, 0.4588235, 1,
-0.1569068, 0.01757067, -2.470225, 0, 1, 0.4666667, 1,
-0.1549917, -0.7067505, -3.046962, 0, 1, 0.4705882, 1,
-0.1544235, 1.72261, 0.5052188, 0, 1, 0.4784314, 1,
-0.1541589, 1.7991, -2.559341, 0, 1, 0.4823529, 1,
-0.153016, -0.1891281, -1.631295, 0, 1, 0.4901961, 1,
-0.1520686, -1.47134, -3.302835, 0, 1, 0.4941176, 1,
-0.1517447, 0.4141864, -1.336201, 0, 1, 0.5019608, 1,
-0.1471659, 0.5658226, -0.09618812, 0, 1, 0.509804, 1,
-0.1464485, 0.4343927, -2.091156, 0, 1, 0.5137255, 1,
-0.1454509, -0.3162776, -2.057446, 0, 1, 0.5215687, 1,
-0.140861, 2.412162, 2.382981, 0, 1, 0.5254902, 1,
-0.1378396, -0.172224, -2.152873, 0, 1, 0.5333334, 1,
-0.1371808, -0.2992047, -2.984729, 0, 1, 0.5372549, 1,
-0.1306492, -2.38146, -3.357671, 0, 1, 0.5450981, 1,
-0.1267935, 0.8642011, 0.4455203, 0, 1, 0.5490196, 1,
-0.1258783, -1.205199, -3.104534, 0, 1, 0.5568628, 1,
-0.1253531, -0.8506106, -3.578583, 0, 1, 0.5607843, 1,
-0.1218136, -1.728372, -1.814065, 0, 1, 0.5686275, 1,
-0.1211865, 0.3785635, -0.3315504, 0, 1, 0.572549, 1,
-0.1204277, 0.7403181, -0.532795, 0, 1, 0.5803922, 1,
-0.1194992, 0.4317541, -1.134318, 0, 1, 0.5843138, 1,
-0.1098267, -0.8057349, -2.577153, 0, 1, 0.5921569, 1,
-0.1061786, 1.556379, -0.623895, 0, 1, 0.5960785, 1,
-0.1050012, -0.7700122, -3.473957, 0, 1, 0.6039216, 1,
-0.1039564, -0.6234666, -0.996056, 0, 1, 0.6117647, 1,
-0.0993463, -0.8497367, -2.133943, 0, 1, 0.6156863, 1,
-0.09807016, -0.03656631, -3.010917, 0, 1, 0.6235294, 1,
-0.09382731, 1.03974, -0.2272522, 0, 1, 0.627451, 1,
-0.09302481, 1.670003, -2.728225, 0, 1, 0.6352941, 1,
-0.08877771, -0.1816542, -3.22365, 0, 1, 0.6392157, 1,
-0.08834707, -0.2213547, -3.583235, 0, 1, 0.6470588, 1,
-0.08301579, -0.03699728, -3.634728, 0, 1, 0.6509804, 1,
-0.08246937, 1.290767, -0.3683741, 0, 1, 0.6588235, 1,
-0.08127876, -0.9068609, -3.810196, 0, 1, 0.6627451, 1,
-0.08120823, -0.1758995, -2.752571, 0, 1, 0.6705883, 1,
-0.0766439, 0.1209563, 1.361313, 0, 1, 0.6745098, 1,
-0.07458021, -1.636066, -4.73341, 0, 1, 0.682353, 1,
-0.06370981, -0.120396, -1.653099, 0, 1, 0.6862745, 1,
-0.06290743, -0.1023471, -1.710348, 0, 1, 0.6941177, 1,
-0.06052272, 0.004470854, -4.468707, 0, 1, 0.7019608, 1,
-0.05975142, -0.5898436, -3.416508, 0, 1, 0.7058824, 1,
-0.04977005, -0.463121, -3.499667, 0, 1, 0.7137255, 1,
-0.04490142, -1.188849, -2.723663, 0, 1, 0.7176471, 1,
-0.04368109, 2.021357, 1.561679, 0, 1, 0.7254902, 1,
-0.03244175, -0.1738084, -1.860825, 0, 1, 0.7294118, 1,
-0.03142566, 0.3870764, -0.3546119, 0, 1, 0.7372549, 1,
-0.02917165, 1.750142, -0.06194793, 0, 1, 0.7411765, 1,
-0.02730069, 0.6560072, -0.5922292, 0, 1, 0.7490196, 1,
-0.02251627, 0.1577838, 0.4862776, 0, 1, 0.7529412, 1,
-0.02185087, 2.069357, -0.06082062, 0, 1, 0.7607843, 1,
-0.01867738, 0.3112083, 1.58776, 0, 1, 0.7647059, 1,
-0.01635986, 0.4909112, -0.102273, 0, 1, 0.772549, 1,
-0.01533511, 0.8369338, 0.1506905, 0, 1, 0.7764706, 1,
-0.0009509297, -2.370342, -3.473405, 0, 1, 0.7843137, 1,
0.0006669005, 0.7551925, 1.042143, 0, 1, 0.7882353, 1,
0.004072706, -0.2522141, 2.924356, 0, 1, 0.7960784, 1,
0.01082031, 0.8274047, -0.07097553, 0, 1, 0.8039216, 1,
0.01290843, -1.84461, 3.530413, 0, 1, 0.8078431, 1,
0.01650961, -0.1946884, 1.345963, 0, 1, 0.8156863, 1,
0.01764311, -0.2158365, 3.322692, 0, 1, 0.8196079, 1,
0.02057635, 1.044682, -1.119466, 0, 1, 0.827451, 1,
0.02326931, -1.781025, 2.062222, 0, 1, 0.8313726, 1,
0.02509877, 0.6556029, -0.5402355, 0, 1, 0.8392157, 1,
0.02534491, 1.306123, 0.1249695, 0, 1, 0.8431373, 1,
0.03096128, 1.276848, 3.28381, 0, 1, 0.8509804, 1,
0.03607884, 0.05214406, -0.5958694, 0, 1, 0.854902, 1,
0.0364223, -0.4296937, 2.115237, 0, 1, 0.8627451, 1,
0.04062166, -0.1338893, 3.78326, 0, 1, 0.8666667, 1,
0.04172571, 0.1830312, 0.8427454, 0, 1, 0.8745098, 1,
0.04647624, -0.06643275, 3.549061, 0, 1, 0.8784314, 1,
0.0497767, -0.4311255, 0.7386141, 0, 1, 0.8862745, 1,
0.05062275, 0.1321362, -0.2683974, 0, 1, 0.8901961, 1,
0.05301584, 0.5686211, -0.1401417, 0, 1, 0.8980392, 1,
0.05546729, 0.1078903, 0.613118, 0, 1, 0.9058824, 1,
0.05761782, 0.9795952, -0.6464391, 0, 1, 0.9098039, 1,
0.06066608, -0.1009099, 3.163651, 0, 1, 0.9176471, 1,
0.0620817, -0.2470447, 2.78665, 0, 1, 0.9215686, 1,
0.06602116, 0.617604, 0.6031273, 0, 1, 0.9294118, 1,
0.06676956, -1.929949, 3.072587, 0, 1, 0.9333333, 1,
0.06809994, 2.523073, 0.4241989, 0, 1, 0.9411765, 1,
0.07294835, -0.1768413, -0.2569025, 0, 1, 0.945098, 1,
0.07340593, -1.643985, 2.02282, 0, 1, 0.9529412, 1,
0.07349869, 1.459358, 0.003263533, 0, 1, 0.9568627, 1,
0.08075834, -0.9923747, 2.092155, 0, 1, 0.9647059, 1,
0.08081323, -0.04531446, 2.72519, 0, 1, 0.9686275, 1,
0.08363672, -0.1907657, 2.5469, 0, 1, 0.9764706, 1,
0.08428425, -1.781215, 1.985415, 0, 1, 0.9803922, 1,
0.08574328, -0.6336497, 0.6812822, 0, 1, 0.9882353, 1,
0.08638711, -0.009046972, 0.5816296, 0, 1, 0.9921569, 1,
0.08914541, -0.6488254, 2.989568, 0, 1, 1, 1,
0.09027939, -0.7608042, 2.142776, 0, 0.9921569, 1, 1,
0.09234285, -1.23135, 4.23898, 0, 0.9882353, 1, 1,
0.09704591, -1.065843, 4.896098, 0, 0.9803922, 1, 1,
0.1001596, 0.240229, 1.5292, 0, 0.9764706, 1, 1,
0.1004853, -0.1464234, 3.047297, 0, 0.9686275, 1, 1,
0.1018809, 1.000406, 0.5485746, 0, 0.9647059, 1, 1,
0.1040248, 0.2073636, 1.488891, 0, 0.9568627, 1, 1,
0.1065978, 0.5280478, 0.4313461, 0, 0.9529412, 1, 1,
0.1117066, -0.7331725, 3.585429, 0, 0.945098, 1, 1,
0.1147715, 0.8470673, 1.869807, 0, 0.9411765, 1, 1,
0.1148215, 0.3504323, 0.361796, 0, 0.9333333, 1, 1,
0.1232128, 1.093057, 0.4908142, 0, 0.9294118, 1, 1,
0.1268475, -0.455902, 1.809537, 0, 0.9215686, 1, 1,
0.1271401, -0.5068463, 2.399454, 0, 0.9176471, 1, 1,
0.1321772, -0.9637949, 3.241627, 0, 0.9098039, 1, 1,
0.1370409, 0.310154, 0.3318696, 0, 0.9058824, 1, 1,
0.1404537, -0.5721034, 3.27843, 0, 0.8980392, 1, 1,
0.1410101, -1.528938, 3.017369, 0, 0.8901961, 1, 1,
0.1411534, -0.7675741, 4.772073, 0, 0.8862745, 1, 1,
0.1414176, -2.149565, 3.089702, 0, 0.8784314, 1, 1,
0.1426697, 0.4055167, 0.621516, 0, 0.8745098, 1, 1,
0.1508467, 0.07491688, 1.473201, 0, 0.8666667, 1, 1,
0.1560364, -0.9086118, 3.639354, 0, 0.8627451, 1, 1,
0.159912, 1.129914, -1.883755, 0, 0.854902, 1, 1,
0.1608093, 1.305062, -1.295535, 0, 0.8509804, 1, 1,
0.1637778, -0.3584068, 2.513172, 0, 0.8431373, 1, 1,
0.1684039, -1.002298, 3.649617, 0, 0.8392157, 1, 1,
0.168715, -0.9062071, 4.948785, 0, 0.8313726, 1, 1,
0.173466, 1.070818, 1.059025, 0, 0.827451, 1, 1,
0.1814834, -0.2389802, 3.275257, 0, 0.8196079, 1, 1,
0.186744, 1.251583, -0.6294545, 0, 0.8156863, 1, 1,
0.1881762, -0.2499778, 1.554108, 0, 0.8078431, 1, 1,
0.1888886, 0.2485676, -1.030918, 0, 0.8039216, 1, 1,
0.1914989, -0.4766728, 2.342147, 0, 0.7960784, 1, 1,
0.2010848, -1.316156, 3.147101, 0, 0.7882353, 1, 1,
0.2016581, -0.5029824, 2.921612, 0, 0.7843137, 1, 1,
0.204271, -0.2923607, 3.20157, 0, 0.7764706, 1, 1,
0.2063286, 0.06812525, 0.7158077, 0, 0.772549, 1, 1,
0.2082584, -0.01937328, 3.677387, 0, 0.7647059, 1, 1,
0.2096792, 1.057294, 0.06118942, 0, 0.7607843, 1, 1,
0.2117669, 0.5228935, 0.9476225, 0, 0.7529412, 1, 1,
0.2126911, 0.3704286, 0.06050023, 0, 0.7490196, 1, 1,
0.2127549, 1.873157, -0.05809448, 0, 0.7411765, 1, 1,
0.2138254, -0.2137082, 1.88026, 0, 0.7372549, 1, 1,
0.2195961, -0.3188739, 4.170796, 0, 0.7294118, 1, 1,
0.2204437, 0.2147511, 3.213323, 0, 0.7254902, 1, 1,
0.2217407, 1.010357, -0.7173459, 0, 0.7176471, 1, 1,
0.2249999, -0.08579658, 2.380512, 0, 0.7137255, 1, 1,
0.226927, -0.3562045, 2.344655, 0, 0.7058824, 1, 1,
0.2300129, -1.323446, 4.113322, 0, 0.6980392, 1, 1,
0.2307164, 1.751143, 0.0212374, 0, 0.6941177, 1, 1,
0.2309953, -1.380306, 4.528641, 0, 0.6862745, 1, 1,
0.2320551, -0.6841448, 3.531346, 0, 0.682353, 1, 1,
0.2326555, 1.508131, -0.2397614, 0, 0.6745098, 1, 1,
0.2337017, 1.044856, 0.3163663, 0, 0.6705883, 1, 1,
0.2339426, -1.916289, 2.174387, 0, 0.6627451, 1, 1,
0.2385265, 0.08866419, 0.5401011, 0, 0.6588235, 1, 1,
0.2464882, 1.15678, 0.7180072, 0, 0.6509804, 1, 1,
0.2477421, 0.437197, 0.7866058, 0, 0.6470588, 1, 1,
0.2522324, -0.7917063, 4.962451, 0, 0.6392157, 1, 1,
0.2581913, -0.526042, 2.601123, 0, 0.6352941, 1, 1,
0.2649311, 1.293225, 1.345023, 0, 0.627451, 1, 1,
0.2678156, -0.7589744, 3.516189, 0, 0.6235294, 1, 1,
0.267987, -0.01350427, 1.176175, 0, 0.6156863, 1, 1,
0.2696231, 0.1047828, 1.792111, 0, 0.6117647, 1, 1,
0.2723637, 1.344913, 0.4642862, 0, 0.6039216, 1, 1,
0.2733225, 3.492295, 2.440816, 0, 0.5960785, 1, 1,
0.2750405, -0.5544256, 4.625751, 0, 0.5921569, 1, 1,
0.2755387, 0.6804132, -1.805735, 0, 0.5843138, 1, 1,
0.2780916, 0.1552458, 0.5550321, 0, 0.5803922, 1, 1,
0.2782356, -0.3332499, 3.479908, 0, 0.572549, 1, 1,
0.2790107, -0.09236442, 1.154704, 0, 0.5686275, 1, 1,
0.2806507, 0.5233367, 0.3903929, 0, 0.5607843, 1, 1,
0.2814779, 0.05866645, 0.01260112, 0, 0.5568628, 1, 1,
0.281873, 0.09432869, 1.510049, 0, 0.5490196, 1, 1,
0.2829657, 0.1744665, 1.193094, 0, 0.5450981, 1, 1,
0.2853694, 1.113295, -0.9216394, 0, 0.5372549, 1, 1,
0.2880715, -0.7359468, 1.690061, 0, 0.5333334, 1, 1,
0.2898351, -0.1447065, 3.286473, 0, 0.5254902, 1, 1,
0.2920367, -1.188657, 2.109093, 0, 0.5215687, 1, 1,
0.2927684, -0.4438515, 2.328559, 0, 0.5137255, 1, 1,
0.2984682, 0.4073513, 0.8436256, 0, 0.509804, 1, 1,
0.2995741, -0.5700625, 3.162503, 0, 0.5019608, 1, 1,
0.3040484, -0.9126253, 4.541332, 0, 0.4941176, 1, 1,
0.3044931, 0.4196759, 2.605382, 0, 0.4901961, 1, 1,
0.3048973, 0.7077837, 0.3220668, 0, 0.4823529, 1, 1,
0.3063588, 2.412086, -0.8536203, 0, 0.4784314, 1, 1,
0.3104085, -1.226009, 2.526487, 0, 0.4705882, 1, 1,
0.312831, -0.05270854, 0.8993397, 0, 0.4666667, 1, 1,
0.3133602, -1.45734, 2.558214, 0, 0.4588235, 1, 1,
0.3150685, 0.1984326, 2.933265, 0, 0.454902, 1, 1,
0.316227, -0.8233514, 3.689699, 0, 0.4470588, 1, 1,
0.3190652, 1.326442, 0.4078834, 0, 0.4431373, 1, 1,
0.3222723, 0.6919973, 1.875785, 0, 0.4352941, 1, 1,
0.3224773, -1.582018, 2.209513, 0, 0.4313726, 1, 1,
0.3249358, 0.8695406, 0.1788989, 0, 0.4235294, 1, 1,
0.3280807, 0.05187064, 0.6082264, 0, 0.4196078, 1, 1,
0.3285869, -0.6046813, 2.276399, 0, 0.4117647, 1, 1,
0.3310302, 0.5532047, -2.191873, 0, 0.4078431, 1, 1,
0.3343452, 0.4717779, 0.7611299, 0, 0.4, 1, 1,
0.3357151, -0.06906664, 1.736359, 0, 0.3921569, 1, 1,
0.3372226, 1.253099, 2.615424, 0, 0.3882353, 1, 1,
0.3380128, 0.175879, 2.805166, 0, 0.3803922, 1, 1,
0.3399601, -0.117306, 3.696232, 0, 0.3764706, 1, 1,
0.3409739, -0.8543234, 3.309419, 0, 0.3686275, 1, 1,
0.3426471, -0.1420255, 2.020823, 0, 0.3647059, 1, 1,
0.3438648, 2.015945, 1.016684, 0, 0.3568628, 1, 1,
0.3509997, 1.397849, -2.437566, 0, 0.3529412, 1, 1,
0.353861, 2.009814, -0.9145638, 0, 0.345098, 1, 1,
0.3547781, -1.315136, 2.896998, 0, 0.3411765, 1, 1,
0.3552053, 1.458347, 0.4758607, 0, 0.3333333, 1, 1,
0.3593268, 0.4446894, -1.274931, 0, 0.3294118, 1, 1,
0.3598128, -0.9795385, 4.257345, 0, 0.3215686, 1, 1,
0.3614188, 0.08644011, 1.817704, 0, 0.3176471, 1, 1,
0.3624188, 1.411094, -0.2942678, 0, 0.3098039, 1, 1,
0.3632178, 0.3088683, 0.1955042, 0, 0.3058824, 1, 1,
0.3638389, 0.3581524, 4.291621, 0, 0.2980392, 1, 1,
0.3649058, -1.253829, 2.384434, 0, 0.2901961, 1, 1,
0.3672784, 0.7986292, 1.462098, 0, 0.2862745, 1, 1,
0.3683735, 0.04528862, 2.676756, 0, 0.2784314, 1, 1,
0.3734624, 0.9854509, 1.32933, 0, 0.2745098, 1, 1,
0.3751012, -0.3811987, 3.123461, 0, 0.2666667, 1, 1,
0.3755279, -1.415813, 1.493959, 0, 0.2627451, 1, 1,
0.3781435, -0.4296486, 2.359591, 0, 0.254902, 1, 1,
0.37938, 0.5874918, -0.6378525, 0, 0.2509804, 1, 1,
0.3807599, -0.4906954, 3.211589, 0, 0.2431373, 1, 1,
0.3923142, 0.3795803, 0.4600854, 0, 0.2392157, 1, 1,
0.3952889, -2.125898, 1.405131, 0, 0.2313726, 1, 1,
0.398096, -1.005592, 1.745284, 0, 0.227451, 1, 1,
0.3982242, -0.2276046, 2.185046, 0, 0.2196078, 1, 1,
0.3988034, 0.7497666, 0.9408176, 0, 0.2156863, 1, 1,
0.3996696, -2.662543, 2.376553, 0, 0.2078431, 1, 1,
0.4085264, 0.1841612, 1.821538, 0, 0.2039216, 1, 1,
0.4098322, -0.7471306, 3.791164, 0, 0.1960784, 1, 1,
0.409834, 0.9450746, 1.497361, 0, 0.1882353, 1, 1,
0.4151106, -0.9263112, 3.681781, 0, 0.1843137, 1, 1,
0.4198601, -0.377616, 2.592464, 0, 0.1764706, 1, 1,
0.4213859, -0.6571264, 1.970378, 0, 0.172549, 1, 1,
0.4214954, -1.314877, 2.662074, 0, 0.1647059, 1, 1,
0.4215925, 1.382034, 1.267987, 0, 0.1607843, 1, 1,
0.4236593, -1.217437, 3.706901, 0, 0.1529412, 1, 1,
0.424786, 0.4124965, -0.02360878, 0, 0.1490196, 1, 1,
0.4285218, 0.01185154, 0.893112, 0, 0.1411765, 1, 1,
0.4297119, 0.7427137, 1.254326, 0, 0.1372549, 1, 1,
0.4299632, 0.7781522, -0.6446051, 0, 0.1294118, 1, 1,
0.4300663, 1.275979, -0.2417239, 0, 0.1254902, 1, 1,
0.4302978, -1.233091, 2.370969, 0, 0.1176471, 1, 1,
0.4327457, 1.837056, -0.2422149, 0, 0.1137255, 1, 1,
0.4341746, 0.9147686, 0.4061824, 0, 0.1058824, 1, 1,
0.434624, 0.5908272, 0.9799595, 0, 0.09803922, 1, 1,
0.4364365, -0.9175944, 1.53582, 0, 0.09411765, 1, 1,
0.4374252, -0.004915319, 1.712793, 0, 0.08627451, 1, 1,
0.4380586, 0.4981964, 1.626367, 0, 0.08235294, 1, 1,
0.4397424, 0.9103163, 2.298347, 0, 0.07450981, 1, 1,
0.4397995, -0.7533466, 3.902569, 0, 0.07058824, 1, 1,
0.4420666, 0.3463066, -0.2910979, 0, 0.0627451, 1, 1,
0.4448214, -0.7881975, 2.311549, 0, 0.05882353, 1, 1,
0.4448531, -0.4845355, 3.128836, 0, 0.05098039, 1, 1,
0.4454038, 0.001399662, 0.4434927, 0, 0.04705882, 1, 1,
0.4503593, 0.09115288, -0.01753689, 0, 0.03921569, 1, 1,
0.4520358, -1.353747, 1.440918, 0, 0.03529412, 1, 1,
0.452916, 0.02528664, 1.706663, 0, 0.02745098, 1, 1,
0.4563894, 0.2553378, 0.9335088, 0, 0.02352941, 1, 1,
0.4603694, 0.9270207, 2.853135, 0, 0.01568628, 1, 1,
0.4606382, 0.4622179, 1.067415, 0, 0.01176471, 1, 1,
0.4689746, 0.2536592, 0.1144077, 0, 0.003921569, 1, 1,
0.4710071, 0.4631152, 1.087392, 0.003921569, 0, 1, 1,
0.4785164, 1.535891, -0.4515215, 0.007843138, 0, 1, 1,
0.4801865, 0.8836126, 1.706734, 0.01568628, 0, 1, 1,
0.4883797, -0.6287447, 2.403519, 0.01960784, 0, 1, 1,
0.4901223, -0.00678442, 1.945622, 0.02745098, 0, 1, 1,
0.4930966, -1.031915, 5.269277, 0.03137255, 0, 1, 1,
0.4937521, 0.7222538, -0.114107, 0.03921569, 0, 1, 1,
0.4977989, -0.3805867, 2.524326, 0.04313726, 0, 1, 1,
0.5027167, -0.4076539, 0.9925851, 0.05098039, 0, 1, 1,
0.5053563, 0.2736081, 0.239497, 0.05490196, 0, 1, 1,
0.506656, -2.55209, 3.243437, 0.0627451, 0, 1, 1,
0.5075724, 0.03459861, 0.7379236, 0.06666667, 0, 1, 1,
0.5123092, -0.7114435, 2.935, 0.07450981, 0, 1, 1,
0.5125257, 0.6168957, 0.9545865, 0.07843138, 0, 1, 1,
0.5137771, 0.2060229, 1.213185, 0.08627451, 0, 1, 1,
0.5151392, -0.3328623, 2.222659, 0.09019608, 0, 1, 1,
0.516812, 0.5052004, 1.817404, 0.09803922, 0, 1, 1,
0.5204208, -1.943141, 4.709191, 0.1058824, 0, 1, 1,
0.5204515, -0.5493288, 2.455729, 0.1098039, 0, 1, 1,
0.5209388, -1.401358, 0.7637222, 0.1176471, 0, 1, 1,
0.5210584, -0.4080687, 1.81793, 0.1215686, 0, 1, 1,
0.5221561, -0.9738777, 2.752071, 0.1294118, 0, 1, 1,
0.5226684, 0.4361223, -0.7353407, 0.1333333, 0, 1, 1,
0.5319628, 0.2849437, 1.642218, 0.1411765, 0, 1, 1,
0.5361598, -0.773788, 1.632599, 0.145098, 0, 1, 1,
0.5408393, 1.220583, 1.897562, 0.1529412, 0, 1, 1,
0.5440918, -1.111789, 2.015605, 0.1568628, 0, 1, 1,
0.5453087, 0.3209774, 2.371469, 0.1647059, 0, 1, 1,
0.5457521, 0.0105811, 2.383599, 0.1686275, 0, 1, 1,
0.5475449, 1.130091, 2.079459, 0.1764706, 0, 1, 1,
0.5487257, -0.5654009, 2.554034, 0.1803922, 0, 1, 1,
0.5510483, -0.5584557, 1.968829, 0.1882353, 0, 1, 1,
0.5567255, 0.4380399, 0.5517864, 0.1921569, 0, 1, 1,
0.5600755, -0.310158, 0.9564492, 0.2, 0, 1, 1,
0.5602793, -0.07409871, 0.4699579, 0.2078431, 0, 1, 1,
0.5605912, -1.144059, 4.366661, 0.2117647, 0, 1, 1,
0.5622039, -0.2612408, 3.846052, 0.2196078, 0, 1, 1,
0.5644881, -0.5103864, 1.995511, 0.2235294, 0, 1, 1,
0.5689355, -2.526544, 2.360516, 0.2313726, 0, 1, 1,
0.5727745, -1.19304, 1.031634, 0.2352941, 0, 1, 1,
0.5731493, -1.679368, 4.776683, 0.2431373, 0, 1, 1,
0.5773566, -0.3809387, 3.38279, 0.2470588, 0, 1, 1,
0.5823432, -1.010437, 0.7707784, 0.254902, 0, 1, 1,
0.5848642, -0.7641013, 3.570318, 0.2588235, 0, 1, 1,
0.5849305, -2.066286, 3.998454, 0.2666667, 0, 1, 1,
0.5850497, -1.473469, 1.956404, 0.2705882, 0, 1, 1,
0.5851581, -1.648003, 3.583751, 0.2784314, 0, 1, 1,
0.5856771, -1.544628, 3.360509, 0.282353, 0, 1, 1,
0.5894495, -1.245199, 2.586742, 0.2901961, 0, 1, 1,
0.5910267, -0.1757908, 2.951074, 0.2941177, 0, 1, 1,
0.5981944, -1.965894, 3.419093, 0.3019608, 0, 1, 1,
0.6011158, 1.015772, 0.4852647, 0.3098039, 0, 1, 1,
0.6071534, -0.3633589, 1.147253, 0.3137255, 0, 1, 1,
0.6091341, -0.2479979, 1.539858, 0.3215686, 0, 1, 1,
0.6096782, -0.08551194, 1.601369, 0.3254902, 0, 1, 1,
0.6107482, -0.4481488, 1.142132, 0.3333333, 0, 1, 1,
0.611753, -1.398013, 2.319434, 0.3372549, 0, 1, 1,
0.614948, 1.36487, 1.172595, 0.345098, 0, 1, 1,
0.6152193, -1.167173, 2.77735, 0.3490196, 0, 1, 1,
0.6169304, -0.1997024, 2.890144, 0.3568628, 0, 1, 1,
0.6192643, -2.518741, 2.854419, 0.3607843, 0, 1, 1,
0.6194642, -2.236572, 2.934456, 0.3686275, 0, 1, 1,
0.6284109, 0.08871471, 2.040301, 0.372549, 0, 1, 1,
0.6295965, -1.098565, 1.57978, 0.3803922, 0, 1, 1,
0.6331111, 0.8449804, 0.03910818, 0.3843137, 0, 1, 1,
0.6410645, 1.518785, 0.8730679, 0.3921569, 0, 1, 1,
0.6465932, -0.3808489, 2.651733, 0.3960784, 0, 1, 1,
0.6480968, 0.887832, 1.52757, 0.4039216, 0, 1, 1,
0.6535335, -1.130389, 1.626748, 0.4117647, 0, 1, 1,
0.6549136, -0.4601288, 0.5669886, 0.4156863, 0, 1, 1,
0.6551327, -0.7723696, 2.424102, 0.4235294, 0, 1, 1,
0.6554978, -0.2479403, 2.020088, 0.427451, 0, 1, 1,
0.6620554, 1.774801, -0.2124795, 0.4352941, 0, 1, 1,
0.6634073, 1.753163, -0.9481319, 0.4392157, 0, 1, 1,
0.6650033, -0.07646884, 2.740386, 0.4470588, 0, 1, 1,
0.669241, -0.2071714, 2.884079, 0.4509804, 0, 1, 1,
0.6693625, 1.837398, -1.371142, 0.4588235, 0, 1, 1,
0.6696137, -0.5252917, 1.288823, 0.4627451, 0, 1, 1,
0.671532, -0.1329605, 0.9509909, 0.4705882, 0, 1, 1,
0.6725133, 0.008075677, 1.698532, 0.4745098, 0, 1, 1,
0.6732532, -1.810309, 5.959619, 0.4823529, 0, 1, 1,
0.6746408, 0.985343, -0.8804286, 0.4862745, 0, 1, 1,
0.6771041, -1.428012, 2.573697, 0.4941176, 0, 1, 1,
0.6810625, -1.325143, 2.142489, 0.5019608, 0, 1, 1,
0.681304, 1.41459, 1.036544, 0.5058824, 0, 1, 1,
0.682061, 1.115374, 0.9672139, 0.5137255, 0, 1, 1,
0.6829505, 0.9068704, 3.171043, 0.5176471, 0, 1, 1,
0.6890622, -0.001518705, 3.394992, 0.5254902, 0, 1, 1,
0.6897163, -0.9576705, 4.089642, 0.5294118, 0, 1, 1,
0.6930249, 0.819717, -0.2391026, 0.5372549, 0, 1, 1,
0.6980433, -0.2416397, 1.370036, 0.5411765, 0, 1, 1,
0.7040635, 0.4551664, -0.6544346, 0.5490196, 0, 1, 1,
0.7256793, 0.7238153, 2.310491, 0.5529412, 0, 1, 1,
0.7374302, 0.07494764, 1.240194, 0.5607843, 0, 1, 1,
0.7425777, -0.8251957, 2.292368, 0.5647059, 0, 1, 1,
0.7444395, -0.8473679, 1.389783, 0.572549, 0, 1, 1,
0.7489163, -0.02314041, 0.1382147, 0.5764706, 0, 1, 1,
0.7561179, 1.618831, 1.646491, 0.5843138, 0, 1, 1,
0.7567254, 1.342977, 0.584632, 0.5882353, 0, 1, 1,
0.7594358, -1.389959, 1.099206, 0.5960785, 0, 1, 1,
0.7640683, -0.2460468, 1.866377, 0.6039216, 0, 1, 1,
0.7657968, -0.1675101, 1.977686, 0.6078432, 0, 1, 1,
0.7688903, 0.07678986, 1.442154, 0.6156863, 0, 1, 1,
0.7752082, -2.712052, 4.127456, 0.6196079, 0, 1, 1,
0.77571, -1.772454, 2.165143, 0.627451, 0, 1, 1,
0.7764633, 0.0493302, 2.768808, 0.6313726, 0, 1, 1,
0.7772911, 0.001796033, -0.1090868, 0.6392157, 0, 1, 1,
0.7897335, -0.1483093, 2.226632, 0.6431373, 0, 1, 1,
0.7906882, -0.02431954, 2.499634, 0.6509804, 0, 1, 1,
0.7970421, 1.089291, 1.177951, 0.654902, 0, 1, 1,
0.7999185, -1.488078, 3.947402, 0.6627451, 0, 1, 1,
0.8014806, -0.5123143, 2.349284, 0.6666667, 0, 1, 1,
0.8028952, -0.08148517, 0.6271885, 0.6745098, 0, 1, 1,
0.8044283, 0.1826265, 2.779792, 0.6784314, 0, 1, 1,
0.8055742, 0.2013878, 2.272099, 0.6862745, 0, 1, 1,
0.8107454, 1.234664, 1.440357, 0.6901961, 0, 1, 1,
0.8144375, -1.299829, 2.34927, 0.6980392, 0, 1, 1,
0.8150792, -2.337682, 2.242549, 0.7058824, 0, 1, 1,
0.8205694, -1.471594, 2.052061, 0.7098039, 0, 1, 1,
0.8261787, 0.427396, 0.4789193, 0.7176471, 0, 1, 1,
0.8268141, -0.7234994, 3.175335, 0.7215686, 0, 1, 1,
0.8299184, 0.8453383, 0.1114836, 0.7294118, 0, 1, 1,
0.832127, 0.8893527, 1.522081, 0.7333333, 0, 1, 1,
0.8435982, 1.106992, 2.742862, 0.7411765, 0, 1, 1,
0.8436074, 0.737576, 1.678095, 0.7450981, 0, 1, 1,
0.8452326, 0.5285247, 2.35063, 0.7529412, 0, 1, 1,
0.85403, -0.4048382, 1.742491, 0.7568628, 0, 1, 1,
0.8543368, -0.1960251, 1.230403, 0.7647059, 0, 1, 1,
0.8670272, -1.873956, 1.374549, 0.7686275, 0, 1, 1,
0.8670693, 1.497732, 0.4537427, 0.7764706, 0, 1, 1,
0.8724723, 2.481384, 1.177163, 0.7803922, 0, 1, 1,
0.8885223, 0.3331778, 0.7125389, 0.7882353, 0, 1, 1,
0.8886158, 0.4263321, 1.701258, 0.7921569, 0, 1, 1,
0.8890678, 0.3481975, -0.580407, 0.8, 0, 1, 1,
0.8929541, -1.00073, 2.910114, 0.8078431, 0, 1, 1,
0.8973779, -0.8085606, 1.738829, 0.8117647, 0, 1, 1,
0.8979016, -0.667483, 1.804961, 0.8196079, 0, 1, 1,
0.8979555, -0.1012871, 1.91286, 0.8235294, 0, 1, 1,
0.8998179, -1.117642, 1.945393, 0.8313726, 0, 1, 1,
0.9095511, -0.122841, 1.624741, 0.8352941, 0, 1, 1,
0.914165, 0.6011214, 0.3769463, 0.8431373, 0, 1, 1,
0.9144706, 0.0203512, 2.019157, 0.8470588, 0, 1, 1,
0.9166785, 1.579833, -1.268165, 0.854902, 0, 1, 1,
0.9210167, 0.6129813, 2.049902, 0.8588235, 0, 1, 1,
0.9254586, 0.4937824, 1.12414, 0.8666667, 0, 1, 1,
0.9292655, -0.3338996, 2.626053, 0.8705882, 0, 1, 1,
0.9333737, 0.4057495, 1.123282, 0.8784314, 0, 1, 1,
0.9373823, -1.787666, 1.934163, 0.8823529, 0, 1, 1,
0.9383888, 1.303118, 0.58978, 0.8901961, 0, 1, 1,
0.9387962, 0.5708923, 1.460969, 0.8941177, 0, 1, 1,
0.9498128, -1.414889, 1.968179, 0.9019608, 0, 1, 1,
0.9521543, 1.212304, 1.672935, 0.9098039, 0, 1, 1,
0.959255, 0.7203675, 1.465438, 0.9137255, 0, 1, 1,
0.9634324, -0.01082703, 2.345398, 0.9215686, 0, 1, 1,
0.9644414, -0.7193415, 1.930323, 0.9254902, 0, 1, 1,
0.9651856, 0.1446209, 0.8030456, 0.9333333, 0, 1, 1,
0.9834779, 1.21118, 0.5716515, 0.9372549, 0, 1, 1,
0.985267, 0.3570814, 0.4593636, 0.945098, 0, 1, 1,
0.987659, 1.258242, 0.09725182, 0.9490196, 0, 1, 1,
0.9890288, -0.4938888, 2.704238, 0.9568627, 0, 1, 1,
0.992781, -0.08554975, 1.872728, 0.9607843, 0, 1, 1,
0.9931962, 0.2535035, 0.4866323, 0.9686275, 0, 1, 1,
0.9970502, 0.8676824, 0.749589, 0.972549, 0, 1, 1,
0.9979995, -0.6874363, 1.192693, 0.9803922, 0, 1, 1,
0.9988542, 0.1792759, 1.915004, 0.9843137, 0, 1, 1,
1.000657, 0.1400104, 1.933659, 0.9921569, 0, 1, 1,
1.005159, 0.5756104, 2.866023, 0.9960784, 0, 1, 1,
1.009128, -1.46758, 1.6416, 1, 0, 0.9960784, 1,
1.010692, -0.5642473, 1.966959, 1, 0, 0.9882353, 1,
1.012778, 0.4633319, 1.869182, 1, 0, 0.9843137, 1,
1.015595, -1.277822, 2.365175, 1, 0, 0.9764706, 1,
1.017695, -1.597984, 0.07116102, 1, 0, 0.972549, 1,
1.021498, 0.6094592, 2.985789, 1, 0, 0.9647059, 1,
1.025566, -1.143091, 2.354021, 1, 0, 0.9607843, 1,
1.026571, 1.749438, 2.775965, 1, 0, 0.9529412, 1,
1.028356, 2.261332, 1.281829, 1, 0, 0.9490196, 1,
1.031095, -0.2621304, -0.5949161, 1, 0, 0.9411765, 1,
1.031839, -2.574876, 0.965264, 1, 0, 0.9372549, 1,
1.032735, -1.180543, 2.481025, 1, 0, 0.9294118, 1,
1.034362, -0.3208453, 1.989493, 1, 0, 0.9254902, 1,
1.034765, -0.7729647, 1.473669, 1, 0, 0.9176471, 1,
1.036943, 0.7495506, 0.2795105, 1, 0, 0.9137255, 1,
1.043007, -0.3655134, 1.385354, 1, 0, 0.9058824, 1,
1.044417, -1.047219, 2.383677, 1, 0, 0.9019608, 1,
1.046257, 1.528211, 1.471372, 1, 0, 0.8941177, 1,
1.06021, 1.980412, 1.834372, 1, 0, 0.8862745, 1,
1.060485, 0.3071092, 1.179902, 1, 0, 0.8823529, 1,
1.069008, 1.547983, 0.3745896, 1, 0, 0.8745098, 1,
1.091532, -0.5199025, 2.396292, 1, 0, 0.8705882, 1,
1.096531, 0.9462662, 1.708713, 1, 0, 0.8627451, 1,
1.097745, -0.9366299, 3.437886, 1, 0, 0.8588235, 1,
1.100812, 0.6010563, 1.710383, 1, 0, 0.8509804, 1,
1.101349, -0.3868196, 1.084664, 1, 0, 0.8470588, 1,
1.104904, 1.031146, 1.762274, 1, 0, 0.8392157, 1,
1.105182, -0.6230185, 3.260821, 1, 0, 0.8352941, 1,
1.108039, -0.8018811, 0.8987837, 1, 0, 0.827451, 1,
1.110534, -0.465648, 1.031489, 1, 0, 0.8235294, 1,
1.117464, 0.2514952, 2.279761, 1, 0, 0.8156863, 1,
1.118625, 0.7249763, 1.591882, 1, 0, 0.8117647, 1,
1.136118, 0.02949302, 0.6640806, 1, 0, 0.8039216, 1,
1.13619, 0.3058788, -0.4462129, 1, 0, 0.7960784, 1,
1.140796, -1.036662, -0.3659909, 1, 0, 0.7921569, 1,
1.14622, -0.6267695, 2.148925, 1, 0, 0.7843137, 1,
1.155812, 2.051482, 0.1617923, 1, 0, 0.7803922, 1,
1.160849, 0.3604618, 1.8158, 1, 0, 0.772549, 1,
1.166236, 1.52868, 0.7406279, 1, 0, 0.7686275, 1,
1.166499, -0.2111723, 2.730512, 1, 0, 0.7607843, 1,
1.170934, 0.02720611, 1.411239, 1, 0, 0.7568628, 1,
1.174926, 0.1716747, 2.236977, 1, 0, 0.7490196, 1,
1.176372, -1.936697, 3.44051, 1, 0, 0.7450981, 1,
1.18029, -0.806658, 3.095313, 1, 0, 0.7372549, 1,
1.183566, 0.6615337, 2.272239, 1, 0, 0.7333333, 1,
1.184576, -0.4108389, 2.979065, 1, 0, 0.7254902, 1,
1.194319, 0.5884744, -0.845751, 1, 0, 0.7215686, 1,
1.220234, -0.9799458, 3.013155, 1, 0, 0.7137255, 1,
1.225181, 0.1139668, 2.816416, 1, 0, 0.7098039, 1,
1.231611, 0.9124362, 0.5662058, 1, 0, 0.7019608, 1,
1.23745, 0.9215556, 2.317873, 1, 0, 0.6941177, 1,
1.247078, 1.142051, 0.9520085, 1, 0, 0.6901961, 1,
1.253828, 0.5079994, 0.5669837, 1, 0, 0.682353, 1,
1.258966, -0.5022967, 1.928065, 1, 0, 0.6784314, 1,
1.259981, -1.348769, 2.838238, 1, 0, 0.6705883, 1,
1.26043, 0.6486789, 3.183951, 1, 0, 0.6666667, 1,
1.265168, -0.01684681, 1.413101, 1, 0, 0.6588235, 1,
1.273459, 0.01524108, 1.521749, 1, 0, 0.654902, 1,
1.281469, -0.3620182, 2.750622, 1, 0, 0.6470588, 1,
1.28372, 0.764458, -0.04628685, 1, 0, 0.6431373, 1,
1.289111, 1.905363, 1.526243, 1, 0, 0.6352941, 1,
1.294065, -0.7068923, 1.19765, 1, 0, 0.6313726, 1,
1.297668, 0.5212526, 1.546598, 1, 0, 0.6235294, 1,
1.304522, 1.4475, 1.755607, 1, 0, 0.6196079, 1,
1.305354, -0.6810908, 2.298441, 1, 0, 0.6117647, 1,
1.313235, 1.777594, 0.4586964, 1, 0, 0.6078432, 1,
1.313467, -1.476906, 2.508737, 1, 0, 0.6, 1,
1.313771, -0.2692552, 1.486687, 1, 0, 0.5921569, 1,
1.317021, -1.157979, 3.922608, 1, 0, 0.5882353, 1,
1.32838, 0.934495, 2.91774, 1, 0, 0.5803922, 1,
1.329619, -0.01500184, 1.010185, 1, 0, 0.5764706, 1,
1.353875, 0.8252253, 0.005990117, 1, 0, 0.5686275, 1,
1.357374, -1.946423, 2.940304, 1, 0, 0.5647059, 1,
1.361465, -0.448547, 3.310571, 1, 0, 0.5568628, 1,
1.361581, -0.7087157, 0.5562752, 1, 0, 0.5529412, 1,
1.371343, 1.035945, -1.135074, 1, 0, 0.5450981, 1,
1.371986, -0.3439577, 1.851971, 1, 0, 0.5411765, 1,
1.376968, 0.5550904, 0.2389877, 1, 0, 0.5333334, 1,
1.383393, -0.6874009, 3.285505, 1, 0, 0.5294118, 1,
1.387468, -0.4018977, 1.166388, 1, 0, 0.5215687, 1,
1.397387, 0.8141382, 0.5315834, 1, 0, 0.5176471, 1,
1.400121, -0.114345, 0.1192093, 1, 0, 0.509804, 1,
1.400643, -0.8637673, 2.732538, 1, 0, 0.5058824, 1,
1.427982, -0.330566, 0.4886569, 1, 0, 0.4980392, 1,
1.428756, 0.4147016, 1.102764, 1, 0, 0.4901961, 1,
1.430759, 0.5853927, 1.449813, 1, 0, 0.4862745, 1,
1.437678, 0.4971505, 1.146624, 1, 0, 0.4784314, 1,
1.437983, -1.053263, 3.46802, 1, 0, 0.4745098, 1,
1.440948, 0.9510037, 1.262288, 1, 0, 0.4666667, 1,
1.441352, 1.992322, 1.376636, 1, 0, 0.4627451, 1,
1.441887, -1.230385, 1.500751, 1, 0, 0.454902, 1,
1.451423, -1.829054, 3.649485, 1, 0, 0.4509804, 1,
1.453058, 0.3302273, 1.671953, 1, 0, 0.4431373, 1,
1.456335, -0.443953, 3.244734, 1, 0, 0.4392157, 1,
1.459232, -1.119235, 1.515359, 1, 0, 0.4313726, 1,
1.478709, -0.2468509, 2.339732, 1, 0, 0.427451, 1,
1.483197, -0.261252, 1.57123, 1, 0, 0.4196078, 1,
1.497497, -1.07009, 2.042134, 1, 0, 0.4156863, 1,
1.511627, -0.7609096, 2.170242, 1, 0, 0.4078431, 1,
1.519318, 0.5472088, 0.1174254, 1, 0, 0.4039216, 1,
1.52031, -0.186701, 1.273997, 1, 0, 0.3960784, 1,
1.524823, 0.7647174, 1.379987, 1, 0, 0.3882353, 1,
1.534853, 1.617209, -0.8610153, 1, 0, 0.3843137, 1,
1.547572, 0.4723372, 1.00701, 1, 0, 0.3764706, 1,
1.55788, -0.1196814, 2.732003, 1, 0, 0.372549, 1,
1.563274, 1.127176, -0.2099859, 1, 0, 0.3647059, 1,
1.566802, 1.644485, 0.08432072, 1, 0, 0.3607843, 1,
1.57783, 0.2672023, 2.606573, 1, 0, 0.3529412, 1,
1.590927, 0.6776227, 2.629358, 1, 0, 0.3490196, 1,
1.604496, -0.6267471, 2.087258, 1, 0, 0.3411765, 1,
1.607434, 1.278015, 0.9034547, 1, 0, 0.3372549, 1,
1.611173, -0.5308111, 1.163965, 1, 0, 0.3294118, 1,
1.642786, 0.5218689, 0.7868401, 1, 0, 0.3254902, 1,
1.643017, 1.022284, 0.2259298, 1, 0, 0.3176471, 1,
1.647922, 1.665511, -0.4010249, 1, 0, 0.3137255, 1,
1.658885, 1.507007, -0.5065924, 1, 0, 0.3058824, 1,
1.660534, -1.285328, 0.9873784, 1, 0, 0.2980392, 1,
1.678263, 0.8219822, 1.26914, 1, 0, 0.2941177, 1,
1.687515, 0.132884, -1.613207, 1, 0, 0.2862745, 1,
1.69633, -0.01711421, 0.8665106, 1, 0, 0.282353, 1,
1.715258, -0.3857616, 1.92452, 1, 0, 0.2745098, 1,
1.71816, -0.3806598, 1.040244, 1, 0, 0.2705882, 1,
1.721226, 1.289304, 0.5377268, 1, 0, 0.2627451, 1,
1.723019, 0.09833477, 1.431103, 1, 0, 0.2588235, 1,
1.74944, -0.4942668, 1.755894, 1, 0, 0.2509804, 1,
1.776793, 1.741895, 1.047864, 1, 0, 0.2470588, 1,
1.78495, -0.2384509, 2.261285, 1, 0, 0.2392157, 1,
1.800016, -1.356996, 2.292397, 1, 0, 0.2352941, 1,
1.811392, -1.282263, 0.8603672, 1, 0, 0.227451, 1,
1.812372, -1.79044, 1.965169, 1, 0, 0.2235294, 1,
1.815588, 0.9772878, 0.3698904, 1, 0, 0.2156863, 1,
1.835028, -0.5251726, 2.883294, 1, 0, 0.2117647, 1,
1.837004, -0.7451574, 2.150184, 1, 0, 0.2039216, 1,
1.854312, 1.025706, 1.704442, 1, 0, 0.1960784, 1,
1.889753, 0.646235, 3.764056, 1, 0, 0.1921569, 1,
1.900401, -1.218599, 2.192458, 1, 0, 0.1843137, 1,
1.93475, 0.8502154, 2.436743, 1, 0, 0.1803922, 1,
1.967209, 0.4750162, 2.335033, 1, 0, 0.172549, 1,
1.971958, -1.460278, 2.989128, 1, 0, 0.1686275, 1,
1.972737, 0.1009713, 2.260484, 1, 0, 0.1607843, 1,
1.976563, 0.9061239, 0.504793, 1, 0, 0.1568628, 1,
1.981824, -1.419381, 1.941599, 1, 0, 0.1490196, 1,
1.99231, 1.975271, 1.072446, 1, 0, 0.145098, 1,
2.026403, 0.7902088, 1.304498, 1, 0, 0.1372549, 1,
2.035615, -0.9420618, 2.267366, 1, 0, 0.1333333, 1,
2.101046, 0.420869, -0.2758977, 1, 0, 0.1254902, 1,
2.105259, 0.2186594, 2.644479, 1, 0, 0.1215686, 1,
2.171007, 0.7978647, 1.15502, 1, 0, 0.1137255, 1,
2.222787, 1.415902, 2.3521, 1, 0, 0.1098039, 1,
2.224443, -0.4254632, 0.3759924, 1, 0, 0.1019608, 1,
2.227857, 0.4129134, 0.1901762, 1, 0, 0.09411765, 1,
2.228361, -1.051879, 3.172066, 1, 0, 0.09019608, 1,
2.233751, 0.2298663, 1.10457, 1, 0, 0.08235294, 1,
2.242697, -1.348254, 1.463084, 1, 0, 0.07843138, 1,
2.252342, 2.489591, 1.309069, 1, 0, 0.07058824, 1,
2.277584, 0.9795988, -0.1168677, 1, 0, 0.06666667, 1,
2.302358, 0.466322, 2.527267, 1, 0, 0.05882353, 1,
2.341993, 1.385361, 0.1431143, 1, 0, 0.05490196, 1,
2.36287, 0.6370173, 2.89506, 1, 0, 0.04705882, 1,
2.440104, 0.4295003, 1.226446, 1, 0, 0.04313726, 1,
2.442486, 1.067809, -0.6636049, 1, 0, 0.03529412, 1,
2.450922, -2.314917, 1.527881, 1, 0, 0.03137255, 1,
2.633894, 0.7599946, 1.893738, 1, 0, 0.02352941, 1,
2.679737, 0.04107548, 1.39985, 1, 0, 0.01960784, 1,
2.875071, 0.05871138, 0.6154048, 1, 0, 0.01176471, 1,
2.933294, -0.01434345, 3.086534, 1, 0, 0.007843138, 1
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
-0.3741804, -4.76626, -6.554152, 0, -0.5, 0.5, 0.5,
-0.3741804, -4.76626, -6.554152, 1, -0.5, 0.5, 0.5,
-0.3741804, -4.76626, -6.554152, 1, 1.5, 0.5, 0.5,
-0.3741804, -4.76626, -6.554152, 0, 1.5, 0.5, 0.5
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
-4.802888, -0.03851068, -6.554152, 0, -0.5, 0.5, 0.5,
-4.802888, -0.03851068, -6.554152, 1, -0.5, 0.5, 0.5,
-4.802888, -0.03851068, -6.554152, 1, 1.5, 0.5, 0.5,
-4.802888, -0.03851068, -6.554152, 0, 1.5, 0.5, 0.5
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
-4.802888, -4.76626, 0.6095674, 0, -0.5, 0.5, 0.5,
-4.802888, -4.76626, 0.6095674, 1, -0.5, 0.5, 0.5,
-4.802888, -4.76626, 0.6095674, 1, 1.5, 0.5, 0.5,
-4.802888, -4.76626, 0.6095674, 0, 1.5, 0.5, 0.5
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
-3, -3.675241, -4.900986,
2, -3.675241, -4.900986,
-3, -3.675241, -4.900986,
-3, -3.857077, -5.176514,
-2, -3.675241, -4.900986,
-2, -3.857077, -5.176514,
-1, -3.675241, -4.900986,
-1, -3.857077, -5.176514,
0, -3.675241, -4.900986,
0, -3.857077, -5.176514,
1, -3.675241, -4.900986,
1, -3.857077, -5.176514,
2, -3.675241, -4.900986,
2, -3.857077, -5.176514
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
-3, -4.22075, -5.727569, 0, -0.5, 0.5, 0.5,
-3, -4.22075, -5.727569, 1, -0.5, 0.5, 0.5,
-3, -4.22075, -5.727569, 1, 1.5, 0.5, 0.5,
-3, -4.22075, -5.727569, 0, 1.5, 0.5, 0.5,
-2, -4.22075, -5.727569, 0, -0.5, 0.5, 0.5,
-2, -4.22075, -5.727569, 1, -0.5, 0.5, 0.5,
-2, -4.22075, -5.727569, 1, 1.5, 0.5, 0.5,
-2, -4.22075, -5.727569, 0, 1.5, 0.5, 0.5,
-1, -4.22075, -5.727569, 0, -0.5, 0.5, 0.5,
-1, -4.22075, -5.727569, 1, -0.5, 0.5, 0.5,
-1, -4.22075, -5.727569, 1, 1.5, 0.5, 0.5,
-1, -4.22075, -5.727569, 0, 1.5, 0.5, 0.5,
0, -4.22075, -5.727569, 0, -0.5, 0.5, 0.5,
0, -4.22075, -5.727569, 1, -0.5, 0.5, 0.5,
0, -4.22075, -5.727569, 1, 1.5, 0.5, 0.5,
0, -4.22075, -5.727569, 0, 1.5, 0.5, 0.5,
1, -4.22075, -5.727569, 0, -0.5, 0.5, 0.5,
1, -4.22075, -5.727569, 1, -0.5, 0.5, 0.5,
1, -4.22075, -5.727569, 1, 1.5, 0.5, 0.5,
1, -4.22075, -5.727569, 0, 1.5, 0.5, 0.5,
2, -4.22075, -5.727569, 0, -0.5, 0.5, 0.5,
2, -4.22075, -5.727569, 1, -0.5, 0.5, 0.5,
2, -4.22075, -5.727569, 1, 1.5, 0.5, 0.5,
2, -4.22075, -5.727569, 0, 1.5, 0.5, 0.5
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
-3.780879, -2, -4.900986,
-3.780879, 2, -4.900986,
-3.780879, -2, -4.900986,
-3.951214, -2, -5.176514,
-3.780879, 0, -4.900986,
-3.951214, 0, -5.176514,
-3.780879, 2, -4.900986,
-3.951214, 2, -5.176514
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
-4.291883, -2, -5.727569, 0, -0.5, 0.5, 0.5,
-4.291883, -2, -5.727569, 1, -0.5, 0.5, 0.5,
-4.291883, -2, -5.727569, 1, 1.5, 0.5, 0.5,
-4.291883, -2, -5.727569, 0, 1.5, 0.5, 0.5,
-4.291883, 0, -5.727569, 0, -0.5, 0.5, 0.5,
-4.291883, 0, -5.727569, 1, -0.5, 0.5, 0.5,
-4.291883, 0, -5.727569, 1, 1.5, 0.5, 0.5,
-4.291883, 0, -5.727569, 0, 1.5, 0.5, 0.5,
-4.291883, 2, -5.727569, 0, -0.5, 0.5, 0.5,
-4.291883, 2, -5.727569, 1, -0.5, 0.5, 0.5,
-4.291883, 2, -5.727569, 1, 1.5, 0.5, 0.5,
-4.291883, 2, -5.727569, 0, 1.5, 0.5, 0.5
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
-3.780879, -3.675241, -4,
-3.780879, -3.675241, 4,
-3.780879, -3.675241, -4,
-3.951214, -3.857077, -4,
-3.780879, -3.675241, -2,
-3.951214, -3.857077, -2,
-3.780879, -3.675241, 0,
-3.951214, -3.857077, 0,
-3.780879, -3.675241, 2,
-3.951214, -3.857077, 2,
-3.780879, -3.675241, 4,
-3.951214, -3.857077, 4
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
-4.291883, -4.22075, -4, 0, -0.5, 0.5, 0.5,
-4.291883, -4.22075, -4, 1, -0.5, 0.5, 0.5,
-4.291883, -4.22075, -4, 1, 1.5, 0.5, 0.5,
-4.291883, -4.22075, -4, 0, 1.5, 0.5, 0.5,
-4.291883, -4.22075, -2, 0, -0.5, 0.5, 0.5,
-4.291883, -4.22075, -2, 1, -0.5, 0.5, 0.5,
-4.291883, -4.22075, -2, 1, 1.5, 0.5, 0.5,
-4.291883, -4.22075, -2, 0, 1.5, 0.5, 0.5,
-4.291883, -4.22075, 0, 0, -0.5, 0.5, 0.5,
-4.291883, -4.22075, 0, 1, -0.5, 0.5, 0.5,
-4.291883, -4.22075, 0, 1, 1.5, 0.5, 0.5,
-4.291883, -4.22075, 0, 0, 1.5, 0.5, 0.5,
-4.291883, -4.22075, 2, 0, -0.5, 0.5, 0.5,
-4.291883, -4.22075, 2, 1, -0.5, 0.5, 0.5,
-4.291883, -4.22075, 2, 1, 1.5, 0.5, 0.5,
-4.291883, -4.22075, 2, 0, 1.5, 0.5, 0.5,
-4.291883, -4.22075, 4, 0, -0.5, 0.5, 0.5,
-4.291883, -4.22075, 4, 1, -0.5, 0.5, 0.5,
-4.291883, -4.22075, 4, 1, 1.5, 0.5, 0.5,
-4.291883, -4.22075, 4, 0, 1.5, 0.5, 0.5
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
-3.780879, -3.675241, -4.900986,
-3.780879, 3.598219, -4.900986,
-3.780879, -3.675241, 6.120121,
-3.780879, 3.598219, 6.120121,
-3.780879, -3.675241, -4.900986,
-3.780879, -3.675241, 6.120121,
-3.780879, 3.598219, -4.900986,
-3.780879, 3.598219, 6.120121,
-3.780879, -3.675241, -4.900986,
3.032518, -3.675241, -4.900986,
-3.780879, -3.675241, 6.120121,
3.032518, -3.675241, 6.120121,
-3.780879, 3.598219, -4.900986,
3.032518, 3.598219, -4.900986,
-3.780879, 3.598219, 6.120121,
3.032518, 3.598219, 6.120121,
3.032518, -3.675241, -4.900986,
3.032518, 3.598219, -4.900986,
3.032518, -3.675241, 6.120121,
3.032518, 3.598219, 6.120121,
3.032518, -3.675241, -4.900986,
3.032518, -3.675241, 6.120121,
3.032518, 3.598219, -4.900986,
3.032518, 3.598219, 6.120121
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
var radius = 7.934427;
var distance = 35.30116;
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
mvMatrix.translate( 0.3741804, 0.03851068, -0.6095674 );
mvMatrix.scale( 1.259116, 1.179474, 0.7784026 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.30116);
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
Vitamin_B3<-read.table("Vitamin_B3.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Vitamin_B3$V2
```

```
## Error in eval(expr, envir, enclos): object 'Vitamin_B3' not found
```

```r
y<-Vitamin_B3$V3
```

```
## Error in eval(expr, envir, enclos): object 'Vitamin_B3' not found
```

```r
z<-Vitamin_B3$V4
```

```
## Error in eval(expr, envir, enclos): object 'Vitamin_B3' not found
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
-3.681654, -0.007865515, -0.06622977, 0, 0, 1, 1, 1,
-3.215289, -0.6920755, -1.546358, 1, 0, 0, 1, 1,
-2.703204, -1.293362, -3.395157, 1, 0, 0, 1, 1,
-2.666353, -1.010451, -3.500131, 1, 0, 0, 1, 1,
-2.658538, 2.271203, -1.513087, 1, 0, 0, 1, 1,
-2.62443, 0.3704127, -0.4158654, 1, 0, 0, 1, 1,
-2.52784, 0.722669, -1.102592, 0, 0, 0, 1, 1,
-2.429292, 0.6435232, -0.4143441, 0, 0, 0, 1, 1,
-2.423839, 0.7439265, -0.693126, 0, 0, 0, 1, 1,
-2.344556, 0.0267088, -0.3189781, 0, 0, 0, 1, 1,
-2.344302, 1.397947, -0.5022501, 0, 0, 0, 1, 1,
-2.33436, -0.4802109, -1.826957, 0, 0, 0, 1, 1,
-2.333743, -1.315602, -3.662221, 0, 0, 0, 1, 1,
-2.308713, -1.676701, -1.981986, 1, 1, 1, 1, 1,
-2.290788, 0.706379, -0.2376772, 1, 1, 1, 1, 1,
-2.280829, -0.6560166, -3.039002, 1, 1, 1, 1, 1,
-2.278511, 0.09233169, -1.140675, 1, 1, 1, 1, 1,
-2.248589, 0.600445, -1.481589, 1, 1, 1, 1, 1,
-2.18609, 0.3173773, -0.9222214, 1, 1, 1, 1, 1,
-2.16817, 0.365478, 0.4214407, 1, 1, 1, 1, 1,
-2.163871, -0.5053593, -0.3239864, 1, 1, 1, 1, 1,
-2.0799, 0.07908709, -1.038397, 1, 1, 1, 1, 1,
-2.070406, -1.56974, -2.947011, 1, 1, 1, 1, 1,
-2.055505, -0.6957234, -2.118082, 1, 1, 1, 1, 1,
-2.047261, 1.34957, -2.04073, 1, 1, 1, 1, 1,
-2.041537, 0.1115578, -1.102723, 1, 1, 1, 1, 1,
-2.040625, 0.009623614, 0.0906624, 1, 1, 1, 1, 1,
-2.039359, -0.8540877, -1.156353, 1, 1, 1, 1, 1,
-2.021129, -1.604648, -0.2883973, 0, 0, 1, 1, 1,
-2.010601, 1.615029, -1.627601, 1, 0, 0, 1, 1,
-1.967839, -0.06975532, -0.6659299, 1, 0, 0, 1, 1,
-1.947743, 1.384976, -2.027445, 1, 0, 0, 1, 1,
-1.912466, 0.4951633, -2.557346, 1, 0, 0, 1, 1,
-1.902906, -0.4649842, -2.015383, 1, 0, 0, 1, 1,
-1.89668, -2.733364, -3.873897, 0, 0, 0, 1, 1,
-1.894691, 1.339074, 1.221842, 0, 0, 0, 1, 1,
-1.884282, -0.5939617, -0.6949717, 0, 0, 0, 1, 1,
-1.882333, -2.353374, -3.033159, 0, 0, 0, 1, 1,
-1.837709, 0.8464305, -0.4502326, 0, 0, 0, 1, 1,
-1.836056, -1.324924, -1.428377, 0, 0, 0, 1, 1,
-1.835587, -1.969237, -2.753585, 0, 0, 0, 1, 1,
-1.827886, -0.6571254, -2.471734, 1, 1, 1, 1, 1,
-1.807676, -0.1830779, -2.950985, 1, 1, 1, 1, 1,
-1.796807, 0.03046954, -0.1735641, 1, 1, 1, 1, 1,
-1.793659, 0.9348441, 0.1241288, 1, 1, 1, 1, 1,
-1.782644, -1.574435, -3.64344, 1, 1, 1, 1, 1,
-1.781362, 0.5049185, -1.006101, 1, 1, 1, 1, 1,
-1.772772, -0.3437552, -0.468253, 1, 1, 1, 1, 1,
-1.768689, -0.5372427, -2.497828, 1, 1, 1, 1, 1,
-1.764491, 1.39183, -1.748348, 1, 1, 1, 1, 1,
-1.723351, -0.162473, -2.146661, 1, 1, 1, 1, 1,
-1.694942, -0.4809587, -0.2773423, 1, 1, 1, 1, 1,
-1.692615, -0.6138073, -2.918695, 1, 1, 1, 1, 1,
-1.655906, 1.153409, -0.5410517, 1, 1, 1, 1, 1,
-1.646737, -1.219662, -1.968247, 1, 1, 1, 1, 1,
-1.637481, -0.8316718, -0.8626018, 1, 1, 1, 1, 1,
-1.629845, -0.3561096, -1.825246, 0, 0, 1, 1, 1,
-1.612165, -0.9887467, -2.327709, 1, 0, 0, 1, 1,
-1.600409, 0.906544, -1.230886, 1, 0, 0, 1, 1,
-1.556499, 1.074041, 0.05467461, 1, 0, 0, 1, 1,
-1.530182, 0.2449692, -0.8041784, 1, 0, 0, 1, 1,
-1.52029, -1.101616, 0.5659872, 1, 0, 0, 1, 1,
-1.518556, 0.2975442, -0.5099912, 0, 0, 0, 1, 1,
-1.503185, 0.5743694, -0.6606743, 0, 0, 0, 1, 1,
-1.496285, -0.3094053, -2.827774, 0, 0, 0, 1, 1,
-1.490137, -0.5747965, -3.786248, 0, 0, 0, 1, 1,
-1.48693, -0.3496097, -1.730958, 0, 0, 0, 1, 1,
-1.486613, 0.06410568, -1.642063, 0, 0, 0, 1, 1,
-1.486387, -0.5290104, -1.830664, 0, 0, 0, 1, 1,
-1.486354, 0.01783474, -1.000561, 1, 1, 1, 1, 1,
-1.482446, -0.8221487, -3.81088, 1, 1, 1, 1, 1,
-1.482322, 0.2757004, -3.302775, 1, 1, 1, 1, 1,
-1.481681, 1.437328, -2.298301, 1, 1, 1, 1, 1,
-1.480049, 0.4004126, 0.6176718, 1, 1, 1, 1, 1,
-1.463905, 2.518325, -0.5021329, 1, 1, 1, 1, 1,
-1.461464, 0.4316457, -3.506643, 1, 1, 1, 1, 1,
-1.458447, 0.9493145, -1.643439, 1, 1, 1, 1, 1,
-1.436437, 0.3467937, -2.850233, 1, 1, 1, 1, 1,
-1.435383, -0.2139694, -0.9769562, 1, 1, 1, 1, 1,
-1.434543, -0.547631, -0.5076174, 1, 1, 1, 1, 1,
-1.429205, -0.6668468, -0.9417334, 1, 1, 1, 1, 1,
-1.4286, 1.484524, -0.5582721, 1, 1, 1, 1, 1,
-1.413801, 0.8987222, -0.7538432, 1, 1, 1, 1, 1,
-1.411178, 0.7634089, -0.8560738, 1, 1, 1, 1, 1,
-1.403275, -0.2098854, -1.283579, 0, 0, 1, 1, 1,
-1.379602, 0.5056205, -0.4286439, 1, 0, 0, 1, 1,
-1.367959, -0.2904528, -1.554756, 1, 0, 0, 1, 1,
-1.364375, -0.6700045, -1.906932, 1, 0, 0, 1, 1,
-1.35098, -0.152781, -1.216989, 1, 0, 0, 1, 1,
-1.342854, -1.243092, -2.137791, 1, 0, 0, 1, 1,
-1.321945, 0.5032151, -1.477757, 0, 0, 0, 1, 1,
-1.318464, -0.1276404, -1.591474, 0, 0, 0, 1, 1,
-1.300493, -0.4451266, -1.350598, 0, 0, 0, 1, 1,
-1.299981, -1.802479, -3.226514, 0, 0, 0, 1, 1,
-1.292677, -0.122487, -1.245404, 0, 0, 0, 1, 1,
-1.286277, 0.6475895, 0.3652095, 0, 0, 0, 1, 1,
-1.282557, -0.4843805, -1.399566, 0, 0, 0, 1, 1,
-1.263283, 0.5827288, -2.59553, 1, 1, 1, 1, 1,
-1.261168, 0.2827092, -2.75221, 1, 1, 1, 1, 1,
-1.254709, 1.771436, -2.15491, 1, 1, 1, 1, 1,
-1.249367, -1.663007, -2.981868, 1, 1, 1, 1, 1,
-1.236008, 0.02470728, -2.337864, 1, 1, 1, 1, 1,
-1.2285, -0.866825, -2.587011, 1, 1, 1, 1, 1,
-1.225227, 0.9660932, 0.6384256, 1, 1, 1, 1, 1,
-1.210337, 1.780518, -0.3215718, 1, 1, 1, 1, 1,
-1.202886, 0.1633764, -1.673798, 1, 1, 1, 1, 1,
-1.20085, -0.4838003, -0.8209471, 1, 1, 1, 1, 1,
-1.183371, -0.4663483, -2.744408, 1, 1, 1, 1, 1,
-1.173801, 0.8046933, -0.6823488, 1, 1, 1, 1, 1,
-1.169658, 0.9281855, -0.2658349, 1, 1, 1, 1, 1,
-1.167487, -0.1910063, -1.00168, 1, 1, 1, 1, 1,
-1.161646, 1.004777, 0.04828811, 1, 1, 1, 1, 1,
-1.147384, -0.06269848, -2.331768, 0, 0, 1, 1, 1,
-1.145241, -0.2469228, -2.275252, 1, 0, 0, 1, 1,
-1.143221, 0.6325293, -0.3211978, 1, 0, 0, 1, 1,
-1.142466, -0.04516017, -2.578359, 1, 0, 0, 1, 1,
-1.138077, -0.9627073, -1.32383, 1, 0, 0, 1, 1,
-1.127995, 0.47844, 0.1283858, 1, 0, 0, 1, 1,
-1.126329, 0.7891473, -1.44172, 0, 0, 0, 1, 1,
-1.125766, -1.026991, -1.285407, 0, 0, 0, 1, 1,
-1.114494, -0.1272309, -0.2034064, 0, 0, 0, 1, 1,
-1.106712, -1.21172, -2.927922, 0, 0, 0, 1, 1,
-1.104877, 1.368873, 0.5999622, 0, 0, 0, 1, 1,
-1.104178, -0.4582436, -4.025207, 0, 0, 0, 1, 1,
-1.103093, -1.169809, -1.939083, 0, 0, 0, 1, 1,
-1.100488, -1.857334, -3.108364, 1, 1, 1, 1, 1,
-1.095025, -0.8775606, -2.580656, 1, 1, 1, 1, 1,
-1.085582, 0.1658479, 0.2634254, 1, 1, 1, 1, 1,
-1.079021, 1.135031, -0.8140366, 1, 1, 1, 1, 1,
-1.072668, -0.08677036, -3.288955, 1, 1, 1, 1, 1,
-1.072635, 0.1052687, -0.8610137, 1, 1, 1, 1, 1,
-1.0645, -1.297064, -3.361147, 1, 1, 1, 1, 1,
-1.060753, 1.722381, -0.02148448, 1, 1, 1, 1, 1,
-1.057366, 0.9835471, -1.104534, 1, 1, 1, 1, 1,
-1.044703, 2.030101, -0.0710314, 1, 1, 1, 1, 1,
-1.038596, 0.6586134, 0.2455426, 1, 1, 1, 1, 1,
-1.034566, 0.07230831, -2.716522, 1, 1, 1, 1, 1,
-1.029475, -1.122293, -2.987801, 1, 1, 1, 1, 1,
-1.016876, 1.438697, 0.9885014, 1, 1, 1, 1, 1,
-1.01529, 1.144154, -0.3638654, 1, 1, 1, 1, 1,
-1.009384, -0.05420841, -1.814883, 0, 0, 1, 1, 1,
-0.9935616, 1.836512, -1.666892, 1, 0, 0, 1, 1,
-0.9927635, 0.2872298, -2.013847, 1, 0, 0, 1, 1,
-0.9818687, 0.4322359, -2.646641, 1, 0, 0, 1, 1,
-0.9780909, -0.210971, -0.9591825, 1, 0, 0, 1, 1,
-0.9753149, -0.9572197, -2.276346, 1, 0, 0, 1, 1,
-0.9712214, 0.1909961, -1.442878, 0, 0, 0, 1, 1,
-0.9600251, -0.6017373, -2.156416, 0, 0, 0, 1, 1,
-0.9588653, -0.2281075, -2.726181, 0, 0, 0, 1, 1,
-0.950898, 0.2920199, -2.710644, 0, 0, 0, 1, 1,
-0.9497926, -1.650494, -1.653956, 0, 0, 0, 1, 1,
-0.9401669, 0.4333347, -1.575923, 0, 0, 0, 1, 1,
-0.9365649, 0.2988147, -1.34434, 0, 0, 0, 1, 1,
-0.9355669, -0.542455, -4.642648, 1, 1, 1, 1, 1,
-0.9343112, 0.2309907, -1.52363, 1, 1, 1, 1, 1,
-0.9324416, -0.2771332, -1.432946, 1, 1, 1, 1, 1,
-0.9319667, 0.3258276, -1.912313, 1, 1, 1, 1, 1,
-0.9307157, -1.377583, -1.977144, 1, 1, 1, 1, 1,
-0.9272423, -0.8015952, -2.071355, 1, 1, 1, 1, 1,
-0.9241232, -0.6760888, -2.987607, 1, 1, 1, 1, 1,
-0.9216065, -0.6355422, -2.70944, 1, 1, 1, 1, 1,
-0.9174561, -0.4490303, -3.415144, 1, 1, 1, 1, 1,
-0.9159347, -0.4222606, -2.569128, 1, 1, 1, 1, 1,
-0.9099755, 0.5174064, -0.5504037, 1, 1, 1, 1, 1,
-0.9005601, 1.493733, -1.412945, 1, 1, 1, 1, 1,
-0.8985172, 0.5808417, -0.2455768, 1, 1, 1, 1, 1,
-0.8982921, 0.2847061, -1.017057, 1, 1, 1, 1, 1,
-0.8978492, 1.606676, -1.664924, 1, 1, 1, 1, 1,
-0.8970876, 0.8555313, -1.748552, 0, 0, 1, 1, 1,
-0.8968368, 1.091652, -1.875221, 1, 0, 0, 1, 1,
-0.8951532, -0.2720486, -2.454213, 1, 0, 0, 1, 1,
-0.8858886, 0.1451925, -1.360154, 1, 0, 0, 1, 1,
-0.8840282, -0.2255733, -2.649186, 1, 0, 0, 1, 1,
-0.8776931, 0.396199, -1.347599, 1, 0, 0, 1, 1,
-0.864536, -0.2429358, -2.061266, 0, 0, 0, 1, 1,
-0.8592414, -0.4033948, -2.920378, 0, 0, 0, 1, 1,
-0.8575638, -1.296569, -3.190067, 0, 0, 0, 1, 1,
-0.8562557, -0.5157096, -1.209028, 0, 0, 0, 1, 1,
-0.8476968, 2.049294, 0.1282978, 0, 0, 0, 1, 1,
-0.8468423, 0.4610085, -0.3416325, 0, 0, 0, 1, 1,
-0.8410774, -1.227883, -2.019098, 0, 0, 0, 1, 1,
-0.8410651, -1.119882, -3.910733, 1, 1, 1, 1, 1,
-0.8373922, -0.5104216, -2.361448, 1, 1, 1, 1, 1,
-0.8364348, -0.1151348, -2.762514, 1, 1, 1, 1, 1,
-0.8364304, 0.7817924, 0.9583572, 1, 1, 1, 1, 1,
-0.8350478, 0.2323432, -3.41523, 1, 1, 1, 1, 1,
-0.8344453, 0.6783009, 0.1666393, 1, 1, 1, 1, 1,
-0.830451, 0.8749789, -0.2869249, 1, 1, 1, 1, 1,
-0.82918, 0.8821256, -2.263134, 1, 1, 1, 1, 1,
-0.8239555, 0.007291903, -1.311825, 1, 1, 1, 1, 1,
-0.8228148, 1.077256, 0.3715791, 1, 1, 1, 1, 1,
-0.8201599, -0.6228399, -0.02714978, 1, 1, 1, 1, 1,
-0.8196346, 0.8683634, -2.029388, 1, 1, 1, 1, 1,
-0.8135415, 0.9210566, -1.944515, 1, 1, 1, 1, 1,
-0.8100016, 0.02243663, -4.598667, 1, 1, 1, 1, 1,
-0.8015842, -0.4709125, -2.039354, 1, 1, 1, 1, 1,
-0.7986706, 0.7825884, -1.603339, 0, 0, 1, 1, 1,
-0.7985727, -0.1460238, -1.852437, 1, 0, 0, 1, 1,
-0.7907127, 0.322785, -0.2318034, 1, 0, 0, 1, 1,
-0.7881274, 1.463775, 0.08826592, 1, 0, 0, 1, 1,
-0.7764875, -1.445464, -3.014661, 1, 0, 0, 1, 1,
-0.7710381, 1.865182, -0.375319, 1, 0, 0, 1, 1,
-0.7664803, -0.9745331, -2.011075, 0, 0, 0, 1, 1,
-0.7654897, 0.2668914, -0.04491478, 0, 0, 0, 1, 1,
-0.7627771, 0.8811775, -0.7004485, 0, 0, 0, 1, 1,
-0.7603053, 0.8374633, 1.323122, 0, 0, 0, 1, 1,
-0.7586015, -1.421432, -2.509218, 0, 0, 0, 1, 1,
-0.7561558, 1.177374, 0.03206879, 0, 0, 0, 1, 1,
-0.7546458, 1.448124, -1.230318, 0, 0, 0, 1, 1,
-0.7532097, 1.711394, 1.485375, 1, 1, 1, 1, 1,
-0.747583, 1.927473, -2.534527, 1, 1, 1, 1, 1,
-0.7376702, -0.4208405, -1.667858, 1, 1, 1, 1, 1,
-0.737607, 0.6542556, -1.698306, 1, 1, 1, 1, 1,
-0.7352489, 0.1768793, -1.107516, 1, 1, 1, 1, 1,
-0.7319165, 0.6549066, 0.2010317, 1, 1, 1, 1, 1,
-0.7303244, 0.9231716, 0.216878, 1, 1, 1, 1, 1,
-0.7273998, 0.007384425, -1.619433, 1, 1, 1, 1, 1,
-0.7230456, 1.755025, -0.1882943, 1, 1, 1, 1, 1,
-0.7213796, -1.137789, -2.91696, 1, 1, 1, 1, 1,
-0.7198867, 0.04491453, -1.275559, 1, 1, 1, 1, 1,
-0.7132194, 1.88366, 0.01338306, 1, 1, 1, 1, 1,
-0.7131279, -0.5128994, -3.034931, 1, 1, 1, 1, 1,
-0.7101627, 0.5495333, -1.841881, 1, 1, 1, 1, 1,
-0.709317, -1.649568, -3.316115, 1, 1, 1, 1, 1,
-0.7090781, 1.120315, 0.739796, 0, 0, 1, 1, 1,
-0.708378, -0.6092871, -0.8509818, 1, 0, 0, 1, 1,
-0.7011176, -0.4786958, -1.618256, 1, 0, 0, 1, 1,
-0.6953699, 1.2131, -0.6458379, 1, 0, 0, 1, 1,
-0.6921631, 0.146225, -0.0229168, 1, 0, 0, 1, 1,
-0.6886356, -0.2564445, -2.37815, 1, 0, 0, 1, 1,
-0.6810151, 1.425521, -0.3619094, 0, 0, 0, 1, 1,
-0.6809624, -0.6847109, -1.779078, 0, 0, 0, 1, 1,
-0.6738629, 0.7444888, -0.5546526, 0, 0, 0, 1, 1,
-0.6678856, -0.4945377, -2.431983, 0, 0, 0, 1, 1,
-0.6672168, -0.1422364, -0.8821936, 0, 0, 0, 1, 1,
-0.6644014, 0.9290588, -0.6855615, 0, 0, 0, 1, 1,
-0.6633696, -0.9314686, -2.850389, 0, 0, 0, 1, 1,
-0.6624346, 0.03527436, -1.631474, 1, 1, 1, 1, 1,
-0.6613986, 0.2386553, -0.6402776, 1, 1, 1, 1, 1,
-0.6581637, -0.7622431, -3.073693, 1, 1, 1, 1, 1,
-0.6551716, -0.02850289, -0.6920187, 1, 1, 1, 1, 1,
-0.6519551, 0.597346, 2.223274, 1, 1, 1, 1, 1,
-0.6488629, 0.1895936, -2.080373, 1, 1, 1, 1, 1,
-0.6438583, -1.014607, -3.038377, 1, 1, 1, 1, 1,
-0.6429909, -1.526864, -3.414885, 1, 1, 1, 1, 1,
-0.6427836, -0.4242052, -2.855047, 1, 1, 1, 1, 1,
-0.6333215, 0.5219645, -1.813791, 1, 1, 1, 1, 1,
-0.6205192, -0.7480274, -2.321925, 1, 1, 1, 1, 1,
-0.6202676, 0.6999629, -0.4041637, 1, 1, 1, 1, 1,
-0.617696, -0.6945421, -2.104914, 1, 1, 1, 1, 1,
-0.6162895, 0.7927807, -1.871695, 1, 1, 1, 1, 1,
-0.6137007, 0.2010308, -2.598433, 1, 1, 1, 1, 1,
-0.6111981, 1.362435, -1.859565, 0, 0, 1, 1, 1,
-0.5964639, 1.011814, -0.6668385, 1, 0, 0, 1, 1,
-0.5961137, -1.714554, -2.049783, 1, 0, 0, 1, 1,
-0.5955613, 1.298503, -1.606407, 1, 0, 0, 1, 1,
-0.5884576, 0.6019252, 0.0002451507, 1, 0, 0, 1, 1,
-0.5774214, -1.763716, -1.453207, 1, 0, 0, 1, 1,
-0.5735043, 1.53119, 0.5065246, 0, 0, 0, 1, 1,
-0.5675862, -0.8459814, -2.455423, 0, 0, 0, 1, 1,
-0.5667819, 1.223196, -1.885668, 0, 0, 0, 1, 1,
-0.5660772, -1.65867, -2.907257, 0, 0, 0, 1, 1,
-0.5657477, 1.2324, -0.373497, 0, 0, 0, 1, 1,
-0.5653481, 0.5729765, -1.020758, 0, 0, 0, 1, 1,
-0.5650282, 0.2293985, 0.8288004, 0, 0, 0, 1, 1,
-0.5648168, 0.3421995, 0.5748996, 1, 1, 1, 1, 1,
-0.5646095, -0.6382728, -2.893814, 1, 1, 1, 1, 1,
-0.5637076, -0.4933316, -2.105303, 1, 1, 1, 1, 1,
-0.563589, 0.4471297, -1.247199, 1, 1, 1, 1, 1,
-0.5624176, 0.2144184, -2.68483, 1, 1, 1, 1, 1,
-0.5543259, -0.612099, -0.9173499, 1, 1, 1, 1, 1,
-0.5522233, 0.4124813, -2.483207, 1, 1, 1, 1, 1,
-0.5521807, 0.5184744, -0.1571237, 1, 1, 1, 1, 1,
-0.5505954, -1.073916, -3.376567, 1, 1, 1, 1, 1,
-0.5497314, 0.2862613, -1.55608, 1, 1, 1, 1, 1,
-0.5450961, -0.09756803, -1.757716, 1, 1, 1, 1, 1,
-0.5429348, 0.451149, -0.7495969, 1, 1, 1, 1, 1,
-0.5393703, 0.5356797, -2.741574, 1, 1, 1, 1, 1,
-0.5378114, -0.3967429, -0.4251159, 1, 1, 1, 1, 1,
-0.5368187, -0.7902908, -1.037803, 1, 1, 1, 1, 1,
-0.5240975, -0.238312, -0.9971224, 0, 0, 1, 1, 1,
-0.5238215, 2.114252, 0.2418685, 1, 0, 0, 1, 1,
-0.5204492, -0.4692049, -1.81948, 1, 0, 0, 1, 1,
-0.5091401, 0.2392401, -0.2677979, 1, 0, 0, 1, 1,
-0.5019209, 0.306328, 0.06869216, 1, 0, 0, 1, 1,
-0.5002688, 0.9647533, 0.6404377, 1, 0, 0, 1, 1,
-0.4993031, -0.4183919, -0.5797608, 0, 0, 0, 1, 1,
-0.4958772, 0.9824982, 0.09175345, 0, 0, 0, 1, 1,
-0.4932661, -0.5082908, -1.826365, 0, 0, 0, 1, 1,
-0.4897323, 1.026139, -1.431336, 0, 0, 0, 1, 1,
-0.4886114, 0.1053075, -0.7035717, 0, 0, 0, 1, 1,
-0.4884844, 0.9298661, -1.013964, 0, 0, 0, 1, 1,
-0.4859441, -1.406406, -2.531075, 0, 0, 0, 1, 1,
-0.4828006, -0.6950807, -3.797837, 1, 1, 1, 1, 1,
-0.482641, -0.5388661, -3.156934, 1, 1, 1, 1, 1,
-0.480689, 0.3199241, -0.2400305, 1, 1, 1, 1, 1,
-0.4749269, -1.05459, -3.2298, 1, 1, 1, 1, 1,
-0.4698527, -1.149575, -2.983581, 1, 1, 1, 1, 1,
-0.4673187, -0.09090801, -2.982159, 1, 1, 1, 1, 1,
-0.4637007, -0.9037845, -1.958147, 1, 1, 1, 1, 1,
-0.4618456, 2.017981, -0.1862812, 1, 1, 1, 1, 1,
-0.4608733, -0.6283137, -3.994481, 1, 1, 1, 1, 1,
-0.4588993, 0.8726934, -0.3026776, 1, 1, 1, 1, 1,
-0.4575635, -0.1328671, -2.661864, 1, 1, 1, 1, 1,
-0.453996, 0.7337565, 1.491496, 1, 1, 1, 1, 1,
-0.4507596, 0.7380871, -2.153457, 1, 1, 1, 1, 1,
-0.4501739, 1.504967, 0.8755455, 1, 1, 1, 1, 1,
-0.4375444, 0.2546034, -2.14101, 1, 1, 1, 1, 1,
-0.4335871, 0.6135423, -0.6883466, 0, 0, 1, 1, 1,
-0.4326171, 0.2822233, -0.4731691, 1, 0, 0, 1, 1,
-0.4316032, 0.04449734, -2.665198, 1, 0, 0, 1, 1,
-0.4262256, 0.2533181, 0.3995906, 1, 0, 0, 1, 1,
-0.4256091, 0.9438273, -0.1734615, 1, 0, 0, 1, 1,
-0.416495, -0.6656182, -3.665725, 1, 0, 0, 1, 1,
-0.4131543, 0.7896968, -0.9567708, 0, 0, 0, 1, 1,
-0.4106293, 0.3368752, -4.307958, 0, 0, 0, 1, 1,
-0.4101734, 0.05337282, 0.1489698, 0, 0, 0, 1, 1,
-0.4094526, 1.549228, -0.2247625, 0, 0, 0, 1, 1,
-0.4067258, -1.131629, -3.943322, 0, 0, 0, 1, 1,
-0.4061898, -0.7424679, -4.64037, 0, 0, 0, 1, 1,
-0.4047044, 0.2030126, -0.1750443, 0, 0, 0, 1, 1,
-0.4046353, -0.1154056, -1.038367, 1, 1, 1, 1, 1,
-0.404319, 1.144284, -0.1717615, 1, 1, 1, 1, 1,
-0.3906932, -0.7324172, -3.81831, 1, 1, 1, 1, 1,
-0.3871371, 0.7997982, -1.169172, 1, 1, 1, 1, 1,
-0.3868676, 1.168508, 2.220441, 1, 1, 1, 1, 1,
-0.3747523, -1.177892, -1.431886, 1, 1, 1, 1, 1,
-0.3729703, -2.967083, -1.071676, 1, 1, 1, 1, 1,
-0.3703579, 1.605758, -0.4484537, 1, 1, 1, 1, 1,
-0.3701752, -0.9226027, -1.913364, 1, 1, 1, 1, 1,
-0.368865, 0.4616396, -0.7083485, 1, 1, 1, 1, 1,
-0.3660466, -0.1959133, -2.836305, 1, 1, 1, 1, 1,
-0.3641873, 1.148648, 1.14649, 1, 1, 1, 1, 1,
-0.3641535, -1.200403, -0.1352035, 1, 1, 1, 1, 1,
-0.3626233, -1.031458, -2.090143, 1, 1, 1, 1, 1,
-0.3623617, -1.186686, -2.351917, 1, 1, 1, 1, 1,
-0.3607608, -0.4691079, -2.348119, 0, 0, 1, 1, 1,
-0.355949, -0.2443788, -2.191251, 1, 0, 0, 1, 1,
-0.354692, 0.6136308, 0.123946, 1, 0, 0, 1, 1,
-0.3537656, -0.0460147, -1.501542, 1, 0, 0, 1, 1,
-0.3534868, 0.7649355, -0.1077778, 1, 0, 0, 1, 1,
-0.3515386, -1.951266, -1.799935, 1, 0, 0, 1, 1,
-0.3497092, 0.0935825, -0.5736799, 0, 0, 0, 1, 1,
-0.3496627, -0.1379945, -2.698024, 0, 0, 0, 1, 1,
-0.3481954, 1.798107, 0.8735421, 0, 0, 0, 1, 1,
-0.3442855, 1.353799, 0.2127628, 0, 0, 0, 1, 1,
-0.3423128, -0.1891319, -2.031973, 0, 0, 0, 1, 1,
-0.341229, -0.01577765, -0.8121553, 0, 0, 0, 1, 1,
-0.3370363, -0.3650836, -1.886519, 0, 0, 0, 1, 1,
-0.3344641, -0.5251513, -1.238244, 1, 1, 1, 1, 1,
-0.3327537, 0.05768318, -1.964308, 1, 1, 1, 1, 1,
-0.3315646, 0.3002088, -0.274736, 1, 1, 1, 1, 1,
-0.3269883, -0.6660601, -2.174259, 1, 1, 1, 1, 1,
-0.326574, -1.019309, -4.116955, 1, 1, 1, 1, 1,
-0.3214436, -0.5813976, -1.503406, 1, 1, 1, 1, 1,
-0.3150346, 0.1605294, -2.694187, 1, 1, 1, 1, 1,
-0.3137861, 0.9899139, 0.01740976, 1, 1, 1, 1, 1,
-0.3135801, -0.95015, -2.964506, 1, 1, 1, 1, 1,
-0.3110545, 0.2197144, -1.592057, 1, 1, 1, 1, 1,
-0.3097088, -1.183628, -3.067606, 1, 1, 1, 1, 1,
-0.3020728, 1.884607, 0.1908315, 1, 1, 1, 1, 1,
-0.2945117, 1.197264, -1.619367, 1, 1, 1, 1, 1,
-0.2921896, -0.58915, -2.069358, 1, 1, 1, 1, 1,
-0.2917053, -0.714866, -1.961025, 1, 1, 1, 1, 1,
-0.2913338, 0.5048475, -0.288377, 0, 0, 1, 1, 1,
-0.2887185, -1.633996, -4.740484, 1, 0, 0, 1, 1,
-0.2852587, -0.1522456, -1.444643, 1, 0, 0, 1, 1,
-0.2849739, -0.04976305, -3.750103, 1, 0, 0, 1, 1,
-0.2813387, -1.860243, -2.869219, 1, 0, 0, 1, 1,
-0.2776438, -3.569317, -1.351271, 1, 0, 0, 1, 1,
-0.2761427, 1.371945, -0.1258613, 0, 0, 0, 1, 1,
-0.2704075, -0.2787666, -3.400178, 0, 0, 0, 1, 1,
-0.2691588, 1.00605, 0.09416179, 0, 0, 0, 1, 1,
-0.2658382, 0.4653643, -0.6720066, 0, 0, 0, 1, 1,
-0.2647868, -0.3677801, -2.764249, 0, 0, 0, 1, 1,
-0.2646475, -0.6112663, -3.422654, 0, 0, 0, 1, 1,
-0.2641333, -1.095704, -3.351016, 0, 0, 0, 1, 1,
-0.2638935, 0.2133365, 0.19949, 1, 1, 1, 1, 1,
-0.2573562, -0.3506396, 0.00917098, 1, 1, 1, 1, 1,
-0.2572942, 0.5767373, 0.6499, 1, 1, 1, 1, 1,
-0.2509933, 0.5536268, -1.224288, 1, 1, 1, 1, 1,
-0.250933, -0.1798092, -1.234915, 1, 1, 1, 1, 1,
-0.2455641, 1.050897, 0.4134893, 1, 1, 1, 1, 1,
-0.2447175, -0.3735744, -2.574299, 1, 1, 1, 1, 1,
-0.2422579, 0.3204223, -1.521442, 1, 1, 1, 1, 1,
-0.2416947, -0.4395642, -2.830553, 1, 1, 1, 1, 1,
-0.2416908, 0.5874788, 0.5741513, 1, 1, 1, 1, 1,
-0.2404005, 1.451768, -1.054761, 1, 1, 1, 1, 1,
-0.2362082, -2.135334, -3.989911, 1, 1, 1, 1, 1,
-0.2346119, -0.4128298, -3.576336, 1, 1, 1, 1, 1,
-0.2293372, 0.4128494, -0.6842693, 1, 1, 1, 1, 1,
-0.2278153, -1.164612, -1.906964, 1, 1, 1, 1, 1,
-0.2278025, -0.06698819, -2.560493, 0, 0, 1, 1, 1,
-0.2194597, 0.8349627, -1.873203, 1, 0, 0, 1, 1,
-0.208076, -0.4215695, -2.758343, 1, 0, 0, 1, 1,
-0.2016893, 0.862104, 1.960056, 1, 0, 0, 1, 1,
-0.1981752, 1.805949, 0.2225949, 1, 0, 0, 1, 1,
-0.1967034, -1.168992, -2.849963, 1, 0, 0, 1, 1,
-0.1934895, -0.4059437, -3.097255, 0, 0, 0, 1, 1,
-0.1895627, 2.212454, -0.9206762, 0, 0, 0, 1, 1,
-0.1894018, -0.6528002, -3.56761, 0, 0, 0, 1, 1,
-0.1879378, 0.2056034, -1.403265, 0, 0, 0, 1, 1,
-0.1878295, 1.552323, -2.183549, 0, 0, 0, 1, 1,
-0.185998, 0.5671896, -0.9573902, 0, 0, 0, 1, 1,
-0.1814345, 0.4923802, -0.7921668, 0, 0, 0, 1, 1,
-0.1774381, -0.9221532, -2.735623, 1, 1, 1, 1, 1,
-0.1752341, -0.3723328, -2.825849, 1, 1, 1, 1, 1,
-0.1751966, -1.905793, -2.35595, 1, 1, 1, 1, 1,
-0.1708962, 0.9299798, 0.3422272, 1, 1, 1, 1, 1,
-0.1694743, 1.151462, -1.639403, 1, 1, 1, 1, 1,
-0.1638573, -0.9165829, -3.498968, 1, 1, 1, 1, 1,
-0.1569068, 0.01757067, -2.470225, 1, 1, 1, 1, 1,
-0.1549917, -0.7067505, -3.046962, 1, 1, 1, 1, 1,
-0.1544235, 1.72261, 0.5052188, 1, 1, 1, 1, 1,
-0.1541589, 1.7991, -2.559341, 1, 1, 1, 1, 1,
-0.153016, -0.1891281, -1.631295, 1, 1, 1, 1, 1,
-0.1520686, -1.47134, -3.302835, 1, 1, 1, 1, 1,
-0.1517447, 0.4141864, -1.336201, 1, 1, 1, 1, 1,
-0.1471659, 0.5658226, -0.09618812, 1, 1, 1, 1, 1,
-0.1464485, 0.4343927, -2.091156, 1, 1, 1, 1, 1,
-0.1454509, -0.3162776, -2.057446, 0, 0, 1, 1, 1,
-0.140861, 2.412162, 2.382981, 1, 0, 0, 1, 1,
-0.1378396, -0.172224, -2.152873, 1, 0, 0, 1, 1,
-0.1371808, -0.2992047, -2.984729, 1, 0, 0, 1, 1,
-0.1306492, -2.38146, -3.357671, 1, 0, 0, 1, 1,
-0.1267935, 0.8642011, 0.4455203, 1, 0, 0, 1, 1,
-0.1258783, -1.205199, -3.104534, 0, 0, 0, 1, 1,
-0.1253531, -0.8506106, -3.578583, 0, 0, 0, 1, 1,
-0.1218136, -1.728372, -1.814065, 0, 0, 0, 1, 1,
-0.1211865, 0.3785635, -0.3315504, 0, 0, 0, 1, 1,
-0.1204277, 0.7403181, -0.532795, 0, 0, 0, 1, 1,
-0.1194992, 0.4317541, -1.134318, 0, 0, 0, 1, 1,
-0.1098267, -0.8057349, -2.577153, 0, 0, 0, 1, 1,
-0.1061786, 1.556379, -0.623895, 1, 1, 1, 1, 1,
-0.1050012, -0.7700122, -3.473957, 1, 1, 1, 1, 1,
-0.1039564, -0.6234666, -0.996056, 1, 1, 1, 1, 1,
-0.0993463, -0.8497367, -2.133943, 1, 1, 1, 1, 1,
-0.09807016, -0.03656631, -3.010917, 1, 1, 1, 1, 1,
-0.09382731, 1.03974, -0.2272522, 1, 1, 1, 1, 1,
-0.09302481, 1.670003, -2.728225, 1, 1, 1, 1, 1,
-0.08877771, -0.1816542, -3.22365, 1, 1, 1, 1, 1,
-0.08834707, -0.2213547, -3.583235, 1, 1, 1, 1, 1,
-0.08301579, -0.03699728, -3.634728, 1, 1, 1, 1, 1,
-0.08246937, 1.290767, -0.3683741, 1, 1, 1, 1, 1,
-0.08127876, -0.9068609, -3.810196, 1, 1, 1, 1, 1,
-0.08120823, -0.1758995, -2.752571, 1, 1, 1, 1, 1,
-0.0766439, 0.1209563, 1.361313, 1, 1, 1, 1, 1,
-0.07458021, -1.636066, -4.73341, 1, 1, 1, 1, 1,
-0.06370981, -0.120396, -1.653099, 0, 0, 1, 1, 1,
-0.06290743, -0.1023471, -1.710348, 1, 0, 0, 1, 1,
-0.06052272, 0.004470854, -4.468707, 1, 0, 0, 1, 1,
-0.05975142, -0.5898436, -3.416508, 1, 0, 0, 1, 1,
-0.04977005, -0.463121, -3.499667, 1, 0, 0, 1, 1,
-0.04490142, -1.188849, -2.723663, 1, 0, 0, 1, 1,
-0.04368109, 2.021357, 1.561679, 0, 0, 0, 1, 1,
-0.03244175, -0.1738084, -1.860825, 0, 0, 0, 1, 1,
-0.03142566, 0.3870764, -0.3546119, 0, 0, 0, 1, 1,
-0.02917165, 1.750142, -0.06194793, 0, 0, 0, 1, 1,
-0.02730069, 0.6560072, -0.5922292, 0, 0, 0, 1, 1,
-0.02251627, 0.1577838, 0.4862776, 0, 0, 0, 1, 1,
-0.02185087, 2.069357, -0.06082062, 0, 0, 0, 1, 1,
-0.01867738, 0.3112083, 1.58776, 1, 1, 1, 1, 1,
-0.01635986, 0.4909112, -0.102273, 1, 1, 1, 1, 1,
-0.01533511, 0.8369338, 0.1506905, 1, 1, 1, 1, 1,
-0.0009509297, -2.370342, -3.473405, 1, 1, 1, 1, 1,
0.0006669005, 0.7551925, 1.042143, 1, 1, 1, 1, 1,
0.004072706, -0.2522141, 2.924356, 1, 1, 1, 1, 1,
0.01082031, 0.8274047, -0.07097553, 1, 1, 1, 1, 1,
0.01290843, -1.84461, 3.530413, 1, 1, 1, 1, 1,
0.01650961, -0.1946884, 1.345963, 1, 1, 1, 1, 1,
0.01764311, -0.2158365, 3.322692, 1, 1, 1, 1, 1,
0.02057635, 1.044682, -1.119466, 1, 1, 1, 1, 1,
0.02326931, -1.781025, 2.062222, 1, 1, 1, 1, 1,
0.02509877, 0.6556029, -0.5402355, 1, 1, 1, 1, 1,
0.02534491, 1.306123, 0.1249695, 1, 1, 1, 1, 1,
0.03096128, 1.276848, 3.28381, 1, 1, 1, 1, 1,
0.03607884, 0.05214406, -0.5958694, 0, 0, 1, 1, 1,
0.0364223, -0.4296937, 2.115237, 1, 0, 0, 1, 1,
0.04062166, -0.1338893, 3.78326, 1, 0, 0, 1, 1,
0.04172571, 0.1830312, 0.8427454, 1, 0, 0, 1, 1,
0.04647624, -0.06643275, 3.549061, 1, 0, 0, 1, 1,
0.0497767, -0.4311255, 0.7386141, 1, 0, 0, 1, 1,
0.05062275, 0.1321362, -0.2683974, 0, 0, 0, 1, 1,
0.05301584, 0.5686211, -0.1401417, 0, 0, 0, 1, 1,
0.05546729, 0.1078903, 0.613118, 0, 0, 0, 1, 1,
0.05761782, 0.9795952, -0.6464391, 0, 0, 0, 1, 1,
0.06066608, -0.1009099, 3.163651, 0, 0, 0, 1, 1,
0.0620817, -0.2470447, 2.78665, 0, 0, 0, 1, 1,
0.06602116, 0.617604, 0.6031273, 0, 0, 0, 1, 1,
0.06676956, -1.929949, 3.072587, 1, 1, 1, 1, 1,
0.06809994, 2.523073, 0.4241989, 1, 1, 1, 1, 1,
0.07294835, -0.1768413, -0.2569025, 1, 1, 1, 1, 1,
0.07340593, -1.643985, 2.02282, 1, 1, 1, 1, 1,
0.07349869, 1.459358, 0.003263533, 1, 1, 1, 1, 1,
0.08075834, -0.9923747, 2.092155, 1, 1, 1, 1, 1,
0.08081323, -0.04531446, 2.72519, 1, 1, 1, 1, 1,
0.08363672, -0.1907657, 2.5469, 1, 1, 1, 1, 1,
0.08428425, -1.781215, 1.985415, 1, 1, 1, 1, 1,
0.08574328, -0.6336497, 0.6812822, 1, 1, 1, 1, 1,
0.08638711, -0.009046972, 0.5816296, 1, 1, 1, 1, 1,
0.08914541, -0.6488254, 2.989568, 1, 1, 1, 1, 1,
0.09027939, -0.7608042, 2.142776, 1, 1, 1, 1, 1,
0.09234285, -1.23135, 4.23898, 1, 1, 1, 1, 1,
0.09704591, -1.065843, 4.896098, 1, 1, 1, 1, 1,
0.1001596, 0.240229, 1.5292, 0, 0, 1, 1, 1,
0.1004853, -0.1464234, 3.047297, 1, 0, 0, 1, 1,
0.1018809, 1.000406, 0.5485746, 1, 0, 0, 1, 1,
0.1040248, 0.2073636, 1.488891, 1, 0, 0, 1, 1,
0.1065978, 0.5280478, 0.4313461, 1, 0, 0, 1, 1,
0.1117066, -0.7331725, 3.585429, 1, 0, 0, 1, 1,
0.1147715, 0.8470673, 1.869807, 0, 0, 0, 1, 1,
0.1148215, 0.3504323, 0.361796, 0, 0, 0, 1, 1,
0.1232128, 1.093057, 0.4908142, 0, 0, 0, 1, 1,
0.1268475, -0.455902, 1.809537, 0, 0, 0, 1, 1,
0.1271401, -0.5068463, 2.399454, 0, 0, 0, 1, 1,
0.1321772, -0.9637949, 3.241627, 0, 0, 0, 1, 1,
0.1370409, 0.310154, 0.3318696, 0, 0, 0, 1, 1,
0.1404537, -0.5721034, 3.27843, 1, 1, 1, 1, 1,
0.1410101, -1.528938, 3.017369, 1, 1, 1, 1, 1,
0.1411534, -0.7675741, 4.772073, 1, 1, 1, 1, 1,
0.1414176, -2.149565, 3.089702, 1, 1, 1, 1, 1,
0.1426697, 0.4055167, 0.621516, 1, 1, 1, 1, 1,
0.1508467, 0.07491688, 1.473201, 1, 1, 1, 1, 1,
0.1560364, -0.9086118, 3.639354, 1, 1, 1, 1, 1,
0.159912, 1.129914, -1.883755, 1, 1, 1, 1, 1,
0.1608093, 1.305062, -1.295535, 1, 1, 1, 1, 1,
0.1637778, -0.3584068, 2.513172, 1, 1, 1, 1, 1,
0.1684039, -1.002298, 3.649617, 1, 1, 1, 1, 1,
0.168715, -0.9062071, 4.948785, 1, 1, 1, 1, 1,
0.173466, 1.070818, 1.059025, 1, 1, 1, 1, 1,
0.1814834, -0.2389802, 3.275257, 1, 1, 1, 1, 1,
0.186744, 1.251583, -0.6294545, 1, 1, 1, 1, 1,
0.1881762, -0.2499778, 1.554108, 0, 0, 1, 1, 1,
0.1888886, 0.2485676, -1.030918, 1, 0, 0, 1, 1,
0.1914989, -0.4766728, 2.342147, 1, 0, 0, 1, 1,
0.2010848, -1.316156, 3.147101, 1, 0, 0, 1, 1,
0.2016581, -0.5029824, 2.921612, 1, 0, 0, 1, 1,
0.204271, -0.2923607, 3.20157, 1, 0, 0, 1, 1,
0.2063286, 0.06812525, 0.7158077, 0, 0, 0, 1, 1,
0.2082584, -0.01937328, 3.677387, 0, 0, 0, 1, 1,
0.2096792, 1.057294, 0.06118942, 0, 0, 0, 1, 1,
0.2117669, 0.5228935, 0.9476225, 0, 0, 0, 1, 1,
0.2126911, 0.3704286, 0.06050023, 0, 0, 0, 1, 1,
0.2127549, 1.873157, -0.05809448, 0, 0, 0, 1, 1,
0.2138254, -0.2137082, 1.88026, 0, 0, 0, 1, 1,
0.2195961, -0.3188739, 4.170796, 1, 1, 1, 1, 1,
0.2204437, 0.2147511, 3.213323, 1, 1, 1, 1, 1,
0.2217407, 1.010357, -0.7173459, 1, 1, 1, 1, 1,
0.2249999, -0.08579658, 2.380512, 1, 1, 1, 1, 1,
0.226927, -0.3562045, 2.344655, 1, 1, 1, 1, 1,
0.2300129, -1.323446, 4.113322, 1, 1, 1, 1, 1,
0.2307164, 1.751143, 0.0212374, 1, 1, 1, 1, 1,
0.2309953, -1.380306, 4.528641, 1, 1, 1, 1, 1,
0.2320551, -0.6841448, 3.531346, 1, 1, 1, 1, 1,
0.2326555, 1.508131, -0.2397614, 1, 1, 1, 1, 1,
0.2337017, 1.044856, 0.3163663, 1, 1, 1, 1, 1,
0.2339426, -1.916289, 2.174387, 1, 1, 1, 1, 1,
0.2385265, 0.08866419, 0.5401011, 1, 1, 1, 1, 1,
0.2464882, 1.15678, 0.7180072, 1, 1, 1, 1, 1,
0.2477421, 0.437197, 0.7866058, 1, 1, 1, 1, 1,
0.2522324, -0.7917063, 4.962451, 0, 0, 1, 1, 1,
0.2581913, -0.526042, 2.601123, 1, 0, 0, 1, 1,
0.2649311, 1.293225, 1.345023, 1, 0, 0, 1, 1,
0.2678156, -0.7589744, 3.516189, 1, 0, 0, 1, 1,
0.267987, -0.01350427, 1.176175, 1, 0, 0, 1, 1,
0.2696231, 0.1047828, 1.792111, 1, 0, 0, 1, 1,
0.2723637, 1.344913, 0.4642862, 0, 0, 0, 1, 1,
0.2733225, 3.492295, 2.440816, 0, 0, 0, 1, 1,
0.2750405, -0.5544256, 4.625751, 0, 0, 0, 1, 1,
0.2755387, 0.6804132, -1.805735, 0, 0, 0, 1, 1,
0.2780916, 0.1552458, 0.5550321, 0, 0, 0, 1, 1,
0.2782356, -0.3332499, 3.479908, 0, 0, 0, 1, 1,
0.2790107, -0.09236442, 1.154704, 0, 0, 0, 1, 1,
0.2806507, 0.5233367, 0.3903929, 1, 1, 1, 1, 1,
0.2814779, 0.05866645, 0.01260112, 1, 1, 1, 1, 1,
0.281873, 0.09432869, 1.510049, 1, 1, 1, 1, 1,
0.2829657, 0.1744665, 1.193094, 1, 1, 1, 1, 1,
0.2853694, 1.113295, -0.9216394, 1, 1, 1, 1, 1,
0.2880715, -0.7359468, 1.690061, 1, 1, 1, 1, 1,
0.2898351, -0.1447065, 3.286473, 1, 1, 1, 1, 1,
0.2920367, -1.188657, 2.109093, 1, 1, 1, 1, 1,
0.2927684, -0.4438515, 2.328559, 1, 1, 1, 1, 1,
0.2984682, 0.4073513, 0.8436256, 1, 1, 1, 1, 1,
0.2995741, -0.5700625, 3.162503, 1, 1, 1, 1, 1,
0.3040484, -0.9126253, 4.541332, 1, 1, 1, 1, 1,
0.3044931, 0.4196759, 2.605382, 1, 1, 1, 1, 1,
0.3048973, 0.7077837, 0.3220668, 1, 1, 1, 1, 1,
0.3063588, 2.412086, -0.8536203, 1, 1, 1, 1, 1,
0.3104085, -1.226009, 2.526487, 0, 0, 1, 1, 1,
0.312831, -0.05270854, 0.8993397, 1, 0, 0, 1, 1,
0.3133602, -1.45734, 2.558214, 1, 0, 0, 1, 1,
0.3150685, 0.1984326, 2.933265, 1, 0, 0, 1, 1,
0.316227, -0.8233514, 3.689699, 1, 0, 0, 1, 1,
0.3190652, 1.326442, 0.4078834, 1, 0, 0, 1, 1,
0.3222723, 0.6919973, 1.875785, 0, 0, 0, 1, 1,
0.3224773, -1.582018, 2.209513, 0, 0, 0, 1, 1,
0.3249358, 0.8695406, 0.1788989, 0, 0, 0, 1, 1,
0.3280807, 0.05187064, 0.6082264, 0, 0, 0, 1, 1,
0.3285869, -0.6046813, 2.276399, 0, 0, 0, 1, 1,
0.3310302, 0.5532047, -2.191873, 0, 0, 0, 1, 1,
0.3343452, 0.4717779, 0.7611299, 0, 0, 0, 1, 1,
0.3357151, -0.06906664, 1.736359, 1, 1, 1, 1, 1,
0.3372226, 1.253099, 2.615424, 1, 1, 1, 1, 1,
0.3380128, 0.175879, 2.805166, 1, 1, 1, 1, 1,
0.3399601, -0.117306, 3.696232, 1, 1, 1, 1, 1,
0.3409739, -0.8543234, 3.309419, 1, 1, 1, 1, 1,
0.3426471, -0.1420255, 2.020823, 1, 1, 1, 1, 1,
0.3438648, 2.015945, 1.016684, 1, 1, 1, 1, 1,
0.3509997, 1.397849, -2.437566, 1, 1, 1, 1, 1,
0.353861, 2.009814, -0.9145638, 1, 1, 1, 1, 1,
0.3547781, -1.315136, 2.896998, 1, 1, 1, 1, 1,
0.3552053, 1.458347, 0.4758607, 1, 1, 1, 1, 1,
0.3593268, 0.4446894, -1.274931, 1, 1, 1, 1, 1,
0.3598128, -0.9795385, 4.257345, 1, 1, 1, 1, 1,
0.3614188, 0.08644011, 1.817704, 1, 1, 1, 1, 1,
0.3624188, 1.411094, -0.2942678, 1, 1, 1, 1, 1,
0.3632178, 0.3088683, 0.1955042, 0, 0, 1, 1, 1,
0.3638389, 0.3581524, 4.291621, 1, 0, 0, 1, 1,
0.3649058, -1.253829, 2.384434, 1, 0, 0, 1, 1,
0.3672784, 0.7986292, 1.462098, 1, 0, 0, 1, 1,
0.3683735, 0.04528862, 2.676756, 1, 0, 0, 1, 1,
0.3734624, 0.9854509, 1.32933, 1, 0, 0, 1, 1,
0.3751012, -0.3811987, 3.123461, 0, 0, 0, 1, 1,
0.3755279, -1.415813, 1.493959, 0, 0, 0, 1, 1,
0.3781435, -0.4296486, 2.359591, 0, 0, 0, 1, 1,
0.37938, 0.5874918, -0.6378525, 0, 0, 0, 1, 1,
0.3807599, -0.4906954, 3.211589, 0, 0, 0, 1, 1,
0.3923142, 0.3795803, 0.4600854, 0, 0, 0, 1, 1,
0.3952889, -2.125898, 1.405131, 0, 0, 0, 1, 1,
0.398096, -1.005592, 1.745284, 1, 1, 1, 1, 1,
0.3982242, -0.2276046, 2.185046, 1, 1, 1, 1, 1,
0.3988034, 0.7497666, 0.9408176, 1, 1, 1, 1, 1,
0.3996696, -2.662543, 2.376553, 1, 1, 1, 1, 1,
0.4085264, 0.1841612, 1.821538, 1, 1, 1, 1, 1,
0.4098322, -0.7471306, 3.791164, 1, 1, 1, 1, 1,
0.409834, 0.9450746, 1.497361, 1, 1, 1, 1, 1,
0.4151106, -0.9263112, 3.681781, 1, 1, 1, 1, 1,
0.4198601, -0.377616, 2.592464, 1, 1, 1, 1, 1,
0.4213859, -0.6571264, 1.970378, 1, 1, 1, 1, 1,
0.4214954, -1.314877, 2.662074, 1, 1, 1, 1, 1,
0.4215925, 1.382034, 1.267987, 1, 1, 1, 1, 1,
0.4236593, -1.217437, 3.706901, 1, 1, 1, 1, 1,
0.424786, 0.4124965, -0.02360878, 1, 1, 1, 1, 1,
0.4285218, 0.01185154, 0.893112, 1, 1, 1, 1, 1,
0.4297119, 0.7427137, 1.254326, 0, 0, 1, 1, 1,
0.4299632, 0.7781522, -0.6446051, 1, 0, 0, 1, 1,
0.4300663, 1.275979, -0.2417239, 1, 0, 0, 1, 1,
0.4302978, -1.233091, 2.370969, 1, 0, 0, 1, 1,
0.4327457, 1.837056, -0.2422149, 1, 0, 0, 1, 1,
0.4341746, 0.9147686, 0.4061824, 1, 0, 0, 1, 1,
0.434624, 0.5908272, 0.9799595, 0, 0, 0, 1, 1,
0.4364365, -0.9175944, 1.53582, 0, 0, 0, 1, 1,
0.4374252, -0.004915319, 1.712793, 0, 0, 0, 1, 1,
0.4380586, 0.4981964, 1.626367, 0, 0, 0, 1, 1,
0.4397424, 0.9103163, 2.298347, 0, 0, 0, 1, 1,
0.4397995, -0.7533466, 3.902569, 0, 0, 0, 1, 1,
0.4420666, 0.3463066, -0.2910979, 0, 0, 0, 1, 1,
0.4448214, -0.7881975, 2.311549, 1, 1, 1, 1, 1,
0.4448531, -0.4845355, 3.128836, 1, 1, 1, 1, 1,
0.4454038, 0.001399662, 0.4434927, 1, 1, 1, 1, 1,
0.4503593, 0.09115288, -0.01753689, 1, 1, 1, 1, 1,
0.4520358, -1.353747, 1.440918, 1, 1, 1, 1, 1,
0.452916, 0.02528664, 1.706663, 1, 1, 1, 1, 1,
0.4563894, 0.2553378, 0.9335088, 1, 1, 1, 1, 1,
0.4603694, 0.9270207, 2.853135, 1, 1, 1, 1, 1,
0.4606382, 0.4622179, 1.067415, 1, 1, 1, 1, 1,
0.4689746, 0.2536592, 0.1144077, 1, 1, 1, 1, 1,
0.4710071, 0.4631152, 1.087392, 1, 1, 1, 1, 1,
0.4785164, 1.535891, -0.4515215, 1, 1, 1, 1, 1,
0.4801865, 0.8836126, 1.706734, 1, 1, 1, 1, 1,
0.4883797, -0.6287447, 2.403519, 1, 1, 1, 1, 1,
0.4901223, -0.00678442, 1.945622, 1, 1, 1, 1, 1,
0.4930966, -1.031915, 5.269277, 0, 0, 1, 1, 1,
0.4937521, 0.7222538, -0.114107, 1, 0, 0, 1, 1,
0.4977989, -0.3805867, 2.524326, 1, 0, 0, 1, 1,
0.5027167, -0.4076539, 0.9925851, 1, 0, 0, 1, 1,
0.5053563, 0.2736081, 0.239497, 1, 0, 0, 1, 1,
0.506656, -2.55209, 3.243437, 1, 0, 0, 1, 1,
0.5075724, 0.03459861, 0.7379236, 0, 0, 0, 1, 1,
0.5123092, -0.7114435, 2.935, 0, 0, 0, 1, 1,
0.5125257, 0.6168957, 0.9545865, 0, 0, 0, 1, 1,
0.5137771, 0.2060229, 1.213185, 0, 0, 0, 1, 1,
0.5151392, -0.3328623, 2.222659, 0, 0, 0, 1, 1,
0.516812, 0.5052004, 1.817404, 0, 0, 0, 1, 1,
0.5204208, -1.943141, 4.709191, 0, 0, 0, 1, 1,
0.5204515, -0.5493288, 2.455729, 1, 1, 1, 1, 1,
0.5209388, -1.401358, 0.7637222, 1, 1, 1, 1, 1,
0.5210584, -0.4080687, 1.81793, 1, 1, 1, 1, 1,
0.5221561, -0.9738777, 2.752071, 1, 1, 1, 1, 1,
0.5226684, 0.4361223, -0.7353407, 1, 1, 1, 1, 1,
0.5319628, 0.2849437, 1.642218, 1, 1, 1, 1, 1,
0.5361598, -0.773788, 1.632599, 1, 1, 1, 1, 1,
0.5408393, 1.220583, 1.897562, 1, 1, 1, 1, 1,
0.5440918, -1.111789, 2.015605, 1, 1, 1, 1, 1,
0.5453087, 0.3209774, 2.371469, 1, 1, 1, 1, 1,
0.5457521, 0.0105811, 2.383599, 1, 1, 1, 1, 1,
0.5475449, 1.130091, 2.079459, 1, 1, 1, 1, 1,
0.5487257, -0.5654009, 2.554034, 1, 1, 1, 1, 1,
0.5510483, -0.5584557, 1.968829, 1, 1, 1, 1, 1,
0.5567255, 0.4380399, 0.5517864, 1, 1, 1, 1, 1,
0.5600755, -0.310158, 0.9564492, 0, 0, 1, 1, 1,
0.5602793, -0.07409871, 0.4699579, 1, 0, 0, 1, 1,
0.5605912, -1.144059, 4.366661, 1, 0, 0, 1, 1,
0.5622039, -0.2612408, 3.846052, 1, 0, 0, 1, 1,
0.5644881, -0.5103864, 1.995511, 1, 0, 0, 1, 1,
0.5689355, -2.526544, 2.360516, 1, 0, 0, 1, 1,
0.5727745, -1.19304, 1.031634, 0, 0, 0, 1, 1,
0.5731493, -1.679368, 4.776683, 0, 0, 0, 1, 1,
0.5773566, -0.3809387, 3.38279, 0, 0, 0, 1, 1,
0.5823432, -1.010437, 0.7707784, 0, 0, 0, 1, 1,
0.5848642, -0.7641013, 3.570318, 0, 0, 0, 1, 1,
0.5849305, -2.066286, 3.998454, 0, 0, 0, 1, 1,
0.5850497, -1.473469, 1.956404, 0, 0, 0, 1, 1,
0.5851581, -1.648003, 3.583751, 1, 1, 1, 1, 1,
0.5856771, -1.544628, 3.360509, 1, 1, 1, 1, 1,
0.5894495, -1.245199, 2.586742, 1, 1, 1, 1, 1,
0.5910267, -0.1757908, 2.951074, 1, 1, 1, 1, 1,
0.5981944, -1.965894, 3.419093, 1, 1, 1, 1, 1,
0.6011158, 1.015772, 0.4852647, 1, 1, 1, 1, 1,
0.6071534, -0.3633589, 1.147253, 1, 1, 1, 1, 1,
0.6091341, -0.2479979, 1.539858, 1, 1, 1, 1, 1,
0.6096782, -0.08551194, 1.601369, 1, 1, 1, 1, 1,
0.6107482, -0.4481488, 1.142132, 1, 1, 1, 1, 1,
0.611753, -1.398013, 2.319434, 1, 1, 1, 1, 1,
0.614948, 1.36487, 1.172595, 1, 1, 1, 1, 1,
0.6152193, -1.167173, 2.77735, 1, 1, 1, 1, 1,
0.6169304, -0.1997024, 2.890144, 1, 1, 1, 1, 1,
0.6192643, -2.518741, 2.854419, 1, 1, 1, 1, 1,
0.6194642, -2.236572, 2.934456, 0, 0, 1, 1, 1,
0.6284109, 0.08871471, 2.040301, 1, 0, 0, 1, 1,
0.6295965, -1.098565, 1.57978, 1, 0, 0, 1, 1,
0.6331111, 0.8449804, 0.03910818, 1, 0, 0, 1, 1,
0.6410645, 1.518785, 0.8730679, 1, 0, 0, 1, 1,
0.6465932, -0.3808489, 2.651733, 1, 0, 0, 1, 1,
0.6480968, 0.887832, 1.52757, 0, 0, 0, 1, 1,
0.6535335, -1.130389, 1.626748, 0, 0, 0, 1, 1,
0.6549136, -0.4601288, 0.5669886, 0, 0, 0, 1, 1,
0.6551327, -0.7723696, 2.424102, 0, 0, 0, 1, 1,
0.6554978, -0.2479403, 2.020088, 0, 0, 0, 1, 1,
0.6620554, 1.774801, -0.2124795, 0, 0, 0, 1, 1,
0.6634073, 1.753163, -0.9481319, 0, 0, 0, 1, 1,
0.6650033, -0.07646884, 2.740386, 1, 1, 1, 1, 1,
0.669241, -0.2071714, 2.884079, 1, 1, 1, 1, 1,
0.6693625, 1.837398, -1.371142, 1, 1, 1, 1, 1,
0.6696137, -0.5252917, 1.288823, 1, 1, 1, 1, 1,
0.671532, -0.1329605, 0.9509909, 1, 1, 1, 1, 1,
0.6725133, 0.008075677, 1.698532, 1, 1, 1, 1, 1,
0.6732532, -1.810309, 5.959619, 1, 1, 1, 1, 1,
0.6746408, 0.985343, -0.8804286, 1, 1, 1, 1, 1,
0.6771041, -1.428012, 2.573697, 1, 1, 1, 1, 1,
0.6810625, -1.325143, 2.142489, 1, 1, 1, 1, 1,
0.681304, 1.41459, 1.036544, 1, 1, 1, 1, 1,
0.682061, 1.115374, 0.9672139, 1, 1, 1, 1, 1,
0.6829505, 0.9068704, 3.171043, 1, 1, 1, 1, 1,
0.6890622, -0.001518705, 3.394992, 1, 1, 1, 1, 1,
0.6897163, -0.9576705, 4.089642, 1, 1, 1, 1, 1,
0.6930249, 0.819717, -0.2391026, 0, 0, 1, 1, 1,
0.6980433, -0.2416397, 1.370036, 1, 0, 0, 1, 1,
0.7040635, 0.4551664, -0.6544346, 1, 0, 0, 1, 1,
0.7256793, 0.7238153, 2.310491, 1, 0, 0, 1, 1,
0.7374302, 0.07494764, 1.240194, 1, 0, 0, 1, 1,
0.7425777, -0.8251957, 2.292368, 1, 0, 0, 1, 1,
0.7444395, -0.8473679, 1.389783, 0, 0, 0, 1, 1,
0.7489163, -0.02314041, 0.1382147, 0, 0, 0, 1, 1,
0.7561179, 1.618831, 1.646491, 0, 0, 0, 1, 1,
0.7567254, 1.342977, 0.584632, 0, 0, 0, 1, 1,
0.7594358, -1.389959, 1.099206, 0, 0, 0, 1, 1,
0.7640683, -0.2460468, 1.866377, 0, 0, 0, 1, 1,
0.7657968, -0.1675101, 1.977686, 0, 0, 0, 1, 1,
0.7688903, 0.07678986, 1.442154, 1, 1, 1, 1, 1,
0.7752082, -2.712052, 4.127456, 1, 1, 1, 1, 1,
0.77571, -1.772454, 2.165143, 1, 1, 1, 1, 1,
0.7764633, 0.0493302, 2.768808, 1, 1, 1, 1, 1,
0.7772911, 0.001796033, -0.1090868, 1, 1, 1, 1, 1,
0.7897335, -0.1483093, 2.226632, 1, 1, 1, 1, 1,
0.7906882, -0.02431954, 2.499634, 1, 1, 1, 1, 1,
0.7970421, 1.089291, 1.177951, 1, 1, 1, 1, 1,
0.7999185, -1.488078, 3.947402, 1, 1, 1, 1, 1,
0.8014806, -0.5123143, 2.349284, 1, 1, 1, 1, 1,
0.8028952, -0.08148517, 0.6271885, 1, 1, 1, 1, 1,
0.8044283, 0.1826265, 2.779792, 1, 1, 1, 1, 1,
0.8055742, 0.2013878, 2.272099, 1, 1, 1, 1, 1,
0.8107454, 1.234664, 1.440357, 1, 1, 1, 1, 1,
0.8144375, -1.299829, 2.34927, 1, 1, 1, 1, 1,
0.8150792, -2.337682, 2.242549, 0, 0, 1, 1, 1,
0.8205694, -1.471594, 2.052061, 1, 0, 0, 1, 1,
0.8261787, 0.427396, 0.4789193, 1, 0, 0, 1, 1,
0.8268141, -0.7234994, 3.175335, 1, 0, 0, 1, 1,
0.8299184, 0.8453383, 0.1114836, 1, 0, 0, 1, 1,
0.832127, 0.8893527, 1.522081, 1, 0, 0, 1, 1,
0.8435982, 1.106992, 2.742862, 0, 0, 0, 1, 1,
0.8436074, 0.737576, 1.678095, 0, 0, 0, 1, 1,
0.8452326, 0.5285247, 2.35063, 0, 0, 0, 1, 1,
0.85403, -0.4048382, 1.742491, 0, 0, 0, 1, 1,
0.8543368, -0.1960251, 1.230403, 0, 0, 0, 1, 1,
0.8670272, -1.873956, 1.374549, 0, 0, 0, 1, 1,
0.8670693, 1.497732, 0.4537427, 0, 0, 0, 1, 1,
0.8724723, 2.481384, 1.177163, 1, 1, 1, 1, 1,
0.8885223, 0.3331778, 0.7125389, 1, 1, 1, 1, 1,
0.8886158, 0.4263321, 1.701258, 1, 1, 1, 1, 1,
0.8890678, 0.3481975, -0.580407, 1, 1, 1, 1, 1,
0.8929541, -1.00073, 2.910114, 1, 1, 1, 1, 1,
0.8973779, -0.8085606, 1.738829, 1, 1, 1, 1, 1,
0.8979016, -0.667483, 1.804961, 1, 1, 1, 1, 1,
0.8979555, -0.1012871, 1.91286, 1, 1, 1, 1, 1,
0.8998179, -1.117642, 1.945393, 1, 1, 1, 1, 1,
0.9095511, -0.122841, 1.624741, 1, 1, 1, 1, 1,
0.914165, 0.6011214, 0.3769463, 1, 1, 1, 1, 1,
0.9144706, 0.0203512, 2.019157, 1, 1, 1, 1, 1,
0.9166785, 1.579833, -1.268165, 1, 1, 1, 1, 1,
0.9210167, 0.6129813, 2.049902, 1, 1, 1, 1, 1,
0.9254586, 0.4937824, 1.12414, 1, 1, 1, 1, 1,
0.9292655, -0.3338996, 2.626053, 0, 0, 1, 1, 1,
0.9333737, 0.4057495, 1.123282, 1, 0, 0, 1, 1,
0.9373823, -1.787666, 1.934163, 1, 0, 0, 1, 1,
0.9383888, 1.303118, 0.58978, 1, 0, 0, 1, 1,
0.9387962, 0.5708923, 1.460969, 1, 0, 0, 1, 1,
0.9498128, -1.414889, 1.968179, 1, 0, 0, 1, 1,
0.9521543, 1.212304, 1.672935, 0, 0, 0, 1, 1,
0.959255, 0.7203675, 1.465438, 0, 0, 0, 1, 1,
0.9634324, -0.01082703, 2.345398, 0, 0, 0, 1, 1,
0.9644414, -0.7193415, 1.930323, 0, 0, 0, 1, 1,
0.9651856, 0.1446209, 0.8030456, 0, 0, 0, 1, 1,
0.9834779, 1.21118, 0.5716515, 0, 0, 0, 1, 1,
0.985267, 0.3570814, 0.4593636, 0, 0, 0, 1, 1,
0.987659, 1.258242, 0.09725182, 1, 1, 1, 1, 1,
0.9890288, -0.4938888, 2.704238, 1, 1, 1, 1, 1,
0.992781, -0.08554975, 1.872728, 1, 1, 1, 1, 1,
0.9931962, 0.2535035, 0.4866323, 1, 1, 1, 1, 1,
0.9970502, 0.8676824, 0.749589, 1, 1, 1, 1, 1,
0.9979995, -0.6874363, 1.192693, 1, 1, 1, 1, 1,
0.9988542, 0.1792759, 1.915004, 1, 1, 1, 1, 1,
1.000657, 0.1400104, 1.933659, 1, 1, 1, 1, 1,
1.005159, 0.5756104, 2.866023, 1, 1, 1, 1, 1,
1.009128, -1.46758, 1.6416, 1, 1, 1, 1, 1,
1.010692, -0.5642473, 1.966959, 1, 1, 1, 1, 1,
1.012778, 0.4633319, 1.869182, 1, 1, 1, 1, 1,
1.015595, -1.277822, 2.365175, 1, 1, 1, 1, 1,
1.017695, -1.597984, 0.07116102, 1, 1, 1, 1, 1,
1.021498, 0.6094592, 2.985789, 1, 1, 1, 1, 1,
1.025566, -1.143091, 2.354021, 0, 0, 1, 1, 1,
1.026571, 1.749438, 2.775965, 1, 0, 0, 1, 1,
1.028356, 2.261332, 1.281829, 1, 0, 0, 1, 1,
1.031095, -0.2621304, -0.5949161, 1, 0, 0, 1, 1,
1.031839, -2.574876, 0.965264, 1, 0, 0, 1, 1,
1.032735, -1.180543, 2.481025, 1, 0, 0, 1, 1,
1.034362, -0.3208453, 1.989493, 0, 0, 0, 1, 1,
1.034765, -0.7729647, 1.473669, 0, 0, 0, 1, 1,
1.036943, 0.7495506, 0.2795105, 0, 0, 0, 1, 1,
1.043007, -0.3655134, 1.385354, 0, 0, 0, 1, 1,
1.044417, -1.047219, 2.383677, 0, 0, 0, 1, 1,
1.046257, 1.528211, 1.471372, 0, 0, 0, 1, 1,
1.06021, 1.980412, 1.834372, 0, 0, 0, 1, 1,
1.060485, 0.3071092, 1.179902, 1, 1, 1, 1, 1,
1.069008, 1.547983, 0.3745896, 1, 1, 1, 1, 1,
1.091532, -0.5199025, 2.396292, 1, 1, 1, 1, 1,
1.096531, 0.9462662, 1.708713, 1, 1, 1, 1, 1,
1.097745, -0.9366299, 3.437886, 1, 1, 1, 1, 1,
1.100812, 0.6010563, 1.710383, 1, 1, 1, 1, 1,
1.101349, -0.3868196, 1.084664, 1, 1, 1, 1, 1,
1.104904, 1.031146, 1.762274, 1, 1, 1, 1, 1,
1.105182, -0.6230185, 3.260821, 1, 1, 1, 1, 1,
1.108039, -0.8018811, 0.8987837, 1, 1, 1, 1, 1,
1.110534, -0.465648, 1.031489, 1, 1, 1, 1, 1,
1.117464, 0.2514952, 2.279761, 1, 1, 1, 1, 1,
1.118625, 0.7249763, 1.591882, 1, 1, 1, 1, 1,
1.136118, 0.02949302, 0.6640806, 1, 1, 1, 1, 1,
1.13619, 0.3058788, -0.4462129, 1, 1, 1, 1, 1,
1.140796, -1.036662, -0.3659909, 0, 0, 1, 1, 1,
1.14622, -0.6267695, 2.148925, 1, 0, 0, 1, 1,
1.155812, 2.051482, 0.1617923, 1, 0, 0, 1, 1,
1.160849, 0.3604618, 1.8158, 1, 0, 0, 1, 1,
1.166236, 1.52868, 0.7406279, 1, 0, 0, 1, 1,
1.166499, -0.2111723, 2.730512, 1, 0, 0, 1, 1,
1.170934, 0.02720611, 1.411239, 0, 0, 0, 1, 1,
1.174926, 0.1716747, 2.236977, 0, 0, 0, 1, 1,
1.176372, -1.936697, 3.44051, 0, 0, 0, 1, 1,
1.18029, -0.806658, 3.095313, 0, 0, 0, 1, 1,
1.183566, 0.6615337, 2.272239, 0, 0, 0, 1, 1,
1.184576, -0.4108389, 2.979065, 0, 0, 0, 1, 1,
1.194319, 0.5884744, -0.845751, 0, 0, 0, 1, 1,
1.220234, -0.9799458, 3.013155, 1, 1, 1, 1, 1,
1.225181, 0.1139668, 2.816416, 1, 1, 1, 1, 1,
1.231611, 0.9124362, 0.5662058, 1, 1, 1, 1, 1,
1.23745, 0.9215556, 2.317873, 1, 1, 1, 1, 1,
1.247078, 1.142051, 0.9520085, 1, 1, 1, 1, 1,
1.253828, 0.5079994, 0.5669837, 1, 1, 1, 1, 1,
1.258966, -0.5022967, 1.928065, 1, 1, 1, 1, 1,
1.259981, -1.348769, 2.838238, 1, 1, 1, 1, 1,
1.26043, 0.6486789, 3.183951, 1, 1, 1, 1, 1,
1.265168, -0.01684681, 1.413101, 1, 1, 1, 1, 1,
1.273459, 0.01524108, 1.521749, 1, 1, 1, 1, 1,
1.281469, -0.3620182, 2.750622, 1, 1, 1, 1, 1,
1.28372, 0.764458, -0.04628685, 1, 1, 1, 1, 1,
1.289111, 1.905363, 1.526243, 1, 1, 1, 1, 1,
1.294065, -0.7068923, 1.19765, 1, 1, 1, 1, 1,
1.297668, 0.5212526, 1.546598, 0, 0, 1, 1, 1,
1.304522, 1.4475, 1.755607, 1, 0, 0, 1, 1,
1.305354, -0.6810908, 2.298441, 1, 0, 0, 1, 1,
1.313235, 1.777594, 0.4586964, 1, 0, 0, 1, 1,
1.313467, -1.476906, 2.508737, 1, 0, 0, 1, 1,
1.313771, -0.2692552, 1.486687, 1, 0, 0, 1, 1,
1.317021, -1.157979, 3.922608, 0, 0, 0, 1, 1,
1.32838, 0.934495, 2.91774, 0, 0, 0, 1, 1,
1.329619, -0.01500184, 1.010185, 0, 0, 0, 1, 1,
1.353875, 0.8252253, 0.005990117, 0, 0, 0, 1, 1,
1.357374, -1.946423, 2.940304, 0, 0, 0, 1, 1,
1.361465, -0.448547, 3.310571, 0, 0, 0, 1, 1,
1.361581, -0.7087157, 0.5562752, 0, 0, 0, 1, 1,
1.371343, 1.035945, -1.135074, 1, 1, 1, 1, 1,
1.371986, -0.3439577, 1.851971, 1, 1, 1, 1, 1,
1.376968, 0.5550904, 0.2389877, 1, 1, 1, 1, 1,
1.383393, -0.6874009, 3.285505, 1, 1, 1, 1, 1,
1.387468, -0.4018977, 1.166388, 1, 1, 1, 1, 1,
1.397387, 0.8141382, 0.5315834, 1, 1, 1, 1, 1,
1.400121, -0.114345, 0.1192093, 1, 1, 1, 1, 1,
1.400643, -0.8637673, 2.732538, 1, 1, 1, 1, 1,
1.427982, -0.330566, 0.4886569, 1, 1, 1, 1, 1,
1.428756, 0.4147016, 1.102764, 1, 1, 1, 1, 1,
1.430759, 0.5853927, 1.449813, 1, 1, 1, 1, 1,
1.437678, 0.4971505, 1.146624, 1, 1, 1, 1, 1,
1.437983, -1.053263, 3.46802, 1, 1, 1, 1, 1,
1.440948, 0.9510037, 1.262288, 1, 1, 1, 1, 1,
1.441352, 1.992322, 1.376636, 1, 1, 1, 1, 1,
1.441887, -1.230385, 1.500751, 0, 0, 1, 1, 1,
1.451423, -1.829054, 3.649485, 1, 0, 0, 1, 1,
1.453058, 0.3302273, 1.671953, 1, 0, 0, 1, 1,
1.456335, -0.443953, 3.244734, 1, 0, 0, 1, 1,
1.459232, -1.119235, 1.515359, 1, 0, 0, 1, 1,
1.478709, -0.2468509, 2.339732, 1, 0, 0, 1, 1,
1.483197, -0.261252, 1.57123, 0, 0, 0, 1, 1,
1.497497, -1.07009, 2.042134, 0, 0, 0, 1, 1,
1.511627, -0.7609096, 2.170242, 0, 0, 0, 1, 1,
1.519318, 0.5472088, 0.1174254, 0, 0, 0, 1, 1,
1.52031, -0.186701, 1.273997, 0, 0, 0, 1, 1,
1.524823, 0.7647174, 1.379987, 0, 0, 0, 1, 1,
1.534853, 1.617209, -0.8610153, 0, 0, 0, 1, 1,
1.547572, 0.4723372, 1.00701, 1, 1, 1, 1, 1,
1.55788, -0.1196814, 2.732003, 1, 1, 1, 1, 1,
1.563274, 1.127176, -0.2099859, 1, 1, 1, 1, 1,
1.566802, 1.644485, 0.08432072, 1, 1, 1, 1, 1,
1.57783, 0.2672023, 2.606573, 1, 1, 1, 1, 1,
1.590927, 0.6776227, 2.629358, 1, 1, 1, 1, 1,
1.604496, -0.6267471, 2.087258, 1, 1, 1, 1, 1,
1.607434, 1.278015, 0.9034547, 1, 1, 1, 1, 1,
1.611173, -0.5308111, 1.163965, 1, 1, 1, 1, 1,
1.642786, 0.5218689, 0.7868401, 1, 1, 1, 1, 1,
1.643017, 1.022284, 0.2259298, 1, 1, 1, 1, 1,
1.647922, 1.665511, -0.4010249, 1, 1, 1, 1, 1,
1.658885, 1.507007, -0.5065924, 1, 1, 1, 1, 1,
1.660534, -1.285328, 0.9873784, 1, 1, 1, 1, 1,
1.678263, 0.8219822, 1.26914, 1, 1, 1, 1, 1,
1.687515, 0.132884, -1.613207, 0, 0, 1, 1, 1,
1.69633, -0.01711421, 0.8665106, 1, 0, 0, 1, 1,
1.715258, -0.3857616, 1.92452, 1, 0, 0, 1, 1,
1.71816, -0.3806598, 1.040244, 1, 0, 0, 1, 1,
1.721226, 1.289304, 0.5377268, 1, 0, 0, 1, 1,
1.723019, 0.09833477, 1.431103, 1, 0, 0, 1, 1,
1.74944, -0.4942668, 1.755894, 0, 0, 0, 1, 1,
1.776793, 1.741895, 1.047864, 0, 0, 0, 1, 1,
1.78495, -0.2384509, 2.261285, 0, 0, 0, 1, 1,
1.800016, -1.356996, 2.292397, 0, 0, 0, 1, 1,
1.811392, -1.282263, 0.8603672, 0, 0, 0, 1, 1,
1.812372, -1.79044, 1.965169, 0, 0, 0, 1, 1,
1.815588, 0.9772878, 0.3698904, 0, 0, 0, 1, 1,
1.835028, -0.5251726, 2.883294, 1, 1, 1, 1, 1,
1.837004, -0.7451574, 2.150184, 1, 1, 1, 1, 1,
1.854312, 1.025706, 1.704442, 1, 1, 1, 1, 1,
1.889753, 0.646235, 3.764056, 1, 1, 1, 1, 1,
1.900401, -1.218599, 2.192458, 1, 1, 1, 1, 1,
1.93475, 0.8502154, 2.436743, 1, 1, 1, 1, 1,
1.967209, 0.4750162, 2.335033, 1, 1, 1, 1, 1,
1.971958, -1.460278, 2.989128, 1, 1, 1, 1, 1,
1.972737, 0.1009713, 2.260484, 1, 1, 1, 1, 1,
1.976563, 0.9061239, 0.504793, 1, 1, 1, 1, 1,
1.981824, -1.419381, 1.941599, 1, 1, 1, 1, 1,
1.99231, 1.975271, 1.072446, 1, 1, 1, 1, 1,
2.026403, 0.7902088, 1.304498, 1, 1, 1, 1, 1,
2.035615, -0.9420618, 2.267366, 1, 1, 1, 1, 1,
2.101046, 0.420869, -0.2758977, 1, 1, 1, 1, 1,
2.105259, 0.2186594, 2.644479, 0, 0, 1, 1, 1,
2.171007, 0.7978647, 1.15502, 1, 0, 0, 1, 1,
2.222787, 1.415902, 2.3521, 1, 0, 0, 1, 1,
2.224443, -0.4254632, 0.3759924, 1, 0, 0, 1, 1,
2.227857, 0.4129134, 0.1901762, 1, 0, 0, 1, 1,
2.228361, -1.051879, 3.172066, 1, 0, 0, 1, 1,
2.233751, 0.2298663, 1.10457, 0, 0, 0, 1, 1,
2.242697, -1.348254, 1.463084, 0, 0, 0, 1, 1,
2.252342, 2.489591, 1.309069, 0, 0, 0, 1, 1,
2.277584, 0.9795988, -0.1168677, 0, 0, 0, 1, 1,
2.302358, 0.466322, 2.527267, 0, 0, 0, 1, 1,
2.341993, 1.385361, 0.1431143, 0, 0, 0, 1, 1,
2.36287, 0.6370173, 2.89506, 0, 0, 0, 1, 1,
2.440104, 0.4295003, 1.226446, 1, 1, 1, 1, 1,
2.442486, 1.067809, -0.6636049, 1, 1, 1, 1, 1,
2.450922, -2.314917, 1.527881, 1, 1, 1, 1, 1,
2.633894, 0.7599946, 1.893738, 1, 1, 1, 1, 1,
2.679737, 0.04107548, 1.39985, 1, 1, 1, 1, 1,
2.875071, 0.05871138, 0.6154048, 1, 1, 1, 1, 1,
2.933294, -0.01434345, 3.086534, 1, 1, 1, 1, 1
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
var radius = 9.802086;
var distance = 34.42941;
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
mvMatrix.translate( 0.3741804, 0.0385108, -0.6095674 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.42941);
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
