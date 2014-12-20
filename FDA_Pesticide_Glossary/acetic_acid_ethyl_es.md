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
-2.742938, -0.1185594, 0.6288229, 1, 0, 0, 1,
-2.583747, -1.053237, -1.750548, 1, 0.007843138, 0, 1,
-2.491739, 0.2546777, -1.895188, 1, 0.01176471, 0, 1,
-2.481951, -0.3079242, -1.244507, 1, 0.01960784, 0, 1,
-2.311721, -0.4002005, -0.9035013, 1, 0.02352941, 0, 1,
-2.293159, -0.700622, -2.962665, 1, 0.03137255, 0, 1,
-2.242898, -0.9271045, -2.789315, 1, 0.03529412, 0, 1,
-2.241157, 1.814999, -1.561724, 1, 0.04313726, 0, 1,
-2.2309, -0.1484891, -1.484593, 1, 0.04705882, 0, 1,
-2.15023, -0.9690394, 0.41583, 1, 0.05490196, 0, 1,
-2.126711, 2.053714, -1.287475, 1, 0.05882353, 0, 1,
-2.113447, -0.9257247, -4.073225, 1, 0.06666667, 0, 1,
-2.108526, 1.440831, -0.3683832, 1, 0.07058824, 0, 1,
-2.106086, 2.655937, -1.658658, 1, 0.07843138, 0, 1,
-2.097216, 1.550937, 0.6175439, 1, 0.08235294, 0, 1,
-2.093394, 0.7035918, -0.5486062, 1, 0.09019608, 0, 1,
-2.009375, -0.9794685, 1.346456, 1, 0.09411765, 0, 1,
-1.991055, -1.284374, -2.836791, 1, 0.1019608, 0, 1,
-1.990459, -1.503937, -1.660765, 1, 0.1098039, 0, 1,
-1.989599, 1.753792, -0.729829, 1, 0.1137255, 0, 1,
-1.951826, -0.1682738, -1.188743, 1, 0.1215686, 0, 1,
-1.934054, -0.0856538, -1.711486, 1, 0.1254902, 0, 1,
-1.918719, -0.3270358, -2.852592, 1, 0.1333333, 0, 1,
-1.904478, 0.5404912, -0.8811496, 1, 0.1372549, 0, 1,
-1.900977, 0.2930437, -1.180054, 1, 0.145098, 0, 1,
-1.869374, 0.3755708, -2.457466, 1, 0.1490196, 0, 1,
-1.850831, 0.3879991, -2.313913, 1, 0.1568628, 0, 1,
-1.836556, 1.170827, -1.374469, 1, 0.1607843, 0, 1,
-1.815048, -2.109115, -2.339925, 1, 0.1686275, 0, 1,
-1.800722, -0.1743119, -2.983894, 1, 0.172549, 0, 1,
-1.784347, -1.129086, -2.529147, 1, 0.1803922, 0, 1,
-1.767506, -0.8880786, -2.24416, 1, 0.1843137, 0, 1,
-1.748856, -1.724434, -3.406482, 1, 0.1921569, 0, 1,
-1.739868, -0.3484183, -2.009784, 1, 0.1960784, 0, 1,
-1.732558, 0.4188217, -0.9438263, 1, 0.2039216, 0, 1,
-1.72808, -1.034283, -3.039642, 1, 0.2117647, 0, 1,
-1.716852, -0.1175142, -2.254351, 1, 0.2156863, 0, 1,
-1.687015, 0.6803227, -0.4141019, 1, 0.2235294, 0, 1,
-1.668492, 0.3905163, 0.4737335, 1, 0.227451, 0, 1,
-1.645227, -1.595486, -1.882488, 1, 0.2352941, 0, 1,
-1.641206, 0.0107275, -0.8385056, 1, 0.2392157, 0, 1,
-1.624662, 0.4976454, -0.6866784, 1, 0.2470588, 0, 1,
-1.623548, 0.5569214, -2.309304, 1, 0.2509804, 0, 1,
-1.61957, 0.3706525, -0.7127818, 1, 0.2588235, 0, 1,
-1.615622, -0.8017229, -2.61271, 1, 0.2627451, 0, 1,
-1.615371, 0.02259517, -2.615087, 1, 0.2705882, 0, 1,
-1.606423, -0.4574655, -1.764222, 1, 0.2745098, 0, 1,
-1.591616, 0.9063695, -0.4356612, 1, 0.282353, 0, 1,
-1.576681, -1.101894, -0.4732324, 1, 0.2862745, 0, 1,
-1.576636, -1.306714, -1.796132, 1, 0.2941177, 0, 1,
-1.557769, -0.8576783, -1.038671, 1, 0.3019608, 0, 1,
-1.548072, 1.611456, -0.9611722, 1, 0.3058824, 0, 1,
-1.541004, 0.5769156, -0.4605714, 1, 0.3137255, 0, 1,
-1.533656, 0.3947382, 1.033076, 1, 0.3176471, 0, 1,
-1.528586, 1.38931, -1.981582, 1, 0.3254902, 0, 1,
-1.528483, 0.03507281, -2.341924, 1, 0.3294118, 0, 1,
-1.527739, -0.05868638, -1.642121, 1, 0.3372549, 0, 1,
-1.523916, -0.3058409, -1.907888, 1, 0.3411765, 0, 1,
-1.518988, -1.24108, -1.660008, 1, 0.3490196, 0, 1,
-1.503799, 0.5254034, -2.032329, 1, 0.3529412, 0, 1,
-1.490724, -0.007359887, -1.248557, 1, 0.3607843, 0, 1,
-1.48859, -0.246273, -1.937523, 1, 0.3647059, 0, 1,
-1.478389, -2.963845, -2.565853, 1, 0.372549, 0, 1,
-1.478081, 1.382281, -0.5013707, 1, 0.3764706, 0, 1,
-1.477588, 1.214062, -1.57197, 1, 0.3843137, 0, 1,
-1.47039, 1.052793, -1.313136, 1, 0.3882353, 0, 1,
-1.468667, 0.3588408, -2.31949, 1, 0.3960784, 0, 1,
-1.456052, -1.689978, -2.850683, 1, 0.4039216, 0, 1,
-1.455686, 0.2315608, -2.052023, 1, 0.4078431, 0, 1,
-1.443113, 0.9838499, -1.011272, 1, 0.4156863, 0, 1,
-1.431748, -1.470739, -2.295733, 1, 0.4196078, 0, 1,
-1.421501, 0.4686596, -0.3907788, 1, 0.427451, 0, 1,
-1.42126, 0.5866691, 0.1206535, 1, 0.4313726, 0, 1,
-1.420383, -0.5088735, -1.749708, 1, 0.4392157, 0, 1,
-1.411146, 1.593312, -2.366172, 1, 0.4431373, 0, 1,
-1.409593, 0.7912118, -1.874445, 1, 0.4509804, 0, 1,
-1.408565, -0.9362845, -1.161626, 1, 0.454902, 0, 1,
-1.393036, 0.3836682, -1.001576, 1, 0.4627451, 0, 1,
-1.392647, -0.7091872, -2.107594, 1, 0.4666667, 0, 1,
-1.38883, 0.07088866, -0.8952926, 1, 0.4745098, 0, 1,
-1.386672, -0.8913664, -2.507497, 1, 0.4784314, 0, 1,
-1.377479, -0.6017769, -2.234317, 1, 0.4862745, 0, 1,
-1.376999, -0.2552344, -1.633881, 1, 0.4901961, 0, 1,
-1.351341, -1.050859, 0.09302083, 1, 0.4980392, 0, 1,
-1.346827, 0.5059744, -2.621369, 1, 0.5058824, 0, 1,
-1.345554, 0.05914035, -1.819508, 1, 0.509804, 0, 1,
-1.339035, -0.1548086, -3.286643, 1, 0.5176471, 0, 1,
-1.333444, 0.8771842, -1.107521, 1, 0.5215687, 0, 1,
-1.331398, 0.294704, -3.166296, 1, 0.5294118, 0, 1,
-1.330339, 0.3220249, -2.450397, 1, 0.5333334, 0, 1,
-1.322023, -0.08885026, -0.6886364, 1, 0.5411765, 0, 1,
-1.304458, 1.575668, -1.747439, 1, 0.5450981, 0, 1,
-1.303039, 0.8166001, -0.7525494, 1, 0.5529412, 0, 1,
-1.298768, -1.253736, -3.223303, 1, 0.5568628, 0, 1,
-1.293795, -0.5105129, -3.389559, 1, 0.5647059, 0, 1,
-1.289052, -0.1197117, -1.373841, 1, 0.5686275, 0, 1,
-1.2865, -1.261539, -2.492175, 1, 0.5764706, 0, 1,
-1.28213, -0.6711951, -2.930411, 1, 0.5803922, 0, 1,
-1.281635, 0.9443271, -1.270734, 1, 0.5882353, 0, 1,
-1.280589, -1.542111, -2.20094, 1, 0.5921569, 0, 1,
-1.269557, -0.9542009, -1.51477, 1, 0.6, 0, 1,
-1.265341, -0.1000475, -2.25349, 1, 0.6078432, 0, 1,
-1.265035, 2.42258, -2.410695, 1, 0.6117647, 0, 1,
-1.26001, 0.2270596, -0.6992962, 1, 0.6196079, 0, 1,
-1.257138, 1.539545, 0.2840407, 1, 0.6235294, 0, 1,
-1.249207, -0.3338974, -0.3977503, 1, 0.6313726, 0, 1,
-1.248888, -0.7025964, -1.617853, 1, 0.6352941, 0, 1,
-1.247073, 0.7024442, 0.61405, 1, 0.6431373, 0, 1,
-1.236696, -0.01493618, -2.497743, 1, 0.6470588, 0, 1,
-1.234842, 0.3661793, -2.027059, 1, 0.654902, 0, 1,
-1.233498, -0.605238, -1.518717, 1, 0.6588235, 0, 1,
-1.208647, -0.03420417, -1.037225, 1, 0.6666667, 0, 1,
-1.200819, 0.6295977, -1.759602, 1, 0.6705883, 0, 1,
-1.200625, -1.493349, -3.439495, 1, 0.6784314, 0, 1,
-1.19558, 1.571646, 0.4267455, 1, 0.682353, 0, 1,
-1.192443, -1.859872, -2.418159, 1, 0.6901961, 0, 1,
-1.188704, -1.651631, -2.823481, 1, 0.6941177, 0, 1,
-1.187814, 0.1414609, -2.595036, 1, 0.7019608, 0, 1,
-1.18654, -0.8250667, -0.8889136, 1, 0.7098039, 0, 1,
-1.175512, 0.4822787, -0.8519015, 1, 0.7137255, 0, 1,
-1.17191, 0.6409782, -0.560626, 1, 0.7215686, 0, 1,
-1.167651, 0.01864097, -0.7919225, 1, 0.7254902, 0, 1,
-1.164973, 1.093914, -1.432464, 1, 0.7333333, 0, 1,
-1.163264, -0.6005585, -2.211391, 1, 0.7372549, 0, 1,
-1.163245, 0.1979504, -2.207422, 1, 0.7450981, 0, 1,
-1.161363, -1.300019, -2.361721, 1, 0.7490196, 0, 1,
-1.157519, -1.808891, -1.415389, 1, 0.7568628, 0, 1,
-1.155655, 1.199953, 1.081404, 1, 0.7607843, 0, 1,
-1.155593, -0.4152184, -3.686222, 1, 0.7686275, 0, 1,
-1.153066, 1.43095, -0.0393588, 1, 0.772549, 0, 1,
-1.150177, 0.7342207, 0.1526508, 1, 0.7803922, 0, 1,
-1.149942, -0.9013389, -3.446148, 1, 0.7843137, 0, 1,
-1.137571, 0.3834902, -0.5361533, 1, 0.7921569, 0, 1,
-1.134117, 1.330605, -0.6608086, 1, 0.7960784, 0, 1,
-1.125962, 1.20288, -1.193853, 1, 0.8039216, 0, 1,
-1.121858, 0.004650246, -0.6249933, 1, 0.8117647, 0, 1,
-1.120944, -0.6216299, -0.7938268, 1, 0.8156863, 0, 1,
-1.11948, -0.04774439, -1.567576, 1, 0.8235294, 0, 1,
-1.119303, -0.1648814, -2.959809, 1, 0.827451, 0, 1,
-1.119047, 0.8065587, -0.488572, 1, 0.8352941, 0, 1,
-1.11588, -0.1628702, -0.3948033, 1, 0.8392157, 0, 1,
-1.104905, -0.4834827, -2.89076, 1, 0.8470588, 0, 1,
-1.104485, 0.1292439, -0.8822322, 1, 0.8509804, 0, 1,
-1.102229, -0.01721155, -0.08251751, 1, 0.8588235, 0, 1,
-1.097313, 0.5879032, -3.116316, 1, 0.8627451, 0, 1,
-1.096236, -0.2156173, -1.821676, 1, 0.8705882, 0, 1,
-1.082672, 1.853583, 0.4206735, 1, 0.8745098, 0, 1,
-1.08052, 0.02669504, -0.8586619, 1, 0.8823529, 0, 1,
-1.07886, 0.1340416, -2.596016, 1, 0.8862745, 0, 1,
-1.077099, -0.164406, -0.799321, 1, 0.8941177, 0, 1,
-1.074363, 0.1181228, -1.147262, 1, 0.8980392, 0, 1,
-1.074267, 0.393197, -0.4290344, 1, 0.9058824, 0, 1,
-1.068308, -1.695727, -3.12331, 1, 0.9137255, 0, 1,
-1.0658, -1.54867, -3.551626, 1, 0.9176471, 0, 1,
-1.061532, -0.5648113, -2.166834, 1, 0.9254902, 0, 1,
-1.051809, 0.3849121, -2.216849, 1, 0.9294118, 0, 1,
-1.039857, -0.5775765, -1.409156, 1, 0.9372549, 0, 1,
-1.036626, -1.138393, -1.982168, 1, 0.9411765, 0, 1,
-1.033611, 1.293351, 0.1594241, 1, 0.9490196, 0, 1,
-1.033564, 2.392369, -0.4650739, 1, 0.9529412, 0, 1,
-1.030576, -0.7774115, -2.133915, 1, 0.9607843, 0, 1,
-1.027527, -0.5144314, -4.539454, 1, 0.9647059, 0, 1,
-1.02087, -1.857583, -0.1166503, 1, 0.972549, 0, 1,
-1.020741, -1.796781, -2.337408, 1, 0.9764706, 0, 1,
-1.009606, 0.4733925, 0.7916335, 1, 0.9843137, 0, 1,
-1.008944, 0.5836436, -1.804165, 1, 0.9882353, 0, 1,
-1.008397, 0.6917877, -0.4307296, 1, 0.9960784, 0, 1,
-1.007161, -1.044359, -3.820181, 0.9960784, 1, 0, 1,
-0.9914115, -0.1786018, -1.127283, 0.9921569, 1, 0, 1,
-0.9860983, -0.2378079, -1.00513, 0.9843137, 1, 0, 1,
-0.9788228, -1.598232, -2.263272, 0.9803922, 1, 0, 1,
-0.9775761, 0.5618353, -0.2354351, 0.972549, 1, 0, 1,
-0.9695547, 0.7922979, 0.5882794, 0.9686275, 1, 0, 1,
-0.96259, 1.367847, -0.3589424, 0.9607843, 1, 0, 1,
-0.96116, 0.4477156, -0.5405095, 0.9568627, 1, 0, 1,
-0.9573267, -0.4129321, 0.4065894, 0.9490196, 1, 0, 1,
-0.952111, 0.6425958, -1.828335, 0.945098, 1, 0, 1,
-0.9450386, -1.032359, -0.4977346, 0.9372549, 1, 0, 1,
-0.9439312, -2.396607, -2.797457, 0.9333333, 1, 0, 1,
-0.9397121, 1.247904, -0.4453356, 0.9254902, 1, 0, 1,
-0.9298381, -1.010913, -2.385514, 0.9215686, 1, 0, 1,
-0.9258793, 1.20253, 0.5790902, 0.9137255, 1, 0, 1,
-0.9217626, -0.4695953, -0.5927112, 0.9098039, 1, 0, 1,
-0.9133823, 2.578551, 0.2518005, 0.9019608, 1, 0, 1,
-0.9046665, -0.4373585, -1.608263, 0.8941177, 1, 0, 1,
-0.8966785, 1.729294, -1.034458, 0.8901961, 1, 0, 1,
-0.8962275, -0.9175615, -4.550715, 0.8823529, 1, 0, 1,
-0.8928446, 0.6469364, -0.1058853, 0.8784314, 1, 0, 1,
-0.8884834, -0.3053257, -1.432195, 0.8705882, 1, 0, 1,
-0.8825202, -0.3287429, -1.158762, 0.8666667, 1, 0, 1,
-0.8798539, -0.5781553, -1.285992, 0.8588235, 1, 0, 1,
-0.8778017, 0.9457, 0.3959623, 0.854902, 1, 0, 1,
-0.8700005, 1.339575, -0.9480833, 0.8470588, 1, 0, 1,
-0.867339, 1.302414, -0.6844978, 0.8431373, 1, 0, 1,
-0.8671643, -0.3927267, -2.392674, 0.8352941, 1, 0, 1,
-0.8623244, -1.848984, -2.756425, 0.8313726, 1, 0, 1,
-0.8623065, -0.7505723, -3.070316, 0.8235294, 1, 0, 1,
-0.8584475, -2.029968, -3.1009, 0.8196079, 1, 0, 1,
-0.8569244, -0.648165, -2.491397, 0.8117647, 1, 0, 1,
-0.856415, 0.08818841, -1.93544, 0.8078431, 1, 0, 1,
-0.8504551, 1.365585, 0.9760814, 0.8, 1, 0, 1,
-0.8452586, -0.2317933, -2.488373, 0.7921569, 1, 0, 1,
-0.8441805, -0.9163976, -3.843378, 0.7882353, 1, 0, 1,
-0.843146, 0.4500484, -2.22508, 0.7803922, 1, 0, 1,
-0.822458, 0.6557941, -1.122697, 0.7764706, 1, 0, 1,
-0.8192374, 1.246501, 1.038099, 0.7686275, 1, 0, 1,
-0.818769, -1.540223, -3.169044, 0.7647059, 1, 0, 1,
-0.8113111, 0.07089673, 1.018104, 0.7568628, 1, 0, 1,
-0.8085285, 0.2698915, -1.017965, 0.7529412, 1, 0, 1,
-0.8077443, -0.9869525, -3.437907, 0.7450981, 1, 0, 1,
-0.8030428, 0.06355584, 1.044389, 0.7411765, 1, 0, 1,
-0.8019971, 0.05267336, -1.269949, 0.7333333, 1, 0, 1,
-0.8009678, 0.1345749, -0.09691501, 0.7294118, 1, 0, 1,
-0.7890221, 0.7078081, 0.1322289, 0.7215686, 1, 0, 1,
-0.7835165, 0.9069332, -0.9786887, 0.7176471, 1, 0, 1,
-0.7815937, -0.6843004, -0.6017409, 0.7098039, 1, 0, 1,
-0.7773644, -1.828117, -4.284019, 0.7058824, 1, 0, 1,
-0.7758371, -0.3777524, -1.819118, 0.6980392, 1, 0, 1,
-0.7730708, -0.5638189, -2.316779, 0.6901961, 1, 0, 1,
-0.7692269, 0.7965145, -0.7209402, 0.6862745, 1, 0, 1,
-0.7682079, -1.00201, -3.503843, 0.6784314, 1, 0, 1,
-0.7650765, 0.3048034, -1.03128, 0.6745098, 1, 0, 1,
-0.7643956, 0.3979563, -0.6350123, 0.6666667, 1, 0, 1,
-0.7577776, 0.6261768, -0.371883, 0.6627451, 1, 0, 1,
-0.7553627, -0.4031866, -2.46683, 0.654902, 1, 0, 1,
-0.750335, -3.045862, -2.609041, 0.6509804, 1, 0, 1,
-0.7484354, -0.669085, -0.8266025, 0.6431373, 1, 0, 1,
-0.7416322, -0.772064, -1.971157, 0.6392157, 1, 0, 1,
-0.7334232, 1.451345, -0.8369553, 0.6313726, 1, 0, 1,
-0.7312752, 0.04149339, -2.00247, 0.627451, 1, 0, 1,
-0.7301174, -1.380848, -3.119394, 0.6196079, 1, 0, 1,
-0.7250986, 0.5585735, -0.9115915, 0.6156863, 1, 0, 1,
-0.7245587, -1.121203, -2.458294, 0.6078432, 1, 0, 1,
-0.7237673, -0.614139, -3.019431, 0.6039216, 1, 0, 1,
-0.7212614, -0.5659202, -4.603823, 0.5960785, 1, 0, 1,
-0.7208115, -0.1743718, -0.4198416, 0.5882353, 1, 0, 1,
-0.7161041, -0.7677561, -2.96418, 0.5843138, 1, 0, 1,
-0.7127444, 0.3477847, -1.297249, 0.5764706, 1, 0, 1,
-0.7110745, -0.4012816, -1.435163, 0.572549, 1, 0, 1,
-0.710601, -0.8188853, -3.671055, 0.5647059, 1, 0, 1,
-0.7095185, 1.347134, -0.6430216, 0.5607843, 1, 0, 1,
-0.7081532, -0.4372735, -2.30852, 0.5529412, 1, 0, 1,
-0.7059051, 0.001254181, -2.104443, 0.5490196, 1, 0, 1,
-0.7032634, 0.5943438, -2.983462, 0.5411765, 1, 0, 1,
-0.7018877, -0.4196342, -1.762783, 0.5372549, 1, 0, 1,
-0.7004406, -0.2712432, -0.4895608, 0.5294118, 1, 0, 1,
-0.6829534, 0.2389665, -1.560757, 0.5254902, 1, 0, 1,
-0.6824776, 0.5072423, -2.518423, 0.5176471, 1, 0, 1,
-0.6810053, -0.350408, -2.082381, 0.5137255, 1, 0, 1,
-0.6796528, 0.8292197, 0.07635461, 0.5058824, 1, 0, 1,
-0.678879, 1.460236, -1.915484, 0.5019608, 1, 0, 1,
-0.6742774, 1.110604, -0.8911182, 0.4941176, 1, 0, 1,
-0.6684535, -0.7121826, -2.658454, 0.4862745, 1, 0, 1,
-0.6674022, 0.3469173, -1.419559, 0.4823529, 1, 0, 1,
-0.6624225, 1.649446, -0.3593974, 0.4745098, 1, 0, 1,
-0.6617683, -1.704622, -3.83015, 0.4705882, 1, 0, 1,
-0.6575899, 0.3734833, -0.4280919, 0.4627451, 1, 0, 1,
-0.6564663, -0.8166336, -3.742143, 0.4588235, 1, 0, 1,
-0.6548611, -0.4656172, -2.425743, 0.4509804, 1, 0, 1,
-0.6547038, 0.6893799, -0.317211, 0.4470588, 1, 0, 1,
-0.6513723, 1.303842, -0.06986916, 0.4392157, 1, 0, 1,
-0.6505671, 0.7347613, -0.6103653, 0.4352941, 1, 0, 1,
-0.649007, 0.9262542, -0.9916961, 0.427451, 1, 0, 1,
-0.6469288, 1.577201, -0.7103446, 0.4235294, 1, 0, 1,
-0.6452634, 0.1310748, -1.350986, 0.4156863, 1, 0, 1,
-0.6431429, -1.340887, -1.823401, 0.4117647, 1, 0, 1,
-0.6429445, -0.01419566, -2.325734, 0.4039216, 1, 0, 1,
-0.6387696, -1.566058, -2.199581, 0.3960784, 1, 0, 1,
-0.6378455, 0.7007247, -1.016592, 0.3921569, 1, 0, 1,
-0.6375713, -0.1099082, -2.578548, 0.3843137, 1, 0, 1,
-0.6367061, -0.5135934, -2.496015, 0.3803922, 1, 0, 1,
-0.6347661, 0.5460048, 0.7664996, 0.372549, 1, 0, 1,
-0.63439, -1.49078, -2.441427, 0.3686275, 1, 0, 1,
-0.6307164, -0.5633603, -3.091235, 0.3607843, 1, 0, 1,
-0.6277167, 0.3627783, -1.271581, 0.3568628, 1, 0, 1,
-0.623597, -0.7836336, -3.05981, 0.3490196, 1, 0, 1,
-0.6220858, 0.3413031, -1.457813, 0.345098, 1, 0, 1,
-0.6204002, -3.328767, -0.436572, 0.3372549, 1, 0, 1,
-0.6200576, -0.4732816, -1.893523, 0.3333333, 1, 0, 1,
-0.6181852, -0.6376426, -2.353342, 0.3254902, 1, 0, 1,
-0.6169034, 2.65147, 0.2014064, 0.3215686, 1, 0, 1,
-0.6166126, 0.08522647, -0.7291795, 0.3137255, 1, 0, 1,
-0.6103815, 0.6717849, -0.6905112, 0.3098039, 1, 0, 1,
-0.6101969, -2.096097, -2.373984, 0.3019608, 1, 0, 1,
-0.608662, 0.8382511, 0.2461812, 0.2941177, 1, 0, 1,
-0.6067289, -2.054901, -2.799054, 0.2901961, 1, 0, 1,
-0.6048024, -0.6102508, -4.149734, 0.282353, 1, 0, 1,
-0.6040807, -0.4289168, -2.051594, 0.2784314, 1, 0, 1,
-0.5994873, 0.2201974, -1.918863, 0.2705882, 1, 0, 1,
-0.5930696, 2.390458, -0.5481821, 0.2666667, 1, 0, 1,
-0.593059, 1.504782, 0.1732675, 0.2588235, 1, 0, 1,
-0.5869259, 0.5162804, -1.889444, 0.254902, 1, 0, 1,
-0.5866307, -0.9966332, -2.44168, 0.2470588, 1, 0, 1,
-0.5848622, 0.7015322, -1.272837, 0.2431373, 1, 0, 1,
-0.5827932, 1.572112, -0.6870788, 0.2352941, 1, 0, 1,
-0.5817779, 0.2936186, -0.2569699, 0.2313726, 1, 0, 1,
-0.5784322, -1.112047, -1.834608, 0.2235294, 1, 0, 1,
-0.5727782, -1.639485, -3.280049, 0.2196078, 1, 0, 1,
-0.5650953, -2.88659, -3.193692, 0.2117647, 1, 0, 1,
-0.5595906, -0.9655185, -0.5187522, 0.2078431, 1, 0, 1,
-0.5591733, 0.5188366, 0.3800355, 0.2, 1, 0, 1,
-0.5532845, 1.260101, -2.217271, 0.1921569, 1, 0, 1,
-0.5468241, 1.640966, 0.3915753, 0.1882353, 1, 0, 1,
-0.5465932, 1.873134, 0.6415013, 0.1803922, 1, 0, 1,
-0.5373977, 1.069016, -0.8086218, 0.1764706, 1, 0, 1,
-0.5367613, 0.5314674, -1.214386, 0.1686275, 1, 0, 1,
-0.5365117, 0.0445496, -1.036327, 0.1647059, 1, 0, 1,
-0.5332506, -0.08518957, -0.4001858, 0.1568628, 1, 0, 1,
-0.5295593, 0.9040878, -0.5740901, 0.1529412, 1, 0, 1,
-0.5281528, -2.019694, -2.394862, 0.145098, 1, 0, 1,
-0.5280574, -0.8929328, -3.200024, 0.1411765, 1, 0, 1,
-0.5217806, -1.635276, -3.050579, 0.1333333, 1, 0, 1,
-0.5116415, 1.195672, -1.407246, 0.1294118, 1, 0, 1,
-0.5116278, 0.6557003, -0.3617206, 0.1215686, 1, 0, 1,
-0.5104141, -0.4932937, -1.231604, 0.1176471, 1, 0, 1,
-0.5068071, 0.2585966, -1.812648, 0.1098039, 1, 0, 1,
-0.4910309, 0.1694709, -0.9628432, 0.1058824, 1, 0, 1,
-0.4842114, 0.469284, -2.284647, 0.09803922, 1, 0, 1,
-0.4837629, -1.930729, -0.8638207, 0.09019608, 1, 0, 1,
-0.4804845, 0.5219743, 2.20499, 0.08627451, 1, 0, 1,
-0.4791749, -0.1889726, -2.816014, 0.07843138, 1, 0, 1,
-0.4785841, 2.081979, 0.4944599, 0.07450981, 1, 0, 1,
-0.474094, 0.5039647, -1.428268, 0.06666667, 1, 0, 1,
-0.4723517, -0.8422195, -1.839503, 0.0627451, 1, 0, 1,
-0.4704584, -1.206517, -2.429158, 0.05490196, 1, 0, 1,
-0.4681644, -0.2382029, -3.285396, 0.05098039, 1, 0, 1,
-0.4669653, 0.0512203, -1.26351, 0.04313726, 1, 0, 1,
-0.4668186, 1.591926, -0.7377075, 0.03921569, 1, 0, 1,
-0.4605917, -1.277832, -0.629304, 0.03137255, 1, 0, 1,
-0.4577798, 0.7946866, 0.6888942, 0.02745098, 1, 0, 1,
-0.4557436, -1.634682, -1.965892, 0.01960784, 1, 0, 1,
-0.454259, 0.6174755, 0.3391427, 0.01568628, 1, 0, 1,
-0.4494434, 0.8045533, -1.722774, 0.007843138, 1, 0, 1,
-0.4443665, 0.8084258, -0.7004675, 0.003921569, 1, 0, 1,
-0.4344492, 1.510009, -1.376331, 0, 1, 0.003921569, 1,
-0.4339332, 0.5867192, -0.2074364, 0, 1, 0.01176471, 1,
-0.431917, 0.1308069, -2.229168, 0, 1, 0.01568628, 1,
-0.4295644, -1.102453, -2.463102, 0, 1, 0.02352941, 1,
-0.4268366, 1.560607, -1.515435, 0, 1, 0.02745098, 1,
-0.4257375, -1.040035, -1.981029, 0, 1, 0.03529412, 1,
-0.4216738, -0.3752455, -3.24753, 0, 1, 0.03921569, 1,
-0.417845, 1.509683, -0.7486315, 0, 1, 0.04705882, 1,
-0.417593, 0.4092401, -1.570316, 0, 1, 0.05098039, 1,
-0.415846, 0.7106556, -1.936821, 0, 1, 0.05882353, 1,
-0.4142847, 1.014799, -1.193578, 0, 1, 0.0627451, 1,
-0.400304, -0.8195119, -3.811574, 0, 1, 0.07058824, 1,
-0.3939047, -0.6013415, -2.968783, 0, 1, 0.07450981, 1,
-0.3926254, -1.615002, -2.941516, 0, 1, 0.08235294, 1,
-0.3853356, -1.402319, -3.756939, 0, 1, 0.08627451, 1,
-0.3752062, -0.4975885, -2.105523, 0, 1, 0.09411765, 1,
-0.3751916, 1.19654, 0.4371784, 0, 1, 0.1019608, 1,
-0.374485, 0.874828, -1.671974, 0, 1, 0.1058824, 1,
-0.373742, -1.37729, -4.499533, 0, 1, 0.1137255, 1,
-0.3624924, 2.796839, 0.08057907, 0, 1, 0.1176471, 1,
-0.3617898, 0.9632843, -1.893129, 0, 1, 0.1254902, 1,
-0.361583, 1.270556, -1.468323, 0, 1, 0.1294118, 1,
-0.358139, 0.2537802, -2.377743, 0, 1, 0.1372549, 1,
-0.3577676, -0.5714967, -3.235994, 0, 1, 0.1411765, 1,
-0.3576171, 0.782627, 0.9267474, 0, 1, 0.1490196, 1,
-0.3553094, 1.01334, 0.587525, 0, 1, 0.1529412, 1,
-0.3543293, -0.2319201, -2.42178, 0, 1, 0.1607843, 1,
-0.3530468, -1.352604, -4.054429, 0, 1, 0.1647059, 1,
-0.3513178, -0.1438673, -3.140184, 0, 1, 0.172549, 1,
-0.3512191, 0.4164862, -0.3339532, 0, 1, 0.1764706, 1,
-0.3490438, -1.448845, -1.950197, 0, 1, 0.1843137, 1,
-0.3477508, -1.164047, -1.696923, 0, 1, 0.1882353, 1,
-0.3475033, -1.348887, -2.255672, 0, 1, 0.1960784, 1,
-0.3433687, 1.110808, 0.2860669, 0, 1, 0.2039216, 1,
-0.3359732, -0.5770849, -2.066396, 0, 1, 0.2078431, 1,
-0.335097, 0.871295, 0.7607474, 0, 1, 0.2156863, 1,
-0.3299556, 0.3336295, 0.156499, 0, 1, 0.2196078, 1,
-0.3294793, 1.190376, -1.426685, 0, 1, 0.227451, 1,
-0.3283106, 0.5556132, -0.5260634, 0, 1, 0.2313726, 1,
-0.3282481, 0.4716801, -0.3039345, 0, 1, 0.2392157, 1,
-0.3271752, -0.2037786, -0.9376609, 0, 1, 0.2431373, 1,
-0.3254744, 0.2425665, -0.6241499, 0, 1, 0.2509804, 1,
-0.3224439, 1.875751, 0.1360677, 0, 1, 0.254902, 1,
-0.3134904, 0.341034, -1.396785, 0, 1, 0.2627451, 1,
-0.3114269, 0.535995, -2.480734, 0, 1, 0.2666667, 1,
-0.3079235, -1.471121, -1.876086, 0, 1, 0.2745098, 1,
-0.3065243, 0.5232961, -1.252309, 0, 1, 0.2784314, 1,
-0.3024, -0.2810557, -2.633444, 0, 1, 0.2862745, 1,
-0.3013597, 0.01971588, -1.731735, 0, 1, 0.2901961, 1,
-0.2983418, -1.45307, -2.879054, 0, 1, 0.2980392, 1,
-0.2959861, -0.363439, -1.171201, 0, 1, 0.3058824, 1,
-0.2952085, -0.1336872, -2.852927, 0, 1, 0.3098039, 1,
-0.2922406, 1.733979, 0.0105675, 0, 1, 0.3176471, 1,
-0.2909078, -0.786957, -3.3966, 0, 1, 0.3215686, 1,
-0.2908016, 0.1688941, -0.05125164, 0, 1, 0.3294118, 1,
-0.2874922, -0.1537454, -3.404098, 0, 1, 0.3333333, 1,
-0.2863473, 0.3254019, -2.430008, 0, 1, 0.3411765, 1,
-0.2853267, -1.98236, -3.677391, 0, 1, 0.345098, 1,
-0.2812896, 0.5332522, 0.6407851, 0, 1, 0.3529412, 1,
-0.279936, -1.506025, -3.616514, 0, 1, 0.3568628, 1,
-0.2760406, -1.611064, -1.919367, 0, 1, 0.3647059, 1,
-0.2683987, 1.281611, 1.286347, 0, 1, 0.3686275, 1,
-0.2675992, -2.057025, -3.81614, 0, 1, 0.3764706, 1,
-0.261694, -0.1862208, -2.268411, 0, 1, 0.3803922, 1,
-0.2595665, 0.06437331, -2.930679, 0, 1, 0.3882353, 1,
-0.2576649, -0.1168581, -1.022286, 0, 1, 0.3921569, 1,
-0.2559499, -1.875793, -4.733536, 0, 1, 0.4, 1,
-0.2555164, -1.294282, -1.15591, 0, 1, 0.4078431, 1,
-0.2531388, 0.1703459, -1.541788, 0, 1, 0.4117647, 1,
-0.2521589, 1.133047, 0.5845015, 0, 1, 0.4196078, 1,
-0.2480581, -3.312659, -3.9325, 0, 1, 0.4235294, 1,
-0.2459403, 0.2864198, -0.2916861, 0, 1, 0.4313726, 1,
-0.245225, 0.2797548, -0.9717286, 0, 1, 0.4352941, 1,
-0.2440854, -0.01777997, -0.9384018, 0, 1, 0.4431373, 1,
-0.2413785, 0.2901668, -1.476272, 0, 1, 0.4470588, 1,
-0.2410858, 1.282729, -0.9262416, 0, 1, 0.454902, 1,
-0.2406305, 0.5110387, -1.078751, 0, 1, 0.4588235, 1,
-0.2382467, -0.2007988, -3.094222, 0, 1, 0.4666667, 1,
-0.2319094, -0.8755383, -0.9847891, 0, 1, 0.4705882, 1,
-0.2303779, -0.9250143, -4.428955, 0, 1, 0.4784314, 1,
-0.2275244, -1.64298, -3.798427, 0, 1, 0.4823529, 1,
-0.2266863, 0.1040289, -1.35384, 0, 1, 0.4901961, 1,
-0.2254955, -0.614322, -2.147494, 0, 1, 0.4941176, 1,
-0.2233004, -1.808904, -1.457547, 0, 1, 0.5019608, 1,
-0.2217869, -0.6473991, -2.99019, 0, 1, 0.509804, 1,
-0.2183969, 1.439066, 2.224057, 0, 1, 0.5137255, 1,
-0.2163957, 0.9076186, -1.277501, 0, 1, 0.5215687, 1,
-0.2123942, -0.6814897, -2.513826, 0, 1, 0.5254902, 1,
-0.2082536, -0.4387338, -3.062395, 0, 1, 0.5333334, 1,
-0.2022067, -1.104244, -3.68597, 0, 1, 0.5372549, 1,
-0.2017301, -0.1734298, -2.177189, 0, 1, 0.5450981, 1,
-0.2016875, 0.3787889, -2.962448, 0, 1, 0.5490196, 1,
-0.1983715, -0.7822793, -2.715745, 0, 1, 0.5568628, 1,
-0.1954587, 0.1587911, -1.402855, 0, 1, 0.5607843, 1,
-0.1923427, -1.811317, -1.988343, 0, 1, 0.5686275, 1,
-0.1921926, 0.08564153, -1.740937, 0, 1, 0.572549, 1,
-0.1896083, 0.8749308, -0.01159722, 0, 1, 0.5803922, 1,
-0.1895723, -0.1973202, -2.06533, 0, 1, 0.5843138, 1,
-0.1886316, -0.9236123, -2.868851, 0, 1, 0.5921569, 1,
-0.1879679, 0.1446391, -0.5312642, 0, 1, 0.5960785, 1,
-0.1852462, 0.77523, 0.03728873, 0, 1, 0.6039216, 1,
-0.1823273, -0.3007879, -2.164822, 0, 1, 0.6117647, 1,
-0.1802838, -0.7894707, -3.247169, 0, 1, 0.6156863, 1,
-0.1789107, 0.7215911, 0.2981595, 0, 1, 0.6235294, 1,
-0.1740343, 0.1511595, -2.042582, 0, 1, 0.627451, 1,
-0.1727893, -0.2518763, -2.554208, 0, 1, 0.6352941, 1,
-0.1721576, -0.1571305, -1.248013, 0, 1, 0.6392157, 1,
-0.169682, 1.469918, 1.49323, 0, 1, 0.6470588, 1,
-0.1674449, -1.756653, -3.719433, 0, 1, 0.6509804, 1,
-0.1634184, 0.8485715, 0.5645475, 0, 1, 0.6588235, 1,
-0.16098, -1.258183, -3.168304, 0, 1, 0.6627451, 1,
-0.1571106, 1.541653, 1.234761, 0, 1, 0.6705883, 1,
-0.1569795, -0.7376022, -3.983552, 0, 1, 0.6745098, 1,
-0.1526107, 0.7536215, -0.3959253, 0, 1, 0.682353, 1,
-0.1500593, -1.570982, -1.363169, 0, 1, 0.6862745, 1,
-0.1434592, -1.385868, -3.23706, 0, 1, 0.6941177, 1,
-0.1433063, -0.7663436, -3.39241, 0, 1, 0.7019608, 1,
-0.1412493, -0.6173995, -3.077765, 0, 1, 0.7058824, 1,
-0.140952, 0.3746065, -0.5933578, 0, 1, 0.7137255, 1,
-0.1406778, -0.02919228, -1.946839, 0, 1, 0.7176471, 1,
-0.134287, 0.3584989, 2.36802, 0, 1, 0.7254902, 1,
-0.133239, -0.2957238, -1.348387, 0, 1, 0.7294118, 1,
-0.1307948, -0.7812976, -4.097557, 0, 1, 0.7372549, 1,
-0.1299386, 1.089049, -2.966562, 0, 1, 0.7411765, 1,
-0.1294253, 0.9793959, -0.6222878, 0, 1, 0.7490196, 1,
-0.1274973, -0.2190365, -2.410797, 0, 1, 0.7529412, 1,
-0.1264253, -0.8014331, -3.380836, 0, 1, 0.7607843, 1,
-0.1149084, -0.7824242, -2.664093, 0, 1, 0.7647059, 1,
-0.1118024, 1.817976, -2.111181, 0, 1, 0.772549, 1,
-0.1115504, -0.1856761, -4.299955, 0, 1, 0.7764706, 1,
-0.1107326, -0.6724904, -2.630499, 0, 1, 0.7843137, 1,
-0.1106517, 1.340203, 1.393608, 0, 1, 0.7882353, 1,
-0.1053405, 0.9409835, 0.3440349, 0, 1, 0.7960784, 1,
-0.1047601, 0.4329146, -0.9105132, 0, 1, 0.8039216, 1,
-0.1006914, -1.895425, -3.52423, 0, 1, 0.8078431, 1,
-0.09931174, -0.7447614, -2.924485, 0, 1, 0.8156863, 1,
-0.09847066, 0.8708448, 0.8885308, 0, 1, 0.8196079, 1,
-0.09166123, -0.3421541, -3.934521, 0, 1, 0.827451, 1,
-0.08766076, 1.142002, 0.8590986, 0, 1, 0.8313726, 1,
-0.08734229, 0.5959939, 1.271614, 0, 1, 0.8392157, 1,
-0.08672139, 1.763987, -1.163407, 0, 1, 0.8431373, 1,
-0.08636822, 0.5312887, -0.4218429, 0, 1, 0.8509804, 1,
-0.08471837, -0.5367609, -3.878511, 0, 1, 0.854902, 1,
-0.07877137, 0.7864482, 0.4560693, 0, 1, 0.8627451, 1,
-0.07511453, 0.1332161, -0.1626381, 0, 1, 0.8666667, 1,
-0.0747648, 0.9858978, -0.6211749, 0, 1, 0.8745098, 1,
-0.07367364, 1.364373, -0.2167579, 0, 1, 0.8784314, 1,
-0.07239007, -0.9446272, -3.70655, 0, 1, 0.8862745, 1,
-0.07113098, 2.182638, 1.000452, 0, 1, 0.8901961, 1,
-0.06873465, 0.001054715, -1.872705, 0, 1, 0.8980392, 1,
-0.0638366, 0.1461798, 1.20616, 0, 1, 0.9058824, 1,
-0.06164452, -0.2839625, -2.648403, 0, 1, 0.9098039, 1,
-0.05897709, 0.2264064, 1.693778, 0, 1, 0.9176471, 1,
-0.0571552, -0.8748031, -2.772763, 0, 1, 0.9215686, 1,
-0.05481159, 0.8060967, 0.0787132, 0, 1, 0.9294118, 1,
-0.05395618, -2.519273, -3.006959, 0, 1, 0.9333333, 1,
-0.05173231, 0.1399949, -0.1158451, 0, 1, 0.9411765, 1,
-0.0427396, 0.2686549, -0.3619422, 0, 1, 0.945098, 1,
-0.03866946, 1.326693, 1.384532, 0, 1, 0.9529412, 1,
-0.0384919, 0.1535866, -0.5467078, 0, 1, 0.9568627, 1,
-0.03510129, 1.115155, -1.958608, 0, 1, 0.9647059, 1,
-0.034893, -0.7986228, -4.315971, 0, 1, 0.9686275, 1,
-0.03221139, -0.1155845, -2.37207, 0, 1, 0.9764706, 1,
-0.02794612, 0.3806339, 0.5274337, 0, 1, 0.9803922, 1,
-0.02744981, -0.9449947, -2.310783, 0, 1, 0.9882353, 1,
-0.02688393, -0.7062603, -2.911865, 0, 1, 0.9921569, 1,
-0.02682756, -0.3829333, -2.493136, 0, 1, 1, 1,
-0.02345948, 0.5983471, 0.6840737, 0, 0.9921569, 1, 1,
-0.02187701, 1.42977, -0.7917039, 0, 0.9882353, 1, 1,
-0.02015719, -0.9637091, -3.197295, 0, 0.9803922, 1, 1,
-0.01920215, -1.521138, -1.246791, 0, 0.9764706, 1, 1,
-0.01608843, 0.0280032, -0.2258864, 0, 0.9686275, 1, 1,
-0.01186887, -0.1782793, -3.174904, 0, 0.9647059, 1, 1,
-0.01077992, 0.5473063, 1.795265, 0, 0.9568627, 1, 1,
-0.01069488, -0.1902609, -4.219861, 0, 0.9529412, 1, 1,
-0.01020094, 0.4196149, 0.006838094, 0, 0.945098, 1, 1,
-0.009719852, -1.388639, -2.600363, 0, 0.9411765, 1, 1,
-0.009111587, -0.2376017, -2.861609, 0, 0.9333333, 1, 1,
-0.008353711, 1.504121, -0.05779563, 0, 0.9294118, 1, 1,
-0.007777915, -0.2993969, -5.053834, 0, 0.9215686, 1, 1,
-0.007600458, -0.8179498, -3.581418, 0, 0.9176471, 1, 1,
-0.003606374, -0.2449234, -2.505655, 0, 0.9098039, 1, 1,
1.139526e-05, -0.1549125, 2.721637, 0, 0.9058824, 1, 1,
0.006515037, 1.45708, -1.825248, 0, 0.8980392, 1, 1,
0.006558737, -0.4446929, 3.800721, 0, 0.8901961, 1, 1,
0.01989617, -0.911517, 3.155081, 0, 0.8862745, 1, 1,
0.02560126, 0.9312416, -1.041642, 0, 0.8784314, 1, 1,
0.02743566, 1.206107, -0.4124878, 0, 0.8745098, 1, 1,
0.03366261, -0.4507937, 2.603391, 0, 0.8666667, 1, 1,
0.03536496, 0.1725726, -0.03891709, 0, 0.8627451, 1, 1,
0.03958233, -0.04551448, 3.448084, 0, 0.854902, 1, 1,
0.04121259, 0.07054906, -0.8006813, 0, 0.8509804, 1, 1,
0.04368963, -0.4709217, 0.5186414, 0, 0.8431373, 1, 1,
0.0447729, 0.3358573, 0.3724047, 0, 0.8392157, 1, 1,
0.04720034, -1.182168, 4.192926, 0, 0.8313726, 1, 1,
0.05379108, -0.2889787, 3.196023, 0, 0.827451, 1, 1,
0.05867418, -0.4062766, 3.312627, 0, 0.8196079, 1, 1,
0.05972608, -1.445633, 2.678424, 0, 0.8156863, 1, 1,
0.06194184, -0.9796586, 2.568538, 0, 0.8078431, 1, 1,
0.06689949, 0.5211207, 0.2116242, 0, 0.8039216, 1, 1,
0.06926019, 1.140691, 0.8318702, 0, 0.7960784, 1, 1,
0.07928646, -1.068181, 3.530941, 0, 0.7882353, 1, 1,
0.08128215, 0.7735927, 1.765383, 0, 0.7843137, 1, 1,
0.08535934, 1.058627, 0.03530085, 0, 0.7764706, 1, 1,
0.09015331, -0.7645619, 2.969578, 0, 0.772549, 1, 1,
0.09158204, 1.350947, 1.661355, 0, 0.7647059, 1, 1,
0.09365922, 1.25311, -0.8260289, 0, 0.7607843, 1, 1,
0.09475634, -1.880507, 1.951478, 0, 0.7529412, 1, 1,
0.09992711, -0.4190224, 2.236482, 0, 0.7490196, 1, 1,
0.1008508, 0.7946677, 0.2873339, 0, 0.7411765, 1, 1,
0.1022993, -1.070183, 0.3752883, 0, 0.7372549, 1, 1,
0.1051493, -0.7728542, 3.404975, 0, 0.7294118, 1, 1,
0.1079825, 0.06648204, 1.055664, 0, 0.7254902, 1, 1,
0.1081435, 0.9042169, 0.9440798, 0, 0.7176471, 1, 1,
0.1128134, 0.3266938, 0.6141458, 0, 0.7137255, 1, 1,
0.1242516, 0.4867913, 0.6548107, 0, 0.7058824, 1, 1,
0.1249386, -0.7020344, 4.840681, 0, 0.6980392, 1, 1,
0.1253108, 0.4432489, -0.4261629, 0, 0.6941177, 1, 1,
0.1282396, 0.1151923, 0.5047235, 0, 0.6862745, 1, 1,
0.132348, 0.444593, 0.4307571, 0, 0.682353, 1, 1,
0.1342577, 1.500832, -0.6102326, 0, 0.6745098, 1, 1,
0.1348816, 0.2109389, 0.497874, 0, 0.6705883, 1, 1,
0.1357125, -0.9396722, 4.215641, 0, 0.6627451, 1, 1,
0.1365696, 0.0194978, 0.5208627, 0, 0.6588235, 1, 1,
0.1454711, -0.4405163, 3.007315, 0, 0.6509804, 1, 1,
0.1463655, -0.5686408, 3.78663, 0, 0.6470588, 1, 1,
0.1493128, -1.314009, 2.740299, 0, 0.6392157, 1, 1,
0.15178, -0.4970946, 2.730475, 0, 0.6352941, 1, 1,
0.153978, 2.238421, 1.24748, 0, 0.627451, 1, 1,
0.156333, 1.562233, 1.97084, 0, 0.6235294, 1, 1,
0.1589521, 0.3466983, -0.08993028, 0, 0.6156863, 1, 1,
0.1610225, -1.508018, 3.930755, 0, 0.6117647, 1, 1,
0.163321, -0.2190569, 1.610535, 0, 0.6039216, 1, 1,
0.1663971, -0.4964451, 2.024384, 0, 0.5960785, 1, 1,
0.1703623, -0.4182379, 2.172916, 0, 0.5921569, 1, 1,
0.1740696, 0.8075509, 0.2042652, 0, 0.5843138, 1, 1,
0.177652, 0.9132438, -0.2094013, 0, 0.5803922, 1, 1,
0.18046, -1.654675, 3.838694, 0, 0.572549, 1, 1,
0.1812874, 2.602304, -1.486525, 0, 0.5686275, 1, 1,
0.1831209, -0.7307492, 1.716366, 0, 0.5607843, 1, 1,
0.1846097, 0.9232549, 0.5805273, 0, 0.5568628, 1, 1,
0.187218, -1.368841, 3.186079, 0, 0.5490196, 1, 1,
0.1879181, 1.540293, -0.136397, 0, 0.5450981, 1, 1,
0.1893924, 1.343643, 1.207325, 0, 0.5372549, 1, 1,
0.1931391, -0.1642824, 2.568871, 0, 0.5333334, 1, 1,
0.1931449, 0.7821668, -0.7299938, 0, 0.5254902, 1, 1,
0.193998, 0.3053012, -0.01556814, 0, 0.5215687, 1, 1,
0.194641, 1.51951, -0.007584719, 0, 0.5137255, 1, 1,
0.1980306, 1.652453, -0.1139483, 0, 0.509804, 1, 1,
0.2014176, -0.9524258, 4.066387, 0, 0.5019608, 1, 1,
0.2015488, 1.63915, 0.09065522, 0, 0.4941176, 1, 1,
0.202453, 0.8845756, 1.810595, 0, 0.4901961, 1, 1,
0.2042373, -0.9387456, 3.714875, 0, 0.4823529, 1, 1,
0.2093954, -0.5348165, 5.560994, 0, 0.4784314, 1, 1,
0.2120602, 0.7583326, 0.9464512, 0, 0.4705882, 1, 1,
0.2144, -0.4400794, 1.990485, 0, 0.4666667, 1, 1,
0.2149409, 0.3252819, 0.7860566, 0, 0.4588235, 1, 1,
0.2171047, 1.244783, 1.837853, 0, 0.454902, 1, 1,
0.2206356, -0.9437569, 4.357074, 0, 0.4470588, 1, 1,
0.2250449, -0.02702893, 0.6470479, 0, 0.4431373, 1, 1,
0.2301831, -0.9751938, 3.847634, 0, 0.4352941, 1, 1,
0.2336276, -1.701248, 4.055161, 0, 0.4313726, 1, 1,
0.2368657, 1.757565, 0.1038624, 0, 0.4235294, 1, 1,
0.2384574, 0.136909, 0.2146613, 0, 0.4196078, 1, 1,
0.2393775, 1.15649, 1.197292, 0, 0.4117647, 1, 1,
0.2556828, 0.891736, 0.6617714, 0, 0.4078431, 1, 1,
0.2601877, -0.6276483, 2.881591, 0, 0.4, 1, 1,
0.2666349, -0.7267228, 1.933189, 0, 0.3921569, 1, 1,
0.2676708, -0.09322119, 1.142089, 0, 0.3882353, 1, 1,
0.2715694, -0.6418008, 3.411246, 0, 0.3803922, 1, 1,
0.2800698, -0.5072167, 0.4398393, 0, 0.3764706, 1, 1,
0.2802624, -0.8985605, 3.647937, 0, 0.3686275, 1, 1,
0.2817897, -0.4497136, 2.942959, 0, 0.3647059, 1, 1,
0.2819905, -2.591511, 3.402133, 0, 0.3568628, 1, 1,
0.2869658, -2.116961, 1.514497, 0, 0.3529412, 1, 1,
0.2883719, -0.4407041, 0.5217299, 0, 0.345098, 1, 1,
0.2900879, -0.1156315, 0.5241289, 0, 0.3411765, 1, 1,
0.2939591, 1.564196, 1.764698, 0, 0.3333333, 1, 1,
0.2987565, -0.1149106, 2.435738, 0, 0.3294118, 1, 1,
0.2989495, -0.6937767, 3.318721, 0, 0.3215686, 1, 1,
0.3009565, -0.6867078, 3.636218, 0, 0.3176471, 1, 1,
0.3061369, -1.026058, 3.909014, 0, 0.3098039, 1, 1,
0.307522, -0.04626159, 2.910581, 0, 0.3058824, 1, 1,
0.3117454, -0.1665753, 0.1555468, 0, 0.2980392, 1, 1,
0.3123525, -0.3103669, 2.211997, 0, 0.2901961, 1, 1,
0.3152242, 0.6794033, -1.120219, 0, 0.2862745, 1, 1,
0.3181939, -0.1919094, 1.64087, 0, 0.2784314, 1, 1,
0.3184511, 2.314653, 0.7263453, 0, 0.2745098, 1, 1,
0.3287499, 0.5492782, 1.348218, 0, 0.2666667, 1, 1,
0.3305472, -1.741289, 2.899827, 0, 0.2627451, 1, 1,
0.3308142, 1.396008, -0.2091693, 0, 0.254902, 1, 1,
0.3319316, -0.0500926, 0.3796528, 0, 0.2509804, 1, 1,
0.3327215, -0.9187252, 2.546661, 0, 0.2431373, 1, 1,
0.3355621, 0.3695574, 1.215596, 0, 0.2392157, 1, 1,
0.3391367, -0.6466388, 1.989332, 0, 0.2313726, 1, 1,
0.3405713, -0.4299314, 3.141738, 0, 0.227451, 1, 1,
0.3435293, 1.737339, 1.20289, 0, 0.2196078, 1, 1,
0.3493644, -1.857733, 4.120114, 0, 0.2156863, 1, 1,
0.3494382, -1.360543, 4.013662, 0, 0.2078431, 1, 1,
0.3499959, 0.01179978, 1.919858, 0, 0.2039216, 1, 1,
0.3514364, -0.6180843, 3.094695, 0, 0.1960784, 1, 1,
0.3517467, 0.8736039, 0.4108465, 0, 0.1882353, 1, 1,
0.3553717, -0.4044916, 3.91614, 0, 0.1843137, 1, 1,
0.3561979, 0.4548953, 1.99079, 0, 0.1764706, 1, 1,
0.362037, -0.3548925, 2.128979, 0, 0.172549, 1, 1,
0.3644906, -0.6501641, 1.682521, 0, 0.1647059, 1, 1,
0.3662294, -0.2303526, 2.293409, 0, 0.1607843, 1, 1,
0.3698799, 0.3696912, -0.6134974, 0, 0.1529412, 1, 1,
0.3714114, -0.4658645, 3.988295, 0, 0.1490196, 1, 1,
0.3737872, -1.160018, 2.67186, 0, 0.1411765, 1, 1,
0.3753206, -0.8065023, 3.558633, 0, 0.1372549, 1, 1,
0.3759323, -0.3349837, 1.430508, 0, 0.1294118, 1, 1,
0.3800243, -0.7890471, 1.470542, 0, 0.1254902, 1, 1,
0.3825811, 0.4543562, 1.168298, 0, 0.1176471, 1, 1,
0.3845105, -0.4457927, 2.061082, 0, 0.1137255, 1, 1,
0.3849564, 0.522785, 1.153127, 0, 0.1058824, 1, 1,
0.3855031, 0.2902609, 0.7862753, 0, 0.09803922, 1, 1,
0.386251, 0.4344414, 1.048146, 0, 0.09411765, 1, 1,
0.3874262, -0.4316677, 2.68182, 0, 0.08627451, 1, 1,
0.3909098, 1.264383, -0.08021694, 0, 0.08235294, 1, 1,
0.3947331, -0.597084, 1.676653, 0, 0.07450981, 1, 1,
0.4032175, -0.6828038, 2.038868, 0, 0.07058824, 1, 1,
0.4065169, -0.1796619, 0.9807963, 0, 0.0627451, 1, 1,
0.4157215, 0.6951799, 0.4513003, 0, 0.05882353, 1, 1,
0.4157805, -0.2331987, -0.8363851, 0, 0.05098039, 1, 1,
0.4185982, 1.119772, 1.716799, 0, 0.04705882, 1, 1,
0.4206043, -0.1140514, 2.471003, 0, 0.03921569, 1, 1,
0.4207172, 0.5261474, 0.9506428, 0, 0.03529412, 1, 1,
0.4213295, -0.7259444, 3.710249, 0, 0.02745098, 1, 1,
0.4227602, 0.6727199, -0.5261394, 0, 0.02352941, 1, 1,
0.4246848, -0.3784699, 3.708551, 0, 0.01568628, 1, 1,
0.4269377, 0.2109713, 2.147415, 0, 0.01176471, 1, 1,
0.4292378, 0.2203496, 0.683405, 0, 0.003921569, 1, 1,
0.4295224, -2.445756, 2.888031, 0.003921569, 0, 1, 1,
0.4300091, -0.3348956, 2.493317, 0.007843138, 0, 1, 1,
0.4302036, 0.6905785, 1.482009, 0.01568628, 0, 1, 1,
0.4326328, 0.7830644, 0.07237812, 0.01960784, 0, 1, 1,
0.4329444, -0.4829931, 2.590508, 0.02745098, 0, 1, 1,
0.4358854, -0.2144697, 1.973947, 0.03137255, 0, 1, 1,
0.4367371, -0.5205674, 1.456595, 0.03921569, 0, 1, 1,
0.4372867, -1.929795, 1.692118, 0.04313726, 0, 1, 1,
0.4375611, 1.07606, -0.8601148, 0.05098039, 0, 1, 1,
0.4410143, 1.046628, -1.487358, 0.05490196, 0, 1, 1,
0.4429446, 0.1726226, 2.962235, 0.0627451, 0, 1, 1,
0.4537278, -0.3611083, 2.631856, 0.06666667, 0, 1, 1,
0.4553516, -0.4550402, 2.581694, 0.07450981, 0, 1, 1,
0.4658437, 0.809876, 1.23197, 0.07843138, 0, 1, 1,
0.466002, -0.8641446, 4.296113, 0.08627451, 0, 1, 1,
0.4674373, 0.1638153, 2.406227, 0.09019608, 0, 1, 1,
0.4680397, 0.2667576, 0.7060916, 0.09803922, 0, 1, 1,
0.4705819, -1.473307, 3.577964, 0.1058824, 0, 1, 1,
0.4712227, 0.5063816, 2.095582, 0.1098039, 0, 1, 1,
0.4875309, -1.062235, 3.641089, 0.1176471, 0, 1, 1,
0.4889962, -1.260928, 3.802718, 0.1215686, 0, 1, 1,
0.4935399, 0.6050206, 0.6921922, 0.1294118, 0, 1, 1,
0.499823, -0.9876632, 1.392696, 0.1333333, 0, 1, 1,
0.5006022, 0.8749511, 0.1714351, 0.1411765, 0, 1, 1,
0.5088266, -0.4531826, 3.512328, 0.145098, 0, 1, 1,
0.5091203, -0.8521378, 2.889675, 0.1529412, 0, 1, 1,
0.5149534, -0.06703736, 2.269938, 0.1568628, 0, 1, 1,
0.516637, -0.454883, 1.437027, 0.1647059, 0, 1, 1,
0.5175845, -0.2846366, 2.254614, 0.1686275, 0, 1, 1,
0.5186668, 0.06106222, 2.202678, 0.1764706, 0, 1, 1,
0.5404308, -0.102089, 1.723442, 0.1803922, 0, 1, 1,
0.5468039, 0.485502, 1.364744, 0.1882353, 0, 1, 1,
0.548105, -0.5800277, 2.728313, 0.1921569, 0, 1, 1,
0.5553405, 0.7317306, 1.323427, 0.2, 0, 1, 1,
0.5581946, 0.7370132, 0.8123085, 0.2078431, 0, 1, 1,
0.5619954, -0.1685314, 2.877236, 0.2117647, 0, 1, 1,
0.5631667, 1.146732, 0.09218937, 0.2196078, 0, 1, 1,
0.5635732, 0.009650182, 0.584699, 0.2235294, 0, 1, 1,
0.5668475, 0.7815378, 0.7298219, 0.2313726, 0, 1, 1,
0.5690082, 1.109631, 1.476426, 0.2352941, 0, 1, 1,
0.5703943, -0.3686073, 3.434135, 0.2431373, 0, 1, 1,
0.5723621, -0.9612616, 2.416947, 0.2470588, 0, 1, 1,
0.5754245, 0.5890013, 2.464729, 0.254902, 0, 1, 1,
0.5872931, 2.037579, 0.6962296, 0.2588235, 0, 1, 1,
0.5901116, 0.4657467, 1.614452, 0.2666667, 0, 1, 1,
0.5934716, 1.626485, 0.4201205, 0.2705882, 0, 1, 1,
0.594169, 1.457282, 0.7364449, 0.2784314, 0, 1, 1,
0.5989546, -2.128427, 2.108377, 0.282353, 0, 1, 1,
0.6003208, 0.2851211, 2.525917, 0.2901961, 0, 1, 1,
0.6037669, -1.01393, 2.779457, 0.2941177, 0, 1, 1,
0.6118003, -0.7819011, 1.322447, 0.3019608, 0, 1, 1,
0.6141755, 0.9555786, 0.9099895, 0.3098039, 0, 1, 1,
0.6185424, -2.113581, 3.487995, 0.3137255, 0, 1, 1,
0.6234431, -1.502264, 2.36934, 0.3215686, 0, 1, 1,
0.6295788, 0.2646345, 0.8555629, 0.3254902, 0, 1, 1,
0.632495, -0.5412794, 2.648371, 0.3333333, 0, 1, 1,
0.6339746, 0.9044936, 1.331615, 0.3372549, 0, 1, 1,
0.6347634, 0.8235509, 1.383337, 0.345098, 0, 1, 1,
0.6402466, -0.9466548, 2.423671, 0.3490196, 0, 1, 1,
0.6467192, -0.2722924, 1.589862, 0.3568628, 0, 1, 1,
0.6469219, -1.998671, 2.359784, 0.3607843, 0, 1, 1,
0.6503229, -0.2220057, 2.115155, 0.3686275, 0, 1, 1,
0.6513348, -0.8119496, 0.09675058, 0.372549, 0, 1, 1,
0.6517186, -2.902786, 4.661851, 0.3803922, 0, 1, 1,
0.6545039, 0.4753914, -0.02884162, 0.3843137, 0, 1, 1,
0.6560941, -1.750726, 3.112017, 0.3921569, 0, 1, 1,
0.6595079, 0.7148815, 0.2611666, 0.3960784, 0, 1, 1,
0.664059, -0.9709874, 3.815218, 0.4039216, 0, 1, 1,
0.667079, -1.159972, 2.873568, 0.4117647, 0, 1, 1,
0.6711289, 1.915068, 2.262191, 0.4156863, 0, 1, 1,
0.6715474, 0.3119709, -0.1720771, 0.4235294, 0, 1, 1,
0.673065, 1.166186, 2.242703, 0.427451, 0, 1, 1,
0.6768832, -0.08514933, 2.239704, 0.4352941, 0, 1, 1,
0.6795718, 1.086693, 1.523311, 0.4392157, 0, 1, 1,
0.6813741, 0.2983399, 1.204207, 0.4470588, 0, 1, 1,
0.683621, 0.01484456, 1.780896, 0.4509804, 0, 1, 1,
0.6845912, 0.1635993, 0.3601281, 0.4588235, 0, 1, 1,
0.6893958, -1.234271, 2.830899, 0.4627451, 0, 1, 1,
0.6898074, -1.572405, 2.877508, 0.4705882, 0, 1, 1,
0.6899167, 1.217063, 1.311803, 0.4745098, 0, 1, 1,
0.6956366, 0.1892639, 1.763373, 0.4823529, 0, 1, 1,
0.6981494, 0.7033341, 0.8660662, 0.4862745, 0, 1, 1,
0.7003273, 0.08127766, 2.44842, 0.4941176, 0, 1, 1,
0.7029901, -1.317204, 3.027358, 0.5019608, 0, 1, 1,
0.7109122, 0.09668378, 2.383239, 0.5058824, 0, 1, 1,
0.7111856, -1.215209, 0.972089, 0.5137255, 0, 1, 1,
0.7144452, 1.399949, -0.8911914, 0.5176471, 0, 1, 1,
0.7150366, -2.384079, 5.611801, 0.5254902, 0, 1, 1,
0.7181413, -0.2130961, 2.805456, 0.5294118, 0, 1, 1,
0.7182891, 0.1230034, 1.165327, 0.5372549, 0, 1, 1,
0.7234411, -0.6389385, 3.422812, 0.5411765, 0, 1, 1,
0.725315, 0.7462738, -0.4649724, 0.5490196, 0, 1, 1,
0.7261217, 1.631629, 0.9223254, 0.5529412, 0, 1, 1,
0.7266085, -0.9106766, 1.578962, 0.5607843, 0, 1, 1,
0.7269937, -0.3392757, 1.457122, 0.5647059, 0, 1, 1,
0.7288384, 0.3397348, 0.04084532, 0.572549, 0, 1, 1,
0.7332254, -0.6972688, 2.121301, 0.5764706, 0, 1, 1,
0.7360918, -0.6641635, 0.8683956, 0.5843138, 0, 1, 1,
0.7425433, -0.4941157, 1.949368, 0.5882353, 0, 1, 1,
0.7426541, 0.8442745, 1.648792, 0.5960785, 0, 1, 1,
0.74401, 0.1492999, 1.159074, 0.6039216, 0, 1, 1,
0.7489101, -0.4023629, 4.424728, 0.6078432, 0, 1, 1,
0.7490515, 2.065904, -0.8440796, 0.6156863, 0, 1, 1,
0.7499017, -0.03432601, 1.124619, 0.6196079, 0, 1, 1,
0.7625903, 0.03563806, 0.9460821, 0.627451, 0, 1, 1,
0.7676747, -0.3564922, -0.02700108, 0.6313726, 0, 1, 1,
0.7758014, -0.4459826, 1.219825, 0.6392157, 0, 1, 1,
0.7786201, -0.9315386, 1.873238, 0.6431373, 0, 1, 1,
0.7786871, -0.1760224, 1.706855, 0.6509804, 0, 1, 1,
0.7798752, 2.245832, 0.9138495, 0.654902, 0, 1, 1,
0.7816891, -0.1330899, 1.350633, 0.6627451, 0, 1, 1,
0.7819104, -1.880347, 2.578686, 0.6666667, 0, 1, 1,
0.7917154, 0.5462861, 1.88619, 0.6745098, 0, 1, 1,
0.791951, -0.8414845, 1.437135, 0.6784314, 0, 1, 1,
0.7921456, 2.581191, 0.3883187, 0.6862745, 0, 1, 1,
0.7940084, -0.5704457, 2.411436, 0.6901961, 0, 1, 1,
0.7946565, -0.322, 3.343582, 0.6980392, 0, 1, 1,
0.7952831, -0.871721, 3.983279, 0.7058824, 0, 1, 1,
0.7992786, 0.9901298, 0.2023022, 0.7098039, 0, 1, 1,
0.8278956, 1.04183, 1.003129, 0.7176471, 0, 1, 1,
0.8300657, 0.1640535, 1.260518, 0.7215686, 0, 1, 1,
0.8312194, -0.6403021, 3.022285, 0.7294118, 0, 1, 1,
0.8323501, 0.3417818, 3.241168, 0.7333333, 0, 1, 1,
0.8396779, -0.4664234, 2.508417, 0.7411765, 0, 1, 1,
0.8420304, -1.006908, 1.019885, 0.7450981, 0, 1, 1,
0.8447978, -0.3828386, 2.556135, 0.7529412, 0, 1, 1,
0.8451619, 0.2934917, 1.022988, 0.7568628, 0, 1, 1,
0.8502241, -0.4526424, 2.119744, 0.7647059, 0, 1, 1,
0.8519295, -0.835721, 1.202953, 0.7686275, 0, 1, 1,
0.8524363, -0.8975958, 3.931446, 0.7764706, 0, 1, 1,
0.8603466, -1.664964, 3.028163, 0.7803922, 0, 1, 1,
0.8604869, -1.080184, 1.71412, 0.7882353, 0, 1, 1,
0.865113, 0.7918645, 1.978735, 0.7921569, 0, 1, 1,
0.8684608, -2.244093, 3.927448, 0.8, 0, 1, 1,
0.8686599, 0.3089864, 0.707805, 0.8078431, 0, 1, 1,
0.8734258, -0.4711094, 1.099399, 0.8117647, 0, 1, 1,
0.8739167, -1.063938, 2.036857, 0.8196079, 0, 1, 1,
0.874114, 0.04619567, 1.903379, 0.8235294, 0, 1, 1,
0.874189, 0.4441026, -0.7498898, 0.8313726, 0, 1, 1,
0.8764035, -1.413836, 2.271418, 0.8352941, 0, 1, 1,
0.8795082, 1.264802, -0.3698251, 0.8431373, 0, 1, 1,
0.881233, -1.751588, 0.2882603, 0.8470588, 0, 1, 1,
0.8835021, -1.50081, 2.612831, 0.854902, 0, 1, 1,
0.8843717, -0.6126266, 2.030466, 0.8588235, 0, 1, 1,
0.8874111, 1.11339, 1.09594, 0.8666667, 0, 1, 1,
0.8902127, 1.110521, -0.8151198, 0.8705882, 0, 1, 1,
0.8902569, -0.1304857, 1.553598, 0.8784314, 0, 1, 1,
0.8954268, 1.649853, 1.764492, 0.8823529, 0, 1, 1,
0.8989508, -0.4383272, 1.772409, 0.8901961, 0, 1, 1,
0.9016624, -0.5579175, 2.704581, 0.8941177, 0, 1, 1,
0.9046587, -1.265675, 1.947559, 0.9019608, 0, 1, 1,
0.9049855, 1.531978, -0.7234038, 0.9098039, 0, 1, 1,
0.9080822, 0.2435809, 2.258359, 0.9137255, 0, 1, 1,
0.92861, -0.5799036, 1.690367, 0.9215686, 0, 1, 1,
0.9290523, 0.3364384, 1.385381, 0.9254902, 0, 1, 1,
0.944138, 0.1920305, -0.4204455, 0.9333333, 0, 1, 1,
0.9444391, -0.0130526, 2.595652, 0.9372549, 0, 1, 1,
0.9472584, 1.360385, 1.940945, 0.945098, 0, 1, 1,
0.9565369, 1.05364, 0.3669378, 0.9490196, 0, 1, 1,
0.9577085, -1.797748, 2.689906, 0.9568627, 0, 1, 1,
0.9609089, -0.1369953, 2.205583, 0.9607843, 0, 1, 1,
0.9638993, 0.1759036, 2.50691, 0.9686275, 0, 1, 1,
0.9713555, 0.396338, 1.883356, 0.972549, 0, 1, 1,
0.9842822, -0.2015807, 2.784273, 0.9803922, 0, 1, 1,
0.9877775, -0.3607135, 2.742853, 0.9843137, 0, 1, 1,
0.990206, -1.376576, 0.5762665, 0.9921569, 0, 1, 1,
0.9988523, 0.1268372, 1.892089, 0.9960784, 0, 1, 1,
0.9992627, -1.929414, 2.933054, 1, 0, 0.9960784, 1,
1.004344, -0.7879473, 3.337898, 1, 0, 0.9882353, 1,
1.008516, 1.881818, 2.926199, 1, 0, 0.9843137, 1,
1.009216, 1.263682, 0.2941039, 1, 0, 0.9764706, 1,
1.019081, 0.2220386, 2.010834, 1, 0, 0.972549, 1,
1.020054, 1.074652, 0.262, 1, 0, 0.9647059, 1,
1.028975, 0.0642297, 0.1813661, 1, 0, 0.9607843, 1,
1.032051, 1.1155, 0.4378172, 1, 0, 0.9529412, 1,
1.03442, -0.4352931, 2.631217, 1, 0, 0.9490196, 1,
1.034495, -1.257008, 2.985312, 1, 0, 0.9411765, 1,
1.041126, -0.611212, 2.81237, 1, 0, 0.9372549, 1,
1.047183, -0.6698986, 1.294806, 1, 0, 0.9294118, 1,
1.060208, 0.2043986, 0.5935526, 1, 0, 0.9254902, 1,
1.064417, 1.201281, 0.8430642, 1, 0, 0.9176471, 1,
1.068331, -0.6419138, 1.867049, 1, 0, 0.9137255, 1,
1.075745, -0.4327007, 3.166266, 1, 0, 0.9058824, 1,
1.078964, -0.3808797, 2.109503, 1, 0, 0.9019608, 1,
1.083329, 0.3067583, 1.287189, 1, 0, 0.8941177, 1,
1.085838, -0.1205091, 2.604301, 1, 0, 0.8862745, 1,
1.091891, -0.1362608, 0.1246692, 1, 0, 0.8823529, 1,
1.094837, -0.9910888, 2.145596, 1, 0, 0.8745098, 1,
1.095244, -1.462699, 3.233053, 1, 0, 0.8705882, 1,
1.097491, -2.179282, 1.909597, 1, 0, 0.8627451, 1,
1.098698, -2.096473, 2.818181, 1, 0, 0.8588235, 1,
1.102983, 0.5371196, 0.4464327, 1, 0, 0.8509804, 1,
1.107323, 0.2571374, 1.353334, 1, 0, 0.8470588, 1,
1.117911, 0.4625546, 2.171701, 1, 0, 0.8392157, 1,
1.120436, -1.424211, 4.957367, 1, 0, 0.8352941, 1,
1.121556, 1.061551, 0.175664, 1, 0, 0.827451, 1,
1.121843, 0.3339205, 2.128289, 1, 0, 0.8235294, 1,
1.124991, 0.6446311, 1.394876, 1, 0, 0.8156863, 1,
1.136286, -1.338826, 1.240104, 1, 0, 0.8117647, 1,
1.137488, 0.07375973, 1.432872, 1, 0, 0.8039216, 1,
1.146173, -0.1536705, 0.6344886, 1, 0, 0.7960784, 1,
1.165207, 0.1553053, 0.8523834, 1, 0, 0.7921569, 1,
1.166856, 1.497311, -0.7559848, 1, 0, 0.7843137, 1,
1.170704, -0.08708141, 2.052735, 1, 0, 0.7803922, 1,
1.181628, 0.2811723, 0.947468, 1, 0, 0.772549, 1,
1.185428, 0.4102375, 1.809206, 1, 0, 0.7686275, 1,
1.186182, 0.7209085, 1.033513, 1, 0, 0.7607843, 1,
1.203176, -0.2336558, 2.565835, 1, 0, 0.7568628, 1,
1.204654, 0.07535149, 3.146919, 1, 0, 0.7490196, 1,
1.205338, -1.035594, 2.583696, 1, 0, 0.7450981, 1,
1.205785, -0.02657217, 2.859708, 1, 0, 0.7372549, 1,
1.210604, 0.7354138, 2.11122, 1, 0, 0.7333333, 1,
1.210716, -0.2058426, 1.876493, 1, 0, 0.7254902, 1,
1.211608, -0.3843795, 2.53392, 1, 0, 0.7215686, 1,
1.213001, -1.091205, 2.390386, 1, 0, 0.7137255, 1,
1.218074, 1.615416, 0.3096071, 1, 0, 0.7098039, 1,
1.221004, -0.6147939, 1.270955, 1, 0, 0.7019608, 1,
1.225747, -1.046632, 1.959455, 1, 0, 0.6941177, 1,
1.226781, -0.1920255, 1.403875, 1, 0, 0.6901961, 1,
1.231258, 0.6879373, 2.75772, 1, 0, 0.682353, 1,
1.233401, -0.6807654, 0.08714113, 1, 0, 0.6784314, 1,
1.235694, -1.594736, 5.029041, 1, 0, 0.6705883, 1,
1.238949, -1.045043, 1.644979, 1, 0, 0.6666667, 1,
1.24059, 0.9038351, -1.223321, 1, 0, 0.6588235, 1,
1.24413, -0.816856, 1.341161, 1, 0, 0.654902, 1,
1.246404, -0.05954504, 1.927748, 1, 0, 0.6470588, 1,
1.247864, -0.6371163, 1.870601, 1, 0, 0.6431373, 1,
1.250585, -0.704554, 1.865074, 1, 0, 0.6352941, 1,
1.250703, 0.7478043, 2.483961, 1, 0, 0.6313726, 1,
1.252511, -0.3396423, 2.178473, 1, 0, 0.6235294, 1,
1.254117, 0.3190959, 0.03800654, 1, 0, 0.6196079, 1,
1.258472, -1.574146, 5.11314, 1, 0, 0.6117647, 1,
1.263965, -0.8065414, 1.891708, 1, 0, 0.6078432, 1,
1.267754, 0.06321707, 2.167703, 1, 0, 0.6, 1,
1.277393, -1.456907, 1.356135, 1, 0, 0.5921569, 1,
1.28186, -1.277789, 1.023287, 1, 0, 0.5882353, 1,
1.284575, 0.007156465, 1.338899, 1, 0, 0.5803922, 1,
1.288091, -0.07746397, 1.618605, 1, 0, 0.5764706, 1,
1.288978, 1.150073, 2.951522, 1, 0, 0.5686275, 1,
1.294172, 0.990968, -1.43458, 1, 0, 0.5647059, 1,
1.303718, -0.007359271, 1.649862, 1, 0, 0.5568628, 1,
1.309175, 0.5628062, 1.238821, 1, 0, 0.5529412, 1,
1.315515, 1.805574, 0.2212757, 1, 0, 0.5450981, 1,
1.315881, -1.379464, 3.392694, 1, 0, 0.5411765, 1,
1.32227, -0.8335087, 2.816803, 1, 0, 0.5333334, 1,
1.324068, 0.1961644, 0.8829505, 1, 0, 0.5294118, 1,
1.324765, 0.7609947, 2.528005, 1, 0, 0.5215687, 1,
1.330768, 0.1588092, 1.33438, 1, 0, 0.5176471, 1,
1.350316, -1.553683, 2.150974, 1, 0, 0.509804, 1,
1.351762, 0.429571, 1.180439, 1, 0, 0.5058824, 1,
1.354601, 1.767515, 1.922513, 1, 0, 0.4980392, 1,
1.369883, 0.1350355, 0.07717131, 1, 0, 0.4901961, 1,
1.389174, -0.3879286, 2.672226, 1, 0, 0.4862745, 1,
1.393401, 0.3913528, 2.3085, 1, 0, 0.4784314, 1,
1.396876, -0.0009185114, 2.222317, 1, 0, 0.4745098, 1,
1.403599, -0.3882595, 1.70438, 1, 0, 0.4666667, 1,
1.405796, -1.472159, 0.8373832, 1, 0, 0.4627451, 1,
1.413236, -0.8793454, 0.9727893, 1, 0, 0.454902, 1,
1.437961, 1.668985, 0.9201016, 1, 0, 0.4509804, 1,
1.450739, 0.4560881, 0.5540677, 1, 0, 0.4431373, 1,
1.451948, -0.3197837, 1.754369, 1, 0, 0.4392157, 1,
1.465914, 1.693065, 1.230552, 1, 0, 0.4313726, 1,
1.484939, 0.1406761, 2.416319, 1, 0, 0.427451, 1,
1.489067, 0.7524092, 1.364146, 1, 0, 0.4196078, 1,
1.495359, -0.1915535, 3.689161, 1, 0, 0.4156863, 1,
1.50514, 2.335811, 1.147449, 1, 0, 0.4078431, 1,
1.507178, 1.2904, -0.62756, 1, 0, 0.4039216, 1,
1.518881, -0.6712006, 1.426879, 1, 0, 0.3960784, 1,
1.560207, -0.2148703, 0.9191993, 1, 0, 0.3882353, 1,
1.570262, -0.009307568, 1.819209, 1, 0, 0.3843137, 1,
1.57802, 0.8450322, 0.2684885, 1, 0, 0.3764706, 1,
1.590404, -0.9460568, 1.417145, 1, 0, 0.372549, 1,
1.594159, -1.179204, 2.436677, 1, 0, 0.3647059, 1,
1.596112, 0.1214027, 1.184771, 1, 0, 0.3607843, 1,
1.599614, -0.5552102, 2.783432, 1, 0, 0.3529412, 1,
1.602783, -0.2948465, 2.471007, 1, 0, 0.3490196, 1,
1.605417, 1.613963, 1.183139, 1, 0, 0.3411765, 1,
1.606519, 1.214389, 1.947185, 1, 0, 0.3372549, 1,
1.608034, -0.5549812, 2.840323, 1, 0, 0.3294118, 1,
1.618143, 0.3584205, -1.409393, 1, 0, 0.3254902, 1,
1.620575, -1.48325, 0.797141, 1, 0, 0.3176471, 1,
1.631845, -1.842225, 0.9023811, 1, 0, 0.3137255, 1,
1.633109, -0.3337137, 0.147062, 1, 0, 0.3058824, 1,
1.634326, 0.05227235, 0.5442891, 1, 0, 0.2980392, 1,
1.643842, 0.439138, 1.504191, 1, 0, 0.2941177, 1,
1.648017, -0.846332, -0.3490345, 1, 0, 0.2862745, 1,
1.657712, 0.004937423, 1.43766, 1, 0, 0.282353, 1,
1.663853, 0.369362, 0.9515715, 1, 0, 0.2745098, 1,
1.677714, -0.08498552, 0.9268117, 1, 0, 0.2705882, 1,
1.677785, -0.7816549, 2.881491, 1, 0, 0.2627451, 1,
1.682133, -0.8531757, 1.161502, 1, 0, 0.2588235, 1,
1.686234, 0.1001539, 2.341948, 1, 0, 0.2509804, 1,
1.691956, 0.05438803, 1.643008, 1, 0, 0.2470588, 1,
1.706273, -0.3411259, 2.513697, 1, 0, 0.2392157, 1,
1.717387, -1.689946, 2.540737, 1, 0, 0.2352941, 1,
1.724555, 1.511754, 1.510284, 1, 0, 0.227451, 1,
1.726082, -1.201649, 2.9265, 1, 0, 0.2235294, 1,
1.768049, -0.6817124, 2.792384, 1, 0, 0.2156863, 1,
1.77177, -0.6109414, 2.031954, 1, 0, 0.2117647, 1,
1.778386, -0.1630016, 0.9535034, 1, 0, 0.2039216, 1,
1.790792, 1.219177, 1.896872, 1, 0, 0.1960784, 1,
1.806035, 1.377383, 0.1046013, 1, 0, 0.1921569, 1,
1.808098, 0.2902553, -0.4525444, 1, 0, 0.1843137, 1,
1.822808, -1.403234, 2.91665, 1, 0, 0.1803922, 1,
1.842243, -1.428245, 1.840173, 1, 0, 0.172549, 1,
1.84548, -0.05931588, 2.204613, 1, 0, 0.1686275, 1,
1.851934, 0.3007049, 1.455349, 1, 0, 0.1607843, 1,
1.873231, -0.07584313, 1.528326, 1, 0, 0.1568628, 1,
1.919045, -0.4674293, 1.212315, 1, 0, 0.1490196, 1,
1.928528, 0.1975488, -0.2857634, 1, 0, 0.145098, 1,
1.929568, -0.02434261, 2.876548, 1, 0, 0.1372549, 1,
1.963516, -0.7323092, 1.319805, 1, 0, 0.1333333, 1,
1.974088, -0.1852053, 2.57898, 1, 0, 0.1254902, 1,
1.988494, 0.08667639, 0.6852995, 1, 0, 0.1215686, 1,
1.988796, -0.3479249, 4.447529, 1, 0, 0.1137255, 1,
2.007633, -1.178384, 2.529586, 1, 0, 0.1098039, 1,
2.025794, 2.08372, -0.1158254, 1, 0, 0.1019608, 1,
2.083665, -1.734577, 4.46474, 1, 0, 0.09411765, 1,
2.088127, 0.854368, 0.9662908, 1, 0, 0.09019608, 1,
2.196414, 0.7039806, 1.549303, 1, 0, 0.08235294, 1,
2.205057, 1.684714, 1.554495, 1, 0, 0.07843138, 1,
2.2059, -1.005251, 2.075657, 1, 0, 0.07058824, 1,
2.222919, -0.7422931, 2.507268, 1, 0, 0.06666667, 1,
2.276865, 0.4564597, 1.819988, 1, 0, 0.05882353, 1,
2.28139, -0.4797004, 0.7174467, 1, 0, 0.05490196, 1,
2.284467, 0.6090518, 2.155708, 1, 0, 0.04705882, 1,
2.474253, 0.7065845, 2.47872, 1, 0, 0.04313726, 1,
2.577064, -0.5755585, 1.401326, 1, 0, 0.03529412, 1,
2.603178, 1.416863, 1.437397, 1, 0, 0.03137255, 1,
2.617068, -2.348426, 2.674235, 1, 0, 0.02352941, 1,
2.663558, -0.7613301, 1.379391, 1, 0, 0.01960784, 1,
2.763849, 0.1569148, 2.310141, 1, 0, 0.01176471, 1,
2.869638, 1.010678, 2.433907, 1, 0, 0.007843138, 1
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
0.06334996, -4.367057, -6.86166, 0, -0.5, 0.5, 0.5,
0.06334996, -4.367057, -6.86166, 1, -0.5, 0.5, 0.5,
0.06334996, -4.367057, -6.86166, 1, 1.5, 0.5, 0.5,
0.06334996, -4.367057, -6.86166, 0, 1.5, 0.5, 0.5
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
-3.694269, -0.265964, -6.86166, 0, -0.5, 0.5, 0.5,
-3.694269, -0.265964, -6.86166, 1, -0.5, 0.5, 0.5,
-3.694269, -0.265964, -6.86166, 1, 1.5, 0.5, 0.5,
-3.694269, -0.265964, -6.86166, 0, 1.5, 0.5, 0.5
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
-3.694269, -4.367057, 0.2789834, 0, -0.5, 0.5, 0.5,
-3.694269, -4.367057, 0.2789834, 1, -0.5, 0.5, 0.5,
-3.694269, -4.367057, 0.2789834, 1, 1.5, 0.5, 0.5,
-3.694269, -4.367057, 0.2789834, 0, 1.5, 0.5, 0.5
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
-2, -3.420651, -5.213819,
2, -3.420651, -5.213819,
-2, -3.420651, -5.213819,
-2, -3.578385, -5.488459,
-1, -3.420651, -5.213819,
-1, -3.578385, -5.488459,
0, -3.420651, -5.213819,
0, -3.578385, -5.488459,
1, -3.420651, -5.213819,
1, -3.578385, -5.488459,
2, -3.420651, -5.213819,
2, -3.578385, -5.488459
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
-2, -3.893854, -6.037739, 0, -0.5, 0.5, 0.5,
-2, -3.893854, -6.037739, 1, -0.5, 0.5, 0.5,
-2, -3.893854, -6.037739, 1, 1.5, 0.5, 0.5,
-2, -3.893854, -6.037739, 0, 1.5, 0.5, 0.5,
-1, -3.893854, -6.037739, 0, -0.5, 0.5, 0.5,
-1, -3.893854, -6.037739, 1, -0.5, 0.5, 0.5,
-1, -3.893854, -6.037739, 1, 1.5, 0.5, 0.5,
-1, -3.893854, -6.037739, 0, 1.5, 0.5, 0.5,
0, -3.893854, -6.037739, 0, -0.5, 0.5, 0.5,
0, -3.893854, -6.037739, 1, -0.5, 0.5, 0.5,
0, -3.893854, -6.037739, 1, 1.5, 0.5, 0.5,
0, -3.893854, -6.037739, 0, 1.5, 0.5, 0.5,
1, -3.893854, -6.037739, 0, -0.5, 0.5, 0.5,
1, -3.893854, -6.037739, 1, -0.5, 0.5, 0.5,
1, -3.893854, -6.037739, 1, 1.5, 0.5, 0.5,
1, -3.893854, -6.037739, 0, 1.5, 0.5, 0.5,
2, -3.893854, -6.037739, 0, -0.5, 0.5, 0.5,
2, -3.893854, -6.037739, 1, -0.5, 0.5, 0.5,
2, -3.893854, -6.037739, 1, 1.5, 0.5, 0.5,
2, -3.893854, -6.037739, 0, 1.5, 0.5, 0.5
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
-2.827127, -3, -5.213819,
-2.827127, 2, -5.213819,
-2.827127, -3, -5.213819,
-2.97165, -3, -5.488459,
-2.827127, -2, -5.213819,
-2.97165, -2, -5.488459,
-2.827127, -1, -5.213819,
-2.97165, -1, -5.488459,
-2.827127, 0, -5.213819,
-2.97165, 0, -5.488459,
-2.827127, 1, -5.213819,
-2.97165, 1, -5.488459,
-2.827127, 2, -5.213819,
-2.97165, 2, -5.488459
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
-3.260698, -3, -6.037739, 0, -0.5, 0.5, 0.5,
-3.260698, -3, -6.037739, 1, -0.5, 0.5, 0.5,
-3.260698, -3, -6.037739, 1, 1.5, 0.5, 0.5,
-3.260698, -3, -6.037739, 0, 1.5, 0.5, 0.5,
-3.260698, -2, -6.037739, 0, -0.5, 0.5, 0.5,
-3.260698, -2, -6.037739, 1, -0.5, 0.5, 0.5,
-3.260698, -2, -6.037739, 1, 1.5, 0.5, 0.5,
-3.260698, -2, -6.037739, 0, 1.5, 0.5, 0.5,
-3.260698, -1, -6.037739, 0, -0.5, 0.5, 0.5,
-3.260698, -1, -6.037739, 1, -0.5, 0.5, 0.5,
-3.260698, -1, -6.037739, 1, 1.5, 0.5, 0.5,
-3.260698, -1, -6.037739, 0, 1.5, 0.5, 0.5,
-3.260698, 0, -6.037739, 0, -0.5, 0.5, 0.5,
-3.260698, 0, -6.037739, 1, -0.5, 0.5, 0.5,
-3.260698, 0, -6.037739, 1, 1.5, 0.5, 0.5,
-3.260698, 0, -6.037739, 0, 1.5, 0.5, 0.5,
-3.260698, 1, -6.037739, 0, -0.5, 0.5, 0.5,
-3.260698, 1, -6.037739, 1, -0.5, 0.5, 0.5,
-3.260698, 1, -6.037739, 1, 1.5, 0.5, 0.5,
-3.260698, 1, -6.037739, 0, 1.5, 0.5, 0.5,
-3.260698, 2, -6.037739, 0, -0.5, 0.5, 0.5,
-3.260698, 2, -6.037739, 1, -0.5, 0.5, 0.5,
-3.260698, 2, -6.037739, 1, 1.5, 0.5, 0.5,
-3.260698, 2, -6.037739, 0, 1.5, 0.5, 0.5
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
-2.827127, -3.420651, -4,
-2.827127, -3.420651, 4,
-2.827127, -3.420651, -4,
-2.97165, -3.578385, -4,
-2.827127, -3.420651, -2,
-2.97165, -3.578385, -2,
-2.827127, -3.420651, 0,
-2.97165, -3.578385, 0,
-2.827127, -3.420651, 2,
-2.97165, -3.578385, 2,
-2.827127, -3.420651, 4,
-2.97165, -3.578385, 4
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
-3.260698, -3.893854, -4, 0, -0.5, 0.5, 0.5,
-3.260698, -3.893854, -4, 1, -0.5, 0.5, 0.5,
-3.260698, -3.893854, -4, 1, 1.5, 0.5, 0.5,
-3.260698, -3.893854, -4, 0, 1.5, 0.5, 0.5,
-3.260698, -3.893854, -2, 0, -0.5, 0.5, 0.5,
-3.260698, -3.893854, -2, 1, -0.5, 0.5, 0.5,
-3.260698, -3.893854, -2, 1, 1.5, 0.5, 0.5,
-3.260698, -3.893854, -2, 0, 1.5, 0.5, 0.5,
-3.260698, -3.893854, 0, 0, -0.5, 0.5, 0.5,
-3.260698, -3.893854, 0, 1, -0.5, 0.5, 0.5,
-3.260698, -3.893854, 0, 1, 1.5, 0.5, 0.5,
-3.260698, -3.893854, 0, 0, 1.5, 0.5, 0.5,
-3.260698, -3.893854, 2, 0, -0.5, 0.5, 0.5,
-3.260698, -3.893854, 2, 1, -0.5, 0.5, 0.5,
-3.260698, -3.893854, 2, 1, 1.5, 0.5, 0.5,
-3.260698, -3.893854, 2, 0, 1.5, 0.5, 0.5,
-3.260698, -3.893854, 4, 0, -0.5, 0.5, 0.5,
-3.260698, -3.893854, 4, 1, -0.5, 0.5, 0.5,
-3.260698, -3.893854, 4, 1, 1.5, 0.5, 0.5,
-3.260698, -3.893854, 4, 0, 1.5, 0.5, 0.5
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
-2.827127, -3.420651, -5.213819,
-2.827127, 2.888723, -5.213819,
-2.827127, -3.420651, 5.771786,
-2.827127, 2.888723, 5.771786,
-2.827127, -3.420651, -5.213819,
-2.827127, -3.420651, 5.771786,
-2.827127, 2.888723, -5.213819,
-2.827127, 2.888723, 5.771786,
-2.827127, -3.420651, -5.213819,
2.953826, -3.420651, -5.213819,
-2.827127, -3.420651, 5.771786,
2.953826, -3.420651, 5.771786,
-2.827127, 2.888723, -5.213819,
2.953826, 2.888723, -5.213819,
-2.827127, 2.888723, 5.771786,
2.953826, 2.888723, 5.771786,
2.953826, -3.420651, -5.213819,
2.953826, 2.888723, -5.213819,
2.953826, -3.420651, 5.771786,
2.953826, 2.888723, 5.771786,
2.953826, -3.420651, -5.213819,
2.953826, -3.420651, 5.771786,
2.953826, 2.888723, -5.213819,
2.953826, 2.888723, 5.771786
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
var radius = 7.435785;
var distance = 33.08265;
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
mvMatrix.translate( -0.06334996, 0.265964, -0.2789834 );
mvMatrix.scale( 1.390725, 1.27425, 0.731841 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.08265);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
acetic_acid_ethyl_es<-read.table("acetic_acid_ethyl_es.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 2 did not have 6 elements
```

```r
x<-acetic_acid_ethyl_es$V2
```

```
## Error in eval(expr, envir, enclos): object 'acetic_acid_ethyl_es' not found
```

```r
y<-acetic_acid_ethyl_es$V3
```

```
## Error in eval(expr, envir, enclos): object 'acetic_acid_ethyl_es' not found
```

```r
z<-acetic_acid_ethyl_es$V4
```

```
## Error in eval(expr, envir, enclos): object 'acetic_acid_ethyl_es' not found
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
-2.742938, -0.1185594, 0.6288229, 0, 0, 1, 1, 1,
-2.583747, -1.053237, -1.750548, 1, 0, 0, 1, 1,
-2.491739, 0.2546777, -1.895188, 1, 0, 0, 1, 1,
-2.481951, -0.3079242, -1.244507, 1, 0, 0, 1, 1,
-2.311721, -0.4002005, -0.9035013, 1, 0, 0, 1, 1,
-2.293159, -0.700622, -2.962665, 1, 0, 0, 1, 1,
-2.242898, -0.9271045, -2.789315, 0, 0, 0, 1, 1,
-2.241157, 1.814999, -1.561724, 0, 0, 0, 1, 1,
-2.2309, -0.1484891, -1.484593, 0, 0, 0, 1, 1,
-2.15023, -0.9690394, 0.41583, 0, 0, 0, 1, 1,
-2.126711, 2.053714, -1.287475, 0, 0, 0, 1, 1,
-2.113447, -0.9257247, -4.073225, 0, 0, 0, 1, 1,
-2.108526, 1.440831, -0.3683832, 0, 0, 0, 1, 1,
-2.106086, 2.655937, -1.658658, 1, 1, 1, 1, 1,
-2.097216, 1.550937, 0.6175439, 1, 1, 1, 1, 1,
-2.093394, 0.7035918, -0.5486062, 1, 1, 1, 1, 1,
-2.009375, -0.9794685, 1.346456, 1, 1, 1, 1, 1,
-1.991055, -1.284374, -2.836791, 1, 1, 1, 1, 1,
-1.990459, -1.503937, -1.660765, 1, 1, 1, 1, 1,
-1.989599, 1.753792, -0.729829, 1, 1, 1, 1, 1,
-1.951826, -0.1682738, -1.188743, 1, 1, 1, 1, 1,
-1.934054, -0.0856538, -1.711486, 1, 1, 1, 1, 1,
-1.918719, -0.3270358, -2.852592, 1, 1, 1, 1, 1,
-1.904478, 0.5404912, -0.8811496, 1, 1, 1, 1, 1,
-1.900977, 0.2930437, -1.180054, 1, 1, 1, 1, 1,
-1.869374, 0.3755708, -2.457466, 1, 1, 1, 1, 1,
-1.850831, 0.3879991, -2.313913, 1, 1, 1, 1, 1,
-1.836556, 1.170827, -1.374469, 1, 1, 1, 1, 1,
-1.815048, -2.109115, -2.339925, 0, 0, 1, 1, 1,
-1.800722, -0.1743119, -2.983894, 1, 0, 0, 1, 1,
-1.784347, -1.129086, -2.529147, 1, 0, 0, 1, 1,
-1.767506, -0.8880786, -2.24416, 1, 0, 0, 1, 1,
-1.748856, -1.724434, -3.406482, 1, 0, 0, 1, 1,
-1.739868, -0.3484183, -2.009784, 1, 0, 0, 1, 1,
-1.732558, 0.4188217, -0.9438263, 0, 0, 0, 1, 1,
-1.72808, -1.034283, -3.039642, 0, 0, 0, 1, 1,
-1.716852, -0.1175142, -2.254351, 0, 0, 0, 1, 1,
-1.687015, 0.6803227, -0.4141019, 0, 0, 0, 1, 1,
-1.668492, 0.3905163, 0.4737335, 0, 0, 0, 1, 1,
-1.645227, -1.595486, -1.882488, 0, 0, 0, 1, 1,
-1.641206, 0.0107275, -0.8385056, 0, 0, 0, 1, 1,
-1.624662, 0.4976454, -0.6866784, 1, 1, 1, 1, 1,
-1.623548, 0.5569214, -2.309304, 1, 1, 1, 1, 1,
-1.61957, 0.3706525, -0.7127818, 1, 1, 1, 1, 1,
-1.615622, -0.8017229, -2.61271, 1, 1, 1, 1, 1,
-1.615371, 0.02259517, -2.615087, 1, 1, 1, 1, 1,
-1.606423, -0.4574655, -1.764222, 1, 1, 1, 1, 1,
-1.591616, 0.9063695, -0.4356612, 1, 1, 1, 1, 1,
-1.576681, -1.101894, -0.4732324, 1, 1, 1, 1, 1,
-1.576636, -1.306714, -1.796132, 1, 1, 1, 1, 1,
-1.557769, -0.8576783, -1.038671, 1, 1, 1, 1, 1,
-1.548072, 1.611456, -0.9611722, 1, 1, 1, 1, 1,
-1.541004, 0.5769156, -0.4605714, 1, 1, 1, 1, 1,
-1.533656, 0.3947382, 1.033076, 1, 1, 1, 1, 1,
-1.528586, 1.38931, -1.981582, 1, 1, 1, 1, 1,
-1.528483, 0.03507281, -2.341924, 1, 1, 1, 1, 1,
-1.527739, -0.05868638, -1.642121, 0, 0, 1, 1, 1,
-1.523916, -0.3058409, -1.907888, 1, 0, 0, 1, 1,
-1.518988, -1.24108, -1.660008, 1, 0, 0, 1, 1,
-1.503799, 0.5254034, -2.032329, 1, 0, 0, 1, 1,
-1.490724, -0.007359887, -1.248557, 1, 0, 0, 1, 1,
-1.48859, -0.246273, -1.937523, 1, 0, 0, 1, 1,
-1.478389, -2.963845, -2.565853, 0, 0, 0, 1, 1,
-1.478081, 1.382281, -0.5013707, 0, 0, 0, 1, 1,
-1.477588, 1.214062, -1.57197, 0, 0, 0, 1, 1,
-1.47039, 1.052793, -1.313136, 0, 0, 0, 1, 1,
-1.468667, 0.3588408, -2.31949, 0, 0, 0, 1, 1,
-1.456052, -1.689978, -2.850683, 0, 0, 0, 1, 1,
-1.455686, 0.2315608, -2.052023, 0, 0, 0, 1, 1,
-1.443113, 0.9838499, -1.011272, 1, 1, 1, 1, 1,
-1.431748, -1.470739, -2.295733, 1, 1, 1, 1, 1,
-1.421501, 0.4686596, -0.3907788, 1, 1, 1, 1, 1,
-1.42126, 0.5866691, 0.1206535, 1, 1, 1, 1, 1,
-1.420383, -0.5088735, -1.749708, 1, 1, 1, 1, 1,
-1.411146, 1.593312, -2.366172, 1, 1, 1, 1, 1,
-1.409593, 0.7912118, -1.874445, 1, 1, 1, 1, 1,
-1.408565, -0.9362845, -1.161626, 1, 1, 1, 1, 1,
-1.393036, 0.3836682, -1.001576, 1, 1, 1, 1, 1,
-1.392647, -0.7091872, -2.107594, 1, 1, 1, 1, 1,
-1.38883, 0.07088866, -0.8952926, 1, 1, 1, 1, 1,
-1.386672, -0.8913664, -2.507497, 1, 1, 1, 1, 1,
-1.377479, -0.6017769, -2.234317, 1, 1, 1, 1, 1,
-1.376999, -0.2552344, -1.633881, 1, 1, 1, 1, 1,
-1.351341, -1.050859, 0.09302083, 1, 1, 1, 1, 1,
-1.346827, 0.5059744, -2.621369, 0, 0, 1, 1, 1,
-1.345554, 0.05914035, -1.819508, 1, 0, 0, 1, 1,
-1.339035, -0.1548086, -3.286643, 1, 0, 0, 1, 1,
-1.333444, 0.8771842, -1.107521, 1, 0, 0, 1, 1,
-1.331398, 0.294704, -3.166296, 1, 0, 0, 1, 1,
-1.330339, 0.3220249, -2.450397, 1, 0, 0, 1, 1,
-1.322023, -0.08885026, -0.6886364, 0, 0, 0, 1, 1,
-1.304458, 1.575668, -1.747439, 0, 0, 0, 1, 1,
-1.303039, 0.8166001, -0.7525494, 0, 0, 0, 1, 1,
-1.298768, -1.253736, -3.223303, 0, 0, 0, 1, 1,
-1.293795, -0.5105129, -3.389559, 0, 0, 0, 1, 1,
-1.289052, -0.1197117, -1.373841, 0, 0, 0, 1, 1,
-1.2865, -1.261539, -2.492175, 0, 0, 0, 1, 1,
-1.28213, -0.6711951, -2.930411, 1, 1, 1, 1, 1,
-1.281635, 0.9443271, -1.270734, 1, 1, 1, 1, 1,
-1.280589, -1.542111, -2.20094, 1, 1, 1, 1, 1,
-1.269557, -0.9542009, -1.51477, 1, 1, 1, 1, 1,
-1.265341, -0.1000475, -2.25349, 1, 1, 1, 1, 1,
-1.265035, 2.42258, -2.410695, 1, 1, 1, 1, 1,
-1.26001, 0.2270596, -0.6992962, 1, 1, 1, 1, 1,
-1.257138, 1.539545, 0.2840407, 1, 1, 1, 1, 1,
-1.249207, -0.3338974, -0.3977503, 1, 1, 1, 1, 1,
-1.248888, -0.7025964, -1.617853, 1, 1, 1, 1, 1,
-1.247073, 0.7024442, 0.61405, 1, 1, 1, 1, 1,
-1.236696, -0.01493618, -2.497743, 1, 1, 1, 1, 1,
-1.234842, 0.3661793, -2.027059, 1, 1, 1, 1, 1,
-1.233498, -0.605238, -1.518717, 1, 1, 1, 1, 1,
-1.208647, -0.03420417, -1.037225, 1, 1, 1, 1, 1,
-1.200819, 0.6295977, -1.759602, 0, 0, 1, 1, 1,
-1.200625, -1.493349, -3.439495, 1, 0, 0, 1, 1,
-1.19558, 1.571646, 0.4267455, 1, 0, 0, 1, 1,
-1.192443, -1.859872, -2.418159, 1, 0, 0, 1, 1,
-1.188704, -1.651631, -2.823481, 1, 0, 0, 1, 1,
-1.187814, 0.1414609, -2.595036, 1, 0, 0, 1, 1,
-1.18654, -0.8250667, -0.8889136, 0, 0, 0, 1, 1,
-1.175512, 0.4822787, -0.8519015, 0, 0, 0, 1, 1,
-1.17191, 0.6409782, -0.560626, 0, 0, 0, 1, 1,
-1.167651, 0.01864097, -0.7919225, 0, 0, 0, 1, 1,
-1.164973, 1.093914, -1.432464, 0, 0, 0, 1, 1,
-1.163264, -0.6005585, -2.211391, 0, 0, 0, 1, 1,
-1.163245, 0.1979504, -2.207422, 0, 0, 0, 1, 1,
-1.161363, -1.300019, -2.361721, 1, 1, 1, 1, 1,
-1.157519, -1.808891, -1.415389, 1, 1, 1, 1, 1,
-1.155655, 1.199953, 1.081404, 1, 1, 1, 1, 1,
-1.155593, -0.4152184, -3.686222, 1, 1, 1, 1, 1,
-1.153066, 1.43095, -0.0393588, 1, 1, 1, 1, 1,
-1.150177, 0.7342207, 0.1526508, 1, 1, 1, 1, 1,
-1.149942, -0.9013389, -3.446148, 1, 1, 1, 1, 1,
-1.137571, 0.3834902, -0.5361533, 1, 1, 1, 1, 1,
-1.134117, 1.330605, -0.6608086, 1, 1, 1, 1, 1,
-1.125962, 1.20288, -1.193853, 1, 1, 1, 1, 1,
-1.121858, 0.004650246, -0.6249933, 1, 1, 1, 1, 1,
-1.120944, -0.6216299, -0.7938268, 1, 1, 1, 1, 1,
-1.11948, -0.04774439, -1.567576, 1, 1, 1, 1, 1,
-1.119303, -0.1648814, -2.959809, 1, 1, 1, 1, 1,
-1.119047, 0.8065587, -0.488572, 1, 1, 1, 1, 1,
-1.11588, -0.1628702, -0.3948033, 0, 0, 1, 1, 1,
-1.104905, -0.4834827, -2.89076, 1, 0, 0, 1, 1,
-1.104485, 0.1292439, -0.8822322, 1, 0, 0, 1, 1,
-1.102229, -0.01721155, -0.08251751, 1, 0, 0, 1, 1,
-1.097313, 0.5879032, -3.116316, 1, 0, 0, 1, 1,
-1.096236, -0.2156173, -1.821676, 1, 0, 0, 1, 1,
-1.082672, 1.853583, 0.4206735, 0, 0, 0, 1, 1,
-1.08052, 0.02669504, -0.8586619, 0, 0, 0, 1, 1,
-1.07886, 0.1340416, -2.596016, 0, 0, 0, 1, 1,
-1.077099, -0.164406, -0.799321, 0, 0, 0, 1, 1,
-1.074363, 0.1181228, -1.147262, 0, 0, 0, 1, 1,
-1.074267, 0.393197, -0.4290344, 0, 0, 0, 1, 1,
-1.068308, -1.695727, -3.12331, 0, 0, 0, 1, 1,
-1.0658, -1.54867, -3.551626, 1, 1, 1, 1, 1,
-1.061532, -0.5648113, -2.166834, 1, 1, 1, 1, 1,
-1.051809, 0.3849121, -2.216849, 1, 1, 1, 1, 1,
-1.039857, -0.5775765, -1.409156, 1, 1, 1, 1, 1,
-1.036626, -1.138393, -1.982168, 1, 1, 1, 1, 1,
-1.033611, 1.293351, 0.1594241, 1, 1, 1, 1, 1,
-1.033564, 2.392369, -0.4650739, 1, 1, 1, 1, 1,
-1.030576, -0.7774115, -2.133915, 1, 1, 1, 1, 1,
-1.027527, -0.5144314, -4.539454, 1, 1, 1, 1, 1,
-1.02087, -1.857583, -0.1166503, 1, 1, 1, 1, 1,
-1.020741, -1.796781, -2.337408, 1, 1, 1, 1, 1,
-1.009606, 0.4733925, 0.7916335, 1, 1, 1, 1, 1,
-1.008944, 0.5836436, -1.804165, 1, 1, 1, 1, 1,
-1.008397, 0.6917877, -0.4307296, 1, 1, 1, 1, 1,
-1.007161, -1.044359, -3.820181, 1, 1, 1, 1, 1,
-0.9914115, -0.1786018, -1.127283, 0, 0, 1, 1, 1,
-0.9860983, -0.2378079, -1.00513, 1, 0, 0, 1, 1,
-0.9788228, -1.598232, -2.263272, 1, 0, 0, 1, 1,
-0.9775761, 0.5618353, -0.2354351, 1, 0, 0, 1, 1,
-0.9695547, 0.7922979, 0.5882794, 1, 0, 0, 1, 1,
-0.96259, 1.367847, -0.3589424, 1, 0, 0, 1, 1,
-0.96116, 0.4477156, -0.5405095, 0, 0, 0, 1, 1,
-0.9573267, -0.4129321, 0.4065894, 0, 0, 0, 1, 1,
-0.952111, 0.6425958, -1.828335, 0, 0, 0, 1, 1,
-0.9450386, -1.032359, -0.4977346, 0, 0, 0, 1, 1,
-0.9439312, -2.396607, -2.797457, 0, 0, 0, 1, 1,
-0.9397121, 1.247904, -0.4453356, 0, 0, 0, 1, 1,
-0.9298381, -1.010913, -2.385514, 0, 0, 0, 1, 1,
-0.9258793, 1.20253, 0.5790902, 1, 1, 1, 1, 1,
-0.9217626, -0.4695953, -0.5927112, 1, 1, 1, 1, 1,
-0.9133823, 2.578551, 0.2518005, 1, 1, 1, 1, 1,
-0.9046665, -0.4373585, -1.608263, 1, 1, 1, 1, 1,
-0.8966785, 1.729294, -1.034458, 1, 1, 1, 1, 1,
-0.8962275, -0.9175615, -4.550715, 1, 1, 1, 1, 1,
-0.8928446, 0.6469364, -0.1058853, 1, 1, 1, 1, 1,
-0.8884834, -0.3053257, -1.432195, 1, 1, 1, 1, 1,
-0.8825202, -0.3287429, -1.158762, 1, 1, 1, 1, 1,
-0.8798539, -0.5781553, -1.285992, 1, 1, 1, 1, 1,
-0.8778017, 0.9457, 0.3959623, 1, 1, 1, 1, 1,
-0.8700005, 1.339575, -0.9480833, 1, 1, 1, 1, 1,
-0.867339, 1.302414, -0.6844978, 1, 1, 1, 1, 1,
-0.8671643, -0.3927267, -2.392674, 1, 1, 1, 1, 1,
-0.8623244, -1.848984, -2.756425, 1, 1, 1, 1, 1,
-0.8623065, -0.7505723, -3.070316, 0, 0, 1, 1, 1,
-0.8584475, -2.029968, -3.1009, 1, 0, 0, 1, 1,
-0.8569244, -0.648165, -2.491397, 1, 0, 0, 1, 1,
-0.856415, 0.08818841, -1.93544, 1, 0, 0, 1, 1,
-0.8504551, 1.365585, 0.9760814, 1, 0, 0, 1, 1,
-0.8452586, -0.2317933, -2.488373, 1, 0, 0, 1, 1,
-0.8441805, -0.9163976, -3.843378, 0, 0, 0, 1, 1,
-0.843146, 0.4500484, -2.22508, 0, 0, 0, 1, 1,
-0.822458, 0.6557941, -1.122697, 0, 0, 0, 1, 1,
-0.8192374, 1.246501, 1.038099, 0, 0, 0, 1, 1,
-0.818769, -1.540223, -3.169044, 0, 0, 0, 1, 1,
-0.8113111, 0.07089673, 1.018104, 0, 0, 0, 1, 1,
-0.8085285, 0.2698915, -1.017965, 0, 0, 0, 1, 1,
-0.8077443, -0.9869525, -3.437907, 1, 1, 1, 1, 1,
-0.8030428, 0.06355584, 1.044389, 1, 1, 1, 1, 1,
-0.8019971, 0.05267336, -1.269949, 1, 1, 1, 1, 1,
-0.8009678, 0.1345749, -0.09691501, 1, 1, 1, 1, 1,
-0.7890221, 0.7078081, 0.1322289, 1, 1, 1, 1, 1,
-0.7835165, 0.9069332, -0.9786887, 1, 1, 1, 1, 1,
-0.7815937, -0.6843004, -0.6017409, 1, 1, 1, 1, 1,
-0.7773644, -1.828117, -4.284019, 1, 1, 1, 1, 1,
-0.7758371, -0.3777524, -1.819118, 1, 1, 1, 1, 1,
-0.7730708, -0.5638189, -2.316779, 1, 1, 1, 1, 1,
-0.7692269, 0.7965145, -0.7209402, 1, 1, 1, 1, 1,
-0.7682079, -1.00201, -3.503843, 1, 1, 1, 1, 1,
-0.7650765, 0.3048034, -1.03128, 1, 1, 1, 1, 1,
-0.7643956, 0.3979563, -0.6350123, 1, 1, 1, 1, 1,
-0.7577776, 0.6261768, -0.371883, 1, 1, 1, 1, 1,
-0.7553627, -0.4031866, -2.46683, 0, 0, 1, 1, 1,
-0.750335, -3.045862, -2.609041, 1, 0, 0, 1, 1,
-0.7484354, -0.669085, -0.8266025, 1, 0, 0, 1, 1,
-0.7416322, -0.772064, -1.971157, 1, 0, 0, 1, 1,
-0.7334232, 1.451345, -0.8369553, 1, 0, 0, 1, 1,
-0.7312752, 0.04149339, -2.00247, 1, 0, 0, 1, 1,
-0.7301174, -1.380848, -3.119394, 0, 0, 0, 1, 1,
-0.7250986, 0.5585735, -0.9115915, 0, 0, 0, 1, 1,
-0.7245587, -1.121203, -2.458294, 0, 0, 0, 1, 1,
-0.7237673, -0.614139, -3.019431, 0, 0, 0, 1, 1,
-0.7212614, -0.5659202, -4.603823, 0, 0, 0, 1, 1,
-0.7208115, -0.1743718, -0.4198416, 0, 0, 0, 1, 1,
-0.7161041, -0.7677561, -2.96418, 0, 0, 0, 1, 1,
-0.7127444, 0.3477847, -1.297249, 1, 1, 1, 1, 1,
-0.7110745, -0.4012816, -1.435163, 1, 1, 1, 1, 1,
-0.710601, -0.8188853, -3.671055, 1, 1, 1, 1, 1,
-0.7095185, 1.347134, -0.6430216, 1, 1, 1, 1, 1,
-0.7081532, -0.4372735, -2.30852, 1, 1, 1, 1, 1,
-0.7059051, 0.001254181, -2.104443, 1, 1, 1, 1, 1,
-0.7032634, 0.5943438, -2.983462, 1, 1, 1, 1, 1,
-0.7018877, -0.4196342, -1.762783, 1, 1, 1, 1, 1,
-0.7004406, -0.2712432, -0.4895608, 1, 1, 1, 1, 1,
-0.6829534, 0.2389665, -1.560757, 1, 1, 1, 1, 1,
-0.6824776, 0.5072423, -2.518423, 1, 1, 1, 1, 1,
-0.6810053, -0.350408, -2.082381, 1, 1, 1, 1, 1,
-0.6796528, 0.8292197, 0.07635461, 1, 1, 1, 1, 1,
-0.678879, 1.460236, -1.915484, 1, 1, 1, 1, 1,
-0.6742774, 1.110604, -0.8911182, 1, 1, 1, 1, 1,
-0.6684535, -0.7121826, -2.658454, 0, 0, 1, 1, 1,
-0.6674022, 0.3469173, -1.419559, 1, 0, 0, 1, 1,
-0.6624225, 1.649446, -0.3593974, 1, 0, 0, 1, 1,
-0.6617683, -1.704622, -3.83015, 1, 0, 0, 1, 1,
-0.6575899, 0.3734833, -0.4280919, 1, 0, 0, 1, 1,
-0.6564663, -0.8166336, -3.742143, 1, 0, 0, 1, 1,
-0.6548611, -0.4656172, -2.425743, 0, 0, 0, 1, 1,
-0.6547038, 0.6893799, -0.317211, 0, 0, 0, 1, 1,
-0.6513723, 1.303842, -0.06986916, 0, 0, 0, 1, 1,
-0.6505671, 0.7347613, -0.6103653, 0, 0, 0, 1, 1,
-0.649007, 0.9262542, -0.9916961, 0, 0, 0, 1, 1,
-0.6469288, 1.577201, -0.7103446, 0, 0, 0, 1, 1,
-0.6452634, 0.1310748, -1.350986, 0, 0, 0, 1, 1,
-0.6431429, -1.340887, -1.823401, 1, 1, 1, 1, 1,
-0.6429445, -0.01419566, -2.325734, 1, 1, 1, 1, 1,
-0.6387696, -1.566058, -2.199581, 1, 1, 1, 1, 1,
-0.6378455, 0.7007247, -1.016592, 1, 1, 1, 1, 1,
-0.6375713, -0.1099082, -2.578548, 1, 1, 1, 1, 1,
-0.6367061, -0.5135934, -2.496015, 1, 1, 1, 1, 1,
-0.6347661, 0.5460048, 0.7664996, 1, 1, 1, 1, 1,
-0.63439, -1.49078, -2.441427, 1, 1, 1, 1, 1,
-0.6307164, -0.5633603, -3.091235, 1, 1, 1, 1, 1,
-0.6277167, 0.3627783, -1.271581, 1, 1, 1, 1, 1,
-0.623597, -0.7836336, -3.05981, 1, 1, 1, 1, 1,
-0.6220858, 0.3413031, -1.457813, 1, 1, 1, 1, 1,
-0.6204002, -3.328767, -0.436572, 1, 1, 1, 1, 1,
-0.6200576, -0.4732816, -1.893523, 1, 1, 1, 1, 1,
-0.6181852, -0.6376426, -2.353342, 1, 1, 1, 1, 1,
-0.6169034, 2.65147, 0.2014064, 0, 0, 1, 1, 1,
-0.6166126, 0.08522647, -0.7291795, 1, 0, 0, 1, 1,
-0.6103815, 0.6717849, -0.6905112, 1, 0, 0, 1, 1,
-0.6101969, -2.096097, -2.373984, 1, 0, 0, 1, 1,
-0.608662, 0.8382511, 0.2461812, 1, 0, 0, 1, 1,
-0.6067289, -2.054901, -2.799054, 1, 0, 0, 1, 1,
-0.6048024, -0.6102508, -4.149734, 0, 0, 0, 1, 1,
-0.6040807, -0.4289168, -2.051594, 0, 0, 0, 1, 1,
-0.5994873, 0.2201974, -1.918863, 0, 0, 0, 1, 1,
-0.5930696, 2.390458, -0.5481821, 0, 0, 0, 1, 1,
-0.593059, 1.504782, 0.1732675, 0, 0, 0, 1, 1,
-0.5869259, 0.5162804, -1.889444, 0, 0, 0, 1, 1,
-0.5866307, -0.9966332, -2.44168, 0, 0, 0, 1, 1,
-0.5848622, 0.7015322, -1.272837, 1, 1, 1, 1, 1,
-0.5827932, 1.572112, -0.6870788, 1, 1, 1, 1, 1,
-0.5817779, 0.2936186, -0.2569699, 1, 1, 1, 1, 1,
-0.5784322, -1.112047, -1.834608, 1, 1, 1, 1, 1,
-0.5727782, -1.639485, -3.280049, 1, 1, 1, 1, 1,
-0.5650953, -2.88659, -3.193692, 1, 1, 1, 1, 1,
-0.5595906, -0.9655185, -0.5187522, 1, 1, 1, 1, 1,
-0.5591733, 0.5188366, 0.3800355, 1, 1, 1, 1, 1,
-0.5532845, 1.260101, -2.217271, 1, 1, 1, 1, 1,
-0.5468241, 1.640966, 0.3915753, 1, 1, 1, 1, 1,
-0.5465932, 1.873134, 0.6415013, 1, 1, 1, 1, 1,
-0.5373977, 1.069016, -0.8086218, 1, 1, 1, 1, 1,
-0.5367613, 0.5314674, -1.214386, 1, 1, 1, 1, 1,
-0.5365117, 0.0445496, -1.036327, 1, 1, 1, 1, 1,
-0.5332506, -0.08518957, -0.4001858, 1, 1, 1, 1, 1,
-0.5295593, 0.9040878, -0.5740901, 0, 0, 1, 1, 1,
-0.5281528, -2.019694, -2.394862, 1, 0, 0, 1, 1,
-0.5280574, -0.8929328, -3.200024, 1, 0, 0, 1, 1,
-0.5217806, -1.635276, -3.050579, 1, 0, 0, 1, 1,
-0.5116415, 1.195672, -1.407246, 1, 0, 0, 1, 1,
-0.5116278, 0.6557003, -0.3617206, 1, 0, 0, 1, 1,
-0.5104141, -0.4932937, -1.231604, 0, 0, 0, 1, 1,
-0.5068071, 0.2585966, -1.812648, 0, 0, 0, 1, 1,
-0.4910309, 0.1694709, -0.9628432, 0, 0, 0, 1, 1,
-0.4842114, 0.469284, -2.284647, 0, 0, 0, 1, 1,
-0.4837629, -1.930729, -0.8638207, 0, 0, 0, 1, 1,
-0.4804845, 0.5219743, 2.20499, 0, 0, 0, 1, 1,
-0.4791749, -0.1889726, -2.816014, 0, 0, 0, 1, 1,
-0.4785841, 2.081979, 0.4944599, 1, 1, 1, 1, 1,
-0.474094, 0.5039647, -1.428268, 1, 1, 1, 1, 1,
-0.4723517, -0.8422195, -1.839503, 1, 1, 1, 1, 1,
-0.4704584, -1.206517, -2.429158, 1, 1, 1, 1, 1,
-0.4681644, -0.2382029, -3.285396, 1, 1, 1, 1, 1,
-0.4669653, 0.0512203, -1.26351, 1, 1, 1, 1, 1,
-0.4668186, 1.591926, -0.7377075, 1, 1, 1, 1, 1,
-0.4605917, -1.277832, -0.629304, 1, 1, 1, 1, 1,
-0.4577798, 0.7946866, 0.6888942, 1, 1, 1, 1, 1,
-0.4557436, -1.634682, -1.965892, 1, 1, 1, 1, 1,
-0.454259, 0.6174755, 0.3391427, 1, 1, 1, 1, 1,
-0.4494434, 0.8045533, -1.722774, 1, 1, 1, 1, 1,
-0.4443665, 0.8084258, -0.7004675, 1, 1, 1, 1, 1,
-0.4344492, 1.510009, -1.376331, 1, 1, 1, 1, 1,
-0.4339332, 0.5867192, -0.2074364, 1, 1, 1, 1, 1,
-0.431917, 0.1308069, -2.229168, 0, 0, 1, 1, 1,
-0.4295644, -1.102453, -2.463102, 1, 0, 0, 1, 1,
-0.4268366, 1.560607, -1.515435, 1, 0, 0, 1, 1,
-0.4257375, -1.040035, -1.981029, 1, 0, 0, 1, 1,
-0.4216738, -0.3752455, -3.24753, 1, 0, 0, 1, 1,
-0.417845, 1.509683, -0.7486315, 1, 0, 0, 1, 1,
-0.417593, 0.4092401, -1.570316, 0, 0, 0, 1, 1,
-0.415846, 0.7106556, -1.936821, 0, 0, 0, 1, 1,
-0.4142847, 1.014799, -1.193578, 0, 0, 0, 1, 1,
-0.400304, -0.8195119, -3.811574, 0, 0, 0, 1, 1,
-0.3939047, -0.6013415, -2.968783, 0, 0, 0, 1, 1,
-0.3926254, -1.615002, -2.941516, 0, 0, 0, 1, 1,
-0.3853356, -1.402319, -3.756939, 0, 0, 0, 1, 1,
-0.3752062, -0.4975885, -2.105523, 1, 1, 1, 1, 1,
-0.3751916, 1.19654, 0.4371784, 1, 1, 1, 1, 1,
-0.374485, 0.874828, -1.671974, 1, 1, 1, 1, 1,
-0.373742, -1.37729, -4.499533, 1, 1, 1, 1, 1,
-0.3624924, 2.796839, 0.08057907, 1, 1, 1, 1, 1,
-0.3617898, 0.9632843, -1.893129, 1, 1, 1, 1, 1,
-0.361583, 1.270556, -1.468323, 1, 1, 1, 1, 1,
-0.358139, 0.2537802, -2.377743, 1, 1, 1, 1, 1,
-0.3577676, -0.5714967, -3.235994, 1, 1, 1, 1, 1,
-0.3576171, 0.782627, 0.9267474, 1, 1, 1, 1, 1,
-0.3553094, 1.01334, 0.587525, 1, 1, 1, 1, 1,
-0.3543293, -0.2319201, -2.42178, 1, 1, 1, 1, 1,
-0.3530468, -1.352604, -4.054429, 1, 1, 1, 1, 1,
-0.3513178, -0.1438673, -3.140184, 1, 1, 1, 1, 1,
-0.3512191, 0.4164862, -0.3339532, 1, 1, 1, 1, 1,
-0.3490438, -1.448845, -1.950197, 0, 0, 1, 1, 1,
-0.3477508, -1.164047, -1.696923, 1, 0, 0, 1, 1,
-0.3475033, -1.348887, -2.255672, 1, 0, 0, 1, 1,
-0.3433687, 1.110808, 0.2860669, 1, 0, 0, 1, 1,
-0.3359732, -0.5770849, -2.066396, 1, 0, 0, 1, 1,
-0.335097, 0.871295, 0.7607474, 1, 0, 0, 1, 1,
-0.3299556, 0.3336295, 0.156499, 0, 0, 0, 1, 1,
-0.3294793, 1.190376, -1.426685, 0, 0, 0, 1, 1,
-0.3283106, 0.5556132, -0.5260634, 0, 0, 0, 1, 1,
-0.3282481, 0.4716801, -0.3039345, 0, 0, 0, 1, 1,
-0.3271752, -0.2037786, -0.9376609, 0, 0, 0, 1, 1,
-0.3254744, 0.2425665, -0.6241499, 0, 0, 0, 1, 1,
-0.3224439, 1.875751, 0.1360677, 0, 0, 0, 1, 1,
-0.3134904, 0.341034, -1.396785, 1, 1, 1, 1, 1,
-0.3114269, 0.535995, -2.480734, 1, 1, 1, 1, 1,
-0.3079235, -1.471121, -1.876086, 1, 1, 1, 1, 1,
-0.3065243, 0.5232961, -1.252309, 1, 1, 1, 1, 1,
-0.3024, -0.2810557, -2.633444, 1, 1, 1, 1, 1,
-0.3013597, 0.01971588, -1.731735, 1, 1, 1, 1, 1,
-0.2983418, -1.45307, -2.879054, 1, 1, 1, 1, 1,
-0.2959861, -0.363439, -1.171201, 1, 1, 1, 1, 1,
-0.2952085, -0.1336872, -2.852927, 1, 1, 1, 1, 1,
-0.2922406, 1.733979, 0.0105675, 1, 1, 1, 1, 1,
-0.2909078, -0.786957, -3.3966, 1, 1, 1, 1, 1,
-0.2908016, 0.1688941, -0.05125164, 1, 1, 1, 1, 1,
-0.2874922, -0.1537454, -3.404098, 1, 1, 1, 1, 1,
-0.2863473, 0.3254019, -2.430008, 1, 1, 1, 1, 1,
-0.2853267, -1.98236, -3.677391, 1, 1, 1, 1, 1,
-0.2812896, 0.5332522, 0.6407851, 0, 0, 1, 1, 1,
-0.279936, -1.506025, -3.616514, 1, 0, 0, 1, 1,
-0.2760406, -1.611064, -1.919367, 1, 0, 0, 1, 1,
-0.2683987, 1.281611, 1.286347, 1, 0, 0, 1, 1,
-0.2675992, -2.057025, -3.81614, 1, 0, 0, 1, 1,
-0.261694, -0.1862208, -2.268411, 1, 0, 0, 1, 1,
-0.2595665, 0.06437331, -2.930679, 0, 0, 0, 1, 1,
-0.2576649, -0.1168581, -1.022286, 0, 0, 0, 1, 1,
-0.2559499, -1.875793, -4.733536, 0, 0, 0, 1, 1,
-0.2555164, -1.294282, -1.15591, 0, 0, 0, 1, 1,
-0.2531388, 0.1703459, -1.541788, 0, 0, 0, 1, 1,
-0.2521589, 1.133047, 0.5845015, 0, 0, 0, 1, 1,
-0.2480581, -3.312659, -3.9325, 0, 0, 0, 1, 1,
-0.2459403, 0.2864198, -0.2916861, 1, 1, 1, 1, 1,
-0.245225, 0.2797548, -0.9717286, 1, 1, 1, 1, 1,
-0.2440854, -0.01777997, -0.9384018, 1, 1, 1, 1, 1,
-0.2413785, 0.2901668, -1.476272, 1, 1, 1, 1, 1,
-0.2410858, 1.282729, -0.9262416, 1, 1, 1, 1, 1,
-0.2406305, 0.5110387, -1.078751, 1, 1, 1, 1, 1,
-0.2382467, -0.2007988, -3.094222, 1, 1, 1, 1, 1,
-0.2319094, -0.8755383, -0.9847891, 1, 1, 1, 1, 1,
-0.2303779, -0.9250143, -4.428955, 1, 1, 1, 1, 1,
-0.2275244, -1.64298, -3.798427, 1, 1, 1, 1, 1,
-0.2266863, 0.1040289, -1.35384, 1, 1, 1, 1, 1,
-0.2254955, -0.614322, -2.147494, 1, 1, 1, 1, 1,
-0.2233004, -1.808904, -1.457547, 1, 1, 1, 1, 1,
-0.2217869, -0.6473991, -2.99019, 1, 1, 1, 1, 1,
-0.2183969, 1.439066, 2.224057, 1, 1, 1, 1, 1,
-0.2163957, 0.9076186, -1.277501, 0, 0, 1, 1, 1,
-0.2123942, -0.6814897, -2.513826, 1, 0, 0, 1, 1,
-0.2082536, -0.4387338, -3.062395, 1, 0, 0, 1, 1,
-0.2022067, -1.104244, -3.68597, 1, 0, 0, 1, 1,
-0.2017301, -0.1734298, -2.177189, 1, 0, 0, 1, 1,
-0.2016875, 0.3787889, -2.962448, 1, 0, 0, 1, 1,
-0.1983715, -0.7822793, -2.715745, 0, 0, 0, 1, 1,
-0.1954587, 0.1587911, -1.402855, 0, 0, 0, 1, 1,
-0.1923427, -1.811317, -1.988343, 0, 0, 0, 1, 1,
-0.1921926, 0.08564153, -1.740937, 0, 0, 0, 1, 1,
-0.1896083, 0.8749308, -0.01159722, 0, 0, 0, 1, 1,
-0.1895723, -0.1973202, -2.06533, 0, 0, 0, 1, 1,
-0.1886316, -0.9236123, -2.868851, 0, 0, 0, 1, 1,
-0.1879679, 0.1446391, -0.5312642, 1, 1, 1, 1, 1,
-0.1852462, 0.77523, 0.03728873, 1, 1, 1, 1, 1,
-0.1823273, -0.3007879, -2.164822, 1, 1, 1, 1, 1,
-0.1802838, -0.7894707, -3.247169, 1, 1, 1, 1, 1,
-0.1789107, 0.7215911, 0.2981595, 1, 1, 1, 1, 1,
-0.1740343, 0.1511595, -2.042582, 1, 1, 1, 1, 1,
-0.1727893, -0.2518763, -2.554208, 1, 1, 1, 1, 1,
-0.1721576, -0.1571305, -1.248013, 1, 1, 1, 1, 1,
-0.169682, 1.469918, 1.49323, 1, 1, 1, 1, 1,
-0.1674449, -1.756653, -3.719433, 1, 1, 1, 1, 1,
-0.1634184, 0.8485715, 0.5645475, 1, 1, 1, 1, 1,
-0.16098, -1.258183, -3.168304, 1, 1, 1, 1, 1,
-0.1571106, 1.541653, 1.234761, 1, 1, 1, 1, 1,
-0.1569795, -0.7376022, -3.983552, 1, 1, 1, 1, 1,
-0.1526107, 0.7536215, -0.3959253, 1, 1, 1, 1, 1,
-0.1500593, -1.570982, -1.363169, 0, 0, 1, 1, 1,
-0.1434592, -1.385868, -3.23706, 1, 0, 0, 1, 1,
-0.1433063, -0.7663436, -3.39241, 1, 0, 0, 1, 1,
-0.1412493, -0.6173995, -3.077765, 1, 0, 0, 1, 1,
-0.140952, 0.3746065, -0.5933578, 1, 0, 0, 1, 1,
-0.1406778, -0.02919228, -1.946839, 1, 0, 0, 1, 1,
-0.134287, 0.3584989, 2.36802, 0, 0, 0, 1, 1,
-0.133239, -0.2957238, -1.348387, 0, 0, 0, 1, 1,
-0.1307948, -0.7812976, -4.097557, 0, 0, 0, 1, 1,
-0.1299386, 1.089049, -2.966562, 0, 0, 0, 1, 1,
-0.1294253, 0.9793959, -0.6222878, 0, 0, 0, 1, 1,
-0.1274973, -0.2190365, -2.410797, 0, 0, 0, 1, 1,
-0.1264253, -0.8014331, -3.380836, 0, 0, 0, 1, 1,
-0.1149084, -0.7824242, -2.664093, 1, 1, 1, 1, 1,
-0.1118024, 1.817976, -2.111181, 1, 1, 1, 1, 1,
-0.1115504, -0.1856761, -4.299955, 1, 1, 1, 1, 1,
-0.1107326, -0.6724904, -2.630499, 1, 1, 1, 1, 1,
-0.1106517, 1.340203, 1.393608, 1, 1, 1, 1, 1,
-0.1053405, 0.9409835, 0.3440349, 1, 1, 1, 1, 1,
-0.1047601, 0.4329146, -0.9105132, 1, 1, 1, 1, 1,
-0.1006914, -1.895425, -3.52423, 1, 1, 1, 1, 1,
-0.09931174, -0.7447614, -2.924485, 1, 1, 1, 1, 1,
-0.09847066, 0.8708448, 0.8885308, 1, 1, 1, 1, 1,
-0.09166123, -0.3421541, -3.934521, 1, 1, 1, 1, 1,
-0.08766076, 1.142002, 0.8590986, 1, 1, 1, 1, 1,
-0.08734229, 0.5959939, 1.271614, 1, 1, 1, 1, 1,
-0.08672139, 1.763987, -1.163407, 1, 1, 1, 1, 1,
-0.08636822, 0.5312887, -0.4218429, 1, 1, 1, 1, 1,
-0.08471837, -0.5367609, -3.878511, 0, 0, 1, 1, 1,
-0.07877137, 0.7864482, 0.4560693, 1, 0, 0, 1, 1,
-0.07511453, 0.1332161, -0.1626381, 1, 0, 0, 1, 1,
-0.0747648, 0.9858978, -0.6211749, 1, 0, 0, 1, 1,
-0.07367364, 1.364373, -0.2167579, 1, 0, 0, 1, 1,
-0.07239007, -0.9446272, -3.70655, 1, 0, 0, 1, 1,
-0.07113098, 2.182638, 1.000452, 0, 0, 0, 1, 1,
-0.06873465, 0.001054715, -1.872705, 0, 0, 0, 1, 1,
-0.0638366, 0.1461798, 1.20616, 0, 0, 0, 1, 1,
-0.06164452, -0.2839625, -2.648403, 0, 0, 0, 1, 1,
-0.05897709, 0.2264064, 1.693778, 0, 0, 0, 1, 1,
-0.0571552, -0.8748031, -2.772763, 0, 0, 0, 1, 1,
-0.05481159, 0.8060967, 0.0787132, 0, 0, 0, 1, 1,
-0.05395618, -2.519273, -3.006959, 1, 1, 1, 1, 1,
-0.05173231, 0.1399949, -0.1158451, 1, 1, 1, 1, 1,
-0.0427396, 0.2686549, -0.3619422, 1, 1, 1, 1, 1,
-0.03866946, 1.326693, 1.384532, 1, 1, 1, 1, 1,
-0.0384919, 0.1535866, -0.5467078, 1, 1, 1, 1, 1,
-0.03510129, 1.115155, -1.958608, 1, 1, 1, 1, 1,
-0.034893, -0.7986228, -4.315971, 1, 1, 1, 1, 1,
-0.03221139, -0.1155845, -2.37207, 1, 1, 1, 1, 1,
-0.02794612, 0.3806339, 0.5274337, 1, 1, 1, 1, 1,
-0.02744981, -0.9449947, -2.310783, 1, 1, 1, 1, 1,
-0.02688393, -0.7062603, -2.911865, 1, 1, 1, 1, 1,
-0.02682756, -0.3829333, -2.493136, 1, 1, 1, 1, 1,
-0.02345948, 0.5983471, 0.6840737, 1, 1, 1, 1, 1,
-0.02187701, 1.42977, -0.7917039, 1, 1, 1, 1, 1,
-0.02015719, -0.9637091, -3.197295, 1, 1, 1, 1, 1,
-0.01920215, -1.521138, -1.246791, 0, 0, 1, 1, 1,
-0.01608843, 0.0280032, -0.2258864, 1, 0, 0, 1, 1,
-0.01186887, -0.1782793, -3.174904, 1, 0, 0, 1, 1,
-0.01077992, 0.5473063, 1.795265, 1, 0, 0, 1, 1,
-0.01069488, -0.1902609, -4.219861, 1, 0, 0, 1, 1,
-0.01020094, 0.4196149, 0.006838094, 1, 0, 0, 1, 1,
-0.009719852, -1.388639, -2.600363, 0, 0, 0, 1, 1,
-0.009111587, -0.2376017, -2.861609, 0, 0, 0, 1, 1,
-0.008353711, 1.504121, -0.05779563, 0, 0, 0, 1, 1,
-0.007777915, -0.2993969, -5.053834, 0, 0, 0, 1, 1,
-0.007600458, -0.8179498, -3.581418, 0, 0, 0, 1, 1,
-0.003606374, -0.2449234, -2.505655, 0, 0, 0, 1, 1,
1.139526e-05, -0.1549125, 2.721637, 0, 0, 0, 1, 1,
0.006515037, 1.45708, -1.825248, 1, 1, 1, 1, 1,
0.006558737, -0.4446929, 3.800721, 1, 1, 1, 1, 1,
0.01989617, -0.911517, 3.155081, 1, 1, 1, 1, 1,
0.02560126, 0.9312416, -1.041642, 1, 1, 1, 1, 1,
0.02743566, 1.206107, -0.4124878, 1, 1, 1, 1, 1,
0.03366261, -0.4507937, 2.603391, 1, 1, 1, 1, 1,
0.03536496, 0.1725726, -0.03891709, 1, 1, 1, 1, 1,
0.03958233, -0.04551448, 3.448084, 1, 1, 1, 1, 1,
0.04121259, 0.07054906, -0.8006813, 1, 1, 1, 1, 1,
0.04368963, -0.4709217, 0.5186414, 1, 1, 1, 1, 1,
0.0447729, 0.3358573, 0.3724047, 1, 1, 1, 1, 1,
0.04720034, -1.182168, 4.192926, 1, 1, 1, 1, 1,
0.05379108, -0.2889787, 3.196023, 1, 1, 1, 1, 1,
0.05867418, -0.4062766, 3.312627, 1, 1, 1, 1, 1,
0.05972608, -1.445633, 2.678424, 1, 1, 1, 1, 1,
0.06194184, -0.9796586, 2.568538, 0, 0, 1, 1, 1,
0.06689949, 0.5211207, 0.2116242, 1, 0, 0, 1, 1,
0.06926019, 1.140691, 0.8318702, 1, 0, 0, 1, 1,
0.07928646, -1.068181, 3.530941, 1, 0, 0, 1, 1,
0.08128215, 0.7735927, 1.765383, 1, 0, 0, 1, 1,
0.08535934, 1.058627, 0.03530085, 1, 0, 0, 1, 1,
0.09015331, -0.7645619, 2.969578, 0, 0, 0, 1, 1,
0.09158204, 1.350947, 1.661355, 0, 0, 0, 1, 1,
0.09365922, 1.25311, -0.8260289, 0, 0, 0, 1, 1,
0.09475634, -1.880507, 1.951478, 0, 0, 0, 1, 1,
0.09992711, -0.4190224, 2.236482, 0, 0, 0, 1, 1,
0.1008508, 0.7946677, 0.2873339, 0, 0, 0, 1, 1,
0.1022993, -1.070183, 0.3752883, 0, 0, 0, 1, 1,
0.1051493, -0.7728542, 3.404975, 1, 1, 1, 1, 1,
0.1079825, 0.06648204, 1.055664, 1, 1, 1, 1, 1,
0.1081435, 0.9042169, 0.9440798, 1, 1, 1, 1, 1,
0.1128134, 0.3266938, 0.6141458, 1, 1, 1, 1, 1,
0.1242516, 0.4867913, 0.6548107, 1, 1, 1, 1, 1,
0.1249386, -0.7020344, 4.840681, 1, 1, 1, 1, 1,
0.1253108, 0.4432489, -0.4261629, 1, 1, 1, 1, 1,
0.1282396, 0.1151923, 0.5047235, 1, 1, 1, 1, 1,
0.132348, 0.444593, 0.4307571, 1, 1, 1, 1, 1,
0.1342577, 1.500832, -0.6102326, 1, 1, 1, 1, 1,
0.1348816, 0.2109389, 0.497874, 1, 1, 1, 1, 1,
0.1357125, -0.9396722, 4.215641, 1, 1, 1, 1, 1,
0.1365696, 0.0194978, 0.5208627, 1, 1, 1, 1, 1,
0.1454711, -0.4405163, 3.007315, 1, 1, 1, 1, 1,
0.1463655, -0.5686408, 3.78663, 1, 1, 1, 1, 1,
0.1493128, -1.314009, 2.740299, 0, 0, 1, 1, 1,
0.15178, -0.4970946, 2.730475, 1, 0, 0, 1, 1,
0.153978, 2.238421, 1.24748, 1, 0, 0, 1, 1,
0.156333, 1.562233, 1.97084, 1, 0, 0, 1, 1,
0.1589521, 0.3466983, -0.08993028, 1, 0, 0, 1, 1,
0.1610225, -1.508018, 3.930755, 1, 0, 0, 1, 1,
0.163321, -0.2190569, 1.610535, 0, 0, 0, 1, 1,
0.1663971, -0.4964451, 2.024384, 0, 0, 0, 1, 1,
0.1703623, -0.4182379, 2.172916, 0, 0, 0, 1, 1,
0.1740696, 0.8075509, 0.2042652, 0, 0, 0, 1, 1,
0.177652, 0.9132438, -0.2094013, 0, 0, 0, 1, 1,
0.18046, -1.654675, 3.838694, 0, 0, 0, 1, 1,
0.1812874, 2.602304, -1.486525, 0, 0, 0, 1, 1,
0.1831209, -0.7307492, 1.716366, 1, 1, 1, 1, 1,
0.1846097, 0.9232549, 0.5805273, 1, 1, 1, 1, 1,
0.187218, -1.368841, 3.186079, 1, 1, 1, 1, 1,
0.1879181, 1.540293, -0.136397, 1, 1, 1, 1, 1,
0.1893924, 1.343643, 1.207325, 1, 1, 1, 1, 1,
0.1931391, -0.1642824, 2.568871, 1, 1, 1, 1, 1,
0.1931449, 0.7821668, -0.7299938, 1, 1, 1, 1, 1,
0.193998, 0.3053012, -0.01556814, 1, 1, 1, 1, 1,
0.194641, 1.51951, -0.007584719, 1, 1, 1, 1, 1,
0.1980306, 1.652453, -0.1139483, 1, 1, 1, 1, 1,
0.2014176, -0.9524258, 4.066387, 1, 1, 1, 1, 1,
0.2015488, 1.63915, 0.09065522, 1, 1, 1, 1, 1,
0.202453, 0.8845756, 1.810595, 1, 1, 1, 1, 1,
0.2042373, -0.9387456, 3.714875, 1, 1, 1, 1, 1,
0.2093954, -0.5348165, 5.560994, 1, 1, 1, 1, 1,
0.2120602, 0.7583326, 0.9464512, 0, 0, 1, 1, 1,
0.2144, -0.4400794, 1.990485, 1, 0, 0, 1, 1,
0.2149409, 0.3252819, 0.7860566, 1, 0, 0, 1, 1,
0.2171047, 1.244783, 1.837853, 1, 0, 0, 1, 1,
0.2206356, -0.9437569, 4.357074, 1, 0, 0, 1, 1,
0.2250449, -0.02702893, 0.6470479, 1, 0, 0, 1, 1,
0.2301831, -0.9751938, 3.847634, 0, 0, 0, 1, 1,
0.2336276, -1.701248, 4.055161, 0, 0, 0, 1, 1,
0.2368657, 1.757565, 0.1038624, 0, 0, 0, 1, 1,
0.2384574, 0.136909, 0.2146613, 0, 0, 0, 1, 1,
0.2393775, 1.15649, 1.197292, 0, 0, 0, 1, 1,
0.2556828, 0.891736, 0.6617714, 0, 0, 0, 1, 1,
0.2601877, -0.6276483, 2.881591, 0, 0, 0, 1, 1,
0.2666349, -0.7267228, 1.933189, 1, 1, 1, 1, 1,
0.2676708, -0.09322119, 1.142089, 1, 1, 1, 1, 1,
0.2715694, -0.6418008, 3.411246, 1, 1, 1, 1, 1,
0.2800698, -0.5072167, 0.4398393, 1, 1, 1, 1, 1,
0.2802624, -0.8985605, 3.647937, 1, 1, 1, 1, 1,
0.2817897, -0.4497136, 2.942959, 1, 1, 1, 1, 1,
0.2819905, -2.591511, 3.402133, 1, 1, 1, 1, 1,
0.2869658, -2.116961, 1.514497, 1, 1, 1, 1, 1,
0.2883719, -0.4407041, 0.5217299, 1, 1, 1, 1, 1,
0.2900879, -0.1156315, 0.5241289, 1, 1, 1, 1, 1,
0.2939591, 1.564196, 1.764698, 1, 1, 1, 1, 1,
0.2987565, -0.1149106, 2.435738, 1, 1, 1, 1, 1,
0.2989495, -0.6937767, 3.318721, 1, 1, 1, 1, 1,
0.3009565, -0.6867078, 3.636218, 1, 1, 1, 1, 1,
0.3061369, -1.026058, 3.909014, 1, 1, 1, 1, 1,
0.307522, -0.04626159, 2.910581, 0, 0, 1, 1, 1,
0.3117454, -0.1665753, 0.1555468, 1, 0, 0, 1, 1,
0.3123525, -0.3103669, 2.211997, 1, 0, 0, 1, 1,
0.3152242, 0.6794033, -1.120219, 1, 0, 0, 1, 1,
0.3181939, -0.1919094, 1.64087, 1, 0, 0, 1, 1,
0.3184511, 2.314653, 0.7263453, 1, 0, 0, 1, 1,
0.3287499, 0.5492782, 1.348218, 0, 0, 0, 1, 1,
0.3305472, -1.741289, 2.899827, 0, 0, 0, 1, 1,
0.3308142, 1.396008, -0.2091693, 0, 0, 0, 1, 1,
0.3319316, -0.0500926, 0.3796528, 0, 0, 0, 1, 1,
0.3327215, -0.9187252, 2.546661, 0, 0, 0, 1, 1,
0.3355621, 0.3695574, 1.215596, 0, 0, 0, 1, 1,
0.3391367, -0.6466388, 1.989332, 0, 0, 0, 1, 1,
0.3405713, -0.4299314, 3.141738, 1, 1, 1, 1, 1,
0.3435293, 1.737339, 1.20289, 1, 1, 1, 1, 1,
0.3493644, -1.857733, 4.120114, 1, 1, 1, 1, 1,
0.3494382, -1.360543, 4.013662, 1, 1, 1, 1, 1,
0.3499959, 0.01179978, 1.919858, 1, 1, 1, 1, 1,
0.3514364, -0.6180843, 3.094695, 1, 1, 1, 1, 1,
0.3517467, 0.8736039, 0.4108465, 1, 1, 1, 1, 1,
0.3553717, -0.4044916, 3.91614, 1, 1, 1, 1, 1,
0.3561979, 0.4548953, 1.99079, 1, 1, 1, 1, 1,
0.362037, -0.3548925, 2.128979, 1, 1, 1, 1, 1,
0.3644906, -0.6501641, 1.682521, 1, 1, 1, 1, 1,
0.3662294, -0.2303526, 2.293409, 1, 1, 1, 1, 1,
0.3698799, 0.3696912, -0.6134974, 1, 1, 1, 1, 1,
0.3714114, -0.4658645, 3.988295, 1, 1, 1, 1, 1,
0.3737872, -1.160018, 2.67186, 1, 1, 1, 1, 1,
0.3753206, -0.8065023, 3.558633, 0, 0, 1, 1, 1,
0.3759323, -0.3349837, 1.430508, 1, 0, 0, 1, 1,
0.3800243, -0.7890471, 1.470542, 1, 0, 0, 1, 1,
0.3825811, 0.4543562, 1.168298, 1, 0, 0, 1, 1,
0.3845105, -0.4457927, 2.061082, 1, 0, 0, 1, 1,
0.3849564, 0.522785, 1.153127, 1, 0, 0, 1, 1,
0.3855031, 0.2902609, 0.7862753, 0, 0, 0, 1, 1,
0.386251, 0.4344414, 1.048146, 0, 0, 0, 1, 1,
0.3874262, -0.4316677, 2.68182, 0, 0, 0, 1, 1,
0.3909098, 1.264383, -0.08021694, 0, 0, 0, 1, 1,
0.3947331, -0.597084, 1.676653, 0, 0, 0, 1, 1,
0.4032175, -0.6828038, 2.038868, 0, 0, 0, 1, 1,
0.4065169, -0.1796619, 0.9807963, 0, 0, 0, 1, 1,
0.4157215, 0.6951799, 0.4513003, 1, 1, 1, 1, 1,
0.4157805, -0.2331987, -0.8363851, 1, 1, 1, 1, 1,
0.4185982, 1.119772, 1.716799, 1, 1, 1, 1, 1,
0.4206043, -0.1140514, 2.471003, 1, 1, 1, 1, 1,
0.4207172, 0.5261474, 0.9506428, 1, 1, 1, 1, 1,
0.4213295, -0.7259444, 3.710249, 1, 1, 1, 1, 1,
0.4227602, 0.6727199, -0.5261394, 1, 1, 1, 1, 1,
0.4246848, -0.3784699, 3.708551, 1, 1, 1, 1, 1,
0.4269377, 0.2109713, 2.147415, 1, 1, 1, 1, 1,
0.4292378, 0.2203496, 0.683405, 1, 1, 1, 1, 1,
0.4295224, -2.445756, 2.888031, 1, 1, 1, 1, 1,
0.4300091, -0.3348956, 2.493317, 1, 1, 1, 1, 1,
0.4302036, 0.6905785, 1.482009, 1, 1, 1, 1, 1,
0.4326328, 0.7830644, 0.07237812, 1, 1, 1, 1, 1,
0.4329444, -0.4829931, 2.590508, 1, 1, 1, 1, 1,
0.4358854, -0.2144697, 1.973947, 0, 0, 1, 1, 1,
0.4367371, -0.5205674, 1.456595, 1, 0, 0, 1, 1,
0.4372867, -1.929795, 1.692118, 1, 0, 0, 1, 1,
0.4375611, 1.07606, -0.8601148, 1, 0, 0, 1, 1,
0.4410143, 1.046628, -1.487358, 1, 0, 0, 1, 1,
0.4429446, 0.1726226, 2.962235, 1, 0, 0, 1, 1,
0.4537278, -0.3611083, 2.631856, 0, 0, 0, 1, 1,
0.4553516, -0.4550402, 2.581694, 0, 0, 0, 1, 1,
0.4658437, 0.809876, 1.23197, 0, 0, 0, 1, 1,
0.466002, -0.8641446, 4.296113, 0, 0, 0, 1, 1,
0.4674373, 0.1638153, 2.406227, 0, 0, 0, 1, 1,
0.4680397, 0.2667576, 0.7060916, 0, 0, 0, 1, 1,
0.4705819, -1.473307, 3.577964, 0, 0, 0, 1, 1,
0.4712227, 0.5063816, 2.095582, 1, 1, 1, 1, 1,
0.4875309, -1.062235, 3.641089, 1, 1, 1, 1, 1,
0.4889962, -1.260928, 3.802718, 1, 1, 1, 1, 1,
0.4935399, 0.6050206, 0.6921922, 1, 1, 1, 1, 1,
0.499823, -0.9876632, 1.392696, 1, 1, 1, 1, 1,
0.5006022, 0.8749511, 0.1714351, 1, 1, 1, 1, 1,
0.5088266, -0.4531826, 3.512328, 1, 1, 1, 1, 1,
0.5091203, -0.8521378, 2.889675, 1, 1, 1, 1, 1,
0.5149534, -0.06703736, 2.269938, 1, 1, 1, 1, 1,
0.516637, -0.454883, 1.437027, 1, 1, 1, 1, 1,
0.5175845, -0.2846366, 2.254614, 1, 1, 1, 1, 1,
0.5186668, 0.06106222, 2.202678, 1, 1, 1, 1, 1,
0.5404308, -0.102089, 1.723442, 1, 1, 1, 1, 1,
0.5468039, 0.485502, 1.364744, 1, 1, 1, 1, 1,
0.548105, -0.5800277, 2.728313, 1, 1, 1, 1, 1,
0.5553405, 0.7317306, 1.323427, 0, 0, 1, 1, 1,
0.5581946, 0.7370132, 0.8123085, 1, 0, 0, 1, 1,
0.5619954, -0.1685314, 2.877236, 1, 0, 0, 1, 1,
0.5631667, 1.146732, 0.09218937, 1, 0, 0, 1, 1,
0.5635732, 0.009650182, 0.584699, 1, 0, 0, 1, 1,
0.5668475, 0.7815378, 0.7298219, 1, 0, 0, 1, 1,
0.5690082, 1.109631, 1.476426, 0, 0, 0, 1, 1,
0.5703943, -0.3686073, 3.434135, 0, 0, 0, 1, 1,
0.5723621, -0.9612616, 2.416947, 0, 0, 0, 1, 1,
0.5754245, 0.5890013, 2.464729, 0, 0, 0, 1, 1,
0.5872931, 2.037579, 0.6962296, 0, 0, 0, 1, 1,
0.5901116, 0.4657467, 1.614452, 0, 0, 0, 1, 1,
0.5934716, 1.626485, 0.4201205, 0, 0, 0, 1, 1,
0.594169, 1.457282, 0.7364449, 1, 1, 1, 1, 1,
0.5989546, -2.128427, 2.108377, 1, 1, 1, 1, 1,
0.6003208, 0.2851211, 2.525917, 1, 1, 1, 1, 1,
0.6037669, -1.01393, 2.779457, 1, 1, 1, 1, 1,
0.6118003, -0.7819011, 1.322447, 1, 1, 1, 1, 1,
0.6141755, 0.9555786, 0.9099895, 1, 1, 1, 1, 1,
0.6185424, -2.113581, 3.487995, 1, 1, 1, 1, 1,
0.6234431, -1.502264, 2.36934, 1, 1, 1, 1, 1,
0.6295788, 0.2646345, 0.8555629, 1, 1, 1, 1, 1,
0.632495, -0.5412794, 2.648371, 1, 1, 1, 1, 1,
0.6339746, 0.9044936, 1.331615, 1, 1, 1, 1, 1,
0.6347634, 0.8235509, 1.383337, 1, 1, 1, 1, 1,
0.6402466, -0.9466548, 2.423671, 1, 1, 1, 1, 1,
0.6467192, -0.2722924, 1.589862, 1, 1, 1, 1, 1,
0.6469219, -1.998671, 2.359784, 1, 1, 1, 1, 1,
0.6503229, -0.2220057, 2.115155, 0, 0, 1, 1, 1,
0.6513348, -0.8119496, 0.09675058, 1, 0, 0, 1, 1,
0.6517186, -2.902786, 4.661851, 1, 0, 0, 1, 1,
0.6545039, 0.4753914, -0.02884162, 1, 0, 0, 1, 1,
0.6560941, -1.750726, 3.112017, 1, 0, 0, 1, 1,
0.6595079, 0.7148815, 0.2611666, 1, 0, 0, 1, 1,
0.664059, -0.9709874, 3.815218, 0, 0, 0, 1, 1,
0.667079, -1.159972, 2.873568, 0, 0, 0, 1, 1,
0.6711289, 1.915068, 2.262191, 0, 0, 0, 1, 1,
0.6715474, 0.3119709, -0.1720771, 0, 0, 0, 1, 1,
0.673065, 1.166186, 2.242703, 0, 0, 0, 1, 1,
0.6768832, -0.08514933, 2.239704, 0, 0, 0, 1, 1,
0.6795718, 1.086693, 1.523311, 0, 0, 0, 1, 1,
0.6813741, 0.2983399, 1.204207, 1, 1, 1, 1, 1,
0.683621, 0.01484456, 1.780896, 1, 1, 1, 1, 1,
0.6845912, 0.1635993, 0.3601281, 1, 1, 1, 1, 1,
0.6893958, -1.234271, 2.830899, 1, 1, 1, 1, 1,
0.6898074, -1.572405, 2.877508, 1, 1, 1, 1, 1,
0.6899167, 1.217063, 1.311803, 1, 1, 1, 1, 1,
0.6956366, 0.1892639, 1.763373, 1, 1, 1, 1, 1,
0.6981494, 0.7033341, 0.8660662, 1, 1, 1, 1, 1,
0.7003273, 0.08127766, 2.44842, 1, 1, 1, 1, 1,
0.7029901, -1.317204, 3.027358, 1, 1, 1, 1, 1,
0.7109122, 0.09668378, 2.383239, 1, 1, 1, 1, 1,
0.7111856, -1.215209, 0.972089, 1, 1, 1, 1, 1,
0.7144452, 1.399949, -0.8911914, 1, 1, 1, 1, 1,
0.7150366, -2.384079, 5.611801, 1, 1, 1, 1, 1,
0.7181413, -0.2130961, 2.805456, 1, 1, 1, 1, 1,
0.7182891, 0.1230034, 1.165327, 0, 0, 1, 1, 1,
0.7234411, -0.6389385, 3.422812, 1, 0, 0, 1, 1,
0.725315, 0.7462738, -0.4649724, 1, 0, 0, 1, 1,
0.7261217, 1.631629, 0.9223254, 1, 0, 0, 1, 1,
0.7266085, -0.9106766, 1.578962, 1, 0, 0, 1, 1,
0.7269937, -0.3392757, 1.457122, 1, 0, 0, 1, 1,
0.7288384, 0.3397348, 0.04084532, 0, 0, 0, 1, 1,
0.7332254, -0.6972688, 2.121301, 0, 0, 0, 1, 1,
0.7360918, -0.6641635, 0.8683956, 0, 0, 0, 1, 1,
0.7425433, -0.4941157, 1.949368, 0, 0, 0, 1, 1,
0.7426541, 0.8442745, 1.648792, 0, 0, 0, 1, 1,
0.74401, 0.1492999, 1.159074, 0, 0, 0, 1, 1,
0.7489101, -0.4023629, 4.424728, 0, 0, 0, 1, 1,
0.7490515, 2.065904, -0.8440796, 1, 1, 1, 1, 1,
0.7499017, -0.03432601, 1.124619, 1, 1, 1, 1, 1,
0.7625903, 0.03563806, 0.9460821, 1, 1, 1, 1, 1,
0.7676747, -0.3564922, -0.02700108, 1, 1, 1, 1, 1,
0.7758014, -0.4459826, 1.219825, 1, 1, 1, 1, 1,
0.7786201, -0.9315386, 1.873238, 1, 1, 1, 1, 1,
0.7786871, -0.1760224, 1.706855, 1, 1, 1, 1, 1,
0.7798752, 2.245832, 0.9138495, 1, 1, 1, 1, 1,
0.7816891, -0.1330899, 1.350633, 1, 1, 1, 1, 1,
0.7819104, -1.880347, 2.578686, 1, 1, 1, 1, 1,
0.7917154, 0.5462861, 1.88619, 1, 1, 1, 1, 1,
0.791951, -0.8414845, 1.437135, 1, 1, 1, 1, 1,
0.7921456, 2.581191, 0.3883187, 1, 1, 1, 1, 1,
0.7940084, -0.5704457, 2.411436, 1, 1, 1, 1, 1,
0.7946565, -0.322, 3.343582, 1, 1, 1, 1, 1,
0.7952831, -0.871721, 3.983279, 0, 0, 1, 1, 1,
0.7992786, 0.9901298, 0.2023022, 1, 0, 0, 1, 1,
0.8278956, 1.04183, 1.003129, 1, 0, 0, 1, 1,
0.8300657, 0.1640535, 1.260518, 1, 0, 0, 1, 1,
0.8312194, -0.6403021, 3.022285, 1, 0, 0, 1, 1,
0.8323501, 0.3417818, 3.241168, 1, 0, 0, 1, 1,
0.8396779, -0.4664234, 2.508417, 0, 0, 0, 1, 1,
0.8420304, -1.006908, 1.019885, 0, 0, 0, 1, 1,
0.8447978, -0.3828386, 2.556135, 0, 0, 0, 1, 1,
0.8451619, 0.2934917, 1.022988, 0, 0, 0, 1, 1,
0.8502241, -0.4526424, 2.119744, 0, 0, 0, 1, 1,
0.8519295, -0.835721, 1.202953, 0, 0, 0, 1, 1,
0.8524363, -0.8975958, 3.931446, 0, 0, 0, 1, 1,
0.8603466, -1.664964, 3.028163, 1, 1, 1, 1, 1,
0.8604869, -1.080184, 1.71412, 1, 1, 1, 1, 1,
0.865113, 0.7918645, 1.978735, 1, 1, 1, 1, 1,
0.8684608, -2.244093, 3.927448, 1, 1, 1, 1, 1,
0.8686599, 0.3089864, 0.707805, 1, 1, 1, 1, 1,
0.8734258, -0.4711094, 1.099399, 1, 1, 1, 1, 1,
0.8739167, -1.063938, 2.036857, 1, 1, 1, 1, 1,
0.874114, 0.04619567, 1.903379, 1, 1, 1, 1, 1,
0.874189, 0.4441026, -0.7498898, 1, 1, 1, 1, 1,
0.8764035, -1.413836, 2.271418, 1, 1, 1, 1, 1,
0.8795082, 1.264802, -0.3698251, 1, 1, 1, 1, 1,
0.881233, -1.751588, 0.2882603, 1, 1, 1, 1, 1,
0.8835021, -1.50081, 2.612831, 1, 1, 1, 1, 1,
0.8843717, -0.6126266, 2.030466, 1, 1, 1, 1, 1,
0.8874111, 1.11339, 1.09594, 1, 1, 1, 1, 1,
0.8902127, 1.110521, -0.8151198, 0, 0, 1, 1, 1,
0.8902569, -0.1304857, 1.553598, 1, 0, 0, 1, 1,
0.8954268, 1.649853, 1.764492, 1, 0, 0, 1, 1,
0.8989508, -0.4383272, 1.772409, 1, 0, 0, 1, 1,
0.9016624, -0.5579175, 2.704581, 1, 0, 0, 1, 1,
0.9046587, -1.265675, 1.947559, 1, 0, 0, 1, 1,
0.9049855, 1.531978, -0.7234038, 0, 0, 0, 1, 1,
0.9080822, 0.2435809, 2.258359, 0, 0, 0, 1, 1,
0.92861, -0.5799036, 1.690367, 0, 0, 0, 1, 1,
0.9290523, 0.3364384, 1.385381, 0, 0, 0, 1, 1,
0.944138, 0.1920305, -0.4204455, 0, 0, 0, 1, 1,
0.9444391, -0.0130526, 2.595652, 0, 0, 0, 1, 1,
0.9472584, 1.360385, 1.940945, 0, 0, 0, 1, 1,
0.9565369, 1.05364, 0.3669378, 1, 1, 1, 1, 1,
0.9577085, -1.797748, 2.689906, 1, 1, 1, 1, 1,
0.9609089, -0.1369953, 2.205583, 1, 1, 1, 1, 1,
0.9638993, 0.1759036, 2.50691, 1, 1, 1, 1, 1,
0.9713555, 0.396338, 1.883356, 1, 1, 1, 1, 1,
0.9842822, -0.2015807, 2.784273, 1, 1, 1, 1, 1,
0.9877775, -0.3607135, 2.742853, 1, 1, 1, 1, 1,
0.990206, -1.376576, 0.5762665, 1, 1, 1, 1, 1,
0.9988523, 0.1268372, 1.892089, 1, 1, 1, 1, 1,
0.9992627, -1.929414, 2.933054, 1, 1, 1, 1, 1,
1.004344, -0.7879473, 3.337898, 1, 1, 1, 1, 1,
1.008516, 1.881818, 2.926199, 1, 1, 1, 1, 1,
1.009216, 1.263682, 0.2941039, 1, 1, 1, 1, 1,
1.019081, 0.2220386, 2.010834, 1, 1, 1, 1, 1,
1.020054, 1.074652, 0.262, 1, 1, 1, 1, 1,
1.028975, 0.0642297, 0.1813661, 0, 0, 1, 1, 1,
1.032051, 1.1155, 0.4378172, 1, 0, 0, 1, 1,
1.03442, -0.4352931, 2.631217, 1, 0, 0, 1, 1,
1.034495, -1.257008, 2.985312, 1, 0, 0, 1, 1,
1.041126, -0.611212, 2.81237, 1, 0, 0, 1, 1,
1.047183, -0.6698986, 1.294806, 1, 0, 0, 1, 1,
1.060208, 0.2043986, 0.5935526, 0, 0, 0, 1, 1,
1.064417, 1.201281, 0.8430642, 0, 0, 0, 1, 1,
1.068331, -0.6419138, 1.867049, 0, 0, 0, 1, 1,
1.075745, -0.4327007, 3.166266, 0, 0, 0, 1, 1,
1.078964, -0.3808797, 2.109503, 0, 0, 0, 1, 1,
1.083329, 0.3067583, 1.287189, 0, 0, 0, 1, 1,
1.085838, -0.1205091, 2.604301, 0, 0, 0, 1, 1,
1.091891, -0.1362608, 0.1246692, 1, 1, 1, 1, 1,
1.094837, -0.9910888, 2.145596, 1, 1, 1, 1, 1,
1.095244, -1.462699, 3.233053, 1, 1, 1, 1, 1,
1.097491, -2.179282, 1.909597, 1, 1, 1, 1, 1,
1.098698, -2.096473, 2.818181, 1, 1, 1, 1, 1,
1.102983, 0.5371196, 0.4464327, 1, 1, 1, 1, 1,
1.107323, 0.2571374, 1.353334, 1, 1, 1, 1, 1,
1.117911, 0.4625546, 2.171701, 1, 1, 1, 1, 1,
1.120436, -1.424211, 4.957367, 1, 1, 1, 1, 1,
1.121556, 1.061551, 0.175664, 1, 1, 1, 1, 1,
1.121843, 0.3339205, 2.128289, 1, 1, 1, 1, 1,
1.124991, 0.6446311, 1.394876, 1, 1, 1, 1, 1,
1.136286, -1.338826, 1.240104, 1, 1, 1, 1, 1,
1.137488, 0.07375973, 1.432872, 1, 1, 1, 1, 1,
1.146173, -0.1536705, 0.6344886, 1, 1, 1, 1, 1,
1.165207, 0.1553053, 0.8523834, 0, 0, 1, 1, 1,
1.166856, 1.497311, -0.7559848, 1, 0, 0, 1, 1,
1.170704, -0.08708141, 2.052735, 1, 0, 0, 1, 1,
1.181628, 0.2811723, 0.947468, 1, 0, 0, 1, 1,
1.185428, 0.4102375, 1.809206, 1, 0, 0, 1, 1,
1.186182, 0.7209085, 1.033513, 1, 0, 0, 1, 1,
1.203176, -0.2336558, 2.565835, 0, 0, 0, 1, 1,
1.204654, 0.07535149, 3.146919, 0, 0, 0, 1, 1,
1.205338, -1.035594, 2.583696, 0, 0, 0, 1, 1,
1.205785, -0.02657217, 2.859708, 0, 0, 0, 1, 1,
1.210604, 0.7354138, 2.11122, 0, 0, 0, 1, 1,
1.210716, -0.2058426, 1.876493, 0, 0, 0, 1, 1,
1.211608, -0.3843795, 2.53392, 0, 0, 0, 1, 1,
1.213001, -1.091205, 2.390386, 1, 1, 1, 1, 1,
1.218074, 1.615416, 0.3096071, 1, 1, 1, 1, 1,
1.221004, -0.6147939, 1.270955, 1, 1, 1, 1, 1,
1.225747, -1.046632, 1.959455, 1, 1, 1, 1, 1,
1.226781, -0.1920255, 1.403875, 1, 1, 1, 1, 1,
1.231258, 0.6879373, 2.75772, 1, 1, 1, 1, 1,
1.233401, -0.6807654, 0.08714113, 1, 1, 1, 1, 1,
1.235694, -1.594736, 5.029041, 1, 1, 1, 1, 1,
1.238949, -1.045043, 1.644979, 1, 1, 1, 1, 1,
1.24059, 0.9038351, -1.223321, 1, 1, 1, 1, 1,
1.24413, -0.816856, 1.341161, 1, 1, 1, 1, 1,
1.246404, -0.05954504, 1.927748, 1, 1, 1, 1, 1,
1.247864, -0.6371163, 1.870601, 1, 1, 1, 1, 1,
1.250585, -0.704554, 1.865074, 1, 1, 1, 1, 1,
1.250703, 0.7478043, 2.483961, 1, 1, 1, 1, 1,
1.252511, -0.3396423, 2.178473, 0, 0, 1, 1, 1,
1.254117, 0.3190959, 0.03800654, 1, 0, 0, 1, 1,
1.258472, -1.574146, 5.11314, 1, 0, 0, 1, 1,
1.263965, -0.8065414, 1.891708, 1, 0, 0, 1, 1,
1.267754, 0.06321707, 2.167703, 1, 0, 0, 1, 1,
1.277393, -1.456907, 1.356135, 1, 0, 0, 1, 1,
1.28186, -1.277789, 1.023287, 0, 0, 0, 1, 1,
1.284575, 0.007156465, 1.338899, 0, 0, 0, 1, 1,
1.288091, -0.07746397, 1.618605, 0, 0, 0, 1, 1,
1.288978, 1.150073, 2.951522, 0, 0, 0, 1, 1,
1.294172, 0.990968, -1.43458, 0, 0, 0, 1, 1,
1.303718, -0.007359271, 1.649862, 0, 0, 0, 1, 1,
1.309175, 0.5628062, 1.238821, 0, 0, 0, 1, 1,
1.315515, 1.805574, 0.2212757, 1, 1, 1, 1, 1,
1.315881, -1.379464, 3.392694, 1, 1, 1, 1, 1,
1.32227, -0.8335087, 2.816803, 1, 1, 1, 1, 1,
1.324068, 0.1961644, 0.8829505, 1, 1, 1, 1, 1,
1.324765, 0.7609947, 2.528005, 1, 1, 1, 1, 1,
1.330768, 0.1588092, 1.33438, 1, 1, 1, 1, 1,
1.350316, -1.553683, 2.150974, 1, 1, 1, 1, 1,
1.351762, 0.429571, 1.180439, 1, 1, 1, 1, 1,
1.354601, 1.767515, 1.922513, 1, 1, 1, 1, 1,
1.369883, 0.1350355, 0.07717131, 1, 1, 1, 1, 1,
1.389174, -0.3879286, 2.672226, 1, 1, 1, 1, 1,
1.393401, 0.3913528, 2.3085, 1, 1, 1, 1, 1,
1.396876, -0.0009185114, 2.222317, 1, 1, 1, 1, 1,
1.403599, -0.3882595, 1.70438, 1, 1, 1, 1, 1,
1.405796, -1.472159, 0.8373832, 1, 1, 1, 1, 1,
1.413236, -0.8793454, 0.9727893, 0, 0, 1, 1, 1,
1.437961, 1.668985, 0.9201016, 1, 0, 0, 1, 1,
1.450739, 0.4560881, 0.5540677, 1, 0, 0, 1, 1,
1.451948, -0.3197837, 1.754369, 1, 0, 0, 1, 1,
1.465914, 1.693065, 1.230552, 1, 0, 0, 1, 1,
1.484939, 0.1406761, 2.416319, 1, 0, 0, 1, 1,
1.489067, 0.7524092, 1.364146, 0, 0, 0, 1, 1,
1.495359, -0.1915535, 3.689161, 0, 0, 0, 1, 1,
1.50514, 2.335811, 1.147449, 0, 0, 0, 1, 1,
1.507178, 1.2904, -0.62756, 0, 0, 0, 1, 1,
1.518881, -0.6712006, 1.426879, 0, 0, 0, 1, 1,
1.560207, -0.2148703, 0.9191993, 0, 0, 0, 1, 1,
1.570262, -0.009307568, 1.819209, 0, 0, 0, 1, 1,
1.57802, 0.8450322, 0.2684885, 1, 1, 1, 1, 1,
1.590404, -0.9460568, 1.417145, 1, 1, 1, 1, 1,
1.594159, -1.179204, 2.436677, 1, 1, 1, 1, 1,
1.596112, 0.1214027, 1.184771, 1, 1, 1, 1, 1,
1.599614, -0.5552102, 2.783432, 1, 1, 1, 1, 1,
1.602783, -0.2948465, 2.471007, 1, 1, 1, 1, 1,
1.605417, 1.613963, 1.183139, 1, 1, 1, 1, 1,
1.606519, 1.214389, 1.947185, 1, 1, 1, 1, 1,
1.608034, -0.5549812, 2.840323, 1, 1, 1, 1, 1,
1.618143, 0.3584205, -1.409393, 1, 1, 1, 1, 1,
1.620575, -1.48325, 0.797141, 1, 1, 1, 1, 1,
1.631845, -1.842225, 0.9023811, 1, 1, 1, 1, 1,
1.633109, -0.3337137, 0.147062, 1, 1, 1, 1, 1,
1.634326, 0.05227235, 0.5442891, 1, 1, 1, 1, 1,
1.643842, 0.439138, 1.504191, 1, 1, 1, 1, 1,
1.648017, -0.846332, -0.3490345, 0, 0, 1, 1, 1,
1.657712, 0.004937423, 1.43766, 1, 0, 0, 1, 1,
1.663853, 0.369362, 0.9515715, 1, 0, 0, 1, 1,
1.677714, -0.08498552, 0.9268117, 1, 0, 0, 1, 1,
1.677785, -0.7816549, 2.881491, 1, 0, 0, 1, 1,
1.682133, -0.8531757, 1.161502, 1, 0, 0, 1, 1,
1.686234, 0.1001539, 2.341948, 0, 0, 0, 1, 1,
1.691956, 0.05438803, 1.643008, 0, 0, 0, 1, 1,
1.706273, -0.3411259, 2.513697, 0, 0, 0, 1, 1,
1.717387, -1.689946, 2.540737, 0, 0, 0, 1, 1,
1.724555, 1.511754, 1.510284, 0, 0, 0, 1, 1,
1.726082, -1.201649, 2.9265, 0, 0, 0, 1, 1,
1.768049, -0.6817124, 2.792384, 0, 0, 0, 1, 1,
1.77177, -0.6109414, 2.031954, 1, 1, 1, 1, 1,
1.778386, -0.1630016, 0.9535034, 1, 1, 1, 1, 1,
1.790792, 1.219177, 1.896872, 1, 1, 1, 1, 1,
1.806035, 1.377383, 0.1046013, 1, 1, 1, 1, 1,
1.808098, 0.2902553, -0.4525444, 1, 1, 1, 1, 1,
1.822808, -1.403234, 2.91665, 1, 1, 1, 1, 1,
1.842243, -1.428245, 1.840173, 1, 1, 1, 1, 1,
1.84548, -0.05931588, 2.204613, 1, 1, 1, 1, 1,
1.851934, 0.3007049, 1.455349, 1, 1, 1, 1, 1,
1.873231, -0.07584313, 1.528326, 1, 1, 1, 1, 1,
1.919045, -0.4674293, 1.212315, 1, 1, 1, 1, 1,
1.928528, 0.1975488, -0.2857634, 1, 1, 1, 1, 1,
1.929568, -0.02434261, 2.876548, 1, 1, 1, 1, 1,
1.963516, -0.7323092, 1.319805, 1, 1, 1, 1, 1,
1.974088, -0.1852053, 2.57898, 1, 1, 1, 1, 1,
1.988494, 0.08667639, 0.6852995, 0, 0, 1, 1, 1,
1.988796, -0.3479249, 4.447529, 1, 0, 0, 1, 1,
2.007633, -1.178384, 2.529586, 1, 0, 0, 1, 1,
2.025794, 2.08372, -0.1158254, 1, 0, 0, 1, 1,
2.083665, -1.734577, 4.46474, 1, 0, 0, 1, 1,
2.088127, 0.854368, 0.9662908, 1, 0, 0, 1, 1,
2.196414, 0.7039806, 1.549303, 0, 0, 0, 1, 1,
2.205057, 1.684714, 1.554495, 0, 0, 0, 1, 1,
2.2059, -1.005251, 2.075657, 0, 0, 0, 1, 1,
2.222919, -0.7422931, 2.507268, 0, 0, 0, 1, 1,
2.276865, 0.4564597, 1.819988, 0, 0, 0, 1, 1,
2.28139, -0.4797004, 0.7174467, 0, 0, 0, 1, 1,
2.284467, 0.6090518, 2.155708, 0, 0, 0, 1, 1,
2.474253, 0.7065845, 2.47872, 1, 1, 1, 1, 1,
2.577064, -0.5755585, 1.401326, 1, 1, 1, 1, 1,
2.603178, 1.416863, 1.437397, 1, 1, 1, 1, 1,
2.617068, -2.348426, 2.674235, 1, 1, 1, 1, 1,
2.663558, -0.7613301, 1.379391, 1, 1, 1, 1, 1,
2.763849, 0.1569148, 2.310141, 1, 1, 1, 1, 1,
2.869638, 1.010678, 2.433907, 1, 1, 1, 1, 1
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
var radius = 9.27521;
var distance = 32.57878;
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
mvMatrix.translate( -0.06334996, 0.265964, -0.2789834 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.57878);
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
