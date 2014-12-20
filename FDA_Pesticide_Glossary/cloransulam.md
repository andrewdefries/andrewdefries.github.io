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
-2.817979, -0.2226292, -1.793186, 1, 0, 0, 1,
-2.502041, 1.252417, -1.217975, 1, 0.007843138, 0, 1,
-2.494298, -0.8156661, -2.044339, 1, 0.01176471, 0, 1,
-2.364456, -0.1318427, -1.786946, 1, 0.01960784, 0, 1,
-2.343611, -0.589094, -2.733087, 1, 0.02352941, 0, 1,
-2.270483, 0.4872015, -3.06744, 1, 0.03137255, 0, 1,
-2.239383, 0.04928042, -2.089905, 1, 0.03529412, 0, 1,
-2.225373, -0.9312212, -1.788895, 1, 0.04313726, 0, 1,
-2.174354, -1.781541, -2.270619, 1, 0.04705882, 0, 1,
-2.149118, -1.345237, -3.025303, 1, 0.05490196, 0, 1,
-2.135614, -1.230734, -2.074255, 1, 0.05882353, 0, 1,
-2.120276, -0.3289787, -1.463613, 1, 0.06666667, 0, 1,
-2.11028, 0.794313, -0.6639557, 1, 0.07058824, 0, 1,
-2.110069, -2.467022, -3.786832, 1, 0.07843138, 0, 1,
-2.093218, -0.1464963, -0.859627, 1, 0.08235294, 0, 1,
-2.064572, 0.6285757, -0.8565927, 1, 0.09019608, 0, 1,
-2.024289, 0.75975, -1.14458, 1, 0.09411765, 0, 1,
-1.995944, 0.8551295, -1.767493, 1, 0.1019608, 0, 1,
-1.963789, -0.4433265, -0.06736612, 1, 0.1098039, 0, 1,
-1.912206, 1.062356, -0.7050027, 1, 0.1137255, 0, 1,
-1.907615, 0.5582787, 0.6250375, 1, 0.1215686, 0, 1,
-1.897503, 0.179646, -2.840073, 1, 0.1254902, 0, 1,
-1.889367, -1.265069, -2.628385, 1, 0.1333333, 0, 1,
-1.881445, 2.421539, -1.143166, 1, 0.1372549, 0, 1,
-1.879978, 0.7821733, 0.2502898, 1, 0.145098, 0, 1,
-1.874225, 0.9133253, -1.263344, 1, 0.1490196, 0, 1,
-1.852232, -0.823624, -1.168062, 1, 0.1568628, 0, 1,
-1.838195, 0.6506418, -1.565778, 1, 0.1607843, 0, 1,
-1.83566, 0.4469776, -1.10585, 1, 0.1686275, 0, 1,
-1.831683, -0.8678919, -2.561586, 1, 0.172549, 0, 1,
-1.825678, -0.4141729, -1.719886, 1, 0.1803922, 0, 1,
-1.809203, -0.9395604, -2.174324, 1, 0.1843137, 0, 1,
-1.787784, 0.2750911, -1.683475, 1, 0.1921569, 0, 1,
-1.777313, 1.848395, -1.931573, 1, 0.1960784, 0, 1,
-1.721467, -0.7325537, -0.5721579, 1, 0.2039216, 0, 1,
-1.720037, 0.04863218, -2.091911, 1, 0.2117647, 0, 1,
-1.718166, 0.01343665, -0.3598163, 1, 0.2156863, 0, 1,
-1.712856, 0.2587859, -1.919556, 1, 0.2235294, 0, 1,
-1.711378, -0.9354935, -3.317085, 1, 0.227451, 0, 1,
-1.70933, 1.500299, -1.268539, 1, 0.2352941, 0, 1,
-1.695245, -1.279451, -1.784753, 1, 0.2392157, 0, 1,
-1.692884, 0.04572141, -1.491399, 1, 0.2470588, 0, 1,
-1.689628, -0.1862592, -1.771944, 1, 0.2509804, 0, 1,
-1.666408, 0.8847412, -1.089954, 1, 0.2588235, 0, 1,
-1.663729, 0.764304, -2.106416, 1, 0.2627451, 0, 1,
-1.647382, 0.9530438, -2.258948, 1, 0.2705882, 0, 1,
-1.641905, 0.4454947, -0.5606452, 1, 0.2745098, 0, 1,
-1.640118, 1.084604, 1.576079, 1, 0.282353, 0, 1,
-1.626932, 0.02716294, -0.5391727, 1, 0.2862745, 0, 1,
-1.619022, -1.033351, -0.9521499, 1, 0.2941177, 0, 1,
-1.602185, 1.426594, -1.350965, 1, 0.3019608, 0, 1,
-1.596366, 0.01308269, -1.002405, 1, 0.3058824, 0, 1,
-1.582497, -0.7354914, -3.781758, 1, 0.3137255, 0, 1,
-1.579449, 1.569717, -1.117667, 1, 0.3176471, 0, 1,
-1.576992, 0.0367576, -2.806942, 1, 0.3254902, 0, 1,
-1.564558, -0.4581115, -1.159737, 1, 0.3294118, 0, 1,
-1.555588, -0.8781348, -0.8688254, 1, 0.3372549, 0, 1,
-1.555414, 0.8446051, -2.329088, 1, 0.3411765, 0, 1,
-1.539654, 1.249067, -0.6503826, 1, 0.3490196, 0, 1,
-1.536684, 0.2266106, -1.23668, 1, 0.3529412, 0, 1,
-1.530676, -0.9523614, -2.895118, 1, 0.3607843, 0, 1,
-1.529656, 0.2891597, 0.4422531, 1, 0.3647059, 0, 1,
-1.529334, -0.4012403, -1.672632, 1, 0.372549, 0, 1,
-1.52884, -1.350326, -3.532375, 1, 0.3764706, 0, 1,
-1.521635, -0.9430234, -2.600949, 1, 0.3843137, 0, 1,
-1.499887, 0.1955193, -2.085815, 1, 0.3882353, 0, 1,
-1.49065, 0.7067153, -1.652918, 1, 0.3960784, 0, 1,
-1.48975, -0.01727537, -0.7693918, 1, 0.4039216, 0, 1,
-1.478249, 0.9039342, -0.9894822, 1, 0.4078431, 0, 1,
-1.470688, 0.1099104, -0.8327149, 1, 0.4156863, 0, 1,
-1.46511, 0.7470383, -1.258429, 1, 0.4196078, 0, 1,
-1.461979, -1.663947, -1.534625, 1, 0.427451, 0, 1,
-1.414571, -1.903041, -1.914593, 1, 0.4313726, 0, 1,
-1.411003, -0.7289941, -2.647485, 1, 0.4392157, 0, 1,
-1.39709, 0.1915864, -1.016737, 1, 0.4431373, 0, 1,
-1.395517, 0.9824885, 0.055646, 1, 0.4509804, 0, 1,
-1.391889, 0.4654908, -1.504995, 1, 0.454902, 0, 1,
-1.379437, 0.9915136, -1.316503, 1, 0.4627451, 0, 1,
-1.373551, -0.5185701, -2.246108, 1, 0.4666667, 0, 1,
-1.373382, -0.4708439, -0.3254299, 1, 0.4745098, 0, 1,
-1.36561, 0.7820296, -0.8422258, 1, 0.4784314, 0, 1,
-1.359366, -1.409462, -1.982198, 1, 0.4862745, 0, 1,
-1.348627, -0.2746198, -0.9963441, 1, 0.4901961, 0, 1,
-1.348211, -1.461199, -1.208955, 1, 0.4980392, 0, 1,
-1.343049, -1.140716, -2.220807, 1, 0.5058824, 0, 1,
-1.338659, 1.364294, -0.680827, 1, 0.509804, 0, 1,
-1.338363, -1.714247, -3.379554, 1, 0.5176471, 0, 1,
-1.338179, 0.9609028, -1.024792, 1, 0.5215687, 0, 1,
-1.336501, 0.4651541, -0.257796, 1, 0.5294118, 0, 1,
-1.335947, 1.082516, -1.070539, 1, 0.5333334, 0, 1,
-1.322564, 1.274623, 0.2946175, 1, 0.5411765, 0, 1,
-1.318098, 1.313511, -0.3916157, 1, 0.5450981, 0, 1,
-1.309313, 0.339456, -0.7030259, 1, 0.5529412, 0, 1,
-1.296859, 1.549643, -0.3587346, 1, 0.5568628, 0, 1,
-1.296704, 0.7435006, -2.192613, 1, 0.5647059, 0, 1,
-1.290239, -1.748833, -4.646053, 1, 0.5686275, 0, 1,
-1.289823, -0.4624197, -1.838708, 1, 0.5764706, 0, 1,
-1.289028, -1.193266, -1.862871, 1, 0.5803922, 0, 1,
-1.277953, -0.8200991, -1.757911, 1, 0.5882353, 0, 1,
-1.275626, -0.9372569, -2.92203, 1, 0.5921569, 0, 1,
-1.273143, 0.3092784, -1.697144, 1, 0.6, 0, 1,
-1.258028, 0.2999933, -0.5197568, 1, 0.6078432, 0, 1,
-1.257655, -0.2823358, -3.375708, 1, 0.6117647, 0, 1,
-1.255833, -0.5401884, -1.787668, 1, 0.6196079, 0, 1,
-1.241328, -0.3152143, -2.041247, 1, 0.6235294, 0, 1,
-1.235343, 1.058843, -2.129604, 1, 0.6313726, 0, 1,
-1.234717, 0.923276, -0.9872121, 1, 0.6352941, 0, 1,
-1.233184, -0.03710572, -1.025085, 1, 0.6431373, 0, 1,
-1.232922, -1.122451, -1.48256, 1, 0.6470588, 0, 1,
-1.221835, 0.1657311, -1.108386, 1, 0.654902, 0, 1,
-1.201266, -1.458566, -3.025589, 1, 0.6588235, 0, 1,
-1.196322, 2.155999, -0.2253253, 1, 0.6666667, 0, 1,
-1.195612, 1.509553, -0.9830056, 1, 0.6705883, 0, 1,
-1.189042, 0.1656986, 1.194848, 1, 0.6784314, 0, 1,
-1.185657, 0.5330463, -2.647825, 1, 0.682353, 0, 1,
-1.175317, 0.00117379, -1.608426, 1, 0.6901961, 0, 1,
-1.17043, -0.4079249, -1.31521, 1, 0.6941177, 0, 1,
-1.154047, -0.2634337, 0.4076916, 1, 0.7019608, 0, 1,
-1.14415, -0.3459876, -2.508067, 1, 0.7098039, 0, 1,
-1.143121, -0.7502494, -2.596767, 1, 0.7137255, 0, 1,
-1.142772, 0.2274314, -2.353743, 1, 0.7215686, 0, 1,
-1.142177, 1.56702, -1.580708, 1, 0.7254902, 0, 1,
-1.142075, 0.6810728, -0.7649701, 1, 0.7333333, 0, 1,
-1.131574, -1.725726, -1.496295, 1, 0.7372549, 0, 1,
-1.123957, 0.4181243, -1.701013, 1, 0.7450981, 0, 1,
-1.120421, 0.4245972, -1.853396, 1, 0.7490196, 0, 1,
-1.117643, -0.2519395, -1.542788, 1, 0.7568628, 0, 1,
-1.117308, -0.3212013, -3.068376, 1, 0.7607843, 0, 1,
-1.10496, -0.8636391, -1.271358, 1, 0.7686275, 0, 1,
-1.100502, -1.800121, -4.321751, 1, 0.772549, 0, 1,
-1.099428, 0.5457004, -0.4167329, 1, 0.7803922, 0, 1,
-1.09765, -0.2177608, -1.234738, 1, 0.7843137, 0, 1,
-1.091074, 0.9004211, -0.5112364, 1, 0.7921569, 0, 1,
-1.083738, -0.2301675, -2.088365, 1, 0.7960784, 0, 1,
-1.078808, 1.080477, -0.5000243, 1, 0.8039216, 0, 1,
-1.078439, 1.537623, -3.499689, 1, 0.8117647, 0, 1,
-1.07796, -2.218783, -2.355149, 1, 0.8156863, 0, 1,
-1.076128, 2.237733, 0.9429794, 1, 0.8235294, 0, 1,
-1.07542, -0.456715, -2.56559, 1, 0.827451, 0, 1,
-1.072146, -0.04296203, -0.5754456, 1, 0.8352941, 0, 1,
-1.071751, 1.108293, -0.9815422, 1, 0.8392157, 0, 1,
-1.070405, -0.2497527, -1.638726, 1, 0.8470588, 0, 1,
-1.066853, -0.6475205, -1.613758, 1, 0.8509804, 0, 1,
-1.062374, 1.36598, -0.04095984, 1, 0.8588235, 0, 1,
-1.045262, 0.774022, -2.263481, 1, 0.8627451, 0, 1,
-1.039156, 0.3208477, -1.194421, 1, 0.8705882, 0, 1,
-1.038061, 0.4176811, -0.7348552, 1, 0.8745098, 0, 1,
-1.036595, 0.873551, -0.6045898, 1, 0.8823529, 0, 1,
-1.035723, 2.005358, 0.4768699, 1, 0.8862745, 0, 1,
-1.035534, 1.081253, -0.9138996, 1, 0.8941177, 0, 1,
-1.035454, 1.485361, -0.8795007, 1, 0.8980392, 0, 1,
-1.033154, 1.032316, -0.9097874, 1, 0.9058824, 0, 1,
-1.026816, 0.004836223, -1.340734, 1, 0.9137255, 0, 1,
-1.02027, -1.554538, -0.9605936, 1, 0.9176471, 0, 1,
-1.006779, 1.541685, -0.8052884, 1, 0.9254902, 0, 1,
-0.9993688, -0.2715235, -1.978579, 1, 0.9294118, 0, 1,
-0.9944412, -0.8672636, -1.981743, 1, 0.9372549, 0, 1,
-0.9900602, -0.02459089, -1.845104, 1, 0.9411765, 0, 1,
-0.9877055, -0.09530398, -0.7582278, 1, 0.9490196, 0, 1,
-0.9860924, -0.1287912, 0.08392327, 1, 0.9529412, 0, 1,
-0.9813936, -0.3655817, -1.726379, 1, 0.9607843, 0, 1,
-0.9762063, 0.5984602, -0.3279011, 1, 0.9647059, 0, 1,
-0.9724022, -0.4736598, -2.331631, 1, 0.972549, 0, 1,
-0.9714848, 1.06449, 0.4812675, 1, 0.9764706, 0, 1,
-0.9695161, -1.766937, -2.395224, 1, 0.9843137, 0, 1,
-0.9654284, -0.1427171, -3.63856, 1, 0.9882353, 0, 1,
-0.9592238, 1.108912, -0.3352025, 1, 0.9960784, 0, 1,
-0.9549385, 1.153411, -1.12682, 0.9960784, 1, 0, 1,
-0.9525334, 0.1230476, -3.368384, 0.9921569, 1, 0, 1,
-0.9490064, 1.411692, -0.8933356, 0.9843137, 1, 0, 1,
-0.944708, 0.01999313, -2.719285, 0.9803922, 1, 0, 1,
-0.9429858, 1.635151, 0.0004056743, 0.972549, 1, 0, 1,
-0.9345159, -0.6440818, -1.312189, 0.9686275, 1, 0, 1,
-0.9340754, -0.49408, -2.328783, 0.9607843, 1, 0, 1,
-0.9296197, -0.6436611, -1.631469, 0.9568627, 1, 0, 1,
-0.9244444, 1.532572, -0.284312, 0.9490196, 1, 0, 1,
-0.9220875, 0.6032792, -0.09101249, 0.945098, 1, 0, 1,
-0.9205499, 0.9970492, -1.078299, 0.9372549, 1, 0, 1,
-0.9190991, -1.936658, -2.748889, 0.9333333, 1, 0, 1,
-0.916916, -0.08748853, -1.08958, 0.9254902, 1, 0, 1,
-0.9137259, -0.1350607, -2.649755, 0.9215686, 1, 0, 1,
-0.9099511, -0.9522079, -1.955615, 0.9137255, 1, 0, 1,
-0.9090089, -2.067857, -2.487891, 0.9098039, 1, 0, 1,
-0.9070411, 0.9404916, -0.7000453, 0.9019608, 1, 0, 1,
-0.9066814, -0.8607498, -2.462039, 0.8941177, 1, 0, 1,
-0.9060926, -1.452691, -1.961429, 0.8901961, 1, 0, 1,
-0.9019385, 1.369821, -0.8312458, 0.8823529, 1, 0, 1,
-0.9006975, -1.115558, -4.968565, 0.8784314, 1, 0, 1,
-0.8983945, 0.1151094, 0.3844903, 0.8705882, 1, 0, 1,
-0.8983464, -1.212102, -1.812987, 0.8666667, 1, 0, 1,
-0.8977847, -0.1943796, -0.08699901, 0.8588235, 1, 0, 1,
-0.8975884, 1.479967, -0.5940879, 0.854902, 1, 0, 1,
-0.895874, 0.9815413, -2.038458, 0.8470588, 1, 0, 1,
-0.8919432, -1.962803, -1.067935, 0.8431373, 1, 0, 1,
-0.8909719, -1.012655, -1.586529, 0.8352941, 1, 0, 1,
-0.8903661, 0.9978918, -2.235857, 0.8313726, 1, 0, 1,
-0.8877773, 0.1878611, -2.352453, 0.8235294, 1, 0, 1,
-0.882051, 0.5826427, -2.362188, 0.8196079, 1, 0, 1,
-0.8800528, -0.783265, -0.2455076, 0.8117647, 1, 0, 1,
-0.8757215, -0.09611021, -1.853574, 0.8078431, 1, 0, 1,
-0.8713294, 0.9050835, -0.6693105, 0.8, 1, 0, 1,
-0.8635607, -0.2623752, -2.559061, 0.7921569, 1, 0, 1,
-0.8570606, 0.1588959, -3.061174, 0.7882353, 1, 0, 1,
-0.8538771, 0.2802601, -2.47628, 0.7803922, 1, 0, 1,
-0.8497037, 0.7660977, -1.406201, 0.7764706, 1, 0, 1,
-0.844685, -0.4188468, -0.4824691, 0.7686275, 1, 0, 1,
-0.8367681, -1.242316, -0.7017626, 0.7647059, 1, 0, 1,
-0.8322755, 1.619501, -0.6847848, 0.7568628, 1, 0, 1,
-0.8285995, 2.293362, -1.668516, 0.7529412, 1, 0, 1,
-0.8282949, 0.112088, -3.004403, 0.7450981, 1, 0, 1,
-0.8278093, 0.5649521, 0.6268135, 0.7411765, 1, 0, 1,
-0.8191414, -0.9745653, -1.256343, 0.7333333, 1, 0, 1,
-0.8089468, -1.304838, -3.772163, 0.7294118, 1, 0, 1,
-0.8027825, 0.2716428, -2.346061, 0.7215686, 1, 0, 1,
-0.787748, -0.1075022, -2.382516, 0.7176471, 1, 0, 1,
-0.7796545, -1.238405, -3.494149, 0.7098039, 1, 0, 1,
-0.7789103, -1.155656, -4.298133, 0.7058824, 1, 0, 1,
-0.77387, -0.1444198, -1.234949, 0.6980392, 1, 0, 1,
-0.7725874, 1.815816, 0.4867109, 0.6901961, 1, 0, 1,
-0.7717061, -1.423421, -1.816089, 0.6862745, 1, 0, 1,
-0.7683069, -1.635107, -3.524717, 0.6784314, 1, 0, 1,
-0.767163, -0.7760614, -1.705926, 0.6745098, 1, 0, 1,
-0.7649369, -1.465746, -2.937258, 0.6666667, 1, 0, 1,
-0.76457, -0.9708875, -0.6902516, 0.6627451, 1, 0, 1,
-0.7584182, 1.714099, -0.319555, 0.654902, 1, 0, 1,
-0.7488111, -0.9233885, -2.743133, 0.6509804, 1, 0, 1,
-0.7460024, 1.434425, -1.282891, 0.6431373, 1, 0, 1,
-0.7420683, 0.3470644, 0.3455406, 0.6392157, 1, 0, 1,
-0.7395998, -1.218715, -4.098546, 0.6313726, 1, 0, 1,
-0.7381895, 0.1874689, -0.3338405, 0.627451, 1, 0, 1,
-0.7280493, 0.1724486, -3.754231, 0.6196079, 1, 0, 1,
-0.7261103, 0.02407913, -1.335974, 0.6156863, 1, 0, 1,
-0.7193314, 0.363211, -1.505803, 0.6078432, 1, 0, 1,
-0.7188957, -0.7731695, -0.6208495, 0.6039216, 1, 0, 1,
-0.7180885, -0.7173461, -2.899413, 0.5960785, 1, 0, 1,
-0.7167134, 0.4505708, -0.9261403, 0.5882353, 1, 0, 1,
-0.7163301, 0.06696947, -1.052184, 0.5843138, 1, 0, 1,
-0.7116189, -0.2221421, -2.137547, 0.5764706, 1, 0, 1,
-0.7106385, -0.08438808, -2.273423, 0.572549, 1, 0, 1,
-0.7095359, -0.3895655, -0.0238395, 0.5647059, 1, 0, 1,
-0.7056587, -1.201162, -2.598767, 0.5607843, 1, 0, 1,
-0.7035605, -1.879265, -2.051536, 0.5529412, 1, 0, 1,
-0.6998559, -2.06634, -3.318097, 0.5490196, 1, 0, 1,
-0.6994703, -1.421867, -3.129945, 0.5411765, 1, 0, 1,
-0.6958352, 0.7199453, -0.9862878, 0.5372549, 1, 0, 1,
-0.6951636, 0.9338785, 0.4435619, 0.5294118, 1, 0, 1,
-0.6864998, 0.008538974, -1.693338, 0.5254902, 1, 0, 1,
-0.6811514, -0.9912357, -2.969495, 0.5176471, 1, 0, 1,
-0.6744179, -1.463306, -3.388732, 0.5137255, 1, 0, 1,
-0.6722295, 0.2733368, -0.4138565, 0.5058824, 1, 0, 1,
-0.6698989, 0.3508012, -1.003202, 0.5019608, 1, 0, 1,
-0.666682, -0.6853101, -3.499105, 0.4941176, 1, 0, 1,
-0.6649533, -1.053925, -2.396159, 0.4862745, 1, 0, 1,
-0.6600433, -0.6192621, -2.412534, 0.4823529, 1, 0, 1,
-0.6595687, -2.006252, -1.303037, 0.4745098, 1, 0, 1,
-0.6577619, 0.2599269, -1.667876, 0.4705882, 1, 0, 1,
-0.6564485, 2.003774, -1.04087, 0.4627451, 1, 0, 1,
-0.6459524, -0.3614689, -4.388965, 0.4588235, 1, 0, 1,
-0.6419471, -1.591613, -0.2655879, 0.4509804, 1, 0, 1,
-0.6406031, -1.093371, -1.89484, 0.4470588, 1, 0, 1,
-0.640488, 0.9136752, -0.08703873, 0.4392157, 1, 0, 1,
-0.6369452, 1.520053, 0.242071, 0.4352941, 1, 0, 1,
-0.636875, 0.47633, -2.052609, 0.427451, 1, 0, 1,
-0.6306587, 0.3143153, -1.479893, 0.4235294, 1, 0, 1,
-0.6272354, -1.16251, -2.372401, 0.4156863, 1, 0, 1,
-0.6263114, 0.1229318, -0.8063461, 0.4117647, 1, 0, 1,
-0.6243188, 0.7297063, -2.103396, 0.4039216, 1, 0, 1,
-0.6237572, 1.574788, -0.6490952, 0.3960784, 1, 0, 1,
-0.6218597, -0.02080541, -1.363551, 0.3921569, 1, 0, 1,
-0.6193833, 2.280393, -0.8818632, 0.3843137, 1, 0, 1,
-0.6181483, 0.9535552, -1.767776, 0.3803922, 1, 0, 1,
-0.6161789, -0.008398228, -1.410111, 0.372549, 1, 0, 1,
-0.6137494, -0.7176995, -0.4393276, 0.3686275, 1, 0, 1,
-0.6095613, -0.9671463, -1.513138, 0.3607843, 1, 0, 1,
-0.6094344, 0.01389962, -2.458173, 0.3568628, 1, 0, 1,
-0.6065595, 1.554141, -0.2107571, 0.3490196, 1, 0, 1,
-0.6059429, 0.9479573, -1.003075, 0.345098, 1, 0, 1,
-0.6059396, 0.4756663, -1.751739, 0.3372549, 1, 0, 1,
-0.6045968, -0.3669069, -3.934849, 0.3333333, 1, 0, 1,
-0.6036009, 0.4014332, -0.50307, 0.3254902, 1, 0, 1,
-0.6009969, 1.14764, 0.7830309, 0.3215686, 1, 0, 1,
-0.6001925, -1.384681, -1.767393, 0.3137255, 1, 0, 1,
-0.5997467, -2.079619, -3.256083, 0.3098039, 1, 0, 1,
-0.598103, -1.163007, -3.05404, 0.3019608, 1, 0, 1,
-0.5980384, 0.591356, -1.651036, 0.2941177, 1, 0, 1,
-0.5864487, 0.4411797, -0.5446106, 0.2901961, 1, 0, 1,
-0.5854656, -1.315108, -1.548044, 0.282353, 1, 0, 1,
-0.5845947, 0.2252681, -2.34194, 0.2784314, 1, 0, 1,
-0.5778939, -1.27469, -2.389401, 0.2705882, 1, 0, 1,
-0.5762197, -0.7541177, -3.489044, 0.2666667, 1, 0, 1,
-0.5760812, 0.4843404, -1.844826, 0.2588235, 1, 0, 1,
-0.574168, 0.891284, -1.779364, 0.254902, 1, 0, 1,
-0.5728546, 0.8214527, -1.175214, 0.2470588, 1, 0, 1,
-0.571256, -0.5441125, 0.09367212, 0.2431373, 1, 0, 1,
-0.5648108, 0.6632989, -1.357675, 0.2352941, 1, 0, 1,
-0.5635356, -1.126404, -3.997422, 0.2313726, 1, 0, 1,
-0.5617461, 0.3867435, -1.79337, 0.2235294, 1, 0, 1,
-0.560939, -0.3471042, -2.952907, 0.2196078, 1, 0, 1,
-0.5587596, 0.2178442, -1.600866, 0.2117647, 1, 0, 1,
-0.5577204, 1.292774, -0.6004799, 0.2078431, 1, 0, 1,
-0.5548928, 1.350338, -0.1509423, 0.2, 1, 0, 1,
-0.5479409, 0.2097372, -3.030646, 0.1921569, 1, 0, 1,
-0.5472723, -2.169184, -1.744755, 0.1882353, 1, 0, 1,
-0.5462088, -0.9901871, -3.199652, 0.1803922, 1, 0, 1,
-0.5365856, -0.007373003, -2.304766, 0.1764706, 1, 0, 1,
-0.5273026, -1.663964, -1.730521, 0.1686275, 1, 0, 1,
-0.523841, -0.7828936, -4.005314, 0.1647059, 1, 0, 1,
-0.5208591, 0.798355, -0.8327428, 0.1568628, 1, 0, 1,
-0.5161662, 1.675557, 1.127761, 0.1529412, 1, 0, 1,
-0.5154094, -0.6156167, -1.634236, 0.145098, 1, 0, 1,
-0.5122603, 2.012066, -1.309253, 0.1411765, 1, 0, 1,
-0.5058977, -0.09340648, -0.9842784, 0.1333333, 1, 0, 1,
-0.5020401, -0.8871528, -2.441288, 0.1294118, 1, 0, 1,
-0.4973316, 0.9144683, -1.566469, 0.1215686, 1, 0, 1,
-0.4949408, -0.7880361, -3.210505, 0.1176471, 1, 0, 1,
-0.4921301, -0.08242462, -0.9023627, 0.1098039, 1, 0, 1,
-0.4878559, -0.3986643, -2.933012, 0.1058824, 1, 0, 1,
-0.4844922, 1.131939, 0.02402289, 0.09803922, 1, 0, 1,
-0.4839715, 1.613061, 0.02741559, 0.09019608, 1, 0, 1,
-0.4839046, -1.666608, -1.77554, 0.08627451, 1, 0, 1,
-0.4826747, 0.5996153, 0.5931652, 0.07843138, 1, 0, 1,
-0.4793596, -0.9695484, -2.222699, 0.07450981, 1, 0, 1,
-0.4758567, -0.7379494, -1.585668, 0.06666667, 1, 0, 1,
-0.4739653, 1.134009, 1.102948, 0.0627451, 1, 0, 1,
-0.4711646, 1.615793, -0.5076416, 0.05490196, 1, 0, 1,
-0.464054, -0.1406874, -2.408338, 0.05098039, 1, 0, 1,
-0.4610441, 1.123909, 0.09307401, 0.04313726, 1, 0, 1,
-0.4577006, 0.6575958, 0.5251971, 0.03921569, 1, 0, 1,
-0.4564203, -0.7409353, -2.074837, 0.03137255, 1, 0, 1,
-0.4543321, -0.556252, -1.741428, 0.02745098, 1, 0, 1,
-0.4534577, -0.2893039, -3.514201, 0.01960784, 1, 0, 1,
-0.4506693, -0.3481669, -2.933003, 0.01568628, 1, 0, 1,
-0.4494432, 0.5845778, 1.045302, 0.007843138, 1, 0, 1,
-0.446416, -0.1382031, -1.674456, 0.003921569, 1, 0, 1,
-0.4452915, 1.863943, -1.061219, 0, 1, 0.003921569, 1,
-0.4434928, -0.2664466, -2.752713, 0, 1, 0.01176471, 1,
-0.4408379, -0.8619177, -2.813245, 0, 1, 0.01568628, 1,
-0.4378549, -0.5380359, -2.639342, 0, 1, 0.02352941, 1,
-0.4375212, -0.7763844, -1.826994, 0, 1, 0.02745098, 1,
-0.430425, -0.7201738, -2.25176, 0, 1, 0.03529412, 1,
-0.4278093, -0.87918, -1.943166, 0, 1, 0.03921569, 1,
-0.4269759, 0.2539401, 1.718428, 0, 1, 0.04705882, 1,
-0.4262129, -0.4884599, -3.345053, 0, 1, 0.05098039, 1,
-0.4228874, 0.5929894, -2.204232, 0, 1, 0.05882353, 1,
-0.4180038, -1.212142, -2.87268, 0, 1, 0.0627451, 1,
-0.4162962, -0.5836836, -1.513965, 0, 1, 0.07058824, 1,
-0.4125888, 1.209931, 0.2127341, 0, 1, 0.07450981, 1,
-0.4086968, 0.5861552, -0.7836102, 0, 1, 0.08235294, 1,
-0.4040717, -0.2648579, -2.609289, 0, 1, 0.08627451, 1,
-0.4020748, 0.494969, -2.676945, 0, 1, 0.09411765, 1,
-0.401547, -0.1297338, -1.656993, 0, 1, 0.1019608, 1,
-0.400406, -1.473647, -3.666358, 0, 1, 0.1058824, 1,
-0.3991317, -1.54157, -3.7776, 0, 1, 0.1137255, 1,
-0.3950302, -0.6536865, 0.3244235, 0, 1, 0.1176471, 1,
-0.3944634, 0.8579733, -0.3950177, 0, 1, 0.1254902, 1,
-0.3899345, -0.799027, -0.8068155, 0, 1, 0.1294118, 1,
-0.3859992, -0.1999245, 0.7687735, 0, 1, 0.1372549, 1,
-0.3847873, 1.311885, -0.0811213, 0, 1, 0.1411765, 1,
-0.3834031, -0.1594572, -1.464236, 0, 1, 0.1490196, 1,
-0.3825629, 1.433475, 0.3996527, 0, 1, 0.1529412, 1,
-0.3818535, 1.845713, -1.23638, 0, 1, 0.1607843, 1,
-0.3781294, 0.06665435, -1.407024, 0, 1, 0.1647059, 1,
-0.376978, -0.06809553, -2.273504, 0, 1, 0.172549, 1,
-0.375563, 0.08290392, -1.689914, 0, 1, 0.1764706, 1,
-0.3754075, -0.7758055, -2.417151, 0, 1, 0.1843137, 1,
-0.3667672, 1.058893, -0.8132079, 0, 1, 0.1882353, 1,
-0.3576412, -0.6306269, -2.9639, 0, 1, 0.1960784, 1,
-0.3562904, -2.954764, -2.005768, 0, 1, 0.2039216, 1,
-0.3556, -0.04805308, 0.6473128, 0, 1, 0.2078431, 1,
-0.3553891, -0.6358603, -1.018518, 0, 1, 0.2156863, 1,
-0.3416859, -0.9840587, -1.009541, 0, 1, 0.2196078, 1,
-0.3368053, -0.2540629, -1.574763, 0, 1, 0.227451, 1,
-0.3317738, -0.521153, -1.442369, 0, 1, 0.2313726, 1,
-0.3306663, 0.4504986, -0.05299823, 0, 1, 0.2392157, 1,
-0.3289049, -0.4739411, -1.576353, 0, 1, 0.2431373, 1,
-0.3282596, 1.679349, -0.2288965, 0, 1, 0.2509804, 1,
-0.3268026, -1.022618, -1.954434, 0, 1, 0.254902, 1,
-0.3207818, 0.1133588, -2.247496, 0, 1, 0.2627451, 1,
-0.3153501, 0.4681283, -0.6536392, 0, 1, 0.2666667, 1,
-0.3148105, 0.8908024, 0.6512443, 0, 1, 0.2745098, 1,
-0.3147326, 1.376016, 1.005567, 0, 1, 0.2784314, 1,
-0.3088498, -1.115211, -3.454872, 0, 1, 0.2862745, 1,
-0.3081093, -0.0781003, -2.220316, 0, 1, 0.2901961, 1,
-0.3040307, -1.246379, -1.99235, 0, 1, 0.2980392, 1,
-0.300242, -1.203098, -1.921038, 0, 1, 0.3058824, 1,
-0.2988984, 0.9517635, -2.53505, 0, 1, 0.3098039, 1,
-0.2952854, -1.612109, -3.211193, 0, 1, 0.3176471, 1,
-0.2934737, -1.936675, -2.877, 0, 1, 0.3215686, 1,
-0.292561, 0.5200144, 1.184128, 0, 1, 0.3294118, 1,
-0.2821954, -1.148113, -3.283374, 0, 1, 0.3333333, 1,
-0.2815627, -2.436239, -3.824616, 0, 1, 0.3411765, 1,
-0.2765314, 0.01054005, -2.806249, 0, 1, 0.345098, 1,
-0.2758636, 0.1002503, -0.2915801, 0, 1, 0.3529412, 1,
-0.2715395, -0.02076, -3.631131, 0, 1, 0.3568628, 1,
-0.2707669, 0.03550604, -2.212158, 0, 1, 0.3647059, 1,
-0.2689819, 1.082251, -0.345883, 0, 1, 0.3686275, 1,
-0.2676556, 1.900526, -0.8024946, 0, 1, 0.3764706, 1,
-0.2668592, -0.366958, -1.772427, 0, 1, 0.3803922, 1,
-0.2629854, 1.332412, 0.1810483, 0, 1, 0.3882353, 1,
-0.2592959, 1.238585, -0.8064135, 0, 1, 0.3921569, 1,
-0.2585373, -0.7773705, -3.684305, 0, 1, 0.4, 1,
-0.2475624, 0.2374309, -0.6590495, 0, 1, 0.4078431, 1,
-0.2473868, -0.3974274, -2.506075, 0, 1, 0.4117647, 1,
-0.2447678, 0.6255238, -0.5001375, 0, 1, 0.4196078, 1,
-0.2434844, 0.9048494, 0.06007126, 0, 1, 0.4235294, 1,
-0.2419131, 0.0435822, -3.728152, 0, 1, 0.4313726, 1,
-0.2412581, -0.5473085, -1.887857, 0, 1, 0.4352941, 1,
-0.2374213, -1.974859, -4.131637, 0, 1, 0.4431373, 1,
-0.2361598, 2.365437, -1.438567, 0, 1, 0.4470588, 1,
-0.2352462, 0.00830021, -0.8431998, 0, 1, 0.454902, 1,
-0.2195873, -0.995829, -2.306567, 0, 1, 0.4588235, 1,
-0.2177908, 1.435007, 1.34739, 0, 1, 0.4666667, 1,
-0.212907, 0.156454, -1.910705, 0, 1, 0.4705882, 1,
-0.2083401, 1.190519, -0.9015418, 0, 1, 0.4784314, 1,
-0.2032632, 0.4980702, -0.9811277, 0, 1, 0.4823529, 1,
-0.2018171, -0.5470434, -3.432168, 0, 1, 0.4901961, 1,
-0.2005002, 0.91327, -0.09425008, 0, 1, 0.4941176, 1,
-0.196962, -1.437719, -1.611232, 0, 1, 0.5019608, 1,
-0.1956739, 1.179525, 0.0722308, 0, 1, 0.509804, 1,
-0.1932385, 0.628853, 1.026558, 0, 1, 0.5137255, 1,
-0.191893, 0.1312514, -0.4508159, 0, 1, 0.5215687, 1,
-0.1905684, -1.237009, -1.902224, 0, 1, 0.5254902, 1,
-0.1882447, -0.9703802, -1.68001, 0, 1, 0.5333334, 1,
-0.1869003, 2.045987, -1.616181, 0, 1, 0.5372549, 1,
-0.1851745, 0.1998057, -0.8060959, 0, 1, 0.5450981, 1,
-0.1794339, -1.419935, -3.28944, 0, 1, 0.5490196, 1,
-0.1760278, 1.292622, -1.606178, 0, 1, 0.5568628, 1,
-0.1690326, 1.80192, 0.7990115, 0, 1, 0.5607843, 1,
-0.1615602, -0.4371585, -1.073443, 0, 1, 0.5686275, 1,
-0.1611714, -0.9722023, -3.4732, 0, 1, 0.572549, 1,
-0.1556029, -0.9341137, -4.047602, 0, 1, 0.5803922, 1,
-0.1526779, 1.281965, 0.206483, 0, 1, 0.5843138, 1,
-0.1525861, 0.8349865, 0.6938056, 0, 1, 0.5921569, 1,
-0.1522353, 0.5344127, -0.4674511, 0, 1, 0.5960785, 1,
-0.1509071, -0.2589736, -4.205019, 0, 1, 0.6039216, 1,
-0.1485863, 1.400733, 1.840263, 0, 1, 0.6117647, 1,
-0.1480713, -0.9563534, -3.065482, 0, 1, 0.6156863, 1,
-0.1390774, 0.4394778, 0.9113488, 0, 1, 0.6235294, 1,
-0.138492, -0.6748262, -1.237528, 0, 1, 0.627451, 1,
-0.1360466, 0.3800742, -0.4160309, 0, 1, 0.6352941, 1,
-0.1338142, -1.478765, -3.045892, 0, 1, 0.6392157, 1,
-0.1321225, -0.8805587, -3.638127, 0, 1, 0.6470588, 1,
-0.1294748, -2.069577, -3.444579, 0, 1, 0.6509804, 1,
-0.1245423, -0.336961, -1.802289, 0, 1, 0.6588235, 1,
-0.1235586, -0.05331965, -2.633985, 0, 1, 0.6627451, 1,
-0.1230255, 0.4177244, -1.431614, 0, 1, 0.6705883, 1,
-0.1169792, -0.8002394, -2.382268, 0, 1, 0.6745098, 1,
-0.1157735, 0.3779632, -0.4177769, 0, 1, 0.682353, 1,
-0.1153675, 1.110915, 0.05041274, 0, 1, 0.6862745, 1,
-0.1136599, -0.2139625, -3.187132, 0, 1, 0.6941177, 1,
-0.1111615, 0.7294995, -0.34614, 0, 1, 0.7019608, 1,
-0.1110514, 0.9040093, 1.616815, 0, 1, 0.7058824, 1,
-0.1098104, 0.9429901, 0.2640152, 0, 1, 0.7137255, 1,
-0.109149, -1.269887, -2.858182, 0, 1, 0.7176471, 1,
-0.109059, 0.7300792, -0.2696164, 0, 1, 0.7254902, 1,
-0.1077003, -0.9755635, -3.089032, 0, 1, 0.7294118, 1,
-0.1070544, -0.09863786, -2.645553, 0, 1, 0.7372549, 1,
-0.1070262, 1.152071, -0.2904122, 0, 1, 0.7411765, 1,
-0.1035024, -1.268023, -3.560865, 0, 1, 0.7490196, 1,
-0.08418182, 1.190946, -1.190942, 0, 1, 0.7529412, 1,
-0.07569175, -1.056725, -3.260546, 0, 1, 0.7607843, 1,
-0.07548353, 0.13553, -1.383844, 0, 1, 0.7647059, 1,
-0.07189858, 0.9945477, -0.443673, 0, 1, 0.772549, 1,
-0.06962317, 0.7469819, -1.025986, 0, 1, 0.7764706, 1,
-0.06951156, -0.2316903, -3.36932, 0, 1, 0.7843137, 1,
-0.06645117, 1.153025, -0.161318, 0, 1, 0.7882353, 1,
-0.05769265, -0.1639682, -3.521299, 0, 1, 0.7960784, 1,
-0.0535444, 0.7085391, -0.2592723, 0, 1, 0.8039216, 1,
-0.05319419, 0.2440925, -0.2067766, 0, 1, 0.8078431, 1,
-0.05245605, 0.09725697, -0.7946327, 0, 1, 0.8156863, 1,
-0.04256722, 1.955623, 0.5690542, 0, 1, 0.8196079, 1,
-0.04220885, 1.884083, 1.028962, 0, 1, 0.827451, 1,
-0.03935984, 0.3305873, 1.169483, 0, 1, 0.8313726, 1,
-0.03898488, -0.7828569, -3.179687, 0, 1, 0.8392157, 1,
-0.03892368, 1.716416, -0.07940493, 0, 1, 0.8431373, 1,
-0.03749344, -0.3052648, -3.393476, 0, 1, 0.8509804, 1,
-0.03420626, 1.863117, 1.836304, 0, 1, 0.854902, 1,
-0.03366295, 0.9902067, 0.04010027, 0, 1, 0.8627451, 1,
-0.03352387, -0.5024832, -2.570076, 0, 1, 0.8666667, 1,
-0.03178195, -1.832129, -3.369042, 0, 1, 0.8745098, 1,
-0.03040696, -0.5803363, -2.798424, 0, 1, 0.8784314, 1,
-0.03012801, -1.046103, -4.298789, 0, 1, 0.8862745, 1,
-0.02433546, 0.5779496, -0.3442474, 0, 1, 0.8901961, 1,
-0.01983998, -0.8485223, -1.967164, 0, 1, 0.8980392, 1,
-0.01048038, 2.45097, -1.408923, 0, 1, 0.9058824, 1,
-0.005360613, 0.1151662, 0.2931106, 0, 1, 0.9098039, 1,
-0.005252773, -0.1042756, -3.013535, 0, 1, 0.9176471, 1,
-0.005217094, 0.1978805, -1.564159, 0, 1, 0.9215686, 1,
-0.005034028, -0.6411652, -2.837394, 0, 1, 0.9294118, 1,
0.001931642, 0.434779, -0.1870904, 0, 1, 0.9333333, 1,
0.01310026, -0.883104, 4.00321, 0, 1, 0.9411765, 1,
0.01556555, 0.9193559, -0.7002442, 0, 1, 0.945098, 1,
0.01728421, 1.158266, 0.254833, 0, 1, 0.9529412, 1,
0.02075577, -0.5627093, 2.064554, 0, 1, 0.9568627, 1,
0.02262714, -1.67955, 4.787042, 0, 1, 0.9647059, 1,
0.02480524, -1.049094, 1.730737, 0, 1, 0.9686275, 1,
0.02920845, 3.222984, -2.124062, 0, 1, 0.9764706, 1,
0.03158649, 2.986722, -1.240874, 0, 1, 0.9803922, 1,
0.03180499, 0.2634871, -0.4607086, 0, 1, 0.9882353, 1,
0.03235064, -0.05416542, 2.597613, 0, 1, 0.9921569, 1,
0.03341023, -0.1186384, 3.693213, 0, 1, 1, 1,
0.04358813, 0.4780102, 0.9650447, 0, 0.9921569, 1, 1,
0.04456655, 0.2131369, 0.9861861, 0, 0.9882353, 1, 1,
0.0476739, -0.1904055, 4.192698, 0, 0.9803922, 1, 1,
0.04847493, 0.662515, -0.538973, 0, 0.9764706, 1, 1,
0.05012488, -0.8311664, 3.775681, 0, 0.9686275, 1, 1,
0.05080611, 1.016435, 1.379938, 0, 0.9647059, 1, 1,
0.0527768, 2.159704, 0.2074157, 0, 0.9568627, 1, 1,
0.05451559, -0.04469196, 3.879577, 0, 0.9529412, 1, 1,
0.06241436, -1.154161, 4.162455, 0, 0.945098, 1, 1,
0.0659436, 1.366174, 0.9456701, 0, 0.9411765, 1, 1,
0.06814778, -0.2906179, 2.624557, 0, 0.9333333, 1, 1,
0.07276277, 0.4454573, 1.94257, 0, 0.9294118, 1, 1,
0.07306195, 0.4074501, -0.1683027, 0, 0.9215686, 1, 1,
0.07328194, 0.7852468, 1.492014, 0, 0.9176471, 1, 1,
0.07458795, 3.024094, 0.3609212, 0, 0.9098039, 1, 1,
0.07691917, -1.462603, 2.593902, 0, 0.9058824, 1, 1,
0.07724818, 0.4828213, -1.673704, 0, 0.8980392, 1, 1,
0.0786793, 0.8057001, -0.6222501, 0, 0.8901961, 1, 1,
0.08225819, -1.380716, 3.068944, 0, 0.8862745, 1, 1,
0.08496806, 0.9804461, 0.5323308, 0, 0.8784314, 1, 1,
0.08546061, 0.5825466, -1.094439, 0, 0.8745098, 1, 1,
0.09253969, -0.07226265, 1.420209, 0, 0.8666667, 1, 1,
0.09501233, -1.294078, 3.713965, 0, 0.8627451, 1, 1,
0.09849667, -0.6356899, 3.497323, 0, 0.854902, 1, 1,
0.102589, -1.418525, 3.0962, 0, 0.8509804, 1, 1,
0.1042468, 0.3761344, 0.3836686, 0, 0.8431373, 1, 1,
0.1060589, -0.8712723, 4.34371, 0, 0.8392157, 1, 1,
0.1068427, 0.9577711, -0.5477294, 0, 0.8313726, 1, 1,
0.1118343, 0.1758255, 2.493137, 0, 0.827451, 1, 1,
0.1138719, 1.66589, 0.3618253, 0, 0.8196079, 1, 1,
0.1238194, 0.8242933, -0.8039563, 0, 0.8156863, 1, 1,
0.1269155, -1.212584, 2.079878, 0, 0.8078431, 1, 1,
0.1343101, -0.4197392, 1.648272, 0, 0.8039216, 1, 1,
0.1373902, 2.10828, 1.177577, 0, 0.7960784, 1, 1,
0.1375426, -1.956992, 4.606623, 0, 0.7882353, 1, 1,
0.1379672, 0.4832679, -0.6039013, 0, 0.7843137, 1, 1,
0.1417747, -0.3110191, 2.111109, 0, 0.7764706, 1, 1,
0.1423609, 1.187751, -2.455625, 0, 0.772549, 1, 1,
0.1486608, -1.229017, 1.656761, 0, 0.7647059, 1, 1,
0.150492, -1.133229, 2.741923, 0, 0.7607843, 1, 1,
0.1505332, 0.871919, 1.592413, 0, 0.7529412, 1, 1,
0.1549783, -0.7181075, 2.548196, 0, 0.7490196, 1, 1,
0.1566399, 1.39119, -1.590525, 0, 0.7411765, 1, 1,
0.1636108, -0.5275995, 3.037357, 0, 0.7372549, 1, 1,
0.1660462, -0.04044951, 2.702346, 0, 0.7294118, 1, 1,
0.1675768, -1.659593, 2.962498, 0, 0.7254902, 1, 1,
0.1691276, 0.5119568, -1.173011, 0, 0.7176471, 1, 1,
0.1725756, 0.1837842, 1.30338, 0, 0.7137255, 1, 1,
0.1735757, 0.3758858, 0.3885126, 0, 0.7058824, 1, 1,
0.1739479, -1.005206, 3.563798, 0, 0.6980392, 1, 1,
0.1756937, 0.9548635, -0.1679546, 0, 0.6941177, 1, 1,
0.1758624, -1.082566, 2.860452, 0, 0.6862745, 1, 1,
0.1806184, 0.3280336, 0.364777, 0, 0.682353, 1, 1,
0.1810281, -0.3682469, 3.144095, 0, 0.6745098, 1, 1,
0.1827928, 0.2945985, 0.3708089, 0, 0.6705883, 1, 1,
0.1846396, -0.1719127, 2.701836, 0, 0.6627451, 1, 1,
0.1866135, 0.4409607, -1.293828, 0, 0.6588235, 1, 1,
0.1872397, 1.548841, -0.05545774, 0, 0.6509804, 1, 1,
0.1881189, 0.7978802, 0.4337449, 0, 0.6470588, 1, 1,
0.1898243, 0.3239005, 1.739372, 0, 0.6392157, 1, 1,
0.1916518, -0.6333558, 3.647417, 0, 0.6352941, 1, 1,
0.1924216, -0.1226131, 4.281518, 0, 0.627451, 1, 1,
0.1939035, 1.461621, -0.2321559, 0, 0.6235294, 1, 1,
0.1943884, -0.7084387, 2.374903, 0, 0.6156863, 1, 1,
0.1954941, 1.035246, 0.6438677, 0, 0.6117647, 1, 1,
0.2017982, -1.845243, 2.629896, 0, 0.6039216, 1, 1,
0.2055381, -0.6429583, 4.178401, 0, 0.5960785, 1, 1,
0.2077085, 0.08963503, -0.5010728, 0, 0.5921569, 1, 1,
0.20893, 0.6641898, 0.7139503, 0, 0.5843138, 1, 1,
0.2090751, 0.9059718, -0.3340305, 0, 0.5803922, 1, 1,
0.2093419, -0.7576371, 2.85866, 0, 0.572549, 1, 1,
0.2115848, 0.7326133, -0.3209807, 0, 0.5686275, 1, 1,
0.21162, -0.07889229, 1.300289, 0, 0.5607843, 1, 1,
0.2188589, 0.6213713, 1.094471, 0, 0.5568628, 1, 1,
0.2218228, 0.2636532, 2.115648, 0, 0.5490196, 1, 1,
0.226118, 1.111859, -0.5190938, 0, 0.5450981, 1, 1,
0.2283964, 0.9197658, 0.2895316, 0, 0.5372549, 1, 1,
0.229641, -0.8748492, 4.951851, 0, 0.5333334, 1, 1,
0.2311716, -0.2561786, 3.138184, 0, 0.5254902, 1, 1,
0.2313122, -0.365499, 1.065551, 0, 0.5215687, 1, 1,
0.2328503, 1.346818, 0.6560465, 0, 0.5137255, 1, 1,
0.2334527, -0.3496577, 1.026271, 0, 0.509804, 1, 1,
0.2339638, 1.34048, 0.6986948, 0, 0.5019608, 1, 1,
0.2359036, 0.1423235, -0.4032906, 0, 0.4941176, 1, 1,
0.2381675, 0.7682147, -0.9889539, 0, 0.4901961, 1, 1,
0.2488429, -0.5063435, 2.699111, 0, 0.4823529, 1, 1,
0.249007, -0.853781, 1.905425, 0, 0.4784314, 1, 1,
0.2490377, 0.7114878, 1.180506, 0, 0.4705882, 1, 1,
0.2498188, 0.04639505, -0.2468086, 0, 0.4666667, 1, 1,
0.2498353, -2.426338, 1.862309, 0, 0.4588235, 1, 1,
0.2520086, 1.654621, 0.4783496, 0, 0.454902, 1, 1,
0.2554681, -0.4086382, 3.121001, 0, 0.4470588, 1, 1,
0.2578266, -0.7045876, 3.622954, 0, 0.4431373, 1, 1,
0.2613854, 0.9763308, -0.4660021, 0, 0.4352941, 1, 1,
0.2638546, -0.1298555, 1.960731, 0, 0.4313726, 1, 1,
0.2663072, -1.163414, 2.996943, 0, 0.4235294, 1, 1,
0.2707325, -1.278981, 2.108072, 0, 0.4196078, 1, 1,
0.2715336, -0.146587, 0.9375059, 0, 0.4117647, 1, 1,
0.2744336, 0.1107022, -0.6985142, 0, 0.4078431, 1, 1,
0.2752734, 0.9735078, 0.9416081, 0, 0.4, 1, 1,
0.2771508, -0.04768775, -0.02905153, 0, 0.3921569, 1, 1,
0.2817822, -0.4722409, 2.273237, 0, 0.3882353, 1, 1,
0.2862926, 0.110617, -0.09312155, 0, 0.3803922, 1, 1,
0.2872041, -1.139605, 2.499477, 0, 0.3764706, 1, 1,
0.2949238, -2.499804, 3.089871, 0, 0.3686275, 1, 1,
0.2958112, -2.338204, 1.785527, 0, 0.3647059, 1, 1,
0.2969047, -0.7303161, 3.331254, 0, 0.3568628, 1, 1,
0.298372, -1.878506, 3.496801, 0, 0.3529412, 1, 1,
0.2993998, 0.5098791, 1.642827, 0, 0.345098, 1, 1,
0.3010046, 1.300375, 0.8732025, 0, 0.3411765, 1, 1,
0.3015818, -0.2676221, 0.9926212, 0, 0.3333333, 1, 1,
0.3039987, -0.5064989, 4.190574, 0, 0.3294118, 1, 1,
0.3066099, 0.4518619, 1.174311, 0, 0.3215686, 1, 1,
0.3085532, 0.09341746, 1.929095, 0, 0.3176471, 1, 1,
0.3122505, -0.6472274, 3.593765, 0, 0.3098039, 1, 1,
0.3143358, -2.088902, 2.009348, 0, 0.3058824, 1, 1,
0.3145737, -0.04702686, 2.31804, 0, 0.2980392, 1, 1,
0.3164915, -0.02156399, 1.23791, 0, 0.2901961, 1, 1,
0.3171859, -0.9433108, 1.694005, 0, 0.2862745, 1, 1,
0.3176142, -1.283662, 3.2156, 0, 0.2784314, 1, 1,
0.3219743, -0.464844, 2.52048, 0, 0.2745098, 1, 1,
0.3293697, 1.285991, -0.2482124, 0, 0.2666667, 1, 1,
0.3331776, 1.194808, 1.53195, 0, 0.2627451, 1, 1,
0.3341145, 0.273006, -0.08464215, 0, 0.254902, 1, 1,
0.3355424, 0.7989073, 0.2205633, 0, 0.2509804, 1, 1,
0.3356307, 1.366703, 1.612612, 0, 0.2431373, 1, 1,
0.3381382, -0.5097047, 2.592177, 0, 0.2392157, 1, 1,
0.3424574, 0.9111028, -0.09581778, 0, 0.2313726, 1, 1,
0.3427227, -0.4195484, 0.4927335, 0, 0.227451, 1, 1,
0.3445357, -1.345616, 3.182329, 0, 0.2196078, 1, 1,
0.3462635, -0.2779245, 1.426509, 0, 0.2156863, 1, 1,
0.3493223, 0.296139, 1.166432, 0, 0.2078431, 1, 1,
0.3524469, -0.4849598, 3.108025, 0, 0.2039216, 1, 1,
0.3554807, -0.08556313, 0.5013613, 0, 0.1960784, 1, 1,
0.3574257, -0.6170537, 3.418987, 0, 0.1882353, 1, 1,
0.3608454, 1.453494, -1.099622, 0, 0.1843137, 1, 1,
0.361045, 0.4709678, 0.07776318, 0, 0.1764706, 1, 1,
0.3660725, 0.1796949, 1.105199, 0, 0.172549, 1, 1,
0.3674154, 1.031476, 0.8124279, 0, 0.1647059, 1, 1,
0.3685548, -2.035935, 1.814602, 0, 0.1607843, 1, 1,
0.3785349, 0.3597442, 0.5086614, 0, 0.1529412, 1, 1,
0.3800851, -0.6339377, 2.243322, 0, 0.1490196, 1, 1,
0.3811246, 1.379517, 0.1246717, 0, 0.1411765, 1, 1,
0.3816423, -1.006437, 3.765117, 0, 0.1372549, 1, 1,
0.383483, 0.5324964, 1.477858, 0, 0.1294118, 1, 1,
0.3886809, 0.2078278, 3.838835, 0, 0.1254902, 1, 1,
0.3911148, 1.542547, 1.037442, 0, 0.1176471, 1, 1,
0.3916309, -0.2615179, 2.579107, 0, 0.1137255, 1, 1,
0.3923107, -0.6719515, 2.424562, 0, 0.1058824, 1, 1,
0.3967114, -1.09666, 1.873402, 0, 0.09803922, 1, 1,
0.3991509, 1.054601, 2.315786, 0, 0.09411765, 1, 1,
0.4032961, 3.302658, 0.3991266, 0, 0.08627451, 1, 1,
0.4034471, 0.6239506, 1.661137, 0, 0.08235294, 1, 1,
0.4046549, -1.157883, 2.902954, 0, 0.07450981, 1, 1,
0.4051384, 0.4329907, 2.118869, 0, 0.07058824, 1, 1,
0.4075632, -1.01616, 3.357826, 0, 0.0627451, 1, 1,
0.4085437, 0.7814524, 0.0692943, 0, 0.05882353, 1, 1,
0.40926, -0.6902199, 1.412843, 0, 0.05098039, 1, 1,
0.4159619, -1.597363, 2.817641, 0, 0.04705882, 1, 1,
0.4176695, -2.075625, 2.014303, 0, 0.03921569, 1, 1,
0.4189284, -0.2647773, 2.230305, 0, 0.03529412, 1, 1,
0.4190989, -0.8800945, 2.325666, 0, 0.02745098, 1, 1,
0.4249862, -1.176158, 2.844895, 0, 0.02352941, 1, 1,
0.4262531, 0.9763058, -0.998261, 0, 0.01568628, 1, 1,
0.4265192, 1.412498, 0.1289932, 0, 0.01176471, 1, 1,
0.4267312, -1.153415, 0.8220928, 0, 0.003921569, 1, 1,
0.4300591, -0.7239919, 4.000863, 0.003921569, 0, 1, 1,
0.4328927, -0.04256142, 2.804493, 0.007843138, 0, 1, 1,
0.4411378, -0.2397257, 2.492136, 0.01568628, 0, 1, 1,
0.443387, 0.8212175, 0.4944745, 0.01960784, 0, 1, 1,
0.4465552, 0.635195, 1.507823, 0.02745098, 0, 1, 1,
0.4532036, 0.5327835, 0.7485572, 0.03137255, 0, 1, 1,
0.4543298, -0.1884108, 1.045371, 0.03921569, 0, 1, 1,
0.4568899, -1.348385, 4.42084, 0.04313726, 0, 1, 1,
0.4598556, -1.640757, 2.047964, 0.05098039, 0, 1, 1,
0.461982, -0.9521952, 4.617894, 0.05490196, 0, 1, 1,
0.4621642, -0.6682582, 1.985746, 0.0627451, 0, 1, 1,
0.4667374, -0.4499732, 1.676209, 0.06666667, 0, 1, 1,
0.4669087, -0.07843763, 0.899656, 0.07450981, 0, 1, 1,
0.4796548, 0.7561678, 0.3617008, 0.07843138, 0, 1, 1,
0.483938, 1.485851, -1.218808, 0.08627451, 0, 1, 1,
0.4881207, 0.6236182, 3.06893, 0.09019608, 0, 1, 1,
0.4894932, -0.04585566, 0.08927036, 0.09803922, 0, 1, 1,
0.4910358, -1.236917, 1.359851, 0.1058824, 0, 1, 1,
0.4913225, -0.3843825, 2.79465, 0.1098039, 0, 1, 1,
0.4925344, -0.08705401, 2.153496, 0.1176471, 0, 1, 1,
0.4952157, -2.315558, 1.807823, 0.1215686, 0, 1, 1,
0.4981244, 0.3810976, 1.356873, 0.1294118, 0, 1, 1,
0.5026265, -1.135619, 4.192233, 0.1333333, 0, 1, 1,
0.5037557, 0.4968324, -0.05969559, 0.1411765, 0, 1, 1,
0.5037914, 0.02902299, 2.065969, 0.145098, 0, 1, 1,
0.5045699, 0.5561896, -0.7818993, 0.1529412, 0, 1, 1,
0.5078049, -1.799049, 4.165212, 0.1568628, 0, 1, 1,
0.508437, 0.5316367, 0.377402, 0.1647059, 0, 1, 1,
0.5118832, -0.6757977, 1.686585, 0.1686275, 0, 1, 1,
0.5158942, -1.214644, 1.983332, 0.1764706, 0, 1, 1,
0.5162, 1.049938, 0.03211417, 0.1803922, 0, 1, 1,
0.5186315, 0.287894, 0.9847109, 0.1882353, 0, 1, 1,
0.5195369, 0.6249004, -0.836502, 0.1921569, 0, 1, 1,
0.521474, -0.4567046, 3.573951, 0.2, 0, 1, 1,
0.5215133, -0.240312, 1.480671, 0.2078431, 0, 1, 1,
0.5233987, 0.2581376, -0.6728125, 0.2117647, 0, 1, 1,
0.5273965, 0.004343387, 2.546074, 0.2196078, 0, 1, 1,
0.5294419, 0.1385176, 2.80857, 0.2235294, 0, 1, 1,
0.5375946, 0.2775781, -0.344952, 0.2313726, 0, 1, 1,
0.5384334, -0.4014522, 2.745285, 0.2352941, 0, 1, 1,
0.5409648, -0.2191515, 1.985745, 0.2431373, 0, 1, 1,
0.5453396, 0.6303884, -1.513412, 0.2470588, 0, 1, 1,
0.5518057, -0.7839275, 2.893632, 0.254902, 0, 1, 1,
0.5541457, 0.7931543, -0.4209385, 0.2588235, 0, 1, 1,
0.5594677, -0.2084845, 1.164643, 0.2666667, 0, 1, 1,
0.5596576, 0.007450094, 2.318752, 0.2705882, 0, 1, 1,
0.5620184, 1.167345, 2.216828, 0.2784314, 0, 1, 1,
0.5622103, 0.1727229, 2.225552, 0.282353, 0, 1, 1,
0.566542, -0.5734033, 2.377726, 0.2901961, 0, 1, 1,
0.5678258, 0.7863412, 1.459113, 0.2941177, 0, 1, 1,
0.5721984, -0.9762667, 2.644777, 0.3019608, 0, 1, 1,
0.5724667, -0.175547, 3.638674, 0.3098039, 0, 1, 1,
0.5750607, -1.140334, 2.02366, 0.3137255, 0, 1, 1,
0.5770862, 0.4768822, 1.934003, 0.3215686, 0, 1, 1,
0.5791783, 0.6017827, -0.0846847, 0.3254902, 0, 1, 1,
0.5792434, -0.3469851, 0.7404351, 0.3333333, 0, 1, 1,
0.5795065, -1.457569, 1.571975, 0.3372549, 0, 1, 1,
0.5801783, -0.7852942, 1.434812, 0.345098, 0, 1, 1,
0.5818086, -0.4991515, 3.425576, 0.3490196, 0, 1, 1,
0.5858268, -0.9808339, 0.6031459, 0.3568628, 0, 1, 1,
0.5861849, 0.6342536, 0.7953287, 0.3607843, 0, 1, 1,
0.5903941, -2.677005, 3.652468, 0.3686275, 0, 1, 1,
0.5905882, -1.462851, 3.535354, 0.372549, 0, 1, 1,
0.592006, -0.8297178, 2.692871, 0.3803922, 0, 1, 1,
0.5926435, 0.04434655, 0.5914196, 0.3843137, 0, 1, 1,
0.5962195, 1.069549, 1.104589, 0.3921569, 0, 1, 1,
0.5962966, -0.7800481, 1.80076, 0.3960784, 0, 1, 1,
0.5964845, 3.216395, 0.5381624, 0.4039216, 0, 1, 1,
0.6009052, 0.8653203, -0.4016963, 0.4117647, 0, 1, 1,
0.6045088, 0.032719, 3.371406, 0.4156863, 0, 1, 1,
0.6068252, 0.01329273, 2.006564, 0.4235294, 0, 1, 1,
0.6084027, 0.1054709, -0.4983441, 0.427451, 0, 1, 1,
0.6207528, -0.7388237, 2.218732, 0.4352941, 0, 1, 1,
0.6227552, 1.422647, 1.39679, 0.4392157, 0, 1, 1,
0.6301376, -2.495691, 2.466522, 0.4470588, 0, 1, 1,
0.6347659, 0.5782313, 0.2974423, 0.4509804, 0, 1, 1,
0.6376711, -1.146859, 2.068799, 0.4588235, 0, 1, 1,
0.650671, -0.8821749, 3.988171, 0.4627451, 0, 1, 1,
0.6521692, 0.9215984, 1.591715, 0.4705882, 0, 1, 1,
0.6524081, 0.3081546, 0.7958176, 0.4745098, 0, 1, 1,
0.6580876, -1.586265, 2.219899, 0.4823529, 0, 1, 1,
0.6585954, 0.4284321, -0.4310495, 0.4862745, 0, 1, 1,
0.661341, 0.8704565, 1.286512, 0.4941176, 0, 1, 1,
0.6704811, -0.8781188, 3.956006, 0.5019608, 0, 1, 1,
0.6781294, 0.1420774, 1.856736, 0.5058824, 0, 1, 1,
0.6783917, -0.8433709, 2.123979, 0.5137255, 0, 1, 1,
0.6787466, -0.8360035, 2.495917, 0.5176471, 0, 1, 1,
0.6812169, -0.8080547, 1.973895, 0.5254902, 0, 1, 1,
0.6833342, 0.02063488, 2.236, 0.5294118, 0, 1, 1,
0.6833433, -0.5451472, 1.45578, 0.5372549, 0, 1, 1,
0.6851517, 1.826667, -0.5033854, 0.5411765, 0, 1, 1,
0.6886278, 0.4489551, 1.586621, 0.5490196, 0, 1, 1,
0.6907451, -0.8267455, 0.3839688, 0.5529412, 0, 1, 1,
0.6961584, 0.5058843, -0.2701229, 0.5607843, 0, 1, 1,
0.7029048, 0.3076878, 4.212245, 0.5647059, 0, 1, 1,
0.70384, -0.01859683, 2.073046, 0.572549, 0, 1, 1,
0.7069146, -0.9619271, 1.852388, 0.5764706, 0, 1, 1,
0.7087374, -0.1910246, 1.692658, 0.5843138, 0, 1, 1,
0.7091969, 1.381381, -0.5509232, 0.5882353, 0, 1, 1,
0.7109942, 1.718037, -1.023902, 0.5960785, 0, 1, 1,
0.7160339, 0.5099648, 0.3680464, 0.6039216, 0, 1, 1,
0.7211286, 0.8514516, 0.9475279, 0.6078432, 0, 1, 1,
0.7216127, -0.01395769, 1.271104, 0.6156863, 0, 1, 1,
0.7226131, 1.572584, 0.3705127, 0.6196079, 0, 1, 1,
0.7243451, 0.02347686, 0.00022051, 0.627451, 0, 1, 1,
0.7249753, -0.999988, 2.311679, 0.6313726, 0, 1, 1,
0.7353423, -0.02624584, 3.358916, 0.6392157, 0, 1, 1,
0.7360511, 1.455948, 2.027202, 0.6431373, 0, 1, 1,
0.7361453, -0.9241064, 1.99591, 0.6509804, 0, 1, 1,
0.7388469, -1.301053, 1.907493, 0.654902, 0, 1, 1,
0.7406573, -0.05311597, 1.282418, 0.6627451, 0, 1, 1,
0.7410663, -0.3940084, 1.75854, 0.6666667, 0, 1, 1,
0.7427335, -1.130839, 1.707449, 0.6745098, 0, 1, 1,
0.7431339, -1.250075, 2.734251, 0.6784314, 0, 1, 1,
0.7470464, -0.06567515, 2.778124, 0.6862745, 0, 1, 1,
0.7491286, 0.67219, 2.102432, 0.6901961, 0, 1, 1,
0.7556791, -1.989097, 2.274139, 0.6980392, 0, 1, 1,
0.7556919, -0.2845668, 1.607492, 0.7058824, 0, 1, 1,
0.7575383, -0.7745938, 2.790702, 0.7098039, 0, 1, 1,
0.7587433, 1.414101, 1.157833, 0.7176471, 0, 1, 1,
0.7913318, 0.5711716, 1.271284, 0.7215686, 0, 1, 1,
0.7917629, 0.3758273, 1.355051, 0.7294118, 0, 1, 1,
0.7918371, 0.5536846, 1.754619, 0.7333333, 0, 1, 1,
0.7976539, 1.795654, 0.552373, 0.7411765, 0, 1, 1,
0.8008821, 1.05033, 0.5884299, 0.7450981, 0, 1, 1,
0.8082556, -0.2925642, 2.94966, 0.7529412, 0, 1, 1,
0.8083938, -0.4034064, 4.747879, 0.7568628, 0, 1, 1,
0.8099667, -0.5799673, 0.509156, 0.7647059, 0, 1, 1,
0.8136156, 0.1953773, 1.634611, 0.7686275, 0, 1, 1,
0.8139623, -0.7366034, 2.906778, 0.7764706, 0, 1, 1,
0.8246835, 1.624773, 0.9256179, 0.7803922, 0, 1, 1,
0.830524, 0.3814927, 0.7282189, 0.7882353, 0, 1, 1,
0.8381924, 0.5067081, -0.9767084, 0.7921569, 0, 1, 1,
0.8420001, -1.688732, 2.979378, 0.8, 0, 1, 1,
0.842979, 1.212367, 2.071393, 0.8078431, 0, 1, 1,
0.8514298, -1.280912, 2.661651, 0.8117647, 0, 1, 1,
0.8587451, 0.6667339, 0.7244561, 0.8196079, 0, 1, 1,
0.8619984, -1.687572, 2.716368, 0.8235294, 0, 1, 1,
0.864826, -0.6477917, 1.365426, 0.8313726, 0, 1, 1,
0.8661097, -0.8620679, 2.465772, 0.8352941, 0, 1, 1,
0.8668779, -0.9105904, 0.4974912, 0.8431373, 0, 1, 1,
0.8718194, -0.2455719, 1.513741, 0.8470588, 0, 1, 1,
0.8746642, -1.598386, 3.007815, 0.854902, 0, 1, 1,
0.8761718, -0.1742073, 2.657318, 0.8588235, 0, 1, 1,
0.8783418, -0.9806244, 2.289419, 0.8666667, 0, 1, 1,
0.8783778, -1.797696, 2.373915, 0.8705882, 0, 1, 1,
0.8849253, 0.8181788, 1.747081, 0.8784314, 0, 1, 1,
0.8861099, -1.407742, 3.841834, 0.8823529, 0, 1, 1,
0.8907746, 1.283277, -0.461996, 0.8901961, 0, 1, 1,
0.8932526, -1.073894, 2.97207, 0.8941177, 0, 1, 1,
0.8948987, 0.2570367, 2.220459, 0.9019608, 0, 1, 1,
0.8974354, -0.4781736, 1.421966, 0.9098039, 0, 1, 1,
0.9031544, -0.1557893, 4.162073, 0.9137255, 0, 1, 1,
0.9073834, -1.523786, 3.510344, 0.9215686, 0, 1, 1,
0.9143541, -0.08087745, 1.188481, 0.9254902, 0, 1, 1,
0.9147317, 0.7965295, -0.07681616, 0.9333333, 0, 1, 1,
0.9180975, 0.789663, 0.5041471, 0.9372549, 0, 1, 1,
0.9203981, -0.6537641, 3.306748, 0.945098, 0, 1, 1,
0.9283293, 0.3743126, 1.633329, 0.9490196, 0, 1, 1,
0.9312078, 0.5201734, 0.6574195, 0.9568627, 0, 1, 1,
0.9322371, -0.7356361, 3.099998, 0.9607843, 0, 1, 1,
0.9331607, -0.9640704, 0.7371572, 0.9686275, 0, 1, 1,
0.9339626, 1.406655, 1.117935, 0.972549, 0, 1, 1,
0.9415104, -0.03702807, 1.633223, 0.9803922, 0, 1, 1,
0.9492748, 0.638998, 2.003046, 0.9843137, 0, 1, 1,
0.9500425, -0.8395543, 2.489848, 0.9921569, 0, 1, 1,
0.9516429, -0.5042882, 2.059018, 0.9960784, 0, 1, 1,
0.9684374, 0.4257817, 0.265077, 1, 0, 0.9960784, 1,
0.9746358, -1.247392, 2.523716, 1, 0, 0.9882353, 1,
0.9758376, 0.8263161, 2.099161, 1, 0, 0.9843137, 1,
0.9771431, 0.2749376, -0.7360594, 1, 0, 0.9764706, 1,
0.979739, 0.1680064, 1.99964, 1, 0, 0.972549, 1,
0.9869062, 0.8445844, -0.08396523, 1, 0, 0.9647059, 1,
0.9872185, -0.5330558, 2.044126, 1, 0, 0.9607843, 1,
0.9888074, 1.004109, 1.775065, 1, 0, 0.9529412, 1,
0.9937357, 1.039081, 1.259594, 1, 0, 0.9490196, 1,
0.9937524, 1.481824, 0.3731008, 1, 0, 0.9411765, 1,
0.9971688, 1.467203, 1.176035, 1, 0, 0.9372549, 1,
0.9977515, 1.372632, -0.2492507, 1, 0, 0.9294118, 1,
0.9982359, -0.002025739, 2.510219, 1, 0, 0.9254902, 1,
1.003187, 0.309065, 2.117093, 1, 0, 0.9176471, 1,
1.020015, 0.4411317, -0.04441706, 1, 0, 0.9137255, 1,
1.022535, -0.0004720234, 1.654891, 1, 0, 0.9058824, 1,
1.02502, 0.07456681, 2.510602, 1, 0, 0.9019608, 1,
1.026687, -1.732668, 2.221577, 1, 0, 0.8941177, 1,
1.027585, 0.002204485, 2.117004, 1, 0, 0.8862745, 1,
1.029411, -1.704168, 3.241859, 1, 0, 0.8823529, 1,
1.031761, -0.6469087, 2.682591, 1, 0, 0.8745098, 1,
1.035281, 1.329894, 0.9087079, 1, 0, 0.8705882, 1,
1.039958, -0.1783883, 2.840251, 1, 0, 0.8627451, 1,
1.043829, -1.042351, 2.673965, 1, 0, 0.8588235, 1,
1.046651, 0.4155413, 1.619766, 1, 0, 0.8509804, 1,
1.059126, 0.6175844, 0.7168155, 1, 0, 0.8470588, 1,
1.059516, 1.217054, 1.701772, 1, 0, 0.8392157, 1,
1.062858, -0.6538698, 1.906601, 1, 0, 0.8352941, 1,
1.068677, 1.558928, -0.06789333, 1, 0, 0.827451, 1,
1.070971, 1.024384, 0.6379905, 1, 0, 0.8235294, 1,
1.076875, 0.8134272, -0.2708344, 1, 0, 0.8156863, 1,
1.089061, -0.5183178, 1.482202, 1, 0, 0.8117647, 1,
1.092538, -0.2638907, 1.33118, 1, 0, 0.8039216, 1,
1.092749, 0.9125085, 1.469061, 1, 0, 0.7960784, 1,
1.09543, -0.2730842, 1.667199, 1, 0, 0.7921569, 1,
1.09817, -1.071251, 2.140349, 1, 0, 0.7843137, 1,
1.099441, 1.606924, 0.5800164, 1, 0, 0.7803922, 1,
1.100089, 0.1871482, 2.383959, 1, 0, 0.772549, 1,
1.104328, 0.1860185, 1.123248, 1, 0, 0.7686275, 1,
1.111457, -0.3078046, 1.319437, 1, 0, 0.7607843, 1,
1.113173, -1.886937, 1.111537, 1, 0, 0.7568628, 1,
1.121755, -1.525851, 3.839155, 1, 0, 0.7490196, 1,
1.124323, -0.1117589, 0.3185281, 1, 0, 0.7450981, 1,
1.125691, -0.08413465, 1.060103, 1, 0, 0.7372549, 1,
1.127465, -0.8799464, 1.629565, 1, 0, 0.7333333, 1,
1.128389, 0.4060799, 2.692191, 1, 0, 0.7254902, 1,
1.13708, 0.2350403, 3.162506, 1, 0, 0.7215686, 1,
1.145222, -0.59594, 2.047513, 1, 0, 0.7137255, 1,
1.153387, -1.014018, 1.559683, 1, 0, 0.7098039, 1,
1.164347, 0.1765783, -0.2288677, 1, 0, 0.7019608, 1,
1.167513, 0.5407224, 0.4610457, 1, 0, 0.6941177, 1,
1.179703, 0.9387588, 0.7337044, 1, 0, 0.6901961, 1,
1.189948, -0.2434377, 2.506885, 1, 0, 0.682353, 1,
1.202102, -1.345034, 2.11198, 1, 0, 0.6784314, 1,
1.205939, -0.08427023, 2.886811, 1, 0, 0.6705883, 1,
1.206012, -1.288809, 0.4405871, 1, 0, 0.6666667, 1,
1.206903, 0.3592014, -0.712327, 1, 0, 0.6588235, 1,
1.211904, 0.105988, 1.6572, 1, 0, 0.654902, 1,
1.221835, 0.5608594, 1.879196, 1, 0, 0.6470588, 1,
1.226427, -0.2671614, 2.570057, 1, 0, 0.6431373, 1,
1.227972, -0.01264903, -0.1610751, 1, 0, 0.6352941, 1,
1.231694, 1.602546, 0.05812562, 1, 0, 0.6313726, 1,
1.233181, -0.7703218, 2.465023, 1, 0, 0.6235294, 1,
1.244975, 0.5212206, 2.48799, 1, 0, 0.6196079, 1,
1.265283, 0.8489755, 1.533156, 1, 0, 0.6117647, 1,
1.2689, -0.1597786, 1.631701, 1, 0, 0.6078432, 1,
1.274151, 0.9890914, 1.19028, 1, 0, 0.6, 1,
1.278482, -0.9525034, 0.5946169, 1, 0, 0.5921569, 1,
1.296805, 0.1372209, 4.070106, 1, 0, 0.5882353, 1,
1.297256, 1.125081, 0.5862113, 1, 0, 0.5803922, 1,
1.311351, 0.6557321, 0.4899334, 1, 0, 0.5764706, 1,
1.319865, -1.723273, 2.716904, 1, 0, 0.5686275, 1,
1.324992, -0.5995578, 1.185542, 1, 0, 0.5647059, 1,
1.327006, 1.62854, -0.1502834, 1, 0, 0.5568628, 1,
1.33988, 0.7456641, 2.432697, 1, 0, 0.5529412, 1,
1.344173, 0.730797, 1.06642, 1, 0, 0.5450981, 1,
1.345446, -1.167675, 2.971562, 1, 0, 0.5411765, 1,
1.351935, -1.863113, 3.090949, 1, 0, 0.5333334, 1,
1.399899, 0.08221788, 2.027524, 1, 0, 0.5294118, 1,
1.403729, 0.2990728, -0.1157861, 1, 0, 0.5215687, 1,
1.403858, -0.1901674, 1.155162, 1, 0, 0.5176471, 1,
1.404516, -1.111824, 3.563227, 1, 0, 0.509804, 1,
1.405057, 0.8057185, 1.364844, 1, 0, 0.5058824, 1,
1.407209, 0.5152434, 3.664448, 1, 0, 0.4980392, 1,
1.408996, -1.251073, 2.329425, 1, 0, 0.4901961, 1,
1.416408, -0.4644319, 1.994162, 1, 0, 0.4862745, 1,
1.432317, -0.8983403, 2.742548, 1, 0, 0.4784314, 1,
1.451029, -0.6160443, 2.183745, 1, 0, 0.4745098, 1,
1.458194, 0.4571125, 1.943379, 1, 0, 0.4666667, 1,
1.458828, -0.7707226, 2.502192, 1, 0, 0.4627451, 1,
1.469139, 0.4482213, 2.941184, 1, 0, 0.454902, 1,
1.476885, -0.3583252, 2.793334, 1, 0, 0.4509804, 1,
1.478036, -0.03678273, 2.86314, 1, 0, 0.4431373, 1,
1.494825, 0.1165929, 1.944841, 1, 0, 0.4392157, 1,
1.497351, 0.9255112, 1.488669, 1, 0, 0.4313726, 1,
1.503093, 0.670513, 0.8101702, 1, 0, 0.427451, 1,
1.510373, 0.4727173, -0.4191472, 1, 0, 0.4196078, 1,
1.526043, 0.06219251, 0.578886, 1, 0, 0.4156863, 1,
1.529929, -0.5013568, 1.094002, 1, 0, 0.4078431, 1,
1.53947, 0.944289, 1.366239, 1, 0, 0.4039216, 1,
1.548762, -0.2222289, 1.470898, 1, 0, 0.3960784, 1,
1.556021, 1.226782, 2.360316, 1, 0, 0.3882353, 1,
1.558296, -0.8542747, 2.366742, 1, 0, 0.3843137, 1,
1.597699, -0.890983, 3.778594, 1, 0, 0.3764706, 1,
1.600075, -1.980605, 2.476326, 1, 0, 0.372549, 1,
1.610606, 2.101737, 1.302108, 1, 0, 0.3647059, 1,
1.629037, 0.5381439, 1.890265, 1, 0, 0.3607843, 1,
1.652734, 0.5957662, 4.214805, 1, 0, 0.3529412, 1,
1.658871, -1.472271, 1.981291, 1, 0, 0.3490196, 1,
1.662817, 0.5095089, 0.5618168, 1, 0, 0.3411765, 1,
1.663956, 1.356964, 0.7537841, 1, 0, 0.3372549, 1,
1.679123, -0.255977, 1.427154, 1, 0, 0.3294118, 1,
1.690187, 0.3446373, 0.9892484, 1, 0, 0.3254902, 1,
1.690301, 0.2210049, 2.054672, 1, 0, 0.3176471, 1,
1.690796, 0.6830183, 1.921459, 1, 0, 0.3137255, 1,
1.695131, -1.32396, 3.793972, 1, 0, 0.3058824, 1,
1.696637, 1.183653, 0.9360247, 1, 0, 0.2980392, 1,
1.698491, 1.130629, -0.3525583, 1, 0, 0.2941177, 1,
1.73111, 0.8535529, 1.816395, 1, 0, 0.2862745, 1,
1.748062, -0.8451, 1.896823, 1, 0, 0.282353, 1,
1.774193, -0.8920683, 2.759591, 1, 0, 0.2745098, 1,
1.784348, 0.0001374397, 1.985525, 1, 0, 0.2705882, 1,
1.786268, -0.9036096, 3.802164, 1, 0, 0.2627451, 1,
1.803432, -0.4536222, 1.55976, 1, 0, 0.2588235, 1,
1.806377, 0.4076162, 0.2553129, 1, 0, 0.2509804, 1,
1.806609, 0.4408052, 1.931397, 1, 0, 0.2470588, 1,
1.80755, 0.03900521, 0.967416, 1, 0, 0.2392157, 1,
1.815151, 1.49716, -0.3279175, 1, 0, 0.2352941, 1,
1.867147, -0.3058633, 0.3506041, 1, 0, 0.227451, 1,
1.871006, -0.2571697, 1.535299, 1, 0, 0.2235294, 1,
1.880423, -0.2240523, -0.5764184, 1, 0, 0.2156863, 1,
1.892728, -0.04124226, 1.966899, 1, 0, 0.2117647, 1,
1.915762, 0.05533956, 1.40047, 1, 0, 0.2039216, 1,
1.939373, 0.04484954, 0.2886887, 1, 0, 0.1960784, 1,
1.955104, -0.8822226, 1.528721, 1, 0, 0.1921569, 1,
2.000209, 0.5161526, 2.835169, 1, 0, 0.1843137, 1,
2.011734, 0.8417897, 0.5778804, 1, 0, 0.1803922, 1,
2.01317, -0.02630196, 2.638052, 1, 0, 0.172549, 1,
2.023958, 0.2171447, 0.939383, 1, 0, 0.1686275, 1,
2.030719, -0.8152571, 1.911379, 1, 0, 0.1607843, 1,
2.033654, -1.771177, 2.136197, 1, 0, 0.1568628, 1,
2.040341, 0.2531132, 2.016437, 1, 0, 0.1490196, 1,
2.052464, 0.1827245, 1.389396, 1, 0, 0.145098, 1,
2.063358, 1.583577, 0.7857484, 1, 0, 0.1372549, 1,
2.090647, 0.1513247, -0.008287414, 1, 0, 0.1333333, 1,
2.120964, -2.435243, 1.999045, 1, 0, 0.1254902, 1,
2.141094, -1.222749, 4.005695, 1, 0, 0.1215686, 1,
2.144792, -1.203539, 0.5919362, 1, 0, 0.1137255, 1,
2.167275, 1.019846, 0.7913712, 1, 0, 0.1098039, 1,
2.193289, 0.5388901, 1.677378, 1, 0, 0.1019608, 1,
2.197096, 0.3374565, 2.044151, 1, 0, 0.09411765, 1,
2.21558, -1.314947, 1.568616, 1, 0, 0.09019608, 1,
2.233251, -0.9148356, 1.962249, 1, 0, 0.08235294, 1,
2.271652, -0.2078821, 0.9178628, 1, 0, 0.07843138, 1,
2.284012, -0.3782477, 1.290035, 1, 0, 0.07058824, 1,
2.287321, 0.9532415, -0.004226412, 1, 0, 0.06666667, 1,
2.310256, -0.3725896, 1.455853, 1, 0, 0.05882353, 1,
2.37349, 0.7436806, 1.14325, 1, 0, 0.05490196, 1,
2.405446, -0.09749608, 1.923059, 1, 0, 0.04705882, 1,
2.407049, 0.3757892, -0.2117928, 1, 0, 0.04313726, 1,
2.411777, -0.480926, 1.664675, 1, 0, 0.03529412, 1,
2.437217, 1.557437, 1.937486, 1, 0, 0.03137255, 1,
2.577583, -2.335854, 2.122791, 1, 0, 0.02352941, 1,
2.608281, -0.1665227, 2.015941, 1, 0, 0.01960784, 1,
2.645766, 1.511569, 3.24837, 1, 0, 0.01176471, 1,
3.257918, 1.330879, 0.5898724, 1, 0, 0.007843138, 1
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
0.2199695, -4.015398, -6.650075, 0, -0.5, 0.5, 0.5,
0.2199695, -4.015398, -6.650075, 1, -0.5, 0.5, 0.5,
0.2199695, -4.015398, -6.650075, 1, 1.5, 0.5, 0.5,
0.2199695, -4.015398, -6.650075, 0, 1.5, 0.5, 0.5
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
-3.847844, 0.1739469, -6.650075, 0, -0.5, 0.5, 0.5,
-3.847844, 0.1739469, -6.650075, 1, -0.5, 0.5, 0.5,
-3.847844, 0.1739469, -6.650075, 1, 1.5, 0.5, 0.5,
-3.847844, 0.1739469, -6.650075, 0, 1.5, 0.5, 0.5
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
-3.847844, -4.015398, -0.00835681, 0, -0.5, 0.5, 0.5,
-3.847844, -4.015398, -0.00835681, 1, -0.5, 0.5, 0.5,
-3.847844, -4.015398, -0.00835681, 1, 1.5, 0.5, 0.5,
-3.847844, -4.015398, -0.00835681, 0, 1.5, 0.5, 0.5
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
-2, -3.048626, -5.117371,
3, -3.048626, -5.117371,
-2, -3.048626, -5.117371,
-2, -3.209754, -5.372822,
-1, -3.048626, -5.117371,
-1, -3.209754, -5.372822,
0, -3.048626, -5.117371,
0, -3.209754, -5.372822,
1, -3.048626, -5.117371,
1, -3.209754, -5.372822,
2, -3.048626, -5.117371,
2, -3.209754, -5.372822,
3, -3.048626, -5.117371,
3, -3.209754, -5.372822
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
-2, -3.532012, -5.883723, 0, -0.5, 0.5, 0.5,
-2, -3.532012, -5.883723, 1, -0.5, 0.5, 0.5,
-2, -3.532012, -5.883723, 1, 1.5, 0.5, 0.5,
-2, -3.532012, -5.883723, 0, 1.5, 0.5, 0.5,
-1, -3.532012, -5.883723, 0, -0.5, 0.5, 0.5,
-1, -3.532012, -5.883723, 1, -0.5, 0.5, 0.5,
-1, -3.532012, -5.883723, 1, 1.5, 0.5, 0.5,
-1, -3.532012, -5.883723, 0, 1.5, 0.5, 0.5,
0, -3.532012, -5.883723, 0, -0.5, 0.5, 0.5,
0, -3.532012, -5.883723, 1, -0.5, 0.5, 0.5,
0, -3.532012, -5.883723, 1, 1.5, 0.5, 0.5,
0, -3.532012, -5.883723, 0, 1.5, 0.5, 0.5,
1, -3.532012, -5.883723, 0, -0.5, 0.5, 0.5,
1, -3.532012, -5.883723, 1, -0.5, 0.5, 0.5,
1, -3.532012, -5.883723, 1, 1.5, 0.5, 0.5,
1, -3.532012, -5.883723, 0, 1.5, 0.5, 0.5,
2, -3.532012, -5.883723, 0, -0.5, 0.5, 0.5,
2, -3.532012, -5.883723, 1, -0.5, 0.5, 0.5,
2, -3.532012, -5.883723, 1, 1.5, 0.5, 0.5,
2, -3.532012, -5.883723, 0, 1.5, 0.5, 0.5,
3, -3.532012, -5.883723, 0, -0.5, 0.5, 0.5,
3, -3.532012, -5.883723, 1, -0.5, 0.5, 0.5,
3, -3.532012, -5.883723, 1, 1.5, 0.5, 0.5,
3, -3.532012, -5.883723, 0, 1.5, 0.5, 0.5
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
-2.909118, -2, -5.117371,
-2.909118, 3, -5.117371,
-2.909118, -2, -5.117371,
-3.065572, -2, -5.372822,
-2.909118, -1, -5.117371,
-3.065572, -1, -5.372822,
-2.909118, 0, -5.117371,
-3.065572, 0, -5.372822,
-2.909118, 1, -5.117371,
-3.065572, 1, -5.372822,
-2.909118, 2, -5.117371,
-3.065572, 2, -5.372822,
-2.909118, 3, -5.117371,
-3.065572, 3, -5.372822
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
-3.378481, -2, -5.883723, 0, -0.5, 0.5, 0.5,
-3.378481, -2, -5.883723, 1, -0.5, 0.5, 0.5,
-3.378481, -2, -5.883723, 1, 1.5, 0.5, 0.5,
-3.378481, -2, -5.883723, 0, 1.5, 0.5, 0.5,
-3.378481, -1, -5.883723, 0, -0.5, 0.5, 0.5,
-3.378481, -1, -5.883723, 1, -0.5, 0.5, 0.5,
-3.378481, -1, -5.883723, 1, 1.5, 0.5, 0.5,
-3.378481, -1, -5.883723, 0, 1.5, 0.5, 0.5,
-3.378481, 0, -5.883723, 0, -0.5, 0.5, 0.5,
-3.378481, 0, -5.883723, 1, -0.5, 0.5, 0.5,
-3.378481, 0, -5.883723, 1, 1.5, 0.5, 0.5,
-3.378481, 0, -5.883723, 0, 1.5, 0.5, 0.5,
-3.378481, 1, -5.883723, 0, -0.5, 0.5, 0.5,
-3.378481, 1, -5.883723, 1, -0.5, 0.5, 0.5,
-3.378481, 1, -5.883723, 1, 1.5, 0.5, 0.5,
-3.378481, 1, -5.883723, 0, 1.5, 0.5, 0.5,
-3.378481, 2, -5.883723, 0, -0.5, 0.5, 0.5,
-3.378481, 2, -5.883723, 1, -0.5, 0.5, 0.5,
-3.378481, 2, -5.883723, 1, 1.5, 0.5, 0.5,
-3.378481, 2, -5.883723, 0, 1.5, 0.5, 0.5,
-3.378481, 3, -5.883723, 0, -0.5, 0.5, 0.5,
-3.378481, 3, -5.883723, 1, -0.5, 0.5, 0.5,
-3.378481, 3, -5.883723, 1, 1.5, 0.5, 0.5,
-3.378481, 3, -5.883723, 0, 1.5, 0.5, 0.5
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
-2.909118, -3.048626, -4,
-2.909118, -3.048626, 4,
-2.909118, -3.048626, -4,
-3.065572, -3.209754, -4,
-2.909118, -3.048626, -2,
-3.065572, -3.209754, -2,
-2.909118, -3.048626, 0,
-3.065572, -3.209754, 0,
-2.909118, -3.048626, 2,
-3.065572, -3.209754, 2,
-2.909118, -3.048626, 4,
-3.065572, -3.209754, 4
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
-3.378481, -3.532012, -4, 0, -0.5, 0.5, 0.5,
-3.378481, -3.532012, -4, 1, -0.5, 0.5, 0.5,
-3.378481, -3.532012, -4, 1, 1.5, 0.5, 0.5,
-3.378481, -3.532012, -4, 0, 1.5, 0.5, 0.5,
-3.378481, -3.532012, -2, 0, -0.5, 0.5, 0.5,
-3.378481, -3.532012, -2, 1, -0.5, 0.5, 0.5,
-3.378481, -3.532012, -2, 1, 1.5, 0.5, 0.5,
-3.378481, -3.532012, -2, 0, 1.5, 0.5, 0.5,
-3.378481, -3.532012, 0, 0, -0.5, 0.5, 0.5,
-3.378481, -3.532012, 0, 1, -0.5, 0.5, 0.5,
-3.378481, -3.532012, 0, 1, 1.5, 0.5, 0.5,
-3.378481, -3.532012, 0, 0, 1.5, 0.5, 0.5,
-3.378481, -3.532012, 2, 0, -0.5, 0.5, 0.5,
-3.378481, -3.532012, 2, 1, -0.5, 0.5, 0.5,
-3.378481, -3.532012, 2, 1, 1.5, 0.5, 0.5,
-3.378481, -3.532012, 2, 0, 1.5, 0.5, 0.5,
-3.378481, -3.532012, 4, 0, -0.5, 0.5, 0.5,
-3.378481, -3.532012, 4, 1, -0.5, 0.5, 0.5,
-3.378481, -3.532012, 4, 1, 1.5, 0.5, 0.5,
-3.378481, -3.532012, 4, 0, 1.5, 0.5, 0.5
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
-2.909118, -3.048626, -5.117371,
-2.909118, 3.396519, -5.117371,
-2.909118, -3.048626, 5.100657,
-2.909118, 3.396519, 5.100657,
-2.909118, -3.048626, -5.117371,
-2.909118, -3.048626, 5.100657,
-2.909118, 3.396519, -5.117371,
-2.909118, 3.396519, 5.100657,
-2.909118, -3.048626, -5.117371,
3.349057, -3.048626, -5.117371,
-2.909118, -3.048626, 5.100657,
3.349057, -3.048626, 5.100657,
-2.909118, 3.396519, -5.117371,
3.349057, 3.396519, -5.117371,
-2.909118, 3.396519, 5.100657,
3.349057, 3.396519, 5.100657,
3.349057, -3.048626, -5.117371,
3.349057, 3.396519, -5.117371,
3.349057, -3.048626, 5.100657,
3.349057, 3.396519, 5.100657,
3.349057, -3.048626, -5.117371,
3.349057, -3.048626, 5.100657,
3.349057, 3.396519, -5.117371,
3.349057, 3.396519, 5.100657
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
var radius = 7.265134;
var distance = 32.3234;
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
mvMatrix.translate( -0.2199695, -0.1739469, 0.00835681 );
mvMatrix.scale( 1.255191, 1.218779, 0.7687594 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.3234);
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
cloransulam<-read.table("cloransulam.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-cloransulam$V2
```

```
## Error in eval(expr, envir, enclos): object 'cloransulam' not found
```

```r
y<-cloransulam$V3
```

```
## Error in eval(expr, envir, enclos): object 'cloransulam' not found
```

```r
z<-cloransulam$V4
```

```
## Error in eval(expr, envir, enclos): object 'cloransulam' not found
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
-2.817979, -0.2226292, -1.793186, 0, 0, 1, 1, 1,
-2.502041, 1.252417, -1.217975, 1, 0, 0, 1, 1,
-2.494298, -0.8156661, -2.044339, 1, 0, 0, 1, 1,
-2.364456, -0.1318427, -1.786946, 1, 0, 0, 1, 1,
-2.343611, -0.589094, -2.733087, 1, 0, 0, 1, 1,
-2.270483, 0.4872015, -3.06744, 1, 0, 0, 1, 1,
-2.239383, 0.04928042, -2.089905, 0, 0, 0, 1, 1,
-2.225373, -0.9312212, -1.788895, 0, 0, 0, 1, 1,
-2.174354, -1.781541, -2.270619, 0, 0, 0, 1, 1,
-2.149118, -1.345237, -3.025303, 0, 0, 0, 1, 1,
-2.135614, -1.230734, -2.074255, 0, 0, 0, 1, 1,
-2.120276, -0.3289787, -1.463613, 0, 0, 0, 1, 1,
-2.11028, 0.794313, -0.6639557, 0, 0, 0, 1, 1,
-2.110069, -2.467022, -3.786832, 1, 1, 1, 1, 1,
-2.093218, -0.1464963, -0.859627, 1, 1, 1, 1, 1,
-2.064572, 0.6285757, -0.8565927, 1, 1, 1, 1, 1,
-2.024289, 0.75975, -1.14458, 1, 1, 1, 1, 1,
-1.995944, 0.8551295, -1.767493, 1, 1, 1, 1, 1,
-1.963789, -0.4433265, -0.06736612, 1, 1, 1, 1, 1,
-1.912206, 1.062356, -0.7050027, 1, 1, 1, 1, 1,
-1.907615, 0.5582787, 0.6250375, 1, 1, 1, 1, 1,
-1.897503, 0.179646, -2.840073, 1, 1, 1, 1, 1,
-1.889367, -1.265069, -2.628385, 1, 1, 1, 1, 1,
-1.881445, 2.421539, -1.143166, 1, 1, 1, 1, 1,
-1.879978, 0.7821733, 0.2502898, 1, 1, 1, 1, 1,
-1.874225, 0.9133253, -1.263344, 1, 1, 1, 1, 1,
-1.852232, -0.823624, -1.168062, 1, 1, 1, 1, 1,
-1.838195, 0.6506418, -1.565778, 1, 1, 1, 1, 1,
-1.83566, 0.4469776, -1.10585, 0, 0, 1, 1, 1,
-1.831683, -0.8678919, -2.561586, 1, 0, 0, 1, 1,
-1.825678, -0.4141729, -1.719886, 1, 0, 0, 1, 1,
-1.809203, -0.9395604, -2.174324, 1, 0, 0, 1, 1,
-1.787784, 0.2750911, -1.683475, 1, 0, 0, 1, 1,
-1.777313, 1.848395, -1.931573, 1, 0, 0, 1, 1,
-1.721467, -0.7325537, -0.5721579, 0, 0, 0, 1, 1,
-1.720037, 0.04863218, -2.091911, 0, 0, 0, 1, 1,
-1.718166, 0.01343665, -0.3598163, 0, 0, 0, 1, 1,
-1.712856, 0.2587859, -1.919556, 0, 0, 0, 1, 1,
-1.711378, -0.9354935, -3.317085, 0, 0, 0, 1, 1,
-1.70933, 1.500299, -1.268539, 0, 0, 0, 1, 1,
-1.695245, -1.279451, -1.784753, 0, 0, 0, 1, 1,
-1.692884, 0.04572141, -1.491399, 1, 1, 1, 1, 1,
-1.689628, -0.1862592, -1.771944, 1, 1, 1, 1, 1,
-1.666408, 0.8847412, -1.089954, 1, 1, 1, 1, 1,
-1.663729, 0.764304, -2.106416, 1, 1, 1, 1, 1,
-1.647382, 0.9530438, -2.258948, 1, 1, 1, 1, 1,
-1.641905, 0.4454947, -0.5606452, 1, 1, 1, 1, 1,
-1.640118, 1.084604, 1.576079, 1, 1, 1, 1, 1,
-1.626932, 0.02716294, -0.5391727, 1, 1, 1, 1, 1,
-1.619022, -1.033351, -0.9521499, 1, 1, 1, 1, 1,
-1.602185, 1.426594, -1.350965, 1, 1, 1, 1, 1,
-1.596366, 0.01308269, -1.002405, 1, 1, 1, 1, 1,
-1.582497, -0.7354914, -3.781758, 1, 1, 1, 1, 1,
-1.579449, 1.569717, -1.117667, 1, 1, 1, 1, 1,
-1.576992, 0.0367576, -2.806942, 1, 1, 1, 1, 1,
-1.564558, -0.4581115, -1.159737, 1, 1, 1, 1, 1,
-1.555588, -0.8781348, -0.8688254, 0, 0, 1, 1, 1,
-1.555414, 0.8446051, -2.329088, 1, 0, 0, 1, 1,
-1.539654, 1.249067, -0.6503826, 1, 0, 0, 1, 1,
-1.536684, 0.2266106, -1.23668, 1, 0, 0, 1, 1,
-1.530676, -0.9523614, -2.895118, 1, 0, 0, 1, 1,
-1.529656, 0.2891597, 0.4422531, 1, 0, 0, 1, 1,
-1.529334, -0.4012403, -1.672632, 0, 0, 0, 1, 1,
-1.52884, -1.350326, -3.532375, 0, 0, 0, 1, 1,
-1.521635, -0.9430234, -2.600949, 0, 0, 0, 1, 1,
-1.499887, 0.1955193, -2.085815, 0, 0, 0, 1, 1,
-1.49065, 0.7067153, -1.652918, 0, 0, 0, 1, 1,
-1.48975, -0.01727537, -0.7693918, 0, 0, 0, 1, 1,
-1.478249, 0.9039342, -0.9894822, 0, 0, 0, 1, 1,
-1.470688, 0.1099104, -0.8327149, 1, 1, 1, 1, 1,
-1.46511, 0.7470383, -1.258429, 1, 1, 1, 1, 1,
-1.461979, -1.663947, -1.534625, 1, 1, 1, 1, 1,
-1.414571, -1.903041, -1.914593, 1, 1, 1, 1, 1,
-1.411003, -0.7289941, -2.647485, 1, 1, 1, 1, 1,
-1.39709, 0.1915864, -1.016737, 1, 1, 1, 1, 1,
-1.395517, 0.9824885, 0.055646, 1, 1, 1, 1, 1,
-1.391889, 0.4654908, -1.504995, 1, 1, 1, 1, 1,
-1.379437, 0.9915136, -1.316503, 1, 1, 1, 1, 1,
-1.373551, -0.5185701, -2.246108, 1, 1, 1, 1, 1,
-1.373382, -0.4708439, -0.3254299, 1, 1, 1, 1, 1,
-1.36561, 0.7820296, -0.8422258, 1, 1, 1, 1, 1,
-1.359366, -1.409462, -1.982198, 1, 1, 1, 1, 1,
-1.348627, -0.2746198, -0.9963441, 1, 1, 1, 1, 1,
-1.348211, -1.461199, -1.208955, 1, 1, 1, 1, 1,
-1.343049, -1.140716, -2.220807, 0, 0, 1, 1, 1,
-1.338659, 1.364294, -0.680827, 1, 0, 0, 1, 1,
-1.338363, -1.714247, -3.379554, 1, 0, 0, 1, 1,
-1.338179, 0.9609028, -1.024792, 1, 0, 0, 1, 1,
-1.336501, 0.4651541, -0.257796, 1, 0, 0, 1, 1,
-1.335947, 1.082516, -1.070539, 1, 0, 0, 1, 1,
-1.322564, 1.274623, 0.2946175, 0, 0, 0, 1, 1,
-1.318098, 1.313511, -0.3916157, 0, 0, 0, 1, 1,
-1.309313, 0.339456, -0.7030259, 0, 0, 0, 1, 1,
-1.296859, 1.549643, -0.3587346, 0, 0, 0, 1, 1,
-1.296704, 0.7435006, -2.192613, 0, 0, 0, 1, 1,
-1.290239, -1.748833, -4.646053, 0, 0, 0, 1, 1,
-1.289823, -0.4624197, -1.838708, 0, 0, 0, 1, 1,
-1.289028, -1.193266, -1.862871, 1, 1, 1, 1, 1,
-1.277953, -0.8200991, -1.757911, 1, 1, 1, 1, 1,
-1.275626, -0.9372569, -2.92203, 1, 1, 1, 1, 1,
-1.273143, 0.3092784, -1.697144, 1, 1, 1, 1, 1,
-1.258028, 0.2999933, -0.5197568, 1, 1, 1, 1, 1,
-1.257655, -0.2823358, -3.375708, 1, 1, 1, 1, 1,
-1.255833, -0.5401884, -1.787668, 1, 1, 1, 1, 1,
-1.241328, -0.3152143, -2.041247, 1, 1, 1, 1, 1,
-1.235343, 1.058843, -2.129604, 1, 1, 1, 1, 1,
-1.234717, 0.923276, -0.9872121, 1, 1, 1, 1, 1,
-1.233184, -0.03710572, -1.025085, 1, 1, 1, 1, 1,
-1.232922, -1.122451, -1.48256, 1, 1, 1, 1, 1,
-1.221835, 0.1657311, -1.108386, 1, 1, 1, 1, 1,
-1.201266, -1.458566, -3.025589, 1, 1, 1, 1, 1,
-1.196322, 2.155999, -0.2253253, 1, 1, 1, 1, 1,
-1.195612, 1.509553, -0.9830056, 0, 0, 1, 1, 1,
-1.189042, 0.1656986, 1.194848, 1, 0, 0, 1, 1,
-1.185657, 0.5330463, -2.647825, 1, 0, 0, 1, 1,
-1.175317, 0.00117379, -1.608426, 1, 0, 0, 1, 1,
-1.17043, -0.4079249, -1.31521, 1, 0, 0, 1, 1,
-1.154047, -0.2634337, 0.4076916, 1, 0, 0, 1, 1,
-1.14415, -0.3459876, -2.508067, 0, 0, 0, 1, 1,
-1.143121, -0.7502494, -2.596767, 0, 0, 0, 1, 1,
-1.142772, 0.2274314, -2.353743, 0, 0, 0, 1, 1,
-1.142177, 1.56702, -1.580708, 0, 0, 0, 1, 1,
-1.142075, 0.6810728, -0.7649701, 0, 0, 0, 1, 1,
-1.131574, -1.725726, -1.496295, 0, 0, 0, 1, 1,
-1.123957, 0.4181243, -1.701013, 0, 0, 0, 1, 1,
-1.120421, 0.4245972, -1.853396, 1, 1, 1, 1, 1,
-1.117643, -0.2519395, -1.542788, 1, 1, 1, 1, 1,
-1.117308, -0.3212013, -3.068376, 1, 1, 1, 1, 1,
-1.10496, -0.8636391, -1.271358, 1, 1, 1, 1, 1,
-1.100502, -1.800121, -4.321751, 1, 1, 1, 1, 1,
-1.099428, 0.5457004, -0.4167329, 1, 1, 1, 1, 1,
-1.09765, -0.2177608, -1.234738, 1, 1, 1, 1, 1,
-1.091074, 0.9004211, -0.5112364, 1, 1, 1, 1, 1,
-1.083738, -0.2301675, -2.088365, 1, 1, 1, 1, 1,
-1.078808, 1.080477, -0.5000243, 1, 1, 1, 1, 1,
-1.078439, 1.537623, -3.499689, 1, 1, 1, 1, 1,
-1.07796, -2.218783, -2.355149, 1, 1, 1, 1, 1,
-1.076128, 2.237733, 0.9429794, 1, 1, 1, 1, 1,
-1.07542, -0.456715, -2.56559, 1, 1, 1, 1, 1,
-1.072146, -0.04296203, -0.5754456, 1, 1, 1, 1, 1,
-1.071751, 1.108293, -0.9815422, 0, 0, 1, 1, 1,
-1.070405, -0.2497527, -1.638726, 1, 0, 0, 1, 1,
-1.066853, -0.6475205, -1.613758, 1, 0, 0, 1, 1,
-1.062374, 1.36598, -0.04095984, 1, 0, 0, 1, 1,
-1.045262, 0.774022, -2.263481, 1, 0, 0, 1, 1,
-1.039156, 0.3208477, -1.194421, 1, 0, 0, 1, 1,
-1.038061, 0.4176811, -0.7348552, 0, 0, 0, 1, 1,
-1.036595, 0.873551, -0.6045898, 0, 0, 0, 1, 1,
-1.035723, 2.005358, 0.4768699, 0, 0, 0, 1, 1,
-1.035534, 1.081253, -0.9138996, 0, 0, 0, 1, 1,
-1.035454, 1.485361, -0.8795007, 0, 0, 0, 1, 1,
-1.033154, 1.032316, -0.9097874, 0, 0, 0, 1, 1,
-1.026816, 0.004836223, -1.340734, 0, 0, 0, 1, 1,
-1.02027, -1.554538, -0.9605936, 1, 1, 1, 1, 1,
-1.006779, 1.541685, -0.8052884, 1, 1, 1, 1, 1,
-0.9993688, -0.2715235, -1.978579, 1, 1, 1, 1, 1,
-0.9944412, -0.8672636, -1.981743, 1, 1, 1, 1, 1,
-0.9900602, -0.02459089, -1.845104, 1, 1, 1, 1, 1,
-0.9877055, -0.09530398, -0.7582278, 1, 1, 1, 1, 1,
-0.9860924, -0.1287912, 0.08392327, 1, 1, 1, 1, 1,
-0.9813936, -0.3655817, -1.726379, 1, 1, 1, 1, 1,
-0.9762063, 0.5984602, -0.3279011, 1, 1, 1, 1, 1,
-0.9724022, -0.4736598, -2.331631, 1, 1, 1, 1, 1,
-0.9714848, 1.06449, 0.4812675, 1, 1, 1, 1, 1,
-0.9695161, -1.766937, -2.395224, 1, 1, 1, 1, 1,
-0.9654284, -0.1427171, -3.63856, 1, 1, 1, 1, 1,
-0.9592238, 1.108912, -0.3352025, 1, 1, 1, 1, 1,
-0.9549385, 1.153411, -1.12682, 1, 1, 1, 1, 1,
-0.9525334, 0.1230476, -3.368384, 0, 0, 1, 1, 1,
-0.9490064, 1.411692, -0.8933356, 1, 0, 0, 1, 1,
-0.944708, 0.01999313, -2.719285, 1, 0, 0, 1, 1,
-0.9429858, 1.635151, 0.0004056743, 1, 0, 0, 1, 1,
-0.9345159, -0.6440818, -1.312189, 1, 0, 0, 1, 1,
-0.9340754, -0.49408, -2.328783, 1, 0, 0, 1, 1,
-0.9296197, -0.6436611, -1.631469, 0, 0, 0, 1, 1,
-0.9244444, 1.532572, -0.284312, 0, 0, 0, 1, 1,
-0.9220875, 0.6032792, -0.09101249, 0, 0, 0, 1, 1,
-0.9205499, 0.9970492, -1.078299, 0, 0, 0, 1, 1,
-0.9190991, -1.936658, -2.748889, 0, 0, 0, 1, 1,
-0.916916, -0.08748853, -1.08958, 0, 0, 0, 1, 1,
-0.9137259, -0.1350607, -2.649755, 0, 0, 0, 1, 1,
-0.9099511, -0.9522079, -1.955615, 1, 1, 1, 1, 1,
-0.9090089, -2.067857, -2.487891, 1, 1, 1, 1, 1,
-0.9070411, 0.9404916, -0.7000453, 1, 1, 1, 1, 1,
-0.9066814, -0.8607498, -2.462039, 1, 1, 1, 1, 1,
-0.9060926, -1.452691, -1.961429, 1, 1, 1, 1, 1,
-0.9019385, 1.369821, -0.8312458, 1, 1, 1, 1, 1,
-0.9006975, -1.115558, -4.968565, 1, 1, 1, 1, 1,
-0.8983945, 0.1151094, 0.3844903, 1, 1, 1, 1, 1,
-0.8983464, -1.212102, -1.812987, 1, 1, 1, 1, 1,
-0.8977847, -0.1943796, -0.08699901, 1, 1, 1, 1, 1,
-0.8975884, 1.479967, -0.5940879, 1, 1, 1, 1, 1,
-0.895874, 0.9815413, -2.038458, 1, 1, 1, 1, 1,
-0.8919432, -1.962803, -1.067935, 1, 1, 1, 1, 1,
-0.8909719, -1.012655, -1.586529, 1, 1, 1, 1, 1,
-0.8903661, 0.9978918, -2.235857, 1, 1, 1, 1, 1,
-0.8877773, 0.1878611, -2.352453, 0, 0, 1, 1, 1,
-0.882051, 0.5826427, -2.362188, 1, 0, 0, 1, 1,
-0.8800528, -0.783265, -0.2455076, 1, 0, 0, 1, 1,
-0.8757215, -0.09611021, -1.853574, 1, 0, 0, 1, 1,
-0.8713294, 0.9050835, -0.6693105, 1, 0, 0, 1, 1,
-0.8635607, -0.2623752, -2.559061, 1, 0, 0, 1, 1,
-0.8570606, 0.1588959, -3.061174, 0, 0, 0, 1, 1,
-0.8538771, 0.2802601, -2.47628, 0, 0, 0, 1, 1,
-0.8497037, 0.7660977, -1.406201, 0, 0, 0, 1, 1,
-0.844685, -0.4188468, -0.4824691, 0, 0, 0, 1, 1,
-0.8367681, -1.242316, -0.7017626, 0, 0, 0, 1, 1,
-0.8322755, 1.619501, -0.6847848, 0, 0, 0, 1, 1,
-0.8285995, 2.293362, -1.668516, 0, 0, 0, 1, 1,
-0.8282949, 0.112088, -3.004403, 1, 1, 1, 1, 1,
-0.8278093, 0.5649521, 0.6268135, 1, 1, 1, 1, 1,
-0.8191414, -0.9745653, -1.256343, 1, 1, 1, 1, 1,
-0.8089468, -1.304838, -3.772163, 1, 1, 1, 1, 1,
-0.8027825, 0.2716428, -2.346061, 1, 1, 1, 1, 1,
-0.787748, -0.1075022, -2.382516, 1, 1, 1, 1, 1,
-0.7796545, -1.238405, -3.494149, 1, 1, 1, 1, 1,
-0.7789103, -1.155656, -4.298133, 1, 1, 1, 1, 1,
-0.77387, -0.1444198, -1.234949, 1, 1, 1, 1, 1,
-0.7725874, 1.815816, 0.4867109, 1, 1, 1, 1, 1,
-0.7717061, -1.423421, -1.816089, 1, 1, 1, 1, 1,
-0.7683069, -1.635107, -3.524717, 1, 1, 1, 1, 1,
-0.767163, -0.7760614, -1.705926, 1, 1, 1, 1, 1,
-0.7649369, -1.465746, -2.937258, 1, 1, 1, 1, 1,
-0.76457, -0.9708875, -0.6902516, 1, 1, 1, 1, 1,
-0.7584182, 1.714099, -0.319555, 0, 0, 1, 1, 1,
-0.7488111, -0.9233885, -2.743133, 1, 0, 0, 1, 1,
-0.7460024, 1.434425, -1.282891, 1, 0, 0, 1, 1,
-0.7420683, 0.3470644, 0.3455406, 1, 0, 0, 1, 1,
-0.7395998, -1.218715, -4.098546, 1, 0, 0, 1, 1,
-0.7381895, 0.1874689, -0.3338405, 1, 0, 0, 1, 1,
-0.7280493, 0.1724486, -3.754231, 0, 0, 0, 1, 1,
-0.7261103, 0.02407913, -1.335974, 0, 0, 0, 1, 1,
-0.7193314, 0.363211, -1.505803, 0, 0, 0, 1, 1,
-0.7188957, -0.7731695, -0.6208495, 0, 0, 0, 1, 1,
-0.7180885, -0.7173461, -2.899413, 0, 0, 0, 1, 1,
-0.7167134, 0.4505708, -0.9261403, 0, 0, 0, 1, 1,
-0.7163301, 0.06696947, -1.052184, 0, 0, 0, 1, 1,
-0.7116189, -0.2221421, -2.137547, 1, 1, 1, 1, 1,
-0.7106385, -0.08438808, -2.273423, 1, 1, 1, 1, 1,
-0.7095359, -0.3895655, -0.0238395, 1, 1, 1, 1, 1,
-0.7056587, -1.201162, -2.598767, 1, 1, 1, 1, 1,
-0.7035605, -1.879265, -2.051536, 1, 1, 1, 1, 1,
-0.6998559, -2.06634, -3.318097, 1, 1, 1, 1, 1,
-0.6994703, -1.421867, -3.129945, 1, 1, 1, 1, 1,
-0.6958352, 0.7199453, -0.9862878, 1, 1, 1, 1, 1,
-0.6951636, 0.9338785, 0.4435619, 1, 1, 1, 1, 1,
-0.6864998, 0.008538974, -1.693338, 1, 1, 1, 1, 1,
-0.6811514, -0.9912357, -2.969495, 1, 1, 1, 1, 1,
-0.6744179, -1.463306, -3.388732, 1, 1, 1, 1, 1,
-0.6722295, 0.2733368, -0.4138565, 1, 1, 1, 1, 1,
-0.6698989, 0.3508012, -1.003202, 1, 1, 1, 1, 1,
-0.666682, -0.6853101, -3.499105, 1, 1, 1, 1, 1,
-0.6649533, -1.053925, -2.396159, 0, 0, 1, 1, 1,
-0.6600433, -0.6192621, -2.412534, 1, 0, 0, 1, 1,
-0.6595687, -2.006252, -1.303037, 1, 0, 0, 1, 1,
-0.6577619, 0.2599269, -1.667876, 1, 0, 0, 1, 1,
-0.6564485, 2.003774, -1.04087, 1, 0, 0, 1, 1,
-0.6459524, -0.3614689, -4.388965, 1, 0, 0, 1, 1,
-0.6419471, -1.591613, -0.2655879, 0, 0, 0, 1, 1,
-0.6406031, -1.093371, -1.89484, 0, 0, 0, 1, 1,
-0.640488, 0.9136752, -0.08703873, 0, 0, 0, 1, 1,
-0.6369452, 1.520053, 0.242071, 0, 0, 0, 1, 1,
-0.636875, 0.47633, -2.052609, 0, 0, 0, 1, 1,
-0.6306587, 0.3143153, -1.479893, 0, 0, 0, 1, 1,
-0.6272354, -1.16251, -2.372401, 0, 0, 0, 1, 1,
-0.6263114, 0.1229318, -0.8063461, 1, 1, 1, 1, 1,
-0.6243188, 0.7297063, -2.103396, 1, 1, 1, 1, 1,
-0.6237572, 1.574788, -0.6490952, 1, 1, 1, 1, 1,
-0.6218597, -0.02080541, -1.363551, 1, 1, 1, 1, 1,
-0.6193833, 2.280393, -0.8818632, 1, 1, 1, 1, 1,
-0.6181483, 0.9535552, -1.767776, 1, 1, 1, 1, 1,
-0.6161789, -0.008398228, -1.410111, 1, 1, 1, 1, 1,
-0.6137494, -0.7176995, -0.4393276, 1, 1, 1, 1, 1,
-0.6095613, -0.9671463, -1.513138, 1, 1, 1, 1, 1,
-0.6094344, 0.01389962, -2.458173, 1, 1, 1, 1, 1,
-0.6065595, 1.554141, -0.2107571, 1, 1, 1, 1, 1,
-0.6059429, 0.9479573, -1.003075, 1, 1, 1, 1, 1,
-0.6059396, 0.4756663, -1.751739, 1, 1, 1, 1, 1,
-0.6045968, -0.3669069, -3.934849, 1, 1, 1, 1, 1,
-0.6036009, 0.4014332, -0.50307, 1, 1, 1, 1, 1,
-0.6009969, 1.14764, 0.7830309, 0, 0, 1, 1, 1,
-0.6001925, -1.384681, -1.767393, 1, 0, 0, 1, 1,
-0.5997467, -2.079619, -3.256083, 1, 0, 0, 1, 1,
-0.598103, -1.163007, -3.05404, 1, 0, 0, 1, 1,
-0.5980384, 0.591356, -1.651036, 1, 0, 0, 1, 1,
-0.5864487, 0.4411797, -0.5446106, 1, 0, 0, 1, 1,
-0.5854656, -1.315108, -1.548044, 0, 0, 0, 1, 1,
-0.5845947, 0.2252681, -2.34194, 0, 0, 0, 1, 1,
-0.5778939, -1.27469, -2.389401, 0, 0, 0, 1, 1,
-0.5762197, -0.7541177, -3.489044, 0, 0, 0, 1, 1,
-0.5760812, 0.4843404, -1.844826, 0, 0, 0, 1, 1,
-0.574168, 0.891284, -1.779364, 0, 0, 0, 1, 1,
-0.5728546, 0.8214527, -1.175214, 0, 0, 0, 1, 1,
-0.571256, -0.5441125, 0.09367212, 1, 1, 1, 1, 1,
-0.5648108, 0.6632989, -1.357675, 1, 1, 1, 1, 1,
-0.5635356, -1.126404, -3.997422, 1, 1, 1, 1, 1,
-0.5617461, 0.3867435, -1.79337, 1, 1, 1, 1, 1,
-0.560939, -0.3471042, -2.952907, 1, 1, 1, 1, 1,
-0.5587596, 0.2178442, -1.600866, 1, 1, 1, 1, 1,
-0.5577204, 1.292774, -0.6004799, 1, 1, 1, 1, 1,
-0.5548928, 1.350338, -0.1509423, 1, 1, 1, 1, 1,
-0.5479409, 0.2097372, -3.030646, 1, 1, 1, 1, 1,
-0.5472723, -2.169184, -1.744755, 1, 1, 1, 1, 1,
-0.5462088, -0.9901871, -3.199652, 1, 1, 1, 1, 1,
-0.5365856, -0.007373003, -2.304766, 1, 1, 1, 1, 1,
-0.5273026, -1.663964, -1.730521, 1, 1, 1, 1, 1,
-0.523841, -0.7828936, -4.005314, 1, 1, 1, 1, 1,
-0.5208591, 0.798355, -0.8327428, 1, 1, 1, 1, 1,
-0.5161662, 1.675557, 1.127761, 0, 0, 1, 1, 1,
-0.5154094, -0.6156167, -1.634236, 1, 0, 0, 1, 1,
-0.5122603, 2.012066, -1.309253, 1, 0, 0, 1, 1,
-0.5058977, -0.09340648, -0.9842784, 1, 0, 0, 1, 1,
-0.5020401, -0.8871528, -2.441288, 1, 0, 0, 1, 1,
-0.4973316, 0.9144683, -1.566469, 1, 0, 0, 1, 1,
-0.4949408, -0.7880361, -3.210505, 0, 0, 0, 1, 1,
-0.4921301, -0.08242462, -0.9023627, 0, 0, 0, 1, 1,
-0.4878559, -0.3986643, -2.933012, 0, 0, 0, 1, 1,
-0.4844922, 1.131939, 0.02402289, 0, 0, 0, 1, 1,
-0.4839715, 1.613061, 0.02741559, 0, 0, 0, 1, 1,
-0.4839046, -1.666608, -1.77554, 0, 0, 0, 1, 1,
-0.4826747, 0.5996153, 0.5931652, 0, 0, 0, 1, 1,
-0.4793596, -0.9695484, -2.222699, 1, 1, 1, 1, 1,
-0.4758567, -0.7379494, -1.585668, 1, 1, 1, 1, 1,
-0.4739653, 1.134009, 1.102948, 1, 1, 1, 1, 1,
-0.4711646, 1.615793, -0.5076416, 1, 1, 1, 1, 1,
-0.464054, -0.1406874, -2.408338, 1, 1, 1, 1, 1,
-0.4610441, 1.123909, 0.09307401, 1, 1, 1, 1, 1,
-0.4577006, 0.6575958, 0.5251971, 1, 1, 1, 1, 1,
-0.4564203, -0.7409353, -2.074837, 1, 1, 1, 1, 1,
-0.4543321, -0.556252, -1.741428, 1, 1, 1, 1, 1,
-0.4534577, -0.2893039, -3.514201, 1, 1, 1, 1, 1,
-0.4506693, -0.3481669, -2.933003, 1, 1, 1, 1, 1,
-0.4494432, 0.5845778, 1.045302, 1, 1, 1, 1, 1,
-0.446416, -0.1382031, -1.674456, 1, 1, 1, 1, 1,
-0.4452915, 1.863943, -1.061219, 1, 1, 1, 1, 1,
-0.4434928, -0.2664466, -2.752713, 1, 1, 1, 1, 1,
-0.4408379, -0.8619177, -2.813245, 0, 0, 1, 1, 1,
-0.4378549, -0.5380359, -2.639342, 1, 0, 0, 1, 1,
-0.4375212, -0.7763844, -1.826994, 1, 0, 0, 1, 1,
-0.430425, -0.7201738, -2.25176, 1, 0, 0, 1, 1,
-0.4278093, -0.87918, -1.943166, 1, 0, 0, 1, 1,
-0.4269759, 0.2539401, 1.718428, 1, 0, 0, 1, 1,
-0.4262129, -0.4884599, -3.345053, 0, 0, 0, 1, 1,
-0.4228874, 0.5929894, -2.204232, 0, 0, 0, 1, 1,
-0.4180038, -1.212142, -2.87268, 0, 0, 0, 1, 1,
-0.4162962, -0.5836836, -1.513965, 0, 0, 0, 1, 1,
-0.4125888, 1.209931, 0.2127341, 0, 0, 0, 1, 1,
-0.4086968, 0.5861552, -0.7836102, 0, 0, 0, 1, 1,
-0.4040717, -0.2648579, -2.609289, 0, 0, 0, 1, 1,
-0.4020748, 0.494969, -2.676945, 1, 1, 1, 1, 1,
-0.401547, -0.1297338, -1.656993, 1, 1, 1, 1, 1,
-0.400406, -1.473647, -3.666358, 1, 1, 1, 1, 1,
-0.3991317, -1.54157, -3.7776, 1, 1, 1, 1, 1,
-0.3950302, -0.6536865, 0.3244235, 1, 1, 1, 1, 1,
-0.3944634, 0.8579733, -0.3950177, 1, 1, 1, 1, 1,
-0.3899345, -0.799027, -0.8068155, 1, 1, 1, 1, 1,
-0.3859992, -0.1999245, 0.7687735, 1, 1, 1, 1, 1,
-0.3847873, 1.311885, -0.0811213, 1, 1, 1, 1, 1,
-0.3834031, -0.1594572, -1.464236, 1, 1, 1, 1, 1,
-0.3825629, 1.433475, 0.3996527, 1, 1, 1, 1, 1,
-0.3818535, 1.845713, -1.23638, 1, 1, 1, 1, 1,
-0.3781294, 0.06665435, -1.407024, 1, 1, 1, 1, 1,
-0.376978, -0.06809553, -2.273504, 1, 1, 1, 1, 1,
-0.375563, 0.08290392, -1.689914, 1, 1, 1, 1, 1,
-0.3754075, -0.7758055, -2.417151, 0, 0, 1, 1, 1,
-0.3667672, 1.058893, -0.8132079, 1, 0, 0, 1, 1,
-0.3576412, -0.6306269, -2.9639, 1, 0, 0, 1, 1,
-0.3562904, -2.954764, -2.005768, 1, 0, 0, 1, 1,
-0.3556, -0.04805308, 0.6473128, 1, 0, 0, 1, 1,
-0.3553891, -0.6358603, -1.018518, 1, 0, 0, 1, 1,
-0.3416859, -0.9840587, -1.009541, 0, 0, 0, 1, 1,
-0.3368053, -0.2540629, -1.574763, 0, 0, 0, 1, 1,
-0.3317738, -0.521153, -1.442369, 0, 0, 0, 1, 1,
-0.3306663, 0.4504986, -0.05299823, 0, 0, 0, 1, 1,
-0.3289049, -0.4739411, -1.576353, 0, 0, 0, 1, 1,
-0.3282596, 1.679349, -0.2288965, 0, 0, 0, 1, 1,
-0.3268026, -1.022618, -1.954434, 0, 0, 0, 1, 1,
-0.3207818, 0.1133588, -2.247496, 1, 1, 1, 1, 1,
-0.3153501, 0.4681283, -0.6536392, 1, 1, 1, 1, 1,
-0.3148105, 0.8908024, 0.6512443, 1, 1, 1, 1, 1,
-0.3147326, 1.376016, 1.005567, 1, 1, 1, 1, 1,
-0.3088498, -1.115211, -3.454872, 1, 1, 1, 1, 1,
-0.3081093, -0.0781003, -2.220316, 1, 1, 1, 1, 1,
-0.3040307, -1.246379, -1.99235, 1, 1, 1, 1, 1,
-0.300242, -1.203098, -1.921038, 1, 1, 1, 1, 1,
-0.2988984, 0.9517635, -2.53505, 1, 1, 1, 1, 1,
-0.2952854, -1.612109, -3.211193, 1, 1, 1, 1, 1,
-0.2934737, -1.936675, -2.877, 1, 1, 1, 1, 1,
-0.292561, 0.5200144, 1.184128, 1, 1, 1, 1, 1,
-0.2821954, -1.148113, -3.283374, 1, 1, 1, 1, 1,
-0.2815627, -2.436239, -3.824616, 1, 1, 1, 1, 1,
-0.2765314, 0.01054005, -2.806249, 1, 1, 1, 1, 1,
-0.2758636, 0.1002503, -0.2915801, 0, 0, 1, 1, 1,
-0.2715395, -0.02076, -3.631131, 1, 0, 0, 1, 1,
-0.2707669, 0.03550604, -2.212158, 1, 0, 0, 1, 1,
-0.2689819, 1.082251, -0.345883, 1, 0, 0, 1, 1,
-0.2676556, 1.900526, -0.8024946, 1, 0, 0, 1, 1,
-0.2668592, -0.366958, -1.772427, 1, 0, 0, 1, 1,
-0.2629854, 1.332412, 0.1810483, 0, 0, 0, 1, 1,
-0.2592959, 1.238585, -0.8064135, 0, 0, 0, 1, 1,
-0.2585373, -0.7773705, -3.684305, 0, 0, 0, 1, 1,
-0.2475624, 0.2374309, -0.6590495, 0, 0, 0, 1, 1,
-0.2473868, -0.3974274, -2.506075, 0, 0, 0, 1, 1,
-0.2447678, 0.6255238, -0.5001375, 0, 0, 0, 1, 1,
-0.2434844, 0.9048494, 0.06007126, 0, 0, 0, 1, 1,
-0.2419131, 0.0435822, -3.728152, 1, 1, 1, 1, 1,
-0.2412581, -0.5473085, -1.887857, 1, 1, 1, 1, 1,
-0.2374213, -1.974859, -4.131637, 1, 1, 1, 1, 1,
-0.2361598, 2.365437, -1.438567, 1, 1, 1, 1, 1,
-0.2352462, 0.00830021, -0.8431998, 1, 1, 1, 1, 1,
-0.2195873, -0.995829, -2.306567, 1, 1, 1, 1, 1,
-0.2177908, 1.435007, 1.34739, 1, 1, 1, 1, 1,
-0.212907, 0.156454, -1.910705, 1, 1, 1, 1, 1,
-0.2083401, 1.190519, -0.9015418, 1, 1, 1, 1, 1,
-0.2032632, 0.4980702, -0.9811277, 1, 1, 1, 1, 1,
-0.2018171, -0.5470434, -3.432168, 1, 1, 1, 1, 1,
-0.2005002, 0.91327, -0.09425008, 1, 1, 1, 1, 1,
-0.196962, -1.437719, -1.611232, 1, 1, 1, 1, 1,
-0.1956739, 1.179525, 0.0722308, 1, 1, 1, 1, 1,
-0.1932385, 0.628853, 1.026558, 1, 1, 1, 1, 1,
-0.191893, 0.1312514, -0.4508159, 0, 0, 1, 1, 1,
-0.1905684, -1.237009, -1.902224, 1, 0, 0, 1, 1,
-0.1882447, -0.9703802, -1.68001, 1, 0, 0, 1, 1,
-0.1869003, 2.045987, -1.616181, 1, 0, 0, 1, 1,
-0.1851745, 0.1998057, -0.8060959, 1, 0, 0, 1, 1,
-0.1794339, -1.419935, -3.28944, 1, 0, 0, 1, 1,
-0.1760278, 1.292622, -1.606178, 0, 0, 0, 1, 1,
-0.1690326, 1.80192, 0.7990115, 0, 0, 0, 1, 1,
-0.1615602, -0.4371585, -1.073443, 0, 0, 0, 1, 1,
-0.1611714, -0.9722023, -3.4732, 0, 0, 0, 1, 1,
-0.1556029, -0.9341137, -4.047602, 0, 0, 0, 1, 1,
-0.1526779, 1.281965, 0.206483, 0, 0, 0, 1, 1,
-0.1525861, 0.8349865, 0.6938056, 0, 0, 0, 1, 1,
-0.1522353, 0.5344127, -0.4674511, 1, 1, 1, 1, 1,
-0.1509071, -0.2589736, -4.205019, 1, 1, 1, 1, 1,
-0.1485863, 1.400733, 1.840263, 1, 1, 1, 1, 1,
-0.1480713, -0.9563534, -3.065482, 1, 1, 1, 1, 1,
-0.1390774, 0.4394778, 0.9113488, 1, 1, 1, 1, 1,
-0.138492, -0.6748262, -1.237528, 1, 1, 1, 1, 1,
-0.1360466, 0.3800742, -0.4160309, 1, 1, 1, 1, 1,
-0.1338142, -1.478765, -3.045892, 1, 1, 1, 1, 1,
-0.1321225, -0.8805587, -3.638127, 1, 1, 1, 1, 1,
-0.1294748, -2.069577, -3.444579, 1, 1, 1, 1, 1,
-0.1245423, -0.336961, -1.802289, 1, 1, 1, 1, 1,
-0.1235586, -0.05331965, -2.633985, 1, 1, 1, 1, 1,
-0.1230255, 0.4177244, -1.431614, 1, 1, 1, 1, 1,
-0.1169792, -0.8002394, -2.382268, 1, 1, 1, 1, 1,
-0.1157735, 0.3779632, -0.4177769, 1, 1, 1, 1, 1,
-0.1153675, 1.110915, 0.05041274, 0, 0, 1, 1, 1,
-0.1136599, -0.2139625, -3.187132, 1, 0, 0, 1, 1,
-0.1111615, 0.7294995, -0.34614, 1, 0, 0, 1, 1,
-0.1110514, 0.9040093, 1.616815, 1, 0, 0, 1, 1,
-0.1098104, 0.9429901, 0.2640152, 1, 0, 0, 1, 1,
-0.109149, -1.269887, -2.858182, 1, 0, 0, 1, 1,
-0.109059, 0.7300792, -0.2696164, 0, 0, 0, 1, 1,
-0.1077003, -0.9755635, -3.089032, 0, 0, 0, 1, 1,
-0.1070544, -0.09863786, -2.645553, 0, 0, 0, 1, 1,
-0.1070262, 1.152071, -0.2904122, 0, 0, 0, 1, 1,
-0.1035024, -1.268023, -3.560865, 0, 0, 0, 1, 1,
-0.08418182, 1.190946, -1.190942, 0, 0, 0, 1, 1,
-0.07569175, -1.056725, -3.260546, 0, 0, 0, 1, 1,
-0.07548353, 0.13553, -1.383844, 1, 1, 1, 1, 1,
-0.07189858, 0.9945477, -0.443673, 1, 1, 1, 1, 1,
-0.06962317, 0.7469819, -1.025986, 1, 1, 1, 1, 1,
-0.06951156, -0.2316903, -3.36932, 1, 1, 1, 1, 1,
-0.06645117, 1.153025, -0.161318, 1, 1, 1, 1, 1,
-0.05769265, -0.1639682, -3.521299, 1, 1, 1, 1, 1,
-0.0535444, 0.7085391, -0.2592723, 1, 1, 1, 1, 1,
-0.05319419, 0.2440925, -0.2067766, 1, 1, 1, 1, 1,
-0.05245605, 0.09725697, -0.7946327, 1, 1, 1, 1, 1,
-0.04256722, 1.955623, 0.5690542, 1, 1, 1, 1, 1,
-0.04220885, 1.884083, 1.028962, 1, 1, 1, 1, 1,
-0.03935984, 0.3305873, 1.169483, 1, 1, 1, 1, 1,
-0.03898488, -0.7828569, -3.179687, 1, 1, 1, 1, 1,
-0.03892368, 1.716416, -0.07940493, 1, 1, 1, 1, 1,
-0.03749344, -0.3052648, -3.393476, 1, 1, 1, 1, 1,
-0.03420626, 1.863117, 1.836304, 0, 0, 1, 1, 1,
-0.03366295, 0.9902067, 0.04010027, 1, 0, 0, 1, 1,
-0.03352387, -0.5024832, -2.570076, 1, 0, 0, 1, 1,
-0.03178195, -1.832129, -3.369042, 1, 0, 0, 1, 1,
-0.03040696, -0.5803363, -2.798424, 1, 0, 0, 1, 1,
-0.03012801, -1.046103, -4.298789, 1, 0, 0, 1, 1,
-0.02433546, 0.5779496, -0.3442474, 0, 0, 0, 1, 1,
-0.01983998, -0.8485223, -1.967164, 0, 0, 0, 1, 1,
-0.01048038, 2.45097, -1.408923, 0, 0, 0, 1, 1,
-0.005360613, 0.1151662, 0.2931106, 0, 0, 0, 1, 1,
-0.005252773, -0.1042756, -3.013535, 0, 0, 0, 1, 1,
-0.005217094, 0.1978805, -1.564159, 0, 0, 0, 1, 1,
-0.005034028, -0.6411652, -2.837394, 0, 0, 0, 1, 1,
0.001931642, 0.434779, -0.1870904, 1, 1, 1, 1, 1,
0.01310026, -0.883104, 4.00321, 1, 1, 1, 1, 1,
0.01556555, 0.9193559, -0.7002442, 1, 1, 1, 1, 1,
0.01728421, 1.158266, 0.254833, 1, 1, 1, 1, 1,
0.02075577, -0.5627093, 2.064554, 1, 1, 1, 1, 1,
0.02262714, -1.67955, 4.787042, 1, 1, 1, 1, 1,
0.02480524, -1.049094, 1.730737, 1, 1, 1, 1, 1,
0.02920845, 3.222984, -2.124062, 1, 1, 1, 1, 1,
0.03158649, 2.986722, -1.240874, 1, 1, 1, 1, 1,
0.03180499, 0.2634871, -0.4607086, 1, 1, 1, 1, 1,
0.03235064, -0.05416542, 2.597613, 1, 1, 1, 1, 1,
0.03341023, -0.1186384, 3.693213, 1, 1, 1, 1, 1,
0.04358813, 0.4780102, 0.9650447, 1, 1, 1, 1, 1,
0.04456655, 0.2131369, 0.9861861, 1, 1, 1, 1, 1,
0.0476739, -0.1904055, 4.192698, 1, 1, 1, 1, 1,
0.04847493, 0.662515, -0.538973, 0, 0, 1, 1, 1,
0.05012488, -0.8311664, 3.775681, 1, 0, 0, 1, 1,
0.05080611, 1.016435, 1.379938, 1, 0, 0, 1, 1,
0.0527768, 2.159704, 0.2074157, 1, 0, 0, 1, 1,
0.05451559, -0.04469196, 3.879577, 1, 0, 0, 1, 1,
0.06241436, -1.154161, 4.162455, 1, 0, 0, 1, 1,
0.0659436, 1.366174, 0.9456701, 0, 0, 0, 1, 1,
0.06814778, -0.2906179, 2.624557, 0, 0, 0, 1, 1,
0.07276277, 0.4454573, 1.94257, 0, 0, 0, 1, 1,
0.07306195, 0.4074501, -0.1683027, 0, 0, 0, 1, 1,
0.07328194, 0.7852468, 1.492014, 0, 0, 0, 1, 1,
0.07458795, 3.024094, 0.3609212, 0, 0, 0, 1, 1,
0.07691917, -1.462603, 2.593902, 0, 0, 0, 1, 1,
0.07724818, 0.4828213, -1.673704, 1, 1, 1, 1, 1,
0.0786793, 0.8057001, -0.6222501, 1, 1, 1, 1, 1,
0.08225819, -1.380716, 3.068944, 1, 1, 1, 1, 1,
0.08496806, 0.9804461, 0.5323308, 1, 1, 1, 1, 1,
0.08546061, 0.5825466, -1.094439, 1, 1, 1, 1, 1,
0.09253969, -0.07226265, 1.420209, 1, 1, 1, 1, 1,
0.09501233, -1.294078, 3.713965, 1, 1, 1, 1, 1,
0.09849667, -0.6356899, 3.497323, 1, 1, 1, 1, 1,
0.102589, -1.418525, 3.0962, 1, 1, 1, 1, 1,
0.1042468, 0.3761344, 0.3836686, 1, 1, 1, 1, 1,
0.1060589, -0.8712723, 4.34371, 1, 1, 1, 1, 1,
0.1068427, 0.9577711, -0.5477294, 1, 1, 1, 1, 1,
0.1118343, 0.1758255, 2.493137, 1, 1, 1, 1, 1,
0.1138719, 1.66589, 0.3618253, 1, 1, 1, 1, 1,
0.1238194, 0.8242933, -0.8039563, 1, 1, 1, 1, 1,
0.1269155, -1.212584, 2.079878, 0, 0, 1, 1, 1,
0.1343101, -0.4197392, 1.648272, 1, 0, 0, 1, 1,
0.1373902, 2.10828, 1.177577, 1, 0, 0, 1, 1,
0.1375426, -1.956992, 4.606623, 1, 0, 0, 1, 1,
0.1379672, 0.4832679, -0.6039013, 1, 0, 0, 1, 1,
0.1417747, -0.3110191, 2.111109, 1, 0, 0, 1, 1,
0.1423609, 1.187751, -2.455625, 0, 0, 0, 1, 1,
0.1486608, -1.229017, 1.656761, 0, 0, 0, 1, 1,
0.150492, -1.133229, 2.741923, 0, 0, 0, 1, 1,
0.1505332, 0.871919, 1.592413, 0, 0, 0, 1, 1,
0.1549783, -0.7181075, 2.548196, 0, 0, 0, 1, 1,
0.1566399, 1.39119, -1.590525, 0, 0, 0, 1, 1,
0.1636108, -0.5275995, 3.037357, 0, 0, 0, 1, 1,
0.1660462, -0.04044951, 2.702346, 1, 1, 1, 1, 1,
0.1675768, -1.659593, 2.962498, 1, 1, 1, 1, 1,
0.1691276, 0.5119568, -1.173011, 1, 1, 1, 1, 1,
0.1725756, 0.1837842, 1.30338, 1, 1, 1, 1, 1,
0.1735757, 0.3758858, 0.3885126, 1, 1, 1, 1, 1,
0.1739479, -1.005206, 3.563798, 1, 1, 1, 1, 1,
0.1756937, 0.9548635, -0.1679546, 1, 1, 1, 1, 1,
0.1758624, -1.082566, 2.860452, 1, 1, 1, 1, 1,
0.1806184, 0.3280336, 0.364777, 1, 1, 1, 1, 1,
0.1810281, -0.3682469, 3.144095, 1, 1, 1, 1, 1,
0.1827928, 0.2945985, 0.3708089, 1, 1, 1, 1, 1,
0.1846396, -0.1719127, 2.701836, 1, 1, 1, 1, 1,
0.1866135, 0.4409607, -1.293828, 1, 1, 1, 1, 1,
0.1872397, 1.548841, -0.05545774, 1, 1, 1, 1, 1,
0.1881189, 0.7978802, 0.4337449, 1, 1, 1, 1, 1,
0.1898243, 0.3239005, 1.739372, 0, 0, 1, 1, 1,
0.1916518, -0.6333558, 3.647417, 1, 0, 0, 1, 1,
0.1924216, -0.1226131, 4.281518, 1, 0, 0, 1, 1,
0.1939035, 1.461621, -0.2321559, 1, 0, 0, 1, 1,
0.1943884, -0.7084387, 2.374903, 1, 0, 0, 1, 1,
0.1954941, 1.035246, 0.6438677, 1, 0, 0, 1, 1,
0.2017982, -1.845243, 2.629896, 0, 0, 0, 1, 1,
0.2055381, -0.6429583, 4.178401, 0, 0, 0, 1, 1,
0.2077085, 0.08963503, -0.5010728, 0, 0, 0, 1, 1,
0.20893, 0.6641898, 0.7139503, 0, 0, 0, 1, 1,
0.2090751, 0.9059718, -0.3340305, 0, 0, 0, 1, 1,
0.2093419, -0.7576371, 2.85866, 0, 0, 0, 1, 1,
0.2115848, 0.7326133, -0.3209807, 0, 0, 0, 1, 1,
0.21162, -0.07889229, 1.300289, 1, 1, 1, 1, 1,
0.2188589, 0.6213713, 1.094471, 1, 1, 1, 1, 1,
0.2218228, 0.2636532, 2.115648, 1, 1, 1, 1, 1,
0.226118, 1.111859, -0.5190938, 1, 1, 1, 1, 1,
0.2283964, 0.9197658, 0.2895316, 1, 1, 1, 1, 1,
0.229641, -0.8748492, 4.951851, 1, 1, 1, 1, 1,
0.2311716, -0.2561786, 3.138184, 1, 1, 1, 1, 1,
0.2313122, -0.365499, 1.065551, 1, 1, 1, 1, 1,
0.2328503, 1.346818, 0.6560465, 1, 1, 1, 1, 1,
0.2334527, -0.3496577, 1.026271, 1, 1, 1, 1, 1,
0.2339638, 1.34048, 0.6986948, 1, 1, 1, 1, 1,
0.2359036, 0.1423235, -0.4032906, 1, 1, 1, 1, 1,
0.2381675, 0.7682147, -0.9889539, 1, 1, 1, 1, 1,
0.2488429, -0.5063435, 2.699111, 1, 1, 1, 1, 1,
0.249007, -0.853781, 1.905425, 1, 1, 1, 1, 1,
0.2490377, 0.7114878, 1.180506, 0, 0, 1, 1, 1,
0.2498188, 0.04639505, -0.2468086, 1, 0, 0, 1, 1,
0.2498353, -2.426338, 1.862309, 1, 0, 0, 1, 1,
0.2520086, 1.654621, 0.4783496, 1, 0, 0, 1, 1,
0.2554681, -0.4086382, 3.121001, 1, 0, 0, 1, 1,
0.2578266, -0.7045876, 3.622954, 1, 0, 0, 1, 1,
0.2613854, 0.9763308, -0.4660021, 0, 0, 0, 1, 1,
0.2638546, -0.1298555, 1.960731, 0, 0, 0, 1, 1,
0.2663072, -1.163414, 2.996943, 0, 0, 0, 1, 1,
0.2707325, -1.278981, 2.108072, 0, 0, 0, 1, 1,
0.2715336, -0.146587, 0.9375059, 0, 0, 0, 1, 1,
0.2744336, 0.1107022, -0.6985142, 0, 0, 0, 1, 1,
0.2752734, 0.9735078, 0.9416081, 0, 0, 0, 1, 1,
0.2771508, -0.04768775, -0.02905153, 1, 1, 1, 1, 1,
0.2817822, -0.4722409, 2.273237, 1, 1, 1, 1, 1,
0.2862926, 0.110617, -0.09312155, 1, 1, 1, 1, 1,
0.2872041, -1.139605, 2.499477, 1, 1, 1, 1, 1,
0.2949238, -2.499804, 3.089871, 1, 1, 1, 1, 1,
0.2958112, -2.338204, 1.785527, 1, 1, 1, 1, 1,
0.2969047, -0.7303161, 3.331254, 1, 1, 1, 1, 1,
0.298372, -1.878506, 3.496801, 1, 1, 1, 1, 1,
0.2993998, 0.5098791, 1.642827, 1, 1, 1, 1, 1,
0.3010046, 1.300375, 0.8732025, 1, 1, 1, 1, 1,
0.3015818, -0.2676221, 0.9926212, 1, 1, 1, 1, 1,
0.3039987, -0.5064989, 4.190574, 1, 1, 1, 1, 1,
0.3066099, 0.4518619, 1.174311, 1, 1, 1, 1, 1,
0.3085532, 0.09341746, 1.929095, 1, 1, 1, 1, 1,
0.3122505, -0.6472274, 3.593765, 1, 1, 1, 1, 1,
0.3143358, -2.088902, 2.009348, 0, 0, 1, 1, 1,
0.3145737, -0.04702686, 2.31804, 1, 0, 0, 1, 1,
0.3164915, -0.02156399, 1.23791, 1, 0, 0, 1, 1,
0.3171859, -0.9433108, 1.694005, 1, 0, 0, 1, 1,
0.3176142, -1.283662, 3.2156, 1, 0, 0, 1, 1,
0.3219743, -0.464844, 2.52048, 1, 0, 0, 1, 1,
0.3293697, 1.285991, -0.2482124, 0, 0, 0, 1, 1,
0.3331776, 1.194808, 1.53195, 0, 0, 0, 1, 1,
0.3341145, 0.273006, -0.08464215, 0, 0, 0, 1, 1,
0.3355424, 0.7989073, 0.2205633, 0, 0, 0, 1, 1,
0.3356307, 1.366703, 1.612612, 0, 0, 0, 1, 1,
0.3381382, -0.5097047, 2.592177, 0, 0, 0, 1, 1,
0.3424574, 0.9111028, -0.09581778, 0, 0, 0, 1, 1,
0.3427227, -0.4195484, 0.4927335, 1, 1, 1, 1, 1,
0.3445357, -1.345616, 3.182329, 1, 1, 1, 1, 1,
0.3462635, -0.2779245, 1.426509, 1, 1, 1, 1, 1,
0.3493223, 0.296139, 1.166432, 1, 1, 1, 1, 1,
0.3524469, -0.4849598, 3.108025, 1, 1, 1, 1, 1,
0.3554807, -0.08556313, 0.5013613, 1, 1, 1, 1, 1,
0.3574257, -0.6170537, 3.418987, 1, 1, 1, 1, 1,
0.3608454, 1.453494, -1.099622, 1, 1, 1, 1, 1,
0.361045, 0.4709678, 0.07776318, 1, 1, 1, 1, 1,
0.3660725, 0.1796949, 1.105199, 1, 1, 1, 1, 1,
0.3674154, 1.031476, 0.8124279, 1, 1, 1, 1, 1,
0.3685548, -2.035935, 1.814602, 1, 1, 1, 1, 1,
0.3785349, 0.3597442, 0.5086614, 1, 1, 1, 1, 1,
0.3800851, -0.6339377, 2.243322, 1, 1, 1, 1, 1,
0.3811246, 1.379517, 0.1246717, 1, 1, 1, 1, 1,
0.3816423, -1.006437, 3.765117, 0, 0, 1, 1, 1,
0.383483, 0.5324964, 1.477858, 1, 0, 0, 1, 1,
0.3886809, 0.2078278, 3.838835, 1, 0, 0, 1, 1,
0.3911148, 1.542547, 1.037442, 1, 0, 0, 1, 1,
0.3916309, -0.2615179, 2.579107, 1, 0, 0, 1, 1,
0.3923107, -0.6719515, 2.424562, 1, 0, 0, 1, 1,
0.3967114, -1.09666, 1.873402, 0, 0, 0, 1, 1,
0.3991509, 1.054601, 2.315786, 0, 0, 0, 1, 1,
0.4032961, 3.302658, 0.3991266, 0, 0, 0, 1, 1,
0.4034471, 0.6239506, 1.661137, 0, 0, 0, 1, 1,
0.4046549, -1.157883, 2.902954, 0, 0, 0, 1, 1,
0.4051384, 0.4329907, 2.118869, 0, 0, 0, 1, 1,
0.4075632, -1.01616, 3.357826, 0, 0, 0, 1, 1,
0.4085437, 0.7814524, 0.0692943, 1, 1, 1, 1, 1,
0.40926, -0.6902199, 1.412843, 1, 1, 1, 1, 1,
0.4159619, -1.597363, 2.817641, 1, 1, 1, 1, 1,
0.4176695, -2.075625, 2.014303, 1, 1, 1, 1, 1,
0.4189284, -0.2647773, 2.230305, 1, 1, 1, 1, 1,
0.4190989, -0.8800945, 2.325666, 1, 1, 1, 1, 1,
0.4249862, -1.176158, 2.844895, 1, 1, 1, 1, 1,
0.4262531, 0.9763058, -0.998261, 1, 1, 1, 1, 1,
0.4265192, 1.412498, 0.1289932, 1, 1, 1, 1, 1,
0.4267312, -1.153415, 0.8220928, 1, 1, 1, 1, 1,
0.4300591, -0.7239919, 4.000863, 1, 1, 1, 1, 1,
0.4328927, -0.04256142, 2.804493, 1, 1, 1, 1, 1,
0.4411378, -0.2397257, 2.492136, 1, 1, 1, 1, 1,
0.443387, 0.8212175, 0.4944745, 1, 1, 1, 1, 1,
0.4465552, 0.635195, 1.507823, 1, 1, 1, 1, 1,
0.4532036, 0.5327835, 0.7485572, 0, 0, 1, 1, 1,
0.4543298, -0.1884108, 1.045371, 1, 0, 0, 1, 1,
0.4568899, -1.348385, 4.42084, 1, 0, 0, 1, 1,
0.4598556, -1.640757, 2.047964, 1, 0, 0, 1, 1,
0.461982, -0.9521952, 4.617894, 1, 0, 0, 1, 1,
0.4621642, -0.6682582, 1.985746, 1, 0, 0, 1, 1,
0.4667374, -0.4499732, 1.676209, 0, 0, 0, 1, 1,
0.4669087, -0.07843763, 0.899656, 0, 0, 0, 1, 1,
0.4796548, 0.7561678, 0.3617008, 0, 0, 0, 1, 1,
0.483938, 1.485851, -1.218808, 0, 0, 0, 1, 1,
0.4881207, 0.6236182, 3.06893, 0, 0, 0, 1, 1,
0.4894932, -0.04585566, 0.08927036, 0, 0, 0, 1, 1,
0.4910358, -1.236917, 1.359851, 0, 0, 0, 1, 1,
0.4913225, -0.3843825, 2.79465, 1, 1, 1, 1, 1,
0.4925344, -0.08705401, 2.153496, 1, 1, 1, 1, 1,
0.4952157, -2.315558, 1.807823, 1, 1, 1, 1, 1,
0.4981244, 0.3810976, 1.356873, 1, 1, 1, 1, 1,
0.5026265, -1.135619, 4.192233, 1, 1, 1, 1, 1,
0.5037557, 0.4968324, -0.05969559, 1, 1, 1, 1, 1,
0.5037914, 0.02902299, 2.065969, 1, 1, 1, 1, 1,
0.5045699, 0.5561896, -0.7818993, 1, 1, 1, 1, 1,
0.5078049, -1.799049, 4.165212, 1, 1, 1, 1, 1,
0.508437, 0.5316367, 0.377402, 1, 1, 1, 1, 1,
0.5118832, -0.6757977, 1.686585, 1, 1, 1, 1, 1,
0.5158942, -1.214644, 1.983332, 1, 1, 1, 1, 1,
0.5162, 1.049938, 0.03211417, 1, 1, 1, 1, 1,
0.5186315, 0.287894, 0.9847109, 1, 1, 1, 1, 1,
0.5195369, 0.6249004, -0.836502, 1, 1, 1, 1, 1,
0.521474, -0.4567046, 3.573951, 0, 0, 1, 1, 1,
0.5215133, -0.240312, 1.480671, 1, 0, 0, 1, 1,
0.5233987, 0.2581376, -0.6728125, 1, 0, 0, 1, 1,
0.5273965, 0.004343387, 2.546074, 1, 0, 0, 1, 1,
0.5294419, 0.1385176, 2.80857, 1, 0, 0, 1, 1,
0.5375946, 0.2775781, -0.344952, 1, 0, 0, 1, 1,
0.5384334, -0.4014522, 2.745285, 0, 0, 0, 1, 1,
0.5409648, -0.2191515, 1.985745, 0, 0, 0, 1, 1,
0.5453396, 0.6303884, -1.513412, 0, 0, 0, 1, 1,
0.5518057, -0.7839275, 2.893632, 0, 0, 0, 1, 1,
0.5541457, 0.7931543, -0.4209385, 0, 0, 0, 1, 1,
0.5594677, -0.2084845, 1.164643, 0, 0, 0, 1, 1,
0.5596576, 0.007450094, 2.318752, 0, 0, 0, 1, 1,
0.5620184, 1.167345, 2.216828, 1, 1, 1, 1, 1,
0.5622103, 0.1727229, 2.225552, 1, 1, 1, 1, 1,
0.566542, -0.5734033, 2.377726, 1, 1, 1, 1, 1,
0.5678258, 0.7863412, 1.459113, 1, 1, 1, 1, 1,
0.5721984, -0.9762667, 2.644777, 1, 1, 1, 1, 1,
0.5724667, -0.175547, 3.638674, 1, 1, 1, 1, 1,
0.5750607, -1.140334, 2.02366, 1, 1, 1, 1, 1,
0.5770862, 0.4768822, 1.934003, 1, 1, 1, 1, 1,
0.5791783, 0.6017827, -0.0846847, 1, 1, 1, 1, 1,
0.5792434, -0.3469851, 0.7404351, 1, 1, 1, 1, 1,
0.5795065, -1.457569, 1.571975, 1, 1, 1, 1, 1,
0.5801783, -0.7852942, 1.434812, 1, 1, 1, 1, 1,
0.5818086, -0.4991515, 3.425576, 1, 1, 1, 1, 1,
0.5858268, -0.9808339, 0.6031459, 1, 1, 1, 1, 1,
0.5861849, 0.6342536, 0.7953287, 1, 1, 1, 1, 1,
0.5903941, -2.677005, 3.652468, 0, 0, 1, 1, 1,
0.5905882, -1.462851, 3.535354, 1, 0, 0, 1, 1,
0.592006, -0.8297178, 2.692871, 1, 0, 0, 1, 1,
0.5926435, 0.04434655, 0.5914196, 1, 0, 0, 1, 1,
0.5962195, 1.069549, 1.104589, 1, 0, 0, 1, 1,
0.5962966, -0.7800481, 1.80076, 1, 0, 0, 1, 1,
0.5964845, 3.216395, 0.5381624, 0, 0, 0, 1, 1,
0.6009052, 0.8653203, -0.4016963, 0, 0, 0, 1, 1,
0.6045088, 0.032719, 3.371406, 0, 0, 0, 1, 1,
0.6068252, 0.01329273, 2.006564, 0, 0, 0, 1, 1,
0.6084027, 0.1054709, -0.4983441, 0, 0, 0, 1, 1,
0.6207528, -0.7388237, 2.218732, 0, 0, 0, 1, 1,
0.6227552, 1.422647, 1.39679, 0, 0, 0, 1, 1,
0.6301376, -2.495691, 2.466522, 1, 1, 1, 1, 1,
0.6347659, 0.5782313, 0.2974423, 1, 1, 1, 1, 1,
0.6376711, -1.146859, 2.068799, 1, 1, 1, 1, 1,
0.650671, -0.8821749, 3.988171, 1, 1, 1, 1, 1,
0.6521692, 0.9215984, 1.591715, 1, 1, 1, 1, 1,
0.6524081, 0.3081546, 0.7958176, 1, 1, 1, 1, 1,
0.6580876, -1.586265, 2.219899, 1, 1, 1, 1, 1,
0.6585954, 0.4284321, -0.4310495, 1, 1, 1, 1, 1,
0.661341, 0.8704565, 1.286512, 1, 1, 1, 1, 1,
0.6704811, -0.8781188, 3.956006, 1, 1, 1, 1, 1,
0.6781294, 0.1420774, 1.856736, 1, 1, 1, 1, 1,
0.6783917, -0.8433709, 2.123979, 1, 1, 1, 1, 1,
0.6787466, -0.8360035, 2.495917, 1, 1, 1, 1, 1,
0.6812169, -0.8080547, 1.973895, 1, 1, 1, 1, 1,
0.6833342, 0.02063488, 2.236, 1, 1, 1, 1, 1,
0.6833433, -0.5451472, 1.45578, 0, 0, 1, 1, 1,
0.6851517, 1.826667, -0.5033854, 1, 0, 0, 1, 1,
0.6886278, 0.4489551, 1.586621, 1, 0, 0, 1, 1,
0.6907451, -0.8267455, 0.3839688, 1, 0, 0, 1, 1,
0.6961584, 0.5058843, -0.2701229, 1, 0, 0, 1, 1,
0.7029048, 0.3076878, 4.212245, 1, 0, 0, 1, 1,
0.70384, -0.01859683, 2.073046, 0, 0, 0, 1, 1,
0.7069146, -0.9619271, 1.852388, 0, 0, 0, 1, 1,
0.7087374, -0.1910246, 1.692658, 0, 0, 0, 1, 1,
0.7091969, 1.381381, -0.5509232, 0, 0, 0, 1, 1,
0.7109942, 1.718037, -1.023902, 0, 0, 0, 1, 1,
0.7160339, 0.5099648, 0.3680464, 0, 0, 0, 1, 1,
0.7211286, 0.8514516, 0.9475279, 0, 0, 0, 1, 1,
0.7216127, -0.01395769, 1.271104, 1, 1, 1, 1, 1,
0.7226131, 1.572584, 0.3705127, 1, 1, 1, 1, 1,
0.7243451, 0.02347686, 0.00022051, 1, 1, 1, 1, 1,
0.7249753, -0.999988, 2.311679, 1, 1, 1, 1, 1,
0.7353423, -0.02624584, 3.358916, 1, 1, 1, 1, 1,
0.7360511, 1.455948, 2.027202, 1, 1, 1, 1, 1,
0.7361453, -0.9241064, 1.99591, 1, 1, 1, 1, 1,
0.7388469, -1.301053, 1.907493, 1, 1, 1, 1, 1,
0.7406573, -0.05311597, 1.282418, 1, 1, 1, 1, 1,
0.7410663, -0.3940084, 1.75854, 1, 1, 1, 1, 1,
0.7427335, -1.130839, 1.707449, 1, 1, 1, 1, 1,
0.7431339, -1.250075, 2.734251, 1, 1, 1, 1, 1,
0.7470464, -0.06567515, 2.778124, 1, 1, 1, 1, 1,
0.7491286, 0.67219, 2.102432, 1, 1, 1, 1, 1,
0.7556791, -1.989097, 2.274139, 1, 1, 1, 1, 1,
0.7556919, -0.2845668, 1.607492, 0, 0, 1, 1, 1,
0.7575383, -0.7745938, 2.790702, 1, 0, 0, 1, 1,
0.7587433, 1.414101, 1.157833, 1, 0, 0, 1, 1,
0.7913318, 0.5711716, 1.271284, 1, 0, 0, 1, 1,
0.7917629, 0.3758273, 1.355051, 1, 0, 0, 1, 1,
0.7918371, 0.5536846, 1.754619, 1, 0, 0, 1, 1,
0.7976539, 1.795654, 0.552373, 0, 0, 0, 1, 1,
0.8008821, 1.05033, 0.5884299, 0, 0, 0, 1, 1,
0.8082556, -0.2925642, 2.94966, 0, 0, 0, 1, 1,
0.8083938, -0.4034064, 4.747879, 0, 0, 0, 1, 1,
0.8099667, -0.5799673, 0.509156, 0, 0, 0, 1, 1,
0.8136156, 0.1953773, 1.634611, 0, 0, 0, 1, 1,
0.8139623, -0.7366034, 2.906778, 0, 0, 0, 1, 1,
0.8246835, 1.624773, 0.9256179, 1, 1, 1, 1, 1,
0.830524, 0.3814927, 0.7282189, 1, 1, 1, 1, 1,
0.8381924, 0.5067081, -0.9767084, 1, 1, 1, 1, 1,
0.8420001, -1.688732, 2.979378, 1, 1, 1, 1, 1,
0.842979, 1.212367, 2.071393, 1, 1, 1, 1, 1,
0.8514298, -1.280912, 2.661651, 1, 1, 1, 1, 1,
0.8587451, 0.6667339, 0.7244561, 1, 1, 1, 1, 1,
0.8619984, -1.687572, 2.716368, 1, 1, 1, 1, 1,
0.864826, -0.6477917, 1.365426, 1, 1, 1, 1, 1,
0.8661097, -0.8620679, 2.465772, 1, 1, 1, 1, 1,
0.8668779, -0.9105904, 0.4974912, 1, 1, 1, 1, 1,
0.8718194, -0.2455719, 1.513741, 1, 1, 1, 1, 1,
0.8746642, -1.598386, 3.007815, 1, 1, 1, 1, 1,
0.8761718, -0.1742073, 2.657318, 1, 1, 1, 1, 1,
0.8783418, -0.9806244, 2.289419, 1, 1, 1, 1, 1,
0.8783778, -1.797696, 2.373915, 0, 0, 1, 1, 1,
0.8849253, 0.8181788, 1.747081, 1, 0, 0, 1, 1,
0.8861099, -1.407742, 3.841834, 1, 0, 0, 1, 1,
0.8907746, 1.283277, -0.461996, 1, 0, 0, 1, 1,
0.8932526, -1.073894, 2.97207, 1, 0, 0, 1, 1,
0.8948987, 0.2570367, 2.220459, 1, 0, 0, 1, 1,
0.8974354, -0.4781736, 1.421966, 0, 0, 0, 1, 1,
0.9031544, -0.1557893, 4.162073, 0, 0, 0, 1, 1,
0.9073834, -1.523786, 3.510344, 0, 0, 0, 1, 1,
0.9143541, -0.08087745, 1.188481, 0, 0, 0, 1, 1,
0.9147317, 0.7965295, -0.07681616, 0, 0, 0, 1, 1,
0.9180975, 0.789663, 0.5041471, 0, 0, 0, 1, 1,
0.9203981, -0.6537641, 3.306748, 0, 0, 0, 1, 1,
0.9283293, 0.3743126, 1.633329, 1, 1, 1, 1, 1,
0.9312078, 0.5201734, 0.6574195, 1, 1, 1, 1, 1,
0.9322371, -0.7356361, 3.099998, 1, 1, 1, 1, 1,
0.9331607, -0.9640704, 0.7371572, 1, 1, 1, 1, 1,
0.9339626, 1.406655, 1.117935, 1, 1, 1, 1, 1,
0.9415104, -0.03702807, 1.633223, 1, 1, 1, 1, 1,
0.9492748, 0.638998, 2.003046, 1, 1, 1, 1, 1,
0.9500425, -0.8395543, 2.489848, 1, 1, 1, 1, 1,
0.9516429, -0.5042882, 2.059018, 1, 1, 1, 1, 1,
0.9684374, 0.4257817, 0.265077, 1, 1, 1, 1, 1,
0.9746358, -1.247392, 2.523716, 1, 1, 1, 1, 1,
0.9758376, 0.8263161, 2.099161, 1, 1, 1, 1, 1,
0.9771431, 0.2749376, -0.7360594, 1, 1, 1, 1, 1,
0.979739, 0.1680064, 1.99964, 1, 1, 1, 1, 1,
0.9869062, 0.8445844, -0.08396523, 1, 1, 1, 1, 1,
0.9872185, -0.5330558, 2.044126, 0, 0, 1, 1, 1,
0.9888074, 1.004109, 1.775065, 1, 0, 0, 1, 1,
0.9937357, 1.039081, 1.259594, 1, 0, 0, 1, 1,
0.9937524, 1.481824, 0.3731008, 1, 0, 0, 1, 1,
0.9971688, 1.467203, 1.176035, 1, 0, 0, 1, 1,
0.9977515, 1.372632, -0.2492507, 1, 0, 0, 1, 1,
0.9982359, -0.002025739, 2.510219, 0, 0, 0, 1, 1,
1.003187, 0.309065, 2.117093, 0, 0, 0, 1, 1,
1.020015, 0.4411317, -0.04441706, 0, 0, 0, 1, 1,
1.022535, -0.0004720234, 1.654891, 0, 0, 0, 1, 1,
1.02502, 0.07456681, 2.510602, 0, 0, 0, 1, 1,
1.026687, -1.732668, 2.221577, 0, 0, 0, 1, 1,
1.027585, 0.002204485, 2.117004, 0, 0, 0, 1, 1,
1.029411, -1.704168, 3.241859, 1, 1, 1, 1, 1,
1.031761, -0.6469087, 2.682591, 1, 1, 1, 1, 1,
1.035281, 1.329894, 0.9087079, 1, 1, 1, 1, 1,
1.039958, -0.1783883, 2.840251, 1, 1, 1, 1, 1,
1.043829, -1.042351, 2.673965, 1, 1, 1, 1, 1,
1.046651, 0.4155413, 1.619766, 1, 1, 1, 1, 1,
1.059126, 0.6175844, 0.7168155, 1, 1, 1, 1, 1,
1.059516, 1.217054, 1.701772, 1, 1, 1, 1, 1,
1.062858, -0.6538698, 1.906601, 1, 1, 1, 1, 1,
1.068677, 1.558928, -0.06789333, 1, 1, 1, 1, 1,
1.070971, 1.024384, 0.6379905, 1, 1, 1, 1, 1,
1.076875, 0.8134272, -0.2708344, 1, 1, 1, 1, 1,
1.089061, -0.5183178, 1.482202, 1, 1, 1, 1, 1,
1.092538, -0.2638907, 1.33118, 1, 1, 1, 1, 1,
1.092749, 0.9125085, 1.469061, 1, 1, 1, 1, 1,
1.09543, -0.2730842, 1.667199, 0, 0, 1, 1, 1,
1.09817, -1.071251, 2.140349, 1, 0, 0, 1, 1,
1.099441, 1.606924, 0.5800164, 1, 0, 0, 1, 1,
1.100089, 0.1871482, 2.383959, 1, 0, 0, 1, 1,
1.104328, 0.1860185, 1.123248, 1, 0, 0, 1, 1,
1.111457, -0.3078046, 1.319437, 1, 0, 0, 1, 1,
1.113173, -1.886937, 1.111537, 0, 0, 0, 1, 1,
1.121755, -1.525851, 3.839155, 0, 0, 0, 1, 1,
1.124323, -0.1117589, 0.3185281, 0, 0, 0, 1, 1,
1.125691, -0.08413465, 1.060103, 0, 0, 0, 1, 1,
1.127465, -0.8799464, 1.629565, 0, 0, 0, 1, 1,
1.128389, 0.4060799, 2.692191, 0, 0, 0, 1, 1,
1.13708, 0.2350403, 3.162506, 0, 0, 0, 1, 1,
1.145222, -0.59594, 2.047513, 1, 1, 1, 1, 1,
1.153387, -1.014018, 1.559683, 1, 1, 1, 1, 1,
1.164347, 0.1765783, -0.2288677, 1, 1, 1, 1, 1,
1.167513, 0.5407224, 0.4610457, 1, 1, 1, 1, 1,
1.179703, 0.9387588, 0.7337044, 1, 1, 1, 1, 1,
1.189948, -0.2434377, 2.506885, 1, 1, 1, 1, 1,
1.202102, -1.345034, 2.11198, 1, 1, 1, 1, 1,
1.205939, -0.08427023, 2.886811, 1, 1, 1, 1, 1,
1.206012, -1.288809, 0.4405871, 1, 1, 1, 1, 1,
1.206903, 0.3592014, -0.712327, 1, 1, 1, 1, 1,
1.211904, 0.105988, 1.6572, 1, 1, 1, 1, 1,
1.221835, 0.5608594, 1.879196, 1, 1, 1, 1, 1,
1.226427, -0.2671614, 2.570057, 1, 1, 1, 1, 1,
1.227972, -0.01264903, -0.1610751, 1, 1, 1, 1, 1,
1.231694, 1.602546, 0.05812562, 1, 1, 1, 1, 1,
1.233181, -0.7703218, 2.465023, 0, 0, 1, 1, 1,
1.244975, 0.5212206, 2.48799, 1, 0, 0, 1, 1,
1.265283, 0.8489755, 1.533156, 1, 0, 0, 1, 1,
1.2689, -0.1597786, 1.631701, 1, 0, 0, 1, 1,
1.274151, 0.9890914, 1.19028, 1, 0, 0, 1, 1,
1.278482, -0.9525034, 0.5946169, 1, 0, 0, 1, 1,
1.296805, 0.1372209, 4.070106, 0, 0, 0, 1, 1,
1.297256, 1.125081, 0.5862113, 0, 0, 0, 1, 1,
1.311351, 0.6557321, 0.4899334, 0, 0, 0, 1, 1,
1.319865, -1.723273, 2.716904, 0, 0, 0, 1, 1,
1.324992, -0.5995578, 1.185542, 0, 0, 0, 1, 1,
1.327006, 1.62854, -0.1502834, 0, 0, 0, 1, 1,
1.33988, 0.7456641, 2.432697, 0, 0, 0, 1, 1,
1.344173, 0.730797, 1.06642, 1, 1, 1, 1, 1,
1.345446, -1.167675, 2.971562, 1, 1, 1, 1, 1,
1.351935, -1.863113, 3.090949, 1, 1, 1, 1, 1,
1.399899, 0.08221788, 2.027524, 1, 1, 1, 1, 1,
1.403729, 0.2990728, -0.1157861, 1, 1, 1, 1, 1,
1.403858, -0.1901674, 1.155162, 1, 1, 1, 1, 1,
1.404516, -1.111824, 3.563227, 1, 1, 1, 1, 1,
1.405057, 0.8057185, 1.364844, 1, 1, 1, 1, 1,
1.407209, 0.5152434, 3.664448, 1, 1, 1, 1, 1,
1.408996, -1.251073, 2.329425, 1, 1, 1, 1, 1,
1.416408, -0.4644319, 1.994162, 1, 1, 1, 1, 1,
1.432317, -0.8983403, 2.742548, 1, 1, 1, 1, 1,
1.451029, -0.6160443, 2.183745, 1, 1, 1, 1, 1,
1.458194, 0.4571125, 1.943379, 1, 1, 1, 1, 1,
1.458828, -0.7707226, 2.502192, 1, 1, 1, 1, 1,
1.469139, 0.4482213, 2.941184, 0, 0, 1, 1, 1,
1.476885, -0.3583252, 2.793334, 1, 0, 0, 1, 1,
1.478036, -0.03678273, 2.86314, 1, 0, 0, 1, 1,
1.494825, 0.1165929, 1.944841, 1, 0, 0, 1, 1,
1.497351, 0.9255112, 1.488669, 1, 0, 0, 1, 1,
1.503093, 0.670513, 0.8101702, 1, 0, 0, 1, 1,
1.510373, 0.4727173, -0.4191472, 0, 0, 0, 1, 1,
1.526043, 0.06219251, 0.578886, 0, 0, 0, 1, 1,
1.529929, -0.5013568, 1.094002, 0, 0, 0, 1, 1,
1.53947, 0.944289, 1.366239, 0, 0, 0, 1, 1,
1.548762, -0.2222289, 1.470898, 0, 0, 0, 1, 1,
1.556021, 1.226782, 2.360316, 0, 0, 0, 1, 1,
1.558296, -0.8542747, 2.366742, 0, 0, 0, 1, 1,
1.597699, -0.890983, 3.778594, 1, 1, 1, 1, 1,
1.600075, -1.980605, 2.476326, 1, 1, 1, 1, 1,
1.610606, 2.101737, 1.302108, 1, 1, 1, 1, 1,
1.629037, 0.5381439, 1.890265, 1, 1, 1, 1, 1,
1.652734, 0.5957662, 4.214805, 1, 1, 1, 1, 1,
1.658871, -1.472271, 1.981291, 1, 1, 1, 1, 1,
1.662817, 0.5095089, 0.5618168, 1, 1, 1, 1, 1,
1.663956, 1.356964, 0.7537841, 1, 1, 1, 1, 1,
1.679123, -0.255977, 1.427154, 1, 1, 1, 1, 1,
1.690187, 0.3446373, 0.9892484, 1, 1, 1, 1, 1,
1.690301, 0.2210049, 2.054672, 1, 1, 1, 1, 1,
1.690796, 0.6830183, 1.921459, 1, 1, 1, 1, 1,
1.695131, -1.32396, 3.793972, 1, 1, 1, 1, 1,
1.696637, 1.183653, 0.9360247, 1, 1, 1, 1, 1,
1.698491, 1.130629, -0.3525583, 1, 1, 1, 1, 1,
1.73111, 0.8535529, 1.816395, 0, 0, 1, 1, 1,
1.748062, -0.8451, 1.896823, 1, 0, 0, 1, 1,
1.774193, -0.8920683, 2.759591, 1, 0, 0, 1, 1,
1.784348, 0.0001374397, 1.985525, 1, 0, 0, 1, 1,
1.786268, -0.9036096, 3.802164, 1, 0, 0, 1, 1,
1.803432, -0.4536222, 1.55976, 1, 0, 0, 1, 1,
1.806377, 0.4076162, 0.2553129, 0, 0, 0, 1, 1,
1.806609, 0.4408052, 1.931397, 0, 0, 0, 1, 1,
1.80755, 0.03900521, 0.967416, 0, 0, 0, 1, 1,
1.815151, 1.49716, -0.3279175, 0, 0, 0, 1, 1,
1.867147, -0.3058633, 0.3506041, 0, 0, 0, 1, 1,
1.871006, -0.2571697, 1.535299, 0, 0, 0, 1, 1,
1.880423, -0.2240523, -0.5764184, 0, 0, 0, 1, 1,
1.892728, -0.04124226, 1.966899, 1, 1, 1, 1, 1,
1.915762, 0.05533956, 1.40047, 1, 1, 1, 1, 1,
1.939373, 0.04484954, 0.2886887, 1, 1, 1, 1, 1,
1.955104, -0.8822226, 1.528721, 1, 1, 1, 1, 1,
2.000209, 0.5161526, 2.835169, 1, 1, 1, 1, 1,
2.011734, 0.8417897, 0.5778804, 1, 1, 1, 1, 1,
2.01317, -0.02630196, 2.638052, 1, 1, 1, 1, 1,
2.023958, 0.2171447, 0.939383, 1, 1, 1, 1, 1,
2.030719, -0.8152571, 1.911379, 1, 1, 1, 1, 1,
2.033654, -1.771177, 2.136197, 1, 1, 1, 1, 1,
2.040341, 0.2531132, 2.016437, 1, 1, 1, 1, 1,
2.052464, 0.1827245, 1.389396, 1, 1, 1, 1, 1,
2.063358, 1.583577, 0.7857484, 1, 1, 1, 1, 1,
2.090647, 0.1513247, -0.008287414, 1, 1, 1, 1, 1,
2.120964, -2.435243, 1.999045, 1, 1, 1, 1, 1,
2.141094, -1.222749, 4.005695, 0, 0, 1, 1, 1,
2.144792, -1.203539, 0.5919362, 1, 0, 0, 1, 1,
2.167275, 1.019846, 0.7913712, 1, 0, 0, 1, 1,
2.193289, 0.5388901, 1.677378, 1, 0, 0, 1, 1,
2.197096, 0.3374565, 2.044151, 1, 0, 0, 1, 1,
2.21558, -1.314947, 1.568616, 1, 0, 0, 1, 1,
2.233251, -0.9148356, 1.962249, 0, 0, 0, 1, 1,
2.271652, -0.2078821, 0.9178628, 0, 0, 0, 1, 1,
2.284012, -0.3782477, 1.290035, 0, 0, 0, 1, 1,
2.287321, 0.9532415, -0.004226412, 0, 0, 0, 1, 1,
2.310256, -0.3725896, 1.455853, 0, 0, 0, 1, 1,
2.37349, 0.7436806, 1.14325, 0, 0, 0, 1, 1,
2.405446, -0.09749608, 1.923059, 0, 0, 0, 1, 1,
2.407049, 0.3757892, -0.2117928, 1, 1, 1, 1, 1,
2.411777, -0.480926, 1.664675, 1, 1, 1, 1, 1,
2.437217, 1.557437, 1.937486, 1, 1, 1, 1, 1,
2.577583, -2.335854, 2.122791, 1, 1, 1, 1, 1,
2.608281, -0.1665227, 2.015941, 1, 1, 1, 1, 1,
2.645766, 1.511569, 3.24837, 1, 1, 1, 1, 1,
3.257918, 1.330879, 0.5898724, 1, 1, 1, 1, 1
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
var radius = 9.12903;
var distance = 32.06533;
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
mvMatrix.translate( -0.2199695, -0.1739469, 0.00835681 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.06533);
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
