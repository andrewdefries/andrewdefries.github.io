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
-4.173175, 2.510588, -1.356793, 1, 0, 0, 1,
-2.977812, 1.224518, -0.9304449, 1, 0.007843138, 0, 1,
-2.961058, 0.004951935, -0.05467602, 1, 0.01176471, 0, 1,
-2.940869, -0.0956298, -2.009139, 1, 0.01960784, 0, 1,
-2.854024, 0.463196, 1.678431, 1, 0.02352941, 0, 1,
-2.809105, 0.4516156, -1.134199, 1, 0.03137255, 0, 1,
-2.604288, 0.6484097, -1.14404, 1, 0.03529412, 0, 1,
-2.408216, -0.08959642, 0.07324513, 1, 0.04313726, 0, 1,
-2.397544, 0.3632396, -1.039162, 1, 0.04705882, 0, 1,
-2.382071, 0.9821824, -1.775481, 1, 0.05490196, 0, 1,
-2.263349, -0.3443069, -2.799231, 1, 0.05882353, 0, 1,
-2.164387, 1.262417, -2.198936, 1, 0.06666667, 0, 1,
-2.130408, -0.3313505, -0.05787307, 1, 0.07058824, 0, 1,
-2.113283, -0.2858467, 0.1397104, 1, 0.07843138, 0, 1,
-2.09782, -2.420424, -4.952308, 1, 0.08235294, 0, 1,
-2.085649, 0.9780562, -2.051792, 1, 0.09019608, 0, 1,
-2.081483, 0.3688385, -2.761598, 1, 0.09411765, 0, 1,
-2.080843, -0.7250075, -2.037561, 1, 0.1019608, 0, 1,
-2.074736, -1.565631, -2.467438, 1, 0.1098039, 0, 1,
-2.067443, 1.357797, -2.011686, 1, 0.1137255, 0, 1,
-2.063788, 0.6776538, -1.947578, 1, 0.1215686, 0, 1,
-2.055106, -0.8644159, -1.734611, 1, 0.1254902, 0, 1,
-2.004006, 0.3755293, -1.808719, 1, 0.1333333, 0, 1,
-1.993743, 1.283493, 0.2140486, 1, 0.1372549, 0, 1,
-1.964218, 0.7449779, -0.1773542, 1, 0.145098, 0, 1,
-1.930971, -0.6743747, -1.198613, 1, 0.1490196, 0, 1,
-1.930435, 1.566045, -1.584861, 1, 0.1568628, 0, 1,
-1.918594, 0.1592361, -1.644883, 1, 0.1607843, 0, 1,
-1.914061, 1.060013, -1.118301, 1, 0.1686275, 0, 1,
-1.900879, 0.3528953, 0.247884, 1, 0.172549, 0, 1,
-1.882549, 0.1801682, -1.66855, 1, 0.1803922, 0, 1,
-1.878412, -0.5565791, -1.285878, 1, 0.1843137, 0, 1,
-1.860743, 1.722811, -1.7878, 1, 0.1921569, 0, 1,
-1.857002, 0.5939514, -1.822275, 1, 0.1960784, 0, 1,
-1.839758, -0.263413, -1.145363, 1, 0.2039216, 0, 1,
-1.80521, -0.7434135, -1.720667, 1, 0.2117647, 0, 1,
-1.803883, -0.5229967, -0.501067, 1, 0.2156863, 0, 1,
-1.775829, 0.1008968, -1.594559, 1, 0.2235294, 0, 1,
-1.760716, -1.38541, -1.796664, 1, 0.227451, 0, 1,
-1.727495, 0.2839944, -1.765349, 1, 0.2352941, 0, 1,
-1.726681, -0.5144207, -2.034555, 1, 0.2392157, 0, 1,
-1.7116, -0.1930455, -3.53712, 1, 0.2470588, 0, 1,
-1.710131, 0.3363622, -1.606253, 1, 0.2509804, 0, 1,
-1.710056, 1.1911, 0.03825091, 1, 0.2588235, 0, 1,
-1.704914, 2.209491, 1.019411, 1, 0.2627451, 0, 1,
-1.699102, -1.15877, -1.960439, 1, 0.2705882, 0, 1,
-1.693428, -0.3047453, -2.248304, 1, 0.2745098, 0, 1,
-1.673, 0.6860191, -0.7636017, 1, 0.282353, 0, 1,
-1.660585, -2.425307, -4.216283, 1, 0.2862745, 0, 1,
-1.64675, 1.143828, -1.738372, 1, 0.2941177, 0, 1,
-1.640078, -0.5723912, -1.698712, 1, 0.3019608, 0, 1,
-1.621015, 0.4631211, 0.751385, 1, 0.3058824, 0, 1,
-1.61935, -0.6386628, -1.613005, 1, 0.3137255, 0, 1,
-1.619129, -1.256188, -1.881612, 1, 0.3176471, 0, 1,
-1.618317, -0.1765966, -1.293477, 1, 0.3254902, 0, 1,
-1.617168, 0.5853578, -0.3507238, 1, 0.3294118, 0, 1,
-1.612033, 0.8541476, -2.047397, 1, 0.3372549, 0, 1,
-1.61123, 1.948248, -0.4499665, 1, 0.3411765, 0, 1,
-1.607034, -0.3125011, -1.869135, 1, 0.3490196, 0, 1,
-1.606813, 0.969726, -1.780421, 1, 0.3529412, 0, 1,
-1.563661, -0.422314, -2.372252, 1, 0.3607843, 0, 1,
-1.560933, 2.010145, -1.138524, 1, 0.3647059, 0, 1,
-1.547368, -0.197022, -1.747576, 1, 0.372549, 0, 1,
-1.54391, -1.67024, -3.95774, 1, 0.3764706, 0, 1,
-1.529324, -0.07692806, -0.6686301, 1, 0.3843137, 0, 1,
-1.527413, -0.6272641, -1.890402, 1, 0.3882353, 0, 1,
-1.520182, -0.3830726, -3.588468, 1, 0.3960784, 0, 1,
-1.514808, 2.387411, 0.02032497, 1, 0.4039216, 0, 1,
-1.50916, -0.9203838, -3.242409, 1, 0.4078431, 0, 1,
-1.505927, -0.6247596, -2.463393, 1, 0.4156863, 0, 1,
-1.50125, -1.469926, -3.081096, 1, 0.4196078, 0, 1,
-1.470603, -0.2561676, -1.718411, 1, 0.427451, 0, 1,
-1.468968, -0.5275217, -2.415104, 1, 0.4313726, 0, 1,
-1.458371, -0.5435897, -1.039423, 1, 0.4392157, 0, 1,
-1.450409, -1.806516, -3.286278, 1, 0.4431373, 0, 1,
-1.435583, -2.885071, -2.437439, 1, 0.4509804, 0, 1,
-1.434972, 1.422639, 0.411891, 1, 0.454902, 0, 1,
-1.432581, -0.4860765, -2.375644, 1, 0.4627451, 0, 1,
-1.422469, -0.1762061, -0.9822714, 1, 0.4666667, 0, 1,
-1.42225, -2.922811, -3.34496, 1, 0.4745098, 0, 1,
-1.412228, -0.7341321, -1.272289, 1, 0.4784314, 0, 1,
-1.406468, -0.8094553, -0.3130484, 1, 0.4862745, 0, 1,
-1.403524, -0.2440992, -1.891958, 1, 0.4901961, 0, 1,
-1.397868, -0.4572778, -2.342029, 1, 0.4980392, 0, 1,
-1.396847, -0.7012693, -2.479554, 1, 0.5058824, 0, 1,
-1.392818, -1.372655, -2.903649, 1, 0.509804, 0, 1,
-1.391055, 0.7847667, -1.380293, 1, 0.5176471, 0, 1,
-1.380239, 0.9770502, -0.4217637, 1, 0.5215687, 0, 1,
-1.372958, -0.4152217, -2.047089, 1, 0.5294118, 0, 1,
-1.35511, -0.7482778, -2.648003, 1, 0.5333334, 0, 1,
-1.349877, 2.024262, -0.7636564, 1, 0.5411765, 0, 1,
-1.332749, 1.215644, -2.611431, 1, 0.5450981, 0, 1,
-1.331009, -0.3955558, -1.523032, 1, 0.5529412, 0, 1,
-1.323998, -0.6126868, -2.672721, 1, 0.5568628, 0, 1,
-1.321987, 0.01553905, -2.687652, 1, 0.5647059, 0, 1,
-1.319951, 0.426443, -0.2311869, 1, 0.5686275, 0, 1,
-1.305531, 1.470572, -0.9234631, 1, 0.5764706, 0, 1,
-1.300857, 2.814687, -1.123309, 1, 0.5803922, 0, 1,
-1.292791, 1.138524, 0.07088287, 1, 0.5882353, 0, 1,
-1.290195, -0.7876021, -2.089743, 1, 0.5921569, 0, 1,
-1.283856, 0.7246889, -1.279722, 1, 0.6, 0, 1,
-1.28311, -0.324084, -4.15081, 1, 0.6078432, 0, 1,
-1.279741, 0.1432178, -1.052939, 1, 0.6117647, 0, 1,
-1.273804, -0.9745062, -1.658632, 1, 0.6196079, 0, 1,
-1.269879, -0.6438341, -0.9522513, 1, 0.6235294, 0, 1,
-1.263673, 0.1625975, -0.8948156, 1, 0.6313726, 0, 1,
-1.260935, 0.4323894, -0.8520837, 1, 0.6352941, 0, 1,
-1.257827, -0.3988995, -0.637614, 1, 0.6431373, 0, 1,
-1.256572, 0.7863283, -0.2865053, 1, 0.6470588, 0, 1,
-1.246923, -0.1038406, -1.832185, 1, 0.654902, 0, 1,
-1.221915, 0.7468522, -1.34669, 1, 0.6588235, 0, 1,
-1.218602, 0.4585755, -1.034948, 1, 0.6666667, 0, 1,
-1.218558, 0.3544045, -0.325506, 1, 0.6705883, 0, 1,
-1.217544, -0.1606251, -1.328835, 1, 0.6784314, 0, 1,
-1.213864, -0.7374107, -1.556554, 1, 0.682353, 0, 1,
-1.209098, -1.034203, -2.234134, 1, 0.6901961, 0, 1,
-1.196837, 0.4364245, -0.5908361, 1, 0.6941177, 0, 1,
-1.192397, 0.2535996, -1.944263, 1, 0.7019608, 0, 1,
-1.191901, 0.837602, -3.703653, 1, 0.7098039, 0, 1,
-1.187222, -2.421621, -3.924375, 1, 0.7137255, 0, 1,
-1.177189, -0.07471859, -2.807623, 1, 0.7215686, 0, 1,
-1.175459, -1.082417, -1.657525, 1, 0.7254902, 0, 1,
-1.175429, 0.5595472, -1.490265, 1, 0.7333333, 0, 1,
-1.162511, 0.2877677, -1.46399, 1, 0.7372549, 0, 1,
-1.158863, 0.614378, -0.9066272, 1, 0.7450981, 0, 1,
-1.156991, 2.148367, -0.6296968, 1, 0.7490196, 0, 1,
-1.156038, -1.594208, -3.10791, 1, 0.7568628, 0, 1,
-1.155609, 0.7754616, -1.943492, 1, 0.7607843, 0, 1,
-1.153638, -0.08550762, -2.878587, 1, 0.7686275, 0, 1,
-1.150801, -0.7876531, -2.844629, 1, 0.772549, 0, 1,
-1.149901, -0.04302475, -1.094292, 1, 0.7803922, 0, 1,
-1.148862, 0.5339153, 0.2656952, 1, 0.7843137, 0, 1,
-1.147956, 1.071784, 0.9899822, 1, 0.7921569, 0, 1,
-1.146559, 0.6702099, -1.604917, 1, 0.7960784, 0, 1,
-1.14463, 0.6603023, -1.63252, 1, 0.8039216, 0, 1,
-1.140564, -0.0120124, -2.177981, 1, 0.8117647, 0, 1,
-1.138711, -0.4494635, 0.09358518, 1, 0.8156863, 0, 1,
-1.132025, 0.2344234, 0.08182546, 1, 0.8235294, 0, 1,
-1.123876, -0.3287861, -2.041696, 1, 0.827451, 0, 1,
-1.119986, 0.9521991, -1.099694, 1, 0.8352941, 0, 1,
-1.11099, 0.4018747, -2.708377, 1, 0.8392157, 0, 1,
-1.109043, 1.464315, -0.9998614, 1, 0.8470588, 0, 1,
-1.098843, 0.4471543, -2.119589, 1, 0.8509804, 0, 1,
-1.097991, -0.02172337, -3.120569, 1, 0.8588235, 0, 1,
-1.094445, 0.6808261, -1.877596, 1, 0.8627451, 0, 1,
-1.094181, -0.9231185, -1.788449, 1, 0.8705882, 0, 1,
-1.088112, 0.7064418, -1.337045, 1, 0.8745098, 0, 1,
-1.084519, 0.9846912, 0.7173045, 1, 0.8823529, 0, 1,
-1.077641, 0.90605, -1.391512, 1, 0.8862745, 0, 1,
-1.072726, -0.6221097, 0.05421844, 1, 0.8941177, 0, 1,
-1.072455, -1.425197, -2.436848, 1, 0.8980392, 0, 1,
-1.068471, -0.6048179, -2.2126, 1, 0.9058824, 0, 1,
-1.058328, -0.5670465, -0.9261616, 1, 0.9137255, 0, 1,
-1.05591, 1.582137, -1.129171, 1, 0.9176471, 0, 1,
-1.047861, 1.951359, -2.109764, 1, 0.9254902, 0, 1,
-1.040898, 0.4099019, 0.7349985, 1, 0.9294118, 0, 1,
-1.039682, -1.813989, -2.217775, 1, 0.9372549, 0, 1,
-1.039098, -0.7565367, -3.153122, 1, 0.9411765, 0, 1,
-1.036159, 0.5345752, -2.214877, 1, 0.9490196, 0, 1,
-1.031557, -0.2294616, -1.359705, 1, 0.9529412, 0, 1,
-1.03124, 1.188304, -0.4296682, 1, 0.9607843, 0, 1,
-1.019607, 0.01378831, -2.294322, 1, 0.9647059, 0, 1,
-1.012674, 0.5204475, -1.083248, 1, 0.972549, 0, 1,
-1.009875, 1.32406, 0.5773779, 1, 0.9764706, 0, 1,
-1.00945, -0.8135552, -1.274776, 1, 0.9843137, 0, 1,
-1.002302, -0.03735738, -2.844753, 1, 0.9882353, 0, 1,
-0.9965251, -0.3829686, -2.431211, 1, 0.9960784, 0, 1,
-0.9922212, -0.0792228, -2.555846, 0.9960784, 1, 0, 1,
-0.9903222, -0.5345666, -1.325094, 0.9921569, 1, 0, 1,
-0.9843137, 1.547139, 0.1675027, 0.9843137, 1, 0, 1,
-0.9824479, 0.5419167, -2.534127, 0.9803922, 1, 0, 1,
-0.9752828, 0.5707586, -0.3086664, 0.972549, 1, 0, 1,
-0.9601612, 1.488912, -0.6637589, 0.9686275, 1, 0, 1,
-0.9564474, -0.07826184, -2.736037, 0.9607843, 1, 0, 1,
-0.9527299, 0.4627608, -1.731873, 0.9568627, 1, 0, 1,
-0.9510893, 0.2272735, -2.097261, 0.9490196, 1, 0, 1,
-0.9453716, 2.715299, -1.630068, 0.945098, 1, 0, 1,
-0.9428634, 1.601153, -0.7560809, 0.9372549, 1, 0, 1,
-0.9410936, -0.5071669, -3.756017, 0.9333333, 1, 0, 1,
-0.9362664, 0.3713457, -0.0615509, 0.9254902, 1, 0, 1,
-0.935175, 0.2064023, 0.3578224, 0.9215686, 1, 0, 1,
-0.9350919, 0.1970594, -1.013972, 0.9137255, 1, 0, 1,
-0.9324304, 0.03419154, -0.2075213, 0.9098039, 1, 0, 1,
-0.9316774, -0.2207172, -2.417798, 0.9019608, 1, 0, 1,
-0.9307334, 0.08650275, -0.298383, 0.8941177, 1, 0, 1,
-0.9281201, -1.070753, -2.708436, 0.8901961, 1, 0, 1,
-0.9260864, 1.228305, -0.4768136, 0.8823529, 1, 0, 1,
-0.9249929, -0.4008941, -2.582886, 0.8784314, 1, 0, 1,
-0.9187058, -1.769803, -1.700835, 0.8705882, 1, 0, 1,
-0.9141714, -0.2817335, -2.251538, 0.8666667, 1, 0, 1,
-0.9078667, -0.5190516, -1.937479, 0.8588235, 1, 0, 1,
-0.9011583, -0.3059472, -2.193955, 0.854902, 1, 0, 1,
-0.8925512, 0.8986811, -0.1041247, 0.8470588, 1, 0, 1,
-0.8875856, 1.635783, -1.09593, 0.8431373, 1, 0, 1,
-0.8866658, 0.7074178, -1.289154, 0.8352941, 1, 0, 1,
-0.8775248, -0.1998825, -1.387011, 0.8313726, 1, 0, 1,
-0.8741597, 0.349904, 1.078965, 0.8235294, 1, 0, 1,
-0.8664957, -1.689861, -0.8698129, 0.8196079, 1, 0, 1,
-0.8616431, 0.0521597, -2.831112, 0.8117647, 1, 0, 1,
-0.86108, 0.5631627, -0.7208232, 0.8078431, 1, 0, 1,
-0.8558823, -0.6210505, -2.97692, 0.8, 1, 0, 1,
-0.854174, -1.75936, -1.943643, 0.7921569, 1, 0, 1,
-0.8503295, 2.592057, 1.247221, 0.7882353, 1, 0, 1,
-0.8497918, 0.2527103, -2.166004, 0.7803922, 1, 0, 1,
-0.8464438, 1.081092, -1.470014, 0.7764706, 1, 0, 1,
-0.8335188, -0.1662929, -1.663916, 0.7686275, 1, 0, 1,
-0.8274956, -0.1738264, -1.142561, 0.7647059, 1, 0, 1,
-0.8236956, -0.8095511, -1.77366, 0.7568628, 1, 0, 1,
-0.8226436, 2.03001, -1.094291, 0.7529412, 1, 0, 1,
-0.8197866, 1.054226, -1.523379, 0.7450981, 1, 0, 1,
-0.8177286, -0.3692296, -0.9502558, 0.7411765, 1, 0, 1,
-0.8166824, -1.270762, -3.354035, 0.7333333, 1, 0, 1,
-0.8137305, -0.9414634, -1.681595, 0.7294118, 1, 0, 1,
-0.81055, 0.889048, -1.364176, 0.7215686, 1, 0, 1,
-0.8020192, -0.8926511, -4.225727, 0.7176471, 1, 0, 1,
-0.8017747, -0.373948, -1.224792, 0.7098039, 1, 0, 1,
-0.8007089, -1.472548, -1.594846, 0.7058824, 1, 0, 1,
-0.7916368, -0.6671892, -2.623277, 0.6980392, 1, 0, 1,
-0.7898682, 0.9553042, -1.149839, 0.6901961, 1, 0, 1,
-0.7897645, -0.3633336, -2.192134, 0.6862745, 1, 0, 1,
-0.787645, 0.08683246, -2.736138, 0.6784314, 1, 0, 1,
-0.7864493, 0.06020157, -1.614632, 0.6745098, 1, 0, 1,
-0.7855986, 0.2698278, -3.891988, 0.6666667, 1, 0, 1,
-0.783653, -1.284761, -2.09674, 0.6627451, 1, 0, 1,
-0.7803414, -2.067981, -2.556826, 0.654902, 1, 0, 1,
-0.7747353, 0.2697088, -2.003006, 0.6509804, 1, 0, 1,
-0.774471, 0.3762775, -0.5923564, 0.6431373, 1, 0, 1,
-0.7698998, -0.1678942, -2.26338, 0.6392157, 1, 0, 1,
-0.7672065, -0.4476148, -3.415878, 0.6313726, 1, 0, 1,
-0.7540264, -0.53753, -4.88504, 0.627451, 1, 0, 1,
-0.7497191, 0.3147071, -1.356458, 0.6196079, 1, 0, 1,
-0.74089, -0.1318945, -0.5508336, 0.6156863, 1, 0, 1,
-0.7408685, 0.9818555, -0.9731749, 0.6078432, 1, 0, 1,
-0.7347029, -1.807711, -1.93558, 0.6039216, 1, 0, 1,
-0.7337716, -0.66202, -2.702358, 0.5960785, 1, 0, 1,
-0.7273137, -0.3683463, -4.264359, 0.5882353, 1, 0, 1,
-0.7263191, -1.586406, -2.904197, 0.5843138, 1, 0, 1,
-0.7156796, -0.2664137, -2.248609, 0.5764706, 1, 0, 1,
-0.7126313, -0.9559008, -1.967822, 0.572549, 1, 0, 1,
-0.7046669, -0.1765903, -1.331714, 0.5647059, 1, 0, 1,
-0.704483, 0.2633549, -0.3821152, 0.5607843, 1, 0, 1,
-0.7028038, -0.3860112, -2.349423, 0.5529412, 1, 0, 1,
-0.6993569, -1.910357, -2.851416, 0.5490196, 1, 0, 1,
-0.6985836, 1.305049, -0.6551178, 0.5411765, 1, 0, 1,
-0.6978123, 0.2765364, 0.5685893, 0.5372549, 1, 0, 1,
-0.6901615, 2.008919, -0.276021, 0.5294118, 1, 0, 1,
-0.6867452, 1.836792, -1.094306, 0.5254902, 1, 0, 1,
-0.6850234, -0.9780751, -0.7840688, 0.5176471, 1, 0, 1,
-0.68436, -0.4441191, -2.317763, 0.5137255, 1, 0, 1,
-0.6815716, -0.673294, -2.307141, 0.5058824, 1, 0, 1,
-0.6815171, 0.6211559, -0.7938339, 0.5019608, 1, 0, 1,
-0.6773103, 1.089949, 0.04108542, 0.4941176, 1, 0, 1,
-0.6747147, -0.6902836, -2.056103, 0.4862745, 1, 0, 1,
-0.6672107, 0.4153465, -0.8782146, 0.4823529, 1, 0, 1,
-0.6658707, -1.292693, -1.75694, 0.4745098, 1, 0, 1,
-0.6614622, 1.101743, -0.5546938, 0.4705882, 1, 0, 1,
-0.6577721, 1.091484, -1.81838, 0.4627451, 1, 0, 1,
-0.6572111, 1.743038, -0.4783877, 0.4588235, 1, 0, 1,
-0.6560227, 0.3983838, -0.222859, 0.4509804, 1, 0, 1,
-0.6484632, -0.1771299, -2.022878, 0.4470588, 1, 0, 1,
-0.6481659, 0.08604684, -0.5487195, 0.4392157, 1, 0, 1,
-0.6473157, -0.8475067, -2.679028, 0.4352941, 1, 0, 1,
-0.6443405, 1.900371, 0.9279362, 0.427451, 1, 0, 1,
-0.6439617, 0.5208567, -1.554494, 0.4235294, 1, 0, 1,
-0.6430719, 0.1455542, -1.215226, 0.4156863, 1, 0, 1,
-0.6426291, 0.3729035, -0.9892799, 0.4117647, 1, 0, 1,
-0.6399595, 0.02185591, -0.9134903, 0.4039216, 1, 0, 1,
-0.6341235, 0.6426764, -1.038008, 0.3960784, 1, 0, 1,
-0.6338301, 0.5960773, -0.8650037, 0.3921569, 1, 0, 1,
-0.6327359, 0.614236, -1.793297, 0.3843137, 1, 0, 1,
-0.6313651, -0.2966836, -2.459489, 0.3803922, 1, 0, 1,
-0.62876, -0.826317, -0.6443456, 0.372549, 1, 0, 1,
-0.6272473, 0.0725809, -2.085182, 0.3686275, 1, 0, 1,
-0.6262259, 2.081666, -0.2127247, 0.3607843, 1, 0, 1,
-0.6217726, -1.74682, -3.820149, 0.3568628, 1, 0, 1,
-0.6192414, -1.350797, -3.163356, 0.3490196, 1, 0, 1,
-0.6168553, 0.8005529, -0.965858, 0.345098, 1, 0, 1,
-0.6140489, -0.04635054, -1.476131, 0.3372549, 1, 0, 1,
-0.60295, -0.3217495, -3.406764, 0.3333333, 1, 0, 1,
-0.6015223, -0.6584716, -0.8808345, 0.3254902, 1, 0, 1,
-0.5980797, -0.3689752, -1.574401, 0.3215686, 1, 0, 1,
-0.5970123, -0.9003125, -2.170978, 0.3137255, 1, 0, 1,
-0.5960647, 1.365144, 2.32178, 0.3098039, 1, 0, 1,
-0.5955722, -1.999094, -1.296832, 0.3019608, 1, 0, 1,
-0.5902466, 0.7544634, 1.035378, 0.2941177, 1, 0, 1,
-0.5883455, 1.707367, 0.4121753, 0.2901961, 1, 0, 1,
-0.5876839, -0.6426932, -0.5128388, 0.282353, 1, 0, 1,
-0.5876089, -0.278999, -1.926321, 0.2784314, 1, 0, 1,
-0.5809312, -1.299493, -1.974211, 0.2705882, 1, 0, 1,
-0.5696812, 1.495101, -0.6345452, 0.2666667, 1, 0, 1,
-0.5695817, 1.466521, -1.128335, 0.2588235, 1, 0, 1,
-0.5638682, 0.52171, -0.2288929, 0.254902, 1, 0, 1,
-0.5635331, 0.8414285, -2.125145, 0.2470588, 1, 0, 1,
-0.5614781, -2.290313, -4.074704, 0.2431373, 1, 0, 1,
-0.5587898, 0.3974327, -0.3116772, 0.2352941, 1, 0, 1,
-0.5559161, -0.9106791, -2.623209, 0.2313726, 1, 0, 1,
-0.5548242, -0.1758423, -2.680994, 0.2235294, 1, 0, 1,
-0.5539159, -1.004991, -2.222272, 0.2196078, 1, 0, 1,
-0.5527676, -0.6928571, -1.951844, 0.2117647, 1, 0, 1,
-0.5491581, -0.2790382, -1.545376, 0.2078431, 1, 0, 1,
-0.5386862, -2.609316, -3.428988, 0.2, 1, 0, 1,
-0.5349006, 0.8085088, -0.371424, 0.1921569, 1, 0, 1,
-0.5292348, -0.9696648, -0.3825075, 0.1882353, 1, 0, 1,
-0.5277092, -0.837442, -1.028847, 0.1803922, 1, 0, 1,
-0.5275831, 1.031991, -0.1537427, 0.1764706, 1, 0, 1,
-0.5257013, 0.01521619, -2.361512, 0.1686275, 1, 0, 1,
-0.5243858, -0.2708384, -1.446257, 0.1647059, 1, 0, 1,
-0.5172663, 0.4587339, -1.81607, 0.1568628, 1, 0, 1,
-0.5148366, -0.1799751, -1.788482, 0.1529412, 1, 0, 1,
-0.5134218, -1.118841, -4.064845, 0.145098, 1, 0, 1,
-0.5121118, 1.257474, 1.548636, 0.1411765, 1, 0, 1,
-0.5116965, -0.1242256, -1.261994, 0.1333333, 1, 0, 1,
-0.5082242, 0.5400005, 0.07123529, 0.1294118, 1, 0, 1,
-0.505231, 0.7735894, -0.7671169, 0.1215686, 1, 0, 1,
-0.5038344, -0.6170133, -2.733399, 0.1176471, 1, 0, 1,
-0.501619, -0.3546905, -3.362113, 0.1098039, 1, 0, 1,
-0.5005859, 1.51059, -0.5251207, 0.1058824, 1, 0, 1,
-0.4974634, -0.6849369, -1.871439, 0.09803922, 1, 0, 1,
-0.495285, 0.8595303, -2.693835, 0.09019608, 1, 0, 1,
-0.4939588, 0.111488, -2.389433, 0.08627451, 1, 0, 1,
-0.4930116, 1.450543, -0.840311, 0.07843138, 1, 0, 1,
-0.4854062, -0.9837847, -2.425089, 0.07450981, 1, 0, 1,
-0.4840892, -0.2599353, -1.012583, 0.06666667, 1, 0, 1,
-0.4825727, -0.687657, -0.7391561, 0.0627451, 1, 0, 1,
-0.481953, 0.3558376, -2.009466, 0.05490196, 1, 0, 1,
-0.4797456, -1.419124, -2.033524, 0.05098039, 1, 0, 1,
-0.478955, -1.00355, -3.651447, 0.04313726, 1, 0, 1,
-0.4757458, -0.8069631, -2.561115, 0.03921569, 1, 0, 1,
-0.4745996, -1.286077, -1.689683, 0.03137255, 1, 0, 1,
-0.47408, -0.4824288, -2.535861, 0.02745098, 1, 0, 1,
-0.4684691, 1.401919, -0.4676369, 0.01960784, 1, 0, 1,
-0.4660638, 0.6811417, 0.5512686, 0.01568628, 1, 0, 1,
-0.461947, -1.277885, -2.390241, 0.007843138, 1, 0, 1,
-0.457545, -1.182908, -3.215916, 0.003921569, 1, 0, 1,
-0.4557277, -0.7424729, -2.601994, 0, 1, 0.003921569, 1,
-0.4535362, -0.3164385, -1.712834, 0, 1, 0.01176471, 1,
-0.4441498, 1.136955, 0.9019231, 0, 1, 0.01568628, 1,
-0.4426224, -1.18159, -3.520682, 0, 1, 0.02352941, 1,
-0.4395818, 0.4602422, 0.7986448, 0, 1, 0.02745098, 1,
-0.4394343, -0.03606047, -0.1940852, 0, 1, 0.03529412, 1,
-0.4388704, -1.22365, -2.1292, 0, 1, 0.03921569, 1,
-0.437309, -1.666309, -5.372463, 0, 1, 0.04705882, 1,
-0.4358865, -0.4818457, -1.85388, 0, 1, 0.05098039, 1,
-0.4325694, 1.849824, -0.8227549, 0, 1, 0.05882353, 1,
-0.4325624, 0.2892033, -0.3774342, 0, 1, 0.0627451, 1,
-0.4287823, -0.1675782, -1.654577, 0, 1, 0.07058824, 1,
-0.4247712, -0.3375562, -2.366135, 0, 1, 0.07450981, 1,
-0.4190422, 0.221049, -0.2051048, 0, 1, 0.08235294, 1,
-0.418672, 0.8095375, 0.1934118, 0, 1, 0.08627451, 1,
-0.4143922, 0.22976, 0.3787033, 0, 1, 0.09411765, 1,
-0.4080615, 1.245353, 0.7871639, 0, 1, 0.1019608, 1,
-0.4054468, 0.4382447, -1.00981, 0, 1, 0.1058824, 1,
-0.3976788, 0.2640202, -1.521753, 0, 1, 0.1137255, 1,
-0.3973132, -0.9703459, -1.71868, 0, 1, 0.1176471, 1,
-0.3964662, -1.502143, -3.73273, 0, 1, 0.1254902, 1,
-0.3947704, 0.222578, -2.471435, 0, 1, 0.1294118, 1,
-0.3924867, 1.268373, -0.828432, 0, 1, 0.1372549, 1,
-0.3876403, 0.1162617, -0.1424464, 0, 1, 0.1411765, 1,
-0.3866732, 0.0487525, 0.1285198, 0, 1, 0.1490196, 1,
-0.3796875, -0.461691, -2.254146, 0, 1, 0.1529412, 1,
-0.3781867, -0.08902116, -0.3303116, 0, 1, 0.1607843, 1,
-0.3738869, -0.1394193, -0.6139237, 0, 1, 0.1647059, 1,
-0.3732327, 0.2440839, -2.415802, 0, 1, 0.172549, 1,
-0.3724095, -1.228441, -2.722792, 0, 1, 0.1764706, 1,
-0.3684997, 1.833076, 0.05690438, 0, 1, 0.1843137, 1,
-0.367294, -0.972826, -4.603628, 0, 1, 0.1882353, 1,
-0.3522093, -0.08470733, -2.637921, 0, 1, 0.1960784, 1,
-0.3510436, -1.445803, -2.972689, 0, 1, 0.2039216, 1,
-0.3476958, 0.3805148, -0.5539846, 0, 1, 0.2078431, 1,
-0.3456517, -0.05211695, -1.267225, 0, 1, 0.2156863, 1,
-0.3440922, -0.5290208, -3.902812, 0, 1, 0.2196078, 1,
-0.3391412, 0.2036041, -1.535155, 0, 1, 0.227451, 1,
-0.3384892, -0.1926648, -2.091128, 0, 1, 0.2313726, 1,
-0.337163, -0.2849662, -3.70808, 0, 1, 0.2392157, 1,
-0.336486, -0.8936701, -1.31621, 0, 1, 0.2431373, 1,
-0.3350674, 0.2351856, -2.22914, 0, 1, 0.2509804, 1,
-0.3336681, 0.8680341, -2.552456, 0, 1, 0.254902, 1,
-0.3329634, -1.299843, -1.878015, 0, 1, 0.2627451, 1,
-0.3300674, 0.3394555, -0.9427364, 0, 1, 0.2666667, 1,
-0.3262852, -1.023686, -3.968446, 0, 1, 0.2745098, 1,
-0.3251376, 0.3448003, -1.361698, 0, 1, 0.2784314, 1,
-0.3228565, -0.2003815, -1.992765, 0, 1, 0.2862745, 1,
-0.3208908, -0.9608394, -5.340085, 0, 1, 0.2901961, 1,
-0.316714, 0.05174873, -0.2820395, 0, 1, 0.2980392, 1,
-0.3114301, -1.269039, -2.476835, 0, 1, 0.3058824, 1,
-0.3103427, 0.3185615, -1.007772, 0, 1, 0.3098039, 1,
-0.310286, -0.5287305, -2.115299, 0, 1, 0.3176471, 1,
-0.3033587, 1.110789, 0.5008263, 0, 1, 0.3215686, 1,
-0.3018483, -0.1190143, -1.759998, 0, 1, 0.3294118, 1,
-0.3012118, 0.7366983, -0.6263608, 0, 1, 0.3333333, 1,
-0.2996187, -0.8320913, -1.480126, 0, 1, 0.3411765, 1,
-0.2965825, -0.7336747, -2.488096, 0, 1, 0.345098, 1,
-0.2942378, -1.376768, -3.338237, 0, 1, 0.3529412, 1,
-0.2890637, -0.3080337, -2.276106, 0, 1, 0.3568628, 1,
-0.2854115, 0.1773425, -0.2157115, 0, 1, 0.3647059, 1,
-0.2843575, 0.297324, -0.8809339, 0, 1, 0.3686275, 1,
-0.2808247, 0.6269458, -1.134052, 0, 1, 0.3764706, 1,
-0.2777561, 1.055341, 1.267806, 0, 1, 0.3803922, 1,
-0.2768774, -0.5914484, -2.645998, 0, 1, 0.3882353, 1,
-0.2762672, -1.359727, -4.542333, 0, 1, 0.3921569, 1,
-0.2751582, -0.009005328, -0.7275726, 0, 1, 0.4, 1,
-0.2715146, 0.982142, -1.844905, 0, 1, 0.4078431, 1,
-0.2699373, -2.321441, -4.00489, 0, 1, 0.4117647, 1,
-0.267353, -0.5537204, -3.756844, 0, 1, 0.4196078, 1,
-0.2669424, 0.9647518, 0.115905, 0, 1, 0.4235294, 1,
-0.2659421, 0.06606551, -1.775694, 0, 1, 0.4313726, 1,
-0.264051, 0.2353799, 0.4430954, 0, 1, 0.4352941, 1,
-0.2624187, 0.3963777, -1.018347, 0, 1, 0.4431373, 1,
-0.26129, -0.3018851, -3.596411, 0, 1, 0.4470588, 1,
-0.2612052, 0.4194088, -1.164298, 0, 1, 0.454902, 1,
-0.2580739, -0.4712097, -4.906583, 0, 1, 0.4588235, 1,
-0.2558618, 0.3431835, -0.320687, 0, 1, 0.4666667, 1,
-0.2555594, -0.05196824, -2.211186, 0, 1, 0.4705882, 1,
-0.2509271, -0.1445806, -0.8537112, 0, 1, 0.4784314, 1,
-0.2456846, -1.168694, -4.07393, 0, 1, 0.4823529, 1,
-0.2453058, -1.224751, -3.055412, 0, 1, 0.4901961, 1,
-0.2449714, 0.3943333, -0.8949565, 0, 1, 0.4941176, 1,
-0.2447771, 1.332175, -0.8676931, 0, 1, 0.5019608, 1,
-0.2429807, -0.5322779, -3.319911, 0, 1, 0.509804, 1,
-0.2424559, -1.421499, -2.828259, 0, 1, 0.5137255, 1,
-0.2420549, -1.843782, -1.500114, 0, 1, 0.5215687, 1,
-0.2363266, -1.991685, -4.070906, 0, 1, 0.5254902, 1,
-0.2347006, -1.27698, -2.564806, 0, 1, 0.5333334, 1,
-0.2333768, 0.4144777, -1.035478, 0, 1, 0.5372549, 1,
-0.2305061, 0.8328011, 0.1174346, 0, 1, 0.5450981, 1,
-0.2285547, 1.123203, -2.592427, 0, 1, 0.5490196, 1,
-0.2284603, -1.391273, -4.614176, 0, 1, 0.5568628, 1,
-0.2281058, -0.5724621, -4.732284, 0, 1, 0.5607843, 1,
-0.2141596, 1.323856, -0.02902242, 0, 1, 0.5686275, 1,
-0.2099794, -0.09937784, -0.9072209, 0, 1, 0.572549, 1,
-0.2066539, 1.056562, -0.9685686, 0, 1, 0.5803922, 1,
-0.1988097, -0.54755, -3.3532, 0, 1, 0.5843138, 1,
-0.1886584, -1.039576, -3.737763, 0, 1, 0.5921569, 1,
-0.1870003, 0.6430929, 0.1775509, 0, 1, 0.5960785, 1,
-0.1844963, 1.334931, -1.13943, 0, 1, 0.6039216, 1,
-0.1842971, 0.3744661, -1.718469, 0, 1, 0.6117647, 1,
-0.1839089, 1.68126, 0.8146319, 0, 1, 0.6156863, 1,
-0.1825708, 1.510379, -0.3502961, 0, 1, 0.6235294, 1,
-0.1751308, 0.07958552, -1.914678, 0, 1, 0.627451, 1,
-0.1731758, 0.09044038, -2.358775, 0, 1, 0.6352941, 1,
-0.1723609, 0.3607693, -0.7439997, 0, 1, 0.6392157, 1,
-0.1688291, -0.213538, -2.278611, 0, 1, 0.6470588, 1,
-0.1677172, -0.8718282, -4.594303, 0, 1, 0.6509804, 1,
-0.1651077, -0.08132671, -1.281896, 0, 1, 0.6588235, 1,
-0.1650087, 0.7495998, 0.4634706, 0, 1, 0.6627451, 1,
-0.1627266, -0.7827483, -0.5258349, 0, 1, 0.6705883, 1,
-0.1598096, -0.0249243, -2.497615, 0, 1, 0.6745098, 1,
-0.1545141, 1.618576, -0.3355599, 0, 1, 0.682353, 1,
-0.1544296, -0.1070992, -1.18009, 0, 1, 0.6862745, 1,
-0.1544005, 0.04826496, -1.648735, 0, 1, 0.6941177, 1,
-0.1395496, -0.5067887, -4.418211, 0, 1, 0.7019608, 1,
-0.1359131, -0.1304843, -2.318072, 0, 1, 0.7058824, 1,
-0.1357002, -0.9431759, -1.234463, 0, 1, 0.7137255, 1,
-0.1337138, -1.560923, -1.030594, 0, 1, 0.7176471, 1,
-0.1332485, 0.1906921, -0.380962, 0, 1, 0.7254902, 1,
-0.1330294, -1.661223, -3.404972, 0, 1, 0.7294118, 1,
-0.1290713, -0.475374, -2.876143, 0, 1, 0.7372549, 1,
-0.1239737, 1.820213, -0.9496213, 0, 1, 0.7411765, 1,
-0.1237065, -0.6182191, -4.25626, 0, 1, 0.7490196, 1,
-0.1202682, 0.7258468, 0.9112415, 0, 1, 0.7529412, 1,
-0.1166213, 1.368646, 0.7067431, 0, 1, 0.7607843, 1,
-0.1154325, -1.056507, -4.66181, 0, 1, 0.7647059, 1,
-0.1041096, -1.147407, -3.125326, 0, 1, 0.772549, 1,
-0.09970638, 0.3467537, -1.885424, 0, 1, 0.7764706, 1,
-0.09228405, 1.671284, -0.6499047, 0, 1, 0.7843137, 1,
-0.08663841, -1.135391, -3.610594, 0, 1, 0.7882353, 1,
-0.08326196, 0.1560633, -1.643223, 0, 1, 0.7960784, 1,
-0.08180848, 0.1949631, -0.1264579, 0, 1, 0.8039216, 1,
-0.08170628, -0.02658756, -3.586284, 0, 1, 0.8078431, 1,
-0.07979298, -0.3475244, -1.637116, 0, 1, 0.8156863, 1,
-0.07755819, 0.5481061, 0.3746406, 0, 1, 0.8196079, 1,
-0.07539997, 0.4786298, 0.4179564, 0, 1, 0.827451, 1,
-0.07074508, -0.9121018, -3.800909, 0, 1, 0.8313726, 1,
-0.06948754, -2.169396, -4.058893, 0, 1, 0.8392157, 1,
-0.06644296, -0.7151474, -1.467575, 0, 1, 0.8431373, 1,
-0.06037908, 1.005644, -0.298106, 0, 1, 0.8509804, 1,
-0.05991569, -0.573735, -3.323317, 0, 1, 0.854902, 1,
-0.05856999, 1.113895, 0.1647239, 0, 1, 0.8627451, 1,
-0.05486931, -0.3189631, -3.256478, 0, 1, 0.8666667, 1,
-0.05439133, -1.021345, -3.937983, 0, 1, 0.8745098, 1,
-0.05217912, -0.98815, -4.110004, 0, 1, 0.8784314, 1,
-0.04794647, 0.4244474, 1.753781, 0, 1, 0.8862745, 1,
-0.04777098, 1.486062, -0.6099465, 0, 1, 0.8901961, 1,
-0.0439577, 0.3868161, -0.2629943, 0, 1, 0.8980392, 1,
-0.04371454, 0.2094536, 0.1402938, 0, 1, 0.9058824, 1,
-0.04135212, -0.7118506, -4.149684, 0, 1, 0.9098039, 1,
-0.0394235, -0.2013304, -2.451655, 0, 1, 0.9176471, 1,
-0.03824593, -0.1415739, -3.376504, 0, 1, 0.9215686, 1,
-0.03639807, 1.237347, 0.6685235, 0, 1, 0.9294118, 1,
-0.03269889, -0.7513517, -2.249412, 0, 1, 0.9333333, 1,
-0.03079827, 0.6598663, 1.311952, 0, 1, 0.9411765, 1,
-0.02916159, -0.4854424, -4.488482, 0, 1, 0.945098, 1,
-0.02744776, 1.574032, -0.4592425, 0, 1, 0.9529412, 1,
-0.02636517, -0.9141056, -4.549972, 0, 1, 0.9568627, 1,
-0.02060537, 1.741067, -2.349766, 0, 1, 0.9647059, 1,
-0.01616681, -0.5266137, -3.841884, 0, 1, 0.9686275, 1,
-0.01571923, 0.2618759, -0.2219853, 0, 1, 0.9764706, 1,
-0.01329417, 0.6305469, -0.6445885, 0, 1, 0.9803922, 1,
-0.003881123, -1.254185, -2.274467, 0, 1, 0.9882353, 1,
-0.003058621, -0.9411309, -4.343626, 0, 1, 0.9921569, 1,
-0.001807218, -0.2059678, -1.741444, 0, 1, 1, 1,
-0.001381528, 0.911218, -0.2974242, 0, 0.9921569, 1, 1,
0.0003313533, -0.6793842, 2.253989, 0, 0.9882353, 1, 1,
0.00092898, -0.7518259, 3.645497, 0, 0.9803922, 1, 1,
0.001111586, -0.6683767, 1.779938, 0, 0.9764706, 1, 1,
0.005560771, 1.618089, 0.377168, 0, 0.9686275, 1, 1,
0.006463382, 0.3092111, 0.8477504, 0, 0.9647059, 1, 1,
0.007513954, 0.7195024, -0.2185322, 0, 0.9568627, 1, 1,
0.009398784, -0.1807976, 0.84169, 0, 0.9529412, 1, 1,
0.009974879, 0.1444186, -0.370723, 0, 0.945098, 1, 1,
0.01024411, 0.3544945, -0.6020111, 0, 0.9411765, 1, 1,
0.01107441, 0.454412, -0.1560837, 0, 0.9333333, 1, 1,
0.01708046, 0.1622311, -0.1313229, 0, 0.9294118, 1, 1,
0.01811873, -0.3700572, 2.055749, 0, 0.9215686, 1, 1,
0.0184682, 0.1190887, 1.139935, 0, 0.9176471, 1, 1,
0.02712325, 0.06343387, 2.093928, 0, 0.9098039, 1, 1,
0.03122434, -0.6250539, 3.850055, 0, 0.9058824, 1, 1,
0.03869029, -0.2972426, 2.511162, 0, 0.8980392, 1, 1,
0.03927273, 0.8858788, 1.240862, 0, 0.8901961, 1, 1,
0.03998004, 0.07446523, 0.4312003, 0, 0.8862745, 1, 1,
0.04155375, 0.231047, 2.417627, 0, 0.8784314, 1, 1,
0.04428625, -0.01548507, 2.525981, 0, 0.8745098, 1, 1,
0.04691247, 0.1961895, 0.5480802, 0, 0.8666667, 1, 1,
0.04724813, -0.1615822, 2.846547, 0, 0.8627451, 1, 1,
0.05593762, 0.5363628, -0.4327179, 0, 0.854902, 1, 1,
0.06008305, -1.596676, 2.08927, 0, 0.8509804, 1, 1,
0.06258575, -2.403481, 3.026629, 0, 0.8431373, 1, 1,
0.0691338, -0.223453, 2.141219, 0, 0.8392157, 1, 1,
0.07003874, 0.6163338, -1.138471, 0, 0.8313726, 1, 1,
0.07285018, -0.6586829, 3.071309, 0, 0.827451, 1, 1,
0.07608201, 1.314906, 0.3509458, 0, 0.8196079, 1, 1,
0.08157537, 0.7012143, 0.6826043, 0, 0.8156863, 1, 1,
0.08265925, 1.051816, -0.7398204, 0, 0.8078431, 1, 1,
0.08639804, -2.264441, 3.738795, 0, 0.8039216, 1, 1,
0.08806989, -1.816292, 3.414726, 0, 0.7960784, 1, 1,
0.08891749, -1.778332, 3.6128, 0, 0.7882353, 1, 1,
0.08909849, -2.030795, 3.004737, 0, 0.7843137, 1, 1,
0.0908215, -1.079053, 2.956262, 0, 0.7764706, 1, 1,
0.09517302, -0.9892052, 3.165123, 0, 0.772549, 1, 1,
0.09680653, -0.2299746, 2.705351, 0, 0.7647059, 1, 1,
0.1021668, -0.5492914, 2.563588, 0, 0.7607843, 1, 1,
0.1030338, 0.7268681, -0.1684134, 0, 0.7529412, 1, 1,
0.1066995, -0.3541177, 1.664662, 0, 0.7490196, 1, 1,
0.1084756, -0.4004505, -0.344165, 0, 0.7411765, 1, 1,
0.1144501, -1.044411, 3.84565, 0, 0.7372549, 1, 1,
0.1187267, -0.3550256, 2.437765, 0, 0.7294118, 1, 1,
0.1235099, 1.209077, -0.7037107, 0, 0.7254902, 1, 1,
0.123618, -1.137617, 4.069818, 0, 0.7176471, 1, 1,
0.1255643, -0.616442, 2.512377, 0, 0.7137255, 1, 1,
0.1281298, -1.023657, 3.231372, 0, 0.7058824, 1, 1,
0.1361485, 0.4813971, 0.516148, 0, 0.6980392, 1, 1,
0.1363318, 0.04193602, -0.2816851, 0, 0.6941177, 1, 1,
0.1367798, -0.1987777, 3.901124, 0, 0.6862745, 1, 1,
0.137385, -1.383153, 2.312983, 0, 0.682353, 1, 1,
0.1376726, -0.1629414, 1.866938, 0, 0.6745098, 1, 1,
0.1421061, 0.6359344, -1.608798, 0, 0.6705883, 1, 1,
0.1543597, 1.500873, 0.3695306, 0, 0.6627451, 1, 1,
0.1578625, -0.7095463, 4.306393, 0, 0.6588235, 1, 1,
0.1623239, 1.877276, -0.7742929, 0, 0.6509804, 1, 1,
0.1641205, -0.5070463, 3.660967, 0, 0.6470588, 1, 1,
0.1667556, 0.8882627, -1.14533, 0, 0.6392157, 1, 1,
0.1674178, -0.4634745, 4.414449, 0, 0.6352941, 1, 1,
0.1681557, -0.3969236, 3.96776, 0, 0.627451, 1, 1,
0.1702653, -0.02469604, 2.768085, 0, 0.6235294, 1, 1,
0.1706485, -0.8240318, 2.369022, 0, 0.6156863, 1, 1,
0.1769348, -0.4340789, 1.294953, 0, 0.6117647, 1, 1,
0.1807345, 0.006173306, 1.569109, 0, 0.6039216, 1, 1,
0.1827195, -0.6591922, 1.913949, 0, 0.5960785, 1, 1,
0.1847793, 1.485798, 0.3061831, 0, 0.5921569, 1, 1,
0.1851738, 0.6392562, -1.162312, 0, 0.5843138, 1, 1,
0.1910794, 0.7428924, 2.830345, 0, 0.5803922, 1, 1,
0.1930506, 1.405365, 0.6457717, 0, 0.572549, 1, 1,
0.1980744, -0.03976971, 1.02473, 0, 0.5686275, 1, 1,
0.1983438, 0.8466091, 1.096056, 0, 0.5607843, 1, 1,
0.2056032, 0.1004823, -1.421401, 0, 0.5568628, 1, 1,
0.2084688, 0.1689698, 2.325904, 0, 0.5490196, 1, 1,
0.2103658, 0.2149909, 0.01155526, 0, 0.5450981, 1, 1,
0.211171, 2.364321, 0.7472413, 0, 0.5372549, 1, 1,
0.2120395, -0.3202454, 2.420264, 0, 0.5333334, 1, 1,
0.2142936, 0.1742604, -0.4547217, 0, 0.5254902, 1, 1,
0.2183022, 0.7769978, -1.215697, 0, 0.5215687, 1, 1,
0.2183337, -1.19763, 1.415253, 0, 0.5137255, 1, 1,
0.2184226, -0.06191565, -0.4402764, 0, 0.509804, 1, 1,
0.2201542, -0.05807676, 1.068253, 0, 0.5019608, 1, 1,
0.2435577, -1.887602, 3.958039, 0, 0.4941176, 1, 1,
0.2467302, -0.1058822, 2.857731, 0, 0.4901961, 1, 1,
0.2474695, -0.5891672, 1.674987, 0, 0.4823529, 1, 1,
0.2487566, -1.209324, 2.145682, 0, 0.4784314, 1, 1,
0.2559178, 0.148338, -0.2317653, 0, 0.4705882, 1, 1,
0.2577809, -0.3176596, 1.214132, 0, 0.4666667, 1, 1,
0.2601149, -0.6260513, 1.596409, 0, 0.4588235, 1, 1,
0.2631511, 0.933172, 1.287128, 0, 0.454902, 1, 1,
0.26329, 2.109543, 1.137417, 0, 0.4470588, 1, 1,
0.2639169, -3.566898, 2.400433, 0, 0.4431373, 1, 1,
0.2770602, 0.03410235, 1.483279, 0, 0.4352941, 1, 1,
0.2793449, -0.6777076, 3.671531, 0, 0.4313726, 1, 1,
0.2816287, 0.3914346, -1.166231, 0, 0.4235294, 1, 1,
0.2823853, 0.1650175, 1.333513, 0, 0.4196078, 1, 1,
0.2861494, -1.804769, 4.250522, 0, 0.4117647, 1, 1,
0.2873446, 0.122397, 0.9045409, 0, 0.4078431, 1, 1,
0.2980784, 0.5260058, 1.121613, 0, 0.4, 1, 1,
0.3037969, -1.654508, 4.265712, 0, 0.3921569, 1, 1,
0.3068308, 0.1465236, 1.670071, 0, 0.3882353, 1, 1,
0.3101774, 0.6486674, 1.63923, 0, 0.3803922, 1, 1,
0.3101863, -0.5450538, 3.203888, 0, 0.3764706, 1, 1,
0.3160561, 0.03871227, 0.9164194, 0, 0.3686275, 1, 1,
0.3212225, -1.27433, 2.899212, 0, 0.3647059, 1, 1,
0.3257131, -0.2232286, 3.138835, 0, 0.3568628, 1, 1,
0.3293127, 1.423584, 0.3266315, 0, 0.3529412, 1, 1,
0.3294857, 0.6951201, -0.3577783, 0, 0.345098, 1, 1,
0.3372487, 0.1741142, 1.532482, 0, 0.3411765, 1, 1,
0.3404786, -1.237425, 4.457361, 0, 0.3333333, 1, 1,
0.3427339, 1.22477, -0.722248, 0, 0.3294118, 1, 1,
0.3435876, -1.562996, 2.092941, 0, 0.3215686, 1, 1,
0.3448313, -0.5569404, 3.564281, 0, 0.3176471, 1, 1,
0.3466034, 0.5199352, -0.09507834, 0, 0.3098039, 1, 1,
0.350767, 0.2889217, 0.02312838, 0, 0.3058824, 1, 1,
0.3557552, 0.5132264, 0.0374833, 0, 0.2980392, 1, 1,
0.3596463, -0.8783079, 1.431403, 0, 0.2901961, 1, 1,
0.3608273, 0.2205644, 1.178325, 0, 0.2862745, 1, 1,
0.361152, -1.380212, 3.373812, 0, 0.2784314, 1, 1,
0.3673479, -0.8371219, 2.231965, 0, 0.2745098, 1, 1,
0.3676902, -0.6151133, 3.147122, 0, 0.2666667, 1, 1,
0.3743261, -0.9633576, 0.8090652, 0, 0.2627451, 1, 1,
0.3758353, -0.8693552, 2.680486, 0, 0.254902, 1, 1,
0.3820105, -0.1404108, 0.6732652, 0, 0.2509804, 1, 1,
0.3843718, 0.1190115, 1.300461, 0, 0.2431373, 1, 1,
0.384391, 1.459133, -0.5714573, 0, 0.2392157, 1, 1,
0.3850041, -1.673837, 2.778254, 0, 0.2313726, 1, 1,
0.3854602, 0.8126278, 0.3027964, 0, 0.227451, 1, 1,
0.3878562, -0.06555574, 1.891424, 0, 0.2196078, 1, 1,
0.3887438, 1.166153, 0.1905696, 0, 0.2156863, 1, 1,
0.3892149, 0.3140279, -0.5788529, 0, 0.2078431, 1, 1,
0.3904795, 0.6732181, 0.6368321, 0, 0.2039216, 1, 1,
0.3910254, 0.3133972, 1.304707, 0, 0.1960784, 1, 1,
0.3928878, 0.08044378, 2.220915, 0, 0.1882353, 1, 1,
0.3939614, -2.34217, 2.375674, 0, 0.1843137, 1, 1,
0.3976909, 1.899075, 0.5384268, 0, 0.1764706, 1, 1,
0.3986242, 0.0142463, 0.4417159, 0, 0.172549, 1, 1,
0.399517, 0.007212235, 0.04815586, 0, 0.1647059, 1, 1,
0.4001738, 0.1044434, 0.5159355, 0, 0.1607843, 1, 1,
0.4018413, -0.9050611, 1.194353, 0, 0.1529412, 1, 1,
0.4078404, -0.1881321, 2.693778, 0, 0.1490196, 1, 1,
0.4100945, -0.3893082, 1.890876, 0, 0.1411765, 1, 1,
0.413933, -0.9519199, 2.317627, 0, 0.1372549, 1, 1,
0.4150053, -0.6013392, 2.881274, 0, 0.1294118, 1, 1,
0.4154585, 1.394249, -1.169626, 0, 0.1254902, 1, 1,
0.4161362, -0.1484224, 1.267289, 0, 0.1176471, 1, 1,
0.4186626, 1.237388, -0.2796673, 0, 0.1137255, 1, 1,
0.4259073, -0.06275669, 2.186285, 0, 0.1058824, 1, 1,
0.4293745, 0.5315584, -0.1758622, 0, 0.09803922, 1, 1,
0.4323067, -0.9090796, 3.776917, 0, 0.09411765, 1, 1,
0.4330072, -0.8683866, 2.338844, 0, 0.08627451, 1, 1,
0.4370072, -0.713657, 2.318689, 0, 0.08235294, 1, 1,
0.4381873, -0.9608272, 3.802355, 0, 0.07450981, 1, 1,
0.4382764, 0.136726, 0.4589204, 0, 0.07058824, 1, 1,
0.4382903, -0.4364967, 2.793218, 0, 0.0627451, 1, 1,
0.4390246, 0.1061585, 1.104494, 0, 0.05882353, 1, 1,
0.4394525, -0.7395906, 2.360199, 0, 0.05098039, 1, 1,
0.4405271, 3.123675, 1.508041, 0, 0.04705882, 1, 1,
0.4405837, 1.178971, 0.1120639, 0, 0.03921569, 1, 1,
0.443517, 0.05932284, -0.672982, 0, 0.03529412, 1, 1,
0.4449746, 0.7697962, -0.0948026, 0, 0.02745098, 1, 1,
0.4454143, 0.779132, 1.553986, 0, 0.02352941, 1, 1,
0.4478107, -0.6552535, 3.109726, 0, 0.01568628, 1, 1,
0.4494491, 1.322356, 0.0823746, 0, 0.01176471, 1, 1,
0.4577562, -0.6234573, 1.784058, 0, 0.003921569, 1, 1,
0.4597653, -0.6055072, 2.669548, 0.003921569, 0, 1, 1,
0.464996, 0.002828165, 4.184989, 0.007843138, 0, 1, 1,
0.4659162, 0.1603587, 1.128288, 0.01568628, 0, 1, 1,
0.4680078, -1.317143, 3.208697, 0.01960784, 0, 1, 1,
0.4692638, 0.9122785, 1.239648, 0.02745098, 0, 1, 1,
0.4710837, -0.5536932, 2.639432, 0.03137255, 0, 1, 1,
0.4752689, 0.8898608, 0.8564055, 0.03921569, 0, 1, 1,
0.4825403, -0.5886528, 3.245095, 0.04313726, 0, 1, 1,
0.4847583, 0.6487863, 1.373113, 0.05098039, 0, 1, 1,
0.4867951, -1.341575, 2.93298, 0.05490196, 0, 1, 1,
0.4876004, -0.4480734, 3.352266, 0.0627451, 0, 1, 1,
0.488947, -0.990178, 1.380978, 0.06666667, 0, 1, 1,
0.4892397, -0.7682394, 4.191793, 0.07450981, 0, 1, 1,
0.4908533, 1.532362, 0.9789626, 0.07843138, 0, 1, 1,
0.4919111, 0.09381307, 0.5427057, 0.08627451, 0, 1, 1,
0.4966074, -1.087861, 2.574468, 0.09019608, 0, 1, 1,
0.5110942, 0.08761451, 1.535501, 0.09803922, 0, 1, 1,
0.514761, -1.517891, 2.660156, 0.1058824, 0, 1, 1,
0.5165218, -0.6596586, 2.856056, 0.1098039, 0, 1, 1,
0.5166988, 1.788845, -1.079359, 0.1176471, 0, 1, 1,
0.5167681, 1.383021, -0.1244605, 0.1215686, 0, 1, 1,
0.5178639, -0.7867542, 2.114518, 0.1294118, 0, 1, 1,
0.5178661, 0.9321313, 2.863172, 0.1333333, 0, 1, 1,
0.5184016, -0.5663313, 4.132274, 0.1411765, 0, 1, 1,
0.5201327, -1.886543, 4.463074, 0.145098, 0, 1, 1,
0.5250522, -0.8030596, 3.504221, 0.1529412, 0, 1, 1,
0.5261754, 1.799379, 0.5002303, 0.1568628, 0, 1, 1,
0.5262946, -0.7339035, 3.44986, 0.1647059, 0, 1, 1,
0.5267329, 1.701392, 0.7278879, 0.1686275, 0, 1, 1,
0.527899, -0.06620951, 2.789766, 0.1764706, 0, 1, 1,
0.5282248, -0.8582074, 1.388621, 0.1803922, 0, 1, 1,
0.5334214, -0.5143405, 1.667434, 0.1882353, 0, 1, 1,
0.5379084, 1.71779, 1.225678, 0.1921569, 0, 1, 1,
0.5395229, -0.981428, 3.084025, 0.2, 0, 1, 1,
0.5403545, -1.348837, 3.879478, 0.2078431, 0, 1, 1,
0.5414744, 0.2831404, 2.261438, 0.2117647, 0, 1, 1,
0.5420886, 1.432579, 1.132733, 0.2196078, 0, 1, 1,
0.5442404, -0.7201384, 0.7226977, 0.2235294, 0, 1, 1,
0.5445381, 0.5731245, 1.632799, 0.2313726, 0, 1, 1,
0.5473863, 0.2618991, 1.57638, 0.2352941, 0, 1, 1,
0.5630826, -0.1891415, 2.500932, 0.2431373, 0, 1, 1,
0.5652648, -0.3943801, 0.4279551, 0.2470588, 0, 1, 1,
0.565354, 0.9937851, 0.8134155, 0.254902, 0, 1, 1,
0.5684781, 0.4350563, 1.148281, 0.2588235, 0, 1, 1,
0.5687966, 0.2527065, -0.6695812, 0.2666667, 0, 1, 1,
0.5738272, 0.5146297, 1.520396, 0.2705882, 0, 1, 1,
0.5750564, 0.02419877, 0.3488005, 0.2784314, 0, 1, 1,
0.5751878, -0.8332894, 3.361042, 0.282353, 0, 1, 1,
0.5768218, -1.041726, 2.557636, 0.2901961, 0, 1, 1,
0.5792898, -1.705885, 0.8591833, 0.2941177, 0, 1, 1,
0.5856386, -0.7483239, 1.361394, 0.3019608, 0, 1, 1,
0.5861218, 0.5430825, 0.4538116, 0.3098039, 0, 1, 1,
0.5863128, 0.2738063, 0.3097002, 0.3137255, 0, 1, 1,
0.5930026, -1.829951, 2.108867, 0.3215686, 0, 1, 1,
0.594056, 0.3511164, 1.289713, 0.3254902, 0, 1, 1,
0.5989965, 1.009925, 0.4104593, 0.3333333, 0, 1, 1,
0.5992716, -1.498963, 1.758466, 0.3372549, 0, 1, 1,
0.6000319, 0.9302082, 3.195266, 0.345098, 0, 1, 1,
0.6017174, 0.3091729, 0.9385238, 0.3490196, 0, 1, 1,
0.6044673, 0.7175739, 1.834065, 0.3568628, 0, 1, 1,
0.6095177, 0.03073999, 0.3378104, 0.3607843, 0, 1, 1,
0.6106744, -0.7685794, 3.058952, 0.3686275, 0, 1, 1,
0.6106785, 1.914194, -1.10387, 0.372549, 0, 1, 1,
0.6109192, 1.973069, 0.7251749, 0.3803922, 0, 1, 1,
0.6136658, 0.5093469, 0.1338441, 0.3843137, 0, 1, 1,
0.6177893, 0.5740027, 0.08375718, 0.3921569, 0, 1, 1,
0.6184561, 0.3282467, 0.3720303, 0.3960784, 0, 1, 1,
0.6186511, 2.215881, 0.01897501, 0.4039216, 0, 1, 1,
0.6269648, 0.2248176, 2.493961, 0.4117647, 0, 1, 1,
0.6315243, 0.8842593, 0.4809563, 0.4156863, 0, 1, 1,
0.646112, 0.4915563, 0.9056123, 0.4235294, 0, 1, 1,
0.6498522, -1.516411, 2.457758, 0.427451, 0, 1, 1,
0.6523978, 0.4581121, 0.9280788, 0.4352941, 0, 1, 1,
0.6535214, 0.3822568, -1.125999, 0.4392157, 0, 1, 1,
0.6541116, -0.9632794, 2.617451, 0.4470588, 0, 1, 1,
0.65635, -0.3508142, 1.236237, 0.4509804, 0, 1, 1,
0.6567459, -0.04788832, 0.2203067, 0.4588235, 0, 1, 1,
0.6653432, 1.008176, 3.064756, 0.4627451, 0, 1, 1,
0.6690896, -0.5707162, 2.874285, 0.4705882, 0, 1, 1,
0.6720509, 0.7936571, 0.7897335, 0.4745098, 0, 1, 1,
0.6732714, 0.7453277, 1.582679, 0.4823529, 0, 1, 1,
0.6744209, -0.7607185, -0.1603096, 0.4862745, 0, 1, 1,
0.6808239, 0.2211234, 2.381314, 0.4941176, 0, 1, 1,
0.6858515, -0.2750127, 2.277396, 0.5019608, 0, 1, 1,
0.6923671, -0.3981045, 2.765154, 0.5058824, 0, 1, 1,
0.7006953, -1.53193, 3.676414, 0.5137255, 0, 1, 1,
0.7034408, -0.2812007, 0.5184687, 0.5176471, 0, 1, 1,
0.7038323, -0.3451897, 0.8958654, 0.5254902, 0, 1, 1,
0.7081875, 2.0861, -0.8362548, 0.5294118, 0, 1, 1,
0.7098585, -0.1378297, 2.953962, 0.5372549, 0, 1, 1,
0.7127833, 1.417443, 0.9834784, 0.5411765, 0, 1, 1,
0.7177218, -0.7095513, 2.247618, 0.5490196, 0, 1, 1,
0.7195207, 1.098005, 1.876923, 0.5529412, 0, 1, 1,
0.721528, 0.7779422, -1.74128, 0.5607843, 0, 1, 1,
0.723036, -0.9207871, 3.601322, 0.5647059, 0, 1, 1,
0.7276324, -0.3805704, 4.089621, 0.572549, 0, 1, 1,
0.7282463, 0.422541, 0.5167462, 0.5764706, 0, 1, 1,
0.7292916, 0.6549579, -0.7951888, 0.5843138, 0, 1, 1,
0.7305397, -0.1371851, 0.9568565, 0.5882353, 0, 1, 1,
0.7342263, 0.7757402, 0.5075673, 0.5960785, 0, 1, 1,
0.738066, 1.501987, 0.2778346, 0.6039216, 0, 1, 1,
0.7444557, -0.9010192, 1.430584, 0.6078432, 0, 1, 1,
0.7503668, 1.462106, 0.1863531, 0.6156863, 0, 1, 1,
0.7515453, 0.6308014, -0.1346729, 0.6196079, 0, 1, 1,
0.7579203, 1.350181, 0.4049155, 0.627451, 0, 1, 1,
0.7622238, -0.6917923, 2.192585, 0.6313726, 0, 1, 1,
0.7651832, 0.3861616, 2.644886, 0.6392157, 0, 1, 1,
0.7683335, -0.7622542, 1.091427, 0.6431373, 0, 1, 1,
0.7734887, 1.053835, 0.0342853, 0.6509804, 0, 1, 1,
0.7741514, -0.9652021, 3.177186, 0.654902, 0, 1, 1,
0.7743679, -1.422221, 3.879103, 0.6627451, 0, 1, 1,
0.7746207, 1.84799, -0.486353, 0.6666667, 0, 1, 1,
0.7782691, -0.6632633, 2.632686, 0.6745098, 0, 1, 1,
0.7788182, 0.3447018, 2.114224, 0.6784314, 0, 1, 1,
0.7807202, 1.543981, -0.1578816, 0.6862745, 0, 1, 1,
0.7820025, 0.7614383, 1.400874, 0.6901961, 0, 1, 1,
0.783804, -0.6275327, 1.768482, 0.6980392, 0, 1, 1,
0.7840013, 0.9635053, -0.06810291, 0.7058824, 0, 1, 1,
0.7841398, 0.6420754, 1.913239, 0.7098039, 0, 1, 1,
0.7872031, 0.3211237, 0.8676829, 0.7176471, 0, 1, 1,
0.7873033, 1.217862, -0.8477705, 0.7215686, 0, 1, 1,
0.7894178, 0.9693326, 0.1455983, 0.7294118, 0, 1, 1,
0.7911144, -0.8769615, 0.6004963, 0.7333333, 0, 1, 1,
0.7986497, -0.3937401, 3.407672, 0.7411765, 0, 1, 1,
0.8092759, -0.3211497, 2.300644, 0.7450981, 0, 1, 1,
0.8092897, -0.2106827, 0.9752097, 0.7529412, 0, 1, 1,
0.8141144, 0.7001117, 2.095294, 0.7568628, 0, 1, 1,
0.815839, -0.1982905, 1.567319, 0.7647059, 0, 1, 1,
0.8172239, 2.697123, 2.379669, 0.7686275, 0, 1, 1,
0.8190516, 1.127841, 1.080612, 0.7764706, 0, 1, 1,
0.8195503, -0.671527, 0.8945256, 0.7803922, 0, 1, 1,
0.8264093, 2.054286, -0.07173799, 0.7882353, 0, 1, 1,
0.8296069, -0.6309478, 3.510564, 0.7921569, 0, 1, 1,
0.830511, -0.293898, 2.184384, 0.8, 0, 1, 1,
0.8356601, -0.9098222, 2.897237, 0.8078431, 0, 1, 1,
0.8417783, -0.4388253, 2.255395, 0.8117647, 0, 1, 1,
0.8466551, 0.4721708, 0.5452491, 0.8196079, 0, 1, 1,
0.8517197, -0.2508444, 1.363889, 0.8235294, 0, 1, 1,
0.8543277, 1.779525, 2.091046, 0.8313726, 0, 1, 1,
0.8550031, 0.2139551, 1.443597, 0.8352941, 0, 1, 1,
0.8562382, -1.093444, 1.211764, 0.8431373, 0, 1, 1,
0.8624736, 0.5460764, 2.298561, 0.8470588, 0, 1, 1,
0.8748781, -0.0271674, 2.788385, 0.854902, 0, 1, 1,
0.8774171, -0.4774266, 2.853119, 0.8588235, 0, 1, 1,
0.8786438, 0.8759931, 0.6355851, 0.8666667, 0, 1, 1,
0.8823017, -0.07643294, 2.217659, 0.8705882, 0, 1, 1,
0.8927768, 0.8779048, 1.553353, 0.8784314, 0, 1, 1,
0.8928322, 0.1537623, 1.788973, 0.8823529, 0, 1, 1,
0.8936399, -0.03689407, -0.8308954, 0.8901961, 0, 1, 1,
0.8960685, -0.7689182, 1.311074, 0.8941177, 0, 1, 1,
0.8971202, 0.7359461, 0.7923662, 0.9019608, 0, 1, 1,
0.8988875, 1.064065, 1.77654, 0.9098039, 0, 1, 1,
0.9081563, -1.316428, 1.500806, 0.9137255, 0, 1, 1,
0.9169829, 1.184449, 1.215098, 0.9215686, 0, 1, 1,
0.9222084, 0.6938938, 2.482445, 0.9254902, 0, 1, 1,
0.9263282, -0.174555, 2.048353, 0.9333333, 0, 1, 1,
0.9361611, 1.060538, -1.10034, 0.9372549, 0, 1, 1,
0.936913, 1.572657, -1.288292, 0.945098, 0, 1, 1,
0.9391062, 1.317908, 0.5832817, 0.9490196, 0, 1, 1,
0.942634, 1.490218, 0.806564, 0.9568627, 0, 1, 1,
0.9463165, 0.3741758, 0.2016868, 0.9607843, 0, 1, 1,
0.9585112, 0.2571751, 0.9157137, 0.9686275, 0, 1, 1,
0.9635903, -2.115246, 1.983608, 0.972549, 0, 1, 1,
0.9641702, -1.851413, 1.250457, 0.9803922, 0, 1, 1,
0.9685288, -0.9519416, 0.4340173, 0.9843137, 0, 1, 1,
0.9731124, 1.311162, 1.178408, 0.9921569, 0, 1, 1,
0.9743231, 1.024906, 1.843071, 0.9960784, 0, 1, 1,
0.9864267, -0.2058154, 1.733525, 1, 0, 0.9960784, 1,
0.9922436, -2.468961, 1.227751, 1, 0, 0.9882353, 1,
0.9949957, 0.5355083, 2.518719, 1, 0, 0.9843137, 1,
0.9955291, -0.7990614, 1.686327, 1, 0, 0.9764706, 1,
0.9967523, 0.239884, 0.9531637, 1, 0, 0.972549, 1,
1.000641, -1.168118, 2.702543, 1, 0, 0.9647059, 1,
1.001056, 1.41304, -0.9065207, 1, 0, 0.9607843, 1,
1.001242, 0.7939062, -0.3106188, 1, 0, 0.9529412, 1,
1.003568, -0.6981953, 1.516986, 1, 0, 0.9490196, 1,
1.00891, 0.3090196, 2.469235, 1, 0, 0.9411765, 1,
1.012153, 0.4316337, 0.7286257, 1, 0, 0.9372549, 1,
1.014717, -0.8694193, 3.783067, 1, 0, 0.9294118, 1,
1.018378, 1.176472, 0.05334638, 1, 0, 0.9254902, 1,
1.021649, -1.721249, 2.643157, 1, 0, 0.9176471, 1,
1.034638, -0.9841741, 2.258059, 1, 0, 0.9137255, 1,
1.037162, -0.3309136, 3.737197, 1, 0, 0.9058824, 1,
1.037879, 0.6434135, 0.3150807, 1, 0, 0.9019608, 1,
1.041462, 0.06480552, 2.252419, 1, 0, 0.8941177, 1,
1.04364, -1.360483, 2.55658, 1, 0, 0.8862745, 1,
1.050586, -0.7727903, 1.943207, 1, 0, 0.8823529, 1,
1.052079, 2.124535, 0.9894792, 1, 0, 0.8745098, 1,
1.057552, 0.6238514, 3.05997, 1, 0, 0.8705882, 1,
1.076829, 0.4611327, 1.190252, 1, 0, 0.8627451, 1,
1.07967, -0.7179472, 2.779111, 1, 0, 0.8588235, 1,
1.080759, 1.512216, 0.03304467, 1, 0, 0.8509804, 1,
1.083479, -0.662834, 1.003157, 1, 0, 0.8470588, 1,
1.091396, -0.5932609, 2.439413, 1, 0, 0.8392157, 1,
1.098338, 1.394769, 0.8138998, 1, 0, 0.8352941, 1,
1.106673, -0.1202384, 1.722126, 1, 0, 0.827451, 1,
1.109357, -0.3834673, 2.837357, 1, 0, 0.8235294, 1,
1.113213, 1.627288, 0.4939216, 1, 0, 0.8156863, 1,
1.114728, -0.4994113, 0.7372242, 1, 0, 0.8117647, 1,
1.115877, -0.09675134, 1.609105, 1, 0, 0.8039216, 1,
1.117044, -0.2703663, 1.943763, 1, 0, 0.7960784, 1,
1.121103, 1.633753, 2.231645, 1, 0, 0.7921569, 1,
1.145514, -0.8012884, 2.783471, 1, 0, 0.7843137, 1,
1.158554, -0.05982551, 1.755165, 1, 0, 0.7803922, 1,
1.162663, 0.4586759, 3.015566, 1, 0, 0.772549, 1,
1.164024, 1.57419, 1.080027, 1, 0, 0.7686275, 1,
1.165535, -1.183701, 2.378147, 1, 0, 0.7607843, 1,
1.1676, -0.3563118, 2.483588, 1, 0, 0.7568628, 1,
1.172041, 1.031873, 0.02002865, 1, 0, 0.7490196, 1,
1.175992, 1.548466, -0.1432237, 1, 0, 0.7450981, 1,
1.177571, 0.2769046, 3.547558, 1, 0, 0.7372549, 1,
1.187847, -0.3545531, 0.2785025, 1, 0, 0.7333333, 1,
1.19795, 0.9980811, 0.4938928, 1, 0, 0.7254902, 1,
1.204275, 0.6629317, 2.106987, 1, 0, 0.7215686, 1,
1.205842, -1.562517, 2.116879, 1, 0, 0.7137255, 1,
1.210652, -0.0505902, 0.5050772, 1, 0, 0.7098039, 1,
1.224906, -2.351028, 3.760704, 1, 0, 0.7019608, 1,
1.229902, -0.4875068, 0.6247239, 1, 0, 0.6941177, 1,
1.230257, 0.8312605, 2.887795, 1, 0, 0.6901961, 1,
1.236809, 0.06254628, 3.812078, 1, 0, 0.682353, 1,
1.241481, -0.2794599, 1.807446, 1, 0, 0.6784314, 1,
1.241819, 0.7916885, 1.21113, 1, 0, 0.6705883, 1,
1.244935, 0.2891677, 2.032717, 1, 0, 0.6666667, 1,
1.245752, 0.6569145, 0.8587897, 1, 0, 0.6588235, 1,
1.256277, -0.5352355, 3.999948, 1, 0, 0.654902, 1,
1.262469, 1.634931, 1.321006, 1, 0, 0.6470588, 1,
1.279427, 0.3277549, 2.170045, 1, 0, 0.6431373, 1,
1.284629, -0.4313779, 1.601464, 1, 0, 0.6352941, 1,
1.294359, 0.679314, 0.5923705, 1, 0, 0.6313726, 1,
1.318234, -1.470048, 1.078527, 1, 0, 0.6235294, 1,
1.322982, 0.8002269, 1.291995, 1, 0, 0.6196079, 1,
1.3232, -0.3036679, 1.913515, 1, 0, 0.6117647, 1,
1.330346, -1.364662, 2.25741, 1, 0, 0.6078432, 1,
1.340169, 0.3050022, 0.2525508, 1, 0, 0.6, 1,
1.342542, 1.607209, 0.4140906, 1, 0, 0.5921569, 1,
1.354419, 0.2591637, 0.2010937, 1, 0, 0.5882353, 1,
1.365116, 0.4072658, 1.727731, 1, 0, 0.5803922, 1,
1.373571, 0.8475819, 0.6087629, 1, 0, 0.5764706, 1,
1.387547, -1.020317, 4.352135, 1, 0, 0.5686275, 1,
1.400979, -0.8046322, 0.651697, 1, 0, 0.5647059, 1,
1.401601, 1.293451, 0.3368476, 1, 0, 0.5568628, 1,
1.403598, -1.374024, 1.690342, 1, 0, 0.5529412, 1,
1.404384, 0.1506838, 2.999936, 1, 0, 0.5450981, 1,
1.429944, -1.968167, 1.532894, 1, 0, 0.5411765, 1,
1.432039, 0.1016053, 2.966026, 1, 0, 0.5333334, 1,
1.43253, -0.4556032, 1.408514, 1, 0, 0.5294118, 1,
1.432939, -0.540688, 3.44834, 1, 0, 0.5215687, 1,
1.441112, 0.7536433, 2.423761, 1, 0, 0.5176471, 1,
1.444561, 1.023009, 1.252328, 1, 0, 0.509804, 1,
1.453913, 0.409668, 1.624859, 1, 0, 0.5058824, 1,
1.455989, 3.016813, -0.1040144, 1, 0, 0.4980392, 1,
1.457193, 2.346271, 0.5779563, 1, 0, 0.4901961, 1,
1.474656, -0.9928504, 2.129584, 1, 0, 0.4862745, 1,
1.47789, 0.7729875, 1.009816, 1, 0, 0.4784314, 1,
1.480403, -2.333061, 2.760648, 1, 0, 0.4745098, 1,
1.490716, -0.6231095, 3.007725, 1, 0, 0.4666667, 1,
1.496054, 0.3396871, 1.212799, 1, 0, 0.4627451, 1,
1.497381, 0.9841692, 1.305929, 1, 0, 0.454902, 1,
1.500155, -0.5785313, 0.807925, 1, 0, 0.4509804, 1,
1.50288, 0.5546109, 0.1542841, 1, 0, 0.4431373, 1,
1.505094, -0.05453862, 1.183307, 1, 0, 0.4392157, 1,
1.506731, 0.4227901, 1.128958, 1, 0, 0.4313726, 1,
1.508619, 2.261934, 0.04939166, 1, 0, 0.427451, 1,
1.521668, -0.429968, 0.4426876, 1, 0, 0.4196078, 1,
1.529904, 0.3326226, 1.042738, 1, 0, 0.4156863, 1,
1.538229, 0.7136332, 0.4440557, 1, 0, 0.4078431, 1,
1.545738, -0.2846091, 2.410605, 1, 0, 0.4039216, 1,
1.54602, -0.9246674, 1.985169, 1, 0, 0.3960784, 1,
1.552993, 0.5485244, 0.8170859, 1, 0, 0.3882353, 1,
1.562015, 1.908868, 1.988441, 1, 0, 0.3843137, 1,
1.562724, 0.3959971, 0.8324217, 1, 0, 0.3764706, 1,
1.563148, 0.5077386, 1.32405, 1, 0, 0.372549, 1,
1.56639, 0.9056015, 0.3030312, 1, 0, 0.3647059, 1,
1.567128, -1.109971, 1.386503, 1, 0, 0.3607843, 1,
1.610826, -0.8600068, 1.32342, 1, 0, 0.3529412, 1,
1.612989, -1.363746, 0.3833492, 1, 0, 0.3490196, 1,
1.622229, -0.1196826, 1.044439, 1, 0, 0.3411765, 1,
1.631189, -2.279936, 2.80719, 1, 0, 0.3372549, 1,
1.638239, 0.9355925, 1.955661, 1, 0, 0.3294118, 1,
1.638792, -1.308532, 2.596246, 1, 0, 0.3254902, 1,
1.658641, -0.4657881, 2.30159, 1, 0, 0.3176471, 1,
1.690596, 0.8405482, -0.05961775, 1, 0, 0.3137255, 1,
1.743758, 0.0002073173, 3.430454, 1, 0, 0.3058824, 1,
1.746076, 0.3687805, 1.628537, 1, 0, 0.2980392, 1,
1.746262, 1.223265, 0.1148008, 1, 0, 0.2941177, 1,
1.76023, -0.8439372, 2.436693, 1, 0, 0.2862745, 1,
1.760788, 0.8098097, -0.4109747, 1, 0, 0.282353, 1,
1.761437, 1.920746, -0.004647009, 1, 0, 0.2745098, 1,
1.793227, -0.941957, 2.450951, 1, 0, 0.2705882, 1,
1.828333, 1.048245, -0.2712595, 1, 0, 0.2627451, 1,
1.835873, 1.353426, 0.3093154, 1, 0, 0.2588235, 1,
1.845114, 1.174801, 1.35322, 1, 0, 0.2509804, 1,
1.900055, -0.2380685, -0.5654957, 1, 0, 0.2470588, 1,
1.919979, 0.7396371, 0.2453239, 1, 0, 0.2392157, 1,
1.941911, -0.4036514, 0.2388738, 1, 0, 0.2352941, 1,
1.955597, 0.3795118, 0.1101317, 1, 0, 0.227451, 1,
1.960658, 0.6830507, 3.646101, 1, 0, 0.2235294, 1,
1.961683, 0.2409571, 1.563612, 1, 0, 0.2156863, 1,
1.964896, 0.7212404, 0.2266356, 1, 0, 0.2117647, 1,
1.995669, -2.01643, 4.38609, 1, 0, 0.2039216, 1,
2.001081, 1.891324, -0.2045829, 1, 0, 0.1960784, 1,
2.011658, -0.6318265, 1.534456, 1, 0, 0.1921569, 1,
2.012419, -0.594071, 2.913107, 1, 0, 0.1843137, 1,
2.028856, -0.5538353, 2.414016, 1, 0, 0.1803922, 1,
2.029093, 0.7280464, 0.09671819, 1, 0, 0.172549, 1,
2.047815, 0.8441208, 1.574546, 1, 0, 0.1686275, 1,
2.128343, 0.03948247, 1.102979, 1, 0, 0.1607843, 1,
2.139469, 0.2697119, 1.627923, 1, 0, 0.1568628, 1,
2.147537, 0.08673096, 2.659411, 1, 0, 0.1490196, 1,
2.163785, -1.609854, 1.433138, 1, 0, 0.145098, 1,
2.172611, -1.633793, 1.729171, 1, 0, 0.1372549, 1,
2.188203, -0.6845355, 1.496426, 1, 0, 0.1333333, 1,
2.197724, -1.774264, 2.258237, 1, 0, 0.1254902, 1,
2.220263, 0.8183373, 2.23207, 1, 0, 0.1215686, 1,
2.22993, -0.5601429, 1.812231, 1, 0, 0.1137255, 1,
2.260825, -1.583266, 1.944815, 1, 0, 0.1098039, 1,
2.283656, 1.513526, 1.810422, 1, 0, 0.1019608, 1,
2.29474, 0.8174935, 0.6947663, 1, 0, 0.09411765, 1,
2.306851, -0.04741847, 0.688975, 1, 0, 0.09019608, 1,
2.307579, -3.469927, 3.356475, 1, 0, 0.08235294, 1,
2.33577, 0.8838752, -0.289844, 1, 0, 0.07843138, 1,
2.355138, 1.196333, 0.3749575, 1, 0, 0.07058824, 1,
2.37378, -0.4449326, 1.249134, 1, 0, 0.06666667, 1,
2.426047, -1.283047, 1.476531, 1, 0, 0.05882353, 1,
2.451774, 0.7551776, 1.684515, 1, 0, 0.05490196, 1,
2.464547, -0.8487744, 1.901355, 1, 0, 0.04705882, 1,
2.52521, 1.157174, -0.3231254, 1, 0, 0.04313726, 1,
2.535403, 0.6109728, 2.447011, 1, 0, 0.03529412, 1,
2.595551, -1.460964, 2.322977, 1, 0, 0.03137255, 1,
2.62688, -0.9255739, 3.381409, 1, 0, 0.02352941, 1,
2.642629, -0.8027712, -0.7368002, 1, 0, 0.01960784, 1,
2.645059, 0.8755597, 0.2765306, 1, 0, 0.01176471, 1,
3.304386, -0.6239345, 2.549977, 1, 0, 0.007843138, 1
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
-0.4343948, -4.70095, -7.039587, 0, -0.5, 0.5, 0.5,
-0.4343948, -4.70095, -7.039587, 1, -0.5, 0.5, 0.5,
-0.4343948, -4.70095, -7.039587, 1, 1.5, 0.5, 0.5,
-0.4343948, -4.70095, -7.039587, 0, 1.5, 0.5, 0.5
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
-5.440622, -0.2216114, -7.039587, 0, -0.5, 0.5, 0.5,
-5.440622, -0.2216114, -7.039587, 1, -0.5, 0.5, 0.5,
-5.440622, -0.2216114, -7.039587, 1, 1.5, 0.5, 0.5,
-5.440622, -0.2216114, -7.039587, 0, 1.5, 0.5, 0.5
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
-5.440622, -4.70095, -0.4546945, 0, -0.5, 0.5, 0.5,
-5.440622, -4.70095, -0.4546945, 1, -0.5, 0.5, 0.5,
-5.440622, -4.70095, -0.4546945, 1, 1.5, 0.5, 0.5,
-5.440622, -4.70095, -0.4546945, 0, 1.5, 0.5, 0.5
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
-4, -3.667256, -5.519996,
2, -3.667256, -5.519996,
-4, -3.667256, -5.519996,
-4, -3.839539, -5.773262,
-2, -3.667256, -5.519996,
-2, -3.839539, -5.773262,
0, -3.667256, -5.519996,
0, -3.839539, -5.773262,
2, -3.667256, -5.519996,
2, -3.839539, -5.773262
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
"-4",
"-2",
"0",
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
-4, -4.184103, -6.279791, 0, -0.5, 0.5, 0.5,
-4, -4.184103, -6.279791, 1, -0.5, 0.5, 0.5,
-4, -4.184103, -6.279791, 1, 1.5, 0.5, 0.5,
-4, -4.184103, -6.279791, 0, 1.5, 0.5, 0.5,
-2, -4.184103, -6.279791, 0, -0.5, 0.5, 0.5,
-2, -4.184103, -6.279791, 1, -0.5, 0.5, 0.5,
-2, -4.184103, -6.279791, 1, 1.5, 0.5, 0.5,
-2, -4.184103, -6.279791, 0, 1.5, 0.5, 0.5,
0, -4.184103, -6.279791, 0, -0.5, 0.5, 0.5,
0, -4.184103, -6.279791, 1, -0.5, 0.5, 0.5,
0, -4.184103, -6.279791, 1, 1.5, 0.5, 0.5,
0, -4.184103, -6.279791, 0, 1.5, 0.5, 0.5,
2, -4.184103, -6.279791, 0, -0.5, 0.5, 0.5,
2, -4.184103, -6.279791, 1, -0.5, 0.5, 0.5,
2, -4.184103, -6.279791, 1, 1.5, 0.5, 0.5,
2, -4.184103, -6.279791, 0, 1.5, 0.5, 0.5
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
-4.285339, -3, -5.519996,
-4.285339, 3, -5.519996,
-4.285339, -3, -5.519996,
-4.477886, -3, -5.773262,
-4.285339, -2, -5.519996,
-4.477886, -2, -5.773262,
-4.285339, -1, -5.519996,
-4.477886, -1, -5.773262,
-4.285339, 0, -5.519996,
-4.477886, 0, -5.773262,
-4.285339, 1, -5.519996,
-4.477886, 1, -5.773262,
-4.285339, 2, -5.519996,
-4.477886, 2, -5.773262,
-4.285339, 3, -5.519996,
-4.477886, 3, -5.773262
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
-4.86298, -3, -6.279791, 0, -0.5, 0.5, 0.5,
-4.86298, -3, -6.279791, 1, -0.5, 0.5, 0.5,
-4.86298, -3, -6.279791, 1, 1.5, 0.5, 0.5,
-4.86298, -3, -6.279791, 0, 1.5, 0.5, 0.5,
-4.86298, -2, -6.279791, 0, -0.5, 0.5, 0.5,
-4.86298, -2, -6.279791, 1, -0.5, 0.5, 0.5,
-4.86298, -2, -6.279791, 1, 1.5, 0.5, 0.5,
-4.86298, -2, -6.279791, 0, 1.5, 0.5, 0.5,
-4.86298, -1, -6.279791, 0, -0.5, 0.5, 0.5,
-4.86298, -1, -6.279791, 1, -0.5, 0.5, 0.5,
-4.86298, -1, -6.279791, 1, 1.5, 0.5, 0.5,
-4.86298, -1, -6.279791, 0, 1.5, 0.5, 0.5,
-4.86298, 0, -6.279791, 0, -0.5, 0.5, 0.5,
-4.86298, 0, -6.279791, 1, -0.5, 0.5, 0.5,
-4.86298, 0, -6.279791, 1, 1.5, 0.5, 0.5,
-4.86298, 0, -6.279791, 0, 1.5, 0.5, 0.5,
-4.86298, 1, -6.279791, 0, -0.5, 0.5, 0.5,
-4.86298, 1, -6.279791, 1, -0.5, 0.5, 0.5,
-4.86298, 1, -6.279791, 1, 1.5, 0.5, 0.5,
-4.86298, 1, -6.279791, 0, 1.5, 0.5, 0.5,
-4.86298, 2, -6.279791, 0, -0.5, 0.5, 0.5,
-4.86298, 2, -6.279791, 1, -0.5, 0.5, 0.5,
-4.86298, 2, -6.279791, 1, 1.5, 0.5, 0.5,
-4.86298, 2, -6.279791, 0, 1.5, 0.5, 0.5,
-4.86298, 3, -6.279791, 0, -0.5, 0.5, 0.5,
-4.86298, 3, -6.279791, 1, -0.5, 0.5, 0.5,
-4.86298, 3, -6.279791, 1, 1.5, 0.5, 0.5,
-4.86298, 3, -6.279791, 0, 1.5, 0.5, 0.5
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
-4.285339, -3.667256, -4,
-4.285339, -3.667256, 4,
-4.285339, -3.667256, -4,
-4.477886, -3.839539, -4,
-4.285339, -3.667256, -2,
-4.477886, -3.839539, -2,
-4.285339, -3.667256, 0,
-4.477886, -3.839539, 0,
-4.285339, -3.667256, 2,
-4.477886, -3.839539, 2,
-4.285339, -3.667256, 4,
-4.477886, -3.839539, 4
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
-4.86298, -4.184103, -4, 0, -0.5, 0.5, 0.5,
-4.86298, -4.184103, -4, 1, -0.5, 0.5, 0.5,
-4.86298, -4.184103, -4, 1, 1.5, 0.5, 0.5,
-4.86298, -4.184103, -4, 0, 1.5, 0.5, 0.5,
-4.86298, -4.184103, -2, 0, -0.5, 0.5, 0.5,
-4.86298, -4.184103, -2, 1, -0.5, 0.5, 0.5,
-4.86298, -4.184103, -2, 1, 1.5, 0.5, 0.5,
-4.86298, -4.184103, -2, 0, 1.5, 0.5, 0.5,
-4.86298, -4.184103, 0, 0, -0.5, 0.5, 0.5,
-4.86298, -4.184103, 0, 1, -0.5, 0.5, 0.5,
-4.86298, -4.184103, 0, 1, 1.5, 0.5, 0.5,
-4.86298, -4.184103, 0, 0, 1.5, 0.5, 0.5,
-4.86298, -4.184103, 2, 0, -0.5, 0.5, 0.5,
-4.86298, -4.184103, 2, 1, -0.5, 0.5, 0.5,
-4.86298, -4.184103, 2, 1, 1.5, 0.5, 0.5,
-4.86298, -4.184103, 2, 0, 1.5, 0.5, 0.5,
-4.86298, -4.184103, 4, 0, -0.5, 0.5, 0.5,
-4.86298, -4.184103, 4, 1, -0.5, 0.5, 0.5,
-4.86298, -4.184103, 4, 1, 1.5, 0.5, 0.5,
-4.86298, -4.184103, 4, 0, 1.5, 0.5, 0.5
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
-4.285339, -3.667256, -5.519996,
-4.285339, 3.224033, -5.519996,
-4.285339, -3.667256, 4.610607,
-4.285339, 3.224033, 4.610607,
-4.285339, -3.667256, -5.519996,
-4.285339, -3.667256, 4.610607,
-4.285339, 3.224033, -5.519996,
-4.285339, 3.224033, 4.610607,
-4.285339, -3.667256, -5.519996,
3.416549, -3.667256, -5.519996,
-4.285339, -3.667256, 4.610607,
3.416549, -3.667256, 4.610607,
-4.285339, 3.224033, -5.519996,
3.416549, 3.224033, -5.519996,
-4.285339, 3.224033, 4.610607,
3.416549, 3.224033, 4.610607,
3.416549, -3.667256, -5.519996,
3.416549, 3.224033, -5.519996,
3.416549, -3.667256, 4.610607,
3.416549, 3.224033, 4.610607,
3.416549, -3.667256, -5.519996,
3.416549, -3.667256, 4.610607,
3.416549, 3.224033, -5.519996,
3.416549, 3.224033, 4.610607
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
var radius = 7.727754;
var distance = 34.38165;
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
mvMatrix.translate( 0.4343948, 0.2216114, 0.4546945 );
mvMatrix.scale( 1.084851, 1.212458, 0.8247681 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.38165);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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
carboxylic_acid<-read.table("carboxylic_acid.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-carboxylic_acid$V2
```

```
## Error in eval(expr, envir, enclos): object 'carboxylic_acid' not found
```

```r
y<-carboxylic_acid$V3
```

```
## Error in eval(expr, envir, enclos): object 'carboxylic_acid' not found
```

```r
z<-carboxylic_acid$V4
```

```
## Error in eval(expr, envir, enclos): object 'carboxylic_acid' not found
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
-4.173175, 2.510588, -1.356793, 0, 0, 1, 1, 1,
-2.977812, 1.224518, -0.9304449, 1, 0, 0, 1, 1,
-2.961058, 0.004951935, -0.05467602, 1, 0, 0, 1, 1,
-2.940869, -0.0956298, -2.009139, 1, 0, 0, 1, 1,
-2.854024, 0.463196, 1.678431, 1, 0, 0, 1, 1,
-2.809105, 0.4516156, -1.134199, 1, 0, 0, 1, 1,
-2.604288, 0.6484097, -1.14404, 0, 0, 0, 1, 1,
-2.408216, -0.08959642, 0.07324513, 0, 0, 0, 1, 1,
-2.397544, 0.3632396, -1.039162, 0, 0, 0, 1, 1,
-2.382071, 0.9821824, -1.775481, 0, 0, 0, 1, 1,
-2.263349, -0.3443069, -2.799231, 0, 0, 0, 1, 1,
-2.164387, 1.262417, -2.198936, 0, 0, 0, 1, 1,
-2.130408, -0.3313505, -0.05787307, 0, 0, 0, 1, 1,
-2.113283, -0.2858467, 0.1397104, 1, 1, 1, 1, 1,
-2.09782, -2.420424, -4.952308, 1, 1, 1, 1, 1,
-2.085649, 0.9780562, -2.051792, 1, 1, 1, 1, 1,
-2.081483, 0.3688385, -2.761598, 1, 1, 1, 1, 1,
-2.080843, -0.7250075, -2.037561, 1, 1, 1, 1, 1,
-2.074736, -1.565631, -2.467438, 1, 1, 1, 1, 1,
-2.067443, 1.357797, -2.011686, 1, 1, 1, 1, 1,
-2.063788, 0.6776538, -1.947578, 1, 1, 1, 1, 1,
-2.055106, -0.8644159, -1.734611, 1, 1, 1, 1, 1,
-2.004006, 0.3755293, -1.808719, 1, 1, 1, 1, 1,
-1.993743, 1.283493, 0.2140486, 1, 1, 1, 1, 1,
-1.964218, 0.7449779, -0.1773542, 1, 1, 1, 1, 1,
-1.930971, -0.6743747, -1.198613, 1, 1, 1, 1, 1,
-1.930435, 1.566045, -1.584861, 1, 1, 1, 1, 1,
-1.918594, 0.1592361, -1.644883, 1, 1, 1, 1, 1,
-1.914061, 1.060013, -1.118301, 0, 0, 1, 1, 1,
-1.900879, 0.3528953, 0.247884, 1, 0, 0, 1, 1,
-1.882549, 0.1801682, -1.66855, 1, 0, 0, 1, 1,
-1.878412, -0.5565791, -1.285878, 1, 0, 0, 1, 1,
-1.860743, 1.722811, -1.7878, 1, 0, 0, 1, 1,
-1.857002, 0.5939514, -1.822275, 1, 0, 0, 1, 1,
-1.839758, -0.263413, -1.145363, 0, 0, 0, 1, 1,
-1.80521, -0.7434135, -1.720667, 0, 0, 0, 1, 1,
-1.803883, -0.5229967, -0.501067, 0, 0, 0, 1, 1,
-1.775829, 0.1008968, -1.594559, 0, 0, 0, 1, 1,
-1.760716, -1.38541, -1.796664, 0, 0, 0, 1, 1,
-1.727495, 0.2839944, -1.765349, 0, 0, 0, 1, 1,
-1.726681, -0.5144207, -2.034555, 0, 0, 0, 1, 1,
-1.7116, -0.1930455, -3.53712, 1, 1, 1, 1, 1,
-1.710131, 0.3363622, -1.606253, 1, 1, 1, 1, 1,
-1.710056, 1.1911, 0.03825091, 1, 1, 1, 1, 1,
-1.704914, 2.209491, 1.019411, 1, 1, 1, 1, 1,
-1.699102, -1.15877, -1.960439, 1, 1, 1, 1, 1,
-1.693428, -0.3047453, -2.248304, 1, 1, 1, 1, 1,
-1.673, 0.6860191, -0.7636017, 1, 1, 1, 1, 1,
-1.660585, -2.425307, -4.216283, 1, 1, 1, 1, 1,
-1.64675, 1.143828, -1.738372, 1, 1, 1, 1, 1,
-1.640078, -0.5723912, -1.698712, 1, 1, 1, 1, 1,
-1.621015, 0.4631211, 0.751385, 1, 1, 1, 1, 1,
-1.61935, -0.6386628, -1.613005, 1, 1, 1, 1, 1,
-1.619129, -1.256188, -1.881612, 1, 1, 1, 1, 1,
-1.618317, -0.1765966, -1.293477, 1, 1, 1, 1, 1,
-1.617168, 0.5853578, -0.3507238, 1, 1, 1, 1, 1,
-1.612033, 0.8541476, -2.047397, 0, 0, 1, 1, 1,
-1.61123, 1.948248, -0.4499665, 1, 0, 0, 1, 1,
-1.607034, -0.3125011, -1.869135, 1, 0, 0, 1, 1,
-1.606813, 0.969726, -1.780421, 1, 0, 0, 1, 1,
-1.563661, -0.422314, -2.372252, 1, 0, 0, 1, 1,
-1.560933, 2.010145, -1.138524, 1, 0, 0, 1, 1,
-1.547368, -0.197022, -1.747576, 0, 0, 0, 1, 1,
-1.54391, -1.67024, -3.95774, 0, 0, 0, 1, 1,
-1.529324, -0.07692806, -0.6686301, 0, 0, 0, 1, 1,
-1.527413, -0.6272641, -1.890402, 0, 0, 0, 1, 1,
-1.520182, -0.3830726, -3.588468, 0, 0, 0, 1, 1,
-1.514808, 2.387411, 0.02032497, 0, 0, 0, 1, 1,
-1.50916, -0.9203838, -3.242409, 0, 0, 0, 1, 1,
-1.505927, -0.6247596, -2.463393, 1, 1, 1, 1, 1,
-1.50125, -1.469926, -3.081096, 1, 1, 1, 1, 1,
-1.470603, -0.2561676, -1.718411, 1, 1, 1, 1, 1,
-1.468968, -0.5275217, -2.415104, 1, 1, 1, 1, 1,
-1.458371, -0.5435897, -1.039423, 1, 1, 1, 1, 1,
-1.450409, -1.806516, -3.286278, 1, 1, 1, 1, 1,
-1.435583, -2.885071, -2.437439, 1, 1, 1, 1, 1,
-1.434972, 1.422639, 0.411891, 1, 1, 1, 1, 1,
-1.432581, -0.4860765, -2.375644, 1, 1, 1, 1, 1,
-1.422469, -0.1762061, -0.9822714, 1, 1, 1, 1, 1,
-1.42225, -2.922811, -3.34496, 1, 1, 1, 1, 1,
-1.412228, -0.7341321, -1.272289, 1, 1, 1, 1, 1,
-1.406468, -0.8094553, -0.3130484, 1, 1, 1, 1, 1,
-1.403524, -0.2440992, -1.891958, 1, 1, 1, 1, 1,
-1.397868, -0.4572778, -2.342029, 1, 1, 1, 1, 1,
-1.396847, -0.7012693, -2.479554, 0, 0, 1, 1, 1,
-1.392818, -1.372655, -2.903649, 1, 0, 0, 1, 1,
-1.391055, 0.7847667, -1.380293, 1, 0, 0, 1, 1,
-1.380239, 0.9770502, -0.4217637, 1, 0, 0, 1, 1,
-1.372958, -0.4152217, -2.047089, 1, 0, 0, 1, 1,
-1.35511, -0.7482778, -2.648003, 1, 0, 0, 1, 1,
-1.349877, 2.024262, -0.7636564, 0, 0, 0, 1, 1,
-1.332749, 1.215644, -2.611431, 0, 0, 0, 1, 1,
-1.331009, -0.3955558, -1.523032, 0, 0, 0, 1, 1,
-1.323998, -0.6126868, -2.672721, 0, 0, 0, 1, 1,
-1.321987, 0.01553905, -2.687652, 0, 0, 0, 1, 1,
-1.319951, 0.426443, -0.2311869, 0, 0, 0, 1, 1,
-1.305531, 1.470572, -0.9234631, 0, 0, 0, 1, 1,
-1.300857, 2.814687, -1.123309, 1, 1, 1, 1, 1,
-1.292791, 1.138524, 0.07088287, 1, 1, 1, 1, 1,
-1.290195, -0.7876021, -2.089743, 1, 1, 1, 1, 1,
-1.283856, 0.7246889, -1.279722, 1, 1, 1, 1, 1,
-1.28311, -0.324084, -4.15081, 1, 1, 1, 1, 1,
-1.279741, 0.1432178, -1.052939, 1, 1, 1, 1, 1,
-1.273804, -0.9745062, -1.658632, 1, 1, 1, 1, 1,
-1.269879, -0.6438341, -0.9522513, 1, 1, 1, 1, 1,
-1.263673, 0.1625975, -0.8948156, 1, 1, 1, 1, 1,
-1.260935, 0.4323894, -0.8520837, 1, 1, 1, 1, 1,
-1.257827, -0.3988995, -0.637614, 1, 1, 1, 1, 1,
-1.256572, 0.7863283, -0.2865053, 1, 1, 1, 1, 1,
-1.246923, -0.1038406, -1.832185, 1, 1, 1, 1, 1,
-1.221915, 0.7468522, -1.34669, 1, 1, 1, 1, 1,
-1.218602, 0.4585755, -1.034948, 1, 1, 1, 1, 1,
-1.218558, 0.3544045, -0.325506, 0, 0, 1, 1, 1,
-1.217544, -0.1606251, -1.328835, 1, 0, 0, 1, 1,
-1.213864, -0.7374107, -1.556554, 1, 0, 0, 1, 1,
-1.209098, -1.034203, -2.234134, 1, 0, 0, 1, 1,
-1.196837, 0.4364245, -0.5908361, 1, 0, 0, 1, 1,
-1.192397, 0.2535996, -1.944263, 1, 0, 0, 1, 1,
-1.191901, 0.837602, -3.703653, 0, 0, 0, 1, 1,
-1.187222, -2.421621, -3.924375, 0, 0, 0, 1, 1,
-1.177189, -0.07471859, -2.807623, 0, 0, 0, 1, 1,
-1.175459, -1.082417, -1.657525, 0, 0, 0, 1, 1,
-1.175429, 0.5595472, -1.490265, 0, 0, 0, 1, 1,
-1.162511, 0.2877677, -1.46399, 0, 0, 0, 1, 1,
-1.158863, 0.614378, -0.9066272, 0, 0, 0, 1, 1,
-1.156991, 2.148367, -0.6296968, 1, 1, 1, 1, 1,
-1.156038, -1.594208, -3.10791, 1, 1, 1, 1, 1,
-1.155609, 0.7754616, -1.943492, 1, 1, 1, 1, 1,
-1.153638, -0.08550762, -2.878587, 1, 1, 1, 1, 1,
-1.150801, -0.7876531, -2.844629, 1, 1, 1, 1, 1,
-1.149901, -0.04302475, -1.094292, 1, 1, 1, 1, 1,
-1.148862, 0.5339153, 0.2656952, 1, 1, 1, 1, 1,
-1.147956, 1.071784, 0.9899822, 1, 1, 1, 1, 1,
-1.146559, 0.6702099, -1.604917, 1, 1, 1, 1, 1,
-1.14463, 0.6603023, -1.63252, 1, 1, 1, 1, 1,
-1.140564, -0.0120124, -2.177981, 1, 1, 1, 1, 1,
-1.138711, -0.4494635, 0.09358518, 1, 1, 1, 1, 1,
-1.132025, 0.2344234, 0.08182546, 1, 1, 1, 1, 1,
-1.123876, -0.3287861, -2.041696, 1, 1, 1, 1, 1,
-1.119986, 0.9521991, -1.099694, 1, 1, 1, 1, 1,
-1.11099, 0.4018747, -2.708377, 0, 0, 1, 1, 1,
-1.109043, 1.464315, -0.9998614, 1, 0, 0, 1, 1,
-1.098843, 0.4471543, -2.119589, 1, 0, 0, 1, 1,
-1.097991, -0.02172337, -3.120569, 1, 0, 0, 1, 1,
-1.094445, 0.6808261, -1.877596, 1, 0, 0, 1, 1,
-1.094181, -0.9231185, -1.788449, 1, 0, 0, 1, 1,
-1.088112, 0.7064418, -1.337045, 0, 0, 0, 1, 1,
-1.084519, 0.9846912, 0.7173045, 0, 0, 0, 1, 1,
-1.077641, 0.90605, -1.391512, 0, 0, 0, 1, 1,
-1.072726, -0.6221097, 0.05421844, 0, 0, 0, 1, 1,
-1.072455, -1.425197, -2.436848, 0, 0, 0, 1, 1,
-1.068471, -0.6048179, -2.2126, 0, 0, 0, 1, 1,
-1.058328, -0.5670465, -0.9261616, 0, 0, 0, 1, 1,
-1.05591, 1.582137, -1.129171, 1, 1, 1, 1, 1,
-1.047861, 1.951359, -2.109764, 1, 1, 1, 1, 1,
-1.040898, 0.4099019, 0.7349985, 1, 1, 1, 1, 1,
-1.039682, -1.813989, -2.217775, 1, 1, 1, 1, 1,
-1.039098, -0.7565367, -3.153122, 1, 1, 1, 1, 1,
-1.036159, 0.5345752, -2.214877, 1, 1, 1, 1, 1,
-1.031557, -0.2294616, -1.359705, 1, 1, 1, 1, 1,
-1.03124, 1.188304, -0.4296682, 1, 1, 1, 1, 1,
-1.019607, 0.01378831, -2.294322, 1, 1, 1, 1, 1,
-1.012674, 0.5204475, -1.083248, 1, 1, 1, 1, 1,
-1.009875, 1.32406, 0.5773779, 1, 1, 1, 1, 1,
-1.00945, -0.8135552, -1.274776, 1, 1, 1, 1, 1,
-1.002302, -0.03735738, -2.844753, 1, 1, 1, 1, 1,
-0.9965251, -0.3829686, -2.431211, 1, 1, 1, 1, 1,
-0.9922212, -0.0792228, -2.555846, 1, 1, 1, 1, 1,
-0.9903222, -0.5345666, -1.325094, 0, 0, 1, 1, 1,
-0.9843137, 1.547139, 0.1675027, 1, 0, 0, 1, 1,
-0.9824479, 0.5419167, -2.534127, 1, 0, 0, 1, 1,
-0.9752828, 0.5707586, -0.3086664, 1, 0, 0, 1, 1,
-0.9601612, 1.488912, -0.6637589, 1, 0, 0, 1, 1,
-0.9564474, -0.07826184, -2.736037, 1, 0, 0, 1, 1,
-0.9527299, 0.4627608, -1.731873, 0, 0, 0, 1, 1,
-0.9510893, 0.2272735, -2.097261, 0, 0, 0, 1, 1,
-0.9453716, 2.715299, -1.630068, 0, 0, 0, 1, 1,
-0.9428634, 1.601153, -0.7560809, 0, 0, 0, 1, 1,
-0.9410936, -0.5071669, -3.756017, 0, 0, 0, 1, 1,
-0.9362664, 0.3713457, -0.0615509, 0, 0, 0, 1, 1,
-0.935175, 0.2064023, 0.3578224, 0, 0, 0, 1, 1,
-0.9350919, 0.1970594, -1.013972, 1, 1, 1, 1, 1,
-0.9324304, 0.03419154, -0.2075213, 1, 1, 1, 1, 1,
-0.9316774, -0.2207172, -2.417798, 1, 1, 1, 1, 1,
-0.9307334, 0.08650275, -0.298383, 1, 1, 1, 1, 1,
-0.9281201, -1.070753, -2.708436, 1, 1, 1, 1, 1,
-0.9260864, 1.228305, -0.4768136, 1, 1, 1, 1, 1,
-0.9249929, -0.4008941, -2.582886, 1, 1, 1, 1, 1,
-0.9187058, -1.769803, -1.700835, 1, 1, 1, 1, 1,
-0.9141714, -0.2817335, -2.251538, 1, 1, 1, 1, 1,
-0.9078667, -0.5190516, -1.937479, 1, 1, 1, 1, 1,
-0.9011583, -0.3059472, -2.193955, 1, 1, 1, 1, 1,
-0.8925512, 0.8986811, -0.1041247, 1, 1, 1, 1, 1,
-0.8875856, 1.635783, -1.09593, 1, 1, 1, 1, 1,
-0.8866658, 0.7074178, -1.289154, 1, 1, 1, 1, 1,
-0.8775248, -0.1998825, -1.387011, 1, 1, 1, 1, 1,
-0.8741597, 0.349904, 1.078965, 0, 0, 1, 1, 1,
-0.8664957, -1.689861, -0.8698129, 1, 0, 0, 1, 1,
-0.8616431, 0.0521597, -2.831112, 1, 0, 0, 1, 1,
-0.86108, 0.5631627, -0.7208232, 1, 0, 0, 1, 1,
-0.8558823, -0.6210505, -2.97692, 1, 0, 0, 1, 1,
-0.854174, -1.75936, -1.943643, 1, 0, 0, 1, 1,
-0.8503295, 2.592057, 1.247221, 0, 0, 0, 1, 1,
-0.8497918, 0.2527103, -2.166004, 0, 0, 0, 1, 1,
-0.8464438, 1.081092, -1.470014, 0, 0, 0, 1, 1,
-0.8335188, -0.1662929, -1.663916, 0, 0, 0, 1, 1,
-0.8274956, -0.1738264, -1.142561, 0, 0, 0, 1, 1,
-0.8236956, -0.8095511, -1.77366, 0, 0, 0, 1, 1,
-0.8226436, 2.03001, -1.094291, 0, 0, 0, 1, 1,
-0.8197866, 1.054226, -1.523379, 1, 1, 1, 1, 1,
-0.8177286, -0.3692296, -0.9502558, 1, 1, 1, 1, 1,
-0.8166824, -1.270762, -3.354035, 1, 1, 1, 1, 1,
-0.8137305, -0.9414634, -1.681595, 1, 1, 1, 1, 1,
-0.81055, 0.889048, -1.364176, 1, 1, 1, 1, 1,
-0.8020192, -0.8926511, -4.225727, 1, 1, 1, 1, 1,
-0.8017747, -0.373948, -1.224792, 1, 1, 1, 1, 1,
-0.8007089, -1.472548, -1.594846, 1, 1, 1, 1, 1,
-0.7916368, -0.6671892, -2.623277, 1, 1, 1, 1, 1,
-0.7898682, 0.9553042, -1.149839, 1, 1, 1, 1, 1,
-0.7897645, -0.3633336, -2.192134, 1, 1, 1, 1, 1,
-0.787645, 0.08683246, -2.736138, 1, 1, 1, 1, 1,
-0.7864493, 0.06020157, -1.614632, 1, 1, 1, 1, 1,
-0.7855986, 0.2698278, -3.891988, 1, 1, 1, 1, 1,
-0.783653, -1.284761, -2.09674, 1, 1, 1, 1, 1,
-0.7803414, -2.067981, -2.556826, 0, 0, 1, 1, 1,
-0.7747353, 0.2697088, -2.003006, 1, 0, 0, 1, 1,
-0.774471, 0.3762775, -0.5923564, 1, 0, 0, 1, 1,
-0.7698998, -0.1678942, -2.26338, 1, 0, 0, 1, 1,
-0.7672065, -0.4476148, -3.415878, 1, 0, 0, 1, 1,
-0.7540264, -0.53753, -4.88504, 1, 0, 0, 1, 1,
-0.7497191, 0.3147071, -1.356458, 0, 0, 0, 1, 1,
-0.74089, -0.1318945, -0.5508336, 0, 0, 0, 1, 1,
-0.7408685, 0.9818555, -0.9731749, 0, 0, 0, 1, 1,
-0.7347029, -1.807711, -1.93558, 0, 0, 0, 1, 1,
-0.7337716, -0.66202, -2.702358, 0, 0, 0, 1, 1,
-0.7273137, -0.3683463, -4.264359, 0, 0, 0, 1, 1,
-0.7263191, -1.586406, -2.904197, 0, 0, 0, 1, 1,
-0.7156796, -0.2664137, -2.248609, 1, 1, 1, 1, 1,
-0.7126313, -0.9559008, -1.967822, 1, 1, 1, 1, 1,
-0.7046669, -0.1765903, -1.331714, 1, 1, 1, 1, 1,
-0.704483, 0.2633549, -0.3821152, 1, 1, 1, 1, 1,
-0.7028038, -0.3860112, -2.349423, 1, 1, 1, 1, 1,
-0.6993569, -1.910357, -2.851416, 1, 1, 1, 1, 1,
-0.6985836, 1.305049, -0.6551178, 1, 1, 1, 1, 1,
-0.6978123, 0.2765364, 0.5685893, 1, 1, 1, 1, 1,
-0.6901615, 2.008919, -0.276021, 1, 1, 1, 1, 1,
-0.6867452, 1.836792, -1.094306, 1, 1, 1, 1, 1,
-0.6850234, -0.9780751, -0.7840688, 1, 1, 1, 1, 1,
-0.68436, -0.4441191, -2.317763, 1, 1, 1, 1, 1,
-0.6815716, -0.673294, -2.307141, 1, 1, 1, 1, 1,
-0.6815171, 0.6211559, -0.7938339, 1, 1, 1, 1, 1,
-0.6773103, 1.089949, 0.04108542, 1, 1, 1, 1, 1,
-0.6747147, -0.6902836, -2.056103, 0, 0, 1, 1, 1,
-0.6672107, 0.4153465, -0.8782146, 1, 0, 0, 1, 1,
-0.6658707, -1.292693, -1.75694, 1, 0, 0, 1, 1,
-0.6614622, 1.101743, -0.5546938, 1, 0, 0, 1, 1,
-0.6577721, 1.091484, -1.81838, 1, 0, 0, 1, 1,
-0.6572111, 1.743038, -0.4783877, 1, 0, 0, 1, 1,
-0.6560227, 0.3983838, -0.222859, 0, 0, 0, 1, 1,
-0.6484632, -0.1771299, -2.022878, 0, 0, 0, 1, 1,
-0.6481659, 0.08604684, -0.5487195, 0, 0, 0, 1, 1,
-0.6473157, -0.8475067, -2.679028, 0, 0, 0, 1, 1,
-0.6443405, 1.900371, 0.9279362, 0, 0, 0, 1, 1,
-0.6439617, 0.5208567, -1.554494, 0, 0, 0, 1, 1,
-0.6430719, 0.1455542, -1.215226, 0, 0, 0, 1, 1,
-0.6426291, 0.3729035, -0.9892799, 1, 1, 1, 1, 1,
-0.6399595, 0.02185591, -0.9134903, 1, 1, 1, 1, 1,
-0.6341235, 0.6426764, -1.038008, 1, 1, 1, 1, 1,
-0.6338301, 0.5960773, -0.8650037, 1, 1, 1, 1, 1,
-0.6327359, 0.614236, -1.793297, 1, 1, 1, 1, 1,
-0.6313651, -0.2966836, -2.459489, 1, 1, 1, 1, 1,
-0.62876, -0.826317, -0.6443456, 1, 1, 1, 1, 1,
-0.6272473, 0.0725809, -2.085182, 1, 1, 1, 1, 1,
-0.6262259, 2.081666, -0.2127247, 1, 1, 1, 1, 1,
-0.6217726, -1.74682, -3.820149, 1, 1, 1, 1, 1,
-0.6192414, -1.350797, -3.163356, 1, 1, 1, 1, 1,
-0.6168553, 0.8005529, -0.965858, 1, 1, 1, 1, 1,
-0.6140489, -0.04635054, -1.476131, 1, 1, 1, 1, 1,
-0.60295, -0.3217495, -3.406764, 1, 1, 1, 1, 1,
-0.6015223, -0.6584716, -0.8808345, 1, 1, 1, 1, 1,
-0.5980797, -0.3689752, -1.574401, 0, 0, 1, 1, 1,
-0.5970123, -0.9003125, -2.170978, 1, 0, 0, 1, 1,
-0.5960647, 1.365144, 2.32178, 1, 0, 0, 1, 1,
-0.5955722, -1.999094, -1.296832, 1, 0, 0, 1, 1,
-0.5902466, 0.7544634, 1.035378, 1, 0, 0, 1, 1,
-0.5883455, 1.707367, 0.4121753, 1, 0, 0, 1, 1,
-0.5876839, -0.6426932, -0.5128388, 0, 0, 0, 1, 1,
-0.5876089, -0.278999, -1.926321, 0, 0, 0, 1, 1,
-0.5809312, -1.299493, -1.974211, 0, 0, 0, 1, 1,
-0.5696812, 1.495101, -0.6345452, 0, 0, 0, 1, 1,
-0.5695817, 1.466521, -1.128335, 0, 0, 0, 1, 1,
-0.5638682, 0.52171, -0.2288929, 0, 0, 0, 1, 1,
-0.5635331, 0.8414285, -2.125145, 0, 0, 0, 1, 1,
-0.5614781, -2.290313, -4.074704, 1, 1, 1, 1, 1,
-0.5587898, 0.3974327, -0.3116772, 1, 1, 1, 1, 1,
-0.5559161, -0.9106791, -2.623209, 1, 1, 1, 1, 1,
-0.5548242, -0.1758423, -2.680994, 1, 1, 1, 1, 1,
-0.5539159, -1.004991, -2.222272, 1, 1, 1, 1, 1,
-0.5527676, -0.6928571, -1.951844, 1, 1, 1, 1, 1,
-0.5491581, -0.2790382, -1.545376, 1, 1, 1, 1, 1,
-0.5386862, -2.609316, -3.428988, 1, 1, 1, 1, 1,
-0.5349006, 0.8085088, -0.371424, 1, 1, 1, 1, 1,
-0.5292348, -0.9696648, -0.3825075, 1, 1, 1, 1, 1,
-0.5277092, -0.837442, -1.028847, 1, 1, 1, 1, 1,
-0.5275831, 1.031991, -0.1537427, 1, 1, 1, 1, 1,
-0.5257013, 0.01521619, -2.361512, 1, 1, 1, 1, 1,
-0.5243858, -0.2708384, -1.446257, 1, 1, 1, 1, 1,
-0.5172663, 0.4587339, -1.81607, 1, 1, 1, 1, 1,
-0.5148366, -0.1799751, -1.788482, 0, 0, 1, 1, 1,
-0.5134218, -1.118841, -4.064845, 1, 0, 0, 1, 1,
-0.5121118, 1.257474, 1.548636, 1, 0, 0, 1, 1,
-0.5116965, -0.1242256, -1.261994, 1, 0, 0, 1, 1,
-0.5082242, 0.5400005, 0.07123529, 1, 0, 0, 1, 1,
-0.505231, 0.7735894, -0.7671169, 1, 0, 0, 1, 1,
-0.5038344, -0.6170133, -2.733399, 0, 0, 0, 1, 1,
-0.501619, -0.3546905, -3.362113, 0, 0, 0, 1, 1,
-0.5005859, 1.51059, -0.5251207, 0, 0, 0, 1, 1,
-0.4974634, -0.6849369, -1.871439, 0, 0, 0, 1, 1,
-0.495285, 0.8595303, -2.693835, 0, 0, 0, 1, 1,
-0.4939588, 0.111488, -2.389433, 0, 0, 0, 1, 1,
-0.4930116, 1.450543, -0.840311, 0, 0, 0, 1, 1,
-0.4854062, -0.9837847, -2.425089, 1, 1, 1, 1, 1,
-0.4840892, -0.2599353, -1.012583, 1, 1, 1, 1, 1,
-0.4825727, -0.687657, -0.7391561, 1, 1, 1, 1, 1,
-0.481953, 0.3558376, -2.009466, 1, 1, 1, 1, 1,
-0.4797456, -1.419124, -2.033524, 1, 1, 1, 1, 1,
-0.478955, -1.00355, -3.651447, 1, 1, 1, 1, 1,
-0.4757458, -0.8069631, -2.561115, 1, 1, 1, 1, 1,
-0.4745996, -1.286077, -1.689683, 1, 1, 1, 1, 1,
-0.47408, -0.4824288, -2.535861, 1, 1, 1, 1, 1,
-0.4684691, 1.401919, -0.4676369, 1, 1, 1, 1, 1,
-0.4660638, 0.6811417, 0.5512686, 1, 1, 1, 1, 1,
-0.461947, -1.277885, -2.390241, 1, 1, 1, 1, 1,
-0.457545, -1.182908, -3.215916, 1, 1, 1, 1, 1,
-0.4557277, -0.7424729, -2.601994, 1, 1, 1, 1, 1,
-0.4535362, -0.3164385, -1.712834, 1, 1, 1, 1, 1,
-0.4441498, 1.136955, 0.9019231, 0, 0, 1, 1, 1,
-0.4426224, -1.18159, -3.520682, 1, 0, 0, 1, 1,
-0.4395818, 0.4602422, 0.7986448, 1, 0, 0, 1, 1,
-0.4394343, -0.03606047, -0.1940852, 1, 0, 0, 1, 1,
-0.4388704, -1.22365, -2.1292, 1, 0, 0, 1, 1,
-0.437309, -1.666309, -5.372463, 1, 0, 0, 1, 1,
-0.4358865, -0.4818457, -1.85388, 0, 0, 0, 1, 1,
-0.4325694, 1.849824, -0.8227549, 0, 0, 0, 1, 1,
-0.4325624, 0.2892033, -0.3774342, 0, 0, 0, 1, 1,
-0.4287823, -0.1675782, -1.654577, 0, 0, 0, 1, 1,
-0.4247712, -0.3375562, -2.366135, 0, 0, 0, 1, 1,
-0.4190422, 0.221049, -0.2051048, 0, 0, 0, 1, 1,
-0.418672, 0.8095375, 0.1934118, 0, 0, 0, 1, 1,
-0.4143922, 0.22976, 0.3787033, 1, 1, 1, 1, 1,
-0.4080615, 1.245353, 0.7871639, 1, 1, 1, 1, 1,
-0.4054468, 0.4382447, -1.00981, 1, 1, 1, 1, 1,
-0.3976788, 0.2640202, -1.521753, 1, 1, 1, 1, 1,
-0.3973132, -0.9703459, -1.71868, 1, 1, 1, 1, 1,
-0.3964662, -1.502143, -3.73273, 1, 1, 1, 1, 1,
-0.3947704, 0.222578, -2.471435, 1, 1, 1, 1, 1,
-0.3924867, 1.268373, -0.828432, 1, 1, 1, 1, 1,
-0.3876403, 0.1162617, -0.1424464, 1, 1, 1, 1, 1,
-0.3866732, 0.0487525, 0.1285198, 1, 1, 1, 1, 1,
-0.3796875, -0.461691, -2.254146, 1, 1, 1, 1, 1,
-0.3781867, -0.08902116, -0.3303116, 1, 1, 1, 1, 1,
-0.3738869, -0.1394193, -0.6139237, 1, 1, 1, 1, 1,
-0.3732327, 0.2440839, -2.415802, 1, 1, 1, 1, 1,
-0.3724095, -1.228441, -2.722792, 1, 1, 1, 1, 1,
-0.3684997, 1.833076, 0.05690438, 0, 0, 1, 1, 1,
-0.367294, -0.972826, -4.603628, 1, 0, 0, 1, 1,
-0.3522093, -0.08470733, -2.637921, 1, 0, 0, 1, 1,
-0.3510436, -1.445803, -2.972689, 1, 0, 0, 1, 1,
-0.3476958, 0.3805148, -0.5539846, 1, 0, 0, 1, 1,
-0.3456517, -0.05211695, -1.267225, 1, 0, 0, 1, 1,
-0.3440922, -0.5290208, -3.902812, 0, 0, 0, 1, 1,
-0.3391412, 0.2036041, -1.535155, 0, 0, 0, 1, 1,
-0.3384892, -0.1926648, -2.091128, 0, 0, 0, 1, 1,
-0.337163, -0.2849662, -3.70808, 0, 0, 0, 1, 1,
-0.336486, -0.8936701, -1.31621, 0, 0, 0, 1, 1,
-0.3350674, 0.2351856, -2.22914, 0, 0, 0, 1, 1,
-0.3336681, 0.8680341, -2.552456, 0, 0, 0, 1, 1,
-0.3329634, -1.299843, -1.878015, 1, 1, 1, 1, 1,
-0.3300674, 0.3394555, -0.9427364, 1, 1, 1, 1, 1,
-0.3262852, -1.023686, -3.968446, 1, 1, 1, 1, 1,
-0.3251376, 0.3448003, -1.361698, 1, 1, 1, 1, 1,
-0.3228565, -0.2003815, -1.992765, 1, 1, 1, 1, 1,
-0.3208908, -0.9608394, -5.340085, 1, 1, 1, 1, 1,
-0.316714, 0.05174873, -0.2820395, 1, 1, 1, 1, 1,
-0.3114301, -1.269039, -2.476835, 1, 1, 1, 1, 1,
-0.3103427, 0.3185615, -1.007772, 1, 1, 1, 1, 1,
-0.310286, -0.5287305, -2.115299, 1, 1, 1, 1, 1,
-0.3033587, 1.110789, 0.5008263, 1, 1, 1, 1, 1,
-0.3018483, -0.1190143, -1.759998, 1, 1, 1, 1, 1,
-0.3012118, 0.7366983, -0.6263608, 1, 1, 1, 1, 1,
-0.2996187, -0.8320913, -1.480126, 1, 1, 1, 1, 1,
-0.2965825, -0.7336747, -2.488096, 1, 1, 1, 1, 1,
-0.2942378, -1.376768, -3.338237, 0, 0, 1, 1, 1,
-0.2890637, -0.3080337, -2.276106, 1, 0, 0, 1, 1,
-0.2854115, 0.1773425, -0.2157115, 1, 0, 0, 1, 1,
-0.2843575, 0.297324, -0.8809339, 1, 0, 0, 1, 1,
-0.2808247, 0.6269458, -1.134052, 1, 0, 0, 1, 1,
-0.2777561, 1.055341, 1.267806, 1, 0, 0, 1, 1,
-0.2768774, -0.5914484, -2.645998, 0, 0, 0, 1, 1,
-0.2762672, -1.359727, -4.542333, 0, 0, 0, 1, 1,
-0.2751582, -0.009005328, -0.7275726, 0, 0, 0, 1, 1,
-0.2715146, 0.982142, -1.844905, 0, 0, 0, 1, 1,
-0.2699373, -2.321441, -4.00489, 0, 0, 0, 1, 1,
-0.267353, -0.5537204, -3.756844, 0, 0, 0, 1, 1,
-0.2669424, 0.9647518, 0.115905, 0, 0, 0, 1, 1,
-0.2659421, 0.06606551, -1.775694, 1, 1, 1, 1, 1,
-0.264051, 0.2353799, 0.4430954, 1, 1, 1, 1, 1,
-0.2624187, 0.3963777, -1.018347, 1, 1, 1, 1, 1,
-0.26129, -0.3018851, -3.596411, 1, 1, 1, 1, 1,
-0.2612052, 0.4194088, -1.164298, 1, 1, 1, 1, 1,
-0.2580739, -0.4712097, -4.906583, 1, 1, 1, 1, 1,
-0.2558618, 0.3431835, -0.320687, 1, 1, 1, 1, 1,
-0.2555594, -0.05196824, -2.211186, 1, 1, 1, 1, 1,
-0.2509271, -0.1445806, -0.8537112, 1, 1, 1, 1, 1,
-0.2456846, -1.168694, -4.07393, 1, 1, 1, 1, 1,
-0.2453058, -1.224751, -3.055412, 1, 1, 1, 1, 1,
-0.2449714, 0.3943333, -0.8949565, 1, 1, 1, 1, 1,
-0.2447771, 1.332175, -0.8676931, 1, 1, 1, 1, 1,
-0.2429807, -0.5322779, -3.319911, 1, 1, 1, 1, 1,
-0.2424559, -1.421499, -2.828259, 1, 1, 1, 1, 1,
-0.2420549, -1.843782, -1.500114, 0, 0, 1, 1, 1,
-0.2363266, -1.991685, -4.070906, 1, 0, 0, 1, 1,
-0.2347006, -1.27698, -2.564806, 1, 0, 0, 1, 1,
-0.2333768, 0.4144777, -1.035478, 1, 0, 0, 1, 1,
-0.2305061, 0.8328011, 0.1174346, 1, 0, 0, 1, 1,
-0.2285547, 1.123203, -2.592427, 1, 0, 0, 1, 1,
-0.2284603, -1.391273, -4.614176, 0, 0, 0, 1, 1,
-0.2281058, -0.5724621, -4.732284, 0, 0, 0, 1, 1,
-0.2141596, 1.323856, -0.02902242, 0, 0, 0, 1, 1,
-0.2099794, -0.09937784, -0.9072209, 0, 0, 0, 1, 1,
-0.2066539, 1.056562, -0.9685686, 0, 0, 0, 1, 1,
-0.1988097, -0.54755, -3.3532, 0, 0, 0, 1, 1,
-0.1886584, -1.039576, -3.737763, 0, 0, 0, 1, 1,
-0.1870003, 0.6430929, 0.1775509, 1, 1, 1, 1, 1,
-0.1844963, 1.334931, -1.13943, 1, 1, 1, 1, 1,
-0.1842971, 0.3744661, -1.718469, 1, 1, 1, 1, 1,
-0.1839089, 1.68126, 0.8146319, 1, 1, 1, 1, 1,
-0.1825708, 1.510379, -0.3502961, 1, 1, 1, 1, 1,
-0.1751308, 0.07958552, -1.914678, 1, 1, 1, 1, 1,
-0.1731758, 0.09044038, -2.358775, 1, 1, 1, 1, 1,
-0.1723609, 0.3607693, -0.7439997, 1, 1, 1, 1, 1,
-0.1688291, -0.213538, -2.278611, 1, 1, 1, 1, 1,
-0.1677172, -0.8718282, -4.594303, 1, 1, 1, 1, 1,
-0.1651077, -0.08132671, -1.281896, 1, 1, 1, 1, 1,
-0.1650087, 0.7495998, 0.4634706, 1, 1, 1, 1, 1,
-0.1627266, -0.7827483, -0.5258349, 1, 1, 1, 1, 1,
-0.1598096, -0.0249243, -2.497615, 1, 1, 1, 1, 1,
-0.1545141, 1.618576, -0.3355599, 1, 1, 1, 1, 1,
-0.1544296, -0.1070992, -1.18009, 0, 0, 1, 1, 1,
-0.1544005, 0.04826496, -1.648735, 1, 0, 0, 1, 1,
-0.1395496, -0.5067887, -4.418211, 1, 0, 0, 1, 1,
-0.1359131, -0.1304843, -2.318072, 1, 0, 0, 1, 1,
-0.1357002, -0.9431759, -1.234463, 1, 0, 0, 1, 1,
-0.1337138, -1.560923, -1.030594, 1, 0, 0, 1, 1,
-0.1332485, 0.1906921, -0.380962, 0, 0, 0, 1, 1,
-0.1330294, -1.661223, -3.404972, 0, 0, 0, 1, 1,
-0.1290713, -0.475374, -2.876143, 0, 0, 0, 1, 1,
-0.1239737, 1.820213, -0.9496213, 0, 0, 0, 1, 1,
-0.1237065, -0.6182191, -4.25626, 0, 0, 0, 1, 1,
-0.1202682, 0.7258468, 0.9112415, 0, 0, 0, 1, 1,
-0.1166213, 1.368646, 0.7067431, 0, 0, 0, 1, 1,
-0.1154325, -1.056507, -4.66181, 1, 1, 1, 1, 1,
-0.1041096, -1.147407, -3.125326, 1, 1, 1, 1, 1,
-0.09970638, 0.3467537, -1.885424, 1, 1, 1, 1, 1,
-0.09228405, 1.671284, -0.6499047, 1, 1, 1, 1, 1,
-0.08663841, -1.135391, -3.610594, 1, 1, 1, 1, 1,
-0.08326196, 0.1560633, -1.643223, 1, 1, 1, 1, 1,
-0.08180848, 0.1949631, -0.1264579, 1, 1, 1, 1, 1,
-0.08170628, -0.02658756, -3.586284, 1, 1, 1, 1, 1,
-0.07979298, -0.3475244, -1.637116, 1, 1, 1, 1, 1,
-0.07755819, 0.5481061, 0.3746406, 1, 1, 1, 1, 1,
-0.07539997, 0.4786298, 0.4179564, 1, 1, 1, 1, 1,
-0.07074508, -0.9121018, -3.800909, 1, 1, 1, 1, 1,
-0.06948754, -2.169396, -4.058893, 1, 1, 1, 1, 1,
-0.06644296, -0.7151474, -1.467575, 1, 1, 1, 1, 1,
-0.06037908, 1.005644, -0.298106, 1, 1, 1, 1, 1,
-0.05991569, -0.573735, -3.323317, 0, 0, 1, 1, 1,
-0.05856999, 1.113895, 0.1647239, 1, 0, 0, 1, 1,
-0.05486931, -0.3189631, -3.256478, 1, 0, 0, 1, 1,
-0.05439133, -1.021345, -3.937983, 1, 0, 0, 1, 1,
-0.05217912, -0.98815, -4.110004, 1, 0, 0, 1, 1,
-0.04794647, 0.4244474, 1.753781, 1, 0, 0, 1, 1,
-0.04777098, 1.486062, -0.6099465, 0, 0, 0, 1, 1,
-0.0439577, 0.3868161, -0.2629943, 0, 0, 0, 1, 1,
-0.04371454, 0.2094536, 0.1402938, 0, 0, 0, 1, 1,
-0.04135212, -0.7118506, -4.149684, 0, 0, 0, 1, 1,
-0.0394235, -0.2013304, -2.451655, 0, 0, 0, 1, 1,
-0.03824593, -0.1415739, -3.376504, 0, 0, 0, 1, 1,
-0.03639807, 1.237347, 0.6685235, 0, 0, 0, 1, 1,
-0.03269889, -0.7513517, -2.249412, 1, 1, 1, 1, 1,
-0.03079827, 0.6598663, 1.311952, 1, 1, 1, 1, 1,
-0.02916159, -0.4854424, -4.488482, 1, 1, 1, 1, 1,
-0.02744776, 1.574032, -0.4592425, 1, 1, 1, 1, 1,
-0.02636517, -0.9141056, -4.549972, 1, 1, 1, 1, 1,
-0.02060537, 1.741067, -2.349766, 1, 1, 1, 1, 1,
-0.01616681, -0.5266137, -3.841884, 1, 1, 1, 1, 1,
-0.01571923, 0.2618759, -0.2219853, 1, 1, 1, 1, 1,
-0.01329417, 0.6305469, -0.6445885, 1, 1, 1, 1, 1,
-0.003881123, -1.254185, -2.274467, 1, 1, 1, 1, 1,
-0.003058621, -0.9411309, -4.343626, 1, 1, 1, 1, 1,
-0.001807218, -0.2059678, -1.741444, 1, 1, 1, 1, 1,
-0.001381528, 0.911218, -0.2974242, 1, 1, 1, 1, 1,
0.0003313533, -0.6793842, 2.253989, 1, 1, 1, 1, 1,
0.00092898, -0.7518259, 3.645497, 1, 1, 1, 1, 1,
0.001111586, -0.6683767, 1.779938, 0, 0, 1, 1, 1,
0.005560771, 1.618089, 0.377168, 1, 0, 0, 1, 1,
0.006463382, 0.3092111, 0.8477504, 1, 0, 0, 1, 1,
0.007513954, 0.7195024, -0.2185322, 1, 0, 0, 1, 1,
0.009398784, -0.1807976, 0.84169, 1, 0, 0, 1, 1,
0.009974879, 0.1444186, -0.370723, 1, 0, 0, 1, 1,
0.01024411, 0.3544945, -0.6020111, 0, 0, 0, 1, 1,
0.01107441, 0.454412, -0.1560837, 0, 0, 0, 1, 1,
0.01708046, 0.1622311, -0.1313229, 0, 0, 0, 1, 1,
0.01811873, -0.3700572, 2.055749, 0, 0, 0, 1, 1,
0.0184682, 0.1190887, 1.139935, 0, 0, 0, 1, 1,
0.02712325, 0.06343387, 2.093928, 0, 0, 0, 1, 1,
0.03122434, -0.6250539, 3.850055, 0, 0, 0, 1, 1,
0.03869029, -0.2972426, 2.511162, 1, 1, 1, 1, 1,
0.03927273, 0.8858788, 1.240862, 1, 1, 1, 1, 1,
0.03998004, 0.07446523, 0.4312003, 1, 1, 1, 1, 1,
0.04155375, 0.231047, 2.417627, 1, 1, 1, 1, 1,
0.04428625, -0.01548507, 2.525981, 1, 1, 1, 1, 1,
0.04691247, 0.1961895, 0.5480802, 1, 1, 1, 1, 1,
0.04724813, -0.1615822, 2.846547, 1, 1, 1, 1, 1,
0.05593762, 0.5363628, -0.4327179, 1, 1, 1, 1, 1,
0.06008305, -1.596676, 2.08927, 1, 1, 1, 1, 1,
0.06258575, -2.403481, 3.026629, 1, 1, 1, 1, 1,
0.0691338, -0.223453, 2.141219, 1, 1, 1, 1, 1,
0.07003874, 0.6163338, -1.138471, 1, 1, 1, 1, 1,
0.07285018, -0.6586829, 3.071309, 1, 1, 1, 1, 1,
0.07608201, 1.314906, 0.3509458, 1, 1, 1, 1, 1,
0.08157537, 0.7012143, 0.6826043, 1, 1, 1, 1, 1,
0.08265925, 1.051816, -0.7398204, 0, 0, 1, 1, 1,
0.08639804, -2.264441, 3.738795, 1, 0, 0, 1, 1,
0.08806989, -1.816292, 3.414726, 1, 0, 0, 1, 1,
0.08891749, -1.778332, 3.6128, 1, 0, 0, 1, 1,
0.08909849, -2.030795, 3.004737, 1, 0, 0, 1, 1,
0.0908215, -1.079053, 2.956262, 1, 0, 0, 1, 1,
0.09517302, -0.9892052, 3.165123, 0, 0, 0, 1, 1,
0.09680653, -0.2299746, 2.705351, 0, 0, 0, 1, 1,
0.1021668, -0.5492914, 2.563588, 0, 0, 0, 1, 1,
0.1030338, 0.7268681, -0.1684134, 0, 0, 0, 1, 1,
0.1066995, -0.3541177, 1.664662, 0, 0, 0, 1, 1,
0.1084756, -0.4004505, -0.344165, 0, 0, 0, 1, 1,
0.1144501, -1.044411, 3.84565, 0, 0, 0, 1, 1,
0.1187267, -0.3550256, 2.437765, 1, 1, 1, 1, 1,
0.1235099, 1.209077, -0.7037107, 1, 1, 1, 1, 1,
0.123618, -1.137617, 4.069818, 1, 1, 1, 1, 1,
0.1255643, -0.616442, 2.512377, 1, 1, 1, 1, 1,
0.1281298, -1.023657, 3.231372, 1, 1, 1, 1, 1,
0.1361485, 0.4813971, 0.516148, 1, 1, 1, 1, 1,
0.1363318, 0.04193602, -0.2816851, 1, 1, 1, 1, 1,
0.1367798, -0.1987777, 3.901124, 1, 1, 1, 1, 1,
0.137385, -1.383153, 2.312983, 1, 1, 1, 1, 1,
0.1376726, -0.1629414, 1.866938, 1, 1, 1, 1, 1,
0.1421061, 0.6359344, -1.608798, 1, 1, 1, 1, 1,
0.1543597, 1.500873, 0.3695306, 1, 1, 1, 1, 1,
0.1578625, -0.7095463, 4.306393, 1, 1, 1, 1, 1,
0.1623239, 1.877276, -0.7742929, 1, 1, 1, 1, 1,
0.1641205, -0.5070463, 3.660967, 1, 1, 1, 1, 1,
0.1667556, 0.8882627, -1.14533, 0, 0, 1, 1, 1,
0.1674178, -0.4634745, 4.414449, 1, 0, 0, 1, 1,
0.1681557, -0.3969236, 3.96776, 1, 0, 0, 1, 1,
0.1702653, -0.02469604, 2.768085, 1, 0, 0, 1, 1,
0.1706485, -0.8240318, 2.369022, 1, 0, 0, 1, 1,
0.1769348, -0.4340789, 1.294953, 1, 0, 0, 1, 1,
0.1807345, 0.006173306, 1.569109, 0, 0, 0, 1, 1,
0.1827195, -0.6591922, 1.913949, 0, 0, 0, 1, 1,
0.1847793, 1.485798, 0.3061831, 0, 0, 0, 1, 1,
0.1851738, 0.6392562, -1.162312, 0, 0, 0, 1, 1,
0.1910794, 0.7428924, 2.830345, 0, 0, 0, 1, 1,
0.1930506, 1.405365, 0.6457717, 0, 0, 0, 1, 1,
0.1980744, -0.03976971, 1.02473, 0, 0, 0, 1, 1,
0.1983438, 0.8466091, 1.096056, 1, 1, 1, 1, 1,
0.2056032, 0.1004823, -1.421401, 1, 1, 1, 1, 1,
0.2084688, 0.1689698, 2.325904, 1, 1, 1, 1, 1,
0.2103658, 0.2149909, 0.01155526, 1, 1, 1, 1, 1,
0.211171, 2.364321, 0.7472413, 1, 1, 1, 1, 1,
0.2120395, -0.3202454, 2.420264, 1, 1, 1, 1, 1,
0.2142936, 0.1742604, -0.4547217, 1, 1, 1, 1, 1,
0.2183022, 0.7769978, -1.215697, 1, 1, 1, 1, 1,
0.2183337, -1.19763, 1.415253, 1, 1, 1, 1, 1,
0.2184226, -0.06191565, -0.4402764, 1, 1, 1, 1, 1,
0.2201542, -0.05807676, 1.068253, 1, 1, 1, 1, 1,
0.2435577, -1.887602, 3.958039, 1, 1, 1, 1, 1,
0.2467302, -0.1058822, 2.857731, 1, 1, 1, 1, 1,
0.2474695, -0.5891672, 1.674987, 1, 1, 1, 1, 1,
0.2487566, -1.209324, 2.145682, 1, 1, 1, 1, 1,
0.2559178, 0.148338, -0.2317653, 0, 0, 1, 1, 1,
0.2577809, -0.3176596, 1.214132, 1, 0, 0, 1, 1,
0.2601149, -0.6260513, 1.596409, 1, 0, 0, 1, 1,
0.2631511, 0.933172, 1.287128, 1, 0, 0, 1, 1,
0.26329, 2.109543, 1.137417, 1, 0, 0, 1, 1,
0.2639169, -3.566898, 2.400433, 1, 0, 0, 1, 1,
0.2770602, 0.03410235, 1.483279, 0, 0, 0, 1, 1,
0.2793449, -0.6777076, 3.671531, 0, 0, 0, 1, 1,
0.2816287, 0.3914346, -1.166231, 0, 0, 0, 1, 1,
0.2823853, 0.1650175, 1.333513, 0, 0, 0, 1, 1,
0.2861494, -1.804769, 4.250522, 0, 0, 0, 1, 1,
0.2873446, 0.122397, 0.9045409, 0, 0, 0, 1, 1,
0.2980784, 0.5260058, 1.121613, 0, 0, 0, 1, 1,
0.3037969, -1.654508, 4.265712, 1, 1, 1, 1, 1,
0.3068308, 0.1465236, 1.670071, 1, 1, 1, 1, 1,
0.3101774, 0.6486674, 1.63923, 1, 1, 1, 1, 1,
0.3101863, -0.5450538, 3.203888, 1, 1, 1, 1, 1,
0.3160561, 0.03871227, 0.9164194, 1, 1, 1, 1, 1,
0.3212225, -1.27433, 2.899212, 1, 1, 1, 1, 1,
0.3257131, -0.2232286, 3.138835, 1, 1, 1, 1, 1,
0.3293127, 1.423584, 0.3266315, 1, 1, 1, 1, 1,
0.3294857, 0.6951201, -0.3577783, 1, 1, 1, 1, 1,
0.3372487, 0.1741142, 1.532482, 1, 1, 1, 1, 1,
0.3404786, -1.237425, 4.457361, 1, 1, 1, 1, 1,
0.3427339, 1.22477, -0.722248, 1, 1, 1, 1, 1,
0.3435876, -1.562996, 2.092941, 1, 1, 1, 1, 1,
0.3448313, -0.5569404, 3.564281, 1, 1, 1, 1, 1,
0.3466034, 0.5199352, -0.09507834, 1, 1, 1, 1, 1,
0.350767, 0.2889217, 0.02312838, 0, 0, 1, 1, 1,
0.3557552, 0.5132264, 0.0374833, 1, 0, 0, 1, 1,
0.3596463, -0.8783079, 1.431403, 1, 0, 0, 1, 1,
0.3608273, 0.2205644, 1.178325, 1, 0, 0, 1, 1,
0.361152, -1.380212, 3.373812, 1, 0, 0, 1, 1,
0.3673479, -0.8371219, 2.231965, 1, 0, 0, 1, 1,
0.3676902, -0.6151133, 3.147122, 0, 0, 0, 1, 1,
0.3743261, -0.9633576, 0.8090652, 0, 0, 0, 1, 1,
0.3758353, -0.8693552, 2.680486, 0, 0, 0, 1, 1,
0.3820105, -0.1404108, 0.6732652, 0, 0, 0, 1, 1,
0.3843718, 0.1190115, 1.300461, 0, 0, 0, 1, 1,
0.384391, 1.459133, -0.5714573, 0, 0, 0, 1, 1,
0.3850041, -1.673837, 2.778254, 0, 0, 0, 1, 1,
0.3854602, 0.8126278, 0.3027964, 1, 1, 1, 1, 1,
0.3878562, -0.06555574, 1.891424, 1, 1, 1, 1, 1,
0.3887438, 1.166153, 0.1905696, 1, 1, 1, 1, 1,
0.3892149, 0.3140279, -0.5788529, 1, 1, 1, 1, 1,
0.3904795, 0.6732181, 0.6368321, 1, 1, 1, 1, 1,
0.3910254, 0.3133972, 1.304707, 1, 1, 1, 1, 1,
0.3928878, 0.08044378, 2.220915, 1, 1, 1, 1, 1,
0.3939614, -2.34217, 2.375674, 1, 1, 1, 1, 1,
0.3976909, 1.899075, 0.5384268, 1, 1, 1, 1, 1,
0.3986242, 0.0142463, 0.4417159, 1, 1, 1, 1, 1,
0.399517, 0.007212235, 0.04815586, 1, 1, 1, 1, 1,
0.4001738, 0.1044434, 0.5159355, 1, 1, 1, 1, 1,
0.4018413, -0.9050611, 1.194353, 1, 1, 1, 1, 1,
0.4078404, -0.1881321, 2.693778, 1, 1, 1, 1, 1,
0.4100945, -0.3893082, 1.890876, 1, 1, 1, 1, 1,
0.413933, -0.9519199, 2.317627, 0, 0, 1, 1, 1,
0.4150053, -0.6013392, 2.881274, 1, 0, 0, 1, 1,
0.4154585, 1.394249, -1.169626, 1, 0, 0, 1, 1,
0.4161362, -0.1484224, 1.267289, 1, 0, 0, 1, 1,
0.4186626, 1.237388, -0.2796673, 1, 0, 0, 1, 1,
0.4259073, -0.06275669, 2.186285, 1, 0, 0, 1, 1,
0.4293745, 0.5315584, -0.1758622, 0, 0, 0, 1, 1,
0.4323067, -0.9090796, 3.776917, 0, 0, 0, 1, 1,
0.4330072, -0.8683866, 2.338844, 0, 0, 0, 1, 1,
0.4370072, -0.713657, 2.318689, 0, 0, 0, 1, 1,
0.4381873, -0.9608272, 3.802355, 0, 0, 0, 1, 1,
0.4382764, 0.136726, 0.4589204, 0, 0, 0, 1, 1,
0.4382903, -0.4364967, 2.793218, 0, 0, 0, 1, 1,
0.4390246, 0.1061585, 1.104494, 1, 1, 1, 1, 1,
0.4394525, -0.7395906, 2.360199, 1, 1, 1, 1, 1,
0.4405271, 3.123675, 1.508041, 1, 1, 1, 1, 1,
0.4405837, 1.178971, 0.1120639, 1, 1, 1, 1, 1,
0.443517, 0.05932284, -0.672982, 1, 1, 1, 1, 1,
0.4449746, 0.7697962, -0.0948026, 1, 1, 1, 1, 1,
0.4454143, 0.779132, 1.553986, 1, 1, 1, 1, 1,
0.4478107, -0.6552535, 3.109726, 1, 1, 1, 1, 1,
0.4494491, 1.322356, 0.0823746, 1, 1, 1, 1, 1,
0.4577562, -0.6234573, 1.784058, 1, 1, 1, 1, 1,
0.4597653, -0.6055072, 2.669548, 1, 1, 1, 1, 1,
0.464996, 0.002828165, 4.184989, 1, 1, 1, 1, 1,
0.4659162, 0.1603587, 1.128288, 1, 1, 1, 1, 1,
0.4680078, -1.317143, 3.208697, 1, 1, 1, 1, 1,
0.4692638, 0.9122785, 1.239648, 1, 1, 1, 1, 1,
0.4710837, -0.5536932, 2.639432, 0, 0, 1, 1, 1,
0.4752689, 0.8898608, 0.8564055, 1, 0, 0, 1, 1,
0.4825403, -0.5886528, 3.245095, 1, 0, 0, 1, 1,
0.4847583, 0.6487863, 1.373113, 1, 0, 0, 1, 1,
0.4867951, -1.341575, 2.93298, 1, 0, 0, 1, 1,
0.4876004, -0.4480734, 3.352266, 1, 0, 0, 1, 1,
0.488947, -0.990178, 1.380978, 0, 0, 0, 1, 1,
0.4892397, -0.7682394, 4.191793, 0, 0, 0, 1, 1,
0.4908533, 1.532362, 0.9789626, 0, 0, 0, 1, 1,
0.4919111, 0.09381307, 0.5427057, 0, 0, 0, 1, 1,
0.4966074, -1.087861, 2.574468, 0, 0, 0, 1, 1,
0.5110942, 0.08761451, 1.535501, 0, 0, 0, 1, 1,
0.514761, -1.517891, 2.660156, 0, 0, 0, 1, 1,
0.5165218, -0.6596586, 2.856056, 1, 1, 1, 1, 1,
0.5166988, 1.788845, -1.079359, 1, 1, 1, 1, 1,
0.5167681, 1.383021, -0.1244605, 1, 1, 1, 1, 1,
0.5178639, -0.7867542, 2.114518, 1, 1, 1, 1, 1,
0.5178661, 0.9321313, 2.863172, 1, 1, 1, 1, 1,
0.5184016, -0.5663313, 4.132274, 1, 1, 1, 1, 1,
0.5201327, -1.886543, 4.463074, 1, 1, 1, 1, 1,
0.5250522, -0.8030596, 3.504221, 1, 1, 1, 1, 1,
0.5261754, 1.799379, 0.5002303, 1, 1, 1, 1, 1,
0.5262946, -0.7339035, 3.44986, 1, 1, 1, 1, 1,
0.5267329, 1.701392, 0.7278879, 1, 1, 1, 1, 1,
0.527899, -0.06620951, 2.789766, 1, 1, 1, 1, 1,
0.5282248, -0.8582074, 1.388621, 1, 1, 1, 1, 1,
0.5334214, -0.5143405, 1.667434, 1, 1, 1, 1, 1,
0.5379084, 1.71779, 1.225678, 1, 1, 1, 1, 1,
0.5395229, -0.981428, 3.084025, 0, 0, 1, 1, 1,
0.5403545, -1.348837, 3.879478, 1, 0, 0, 1, 1,
0.5414744, 0.2831404, 2.261438, 1, 0, 0, 1, 1,
0.5420886, 1.432579, 1.132733, 1, 0, 0, 1, 1,
0.5442404, -0.7201384, 0.7226977, 1, 0, 0, 1, 1,
0.5445381, 0.5731245, 1.632799, 1, 0, 0, 1, 1,
0.5473863, 0.2618991, 1.57638, 0, 0, 0, 1, 1,
0.5630826, -0.1891415, 2.500932, 0, 0, 0, 1, 1,
0.5652648, -0.3943801, 0.4279551, 0, 0, 0, 1, 1,
0.565354, 0.9937851, 0.8134155, 0, 0, 0, 1, 1,
0.5684781, 0.4350563, 1.148281, 0, 0, 0, 1, 1,
0.5687966, 0.2527065, -0.6695812, 0, 0, 0, 1, 1,
0.5738272, 0.5146297, 1.520396, 0, 0, 0, 1, 1,
0.5750564, 0.02419877, 0.3488005, 1, 1, 1, 1, 1,
0.5751878, -0.8332894, 3.361042, 1, 1, 1, 1, 1,
0.5768218, -1.041726, 2.557636, 1, 1, 1, 1, 1,
0.5792898, -1.705885, 0.8591833, 1, 1, 1, 1, 1,
0.5856386, -0.7483239, 1.361394, 1, 1, 1, 1, 1,
0.5861218, 0.5430825, 0.4538116, 1, 1, 1, 1, 1,
0.5863128, 0.2738063, 0.3097002, 1, 1, 1, 1, 1,
0.5930026, -1.829951, 2.108867, 1, 1, 1, 1, 1,
0.594056, 0.3511164, 1.289713, 1, 1, 1, 1, 1,
0.5989965, 1.009925, 0.4104593, 1, 1, 1, 1, 1,
0.5992716, -1.498963, 1.758466, 1, 1, 1, 1, 1,
0.6000319, 0.9302082, 3.195266, 1, 1, 1, 1, 1,
0.6017174, 0.3091729, 0.9385238, 1, 1, 1, 1, 1,
0.6044673, 0.7175739, 1.834065, 1, 1, 1, 1, 1,
0.6095177, 0.03073999, 0.3378104, 1, 1, 1, 1, 1,
0.6106744, -0.7685794, 3.058952, 0, 0, 1, 1, 1,
0.6106785, 1.914194, -1.10387, 1, 0, 0, 1, 1,
0.6109192, 1.973069, 0.7251749, 1, 0, 0, 1, 1,
0.6136658, 0.5093469, 0.1338441, 1, 0, 0, 1, 1,
0.6177893, 0.5740027, 0.08375718, 1, 0, 0, 1, 1,
0.6184561, 0.3282467, 0.3720303, 1, 0, 0, 1, 1,
0.6186511, 2.215881, 0.01897501, 0, 0, 0, 1, 1,
0.6269648, 0.2248176, 2.493961, 0, 0, 0, 1, 1,
0.6315243, 0.8842593, 0.4809563, 0, 0, 0, 1, 1,
0.646112, 0.4915563, 0.9056123, 0, 0, 0, 1, 1,
0.6498522, -1.516411, 2.457758, 0, 0, 0, 1, 1,
0.6523978, 0.4581121, 0.9280788, 0, 0, 0, 1, 1,
0.6535214, 0.3822568, -1.125999, 0, 0, 0, 1, 1,
0.6541116, -0.9632794, 2.617451, 1, 1, 1, 1, 1,
0.65635, -0.3508142, 1.236237, 1, 1, 1, 1, 1,
0.6567459, -0.04788832, 0.2203067, 1, 1, 1, 1, 1,
0.6653432, 1.008176, 3.064756, 1, 1, 1, 1, 1,
0.6690896, -0.5707162, 2.874285, 1, 1, 1, 1, 1,
0.6720509, 0.7936571, 0.7897335, 1, 1, 1, 1, 1,
0.6732714, 0.7453277, 1.582679, 1, 1, 1, 1, 1,
0.6744209, -0.7607185, -0.1603096, 1, 1, 1, 1, 1,
0.6808239, 0.2211234, 2.381314, 1, 1, 1, 1, 1,
0.6858515, -0.2750127, 2.277396, 1, 1, 1, 1, 1,
0.6923671, -0.3981045, 2.765154, 1, 1, 1, 1, 1,
0.7006953, -1.53193, 3.676414, 1, 1, 1, 1, 1,
0.7034408, -0.2812007, 0.5184687, 1, 1, 1, 1, 1,
0.7038323, -0.3451897, 0.8958654, 1, 1, 1, 1, 1,
0.7081875, 2.0861, -0.8362548, 1, 1, 1, 1, 1,
0.7098585, -0.1378297, 2.953962, 0, 0, 1, 1, 1,
0.7127833, 1.417443, 0.9834784, 1, 0, 0, 1, 1,
0.7177218, -0.7095513, 2.247618, 1, 0, 0, 1, 1,
0.7195207, 1.098005, 1.876923, 1, 0, 0, 1, 1,
0.721528, 0.7779422, -1.74128, 1, 0, 0, 1, 1,
0.723036, -0.9207871, 3.601322, 1, 0, 0, 1, 1,
0.7276324, -0.3805704, 4.089621, 0, 0, 0, 1, 1,
0.7282463, 0.422541, 0.5167462, 0, 0, 0, 1, 1,
0.7292916, 0.6549579, -0.7951888, 0, 0, 0, 1, 1,
0.7305397, -0.1371851, 0.9568565, 0, 0, 0, 1, 1,
0.7342263, 0.7757402, 0.5075673, 0, 0, 0, 1, 1,
0.738066, 1.501987, 0.2778346, 0, 0, 0, 1, 1,
0.7444557, -0.9010192, 1.430584, 0, 0, 0, 1, 1,
0.7503668, 1.462106, 0.1863531, 1, 1, 1, 1, 1,
0.7515453, 0.6308014, -0.1346729, 1, 1, 1, 1, 1,
0.7579203, 1.350181, 0.4049155, 1, 1, 1, 1, 1,
0.7622238, -0.6917923, 2.192585, 1, 1, 1, 1, 1,
0.7651832, 0.3861616, 2.644886, 1, 1, 1, 1, 1,
0.7683335, -0.7622542, 1.091427, 1, 1, 1, 1, 1,
0.7734887, 1.053835, 0.0342853, 1, 1, 1, 1, 1,
0.7741514, -0.9652021, 3.177186, 1, 1, 1, 1, 1,
0.7743679, -1.422221, 3.879103, 1, 1, 1, 1, 1,
0.7746207, 1.84799, -0.486353, 1, 1, 1, 1, 1,
0.7782691, -0.6632633, 2.632686, 1, 1, 1, 1, 1,
0.7788182, 0.3447018, 2.114224, 1, 1, 1, 1, 1,
0.7807202, 1.543981, -0.1578816, 1, 1, 1, 1, 1,
0.7820025, 0.7614383, 1.400874, 1, 1, 1, 1, 1,
0.783804, -0.6275327, 1.768482, 1, 1, 1, 1, 1,
0.7840013, 0.9635053, -0.06810291, 0, 0, 1, 1, 1,
0.7841398, 0.6420754, 1.913239, 1, 0, 0, 1, 1,
0.7872031, 0.3211237, 0.8676829, 1, 0, 0, 1, 1,
0.7873033, 1.217862, -0.8477705, 1, 0, 0, 1, 1,
0.7894178, 0.9693326, 0.1455983, 1, 0, 0, 1, 1,
0.7911144, -0.8769615, 0.6004963, 1, 0, 0, 1, 1,
0.7986497, -0.3937401, 3.407672, 0, 0, 0, 1, 1,
0.8092759, -0.3211497, 2.300644, 0, 0, 0, 1, 1,
0.8092897, -0.2106827, 0.9752097, 0, 0, 0, 1, 1,
0.8141144, 0.7001117, 2.095294, 0, 0, 0, 1, 1,
0.815839, -0.1982905, 1.567319, 0, 0, 0, 1, 1,
0.8172239, 2.697123, 2.379669, 0, 0, 0, 1, 1,
0.8190516, 1.127841, 1.080612, 0, 0, 0, 1, 1,
0.8195503, -0.671527, 0.8945256, 1, 1, 1, 1, 1,
0.8264093, 2.054286, -0.07173799, 1, 1, 1, 1, 1,
0.8296069, -0.6309478, 3.510564, 1, 1, 1, 1, 1,
0.830511, -0.293898, 2.184384, 1, 1, 1, 1, 1,
0.8356601, -0.9098222, 2.897237, 1, 1, 1, 1, 1,
0.8417783, -0.4388253, 2.255395, 1, 1, 1, 1, 1,
0.8466551, 0.4721708, 0.5452491, 1, 1, 1, 1, 1,
0.8517197, -0.2508444, 1.363889, 1, 1, 1, 1, 1,
0.8543277, 1.779525, 2.091046, 1, 1, 1, 1, 1,
0.8550031, 0.2139551, 1.443597, 1, 1, 1, 1, 1,
0.8562382, -1.093444, 1.211764, 1, 1, 1, 1, 1,
0.8624736, 0.5460764, 2.298561, 1, 1, 1, 1, 1,
0.8748781, -0.0271674, 2.788385, 1, 1, 1, 1, 1,
0.8774171, -0.4774266, 2.853119, 1, 1, 1, 1, 1,
0.8786438, 0.8759931, 0.6355851, 1, 1, 1, 1, 1,
0.8823017, -0.07643294, 2.217659, 0, 0, 1, 1, 1,
0.8927768, 0.8779048, 1.553353, 1, 0, 0, 1, 1,
0.8928322, 0.1537623, 1.788973, 1, 0, 0, 1, 1,
0.8936399, -0.03689407, -0.8308954, 1, 0, 0, 1, 1,
0.8960685, -0.7689182, 1.311074, 1, 0, 0, 1, 1,
0.8971202, 0.7359461, 0.7923662, 1, 0, 0, 1, 1,
0.8988875, 1.064065, 1.77654, 0, 0, 0, 1, 1,
0.9081563, -1.316428, 1.500806, 0, 0, 0, 1, 1,
0.9169829, 1.184449, 1.215098, 0, 0, 0, 1, 1,
0.9222084, 0.6938938, 2.482445, 0, 0, 0, 1, 1,
0.9263282, -0.174555, 2.048353, 0, 0, 0, 1, 1,
0.9361611, 1.060538, -1.10034, 0, 0, 0, 1, 1,
0.936913, 1.572657, -1.288292, 0, 0, 0, 1, 1,
0.9391062, 1.317908, 0.5832817, 1, 1, 1, 1, 1,
0.942634, 1.490218, 0.806564, 1, 1, 1, 1, 1,
0.9463165, 0.3741758, 0.2016868, 1, 1, 1, 1, 1,
0.9585112, 0.2571751, 0.9157137, 1, 1, 1, 1, 1,
0.9635903, -2.115246, 1.983608, 1, 1, 1, 1, 1,
0.9641702, -1.851413, 1.250457, 1, 1, 1, 1, 1,
0.9685288, -0.9519416, 0.4340173, 1, 1, 1, 1, 1,
0.9731124, 1.311162, 1.178408, 1, 1, 1, 1, 1,
0.9743231, 1.024906, 1.843071, 1, 1, 1, 1, 1,
0.9864267, -0.2058154, 1.733525, 1, 1, 1, 1, 1,
0.9922436, -2.468961, 1.227751, 1, 1, 1, 1, 1,
0.9949957, 0.5355083, 2.518719, 1, 1, 1, 1, 1,
0.9955291, -0.7990614, 1.686327, 1, 1, 1, 1, 1,
0.9967523, 0.239884, 0.9531637, 1, 1, 1, 1, 1,
1.000641, -1.168118, 2.702543, 1, 1, 1, 1, 1,
1.001056, 1.41304, -0.9065207, 0, 0, 1, 1, 1,
1.001242, 0.7939062, -0.3106188, 1, 0, 0, 1, 1,
1.003568, -0.6981953, 1.516986, 1, 0, 0, 1, 1,
1.00891, 0.3090196, 2.469235, 1, 0, 0, 1, 1,
1.012153, 0.4316337, 0.7286257, 1, 0, 0, 1, 1,
1.014717, -0.8694193, 3.783067, 1, 0, 0, 1, 1,
1.018378, 1.176472, 0.05334638, 0, 0, 0, 1, 1,
1.021649, -1.721249, 2.643157, 0, 0, 0, 1, 1,
1.034638, -0.9841741, 2.258059, 0, 0, 0, 1, 1,
1.037162, -0.3309136, 3.737197, 0, 0, 0, 1, 1,
1.037879, 0.6434135, 0.3150807, 0, 0, 0, 1, 1,
1.041462, 0.06480552, 2.252419, 0, 0, 0, 1, 1,
1.04364, -1.360483, 2.55658, 0, 0, 0, 1, 1,
1.050586, -0.7727903, 1.943207, 1, 1, 1, 1, 1,
1.052079, 2.124535, 0.9894792, 1, 1, 1, 1, 1,
1.057552, 0.6238514, 3.05997, 1, 1, 1, 1, 1,
1.076829, 0.4611327, 1.190252, 1, 1, 1, 1, 1,
1.07967, -0.7179472, 2.779111, 1, 1, 1, 1, 1,
1.080759, 1.512216, 0.03304467, 1, 1, 1, 1, 1,
1.083479, -0.662834, 1.003157, 1, 1, 1, 1, 1,
1.091396, -0.5932609, 2.439413, 1, 1, 1, 1, 1,
1.098338, 1.394769, 0.8138998, 1, 1, 1, 1, 1,
1.106673, -0.1202384, 1.722126, 1, 1, 1, 1, 1,
1.109357, -0.3834673, 2.837357, 1, 1, 1, 1, 1,
1.113213, 1.627288, 0.4939216, 1, 1, 1, 1, 1,
1.114728, -0.4994113, 0.7372242, 1, 1, 1, 1, 1,
1.115877, -0.09675134, 1.609105, 1, 1, 1, 1, 1,
1.117044, -0.2703663, 1.943763, 1, 1, 1, 1, 1,
1.121103, 1.633753, 2.231645, 0, 0, 1, 1, 1,
1.145514, -0.8012884, 2.783471, 1, 0, 0, 1, 1,
1.158554, -0.05982551, 1.755165, 1, 0, 0, 1, 1,
1.162663, 0.4586759, 3.015566, 1, 0, 0, 1, 1,
1.164024, 1.57419, 1.080027, 1, 0, 0, 1, 1,
1.165535, -1.183701, 2.378147, 1, 0, 0, 1, 1,
1.1676, -0.3563118, 2.483588, 0, 0, 0, 1, 1,
1.172041, 1.031873, 0.02002865, 0, 0, 0, 1, 1,
1.175992, 1.548466, -0.1432237, 0, 0, 0, 1, 1,
1.177571, 0.2769046, 3.547558, 0, 0, 0, 1, 1,
1.187847, -0.3545531, 0.2785025, 0, 0, 0, 1, 1,
1.19795, 0.9980811, 0.4938928, 0, 0, 0, 1, 1,
1.204275, 0.6629317, 2.106987, 0, 0, 0, 1, 1,
1.205842, -1.562517, 2.116879, 1, 1, 1, 1, 1,
1.210652, -0.0505902, 0.5050772, 1, 1, 1, 1, 1,
1.224906, -2.351028, 3.760704, 1, 1, 1, 1, 1,
1.229902, -0.4875068, 0.6247239, 1, 1, 1, 1, 1,
1.230257, 0.8312605, 2.887795, 1, 1, 1, 1, 1,
1.236809, 0.06254628, 3.812078, 1, 1, 1, 1, 1,
1.241481, -0.2794599, 1.807446, 1, 1, 1, 1, 1,
1.241819, 0.7916885, 1.21113, 1, 1, 1, 1, 1,
1.244935, 0.2891677, 2.032717, 1, 1, 1, 1, 1,
1.245752, 0.6569145, 0.8587897, 1, 1, 1, 1, 1,
1.256277, -0.5352355, 3.999948, 1, 1, 1, 1, 1,
1.262469, 1.634931, 1.321006, 1, 1, 1, 1, 1,
1.279427, 0.3277549, 2.170045, 1, 1, 1, 1, 1,
1.284629, -0.4313779, 1.601464, 1, 1, 1, 1, 1,
1.294359, 0.679314, 0.5923705, 1, 1, 1, 1, 1,
1.318234, -1.470048, 1.078527, 0, 0, 1, 1, 1,
1.322982, 0.8002269, 1.291995, 1, 0, 0, 1, 1,
1.3232, -0.3036679, 1.913515, 1, 0, 0, 1, 1,
1.330346, -1.364662, 2.25741, 1, 0, 0, 1, 1,
1.340169, 0.3050022, 0.2525508, 1, 0, 0, 1, 1,
1.342542, 1.607209, 0.4140906, 1, 0, 0, 1, 1,
1.354419, 0.2591637, 0.2010937, 0, 0, 0, 1, 1,
1.365116, 0.4072658, 1.727731, 0, 0, 0, 1, 1,
1.373571, 0.8475819, 0.6087629, 0, 0, 0, 1, 1,
1.387547, -1.020317, 4.352135, 0, 0, 0, 1, 1,
1.400979, -0.8046322, 0.651697, 0, 0, 0, 1, 1,
1.401601, 1.293451, 0.3368476, 0, 0, 0, 1, 1,
1.403598, -1.374024, 1.690342, 0, 0, 0, 1, 1,
1.404384, 0.1506838, 2.999936, 1, 1, 1, 1, 1,
1.429944, -1.968167, 1.532894, 1, 1, 1, 1, 1,
1.432039, 0.1016053, 2.966026, 1, 1, 1, 1, 1,
1.43253, -0.4556032, 1.408514, 1, 1, 1, 1, 1,
1.432939, -0.540688, 3.44834, 1, 1, 1, 1, 1,
1.441112, 0.7536433, 2.423761, 1, 1, 1, 1, 1,
1.444561, 1.023009, 1.252328, 1, 1, 1, 1, 1,
1.453913, 0.409668, 1.624859, 1, 1, 1, 1, 1,
1.455989, 3.016813, -0.1040144, 1, 1, 1, 1, 1,
1.457193, 2.346271, 0.5779563, 1, 1, 1, 1, 1,
1.474656, -0.9928504, 2.129584, 1, 1, 1, 1, 1,
1.47789, 0.7729875, 1.009816, 1, 1, 1, 1, 1,
1.480403, -2.333061, 2.760648, 1, 1, 1, 1, 1,
1.490716, -0.6231095, 3.007725, 1, 1, 1, 1, 1,
1.496054, 0.3396871, 1.212799, 1, 1, 1, 1, 1,
1.497381, 0.9841692, 1.305929, 0, 0, 1, 1, 1,
1.500155, -0.5785313, 0.807925, 1, 0, 0, 1, 1,
1.50288, 0.5546109, 0.1542841, 1, 0, 0, 1, 1,
1.505094, -0.05453862, 1.183307, 1, 0, 0, 1, 1,
1.506731, 0.4227901, 1.128958, 1, 0, 0, 1, 1,
1.508619, 2.261934, 0.04939166, 1, 0, 0, 1, 1,
1.521668, -0.429968, 0.4426876, 0, 0, 0, 1, 1,
1.529904, 0.3326226, 1.042738, 0, 0, 0, 1, 1,
1.538229, 0.7136332, 0.4440557, 0, 0, 0, 1, 1,
1.545738, -0.2846091, 2.410605, 0, 0, 0, 1, 1,
1.54602, -0.9246674, 1.985169, 0, 0, 0, 1, 1,
1.552993, 0.5485244, 0.8170859, 0, 0, 0, 1, 1,
1.562015, 1.908868, 1.988441, 0, 0, 0, 1, 1,
1.562724, 0.3959971, 0.8324217, 1, 1, 1, 1, 1,
1.563148, 0.5077386, 1.32405, 1, 1, 1, 1, 1,
1.56639, 0.9056015, 0.3030312, 1, 1, 1, 1, 1,
1.567128, -1.109971, 1.386503, 1, 1, 1, 1, 1,
1.610826, -0.8600068, 1.32342, 1, 1, 1, 1, 1,
1.612989, -1.363746, 0.3833492, 1, 1, 1, 1, 1,
1.622229, -0.1196826, 1.044439, 1, 1, 1, 1, 1,
1.631189, -2.279936, 2.80719, 1, 1, 1, 1, 1,
1.638239, 0.9355925, 1.955661, 1, 1, 1, 1, 1,
1.638792, -1.308532, 2.596246, 1, 1, 1, 1, 1,
1.658641, -0.4657881, 2.30159, 1, 1, 1, 1, 1,
1.690596, 0.8405482, -0.05961775, 1, 1, 1, 1, 1,
1.743758, 0.0002073173, 3.430454, 1, 1, 1, 1, 1,
1.746076, 0.3687805, 1.628537, 1, 1, 1, 1, 1,
1.746262, 1.223265, 0.1148008, 1, 1, 1, 1, 1,
1.76023, -0.8439372, 2.436693, 0, 0, 1, 1, 1,
1.760788, 0.8098097, -0.4109747, 1, 0, 0, 1, 1,
1.761437, 1.920746, -0.004647009, 1, 0, 0, 1, 1,
1.793227, -0.941957, 2.450951, 1, 0, 0, 1, 1,
1.828333, 1.048245, -0.2712595, 1, 0, 0, 1, 1,
1.835873, 1.353426, 0.3093154, 1, 0, 0, 1, 1,
1.845114, 1.174801, 1.35322, 0, 0, 0, 1, 1,
1.900055, -0.2380685, -0.5654957, 0, 0, 0, 1, 1,
1.919979, 0.7396371, 0.2453239, 0, 0, 0, 1, 1,
1.941911, -0.4036514, 0.2388738, 0, 0, 0, 1, 1,
1.955597, 0.3795118, 0.1101317, 0, 0, 0, 1, 1,
1.960658, 0.6830507, 3.646101, 0, 0, 0, 1, 1,
1.961683, 0.2409571, 1.563612, 0, 0, 0, 1, 1,
1.964896, 0.7212404, 0.2266356, 1, 1, 1, 1, 1,
1.995669, -2.01643, 4.38609, 1, 1, 1, 1, 1,
2.001081, 1.891324, -0.2045829, 1, 1, 1, 1, 1,
2.011658, -0.6318265, 1.534456, 1, 1, 1, 1, 1,
2.012419, -0.594071, 2.913107, 1, 1, 1, 1, 1,
2.028856, -0.5538353, 2.414016, 1, 1, 1, 1, 1,
2.029093, 0.7280464, 0.09671819, 1, 1, 1, 1, 1,
2.047815, 0.8441208, 1.574546, 1, 1, 1, 1, 1,
2.128343, 0.03948247, 1.102979, 1, 1, 1, 1, 1,
2.139469, 0.2697119, 1.627923, 1, 1, 1, 1, 1,
2.147537, 0.08673096, 2.659411, 1, 1, 1, 1, 1,
2.163785, -1.609854, 1.433138, 1, 1, 1, 1, 1,
2.172611, -1.633793, 1.729171, 1, 1, 1, 1, 1,
2.188203, -0.6845355, 1.496426, 1, 1, 1, 1, 1,
2.197724, -1.774264, 2.258237, 1, 1, 1, 1, 1,
2.220263, 0.8183373, 2.23207, 0, 0, 1, 1, 1,
2.22993, -0.5601429, 1.812231, 1, 0, 0, 1, 1,
2.260825, -1.583266, 1.944815, 1, 0, 0, 1, 1,
2.283656, 1.513526, 1.810422, 1, 0, 0, 1, 1,
2.29474, 0.8174935, 0.6947663, 1, 0, 0, 1, 1,
2.306851, -0.04741847, 0.688975, 1, 0, 0, 1, 1,
2.307579, -3.469927, 3.356475, 0, 0, 0, 1, 1,
2.33577, 0.8838752, -0.289844, 0, 0, 0, 1, 1,
2.355138, 1.196333, 0.3749575, 0, 0, 0, 1, 1,
2.37378, -0.4449326, 1.249134, 0, 0, 0, 1, 1,
2.426047, -1.283047, 1.476531, 0, 0, 0, 1, 1,
2.451774, 0.7551776, 1.684515, 0, 0, 0, 1, 1,
2.464547, -0.8487744, 1.901355, 0, 0, 0, 1, 1,
2.52521, 1.157174, -0.3231254, 1, 1, 1, 1, 1,
2.535403, 0.6109728, 2.447011, 1, 1, 1, 1, 1,
2.595551, -1.460964, 2.322977, 1, 1, 1, 1, 1,
2.62688, -0.9255739, 3.381409, 1, 1, 1, 1, 1,
2.642629, -0.8027712, -0.7368002, 1, 1, 1, 1, 1,
2.645059, 0.8755597, 0.2765306, 1, 1, 1, 1, 1,
3.304386, -0.6239345, 2.549977, 1, 1, 1, 1, 1
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
var radius = 9.612108;
var distance = 33.76212;
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
mvMatrix.translate( 0.4343948, 0.2216113, 0.4546945 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.76212);
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
