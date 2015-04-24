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
-3.690897, -0.5612788, -1.353053, 1, 0, 0, 1,
-2.90745, -0.7556683, -0.2508381, 1, 0.007843138, 0, 1,
-2.894814, -4.01524, -2.322274, 1, 0.01176471, 0, 1,
-2.800633, -3.176257, -3.955467, 1, 0.01960784, 0, 1,
-2.657807, 0.7178662, -1.612579, 1, 0.02352941, 0, 1,
-2.50156, -0.9847079, -0.9702203, 1, 0.03137255, 0, 1,
-2.460094, 0.3023644, -1.311181, 1, 0.03529412, 0, 1,
-2.427357, -1.319107, -1.96826, 1, 0.04313726, 0, 1,
-2.3994, 0.04400437, -1.394433, 1, 0.04705882, 0, 1,
-2.380115, -0.6115658, 0.5275396, 1, 0.05490196, 0, 1,
-2.26318, -0.7408083, -1.326501, 1, 0.05882353, 0, 1,
-2.234146, -0.6870823, -1.998632, 1, 0.06666667, 0, 1,
-2.227682, 0.6663651, -2.334101, 1, 0.07058824, 0, 1,
-2.174762, 1.333039, -1.378887, 1, 0.07843138, 0, 1,
-2.165291, 0.0330454, -1.594629, 1, 0.08235294, 0, 1,
-2.098448, -0.4118964, -2.13591, 1, 0.09019608, 0, 1,
-2.094279, 0.01068887, -1.926398, 1, 0.09411765, 0, 1,
-2.089865, -0.06685244, -1.312767, 1, 0.1019608, 0, 1,
-2.068577, -0.2543552, -2.816621, 1, 0.1098039, 0, 1,
-2.054626, 0.4458622, 0.02639909, 1, 0.1137255, 0, 1,
-2.022537, -0.6010285, -1.980777, 1, 0.1215686, 0, 1,
-2.022196, 0.6036886, -1.477658, 1, 0.1254902, 0, 1,
-1.985732, -0.1923324, -0.9592283, 1, 0.1333333, 0, 1,
-1.980128, -0.6125475, -2.81986, 1, 0.1372549, 0, 1,
-1.978725, -0.6680763, -2.804127, 1, 0.145098, 0, 1,
-1.967287, 0.5996611, -2.537565, 1, 0.1490196, 0, 1,
-1.963096, -0.121952, -1.312009, 1, 0.1568628, 0, 1,
-1.915733, 0.112584, -2.240313, 1, 0.1607843, 0, 1,
-1.905707, -0.8903031, -1.991592, 1, 0.1686275, 0, 1,
-1.903376, 0.6240543, -1.059315, 1, 0.172549, 0, 1,
-1.898331, 0.06590648, -1.794811, 1, 0.1803922, 0, 1,
-1.891504, -1.037802, -1.367523, 1, 0.1843137, 0, 1,
-1.887191, 1.135086, -0.7332295, 1, 0.1921569, 0, 1,
-1.855149, -0.7953901, -0.8766764, 1, 0.1960784, 0, 1,
-1.830122, 1.203102, -1.136568, 1, 0.2039216, 0, 1,
-1.823177, -0.6862825, -1.239413, 1, 0.2117647, 0, 1,
-1.816143, 1.803255, -1.475801, 1, 0.2156863, 0, 1,
-1.805092, 0.5350107, -2.26633, 1, 0.2235294, 0, 1,
-1.775315, -0.6557817, -2.146187, 1, 0.227451, 0, 1,
-1.755009, -1.084459, -1.73455, 1, 0.2352941, 0, 1,
-1.745553, 0.07076887, -3.234442, 1, 0.2392157, 0, 1,
-1.742137, -1.606887, -1.634832, 1, 0.2470588, 0, 1,
-1.735467, 0.9823691, -1.021704, 1, 0.2509804, 0, 1,
-1.709659, 1.249306, -0.8249999, 1, 0.2588235, 0, 1,
-1.708706, 1.948068, -0.7635574, 1, 0.2627451, 0, 1,
-1.705397, 0.2820826, -2.661232, 1, 0.2705882, 0, 1,
-1.704547, -1.56713, -3.31871, 1, 0.2745098, 0, 1,
-1.678485, 1.63825, -1.295136, 1, 0.282353, 0, 1,
-1.663483, -0.6241056, -2.153828, 1, 0.2862745, 0, 1,
-1.658996, 0.3223655, 0.08473574, 1, 0.2941177, 0, 1,
-1.64751, 1.432919, 0.001379112, 1, 0.3019608, 0, 1,
-1.640355, 0.1660883, -1.794327, 1, 0.3058824, 0, 1,
-1.635526, 0.01699714, -1.226871, 1, 0.3137255, 0, 1,
-1.61907, 0.6861086, -1.897068, 1, 0.3176471, 0, 1,
-1.613918, 1.02385, -0.4480732, 1, 0.3254902, 0, 1,
-1.60106, -0.5153735, -2.124369, 1, 0.3294118, 0, 1,
-1.599179, 3.098863, -0.2085054, 1, 0.3372549, 0, 1,
-1.563568, 0.3530027, -1.721351, 1, 0.3411765, 0, 1,
-1.549347, -1.404835, -3.031956, 1, 0.3490196, 0, 1,
-1.541438, 0.3662249, -0.1647343, 1, 0.3529412, 0, 1,
-1.527367, 2.215658, -0.8575153, 1, 0.3607843, 0, 1,
-1.525319, 1.452366, -1.708046, 1, 0.3647059, 0, 1,
-1.522617, 0.05145075, -0.2091561, 1, 0.372549, 0, 1,
-1.507301, -0.2362551, -1.669782, 1, 0.3764706, 0, 1,
-1.506637, 0.4750598, -0.2526312, 1, 0.3843137, 0, 1,
-1.504428, -0.01866808, -2.887785, 1, 0.3882353, 0, 1,
-1.498826, 0.2032865, -0.8766177, 1, 0.3960784, 0, 1,
-1.496788, -0.4089085, -0.7449386, 1, 0.4039216, 0, 1,
-1.472452, -0.7120739, -2.735062, 1, 0.4078431, 0, 1,
-1.471793, 1.172937, -2.150293, 1, 0.4156863, 0, 1,
-1.466425, -1.817899, -3.616801, 1, 0.4196078, 0, 1,
-1.458165, -1.244743, -2.064299, 1, 0.427451, 0, 1,
-1.451036, -2.568561, -4.111446, 1, 0.4313726, 0, 1,
-1.43582, 0.5038419, -1.957731, 1, 0.4392157, 0, 1,
-1.4134, -0.6379064, -2.931814, 1, 0.4431373, 0, 1,
-1.401692, -3.306545, -3.51845, 1, 0.4509804, 0, 1,
-1.400874, 1.106951, -0.7080277, 1, 0.454902, 0, 1,
-1.392306, -0.7397043, -0.5577722, 1, 0.4627451, 0, 1,
-1.389145, -1.790614, -3.463967, 1, 0.4666667, 0, 1,
-1.382108, 1.767496, -0.5690144, 1, 0.4745098, 0, 1,
-1.368326, 0.9144108, -1.603423, 1, 0.4784314, 0, 1,
-1.366586, -0.6110911, -0.3524161, 1, 0.4862745, 0, 1,
-1.361359, 1.139784, 0.1650761, 1, 0.4901961, 0, 1,
-1.343378, -0.8612569, -0.8313472, 1, 0.4980392, 0, 1,
-1.337562, 0.3925824, -0.8077297, 1, 0.5058824, 0, 1,
-1.324129, -1.454181, -3.723722, 1, 0.509804, 0, 1,
-1.318596, -0.4869131, -2.700691, 1, 0.5176471, 0, 1,
-1.31622, 0.5944356, -2.298503, 1, 0.5215687, 0, 1,
-1.314557, 0.1340546, -0.8187919, 1, 0.5294118, 0, 1,
-1.310264, -0.03505711, -3.243855, 1, 0.5333334, 0, 1,
-1.306193, -0.7875202, -2.41855, 1, 0.5411765, 0, 1,
-1.304128, 0.5133686, 0.01558154, 1, 0.5450981, 0, 1,
-1.300765, -0.3690687, -0.9297705, 1, 0.5529412, 0, 1,
-1.295666, 0.6545554, -1.80027, 1, 0.5568628, 0, 1,
-1.295261, -0.05182691, -0.3581036, 1, 0.5647059, 0, 1,
-1.294693, -0.8769689, -2.455543, 1, 0.5686275, 0, 1,
-1.286297, -0.5446551, -1.538132, 1, 0.5764706, 0, 1,
-1.282386, 0.09633936, -1.286781, 1, 0.5803922, 0, 1,
-1.27285, 0.8327385, -0.7109644, 1, 0.5882353, 0, 1,
-1.270999, -0.8169399, -1.69979, 1, 0.5921569, 0, 1,
-1.266275, 1.303769, -2.244456, 1, 0.6, 0, 1,
-1.238365, -0.5046, -1.259708, 1, 0.6078432, 0, 1,
-1.232961, 0.1745842, -1.245398, 1, 0.6117647, 0, 1,
-1.232297, 0.3970451, -1.599149, 1, 0.6196079, 0, 1,
-1.222878, -0.8597029, -2.234481, 1, 0.6235294, 0, 1,
-1.222009, 1.088379, -0.5101471, 1, 0.6313726, 0, 1,
-1.218809, 0.6074921, -1.248497, 1, 0.6352941, 0, 1,
-1.216546, 0.1914063, -1.57655, 1, 0.6431373, 0, 1,
-1.215675, 1.207928, -0.1074062, 1, 0.6470588, 0, 1,
-1.214974, 0.4489694, -0.3188985, 1, 0.654902, 0, 1,
-1.211391, -0.9190782, -1.079239, 1, 0.6588235, 0, 1,
-1.204114, -0.311588, -1.221605, 1, 0.6666667, 0, 1,
-1.203951, -0.531957, -1.610618, 1, 0.6705883, 0, 1,
-1.203708, 0.1946321, -1.748809, 1, 0.6784314, 0, 1,
-1.202029, 1.765355, -1.082877, 1, 0.682353, 0, 1,
-1.193459, 0.8941212, -1.565141, 1, 0.6901961, 0, 1,
-1.188497, -0.3983282, -1.732587, 1, 0.6941177, 0, 1,
-1.186263, 0.6439133, -1.67018, 1, 0.7019608, 0, 1,
-1.183988, 0.1715752, -2.019416, 1, 0.7098039, 0, 1,
-1.18041, -0.5861126, -1.879078, 1, 0.7137255, 0, 1,
-1.177103, 0.3092729, -2.408388, 1, 0.7215686, 0, 1,
-1.175757, 0.6951247, -0.8116972, 1, 0.7254902, 0, 1,
-1.164946, 1.210758, -0.6164658, 1, 0.7333333, 0, 1,
-1.153522, -2.045205, -2.669526, 1, 0.7372549, 0, 1,
-1.139665, -1.586352, -3.364441, 1, 0.7450981, 0, 1,
-1.132582, 0.05428943, -1.14857, 1, 0.7490196, 0, 1,
-1.130828, 0.6259505, -0.9372399, 1, 0.7568628, 0, 1,
-1.130163, 0.5935269, -1.013067, 1, 0.7607843, 0, 1,
-1.123195, -0.744988, -2.3926, 1, 0.7686275, 0, 1,
-1.121735, 1.93673, -1.437228, 1, 0.772549, 0, 1,
-1.115402, 0.6532781, -1.011077, 1, 0.7803922, 0, 1,
-1.114466, -0.5655857, -0.8670018, 1, 0.7843137, 0, 1,
-1.113077, -0.4905421, -3.600358, 1, 0.7921569, 0, 1,
-1.108304, -1.806435, -3.0543, 1, 0.7960784, 0, 1,
-1.103437, -1.393138, -1.898323, 1, 0.8039216, 0, 1,
-1.102689, 1.262606, -2.420686, 1, 0.8117647, 0, 1,
-1.099463, 0.09133232, 0.8772566, 1, 0.8156863, 0, 1,
-1.098958, 1.177232, -1.701408, 1, 0.8235294, 0, 1,
-1.098821, 1.643591, -0.292307, 1, 0.827451, 0, 1,
-1.098112, 0.3135493, -3.124419, 1, 0.8352941, 0, 1,
-1.09696, -0.3010442, -3.073259, 1, 0.8392157, 0, 1,
-1.090452, 0.6579892, -1.272026, 1, 0.8470588, 0, 1,
-1.086949, -0.8817568, -0.872243, 1, 0.8509804, 0, 1,
-1.085558, -2.198138, -2.781792, 1, 0.8588235, 0, 1,
-1.085204, -0.3010608, -2.681769, 1, 0.8627451, 0, 1,
-1.084841, 0.4314967, 2.231815, 1, 0.8705882, 0, 1,
-1.081011, 0.1277133, -0.5813385, 1, 0.8745098, 0, 1,
-1.074642, -2.734422, -1.54062, 1, 0.8823529, 0, 1,
-1.066325, 0.02921428, -1.581364, 1, 0.8862745, 0, 1,
-1.058, -1.162046, -1.26435, 1, 0.8941177, 0, 1,
-1.05651, -1.065836, -1.063698, 1, 0.8980392, 0, 1,
-1.05624, 0.09558745, -2.946091, 1, 0.9058824, 0, 1,
-1.046165, 0.3067052, -1.086582, 1, 0.9137255, 0, 1,
-1.039235, 0.02185025, -1.321981, 1, 0.9176471, 0, 1,
-1.028476, 0.8124797, -0.9310884, 1, 0.9254902, 0, 1,
-1.027386, 1.281512, -1.788806, 1, 0.9294118, 0, 1,
-1.011551, -2.016958, -3.758348, 1, 0.9372549, 0, 1,
-1.00942, 0.3151608, -2.189563, 1, 0.9411765, 0, 1,
-1.003786, -1.699008, -1.830803, 1, 0.9490196, 0, 1,
-0.987249, -0.6126204, -3.082503, 1, 0.9529412, 0, 1,
-0.9786441, 1.023584, -3.032688, 1, 0.9607843, 0, 1,
-0.9721692, 0.4354977, -2.347806, 1, 0.9647059, 0, 1,
-0.9710925, 0.5521603, -1.654287, 1, 0.972549, 0, 1,
-0.9702164, 0.251557, -2.12891, 1, 0.9764706, 0, 1,
-0.964927, 0.9414554, -2.260576, 1, 0.9843137, 0, 1,
-0.9627223, -1.768991, -3.82375, 1, 0.9882353, 0, 1,
-0.9597139, -1.388421, -0.8364854, 1, 0.9960784, 0, 1,
-0.9581777, -0.1259648, -0.5067358, 0.9960784, 1, 0, 1,
-0.9537931, 0.4951924, -0.517577, 0.9921569, 1, 0, 1,
-0.9472294, -1.141752, -2.232011, 0.9843137, 1, 0, 1,
-0.9437554, -0.9816561, -2.187871, 0.9803922, 1, 0, 1,
-0.9389152, -0.03148537, -1.775073, 0.972549, 1, 0, 1,
-0.9383717, 0.1583426, -1.189265, 0.9686275, 1, 0, 1,
-0.9377325, -0.8401963, -3.410501, 0.9607843, 1, 0, 1,
-0.9298193, -1.0526, -3.375062, 0.9568627, 1, 0, 1,
-0.929435, 0.02090469, -1.20716, 0.9490196, 1, 0, 1,
-0.9263318, -0.5229741, -3.027075, 0.945098, 1, 0, 1,
-0.917672, -1.289694, -1.559095, 0.9372549, 1, 0, 1,
-0.9153131, 2.605228, -0.790816, 0.9333333, 1, 0, 1,
-0.9133074, 0.427207, 0.160002, 0.9254902, 1, 0, 1,
-0.9132634, 0.2626896, -1.536396, 0.9215686, 1, 0, 1,
-0.9123388, -0.2968816, -1.4054, 0.9137255, 1, 0, 1,
-0.9121454, 3.205915, 0.2026592, 0.9098039, 1, 0, 1,
-0.8995066, -1.174299, -3.065382, 0.9019608, 1, 0, 1,
-0.8882855, 0.6508613, -2.264552, 0.8941177, 1, 0, 1,
-0.8880531, 0.08371063, -2.259666, 0.8901961, 1, 0, 1,
-0.8837574, 1.176928, -0.9094239, 0.8823529, 1, 0, 1,
-0.882969, -0.3879351, -0.7194065, 0.8784314, 1, 0, 1,
-0.8817593, -1.054391, -1.721036, 0.8705882, 1, 0, 1,
-0.8784205, -1.464772, -2.0765, 0.8666667, 1, 0, 1,
-0.8743988, 1.424704, -0.8893948, 0.8588235, 1, 0, 1,
-0.8714672, 0.2984681, -2.315552, 0.854902, 1, 0, 1,
-0.8675126, 0.4153362, -3.284101, 0.8470588, 1, 0, 1,
-0.8663656, 0.03655443, -1.154639, 0.8431373, 1, 0, 1,
-0.8646871, -0.7413455, -1.328849, 0.8352941, 1, 0, 1,
-0.8644322, -1.865262, -1.835402, 0.8313726, 1, 0, 1,
-0.8587831, -0.4440612, -2.243727, 0.8235294, 1, 0, 1,
-0.8552057, 1.04833, -0.9057981, 0.8196079, 1, 0, 1,
-0.8419269, 0.1379958, -2.960143, 0.8117647, 1, 0, 1,
-0.8390378, 1.078043, -2.426963, 0.8078431, 1, 0, 1,
-0.8346525, -0.1158369, -2.159122, 0.8, 1, 0, 1,
-0.8343351, -0.2975892, -2.260887, 0.7921569, 1, 0, 1,
-0.8288351, -0.00997286, -2.844791, 0.7882353, 1, 0, 1,
-0.8207419, -0.384423, -2.754269, 0.7803922, 1, 0, 1,
-0.8165526, -0.1793076, -2.874439, 0.7764706, 1, 0, 1,
-0.813086, 2.04103, 0.3507296, 0.7686275, 1, 0, 1,
-0.812837, -0.1079425, -1.36266, 0.7647059, 1, 0, 1,
-0.8124694, -1.283723, -1.982136, 0.7568628, 1, 0, 1,
-0.811843, -2.172141, -2.400436, 0.7529412, 1, 0, 1,
-0.8048165, 0.3715295, -2.112885, 0.7450981, 1, 0, 1,
-0.7972751, 0.5557497, 0.5879644, 0.7411765, 1, 0, 1,
-0.7948402, -0.5679837, -1.385555, 0.7333333, 1, 0, 1,
-0.7898793, -1.378546, -2.477003, 0.7294118, 1, 0, 1,
-0.7872065, 0.6858332, -1.557661, 0.7215686, 1, 0, 1,
-0.7871572, 1.19744, -0.3623337, 0.7176471, 1, 0, 1,
-0.7856116, -0.5701984, -0.492056, 0.7098039, 1, 0, 1,
-0.7824277, -1.164259, -1.138914, 0.7058824, 1, 0, 1,
-0.7798439, -0.3031152, -1.20019, 0.6980392, 1, 0, 1,
-0.7686481, -0.1864495, -2.405724, 0.6901961, 1, 0, 1,
-0.7658997, 1.157763, -0.4649737, 0.6862745, 1, 0, 1,
-0.7605156, -1.307986, -2.936142, 0.6784314, 1, 0, 1,
-0.7540111, -0.03053039, -1.35882, 0.6745098, 1, 0, 1,
-0.7537173, -1.353609, -3.248371, 0.6666667, 1, 0, 1,
-0.7518373, -0.6180964, -1.538412, 0.6627451, 1, 0, 1,
-0.7507221, -0.6032498, -0.5605637, 0.654902, 1, 0, 1,
-0.7486176, -0.004779532, -1.740958, 0.6509804, 1, 0, 1,
-0.7457536, 0.6681425, -1.206476, 0.6431373, 1, 0, 1,
-0.7442515, 0.3404835, -1.487691, 0.6392157, 1, 0, 1,
-0.7441767, 0.8275799, -0.8183388, 0.6313726, 1, 0, 1,
-0.7419283, -0.2307342, -3.733861, 0.627451, 1, 0, 1,
-0.741762, -0.4473309, -2.389314, 0.6196079, 1, 0, 1,
-0.7386143, 1.80498, -0.7937827, 0.6156863, 1, 0, 1,
-0.7336969, -1.598345, -3.007449, 0.6078432, 1, 0, 1,
-0.7329357, -0.8060979, -3.409348, 0.6039216, 1, 0, 1,
-0.7321789, -0.3497037, -2.284276, 0.5960785, 1, 0, 1,
-0.7320597, 0.236794, -1.241725, 0.5882353, 1, 0, 1,
-0.7294898, -1.354656, -1.025883, 0.5843138, 1, 0, 1,
-0.7231391, 0.005517262, -0.4096918, 0.5764706, 1, 0, 1,
-0.7182912, 2.153512, 0.02165932, 0.572549, 1, 0, 1,
-0.7173045, -0.5675117, -3.413179, 0.5647059, 1, 0, 1,
-0.715372, 1.701453, -0.5061815, 0.5607843, 1, 0, 1,
-0.7137667, -0.5350383, -3.636848, 0.5529412, 1, 0, 1,
-0.7095971, 0.03871152, -2.002871, 0.5490196, 1, 0, 1,
-0.7062456, 0.05893487, -1.850724, 0.5411765, 1, 0, 1,
-0.7034368, -0.7212285, -3.194092, 0.5372549, 1, 0, 1,
-0.7025231, -1.472889, -4.144905, 0.5294118, 1, 0, 1,
-0.6940855, -1.415721, -2.996818, 0.5254902, 1, 0, 1,
-0.6936255, 0.6018326, -1.708804, 0.5176471, 1, 0, 1,
-0.689117, -1.383531, -1.908122, 0.5137255, 1, 0, 1,
-0.6881381, -1.472901, -3.967644, 0.5058824, 1, 0, 1,
-0.681739, 1.310913, 0.8146551, 0.5019608, 1, 0, 1,
-0.6800132, 0.8780142, -0.3851447, 0.4941176, 1, 0, 1,
-0.6742392, -0.6235724, -0.1143318, 0.4862745, 1, 0, 1,
-0.6736845, 0.3525766, 0.1284449, 0.4823529, 1, 0, 1,
-0.6639423, -0.7040012, -2.708744, 0.4745098, 1, 0, 1,
-0.6638026, -0.5724559, -1.109488, 0.4705882, 1, 0, 1,
-0.6629093, 1.297851, -1.257905, 0.4627451, 1, 0, 1,
-0.6612766, 1.026559, -0.001947322, 0.4588235, 1, 0, 1,
-0.6536696, 0.8275646, 1.357754, 0.4509804, 1, 0, 1,
-0.6517965, 0.850282, -0.9287862, 0.4470588, 1, 0, 1,
-0.6494085, 0.9438224, 1.000257, 0.4392157, 1, 0, 1,
-0.6408609, 0.4501259, 0.1525125, 0.4352941, 1, 0, 1,
-0.6367185, 1.063208, -0.9233496, 0.427451, 1, 0, 1,
-0.6357636, 2.135333, -1.959487, 0.4235294, 1, 0, 1,
-0.6349533, 0.294674, -1.355892, 0.4156863, 1, 0, 1,
-0.6298342, 0.1677595, -1.925302, 0.4117647, 1, 0, 1,
-0.6281852, -1.067228, -2.328424, 0.4039216, 1, 0, 1,
-0.6257889, 1.929204, -0.3629961, 0.3960784, 1, 0, 1,
-0.6205514, -1.151751, -2.365906, 0.3921569, 1, 0, 1,
-0.6140441, -0.7680117, -2.694443, 0.3843137, 1, 0, 1,
-0.6139966, 0.5409096, -0.4682776, 0.3803922, 1, 0, 1,
-0.6133574, -1.177141, -1.02182, 0.372549, 1, 0, 1,
-0.6081571, -0.9546788, -0.319798, 0.3686275, 1, 0, 1,
-0.5997095, 0.5496328, -0.09474709, 0.3607843, 1, 0, 1,
-0.5912355, 1.628191, 0.4043623, 0.3568628, 1, 0, 1,
-0.5908931, -0.497313, -2.460575, 0.3490196, 1, 0, 1,
-0.5848435, -0.3399903, -2.177085, 0.345098, 1, 0, 1,
-0.5843133, -1.101184, -3.625136, 0.3372549, 1, 0, 1,
-0.5810735, 2.8213, -1.134775, 0.3333333, 1, 0, 1,
-0.5777196, 0.9370635, -0.3697219, 0.3254902, 1, 0, 1,
-0.5730816, 0.3856454, -0.4368407, 0.3215686, 1, 0, 1,
-0.5698121, -5.247855e-05, -1.455774, 0.3137255, 1, 0, 1,
-0.5692912, 0.507086, -1.617417, 0.3098039, 1, 0, 1,
-0.568361, 1.247671, -1.077706, 0.3019608, 1, 0, 1,
-0.5672582, -0.05749198, -1.058177, 0.2941177, 1, 0, 1,
-0.5667769, 0.8497731, -0.09409458, 0.2901961, 1, 0, 1,
-0.5659142, 0.6124048, -0.9451905, 0.282353, 1, 0, 1,
-0.5657558, 0.612976, -0.8766235, 0.2784314, 1, 0, 1,
-0.5634313, 2.107996, -0.4773732, 0.2705882, 1, 0, 1,
-0.562894, -0.5035338, -2.542792, 0.2666667, 1, 0, 1,
-0.5553099, 1.868694, -2.631002, 0.2588235, 1, 0, 1,
-0.5530407, 1.277684, -1.05395, 0.254902, 1, 0, 1,
-0.5470594, -0.8215064, -2.276911, 0.2470588, 1, 0, 1,
-0.5449367, 0.9105818, -0.1571471, 0.2431373, 1, 0, 1,
-0.5337785, -0.7205452, -0.8864105, 0.2352941, 1, 0, 1,
-0.5322572, -0.09677623, -1.506685, 0.2313726, 1, 0, 1,
-0.5316191, 0.2292439, -2.208191, 0.2235294, 1, 0, 1,
-0.5311354, -0.587427, -1.693374, 0.2196078, 1, 0, 1,
-0.528242, 0.8054311, -0.8246002, 0.2117647, 1, 0, 1,
-0.5262145, 2.296244, -0.194704, 0.2078431, 1, 0, 1,
-0.5169554, -1.436601, -2.767072, 0.2, 1, 0, 1,
-0.5120555, 1.324742, -0.2575274, 0.1921569, 1, 0, 1,
-0.5107445, -1.310629, -3.851875, 0.1882353, 1, 0, 1,
-0.5097079, 1.722194, -0.1629868, 0.1803922, 1, 0, 1,
-0.5092502, 1.625667, 0.01406081, 0.1764706, 1, 0, 1,
-0.5087081, 0.5646128, 0.9905428, 0.1686275, 1, 0, 1,
-0.5064104, 0.7577121, -1.585155, 0.1647059, 1, 0, 1,
-0.5042949, -0.4536011, -1.080403, 0.1568628, 1, 0, 1,
-0.5011568, -0.4391294, -3.916831, 0.1529412, 1, 0, 1,
-0.4971649, -1.223384, -4.239423, 0.145098, 1, 0, 1,
-0.4875622, 2.823459, 1.13001, 0.1411765, 1, 0, 1,
-0.4869175, -0.6477565, -2.126479, 0.1333333, 1, 0, 1,
-0.4847831, -0.4875339, -1.367519, 0.1294118, 1, 0, 1,
-0.4805228, -0.3852769, -1.185109, 0.1215686, 1, 0, 1,
-0.4751755, -1.169591, -4.310902, 0.1176471, 1, 0, 1,
-0.4727778, -0.08510624, -3.534742, 0.1098039, 1, 0, 1,
-0.4687367, -1.414914, -2.74092, 0.1058824, 1, 0, 1,
-0.4672443, -1.11815, -4.951242, 0.09803922, 1, 0, 1,
-0.4609754, -0.8097573, -3.609684, 0.09019608, 1, 0, 1,
-0.4582497, -0.01244911, 0.09119045, 0.08627451, 1, 0, 1,
-0.4558789, -0.8279338, -3.430757, 0.07843138, 1, 0, 1,
-0.4541467, 0.5515146, -1.121061, 0.07450981, 1, 0, 1,
-0.4466234, 0.5104734, -0.7651219, 0.06666667, 1, 0, 1,
-0.4464408, -1.374429, -1.560552, 0.0627451, 1, 0, 1,
-0.4438627, 0.8267127, -1.648612, 0.05490196, 1, 0, 1,
-0.4380556, 2.1557, -0.3970179, 0.05098039, 1, 0, 1,
-0.436132, -0.9235084, -4.335515, 0.04313726, 1, 0, 1,
-0.4360694, -0.722714, -1.409261, 0.03921569, 1, 0, 1,
-0.4342974, -0.4922847, -2.666099, 0.03137255, 1, 0, 1,
-0.4322606, 0.2911322, -0.984008, 0.02745098, 1, 0, 1,
-0.4307342, 1.460154, 0.768282, 0.01960784, 1, 0, 1,
-0.4305637, -0.6386412, -3.565524, 0.01568628, 1, 0, 1,
-0.4302302, 1.338973, -0.9562275, 0.007843138, 1, 0, 1,
-0.4288064, 1.172351, -0.001844365, 0.003921569, 1, 0, 1,
-0.4285791, 0.04286713, -0.2572276, 0, 1, 0.003921569, 1,
-0.4265668, -0.4074537, -3.754326, 0, 1, 0.01176471, 1,
-0.4216398, -0.4306367, -2.730669, 0, 1, 0.01568628, 1,
-0.4187824, 0.1596792, -0.6377867, 0, 1, 0.02352941, 1,
-0.4183058, -1.528261, -3.144647, 0, 1, 0.02745098, 1,
-0.4155573, 0.5246497, -2.210757, 0, 1, 0.03529412, 1,
-0.4143738, 0.6621948, 0.613645, 0, 1, 0.03921569, 1,
-0.4140474, -0.03979732, -2.118761, 0, 1, 0.04705882, 1,
-0.4131404, -0.2351994, -3.543462, 0, 1, 0.05098039, 1,
-0.4117671, 0.2403135, -1.11839, 0, 1, 0.05882353, 1,
-0.4116315, 0.2380616, -0.3608345, 0, 1, 0.0627451, 1,
-0.4099338, -0.451514, -2.759038, 0, 1, 0.07058824, 1,
-0.3970805, 0.5563549, -0.7571793, 0, 1, 0.07450981, 1,
-0.3942341, 1.670094, -2.187944, 0, 1, 0.08235294, 1,
-0.3862151, -0.591494, -2.067852, 0, 1, 0.08627451, 1,
-0.3859307, 0.4692395, 1.09401, 0, 1, 0.09411765, 1,
-0.3828449, 0.4278328, -1.387744, 0, 1, 0.1019608, 1,
-0.3820378, -1.138755, -3.211012, 0, 1, 0.1058824, 1,
-0.381839, -0.5701205, -1.716962, 0, 1, 0.1137255, 1,
-0.3784299, 0.145086, -2.007122, 0, 1, 0.1176471, 1,
-0.3757591, 0.198783, -1.578818, 0, 1, 0.1254902, 1,
-0.3741182, 0.1554504, -1.176963, 0, 1, 0.1294118, 1,
-0.3733262, -0.6310387, -2.21872, 0, 1, 0.1372549, 1,
-0.3692724, -1.052467, -3.357344, 0, 1, 0.1411765, 1,
-0.365307, 0.428282, -1.667482, 0, 1, 0.1490196, 1,
-0.3639511, -1.481763, -2.66593, 0, 1, 0.1529412, 1,
-0.3634681, 1.236922, -0.2260297, 0, 1, 0.1607843, 1,
-0.362951, -0.3419707, -0.844717, 0, 1, 0.1647059, 1,
-0.3598023, 0.9150252, 0.5553011, 0, 1, 0.172549, 1,
-0.3596939, 1.28641, -0.1305965, 0, 1, 0.1764706, 1,
-0.3588411, 0.5634183, 0.1229597, 0, 1, 0.1843137, 1,
-0.3584559, -0.3648291, -2.357588, 0, 1, 0.1882353, 1,
-0.3577419, -0.8480524, -4.088868, 0, 1, 0.1960784, 1,
-0.3566801, 0.59692, 1.116701, 0, 1, 0.2039216, 1,
-0.3563076, 0.2951127, -0.6775009, 0, 1, 0.2078431, 1,
-0.3521571, -3.030221, -2.676207, 0, 1, 0.2156863, 1,
-0.3513297, 0.8304385, 1.31678, 0, 1, 0.2196078, 1,
-0.3457403, 0.8492094, -1.617222, 0, 1, 0.227451, 1,
-0.3417303, -1.649717, -2.554665, 0, 1, 0.2313726, 1,
-0.3412853, 0.4179155, -0.9347941, 0, 1, 0.2392157, 1,
-0.34064, 0.09126826, -0.9407778, 0, 1, 0.2431373, 1,
-0.3405281, 0.1921804, -1.409815, 0, 1, 0.2509804, 1,
-0.3384273, -0.0977607, -1.393266, 0, 1, 0.254902, 1,
-0.3381277, -0.3114074, -3.212909, 0, 1, 0.2627451, 1,
-0.3344843, -0.7160464, -3.381302, 0, 1, 0.2666667, 1,
-0.3343805, -1.087433, -4.25293, 0, 1, 0.2745098, 1,
-0.3336327, -0.5139704, -1.844935, 0, 1, 0.2784314, 1,
-0.3327467, -0.3566374, -1.662798, 0, 1, 0.2862745, 1,
-0.3315828, 0.7555614, -1.95801, 0, 1, 0.2901961, 1,
-0.3307082, 1.317544, 0.2929636, 0, 1, 0.2980392, 1,
-0.3300112, -1.112203, -2.468013, 0, 1, 0.3058824, 1,
-0.329892, 0.266842, -0.1515528, 0, 1, 0.3098039, 1,
-0.3296615, 0.206195, -1.808539, 0, 1, 0.3176471, 1,
-0.3295224, 0.03036957, 0.2652623, 0, 1, 0.3215686, 1,
-0.3250608, 0.2356615, -1.388264, 0, 1, 0.3294118, 1,
-0.32307, 0.1410263, -0.8415363, 0, 1, 0.3333333, 1,
-0.3206363, -1.259148, -2.916446, 0, 1, 0.3411765, 1,
-0.3104832, -0.9477065, -2.385582, 0, 1, 0.345098, 1,
-0.3063003, -1.615329, -4.93319, 0, 1, 0.3529412, 1,
-0.3062073, 1.026025, -1.464976, 0, 1, 0.3568628, 1,
-0.2992218, -0.8447356, -2.729903, 0, 1, 0.3647059, 1,
-0.2964384, -1.711628, -2.923071, 0, 1, 0.3686275, 1,
-0.2951096, -0.01697718, -2.645757, 0, 1, 0.3764706, 1,
-0.2932025, 2.71782, 0.4963703, 0, 1, 0.3803922, 1,
-0.2931921, -0.1842818, -1.53979, 0, 1, 0.3882353, 1,
-0.2912376, 0.8546634, -0.5940015, 0, 1, 0.3921569, 1,
-0.2891034, 0.7956859, 1.132543, 0, 1, 0.4, 1,
-0.2787232, 0.2377705, 0.2215372, 0, 1, 0.4078431, 1,
-0.2773281, -0.9889104, -3.197206, 0, 1, 0.4117647, 1,
-0.2743554, 1.22058, -1.390965, 0, 1, 0.4196078, 1,
-0.2725964, 1.494811, 0.7537934, 0, 1, 0.4235294, 1,
-0.2660397, 0.1187146, -2.633471, 0, 1, 0.4313726, 1,
-0.2623595, 1.166113, -1.427104, 0, 1, 0.4352941, 1,
-0.2492842, 0.3494065, -2.838971, 0, 1, 0.4431373, 1,
-0.24652, 2.323927, 0.3388214, 0, 1, 0.4470588, 1,
-0.2464176, -1.453965, -1.291981, 0, 1, 0.454902, 1,
-0.2434603, -0.198716, -2.903508, 0, 1, 0.4588235, 1,
-0.2430464, -1.241592, -2.897017, 0, 1, 0.4666667, 1,
-0.2427505, -1.360664, -2.231459, 0, 1, 0.4705882, 1,
-0.2423038, 1.080831, 0.2866687, 0, 1, 0.4784314, 1,
-0.2410604, 1.08172, -0.7986593, 0, 1, 0.4823529, 1,
-0.2353063, 2.701373, -0.6197239, 0, 1, 0.4901961, 1,
-0.2338746, -0.2704356, -2.288788, 0, 1, 0.4941176, 1,
-0.2292713, 1.16859, 0.1170629, 0, 1, 0.5019608, 1,
-0.2285541, -1.358353, -2.827917, 0, 1, 0.509804, 1,
-0.2281925, 0.3013117, -1.854426, 0, 1, 0.5137255, 1,
-0.2276764, 1.603034, 0.1448882, 0, 1, 0.5215687, 1,
-0.2226798, 0.4559062, -0.3693374, 0, 1, 0.5254902, 1,
-0.2196217, 0.06685524, -0.774653, 0, 1, 0.5333334, 1,
-0.2195812, 0.045357, -2.477787, 0, 1, 0.5372549, 1,
-0.2161304, 1.3359, -0.7038252, 0, 1, 0.5450981, 1,
-0.2141925, -0.1893437, -0.3184035, 0, 1, 0.5490196, 1,
-0.214035, -1.481884, -3.513892, 0, 1, 0.5568628, 1,
-0.2139228, -0.1584349, -1.821701, 0, 1, 0.5607843, 1,
-0.2131403, 0.1866846, -1.933778, 0, 1, 0.5686275, 1,
-0.208634, 0.4028481, -0.8722743, 0, 1, 0.572549, 1,
-0.2068778, -1.687405, -4.66046, 0, 1, 0.5803922, 1,
-0.2016373, 0.02251617, -2.61136, 0, 1, 0.5843138, 1,
-0.1927941, -0.3659817, -2.975626, 0, 1, 0.5921569, 1,
-0.192045, 0.243223, -1.164571, 0, 1, 0.5960785, 1,
-0.191083, -1.167523, -2.718865, 0, 1, 0.6039216, 1,
-0.1908117, 1.208567, 0.519722, 0, 1, 0.6117647, 1,
-0.1901965, 0.3028204, -0.5164754, 0, 1, 0.6156863, 1,
-0.1888212, 1.164196, -0.219467, 0, 1, 0.6235294, 1,
-0.1886303, 0.5332716, 2.338899, 0, 1, 0.627451, 1,
-0.1870743, -1.801424, -2.576061, 0, 1, 0.6352941, 1,
-0.1826824, 0.6703708, 0.6593114, 0, 1, 0.6392157, 1,
-0.1817472, -0.5380324, -4.286183, 0, 1, 0.6470588, 1,
-0.1792625, -0.4120435, -4.41786, 0, 1, 0.6509804, 1,
-0.1776123, -0.2708958, -3.514109, 0, 1, 0.6588235, 1,
-0.1764251, -0.05803857, -1.50017, 0, 1, 0.6627451, 1,
-0.176373, 0.5316909, 0.9495044, 0, 1, 0.6705883, 1,
-0.1699885, 0.04160189, 0.2255495, 0, 1, 0.6745098, 1,
-0.1649923, 0.01656546, -2.657165, 0, 1, 0.682353, 1,
-0.1647673, 0.5671279, 1.150896, 0, 1, 0.6862745, 1,
-0.1610395, -0.3059381, -2.059741, 0, 1, 0.6941177, 1,
-0.159467, 2.308934, 0.7703753, 0, 1, 0.7019608, 1,
-0.1584464, 0.8426509, -0.558729, 0, 1, 0.7058824, 1,
-0.1569666, 0.01734407, -0.2460283, 0, 1, 0.7137255, 1,
-0.1546061, -1.109214, -3.472412, 0, 1, 0.7176471, 1,
-0.1529959, 0.1252309, -0.6746964, 0, 1, 0.7254902, 1,
-0.1506137, -1.19643, -4.165604, 0, 1, 0.7294118, 1,
-0.1450566, -0.6905442, -3.030381, 0, 1, 0.7372549, 1,
-0.1418038, -0.9474909, -3.052758, 0, 1, 0.7411765, 1,
-0.1405069, 0.4170687, -0.3199762, 0, 1, 0.7490196, 1,
-0.1400222, -1.348655, -2.993478, 0, 1, 0.7529412, 1,
-0.1381689, -1.214207, -2.578157, 0, 1, 0.7607843, 1,
-0.1314273, -0.3894235, -2.965431, 0, 1, 0.7647059, 1,
-0.1296902, 1.124124, -0.9178847, 0, 1, 0.772549, 1,
-0.1290456, 1.204326, -1.327213, 0, 1, 0.7764706, 1,
-0.1279504, 1.311358, -0.02637058, 0, 1, 0.7843137, 1,
-0.1261669, 0.8685006, -0.4269164, 0, 1, 0.7882353, 1,
-0.1208532, -0.1748625, -1.180044, 0, 1, 0.7960784, 1,
-0.1197494, -0.5167291, -4.034069, 0, 1, 0.8039216, 1,
-0.1136686, -0.1718751, -1.474331, 0, 1, 0.8078431, 1,
-0.1120925, 0.5795214, 0.47003, 0, 1, 0.8156863, 1,
-0.1115347, 0.8631158, -0.7453311, 0, 1, 0.8196079, 1,
-0.1028814, -0.07939397, -2.233491, 0, 1, 0.827451, 1,
-0.1017623, -0.4232532, -2.755467, 0, 1, 0.8313726, 1,
-0.09902325, 0.8912199, -1.315982, 0, 1, 0.8392157, 1,
-0.098164, -0.7716547, -3.462379, 0, 1, 0.8431373, 1,
-0.097679, 0.6100063, -0.8265618, 0, 1, 0.8509804, 1,
-0.09757483, -0.5351737, -3.999765, 0, 1, 0.854902, 1,
-0.09349355, 1.062482, 0.5578902, 0, 1, 0.8627451, 1,
-0.09244018, -1.517272, -4.0329, 0, 1, 0.8666667, 1,
-0.09028158, -0.1063237, -0.6203935, 0, 1, 0.8745098, 1,
-0.08606316, -2.257421, -3.121465, 0, 1, 0.8784314, 1,
-0.08277021, 0.1009872, 0.1032456, 0, 1, 0.8862745, 1,
-0.07904538, -2.008038, -3.453188, 0, 1, 0.8901961, 1,
-0.07774379, -1.837526, -3.655182, 0, 1, 0.8980392, 1,
-0.07606442, -0.4629487, -1.933656, 0, 1, 0.9058824, 1,
-0.07464992, 0.6881112, -0.3387018, 0, 1, 0.9098039, 1,
-0.06989343, 0.2317585, 0.9387666, 0, 1, 0.9176471, 1,
-0.06892211, -0.6246392, -5.615044, 0, 1, 0.9215686, 1,
-0.05981549, -1.79796, -3.772756, 0, 1, 0.9294118, 1,
-0.05894278, -0.294753, -3.537499, 0, 1, 0.9333333, 1,
-0.05845892, 0.9980019, -1.394465, 0, 1, 0.9411765, 1,
-0.05590642, -1.530445, -1.586914, 0, 1, 0.945098, 1,
-0.05053566, 0.0366699, -1.38064, 0, 1, 0.9529412, 1,
-0.04831745, -0.1902761, -2.376183, 0, 1, 0.9568627, 1,
-0.04414186, 0.9990715, -0.9548092, 0, 1, 0.9647059, 1,
-0.04151089, 0.6941965, 1.113804, 0, 1, 0.9686275, 1,
-0.0408476, -1.11917, -3.593168, 0, 1, 0.9764706, 1,
-0.03798262, 0.3614223, 0.6488548, 0, 1, 0.9803922, 1,
-0.03783115, 0.1039222, 0.8301648, 0, 1, 0.9882353, 1,
-0.035298, 1.559429, -0.1465399, 0, 1, 0.9921569, 1,
-0.03422522, 0.4188396, -0.4446778, 0, 1, 1, 1,
-0.03350538, 0.1901097, -0.4018286, 0, 0.9921569, 1, 1,
-0.03246387, -0.02842925, -3.854292, 0, 0.9882353, 1, 1,
-0.03162142, -0.7235829, -2.332397, 0, 0.9803922, 1, 1,
-0.02938191, 0.9574952, 1.522023, 0, 0.9764706, 1, 1,
-0.02873703, -1.722464, -4.359698, 0, 0.9686275, 1, 1,
-0.02824926, 0.1220846, -0.03997158, 0, 0.9647059, 1, 1,
-0.02764206, 1.117462, 1.138901, 0, 0.9568627, 1, 1,
-0.02193593, -1.18794, -2.478507, 0, 0.9529412, 1, 1,
-0.01845748, -0.7517988, -3.676544, 0, 0.945098, 1, 1,
-0.01724206, -0.9689092, -3.842055, 0, 0.9411765, 1, 1,
-0.01615144, -0.2601959, -3.975177, 0, 0.9333333, 1, 1,
-0.009911234, -0.7162803, -0.6886678, 0, 0.9294118, 1, 1,
-0.009037315, -0.808649, -2.560893, 0, 0.9215686, 1, 1,
-0.008844804, 2.470043, -0.6811275, 0, 0.9176471, 1, 1,
-0.008667083, -0.2623785, -4.790809, 0, 0.9098039, 1, 1,
0.001273424, -0.2907369, 4.013283, 0, 0.9058824, 1, 1,
0.003177119, -0.3388664, 3.529946, 0, 0.8980392, 1, 1,
0.007236961, 0.6359521, -1.145093, 0, 0.8901961, 1, 1,
0.01251919, 0.3543565, 1.13504, 0, 0.8862745, 1, 1,
0.01780906, 0.7328685, -0.3257066, 0, 0.8784314, 1, 1,
0.02138663, -0.06453647, 3.228796, 0, 0.8745098, 1, 1,
0.02473917, 0.8867669, -1.347805, 0, 0.8666667, 1, 1,
0.03103472, -0.940657, 3.717564, 0, 0.8627451, 1, 1,
0.03484406, 0.5250289, -0.3797108, 0, 0.854902, 1, 1,
0.03615919, 0.2396265, 0.8590987, 0, 0.8509804, 1, 1,
0.03636197, -0.177093, 2.323953, 0, 0.8431373, 1, 1,
0.03873559, -0.7571036, 3.528097, 0, 0.8392157, 1, 1,
0.04192916, -0.251224, 3.602973, 0, 0.8313726, 1, 1,
0.04640034, -0.1389882, 3.01352, 0, 0.827451, 1, 1,
0.04706194, -2.035026, 1.317918, 0, 0.8196079, 1, 1,
0.04897226, -0.8534581, 3.579672, 0, 0.8156863, 1, 1,
0.0521984, -0.09613259, 2.210511, 0, 0.8078431, 1, 1,
0.05372085, 1.097671, 1.378202, 0, 0.8039216, 1, 1,
0.05815466, 1.433823, 0.1686685, 0, 0.7960784, 1, 1,
0.05965509, -2.15993, 2.957545, 0, 0.7882353, 1, 1,
0.06742363, -0.7506132, 3.815396, 0, 0.7843137, 1, 1,
0.06819996, -0.2234533, 2.376637, 0, 0.7764706, 1, 1,
0.0743464, 1.519147, 1.415545, 0, 0.772549, 1, 1,
0.07460457, 2.437095, -0.5497012, 0, 0.7647059, 1, 1,
0.0759809, -2.033561, 3.431663, 0, 0.7607843, 1, 1,
0.07630651, 0.2051636, -0.4140048, 0, 0.7529412, 1, 1,
0.08058554, -0.6831878, 0.9403358, 0, 0.7490196, 1, 1,
0.0867101, -0.8107675, 3.979637, 0, 0.7411765, 1, 1,
0.09026324, -1.002623, 2.699829, 0, 0.7372549, 1, 1,
0.09405766, -0.4494775, 1.357463, 0, 0.7294118, 1, 1,
0.1044693, -0.3596986, 2.439995, 0, 0.7254902, 1, 1,
0.1066609, -0.658904, 1.71895, 0, 0.7176471, 1, 1,
0.1096876, -0.7530189, 2.813071, 0, 0.7137255, 1, 1,
0.1109884, -2.727593, 4.804573, 0, 0.7058824, 1, 1,
0.1109913, -1.558575, 3.56122, 0, 0.6980392, 1, 1,
0.1125271, -0.8893808, 2.111636, 0, 0.6941177, 1, 1,
0.116626, 0.7935086, 2.052653, 0, 0.6862745, 1, 1,
0.1167509, -1.367007, 2.795063, 0, 0.682353, 1, 1,
0.1183321, 0.5557442, 1.595192, 0, 0.6745098, 1, 1,
0.1189099, 1.185208, -0.5001146, 0, 0.6705883, 1, 1,
0.1199322, -1.359239, 1.83844, 0, 0.6627451, 1, 1,
0.1264699, 0.06766028, 1.274807, 0, 0.6588235, 1, 1,
0.128098, 0.2949425, 1.250541, 0, 0.6509804, 1, 1,
0.1303923, 1.368179, 0.687435, 0, 0.6470588, 1, 1,
0.1309096, 0.5060194, -1.00582, 0, 0.6392157, 1, 1,
0.1415249, 0.1480181, 1.75326, 0, 0.6352941, 1, 1,
0.1433887, -1.388162, 3.129539, 0, 0.627451, 1, 1,
0.1434245, -1.126226, 3.687253, 0, 0.6235294, 1, 1,
0.1501711, -0.6691847, 2.430433, 0, 0.6156863, 1, 1,
0.1504036, 0.7126784, -0.9087884, 0, 0.6117647, 1, 1,
0.1519841, -0.08915253, -0.1330897, 0, 0.6039216, 1, 1,
0.1573433, 0.4836988, 0.7282906, 0, 0.5960785, 1, 1,
0.1595598, 0.2016045, 0.7497798, 0, 0.5921569, 1, 1,
0.1637954, 1.76019, 0.3264951, 0, 0.5843138, 1, 1,
0.1672485, -2.064575, 5.531663, 0, 0.5803922, 1, 1,
0.1689256, 0.2376177, 1.719593, 0, 0.572549, 1, 1,
0.1690401, -0.0003727799, 2.405336, 0, 0.5686275, 1, 1,
0.1721261, 1.024523, -0.3295285, 0, 0.5607843, 1, 1,
0.1729483, 0.4967549, 0.1455446, 0, 0.5568628, 1, 1,
0.1805881, 0.641043, 1.266719, 0, 0.5490196, 1, 1,
0.1812695, 0.5194769, 2.350854, 0, 0.5450981, 1, 1,
0.1813955, -0.4105167, 1.740862, 0, 0.5372549, 1, 1,
0.181606, -0.2797807, 4.454605, 0, 0.5333334, 1, 1,
0.1819282, 0.561169, -0.4876179, 0, 0.5254902, 1, 1,
0.1824974, -0.1466879, 1.846843, 0, 0.5215687, 1, 1,
0.1825065, -0.448168, 2.162524, 0, 0.5137255, 1, 1,
0.1831508, -0.005535628, 2.403729, 0, 0.509804, 1, 1,
0.1840354, 0.9997331, 0.9873272, 0, 0.5019608, 1, 1,
0.1871251, -0.4051582, 1.667077, 0, 0.4941176, 1, 1,
0.1923924, -2.618933, 2.240907, 0, 0.4901961, 1, 1,
0.1960962, -0.9856081, 2.499456, 0, 0.4823529, 1, 1,
0.1984886, -0.1176359, 1.59381, 0, 0.4784314, 1, 1,
0.1991081, -2.231036, 3.696393, 0, 0.4705882, 1, 1,
0.2036021, -0.7386648, 3.327285, 0, 0.4666667, 1, 1,
0.2041272, 1.664466, -0.576989, 0, 0.4588235, 1, 1,
0.2052863, 0.6855535, -0.06682126, 0, 0.454902, 1, 1,
0.2057482, -1.281541, 3.721533, 0, 0.4470588, 1, 1,
0.2082172, -1.83559, 3.127712, 0, 0.4431373, 1, 1,
0.2144274, 0.07754932, 1.761769, 0, 0.4352941, 1, 1,
0.2157945, -2.11974, 2.034791, 0, 0.4313726, 1, 1,
0.2238904, -0.8286825, 3.803898, 0, 0.4235294, 1, 1,
0.2256961, 2.560414, 0.2372293, 0, 0.4196078, 1, 1,
0.2266145, 0.9288145, 0.6733469, 0, 0.4117647, 1, 1,
0.2269721, 0.2232275, 1.713708, 0, 0.4078431, 1, 1,
0.2270983, 0.681386, 2.342563, 0, 0.4, 1, 1,
0.2277496, 1.801109, 0.390088, 0, 0.3921569, 1, 1,
0.2281356, -1.32083, 4.278815, 0, 0.3882353, 1, 1,
0.2342156, 2.498736, -0.5375383, 0, 0.3803922, 1, 1,
0.2381894, 0.6552492, -0.8165318, 0, 0.3764706, 1, 1,
0.23955, -0.58221, 4.146573, 0, 0.3686275, 1, 1,
0.2402773, 1.283376, 0.3047698, 0, 0.3647059, 1, 1,
0.2434455, 0.4952561, -0.7811093, 0, 0.3568628, 1, 1,
0.2479058, 1.772562, -0.1963546, 0, 0.3529412, 1, 1,
0.2519474, 1.234184, -1.362156, 0, 0.345098, 1, 1,
0.2533384, -0.3095711, 1.689287, 0, 0.3411765, 1, 1,
0.2560934, -0.2903743, 1.742036, 0, 0.3333333, 1, 1,
0.2586859, -0.7549464, 2.711425, 0, 0.3294118, 1, 1,
0.2594947, 1.212046, 2.511345, 0, 0.3215686, 1, 1,
0.2598061, 0.6978775, -1.113552, 0, 0.3176471, 1, 1,
0.2599029, -0.8149796, 0.7995923, 0, 0.3098039, 1, 1,
0.2645084, -0.9751378, 2.468286, 0, 0.3058824, 1, 1,
0.2653145, 0.6204371, 0.7121743, 0, 0.2980392, 1, 1,
0.2667344, 0.9458856, 0.2688495, 0, 0.2901961, 1, 1,
0.267334, 0.1983933, 1.523777, 0, 0.2862745, 1, 1,
0.2691959, -0.5630098, 4.453412, 0, 0.2784314, 1, 1,
0.2737149, -0.0216716, 1.775139, 0, 0.2745098, 1, 1,
0.2863986, 0.530234, -0.09034588, 0, 0.2666667, 1, 1,
0.2955693, 0.008105412, 1.322823, 0, 0.2627451, 1, 1,
0.2960499, 1.049341, 0.1669952, 0, 0.254902, 1, 1,
0.2988604, 0.07713139, 2.294331, 0, 0.2509804, 1, 1,
0.2990456, 0.5754555, 1.837642, 0, 0.2431373, 1, 1,
0.3001194, -0.7509855, 1.193303, 0, 0.2392157, 1, 1,
0.3005586, -1.6421, 4.894138, 0, 0.2313726, 1, 1,
0.3006365, 1.137354, 0.8824234, 0, 0.227451, 1, 1,
0.3009607, -1.094608, 3.958986, 0, 0.2196078, 1, 1,
0.3049819, 0.5419878, 1.552789, 0, 0.2156863, 1, 1,
0.3083973, 0.9495968, 1.288899, 0, 0.2078431, 1, 1,
0.3128197, 0.7187908, -0.2749786, 0, 0.2039216, 1, 1,
0.3134146, -0.6530606, 2.801313, 0, 0.1960784, 1, 1,
0.3145816, 0.07596345, 2.941668, 0, 0.1882353, 1, 1,
0.3168218, -0.9124348, 3.433002, 0, 0.1843137, 1, 1,
0.325978, 0.187334, 0.2916648, 0, 0.1764706, 1, 1,
0.3270026, -0.7218109, 2.216766, 0, 0.172549, 1, 1,
0.329015, 1.274253, -0.3446368, 0, 0.1647059, 1, 1,
0.329179, 1.306084, 1.705648, 0, 0.1607843, 1, 1,
0.3325084, -0.4036879, 1.2751, 0, 0.1529412, 1, 1,
0.3336841, -0.4683667, 2.052285, 0, 0.1490196, 1, 1,
0.3347733, 0.6396722, -1.006504, 0, 0.1411765, 1, 1,
0.3379533, -0.924379, 3.681107, 0, 0.1372549, 1, 1,
0.3411016, -0.6394414, 2.068202, 0, 0.1294118, 1, 1,
0.3431713, 1.417343, -1.077873, 0, 0.1254902, 1, 1,
0.3440157, 0.8249926, 3.756136, 0, 0.1176471, 1, 1,
0.3452905, 0.4400385, 1.700769, 0, 0.1137255, 1, 1,
0.3502261, 1.323866, 0.5889983, 0, 0.1058824, 1, 1,
0.3522415, -1.976493, 1.311221, 0, 0.09803922, 1, 1,
0.3535495, -0.3158695, 2.907951, 0, 0.09411765, 1, 1,
0.3536351, 1.194565, -0.08335117, 0, 0.08627451, 1, 1,
0.3546979, -0.5412417, 2.10905, 0, 0.08235294, 1, 1,
0.3548428, 0.619759, -0.9860643, 0, 0.07450981, 1, 1,
0.3617427, -1.470437, 2.558481, 0, 0.07058824, 1, 1,
0.3618938, -0.04819429, 2.27138, 0, 0.0627451, 1, 1,
0.3640018, 0.7049721, 1.11305, 0, 0.05882353, 1, 1,
0.3662308, 0.6306737, 1.414197, 0, 0.05098039, 1, 1,
0.3668485, -1.111436, 2.407144, 0, 0.04705882, 1, 1,
0.3687717, 0.1256003, 3.156204, 0, 0.03921569, 1, 1,
0.3736473, -1.092743, 2.853005, 0, 0.03529412, 1, 1,
0.3778186, -0.311955, 4.603455, 0, 0.02745098, 1, 1,
0.3810273, 0.646888, 2.053322, 0, 0.02352941, 1, 1,
0.3811232, -0.214571, 1.556318, 0, 0.01568628, 1, 1,
0.3843347, -0.3506304, 2.500619, 0, 0.01176471, 1, 1,
0.3854817, 1.313042, 0.5962387, 0, 0.003921569, 1, 1,
0.3936687, -0.1050159, 2.161981, 0.003921569, 0, 1, 1,
0.4004299, -0.09170955, 0.8011062, 0.007843138, 0, 1, 1,
0.4048625, 0.2154748, 0.2100311, 0.01568628, 0, 1, 1,
0.4057947, -0.8289189, 4.216339, 0.01960784, 0, 1, 1,
0.4061696, -0.876145, 4.088978, 0.02745098, 0, 1, 1,
0.4071368, 1.653309, -2.297407, 0.03137255, 0, 1, 1,
0.4075595, 1.429844, 0.3827242, 0.03921569, 0, 1, 1,
0.4079048, -1.180803, 3.570038, 0.04313726, 0, 1, 1,
0.4083842, -1.641831, 4.098641, 0.05098039, 0, 1, 1,
0.4108748, -0.2702435, 2.200099, 0.05490196, 0, 1, 1,
0.4147629, -1.29514, 2.703269, 0.0627451, 0, 1, 1,
0.4202178, 0.5207754, 1.800636, 0.06666667, 0, 1, 1,
0.4219795, -0.589567, 1.819131, 0.07450981, 0, 1, 1,
0.428821, -0.7587317, 2.192889, 0.07843138, 0, 1, 1,
0.4297958, -0.2033207, 1.731958, 0.08627451, 0, 1, 1,
0.4300753, -0.3512522, 0.8910831, 0.09019608, 0, 1, 1,
0.4352107, -0.6912796, 1.914638, 0.09803922, 0, 1, 1,
0.4358362, -1.09594, 1.272279, 0.1058824, 0, 1, 1,
0.436206, 1.592154, 1.151433, 0.1098039, 0, 1, 1,
0.4401424, 0.2990113, 2.326781, 0.1176471, 0, 1, 1,
0.4443516, -1.406359, 2.366452, 0.1215686, 0, 1, 1,
0.4453441, 2.239509, 0.905064, 0.1294118, 0, 1, 1,
0.4461947, -0.2459042, 1.301568, 0.1333333, 0, 1, 1,
0.4471931, 0.3866377, 0.3481762, 0.1411765, 0, 1, 1,
0.4531777, 0.3475963, -0.3856022, 0.145098, 0, 1, 1,
0.45397, 0.396576, 0.5208905, 0.1529412, 0, 1, 1,
0.4700815, 1.230345, -0.09323855, 0.1568628, 0, 1, 1,
0.4710574, 0.8076909, 0.125279, 0.1647059, 0, 1, 1,
0.4780198, -1.835372, 6.222136, 0.1686275, 0, 1, 1,
0.4798025, 0.05757118, 0.150421, 0.1764706, 0, 1, 1,
0.4799917, 3.265979, -0.8000789, 0.1803922, 0, 1, 1,
0.4818527, 0.9647114, 1.196799, 0.1882353, 0, 1, 1,
0.485134, -0.3907026, 3.092141, 0.1921569, 0, 1, 1,
0.4852903, -0.3530658, 2.168529, 0.2, 0, 1, 1,
0.4895365, 1.30076, 0.2369702, 0.2078431, 0, 1, 1,
0.4917591, 0.943552, 1.416041, 0.2117647, 0, 1, 1,
0.4960042, 1.267527, -0.5380868, 0.2196078, 0, 1, 1,
0.4994608, 1.308933, -1.066367, 0.2235294, 0, 1, 1,
0.5009866, 1.190159, -0.5442909, 0.2313726, 0, 1, 1,
0.506845, -0.06224706, 1.263702, 0.2352941, 0, 1, 1,
0.5085207, 0.4339845, 1.679128, 0.2431373, 0, 1, 1,
0.5117818, -1.632582, 3.604224, 0.2470588, 0, 1, 1,
0.5134835, 0.9634157, 0.1225175, 0.254902, 0, 1, 1,
0.5155407, 0.6294905, 0.7991534, 0.2588235, 0, 1, 1,
0.5164497, -1.478872, 3.399777, 0.2666667, 0, 1, 1,
0.5165005, -0.4325128, 1.720839, 0.2705882, 0, 1, 1,
0.5165809, -1.551549, 2.922859, 0.2784314, 0, 1, 1,
0.5193656, -0.742512, 3.193748, 0.282353, 0, 1, 1,
0.5209922, 0.3803952, 0.5684056, 0.2901961, 0, 1, 1,
0.5212124, -0.2025283, 2.186676, 0.2941177, 0, 1, 1,
0.5247558, -0.3822401, 2.173399, 0.3019608, 0, 1, 1,
0.5248025, -1.253998, 2.545842, 0.3098039, 0, 1, 1,
0.5271236, 0.259278, -0.2455332, 0.3137255, 0, 1, 1,
0.5286459, -1.003805, 2.6803, 0.3215686, 0, 1, 1,
0.5306911, -0.7221664, 4.157019, 0.3254902, 0, 1, 1,
0.5312316, 0.2505054, 0.8905774, 0.3333333, 0, 1, 1,
0.5314317, -1.043805, 2.130586, 0.3372549, 0, 1, 1,
0.5332612, 1.428902, 0.4287054, 0.345098, 0, 1, 1,
0.5344353, -0.7298778, 1.298391, 0.3490196, 0, 1, 1,
0.5372975, -0.07570063, -0.1483239, 0.3568628, 0, 1, 1,
0.5382733, -0.3564708, 0.6253334, 0.3607843, 0, 1, 1,
0.5412166, -1.225165, 3.78638, 0.3686275, 0, 1, 1,
0.5480297, 0.1034469, 2.83432, 0.372549, 0, 1, 1,
0.550618, -1.03166, 2.359548, 0.3803922, 0, 1, 1,
0.5509614, -1.085343, 3.005429, 0.3843137, 0, 1, 1,
0.5509962, -2.296166, 2.975897, 0.3921569, 0, 1, 1,
0.5521894, -0.3866884, 0.8694955, 0.3960784, 0, 1, 1,
0.5549163, -0.07859186, 1.207298, 0.4039216, 0, 1, 1,
0.5591382, 1.041322, 1.389539, 0.4117647, 0, 1, 1,
0.5601103, 1.14878, 1.251174, 0.4156863, 0, 1, 1,
0.5615274, 0.8209449, 1.745427, 0.4235294, 0, 1, 1,
0.5642839, 0.5760219, 2.366954, 0.427451, 0, 1, 1,
0.570637, 0.0227351, -0.03173041, 0.4352941, 0, 1, 1,
0.5726231, 0.1813394, 2.950754, 0.4392157, 0, 1, 1,
0.5729304, 0.564198, 0.6848662, 0.4470588, 0, 1, 1,
0.5768421, 1.52536, -0.4208313, 0.4509804, 0, 1, 1,
0.578363, -0.5503926, 2.002716, 0.4588235, 0, 1, 1,
0.5792433, 0.9929792, 0.5670391, 0.4627451, 0, 1, 1,
0.5802701, 1.613071, -0.8869186, 0.4705882, 0, 1, 1,
0.5870395, 0.8610827, 0.05018071, 0.4745098, 0, 1, 1,
0.5872239, -1.023899, 3.831802, 0.4823529, 0, 1, 1,
0.5898588, 0.792006, 0.4460942, 0.4862745, 0, 1, 1,
0.5928087, 1.582038, 0.8860433, 0.4941176, 0, 1, 1,
0.5943438, 0.453899, 1.01708, 0.5019608, 0, 1, 1,
0.6005325, 1.460678, -0.6428241, 0.5058824, 0, 1, 1,
0.6006669, -0.5926963, 1.219988, 0.5137255, 0, 1, 1,
0.6008292, 1.004847, -0.5963801, 0.5176471, 0, 1, 1,
0.6063118, -0.4242732, 2.77063, 0.5254902, 0, 1, 1,
0.6065838, -0.6208637, 1.007063, 0.5294118, 0, 1, 1,
0.6085109, 1.924642, 0.615202, 0.5372549, 0, 1, 1,
0.6201226, 0.04771071, 2.023711, 0.5411765, 0, 1, 1,
0.6301011, -0.07922965, 2.830244, 0.5490196, 0, 1, 1,
0.6333114, -0.2605134, 2.828848, 0.5529412, 0, 1, 1,
0.6365731, -0.951188, 0.7965416, 0.5607843, 0, 1, 1,
0.6372702, -0.791813, 1.608879, 0.5647059, 0, 1, 1,
0.6372907, 1.531639, 1.947379, 0.572549, 0, 1, 1,
0.6397002, -1.418353, 3.011561, 0.5764706, 0, 1, 1,
0.6418671, 0.1341244, 0.5015741, 0.5843138, 0, 1, 1,
0.6433654, -0.01160613, 2.876146, 0.5882353, 0, 1, 1,
0.6440915, 0.6183544, 0.08997048, 0.5960785, 0, 1, 1,
0.6508499, 0.8412726, 0.6297368, 0.6039216, 0, 1, 1,
0.6542568, -0.8363255, 2.179587, 0.6078432, 0, 1, 1,
0.6563089, 0.7095896, 3.39737, 0.6156863, 0, 1, 1,
0.6595949, -0.02430921, 1.076916, 0.6196079, 0, 1, 1,
0.6650811, -2.01107, 4.283839, 0.627451, 0, 1, 1,
0.6707267, -0.05878021, 0.8063937, 0.6313726, 0, 1, 1,
0.6709644, 0.5095849, 1.313955, 0.6392157, 0, 1, 1,
0.673057, -0.009032724, 1.454169, 0.6431373, 0, 1, 1,
0.674583, -0.8380778, 3.255198, 0.6509804, 0, 1, 1,
0.6746256, 1.045989, 2.602258, 0.654902, 0, 1, 1,
0.6840825, 0.3169315, 0.3627078, 0.6627451, 0, 1, 1,
0.6882606, 1.107101, -0.4452549, 0.6666667, 0, 1, 1,
0.688907, -1.342046, 2.178853, 0.6745098, 0, 1, 1,
0.6919181, -0.236611, 2.927771, 0.6784314, 0, 1, 1,
0.6921353, -0.9387909, 2.085057, 0.6862745, 0, 1, 1,
0.6928827, -0.2851736, 3.281436, 0.6901961, 0, 1, 1,
0.6936159, 0.6635556, 1.245505, 0.6980392, 0, 1, 1,
0.6937527, 0.7982966, -2.190187, 0.7058824, 0, 1, 1,
0.6953917, 0.751122, -0.9672806, 0.7098039, 0, 1, 1,
0.697009, 1.068237, 1.811552, 0.7176471, 0, 1, 1,
0.6983274, -0.7812746, 1.520378, 0.7215686, 0, 1, 1,
0.7005144, -0.9144624, 0.07374457, 0.7294118, 0, 1, 1,
0.7033705, 1.259245, 0.7791603, 0.7333333, 0, 1, 1,
0.7042961, -0.8803001, 1.943357, 0.7411765, 0, 1, 1,
0.708405, 0.4370326, 0.6709872, 0.7450981, 0, 1, 1,
0.7093682, -1.791844, 1.20029, 0.7529412, 0, 1, 1,
0.7095875, -0.2156615, 2.413867, 0.7568628, 0, 1, 1,
0.7119545, -0.2595389, 0.685362, 0.7647059, 0, 1, 1,
0.7161989, 0.1720358, -0.591697, 0.7686275, 0, 1, 1,
0.7180344, 1.011174, -0.3779866, 0.7764706, 0, 1, 1,
0.7188292, -0.2171977, 1.35869, 0.7803922, 0, 1, 1,
0.7203157, -0.7725483, 2.908839, 0.7882353, 0, 1, 1,
0.7235137, -0.7376152, 2.457493, 0.7921569, 0, 1, 1,
0.7269583, -0.08470211, 0.113832, 0.8, 0, 1, 1,
0.730297, 0.474352, 1.422742, 0.8078431, 0, 1, 1,
0.7304779, -1.297727, 3.021586, 0.8117647, 0, 1, 1,
0.7346558, 0.5351957, 0.311093, 0.8196079, 0, 1, 1,
0.7432145, 1.075036, 1.270296, 0.8235294, 0, 1, 1,
0.7435764, 1.726435, 0.07263568, 0.8313726, 0, 1, 1,
0.7558164, -1.311751, 2.676552, 0.8352941, 0, 1, 1,
0.7562205, 0.6571719, 2.345958, 0.8431373, 0, 1, 1,
0.7638057, 0.4398631, -1.078442, 0.8470588, 0, 1, 1,
0.7645928, 0.81274, 0.6518176, 0.854902, 0, 1, 1,
0.7727698, -0.09565008, 1.586563, 0.8588235, 0, 1, 1,
0.7747593, -1.818464, 2.994081, 0.8666667, 0, 1, 1,
0.775331, -0.809631, 4.177581, 0.8705882, 0, 1, 1,
0.7771039, -0.5377354, 2.154196, 0.8784314, 0, 1, 1,
0.7825809, 0.04042274, 2.265066, 0.8823529, 0, 1, 1,
0.785877, -0.5896527, 4.549127, 0.8901961, 0, 1, 1,
0.7869746, 0.3232478, 0.60294, 0.8941177, 0, 1, 1,
0.7923251, 0.8812102, 0.1351031, 0.9019608, 0, 1, 1,
0.7927991, -1.812921, 2.674965, 0.9098039, 0, 1, 1,
0.7933467, -0.3182232, 1.927928, 0.9137255, 0, 1, 1,
0.794701, 0.0982741, 1.765283, 0.9215686, 0, 1, 1,
0.7959743, -1.012018, 2.978047, 0.9254902, 0, 1, 1,
0.7986544, -1.311956, 1.025302, 0.9333333, 0, 1, 1,
0.8050151, 0.5826081, 1.807339, 0.9372549, 0, 1, 1,
0.8128709, -2.248994, 2.713272, 0.945098, 0, 1, 1,
0.8185365, -0.268645, 2.450135, 0.9490196, 0, 1, 1,
0.824049, 1.459307, 2.364643, 0.9568627, 0, 1, 1,
0.8365183, -0.9237246, 3.445382, 0.9607843, 0, 1, 1,
0.8443378, -0.9338128, 3.437679, 0.9686275, 0, 1, 1,
0.8453316, -0.3689933, 1.978609, 0.972549, 0, 1, 1,
0.8531562, -0.8123922, 1.911034, 0.9803922, 0, 1, 1,
0.854205, 0.7580479, 1.472661, 0.9843137, 0, 1, 1,
0.8562787, 2.440401, 1.107848, 0.9921569, 0, 1, 1,
0.8581408, -0.4746191, 1.690212, 0.9960784, 0, 1, 1,
0.858337, 1.916956, -0.02372839, 1, 0, 0.9960784, 1,
0.8622141, -1.124913, 2.693159, 1, 0, 0.9882353, 1,
0.8629004, -0.3703397, 0.8150368, 1, 0, 0.9843137, 1,
0.8792771, 1.840822, -0.8407131, 1, 0, 0.9764706, 1,
0.8804845, -0.02831743, 1.349599, 1, 0, 0.972549, 1,
0.8841698, 0.1679145, 0.7419181, 1, 0, 0.9647059, 1,
0.8890573, -0.8136222, 2.065714, 1, 0, 0.9607843, 1,
0.8925658, 0.5035157, 1.155745, 1, 0, 0.9529412, 1,
0.8952522, -1.279671, 2.212057, 1, 0, 0.9490196, 1,
0.9050176, -0.4741252, 2.914653, 1, 0, 0.9411765, 1,
0.9060015, -1.172471, 3.097903, 1, 0, 0.9372549, 1,
0.9117275, 0.04511474, 2.582249, 1, 0, 0.9294118, 1,
0.9121425, 0.1557769, 3.16222, 1, 0, 0.9254902, 1,
0.91293, -1.544895, 3.784603, 1, 0, 0.9176471, 1,
0.9155076, -0.1422653, 1.640998, 1, 0, 0.9137255, 1,
0.9155549, -0.2545893, 1.37906, 1, 0, 0.9058824, 1,
0.917854, -0.1569653, 0.6777713, 1, 0, 0.9019608, 1,
0.9207056, 0.166503, 0.8525, 1, 0, 0.8941177, 1,
0.9216404, -0.7477536, 1.214147, 1, 0, 0.8862745, 1,
0.9223397, -0.5594867, 3.938917, 1, 0, 0.8823529, 1,
0.9273863, -0.5202494, 2.655698, 1, 0, 0.8745098, 1,
0.9339956, -0.856248, 1.868737, 1, 0, 0.8705882, 1,
0.9530889, -1.190059, 2.207444, 1, 0, 0.8627451, 1,
0.9569873, 1.652369, 0.4243148, 1, 0, 0.8588235, 1,
0.9673889, -0.6270975, 0.5032249, 1, 0, 0.8509804, 1,
0.9857584, 0.4204015, 1.247568, 1, 0, 0.8470588, 1,
0.9956921, -0.9880611, 2.014797, 1, 0, 0.8392157, 1,
1.005232, -0.7726171, 3.842417, 1, 0, 0.8352941, 1,
1.012581, -0.5381348, 0.6801403, 1, 0, 0.827451, 1,
1.012814, 0.3447997, 3.252376, 1, 0, 0.8235294, 1,
1.019013, -0.3566783, 2.398655, 1, 0, 0.8156863, 1,
1.019875, -1.787421, -0.2956007, 1, 0, 0.8117647, 1,
1.020446, 0.04390056, 3.232257, 1, 0, 0.8039216, 1,
1.026695, -1.722976, 1.925781, 1, 0, 0.7960784, 1,
1.051002, -0.2414289, 1.934065, 1, 0, 0.7921569, 1,
1.055666, 0.1743635, 2.537273, 1, 0, 0.7843137, 1,
1.056061, -0.3720865, 3.213196, 1, 0, 0.7803922, 1,
1.057821, 0.5901977, 2.144359, 1, 0, 0.772549, 1,
1.068934, 0.5255477, 0.9490495, 1, 0, 0.7686275, 1,
1.071793, 0.4548759, 0.5654683, 1, 0, 0.7607843, 1,
1.071872, 0.939222, -0.5536965, 1, 0, 0.7568628, 1,
1.082098, -0.1707352, 2.528438, 1, 0, 0.7490196, 1,
1.082902, 0.6658286, 1.436927, 1, 0, 0.7450981, 1,
1.094181, -1.349104, 1.670328, 1, 0, 0.7372549, 1,
1.098487, 0.3975175, 1.430166, 1, 0, 0.7333333, 1,
1.09955, -1.649664, 2.696608, 1, 0, 0.7254902, 1,
1.102353, 0.4076294, 1.037785, 1, 0, 0.7215686, 1,
1.108066, -1.843606, 3.589514, 1, 0, 0.7137255, 1,
1.112506, -0.266681, 1.575155, 1, 0, 0.7098039, 1,
1.120954, 0.7894, 2.242874, 1, 0, 0.7019608, 1,
1.121698, 0.9783036, 0.9478722, 1, 0, 0.6941177, 1,
1.126815, 1.395291, 0.9397534, 1, 0, 0.6901961, 1,
1.133454, -0.2993484, 1.777787, 1, 0, 0.682353, 1,
1.142061, -0.2718208, -0.2187665, 1, 0, 0.6784314, 1,
1.145589, -0.2150822, 1.806911, 1, 0, 0.6705883, 1,
1.148584, 1.394986, 0.3014199, 1, 0, 0.6666667, 1,
1.150997, 1.855741, -0.2317909, 1, 0, 0.6588235, 1,
1.175446, -0.2413609, 2.601037, 1, 0, 0.654902, 1,
1.175475, -1.416833, 2.12627, 1, 0, 0.6470588, 1,
1.183098, 1.033239, 0.07571413, 1, 0, 0.6431373, 1,
1.190075, -0.4216431, 2.018318, 1, 0, 0.6352941, 1,
1.19867, -1.076372, 1.928745, 1, 0, 0.6313726, 1,
1.201266, -0.7391534, 2.338233, 1, 0, 0.6235294, 1,
1.201949, 0.3279151, 1.688499, 1, 0, 0.6196079, 1,
1.202339, 1.69739, 0.4345097, 1, 0, 0.6117647, 1,
1.210614, 0.8794575, 1.048242, 1, 0, 0.6078432, 1,
1.230235, -0.8270655, 2.468856, 1, 0, 0.6, 1,
1.244346, -0.794146, 1.04433, 1, 0, 0.5921569, 1,
1.249081, -1.028661, 0.925839, 1, 0, 0.5882353, 1,
1.256336, 1.169889, 1.486188, 1, 0, 0.5803922, 1,
1.274247, 1.030599, 0.5487593, 1, 0, 0.5764706, 1,
1.279753, 1.587132, 1.172506, 1, 0, 0.5686275, 1,
1.286614, 0.4191511, 1.638756, 1, 0, 0.5647059, 1,
1.295772, -0.2858545, 1.578673, 1, 0, 0.5568628, 1,
1.302095, 0.03665094, 2.25463, 1, 0, 0.5529412, 1,
1.305711, 0.1314067, -0.3477597, 1, 0, 0.5450981, 1,
1.309304, 0.9979053, 1.599946, 1, 0, 0.5411765, 1,
1.310112, 0.3397874, 1.191384, 1, 0, 0.5333334, 1,
1.321945, -0.4143263, 3.567201, 1, 0, 0.5294118, 1,
1.329177, -0.4304215, 3.026314, 1, 0, 0.5215687, 1,
1.334847, -0.2972273, 2.57231, 1, 0, 0.5176471, 1,
1.343844, 0.2309131, -0.09079067, 1, 0, 0.509804, 1,
1.34738, 0.4339309, 0.7924207, 1, 0, 0.5058824, 1,
1.352939, 0.5038736, -0.007768004, 1, 0, 0.4980392, 1,
1.354989, 0.03987532, 1.640541, 1, 0, 0.4901961, 1,
1.359645, 0.1808692, 1.947821, 1, 0, 0.4862745, 1,
1.365208, -0.2965227, 1.962241, 1, 0, 0.4784314, 1,
1.379552, -0.1431083, 0.163456, 1, 0, 0.4745098, 1,
1.393479, -0.4060184, -0.676493, 1, 0, 0.4666667, 1,
1.3978, 1.304757, 1.32564, 1, 0, 0.4627451, 1,
1.403046, 0.7647088, 0.1897341, 1, 0, 0.454902, 1,
1.406678, -0.9304071, 1.674857, 1, 0, 0.4509804, 1,
1.421149, 0.3366422, 1.527677, 1, 0, 0.4431373, 1,
1.431341, -1.032242, 1.930467, 1, 0, 0.4392157, 1,
1.441812, 0.1315691, 0.7440317, 1, 0, 0.4313726, 1,
1.441956, 1.083811, 1.642205, 1, 0, 0.427451, 1,
1.448308, -0.5679218, 1.636822, 1, 0, 0.4196078, 1,
1.453037, -0.08088014, 0.9392877, 1, 0, 0.4156863, 1,
1.454349, -0.4634786, 2.899899, 1, 0, 0.4078431, 1,
1.461397, -0.04053494, -0.2763854, 1, 0, 0.4039216, 1,
1.462408, -0.2789346, 1.364137, 1, 0, 0.3960784, 1,
1.46262, 0.57322, 1.944149, 1, 0, 0.3882353, 1,
1.477368, -0.3175927, 2.336522, 1, 0, 0.3843137, 1,
1.504636, 1.853937, 0.5649969, 1, 0, 0.3764706, 1,
1.512819, 0.640965, 1.049469, 1, 0, 0.372549, 1,
1.516387, -0.2468547, 1.768512, 1, 0, 0.3647059, 1,
1.519837, -0.7086447, 0.6378456, 1, 0, 0.3607843, 1,
1.523761, -0.9142967, 2.296262, 1, 0, 0.3529412, 1,
1.536031, 0.668671, 1.052637, 1, 0, 0.3490196, 1,
1.536051, 0.3426665, 0.276131, 1, 0, 0.3411765, 1,
1.542055, 1.11966, 1.227936, 1, 0, 0.3372549, 1,
1.551494, 0.4518721, 0.9428676, 1, 0, 0.3294118, 1,
1.556252, 0.2502457, 1.375968, 1, 0, 0.3254902, 1,
1.55722, 1.126977, -0.2327538, 1, 0, 0.3176471, 1,
1.572483, 0.8098847, 1.331246, 1, 0, 0.3137255, 1,
1.573086, -0.5009218, 1.922026, 1, 0, 0.3058824, 1,
1.599885, 0.7456263, 1.096529, 1, 0, 0.2980392, 1,
1.619127, -0.5908573, 3.566575, 1, 0, 0.2941177, 1,
1.627078, -1.066628, 1.544665, 1, 0, 0.2862745, 1,
1.648148, -0.4458042, 0.9514619, 1, 0, 0.282353, 1,
1.696312, -0.7042806, 0.815109, 1, 0, 0.2745098, 1,
1.699278, 0.1583971, 0.716247, 1, 0, 0.2705882, 1,
1.704615, 0.5425761, 1.255056, 1, 0, 0.2627451, 1,
1.70617, -1.204425, 3.97759, 1, 0, 0.2588235, 1,
1.70941, -0.9452509, 2.066616, 1, 0, 0.2509804, 1,
1.716384, 0.9860313, 2.165789, 1, 0, 0.2470588, 1,
1.736932, 0.7909466, 3.671529, 1, 0, 0.2392157, 1,
1.755492, 0.2793359, 1.992112, 1, 0, 0.2352941, 1,
1.758633, 0.0150291, 1.283895, 1, 0, 0.227451, 1,
1.759036, 0.6666664, 1.486705, 1, 0, 0.2235294, 1,
1.759457, -0.3709914, 1.523914, 1, 0, 0.2156863, 1,
1.770384, -0.2139501, 1.340463, 1, 0, 0.2117647, 1,
1.77094, -0.1504235, 0.3965794, 1, 0, 0.2039216, 1,
1.790753, 1.210188, 0.8677874, 1, 0, 0.1960784, 1,
1.802682, 0.009255726, 2.195332, 1, 0, 0.1921569, 1,
1.805562, -1.796171, 3.218043, 1, 0, 0.1843137, 1,
1.831618, 0.2737958, 0.2060551, 1, 0, 0.1803922, 1,
1.856924, 1.463968, 1.354486, 1, 0, 0.172549, 1,
1.900549, 0.1398341, 1.967811, 1, 0, 0.1686275, 1,
1.908976, 1.224706, 0.9753035, 1, 0, 0.1607843, 1,
1.920658, -0.7679594, 2.656536, 1, 0, 0.1568628, 1,
1.947899, 0.05966216, 0.3211679, 1, 0, 0.1490196, 1,
1.951216, 1.193744, 0.244459, 1, 0, 0.145098, 1,
1.977391, -1.023819, 1.289105, 1, 0, 0.1372549, 1,
1.979509, 0.3222597, 1.019711, 1, 0, 0.1333333, 1,
1.994191, -0.9425661, 1.528088, 1, 0, 0.1254902, 1,
2.000597, 0.120673, 3.569077, 1, 0, 0.1215686, 1,
2.049318, -0.7480193, 2.566664, 1, 0, 0.1137255, 1,
2.087816, -0.004478197, 0.6584012, 1, 0, 0.1098039, 1,
2.130811, -1.735273, 1.747737, 1, 0, 0.1019608, 1,
2.135306, 2.034572, -0.07861908, 1, 0, 0.09411765, 1,
2.139095, 1.728656, 1.671606, 1, 0, 0.09019608, 1,
2.183382, 1.368001, 1.318716, 1, 0, 0.08235294, 1,
2.21386, -1.894202, 0.4434353, 1, 0, 0.07843138, 1,
2.320226, 1.316768, 2.093976, 1, 0, 0.07058824, 1,
2.32637, 0.945588, 1.736434, 1, 0, 0.06666667, 1,
2.372718, 0.7553216, 2.401249, 1, 0, 0.05882353, 1,
2.400877, 0.8431715, -0.05192168, 1, 0, 0.05490196, 1,
2.415426, 0.8419392, 2.607862, 1, 0, 0.04705882, 1,
2.468152, 2.292304, -0.9582233, 1, 0, 0.04313726, 1,
2.483881, -0.1596655, 2.378939, 1, 0, 0.03529412, 1,
2.505498, 1.277803, 2.415681, 1, 0, 0.03137255, 1,
2.662438, 0.8014041, 1.023103, 1, 0, 0.02352941, 1,
2.696343, 1.102871, 1.165754, 1, 0, 0.01960784, 1,
2.72937, 1.328702, 1.121817, 1, 0, 0.01176471, 1,
2.733121, 1.792547, 2.168177, 1, 0, 0.007843138, 1
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
-0.4788884, -5.249406, -7.621446, 0, -0.5, 0.5, 0.5,
-0.4788884, -5.249406, -7.621446, 1, -0.5, 0.5, 0.5,
-0.4788884, -5.249406, -7.621446, 1, 1.5, 0.5, 0.5,
-0.4788884, -5.249406, -7.621446, 0, 1.5, 0.5, 0.5
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
-4.779768, -0.3746302, -7.621446, 0, -0.5, 0.5, 0.5,
-4.779768, -0.3746302, -7.621446, 1, -0.5, 0.5, 0.5,
-4.779768, -0.3746302, -7.621446, 1, 1.5, 0.5, 0.5,
-4.779768, -0.3746302, -7.621446, 0, 1.5, 0.5, 0.5
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
-4.779768, -5.249406, 0.3035462, 0, -0.5, 0.5, 0.5,
-4.779768, -5.249406, 0.3035462, 1, -0.5, 0.5, 0.5,
-4.779768, -5.249406, 0.3035462, 1, 1.5, 0.5, 0.5,
-4.779768, -5.249406, 0.3035462, 0, 1.5, 0.5, 0.5
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
-3, -4.124458, -5.792601,
2, -4.124458, -5.792601,
-3, -4.124458, -5.792601,
-3, -4.311949, -6.097409,
-2, -4.124458, -5.792601,
-2, -4.311949, -6.097409,
-1, -4.124458, -5.792601,
-1, -4.311949, -6.097409,
0, -4.124458, -5.792601,
0, -4.311949, -6.097409,
1, -4.124458, -5.792601,
1, -4.311949, -6.097409,
2, -4.124458, -5.792601,
2, -4.311949, -6.097409
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
-3, -4.686932, -6.707024, 0, -0.5, 0.5, 0.5,
-3, -4.686932, -6.707024, 1, -0.5, 0.5, 0.5,
-3, -4.686932, -6.707024, 1, 1.5, 0.5, 0.5,
-3, -4.686932, -6.707024, 0, 1.5, 0.5, 0.5,
-2, -4.686932, -6.707024, 0, -0.5, 0.5, 0.5,
-2, -4.686932, -6.707024, 1, -0.5, 0.5, 0.5,
-2, -4.686932, -6.707024, 1, 1.5, 0.5, 0.5,
-2, -4.686932, -6.707024, 0, 1.5, 0.5, 0.5,
-1, -4.686932, -6.707024, 0, -0.5, 0.5, 0.5,
-1, -4.686932, -6.707024, 1, -0.5, 0.5, 0.5,
-1, -4.686932, -6.707024, 1, 1.5, 0.5, 0.5,
-1, -4.686932, -6.707024, 0, 1.5, 0.5, 0.5,
0, -4.686932, -6.707024, 0, -0.5, 0.5, 0.5,
0, -4.686932, -6.707024, 1, -0.5, 0.5, 0.5,
0, -4.686932, -6.707024, 1, 1.5, 0.5, 0.5,
0, -4.686932, -6.707024, 0, 1.5, 0.5, 0.5,
1, -4.686932, -6.707024, 0, -0.5, 0.5, 0.5,
1, -4.686932, -6.707024, 1, -0.5, 0.5, 0.5,
1, -4.686932, -6.707024, 1, 1.5, 0.5, 0.5,
1, -4.686932, -6.707024, 0, 1.5, 0.5, 0.5,
2, -4.686932, -6.707024, 0, -0.5, 0.5, 0.5,
2, -4.686932, -6.707024, 1, -0.5, 0.5, 0.5,
2, -4.686932, -6.707024, 1, 1.5, 0.5, 0.5,
2, -4.686932, -6.707024, 0, 1.5, 0.5, 0.5
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
-3.787258, -4, -5.792601,
-3.787258, 2, -5.792601,
-3.787258, -4, -5.792601,
-3.952676, -4, -6.097409,
-3.787258, -2, -5.792601,
-3.952676, -2, -6.097409,
-3.787258, 0, -5.792601,
-3.952676, 0, -6.097409,
-3.787258, 2, -5.792601,
-3.952676, 2, -6.097409
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
"-4",
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
-4.283513, -4, -6.707024, 0, -0.5, 0.5, 0.5,
-4.283513, -4, -6.707024, 1, -0.5, 0.5, 0.5,
-4.283513, -4, -6.707024, 1, 1.5, 0.5, 0.5,
-4.283513, -4, -6.707024, 0, 1.5, 0.5, 0.5,
-4.283513, -2, -6.707024, 0, -0.5, 0.5, 0.5,
-4.283513, -2, -6.707024, 1, -0.5, 0.5, 0.5,
-4.283513, -2, -6.707024, 1, 1.5, 0.5, 0.5,
-4.283513, -2, -6.707024, 0, 1.5, 0.5, 0.5,
-4.283513, 0, -6.707024, 0, -0.5, 0.5, 0.5,
-4.283513, 0, -6.707024, 1, -0.5, 0.5, 0.5,
-4.283513, 0, -6.707024, 1, 1.5, 0.5, 0.5,
-4.283513, 0, -6.707024, 0, 1.5, 0.5, 0.5,
-4.283513, 2, -6.707024, 0, -0.5, 0.5, 0.5,
-4.283513, 2, -6.707024, 1, -0.5, 0.5, 0.5,
-4.283513, 2, -6.707024, 1, 1.5, 0.5, 0.5,
-4.283513, 2, -6.707024, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<4; i++) 
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
12, 13, 14, 12, 14, 15
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
-3.787258, -4.124458, -4,
-3.787258, -4.124458, 6,
-3.787258, -4.124458, -4,
-3.952676, -4.311949, -4,
-3.787258, -4.124458, -2,
-3.952676, -4.311949, -2,
-3.787258, -4.124458, 0,
-3.952676, -4.311949, 0,
-3.787258, -4.124458, 2,
-3.952676, -4.311949, 2,
-3.787258, -4.124458, 4,
-3.952676, -4.311949, 4,
-3.787258, -4.124458, 6,
-3.952676, -4.311949, 6
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
"4",
"6"
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
-4.283513, -4.686932, -4, 0, -0.5, 0.5, 0.5,
-4.283513, -4.686932, -4, 1, -0.5, 0.5, 0.5,
-4.283513, -4.686932, -4, 1, 1.5, 0.5, 0.5,
-4.283513, -4.686932, -4, 0, 1.5, 0.5, 0.5,
-4.283513, -4.686932, -2, 0, -0.5, 0.5, 0.5,
-4.283513, -4.686932, -2, 1, -0.5, 0.5, 0.5,
-4.283513, -4.686932, -2, 1, 1.5, 0.5, 0.5,
-4.283513, -4.686932, -2, 0, 1.5, 0.5, 0.5,
-4.283513, -4.686932, 0, 0, -0.5, 0.5, 0.5,
-4.283513, -4.686932, 0, 1, -0.5, 0.5, 0.5,
-4.283513, -4.686932, 0, 1, 1.5, 0.5, 0.5,
-4.283513, -4.686932, 0, 0, 1.5, 0.5, 0.5,
-4.283513, -4.686932, 2, 0, -0.5, 0.5, 0.5,
-4.283513, -4.686932, 2, 1, -0.5, 0.5, 0.5,
-4.283513, -4.686932, 2, 1, 1.5, 0.5, 0.5,
-4.283513, -4.686932, 2, 0, 1.5, 0.5, 0.5,
-4.283513, -4.686932, 4, 0, -0.5, 0.5, 0.5,
-4.283513, -4.686932, 4, 1, -0.5, 0.5, 0.5,
-4.283513, -4.686932, 4, 1, 1.5, 0.5, 0.5,
-4.283513, -4.686932, 4, 0, 1.5, 0.5, 0.5,
-4.283513, -4.686932, 6, 0, -0.5, 0.5, 0.5,
-4.283513, -4.686932, 6, 1, -0.5, 0.5, 0.5,
-4.283513, -4.686932, 6, 1, 1.5, 0.5, 0.5,
-4.283513, -4.686932, 6, 0, 1.5, 0.5, 0.5
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
-3.787258, -4.124458, -5.792601,
-3.787258, 3.375198, -5.792601,
-3.787258, -4.124458, 6.399693,
-3.787258, 3.375198, 6.399693,
-3.787258, -4.124458, -5.792601,
-3.787258, -4.124458, 6.399693,
-3.787258, 3.375198, -5.792601,
-3.787258, 3.375198, 6.399693,
-3.787258, -4.124458, -5.792601,
2.829481, -4.124458, -5.792601,
-3.787258, -4.124458, 6.399693,
2.829481, -4.124458, 6.399693,
-3.787258, 3.375198, -5.792601,
2.829481, 3.375198, -5.792601,
-3.787258, 3.375198, 6.399693,
2.829481, 3.375198, 6.399693,
2.829481, -4.124458, -5.792601,
2.829481, 3.375198, -5.792601,
2.829481, -4.124458, 6.399693,
2.829481, 3.375198, 6.399693,
2.829481, -4.124458, -5.792601,
2.829481, -4.124458, 6.399693,
2.829481, 3.375198, -5.792601,
2.829481, 3.375198, 6.399693
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
var radius = 8.420624;
var distance = 37.46431;
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
mvMatrix.translate( 0.4788884, 0.3746302, -0.3035462 );
mvMatrix.scale( 1.375987, 1.213995, 0.7467456 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -37.46431);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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
arsorate<-read.table("arsorate.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-arsorate$V2
```

```
## Error in eval(expr, envir, enclos): object 'arsorate' not found
```

```r
y<-arsorate$V3
```

```
## Error in eval(expr, envir, enclos): object 'arsorate' not found
```

```r
z<-arsorate$V4
```

```
## Error in eval(expr, envir, enclos): object 'arsorate' not found
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
-3.690897, -0.5612788, -1.353053, 0, 0, 1, 1, 1,
-2.90745, -0.7556683, -0.2508381, 1, 0, 0, 1, 1,
-2.894814, -4.01524, -2.322274, 1, 0, 0, 1, 1,
-2.800633, -3.176257, -3.955467, 1, 0, 0, 1, 1,
-2.657807, 0.7178662, -1.612579, 1, 0, 0, 1, 1,
-2.50156, -0.9847079, -0.9702203, 1, 0, 0, 1, 1,
-2.460094, 0.3023644, -1.311181, 0, 0, 0, 1, 1,
-2.427357, -1.319107, -1.96826, 0, 0, 0, 1, 1,
-2.3994, 0.04400437, -1.394433, 0, 0, 0, 1, 1,
-2.380115, -0.6115658, 0.5275396, 0, 0, 0, 1, 1,
-2.26318, -0.7408083, -1.326501, 0, 0, 0, 1, 1,
-2.234146, -0.6870823, -1.998632, 0, 0, 0, 1, 1,
-2.227682, 0.6663651, -2.334101, 0, 0, 0, 1, 1,
-2.174762, 1.333039, -1.378887, 1, 1, 1, 1, 1,
-2.165291, 0.0330454, -1.594629, 1, 1, 1, 1, 1,
-2.098448, -0.4118964, -2.13591, 1, 1, 1, 1, 1,
-2.094279, 0.01068887, -1.926398, 1, 1, 1, 1, 1,
-2.089865, -0.06685244, -1.312767, 1, 1, 1, 1, 1,
-2.068577, -0.2543552, -2.816621, 1, 1, 1, 1, 1,
-2.054626, 0.4458622, 0.02639909, 1, 1, 1, 1, 1,
-2.022537, -0.6010285, -1.980777, 1, 1, 1, 1, 1,
-2.022196, 0.6036886, -1.477658, 1, 1, 1, 1, 1,
-1.985732, -0.1923324, -0.9592283, 1, 1, 1, 1, 1,
-1.980128, -0.6125475, -2.81986, 1, 1, 1, 1, 1,
-1.978725, -0.6680763, -2.804127, 1, 1, 1, 1, 1,
-1.967287, 0.5996611, -2.537565, 1, 1, 1, 1, 1,
-1.963096, -0.121952, -1.312009, 1, 1, 1, 1, 1,
-1.915733, 0.112584, -2.240313, 1, 1, 1, 1, 1,
-1.905707, -0.8903031, -1.991592, 0, 0, 1, 1, 1,
-1.903376, 0.6240543, -1.059315, 1, 0, 0, 1, 1,
-1.898331, 0.06590648, -1.794811, 1, 0, 0, 1, 1,
-1.891504, -1.037802, -1.367523, 1, 0, 0, 1, 1,
-1.887191, 1.135086, -0.7332295, 1, 0, 0, 1, 1,
-1.855149, -0.7953901, -0.8766764, 1, 0, 0, 1, 1,
-1.830122, 1.203102, -1.136568, 0, 0, 0, 1, 1,
-1.823177, -0.6862825, -1.239413, 0, 0, 0, 1, 1,
-1.816143, 1.803255, -1.475801, 0, 0, 0, 1, 1,
-1.805092, 0.5350107, -2.26633, 0, 0, 0, 1, 1,
-1.775315, -0.6557817, -2.146187, 0, 0, 0, 1, 1,
-1.755009, -1.084459, -1.73455, 0, 0, 0, 1, 1,
-1.745553, 0.07076887, -3.234442, 0, 0, 0, 1, 1,
-1.742137, -1.606887, -1.634832, 1, 1, 1, 1, 1,
-1.735467, 0.9823691, -1.021704, 1, 1, 1, 1, 1,
-1.709659, 1.249306, -0.8249999, 1, 1, 1, 1, 1,
-1.708706, 1.948068, -0.7635574, 1, 1, 1, 1, 1,
-1.705397, 0.2820826, -2.661232, 1, 1, 1, 1, 1,
-1.704547, -1.56713, -3.31871, 1, 1, 1, 1, 1,
-1.678485, 1.63825, -1.295136, 1, 1, 1, 1, 1,
-1.663483, -0.6241056, -2.153828, 1, 1, 1, 1, 1,
-1.658996, 0.3223655, 0.08473574, 1, 1, 1, 1, 1,
-1.64751, 1.432919, 0.001379112, 1, 1, 1, 1, 1,
-1.640355, 0.1660883, -1.794327, 1, 1, 1, 1, 1,
-1.635526, 0.01699714, -1.226871, 1, 1, 1, 1, 1,
-1.61907, 0.6861086, -1.897068, 1, 1, 1, 1, 1,
-1.613918, 1.02385, -0.4480732, 1, 1, 1, 1, 1,
-1.60106, -0.5153735, -2.124369, 1, 1, 1, 1, 1,
-1.599179, 3.098863, -0.2085054, 0, 0, 1, 1, 1,
-1.563568, 0.3530027, -1.721351, 1, 0, 0, 1, 1,
-1.549347, -1.404835, -3.031956, 1, 0, 0, 1, 1,
-1.541438, 0.3662249, -0.1647343, 1, 0, 0, 1, 1,
-1.527367, 2.215658, -0.8575153, 1, 0, 0, 1, 1,
-1.525319, 1.452366, -1.708046, 1, 0, 0, 1, 1,
-1.522617, 0.05145075, -0.2091561, 0, 0, 0, 1, 1,
-1.507301, -0.2362551, -1.669782, 0, 0, 0, 1, 1,
-1.506637, 0.4750598, -0.2526312, 0, 0, 0, 1, 1,
-1.504428, -0.01866808, -2.887785, 0, 0, 0, 1, 1,
-1.498826, 0.2032865, -0.8766177, 0, 0, 0, 1, 1,
-1.496788, -0.4089085, -0.7449386, 0, 0, 0, 1, 1,
-1.472452, -0.7120739, -2.735062, 0, 0, 0, 1, 1,
-1.471793, 1.172937, -2.150293, 1, 1, 1, 1, 1,
-1.466425, -1.817899, -3.616801, 1, 1, 1, 1, 1,
-1.458165, -1.244743, -2.064299, 1, 1, 1, 1, 1,
-1.451036, -2.568561, -4.111446, 1, 1, 1, 1, 1,
-1.43582, 0.5038419, -1.957731, 1, 1, 1, 1, 1,
-1.4134, -0.6379064, -2.931814, 1, 1, 1, 1, 1,
-1.401692, -3.306545, -3.51845, 1, 1, 1, 1, 1,
-1.400874, 1.106951, -0.7080277, 1, 1, 1, 1, 1,
-1.392306, -0.7397043, -0.5577722, 1, 1, 1, 1, 1,
-1.389145, -1.790614, -3.463967, 1, 1, 1, 1, 1,
-1.382108, 1.767496, -0.5690144, 1, 1, 1, 1, 1,
-1.368326, 0.9144108, -1.603423, 1, 1, 1, 1, 1,
-1.366586, -0.6110911, -0.3524161, 1, 1, 1, 1, 1,
-1.361359, 1.139784, 0.1650761, 1, 1, 1, 1, 1,
-1.343378, -0.8612569, -0.8313472, 1, 1, 1, 1, 1,
-1.337562, 0.3925824, -0.8077297, 0, 0, 1, 1, 1,
-1.324129, -1.454181, -3.723722, 1, 0, 0, 1, 1,
-1.318596, -0.4869131, -2.700691, 1, 0, 0, 1, 1,
-1.31622, 0.5944356, -2.298503, 1, 0, 0, 1, 1,
-1.314557, 0.1340546, -0.8187919, 1, 0, 0, 1, 1,
-1.310264, -0.03505711, -3.243855, 1, 0, 0, 1, 1,
-1.306193, -0.7875202, -2.41855, 0, 0, 0, 1, 1,
-1.304128, 0.5133686, 0.01558154, 0, 0, 0, 1, 1,
-1.300765, -0.3690687, -0.9297705, 0, 0, 0, 1, 1,
-1.295666, 0.6545554, -1.80027, 0, 0, 0, 1, 1,
-1.295261, -0.05182691, -0.3581036, 0, 0, 0, 1, 1,
-1.294693, -0.8769689, -2.455543, 0, 0, 0, 1, 1,
-1.286297, -0.5446551, -1.538132, 0, 0, 0, 1, 1,
-1.282386, 0.09633936, -1.286781, 1, 1, 1, 1, 1,
-1.27285, 0.8327385, -0.7109644, 1, 1, 1, 1, 1,
-1.270999, -0.8169399, -1.69979, 1, 1, 1, 1, 1,
-1.266275, 1.303769, -2.244456, 1, 1, 1, 1, 1,
-1.238365, -0.5046, -1.259708, 1, 1, 1, 1, 1,
-1.232961, 0.1745842, -1.245398, 1, 1, 1, 1, 1,
-1.232297, 0.3970451, -1.599149, 1, 1, 1, 1, 1,
-1.222878, -0.8597029, -2.234481, 1, 1, 1, 1, 1,
-1.222009, 1.088379, -0.5101471, 1, 1, 1, 1, 1,
-1.218809, 0.6074921, -1.248497, 1, 1, 1, 1, 1,
-1.216546, 0.1914063, -1.57655, 1, 1, 1, 1, 1,
-1.215675, 1.207928, -0.1074062, 1, 1, 1, 1, 1,
-1.214974, 0.4489694, -0.3188985, 1, 1, 1, 1, 1,
-1.211391, -0.9190782, -1.079239, 1, 1, 1, 1, 1,
-1.204114, -0.311588, -1.221605, 1, 1, 1, 1, 1,
-1.203951, -0.531957, -1.610618, 0, 0, 1, 1, 1,
-1.203708, 0.1946321, -1.748809, 1, 0, 0, 1, 1,
-1.202029, 1.765355, -1.082877, 1, 0, 0, 1, 1,
-1.193459, 0.8941212, -1.565141, 1, 0, 0, 1, 1,
-1.188497, -0.3983282, -1.732587, 1, 0, 0, 1, 1,
-1.186263, 0.6439133, -1.67018, 1, 0, 0, 1, 1,
-1.183988, 0.1715752, -2.019416, 0, 0, 0, 1, 1,
-1.18041, -0.5861126, -1.879078, 0, 0, 0, 1, 1,
-1.177103, 0.3092729, -2.408388, 0, 0, 0, 1, 1,
-1.175757, 0.6951247, -0.8116972, 0, 0, 0, 1, 1,
-1.164946, 1.210758, -0.6164658, 0, 0, 0, 1, 1,
-1.153522, -2.045205, -2.669526, 0, 0, 0, 1, 1,
-1.139665, -1.586352, -3.364441, 0, 0, 0, 1, 1,
-1.132582, 0.05428943, -1.14857, 1, 1, 1, 1, 1,
-1.130828, 0.6259505, -0.9372399, 1, 1, 1, 1, 1,
-1.130163, 0.5935269, -1.013067, 1, 1, 1, 1, 1,
-1.123195, -0.744988, -2.3926, 1, 1, 1, 1, 1,
-1.121735, 1.93673, -1.437228, 1, 1, 1, 1, 1,
-1.115402, 0.6532781, -1.011077, 1, 1, 1, 1, 1,
-1.114466, -0.5655857, -0.8670018, 1, 1, 1, 1, 1,
-1.113077, -0.4905421, -3.600358, 1, 1, 1, 1, 1,
-1.108304, -1.806435, -3.0543, 1, 1, 1, 1, 1,
-1.103437, -1.393138, -1.898323, 1, 1, 1, 1, 1,
-1.102689, 1.262606, -2.420686, 1, 1, 1, 1, 1,
-1.099463, 0.09133232, 0.8772566, 1, 1, 1, 1, 1,
-1.098958, 1.177232, -1.701408, 1, 1, 1, 1, 1,
-1.098821, 1.643591, -0.292307, 1, 1, 1, 1, 1,
-1.098112, 0.3135493, -3.124419, 1, 1, 1, 1, 1,
-1.09696, -0.3010442, -3.073259, 0, 0, 1, 1, 1,
-1.090452, 0.6579892, -1.272026, 1, 0, 0, 1, 1,
-1.086949, -0.8817568, -0.872243, 1, 0, 0, 1, 1,
-1.085558, -2.198138, -2.781792, 1, 0, 0, 1, 1,
-1.085204, -0.3010608, -2.681769, 1, 0, 0, 1, 1,
-1.084841, 0.4314967, 2.231815, 1, 0, 0, 1, 1,
-1.081011, 0.1277133, -0.5813385, 0, 0, 0, 1, 1,
-1.074642, -2.734422, -1.54062, 0, 0, 0, 1, 1,
-1.066325, 0.02921428, -1.581364, 0, 0, 0, 1, 1,
-1.058, -1.162046, -1.26435, 0, 0, 0, 1, 1,
-1.05651, -1.065836, -1.063698, 0, 0, 0, 1, 1,
-1.05624, 0.09558745, -2.946091, 0, 0, 0, 1, 1,
-1.046165, 0.3067052, -1.086582, 0, 0, 0, 1, 1,
-1.039235, 0.02185025, -1.321981, 1, 1, 1, 1, 1,
-1.028476, 0.8124797, -0.9310884, 1, 1, 1, 1, 1,
-1.027386, 1.281512, -1.788806, 1, 1, 1, 1, 1,
-1.011551, -2.016958, -3.758348, 1, 1, 1, 1, 1,
-1.00942, 0.3151608, -2.189563, 1, 1, 1, 1, 1,
-1.003786, -1.699008, -1.830803, 1, 1, 1, 1, 1,
-0.987249, -0.6126204, -3.082503, 1, 1, 1, 1, 1,
-0.9786441, 1.023584, -3.032688, 1, 1, 1, 1, 1,
-0.9721692, 0.4354977, -2.347806, 1, 1, 1, 1, 1,
-0.9710925, 0.5521603, -1.654287, 1, 1, 1, 1, 1,
-0.9702164, 0.251557, -2.12891, 1, 1, 1, 1, 1,
-0.964927, 0.9414554, -2.260576, 1, 1, 1, 1, 1,
-0.9627223, -1.768991, -3.82375, 1, 1, 1, 1, 1,
-0.9597139, -1.388421, -0.8364854, 1, 1, 1, 1, 1,
-0.9581777, -0.1259648, -0.5067358, 1, 1, 1, 1, 1,
-0.9537931, 0.4951924, -0.517577, 0, 0, 1, 1, 1,
-0.9472294, -1.141752, -2.232011, 1, 0, 0, 1, 1,
-0.9437554, -0.9816561, -2.187871, 1, 0, 0, 1, 1,
-0.9389152, -0.03148537, -1.775073, 1, 0, 0, 1, 1,
-0.9383717, 0.1583426, -1.189265, 1, 0, 0, 1, 1,
-0.9377325, -0.8401963, -3.410501, 1, 0, 0, 1, 1,
-0.9298193, -1.0526, -3.375062, 0, 0, 0, 1, 1,
-0.929435, 0.02090469, -1.20716, 0, 0, 0, 1, 1,
-0.9263318, -0.5229741, -3.027075, 0, 0, 0, 1, 1,
-0.917672, -1.289694, -1.559095, 0, 0, 0, 1, 1,
-0.9153131, 2.605228, -0.790816, 0, 0, 0, 1, 1,
-0.9133074, 0.427207, 0.160002, 0, 0, 0, 1, 1,
-0.9132634, 0.2626896, -1.536396, 0, 0, 0, 1, 1,
-0.9123388, -0.2968816, -1.4054, 1, 1, 1, 1, 1,
-0.9121454, 3.205915, 0.2026592, 1, 1, 1, 1, 1,
-0.8995066, -1.174299, -3.065382, 1, 1, 1, 1, 1,
-0.8882855, 0.6508613, -2.264552, 1, 1, 1, 1, 1,
-0.8880531, 0.08371063, -2.259666, 1, 1, 1, 1, 1,
-0.8837574, 1.176928, -0.9094239, 1, 1, 1, 1, 1,
-0.882969, -0.3879351, -0.7194065, 1, 1, 1, 1, 1,
-0.8817593, -1.054391, -1.721036, 1, 1, 1, 1, 1,
-0.8784205, -1.464772, -2.0765, 1, 1, 1, 1, 1,
-0.8743988, 1.424704, -0.8893948, 1, 1, 1, 1, 1,
-0.8714672, 0.2984681, -2.315552, 1, 1, 1, 1, 1,
-0.8675126, 0.4153362, -3.284101, 1, 1, 1, 1, 1,
-0.8663656, 0.03655443, -1.154639, 1, 1, 1, 1, 1,
-0.8646871, -0.7413455, -1.328849, 1, 1, 1, 1, 1,
-0.8644322, -1.865262, -1.835402, 1, 1, 1, 1, 1,
-0.8587831, -0.4440612, -2.243727, 0, 0, 1, 1, 1,
-0.8552057, 1.04833, -0.9057981, 1, 0, 0, 1, 1,
-0.8419269, 0.1379958, -2.960143, 1, 0, 0, 1, 1,
-0.8390378, 1.078043, -2.426963, 1, 0, 0, 1, 1,
-0.8346525, -0.1158369, -2.159122, 1, 0, 0, 1, 1,
-0.8343351, -0.2975892, -2.260887, 1, 0, 0, 1, 1,
-0.8288351, -0.00997286, -2.844791, 0, 0, 0, 1, 1,
-0.8207419, -0.384423, -2.754269, 0, 0, 0, 1, 1,
-0.8165526, -0.1793076, -2.874439, 0, 0, 0, 1, 1,
-0.813086, 2.04103, 0.3507296, 0, 0, 0, 1, 1,
-0.812837, -0.1079425, -1.36266, 0, 0, 0, 1, 1,
-0.8124694, -1.283723, -1.982136, 0, 0, 0, 1, 1,
-0.811843, -2.172141, -2.400436, 0, 0, 0, 1, 1,
-0.8048165, 0.3715295, -2.112885, 1, 1, 1, 1, 1,
-0.7972751, 0.5557497, 0.5879644, 1, 1, 1, 1, 1,
-0.7948402, -0.5679837, -1.385555, 1, 1, 1, 1, 1,
-0.7898793, -1.378546, -2.477003, 1, 1, 1, 1, 1,
-0.7872065, 0.6858332, -1.557661, 1, 1, 1, 1, 1,
-0.7871572, 1.19744, -0.3623337, 1, 1, 1, 1, 1,
-0.7856116, -0.5701984, -0.492056, 1, 1, 1, 1, 1,
-0.7824277, -1.164259, -1.138914, 1, 1, 1, 1, 1,
-0.7798439, -0.3031152, -1.20019, 1, 1, 1, 1, 1,
-0.7686481, -0.1864495, -2.405724, 1, 1, 1, 1, 1,
-0.7658997, 1.157763, -0.4649737, 1, 1, 1, 1, 1,
-0.7605156, -1.307986, -2.936142, 1, 1, 1, 1, 1,
-0.7540111, -0.03053039, -1.35882, 1, 1, 1, 1, 1,
-0.7537173, -1.353609, -3.248371, 1, 1, 1, 1, 1,
-0.7518373, -0.6180964, -1.538412, 1, 1, 1, 1, 1,
-0.7507221, -0.6032498, -0.5605637, 0, 0, 1, 1, 1,
-0.7486176, -0.004779532, -1.740958, 1, 0, 0, 1, 1,
-0.7457536, 0.6681425, -1.206476, 1, 0, 0, 1, 1,
-0.7442515, 0.3404835, -1.487691, 1, 0, 0, 1, 1,
-0.7441767, 0.8275799, -0.8183388, 1, 0, 0, 1, 1,
-0.7419283, -0.2307342, -3.733861, 1, 0, 0, 1, 1,
-0.741762, -0.4473309, -2.389314, 0, 0, 0, 1, 1,
-0.7386143, 1.80498, -0.7937827, 0, 0, 0, 1, 1,
-0.7336969, -1.598345, -3.007449, 0, 0, 0, 1, 1,
-0.7329357, -0.8060979, -3.409348, 0, 0, 0, 1, 1,
-0.7321789, -0.3497037, -2.284276, 0, 0, 0, 1, 1,
-0.7320597, 0.236794, -1.241725, 0, 0, 0, 1, 1,
-0.7294898, -1.354656, -1.025883, 0, 0, 0, 1, 1,
-0.7231391, 0.005517262, -0.4096918, 1, 1, 1, 1, 1,
-0.7182912, 2.153512, 0.02165932, 1, 1, 1, 1, 1,
-0.7173045, -0.5675117, -3.413179, 1, 1, 1, 1, 1,
-0.715372, 1.701453, -0.5061815, 1, 1, 1, 1, 1,
-0.7137667, -0.5350383, -3.636848, 1, 1, 1, 1, 1,
-0.7095971, 0.03871152, -2.002871, 1, 1, 1, 1, 1,
-0.7062456, 0.05893487, -1.850724, 1, 1, 1, 1, 1,
-0.7034368, -0.7212285, -3.194092, 1, 1, 1, 1, 1,
-0.7025231, -1.472889, -4.144905, 1, 1, 1, 1, 1,
-0.6940855, -1.415721, -2.996818, 1, 1, 1, 1, 1,
-0.6936255, 0.6018326, -1.708804, 1, 1, 1, 1, 1,
-0.689117, -1.383531, -1.908122, 1, 1, 1, 1, 1,
-0.6881381, -1.472901, -3.967644, 1, 1, 1, 1, 1,
-0.681739, 1.310913, 0.8146551, 1, 1, 1, 1, 1,
-0.6800132, 0.8780142, -0.3851447, 1, 1, 1, 1, 1,
-0.6742392, -0.6235724, -0.1143318, 0, 0, 1, 1, 1,
-0.6736845, 0.3525766, 0.1284449, 1, 0, 0, 1, 1,
-0.6639423, -0.7040012, -2.708744, 1, 0, 0, 1, 1,
-0.6638026, -0.5724559, -1.109488, 1, 0, 0, 1, 1,
-0.6629093, 1.297851, -1.257905, 1, 0, 0, 1, 1,
-0.6612766, 1.026559, -0.001947322, 1, 0, 0, 1, 1,
-0.6536696, 0.8275646, 1.357754, 0, 0, 0, 1, 1,
-0.6517965, 0.850282, -0.9287862, 0, 0, 0, 1, 1,
-0.6494085, 0.9438224, 1.000257, 0, 0, 0, 1, 1,
-0.6408609, 0.4501259, 0.1525125, 0, 0, 0, 1, 1,
-0.6367185, 1.063208, -0.9233496, 0, 0, 0, 1, 1,
-0.6357636, 2.135333, -1.959487, 0, 0, 0, 1, 1,
-0.6349533, 0.294674, -1.355892, 0, 0, 0, 1, 1,
-0.6298342, 0.1677595, -1.925302, 1, 1, 1, 1, 1,
-0.6281852, -1.067228, -2.328424, 1, 1, 1, 1, 1,
-0.6257889, 1.929204, -0.3629961, 1, 1, 1, 1, 1,
-0.6205514, -1.151751, -2.365906, 1, 1, 1, 1, 1,
-0.6140441, -0.7680117, -2.694443, 1, 1, 1, 1, 1,
-0.6139966, 0.5409096, -0.4682776, 1, 1, 1, 1, 1,
-0.6133574, -1.177141, -1.02182, 1, 1, 1, 1, 1,
-0.6081571, -0.9546788, -0.319798, 1, 1, 1, 1, 1,
-0.5997095, 0.5496328, -0.09474709, 1, 1, 1, 1, 1,
-0.5912355, 1.628191, 0.4043623, 1, 1, 1, 1, 1,
-0.5908931, -0.497313, -2.460575, 1, 1, 1, 1, 1,
-0.5848435, -0.3399903, -2.177085, 1, 1, 1, 1, 1,
-0.5843133, -1.101184, -3.625136, 1, 1, 1, 1, 1,
-0.5810735, 2.8213, -1.134775, 1, 1, 1, 1, 1,
-0.5777196, 0.9370635, -0.3697219, 1, 1, 1, 1, 1,
-0.5730816, 0.3856454, -0.4368407, 0, 0, 1, 1, 1,
-0.5698121, -5.247855e-05, -1.455774, 1, 0, 0, 1, 1,
-0.5692912, 0.507086, -1.617417, 1, 0, 0, 1, 1,
-0.568361, 1.247671, -1.077706, 1, 0, 0, 1, 1,
-0.5672582, -0.05749198, -1.058177, 1, 0, 0, 1, 1,
-0.5667769, 0.8497731, -0.09409458, 1, 0, 0, 1, 1,
-0.5659142, 0.6124048, -0.9451905, 0, 0, 0, 1, 1,
-0.5657558, 0.612976, -0.8766235, 0, 0, 0, 1, 1,
-0.5634313, 2.107996, -0.4773732, 0, 0, 0, 1, 1,
-0.562894, -0.5035338, -2.542792, 0, 0, 0, 1, 1,
-0.5553099, 1.868694, -2.631002, 0, 0, 0, 1, 1,
-0.5530407, 1.277684, -1.05395, 0, 0, 0, 1, 1,
-0.5470594, -0.8215064, -2.276911, 0, 0, 0, 1, 1,
-0.5449367, 0.9105818, -0.1571471, 1, 1, 1, 1, 1,
-0.5337785, -0.7205452, -0.8864105, 1, 1, 1, 1, 1,
-0.5322572, -0.09677623, -1.506685, 1, 1, 1, 1, 1,
-0.5316191, 0.2292439, -2.208191, 1, 1, 1, 1, 1,
-0.5311354, -0.587427, -1.693374, 1, 1, 1, 1, 1,
-0.528242, 0.8054311, -0.8246002, 1, 1, 1, 1, 1,
-0.5262145, 2.296244, -0.194704, 1, 1, 1, 1, 1,
-0.5169554, -1.436601, -2.767072, 1, 1, 1, 1, 1,
-0.5120555, 1.324742, -0.2575274, 1, 1, 1, 1, 1,
-0.5107445, -1.310629, -3.851875, 1, 1, 1, 1, 1,
-0.5097079, 1.722194, -0.1629868, 1, 1, 1, 1, 1,
-0.5092502, 1.625667, 0.01406081, 1, 1, 1, 1, 1,
-0.5087081, 0.5646128, 0.9905428, 1, 1, 1, 1, 1,
-0.5064104, 0.7577121, -1.585155, 1, 1, 1, 1, 1,
-0.5042949, -0.4536011, -1.080403, 1, 1, 1, 1, 1,
-0.5011568, -0.4391294, -3.916831, 0, 0, 1, 1, 1,
-0.4971649, -1.223384, -4.239423, 1, 0, 0, 1, 1,
-0.4875622, 2.823459, 1.13001, 1, 0, 0, 1, 1,
-0.4869175, -0.6477565, -2.126479, 1, 0, 0, 1, 1,
-0.4847831, -0.4875339, -1.367519, 1, 0, 0, 1, 1,
-0.4805228, -0.3852769, -1.185109, 1, 0, 0, 1, 1,
-0.4751755, -1.169591, -4.310902, 0, 0, 0, 1, 1,
-0.4727778, -0.08510624, -3.534742, 0, 0, 0, 1, 1,
-0.4687367, -1.414914, -2.74092, 0, 0, 0, 1, 1,
-0.4672443, -1.11815, -4.951242, 0, 0, 0, 1, 1,
-0.4609754, -0.8097573, -3.609684, 0, 0, 0, 1, 1,
-0.4582497, -0.01244911, 0.09119045, 0, 0, 0, 1, 1,
-0.4558789, -0.8279338, -3.430757, 0, 0, 0, 1, 1,
-0.4541467, 0.5515146, -1.121061, 1, 1, 1, 1, 1,
-0.4466234, 0.5104734, -0.7651219, 1, 1, 1, 1, 1,
-0.4464408, -1.374429, -1.560552, 1, 1, 1, 1, 1,
-0.4438627, 0.8267127, -1.648612, 1, 1, 1, 1, 1,
-0.4380556, 2.1557, -0.3970179, 1, 1, 1, 1, 1,
-0.436132, -0.9235084, -4.335515, 1, 1, 1, 1, 1,
-0.4360694, -0.722714, -1.409261, 1, 1, 1, 1, 1,
-0.4342974, -0.4922847, -2.666099, 1, 1, 1, 1, 1,
-0.4322606, 0.2911322, -0.984008, 1, 1, 1, 1, 1,
-0.4307342, 1.460154, 0.768282, 1, 1, 1, 1, 1,
-0.4305637, -0.6386412, -3.565524, 1, 1, 1, 1, 1,
-0.4302302, 1.338973, -0.9562275, 1, 1, 1, 1, 1,
-0.4288064, 1.172351, -0.001844365, 1, 1, 1, 1, 1,
-0.4285791, 0.04286713, -0.2572276, 1, 1, 1, 1, 1,
-0.4265668, -0.4074537, -3.754326, 1, 1, 1, 1, 1,
-0.4216398, -0.4306367, -2.730669, 0, 0, 1, 1, 1,
-0.4187824, 0.1596792, -0.6377867, 1, 0, 0, 1, 1,
-0.4183058, -1.528261, -3.144647, 1, 0, 0, 1, 1,
-0.4155573, 0.5246497, -2.210757, 1, 0, 0, 1, 1,
-0.4143738, 0.6621948, 0.613645, 1, 0, 0, 1, 1,
-0.4140474, -0.03979732, -2.118761, 1, 0, 0, 1, 1,
-0.4131404, -0.2351994, -3.543462, 0, 0, 0, 1, 1,
-0.4117671, 0.2403135, -1.11839, 0, 0, 0, 1, 1,
-0.4116315, 0.2380616, -0.3608345, 0, 0, 0, 1, 1,
-0.4099338, -0.451514, -2.759038, 0, 0, 0, 1, 1,
-0.3970805, 0.5563549, -0.7571793, 0, 0, 0, 1, 1,
-0.3942341, 1.670094, -2.187944, 0, 0, 0, 1, 1,
-0.3862151, -0.591494, -2.067852, 0, 0, 0, 1, 1,
-0.3859307, 0.4692395, 1.09401, 1, 1, 1, 1, 1,
-0.3828449, 0.4278328, -1.387744, 1, 1, 1, 1, 1,
-0.3820378, -1.138755, -3.211012, 1, 1, 1, 1, 1,
-0.381839, -0.5701205, -1.716962, 1, 1, 1, 1, 1,
-0.3784299, 0.145086, -2.007122, 1, 1, 1, 1, 1,
-0.3757591, 0.198783, -1.578818, 1, 1, 1, 1, 1,
-0.3741182, 0.1554504, -1.176963, 1, 1, 1, 1, 1,
-0.3733262, -0.6310387, -2.21872, 1, 1, 1, 1, 1,
-0.3692724, -1.052467, -3.357344, 1, 1, 1, 1, 1,
-0.365307, 0.428282, -1.667482, 1, 1, 1, 1, 1,
-0.3639511, -1.481763, -2.66593, 1, 1, 1, 1, 1,
-0.3634681, 1.236922, -0.2260297, 1, 1, 1, 1, 1,
-0.362951, -0.3419707, -0.844717, 1, 1, 1, 1, 1,
-0.3598023, 0.9150252, 0.5553011, 1, 1, 1, 1, 1,
-0.3596939, 1.28641, -0.1305965, 1, 1, 1, 1, 1,
-0.3588411, 0.5634183, 0.1229597, 0, 0, 1, 1, 1,
-0.3584559, -0.3648291, -2.357588, 1, 0, 0, 1, 1,
-0.3577419, -0.8480524, -4.088868, 1, 0, 0, 1, 1,
-0.3566801, 0.59692, 1.116701, 1, 0, 0, 1, 1,
-0.3563076, 0.2951127, -0.6775009, 1, 0, 0, 1, 1,
-0.3521571, -3.030221, -2.676207, 1, 0, 0, 1, 1,
-0.3513297, 0.8304385, 1.31678, 0, 0, 0, 1, 1,
-0.3457403, 0.8492094, -1.617222, 0, 0, 0, 1, 1,
-0.3417303, -1.649717, -2.554665, 0, 0, 0, 1, 1,
-0.3412853, 0.4179155, -0.9347941, 0, 0, 0, 1, 1,
-0.34064, 0.09126826, -0.9407778, 0, 0, 0, 1, 1,
-0.3405281, 0.1921804, -1.409815, 0, 0, 0, 1, 1,
-0.3384273, -0.0977607, -1.393266, 0, 0, 0, 1, 1,
-0.3381277, -0.3114074, -3.212909, 1, 1, 1, 1, 1,
-0.3344843, -0.7160464, -3.381302, 1, 1, 1, 1, 1,
-0.3343805, -1.087433, -4.25293, 1, 1, 1, 1, 1,
-0.3336327, -0.5139704, -1.844935, 1, 1, 1, 1, 1,
-0.3327467, -0.3566374, -1.662798, 1, 1, 1, 1, 1,
-0.3315828, 0.7555614, -1.95801, 1, 1, 1, 1, 1,
-0.3307082, 1.317544, 0.2929636, 1, 1, 1, 1, 1,
-0.3300112, -1.112203, -2.468013, 1, 1, 1, 1, 1,
-0.329892, 0.266842, -0.1515528, 1, 1, 1, 1, 1,
-0.3296615, 0.206195, -1.808539, 1, 1, 1, 1, 1,
-0.3295224, 0.03036957, 0.2652623, 1, 1, 1, 1, 1,
-0.3250608, 0.2356615, -1.388264, 1, 1, 1, 1, 1,
-0.32307, 0.1410263, -0.8415363, 1, 1, 1, 1, 1,
-0.3206363, -1.259148, -2.916446, 1, 1, 1, 1, 1,
-0.3104832, -0.9477065, -2.385582, 1, 1, 1, 1, 1,
-0.3063003, -1.615329, -4.93319, 0, 0, 1, 1, 1,
-0.3062073, 1.026025, -1.464976, 1, 0, 0, 1, 1,
-0.2992218, -0.8447356, -2.729903, 1, 0, 0, 1, 1,
-0.2964384, -1.711628, -2.923071, 1, 0, 0, 1, 1,
-0.2951096, -0.01697718, -2.645757, 1, 0, 0, 1, 1,
-0.2932025, 2.71782, 0.4963703, 1, 0, 0, 1, 1,
-0.2931921, -0.1842818, -1.53979, 0, 0, 0, 1, 1,
-0.2912376, 0.8546634, -0.5940015, 0, 0, 0, 1, 1,
-0.2891034, 0.7956859, 1.132543, 0, 0, 0, 1, 1,
-0.2787232, 0.2377705, 0.2215372, 0, 0, 0, 1, 1,
-0.2773281, -0.9889104, -3.197206, 0, 0, 0, 1, 1,
-0.2743554, 1.22058, -1.390965, 0, 0, 0, 1, 1,
-0.2725964, 1.494811, 0.7537934, 0, 0, 0, 1, 1,
-0.2660397, 0.1187146, -2.633471, 1, 1, 1, 1, 1,
-0.2623595, 1.166113, -1.427104, 1, 1, 1, 1, 1,
-0.2492842, 0.3494065, -2.838971, 1, 1, 1, 1, 1,
-0.24652, 2.323927, 0.3388214, 1, 1, 1, 1, 1,
-0.2464176, -1.453965, -1.291981, 1, 1, 1, 1, 1,
-0.2434603, -0.198716, -2.903508, 1, 1, 1, 1, 1,
-0.2430464, -1.241592, -2.897017, 1, 1, 1, 1, 1,
-0.2427505, -1.360664, -2.231459, 1, 1, 1, 1, 1,
-0.2423038, 1.080831, 0.2866687, 1, 1, 1, 1, 1,
-0.2410604, 1.08172, -0.7986593, 1, 1, 1, 1, 1,
-0.2353063, 2.701373, -0.6197239, 1, 1, 1, 1, 1,
-0.2338746, -0.2704356, -2.288788, 1, 1, 1, 1, 1,
-0.2292713, 1.16859, 0.1170629, 1, 1, 1, 1, 1,
-0.2285541, -1.358353, -2.827917, 1, 1, 1, 1, 1,
-0.2281925, 0.3013117, -1.854426, 1, 1, 1, 1, 1,
-0.2276764, 1.603034, 0.1448882, 0, 0, 1, 1, 1,
-0.2226798, 0.4559062, -0.3693374, 1, 0, 0, 1, 1,
-0.2196217, 0.06685524, -0.774653, 1, 0, 0, 1, 1,
-0.2195812, 0.045357, -2.477787, 1, 0, 0, 1, 1,
-0.2161304, 1.3359, -0.7038252, 1, 0, 0, 1, 1,
-0.2141925, -0.1893437, -0.3184035, 1, 0, 0, 1, 1,
-0.214035, -1.481884, -3.513892, 0, 0, 0, 1, 1,
-0.2139228, -0.1584349, -1.821701, 0, 0, 0, 1, 1,
-0.2131403, 0.1866846, -1.933778, 0, 0, 0, 1, 1,
-0.208634, 0.4028481, -0.8722743, 0, 0, 0, 1, 1,
-0.2068778, -1.687405, -4.66046, 0, 0, 0, 1, 1,
-0.2016373, 0.02251617, -2.61136, 0, 0, 0, 1, 1,
-0.1927941, -0.3659817, -2.975626, 0, 0, 0, 1, 1,
-0.192045, 0.243223, -1.164571, 1, 1, 1, 1, 1,
-0.191083, -1.167523, -2.718865, 1, 1, 1, 1, 1,
-0.1908117, 1.208567, 0.519722, 1, 1, 1, 1, 1,
-0.1901965, 0.3028204, -0.5164754, 1, 1, 1, 1, 1,
-0.1888212, 1.164196, -0.219467, 1, 1, 1, 1, 1,
-0.1886303, 0.5332716, 2.338899, 1, 1, 1, 1, 1,
-0.1870743, -1.801424, -2.576061, 1, 1, 1, 1, 1,
-0.1826824, 0.6703708, 0.6593114, 1, 1, 1, 1, 1,
-0.1817472, -0.5380324, -4.286183, 1, 1, 1, 1, 1,
-0.1792625, -0.4120435, -4.41786, 1, 1, 1, 1, 1,
-0.1776123, -0.2708958, -3.514109, 1, 1, 1, 1, 1,
-0.1764251, -0.05803857, -1.50017, 1, 1, 1, 1, 1,
-0.176373, 0.5316909, 0.9495044, 1, 1, 1, 1, 1,
-0.1699885, 0.04160189, 0.2255495, 1, 1, 1, 1, 1,
-0.1649923, 0.01656546, -2.657165, 1, 1, 1, 1, 1,
-0.1647673, 0.5671279, 1.150896, 0, 0, 1, 1, 1,
-0.1610395, -0.3059381, -2.059741, 1, 0, 0, 1, 1,
-0.159467, 2.308934, 0.7703753, 1, 0, 0, 1, 1,
-0.1584464, 0.8426509, -0.558729, 1, 0, 0, 1, 1,
-0.1569666, 0.01734407, -0.2460283, 1, 0, 0, 1, 1,
-0.1546061, -1.109214, -3.472412, 1, 0, 0, 1, 1,
-0.1529959, 0.1252309, -0.6746964, 0, 0, 0, 1, 1,
-0.1506137, -1.19643, -4.165604, 0, 0, 0, 1, 1,
-0.1450566, -0.6905442, -3.030381, 0, 0, 0, 1, 1,
-0.1418038, -0.9474909, -3.052758, 0, 0, 0, 1, 1,
-0.1405069, 0.4170687, -0.3199762, 0, 0, 0, 1, 1,
-0.1400222, -1.348655, -2.993478, 0, 0, 0, 1, 1,
-0.1381689, -1.214207, -2.578157, 0, 0, 0, 1, 1,
-0.1314273, -0.3894235, -2.965431, 1, 1, 1, 1, 1,
-0.1296902, 1.124124, -0.9178847, 1, 1, 1, 1, 1,
-0.1290456, 1.204326, -1.327213, 1, 1, 1, 1, 1,
-0.1279504, 1.311358, -0.02637058, 1, 1, 1, 1, 1,
-0.1261669, 0.8685006, -0.4269164, 1, 1, 1, 1, 1,
-0.1208532, -0.1748625, -1.180044, 1, 1, 1, 1, 1,
-0.1197494, -0.5167291, -4.034069, 1, 1, 1, 1, 1,
-0.1136686, -0.1718751, -1.474331, 1, 1, 1, 1, 1,
-0.1120925, 0.5795214, 0.47003, 1, 1, 1, 1, 1,
-0.1115347, 0.8631158, -0.7453311, 1, 1, 1, 1, 1,
-0.1028814, -0.07939397, -2.233491, 1, 1, 1, 1, 1,
-0.1017623, -0.4232532, -2.755467, 1, 1, 1, 1, 1,
-0.09902325, 0.8912199, -1.315982, 1, 1, 1, 1, 1,
-0.098164, -0.7716547, -3.462379, 1, 1, 1, 1, 1,
-0.097679, 0.6100063, -0.8265618, 1, 1, 1, 1, 1,
-0.09757483, -0.5351737, -3.999765, 0, 0, 1, 1, 1,
-0.09349355, 1.062482, 0.5578902, 1, 0, 0, 1, 1,
-0.09244018, -1.517272, -4.0329, 1, 0, 0, 1, 1,
-0.09028158, -0.1063237, -0.6203935, 1, 0, 0, 1, 1,
-0.08606316, -2.257421, -3.121465, 1, 0, 0, 1, 1,
-0.08277021, 0.1009872, 0.1032456, 1, 0, 0, 1, 1,
-0.07904538, -2.008038, -3.453188, 0, 0, 0, 1, 1,
-0.07774379, -1.837526, -3.655182, 0, 0, 0, 1, 1,
-0.07606442, -0.4629487, -1.933656, 0, 0, 0, 1, 1,
-0.07464992, 0.6881112, -0.3387018, 0, 0, 0, 1, 1,
-0.06989343, 0.2317585, 0.9387666, 0, 0, 0, 1, 1,
-0.06892211, -0.6246392, -5.615044, 0, 0, 0, 1, 1,
-0.05981549, -1.79796, -3.772756, 0, 0, 0, 1, 1,
-0.05894278, -0.294753, -3.537499, 1, 1, 1, 1, 1,
-0.05845892, 0.9980019, -1.394465, 1, 1, 1, 1, 1,
-0.05590642, -1.530445, -1.586914, 1, 1, 1, 1, 1,
-0.05053566, 0.0366699, -1.38064, 1, 1, 1, 1, 1,
-0.04831745, -0.1902761, -2.376183, 1, 1, 1, 1, 1,
-0.04414186, 0.9990715, -0.9548092, 1, 1, 1, 1, 1,
-0.04151089, 0.6941965, 1.113804, 1, 1, 1, 1, 1,
-0.0408476, -1.11917, -3.593168, 1, 1, 1, 1, 1,
-0.03798262, 0.3614223, 0.6488548, 1, 1, 1, 1, 1,
-0.03783115, 0.1039222, 0.8301648, 1, 1, 1, 1, 1,
-0.035298, 1.559429, -0.1465399, 1, 1, 1, 1, 1,
-0.03422522, 0.4188396, -0.4446778, 1, 1, 1, 1, 1,
-0.03350538, 0.1901097, -0.4018286, 1, 1, 1, 1, 1,
-0.03246387, -0.02842925, -3.854292, 1, 1, 1, 1, 1,
-0.03162142, -0.7235829, -2.332397, 1, 1, 1, 1, 1,
-0.02938191, 0.9574952, 1.522023, 0, 0, 1, 1, 1,
-0.02873703, -1.722464, -4.359698, 1, 0, 0, 1, 1,
-0.02824926, 0.1220846, -0.03997158, 1, 0, 0, 1, 1,
-0.02764206, 1.117462, 1.138901, 1, 0, 0, 1, 1,
-0.02193593, -1.18794, -2.478507, 1, 0, 0, 1, 1,
-0.01845748, -0.7517988, -3.676544, 1, 0, 0, 1, 1,
-0.01724206, -0.9689092, -3.842055, 0, 0, 0, 1, 1,
-0.01615144, -0.2601959, -3.975177, 0, 0, 0, 1, 1,
-0.009911234, -0.7162803, -0.6886678, 0, 0, 0, 1, 1,
-0.009037315, -0.808649, -2.560893, 0, 0, 0, 1, 1,
-0.008844804, 2.470043, -0.6811275, 0, 0, 0, 1, 1,
-0.008667083, -0.2623785, -4.790809, 0, 0, 0, 1, 1,
0.001273424, -0.2907369, 4.013283, 0, 0, 0, 1, 1,
0.003177119, -0.3388664, 3.529946, 1, 1, 1, 1, 1,
0.007236961, 0.6359521, -1.145093, 1, 1, 1, 1, 1,
0.01251919, 0.3543565, 1.13504, 1, 1, 1, 1, 1,
0.01780906, 0.7328685, -0.3257066, 1, 1, 1, 1, 1,
0.02138663, -0.06453647, 3.228796, 1, 1, 1, 1, 1,
0.02473917, 0.8867669, -1.347805, 1, 1, 1, 1, 1,
0.03103472, -0.940657, 3.717564, 1, 1, 1, 1, 1,
0.03484406, 0.5250289, -0.3797108, 1, 1, 1, 1, 1,
0.03615919, 0.2396265, 0.8590987, 1, 1, 1, 1, 1,
0.03636197, -0.177093, 2.323953, 1, 1, 1, 1, 1,
0.03873559, -0.7571036, 3.528097, 1, 1, 1, 1, 1,
0.04192916, -0.251224, 3.602973, 1, 1, 1, 1, 1,
0.04640034, -0.1389882, 3.01352, 1, 1, 1, 1, 1,
0.04706194, -2.035026, 1.317918, 1, 1, 1, 1, 1,
0.04897226, -0.8534581, 3.579672, 1, 1, 1, 1, 1,
0.0521984, -0.09613259, 2.210511, 0, 0, 1, 1, 1,
0.05372085, 1.097671, 1.378202, 1, 0, 0, 1, 1,
0.05815466, 1.433823, 0.1686685, 1, 0, 0, 1, 1,
0.05965509, -2.15993, 2.957545, 1, 0, 0, 1, 1,
0.06742363, -0.7506132, 3.815396, 1, 0, 0, 1, 1,
0.06819996, -0.2234533, 2.376637, 1, 0, 0, 1, 1,
0.0743464, 1.519147, 1.415545, 0, 0, 0, 1, 1,
0.07460457, 2.437095, -0.5497012, 0, 0, 0, 1, 1,
0.0759809, -2.033561, 3.431663, 0, 0, 0, 1, 1,
0.07630651, 0.2051636, -0.4140048, 0, 0, 0, 1, 1,
0.08058554, -0.6831878, 0.9403358, 0, 0, 0, 1, 1,
0.0867101, -0.8107675, 3.979637, 0, 0, 0, 1, 1,
0.09026324, -1.002623, 2.699829, 0, 0, 0, 1, 1,
0.09405766, -0.4494775, 1.357463, 1, 1, 1, 1, 1,
0.1044693, -0.3596986, 2.439995, 1, 1, 1, 1, 1,
0.1066609, -0.658904, 1.71895, 1, 1, 1, 1, 1,
0.1096876, -0.7530189, 2.813071, 1, 1, 1, 1, 1,
0.1109884, -2.727593, 4.804573, 1, 1, 1, 1, 1,
0.1109913, -1.558575, 3.56122, 1, 1, 1, 1, 1,
0.1125271, -0.8893808, 2.111636, 1, 1, 1, 1, 1,
0.116626, 0.7935086, 2.052653, 1, 1, 1, 1, 1,
0.1167509, -1.367007, 2.795063, 1, 1, 1, 1, 1,
0.1183321, 0.5557442, 1.595192, 1, 1, 1, 1, 1,
0.1189099, 1.185208, -0.5001146, 1, 1, 1, 1, 1,
0.1199322, -1.359239, 1.83844, 1, 1, 1, 1, 1,
0.1264699, 0.06766028, 1.274807, 1, 1, 1, 1, 1,
0.128098, 0.2949425, 1.250541, 1, 1, 1, 1, 1,
0.1303923, 1.368179, 0.687435, 1, 1, 1, 1, 1,
0.1309096, 0.5060194, -1.00582, 0, 0, 1, 1, 1,
0.1415249, 0.1480181, 1.75326, 1, 0, 0, 1, 1,
0.1433887, -1.388162, 3.129539, 1, 0, 0, 1, 1,
0.1434245, -1.126226, 3.687253, 1, 0, 0, 1, 1,
0.1501711, -0.6691847, 2.430433, 1, 0, 0, 1, 1,
0.1504036, 0.7126784, -0.9087884, 1, 0, 0, 1, 1,
0.1519841, -0.08915253, -0.1330897, 0, 0, 0, 1, 1,
0.1573433, 0.4836988, 0.7282906, 0, 0, 0, 1, 1,
0.1595598, 0.2016045, 0.7497798, 0, 0, 0, 1, 1,
0.1637954, 1.76019, 0.3264951, 0, 0, 0, 1, 1,
0.1672485, -2.064575, 5.531663, 0, 0, 0, 1, 1,
0.1689256, 0.2376177, 1.719593, 0, 0, 0, 1, 1,
0.1690401, -0.0003727799, 2.405336, 0, 0, 0, 1, 1,
0.1721261, 1.024523, -0.3295285, 1, 1, 1, 1, 1,
0.1729483, 0.4967549, 0.1455446, 1, 1, 1, 1, 1,
0.1805881, 0.641043, 1.266719, 1, 1, 1, 1, 1,
0.1812695, 0.5194769, 2.350854, 1, 1, 1, 1, 1,
0.1813955, -0.4105167, 1.740862, 1, 1, 1, 1, 1,
0.181606, -0.2797807, 4.454605, 1, 1, 1, 1, 1,
0.1819282, 0.561169, -0.4876179, 1, 1, 1, 1, 1,
0.1824974, -0.1466879, 1.846843, 1, 1, 1, 1, 1,
0.1825065, -0.448168, 2.162524, 1, 1, 1, 1, 1,
0.1831508, -0.005535628, 2.403729, 1, 1, 1, 1, 1,
0.1840354, 0.9997331, 0.9873272, 1, 1, 1, 1, 1,
0.1871251, -0.4051582, 1.667077, 1, 1, 1, 1, 1,
0.1923924, -2.618933, 2.240907, 1, 1, 1, 1, 1,
0.1960962, -0.9856081, 2.499456, 1, 1, 1, 1, 1,
0.1984886, -0.1176359, 1.59381, 1, 1, 1, 1, 1,
0.1991081, -2.231036, 3.696393, 0, 0, 1, 1, 1,
0.2036021, -0.7386648, 3.327285, 1, 0, 0, 1, 1,
0.2041272, 1.664466, -0.576989, 1, 0, 0, 1, 1,
0.2052863, 0.6855535, -0.06682126, 1, 0, 0, 1, 1,
0.2057482, -1.281541, 3.721533, 1, 0, 0, 1, 1,
0.2082172, -1.83559, 3.127712, 1, 0, 0, 1, 1,
0.2144274, 0.07754932, 1.761769, 0, 0, 0, 1, 1,
0.2157945, -2.11974, 2.034791, 0, 0, 0, 1, 1,
0.2238904, -0.8286825, 3.803898, 0, 0, 0, 1, 1,
0.2256961, 2.560414, 0.2372293, 0, 0, 0, 1, 1,
0.2266145, 0.9288145, 0.6733469, 0, 0, 0, 1, 1,
0.2269721, 0.2232275, 1.713708, 0, 0, 0, 1, 1,
0.2270983, 0.681386, 2.342563, 0, 0, 0, 1, 1,
0.2277496, 1.801109, 0.390088, 1, 1, 1, 1, 1,
0.2281356, -1.32083, 4.278815, 1, 1, 1, 1, 1,
0.2342156, 2.498736, -0.5375383, 1, 1, 1, 1, 1,
0.2381894, 0.6552492, -0.8165318, 1, 1, 1, 1, 1,
0.23955, -0.58221, 4.146573, 1, 1, 1, 1, 1,
0.2402773, 1.283376, 0.3047698, 1, 1, 1, 1, 1,
0.2434455, 0.4952561, -0.7811093, 1, 1, 1, 1, 1,
0.2479058, 1.772562, -0.1963546, 1, 1, 1, 1, 1,
0.2519474, 1.234184, -1.362156, 1, 1, 1, 1, 1,
0.2533384, -0.3095711, 1.689287, 1, 1, 1, 1, 1,
0.2560934, -0.2903743, 1.742036, 1, 1, 1, 1, 1,
0.2586859, -0.7549464, 2.711425, 1, 1, 1, 1, 1,
0.2594947, 1.212046, 2.511345, 1, 1, 1, 1, 1,
0.2598061, 0.6978775, -1.113552, 1, 1, 1, 1, 1,
0.2599029, -0.8149796, 0.7995923, 1, 1, 1, 1, 1,
0.2645084, -0.9751378, 2.468286, 0, 0, 1, 1, 1,
0.2653145, 0.6204371, 0.7121743, 1, 0, 0, 1, 1,
0.2667344, 0.9458856, 0.2688495, 1, 0, 0, 1, 1,
0.267334, 0.1983933, 1.523777, 1, 0, 0, 1, 1,
0.2691959, -0.5630098, 4.453412, 1, 0, 0, 1, 1,
0.2737149, -0.0216716, 1.775139, 1, 0, 0, 1, 1,
0.2863986, 0.530234, -0.09034588, 0, 0, 0, 1, 1,
0.2955693, 0.008105412, 1.322823, 0, 0, 0, 1, 1,
0.2960499, 1.049341, 0.1669952, 0, 0, 0, 1, 1,
0.2988604, 0.07713139, 2.294331, 0, 0, 0, 1, 1,
0.2990456, 0.5754555, 1.837642, 0, 0, 0, 1, 1,
0.3001194, -0.7509855, 1.193303, 0, 0, 0, 1, 1,
0.3005586, -1.6421, 4.894138, 0, 0, 0, 1, 1,
0.3006365, 1.137354, 0.8824234, 1, 1, 1, 1, 1,
0.3009607, -1.094608, 3.958986, 1, 1, 1, 1, 1,
0.3049819, 0.5419878, 1.552789, 1, 1, 1, 1, 1,
0.3083973, 0.9495968, 1.288899, 1, 1, 1, 1, 1,
0.3128197, 0.7187908, -0.2749786, 1, 1, 1, 1, 1,
0.3134146, -0.6530606, 2.801313, 1, 1, 1, 1, 1,
0.3145816, 0.07596345, 2.941668, 1, 1, 1, 1, 1,
0.3168218, -0.9124348, 3.433002, 1, 1, 1, 1, 1,
0.325978, 0.187334, 0.2916648, 1, 1, 1, 1, 1,
0.3270026, -0.7218109, 2.216766, 1, 1, 1, 1, 1,
0.329015, 1.274253, -0.3446368, 1, 1, 1, 1, 1,
0.329179, 1.306084, 1.705648, 1, 1, 1, 1, 1,
0.3325084, -0.4036879, 1.2751, 1, 1, 1, 1, 1,
0.3336841, -0.4683667, 2.052285, 1, 1, 1, 1, 1,
0.3347733, 0.6396722, -1.006504, 1, 1, 1, 1, 1,
0.3379533, -0.924379, 3.681107, 0, 0, 1, 1, 1,
0.3411016, -0.6394414, 2.068202, 1, 0, 0, 1, 1,
0.3431713, 1.417343, -1.077873, 1, 0, 0, 1, 1,
0.3440157, 0.8249926, 3.756136, 1, 0, 0, 1, 1,
0.3452905, 0.4400385, 1.700769, 1, 0, 0, 1, 1,
0.3502261, 1.323866, 0.5889983, 1, 0, 0, 1, 1,
0.3522415, -1.976493, 1.311221, 0, 0, 0, 1, 1,
0.3535495, -0.3158695, 2.907951, 0, 0, 0, 1, 1,
0.3536351, 1.194565, -0.08335117, 0, 0, 0, 1, 1,
0.3546979, -0.5412417, 2.10905, 0, 0, 0, 1, 1,
0.3548428, 0.619759, -0.9860643, 0, 0, 0, 1, 1,
0.3617427, -1.470437, 2.558481, 0, 0, 0, 1, 1,
0.3618938, -0.04819429, 2.27138, 0, 0, 0, 1, 1,
0.3640018, 0.7049721, 1.11305, 1, 1, 1, 1, 1,
0.3662308, 0.6306737, 1.414197, 1, 1, 1, 1, 1,
0.3668485, -1.111436, 2.407144, 1, 1, 1, 1, 1,
0.3687717, 0.1256003, 3.156204, 1, 1, 1, 1, 1,
0.3736473, -1.092743, 2.853005, 1, 1, 1, 1, 1,
0.3778186, -0.311955, 4.603455, 1, 1, 1, 1, 1,
0.3810273, 0.646888, 2.053322, 1, 1, 1, 1, 1,
0.3811232, -0.214571, 1.556318, 1, 1, 1, 1, 1,
0.3843347, -0.3506304, 2.500619, 1, 1, 1, 1, 1,
0.3854817, 1.313042, 0.5962387, 1, 1, 1, 1, 1,
0.3936687, -0.1050159, 2.161981, 1, 1, 1, 1, 1,
0.4004299, -0.09170955, 0.8011062, 1, 1, 1, 1, 1,
0.4048625, 0.2154748, 0.2100311, 1, 1, 1, 1, 1,
0.4057947, -0.8289189, 4.216339, 1, 1, 1, 1, 1,
0.4061696, -0.876145, 4.088978, 1, 1, 1, 1, 1,
0.4071368, 1.653309, -2.297407, 0, 0, 1, 1, 1,
0.4075595, 1.429844, 0.3827242, 1, 0, 0, 1, 1,
0.4079048, -1.180803, 3.570038, 1, 0, 0, 1, 1,
0.4083842, -1.641831, 4.098641, 1, 0, 0, 1, 1,
0.4108748, -0.2702435, 2.200099, 1, 0, 0, 1, 1,
0.4147629, -1.29514, 2.703269, 1, 0, 0, 1, 1,
0.4202178, 0.5207754, 1.800636, 0, 0, 0, 1, 1,
0.4219795, -0.589567, 1.819131, 0, 0, 0, 1, 1,
0.428821, -0.7587317, 2.192889, 0, 0, 0, 1, 1,
0.4297958, -0.2033207, 1.731958, 0, 0, 0, 1, 1,
0.4300753, -0.3512522, 0.8910831, 0, 0, 0, 1, 1,
0.4352107, -0.6912796, 1.914638, 0, 0, 0, 1, 1,
0.4358362, -1.09594, 1.272279, 0, 0, 0, 1, 1,
0.436206, 1.592154, 1.151433, 1, 1, 1, 1, 1,
0.4401424, 0.2990113, 2.326781, 1, 1, 1, 1, 1,
0.4443516, -1.406359, 2.366452, 1, 1, 1, 1, 1,
0.4453441, 2.239509, 0.905064, 1, 1, 1, 1, 1,
0.4461947, -0.2459042, 1.301568, 1, 1, 1, 1, 1,
0.4471931, 0.3866377, 0.3481762, 1, 1, 1, 1, 1,
0.4531777, 0.3475963, -0.3856022, 1, 1, 1, 1, 1,
0.45397, 0.396576, 0.5208905, 1, 1, 1, 1, 1,
0.4700815, 1.230345, -0.09323855, 1, 1, 1, 1, 1,
0.4710574, 0.8076909, 0.125279, 1, 1, 1, 1, 1,
0.4780198, -1.835372, 6.222136, 1, 1, 1, 1, 1,
0.4798025, 0.05757118, 0.150421, 1, 1, 1, 1, 1,
0.4799917, 3.265979, -0.8000789, 1, 1, 1, 1, 1,
0.4818527, 0.9647114, 1.196799, 1, 1, 1, 1, 1,
0.485134, -0.3907026, 3.092141, 1, 1, 1, 1, 1,
0.4852903, -0.3530658, 2.168529, 0, 0, 1, 1, 1,
0.4895365, 1.30076, 0.2369702, 1, 0, 0, 1, 1,
0.4917591, 0.943552, 1.416041, 1, 0, 0, 1, 1,
0.4960042, 1.267527, -0.5380868, 1, 0, 0, 1, 1,
0.4994608, 1.308933, -1.066367, 1, 0, 0, 1, 1,
0.5009866, 1.190159, -0.5442909, 1, 0, 0, 1, 1,
0.506845, -0.06224706, 1.263702, 0, 0, 0, 1, 1,
0.5085207, 0.4339845, 1.679128, 0, 0, 0, 1, 1,
0.5117818, -1.632582, 3.604224, 0, 0, 0, 1, 1,
0.5134835, 0.9634157, 0.1225175, 0, 0, 0, 1, 1,
0.5155407, 0.6294905, 0.7991534, 0, 0, 0, 1, 1,
0.5164497, -1.478872, 3.399777, 0, 0, 0, 1, 1,
0.5165005, -0.4325128, 1.720839, 0, 0, 0, 1, 1,
0.5165809, -1.551549, 2.922859, 1, 1, 1, 1, 1,
0.5193656, -0.742512, 3.193748, 1, 1, 1, 1, 1,
0.5209922, 0.3803952, 0.5684056, 1, 1, 1, 1, 1,
0.5212124, -0.2025283, 2.186676, 1, 1, 1, 1, 1,
0.5247558, -0.3822401, 2.173399, 1, 1, 1, 1, 1,
0.5248025, -1.253998, 2.545842, 1, 1, 1, 1, 1,
0.5271236, 0.259278, -0.2455332, 1, 1, 1, 1, 1,
0.5286459, -1.003805, 2.6803, 1, 1, 1, 1, 1,
0.5306911, -0.7221664, 4.157019, 1, 1, 1, 1, 1,
0.5312316, 0.2505054, 0.8905774, 1, 1, 1, 1, 1,
0.5314317, -1.043805, 2.130586, 1, 1, 1, 1, 1,
0.5332612, 1.428902, 0.4287054, 1, 1, 1, 1, 1,
0.5344353, -0.7298778, 1.298391, 1, 1, 1, 1, 1,
0.5372975, -0.07570063, -0.1483239, 1, 1, 1, 1, 1,
0.5382733, -0.3564708, 0.6253334, 1, 1, 1, 1, 1,
0.5412166, -1.225165, 3.78638, 0, 0, 1, 1, 1,
0.5480297, 0.1034469, 2.83432, 1, 0, 0, 1, 1,
0.550618, -1.03166, 2.359548, 1, 0, 0, 1, 1,
0.5509614, -1.085343, 3.005429, 1, 0, 0, 1, 1,
0.5509962, -2.296166, 2.975897, 1, 0, 0, 1, 1,
0.5521894, -0.3866884, 0.8694955, 1, 0, 0, 1, 1,
0.5549163, -0.07859186, 1.207298, 0, 0, 0, 1, 1,
0.5591382, 1.041322, 1.389539, 0, 0, 0, 1, 1,
0.5601103, 1.14878, 1.251174, 0, 0, 0, 1, 1,
0.5615274, 0.8209449, 1.745427, 0, 0, 0, 1, 1,
0.5642839, 0.5760219, 2.366954, 0, 0, 0, 1, 1,
0.570637, 0.0227351, -0.03173041, 0, 0, 0, 1, 1,
0.5726231, 0.1813394, 2.950754, 0, 0, 0, 1, 1,
0.5729304, 0.564198, 0.6848662, 1, 1, 1, 1, 1,
0.5768421, 1.52536, -0.4208313, 1, 1, 1, 1, 1,
0.578363, -0.5503926, 2.002716, 1, 1, 1, 1, 1,
0.5792433, 0.9929792, 0.5670391, 1, 1, 1, 1, 1,
0.5802701, 1.613071, -0.8869186, 1, 1, 1, 1, 1,
0.5870395, 0.8610827, 0.05018071, 1, 1, 1, 1, 1,
0.5872239, -1.023899, 3.831802, 1, 1, 1, 1, 1,
0.5898588, 0.792006, 0.4460942, 1, 1, 1, 1, 1,
0.5928087, 1.582038, 0.8860433, 1, 1, 1, 1, 1,
0.5943438, 0.453899, 1.01708, 1, 1, 1, 1, 1,
0.6005325, 1.460678, -0.6428241, 1, 1, 1, 1, 1,
0.6006669, -0.5926963, 1.219988, 1, 1, 1, 1, 1,
0.6008292, 1.004847, -0.5963801, 1, 1, 1, 1, 1,
0.6063118, -0.4242732, 2.77063, 1, 1, 1, 1, 1,
0.6065838, -0.6208637, 1.007063, 1, 1, 1, 1, 1,
0.6085109, 1.924642, 0.615202, 0, 0, 1, 1, 1,
0.6201226, 0.04771071, 2.023711, 1, 0, 0, 1, 1,
0.6301011, -0.07922965, 2.830244, 1, 0, 0, 1, 1,
0.6333114, -0.2605134, 2.828848, 1, 0, 0, 1, 1,
0.6365731, -0.951188, 0.7965416, 1, 0, 0, 1, 1,
0.6372702, -0.791813, 1.608879, 1, 0, 0, 1, 1,
0.6372907, 1.531639, 1.947379, 0, 0, 0, 1, 1,
0.6397002, -1.418353, 3.011561, 0, 0, 0, 1, 1,
0.6418671, 0.1341244, 0.5015741, 0, 0, 0, 1, 1,
0.6433654, -0.01160613, 2.876146, 0, 0, 0, 1, 1,
0.6440915, 0.6183544, 0.08997048, 0, 0, 0, 1, 1,
0.6508499, 0.8412726, 0.6297368, 0, 0, 0, 1, 1,
0.6542568, -0.8363255, 2.179587, 0, 0, 0, 1, 1,
0.6563089, 0.7095896, 3.39737, 1, 1, 1, 1, 1,
0.6595949, -0.02430921, 1.076916, 1, 1, 1, 1, 1,
0.6650811, -2.01107, 4.283839, 1, 1, 1, 1, 1,
0.6707267, -0.05878021, 0.8063937, 1, 1, 1, 1, 1,
0.6709644, 0.5095849, 1.313955, 1, 1, 1, 1, 1,
0.673057, -0.009032724, 1.454169, 1, 1, 1, 1, 1,
0.674583, -0.8380778, 3.255198, 1, 1, 1, 1, 1,
0.6746256, 1.045989, 2.602258, 1, 1, 1, 1, 1,
0.6840825, 0.3169315, 0.3627078, 1, 1, 1, 1, 1,
0.6882606, 1.107101, -0.4452549, 1, 1, 1, 1, 1,
0.688907, -1.342046, 2.178853, 1, 1, 1, 1, 1,
0.6919181, -0.236611, 2.927771, 1, 1, 1, 1, 1,
0.6921353, -0.9387909, 2.085057, 1, 1, 1, 1, 1,
0.6928827, -0.2851736, 3.281436, 1, 1, 1, 1, 1,
0.6936159, 0.6635556, 1.245505, 1, 1, 1, 1, 1,
0.6937527, 0.7982966, -2.190187, 0, 0, 1, 1, 1,
0.6953917, 0.751122, -0.9672806, 1, 0, 0, 1, 1,
0.697009, 1.068237, 1.811552, 1, 0, 0, 1, 1,
0.6983274, -0.7812746, 1.520378, 1, 0, 0, 1, 1,
0.7005144, -0.9144624, 0.07374457, 1, 0, 0, 1, 1,
0.7033705, 1.259245, 0.7791603, 1, 0, 0, 1, 1,
0.7042961, -0.8803001, 1.943357, 0, 0, 0, 1, 1,
0.708405, 0.4370326, 0.6709872, 0, 0, 0, 1, 1,
0.7093682, -1.791844, 1.20029, 0, 0, 0, 1, 1,
0.7095875, -0.2156615, 2.413867, 0, 0, 0, 1, 1,
0.7119545, -0.2595389, 0.685362, 0, 0, 0, 1, 1,
0.7161989, 0.1720358, -0.591697, 0, 0, 0, 1, 1,
0.7180344, 1.011174, -0.3779866, 0, 0, 0, 1, 1,
0.7188292, -0.2171977, 1.35869, 1, 1, 1, 1, 1,
0.7203157, -0.7725483, 2.908839, 1, 1, 1, 1, 1,
0.7235137, -0.7376152, 2.457493, 1, 1, 1, 1, 1,
0.7269583, -0.08470211, 0.113832, 1, 1, 1, 1, 1,
0.730297, 0.474352, 1.422742, 1, 1, 1, 1, 1,
0.7304779, -1.297727, 3.021586, 1, 1, 1, 1, 1,
0.7346558, 0.5351957, 0.311093, 1, 1, 1, 1, 1,
0.7432145, 1.075036, 1.270296, 1, 1, 1, 1, 1,
0.7435764, 1.726435, 0.07263568, 1, 1, 1, 1, 1,
0.7558164, -1.311751, 2.676552, 1, 1, 1, 1, 1,
0.7562205, 0.6571719, 2.345958, 1, 1, 1, 1, 1,
0.7638057, 0.4398631, -1.078442, 1, 1, 1, 1, 1,
0.7645928, 0.81274, 0.6518176, 1, 1, 1, 1, 1,
0.7727698, -0.09565008, 1.586563, 1, 1, 1, 1, 1,
0.7747593, -1.818464, 2.994081, 1, 1, 1, 1, 1,
0.775331, -0.809631, 4.177581, 0, 0, 1, 1, 1,
0.7771039, -0.5377354, 2.154196, 1, 0, 0, 1, 1,
0.7825809, 0.04042274, 2.265066, 1, 0, 0, 1, 1,
0.785877, -0.5896527, 4.549127, 1, 0, 0, 1, 1,
0.7869746, 0.3232478, 0.60294, 1, 0, 0, 1, 1,
0.7923251, 0.8812102, 0.1351031, 1, 0, 0, 1, 1,
0.7927991, -1.812921, 2.674965, 0, 0, 0, 1, 1,
0.7933467, -0.3182232, 1.927928, 0, 0, 0, 1, 1,
0.794701, 0.0982741, 1.765283, 0, 0, 0, 1, 1,
0.7959743, -1.012018, 2.978047, 0, 0, 0, 1, 1,
0.7986544, -1.311956, 1.025302, 0, 0, 0, 1, 1,
0.8050151, 0.5826081, 1.807339, 0, 0, 0, 1, 1,
0.8128709, -2.248994, 2.713272, 0, 0, 0, 1, 1,
0.8185365, -0.268645, 2.450135, 1, 1, 1, 1, 1,
0.824049, 1.459307, 2.364643, 1, 1, 1, 1, 1,
0.8365183, -0.9237246, 3.445382, 1, 1, 1, 1, 1,
0.8443378, -0.9338128, 3.437679, 1, 1, 1, 1, 1,
0.8453316, -0.3689933, 1.978609, 1, 1, 1, 1, 1,
0.8531562, -0.8123922, 1.911034, 1, 1, 1, 1, 1,
0.854205, 0.7580479, 1.472661, 1, 1, 1, 1, 1,
0.8562787, 2.440401, 1.107848, 1, 1, 1, 1, 1,
0.8581408, -0.4746191, 1.690212, 1, 1, 1, 1, 1,
0.858337, 1.916956, -0.02372839, 1, 1, 1, 1, 1,
0.8622141, -1.124913, 2.693159, 1, 1, 1, 1, 1,
0.8629004, -0.3703397, 0.8150368, 1, 1, 1, 1, 1,
0.8792771, 1.840822, -0.8407131, 1, 1, 1, 1, 1,
0.8804845, -0.02831743, 1.349599, 1, 1, 1, 1, 1,
0.8841698, 0.1679145, 0.7419181, 1, 1, 1, 1, 1,
0.8890573, -0.8136222, 2.065714, 0, 0, 1, 1, 1,
0.8925658, 0.5035157, 1.155745, 1, 0, 0, 1, 1,
0.8952522, -1.279671, 2.212057, 1, 0, 0, 1, 1,
0.9050176, -0.4741252, 2.914653, 1, 0, 0, 1, 1,
0.9060015, -1.172471, 3.097903, 1, 0, 0, 1, 1,
0.9117275, 0.04511474, 2.582249, 1, 0, 0, 1, 1,
0.9121425, 0.1557769, 3.16222, 0, 0, 0, 1, 1,
0.91293, -1.544895, 3.784603, 0, 0, 0, 1, 1,
0.9155076, -0.1422653, 1.640998, 0, 0, 0, 1, 1,
0.9155549, -0.2545893, 1.37906, 0, 0, 0, 1, 1,
0.917854, -0.1569653, 0.6777713, 0, 0, 0, 1, 1,
0.9207056, 0.166503, 0.8525, 0, 0, 0, 1, 1,
0.9216404, -0.7477536, 1.214147, 0, 0, 0, 1, 1,
0.9223397, -0.5594867, 3.938917, 1, 1, 1, 1, 1,
0.9273863, -0.5202494, 2.655698, 1, 1, 1, 1, 1,
0.9339956, -0.856248, 1.868737, 1, 1, 1, 1, 1,
0.9530889, -1.190059, 2.207444, 1, 1, 1, 1, 1,
0.9569873, 1.652369, 0.4243148, 1, 1, 1, 1, 1,
0.9673889, -0.6270975, 0.5032249, 1, 1, 1, 1, 1,
0.9857584, 0.4204015, 1.247568, 1, 1, 1, 1, 1,
0.9956921, -0.9880611, 2.014797, 1, 1, 1, 1, 1,
1.005232, -0.7726171, 3.842417, 1, 1, 1, 1, 1,
1.012581, -0.5381348, 0.6801403, 1, 1, 1, 1, 1,
1.012814, 0.3447997, 3.252376, 1, 1, 1, 1, 1,
1.019013, -0.3566783, 2.398655, 1, 1, 1, 1, 1,
1.019875, -1.787421, -0.2956007, 1, 1, 1, 1, 1,
1.020446, 0.04390056, 3.232257, 1, 1, 1, 1, 1,
1.026695, -1.722976, 1.925781, 1, 1, 1, 1, 1,
1.051002, -0.2414289, 1.934065, 0, 0, 1, 1, 1,
1.055666, 0.1743635, 2.537273, 1, 0, 0, 1, 1,
1.056061, -0.3720865, 3.213196, 1, 0, 0, 1, 1,
1.057821, 0.5901977, 2.144359, 1, 0, 0, 1, 1,
1.068934, 0.5255477, 0.9490495, 1, 0, 0, 1, 1,
1.071793, 0.4548759, 0.5654683, 1, 0, 0, 1, 1,
1.071872, 0.939222, -0.5536965, 0, 0, 0, 1, 1,
1.082098, -0.1707352, 2.528438, 0, 0, 0, 1, 1,
1.082902, 0.6658286, 1.436927, 0, 0, 0, 1, 1,
1.094181, -1.349104, 1.670328, 0, 0, 0, 1, 1,
1.098487, 0.3975175, 1.430166, 0, 0, 0, 1, 1,
1.09955, -1.649664, 2.696608, 0, 0, 0, 1, 1,
1.102353, 0.4076294, 1.037785, 0, 0, 0, 1, 1,
1.108066, -1.843606, 3.589514, 1, 1, 1, 1, 1,
1.112506, -0.266681, 1.575155, 1, 1, 1, 1, 1,
1.120954, 0.7894, 2.242874, 1, 1, 1, 1, 1,
1.121698, 0.9783036, 0.9478722, 1, 1, 1, 1, 1,
1.126815, 1.395291, 0.9397534, 1, 1, 1, 1, 1,
1.133454, -0.2993484, 1.777787, 1, 1, 1, 1, 1,
1.142061, -0.2718208, -0.2187665, 1, 1, 1, 1, 1,
1.145589, -0.2150822, 1.806911, 1, 1, 1, 1, 1,
1.148584, 1.394986, 0.3014199, 1, 1, 1, 1, 1,
1.150997, 1.855741, -0.2317909, 1, 1, 1, 1, 1,
1.175446, -0.2413609, 2.601037, 1, 1, 1, 1, 1,
1.175475, -1.416833, 2.12627, 1, 1, 1, 1, 1,
1.183098, 1.033239, 0.07571413, 1, 1, 1, 1, 1,
1.190075, -0.4216431, 2.018318, 1, 1, 1, 1, 1,
1.19867, -1.076372, 1.928745, 1, 1, 1, 1, 1,
1.201266, -0.7391534, 2.338233, 0, 0, 1, 1, 1,
1.201949, 0.3279151, 1.688499, 1, 0, 0, 1, 1,
1.202339, 1.69739, 0.4345097, 1, 0, 0, 1, 1,
1.210614, 0.8794575, 1.048242, 1, 0, 0, 1, 1,
1.230235, -0.8270655, 2.468856, 1, 0, 0, 1, 1,
1.244346, -0.794146, 1.04433, 1, 0, 0, 1, 1,
1.249081, -1.028661, 0.925839, 0, 0, 0, 1, 1,
1.256336, 1.169889, 1.486188, 0, 0, 0, 1, 1,
1.274247, 1.030599, 0.5487593, 0, 0, 0, 1, 1,
1.279753, 1.587132, 1.172506, 0, 0, 0, 1, 1,
1.286614, 0.4191511, 1.638756, 0, 0, 0, 1, 1,
1.295772, -0.2858545, 1.578673, 0, 0, 0, 1, 1,
1.302095, 0.03665094, 2.25463, 0, 0, 0, 1, 1,
1.305711, 0.1314067, -0.3477597, 1, 1, 1, 1, 1,
1.309304, 0.9979053, 1.599946, 1, 1, 1, 1, 1,
1.310112, 0.3397874, 1.191384, 1, 1, 1, 1, 1,
1.321945, -0.4143263, 3.567201, 1, 1, 1, 1, 1,
1.329177, -0.4304215, 3.026314, 1, 1, 1, 1, 1,
1.334847, -0.2972273, 2.57231, 1, 1, 1, 1, 1,
1.343844, 0.2309131, -0.09079067, 1, 1, 1, 1, 1,
1.34738, 0.4339309, 0.7924207, 1, 1, 1, 1, 1,
1.352939, 0.5038736, -0.007768004, 1, 1, 1, 1, 1,
1.354989, 0.03987532, 1.640541, 1, 1, 1, 1, 1,
1.359645, 0.1808692, 1.947821, 1, 1, 1, 1, 1,
1.365208, -0.2965227, 1.962241, 1, 1, 1, 1, 1,
1.379552, -0.1431083, 0.163456, 1, 1, 1, 1, 1,
1.393479, -0.4060184, -0.676493, 1, 1, 1, 1, 1,
1.3978, 1.304757, 1.32564, 1, 1, 1, 1, 1,
1.403046, 0.7647088, 0.1897341, 0, 0, 1, 1, 1,
1.406678, -0.9304071, 1.674857, 1, 0, 0, 1, 1,
1.421149, 0.3366422, 1.527677, 1, 0, 0, 1, 1,
1.431341, -1.032242, 1.930467, 1, 0, 0, 1, 1,
1.441812, 0.1315691, 0.7440317, 1, 0, 0, 1, 1,
1.441956, 1.083811, 1.642205, 1, 0, 0, 1, 1,
1.448308, -0.5679218, 1.636822, 0, 0, 0, 1, 1,
1.453037, -0.08088014, 0.9392877, 0, 0, 0, 1, 1,
1.454349, -0.4634786, 2.899899, 0, 0, 0, 1, 1,
1.461397, -0.04053494, -0.2763854, 0, 0, 0, 1, 1,
1.462408, -0.2789346, 1.364137, 0, 0, 0, 1, 1,
1.46262, 0.57322, 1.944149, 0, 0, 0, 1, 1,
1.477368, -0.3175927, 2.336522, 0, 0, 0, 1, 1,
1.504636, 1.853937, 0.5649969, 1, 1, 1, 1, 1,
1.512819, 0.640965, 1.049469, 1, 1, 1, 1, 1,
1.516387, -0.2468547, 1.768512, 1, 1, 1, 1, 1,
1.519837, -0.7086447, 0.6378456, 1, 1, 1, 1, 1,
1.523761, -0.9142967, 2.296262, 1, 1, 1, 1, 1,
1.536031, 0.668671, 1.052637, 1, 1, 1, 1, 1,
1.536051, 0.3426665, 0.276131, 1, 1, 1, 1, 1,
1.542055, 1.11966, 1.227936, 1, 1, 1, 1, 1,
1.551494, 0.4518721, 0.9428676, 1, 1, 1, 1, 1,
1.556252, 0.2502457, 1.375968, 1, 1, 1, 1, 1,
1.55722, 1.126977, -0.2327538, 1, 1, 1, 1, 1,
1.572483, 0.8098847, 1.331246, 1, 1, 1, 1, 1,
1.573086, -0.5009218, 1.922026, 1, 1, 1, 1, 1,
1.599885, 0.7456263, 1.096529, 1, 1, 1, 1, 1,
1.619127, -0.5908573, 3.566575, 1, 1, 1, 1, 1,
1.627078, -1.066628, 1.544665, 0, 0, 1, 1, 1,
1.648148, -0.4458042, 0.9514619, 1, 0, 0, 1, 1,
1.696312, -0.7042806, 0.815109, 1, 0, 0, 1, 1,
1.699278, 0.1583971, 0.716247, 1, 0, 0, 1, 1,
1.704615, 0.5425761, 1.255056, 1, 0, 0, 1, 1,
1.70617, -1.204425, 3.97759, 1, 0, 0, 1, 1,
1.70941, -0.9452509, 2.066616, 0, 0, 0, 1, 1,
1.716384, 0.9860313, 2.165789, 0, 0, 0, 1, 1,
1.736932, 0.7909466, 3.671529, 0, 0, 0, 1, 1,
1.755492, 0.2793359, 1.992112, 0, 0, 0, 1, 1,
1.758633, 0.0150291, 1.283895, 0, 0, 0, 1, 1,
1.759036, 0.6666664, 1.486705, 0, 0, 0, 1, 1,
1.759457, -0.3709914, 1.523914, 0, 0, 0, 1, 1,
1.770384, -0.2139501, 1.340463, 1, 1, 1, 1, 1,
1.77094, -0.1504235, 0.3965794, 1, 1, 1, 1, 1,
1.790753, 1.210188, 0.8677874, 1, 1, 1, 1, 1,
1.802682, 0.009255726, 2.195332, 1, 1, 1, 1, 1,
1.805562, -1.796171, 3.218043, 1, 1, 1, 1, 1,
1.831618, 0.2737958, 0.2060551, 1, 1, 1, 1, 1,
1.856924, 1.463968, 1.354486, 1, 1, 1, 1, 1,
1.900549, 0.1398341, 1.967811, 1, 1, 1, 1, 1,
1.908976, 1.224706, 0.9753035, 1, 1, 1, 1, 1,
1.920658, -0.7679594, 2.656536, 1, 1, 1, 1, 1,
1.947899, 0.05966216, 0.3211679, 1, 1, 1, 1, 1,
1.951216, 1.193744, 0.244459, 1, 1, 1, 1, 1,
1.977391, -1.023819, 1.289105, 1, 1, 1, 1, 1,
1.979509, 0.3222597, 1.019711, 1, 1, 1, 1, 1,
1.994191, -0.9425661, 1.528088, 1, 1, 1, 1, 1,
2.000597, 0.120673, 3.569077, 0, 0, 1, 1, 1,
2.049318, -0.7480193, 2.566664, 1, 0, 0, 1, 1,
2.087816, -0.004478197, 0.6584012, 1, 0, 0, 1, 1,
2.130811, -1.735273, 1.747737, 1, 0, 0, 1, 1,
2.135306, 2.034572, -0.07861908, 1, 0, 0, 1, 1,
2.139095, 1.728656, 1.671606, 1, 0, 0, 1, 1,
2.183382, 1.368001, 1.318716, 0, 0, 0, 1, 1,
2.21386, -1.894202, 0.4434353, 0, 0, 0, 1, 1,
2.320226, 1.316768, 2.093976, 0, 0, 0, 1, 1,
2.32637, 0.945588, 1.736434, 0, 0, 0, 1, 1,
2.372718, 0.7553216, 2.401249, 0, 0, 0, 1, 1,
2.400877, 0.8431715, -0.05192168, 0, 0, 0, 1, 1,
2.415426, 0.8419392, 2.607862, 0, 0, 0, 1, 1,
2.468152, 2.292304, -0.9582233, 1, 1, 1, 1, 1,
2.483881, -0.1596655, 2.378939, 1, 1, 1, 1, 1,
2.505498, 1.277803, 2.415681, 1, 1, 1, 1, 1,
2.662438, 0.8014041, 1.023103, 1, 1, 1, 1, 1,
2.696343, 1.102871, 1.165754, 1, 1, 1, 1, 1,
2.72937, 1.328702, 1.121817, 1, 1, 1, 1, 1,
2.733121, 1.792547, 2.168177, 1, 1, 1, 1, 1
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
var radius = 10.26856;
var distance = 36.06786;
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
mvMatrix.translate( 0.4788884, 0.3746302, -0.3035462 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -36.06786);
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