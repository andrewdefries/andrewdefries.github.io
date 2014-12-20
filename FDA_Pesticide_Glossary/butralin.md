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
-3.393475, 0.8473598, -2.070365, 1, 0, 0, 1,
-3.166083, -0.08190557, -0.923371, 1, 0.007843138, 0, 1,
-3.012187, 0.8056685, -0.8420524, 1, 0.01176471, 0, 1,
-2.955323, -0.7322026, -2.838911, 1, 0.01960784, 0, 1,
-2.666684, 0.8080693, -1.842556, 1, 0.02352941, 0, 1,
-2.665379, -0.3730493, -1.239177, 1, 0.03137255, 0, 1,
-2.646491, -0.2641217, -0.4640166, 1, 0.03529412, 0, 1,
-2.507583, 2.664215, -0.4406462, 1, 0.04313726, 0, 1,
-2.47925, -1.250914, -2.736962, 1, 0.04705882, 0, 1,
-2.413428, 0.3632443, -0.2811784, 1, 0.05490196, 0, 1,
-2.392253, -1.200492, -1.194949, 1, 0.05882353, 0, 1,
-2.242032, -0.7338583, -1.775257, 1, 0.06666667, 0, 1,
-2.235794, -1.764398, -0.9304532, 1, 0.07058824, 0, 1,
-2.214336, -0.1103612, -2.408262, 1, 0.07843138, 0, 1,
-2.143253, -0.5030549, -0.9746582, 1, 0.08235294, 0, 1,
-2.134394, -1.344606, -1.555942, 1, 0.09019608, 0, 1,
-2.117682, 1.250396, -0.9176056, 1, 0.09411765, 0, 1,
-2.10938, -0.6270269, -1.155802, 1, 0.1019608, 0, 1,
-2.108455, -0.1657954, -2.103314, 1, 0.1098039, 0, 1,
-2.087553, 3.374113, -0.9609168, 1, 0.1137255, 0, 1,
-2.086334, -2.440627, -3.474182, 1, 0.1215686, 0, 1,
-2.048922, -0.2369792, -1.046252, 1, 0.1254902, 0, 1,
-2.033067, 1.49207, -1.333319, 1, 0.1333333, 0, 1,
-1.995775, -0.4140034, -2.259696, 1, 0.1372549, 0, 1,
-1.994584, -0.7417529, -1.605338, 1, 0.145098, 0, 1,
-1.983126, -0.9755639, -0.07023185, 1, 0.1490196, 0, 1,
-1.971876, -1.18446, -2.86945, 1, 0.1568628, 0, 1,
-1.965872, -1.075272, -4.049984, 1, 0.1607843, 0, 1,
-1.953768, 0.657966, -0.4189634, 1, 0.1686275, 0, 1,
-1.915005, -0.7752109, -2.614733, 1, 0.172549, 0, 1,
-1.914796, -0.7591792, -1.598005, 1, 0.1803922, 0, 1,
-1.909283, -1.363558, -1.306295, 1, 0.1843137, 0, 1,
-1.909113, -0.363621, 0.8052307, 1, 0.1921569, 0, 1,
-1.903475, -0.7381955, -3.571177, 1, 0.1960784, 0, 1,
-1.887299, -0.4975843, -1.563095, 1, 0.2039216, 0, 1,
-1.851978, -0.7160217, -3.047093, 1, 0.2117647, 0, 1,
-1.847084, -1.226877, -3.759589, 1, 0.2156863, 0, 1,
-1.8423, 0.6028867, -0.8903288, 1, 0.2235294, 0, 1,
-1.831218, -0.4251084, -0.7251079, 1, 0.227451, 0, 1,
-1.826039, -0.4371876, -2.798712, 1, 0.2352941, 0, 1,
-1.808787, -0.8555918, -2.615938, 1, 0.2392157, 0, 1,
-1.785178, 0.253561, -1.209451, 1, 0.2470588, 0, 1,
-1.776204, 1.203281, -0.7001306, 1, 0.2509804, 0, 1,
-1.762958, -2.034859, -3.735185, 1, 0.2588235, 0, 1,
-1.762549, -0.3934757, -1.982522, 1, 0.2627451, 0, 1,
-1.752047, 0.5539735, -2.276223, 1, 0.2705882, 0, 1,
-1.748899, 0.7097556, -0.4216947, 1, 0.2745098, 0, 1,
-1.747394, 0.8049603, -0.7845731, 1, 0.282353, 0, 1,
-1.737894, -1.209092, -0.8512436, 1, 0.2862745, 0, 1,
-1.736309, 0.7883978, -0.03347007, 1, 0.2941177, 0, 1,
-1.728245, -0.5655574, -2.63741, 1, 0.3019608, 0, 1,
-1.722723, -1.102559, -1.880848, 1, 0.3058824, 0, 1,
-1.717321, -0.2012757, -2.158361, 1, 0.3137255, 0, 1,
-1.70632, 1.01405, -0.7896986, 1, 0.3176471, 0, 1,
-1.693297, 1.103156, -1.211611, 1, 0.3254902, 0, 1,
-1.681287, 0.3699833, -1.914736, 1, 0.3294118, 0, 1,
-1.669572, 0.52769, -0.9629904, 1, 0.3372549, 0, 1,
-1.653708, 0.2596998, -0.2665181, 1, 0.3411765, 0, 1,
-1.633072, 1.346429, -0.9016232, 1, 0.3490196, 0, 1,
-1.630262, 0.08235598, -3.721706, 1, 0.3529412, 0, 1,
-1.607292, -0.06079278, -2.347592, 1, 0.3607843, 0, 1,
-1.605781, 0.5642042, -1.758333, 1, 0.3647059, 0, 1,
-1.594051, -1.568064, 0.05647933, 1, 0.372549, 0, 1,
-1.57857, 1.534634, -0.7497877, 1, 0.3764706, 0, 1,
-1.577449, -0.6016158, -0.5186151, 1, 0.3843137, 0, 1,
-1.571851, -2.006261, -2.258576, 1, 0.3882353, 0, 1,
-1.564822, -0.9802974, -1.840945, 1, 0.3960784, 0, 1,
-1.552529, 1.404523, -1.630213, 1, 0.4039216, 0, 1,
-1.525342, -0.03182317, -1.414147, 1, 0.4078431, 0, 1,
-1.515753, 1.383979, -0.4028981, 1, 0.4156863, 0, 1,
-1.512517, -0.06828319, -1.617803, 1, 0.4196078, 0, 1,
-1.511577, 0.1794841, -1.336827, 1, 0.427451, 0, 1,
-1.501692, 0.01563939, -1.269568, 1, 0.4313726, 0, 1,
-1.4977, -0.02872185, -1.390227, 1, 0.4392157, 0, 1,
-1.495254, 2.19848, -0.6888078, 1, 0.4431373, 0, 1,
-1.488696, 1.698455, -0.1352582, 1, 0.4509804, 0, 1,
-1.486501, 2.020166, -0.260086, 1, 0.454902, 0, 1,
-1.477183, 0.1808556, -0.1948752, 1, 0.4627451, 0, 1,
-1.476601, -0.9089351, -3.278762, 1, 0.4666667, 0, 1,
-1.469598, 0.3576694, -0.8272055, 1, 0.4745098, 0, 1,
-1.46198, -1.931847, -1.419482, 1, 0.4784314, 0, 1,
-1.45826, 0.1342657, -1.329486, 1, 0.4862745, 0, 1,
-1.453112, -0.4126423, -2.450865, 1, 0.4901961, 0, 1,
-1.448256, 0.03091962, -1.542637, 1, 0.4980392, 0, 1,
-1.444242, 0.2447294, -1.969168, 1, 0.5058824, 0, 1,
-1.428979, 1.139444, 1.24161, 1, 0.509804, 0, 1,
-1.422233, 2.343213, 0.5584683, 1, 0.5176471, 0, 1,
-1.408272, -0.2458492, 0.09376903, 1, 0.5215687, 0, 1,
-1.401102, 1.753352, -1.524838, 1, 0.5294118, 0, 1,
-1.391198, 1.089309, -2.231805, 1, 0.5333334, 0, 1,
-1.377955, -0.5811694, -1.632723, 1, 0.5411765, 0, 1,
-1.377172, -0.8622658, -3.13983, 1, 0.5450981, 0, 1,
-1.374968, 0.6453132, -3.067256, 1, 0.5529412, 0, 1,
-1.365399, 2.057751, -0.129014, 1, 0.5568628, 0, 1,
-1.364956, -0.3941355, -2.232664, 1, 0.5647059, 0, 1,
-1.364822, 0.3452005, -1.672336, 1, 0.5686275, 0, 1,
-1.36354, -1.351703, -4.495326, 1, 0.5764706, 0, 1,
-1.341215, 0.5997249, -1.186008, 1, 0.5803922, 0, 1,
-1.340619, 0.7682536, -0.4489939, 1, 0.5882353, 0, 1,
-1.338397, -0.282005, -3.251235, 1, 0.5921569, 0, 1,
-1.336333, 0.2440443, -2.525712, 1, 0.6, 0, 1,
-1.331545, -0.213316, -1.04113, 1, 0.6078432, 0, 1,
-1.327403, 0.1056173, -2.37449, 1, 0.6117647, 0, 1,
-1.323181, 1.085268, -1.381866, 1, 0.6196079, 0, 1,
-1.321728, -0.3458665, -1.233868, 1, 0.6235294, 0, 1,
-1.321507, 0.9843267, -0.7725971, 1, 0.6313726, 0, 1,
-1.316328, -1.298788, -2.958918, 1, 0.6352941, 0, 1,
-1.303857, 0.8682703, -0.7049751, 1, 0.6431373, 0, 1,
-1.298471, 0.5407667, -0.3619544, 1, 0.6470588, 0, 1,
-1.292489, -0.4341572, -1.698589, 1, 0.654902, 0, 1,
-1.287541, -1.172119, -2.439124, 1, 0.6588235, 0, 1,
-1.282359, -0.2364644, -2.314317, 1, 0.6666667, 0, 1,
-1.258314, -0.003555584, -1.045718, 1, 0.6705883, 0, 1,
-1.254914, -0.04353323, -2.079735, 1, 0.6784314, 0, 1,
-1.246235, -2.697668, -2.93782, 1, 0.682353, 0, 1,
-1.241511, 1.00257, -0.8105935, 1, 0.6901961, 0, 1,
-1.234999, 0.3951164, -1.212962, 1, 0.6941177, 0, 1,
-1.225621, 0.5921978, -1.479496, 1, 0.7019608, 0, 1,
-1.212965, -0.6314438, -1.517592, 1, 0.7098039, 0, 1,
-1.209985, -0.5112939, -1.337695, 1, 0.7137255, 0, 1,
-1.198324, 1.755767, -3.576502, 1, 0.7215686, 0, 1,
-1.191049, -0.8549988, -4.156947, 1, 0.7254902, 0, 1,
-1.191043, -1.672677, -2.242491, 1, 0.7333333, 0, 1,
-1.189055, -0.4463154, -3.120708, 1, 0.7372549, 0, 1,
-1.185469, -0.5345543, -0.381168, 1, 0.7450981, 0, 1,
-1.181393, 0.3167581, -1.606517, 1, 0.7490196, 0, 1,
-1.181333, 1.876614, -1.90605, 1, 0.7568628, 0, 1,
-1.163112, 1.021759, -2.425852, 1, 0.7607843, 0, 1,
-1.137222, -1.263137, -1.006047, 1, 0.7686275, 0, 1,
-1.123219, -0.4200166, -1.914967, 1, 0.772549, 0, 1,
-1.118101, 0.3023493, -1.228726, 1, 0.7803922, 0, 1,
-1.115509, 0.3663622, -2.651691, 1, 0.7843137, 0, 1,
-1.109731, 0.2015545, -1.970177, 1, 0.7921569, 0, 1,
-1.109639, 1.954627, -0.1613393, 1, 0.7960784, 0, 1,
-1.099396, 0.05585978, 0.4333378, 1, 0.8039216, 0, 1,
-1.098683, -0.9738959, -4.071109, 1, 0.8117647, 0, 1,
-1.083905, 0.1107473, -1.168913, 1, 0.8156863, 0, 1,
-1.077411, -1.537297, -4.451388, 1, 0.8235294, 0, 1,
-1.074977, -0.5560581, -0.9697478, 1, 0.827451, 0, 1,
-1.071622, -1.235903, -3.919993, 1, 0.8352941, 0, 1,
-1.068855, -0.4681834, -2.354657, 1, 0.8392157, 0, 1,
-1.067595, 0.6652295, 0.02488758, 1, 0.8470588, 0, 1,
-1.067214, -0.4426513, -3.344509, 1, 0.8509804, 0, 1,
-1.05668, 1.031771, -0.9450771, 1, 0.8588235, 0, 1,
-1.05108, -0.1705351, -2.793242, 1, 0.8627451, 0, 1,
-1.047528, -1.646864, -2.746108, 1, 0.8705882, 0, 1,
-1.045132, 1.724139, -2.596586, 1, 0.8745098, 0, 1,
-1.041399, 0.2752225, -0.9052383, 1, 0.8823529, 0, 1,
-1.040645, -1.150476, -3.422435, 1, 0.8862745, 0, 1,
-1.038389, -0.189596, -0.3271703, 1, 0.8941177, 0, 1,
-1.036196, -0.536813, -0.4776922, 1, 0.8980392, 0, 1,
-1.033432, -2.089462, -4.332808, 1, 0.9058824, 0, 1,
-1.030941, -1.519268, -0.8385194, 1, 0.9137255, 0, 1,
-1.029608, -0.4073135, -1.101966, 1, 0.9176471, 0, 1,
-1.012341, 0.1218207, -0.7776088, 1, 0.9254902, 0, 1,
-1.009608, 0.230337, -1.472729, 1, 0.9294118, 0, 1,
-1.003604, 0.2153139, -1.736388, 1, 0.9372549, 0, 1,
-0.9908516, -0.7657751, -2.458036, 1, 0.9411765, 0, 1,
-0.9865078, -0.2338621, -1.386129, 1, 0.9490196, 0, 1,
-0.9836991, -0.334078, -2.021228, 1, 0.9529412, 0, 1,
-0.9828278, 1.468893, -0.1739964, 1, 0.9607843, 0, 1,
-0.9754851, -0.07987633, -1.268046, 1, 0.9647059, 0, 1,
-0.9745331, -0.4666716, -1.396851, 1, 0.972549, 0, 1,
-0.9682674, 2.390572, -0.8990723, 1, 0.9764706, 0, 1,
-0.9661233, -0.848222, -2.190735, 1, 0.9843137, 0, 1,
-0.9637452, -0.6164691, -2.345572, 1, 0.9882353, 0, 1,
-0.9636894, -0.9656752, -3.519323, 1, 0.9960784, 0, 1,
-0.9628822, -0.08885572, -1.448627, 0.9960784, 1, 0, 1,
-0.9612055, 0.4725126, -0.7276353, 0.9921569, 1, 0, 1,
-0.9564895, 0.3659416, -2.278471, 0.9843137, 1, 0, 1,
-0.9529477, 1.182218, -0.9071599, 0.9803922, 1, 0, 1,
-0.9518134, -2.135149, -2.677626, 0.972549, 1, 0, 1,
-0.9505892, -0.9768476, -4.054526, 0.9686275, 1, 0, 1,
-0.9491187, -1.56947, -2.776288, 0.9607843, 1, 0, 1,
-0.9488536, 0.04657917, -2.547957, 0.9568627, 1, 0, 1,
-0.9463149, 0.6537241, -2.989242, 0.9490196, 1, 0, 1,
-0.9351833, 1.330942, -2.213956, 0.945098, 1, 0, 1,
-0.9333456, -0.605779, -2.430309, 0.9372549, 1, 0, 1,
-0.9326548, 2.2052, 1.011593, 0.9333333, 1, 0, 1,
-0.9288024, -0.4608523, -2.080127, 0.9254902, 1, 0, 1,
-0.9287648, -2.662418, -1.164572, 0.9215686, 1, 0, 1,
-0.9243061, 0.6586474, -1.34573, 0.9137255, 1, 0, 1,
-0.9210038, 1.488507, -1.111, 0.9098039, 1, 0, 1,
-0.9170299, 0.7304828, -0.1549746, 0.9019608, 1, 0, 1,
-0.916621, -0.07705012, -0.4888285, 0.8941177, 1, 0, 1,
-0.9154919, 0.4882688, -0.5025308, 0.8901961, 1, 0, 1,
-0.9069977, -0.1073829, -2.517282, 0.8823529, 1, 0, 1,
-0.9067624, 1.788182, -0.285533, 0.8784314, 1, 0, 1,
-0.9037125, 0.755128, -1.537644, 0.8705882, 1, 0, 1,
-0.8919927, 0.7431526, -0.434943, 0.8666667, 1, 0, 1,
-0.8822376, -1.532565, -2.358389, 0.8588235, 1, 0, 1,
-0.8791676, 1.168045, -0.35407, 0.854902, 1, 0, 1,
-0.8768646, -0.2122141, -3.282787, 0.8470588, 1, 0, 1,
-0.876405, 1.335686, -1.0084, 0.8431373, 1, 0, 1,
-0.8736482, 0.9315234, -0.5050126, 0.8352941, 1, 0, 1,
-0.8699129, 0.3901045, -0.8374848, 0.8313726, 1, 0, 1,
-0.8685809, -0.9223965, -1.473359, 0.8235294, 1, 0, 1,
-0.8684778, -0.6958801, -1.815448, 0.8196079, 1, 0, 1,
-0.8669036, 0.07936766, -1.656983, 0.8117647, 1, 0, 1,
-0.8668026, -0.3161901, -2.365098, 0.8078431, 1, 0, 1,
-0.8618486, 0.1919005, 0.06314894, 0.8, 1, 0, 1,
-0.8614145, -0.706354, -2.28924, 0.7921569, 1, 0, 1,
-0.8536854, -0.5937281, -2.825395, 0.7882353, 1, 0, 1,
-0.8395846, 2.187653, -1.062315, 0.7803922, 1, 0, 1,
-0.8369802, -0.5997658, -3.195831, 0.7764706, 1, 0, 1,
-0.8318267, -0.05726169, -1.055845, 0.7686275, 1, 0, 1,
-0.8316512, -0.1595554, -1.095443, 0.7647059, 1, 0, 1,
-0.8270379, -0.008734941, -1.959279, 0.7568628, 1, 0, 1,
-0.822322, -0.1726443, -1.383231, 0.7529412, 1, 0, 1,
-0.819218, 0.7750451, -0.5603298, 0.7450981, 1, 0, 1,
-0.811989, -0.2109529, -3.937206, 0.7411765, 1, 0, 1,
-0.8107141, -0.3373937, -2.856313, 0.7333333, 1, 0, 1,
-0.8092925, -1.010426, -1.355616, 0.7294118, 1, 0, 1,
-0.8067249, -0.7843935, -3.036103, 0.7215686, 1, 0, 1,
-0.8057603, 0.7820543, -1.044194, 0.7176471, 1, 0, 1,
-0.8042455, -1.273995, -1.411363, 0.7098039, 1, 0, 1,
-0.8031548, -0.6145391, -1.973214, 0.7058824, 1, 0, 1,
-0.8005658, 0.03083805, -1.98934, 0.6980392, 1, 0, 1,
-0.7964794, 0.257054, -2.537431, 0.6901961, 1, 0, 1,
-0.7964764, 1.607436, -0.7439123, 0.6862745, 1, 0, 1,
-0.7944336, -0.5805442, -0.6952034, 0.6784314, 1, 0, 1,
-0.794125, 2.028595, -1.282325, 0.6745098, 1, 0, 1,
-0.7890412, -0.03275632, -1.525821, 0.6666667, 1, 0, 1,
-0.7853234, -0.2166224, -3.273876, 0.6627451, 1, 0, 1,
-0.7823234, 0.4263779, -0.251979, 0.654902, 1, 0, 1,
-0.7776299, 0.03259121, -0.5502623, 0.6509804, 1, 0, 1,
-0.7659927, -1.573701, -2.112417, 0.6431373, 1, 0, 1,
-0.7655575, 0.6560544, 0.5078242, 0.6392157, 1, 0, 1,
-0.7637646, 1.703148, -1.832253, 0.6313726, 1, 0, 1,
-0.758268, 1.513259, -0.531481, 0.627451, 1, 0, 1,
-0.7579458, -0.7803789, -4.199474, 0.6196079, 1, 0, 1,
-0.7512883, -1.648489, -2.631396, 0.6156863, 1, 0, 1,
-0.7503976, 0.1039883, -0.4406745, 0.6078432, 1, 0, 1,
-0.7492321, 0.1788289, -1.983355, 0.6039216, 1, 0, 1,
-0.7487218, -0.7895482, -1.957695, 0.5960785, 1, 0, 1,
-0.7471223, -0.9491705, -2.738656, 0.5882353, 1, 0, 1,
-0.74418, -1.389837, -1.141231, 0.5843138, 1, 0, 1,
-0.7426147, -0.01229975, -0.8561154, 0.5764706, 1, 0, 1,
-0.7383747, -0.1648249, -3.242592, 0.572549, 1, 0, 1,
-0.7320326, -0.1644424, -2.442055, 0.5647059, 1, 0, 1,
-0.7203075, 0.3716096, 0.2216814, 0.5607843, 1, 0, 1,
-0.7175402, 0.04119348, -1.996601, 0.5529412, 1, 0, 1,
-0.705504, 0.7483067, -1.339472, 0.5490196, 1, 0, 1,
-0.7052856, 1.118799, -1.42211, 0.5411765, 1, 0, 1,
-0.703852, 0.5570667, -0.5547433, 0.5372549, 1, 0, 1,
-0.6899096, -1.055841, -1.620973, 0.5294118, 1, 0, 1,
-0.6827464, 0.3737688, -1.719926, 0.5254902, 1, 0, 1,
-0.6752737, 0.6249278, -2.883538, 0.5176471, 1, 0, 1,
-0.6726449, 1.370867, -1.117923, 0.5137255, 1, 0, 1,
-0.6716713, -0.02142796, -1.421697, 0.5058824, 1, 0, 1,
-0.6697541, 0.7250041, -0.9147135, 0.5019608, 1, 0, 1,
-0.6685628, -0.03449443, -1.199898, 0.4941176, 1, 0, 1,
-0.6602884, -1.637045, -3.264843, 0.4862745, 1, 0, 1,
-0.6571575, -0.2847465, -2.7042, 0.4823529, 1, 0, 1,
-0.6545098, -1.373403, -5.175287, 0.4745098, 1, 0, 1,
-0.6518917, -0.7825435, -2.140637, 0.4705882, 1, 0, 1,
-0.6468036, -0.631205, -3.179896, 0.4627451, 1, 0, 1,
-0.6455232, -0.5574316, -4.671285, 0.4588235, 1, 0, 1,
-0.6428457, -0.5274117, -2.537051, 0.4509804, 1, 0, 1,
-0.6359439, -1.092703, -3.078656, 0.4470588, 1, 0, 1,
-0.6325888, 0.1874463, 0.1982216, 0.4392157, 1, 0, 1,
-0.6309071, -0.2468783, -3.296455, 0.4352941, 1, 0, 1,
-0.6292958, 0.1383602, -2.642241, 0.427451, 1, 0, 1,
-0.6264123, 0.07902373, -1.370717, 0.4235294, 1, 0, 1,
-0.6247849, 1.504493, -0.8877465, 0.4156863, 1, 0, 1,
-0.6214849, -0.9738343, -2.739661, 0.4117647, 1, 0, 1,
-0.6155931, -0.6223228, -1.445313, 0.4039216, 1, 0, 1,
-0.6101122, 0.4008892, 0.6258238, 0.3960784, 1, 0, 1,
-0.6084362, -0.2203225, -2.539509, 0.3921569, 1, 0, 1,
-0.6079345, 1.069749, -0.9352607, 0.3843137, 1, 0, 1,
-0.6050948, -0.2103172, -1.595981, 0.3803922, 1, 0, 1,
-0.6012446, -0.5508178, -2.159545, 0.372549, 1, 0, 1,
-0.6009029, 2.08363, -0.8984209, 0.3686275, 1, 0, 1,
-0.5987355, -0.1566857, -1.247705, 0.3607843, 1, 0, 1,
-0.591852, -0.09276983, -2.336021, 0.3568628, 1, 0, 1,
-0.5907617, -1.347775, -2.715957, 0.3490196, 1, 0, 1,
-0.5906352, 0.09399705, -0.5946912, 0.345098, 1, 0, 1,
-0.5902655, 1.588158, 0.01441593, 0.3372549, 1, 0, 1,
-0.5869536, 1.02563, -2.319353, 0.3333333, 1, 0, 1,
-0.5775409, -0.06933217, -1.279009, 0.3254902, 1, 0, 1,
-0.5744693, -0.3255039, -0.4442798, 0.3215686, 1, 0, 1,
-0.5702057, 1.21103, -2.492007, 0.3137255, 1, 0, 1,
-0.567867, 1.296501, 0.4101195, 0.3098039, 1, 0, 1,
-0.5640247, -0.3332871, -3.040636, 0.3019608, 1, 0, 1,
-0.5637252, -0.5777014, -2.320416, 0.2941177, 1, 0, 1,
-0.5457224, 0.3730341, -0.7019002, 0.2901961, 1, 0, 1,
-0.5370612, -0.177963, -2.063236, 0.282353, 1, 0, 1,
-0.5315235, -0.1283117, -0.7944816, 0.2784314, 1, 0, 1,
-0.5283765, -0.336227, -1.489097, 0.2705882, 1, 0, 1,
-0.5281471, 0.721847, -1.512281, 0.2666667, 1, 0, 1,
-0.5240144, 0.5238861, -0.08013424, 0.2588235, 1, 0, 1,
-0.5215904, 0.9872788, 0.593687, 0.254902, 1, 0, 1,
-0.5214564, 1.113047, 0.621918, 0.2470588, 1, 0, 1,
-0.5209432, -1.112306, -3.187778, 0.2431373, 1, 0, 1,
-0.5195259, -0.361393, -1.998475, 0.2352941, 1, 0, 1,
-0.5192579, -0.6878359, -1.899991, 0.2313726, 1, 0, 1,
-0.5181069, 0.6592834, 0.01972115, 0.2235294, 1, 0, 1,
-0.5174524, 0.6409893, -1.827385, 0.2196078, 1, 0, 1,
-0.5102683, -2.073988, -4.06202, 0.2117647, 1, 0, 1,
-0.5069009, -1.007434, -3.14127, 0.2078431, 1, 0, 1,
-0.4982196, -0.3315639, -3.376678, 0.2, 1, 0, 1,
-0.4951046, 1.252575, 0.1978115, 0.1921569, 1, 0, 1,
-0.493514, -0.3819971, -1.973207, 0.1882353, 1, 0, 1,
-0.4926489, 0.6973199, -0.2843179, 0.1803922, 1, 0, 1,
-0.4898562, -1.436702, -3.586583, 0.1764706, 1, 0, 1,
-0.4851916, 1.603288, 0.1283442, 0.1686275, 1, 0, 1,
-0.4839863, 0.4993195, -1.527509, 0.1647059, 1, 0, 1,
-0.4804662, -1.318585, -4.113629, 0.1568628, 1, 0, 1,
-0.4796845, 0.3063358, -1.762132, 0.1529412, 1, 0, 1,
-0.4682917, 2.117976, 0.5961852, 0.145098, 1, 0, 1,
-0.4665757, 0.4537106, -1.256675, 0.1411765, 1, 0, 1,
-0.4635327, 0.8229671, 0.7314823, 0.1333333, 1, 0, 1,
-0.463273, 0.65999, -1.381462, 0.1294118, 1, 0, 1,
-0.4624747, -0.0457818, -1.721092, 0.1215686, 1, 0, 1,
-0.460924, 0.5321078, -1.525444, 0.1176471, 1, 0, 1,
-0.4594718, 0.9617472, -0.8330429, 0.1098039, 1, 0, 1,
-0.4583811, -1.868702, -3.151505, 0.1058824, 1, 0, 1,
-0.4580811, -0.3574194, -2.610808, 0.09803922, 1, 0, 1,
-0.453137, -1.635922, -3.504071, 0.09019608, 1, 0, 1,
-0.4470686, -0.7992694, -2.569651, 0.08627451, 1, 0, 1,
-0.4378255, 0.05519103, -2.484753, 0.07843138, 1, 0, 1,
-0.437123, -0.8672903, -1.776243, 0.07450981, 1, 0, 1,
-0.4339071, 0.6729962, -0.5095066, 0.06666667, 1, 0, 1,
-0.4333073, -0.9299326, -2.214962, 0.0627451, 1, 0, 1,
-0.4300878, 0.2721239, -0.1127563, 0.05490196, 1, 0, 1,
-0.4300765, 2.096834, -0.1076843, 0.05098039, 1, 0, 1,
-0.4255892, 0.2631511, -1.515822, 0.04313726, 1, 0, 1,
-0.4254467, 0.5019109, -0.4553505, 0.03921569, 1, 0, 1,
-0.4251453, 0.5635977, -1.553215, 0.03137255, 1, 0, 1,
-0.4243225, 1.187158, -1.339503, 0.02745098, 1, 0, 1,
-0.4240866, 0.723851, 0.687131, 0.01960784, 1, 0, 1,
-0.4235043, -0.339582, -2.018611, 0.01568628, 1, 0, 1,
-0.4199628, -0.2829864, -0.8062783, 0.007843138, 1, 0, 1,
-0.4139479, 0.7384205, -1.147511, 0.003921569, 1, 0, 1,
-0.4113631, -0.6173043, -3.012561, 0, 1, 0.003921569, 1,
-0.4108121, -1.042615, -3.304256, 0, 1, 0.01176471, 1,
-0.41042, -0.9691656, -2.393177, 0, 1, 0.01568628, 1,
-0.4096885, 0.3910585, -0.1989878, 0, 1, 0.02352941, 1,
-0.3988954, -0.3253582, -2.891715, 0, 1, 0.02745098, 1,
-0.3926378, 0.2160291, -1.914622, 0, 1, 0.03529412, 1,
-0.3873071, 0.5316049, -2.959391, 0, 1, 0.03921569, 1,
-0.387264, 0.5330687, -1.085699, 0, 1, 0.04705882, 1,
-0.3871736, 0.5503675, -1.550846, 0, 1, 0.05098039, 1,
-0.3866664, -1.947033, -1.580392, 0, 1, 0.05882353, 1,
-0.3860008, 0.8126295, -1.895412, 0, 1, 0.0627451, 1,
-0.3837154, 0.3981546, 0.0624684, 0, 1, 0.07058824, 1,
-0.3830165, 1.620343, -0.9680318, 0, 1, 0.07450981, 1,
-0.3813544, -0.7156334, -3.810961, 0, 1, 0.08235294, 1,
-0.3779989, -0.7123052, -3.158303, 0, 1, 0.08627451, 1,
-0.3685588, 1.728853, -1.185732, 0, 1, 0.09411765, 1,
-0.3638636, 0.1528456, -0.225139, 0, 1, 0.1019608, 1,
-0.3637128, -0.009806746, -0.6930885, 0, 1, 0.1058824, 1,
-0.3621295, -0.8380833, -3.648517, 0, 1, 0.1137255, 1,
-0.3572855, 0.6942704, 0.3068775, 0, 1, 0.1176471, 1,
-0.3564958, -0.1895008, -3.229429, 0, 1, 0.1254902, 1,
-0.356487, 0.8067757, -1.476998, 0, 1, 0.1294118, 1,
-0.3532685, 0.9474562, -0.2778983, 0, 1, 0.1372549, 1,
-0.3527862, 0.09683222, -2.421129, 0, 1, 0.1411765, 1,
-0.3527621, -0.2468697, -2.835551, 0, 1, 0.1490196, 1,
-0.3526056, 0.7201411, -0.9938593, 0, 1, 0.1529412, 1,
-0.3497805, 0.2007084, -0.7510275, 0, 1, 0.1607843, 1,
-0.3492244, 1.009611, 0.3841967, 0, 1, 0.1647059, 1,
-0.3485509, -2.074192, -2.707794, 0, 1, 0.172549, 1,
-0.3465449, 1.458589, 1.294504, 0, 1, 0.1764706, 1,
-0.3425238, -0.3435822, -3.356001, 0, 1, 0.1843137, 1,
-0.3416474, -1.311059, -4.002907, 0, 1, 0.1882353, 1,
-0.3360614, -0.1458792, -3.102664, 0, 1, 0.1960784, 1,
-0.3360418, -0.04693094, -2.321916, 0, 1, 0.2039216, 1,
-0.3354401, 0.05211411, -0.3253052, 0, 1, 0.2078431, 1,
-0.3350449, -1.007659, -3.820371, 0, 1, 0.2156863, 1,
-0.3334166, 3.000088, 0.9445337, 0, 1, 0.2196078, 1,
-0.3295619, -1.751887, -3.256964, 0, 1, 0.227451, 1,
-0.3286166, -0.6904263, -1.886685, 0, 1, 0.2313726, 1,
-0.3270042, 2.118715, 1.991542, 0, 1, 0.2392157, 1,
-0.3230149, 0.5577062, 0.1029222, 0, 1, 0.2431373, 1,
-0.3206307, -0.07369531, -1.869582, 0, 1, 0.2509804, 1,
-0.3177569, -1.029178, -1.80226, 0, 1, 0.254902, 1,
-0.3165904, 0.7760663, -0.0005289858, 0, 1, 0.2627451, 1,
-0.3132568, 0.2884673, 1.3924, 0, 1, 0.2666667, 1,
-0.312998, -0.8889795, -3.773933, 0, 1, 0.2745098, 1,
-0.3104831, -0.02005741, 0.2654712, 0, 1, 0.2784314, 1,
-0.3100084, -0.1081686, -3.110435, 0, 1, 0.2862745, 1,
-0.3036409, 0.2564704, -1.546979, 0, 1, 0.2901961, 1,
-0.3031873, -0.8614263, -2.224881, 0, 1, 0.2980392, 1,
-0.3011188, 2.317887, 1.429012, 0, 1, 0.3058824, 1,
-0.2993368, 0.5356591, -2.412906, 0, 1, 0.3098039, 1,
-0.2976271, 0.3781519, -0.3183032, 0, 1, 0.3176471, 1,
-0.2972255, 1.203177, 0.4036027, 0, 1, 0.3215686, 1,
-0.2961366, 0.2511351, -2.08478, 0, 1, 0.3294118, 1,
-0.2923083, -1.914135, -2.579336, 0, 1, 0.3333333, 1,
-0.2917668, 0.71083, 1.483942, 0, 1, 0.3411765, 1,
-0.2901698, -0.3783398, -3.670048, 0, 1, 0.345098, 1,
-0.2840514, -0.5913498, -3.569987, 0, 1, 0.3529412, 1,
-0.2806028, -1.289614, -3.297841, 0, 1, 0.3568628, 1,
-0.2775846, 0.1861043, 0.5182666, 0, 1, 0.3647059, 1,
-0.2775086, 0.7120109, 0.1244691, 0, 1, 0.3686275, 1,
-0.2755408, 0.3151462, -0.2651607, 0, 1, 0.3764706, 1,
-0.2752056, 0.6689215, 0.5864666, 0, 1, 0.3803922, 1,
-0.2702523, 0.6018344, -1.335034, 0, 1, 0.3882353, 1,
-0.269658, -1.331318, -1.722942, 0, 1, 0.3921569, 1,
-0.2683043, -0.6044444, -2.625355, 0, 1, 0.4, 1,
-0.2630854, 0.5323385, -0.5806602, 0, 1, 0.4078431, 1,
-0.2617465, -1.52511, -3.112066, 0, 1, 0.4117647, 1,
-0.2590947, -0.9269374, -2.406267, 0, 1, 0.4196078, 1,
-0.255303, -1.356238, -2.897852, 0, 1, 0.4235294, 1,
-0.2519269, -1.305636, -3.232511, 0, 1, 0.4313726, 1,
-0.2502385, 0.2170034, -3.378906, 0, 1, 0.4352941, 1,
-0.2483155, -0.5384434, -3.06604, 0, 1, 0.4431373, 1,
-0.2467202, 0.5264435, -2.319067, 0, 1, 0.4470588, 1,
-0.2466394, -0.5771304, -3.676063, 0, 1, 0.454902, 1,
-0.2466028, 1.809572, 2.076443, 0, 1, 0.4588235, 1,
-0.2437281, -0.9866111, -3.104877, 0, 1, 0.4666667, 1,
-0.2436115, 1.800346, 0.7857841, 0, 1, 0.4705882, 1,
-0.2434289, -0.459218, -2.115534, 0, 1, 0.4784314, 1,
-0.2385007, 0.5402496, -1.501972, 0, 1, 0.4823529, 1,
-0.2375225, 0.4566079, -2.019729, 0, 1, 0.4901961, 1,
-0.2324298, -1.260568, -3.050681, 0, 1, 0.4941176, 1,
-0.2323586, -0.1569668, -1.033435, 0, 1, 0.5019608, 1,
-0.2284895, 0.3468811, -1.703431, 0, 1, 0.509804, 1,
-0.2284726, -0.4536674, -0.8357165, 0, 1, 0.5137255, 1,
-0.2260765, -0.8110935, -3.310871, 0, 1, 0.5215687, 1,
-0.2216451, -0.3602751, -2.618226, 0, 1, 0.5254902, 1,
-0.2205014, -1.000819, -4.122771, 0, 1, 0.5333334, 1,
-0.2134705, -0.6417885, -4.25975, 0, 1, 0.5372549, 1,
-0.2107988, 0.4960044, 0.6661618, 0, 1, 0.5450981, 1,
-0.2100797, 0.7252911, 0.9895131, 0, 1, 0.5490196, 1,
-0.2091809, -0.3670626, -3.790656, 0, 1, 0.5568628, 1,
-0.2084006, -0.08831666, -1.098469, 0, 1, 0.5607843, 1,
-0.200044, 0.4338419, -0.6097357, 0, 1, 0.5686275, 1,
-0.19465, -1.120887, -3.028334, 0, 1, 0.572549, 1,
-0.1945703, 2.143957, -0.4868807, 0, 1, 0.5803922, 1,
-0.1930687, 1.477592, 0.2606842, 0, 1, 0.5843138, 1,
-0.1907906, -0.7794204, -2.434266, 0, 1, 0.5921569, 1,
-0.1904072, -0.5846491, -2.696764, 0, 1, 0.5960785, 1,
-0.1903234, 0.1390141, -0.6547468, 0, 1, 0.6039216, 1,
-0.188922, 1.049134, -0.9870557, 0, 1, 0.6117647, 1,
-0.1888846, -0.08309232, -2.008359, 0, 1, 0.6156863, 1,
-0.1875605, 0.5622407, -0.3286352, 0, 1, 0.6235294, 1,
-0.1872665, 0.1723689, -0.7867352, 0, 1, 0.627451, 1,
-0.1863919, -1.431768, -1.801478, 0, 1, 0.6352941, 1,
-0.1854982, 1.786624, 0.515636, 0, 1, 0.6392157, 1,
-0.1807441, -0.7847718, -3.555194, 0, 1, 0.6470588, 1,
-0.179414, 0.3875819, 0.7297949, 0, 1, 0.6509804, 1,
-0.173399, -1.778468, -3.636949, 0, 1, 0.6588235, 1,
-0.1733501, -0.7238718, -2.198255, 0, 1, 0.6627451, 1,
-0.1733355, -1.547515, -3.477353, 0, 1, 0.6705883, 1,
-0.1718595, -0.5279092, -2.855278, 0, 1, 0.6745098, 1,
-0.1702966, -1.817346, -3.355625, 0, 1, 0.682353, 1,
-0.1687836, -2.016441, -1.955174, 0, 1, 0.6862745, 1,
-0.1668132, 0.1090873, -2.798122, 0, 1, 0.6941177, 1,
-0.1660022, 0.3185751, -1.063879, 0, 1, 0.7019608, 1,
-0.1652961, -0.2997994, -2.37125, 0, 1, 0.7058824, 1,
-0.1630336, 0.2639295, -2.91518, 0, 1, 0.7137255, 1,
-0.1622167, -1.018874, -3.728873, 0, 1, 0.7176471, 1,
-0.1604899, 0.82093, -0.9794492, 0, 1, 0.7254902, 1,
-0.157781, -0.9173322, -2.07106, 0, 1, 0.7294118, 1,
-0.1541385, -1.209813, -2.400942, 0, 1, 0.7372549, 1,
-0.1534904, 0.0412576, -0.2282559, 0, 1, 0.7411765, 1,
-0.147937, 0.4585752, 1.476687, 0, 1, 0.7490196, 1,
-0.145291, -0.4280864, -2.637594, 0, 1, 0.7529412, 1,
-0.1447864, -1.792329, -2.152419, 0, 1, 0.7607843, 1,
-0.1414467, 1.560588, 1.541695, 0, 1, 0.7647059, 1,
-0.1408243, -0.687034, -2.355376, 0, 1, 0.772549, 1,
-0.1361901, 0.8153914, 0.06037283, 0, 1, 0.7764706, 1,
-0.1351559, 0.6766903, 0.7314579, 0, 1, 0.7843137, 1,
-0.1347568, 0.5435631, -2.466977, 0, 1, 0.7882353, 1,
-0.134471, -0.3850637, -0.9932226, 0, 1, 0.7960784, 1,
-0.1336699, -0.1043974, -4.303355, 0, 1, 0.8039216, 1,
-0.1307305, -0.4290282, -3.542667, 0, 1, 0.8078431, 1,
-0.1306258, -1.31479, -1.323289, 0, 1, 0.8156863, 1,
-0.1271034, -0.01702625, -2.712121, 0, 1, 0.8196079, 1,
-0.1204273, 0.4666719, -1.218268, 0, 1, 0.827451, 1,
-0.1174054, 0.9250585, 0.3135931, 0, 1, 0.8313726, 1,
-0.1172505, 0.708323, -0.6619651, 0, 1, 0.8392157, 1,
-0.1171258, -0.433196, -2.373294, 0, 1, 0.8431373, 1,
-0.1171224, 1.959732, 0.5135917, 0, 1, 0.8509804, 1,
-0.11675, 1.770169, -2.838056, 0, 1, 0.854902, 1,
-0.1165964, -0.6937407, -3.855795, 0, 1, 0.8627451, 1,
-0.1010208, 0.8865591, 1.045488, 0, 1, 0.8666667, 1,
-0.09983052, 0.5682661, -1.449503, 0, 1, 0.8745098, 1,
-0.09969382, 0.2351584, -1.661634, 0, 1, 0.8784314, 1,
-0.09359344, 0.4871588, -0.6849577, 0, 1, 0.8862745, 1,
-0.09139498, -0.7205588, -1.749874, 0, 1, 0.8901961, 1,
-0.08263531, -0.838166, -1.780294, 0, 1, 0.8980392, 1,
-0.08151515, 2.108428, 0.434897, 0, 1, 0.9058824, 1,
-0.07975745, -0.1290988, -0.9023558, 0, 1, 0.9098039, 1,
-0.07657955, 0.3331271, -1.08358, 0, 1, 0.9176471, 1,
-0.07511491, 0.0697393, -0.4811786, 0, 1, 0.9215686, 1,
-0.06520616, -0.1715487, -0.6413752, 0, 1, 0.9294118, 1,
-0.06433025, 0.03643891, 0.9343952, 0, 1, 0.9333333, 1,
-0.05956304, 1.606623, 0.05802915, 0, 1, 0.9411765, 1,
-0.05567879, 0.7891048, 0.1418263, 0, 1, 0.945098, 1,
-0.05554844, 1.702644, 0.569428, 0, 1, 0.9529412, 1,
-0.052876, 0.02345025, -2.777457, 0, 1, 0.9568627, 1,
-0.04859722, -0.2141557, -4.148694, 0, 1, 0.9647059, 1,
-0.04757703, -1.637558, -2.42409, 0, 1, 0.9686275, 1,
-0.03836742, -0.199019, -4.785232, 0, 1, 0.9764706, 1,
-0.0333746, -0.7174162, -3.01125, 0, 1, 0.9803922, 1,
-0.02362581, 1.155642, 1.099126, 0, 1, 0.9882353, 1,
-0.02223676, 0.7099224, -1.903656, 0, 1, 0.9921569, 1,
-0.01330519, 1.193144, -0.5098618, 0, 1, 1, 1,
-0.003712231, -0.7374527, -5.651565, 0, 0.9921569, 1, 1,
0.0008373798, -0.9810914, 3.724198, 0, 0.9882353, 1, 1,
0.003342769, 0.811814, 1.066158, 0, 0.9803922, 1, 1,
0.005348035, 1.829008, -0.1851126, 0, 0.9764706, 1, 1,
0.01075455, -0.582912, 3.93049, 0, 0.9686275, 1, 1,
0.01349495, 1.96336, -1.469277, 0, 0.9647059, 1, 1,
0.01657693, -1.100243, 3.99809, 0, 0.9568627, 1, 1,
0.0179602, 0.3068431, -0.235888, 0, 0.9529412, 1, 1,
0.01798191, -0.6210244, 3.304446, 0, 0.945098, 1, 1,
0.01843132, -1.792289, 2.334147, 0, 0.9411765, 1, 1,
0.01851983, 0.9448313, -0.06287538, 0, 0.9333333, 1, 1,
0.02105744, 1.275165, -0.6733226, 0, 0.9294118, 1, 1,
0.02222155, -0.1831921, 3.349896, 0, 0.9215686, 1, 1,
0.02301275, 0.6914883, 0.06233269, 0, 0.9176471, 1, 1,
0.02464577, -0.9797738, 1.328132, 0, 0.9098039, 1, 1,
0.02519542, 0.5247902, -1.008575, 0, 0.9058824, 1, 1,
0.02667973, 0.3506354, -1.327092, 0, 0.8980392, 1, 1,
0.03288942, 0.1598748, -0.2714469, 0, 0.8901961, 1, 1,
0.03293078, 1.719736, 1.270089, 0, 0.8862745, 1, 1,
0.03646973, 3.070463, 0.5079213, 0, 0.8784314, 1, 1,
0.03651721, -0.3379664, 4.986346, 0, 0.8745098, 1, 1,
0.03716427, 1.135564, 0.3755724, 0, 0.8666667, 1, 1,
0.03730557, 0.2913051, -0.6634949, 0, 0.8627451, 1, 1,
0.03756529, -1.336057, 3.555582, 0, 0.854902, 1, 1,
0.03910385, -0.561663, 1.770138, 0, 0.8509804, 1, 1,
0.03999184, 0.8213064, 0.00647571, 0, 0.8431373, 1, 1,
0.04012148, -0.5792826, 2.907645, 0, 0.8392157, 1, 1,
0.04723946, 1.040805, 1.976923, 0, 0.8313726, 1, 1,
0.04882091, -0.8695012, 3.073343, 0, 0.827451, 1, 1,
0.05273186, 0.787829, 1.208861, 0, 0.8196079, 1, 1,
0.05700523, -1.32751, 3.713318, 0, 0.8156863, 1, 1,
0.05949895, -0.1685099, 2.345002, 0, 0.8078431, 1, 1,
0.06282552, 1.308019, 1.236744, 0, 0.8039216, 1, 1,
0.06396884, 1.15892, -1.648461, 0, 0.7960784, 1, 1,
0.06531557, 2.30408, 0.04155451, 0, 0.7882353, 1, 1,
0.06829309, 0.9638835, 1.030495, 0, 0.7843137, 1, 1,
0.070065, 1.024216, 0.9522563, 0, 0.7764706, 1, 1,
0.07111697, 0.3332776, 2.347303, 0, 0.772549, 1, 1,
0.07471241, -1.668961, 2.609948, 0, 0.7647059, 1, 1,
0.07521505, -0.9174795, 3.310364, 0, 0.7607843, 1, 1,
0.07996779, -1.382748, 3.46743, 0, 0.7529412, 1, 1,
0.08234964, -0.04598689, 2.816832, 0, 0.7490196, 1, 1,
0.08345755, -0.3864329, 1.675973, 0, 0.7411765, 1, 1,
0.08561644, 0.6177862, 0.6043234, 0, 0.7372549, 1, 1,
0.08761127, -0.230962, 4.138988, 0, 0.7294118, 1, 1,
0.09172388, 0.8425366, 1.538763, 0, 0.7254902, 1, 1,
0.09259799, -0.3508938, 2.022641, 0, 0.7176471, 1, 1,
0.09410254, 1.243307, -0.9451439, 0, 0.7137255, 1, 1,
0.09584825, -0.227609, 1.778609, 0, 0.7058824, 1, 1,
0.1039361, -0.1147964, 2.309424, 0, 0.6980392, 1, 1,
0.1075835, -0.09383723, 2.13548, 0, 0.6941177, 1, 1,
0.1084584, -1.501507, 4.137857, 0, 0.6862745, 1, 1,
0.1220348, 1.508926, 2.47485, 0, 0.682353, 1, 1,
0.1305084, -0.6162238, 4.456765, 0, 0.6745098, 1, 1,
0.1329328, 0.05139843, -0.2997217, 0, 0.6705883, 1, 1,
0.1363149, 0.3179669, -0.3605241, 0, 0.6627451, 1, 1,
0.1415896, -0.3578542, 3.207206, 0, 0.6588235, 1, 1,
0.1487977, -1.229638, 3.666967, 0, 0.6509804, 1, 1,
0.1521122, 0.184273, 0.6417457, 0, 0.6470588, 1, 1,
0.1579385, 0.02194324, -0.01347695, 0, 0.6392157, 1, 1,
0.158799, 1.839421, -0.4069043, 0, 0.6352941, 1, 1,
0.1627065, 0.3285929, 1.227927, 0, 0.627451, 1, 1,
0.1639831, 0.5918037, 1.943317, 0, 0.6235294, 1, 1,
0.1651142, -0.3872593, 2.74245, 0, 0.6156863, 1, 1,
0.1703676, 0.5828857, 0.2583733, 0, 0.6117647, 1, 1,
0.1722509, 0.8223099, -1.053481, 0, 0.6039216, 1, 1,
0.1726552, 0.1637339, 0.717028, 0, 0.5960785, 1, 1,
0.1736727, 0.5956718, 2.53557, 0, 0.5921569, 1, 1,
0.1737853, -0.1986395, 3.304403, 0, 0.5843138, 1, 1,
0.1755969, 1.499626, -0.4485301, 0, 0.5803922, 1, 1,
0.1779299, -0.5022315, 1.803535, 0, 0.572549, 1, 1,
0.1832322, 0.1351219, 1.363703, 0, 0.5686275, 1, 1,
0.1845164, -0.3693642, 3.548636, 0, 0.5607843, 1, 1,
0.1859568, -0.4846762, 1.669005, 0, 0.5568628, 1, 1,
0.1872692, 1.434737, 2.148202, 0, 0.5490196, 1, 1,
0.1928564, -0.005013336, 0.8571258, 0, 0.5450981, 1, 1,
0.2018869, -0.9802186, 2.388676, 0, 0.5372549, 1, 1,
0.2040814, 0.7470385, 1.8434, 0, 0.5333334, 1, 1,
0.2101062, 0.9062474, -0.9126612, 0, 0.5254902, 1, 1,
0.2107456, -1.545643, 4.226448, 0, 0.5215687, 1, 1,
0.2123872, -0.6016137, 2.619642, 0, 0.5137255, 1, 1,
0.2160247, 1.003276, 0.2405295, 0, 0.509804, 1, 1,
0.2205536, -0.006290953, 1.298578, 0, 0.5019608, 1, 1,
0.2212412, 0.5018951, -0.2049802, 0, 0.4941176, 1, 1,
0.2222189, -0.855776, 3.146395, 0, 0.4901961, 1, 1,
0.225158, 1.176772, -0.3149945, 0, 0.4823529, 1, 1,
0.226318, 0.1502535, 1.887401, 0, 0.4784314, 1, 1,
0.2274702, 0.2297879, -0.4330406, 0, 0.4705882, 1, 1,
0.2300864, -1.927977, 3.157728, 0, 0.4666667, 1, 1,
0.2325433, -0.4900305, 3.568731, 0, 0.4588235, 1, 1,
0.2328921, 0.785927, -0.198063, 0, 0.454902, 1, 1,
0.235272, 1.955011, -0.3472641, 0, 0.4470588, 1, 1,
0.2398323, -1.685624, 2.208048, 0, 0.4431373, 1, 1,
0.241618, 1.118793, 1.121237, 0, 0.4352941, 1, 1,
0.244807, 0.466401, 1.939607, 0, 0.4313726, 1, 1,
0.2454464, 0.4456133, -0.9736652, 0, 0.4235294, 1, 1,
0.2488716, -1.288673, 1.45695, 0, 0.4196078, 1, 1,
0.2516437, -0.7436121, 4.067218, 0, 0.4117647, 1, 1,
0.2523632, -0.589822, 2.887331, 0, 0.4078431, 1, 1,
0.2538569, -1.017254, 3.897276, 0, 0.4, 1, 1,
0.2713644, -0.1357903, 3.800651, 0, 0.3921569, 1, 1,
0.2728969, -0.4821661, 2.799314, 0, 0.3882353, 1, 1,
0.2745328, -1.057697, 3.299414, 0, 0.3803922, 1, 1,
0.2769433, 0.5930858, 0.2360392, 0, 0.3764706, 1, 1,
0.2795432, -0.1980957, 2.856725, 0, 0.3686275, 1, 1,
0.2813006, 0.168832, 2.323587, 0, 0.3647059, 1, 1,
0.2824243, 0.07393003, 0.5222001, 0, 0.3568628, 1, 1,
0.2896747, 1.142905, -0.3769619, 0, 0.3529412, 1, 1,
0.2915652, 0.2859074, 2.537632, 0, 0.345098, 1, 1,
0.2930332, 0.6351316, 1.534782, 0, 0.3411765, 1, 1,
0.2931942, -0.908269, 3.63577, 0, 0.3333333, 1, 1,
0.2938951, 0.7949538, 1.028146, 0, 0.3294118, 1, 1,
0.2978007, 0.4420457, -0.3240417, 0, 0.3215686, 1, 1,
0.2982425, 0.4350139, 0.2382433, 0, 0.3176471, 1, 1,
0.2986938, -0.3566509, 2.187421, 0, 0.3098039, 1, 1,
0.303308, 0.6924022, 2.013079, 0, 0.3058824, 1, 1,
0.3059073, 1.131561, -0.5814869, 0, 0.2980392, 1, 1,
0.3061901, -0.3395638, 0.8555531, 0, 0.2901961, 1, 1,
0.3128673, 0.1581374, -0.6756124, 0, 0.2862745, 1, 1,
0.3150638, -1.542307, 2.973805, 0, 0.2784314, 1, 1,
0.3162373, -1.769395, 2.746298, 0, 0.2745098, 1, 1,
0.3168615, 0.0724482, 1.512202, 0, 0.2666667, 1, 1,
0.3222586, -0.12205, 2.109382, 0, 0.2627451, 1, 1,
0.3254593, -0.841846, 2.705862, 0, 0.254902, 1, 1,
0.3267492, 1.27101, -0.5091711, 0, 0.2509804, 1, 1,
0.3293531, 0.2643416, 1.414481, 0, 0.2431373, 1, 1,
0.3310595, -0.6188954, 1.169337, 0, 0.2392157, 1, 1,
0.3331465, -0.1036239, 2.692181, 0, 0.2313726, 1, 1,
0.3387416, -0.2356064, 1.030907, 0, 0.227451, 1, 1,
0.3403918, 0.6422197, 0.9099442, 0, 0.2196078, 1, 1,
0.3537994, 1.393552, 0.9744388, 0, 0.2156863, 1, 1,
0.360479, -0.2383598, 1.707007, 0, 0.2078431, 1, 1,
0.3612738, -0.4587234, 2.429209, 0, 0.2039216, 1, 1,
0.3635865, -0.546807, 2.733389, 0, 0.1960784, 1, 1,
0.3680072, -0.8167426, 1.46522, 0, 0.1882353, 1, 1,
0.3703685, 0.9824353, 0.5527247, 0, 0.1843137, 1, 1,
0.3709352, 0.2356377, -0.1180284, 0, 0.1764706, 1, 1,
0.3714942, -0.1073956, 2.083536, 0, 0.172549, 1, 1,
0.3753732, 0.3846741, -0.78769, 0, 0.1647059, 1, 1,
0.3811185, -0.04484264, 1.397106, 0, 0.1607843, 1, 1,
0.3828941, -0.03203024, 2.5015, 0, 0.1529412, 1, 1,
0.383781, 1.18012, 2.20333, 0, 0.1490196, 1, 1,
0.3849772, -0.6068848, 1.306573, 0, 0.1411765, 1, 1,
0.3850411, 0.9817079, 0.2966949, 0, 0.1372549, 1, 1,
0.385077, 0.3604504, -0.4671371, 0, 0.1294118, 1, 1,
0.3858878, -1.259028, 2.795659, 0, 0.1254902, 1, 1,
0.3870032, -0.5983605, 3.334376, 0, 0.1176471, 1, 1,
0.3887621, -1.802168, 3.612296, 0, 0.1137255, 1, 1,
0.3912992, 1.638667, -0.1875208, 0, 0.1058824, 1, 1,
0.3925655, 0.5309822, -1.996593, 0, 0.09803922, 1, 1,
0.3932401, -1.080273, 2.168232, 0, 0.09411765, 1, 1,
0.3949168, -0.1917214, -0.605954, 0, 0.08627451, 1, 1,
0.3950095, -0.9291365, 2.643034, 0, 0.08235294, 1, 1,
0.3952698, -0.2292238, 0.04287002, 0, 0.07450981, 1, 1,
0.3967929, -0.1039113, 1.482933, 0, 0.07058824, 1, 1,
0.4050439, -2.517806, 3.490195, 0, 0.0627451, 1, 1,
0.4102429, -0.8376831, 3.691651, 0, 0.05882353, 1, 1,
0.4102892, 0.5044628, 0.5832585, 0, 0.05098039, 1, 1,
0.4108662, 1.106017, -0.05651594, 0, 0.04705882, 1, 1,
0.4110281, 1.077955, -2.270479, 0, 0.03921569, 1, 1,
0.4164917, -0.2550633, 3.280541, 0, 0.03529412, 1, 1,
0.4172895, 0.189763, 0.2179232, 0, 0.02745098, 1, 1,
0.4203233, -0.5412624, 5.486991, 0, 0.02352941, 1, 1,
0.4223065, -2.082186, 3.474922, 0, 0.01568628, 1, 1,
0.422498, 1.134148, 1.461742, 0, 0.01176471, 1, 1,
0.4234451, -1.443199, 3.445624, 0, 0.003921569, 1, 1,
0.4270907, 1.042584, 0.1366665, 0.003921569, 0, 1, 1,
0.428406, -1.079227, 3.361627, 0.007843138, 0, 1, 1,
0.4404505, -0.4631126, 2.342712, 0.01568628, 0, 1, 1,
0.4485757, 0.4277994, -1.282946, 0.01960784, 0, 1, 1,
0.4510621, -1.010396, 2.207652, 0.02745098, 0, 1, 1,
0.4540312, 0.79615, 0.9492767, 0.03137255, 0, 1, 1,
0.4560068, -0.2760911, 2.450111, 0.03921569, 0, 1, 1,
0.4591855, -1.325167, 2.665317, 0.04313726, 0, 1, 1,
0.4631014, 0.2021027, -0.878882, 0.05098039, 0, 1, 1,
0.4656799, -1.856925, 2.954819, 0.05490196, 0, 1, 1,
0.470258, -0.1963683, 1.86218, 0.0627451, 0, 1, 1,
0.4719671, 0.4921033, 0.4360461, 0.06666667, 0, 1, 1,
0.4744991, -0.6838699, 3.506851, 0.07450981, 0, 1, 1,
0.4746465, 0.3570243, -0.1239555, 0.07843138, 0, 1, 1,
0.4805076, -0.4259723, 4.374863, 0.08627451, 0, 1, 1,
0.4881113, -0.4256118, 2.445553, 0.09019608, 0, 1, 1,
0.4924474, -0.5629944, 1.793559, 0.09803922, 0, 1, 1,
0.4948551, -0.162321, 2.58019, 0.1058824, 0, 1, 1,
0.4969955, 1.241202, 2.068669, 0.1098039, 0, 1, 1,
0.498137, -0.03443937, 2.286914, 0.1176471, 0, 1, 1,
0.4981909, 0.8762184, 0.8387963, 0.1215686, 0, 1, 1,
0.5011774, 1.218503, 1.21439, 0.1294118, 0, 1, 1,
0.510074, -0.90346, 2.577648, 0.1333333, 0, 1, 1,
0.5102811, 0.1037399, 1.857077, 0.1411765, 0, 1, 1,
0.5124596, 0.2639966, 0.4288416, 0.145098, 0, 1, 1,
0.5150219, 0.3543453, 2.419135, 0.1529412, 0, 1, 1,
0.5155873, 2.499742, -0.02947599, 0.1568628, 0, 1, 1,
0.5195819, 0.7898002, -1.392597, 0.1647059, 0, 1, 1,
0.521809, -1.777692, 2.759837, 0.1686275, 0, 1, 1,
0.5232303, -1.124532, 1.203883, 0.1764706, 0, 1, 1,
0.5253441, 0.6409376, 2.744026, 0.1803922, 0, 1, 1,
0.5396986, -0.6820979, 2.628207, 0.1882353, 0, 1, 1,
0.5401043, 0.7229518, 0.2210495, 0.1921569, 0, 1, 1,
0.541434, 1.640233, 0.3966106, 0.2, 0, 1, 1,
0.5476895, 2.265085, -0.8416404, 0.2078431, 0, 1, 1,
0.5521258, 1.031164, -0.3423294, 0.2117647, 0, 1, 1,
0.5525742, 0.2481392, 0.8935934, 0.2196078, 0, 1, 1,
0.5616071, 1.768973, -0.9375317, 0.2235294, 0, 1, 1,
0.5626433, -0.1847067, 2.676305, 0.2313726, 0, 1, 1,
0.566215, 1.046764, 0.6343607, 0.2352941, 0, 1, 1,
0.5687196, -0.1825387, 3.959828, 0.2431373, 0, 1, 1,
0.5719151, 0.2163851, 0.5889783, 0.2470588, 0, 1, 1,
0.5738612, -0.378891, 1.705468, 0.254902, 0, 1, 1,
0.5750486, -0.2379441, 0.8829555, 0.2588235, 0, 1, 1,
0.5764762, 0.5482606, 0.944364, 0.2666667, 0, 1, 1,
0.5772046, 0.714579, 1.307784, 0.2705882, 0, 1, 1,
0.5790079, -0.2060324, 2.806809, 0.2784314, 0, 1, 1,
0.5793305, 0.2302499, -0.3757093, 0.282353, 0, 1, 1,
0.5851851, 0.05327719, 2.393553, 0.2901961, 0, 1, 1,
0.5883987, -0.1225227, 1.739175, 0.2941177, 0, 1, 1,
0.5887601, 1.642202, 1.991382, 0.3019608, 0, 1, 1,
0.5891924, 1.70403, 0.9163654, 0.3098039, 0, 1, 1,
0.5893527, 0.3827892, -0.1564475, 0.3137255, 0, 1, 1,
0.5923213, 0.07988944, 0.7859043, 0.3215686, 0, 1, 1,
0.5955128, 0.4017416, 0.3460744, 0.3254902, 0, 1, 1,
0.6001619, -1.450246, 3.770751, 0.3333333, 0, 1, 1,
0.6032993, -0.6628823, 2.160267, 0.3372549, 0, 1, 1,
0.6056495, 0.2173128, 0.9749682, 0.345098, 0, 1, 1,
0.6057329, 1.977036, -0.27988, 0.3490196, 0, 1, 1,
0.6072209, -0.6718863, 0.8657293, 0.3568628, 0, 1, 1,
0.6095898, 0.8375086, 2.544549, 0.3607843, 0, 1, 1,
0.6125338, 0.7571051, 2.658408, 0.3686275, 0, 1, 1,
0.6150568, -1.345995, 4.385896, 0.372549, 0, 1, 1,
0.6172419, -1.015006, 2.876414, 0.3803922, 0, 1, 1,
0.6183566, -1.341345, 3.046317, 0.3843137, 0, 1, 1,
0.6249313, 0.8853076, 1.493407, 0.3921569, 0, 1, 1,
0.6251071, 0.5641435, 1.688869, 0.3960784, 0, 1, 1,
0.626893, -0.3315842, 1.243508, 0.4039216, 0, 1, 1,
0.6283752, -0.1340296, 1.865345, 0.4117647, 0, 1, 1,
0.6284521, 1.058092, 1.875485, 0.4156863, 0, 1, 1,
0.6306279, 0.1125422, 0.9038424, 0.4235294, 0, 1, 1,
0.6316606, -0.1564671, 1.284906, 0.427451, 0, 1, 1,
0.6342756, -2.347427, 2.547534, 0.4352941, 0, 1, 1,
0.6417969, 0.6560239, 0.4729306, 0.4392157, 0, 1, 1,
0.6435946, 0.2841755, 0.3485061, 0.4470588, 0, 1, 1,
0.6447413, -1.188612, 2.807053, 0.4509804, 0, 1, 1,
0.6492063, 0.6738955, 0.4961571, 0.4588235, 0, 1, 1,
0.651988, -0.5453185, 3.167309, 0.4627451, 0, 1, 1,
0.6523163, 1.638678, -0.6841142, 0.4705882, 0, 1, 1,
0.6526336, -0.6778156, 3.031949, 0.4745098, 0, 1, 1,
0.6526826, -0.1825408, 2.131652, 0.4823529, 0, 1, 1,
0.6527365, -2.111622, 3.763186, 0.4862745, 0, 1, 1,
0.6540509, -0.8154596, 1.727189, 0.4941176, 0, 1, 1,
0.6563448, 0.6270825, 0.8563136, 0.5019608, 0, 1, 1,
0.6564206, 1.162151, 0.7019413, 0.5058824, 0, 1, 1,
0.6566144, -0.8990492, 2.842758, 0.5137255, 0, 1, 1,
0.6573333, -0.7523196, 3.293859, 0.5176471, 0, 1, 1,
0.664786, 0.1473327, 0.8781916, 0.5254902, 0, 1, 1,
0.6694698, 1.933446, 0.8621079, 0.5294118, 0, 1, 1,
0.6811608, 0.7990389, -0.7009622, 0.5372549, 0, 1, 1,
0.6825784, -0.1004562, 2.148185, 0.5411765, 0, 1, 1,
0.6838817, -1.857115, 2.920571, 0.5490196, 0, 1, 1,
0.6884168, 0.5752854, -0.7627283, 0.5529412, 0, 1, 1,
0.6898282, -0.9756427, 3.30302, 0.5607843, 0, 1, 1,
0.6915426, 1.077956, 2.061997, 0.5647059, 0, 1, 1,
0.6964416, -0.1363136, 1.763377, 0.572549, 0, 1, 1,
0.6983092, -0.02068744, 2.870045, 0.5764706, 0, 1, 1,
0.7003824, 0.01424254, -0.2043941, 0.5843138, 0, 1, 1,
0.7103583, 0.6182796, -0.1043294, 0.5882353, 0, 1, 1,
0.7124686, -1.412741, 3.259744, 0.5960785, 0, 1, 1,
0.716089, -0.3322878, 2.349419, 0.6039216, 0, 1, 1,
0.7205467, 0.4997826, 1.744025, 0.6078432, 0, 1, 1,
0.7303323, 1.568642, 0.8122708, 0.6156863, 0, 1, 1,
0.7303991, -1.663308, 2.599509, 0.6196079, 0, 1, 1,
0.7379386, -1.141511, 2.027717, 0.627451, 0, 1, 1,
0.7419401, 1.240185, -0.3415461, 0.6313726, 0, 1, 1,
0.7431149, -0.1461087, 1.706397, 0.6392157, 0, 1, 1,
0.7472388, -1.161773, 2.510402, 0.6431373, 0, 1, 1,
0.7480583, -1.717673, 3.530155, 0.6509804, 0, 1, 1,
0.7482761, 0.7311967, 2.398366, 0.654902, 0, 1, 1,
0.7526, 1.957544, -0.430198, 0.6627451, 0, 1, 1,
0.7560077, -0.07014114, 2.074366, 0.6666667, 0, 1, 1,
0.7571062, -1.11069, 2.045777, 0.6745098, 0, 1, 1,
0.7633974, 1.193996, 1.261258, 0.6784314, 0, 1, 1,
0.7650618, 1.099387, 1.147041, 0.6862745, 0, 1, 1,
0.7815682, -0.5644806, 2.373427, 0.6901961, 0, 1, 1,
0.7829912, -0.6039072, 0.5726663, 0.6980392, 0, 1, 1,
0.7840088, 1.44887, 1.239494, 0.7058824, 0, 1, 1,
0.7906128, 0.6611025, 1.910828, 0.7098039, 0, 1, 1,
0.7909514, -0.6438217, 2.315342, 0.7176471, 0, 1, 1,
0.791888, 0.9287131, -0.5940049, 0.7215686, 0, 1, 1,
0.7939055, -0.1619939, 1.357783, 0.7294118, 0, 1, 1,
0.7949515, -0.1625095, 3.625886, 0.7333333, 0, 1, 1,
0.795408, -0.217947, 1.899953, 0.7411765, 0, 1, 1,
0.8032036, 0.0627291, 2.236467, 0.7450981, 0, 1, 1,
0.8044333, -0.190813, 1.248008, 0.7529412, 0, 1, 1,
0.8047869, -0.792331, 1.031727, 0.7568628, 0, 1, 1,
0.8105188, 0.3064422, 1.782353, 0.7647059, 0, 1, 1,
0.8196283, 0.4692976, 1.58115, 0.7686275, 0, 1, 1,
0.8293179, 0.04059546, 1.988015, 0.7764706, 0, 1, 1,
0.8295077, 0.7070254, 2.196134, 0.7803922, 0, 1, 1,
0.833979, -1.447337, 0.741556, 0.7882353, 0, 1, 1,
0.8369824, -0.2470559, 2.519392, 0.7921569, 0, 1, 1,
0.8392795, -0.1724411, 2.282333, 0.8, 0, 1, 1,
0.8393692, 0.3251549, 1.043146, 0.8078431, 0, 1, 1,
0.8396621, 0.3465983, 0.808537, 0.8117647, 0, 1, 1,
0.8403862, 0.6215237, 1.184162, 0.8196079, 0, 1, 1,
0.8424391, 0.3034266, 1.843956, 0.8235294, 0, 1, 1,
0.8510659, 0.4493515, 0.07616009, 0.8313726, 0, 1, 1,
0.8522132, -1.017884, 2.190983, 0.8352941, 0, 1, 1,
0.8580998, -1.62042, 1.754696, 0.8431373, 0, 1, 1,
0.8587376, -0.02497919, 2.18228, 0.8470588, 0, 1, 1,
0.8615394, 0.9488347, -0.9884858, 0.854902, 0, 1, 1,
0.8619543, 0.1269953, 0.9411088, 0.8588235, 0, 1, 1,
0.8638048, -0.7107512, 3.015428, 0.8666667, 0, 1, 1,
0.8649658, 0.6372792, 2.328978, 0.8705882, 0, 1, 1,
0.8687162, -0.6471167, 2.558645, 0.8784314, 0, 1, 1,
0.880266, -0.459795, 3.708432, 0.8823529, 0, 1, 1,
0.8838596, -0.1475607, 1.353101, 0.8901961, 0, 1, 1,
0.8852857, -0.014298, -0.4163474, 0.8941177, 0, 1, 1,
0.8903126, -0.6473784, 3.328726, 0.9019608, 0, 1, 1,
0.8908697, -1.307927, 3.071176, 0.9098039, 0, 1, 1,
0.8924963, -1.298253, 2.524791, 0.9137255, 0, 1, 1,
0.8974335, -0.9266056, 1.466465, 0.9215686, 0, 1, 1,
0.9055599, -0.09467065, 1.241221, 0.9254902, 0, 1, 1,
0.9163727, -3.010165, 4.193955, 0.9333333, 0, 1, 1,
0.9172319, 0.8885679, 1.304168, 0.9372549, 0, 1, 1,
0.9225268, -0.09887052, 1.420013, 0.945098, 0, 1, 1,
0.9231243, -0.04850145, 1.574992, 0.9490196, 0, 1, 1,
0.9265417, -0.440874, 0.3622103, 0.9568627, 0, 1, 1,
0.9320894, 1.513902, 0.7359273, 0.9607843, 0, 1, 1,
0.9399396, 0.6462646, 0.7037017, 0.9686275, 0, 1, 1,
0.9408052, -0.04906079, 1.769638, 0.972549, 0, 1, 1,
0.9416713, -0.358758, 2.875074, 0.9803922, 0, 1, 1,
0.9439281, 0.5970016, 1.498389, 0.9843137, 0, 1, 1,
0.9445483, 0.2573968, 1.022531, 0.9921569, 0, 1, 1,
0.9479697, 3.022102, -0.02900559, 0.9960784, 0, 1, 1,
0.9502556, 1.142452, 2.701328, 1, 0, 0.9960784, 1,
0.9574117, 0.2436187, 0.7350625, 1, 0, 0.9882353, 1,
0.9575951, 0.4717427, 0.7235711, 1, 0, 0.9843137, 1,
0.9679159, -0.8691755, 2.953544, 1, 0, 0.9764706, 1,
0.9781659, 0.005656323, 2.702405, 1, 0, 0.972549, 1,
0.9829072, 0.1097378, 0.8084275, 1, 0, 0.9647059, 1,
0.9902014, -1.476725, 3.866615, 1, 0, 0.9607843, 1,
0.9902593, -1.751995, 3.711124, 1, 0, 0.9529412, 1,
0.9952032, 0.08983997, 1.253713, 1, 0, 0.9490196, 1,
0.9990993, 1.369734, 0.9606532, 1, 0, 0.9411765, 1,
0.99992, -0.6718782, 3.468673, 1, 0, 0.9372549, 1,
1.006686, 1.054701, 1.935874, 1, 0, 0.9294118, 1,
1.009625, 0.3345667, 1.359181, 1, 0, 0.9254902, 1,
1.015933, -0.6027324, 1.669242, 1, 0, 0.9176471, 1,
1.028242, -1.355793, 2.31873, 1, 0, 0.9137255, 1,
1.030563, -0.1175283, 1.306385, 1, 0, 0.9058824, 1,
1.030625, -1.095003, 3.123142, 1, 0, 0.9019608, 1,
1.033045, 0.03292317, 0.4700459, 1, 0, 0.8941177, 1,
1.033572, -1.111422, 2.621229, 1, 0, 0.8862745, 1,
1.034347, -0.6948795, 1.601328, 1, 0, 0.8823529, 1,
1.036681, 0.4970373, 1.915417, 1, 0, 0.8745098, 1,
1.04328, -0.615077, 2.378494, 1, 0, 0.8705882, 1,
1.053272, 1.351883, -0.3516962, 1, 0, 0.8627451, 1,
1.053388, 0.4172027, -0.4502115, 1, 0, 0.8588235, 1,
1.056714, 0.6940526, 1.474288, 1, 0, 0.8509804, 1,
1.065094, -0.0494891, 3.023675, 1, 0, 0.8470588, 1,
1.069752, -0.2493949, 0.7987791, 1, 0, 0.8392157, 1,
1.091878, -0.3558446, 2.024069, 1, 0, 0.8352941, 1,
1.092878, -1.436433, 2.739073, 1, 0, 0.827451, 1,
1.093069, 0.4750763, 1.613257, 1, 0, 0.8235294, 1,
1.094904, 0.9954688, 0.1277592, 1, 0, 0.8156863, 1,
1.096323, -0.4221406, 0.1331727, 1, 0, 0.8117647, 1,
1.104586, -0.1329047, 0.3119769, 1, 0, 0.8039216, 1,
1.105803, -0.7537933, 1.956893, 1, 0, 0.7960784, 1,
1.115151, 1.511495, -1.177248, 1, 0, 0.7921569, 1,
1.123276, -0.3860782, 2.181548, 1, 0, 0.7843137, 1,
1.127605, 1.334247, 2.126304, 1, 0, 0.7803922, 1,
1.137424, 0.7536426, 0.8199281, 1, 0, 0.772549, 1,
1.138202, -1.474251, 2.931092, 1, 0, 0.7686275, 1,
1.141724, 0.7196244, 1.426237, 1, 0, 0.7607843, 1,
1.142838, -0.04947493, 2.707098, 1, 0, 0.7568628, 1,
1.148506, 0.5806161, 2.973936, 1, 0, 0.7490196, 1,
1.151496, -2.421154, 2.844088, 1, 0, 0.7450981, 1,
1.157836, 1.589501, 0.09614724, 1, 0, 0.7372549, 1,
1.161355, 0.7454165, -1.352804, 1, 0, 0.7333333, 1,
1.166597, 0.7244412, 2.21959, 1, 0, 0.7254902, 1,
1.167507, 0.8089505, 2.172024, 1, 0, 0.7215686, 1,
1.170443, -1.208872, 2.201081, 1, 0, 0.7137255, 1,
1.195342, 2.16934, 0.7268798, 1, 0, 0.7098039, 1,
1.199259, -1.53432, 1.80679, 1, 0, 0.7019608, 1,
1.207102, 0.6500548, -0.4763198, 1, 0, 0.6941177, 1,
1.207622, 0.3383757, -0.3527856, 1, 0, 0.6901961, 1,
1.208287, 0.3360005, 0.647376, 1, 0, 0.682353, 1,
1.210946, 1.856756, 0.4943003, 1, 0, 0.6784314, 1,
1.220046, -0.1925367, 1.846562, 1, 0, 0.6705883, 1,
1.22263, 0.8792966, 0.1049218, 1, 0, 0.6666667, 1,
1.240968, -1.524684, 2.07959, 1, 0, 0.6588235, 1,
1.243763, 0.5177007, 1.733932, 1, 0, 0.654902, 1,
1.245241, 1.33891, -0.7213182, 1, 0, 0.6470588, 1,
1.246524, 0.8456216, 1.398695, 1, 0, 0.6431373, 1,
1.252972, -0.2763908, 2.058684, 1, 0, 0.6352941, 1,
1.261057, -0.4875201, 1.109954, 1, 0, 0.6313726, 1,
1.261257, 1.546202, 1.595003, 1, 0, 0.6235294, 1,
1.270931, 0.7846537, 3.599412, 1, 0, 0.6196079, 1,
1.272078, 0.2015832, 0.247919, 1, 0, 0.6117647, 1,
1.275862, -0.9282663, 1.989707, 1, 0, 0.6078432, 1,
1.280889, -0.6418049, 2.344723, 1, 0, 0.6, 1,
1.283851, -1.041537, 1.648356, 1, 0, 0.5921569, 1,
1.299879, -0.2181946, 1.491496, 1, 0, 0.5882353, 1,
1.304643, 0.4757235, 0.3951416, 1, 0, 0.5803922, 1,
1.311196, -0.02653902, 0.2955308, 1, 0, 0.5764706, 1,
1.312778, -0.3338682, 2.278649, 1, 0, 0.5686275, 1,
1.313398, -1.686093, 4.772609, 1, 0, 0.5647059, 1,
1.322189, 0.4684438, 1.017534, 1, 0, 0.5568628, 1,
1.323747, -1.109607, 0.6687516, 1, 0, 0.5529412, 1,
1.325538, -1.318861, 1.71788, 1, 0, 0.5450981, 1,
1.335681, -1.822855, 2.162352, 1, 0, 0.5411765, 1,
1.342723, -0.7587738, 2.388072, 1, 0, 0.5333334, 1,
1.355124, -0.5312154, 2.423578, 1, 0, 0.5294118, 1,
1.363817, -0.3556024, 1.056816, 1, 0, 0.5215687, 1,
1.379619, -0.663727, 2.718643, 1, 0, 0.5176471, 1,
1.396558, -0.1819028, 0.7953162, 1, 0, 0.509804, 1,
1.397067, -0.3106844, 1.667626, 1, 0, 0.5058824, 1,
1.415653, 0.945686, 1.247579, 1, 0, 0.4980392, 1,
1.416991, -0.229972, 0.5608011, 1, 0, 0.4901961, 1,
1.427278, -0.4987857, 2.926855, 1, 0, 0.4862745, 1,
1.430232, 1.434641, 2.210853, 1, 0, 0.4784314, 1,
1.44061, -0.4645134, 2.249725, 1, 0, 0.4745098, 1,
1.444873, 0.3619902, 0.5294814, 1, 0, 0.4666667, 1,
1.452341, -0.8321476, 3.450007, 1, 0, 0.4627451, 1,
1.452376, -0.6118101, 2.92203, 1, 0, 0.454902, 1,
1.455712, -0.2831011, 0.1780033, 1, 0, 0.4509804, 1,
1.456306, -0.7665427, 2.152372, 1, 0, 0.4431373, 1,
1.463431, -1.340096, 2.286674, 1, 0, 0.4392157, 1,
1.46407, -0.4361974, 0.6569648, 1, 0, 0.4313726, 1,
1.470632, 1.735986, 1.872304, 1, 0, 0.427451, 1,
1.492847, 1.13759, -0.5117908, 1, 0, 0.4196078, 1,
1.503397, 0.8871067, 1.847072, 1, 0, 0.4156863, 1,
1.514305, 0.3625098, 3.897176, 1, 0, 0.4078431, 1,
1.522271, 0.2969087, 2.008011, 1, 0, 0.4039216, 1,
1.552969, 0.1199259, 1.510237, 1, 0, 0.3960784, 1,
1.554237, -0.3875372, 0.2877267, 1, 0, 0.3882353, 1,
1.562543, 0.4291986, -1.714024, 1, 0, 0.3843137, 1,
1.588223, -1.679705, 1.343212, 1, 0, 0.3764706, 1,
1.589813, 1.359954, 2.03219, 1, 0, 0.372549, 1,
1.598884, -0.147715, 1.504166, 1, 0, 0.3647059, 1,
1.600449, -0.9961407, 0.627933, 1, 0, 0.3607843, 1,
1.610305, 0.9323066, 1.241078, 1, 0, 0.3529412, 1,
1.615834, -0.01648691, 1.9153, 1, 0, 0.3490196, 1,
1.616986, -0.9024469, 0.5638611, 1, 0, 0.3411765, 1,
1.619689, -0.9294213, 2.655091, 1, 0, 0.3372549, 1,
1.633517, 0.01615072, 0.774573, 1, 0, 0.3294118, 1,
1.659685, -1.33708, 2.806145, 1, 0, 0.3254902, 1,
1.663368, -1.274464, 3.919225, 1, 0, 0.3176471, 1,
1.67091, 1.486498, 1.482469, 1, 0, 0.3137255, 1,
1.67852, -0.1218769, 2.395337, 1, 0, 0.3058824, 1,
1.681656, -1.401185, 1.613863, 1, 0, 0.2980392, 1,
1.684778, 0.6131005, 1.324771, 1, 0, 0.2941177, 1,
1.689048, 2.13137, 0.6490167, 1, 0, 0.2862745, 1,
1.690173, -0.1378712, 1.170587, 1, 0, 0.282353, 1,
1.701134, -2.03775, 2.903306, 1, 0, 0.2745098, 1,
1.726125, -0.2439323, 2.33747, 1, 0, 0.2705882, 1,
1.735593, 0.1707748, 2.172105, 1, 0, 0.2627451, 1,
1.738317, -0.3077118, 1.2797, 1, 0, 0.2588235, 1,
1.758582, 1.144279, 1.847934, 1, 0, 0.2509804, 1,
1.77228, -0.2946092, 2.065028, 1, 0, 0.2470588, 1,
1.776938, 0.04314983, 1.760021, 1, 0, 0.2392157, 1,
1.79138, 1.149873, 1.626241, 1, 0, 0.2352941, 1,
1.795127, -0.2296075, 2.47974, 1, 0, 0.227451, 1,
1.814324, -0.1260493, 3.44154, 1, 0, 0.2235294, 1,
1.825784, 0.455071, 1.358889, 1, 0, 0.2156863, 1,
1.828441, 0.6361964, 1.989489, 1, 0, 0.2117647, 1,
1.831477, -0.6676451, 1.646854, 1, 0, 0.2039216, 1,
1.861332, 1.521323, 0.4898919, 1, 0, 0.1960784, 1,
1.913095, 2.061841, 0.5604914, 1, 0, 0.1921569, 1,
1.914538, 0.2383305, 3.369206, 1, 0, 0.1843137, 1,
1.973242, -1.045837, 3.539322, 1, 0, 0.1803922, 1,
1.990199, -0.8519399, 2.431008, 1, 0, 0.172549, 1,
1.992047, 0.0387299, 2.083781, 1, 0, 0.1686275, 1,
1.994916, -2.125612, 3.316958, 1, 0, 0.1607843, 1,
2.038743, -0.4937522, 3.688623, 1, 0, 0.1568628, 1,
2.049417, -1.4206, 1.623314, 1, 0, 0.1490196, 1,
2.097897, 0.1404887, 2.610662, 1, 0, 0.145098, 1,
2.103014, 0.5081159, 1.553939, 1, 0, 0.1372549, 1,
2.193727, -1.796857, 2.282936, 1, 0, 0.1333333, 1,
2.194815, 0.02415847, 3.046344, 1, 0, 0.1254902, 1,
2.222392, 0.8081362, 1.618487, 1, 0, 0.1215686, 1,
2.233141, -0.8802233, 1.529825, 1, 0, 0.1137255, 1,
2.243882, 0.0102762, 2.887272, 1, 0, 0.1098039, 1,
2.244563, -2.373555, 2.042999, 1, 0, 0.1019608, 1,
2.26289, -0.04072881, 1.54925, 1, 0, 0.09411765, 1,
2.277012, -0.5496169, 1.870048, 1, 0, 0.09019608, 1,
2.283876, -0.3338678, 0.324124, 1, 0, 0.08235294, 1,
2.325835, -0.06316554, 4.340498, 1, 0, 0.07843138, 1,
2.361287, 0.4628882, 3.160877, 1, 0, 0.07058824, 1,
2.454319, -1.322759, 2.974488, 1, 0, 0.06666667, 1,
2.458307, 0.211415, 1.260876, 1, 0, 0.05882353, 1,
2.468415, 0.3634457, 0.275587, 1, 0, 0.05490196, 1,
2.491469, 0.03044549, 1.706093, 1, 0, 0.04705882, 1,
2.507574, 1.074483, -0.900957, 1, 0, 0.04313726, 1,
2.576614, 0.01830638, 0.0170277, 1, 0, 0.03529412, 1,
2.600854, -0.3029383, 1.95906, 1, 0, 0.03137255, 1,
2.667824, 1.357469, 0.5323943, 1, 0, 0.02352941, 1,
2.72676, 0.2243405, 0.8241853, 1, 0, 0.01960784, 1,
2.803616, 0.1399667, 3.246215, 1, 0, 0.01176471, 1,
2.811847, -1.290464, 1.401232, 1, 0, 0.007843138, 1
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
-0.2908142, -4.0923, -7.53955, 0, -0.5, 0.5, 0.5,
-0.2908142, -4.0923, -7.53955, 1, -0.5, 0.5, 0.5,
-0.2908142, -4.0923, -7.53955, 1, 1.5, 0.5, 0.5,
-0.2908142, -4.0923, -7.53955, 0, 1.5, 0.5, 0.5
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
-4.445277, 0.1819739, -7.53955, 0, -0.5, 0.5, 0.5,
-4.445277, 0.1819739, -7.53955, 1, -0.5, 0.5, 0.5,
-4.445277, 0.1819739, -7.53955, 1, 1.5, 0.5, 0.5,
-4.445277, 0.1819739, -7.53955, 0, 1.5, 0.5, 0.5
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
-4.445277, -4.0923, -0.08228707, 0, -0.5, 0.5, 0.5,
-4.445277, -4.0923, -0.08228707, 1, -0.5, 0.5, 0.5,
-4.445277, -4.0923, -0.08228707, 1, 1.5, 0.5, 0.5,
-4.445277, -4.0923, -0.08228707, 0, 1.5, 0.5, 0.5
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
-3, -3.105929, -5.818644,
2, -3.105929, -5.818644,
-3, -3.105929, -5.818644,
-3, -3.270324, -6.105461,
-2, -3.105929, -5.818644,
-2, -3.270324, -6.105461,
-1, -3.105929, -5.818644,
-1, -3.270324, -6.105461,
0, -3.105929, -5.818644,
0, -3.270324, -6.105461,
1, -3.105929, -5.818644,
1, -3.270324, -6.105461,
2, -3.105929, -5.818644,
2, -3.270324, -6.105461
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
-3, -3.599114, -6.679097, 0, -0.5, 0.5, 0.5,
-3, -3.599114, -6.679097, 1, -0.5, 0.5, 0.5,
-3, -3.599114, -6.679097, 1, 1.5, 0.5, 0.5,
-3, -3.599114, -6.679097, 0, 1.5, 0.5, 0.5,
-2, -3.599114, -6.679097, 0, -0.5, 0.5, 0.5,
-2, -3.599114, -6.679097, 1, -0.5, 0.5, 0.5,
-2, -3.599114, -6.679097, 1, 1.5, 0.5, 0.5,
-2, -3.599114, -6.679097, 0, 1.5, 0.5, 0.5,
-1, -3.599114, -6.679097, 0, -0.5, 0.5, 0.5,
-1, -3.599114, -6.679097, 1, -0.5, 0.5, 0.5,
-1, -3.599114, -6.679097, 1, 1.5, 0.5, 0.5,
-1, -3.599114, -6.679097, 0, 1.5, 0.5, 0.5,
0, -3.599114, -6.679097, 0, -0.5, 0.5, 0.5,
0, -3.599114, -6.679097, 1, -0.5, 0.5, 0.5,
0, -3.599114, -6.679097, 1, 1.5, 0.5, 0.5,
0, -3.599114, -6.679097, 0, 1.5, 0.5, 0.5,
1, -3.599114, -6.679097, 0, -0.5, 0.5, 0.5,
1, -3.599114, -6.679097, 1, -0.5, 0.5, 0.5,
1, -3.599114, -6.679097, 1, 1.5, 0.5, 0.5,
1, -3.599114, -6.679097, 0, 1.5, 0.5, 0.5,
2, -3.599114, -6.679097, 0, -0.5, 0.5, 0.5,
2, -3.599114, -6.679097, 1, -0.5, 0.5, 0.5,
2, -3.599114, -6.679097, 1, 1.5, 0.5, 0.5,
2, -3.599114, -6.679097, 0, 1.5, 0.5, 0.5
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
-3.486555, -3, -5.818644,
-3.486555, 3, -5.818644,
-3.486555, -3, -5.818644,
-3.646342, -3, -6.105461,
-3.486555, -2, -5.818644,
-3.646342, -2, -6.105461,
-3.486555, -1, -5.818644,
-3.646342, -1, -6.105461,
-3.486555, 0, -5.818644,
-3.646342, 0, -6.105461,
-3.486555, 1, -5.818644,
-3.646342, 1, -6.105461,
-3.486555, 2, -5.818644,
-3.646342, 2, -6.105461,
-3.486555, 3, -5.818644,
-3.646342, 3, -6.105461
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
-3.965916, -3, -6.679097, 0, -0.5, 0.5, 0.5,
-3.965916, -3, -6.679097, 1, -0.5, 0.5, 0.5,
-3.965916, -3, -6.679097, 1, 1.5, 0.5, 0.5,
-3.965916, -3, -6.679097, 0, 1.5, 0.5, 0.5,
-3.965916, -2, -6.679097, 0, -0.5, 0.5, 0.5,
-3.965916, -2, -6.679097, 1, -0.5, 0.5, 0.5,
-3.965916, -2, -6.679097, 1, 1.5, 0.5, 0.5,
-3.965916, -2, -6.679097, 0, 1.5, 0.5, 0.5,
-3.965916, -1, -6.679097, 0, -0.5, 0.5, 0.5,
-3.965916, -1, -6.679097, 1, -0.5, 0.5, 0.5,
-3.965916, -1, -6.679097, 1, 1.5, 0.5, 0.5,
-3.965916, -1, -6.679097, 0, 1.5, 0.5, 0.5,
-3.965916, 0, -6.679097, 0, -0.5, 0.5, 0.5,
-3.965916, 0, -6.679097, 1, -0.5, 0.5, 0.5,
-3.965916, 0, -6.679097, 1, 1.5, 0.5, 0.5,
-3.965916, 0, -6.679097, 0, 1.5, 0.5, 0.5,
-3.965916, 1, -6.679097, 0, -0.5, 0.5, 0.5,
-3.965916, 1, -6.679097, 1, -0.5, 0.5, 0.5,
-3.965916, 1, -6.679097, 1, 1.5, 0.5, 0.5,
-3.965916, 1, -6.679097, 0, 1.5, 0.5, 0.5,
-3.965916, 2, -6.679097, 0, -0.5, 0.5, 0.5,
-3.965916, 2, -6.679097, 1, -0.5, 0.5, 0.5,
-3.965916, 2, -6.679097, 1, 1.5, 0.5, 0.5,
-3.965916, 2, -6.679097, 0, 1.5, 0.5, 0.5,
-3.965916, 3, -6.679097, 0, -0.5, 0.5, 0.5,
-3.965916, 3, -6.679097, 1, -0.5, 0.5, 0.5,
-3.965916, 3, -6.679097, 1, 1.5, 0.5, 0.5,
-3.965916, 3, -6.679097, 0, 1.5, 0.5, 0.5
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
-3.486555, -3.105929, -4,
-3.486555, -3.105929, 4,
-3.486555, -3.105929, -4,
-3.646342, -3.270324, -4,
-3.486555, -3.105929, -2,
-3.646342, -3.270324, -2,
-3.486555, -3.105929, 0,
-3.646342, -3.270324, 0,
-3.486555, -3.105929, 2,
-3.646342, -3.270324, 2,
-3.486555, -3.105929, 4,
-3.646342, -3.270324, 4
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
-3.965916, -3.599114, -4, 0, -0.5, 0.5, 0.5,
-3.965916, -3.599114, -4, 1, -0.5, 0.5, 0.5,
-3.965916, -3.599114, -4, 1, 1.5, 0.5, 0.5,
-3.965916, -3.599114, -4, 0, 1.5, 0.5, 0.5,
-3.965916, -3.599114, -2, 0, -0.5, 0.5, 0.5,
-3.965916, -3.599114, -2, 1, -0.5, 0.5, 0.5,
-3.965916, -3.599114, -2, 1, 1.5, 0.5, 0.5,
-3.965916, -3.599114, -2, 0, 1.5, 0.5, 0.5,
-3.965916, -3.599114, 0, 0, -0.5, 0.5, 0.5,
-3.965916, -3.599114, 0, 1, -0.5, 0.5, 0.5,
-3.965916, -3.599114, 0, 1, 1.5, 0.5, 0.5,
-3.965916, -3.599114, 0, 0, 1.5, 0.5, 0.5,
-3.965916, -3.599114, 2, 0, -0.5, 0.5, 0.5,
-3.965916, -3.599114, 2, 1, -0.5, 0.5, 0.5,
-3.965916, -3.599114, 2, 1, 1.5, 0.5, 0.5,
-3.965916, -3.599114, 2, 0, 1.5, 0.5, 0.5,
-3.965916, -3.599114, 4, 0, -0.5, 0.5, 0.5,
-3.965916, -3.599114, 4, 1, -0.5, 0.5, 0.5,
-3.965916, -3.599114, 4, 1, 1.5, 0.5, 0.5,
-3.965916, -3.599114, 4, 0, 1.5, 0.5, 0.5
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
-3.486555, -3.105929, -5.818644,
-3.486555, 3.469877, -5.818644,
-3.486555, -3.105929, 5.654069,
-3.486555, 3.469877, 5.654069,
-3.486555, -3.105929, -5.818644,
-3.486555, -3.105929, 5.654069,
-3.486555, 3.469877, -5.818644,
-3.486555, 3.469877, 5.654069,
-3.486555, -3.105929, -5.818644,
2.904927, -3.105929, -5.818644,
-3.486555, -3.105929, 5.654069,
2.904927, -3.105929, 5.654069,
-3.486555, 3.469877, -5.818644,
2.904927, 3.469877, -5.818644,
-3.486555, 3.469877, 5.654069,
2.904927, 3.469877, 5.654069,
2.904927, -3.105929, -5.818644,
2.904927, 3.469877, -5.818644,
2.904927, -3.105929, 5.654069,
2.904927, 3.469877, 5.654069,
2.904927, -3.105929, -5.818644,
2.904927, -3.105929, 5.654069,
2.904927, 3.469877, -5.818644,
2.904927, 3.469877, 5.654069
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
var radius = 7.842708;
var distance = 34.89309;
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
mvMatrix.translate( 0.2908142, -0.1819739, 0.08228707 );
mvMatrix.scale( 1.326717, 1.289529, 0.7391181 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.89309);
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
butralin<-read.table("butralin.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-butralin$V2
```

```
## Error in eval(expr, envir, enclos): object 'butralin' not found
```

```r
y<-butralin$V3
```

```
## Error in eval(expr, envir, enclos): object 'butralin' not found
```

```r
z<-butralin$V4
```

```
## Error in eval(expr, envir, enclos): object 'butralin' not found
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
-3.393475, 0.8473598, -2.070365, 0, 0, 1, 1, 1,
-3.166083, -0.08190557, -0.923371, 1, 0, 0, 1, 1,
-3.012187, 0.8056685, -0.8420524, 1, 0, 0, 1, 1,
-2.955323, -0.7322026, -2.838911, 1, 0, 0, 1, 1,
-2.666684, 0.8080693, -1.842556, 1, 0, 0, 1, 1,
-2.665379, -0.3730493, -1.239177, 1, 0, 0, 1, 1,
-2.646491, -0.2641217, -0.4640166, 0, 0, 0, 1, 1,
-2.507583, 2.664215, -0.4406462, 0, 0, 0, 1, 1,
-2.47925, -1.250914, -2.736962, 0, 0, 0, 1, 1,
-2.413428, 0.3632443, -0.2811784, 0, 0, 0, 1, 1,
-2.392253, -1.200492, -1.194949, 0, 0, 0, 1, 1,
-2.242032, -0.7338583, -1.775257, 0, 0, 0, 1, 1,
-2.235794, -1.764398, -0.9304532, 0, 0, 0, 1, 1,
-2.214336, -0.1103612, -2.408262, 1, 1, 1, 1, 1,
-2.143253, -0.5030549, -0.9746582, 1, 1, 1, 1, 1,
-2.134394, -1.344606, -1.555942, 1, 1, 1, 1, 1,
-2.117682, 1.250396, -0.9176056, 1, 1, 1, 1, 1,
-2.10938, -0.6270269, -1.155802, 1, 1, 1, 1, 1,
-2.108455, -0.1657954, -2.103314, 1, 1, 1, 1, 1,
-2.087553, 3.374113, -0.9609168, 1, 1, 1, 1, 1,
-2.086334, -2.440627, -3.474182, 1, 1, 1, 1, 1,
-2.048922, -0.2369792, -1.046252, 1, 1, 1, 1, 1,
-2.033067, 1.49207, -1.333319, 1, 1, 1, 1, 1,
-1.995775, -0.4140034, -2.259696, 1, 1, 1, 1, 1,
-1.994584, -0.7417529, -1.605338, 1, 1, 1, 1, 1,
-1.983126, -0.9755639, -0.07023185, 1, 1, 1, 1, 1,
-1.971876, -1.18446, -2.86945, 1, 1, 1, 1, 1,
-1.965872, -1.075272, -4.049984, 1, 1, 1, 1, 1,
-1.953768, 0.657966, -0.4189634, 0, 0, 1, 1, 1,
-1.915005, -0.7752109, -2.614733, 1, 0, 0, 1, 1,
-1.914796, -0.7591792, -1.598005, 1, 0, 0, 1, 1,
-1.909283, -1.363558, -1.306295, 1, 0, 0, 1, 1,
-1.909113, -0.363621, 0.8052307, 1, 0, 0, 1, 1,
-1.903475, -0.7381955, -3.571177, 1, 0, 0, 1, 1,
-1.887299, -0.4975843, -1.563095, 0, 0, 0, 1, 1,
-1.851978, -0.7160217, -3.047093, 0, 0, 0, 1, 1,
-1.847084, -1.226877, -3.759589, 0, 0, 0, 1, 1,
-1.8423, 0.6028867, -0.8903288, 0, 0, 0, 1, 1,
-1.831218, -0.4251084, -0.7251079, 0, 0, 0, 1, 1,
-1.826039, -0.4371876, -2.798712, 0, 0, 0, 1, 1,
-1.808787, -0.8555918, -2.615938, 0, 0, 0, 1, 1,
-1.785178, 0.253561, -1.209451, 1, 1, 1, 1, 1,
-1.776204, 1.203281, -0.7001306, 1, 1, 1, 1, 1,
-1.762958, -2.034859, -3.735185, 1, 1, 1, 1, 1,
-1.762549, -0.3934757, -1.982522, 1, 1, 1, 1, 1,
-1.752047, 0.5539735, -2.276223, 1, 1, 1, 1, 1,
-1.748899, 0.7097556, -0.4216947, 1, 1, 1, 1, 1,
-1.747394, 0.8049603, -0.7845731, 1, 1, 1, 1, 1,
-1.737894, -1.209092, -0.8512436, 1, 1, 1, 1, 1,
-1.736309, 0.7883978, -0.03347007, 1, 1, 1, 1, 1,
-1.728245, -0.5655574, -2.63741, 1, 1, 1, 1, 1,
-1.722723, -1.102559, -1.880848, 1, 1, 1, 1, 1,
-1.717321, -0.2012757, -2.158361, 1, 1, 1, 1, 1,
-1.70632, 1.01405, -0.7896986, 1, 1, 1, 1, 1,
-1.693297, 1.103156, -1.211611, 1, 1, 1, 1, 1,
-1.681287, 0.3699833, -1.914736, 1, 1, 1, 1, 1,
-1.669572, 0.52769, -0.9629904, 0, 0, 1, 1, 1,
-1.653708, 0.2596998, -0.2665181, 1, 0, 0, 1, 1,
-1.633072, 1.346429, -0.9016232, 1, 0, 0, 1, 1,
-1.630262, 0.08235598, -3.721706, 1, 0, 0, 1, 1,
-1.607292, -0.06079278, -2.347592, 1, 0, 0, 1, 1,
-1.605781, 0.5642042, -1.758333, 1, 0, 0, 1, 1,
-1.594051, -1.568064, 0.05647933, 0, 0, 0, 1, 1,
-1.57857, 1.534634, -0.7497877, 0, 0, 0, 1, 1,
-1.577449, -0.6016158, -0.5186151, 0, 0, 0, 1, 1,
-1.571851, -2.006261, -2.258576, 0, 0, 0, 1, 1,
-1.564822, -0.9802974, -1.840945, 0, 0, 0, 1, 1,
-1.552529, 1.404523, -1.630213, 0, 0, 0, 1, 1,
-1.525342, -0.03182317, -1.414147, 0, 0, 0, 1, 1,
-1.515753, 1.383979, -0.4028981, 1, 1, 1, 1, 1,
-1.512517, -0.06828319, -1.617803, 1, 1, 1, 1, 1,
-1.511577, 0.1794841, -1.336827, 1, 1, 1, 1, 1,
-1.501692, 0.01563939, -1.269568, 1, 1, 1, 1, 1,
-1.4977, -0.02872185, -1.390227, 1, 1, 1, 1, 1,
-1.495254, 2.19848, -0.6888078, 1, 1, 1, 1, 1,
-1.488696, 1.698455, -0.1352582, 1, 1, 1, 1, 1,
-1.486501, 2.020166, -0.260086, 1, 1, 1, 1, 1,
-1.477183, 0.1808556, -0.1948752, 1, 1, 1, 1, 1,
-1.476601, -0.9089351, -3.278762, 1, 1, 1, 1, 1,
-1.469598, 0.3576694, -0.8272055, 1, 1, 1, 1, 1,
-1.46198, -1.931847, -1.419482, 1, 1, 1, 1, 1,
-1.45826, 0.1342657, -1.329486, 1, 1, 1, 1, 1,
-1.453112, -0.4126423, -2.450865, 1, 1, 1, 1, 1,
-1.448256, 0.03091962, -1.542637, 1, 1, 1, 1, 1,
-1.444242, 0.2447294, -1.969168, 0, 0, 1, 1, 1,
-1.428979, 1.139444, 1.24161, 1, 0, 0, 1, 1,
-1.422233, 2.343213, 0.5584683, 1, 0, 0, 1, 1,
-1.408272, -0.2458492, 0.09376903, 1, 0, 0, 1, 1,
-1.401102, 1.753352, -1.524838, 1, 0, 0, 1, 1,
-1.391198, 1.089309, -2.231805, 1, 0, 0, 1, 1,
-1.377955, -0.5811694, -1.632723, 0, 0, 0, 1, 1,
-1.377172, -0.8622658, -3.13983, 0, 0, 0, 1, 1,
-1.374968, 0.6453132, -3.067256, 0, 0, 0, 1, 1,
-1.365399, 2.057751, -0.129014, 0, 0, 0, 1, 1,
-1.364956, -0.3941355, -2.232664, 0, 0, 0, 1, 1,
-1.364822, 0.3452005, -1.672336, 0, 0, 0, 1, 1,
-1.36354, -1.351703, -4.495326, 0, 0, 0, 1, 1,
-1.341215, 0.5997249, -1.186008, 1, 1, 1, 1, 1,
-1.340619, 0.7682536, -0.4489939, 1, 1, 1, 1, 1,
-1.338397, -0.282005, -3.251235, 1, 1, 1, 1, 1,
-1.336333, 0.2440443, -2.525712, 1, 1, 1, 1, 1,
-1.331545, -0.213316, -1.04113, 1, 1, 1, 1, 1,
-1.327403, 0.1056173, -2.37449, 1, 1, 1, 1, 1,
-1.323181, 1.085268, -1.381866, 1, 1, 1, 1, 1,
-1.321728, -0.3458665, -1.233868, 1, 1, 1, 1, 1,
-1.321507, 0.9843267, -0.7725971, 1, 1, 1, 1, 1,
-1.316328, -1.298788, -2.958918, 1, 1, 1, 1, 1,
-1.303857, 0.8682703, -0.7049751, 1, 1, 1, 1, 1,
-1.298471, 0.5407667, -0.3619544, 1, 1, 1, 1, 1,
-1.292489, -0.4341572, -1.698589, 1, 1, 1, 1, 1,
-1.287541, -1.172119, -2.439124, 1, 1, 1, 1, 1,
-1.282359, -0.2364644, -2.314317, 1, 1, 1, 1, 1,
-1.258314, -0.003555584, -1.045718, 0, 0, 1, 1, 1,
-1.254914, -0.04353323, -2.079735, 1, 0, 0, 1, 1,
-1.246235, -2.697668, -2.93782, 1, 0, 0, 1, 1,
-1.241511, 1.00257, -0.8105935, 1, 0, 0, 1, 1,
-1.234999, 0.3951164, -1.212962, 1, 0, 0, 1, 1,
-1.225621, 0.5921978, -1.479496, 1, 0, 0, 1, 1,
-1.212965, -0.6314438, -1.517592, 0, 0, 0, 1, 1,
-1.209985, -0.5112939, -1.337695, 0, 0, 0, 1, 1,
-1.198324, 1.755767, -3.576502, 0, 0, 0, 1, 1,
-1.191049, -0.8549988, -4.156947, 0, 0, 0, 1, 1,
-1.191043, -1.672677, -2.242491, 0, 0, 0, 1, 1,
-1.189055, -0.4463154, -3.120708, 0, 0, 0, 1, 1,
-1.185469, -0.5345543, -0.381168, 0, 0, 0, 1, 1,
-1.181393, 0.3167581, -1.606517, 1, 1, 1, 1, 1,
-1.181333, 1.876614, -1.90605, 1, 1, 1, 1, 1,
-1.163112, 1.021759, -2.425852, 1, 1, 1, 1, 1,
-1.137222, -1.263137, -1.006047, 1, 1, 1, 1, 1,
-1.123219, -0.4200166, -1.914967, 1, 1, 1, 1, 1,
-1.118101, 0.3023493, -1.228726, 1, 1, 1, 1, 1,
-1.115509, 0.3663622, -2.651691, 1, 1, 1, 1, 1,
-1.109731, 0.2015545, -1.970177, 1, 1, 1, 1, 1,
-1.109639, 1.954627, -0.1613393, 1, 1, 1, 1, 1,
-1.099396, 0.05585978, 0.4333378, 1, 1, 1, 1, 1,
-1.098683, -0.9738959, -4.071109, 1, 1, 1, 1, 1,
-1.083905, 0.1107473, -1.168913, 1, 1, 1, 1, 1,
-1.077411, -1.537297, -4.451388, 1, 1, 1, 1, 1,
-1.074977, -0.5560581, -0.9697478, 1, 1, 1, 1, 1,
-1.071622, -1.235903, -3.919993, 1, 1, 1, 1, 1,
-1.068855, -0.4681834, -2.354657, 0, 0, 1, 1, 1,
-1.067595, 0.6652295, 0.02488758, 1, 0, 0, 1, 1,
-1.067214, -0.4426513, -3.344509, 1, 0, 0, 1, 1,
-1.05668, 1.031771, -0.9450771, 1, 0, 0, 1, 1,
-1.05108, -0.1705351, -2.793242, 1, 0, 0, 1, 1,
-1.047528, -1.646864, -2.746108, 1, 0, 0, 1, 1,
-1.045132, 1.724139, -2.596586, 0, 0, 0, 1, 1,
-1.041399, 0.2752225, -0.9052383, 0, 0, 0, 1, 1,
-1.040645, -1.150476, -3.422435, 0, 0, 0, 1, 1,
-1.038389, -0.189596, -0.3271703, 0, 0, 0, 1, 1,
-1.036196, -0.536813, -0.4776922, 0, 0, 0, 1, 1,
-1.033432, -2.089462, -4.332808, 0, 0, 0, 1, 1,
-1.030941, -1.519268, -0.8385194, 0, 0, 0, 1, 1,
-1.029608, -0.4073135, -1.101966, 1, 1, 1, 1, 1,
-1.012341, 0.1218207, -0.7776088, 1, 1, 1, 1, 1,
-1.009608, 0.230337, -1.472729, 1, 1, 1, 1, 1,
-1.003604, 0.2153139, -1.736388, 1, 1, 1, 1, 1,
-0.9908516, -0.7657751, -2.458036, 1, 1, 1, 1, 1,
-0.9865078, -0.2338621, -1.386129, 1, 1, 1, 1, 1,
-0.9836991, -0.334078, -2.021228, 1, 1, 1, 1, 1,
-0.9828278, 1.468893, -0.1739964, 1, 1, 1, 1, 1,
-0.9754851, -0.07987633, -1.268046, 1, 1, 1, 1, 1,
-0.9745331, -0.4666716, -1.396851, 1, 1, 1, 1, 1,
-0.9682674, 2.390572, -0.8990723, 1, 1, 1, 1, 1,
-0.9661233, -0.848222, -2.190735, 1, 1, 1, 1, 1,
-0.9637452, -0.6164691, -2.345572, 1, 1, 1, 1, 1,
-0.9636894, -0.9656752, -3.519323, 1, 1, 1, 1, 1,
-0.9628822, -0.08885572, -1.448627, 1, 1, 1, 1, 1,
-0.9612055, 0.4725126, -0.7276353, 0, 0, 1, 1, 1,
-0.9564895, 0.3659416, -2.278471, 1, 0, 0, 1, 1,
-0.9529477, 1.182218, -0.9071599, 1, 0, 0, 1, 1,
-0.9518134, -2.135149, -2.677626, 1, 0, 0, 1, 1,
-0.9505892, -0.9768476, -4.054526, 1, 0, 0, 1, 1,
-0.9491187, -1.56947, -2.776288, 1, 0, 0, 1, 1,
-0.9488536, 0.04657917, -2.547957, 0, 0, 0, 1, 1,
-0.9463149, 0.6537241, -2.989242, 0, 0, 0, 1, 1,
-0.9351833, 1.330942, -2.213956, 0, 0, 0, 1, 1,
-0.9333456, -0.605779, -2.430309, 0, 0, 0, 1, 1,
-0.9326548, 2.2052, 1.011593, 0, 0, 0, 1, 1,
-0.9288024, -0.4608523, -2.080127, 0, 0, 0, 1, 1,
-0.9287648, -2.662418, -1.164572, 0, 0, 0, 1, 1,
-0.9243061, 0.6586474, -1.34573, 1, 1, 1, 1, 1,
-0.9210038, 1.488507, -1.111, 1, 1, 1, 1, 1,
-0.9170299, 0.7304828, -0.1549746, 1, 1, 1, 1, 1,
-0.916621, -0.07705012, -0.4888285, 1, 1, 1, 1, 1,
-0.9154919, 0.4882688, -0.5025308, 1, 1, 1, 1, 1,
-0.9069977, -0.1073829, -2.517282, 1, 1, 1, 1, 1,
-0.9067624, 1.788182, -0.285533, 1, 1, 1, 1, 1,
-0.9037125, 0.755128, -1.537644, 1, 1, 1, 1, 1,
-0.8919927, 0.7431526, -0.434943, 1, 1, 1, 1, 1,
-0.8822376, -1.532565, -2.358389, 1, 1, 1, 1, 1,
-0.8791676, 1.168045, -0.35407, 1, 1, 1, 1, 1,
-0.8768646, -0.2122141, -3.282787, 1, 1, 1, 1, 1,
-0.876405, 1.335686, -1.0084, 1, 1, 1, 1, 1,
-0.8736482, 0.9315234, -0.5050126, 1, 1, 1, 1, 1,
-0.8699129, 0.3901045, -0.8374848, 1, 1, 1, 1, 1,
-0.8685809, -0.9223965, -1.473359, 0, 0, 1, 1, 1,
-0.8684778, -0.6958801, -1.815448, 1, 0, 0, 1, 1,
-0.8669036, 0.07936766, -1.656983, 1, 0, 0, 1, 1,
-0.8668026, -0.3161901, -2.365098, 1, 0, 0, 1, 1,
-0.8618486, 0.1919005, 0.06314894, 1, 0, 0, 1, 1,
-0.8614145, -0.706354, -2.28924, 1, 0, 0, 1, 1,
-0.8536854, -0.5937281, -2.825395, 0, 0, 0, 1, 1,
-0.8395846, 2.187653, -1.062315, 0, 0, 0, 1, 1,
-0.8369802, -0.5997658, -3.195831, 0, 0, 0, 1, 1,
-0.8318267, -0.05726169, -1.055845, 0, 0, 0, 1, 1,
-0.8316512, -0.1595554, -1.095443, 0, 0, 0, 1, 1,
-0.8270379, -0.008734941, -1.959279, 0, 0, 0, 1, 1,
-0.822322, -0.1726443, -1.383231, 0, 0, 0, 1, 1,
-0.819218, 0.7750451, -0.5603298, 1, 1, 1, 1, 1,
-0.811989, -0.2109529, -3.937206, 1, 1, 1, 1, 1,
-0.8107141, -0.3373937, -2.856313, 1, 1, 1, 1, 1,
-0.8092925, -1.010426, -1.355616, 1, 1, 1, 1, 1,
-0.8067249, -0.7843935, -3.036103, 1, 1, 1, 1, 1,
-0.8057603, 0.7820543, -1.044194, 1, 1, 1, 1, 1,
-0.8042455, -1.273995, -1.411363, 1, 1, 1, 1, 1,
-0.8031548, -0.6145391, -1.973214, 1, 1, 1, 1, 1,
-0.8005658, 0.03083805, -1.98934, 1, 1, 1, 1, 1,
-0.7964794, 0.257054, -2.537431, 1, 1, 1, 1, 1,
-0.7964764, 1.607436, -0.7439123, 1, 1, 1, 1, 1,
-0.7944336, -0.5805442, -0.6952034, 1, 1, 1, 1, 1,
-0.794125, 2.028595, -1.282325, 1, 1, 1, 1, 1,
-0.7890412, -0.03275632, -1.525821, 1, 1, 1, 1, 1,
-0.7853234, -0.2166224, -3.273876, 1, 1, 1, 1, 1,
-0.7823234, 0.4263779, -0.251979, 0, 0, 1, 1, 1,
-0.7776299, 0.03259121, -0.5502623, 1, 0, 0, 1, 1,
-0.7659927, -1.573701, -2.112417, 1, 0, 0, 1, 1,
-0.7655575, 0.6560544, 0.5078242, 1, 0, 0, 1, 1,
-0.7637646, 1.703148, -1.832253, 1, 0, 0, 1, 1,
-0.758268, 1.513259, -0.531481, 1, 0, 0, 1, 1,
-0.7579458, -0.7803789, -4.199474, 0, 0, 0, 1, 1,
-0.7512883, -1.648489, -2.631396, 0, 0, 0, 1, 1,
-0.7503976, 0.1039883, -0.4406745, 0, 0, 0, 1, 1,
-0.7492321, 0.1788289, -1.983355, 0, 0, 0, 1, 1,
-0.7487218, -0.7895482, -1.957695, 0, 0, 0, 1, 1,
-0.7471223, -0.9491705, -2.738656, 0, 0, 0, 1, 1,
-0.74418, -1.389837, -1.141231, 0, 0, 0, 1, 1,
-0.7426147, -0.01229975, -0.8561154, 1, 1, 1, 1, 1,
-0.7383747, -0.1648249, -3.242592, 1, 1, 1, 1, 1,
-0.7320326, -0.1644424, -2.442055, 1, 1, 1, 1, 1,
-0.7203075, 0.3716096, 0.2216814, 1, 1, 1, 1, 1,
-0.7175402, 0.04119348, -1.996601, 1, 1, 1, 1, 1,
-0.705504, 0.7483067, -1.339472, 1, 1, 1, 1, 1,
-0.7052856, 1.118799, -1.42211, 1, 1, 1, 1, 1,
-0.703852, 0.5570667, -0.5547433, 1, 1, 1, 1, 1,
-0.6899096, -1.055841, -1.620973, 1, 1, 1, 1, 1,
-0.6827464, 0.3737688, -1.719926, 1, 1, 1, 1, 1,
-0.6752737, 0.6249278, -2.883538, 1, 1, 1, 1, 1,
-0.6726449, 1.370867, -1.117923, 1, 1, 1, 1, 1,
-0.6716713, -0.02142796, -1.421697, 1, 1, 1, 1, 1,
-0.6697541, 0.7250041, -0.9147135, 1, 1, 1, 1, 1,
-0.6685628, -0.03449443, -1.199898, 1, 1, 1, 1, 1,
-0.6602884, -1.637045, -3.264843, 0, 0, 1, 1, 1,
-0.6571575, -0.2847465, -2.7042, 1, 0, 0, 1, 1,
-0.6545098, -1.373403, -5.175287, 1, 0, 0, 1, 1,
-0.6518917, -0.7825435, -2.140637, 1, 0, 0, 1, 1,
-0.6468036, -0.631205, -3.179896, 1, 0, 0, 1, 1,
-0.6455232, -0.5574316, -4.671285, 1, 0, 0, 1, 1,
-0.6428457, -0.5274117, -2.537051, 0, 0, 0, 1, 1,
-0.6359439, -1.092703, -3.078656, 0, 0, 0, 1, 1,
-0.6325888, 0.1874463, 0.1982216, 0, 0, 0, 1, 1,
-0.6309071, -0.2468783, -3.296455, 0, 0, 0, 1, 1,
-0.6292958, 0.1383602, -2.642241, 0, 0, 0, 1, 1,
-0.6264123, 0.07902373, -1.370717, 0, 0, 0, 1, 1,
-0.6247849, 1.504493, -0.8877465, 0, 0, 0, 1, 1,
-0.6214849, -0.9738343, -2.739661, 1, 1, 1, 1, 1,
-0.6155931, -0.6223228, -1.445313, 1, 1, 1, 1, 1,
-0.6101122, 0.4008892, 0.6258238, 1, 1, 1, 1, 1,
-0.6084362, -0.2203225, -2.539509, 1, 1, 1, 1, 1,
-0.6079345, 1.069749, -0.9352607, 1, 1, 1, 1, 1,
-0.6050948, -0.2103172, -1.595981, 1, 1, 1, 1, 1,
-0.6012446, -0.5508178, -2.159545, 1, 1, 1, 1, 1,
-0.6009029, 2.08363, -0.8984209, 1, 1, 1, 1, 1,
-0.5987355, -0.1566857, -1.247705, 1, 1, 1, 1, 1,
-0.591852, -0.09276983, -2.336021, 1, 1, 1, 1, 1,
-0.5907617, -1.347775, -2.715957, 1, 1, 1, 1, 1,
-0.5906352, 0.09399705, -0.5946912, 1, 1, 1, 1, 1,
-0.5902655, 1.588158, 0.01441593, 1, 1, 1, 1, 1,
-0.5869536, 1.02563, -2.319353, 1, 1, 1, 1, 1,
-0.5775409, -0.06933217, -1.279009, 1, 1, 1, 1, 1,
-0.5744693, -0.3255039, -0.4442798, 0, 0, 1, 1, 1,
-0.5702057, 1.21103, -2.492007, 1, 0, 0, 1, 1,
-0.567867, 1.296501, 0.4101195, 1, 0, 0, 1, 1,
-0.5640247, -0.3332871, -3.040636, 1, 0, 0, 1, 1,
-0.5637252, -0.5777014, -2.320416, 1, 0, 0, 1, 1,
-0.5457224, 0.3730341, -0.7019002, 1, 0, 0, 1, 1,
-0.5370612, -0.177963, -2.063236, 0, 0, 0, 1, 1,
-0.5315235, -0.1283117, -0.7944816, 0, 0, 0, 1, 1,
-0.5283765, -0.336227, -1.489097, 0, 0, 0, 1, 1,
-0.5281471, 0.721847, -1.512281, 0, 0, 0, 1, 1,
-0.5240144, 0.5238861, -0.08013424, 0, 0, 0, 1, 1,
-0.5215904, 0.9872788, 0.593687, 0, 0, 0, 1, 1,
-0.5214564, 1.113047, 0.621918, 0, 0, 0, 1, 1,
-0.5209432, -1.112306, -3.187778, 1, 1, 1, 1, 1,
-0.5195259, -0.361393, -1.998475, 1, 1, 1, 1, 1,
-0.5192579, -0.6878359, -1.899991, 1, 1, 1, 1, 1,
-0.5181069, 0.6592834, 0.01972115, 1, 1, 1, 1, 1,
-0.5174524, 0.6409893, -1.827385, 1, 1, 1, 1, 1,
-0.5102683, -2.073988, -4.06202, 1, 1, 1, 1, 1,
-0.5069009, -1.007434, -3.14127, 1, 1, 1, 1, 1,
-0.4982196, -0.3315639, -3.376678, 1, 1, 1, 1, 1,
-0.4951046, 1.252575, 0.1978115, 1, 1, 1, 1, 1,
-0.493514, -0.3819971, -1.973207, 1, 1, 1, 1, 1,
-0.4926489, 0.6973199, -0.2843179, 1, 1, 1, 1, 1,
-0.4898562, -1.436702, -3.586583, 1, 1, 1, 1, 1,
-0.4851916, 1.603288, 0.1283442, 1, 1, 1, 1, 1,
-0.4839863, 0.4993195, -1.527509, 1, 1, 1, 1, 1,
-0.4804662, -1.318585, -4.113629, 1, 1, 1, 1, 1,
-0.4796845, 0.3063358, -1.762132, 0, 0, 1, 1, 1,
-0.4682917, 2.117976, 0.5961852, 1, 0, 0, 1, 1,
-0.4665757, 0.4537106, -1.256675, 1, 0, 0, 1, 1,
-0.4635327, 0.8229671, 0.7314823, 1, 0, 0, 1, 1,
-0.463273, 0.65999, -1.381462, 1, 0, 0, 1, 1,
-0.4624747, -0.0457818, -1.721092, 1, 0, 0, 1, 1,
-0.460924, 0.5321078, -1.525444, 0, 0, 0, 1, 1,
-0.4594718, 0.9617472, -0.8330429, 0, 0, 0, 1, 1,
-0.4583811, -1.868702, -3.151505, 0, 0, 0, 1, 1,
-0.4580811, -0.3574194, -2.610808, 0, 0, 0, 1, 1,
-0.453137, -1.635922, -3.504071, 0, 0, 0, 1, 1,
-0.4470686, -0.7992694, -2.569651, 0, 0, 0, 1, 1,
-0.4378255, 0.05519103, -2.484753, 0, 0, 0, 1, 1,
-0.437123, -0.8672903, -1.776243, 1, 1, 1, 1, 1,
-0.4339071, 0.6729962, -0.5095066, 1, 1, 1, 1, 1,
-0.4333073, -0.9299326, -2.214962, 1, 1, 1, 1, 1,
-0.4300878, 0.2721239, -0.1127563, 1, 1, 1, 1, 1,
-0.4300765, 2.096834, -0.1076843, 1, 1, 1, 1, 1,
-0.4255892, 0.2631511, -1.515822, 1, 1, 1, 1, 1,
-0.4254467, 0.5019109, -0.4553505, 1, 1, 1, 1, 1,
-0.4251453, 0.5635977, -1.553215, 1, 1, 1, 1, 1,
-0.4243225, 1.187158, -1.339503, 1, 1, 1, 1, 1,
-0.4240866, 0.723851, 0.687131, 1, 1, 1, 1, 1,
-0.4235043, -0.339582, -2.018611, 1, 1, 1, 1, 1,
-0.4199628, -0.2829864, -0.8062783, 1, 1, 1, 1, 1,
-0.4139479, 0.7384205, -1.147511, 1, 1, 1, 1, 1,
-0.4113631, -0.6173043, -3.012561, 1, 1, 1, 1, 1,
-0.4108121, -1.042615, -3.304256, 1, 1, 1, 1, 1,
-0.41042, -0.9691656, -2.393177, 0, 0, 1, 1, 1,
-0.4096885, 0.3910585, -0.1989878, 1, 0, 0, 1, 1,
-0.3988954, -0.3253582, -2.891715, 1, 0, 0, 1, 1,
-0.3926378, 0.2160291, -1.914622, 1, 0, 0, 1, 1,
-0.3873071, 0.5316049, -2.959391, 1, 0, 0, 1, 1,
-0.387264, 0.5330687, -1.085699, 1, 0, 0, 1, 1,
-0.3871736, 0.5503675, -1.550846, 0, 0, 0, 1, 1,
-0.3866664, -1.947033, -1.580392, 0, 0, 0, 1, 1,
-0.3860008, 0.8126295, -1.895412, 0, 0, 0, 1, 1,
-0.3837154, 0.3981546, 0.0624684, 0, 0, 0, 1, 1,
-0.3830165, 1.620343, -0.9680318, 0, 0, 0, 1, 1,
-0.3813544, -0.7156334, -3.810961, 0, 0, 0, 1, 1,
-0.3779989, -0.7123052, -3.158303, 0, 0, 0, 1, 1,
-0.3685588, 1.728853, -1.185732, 1, 1, 1, 1, 1,
-0.3638636, 0.1528456, -0.225139, 1, 1, 1, 1, 1,
-0.3637128, -0.009806746, -0.6930885, 1, 1, 1, 1, 1,
-0.3621295, -0.8380833, -3.648517, 1, 1, 1, 1, 1,
-0.3572855, 0.6942704, 0.3068775, 1, 1, 1, 1, 1,
-0.3564958, -0.1895008, -3.229429, 1, 1, 1, 1, 1,
-0.356487, 0.8067757, -1.476998, 1, 1, 1, 1, 1,
-0.3532685, 0.9474562, -0.2778983, 1, 1, 1, 1, 1,
-0.3527862, 0.09683222, -2.421129, 1, 1, 1, 1, 1,
-0.3527621, -0.2468697, -2.835551, 1, 1, 1, 1, 1,
-0.3526056, 0.7201411, -0.9938593, 1, 1, 1, 1, 1,
-0.3497805, 0.2007084, -0.7510275, 1, 1, 1, 1, 1,
-0.3492244, 1.009611, 0.3841967, 1, 1, 1, 1, 1,
-0.3485509, -2.074192, -2.707794, 1, 1, 1, 1, 1,
-0.3465449, 1.458589, 1.294504, 1, 1, 1, 1, 1,
-0.3425238, -0.3435822, -3.356001, 0, 0, 1, 1, 1,
-0.3416474, -1.311059, -4.002907, 1, 0, 0, 1, 1,
-0.3360614, -0.1458792, -3.102664, 1, 0, 0, 1, 1,
-0.3360418, -0.04693094, -2.321916, 1, 0, 0, 1, 1,
-0.3354401, 0.05211411, -0.3253052, 1, 0, 0, 1, 1,
-0.3350449, -1.007659, -3.820371, 1, 0, 0, 1, 1,
-0.3334166, 3.000088, 0.9445337, 0, 0, 0, 1, 1,
-0.3295619, -1.751887, -3.256964, 0, 0, 0, 1, 1,
-0.3286166, -0.6904263, -1.886685, 0, 0, 0, 1, 1,
-0.3270042, 2.118715, 1.991542, 0, 0, 0, 1, 1,
-0.3230149, 0.5577062, 0.1029222, 0, 0, 0, 1, 1,
-0.3206307, -0.07369531, -1.869582, 0, 0, 0, 1, 1,
-0.3177569, -1.029178, -1.80226, 0, 0, 0, 1, 1,
-0.3165904, 0.7760663, -0.0005289858, 1, 1, 1, 1, 1,
-0.3132568, 0.2884673, 1.3924, 1, 1, 1, 1, 1,
-0.312998, -0.8889795, -3.773933, 1, 1, 1, 1, 1,
-0.3104831, -0.02005741, 0.2654712, 1, 1, 1, 1, 1,
-0.3100084, -0.1081686, -3.110435, 1, 1, 1, 1, 1,
-0.3036409, 0.2564704, -1.546979, 1, 1, 1, 1, 1,
-0.3031873, -0.8614263, -2.224881, 1, 1, 1, 1, 1,
-0.3011188, 2.317887, 1.429012, 1, 1, 1, 1, 1,
-0.2993368, 0.5356591, -2.412906, 1, 1, 1, 1, 1,
-0.2976271, 0.3781519, -0.3183032, 1, 1, 1, 1, 1,
-0.2972255, 1.203177, 0.4036027, 1, 1, 1, 1, 1,
-0.2961366, 0.2511351, -2.08478, 1, 1, 1, 1, 1,
-0.2923083, -1.914135, -2.579336, 1, 1, 1, 1, 1,
-0.2917668, 0.71083, 1.483942, 1, 1, 1, 1, 1,
-0.2901698, -0.3783398, -3.670048, 1, 1, 1, 1, 1,
-0.2840514, -0.5913498, -3.569987, 0, 0, 1, 1, 1,
-0.2806028, -1.289614, -3.297841, 1, 0, 0, 1, 1,
-0.2775846, 0.1861043, 0.5182666, 1, 0, 0, 1, 1,
-0.2775086, 0.7120109, 0.1244691, 1, 0, 0, 1, 1,
-0.2755408, 0.3151462, -0.2651607, 1, 0, 0, 1, 1,
-0.2752056, 0.6689215, 0.5864666, 1, 0, 0, 1, 1,
-0.2702523, 0.6018344, -1.335034, 0, 0, 0, 1, 1,
-0.269658, -1.331318, -1.722942, 0, 0, 0, 1, 1,
-0.2683043, -0.6044444, -2.625355, 0, 0, 0, 1, 1,
-0.2630854, 0.5323385, -0.5806602, 0, 0, 0, 1, 1,
-0.2617465, -1.52511, -3.112066, 0, 0, 0, 1, 1,
-0.2590947, -0.9269374, -2.406267, 0, 0, 0, 1, 1,
-0.255303, -1.356238, -2.897852, 0, 0, 0, 1, 1,
-0.2519269, -1.305636, -3.232511, 1, 1, 1, 1, 1,
-0.2502385, 0.2170034, -3.378906, 1, 1, 1, 1, 1,
-0.2483155, -0.5384434, -3.06604, 1, 1, 1, 1, 1,
-0.2467202, 0.5264435, -2.319067, 1, 1, 1, 1, 1,
-0.2466394, -0.5771304, -3.676063, 1, 1, 1, 1, 1,
-0.2466028, 1.809572, 2.076443, 1, 1, 1, 1, 1,
-0.2437281, -0.9866111, -3.104877, 1, 1, 1, 1, 1,
-0.2436115, 1.800346, 0.7857841, 1, 1, 1, 1, 1,
-0.2434289, -0.459218, -2.115534, 1, 1, 1, 1, 1,
-0.2385007, 0.5402496, -1.501972, 1, 1, 1, 1, 1,
-0.2375225, 0.4566079, -2.019729, 1, 1, 1, 1, 1,
-0.2324298, -1.260568, -3.050681, 1, 1, 1, 1, 1,
-0.2323586, -0.1569668, -1.033435, 1, 1, 1, 1, 1,
-0.2284895, 0.3468811, -1.703431, 1, 1, 1, 1, 1,
-0.2284726, -0.4536674, -0.8357165, 1, 1, 1, 1, 1,
-0.2260765, -0.8110935, -3.310871, 0, 0, 1, 1, 1,
-0.2216451, -0.3602751, -2.618226, 1, 0, 0, 1, 1,
-0.2205014, -1.000819, -4.122771, 1, 0, 0, 1, 1,
-0.2134705, -0.6417885, -4.25975, 1, 0, 0, 1, 1,
-0.2107988, 0.4960044, 0.6661618, 1, 0, 0, 1, 1,
-0.2100797, 0.7252911, 0.9895131, 1, 0, 0, 1, 1,
-0.2091809, -0.3670626, -3.790656, 0, 0, 0, 1, 1,
-0.2084006, -0.08831666, -1.098469, 0, 0, 0, 1, 1,
-0.200044, 0.4338419, -0.6097357, 0, 0, 0, 1, 1,
-0.19465, -1.120887, -3.028334, 0, 0, 0, 1, 1,
-0.1945703, 2.143957, -0.4868807, 0, 0, 0, 1, 1,
-0.1930687, 1.477592, 0.2606842, 0, 0, 0, 1, 1,
-0.1907906, -0.7794204, -2.434266, 0, 0, 0, 1, 1,
-0.1904072, -0.5846491, -2.696764, 1, 1, 1, 1, 1,
-0.1903234, 0.1390141, -0.6547468, 1, 1, 1, 1, 1,
-0.188922, 1.049134, -0.9870557, 1, 1, 1, 1, 1,
-0.1888846, -0.08309232, -2.008359, 1, 1, 1, 1, 1,
-0.1875605, 0.5622407, -0.3286352, 1, 1, 1, 1, 1,
-0.1872665, 0.1723689, -0.7867352, 1, 1, 1, 1, 1,
-0.1863919, -1.431768, -1.801478, 1, 1, 1, 1, 1,
-0.1854982, 1.786624, 0.515636, 1, 1, 1, 1, 1,
-0.1807441, -0.7847718, -3.555194, 1, 1, 1, 1, 1,
-0.179414, 0.3875819, 0.7297949, 1, 1, 1, 1, 1,
-0.173399, -1.778468, -3.636949, 1, 1, 1, 1, 1,
-0.1733501, -0.7238718, -2.198255, 1, 1, 1, 1, 1,
-0.1733355, -1.547515, -3.477353, 1, 1, 1, 1, 1,
-0.1718595, -0.5279092, -2.855278, 1, 1, 1, 1, 1,
-0.1702966, -1.817346, -3.355625, 1, 1, 1, 1, 1,
-0.1687836, -2.016441, -1.955174, 0, 0, 1, 1, 1,
-0.1668132, 0.1090873, -2.798122, 1, 0, 0, 1, 1,
-0.1660022, 0.3185751, -1.063879, 1, 0, 0, 1, 1,
-0.1652961, -0.2997994, -2.37125, 1, 0, 0, 1, 1,
-0.1630336, 0.2639295, -2.91518, 1, 0, 0, 1, 1,
-0.1622167, -1.018874, -3.728873, 1, 0, 0, 1, 1,
-0.1604899, 0.82093, -0.9794492, 0, 0, 0, 1, 1,
-0.157781, -0.9173322, -2.07106, 0, 0, 0, 1, 1,
-0.1541385, -1.209813, -2.400942, 0, 0, 0, 1, 1,
-0.1534904, 0.0412576, -0.2282559, 0, 0, 0, 1, 1,
-0.147937, 0.4585752, 1.476687, 0, 0, 0, 1, 1,
-0.145291, -0.4280864, -2.637594, 0, 0, 0, 1, 1,
-0.1447864, -1.792329, -2.152419, 0, 0, 0, 1, 1,
-0.1414467, 1.560588, 1.541695, 1, 1, 1, 1, 1,
-0.1408243, -0.687034, -2.355376, 1, 1, 1, 1, 1,
-0.1361901, 0.8153914, 0.06037283, 1, 1, 1, 1, 1,
-0.1351559, 0.6766903, 0.7314579, 1, 1, 1, 1, 1,
-0.1347568, 0.5435631, -2.466977, 1, 1, 1, 1, 1,
-0.134471, -0.3850637, -0.9932226, 1, 1, 1, 1, 1,
-0.1336699, -0.1043974, -4.303355, 1, 1, 1, 1, 1,
-0.1307305, -0.4290282, -3.542667, 1, 1, 1, 1, 1,
-0.1306258, -1.31479, -1.323289, 1, 1, 1, 1, 1,
-0.1271034, -0.01702625, -2.712121, 1, 1, 1, 1, 1,
-0.1204273, 0.4666719, -1.218268, 1, 1, 1, 1, 1,
-0.1174054, 0.9250585, 0.3135931, 1, 1, 1, 1, 1,
-0.1172505, 0.708323, -0.6619651, 1, 1, 1, 1, 1,
-0.1171258, -0.433196, -2.373294, 1, 1, 1, 1, 1,
-0.1171224, 1.959732, 0.5135917, 1, 1, 1, 1, 1,
-0.11675, 1.770169, -2.838056, 0, 0, 1, 1, 1,
-0.1165964, -0.6937407, -3.855795, 1, 0, 0, 1, 1,
-0.1010208, 0.8865591, 1.045488, 1, 0, 0, 1, 1,
-0.09983052, 0.5682661, -1.449503, 1, 0, 0, 1, 1,
-0.09969382, 0.2351584, -1.661634, 1, 0, 0, 1, 1,
-0.09359344, 0.4871588, -0.6849577, 1, 0, 0, 1, 1,
-0.09139498, -0.7205588, -1.749874, 0, 0, 0, 1, 1,
-0.08263531, -0.838166, -1.780294, 0, 0, 0, 1, 1,
-0.08151515, 2.108428, 0.434897, 0, 0, 0, 1, 1,
-0.07975745, -0.1290988, -0.9023558, 0, 0, 0, 1, 1,
-0.07657955, 0.3331271, -1.08358, 0, 0, 0, 1, 1,
-0.07511491, 0.0697393, -0.4811786, 0, 0, 0, 1, 1,
-0.06520616, -0.1715487, -0.6413752, 0, 0, 0, 1, 1,
-0.06433025, 0.03643891, 0.9343952, 1, 1, 1, 1, 1,
-0.05956304, 1.606623, 0.05802915, 1, 1, 1, 1, 1,
-0.05567879, 0.7891048, 0.1418263, 1, 1, 1, 1, 1,
-0.05554844, 1.702644, 0.569428, 1, 1, 1, 1, 1,
-0.052876, 0.02345025, -2.777457, 1, 1, 1, 1, 1,
-0.04859722, -0.2141557, -4.148694, 1, 1, 1, 1, 1,
-0.04757703, -1.637558, -2.42409, 1, 1, 1, 1, 1,
-0.03836742, -0.199019, -4.785232, 1, 1, 1, 1, 1,
-0.0333746, -0.7174162, -3.01125, 1, 1, 1, 1, 1,
-0.02362581, 1.155642, 1.099126, 1, 1, 1, 1, 1,
-0.02223676, 0.7099224, -1.903656, 1, 1, 1, 1, 1,
-0.01330519, 1.193144, -0.5098618, 1, 1, 1, 1, 1,
-0.003712231, -0.7374527, -5.651565, 1, 1, 1, 1, 1,
0.0008373798, -0.9810914, 3.724198, 1, 1, 1, 1, 1,
0.003342769, 0.811814, 1.066158, 1, 1, 1, 1, 1,
0.005348035, 1.829008, -0.1851126, 0, 0, 1, 1, 1,
0.01075455, -0.582912, 3.93049, 1, 0, 0, 1, 1,
0.01349495, 1.96336, -1.469277, 1, 0, 0, 1, 1,
0.01657693, -1.100243, 3.99809, 1, 0, 0, 1, 1,
0.0179602, 0.3068431, -0.235888, 1, 0, 0, 1, 1,
0.01798191, -0.6210244, 3.304446, 1, 0, 0, 1, 1,
0.01843132, -1.792289, 2.334147, 0, 0, 0, 1, 1,
0.01851983, 0.9448313, -0.06287538, 0, 0, 0, 1, 1,
0.02105744, 1.275165, -0.6733226, 0, 0, 0, 1, 1,
0.02222155, -0.1831921, 3.349896, 0, 0, 0, 1, 1,
0.02301275, 0.6914883, 0.06233269, 0, 0, 0, 1, 1,
0.02464577, -0.9797738, 1.328132, 0, 0, 0, 1, 1,
0.02519542, 0.5247902, -1.008575, 0, 0, 0, 1, 1,
0.02667973, 0.3506354, -1.327092, 1, 1, 1, 1, 1,
0.03288942, 0.1598748, -0.2714469, 1, 1, 1, 1, 1,
0.03293078, 1.719736, 1.270089, 1, 1, 1, 1, 1,
0.03646973, 3.070463, 0.5079213, 1, 1, 1, 1, 1,
0.03651721, -0.3379664, 4.986346, 1, 1, 1, 1, 1,
0.03716427, 1.135564, 0.3755724, 1, 1, 1, 1, 1,
0.03730557, 0.2913051, -0.6634949, 1, 1, 1, 1, 1,
0.03756529, -1.336057, 3.555582, 1, 1, 1, 1, 1,
0.03910385, -0.561663, 1.770138, 1, 1, 1, 1, 1,
0.03999184, 0.8213064, 0.00647571, 1, 1, 1, 1, 1,
0.04012148, -0.5792826, 2.907645, 1, 1, 1, 1, 1,
0.04723946, 1.040805, 1.976923, 1, 1, 1, 1, 1,
0.04882091, -0.8695012, 3.073343, 1, 1, 1, 1, 1,
0.05273186, 0.787829, 1.208861, 1, 1, 1, 1, 1,
0.05700523, -1.32751, 3.713318, 1, 1, 1, 1, 1,
0.05949895, -0.1685099, 2.345002, 0, 0, 1, 1, 1,
0.06282552, 1.308019, 1.236744, 1, 0, 0, 1, 1,
0.06396884, 1.15892, -1.648461, 1, 0, 0, 1, 1,
0.06531557, 2.30408, 0.04155451, 1, 0, 0, 1, 1,
0.06829309, 0.9638835, 1.030495, 1, 0, 0, 1, 1,
0.070065, 1.024216, 0.9522563, 1, 0, 0, 1, 1,
0.07111697, 0.3332776, 2.347303, 0, 0, 0, 1, 1,
0.07471241, -1.668961, 2.609948, 0, 0, 0, 1, 1,
0.07521505, -0.9174795, 3.310364, 0, 0, 0, 1, 1,
0.07996779, -1.382748, 3.46743, 0, 0, 0, 1, 1,
0.08234964, -0.04598689, 2.816832, 0, 0, 0, 1, 1,
0.08345755, -0.3864329, 1.675973, 0, 0, 0, 1, 1,
0.08561644, 0.6177862, 0.6043234, 0, 0, 0, 1, 1,
0.08761127, -0.230962, 4.138988, 1, 1, 1, 1, 1,
0.09172388, 0.8425366, 1.538763, 1, 1, 1, 1, 1,
0.09259799, -0.3508938, 2.022641, 1, 1, 1, 1, 1,
0.09410254, 1.243307, -0.9451439, 1, 1, 1, 1, 1,
0.09584825, -0.227609, 1.778609, 1, 1, 1, 1, 1,
0.1039361, -0.1147964, 2.309424, 1, 1, 1, 1, 1,
0.1075835, -0.09383723, 2.13548, 1, 1, 1, 1, 1,
0.1084584, -1.501507, 4.137857, 1, 1, 1, 1, 1,
0.1220348, 1.508926, 2.47485, 1, 1, 1, 1, 1,
0.1305084, -0.6162238, 4.456765, 1, 1, 1, 1, 1,
0.1329328, 0.05139843, -0.2997217, 1, 1, 1, 1, 1,
0.1363149, 0.3179669, -0.3605241, 1, 1, 1, 1, 1,
0.1415896, -0.3578542, 3.207206, 1, 1, 1, 1, 1,
0.1487977, -1.229638, 3.666967, 1, 1, 1, 1, 1,
0.1521122, 0.184273, 0.6417457, 1, 1, 1, 1, 1,
0.1579385, 0.02194324, -0.01347695, 0, 0, 1, 1, 1,
0.158799, 1.839421, -0.4069043, 1, 0, 0, 1, 1,
0.1627065, 0.3285929, 1.227927, 1, 0, 0, 1, 1,
0.1639831, 0.5918037, 1.943317, 1, 0, 0, 1, 1,
0.1651142, -0.3872593, 2.74245, 1, 0, 0, 1, 1,
0.1703676, 0.5828857, 0.2583733, 1, 0, 0, 1, 1,
0.1722509, 0.8223099, -1.053481, 0, 0, 0, 1, 1,
0.1726552, 0.1637339, 0.717028, 0, 0, 0, 1, 1,
0.1736727, 0.5956718, 2.53557, 0, 0, 0, 1, 1,
0.1737853, -0.1986395, 3.304403, 0, 0, 0, 1, 1,
0.1755969, 1.499626, -0.4485301, 0, 0, 0, 1, 1,
0.1779299, -0.5022315, 1.803535, 0, 0, 0, 1, 1,
0.1832322, 0.1351219, 1.363703, 0, 0, 0, 1, 1,
0.1845164, -0.3693642, 3.548636, 1, 1, 1, 1, 1,
0.1859568, -0.4846762, 1.669005, 1, 1, 1, 1, 1,
0.1872692, 1.434737, 2.148202, 1, 1, 1, 1, 1,
0.1928564, -0.005013336, 0.8571258, 1, 1, 1, 1, 1,
0.2018869, -0.9802186, 2.388676, 1, 1, 1, 1, 1,
0.2040814, 0.7470385, 1.8434, 1, 1, 1, 1, 1,
0.2101062, 0.9062474, -0.9126612, 1, 1, 1, 1, 1,
0.2107456, -1.545643, 4.226448, 1, 1, 1, 1, 1,
0.2123872, -0.6016137, 2.619642, 1, 1, 1, 1, 1,
0.2160247, 1.003276, 0.2405295, 1, 1, 1, 1, 1,
0.2205536, -0.006290953, 1.298578, 1, 1, 1, 1, 1,
0.2212412, 0.5018951, -0.2049802, 1, 1, 1, 1, 1,
0.2222189, -0.855776, 3.146395, 1, 1, 1, 1, 1,
0.225158, 1.176772, -0.3149945, 1, 1, 1, 1, 1,
0.226318, 0.1502535, 1.887401, 1, 1, 1, 1, 1,
0.2274702, 0.2297879, -0.4330406, 0, 0, 1, 1, 1,
0.2300864, -1.927977, 3.157728, 1, 0, 0, 1, 1,
0.2325433, -0.4900305, 3.568731, 1, 0, 0, 1, 1,
0.2328921, 0.785927, -0.198063, 1, 0, 0, 1, 1,
0.235272, 1.955011, -0.3472641, 1, 0, 0, 1, 1,
0.2398323, -1.685624, 2.208048, 1, 0, 0, 1, 1,
0.241618, 1.118793, 1.121237, 0, 0, 0, 1, 1,
0.244807, 0.466401, 1.939607, 0, 0, 0, 1, 1,
0.2454464, 0.4456133, -0.9736652, 0, 0, 0, 1, 1,
0.2488716, -1.288673, 1.45695, 0, 0, 0, 1, 1,
0.2516437, -0.7436121, 4.067218, 0, 0, 0, 1, 1,
0.2523632, -0.589822, 2.887331, 0, 0, 0, 1, 1,
0.2538569, -1.017254, 3.897276, 0, 0, 0, 1, 1,
0.2713644, -0.1357903, 3.800651, 1, 1, 1, 1, 1,
0.2728969, -0.4821661, 2.799314, 1, 1, 1, 1, 1,
0.2745328, -1.057697, 3.299414, 1, 1, 1, 1, 1,
0.2769433, 0.5930858, 0.2360392, 1, 1, 1, 1, 1,
0.2795432, -0.1980957, 2.856725, 1, 1, 1, 1, 1,
0.2813006, 0.168832, 2.323587, 1, 1, 1, 1, 1,
0.2824243, 0.07393003, 0.5222001, 1, 1, 1, 1, 1,
0.2896747, 1.142905, -0.3769619, 1, 1, 1, 1, 1,
0.2915652, 0.2859074, 2.537632, 1, 1, 1, 1, 1,
0.2930332, 0.6351316, 1.534782, 1, 1, 1, 1, 1,
0.2931942, -0.908269, 3.63577, 1, 1, 1, 1, 1,
0.2938951, 0.7949538, 1.028146, 1, 1, 1, 1, 1,
0.2978007, 0.4420457, -0.3240417, 1, 1, 1, 1, 1,
0.2982425, 0.4350139, 0.2382433, 1, 1, 1, 1, 1,
0.2986938, -0.3566509, 2.187421, 1, 1, 1, 1, 1,
0.303308, 0.6924022, 2.013079, 0, 0, 1, 1, 1,
0.3059073, 1.131561, -0.5814869, 1, 0, 0, 1, 1,
0.3061901, -0.3395638, 0.8555531, 1, 0, 0, 1, 1,
0.3128673, 0.1581374, -0.6756124, 1, 0, 0, 1, 1,
0.3150638, -1.542307, 2.973805, 1, 0, 0, 1, 1,
0.3162373, -1.769395, 2.746298, 1, 0, 0, 1, 1,
0.3168615, 0.0724482, 1.512202, 0, 0, 0, 1, 1,
0.3222586, -0.12205, 2.109382, 0, 0, 0, 1, 1,
0.3254593, -0.841846, 2.705862, 0, 0, 0, 1, 1,
0.3267492, 1.27101, -0.5091711, 0, 0, 0, 1, 1,
0.3293531, 0.2643416, 1.414481, 0, 0, 0, 1, 1,
0.3310595, -0.6188954, 1.169337, 0, 0, 0, 1, 1,
0.3331465, -0.1036239, 2.692181, 0, 0, 0, 1, 1,
0.3387416, -0.2356064, 1.030907, 1, 1, 1, 1, 1,
0.3403918, 0.6422197, 0.9099442, 1, 1, 1, 1, 1,
0.3537994, 1.393552, 0.9744388, 1, 1, 1, 1, 1,
0.360479, -0.2383598, 1.707007, 1, 1, 1, 1, 1,
0.3612738, -0.4587234, 2.429209, 1, 1, 1, 1, 1,
0.3635865, -0.546807, 2.733389, 1, 1, 1, 1, 1,
0.3680072, -0.8167426, 1.46522, 1, 1, 1, 1, 1,
0.3703685, 0.9824353, 0.5527247, 1, 1, 1, 1, 1,
0.3709352, 0.2356377, -0.1180284, 1, 1, 1, 1, 1,
0.3714942, -0.1073956, 2.083536, 1, 1, 1, 1, 1,
0.3753732, 0.3846741, -0.78769, 1, 1, 1, 1, 1,
0.3811185, -0.04484264, 1.397106, 1, 1, 1, 1, 1,
0.3828941, -0.03203024, 2.5015, 1, 1, 1, 1, 1,
0.383781, 1.18012, 2.20333, 1, 1, 1, 1, 1,
0.3849772, -0.6068848, 1.306573, 1, 1, 1, 1, 1,
0.3850411, 0.9817079, 0.2966949, 0, 0, 1, 1, 1,
0.385077, 0.3604504, -0.4671371, 1, 0, 0, 1, 1,
0.3858878, -1.259028, 2.795659, 1, 0, 0, 1, 1,
0.3870032, -0.5983605, 3.334376, 1, 0, 0, 1, 1,
0.3887621, -1.802168, 3.612296, 1, 0, 0, 1, 1,
0.3912992, 1.638667, -0.1875208, 1, 0, 0, 1, 1,
0.3925655, 0.5309822, -1.996593, 0, 0, 0, 1, 1,
0.3932401, -1.080273, 2.168232, 0, 0, 0, 1, 1,
0.3949168, -0.1917214, -0.605954, 0, 0, 0, 1, 1,
0.3950095, -0.9291365, 2.643034, 0, 0, 0, 1, 1,
0.3952698, -0.2292238, 0.04287002, 0, 0, 0, 1, 1,
0.3967929, -0.1039113, 1.482933, 0, 0, 0, 1, 1,
0.4050439, -2.517806, 3.490195, 0, 0, 0, 1, 1,
0.4102429, -0.8376831, 3.691651, 1, 1, 1, 1, 1,
0.4102892, 0.5044628, 0.5832585, 1, 1, 1, 1, 1,
0.4108662, 1.106017, -0.05651594, 1, 1, 1, 1, 1,
0.4110281, 1.077955, -2.270479, 1, 1, 1, 1, 1,
0.4164917, -0.2550633, 3.280541, 1, 1, 1, 1, 1,
0.4172895, 0.189763, 0.2179232, 1, 1, 1, 1, 1,
0.4203233, -0.5412624, 5.486991, 1, 1, 1, 1, 1,
0.4223065, -2.082186, 3.474922, 1, 1, 1, 1, 1,
0.422498, 1.134148, 1.461742, 1, 1, 1, 1, 1,
0.4234451, -1.443199, 3.445624, 1, 1, 1, 1, 1,
0.4270907, 1.042584, 0.1366665, 1, 1, 1, 1, 1,
0.428406, -1.079227, 3.361627, 1, 1, 1, 1, 1,
0.4404505, -0.4631126, 2.342712, 1, 1, 1, 1, 1,
0.4485757, 0.4277994, -1.282946, 1, 1, 1, 1, 1,
0.4510621, -1.010396, 2.207652, 1, 1, 1, 1, 1,
0.4540312, 0.79615, 0.9492767, 0, 0, 1, 1, 1,
0.4560068, -0.2760911, 2.450111, 1, 0, 0, 1, 1,
0.4591855, -1.325167, 2.665317, 1, 0, 0, 1, 1,
0.4631014, 0.2021027, -0.878882, 1, 0, 0, 1, 1,
0.4656799, -1.856925, 2.954819, 1, 0, 0, 1, 1,
0.470258, -0.1963683, 1.86218, 1, 0, 0, 1, 1,
0.4719671, 0.4921033, 0.4360461, 0, 0, 0, 1, 1,
0.4744991, -0.6838699, 3.506851, 0, 0, 0, 1, 1,
0.4746465, 0.3570243, -0.1239555, 0, 0, 0, 1, 1,
0.4805076, -0.4259723, 4.374863, 0, 0, 0, 1, 1,
0.4881113, -0.4256118, 2.445553, 0, 0, 0, 1, 1,
0.4924474, -0.5629944, 1.793559, 0, 0, 0, 1, 1,
0.4948551, -0.162321, 2.58019, 0, 0, 0, 1, 1,
0.4969955, 1.241202, 2.068669, 1, 1, 1, 1, 1,
0.498137, -0.03443937, 2.286914, 1, 1, 1, 1, 1,
0.4981909, 0.8762184, 0.8387963, 1, 1, 1, 1, 1,
0.5011774, 1.218503, 1.21439, 1, 1, 1, 1, 1,
0.510074, -0.90346, 2.577648, 1, 1, 1, 1, 1,
0.5102811, 0.1037399, 1.857077, 1, 1, 1, 1, 1,
0.5124596, 0.2639966, 0.4288416, 1, 1, 1, 1, 1,
0.5150219, 0.3543453, 2.419135, 1, 1, 1, 1, 1,
0.5155873, 2.499742, -0.02947599, 1, 1, 1, 1, 1,
0.5195819, 0.7898002, -1.392597, 1, 1, 1, 1, 1,
0.521809, -1.777692, 2.759837, 1, 1, 1, 1, 1,
0.5232303, -1.124532, 1.203883, 1, 1, 1, 1, 1,
0.5253441, 0.6409376, 2.744026, 1, 1, 1, 1, 1,
0.5396986, -0.6820979, 2.628207, 1, 1, 1, 1, 1,
0.5401043, 0.7229518, 0.2210495, 1, 1, 1, 1, 1,
0.541434, 1.640233, 0.3966106, 0, 0, 1, 1, 1,
0.5476895, 2.265085, -0.8416404, 1, 0, 0, 1, 1,
0.5521258, 1.031164, -0.3423294, 1, 0, 0, 1, 1,
0.5525742, 0.2481392, 0.8935934, 1, 0, 0, 1, 1,
0.5616071, 1.768973, -0.9375317, 1, 0, 0, 1, 1,
0.5626433, -0.1847067, 2.676305, 1, 0, 0, 1, 1,
0.566215, 1.046764, 0.6343607, 0, 0, 0, 1, 1,
0.5687196, -0.1825387, 3.959828, 0, 0, 0, 1, 1,
0.5719151, 0.2163851, 0.5889783, 0, 0, 0, 1, 1,
0.5738612, -0.378891, 1.705468, 0, 0, 0, 1, 1,
0.5750486, -0.2379441, 0.8829555, 0, 0, 0, 1, 1,
0.5764762, 0.5482606, 0.944364, 0, 0, 0, 1, 1,
0.5772046, 0.714579, 1.307784, 0, 0, 0, 1, 1,
0.5790079, -0.2060324, 2.806809, 1, 1, 1, 1, 1,
0.5793305, 0.2302499, -0.3757093, 1, 1, 1, 1, 1,
0.5851851, 0.05327719, 2.393553, 1, 1, 1, 1, 1,
0.5883987, -0.1225227, 1.739175, 1, 1, 1, 1, 1,
0.5887601, 1.642202, 1.991382, 1, 1, 1, 1, 1,
0.5891924, 1.70403, 0.9163654, 1, 1, 1, 1, 1,
0.5893527, 0.3827892, -0.1564475, 1, 1, 1, 1, 1,
0.5923213, 0.07988944, 0.7859043, 1, 1, 1, 1, 1,
0.5955128, 0.4017416, 0.3460744, 1, 1, 1, 1, 1,
0.6001619, -1.450246, 3.770751, 1, 1, 1, 1, 1,
0.6032993, -0.6628823, 2.160267, 1, 1, 1, 1, 1,
0.6056495, 0.2173128, 0.9749682, 1, 1, 1, 1, 1,
0.6057329, 1.977036, -0.27988, 1, 1, 1, 1, 1,
0.6072209, -0.6718863, 0.8657293, 1, 1, 1, 1, 1,
0.6095898, 0.8375086, 2.544549, 1, 1, 1, 1, 1,
0.6125338, 0.7571051, 2.658408, 0, 0, 1, 1, 1,
0.6150568, -1.345995, 4.385896, 1, 0, 0, 1, 1,
0.6172419, -1.015006, 2.876414, 1, 0, 0, 1, 1,
0.6183566, -1.341345, 3.046317, 1, 0, 0, 1, 1,
0.6249313, 0.8853076, 1.493407, 1, 0, 0, 1, 1,
0.6251071, 0.5641435, 1.688869, 1, 0, 0, 1, 1,
0.626893, -0.3315842, 1.243508, 0, 0, 0, 1, 1,
0.6283752, -0.1340296, 1.865345, 0, 0, 0, 1, 1,
0.6284521, 1.058092, 1.875485, 0, 0, 0, 1, 1,
0.6306279, 0.1125422, 0.9038424, 0, 0, 0, 1, 1,
0.6316606, -0.1564671, 1.284906, 0, 0, 0, 1, 1,
0.6342756, -2.347427, 2.547534, 0, 0, 0, 1, 1,
0.6417969, 0.6560239, 0.4729306, 0, 0, 0, 1, 1,
0.6435946, 0.2841755, 0.3485061, 1, 1, 1, 1, 1,
0.6447413, -1.188612, 2.807053, 1, 1, 1, 1, 1,
0.6492063, 0.6738955, 0.4961571, 1, 1, 1, 1, 1,
0.651988, -0.5453185, 3.167309, 1, 1, 1, 1, 1,
0.6523163, 1.638678, -0.6841142, 1, 1, 1, 1, 1,
0.6526336, -0.6778156, 3.031949, 1, 1, 1, 1, 1,
0.6526826, -0.1825408, 2.131652, 1, 1, 1, 1, 1,
0.6527365, -2.111622, 3.763186, 1, 1, 1, 1, 1,
0.6540509, -0.8154596, 1.727189, 1, 1, 1, 1, 1,
0.6563448, 0.6270825, 0.8563136, 1, 1, 1, 1, 1,
0.6564206, 1.162151, 0.7019413, 1, 1, 1, 1, 1,
0.6566144, -0.8990492, 2.842758, 1, 1, 1, 1, 1,
0.6573333, -0.7523196, 3.293859, 1, 1, 1, 1, 1,
0.664786, 0.1473327, 0.8781916, 1, 1, 1, 1, 1,
0.6694698, 1.933446, 0.8621079, 1, 1, 1, 1, 1,
0.6811608, 0.7990389, -0.7009622, 0, 0, 1, 1, 1,
0.6825784, -0.1004562, 2.148185, 1, 0, 0, 1, 1,
0.6838817, -1.857115, 2.920571, 1, 0, 0, 1, 1,
0.6884168, 0.5752854, -0.7627283, 1, 0, 0, 1, 1,
0.6898282, -0.9756427, 3.30302, 1, 0, 0, 1, 1,
0.6915426, 1.077956, 2.061997, 1, 0, 0, 1, 1,
0.6964416, -0.1363136, 1.763377, 0, 0, 0, 1, 1,
0.6983092, -0.02068744, 2.870045, 0, 0, 0, 1, 1,
0.7003824, 0.01424254, -0.2043941, 0, 0, 0, 1, 1,
0.7103583, 0.6182796, -0.1043294, 0, 0, 0, 1, 1,
0.7124686, -1.412741, 3.259744, 0, 0, 0, 1, 1,
0.716089, -0.3322878, 2.349419, 0, 0, 0, 1, 1,
0.7205467, 0.4997826, 1.744025, 0, 0, 0, 1, 1,
0.7303323, 1.568642, 0.8122708, 1, 1, 1, 1, 1,
0.7303991, -1.663308, 2.599509, 1, 1, 1, 1, 1,
0.7379386, -1.141511, 2.027717, 1, 1, 1, 1, 1,
0.7419401, 1.240185, -0.3415461, 1, 1, 1, 1, 1,
0.7431149, -0.1461087, 1.706397, 1, 1, 1, 1, 1,
0.7472388, -1.161773, 2.510402, 1, 1, 1, 1, 1,
0.7480583, -1.717673, 3.530155, 1, 1, 1, 1, 1,
0.7482761, 0.7311967, 2.398366, 1, 1, 1, 1, 1,
0.7526, 1.957544, -0.430198, 1, 1, 1, 1, 1,
0.7560077, -0.07014114, 2.074366, 1, 1, 1, 1, 1,
0.7571062, -1.11069, 2.045777, 1, 1, 1, 1, 1,
0.7633974, 1.193996, 1.261258, 1, 1, 1, 1, 1,
0.7650618, 1.099387, 1.147041, 1, 1, 1, 1, 1,
0.7815682, -0.5644806, 2.373427, 1, 1, 1, 1, 1,
0.7829912, -0.6039072, 0.5726663, 1, 1, 1, 1, 1,
0.7840088, 1.44887, 1.239494, 0, 0, 1, 1, 1,
0.7906128, 0.6611025, 1.910828, 1, 0, 0, 1, 1,
0.7909514, -0.6438217, 2.315342, 1, 0, 0, 1, 1,
0.791888, 0.9287131, -0.5940049, 1, 0, 0, 1, 1,
0.7939055, -0.1619939, 1.357783, 1, 0, 0, 1, 1,
0.7949515, -0.1625095, 3.625886, 1, 0, 0, 1, 1,
0.795408, -0.217947, 1.899953, 0, 0, 0, 1, 1,
0.8032036, 0.0627291, 2.236467, 0, 0, 0, 1, 1,
0.8044333, -0.190813, 1.248008, 0, 0, 0, 1, 1,
0.8047869, -0.792331, 1.031727, 0, 0, 0, 1, 1,
0.8105188, 0.3064422, 1.782353, 0, 0, 0, 1, 1,
0.8196283, 0.4692976, 1.58115, 0, 0, 0, 1, 1,
0.8293179, 0.04059546, 1.988015, 0, 0, 0, 1, 1,
0.8295077, 0.7070254, 2.196134, 1, 1, 1, 1, 1,
0.833979, -1.447337, 0.741556, 1, 1, 1, 1, 1,
0.8369824, -0.2470559, 2.519392, 1, 1, 1, 1, 1,
0.8392795, -0.1724411, 2.282333, 1, 1, 1, 1, 1,
0.8393692, 0.3251549, 1.043146, 1, 1, 1, 1, 1,
0.8396621, 0.3465983, 0.808537, 1, 1, 1, 1, 1,
0.8403862, 0.6215237, 1.184162, 1, 1, 1, 1, 1,
0.8424391, 0.3034266, 1.843956, 1, 1, 1, 1, 1,
0.8510659, 0.4493515, 0.07616009, 1, 1, 1, 1, 1,
0.8522132, -1.017884, 2.190983, 1, 1, 1, 1, 1,
0.8580998, -1.62042, 1.754696, 1, 1, 1, 1, 1,
0.8587376, -0.02497919, 2.18228, 1, 1, 1, 1, 1,
0.8615394, 0.9488347, -0.9884858, 1, 1, 1, 1, 1,
0.8619543, 0.1269953, 0.9411088, 1, 1, 1, 1, 1,
0.8638048, -0.7107512, 3.015428, 1, 1, 1, 1, 1,
0.8649658, 0.6372792, 2.328978, 0, 0, 1, 1, 1,
0.8687162, -0.6471167, 2.558645, 1, 0, 0, 1, 1,
0.880266, -0.459795, 3.708432, 1, 0, 0, 1, 1,
0.8838596, -0.1475607, 1.353101, 1, 0, 0, 1, 1,
0.8852857, -0.014298, -0.4163474, 1, 0, 0, 1, 1,
0.8903126, -0.6473784, 3.328726, 1, 0, 0, 1, 1,
0.8908697, -1.307927, 3.071176, 0, 0, 0, 1, 1,
0.8924963, -1.298253, 2.524791, 0, 0, 0, 1, 1,
0.8974335, -0.9266056, 1.466465, 0, 0, 0, 1, 1,
0.9055599, -0.09467065, 1.241221, 0, 0, 0, 1, 1,
0.9163727, -3.010165, 4.193955, 0, 0, 0, 1, 1,
0.9172319, 0.8885679, 1.304168, 0, 0, 0, 1, 1,
0.9225268, -0.09887052, 1.420013, 0, 0, 0, 1, 1,
0.9231243, -0.04850145, 1.574992, 1, 1, 1, 1, 1,
0.9265417, -0.440874, 0.3622103, 1, 1, 1, 1, 1,
0.9320894, 1.513902, 0.7359273, 1, 1, 1, 1, 1,
0.9399396, 0.6462646, 0.7037017, 1, 1, 1, 1, 1,
0.9408052, -0.04906079, 1.769638, 1, 1, 1, 1, 1,
0.9416713, -0.358758, 2.875074, 1, 1, 1, 1, 1,
0.9439281, 0.5970016, 1.498389, 1, 1, 1, 1, 1,
0.9445483, 0.2573968, 1.022531, 1, 1, 1, 1, 1,
0.9479697, 3.022102, -0.02900559, 1, 1, 1, 1, 1,
0.9502556, 1.142452, 2.701328, 1, 1, 1, 1, 1,
0.9574117, 0.2436187, 0.7350625, 1, 1, 1, 1, 1,
0.9575951, 0.4717427, 0.7235711, 1, 1, 1, 1, 1,
0.9679159, -0.8691755, 2.953544, 1, 1, 1, 1, 1,
0.9781659, 0.005656323, 2.702405, 1, 1, 1, 1, 1,
0.9829072, 0.1097378, 0.8084275, 1, 1, 1, 1, 1,
0.9902014, -1.476725, 3.866615, 0, 0, 1, 1, 1,
0.9902593, -1.751995, 3.711124, 1, 0, 0, 1, 1,
0.9952032, 0.08983997, 1.253713, 1, 0, 0, 1, 1,
0.9990993, 1.369734, 0.9606532, 1, 0, 0, 1, 1,
0.99992, -0.6718782, 3.468673, 1, 0, 0, 1, 1,
1.006686, 1.054701, 1.935874, 1, 0, 0, 1, 1,
1.009625, 0.3345667, 1.359181, 0, 0, 0, 1, 1,
1.015933, -0.6027324, 1.669242, 0, 0, 0, 1, 1,
1.028242, -1.355793, 2.31873, 0, 0, 0, 1, 1,
1.030563, -0.1175283, 1.306385, 0, 0, 0, 1, 1,
1.030625, -1.095003, 3.123142, 0, 0, 0, 1, 1,
1.033045, 0.03292317, 0.4700459, 0, 0, 0, 1, 1,
1.033572, -1.111422, 2.621229, 0, 0, 0, 1, 1,
1.034347, -0.6948795, 1.601328, 1, 1, 1, 1, 1,
1.036681, 0.4970373, 1.915417, 1, 1, 1, 1, 1,
1.04328, -0.615077, 2.378494, 1, 1, 1, 1, 1,
1.053272, 1.351883, -0.3516962, 1, 1, 1, 1, 1,
1.053388, 0.4172027, -0.4502115, 1, 1, 1, 1, 1,
1.056714, 0.6940526, 1.474288, 1, 1, 1, 1, 1,
1.065094, -0.0494891, 3.023675, 1, 1, 1, 1, 1,
1.069752, -0.2493949, 0.7987791, 1, 1, 1, 1, 1,
1.091878, -0.3558446, 2.024069, 1, 1, 1, 1, 1,
1.092878, -1.436433, 2.739073, 1, 1, 1, 1, 1,
1.093069, 0.4750763, 1.613257, 1, 1, 1, 1, 1,
1.094904, 0.9954688, 0.1277592, 1, 1, 1, 1, 1,
1.096323, -0.4221406, 0.1331727, 1, 1, 1, 1, 1,
1.104586, -0.1329047, 0.3119769, 1, 1, 1, 1, 1,
1.105803, -0.7537933, 1.956893, 1, 1, 1, 1, 1,
1.115151, 1.511495, -1.177248, 0, 0, 1, 1, 1,
1.123276, -0.3860782, 2.181548, 1, 0, 0, 1, 1,
1.127605, 1.334247, 2.126304, 1, 0, 0, 1, 1,
1.137424, 0.7536426, 0.8199281, 1, 0, 0, 1, 1,
1.138202, -1.474251, 2.931092, 1, 0, 0, 1, 1,
1.141724, 0.7196244, 1.426237, 1, 0, 0, 1, 1,
1.142838, -0.04947493, 2.707098, 0, 0, 0, 1, 1,
1.148506, 0.5806161, 2.973936, 0, 0, 0, 1, 1,
1.151496, -2.421154, 2.844088, 0, 0, 0, 1, 1,
1.157836, 1.589501, 0.09614724, 0, 0, 0, 1, 1,
1.161355, 0.7454165, -1.352804, 0, 0, 0, 1, 1,
1.166597, 0.7244412, 2.21959, 0, 0, 0, 1, 1,
1.167507, 0.8089505, 2.172024, 0, 0, 0, 1, 1,
1.170443, -1.208872, 2.201081, 1, 1, 1, 1, 1,
1.195342, 2.16934, 0.7268798, 1, 1, 1, 1, 1,
1.199259, -1.53432, 1.80679, 1, 1, 1, 1, 1,
1.207102, 0.6500548, -0.4763198, 1, 1, 1, 1, 1,
1.207622, 0.3383757, -0.3527856, 1, 1, 1, 1, 1,
1.208287, 0.3360005, 0.647376, 1, 1, 1, 1, 1,
1.210946, 1.856756, 0.4943003, 1, 1, 1, 1, 1,
1.220046, -0.1925367, 1.846562, 1, 1, 1, 1, 1,
1.22263, 0.8792966, 0.1049218, 1, 1, 1, 1, 1,
1.240968, -1.524684, 2.07959, 1, 1, 1, 1, 1,
1.243763, 0.5177007, 1.733932, 1, 1, 1, 1, 1,
1.245241, 1.33891, -0.7213182, 1, 1, 1, 1, 1,
1.246524, 0.8456216, 1.398695, 1, 1, 1, 1, 1,
1.252972, -0.2763908, 2.058684, 1, 1, 1, 1, 1,
1.261057, -0.4875201, 1.109954, 1, 1, 1, 1, 1,
1.261257, 1.546202, 1.595003, 0, 0, 1, 1, 1,
1.270931, 0.7846537, 3.599412, 1, 0, 0, 1, 1,
1.272078, 0.2015832, 0.247919, 1, 0, 0, 1, 1,
1.275862, -0.9282663, 1.989707, 1, 0, 0, 1, 1,
1.280889, -0.6418049, 2.344723, 1, 0, 0, 1, 1,
1.283851, -1.041537, 1.648356, 1, 0, 0, 1, 1,
1.299879, -0.2181946, 1.491496, 0, 0, 0, 1, 1,
1.304643, 0.4757235, 0.3951416, 0, 0, 0, 1, 1,
1.311196, -0.02653902, 0.2955308, 0, 0, 0, 1, 1,
1.312778, -0.3338682, 2.278649, 0, 0, 0, 1, 1,
1.313398, -1.686093, 4.772609, 0, 0, 0, 1, 1,
1.322189, 0.4684438, 1.017534, 0, 0, 0, 1, 1,
1.323747, -1.109607, 0.6687516, 0, 0, 0, 1, 1,
1.325538, -1.318861, 1.71788, 1, 1, 1, 1, 1,
1.335681, -1.822855, 2.162352, 1, 1, 1, 1, 1,
1.342723, -0.7587738, 2.388072, 1, 1, 1, 1, 1,
1.355124, -0.5312154, 2.423578, 1, 1, 1, 1, 1,
1.363817, -0.3556024, 1.056816, 1, 1, 1, 1, 1,
1.379619, -0.663727, 2.718643, 1, 1, 1, 1, 1,
1.396558, -0.1819028, 0.7953162, 1, 1, 1, 1, 1,
1.397067, -0.3106844, 1.667626, 1, 1, 1, 1, 1,
1.415653, 0.945686, 1.247579, 1, 1, 1, 1, 1,
1.416991, -0.229972, 0.5608011, 1, 1, 1, 1, 1,
1.427278, -0.4987857, 2.926855, 1, 1, 1, 1, 1,
1.430232, 1.434641, 2.210853, 1, 1, 1, 1, 1,
1.44061, -0.4645134, 2.249725, 1, 1, 1, 1, 1,
1.444873, 0.3619902, 0.5294814, 1, 1, 1, 1, 1,
1.452341, -0.8321476, 3.450007, 1, 1, 1, 1, 1,
1.452376, -0.6118101, 2.92203, 0, 0, 1, 1, 1,
1.455712, -0.2831011, 0.1780033, 1, 0, 0, 1, 1,
1.456306, -0.7665427, 2.152372, 1, 0, 0, 1, 1,
1.463431, -1.340096, 2.286674, 1, 0, 0, 1, 1,
1.46407, -0.4361974, 0.6569648, 1, 0, 0, 1, 1,
1.470632, 1.735986, 1.872304, 1, 0, 0, 1, 1,
1.492847, 1.13759, -0.5117908, 0, 0, 0, 1, 1,
1.503397, 0.8871067, 1.847072, 0, 0, 0, 1, 1,
1.514305, 0.3625098, 3.897176, 0, 0, 0, 1, 1,
1.522271, 0.2969087, 2.008011, 0, 0, 0, 1, 1,
1.552969, 0.1199259, 1.510237, 0, 0, 0, 1, 1,
1.554237, -0.3875372, 0.2877267, 0, 0, 0, 1, 1,
1.562543, 0.4291986, -1.714024, 0, 0, 0, 1, 1,
1.588223, -1.679705, 1.343212, 1, 1, 1, 1, 1,
1.589813, 1.359954, 2.03219, 1, 1, 1, 1, 1,
1.598884, -0.147715, 1.504166, 1, 1, 1, 1, 1,
1.600449, -0.9961407, 0.627933, 1, 1, 1, 1, 1,
1.610305, 0.9323066, 1.241078, 1, 1, 1, 1, 1,
1.615834, -0.01648691, 1.9153, 1, 1, 1, 1, 1,
1.616986, -0.9024469, 0.5638611, 1, 1, 1, 1, 1,
1.619689, -0.9294213, 2.655091, 1, 1, 1, 1, 1,
1.633517, 0.01615072, 0.774573, 1, 1, 1, 1, 1,
1.659685, -1.33708, 2.806145, 1, 1, 1, 1, 1,
1.663368, -1.274464, 3.919225, 1, 1, 1, 1, 1,
1.67091, 1.486498, 1.482469, 1, 1, 1, 1, 1,
1.67852, -0.1218769, 2.395337, 1, 1, 1, 1, 1,
1.681656, -1.401185, 1.613863, 1, 1, 1, 1, 1,
1.684778, 0.6131005, 1.324771, 1, 1, 1, 1, 1,
1.689048, 2.13137, 0.6490167, 0, 0, 1, 1, 1,
1.690173, -0.1378712, 1.170587, 1, 0, 0, 1, 1,
1.701134, -2.03775, 2.903306, 1, 0, 0, 1, 1,
1.726125, -0.2439323, 2.33747, 1, 0, 0, 1, 1,
1.735593, 0.1707748, 2.172105, 1, 0, 0, 1, 1,
1.738317, -0.3077118, 1.2797, 1, 0, 0, 1, 1,
1.758582, 1.144279, 1.847934, 0, 0, 0, 1, 1,
1.77228, -0.2946092, 2.065028, 0, 0, 0, 1, 1,
1.776938, 0.04314983, 1.760021, 0, 0, 0, 1, 1,
1.79138, 1.149873, 1.626241, 0, 0, 0, 1, 1,
1.795127, -0.2296075, 2.47974, 0, 0, 0, 1, 1,
1.814324, -0.1260493, 3.44154, 0, 0, 0, 1, 1,
1.825784, 0.455071, 1.358889, 0, 0, 0, 1, 1,
1.828441, 0.6361964, 1.989489, 1, 1, 1, 1, 1,
1.831477, -0.6676451, 1.646854, 1, 1, 1, 1, 1,
1.861332, 1.521323, 0.4898919, 1, 1, 1, 1, 1,
1.913095, 2.061841, 0.5604914, 1, 1, 1, 1, 1,
1.914538, 0.2383305, 3.369206, 1, 1, 1, 1, 1,
1.973242, -1.045837, 3.539322, 1, 1, 1, 1, 1,
1.990199, -0.8519399, 2.431008, 1, 1, 1, 1, 1,
1.992047, 0.0387299, 2.083781, 1, 1, 1, 1, 1,
1.994916, -2.125612, 3.316958, 1, 1, 1, 1, 1,
2.038743, -0.4937522, 3.688623, 1, 1, 1, 1, 1,
2.049417, -1.4206, 1.623314, 1, 1, 1, 1, 1,
2.097897, 0.1404887, 2.610662, 1, 1, 1, 1, 1,
2.103014, 0.5081159, 1.553939, 1, 1, 1, 1, 1,
2.193727, -1.796857, 2.282936, 1, 1, 1, 1, 1,
2.194815, 0.02415847, 3.046344, 1, 1, 1, 1, 1,
2.222392, 0.8081362, 1.618487, 0, 0, 1, 1, 1,
2.233141, -0.8802233, 1.529825, 1, 0, 0, 1, 1,
2.243882, 0.0102762, 2.887272, 1, 0, 0, 1, 1,
2.244563, -2.373555, 2.042999, 1, 0, 0, 1, 1,
2.26289, -0.04072881, 1.54925, 1, 0, 0, 1, 1,
2.277012, -0.5496169, 1.870048, 1, 0, 0, 1, 1,
2.283876, -0.3338678, 0.324124, 0, 0, 0, 1, 1,
2.325835, -0.06316554, 4.340498, 0, 0, 0, 1, 1,
2.361287, 0.4628882, 3.160877, 0, 0, 0, 1, 1,
2.454319, -1.322759, 2.974488, 0, 0, 0, 1, 1,
2.458307, 0.211415, 1.260876, 0, 0, 0, 1, 1,
2.468415, 0.3634457, 0.275587, 0, 0, 0, 1, 1,
2.491469, 0.03044549, 1.706093, 0, 0, 0, 1, 1,
2.507574, 1.074483, -0.900957, 1, 1, 1, 1, 1,
2.576614, 0.01830638, 0.0170277, 1, 1, 1, 1, 1,
2.600854, -0.3029383, 1.95906, 1, 1, 1, 1, 1,
2.667824, 1.357469, 0.5323943, 1, 1, 1, 1, 1,
2.72676, 0.2243405, 0.8241853, 1, 1, 1, 1, 1,
2.803616, 0.1399667, 3.246215, 1, 1, 1, 1, 1,
2.811847, -1.290464, 1.401232, 1, 1, 1, 1, 1
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
var radius = 9.687576;
var distance = 34.0272;
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
mvMatrix.translate( 0.2908142, -0.1819739, 0.08228707 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.0272);
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
