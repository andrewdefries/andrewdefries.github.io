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
-3.224939, 0.5519864, -2.005232, 1, 0, 0, 1,
-3.096817, 0.4202747, -1.310676, 1, 0.007843138, 0, 1,
-3.059668, 0.5403387, -2.309639, 1, 0.01176471, 0, 1,
-2.710175, 0.5194635, -0.3467721, 1, 0.01960784, 0, 1,
-2.5981, -0.09335858, -2.622558, 1, 0.02352941, 0, 1,
-2.577882, 1.36564, -0.336435, 1, 0.03137255, 0, 1,
-2.43157, -1.671412, -1.779252, 1, 0.03529412, 0, 1,
-2.40157, 0.6598191, -0.6511022, 1, 0.04313726, 0, 1,
-2.401425, 0.2465189, -2.065867, 1, 0.04705882, 0, 1,
-2.337188, 0.7621915, -0.7024515, 1, 0.05490196, 0, 1,
-2.250282, 1.70014, -1.433972, 1, 0.05882353, 0, 1,
-2.237109, -1.115536, 0.2437912, 1, 0.06666667, 0, 1,
-2.176642, -0.7372612, -2.897294, 1, 0.07058824, 0, 1,
-2.160756, 1.644038, -0.1765382, 1, 0.07843138, 0, 1,
-2.157385, -0.8938586, -1.886119, 1, 0.08235294, 0, 1,
-2.154152, -1.629246, -3.985185, 1, 0.09019608, 0, 1,
-2.137672, -1.317872, -3.186719, 1, 0.09411765, 0, 1,
-2.044706, -1.714141, -4.432929, 1, 0.1019608, 0, 1,
-1.984784, -1.032918, -2.362115, 1, 0.1098039, 0, 1,
-1.974942, -0.8981248, -2.921326, 1, 0.1137255, 0, 1,
-1.956993, -1.352808, -1.437716, 1, 0.1215686, 0, 1,
-1.953556, 0.8806959, -2.954321, 1, 0.1254902, 0, 1,
-1.904575, -0.8016006, -0.7957507, 1, 0.1333333, 0, 1,
-1.898542, 0.3797615, -1.104678, 1, 0.1372549, 0, 1,
-1.862789, 0.0005570469, -2.504829, 1, 0.145098, 0, 1,
-1.853438, -0.4466905, -2.513332, 1, 0.1490196, 0, 1,
-1.847027, 0.1059446, -0.4055598, 1, 0.1568628, 0, 1,
-1.826205, -0.2768525, -3.347988, 1, 0.1607843, 0, 1,
-1.811401, -1.441426, -2.622905, 1, 0.1686275, 0, 1,
-1.797479, -1.464165, -1.726251, 1, 0.172549, 0, 1,
-1.789515, 0.5287035, -2.816372, 1, 0.1803922, 0, 1,
-1.782531, -1.51462, -2.068613, 1, 0.1843137, 0, 1,
-1.76711, -2.112402, -3.479797, 1, 0.1921569, 0, 1,
-1.762476, 0.1462168, -1.866685, 1, 0.1960784, 0, 1,
-1.761475, -0.354254, -3.624479, 1, 0.2039216, 0, 1,
-1.748348, 1.454628, -2.470269, 1, 0.2117647, 0, 1,
-1.728921, 1.327046, -0.7546694, 1, 0.2156863, 0, 1,
-1.72113, -0.8465615, -1.814898, 1, 0.2235294, 0, 1,
-1.696994, 0.4228695, -1.737778, 1, 0.227451, 0, 1,
-1.690803, -1.368444, -3.977346, 1, 0.2352941, 0, 1,
-1.690391, 2.050965, -0.01377057, 1, 0.2392157, 0, 1,
-1.69005, -0.3233793, -2.220273, 1, 0.2470588, 0, 1,
-1.689924, 0.08317335, -0.6891775, 1, 0.2509804, 0, 1,
-1.68688, -0.1056571, -0.7347323, 1, 0.2588235, 0, 1,
-1.675645, -0.2138473, -1.579674, 1, 0.2627451, 0, 1,
-1.66204, 2.162876, 1.134519, 1, 0.2705882, 0, 1,
-1.65393, -2.075951, -3.90924, 1, 0.2745098, 0, 1,
-1.643378, 0.8044237, -1.817204, 1, 0.282353, 0, 1,
-1.642941, -1.370248, -1.620272, 1, 0.2862745, 0, 1,
-1.64152, 0.2504555, -2.818543, 1, 0.2941177, 0, 1,
-1.611655, -1.409791, -2.460326, 1, 0.3019608, 0, 1,
-1.600194, -0.8441788, -2.078968, 1, 0.3058824, 0, 1,
-1.589014, -0.008649956, -3.339685, 1, 0.3137255, 0, 1,
-1.565019, -0.5929526, -3.014287, 1, 0.3176471, 0, 1,
-1.510494, -0.5602607, -1.859427, 1, 0.3254902, 0, 1,
-1.508814, 0.9665135, -1.098021, 1, 0.3294118, 0, 1,
-1.505388, -0.01920208, -0.8403718, 1, 0.3372549, 0, 1,
-1.495244, 1.40958, -0.9509307, 1, 0.3411765, 0, 1,
-1.487571, -0.02194716, -2.965557, 1, 0.3490196, 0, 1,
-1.484041, -1.07515, -3.118245, 1, 0.3529412, 0, 1,
-1.478476, -0.4512345, -2.265908, 1, 0.3607843, 0, 1,
-1.477232, 0.2543775, -2.568746, 1, 0.3647059, 0, 1,
-1.476282, 0.9629579, 0.4772415, 1, 0.372549, 0, 1,
-1.467832, -0.8622547, -2.571258, 1, 0.3764706, 0, 1,
-1.452357, -0.5159547, -1.212298, 1, 0.3843137, 0, 1,
-1.447583, 0.7837979, -0.1292475, 1, 0.3882353, 0, 1,
-1.438722, 0.5375198, -2.696006, 1, 0.3960784, 0, 1,
-1.438408, 0.3580692, -1.66215, 1, 0.4039216, 0, 1,
-1.435207, 0.6883383, -1.453388, 1, 0.4078431, 0, 1,
-1.431182, -1.446795, -2.598025, 1, 0.4156863, 0, 1,
-1.428913, 0.3548527, -1.653464, 1, 0.4196078, 0, 1,
-1.421153, -0.6380105, -3.00755, 1, 0.427451, 0, 1,
-1.417222, 0.8594784, -0.8080407, 1, 0.4313726, 0, 1,
-1.412725, 0.526112, -0.348671, 1, 0.4392157, 0, 1,
-1.394034, -0.2677776, -1.117432, 1, 0.4431373, 0, 1,
-1.38379, 1.001021, -1.357449, 1, 0.4509804, 0, 1,
-1.379808, 0.2343013, -3.924198, 1, 0.454902, 0, 1,
-1.379069, -0.4124302, -1.898569, 1, 0.4627451, 0, 1,
-1.37012, 0.08371498, -0.9460846, 1, 0.4666667, 0, 1,
-1.368694, -0.9556619, -1.491005, 1, 0.4745098, 0, 1,
-1.351018, -1.151486, -0.4950985, 1, 0.4784314, 0, 1,
-1.348421, 1.77287, -0.8368478, 1, 0.4862745, 0, 1,
-1.343799, -0.6899816, -2.334763, 1, 0.4901961, 0, 1,
-1.339464, -0.1134473, -0.9057836, 1, 0.4980392, 0, 1,
-1.339173, -0.4013667, -1.016323, 1, 0.5058824, 0, 1,
-1.33744, -0.3856334, -2.317554, 1, 0.509804, 0, 1,
-1.329822, 0.3770642, 0.8763985, 1, 0.5176471, 0, 1,
-1.320216, -0.08451831, -3.053385, 1, 0.5215687, 0, 1,
-1.312822, -0.1829651, -3.445698, 1, 0.5294118, 0, 1,
-1.308573, -1.434615, -0.3509192, 1, 0.5333334, 0, 1,
-1.307773, 0.6865653, -1.094925, 1, 0.5411765, 0, 1,
-1.291888, -0.2706549, -2.685509, 1, 0.5450981, 0, 1,
-1.288396, 0.6486861, 0.01782941, 1, 0.5529412, 0, 1,
-1.283908, 0.5803446, -1.875536, 1, 0.5568628, 0, 1,
-1.270446, -1.310761, -4.756729, 1, 0.5647059, 0, 1,
-1.260044, 0.3560474, -0.5479744, 1, 0.5686275, 0, 1,
-1.246483, -0.1235902, -6.048228, 1, 0.5764706, 0, 1,
-1.240048, 0.8163946, -1.280123, 1, 0.5803922, 0, 1,
-1.235492, 0.268126, -1.745436, 1, 0.5882353, 0, 1,
-1.234142, -0.599541, -1.028522, 1, 0.5921569, 0, 1,
-1.231836, -0.2597958, 0.712818, 1, 0.6, 0, 1,
-1.231791, 2.139734, -1.960136, 1, 0.6078432, 0, 1,
-1.22628, -0.1383675, -1.917171, 1, 0.6117647, 0, 1,
-1.226161, -0.1001085, -1.613173, 1, 0.6196079, 0, 1,
-1.225269, -0.9331018, -3.415611, 1, 0.6235294, 0, 1,
-1.222914, -0.9758533, -2.268186, 1, 0.6313726, 0, 1,
-1.215265, 1.738139, -1.535917, 1, 0.6352941, 0, 1,
-1.213123, -0.7037396, -2.5295, 1, 0.6431373, 0, 1,
-1.212822, -0.4759333, -3.642436, 1, 0.6470588, 0, 1,
-1.201852, 1.087765, 0.05001749, 1, 0.654902, 0, 1,
-1.201847, -0.8298756, -2.298038, 1, 0.6588235, 0, 1,
-1.197694, -0.05940766, -2.510484, 1, 0.6666667, 0, 1,
-1.196449, 1.513854, -0.8887224, 1, 0.6705883, 0, 1,
-1.196174, -0.1551163, -0.3562725, 1, 0.6784314, 0, 1,
-1.192687, 1.664454, -1.283085, 1, 0.682353, 0, 1,
-1.19185, 1.216956, -0.270122, 1, 0.6901961, 0, 1,
-1.191709, 1.948664, 0.3734363, 1, 0.6941177, 0, 1,
-1.189776, 1.338711, 0.558655, 1, 0.7019608, 0, 1,
-1.166259, 0.4456587, -1.78134, 1, 0.7098039, 0, 1,
-1.16094, -0.1158912, -2.81553, 1, 0.7137255, 0, 1,
-1.159315, -1.311486, -2.998927, 1, 0.7215686, 0, 1,
-1.158297, 1.744882, -1.03601, 1, 0.7254902, 0, 1,
-1.151814, -1.221516, -2.080997, 1, 0.7333333, 0, 1,
-1.136403, 0.9547799, -0.9622997, 1, 0.7372549, 0, 1,
-1.129194, 1.233376, -0.9148201, 1, 0.7450981, 0, 1,
-1.125688, -0.1665209, -0.08137503, 1, 0.7490196, 0, 1,
-1.09781, 1.000537, -1.176368, 1, 0.7568628, 0, 1,
-1.088476, 1.019826, 0.5769197, 1, 0.7607843, 0, 1,
-1.086105, 1.296301, -0.3685719, 1, 0.7686275, 0, 1,
-1.085037, -0.07042211, -0.2198909, 1, 0.772549, 0, 1,
-1.076676, 1.54629, -2.840333, 1, 0.7803922, 0, 1,
-1.075601, -0.8341181, -3.079668, 1, 0.7843137, 0, 1,
-1.06937, 0.8492416, -2.014862, 1, 0.7921569, 0, 1,
-1.067386, -1.950929, -1.49183, 1, 0.7960784, 0, 1,
-1.054142, 1.134781, -0.08607909, 1, 0.8039216, 0, 1,
-1.047125, -0.1738923, -3.108794, 1, 0.8117647, 0, 1,
-1.045984, 0.8153251, -0.6926522, 1, 0.8156863, 0, 1,
-1.045741, -0.8315886, -1.229537, 1, 0.8235294, 0, 1,
-1.044393, -0.4412232, -0.8911834, 1, 0.827451, 0, 1,
-1.035315, 0.516806, 0.4539607, 1, 0.8352941, 0, 1,
-1.035094, 0.7152945, -0.7970676, 1, 0.8392157, 0, 1,
-1.030754, -0.6995568, -1.59781, 1, 0.8470588, 0, 1,
-1.029931, 1.106309, 0.1507071, 1, 0.8509804, 0, 1,
-1.027516, -0.7617356, -1.86988, 1, 0.8588235, 0, 1,
-1.019657, -0.3130243, -2.145643, 1, 0.8627451, 0, 1,
-1.019641, 0.9120152, -0.7268313, 1, 0.8705882, 0, 1,
-1.010001, 0.3548322, -1.541973, 1, 0.8745098, 0, 1,
-1.008952, 1.450891, -0.8128803, 1, 0.8823529, 0, 1,
-1.004503, 0.7006854, -1.984417, 1, 0.8862745, 0, 1,
-1.001584, 1.765035, -1.34437, 1, 0.8941177, 0, 1,
-1.000594, 0.94621, 0.6413613, 1, 0.8980392, 0, 1,
-0.9927922, 0.1731194, -2.174284, 1, 0.9058824, 0, 1,
-0.9919465, -2.09361, -2.7984, 1, 0.9137255, 0, 1,
-0.9915056, -0.1713684, -1.496494, 1, 0.9176471, 0, 1,
-0.9848654, 1.687481, -2.652841, 1, 0.9254902, 0, 1,
-0.9793327, 0.9809753, -2.231682, 1, 0.9294118, 0, 1,
-0.9790821, -1.818201, -1.699923, 1, 0.9372549, 0, 1,
-0.9657772, -0.6956761, -1.733293, 1, 0.9411765, 0, 1,
-0.9654016, -0.7688829, -4.201273, 1, 0.9490196, 0, 1,
-0.9652379, -0.4092597, -3.225613, 1, 0.9529412, 0, 1,
-0.953806, 0.7648099, -0.4384717, 1, 0.9607843, 0, 1,
-0.9527985, -0.21763, -0.1613113, 1, 0.9647059, 0, 1,
-0.9502136, 0.7545457, -1.435791, 1, 0.972549, 0, 1,
-0.9436811, 0.3977118, -2.028657, 1, 0.9764706, 0, 1,
-0.9390881, -1.118539, -0.4943548, 1, 0.9843137, 0, 1,
-0.9327103, -0.5374367, -1.926398, 1, 0.9882353, 0, 1,
-0.9288844, -0.9910641, -1.399546, 1, 0.9960784, 0, 1,
-0.9185886, -1.508611, -3.583839, 0.9960784, 1, 0, 1,
-0.9130867, 1.049349, 0.1883602, 0.9921569, 1, 0, 1,
-0.9130214, 0.8989981, -1.638548, 0.9843137, 1, 0, 1,
-0.9087285, 1.697463, -0.148882, 0.9803922, 1, 0, 1,
-0.9072374, -1.206712, -1.441975, 0.972549, 1, 0, 1,
-0.9025067, -0.1449864, -2.516487, 0.9686275, 1, 0, 1,
-0.9015378, 0.1982561, -1.36768, 0.9607843, 1, 0, 1,
-0.8971202, -0.8361326, -2.154961, 0.9568627, 1, 0, 1,
-0.8904203, -0.6242278, -3.083981, 0.9490196, 1, 0, 1,
-0.8853257, 0.7317318, -0.5981471, 0.945098, 1, 0, 1,
-0.8841516, 2.016968, -0.6902143, 0.9372549, 1, 0, 1,
-0.8681714, 1.796961, -1.054783, 0.9333333, 1, 0, 1,
-0.8652606, 0.1712531, -0.8250293, 0.9254902, 1, 0, 1,
-0.8620067, -0.2261538, -1.931792, 0.9215686, 1, 0, 1,
-0.8588334, -0.200535, -0.04676726, 0.9137255, 1, 0, 1,
-0.8573421, -0.4661456, -0.5617601, 0.9098039, 1, 0, 1,
-0.8556693, -3.081574, -3.005692, 0.9019608, 1, 0, 1,
-0.8544732, -0.6691823, -2.764221, 0.8941177, 1, 0, 1,
-0.8480566, -0.07264324, -0.7192065, 0.8901961, 1, 0, 1,
-0.8447903, -0.3054338, -2.511109, 0.8823529, 1, 0, 1,
-0.8384203, -0.1403182, -1.940282, 0.8784314, 1, 0, 1,
-0.8350343, -0.04258449, -2.463297, 0.8705882, 1, 0, 1,
-0.8344535, 0.08194803, -0.2915877, 0.8666667, 1, 0, 1,
-0.8302448, -1.598269, -2.779302, 0.8588235, 1, 0, 1,
-0.8298253, -0.2551209, -0.4186875, 0.854902, 1, 0, 1,
-0.8262882, 0.05538663, 0.05343303, 0.8470588, 1, 0, 1,
-0.8261638, -1.418128, -3.44982, 0.8431373, 1, 0, 1,
-0.8210624, -0.2069923, -1.806219, 0.8352941, 1, 0, 1,
-0.8209189, -1.585054, -1.764729, 0.8313726, 1, 0, 1,
-0.8208429, -0.2846753, -2.140209, 0.8235294, 1, 0, 1,
-0.8157476, -0.7003654, -2.489057, 0.8196079, 1, 0, 1,
-0.8149086, 0.3789344, 0.8186604, 0.8117647, 1, 0, 1,
-0.8066725, 0.6630533, -1.949592, 0.8078431, 1, 0, 1,
-0.7952292, 1.474252, 0.5525146, 0.8, 1, 0, 1,
-0.7949044, -2.079093, -2.832641, 0.7921569, 1, 0, 1,
-0.7936113, 1.059958, -1.458222, 0.7882353, 1, 0, 1,
-0.7878309, 0.1555557, -0.3845139, 0.7803922, 1, 0, 1,
-0.7833903, 1.216235, 0.2362557, 0.7764706, 1, 0, 1,
-0.782604, -0.147196, -1.794999, 0.7686275, 1, 0, 1,
-0.7807834, -0.4695393, -3.569945, 0.7647059, 1, 0, 1,
-0.7768763, -0.3127371, -2.90455, 0.7568628, 1, 0, 1,
-0.7657302, 1.14257, 0.4472105, 0.7529412, 1, 0, 1,
-0.7607762, 1.218015, -1.443919, 0.7450981, 1, 0, 1,
-0.7473514, -0.1281999, -0.5966499, 0.7411765, 1, 0, 1,
-0.7439259, 0.7976781, -0.1828181, 0.7333333, 1, 0, 1,
-0.7431941, -0.1195399, -1.03191, 0.7294118, 1, 0, 1,
-0.7420518, 0.2587755, -1.440318, 0.7215686, 1, 0, 1,
-0.7405158, 1.077176, -0.3430048, 0.7176471, 1, 0, 1,
-0.7398051, 1.675257, -1.534256, 0.7098039, 1, 0, 1,
-0.7394952, 0.7648619, 0.6632016, 0.7058824, 1, 0, 1,
-0.7376046, 0.1260496, 0.1923161, 0.6980392, 1, 0, 1,
-0.7362468, -0.4229225, -2.731, 0.6901961, 1, 0, 1,
-0.7271718, -0.1146794, -3.809873, 0.6862745, 1, 0, 1,
-0.7264317, 0.5704306, -2.684073, 0.6784314, 1, 0, 1,
-0.7186514, -1.899598, -3.705682, 0.6745098, 1, 0, 1,
-0.7136526, 0.2004046, -2.588449, 0.6666667, 1, 0, 1,
-0.7084958, -1.506391, -0.6427897, 0.6627451, 1, 0, 1,
-0.7015021, -0.1797788, -1.983279, 0.654902, 1, 0, 1,
-0.700148, -1.010117, -2.321773, 0.6509804, 1, 0, 1,
-0.6984198, 1.784138, -0.8464901, 0.6431373, 1, 0, 1,
-0.6980825, -0.5689918, -0.0896832, 0.6392157, 1, 0, 1,
-0.6930866, -1.087236, -3.049045, 0.6313726, 1, 0, 1,
-0.6894789, 0.03763373, -0.2651714, 0.627451, 1, 0, 1,
-0.6885654, 0.07790939, -0.7364047, 0.6196079, 1, 0, 1,
-0.6837869, 1.30675, 1.183261, 0.6156863, 1, 0, 1,
-0.6815091, -0.6758461, -2.617094, 0.6078432, 1, 0, 1,
-0.6739306, -0.5236326, -1.019941, 0.6039216, 1, 0, 1,
-0.6733114, -2.8501, -0.8128468, 0.5960785, 1, 0, 1,
-0.6688635, -2.908741, -4.538281, 0.5882353, 1, 0, 1,
-0.6671138, 0.4339133, -2.240104, 0.5843138, 1, 0, 1,
-0.6650931, -0.350596, -1.588933, 0.5764706, 1, 0, 1,
-0.6606897, -1.467896, -2.465865, 0.572549, 1, 0, 1,
-0.660051, 2.371962, -0.4401852, 0.5647059, 1, 0, 1,
-0.6570122, -0.4310194, -3.708748, 0.5607843, 1, 0, 1,
-0.651619, -0.3803117, -0.6073785, 0.5529412, 1, 0, 1,
-0.6497263, -0.6343801, -2.114646, 0.5490196, 1, 0, 1,
-0.6472175, 0.8416371, -0.8288205, 0.5411765, 1, 0, 1,
-0.6464927, -1.430929, -3.513492, 0.5372549, 1, 0, 1,
-0.6421875, -0.7026673, -1.377934, 0.5294118, 1, 0, 1,
-0.6382813, 0.03205456, -1.193171, 0.5254902, 1, 0, 1,
-0.6372808, -1.211277, -2.457045, 0.5176471, 1, 0, 1,
-0.6350378, -1.432042, -3.740641, 0.5137255, 1, 0, 1,
-0.6341078, -1.559674, -2.343278, 0.5058824, 1, 0, 1,
-0.6339654, 3.359461, 1.619823, 0.5019608, 1, 0, 1,
-0.6311043, 0.02853439, -1.282568, 0.4941176, 1, 0, 1,
-0.6302857, -0.8433905, -2.514788, 0.4862745, 1, 0, 1,
-0.6220298, 1.348518, -1.075611, 0.4823529, 1, 0, 1,
-0.6184006, -1.867267, -3.811078, 0.4745098, 1, 0, 1,
-0.6166648, -0.5764409, -1.764163, 0.4705882, 1, 0, 1,
-0.6129557, 0.292972, -2.964578, 0.4627451, 1, 0, 1,
-0.6107106, -0.6950506, -4.740339, 0.4588235, 1, 0, 1,
-0.6069255, 0.5484912, -0.7006998, 0.4509804, 1, 0, 1,
-0.6060922, 1.572382, -0.5095488, 0.4470588, 1, 0, 1,
-0.6026219, 0.5856361, -1.775814, 0.4392157, 1, 0, 1,
-0.6001837, 1.61602, -2.741507, 0.4352941, 1, 0, 1,
-0.5994864, -0.8788707, -2.640362, 0.427451, 1, 0, 1,
-0.5968989, -0.9504828, -1.556267, 0.4235294, 1, 0, 1,
-0.5950688, 0.5405264, -2.381637, 0.4156863, 1, 0, 1,
-0.5933643, 0.9947717, -0.7375246, 0.4117647, 1, 0, 1,
-0.5900911, 0.6515869, 0.8994655, 0.4039216, 1, 0, 1,
-0.5899778, -0.3190409, -2.811132, 0.3960784, 1, 0, 1,
-0.582168, 0.07819041, -2.18511, 0.3921569, 1, 0, 1,
-0.5777848, -0.194496, -2.04784, 0.3843137, 1, 0, 1,
-0.5764573, -0.3953722, -2.381256, 0.3803922, 1, 0, 1,
-0.5729104, -0.551776, -2.660711, 0.372549, 1, 0, 1,
-0.5723338, -1.101053, -2.910491, 0.3686275, 1, 0, 1,
-0.5679699, -0.1765929, -1.856189, 0.3607843, 1, 0, 1,
-0.567714, -0.3641238, -0.7288485, 0.3568628, 1, 0, 1,
-0.5672163, 0.07182956, -0.9908359, 0.3490196, 1, 0, 1,
-0.5667453, -0.4570923, -3.532537, 0.345098, 1, 0, 1,
-0.559298, -0.8405033, -3.445331, 0.3372549, 1, 0, 1,
-0.5592699, -0.4380097, -2.339229, 0.3333333, 1, 0, 1,
-0.5575238, 1.162652, -0.9221625, 0.3254902, 1, 0, 1,
-0.5550756, -0.03854778, -0.7433845, 0.3215686, 1, 0, 1,
-0.5546373, -0.4613453, -1.665862, 0.3137255, 1, 0, 1,
-0.5529832, -1.115386, -2.086254, 0.3098039, 1, 0, 1,
-0.5496751, 0.3406718, -0.2909227, 0.3019608, 1, 0, 1,
-0.5485162, 1.605281, -0.6011371, 0.2941177, 1, 0, 1,
-0.5423084, 0.8817796, -0.634903, 0.2901961, 1, 0, 1,
-0.5383454, -0.4644595, -2.902924, 0.282353, 1, 0, 1,
-0.5358584, -1.663649, -3.272224, 0.2784314, 1, 0, 1,
-0.5344111, -0.4666739, -0.8874792, 0.2705882, 1, 0, 1,
-0.5323064, 0.6902174, 0.1859156, 0.2666667, 1, 0, 1,
-0.5189534, -0.1571676, -2.535147, 0.2588235, 1, 0, 1,
-0.5176534, 0.4992476, -0.2018953, 0.254902, 1, 0, 1,
-0.5145212, -0.4954175, -1.630346, 0.2470588, 1, 0, 1,
-0.5113735, 0.1201383, -1.207338, 0.2431373, 1, 0, 1,
-0.5097133, -0.6648372, -1.913152, 0.2352941, 1, 0, 1,
-0.5083875, -0.9908307, -4.608561, 0.2313726, 1, 0, 1,
-0.5033328, -2.130206, -4.932323, 0.2235294, 1, 0, 1,
-0.5003625, 1.025276, -1.873179, 0.2196078, 1, 0, 1,
-0.5002396, -0.9462295, -3.185902, 0.2117647, 1, 0, 1,
-0.4986889, -0.5971667, -5.011502, 0.2078431, 1, 0, 1,
-0.4966538, 0.6910976, -1.087821, 0.2, 1, 0, 1,
-0.4858316, -1.541571, -3.226914, 0.1921569, 1, 0, 1,
-0.485643, 1.272955, 1.560129, 0.1882353, 1, 0, 1,
-0.48144, 0.7987868, 0.4285669, 0.1803922, 1, 0, 1,
-0.4790779, -0.6175584, -1.303152, 0.1764706, 1, 0, 1,
-0.477575, -0.3910281, -3.18878, 0.1686275, 1, 0, 1,
-0.4769732, -2.05796, -0.9131358, 0.1647059, 1, 0, 1,
-0.4752777, -0.2455465, -1.85112, 0.1568628, 1, 0, 1,
-0.4723106, -0.01261982, -1.859154, 0.1529412, 1, 0, 1,
-0.4713615, 0.7365143, -1.388235, 0.145098, 1, 0, 1,
-0.4657096, 0.7856458, -0.9033421, 0.1411765, 1, 0, 1,
-0.4615621, 1.262156, -2.166257, 0.1333333, 1, 0, 1,
-0.4582235, 1.465562, -1.563166, 0.1294118, 1, 0, 1,
-0.4565344, 1.142003, -1.583272, 0.1215686, 1, 0, 1,
-0.456017, 0.1061271, -2.264184, 0.1176471, 1, 0, 1,
-0.4501583, 0.5762029, 0.003324187, 0.1098039, 1, 0, 1,
-0.4448579, 0.3379744, -0.7348191, 0.1058824, 1, 0, 1,
-0.4435149, 0.06587742, -3.133654, 0.09803922, 1, 0, 1,
-0.4422927, 0.9381062, -0.3178722, 0.09019608, 1, 0, 1,
-0.440246, 0.9569326, -0.9511591, 0.08627451, 1, 0, 1,
-0.4384404, -0.270502, -3.213822, 0.07843138, 1, 0, 1,
-0.4286128, 0.1717656, -0.003877258, 0.07450981, 1, 0, 1,
-0.4278101, -1.039545, -3.647864, 0.06666667, 1, 0, 1,
-0.4262455, 0.3633114, -0.9204468, 0.0627451, 1, 0, 1,
-0.4256749, -0.4218035, -1.670743, 0.05490196, 1, 0, 1,
-0.4207334, -0.9501564, -0.8238453, 0.05098039, 1, 0, 1,
-0.4137754, 0.5626167, -0.9810494, 0.04313726, 1, 0, 1,
-0.4128428, -1.302381, -1.716799, 0.03921569, 1, 0, 1,
-0.4121411, 0.5270707, -0.4528836, 0.03137255, 1, 0, 1,
-0.4119134, -0.8564878, -1.774169, 0.02745098, 1, 0, 1,
-0.4066104, -1.234351, -2.911396, 0.01960784, 1, 0, 1,
-0.4055716, 0.6668829, -1.107282, 0.01568628, 1, 0, 1,
-0.4022838, 0.42818, -0.6900862, 0.007843138, 1, 0, 1,
-0.3886353, 1.10455, -1.078872, 0.003921569, 1, 0, 1,
-0.386531, 0.1742611, -1.613366, 0, 1, 0.003921569, 1,
-0.3822778, -2.392207, -2.727518, 0, 1, 0.01176471, 1,
-0.3790486, -1.757572, -2.660671, 0, 1, 0.01568628, 1,
-0.3763035, 0.1639845, -1.693345, 0, 1, 0.02352941, 1,
-0.3735293, -1.653138, -1.389464, 0, 1, 0.02745098, 1,
-0.3727867, -0.8452441, -3.040054, 0, 1, 0.03529412, 1,
-0.3722911, 0.6915747, -1.941832, 0, 1, 0.03921569, 1,
-0.3714157, -1.043911, -2.220338, 0, 1, 0.04705882, 1,
-0.3709992, 0.2336099, -0.5317229, 0, 1, 0.05098039, 1,
-0.3669754, -1.308804, -2.270726, 0, 1, 0.05882353, 1,
-0.366114, 1.269176, -0.4641349, 0, 1, 0.0627451, 1,
-0.3644343, -1.694016, -0.5679416, 0, 1, 0.07058824, 1,
-0.3632169, 0.6245273, -0.2147161, 0, 1, 0.07450981, 1,
-0.3527533, 1.649294, -1.358349, 0, 1, 0.08235294, 1,
-0.3513621, -0.8993671, -3.205301, 0, 1, 0.08627451, 1,
-0.3510857, -0.9392424, -2.971576, 0, 1, 0.09411765, 1,
-0.3510377, -1.145913, -3.183717, 0, 1, 0.1019608, 1,
-0.3499965, 0.7243159, -0.8869074, 0, 1, 0.1058824, 1,
-0.3496727, 0.6144307, -1.24133, 0, 1, 0.1137255, 1,
-0.3486027, -0.2799957, -2.869708, 0, 1, 0.1176471, 1,
-0.3478215, 0.7132432, 0.06952824, 0, 1, 0.1254902, 1,
-0.3449967, -0.4325594, -2.970483, 0, 1, 0.1294118, 1,
-0.3436898, -0.4932544, -2.347727, 0, 1, 0.1372549, 1,
-0.3393954, -1.151724, -0.8801517, 0, 1, 0.1411765, 1,
-0.3321616, -0.8367484, -2.629131, 0, 1, 0.1490196, 1,
-0.3289059, -0.02423144, -2.317487, 0, 1, 0.1529412, 1,
-0.3287195, -2.107796, -3.04944, 0, 1, 0.1607843, 1,
-0.3258001, -0.6505311, -2.355084, 0, 1, 0.1647059, 1,
-0.3220572, 0.4286346, 0.4115316, 0, 1, 0.172549, 1,
-0.3181551, -1.640237, -2.27623, 0, 1, 0.1764706, 1,
-0.3164046, 0.1506298, -0.6953768, 0, 1, 0.1843137, 1,
-0.3141833, 1.94313, 0.2635307, 0, 1, 0.1882353, 1,
-0.3132053, -1.181356, -1.086851, 0, 1, 0.1960784, 1,
-0.3083698, -1.517365, -1.980991, 0, 1, 0.2039216, 1,
-0.3083047, -0.3810702, -2.207746, 0, 1, 0.2078431, 1,
-0.3061252, -0.9645718, -3.641935, 0, 1, 0.2156863, 1,
-0.3028015, -0.9557732, -2.152627, 0, 1, 0.2196078, 1,
-0.3012131, -0.6056647, -2.70026, 0, 1, 0.227451, 1,
-0.290135, -0.4122411, -1.009933, 0, 1, 0.2313726, 1,
-0.2883646, 0.3271926, -1.375583, 0, 1, 0.2392157, 1,
-0.2867746, -1.156215, -3.347367, 0, 1, 0.2431373, 1,
-0.2796046, -0.3268968, -1.916939, 0, 1, 0.2509804, 1,
-0.2787366, -0.4746218, -3.214929, 0, 1, 0.254902, 1,
-0.2766076, 0.00792136, -2.889429, 0, 1, 0.2627451, 1,
-0.275513, -0.6280385, -0.139783, 0, 1, 0.2666667, 1,
-0.271192, -0.9735997, -3.368505, 0, 1, 0.2745098, 1,
-0.2694783, -0.6948017, -3.261795, 0, 1, 0.2784314, 1,
-0.269324, -1.510439, -3.442421, 0, 1, 0.2862745, 1,
-0.267591, 0.1719064, -0.06263433, 0, 1, 0.2901961, 1,
-0.2617164, -0.2964308, -2.481749, 0, 1, 0.2980392, 1,
-0.2616618, -0.6609603, -3.026885, 0, 1, 0.3058824, 1,
-0.2583582, 0.01850164, -2.578916, 0, 1, 0.3098039, 1,
-0.2579822, 0.258473, -0.03902034, 0, 1, 0.3176471, 1,
-0.2572, 0.6590784, 0.3020619, 0, 1, 0.3215686, 1,
-0.24354, 1.484706, 0.5124896, 0, 1, 0.3294118, 1,
-0.2419831, 0.4769675, 0.1470709, 0, 1, 0.3333333, 1,
-0.2391424, 0.1439069, -0.7275314, 0, 1, 0.3411765, 1,
-0.2355785, -0.8768373, -0.7695812, 0, 1, 0.345098, 1,
-0.2354382, 2.099446, 0.454096, 0, 1, 0.3529412, 1,
-0.2347525, 1.106328, 1.654059, 0, 1, 0.3568628, 1,
-0.232375, -0.3279851, -3.952058, 0, 1, 0.3647059, 1,
-0.2303677, -1.081649, -3.718101, 0, 1, 0.3686275, 1,
-0.2238684, 0.1882785, -1.459495, 0, 1, 0.3764706, 1,
-0.2221134, 1.639557, -0.6251078, 0, 1, 0.3803922, 1,
-0.2165689, -1.654254, -2.490051, 0, 1, 0.3882353, 1,
-0.2147805, 0.9296124, -1.099062, 0, 1, 0.3921569, 1,
-0.2137725, 0.7573847, 2.14928, 0, 1, 0.4, 1,
-0.2090386, -0.325854, -3.517684, 0, 1, 0.4078431, 1,
-0.2084689, -2.06162, -4.306892, 0, 1, 0.4117647, 1,
-0.2079457, 0.1580876, -1.205185, 0, 1, 0.4196078, 1,
-0.2071369, -0.05113407, -2.411147, 0, 1, 0.4235294, 1,
-0.2062257, -0.07959516, -2.820252, 0, 1, 0.4313726, 1,
-0.2054364, 1.215389, 1.847279, 0, 1, 0.4352941, 1,
-0.2035433, -2.139353, -1.180021, 0, 1, 0.4431373, 1,
-0.193315, -0.6223446, -3.505562, 0, 1, 0.4470588, 1,
-0.1789057, -0.6668602, -0.9239385, 0, 1, 0.454902, 1,
-0.1764515, 1.746909, -1.031012, 0, 1, 0.4588235, 1,
-0.1764369, 0.381701, -1.073147, 0, 1, 0.4666667, 1,
-0.1751135, -0.8531456, -1.803975, 0, 1, 0.4705882, 1,
-0.1745992, 0.2947976, 0.7541809, 0, 1, 0.4784314, 1,
-0.171702, -0.07507998, -0.8779831, 0, 1, 0.4823529, 1,
-0.1700568, 0.4276704, 0.4278697, 0, 1, 0.4901961, 1,
-0.1680707, 1.555544, 0.3753215, 0, 1, 0.4941176, 1,
-0.1600671, 0.2300498, -2.355651, 0, 1, 0.5019608, 1,
-0.154219, -1.757974, -3.70526, 0, 1, 0.509804, 1,
-0.1537765, 0.8124897, 0.02228225, 0, 1, 0.5137255, 1,
-0.1486729, -0.02170715, -2.35034, 0, 1, 0.5215687, 1,
-0.1455689, 2.26388, 0.2267281, 0, 1, 0.5254902, 1,
-0.1442066, 0.2712886, -1.158278, 0, 1, 0.5333334, 1,
-0.1418451, 0.6220607, 0.6022614, 0, 1, 0.5372549, 1,
-0.1403739, -0.3968279, -3.059465, 0, 1, 0.5450981, 1,
-0.1399247, 0.2182182, -2.044482, 0, 1, 0.5490196, 1,
-0.1392694, -1.009297, -3.241012, 0, 1, 0.5568628, 1,
-0.1391474, 1.467879, -0.3123589, 0, 1, 0.5607843, 1,
-0.1367648, 0.1705796, -1.201862, 0, 1, 0.5686275, 1,
-0.1360491, 0.5420756, -1.627498, 0, 1, 0.572549, 1,
-0.135407, -1.281708, -4.199306, 0, 1, 0.5803922, 1,
-0.1323187, -0.9596437, -3.147841, 0, 1, 0.5843138, 1,
-0.1314769, 0.636254, -1.119845, 0, 1, 0.5921569, 1,
-0.1297395, -1.151885, -4.029458, 0, 1, 0.5960785, 1,
-0.1279583, 0.3132468, 0.5076377, 0, 1, 0.6039216, 1,
-0.1252847, 0.6099517, -0.3525182, 0, 1, 0.6117647, 1,
-0.1139699, 1.23665, -0.04697069, 0, 1, 0.6156863, 1,
-0.1121121, 1.229822, 0.2374309, 0, 1, 0.6235294, 1,
-0.1112849, -0.3014611, -2.499119, 0, 1, 0.627451, 1,
-0.1080691, 0.7385859, -0.03639517, 0, 1, 0.6352941, 1,
-0.1072088, 0.2225187, 0.7779006, 0, 1, 0.6392157, 1,
-0.1056791, -0.8431827, -3.86256, 0, 1, 0.6470588, 1,
-0.1038452, -0.1969623, -2.768542, 0, 1, 0.6509804, 1,
-0.1027752, -0.1733811, -1.298735, 0, 1, 0.6588235, 1,
-0.1027743, 1.012432, 1.248044, 0, 1, 0.6627451, 1,
-0.1013, -1.037855, -3.994181, 0, 1, 0.6705883, 1,
-0.09932543, 0.2683583, -0.8509571, 0, 1, 0.6745098, 1,
-0.09893098, 2.357628, 0.4430974, 0, 1, 0.682353, 1,
-0.09866508, -0.7385646, -4.564543, 0, 1, 0.6862745, 1,
-0.09763266, -0.8997835, -1.174227, 0, 1, 0.6941177, 1,
-0.09691586, 0.5485188, 0.2080405, 0, 1, 0.7019608, 1,
-0.09600134, 0.09862328, 0.2035931, 0, 1, 0.7058824, 1,
-0.08934626, 0.5627149, 0.9170552, 0, 1, 0.7137255, 1,
-0.0867373, -0.2080693, -2.886064, 0, 1, 0.7176471, 1,
-0.08345724, 0.1290855, -0.8803334, 0, 1, 0.7254902, 1,
-0.08317526, -0.5651063, -2.430726, 0, 1, 0.7294118, 1,
-0.08024023, 1.693442, 0.6180462, 0, 1, 0.7372549, 1,
-0.07734808, 1.05262, 0.3459443, 0, 1, 0.7411765, 1,
-0.07704238, 1.884769, -2.019314, 0, 1, 0.7490196, 1,
-0.07529595, -0.480583, -1.991289, 0, 1, 0.7529412, 1,
-0.07412344, -0.2242279, -4.131502, 0, 1, 0.7607843, 1,
-0.07029068, 0.1258, -0.3221838, 0, 1, 0.7647059, 1,
-0.06979299, 0.03227823, -1.06756, 0, 1, 0.772549, 1,
-0.06716028, 0.1427764, -2.317707, 0, 1, 0.7764706, 1,
-0.06612529, -0.6665048, -0.661845, 0, 1, 0.7843137, 1,
-0.06610541, -1.352861, -3.217614, 0, 1, 0.7882353, 1,
-0.06467453, -0.975741, -3.062787, 0, 1, 0.7960784, 1,
-0.06399414, 0.8234286, -1.400905, 0, 1, 0.8039216, 1,
-0.06101048, -0.03380932, -0.7776636, 0, 1, 0.8078431, 1,
-0.06049509, 0.761577, 1.387348, 0, 1, 0.8156863, 1,
-0.0595809, 1.878963, -0.04274795, 0, 1, 0.8196079, 1,
-0.05646243, -0.1032323, -3.879745, 0, 1, 0.827451, 1,
-0.05433528, 0.8609293, 0.6563963, 0, 1, 0.8313726, 1,
-0.05364214, -0.3669986, -3.334258, 0, 1, 0.8392157, 1,
-0.05224886, 0.3040626, -0.8183751, 0, 1, 0.8431373, 1,
-0.04929425, -1.762785, -4.08884, 0, 1, 0.8509804, 1,
-0.04868558, -0.8070307, -3.481547, 0, 1, 0.854902, 1,
-0.04662735, 1.882573, 0.4137288, 0, 1, 0.8627451, 1,
-0.04181062, 0.571733, -0.7459189, 0, 1, 0.8666667, 1,
-0.03975502, 0.3967922, 1.289243, 0, 1, 0.8745098, 1,
-0.03761774, -1.759011, -3.349837, 0, 1, 0.8784314, 1,
-0.03712925, -0.2339476, -1.876185, 0, 1, 0.8862745, 1,
-0.03569233, 0.8360666, 1.979582, 0, 1, 0.8901961, 1,
-0.03460677, 0.04353687, 0.1572076, 0, 1, 0.8980392, 1,
-0.03102766, -1.495461, -4.168825, 0, 1, 0.9058824, 1,
-0.02972636, 1.05474, 0.2189349, 0, 1, 0.9098039, 1,
-0.02959738, -1.433361, -4.036209, 0, 1, 0.9176471, 1,
-0.02729418, 0.1711143, 0.6701674, 0, 1, 0.9215686, 1,
-0.02558937, -1.26529, -2.011255, 0, 1, 0.9294118, 1,
-0.01528144, -0.9711571, -4.384241, 0, 1, 0.9333333, 1,
-0.009983313, 0.05132993, -1.082313, 0, 1, 0.9411765, 1,
-0.009866823, -1.337527, -5.79227, 0, 1, 0.945098, 1,
-0.007975695, 0.7537469, -1.485719, 0, 1, 0.9529412, 1,
-0.006343979, 0.1820094, -0.3408207, 0, 1, 0.9568627, 1,
-0.006173398, 0.376712, 0.8610703, 0, 1, 0.9647059, 1,
-0.005354043, 0.002582889, -0.9861512, 0, 1, 0.9686275, 1,
0.0007986903, -0.07894151, 2.519944, 0, 1, 0.9764706, 1,
0.0008917885, 1.517032, 0.0639464, 0, 1, 0.9803922, 1,
0.002497176, 0.3757653, 0.5072839, 0, 1, 0.9882353, 1,
0.00415774, -1.18889, 2.856339, 0, 1, 0.9921569, 1,
0.006174299, 0.04001268, 1.286254, 0, 1, 1, 1,
0.008747933, 1.626667, 0.2820904, 0, 0.9921569, 1, 1,
0.008832767, 0.2007892, 0.6590854, 0, 0.9882353, 1, 1,
0.01136123, -0.8132728, 2.127991, 0, 0.9803922, 1, 1,
0.01318819, -3.177435, 2.880404, 0, 0.9764706, 1, 1,
0.01337438, 0.557147, -0.1449868, 0, 0.9686275, 1, 1,
0.01405947, 0.8271859, -0.7532322, 0, 0.9647059, 1, 1,
0.01839907, -0.5577658, 1.537267, 0, 0.9568627, 1, 1,
0.01986928, 1.86317, -1.186297, 0, 0.9529412, 1, 1,
0.02221578, 0.8108052, 1.53037, 0, 0.945098, 1, 1,
0.02337852, 0.006017338, 1.431308, 0, 0.9411765, 1, 1,
0.02361903, -1.183492, 3.381976, 0, 0.9333333, 1, 1,
0.02371468, -0.2973171, 4.213153, 0, 0.9294118, 1, 1,
0.02433855, 0.4999791, 1.142709, 0, 0.9215686, 1, 1,
0.02460684, -0.4982153, 3.020117, 0, 0.9176471, 1, 1,
0.03124433, 0.6397312, 1.48915, 0, 0.9098039, 1, 1,
0.03352795, -1.383879, 4.101924, 0, 0.9058824, 1, 1,
0.03614177, 0.5991732, -1.39813, 0, 0.8980392, 1, 1,
0.03621925, -0.5094852, 1.487079, 0, 0.8901961, 1, 1,
0.03848606, 0.717456, 0.2620189, 0, 0.8862745, 1, 1,
0.03915502, -2.129491, 4.279684, 0, 0.8784314, 1, 1,
0.03970366, 0.5810868, 0.9772198, 0, 0.8745098, 1, 1,
0.04040792, 0.03684686, -0.5895985, 0, 0.8666667, 1, 1,
0.04063813, 0.7009911, -0.2813919, 0, 0.8627451, 1, 1,
0.04249047, 0.3906072, 1.363268, 0, 0.854902, 1, 1,
0.04526136, -1.222161, 3.289348, 0, 0.8509804, 1, 1,
0.0469912, -0.136328, 1.766718, 0, 0.8431373, 1, 1,
0.04959358, 0.04959514, 0.6399433, 0, 0.8392157, 1, 1,
0.05067387, -1.002627, 3.577775, 0, 0.8313726, 1, 1,
0.05165038, 0.0003653071, 0.6488661, 0, 0.827451, 1, 1,
0.05292552, 0.3656693, -0.7077142, 0, 0.8196079, 1, 1,
0.05941749, 0.8508712, 0.1736958, 0, 0.8156863, 1, 1,
0.06046426, -1.223647, 3.753281, 0, 0.8078431, 1, 1,
0.06067124, -0.7441747, 3.422523, 0, 0.8039216, 1, 1,
0.06479233, -0.3125057, 2.926882, 0, 0.7960784, 1, 1,
0.06764462, -0.5298938, 2.164671, 0, 0.7882353, 1, 1,
0.07166863, -0.4595644, 3.183197, 0, 0.7843137, 1, 1,
0.07664867, -0.9164271, 3.502056, 0, 0.7764706, 1, 1,
0.07803465, 1.052628, 1.342508, 0, 0.772549, 1, 1,
0.07929584, 0.004367162, 1.126647, 0, 0.7647059, 1, 1,
0.08007332, 1.341989, 0.2646072, 0, 0.7607843, 1, 1,
0.08042791, 0.3976934, 0.9193939, 0, 0.7529412, 1, 1,
0.081379, 1.329531, -0.1594381, 0, 0.7490196, 1, 1,
0.08224048, -0.7151095, 3.288038, 0, 0.7411765, 1, 1,
0.08404502, 0.474376, -0.5022048, 0, 0.7372549, 1, 1,
0.08668894, 0.5126925, 0.0613526, 0, 0.7294118, 1, 1,
0.08699135, -0.8410096, 2.534258, 0, 0.7254902, 1, 1,
0.08881918, 0.7690634, -1.252005, 0, 0.7176471, 1, 1,
0.09337484, -0.8825725, 2.717477, 0, 0.7137255, 1, 1,
0.09357442, -0.0466389, 2.276235, 0, 0.7058824, 1, 1,
0.09369255, -0.2769419, 1.124359, 0, 0.6980392, 1, 1,
0.0960604, -1.087599, 3.267771, 0, 0.6941177, 1, 1,
0.09824775, -1.546274, 3.418145, 0, 0.6862745, 1, 1,
0.1001905, -1.754629, 1.012025, 0, 0.682353, 1, 1,
0.1019951, -0.4278851, 3.78549, 0, 0.6745098, 1, 1,
0.1020807, 0.238826, 2.433026, 0, 0.6705883, 1, 1,
0.1028594, -2.585865, 1.672651, 0, 0.6627451, 1, 1,
0.1040233, 1.184993, 1.115649, 0, 0.6588235, 1, 1,
0.1044011, 0.03857231, 1.326695, 0, 0.6509804, 1, 1,
0.106334, -0.5584061, 2.345399, 0, 0.6470588, 1, 1,
0.1071431, -1.598611, 4.478888, 0, 0.6392157, 1, 1,
0.1107125, 0.2734523, 0.06936978, 0, 0.6352941, 1, 1,
0.1117431, -0.4196465, 3.424126, 0, 0.627451, 1, 1,
0.1159472, -0.03103598, 0.09846679, 0, 0.6235294, 1, 1,
0.1176195, -0.6528419, 4.857069, 0, 0.6156863, 1, 1,
0.1212417, -1.73754, 4.322629, 0, 0.6117647, 1, 1,
0.121681, 0.1801207, 0.8843802, 0, 0.6039216, 1, 1,
0.1234048, -0.3885045, 2.045112, 0, 0.5960785, 1, 1,
0.1253793, -0.04462987, 1.175766, 0, 0.5921569, 1, 1,
0.1318829, -1.019495, 3.938821, 0, 0.5843138, 1, 1,
0.1376494, 1.364477, -0.6122783, 0, 0.5803922, 1, 1,
0.1384688, 0.8776416, 1.273795, 0, 0.572549, 1, 1,
0.1408516, 0.01848938, 2.325386, 0, 0.5686275, 1, 1,
0.1417762, 0.6851043, 0.853485, 0, 0.5607843, 1, 1,
0.1458171, 0.5726024, 0.5940462, 0, 0.5568628, 1, 1,
0.1464806, 0.389976, 0.1897306, 0, 0.5490196, 1, 1,
0.1471033, 1.953977, 0.2885347, 0, 0.5450981, 1, 1,
0.1474934, 1.043105, 0.2854562, 0, 0.5372549, 1, 1,
0.1500888, 0.7227377, -0.3425651, 0, 0.5333334, 1, 1,
0.1535853, -1.203739, 2.450159, 0, 0.5254902, 1, 1,
0.1535895, -1.224942, 4.550839, 0, 0.5215687, 1, 1,
0.1552758, -0.7185556, 0.4218607, 0, 0.5137255, 1, 1,
0.1585743, -0.7386782, 4.923716, 0, 0.509804, 1, 1,
0.1597679, -1.028822, 1.914526, 0, 0.5019608, 1, 1,
0.1599167, 0.1274162, 2.919414, 0, 0.4941176, 1, 1,
0.1599494, -2.164027, 4.057711, 0, 0.4901961, 1, 1,
0.1609007, -0.3637609, 4.974716, 0, 0.4823529, 1, 1,
0.1628476, -0.9510646, 3.283359, 0, 0.4784314, 1, 1,
0.1635031, -1.385149, 2.5871, 0, 0.4705882, 1, 1,
0.1666422, 0.8674933, -2.411543, 0, 0.4666667, 1, 1,
0.166914, 0.379453, 0.05598736, 0, 0.4588235, 1, 1,
0.1674006, -0.5246878, 3.016644, 0, 0.454902, 1, 1,
0.1720988, 0.6509665, 0.4407438, 0, 0.4470588, 1, 1,
0.1830596, -0.05497976, 2.39615, 0, 0.4431373, 1, 1,
0.1832659, -1.875939, 4.36421, 0, 0.4352941, 1, 1,
0.188427, 0.4952818, -1.289887, 0, 0.4313726, 1, 1,
0.1900835, 0.8413694, 0.7212144, 0, 0.4235294, 1, 1,
0.1924391, -0.6735647, 2.09316, 0, 0.4196078, 1, 1,
0.1924528, -0.8626067, 3.314377, 0, 0.4117647, 1, 1,
0.1934206, 0.1147976, 0.004594085, 0, 0.4078431, 1, 1,
0.1953703, -0.6022462, 2.204486, 0, 0.4, 1, 1,
0.2025449, 0.3340416, 1.342594, 0, 0.3921569, 1, 1,
0.2148007, -0.6506038, 1.503959, 0, 0.3882353, 1, 1,
0.2148542, -0.9796928, 1.604873, 0, 0.3803922, 1, 1,
0.216085, -1.021983, 3.435191, 0, 0.3764706, 1, 1,
0.2188748, 0.3974068, 0.2510733, 0, 0.3686275, 1, 1,
0.2189694, 0.9687329, -0.9397736, 0, 0.3647059, 1, 1,
0.221519, -1.353271, 4.017639, 0, 0.3568628, 1, 1,
0.2218857, -1.077442, 2.906277, 0, 0.3529412, 1, 1,
0.2232071, 1.259737, -0.05072545, 0, 0.345098, 1, 1,
0.2256385, 0.9145314, -0.4820228, 0, 0.3411765, 1, 1,
0.2261003, -0.08574548, 1.320116, 0, 0.3333333, 1, 1,
0.2275926, -0.06245425, 0.7132044, 0, 0.3294118, 1, 1,
0.2294535, -0.2718935, 2.474627, 0, 0.3215686, 1, 1,
0.2300143, 0.6348112, 0.9293768, 0, 0.3176471, 1, 1,
0.2464996, -0.1869629, 2.356771, 0, 0.3098039, 1, 1,
0.2484197, -2.467921, 3.570823, 0, 0.3058824, 1, 1,
0.249641, -0.2581694, 1.4389, 0, 0.2980392, 1, 1,
0.2502219, 0.8958829, 1.458248, 0, 0.2901961, 1, 1,
0.250277, 0.09430844, 0.6748635, 0, 0.2862745, 1, 1,
0.252417, -0.1662492, 0.9064593, 0, 0.2784314, 1, 1,
0.2532366, 0.8657355, 0.4035524, 0, 0.2745098, 1, 1,
0.2560555, 0.9536115, -0.8021091, 0, 0.2666667, 1, 1,
0.2603707, -0.6466314, 2.513773, 0, 0.2627451, 1, 1,
0.2637841, -0.3179407, 1.943269, 0, 0.254902, 1, 1,
0.2654131, -1.768464, 3.480103, 0, 0.2509804, 1, 1,
0.2677732, 0.2261162, 0.5440254, 0, 0.2431373, 1, 1,
0.268667, -1.899756, -0.07272802, 0, 0.2392157, 1, 1,
0.270173, 0.05195767, -0.1693517, 0, 0.2313726, 1, 1,
0.2714929, -1.852059, 1.03556, 0, 0.227451, 1, 1,
0.2724675, 0.01366106, 2.633673, 0, 0.2196078, 1, 1,
0.2748362, -0.6341573, 1.192262, 0, 0.2156863, 1, 1,
0.2776715, 1.29853, 1.091189, 0, 0.2078431, 1, 1,
0.2827974, 0.6011476, 1.648042, 0, 0.2039216, 1, 1,
0.2835233, -0.8786348, 1.892315, 0, 0.1960784, 1, 1,
0.2837709, 0.9166643, -0.1626622, 0, 0.1882353, 1, 1,
0.284428, 0.9761155, -1.290058, 0, 0.1843137, 1, 1,
0.2890119, -0.5954945, 2.399892, 0, 0.1764706, 1, 1,
0.2940333, -0.03091161, 0.8722523, 0, 0.172549, 1, 1,
0.2964614, 1.576753, 0.8123183, 0, 0.1647059, 1, 1,
0.3055024, 2.018669, 0.7619927, 0, 0.1607843, 1, 1,
0.3069101, 0.1021347, 0.05038572, 0, 0.1529412, 1, 1,
0.308243, 0.2310341, 2.431716, 0, 0.1490196, 1, 1,
0.308719, 0.9958875, 0.6520866, 0, 0.1411765, 1, 1,
0.3093427, -1.230098, -0.01710971, 0, 0.1372549, 1, 1,
0.3191643, -1.288468, 3.198717, 0, 0.1294118, 1, 1,
0.3246903, 0.3658904, -0.8185509, 0, 0.1254902, 1, 1,
0.3281299, -0.1820221, 3.004357, 0, 0.1176471, 1, 1,
0.3291077, -1.329756, 3.409084, 0, 0.1137255, 1, 1,
0.3325113, 0.6615427, -0.2610257, 0, 0.1058824, 1, 1,
0.3342106, -0.3777158, 3.624615, 0, 0.09803922, 1, 1,
0.3365804, -0.02313849, 2.020356, 0, 0.09411765, 1, 1,
0.3371235, -0.2855861, 2.430806, 0, 0.08627451, 1, 1,
0.3454342, 0.8688201, -0.1965461, 0, 0.08235294, 1, 1,
0.3461667, -1.035333, 2.808184, 0, 0.07450981, 1, 1,
0.3474796, -0.9105955, 2.133462, 0, 0.07058824, 1, 1,
0.3492139, -1.576455, 2.716455, 0, 0.0627451, 1, 1,
0.3497753, 0.2916401, -1.03488, 0, 0.05882353, 1, 1,
0.350132, -0.213718, 2.433447, 0, 0.05098039, 1, 1,
0.3509043, 0.6263633, 0.1836139, 0, 0.04705882, 1, 1,
0.3510028, -0.6811317, 2.098069, 0, 0.03921569, 1, 1,
0.355267, 0.4877283, 0.9506457, 0, 0.03529412, 1, 1,
0.3590641, 0.177974, 2.553311, 0, 0.02745098, 1, 1,
0.3616458, 0.4705466, 1.115588, 0, 0.02352941, 1, 1,
0.366285, 0.0219684, 1.070788, 0, 0.01568628, 1, 1,
0.3697559, 0.5364412, 0.1683428, 0, 0.01176471, 1, 1,
0.371247, 0.2902325, 1.039614, 0, 0.003921569, 1, 1,
0.371778, -0.7165458, 3.696655, 0.003921569, 0, 1, 1,
0.3721041, 0.4162904, 1.742058, 0.007843138, 0, 1, 1,
0.373958, 1.492279, 0.4345886, 0.01568628, 0, 1, 1,
0.3754692, -0.8137282, 1.212487, 0.01960784, 0, 1, 1,
0.3756643, 0.871337, 0.8951651, 0.02745098, 0, 1, 1,
0.3797777, 0.9832814, -0.03059647, 0.03137255, 0, 1, 1,
0.3858646, -2.699404, 3.0836, 0.03921569, 0, 1, 1,
0.3925956, -1.468791, 3.019946, 0.04313726, 0, 1, 1,
0.4003033, 0.6083039, 0.2603995, 0.05098039, 0, 1, 1,
0.4011988, -0.1341948, 3.287147, 0.05490196, 0, 1, 1,
0.4020784, 0.8398098, -0.3105314, 0.0627451, 0, 1, 1,
0.4037812, 1.339516, -0.2381085, 0.06666667, 0, 1, 1,
0.4162959, -0.3448444, 3.449813, 0.07450981, 0, 1, 1,
0.4178228, -0.2975255, 1.249161, 0.07843138, 0, 1, 1,
0.4200808, 2.455743, 0.6297761, 0.08627451, 0, 1, 1,
0.4203385, 0.995309, -0.638071, 0.09019608, 0, 1, 1,
0.4263607, -0.4015053, 1.544597, 0.09803922, 0, 1, 1,
0.4280433, -0.2154593, 1.828383, 0.1058824, 0, 1, 1,
0.4319036, 0.2448814, 0.5414692, 0.1098039, 0, 1, 1,
0.433831, -1.483235, 3.975163, 0.1176471, 0, 1, 1,
0.4351672, 0.3569209, 2.831686, 0.1215686, 0, 1, 1,
0.4395689, -1.057626, 2.573865, 0.1294118, 0, 1, 1,
0.4400403, -1.06749, 3.748858, 0.1333333, 0, 1, 1,
0.4426276, 0.01623122, 1.336193, 0.1411765, 0, 1, 1,
0.4446918, -1.450647, 2.545757, 0.145098, 0, 1, 1,
0.4463963, 1.454218, -1.309843, 0.1529412, 0, 1, 1,
0.4497597, -0.4623511, 2.718458, 0.1568628, 0, 1, 1,
0.4547988, -1.021672, 1.389816, 0.1647059, 0, 1, 1,
0.4581946, 1.087219, 3.194569, 0.1686275, 0, 1, 1,
0.4587922, 0.8489023, 0.2662954, 0.1764706, 0, 1, 1,
0.4671533, -1.040626, 4.567524, 0.1803922, 0, 1, 1,
0.4703774, -0.1276964, 2.37698, 0.1882353, 0, 1, 1,
0.472596, -0.5217239, 2.579918, 0.1921569, 0, 1, 1,
0.4757695, -1.529621, 2.890575, 0.2, 0, 1, 1,
0.4769971, 0.9392165, 1.076997, 0.2078431, 0, 1, 1,
0.4791782, 1.445446, 1.041385, 0.2117647, 0, 1, 1,
0.4805986, 0.4023682, 1.586779, 0.2196078, 0, 1, 1,
0.4859568, 0.6503434, 0.01601959, 0.2235294, 0, 1, 1,
0.4931151, -0.9151041, 1.522258, 0.2313726, 0, 1, 1,
0.4974539, -1.350421, 3.409325, 0.2352941, 0, 1, 1,
0.5096022, -0.03646396, 1.310749, 0.2431373, 0, 1, 1,
0.5102542, -0.01865435, 2.690584, 0.2470588, 0, 1, 1,
0.5142664, 0.6169937, 0.7955502, 0.254902, 0, 1, 1,
0.5180201, -0.3080356, 1.431474, 0.2588235, 0, 1, 1,
0.5195871, -0.5192387, 4.328639, 0.2666667, 0, 1, 1,
0.5223798, -0.4389818, 1.710761, 0.2705882, 0, 1, 1,
0.5279513, -1.387072, 3.449852, 0.2784314, 0, 1, 1,
0.5324822, 1.917449, -1.140483, 0.282353, 0, 1, 1,
0.5336775, -0.09810565, 2.752785, 0.2901961, 0, 1, 1,
0.5354146, -0.9723662, 2.003297, 0.2941177, 0, 1, 1,
0.5417559, 0.9836988, 0.3217192, 0.3019608, 0, 1, 1,
0.5449272, 0.2057599, 3.554681, 0.3098039, 0, 1, 1,
0.5467564, -0.1487264, 1.283239, 0.3137255, 0, 1, 1,
0.5472715, -1.688981, 3.622767, 0.3215686, 0, 1, 1,
0.5485417, 0.2156917, 2.448364, 0.3254902, 0, 1, 1,
0.5520456, -1.394215, 2.768132, 0.3333333, 0, 1, 1,
0.5555936, 1.099425, 1.981912, 0.3372549, 0, 1, 1,
0.5580233, -0.2451911, 0.855435, 0.345098, 0, 1, 1,
0.5585554, 1.638163, 0.7709835, 0.3490196, 0, 1, 1,
0.560765, 1.163042, 1.737933, 0.3568628, 0, 1, 1,
0.5616076, 0.2298606, 2.379922, 0.3607843, 0, 1, 1,
0.5640486, 0.06626257, 0.3544318, 0.3686275, 0, 1, 1,
0.5643759, 0.2821739, 3.40785, 0.372549, 0, 1, 1,
0.5666946, 0.3341118, -0.03833451, 0.3803922, 0, 1, 1,
0.5678629, 1.02108, -0.6300636, 0.3843137, 0, 1, 1,
0.5754187, 1.120336, 1.118289, 0.3921569, 0, 1, 1,
0.5769012, 1.092934, -0.2739985, 0.3960784, 0, 1, 1,
0.577136, -0.3416059, 2.351454, 0.4039216, 0, 1, 1,
0.5786862, -1.378074, 3.079349, 0.4117647, 0, 1, 1,
0.5792215, 0.5528321, -0.3850765, 0.4156863, 0, 1, 1,
0.580204, 1.426838, 0.3221678, 0.4235294, 0, 1, 1,
0.5871562, -0.4776091, 2.582632, 0.427451, 0, 1, 1,
0.5919921, -1.257304, 4.345551, 0.4352941, 0, 1, 1,
0.5944691, -0.539929, 1.32075, 0.4392157, 0, 1, 1,
0.5993013, 1.053439, 1.194578, 0.4470588, 0, 1, 1,
0.6012143, 1.683318, 0.9962976, 0.4509804, 0, 1, 1,
0.603661, 0.868744, 1.048127, 0.4588235, 0, 1, 1,
0.6078492, -0.1216063, 1.905665, 0.4627451, 0, 1, 1,
0.6280807, 0.5852436, 0.2337863, 0.4705882, 0, 1, 1,
0.6282535, -1.690601, 2.361614, 0.4745098, 0, 1, 1,
0.6305119, 0.1771101, 1.724086, 0.4823529, 0, 1, 1,
0.6357575, -1.12627, 2.34778, 0.4862745, 0, 1, 1,
0.6387569, -0.7520329, 1.092832, 0.4941176, 0, 1, 1,
0.6399484, 0.4503647, -1.019733, 0.5019608, 0, 1, 1,
0.650858, -0.1829648, 1.770396, 0.5058824, 0, 1, 1,
0.6514526, -0.06808715, 1.684205, 0.5137255, 0, 1, 1,
0.6550382, 1.888208, 2.459394, 0.5176471, 0, 1, 1,
0.6604561, -1.366147, 2.590005, 0.5254902, 0, 1, 1,
0.6630335, -0.6077728, 1.778653, 0.5294118, 0, 1, 1,
0.6657392, -1.334537, 2.039566, 0.5372549, 0, 1, 1,
0.6660987, -1.903111, 0.86131, 0.5411765, 0, 1, 1,
0.6717009, -1.193058, 3.339298, 0.5490196, 0, 1, 1,
0.6740138, 0.3939858, 0.7827814, 0.5529412, 0, 1, 1,
0.6741803, 0.4053674, 1.539904, 0.5607843, 0, 1, 1,
0.6777349, 1.277941, 0.3025341, 0.5647059, 0, 1, 1,
0.679189, -1.837376, 2.83806, 0.572549, 0, 1, 1,
0.6793481, -0.3654126, 0.5317155, 0.5764706, 0, 1, 1,
0.6845958, 1.273867, 1.356673, 0.5843138, 0, 1, 1,
0.6890728, -0.4551074, 3.034285, 0.5882353, 0, 1, 1,
0.6901033, -0.8949329, 0.9189082, 0.5960785, 0, 1, 1,
0.6930673, 0.4949749, 1.946384, 0.6039216, 0, 1, 1,
0.6967725, -1.998489, 3.220342, 0.6078432, 0, 1, 1,
0.6968703, -0.499825, 2.837997, 0.6156863, 0, 1, 1,
0.6982253, 0.8501506, 0.3713515, 0.6196079, 0, 1, 1,
0.7054504, 0.5521465, 0.9655879, 0.627451, 0, 1, 1,
0.7127768, -2.25088, 2.277994, 0.6313726, 0, 1, 1,
0.717222, -0.7083725, 0.8679941, 0.6392157, 0, 1, 1,
0.7200853, 0.5742403, -1.103771, 0.6431373, 0, 1, 1,
0.7218605, -0.5502598, 1.159662, 0.6509804, 0, 1, 1,
0.7219208, -0.7211349, 2.0871, 0.654902, 0, 1, 1,
0.7222387, 1.065628, 1.673344, 0.6627451, 0, 1, 1,
0.7248714, -0.8523118, 2.221404, 0.6666667, 0, 1, 1,
0.7315219, 1.733927, -0.1506979, 0.6745098, 0, 1, 1,
0.7336586, 0.3167148, 0.6458179, 0.6784314, 0, 1, 1,
0.736532, -1.129111, 1.574818, 0.6862745, 0, 1, 1,
0.7377629, -0.4956247, 2.547551, 0.6901961, 0, 1, 1,
0.7386351, -0.4757141, 1.815212, 0.6980392, 0, 1, 1,
0.7439021, -0.7083681, 2.771728, 0.7058824, 0, 1, 1,
0.7475917, 1.617615, 0.5602069, 0.7098039, 0, 1, 1,
0.7523556, -1.597887, 2.894809, 0.7176471, 0, 1, 1,
0.7562953, -2.07641, 3.599269, 0.7215686, 0, 1, 1,
0.7593379, 0.04909103, -1.163547, 0.7294118, 0, 1, 1,
0.7594938, 2.190218, -0.160102, 0.7333333, 0, 1, 1,
0.7606607, 0.3724265, 0.9211581, 0.7411765, 0, 1, 1,
0.7629207, 0.6284087, -0.3417724, 0.7450981, 0, 1, 1,
0.7666992, -0.04385996, 1.322294, 0.7529412, 0, 1, 1,
0.7668597, -1.036941, 1.90329, 0.7568628, 0, 1, 1,
0.7681125, 1.010946, -0.6352566, 0.7647059, 0, 1, 1,
0.7759681, -1.872359, 2.591784, 0.7686275, 0, 1, 1,
0.7762228, 0.2771598, 1.332951, 0.7764706, 0, 1, 1,
0.7832666, 0.446436, 0.4885767, 0.7803922, 0, 1, 1,
0.7839952, 2.094965, -0.2284114, 0.7882353, 0, 1, 1,
0.7926023, 0.2390931, -0.6324085, 0.7921569, 0, 1, 1,
0.7956992, 1.559523, 0.3588579, 0.8, 0, 1, 1,
0.8019261, 0.6292752, 1.293739, 0.8078431, 0, 1, 1,
0.8086815, 1.005046, -0.2529643, 0.8117647, 0, 1, 1,
0.8117881, 1.687027, -0.6496719, 0.8196079, 0, 1, 1,
0.8145877, -0.756312, 1.227087, 0.8235294, 0, 1, 1,
0.8170416, -0.3715299, 1.677474, 0.8313726, 0, 1, 1,
0.8174841, 2.404694, -0.6251261, 0.8352941, 0, 1, 1,
0.8180946, -0.7607653, 3.537637, 0.8431373, 0, 1, 1,
0.8186364, 1.436406, 0.6563652, 0.8470588, 0, 1, 1,
0.822315, -1.085851, 0.9256838, 0.854902, 0, 1, 1,
0.8237231, 0.2393005, 1.465156, 0.8588235, 0, 1, 1,
0.8258522, 0.6503003, -0.1153569, 0.8666667, 0, 1, 1,
0.8276939, 0.1546607, 1.337579, 0.8705882, 0, 1, 1,
0.8284053, -0.4055211, 0.5226185, 0.8784314, 0, 1, 1,
0.828775, 0.241303, 2.093919, 0.8823529, 0, 1, 1,
0.8305059, 1.129276, 0.1218642, 0.8901961, 0, 1, 1,
0.8311664, -1.439552, 3.618715, 0.8941177, 0, 1, 1,
0.8330038, 2.482401, 0.6980839, 0.9019608, 0, 1, 1,
0.8344295, -0.05819593, 3.79135, 0.9098039, 0, 1, 1,
0.8443889, -2.282726, 4.196199, 0.9137255, 0, 1, 1,
0.8538681, 2.536178, 0.4110348, 0.9215686, 0, 1, 1,
0.856472, 1.442538, 0.1054354, 0.9254902, 0, 1, 1,
0.8570958, 0.005395392, 0.3506289, 0.9333333, 0, 1, 1,
0.8589227, 0.5680237, 2.186869, 0.9372549, 0, 1, 1,
0.8667465, -0.519084, 2.714566, 0.945098, 0, 1, 1,
0.8703318, -0.9558226, 2.356984, 0.9490196, 0, 1, 1,
0.8770469, 0.7929676, 0.3746729, 0.9568627, 0, 1, 1,
0.8844342, -1.979933, 2.827136, 0.9607843, 0, 1, 1,
0.8850826, -0.9018264, 2.434894, 0.9686275, 0, 1, 1,
0.8940275, -1.198407, 2.3901, 0.972549, 0, 1, 1,
0.9010901, 0.2325406, 1.682226, 0.9803922, 0, 1, 1,
0.9021307, -0.04786763, 2.717721, 0.9843137, 0, 1, 1,
0.9027954, 0.06107128, 0.07013811, 0.9921569, 0, 1, 1,
0.9062613, -0.8502082, 0.3252022, 0.9960784, 0, 1, 1,
0.9093371, 0.8149754, -0.1271236, 1, 0, 0.9960784, 1,
0.9119124, 0.427615, 1.983403, 1, 0, 0.9882353, 1,
0.9128003, 0.1374073, 1.167524, 1, 0, 0.9843137, 1,
0.9143327, 0.9104837, 1.572639, 1, 0, 0.9764706, 1,
0.922734, 1.327113, 1.682426, 1, 0, 0.972549, 1,
0.9227597, -0.2278607, 1.678322, 1, 0, 0.9647059, 1,
0.9244277, 0.4428032, 1.359084, 1, 0, 0.9607843, 1,
0.9287624, -0.5888206, 2.000085, 1, 0, 0.9529412, 1,
0.9290102, 0.4219911, -0.8420321, 1, 0, 0.9490196, 1,
0.9299096, -0.6404009, 3.231214, 1, 0, 0.9411765, 1,
0.9323753, 0.5452967, 1.538227, 1, 0, 0.9372549, 1,
0.9343385, -0.5035881, 3.573776, 1, 0, 0.9294118, 1,
0.9343851, 0.8576327, 0.2848353, 1, 0, 0.9254902, 1,
0.9357575, 1.183372, -0.5674054, 1, 0, 0.9176471, 1,
0.95507, -0.586099, 3.802573, 1, 0, 0.9137255, 1,
0.958109, 1.020151, 0.3778569, 1, 0, 0.9058824, 1,
0.9660357, 1.042352, 0.4127147, 1, 0, 0.9019608, 1,
0.9745583, 0.368329, 0.4378617, 1, 0, 0.8941177, 1,
0.9768724, 0.2162788, -0.7483653, 1, 0, 0.8862745, 1,
0.9776046, 1.501296, -0.6095392, 1, 0, 0.8823529, 1,
0.9779368, 0.3304342, 1.248548, 1, 0, 0.8745098, 1,
0.9838259, 1.015092, 0.4810207, 1, 0, 0.8705882, 1,
0.993158, 2.093212, 0.8800635, 1, 0, 0.8627451, 1,
0.9937118, 0.6315247, 1.842723, 1, 0, 0.8588235, 1,
0.9942312, -0.7868458, 2.221921, 1, 0, 0.8509804, 1,
0.9943935, -0.7240531, 3.750023, 1, 0, 0.8470588, 1,
0.99603, 0.7871734, -0.2849219, 1, 0, 0.8392157, 1,
1.000985, 0.8675621, 1.626444, 1, 0, 0.8352941, 1,
1.001573, -0.7511188, 2.958753, 1, 0, 0.827451, 1,
1.003479, 1.358564, 1.419368, 1, 0, 0.8235294, 1,
1.008612, 1.082355, 0.04475566, 1, 0, 0.8156863, 1,
1.009785, -1.204216, 3.657637, 1, 0, 0.8117647, 1,
1.020279, 0.7423974, -0.917017, 1, 0, 0.8039216, 1,
1.025562, -2.466445, 1.095465, 1, 0, 0.7960784, 1,
1.032847, -0.1934382, 1.343565, 1, 0, 0.7921569, 1,
1.046175, -0.9723273, 2.113358, 1, 0, 0.7843137, 1,
1.049173, 0.7941199, 0.1816866, 1, 0, 0.7803922, 1,
1.063055, -0.06628184, 2.14564, 1, 0, 0.772549, 1,
1.067341, 0.08966889, 1.416758, 1, 0, 0.7686275, 1,
1.067431, 0.4107144, 0.6344343, 1, 0, 0.7607843, 1,
1.093555, 0.0476705, 1.940191, 1, 0, 0.7568628, 1,
1.095616, -0.549964, 0.4263005, 1, 0, 0.7490196, 1,
1.097453, -0.2069801, -0.3563827, 1, 0, 0.7450981, 1,
1.109084, -0.497312, 1.169935, 1, 0, 0.7372549, 1,
1.110656, 0.00202756, 0.3592483, 1, 0, 0.7333333, 1,
1.114578, 0.7647521, 0.5367647, 1, 0, 0.7254902, 1,
1.124919, -0.6734565, 0.5509247, 1, 0, 0.7215686, 1,
1.132633, -1.256965, 4.141663, 1, 0, 0.7137255, 1,
1.132745, -1.712457, 3.418077, 1, 0, 0.7098039, 1,
1.138754, 0.7192138, 0.7036711, 1, 0, 0.7019608, 1,
1.144118, -3.014941, 3.682557, 1, 0, 0.6941177, 1,
1.145767, 0.531571, 2.334409, 1, 0, 0.6901961, 1,
1.149286, 0.2494402, 0.6265746, 1, 0, 0.682353, 1,
1.1502, 0.1417086, 1.594343, 1, 0, 0.6784314, 1,
1.15237, 0.7224491, 2.797818, 1, 0, 0.6705883, 1,
1.15296, -0.8045575, 2.969437, 1, 0, 0.6666667, 1,
1.154059, -1.109999, 1.874087, 1, 0, 0.6588235, 1,
1.159366, -0.8533008, 2.552511, 1, 0, 0.654902, 1,
1.168486, -0.3439769, 1.740046, 1, 0, 0.6470588, 1,
1.177333, -1.103668, 1.875883, 1, 0, 0.6431373, 1,
1.17901, 0.5108308, -0.9487992, 1, 0, 0.6352941, 1,
1.179753, -0.5527309, 4.223755, 1, 0, 0.6313726, 1,
1.188115, 0.6212396, 2.43092, 1, 0, 0.6235294, 1,
1.188717, 0.2354459, 0.7136772, 1, 0, 0.6196079, 1,
1.190887, -1.302729, 2.465712, 1, 0, 0.6117647, 1,
1.19407, -0.7102021, -0.6504187, 1, 0, 0.6078432, 1,
1.197863, -1.027084, 1.880051, 1, 0, 0.6, 1,
1.20364, -0.07961374, 0.2919366, 1, 0, 0.5921569, 1,
1.204017, -2.778115, 2.508944, 1, 0, 0.5882353, 1,
1.212694, 2.011009, 1.195178, 1, 0, 0.5803922, 1,
1.218554, 0.2170352, 2.758811, 1, 0, 0.5764706, 1,
1.223908, -0.2711912, 2.402188, 1, 0, 0.5686275, 1,
1.235481, 0.6553711, 1.904679, 1, 0, 0.5647059, 1,
1.252241, 1.631567, 0.1614662, 1, 0, 0.5568628, 1,
1.258104, -0.05054959, 2.279253, 1, 0, 0.5529412, 1,
1.264232, -0.6945668, 2.339734, 1, 0, 0.5450981, 1,
1.264257, 0.1877057, 0.8393987, 1, 0, 0.5411765, 1,
1.264465, -0.05614188, 1.668766, 1, 0, 0.5333334, 1,
1.270484, 0.8103687, 1.155927, 1, 0, 0.5294118, 1,
1.270703, -0.2756868, 1.92868, 1, 0, 0.5215687, 1,
1.27102, 1.614809, 2.104344, 1, 0, 0.5176471, 1,
1.275006, -0.07947631, -0.600296, 1, 0, 0.509804, 1,
1.283877, 0.7068008, 0.7044878, 1, 0, 0.5058824, 1,
1.287318, -1.108069, 2.281667, 1, 0, 0.4980392, 1,
1.289155, 1.730957, 0.6560355, 1, 0, 0.4901961, 1,
1.294939, 1.490444, 1.653677, 1, 0, 0.4862745, 1,
1.303876, 0.9648969, 1.474652, 1, 0, 0.4784314, 1,
1.305065, -2.444782, 1.28749, 1, 0, 0.4745098, 1,
1.31778, -1.594556, 4.493323, 1, 0, 0.4666667, 1,
1.332936, -0.4392596, 1.598543, 1, 0, 0.4627451, 1,
1.34164, -0.9092524, 0.9166235, 1, 0, 0.454902, 1,
1.353804, 1.417081, 1.664118, 1, 0, 0.4509804, 1,
1.359255, -1.552762, 1.653404, 1, 0, 0.4431373, 1,
1.371225, -0.2408133, 1.755104, 1, 0, 0.4392157, 1,
1.38107, -0.3147253, 2.013388, 1, 0, 0.4313726, 1,
1.384618, -0.5569374, 1.512573, 1, 0, 0.427451, 1,
1.386471, 0.3433793, 0.652541, 1, 0, 0.4196078, 1,
1.397856, -0.952834, 1.509813, 1, 0, 0.4156863, 1,
1.409665, -0.002929199, 2.215015, 1, 0, 0.4078431, 1,
1.417198, -0.7542296, 2.037913, 1, 0, 0.4039216, 1,
1.424147, 0.1760075, 2.061143, 1, 0, 0.3960784, 1,
1.429271, 0.2527062, 2.661079, 1, 0, 0.3882353, 1,
1.431169, 0.0492247, 1.754505, 1, 0, 0.3843137, 1,
1.434608, -2.128871, 2.447032, 1, 0, 0.3764706, 1,
1.443097, 0.7683914, 1.417152, 1, 0, 0.372549, 1,
1.446681, 0.6066242, 3.55382, 1, 0, 0.3647059, 1,
1.461292, -0.3800709, 2.642056, 1, 0, 0.3607843, 1,
1.474946, -1.05825, 1.677069, 1, 0, 0.3529412, 1,
1.48491, 0.3845202, 2.089673, 1, 0, 0.3490196, 1,
1.489017, -1.13471, 2.57505, 1, 0, 0.3411765, 1,
1.499972, -2.305119, 3.702765, 1, 0, 0.3372549, 1,
1.520479, 0.0740921, 1.072538, 1, 0, 0.3294118, 1,
1.521378, 1.390158, 0.1541627, 1, 0, 0.3254902, 1,
1.522503, 1.308957, -1.229804, 1, 0, 0.3176471, 1,
1.545639, -0.2034084, 1.468399, 1, 0, 0.3137255, 1,
1.549374, -0.2106927, 1.776877, 1, 0, 0.3058824, 1,
1.56487, 0.2049665, 2.230135, 1, 0, 0.2980392, 1,
1.572405, -1.423408, 2.133331, 1, 0, 0.2941177, 1,
1.588073, 1.071784, 0.5616484, 1, 0, 0.2862745, 1,
1.601531, 1.14089, 0.249046, 1, 0, 0.282353, 1,
1.61537, -1.127211, 3.233614, 1, 0, 0.2745098, 1,
1.61628, -0.8410192, 1.524133, 1, 0, 0.2705882, 1,
1.640423, 0.8132264, 0.9319261, 1, 0, 0.2627451, 1,
1.645201, -0.9619859, 1.008068, 1, 0, 0.2588235, 1,
1.653653, -0.8219332, 2.068013, 1, 0, 0.2509804, 1,
1.678468, -0.832558, 2.452142, 1, 0, 0.2470588, 1,
1.693303, 0.4220251, 3.178976, 1, 0, 0.2392157, 1,
1.697081, 0.131811, 1.608332, 1, 0, 0.2352941, 1,
1.724142, 0.07846782, 2.034941, 1, 0, 0.227451, 1,
1.736526, 0.6595606, 3.629309, 1, 0, 0.2235294, 1,
1.739858, -0.8104975, 2.338165, 1, 0, 0.2156863, 1,
1.749964, -0.946893, 2.125136, 1, 0, 0.2117647, 1,
1.782018, -0.3294048, 2.374283, 1, 0, 0.2039216, 1,
1.804039, -0.004999881, 1.36224, 1, 0, 0.1960784, 1,
1.81685, -1.18542, 1.125028, 1, 0, 0.1921569, 1,
1.841688, 0.561694, 0.2116662, 1, 0, 0.1843137, 1,
1.873866, 0.6340845, 2.823356, 1, 0, 0.1803922, 1,
1.882359, 0.339724, 2.386618, 1, 0, 0.172549, 1,
1.900384, -0.05075628, 2.965398, 1, 0, 0.1686275, 1,
1.900619, -2.459483, 4.906592, 1, 0, 0.1607843, 1,
1.903218, -0.7820141, 2.001247, 1, 0, 0.1568628, 1,
1.904081, 0.1269124, 2.375636, 1, 0, 0.1490196, 1,
1.952875, 0.002385054, 1.293417, 1, 0, 0.145098, 1,
1.953532, -0.6676641, 2.82036, 1, 0, 0.1372549, 1,
1.978695, 1.14423, 3.474882, 1, 0, 0.1333333, 1,
1.98437, 1.899951, 0.15024, 1, 0, 0.1254902, 1,
2.011607, 1.190368, 2.212779, 1, 0, 0.1215686, 1,
2.046923, 0.4370254, 1.580081, 1, 0, 0.1137255, 1,
2.052106, -1.271328, 3.43884, 1, 0, 0.1098039, 1,
2.057765, -0.7636631, 3.039603, 1, 0, 0.1019608, 1,
2.065572, 0.1004331, 1.29911, 1, 0, 0.09411765, 1,
2.145482, 0.09645633, 1.946135, 1, 0, 0.09019608, 1,
2.153312, -0.6909281, -0.02383386, 1, 0, 0.08235294, 1,
2.168466, -1.526904, 2.419012, 1, 0, 0.07843138, 1,
2.226156, -0.6916286, 2.703377, 1, 0, 0.07058824, 1,
2.398443, 0.4625034, 3.157162, 1, 0, 0.06666667, 1,
2.427679, -0.1103649, 1.622569, 1, 0, 0.05882353, 1,
2.517108, -0.3397858, 2.450653, 1, 0, 0.05490196, 1,
2.571767, 0.06268409, 1.434526, 1, 0, 0.04705882, 1,
2.590628, -1.395786, 1.253191, 1, 0, 0.04313726, 1,
2.646465, -0.4127125, 0.1224898, 1, 0, 0.03529412, 1,
2.702793, -0.5529515, 2.184428, 1, 0, 0.03137255, 1,
2.78796, 0.0444281, 0.4762464, 1, 0, 0.02352941, 1,
2.849265, 0.6368455, 0.5198193, 1, 0, 0.01960784, 1,
3.143204, 0.8439651, 1.748209, 1, 0, 0.01176471, 1,
3.455517, 0.2854751, 0.5248457, 1, 0, 0.007843138, 1
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
0.1152893, -4.285439, -7.916617, 0, -0.5, 0.5, 0.5,
0.1152893, -4.285439, -7.916617, 1, -0.5, 0.5, 0.5,
0.1152893, -4.285439, -7.916617, 1, 1.5, 0.5, 0.5,
0.1152893, -4.285439, -7.916617, 0, 1.5, 0.5, 0.5
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
-4.357276, 0.09101295, -7.916617, 0, -0.5, 0.5, 0.5,
-4.357276, 0.09101295, -7.916617, 1, -0.5, 0.5, 0.5,
-4.357276, 0.09101295, -7.916617, 1, 1.5, 0.5, 0.5,
-4.357276, 0.09101295, -7.916617, 0, 1.5, 0.5, 0.5
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
-4.357276, -4.285439, -0.5367558, 0, -0.5, 0.5, 0.5,
-4.357276, -4.285439, -0.5367558, 1, -0.5, 0.5, 0.5,
-4.357276, -4.285439, -0.5367558, 1, 1.5, 0.5, 0.5,
-4.357276, -4.285439, -0.5367558, 0, 1.5, 0.5, 0.5
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
-3, -3.275488, -6.213572,
3, -3.275488, -6.213572,
-3, -3.275488, -6.213572,
-3, -3.443813, -6.497413,
-2, -3.275488, -6.213572,
-2, -3.443813, -6.497413,
-1, -3.275488, -6.213572,
-1, -3.443813, -6.497413,
0, -3.275488, -6.213572,
0, -3.443813, -6.497413,
1, -3.275488, -6.213572,
1, -3.443813, -6.497413,
2, -3.275488, -6.213572,
2, -3.443813, -6.497413,
3, -3.275488, -6.213572,
3, -3.443813, -6.497413
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
-3, -3.780463, -7.065094, 0, -0.5, 0.5, 0.5,
-3, -3.780463, -7.065094, 1, -0.5, 0.5, 0.5,
-3, -3.780463, -7.065094, 1, 1.5, 0.5, 0.5,
-3, -3.780463, -7.065094, 0, 1.5, 0.5, 0.5,
-2, -3.780463, -7.065094, 0, -0.5, 0.5, 0.5,
-2, -3.780463, -7.065094, 1, -0.5, 0.5, 0.5,
-2, -3.780463, -7.065094, 1, 1.5, 0.5, 0.5,
-2, -3.780463, -7.065094, 0, 1.5, 0.5, 0.5,
-1, -3.780463, -7.065094, 0, -0.5, 0.5, 0.5,
-1, -3.780463, -7.065094, 1, -0.5, 0.5, 0.5,
-1, -3.780463, -7.065094, 1, 1.5, 0.5, 0.5,
-1, -3.780463, -7.065094, 0, 1.5, 0.5, 0.5,
0, -3.780463, -7.065094, 0, -0.5, 0.5, 0.5,
0, -3.780463, -7.065094, 1, -0.5, 0.5, 0.5,
0, -3.780463, -7.065094, 1, 1.5, 0.5, 0.5,
0, -3.780463, -7.065094, 0, 1.5, 0.5, 0.5,
1, -3.780463, -7.065094, 0, -0.5, 0.5, 0.5,
1, -3.780463, -7.065094, 1, -0.5, 0.5, 0.5,
1, -3.780463, -7.065094, 1, 1.5, 0.5, 0.5,
1, -3.780463, -7.065094, 0, 1.5, 0.5, 0.5,
2, -3.780463, -7.065094, 0, -0.5, 0.5, 0.5,
2, -3.780463, -7.065094, 1, -0.5, 0.5, 0.5,
2, -3.780463, -7.065094, 1, 1.5, 0.5, 0.5,
2, -3.780463, -7.065094, 0, 1.5, 0.5, 0.5,
3, -3.780463, -7.065094, 0, -0.5, 0.5, 0.5,
3, -3.780463, -7.065094, 1, -0.5, 0.5, 0.5,
3, -3.780463, -7.065094, 1, 1.5, 0.5, 0.5,
3, -3.780463, -7.065094, 0, 1.5, 0.5, 0.5
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
-3.325145, -3, -6.213572,
-3.325145, 3, -6.213572,
-3.325145, -3, -6.213572,
-3.497167, -3, -6.497413,
-3.325145, -2, -6.213572,
-3.497167, -2, -6.497413,
-3.325145, -1, -6.213572,
-3.497167, -1, -6.497413,
-3.325145, 0, -6.213572,
-3.497167, 0, -6.497413,
-3.325145, 1, -6.213572,
-3.497167, 1, -6.497413,
-3.325145, 2, -6.213572,
-3.497167, 2, -6.497413,
-3.325145, 3, -6.213572,
-3.497167, 3, -6.497413
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
-3.841211, -3, -7.065094, 0, -0.5, 0.5, 0.5,
-3.841211, -3, -7.065094, 1, -0.5, 0.5, 0.5,
-3.841211, -3, -7.065094, 1, 1.5, 0.5, 0.5,
-3.841211, -3, -7.065094, 0, 1.5, 0.5, 0.5,
-3.841211, -2, -7.065094, 0, -0.5, 0.5, 0.5,
-3.841211, -2, -7.065094, 1, -0.5, 0.5, 0.5,
-3.841211, -2, -7.065094, 1, 1.5, 0.5, 0.5,
-3.841211, -2, -7.065094, 0, 1.5, 0.5, 0.5,
-3.841211, -1, -7.065094, 0, -0.5, 0.5, 0.5,
-3.841211, -1, -7.065094, 1, -0.5, 0.5, 0.5,
-3.841211, -1, -7.065094, 1, 1.5, 0.5, 0.5,
-3.841211, -1, -7.065094, 0, 1.5, 0.5, 0.5,
-3.841211, 0, -7.065094, 0, -0.5, 0.5, 0.5,
-3.841211, 0, -7.065094, 1, -0.5, 0.5, 0.5,
-3.841211, 0, -7.065094, 1, 1.5, 0.5, 0.5,
-3.841211, 0, -7.065094, 0, 1.5, 0.5, 0.5,
-3.841211, 1, -7.065094, 0, -0.5, 0.5, 0.5,
-3.841211, 1, -7.065094, 1, -0.5, 0.5, 0.5,
-3.841211, 1, -7.065094, 1, 1.5, 0.5, 0.5,
-3.841211, 1, -7.065094, 0, 1.5, 0.5, 0.5,
-3.841211, 2, -7.065094, 0, -0.5, 0.5, 0.5,
-3.841211, 2, -7.065094, 1, -0.5, 0.5, 0.5,
-3.841211, 2, -7.065094, 1, 1.5, 0.5, 0.5,
-3.841211, 2, -7.065094, 0, 1.5, 0.5, 0.5,
-3.841211, 3, -7.065094, 0, -0.5, 0.5, 0.5,
-3.841211, 3, -7.065094, 1, -0.5, 0.5, 0.5,
-3.841211, 3, -7.065094, 1, 1.5, 0.5, 0.5,
-3.841211, 3, -7.065094, 0, 1.5, 0.5, 0.5
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
-3.325145, -3.275488, -6,
-3.325145, -3.275488, 4,
-3.325145, -3.275488, -6,
-3.497167, -3.443813, -6,
-3.325145, -3.275488, -4,
-3.497167, -3.443813, -4,
-3.325145, -3.275488, -2,
-3.497167, -3.443813, -2,
-3.325145, -3.275488, 0,
-3.497167, -3.443813, 0,
-3.325145, -3.275488, 2,
-3.497167, -3.443813, 2,
-3.325145, -3.275488, 4,
-3.497167, -3.443813, 4
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
-3.841211, -3.780463, -6, 0, -0.5, 0.5, 0.5,
-3.841211, -3.780463, -6, 1, -0.5, 0.5, 0.5,
-3.841211, -3.780463, -6, 1, 1.5, 0.5, 0.5,
-3.841211, -3.780463, -6, 0, 1.5, 0.5, 0.5,
-3.841211, -3.780463, -4, 0, -0.5, 0.5, 0.5,
-3.841211, -3.780463, -4, 1, -0.5, 0.5, 0.5,
-3.841211, -3.780463, -4, 1, 1.5, 0.5, 0.5,
-3.841211, -3.780463, -4, 0, 1.5, 0.5, 0.5,
-3.841211, -3.780463, -2, 0, -0.5, 0.5, 0.5,
-3.841211, -3.780463, -2, 1, -0.5, 0.5, 0.5,
-3.841211, -3.780463, -2, 1, 1.5, 0.5, 0.5,
-3.841211, -3.780463, -2, 0, 1.5, 0.5, 0.5,
-3.841211, -3.780463, 0, 0, -0.5, 0.5, 0.5,
-3.841211, -3.780463, 0, 1, -0.5, 0.5, 0.5,
-3.841211, -3.780463, 0, 1, 1.5, 0.5, 0.5,
-3.841211, -3.780463, 0, 0, 1.5, 0.5, 0.5,
-3.841211, -3.780463, 2, 0, -0.5, 0.5, 0.5,
-3.841211, -3.780463, 2, 1, -0.5, 0.5, 0.5,
-3.841211, -3.780463, 2, 1, 1.5, 0.5, 0.5,
-3.841211, -3.780463, 2, 0, 1.5, 0.5, 0.5,
-3.841211, -3.780463, 4, 0, -0.5, 0.5, 0.5,
-3.841211, -3.780463, 4, 1, -0.5, 0.5, 0.5,
-3.841211, -3.780463, 4, 1, 1.5, 0.5, 0.5,
-3.841211, -3.780463, 4, 0, 1.5, 0.5, 0.5
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
-3.325145, -3.275488, -6.213572,
-3.325145, 3.457514, -6.213572,
-3.325145, -3.275488, 5.14006,
-3.325145, 3.457514, 5.14006,
-3.325145, -3.275488, -6.213572,
-3.325145, -3.275488, 5.14006,
-3.325145, 3.457514, -6.213572,
-3.325145, 3.457514, 5.14006,
-3.325145, -3.275488, -6.213572,
3.555724, -3.275488, -6.213572,
-3.325145, -3.275488, 5.14006,
3.555724, -3.275488, 5.14006,
-3.325145, 3.457514, -6.213572,
3.555724, 3.457514, -6.213572,
-3.325145, 3.457514, 5.14006,
3.555724, 3.457514, 5.14006,
3.555724, -3.275488, -6.213572,
3.555724, 3.457514, -6.213572,
3.555724, -3.275488, 5.14006,
3.555724, 3.457514, 5.14006,
3.555724, -3.275488, -6.213572,
3.555724, -3.275488, 5.14006,
3.555724, 3.457514, -6.213572,
3.555724, 3.457514, 5.14006
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
var radius = 7.948685;
var distance = 35.3646;
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
mvMatrix.translate( -0.1152893, -0.09101295, 0.5367558 );
mvMatrix.scale( 1.24901, 1.27644, 0.7569625 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.3646);
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
bispyribac-sodium<-read.table("bispyribac-sodium.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-bispyribac-sodium$V2
```

```
## Error in eval(expr, envir, enclos): object 'bispyribac' not found
```

```r
y<-bispyribac-sodium$V3
```

```
## Error in eval(expr, envir, enclos): object 'bispyribac' not found
```

```r
z<-bispyribac-sodium$V4
```

```
## Error in eval(expr, envir, enclos): object 'bispyribac' not found
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
-3.224939, 0.5519864, -2.005232, 0, 0, 1, 1, 1,
-3.096817, 0.4202747, -1.310676, 1, 0, 0, 1, 1,
-3.059668, 0.5403387, -2.309639, 1, 0, 0, 1, 1,
-2.710175, 0.5194635, -0.3467721, 1, 0, 0, 1, 1,
-2.5981, -0.09335858, -2.622558, 1, 0, 0, 1, 1,
-2.577882, 1.36564, -0.336435, 1, 0, 0, 1, 1,
-2.43157, -1.671412, -1.779252, 0, 0, 0, 1, 1,
-2.40157, 0.6598191, -0.6511022, 0, 0, 0, 1, 1,
-2.401425, 0.2465189, -2.065867, 0, 0, 0, 1, 1,
-2.337188, 0.7621915, -0.7024515, 0, 0, 0, 1, 1,
-2.250282, 1.70014, -1.433972, 0, 0, 0, 1, 1,
-2.237109, -1.115536, 0.2437912, 0, 0, 0, 1, 1,
-2.176642, -0.7372612, -2.897294, 0, 0, 0, 1, 1,
-2.160756, 1.644038, -0.1765382, 1, 1, 1, 1, 1,
-2.157385, -0.8938586, -1.886119, 1, 1, 1, 1, 1,
-2.154152, -1.629246, -3.985185, 1, 1, 1, 1, 1,
-2.137672, -1.317872, -3.186719, 1, 1, 1, 1, 1,
-2.044706, -1.714141, -4.432929, 1, 1, 1, 1, 1,
-1.984784, -1.032918, -2.362115, 1, 1, 1, 1, 1,
-1.974942, -0.8981248, -2.921326, 1, 1, 1, 1, 1,
-1.956993, -1.352808, -1.437716, 1, 1, 1, 1, 1,
-1.953556, 0.8806959, -2.954321, 1, 1, 1, 1, 1,
-1.904575, -0.8016006, -0.7957507, 1, 1, 1, 1, 1,
-1.898542, 0.3797615, -1.104678, 1, 1, 1, 1, 1,
-1.862789, 0.0005570469, -2.504829, 1, 1, 1, 1, 1,
-1.853438, -0.4466905, -2.513332, 1, 1, 1, 1, 1,
-1.847027, 0.1059446, -0.4055598, 1, 1, 1, 1, 1,
-1.826205, -0.2768525, -3.347988, 1, 1, 1, 1, 1,
-1.811401, -1.441426, -2.622905, 0, 0, 1, 1, 1,
-1.797479, -1.464165, -1.726251, 1, 0, 0, 1, 1,
-1.789515, 0.5287035, -2.816372, 1, 0, 0, 1, 1,
-1.782531, -1.51462, -2.068613, 1, 0, 0, 1, 1,
-1.76711, -2.112402, -3.479797, 1, 0, 0, 1, 1,
-1.762476, 0.1462168, -1.866685, 1, 0, 0, 1, 1,
-1.761475, -0.354254, -3.624479, 0, 0, 0, 1, 1,
-1.748348, 1.454628, -2.470269, 0, 0, 0, 1, 1,
-1.728921, 1.327046, -0.7546694, 0, 0, 0, 1, 1,
-1.72113, -0.8465615, -1.814898, 0, 0, 0, 1, 1,
-1.696994, 0.4228695, -1.737778, 0, 0, 0, 1, 1,
-1.690803, -1.368444, -3.977346, 0, 0, 0, 1, 1,
-1.690391, 2.050965, -0.01377057, 0, 0, 0, 1, 1,
-1.69005, -0.3233793, -2.220273, 1, 1, 1, 1, 1,
-1.689924, 0.08317335, -0.6891775, 1, 1, 1, 1, 1,
-1.68688, -0.1056571, -0.7347323, 1, 1, 1, 1, 1,
-1.675645, -0.2138473, -1.579674, 1, 1, 1, 1, 1,
-1.66204, 2.162876, 1.134519, 1, 1, 1, 1, 1,
-1.65393, -2.075951, -3.90924, 1, 1, 1, 1, 1,
-1.643378, 0.8044237, -1.817204, 1, 1, 1, 1, 1,
-1.642941, -1.370248, -1.620272, 1, 1, 1, 1, 1,
-1.64152, 0.2504555, -2.818543, 1, 1, 1, 1, 1,
-1.611655, -1.409791, -2.460326, 1, 1, 1, 1, 1,
-1.600194, -0.8441788, -2.078968, 1, 1, 1, 1, 1,
-1.589014, -0.008649956, -3.339685, 1, 1, 1, 1, 1,
-1.565019, -0.5929526, -3.014287, 1, 1, 1, 1, 1,
-1.510494, -0.5602607, -1.859427, 1, 1, 1, 1, 1,
-1.508814, 0.9665135, -1.098021, 1, 1, 1, 1, 1,
-1.505388, -0.01920208, -0.8403718, 0, 0, 1, 1, 1,
-1.495244, 1.40958, -0.9509307, 1, 0, 0, 1, 1,
-1.487571, -0.02194716, -2.965557, 1, 0, 0, 1, 1,
-1.484041, -1.07515, -3.118245, 1, 0, 0, 1, 1,
-1.478476, -0.4512345, -2.265908, 1, 0, 0, 1, 1,
-1.477232, 0.2543775, -2.568746, 1, 0, 0, 1, 1,
-1.476282, 0.9629579, 0.4772415, 0, 0, 0, 1, 1,
-1.467832, -0.8622547, -2.571258, 0, 0, 0, 1, 1,
-1.452357, -0.5159547, -1.212298, 0, 0, 0, 1, 1,
-1.447583, 0.7837979, -0.1292475, 0, 0, 0, 1, 1,
-1.438722, 0.5375198, -2.696006, 0, 0, 0, 1, 1,
-1.438408, 0.3580692, -1.66215, 0, 0, 0, 1, 1,
-1.435207, 0.6883383, -1.453388, 0, 0, 0, 1, 1,
-1.431182, -1.446795, -2.598025, 1, 1, 1, 1, 1,
-1.428913, 0.3548527, -1.653464, 1, 1, 1, 1, 1,
-1.421153, -0.6380105, -3.00755, 1, 1, 1, 1, 1,
-1.417222, 0.8594784, -0.8080407, 1, 1, 1, 1, 1,
-1.412725, 0.526112, -0.348671, 1, 1, 1, 1, 1,
-1.394034, -0.2677776, -1.117432, 1, 1, 1, 1, 1,
-1.38379, 1.001021, -1.357449, 1, 1, 1, 1, 1,
-1.379808, 0.2343013, -3.924198, 1, 1, 1, 1, 1,
-1.379069, -0.4124302, -1.898569, 1, 1, 1, 1, 1,
-1.37012, 0.08371498, -0.9460846, 1, 1, 1, 1, 1,
-1.368694, -0.9556619, -1.491005, 1, 1, 1, 1, 1,
-1.351018, -1.151486, -0.4950985, 1, 1, 1, 1, 1,
-1.348421, 1.77287, -0.8368478, 1, 1, 1, 1, 1,
-1.343799, -0.6899816, -2.334763, 1, 1, 1, 1, 1,
-1.339464, -0.1134473, -0.9057836, 1, 1, 1, 1, 1,
-1.339173, -0.4013667, -1.016323, 0, 0, 1, 1, 1,
-1.33744, -0.3856334, -2.317554, 1, 0, 0, 1, 1,
-1.329822, 0.3770642, 0.8763985, 1, 0, 0, 1, 1,
-1.320216, -0.08451831, -3.053385, 1, 0, 0, 1, 1,
-1.312822, -0.1829651, -3.445698, 1, 0, 0, 1, 1,
-1.308573, -1.434615, -0.3509192, 1, 0, 0, 1, 1,
-1.307773, 0.6865653, -1.094925, 0, 0, 0, 1, 1,
-1.291888, -0.2706549, -2.685509, 0, 0, 0, 1, 1,
-1.288396, 0.6486861, 0.01782941, 0, 0, 0, 1, 1,
-1.283908, 0.5803446, -1.875536, 0, 0, 0, 1, 1,
-1.270446, -1.310761, -4.756729, 0, 0, 0, 1, 1,
-1.260044, 0.3560474, -0.5479744, 0, 0, 0, 1, 1,
-1.246483, -0.1235902, -6.048228, 0, 0, 0, 1, 1,
-1.240048, 0.8163946, -1.280123, 1, 1, 1, 1, 1,
-1.235492, 0.268126, -1.745436, 1, 1, 1, 1, 1,
-1.234142, -0.599541, -1.028522, 1, 1, 1, 1, 1,
-1.231836, -0.2597958, 0.712818, 1, 1, 1, 1, 1,
-1.231791, 2.139734, -1.960136, 1, 1, 1, 1, 1,
-1.22628, -0.1383675, -1.917171, 1, 1, 1, 1, 1,
-1.226161, -0.1001085, -1.613173, 1, 1, 1, 1, 1,
-1.225269, -0.9331018, -3.415611, 1, 1, 1, 1, 1,
-1.222914, -0.9758533, -2.268186, 1, 1, 1, 1, 1,
-1.215265, 1.738139, -1.535917, 1, 1, 1, 1, 1,
-1.213123, -0.7037396, -2.5295, 1, 1, 1, 1, 1,
-1.212822, -0.4759333, -3.642436, 1, 1, 1, 1, 1,
-1.201852, 1.087765, 0.05001749, 1, 1, 1, 1, 1,
-1.201847, -0.8298756, -2.298038, 1, 1, 1, 1, 1,
-1.197694, -0.05940766, -2.510484, 1, 1, 1, 1, 1,
-1.196449, 1.513854, -0.8887224, 0, 0, 1, 1, 1,
-1.196174, -0.1551163, -0.3562725, 1, 0, 0, 1, 1,
-1.192687, 1.664454, -1.283085, 1, 0, 0, 1, 1,
-1.19185, 1.216956, -0.270122, 1, 0, 0, 1, 1,
-1.191709, 1.948664, 0.3734363, 1, 0, 0, 1, 1,
-1.189776, 1.338711, 0.558655, 1, 0, 0, 1, 1,
-1.166259, 0.4456587, -1.78134, 0, 0, 0, 1, 1,
-1.16094, -0.1158912, -2.81553, 0, 0, 0, 1, 1,
-1.159315, -1.311486, -2.998927, 0, 0, 0, 1, 1,
-1.158297, 1.744882, -1.03601, 0, 0, 0, 1, 1,
-1.151814, -1.221516, -2.080997, 0, 0, 0, 1, 1,
-1.136403, 0.9547799, -0.9622997, 0, 0, 0, 1, 1,
-1.129194, 1.233376, -0.9148201, 0, 0, 0, 1, 1,
-1.125688, -0.1665209, -0.08137503, 1, 1, 1, 1, 1,
-1.09781, 1.000537, -1.176368, 1, 1, 1, 1, 1,
-1.088476, 1.019826, 0.5769197, 1, 1, 1, 1, 1,
-1.086105, 1.296301, -0.3685719, 1, 1, 1, 1, 1,
-1.085037, -0.07042211, -0.2198909, 1, 1, 1, 1, 1,
-1.076676, 1.54629, -2.840333, 1, 1, 1, 1, 1,
-1.075601, -0.8341181, -3.079668, 1, 1, 1, 1, 1,
-1.06937, 0.8492416, -2.014862, 1, 1, 1, 1, 1,
-1.067386, -1.950929, -1.49183, 1, 1, 1, 1, 1,
-1.054142, 1.134781, -0.08607909, 1, 1, 1, 1, 1,
-1.047125, -0.1738923, -3.108794, 1, 1, 1, 1, 1,
-1.045984, 0.8153251, -0.6926522, 1, 1, 1, 1, 1,
-1.045741, -0.8315886, -1.229537, 1, 1, 1, 1, 1,
-1.044393, -0.4412232, -0.8911834, 1, 1, 1, 1, 1,
-1.035315, 0.516806, 0.4539607, 1, 1, 1, 1, 1,
-1.035094, 0.7152945, -0.7970676, 0, 0, 1, 1, 1,
-1.030754, -0.6995568, -1.59781, 1, 0, 0, 1, 1,
-1.029931, 1.106309, 0.1507071, 1, 0, 0, 1, 1,
-1.027516, -0.7617356, -1.86988, 1, 0, 0, 1, 1,
-1.019657, -0.3130243, -2.145643, 1, 0, 0, 1, 1,
-1.019641, 0.9120152, -0.7268313, 1, 0, 0, 1, 1,
-1.010001, 0.3548322, -1.541973, 0, 0, 0, 1, 1,
-1.008952, 1.450891, -0.8128803, 0, 0, 0, 1, 1,
-1.004503, 0.7006854, -1.984417, 0, 0, 0, 1, 1,
-1.001584, 1.765035, -1.34437, 0, 0, 0, 1, 1,
-1.000594, 0.94621, 0.6413613, 0, 0, 0, 1, 1,
-0.9927922, 0.1731194, -2.174284, 0, 0, 0, 1, 1,
-0.9919465, -2.09361, -2.7984, 0, 0, 0, 1, 1,
-0.9915056, -0.1713684, -1.496494, 1, 1, 1, 1, 1,
-0.9848654, 1.687481, -2.652841, 1, 1, 1, 1, 1,
-0.9793327, 0.9809753, -2.231682, 1, 1, 1, 1, 1,
-0.9790821, -1.818201, -1.699923, 1, 1, 1, 1, 1,
-0.9657772, -0.6956761, -1.733293, 1, 1, 1, 1, 1,
-0.9654016, -0.7688829, -4.201273, 1, 1, 1, 1, 1,
-0.9652379, -0.4092597, -3.225613, 1, 1, 1, 1, 1,
-0.953806, 0.7648099, -0.4384717, 1, 1, 1, 1, 1,
-0.9527985, -0.21763, -0.1613113, 1, 1, 1, 1, 1,
-0.9502136, 0.7545457, -1.435791, 1, 1, 1, 1, 1,
-0.9436811, 0.3977118, -2.028657, 1, 1, 1, 1, 1,
-0.9390881, -1.118539, -0.4943548, 1, 1, 1, 1, 1,
-0.9327103, -0.5374367, -1.926398, 1, 1, 1, 1, 1,
-0.9288844, -0.9910641, -1.399546, 1, 1, 1, 1, 1,
-0.9185886, -1.508611, -3.583839, 1, 1, 1, 1, 1,
-0.9130867, 1.049349, 0.1883602, 0, 0, 1, 1, 1,
-0.9130214, 0.8989981, -1.638548, 1, 0, 0, 1, 1,
-0.9087285, 1.697463, -0.148882, 1, 0, 0, 1, 1,
-0.9072374, -1.206712, -1.441975, 1, 0, 0, 1, 1,
-0.9025067, -0.1449864, -2.516487, 1, 0, 0, 1, 1,
-0.9015378, 0.1982561, -1.36768, 1, 0, 0, 1, 1,
-0.8971202, -0.8361326, -2.154961, 0, 0, 0, 1, 1,
-0.8904203, -0.6242278, -3.083981, 0, 0, 0, 1, 1,
-0.8853257, 0.7317318, -0.5981471, 0, 0, 0, 1, 1,
-0.8841516, 2.016968, -0.6902143, 0, 0, 0, 1, 1,
-0.8681714, 1.796961, -1.054783, 0, 0, 0, 1, 1,
-0.8652606, 0.1712531, -0.8250293, 0, 0, 0, 1, 1,
-0.8620067, -0.2261538, -1.931792, 0, 0, 0, 1, 1,
-0.8588334, -0.200535, -0.04676726, 1, 1, 1, 1, 1,
-0.8573421, -0.4661456, -0.5617601, 1, 1, 1, 1, 1,
-0.8556693, -3.081574, -3.005692, 1, 1, 1, 1, 1,
-0.8544732, -0.6691823, -2.764221, 1, 1, 1, 1, 1,
-0.8480566, -0.07264324, -0.7192065, 1, 1, 1, 1, 1,
-0.8447903, -0.3054338, -2.511109, 1, 1, 1, 1, 1,
-0.8384203, -0.1403182, -1.940282, 1, 1, 1, 1, 1,
-0.8350343, -0.04258449, -2.463297, 1, 1, 1, 1, 1,
-0.8344535, 0.08194803, -0.2915877, 1, 1, 1, 1, 1,
-0.8302448, -1.598269, -2.779302, 1, 1, 1, 1, 1,
-0.8298253, -0.2551209, -0.4186875, 1, 1, 1, 1, 1,
-0.8262882, 0.05538663, 0.05343303, 1, 1, 1, 1, 1,
-0.8261638, -1.418128, -3.44982, 1, 1, 1, 1, 1,
-0.8210624, -0.2069923, -1.806219, 1, 1, 1, 1, 1,
-0.8209189, -1.585054, -1.764729, 1, 1, 1, 1, 1,
-0.8208429, -0.2846753, -2.140209, 0, 0, 1, 1, 1,
-0.8157476, -0.7003654, -2.489057, 1, 0, 0, 1, 1,
-0.8149086, 0.3789344, 0.8186604, 1, 0, 0, 1, 1,
-0.8066725, 0.6630533, -1.949592, 1, 0, 0, 1, 1,
-0.7952292, 1.474252, 0.5525146, 1, 0, 0, 1, 1,
-0.7949044, -2.079093, -2.832641, 1, 0, 0, 1, 1,
-0.7936113, 1.059958, -1.458222, 0, 0, 0, 1, 1,
-0.7878309, 0.1555557, -0.3845139, 0, 0, 0, 1, 1,
-0.7833903, 1.216235, 0.2362557, 0, 0, 0, 1, 1,
-0.782604, -0.147196, -1.794999, 0, 0, 0, 1, 1,
-0.7807834, -0.4695393, -3.569945, 0, 0, 0, 1, 1,
-0.7768763, -0.3127371, -2.90455, 0, 0, 0, 1, 1,
-0.7657302, 1.14257, 0.4472105, 0, 0, 0, 1, 1,
-0.7607762, 1.218015, -1.443919, 1, 1, 1, 1, 1,
-0.7473514, -0.1281999, -0.5966499, 1, 1, 1, 1, 1,
-0.7439259, 0.7976781, -0.1828181, 1, 1, 1, 1, 1,
-0.7431941, -0.1195399, -1.03191, 1, 1, 1, 1, 1,
-0.7420518, 0.2587755, -1.440318, 1, 1, 1, 1, 1,
-0.7405158, 1.077176, -0.3430048, 1, 1, 1, 1, 1,
-0.7398051, 1.675257, -1.534256, 1, 1, 1, 1, 1,
-0.7394952, 0.7648619, 0.6632016, 1, 1, 1, 1, 1,
-0.7376046, 0.1260496, 0.1923161, 1, 1, 1, 1, 1,
-0.7362468, -0.4229225, -2.731, 1, 1, 1, 1, 1,
-0.7271718, -0.1146794, -3.809873, 1, 1, 1, 1, 1,
-0.7264317, 0.5704306, -2.684073, 1, 1, 1, 1, 1,
-0.7186514, -1.899598, -3.705682, 1, 1, 1, 1, 1,
-0.7136526, 0.2004046, -2.588449, 1, 1, 1, 1, 1,
-0.7084958, -1.506391, -0.6427897, 1, 1, 1, 1, 1,
-0.7015021, -0.1797788, -1.983279, 0, 0, 1, 1, 1,
-0.700148, -1.010117, -2.321773, 1, 0, 0, 1, 1,
-0.6984198, 1.784138, -0.8464901, 1, 0, 0, 1, 1,
-0.6980825, -0.5689918, -0.0896832, 1, 0, 0, 1, 1,
-0.6930866, -1.087236, -3.049045, 1, 0, 0, 1, 1,
-0.6894789, 0.03763373, -0.2651714, 1, 0, 0, 1, 1,
-0.6885654, 0.07790939, -0.7364047, 0, 0, 0, 1, 1,
-0.6837869, 1.30675, 1.183261, 0, 0, 0, 1, 1,
-0.6815091, -0.6758461, -2.617094, 0, 0, 0, 1, 1,
-0.6739306, -0.5236326, -1.019941, 0, 0, 0, 1, 1,
-0.6733114, -2.8501, -0.8128468, 0, 0, 0, 1, 1,
-0.6688635, -2.908741, -4.538281, 0, 0, 0, 1, 1,
-0.6671138, 0.4339133, -2.240104, 0, 0, 0, 1, 1,
-0.6650931, -0.350596, -1.588933, 1, 1, 1, 1, 1,
-0.6606897, -1.467896, -2.465865, 1, 1, 1, 1, 1,
-0.660051, 2.371962, -0.4401852, 1, 1, 1, 1, 1,
-0.6570122, -0.4310194, -3.708748, 1, 1, 1, 1, 1,
-0.651619, -0.3803117, -0.6073785, 1, 1, 1, 1, 1,
-0.6497263, -0.6343801, -2.114646, 1, 1, 1, 1, 1,
-0.6472175, 0.8416371, -0.8288205, 1, 1, 1, 1, 1,
-0.6464927, -1.430929, -3.513492, 1, 1, 1, 1, 1,
-0.6421875, -0.7026673, -1.377934, 1, 1, 1, 1, 1,
-0.6382813, 0.03205456, -1.193171, 1, 1, 1, 1, 1,
-0.6372808, -1.211277, -2.457045, 1, 1, 1, 1, 1,
-0.6350378, -1.432042, -3.740641, 1, 1, 1, 1, 1,
-0.6341078, -1.559674, -2.343278, 1, 1, 1, 1, 1,
-0.6339654, 3.359461, 1.619823, 1, 1, 1, 1, 1,
-0.6311043, 0.02853439, -1.282568, 1, 1, 1, 1, 1,
-0.6302857, -0.8433905, -2.514788, 0, 0, 1, 1, 1,
-0.6220298, 1.348518, -1.075611, 1, 0, 0, 1, 1,
-0.6184006, -1.867267, -3.811078, 1, 0, 0, 1, 1,
-0.6166648, -0.5764409, -1.764163, 1, 0, 0, 1, 1,
-0.6129557, 0.292972, -2.964578, 1, 0, 0, 1, 1,
-0.6107106, -0.6950506, -4.740339, 1, 0, 0, 1, 1,
-0.6069255, 0.5484912, -0.7006998, 0, 0, 0, 1, 1,
-0.6060922, 1.572382, -0.5095488, 0, 0, 0, 1, 1,
-0.6026219, 0.5856361, -1.775814, 0, 0, 0, 1, 1,
-0.6001837, 1.61602, -2.741507, 0, 0, 0, 1, 1,
-0.5994864, -0.8788707, -2.640362, 0, 0, 0, 1, 1,
-0.5968989, -0.9504828, -1.556267, 0, 0, 0, 1, 1,
-0.5950688, 0.5405264, -2.381637, 0, 0, 0, 1, 1,
-0.5933643, 0.9947717, -0.7375246, 1, 1, 1, 1, 1,
-0.5900911, 0.6515869, 0.8994655, 1, 1, 1, 1, 1,
-0.5899778, -0.3190409, -2.811132, 1, 1, 1, 1, 1,
-0.582168, 0.07819041, -2.18511, 1, 1, 1, 1, 1,
-0.5777848, -0.194496, -2.04784, 1, 1, 1, 1, 1,
-0.5764573, -0.3953722, -2.381256, 1, 1, 1, 1, 1,
-0.5729104, -0.551776, -2.660711, 1, 1, 1, 1, 1,
-0.5723338, -1.101053, -2.910491, 1, 1, 1, 1, 1,
-0.5679699, -0.1765929, -1.856189, 1, 1, 1, 1, 1,
-0.567714, -0.3641238, -0.7288485, 1, 1, 1, 1, 1,
-0.5672163, 0.07182956, -0.9908359, 1, 1, 1, 1, 1,
-0.5667453, -0.4570923, -3.532537, 1, 1, 1, 1, 1,
-0.559298, -0.8405033, -3.445331, 1, 1, 1, 1, 1,
-0.5592699, -0.4380097, -2.339229, 1, 1, 1, 1, 1,
-0.5575238, 1.162652, -0.9221625, 1, 1, 1, 1, 1,
-0.5550756, -0.03854778, -0.7433845, 0, 0, 1, 1, 1,
-0.5546373, -0.4613453, -1.665862, 1, 0, 0, 1, 1,
-0.5529832, -1.115386, -2.086254, 1, 0, 0, 1, 1,
-0.5496751, 0.3406718, -0.2909227, 1, 0, 0, 1, 1,
-0.5485162, 1.605281, -0.6011371, 1, 0, 0, 1, 1,
-0.5423084, 0.8817796, -0.634903, 1, 0, 0, 1, 1,
-0.5383454, -0.4644595, -2.902924, 0, 0, 0, 1, 1,
-0.5358584, -1.663649, -3.272224, 0, 0, 0, 1, 1,
-0.5344111, -0.4666739, -0.8874792, 0, 0, 0, 1, 1,
-0.5323064, 0.6902174, 0.1859156, 0, 0, 0, 1, 1,
-0.5189534, -0.1571676, -2.535147, 0, 0, 0, 1, 1,
-0.5176534, 0.4992476, -0.2018953, 0, 0, 0, 1, 1,
-0.5145212, -0.4954175, -1.630346, 0, 0, 0, 1, 1,
-0.5113735, 0.1201383, -1.207338, 1, 1, 1, 1, 1,
-0.5097133, -0.6648372, -1.913152, 1, 1, 1, 1, 1,
-0.5083875, -0.9908307, -4.608561, 1, 1, 1, 1, 1,
-0.5033328, -2.130206, -4.932323, 1, 1, 1, 1, 1,
-0.5003625, 1.025276, -1.873179, 1, 1, 1, 1, 1,
-0.5002396, -0.9462295, -3.185902, 1, 1, 1, 1, 1,
-0.4986889, -0.5971667, -5.011502, 1, 1, 1, 1, 1,
-0.4966538, 0.6910976, -1.087821, 1, 1, 1, 1, 1,
-0.4858316, -1.541571, -3.226914, 1, 1, 1, 1, 1,
-0.485643, 1.272955, 1.560129, 1, 1, 1, 1, 1,
-0.48144, 0.7987868, 0.4285669, 1, 1, 1, 1, 1,
-0.4790779, -0.6175584, -1.303152, 1, 1, 1, 1, 1,
-0.477575, -0.3910281, -3.18878, 1, 1, 1, 1, 1,
-0.4769732, -2.05796, -0.9131358, 1, 1, 1, 1, 1,
-0.4752777, -0.2455465, -1.85112, 1, 1, 1, 1, 1,
-0.4723106, -0.01261982, -1.859154, 0, 0, 1, 1, 1,
-0.4713615, 0.7365143, -1.388235, 1, 0, 0, 1, 1,
-0.4657096, 0.7856458, -0.9033421, 1, 0, 0, 1, 1,
-0.4615621, 1.262156, -2.166257, 1, 0, 0, 1, 1,
-0.4582235, 1.465562, -1.563166, 1, 0, 0, 1, 1,
-0.4565344, 1.142003, -1.583272, 1, 0, 0, 1, 1,
-0.456017, 0.1061271, -2.264184, 0, 0, 0, 1, 1,
-0.4501583, 0.5762029, 0.003324187, 0, 0, 0, 1, 1,
-0.4448579, 0.3379744, -0.7348191, 0, 0, 0, 1, 1,
-0.4435149, 0.06587742, -3.133654, 0, 0, 0, 1, 1,
-0.4422927, 0.9381062, -0.3178722, 0, 0, 0, 1, 1,
-0.440246, 0.9569326, -0.9511591, 0, 0, 0, 1, 1,
-0.4384404, -0.270502, -3.213822, 0, 0, 0, 1, 1,
-0.4286128, 0.1717656, -0.003877258, 1, 1, 1, 1, 1,
-0.4278101, -1.039545, -3.647864, 1, 1, 1, 1, 1,
-0.4262455, 0.3633114, -0.9204468, 1, 1, 1, 1, 1,
-0.4256749, -0.4218035, -1.670743, 1, 1, 1, 1, 1,
-0.4207334, -0.9501564, -0.8238453, 1, 1, 1, 1, 1,
-0.4137754, 0.5626167, -0.9810494, 1, 1, 1, 1, 1,
-0.4128428, -1.302381, -1.716799, 1, 1, 1, 1, 1,
-0.4121411, 0.5270707, -0.4528836, 1, 1, 1, 1, 1,
-0.4119134, -0.8564878, -1.774169, 1, 1, 1, 1, 1,
-0.4066104, -1.234351, -2.911396, 1, 1, 1, 1, 1,
-0.4055716, 0.6668829, -1.107282, 1, 1, 1, 1, 1,
-0.4022838, 0.42818, -0.6900862, 1, 1, 1, 1, 1,
-0.3886353, 1.10455, -1.078872, 1, 1, 1, 1, 1,
-0.386531, 0.1742611, -1.613366, 1, 1, 1, 1, 1,
-0.3822778, -2.392207, -2.727518, 1, 1, 1, 1, 1,
-0.3790486, -1.757572, -2.660671, 0, 0, 1, 1, 1,
-0.3763035, 0.1639845, -1.693345, 1, 0, 0, 1, 1,
-0.3735293, -1.653138, -1.389464, 1, 0, 0, 1, 1,
-0.3727867, -0.8452441, -3.040054, 1, 0, 0, 1, 1,
-0.3722911, 0.6915747, -1.941832, 1, 0, 0, 1, 1,
-0.3714157, -1.043911, -2.220338, 1, 0, 0, 1, 1,
-0.3709992, 0.2336099, -0.5317229, 0, 0, 0, 1, 1,
-0.3669754, -1.308804, -2.270726, 0, 0, 0, 1, 1,
-0.366114, 1.269176, -0.4641349, 0, 0, 0, 1, 1,
-0.3644343, -1.694016, -0.5679416, 0, 0, 0, 1, 1,
-0.3632169, 0.6245273, -0.2147161, 0, 0, 0, 1, 1,
-0.3527533, 1.649294, -1.358349, 0, 0, 0, 1, 1,
-0.3513621, -0.8993671, -3.205301, 0, 0, 0, 1, 1,
-0.3510857, -0.9392424, -2.971576, 1, 1, 1, 1, 1,
-0.3510377, -1.145913, -3.183717, 1, 1, 1, 1, 1,
-0.3499965, 0.7243159, -0.8869074, 1, 1, 1, 1, 1,
-0.3496727, 0.6144307, -1.24133, 1, 1, 1, 1, 1,
-0.3486027, -0.2799957, -2.869708, 1, 1, 1, 1, 1,
-0.3478215, 0.7132432, 0.06952824, 1, 1, 1, 1, 1,
-0.3449967, -0.4325594, -2.970483, 1, 1, 1, 1, 1,
-0.3436898, -0.4932544, -2.347727, 1, 1, 1, 1, 1,
-0.3393954, -1.151724, -0.8801517, 1, 1, 1, 1, 1,
-0.3321616, -0.8367484, -2.629131, 1, 1, 1, 1, 1,
-0.3289059, -0.02423144, -2.317487, 1, 1, 1, 1, 1,
-0.3287195, -2.107796, -3.04944, 1, 1, 1, 1, 1,
-0.3258001, -0.6505311, -2.355084, 1, 1, 1, 1, 1,
-0.3220572, 0.4286346, 0.4115316, 1, 1, 1, 1, 1,
-0.3181551, -1.640237, -2.27623, 1, 1, 1, 1, 1,
-0.3164046, 0.1506298, -0.6953768, 0, 0, 1, 1, 1,
-0.3141833, 1.94313, 0.2635307, 1, 0, 0, 1, 1,
-0.3132053, -1.181356, -1.086851, 1, 0, 0, 1, 1,
-0.3083698, -1.517365, -1.980991, 1, 0, 0, 1, 1,
-0.3083047, -0.3810702, -2.207746, 1, 0, 0, 1, 1,
-0.3061252, -0.9645718, -3.641935, 1, 0, 0, 1, 1,
-0.3028015, -0.9557732, -2.152627, 0, 0, 0, 1, 1,
-0.3012131, -0.6056647, -2.70026, 0, 0, 0, 1, 1,
-0.290135, -0.4122411, -1.009933, 0, 0, 0, 1, 1,
-0.2883646, 0.3271926, -1.375583, 0, 0, 0, 1, 1,
-0.2867746, -1.156215, -3.347367, 0, 0, 0, 1, 1,
-0.2796046, -0.3268968, -1.916939, 0, 0, 0, 1, 1,
-0.2787366, -0.4746218, -3.214929, 0, 0, 0, 1, 1,
-0.2766076, 0.00792136, -2.889429, 1, 1, 1, 1, 1,
-0.275513, -0.6280385, -0.139783, 1, 1, 1, 1, 1,
-0.271192, -0.9735997, -3.368505, 1, 1, 1, 1, 1,
-0.2694783, -0.6948017, -3.261795, 1, 1, 1, 1, 1,
-0.269324, -1.510439, -3.442421, 1, 1, 1, 1, 1,
-0.267591, 0.1719064, -0.06263433, 1, 1, 1, 1, 1,
-0.2617164, -0.2964308, -2.481749, 1, 1, 1, 1, 1,
-0.2616618, -0.6609603, -3.026885, 1, 1, 1, 1, 1,
-0.2583582, 0.01850164, -2.578916, 1, 1, 1, 1, 1,
-0.2579822, 0.258473, -0.03902034, 1, 1, 1, 1, 1,
-0.2572, 0.6590784, 0.3020619, 1, 1, 1, 1, 1,
-0.24354, 1.484706, 0.5124896, 1, 1, 1, 1, 1,
-0.2419831, 0.4769675, 0.1470709, 1, 1, 1, 1, 1,
-0.2391424, 0.1439069, -0.7275314, 1, 1, 1, 1, 1,
-0.2355785, -0.8768373, -0.7695812, 1, 1, 1, 1, 1,
-0.2354382, 2.099446, 0.454096, 0, 0, 1, 1, 1,
-0.2347525, 1.106328, 1.654059, 1, 0, 0, 1, 1,
-0.232375, -0.3279851, -3.952058, 1, 0, 0, 1, 1,
-0.2303677, -1.081649, -3.718101, 1, 0, 0, 1, 1,
-0.2238684, 0.1882785, -1.459495, 1, 0, 0, 1, 1,
-0.2221134, 1.639557, -0.6251078, 1, 0, 0, 1, 1,
-0.2165689, -1.654254, -2.490051, 0, 0, 0, 1, 1,
-0.2147805, 0.9296124, -1.099062, 0, 0, 0, 1, 1,
-0.2137725, 0.7573847, 2.14928, 0, 0, 0, 1, 1,
-0.2090386, -0.325854, -3.517684, 0, 0, 0, 1, 1,
-0.2084689, -2.06162, -4.306892, 0, 0, 0, 1, 1,
-0.2079457, 0.1580876, -1.205185, 0, 0, 0, 1, 1,
-0.2071369, -0.05113407, -2.411147, 0, 0, 0, 1, 1,
-0.2062257, -0.07959516, -2.820252, 1, 1, 1, 1, 1,
-0.2054364, 1.215389, 1.847279, 1, 1, 1, 1, 1,
-0.2035433, -2.139353, -1.180021, 1, 1, 1, 1, 1,
-0.193315, -0.6223446, -3.505562, 1, 1, 1, 1, 1,
-0.1789057, -0.6668602, -0.9239385, 1, 1, 1, 1, 1,
-0.1764515, 1.746909, -1.031012, 1, 1, 1, 1, 1,
-0.1764369, 0.381701, -1.073147, 1, 1, 1, 1, 1,
-0.1751135, -0.8531456, -1.803975, 1, 1, 1, 1, 1,
-0.1745992, 0.2947976, 0.7541809, 1, 1, 1, 1, 1,
-0.171702, -0.07507998, -0.8779831, 1, 1, 1, 1, 1,
-0.1700568, 0.4276704, 0.4278697, 1, 1, 1, 1, 1,
-0.1680707, 1.555544, 0.3753215, 1, 1, 1, 1, 1,
-0.1600671, 0.2300498, -2.355651, 1, 1, 1, 1, 1,
-0.154219, -1.757974, -3.70526, 1, 1, 1, 1, 1,
-0.1537765, 0.8124897, 0.02228225, 1, 1, 1, 1, 1,
-0.1486729, -0.02170715, -2.35034, 0, 0, 1, 1, 1,
-0.1455689, 2.26388, 0.2267281, 1, 0, 0, 1, 1,
-0.1442066, 0.2712886, -1.158278, 1, 0, 0, 1, 1,
-0.1418451, 0.6220607, 0.6022614, 1, 0, 0, 1, 1,
-0.1403739, -0.3968279, -3.059465, 1, 0, 0, 1, 1,
-0.1399247, 0.2182182, -2.044482, 1, 0, 0, 1, 1,
-0.1392694, -1.009297, -3.241012, 0, 0, 0, 1, 1,
-0.1391474, 1.467879, -0.3123589, 0, 0, 0, 1, 1,
-0.1367648, 0.1705796, -1.201862, 0, 0, 0, 1, 1,
-0.1360491, 0.5420756, -1.627498, 0, 0, 0, 1, 1,
-0.135407, -1.281708, -4.199306, 0, 0, 0, 1, 1,
-0.1323187, -0.9596437, -3.147841, 0, 0, 0, 1, 1,
-0.1314769, 0.636254, -1.119845, 0, 0, 0, 1, 1,
-0.1297395, -1.151885, -4.029458, 1, 1, 1, 1, 1,
-0.1279583, 0.3132468, 0.5076377, 1, 1, 1, 1, 1,
-0.1252847, 0.6099517, -0.3525182, 1, 1, 1, 1, 1,
-0.1139699, 1.23665, -0.04697069, 1, 1, 1, 1, 1,
-0.1121121, 1.229822, 0.2374309, 1, 1, 1, 1, 1,
-0.1112849, -0.3014611, -2.499119, 1, 1, 1, 1, 1,
-0.1080691, 0.7385859, -0.03639517, 1, 1, 1, 1, 1,
-0.1072088, 0.2225187, 0.7779006, 1, 1, 1, 1, 1,
-0.1056791, -0.8431827, -3.86256, 1, 1, 1, 1, 1,
-0.1038452, -0.1969623, -2.768542, 1, 1, 1, 1, 1,
-0.1027752, -0.1733811, -1.298735, 1, 1, 1, 1, 1,
-0.1027743, 1.012432, 1.248044, 1, 1, 1, 1, 1,
-0.1013, -1.037855, -3.994181, 1, 1, 1, 1, 1,
-0.09932543, 0.2683583, -0.8509571, 1, 1, 1, 1, 1,
-0.09893098, 2.357628, 0.4430974, 1, 1, 1, 1, 1,
-0.09866508, -0.7385646, -4.564543, 0, 0, 1, 1, 1,
-0.09763266, -0.8997835, -1.174227, 1, 0, 0, 1, 1,
-0.09691586, 0.5485188, 0.2080405, 1, 0, 0, 1, 1,
-0.09600134, 0.09862328, 0.2035931, 1, 0, 0, 1, 1,
-0.08934626, 0.5627149, 0.9170552, 1, 0, 0, 1, 1,
-0.0867373, -0.2080693, -2.886064, 1, 0, 0, 1, 1,
-0.08345724, 0.1290855, -0.8803334, 0, 0, 0, 1, 1,
-0.08317526, -0.5651063, -2.430726, 0, 0, 0, 1, 1,
-0.08024023, 1.693442, 0.6180462, 0, 0, 0, 1, 1,
-0.07734808, 1.05262, 0.3459443, 0, 0, 0, 1, 1,
-0.07704238, 1.884769, -2.019314, 0, 0, 0, 1, 1,
-0.07529595, -0.480583, -1.991289, 0, 0, 0, 1, 1,
-0.07412344, -0.2242279, -4.131502, 0, 0, 0, 1, 1,
-0.07029068, 0.1258, -0.3221838, 1, 1, 1, 1, 1,
-0.06979299, 0.03227823, -1.06756, 1, 1, 1, 1, 1,
-0.06716028, 0.1427764, -2.317707, 1, 1, 1, 1, 1,
-0.06612529, -0.6665048, -0.661845, 1, 1, 1, 1, 1,
-0.06610541, -1.352861, -3.217614, 1, 1, 1, 1, 1,
-0.06467453, -0.975741, -3.062787, 1, 1, 1, 1, 1,
-0.06399414, 0.8234286, -1.400905, 1, 1, 1, 1, 1,
-0.06101048, -0.03380932, -0.7776636, 1, 1, 1, 1, 1,
-0.06049509, 0.761577, 1.387348, 1, 1, 1, 1, 1,
-0.0595809, 1.878963, -0.04274795, 1, 1, 1, 1, 1,
-0.05646243, -0.1032323, -3.879745, 1, 1, 1, 1, 1,
-0.05433528, 0.8609293, 0.6563963, 1, 1, 1, 1, 1,
-0.05364214, -0.3669986, -3.334258, 1, 1, 1, 1, 1,
-0.05224886, 0.3040626, -0.8183751, 1, 1, 1, 1, 1,
-0.04929425, -1.762785, -4.08884, 1, 1, 1, 1, 1,
-0.04868558, -0.8070307, -3.481547, 0, 0, 1, 1, 1,
-0.04662735, 1.882573, 0.4137288, 1, 0, 0, 1, 1,
-0.04181062, 0.571733, -0.7459189, 1, 0, 0, 1, 1,
-0.03975502, 0.3967922, 1.289243, 1, 0, 0, 1, 1,
-0.03761774, -1.759011, -3.349837, 1, 0, 0, 1, 1,
-0.03712925, -0.2339476, -1.876185, 1, 0, 0, 1, 1,
-0.03569233, 0.8360666, 1.979582, 0, 0, 0, 1, 1,
-0.03460677, 0.04353687, 0.1572076, 0, 0, 0, 1, 1,
-0.03102766, -1.495461, -4.168825, 0, 0, 0, 1, 1,
-0.02972636, 1.05474, 0.2189349, 0, 0, 0, 1, 1,
-0.02959738, -1.433361, -4.036209, 0, 0, 0, 1, 1,
-0.02729418, 0.1711143, 0.6701674, 0, 0, 0, 1, 1,
-0.02558937, -1.26529, -2.011255, 0, 0, 0, 1, 1,
-0.01528144, -0.9711571, -4.384241, 1, 1, 1, 1, 1,
-0.009983313, 0.05132993, -1.082313, 1, 1, 1, 1, 1,
-0.009866823, -1.337527, -5.79227, 1, 1, 1, 1, 1,
-0.007975695, 0.7537469, -1.485719, 1, 1, 1, 1, 1,
-0.006343979, 0.1820094, -0.3408207, 1, 1, 1, 1, 1,
-0.006173398, 0.376712, 0.8610703, 1, 1, 1, 1, 1,
-0.005354043, 0.002582889, -0.9861512, 1, 1, 1, 1, 1,
0.0007986903, -0.07894151, 2.519944, 1, 1, 1, 1, 1,
0.0008917885, 1.517032, 0.0639464, 1, 1, 1, 1, 1,
0.002497176, 0.3757653, 0.5072839, 1, 1, 1, 1, 1,
0.00415774, -1.18889, 2.856339, 1, 1, 1, 1, 1,
0.006174299, 0.04001268, 1.286254, 1, 1, 1, 1, 1,
0.008747933, 1.626667, 0.2820904, 1, 1, 1, 1, 1,
0.008832767, 0.2007892, 0.6590854, 1, 1, 1, 1, 1,
0.01136123, -0.8132728, 2.127991, 1, 1, 1, 1, 1,
0.01318819, -3.177435, 2.880404, 0, 0, 1, 1, 1,
0.01337438, 0.557147, -0.1449868, 1, 0, 0, 1, 1,
0.01405947, 0.8271859, -0.7532322, 1, 0, 0, 1, 1,
0.01839907, -0.5577658, 1.537267, 1, 0, 0, 1, 1,
0.01986928, 1.86317, -1.186297, 1, 0, 0, 1, 1,
0.02221578, 0.8108052, 1.53037, 1, 0, 0, 1, 1,
0.02337852, 0.006017338, 1.431308, 0, 0, 0, 1, 1,
0.02361903, -1.183492, 3.381976, 0, 0, 0, 1, 1,
0.02371468, -0.2973171, 4.213153, 0, 0, 0, 1, 1,
0.02433855, 0.4999791, 1.142709, 0, 0, 0, 1, 1,
0.02460684, -0.4982153, 3.020117, 0, 0, 0, 1, 1,
0.03124433, 0.6397312, 1.48915, 0, 0, 0, 1, 1,
0.03352795, -1.383879, 4.101924, 0, 0, 0, 1, 1,
0.03614177, 0.5991732, -1.39813, 1, 1, 1, 1, 1,
0.03621925, -0.5094852, 1.487079, 1, 1, 1, 1, 1,
0.03848606, 0.717456, 0.2620189, 1, 1, 1, 1, 1,
0.03915502, -2.129491, 4.279684, 1, 1, 1, 1, 1,
0.03970366, 0.5810868, 0.9772198, 1, 1, 1, 1, 1,
0.04040792, 0.03684686, -0.5895985, 1, 1, 1, 1, 1,
0.04063813, 0.7009911, -0.2813919, 1, 1, 1, 1, 1,
0.04249047, 0.3906072, 1.363268, 1, 1, 1, 1, 1,
0.04526136, -1.222161, 3.289348, 1, 1, 1, 1, 1,
0.0469912, -0.136328, 1.766718, 1, 1, 1, 1, 1,
0.04959358, 0.04959514, 0.6399433, 1, 1, 1, 1, 1,
0.05067387, -1.002627, 3.577775, 1, 1, 1, 1, 1,
0.05165038, 0.0003653071, 0.6488661, 1, 1, 1, 1, 1,
0.05292552, 0.3656693, -0.7077142, 1, 1, 1, 1, 1,
0.05941749, 0.8508712, 0.1736958, 1, 1, 1, 1, 1,
0.06046426, -1.223647, 3.753281, 0, 0, 1, 1, 1,
0.06067124, -0.7441747, 3.422523, 1, 0, 0, 1, 1,
0.06479233, -0.3125057, 2.926882, 1, 0, 0, 1, 1,
0.06764462, -0.5298938, 2.164671, 1, 0, 0, 1, 1,
0.07166863, -0.4595644, 3.183197, 1, 0, 0, 1, 1,
0.07664867, -0.9164271, 3.502056, 1, 0, 0, 1, 1,
0.07803465, 1.052628, 1.342508, 0, 0, 0, 1, 1,
0.07929584, 0.004367162, 1.126647, 0, 0, 0, 1, 1,
0.08007332, 1.341989, 0.2646072, 0, 0, 0, 1, 1,
0.08042791, 0.3976934, 0.9193939, 0, 0, 0, 1, 1,
0.081379, 1.329531, -0.1594381, 0, 0, 0, 1, 1,
0.08224048, -0.7151095, 3.288038, 0, 0, 0, 1, 1,
0.08404502, 0.474376, -0.5022048, 0, 0, 0, 1, 1,
0.08668894, 0.5126925, 0.0613526, 1, 1, 1, 1, 1,
0.08699135, -0.8410096, 2.534258, 1, 1, 1, 1, 1,
0.08881918, 0.7690634, -1.252005, 1, 1, 1, 1, 1,
0.09337484, -0.8825725, 2.717477, 1, 1, 1, 1, 1,
0.09357442, -0.0466389, 2.276235, 1, 1, 1, 1, 1,
0.09369255, -0.2769419, 1.124359, 1, 1, 1, 1, 1,
0.0960604, -1.087599, 3.267771, 1, 1, 1, 1, 1,
0.09824775, -1.546274, 3.418145, 1, 1, 1, 1, 1,
0.1001905, -1.754629, 1.012025, 1, 1, 1, 1, 1,
0.1019951, -0.4278851, 3.78549, 1, 1, 1, 1, 1,
0.1020807, 0.238826, 2.433026, 1, 1, 1, 1, 1,
0.1028594, -2.585865, 1.672651, 1, 1, 1, 1, 1,
0.1040233, 1.184993, 1.115649, 1, 1, 1, 1, 1,
0.1044011, 0.03857231, 1.326695, 1, 1, 1, 1, 1,
0.106334, -0.5584061, 2.345399, 1, 1, 1, 1, 1,
0.1071431, -1.598611, 4.478888, 0, 0, 1, 1, 1,
0.1107125, 0.2734523, 0.06936978, 1, 0, 0, 1, 1,
0.1117431, -0.4196465, 3.424126, 1, 0, 0, 1, 1,
0.1159472, -0.03103598, 0.09846679, 1, 0, 0, 1, 1,
0.1176195, -0.6528419, 4.857069, 1, 0, 0, 1, 1,
0.1212417, -1.73754, 4.322629, 1, 0, 0, 1, 1,
0.121681, 0.1801207, 0.8843802, 0, 0, 0, 1, 1,
0.1234048, -0.3885045, 2.045112, 0, 0, 0, 1, 1,
0.1253793, -0.04462987, 1.175766, 0, 0, 0, 1, 1,
0.1318829, -1.019495, 3.938821, 0, 0, 0, 1, 1,
0.1376494, 1.364477, -0.6122783, 0, 0, 0, 1, 1,
0.1384688, 0.8776416, 1.273795, 0, 0, 0, 1, 1,
0.1408516, 0.01848938, 2.325386, 0, 0, 0, 1, 1,
0.1417762, 0.6851043, 0.853485, 1, 1, 1, 1, 1,
0.1458171, 0.5726024, 0.5940462, 1, 1, 1, 1, 1,
0.1464806, 0.389976, 0.1897306, 1, 1, 1, 1, 1,
0.1471033, 1.953977, 0.2885347, 1, 1, 1, 1, 1,
0.1474934, 1.043105, 0.2854562, 1, 1, 1, 1, 1,
0.1500888, 0.7227377, -0.3425651, 1, 1, 1, 1, 1,
0.1535853, -1.203739, 2.450159, 1, 1, 1, 1, 1,
0.1535895, -1.224942, 4.550839, 1, 1, 1, 1, 1,
0.1552758, -0.7185556, 0.4218607, 1, 1, 1, 1, 1,
0.1585743, -0.7386782, 4.923716, 1, 1, 1, 1, 1,
0.1597679, -1.028822, 1.914526, 1, 1, 1, 1, 1,
0.1599167, 0.1274162, 2.919414, 1, 1, 1, 1, 1,
0.1599494, -2.164027, 4.057711, 1, 1, 1, 1, 1,
0.1609007, -0.3637609, 4.974716, 1, 1, 1, 1, 1,
0.1628476, -0.9510646, 3.283359, 1, 1, 1, 1, 1,
0.1635031, -1.385149, 2.5871, 0, 0, 1, 1, 1,
0.1666422, 0.8674933, -2.411543, 1, 0, 0, 1, 1,
0.166914, 0.379453, 0.05598736, 1, 0, 0, 1, 1,
0.1674006, -0.5246878, 3.016644, 1, 0, 0, 1, 1,
0.1720988, 0.6509665, 0.4407438, 1, 0, 0, 1, 1,
0.1830596, -0.05497976, 2.39615, 1, 0, 0, 1, 1,
0.1832659, -1.875939, 4.36421, 0, 0, 0, 1, 1,
0.188427, 0.4952818, -1.289887, 0, 0, 0, 1, 1,
0.1900835, 0.8413694, 0.7212144, 0, 0, 0, 1, 1,
0.1924391, -0.6735647, 2.09316, 0, 0, 0, 1, 1,
0.1924528, -0.8626067, 3.314377, 0, 0, 0, 1, 1,
0.1934206, 0.1147976, 0.004594085, 0, 0, 0, 1, 1,
0.1953703, -0.6022462, 2.204486, 0, 0, 0, 1, 1,
0.2025449, 0.3340416, 1.342594, 1, 1, 1, 1, 1,
0.2148007, -0.6506038, 1.503959, 1, 1, 1, 1, 1,
0.2148542, -0.9796928, 1.604873, 1, 1, 1, 1, 1,
0.216085, -1.021983, 3.435191, 1, 1, 1, 1, 1,
0.2188748, 0.3974068, 0.2510733, 1, 1, 1, 1, 1,
0.2189694, 0.9687329, -0.9397736, 1, 1, 1, 1, 1,
0.221519, -1.353271, 4.017639, 1, 1, 1, 1, 1,
0.2218857, -1.077442, 2.906277, 1, 1, 1, 1, 1,
0.2232071, 1.259737, -0.05072545, 1, 1, 1, 1, 1,
0.2256385, 0.9145314, -0.4820228, 1, 1, 1, 1, 1,
0.2261003, -0.08574548, 1.320116, 1, 1, 1, 1, 1,
0.2275926, -0.06245425, 0.7132044, 1, 1, 1, 1, 1,
0.2294535, -0.2718935, 2.474627, 1, 1, 1, 1, 1,
0.2300143, 0.6348112, 0.9293768, 1, 1, 1, 1, 1,
0.2464996, -0.1869629, 2.356771, 1, 1, 1, 1, 1,
0.2484197, -2.467921, 3.570823, 0, 0, 1, 1, 1,
0.249641, -0.2581694, 1.4389, 1, 0, 0, 1, 1,
0.2502219, 0.8958829, 1.458248, 1, 0, 0, 1, 1,
0.250277, 0.09430844, 0.6748635, 1, 0, 0, 1, 1,
0.252417, -0.1662492, 0.9064593, 1, 0, 0, 1, 1,
0.2532366, 0.8657355, 0.4035524, 1, 0, 0, 1, 1,
0.2560555, 0.9536115, -0.8021091, 0, 0, 0, 1, 1,
0.2603707, -0.6466314, 2.513773, 0, 0, 0, 1, 1,
0.2637841, -0.3179407, 1.943269, 0, 0, 0, 1, 1,
0.2654131, -1.768464, 3.480103, 0, 0, 0, 1, 1,
0.2677732, 0.2261162, 0.5440254, 0, 0, 0, 1, 1,
0.268667, -1.899756, -0.07272802, 0, 0, 0, 1, 1,
0.270173, 0.05195767, -0.1693517, 0, 0, 0, 1, 1,
0.2714929, -1.852059, 1.03556, 1, 1, 1, 1, 1,
0.2724675, 0.01366106, 2.633673, 1, 1, 1, 1, 1,
0.2748362, -0.6341573, 1.192262, 1, 1, 1, 1, 1,
0.2776715, 1.29853, 1.091189, 1, 1, 1, 1, 1,
0.2827974, 0.6011476, 1.648042, 1, 1, 1, 1, 1,
0.2835233, -0.8786348, 1.892315, 1, 1, 1, 1, 1,
0.2837709, 0.9166643, -0.1626622, 1, 1, 1, 1, 1,
0.284428, 0.9761155, -1.290058, 1, 1, 1, 1, 1,
0.2890119, -0.5954945, 2.399892, 1, 1, 1, 1, 1,
0.2940333, -0.03091161, 0.8722523, 1, 1, 1, 1, 1,
0.2964614, 1.576753, 0.8123183, 1, 1, 1, 1, 1,
0.3055024, 2.018669, 0.7619927, 1, 1, 1, 1, 1,
0.3069101, 0.1021347, 0.05038572, 1, 1, 1, 1, 1,
0.308243, 0.2310341, 2.431716, 1, 1, 1, 1, 1,
0.308719, 0.9958875, 0.6520866, 1, 1, 1, 1, 1,
0.3093427, -1.230098, -0.01710971, 0, 0, 1, 1, 1,
0.3191643, -1.288468, 3.198717, 1, 0, 0, 1, 1,
0.3246903, 0.3658904, -0.8185509, 1, 0, 0, 1, 1,
0.3281299, -0.1820221, 3.004357, 1, 0, 0, 1, 1,
0.3291077, -1.329756, 3.409084, 1, 0, 0, 1, 1,
0.3325113, 0.6615427, -0.2610257, 1, 0, 0, 1, 1,
0.3342106, -0.3777158, 3.624615, 0, 0, 0, 1, 1,
0.3365804, -0.02313849, 2.020356, 0, 0, 0, 1, 1,
0.3371235, -0.2855861, 2.430806, 0, 0, 0, 1, 1,
0.3454342, 0.8688201, -0.1965461, 0, 0, 0, 1, 1,
0.3461667, -1.035333, 2.808184, 0, 0, 0, 1, 1,
0.3474796, -0.9105955, 2.133462, 0, 0, 0, 1, 1,
0.3492139, -1.576455, 2.716455, 0, 0, 0, 1, 1,
0.3497753, 0.2916401, -1.03488, 1, 1, 1, 1, 1,
0.350132, -0.213718, 2.433447, 1, 1, 1, 1, 1,
0.3509043, 0.6263633, 0.1836139, 1, 1, 1, 1, 1,
0.3510028, -0.6811317, 2.098069, 1, 1, 1, 1, 1,
0.355267, 0.4877283, 0.9506457, 1, 1, 1, 1, 1,
0.3590641, 0.177974, 2.553311, 1, 1, 1, 1, 1,
0.3616458, 0.4705466, 1.115588, 1, 1, 1, 1, 1,
0.366285, 0.0219684, 1.070788, 1, 1, 1, 1, 1,
0.3697559, 0.5364412, 0.1683428, 1, 1, 1, 1, 1,
0.371247, 0.2902325, 1.039614, 1, 1, 1, 1, 1,
0.371778, -0.7165458, 3.696655, 1, 1, 1, 1, 1,
0.3721041, 0.4162904, 1.742058, 1, 1, 1, 1, 1,
0.373958, 1.492279, 0.4345886, 1, 1, 1, 1, 1,
0.3754692, -0.8137282, 1.212487, 1, 1, 1, 1, 1,
0.3756643, 0.871337, 0.8951651, 1, 1, 1, 1, 1,
0.3797777, 0.9832814, -0.03059647, 0, 0, 1, 1, 1,
0.3858646, -2.699404, 3.0836, 1, 0, 0, 1, 1,
0.3925956, -1.468791, 3.019946, 1, 0, 0, 1, 1,
0.4003033, 0.6083039, 0.2603995, 1, 0, 0, 1, 1,
0.4011988, -0.1341948, 3.287147, 1, 0, 0, 1, 1,
0.4020784, 0.8398098, -0.3105314, 1, 0, 0, 1, 1,
0.4037812, 1.339516, -0.2381085, 0, 0, 0, 1, 1,
0.4162959, -0.3448444, 3.449813, 0, 0, 0, 1, 1,
0.4178228, -0.2975255, 1.249161, 0, 0, 0, 1, 1,
0.4200808, 2.455743, 0.6297761, 0, 0, 0, 1, 1,
0.4203385, 0.995309, -0.638071, 0, 0, 0, 1, 1,
0.4263607, -0.4015053, 1.544597, 0, 0, 0, 1, 1,
0.4280433, -0.2154593, 1.828383, 0, 0, 0, 1, 1,
0.4319036, 0.2448814, 0.5414692, 1, 1, 1, 1, 1,
0.433831, -1.483235, 3.975163, 1, 1, 1, 1, 1,
0.4351672, 0.3569209, 2.831686, 1, 1, 1, 1, 1,
0.4395689, -1.057626, 2.573865, 1, 1, 1, 1, 1,
0.4400403, -1.06749, 3.748858, 1, 1, 1, 1, 1,
0.4426276, 0.01623122, 1.336193, 1, 1, 1, 1, 1,
0.4446918, -1.450647, 2.545757, 1, 1, 1, 1, 1,
0.4463963, 1.454218, -1.309843, 1, 1, 1, 1, 1,
0.4497597, -0.4623511, 2.718458, 1, 1, 1, 1, 1,
0.4547988, -1.021672, 1.389816, 1, 1, 1, 1, 1,
0.4581946, 1.087219, 3.194569, 1, 1, 1, 1, 1,
0.4587922, 0.8489023, 0.2662954, 1, 1, 1, 1, 1,
0.4671533, -1.040626, 4.567524, 1, 1, 1, 1, 1,
0.4703774, -0.1276964, 2.37698, 1, 1, 1, 1, 1,
0.472596, -0.5217239, 2.579918, 1, 1, 1, 1, 1,
0.4757695, -1.529621, 2.890575, 0, 0, 1, 1, 1,
0.4769971, 0.9392165, 1.076997, 1, 0, 0, 1, 1,
0.4791782, 1.445446, 1.041385, 1, 0, 0, 1, 1,
0.4805986, 0.4023682, 1.586779, 1, 0, 0, 1, 1,
0.4859568, 0.6503434, 0.01601959, 1, 0, 0, 1, 1,
0.4931151, -0.9151041, 1.522258, 1, 0, 0, 1, 1,
0.4974539, -1.350421, 3.409325, 0, 0, 0, 1, 1,
0.5096022, -0.03646396, 1.310749, 0, 0, 0, 1, 1,
0.5102542, -0.01865435, 2.690584, 0, 0, 0, 1, 1,
0.5142664, 0.6169937, 0.7955502, 0, 0, 0, 1, 1,
0.5180201, -0.3080356, 1.431474, 0, 0, 0, 1, 1,
0.5195871, -0.5192387, 4.328639, 0, 0, 0, 1, 1,
0.5223798, -0.4389818, 1.710761, 0, 0, 0, 1, 1,
0.5279513, -1.387072, 3.449852, 1, 1, 1, 1, 1,
0.5324822, 1.917449, -1.140483, 1, 1, 1, 1, 1,
0.5336775, -0.09810565, 2.752785, 1, 1, 1, 1, 1,
0.5354146, -0.9723662, 2.003297, 1, 1, 1, 1, 1,
0.5417559, 0.9836988, 0.3217192, 1, 1, 1, 1, 1,
0.5449272, 0.2057599, 3.554681, 1, 1, 1, 1, 1,
0.5467564, -0.1487264, 1.283239, 1, 1, 1, 1, 1,
0.5472715, -1.688981, 3.622767, 1, 1, 1, 1, 1,
0.5485417, 0.2156917, 2.448364, 1, 1, 1, 1, 1,
0.5520456, -1.394215, 2.768132, 1, 1, 1, 1, 1,
0.5555936, 1.099425, 1.981912, 1, 1, 1, 1, 1,
0.5580233, -0.2451911, 0.855435, 1, 1, 1, 1, 1,
0.5585554, 1.638163, 0.7709835, 1, 1, 1, 1, 1,
0.560765, 1.163042, 1.737933, 1, 1, 1, 1, 1,
0.5616076, 0.2298606, 2.379922, 1, 1, 1, 1, 1,
0.5640486, 0.06626257, 0.3544318, 0, 0, 1, 1, 1,
0.5643759, 0.2821739, 3.40785, 1, 0, 0, 1, 1,
0.5666946, 0.3341118, -0.03833451, 1, 0, 0, 1, 1,
0.5678629, 1.02108, -0.6300636, 1, 0, 0, 1, 1,
0.5754187, 1.120336, 1.118289, 1, 0, 0, 1, 1,
0.5769012, 1.092934, -0.2739985, 1, 0, 0, 1, 1,
0.577136, -0.3416059, 2.351454, 0, 0, 0, 1, 1,
0.5786862, -1.378074, 3.079349, 0, 0, 0, 1, 1,
0.5792215, 0.5528321, -0.3850765, 0, 0, 0, 1, 1,
0.580204, 1.426838, 0.3221678, 0, 0, 0, 1, 1,
0.5871562, -0.4776091, 2.582632, 0, 0, 0, 1, 1,
0.5919921, -1.257304, 4.345551, 0, 0, 0, 1, 1,
0.5944691, -0.539929, 1.32075, 0, 0, 0, 1, 1,
0.5993013, 1.053439, 1.194578, 1, 1, 1, 1, 1,
0.6012143, 1.683318, 0.9962976, 1, 1, 1, 1, 1,
0.603661, 0.868744, 1.048127, 1, 1, 1, 1, 1,
0.6078492, -0.1216063, 1.905665, 1, 1, 1, 1, 1,
0.6280807, 0.5852436, 0.2337863, 1, 1, 1, 1, 1,
0.6282535, -1.690601, 2.361614, 1, 1, 1, 1, 1,
0.6305119, 0.1771101, 1.724086, 1, 1, 1, 1, 1,
0.6357575, -1.12627, 2.34778, 1, 1, 1, 1, 1,
0.6387569, -0.7520329, 1.092832, 1, 1, 1, 1, 1,
0.6399484, 0.4503647, -1.019733, 1, 1, 1, 1, 1,
0.650858, -0.1829648, 1.770396, 1, 1, 1, 1, 1,
0.6514526, -0.06808715, 1.684205, 1, 1, 1, 1, 1,
0.6550382, 1.888208, 2.459394, 1, 1, 1, 1, 1,
0.6604561, -1.366147, 2.590005, 1, 1, 1, 1, 1,
0.6630335, -0.6077728, 1.778653, 1, 1, 1, 1, 1,
0.6657392, -1.334537, 2.039566, 0, 0, 1, 1, 1,
0.6660987, -1.903111, 0.86131, 1, 0, 0, 1, 1,
0.6717009, -1.193058, 3.339298, 1, 0, 0, 1, 1,
0.6740138, 0.3939858, 0.7827814, 1, 0, 0, 1, 1,
0.6741803, 0.4053674, 1.539904, 1, 0, 0, 1, 1,
0.6777349, 1.277941, 0.3025341, 1, 0, 0, 1, 1,
0.679189, -1.837376, 2.83806, 0, 0, 0, 1, 1,
0.6793481, -0.3654126, 0.5317155, 0, 0, 0, 1, 1,
0.6845958, 1.273867, 1.356673, 0, 0, 0, 1, 1,
0.6890728, -0.4551074, 3.034285, 0, 0, 0, 1, 1,
0.6901033, -0.8949329, 0.9189082, 0, 0, 0, 1, 1,
0.6930673, 0.4949749, 1.946384, 0, 0, 0, 1, 1,
0.6967725, -1.998489, 3.220342, 0, 0, 0, 1, 1,
0.6968703, -0.499825, 2.837997, 1, 1, 1, 1, 1,
0.6982253, 0.8501506, 0.3713515, 1, 1, 1, 1, 1,
0.7054504, 0.5521465, 0.9655879, 1, 1, 1, 1, 1,
0.7127768, -2.25088, 2.277994, 1, 1, 1, 1, 1,
0.717222, -0.7083725, 0.8679941, 1, 1, 1, 1, 1,
0.7200853, 0.5742403, -1.103771, 1, 1, 1, 1, 1,
0.7218605, -0.5502598, 1.159662, 1, 1, 1, 1, 1,
0.7219208, -0.7211349, 2.0871, 1, 1, 1, 1, 1,
0.7222387, 1.065628, 1.673344, 1, 1, 1, 1, 1,
0.7248714, -0.8523118, 2.221404, 1, 1, 1, 1, 1,
0.7315219, 1.733927, -0.1506979, 1, 1, 1, 1, 1,
0.7336586, 0.3167148, 0.6458179, 1, 1, 1, 1, 1,
0.736532, -1.129111, 1.574818, 1, 1, 1, 1, 1,
0.7377629, -0.4956247, 2.547551, 1, 1, 1, 1, 1,
0.7386351, -0.4757141, 1.815212, 1, 1, 1, 1, 1,
0.7439021, -0.7083681, 2.771728, 0, 0, 1, 1, 1,
0.7475917, 1.617615, 0.5602069, 1, 0, 0, 1, 1,
0.7523556, -1.597887, 2.894809, 1, 0, 0, 1, 1,
0.7562953, -2.07641, 3.599269, 1, 0, 0, 1, 1,
0.7593379, 0.04909103, -1.163547, 1, 0, 0, 1, 1,
0.7594938, 2.190218, -0.160102, 1, 0, 0, 1, 1,
0.7606607, 0.3724265, 0.9211581, 0, 0, 0, 1, 1,
0.7629207, 0.6284087, -0.3417724, 0, 0, 0, 1, 1,
0.7666992, -0.04385996, 1.322294, 0, 0, 0, 1, 1,
0.7668597, -1.036941, 1.90329, 0, 0, 0, 1, 1,
0.7681125, 1.010946, -0.6352566, 0, 0, 0, 1, 1,
0.7759681, -1.872359, 2.591784, 0, 0, 0, 1, 1,
0.7762228, 0.2771598, 1.332951, 0, 0, 0, 1, 1,
0.7832666, 0.446436, 0.4885767, 1, 1, 1, 1, 1,
0.7839952, 2.094965, -0.2284114, 1, 1, 1, 1, 1,
0.7926023, 0.2390931, -0.6324085, 1, 1, 1, 1, 1,
0.7956992, 1.559523, 0.3588579, 1, 1, 1, 1, 1,
0.8019261, 0.6292752, 1.293739, 1, 1, 1, 1, 1,
0.8086815, 1.005046, -0.2529643, 1, 1, 1, 1, 1,
0.8117881, 1.687027, -0.6496719, 1, 1, 1, 1, 1,
0.8145877, -0.756312, 1.227087, 1, 1, 1, 1, 1,
0.8170416, -0.3715299, 1.677474, 1, 1, 1, 1, 1,
0.8174841, 2.404694, -0.6251261, 1, 1, 1, 1, 1,
0.8180946, -0.7607653, 3.537637, 1, 1, 1, 1, 1,
0.8186364, 1.436406, 0.6563652, 1, 1, 1, 1, 1,
0.822315, -1.085851, 0.9256838, 1, 1, 1, 1, 1,
0.8237231, 0.2393005, 1.465156, 1, 1, 1, 1, 1,
0.8258522, 0.6503003, -0.1153569, 1, 1, 1, 1, 1,
0.8276939, 0.1546607, 1.337579, 0, 0, 1, 1, 1,
0.8284053, -0.4055211, 0.5226185, 1, 0, 0, 1, 1,
0.828775, 0.241303, 2.093919, 1, 0, 0, 1, 1,
0.8305059, 1.129276, 0.1218642, 1, 0, 0, 1, 1,
0.8311664, -1.439552, 3.618715, 1, 0, 0, 1, 1,
0.8330038, 2.482401, 0.6980839, 1, 0, 0, 1, 1,
0.8344295, -0.05819593, 3.79135, 0, 0, 0, 1, 1,
0.8443889, -2.282726, 4.196199, 0, 0, 0, 1, 1,
0.8538681, 2.536178, 0.4110348, 0, 0, 0, 1, 1,
0.856472, 1.442538, 0.1054354, 0, 0, 0, 1, 1,
0.8570958, 0.005395392, 0.3506289, 0, 0, 0, 1, 1,
0.8589227, 0.5680237, 2.186869, 0, 0, 0, 1, 1,
0.8667465, -0.519084, 2.714566, 0, 0, 0, 1, 1,
0.8703318, -0.9558226, 2.356984, 1, 1, 1, 1, 1,
0.8770469, 0.7929676, 0.3746729, 1, 1, 1, 1, 1,
0.8844342, -1.979933, 2.827136, 1, 1, 1, 1, 1,
0.8850826, -0.9018264, 2.434894, 1, 1, 1, 1, 1,
0.8940275, -1.198407, 2.3901, 1, 1, 1, 1, 1,
0.9010901, 0.2325406, 1.682226, 1, 1, 1, 1, 1,
0.9021307, -0.04786763, 2.717721, 1, 1, 1, 1, 1,
0.9027954, 0.06107128, 0.07013811, 1, 1, 1, 1, 1,
0.9062613, -0.8502082, 0.3252022, 1, 1, 1, 1, 1,
0.9093371, 0.8149754, -0.1271236, 1, 1, 1, 1, 1,
0.9119124, 0.427615, 1.983403, 1, 1, 1, 1, 1,
0.9128003, 0.1374073, 1.167524, 1, 1, 1, 1, 1,
0.9143327, 0.9104837, 1.572639, 1, 1, 1, 1, 1,
0.922734, 1.327113, 1.682426, 1, 1, 1, 1, 1,
0.9227597, -0.2278607, 1.678322, 1, 1, 1, 1, 1,
0.9244277, 0.4428032, 1.359084, 0, 0, 1, 1, 1,
0.9287624, -0.5888206, 2.000085, 1, 0, 0, 1, 1,
0.9290102, 0.4219911, -0.8420321, 1, 0, 0, 1, 1,
0.9299096, -0.6404009, 3.231214, 1, 0, 0, 1, 1,
0.9323753, 0.5452967, 1.538227, 1, 0, 0, 1, 1,
0.9343385, -0.5035881, 3.573776, 1, 0, 0, 1, 1,
0.9343851, 0.8576327, 0.2848353, 0, 0, 0, 1, 1,
0.9357575, 1.183372, -0.5674054, 0, 0, 0, 1, 1,
0.95507, -0.586099, 3.802573, 0, 0, 0, 1, 1,
0.958109, 1.020151, 0.3778569, 0, 0, 0, 1, 1,
0.9660357, 1.042352, 0.4127147, 0, 0, 0, 1, 1,
0.9745583, 0.368329, 0.4378617, 0, 0, 0, 1, 1,
0.9768724, 0.2162788, -0.7483653, 0, 0, 0, 1, 1,
0.9776046, 1.501296, -0.6095392, 1, 1, 1, 1, 1,
0.9779368, 0.3304342, 1.248548, 1, 1, 1, 1, 1,
0.9838259, 1.015092, 0.4810207, 1, 1, 1, 1, 1,
0.993158, 2.093212, 0.8800635, 1, 1, 1, 1, 1,
0.9937118, 0.6315247, 1.842723, 1, 1, 1, 1, 1,
0.9942312, -0.7868458, 2.221921, 1, 1, 1, 1, 1,
0.9943935, -0.7240531, 3.750023, 1, 1, 1, 1, 1,
0.99603, 0.7871734, -0.2849219, 1, 1, 1, 1, 1,
1.000985, 0.8675621, 1.626444, 1, 1, 1, 1, 1,
1.001573, -0.7511188, 2.958753, 1, 1, 1, 1, 1,
1.003479, 1.358564, 1.419368, 1, 1, 1, 1, 1,
1.008612, 1.082355, 0.04475566, 1, 1, 1, 1, 1,
1.009785, -1.204216, 3.657637, 1, 1, 1, 1, 1,
1.020279, 0.7423974, -0.917017, 1, 1, 1, 1, 1,
1.025562, -2.466445, 1.095465, 1, 1, 1, 1, 1,
1.032847, -0.1934382, 1.343565, 0, 0, 1, 1, 1,
1.046175, -0.9723273, 2.113358, 1, 0, 0, 1, 1,
1.049173, 0.7941199, 0.1816866, 1, 0, 0, 1, 1,
1.063055, -0.06628184, 2.14564, 1, 0, 0, 1, 1,
1.067341, 0.08966889, 1.416758, 1, 0, 0, 1, 1,
1.067431, 0.4107144, 0.6344343, 1, 0, 0, 1, 1,
1.093555, 0.0476705, 1.940191, 0, 0, 0, 1, 1,
1.095616, -0.549964, 0.4263005, 0, 0, 0, 1, 1,
1.097453, -0.2069801, -0.3563827, 0, 0, 0, 1, 1,
1.109084, -0.497312, 1.169935, 0, 0, 0, 1, 1,
1.110656, 0.00202756, 0.3592483, 0, 0, 0, 1, 1,
1.114578, 0.7647521, 0.5367647, 0, 0, 0, 1, 1,
1.124919, -0.6734565, 0.5509247, 0, 0, 0, 1, 1,
1.132633, -1.256965, 4.141663, 1, 1, 1, 1, 1,
1.132745, -1.712457, 3.418077, 1, 1, 1, 1, 1,
1.138754, 0.7192138, 0.7036711, 1, 1, 1, 1, 1,
1.144118, -3.014941, 3.682557, 1, 1, 1, 1, 1,
1.145767, 0.531571, 2.334409, 1, 1, 1, 1, 1,
1.149286, 0.2494402, 0.6265746, 1, 1, 1, 1, 1,
1.1502, 0.1417086, 1.594343, 1, 1, 1, 1, 1,
1.15237, 0.7224491, 2.797818, 1, 1, 1, 1, 1,
1.15296, -0.8045575, 2.969437, 1, 1, 1, 1, 1,
1.154059, -1.109999, 1.874087, 1, 1, 1, 1, 1,
1.159366, -0.8533008, 2.552511, 1, 1, 1, 1, 1,
1.168486, -0.3439769, 1.740046, 1, 1, 1, 1, 1,
1.177333, -1.103668, 1.875883, 1, 1, 1, 1, 1,
1.17901, 0.5108308, -0.9487992, 1, 1, 1, 1, 1,
1.179753, -0.5527309, 4.223755, 1, 1, 1, 1, 1,
1.188115, 0.6212396, 2.43092, 0, 0, 1, 1, 1,
1.188717, 0.2354459, 0.7136772, 1, 0, 0, 1, 1,
1.190887, -1.302729, 2.465712, 1, 0, 0, 1, 1,
1.19407, -0.7102021, -0.6504187, 1, 0, 0, 1, 1,
1.197863, -1.027084, 1.880051, 1, 0, 0, 1, 1,
1.20364, -0.07961374, 0.2919366, 1, 0, 0, 1, 1,
1.204017, -2.778115, 2.508944, 0, 0, 0, 1, 1,
1.212694, 2.011009, 1.195178, 0, 0, 0, 1, 1,
1.218554, 0.2170352, 2.758811, 0, 0, 0, 1, 1,
1.223908, -0.2711912, 2.402188, 0, 0, 0, 1, 1,
1.235481, 0.6553711, 1.904679, 0, 0, 0, 1, 1,
1.252241, 1.631567, 0.1614662, 0, 0, 0, 1, 1,
1.258104, -0.05054959, 2.279253, 0, 0, 0, 1, 1,
1.264232, -0.6945668, 2.339734, 1, 1, 1, 1, 1,
1.264257, 0.1877057, 0.8393987, 1, 1, 1, 1, 1,
1.264465, -0.05614188, 1.668766, 1, 1, 1, 1, 1,
1.270484, 0.8103687, 1.155927, 1, 1, 1, 1, 1,
1.270703, -0.2756868, 1.92868, 1, 1, 1, 1, 1,
1.27102, 1.614809, 2.104344, 1, 1, 1, 1, 1,
1.275006, -0.07947631, -0.600296, 1, 1, 1, 1, 1,
1.283877, 0.7068008, 0.7044878, 1, 1, 1, 1, 1,
1.287318, -1.108069, 2.281667, 1, 1, 1, 1, 1,
1.289155, 1.730957, 0.6560355, 1, 1, 1, 1, 1,
1.294939, 1.490444, 1.653677, 1, 1, 1, 1, 1,
1.303876, 0.9648969, 1.474652, 1, 1, 1, 1, 1,
1.305065, -2.444782, 1.28749, 1, 1, 1, 1, 1,
1.31778, -1.594556, 4.493323, 1, 1, 1, 1, 1,
1.332936, -0.4392596, 1.598543, 1, 1, 1, 1, 1,
1.34164, -0.9092524, 0.9166235, 0, 0, 1, 1, 1,
1.353804, 1.417081, 1.664118, 1, 0, 0, 1, 1,
1.359255, -1.552762, 1.653404, 1, 0, 0, 1, 1,
1.371225, -0.2408133, 1.755104, 1, 0, 0, 1, 1,
1.38107, -0.3147253, 2.013388, 1, 0, 0, 1, 1,
1.384618, -0.5569374, 1.512573, 1, 0, 0, 1, 1,
1.386471, 0.3433793, 0.652541, 0, 0, 0, 1, 1,
1.397856, -0.952834, 1.509813, 0, 0, 0, 1, 1,
1.409665, -0.002929199, 2.215015, 0, 0, 0, 1, 1,
1.417198, -0.7542296, 2.037913, 0, 0, 0, 1, 1,
1.424147, 0.1760075, 2.061143, 0, 0, 0, 1, 1,
1.429271, 0.2527062, 2.661079, 0, 0, 0, 1, 1,
1.431169, 0.0492247, 1.754505, 0, 0, 0, 1, 1,
1.434608, -2.128871, 2.447032, 1, 1, 1, 1, 1,
1.443097, 0.7683914, 1.417152, 1, 1, 1, 1, 1,
1.446681, 0.6066242, 3.55382, 1, 1, 1, 1, 1,
1.461292, -0.3800709, 2.642056, 1, 1, 1, 1, 1,
1.474946, -1.05825, 1.677069, 1, 1, 1, 1, 1,
1.48491, 0.3845202, 2.089673, 1, 1, 1, 1, 1,
1.489017, -1.13471, 2.57505, 1, 1, 1, 1, 1,
1.499972, -2.305119, 3.702765, 1, 1, 1, 1, 1,
1.520479, 0.0740921, 1.072538, 1, 1, 1, 1, 1,
1.521378, 1.390158, 0.1541627, 1, 1, 1, 1, 1,
1.522503, 1.308957, -1.229804, 1, 1, 1, 1, 1,
1.545639, -0.2034084, 1.468399, 1, 1, 1, 1, 1,
1.549374, -0.2106927, 1.776877, 1, 1, 1, 1, 1,
1.56487, 0.2049665, 2.230135, 1, 1, 1, 1, 1,
1.572405, -1.423408, 2.133331, 1, 1, 1, 1, 1,
1.588073, 1.071784, 0.5616484, 0, 0, 1, 1, 1,
1.601531, 1.14089, 0.249046, 1, 0, 0, 1, 1,
1.61537, -1.127211, 3.233614, 1, 0, 0, 1, 1,
1.61628, -0.8410192, 1.524133, 1, 0, 0, 1, 1,
1.640423, 0.8132264, 0.9319261, 1, 0, 0, 1, 1,
1.645201, -0.9619859, 1.008068, 1, 0, 0, 1, 1,
1.653653, -0.8219332, 2.068013, 0, 0, 0, 1, 1,
1.678468, -0.832558, 2.452142, 0, 0, 0, 1, 1,
1.693303, 0.4220251, 3.178976, 0, 0, 0, 1, 1,
1.697081, 0.131811, 1.608332, 0, 0, 0, 1, 1,
1.724142, 0.07846782, 2.034941, 0, 0, 0, 1, 1,
1.736526, 0.6595606, 3.629309, 0, 0, 0, 1, 1,
1.739858, -0.8104975, 2.338165, 0, 0, 0, 1, 1,
1.749964, -0.946893, 2.125136, 1, 1, 1, 1, 1,
1.782018, -0.3294048, 2.374283, 1, 1, 1, 1, 1,
1.804039, -0.004999881, 1.36224, 1, 1, 1, 1, 1,
1.81685, -1.18542, 1.125028, 1, 1, 1, 1, 1,
1.841688, 0.561694, 0.2116662, 1, 1, 1, 1, 1,
1.873866, 0.6340845, 2.823356, 1, 1, 1, 1, 1,
1.882359, 0.339724, 2.386618, 1, 1, 1, 1, 1,
1.900384, -0.05075628, 2.965398, 1, 1, 1, 1, 1,
1.900619, -2.459483, 4.906592, 1, 1, 1, 1, 1,
1.903218, -0.7820141, 2.001247, 1, 1, 1, 1, 1,
1.904081, 0.1269124, 2.375636, 1, 1, 1, 1, 1,
1.952875, 0.002385054, 1.293417, 1, 1, 1, 1, 1,
1.953532, -0.6676641, 2.82036, 1, 1, 1, 1, 1,
1.978695, 1.14423, 3.474882, 1, 1, 1, 1, 1,
1.98437, 1.899951, 0.15024, 1, 1, 1, 1, 1,
2.011607, 1.190368, 2.212779, 0, 0, 1, 1, 1,
2.046923, 0.4370254, 1.580081, 1, 0, 0, 1, 1,
2.052106, -1.271328, 3.43884, 1, 0, 0, 1, 1,
2.057765, -0.7636631, 3.039603, 1, 0, 0, 1, 1,
2.065572, 0.1004331, 1.29911, 1, 0, 0, 1, 1,
2.145482, 0.09645633, 1.946135, 1, 0, 0, 1, 1,
2.153312, -0.6909281, -0.02383386, 0, 0, 0, 1, 1,
2.168466, -1.526904, 2.419012, 0, 0, 0, 1, 1,
2.226156, -0.6916286, 2.703377, 0, 0, 0, 1, 1,
2.398443, 0.4625034, 3.157162, 0, 0, 0, 1, 1,
2.427679, -0.1103649, 1.622569, 0, 0, 0, 1, 1,
2.517108, -0.3397858, 2.450653, 0, 0, 0, 1, 1,
2.571767, 0.06268409, 1.434526, 0, 0, 0, 1, 1,
2.590628, -1.395786, 1.253191, 1, 1, 1, 1, 1,
2.646465, -0.4127125, 0.1224898, 1, 1, 1, 1, 1,
2.702793, -0.5529515, 2.184428, 1, 1, 1, 1, 1,
2.78796, 0.0444281, 0.4762464, 1, 1, 1, 1, 1,
2.849265, 0.6368455, 0.5198193, 1, 1, 1, 1, 1,
3.143204, 0.8439651, 1.748209, 1, 1, 1, 1, 1,
3.455517, 0.2854751, 0.5248457, 1, 1, 1, 1, 1
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
var radius = 9.805221;
var distance = 34.44042;
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
mvMatrix.translate( -0.1152894, -0.09101295, 0.5367558 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.44042);
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
