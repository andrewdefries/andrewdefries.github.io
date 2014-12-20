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
-3.095862, -1.938241, -1.474292, 1, 0, 0, 1,
-2.845224, 1.460654, -1.542812, 1, 0.007843138, 0, 1,
-2.833362, 0.5344312, -1.807248, 1, 0.01176471, 0, 1,
-2.569437, -1.169162, -1.844719, 1, 0.01960784, 0, 1,
-2.513198, 0.7611949, -0.6527476, 1, 0.02352941, 0, 1,
-2.44588, -0.1271377, -1.295011, 1, 0.03137255, 0, 1,
-2.365023, -0.3758733, -1.271757, 1, 0.03529412, 0, 1,
-2.364208, -0.006685569, -1.441349, 1, 0.04313726, 0, 1,
-2.24799, 0.02659944, -1.083851, 1, 0.04705882, 0, 1,
-2.237709, -0.3332571, -0.9463188, 1, 0.05490196, 0, 1,
-2.205961, 0.9186067, -2.883218, 1, 0.05882353, 0, 1,
-2.141864, -0.2188203, -1.439041, 1, 0.06666667, 0, 1,
-2.132303, 0.4855685, -1.516641, 1, 0.07058824, 0, 1,
-2.122671, 0.4892843, -1.631169, 1, 0.07843138, 0, 1,
-2.095243, -0.5183741, -0.6692428, 1, 0.08235294, 0, 1,
-2.029434, -1.098638, -2.0136, 1, 0.09019608, 0, 1,
-2.019526, -1.708875, -2.932739, 1, 0.09411765, 0, 1,
-2.006234, 1.212553, -1.28688, 1, 0.1019608, 0, 1,
-1.998363, 1.999826, -0.55433, 1, 0.1098039, 0, 1,
-1.993072, 0.6106303, -2.604528, 1, 0.1137255, 0, 1,
-1.992497, -0.5052478, -1.091411, 1, 0.1215686, 0, 1,
-1.985267, -0.818823, -3.376585, 1, 0.1254902, 0, 1,
-1.982397, 0.4922686, -1.546374, 1, 0.1333333, 0, 1,
-1.97412, 1.513676, -1.081179, 1, 0.1372549, 0, 1,
-1.968683, 0.08725375, -2.25444, 1, 0.145098, 0, 1,
-1.937999, 0.9783651, -1.718984, 1, 0.1490196, 0, 1,
-1.876233, -0.6236548, -1.929869, 1, 0.1568628, 0, 1,
-1.861539, -0.9956678, -2.713198, 1, 0.1607843, 0, 1,
-1.856916, -1.765859, -3.579093, 1, 0.1686275, 0, 1,
-1.836731, -0.6029597, -1.797421, 1, 0.172549, 0, 1,
-1.835663, -0.7703427, -1.015167, 1, 0.1803922, 0, 1,
-1.835512, -0.2449515, -2.539404, 1, 0.1843137, 0, 1,
-1.83477, -0.01418343, -1.504235, 1, 0.1921569, 0, 1,
-1.833224, 0.2043694, 0.4501109, 1, 0.1960784, 0, 1,
-1.829984, 1.332112, 0.9315671, 1, 0.2039216, 0, 1,
-1.825928, 0.3322496, -0.5115604, 1, 0.2117647, 0, 1,
-1.824483, -0.9311312, -3.454031, 1, 0.2156863, 0, 1,
-1.805977, 0.274, -1.755461, 1, 0.2235294, 0, 1,
-1.797414, 1.265721, -1.176445, 1, 0.227451, 0, 1,
-1.792976, 1.394795, -1.552174, 1, 0.2352941, 0, 1,
-1.769735, -0.06330552, -2.164202, 1, 0.2392157, 0, 1,
-1.715, 0.01899158, -0.5586801, 1, 0.2470588, 0, 1,
-1.707721, -0.8375374, -1.602503, 1, 0.2509804, 0, 1,
-1.707429, -0.351455, -1.73885, 1, 0.2588235, 0, 1,
-1.690602, -0.5800258, -2.269131, 1, 0.2627451, 0, 1,
-1.688755, -1.376947, -2.147597, 1, 0.2705882, 0, 1,
-1.676495, -0.4650235, -2.067184, 1, 0.2745098, 0, 1,
-1.674367, -2.094882, -1.099597, 1, 0.282353, 0, 1,
-1.673036, -1.065884, -2.129862, 1, 0.2862745, 0, 1,
-1.666578, -0.2141295, -2.233197, 1, 0.2941177, 0, 1,
-1.663873, -1.279877, -1.969645, 1, 0.3019608, 0, 1,
-1.658039, 1.250668, 0.3456683, 1, 0.3058824, 0, 1,
-1.649957, -1.294656, -1.495368, 1, 0.3137255, 0, 1,
-1.636819, -0.3138581, -2.586937, 1, 0.3176471, 0, 1,
-1.623483, -0.6943584, -2.613767, 1, 0.3254902, 0, 1,
-1.615681, -0.3408612, -1.099685, 1, 0.3294118, 0, 1,
-1.578459, -0.8562964, -1.474363, 1, 0.3372549, 0, 1,
-1.57139, -1.086684, -1.883714, 1, 0.3411765, 0, 1,
-1.568326, 1.585581, 0.2656645, 1, 0.3490196, 0, 1,
-1.562373, 0.3879749, -1.936335, 1, 0.3529412, 0, 1,
-1.558741, -1.114578, -0.4836107, 1, 0.3607843, 0, 1,
-1.552522, 1.521262, -1.34419, 1, 0.3647059, 0, 1,
-1.524841, -0.3367529, -0.6807406, 1, 0.372549, 0, 1,
-1.522124, 1.224162, -0.03678668, 1, 0.3764706, 0, 1,
-1.519369, 0.11146, -1.978864, 1, 0.3843137, 0, 1,
-1.515046, 0.7743561, -1.927244, 1, 0.3882353, 0, 1,
-1.513881, -0.592178, 0.1820862, 1, 0.3960784, 0, 1,
-1.50787, 0.4612987, -0.9007863, 1, 0.4039216, 0, 1,
-1.504951, -0.4019439, -0.6963505, 1, 0.4078431, 0, 1,
-1.494049, 0.9041219, 0.09011576, 1, 0.4156863, 0, 1,
-1.49285, -1.288309, -3.821328, 1, 0.4196078, 0, 1,
-1.489955, 0.4596406, -1.504394, 1, 0.427451, 0, 1,
-1.468973, 1.065947, 1.152399, 1, 0.4313726, 0, 1,
-1.465792, 0.1285915, -0.8007962, 1, 0.4392157, 0, 1,
-1.462694, 2.28673, 2.26827, 1, 0.4431373, 0, 1,
-1.442966, 0.8762383, -0.6509579, 1, 0.4509804, 0, 1,
-1.422281, 1.115399, 0.1652311, 1, 0.454902, 0, 1,
-1.412743, -0.8374412, -0.6015522, 1, 0.4627451, 0, 1,
-1.412461, -0.2045678, -1.445064, 1, 0.4666667, 0, 1,
-1.411402, -2.258062, -0.7659523, 1, 0.4745098, 0, 1,
-1.403221, 2.049443, -1.313225, 1, 0.4784314, 0, 1,
-1.402006, 2.082352, -1.497015, 1, 0.4862745, 0, 1,
-1.401708, 0.1353052, -0.5971023, 1, 0.4901961, 0, 1,
-1.394969, -0.2000497, -0.07901153, 1, 0.4980392, 0, 1,
-1.379595, -1.692367, -1.390808, 1, 0.5058824, 0, 1,
-1.374285, 0.5598974, -0.2047508, 1, 0.509804, 0, 1,
-1.371967, -0.9630466, -0.9808592, 1, 0.5176471, 0, 1,
-1.367355, 0.2367, -0.9885018, 1, 0.5215687, 0, 1,
-1.339518, 0.6788352, -0.8654262, 1, 0.5294118, 0, 1,
-1.335057, 1.277065, -1.056999, 1, 0.5333334, 0, 1,
-1.332057, -0.9830772, -3.644394, 1, 0.5411765, 0, 1,
-1.307104, -0.4322054, -1.836085, 1, 0.5450981, 0, 1,
-1.297033, 0.9942854, -2.574935, 1, 0.5529412, 0, 1,
-1.294008, 0.5684263, -1.572667, 1, 0.5568628, 0, 1,
-1.292404, -1.732753, -3.354458, 1, 0.5647059, 0, 1,
-1.286718, 0.7533492, -0.5486737, 1, 0.5686275, 0, 1,
-1.282272, 0.8342042, -0.4620825, 1, 0.5764706, 0, 1,
-1.252353, -2.202344, -2.026438, 1, 0.5803922, 0, 1,
-1.249686, 0.3790323, -2.434439, 1, 0.5882353, 0, 1,
-1.24803, 0.2499921, -2.040607, 1, 0.5921569, 0, 1,
-1.246661, -0.5351204, -2.588536, 1, 0.6, 0, 1,
-1.240051, 0.007212524, -1.594377, 1, 0.6078432, 0, 1,
-1.234894, 0.425373, -0.1094067, 1, 0.6117647, 0, 1,
-1.226968, -1.166913, -2.678671, 1, 0.6196079, 0, 1,
-1.225032, -1.553085, -1.901715, 1, 0.6235294, 0, 1,
-1.223454, 1.466515, -0.1021116, 1, 0.6313726, 0, 1,
-1.218383, -2.099924, -2.995802, 1, 0.6352941, 0, 1,
-1.20991, 2.404989, -0.3731453, 1, 0.6431373, 0, 1,
-1.208205, -0.8656985, -2.121107, 1, 0.6470588, 0, 1,
-1.203987, -0.2250667, -4.178285, 1, 0.654902, 0, 1,
-1.197108, -0.0212013, -2.877769, 1, 0.6588235, 0, 1,
-1.18711, -0.1069035, -0.8716405, 1, 0.6666667, 0, 1,
-1.181517, -0.7657787, -2.846146, 1, 0.6705883, 0, 1,
-1.170967, 0.75717, -1.294627, 1, 0.6784314, 0, 1,
-1.15724, -0.2215992, -0.6459984, 1, 0.682353, 0, 1,
-1.15586, 0.06049738, -1.847091, 1, 0.6901961, 0, 1,
-1.153526, -0.09509984, -1.952372, 1, 0.6941177, 0, 1,
-1.14602, -0.8712177, -0.3399082, 1, 0.7019608, 0, 1,
-1.144106, -0.2228187, -2.968771, 1, 0.7098039, 0, 1,
-1.135342, -0.2163435, -0.1649531, 1, 0.7137255, 0, 1,
-1.135211, -0.4578487, -1.130768, 1, 0.7215686, 0, 1,
-1.131622, 0.4138739, -1.350904, 1, 0.7254902, 0, 1,
-1.111992, -0.4914913, 0.3087177, 1, 0.7333333, 0, 1,
-1.110376, -0.9899283, -1.344786, 1, 0.7372549, 0, 1,
-1.105991, -0.3124288, -1.795186, 1, 0.7450981, 0, 1,
-1.103283, -0.7525128, -1.61391, 1, 0.7490196, 0, 1,
-1.100206, 1.295068, -2.570429, 1, 0.7568628, 0, 1,
-1.097411, 0.3713814, -0.6658295, 1, 0.7607843, 0, 1,
-1.097361, 1.92154, -0.7242184, 1, 0.7686275, 0, 1,
-1.094601, -0.5257547, -2.957323, 1, 0.772549, 0, 1,
-1.094227, -1.206334, -2.153458, 1, 0.7803922, 0, 1,
-1.080016, 0.009309523, -0.9417243, 1, 0.7843137, 0, 1,
-1.078134, 0.3499382, -1.142156, 1, 0.7921569, 0, 1,
-1.077813, 0.7042874, -1.332766, 1, 0.7960784, 0, 1,
-1.075611, -0.3280036, -1.750364, 1, 0.8039216, 0, 1,
-1.069302, -0.9518193, -3.386305, 1, 0.8117647, 0, 1,
-1.068807, -0.5638342, -3.853606, 1, 0.8156863, 0, 1,
-1.067893, 0.5159283, -1.165857, 1, 0.8235294, 0, 1,
-1.062203, 2.588789, 0.6597051, 1, 0.827451, 0, 1,
-1.059221, -0.3218949, 0.02703816, 1, 0.8352941, 0, 1,
-1.053932, -1.392942, -1.789183, 1, 0.8392157, 0, 1,
-1.053734, -0.1569503, -1.877909, 1, 0.8470588, 0, 1,
-1.047858, 2.339986, -0.4773887, 1, 0.8509804, 0, 1,
-1.044746, -0.665442, -1.473233, 1, 0.8588235, 0, 1,
-1.029429, 1.671699, -0.4738254, 1, 0.8627451, 0, 1,
-1.028027, -0.9699444, -1.136651, 1, 0.8705882, 0, 1,
-1.027053, 0.4151998, -2.416336, 1, 0.8745098, 0, 1,
-1.026648, -0.1190633, -1.057897, 1, 0.8823529, 0, 1,
-1.024172, -0.9241097, -1.720536, 1, 0.8862745, 0, 1,
-1.020939, -0.8382534, -3.043934, 1, 0.8941177, 0, 1,
-1.019932, -0.2066894, -4.118154, 1, 0.8980392, 0, 1,
-1.013405, -0.3037703, -1.981534, 1, 0.9058824, 0, 1,
-1.00129, -0.1166532, 0.1699841, 1, 0.9137255, 0, 1,
-0.9990071, -0.9966415, -3.105603, 1, 0.9176471, 0, 1,
-0.9904408, -0.3967062, -2.392531, 1, 0.9254902, 0, 1,
-0.9855682, 0.5525612, -1.292482, 1, 0.9294118, 0, 1,
-0.9802217, -0.2325594, -1.118803, 1, 0.9372549, 0, 1,
-0.9797698, -1.183007, -1.889448, 1, 0.9411765, 0, 1,
-0.979652, -1.066848, -1.466681, 1, 0.9490196, 0, 1,
-0.9763696, 1.854115, -0.0659048, 1, 0.9529412, 0, 1,
-0.9682325, 0.6379421, -0.198808, 1, 0.9607843, 0, 1,
-0.9644045, 0.5207234, -1.551858, 1, 0.9647059, 0, 1,
-0.9591197, -0.754477, -0.9661652, 1, 0.972549, 0, 1,
-0.9581553, 0.7482599, -1.363327, 1, 0.9764706, 0, 1,
-0.9525361, 1.108202, -2.269649, 1, 0.9843137, 0, 1,
-0.9519299, -0.1262657, -1.514759, 1, 0.9882353, 0, 1,
-0.9516346, 0.2224921, 0.04684075, 1, 0.9960784, 0, 1,
-0.9490893, 2.688984, 0.4671282, 0.9960784, 1, 0, 1,
-0.9480087, 0.8065358, -1.209105, 0.9921569, 1, 0, 1,
-0.940684, 0.2468965, -0.9938801, 0.9843137, 1, 0, 1,
-0.9368861, -0.1577652, -1.229911, 0.9803922, 1, 0, 1,
-0.9340028, -0.4547699, -1.476665, 0.972549, 1, 0, 1,
-0.928979, -1.241821, -2.498401, 0.9686275, 1, 0, 1,
-0.9285396, 0.3098968, -3.15849, 0.9607843, 1, 0, 1,
-0.9194002, 0.380798, -1.780449, 0.9568627, 1, 0, 1,
-0.912396, -1.051726, -2.404357, 0.9490196, 1, 0, 1,
-0.9079381, -0.3630383, -2.928828, 0.945098, 1, 0, 1,
-0.9031456, -1.015519, -2.731367, 0.9372549, 1, 0, 1,
-0.9013515, -0.4701173, -4.266988, 0.9333333, 1, 0, 1,
-0.9012101, 0.3884425, -1.386561, 0.9254902, 1, 0, 1,
-0.8960571, -0.9547248, -2.380604, 0.9215686, 1, 0, 1,
-0.8926435, -0.4827316, -1.595401, 0.9137255, 1, 0, 1,
-0.8918197, 1.495776, 1.252102, 0.9098039, 1, 0, 1,
-0.8901232, 1.655648, 0.6158345, 0.9019608, 1, 0, 1,
-0.8797473, -0.2108053, -4.292648, 0.8941177, 1, 0, 1,
-0.8761598, 0.7955041, -1.252574, 0.8901961, 1, 0, 1,
-0.875523, 0.4216013, -0.5198184, 0.8823529, 1, 0, 1,
-0.873375, 0.922857, -0.4845735, 0.8784314, 1, 0, 1,
-0.8703922, 0.1852114, -0.8670653, 0.8705882, 1, 0, 1,
-0.8663128, 1.575037, 0.3573419, 0.8666667, 1, 0, 1,
-0.8614499, -0.9988226, -2.788761, 0.8588235, 1, 0, 1,
-0.8598214, 0.6687025, -0.4504971, 0.854902, 1, 0, 1,
-0.8589538, 1.024383, -2.305301, 0.8470588, 1, 0, 1,
-0.8585848, -0.07662245, 0.8476696, 0.8431373, 1, 0, 1,
-0.8581479, 0.8709805, -1.767895, 0.8352941, 1, 0, 1,
-0.8560446, -0.07424815, -1.123058, 0.8313726, 1, 0, 1,
-0.8469714, 0.5587292, -0.8978581, 0.8235294, 1, 0, 1,
-0.8415041, 0.5998303, -0.2344743, 0.8196079, 1, 0, 1,
-0.8402786, 0.7262546, -0.5654944, 0.8117647, 1, 0, 1,
-0.8368471, 1.333257, -1.12537, 0.8078431, 1, 0, 1,
-0.833885, 0.7562941, -1.208512, 0.8, 1, 0, 1,
-0.8308107, -0.2244897, -1.720177, 0.7921569, 1, 0, 1,
-0.8251647, 0.267166, -1.919115, 0.7882353, 1, 0, 1,
-0.8175387, -0.6025751, -0.2086105, 0.7803922, 1, 0, 1,
-0.8155307, -1.589903, -2.365313, 0.7764706, 1, 0, 1,
-0.8089046, 0.9331871, -1.343289, 0.7686275, 1, 0, 1,
-0.8037396, -0.06366936, -0.2725083, 0.7647059, 1, 0, 1,
-0.79735, -0.2021959, -2.905708, 0.7568628, 1, 0, 1,
-0.7907907, 1.471222, 0.6016768, 0.7529412, 1, 0, 1,
-0.7864725, 1.504441, -0.5863132, 0.7450981, 1, 0, 1,
-0.7840839, 0.3173577, -0.8634059, 0.7411765, 1, 0, 1,
-0.7806503, 0.908548, -1.221594, 0.7333333, 1, 0, 1,
-0.7769332, 0.2373041, -2.493271, 0.7294118, 1, 0, 1,
-0.774963, -0.6291698, -0.185691, 0.7215686, 1, 0, 1,
-0.7712545, -0.6034164, -2.857189, 0.7176471, 1, 0, 1,
-0.7694397, -0.2739721, -3.150968, 0.7098039, 1, 0, 1,
-0.7662605, 0.7526981, -2.299577, 0.7058824, 1, 0, 1,
-0.7638382, -0.3597037, -1.439207, 0.6980392, 1, 0, 1,
-0.7637678, 0.5282811, -0.947723, 0.6901961, 1, 0, 1,
-0.7575098, -0.2118972, -3.053287, 0.6862745, 1, 0, 1,
-0.7559565, -0.1439718, -0.1512738, 0.6784314, 1, 0, 1,
-0.7528593, 0.3601377, -2.247149, 0.6745098, 1, 0, 1,
-0.7474334, -0.5110259, -2.252398, 0.6666667, 1, 0, 1,
-0.7368578, -0.8413868, -2.509002, 0.6627451, 1, 0, 1,
-0.7328323, 1.130985, 0.4019046, 0.654902, 1, 0, 1,
-0.7270836, -0.459643, -2.093759, 0.6509804, 1, 0, 1,
-0.7259627, 0.7420174, -1.018326, 0.6431373, 1, 0, 1,
-0.7256792, -0.1375195, -3.050223, 0.6392157, 1, 0, 1,
-0.7256232, -0.7786529, -0.8719946, 0.6313726, 1, 0, 1,
-0.7228292, -0.585541, -1.42545, 0.627451, 1, 0, 1,
-0.7128796, 0.6199835, -2.26977, 0.6196079, 1, 0, 1,
-0.7101344, 0.361298, -1.244741, 0.6156863, 1, 0, 1,
-0.7099929, -0.4448931, 0.4034318, 0.6078432, 1, 0, 1,
-0.703701, 0.9726948, -1.099662, 0.6039216, 1, 0, 1,
-0.6943381, 0.7502301, -0.2359946, 0.5960785, 1, 0, 1,
-0.6938829, 0.6025906, -0.553681, 0.5882353, 1, 0, 1,
-0.693275, -0.5562031, -2.484345, 0.5843138, 1, 0, 1,
-0.6898559, 0.9665785, -0.4496855, 0.5764706, 1, 0, 1,
-0.6894759, 0.3238876, -2.153967, 0.572549, 1, 0, 1,
-0.6832393, -1.842273, -4.711197, 0.5647059, 1, 0, 1,
-0.6790441, -0.6650903, -3.610912, 0.5607843, 1, 0, 1,
-0.6766347, -0.651685, -2.952638, 0.5529412, 1, 0, 1,
-0.6761457, -1.041469, 0.6460969, 0.5490196, 1, 0, 1,
-0.6760892, 1.195789, -0.4443214, 0.5411765, 1, 0, 1,
-0.6714098, -0.8647761, -1.119986, 0.5372549, 1, 0, 1,
-0.6708109, 0.8530923, -1.623743, 0.5294118, 1, 0, 1,
-0.6594039, -0.1349445, -2.886436, 0.5254902, 1, 0, 1,
-0.656886, 1.804155, 1.465583, 0.5176471, 1, 0, 1,
-0.6547296, -0.01128173, -0.4656716, 0.5137255, 1, 0, 1,
-0.654158, 1.138997, 0.3664252, 0.5058824, 1, 0, 1,
-0.6479881, 0.9681836, -1.042443, 0.5019608, 1, 0, 1,
-0.6474704, 0.04175177, -1.998636, 0.4941176, 1, 0, 1,
-0.6472408, 0.3430612, 0.3753254, 0.4862745, 1, 0, 1,
-0.6465522, -1.77754, -2.646284, 0.4823529, 1, 0, 1,
-0.6411088, 0.7244077, -0.7118504, 0.4745098, 1, 0, 1,
-0.6370527, 1.809355, 0.1832179, 0.4705882, 1, 0, 1,
-0.63577, -0.4801745, -4.386591, 0.4627451, 1, 0, 1,
-0.6354099, 0.323386, -0.08771765, 0.4588235, 1, 0, 1,
-0.6338546, 1.444391, 0.9281193, 0.4509804, 1, 0, 1,
-0.6310138, -0.7097731, -3.451382, 0.4470588, 1, 0, 1,
-0.6290295, -0.0262631, -1.424423, 0.4392157, 1, 0, 1,
-0.6276633, 0.3242581, 0.8056101, 0.4352941, 1, 0, 1,
-0.6256399, -0.4804108, -2.817021, 0.427451, 1, 0, 1,
-0.6211326, -0.1881756, -1.3166, 0.4235294, 1, 0, 1,
-0.6179126, -1.550995, -2.147871, 0.4156863, 1, 0, 1,
-0.6157504, 0.1717334, -2.027, 0.4117647, 1, 0, 1,
-0.608612, 0.6856953, -0.8794138, 0.4039216, 1, 0, 1,
-0.5989333, -0.1497183, -3.031208, 0.3960784, 1, 0, 1,
-0.5985733, -0.562008, -2.27458, 0.3921569, 1, 0, 1,
-0.5968801, 0.7755398, -1.100677, 0.3843137, 1, 0, 1,
-0.5955149, -0.07476874, -2.334669, 0.3803922, 1, 0, 1,
-0.5916426, 2.032326, 0.239785, 0.372549, 1, 0, 1,
-0.5912879, -0.3487454, -1.585598, 0.3686275, 1, 0, 1,
-0.5826284, -1.06037, -2.276317, 0.3607843, 1, 0, 1,
-0.5777493, -1.489417, -3.608331, 0.3568628, 1, 0, 1,
-0.5774792, 0.6406107, -0.9892178, 0.3490196, 1, 0, 1,
-0.5770839, -0.1160298, -2.416113, 0.345098, 1, 0, 1,
-0.5711542, 1.165856, -0.001583333, 0.3372549, 1, 0, 1,
-0.5636216, -2.166205, -4.495929, 0.3333333, 1, 0, 1,
-0.5634734, 1.400492, 0.3444572, 0.3254902, 1, 0, 1,
-0.5569111, 0.5052112, -0.7654861, 0.3215686, 1, 0, 1,
-0.5497378, -0.8099013, -3.806113, 0.3137255, 1, 0, 1,
-0.5493771, 0.3717372, -0.761274, 0.3098039, 1, 0, 1,
-0.5465494, -0.03477231, -1.466052, 0.3019608, 1, 0, 1,
-0.5452684, 1.275876, 1.205963, 0.2941177, 1, 0, 1,
-0.5429202, 0.1493627, -1.067361, 0.2901961, 1, 0, 1,
-0.5422097, 0.5365174, 0.8524424, 0.282353, 1, 0, 1,
-0.5420241, -0.6921705, -2.262397, 0.2784314, 1, 0, 1,
-0.5399386, 1.068714, 0.7209023, 0.2705882, 1, 0, 1,
-0.5396146, 0.1528727, -2.607202, 0.2666667, 1, 0, 1,
-0.535024, -1.053955, -1.045449, 0.2588235, 1, 0, 1,
-0.5349721, 1.058339, -0.6943185, 0.254902, 1, 0, 1,
-0.5348222, -0.9626911, -2.460108, 0.2470588, 1, 0, 1,
-0.5331528, -1.040514, -3.496373, 0.2431373, 1, 0, 1,
-0.5328229, 1.366768, -0.2755412, 0.2352941, 1, 0, 1,
-0.5271412, -1.65281, -1.341041, 0.2313726, 1, 0, 1,
-0.5243776, -1.599318, -2.297326, 0.2235294, 1, 0, 1,
-0.5226901, -0.8718994, -0.7219095, 0.2196078, 1, 0, 1,
-0.5194817, 0.9350536, -1.815384, 0.2117647, 1, 0, 1,
-0.5190468, 0.7197204, -0.42322, 0.2078431, 1, 0, 1,
-0.5162696, 0.3455959, 0.1826223, 0.2, 1, 0, 1,
-0.5058496, -0.2860387, -1.902226, 0.1921569, 1, 0, 1,
-0.4984554, 0.6424332, 0.4977711, 0.1882353, 1, 0, 1,
-0.4975672, 1.415304, -1.407603, 0.1803922, 1, 0, 1,
-0.4956892, -1.293883, -1.661046, 0.1764706, 1, 0, 1,
-0.4916258, -1.388191, -4.001645, 0.1686275, 1, 0, 1,
-0.4848547, -0.1446864, -1.466894, 0.1647059, 1, 0, 1,
-0.4826179, 0.4782615, -0.9139997, 0.1568628, 1, 0, 1,
-0.4819826, -1.530968, -2.678918, 0.1529412, 1, 0, 1,
-0.4811135, -1.616441, -2.905362, 0.145098, 1, 0, 1,
-0.477383, -0.8316295, -2.722055, 0.1411765, 1, 0, 1,
-0.4766967, 0.4676794, -1.315575, 0.1333333, 1, 0, 1,
-0.46916, -2.038403, -1.003226, 0.1294118, 1, 0, 1,
-0.4659998, 1.176416, 0.6302102, 0.1215686, 1, 0, 1,
-0.4623518, 0.8739193, -1.847072, 0.1176471, 1, 0, 1,
-0.4579506, 0.2609769, -0.7181043, 0.1098039, 1, 0, 1,
-0.4552793, 1.454752, 0.5924616, 0.1058824, 1, 0, 1,
-0.4541593, 1.083824, -0.9372948, 0.09803922, 1, 0, 1,
-0.4515406, -1.330078, -4.232134, 0.09019608, 1, 0, 1,
-0.4508863, -1.178163, -1.369271, 0.08627451, 1, 0, 1,
-0.4478289, 0.4288749, 0.4644385, 0.07843138, 1, 0, 1,
-0.4476465, -0.5373951, -1.444049, 0.07450981, 1, 0, 1,
-0.4452103, -0.006538067, -1.05393, 0.06666667, 1, 0, 1,
-0.4435306, -0.5426612, -1.749099, 0.0627451, 1, 0, 1,
-0.4415183, 1.09922, -0.4083217, 0.05490196, 1, 0, 1,
-0.4365417, -0.2273333, -2.269987, 0.05098039, 1, 0, 1,
-0.4331049, 0.5913017, -1.139249, 0.04313726, 1, 0, 1,
-0.4288397, 0.1386831, -1.379844, 0.03921569, 1, 0, 1,
-0.4210598, 2.179017, 0.1372267, 0.03137255, 1, 0, 1,
-0.4114886, 0.8504016, -1.569326, 0.02745098, 1, 0, 1,
-0.4100866, 0.06873379, -1.634447, 0.01960784, 1, 0, 1,
-0.4093466, 0.4358583, -1.6418, 0.01568628, 1, 0, 1,
-0.4066379, -0.4861108, -0.6437639, 0.007843138, 1, 0, 1,
-0.4019685, 0.4360749, -0.9918597, 0.003921569, 1, 0, 1,
-0.4011005, -0.536809, -3.208105, 0, 1, 0.003921569, 1,
-0.4001458, 1.533655, -1.360783, 0, 1, 0.01176471, 1,
-0.399301, -0.5607738, -1.119732, 0, 1, 0.01568628, 1,
-0.3980832, -0.5995131, -4.000099, 0, 1, 0.02352941, 1,
-0.3897666, 0.8068115, -1.351957, 0, 1, 0.02745098, 1,
-0.382749, -1.301581, -1.623934, 0, 1, 0.03529412, 1,
-0.3811242, 0.463756, -0.0746785, 0, 1, 0.03921569, 1,
-0.3809186, -0.1476245, -0.321505, 0, 1, 0.04705882, 1,
-0.3761621, -0.453692, -3.17742, 0, 1, 0.05098039, 1,
-0.37584, -1.798264, -2.392757, 0, 1, 0.05882353, 1,
-0.3736521, -0.06669606, -1.565982, 0, 1, 0.0627451, 1,
-0.3650345, 0.1878884, -1.203833, 0, 1, 0.07058824, 1,
-0.3630071, 1.011439, -0.8084165, 0, 1, 0.07450981, 1,
-0.3610842, 0.6680328, 1.789224, 0, 1, 0.08235294, 1,
-0.3602354, 0.3355375, -1.816036, 0, 1, 0.08627451, 1,
-0.3594987, 0.2805169, -0.9607835, 0, 1, 0.09411765, 1,
-0.3534344, -0.215475, -2.493081, 0, 1, 0.1019608, 1,
-0.345617, -0.2902696, -2.086618, 0, 1, 0.1058824, 1,
-0.3448953, -1.638113, -2.921853, 0, 1, 0.1137255, 1,
-0.3428453, -1.739173, -3.690059, 0, 1, 0.1176471, 1,
-0.3387459, -1.198377, -2.212344, 0, 1, 0.1254902, 1,
-0.3317521, 0.8616824, 0.7311366, 0, 1, 0.1294118, 1,
-0.3270725, 0.06526272, -1.782941, 0, 1, 0.1372549, 1,
-0.3261198, -0.8894446, -2.532199, 0, 1, 0.1411765, 1,
-0.3255778, 0.3198867, -3.08202, 0, 1, 0.1490196, 1,
-0.3239313, 0.3963847, -0.9042023, 0, 1, 0.1529412, 1,
-0.3205566, -0.07730419, -3.402725, 0, 1, 0.1607843, 1,
-0.3175345, 0.8276863, 2.79795, 0, 1, 0.1647059, 1,
-0.3164733, -0.7876051, -2.568327, 0, 1, 0.172549, 1,
-0.3135915, 1.879233, 1.440897, 0, 1, 0.1764706, 1,
-0.3127211, 1.745871, -1.452335, 0, 1, 0.1843137, 1,
-0.3119168, 1.22681, -0.3689321, 0, 1, 0.1882353, 1,
-0.3116009, 0.6084295, -0.9313698, 0, 1, 0.1960784, 1,
-0.3106887, 0.1428508, -0.7118872, 0, 1, 0.2039216, 1,
-0.3075997, -0.7526302, -1.461581, 0, 1, 0.2078431, 1,
-0.3059116, -0.5284796, -1.755015, 0, 1, 0.2156863, 1,
-0.3048863, -0.271773, -2.522316, 0, 1, 0.2196078, 1,
-0.3041048, -0.1815422, -1.938019, 0, 1, 0.227451, 1,
-0.3040913, -0.108269, -1.959568, 0, 1, 0.2313726, 1,
-0.3007803, 0.6789492, -2.553882, 0, 1, 0.2392157, 1,
-0.3000734, 1.484154, 0.1053375, 0, 1, 0.2431373, 1,
-0.2999129, 1.680134, 0.4027747, 0, 1, 0.2509804, 1,
-0.2966556, -0.08546752, -0.338123, 0, 1, 0.254902, 1,
-0.2890749, 0.7853482, 0.4464885, 0, 1, 0.2627451, 1,
-0.2869059, -0.7136314, -3.846327, 0, 1, 0.2666667, 1,
-0.2860511, 0.8452505, -2.050014, 0, 1, 0.2745098, 1,
-0.2844801, 1.272348, 0.1619606, 0, 1, 0.2784314, 1,
-0.2835581, -0.7776488, -3.521895, 0, 1, 0.2862745, 1,
-0.2796651, 0.8006867, -0.9333658, 0, 1, 0.2901961, 1,
-0.2681605, 1.06985, -1.787135, 0, 1, 0.2980392, 1,
-0.265428, 2.036732, 1.018855, 0, 1, 0.3058824, 1,
-0.2633988, -0.3707514, -1.696398, 0, 1, 0.3098039, 1,
-0.2628928, 1.220453, 0.406493, 0, 1, 0.3176471, 1,
-0.2608205, 0.4290542, 0.09302554, 0, 1, 0.3215686, 1,
-0.2600603, 0.3043495, -1.243573, 0, 1, 0.3294118, 1,
-0.2530756, -0.1057398, -1.344181, 0, 1, 0.3333333, 1,
-0.2491333, 0.2760129, 1.707319, 0, 1, 0.3411765, 1,
-0.2483994, 0.1713981, -1.7669, 0, 1, 0.345098, 1,
-0.245827, -1.189651, -1.479284, 0, 1, 0.3529412, 1,
-0.243455, 0.4672295, 0.5762874, 0, 1, 0.3568628, 1,
-0.240091, 0.6504107, -0.2035729, 0, 1, 0.3647059, 1,
-0.2367899, 0.2542373, -0.811247, 0, 1, 0.3686275, 1,
-0.2366142, -1.495341, -1.254306, 0, 1, 0.3764706, 1,
-0.236114, -0.8131347, -3.411116, 0, 1, 0.3803922, 1,
-0.2345149, 1.523324, -0.09126628, 0, 1, 0.3882353, 1,
-0.2340729, 0.5738158, -0.8845378, 0, 1, 0.3921569, 1,
-0.2336858, 1.516279, -1.220562, 0, 1, 0.4, 1,
-0.2320659, 0.2181298, -1.236748, 0, 1, 0.4078431, 1,
-0.2307013, 2.047507, -1.767909, 0, 1, 0.4117647, 1,
-0.2297311, -2.621835, -4.087523, 0, 1, 0.4196078, 1,
-0.2243149, -0.4380125, -3.226783, 0, 1, 0.4235294, 1,
-0.2238152, -1.454918, -5.060103, 0, 1, 0.4313726, 1,
-0.2129671, 0.06082657, -1.019388, 0, 1, 0.4352941, 1,
-0.2105365, -0.5430146, -3.909212, 0, 1, 0.4431373, 1,
-0.2093211, -1.043149, -2.746197, 0, 1, 0.4470588, 1,
-0.2049039, -1.679036, -3.300738, 0, 1, 0.454902, 1,
-0.2024961, 0.4634644, 2.120887, 0, 1, 0.4588235, 1,
-0.2022799, 0.5651206, -0.3692756, 0, 1, 0.4666667, 1,
-0.1996593, 0.7704111, 0.4271444, 0, 1, 0.4705882, 1,
-0.1866212, 0.4667918, -2.135444, 0, 1, 0.4784314, 1,
-0.185916, 0.5479069, -1.74392, 0, 1, 0.4823529, 1,
-0.1846208, 0.7924846, 0.6044216, 0, 1, 0.4901961, 1,
-0.1831053, 0.3242994, 0.06298824, 0, 1, 0.4941176, 1,
-0.1814568, -1.389387, -3.873266, 0, 1, 0.5019608, 1,
-0.17883, 0.1759554, -0.2743066, 0, 1, 0.509804, 1,
-0.1754991, 1.200971, -0.8873699, 0, 1, 0.5137255, 1,
-0.1695722, 2.070501, 0.8986031, 0, 1, 0.5215687, 1,
-0.1688998, 0.1253141, -2.076058, 0, 1, 0.5254902, 1,
-0.1665108, -1.115612, -1.517752, 0, 1, 0.5333334, 1,
-0.1653856, 1.63801, 0.9078583, 0, 1, 0.5372549, 1,
-0.1645419, -1.207107, -3.493339, 0, 1, 0.5450981, 1,
-0.1641404, 0.2515054, -1.177279, 0, 1, 0.5490196, 1,
-0.1619494, 0.1659264, 0.4482302, 0, 1, 0.5568628, 1,
-0.1614446, 0.313289, 2.744292, 0, 1, 0.5607843, 1,
-0.1610495, 0.1602207, -2.257553, 0, 1, 0.5686275, 1,
-0.161039, -0.8964018, -1.891132, 0, 1, 0.572549, 1,
-0.1593689, 0.7239913, 0.8865281, 0, 1, 0.5803922, 1,
-0.1540424, 0.4679078, 2.013927, 0, 1, 0.5843138, 1,
-0.1529163, 0.8338633, 0.3390358, 0, 1, 0.5921569, 1,
-0.1503167, -1.327529, -4.517418, 0, 1, 0.5960785, 1,
-0.1470784, 1.104119, 0.8132764, 0, 1, 0.6039216, 1,
-0.1461523, -0.3657636, -2.72685, 0, 1, 0.6117647, 1,
-0.1440505, -0.4977432, -2.636105, 0, 1, 0.6156863, 1,
-0.1432488, 0.3817662, 0.3630586, 0, 1, 0.6235294, 1,
-0.1415666, 0.4225796, 0.6610129, 0, 1, 0.627451, 1,
-0.1409009, -0.6521893, -3.615341, 0, 1, 0.6352941, 1,
-0.1408531, 2.109601, 0.09078199, 0, 1, 0.6392157, 1,
-0.1337546, -0.7208803, -1.468202, 0, 1, 0.6470588, 1,
-0.1266847, -0.4861949, -1.032964, 0, 1, 0.6509804, 1,
-0.1257655, -0.9827545, -4.386389, 0, 1, 0.6588235, 1,
-0.1185428, 0.3392572, 0.5607455, 0, 1, 0.6627451, 1,
-0.1169474, -0.6374148, -3.211502, 0, 1, 0.6705883, 1,
-0.1100208, -0.1851093, -1.481068, 0, 1, 0.6745098, 1,
-0.1098069, 0.8390952, -0.6942467, 0, 1, 0.682353, 1,
-0.1082606, 0.007078848, -1.43617, 0, 1, 0.6862745, 1,
-0.10786, 1.078291, 0.165397, 0, 1, 0.6941177, 1,
-0.1077819, -0.6819111, -1.841692, 0, 1, 0.7019608, 1,
-0.1005846, 0.3900419, -0.1164281, 0, 1, 0.7058824, 1,
-0.09715188, -0.1490575, -1.720929, 0, 1, 0.7137255, 1,
-0.09427394, -1.193974, -1.850762, 0, 1, 0.7176471, 1,
-0.09375542, -1.752662, -5.345662, 0, 1, 0.7254902, 1,
-0.08995664, -3.047034, -3.903246, 0, 1, 0.7294118, 1,
-0.08940795, 0.03899603, -1.47183, 0, 1, 0.7372549, 1,
-0.08753242, -2.877214, -3.899145, 0, 1, 0.7411765, 1,
-0.08389755, 0.1973676, -2.291359, 0, 1, 0.7490196, 1,
-0.08012011, -1.217114, -2.726537, 0, 1, 0.7529412, 1,
-0.07739493, 1.328804, -1.167995, 0, 1, 0.7607843, 1,
-0.07637224, 0.6432524, 0.06771666, 0, 1, 0.7647059, 1,
-0.07519137, -1.8237, -1.358996, 0, 1, 0.772549, 1,
-0.07475226, -0.6725642, -1.93655, 0, 1, 0.7764706, 1,
-0.07324821, 0.8334695, 0.8996055, 0, 1, 0.7843137, 1,
-0.07247985, -0.7938184, -1.732039, 0, 1, 0.7882353, 1,
-0.07218795, -0.1052939, -3.033599, 0, 1, 0.7960784, 1,
-0.07154346, -0.453577, -1.961017, 0, 1, 0.8039216, 1,
-0.07126436, 0.7584239, -0.6390546, 0, 1, 0.8078431, 1,
-0.06757972, -0.4103971, -2.880429, 0, 1, 0.8156863, 1,
-0.06730386, 0.06880789, -2.543801, 0, 1, 0.8196079, 1,
-0.06696201, -0.2094588, -3.788212, 0, 1, 0.827451, 1,
-0.06225684, 0.7016091, -0.1316096, 0, 1, 0.8313726, 1,
-0.06002146, 0.4256333, 0.746279, 0, 1, 0.8392157, 1,
-0.05872104, 0.3027444, 1.125706, 0, 1, 0.8431373, 1,
-0.05699068, -0.9166251, -2.731104, 0, 1, 0.8509804, 1,
-0.05609635, 0.05749104, -1.675912, 0, 1, 0.854902, 1,
-0.0479636, 0.8038442, 0.0041153, 0, 1, 0.8627451, 1,
-0.0476555, 0.172499, 0.01899868, 0, 1, 0.8666667, 1,
-0.04403678, 2.061485, -1.675077, 0, 1, 0.8745098, 1,
-0.04356119, 0.3415063, 2.543236, 0, 1, 0.8784314, 1,
-0.04323791, 1.169957, 0.4174992, 0, 1, 0.8862745, 1,
-0.04202629, 0.5519378, 1.724072, 0, 1, 0.8901961, 1,
-0.04201748, -0.1824725, -2.401163, 0, 1, 0.8980392, 1,
-0.03647976, 0.621057, -0.7188592, 0, 1, 0.9058824, 1,
-0.03634887, 0.07960691, -1.604966, 0, 1, 0.9098039, 1,
-0.03231067, -0.713694, -3.908695, 0, 1, 0.9176471, 1,
-0.03048458, -1.738397, -2.400039, 0, 1, 0.9215686, 1,
-0.02543829, 2.242279, -0.4200482, 0, 1, 0.9294118, 1,
-0.02537233, -0.6044376, -4.833854, 0, 1, 0.9333333, 1,
-0.02018237, 0.06405701, -0.460183, 0, 1, 0.9411765, 1,
-0.01986133, 0.0930981, -0.1621215, 0, 1, 0.945098, 1,
-0.0182703, -3.220423, -4.447626, 0, 1, 0.9529412, 1,
-0.01647519, 1.615795, -0.3985562, 0, 1, 0.9568627, 1,
-0.0143867, -0.6021434, -3.652468, 0, 1, 0.9647059, 1,
-0.006619193, -1.29989, -4.010095, 0, 1, 0.9686275, 1,
-0.005185858, -2.123992, -2.188817, 0, 1, 0.9764706, 1,
-0.00438813, 1.034755, 0.4020061, 0, 1, 0.9803922, 1,
-0.002141463, 0.2612015, 1.19764, 0, 1, 0.9882353, 1,
0.002475634, 0.3336489, -1.83139, 0, 1, 0.9921569, 1,
0.005759703, -0.8876164, 1.518142, 0, 1, 1, 1,
0.005887834, -0.7503067, 2.829286, 0, 0.9921569, 1, 1,
0.009176377, -0.6493816, 3.731379, 0, 0.9882353, 1, 1,
0.01375182, -1.063279, 1.237224, 0, 0.9803922, 1, 1,
0.02580091, -3.125974, 2.035663, 0, 0.9764706, 1, 1,
0.02934902, -0.4578612, 3.187833, 0, 0.9686275, 1, 1,
0.02964202, -0.8026754, 2.106398, 0, 0.9647059, 1, 1,
0.0306717, -0.4442585, 3.819553, 0, 0.9568627, 1, 1,
0.03421231, -1.588209, 3.689103, 0, 0.9529412, 1, 1,
0.03443999, -1.666077, 3.169645, 0, 0.945098, 1, 1,
0.04026797, -1.110237, 2.081665, 0, 0.9411765, 1, 1,
0.04346237, 0.5397507, 1.203123, 0, 0.9333333, 1, 1,
0.04520295, -0.2871367, 4.927619, 0, 0.9294118, 1, 1,
0.04716822, -0.02708223, 0.3527904, 0, 0.9215686, 1, 1,
0.04761812, 0.08174773, 0.1919229, 0, 0.9176471, 1, 1,
0.04940977, 0.5209366, -0.01434785, 0, 0.9098039, 1, 1,
0.0534226, -0.99543, 2.154881, 0, 0.9058824, 1, 1,
0.05473749, -2.110145, 2.418943, 0, 0.8980392, 1, 1,
0.06692687, 0.5656238, 1.442706, 0, 0.8901961, 1, 1,
0.07189488, -0.5744389, 2.617445, 0, 0.8862745, 1, 1,
0.07372601, -0.1903211, 3.550494, 0, 0.8784314, 1, 1,
0.07624516, 1.310533, 0.7963127, 0, 0.8745098, 1, 1,
0.0765489, 1.398743, -0.6924925, 0, 0.8666667, 1, 1,
0.07698587, -0.5969988, 1.337046, 0, 0.8627451, 1, 1,
0.0783119, -0.2451551, 2.999633, 0, 0.854902, 1, 1,
0.07838903, 0.1588948, -0.4731406, 0, 0.8509804, 1, 1,
0.07966548, -1.322291, 2.748449, 0, 0.8431373, 1, 1,
0.08045497, 0.1326104, 0.3194985, 0, 0.8392157, 1, 1,
0.08244465, 0.3392991, -1.196023, 0, 0.8313726, 1, 1,
0.08266124, -1.170375, 3.64725, 0, 0.827451, 1, 1,
0.08932194, 1.279202, -0.3758385, 0, 0.8196079, 1, 1,
0.09120151, -0.01145652, 1.048891, 0, 0.8156863, 1, 1,
0.09156232, 0.6179061, 1.800196, 0, 0.8078431, 1, 1,
0.09297667, -1.205265, 2.432094, 0, 0.8039216, 1, 1,
0.09614672, -0.8227803, 4.214444, 0, 0.7960784, 1, 1,
0.1005599, 0.003161978, 2.595281, 0, 0.7882353, 1, 1,
0.1065918, -0.2081455, 0.3536702, 0, 0.7843137, 1, 1,
0.1070423, -0.3460075, 2.570179, 0, 0.7764706, 1, 1,
0.107803, 0.1486246, 1.196237, 0, 0.772549, 1, 1,
0.1096509, -0.7109576, 2.136389, 0, 0.7647059, 1, 1,
0.1105266, 0.8470697, 0.3008769, 0, 0.7607843, 1, 1,
0.1116538, 1.055432, -0.09723013, 0, 0.7529412, 1, 1,
0.1146668, -0.7954414, 2.632006, 0, 0.7490196, 1, 1,
0.1215638, 0.2304629, 0.8843418, 0, 0.7411765, 1, 1,
0.1215747, 1.15422, 1.330551, 0, 0.7372549, 1, 1,
0.1216838, -0.1790311, 1.396154, 0, 0.7294118, 1, 1,
0.1249121, 0.3199062, -0.792361, 0, 0.7254902, 1, 1,
0.127743, -1.462537, 3.109362, 0, 0.7176471, 1, 1,
0.1320417, 2.162451, 0.952059, 0, 0.7137255, 1, 1,
0.1355014, -1.228158, 4.347877, 0, 0.7058824, 1, 1,
0.1432668, 0.4769425, 1.113202, 0, 0.6980392, 1, 1,
0.144657, 0.1119654, 1.692311, 0, 0.6941177, 1, 1,
0.1452434, 1.500226, 0.6887512, 0, 0.6862745, 1, 1,
0.1536943, -0.03425362, 1.176517, 0, 0.682353, 1, 1,
0.1568899, -1.114635, 3.280575, 0, 0.6745098, 1, 1,
0.1571677, -0.8069472, 4.297299, 0, 0.6705883, 1, 1,
0.1572964, 0.1702616, 0.9876807, 0, 0.6627451, 1, 1,
0.1597963, 0.2331169, 0.394751, 0, 0.6588235, 1, 1,
0.1626357, -0.5397368, 2.302177, 0, 0.6509804, 1, 1,
0.1628472, 0.9994123, -0.700433, 0, 0.6470588, 1, 1,
0.1654668, -0.5570534, 2.613864, 0, 0.6392157, 1, 1,
0.1656758, -1.723869, 5.04791, 0, 0.6352941, 1, 1,
0.1662927, 0.3356239, 0.6435682, 0, 0.627451, 1, 1,
0.1706908, 0.9380602, 1.631323, 0, 0.6235294, 1, 1,
0.1712338, 1.997896, 0.1115637, 0, 0.6156863, 1, 1,
0.173405, -0.08247699, 0.6798327, 0, 0.6117647, 1, 1,
0.1774474, 0.4013069, -0.4146837, 0, 0.6039216, 1, 1,
0.1810211, 1.437676, 0.7051457, 0, 0.5960785, 1, 1,
0.1877384, 0.53148, 1.18913, 0, 0.5921569, 1, 1,
0.1893423, 0.162607, 1.207652, 0, 0.5843138, 1, 1,
0.1909115, 0.2168158, 2.224514, 0, 0.5803922, 1, 1,
0.1916727, -0.3435195, 6.00486, 0, 0.572549, 1, 1,
0.1951115, 0.7541027, -0.5138276, 0, 0.5686275, 1, 1,
0.1957296, -0.4080258, 4.196656, 0, 0.5607843, 1, 1,
0.1993894, 0.01304918, 1.848377, 0, 0.5568628, 1, 1,
0.2003247, -0.1516768, 3.046784, 0, 0.5490196, 1, 1,
0.2008432, -0.2563213, 2.423938, 0, 0.5450981, 1, 1,
0.2027086, -2.052254, 2.499878, 0, 0.5372549, 1, 1,
0.2047644, -1.34364, 3.68311, 0, 0.5333334, 1, 1,
0.2051428, 0.2433869, 1.416157, 0, 0.5254902, 1, 1,
0.2153599, -0.1539576, 3.132147, 0, 0.5215687, 1, 1,
0.2154043, 0.5782509, -0.01898649, 0, 0.5137255, 1, 1,
0.2179035, 2.341288, 0.6331061, 0, 0.509804, 1, 1,
0.218299, -0.322634, 4.464368, 0, 0.5019608, 1, 1,
0.2259153, -0.05334909, 1.408592, 0, 0.4941176, 1, 1,
0.2290923, -1.230441, 3.186271, 0, 0.4901961, 1, 1,
0.2296076, 0.27906, -0.3058932, 0, 0.4823529, 1, 1,
0.229684, -0.8229666, 3.379003, 0, 0.4784314, 1, 1,
0.2415352, -1.060581, 3.183497, 0, 0.4705882, 1, 1,
0.2478012, -0.7227053, 4.183676, 0, 0.4666667, 1, 1,
0.2499644, 0.464586, 0.5025158, 0, 0.4588235, 1, 1,
0.2513922, 0.8856498, -0.3406115, 0, 0.454902, 1, 1,
0.2529292, -2.341392, 2.929019, 0, 0.4470588, 1, 1,
0.2563046, -2.45714, 4.0043, 0, 0.4431373, 1, 1,
0.2568477, -1.56154, 2.117937, 0, 0.4352941, 1, 1,
0.2597792, 1.335713, 0.4431627, 0, 0.4313726, 1, 1,
0.2627731, -0.01155021, 1.092405, 0, 0.4235294, 1, 1,
0.2659667, 0.3124444, 0.9117963, 0, 0.4196078, 1, 1,
0.2745017, 0.6115703, 0.1893552, 0, 0.4117647, 1, 1,
0.277489, -1.181877, 1.624999, 0, 0.4078431, 1, 1,
0.2777169, 0.7468159, -0.3603636, 0, 0.4, 1, 1,
0.2827824, -0.1771633, 1.013695, 0, 0.3921569, 1, 1,
0.2867955, 0.3848254, 1.32288, 0, 0.3882353, 1, 1,
0.289417, -0.006139143, 3.771822, 0, 0.3803922, 1, 1,
0.2938342, -0.2556794, 2.02165, 0, 0.3764706, 1, 1,
0.2959956, -0.0992155, 3.254372, 0, 0.3686275, 1, 1,
0.2960027, -0.5572709, 2.454072, 0, 0.3647059, 1, 1,
0.3112249, -0.2954808, 2.132826, 0, 0.3568628, 1, 1,
0.3146802, -0.5048566, 3.920368, 0, 0.3529412, 1, 1,
0.3245078, 1.650403, 0.4944901, 0, 0.345098, 1, 1,
0.3324937, -1.941039, 1.145905, 0, 0.3411765, 1, 1,
0.3354823, -0.9862874, 3.885825, 0, 0.3333333, 1, 1,
0.3394638, -0.4908492, 2.728106, 0, 0.3294118, 1, 1,
0.3411498, 1.004818, 0.4554084, 0, 0.3215686, 1, 1,
0.3427999, 0.7080076, 0.6555455, 0, 0.3176471, 1, 1,
0.3430029, -0.9807158, 3.460898, 0, 0.3098039, 1, 1,
0.3430578, -1.112019, 2.818497, 0, 0.3058824, 1, 1,
0.3433002, 1.896061, 2.312917, 0, 0.2980392, 1, 1,
0.347194, -0.7228208, 2.240206, 0, 0.2901961, 1, 1,
0.3508551, 1.85633, -1.699106, 0, 0.2862745, 1, 1,
0.3533151, -0.7330435, 3.051826, 0, 0.2784314, 1, 1,
0.3544163, 0.4842294, 0.8157645, 0, 0.2745098, 1, 1,
0.3547532, 0.7347385, 1.376404, 0, 0.2666667, 1, 1,
0.3560692, 0.1424019, 1.315968, 0, 0.2627451, 1, 1,
0.3599986, -0.1231748, 2.118075, 0, 0.254902, 1, 1,
0.3600782, -0.6422931, 4.387993, 0, 0.2509804, 1, 1,
0.3656991, 1.015321, 0.750204, 0, 0.2431373, 1, 1,
0.3662877, 1.948709, 1.733258, 0, 0.2392157, 1, 1,
0.3679277, 1.647378, -0.3638237, 0, 0.2313726, 1, 1,
0.3679955, 0.05120195, -0.1383398, 0, 0.227451, 1, 1,
0.3693686, -0.3180648, 3.614497, 0, 0.2196078, 1, 1,
0.3705677, 0.2785903, 2.977335, 0, 0.2156863, 1, 1,
0.3729308, 0.06492611, 1.56624, 0, 0.2078431, 1, 1,
0.3801784, 0.5772725, 0.4443749, 0, 0.2039216, 1, 1,
0.3804076, -0.797537, 2.920141, 0, 0.1960784, 1, 1,
0.3817085, 1.496094, -0.8531249, 0, 0.1882353, 1, 1,
0.3831932, -0.0893777, 0.6988951, 0, 0.1843137, 1, 1,
0.3849829, 1.24074, -0.734645, 0, 0.1764706, 1, 1,
0.3869718, 0.6818032, 0.9727463, 0, 0.172549, 1, 1,
0.3882352, -0.2109323, 1.588294, 0, 0.1647059, 1, 1,
0.3974675, -0.5160584, 2.384952, 0, 0.1607843, 1, 1,
0.4036306, 0.9617977, 0.4248792, 0, 0.1529412, 1, 1,
0.4067656, 0.4863546, -0.3374514, 0, 0.1490196, 1, 1,
0.4105367, 0.08691791, 1.204175, 0, 0.1411765, 1, 1,
0.4142831, 0.08763522, 2.289148, 0, 0.1372549, 1, 1,
0.4178049, -0.6277797, 4.009407, 0, 0.1294118, 1, 1,
0.4190191, 0.9266613, 0.7000862, 0, 0.1254902, 1, 1,
0.4216677, -0.1486374, 1.632964, 0, 0.1176471, 1, 1,
0.4257152, 0.8324803, 2.500517, 0, 0.1137255, 1, 1,
0.431735, -0.16803, -0.1228316, 0, 0.1058824, 1, 1,
0.43489, 0.5193167, -0.5682307, 0, 0.09803922, 1, 1,
0.436939, 1.555585, -1.298462, 0, 0.09411765, 1, 1,
0.437483, -0.2080644, 3.824839, 0, 0.08627451, 1, 1,
0.437721, -0.1962986, 2.628117, 0, 0.08235294, 1, 1,
0.4458, 1.089189, 2.610364, 0, 0.07450981, 1, 1,
0.4473353, -0.9291421, 2.264274, 0, 0.07058824, 1, 1,
0.4520543, 1.243652, 1.544495, 0, 0.0627451, 1, 1,
0.457147, 0.5236896, 0.2265437, 0, 0.05882353, 1, 1,
0.4618807, 1.376775, 0.8492344, 0, 0.05098039, 1, 1,
0.4666689, -1.003181, 2.459925, 0, 0.04705882, 1, 1,
0.4727933, -0.279405, 4.949098, 0, 0.03921569, 1, 1,
0.4739419, -0.5344869, 2.883576, 0, 0.03529412, 1, 1,
0.4757552, -0.2040312, 1.578945, 0, 0.02745098, 1, 1,
0.4767653, 1.38205, 0.06486313, 0, 0.02352941, 1, 1,
0.4781283, 0.1117921, 2.321792, 0, 0.01568628, 1, 1,
0.4786874, -0.3798615, 2.361199, 0, 0.01176471, 1, 1,
0.47996, 0.3844461, 2.189467, 0, 0.003921569, 1, 1,
0.4804408, -0.9462689, 1.601626, 0.003921569, 0, 1, 1,
0.4808985, 0.7242547, 0.243091, 0.007843138, 0, 1, 1,
0.4829502, -1.428814, 2.400424, 0.01568628, 0, 1, 1,
0.4939639, 0.9701637, 0.9831923, 0.01960784, 0, 1, 1,
0.5050789, -0.4530074, 1.616145, 0.02745098, 0, 1, 1,
0.5065548, 1.081989, 0.6449032, 0.03137255, 0, 1, 1,
0.5069391, -0.7332456, -0.07007049, 0.03921569, 0, 1, 1,
0.508446, -0.7367462, 3.308113, 0.04313726, 0, 1, 1,
0.5086677, 0.2145342, 1.354936, 0.05098039, 0, 1, 1,
0.514369, 0.8351761, -0.7496234, 0.05490196, 0, 1, 1,
0.5163236, 0.3471474, 1.10234, 0.0627451, 0, 1, 1,
0.5304384, -1.250011, 1.816134, 0.06666667, 0, 1, 1,
0.5310922, -0.8527132, 0.8222389, 0.07450981, 0, 1, 1,
0.5372347, -1.079664, 3.833, 0.07843138, 0, 1, 1,
0.5377993, 1.363642, 1.856829, 0.08627451, 0, 1, 1,
0.5390447, -1.009015, 0.8324268, 0.09019608, 0, 1, 1,
0.5417634, 1.214978, -0.9869563, 0.09803922, 0, 1, 1,
0.5424465, -1.405632, 2.390561, 0.1058824, 0, 1, 1,
0.5430689, 0.1077096, 2.519854, 0.1098039, 0, 1, 1,
0.5434378, 0.04484026, 1.371597, 0.1176471, 0, 1, 1,
0.5471194, -1.713493, 3.93664, 0.1215686, 0, 1, 1,
0.5484146, 0.1269662, 2.459762, 0.1294118, 0, 1, 1,
0.5621503, -0.9627945, 0.9677868, 0.1333333, 0, 1, 1,
0.563603, -0.07312993, 0.9801458, 0.1411765, 0, 1, 1,
0.567279, 0.2493817, 2.515017, 0.145098, 0, 1, 1,
0.5708264, 0.2500158, 0.1125728, 0.1529412, 0, 1, 1,
0.5744999, -0.7183925, 2.044945, 0.1568628, 0, 1, 1,
0.575186, 0.7990938, 0.8749921, 0.1647059, 0, 1, 1,
0.5772327, -0.1481018, 2.626868, 0.1686275, 0, 1, 1,
0.5804479, -1.965673, 2.655595, 0.1764706, 0, 1, 1,
0.5852699, -0.550389, 2.520909, 0.1803922, 0, 1, 1,
0.5883368, -0.5812208, 3.245356, 0.1882353, 0, 1, 1,
0.5894493, 0.1422435, 2.243912, 0.1921569, 0, 1, 1,
0.5899966, -0.1007524, 1.146035, 0.2, 0, 1, 1,
0.5916544, -1.318003, 2.198107, 0.2078431, 0, 1, 1,
0.5924809, 0.4457771, 1.293014, 0.2117647, 0, 1, 1,
0.5927615, -0.3146958, 3.697603, 0.2196078, 0, 1, 1,
0.5929025, 0.6125993, 1.026639, 0.2235294, 0, 1, 1,
0.5937136, -0.3321308, 1.423853, 0.2313726, 0, 1, 1,
0.5990618, -1.351206, 3.365551, 0.2352941, 0, 1, 1,
0.5994691, 0.8073703, -0.1817524, 0.2431373, 0, 1, 1,
0.605718, 0.7643067, 2.008699, 0.2470588, 0, 1, 1,
0.6076589, -0.2340566, 0.953418, 0.254902, 0, 1, 1,
0.6114174, 0.8251617, 3.626372, 0.2588235, 0, 1, 1,
0.6204024, 0.4445999, -0.1504784, 0.2666667, 0, 1, 1,
0.6267635, 0.252764, 3.582629, 0.2705882, 0, 1, 1,
0.6314698, -0.9653277, 2.761309, 0.2784314, 0, 1, 1,
0.634392, -0.7126918, 3.530039, 0.282353, 0, 1, 1,
0.6351436, 0.003528223, 1.837473, 0.2901961, 0, 1, 1,
0.6357759, 1.097233, 0.5453198, 0.2941177, 0, 1, 1,
0.636698, -0.3170067, 2.673738, 0.3019608, 0, 1, 1,
0.6457652, -0.9605012, 2.565538, 0.3098039, 0, 1, 1,
0.6482963, -0.900268, 3.236223, 0.3137255, 0, 1, 1,
0.6501614, -0.06513145, 2.026147, 0.3215686, 0, 1, 1,
0.654492, -1.317053, 2.428946, 0.3254902, 0, 1, 1,
0.6559244, -0.5955337, 3.547668, 0.3333333, 0, 1, 1,
0.6595649, -1.829448, 3.020975, 0.3372549, 0, 1, 1,
0.6626322, -1.117507, 1.948796, 0.345098, 0, 1, 1,
0.6641414, 0.3231184, 1.434384, 0.3490196, 0, 1, 1,
0.6641471, -0.03747133, 1.653066, 0.3568628, 0, 1, 1,
0.6727871, 0.3722611, 1.654097, 0.3607843, 0, 1, 1,
0.6738018, -1.095953, 2.457597, 0.3686275, 0, 1, 1,
0.6767957, 1.049381, 2.119194, 0.372549, 0, 1, 1,
0.6805336, -0.3514518, 3.170525, 0.3803922, 0, 1, 1,
0.6809529, -0.4356286, 1.266977, 0.3843137, 0, 1, 1,
0.6829863, -0.272467, 2.948615, 0.3921569, 0, 1, 1,
0.6853164, 0.06355204, 0.8152455, 0.3960784, 0, 1, 1,
0.6921079, 0.01651133, 0.1899695, 0.4039216, 0, 1, 1,
0.6940482, 0.973471, 1.864522, 0.4117647, 0, 1, 1,
0.6940694, -0.2024845, 3.497627, 0.4156863, 0, 1, 1,
0.696502, 2.180206, 1.243403, 0.4235294, 0, 1, 1,
0.6986753, 1.568208, 0.2873336, 0.427451, 0, 1, 1,
0.6988477, 0.8009359, 0.7269547, 0.4352941, 0, 1, 1,
0.7001038, -0.7659866, 1.605795, 0.4392157, 0, 1, 1,
0.7064775, -2.551155, 3.43907, 0.4470588, 0, 1, 1,
0.70838, -0.4108572, 1.957471, 0.4509804, 0, 1, 1,
0.7174576, -0.269283, 1.368116, 0.4588235, 0, 1, 1,
0.7175959, 0.469346, 1.407758, 0.4627451, 0, 1, 1,
0.7209961, 0.06122265, 2.18872, 0.4705882, 0, 1, 1,
0.7231265, -0.3267987, 1.115496, 0.4745098, 0, 1, 1,
0.7254357, -1.156025, 3.145544, 0.4823529, 0, 1, 1,
0.7255863, 1.404597, 0.7199547, 0.4862745, 0, 1, 1,
0.725992, 0.5382342, 1.688265, 0.4941176, 0, 1, 1,
0.7312244, -0.212554, 1.850106, 0.5019608, 0, 1, 1,
0.7405977, 0.4858597, 2.357902, 0.5058824, 0, 1, 1,
0.7420315, 1.823644, -0.3323454, 0.5137255, 0, 1, 1,
0.7446611, -1.915662, 3.529295, 0.5176471, 0, 1, 1,
0.7514588, 1.027045, 0.8231312, 0.5254902, 0, 1, 1,
0.7533091, 0.9669175, -1.516425, 0.5294118, 0, 1, 1,
0.7533385, -0.4891654, 0.325633, 0.5372549, 0, 1, 1,
0.7556058, 2.276287, 1.76245, 0.5411765, 0, 1, 1,
0.7576639, 0.2168572, 0.4364713, 0.5490196, 0, 1, 1,
0.7712803, -1.168523, 2.853151, 0.5529412, 0, 1, 1,
0.7715267, -1.8624, 1.912189, 0.5607843, 0, 1, 1,
0.7782353, -0.798675, 1.341073, 0.5647059, 0, 1, 1,
0.7795275, 2.211594, 0.5462629, 0.572549, 0, 1, 1,
0.7883789, 0.3768983, -0.468207, 0.5764706, 0, 1, 1,
0.791352, 1.073242, 1.643987, 0.5843138, 0, 1, 1,
0.7941437, 0.8278829, 0.08047145, 0.5882353, 0, 1, 1,
0.7968827, -0.463529, 3.563625, 0.5960785, 0, 1, 1,
0.7981611, -0.7436624, 2.371239, 0.6039216, 0, 1, 1,
0.7988385, 0.4605131, 0.9471614, 0.6078432, 0, 1, 1,
0.8004527, 0.3745934, -0.01044725, 0.6156863, 0, 1, 1,
0.8033357, -0.1325151, 2.148055, 0.6196079, 0, 1, 1,
0.8040108, -0.7440189, 1.207695, 0.627451, 0, 1, 1,
0.8061827, 0.05491162, 1.68267, 0.6313726, 0, 1, 1,
0.8064814, 0.09138568, 0.3627145, 0.6392157, 0, 1, 1,
0.8079939, 0.4768386, -0.6139483, 0.6431373, 0, 1, 1,
0.8097357, 1.632295, 0.5997118, 0.6509804, 0, 1, 1,
0.8166071, 0.5062606, 2.440445, 0.654902, 0, 1, 1,
0.8173418, -1.219405, 2.08892, 0.6627451, 0, 1, 1,
0.8187332, -1.707187, 0.966303, 0.6666667, 0, 1, 1,
0.8258138, -0.5777409, 2.422427, 0.6745098, 0, 1, 1,
0.8309644, 1.09604, 0.7434434, 0.6784314, 0, 1, 1,
0.8398978, 0.05695917, 1.634307, 0.6862745, 0, 1, 1,
0.8419221, 0.9193227, 1.167665, 0.6901961, 0, 1, 1,
0.8434643, -0.6868163, 2.939797, 0.6980392, 0, 1, 1,
0.8458889, -1.057203, 1.47065, 0.7058824, 0, 1, 1,
0.8475869, -0.01824121, 0.6853189, 0.7098039, 0, 1, 1,
0.8494899, -3.151824, 2.580407, 0.7176471, 0, 1, 1,
0.8495054, -1.414971, 3.856017, 0.7215686, 0, 1, 1,
0.8505955, -0.1646096, 1.843929, 0.7294118, 0, 1, 1,
0.8517991, -1.233227, 4.15483, 0.7333333, 0, 1, 1,
0.85191, -0.2656256, 2.810655, 0.7411765, 0, 1, 1,
0.853827, -0.5163215, 1.84631, 0.7450981, 0, 1, 1,
0.859363, -0.07328681, 1.34463, 0.7529412, 0, 1, 1,
0.8601083, 0.4794472, 0.6226778, 0.7568628, 0, 1, 1,
0.8604092, -0.5071018, 2.51816, 0.7647059, 0, 1, 1,
0.8638501, -0.4303692, 3.779389, 0.7686275, 0, 1, 1,
0.8652401, 0.7585762, 1.76654, 0.7764706, 0, 1, 1,
0.8681819, -1.209913, 1.82382, 0.7803922, 0, 1, 1,
0.8692911, -0.9556, 1.871917, 0.7882353, 0, 1, 1,
0.870255, 0.3589214, 1.976218, 0.7921569, 0, 1, 1,
0.8712055, -1.032158, 2.860428, 0.8, 0, 1, 1,
0.8719842, 0.7615032, 1.440916, 0.8078431, 0, 1, 1,
0.872235, -0.5433645, -0.2296033, 0.8117647, 0, 1, 1,
0.8796805, -0.7151747, -1.434112, 0.8196079, 0, 1, 1,
0.8867452, -1.025744, 1.49699, 0.8235294, 0, 1, 1,
0.8926796, 1.688633, -0.105379, 0.8313726, 0, 1, 1,
0.8965593, 0.600051, 2.047678, 0.8352941, 0, 1, 1,
0.8980221, 1.20527, -0.367006, 0.8431373, 0, 1, 1,
0.9041566, 1.475323, -0.2268049, 0.8470588, 0, 1, 1,
0.9115857, -0.4462865, 2.04847, 0.854902, 0, 1, 1,
0.915896, 0.3484965, 1.392384, 0.8588235, 0, 1, 1,
0.9162596, -0.7869629, 2.435911, 0.8666667, 0, 1, 1,
0.9262925, -2.076181, 2.969977, 0.8705882, 0, 1, 1,
0.9275235, -0.6844381, 2.690613, 0.8784314, 0, 1, 1,
0.92923, -1.372833, 1.719424, 0.8823529, 0, 1, 1,
0.930984, 1.492416, 1.500847, 0.8901961, 0, 1, 1,
0.9318985, 0.2708585, 0.8328587, 0.8941177, 0, 1, 1,
0.9338027, -1.005103, 1.822536, 0.9019608, 0, 1, 1,
0.9356623, 2.549938, 0.1186392, 0.9098039, 0, 1, 1,
0.9361178, 0.3523635, 2.428861, 0.9137255, 0, 1, 1,
0.9385843, 0.05866713, 0.6005887, 0.9215686, 0, 1, 1,
0.9419996, -0.1401723, 2.452562, 0.9254902, 0, 1, 1,
0.9497619, -1.640559, 2.076485, 0.9333333, 0, 1, 1,
0.951235, -1.701902, 2.609443, 0.9372549, 0, 1, 1,
0.9585769, 0.7585058, 2.085013, 0.945098, 0, 1, 1,
0.9590273, -1.336794, 3.244294, 0.9490196, 0, 1, 1,
0.9608454, -0.6979269, 1.751313, 0.9568627, 0, 1, 1,
0.9632732, -0.3765577, 0.8435537, 0.9607843, 0, 1, 1,
0.9748483, 1.065058, 0.6224114, 0.9686275, 0, 1, 1,
0.974962, -0.1424069, 1.386024, 0.972549, 0, 1, 1,
0.9823814, 1.614352, 0.6193299, 0.9803922, 0, 1, 1,
0.989554, 0.1057111, 1.327883, 0.9843137, 0, 1, 1,
0.9943545, 0.4108559, 4.460436, 0.9921569, 0, 1, 1,
1.005388, 0.2919591, 0.9789783, 0.9960784, 0, 1, 1,
1.011267, 0.4150487, 1.636948, 1, 0, 0.9960784, 1,
1.013692, 0.7449773, -0.5559759, 1, 0, 0.9882353, 1,
1.016983, -0.4535405, 2.241687, 1, 0, 0.9843137, 1,
1.017417, -0.4041137, 0.8347364, 1, 0, 0.9764706, 1,
1.018539, 1.18066, 0.924296, 1, 0, 0.972549, 1,
1.021305, -0.7881685, 2.665447, 1, 0, 0.9647059, 1,
1.021595, 2.013968, 0.2667202, 1, 0, 0.9607843, 1,
1.022684, -0.8793901, 3.326104, 1, 0, 0.9529412, 1,
1.02493, 0.8889222, 0.7935385, 1, 0, 0.9490196, 1,
1.026431, -0.203952, 1.306814, 1, 0, 0.9411765, 1,
1.040135, 0.2080739, 2.441102, 1, 0, 0.9372549, 1,
1.053869, 0.006952028, 0.7752466, 1, 0, 0.9294118, 1,
1.059672, -0.3193213, 1.303929, 1, 0, 0.9254902, 1,
1.059832, 0.2417232, 1.991837, 1, 0, 0.9176471, 1,
1.063344, -1.810198, 3.879005, 1, 0, 0.9137255, 1,
1.064646, -0.171082, 2.134212, 1, 0, 0.9058824, 1,
1.06474, -0.6836005, 1.253176, 1, 0, 0.9019608, 1,
1.065254, 0.9838965, 0.1640799, 1, 0, 0.8941177, 1,
1.06819, -0.3970403, 1.861258, 1, 0, 0.8862745, 1,
1.068502, -0.2859472, 2.289365, 1, 0, 0.8823529, 1,
1.071753, 0.1160141, 1.420223, 1, 0, 0.8745098, 1,
1.074675, -0.7826943, 2.320048, 1, 0, 0.8705882, 1,
1.082243, 1.044103, 0.9870201, 1, 0, 0.8627451, 1,
1.090528, -2.877486, 3.425926, 1, 0, 0.8588235, 1,
1.090622, -0.6307777, 1.761925, 1, 0, 0.8509804, 1,
1.093024, -0.130046, 0.916641, 1, 0, 0.8470588, 1,
1.097086, -0.9633748, 3.311972, 1, 0, 0.8392157, 1,
1.101085, -0.2375601, 2.061068, 1, 0, 0.8352941, 1,
1.10233, -0.7967054, 2.263766, 1, 0, 0.827451, 1,
1.109291, 1.323079, -0.00665699, 1, 0, 0.8235294, 1,
1.112063, 0.09630752, 0.9810772, 1, 0, 0.8156863, 1,
1.112963, -0.8949319, 2.737121, 1, 0, 0.8117647, 1,
1.115635, -1.082448, 1.420308, 1, 0, 0.8039216, 1,
1.116235, -1.486998, 0.6945487, 1, 0, 0.7960784, 1,
1.11737, 1.285212, 0.7751251, 1, 0, 0.7921569, 1,
1.119814, 0.5567281, 0.671872, 1, 0, 0.7843137, 1,
1.119868, 1.336832, 1.767211, 1, 0, 0.7803922, 1,
1.120478, 0.6158981, -0.6448662, 1, 0, 0.772549, 1,
1.122249, -1.339531, 2.100513, 1, 0, 0.7686275, 1,
1.125914, -0.02250064, -0.5656946, 1, 0, 0.7607843, 1,
1.12645, 0.6008466, -0.3305448, 1, 0, 0.7568628, 1,
1.146896, 1.068739, 0.3407988, 1, 0, 0.7490196, 1,
1.150478, 0.002423631, 1.238767, 1, 0, 0.7450981, 1,
1.155535, -0.9758393, 3.112519, 1, 0, 0.7372549, 1,
1.156359, -0.4764633, 2.755029, 1, 0, 0.7333333, 1,
1.160705, -1.832576, 2.179688, 1, 0, 0.7254902, 1,
1.16188, 0.6074699, 0.3192669, 1, 0, 0.7215686, 1,
1.161894, 0.6433312, 0.8638009, 1, 0, 0.7137255, 1,
1.164305, 2.070975, -0.1532379, 1, 0, 0.7098039, 1,
1.173341, -0.2437299, 0.9951994, 1, 0, 0.7019608, 1,
1.180876, -0.4823116, 2.099403, 1, 0, 0.6941177, 1,
1.186478, -0.8499397, 1.600371, 1, 0, 0.6901961, 1,
1.191903, -0.02610368, 0.5284343, 1, 0, 0.682353, 1,
1.194561, 0.3366453, 1.205842, 1, 0, 0.6784314, 1,
1.214913, -0.4658305, 2.503262, 1, 0, 0.6705883, 1,
1.216005, -0.5033635, 3.634073, 1, 0, 0.6666667, 1,
1.216289, -1.668231, 2.539766, 1, 0, 0.6588235, 1,
1.219322, 0.7918772, 1.910175, 1, 0, 0.654902, 1,
1.219793, 0.3408329, 1.194033, 1, 0, 0.6470588, 1,
1.22024, 1.910761, 0.6172862, 1, 0, 0.6431373, 1,
1.222108, 2.203532, 1.025426, 1, 0, 0.6352941, 1,
1.228727, 1.636038, -0.09386314, 1, 0, 0.6313726, 1,
1.22883, 1.162312, 2.861377, 1, 0, 0.6235294, 1,
1.241438, 0.3567799, 0.03100413, 1, 0, 0.6196079, 1,
1.25113, -1.305306, 3.64635, 1, 0, 0.6117647, 1,
1.263043, -1.614672, 3.043319, 1, 0, 0.6078432, 1,
1.269721, 0.5447031, 0.4432977, 1, 0, 0.6, 1,
1.273299, -0.8885967, 2.872148, 1, 0, 0.5921569, 1,
1.275134, 0.240678, 0.7933407, 1, 0, 0.5882353, 1,
1.280131, -0.2412788, 1.855148, 1, 0, 0.5803922, 1,
1.281951, -2.628682, 2.765624, 1, 0, 0.5764706, 1,
1.283997, -0.2224903, 1.678628, 1, 0, 0.5686275, 1,
1.284576, -1.060351, 2.490749, 1, 0, 0.5647059, 1,
1.287526, 0.3047207, 1.383418, 1, 0, 0.5568628, 1,
1.289666, -0.4022973, 1.983708, 1, 0, 0.5529412, 1,
1.290647, 1.427338, 0.3005461, 1, 0, 0.5450981, 1,
1.313349, 0.2527125, 0.9494269, 1, 0, 0.5411765, 1,
1.318447, 0.4427911, 0.97521, 1, 0, 0.5333334, 1,
1.322488, -0.1738858, 1.759162, 1, 0, 0.5294118, 1,
1.338019, 0.2211789, 0.7557445, 1, 0, 0.5215687, 1,
1.353855, -0.06024789, 2.303358, 1, 0, 0.5176471, 1,
1.35402, 0.0516072, 0.6986839, 1, 0, 0.509804, 1,
1.359773, -1.09182, 2.562897, 1, 0, 0.5058824, 1,
1.361622, 1.387063, -1.230983, 1, 0, 0.4980392, 1,
1.368926, -0.166462, 1.989893, 1, 0, 0.4901961, 1,
1.370521, -0.7053888, 1.502711, 1, 0, 0.4862745, 1,
1.376818, -1.370803, 2.995267, 1, 0, 0.4784314, 1,
1.383771, -0.6713672, 1.46823, 1, 0, 0.4745098, 1,
1.420002, -1.47702, 2.927017, 1, 0, 0.4666667, 1,
1.426204, -1.053456, 1.083552, 1, 0, 0.4627451, 1,
1.44752, -0.6319662, 1.767048, 1, 0, 0.454902, 1,
1.447855, -0.07925495, 2.511225, 1, 0, 0.4509804, 1,
1.451336, 2.271984, 1.931973, 1, 0, 0.4431373, 1,
1.474849, 0.105496, 1.543024, 1, 0, 0.4392157, 1,
1.480123, 0.7165801, 0.7987672, 1, 0, 0.4313726, 1,
1.500776, -1.179203, 1.222609, 1, 0, 0.427451, 1,
1.502474, -1.26399, 2.865402, 1, 0, 0.4196078, 1,
1.504127, 0.4692539, 1.502473, 1, 0, 0.4156863, 1,
1.534506, -0.1187234, 0.2909143, 1, 0, 0.4078431, 1,
1.537883, -0.05187791, 1.656035, 1, 0, 0.4039216, 1,
1.538174, 0.3042607, 1.681516, 1, 0, 0.3960784, 1,
1.547637, 0.2424401, 2.772798, 1, 0, 0.3882353, 1,
1.551463, -0.05759768, 0.05501856, 1, 0, 0.3843137, 1,
1.554249, -0.9800395, 4.010818, 1, 0, 0.3764706, 1,
1.560425, -0.3129933, 1.699527, 1, 0, 0.372549, 1,
1.577274, 0.1384618, 2.573478, 1, 0, 0.3647059, 1,
1.592915, 0.04718504, 2.986516, 1, 0, 0.3607843, 1,
1.621114, 0.2178814, 2.726229, 1, 0, 0.3529412, 1,
1.63741, 0.8006161, 1.469594, 1, 0, 0.3490196, 1,
1.64187, -0.6217825, 3.404279, 1, 0, 0.3411765, 1,
1.684407, -0.1421509, 2.837063, 1, 0, 0.3372549, 1,
1.685443, -2.325649, 0.7015445, 1, 0, 0.3294118, 1,
1.686126, -2.147972, 2.488629, 1, 0, 0.3254902, 1,
1.752462, -0.1473094, 1.849258, 1, 0, 0.3176471, 1,
1.760771, 0.5518889, 1.628695, 1, 0, 0.3137255, 1,
1.765786, 1.172868, 0.3816683, 1, 0, 0.3058824, 1,
1.7733, 0.03708749, 2.609587, 1, 0, 0.2980392, 1,
1.789828, 0.8207607, 0.1305272, 1, 0, 0.2941177, 1,
1.796361, 1.625519, -0.7996585, 1, 0, 0.2862745, 1,
1.799675, -0.2389183, 2.851417, 1, 0, 0.282353, 1,
1.800941, 1.424991, 2.293759, 1, 0, 0.2745098, 1,
1.817384, 1.834525, 1.241416, 1, 0, 0.2705882, 1,
1.848514, 1.060777, 2.941187, 1, 0, 0.2627451, 1,
1.850255, -1.633857, 0.8811308, 1, 0, 0.2588235, 1,
1.855217, 1.107019, 0.3422903, 1, 0, 0.2509804, 1,
1.880675, -0.08405691, 1.005353, 1, 0, 0.2470588, 1,
1.880754, 1.226458, -0.08216718, 1, 0, 0.2392157, 1,
1.881526, 0.8576441, 2.310571, 1, 0, 0.2352941, 1,
1.896717, 0.4865364, 2.489319, 1, 0, 0.227451, 1,
1.9, -0.9498389, 1.370166, 1, 0, 0.2235294, 1,
1.923949, 1.215532, 1.444951, 1, 0, 0.2156863, 1,
1.936677, -0.2249959, 0.9405567, 1, 0, 0.2117647, 1,
1.942779, 1.004305, 2.174949, 1, 0, 0.2039216, 1,
1.944741, -0.6498175, 1.642891, 1, 0, 0.1960784, 1,
1.949166, 1.311192, 0.6069147, 1, 0, 0.1921569, 1,
1.954449, 0.2930412, 1.892181, 1, 0, 0.1843137, 1,
1.95463, -1.275939, 2.203012, 1, 0, 0.1803922, 1,
1.99458, -1.655713, 1.385677, 1, 0, 0.172549, 1,
1.996071, -1.821569, 2.774776, 1, 0, 0.1686275, 1,
2.002181, 0.2414027, 4.023416, 1, 0, 0.1607843, 1,
2.018736, 1.540887, 0.662128, 1, 0, 0.1568628, 1,
2.025483, -2.144359, 3.7162, 1, 0, 0.1490196, 1,
2.027273, -0.7139438, 1.06936, 1, 0, 0.145098, 1,
2.031836, -0.1357092, -0.08588737, 1, 0, 0.1372549, 1,
2.037343, 1.671584, 1.065672, 1, 0, 0.1333333, 1,
2.044151, -0.836594, 1.471955, 1, 0, 0.1254902, 1,
2.048872, -0.8851784, 2.884802, 1, 0, 0.1215686, 1,
2.107629, 0.3227485, 0.5260267, 1, 0, 0.1137255, 1,
2.117092, 0.2475067, 2.15966, 1, 0, 0.1098039, 1,
2.129104, 0.4222564, 1.515374, 1, 0, 0.1019608, 1,
2.149241, 0.3212178, -0.215605, 1, 0, 0.09411765, 1,
2.170954, 1.443463, 0.6058277, 1, 0, 0.09019608, 1,
2.188685, 0.1259263, 0.2711681, 1, 0, 0.08235294, 1,
2.190681, 0.9742618, 2.105801, 1, 0, 0.07843138, 1,
2.280006, -0.1159423, 2.477102, 1, 0, 0.07058824, 1,
2.291606, 0.9589717, 2.97455, 1, 0, 0.06666667, 1,
2.358721, 0.3439535, 2.515439, 1, 0, 0.05882353, 1,
2.365901, -1.19532, 3.787297, 1, 0, 0.05490196, 1,
2.449047, -0.4604335, -0.1796187, 1, 0, 0.04705882, 1,
2.505074, -0.4588546, 0.5207257, 1, 0, 0.04313726, 1,
2.508126, -0.4829566, 1.790854, 1, 0, 0.03529412, 1,
2.509999, -0.6677542, 2.030824, 1, 0, 0.03137255, 1,
2.5466, -0.2224497, 1.442398, 1, 0, 0.02352941, 1,
2.563859, -1.043334, 2.063629, 1, 0, 0.01960784, 1,
2.78594, 0.6336702, -0.09317867, 1, 0, 0.01176471, 1,
3.444711, 0.2149917, 2.382074, 1, 0, 0.007843138, 1
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
0.1744248, -4.222068, -7.269576, 0, -0.5, 0.5, 0.5,
0.1744248, -4.222068, -7.269576, 1, -0.5, 0.5, 0.5,
0.1744248, -4.222068, -7.269576, 1, 1.5, 0.5, 0.5,
0.1744248, -4.222068, -7.269576, 0, 1.5, 0.5, 0.5
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
-4.204489, -0.2657197, -7.269576, 0, -0.5, 0.5, 0.5,
-4.204489, -0.2657197, -7.269576, 1, -0.5, 0.5, 0.5,
-4.204489, -0.2657197, -7.269576, 1, 1.5, 0.5, 0.5,
-4.204489, -0.2657197, -7.269576, 0, 1.5, 0.5, 0.5
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
-4.204489, -4.222068, 0.3295991, 0, -0.5, 0.5, 0.5,
-4.204489, -4.222068, 0.3295991, 1, -0.5, 0.5, 0.5,
-4.204489, -4.222068, 0.3295991, 1, 1.5, 0.5, 0.5,
-4.204489, -4.222068, 0.3295991, 0, 1.5, 0.5, 0.5
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
-3, -3.309065, -5.51592,
3, -3.309065, -5.51592,
-3, -3.309065, -5.51592,
-3, -3.461232, -5.808196,
-2, -3.309065, -5.51592,
-2, -3.461232, -5.808196,
-1, -3.309065, -5.51592,
-1, -3.461232, -5.808196,
0, -3.309065, -5.51592,
0, -3.461232, -5.808196,
1, -3.309065, -5.51592,
1, -3.461232, -5.808196,
2, -3.309065, -5.51592,
2, -3.461232, -5.808196,
3, -3.309065, -5.51592,
3, -3.461232, -5.808196
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
-3, -3.765566, -6.392748, 0, -0.5, 0.5, 0.5,
-3, -3.765566, -6.392748, 1, -0.5, 0.5, 0.5,
-3, -3.765566, -6.392748, 1, 1.5, 0.5, 0.5,
-3, -3.765566, -6.392748, 0, 1.5, 0.5, 0.5,
-2, -3.765566, -6.392748, 0, -0.5, 0.5, 0.5,
-2, -3.765566, -6.392748, 1, -0.5, 0.5, 0.5,
-2, -3.765566, -6.392748, 1, 1.5, 0.5, 0.5,
-2, -3.765566, -6.392748, 0, 1.5, 0.5, 0.5,
-1, -3.765566, -6.392748, 0, -0.5, 0.5, 0.5,
-1, -3.765566, -6.392748, 1, -0.5, 0.5, 0.5,
-1, -3.765566, -6.392748, 1, 1.5, 0.5, 0.5,
-1, -3.765566, -6.392748, 0, 1.5, 0.5, 0.5,
0, -3.765566, -6.392748, 0, -0.5, 0.5, 0.5,
0, -3.765566, -6.392748, 1, -0.5, 0.5, 0.5,
0, -3.765566, -6.392748, 1, 1.5, 0.5, 0.5,
0, -3.765566, -6.392748, 0, 1.5, 0.5, 0.5,
1, -3.765566, -6.392748, 0, -0.5, 0.5, 0.5,
1, -3.765566, -6.392748, 1, -0.5, 0.5, 0.5,
1, -3.765566, -6.392748, 1, 1.5, 0.5, 0.5,
1, -3.765566, -6.392748, 0, 1.5, 0.5, 0.5,
2, -3.765566, -6.392748, 0, -0.5, 0.5, 0.5,
2, -3.765566, -6.392748, 1, -0.5, 0.5, 0.5,
2, -3.765566, -6.392748, 1, 1.5, 0.5, 0.5,
2, -3.765566, -6.392748, 0, 1.5, 0.5, 0.5,
3, -3.765566, -6.392748, 0, -0.5, 0.5, 0.5,
3, -3.765566, -6.392748, 1, -0.5, 0.5, 0.5,
3, -3.765566, -6.392748, 1, 1.5, 0.5, 0.5,
3, -3.765566, -6.392748, 0, 1.5, 0.5, 0.5
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
-3.19397, -3, -5.51592,
-3.19397, 2, -5.51592,
-3.19397, -3, -5.51592,
-3.36239, -3, -5.808196,
-3.19397, -2, -5.51592,
-3.36239, -2, -5.808196,
-3.19397, -1, -5.51592,
-3.36239, -1, -5.808196,
-3.19397, 0, -5.51592,
-3.36239, 0, -5.808196,
-3.19397, 1, -5.51592,
-3.36239, 1, -5.808196,
-3.19397, 2, -5.51592,
-3.36239, 2, -5.808196
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
-3.699229, -3, -6.392748, 0, -0.5, 0.5, 0.5,
-3.699229, -3, -6.392748, 1, -0.5, 0.5, 0.5,
-3.699229, -3, -6.392748, 1, 1.5, 0.5, 0.5,
-3.699229, -3, -6.392748, 0, 1.5, 0.5, 0.5,
-3.699229, -2, -6.392748, 0, -0.5, 0.5, 0.5,
-3.699229, -2, -6.392748, 1, -0.5, 0.5, 0.5,
-3.699229, -2, -6.392748, 1, 1.5, 0.5, 0.5,
-3.699229, -2, -6.392748, 0, 1.5, 0.5, 0.5,
-3.699229, -1, -6.392748, 0, -0.5, 0.5, 0.5,
-3.699229, -1, -6.392748, 1, -0.5, 0.5, 0.5,
-3.699229, -1, -6.392748, 1, 1.5, 0.5, 0.5,
-3.699229, -1, -6.392748, 0, 1.5, 0.5, 0.5,
-3.699229, 0, -6.392748, 0, -0.5, 0.5, 0.5,
-3.699229, 0, -6.392748, 1, -0.5, 0.5, 0.5,
-3.699229, 0, -6.392748, 1, 1.5, 0.5, 0.5,
-3.699229, 0, -6.392748, 0, 1.5, 0.5, 0.5,
-3.699229, 1, -6.392748, 0, -0.5, 0.5, 0.5,
-3.699229, 1, -6.392748, 1, -0.5, 0.5, 0.5,
-3.699229, 1, -6.392748, 1, 1.5, 0.5, 0.5,
-3.699229, 1, -6.392748, 0, 1.5, 0.5, 0.5,
-3.699229, 2, -6.392748, 0, -0.5, 0.5, 0.5,
-3.699229, 2, -6.392748, 1, -0.5, 0.5, 0.5,
-3.699229, 2, -6.392748, 1, 1.5, 0.5, 0.5,
-3.699229, 2, -6.392748, 0, 1.5, 0.5, 0.5
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
-3.19397, -3.309065, -4,
-3.19397, -3.309065, 6,
-3.19397, -3.309065, -4,
-3.36239, -3.461232, -4,
-3.19397, -3.309065, -2,
-3.36239, -3.461232, -2,
-3.19397, -3.309065, 0,
-3.36239, -3.461232, 0,
-3.19397, -3.309065, 2,
-3.36239, -3.461232, 2,
-3.19397, -3.309065, 4,
-3.36239, -3.461232, 4,
-3.19397, -3.309065, 6,
-3.36239, -3.461232, 6
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
-3.699229, -3.765566, -4, 0, -0.5, 0.5, 0.5,
-3.699229, -3.765566, -4, 1, -0.5, 0.5, 0.5,
-3.699229, -3.765566, -4, 1, 1.5, 0.5, 0.5,
-3.699229, -3.765566, -4, 0, 1.5, 0.5, 0.5,
-3.699229, -3.765566, -2, 0, -0.5, 0.5, 0.5,
-3.699229, -3.765566, -2, 1, -0.5, 0.5, 0.5,
-3.699229, -3.765566, -2, 1, 1.5, 0.5, 0.5,
-3.699229, -3.765566, -2, 0, 1.5, 0.5, 0.5,
-3.699229, -3.765566, 0, 0, -0.5, 0.5, 0.5,
-3.699229, -3.765566, 0, 1, -0.5, 0.5, 0.5,
-3.699229, -3.765566, 0, 1, 1.5, 0.5, 0.5,
-3.699229, -3.765566, 0, 0, 1.5, 0.5, 0.5,
-3.699229, -3.765566, 2, 0, -0.5, 0.5, 0.5,
-3.699229, -3.765566, 2, 1, -0.5, 0.5, 0.5,
-3.699229, -3.765566, 2, 1, 1.5, 0.5, 0.5,
-3.699229, -3.765566, 2, 0, 1.5, 0.5, 0.5,
-3.699229, -3.765566, 4, 0, -0.5, 0.5, 0.5,
-3.699229, -3.765566, 4, 1, -0.5, 0.5, 0.5,
-3.699229, -3.765566, 4, 1, 1.5, 0.5, 0.5,
-3.699229, -3.765566, 4, 0, 1.5, 0.5, 0.5,
-3.699229, -3.765566, 6, 0, -0.5, 0.5, 0.5,
-3.699229, -3.765566, 6, 1, -0.5, 0.5, 0.5,
-3.699229, -3.765566, 6, 1, 1.5, 0.5, 0.5,
-3.699229, -3.765566, 6, 0, 1.5, 0.5, 0.5
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
-3.19397, -3.309065, -5.51592,
-3.19397, 2.777625, -5.51592,
-3.19397, -3.309065, 6.175118,
-3.19397, 2.777625, 6.175118,
-3.19397, -3.309065, -5.51592,
-3.19397, -3.309065, 6.175118,
-3.19397, 2.777625, -5.51592,
-3.19397, 2.777625, 6.175118,
-3.19397, -3.309065, -5.51592,
3.54282, -3.309065, -5.51592,
-3.19397, -3.309065, 6.175118,
3.54282, -3.309065, 6.175118,
-3.19397, 2.777625, -5.51592,
3.54282, 2.777625, -5.51592,
-3.19397, 2.777625, 6.175118,
3.54282, 2.777625, 6.175118,
3.54282, -3.309065, -5.51592,
3.54282, 2.777625, -5.51592,
3.54282, -3.309065, 6.175118,
3.54282, 2.777625, 6.175118,
3.54282, -3.309065, -5.51592,
3.54282, -3.309065, 6.175118,
3.54282, 2.777625, -5.51592,
3.54282, 2.777625, 6.175118
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
var radius = 7.904221;
var distance = 35.16677;
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
mvMatrix.translate( -0.1744248, 0.2657197, -0.3295991 );
mvMatrix.scale( 1.268586, 1.40408, 0.7310042 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.16677);
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
benzadox<-read.table("benzadox.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-benzadox$V2
```

```
## Error in eval(expr, envir, enclos): object 'benzadox' not found
```

```r
y<-benzadox$V3
```

```
## Error in eval(expr, envir, enclos): object 'benzadox' not found
```

```r
z<-benzadox$V4
```

```
## Error in eval(expr, envir, enclos): object 'benzadox' not found
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
-3.095862, -1.938241, -1.474292, 0, 0, 1, 1, 1,
-2.845224, 1.460654, -1.542812, 1, 0, 0, 1, 1,
-2.833362, 0.5344312, -1.807248, 1, 0, 0, 1, 1,
-2.569437, -1.169162, -1.844719, 1, 0, 0, 1, 1,
-2.513198, 0.7611949, -0.6527476, 1, 0, 0, 1, 1,
-2.44588, -0.1271377, -1.295011, 1, 0, 0, 1, 1,
-2.365023, -0.3758733, -1.271757, 0, 0, 0, 1, 1,
-2.364208, -0.006685569, -1.441349, 0, 0, 0, 1, 1,
-2.24799, 0.02659944, -1.083851, 0, 0, 0, 1, 1,
-2.237709, -0.3332571, -0.9463188, 0, 0, 0, 1, 1,
-2.205961, 0.9186067, -2.883218, 0, 0, 0, 1, 1,
-2.141864, -0.2188203, -1.439041, 0, 0, 0, 1, 1,
-2.132303, 0.4855685, -1.516641, 0, 0, 0, 1, 1,
-2.122671, 0.4892843, -1.631169, 1, 1, 1, 1, 1,
-2.095243, -0.5183741, -0.6692428, 1, 1, 1, 1, 1,
-2.029434, -1.098638, -2.0136, 1, 1, 1, 1, 1,
-2.019526, -1.708875, -2.932739, 1, 1, 1, 1, 1,
-2.006234, 1.212553, -1.28688, 1, 1, 1, 1, 1,
-1.998363, 1.999826, -0.55433, 1, 1, 1, 1, 1,
-1.993072, 0.6106303, -2.604528, 1, 1, 1, 1, 1,
-1.992497, -0.5052478, -1.091411, 1, 1, 1, 1, 1,
-1.985267, -0.818823, -3.376585, 1, 1, 1, 1, 1,
-1.982397, 0.4922686, -1.546374, 1, 1, 1, 1, 1,
-1.97412, 1.513676, -1.081179, 1, 1, 1, 1, 1,
-1.968683, 0.08725375, -2.25444, 1, 1, 1, 1, 1,
-1.937999, 0.9783651, -1.718984, 1, 1, 1, 1, 1,
-1.876233, -0.6236548, -1.929869, 1, 1, 1, 1, 1,
-1.861539, -0.9956678, -2.713198, 1, 1, 1, 1, 1,
-1.856916, -1.765859, -3.579093, 0, 0, 1, 1, 1,
-1.836731, -0.6029597, -1.797421, 1, 0, 0, 1, 1,
-1.835663, -0.7703427, -1.015167, 1, 0, 0, 1, 1,
-1.835512, -0.2449515, -2.539404, 1, 0, 0, 1, 1,
-1.83477, -0.01418343, -1.504235, 1, 0, 0, 1, 1,
-1.833224, 0.2043694, 0.4501109, 1, 0, 0, 1, 1,
-1.829984, 1.332112, 0.9315671, 0, 0, 0, 1, 1,
-1.825928, 0.3322496, -0.5115604, 0, 0, 0, 1, 1,
-1.824483, -0.9311312, -3.454031, 0, 0, 0, 1, 1,
-1.805977, 0.274, -1.755461, 0, 0, 0, 1, 1,
-1.797414, 1.265721, -1.176445, 0, 0, 0, 1, 1,
-1.792976, 1.394795, -1.552174, 0, 0, 0, 1, 1,
-1.769735, -0.06330552, -2.164202, 0, 0, 0, 1, 1,
-1.715, 0.01899158, -0.5586801, 1, 1, 1, 1, 1,
-1.707721, -0.8375374, -1.602503, 1, 1, 1, 1, 1,
-1.707429, -0.351455, -1.73885, 1, 1, 1, 1, 1,
-1.690602, -0.5800258, -2.269131, 1, 1, 1, 1, 1,
-1.688755, -1.376947, -2.147597, 1, 1, 1, 1, 1,
-1.676495, -0.4650235, -2.067184, 1, 1, 1, 1, 1,
-1.674367, -2.094882, -1.099597, 1, 1, 1, 1, 1,
-1.673036, -1.065884, -2.129862, 1, 1, 1, 1, 1,
-1.666578, -0.2141295, -2.233197, 1, 1, 1, 1, 1,
-1.663873, -1.279877, -1.969645, 1, 1, 1, 1, 1,
-1.658039, 1.250668, 0.3456683, 1, 1, 1, 1, 1,
-1.649957, -1.294656, -1.495368, 1, 1, 1, 1, 1,
-1.636819, -0.3138581, -2.586937, 1, 1, 1, 1, 1,
-1.623483, -0.6943584, -2.613767, 1, 1, 1, 1, 1,
-1.615681, -0.3408612, -1.099685, 1, 1, 1, 1, 1,
-1.578459, -0.8562964, -1.474363, 0, 0, 1, 1, 1,
-1.57139, -1.086684, -1.883714, 1, 0, 0, 1, 1,
-1.568326, 1.585581, 0.2656645, 1, 0, 0, 1, 1,
-1.562373, 0.3879749, -1.936335, 1, 0, 0, 1, 1,
-1.558741, -1.114578, -0.4836107, 1, 0, 0, 1, 1,
-1.552522, 1.521262, -1.34419, 1, 0, 0, 1, 1,
-1.524841, -0.3367529, -0.6807406, 0, 0, 0, 1, 1,
-1.522124, 1.224162, -0.03678668, 0, 0, 0, 1, 1,
-1.519369, 0.11146, -1.978864, 0, 0, 0, 1, 1,
-1.515046, 0.7743561, -1.927244, 0, 0, 0, 1, 1,
-1.513881, -0.592178, 0.1820862, 0, 0, 0, 1, 1,
-1.50787, 0.4612987, -0.9007863, 0, 0, 0, 1, 1,
-1.504951, -0.4019439, -0.6963505, 0, 0, 0, 1, 1,
-1.494049, 0.9041219, 0.09011576, 1, 1, 1, 1, 1,
-1.49285, -1.288309, -3.821328, 1, 1, 1, 1, 1,
-1.489955, 0.4596406, -1.504394, 1, 1, 1, 1, 1,
-1.468973, 1.065947, 1.152399, 1, 1, 1, 1, 1,
-1.465792, 0.1285915, -0.8007962, 1, 1, 1, 1, 1,
-1.462694, 2.28673, 2.26827, 1, 1, 1, 1, 1,
-1.442966, 0.8762383, -0.6509579, 1, 1, 1, 1, 1,
-1.422281, 1.115399, 0.1652311, 1, 1, 1, 1, 1,
-1.412743, -0.8374412, -0.6015522, 1, 1, 1, 1, 1,
-1.412461, -0.2045678, -1.445064, 1, 1, 1, 1, 1,
-1.411402, -2.258062, -0.7659523, 1, 1, 1, 1, 1,
-1.403221, 2.049443, -1.313225, 1, 1, 1, 1, 1,
-1.402006, 2.082352, -1.497015, 1, 1, 1, 1, 1,
-1.401708, 0.1353052, -0.5971023, 1, 1, 1, 1, 1,
-1.394969, -0.2000497, -0.07901153, 1, 1, 1, 1, 1,
-1.379595, -1.692367, -1.390808, 0, 0, 1, 1, 1,
-1.374285, 0.5598974, -0.2047508, 1, 0, 0, 1, 1,
-1.371967, -0.9630466, -0.9808592, 1, 0, 0, 1, 1,
-1.367355, 0.2367, -0.9885018, 1, 0, 0, 1, 1,
-1.339518, 0.6788352, -0.8654262, 1, 0, 0, 1, 1,
-1.335057, 1.277065, -1.056999, 1, 0, 0, 1, 1,
-1.332057, -0.9830772, -3.644394, 0, 0, 0, 1, 1,
-1.307104, -0.4322054, -1.836085, 0, 0, 0, 1, 1,
-1.297033, 0.9942854, -2.574935, 0, 0, 0, 1, 1,
-1.294008, 0.5684263, -1.572667, 0, 0, 0, 1, 1,
-1.292404, -1.732753, -3.354458, 0, 0, 0, 1, 1,
-1.286718, 0.7533492, -0.5486737, 0, 0, 0, 1, 1,
-1.282272, 0.8342042, -0.4620825, 0, 0, 0, 1, 1,
-1.252353, -2.202344, -2.026438, 1, 1, 1, 1, 1,
-1.249686, 0.3790323, -2.434439, 1, 1, 1, 1, 1,
-1.24803, 0.2499921, -2.040607, 1, 1, 1, 1, 1,
-1.246661, -0.5351204, -2.588536, 1, 1, 1, 1, 1,
-1.240051, 0.007212524, -1.594377, 1, 1, 1, 1, 1,
-1.234894, 0.425373, -0.1094067, 1, 1, 1, 1, 1,
-1.226968, -1.166913, -2.678671, 1, 1, 1, 1, 1,
-1.225032, -1.553085, -1.901715, 1, 1, 1, 1, 1,
-1.223454, 1.466515, -0.1021116, 1, 1, 1, 1, 1,
-1.218383, -2.099924, -2.995802, 1, 1, 1, 1, 1,
-1.20991, 2.404989, -0.3731453, 1, 1, 1, 1, 1,
-1.208205, -0.8656985, -2.121107, 1, 1, 1, 1, 1,
-1.203987, -0.2250667, -4.178285, 1, 1, 1, 1, 1,
-1.197108, -0.0212013, -2.877769, 1, 1, 1, 1, 1,
-1.18711, -0.1069035, -0.8716405, 1, 1, 1, 1, 1,
-1.181517, -0.7657787, -2.846146, 0, 0, 1, 1, 1,
-1.170967, 0.75717, -1.294627, 1, 0, 0, 1, 1,
-1.15724, -0.2215992, -0.6459984, 1, 0, 0, 1, 1,
-1.15586, 0.06049738, -1.847091, 1, 0, 0, 1, 1,
-1.153526, -0.09509984, -1.952372, 1, 0, 0, 1, 1,
-1.14602, -0.8712177, -0.3399082, 1, 0, 0, 1, 1,
-1.144106, -0.2228187, -2.968771, 0, 0, 0, 1, 1,
-1.135342, -0.2163435, -0.1649531, 0, 0, 0, 1, 1,
-1.135211, -0.4578487, -1.130768, 0, 0, 0, 1, 1,
-1.131622, 0.4138739, -1.350904, 0, 0, 0, 1, 1,
-1.111992, -0.4914913, 0.3087177, 0, 0, 0, 1, 1,
-1.110376, -0.9899283, -1.344786, 0, 0, 0, 1, 1,
-1.105991, -0.3124288, -1.795186, 0, 0, 0, 1, 1,
-1.103283, -0.7525128, -1.61391, 1, 1, 1, 1, 1,
-1.100206, 1.295068, -2.570429, 1, 1, 1, 1, 1,
-1.097411, 0.3713814, -0.6658295, 1, 1, 1, 1, 1,
-1.097361, 1.92154, -0.7242184, 1, 1, 1, 1, 1,
-1.094601, -0.5257547, -2.957323, 1, 1, 1, 1, 1,
-1.094227, -1.206334, -2.153458, 1, 1, 1, 1, 1,
-1.080016, 0.009309523, -0.9417243, 1, 1, 1, 1, 1,
-1.078134, 0.3499382, -1.142156, 1, 1, 1, 1, 1,
-1.077813, 0.7042874, -1.332766, 1, 1, 1, 1, 1,
-1.075611, -0.3280036, -1.750364, 1, 1, 1, 1, 1,
-1.069302, -0.9518193, -3.386305, 1, 1, 1, 1, 1,
-1.068807, -0.5638342, -3.853606, 1, 1, 1, 1, 1,
-1.067893, 0.5159283, -1.165857, 1, 1, 1, 1, 1,
-1.062203, 2.588789, 0.6597051, 1, 1, 1, 1, 1,
-1.059221, -0.3218949, 0.02703816, 1, 1, 1, 1, 1,
-1.053932, -1.392942, -1.789183, 0, 0, 1, 1, 1,
-1.053734, -0.1569503, -1.877909, 1, 0, 0, 1, 1,
-1.047858, 2.339986, -0.4773887, 1, 0, 0, 1, 1,
-1.044746, -0.665442, -1.473233, 1, 0, 0, 1, 1,
-1.029429, 1.671699, -0.4738254, 1, 0, 0, 1, 1,
-1.028027, -0.9699444, -1.136651, 1, 0, 0, 1, 1,
-1.027053, 0.4151998, -2.416336, 0, 0, 0, 1, 1,
-1.026648, -0.1190633, -1.057897, 0, 0, 0, 1, 1,
-1.024172, -0.9241097, -1.720536, 0, 0, 0, 1, 1,
-1.020939, -0.8382534, -3.043934, 0, 0, 0, 1, 1,
-1.019932, -0.2066894, -4.118154, 0, 0, 0, 1, 1,
-1.013405, -0.3037703, -1.981534, 0, 0, 0, 1, 1,
-1.00129, -0.1166532, 0.1699841, 0, 0, 0, 1, 1,
-0.9990071, -0.9966415, -3.105603, 1, 1, 1, 1, 1,
-0.9904408, -0.3967062, -2.392531, 1, 1, 1, 1, 1,
-0.9855682, 0.5525612, -1.292482, 1, 1, 1, 1, 1,
-0.9802217, -0.2325594, -1.118803, 1, 1, 1, 1, 1,
-0.9797698, -1.183007, -1.889448, 1, 1, 1, 1, 1,
-0.979652, -1.066848, -1.466681, 1, 1, 1, 1, 1,
-0.9763696, 1.854115, -0.0659048, 1, 1, 1, 1, 1,
-0.9682325, 0.6379421, -0.198808, 1, 1, 1, 1, 1,
-0.9644045, 0.5207234, -1.551858, 1, 1, 1, 1, 1,
-0.9591197, -0.754477, -0.9661652, 1, 1, 1, 1, 1,
-0.9581553, 0.7482599, -1.363327, 1, 1, 1, 1, 1,
-0.9525361, 1.108202, -2.269649, 1, 1, 1, 1, 1,
-0.9519299, -0.1262657, -1.514759, 1, 1, 1, 1, 1,
-0.9516346, 0.2224921, 0.04684075, 1, 1, 1, 1, 1,
-0.9490893, 2.688984, 0.4671282, 1, 1, 1, 1, 1,
-0.9480087, 0.8065358, -1.209105, 0, 0, 1, 1, 1,
-0.940684, 0.2468965, -0.9938801, 1, 0, 0, 1, 1,
-0.9368861, -0.1577652, -1.229911, 1, 0, 0, 1, 1,
-0.9340028, -0.4547699, -1.476665, 1, 0, 0, 1, 1,
-0.928979, -1.241821, -2.498401, 1, 0, 0, 1, 1,
-0.9285396, 0.3098968, -3.15849, 1, 0, 0, 1, 1,
-0.9194002, 0.380798, -1.780449, 0, 0, 0, 1, 1,
-0.912396, -1.051726, -2.404357, 0, 0, 0, 1, 1,
-0.9079381, -0.3630383, -2.928828, 0, 0, 0, 1, 1,
-0.9031456, -1.015519, -2.731367, 0, 0, 0, 1, 1,
-0.9013515, -0.4701173, -4.266988, 0, 0, 0, 1, 1,
-0.9012101, 0.3884425, -1.386561, 0, 0, 0, 1, 1,
-0.8960571, -0.9547248, -2.380604, 0, 0, 0, 1, 1,
-0.8926435, -0.4827316, -1.595401, 1, 1, 1, 1, 1,
-0.8918197, 1.495776, 1.252102, 1, 1, 1, 1, 1,
-0.8901232, 1.655648, 0.6158345, 1, 1, 1, 1, 1,
-0.8797473, -0.2108053, -4.292648, 1, 1, 1, 1, 1,
-0.8761598, 0.7955041, -1.252574, 1, 1, 1, 1, 1,
-0.875523, 0.4216013, -0.5198184, 1, 1, 1, 1, 1,
-0.873375, 0.922857, -0.4845735, 1, 1, 1, 1, 1,
-0.8703922, 0.1852114, -0.8670653, 1, 1, 1, 1, 1,
-0.8663128, 1.575037, 0.3573419, 1, 1, 1, 1, 1,
-0.8614499, -0.9988226, -2.788761, 1, 1, 1, 1, 1,
-0.8598214, 0.6687025, -0.4504971, 1, 1, 1, 1, 1,
-0.8589538, 1.024383, -2.305301, 1, 1, 1, 1, 1,
-0.8585848, -0.07662245, 0.8476696, 1, 1, 1, 1, 1,
-0.8581479, 0.8709805, -1.767895, 1, 1, 1, 1, 1,
-0.8560446, -0.07424815, -1.123058, 1, 1, 1, 1, 1,
-0.8469714, 0.5587292, -0.8978581, 0, 0, 1, 1, 1,
-0.8415041, 0.5998303, -0.2344743, 1, 0, 0, 1, 1,
-0.8402786, 0.7262546, -0.5654944, 1, 0, 0, 1, 1,
-0.8368471, 1.333257, -1.12537, 1, 0, 0, 1, 1,
-0.833885, 0.7562941, -1.208512, 1, 0, 0, 1, 1,
-0.8308107, -0.2244897, -1.720177, 1, 0, 0, 1, 1,
-0.8251647, 0.267166, -1.919115, 0, 0, 0, 1, 1,
-0.8175387, -0.6025751, -0.2086105, 0, 0, 0, 1, 1,
-0.8155307, -1.589903, -2.365313, 0, 0, 0, 1, 1,
-0.8089046, 0.9331871, -1.343289, 0, 0, 0, 1, 1,
-0.8037396, -0.06366936, -0.2725083, 0, 0, 0, 1, 1,
-0.79735, -0.2021959, -2.905708, 0, 0, 0, 1, 1,
-0.7907907, 1.471222, 0.6016768, 0, 0, 0, 1, 1,
-0.7864725, 1.504441, -0.5863132, 1, 1, 1, 1, 1,
-0.7840839, 0.3173577, -0.8634059, 1, 1, 1, 1, 1,
-0.7806503, 0.908548, -1.221594, 1, 1, 1, 1, 1,
-0.7769332, 0.2373041, -2.493271, 1, 1, 1, 1, 1,
-0.774963, -0.6291698, -0.185691, 1, 1, 1, 1, 1,
-0.7712545, -0.6034164, -2.857189, 1, 1, 1, 1, 1,
-0.7694397, -0.2739721, -3.150968, 1, 1, 1, 1, 1,
-0.7662605, 0.7526981, -2.299577, 1, 1, 1, 1, 1,
-0.7638382, -0.3597037, -1.439207, 1, 1, 1, 1, 1,
-0.7637678, 0.5282811, -0.947723, 1, 1, 1, 1, 1,
-0.7575098, -0.2118972, -3.053287, 1, 1, 1, 1, 1,
-0.7559565, -0.1439718, -0.1512738, 1, 1, 1, 1, 1,
-0.7528593, 0.3601377, -2.247149, 1, 1, 1, 1, 1,
-0.7474334, -0.5110259, -2.252398, 1, 1, 1, 1, 1,
-0.7368578, -0.8413868, -2.509002, 1, 1, 1, 1, 1,
-0.7328323, 1.130985, 0.4019046, 0, 0, 1, 1, 1,
-0.7270836, -0.459643, -2.093759, 1, 0, 0, 1, 1,
-0.7259627, 0.7420174, -1.018326, 1, 0, 0, 1, 1,
-0.7256792, -0.1375195, -3.050223, 1, 0, 0, 1, 1,
-0.7256232, -0.7786529, -0.8719946, 1, 0, 0, 1, 1,
-0.7228292, -0.585541, -1.42545, 1, 0, 0, 1, 1,
-0.7128796, 0.6199835, -2.26977, 0, 0, 0, 1, 1,
-0.7101344, 0.361298, -1.244741, 0, 0, 0, 1, 1,
-0.7099929, -0.4448931, 0.4034318, 0, 0, 0, 1, 1,
-0.703701, 0.9726948, -1.099662, 0, 0, 0, 1, 1,
-0.6943381, 0.7502301, -0.2359946, 0, 0, 0, 1, 1,
-0.6938829, 0.6025906, -0.553681, 0, 0, 0, 1, 1,
-0.693275, -0.5562031, -2.484345, 0, 0, 0, 1, 1,
-0.6898559, 0.9665785, -0.4496855, 1, 1, 1, 1, 1,
-0.6894759, 0.3238876, -2.153967, 1, 1, 1, 1, 1,
-0.6832393, -1.842273, -4.711197, 1, 1, 1, 1, 1,
-0.6790441, -0.6650903, -3.610912, 1, 1, 1, 1, 1,
-0.6766347, -0.651685, -2.952638, 1, 1, 1, 1, 1,
-0.6761457, -1.041469, 0.6460969, 1, 1, 1, 1, 1,
-0.6760892, 1.195789, -0.4443214, 1, 1, 1, 1, 1,
-0.6714098, -0.8647761, -1.119986, 1, 1, 1, 1, 1,
-0.6708109, 0.8530923, -1.623743, 1, 1, 1, 1, 1,
-0.6594039, -0.1349445, -2.886436, 1, 1, 1, 1, 1,
-0.656886, 1.804155, 1.465583, 1, 1, 1, 1, 1,
-0.6547296, -0.01128173, -0.4656716, 1, 1, 1, 1, 1,
-0.654158, 1.138997, 0.3664252, 1, 1, 1, 1, 1,
-0.6479881, 0.9681836, -1.042443, 1, 1, 1, 1, 1,
-0.6474704, 0.04175177, -1.998636, 1, 1, 1, 1, 1,
-0.6472408, 0.3430612, 0.3753254, 0, 0, 1, 1, 1,
-0.6465522, -1.77754, -2.646284, 1, 0, 0, 1, 1,
-0.6411088, 0.7244077, -0.7118504, 1, 0, 0, 1, 1,
-0.6370527, 1.809355, 0.1832179, 1, 0, 0, 1, 1,
-0.63577, -0.4801745, -4.386591, 1, 0, 0, 1, 1,
-0.6354099, 0.323386, -0.08771765, 1, 0, 0, 1, 1,
-0.6338546, 1.444391, 0.9281193, 0, 0, 0, 1, 1,
-0.6310138, -0.7097731, -3.451382, 0, 0, 0, 1, 1,
-0.6290295, -0.0262631, -1.424423, 0, 0, 0, 1, 1,
-0.6276633, 0.3242581, 0.8056101, 0, 0, 0, 1, 1,
-0.6256399, -0.4804108, -2.817021, 0, 0, 0, 1, 1,
-0.6211326, -0.1881756, -1.3166, 0, 0, 0, 1, 1,
-0.6179126, -1.550995, -2.147871, 0, 0, 0, 1, 1,
-0.6157504, 0.1717334, -2.027, 1, 1, 1, 1, 1,
-0.608612, 0.6856953, -0.8794138, 1, 1, 1, 1, 1,
-0.5989333, -0.1497183, -3.031208, 1, 1, 1, 1, 1,
-0.5985733, -0.562008, -2.27458, 1, 1, 1, 1, 1,
-0.5968801, 0.7755398, -1.100677, 1, 1, 1, 1, 1,
-0.5955149, -0.07476874, -2.334669, 1, 1, 1, 1, 1,
-0.5916426, 2.032326, 0.239785, 1, 1, 1, 1, 1,
-0.5912879, -0.3487454, -1.585598, 1, 1, 1, 1, 1,
-0.5826284, -1.06037, -2.276317, 1, 1, 1, 1, 1,
-0.5777493, -1.489417, -3.608331, 1, 1, 1, 1, 1,
-0.5774792, 0.6406107, -0.9892178, 1, 1, 1, 1, 1,
-0.5770839, -0.1160298, -2.416113, 1, 1, 1, 1, 1,
-0.5711542, 1.165856, -0.001583333, 1, 1, 1, 1, 1,
-0.5636216, -2.166205, -4.495929, 1, 1, 1, 1, 1,
-0.5634734, 1.400492, 0.3444572, 1, 1, 1, 1, 1,
-0.5569111, 0.5052112, -0.7654861, 0, 0, 1, 1, 1,
-0.5497378, -0.8099013, -3.806113, 1, 0, 0, 1, 1,
-0.5493771, 0.3717372, -0.761274, 1, 0, 0, 1, 1,
-0.5465494, -0.03477231, -1.466052, 1, 0, 0, 1, 1,
-0.5452684, 1.275876, 1.205963, 1, 0, 0, 1, 1,
-0.5429202, 0.1493627, -1.067361, 1, 0, 0, 1, 1,
-0.5422097, 0.5365174, 0.8524424, 0, 0, 0, 1, 1,
-0.5420241, -0.6921705, -2.262397, 0, 0, 0, 1, 1,
-0.5399386, 1.068714, 0.7209023, 0, 0, 0, 1, 1,
-0.5396146, 0.1528727, -2.607202, 0, 0, 0, 1, 1,
-0.535024, -1.053955, -1.045449, 0, 0, 0, 1, 1,
-0.5349721, 1.058339, -0.6943185, 0, 0, 0, 1, 1,
-0.5348222, -0.9626911, -2.460108, 0, 0, 0, 1, 1,
-0.5331528, -1.040514, -3.496373, 1, 1, 1, 1, 1,
-0.5328229, 1.366768, -0.2755412, 1, 1, 1, 1, 1,
-0.5271412, -1.65281, -1.341041, 1, 1, 1, 1, 1,
-0.5243776, -1.599318, -2.297326, 1, 1, 1, 1, 1,
-0.5226901, -0.8718994, -0.7219095, 1, 1, 1, 1, 1,
-0.5194817, 0.9350536, -1.815384, 1, 1, 1, 1, 1,
-0.5190468, 0.7197204, -0.42322, 1, 1, 1, 1, 1,
-0.5162696, 0.3455959, 0.1826223, 1, 1, 1, 1, 1,
-0.5058496, -0.2860387, -1.902226, 1, 1, 1, 1, 1,
-0.4984554, 0.6424332, 0.4977711, 1, 1, 1, 1, 1,
-0.4975672, 1.415304, -1.407603, 1, 1, 1, 1, 1,
-0.4956892, -1.293883, -1.661046, 1, 1, 1, 1, 1,
-0.4916258, -1.388191, -4.001645, 1, 1, 1, 1, 1,
-0.4848547, -0.1446864, -1.466894, 1, 1, 1, 1, 1,
-0.4826179, 0.4782615, -0.9139997, 1, 1, 1, 1, 1,
-0.4819826, -1.530968, -2.678918, 0, 0, 1, 1, 1,
-0.4811135, -1.616441, -2.905362, 1, 0, 0, 1, 1,
-0.477383, -0.8316295, -2.722055, 1, 0, 0, 1, 1,
-0.4766967, 0.4676794, -1.315575, 1, 0, 0, 1, 1,
-0.46916, -2.038403, -1.003226, 1, 0, 0, 1, 1,
-0.4659998, 1.176416, 0.6302102, 1, 0, 0, 1, 1,
-0.4623518, 0.8739193, -1.847072, 0, 0, 0, 1, 1,
-0.4579506, 0.2609769, -0.7181043, 0, 0, 0, 1, 1,
-0.4552793, 1.454752, 0.5924616, 0, 0, 0, 1, 1,
-0.4541593, 1.083824, -0.9372948, 0, 0, 0, 1, 1,
-0.4515406, -1.330078, -4.232134, 0, 0, 0, 1, 1,
-0.4508863, -1.178163, -1.369271, 0, 0, 0, 1, 1,
-0.4478289, 0.4288749, 0.4644385, 0, 0, 0, 1, 1,
-0.4476465, -0.5373951, -1.444049, 1, 1, 1, 1, 1,
-0.4452103, -0.006538067, -1.05393, 1, 1, 1, 1, 1,
-0.4435306, -0.5426612, -1.749099, 1, 1, 1, 1, 1,
-0.4415183, 1.09922, -0.4083217, 1, 1, 1, 1, 1,
-0.4365417, -0.2273333, -2.269987, 1, 1, 1, 1, 1,
-0.4331049, 0.5913017, -1.139249, 1, 1, 1, 1, 1,
-0.4288397, 0.1386831, -1.379844, 1, 1, 1, 1, 1,
-0.4210598, 2.179017, 0.1372267, 1, 1, 1, 1, 1,
-0.4114886, 0.8504016, -1.569326, 1, 1, 1, 1, 1,
-0.4100866, 0.06873379, -1.634447, 1, 1, 1, 1, 1,
-0.4093466, 0.4358583, -1.6418, 1, 1, 1, 1, 1,
-0.4066379, -0.4861108, -0.6437639, 1, 1, 1, 1, 1,
-0.4019685, 0.4360749, -0.9918597, 1, 1, 1, 1, 1,
-0.4011005, -0.536809, -3.208105, 1, 1, 1, 1, 1,
-0.4001458, 1.533655, -1.360783, 1, 1, 1, 1, 1,
-0.399301, -0.5607738, -1.119732, 0, 0, 1, 1, 1,
-0.3980832, -0.5995131, -4.000099, 1, 0, 0, 1, 1,
-0.3897666, 0.8068115, -1.351957, 1, 0, 0, 1, 1,
-0.382749, -1.301581, -1.623934, 1, 0, 0, 1, 1,
-0.3811242, 0.463756, -0.0746785, 1, 0, 0, 1, 1,
-0.3809186, -0.1476245, -0.321505, 1, 0, 0, 1, 1,
-0.3761621, -0.453692, -3.17742, 0, 0, 0, 1, 1,
-0.37584, -1.798264, -2.392757, 0, 0, 0, 1, 1,
-0.3736521, -0.06669606, -1.565982, 0, 0, 0, 1, 1,
-0.3650345, 0.1878884, -1.203833, 0, 0, 0, 1, 1,
-0.3630071, 1.011439, -0.8084165, 0, 0, 0, 1, 1,
-0.3610842, 0.6680328, 1.789224, 0, 0, 0, 1, 1,
-0.3602354, 0.3355375, -1.816036, 0, 0, 0, 1, 1,
-0.3594987, 0.2805169, -0.9607835, 1, 1, 1, 1, 1,
-0.3534344, -0.215475, -2.493081, 1, 1, 1, 1, 1,
-0.345617, -0.2902696, -2.086618, 1, 1, 1, 1, 1,
-0.3448953, -1.638113, -2.921853, 1, 1, 1, 1, 1,
-0.3428453, -1.739173, -3.690059, 1, 1, 1, 1, 1,
-0.3387459, -1.198377, -2.212344, 1, 1, 1, 1, 1,
-0.3317521, 0.8616824, 0.7311366, 1, 1, 1, 1, 1,
-0.3270725, 0.06526272, -1.782941, 1, 1, 1, 1, 1,
-0.3261198, -0.8894446, -2.532199, 1, 1, 1, 1, 1,
-0.3255778, 0.3198867, -3.08202, 1, 1, 1, 1, 1,
-0.3239313, 0.3963847, -0.9042023, 1, 1, 1, 1, 1,
-0.3205566, -0.07730419, -3.402725, 1, 1, 1, 1, 1,
-0.3175345, 0.8276863, 2.79795, 1, 1, 1, 1, 1,
-0.3164733, -0.7876051, -2.568327, 1, 1, 1, 1, 1,
-0.3135915, 1.879233, 1.440897, 1, 1, 1, 1, 1,
-0.3127211, 1.745871, -1.452335, 0, 0, 1, 1, 1,
-0.3119168, 1.22681, -0.3689321, 1, 0, 0, 1, 1,
-0.3116009, 0.6084295, -0.9313698, 1, 0, 0, 1, 1,
-0.3106887, 0.1428508, -0.7118872, 1, 0, 0, 1, 1,
-0.3075997, -0.7526302, -1.461581, 1, 0, 0, 1, 1,
-0.3059116, -0.5284796, -1.755015, 1, 0, 0, 1, 1,
-0.3048863, -0.271773, -2.522316, 0, 0, 0, 1, 1,
-0.3041048, -0.1815422, -1.938019, 0, 0, 0, 1, 1,
-0.3040913, -0.108269, -1.959568, 0, 0, 0, 1, 1,
-0.3007803, 0.6789492, -2.553882, 0, 0, 0, 1, 1,
-0.3000734, 1.484154, 0.1053375, 0, 0, 0, 1, 1,
-0.2999129, 1.680134, 0.4027747, 0, 0, 0, 1, 1,
-0.2966556, -0.08546752, -0.338123, 0, 0, 0, 1, 1,
-0.2890749, 0.7853482, 0.4464885, 1, 1, 1, 1, 1,
-0.2869059, -0.7136314, -3.846327, 1, 1, 1, 1, 1,
-0.2860511, 0.8452505, -2.050014, 1, 1, 1, 1, 1,
-0.2844801, 1.272348, 0.1619606, 1, 1, 1, 1, 1,
-0.2835581, -0.7776488, -3.521895, 1, 1, 1, 1, 1,
-0.2796651, 0.8006867, -0.9333658, 1, 1, 1, 1, 1,
-0.2681605, 1.06985, -1.787135, 1, 1, 1, 1, 1,
-0.265428, 2.036732, 1.018855, 1, 1, 1, 1, 1,
-0.2633988, -0.3707514, -1.696398, 1, 1, 1, 1, 1,
-0.2628928, 1.220453, 0.406493, 1, 1, 1, 1, 1,
-0.2608205, 0.4290542, 0.09302554, 1, 1, 1, 1, 1,
-0.2600603, 0.3043495, -1.243573, 1, 1, 1, 1, 1,
-0.2530756, -0.1057398, -1.344181, 1, 1, 1, 1, 1,
-0.2491333, 0.2760129, 1.707319, 1, 1, 1, 1, 1,
-0.2483994, 0.1713981, -1.7669, 1, 1, 1, 1, 1,
-0.245827, -1.189651, -1.479284, 0, 0, 1, 1, 1,
-0.243455, 0.4672295, 0.5762874, 1, 0, 0, 1, 1,
-0.240091, 0.6504107, -0.2035729, 1, 0, 0, 1, 1,
-0.2367899, 0.2542373, -0.811247, 1, 0, 0, 1, 1,
-0.2366142, -1.495341, -1.254306, 1, 0, 0, 1, 1,
-0.236114, -0.8131347, -3.411116, 1, 0, 0, 1, 1,
-0.2345149, 1.523324, -0.09126628, 0, 0, 0, 1, 1,
-0.2340729, 0.5738158, -0.8845378, 0, 0, 0, 1, 1,
-0.2336858, 1.516279, -1.220562, 0, 0, 0, 1, 1,
-0.2320659, 0.2181298, -1.236748, 0, 0, 0, 1, 1,
-0.2307013, 2.047507, -1.767909, 0, 0, 0, 1, 1,
-0.2297311, -2.621835, -4.087523, 0, 0, 0, 1, 1,
-0.2243149, -0.4380125, -3.226783, 0, 0, 0, 1, 1,
-0.2238152, -1.454918, -5.060103, 1, 1, 1, 1, 1,
-0.2129671, 0.06082657, -1.019388, 1, 1, 1, 1, 1,
-0.2105365, -0.5430146, -3.909212, 1, 1, 1, 1, 1,
-0.2093211, -1.043149, -2.746197, 1, 1, 1, 1, 1,
-0.2049039, -1.679036, -3.300738, 1, 1, 1, 1, 1,
-0.2024961, 0.4634644, 2.120887, 1, 1, 1, 1, 1,
-0.2022799, 0.5651206, -0.3692756, 1, 1, 1, 1, 1,
-0.1996593, 0.7704111, 0.4271444, 1, 1, 1, 1, 1,
-0.1866212, 0.4667918, -2.135444, 1, 1, 1, 1, 1,
-0.185916, 0.5479069, -1.74392, 1, 1, 1, 1, 1,
-0.1846208, 0.7924846, 0.6044216, 1, 1, 1, 1, 1,
-0.1831053, 0.3242994, 0.06298824, 1, 1, 1, 1, 1,
-0.1814568, -1.389387, -3.873266, 1, 1, 1, 1, 1,
-0.17883, 0.1759554, -0.2743066, 1, 1, 1, 1, 1,
-0.1754991, 1.200971, -0.8873699, 1, 1, 1, 1, 1,
-0.1695722, 2.070501, 0.8986031, 0, 0, 1, 1, 1,
-0.1688998, 0.1253141, -2.076058, 1, 0, 0, 1, 1,
-0.1665108, -1.115612, -1.517752, 1, 0, 0, 1, 1,
-0.1653856, 1.63801, 0.9078583, 1, 0, 0, 1, 1,
-0.1645419, -1.207107, -3.493339, 1, 0, 0, 1, 1,
-0.1641404, 0.2515054, -1.177279, 1, 0, 0, 1, 1,
-0.1619494, 0.1659264, 0.4482302, 0, 0, 0, 1, 1,
-0.1614446, 0.313289, 2.744292, 0, 0, 0, 1, 1,
-0.1610495, 0.1602207, -2.257553, 0, 0, 0, 1, 1,
-0.161039, -0.8964018, -1.891132, 0, 0, 0, 1, 1,
-0.1593689, 0.7239913, 0.8865281, 0, 0, 0, 1, 1,
-0.1540424, 0.4679078, 2.013927, 0, 0, 0, 1, 1,
-0.1529163, 0.8338633, 0.3390358, 0, 0, 0, 1, 1,
-0.1503167, -1.327529, -4.517418, 1, 1, 1, 1, 1,
-0.1470784, 1.104119, 0.8132764, 1, 1, 1, 1, 1,
-0.1461523, -0.3657636, -2.72685, 1, 1, 1, 1, 1,
-0.1440505, -0.4977432, -2.636105, 1, 1, 1, 1, 1,
-0.1432488, 0.3817662, 0.3630586, 1, 1, 1, 1, 1,
-0.1415666, 0.4225796, 0.6610129, 1, 1, 1, 1, 1,
-0.1409009, -0.6521893, -3.615341, 1, 1, 1, 1, 1,
-0.1408531, 2.109601, 0.09078199, 1, 1, 1, 1, 1,
-0.1337546, -0.7208803, -1.468202, 1, 1, 1, 1, 1,
-0.1266847, -0.4861949, -1.032964, 1, 1, 1, 1, 1,
-0.1257655, -0.9827545, -4.386389, 1, 1, 1, 1, 1,
-0.1185428, 0.3392572, 0.5607455, 1, 1, 1, 1, 1,
-0.1169474, -0.6374148, -3.211502, 1, 1, 1, 1, 1,
-0.1100208, -0.1851093, -1.481068, 1, 1, 1, 1, 1,
-0.1098069, 0.8390952, -0.6942467, 1, 1, 1, 1, 1,
-0.1082606, 0.007078848, -1.43617, 0, 0, 1, 1, 1,
-0.10786, 1.078291, 0.165397, 1, 0, 0, 1, 1,
-0.1077819, -0.6819111, -1.841692, 1, 0, 0, 1, 1,
-0.1005846, 0.3900419, -0.1164281, 1, 0, 0, 1, 1,
-0.09715188, -0.1490575, -1.720929, 1, 0, 0, 1, 1,
-0.09427394, -1.193974, -1.850762, 1, 0, 0, 1, 1,
-0.09375542, -1.752662, -5.345662, 0, 0, 0, 1, 1,
-0.08995664, -3.047034, -3.903246, 0, 0, 0, 1, 1,
-0.08940795, 0.03899603, -1.47183, 0, 0, 0, 1, 1,
-0.08753242, -2.877214, -3.899145, 0, 0, 0, 1, 1,
-0.08389755, 0.1973676, -2.291359, 0, 0, 0, 1, 1,
-0.08012011, -1.217114, -2.726537, 0, 0, 0, 1, 1,
-0.07739493, 1.328804, -1.167995, 0, 0, 0, 1, 1,
-0.07637224, 0.6432524, 0.06771666, 1, 1, 1, 1, 1,
-0.07519137, -1.8237, -1.358996, 1, 1, 1, 1, 1,
-0.07475226, -0.6725642, -1.93655, 1, 1, 1, 1, 1,
-0.07324821, 0.8334695, 0.8996055, 1, 1, 1, 1, 1,
-0.07247985, -0.7938184, -1.732039, 1, 1, 1, 1, 1,
-0.07218795, -0.1052939, -3.033599, 1, 1, 1, 1, 1,
-0.07154346, -0.453577, -1.961017, 1, 1, 1, 1, 1,
-0.07126436, 0.7584239, -0.6390546, 1, 1, 1, 1, 1,
-0.06757972, -0.4103971, -2.880429, 1, 1, 1, 1, 1,
-0.06730386, 0.06880789, -2.543801, 1, 1, 1, 1, 1,
-0.06696201, -0.2094588, -3.788212, 1, 1, 1, 1, 1,
-0.06225684, 0.7016091, -0.1316096, 1, 1, 1, 1, 1,
-0.06002146, 0.4256333, 0.746279, 1, 1, 1, 1, 1,
-0.05872104, 0.3027444, 1.125706, 1, 1, 1, 1, 1,
-0.05699068, -0.9166251, -2.731104, 1, 1, 1, 1, 1,
-0.05609635, 0.05749104, -1.675912, 0, 0, 1, 1, 1,
-0.0479636, 0.8038442, 0.0041153, 1, 0, 0, 1, 1,
-0.0476555, 0.172499, 0.01899868, 1, 0, 0, 1, 1,
-0.04403678, 2.061485, -1.675077, 1, 0, 0, 1, 1,
-0.04356119, 0.3415063, 2.543236, 1, 0, 0, 1, 1,
-0.04323791, 1.169957, 0.4174992, 1, 0, 0, 1, 1,
-0.04202629, 0.5519378, 1.724072, 0, 0, 0, 1, 1,
-0.04201748, -0.1824725, -2.401163, 0, 0, 0, 1, 1,
-0.03647976, 0.621057, -0.7188592, 0, 0, 0, 1, 1,
-0.03634887, 0.07960691, -1.604966, 0, 0, 0, 1, 1,
-0.03231067, -0.713694, -3.908695, 0, 0, 0, 1, 1,
-0.03048458, -1.738397, -2.400039, 0, 0, 0, 1, 1,
-0.02543829, 2.242279, -0.4200482, 0, 0, 0, 1, 1,
-0.02537233, -0.6044376, -4.833854, 1, 1, 1, 1, 1,
-0.02018237, 0.06405701, -0.460183, 1, 1, 1, 1, 1,
-0.01986133, 0.0930981, -0.1621215, 1, 1, 1, 1, 1,
-0.0182703, -3.220423, -4.447626, 1, 1, 1, 1, 1,
-0.01647519, 1.615795, -0.3985562, 1, 1, 1, 1, 1,
-0.0143867, -0.6021434, -3.652468, 1, 1, 1, 1, 1,
-0.006619193, -1.29989, -4.010095, 1, 1, 1, 1, 1,
-0.005185858, -2.123992, -2.188817, 1, 1, 1, 1, 1,
-0.00438813, 1.034755, 0.4020061, 1, 1, 1, 1, 1,
-0.002141463, 0.2612015, 1.19764, 1, 1, 1, 1, 1,
0.002475634, 0.3336489, -1.83139, 1, 1, 1, 1, 1,
0.005759703, -0.8876164, 1.518142, 1, 1, 1, 1, 1,
0.005887834, -0.7503067, 2.829286, 1, 1, 1, 1, 1,
0.009176377, -0.6493816, 3.731379, 1, 1, 1, 1, 1,
0.01375182, -1.063279, 1.237224, 1, 1, 1, 1, 1,
0.02580091, -3.125974, 2.035663, 0, 0, 1, 1, 1,
0.02934902, -0.4578612, 3.187833, 1, 0, 0, 1, 1,
0.02964202, -0.8026754, 2.106398, 1, 0, 0, 1, 1,
0.0306717, -0.4442585, 3.819553, 1, 0, 0, 1, 1,
0.03421231, -1.588209, 3.689103, 1, 0, 0, 1, 1,
0.03443999, -1.666077, 3.169645, 1, 0, 0, 1, 1,
0.04026797, -1.110237, 2.081665, 0, 0, 0, 1, 1,
0.04346237, 0.5397507, 1.203123, 0, 0, 0, 1, 1,
0.04520295, -0.2871367, 4.927619, 0, 0, 0, 1, 1,
0.04716822, -0.02708223, 0.3527904, 0, 0, 0, 1, 1,
0.04761812, 0.08174773, 0.1919229, 0, 0, 0, 1, 1,
0.04940977, 0.5209366, -0.01434785, 0, 0, 0, 1, 1,
0.0534226, -0.99543, 2.154881, 0, 0, 0, 1, 1,
0.05473749, -2.110145, 2.418943, 1, 1, 1, 1, 1,
0.06692687, 0.5656238, 1.442706, 1, 1, 1, 1, 1,
0.07189488, -0.5744389, 2.617445, 1, 1, 1, 1, 1,
0.07372601, -0.1903211, 3.550494, 1, 1, 1, 1, 1,
0.07624516, 1.310533, 0.7963127, 1, 1, 1, 1, 1,
0.0765489, 1.398743, -0.6924925, 1, 1, 1, 1, 1,
0.07698587, -0.5969988, 1.337046, 1, 1, 1, 1, 1,
0.0783119, -0.2451551, 2.999633, 1, 1, 1, 1, 1,
0.07838903, 0.1588948, -0.4731406, 1, 1, 1, 1, 1,
0.07966548, -1.322291, 2.748449, 1, 1, 1, 1, 1,
0.08045497, 0.1326104, 0.3194985, 1, 1, 1, 1, 1,
0.08244465, 0.3392991, -1.196023, 1, 1, 1, 1, 1,
0.08266124, -1.170375, 3.64725, 1, 1, 1, 1, 1,
0.08932194, 1.279202, -0.3758385, 1, 1, 1, 1, 1,
0.09120151, -0.01145652, 1.048891, 1, 1, 1, 1, 1,
0.09156232, 0.6179061, 1.800196, 0, 0, 1, 1, 1,
0.09297667, -1.205265, 2.432094, 1, 0, 0, 1, 1,
0.09614672, -0.8227803, 4.214444, 1, 0, 0, 1, 1,
0.1005599, 0.003161978, 2.595281, 1, 0, 0, 1, 1,
0.1065918, -0.2081455, 0.3536702, 1, 0, 0, 1, 1,
0.1070423, -0.3460075, 2.570179, 1, 0, 0, 1, 1,
0.107803, 0.1486246, 1.196237, 0, 0, 0, 1, 1,
0.1096509, -0.7109576, 2.136389, 0, 0, 0, 1, 1,
0.1105266, 0.8470697, 0.3008769, 0, 0, 0, 1, 1,
0.1116538, 1.055432, -0.09723013, 0, 0, 0, 1, 1,
0.1146668, -0.7954414, 2.632006, 0, 0, 0, 1, 1,
0.1215638, 0.2304629, 0.8843418, 0, 0, 0, 1, 1,
0.1215747, 1.15422, 1.330551, 0, 0, 0, 1, 1,
0.1216838, -0.1790311, 1.396154, 1, 1, 1, 1, 1,
0.1249121, 0.3199062, -0.792361, 1, 1, 1, 1, 1,
0.127743, -1.462537, 3.109362, 1, 1, 1, 1, 1,
0.1320417, 2.162451, 0.952059, 1, 1, 1, 1, 1,
0.1355014, -1.228158, 4.347877, 1, 1, 1, 1, 1,
0.1432668, 0.4769425, 1.113202, 1, 1, 1, 1, 1,
0.144657, 0.1119654, 1.692311, 1, 1, 1, 1, 1,
0.1452434, 1.500226, 0.6887512, 1, 1, 1, 1, 1,
0.1536943, -0.03425362, 1.176517, 1, 1, 1, 1, 1,
0.1568899, -1.114635, 3.280575, 1, 1, 1, 1, 1,
0.1571677, -0.8069472, 4.297299, 1, 1, 1, 1, 1,
0.1572964, 0.1702616, 0.9876807, 1, 1, 1, 1, 1,
0.1597963, 0.2331169, 0.394751, 1, 1, 1, 1, 1,
0.1626357, -0.5397368, 2.302177, 1, 1, 1, 1, 1,
0.1628472, 0.9994123, -0.700433, 1, 1, 1, 1, 1,
0.1654668, -0.5570534, 2.613864, 0, 0, 1, 1, 1,
0.1656758, -1.723869, 5.04791, 1, 0, 0, 1, 1,
0.1662927, 0.3356239, 0.6435682, 1, 0, 0, 1, 1,
0.1706908, 0.9380602, 1.631323, 1, 0, 0, 1, 1,
0.1712338, 1.997896, 0.1115637, 1, 0, 0, 1, 1,
0.173405, -0.08247699, 0.6798327, 1, 0, 0, 1, 1,
0.1774474, 0.4013069, -0.4146837, 0, 0, 0, 1, 1,
0.1810211, 1.437676, 0.7051457, 0, 0, 0, 1, 1,
0.1877384, 0.53148, 1.18913, 0, 0, 0, 1, 1,
0.1893423, 0.162607, 1.207652, 0, 0, 0, 1, 1,
0.1909115, 0.2168158, 2.224514, 0, 0, 0, 1, 1,
0.1916727, -0.3435195, 6.00486, 0, 0, 0, 1, 1,
0.1951115, 0.7541027, -0.5138276, 0, 0, 0, 1, 1,
0.1957296, -0.4080258, 4.196656, 1, 1, 1, 1, 1,
0.1993894, 0.01304918, 1.848377, 1, 1, 1, 1, 1,
0.2003247, -0.1516768, 3.046784, 1, 1, 1, 1, 1,
0.2008432, -0.2563213, 2.423938, 1, 1, 1, 1, 1,
0.2027086, -2.052254, 2.499878, 1, 1, 1, 1, 1,
0.2047644, -1.34364, 3.68311, 1, 1, 1, 1, 1,
0.2051428, 0.2433869, 1.416157, 1, 1, 1, 1, 1,
0.2153599, -0.1539576, 3.132147, 1, 1, 1, 1, 1,
0.2154043, 0.5782509, -0.01898649, 1, 1, 1, 1, 1,
0.2179035, 2.341288, 0.6331061, 1, 1, 1, 1, 1,
0.218299, -0.322634, 4.464368, 1, 1, 1, 1, 1,
0.2259153, -0.05334909, 1.408592, 1, 1, 1, 1, 1,
0.2290923, -1.230441, 3.186271, 1, 1, 1, 1, 1,
0.2296076, 0.27906, -0.3058932, 1, 1, 1, 1, 1,
0.229684, -0.8229666, 3.379003, 1, 1, 1, 1, 1,
0.2415352, -1.060581, 3.183497, 0, 0, 1, 1, 1,
0.2478012, -0.7227053, 4.183676, 1, 0, 0, 1, 1,
0.2499644, 0.464586, 0.5025158, 1, 0, 0, 1, 1,
0.2513922, 0.8856498, -0.3406115, 1, 0, 0, 1, 1,
0.2529292, -2.341392, 2.929019, 1, 0, 0, 1, 1,
0.2563046, -2.45714, 4.0043, 1, 0, 0, 1, 1,
0.2568477, -1.56154, 2.117937, 0, 0, 0, 1, 1,
0.2597792, 1.335713, 0.4431627, 0, 0, 0, 1, 1,
0.2627731, -0.01155021, 1.092405, 0, 0, 0, 1, 1,
0.2659667, 0.3124444, 0.9117963, 0, 0, 0, 1, 1,
0.2745017, 0.6115703, 0.1893552, 0, 0, 0, 1, 1,
0.277489, -1.181877, 1.624999, 0, 0, 0, 1, 1,
0.2777169, 0.7468159, -0.3603636, 0, 0, 0, 1, 1,
0.2827824, -0.1771633, 1.013695, 1, 1, 1, 1, 1,
0.2867955, 0.3848254, 1.32288, 1, 1, 1, 1, 1,
0.289417, -0.006139143, 3.771822, 1, 1, 1, 1, 1,
0.2938342, -0.2556794, 2.02165, 1, 1, 1, 1, 1,
0.2959956, -0.0992155, 3.254372, 1, 1, 1, 1, 1,
0.2960027, -0.5572709, 2.454072, 1, 1, 1, 1, 1,
0.3112249, -0.2954808, 2.132826, 1, 1, 1, 1, 1,
0.3146802, -0.5048566, 3.920368, 1, 1, 1, 1, 1,
0.3245078, 1.650403, 0.4944901, 1, 1, 1, 1, 1,
0.3324937, -1.941039, 1.145905, 1, 1, 1, 1, 1,
0.3354823, -0.9862874, 3.885825, 1, 1, 1, 1, 1,
0.3394638, -0.4908492, 2.728106, 1, 1, 1, 1, 1,
0.3411498, 1.004818, 0.4554084, 1, 1, 1, 1, 1,
0.3427999, 0.7080076, 0.6555455, 1, 1, 1, 1, 1,
0.3430029, -0.9807158, 3.460898, 1, 1, 1, 1, 1,
0.3430578, -1.112019, 2.818497, 0, 0, 1, 1, 1,
0.3433002, 1.896061, 2.312917, 1, 0, 0, 1, 1,
0.347194, -0.7228208, 2.240206, 1, 0, 0, 1, 1,
0.3508551, 1.85633, -1.699106, 1, 0, 0, 1, 1,
0.3533151, -0.7330435, 3.051826, 1, 0, 0, 1, 1,
0.3544163, 0.4842294, 0.8157645, 1, 0, 0, 1, 1,
0.3547532, 0.7347385, 1.376404, 0, 0, 0, 1, 1,
0.3560692, 0.1424019, 1.315968, 0, 0, 0, 1, 1,
0.3599986, -0.1231748, 2.118075, 0, 0, 0, 1, 1,
0.3600782, -0.6422931, 4.387993, 0, 0, 0, 1, 1,
0.3656991, 1.015321, 0.750204, 0, 0, 0, 1, 1,
0.3662877, 1.948709, 1.733258, 0, 0, 0, 1, 1,
0.3679277, 1.647378, -0.3638237, 0, 0, 0, 1, 1,
0.3679955, 0.05120195, -0.1383398, 1, 1, 1, 1, 1,
0.3693686, -0.3180648, 3.614497, 1, 1, 1, 1, 1,
0.3705677, 0.2785903, 2.977335, 1, 1, 1, 1, 1,
0.3729308, 0.06492611, 1.56624, 1, 1, 1, 1, 1,
0.3801784, 0.5772725, 0.4443749, 1, 1, 1, 1, 1,
0.3804076, -0.797537, 2.920141, 1, 1, 1, 1, 1,
0.3817085, 1.496094, -0.8531249, 1, 1, 1, 1, 1,
0.3831932, -0.0893777, 0.6988951, 1, 1, 1, 1, 1,
0.3849829, 1.24074, -0.734645, 1, 1, 1, 1, 1,
0.3869718, 0.6818032, 0.9727463, 1, 1, 1, 1, 1,
0.3882352, -0.2109323, 1.588294, 1, 1, 1, 1, 1,
0.3974675, -0.5160584, 2.384952, 1, 1, 1, 1, 1,
0.4036306, 0.9617977, 0.4248792, 1, 1, 1, 1, 1,
0.4067656, 0.4863546, -0.3374514, 1, 1, 1, 1, 1,
0.4105367, 0.08691791, 1.204175, 1, 1, 1, 1, 1,
0.4142831, 0.08763522, 2.289148, 0, 0, 1, 1, 1,
0.4178049, -0.6277797, 4.009407, 1, 0, 0, 1, 1,
0.4190191, 0.9266613, 0.7000862, 1, 0, 0, 1, 1,
0.4216677, -0.1486374, 1.632964, 1, 0, 0, 1, 1,
0.4257152, 0.8324803, 2.500517, 1, 0, 0, 1, 1,
0.431735, -0.16803, -0.1228316, 1, 0, 0, 1, 1,
0.43489, 0.5193167, -0.5682307, 0, 0, 0, 1, 1,
0.436939, 1.555585, -1.298462, 0, 0, 0, 1, 1,
0.437483, -0.2080644, 3.824839, 0, 0, 0, 1, 1,
0.437721, -0.1962986, 2.628117, 0, 0, 0, 1, 1,
0.4458, 1.089189, 2.610364, 0, 0, 0, 1, 1,
0.4473353, -0.9291421, 2.264274, 0, 0, 0, 1, 1,
0.4520543, 1.243652, 1.544495, 0, 0, 0, 1, 1,
0.457147, 0.5236896, 0.2265437, 1, 1, 1, 1, 1,
0.4618807, 1.376775, 0.8492344, 1, 1, 1, 1, 1,
0.4666689, -1.003181, 2.459925, 1, 1, 1, 1, 1,
0.4727933, -0.279405, 4.949098, 1, 1, 1, 1, 1,
0.4739419, -0.5344869, 2.883576, 1, 1, 1, 1, 1,
0.4757552, -0.2040312, 1.578945, 1, 1, 1, 1, 1,
0.4767653, 1.38205, 0.06486313, 1, 1, 1, 1, 1,
0.4781283, 0.1117921, 2.321792, 1, 1, 1, 1, 1,
0.4786874, -0.3798615, 2.361199, 1, 1, 1, 1, 1,
0.47996, 0.3844461, 2.189467, 1, 1, 1, 1, 1,
0.4804408, -0.9462689, 1.601626, 1, 1, 1, 1, 1,
0.4808985, 0.7242547, 0.243091, 1, 1, 1, 1, 1,
0.4829502, -1.428814, 2.400424, 1, 1, 1, 1, 1,
0.4939639, 0.9701637, 0.9831923, 1, 1, 1, 1, 1,
0.5050789, -0.4530074, 1.616145, 1, 1, 1, 1, 1,
0.5065548, 1.081989, 0.6449032, 0, 0, 1, 1, 1,
0.5069391, -0.7332456, -0.07007049, 1, 0, 0, 1, 1,
0.508446, -0.7367462, 3.308113, 1, 0, 0, 1, 1,
0.5086677, 0.2145342, 1.354936, 1, 0, 0, 1, 1,
0.514369, 0.8351761, -0.7496234, 1, 0, 0, 1, 1,
0.5163236, 0.3471474, 1.10234, 1, 0, 0, 1, 1,
0.5304384, -1.250011, 1.816134, 0, 0, 0, 1, 1,
0.5310922, -0.8527132, 0.8222389, 0, 0, 0, 1, 1,
0.5372347, -1.079664, 3.833, 0, 0, 0, 1, 1,
0.5377993, 1.363642, 1.856829, 0, 0, 0, 1, 1,
0.5390447, -1.009015, 0.8324268, 0, 0, 0, 1, 1,
0.5417634, 1.214978, -0.9869563, 0, 0, 0, 1, 1,
0.5424465, -1.405632, 2.390561, 0, 0, 0, 1, 1,
0.5430689, 0.1077096, 2.519854, 1, 1, 1, 1, 1,
0.5434378, 0.04484026, 1.371597, 1, 1, 1, 1, 1,
0.5471194, -1.713493, 3.93664, 1, 1, 1, 1, 1,
0.5484146, 0.1269662, 2.459762, 1, 1, 1, 1, 1,
0.5621503, -0.9627945, 0.9677868, 1, 1, 1, 1, 1,
0.563603, -0.07312993, 0.9801458, 1, 1, 1, 1, 1,
0.567279, 0.2493817, 2.515017, 1, 1, 1, 1, 1,
0.5708264, 0.2500158, 0.1125728, 1, 1, 1, 1, 1,
0.5744999, -0.7183925, 2.044945, 1, 1, 1, 1, 1,
0.575186, 0.7990938, 0.8749921, 1, 1, 1, 1, 1,
0.5772327, -0.1481018, 2.626868, 1, 1, 1, 1, 1,
0.5804479, -1.965673, 2.655595, 1, 1, 1, 1, 1,
0.5852699, -0.550389, 2.520909, 1, 1, 1, 1, 1,
0.5883368, -0.5812208, 3.245356, 1, 1, 1, 1, 1,
0.5894493, 0.1422435, 2.243912, 1, 1, 1, 1, 1,
0.5899966, -0.1007524, 1.146035, 0, 0, 1, 1, 1,
0.5916544, -1.318003, 2.198107, 1, 0, 0, 1, 1,
0.5924809, 0.4457771, 1.293014, 1, 0, 0, 1, 1,
0.5927615, -0.3146958, 3.697603, 1, 0, 0, 1, 1,
0.5929025, 0.6125993, 1.026639, 1, 0, 0, 1, 1,
0.5937136, -0.3321308, 1.423853, 1, 0, 0, 1, 1,
0.5990618, -1.351206, 3.365551, 0, 0, 0, 1, 1,
0.5994691, 0.8073703, -0.1817524, 0, 0, 0, 1, 1,
0.605718, 0.7643067, 2.008699, 0, 0, 0, 1, 1,
0.6076589, -0.2340566, 0.953418, 0, 0, 0, 1, 1,
0.6114174, 0.8251617, 3.626372, 0, 0, 0, 1, 1,
0.6204024, 0.4445999, -0.1504784, 0, 0, 0, 1, 1,
0.6267635, 0.252764, 3.582629, 0, 0, 0, 1, 1,
0.6314698, -0.9653277, 2.761309, 1, 1, 1, 1, 1,
0.634392, -0.7126918, 3.530039, 1, 1, 1, 1, 1,
0.6351436, 0.003528223, 1.837473, 1, 1, 1, 1, 1,
0.6357759, 1.097233, 0.5453198, 1, 1, 1, 1, 1,
0.636698, -0.3170067, 2.673738, 1, 1, 1, 1, 1,
0.6457652, -0.9605012, 2.565538, 1, 1, 1, 1, 1,
0.6482963, -0.900268, 3.236223, 1, 1, 1, 1, 1,
0.6501614, -0.06513145, 2.026147, 1, 1, 1, 1, 1,
0.654492, -1.317053, 2.428946, 1, 1, 1, 1, 1,
0.6559244, -0.5955337, 3.547668, 1, 1, 1, 1, 1,
0.6595649, -1.829448, 3.020975, 1, 1, 1, 1, 1,
0.6626322, -1.117507, 1.948796, 1, 1, 1, 1, 1,
0.6641414, 0.3231184, 1.434384, 1, 1, 1, 1, 1,
0.6641471, -0.03747133, 1.653066, 1, 1, 1, 1, 1,
0.6727871, 0.3722611, 1.654097, 1, 1, 1, 1, 1,
0.6738018, -1.095953, 2.457597, 0, 0, 1, 1, 1,
0.6767957, 1.049381, 2.119194, 1, 0, 0, 1, 1,
0.6805336, -0.3514518, 3.170525, 1, 0, 0, 1, 1,
0.6809529, -0.4356286, 1.266977, 1, 0, 0, 1, 1,
0.6829863, -0.272467, 2.948615, 1, 0, 0, 1, 1,
0.6853164, 0.06355204, 0.8152455, 1, 0, 0, 1, 1,
0.6921079, 0.01651133, 0.1899695, 0, 0, 0, 1, 1,
0.6940482, 0.973471, 1.864522, 0, 0, 0, 1, 1,
0.6940694, -0.2024845, 3.497627, 0, 0, 0, 1, 1,
0.696502, 2.180206, 1.243403, 0, 0, 0, 1, 1,
0.6986753, 1.568208, 0.2873336, 0, 0, 0, 1, 1,
0.6988477, 0.8009359, 0.7269547, 0, 0, 0, 1, 1,
0.7001038, -0.7659866, 1.605795, 0, 0, 0, 1, 1,
0.7064775, -2.551155, 3.43907, 1, 1, 1, 1, 1,
0.70838, -0.4108572, 1.957471, 1, 1, 1, 1, 1,
0.7174576, -0.269283, 1.368116, 1, 1, 1, 1, 1,
0.7175959, 0.469346, 1.407758, 1, 1, 1, 1, 1,
0.7209961, 0.06122265, 2.18872, 1, 1, 1, 1, 1,
0.7231265, -0.3267987, 1.115496, 1, 1, 1, 1, 1,
0.7254357, -1.156025, 3.145544, 1, 1, 1, 1, 1,
0.7255863, 1.404597, 0.7199547, 1, 1, 1, 1, 1,
0.725992, 0.5382342, 1.688265, 1, 1, 1, 1, 1,
0.7312244, -0.212554, 1.850106, 1, 1, 1, 1, 1,
0.7405977, 0.4858597, 2.357902, 1, 1, 1, 1, 1,
0.7420315, 1.823644, -0.3323454, 1, 1, 1, 1, 1,
0.7446611, -1.915662, 3.529295, 1, 1, 1, 1, 1,
0.7514588, 1.027045, 0.8231312, 1, 1, 1, 1, 1,
0.7533091, 0.9669175, -1.516425, 1, 1, 1, 1, 1,
0.7533385, -0.4891654, 0.325633, 0, 0, 1, 1, 1,
0.7556058, 2.276287, 1.76245, 1, 0, 0, 1, 1,
0.7576639, 0.2168572, 0.4364713, 1, 0, 0, 1, 1,
0.7712803, -1.168523, 2.853151, 1, 0, 0, 1, 1,
0.7715267, -1.8624, 1.912189, 1, 0, 0, 1, 1,
0.7782353, -0.798675, 1.341073, 1, 0, 0, 1, 1,
0.7795275, 2.211594, 0.5462629, 0, 0, 0, 1, 1,
0.7883789, 0.3768983, -0.468207, 0, 0, 0, 1, 1,
0.791352, 1.073242, 1.643987, 0, 0, 0, 1, 1,
0.7941437, 0.8278829, 0.08047145, 0, 0, 0, 1, 1,
0.7968827, -0.463529, 3.563625, 0, 0, 0, 1, 1,
0.7981611, -0.7436624, 2.371239, 0, 0, 0, 1, 1,
0.7988385, 0.4605131, 0.9471614, 0, 0, 0, 1, 1,
0.8004527, 0.3745934, -0.01044725, 1, 1, 1, 1, 1,
0.8033357, -0.1325151, 2.148055, 1, 1, 1, 1, 1,
0.8040108, -0.7440189, 1.207695, 1, 1, 1, 1, 1,
0.8061827, 0.05491162, 1.68267, 1, 1, 1, 1, 1,
0.8064814, 0.09138568, 0.3627145, 1, 1, 1, 1, 1,
0.8079939, 0.4768386, -0.6139483, 1, 1, 1, 1, 1,
0.8097357, 1.632295, 0.5997118, 1, 1, 1, 1, 1,
0.8166071, 0.5062606, 2.440445, 1, 1, 1, 1, 1,
0.8173418, -1.219405, 2.08892, 1, 1, 1, 1, 1,
0.8187332, -1.707187, 0.966303, 1, 1, 1, 1, 1,
0.8258138, -0.5777409, 2.422427, 1, 1, 1, 1, 1,
0.8309644, 1.09604, 0.7434434, 1, 1, 1, 1, 1,
0.8398978, 0.05695917, 1.634307, 1, 1, 1, 1, 1,
0.8419221, 0.9193227, 1.167665, 1, 1, 1, 1, 1,
0.8434643, -0.6868163, 2.939797, 1, 1, 1, 1, 1,
0.8458889, -1.057203, 1.47065, 0, 0, 1, 1, 1,
0.8475869, -0.01824121, 0.6853189, 1, 0, 0, 1, 1,
0.8494899, -3.151824, 2.580407, 1, 0, 0, 1, 1,
0.8495054, -1.414971, 3.856017, 1, 0, 0, 1, 1,
0.8505955, -0.1646096, 1.843929, 1, 0, 0, 1, 1,
0.8517991, -1.233227, 4.15483, 1, 0, 0, 1, 1,
0.85191, -0.2656256, 2.810655, 0, 0, 0, 1, 1,
0.853827, -0.5163215, 1.84631, 0, 0, 0, 1, 1,
0.859363, -0.07328681, 1.34463, 0, 0, 0, 1, 1,
0.8601083, 0.4794472, 0.6226778, 0, 0, 0, 1, 1,
0.8604092, -0.5071018, 2.51816, 0, 0, 0, 1, 1,
0.8638501, -0.4303692, 3.779389, 0, 0, 0, 1, 1,
0.8652401, 0.7585762, 1.76654, 0, 0, 0, 1, 1,
0.8681819, -1.209913, 1.82382, 1, 1, 1, 1, 1,
0.8692911, -0.9556, 1.871917, 1, 1, 1, 1, 1,
0.870255, 0.3589214, 1.976218, 1, 1, 1, 1, 1,
0.8712055, -1.032158, 2.860428, 1, 1, 1, 1, 1,
0.8719842, 0.7615032, 1.440916, 1, 1, 1, 1, 1,
0.872235, -0.5433645, -0.2296033, 1, 1, 1, 1, 1,
0.8796805, -0.7151747, -1.434112, 1, 1, 1, 1, 1,
0.8867452, -1.025744, 1.49699, 1, 1, 1, 1, 1,
0.8926796, 1.688633, -0.105379, 1, 1, 1, 1, 1,
0.8965593, 0.600051, 2.047678, 1, 1, 1, 1, 1,
0.8980221, 1.20527, -0.367006, 1, 1, 1, 1, 1,
0.9041566, 1.475323, -0.2268049, 1, 1, 1, 1, 1,
0.9115857, -0.4462865, 2.04847, 1, 1, 1, 1, 1,
0.915896, 0.3484965, 1.392384, 1, 1, 1, 1, 1,
0.9162596, -0.7869629, 2.435911, 1, 1, 1, 1, 1,
0.9262925, -2.076181, 2.969977, 0, 0, 1, 1, 1,
0.9275235, -0.6844381, 2.690613, 1, 0, 0, 1, 1,
0.92923, -1.372833, 1.719424, 1, 0, 0, 1, 1,
0.930984, 1.492416, 1.500847, 1, 0, 0, 1, 1,
0.9318985, 0.2708585, 0.8328587, 1, 0, 0, 1, 1,
0.9338027, -1.005103, 1.822536, 1, 0, 0, 1, 1,
0.9356623, 2.549938, 0.1186392, 0, 0, 0, 1, 1,
0.9361178, 0.3523635, 2.428861, 0, 0, 0, 1, 1,
0.9385843, 0.05866713, 0.6005887, 0, 0, 0, 1, 1,
0.9419996, -0.1401723, 2.452562, 0, 0, 0, 1, 1,
0.9497619, -1.640559, 2.076485, 0, 0, 0, 1, 1,
0.951235, -1.701902, 2.609443, 0, 0, 0, 1, 1,
0.9585769, 0.7585058, 2.085013, 0, 0, 0, 1, 1,
0.9590273, -1.336794, 3.244294, 1, 1, 1, 1, 1,
0.9608454, -0.6979269, 1.751313, 1, 1, 1, 1, 1,
0.9632732, -0.3765577, 0.8435537, 1, 1, 1, 1, 1,
0.9748483, 1.065058, 0.6224114, 1, 1, 1, 1, 1,
0.974962, -0.1424069, 1.386024, 1, 1, 1, 1, 1,
0.9823814, 1.614352, 0.6193299, 1, 1, 1, 1, 1,
0.989554, 0.1057111, 1.327883, 1, 1, 1, 1, 1,
0.9943545, 0.4108559, 4.460436, 1, 1, 1, 1, 1,
1.005388, 0.2919591, 0.9789783, 1, 1, 1, 1, 1,
1.011267, 0.4150487, 1.636948, 1, 1, 1, 1, 1,
1.013692, 0.7449773, -0.5559759, 1, 1, 1, 1, 1,
1.016983, -0.4535405, 2.241687, 1, 1, 1, 1, 1,
1.017417, -0.4041137, 0.8347364, 1, 1, 1, 1, 1,
1.018539, 1.18066, 0.924296, 1, 1, 1, 1, 1,
1.021305, -0.7881685, 2.665447, 1, 1, 1, 1, 1,
1.021595, 2.013968, 0.2667202, 0, 0, 1, 1, 1,
1.022684, -0.8793901, 3.326104, 1, 0, 0, 1, 1,
1.02493, 0.8889222, 0.7935385, 1, 0, 0, 1, 1,
1.026431, -0.203952, 1.306814, 1, 0, 0, 1, 1,
1.040135, 0.2080739, 2.441102, 1, 0, 0, 1, 1,
1.053869, 0.006952028, 0.7752466, 1, 0, 0, 1, 1,
1.059672, -0.3193213, 1.303929, 0, 0, 0, 1, 1,
1.059832, 0.2417232, 1.991837, 0, 0, 0, 1, 1,
1.063344, -1.810198, 3.879005, 0, 0, 0, 1, 1,
1.064646, -0.171082, 2.134212, 0, 0, 0, 1, 1,
1.06474, -0.6836005, 1.253176, 0, 0, 0, 1, 1,
1.065254, 0.9838965, 0.1640799, 0, 0, 0, 1, 1,
1.06819, -0.3970403, 1.861258, 0, 0, 0, 1, 1,
1.068502, -0.2859472, 2.289365, 1, 1, 1, 1, 1,
1.071753, 0.1160141, 1.420223, 1, 1, 1, 1, 1,
1.074675, -0.7826943, 2.320048, 1, 1, 1, 1, 1,
1.082243, 1.044103, 0.9870201, 1, 1, 1, 1, 1,
1.090528, -2.877486, 3.425926, 1, 1, 1, 1, 1,
1.090622, -0.6307777, 1.761925, 1, 1, 1, 1, 1,
1.093024, -0.130046, 0.916641, 1, 1, 1, 1, 1,
1.097086, -0.9633748, 3.311972, 1, 1, 1, 1, 1,
1.101085, -0.2375601, 2.061068, 1, 1, 1, 1, 1,
1.10233, -0.7967054, 2.263766, 1, 1, 1, 1, 1,
1.109291, 1.323079, -0.00665699, 1, 1, 1, 1, 1,
1.112063, 0.09630752, 0.9810772, 1, 1, 1, 1, 1,
1.112963, -0.8949319, 2.737121, 1, 1, 1, 1, 1,
1.115635, -1.082448, 1.420308, 1, 1, 1, 1, 1,
1.116235, -1.486998, 0.6945487, 1, 1, 1, 1, 1,
1.11737, 1.285212, 0.7751251, 0, 0, 1, 1, 1,
1.119814, 0.5567281, 0.671872, 1, 0, 0, 1, 1,
1.119868, 1.336832, 1.767211, 1, 0, 0, 1, 1,
1.120478, 0.6158981, -0.6448662, 1, 0, 0, 1, 1,
1.122249, -1.339531, 2.100513, 1, 0, 0, 1, 1,
1.125914, -0.02250064, -0.5656946, 1, 0, 0, 1, 1,
1.12645, 0.6008466, -0.3305448, 0, 0, 0, 1, 1,
1.146896, 1.068739, 0.3407988, 0, 0, 0, 1, 1,
1.150478, 0.002423631, 1.238767, 0, 0, 0, 1, 1,
1.155535, -0.9758393, 3.112519, 0, 0, 0, 1, 1,
1.156359, -0.4764633, 2.755029, 0, 0, 0, 1, 1,
1.160705, -1.832576, 2.179688, 0, 0, 0, 1, 1,
1.16188, 0.6074699, 0.3192669, 0, 0, 0, 1, 1,
1.161894, 0.6433312, 0.8638009, 1, 1, 1, 1, 1,
1.164305, 2.070975, -0.1532379, 1, 1, 1, 1, 1,
1.173341, -0.2437299, 0.9951994, 1, 1, 1, 1, 1,
1.180876, -0.4823116, 2.099403, 1, 1, 1, 1, 1,
1.186478, -0.8499397, 1.600371, 1, 1, 1, 1, 1,
1.191903, -0.02610368, 0.5284343, 1, 1, 1, 1, 1,
1.194561, 0.3366453, 1.205842, 1, 1, 1, 1, 1,
1.214913, -0.4658305, 2.503262, 1, 1, 1, 1, 1,
1.216005, -0.5033635, 3.634073, 1, 1, 1, 1, 1,
1.216289, -1.668231, 2.539766, 1, 1, 1, 1, 1,
1.219322, 0.7918772, 1.910175, 1, 1, 1, 1, 1,
1.219793, 0.3408329, 1.194033, 1, 1, 1, 1, 1,
1.22024, 1.910761, 0.6172862, 1, 1, 1, 1, 1,
1.222108, 2.203532, 1.025426, 1, 1, 1, 1, 1,
1.228727, 1.636038, -0.09386314, 1, 1, 1, 1, 1,
1.22883, 1.162312, 2.861377, 0, 0, 1, 1, 1,
1.241438, 0.3567799, 0.03100413, 1, 0, 0, 1, 1,
1.25113, -1.305306, 3.64635, 1, 0, 0, 1, 1,
1.263043, -1.614672, 3.043319, 1, 0, 0, 1, 1,
1.269721, 0.5447031, 0.4432977, 1, 0, 0, 1, 1,
1.273299, -0.8885967, 2.872148, 1, 0, 0, 1, 1,
1.275134, 0.240678, 0.7933407, 0, 0, 0, 1, 1,
1.280131, -0.2412788, 1.855148, 0, 0, 0, 1, 1,
1.281951, -2.628682, 2.765624, 0, 0, 0, 1, 1,
1.283997, -0.2224903, 1.678628, 0, 0, 0, 1, 1,
1.284576, -1.060351, 2.490749, 0, 0, 0, 1, 1,
1.287526, 0.3047207, 1.383418, 0, 0, 0, 1, 1,
1.289666, -0.4022973, 1.983708, 0, 0, 0, 1, 1,
1.290647, 1.427338, 0.3005461, 1, 1, 1, 1, 1,
1.313349, 0.2527125, 0.9494269, 1, 1, 1, 1, 1,
1.318447, 0.4427911, 0.97521, 1, 1, 1, 1, 1,
1.322488, -0.1738858, 1.759162, 1, 1, 1, 1, 1,
1.338019, 0.2211789, 0.7557445, 1, 1, 1, 1, 1,
1.353855, -0.06024789, 2.303358, 1, 1, 1, 1, 1,
1.35402, 0.0516072, 0.6986839, 1, 1, 1, 1, 1,
1.359773, -1.09182, 2.562897, 1, 1, 1, 1, 1,
1.361622, 1.387063, -1.230983, 1, 1, 1, 1, 1,
1.368926, -0.166462, 1.989893, 1, 1, 1, 1, 1,
1.370521, -0.7053888, 1.502711, 1, 1, 1, 1, 1,
1.376818, -1.370803, 2.995267, 1, 1, 1, 1, 1,
1.383771, -0.6713672, 1.46823, 1, 1, 1, 1, 1,
1.420002, -1.47702, 2.927017, 1, 1, 1, 1, 1,
1.426204, -1.053456, 1.083552, 1, 1, 1, 1, 1,
1.44752, -0.6319662, 1.767048, 0, 0, 1, 1, 1,
1.447855, -0.07925495, 2.511225, 1, 0, 0, 1, 1,
1.451336, 2.271984, 1.931973, 1, 0, 0, 1, 1,
1.474849, 0.105496, 1.543024, 1, 0, 0, 1, 1,
1.480123, 0.7165801, 0.7987672, 1, 0, 0, 1, 1,
1.500776, -1.179203, 1.222609, 1, 0, 0, 1, 1,
1.502474, -1.26399, 2.865402, 0, 0, 0, 1, 1,
1.504127, 0.4692539, 1.502473, 0, 0, 0, 1, 1,
1.534506, -0.1187234, 0.2909143, 0, 0, 0, 1, 1,
1.537883, -0.05187791, 1.656035, 0, 0, 0, 1, 1,
1.538174, 0.3042607, 1.681516, 0, 0, 0, 1, 1,
1.547637, 0.2424401, 2.772798, 0, 0, 0, 1, 1,
1.551463, -0.05759768, 0.05501856, 0, 0, 0, 1, 1,
1.554249, -0.9800395, 4.010818, 1, 1, 1, 1, 1,
1.560425, -0.3129933, 1.699527, 1, 1, 1, 1, 1,
1.577274, 0.1384618, 2.573478, 1, 1, 1, 1, 1,
1.592915, 0.04718504, 2.986516, 1, 1, 1, 1, 1,
1.621114, 0.2178814, 2.726229, 1, 1, 1, 1, 1,
1.63741, 0.8006161, 1.469594, 1, 1, 1, 1, 1,
1.64187, -0.6217825, 3.404279, 1, 1, 1, 1, 1,
1.684407, -0.1421509, 2.837063, 1, 1, 1, 1, 1,
1.685443, -2.325649, 0.7015445, 1, 1, 1, 1, 1,
1.686126, -2.147972, 2.488629, 1, 1, 1, 1, 1,
1.752462, -0.1473094, 1.849258, 1, 1, 1, 1, 1,
1.760771, 0.5518889, 1.628695, 1, 1, 1, 1, 1,
1.765786, 1.172868, 0.3816683, 1, 1, 1, 1, 1,
1.7733, 0.03708749, 2.609587, 1, 1, 1, 1, 1,
1.789828, 0.8207607, 0.1305272, 1, 1, 1, 1, 1,
1.796361, 1.625519, -0.7996585, 0, 0, 1, 1, 1,
1.799675, -0.2389183, 2.851417, 1, 0, 0, 1, 1,
1.800941, 1.424991, 2.293759, 1, 0, 0, 1, 1,
1.817384, 1.834525, 1.241416, 1, 0, 0, 1, 1,
1.848514, 1.060777, 2.941187, 1, 0, 0, 1, 1,
1.850255, -1.633857, 0.8811308, 1, 0, 0, 1, 1,
1.855217, 1.107019, 0.3422903, 0, 0, 0, 1, 1,
1.880675, -0.08405691, 1.005353, 0, 0, 0, 1, 1,
1.880754, 1.226458, -0.08216718, 0, 0, 0, 1, 1,
1.881526, 0.8576441, 2.310571, 0, 0, 0, 1, 1,
1.896717, 0.4865364, 2.489319, 0, 0, 0, 1, 1,
1.9, -0.9498389, 1.370166, 0, 0, 0, 1, 1,
1.923949, 1.215532, 1.444951, 0, 0, 0, 1, 1,
1.936677, -0.2249959, 0.9405567, 1, 1, 1, 1, 1,
1.942779, 1.004305, 2.174949, 1, 1, 1, 1, 1,
1.944741, -0.6498175, 1.642891, 1, 1, 1, 1, 1,
1.949166, 1.311192, 0.6069147, 1, 1, 1, 1, 1,
1.954449, 0.2930412, 1.892181, 1, 1, 1, 1, 1,
1.95463, -1.275939, 2.203012, 1, 1, 1, 1, 1,
1.99458, -1.655713, 1.385677, 1, 1, 1, 1, 1,
1.996071, -1.821569, 2.774776, 1, 1, 1, 1, 1,
2.002181, 0.2414027, 4.023416, 1, 1, 1, 1, 1,
2.018736, 1.540887, 0.662128, 1, 1, 1, 1, 1,
2.025483, -2.144359, 3.7162, 1, 1, 1, 1, 1,
2.027273, -0.7139438, 1.06936, 1, 1, 1, 1, 1,
2.031836, -0.1357092, -0.08588737, 1, 1, 1, 1, 1,
2.037343, 1.671584, 1.065672, 1, 1, 1, 1, 1,
2.044151, -0.836594, 1.471955, 1, 1, 1, 1, 1,
2.048872, -0.8851784, 2.884802, 0, 0, 1, 1, 1,
2.107629, 0.3227485, 0.5260267, 1, 0, 0, 1, 1,
2.117092, 0.2475067, 2.15966, 1, 0, 0, 1, 1,
2.129104, 0.4222564, 1.515374, 1, 0, 0, 1, 1,
2.149241, 0.3212178, -0.215605, 1, 0, 0, 1, 1,
2.170954, 1.443463, 0.6058277, 1, 0, 0, 1, 1,
2.188685, 0.1259263, 0.2711681, 0, 0, 0, 1, 1,
2.190681, 0.9742618, 2.105801, 0, 0, 0, 1, 1,
2.280006, -0.1159423, 2.477102, 0, 0, 0, 1, 1,
2.291606, 0.9589717, 2.97455, 0, 0, 0, 1, 1,
2.358721, 0.3439535, 2.515439, 0, 0, 0, 1, 1,
2.365901, -1.19532, 3.787297, 0, 0, 0, 1, 1,
2.449047, -0.4604335, -0.1796187, 0, 0, 0, 1, 1,
2.505074, -0.4588546, 0.5207257, 1, 1, 1, 1, 1,
2.508126, -0.4829566, 1.790854, 1, 1, 1, 1, 1,
2.509999, -0.6677542, 2.030824, 1, 1, 1, 1, 1,
2.5466, -0.2224497, 1.442398, 1, 1, 1, 1, 1,
2.563859, -1.043334, 2.063629, 1, 1, 1, 1, 1,
2.78594, 0.6336702, -0.09317867, 1, 1, 1, 1, 1,
3.444711, 0.2149917, 2.382074, 1, 1, 1, 1, 1
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
var radius = 9.741936;
var distance = 34.21814;
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
mvMatrix.translate( -0.1744249, 0.2657198, -0.3295991 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.21814);
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
