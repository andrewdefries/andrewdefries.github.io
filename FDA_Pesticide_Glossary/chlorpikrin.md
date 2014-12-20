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
-3.426739, -0.6195037, -1.515048, 1, 0, 0, 1,
-3.07091, -0.674587, -1.149217, 1, 0.007843138, 0, 1,
-3.008264, -1.30094, -2.43152, 1, 0.01176471, 0, 1,
-2.858152, 0.6100554, -1.094156, 1, 0.01960784, 0, 1,
-2.807369, 1.441058, -0.354366, 1, 0.02352941, 0, 1,
-2.667366, -0.8617967, -1.781446, 1, 0.03137255, 0, 1,
-2.57424, -0.5457252, -2.547927, 1, 0.03529412, 0, 1,
-2.44161, 2.507903, -1.598216, 1, 0.04313726, 0, 1,
-2.401348, 1.013671, -0.4151854, 1, 0.04705882, 0, 1,
-2.35806, 0.146663, -1.031618, 1, 0.05490196, 0, 1,
-2.269698, -0.1914121, -3.936034, 1, 0.05882353, 0, 1,
-2.261435, -0.02776957, -2.489855, 1, 0.06666667, 0, 1,
-2.181416, 0.4510719, -0.768371, 1, 0.07058824, 0, 1,
-2.177489, -0.9931642, -1.353266, 1, 0.07843138, 0, 1,
-2.166788, 0.2014359, -0.9503419, 1, 0.08235294, 0, 1,
-2.142914, -1.279858, -1.904409, 1, 0.09019608, 0, 1,
-2.140393, 0.2268201, -0.4286017, 1, 0.09411765, 0, 1,
-2.120679, -0.4672496, -2.100405, 1, 0.1019608, 0, 1,
-2.109144, 0.6489595, -1.083942, 1, 0.1098039, 0, 1,
-2.059799, 0.2243504, -0.8036401, 1, 0.1137255, 0, 1,
-2.052679, -0.1692313, -1.754073, 1, 0.1215686, 0, 1,
-2.048189, -0.2626753, -1.916382, 1, 0.1254902, 0, 1,
-1.981045, 1.557843, 1.139835, 1, 0.1333333, 0, 1,
-1.970105, 1.46063, -1.190319, 1, 0.1372549, 0, 1,
-1.930567, 0.6641232, -1.014363, 1, 0.145098, 0, 1,
-1.930459, 0.3216826, -2.513419, 1, 0.1490196, 0, 1,
-1.886397, -0.2095694, -3.4733, 1, 0.1568628, 0, 1,
-1.879141, -0.5853717, -2.357937, 1, 0.1607843, 0, 1,
-1.865298, 0.21316, -1.992608, 1, 0.1686275, 0, 1,
-1.86126, -0.06388699, -3.578362, 1, 0.172549, 0, 1,
-1.848592, -0.3450175, -0.5213564, 1, 0.1803922, 0, 1,
-1.813491, -0.5071558, -3.899247, 1, 0.1843137, 0, 1,
-1.781903, -0.707898, -1.699245, 1, 0.1921569, 0, 1,
-1.766368, 1.187069, -0.6373055, 1, 0.1960784, 0, 1,
-1.764554, 1.174094, -0.1390067, 1, 0.2039216, 0, 1,
-1.737336, 0.334455, -3.108938, 1, 0.2117647, 0, 1,
-1.720184, -0.07301969, -1.10416, 1, 0.2156863, 0, 1,
-1.709727, -0.1567038, -2.728532, 1, 0.2235294, 0, 1,
-1.684742, 0.8790332, -0.6229104, 1, 0.227451, 0, 1,
-1.684217, 2.165767, 0.4952967, 1, 0.2352941, 0, 1,
-1.672658, -0.08522063, -3.54651, 1, 0.2392157, 0, 1,
-1.657981, 0.1772079, -0.5654489, 1, 0.2470588, 0, 1,
-1.657475, 0.967365, -0.2467799, 1, 0.2509804, 0, 1,
-1.603009, 0.9630243, -1.282671, 1, 0.2588235, 0, 1,
-1.59505, 0.3871375, -2.722609, 1, 0.2627451, 0, 1,
-1.583658, 0.9815041, -1.18912, 1, 0.2705882, 0, 1,
-1.576915, -0.7143552, -1.899892, 1, 0.2745098, 0, 1,
-1.576881, -1.303119, -1.606596, 1, 0.282353, 0, 1,
-1.575814, -0.0366919, 0.5725836, 1, 0.2862745, 0, 1,
-1.547974, -0.04653827, -2.604582, 1, 0.2941177, 0, 1,
-1.537915, -3.641862, -2.093974, 1, 0.3019608, 0, 1,
-1.533121, -0.3178815, -3.03308, 1, 0.3058824, 0, 1,
-1.527347, -1.322974, -2.927036, 1, 0.3137255, 0, 1,
-1.526421, -1.098802, -1.180119, 1, 0.3176471, 0, 1,
-1.508935, 0.394275, -1.703133, 1, 0.3254902, 0, 1,
-1.504967, 1.210049, -1.894131, 1, 0.3294118, 0, 1,
-1.504395, 1.024015, -1.685261, 1, 0.3372549, 0, 1,
-1.498306, -0.799284, -1.479567, 1, 0.3411765, 0, 1,
-1.487387, 0.008172407, 0.004457376, 1, 0.3490196, 0, 1,
-1.486348, -0.9841182, -2.726241, 1, 0.3529412, 0, 1,
-1.475909, 2.504416, -0.7848044, 1, 0.3607843, 0, 1,
-1.4734, -0.05575352, -0.8974712, 1, 0.3647059, 0, 1,
-1.46513, -0.9427644, -2.214998, 1, 0.372549, 0, 1,
-1.455341, 0.5061362, -0.6204692, 1, 0.3764706, 0, 1,
-1.45348, 0.6855964, -2.09885, 1, 0.3843137, 0, 1,
-1.45139, 0.4678847, -0.6730947, 1, 0.3882353, 0, 1,
-1.45086, 1.111084, -1.095785, 1, 0.3960784, 0, 1,
-1.45055, -0.1207065, 0.653217, 1, 0.4039216, 0, 1,
-1.442247, -1.362214, -4.730261, 1, 0.4078431, 0, 1,
-1.439643, 1.304857, 0.3317184, 1, 0.4156863, 0, 1,
-1.432129, 0.3008878, -1.691411, 1, 0.4196078, 0, 1,
-1.430314, -0.5158693, -3.390129, 1, 0.427451, 0, 1,
-1.427118, -0.05744241, 0.006580407, 1, 0.4313726, 0, 1,
-1.421395, -2.141835, -1.819977, 1, 0.4392157, 0, 1,
-1.417527, 0.7884446, -0.09149149, 1, 0.4431373, 0, 1,
-1.410554, -4.066118, -2.148078, 1, 0.4509804, 0, 1,
-1.401968, -0.2095698, -3.312017, 1, 0.454902, 0, 1,
-1.396811, 1.378103, -1.828487, 1, 0.4627451, 0, 1,
-1.394499, -0.02067917, -1.76735, 1, 0.4666667, 0, 1,
-1.394024, 0.1981446, -1.273171, 1, 0.4745098, 0, 1,
-1.391698, 1.187868, -1.186319, 1, 0.4784314, 0, 1,
-1.388178, 1.801016, -0.7974373, 1, 0.4862745, 0, 1,
-1.379212, 1.28559, 0.2979389, 1, 0.4901961, 0, 1,
-1.366848, -0.5024341, -1.825277, 1, 0.4980392, 0, 1,
-1.356208, -0.7896681, -1.838859, 1, 0.5058824, 0, 1,
-1.334367, -1.205227, -1.386114, 1, 0.509804, 0, 1,
-1.324331, 0.2724123, -2.223163, 1, 0.5176471, 0, 1,
-1.314992, 1.145415, -1.232889, 1, 0.5215687, 0, 1,
-1.31109, 1.075394, 0.9856207, 1, 0.5294118, 0, 1,
-1.310483, 1.816352, 1.328144, 1, 0.5333334, 0, 1,
-1.301092, 0.03489952, -1.042326, 1, 0.5411765, 0, 1,
-1.300555, -0.4077085, -1.337443, 1, 0.5450981, 0, 1,
-1.297001, -0.4752367, -3.969548, 1, 0.5529412, 0, 1,
-1.292668, -0.5796145, -2.051464, 1, 0.5568628, 0, 1,
-1.292655, 0.2933277, -0.5060697, 1, 0.5647059, 0, 1,
-1.291444, 2.019975, -0.1056995, 1, 0.5686275, 0, 1,
-1.287692, -0.6201842, -1.20708, 1, 0.5764706, 0, 1,
-1.286907, 1.900254, -0.1827641, 1, 0.5803922, 0, 1,
-1.285276, 0.6312479, -1.794301, 1, 0.5882353, 0, 1,
-1.280192, -0.00228256, -1.682961, 1, 0.5921569, 0, 1,
-1.271873, -0.693311, -3.344309, 1, 0.6, 0, 1,
-1.266825, 0.1590687, -1.633869, 1, 0.6078432, 0, 1,
-1.264189, 0.01083661, -1.779506, 1, 0.6117647, 0, 1,
-1.260668, 1.602676, -0.430388, 1, 0.6196079, 0, 1,
-1.252636, 0.1020039, 0.7465429, 1, 0.6235294, 0, 1,
-1.246839, 0.5780212, -1.042455, 1, 0.6313726, 0, 1,
-1.243521, -1.468543, -5.145873, 1, 0.6352941, 0, 1,
-1.240645, -1.62518, -1.787009, 1, 0.6431373, 0, 1,
-1.23968, 0.3925803, -0.8612975, 1, 0.6470588, 0, 1,
-1.222555, 0.7495177, -1.182173, 1, 0.654902, 0, 1,
-1.212681, -0.3211291, -2.614631, 1, 0.6588235, 0, 1,
-1.207461, 0.7115386, -1.994693, 1, 0.6666667, 0, 1,
-1.200177, 1.287261, 0.3760567, 1, 0.6705883, 0, 1,
-1.197295, -0.6334835, -2.997155, 1, 0.6784314, 0, 1,
-1.187792, -0.869503, -2.981445, 1, 0.682353, 0, 1,
-1.185941, 2.577621, -0.6888412, 1, 0.6901961, 0, 1,
-1.181695, 0.8087336, 0.590423, 1, 0.6941177, 0, 1,
-1.154572, 0.2463781, -1.912371, 1, 0.7019608, 0, 1,
-1.146891, -0.2946687, -2.808978, 1, 0.7098039, 0, 1,
-1.126649, 0.6643431, -0.9955834, 1, 0.7137255, 0, 1,
-1.116071, 1.448988, -0.7346344, 1, 0.7215686, 0, 1,
-1.112939, -1.007118, -2.792443, 1, 0.7254902, 0, 1,
-1.108824, 0.4648809, -1.450927, 1, 0.7333333, 0, 1,
-1.099206, 0.7450929, -2.958984, 1, 0.7372549, 0, 1,
-1.098302, 0.8066271, -0.3765924, 1, 0.7450981, 0, 1,
-1.095957, 0.8558511, -0.04349305, 1, 0.7490196, 0, 1,
-1.08806, -0.7676061, -1.987467, 1, 0.7568628, 0, 1,
-1.067135, -0.09417327, -3.130648, 1, 0.7607843, 0, 1,
-1.062065, -0.0877055, 0.9242432, 1, 0.7686275, 0, 1,
-1.05593, 0.5365523, -2.205245, 1, 0.772549, 0, 1,
-1.053342, 0.6271337, 1.815533, 1, 0.7803922, 0, 1,
-1.048078, 0.2560339, -0.4238801, 1, 0.7843137, 0, 1,
-1.046556, -0.1220543, -1.921447, 1, 0.7921569, 0, 1,
-1.043006, -0.7841694, -3.19876, 1, 0.7960784, 0, 1,
-1.038628, 0.3161707, -2.37519, 1, 0.8039216, 0, 1,
-1.033545, -1.24651, -2.54684, 1, 0.8117647, 0, 1,
-1.033204, -0.5252324, -2.219597, 1, 0.8156863, 0, 1,
-1.017347, 1.23088, -1.934799, 1, 0.8235294, 0, 1,
-1.013742, 2.146952, -0.1918446, 1, 0.827451, 0, 1,
-1.008187, -0.8211777, -1.766368, 1, 0.8352941, 0, 1,
-1.006478, -0.0563485, -0.9465196, 1, 0.8392157, 0, 1,
-0.9974467, -0.2795888, -3.192196, 1, 0.8470588, 0, 1,
-0.9961807, 0.3104182, -3.6962, 1, 0.8509804, 0, 1,
-0.9959247, 0.683644, -1.873278, 1, 0.8588235, 0, 1,
-0.9929827, 0.05711685, -2.089082, 1, 0.8627451, 0, 1,
-0.986782, 0.08466462, 0.5219731, 1, 0.8705882, 0, 1,
-0.9848507, 0.2281988, -1.618884, 1, 0.8745098, 0, 1,
-0.9812722, 2.664613, -0.002645299, 1, 0.8823529, 0, 1,
-0.9800762, -0.1326223, -2.77455, 1, 0.8862745, 0, 1,
-0.9796164, -0.3326733, -3.156054, 1, 0.8941177, 0, 1,
-0.9741009, -1.497724, -2.897536, 1, 0.8980392, 0, 1,
-0.9731877, 0.3662605, -3.118184, 1, 0.9058824, 0, 1,
-0.9726607, -2.147999, -4.594362, 1, 0.9137255, 0, 1,
-0.966311, -1.002899, -2.65357, 1, 0.9176471, 0, 1,
-0.964166, -0.1138916, 0.0008313287, 1, 0.9254902, 0, 1,
-0.9633557, -2.048453, -1.080345, 1, 0.9294118, 0, 1,
-0.9607487, -1.047009, -4.109951, 1, 0.9372549, 0, 1,
-0.9574741, -0.8804916, -2.116251, 1, 0.9411765, 0, 1,
-0.9555824, -0.7783172, -2.912115, 1, 0.9490196, 0, 1,
-0.9543815, 1.568823, -0.4866348, 1, 0.9529412, 0, 1,
-0.9509087, -0.6761901, -1.648543, 1, 0.9607843, 0, 1,
-0.9360586, -0.4309015, -2.010083, 1, 0.9647059, 0, 1,
-0.9356015, -1.857734, -3.259235, 1, 0.972549, 0, 1,
-0.9325292, 0.2884361, -2.636533, 1, 0.9764706, 0, 1,
-0.9323907, 0.1715328, -3.008523, 1, 0.9843137, 0, 1,
-0.9276438, -1.752955, -2.383348, 1, 0.9882353, 0, 1,
-0.9272496, 0.1771315, -0.9175389, 1, 0.9960784, 0, 1,
-0.9248722, 1.527466, -0.5588365, 0.9960784, 1, 0, 1,
-0.921584, 1.438419, -0.9901147, 0.9921569, 1, 0, 1,
-0.9189521, 0.6805386, -1.888636, 0.9843137, 1, 0, 1,
-0.9149979, 0.8183158, -1.655971, 0.9803922, 1, 0, 1,
-0.9134344, -0.01019544, -1.278533, 0.972549, 1, 0, 1,
-0.912641, -0.9686923, -1.050998, 0.9686275, 1, 0, 1,
-0.9087184, -1.010569, -2.689766, 0.9607843, 1, 0, 1,
-0.908459, -1.046378, -1.664917, 0.9568627, 1, 0, 1,
-0.9058276, 0.5956658, 0.2565579, 0.9490196, 1, 0, 1,
-0.9012843, -0.9249474, -2.119893, 0.945098, 1, 0, 1,
-0.9006361, 0.3282126, -2.545585, 0.9372549, 1, 0, 1,
-0.9004499, 0.03290046, 0.2056145, 0.9333333, 1, 0, 1,
-0.8948353, 1.31796, -0.5309995, 0.9254902, 1, 0, 1,
-0.8897026, 1.147521, 0.1389374, 0.9215686, 1, 0, 1,
-0.8888994, 1.354567, -1.219932, 0.9137255, 1, 0, 1,
-0.887934, -0.7059025, -2.365936, 0.9098039, 1, 0, 1,
-0.8798164, -0.4185083, -1.90668, 0.9019608, 1, 0, 1,
-0.8750352, -0.3636087, -2.51664, 0.8941177, 1, 0, 1,
-0.8728747, 0.01915003, -2.116257, 0.8901961, 1, 0, 1,
-0.8727682, 0.6231391, -0.6566449, 0.8823529, 1, 0, 1,
-0.8619159, 0.598279, -2.604812, 0.8784314, 1, 0, 1,
-0.8598352, -0.3176598, -2.580095, 0.8705882, 1, 0, 1,
-0.8551412, 0.3842461, -1.965201, 0.8666667, 1, 0, 1,
-0.8522691, -0.6394408, -2.800124, 0.8588235, 1, 0, 1,
-0.8469996, -0.3725519, -1.963596, 0.854902, 1, 0, 1,
-0.8401167, 2.714946, -1.4948, 0.8470588, 1, 0, 1,
-0.8373151, 1.112319, -1.615711, 0.8431373, 1, 0, 1,
-0.8308571, 0.9102414, -1.082643, 0.8352941, 1, 0, 1,
-0.8283666, 0.3204329, -0.5248865, 0.8313726, 1, 0, 1,
-0.824728, -0.6850787, -3.122271, 0.8235294, 1, 0, 1,
-0.8185924, -1.144881, -2.966255, 0.8196079, 1, 0, 1,
-0.8085209, 0.03413332, -2.025404, 0.8117647, 1, 0, 1,
-0.8074031, -0.09886411, -1.419312, 0.8078431, 1, 0, 1,
-0.8071173, 1.122264, -0.7174857, 0.8, 1, 0, 1,
-0.8012522, -1.011023, -1.712346, 0.7921569, 1, 0, 1,
-0.7927744, -1.522509, -2.374362, 0.7882353, 1, 0, 1,
-0.7771227, -1.153728, -3.860262, 0.7803922, 1, 0, 1,
-0.7758241, -3.296938, -3.648979, 0.7764706, 1, 0, 1,
-0.7742787, 0.0750605, -2.91421, 0.7686275, 1, 0, 1,
-0.7666752, -0.9323395, -1.096779, 0.7647059, 1, 0, 1,
-0.7544015, -1.32852, -1.102407, 0.7568628, 1, 0, 1,
-0.7512531, -0.1181887, -1.615381, 0.7529412, 1, 0, 1,
-0.7465945, 0.1496106, -1.620732, 0.7450981, 1, 0, 1,
-0.7451411, -0.4165888, -1.789111, 0.7411765, 1, 0, 1,
-0.7449064, -1.460057, -3.093316, 0.7333333, 1, 0, 1,
-0.7412369, 0.6320646, 0.4494987, 0.7294118, 1, 0, 1,
-0.737511, 1.466865, -0.6159469, 0.7215686, 1, 0, 1,
-0.7359554, -0.6605224, -2.735911, 0.7176471, 1, 0, 1,
-0.7341233, -1.233914, -4.106529, 0.7098039, 1, 0, 1,
-0.7338542, 0.1832066, -1.786275, 0.7058824, 1, 0, 1,
-0.7336529, 0.6966391, -0.5436442, 0.6980392, 1, 0, 1,
-0.731719, 1.678058, 0.3895228, 0.6901961, 1, 0, 1,
-0.7316082, -0.4833938, -3.140352, 0.6862745, 1, 0, 1,
-0.7293198, 0.3810977, -1.357729, 0.6784314, 1, 0, 1,
-0.7270137, 0.5975621, -2.038518, 0.6745098, 1, 0, 1,
-0.7087942, 0.2388706, -2.19173, 0.6666667, 1, 0, 1,
-0.7073972, 1.402568, -0.6544392, 0.6627451, 1, 0, 1,
-0.7059262, 1.938059, -0.3866011, 0.654902, 1, 0, 1,
-0.704506, -0.2775948, -1.804194, 0.6509804, 1, 0, 1,
-0.7029203, 0.6271063, -0.7550344, 0.6431373, 1, 0, 1,
-0.7020129, 1.161589, -0.3913063, 0.6392157, 1, 0, 1,
-0.6960876, -0.2535408, -0.8271388, 0.6313726, 1, 0, 1,
-0.6948338, 0.5638672, -0.8884776, 0.627451, 1, 0, 1,
-0.6946251, -0.530276, -2.688161, 0.6196079, 1, 0, 1,
-0.6939085, -0.2792564, -2.163594, 0.6156863, 1, 0, 1,
-0.6938801, 0.7805668, 0.9238223, 0.6078432, 1, 0, 1,
-0.6883966, 0.7911747, -1.51159, 0.6039216, 1, 0, 1,
-0.6785815, 0.221576, -0.3521104, 0.5960785, 1, 0, 1,
-0.6777627, 1.022659, -1.583237, 0.5882353, 1, 0, 1,
-0.6735963, 0.1191658, -1.446053, 0.5843138, 1, 0, 1,
-0.6726453, -1.160224, -2.887038, 0.5764706, 1, 0, 1,
-0.6712232, -0.6375059, -2.357948, 0.572549, 1, 0, 1,
-0.6649827, -0.7800061, -2.294752, 0.5647059, 1, 0, 1,
-0.6600952, 0.9319811, -1.792411, 0.5607843, 1, 0, 1,
-0.6599854, 0.2833788, -0.8523941, 0.5529412, 1, 0, 1,
-0.659835, -1.910954, -4.208971, 0.5490196, 1, 0, 1,
-0.6567498, -0.9188741, -1.439443, 0.5411765, 1, 0, 1,
-0.6505737, 1.150941, -0.5520985, 0.5372549, 1, 0, 1,
-0.647688, 0.5435863, -0.8441155, 0.5294118, 1, 0, 1,
-0.6451484, 0.9894087, -3.061256, 0.5254902, 1, 0, 1,
-0.6410295, 2.508197, -0.552897, 0.5176471, 1, 0, 1,
-0.6383142, 0.2041048, 0.1461327, 0.5137255, 1, 0, 1,
-0.6355349, -0.007150255, -0.1365845, 0.5058824, 1, 0, 1,
-0.6340262, 0.8361645, 0.4933805, 0.5019608, 1, 0, 1,
-0.6328844, -0.4423689, -1.864651, 0.4941176, 1, 0, 1,
-0.6325229, 1.351177, -0.7273487, 0.4862745, 1, 0, 1,
-0.6320651, 0.8926115, -0.05499155, 0.4823529, 1, 0, 1,
-0.6320473, 0.9640166, 0.8856387, 0.4745098, 1, 0, 1,
-0.6305637, -0.2751996, -1.422131, 0.4705882, 1, 0, 1,
-0.6290072, 1.012205, 0.4997615, 0.4627451, 1, 0, 1,
-0.6284006, -0.1006246, -3.2052, 0.4588235, 1, 0, 1,
-0.6278443, -0.1186265, -1.738414, 0.4509804, 1, 0, 1,
-0.6121536, -1.388974, -1.482305, 0.4470588, 1, 0, 1,
-0.6028177, -1.96383, -3.475385, 0.4392157, 1, 0, 1,
-0.5923355, 1.208843, 0.8111418, 0.4352941, 1, 0, 1,
-0.5898275, -0.4303618, -3.099375, 0.427451, 1, 0, 1,
-0.582395, 1.018282, -0.6264955, 0.4235294, 1, 0, 1,
-0.5804772, -0.2096314, -2.031613, 0.4156863, 1, 0, 1,
-0.5755935, 1.074969, -2.371684, 0.4117647, 1, 0, 1,
-0.5744258, -0.4427409, -3.535118, 0.4039216, 1, 0, 1,
-0.5696083, 0.9219165, -0.8661823, 0.3960784, 1, 0, 1,
-0.5622323, 0.6165763, 0.4563349, 0.3921569, 1, 0, 1,
-0.55793, 0.9689774, -0.4908873, 0.3843137, 1, 0, 1,
-0.551802, 0.2171592, -0.4573222, 0.3803922, 1, 0, 1,
-0.5511441, -1.333236, -2.391098, 0.372549, 1, 0, 1,
-0.5488706, 0.3348874, -1.026382, 0.3686275, 1, 0, 1,
-0.5368094, -2.195999, -2.533491, 0.3607843, 1, 0, 1,
-0.525, -0.7764799, -1.825032, 0.3568628, 1, 0, 1,
-0.5220819, 0.04816169, -0.9436094, 0.3490196, 1, 0, 1,
-0.5165573, -1.624863, -4.474611, 0.345098, 1, 0, 1,
-0.5148595, -0.258215, -2.606505, 0.3372549, 1, 0, 1,
-0.5130264, 0.8370323, -0.1049768, 0.3333333, 1, 0, 1,
-0.5018504, 0.6512913, -2.006028, 0.3254902, 1, 0, 1,
-0.4962584, -0.3770651, -0.9984478, 0.3215686, 1, 0, 1,
-0.4923782, 0.6716996, -0.4435833, 0.3137255, 1, 0, 1,
-0.4916598, 0.6178654, -0.8996162, 0.3098039, 1, 0, 1,
-0.4878272, -0.7980046, -1.881841, 0.3019608, 1, 0, 1,
-0.487218, -0.07331853, -1.108299, 0.2941177, 1, 0, 1,
-0.4815232, 0.7820913, -0.2213154, 0.2901961, 1, 0, 1,
-0.479494, -1.726928, -3.708059, 0.282353, 1, 0, 1,
-0.4793458, 0.5111749, -0.8765947, 0.2784314, 1, 0, 1,
-0.4766987, 0.2658803, -0.420647, 0.2705882, 1, 0, 1,
-0.4751547, 0.592732, -1.193133, 0.2666667, 1, 0, 1,
-0.4698835, 1.178126, -0.8437796, 0.2588235, 1, 0, 1,
-0.4687986, 2.065072, -0.09097135, 0.254902, 1, 0, 1,
-0.4674556, 2.728729, -0.2111559, 0.2470588, 1, 0, 1,
-0.4607889, -0.1592396, -0.8759872, 0.2431373, 1, 0, 1,
-0.4597634, -1.701185, -1.450336, 0.2352941, 1, 0, 1,
-0.4575589, -0.3572789, -2.214962, 0.2313726, 1, 0, 1,
-0.4506075, -0.8326679, -3.568765, 0.2235294, 1, 0, 1,
-0.4505831, 0.138602, -1.685838, 0.2196078, 1, 0, 1,
-0.4463094, 1.873601, -0.6043218, 0.2117647, 1, 0, 1,
-0.4458757, -0.7194545, -2.763831, 0.2078431, 1, 0, 1,
-0.4433996, -0.1631902, -1.643345, 0.2, 1, 0, 1,
-0.4424785, -0.4674289, -3.395847, 0.1921569, 1, 0, 1,
-0.4418203, 1.419152, 0.1108948, 0.1882353, 1, 0, 1,
-0.4417167, -1.131167, -2.309788, 0.1803922, 1, 0, 1,
-0.4348342, 0.9551573, 0.6199422, 0.1764706, 1, 0, 1,
-0.4338619, -0.2537674, -3.122121, 0.1686275, 1, 0, 1,
-0.4292076, 1.15619, 0.2046088, 0.1647059, 1, 0, 1,
-0.4227015, -1.193, -2.253963, 0.1568628, 1, 0, 1,
-0.4219716, 0.7316988, 1.175907, 0.1529412, 1, 0, 1,
-0.4217428, -1.405012, -3.320867, 0.145098, 1, 0, 1,
-0.4201505, -0.943809, -2.399425, 0.1411765, 1, 0, 1,
-0.4200869, 0.5027584, -1.583021, 0.1333333, 1, 0, 1,
-0.4193109, 1.928089, -2.03378, 0.1294118, 1, 0, 1,
-0.4174547, 0.8804547, -1.484434, 0.1215686, 1, 0, 1,
-0.4149114, 0.5496397, -0.08105443, 0.1176471, 1, 0, 1,
-0.4145826, 0.4667468, -0.7119269, 0.1098039, 1, 0, 1,
-0.4093394, -0.4031227, -4.768945, 0.1058824, 1, 0, 1,
-0.4092954, 0.2056761, -1.168197, 0.09803922, 1, 0, 1,
-0.4084163, 2.593355, -0.3514007, 0.09019608, 1, 0, 1,
-0.407083, -1.122679, -3.516564, 0.08627451, 1, 0, 1,
-0.4070542, 0.7372898, -1.22102, 0.07843138, 1, 0, 1,
-0.4059229, -0.1216611, -1.10898, 0.07450981, 1, 0, 1,
-0.4042425, 0.4380988, -3.661847, 0.06666667, 1, 0, 1,
-0.4040913, 0.3287054, 0.290453, 0.0627451, 1, 0, 1,
-0.4012586, 0.4706893, -0.09249086, 0.05490196, 1, 0, 1,
-0.4001435, -0.5207245, -2.23499, 0.05098039, 1, 0, 1,
-0.3994962, 0.7962074, 0.8472732, 0.04313726, 1, 0, 1,
-0.3991122, 0.3591758, -1.127769, 0.03921569, 1, 0, 1,
-0.3986808, 0.6133681, -1.029992, 0.03137255, 1, 0, 1,
-0.397677, -0.1537992, -2.100181, 0.02745098, 1, 0, 1,
-0.3976041, 1.429217, -0.6556497, 0.01960784, 1, 0, 1,
-0.3963928, 0.01583129, -2.730761, 0.01568628, 1, 0, 1,
-0.3937525, 1.025256, -1.314685, 0.007843138, 1, 0, 1,
-0.3935524, -0.9196174, -2.482357, 0.003921569, 1, 0, 1,
-0.3914518, -0.9282814, -3.87013, 0, 1, 0.003921569, 1,
-0.3880972, 1.702469, 0.1839574, 0, 1, 0.01176471, 1,
-0.3870029, 1.163777, -0.3057134, 0, 1, 0.01568628, 1,
-0.3829484, -0.04885368, -1.600664, 0, 1, 0.02352941, 1,
-0.38066, 1.3728, 1.250495, 0, 1, 0.02745098, 1,
-0.3800446, 0.6048229, -0.03920572, 0, 1, 0.03529412, 1,
-0.3768843, -0.9372501, -3.403112, 0, 1, 0.03921569, 1,
-0.3745321, -0.6732749, -1.815367, 0, 1, 0.04705882, 1,
-0.3732675, -0.3140975, -3.073859, 0, 1, 0.05098039, 1,
-0.3602182, 1.040556, -0.2925949, 0, 1, 0.05882353, 1,
-0.3581576, -0.2807298, -3.75455, 0, 1, 0.0627451, 1,
-0.353626, -0.7954422, -2.397034, 0, 1, 0.07058824, 1,
-0.3522784, -0.1922211, -3.198296, 0, 1, 0.07450981, 1,
-0.3507273, -0.3305638, -0.4611534, 0, 1, 0.08235294, 1,
-0.348326, -0.8307313, -2.560732, 0, 1, 0.08627451, 1,
-0.3460795, 0.04842699, -0.7400603, 0, 1, 0.09411765, 1,
-0.3251225, -1.714152, -4.499601, 0, 1, 0.1019608, 1,
-0.3246594, 2.015975, -1.655782, 0, 1, 0.1058824, 1,
-0.3224904, 0.5777799, 1.203536, 0, 1, 0.1137255, 1,
-0.3190054, 0.09188005, -1.373244, 0, 1, 0.1176471, 1,
-0.31463, 0.2069339, -0.7340797, 0, 1, 0.1254902, 1,
-0.3113924, -0.6261095, -3.287366, 0, 1, 0.1294118, 1,
-0.3073967, 1.124788, -0.4019689, 0, 1, 0.1372549, 1,
-0.3071524, 0.6317781, 0.9894963, 0, 1, 0.1411765, 1,
-0.3068044, -0.8139047, -3.567689, 0, 1, 0.1490196, 1,
-0.3038737, 0.3837783, 1.440629, 0, 1, 0.1529412, 1,
-0.3023072, -0.3838013, -3.699666, 0, 1, 0.1607843, 1,
-0.3011307, -0.7020853, -1.335823, 0, 1, 0.1647059, 1,
-0.2983788, -0.2471971, -2.638853, 0, 1, 0.172549, 1,
-0.2968507, -0.3205034, -2.323587, 0, 1, 0.1764706, 1,
-0.2962009, -0.0244813, -2.500641, 0, 1, 0.1843137, 1,
-0.2954094, 1.301539, -0.2022666, 0, 1, 0.1882353, 1,
-0.2914425, -0.9375682, -3.208372, 0, 1, 0.1960784, 1,
-0.2894697, 0.9274696, 1.637709, 0, 1, 0.2039216, 1,
-0.2892155, 0.6898671, 0.6827528, 0, 1, 0.2078431, 1,
-0.2872991, 0.7036362, 0.1037358, 0, 1, 0.2156863, 1,
-0.2855045, -1.065249, -3.531254, 0, 1, 0.2196078, 1,
-0.2846154, 1.062599, -1.385901, 0, 1, 0.227451, 1,
-0.2842534, 0.7097061, 0.06306396, 0, 1, 0.2313726, 1,
-0.2827125, -0.272245, -1.411815, 0, 1, 0.2392157, 1,
-0.2774313, 0.859868, -0.5382031, 0, 1, 0.2431373, 1,
-0.2736926, 0.2379005, -0.3085129, 0, 1, 0.2509804, 1,
-0.2722448, 0.08788425, -0.5273623, 0, 1, 0.254902, 1,
-0.2711189, 1.510275, -0.8853174, 0, 1, 0.2627451, 1,
-0.2686751, 0.7515813, -2.087341, 0, 1, 0.2666667, 1,
-0.2646455, 0.1784375, -2.076153, 0, 1, 0.2745098, 1,
-0.263991, -0.5903081, -2.410111, 0, 1, 0.2784314, 1,
-0.2573834, -0.2660358, -2.813781, 0, 1, 0.2862745, 1,
-0.2567146, -2.38993, -3.076137, 0, 1, 0.2901961, 1,
-0.2535818, -0.218184, -3.803086, 0, 1, 0.2980392, 1,
-0.2516984, -0.2976486, -3.751239, 0, 1, 0.3058824, 1,
-0.2426656, 0.6565931, -0.1360874, 0, 1, 0.3098039, 1,
-0.2414118, 1.151663, -0.7614464, 0, 1, 0.3176471, 1,
-0.2371451, -0.2848756, -1.823887, 0, 1, 0.3215686, 1,
-0.2331823, -0.8008894, -2.869049, 0, 1, 0.3294118, 1,
-0.2286848, 0.3599821, -1.280734, 0, 1, 0.3333333, 1,
-0.2284701, -1.32487, -3.349429, 0, 1, 0.3411765, 1,
-0.2279249, 0.7880762, -0.2331583, 0, 1, 0.345098, 1,
-0.2261506, 0.5180407, -0.2406067, 0, 1, 0.3529412, 1,
-0.2255477, 0.03825893, -3.340298, 0, 1, 0.3568628, 1,
-0.2247019, 1.040741, 0.1523611, 0, 1, 0.3647059, 1,
-0.2244229, 0.2757602, -1.545582, 0, 1, 0.3686275, 1,
-0.2228426, -0.2709667, -2.807803, 0, 1, 0.3764706, 1,
-0.2218713, 0.05004231, -0.6259544, 0, 1, 0.3803922, 1,
-0.2214862, 0.6911956, 0.62156, 0, 1, 0.3882353, 1,
-0.2208443, -0.4543104, -2.698388, 0, 1, 0.3921569, 1,
-0.2191898, -0.652473, -4.004934, 0, 1, 0.4, 1,
-0.215537, 0.5867552, -0.17438, 0, 1, 0.4078431, 1,
-0.2139006, -0.9054013, -2.091066, 0, 1, 0.4117647, 1,
-0.2137306, -0.07018635, -2.332374, 0, 1, 0.4196078, 1,
-0.2112538, -1.891959, -2.495492, 0, 1, 0.4235294, 1,
-0.2104626, -0.9599082, -1.979142, 0, 1, 0.4313726, 1,
-0.2072332, 0.04492876, -0.3048415, 0, 1, 0.4352941, 1,
-0.2046477, 0.5077486, 0.1697316, 0, 1, 0.4431373, 1,
-0.2026964, -0.5494823, -1.865105, 0, 1, 0.4470588, 1,
-0.2012071, 0.4777866, 0.1027068, 0, 1, 0.454902, 1,
-0.2007283, -0.6865889, -4.508039, 0, 1, 0.4588235, 1,
-0.1999628, 0.8180034, -0.1869939, 0, 1, 0.4666667, 1,
-0.1905969, -0.4654934, -3.144326, 0, 1, 0.4705882, 1,
-0.1894987, -0.9493541, -1.988104, 0, 1, 0.4784314, 1,
-0.1877466, -1.088263, -4.935426, 0, 1, 0.4823529, 1,
-0.1844419, -0.7815457, -3.766029, 0, 1, 0.4901961, 1,
-0.1778285, -2.376815, -2.331972, 0, 1, 0.4941176, 1,
-0.1767313, 0.03340821, -0.9003456, 0, 1, 0.5019608, 1,
-0.1762952, 0.9051837, -1.976895, 0, 1, 0.509804, 1,
-0.1749861, 0.2657894, -0.9005749, 0, 1, 0.5137255, 1,
-0.1728045, 0.5119535, -1.090037, 0, 1, 0.5215687, 1,
-0.1722579, -0.2238276, -2.595537, 0, 1, 0.5254902, 1,
-0.1701315, 0.2388767, -2.630836, 0, 1, 0.5333334, 1,
-0.1687277, 1.36907, 0.242152, 0, 1, 0.5372549, 1,
-0.1663345, 0.7948838, -0.3372244, 0, 1, 0.5450981, 1,
-0.1662666, -0.4080203, -1.957574, 0, 1, 0.5490196, 1,
-0.1653818, -0.5725472, -2.273322, 0, 1, 0.5568628, 1,
-0.1592541, -0.5390758, -2.276555, 0, 1, 0.5607843, 1,
-0.1572362, -0.2644131, -2.386475, 0, 1, 0.5686275, 1,
-0.1543538, 1.881196, 0.998046, 0, 1, 0.572549, 1,
-0.1526331, -1.05041, -1.516443, 0, 1, 0.5803922, 1,
-0.1509414, -0.01844527, -0.7275677, 0, 1, 0.5843138, 1,
-0.1504594, 0.8863522, -0.05456534, 0, 1, 0.5921569, 1,
-0.143379, 1.515334, -0.1733047, 0, 1, 0.5960785, 1,
-0.143209, -1.151363, -3.433673, 0, 1, 0.6039216, 1,
-0.1363328, 0.2512762, -0.01699375, 0, 1, 0.6117647, 1,
-0.1357034, -2.758339, -5.004155, 0, 1, 0.6156863, 1,
-0.133641, -0.3266081, -2.471683, 0, 1, 0.6235294, 1,
-0.1324243, 1.153755, 0.101451, 0, 1, 0.627451, 1,
-0.1321944, -1.044152, -2.302195, 0, 1, 0.6352941, 1,
-0.124639, -0.09626317, -2.179801, 0, 1, 0.6392157, 1,
-0.1242833, 0.6952823, 0.5100152, 0, 1, 0.6470588, 1,
-0.1236991, -2.154938, -3.670021, 0, 1, 0.6509804, 1,
-0.1218762, -1.277113, -3.639903, 0, 1, 0.6588235, 1,
-0.1212949, -0.3262354, -1.520077, 0, 1, 0.6627451, 1,
-0.1092736, 0.7841966, 1.140247, 0, 1, 0.6705883, 1,
-0.104927, 0.3729329, -0.2109395, 0, 1, 0.6745098, 1,
-0.101123, 0.911221, -0.1732632, 0, 1, 0.682353, 1,
-0.09794, -1.064147, -3.195751, 0, 1, 0.6862745, 1,
-0.09055198, -0.123928, -2.490857, 0, 1, 0.6941177, 1,
-0.08246046, -0.8872715, -4.095784, 0, 1, 0.7019608, 1,
-0.08016034, -1.240628, -2.731112, 0, 1, 0.7058824, 1,
-0.07882982, -0.7855142, -3.345304, 0, 1, 0.7137255, 1,
-0.07739607, 0.1092561, 1.118812, 0, 1, 0.7176471, 1,
-0.07158695, -1.031871, -2.947695, 0, 1, 0.7254902, 1,
-0.06996686, 0.03341123, -2.143268, 0, 1, 0.7294118, 1,
-0.06972648, -0.004332533, -1.595549, 0, 1, 0.7372549, 1,
-0.06600025, 0.9041271, -0.1459621, 0, 1, 0.7411765, 1,
-0.06369, 0.1312439, -0.8468323, 0, 1, 0.7490196, 1,
-0.06134955, 0.5368496, 0.003065123, 0, 1, 0.7529412, 1,
-0.05729881, 0.5762183, 0.4937019, 0, 1, 0.7607843, 1,
-0.05507502, -0.3401717, -2.737023, 0, 1, 0.7647059, 1,
-0.05302631, -0.7270141, -2.854712, 0, 1, 0.772549, 1,
-0.05203031, 0.1375153, -1.738201, 0, 1, 0.7764706, 1,
-0.05042548, 0.840679, -0.9398154, 0, 1, 0.7843137, 1,
-0.05012172, -1.388434, -4.03282, 0, 1, 0.7882353, 1,
-0.04539003, 0.7913495, -0.2241152, 0, 1, 0.7960784, 1,
-0.04310039, 0.09134912, -0.904865, 0, 1, 0.8039216, 1,
-0.03641975, -0.5909343, -1.475666, 0, 1, 0.8078431, 1,
-0.03235403, 1.151764, 0.883426, 0, 1, 0.8156863, 1,
-0.03089977, 0.7845035, -0.9166966, 0, 1, 0.8196079, 1,
-0.03058905, 0.03820016, -1.73931, 0, 1, 0.827451, 1,
-0.03047796, 1.574298, 0.7731458, 0, 1, 0.8313726, 1,
-0.02844166, -0.785523, -2.741437, 0, 1, 0.8392157, 1,
-0.02775708, 0.3198954, 1.231426, 0, 1, 0.8431373, 1,
-0.02482345, -1.670224, -2.487134, 0, 1, 0.8509804, 1,
-0.02116664, -0.5458033, -5.325053, 0, 1, 0.854902, 1,
-0.02085664, 0.3180715, -1.54254, 0, 1, 0.8627451, 1,
-0.01671959, -0.05168903, -2.797218, 0, 1, 0.8666667, 1,
-0.01262753, -2.224744, -3.379956, 0, 1, 0.8745098, 1,
-0.01104823, 0.8956276, 0.7664493, 0, 1, 0.8784314, 1,
-0.01030746, -0.05781254, -3.046332, 0, 1, 0.8862745, 1,
-0.0006442206, 0.8374482, 0.1294855, 0, 1, 0.8901961, 1,
0.001759501, -0.9670818, 2.777217, 0, 1, 0.8980392, 1,
0.003131876, 0.5153592, 1.035233, 0, 1, 0.9058824, 1,
0.003700284, 0.005943779, 1.939536, 0, 1, 0.9098039, 1,
0.004895952, 0.619413, -1.587736, 0, 1, 0.9176471, 1,
0.005720274, 0.9471028, 0.1212536, 0, 1, 0.9215686, 1,
0.01407733, -0.622107, 4.59035, 0, 1, 0.9294118, 1,
0.0169195, -0.003346333, 1.624578, 0, 1, 0.9333333, 1,
0.02156843, 1.168856, -1.530874, 0, 1, 0.9411765, 1,
0.0257894, -0.5641999, 1.720136, 0, 1, 0.945098, 1,
0.02769444, 2.555603, -0.4676149, 0, 1, 0.9529412, 1,
0.02944134, -0.9056991, 4.121979, 0, 1, 0.9568627, 1,
0.02980968, -0.7414438, 1.304333, 0, 1, 0.9647059, 1,
0.03048475, 0.5324833, -0.9590373, 0, 1, 0.9686275, 1,
0.0321337, -0.1854815, 4.810233, 0, 1, 0.9764706, 1,
0.04099508, 0.7466034, 1.10258, 0, 1, 0.9803922, 1,
0.04166586, -0.6362668, 3.491388, 0, 1, 0.9882353, 1,
0.04210138, 1.897759, 0.7856437, 0, 1, 0.9921569, 1,
0.04282791, 1.073026, -0.05092444, 0, 1, 1, 1,
0.04371599, -1.607283, 3.463312, 0, 0.9921569, 1, 1,
0.0442632, -0.8098301, 4.13079, 0, 0.9882353, 1, 1,
0.04819424, -0.4110514, 2.29542, 0, 0.9803922, 1, 1,
0.05314198, -0.6429183, 4.152428, 0, 0.9764706, 1, 1,
0.05586575, 0.4332437, -0.337487, 0, 0.9686275, 1, 1,
0.05717717, -0.673116, 4.232266, 0, 0.9647059, 1, 1,
0.05821051, -1.003713, 2.208987, 0, 0.9568627, 1, 1,
0.0616158, 0.2639821, 0.9341893, 0, 0.9529412, 1, 1,
0.06401908, -0.2728361, 2.82006, 0, 0.945098, 1, 1,
0.06771994, -0.9816087, 2.039727, 0, 0.9411765, 1, 1,
0.06817225, -0.4463834, 3.097017, 0, 0.9333333, 1, 1,
0.07626768, -1.210652, 3.621705, 0, 0.9294118, 1, 1,
0.07764697, -0.07251084, 1.270158, 0, 0.9215686, 1, 1,
0.07795524, -0.2277615, 3.289342, 0, 0.9176471, 1, 1,
0.07832552, 0.387087, -1.749673, 0, 0.9098039, 1, 1,
0.08527608, -0.7220866, 3.201169, 0, 0.9058824, 1, 1,
0.08688519, -0.75783, 1.781291, 0, 0.8980392, 1, 1,
0.0892369, -0.05858777, 3.092958, 0, 0.8901961, 1, 1,
0.09254736, -0.5635597, 2.488827, 0, 0.8862745, 1, 1,
0.09320396, -3.022111, 4.099346, 0, 0.8784314, 1, 1,
0.09416017, 0.4894249, -0.6302324, 0, 0.8745098, 1, 1,
0.09487571, -1.075018, 3.655734, 0, 0.8666667, 1, 1,
0.09705891, 0.190589, -1.334059, 0, 0.8627451, 1, 1,
0.09897487, 0.9259408, -0.3548715, 0, 0.854902, 1, 1,
0.09935333, 0.9900799, 0.02940975, 0, 0.8509804, 1, 1,
0.1003973, 0.134973, -0.3790017, 0, 0.8431373, 1, 1,
0.1075663, 0.4019138, 2.176639, 0, 0.8392157, 1, 1,
0.1077124, 1.281992, 0.07178649, 0, 0.8313726, 1, 1,
0.1117162, -1.822762, 3.13399, 0, 0.827451, 1, 1,
0.1135465, 1.232358, 0.4538405, 0, 0.8196079, 1, 1,
0.1140698, 1.152982, 0.1450755, 0, 0.8156863, 1, 1,
0.1176928, 1.144248, -0.9107141, 0, 0.8078431, 1, 1,
0.1180418, -0.7653332, 1.903522, 0, 0.8039216, 1, 1,
0.1181873, -0.8231937, 3.919512, 0, 0.7960784, 1, 1,
0.1193785, 0.2765421, 1.881177, 0, 0.7882353, 1, 1,
0.1253717, -0.5072841, 3.217687, 0, 0.7843137, 1, 1,
0.1258339, 1.317381, -0.2613146, 0, 0.7764706, 1, 1,
0.1262213, -0.7985089, 5.713965, 0, 0.772549, 1, 1,
0.1265153, -1.91534, 3.880083, 0, 0.7647059, 1, 1,
0.1287148, -0.1266203, 2.866796, 0, 0.7607843, 1, 1,
0.1309708, 0.4408174, 0.2424537, 0, 0.7529412, 1, 1,
0.1356115, 0.1782176, -1.406361, 0, 0.7490196, 1, 1,
0.1414932, 1.233412, -0.4970185, 0, 0.7411765, 1, 1,
0.1417571, 1.175551, 0.3013847, 0, 0.7372549, 1, 1,
0.1421186, 1.307576, -0.7947372, 0, 0.7294118, 1, 1,
0.1454239, 0.8828329, 0.6855593, 0, 0.7254902, 1, 1,
0.1455185, -0.09966538, 1.277457, 0, 0.7176471, 1, 1,
0.1467605, -0.9221873, 1.171366, 0, 0.7137255, 1, 1,
0.1468817, -0.7361527, 2.633085, 0, 0.7058824, 1, 1,
0.1490258, -0.8300642, 3.189281, 0, 0.6980392, 1, 1,
0.1541453, 0.9521347, 0.617236, 0, 0.6941177, 1, 1,
0.1545615, 0.6797775, -1.16103, 0, 0.6862745, 1, 1,
0.1564651, 0.6320333, 0.8834178, 0, 0.682353, 1, 1,
0.1582722, 0.7772319, 0.9624814, 0, 0.6745098, 1, 1,
0.1608561, 1.007559, -0.1918002, 0, 0.6705883, 1, 1,
0.161621, 0.6180528, 0.8889928, 0, 0.6627451, 1, 1,
0.1641342, -0.8930792, 2.481062, 0, 0.6588235, 1, 1,
0.1642528, 0.7170974, -1.226828, 0, 0.6509804, 1, 1,
0.1660217, 0.3617297, -0.2608985, 0, 0.6470588, 1, 1,
0.1704336, -0.3532916, 1.857668, 0, 0.6392157, 1, 1,
0.1710819, -0.7222694, 3.508777, 0, 0.6352941, 1, 1,
0.1722061, -2.041428, 2.807082, 0, 0.627451, 1, 1,
0.1814199, 0.1520091, 1.500483, 0, 0.6235294, 1, 1,
0.1827786, 0.5166605, 2.10582, 0, 0.6156863, 1, 1,
0.1831652, 0.2042636, -0.285848, 0, 0.6117647, 1, 1,
0.1919933, 2.099063, 1.080599, 0, 0.6039216, 1, 1,
0.1921595, -1.135255, 3.299313, 0, 0.5960785, 1, 1,
0.193208, -0.2904294, 2.456, 0, 0.5921569, 1, 1,
0.193419, -0.5179554, 1.572772, 0, 0.5843138, 1, 1,
0.1936588, 1.332693, 0.6577999, 0, 0.5803922, 1, 1,
0.1937983, 1.105505, 0.3147837, 0, 0.572549, 1, 1,
0.1992931, -0.8409159, 5.629488, 0, 0.5686275, 1, 1,
0.2054218, 0.32386, -0.7232897, 0, 0.5607843, 1, 1,
0.2063439, -1.555254, 2.991887, 0, 0.5568628, 1, 1,
0.2078174, 0.2222322, 0.2421772, 0, 0.5490196, 1, 1,
0.2104553, -0.417762, 2.955776, 0, 0.5450981, 1, 1,
0.2115431, 0.9081314, 0.09743392, 0, 0.5372549, 1, 1,
0.2124309, 0.9225037, -1.277864, 0, 0.5333334, 1, 1,
0.212799, -1.816993, 2.921582, 0, 0.5254902, 1, 1,
0.2194922, -2.006515, 3.613181, 0, 0.5215687, 1, 1,
0.2227005, -0.09379705, 1.394736, 0, 0.5137255, 1, 1,
0.2279594, -0.09977289, 2.167603, 0, 0.509804, 1, 1,
0.2297205, 1.87461, 1.741564, 0, 0.5019608, 1, 1,
0.2304064, 1.154956, -0.6220326, 0, 0.4941176, 1, 1,
0.2307901, -1.496287, 1.619044, 0, 0.4901961, 1, 1,
0.2313309, -0.0838997, 1.203002, 0, 0.4823529, 1, 1,
0.2319534, -0.3095312, 2.101727, 0, 0.4784314, 1, 1,
0.232413, -1.540629, 2.2961, 0, 0.4705882, 1, 1,
0.2378037, -0.6241045, 1.973267, 0, 0.4666667, 1, 1,
0.246439, 0.8456624, 0.5280164, 0, 0.4588235, 1, 1,
0.2509504, 0.006141531, 1.270944, 0, 0.454902, 1, 1,
0.2560579, -1.215047, 4.258581, 0, 0.4470588, 1, 1,
0.2569549, -1.895644, 3.073742, 0, 0.4431373, 1, 1,
0.2595872, 0.8693957, 0.7620235, 0, 0.4352941, 1, 1,
0.2597187, -0.6524028, 2.717366, 0, 0.4313726, 1, 1,
0.2625484, 0.002931849, 2.571193, 0, 0.4235294, 1, 1,
0.2631181, -0.4510166, 2.8544, 0, 0.4196078, 1, 1,
0.2704108, 0.5540107, -0.4443575, 0, 0.4117647, 1, 1,
0.2748376, -0.1909772, 1.365647, 0, 0.4078431, 1, 1,
0.2755169, 0.02283895, 1.813294, 0, 0.4, 1, 1,
0.2774193, 1.928732, 1.303174, 0, 0.3921569, 1, 1,
0.2774278, 0.3708561, -1.118846, 0, 0.3882353, 1, 1,
0.2787313, -0.133938, 0.7402254, 0, 0.3803922, 1, 1,
0.2798517, -1.117626, 3.306994, 0, 0.3764706, 1, 1,
0.2868938, -0.1213862, 1.202949, 0, 0.3686275, 1, 1,
0.286995, -1.753006, 2.705206, 0, 0.3647059, 1, 1,
0.2916404, 1.164903, 0.04964693, 0, 0.3568628, 1, 1,
0.2946541, -2.244151, 2.29215, 0, 0.3529412, 1, 1,
0.3043552, 0.146152, 0.04628069, 0, 0.345098, 1, 1,
0.3075199, -0.7510058, 1.332474, 0, 0.3411765, 1, 1,
0.3098439, 1.513409, -0.6560454, 0, 0.3333333, 1, 1,
0.3118039, 1.619812, -0.8360535, 0, 0.3294118, 1, 1,
0.3125881, 0.4017133, -0.7332625, 0, 0.3215686, 1, 1,
0.3128361, 0.9375876, -0.2032959, 0, 0.3176471, 1, 1,
0.3191166, 2.276717, -0.3223028, 0, 0.3098039, 1, 1,
0.3256102, -0.757798, 3.760654, 0, 0.3058824, 1, 1,
0.3265124, 1.219637, -0.6268396, 0, 0.2980392, 1, 1,
0.3271495, 0.7877603, -0.7490113, 0, 0.2901961, 1, 1,
0.327716, -1.491295, 2.908553, 0, 0.2862745, 1, 1,
0.3345844, -1.490276, 3.588099, 0, 0.2784314, 1, 1,
0.3346143, 0.878176, -1.429684, 0, 0.2745098, 1, 1,
0.3386312, 0.3263393, 1.594529, 0, 0.2666667, 1, 1,
0.3396977, -1.270058, 2.857116, 0, 0.2627451, 1, 1,
0.3419217, -0.9839606, 2.322008, 0, 0.254902, 1, 1,
0.3432613, -0.9236664, 2.777145, 0, 0.2509804, 1, 1,
0.3447518, 0.1678673, 1.194755, 0, 0.2431373, 1, 1,
0.3470433, 0.5659066, 0.7983477, 0, 0.2392157, 1, 1,
0.3472657, 1.728432, 1.182646, 0, 0.2313726, 1, 1,
0.3484807, -0.6800709, 4.311144, 0, 0.227451, 1, 1,
0.3607442, 1.388875, -1.469108, 0, 0.2196078, 1, 1,
0.3654267, 2.250717, 0.4132046, 0, 0.2156863, 1, 1,
0.3656304, -1.98117, 1.72082, 0, 0.2078431, 1, 1,
0.3680696, -0.1910153, 2.605541, 0, 0.2039216, 1, 1,
0.3699941, -1.070709, 1.428515, 0, 0.1960784, 1, 1,
0.3716244, -1.163714, 2.921061, 0, 0.1882353, 1, 1,
0.3729123, -1.461381, 4.348477, 0, 0.1843137, 1, 1,
0.3772225, -0.07584082, 2.629058, 0, 0.1764706, 1, 1,
0.3820959, 0.1248972, 2.682297, 0, 0.172549, 1, 1,
0.3840206, -1.549595, 1.730301, 0, 0.1647059, 1, 1,
0.3849686, -0.3732365, 2.617248, 0, 0.1607843, 1, 1,
0.3857923, -0.08596043, 2.41212, 0, 0.1529412, 1, 1,
0.3862534, -1.460774, 3.410717, 0, 0.1490196, 1, 1,
0.3932258, -1.374404, 1.868165, 0, 0.1411765, 1, 1,
0.393626, 1.037786, 0.5889649, 0, 0.1372549, 1, 1,
0.3945018, -0.2135333, 2.452594, 0, 0.1294118, 1, 1,
0.3958339, -0.1500173, 0.9690405, 0, 0.1254902, 1, 1,
0.4038086, 0.9527038, 0.2765541, 0, 0.1176471, 1, 1,
0.4042234, 0.8498701, -0.2062338, 0, 0.1137255, 1, 1,
0.4052592, 0.03207253, 0.2765723, 0, 0.1058824, 1, 1,
0.406332, -0.6345545, 1.75623, 0, 0.09803922, 1, 1,
0.4066754, 2.172633, -0.5192468, 0, 0.09411765, 1, 1,
0.4075657, 0.5325518, 1.920318, 0, 0.08627451, 1, 1,
0.409331, 0.09625559, 1.044446, 0, 0.08235294, 1, 1,
0.4142901, -1.315841, 0.4635938, 0, 0.07450981, 1, 1,
0.4159118, -0.7433239, 2.646561, 0, 0.07058824, 1, 1,
0.4173041, 1.012658, 0.5711094, 0, 0.0627451, 1, 1,
0.4222598, -0.7975717, 3.86636, 0, 0.05882353, 1, 1,
0.4311537, 0.1207127, 2.208879, 0, 0.05098039, 1, 1,
0.431967, -0.3584814, 3.13673, 0, 0.04705882, 1, 1,
0.4327377, 0.5903331, 1.458757, 0, 0.03921569, 1, 1,
0.4338698, -1.347522, 2.722633, 0, 0.03529412, 1, 1,
0.4367503, 1.506474, 0.4824203, 0, 0.02745098, 1, 1,
0.4390991, 0.2481469, 2.680257, 0, 0.02352941, 1, 1,
0.4403664, -0.4034185, 0.3389785, 0, 0.01568628, 1, 1,
0.443649, -0.5115127, 1.242961, 0, 0.01176471, 1, 1,
0.4510332, -0.7145831, 1.638173, 0, 0.003921569, 1, 1,
0.4526388, 0.5432102, 0.6396907, 0.003921569, 0, 1, 1,
0.4533772, 0.2522859, 0.6690465, 0.007843138, 0, 1, 1,
0.4577332, -1.147698, 2.947287, 0.01568628, 0, 1, 1,
0.458701, -0.5190811, 2.16518, 0.01960784, 0, 1, 1,
0.4599963, 0.3472483, 2.498986, 0.02745098, 0, 1, 1,
0.4627473, -1.111514, 3.508173, 0.03137255, 0, 1, 1,
0.4641564, 0.2896966, 0.8003498, 0.03921569, 0, 1, 1,
0.4689792, 0.6129366, 1.521425, 0.04313726, 0, 1, 1,
0.4699083, -1.040346, 1.685546, 0.05098039, 0, 1, 1,
0.4708763, 0.07829887, 3.223598, 0.05490196, 0, 1, 1,
0.4753624, -0.36908, 0.9952474, 0.0627451, 0, 1, 1,
0.4791945, 0.0621352, 0.4920222, 0.06666667, 0, 1, 1,
0.4806221, 2.836515, 0.0629852, 0.07450981, 0, 1, 1,
0.4823372, 0.1482165, 1.145968, 0.07843138, 0, 1, 1,
0.4829408, -1.838632, 2.642263, 0.08627451, 0, 1, 1,
0.4860822, 0.4067903, 2.051051, 0.09019608, 0, 1, 1,
0.4893589, -0.4449856, 2.204343, 0.09803922, 0, 1, 1,
0.4925441, -0.6250325, 2.267287, 0.1058824, 0, 1, 1,
0.4939065, 1.318176, 0.4227429, 0.1098039, 0, 1, 1,
0.4940285, 1.737271, 0.1385065, 0.1176471, 0, 1, 1,
0.4954741, 1.552883, 0.03248657, 0.1215686, 0, 1, 1,
0.4999996, 0.6360292, 0.3111834, 0.1294118, 0, 1, 1,
0.5014684, 1.820702, 0.8768852, 0.1333333, 0, 1, 1,
0.5017667, -0.6111822, 1.476285, 0.1411765, 0, 1, 1,
0.5048653, 1.423237, -1.223696, 0.145098, 0, 1, 1,
0.5066237, -0.7186602, 3.771003, 0.1529412, 0, 1, 1,
0.5073122, -0.04956022, 2.635666, 0.1568628, 0, 1, 1,
0.5102082, -2.548991, 4.08672, 0.1647059, 0, 1, 1,
0.5144737, 1.483875, 0.836484, 0.1686275, 0, 1, 1,
0.5147486, -0.4966486, 2.091438, 0.1764706, 0, 1, 1,
0.5197812, -0.07917263, 2.257243, 0.1803922, 0, 1, 1,
0.5240277, -1.262993, 2.213866, 0.1882353, 0, 1, 1,
0.5375262, 0.1297996, 2.067112, 0.1921569, 0, 1, 1,
0.5430841, 0.4584667, -0.305638, 0.2, 0, 1, 1,
0.5430916, -0.06629167, 0.8127345, 0.2078431, 0, 1, 1,
0.5439395, -0.4346161, 2.028381, 0.2117647, 0, 1, 1,
0.5444445, 1.262067, -0.6410651, 0.2196078, 0, 1, 1,
0.5496724, 0.3178755, 0.8536703, 0.2235294, 0, 1, 1,
0.5551015, 0.6821559, 0.4228002, 0.2313726, 0, 1, 1,
0.5615386, 0.2053877, -0.2012548, 0.2352941, 0, 1, 1,
0.5718319, -1.15808, 0.6848421, 0.2431373, 0, 1, 1,
0.5790772, 1.944096, -1.031953, 0.2470588, 0, 1, 1,
0.5820911, 0.4334921, 0.793651, 0.254902, 0, 1, 1,
0.5928445, -0.5843878, 1.474381, 0.2588235, 0, 1, 1,
0.5981146, -0.9008107, 1.990593, 0.2666667, 0, 1, 1,
0.5995173, -0.3984302, 1.54956, 0.2705882, 0, 1, 1,
0.6032497, 0.3987085, 1.272809, 0.2784314, 0, 1, 1,
0.6086638, -1.212245, 4.704798, 0.282353, 0, 1, 1,
0.6136367, -0.227851, 2.243902, 0.2901961, 0, 1, 1,
0.6169326, -0.1832421, 2.320869, 0.2941177, 0, 1, 1,
0.6325045, -0.5850741, 2.207736, 0.3019608, 0, 1, 1,
0.6351254, 0.8984677, -0.1227137, 0.3098039, 0, 1, 1,
0.6481245, -1.553275, 2.791358, 0.3137255, 0, 1, 1,
0.6522744, -0.06807899, 3.303138, 0.3215686, 0, 1, 1,
0.6567301, 0.3146203, 2.211473, 0.3254902, 0, 1, 1,
0.6578363, 0.6578355, 1.94628, 0.3333333, 0, 1, 1,
0.6675368, 0.04570305, 2.79153, 0.3372549, 0, 1, 1,
0.6682639, 0.1919017, 1.153967, 0.345098, 0, 1, 1,
0.6697641, 1.199729, -0.384796, 0.3490196, 0, 1, 1,
0.6781636, 0.7746176, 0.9204912, 0.3568628, 0, 1, 1,
0.6817122, 2.274493, 0.6742053, 0.3607843, 0, 1, 1,
0.681743, 0.3804488, 0.866895, 0.3686275, 0, 1, 1,
0.6830675, 0.3722492, 0.7595657, 0.372549, 0, 1, 1,
0.6831369, 0.6616349, -0.7344477, 0.3803922, 0, 1, 1,
0.6883136, 0.3640607, 0.5573141, 0.3843137, 0, 1, 1,
0.6886343, -1.045833, 3.195773, 0.3921569, 0, 1, 1,
0.6937003, 1.06529, 1.268359, 0.3960784, 0, 1, 1,
0.6956136, 0.3365914, 1.669217, 0.4039216, 0, 1, 1,
0.6968263, 0.3773027, 1.97541, 0.4117647, 0, 1, 1,
0.698779, -1.31176, 1.717885, 0.4156863, 0, 1, 1,
0.6996176, 0.6097981, -1.575652, 0.4235294, 0, 1, 1,
0.7011222, -0.7784986, 2.54067, 0.427451, 0, 1, 1,
0.7012231, -1.24561, 1.145444, 0.4352941, 0, 1, 1,
0.7020942, 1.174822, 0.04754564, 0.4392157, 0, 1, 1,
0.7033678, 0.209338, 1.256408, 0.4470588, 0, 1, 1,
0.7036871, -1.718641, 2.408314, 0.4509804, 0, 1, 1,
0.7041386, 1.493365, 0.4604221, 0.4588235, 0, 1, 1,
0.70477, -0.4567659, 2.744639, 0.4627451, 0, 1, 1,
0.7075123, -0.493196, 0.7842615, 0.4705882, 0, 1, 1,
0.712834, 0.1760641, 2.122365, 0.4745098, 0, 1, 1,
0.7142825, 0.9158955, 0.2359093, 0.4823529, 0, 1, 1,
0.717093, -1.030524, 0.5794287, 0.4862745, 0, 1, 1,
0.7200665, 0.2203642, 2.714587, 0.4941176, 0, 1, 1,
0.7277573, -1.678315, 3.435192, 0.5019608, 0, 1, 1,
0.7361135, 1.084747, 1.013406, 0.5058824, 0, 1, 1,
0.7485237, -1.009151, 2.137591, 0.5137255, 0, 1, 1,
0.7492254, -1.063018, 2.600379, 0.5176471, 0, 1, 1,
0.75015, 0.3598566, 0.8355972, 0.5254902, 0, 1, 1,
0.7516206, 0.7679889, -0.7973318, 0.5294118, 0, 1, 1,
0.7520047, -0.2447936, 3.572887, 0.5372549, 0, 1, 1,
0.7526177, 1.242725, -0.2069972, 0.5411765, 0, 1, 1,
0.7570809, -0.5213367, 1.890036, 0.5490196, 0, 1, 1,
0.7589351, 0.831349, 1.490963, 0.5529412, 0, 1, 1,
0.7623227, -0.04990426, 0.8996494, 0.5607843, 0, 1, 1,
0.7701519, 0.8448421, 3.525832, 0.5647059, 0, 1, 1,
0.7716128, -0.5829548, 1.705446, 0.572549, 0, 1, 1,
0.7716869, 0.3361481, 1.784428, 0.5764706, 0, 1, 1,
0.7717929, -1.219737, 3.676584, 0.5843138, 0, 1, 1,
0.7751912, -0.256346, 0.9481517, 0.5882353, 0, 1, 1,
0.7792952, -2.593866, 3.143117, 0.5960785, 0, 1, 1,
0.7819522, 0.2462601, 1.195947, 0.6039216, 0, 1, 1,
0.7828937, -0.1074988, 0.6854157, 0.6078432, 0, 1, 1,
0.7854107, 1.351163, 1.051774, 0.6156863, 0, 1, 1,
0.7892759, -0.5687062, 1.62923, 0.6196079, 0, 1, 1,
0.7924645, -1.646224, 1.715136, 0.627451, 0, 1, 1,
0.7964132, -0.1510591, 1.609569, 0.6313726, 0, 1, 1,
0.8035646, -1.015463, 1.284366, 0.6392157, 0, 1, 1,
0.8054985, 1.017678, -0.172119, 0.6431373, 0, 1, 1,
0.8058453, -0.2324404, 0.6442395, 0.6509804, 0, 1, 1,
0.8114216, 0.399026, -0.2255467, 0.654902, 0, 1, 1,
0.8206458, 0.6506597, 1.595042, 0.6627451, 0, 1, 1,
0.8213741, 0.7803345, 1.753889, 0.6666667, 0, 1, 1,
0.8277851, -0.2464879, 4.120687, 0.6745098, 0, 1, 1,
0.8278401, 0.5924108, 0.2152781, 0.6784314, 0, 1, 1,
0.828764, 0.6254469, 1.82772, 0.6862745, 0, 1, 1,
0.8337667, 1.616013, 2.360122, 0.6901961, 0, 1, 1,
0.8414375, -0.2802483, 2.47729, 0.6980392, 0, 1, 1,
0.841535, 0.1356802, 1.389421, 0.7058824, 0, 1, 1,
0.8448822, 0.7793293, 0.3768825, 0.7098039, 0, 1, 1,
0.8471726, 0.9826666, 0.5932834, 0.7176471, 0, 1, 1,
0.8558791, -2.285476, 2.471966, 0.7215686, 0, 1, 1,
0.8573921, 0.1893436, 3.732379, 0.7294118, 0, 1, 1,
0.8575074, 0.8706395, 1.972952, 0.7333333, 0, 1, 1,
0.8602094, 0.7883059, 0.5443399, 0.7411765, 0, 1, 1,
0.8616038, -0.6002147, 1.749723, 0.7450981, 0, 1, 1,
0.8623722, -1.636556, 2.980813, 0.7529412, 0, 1, 1,
0.8760527, 1.445078, -0.476379, 0.7568628, 0, 1, 1,
0.8859791, -1.266393, 2.647523, 0.7647059, 0, 1, 1,
0.8875133, 0.8533172, 1.306717, 0.7686275, 0, 1, 1,
0.8922387, -0.5487045, 1.684404, 0.7764706, 0, 1, 1,
0.8944041, -0.02649632, 1.631876, 0.7803922, 0, 1, 1,
0.8945087, -0.891884, 0.5860572, 0.7882353, 0, 1, 1,
0.8976899, -0.9891776, 2.58525, 0.7921569, 0, 1, 1,
0.9099966, -0.1130247, 2.252795, 0.8, 0, 1, 1,
0.9121239, 1.739242, -0.6339298, 0.8078431, 0, 1, 1,
0.9177452, 0.8223847, 1.798641, 0.8117647, 0, 1, 1,
0.921711, -0.1212142, -0.5848, 0.8196079, 0, 1, 1,
0.9228914, 0.0908005, 0.3334314, 0.8235294, 0, 1, 1,
0.9347888, -3.129306, 2.869754, 0.8313726, 0, 1, 1,
0.9381339, -1.514387, 2.194104, 0.8352941, 0, 1, 1,
0.9408754, -2.159166, 2.399803, 0.8431373, 0, 1, 1,
0.9514933, 0.6665459, 2.500902, 0.8470588, 0, 1, 1,
0.9581718, 0.8685744, 1.921297, 0.854902, 0, 1, 1,
0.9608373, 0.4850541, 0.8220513, 0.8588235, 0, 1, 1,
0.9610286, -0.4048073, 1.027163, 0.8666667, 0, 1, 1,
0.9619308, -0.3307361, 1.491052, 0.8705882, 0, 1, 1,
0.9762908, -0.251565, 0.7329481, 0.8784314, 0, 1, 1,
0.9781012, 1.170703, -0.9875227, 0.8823529, 0, 1, 1,
0.9792097, -0.1624731, 3.413744, 0.8901961, 0, 1, 1,
0.9799473, -0.9988257, 3.454661, 0.8941177, 0, 1, 1,
0.9809014, 0.8334587, 1.884011, 0.9019608, 0, 1, 1,
0.9923692, -1.699649, 2.827239, 0.9098039, 0, 1, 1,
0.99387, -1.582681, 3.319846, 0.9137255, 0, 1, 1,
0.9987544, 1.66862, 1.066927, 0.9215686, 0, 1, 1,
0.9994307, -1.139514, 1.751932, 0.9254902, 0, 1, 1,
1.002728, 0.2561496, -0.4240944, 0.9333333, 0, 1, 1,
1.019933, 0.8472112, 0.5188398, 0.9372549, 0, 1, 1,
1.028644, -2.058833, 1.715606, 0.945098, 0, 1, 1,
1.034883, 0.724247, 1.403278, 0.9490196, 0, 1, 1,
1.035785, -0.08169792, 2.205389, 0.9568627, 0, 1, 1,
1.037159, -0.5776197, 2.544772, 0.9607843, 0, 1, 1,
1.045368, -0.5494725, 2.492892, 0.9686275, 0, 1, 1,
1.047469, 2.380644, 0.0723609, 0.972549, 0, 1, 1,
1.058937, -0.9541159, 1.26273, 0.9803922, 0, 1, 1,
1.058991, 0.1805308, -0.2478162, 0.9843137, 0, 1, 1,
1.063955, 0.6531073, 0.758341, 0.9921569, 0, 1, 1,
1.069774, -2.539251, 3.332823, 0.9960784, 0, 1, 1,
1.071556, -0.3015976, 0.7312643, 1, 0, 0.9960784, 1,
1.073214, 0.5997671, 0.334168, 1, 0, 0.9882353, 1,
1.088397, 0.1920914, 2.170088, 1, 0, 0.9843137, 1,
1.090496, 0.03953347, 1.159994, 1, 0, 0.9764706, 1,
1.094901, 0.7750878, 2.274965, 1, 0, 0.972549, 1,
1.095944, 0.5213842, 0.9294247, 1, 0, 0.9647059, 1,
1.10447, 1.309141, -0.5350844, 1, 0, 0.9607843, 1,
1.105825, -0.4470162, 1.668353, 1, 0, 0.9529412, 1,
1.107529, -0.7706102, -0.01020973, 1, 0, 0.9490196, 1,
1.109577, -0.794505, 1.233472, 1, 0, 0.9411765, 1,
1.118163, -0.7831239, 3.978392, 1, 0, 0.9372549, 1,
1.126144, 0.0396106, 0.7680188, 1, 0, 0.9294118, 1,
1.126813, 0.0008961088, 1.919789, 1, 0, 0.9254902, 1,
1.129328, -0.384651, 0.4550798, 1, 0, 0.9176471, 1,
1.13339, -0.06006582, 0.3028754, 1, 0, 0.9137255, 1,
1.136246, 0.9324301, 1.690035, 1, 0, 0.9058824, 1,
1.13913, 1.218437, 1.940334, 1, 0, 0.9019608, 1,
1.139339, 1.855249, 1.409582, 1, 0, 0.8941177, 1,
1.146402, 0.4288592, 2.69921, 1, 0, 0.8862745, 1,
1.150375, 0.05491357, 3.282675, 1, 0, 0.8823529, 1,
1.153349, -0.4258509, 2.911418, 1, 0, 0.8745098, 1,
1.166449, 0.7314271, 1.433391, 1, 0, 0.8705882, 1,
1.172982, -1.25895, 3.996659, 1, 0, 0.8627451, 1,
1.174746, -0.5516028, 1.641676, 1, 0, 0.8588235, 1,
1.174839, 0.5033834, 2.175412, 1, 0, 0.8509804, 1,
1.174987, -1.84147, 1.249417, 1, 0, 0.8470588, 1,
1.179157, -0.9116837, 2.62511, 1, 0, 0.8392157, 1,
1.181769, 0.5013142, 0.1155171, 1, 0, 0.8352941, 1,
1.188061, 1.08158, 1.773171, 1, 0, 0.827451, 1,
1.198602, 0.5226738, 1.825515, 1, 0, 0.8235294, 1,
1.212332, -1.600199, 4.268655, 1, 0, 0.8156863, 1,
1.213914, 0.1135684, 1.06254, 1, 0, 0.8117647, 1,
1.215119, -0.7872731, 3.871612, 1, 0, 0.8039216, 1,
1.216028, -0.6674849, 1.731733, 1, 0, 0.7960784, 1,
1.220948, 0.9041668, 1.704664, 1, 0, 0.7921569, 1,
1.231585, 0.7694455, 0.892049, 1, 0, 0.7843137, 1,
1.231874, 0.5145584, 2.07443, 1, 0, 0.7803922, 1,
1.235918, 0.1020657, -1.225684, 1, 0, 0.772549, 1,
1.236428, -1.455718, 1.922539, 1, 0, 0.7686275, 1,
1.249155, 0.06978402, 2.612534, 1, 0, 0.7607843, 1,
1.262893, 0.1333196, 2.062727, 1, 0, 0.7568628, 1,
1.264759, 0.5181136, 2.197532, 1, 0, 0.7490196, 1,
1.266114, 1.433455, 0.408185, 1, 0, 0.7450981, 1,
1.268071, 1.575381, -0.3945284, 1, 0, 0.7372549, 1,
1.292233, -1.887736, 2.619853, 1, 0, 0.7333333, 1,
1.292884, 1.986802, 0.803978, 1, 0, 0.7254902, 1,
1.294337, 1.872373, 1.150074, 1, 0, 0.7215686, 1,
1.313992, -0.2600673, 2.672259, 1, 0, 0.7137255, 1,
1.315895, -0.2730018, 0.4722906, 1, 0, 0.7098039, 1,
1.315945, 0.3010311, 1.778515, 1, 0, 0.7019608, 1,
1.318373, 0.355737, -0.4210954, 1, 0, 0.6941177, 1,
1.327141, -0.9691083, 4.332364, 1, 0, 0.6901961, 1,
1.331119, -1.064918, 2.897929, 1, 0, 0.682353, 1,
1.354141, 0.8695957, -0.7832087, 1, 0, 0.6784314, 1,
1.359356, -0.4164785, 2.667464, 1, 0, 0.6705883, 1,
1.369297, -0.9865145, 3.922803, 1, 0, 0.6666667, 1,
1.390327, 1.243347, 1.269197, 1, 0, 0.6588235, 1,
1.391091, 1.127257, -0.7630198, 1, 0, 0.654902, 1,
1.39173, 1.702907, 1.37815, 1, 0, 0.6470588, 1,
1.395603, -1.893772, 1.155341, 1, 0, 0.6431373, 1,
1.408234, -0.2486582, 1.200376, 1, 0, 0.6352941, 1,
1.411213, 0.1743068, 0.5813316, 1, 0, 0.6313726, 1,
1.418034, 0.2521125, 3.286084, 1, 0, 0.6235294, 1,
1.419068, -0.5619789, 0.9424538, 1, 0, 0.6196079, 1,
1.423877, 0.6508603, -0.5102652, 1, 0, 0.6117647, 1,
1.429064, 0.7164248, -0.003250703, 1, 0, 0.6078432, 1,
1.43252, 2.413729, 0.5591221, 1, 0, 0.6, 1,
1.433849, 0.3819373, 2.523737, 1, 0, 0.5921569, 1,
1.434017, 0.1008154, 0.3741165, 1, 0, 0.5882353, 1,
1.435602, 0.9831316, 2.790758, 1, 0, 0.5803922, 1,
1.438189, 0.4042754, 0.3060235, 1, 0, 0.5764706, 1,
1.439687, -1.165236, 1.869531, 1, 0, 0.5686275, 1,
1.443879, 0.3682761, 1.690585, 1, 0, 0.5647059, 1,
1.450342, -1.382608, 3.856909, 1, 0, 0.5568628, 1,
1.451775, 0.4640386, -0.2408798, 1, 0, 0.5529412, 1,
1.453824, -0.5332292, 1.929422, 1, 0, 0.5450981, 1,
1.458051, -0.6623898, 1.969791, 1, 0, 0.5411765, 1,
1.463759, -0.731697, 2.062731, 1, 0, 0.5333334, 1,
1.474166, -1.461819, 1.053404, 1, 0, 0.5294118, 1,
1.490454, -0.5294025, -0.5215785, 1, 0, 0.5215687, 1,
1.495855, -0.2941027, 3.777131, 1, 0, 0.5176471, 1,
1.502978, 0.5502273, 2.967873, 1, 0, 0.509804, 1,
1.504602, 0.5765422, 2.038637, 1, 0, 0.5058824, 1,
1.505552, 0.1824251, 0.3108429, 1, 0, 0.4980392, 1,
1.508209, 0.006164514, 2.663091, 1, 0, 0.4901961, 1,
1.51166, -0.562579, 2.821495, 1, 0, 0.4862745, 1,
1.518953, -0.8630903, 0.1314307, 1, 0, 0.4784314, 1,
1.53059, 0.01555877, 1.558124, 1, 0, 0.4745098, 1,
1.535064, 0.658268, -0.167899, 1, 0, 0.4666667, 1,
1.546061, 0.3825985, 1.684936, 1, 0, 0.4627451, 1,
1.550449, -0.6682107, 2.094709, 1, 0, 0.454902, 1,
1.556777, -0.02039921, 2.126107, 1, 0, 0.4509804, 1,
1.56939, -0.9972519, 2.60027, 1, 0, 0.4431373, 1,
1.571241, -0.4708124, 3.299895, 1, 0, 0.4392157, 1,
1.572379, -0.7664697, -0.3153323, 1, 0, 0.4313726, 1,
1.57344, 1.548038, 0.1419437, 1, 0, 0.427451, 1,
1.579725, 1.053751, 2.357136, 1, 0, 0.4196078, 1,
1.585039, -0.5924401, 2.360817, 1, 0, 0.4156863, 1,
1.590527, -0.2678838, 2.429114, 1, 0, 0.4078431, 1,
1.595716, 1.046341, 0.7582404, 1, 0, 0.4039216, 1,
1.599736, -1.321629, 2.351407, 1, 0, 0.3960784, 1,
1.614314, 0.3058674, 1.790363, 1, 0, 0.3882353, 1,
1.615043, 0.2933371, 2.189996, 1, 0, 0.3843137, 1,
1.623454, 0.173191, 0.2395734, 1, 0, 0.3764706, 1,
1.623971, 0.9385107, 0.6602554, 1, 0, 0.372549, 1,
1.631854, 0.02369411, 0.3518888, 1, 0, 0.3647059, 1,
1.64068, -0.8866488, 1.400738, 1, 0, 0.3607843, 1,
1.641613, 1.06683, -0.2815963, 1, 0, 0.3529412, 1,
1.642337, 2.112432, 1.623967, 1, 0, 0.3490196, 1,
1.643111, -0.4537123, 3.343786, 1, 0, 0.3411765, 1,
1.655048, 0.9379318, -0.5326472, 1, 0, 0.3372549, 1,
1.662603, -0.3831995, 1.923545, 1, 0, 0.3294118, 1,
1.681756, -2.038574, 2.699874, 1, 0, 0.3254902, 1,
1.688155, 1.417004, 0.8797987, 1, 0, 0.3176471, 1,
1.702528, 0.7492259, 1.732766, 1, 0, 0.3137255, 1,
1.705773, -1.302298, 3.615624, 1, 0, 0.3058824, 1,
1.709929, 0.9678357, 1.777622, 1, 0, 0.2980392, 1,
1.715081, -0.6558143, 3.234064, 1, 0, 0.2941177, 1,
1.721054, 0.04507698, 1.075266, 1, 0, 0.2862745, 1,
1.726884, 0.359052, 1.175929, 1, 0, 0.282353, 1,
1.730689, -1.628127, 2.924731, 1, 0, 0.2745098, 1,
1.739819, -0.5837617, 1.848162, 1, 0, 0.2705882, 1,
1.744499, -0.8516229, 3.006009, 1, 0, 0.2627451, 1,
1.744509, -0.6279278, 3.12769, 1, 0, 0.2588235, 1,
1.745258, -1.864733, 1.038231, 1, 0, 0.2509804, 1,
1.74534, -0.4707395, 1.631866, 1, 0, 0.2470588, 1,
1.748128, -1.097008, 2.555184, 1, 0, 0.2392157, 1,
1.759566, -2.569637, 2.512154, 1, 0, 0.2352941, 1,
1.775837, -0.4469056, 1.839658, 1, 0, 0.227451, 1,
1.81103, -0.03724742, 1.613905, 1, 0, 0.2235294, 1,
1.822395, -0.1015082, 1.023042, 1, 0, 0.2156863, 1,
1.832046, 0.6531108, 0.5567849, 1, 0, 0.2117647, 1,
1.832928, 0.08585439, 3.300043, 1, 0, 0.2039216, 1,
1.848288, -0.01208639, 1.622235, 1, 0, 0.1960784, 1,
1.854777, -0.7071986, 1.485063, 1, 0, 0.1921569, 1,
1.858766, -0.1437682, 2.066542, 1, 0, 0.1843137, 1,
1.862476, -0.8344383, 2.540948, 1, 0, 0.1803922, 1,
1.884767, 0.5332958, 1.715925, 1, 0, 0.172549, 1,
1.884932, -0.8182914, 2.266156, 1, 0, 0.1686275, 1,
1.891423, -0.6853131, 2.407919, 1, 0, 0.1607843, 1,
1.912749, 0.1436195, 1.006029, 1, 0, 0.1568628, 1,
1.920151, -1.178479, 2.419153, 1, 0, 0.1490196, 1,
1.920879, 0.1890758, 0.855307, 1, 0, 0.145098, 1,
1.94017, 0.4502789, 0.644556, 1, 0, 0.1372549, 1,
2.018695, 0.158223, 0.5984075, 1, 0, 0.1333333, 1,
2.042714, -0.9988601, 2.189077, 1, 0, 0.1254902, 1,
2.042737, 0.2378832, 1.70605, 1, 0, 0.1215686, 1,
2.049029, -1.131115, 2.382028, 1, 0, 0.1137255, 1,
2.059967, -1.50883, 2.656619, 1, 0, 0.1098039, 1,
2.060702, -0.8804937, 0.994652, 1, 0, 0.1019608, 1,
2.064023, -0.4868387, 3.796262, 1, 0, 0.09411765, 1,
2.123784, 0.4550366, 0.1030105, 1, 0, 0.09019608, 1,
2.138244, -1.079893, 1.630381, 1, 0, 0.08235294, 1,
2.202904, -1.633359, 2.404666, 1, 0, 0.07843138, 1,
2.305183, 0.4043261, 0.6466295, 1, 0, 0.07058824, 1,
2.307969, 2.221364, 1.842608, 1, 0, 0.06666667, 1,
2.309051, 0.7164422, 0.994331, 1, 0, 0.05882353, 1,
2.335081, 0.3347053, 0.615814, 1, 0, 0.05490196, 1,
2.347425, 0.2630773, 1.872058, 1, 0, 0.04705882, 1,
2.435709, -0.6738508, 0.7340552, 1, 0, 0.04313726, 1,
2.497087, 1.492106, -1.378104, 1, 0, 0.03529412, 1,
2.583919, 0.5945695, 0.8465485, 1, 0, 0.03137255, 1,
2.790365, 0.6617246, 0.3908485, 1, 0, 0.02352941, 1,
2.852138, -0.6164427, 2.503581, 1, 0, 0.01960784, 1,
3.082977, -0.7083534, -0.02141788, 1, 0, 0.01176471, 1,
3.687678, -0.1183993, 1.420884, 1, 0, 0.007843138, 1
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
0.1304691, -5.236115, -7.196167, 0, -0.5, 0.5, 0.5,
0.1304691, -5.236115, -7.196167, 1, -0.5, 0.5, 0.5,
0.1304691, -5.236115, -7.196167, 1, 1.5, 0.5, 0.5,
0.1304691, -5.236115, -7.196167, 0, 1.5, 0.5, 0.5
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
-4.632633, -0.6148016, -7.196167, 0, -0.5, 0.5, 0.5,
-4.632633, -0.6148016, -7.196167, 1, -0.5, 0.5, 0.5,
-4.632633, -0.6148016, -7.196167, 1, 1.5, 0.5, 0.5,
-4.632633, -0.6148016, -7.196167, 0, 1.5, 0.5, 0.5
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
-4.632633, -5.236115, 0.1944561, 0, -0.5, 0.5, 0.5,
-4.632633, -5.236115, 0.1944561, 1, -0.5, 0.5, 0.5,
-4.632633, -5.236115, 0.1944561, 1, 1.5, 0.5, 0.5,
-4.632633, -5.236115, 0.1944561, 0, 1.5, 0.5, 0.5
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
-2, -4.169658, -5.490639,
2, -4.169658, -5.490639,
-2, -4.169658, -5.490639,
-2, -4.347401, -5.774893,
0, -4.169658, -5.490639,
0, -4.347401, -5.774893,
2, -4.169658, -5.490639,
2, -4.347401, -5.774893
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
-2, -4.702886, -6.343403, 0, -0.5, 0.5, 0.5,
-2, -4.702886, -6.343403, 1, -0.5, 0.5, 0.5,
-2, -4.702886, -6.343403, 1, 1.5, 0.5, 0.5,
-2, -4.702886, -6.343403, 0, 1.5, 0.5, 0.5,
0, -4.702886, -6.343403, 0, -0.5, 0.5, 0.5,
0, -4.702886, -6.343403, 1, -0.5, 0.5, 0.5,
0, -4.702886, -6.343403, 1, 1.5, 0.5, 0.5,
0, -4.702886, -6.343403, 0, 1.5, 0.5, 0.5,
2, -4.702886, -6.343403, 0, -0.5, 0.5, 0.5,
2, -4.702886, -6.343403, 1, -0.5, 0.5, 0.5,
2, -4.702886, -6.343403, 1, 1.5, 0.5, 0.5,
2, -4.702886, -6.343403, 0, 1.5, 0.5, 0.5
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
-3.533456, -4, -5.490639,
-3.533456, 2, -5.490639,
-3.533456, -4, -5.490639,
-3.716652, -4, -5.774893,
-3.533456, -3, -5.490639,
-3.716652, -3, -5.774893,
-3.533456, -2, -5.490639,
-3.716652, -2, -5.774893,
-3.533456, -1, -5.490639,
-3.716652, -1, -5.774893,
-3.533456, 0, -5.490639,
-3.716652, 0, -5.774893,
-3.533456, 1, -5.490639,
-3.716652, 1, -5.774893,
-3.533456, 2, -5.490639,
-3.716652, 2, -5.774893
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
-4.083045, -4, -6.343403, 0, -0.5, 0.5, 0.5,
-4.083045, -4, -6.343403, 1, -0.5, 0.5, 0.5,
-4.083045, -4, -6.343403, 1, 1.5, 0.5, 0.5,
-4.083045, -4, -6.343403, 0, 1.5, 0.5, 0.5,
-4.083045, -3, -6.343403, 0, -0.5, 0.5, 0.5,
-4.083045, -3, -6.343403, 1, -0.5, 0.5, 0.5,
-4.083045, -3, -6.343403, 1, 1.5, 0.5, 0.5,
-4.083045, -3, -6.343403, 0, 1.5, 0.5, 0.5,
-4.083045, -2, -6.343403, 0, -0.5, 0.5, 0.5,
-4.083045, -2, -6.343403, 1, -0.5, 0.5, 0.5,
-4.083045, -2, -6.343403, 1, 1.5, 0.5, 0.5,
-4.083045, -2, -6.343403, 0, 1.5, 0.5, 0.5,
-4.083045, -1, -6.343403, 0, -0.5, 0.5, 0.5,
-4.083045, -1, -6.343403, 1, -0.5, 0.5, 0.5,
-4.083045, -1, -6.343403, 1, 1.5, 0.5, 0.5,
-4.083045, -1, -6.343403, 0, 1.5, 0.5, 0.5,
-4.083045, 0, -6.343403, 0, -0.5, 0.5, 0.5,
-4.083045, 0, -6.343403, 1, -0.5, 0.5, 0.5,
-4.083045, 0, -6.343403, 1, 1.5, 0.5, 0.5,
-4.083045, 0, -6.343403, 0, 1.5, 0.5, 0.5,
-4.083045, 1, -6.343403, 0, -0.5, 0.5, 0.5,
-4.083045, 1, -6.343403, 1, -0.5, 0.5, 0.5,
-4.083045, 1, -6.343403, 1, 1.5, 0.5, 0.5,
-4.083045, 1, -6.343403, 0, 1.5, 0.5, 0.5,
-4.083045, 2, -6.343403, 0, -0.5, 0.5, 0.5,
-4.083045, 2, -6.343403, 1, -0.5, 0.5, 0.5,
-4.083045, 2, -6.343403, 1, 1.5, 0.5, 0.5,
-4.083045, 2, -6.343403, 0, 1.5, 0.5, 0.5
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
-3.533456, -4.169658, -4,
-3.533456, -4.169658, 4,
-3.533456, -4.169658, -4,
-3.716652, -4.347401, -4,
-3.533456, -4.169658, -2,
-3.716652, -4.347401, -2,
-3.533456, -4.169658, 0,
-3.716652, -4.347401, 0,
-3.533456, -4.169658, 2,
-3.716652, -4.347401, 2,
-3.533456, -4.169658, 4,
-3.716652, -4.347401, 4
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
-4.083045, -4.702886, -4, 0, -0.5, 0.5, 0.5,
-4.083045, -4.702886, -4, 1, -0.5, 0.5, 0.5,
-4.083045, -4.702886, -4, 1, 1.5, 0.5, 0.5,
-4.083045, -4.702886, -4, 0, 1.5, 0.5, 0.5,
-4.083045, -4.702886, -2, 0, -0.5, 0.5, 0.5,
-4.083045, -4.702886, -2, 1, -0.5, 0.5, 0.5,
-4.083045, -4.702886, -2, 1, 1.5, 0.5, 0.5,
-4.083045, -4.702886, -2, 0, 1.5, 0.5, 0.5,
-4.083045, -4.702886, 0, 0, -0.5, 0.5, 0.5,
-4.083045, -4.702886, 0, 1, -0.5, 0.5, 0.5,
-4.083045, -4.702886, 0, 1, 1.5, 0.5, 0.5,
-4.083045, -4.702886, 0, 0, 1.5, 0.5, 0.5,
-4.083045, -4.702886, 2, 0, -0.5, 0.5, 0.5,
-4.083045, -4.702886, 2, 1, -0.5, 0.5, 0.5,
-4.083045, -4.702886, 2, 1, 1.5, 0.5, 0.5,
-4.083045, -4.702886, 2, 0, 1.5, 0.5, 0.5,
-4.083045, -4.702886, 4, 0, -0.5, 0.5, 0.5,
-4.083045, -4.702886, 4, 1, -0.5, 0.5, 0.5,
-4.083045, -4.702886, 4, 1, 1.5, 0.5, 0.5,
-4.083045, -4.702886, 4, 0, 1.5, 0.5, 0.5
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
-3.533456, -4.169658, -5.490639,
-3.533456, 2.940054, -5.490639,
-3.533456, -4.169658, 5.879551,
-3.533456, 2.940054, 5.879551,
-3.533456, -4.169658, -5.490639,
-3.533456, -4.169658, 5.879551,
-3.533456, 2.940054, -5.490639,
-3.533456, 2.940054, 5.879551,
-3.533456, -4.169658, -5.490639,
3.794394, -4.169658, -5.490639,
-3.533456, -4.169658, 5.879551,
3.794394, -4.169658, 5.879551,
-3.533456, 2.940054, -5.490639,
3.794394, 2.940054, -5.490639,
-3.533456, 2.940054, 5.879551,
3.794394, 2.940054, 5.879551,
3.794394, -4.169658, -5.490639,
3.794394, 2.940054, -5.490639,
3.794394, -4.169658, 5.879551,
3.794394, 2.940054, 5.879551,
3.794394, -4.169658, -5.490639,
3.794394, -4.169658, 5.879551,
3.794394, 2.940054, -5.490639,
3.794394, 2.940054, 5.879551
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
var radius = 8.160065;
var distance = 36.30505;
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
mvMatrix.translate( -0.1304691, 0.6148016, -0.1944561 );
mvMatrix.scale( 1.204013, 1.240954, 0.7759609 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.30505);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
chlorpikrin<-read.table("chlorpikrin.xyz")
```

```
## Error in read.table("chlorpikrin.xyz"): no lines available in input
```

```r
x<-chlorpikrin$V2
```

```
## Error in eval(expr, envir, enclos): object 'chlorpikrin' not found
```

```r
y<-chlorpikrin$V3
```

```
## Error in eval(expr, envir, enclos): object 'chlorpikrin' not found
```

```r
z<-chlorpikrin$V4
```

```
## Error in eval(expr, envir, enclos): object 'chlorpikrin' not found
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
-3.426739, -0.6195037, -1.515048, 0, 0, 1, 1, 1,
-3.07091, -0.674587, -1.149217, 1, 0, 0, 1, 1,
-3.008264, -1.30094, -2.43152, 1, 0, 0, 1, 1,
-2.858152, 0.6100554, -1.094156, 1, 0, 0, 1, 1,
-2.807369, 1.441058, -0.354366, 1, 0, 0, 1, 1,
-2.667366, -0.8617967, -1.781446, 1, 0, 0, 1, 1,
-2.57424, -0.5457252, -2.547927, 0, 0, 0, 1, 1,
-2.44161, 2.507903, -1.598216, 0, 0, 0, 1, 1,
-2.401348, 1.013671, -0.4151854, 0, 0, 0, 1, 1,
-2.35806, 0.146663, -1.031618, 0, 0, 0, 1, 1,
-2.269698, -0.1914121, -3.936034, 0, 0, 0, 1, 1,
-2.261435, -0.02776957, -2.489855, 0, 0, 0, 1, 1,
-2.181416, 0.4510719, -0.768371, 0, 0, 0, 1, 1,
-2.177489, -0.9931642, -1.353266, 1, 1, 1, 1, 1,
-2.166788, 0.2014359, -0.9503419, 1, 1, 1, 1, 1,
-2.142914, -1.279858, -1.904409, 1, 1, 1, 1, 1,
-2.140393, 0.2268201, -0.4286017, 1, 1, 1, 1, 1,
-2.120679, -0.4672496, -2.100405, 1, 1, 1, 1, 1,
-2.109144, 0.6489595, -1.083942, 1, 1, 1, 1, 1,
-2.059799, 0.2243504, -0.8036401, 1, 1, 1, 1, 1,
-2.052679, -0.1692313, -1.754073, 1, 1, 1, 1, 1,
-2.048189, -0.2626753, -1.916382, 1, 1, 1, 1, 1,
-1.981045, 1.557843, 1.139835, 1, 1, 1, 1, 1,
-1.970105, 1.46063, -1.190319, 1, 1, 1, 1, 1,
-1.930567, 0.6641232, -1.014363, 1, 1, 1, 1, 1,
-1.930459, 0.3216826, -2.513419, 1, 1, 1, 1, 1,
-1.886397, -0.2095694, -3.4733, 1, 1, 1, 1, 1,
-1.879141, -0.5853717, -2.357937, 1, 1, 1, 1, 1,
-1.865298, 0.21316, -1.992608, 0, 0, 1, 1, 1,
-1.86126, -0.06388699, -3.578362, 1, 0, 0, 1, 1,
-1.848592, -0.3450175, -0.5213564, 1, 0, 0, 1, 1,
-1.813491, -0.5071558, -3.899247, 1, 0, 0, 1, 1,
-1.781903, -0.707898, -1.699245, 1, 0, 0, 1, 1,
-1.766368, 1.187069, -0.6373055, 1, 0, 0, 1, 1,
-1.764554, 1.174094, -0.1390067, 0, 0, 0, 1, 1,
-1.737336, 0.334455, -3.108938, 0, 0, 0, 1, 1,
-1.720184, -0.07301969, -1.10416, 0, 0, 0, 1, 1,
-1.709727, -0.1567038, -2.728532, 0, 0, 0, 1, 1,
-1.684742, 0.8790332, -0.6229104, 0, 0, 0, 1, 1,
-1.684217, 2.165767, 0.4952967, 0, 0, 0, 1, 1,
-1.672658, -0.08522063, -3.54651, 0, 0, 0, 1, 1,
-1.657981, 0.1772079, -0.5654489, 1, 1, 1, 1, 1,
-1.657475, 0.967365, -0.2467799, 1, 1, 1, 1, 1,
-1.603009, 0.9630243, -1.282671, 1, 1, 1, 1, 1,
-1.59505, 0.3871375, -2.722609, 1, 1, 1, 1, 1,
-1.583658, 0.9815041, -1.18912, 1, 1, 1, 1, 1,
-1.576915, -0.7143552, -1.899892, 1, 1, 1, 1, 1,
-1.576881, -1.303119, -1.606596, 1, 1, 1, 1, 1,
-1.575814, -0.0366919, 0.5725836, 1, 1, 1, 1, 1,
-1.547974, -0.04653827, -2.604582, 1, 1, 1, 1, 1,
-1.537915, -3.641862, -2.093974, 1, 1, 1, 1, 1,
-1.533121, -0.3178815, -3.03308, 1, 1, 1, 1, 1,
-1.527347, -1.322974, -2.927036, 1, 1, 1, 1, 1,
-1.526421, -1.098802, -1.180119, 1, 1, 1, 1, 1,
-1.508935, 0.394275, -1.703133, 1, 1, 1, 1, 1,
-1.504967, 1.210049, -1.894131, 1, 1, 1, 1, 1,
-1.504395, 1.024015, -1.685261, 0, 0, 1, 1, 1,
-1.498306, -0.799284, -1.479567, 1, 0, 0, 1, 1,
-1.487387, 0.008172407, 0.004457376, 1, 0, 0, 1, 1,
-1.486348, -0.9841182, -2.726241, 1, 0, 0, 1, 1,
-1.475909, 2.504416, -0.7848044, 1, 0, 0, 1, 1,
-1.4734, -0.05575352, -0.8974712, 1, 0, 0, 1, 1,
-1.46513, -0.9427644, -2.214998, 0, 0, 0, 1, 1,
-1.455341, 0.5061362, -0.6204692, 0, 0, 0, 1, 1,
-1.45348, 0.6855964, -2.09885, 0, 0, 0, 1, 1,
-1.45139, 0.4678847, -0.6730947, 0, 0, 0, 1, 1,
-1.45086, 1.111084, -1.095785, 0, 0, 0, 1, 1,
-1.45055, -0.1207065, 0.653217, 0, 0, 0, 1, 1,
-1.442247, -1.362214, -4.730261, 0, 0, 0, 1, 1,
-1.439643, 1.304857, 0.3317184, 1, 1, 1, 1, 1,
-1.432129, 0.3008878, -1.691411, 1, 1, 1, 1, 1,
-1.430314, -0.5158693, -3.390129, 1, 1, 1, 1, 1,
-1.427118, -0.05744241, 0.006580407, 1, 1, 1, 1, 1,
-1.421395, -2.141835, -1.819977, 1, 1, 1, 1, 1,
-1.417527, 0.7884446, -0.09149149, 1, 1, 1, 1, 1,
-1.410554, -4.066118, -2.148078, 1, 1, 1, 1, 1,
-1.401968, -0.2095698, -3.312017, 1, 1, 1, 1, 1,
-1.396811, 1.378103, -1.828487, 1, 1, 1, 1, 1,
-1.394499, -0.02067917, -1.76735, 1, 1, 1, 1, 1,
-1.394024, 0.1981446, -1.273171, 1, 1, 1, 1, 1,
-1.391698, 1.187868, -1.186319, 1, 1, 1, 1, 1,
-1.388178, 1.801016, -0.7974373, 1, 1, 1, 1, 1,
-1.379212, 1.28559, 0.2979389, 1, 1, 1, 1, 1,
-1.366848, -0.5024341, -1.825277, 1, 1, 1, 1, 1,
-1.356208, -0.7896681, -1.838859, 0, 0, 1, 1, 1,
-1.334367, -1.205227, -1.386114, 1, 0, 0, 1, 1,
-1.324331, 0.2724123, -2.223163, 1, 0, 0, 1, 1,
-1.314992, 1.145415, -1.232889, 1, 0, 0, 1, 1,
-1.31109, 1.075394, 0.9856207, 1, 0, 0, 1, 1,
-1.310483, 1.816352, 1.328144, 1, 0, 0, 1, 1,
-1.301092, 0.03489952, -1.042326, 0, 0, 0, 1, 1,
-1.300555, -0.4077085, -1.337443, 0, 0, 0, 1, 1,
-1.297001, -0.4752367, -3.969548, 0, 0, 0, 1, 1,
-1.292668, -0.5796145, -2.051464, 0, 0, 0, 1, 1,
-1.292655, 0.2933277, -0.5060697, 0, 0, 0, 1, 1,
-1.291444, 2.019975, -0.1056995, 0, 0, 0, 1, 1,
-1.287692, -0.6201842, -1.20708, 0, 0, 0, 1, 1,
-1.286907, 1.900254, -0.1827641, 1, 1, 1, 1, 1,
-1.285276, 0.6312479, -1.794301, 1, 1, 1, 1, 1,
-1.280192, -0.00228256, -1.682961, 1, 1, 1, 1, 1,
-1.271873, -0.693311, -3.344309, 1, 1, 1, 1, 1,
-1.266825, 0.1590687, -1.633869, 1, 1, 1, 1, 1,
-1.264189, 0.01083661, -1.779506, 1, 1, 1, 1, 1,
-1.260668, 1.602676, -0.430388, 1, 1, 1, 1, 1,
-1.252636, 0.1020039, 0.7465429, 1, 1, 1, 1, 1,
-1.246839, 0.5780212, -1.042455, 1, 1, 1, 1, 1,
-1.243521, -1.468543, -5.145873, 1, 1, 1, 1, 1,
-1.240645, -1.62518, -1.787009, 1, 1, 1, 1, 1,
-1.23968, 0.3925803, -0.8612975, 1, 1, 1, 1, 1,
-1.222555, 0.7495177, -1.182173, 1, 1, 1, 1, 1,
-1.212681, -0.3211291, -2.614631, 1, 1, 1, 1, 1,
-1.207461, 0.7115386, -1.994693, 1, 1, 1, 1, 1,
-1.200177, 1.287261, 0.3760567, 0, 0, 1, 1, 1,
-1.197295, -0.6334835, -2.997155, 1, 0, 0, 1, 1,
-1.187792, -0.869503, -2.981445, 1, 0, 0, 1, 1,
-1.185941, 2.577621, -0.6888412, 1, 0, 0, 1, 1,
-1.181695, 0.8087336, 0.590423, 1, 0, 0, 1, 1,
-1.154572, 0.2463781, -1.912371, 1, 0, 0, 1, 1,
-1.146891, -0.2946687, -2.808978, 0, 0, 0, 1, 1,
-1.126649, 0.6643431, -0.9955834, 0, 0, 0, 1, 1,
-1.116071, 1.448988, -0.7346344, 0, 0, 0, 1, 1,
-1.112939, -1.007118, -2.792443, 0, 0, 0, 1, 1,
-1.108824, 0.4648809, -1.450927, 0, 0, 0, 1, 1,
-1.099206, 0.7450929, -2.958984, 0, 0, 0, 1, 1,
-1.098302, 0.8066271, -0.3765924, 0, 0, 0, 1, 1,
-1.095957, 0.8558511, -0.04349305, 1, 1, 1, 1, 1,
-1.08806, -0.7676061, -1.987467, 1, 1, 1, 1, 1,
-1.067135, -0.09417327, -3.130648, 1, 1, 1, 1, 1,
-1.062065, -0.0877055, 0.9242432, 1, 1, 1, 1, 1,
-1.05593, 0.5365523, -2.205245, 1, 1, 1, 1, 1,
-1.053342, 0.6271337, 1.815533, 1, 1, 1, 1, 1,
-1.048078, 0.2560339, -0.4238801, 1, 1, 1, 1, 1,
-1.046556, -0.1220543, -1.921447, 1, 1, 1, 1, 1,
-1.043006, -0.7841694, -3.19876, 1, 1, 1, 1, 1,
-1.038628, 0.3161707, -2.37519, 1, 1, 1, 1, 1,
-1.033545, -1.24651, -2.54684, 1, 1, 1, 1, 1,
-1.033204, -0.5252324, -2.219597, 1, 1, 1, 1, 1,
-1.017347, 1.23088, -1.934799, 1, 1, 1, 1, 1,
-1.013742, 2.146952, -0.1918446, 1, 1, 1, 1, 1,
-1.008187, -0.8211777, -1.766368, 1, 1, 1, 1, 1,
-1.006478, -0.0563485, -0.9465196, 0, 0, 1, 1, 1,
-0.9974467, -0.2795888, -3.192196, 1, 0, 0, 1, 1,
-0.9961807, 0.3104182, -3.6962, 1, 0, 0, 1, 1,
-0.9959247, 0.683644, -1.873278, 1, 0, 0, 1, 1,
-0.9929827, 0.05711685, -2.089082, 1, 0, 0, 1, 1,
-0.986782, 0.08466462, 0.5219731, 1, 0, 0, 1, 1,
-0.9848507, 0.2281988, -1.618884, 0, 0, 0, 1, 1,
-0.9812722, 2.664613, -0.002645299, 0, 0, 0, 1, 1,
-0.9800762, -0.1326223, -2.77455, 0, 0, 0, 1, 1,
-0.9796164, -0.3326733, -3.156054, 0, 0, 0, 1, 1,
-0.9741009, -1.497724, -2.897536, 0, 0, 0, 1, 1,
-0.9731877, 0.3662605, -3.118184, 0, 0, 0, 1, 1,
-0.9726607, -2.147999, -4.594362, 0, 0, 0, 1, 1,
-0.966311, -1.002899, -2.65357, 1, 1, 1, 1, 1,
-0.964166, -0.1138916, 0.0008313287, 1, 1, 1, 1, 1,
-0.9633557, -2.048453, -1.080345, 1, 1, 1, 1, 1,
-0.9607487, -1.047009, -4.109951, 1, 1, 1, 1, 1,
-0.9574741, -0.8804916, -2.116251, 1, 1, 1, 1, 1,
-0.9555824, -0.7783172, -2.912115, 1, 1, 1, 1, 1,
-0.9543815, 1.568823, -0.4866348, 1, 1, 1, 1, 1,
-0.9509087, -0.6761901, -1.648543, 1, 1, 1, 1, 1,
-0.9360586, -0.4309015, -2.010083, 1, 1, 1, 1, 1,
-0.9356015, -1.857734, -3.259235, 1, 1, 1, 1, 1,
-0.9325292, 0.2884361, -2.636533, 1, 1, 1, 1, 1,
-0.9323907, 0.1715328, -3.008523, 1, 1, 1, 1, 1,
-0.9276438, -1.752955, -2.383348, 1, 1, 1, 1, 1,
-0.9272496, 0.1771315, -0.9175389, 1, 1, 1, 1, 1,
-0.9248722, 1.527466, -0.5588365, 1, 1, 1, 1, 1,
-0.921584, 1.438419, -0.9901147, 0, 0, 1, 1, 1,
-0.9189521, 0.6805386, -1.888636, 1, 0, 0, 1, 1,
-0.9149979, 0.8183158, -1.655971, 1, 0, 0, 1, 1,
-0.9134344, -0.01019544, -1.278533, 1, 0, 0, 1, 1,
-0.912641, -0.9686923, -1.050998, 1, 0, 0, 1, 1,
-0.9087184, -1.010569, -2.689766, 1, 0, 0, 1, 1,
-0.908459, -1.046378, -1.664917, 0, 0, 0, 1, 1,
-0.9058276, 0.5956658, 0.2565579, 0, 0, 0, 1, 1,
-0.9012843, -0.9249474, -2.119893, 0, 0, 0, 1, 1,
-0.9006361, 0.3282126, -2.545585, 0, 0, 0, 1, 1,
-0.9004499, 0.03290046, 0.2056145, 0, 0, 0, 1, 1,
-0.8948353, 1.31796, -0.5309995, 0, 0, 0, 1, 1,
-0.8897026, 1.147521, 0.1389374, 0, 0, 0, 1, 1,
-0.8888994, 1.354567, -1.219932, 1, 1, 1, 1, 1,
-0.887934, -0.7059025, -2.365936, 1, 1, 1, 1, 1,
-0.8798164, -0.4185083, -1.90668, 1, 1, 1, 1, 1,
-0.8750352, -0.3636087, -2.51664, 1, 1, 1, 1, 1,
-0.8728747, 0.01915003, -2.116257, 1, 1, 1, 1, 1,
-0.8727682, 0.6231391, -0.6566449, 1, 1, 1, 1, 1,
-0.8619159, 0.598279, -2.604812, 1, 1, 1, 1, 1,
-0.8598352, -0.3176598, -2.580095, 1, 1, 1, 1, 1,
-0.8551412, 0.3842461, -1.965201, 1, 1, 1, 1, 1,
-0.8522691, -0.6394408, -2.800124, 1, 1, 1, 1, 1,
-0.8469996, -0.3725519, -1.963596, 1, 1, 1, 1, 1,
-0.8401167, 2.714946, -1.4948, 1, 1, 1, 1, 1,
-0.8373151, 1.112319, -1.615711, 1, 1, 1, 1, 1,
-0.8308571, 0.9102414, -1.082643, 1, 1, 1, 1, 1,
-0.8283666, 0.3204329, -0.5248865, 1, 1, 1, 1, 1,
-0.824728, -0.6850787, -3.122271, 0, 0, 1, 1, 1,
-0.8185924, -1.144881, -2.966255, 1, 0, 0, 1, 1,
-0.8085209, 0.03413332, -2.025404, 1, 0, 0, 1, 1,
-0.8074031, -0.09886411, -1.419312, 1, 0, 0, 1, 1,
-0.8071173, 1.122264, -0.7174857, 1, 0, 0, 1, 1,
-0.8012522, -1.011023, -1.712346, 1, 0, 0, 1, 1,
-0.7927744, -1.522509, -2.374362, 0, 0, 0, 1, 1,
-0.7771227, -1.153728, -3.860262, 0, 0, 0, 1, 1,
-0.7758241, -3.296938, -3.648979, 0, 0, 0, 1, 1,
-0.7742787, 0.0750605, -2.91421, 0, 0, 0, 1, 1,
-0.7666752, -0.9323395, -1.096779, 0, 0, 0, 1, 1,
-0.7544015, -1.32852, -1.102407, 0, 0, 0, 1, 1,
-0.7512531, -0.1181887, -1.615381, 0, 0, 0, 1, 1,
-0.7465945, 0.1496106, -1.620732, 1, 1, 1, 1, 1,
-0.7451411, -0.4165888, -1.789111, 1, 1, 1, 1, 1,
-0.7449064, -1.460057, -3.093316, 1, 1, 1, 1, 1,
-0.7412369, 0.6320646, 0.4494987, 1, 1, 1, 1, 1,
-0.737511, 1.466865, -0.6159469, 1, 1, 1, 1, 1,
-0.7359554, -0.6605224, -2.735911, 1, 1, 1, 1, 1,
-0.7341233, -1.233914, -4.106529, 1, 1, 1, 1, 1,
-0.7338542, 0.1832066, -1.786275, 1, 1, 1, 1, 1,
-0.7336529, 0.6966391, -0.5436442, 1, 1, 1, 1, 1,
-0.731719, 1.678058, 0.3895228, 1, 1, 1, 1, 1,
-0.7316082, -0.4833938, -3.140352, 1, 1, 1, 1, 1,
-0.7293198, 0.3810977, -1.357729, 1, 1, 1, 1, 1,
-0.7270137, 0.5975621, -2.038518, 1, 1, 1, 1, 1,
-0.7087942, 0.2388706, -2.19173, 1, 1, 1, 1, 1,
-0.7073972, 1.402568, -0.6544392, 1, 1, 1, 1, 1,
-0.7059262, 1.938059, -0.3866011, 0, 0, 1, 1, 1,
-0.704506, -0.2775948, -1.804194, 1, 0, 0, 1, 1,
-0.7029203, 0.6271063, -0.7550344, 1, 0, 0, 1, 1,
-0.7020129, 1.161589, -0.3913063, 1, 0, 0, 1, 1,
-0.6960876, -0.2535408, -0.8271388, 1, 0, 0, 1, 1,
-0.6948338, 0.5638672, -0.8884776, 1, 0, 0, 1, 1,
-0.6946251, -0.530276, -2.688161, 0, 0, 0, 1, 1,
-0.6939085, -0.2792564, -2.163594, 0, 0, 0, 1, 1,
-0.6938801, 0.7805668, 0.9238223, 0, 0, 0, 1, 1,
-0.6883966, 0.7911747, -1.51159, 0, 0, 0, 1, 1,
-0.6785815, 0.221576, -0.3521104, 0, 0, 0, 1, 1,
-0.6777627, 1.022659, -1.583237, 0, 0, 0, 1, 1,
-0.6735963, 0.1191658, -1.446053, 0, 0, 0, 1, 1,
-0.6726453, -1.160224, -2.887038, 1, 1, 1, 1, 1,
-0.6712232, -0.6375059, -2.357948, 1, 1, 1, 1, 1,
-0.6649827, -0.7800061, -2.294752, 1, 1, 1, 1, 1,
-0.6600952, 0.9319811, -1.792411, 1, 1, 1, 1, 1,
-0.6599854, 0.2833788, -0.8523941, 1, 1, 1, 1, 1,
-0.659835, -1.910954, -4.208971, 1, 1, 1, 1, 1,
-0.6567498, -0.9188741, -1.439443, 1, 1, 1, 1, 1,
-0.6505737, 1.150941, -0.5520985, 1, 1, 1, 1, 1,
-0.647688, 0.5435863, -0.8441155, 1, 1, 1, 1, 1,
-0.6451484, 0.9894087, -3.061256, 1, 1, 1, 1, 1,
-0.6410295, 2.508197, -0.552897, 1, 1, 1, 1, 1,
-0.6383142, 0.2041048, 0.1461327, 1, 1, 1, 1, 1,
-0.6355349, -0.007150255, -0.1365845, 1, 1, 1, 1, 1,
-0.6340262, 0.8361645, 0.4933805, 1, 1, 1, 1, 1,
-0.6328844, -0.4423689, -1.864651, 1, 1, 1, 1, 1,
-0.6325229, 1.351177, -0.7273487, 0, 0, 1, 1, 1,
-0.6320651, 0.8926115, -0.05499155, 1, 0, 0, 1, 1,
-0.6320473, 0.9640166, 0.8856387, 1, 0, 0, 1, 1,
-0.6305637, -0.2751996, -1.422131, 1, 0, 0, 1, 1,
-0.6290072, 1.012205, 0.4997615, 1, 0, 0, 1, 1,
-0.6284006, -0.1006246, -3.2052, 1, 0, 0, 1, 1,
-0.6278443, -0.1186265, -1.738414, 0, 0, 0, 1, 1,
-0.6121536, -1.388974, -1.482305, 0, 0, 0, 1, 1,
-0.6028177, -1.96383, -3.475385, 0, 0, 0, 1, 1,
-0.5923355, 1.208843, 0.8111418, 0, 0, 0, 1, 1,
-0.5898275, -0.4303618, -3.099375, 0, 0, 0, 1, 1,
-0.582395, 1.018282, -0.6264955, 0, 0, 0, 1, 1,
-0.5804772, -0.2096314, -2.031613, 0, 0, 0, 1, 1,
-0.5755935, 1.074969, -2.371684, 1, 1, 1, 1, 1,
-0.5744258, -0.4427409, -3.535118, 1, 1, 1, 1, 1,
-0.5696083, 0.9219165, -0.8661823, 1, 1, 1, 1, 1,
-0.5622323, 0.6165763, 0.4563349, 1, 1, 1, 1, 1,
-0.55793, 0.9689774, -0.4908873, 1, 1, 1, 1, 1,
-0.551802, 0.2171592, -0.4573222, 1, 1, 1, 1, 1,
-0.5511441, -1.333236, -2.391098, 1, 1, 1, 1, 1,
-0.5488706, 0.3348874, -1.026382, 1, 1, 1, 1, 1,
-0.5368094, -2.195999, -2.533491, 1, 1, 1, 1, 1,
-0.525, -0.7764799, -1.825032, 1, 1, 1, 1, 1,
-0.5220819, 0.04816169, -0.9436094, 1, 1, 1, 1, 1,
-0.5165573, -1.624863, -4.474611, 1, 1, 1, 1, 1,
-0.5148595, -0.258215, -2.606505, 1, 1, 1, 1, 1,
-0.5130264, 0.8370323, -0.1049768, 1, 1, 1, 1, 1,
-0.5018504, 0.6512913, -2.006028, 1, 1, 1, 1, 1,
-0.4962584, -0.3770651, -0.9984478, 0, 0, 1, 1, 1,
-0.4923782, 0.6716996, -0.4435833, 1, 0, 0, 1, 1,
-0.4916598, 0.6178654, -0.8996162, 1, 0, 0, 1, 1,
-0.4878272, -0.7980046, -1.881841, 1, 0, 0, 1, 1,
-0.487218, -0.07331853, -1.108299, 1, 0, 0, 1, 1,
-0.4815232, 0.7820913, -0.2213154, 1, 0, 0, 1, 1,
-0.479494, -1.726928, -3.708059, 0, 0, 0, 1, 1,
-0.4793458, 0.5111749, -0.8765947, 0, 0, 0, 1, 1,
-0.4766987, 0.2658803, -0.420647, 0, 0, 0, 1, 1,
-0.4751547, 0.592732, -1.193133, 0, 0, 0, 1, 1,
-0.4698835, 1.178126, -0.8437796, 0, 0, 0, 1, 1,
-0.4687986, 2.065072, -0.09097135, 0, 0, 0, 1, 1,
-0.4674556, 2.728729, -0.2111559, 0, 0, 0, 1, 1,
-0.4607889, -0.1592396, -0.8759872, 1, 1, 1, 1, 1,
-0.4597634, -1.701185, -1.450336, 1, 1, 1, 1, 1,
-0.4575589, -0.3572789, -2.214962, 1, 1, 1, 1, 1,
-0.4506075, -0.8326679, -3.568765, 1, 1, 1, 1, 1,
-0.4505831, 0.138602, -1.685838, 1, 1, 1, 1, 1,
-0.4463094, 1.873601, -0.6043218, 1, 1, 1, 1, 1,
-0.4458757, -0.7194545, -2.763831, 1, 1, 1, 1, 1,
-0.4433996, -0.1631902, -1.643345, 1, 1, 1, 1, 1,
-0.4424785, -0.4674289, -3.395847, 1, 1, 1, 1, 1,
-0.4418203, 1.419152, 0.1108948, 1, 1, 1, 1, 1,
-0.4417167, -1.131167, -2.309788, 1, 1, 1, 1, 1,
-0.4348342, 0.9551573, 0.6199422, 1, 1, 1, 1, 1,
-0.4338619, -0.2537674, -3.122121, 1, 1, 1, 1, 1,
-0.4292076, 1.15619, 0.2046088, 1, 1, 1, 1, 1,
-0.4227015, -1.193, -2.253963, 1, 1, 1, 1, 1,
-0.4219716, 0.7316988, 1.175907, 0, 0, 1, 1, 1,
-0.4217428, -1.405012, -3.320867, 1, 0, 0, 1, 1,
-0.4201505, -0.943809, -2.399425, 1, 0, 0, 1, 1,
-0.4200869, 0.5027584, -1.583021, 1, 0, 0, 1, 1,
-0.4193109, 1.928089, -2.03378, 1, 0, 0, 1, 1,
-0.4174547, 0.8804547, -1.484434, 1, 0, 0, 1, 1,
-0.4149114, 0.5496397, -0.08105443, 0, 0, 0, 1, 1,
-0.4145826, 0.4667468, -0.7119269, 0, 0, 0, 1, 1,
-0.4093394, -0.4031227, -4.768945, 0, 0, 0, 1, 1,
-0.4092954, 0.2056761, -1.168197, 0, 0, 0, 1, 1,
-0.4084163, 2.593355, -0.3514007, 0, 0, 0, 1, 1,
-0.407083, -1.122679, -3.516564, 0, 0, 0, 1, 1,
-0.4070542, 0.7372898, -1.22102, 0, 0, 0, 1, 1,
-0.4059229, -0.1216611, -1.10898, 1, 1, 1, 1, 1,
-0.4042425, 0.4380988, -3.661847, 1, 1, 1, 1, 1,
-0.4040913, 0.3287054, 0.290453, 1, 1, 1, 1, 1,
-0.4012586, 0.4706893, -0.09249086, 1, 1, 1, 1, 1,
-0.4001435, -0.5207245, -2.23499, 1, 1, 1, 1, 1,
-0.3994962, 0.7962074, 0.8472732, 1, 1, 1, 1, 1,
-0.3991122, 0.3591758, -1.127769, 1, 1, 1, 1, 1,
-0.3986808, 0.6133681, -1.029992, 1, 1, 1, 1, 1,
-0.397677, -0.1537992, -2.100181, 1, 1, 1, 1, 1,
-0.3976041, 1.429217, -0.6556497, 1, 1, 1, 1, 1,
-0.3963928, 0.01583129, -2.730761, 1, 1, 1, 1, 1,
-0.3937525, 1.025256, -1.314685, 1, 1, 1, 1, 1,
-0.3935524, -0.9196174, -2.482357, 1, 1, 1, 1, 1,
-0.3914518, -0.9282814, -3.87013, 1, 1, 1, 1, 1,
-0.3880972, 1.702469, 0.1839574, 1, 1, 1, 1, 1,
-0.3870029, 1.163777, -0.3057134, 0, 0, 1, 1, 1,
-0.3829484, -0.04885368, -1.600664, 1, 0, 0, 1, 1,
-0.38066, 1.3728, 1.250495, 1, 0, 0, 1, 1,
-0.3800446, 0.6048229, -0.03920572, 1, 0, 0, 1, 1,
-0.3768843, -0.9372501, -3.403112, 1, 0, 0, 1, 1,
-0.3745321, -0.6732749, -1.815367, 1, 0, 0, 1, 1,
-0.3732675, -0.3140975, -3.073859, 0, 0, 0, 1, 1,
-0.3602182, 1.040556, -0.2925949, 0, 0, 0, 1, 1,
-0.3581576, -0.2807298, -3.75455, 0, 0, 0, 1, 1,
-0.353626, -0.7954422, -2.397034, 0, 0, 0, 1, 1,
-0.3522784, -0.1922211, -3.198296, 0, 0, 0, 1, 1,
-0.3507273, -0.3305638, -0.4611534, 0, 0, 0, 1, 1,
-0.348326, -0.8307313, -2.560732, 0, 0, 0, 1, 1,
-0.3460795, 0.04842699, -0.7400603, 1, 1, 1, 1, 1,
-0.3251225, -1.714152, -4.499601, 1, 1, 1, 1, 1,
-0.3246594, 2.015975, -1.655782, 1, 1, 1, 1, 1,
-0.3224904, 0.5777799, 1.203536, 1, 1, 1, 1, 1,
-0.3190054, 0.09188005, -1.373244, 1, 1, 1, 1, 1,
-0.31463, 0.2069339, -0.7340797, 1, 1, 1, 1, 1,
-0.3113924, -0.6261095, -3.287366, 1, 1, 1, 1, 1,
-0.3073967, 1.124788, -0.4019689, 1, 1, 1, 1, 1,
-0.3071524, 0.6317781, 0.9894963, 1, 1, 1, 1, 1,
-0.3068044, -0.8139047, -3.567689, 1, 1, 1, 1, 1,
-0.3038737, 0.3837783, 1.440629, 1, 1, 1, 1, 1,
-0.3023072, -0.3838013, -3.699666, 1, 1, 1, 1, 1,
-0.3011307, -0.7020853, -1.335823, 1, 1, 1, 1, 1,
-0.2983788, -0.2471971, -2.638853, 1, 1, 1, 1, 1,
-0.2968507, -0.3205034, -2.323587, 1, 1, 1, 1, 1,
-0.2962009, -0.0244813, -2.500641, 0, 0, 1, 1, 1,
-0.2954094, 1.301539, -0.2022666, 1, 0, 0, 1, 1,
-0.2914425, -0.9375682, -3.208372, 1, 0, 0, 1, 1,
-0.2894697, 0.9274696, 1.637709, 1, 0, 0, 1, 1,
-0.2892155, 0.6898671, 0.6827528, 1, 0, 0, 1, 1,
-0.2872991, 0.7036362, 0.1037358, 1, 0, 0, 1, 1,
-0.2855045, -1.065249, -3.531254, 0, 0, 0, 1, 1,
-0.2846154, 1.062599, -1.385901, 0, 0, 0, 1, 1,
-0.2842534, 0.7097061, 0.06306396, 0, 0, 0, 1, 1,
-0.2827125, -0.272245, -1.411815, 0, 0, 0, 1, 1,
-0.2774313, 0.859868, -0.5382031, 0, 0, 0, 1, 1,
-0.2736926, 0.2379005, -0.3085129, 0, 0, 0, 1, 1,
-0.2722448, 0.08788425, -0.5273623, 0, 0, 0, 1, 1,
-0.2711189, 1.510275, -0.8853174, 1, 1, 1, 1, 1,
-0.2686751, 0.7515813, -2.087341, 1, 1, 1, 1, 1,
-0.2646455, 0.1784375, -2.076153, 1, 1, 1, 1, 1,
-0.263991, -0.5903081, -2.410111, 1, 1, 1, 1, 1,
-0.2573834, -0.2660358, -2.813781, 1, 1, 1, 1, 1,
-0.2567146, -2.38993, -3.076137, 1, 1, 1, 1, 1,
-0.2535818, -0.218184, -3.803086, 1, 1, 1, 1, 1,
-0.2516984, -0.2976486, -3.751239, 1, 1, 1, 1, 1,
-0.2426656, 0.6565931, -0.1360874, 1, 1, 1, 1, 1,
-0.2414118, 1.151663, -0.7614464, 1, 1, 1, 1, 1,
-0.2371451, -0.2848756, -1.823887, 1, 1, 1, 1, 1,
-0.2331823, -0.8008894, -2.869049, 1, 1, 1, 1, 1,
-0.2286848, 0.3599821, -1.280734, 1, 1, 1, 1, 1,
-0.2284701, -1.32487, -3.349429, 1, 1, 1, 1, 1,
-0.2279249, 0.7880762, -0.2331583, 1, 1, 1, 1, 1,
-0.2261506, 0.5180407, -0.2406067, 0, 0, 1, 1, 1,
-0.2255477, 0.03825893, -3.340298, 1, 0, 0, 1, 1,
-0.2247019, 1.040741, 0.1523611, 1, 0, 0, 1, 1,
-0.2244229, 0.2757602, -1.545582, 1, 0, 0, 1, 1,
-0.2228426, -0.2709667, -2.807803, 1, 0, 0, 1, 1,
-0.2218713, 0.05004231, -0.6259544, 1, 0, 0, 1, 1,
-0.2214862, 0.6911956, 0.62156, 0, 0, 0, 1, 1,
-0.2208443, -0.4543104, -2.698388, 0, 0, 0, 1, 1,
-0.2191898, -0.652473, -4.004934, 0, 0, 0, 1, 1,
-0.215537, 0.5867552, -0.17438, 0, 0, 0, 1, 1,
-0.2139006, -0.9054013, -2.091066, 0, 0, 0, 1, 1,
-0.2137306, -0.07018635, -2.332374, 0, 0, 0, 1, 1,
-0.2112538, -1.891959, -2.495492, 0, 0, 0, 1, 1,
-0.2104626, -0.9599082, -1.979142, 1, 1, 1, 1, 1,
-0.2072332, 0.04492876, -0.3048415, 1, 1, 1, 1, 1,
-0.2046477, 0.5077486, 0.1697316, 1, 1, 1, 1, 1,
-0.2026964, -0.5494823, -1.865105, 1, 1, 1, 1, 1,
-0.2012071, 0.4777866, 0.1027068, 1, 1, 1, 1, 1,
-0.2007283, -0.6865889, -4.508039, 1, 1, 1, 1, 1,
-0.1999628, 0.8180034, -0.1869939, 1, 1, 1, 1, 1,
-0.1905969, -0.4654934, -3.144326, 1, 1, 1, 1, 1,
-0.1894987, -0.9493541, -1.988104, 1, 1, 1, 1, 1,
-0.1877466, -1.088263, -4.935426, 1, 1, 1, 1, 1,
-0.1844419, -0.7815457, -3.766029, 1, 1, 1, 1, 1,
-0.1778285, -2.376815, -2.331972, 1, 1, 1, 1, 1,
-0.1767313, 0.03340821, -0.9003456, 1, 1, 1, 1, 1,
-0.1762952, 0.9051837, -1.976895, 1, 1, 1, 1, 1,
-0.1749861, 0.2657894, -0.9005749, 1, 1, 1, 1, 1,
-0.1728045, 0.5119535, -1.090037, 0, 0, 1, 1, 1,
-0.1722579, -0.2238276, -2.595537, 1, 0, 0, 1, 1,
-0.1701315, 0.2388767, -2.630836, 1, 0, 0, 1, 1,
-0.1687277, 1.36907, 0.242152, 1, 0, 0, 1, 1,
-0.1663345, 0.7948838, -0.3372244, 1, 0, 0, 1, 1,
-0.1662666, -0.4080203, -1.957574, 1, 0, 0, 1, 1,
-0.1653818, -0.5725472, -2.273322, 0, 0, 0, 1, 1,
-0.1592541, -0.5390758, -2.276555, 0, 0, 0, 1, 1,
-0.1572362, -0.2644131, -2.386475, 0, 0, 0, 1, 1,
-0.1543538, 1.881196, 0.998046, 0, 0, 0, 1, 1,
-0.1526331, -1.05041, -1.516443, 0, 0, 0, 1, 1,
-0.1509414, -0.01844527, -0.7275677, 0, 0, 0, 1, 1,
-0.1504594, 0.8863522, -0.05456534, 0, 0, 0, 1, 1,
-0.143379, 1.515334, -0.1733047, 1, 1, 1, 1, 1,
-0.143209, -1.151363, -3.433673, 1, 1, 1, 1, 1,
-0.1363328, 0.2512762, -0.01699375, 1, 1, 1, 1, 1,
-0.1357034, -2.758339, -5.004155, 1, 1, 1, 1, 1,
-0.133641, -0.3266081, -2.471683, 1, 1, 1, 1, 1,
-0.1324243, 1.153755, 0.101451, 1, 1, 1, 1, 1,
-0.1321944, -1.044152, -2.302195, 1, 1, 1, 1, 1,
-0.124639, -0.09626317, -2.179801, 1, 1, 1, 1, 1,
-0.1242833, 0.6952823, 0.5100152, 1, 1, 1, 1, 1,
-0.1236991, -2.154938, -3.670021, 1, 1, 1, 1, 1,
-0.1218762, -1.277113, -3.639903, 1, 1, 1, 1, 1,
-0.1212949, -0.3262354, -1.520077, 1, 1, 1, 1, 1,
-0.1092736, 0.7841966, 1.140247, 1, 1, 1, 1, 1,
-0.104927, 0.3729329, -0.2109395, 1, 1, 1, 1, 1,
-0.101123, 0.911221, -0.1732632, 1, 1, 1, 1, 1,
-0.09794, -1.064147, -3.195751, 0, 0, 1, 1, 1,
-0.09055198, -0.123928, -2.490857, 1, 0, 0, 1, 1,
-0.08246046, -0.8872715, -4.095784, 1, 0, 0, 1, 1,
-0.08016034, -1.240628, -2.731112, 1, 0, 0, 1, 1,
-0.07882982, -0.7855142, -3.345304, 1, 0, 0, 1, 1,
-0.07739607, 0.1092561, 1.118812, 1, 0, 0, 1, 1,
-0.07158695, -1.031871, -2.947695, 0, 0, 0, 1, 1,
-0.06996686, 0.03341123, -2.143268, 0, 0, 0, 1, 1,
-0.06972648, -0.004332533, -1.595549, 0, 0, 0, 1, 1,
-0.06600025, 0.9041271, -0.1459621, 0, 0, 0, 1, 1,
-0.06369, 0.1312439, -0.8468323, 0, 0, 0, 1, 1,
-0.06134955, 0.5368496, 0.003065123, 0, 0, 0, 1, 1,
-0.05729881, 0.5762183, 0.4937019, 0, 0, 0, 1, 1,
-0.05507502, -0.3401717, -2.737023, 1, 1, 1, 1, 1,
-0.05302631, -0.7270141, -2.854712, 1, 1, 1, 1, 1,
-0.05203031, 0.1375153, -1.738201, 1, 1, 1, 1, 1,
-0.05042548, 0.840679, -0.9398154, 1, 1, 1, 1, 1,
-0.05012172, -1.388434, -4.03282, 1, 1, 1, 1, 1,
-0.04539003, 0.7913495, -0.2241152, 1, 1, 1, 1, 1,
-0.04310039, 0.09134912, -0.904865, 1, 1, 1, 1, 1,
-0.03641975, -0.5909343, -1.475666, 1, 1, 1, 1, 1,
-0.03235403, 1.151764, 0.883426, 1, 1, 1, 1, 1,
-0.03089977, 0.7845035, -0.9166966, 1, 1, 1, 1, 1,
-0.03058905, 0.03820016, -1.73931, 1, 1, 1, 1, 1,
-0.03047796, 1.574298, 0.7731458, 1, 1, 1, 1, 1,
-0.02844166, -0.785523, -2.741437, 1, 1, 1, 1, 1,
-0.02775708, 0.3198954, 1.231426, 1, 1, 1, 1, 1,
-0.02482345, -1.670224, -2.487134, 1, 1, 1, 1, 1,
-0.02116664, -0.5458033, -5.325053, 0, 0, 1, 1, 1,
-0.02085664, 0.3180715, -1.54254, 1, 0, 0, 1, 1,
-0.01671959, -0.05168903, -2.797218, 1, 0, 0, 1, 1,
-0.01262753, -2.224744, -3.379956, 1, 0, 0, 1, 1,
-0.01104823, 0.8956276, 0.7664493, 1, 0, 0, 1, 1,
-0.01030746, -0.05781254, -3.046332, 1, 0, 0, 1, 1,
-0.0006442206, 0.8374482, 0.1294855, 0, 0, 0, 1, 1,
0.001759501, -0.9670818, 2.777217, 0, 0, 0, 1, 1,
0.003131876, 0.5153592, 1.035233, 0, 0, 0, 1, 1,
0.003700284, 0.005943779, 1.939536, 0, 0, 0, 1, 1,
0.004895952, 0.619413, -1.587736, 0, 0, 0, 1, 1,
0.005720274, 0.9471028, 0.1212536, 0, 0, 0, 1, 1,
0.01407733, -0.622107, 4.59035, 0, 0, 0, 1, 1,
0.0169195, -0.003346333, 1.624578, 1, 1, 1, 1, 1,
0.02156843, 1.168856, -1.530874, 1, 1, 1, 1, 1,
0.0257894, -0.5641999, 1.720136, 1, 1, 1, 1, 1,
0.02769444, 2.555603, -0.4676149, 1, 1, 1, 1, 1,
0.02944134, -0.9056991, 4.121979, 1, 1, 1, 1, 1,
0.02980968, -0.7414438, 1.304333, 1, 1, 1, 1, 1,
0.03048475, 0.5324833, -0.9590373, 1, 1, 1, 1, 1,
0.0321337, -0.1854815, 4.810233, 1, 1, 1, 1, 1,
0.04099508, 0.7466034, 1.10258, 1, 1, 1, 1, 1,
0.04166586, -0.6362668, 3.491388, 1, 1, 1, 1, 1,
0.04210138, 1.897759, 0.7856437, 1, 1, 1, 1, 1,
0.04282791, 1.073026, -0.05092444, 1, 1, 1, 1, 1,
0.04371599, -1.607283, 3.463312, 1, 1, 1, 1, 1,
0.0442632, -0.8098301, 4.13079, 1, 1, 1, 1, 1,
0.04819424, -0.4110514, 2.29542, 1, 1, 1, 1, 1,
0.05314198, -0.6429183, 4.152428, 0, 0, 1, 1, 1,
0.05586575, 0.4332437, -0.337487, 1, 0, 0, 1, 1,
0.05717717, -0.673116, 4.232266, 1, 0, 0, 1, 1,
0.05821051, -1.003713, 2.208987, 1, 0, 0, 1, 1,
0.0616158, 0.2639821, 0.9341893, 1, 0, 0, 1, 1,
0.06401908, -0.2728361, 2.82006, 1, 0, 0, 1, 1,
0.06771994, -0.9816087, 2.039727, 0, 0, 0, 1, 1,
0.06817225, -0.4463834, 3.097017, 0, 0, 0, 1, 1,
0.07626768, -1.210652, 3.621705, 0, 0, 0, 1, 1,
0.07764697, -0.07251084, 1.270158, 0, 0, 0, 1, 1,
0.07795524, -0.2277615, 3.289342, 0, 0, 0, 1, 1,
0.07832552, 0.387087, -1.749673, 0, 0, 0, 1, 1,
0.08527608, -0.7220866, 3.201169, 0, 0, 0, 1, 1,
0.08688519, -0.75783, 1.781291, 1, 1, 1, 1, 1,
0.0892369, -0.05858777, 3.092958, 1, 1, 1, 1, 1,
0.09254736, -0.5635597, 2.488827, 1, 1, 1, 1, 1,
0.09320396, -3.022111, 4.099346, 1, 1, 1, 1, 1,
0.09416017, 0.4894249, -0.6302324, 1, 1, 1, 1, 1,
0.09487571, -1.075018, 3.655734, 1, 1, 1, 1, 1,
0.09705891, 0.190589, -1.334059, 1, 1, 1, 1, 1,
0.09897487, 0.9259408, -0.3548715, 1, 1, 1, 1, 1,
0.09935333, 0.9900799, 0.02940975, 1, 1, 1, 1, 1,
0.1003973, 0.134973, -0.3790017, 1, 1, 1, 1, 1,
0.1075663, 0.4019138, 2.176639, 1, 1, 1, 1, 1,
0.1077124, 1.281992, 0.07178649, 1, 1, 1, 1, 1,
0.1117162, -1.822762, 3.13399, 1, 1, 1, 1, 1,
0.1135465, 1.232358, 0.4538405, 1, 1, 1, 1, 1,
0.1140698, 1.152982, 0.1450755, 1, 1, 1, 1, 1,
0.1176928, 1.144248, -0.9107141, 0, 0, 1, 1, 1,
0.1180418, -0.7653332, 1.903522, 1, 0, 0, 1, 1,
0.1181873, -0.8231937, 3.919512, 1, 0, 0, 1, 1,
0.1193785, 0.2765421, 1.881177, 1, 0, 0, 1, 1,
0.1253717, -0.5072841, 3.217687, 1, 0, 0, 1, 1,
0.1258339, 1.317381, -0.2613146, 1, 0, 0, 1, 1,
0.1262213, -0.7985089, 5.713965, 0, 0, 0, 1, 1,
0.1265153, -1.91534, 3.880083, 0, 0, 0, 1, 1,
0.1287148, -0.1266203, 2.866796, 0, 0, 0, 1, 1,
0.1309708, 0.4408174, 0.2424537, 0, 0, 0, 1, 1,
0.1356115, 0.1782176, -1.406361, 0, 0, 0, 1, 1,
0.1414932, 1.233412, -0.4970185, 0, 0, 0, 1, 1,
0.1417571, 1.175551, 0.3013847, 0, 0, 0, 1, 1,
0.1421186, 1.307576, -0.7947372, 1, 1, 1, 1, 1,
0.1454239, 0.8828329, 0.6855593, 1, 1, 1, 1, 1,
0.1455185, -0.09966538, 1.277457, 1, 1, 1, 1, 1,
0.1467605, -0.9221873, 1.171366, 1, 1, 1, 1, 1,
0.1468817, -0.7361527, 2.633085, 1, 1, 1, 1, 1,
0.1490258, -0.8300642, 3.189281, 1, 1, 1, 1, 1,
0.1541453, 0.9521347, 0.617236, 1, 1, 1, 1, 1,
0.1545615, 0.6797775, -1.16103, 1, 1, 1, 1, 1,
0.1564651, 0.6320333, 0.8834178, 1, 1, 1, 1, 1,
0.1582722, 0.7772319, 0.9624814, 1, 1, 1, 1, 1,
0.1608561, 1.007559, -0.1918002, 1, 1, 1, 1, 1,
0.161621, 0.6180528, 0.8889928, 1, 1, 1, 1, 1,
0.1641342, -0.8930792, 2.481062, 1, 1, 1, 1, 1,
0.1642528, 0.7170974, -1.226828, 1, 1, 1, 1, 1,
0.1660217, 0.3617297, -0.2608985, 1, 1, 1, 1, 1,
0.1704336, -0.3532916, 1.857668, 0, 0, 1, 1, 1,
0.1710819, -0.7222694, 3.508777, 1, 0, 0, 1, 1,
0.1722061, -2.041428, 2.807082, 1, 0, 0, 1, 1,
0.1814199, 0.1520091, 1.500483, 1, 0, 0, 1, 1,
0.1827786, 0.5166605, 2.10582, 1, 0, 0, 1, 1,
0.1831652, 0.2042636, -0.285848, 1, 0, 0, 1, 1,
0.1919933, 2.099063, 1.080599, 0, 0, 0, 1, 1,
0.1921595, -1.135255, 3.299313, 0, 0, 0, 1, 1,
0.193208, -0.2904294, 2.456, 0, 0, 0, 1, 1,
0.193419, -0.5179554, 1.572772, 0, 0, 0, 1, 1,
0.1936588, 1.332693, 0.6577999, 0, 0, 0, 1, 1,
0.1937983, 1.105505, 0.3147837, 0, 0, 0, 1, 1,
0.1992931, -0.8409159, 5.629488, 0, 0, 0, 1, 1,
0.2054218, 0.32386, -0.7232897, 1, 1, 1, 1, 1,
0.2063439, -1.555254, 2.991887, 1, 1, 1, 1, 1,
0.2078174, 0.2222322, 0.2421772, 1, 1, 1, 1, 1,
0.2104553, -0.417762, 2.955776, 1, 1, 1, 1, 1,
0.2115431, 0.9081314, 0.09743392, 1, 1, 1, 1, 1,
0.2124309, 0.9225037, -1.277864, 1, 1, 1, 1, 1,
0.212799, -1.816993, 2.921582, 1, 1, 1, 1, 1,
0.2194922, -2.006515, 3.613181, 1, 1, 1, 1, 1,
0.2227005, -0.09379705, 1.394736, 1, 1, 1, 1, 1,
0.2279594, -0.09977289, 2.167603, 1, 1, 1, 1, 1,
0.2297205, 1.87461, 1.741564, 1, 1, 1, 1, 1,
0.2304064, 1.154956, -0.6220326, 1, 1, 1, 1, 1,
0.2307901, -1.496287, 1.619044, 1, 1, 1, 1, 1,
0.2313309, -0.0838997, 1.203002, 1, 1, 1, 1, 1,
0.2319534, -0.3095312, 2.101727, 1, 1, 1, 1, 1,
0.232413, -1.540629, 2.2961, 0, 0, 1, 1, 1,
0.2378037, -0.6241045, 1.973267, 1, 0, 0, 1, 1,
0.246439, 0.8456624, 0.5280164, 1, 0, 0, 1, 1,
0.2509504, 0.006141531, 1.270944, 1, 0, 0, 1, 1,
0.2560579, -1.215047, 4.258581, 1, 0, 0, 1, 1,
0.2569549, -1.895644, 3.073742, 1, 0, 0, 1, 1,
0.2595872, 0.8693957, 0.7620235, 0, 0, 0, 1, 1,
0.2597187, -0.6524028, 2.717366, 0, 0, 0, 1, 1,
0.2625484, 0.002931849, 2.571193, 0, 0, 0, 1, 1,
0.2631181, -0.4510166, 2.8544, 0, 0, 0, 1, 1,
0.2704108, 0.5540107, -0.4443575, 0, 0, 0, 1, 1,
0.2748376, -0.1909772, 1.365647, 0, 0, 0, 1, 1,
0.2755169, 0.02283895, 1.813294, 0, 0, 0, 1, 1,
0.2774193, 1.928732, 1.303174, 1, 1, 1, 1, 1,
0.2774278, 0.3708561, -1.118846, 1, 1, 1, 1, 1,
0.2787313, -0.133938, 0.7402254, 1, 1, 1, 1, 1,
0.2798517, -1.117626, 3.306994, 1, 1, 1, 1, 1,
0.2868938, -0.1213862, 1.202949, 1, 1, 1, 1, 1,
0.286995, -1.753006, 2.705206, 1, 1, 1, 1, 1,
0.2916404, 1.164903, 0.04964693, 1, 1, 1, 1, 1,
0.2946541, -2.244151, 2.29215, 1, 1, 1, 1, 1,
0.3043552, 0.146152, 0.04628069, 1, 1, 1, 1, 1,
0.3075199, -0.7510058, 1.332474, 1, 1, 1, 1, 1,
0.3098439, 1.513409, -0.6560454, 1, 1, 1, 1, 1,
0.3118039, 1.619812, -0.8360535, 1, 1, 1, 1, 1,
0.3125881, 0.4017133, -0.7332625, 1, 1, 1, 1, 1,
0.3128361, 0.9375876, -0.2032959, 1, 1, 1, 1, 1,
0.3191166, 2.276717, -0.3223028, 1, 1, 1, 1, 1,
0.3256102, -0.757798, 3.760654, 0, 0, 1, 1, 1,
0.3265124, 1.219637, -0.6268396, 1, 0, 0, 1, 1,
0.3271495, 0.7877603, -0.7490113, 1, 0, 0, 1, 1,
0.327716, -1.491295, 2.908553, 1, 0, 0, 1, 1,
0.3345844, -1.490276, 3.588099, 1, 0, 0, 1, 1,
0.3346143, 0.878176, -1.429684, 1, 0, 0, 1, 1,
0.3386312, 0.3263393, 1.594529, 0, 0, 0, 1, 1,
0.3396977, -1.270058, 2.857116, 0, 0, 0, 1, 1,
0.3419217, -0.9839606, 2.322008, 0, 0, 0, 1, 1,
0.3432613, -0.9236664, 2.777145, 0, 0, 0, 1, 1,
0.3447518, 0.1678673, 1.194755, 0, 0, 0, 1, 1,
0.3470433, 0.5659066, 0.7983477, 0, 0, 0, 1, 1,
0.3472657, 1.728432, 1.182646, 0, 0, 0, 1, 1,
0.3484807, -0.6800709, 4.311144, 1, 1, 1, 1, 1,
0.3607442, 1.388875, -1.469108, 1, 1, 1, 1, 1,
0.3654267, 2.250717, 0.4132046, 1, 1, 1, 1, 1,
0.3656304, -1.98117, 1.72082, 1, 1, 1, 1, 1,
0.3680696, -0.1910153, 2.605541, 1, 1, 1, 1, 1,
0.3699941, -1.070709, 1.428515, 1, 1, 1, 1, 1,
0.3716244, -1.163714, 2.921061, 1, 1, 1, 1, 1,
0.3729123, -1.461381, 4.348477, 1, 1, 1, 1, 1,
0.3772225, -0.07584082, 2.629058, 1, 1, 1, 1, 1,
0.3820959, 0.1248972, 2.682297, 1, 1, 1, 1, 1,
0.3840206, -1.549595, 1.730301, 1, 1, 1, 1, 1,
0.3849686, -0.3732365, 2.617248, 1, 1, 1, 1, 1,
0.3857923, -0.08596043, 2.41212, 1, 1, 1, 1, 1,
0.3862534, -1.460774, 3.410717, 1, 1, 1, 1, 1,
0.3932258, -1.374404, 1.868165, 1, 1, 1, 1, 1,
0.393626, 1.037786, 0.5889649, 0, 0, 1, 1, 1,
0.3945018, -0.2135333, 2.452594, 1, 0, 0, 1, 1,
0.3958339, -0.1500173, 0.9690405, 1, 0, 0, 1, 1,
0.4038086, 0.9527038, 0.2765541, 1, 0, 0, 1, 1,
0.4042234, 0.8498701, -0.2062338, 1, 0, 0, 1, 1,
0.4052592, 0.03207253, 0.2765723, 1, 0, 0, 1, 1,
0.406332, -0.6345545, 1.75623, 0, 0, 0, 1, 1,
0.4066754, 2.172633, -0.5192468, 0, 0, 0, 1, 1,
0.4075657, 0.5325518, 1.920318, 0, 0, 0, 1, 1,
0.409331, 0.09625559, 1.044446, 0, 0, 0, 1, 1,
0.4142901, -1.315841, 0.4635938, 0, 0, 0, 1, 1,
0.4159118, -0.7433239, 2.646561, 0, 0, 0, 1, 1,
0.4173041, 1.012658, 0.5711094, 0, 0, 0, 1, 1,
0.4222598, -0.7975717, 3.86636, 1, 1, 1, 1, 1,
0.4311537, 0.1207127, 2.208879, 1, 1, 1, 1, 1,
0.431967, -0.3584814, 3.13673, 1, 1, 1, 1, 1,
0.4327377, 0.5903331, 1.458757, 1, 1, 1, 1, 1,
0.4338698, -1.347522, 2.722633, 1, 1, 1, 1, 1,
0.4367503, 1.506474, 0.4824203, 1, 1, 1, 1, 1,
0.4390991, 0.2481469, 2.680257, 1, 1, 1, 1, 1,
0.4403664, -0.4034185, 0.3389785, 1, 1, 1, 1, 1,
0.443649, -0.5115127, 1.242961, 1, 1, 1, 1, 1,
0.4510332, -0.7145831, 1.638173, 1, 1, 1, 1, 1,
0.4526388, 0.5432102, 0.6396907, 1, 1, 1, 1, 1,
0.4533772, 0.2522859, 0.6690465, 1, 1, 1, 1, 1,
0.4577332, -1.147698, 2.947287, 1, 1, 1, 1, 1,
0.458701, -0.5190811, 2.16518, 1, 1, 1, 1, 1,
0.4599963, 0.3472483, 2.498986, 1, 1, 1, 1, 1,
0.4627473, -1.111514, 3.508173, 0, 0, 1, 1, 1,
0.4641564, 0.2896966, 0.8003498, 1, 0, 0, 1, 1,
0.4689792, 0.6129366, 1.521425, 1, 0, 0, 1, 1,
0.4699083, -1.040346, 1.685546, 1, 0, 0, 1, 1,
0.4708763, 0.07829887, 3.223598, 1, 0, 0, 1, 1,
0.4753624, -0.36908, 0.9952474, 1, 0, 0, 1, 1,
0.4791945, 0.0621352, 0.4920222, 0, 0, 0, 1, 1,
0.4806221, 2.836515, 0.0629852, 0, 0, 0, 1, 1,
0.4823372, 0.1482165, 1.145968, 0, 0, 0, 1, 1,
0.4829408, -1.838632, 2.642263, 0, 0, 0, 1, 1,
0.4860822, 0.4067903, 2.051051, 0, 0, 0, 1, 1,
0.4893589, -0.4449856, 2.204343, 0, 0, 0, 1, 1,
0.4925441, -0.6250325, 2.267287, 0, 0, 0, 1, 1,
0.4939065, 1.318176, 0.4227429, 1, 1, 1, 1, 1,
0.4940285, 1.737271, 0.1385065, 1, 1, 1, 1, 1,
0.4954741, 1.552883, 0.03248657, 1, 1, 1, 1, 1,
0.4999996, 0.6360292, 0.3111834, 1, 1, 1, 1, 1,
0.5014684, 1.820702, 0.8768852, 1, 1, 1, 1, 1,
0.5017667, -0.6111822, 1.476285, 1, 1, 1, 1, 1,
0.5048653, 1.423237, -1.223696, 1, 1, 1, 1, 1,
0.5066237, -0.7186602, 3.771003, 1, 1, 1, 1, 1,
0.5073122, -0.04956022, 2.635666, 1, 1, 1, 1, 1,
0.5102082, -2.548991, 4.08672, 1, 1, 1, 1, 1,
0.5144737, 1.483875, 0.836484, 1, 1, 1, 1, 1,
0.5147486, -0.4966486, 2.091438, 1, 1, 1, 1, 1,
0.5197812, -0.07917263, 2.257243, 1, 1, 1, 1, 1,
0.5240277, -1.262993, 2.213866, 1, 1, 1, 1, 1,
0.5375262, 0.1297996, 2.067112, 1, 1, 1, 1, 1,
0.5430841, 0.4584667, -0.305638, 0, 0, 1, 1, 1,
0.5430916, -0.06629167, 0.8127345, 1, 0, 0, 1, 1,
0.5439395, -0.4346161, 2.028381, 1, 0, 0, 1, 1,
0.5444445, 1.262067, -0.6410651, 1, 0, 0, 1, 1,
0.5496724, 0.3178755, 0.8536703, 1, 0, 0, 1, 1,
0.5551015, 0.6821559, 0.4228002, 1, 0, 0, 1, 1,
0.5615386, 0.2053877, -0.2012548, 0, 0, 0, 1, 1,
0.5718319, -1.15808, 0.6848421, 0, 0, 0, 1, 1,
0.5790772, 1.944096, -1.031953, 0, 0, 0, 1, 1,
0.5820911, 0.4334921, 0.793651, 0, 0, 0, 1, 1,
0.5928445, -0.5843878, 1.474381, 0, 0, 0, 1, 1,
0.5981146, -0.9008107, 1.990593, 0, 0, 0, 1, 1,
0.5995173, -0.3984302, 1.54956, 0, 0, 0, 1, 1,
0.6032497, 0.3987085, 1.272809, 1, 1, 1, 1, 1,
0.6086638, -1.212245, 4.704798, 1, 1, 1, 1, 1,
0.6136367, -0.227851, 2.243902, 1, 1, 1, 1, 1,
0.6169326, -0.1832421, 2.320869, 1, 1, 1, 1, 1,
0.6325045, -0.5850741, 2.207736, 1, 1, 1, 1, 1,
0.6351254, 0.8984677, -0.1227137, 1, 1, 1, 1, 1,
0.6481245, -1.553275, 2.791358, 1, 1, 1, 1, 1,
0.6522744, -0.06807899, 3.303138, 1, 1, 1, 1, 1,
0.6567301, 0.3146203, 2.211473, 1, 1, 1, 1, 1,
0.6578363, 0.6578355, 1.94628, 1, 1, 1, 1, 1,
0.6675368, 0.04570305, 2.79153, 1, 1, 1, 1, 1,
0.6682639, 0.1919017, 1.153967, 1, 1, 1, 1, 1,
0.6697641, 1.199729, -0.384796, 1, 1, 1, 1, 1,
0.6781636, 0.7746176, 0.9204912, 1, 1, 1, 1, 1,
0.6817122, 2.274493, 0.6742053, 1, 1, 1, 1, 1,
0.681743, 0.3804488, 0.866895, 0, 0, 1, 1, 1,
0.6830675, 0.3722492, 0.7595657, 1, 0, 0, 1, 1,
0.6831369, 0.6616349, -0.7344477, 1, 0, 0, 1, 1,
0.6883136, 0.3640607, 0.5573141, 1, 0, 0, 1, 1,
0.6886343, -1.045833, 3.195773, 1, 0, 0, 1, 1,
0.6937003, 1.06529, 1.268359, 1, 0, 0, 1, 1,
0.6956136, 0.3365914, 1.669217, 0, 0, 0, 1, 1,
0.6968263, 0.3773027, 1.97541, 0, 0, 0, 1, 1,
0.698779, -1.31176, 1.717885, 0, 0, 0, 1, 1,
0.6996176, 0.6097981, -1.575652, 0, 0, 0, 1, 1,
0.7011222, -0.7784986, 2.54067, 0, 0, 0, 1, 1,
0.7012231, -1.24561, 1.145444, 0, 0, 0, 1, 1,
0.7020942, 1.174822, 0.04754564, 0, 0, 0, 1, 1,
0.7033678, 0.209338, 1.256408, 1, 1, 1, 1, 1,
0.7036871, -1.718641, 2.408314, 1, 1, 1, 1, 1,
0.7041386, 1.493365, 0.4604221, 1, 1, 1, 1, 1,
0.70477, -0.4567659, 2.744639, 1, 1, 1, 1, 1,
0.7075123, -0.493196, 0.7842615, 1, 1, 1, 1, 1,
0.712834, 0.1760641, 2.122365, 1, 1, 1, 1, 1,
0.7142825, 0.9158955, 0.2359093, 1, 1, 1, 1, 1,
0.717093, -1.030524, 0.5794287, 1, 1, 1, 1, 1,
0.7200665, 0.2203642, 2.714587, 1, 1, 1, 1, 1,
0.7277573, -1.678315, 3.435192, 1, 1, 1, 1, 1,
0.7361135, 1.084747, 1.013406, 1, 1, 1, 1, 1,
0.7485237, -1.009151, 2.137591, 1, 1, 1, 1, 1,
0.7492254, -1.063018, 2.600379, 1, 1, 1, 1, 1,
0.75015, 0.3598566, 0.8355972, 1, 1, 1, 1, 1,
0.7516206, 0.7679889, -0.7973318, 1, 1, 1, 1, 1,
0.7520047, -0.2447936, 3.572887, 0, 0, 1, 1, 1,
0.7526177, 1.242725, -0.2069972, 1, 0, 0, 1, 1,
0.7570809, -0.5213367, 1.890036, 1, 0, 0, 1, 1,
0.7589351, 0.831349, 1.490963, 1, 0, 0, 1, 1,
0.7623227, -0.04990426, 0.8996494, 1, 0, 0, 1, 1,
0.7701519, 0.8448421, 3.525832, 1, 0, 0, 1, 1,
0.7716128, -0.5829548, 1.705446, 0, 0, 0, 1, 1,
0.7716869, 0.3361481, 1.784428, 0, 0, 0, 1, 1,
0.7717929, -1.219737, 3.676584, 0, 0, 0, 1, 1,
0.7751912, -0.256346, 0.9481517, 0, 0, 0, 1, 1,
0.7792952, -2.593866, 3.143117, 0, 0, 0, 1, 1,
0.7819522, 0.2462601, 1.195947, 0, 0, 0, 1, 1,
0.7828937, -0.1074988, 0.6854157, 0, 0, 0, 1, 1,
0.7854107, 1.351163, 1.051774, 1, 1, 1, 1, 1,
0.7892759, -0.5687062, 1.62923, 1, 1, 1, 1, 1,
0.7924645, -1.646224, 1.715136, 1, 1, 1, 1, 1,
0.7964132, -0.1510591, 1.609569, 1, 1, 1, 1, 1,
0.8035646, -1.015463, 1.284366, 1, 1, 1, 1, 1,
0.8054985, 1.017678, -0.172119, 1, 1, 1, 1, 1,
0.8058453, -0.2324404, 0.6442395, 1, 1, 1, 1, 1,
0.8114216, 0.399026, -0.2255467, 1, 1, 1, 1, 1,
0.8206458, 0.6506597, 1.595042, 1, 1, 1, 1, 1,
0.8213741, 0.7803345, 1.753889, 1, 1, 1, 1, 1,
0.8277851, -0.2464879, 4.120687, 1, 1, 1, 1, 1,
0.8278401, 0.5924108, 0.2152781, 1, 1, 1, 1, 1,
0.828764, 0.6254469, 1.82772, 1, 1, 1, 1, 1,
0.8337667, 1.616013, 2.360122, 1, 1, 1, 1, 1,
0.8414375, -0.2802483, 2.47729, 1, 1, 1, 1, 1,
0.841535, 0.1356802, 1.389421, 0, 0, 1, 1, 1,
0.8448822, 0.7793293, 0.3768825, 1, 0, 0, 1, 1,
0.8471726, 0.9826666, 0.5932834, 1, 0, 0, 1, 1,
0.8558791, -2.285476, 2.471966, 1, 0, 0, 1, 1,
0.8573921, 0.1893436, 3.732379, 1, 0, 0, 1, 1,
0.8575074, 0.8706395, 1.972952, 1, 0, 0, 1, 1,
0.8602094, 0.7883059, 0.5443399, 0, 0, 0, 1, 1,
0.8616038, -0.6002147, 1.749723, 0, 0, 0, 1, 1,
0.8623722, -1.636556, 2.980813, 0, 0, 0, 1, 1,
0.8760527, 1.445078, -0.476379, 0, 0, 0, 1, 1,
0.8859791, -1.266393, 2.647523, 0, 0, 0, 1, 1,
0.8875133, 0.8533172, 1.306717, 0, 0, 0, 1, 1,
0.8922387, -0.5487045, 1.684404, 0, 0, 0, 1, 1,
0.8944041, -0.02649632, 1.631876, 1, 1, 1, 1, 1,
0.8945087, -0.891884, 0.5860572, 1, 1, 1, 1, 1,
0.8976899, -0.9891776, 2.58525, 1, 1, 1, 1, 1,
0.9099966, -0.1130247, 2.252795, 1, 1, 1, 1, 1,
0.9121239, 1.739242, -0.6339298, 1, 1, 1, 1, 1,
0.9177452, 0.8223847, 1.798641, 1, 1, 1, 1, 1,
0.921711, -0.1212142, -0.5848, 1, 1, 1, 1, 1,
0.9228914, 0.0908005, 0.3334314, 1, 1, 1, 1, 1,
0.9347888, -3.129306, 2.869754, 1, 1, 1, 1, 1,
0.9381339, -1.514387, 2.194104, 1, 1, 1, 1, 1,
0.9408754, -2.159166, 2.399803, 1, 1, 1, 1, 1,
0.9514933, 0.6665459, 2.500902, 1, 1, 1, 1, 1,
0.9581718, 0.8685744, 1.921297, 1, 1, 1, 1, 1,
0.9608373, 0.4850541, 0.8220513, 1, 1, 1, 1, 1,
0.9610286, -0.4048073, 1.027163, 1, 1, 1, 1, 1,
0.9619308, -0.3307361, 1.491052, 0, 0, 1, 1, 1,
0.9762908, -0.251565, 0.7329481, 1, 0, 0, 1, 1,
0.9781012, 1.170703, -0.9875227, 1, 0, 0, 1, 1,
0.9792097, -0.1624731, 3.413744, 1, 0, 0, 1, 1,
0.9799473, -0.9988257, 3.454661, 1, 0, 0, 1, 1,
0.9809014, 0.8334587, 1.884011, 1, 0, 0, 1, 1,
0.9923692, -1.699649, 2.827239, 0, 0, 0, 1, 1,
0.99387, -1.582681, 3.319846, 0, 0, 0, 1, 1,
0.9987544, 1.66862, 1.066927, 0, 0, 0, 1, 1,
0.9994307, -1.139514, 1.751932, 0, 0, 0, 1, 1,
1.002728, 0.2561496, -0.4240944, 0, 0, 0, 1, 1,
1.019933, 0.8472112, 0.5188398, 0, 0, 0, 1, 1,
1.028644, -2.058833, 1.715606, 0, 0, 0, 1, 1,
1.034883, 0.724247, 1.403278, 1, 1, 1, 1, 1,
1.035785, -0.08169792, 2.205389, 1, 1, 1, 1, 1,
1.037159, -0.5776197, 2.544772, 1, 1, 1, 1, 1,
1.045368, -0.5494725, 2.492892, 1, 1, 1, 1, 1,
1.047469, 2.380644, 0.0723609, 1, 1, 1, 1, 1,
1.058937, -0.9541159, 1.26273, 1, 1, 1, 1, 1,
1.058991, 0.1805308, -0.2478162, 1, 1, 1, 1, 1,
1.063955, 0.6531073, 0.758341, 1, 1, 1, 1, 1,
1.069774, -2.539251, 3.332823, 1, 1, 1, 1, 1,
1.071556, -0.3015976, 0.7312643, 1, 1, 1, 1, 1,
1.073214, 0.5997671, 0.334168, 1, 1, 1, 1, 1,
1.088397, 0.1920914, 2.170088, 1, 1, 1, 1, 1,
1.090496, 0.03953347, 1.159994, 1, 1, 1, 1, 1,
1.094901, 0.7750878, 2.274965, 1, 1, 1, 1, 1,
1.095944, 0.5213842, 0.9294247, 1, 1, 1, 1, 1,
1.10447, 1.309141, -0.5350844, 0, 0, 1, 1, 1,
1.105825, -0.4470162, 1.668353, 1, 0, 0, 1, 1,
1.107529, -0.7706102, -0.01020973, 1, 0, 0, 1, 1,
1.109577, -0.794505, 1.233472, 1, 0, 0, 1, 1,
1.118163, -0.7831239, 3.978392, 1, 0, 0, 1, 1,
1.126144, 0.0396106, 0.7680188, 1, 0, 0, 1, 1,
1.126813, 0.0008961088, 1.919789, 0, 0, 0, 1, 1,
1.129328, -0.384651, 0.4550798, 0, 0, 0, 1, 1,
1.13339, -0.06006582, 0.3028754, 0, 0, 0, 1, 1,
1.136246, 0.9324301, 1.690035, 0, 0, 0, 1, 1,
1.13913, 1.218437, 1.940334, 0, 0, 0, 1, 1,
1.139339, 1.855249, 1.409582, 0, 0, 0, 1, 1,
1.146402, 0.4288592, 2.69921, 0, 0, 0, 1, 1,
1.150375, 0.05491357, 3.282675, 1, 1, 1, 1, 1,
1.153349, -0.4258509, 2.911418, 1, 1, 1, 1, 1,
1.166449, 0.7314271, 1.433391, 1, 1, 1, 1, 1,
1.172982, -1.25895, 3.996659, 1, 1, 1, 1, 1,
1.174746, -0.5516028, 1.641676, 1, 1, 1, 1, 1,
1.174839, 0.5033834, 2.175412, 1, 1, 1, 1, 1,
1.174987, -1.84147, 1.249417, 1, 1, 1, 1, 1,
1.179157, -0.9116837, 2.62511, 1, 1, 1, 1, 1,
1.181769, 0.5013142, 0.1155171, 1, 1, 1, 1, 1,
1.188061, 1.08158, 1.773171, 1, 1, 1, 1, 1,
1.198602, 0.5226738, 1.825515, 1, 1, 1, 1, 1,
1.212332, -1.600199, 4.268655, 1, 1, 1, 1, 1,
1.213914, 0.1135684, 1.06254, 1, 1, 1, 1, 1,
1.215119, -0.7872731, 3.871612, 1, 1, 1, 1, 1,
1.216028, -0.6674849, 1.731733, 1, 1, 1, 1, 1,
1.220948, 0.9041668, 1.704664, 0, 0, 1, 1, 1,
1.231585, 0.7694455, 0.892049, 1, 0, 0, 1, 1,
1.231874, 0.5145584, 2.07443, 1, 0, 0, 1, 1,
1.235918, 0.1020657, -1.225684, 1, 0, 0, 1, 1,
1.236428, -1.455718, 1.922539, 1, 0, 0, 1, 1,
1.249155, 0.06978402, 2.612534, 1, 0, 0, 1, 1,
1.262893, 0.1333196, 2.062727, 0, 0, 0, 1, 1,
1.264759, 0.5181136, 2.197532, 0, 0, 0, 1, 1,
1.266114, 1.433455, 0.408185, 0, 0, 0, 1, 1,
1.268071, 1.575381, -0.3945284, 0, 0, 0, 1, 1,
1.292233, -1.887736, 2.619853, 0, 0, 0, 1, 1,
1.292884, 1.986802, 0.803978, 0, 0, 0, 1, 1,
1.294337, 1.872373, 1.150074, 0, 0, 0, 1, 1,
1.313992, -0.2600673, 2.672259, 1, 1, 1, 1, 1,
1.315895, -0.2730018, 0.4722906, 1, 1, 1, 1, 1,
1.315945, 0.3010311, 1.778515, 1, 1, 1, 1, 1,
1.318373, 0.355737, -0.4210954, 1, 1, 1, 1, 1,
1.327141, -0.9691083, 4.332364, 1, 1, 1, 1, 1,
1.331119, -1.064918, 2.897929, 1, 1, 1, 1, 1,
1.354141, 0.8695957, -0.7832087, 1, 1, 1, 1, 1,
1.359356, -0.4164785, 2.667464, 1, 1, 1, 1, 1,
1.369297, -0.9865145, 3.922803, 1, 1, 1, 1, 1,
1.390327, 1.243347, 1.269197, 1, 1, 1, 1, 1,
1.391091, 1.127257, -0.7630198, 1, 1, 1, 1, 1,
1.39173, 1.702907, 1.37815, 1, 1, 1, 1, 1,
1.395603, -1.893772, 1.155341, 1, 1, 1, 1, 1,
1.408234, -0.2486582, 1.200376, 1, 1, 1, 1, 1,
1.411213, 0.1743068, 0.5813316, 1, 1, 1, 1, 1,
1.418034, 0.2521125, 3.286084, 0, 0, 1, 1, 1,
1.419068, -0.5619789, 0.9424538, 1, 0, 0, 1, 1,
1.423877, 0.6508603, -0.5102652, 1, 0, 0, 1, 1,
1.429064, 0.7164248, -0.003250703, 1, 0, 0, 1, 1,
1.43252, 2.413729, 0.5591221, 1, 0, 0, 1, 1,
1.433849, 0.3819373, 2.523737, 1, 0, 0, 1, 1,
1.434017, 0.1008154, 0.3741165, 0, 0, 0, 1, 1,
1.435602, 0.9831316, 2.790758, 0, 0, 0, 1, 1,
1.438189, 0.4042754, 0.3060235, 0, 0, 0, 1, 1,
1.439687, -1.165236, 1.869531, 0, 0, 0, 1, 1,
1.443879, 0.3682761, 1.690585, 0, 0, 0, 1, 1,
1.450342, -1.382608, 3.856909, 0, 0, 0, 1, 1,
1.451775, 0.4640386, -0.2408798, 0, 0, 0, 1, 1,
1.453824, -0.5332292, 1.929422, 1, 1, 1, 1, 1,
1.458051, -0.6623898, 1.969791, 1, 1, 1, 1, 1,
1.463759, -0.731697, 2.062731, 1, 1, 1, 1, 1,
1.474166, -1.461819, 1.053404, 1, 1, 1, 1, 1,
1.490454, -0.5294025, -0.5215785, 1, 1, 1, 1, 1,
1.495855, -0.2941027, 3.777131, 1, 1, 1, 1, 1,
1.502978, 0.5502273, 2.967873, 1, 1, 1, 1, 1,
1.504602, 0.5765422, 2.038637, 1, 1, 1, 1, 1,
1.505552, 0.1824251, 0.3108429, 1, 1, 1, 1, 1,
1.508209, 0.006164514, 2.663091, 1, 1, 1, 1, 1,
1.51166, -0.562579, 2.821495, 1, 1, 1, 1, 1,
1.518953, -0.8630903, 0.1314307, 1, 1, 1, 1, 1,
1.53059, 0.01555877, 1.558124, 1, 1, 1, 1, 1,
1.535064, 0.658268, -0.167899, 1, 1, 1, 1, 1,
1.546061, 0.3825985, 1.684936, 1, 1, 1, 1, 1,
1.550449, -0.6682107, 2.094709, 0, 0, 1, 1, 1,
1.556777, -0.02039921, 2.126107, 1, 0, 0, 1, 1,
1.56939, -0.9972519, 2.60027, 1, 0, 0, 1, 1,
1.571241, -0.4708124, 3.299895, 1, 0, 0, 1, 1,
1.572379, -0.7664697, -0.3153323, 1, 0, 0, 1, 1,
1.57344, 1.548038, 0.1419437, 1, 0, 0, 1, 1,
1.579725, 1.053751, 2.357136, 0, 0, 0, 1, 1,
1.585039, -0.5924401, 2.360817, 0, 0, 0, 1, 1,
1.590527, -0.2678838, 2.429114, 0, 0, 0, 1, 1,
1.595716, 1.046341, 0.7582404, 0, 0, 0, 1, 1,
1.599736, -1.321629, 2.351407, 0, 0, 0, 1, 1,
1.614314, 0.3058674, 1.790363, 0, 0, 0, 1, 1,
1.615043, 0.2933371, 2.189996, 0, 0, 0, 1, 1,
1.623454, 0.173191, 0.2395734, 1, 1, 1, 1, 1,
1.623971, 0.9385107, 0.6602554, 1, 1, 1, 1, 1,
1.631854, 0.02369411, 0.3518888, 1, 1, 1, 1, 1,
1.64068, -0.8866488, 1.400738, 1, 1, 1, 1, 1,
1.641613, 1.06683, -0.2815963, 1, 1, 1, 1, 1,
1.642337, 2.112432, 1.623967, 1, 1, 1, 1, 1,
1.643111, -0.4537123, 3.343786, 1, 1, 1, 1, 1,
1.655048, 0.9379318, -0.5326472, 1, 1, 1, 1, 1,
1.662603, -0.3831995, 1.923545, 1, 1, 1, 1, 1,
1.681756, -2.038574, 2.699874, 1, 1, 1, 1, 1,
1.688155, 1.417004, 0.8797987, 1, 1, 1, 1, 1,
1.702528, 0.7492259, 1.732766, 1, 1, 1, 1, 1,
1.705773, -1.302298, 3.615624, 1, 1, 1, 1, 1,
1.709929, 0.9678357, 1.777622, 1, 1, 1, 1, 1,
1.715081, -0.6558143, 3.234064, 1, 1, 1, 1, 1,
1.721054, 0.04507698, 1.075266, 0, 0, 1, 1, 1,
1.726884, 0.359052, 1.175929, 1, 0, 0, 1, 1,
1.730689, -1.628127, 2.924731, 1, 0, 0, 1, 1,
1.739819, -0.5837617, 1.848162, 1, 0, 0, 1, 1,
1.744499, -0.8516229, 3.006009, 1, 0, 0, 1, 1,
1.744509, -0.6279278, 3.12769, 1, 0, 0, 1, 1,
1.745258, -1.864733, 1.038231, 0, 0, 0, 1, 1,
1.74534, -0.4707395, 1.631866, 0, 0, 0, 1, 1,
1.748128, -1.097008, 2.555184, 0, 0, 0, 1, 1,
1.759566, -2.569637, 2.512154, 0, 0, 0, 1, 1,
1.775837, -0.4469056, 1.839658, 0, 0, 0, 1, 1,
1.81103, -0.03724742, 1.613905, 0, 0, 0, 1, 1,
1.822395, -0.1015082, 1.023042, 0, 0, 0, 1, 1,
1.832046, 0.6531108, 0.5567849, 1, 1, 1, 1, 1,
1.832928, 0.08585439, 3.300043, 1, 1, 1, 1, 1,
1.848288, -0.01208639, 1.622235, 1, 1, 1, 1, 1,
1.854777, -0.7071986, 1.485063, 1, 1, 1, 1, 1,
1.858766, -0.1437682, 2.066542, 1, 1, 1, 1, 1,
1.862476, -0.8344383, 2.540948, 1, 1, 1, 1, 1,
1.884767, 0.5332958, 1.715925, 1, 1, 1, 1, 1,
1.884932, -0.8182914, 2.266156, 1, 1, 1, 1, 1,
1.891423, -0.6853131, 2.407919, 1, 1, 1, 1, 1,
1.912749, 0.1436195, 1.006029, 1, 1, 1, 1, 1,
1.920151, -1.178479, 2.419153, 1, 1, 1, 1, 1,
1.920879, 0.1890758, 0.855307, 1, 1, 1, 1, 1,
1.94017, 0.4502789, 0.644556, 1, 1, 1, 1, 1,
2.018695, 0.158223, 0.5984075, 1, 1, 1, 1, 1,
2.042714, -0.9988601, 2.189077, 1, 1, 1, 1, 1,
2.042737, 0.2378832, 1.70605, 0, 0, 1, 1, 1,
2.049029, -1.131115, 2.382028, 1, 0, 0, 1, 1,
2.059967, -1.50883, 2.656619, 1, 0, 0, 1, 1,
2.060702, -0.8804937, 0.994652, 1, 0, 0, 1, 1,
2.064023, -0.4868387, 3.796262, 1, 0, 0, 1, 1,
2.123784, 0.4550366, 0.1030105, 1, 0, 0, 1, 1,
2.138244, -1.079893, 1.630381, 0, 0, 0, 1, 1,
2.202904, -1.633359, 2.404666, 0, 0, 0, 1, 1,
2.305183, 0.4043261, 0.6466295, 0, 0, 0, 1, 1,
2.307969, 2.221364, 1.842608, 0, 0, 0, 1, 1,
2.309051, 0.7164422, 0.994331, 0, 0, 0, 1, 1,
2.335081, 0.3347053, 0.615814, 0, 0, 0, 1, 1,
2.347425, 0.2630773, 1.872058, 0, 0, 0, 1, 1,
2.435709, -0.6738508, 0.7340552, 1, 1, 1, 1, 1,
2.497087, 1.492106, -1.378104, 1, 1, 1, 1, 1,
2.583919, 0.5945695, 0.8465485, 1, 1, 1, 1, 1,
2.790365, 0.6617246, 0.3908485, 1, 1, 1, 1, 1,
2.852138, -0.6164427, 2.503581, 1, 1, 1, 1, 1,
3.082977, -0.7083534, -0.02141788, 1, 1, 1, 1, 1,
3.687678, -0.1183993, 1.420884, 1, 1, 1, 1, 1
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
var radius = 10.02669;
var distance = 35.21833;
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
mvMatrix.translate( -0.1304688, 0.6148016, -0.1944561 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.21833);
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
