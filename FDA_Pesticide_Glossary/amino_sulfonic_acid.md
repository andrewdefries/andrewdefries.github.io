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
-3.07947, 1.37744, -0.4938588, 1, 0, 0, 1,
-3.032382, 0.8053595, -0.7525854, 1, 0.007843138, 0, 1,
-2.78085, 2.962262, 0.5896212, 1, 0.01176471, 0, 1,
-2.489763, 0.09511879, -3.135644, 1, 0.01960784, 0, 1,
-2.486008, -0.4693245, -1.514987, 1, 0.02352941, 0, 1,
-2.469051, -0.636015, -4.489253, 1, 0.03137255, 0, 1,
-2.455676, -0.3341556, -2.221083, 1, 0.03529412, 0, 1,
-2.428464, 0.4889943, -0.2495486, 1, 0.04313726, 0, 1,
-2.41075, -0.3146249, -0.3406915, 1, 0.04705882, 0, 1,
-2.388888, 1.194067, -1.088144, 1, 0.05490196, 0, 1,
-2.344105, 0.2985111, -2.600792, 1, 0.05882353, 0, 1,
-2.342123, 0.4236281, -2.000137, 1, 0.06666667, 0, 1,
-2.237704, -1.214532, 0.03565443, 1, 0.07058824, 0, 1,
-2.227476, -2.003933, -1.721212, 1, 0.07843138, 0, 1,
-2.197439, -0.9928504, -2.059495, 1, 0.08235294, 0, 1,
-2.074923, 0.03182482, -1.51825, 1, 0.09019608, 0, 1,
-2.068246, -1.988953, -2.022337, 1, 0.09411765, 0, 1,
-2.04668, 2.039115, -0.8353252, 1, 0.1019608, 0, 1,
-2.035264, -0.5135816, -1.653264, 1, 0.1098039, 0, 1,
-2.027462, 0.3011182, -0.09484617, 1, 0.1137255, 0, 1,
-2.022563, -1.357752, -3.02903, 1, 0.1215686, 0, 1,
-2.020252, 0.481338, -0.7604023, 1, 0.1254902, 0, 1,
-1.966882, 0.8459712, 0.6932269, 1, 0.1333333, 0, 1,
-1.942956, -1.463135, -1.207282, 1, 0.1372549, 0, 1,
-1.923007, 0.500389, -1.373256, 1, 0.145098, 0, 1,
-1.917258, -1.345973, -3.045069, 1, 0.1490196, 0, 1,
-1.916329, -0.1004644, -2.643844, 1, 0.1568628, 0, 1,
-1.912278, 1.751265, -1.090722, 1, 0.1607843, 0, 1,
-1.905147, -0.5197294, 0.04188685, 1, 0.1686275, 0, 1,
-1.896139, -0.602243, -1.813968, 1, 0.172549, 0, 1,
-1.854041, 0.002280287, -0.1474293, 1, 0.1803922, 0, 1,
-1.848241, 0.3340165, -1.495744, 1, 0.1843137, 0, 1,
-1.8164, 0.2807578, 0.1218914, 1, 0.1921569, 0, 1,
-1.816295, 1.118169, -1.522785, 1, 0.1960784, 0, 1,
-1.799244, -2.492856, -2.372175, 1, 0.2039216, 0, 1,
-1.794094, -0.1368682, -2.693992, 1, 0.2117647, 0, 1,
-1.791683, -0.9083486, -2.639019, 1, 0.2156863, 0, 1,
-1.787237, -0.6138903, -1.761037, 1, 0.2235294, 0, 1,
-1.779478, -1.974733, -4.096251, 1, 0.227451, 0, 1,
-1.777552, -0.09944813, -2.276143, 1, 0.2352941, 0, 1,
-1.769512, -0.9941183, -2.651452, 1, 0.2392157, 0, 1,
-1.754331, 0.5021326, -0.7924124, 1, 0.2470588, 0, 1,
-1.73197, -0.1433582, -2.475487, 1, 0.2509804, 0, 1,
-1.730946, -0.01799311, -0.7690802, 1, 0.2588235, 0, 1,
-1.713962, -0.4121393, -2.750422, 1, 0.2627451, 0, 1,
-1.694643, -0.161026, -1.411407, 1, 0.2705882, 0, 1,
-1.694218, -0.02314431, -1.519545, 1, 0.2745098, 0, 1,
-1.690747, 0.386239, -1.766194, 1, 0.282353, 0, 1,
-1.670459, 1.414823, -0.349004, 1, 0.2862745, 0, 1,
-1.657876, 1.702724, -2.343446, 1, 0.2941177, 0, 1,
-1.643863, 0.4376731, -1.356712, 1, 0.3019608, 0, 1,
-1.638776, -0.3116078, -1.869598, 1, 0.3058824, 0, 1,
-1.636674, -1.828305, -1.151257, 1, 0.3137255, 0, 1,
-1.628952, -1.052413, -2.936983, 1, 0.3176471, 0, 1,
-1.628497, -1.045232, -2.251862, 1, 0.3254902, 0, 1,
-1.615883, 1.867305, 0.3032635, 1, 0.3294118, 0, 1,
-1.615181, -0.9521344, -1.132529, 1, 0.3372549, 0, 1,
-1.610518, 1.371143, 0.4767565, 1, 0.3411765, 0, 1,
-1.590274, -1.004714, -3.175772, 1, 0.3490196, 0, 1,
-1.581401, 0.4431324, -1.998928, 1, 0.3529412, 0, 1,
-1.571093, 0.7704114, -2.445083, 1, 0.3607843, 0, 1,
-1.560162, 0.5244252, -2.799684, 1, 0.3647059, 0, 1,
-1.54459, 1.289196, -0.5832176, 1, 0.372549, 0, 1,
-1.525275, -0.694972, -1.468521, 1, 0.3764706, 0, 1,
-1.511509, 0.7294565, -3.090733, 1, 0.3843137, 0, 1,
-1.502004, 1.217775, -1.7853, 1, 0.3882353, 0, 1,
-1.488116, 1.667644, 0.06764916, 1, 0.3960784, 0, 1,
-1.483566, -0.3942985, -3.689855, 1, 0.4039216, 0, 1,
-1.482835, -0.01830564, -2.123049, 1, 0.4078431, 0, 1,
-1.478231, -1.570886, -1.937776, 1, 0.4156863, 0, 1,
-1.475759, 0.7051497, -3.158829, 1, 0.4196078, 0, 1,
-1.475152, 0.3359316, -1.062225, 1, 0.427451, 0, 1,
-1.468135, -0.9786345, -2.018339, 1, 0.4313726, 0, 1,
-1.441616, 0.9084463, 0.02676709, 1, 0.4392157, 0, 1,
-1.424423, 0.4977331, -0.8389635, 1, 0.4431373, 0, 1,
-1.410224, 0.8887079, -2.965456, 1, 0.4509804, 0, 1,
-1.406528, -0.5662019, -0.9091111, 1, 0.454902, 0, 1,
-1.400546, -0.9766821, -2.124478, 1, 0.4627451, 0, 1,
-1.382305, 0.2078007, -2.130052, 1, 0.4666667, 0, 1,
-1.38084, -0.7708752, -2.679388, 1, 0.4745098, 0, 1,
-1.380451, 1.661994, -0.6446367, 1, 0.4784314, 0, 1,
-1.3746, 1.309563, 1.17656, 1, 0.4862745, 0, 1,
-1.373601, -1.105378, -2.581899, 1, 0.4901961, 0, 1,
-1.367072, -0.3889496, 0.1047764, 1, 0.4980392, 0, 1,
-1.36071, -0.2628592, -2.155658, 1, 0.5058824, 0, 1,
-1.345962, 1.973006, -0.3425331, 1, 0.509804, 0, 1,
-1.345792, -0.2437937, -0.4461949, 1, 0.5176471, 0, 1,
-1.345705, -2.102711, -2.468164, 1, 0.5215687, 0, 1,
-1.34151, -0.1272329, -2.754052, 1, 0.5294118, 0, 1,
-1.33328, 1.307722, -0.7515991, 1, 0.5333334, 0, 1,
-1.330348, -0.2060766, 0.08888745, 1, 0.5411765, 0, 1,
-1.325605, -1.092015, -0.9602627, 1, 0.5450981, 0, 1,
-1.32236, -0.7089764, -1.685464, 1, 0.5529412, 0, 1,
-1.319848, -0.08152729, -0.3425149, 1, 0.5568628, 0, 1,
-1.316553, -2.015546, -2.813488, 1, 0.5647059, 0, 1,
-1.29883, -0.2693482, -2.638323, 1, 0.5686275, 0, 1,
-1.293064, 0.6656136, -1.730478, 1, 0.5764706, 0, 1,
-1.284848, 1.59876, -1.412538, 1, 0.5803922, 0, 1,
-1.282456, 0.5395711, -0.8835005, 1, 0.5882353, 0, 1,
-1.273251, 0.4771105, -0.7768791, 1, 0.5921569, 0, 1,
-1.254807, -0.8648026, -1.498573, 1, 0.6, 0, 1,
-1.24296, 0.2600003, -1.883878, 1, 0.6078432, 0, 1,
-1.239633, -1.297366, -3.303655, 1, 0.6117647, 0, 1,
-1.236577, 0.6289305, 0.2801441, 1, 0.6196079, 0, 1,
-1.2321, 0.3970793, -0.8846237, 1, 0.6235294, 0, 1,
-1.226668, -0.8952507, -3.879206, 1, 0.6313726, 0, 1,
-1.225976, -0.06900091, -1.288584, 1, 0.6352941, 0, 1,
-1.222181, -1.338452, -4.577771, 1, 0.6431373, 0, 1,
-1.222004, -0.385808, -2.749122, 1, 0.6470588, 0, 1,
-1.216089, 2.738256, -1.013267, 1, 0.654902, 0, 1,
-1.211666, -1.037824, -1.510554, 1, 0.6588235, 0, 1,
-1.210832, -0.05548218, -3.14454, 1, 0.6666667, 0, 1,
-1.21043, 0.616375, 0.1862312, 1, 0.6705883, 0, 1,
-1.209436, -1.452628, -2.896607, 1, 0.6784314, 0, 1,
-1.208582, 0.006815239, -1.755644, 1, 0.682353, 0, 1,
-1.195537, -0.3242503, -2.01111, 1, 0.6901961, 0, 1,
-1.195348, 0.1520438, -2.172289, 1, 0.6941177, 0, 1,
-1.189878, -0.3473242, -1.126653, 1, 0.7019608, 0, 1,
-1.187881, 0.5510044, -0.8044549, 1, 0.7098039, 0, 1,
-1.183646, 0.1352177, -2.122407, 1, 0.7137255, 0, 1,
-1.183299, -1.317724, -2.993547, 1, 0.7215686, 0, 1,
-1.176338, 2.045302, -1.072351, 1, 0.7254902, 0, 1,
-1.171436, 1.227252, -1.030828, 1, 0.7333333, 0, 1,
-1.152914, -0.4981805, -2.530716, 1, 0.7372549, 0, 1,
-1.15171, -1.17395, -0.9702083, 1, 0.7450981, 0, 1,
-1.149953, -0.9369016, -2.215954, 1, 0.7490196, 0, 1,
-1.14607, 2.530038, -0.02098716, 1, 0.7568628, 0, 1,
-1.145616, -0.3132329, 0.9512304, 1, 0.7607843, 0, 1,
-1.131477, 0.8729507, -0.6181139, 1, 0.7686275, 0, 1,
-1.131102, -1.125406, -2.750395, 1, 0.772549, 0, 1,
-1.130904, -0.447163, -1.613238, 1, 0.7803922, 0, 1,
-1.123002, -1.009502, -3.283707, 1, 0.7843137, 0, 1,
-1.116753, 0.2899619, -1.242864, 1, 0.7921569, 0, 1,
-1.107833, 0.5668862, -3.49217, 1, 0.7960784, 0, 1,
-1.107394, -1.430607, -2.592961, 1, 0.8039216, 0, 1,
-1.100566, -0.1618276, -2.70825, 1, 0.8117647, 0, 1,
-1.09941, 0.8273491, -1.814427, 1, 0.8156863, 0, 1,
-1.09672, -0.08536543, -1.315324, 1, 0.8235294, 0, 1,
-1.080871, -0.09774565, -0.5587425, 1, 0.827451, 0, 1,
-1.079277, 0.3082244, 0.6396301, 1, 0.8352941, 0, 1,
-1.077734, -0.7729969, -1.134144, 1, 0.8392157, 0, 1,
-1.07362, 0.2637895, -0.2654923, 1, 0.8470588, 0, 1,
-1.070321, 0.774864, -2.208981, 1, 0.8509804, 0, 1,
-1.067221, -0.4985177, -1.684027, 1, 0.8588235, 0, 1,
-1.0639, 0.9995532, -1.026796, 1, 0.8627451, 0, 1,
-1.062126, -0.003543364, -0.3436498, 1, 0.8705882, 0, 1,
-1.043904, -0.5879704, -0.8725559, 1, 0.8745098, 0, 1,
-1.039274, -1.332142, -2.943067, 1, 0.8823529, 0, 1,
-1.036241, 0.3642755, -1.456746, 1, 0.8862745, 0, 1,
-1.034992, -0.9227182, -2.790122, 1, 0.8941177, 0, 1,
-1.030069, -0.2889826, -2.119353, 1, 0.8980392, 0, 1,
-1.029932, 0.5470784, -2.362437, 1, 0.9058824, 0, 1,
-1.026635, 0.6634945, -1.04249, 1, 0.9137255, 0, 1,
-1.024999, 0.3594605, -1.79715, 1, 0.9176471, 0, 1,
-1.023411, -1.000777, -2.358371, 1, 0.9254902, 0, 1,
-1.018201, -1.110202, -2.186225, 1, 0.9294118, 0, 1,
-1.011958, 0.5684326, -1.385727, 1, 0.9372549, 0, 1,
-1.008962, -0.01513888, -0.1435157, 1, 0.9411765, 0, 1,
-1.008724, 0.6796795, -0.4580657, 1, 0.9490196, 0, 1,
-1.00808, 0.8193509, -1.281185, 1, 0.9529412, 0, 1,
-0.9978834, 0.1747039, -1.736529, 1, 0.9607843, 0, 1,
-0.9853947, -0.4674363, -1.700871, 1, 0.9647059, 0, 1,
-0.9841208, -0.4684732, -4.16809, 1, 0.972549, 0, 1,
-0.9829608, -1.297308, -3.881613, 1, 0.9764706, 0, 1,
-0.9815596, -0.1652405, -1.786471, 1, 0.9843137, 0, 1,
-0.981193, 1.635382, 0.4340367, 1, 0.9882353, 0, 1,
-0.9799992, 0.02216065, -2.13873, 1, 0.9960784, 0, 1,
-0.970973, -0.2967351, -1.468795, 0.9960784, 1, 0, 1,
-0.9698757, 0.3180977, -0.4506521, 0.9921569, 1, 0, 1,
-0.9520513, -2.125289, -1.663983, 0.9843137, 1, 0, 1,
-0.9473296, 0.2020009, -1.730945, 0.9803922, 1, 0, 1,
-0.942022, -0.08310937, -1.095088, 0.972549, 1, 0, 1,
-0.9407516, -0.646935, -2.709151, 0.9686275, 1, 0, 1,
-0.9387828, -0.1449531, 0.885097, 0.9607843, 1, 0, 1,
-0.938527, 0.4120599, 0.1858774, 0.9568627, 1, 0, 1,
-0.9342368, 0.6170607, 0.1183001, 0.9490196, 1, 0, 1,
-0.9329382, 0.6758054, -2.123641, 0.945098, 1, 0, 1,
-0.9307143, -0.1134426, -3.339695, 0.9372549, 1, 0, 1,
-0.9294214, -0.1739861, 0.4832913, 0.9333333, 1, 0, 1,
-0.9253916, -0.3451429, -1.625718, 0.9254902, 1, 0, 1,
-0.9237275, -0.4281596, -2.535203, 0.9215686, 1, 0, 1,
-0.9210603, -0.5826125, -2.552649, 0.9137255, 1, 0, 1,
-0.9184109, -0.6806145, -1.692023, 0.9098039, 1, 0, 1,
-0.9104852, 0.5267745, -2.449927, 0.9019608, 1, 0, 1,
-0.907461, 0.4513631, -1.164245, 0.8941177, 1, 0, 1,
-0.9042877, -0.4726647, -2.405022, 0.8901961, 1, 0, 1,
-0.9014246, 1.114229, -1.174483, 0.8823529, 1, 0, 1,
-0.901122, -0.4097549, -0.07149591, 0.8784314, 1, 0, 1,
-0.9002354, -0.5033885, -1.874928, 0.8705882, 1, 0, 1,
-0.8996429, 0.7715012, -1.253831, 0.8666667, 1, 0, 1,
-0.8982196, -1.523935, -3.086799, 0.8588235, 1, 0, 1,
-0.8944226, -0.7965715, -3.656341, 0.854902, 1, 0, 1,
-0.8881574, -0.2964297, -2.321101, 0.8470588, 1, 0, 1,
-0.8837767, -1.959231, -1.335149, 0.8431373, 1, 0, 1,
-0.8835919, 2.553656, -0.05162935, 0.8352941, 1, 0, 1,
-0.8831924, 0.6578249, 0.06113939, 0.8313726, 1, 0, 1,
-0.8830938, -2.358313, -3.195247, 0.8235294, 1, 0, 1,
-0.8815671, 0.434547, -0.04415165, 0.8196079, 1, 0, 1,
-0.8792844, -2.038918, -1.682337, 0.8117647, 1, 0, 1,
-0.8766803, 0.4808258, -0.7279075, 0.8078431, 1, 0, 1,
-0.8704848, -0.4070214, -2.307507, 0.8, 1, 0, 1,
-0.8671542, 0.6117261, -2.558922, 0.7921569, 1, 0, 1,
-0.8657506, 0.3048108, -1.010147, 0.7882353, 1, 0, 1,
-0.8629728, -0.6497166, -0.9165782, 0.7803922, 1, 0, 1,
-0.860536, 0.3441381, 0.02797213, 0.7764706, 1, 0, 1,
-0.8572069, -0.7161365, -2.040878, 0.7686275, 1, 0, 1,
-0.8431717, 1.29624, -2.914509, 0.7647059, 1, 0, 1,
-0.8429624, -1.033412, -2.222358, 0.7568628, 1, 0, 1,
-0.8410038, 0.08156007, -2.469161, 0.7529412, 1, 0, 1,
-0.8396031, -0.3880191, -2.55377, 0.7450981, 1, 0, 1,
-0.8389586, -0.7010572, -2.250958, 0.7411765, 1, 0, 1,
-0.8346248, 0.2634052, -0.616942, 0.7333333, 1, 0, 1,
-0.829228, -0.4531758, -2.704676, 0.7294118, 1, 0, 1,
-0.8197532, 0.3771697, -2.025086, 0.7215686, 1, 0, 1,
-0.8177917, 0.5594755, 0.2161027, 0.7176471, 1, 0, 1,
-0.8092854, 0.3949341, -3.019032, 0.7098039, 1, 0, 1,
-0.8065792, 1.36732, -1.241339, 0.7058824, 1, 0, 1,
-0.8027579, -0.6505424, -2.086443, 0.6980392, 1, 0, 1,
-0.7960719, -0.4154441, -2.831501, 0.6901961, 1, 0, 1,
-0.7939631, -0.4638363, -4.569122, 0.6862745, 1, 0, 1,
-0.784077, -0.3287039, -1.309219, 0.6784314, 1, 0, 1,
-0.782595, 1.031298, -0.3664997, 0.6745098, 1, 0, 1,
-0.7808015, 2.218735, 1.508833, 0.6666667, 1, 0, 1,
-0.7766597, -0.2509052, -1.345776, 0.6627451, 1, 0, 1,
-0.7766201, 2.069874, -1.136553, 0.654902, 1, 0, 1,
-0.7719911, 1.04441, 0.09482402, 0.6509804, 1, 0, 1,
-0.7701645, 0.7897322, 0.4194816, 0.6431373, 1, 0, 1,
-0.7663397, -0.2486421, -2.280736, 0.6392157, 1, 0, 1,
-0.7638983, -2.024071, -2.227078, 0.6313726, 1, 0, 1,
-0.7556924, 0.4867923, -0.2005554, 0.627451, 1, 0, 1,
-0.7449691, -0.1161478, -1.592476, 0.6196079, 1, 0, 1,
-0.7445335, -0.8134322, -1.1405, 0.6156863, 1, 0, 1,
-0.7423182, -0.7660955, -1.063831, 0.6078432, 1, 0, 1,
-0.7416849, -0.1043983, -2.868483, 0.6039216, 1, 0, 1,
-0.7405226, -1.162107, -3.437793, 0.5960785, 1, 0, 1,
-0.7357993, 0.3253326, -0.9349954, 0.5882353, 1, 0, 1,
-0.7352874, 0.9109503, -1.368816, 0.5843138, 1, 0, 1,
-0.7291456, 1.515035, -1.210259, 0.5764706, 1, 0, 1,
-0.7275777, 1.133994, 0.07465495, 0.572549, 1, 0, 1,
-0.7256199, -0.2054201, -1.945926, 0.5647059, 1, 0, 1,
-0.7233002, 0.5290546, -0.4806488, 0.5607843, 1, 0, 1,
-0.7089961, -1.302099, -2.065292, 0.5529412, 1, 0, 1,
-0.7045101, -0.2768691, -0.5014858, 0.5490196, 1, 0, 1,
-0.7033947, -1.574011, -3.827843, 0.5411765, 1, 0, 1,
-0.7030311, 1.412515, 1.397038, 0.5372549, 1, 0, 1,
-0.7000801, -0.2058463, -1.524113, 0.5294118, 1, 0, 1,
-0.6986961, 0.6141356, -0.9066775, 0.5254902, 1, 0, 1,
-0.6967316, 0.4320257, -0.6501278, 0.5176471, 1, 0, 1,
-0.695923, 0.404179, -0.8223634, 0.5137255, 1, 0, 1,
-0.6937381, 0.02038077, -1.041577, 0.5058824, 1, 0, 1,
-0.6918934, -0.1972523, -3.553326, 0.5019608, 1, 0, 1,
-0.6900737, -1.067549, -3.084239, 0.4941176, 1, 0, 1,
-0.6879308, 1.771616, 0.2375218, 0.4862745, 1, 0, 1,
-0.6876283, 1.283612, -1.024372, 0.4823529, 1, 0, 1,
-0.6872441, 1.47707, -0.2099703, 0.4745098, 1, 0, 1,
-0.6862696, 1.43624, -0.2332828, 0.4705882, 1, 0, 1,
-0.6862679, -2.083076, -2.722203, 0.4627451, 1, 0, 1,
-0.6836575, 0.4980475, -1.804353, 0.4588235, 1, 0, 1,
-0.6793786, -1.341679, -2.536519, 0.4509804, 1, 0, 1,
-0.6791674, -0.9884164, -2.973083, 0.4470588, 1, 0, 1,
-0.6704369, -0.2725638, -2.894032, 0.4392157, 1, 0, 1,
-0.6695718, 0.5543537, 1.272944, 0.4352941, 1, 0, 1,
-0.6681514, -1.27738, -3.664181, 0.427451, 1, 0, 1,
-0.6672423, 0.3742294, -1.836513, 0.4235294, 1, 0, 1,
-0.6605092, -1.657544, -1.123681, 0.4156863, 1, 0, 1,
-0.6590328, -0.501182, -2.82142, 0.4117647, 1, 0, 1,
-0.6580518, 0.8342123, 0.5425928, 0.4039216, 1, 0, 1,
-0.6575453, -0.242531, -2.194501, 0.3960784, 1, 0, 1,
-0.6554781, 0.6150962, -0.5689294, 0.3921569, 1, 0, 1,
-0.6540696, 0.9892183, -0.4351636, 0.3843137, 1, 0, 1,
-0.6533802, -0.7525505, -1.912336, 0.3803922, 1, 0, 1,
-0.652259, 0.4320771, -1.809518, 0.372549, 1, 0, 1,
-0.6508586, 0.8034804, -0.8629187, 0.3686275, 1, 0, 1,
-0.6503327, 0.3807679, -1.494572, 0.3607843, 1, 0, 1,
-0.6491978, -0.7754177, -4.306961, 0.3568628, 1, 0, 1,
-0.6488147, -2.491587, -1.042925, 0.3490196, 1, 0, 1,
-0.6474056, -0.7898348, -2.041685, 0.345098, 1, 0, 1,
-0.6432638, 0.7773154, 0.7022671, 0.3372549, 1, 0, 1,
-0.6431878, -0.8045431, -2.750247, 0.3333333, 1, 0, 1,
-0.6386949, -2.218243, -2.69011, 0.3254902, 1, 0, 1,
-0.627826, -0.6662068, -4.638677, 0.3215686, 1, 0, 1,
-0.6276535, 0.01759745, -0.5403129, 0.3137255, 1, 0, 1,
-0.6216603, -0.7431716, -3.766025, 0.3098039, 1, 0, 1,
-0.6212018, -0.05696481, -2.360812, 0.3019608, 1, 0, 1,
-0.6200116, 1.409563, -1.299077, 0.2941177, 1, 0, 1,
-0.5991646, 1.824383, -0.6045479, 0.2901961, 1, 0, 1,
-0.5986609, 0.5315267, -2.106814, 0.282353, 1, 0, 1,
-0.597049, -0.1481519, -1.295966, 0.2784314, 1, 0, 1,
-0.5924109, -0.4045912, -3.758665, 0.2705882, 1, 0, 1,
-0.5908012, 1.74732, -0.5129067, 0.2666667, 1, 0, 1,
-0.5884344, -1.598567, -5.357647, 0.2588235, 1, 0, 1,
-0.5878707, -0.2882235, -1.972883, 0.254902, 1, 0, 1,
-0.5864044, -0.3001688, -1.668735, 0.2470588, 1, 0, 1,
-0.5835471, -0.2209977, -2.49407, 0.2431373, 1, 0, 1,
-0.581792, 1.464239, -1.272786, 0.2352941, 1, 0, 1,
-0.5797736, 0.6644435, -0.6172118, 0.2313726, 1, 0, 1,
-0.5731693, -0.6270722, -0.9387196, 0.2235294, 1, 0, 1,
-0.570146, -0.1674284, -1.518497, 0.2196078, 1, 0, 1,
-0.5646566, 1.670264, 0.1072932, 0.2117647, 1, 0, 1,
-0.5608392, 1.055197, -1.349377, 0.2078431, 1, 0, 1,
-0.5600475, -0.4878194, -3.603424, 0.2, 1, 0, 1,
-0.5568585, -1.107536, -2.046228, 0.1921569, 1, 0, 1,
-0.5564923, -0.9340988, -2.491957, 0.1882353, 1, 0, 1,
-0.5557469, 0.4116141, -0.4766014, 0.1803922, 1, 0, 1,
-0.5550984, -0.06848861, -2.907683, 0.1764706, 1, 0, 1,
-0.5495182, 0.3272213, -0.7859641, 0.1686275, 1, 0, 1,
-0.5488045, 1.003623, 0.9007863, 0.1647059, 1, 0, 1,
-0.5413601, -0.6380205, -3.482826, 0.1568628, 1, 0, 1,
-0.5353996, 0.1759272, -1.190975, 0.1529412, 1, 0, 1,
-0.5321891, -0.6864592, -2.571291, 0.145098, 1, 0, 1,
-0.5321881, 0.2163756, -2.195219, 0.1411765, 1, 0, 1,
-0.5269531, 1.298113, 0.3143044, 0.1333333, 1, 0, 1,
-0.5175364, -0.9151718, -3.47989, 0.1294118, 1, 0, 1,
-0.517179, -0.6083477, -2.00265, 0.1215686, 1, 0, 1,
-0.5135025, -1.333762, -1.605823, 0.1176471, 1, 0, 1,
-0.5117182, -1.246934, -0.8997007, 0.1098039, 1, 0, 1,
-0.5090455, 0.1084154, -1.024456, 0.1058824, 1, 0, 1,
-0.5063088, 0.09937041, -2.282724, 0.09803922, 1, 0, 1,
-0.5018944, -0.3169318, -2.642559, 0.09019608, 1, 0, 1,
-0.5012074, -0.1733067, -1.195009, 0.08627451, 1, 0, 1,
-0.5005606, 0.4227629, -1.334445, 0.07843138, 1, 0, 1,
-0.4976479, -0.8246546, -2.130892, 0.07450981, 1, 0, 1,
-0.4953347, 1.252399, -0.7406145, 0.06666667, 1, 0, 1,
-0.4909566, -0.1942488, -1.267304, 0.0627451, 1, 0, 1,
-0.478817, -0.04282912, -0.04512845, 0.05490196, 1, 0, 1,
-0.4763925, 0.2175734, -1.397014, 0.05098039, 1, 0, 1,
-0.4726232, 0.2342926, -1.754677, 0.04313726, 1, 0, 1,
-0.4669172, 1.328925, -1.246049, 0.03921569, 1, 0, 1,
-0.4533716, -0.04313083, -2.013008, 0.03137255, 1, 0, 1,
-0.4519593, -0.8941584, -2.215165, 0.02745098, 1, 0, 1,
-0.4485798, 1.135795, -0.9344133, 0.01960784, 1, 0, 1,
-0.4480928, 0.9591696, 0.808886, 0.01568628, 1, 0, 1,
-0.4439903, 1.932613, 0.7747728, 0.007843138, 1, 0, 1,
-0.4435336, -0.1272124, -2.230056, 0.003921569, 1, 0, 1,
-0.4420198, 0.3419498, 0.0771627, 0, 1, 0.003921569, 1,
-0.440701, -1.138715, -1.480724, 0, 1, 0.01176471, 1,
-0.4319933, 1.473336, 1.439084, 0, 1, 0.01568628, 1,
-0.431627, -0.1795074, -2.69854, 0, 1, 0.02352941, 1,
-0.4311875, 1.227826, -0.8623061, 0, 1, 0.02745098, 1,
-0.4281828, 1.278859, -1.954594, 0, 1, 0.03529412, 1,
-0.4261106, 0.6361714, -1.870075, 0, 1, 0.03921569, 1,
-0.4208943, 0.8739598, 1.484279, 0, 1, 0.04705882, 1,
-0.4202628, -0.8250487, -4.633289, 0, 1, 0.05098039, 1,
-0.4140964, 0.7021889, -0.05772481, 0, 1, 0.05882353, 1,
-0.4132476, 0.1361419, -1.274334, 0, 1, 0.0627451, 1,
-0.4086573, -0.02038158, -2.362025, 0, 1, 0.07058824, 1,
-0.3849941, -0.2029743, -0.2907201, 0, 1, 0.07450981, 1,
-0.383367, 0.2885568, -0.4868553, 0, 1, 0.08235294, 1,
-0.3813339, -0.4042032, -1.824956, 0, 1, 0.08627451, 1,
-0.3780421, 0.5442395, -1.713315, 0, 1, 0.09411765, 1,
-0.366238, 1.134923, -0.525053, 0, 1, 0.1019608, 1,
-0.3660271, 2.351635, -0.9942536, 0, 1, 0.1058824, 1,
-0.3639103, -0.6822647, -3.120295, 0, 1, 0.1137255, 1,
-0.3612173, 0.2822638, 0.5265687, 0, 1, 0.1176471, 1,
-0.3574032, -1.360507, -2.894555, 0, 1, 0.1254902, 1,
-0.3501076, 0.3431101, -0.2502579, 0, 1, 0.1294118, 1,
-0.3425601, -1.426947, -4.184384, 0, 1, 0.1372549, 1,
-0.3421997, -1.03098, -3.854486, 0, 1, 0.1411765, 1,
-0.3416224, -0.479258, -2.512975, 0, 1, 0.1490196, 1,
-0.3330255, -0.3174113, -3.24499, 0, 1, 0.1529412, 1,
-0.3325717, 0.2752419, -1.985695, 0, 1, 0.1607843, 1,
-0.3282124, 1.530933, -1.274948, 0, 1, 0.1647059, 1,
-0.3241353, -0.9944024, -3.183429, 0, 1, 0.172549, 1,
-0.3177719, -0.88528, -2.767481, 0, 1, 0.1764706, 1,
-0.3024968, -1.447127, -4.057648, 0, 1, 0.1843137, 1,
-0.3023303, -0.5673084, -3.112441, 0, 1, 0.1882353, 1,
-0.3018476, 0.06357189, -1.179999, 0, 1, 0.1960784, 1,
-0.300408, -1.622997, -3.642781, 0, 1, 0.2039216, 1,
-0.2994562, 0.09995972, -1.025275, 0, 1, 0.2078431, 1,
-0.2967871, 1.244426, -0.5776598, 0, 1, 0.2156863, 1,
-0.2966758, 0.368518, -0.9507532, 0, 1, 0.2196078, 1,
-0.2956098, -1.639584, -1.658882, 0, 1, 0.227451, 1,
-0.2948308, 0.6576412, 0.964128, 0, 1, 0.2313726, 1,
-0.2930483, 1.229703, -1.224483, 0, 1, 0.2392157, 1,
-0.2929894, 0.5339646, 1.161083, 0, 1, 0.2431373, 1,
-0.2881132, -1.155838, -5.404113, 0, 1, 0.2509804, 1,
-0.2864745, 0.3544541, -0.4222578, 0, 1, 0.254902, 1,
-0.2837242, -0.6188411, -2.953, 0, 1, 0.2627451, 1,
-0.283429, -0.02880869, -2.662501, 0, 1, 0.2666667, 1,
-0.2827336, -0.8267601, -1.737603, 0, 1, 0.2745098, 1,
-0.2798682, -0.07268159, -2.581117, 0, 1, 0.2784314, 1,
-0.279021, -1.195041, -2.24267, 0, 1, 0.2862745, 1,
-0.2784477, -0.5286636, -3.090251, 0, 1, 0.2901961, 1,
-0.2783336, -1.672588, -3.312345, 0, 1, 0.2980392, 1,
-0.2746621, 0.1394177, -1.830238, 0, 1, 0.3058824, 1,
-0.274542, -0.4278034, -3.477649, 0, 1, 0.3098039, 1,
-0.2711148, 0.705332, -0.859621, 0, 1, 0.3176471, 1,
-0.2656123, -0.2408767, -1.879392, 0, 1, 0.3215686, 1,
-0.2636922, 1.51126, -0.3970195, 0, 1, 0.3294118, 1,
-0.2626838, -0.3946486, -2.125152, 0, 1, 0.3333333, 1,
-0.261085, 0.3051242, -1.126528, 0, 1, 0.3411765, 1,
-0.2590647, -2.632541, -2.265542, 0, 1, 0.345098, 1,
-0.2571476, -0.6497581, -1.619209, 0, 1, 0.3529412, 1,
-0.2567905, 1.133926, 0.2016219, 0, 1, 0.3568628, 1,
-0.2550597, 0.4731366, 0.4537644, 0, 1, 0.3647059, 1,
-0.2547091, 0.6536323, -0.7339302, 0, 1, 0.3686275, 1,
-0.2541069, 0.8326223, -0.5770487, 0, 1, 0.3764706, 1,
-0.252482, -0.2025333, -1.483111, 0, 1, 0.3803922, 1,
-0.2477912, -0.3823396, -3.206444, 0, 1, 0.3882353, 1,
-0.2464545, 1.503468, 0.4421159, 0, 1, 0.3921569, 1,
-0.240205, -0.1897695, 0.4162945, 0, 1, 0.4, 1,
-0.2382099, 0.1737633, 0.4878421, 0, 1, 0.4078431, 1,
-0.2354729, -0.2471404, -5.109056, 0, 1, 0.4117647, 1,
-0.2350817, 1.118826, -1.816232, 0, 1, 0.4196078, 1,
-0.2287616, -0.2289894, -2.362311, 0, 1, 0.4235294, 1,
-0.2276264, -0.00558891, -1.696129, 0, 1, 0.4313726, 1,
-0.2273041, -0.9949132, -4.496865, 0, 1, 0.4352941, 1,
-0.2255, 1.47054, 0.04097114, 0, 1, 0.4431373, 1,
-0.2223029, -0.04778672, -0.2288305, 0, 1, 0.4470588, 1,
-0.2109791, 2.572008, 0.02838261, 0, 1, 0.454902, 1,
-0.208593, -0.1040609, -2.859015, 0, 1, 0.4588235, 1,
-0.2078319, -0.255222, -1.318757, 0, 1, 0.4666667, 1,
-0.2028188, 1.037477, -0.705773, 0, 1, 0.4705882, 1,
-0.20251, -1.613483, -1.883832, 0, 1, 0.4784314, 1,
-0.2008964, 0.4329252, 0.4341982, 0, 1, 0.4823529, 1,
-0.1999375, 0.8269529, -1.199089, 0, 1, 0.4901961, 1,
-0.1993018, -1.562561, -4.511413, 0, 1, 0.4941176, 1,
-0.1986256, -0.9846023, -1.931827, 0, 1, 0.5019608, 1,
-0.1973308, -0.8758817, -2.117612, 0, 1, 0.509804, 1,
-0.1954801, 0.5173075, -0.7111979, 0, 1, 0.5137255, 1,
-0.1951652, -1.162835, -1.578181, 0, 1, 0.5215687, 1,
-0.1916549, -0.2175231, -2.502839, 0, 1, 0.5254902, 1,
-0.1905615, -0.4939083, -2.945625, 0, 1, 0.5333334, 1,
-0.1860762, 0.9983305, 0.1130717, 0, 1, 0.5372549, 1,
-0.1835398, -1.321083, -2.212747, 0, 1, 0.5450981, 1,
-0.1768751, -0.7072495, -4.226578, 0, 1, 0.5490196, 1,
-0.1712577, -0.8485355, -1.933948, 0, 1, 0.5568628, 1,
-0.170837, 1.100852, 0.8370344, 0, 1, 0.5607843, 1,
-0.1670362, 1.141943, -0.3989761, 0, 1, 0.5686275, 1,
-0.1642097, 0.4244106, -1.070812, 0, 1, 0.572549, 1,
-0.1546142, 0.9997381, -0.8522435, 0, 1, 0.5803922, 1,
-0.1521208, -1.16295, -4.042045, 0, 1, 0.5843138, 1,
-0.1491218, 1.65892, -0.940932, 0, 1, 0.5921569, 1,
-0.1482324, 0.2082024, 0.2690549, 0, 1, 0.5960785, 1,
-0.1453762, 0.1592465, 0.3188968, 0, 1, 0.6039216, 1,
-0.1450161, 0.05108332, -1.387141, 0, 1, 0.6117647, 1,
-0.1448034, -0.4324943, -2.128042, 0, 1, 0.6156863, 1,
-0.1405126, 0.216051, -2.311621, 0, 1, 0.6235294, 1,
-0.1367591, 0.9511763, -0.09738971, 0, 1, 0.627451, 1,
-0.1361176, 1.744861, -0.1223942, 0, 1, 0.6352941, 1,
-0.1361115, 1.132427, -0.5704889, 0, 1, 0.6392157, 1,
-0.1297959, 0.09980603, -1.128621, 0, 1, 0.6470588, 1,
-0.1211164, 0.3570771, -0.7973254, 0, 1, 0.6509804, 1,
-0.1205615, -0.1361107, -1.563741, 0, 1, 0.6588235, 1,
-0.1192785, -0.8454647, -2.745665, 0, 1, 0.6627451, 1,
-0.1178134, 0.4958349, 1.390529, 0, 1, 0.6705883, 1,
-0.1165255, 0.6256955, -0.9480027, 0, 1, 0.6745098, 1,
-0.1148373, -1.150631, -2.410919, 0, 1, 0.682353, 1,
-0.1140862, 0.5444995, -1.024866, 0, 1, 0.6862745, 1,
-0.1134691, -0.614938, -3.398, 0, 1, 0.6941177, 1,
-0.1105827, 1.685785, 0.1858024, 0, 1, 0.7019608, 1,
-0.1092698, 1.580014, 0.717724, 0, 1, 0.7058824, 1,
-0.1045253, -0.2017835, -1.255985, 0, 1, 0.7137255, 1,
-0.0991729, -0.3897697, -3.925767, 0, 1, 0.7176471, 1,
-0.09445635, -0.02830174, -1.243181, 0, 1, 0.7254902, 1,
-0.08414534, 1.311131, 0.7897171, 0, 1, 0.7294118, 1,
-0.08361354, -0.25399, -2.244102, 0, 1, 0.7372549, 1,
-0.08248465, 1.416296, 0.1622755, 0, 1, 0.7411765, 1,
-0.0802796, -0.1659599, -4.457024, 0, 1, 0.7490196, 1,
-0.0783065, -0.43826, -1.147086, 0, 1, 0.7529412, 1,
-0.07336285, 0.5314349, 0.3139925, 0, 1, 0.7607843, 1,
-0.07076169, 0.5352549, 0.2382259, 0, 1, 0.7647059, 1,
-0.06889584, -1.067609, -2.445747, 0, 1, 0.772549, 1,
-0.06733818, -1.238753, -2.104083, 0, 1, 0.7764706, 1,
-0.06246688, 1.060623, -0.2386791, 0, 1, 0.7843137, 1,
-0.06053677, -0.7100108, -0.930163, 0, 1, 0.7882353, 1,
-0.05532819, -1.99745, -4.740269, 0, 1, 0.7960784, 1,
-0.05326801, -1.946262, -3.482427, 0, 1, 0.8039216, 1,
-0.05097746, -0.5529189, -3.135396, 0, 1, 0.8078431, 1,
-0.04901254, -0.3386002, -2.297991, 0, 1, 0.8156863, 1,
-0.04738129, 0.416295, -0.7942395, 0, 1, 0.8196079, 1,
-0.04680661, -0.873216, -0.9616196, 0, 1, 0.827451, 1,
-0.04534468, 0.5957647, 1.746787, 0, 1, 0.8313726, 1,
-0.04157993, -1.845377, -3.159366, 0, 1, 0.8392157, 1,
-0.04054202, -0.4794564, -4.016662, 0, 1, 0.8431373, 1,
-0.03826649, 0.3049045, 0.6839619, 0, 1, 0.8509804, 1,
-0.03766726, 0.0235766, -1.947313, 0, 1, 0.854902, 1,
-0.03590882, -1.027305, -3.81399, 0, 1, 0.8627451, 1,
-0.03504368, -0.2030458, -3.919104, 0, 1, 0.8666667, 1,
-0.03362015, 0.6272979, -0.8542001, 0, 1, 0.8745098, 1,
-0.02940998, -0.1680071, -4.452281, 0, 1, 0.8784314, 1,
-0.0278957, 0.6540363, -0.3727127, 0, 1, 0.8862745, 1,
-0.02765208, 0.1339055, 0.3441077, 0, 1, 0.8901961, 1,
-0.02150634, -0.3748866, -6.110351, 0, 1, 0.8980392, 1,
-0.01567048, 0.7118143, 0.7217816, 0, 1, 0.9058824, 1,
-0.01442804, 0.4711833, -1.183615, 0, 1, 0.9098039, 1,
-0.01315699, 0.6198685, -0.1589787, 0, 1, 0.9176471, 1,
-0.01259124, -0.163122, -3.96977, 0, 1, 0.9215686, 1,
-0.007356253, 1.376355, -0.02886327, 0, 1, 0.9294118, 1,
-0.00720809, -1.697028, -1.617842, 0, 1, 0.9333333, 1,
-0.006501823, -1.170962, -1.808874, 0, 1, 0.9411765, 1,
-0.002192313, 0.2892567, -0.04745747, 0, 1, 0.945098, 1,
0.0009353682, 0.7878915, 0.4660447, 0, 1, 0.9529412, 1,
0.002603675, -0.4220635, 4.862602, 0, 1, 0.9568627, 1,
0.003219387, 0.0278077, -0.9819121, 0, 1, 0.9647059, 1,
0.004610662, -0.6635544, 3.376061, 0, 1, 0.9686275, 1,
0.00676218, -0.4140167, 3.032914, 0, 1, 0.9764706, 1,
0.006836113, -0.2141692, 1.920613, 0, 1, 0.9803922, 1,
0.008931285, -0.2641832, 2.821037, 0, 1, 0.9882353, 1,
0.009806789, 0.7998173, 0.3057376, 0, 1, 0.9921569, 1,
0.01134147, 0.3920998, -0.2440827, 0, 1, 1, 1,
0.02165217, 0.5260881, -0.9165232, 0, 0.9921569, 1, 1,
0.03021267, -0.9296688, 3.254821, 0, 0.9882353, 1, 1,
0.03371516, -0.5279936, 1.752388, 0, 0.9803922, 1, 1,
0.03586393, -0.3152181, 3.416203, 0, 0.9764706, 1, 1,
0.0434115, -0.7738343, 4.45067, 0, 0.9686275, 1, 1,
0.04504943, -0.3343199, 1.126467, 0, 0.9647059, 1, 1,
0.04937793, 1.486194, -0.4882853, 0, 0.9568627, 1, 1,
0.05103734, 1.093425, -0.964723, 0, 0.9529412, 1, 1,
0.05367893, -1.183992, 4.186937, 0, 0.945098, 1, 1,
0.0605355, -0.05892537, 1.294377, 0, 0.9411765, 1, 1,
0.06116422, 1.247046, -0.3631525, 0, 0.9333333, 1, 1,
0.06252617, -0.09828043, 3.172034, 0, 0.9294118, 1, 1,
0.06470797, 0.9740779, 0.3308191, 0, 0.9215686, 1, 1,
0.06473263, -1.337662, 1.9103, 0, 0.9176471, 1, 1,
0.06511762, -2.345579, 4.990932, 0, 0.9098039, 1, 1,
0.06700001, 0.6946211, -0.9093851, 0, 0.9058824, 1, 1,
0.0676059, 0.7041087, -2.829807, 0, 0.8980392, 1, 1,
0.07050353, -0.5097268, 1.965368, 0, 0.8901961, 1, 1,
0.07361788, -0.5789306, 3.03884, 0, 0.8862745, 1, 1,
0.07450664, 0.02707042, 0.8347992, 0, 0.8784314, 1, 1,
0.07599591, -1.99694, 4.422559, 0, 0.8745098, 1, 1,
0.07770856, 0.3606467, 0.6085742, 0, 0.8666667, 1, 1,
0.08255367, 0.6985778, 1.165707, 0, 0.8627451, 1, 1,
0.08949246, 0.004289751, 2.451593, 0, 0.854902, 1, 1,
0.09038519, 1.319913, 0.1276941, 0, 0.8509804, 1, 1,
0.09314552, 1.779974, -1.798706, 0, 0.8431373, 1, 1,
0.09495831, -0.6358653, 1.921688, 0, 0.8392157, 1, 1,
0.09997355, -1.020363, 5.318854, 0, 0.8313726, 1, 1,
0.1042186, -0.4911788, 4.362815, 0, 0.827451, 1, 1,
0.1057438, -0.6388959, 2.838208, 0, 0.8196079, 1, 1,
0.108011, 1.666079, 1.586249, 0, 0.8156863, 1, 1,
0.1087451, -0.2117216, 1.895028, 0, 0.8078431, 1, 1,
0.1127754, -1.315261, 3.868775, 0, 0.8039216, 1, 1,
0.1145076, 0.6915309, -0.4673882, 0, 0.7960784, 1, 1,
0.1149747, -1.582103, 2.63783, 0, 0.7882353, 1, 1,
0.1156784, -0.404116, 2.299361, 0, 0.7843137, 1, 1,
0.1162235, -0.8126178, 3.475763, 0, 0.7764706, 1, 1,
0.1193247, 0.4216666, 0.02554984, 0, 0.772549, 1, 1,
0.1322036, 0.2502188, 0.002597693, 0, 0.7647059, 1, 1,
0.1354976, -0.05064444, 3.632014, 0, 0.7607843, 1, 1,
0.1383817, -1.020777, 4.206342, 0, 0.7529412, 1, 1,
0.1430239, -0.5508106, 5.338282, 0, 0.7490196, 1, 1,
0.1433369, -0.3251449, 2.611104, 0, 0.7411765, 1, 1,
0.1469672, -0.2263038, 1.08652, 0, 0.7372549, 1, 1,
0.1486373, -0.4443496, 2.476317, 0, 0.7294118, 1, 1,
0.1489076, 0.7373467, -1.184554, 0, 0.7254902, 1, 1,
0.1491644, 2.478013, 2.291965, 0, 0.7176471, 1, 1,
0.150426, -1.290648, 2.251525, 0, 0.7137255, 1, 1,
0.1505068, -0.5960467, 2.285937, 0, 0.7058824, 1, 1,
0.152821, -0.3945611, 4.103047, 0, 0.6980392, 1, 1,
0.1538517, 0.4552875, 0.3826506, 0, 0.6941177, 1, 1,
0.1542219, 0.2594587, 1.209489, 0, 0.6862745, 1, 1,
0.1595277, -1.031902, 3.511349, 0, 0.682353, 1, 1,
0.1632158, 0.04452924, 1.654562, 0, 0.6745098, 1, 1,
0.168103, 1.596518, -0.2808599, 0, 0.6705883, 1, 1,
0.169255, -0.7427797, 4.402789, 0, 0.6627451, 1, 1,
0.1730136, 1.58168, -1.085855, 0, 0.6588235, 1, 1,
0.1809068, 1.484173, -0.9235485, 0, 0.6509804, 1, 1,
0.1862961, -0.5472903, 3.71234, 0, 0.6470588, 1, 1,
0.1871232, 2.203926, -0.8917463, 0, 0.6392157, 1, 1,
0.1891133, 0.1045208, 0.5009007, 0, 0.6352941, 1, 1,
0.1899271, 0.04560732, 1.910406, 0, 0.627451, 1, 1,
0.1904848, 0.4729997, 0.8546665, 0, 0.6235294, 1, 1,
0.1917684, 0.7421584, 0.1034055, 0, 0.6156863, 1, 1,
0.1928969, 1.128854, -0.07893524, 0, 0.6117647, 1, 1,
0.1950662, 0.6551031, 1.082742, 0, 0.6039216, 1, 1,
0.1981849, -0.1718884, 1.028571, 0, 0.5960785, 1, 1,
0.1989591, -0.8769753, 2.951144, 0, 0.5921569, 1, 1,
0.2058412, -0.2993758, 1.701508, 0, 0.5843138, 1, 1,
0.2148356, -0.3294712, 2.460475, 0, 0.5803922, 1, 1,
0.2151264, -1.184206, 2.679642, 0, 0.572549, 1, 1,
0.2174573, 0.3715994, -0.8439272, 0, 0.5686275, 1, 1,
0.2180481, -0.3743337, 1.140177, 0, 0.5607843, 1, 1,
0.2198144, -1.86592, 2.413335, 0, 0.5568628, 1, 1,
0.2205292, -0.4516031, 2.604147, 0, 0.5490196, 1, 1,
0.2209965, -1.874293, 4.246779, 0, 0.5450981, 1, 1,
0.2223071, 2.184609, 1.761271, 0, 0.5372549, 1, 1,
0.2228352, -0.7151499, 1.44593, 0, 0.5333334, 1, 1,
0.232023, 1.1989, -0.6645706, 0, 0.5254902, 1, 1,
0.2321712, -2.395738, 1.255156, 0, 0.5215687, 1, 1,
0.2384925, -0.1872482, -0.2028915, 0, 0.5137255, 1, 1,
0.2386153, -0.4635644, 2.961954, 0, 0.509804, 1, 1,
0.2433873, 0.2795148, 0.05958436, 0, 0.5019608, 1, 1,
0.2443279, 0.3605153, 0.1799686, 0, 0.4941176, 1, 1,
0.246844, -0.6344312, 2.32203, 0, 0.4901961, 1, 1,
0.2511734, -0.3158558, 3.374978, 0, 0.4823529, 1, 1,
0.2523752, 0.02181421, 1.730783, 0, 0.4784314, 1, 1,
0.2605353, -0.8021685, 1.726527, 0, 0.4705882, 1, 1,
0.2648135, -0.009209963, 1.343429, 0, 0.4666667, 1, 1,
0.2677511, 1.454663, -0.7306805, 0, 0.4588235, 1, 1,
0.2685367, 0.6393595, -1.3147, 0, 0.454902, 1, 1,
0.2689849, 0.6908085, 0.9844897, 0, 0.4470588, 1, 1,
0.2713611, 0.2337146, 0.9089279, 0, 0.4431373, 1, 1,
0.2729289, 0.5462791, -0.3209672, 0, 0.4352941, 1, 1,
0.2735305, -0.6619191, 3.47762, 0, 0.4313726, 1, 1,
0.279776, -0.5037014, 3.82796, 0, 0.4235294, 1, 1,
0.2813291, 0.1152435, 2.641244, 0, 0.4196078, 1, 1,
0.2879149, 0.7628109, -0.9401214, 0, 0.4117647, 1, 1,
0.2899312, 0.003816829, 1.194874, 0, 0.4078431, 1, 1,
0.2938889, 0.08571432, 0.2098749, 0, 0.4, 1, 1,
0.2952196, 0.3405352, 1.010736, 0, 0.3921569, 1, 1,
0.2953996, 1.807426, -1.445069, 0, 0.3882353, 1, 1,
0.2965524, 0.3653801, 0.7005247, 0, 0.3803922, 1, 1,
0.3001373, 0.3533142, 1.348255, 0, 0.3764706, 1, 1,
0.301648, -0.004018781, 1.895042, 0, 0.3686275, 1, 1,
0.3056784, -2.309414, 4.879745, 0, 0.3647059, 1, 1,
0.3124022, 1.974112, 0.1473737, 0, 0.3568628, 1, 1,
0.3128923, 0.4100193, 0.7394882, 0, 0.3529412, 1, 1,
0.3177647, 0.8052231, 3.215049, 0, 0.345098, 1, 1,
0.3184743, -0.2027956, 1.538296, 0, 0.3411765, 1, 1,
0.3200643, 1.870775, 0.1808708, 0, 0.3333333, 1, 1,
0.3225775, 0.5095783, 1.098945, 0, 0.3294118, 1, 1,
0.3234266, -1.423575, 1.455824, 0, 0.3215686, 1, 1,
0.3278158, -0.2213832, 1.274909, 0, 0.3176471, 1, 1,
0.3291467, 1.075383, 0.0040493, 0, 0.3098039, 1, 1,
0.3297911, -1.232358, 1.726452, 0, 0.3058824, 1, 1,
0.3315254, -0.2903333, 1.644385, 0, 0.2980392, 1, 1,
0.3332791, -0.6760601, 3.65667, 0, 0.2901961, 1, 1,
0.3340727, 1.090771, -0.1694002, 0, 0.2862745, 1, 1,
0.3380095, -0.002581479, 0.2503725, 0, 0.2784314, 1, 1,
0.3400526, 0.04417983, 1.443046, 0, 0.2745098, 1, 1,
0.3424151, 0.06292529, 0.3471149, 0, 0.2666667, 1, 1,
0.3432447, 1.461834, 0.4480088, 0, 0.2627451, 1, 1,
0.3482665, 0.03429643, -0.6042152, 0, 0.254902, 1, 1,
0.3484652, -1.28159, 3.479495, 0, 0.2509804, 1, 1,
0.3539341, 0.2331343, 1.228382, 0, 0.2431373, 1, 1,
0.3605227, 0.567926, 3.762264, 0, 0.2392157, 1, 1,
0.3609532, -1.178066, 2.606908, 0, 0.2313726, 1, 1,
0.3624082, 0.6243818, -0.7240728, 0, 0.227451, 1, 1,
0.3630586, 0.5751647, 0.6687537, 0, 0.2196078, 1, 1,
0.3644126, -0.5090164, 2.197283, 0, 0.2156863, 1, 1,
0.3706066, 0.3892344, 1.534895, 0, 0.2078431, 1, 1,
0.3728004, -1.852903, 2.546043, 0, 0.2039216, 1, 1,
0.3766044, 1.394624, -0.2663745, 0, 0.1960784, 1, 1,
0.3767813, 1.33217, 0.1236528, 0, 0.1882353, 1, 1,
0.3769971, 1.714145, -0.8555384, 0, 0.1843137, 1, 1,
0.3783271, 0.7017917, -1.292632, 0, 0.1764706, 1, 1,
0.3789656, 0.3925602, -0.2637428, 0, 0.172549, 1, 1,
0.3857124, 0.1439396, 2.335074, 0, 0.1647059, 1, 1,
0.3868811, -0.1598344, 1.706231, 0, 0.1607843, 1, 1,
0.3907481, 1.074247, 0.9405435, 0, 0.1529412, 1, 1,
0.3909692, 0.9783143, 0.02470837, 0, 0.1490196, 1, 1,
0.3953633, 0.0334658, 0.9415418, 0, 0.1411765, 1, 1,
0.4001406, -0.337543, 2.103879, 0, 0.1372549, 1, 1,
0.4012349, 0.3645866, 0.8670101, 0, 0.1294118, 1, 1,
0.4015613, -0.6705289, 1.668001, 0, 0.1254902, 1, 1,
0.4023186, -0.8840102, 3.69386, 0, 0.1176471, 1, 1,
0.4026015, 1.41979, -1.482353, 0, 0.1137255, 1, 1,
0.4081663, -2.486699, 3.930701, 0, 0.1058824, 1, 1,
0.4083157, 0.1034906, 0.5667441, 0, 0.09803922, 1, 1,
0.41038, 0.09204556, 0.3144113, 0, 0.09411765, 1, 1,
0.4125015, 0.374999, 2.410202, 0, 0.08627451, 1, 1,
0.412728, -0.3113405, 1.058162, 0, 0.08235294, 1, 1,
0.417796, 2.223301, 0.9044524, 0, 0.07450981, 1, 1,
0.4215413, -1.544891, 2.664342, 0, 0.07058824, 1, 1,
0.4231447, 0.7173028, -0.9590886, 0, 0.0627451, 1, 1,
0.427058, 0.4106371, 1.073097, 0, 0.05882353, 1, 1,
0.4277479, -0.2896912, 1.403334, 0, 0.05098039, 1, 1,
0.4322368, 0.8847867, -0.1682871, 0, 0.04705882, 1, 1,
0.4339592, 0.5414817, 0.4172433, 0, 0.03921569, 1, 1,
0.4350146, 1.44272, 1.089756, 0, 0.03529412, 1, 1,
0.4411036, 0.06620641, 0.8333884, 0, 0.02745098, 1, 1,
0.441449, -0.4304594, 1.606249, 0, 0.02352941, 1, 1,
0.4463567, -1.095818, 3.809587, 0, 0.01568628, 1, 1,
0.4474157, -0.8241172, 3.587148, 0, 0.01176471, 1, 1,
0.4480939, 0.2399187, -0.4342488, 0, 0.003921569, 1, 1,
0.4542405, -1.71647, 3.149896, 0.003921569, 0, 1, 1,
0.4575818, 0.3330407, -0.008913441, 0.007843138, 0, 1, 1,
0.4606308, -0.1588221, 4.295092, 0.01568628, 0, 1, 1,
0.465341, 2.84675, 0.2921055, 0.01960784, 0, 1, 1,
0.4663903, -0.9032606, 1.149774, 0.02745098, 0, 1, 1,
0.4683494, 1.940819, 0.9321039, 0.03137255, 0, 1, 1,
0.4718486, 1.10719, 1.007003, 0.03921569, 0, 1, 1,
0.473181, 0.186782, 0.9187865, 0.04313726, 0, 1, 1,
0.4787873, -0.4143525, 0.2932071, 0.05098039, 0, 1, 1,
0.480474, -3.066377, 3.007097, 0.05490196, 0, 1, 1,
0.4840119, -0.1722323, 1.739948, 0.0627451, 0, 1, 1,
0.4919955, -0.2792544, 2.369112, 0.06666667, 0, 1, 1,
0.4920487, 0.3510705, 1.790117, 0.07450981, 0, 1, 1,
0.4948819, -0.5041321, 1.685943, 0.07843138, 0, 1, 1,
0.497708, -0.7835515, 1.706834, 0.08627451, 0, 1, 1,
0.4992584, -0.3680261, 1.453686, 0.09019608, 0, 1, 1,
0.4992958, -1.603319, 3.464927, 0.09803922, 0, 1, 1,
0.5048335, 0.5745018, 2.17759, 0.1058824, 0, 1, 1,
0.5049075, 0.6096354, 1.687307, 0.1098039, 0, 1, 1,
0.5094481, -0.250012, 3.575649, 0.1176471, 0, 1, 1,
0.512631, -0.2369633, 2.701221, 0.1215686, 0, 1, 1,
0.5143892, 0.4633474, 1.257779, 0.1294118, 0, 1, 1,
0.5154391, -1.026111, 2.015639, 0.1333333, 0, 1, 1,
0.5212407, 1.2462, -1.362889, 0.1411765, 0, 1, 1,
0.5251238, 0.203372, 1.857089, 0.145098, 0, 1, 1,
0.5347796, 0.9140952, -0.05312891, 0.1529412, 0, 1, 1,
0.5440823, 0.9671869, 0.818504, 0.1568628, 0, 1, 1,
0.5453959, 0.4736308, 0.7173911, 0.1647059, 0, 1, 1,
0.5471153, -0.1591238, 2.160535, 0.1686275, 0, 1, 1,
0.5479929, 0.02945296, 3.314827, 0.1764706, 0, 1, 1,
0.5505946, 1.007143, -0.045799, 0.1803922, 0, 1, 1,
0.5508507, -1.705602, 3.124166, 0.1882353, 0, 1, 1,
0.5529304, 0.4454991, 0.7393031, 0.1921569, 0, 1, 1,
0.5533563, -1.19146, 2.785528, 0.2, 0, 1, 1,
0.559992, 1.181064, 0.6738405, 0.2078431, 0, 1, 1,
0.564068, 0.7395959, -0.3840046, 0.2117647, 0, 1, 1,
0.5709181, -1.088725, 3.138582, 0.2196078, 0, 1, 1,
0.5727347, -0.8491961, 2.037403, 0.2235294, 0, 1, 1,
0.5732045, -0.1519864, 1.746087, 0.2313726, 0, 1, 1,
0.5733163, -0.3357685, 1.474347, 0.2352941, 0, 1, 1,
0.5737732, 0.216159, 2.040544, 0.2431373, 0, 1, 1,
0.5781528, -0.7414955, 2.229162, 0.2470588, 0, 1, 1,
0.5833141, 0.2492564, 0.6731184, 0.254902, 0, 1, 1,
0.5842443, 0.1419817, 1.16912, 0.2588235, 0, 1, 1,
0.584613, 1.625347, -0.667101, 0.2666667, 0, 1, 1,
0.5929527, -0.1238193, 4.961726, 0.2705882, 0, 1, 1,
0.5972889, -1.082247, 2.388761, 0.2784314, 0, 1, 1,
0.6007316, 1.612064, 0.3514665, 0.282353, 0, 1, 1,
0.6056592, -0.4962747, 1.987983, 0.2901961, 0, 1, 1,
0.6067766, 0.1377564, 2.69778, 0.2941177, 0, 1, 1,
0.6101602, -2.222412, 1.904896, 0.3019608, 0, 1, 1,
0.6113814, -1.253852, 1.752035, 0.3098039, 0, 1, 1,
0.6120645, 1.109559, 0.2661865, 0.3137255, 0, 1, 1,
0.6142667, 1.389464, 1.76008, 0.3215686, 0, 1, 1,
0.6145698, -0.1246437, 2.642927, 0.3254902, 0, 1, 1,
0.6160651, -0.8325536, 4.606939, 0.3333333, 0, 1, 1,
0.6189393, -0.5290657, 2.992716, 0.3372549, 0, 1, 1,
0.6189995, 0.1907001, -0.2210363, 0.345098, 0, 1, 1,
0.6218933, 0.3060059, 0.606086, 0.3490196, 0, 1, 1,
0.6266979, -0.5199215, 1.392988, 0.3568628, 0, 1, 1,
0.6290084, 1.973599, 3.178672, 0.3607843, 0, 1, 1,
0.6327151, -0.5397595, 2.517051, 0.3686275, 0, 1, 1,
0.6359349, 1.220292, -0.3382553, 0.372549, 0, 1, 1,
0.63691, -0.4153738, 1.682298, 0.3803922, 0, 1, 1,
0.6388093, 0.1782617, -0.4016127, 0.3843137, 0, 1, 1,
0.6424413, -1.073784, 2.706083, 0.3921569, 0, 1, 1,
0.6427048, -0.7964948, 2.657382, 0.3960784, 0, 1, 1,
0.6478179, 0.9845409, 1.801263, 0.4039216, 0, 1, 1,
0.6539975, -0.2862621, 0.8874195, 0.4117647, 0, 1, 1,
0.6543615, -1.115695, 2.761762, 0.4156863, 0, 1, 1,
0.6551662, -1.179883, 2.076733, 0.4235294, 0, 1, 1,
0.656857, 0.860311, -0.1971187, 0.427451, 0, 1, 1,
0.6586333, 0.3125618, 1.490617, 0.4352941, 0, 1, 1,
0.6612591, -0.08795533, 2.656251, 0.4392157, 0, 1, 1,
0.6618838, -1.157279, 1.546429, 0.4470588, 0, 1, 1,
0.6666343, 0.1801565, 2.059701, 0.4509804, 0, 1, 1,
0.6835425, -0.4888382, 0.4092497, 0.4588235, 0, 1, 1,
0.6839116, 2.596314, -1.699186, 0.4627451, 0, 1, 1,
0.6844631, 1.761348, -0.3794123, 0.4705882, 0, 1, 1,
0.6862811, -0.5687635, 0.7304665, 0.4745098, 0, 1, 1,
0.6873199, 0.0137521, 0.2743635, 0.4823529, 0, 1, 1,
0.6889035, 1.521021, -0.9016639, 0.4862745, 0, 1, 1,
0.6955867, -0.09978035, 2.065939, 0.4941176, 0, 1, 1,
0.6988822, 2.812785, 0.9892914, 0.5019608, 0, 1, 1,
0.7080551, 0.09574308, 0.8076912, 0.5058824, 0, 1, 1,
0.7120574, -1.345232, 1.627262, 0.5137255, 0, 1, 1,
0.712249, 0.7057713, 1.559012, 0.5176471, 0, 1, 1,
0.7127122, 1.166386, 0.5138065, 0.5254902, 0, 1, 1,
0.7136754, 1.948317, -0.2660439, 0.5294118, 0, 1, 1,
0.7151868, -1.197281, 1.771557, 0.5372549, 0, 1, 1,
0.7189643, -0.712611, 2.526753, 0.5411765, 0, 1, 1,
0.7192919, 1.252451, 1.510328, 0.5490196, 0, 1, 1,
0.7196013, 1.054604, -0.1190527, 0.5529412, 0, 1, 1,
0.7210869, 0.3021431, 1.857578, 0.5607843, 0, 1, 1,
0.7292449, -1.83558, 2.67822, 0.5647059, 0, 1, 1,
0.7311285, 0.416989, 0.6927933, 0.572549, 0, 1, 1,
0.7356874, -0.5100505, 2.354189, 0.5764706, 0, 1, 1,
0.7358698, -0.5914938, 3.558447, 0.5843138, 0, 1, 1,
0.7462778, 1.658584, -0.2427107, 0.5882353, 0, 1, 1,
0.746582, -0.1487287, 3.212484, 0.5960785, 0, 1, 1,
0.75293, -0.580301, 0.974309, 0.6039216, 0, 1, 1,
0.7540786, 0.4032727, 1.896653, 0.6078432, 0, 1, 1,
0.7545592, 0.0604218, 1.782197, 0.6156863, 0, 1, 1,
0.7556071, 0.1838686, -0.3655544, 0.6196079, 0, 1, 1,
0.7635831, 0.4862121, 0.1796855, 0.627451, 0, 1, 1,
0.7637683, -1.426983, 2.283053, 0.6313726, 0, 1, 1,
0.7658451, -0.4037879, 3.61369, 0.6392157, 0, 1, 1,
0.7745509, 0.5594963, 1.093349, 0.6431373, 0, 1, 1,
0.7757449, -0.03794941, 1.411328, 0.6509804, 0, 1, 1,
0.7821591, 0.06729089, 0.6792326, 0.654902, 0, 1, 1,
0.7896446, -0.6533731, 1.923459, 0.6627451, 0, 1, 1,
0.7945569, 0.09110349, 2.824739, 0.6666667, 0, 1, 1,
0.8064595, 2.13019, -0.08318833, 0.6745098, 0, 1, 1,
0.807372, 0.3233787, 1.76467, 0.6784314, 0, 1, 1,
0.8079276, 0.4471628, 2.190202, 0.6862745, 0, 1, 1,
0.810185, -0.4683664, 1.6533, 0.6901961, 0, 1, 1,
0.8103562, 0.6064184, -0.3385382, 0.6980392, 0, 1, 1,
0.811936, 0.9619786, 2.256423, 0.7058824, 0, 1, 1,
0.8199583, -0.02614948, 1.880359, 0.7098039, 0, 1, 1,
0.8236282, -0.1183212, 1.212987, 0.7176471, 0, 1, 1,
0.8252075, -0.1980436, 1.74266, 0.7215686, 0, 1, 1,
0.8283586, 0.8439802, 2.409662, 0.7294118, 0, 1, 1,
0.8298869, -1.25931, 3.810539, 0.7333333, 0, 1, 1,
0.8334975, 0.5807309, -0.9145941, 0.7411765, 0, 1, 1,
0.8343225, -1.605528, 2.254876, 0.7450981, 0, 1, 1,
0.8474108, 0.6872725, 1.53625, 0.7529412, 0, 1, 1,
0.8623753, -0.2206551, 2.785074, 0.7568628, 0, 1, 1,
0.8626619, -0.5901111, 0.7590517, 0.7647059, 0, 1, 1,
0.8647146, 2.03467, 0.05278549, 0.7686275, 0, 1, 1,
0.8664559, -0.963339, 3.37027, 0.7764706, 0, 1, 1,
0.8788822, 0.4250173, 0.9809386, 0.7803922, 0, 1, 1,
0.8804228, -1.119559, 2.691549, 0.7882353, 0, 1, 1,
0.8820455, -0.02176441, -0.03218214, 0.7921569, 0, 1, 1,
0.8828049, -0.3187272, 1.7354, 0.8, 0, 1, 1,
0.8881962, -1.592427, 3.699681, 0.8078431, 0, 1, 1,
0.8899166, -0.3254499, 1.143521, 0.8117647, 0, 1, 1,
0.8914136, 0.1147924, 2.326027, 0.8196079, 0, 1, 1,
0.8920714, 1.183976, 2.153372, 0.8235294, 0, 1, 1,
0.8978323, 1.524048, 1.403783, 0.8313726, 0, 1, 1,
0.9003783, 2.309571, -0.9148013, 0.8352941, 0, 1, 1,
0.9173453, -1.535969, 2.777103, 0.8431373, 0, 1, 1,
0.9180739, -0.8684458, 1.657361, 0.8470588, 0, 1, 1,
0.9228867, -0.391864, 3.045985, 0.854902, 0, 1, 1,
0.9247885, 1.592039, 0.7697266, 0.8588235, 0, 1, 1,
0.9261954, -0.1189029, 0.923802, 0.8666667, 0, 1, 1,
0.9277424, -0.5297948, 3.039242, 0.8705882, 0, 1, 1,
0.9292287, 0.4873633, 1.267216, 0.8784314, 0, 1, 1,
0.9396611, -0.6557756, 2.315498, 0.8823529, 0, 1, 1,
0.9402882, -0.4314035, 4.658146, 0.8901961, 0, 1, 1,
0.9415483, 0.5146663, 2.536829, 0.8941177, 0, 1, 1,
0.9427352, 0.7709557, -1.385745, 0.9019608, 0, 1, 1,
0.9461549, -0.3063736, 0.528286, 0.9098039, 0, 1, 1,
0.9502879, 1.578411, -0.4156683, 0.9137255, 0, 1, 1,
0.954855, 3.314857, 0.1419207, 0.9215686, 0, 1, 1,
0.9567362, 0.3395411, 0.6039094, 0.9254902, 0, 1, 1,
0.9606761, -0.5996817, 1.824116, 0.9333333, 0, 1, 1,
0.9631396, 2.267526, -0.006647219, 0.9372549, 0, 1, 1,
0.9717013, -0.7254359, 3.072795, 0.945098, 0, 1, 1,
0.971908, 0.04509996, 2.95756, 0.9490196, 0, 1, 1,
0.9769681, -1.268505, 1.651309, 0.9568627, 0, 1, 1,
0.9789626, -0.324884, 2.985085, 0.9607843, 0, 1, 1,
0.9804577, 0.435598, 0.995094, 0.9686275, 0, 1, 1,
0.9895747, -0.4473085, 0.597573, 0.972549, 0, 1, 1,
0.9907103, 0.5066621, 3.30339, 0.9803922, 0, 1, 1,
0.9939076, 1.415141, 0.9222967, 0.9843137, 0, 1, 1,
0.9992839, -1.015984, 2.455224, 0.9921569, 0, 1, 1,
1.009933, 0.5263575, 1.591521, 0.9960784, 0, 1, 1,
1.01088, 0.180655, 0.9440079, 1, 0, 0.9960784, 1,
1.012273, -0.1664399, 1.184751, 1, 0, 0.9882353, 1,
1.015487, 1.217628, 0.8362474, 1, 0, 0.9843137, 1,
1.01896, 1.780776, -0.3651199, 1, 0, 0.9764706, 1,
1.0208, 0.1799426, 0.1452883, 1, 0, 0.972549, 1,
1.021694, -0.9872864, 3.440408, 1, 0, 0.9647059, 1,
1.027178, 0.7121081, 2.020023, 1, 0, 0.9607843, 1,
1.027474, -1.295803, 2.18274, 1, 0, 0.9529412, 1,
1.030583, -0.4186141, 1.212733, 1, 0, 0.9490196, 1,
1.031484, -0.2678886, 3.365136, 1, 0, 0.9411765, 1,
1.036649, 1.057486, 1.560295, 1, 0, 0.9372549, 1,
1.043252, -2.425002, 2.417189, 1, 0, 0.9294118, 1,
1.046399, 1.117578, -0.0345083, 1, 0, 0.9254902, 1,
1.052664, 0.4277898, 0.3771393, 1, 0, 0.9176471, 1,
1.066499, 0.1372959, 1.541876, 1, 0, 0.9137255, 1,
1.070498, -0.1988098, 1.470795, 1, 0, 0.9058824, 1,
1.078087, -1.586303, 1.88757, 1, 0, 0.9019608, 1,
1.079215, -1.114866, 3.432294, 1, 0, 0.8941177, 1,
1.079923, 0.5399465, -0.1687611, 1, 0, 0.8862745, 1,
1.082171, -0.3620021, 2.809362, 1, 0, 0.8823529, 1,
1.086015, 2.847916, -0.7245665, 1, 0, 0.8745098, 1,
1.091635, -2.317103, 1.427955, 1, 0, 0.8705882, 1,
1.094243, -1.511413, 4.034687, 1, 0, 0.8627451, 1,
1.096258, 0.7262416, 2.100185, 1, 0, 0.8588235, 1,
1.103857, 0.1635535, 1.829891, 1, 0, 0.8509804, 1,
1.116585, -0.6255759, 2.028344, 1, 0, 0.8470588, 1,
1.119523, -0.4613205, 1.594052, 1, 0, 0.8392157, 1,
1.120988, -0.4804008, 1.014983, 1, 0, 0.8352941, 1,
1.1267, -0.708334, 1.160061, 1, 0, 0.827451, 1,
1.127753, 0.8678933, 1.079727, 1, 0, 0.8235294, 1,
1.133974, -2.087027, 1.190784, 1, 0, 0.8156863, 1,
1.136949, -2.485655, 2.102973, 1, 0, 0.8117647, 1,
1.137783, 0.476714, 1.503853, 1, 0, 0.8039216, 1,
1.140407, 0.6804984, 1.825289, 1, 0, 0.7960784, 1,
1.141181, -0.2778546, 2.823759, 1, 0, 0.7921569, 1,
1.147378, 0.2882972, 1.486759, 1, 0, 0.7843137, 1,
1.15153, -0.7144662, 3.653993, 1, 0, 0.7803922, 1,
1.158698, 1.194503, 0.7803864, 1, 0, 0.772549, 1,
1.164499, 0.3919815, 2.358946, 1, 0, 0.7686275, 1,
1.16512, -1.36494, 1.989919, 1, 0, 0.7607843, 1,
1.179382, 0.4763576, 1.176267, 1, 0, 0.7568628, 1,
1.184367, 1.08677, 0.6467441, 1, 0, 0.7490196, 1,
1.186533, -1.7216, 2.404278, 1, 0, 0.7450981, 1,
1.195868, -0.4844839, 3.890607, 1, 0, 0.7372549, 1,
1.198611, 0.7909403, 1.719366, 1, 0, 0.7333333, 1,
1.208721, -1.404246, 3.961814, 1, 0, 0.7254902, 1,
1.212363, -0.8167, -0.1450467, 1, 0, 0.7215686, 1,
1.21986, 0.7770659, 0.6090582, 1, 0, 0.7137255, 1,
1.22856, 1.896228, -1.298626, 1, 0, 0.7098039, 1,
1.231523, 0.9791539, -0.7026947, 1, 0, 0.7019608, 1,
1.231892, -1.734252, 1.495668, 1, 0, 0.6941177, 1,
1.23876, 0.1869209, 2.549695, 1, 0, 0.6901961, 1,
1.248273, -0.1406011, 2.765203, 1, 0, 0.682353, 1,
1.249544, -1.221632, 2.128258, 1, 0, 0.6784314, 1,
1.251564, -0.8994752, 1.765892, 1, 0, 0.6705883, 1,
1.253136, -0.6526314, 1.078483, 1, 0, 0.6666667, 1,
1.263866, 0.8796591, 4.264558, 1, 0, 0.6588235, 1,
1.268937, 0.1812149, 2.26989, 1, 0, 0.654902, 1,
1.269826, 2.028208, 0.9776073, 1, 0, 0.6470588, 1,
1.271276, -0.5335399, 2.266448, 1, 0, 0.6431373, 1,
1.271351, -0.2824846, 3.54869, 1, 0, 0.6352941, 1,
1.301755, 0.5550874, 2.403038, 1, 0, 0.6313726, 1,
1.306958, 0.1857889, 2.47862, 1, 0, 0.6235294, 1,
1.30738, 0.02701966, 1.455081, 1, 0, 0.6196079, 1,
1.31037, 0.3246122, 2.819305, 1, 0, 0.6117647, 1,
1.326708, -0.1349374, -0.3459873, 1, 0, 0.6078432, 1,
1.328452, 0.6002452, 2.803528, 1, 0, 0.6, 1,
1.329682, 2.188243, 0.4466362, 1, 0, 0.5921569, 1,
1.335296, -0.1240864, 2.476941, 1, 0, 0.5882353, 1,
1.336429, 2.021709, 0.7502109, 1, 0, 0.5803922, 1,
1.340925, 1.343493, 2.323593, 1, 0, 0.5764706, 1,
1.342008, -0.6905308, 1.924045, 1, 0, 0.5686275, 1,
1.345247, 0.2958319, 2.668218, 1, 0, 0.5647059, 1,
1.345582, -0.2956292, 2.74649, 1, 0, 0.5568628, 1,
1.351699, 1.986091, 0.7500107, 1, 0, 0.5529412, 1,
1.367274, 1.459388, 1.049537, 1, 0, 0.5450981, 1,
1.368382, 0.3183425, 2.065845, 1, 0, 0.5411765, 1,
1.371822, 1.069459, 0.8063281, 1, 0, 0.5333334, 1,
1.376476, 1.158903, 1.569132, 1, 0, 0.5294118, 1,
1.376575, -0.4428892, -1.215941, 1, 0, 0.5215687, 1,
1.382889, -0.837279, 1.756741, 1, 0, 0.5176471, 1,
1.386942, 1.262525, 0.5358452, 1, 0, 0.509804, 1,
1.393803, 0.6323892, -2.063204, 1, 0, 0.5058824, 1,
1.396235, -0.9696284, 2.443526, 1, 0, 0.4980392, 1,
1.397961, -0.3871917, 1.561132, 1, 0, 0.4901961, 1,
1.400846, -0.5668913, 3.082042, 1, 0, 0.4862745, 1,
1.402471, 0.6212361, 0.2126351, 1, 0, 0.4784314, 1,
1.402632, -1.348406, 1.280542, 1, 0, 0.4745098, 1,
1.410087, -1.205433, 3.856026, 1, 0, 0.4666667, 1,
1.41408, 0.2349975, 2.022871, 1, 0, 0.4627451, 1,
1.422541, 0.169815, 0.6286809, 1, 0, 0.454902, 1,
1.428504, 0.3588716, 2.073624, 1, 0, 0.4509804, 1,
1.441966, 1.233067, -0.6289946, 1, 0, 0.4431373, 1,
1.448853, 0.9205619, 1.547776, 1, 0, 0.4392157, 1,
1.449321, 0.3144629, 2.307961, 1, 0, 0.4313726, 1,
1.451291, 0.459891, 1.234493, 1, 0, 0.427451, 1,
1.454787, -1.845908, 1.533465, 1, 0, 0.4196078, 1,
1.46113, -0.621399, 3.57289, 1, 0, 0.4156863, 1,
1.473251, -0.08761864, 2.827789, 1, 0, 0.4078431, 1,
1.479536, 1.845602, -0.07191288, 1, 0, 0.4039216, 1,
1.481146, -1.180704, 1.581746, 1, 0, 0.3960784, 1,
1.481612, 0.02132908, 2.578146, 1, 0, 0.3882353, 1,
1.487813, -1.976728, 3.380846, 1, 0, 0.3843137, 1,
1.489187, -2.246105, 1.782321, 1, 0, 0.3764706, 1,
1.489971, 1.243341, 0.3724269, 1, 0, 0.372549, 1,
1.491463, -0.3185655, 2.721763, 1, 0, 0.3647059, 1,
1.503851, 0.1191044, 1.816488, 1, 0, 0.3607843, 1,
1.524999, -0.1683226, 0.1755123, 1, 0, 0.3529412, 1,
1.531321, 0.5791299, 0.7462685, 1, 0, 0.3490196, 1,
1.542514, 1.0831, 1.139652, 1, 0, 0.3411765, 1,
1.54918, 1.624257, -0.2485968, 1, 0, 0.3372549, 1,
1.556075, 0.1994727, 0.4999416, 1, 0, 0.3294118, 1,
1.569377, -1.228108, 1.36646, 1, 0, 0.3254902, 1,
1.570541, 0.7591535, 2.181254, 1, 0, 0.3176471, 1,
1.582295, -0.2392106, 0.7004445, 1, 0, 0.3137255, 1,
1.591068, 1.141098, -0.0943957, 1, 0, 0.3058824, 1,
1.640484, -1.212881, 0.9901271, 1, 0, 0.2980392, 1,
1.651035, -0.2073161, 1.950721, 1, 0, 0.2941177, 1,
1.675707, -0.6936703, 1.758945, 1, 0, 0.2862745, 1,
1.677421, -1.235925, 2.736633, 1, 0, 0.282353, 1,
1.698115, -0.506493, 0.4106758, 1, 0, 0.2745098, 1,
1.700465, 1.175747, 2.336202, 1, 0, 0.2705882, 1,
1.700584, -0.3596547, 1.17489, 1, 0, 0.2627451, 1,
1.724457, -1.071521, 1.840675, 1, 0, 0.2588235, 1,
1.737886, 0.8012515, 2.363947, 1, 0, 0.2509804, 1,
1.77645, 0.4920078, 1.19733, 1, 0, 0.2470588, 1,
1.792145, 1.22041, -1.316307, 1, 0, 0.2392157, 1,
1.793015, -2.663385, 2.053465, 1, 0, 0.2352941, 1,
1.794186, -0.9016394, 1.463252, 1, 0, 0.227451, 1,
1.806765, -2.73944, 2.106913, 1, 0, 0.2235294, 1,
1.82197, -0.9661759, 2.725603, 1, 0, 0.2156863, 1,
1.824634, -0.6273612, 2.274409, 1, 0, 0.2117647, 1,
1.826537, -0.2510845, 1.76108, 1, 0, 0.2039216, 1,
1.860954, -0.2483872, 1.392038, 1, 0, 0.1960784, 1,
1.865659, 0.05804817, 1.875713, 1, 0, 0.1921569, 1,
1.873021, -1.906739, 3.56977, 1, 0, 0.1843137, 1,
1.890175, -0.2109657, 1.803181, 1, 0, 0.1803922, 1,
1.90636, -0.3478135, 1.923975, 1, 0, 0.172549, 1,
1.919604, -0.2025079, 0.7930043, 1, 0, 0.1686275, 1,
1.925466, 2.324565, 1.233644, 1, 0, 0.1607843, 1,
1.953881, -0.5400131, 1.205286, 1, 0, 0.1568628, 1,
1.962422, -0.4172006, 2.528204, 1, 0, 0.1490196, 1,
1.992173, -0.2329595, 1.010119, 1, 0, 0.145098, 1,
2.03435, 0.1567189, 1.997583, 1, 0, 0.1372549, 1,
2.035299, -1.653289, 1.188306, 1, 0, 0.1333333, 1,
2.04922, -0.3716961, 1.926399, 1, 0, 0.1254902, 1,
2.0667, -1.127968, 3.429961, 1, 0, 0.1215686, 1,
2.067086, 0.520414, 1.78523, 1, 0, 0.1137255, 1,
2.082438, 1.611013, -0.1879479, 1, 0, 0.1098039, 1,
2.086187, -0.9210748, 1.836661, 1, 0, 0.1019608, 1,
2.088489, 0.01458334, 2.745017, 1, 0, 0.09411765, 1,
2.130821, -0.4408795, 1.605113, 1, 0, 0.09019608, 1,
2.146437, 0.7360795, 1.43119, 1, 0, 0.08235294, 1,
2.163969, -1.122959, 1.605936, 1, 0, 0.07843138, 1,
2.194657, -0.05239029, 2.253273, 1, 0, 0.07058824, 1,
2.221764, -0.6674913, 2.822828, 1, 0, 0.06666667, 1,
2.229862, -0.7684548, 2.180818, 1, 0, 0.05882353, 1,
2.320356, 0.5766702, 1.853677, 1, 0, 0.05490196, 1,
2.423294, 0.4848326, 0.7992305, 1, 0, 0.04705882, 1,
2.439435, -0.8373063, 0.3004344, 1, 0, 0.04313726, 1,
2.511783, 0.2239643, 1.621726, 1, 0, 0.03529412, 1,
2.67988, 1.316802, 0.001027087, 1, 0, 0.03137255, 1,
3.053828, 0.008139708, 2.277635, 1, 0, 0.02352941, 1,
3.128363, -0.7970712, 1.821037, 1, 0, 0.01960784, 1,
3.186978, 0.3480239, -0.03495693, 1, 0, 0.01176471, 1,
3.638853, 0.8462407, 0.7624301, 1, 0, 0.007843138, 1
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
0.2796917, -4.147996, -8.050895, 0, -0.5, 0.5, 0.5,
0.2796917, -4.147996, -8.050895, 1, -0.5, 0.5, 0.5,
0.2796917, -4.147996, -8.050895, 1, 1.5, 0.5, 0.5,
0.2796917, -4.147996, -8.050895, 0, 1.5, 0.5, 0.5
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
-4.218225, 0.12424, -8.050895, 0, -0.5, 0.5, 0.5,
-4.218225, 0.12424, -8.050895, 1, -0.5, 0.5, 0.5,
-4.218225, 0.12424, -8.050895, 1, 1.5, 0.5, 0.5,
-4.218225, 0.12424, -8.050895, 0, 1.5, 0.5, 0.5
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
-4.218225, -4.147996, -0.3860345, 0, -0.5, 0.5, 0.5,
-4.218225, -4.147996, -0.3860345, 1, -0.5, 0.5, 0.5,
-4.218225, -4.147996, -0.3860345, 1, 1.5, 0.5, 0.5,
-4.218225, -4.147996, -0.3860345, 0, 1.5, 0.5, 0.5
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
-3, -3.162096, -6.282081,
3, -3.162096, -6.282081,
-3, -3.162096, -6.282081,
-3, -3.326412, -6.576883,
-2, -3.162096, -6.282081,
-2, -3.326412, -6.576883,
-1, -3.162096, -6.282081,
-1, -3.326412, -6.576883,
0, -3.162096, -6.282081,
0, -3.326412, -6.576883,
1, -3.162096, -6.282081,
1, -3.326412, -6.576883,
2, -3.162096, -6.282081,
2, -3.326412, -6.576883,
3, -3.162096, -6.282081,
3, -3.326412, -6.576883
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
-3, -3.655046, -7.166488, 0, -0.5, 0.5, 0.5,
-3, -3.655046, -7.166488, 1, -0.5, 0.5, 0.5,
-3, -3.655046, -7.166488, 1, 1.5, 0.5, 0.5,
-3, -3.655046, -7.166488, 0, 1.5, 0.5, 0.5,
-2, -3.655046, -7.166488, 0, -0.5, 0.5, 0.5,
-2, -3.655046, -7.166488, 1, -0.5, 0.5, 0.5,
-2, -3.655046, -7.166488, 1, 1.5, 0.5, 0.5,
-2, -3.655046, -7.166488, 0, 1.5, 0.5, 0.5,
-1, -3.655046, -7.166488, 0, -0.5, 0.5, 0.5,
-1, -3.655046, -7.166488, 1, -0.5, 0.5, 0.5,
-1, -3.655046, -7.166488, 1, 1.5, 0.5, 0.5,
-1, -3.655046, -7.166488, 0, 1.5, 0.5, 0.5,
0, -3.655046, -7.166488, 0, -0.5, 0.5, 0.5,
0, -3.655046, -7.166488, 1, -0.5, 0.5, 0.5,
0, -3.655046, -7.166488, 1, 1.5, 0.5, 0.5,
0, -3.655046, -7.166488, 0, 1.5, 0.5, 0.5,
1, -3.655046, -7.166488, 0, -0.5, 0.5, 0.5,
1, -3.655046, -7.166488, 1, -0.5, 0.5, 0.5,
1, -3.655046, -7.166488, 1, 1.5, 0.5, 0.5,
1, -3.655046, -7.166488, 0, 1.5, 0.5, 0.5,
2, -3.655046, -7.166488, 0, -0.5, 0.5, 0.5,
2, -3.655046, -7.166488, 1, -0.5, 0.5, 0.5,
2, -3.655046, -7.166488, 1, 1.5, 0.5, 0.5,
2, -3.655046, -7.166488, 0, 1.5, 0.5, 0.5,
3, -3.655046, -7.166488, 0, -0.5, 0.5, 0.5,
3, -3.655046, -7.166488, 1, -0.5, 0.5, 0.5,
3, -3.655046, -7.166488, 1, 1.5, 0.5, 0.5,
3, -3.655046, -7.166488, 0, 1.5, 0.5, 0.5
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
-3.180245, -3, -6.282081,
-3.180245, 3, -6.282081,
-3.180245, -3, -6.282081,
-3.353242, -3, -6.576883,
-3.180245, -2, -6.282081,
-3.353242, -2, -6.576883,
-3.180245, -1, -6.282081,
-3.353242, -1, -6.576883,
-3.180245, 0, -6.282081,
-3.353242, 0, -6.576883,
-3.180245, 1, -6.282081,
-3.353242, 1, -6.576883,
-3.180245, 2, -6.282081,
-3.353242, 2, -6.576883,
-3.180245, 3, -6.282081,
-3.353242, 3, -6.576883
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
-3.699235, -3, -7.166488, 0, -0.5, 0.5, 0.5,
-3.699235, -3, -7.166488, 1, -0.5, 0.5, 0.5,
-3.699235, -3, -7.166488, 1, 1.5, 0.5, 0.5,
-3.699235, -3, -7.166488, 0, 1.5, 0.5, 0.5,
-3.699235, -2, -7.166488, 0, -0.5, 0.5, 0.5,
-3.699235, -2, -7.166488, 1, -0.5, 0.5, 0.5,
-3.699235, -2, -7.166488, 1, 1.5, 0.5, 0.5,
-3.699235, -2, -7.166488, 0, 1.5, 0.5, 0.5,
-3.699235, -1, -7.166488, 0, -0.5, 0.5, 0.5,
-3.699235, -1, -7.166488, 1, -0.5, 0.5, 0.5,
-3.699235, -1, -7.166488, 1, 1.5, 0.5, 0.5,
-3.699235, -1, -7.166488, 0, 1.5, 0.5, 0.5,
-3.699235, 0, -7.166488, 0, -0.5, 0.5, 0.5,
-3.699235, 0, -7.166488, 1, -0.5, 0.5, 0.5,
-3.699235, 0, -7.166488, 1, 1.5, 0.5, 0.5,
-3.699235, 0, -7.166488, 0, 1.5, 0.5, 0.5,
-3.699235, 1, -7.166488, 0, -0.5, 0.5, 0.5,
-3.699235, 1, -7.166488, 1, -0.5, 0.5, 0.5,
-3.699235, 1, -7.166488, 1, 1.5, 0.5, 0.5,
-3.699235, 1, -7.166488, 0, 1.5, 0.5, 0.5,
-3.699235, 2, -7.166488, 0, -0.5, 0.5, 0.5,
-3.699235, 2, -7.166488, 1, -0.5, 0.5, 0.5,
-3.699235, 2, -7.166488, 1, 1.5, 0.5, 0.5,
-3.699235, 2, -7.166488, 0, 1.5, 0.5, 0.5,
-3.699235, 3, -7.166488, 0, -0.5, 0.5, 0.5,
-3.699235, 3, -7.166488, 1, -0.5, 0.5, 0.5,
-3.699235, 3, -7.166488, 1, 1.5, 0.5, 0.5,
-3.699235, 3, -7.166488, 0, 1.5, 0.5, 0.5
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
-3.180245, -3.162096, -6,
-3.180245, -3.162096, 4,
-3.180245, -3.162096, -6,
-3.353242, -3.326412, -6,
-3.180245, -3.162096, -4,
-3.353242, -3.326412, -4,
-3.180245, -3.162096, -2,
-3.353242, -3.326412, -2,
-3.180245, -3.162096, 0,
-3.353242, -3.326412, 0,
-3.180245, -3.162096, 2,
-3.353242, -3.326412, 2,
-3.180245, -3.162096, 4,
-3.353242, -3.326412, 4
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
"-6",
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
-3.699235, -3.655046, -6, 0, -0.5, 0.5, 0.5,
-3.699235, -3.655046, -6, 1, -0.5, 0.5, 0.5,
-3.699235, -3.655046, -6, 1, 1.5, 0.5, 0.5,
-3.699235, -3.655046, -6, 0, 1.5, 0.5, 0.5,
-3.699235, -3.655046, -4, 0, -0.5, 0.5, 0.5,
-3.699235, -3.655046, -4, 1, -0.5, 0.5, 0.5,
-3.699235, -3.655046, -4, 1, 1.5, 0.5, 0.5,
-3.699235, -3.655046, -4, 0, 1.5, 0.5, 0.5,
-3.699235, -3.655046, -2, 0, -0.5, 0.5, 0.5,
-3.699235, -3.655046, -2, 1, -0.5, 0.5, 0.5,
-3.699235, -3.655046, -2, 1, 1.5, 0.5, 0.5,
-3.699235, -3.655046, -2, 0, 1.5, 0.5, 0.5,
-3.699235, -3.655046, 0, 0, -0.5, 0.5, 0.5,
-3.699235, -3.655046, 0, 1, -0.5, 0.5, 0.5,
-3.699235, -3.655046, 0, 1, 1.5, 0.5, 0.5,
-3.699235, -3.655046, 0, 0, 1.5, 0.5, 0.5,
-3.699235, -3.655046, 2, 0, -0.5, 0.5, 0.5,
-3.699235, -3.655046, 2, 1, -0.5, 0.5, 0.5,
-3.699235, -3.655046, 2, 1, 1.5, 0.5, 0.5,
-3.699235, -3.655046, 2, 0, 1.5, 0.5, 0.5,
-3.699235, -3.655046, 4, 0, -0.5, 0.5, 0.5,
-3.699235, -3.655046, 4, 1, -0.5, 0.5, 0.5,
-3.699235, -3.655046, 4, 1, 1.5, 0.5, 0.5,
-3.699235, -3.655046, 4, 0, 1.5, 0.5, 0.5
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
-3.180245, -3.162096, -6.282081,
-3.180245, 3.410576, -6.282081,
-3.180245, -3.162096, 5.510012,
-3.180245, 3.410576, 5.510012,
-3.180245, -3.162096, -6.282081,
-3.180245, -3.162096, 5.510012,
-3.180245, 3.410576, -6.282081,
-3.180245, 3.410576, 5.510012,
-3.180245, -3.162096, -6.282081,
3.739628, -3.162096, -6.282081,
-3.180245, -3.162096, 5.510012,
3.739628, -3.162096, 5.510012,
-3.180245, 3.410576, -6.282081,
3.739628, 3.410576, -6.282081,
-3.180245, 3.410576, 5.510012,
3.739628, 3.410576, 5.510012,
3.739628, -3.162096, -6.282081,
3.739628, 3.410576, -6.282081,
3.739628, -3.162096, 5.510012,
3.739628, 3.410576, 5.510012,
3.739628, -3.162096, -6.282081,
3.739628, -3.162096, 5.510012,
3.739628, 3.410576, -6.282081,
3.739628, 3.410576, 5.510012
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
var radius = 8.100647;
var distance = 36.0407;
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
mvMatrix.translate( -0.2796917, -0.12424, 0.3860345 );
mvMatrix.scale( 1.265714, 1.332575, 0.7427502 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.0407);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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
amino_sulfonic_acid<-read.table("amino_sulfonic_acid.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-amino_sulfonic_acid$V2
```

```
## Error in eval(expr, envir, enclos): object 'amino_sulfonic_acid' not found
```

```r
y<-amino_sulfonic_acid$V3
```

```
## Error in eval(expr, envir, enclos): object 'amino_sulfonic_acid' not found
```

```r
z<-amino_sulfonic_acid$V4
```

```
## Error in eval(expr, envir, enclos): object 'amino_sulfonic_acid' not found
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
-3.07947, 1.37744, -0.4938588, 0, 0, 1, 1, 1,
-3.032382, 0.8053595, -0.7525854, 1, 0, 0, 1, 1,
-2.78085, 2.962262, 0.5896212, 1, 0, 0, 1, 1,
-2.489763, 0.09511879, -3.135644, 1, 0, 0, 1, 1,
-2.486008, -0.4693245, -1.514987, 1, 0, 0, 1, 1,
-2.469051, -0.636015, -4.489253, 1, 0, 0, 1, 1,
-2.455676, -0.3341556, -2.221083, 0, 0, 0, 1, 1,
-2.428464, 0.4889943, -0.2495486, 0, 0, 0, 1, 1,
-2.41075, -0.3146249, -0.3406915, 0, 0, 0, 1, 1,
-2.388888, 1.194067, -1.088144, 0, 0, 0, 1, 1,
-2.344105, 0.2985111, -2.600792, 0, 0, 0, 1, 1,
-2.342123, 0.4236281, -2.000137, 0, 0, 0, 1, 1,
-2.237704, -1.214532, 0.03565443, 0, 0, 0, 1, 1,
-2.227476, -2.003933, -1.721212, 1, 1, 1, 1, 1,
-2.197439, -0.9928504, -2.059495, 1, 1, 1, 1, 1,
-2.074923, 0.03182482, -1.51825, 1, 1, 1, 1, 1,
-2.068246, -1.988953, -2.022337, 1, 1, 1, 1, 1,
-2.04668, 2.039115, -0.8353252, 1, 1, 1, 1, 1,
-2.035264, -0.5135816, -1.653264, 1, 1, 1, 1, 1,
-2.027462, 0.3011182, -0.09484617, 1, 1, 1, 1, 1,
-2.022563, -1.357752, -3.02903, 1, 1, 1, 1, 1,
-2.020252, 0.481338, -0.7604023, 1, 1, 1, 1, 1,
-1.966882, 0.8459712, 0.6932269, 1, 1, 1, 1, 1,
-1.942956, -1.463135, -1.207282, 1, 1, 1, 1, 1,
-1.923007, 0.500389, -1.373256, 1, 1, 1, 1, 1,
-1.917258, -1.345973, -3.045069, 1, 1, 1, 1, 1,
-1.916329, -0.1004644, -2.643844, 1, 1, 1, 1, 1,
-1.912278, 1.751265, -1.090722, 1, 1, 1, 1, 1,
-1.905147, -0.5197294, 0.04188685, 0, 0, 1, 1, 1,
-1.896139, -0.602243, -1.813968, 1, 0, 0, 1, 1,
-1.854041, 0.002280287, -0.1474293, 1, 0, 0, 1, 1,
-1.848241, 0.3340165, -1.495744, 1, 0, 0, 1, 1,
-1.8164, 0.2807578, 0.1218914, 1, 0, 0, 1, 1,
-1.816295, 1.118169, -1.522785, 1, 0, 0, 1, 1,
-1.799244, -2.492856, -2.372175, 0, 0, 0, 1, 1,
-1.794094, -0.1368682, -2.693992, 0, 0, 0, 1, 1,
-1.791683, -0.9083486, -2.639019, 0, 0, 0, 1, 1,
-1.787237, -0.6138903, -1.761037, 0, 0, 0, 1, 1,
-1.779478, -1.974733, -4.096251, 0, 0, 0, 1, 1,
-1.777552, -0.09944813, -2.276143, 0, 0, 0, 1, 1,
-1.769512, -0.9941183, -2.651452, 0, 0, 0, 1, 1,
-1.754331, 0.5021326, -0.7924124, 1, 1, 1, 1, 1,
-1.73197, -0.1433582, -2.475487, 1, 1, 1, 1, 1,
-1.730946, -0.01799311, -0.7690802, 1, 1, 1, 1, 1,
-1.713962, -0.4121393, -2.750422, 1, 1, 1, 1, 1,
-1.694643, -0.161026, -1.411407, 1, 1, 1, 1, 1,
-1.694218, -0.02314431, -1.519545, 1, 1, 1, 1, 1,
-1.690747, 0.386239, -1.766194, 1, 1, 1, 1, 1,
-1.670459, 1.414823, -0.349004, 1, 1, 1, 1, 1,
-1.657876, 1.702724, -2.343446, 1, 1, 1, 1, 1,
-1.643863, 0.4376731, -1.356712, 1, 1, 1, 1, 1,
-1.638776, -0.3116078, -1.869598, 1, 1, 1, 1, 1,
-1.636674, -1.828305, -1.151257, 1, 1, 1, 1, 1,
-1.628952, -1.052413, -2.936983, 1, 1, 1, 1, 1,
-1.628497, -1.045232, -2.251862, 1, 1, 1, 1, 1,
-1.615883, 1.867305, 0.3032635, 1, 1, 1, 1, 1,
-1.615181, -0.9521344, -1.132529, 0, 0, 1, 1, 1,
-1.610518, 1.371143, 0.4767565, 1, 0, 0, 1, 1,
-1.590274, -1.004714, -3.175772, 1, 0, 0, 1, 1,
-1.581401, 0.4431324, -1.998928, 1, 0, 0, 1, 1,
-1.571093, 0.7704114, -2.445083, 1, 0, 0, 1, 1,
-1.560162, 0.5244252, -2.799684, 1, 0, 0, 1, 1,
-1.54459, 1.289196, -0.5832176, 0, 0, 0, 1, 1,
-1.525275, -0.694972, -1.468521, 0, 0, 0, 1, 1,
-1.511509, 0.7294565, -3.090733, 0, 0, 0, 1, 1,
-1.502004, 1.217775, -1.7853, 0, 0, 0, 1, 1,
-1.488116, 1.667644, 0.06764916, 0, 0, 0, 1, 1,
-1.483566, -0.3942985, -3.689855, 0, 0, 0, 1, 1,
-1.482835, -0.01830564, -2.123049, 0, 0, 0, 1, 1,
-1.478231, -1.570886, -1.937776, 1, 1, 1, 1, 1,
-1.475759, 0.7051497, -3.158829, 1, 1, 1, 1, 1,
-1.475152, 0.3359316, -1.062225, 1, 1, 1, 1, 1,
-1.468135, -0.9786345, -2.018339, 1, 1, 1, 1, 1,
-1.441616, 0.9084463, 0.02676709, 1, 1, 1, 1, 1,
-1.424423, 0.4977331, -0.8389635, 1, 1, 1, 1, 1,
-1.410224, 0.8887079, -2.965456, 1, 1, 1, 1, 1,
-1.406528, -0.5662019, -0.9091111, 1, 1, 1, 1, 1,
-1.400546, -0.9766821, -2.124478, 1, 1, 1, 1, 1,
-1.382305, 0.2078007, -2.130052, 1, 1, 1, 1, 1,
-1.38084, -0.7708752, -2.679388, 1, 1, 1, 1, 1,
-1.380451, 1.661994, -0.6446367, 1, 1, 1, 1, 1,
-1.3746, 1.309563, 1.17656, 1, 1, 1, 1, 1,
-1.373601, -1.105378, -2.581899, 1, 1, 1, 1, 1,
-1.367072, -0.3889496, 0.1047764, 1, 1, 1, 1, 1,
-1.36071, -0.2628592, -2.155658, 0, 0, 1, 1, 1,
-1.345962, 1.973006, -0.3425331, 1, 0, 0, 1, 1,
-1.345792, -0.2437937, -0.4461949, 1, 0, 0, 1, 1,
-1.345705, -2.102711, -2.468164, 1, 0, 0, 1, 1,
-1.34151, -0.1272329, -2.754052, 1, 0, 0, 1, 1,
-1.33328, 1.307722, -0.7515991, 1, 0, 0, 1, 1,
-1.330348, -0.2060766, 0.08888745, 0, 0, 0, 1, 1,
-1.325605, -1.092015, -0.9602627, 0, 0, 0, 1, 1,
-1.32236, -0.7089764, -1.685464, 0, 0, 0, 1, 1,
-1.319848, -0.08152729, -0.3425149, 0, 0, 0, 1, 1,
-1.316553, -2.015546, -2.813488, 0, 0, 0, 1, 1,
-1.29883, -0.2693482, -2.638323, 0, 0, 0, 1, 1,
-1.293064, 0.6656136, -1.730478, 0, 0, 0, 1, 1,
-1.284848, 1.59876, -1.412538, 1, 1, 1, 1, 1,
-1.282456, 0.5395711, -0.8835005, 1, 1, 1, 1, 1,
-1.273251, 0.4771105, -0.7768791, 1, 1, 1, 1, 1,
-1.254807, -0.8648026, -1.498573, 1, 1, 1, 1, 1,
-1.24296, 0.2600003, -1.883878, 1, 1, 1, 1, 1,
-1.239633, -1.297366, -3.303655, 1, 1, 1, 1, 1,
-1.236577, 0.6289305, 0.2801441, 1, 1, 1, 1, 1,
-1.2321, 0.3970793, -0.8846237, 1, 1, 1, 1, 1,
-1.226668, -0.8952507, -3.879206, 1, 1, 1, 1, 1,
-1.225976, -0.06900091, -1.288584, 1, 1, 1, 1, 1,
-1.222181, -1.338452, -4.577771, 1, 1, 1, 1, 1,
-1.222004, -0.385808, -2.749122, 1, 1, 1, 1, 1,
-1.216089, 2.738256, -1.013267, 1, 1, 1, 1, 1,
-1.211666, -1.037824, -1.510554, 1, 1, 1, 1, 1,
-1.210832, -0.05548218, -3.14454, 1, 1, 1, 1, 1,
-1.21043, 0.616375, 0.1862312, 0, 0, 1, 1, 1,
-1.209436, -1.452628, -2.896607, 1, 0, 0, 1, 1,
-1.208582, 0.006815239, -1.755644, 1, 0, 0, 1, 1,
-1.195537, -0.3242503, -2.01111, 1, 0, 0, 1, 1,
-1.195348, 0.1520438, -2.172289, 1, 0, 0, 1, 1,
-1.189878, -0.3473242, -1.126653, 1, 0, 0, 1, 1,
-1.187881, 0.5510044, -0.8044549, 0, 0, 0, 1, 1,
-1.183646, 0.1352177, -2.122407, 0, 0, 0, 1, 1,
-1.183299, -1.317724, -2.993547, 0, 0, 0, 1, 1,
-1.176338, 2.045302, -1.072351, 0, 0, 0, 1, 1,
-1.171436, 1.227252, -1.030828, 0, 0, 0, 1, 1,
-1.152914, -0.4981805, -2.530716, 0, 0, 0, 1, 1,
-1.15171, -1.17395, -0.9702083, 0, 0, 0, 1, 1,
-1.149953, -0.9369016, -2.215954, 1, 1, 1, 1, 1,
-1.14607, 2.530038, -0.02098716, 1, 1, 1, 1, 1,
-1.145616, -0.3132329, 0.9512304, 1, 1, 1, 1, 1,
-1.131477, 0.8729507, -0.6181139, 1, 1, 1, 1, 1,
-1.131102, -1.125406, -2.750395, 1, 1, 1, 1, 1,
-1.130904, -0.447163, -1.613238, 1, 1, 1, 1, 1,
-1.123002, -1.009502, -3.283707, 1, 1, 1, 1, 1,
-1.116753, 0.2899619, -1.242864, 1, 1, 1, 1, 1,
-1.107833, 0.5668862, -3.49217, 1, 1, 1, 1, 1,
-1.107394, -1.430607, -2.592961, 1, 1, 1, 1, 1,
-1.100566, -0.1618276, -2.70825, 1, 1, 1, 1, 1,
-1.09941, 0.8273491, -1.814427, 1, 1, 1, 1, 1,
-1.09672, -0.08536543, -1.315324, 1, 1, 1, 1, 1,
-1.080871, -0.09774565, -0.5587425, 1, 1, 1, 1, 1,
-1.079277, 0.3082244, 0.6396301, 1, 1, 1, 1, 1,
-1.077734, -0.7729969, -1.134144, 0, 0, 1, 1, 1,
-1.07362, 0.2637895, -0.2654923, 1, 0, 0, 1, 1,
-1.070321, 0.774864, -2.208981, 1, 0, 0, 1, 1,
-1.067221, -0.4985177, -1.684027, 1, 0, 0, 1, 1,
-1.0639, 0.9995532, -1.026796, 1, 0, 0, 1, 1,
-1.062126, -0.003543364, -0.3436498, 1, 0, 0, 1, 1,
-1.043904, -0.5879704, -0.8725559, 0, 0, 0, 1, 1,
-1.039274, -1.332142, -2.943067, 0, 0, 0, 1, 1,
-1.036241, 0.3642755, -1.456746, 0, 0, 0, 1, 1,
-1.034992, -0.9227182, -2.790122, 0, 0, 0, 1, 1,
-1.030069, -0.2889826, -2.119353, 0, 0, 0, 1, 1,
-1.029932, 0.5470784, -2.362437, 0, 0, 0, 1, 1,
-1.026635, 0.6634945, -1.04249, 0, 0, 0, 1, 1,
-1.024999, 0.3594605, -1.79715, 1, 1, 1, 1, 1,
-1.023411, -1.000777, -2.358371, 1, 1, 1, 1, 1,
-1.018201, -1.110202, -2.186225, 1, 1, 1, 1, 1,
-1.011958, 0.5684326, -1.385727, 1, 1, 1, 1, 1,
-1.008962, -0.01513888, -0.1435157, 1, 1, 1, 1, 1,
-1.008724, 0.6796795, -0.4580657, 1, 1, 1, 1, 1,
-1.00808, 0.8193509, -1.281185, 1, 1, 1, 1, 1,
-0.9978834, 0.1747039, -1.736529, 1, 1, 1, 1, 1,
-0.9853947, -0.4674363, -1.700871, 1, 1, 1, 1, 1,
-0.9841208, -0.4684732, -4.16809, 1, 1, 1, 1, 1,
-0.9829608, -1.297308, -3.881613, 1, 1, 1, 1, 1,
-0.9815596, -0.1652405, -1.786471, 1, 1, 1, 1, 1,
-0.981193, 1.635382, 0.4340367, 1, 1, 1, 1, 1,
-0.9799992, 0.02216065, -2.13873, 1, 1, 1, 1, 1,
-0.970973, -0.2967351, -1.468795, 1, 1, 1, 1, 1,
-0.9698757, 0.3180977, -0.4506521, 0, 0, 1, 1, 1,
-0.9520513, -2.125289, -1.663983, 1, 0, 0, 1, 1,
-0.9473296, 0.2020009, -1.730945, 1, 0, 0, 1, 1,
-0.942022, -0.08310937, -1.095088, 1, 0, 0, 1, 1,
-0.9407516, -0.646935, -2.709151, 1, 0, 0, 1, 1,
-0.9387828, -0.1449531, 0.885097, 1, 0, 0, 1, 1,
-0.938527, 0.4120599, 0.1858774, 0, 0, 0, 1, 1,
-0.9342368, 0.6170607, 0.1183001, 0, 0, 0, 1, 1,
-0.9329382, 0.6758054, -2.123641, 0, 0, 0, 1, 1,
-0.9307143, -0.1134426, -3.339695, 0, 0, 0, 1, 1,
-0.9294214, -0.1739861, 0.4832913, 0, 0, 0, 1, 1,
-0.9253916, -0.3451429, -1.625718, 0, 0, 0, 1, 1,
-0.9237275, -0.4281596, -2.535203, 0, 0, 0, 1, 1,
-0.9210603, -0.5826125, -2.552649, 1, 1, 1, 1, 1,
-0.9184109, -0.6806145, -1.692023, 1, 1, 1, 1, 1,
-0.9104852, 0.5267745, -2.449927, 1, 1, 1, 1, 1,
-0.907461, 0.4513631, -1.164245, 1, 1, 1, 1, 1,
-0.9042877, -0.4726647, -2.405022, 1, 1, 1, 1, 1,
-0.9014246, 1.114229, -1.174483, 1, 1, 1, 1, 1,
-0.901122, -0.4097549, -0.07149591, 1, 1, 1, 1, 1,
-0.9002354, -0.5033885, -1.874928, 1, 1, 1, 1, 1,
-0.8996429, 0.7715012, -1.253831, 1, 1, 1, 1, 1,
-0.8982196, -1.523935, -3.086799, 1, 1, 1, 1, 1,
-0.8944226, -0.7965715, -3.656341, 1, 1, 1, 1, 1,
-0.8881574, -0.2964297, -2.321101, 1, 1, 1, 1, 1,
-0.8837767, -1.959231, -1.335149, 1, 1, 1, 1, 1,
-0.8835919, 2.553656, -0.05162935, 1, 1, 1, 1, 1,
-0.8831924, 0.6578249, 0.06113939, 1, 1, 1, 1, 1,
-0.8830938, -2.358313, -3.195247, 0, 0, 1, 1, 1,
-0.8815671, 0.434547, -0.04415165, 1, 0, 0, 1, 1,
-0.8792844, -2.038918, -1.682337, 1, 0, 0, 1, 1,
-0.8766803, 0.4808258, -0.7279075, 1, 0, 0, 1, 1,
-0.8704848, -0.4070214, -2.307507, 1, 0, 0, 1, 1,
-0.8671542, 0.6117261, -2.558922, 1, 0, 0, 1, 1,
-0.8657506, 0.3048108, -1.010147, 0, 0, 0, 1, 1,
-0.8629728, -0.6497166, -0.9165782, 0, 0, 0, 1, 1,
-0.860536, 0.3441381, 0.02797213, 0, 0, 0, 1, 1,
-0.8572069, -0.7161365, -2.040878, 0, 0, 0, 1, 1,
-0.8431717, 1.29624, -2.914509, 0, 0, 0, 1, 1,
-0.8429624, -1.033412, -2.222358, 0, 0, 0, 1, 1,
-0.8410038, 0.08156007, -2.469161, 0, 0, 0, 1, 1,
-0.8396031, -0.3880191, -2.55377, 1, 1, 1, 1, 1,
-0.8389586, -0.7010572, -2.250958, 1, 1, 1, 1, 1,
-0.8346248, 0.2634052, -0.616942, 1, 1, 1, 1, 1,
-0.829228, -0.4531758, -2.704676, 1, 1, 1, 1, 1,
-0.8197532, 0.3771697, -2.025086, 1, 1, 1, 1, 1,
-0.8177917, 0.5594755, 0.2161027, 1, 1, 1, 1, 1,
-0.8092854, 0.3949341, -3.019032, 1, 1, 1, 1, 1,
-0.8065792, 1.36732, -1.241339, 1, 1, 1, 1, 1,
-0.8027579, -0.6505424, -2.086443, 1, 1, 1, 1, 1,
-0.7960719, -0.4154441, -2.831501, 1, 1, 1, 1, 1,
-0.7939631, -0.4638363, -4.569122, 1, 1, 1, 1, 1,
-0.784077, -0.3287039, -1.309219, 1, 1, 1, 1, 1,
-0.782595, 1.031298, -0.3664997, 1, 1, 1, 1, 1,
-0.7808015, 2.218735, 1.508833, 1, 1, 1, 1, 1,
-0.7766597, -0.2509052, -1.345776, 1, 1, 1, 1, 1,
-0.7766201, 2.069874, -1.136553, 0, 0, 1, 1, 1,
-0.7719911, 1.04441, 0.09482402, 1, 0, 0, 1, 1,
-0.7701645, 0.7897322, 0.4194816, 1, 0, 0, 1, 1,
-0.7663397, -0.2486421, -2.280736, 1, 0, 0, 1, 1,
-0.7638983, -2.024071, -2.227078, 1, 0, 0, 1, 1,
-0.7556924, 0.4867923, -0.2005554, 1, 0, 0, 1, 1,
-0.7449691, -0.1161478, -1.592476, 0, 0, 0, 1, 1,
-0.7445335, -0.8134322, -1.1405, 0, 0, 0, 1, 1,
-0.7423182, -0.7660955, -1.063831, 0, 0, 0, 1, 1,
-0.7416849, -0.1043983, -2.868483, 0, 0, 0, 1, 1,
-0.7405226, -1.162107, -3.437793, 0, 0, 0, 1, 1,
-0.7357993, 0.3253326, -0.9349954, 0, 0, 0, 1, 1,
-0.7352874, 0.9109503, -1.368816, 0, 0, 0, 1, 1,
-0.7291456, 1.515035, -1.210259, 1, 1, 1, 1, 1,
-0.7275777, 1.133994, 0.07465495, 1, 1, 1, 1, 1,
-0.7256199, -0.2054201, -1.945926, 1, 1, 1, 1, 1,
-0.7233002, 0.5290546, -0.4806488, 1, 1, 1, 1, 1,
-0.7089961, -1.302099, -2.065292, 1, 1, 1, 1, 1,
-0.7045101, -0.2768691, -0.5014858, 1, 1, 1, 1, 1,
-0.7033947, -1.574011, -3.827843, 1, 1, 1, 1, 1,
-0.7030311, 1.412515, 1.397038, 1, 1, 1, 1, 1,
-0.7000801, -0.2058463, -1.524113, 1, 1, 1, 1, 1,
-0.6986961, 0.6141356, -0.9066775, 1, 1, 1, 1, 1,
-0.6967316, 0.4320257, -0.6501278, 1, 1, 1, 1, 1,
-0.695923, 0.404179, -0.8223634, 1, 1, 1, 1, 1,
-0.6937381, 0.02038077, -1.041577, 1, 1, 1, 1, 1,
-0.6918934, -0.1972523, -3.553326, 1, 1, 1, 1, 1,
-0.6900737, -1.067549, -3.084239, 1, 1, 1, 1, 1,
-0.6879308, 1.771616, 0.2375218, 0, 0, 1, 1, 1,
-0.6876283, 1.283612, -1.024372, 1, 0, 0, 1, 1,
-0.6872441, 1.47707, -0.2099703, 1, 0, 0, 1, 1,
-0.6862696, 1.43624, -0.2332828, 1, 0, 0, 1, 1,
-0.6862679, -2.083076, -2.722203, 1, 0, 0, 1, 1,
-0.6836575, 0.4980475, -1.804353, 1, 0, 0, 1, 1,
-0.6793786, -1.341679, -2.536519, 0, 0, 0, 1, 1,
-0.6791674, -0.9884164, -2.973083, 0, 0, 0, 1, 1,
-0.6704369, -0.2725638, -2.894032, 0, 0, 0, 1, 1,
-0.6695718, 0.5543537, 1.272944, 0, 0, 0, 1, 1,
-0.6681514, -1.27738, -3.664181, 0, 0, 0, 1, 1,
-0.6672423, 0.3742294, -1.836513, 0, 0, 0, 1, 1,
-0.6605092, -1.657544, -1.123681, 0, 0, 0, 1, 1,
-0.6590328, -0.501182, -2.82142, 1, 1, 1, 1, 1,
-0.6580518, 0.8342123, 0.5425928, 1, 1, 1, 1, 1,
-0.6575453, -0.242531, -2.194501, 1, 1, 1, 1, 1,
-0.6554781, 0.6150962, -0.5689294, 1, 1, 1, 1, 1,
-0.6540696, 0.9892183, -0.4351636, 1, 1, 1, 1, 1,
-0.6533802, -0.7525505, -1.912336, 1, 1, 1, 1, 1,
-0.652259, 0.4320771, -1.809518, 1, 1, 1, 1, 1,
-0.6508586, 0.8034804, -0.8629187, 1, 1, 1, 1, 1,
-0.6503327, 0.3807679, -1.494572, 1, 1, 1, 1, 1,
-0.6491978, -0.7754177, -4.306961, 1, 1, 1, 1, 1,
-0.6488147, -2.491587, -1.042925, 1, 1, 1, 1, 1,
-0.6474056, -0.7898348, -2.041685, 1, 1, 1, 1, 1,
-0.6432638, 0.7773154, 0.7022671, 1, 1, 1, 1, 1,
-0.6431878, -0.8045431, -2.750247, 1, 1, 1, 1, 1,
-0.6386949, -2.218243, -2.69011, 1, 1, 1, 1, 1,
-0.627826, -0.6662068, -4.638677, 0, 0, 1, 1, 1,
-0.6276535, 0.01759745, -0.5403129, 1, 0, 0, 1, 1,
-0.6216603, -0.7431716, -3.766025, 1, 0, 0, 1, 1,
-0.6212018, -0.05696481, -2.360812, 1, 0, 0, 1, 1,
-0.6200116, 1.409563, -1.299077, 1, 0, 0, 1, 1,
-0.5991646, 1.824383, -0.6045479, 1, 0, 0, 1, 1,
-0.5986609, 0.5315267, -2.106814, 0, 0, 0, 1, 1,
-0.597049, -0.1481519, -1.295966, 0, 0, 0, 1, 1,
-0.5924109, -0.4045912, -3.758665, 0, 0, 0, 1, 1,
-0.5908012, 1.74732, -0.5129067, 0, 0, 0, 1, 1,
-0.5884344, -1.598567, -5.357647, 0, 0, 0, 1, 1,
-0.5878707, -0.2882235, -1.972883, 0, 0, 0, 1, 1,
-0.5864044, -0.3001688, -1.668735, 0, 0, 0, 1, 1,
-0.5835471, -0.2209977, -2.49407, 1, 1, 1, 1, 1,
-0.581792, 1.464239, -1.272786, 1, 1, 1, 1, 1,
-0.5797736, 0.6644435, -0.6172118, 1, 1, 1, 1, 1,
-0.5731693, -0.6270722, -0.9387196, 1, 1, 1, 1, 1,
-0.570146, -0.1674284, -1.518497, 1, 1, 1, 1, 1,
-0.5646566, 1.670264, 0.1072932, 1, 1, 1, 1, 1,
-0.5608392, 1.055197, -1.349377, 1, 1, 1, 1, 1,
-0.5600475, -0.4878194, -3.603424, 1, 1, 1, 1, 1,
-0.5568585, -1.107536, -2.046228, 1, 1, 1, 1, 1,
-0.5564923, -0.9340988, -2.491957, 1, 1, 1, 1, 1,
-0.5557469, 0.4116141, -0.4766014, 1, 1, 1, 1, 1,
-0.5550984, -0.06848861, -2.907683, 1, 1, 1, 1, 1,
-0.5495182, 0.3272213, -0.7859641, 1, 1, 1, 1, 1,
-0.5488045, 1.003623, 0.9007863, 1, 1, 1, 1, 1,
-0.5413601, -0.6380205, -3.482826, 1, 1, 1, 1, 1,
-0.5353996, 0.1759272, -1.190975, 0, 0, 1, 1, 1,
-0.5321891, -0.6864592, -2.571291, 1, 0, 0, 1, 1,
-0.5321881, 0.2163756, -2.195219, 1, 0, 0, 1, 1,
-0.5269531, 1.298113, 0.3143044, 1, 0, 0, 1, 1,
-0.5175364, -0.9151718, -3.47989, 1, 0, 0, 1, 1,
-0.517179, -0.6083477, -2.00265, 1, 0, 0, 1, 1,
-0.5135025, -1.333762, -1.605823, 0, 0, 0, 1, 1,
-0.5117182, -1.246934, -0.8997007, 0, 0, 0, 1, 1,
-0.5090455, 0.1084154, -1.024456, 0, 0, 0, 1, 1,
-0.5063088, 0.09937041, -2.282724, 0, 0, 0, 1, 1,
-0.5018944, -0.3169318, -2.642559, 0, 0, 0, 1, 1,
-0.5012074, -0.1733067, -1.195009, 0, 0, 0, 1, 1,
-0.5005606, 0.4227629, -1.334445, 0, 0, 0, 1, 1,
-0.4976479, -0.8246546, -2.130892, 1, 1, 1, 1, 1,
-0.4953347, 1.252399, -0.7406145, 1, 1, 1, 1, 1,
-0.4909566, -0.1942488, -1.267304, 1, 1, 1, 1, 1,
-0.478817, -0.04282912, -0.04512845, 1, 1, 1, 1, 1,
-0.4763925, 0.2175734, -1.397014, 1, 1, 1, 1, 1,
-0.4726232, 0.2342926, -1.754677, 1, 1, 1, 1, 1,
-0.4669172, 1.328925, -1.246049, 1, 1, 1, 1, 1,
-0.4533716, -0.04313083, -2.013008, 1, 1, 1, 1, 1,
-0.4519593, -0.8941584, -2.215165, 1, 1, 1, 1, 1,
-0.4485798, 1.135795, -0.9344133, 1, 1, 1, 1, 1,
-0.4480928, 0.9591696, 0.808886, 1, 1, 1, 1, 1,
-0.4439903, 1.932613, 0.7747728, 1, 1, 1, 1, 1,
-0.4435336, -0.1272124, -2.230056, 1, 1, 1, 1, 1,
-0.4420198, 0.3419498, 0.0771627, 1, 1, 1, 1, 1,
-0.440701, -1.138715, -1.480724, 1, 1, 1, 1, 1,
-0.4319933, 1.473336, 1.439084, 0, 0, 1, 1, 1,
-0.431627, -0.1795074, -2.69854, 1, 0, 0, 1, 1,
-0.4311875, 1.227826, -0.8623061, 1, 0, 0, 1, 1,
-0.4281828, 1.278859, -1.954594, 1, 0, 0, 1, 1,
-0.4261106, 0.6361714, -1.870075, 1, 0, 0, 1, 1,
-0.4208943, 0.8739598, 1.484279, 1, 0, 0, 1, 1,
-0.4202628, -0.8250487, -4.633289, 0, 0, 0, 1, 1,
-0.4140964, 0.7021889, -0.05772481, 0, 0, 0, 1, 1,
-0.4132476, 0.1361419, -1.274334, 0, 0, 0, 1, 1,
-0.4086573, -0.02038158, -2.362025, 0, 0, 0, 1, 1,
-0.3849941, -0.2029743, -0.2907201, 0, 0, 0, 1, 1,
-0.383367, 0.2885568, -0.4868553, 0, 0, 0, 1, 1,
-0.3813339, -0.4042032, -1.824956, 0, 0, 0, 1, 1,
-0.3780421, 0.5442395, -1.713315, 1, 1, 1, 1, 1,
-0.366238, 1.134923, -0.525053, 1, 1, 1, 1, 1,
-0.3660271, 2.351635, -0.9942536, 1, 1, 1, 1, 1,
-0.3639103, -0.6822647, -3.120295, 1, 1, 1, 1, 1,
-0.3612173, 0.2822638, 0.5265687, 1, 1, 1, 1, 1,
-0.3574032, -1.360507, -2.894555, 1, 1, 1, 1, 1,
-0.3501076, 0.3431101, -0.2502579, 1, 1, 1, 1, 1,
-0.3425601, -1.426947, -4.184384, 1, 1, 1, 1, 1,
-0.3421997, -1.03098, -3.854486, 1, 1, 1, 1, 1,
-0.3416224, -0.479258, -2.512975, 1, 1, 1, 1, 1,
-0.3330255, -0.3174113, -3.24499, 1, 1, 1, 1, 1,
-0.3325717, 0.2752419, -1.985695, 1, 1, 1, 1, 1,
-0.3282124, 1.530933, -1.274948, 1, 1, 1, 1, 1,
-0.3241353, -0.9944024, -3.183429, 1, 1, 1, 1, 1,
-0.3177719, -0.88528, -2.767481, 1, 1, 1, 1, 1,
-0.3024968, -1.447127, -4.057648, 0, 0, 1, 1, 1,
-0.3023303, -0.5673084, -3.112441, 1, 0, 0, 1, 1,
-0.3018476, 0.06357189, -1.179999, 1, 0, 0, 1, 1,
-0.300408, -1.622997, -3.642781, 1, 0, 0, 1, 1,
-0.2994562, 0.09995972, -1.025275, 1, 0, 0, 1, 1,
-0.2967871, 1.244426, -0.5776598, 1, 0, 0, 1, 1,
-0.2966758, 0.368518, -0.9507532, 0, 0, 0, 1, 1,
-0.2956098, -1.639584, -1.658882, 0, 0, 0, 1, 1,
-0.2948308, 0.6576412, 0.964128, 0, 0, 0, 1, 1,
-0.2930483, 1.229703, -1.224483, 0, 0, 0, 1, 1,
-0.2929894, 0.5339646, 1.161083, 0, 0, 0, 1, 1,
-0.2881132, -1.155838, -5.404113, 0, 0, 0, 1, 1,
-0.2864745, 0.3544541, -0.4222578, 0, 0, 0, 1, 1,
-0.2837242, -0.6188411, -2.953, 1, 1, 1, 1, 1,
-0.283429, -0.02880869, -2.662501, 1, 1, 1, 1, 1,
-0.2827336, -0.8267601, -1.737603, 1, 1, 1, 1, 1,
-0.2798682, -0.07268159, -2.581117, 1, 1, 1, 1, 1,
-0.279021, -1.195041, -2.24267, 1, 1, 1, 1, 1,
-0.2784477, -0.5286636, -3.090251, 1, 1, 1, 1, 1,
-0.2783336, -1.672588, -3.312345, 1, 1, 1, 1, 1,
-0.2746621, 0.1394177, -1.830238, 1, 1, 1, 1, 1,
-0.274542, -0.4278034, -3.477649, 1, 1, 1, 1, 1,
-0.2711148, 0.705332, -0.859621, 1, 1, 1, 1, 1,
-0.2656123, -0.2408767, -1.879392, 1, 1, 1, 1, 1,
-0.2636922, 1.51126, -0.3970195, 1, 1, 1, 1, 1,
-0.2626838, -0.3946486, -2.125152, 1, 1, 1, 1, 1,
-0.261085, 0.3051242, -1.126528, 1, 1, 1, 1, 1,
-0.2590647, -2.632541, -2.265542, 1, 1, 1, 1, 1,
-0.2571476, -0.6497581, -1.619209, 0, 0, 1, 1, 1,
-0.2567905, 1.133926, 0.2016219, 1, 0, 0, 1, 1,
-0.2550597, 0.4731366, 0.4537644, 1, 0, 0, 1, 1,
-0.2547091, 0.6536323, -0.7339302, 1, 0, 0, 1, 1,
-0.2541069, 0.8326223, -0.5770487, 1, 0, 0, 1, 1,
-0.252482, -0.2025333, -1.483111, 1, 0, 0, 1, 1,
-0.2477912, -0.3823396, -3.206444, 0, 0, 0, 1, 1,
-0.2464545, 1.503468, 0.4421159, 0, 0, 0, 1, 1,
-0.240205, -0.1897695, 0.4162945, 0, 0, 0, 1, 1,
-0.2382099, 0.1737633, 0.4878421, 0, 0, 0, 1, 1,
-0.2354729, -0.2471404, -5.109056, 0, 0, 0, 1, 1,
-0.2350817, 1.118826, -1.816232, 0, 0, 0, 1, 1,
-0.2287616, -0.2289894, -2.362311, 0, 0, 0, 1, 1,
-0.2276264, -0.00558891, -1.696129, 1, 1, 1, 1, 1,
-0.2273041, -0.9949132, -4.496865, 1, 1, 1, 1, 1,
-0.2255, 1.47054, 0.04097114, 1, 1, 1, 1, 1,
-0.2223029, -0.04778672, -0.2288305, 1, 1, 1, 1, 1,
-0.2109791, 2.572008, 0.02838261, 1, 1, 1, 1, 1,
-0.208593, -0.1040609, -2.859015, 1, 1, 1, 1, 1,
-0.2078319, -0.255222, -1.318757, 1, 1, 1, 1, 1,
-0.2028188, 1.037477, -0.705773, 1, 1, 1, 1, 1,
-0.20251, -1.613483, -1.883832, 1, 1, 1, 1, 1,
-0.2008964, 0.4329252, 0.4341982, 1, 1, 1, 1, 1,
-0.1999375, 0.8269529, -1.199089, 1, 1, 1, 1, 1,
-0.1993018, -1.562561, -4.511413, 1, 1, 1, 1, 1,
-0.1986256, -0.9846023, -1.931827, 1, 1, 1, 1, 1,
-0.1973308, -0.8758817, -2.117612, 1, 1, 1, 1, 1,
-0.1954801, 0.5173075, -0.7111979, 1, 1, 1, 1, 1,
-0.1951652, -1.162835, -1.578181, 0, 0, 1, 1, 1,
-0.1916549, -0.2175231, -2.502839, 1, 0, 0, 1, 1,
-0.1905615, -0.4939083, -2.945625, 1, 0, 0, 1, 1,
-0.1860762, 0.9983305, 0.1130717, 1, 0, 0, 1, 1,
-0.1835398, -1.321083, -2.212747, 1, 0, 0, 1, 1,
-0.1768751, -0.7072495, -4.226578, 1, 0, 0, 1, 1,
-0.1712577, -0.8485355, -1.933948, 0, 0, 0, 1, 1,
-0.170837, 1.100852, 0.8370344, 0, 0, 0, 1, 1,
-0.1670362, 1.141943, -0.3989761, 0, 0, 0, 1, 1,
-0.1642097, 0.4244106, -1.070812, 0, 0, 0, 1, 1,
-0.1546142, 0.9997381, -0.8522435, 0, 0, 0, 1, 1,
-0.1521208, -1.16295, -4.042045, 0, 0, 0, 1, 1,
-0.1491218, 1.65892, -0.940932, 0, 0, 0, 1, 1,
-0.1482324, 0.2082024, 0.2690549, 1, 1, 1, 1, 1,
-0.1453762, 0.1592465, 0.3188968, 1, 1, 1, 1, 1,
-0.1450161, 0.05108332, -1.387141, 1, 1, 1, 1, 1,
-0.1448034, -0.4324943, -2.128042, 1, 1, 1, 1, 1,
-0.1405126, 0.216051, -2.311621, 1, 1, 1, 1, 1,
-0.1367591, 0.9511763, -0.09738971, 1, 1, 1, 1, 1,
-0.1361176, 1.744861, -0.1223942, 1, 1, 1, 1, 1,
-0.1361115, 1.132427, -0.5704889, 1, 1, 1, 1, 1,
-0.1297959, 0.09980603, -1.128621, 1, 1, 1, 1, 1,
-0.1211164, 0.3570771, -0.7973254, 1, 1, 1, 1, 1,
-0.1205615, -0.1361107, -1.563741, 1, 1, 1, 1, 1,
-0.1192785, -0.8454647, -2.745665, 1, 1, 1, 1, 1,
-0.1178134, 0.4958349, 1.390529, 1, 1, 1, 1, 1,
-0.1165255, 0.6256955, -0.9480027, 1, 1, 1, 1, 1,
-0.1148373, -1.150631, -2.410919, 1, 1, 1, 1, 1,
-0.1140862, 0.5444995, -1.024866, 0, 0, 1, 1, 1,
-0.1134691, -0.614938, -3.398, 1, 0, 0, 1, 1,
-0.1105827, 1.685785, 0.1858024, 1, 0, 0, 1, 1,
-0.1092698, 1.580014, 0.717724, 1, 0, 0, 1, 1,
-0.1045253, -0.2017835, -1.255985, 1, 0, 0, 1, 1,
-0.0991729, -0.3897697, -3.925767, 1, 0, 0, 1, 1,
-0.09445635, -0.02830174, -1.243181, 0, 0, 0, 1, 1,
-0.08414534, 1.311131, 0.7897171, 0, 0, 0, 1, 1,
-0.08361354, -0.25399, -2.244102, 0, 0, 0, 1, 1,
-0.08248465, 1.416296, 0.1622755, 0, 0, 0, 1, 1,
-0.0802796, -0.1659599, -4.457024, 0, 0, 0, 1, 1,
-0.0783065, -0.43826, -1.147086, 0, 0, 0, 1, 1,
-0.07336285, 0.5314349, 0.3139925, 0, 0, 0, 1, 1,
-0.07076169, 0.5352549, 0.2382259, 1, 1, 1, 1, 1,
-0.06889584, -1.067609, -2.445747, 1, 1, 1, 1, 1,
-0.06733818, -1.238753, -2.104083, 1, 1, 1, 1, 1,
-0.06246688, 1.060623, -0.2386791, 1, 1, 1, 1, 1,
-0.06053677, -0.7100108, -0.930163, 1, 1, 1, 1, 1,
-0.05532819, -1.99745, -4.740269, 1, 1, 1, 1, 1,
-0.05326801, -1.946262, -3.482427, 1, 1, 1, 1, 1,
-0.05097746, -0.5529189, -3.135396, 1, 1, 1, 1, 1,
-0.04901254, -0.3386002, -2.297991, 1, 1, 1, 1, 1,
-0.04738129, 0.416295, -0.7942395, 1, 1, 1, 1, 1,
-0.04680661, -0.873216, -0.9616196, 1, 1, 1, 1, 1,
-0.04534468, 0.5957647, 1.746787, 1, 1, 1, 1, 1,
-0.04157993, -1.845377, -3.159366, 1, 1, 1, 1, 1,
-0.04054202, -0.4794564, -4.016662, 1, 1, 1, 1, 1,
-0.03826649, 0.3049045, 0.6839619, 1, 1, 1, 1, 1,
-0.03766726, 0.0235766, -1.947313, 0, 0, 1, 1, 1,
-0.03590882, -1.027305, -3.81399, 1, 0, 0, 1, 1,
-0.03504368, -0.2030458, -3.919104, 1, 0, 0, 1, 1,
-0.03362015, 0.6272979, -0.8542001, 1, 0, 0, 1, 1,
-0.02940998, -0.1680071, -4.452281, 1, 0, 0, 1, 1,
-0.0278957, 0.6540363, -0.3727127, 1, 0, 0, 1, 1,
-0.02765208, 0.1339055, 0.3441077, 0, 0, 0, 1, 1,
-0.02150634, -0.3748866, -6.110351, 0, 0, 0, 1, 1,
-0.01567048, 0.7118143, 0.7217816, 0, 0, 0, 1, 1,
-0.01442804, 0.4711833, -1.183615, 0, 0, 0, 1, 1,
-0.01315699, 0.6198685, -0.1589787, 0, 0, 0, 1, 1,
-0.01259124, -0.163122, -3.96977, 0, 0, 0, 1, 1,
-0.007356253, 1.376355, -0.02886327, 0, 0, 0, 1, 1,
-0.00720809, -1.697028, -1.617842, 1, 1, 1, 1, 1,
-0.006501823, -1.170962, -1.808874, 1, 1, 1, 1, 1,
-0.002192313, 0.2892567, -0.04745747, 1, 1, 1, 1, 1,
0.0009353682, 0.7878915, 0.4660447, 1, 1, 1, 1, 1,
0.002603675, -0.4220635, 4.862602, 1, 1, 1, 1, 1,
0.003219387, 0.0278077, -0.9819121, 1, 1, 1, 1, 1,
0.004610662, -0.6635544, 3.376061, 1, 1, 1, 1, 1,
0.00676218, -0.4140167, 3.032914, 1, 1, 1, 1, 1,
0.006836113, -0.2141692, 1.920613, 1, 1, 1, 1, 1,
0.008931285, -0.2641832, 2.821037, 1, 1, 1, 1, 1,
0.009806789, 0.7998173, 0.3057376, 1, 1, 1, 1, 1,
0.01134147, 0.3920998, -0.2440827, 1, 1, 1, 1, 1,
0.02165217, 0.5260881, -0.9165232, 1, 1, 1, 1, 1,
0.03021267, -0.9296688, 3.254821, 1, 1, 1, 1, 1,
0.03371516, -0.5279936, 1.752388, 1, 1, 1, 1, 1,
0.03586393, -0.3152181, 3.416203, 0, 0, 1, 1, 1,
0.0434115, -0.7738343, 4.45067, 1, 0, 0, 1, 1,
0.04504943, -0.3343199, 1.126467, 1, 0, 0, 1, 1,
0.04937793, 1.486194, -0.4882853, 1, 0, 0, 1, 1,
0.05103734, 1.093425, -0.964723, 1, 0, 0, 1, 1,
0.05367893, -1.183992, 4.186937, 1, 0, 0, 1, 1,
0.0605355, -0.05892537, 1.294377, 0, 0, 0, 1, 1,
0.06116422, 1.247046, -0.3631525, 0, 0, 0, 1, 1,
0.06252617, -0.09828043, 3.172034, 0, 0, 0, 1, 1,
0.06470797, 0.9740779, 0.3308191, 0, 0, 0, 1, 1,
0.06473263, -1.337662, 1.9103, 0, 0, 0, 1, 1,
0.06511762, -2.345579, 4.990932, 0, 0, 0, 1, 1,
0.06700001, 0.6946211, -0.9093851, 0, 0, 0, 1, 1,
0.0676059, 0.7041087, -2.829807, 1, 1, 1, 1, 1,
0.07050353, -0.5097268, 1.965368, 1, 1, 1, 1, 1,
0.07361788, -0.5789306, 3.03884, 1, 1, 1, 1, 1,
0.07450664, 0.02707042, 0.8347992, 1, 1, 1, 1, 1,
0.07599591, -1.99694, 4.422559, 1, 1, 1, 1, 1,
0.07770856, 0.3606467, 0.6085742, 1, 1, 1, 1, 1,
0.08255367, 0.6985778, 1.165707, 1, 1, 1, 1, 1,
0.08949246, 0.004289751, 2.451593, 1, 1, 1, 1, 1,
0.09038519, 1.319913, 0.1276941, 1, 1, 1, 1, 1,
0.09314552, 1.779974, -1.798706, 1, 1, 1, 1, 1,
0.09495831, -0.6358653, 1.921688, 1, 1, 1, 1, 1,
0.09997355, -1.020363, 5.318854, 1, 1, 1, 1, 1,
0.1042186, -0.4911788, 4.362815, 1, 1, 1, 1, 1,
0.1057438, -0.6388959, 2.838208, 1, 1, 1, 1, 1,
0.108011, 1.666079, 1.586249, 1, 1, 1, 1, 1,
0.1087451, -0.2117216, 1.895028, 0, 0, 1, 1, 1,
0.1127754, -1.315261, 3.868775, 1, 0, 0, 1, 1,
0.1145076, 0.6915309, -0.4673882, 1, 0, 0, 1, 1,
0.1149747, -1.582103, 2.63783, 1, 0, 0, 1, 1,
0.1156784, -0.404116, 2.299361, 1, 0, 0, 1, 1,
0.1162235, -0.8126178, 3.475763, 1, 0, 0, 1, 1,
0.1193247, 0.4216666, 0.02554984, 0, 0, 0, 1, 1,
0.1322036, 0.2502188, 0.002597693, 0, 0, 0, 1, 1,
0.1354976, -0.05064444, 3.632014, 0, 0, 0, 1, 1,
0.1383817, -1.020777, 4.206342, 0, 0, 0, 1, 1,
0.1430239, -0.5508106, 5.338282, 0, 0, 0, 1, 1,
0.1433369, -0.3251449, 2.611104, 0, 0, 0, 1, 1,
0.1469672, -0.2263038, 1.08652, 0, 0, 0, 1, 1,
0.1486373, -0.4443496, 2.476317, 1, 1, 1, 1, 1,
0.1489076, 0.7373467, -1.184554, 1, 1, 1, 1, 1,
0.1491644, 2.478013, 2.291965, 1, 1, 1, 1, 1,
0.150426, -1.290648, 2.251525, 1, 1, 1, 1, 1,
0.1505068, -0.5960467, 2.285937, 1, 1, 1, 1, 1,
0.152821, -0.3945611, 4.103047, 1, 1, 1, 1, 1,
0.1538517, 0.4552875, 0.3826506, 1, 1, 1, 1, 1,
0.1542219, 0.2594587, 1.209489, 1, 1, 1, 1, 1,
0.1595277, -1.031902, 3.511349, 1, 1, 1, 1, 1,
0.1632158, 0.04452924, 1.654562, 1, 1, 1, 1, 1,
0.168103, 1.596518, -0.2808599, 1, 1, 1, 1, 1,
0.169255, -0.7427797, 4.402789, 1, 1, 1, 1, 1,
0.1730136, 1.58168, -1.085855, 1, 1, 1, 1, 1,
0.1809068, 1.484173, -0.9235485, 1, 1, 1, 1, 1,
0.1862961, -0.5472903, 3.71234, 1, 1, 1, 1, 1,
0.1871232, 2.203926, -0.8917463, 0, 0, 1, 1, 1,
0.1891133, 0.1045208, 0.5009007, 1, 0, 0, 1, 1,
0.1899271, 0.04560732, 1.910406, 1, 0, 0, 1, 1,
0.1904848, 0.4729997, 0.8546665, 1, 0, 0, 1, 1,
0.1917684, 0.7421584, 0.1034055, 1, 0, 0, 1, 1,
0.1928969, 1.128854, -0.07893524, 1, 0, 0, 1, 1,
0.1950662, 0.6551031, 1.082742, 0, 0, 0, 1, 1,
0.1981849, -0.1718884, 1.028571, 0, 0, 0, 1, 1,
0.1989591, -0.8769753, 2.951144, 0, 0, 0, 1, 1,
0.2058412, -0.2993758, 1.701508, 0, 0, 0, 1, 1,
0.2148356, -0.3294712, 2.460475, 0, 0, 0, 1, 1,
0.2151264, -1.184206, 2.679642, 0, 0, 0, 1, 1,
0.2174573, 0.3715994, -0.8439272, 0, 0, 0, 1, 1,
0.2180481, -0.3743337, 1.140177, 1, 1, 1, 1, 1,
0.2198144, -1.86592, 2.413335, 1, 1, 1, 1, 1,
0.2205292, -0.4516031, 2.604147, 1, 1, 1, 1, 1,
0.2209965, -1.874293, 4.246779, 1, 1, 1, 1, 1,
0.2223071, 2.184609, 1.761271, 1, 1, 1, 1, 1,
0.2228352, -0.7151499, 1.44593, 1, 1, 1, 1, 1,
0.232023, 1.1989, -0.6645706, 1, 1, 1, 1, 1,
0.2321712, -2.395738, 1.255156, 1, 1, 1, 1, 1,
0.2384925, -0.1872482, -0.2028915, 1, 1, 1, 1, 1,
0.2386153, -0.4635644, 2.961954, 1, 1, 1, 1, 1,
0.2433873, 0.2795148, 0.05958436, 1, 1, 1, 1, 1,
0.2443279, 0.3605153, 0.1799686, 1, 1, 1, 1, 1,
0.246844, -0.6344312, 2.32203, 1, 1, 1, 1, 1,
0.2511734, -0.3158558, 3.374978, 1, 1, 1, 1, 1,
0.2523752, 0.02181421, 1.730783, 1, 1, 1, 1, 1,
0.2605353, -0.8021685, 1.726527, 0, 0, 1, 1, 1,
0.2648135, -0.009209963, 1.343429, 1, 0, 0, 1, 1,
0.2677511, 1.454663, -0.7306805, 1, 0, 0, 1, 1,
0.2685367, 0.6393595, -1.3147, 1, 0, 0, 1, 1,
0.2689849, 0.6908085, 0.9844897, 1, 0, 0, 1, 1,
0.2713611, 0.2337146, 0.9089279, 1, 0, 0, 1, 1,
0.2729289, 0.5462791, -0.3209672, 0, 0, 0, 1, 1,
0.2735305, -0.6619191, 3.47762, 0, 0, 0, 1, 1,
0.279776, -0.5037014, 3.82796, 0, 0, 0, 1, 1,
0.2813291, 0.1152435, 2.641244, 0, 0, 0, 1, 1,
0.2879149, 0.7628109, -0.9401214, 0, 0, 0, 1, 1,
0.2899312, 0.003816829, 1.194874, 0, 0, 0, 1, 1,
0.2938889, 0.08571432, 0.2098749, 0, 0, 0, 1, 1,
0.2952196, 0.3405352, 1.010736, 1, 1, 1, 1, 1,
0.2953996, 1.807426, -1.445069, 1, 1, 1, 1, 1,
0.2965524, 0.3653801, 0.7005247, 1, 1, 1, 1, 1,
0.3001373, 0.3533142, 1.348255, 1, 1, 1, 1, 1,
0.301648, -0.004018781, 1.895042, 1, 1, 1, 1, 1,
0.3056784, -2.309414, 4.879745, 1, 1, 1, 1, 1,
0.3124022, 1.974112, 0.1473737, 1, 1, 1, 1, 1,
0.3128923, 0.4100193, 0.7394882, 1, 1, 1, 1, 1,
0.3177647, 0.8052231, 3.215049, 1, 1, 1, 1, 1,
0.3184743, -0.2027956, 1.538296, 1, 1, 1, 1, 1,
0.3200643, 1.870775, 0.1808708, 1, 1, 1, 1, 1,
0.3225775, 0.5095783, 1.098945, 1, 1, 1, 1, 1,
0.3234266, -1.423575, 1.455824, 1, 1, 1, 1, 1,
0.3278158, -0.2213832, 1.274909, 1, 1, 1, 1, 1,
0.3291467, 1.075383, 0.0040493, 1, 1, 1, 1, 1,
0.3297911, -1.232358, 1.726452, 0, 0, 1, 1, 1,
0.3315254, -0.2903333, 1.644385, 1, 0, 0, 1, 1,
0.3332791, -0.6760601, 3.65667, 1, 0, 0, 1, 1,
0.3340727, 1.090771, -0.1694002, 1, 0, 0, 1, 1,
0.3380095, -0.002581479, 0.2503725, 1, 0, 0, 1, 1,
0.3400526, 0.04417983, 1.443046, 1, 0, 0, 1, 1,
0.3424151, 0.06292529, 0.3471149, 0, 0, 0, 1, 1,
0.3432447, 1.461834, 0.4480088, 0, 0, 0, 1, 1,
0.3482665, 0.03429643, -0.6042152, 0, 0, 0, 1, 1,
0.3484652, -1.28159, 3.479495, 0, 0, 0, 1, 1,
0.3539341, 0.2331343, 1.228382, 0, 0, 0, 1, 1,
0.3605227, 0.567926, 3.762264, 0, 0, 0, 1, 1,
0.3609532, -1.178066, 2.606908, 0, 0, 0, 1, 1,
0.3624082, 0.6243818, -0.7240728, 1, 1, 1, 1, 1,
0.3630586, 0.5751647, 0.6687537, 1, 1, 1, 1, 1,
0.3644126, -0.5090164, 2.197283, 1, 1, 1, 1, 1,
0.3706066, 0.3892344, 1.534895, 1, 1, 1, 1, 1,
0.3728004, -1.852903, 2.546043, 1, 1, 1, 1, 1,
0.3766044, 1.394624, -0.2663745, 1, 1, 1, 1, 1,
0.3767813, 1.33217, 0.1236528, 1, 1, 1, 1, 1,
0.3769971, 1.714145, -0.8555384, 1, 1, 1, 1, 1,
0.3783271, 0.7017917, -1.292632, 1, 1, 1, 1, 1,
0.3789656, 0.3925602, -0.2637428, 1, 1, 1, 1, 1,
0.3857124, 0.1439396, 2.335074, 1, 1, 1, 1, 1,
0.3868811, -0.1598344, 1.706231, 1, 1, 1, 1, 1,
0.3907481, 1.074247, 0.9405435, 1, 1, 1, 1, 1,
0.3909692, 0.9783143, 0.02470837, 1, 1, 1, 1, 1,
0.3953633, 0.0334658, 0.9415418, 1, 1, 1, 1, 1,
0.4001406, -0.337543, 2.103879, 0, 0, 1, 1, 1,
0.4012349, 0.3645866, 0.8670101, 1, 0, 0, 1, 1,
0.4015613, -0.6705289, 1.668001, 1, 0, 0, 1, 1,
0.4023186, -0.8840102, 3.69386, 1, 0, 0, 1, 1,
0.4026015, 1.41979, -1.482353, 1, 0, 0, 1, 1,
0.4081663, -2.486699, 3.930701, 1, 0, 0, 1, 1,
0.4083157, 0.1034906, 0.5667441, 0, 0, 0, 1, 1,
0.41038, 0.09204556, 0.3144113, 0, 0, 0, 1, 1,
0.4125015, 0.374999, 2.410202, 0, 0, 0, 1, 1,
0.412728, -0.3113405, 1.058162, 0, 0, 0, 1, 1,
0.417796, 2.223301, 0.9044524, 0, 0, 0, 1, 1,
0.4215413, -1.544891, 2.664342, 0, 0, 0, 1, 1,
0.4231447, 0.7173028, -0.9590886, 0, 0, 0, 1, 1,
0.427058, 0.4106371, 1.073097, 1, 1, 1, 1, 1,
0.4277479, -0.2896912, 1.403334, 1, 1, 1, 1, 1,
0.4322368, 0.8847867, -0.1682871, 1, 1, 1, 1, 1,
0.4339592, 0.5414817, 0.4172433, 1, 1, 1, 1, 1,
0.4350146, 1.44272, 1.089756, 1, 1, 1, 1, 1,
0.4411036, 0.06620641, 0.8333884, 1, 1, 1, 1, 1,
0.441449, -0.4304594, 1.606249, 1, 1, 1, 1, 1,
0.4463567, -1.095818, 3.809587, 1, 1, 1, 1, 1,
0.4474157, -0.8241172, 3.587148, 1, 1, 1, 1, 1,
0.4480939, 0.2399187, -0.4342488, 1, 1, 1, 1, 1,
0.4542405, -1.71647, 3.149896, 1, 1, 1, 1, 1,
0.4575818, 0.3330407, -0.008913441, 1, 1, 1, 1, 1,
0.4606308, -0.1588221, 4.295092, 1, 1, 1, 1, 1,
0.465341, 2.84675, 0.2921055, 1, 1, 1, 1, 1,
0.4663903, -0.9032606, 1.149774, 1, 1, 1, 1, 1,
0.4683494, 1.940819, 0.9321039, 0, 0, 1, 1, 1,
0.4718486, 1.10719, 1.007003, 1, 0, 0, 1, 1,
0.473181, 0.186782, 0.9187865, 1, 0, 0, 1, 1,
0.4787873, -0.4143525, 0.2932071, 1, 0, 0, 1, 1,
0.480474, -3.066377, 3.007097, 1, 0, 0, 1, 1,
0.4840119, -0.1722323, 1.739948, 1, 0, 0, 1, 1,
0.4919955, -0.2792544, 2.369112, 0, 0, 0, 1, 1,
0.4920487, 0.3510705, 1.790117, 0, 0, 0, 1, 1,
0.4948819, -0.5041321, 1.685943, 0, 0, 0, 1, 1,
0.497708, -0.7835515, 1.706834, 0, 0, 0, 1, 1,
0.4992584, -0.3680261, 1.453686, 0, 0, 0, 1, 1,
0.4992958, -1.603319, 3.464927, 0, 0, 0, 1, 1,
0.5048335, 0.5745018, 2.17759, 0, 0, 0, 1, 1,
0.5049075, 0.6096354, 1.687307, 1, 1, 1, 1, 1,
0.5094481, -0.250012, 3.575649, 1, 1, 1, 1, 1,
0.512631, -0.2369633, 2.701221, 1, 1, 1, 1, 1,
0.5143892, 0.4633474, 1.257779, 1, 1, 1, 1, 1,
0.5154391, -1.026111, 2.015639, 1, 1, 1, 1, 1,
0.5212407, 1.2462, -1.362889, 1, 1, 1, 1, 1,
0.5251238, 0.203372, 1.857089, 1, 1, 1, 1, 1,
0.5347796, 0.9140952, -0.05312891, 1, 1, 1, 1, 1,
0.5440823, 0.9671869, 0.818504, 1, 1, 1, 1, 1,
0.5453959, 0.4736308, 0.7173911, 1, 1, 1, 1, 1,
0.5471153, -0.1591238, 2.160535, 1, 1, 1, 1, 1,
0.5479929, 0.02945296, 3.314827, 1, 1, 1, 1, 1,
0.5505946, 1.007143, -0.045799, 1, 1, 1, 1, 1,
0.5508507, -1.705602, 3.124166, 1, 1, 1, 1, 1,
0.5529304, 0.4454991, 0.7393031, 1, 1, 1, 1, 1,
0.5533563, -1.19146, 2.785528, 0, 0, 1, 1, 1,
0.559992, 1.181064, 0.6738405, 1, 0, 0, 1, 1,
0.564068, 0.7395959, -0.3840046, 1, 0, 0, 1, 1,
0.5709181, -1.088725, 3.138582, 1, 0, 0, 1, 1,
0.5727347, -0.8491961, 2.037403, 1, 0, 0, 1, 1,
0.5732045, -0.1519864, 1.746087, 1, 0, 0, 1, 1,
0.5733163, -0.3357685, 1.474347, 0, 0, 0, 1, 1,
0.5737732, 0.216159, 2.040544, 0, 0, 0, 1, 1,
0.5781528, -0.7414955, 2.229162, 0, 0, 0, 1, 1,
0.5833141, 0.2492564, 0.6731184, 0, 0, 0, 1, 1,
0.5842443, 0.1419817, 1.16912, 0, 0, 0, 1, 1,
0.584613, 1.625347, -0.667101, 0, 0, 0, 1, 1,
0.5929527, -0.1238193, 4.961726, 0, 0, 0, 1, 1,
0.5972889, -1.082247, 2.388761, 1, 1, 1, 1, 1,
0.6007316, 1.612064, 0.3514665, 1, 1, 1, 1, 1,
0.6056592, -0.4962747, 1.987983, 1, 1, 1, 1, 1,
0.6067766, 0.1377564, 2.69778, 1, 1, 1, 1, 1,
0.6101602, -2.222412, 1.904896, 1, 1, 1, 1, 1,
0.6113814, -1.253852, 1.752035, 1, 1, 1, 1, 1,
0.6120645, 1.109559, 0.2661865, 1, 1, 1, 1, 1,
0.6142667, 1.389464, 1.76008, 1, 1, 1, 1, 1,
0.6145698, -0.1246437, 2.642927, 1, 1, 1, 1, 1,
0.6160651, -0.8325536, 4.606939, 1, 1, 1, 1, 1,
0.6189393, -0.5290657, 2.992716, 1, 1, 1, 1, 1,
0.6189995, 0.1907001, -0.2210363, 1, 1, 1, 1, 1,
0.6218933, 0.3060059, 0.606086, 1, 1, 1, 1, 1,
0.6266979, -0.5199215, 1.392988, 1, 1, 1, 1, 1,
0.6290084, 1.973599, 3.178672, 1, 1, 1, 1, 1,
0.6327151, -0.5397595, 2.517051, 0, 0, 1, 1, 1,
0.6359349, 1.220292, -0.3382553, 1, 0, 0, 1, 1,
0.63691, -0.4153738, 1.682298, 1, 0, 0, 1, 1,
0.6388093, 0.1782617, -0.4016127, 1, 0, 0, 1, 1,
0.6424413, -1.073784, 2.706083, 1, 0, 0, 1, 1,
0.6427048, -0.7964948, 2.657382, 1, 0, 0, 1, 1,
0.6478179, 0.9845409, 1.801263, 0, 0, 0, 1, 1,
0.6539975, -0.2862621, 0.8874195, 0, 0, 0, 1, 1,
0.6543615, -1.115695, 2.761762, 0, 0, 0, 1, 1,
0.6551662, -1.179883, 2.076733, 0, 0, 0, 1, 1,
0.656857, 0.860311, -0.1971187, 0, 0, 0, 1, 1,
0.6586333, 0.3125618, 1.490617, 0, 0, 0, 1, 1,
0.6612591, -0.08795533, 2.656251, 0, 0, 0, 1, 1,
0.6618838, -1.157279, 1.546429, 1, 1, 1, 1, 1,
0.6666343, 0.1801565, 2.059701, 1, 1, 1, 1, 1,
0.6835425, -0.4888382, 0.4092497, 1, 1, 1, 1, 1,
0.6839116, 2.596314, -1.699186, 1, 1, 1, 1, 1,
0.6844631, 1.761348, -0.3794123, 1, 1, 1, 1, 1,
0.6862811, -0.5687635, 0.7304665, 1, 1, 1, 1, 1,
0.6873199, 0.0137521, 0.2743635, 1, 1, 1, 1, 1,
0.6889035, 1.521021, -0.9016639, 1, 1, 1, 1, 1,
0.6955867, -0.09978035, 2.065939, 1, 1, 1, 1, 1,
0.6988822, 2.812785, 0.9892914, 1, 1, 1, 1, 1,
0.7080551, 0.09574308, 0.8076912, 1, 1, 1, 1, 1,
0.7120574, -1.345232, 1.627262, 1, 1, 1, 1, 1,
0.712249, 0.7057713, 1.559012, 1, 1, 1, 1, 1,
0.7127122, 1.166386, 0.5138065, 1, 1, 1, 1, 1,
0.7136754, 1.948317, -0.2660439, 1, 1, 1, 1, 1,
0.7151868, -1.197281, 1.771557, 0, 0, 1, 1, 1,
0.7189643, -0.712611, 2.526753, 1, 0, 0, 1, 1,
0.7192919, 1.252451, 1.510328, 1, 0, 0, 1, 1,
0.7196013, 1.054604, -0.1190527, 1, 0, 0, 1, 1,
0.7210869, 0.3021431, 1.857578, 1, 0, 0, 1, 1,
0.7292449, -1.83558, 2.67822, 1, 0, 0, 1, 1,
0.7311285, 0.416989, 0.6927933, 0, 0, 0, 1, 1,
0.7356874, -0.5100505, 2.354189, 0, 0, 0, 1, 1,
0.7358698, -0.5914938, 3.558447, 0, 0, 0, 1, 1,
0.7462778, 1.658584, -0.2427107, 0, 0, 0, 1, 1,
0.746582, -0.1487287, 3.212484, 0, 0, 0, 1, 1,
0.75293, -0.580301, 0.974309, 0, 0, 0, 1, 1,
0.7540786, 0.4032727, 1.896653, 0, 0, 0, 1, 1,
0.7545592, 0.0604218, 1.782197, 1, 1, 1, 1, 1,
0.7556071, 0.1838686, -0.3655544, 1, 1, 1, 1, 1,
0.7635831, 0.4862121, 0.1796855, 1, 1, 1, 1, 1,
0.7637683, -1.426983, 2.283053, 1, 1, 1, 1, 1,
0.7658451, -0.4037879, 3.61369, 1, 1, 1, 1, 1,
0.7745509, 0.5594963, 1.093349, 1, 1, 1, 1, 1,
0.7757449, -0.03794941, 1.411328, 1, 1, 1, 1, 1,
0.7821591, 0.06729089, 0.6792326, 1, 1, 1, 1, 1,
0.7896446, -0.6533731, 1.923459, 1, 1, 1, 1, 1,
0.7945569, 0.09110349, 2.824739, 1, 1, 1, 1, 1,
0.8064595, 2.13019, -0.08318833, 1, 1, 1, 1, 1,
0.807372, 0.3233787, 1.76467, 1, 1, 1, 1, 1,
0.8079276, 0.4471628, 2.190202, 1, 1, 1, 1, 1,
0.810185, -0.4683664, 1.6533, 1, 1, 1, 1, 1,
0.8103562, 0.6064184, -0.3385382, 1, 1, 1, 1, 1,
0.811936, 0.9619786, 2.256423, 0, 0, 1, 1, 1,
0.8199583, -0.02614948, 1.880359, 1, 0, 0, 1, 1,
0.8236282, -0.1183212, 1.212987, 1, 0, 0, 1, 1,
0.8252075, -0.1980436, 1.74266, 1, 0, 0, 1, 1,
0.8283586, 0.8439802, 2.409662, 1, 0, 0, 1, 1,
0.8298869, -1.25931, 3.810539, 1, 0, 0, 1, 1,
0.8334975, 0.5807309, -0.9145941, 0, 0, 0, 1, 1,
0.8343225, -1.605528, 2.254876, 0, 0, 0, 1, 1,
0.8474108, 0.6872725, 1.53625, 0, 0, 0, 1, 1,
0.8623753, -0.2206551, 2.785074, 0, 0, 0, 1, 1,
0.8626619, -0.5901111, 0.7590517, 0, 0, 0, 1, 1,
0.8647146, 2.03467, 0.05278549, 0, 0, 0, 1, 1,
0.8664559, -0.963339, 3.37027, 0, 0, 0, 1, 1,
0.8788822, 0.4250173, 0.9809386, 1, 1, 1, 1, 1,
0.8804228, -1.119559, 2.691549, 1, 1, 1, 1, 1,
0.8820455, -0.02176441, -0.03218214, 1, 1, 1, 1, 1,
0.8828049, -0.3187272, 1.7354, 1, 1, 1, 1, 1,
0.8881962, -1.592427, 3.699681, 1, 1, 1, 1, 1,
0.8899166, -0.3254499, 1.143521, 1, 1, 1, 1, 1,
0.8914136, 0.1147924, 2.326027, 1, 1, 1, 1, 1,
0.8920714, 1.183976, 2.153372, 1, 1, 1, 1, 1,
0.8978323, 1.524048, 1.403783, 1, 1, 1, 1, 1,
0.9003783, 2.309571, -0.9148013, 1, 1, 1, 1, 1,
0.9173453, -1.535969, 2.777103, 1, 1, 1, 1, 1,
0.9180739, -0.8684458, 1.657361, 1, 1, 1, 1, 1,
0.9228867, -0.391864, 3.045985, 1, 1, 1, 1, 1,
0.9247885, 1.592039, 0.7697266, 1, 1, 1, 1, 1,
0.9261954, -0.1189029, 0.923802, 1, 1, 1, 1, 1,
0.9277424, -0.5297948, 3.039242, 0, 0, 1, 1, 1,
0.9292287, 0.4873633, 1.267216, 1, 0, 0, 1, 1,
0.9396611, -0.6557756, 2.315498, 1, 0, 0, 1, 1,
0.9402882, -0.4314035, 4.658146, 1, 0, 0, 1, 1,
0.9415483, 0.5146663, 2.536829, 1, 0, 0, 1, 1,
0.9427352, 0.7709557, -1.385745, 1, 0, 0, 1, 1,
0.9461549, -0.3063736, 0.528286, 0, 0, 0, 1, 1,
0.9502879, 1.578411, -0.4156683, 0, 0, 0, 1, 1,
0.954855, 3.314857, 0.1419207, 0, 0, 0, 1, 1,
0.9567362, 0.3395411, 0.6039094, 0, 0, 0, 1, 1,
0.9606761, -0.5996817, 1.824116, 0, 0, 0, 1, 1,
0.9631396, 2.267526, -0.006647219, 0, 0, 0, 1, 1,
0.9717013, -0.7254359, 3.072795, 0, 0, 0, 1, 1,
0.971908, 0.04509996, 2.95756, 1, 1, 1, 1, 1,
0.9769681, -1.268505, 1.651309, 1, 1, 1, 1, 1,
0.9789626, -0.324884, 2.985085, 1, 1, 1, 1, 1,
0.9804577, 0.435598, 0.995094, 1, 1, 1, 1, 1,
0.9895747, -0.4473085, 0.597573, 1, 1, 1, 1, 1,
0.9907103, 0.5066621, 3.30339, 1, 1, 1, 1, 1,
0.9939076, 1.415141, 0.9222967, 1, 1, 1, 1, 1,
0.9992839, -1.015984, 2.455224, 1, 1, 1, 1, 1,
1.009933, 0.5263575, 1.591521, 1, 1, 1, 1, 1,
1.01088, 0.180655, 0.9440079, 1, 1, 1, 1, 1,
1.012273, -0.1664399, 1.184751, 1, 1, 1, 1, 1,
1.015487, 1.217628, 0.8362474, 1, 1, 1, 1, 1,
1.01896, 1.780776, -0.3651199, 1, 1, 1, 1, 1,
1.0208, 0.1799426, 0.1452883, 1, 1, 1, 1, 1,
1.021694, -0.9872864, 3.440408, 1, 1, 1, 1, 1,
1.027178, 0.7121081, 2.020023, 0, 0, 1, 1, 1,
1.027474, -1.295803, 2.18274, 1, 0, 0, 1, 1,
1.030583, -0.4186141, 1.212733, 1, 0, 0, 1, 1,
1.031484, -0.2678886, 3.365136, 1, 0, 0, 1, 1,
1.036649, 1.057486, 1.560295, 1, 0, 0, 1, 1,
1.043252, -2.425002, 2.417189, 1, 0, 0, 1, 1,
1.046399, 1.117578, -0.0345083, 0, 0, 0, 1, 1,
1.052664, 0.4277898, 0.3771393, 0, 0, 0, 1, 1,
1.066499, 0.1372959, 1.541876, 0, 0, 0, 1, 1,
1.070498, -0.1988098, 1.470795, 0, 0, 0, 1, 1,
1.078087, -1.586303, 1.88757, 0, 0, 0, 1, 1,
1.079215, -1.114866, 3.432294, 0, 0, 0, 1, 1,
1.079923, 0.5399465, -0.1687611, 0, 0, 0, 1, 1,
1.082171, -0.3620021, 2.809362, 1, 1, 1, 1, 1,
1.086015, 2.847916, -0.7245665, 1, 1, 1, 1, 1,
1.091635, -2.317103, 1.427955, 1, 1, 1, 1, 1,
1.094243, -1.511413, 4.034687, 1, 1, 1, 1, 1,
1.096258, 0.7262416, 2.100185, 1, 1, 1, 1, 1,
1.103857, 0.1635535, 1.829891, 1, 1, 1, 1, 1,
1.116585, -0.6255759, 2.028344, 1, 1, 1, 1, 1,
1.119523, -0.4613205, 1.594052, 1, 1, 1, 1, 1,
1.120988, -0.4804008, 1.014983, 1, 1, 1, 1, 1,
1.1267, -0.708334, 1.160061, 1, 1, 1, 1, 1,
1.127753, 0.8678933, 1.079727, 1, 1, 1, 1, 1,
1.133974, -2.087027, 1.190784, 1, 1, 1, 1, 1,
1.136949, -2.485655, 2.102973, 1, 1, 1, 1, 1,
1.137783, 0.476714, 1.503853, 1, 1, 1, 1, 1,
1.140407, 0.6804984, 1.825289, 1, 1, 1, 1, 1,
1.141181, -0.2778546, 2.823759, 0, 0, 1, 1, 1,
1.147378, 0.2882972, 1.486759, 1, 0, 0, 1, 1,
1.15153, -0.7144662, 3.653993, 1, 0, 0, 1, 1,
1.158698, 1.194503, 0.7803864, 1, 0, 0, 1, 1,
1.164499, 0.3919815, 2.358946, 1, 0, 0, 1, 1,
1.16512, -1.36494, 1.989919, 1, 0, 0, 1, 1,
1.179382, 0.4763576, 1.176267, 0, 0, 0, 1, 1,
1.184367, 1.08677, 0.6467441, 0, 0, 0, 1, 1,
1.186533, -1.7216, 2.404278, 0, 0, 0, 1, 1,
1.195868, -0.4844839, 3.890607, 0, 0, 0, 1, 1,
1.198611, 0.7909403, 1.719366, 0, 0, 0, 1, 1,
1.208721, -1.404246, 3.961814, 0, 0, 0, 1, 1,
1.212363, -0.8167, -0.1450467, 0, 0, 0, 1, 1,
1.21986, 0.7770659, 0.6090582, 1, 1, 1, 1, 1,
1.22856, 1.896228, -1.298626, 1, 1, 1, 1, 1,
1.231523, 0.9791539, -0.7026947, 1, 1, 1, 1, 1,
1.231892, -1.734252, 1.495668, 1, 1, 1, 1, 1,
1.23876, 0.1869209, 2.549695, 1, 1, 1, 1, 1,
1.248273, -0.1406011, 2.765203, 1, 1, 1, 1, 1,
1.249544, -1.221632, 2.128258, 1, 1, 1, 1, 1,
1.251564, -0.8994752, 1.765892, 1, 1, 1, 1, 1,
1.253136, -0.6526314, 1.078483, 1, 1, 1, 1, 1,
1.263866, 0.8796591, 4.264558, 1, 1, 1, 1, 1,
1.268937, 0.1812149, 2.26989, 1, 1, 1, 1, 1,
1.269826, 2.028208, 0.9776073, 1, 1, 1, 1, 1,
1.271276, -0.5335399, 2.266448, 1, 1, 1, 1, 1,
1.271351, -0.2824846, 3.54869, 1, 1, 1, 1, 1,
1.301755, 0.5550874, 2.403038, 1, 1, 1, 1, 1,
1.306958, 0.1857889, 2.47862, 0, 0, 1, 1, 1,
1.30738, 0.02701966, 1.455081, 1, 0, 0, 1, 1,
1.31037, 0.3246122, 2.819305, 1, 0, 0, 1, 1,
1.326708, -0.1349374, -0.3459873, 1, 0, 0, 1, 1,
1.328452, 0.6002452, 2.803528, 1, 0, 0, 1, 1,
1.329682, 2.188243, 0.4466362, 1, 0, 0, 1, 1,
1.335296, -0.1240864, 2.476941, 0, 0, 0, 1, 1,
1.336429, 2.021709, 0.7502109, 0, 0, 0, 1, 1,
1.340925, 1.343493, 2.323593, 0, 0, 0, 1, 1,
1.342008, -0.6905308, 1.924045, 0, 0, 0, 1, 1,
1.345247, 0.2958319, 2.668218, 0, 0, 0, 1, 1,
1.345582, -0.2956292, 2.74649, 0, 0, 0, 1, 1,
1.351699, 1.986091, 0.7500107, 0, 0, 0, 1, 1,
1.367274, 1.459388, 1.049537, 1, 1, 1, 1, 1,
1.368382, 0.3183425, 2.065845, 1, 1, 1, 1, 1,
1.371822, 1.069459, 0.8063281, 1, 1, 1, 1, 1,
1.376476, 1.158903, 1.569132, 1, 1, 1, 1, 1,
1.376575, -0.4428892, -1.215941, 1, 1, 1, 1, 1,
1.382889, -0.837279, 1.756741, 1, 1, 1, 1, 1,
1.386942, 1.262525, 0.5358452, 1, 1, 1, 1, 1,
1.393803, 0.6323892, -2.063204, 1, 1, 1, 1, 1,
1.396235, -0.9696284, 2.443526, 1, 1, 1, 1, 1,
1.397961, -0.3871917, 1.561132, 1, 1, 1, 1, 1,
1.400846, -0.5668913, 3.082042, 1, 1, 1, 1, 1,
1.402471, 0.6212361, 0.2126351, 1, 1, 1, 1, 1,
1.402632, -1.348406, 1.280542, 1, 1, 1, 1, 1,
1.410087, -1.205433, 3.856026, 1, 1, 1, 1, 1,
1.41408, 0.2349975, 2.022871, 1, 1, 1, 1, 1,
1.422541, 0.169815, 0.6286809, 0, 0, 1, 1, 1,
1.428504, 0.3588716, 2.073624, 1, 0, 0, 1, 1,
1.441966, 1.233067, -0.6289946, 1, 0, 0, 1, 1,
1.448853, 0.9205619, 1.547776, 1, 0, 0, 1, 1,
1.449321, 0.3144629, 2.307961, 1, 0, 0, 1, 1,
1.451291, 0.459891, 1.234493, 1, 0, 0, 1, 1,
1.454787, -1.845908, 1.533465, 0, 0, 0, 1, 1,
1.46113, -0.621399, 3.57289, 0, 0, 0, 1, 1,
1.473251, -0.08761864, 2.827789, 0, 0, 0, 1, 1,
1.479536, 1.845602, -0.07191288, 0, 0, 0, 1, 1,
1.481146, -1.180704, 1.581746, 0, 0, 0, 1, 1,
1.481612, 0.02132908, 2.578146, 0, 0, 0, 1, 1,
1.487813, -1.976728, 3.380846, 0, 0, 0, 1, 1,
1.489187, -2.246105, 1.782321, 1, 1, 1, 1, 1,
1.489971, 1.243341, 0.3724269, 1, 1, 1, 1, 1,
1.491463, -0.3185655, 2.721763, 1, 1, 1, 1, 1,
1.503851, 0.1191044, 1.816488, 1, 1, 1, 1, 1,
1.524999, -0.1683226, 0.1755123, 1, 1, 1, 1, 1,
1.531321, 0.5791299, 0.7462685, 1, 1, 1, 1, 1,
1.542514, 1.0831, 1.139652, 1, 1, 1, 1, 1,
1.54918, 1.624257, -0.2485968, 1, 1, 1, 1, 1,
1.556075, 0.1994727, 0.4999416, 1, 1, 1, 1, 1,
1.569377, -1.228108, 1.36646, 1, 1, 1, 1, 1,
1.570541, 0.7591535, 2.181254, 1, 1, 1, 1, 1,
1.582295, -0.2392106, 0.7004445, 1, 1, 1, 1, 1,
1.591068, 1.141098, -0.0943957, 1, 1, 1, 1, 1,
1.640484, -1.212881, 0.9901271, 1, 1, 1, 1, 1,
1.651035, -0.2073161, 1.950721, 1, 1, 1, 1, 1,
1.675707, -0.6936703, 1.758945, 0, 0, 1, 1, 1,
1.677421, -1.235925, 2.736633, 1, 0, 0, 1, 1,
1.698115, -0.506493, 0.4106758, 1, 0, 0, 1, 1,
1.700465, 1.175747, 2.336202, 1, 0, 0, 1, 1,
1.700584, -0.3596547, 1.17489, 1, 0, 0, 1, 1,
1.724457, -1.071521, 1.840675, 1, 0, 0, 1, 1,
1.737886, 0.8012515, 2.363947, 0, 0, 0, 1, 1,
1.77645, 0.4920078, 1.19733, 0, 0, 0, 1, 1,
1.792145, 1.22041, -1.316307, 0, 0, 0, 1, 1,
1.793015, -2.663385, 2.053465, 0, 0, 0, 1, 1,
1.794186, -0.9016394, 1.463252, 0, 0, 0, 1, 1,
1.806765, -2.73944, 2.106913, 0, 0, 0, 1, 1,
1.82197, -0.9661759, 2.725603, 0, 0, 0, 1, 1,
1.824634, -0.6273612, 2.274409, 1, 1, 1, 1, 1,
1.826537, -0.2510845, 1.76108, 1, 1, 1, 1, 1,
1.860954, -0.2483872, 1.392038, 1, 1, 1, 1, 1,
1.865659, 0.05804817, 1.875713, 1, 1, 1, 1, 1,
1.873021, -1.906739, 3.56977, 1, 1, 1, 1, 1,
1.890175, -0.2109657, 1.803181, 1, 1, 1, 1, 1,
1.90636, -0.3478135, 1.923975, 1, 1, 1, 1, 1,
1.919604, -0.2025079, 0.7930043, 1, 1, 1, 1, 1,
1.925466, 2.324565, 1.233644, 1, 1, 1, 1, 1,
1.953881, -0.5400131, 1.205286, 1, 1, 1, 1, 1,
1.962422, -0.4172006, 2.528204, 1, 1, 1, 1, 1,
1.992173, -0.2329595, 1.010119, 1, 1, 1, 1, 1,
2.03435, 0.1567189, 1.997583, 1, 1, 1, 1, 1,
2.035299, -1.653289, 1.188306, 1, 1, 1, 1, 1,
2.04922, -0.3716961, 1.926399, 1, 1, 1, 1, 1,
2.0667, -1.127968, 3.429961, 0, 0, 1, 1, 1,
2.067086, 0.520414, 1.78523, 1, 0, 0, 1, 1,
2.082438, 1.611013, -0.1879479, 1, 0, 0, 1, 1,
2.086187, -0.9210748, 1.836661, 1, 0, 0, 1, 1,
2.088489, 0.01458334, 2.745017, 1, 0, 0, 1, 1,
2.130821, -0.4408795, 1.605113, 1, 0, 0, 1, 1,
2.146437, 0.7360795, 1.43119, 0, 0, 0, 1, 1,
2.163969, -1.122959, 1.605936, 0, 0, 0, 1, 1,
2.194657, -0.05239029, 2.253273, 0, 0, 0, 1, 1,
2.221764, -0.6674913, 2.822828, 0, 0, 0, 1, 1,
2.229862, -0.7684548, 2.180818, 0, 0, 0, 1, 1,
2.320356, 0.5766702, 1.853677, 0, 0, 0, 1, 1,
2.423294, 0.4848326, 0.7992305, 0, 0, 0, 1, 1,
2.439435, -0.8373063, 0.3004344, 1, 1, 1, 1, 1,
2.511783, 0.2239643, 1.621726, 1, 1, 1, 1, 1,
2.67988, 1.316802, 0.001027087, 1, 1, 1, 1, 1,
3.053828, 0.008139708, 2.277635, 1, 1, 1, 1, 1,
3.128363, -0.7970712, 1.821037, 1, 1, 1, 1, 1,
3.186978, 0.3480239, -0.03495693, 1, 1, 1, 1, 1,
3.638853, 0.8462407, 0.7624301, 1, 1, 1, 1, 1
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
var radius = 9.947552;
var distance = 34.94035;
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
mvMatrix.translate( -0.2796917, -0.1242402, 0.3860345 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.94035);
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
