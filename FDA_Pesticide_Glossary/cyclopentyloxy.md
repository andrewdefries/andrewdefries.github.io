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
-2.917648, -0.9389879, -0.1711256, 1, 0, 0, 1,
-2.864859, -0.04277097, -0.2910202, 1, 0.007843138, 0, 1,
-2.802627, 0.4384364, -1.625467, 1, 0.01176471, 0, 1,
-2.80241, -0.1574252, -1.27039, 1, 0.01960784, 0, 1,
-2.746895, 0.7738175, -2.872435, 1, 0.02352941, 0, 1,
-2.715316, -0.1319008, -1.313919, 1, 0.03137255, 0, 1,
-2.694141, 0.2301625, -3.488348, 1, 0.03529412, 0, 1,
-2.690564, -0.4169626, -2.686228, 1, 0.04313726, 0, 1,
-2.66927, -0.8688511, -1.85312, 1, 0.04705882, 0, 1,
-2.647766, 0.6342791, -0.3733552, 1, 0.05490196, 0, 1,
-2.646554, -0.1712085, -2.256436, 1, 0.05882353, 0, 1,
-2.585479, -0.1211434, -1.029614, 1, 0.06666667, 0, 1,
-2.471716, 0.4342008, -3.744823, 1, 0.07058824, 0, 1,
-2.422469, 0.3207909, -1.273887, 1, 0.07843138, 0, 1,
-2.407882, 0.4668603, -0.9695015, 1, 0.08235294, 0, 1,
-2.391505, -0.0883287, -0.8988981, 1, 0.09019608, 0, 1,
-2.314063, 0.1815771, -0.8424824, 1, 0.09411765, 0, 1,
-2.262932, 1.473847, -1.557067, 1, 0.1019608, 0, 1,
-2.241477, -0.3830693, -0.9453702, 1, 0.1098039, 0, 1,
-2.236576, -0.05904918, -0.4535618, 1, 0.1137255, 0, 1,
-2.234806, -0.8947339, -2.35276, 1, 0.1215686, 0, 1,
-2.213876, -0.2225808, -1.903306, 1, 0.1254902, 0, 1,
-2.195849, -0.9489654, -2.271715, 1, 0.1333333, 0, 1,
-2.184029, -0.8063741, -1.547025, 1, 0.1372549, 0, 1,
-2.163279, 0.8387024, -2.351498, 1, 0.145098, 0, 1,
-2.113457, 0.2002958, -2.121741, 1, 0.1490196, 0, 1,
-2.105195, 1.418059, -0.7901711, 1, 0.1568628, 0, 1,
-2.101537, -2.766521, -1.844127, 1, 0.1607843, 0, 1,
-2.071618, -1.848766, -3.294286, 1, 0.1686275, 0, 1,
-2.066779, -0.4071259, -0.8323996, 1, 0.172549, 0, 1,
-2.030203, 0.2913097, -2.166282, 1, 0.1803922, 0, 1,
-1.987764, -2.367414, -2.359955, 1, 0.1843137, 0, 1,
-1.979548, -0.9353163, -2.554287, 1, 0.1921569, 0, 1,
-1.949181, 1.011605, -0.7543506, 1, 0.1960784, 0, 1,
-1.928219, -1.671565, -3.46095, 1, 0.2039216, 0, 1,
-1.906569, -0.7152354, -3.697012, 1, 0.2117647, 0, 1,
-1.8922, 0.5326312, -1.291662, 1, 0.2156863, 0, 1,
-1.871945, 0.813702, -2.08242, 1, 0.2235294, 0, 1,
-1.827996, -0.8228848, -2.579731, 1, 0.227451, 0, 1,
-1.823647, 1.132146, -1.629283, 1, 0.2352941, 0, 1,
-1.822379, -0.8017992, -2.780726, 1, 0.2392157, 0, 1,
-1.813174, -0.5479484, -0.5126272, 1, 0.2470588, 0, 1,
-1.813038, 1.040924, -1.82502, 1, 0.2509804, 0, 1,
-1.795953, -1.510945, -2.711513, 1, 0.2588235, 0, 1,
-1.764632, 1.162182, -0.2329848, 1, 0.2627451, 0, 1,
-1.749363, -0.6767655, -1.146248, 1, 0.2705882, 0, 1,
-1.747085, -1.067415, -2.111918, 1, 0.2745098, 0, 1,
-1.70955, -0.4515539, -3.281348, 1, 0.282353, 0, 1,
-1.702691, 0.7370731, -2.754653, 1, 0.2862745, 0, 1,
-1.701939, 0.3866654, -0.5524449, 1, 0.2941177, 0, 1,
-1.690561, -0.1110112, -0.2161214, 1, 0.3019608, 0, 1,
-1.680637, 1.297732, -0.5297804, 1, 0.3058824, 0, 1,
-1.675319, 0.01911888, -2.067113, 1, 0.3137255, 0, 1,
-1.649237, 1.023703, -1.463519, 1, 0.3176471, 0, 1,
-1.647588, -1.731172, -3.011212, 1, 0.3254902, 0, 1,
-1.639948, -0.9257255, -2.510516, 1, 0.3294118, 0, 1,
-1.628503, 1.108302, 0.04442409, 1, 0.3372549, 0, 1,
-1.616194, -0.465956, -2.413349, 1, 0.3411765, 0, 1,
-1.615859, 1.787416, 0.9784045, 1, 0.3490196, 0, 1,
-1.607254, 1.892247, -0.5622318, 1, 0.3529412, 0, 1,
-1.60323, -0.9486008, -1.69836, 1, 0.3607843, 0, 1,
-1.591428, 1.07093, -0.115386, 1, 0.3647059, 0, 1,
-1.575788, 0.1545233, -0.493791, 1, 0.372549, 0, 1,
-1.573833, -0.04345722, -0.1754918, 1, 0.3764706, 0, 1,
-1.564197, -0.4106745, -1.104439, 1, 0.3843137, 0, 1,
-1.563759, 1.692032, 0.9641528, 1, 0.3882353, 0, 1,
-1.547132, -0.7908578, -1.651018, 1, 0.3960784, 0, 1,
-1.54404, -0.3588098, -1.998158, 1, 0.4039216, 0, 1,
-1.531758, 1.018365, 1.093325, 1, 0.4078431, 0, 1,
-1.521504, -0.1622422, -2.678668, 1, 0.4156863, 0, 1,
-1.518687, -0.4787351, -2.191385, 1, 0.4196078, 0, 1,
-1.510428, 0.5163912, -1.27481, 1, 0.427451, 0, 1,
-1.497755, 0.4763162, -2.743893, 1, 0.4313726, 0, 1,
-1.496501, -0.9875038, -3.671744, 1, 0.4392157, 0, 1,
-1.495196, -1.558506, -2.263689, 1, 0.4431373, 0, 1,
-1.485312, -0.4371772, -3.401488, 1, 0.4509804, 0, 1,
-1.485236, -2.504744, -3.02989, 1, 0.454902, 0, 1,
-1.483053, -0.617993, -0.4585484, 1, 0.4627451, 0, 1,
-1.472028, 1.565864, 1.023596, 1, 0.4666667, 0, 1,
-1.4685, 0.1122668, -1.355794, 1, 0.4745098, 0, 1,
-1.465403, -0.1123288, -2.167724, 1, 0.4784314, 0, 1,
-1.465147, -0.5460116, -0.09516458, 1, 0.4862745, 0, 1,
-1.456206, 0.5011201, -3.862267, 1, 0.4901961, 0, 1,
-1.434906, -1.19781, -1.469724, 1, 0.4980392, 0, 1,
-1.40341, 0.8289415, -1.329651, 1, 0.5058824, 0, 1,
-1.39025, 1.230843, -0.6999038, 1, 0.509804, 0, 1,
-1.382856, -1.472461, -2.364629, 1, 0.5176471, 0, 1,
-1.37918, 0.4165235, -1.364674, 1, 0.5215687, 0, 1,
-1.37279, 1.124609, -1.096097, 1, 0.5294118, 0, 1,
-1.369056, -1.387458, -1.817538, 1, 0.5333334, 0, 1,
-1.36267, -1.044893, -2.302486, 1, 0.5411765, 0, 1,
-1.359626, 0.6170558, 0.1448819, 1, 0.5450981, 0, 1,
-1.354521, -0.6793686, -1.874943, 1, 0.5529412, 0, 1,
-1.34087, 0.7917273, -1.984244, 1, 0.5568628, 0, 1,
-1.338622, 0.1926654, -1.900228, 1, 0.5647059, 0, 1,
-1.333705, -0.6722339, -2.161175, 1, 0.5686275, 0, 1,
-1.330874, -0.06534099, -3.500955, 1, 0.5764706, 0, 1,
-1.329454, -0.8589724, -3.284029, 1, 0.5803922, 0, 1,
-1.329229, -0.3406644, -0.0005129861, 1, 0.5882353, 0, 1,
-1.327841, -0.1433721, -2.593263, 1, 0.5921569, 0, 1,
-1.316748, 1.120254, -1.549296, 1, 0.6, 0, 1,
-1.310806, -2.043791, -3.320835, 1, 0.6078432, 0, 1,
-1.280607, -0.5464824, -2.98975, 1, 0.6117647, 0, 1,
-1.28023, -1.431496, -2.940776, 1, 0.6196079, 0, 1,
-1.278995, -0.9849716, -1.473885, 1, 0.6235294, 0, 1,
-1.277343, 0.5786124, -0.11766, 1, 0.6313726, 0, 1,
-1.272962, 0.2925853, -1.390422, 1, 0.6352941, 0, 1,
-1.272263, -1.038537, -2.347346, 1, 0.6431373, 0, 1,
-1.26899, 0.0008840984, -1.384366, 1, 0.6470588, 0, 1,
-1.268762, 0.6587921, -0.991589, 1, 0.654902, 0, 1,
-1.265122, 1.003599, -1.22386, 1, 0.6588235, 0, 1,
-1.264267, -0.5534571, -0.8425899, 1, 0.6666667, 0, 1,
-1.260753, 0.04708029, -0.8333294, 1, 0.6705883, 0, 1,
-1.246665, -1.211104, -2.405632, 1, 0.6784314, 0, 1,
-1.2418, -0.7671838, -1.159816, 1, 0.682353, 0, 1,
-1.218829, 0.8266363, -1.773622, 1, 0.6901961, 0, 1,
-1.215474, 0.6339324, -0.04205137, 1, 0.6941177, 0, 1,
-1.214718, -0.1268621, -1.869371, 1, 0.7019608, 0, 1,
-1.20729, 1.514472, -0.5025313, 1, 0.7098039, 0, 1,
-1.206317, -0.9239683, -1.563085, 1, 0.7137255, 0, 1,
-1.202408, -0.6232653, -2.609264, 1, 0.7215686, 0, 1,
-1.200652, -0.01487306, -0.5262721, 1, 0.7254902, 0, 1,
-1.194499, 0.1334591, -0.4229496, 1, 0.7333333, 0, 1,
-1.192847, 1.986605, 0.7626126, 1, 0.7372549, 0, 1,
-1.188494, 0.01669428, -2.263642, 1, 0.7450981, 0, 1,
-1.180647, 0.6541608, -0.05241986, 1, 0.7490196, 0, 1,
-1.180053, 1.128993, -1.196726, 1, 0.7568628, 0, 1,
-1.174657, 1.379224, -0.5903335, 1, 0.7607843, 0, 1,
-1.164744, -1.208765, -2.673336, 1, 0.7686275, 0, 1,
-1.164731, 0.5518326, -3.45765, 1, 0.772549, 0, 1,
-1.159632, 0.9180503, -1.897437, 1, 0.7803922, 0, 1,
-1.15951, -1.396093, -2.238729, 1, 0.7843137, 0, 1,
-1.158767, -0.7794411, -0.808722, 1, 0.7921569, 0, 1,
-1.154545, 1.1127, -0.9707068, 1, 0.7960784, 0, 1,
-1.153038, 0.6856233, -1.388067, 1, 0.8039216, 0, 1,
-1.152964, 1.810777, 0.5077375, 1, 0.8117647, 0, 1,
-1.148035, 1.020025, -0.6838487, 1, 0.8156863, 0, 1,
-1.143389, 1.459969, 0.01103628, 1, 0.8235294, 0, 1,
-1.131669, -0.5916303, -0.8321112, 1, 0.827451, 0, 1,
-1.126678, -0.4797547, -2.333153, 1, 0.8352941, 0, 1,
-1.124524, -0.9598232, -2.686258, 1, 0.8392157, 0, 1,
-1.123401, -0.1691313, -1.115513, 1, 0.8470588, 0, 1,
-1.12002, -0.5942159, -0.6229196, 1, 0.8509804, 0, 1,
-1.11798, -0.4332822, -2.41841, 1, 0.8588235, 0, 1,
-1.117382, -0.7248, -3.301212, 1, 0.8627451, 0, 1,
-1.11283, 2.646862, -0.2186411, 1, 0.8705882, 0, 1,
-1.110095, -0.3815094, -0.2706982, 1, 0.8745098, 0, 1,
-1.096641, 0.2087648, 0.5904244, 1, 0.8823529, 0, 1,
-1.096147, -1.708301, -3.56174, 1, 0.8862745, 0, 1,
-1.087857, -2.175077, -1.658798, 1, 0.8941177, 0, 1,
-1.079781, -1.21729, -0.9974147, 1, 0.8980392, 0, 1,
-1.0772, -0.1800786, -1.47886, 1, 0.9058824, 0, 1,
-1.075714, -0.2856159, -1.451033, 1, 0.9137255, 0, 1,
-1.054433, -0.142338, -0.8488619, 1, 0.9176471, 0, 1,
-1.052769, -1.285575, -1.649958, 1, 0.9254902, 0, 1,
-1.045187, -0.7441764, -1.535355, 1, 0.9294118, 0, 1,
-1.044884, -1.104615, -0.7647007, 1, 0.9372549, 0, 1,
-1.041319, 0.1228096, -1.600789, 1, 0.9411765, 0, 1,
-1.038835, 2.269013, -0.1586874, 1, 0.9490196, 0, 1,
-1.032233, 0.1533956, -0.7957367, 1, 0.9529412, 0, 1,
-1.030583, 0.9419193, -1.133566, 1, 0.9607843, 0, 1,
-1.016349, -1.238863, -2.662215, 1, 0.9647059, 0, 1,
-1.016299, 1.06579, 0.2224267, 1, 0.972549, 0, 1,
-1.005691, -0.2694132, -2.877227, 1, 0.9764706, 0, 1,
-1.005306, 0.6318058, -0.2813264, 1, 0.9843137, 0, 1,
-1.00332, 0.04731165, -1.538758, 1, 0.9882353, 0, 1,
-1.001844, 0.6791961, -0.8112611, 1, 0.9960784, 0, 1,
-0.9986844, 0.07383417, -0.353231, 0.9960784, 1, 0, 1,
-0.9761418, 1.047846, 0.7512221, 0.9921569, 1, 0, 1,
-0.97594, -0.3560398, -2.02027, 0.9843137, 1, 0, 1,
-0.9730563, -0.1539261, -1.116379, 0.9803922, 1, 0, 1,
-0.9699759, -1.817919, -2.343019, 0.972549, 1, 0, 1,
-0.9690064, 1.30557, -1.209789, 0.9686275, 1, 0, 1,
-0.9687999, -0.3884346, -1.544339, 0.9607843, 1, 0, 1,
-0.9667884, 0.5723316, -0.457911, 0.9568627, 1, 0, 1,
-0.9651197, 1.021294, -0.9450681, 0.9490196, 1, 0, 1,
-0.9554837, 0.2530542, -3.21591, 0.945098, 1, 0, 1,
-0.9551135, -1.067351, -3.002006, 0.9372549, 1, 0, 1,
-0.9547861, 1.119373, -1.674745, 0.9333333, 1, 0, 1,
-0.9499522, -0.4497382, -0.9618208, 0.9254902, 1, 0, 1,
-0.9489931, -0.9466729, -3.604323, 0.9215686, 1, 0, 1,
-0.9434913, 0.2087654, -0.9335881, 0.9137255, 1, 0, 1,
-0.9419913, 0.5603568, -0.8103139, 0.9098039, 1, 0, 1,
-0.9315777, 0.2891518, -1.373332, 0.9019608, 1, 0, 1,
-0.9293728, -0.4598349, -2.387173, 0.8941177, 1, 0, 1,
-0.9243805, 0.7927575, -0.2838793, 0.8901961, 1, 0, 1,
-0.9231352, 0.2947907, 0.1527815, 0.8823529, 1, 0, 1,
-0.91856, 0.09152871, -1.300497, 0.8784314, 1, 0, 1,
-0.9128398, 1.724604, 0.1357071, 0.8705882, 1, 0, 1,
-0.9088917, 0.9465373, -0.3076462, 0.8666667, 1, 0, 1,
-0.904423, -0.1801476, -1.499491, 0.8588235, 1, 0, 1,
-0.9011338, -1.564228, -2.996748, 0.854902, 1, 0, 1,
-0.899672, -0.08703747, -3.269623, 0.8470588, 1, 0, 1,
-0.8985963, 0.7806347, -1.613461, 0.8431373, 1, 0, 1,
-0.8926091, 0.9383869, 0.7391562, 0.8352941, 1, 0, 1,
-0.8909996, -0.7258443, -2.571404, 0.8313726, 1, 0, 1,
-0.8871019, -0.9169289, -1.711512, 0.8235294, 1, 0, 1,
-0.8867924, -1.096414, -2.070943, 0.8196079, 1, 0, 1,
-0.8811359, -0.6964473, -4.281878, 0.8117647, 1, 0, 1,
-0.8754663, 0.05894678, -2.34315, 0.8078431, 1, 0, 1,
-0.8726484, -0.52011, -1.804591, 0.8, 1, 0, 1,
-0.8704748, -0.8223546, -1.938882, 0.7921569, 1, 0, 1,
-0.8598115, 0.2712868, -0.642498, 0.7882353, 1, 0, 1,
-0.8568574, -0.2414378, -2.372847, 0.7803922, 1, 0, 1,
-0.8565115, 0.8315452, -0.9926426, 0.7764706, 1, 0, 1,
-0.8525059, 0.8904831, -1.685671, 0.7686275, 1, 0, 1,
-0.8442959, 1.152914, 0.5570924, 0.7647059, 1, 0, 1,
-0.8433784, -1.173294, -1.687683, 0.7568628, 1, 0, 1,
-0.8422316, 0.466828, -0.8317975, 0.7529412, 1, 0, 1,
-0.8314984, -0.8229328, -3.972266, 0.7450981, 1, 0, 1,
-0.8298322, -0.08845508, -1.182121, 0.7411765, 1, 0, 1,
-0.8238626, 0.6229076, 0.05358217, 0.7333333, 1, 0, 1,
-0.8128789, 0.6262263, 0.526283, 0.7294118, 1, 0, 1,
-0.8073254, -0.2104789, -2.434249, 0.7215686, 1, 0, 1,
-0.8052861, -0.2378759, -0.8075111, 0.7176471, 1, 0, 1,
-0.8052654, 0.04294324, -0.1802885, 0.7098039, 1, 0, 1,
-0.7992498, 1.491997, -0.9209152, 0.7058824, 1, 0, 1,
-0.7975987, 0.8519087, -0.2246011, 0.6980392, 1, 0, 1,
-0.7900003, 0.4208301, -4.142077, 0.6901961, 1, 0, 1,
-0.7899552, 0.5190888, -0.9061329, 0.6862745, 1, 0, 1,
-0.7883322, -0.8241441, -1.234069, 0.6784314, 1, 0, 1,
-0.7878589, 0.03510259, -1.321057, 0.6745098, 1, 0, 1,
-0.7877231, -0.01560513, -1.384875, 0.6666667, 1, 0, 1,
-0.7843213, -0.513687, -2.499614, 0.6627451, 1, 0, 1,
-0.7833058, 0.3465176, -1.585181, 0.654902, 1, 0, 1,
-0.7609273, -0.4946294, -3.567348, 0.6509804, 1, 0, 1,
-0.7549113, -1.097801, -2.559819, 0.6431373, 1, 0, 1,
-0.7544671, -0.4253117, -2.218346, 0.6392157, 1, 0, 1,
-0.7333297, 0.5567093, -0.6873996, 0.6313726, 1, 0, 1,
-0.7298173, 1.625298, 0.4592981, 0.627451, 1, 0, 1,
-0.7288117, 1.018407, -2.191278, 0.6196079, 1, 0, 1,
-0.7285931, 0.3948683, -0.6091292, 0.6156863, 1, 0, 1,
-0.7284401, -0.7861043, -2.056853, 0.6078432, 1, 0, 1,
-0.7253828, 0.1174747, -0.8994081, 0.6039216, 1, 0, 1,
-0.7210597, -0.4310749, -2.293682, 0.5960785, 1, 0, 1,
-0.7206946, -0.3524995, -2.54174, 0.5882353, 1, 0, 1,
-0.719001, -0.4576064, -2.382082, 0.5843138, 1, 0, 1,
-0.7183279, 0.5424086, -1.101865, 0.5764706, 1, 0, 1,
-0.7118984, -0.31484, -3.080342, 0.572549, 1, 0, 1,
-0.7117776, -0.5725906, -1.392442, 0.5647059, 1, 0, 1,
-0.7092992, 0.07850956, -2.99403, 0.5607843, 1, 0, 1,
-0.7092389, -0.9634126, -0.914364, 0.5529412, 1, 0, 1,
-0.704345, -0.6243939, -1.040623, 0.5490196, 1, 0, 1,
-0.6969903, 0.2045687, -0.7744877, 0.5411765, 1, 0, 1,
-0.6943432, -1.170835, -3.587075, 0.5372549, 1, 0, 1,
-0.6877009, -1.741563, -0.7706437, 0.5294118, 1, 0, 1,
-0.6860155, 0.3231084, -0.599108, 0.5254902, 1, 0, 1,
-0.6859533, 0.4720529, -2.126409, 0.5176471, 1, 0, 1,
-0.6843649, 0.5583928, -0.02412192, 0.5137255, 1, 0, 1,
-0.6794443, -1.020206, -1.327256, 0.5058824, 1, 0, 1,
-0.6781169, -0.05161545, -2.422859, 0.5019608, 1, 0, 1,
-0.6761953, -0.09465032, -0.8333167, 0.4941176, 1, 0, 1,
-0.6744382, -0.450336, -2.825269, 0.4862745, 1, 0, 1,
-0.6660888, 1.462255, -0.1430239, 0.4823529, 1, 0, 1,
-0.6647083, 0.6083836, -1.627097, 0.4745098, 1, 0, 1,
-0.6628839, -0.7486708, -1.355536, 0.4705882, 1, 0, 1,
-0.6610537, 1.028876, 0.801724, 0.4627451, 1, 0, 1,
-0.6607921, -0.503512, -1.251761, 0.4588235, 1, 0, 1,
-0.6591948, 0.4078996, -2.472125, 0.4509804, 1, 0, 1,
-0.6564284, -0.2941849, -1.234196, 0.4470588, 1, 0, 1,
-0.6480075, -0.7302647, -3.04361, 0.4392157, 1, 0, 1,
-0.6473601, -0.6383678, -2.067633, 0.4352941, 1, 0, 1,
-0.638941, -1.154418, -2.070015, 0.427451, 1, 0, 1,
-0.6369045, 0.003536566, 0.2831649, 0.4235294, 1, 0, 1,
-0.6296688, -0.6300334, -2.98047, 0.4156863, 1, 0, 1,
-0.6251206, -0.4729159, -2.083955, 0.4117647, 1, 0, 1,
-0.6240609, -0.6346487, -2.492133, 0.4039216, 1, 0, 1,
-0.6172881, 1.331709, 0.05992184, 0.3960784, 1, 0, 1,
-0.6101115, 1.488215, 0.0530455, 0.3921569, 1, 0, 1,
-0.6069589, -0.8056976, -3.18541, 0.3843137, 1, 0, 1,
-0.6008844, -1.354114, -1.237199, 0.3803922, 1, 0, 1,
-0.5988452, 0.1791741, -1.594748, 0.372549, 1, 0, 1,
-0.5984426, -0.7246071, -3.715498, 0.3686275, 1, 0, 1,
-0.5974011, -0.08434626, -2.6178, 0.3607843, 1, 0, 1,
-0.5964168, -1.083529, -3.268091, 0.3568628, 1, 0, 1,
-0.5956395, -1.570021, -3.227391, 0.3490196, 1, 0, 1,
-0.5948009, -1.713679, -2.954978, 0.345098, 1, 0, 1,
-0.592593, -0.2269659, 0.06054821, 0.3372549, 1, 0, 1,
-0.5907204, 0.5865382, -0.5345004, 0.3333333, 1, 0, 1,
-0.5897943, -0.1267725, -0.9728579, 0.3254902, 1, 0, 1,
-0.5855879, -1.321685, -3.392821, 0.3215686, 1, 0, 1,
-0.5833239, -1.488516, -2.061358, 0.3137255, 1, 0, 1,
-0.5791026, 1.185243, -1.234482, 0.3098039, 1, 0, 1,
-0.5764469, -0.8334149, -2.298361, 0.3019608, 1, 0, 1,
-0.5748592, 2.612288, 0.06484536, 0.2941177, 1, 0, 1,
-0.5644546, 0.1315791, 0.06195536, 0.2901961, 1, 0, 1,
-0.5608265, -0.638326, -2.230636, 0.282353, 1, 0, 1,
-0.5599543, 0.00133139, -0.3574516, 0.2784314, 1, 0, 1,
-0.5568694, 0.5021903, -1.456689, 0.2705882, 1, 0, 1,
-0.5556086, 1.428201, -0.4942546, 0.2666667, 1, 0, 1,
-0.5519968, 0.03407236, -2.257626, 0.2588235, 1, 0, 1,
-0.5493303, -0.1241179, -2.628733, 0.254902, 1, 0, 1,
-0.5477753, 0.5318387, 0.2951431, 0.2470588, 1, 0, 1,
-0.5476157, 0.1813302, -0.1201079, 0.2431373, 1, 0, 1,
-0.5438681, -1.955557, -3.803722, 0.2352941, 1, 0, 1,
-0.5430859, -1.076609, -0.65775, 0.2313726, 1, 0, 1,
-0.5397394, 2.370882, -0.6069221, 0.2235294, 1, 0, 1,
-0.533941, -1.160514, -4.185381, 0.2196078, 1, 0, 1,
-0.5298633, 0.4460262, -0.7967133, 0.2117647, 1, 0, 1,
-0.528181, 0.06193612, -2.337196, 0.2078431, 1, 0, 1,
-0.5253426, 1.969609, -0.8051245, 0.2, 1, 0, 1,
-0.5159099, 0.1732519, 0.1909028, 0.1921569, 1, 0, 1,
-0.5118276, -1.043315, -3.240328, 0.1882353, 1, 0, 1,
-0.5053453, 2.118467, 0.3267462, 0.1803922, 1, 0, 1,
-0.5033229, -0.7176941, -2.614516, 0.1764706, 1, 0, 1,
-0.5026504, -0.9082629, -2.963845, 0.1686275, 1, 0, 1,
-0.5016769, -0.6202379, -3.88759, 0.1647059, 1, 0, 1,
-0.4999455, -0.6394815, -3.063158, 0.1568628, 1, 0, 1,
-0.4909936, 0.03310874, -2.001464, 0.1529412, 1, 0, 1,
-0.4858477, 0.2893057, -1.061728, 0.145098, 1, 0, 1,
-0.4834239, 0.3957361, -0.04050404, 0.1411765, 1, 0, 1,
-0.4825611, 1.046435, 0.09740324, 0.1333333, 1, 0, 1,
-0.4819005, -1.847766, -2.518202, 0.1294118, 1, 0, 1,
-0.4768045, 1.01477, -0.5919545, 0.1215686, 1, 0, 1,
-0.4704146, 1.531557, 0.4451115, 0.1176471, 1, 0, 1,
-0.461274, -0.3588339, -1.656644, 0.1098039, 1, 0, 1,
-0.4602746, -1.768507, -2.171558, 0.1058824, 1, 0, 1,
-0.450849, -0.1002188, -1.5247, 0.09803922, 1, 0, 1,
-0.4483868, 1.913105, 1.19151, 0.09019608, 1, 0, 1,
-0.4449287, 0.2787785, -0.3421919, 0.08627451, 1, 0, 1,
-0.4405803, 1.72461, -1.842397, 0.07843138, 1, 0, 1,
-0.4384154, 2.842701, -0.3435453, 0.07450981, 1, 0, 1,
-0.4382493, -1.600889, -1.858283, 0.06666667, 1, 0, 1,
-0.4346949, -0.4010406, -3.467586, 0.0627451, 1, 0, 1,
-0.4292623, 0.9644215, -2.221174, 0.05490196, 1, 0, 1,
-0.4228601, -1.50243, -1.938535, 0.05098039, 1, 0, 1,
-0.4180741, 0.2754673, -0.4255833, 0.04313726, 1, 0, 1,
-0.4083523, -0.2185586, -1.199013, 0.03921569, 1, 0, 1,
-0.4050673, -1.288758, -3.799357, 0.03137255, 1, 0, 1,
-0.4012452, 1.074444, 1.250593, 0.02745098, 1, 0, 1,
-0.4007593, 0.7250899, 0.1093011, 0.01960784, 1, 0, 1,
-0.3970531, 2.031231, -1.041667, 0.01568628, 1, 0, 1,
-0.3956432, 0.1276601, -2.174965, 0.007843138, 1, 0, 1,
-0.3913587, 1.300131, -1.943016, 0.003921569, 1, 0, 1,
-0.3883677, 0.5502432, -1.836166, 0, 1, 0.003921569, 1,
-0.3850803, -0.4725339, -2.414905, 0, 1, 0.01176471, 1,
-0.3830332, -1.586293, -2.816918, 0, 1, 0.01568628, 1,
-0.3826113, -2.080393, -2.748634, 0, 1, 0.02352941, 1,
-0.3792639, -1.617287, -3.750634, 0, 1, 0.02745098, 1,
-0.378159, -0.7645234, -1.529671, 0, 1, 0.03529412, 1,
-0.3759651, 0.3818201, -0.3682577, 0, 1, 0.03921569, 1,
-0.3633275, -0.1601725, -2.664011, 0, 1, 0.04705882, 1,
-0.3585772, -1.271634, -1.753346, 0, 1, 0.05098039, 1,
-0.3585562, -1.141166, -1.364043, 0, 1, 0.05882353, 1,
-0.3567426, -1.008573, -2.514322, 0, 1, 0.0627451, 1,
-0.3546234, 0.1061832, -1.053033, 0, 1, 0.07058824, 1,
-0.3541345, 1.699776, 1.103896, 0, 1, 0.07450981, 1,
-0.3500293, -1.730622, -2.607509, 0, 1, 0.08235294, 1,
-0.3490193, 0.6244894, -0.2986317, 0, 1, 0.08627451, 1,
-0.3433973, -1.541625, -1.928212, 0, 1, 0.09411765, 1,
-0.3402013, 0.1489696, -1.687582, 0, 1, 0.1019608, 1,
-0.3380829, 0.4666559, -0.7895371, 0, 1, 0.1058824, 1,
-0.3375922, -0.1008712, -0.3579739, 0, 1, 0.1137255, 1,
-0.3356854, -1.187848, -1.897165, 0, 1, 0.1176471, 1,
-0.3302596, 0.5993391, -0.2116931, 0, 1, 0.1254902, 1,
-0.3297738, -0.216531, -2.463716, 0, 1, 0.1294118, 1,
-0.3259406, -0.5202487, -3.487681, 0, 1, 0.1372549, 1,
-0.3250846, -0.02976094, -1.919193, 0, 1, 0.1411765, 1,
-0.3229362, -1.907476, -1.988935, 0, 1, 0.1490196, 1,
-0.3203149, -0.6432784, -1.632913, 0, 1, 0.1529412, 1,
-0.3185757, 1.308669, -1.144158, 0, 1, 0.1607843, 1,
-0.317349, -0.7629317, -1.446298, 0, 1, 0.1647059, 1,
-0.3157281, -0.3888819, -2.781643, 0, 1, 0.172549, 1,
-0.3128388, 0.5187317, 0.4301179, 0, 1, 0.1764706, 1,
-0.3117641, 1.326823, -0.3105613, 0, 1, 0.1843137, 1,
-0.3108499, -0.2602246, -1.33107, 0, 1, 0.1882353, 1,
-0.3015299, 0.2186211, 0.03079145, 0, 1, 0.1960784, 1,
-0.2952271, -0.8769856, -1.429154, 0, 1, 0.2039216, 1,
-0.294288, 0.6099133, -0.1090822, 0, 1, 0.2078431, 1,
-0.292506, 0.5821924, -0.4758866, 0, 1, 0.2156863, 1,
-0.2911803, 0.06024926, -1.377743, 0, 1, 0.2196078, 1,
-0.2886986, -1.304078, -1.952404, 0, 1, 0.227451, 1,
-0.2865387, -0.0110914, 0.1807646, 0, 1, 0.2313726, 1,
-0.284795, 1.181428, -0.3463506, 0, 1, 0.2392157, 1,
-0.2842671, 0.7794476, 1.161652, 0, 1, 0.2431373, 1,
-0.281864, -0.3225162, -1.747353, 0, 1, 0.2509804, 1,
-0.2818272, -0.8973409, -3.705231, 0, 1, 0.254902, 1,
-0.2807827, -2.034522, -1.909604, 0, 1, 0.2627451, 1,
-0.2791185, -0.253129, -1.630908, 0, 1, 0.2666667, 1,
-0.2788966, -2.225763, -3.013708, 0, 1, 0.2745098, 1,
-0.2767403, -2.193027, -4.054027, 0, 1, 0.2784314, 1,
-0.2761341, 0.3276736, -0.9382852, 0, 1, 0.2862745, 1,
-0.2707612, 0.6249609, -1.674837, 0, 1, 0.2901961, 1,
-0.2707388, 0.6840555, -0.8036826, 0, 1, 0.2980392, 1,
-0.2655631, -1.444466, -2.821965, 0, 1, 0.3058824, 1,
-0.2648291, -0.3997897, -1.386521, 0, 1, 0.3098039, 1,
-0.2644859, 1.711007, 0.411239, 0, 1, 0.3176471, 1,
-0.2618324, -0.4776671, -4.018277, 0, 1, 0.3215686, 1,
-0.2475136, -1.871892, -2.643613, 0, 1, 0.3294118, 1,
-0.2460108, -1.203775, -1.358013, 0, 1, 0.3333333, 1,
-0.2458405, 0.7967822, 0.8677611, 0, 1, 0.3411765, 1,
-0.2456192, 3.540624, -0.4547113, 0, 1, 0.345098, 1,
-0.2445897, 0.8530589, 0.7625769, 0, 1, 0.3529412, 1,
-0.2436053, -1.022101, -3.761196, 0, 1, 0.3568628, 1,
-0.2432476, 0.4680538, 0.1600261, 0, 1, 0.3647059, 1,
-0.2392879, 0.7718389, -0.8615093, 0, 1, 0.3686275, 1,
-0.237646, -1.682703, -1.223575, 0, 1, 0.3764706, 1,
-0.2347886, 0.9425723, 1.727586, 0, 1, 0.3803922, 1,
-0.2325488, 0.1193044, -0.6481789, 0, 1, 0.3882353, 1,
-0.2318987, -0.451297, -1.837022, 0, 1, 0.3921569, 1,
-0.2306805, -1.279574, -3.444669, 0, 1, 0.4, 1,
-0.2284523, 1.355396, -0.7569893, 0, 1, 0.4078431, 1,
-0.225207, 0.3659503, 0.1279975, 0, 1, 0.4117647, 1,
-0.2200652, 1.469269, -0.3710182, 0, 1, 0.4196078, 1,
-0.2160768, -0.9583344, -2.12336, 0, 1, 0.4235294, 1,
-0.2111587, -0.7892315, -2.498352, 0, 1, 0.4313726, 1,
-0.2111296, -0.1679207, -2.337244, 0, 1, 0.4352941, 1,
-0.2109649, -0.5366479, -2.940283, 0, 1, 0.4431373, 1,
-0.2103491, -0.6193964, -2.498695, 0, 1, 0.4470588, 1,
-0.2061764, -0.3217264, -1.878814, 0, 1, 0.454902, 1,
-0.2058914, -0.3287168, -2.375211, 0, 1, 0.4588235, 1,
-0.2058558, -0.3357671, -3.918077, 0, 1, 0.4666667, 1,
-0.2024904, 0.1481868, -2.477665, 0, 1, 0.4705882, 1,
-0.201123, -0.8081502, -4.350875, 0, 1, 0.4784314, 1,
-0.2006834, -0.2891102, -3.032787, 0, 1, 0.4823529, 1,
-0.2002172, -0.7901284, -0.6046365, 0, 1, 0.4901961, 1,
-0.197326, -1.043569, -2.441091, 0, 1, 0.4941176, 1,
-0.1970083, -0.6562393, -3.915991, 0, 1, 0.5019608, 1,
-0.1935347, -0.9630041, -2.886293, 0, 1, 0.509804, 1,
-0.1911516, 0.4724385, 0.07746595, 0, 1, 0.5137255, 1,
-0.1900116, -1.359229, -2.442188, 0, 1, 0.5215687, 1,
-0.1898081, 1.417303, -0.4189509, 0, 1, 0.5254902, 1,
-0.188678, -0.5745602, -3.811371, 0, 1, 0.5333334, 1,
-0.1838911, 0.588496, -0.3901672, 0, 1, 0.5372549, 1,
-0.1776909, -1.120132, -2.885586, 0, 1, 0.5450981, 1,
-0.1745362, -0.1559783, -3.35006, 0, 1, 0.5490196, 1,
-0.1738974, -1.222813, -2.542855, 0, 1, 0.5568628, 1,
-0.1696526, -0.7915069, -4.279202, 0, 1, 0.5607843, 1,
-0.1693946, 0.5340914, -1.526227, 0, 1, 0.5686275, 1,
-0.1682914, 0.04220459, -2.280216, 0, 1, 0.572549, 1,
-0.1675179, 1.100856, 1.639766, 0, 1, 0.5803922, 1,
-0.1622214, -0.1958222, -3.419158, 0, 1, 0.5843138, 1,
-0.1566648, 0.4626605, 1.136883, 0, 1, 0.5921569, 1,
-0.1456316, 1.219311, 0.08329558, 0, 1, 0.5960785, 1,
-0.1443117, -0.1145363, -2.001899, 0, 1, 0.6039216, 1,
-0.1432208, -1.127726, -2.60604, 0, 1, 0.6117647, 1,
-0.1430163, 0.4423187, -0.9053602, 0, 1, 0.6156863, 1,
-0.1398612, 0.3558017, -1.472168, 0, 1, 0.6235294, 1,
-0.1328399, -0.1315085, -2.026168, 0, 1, 0.627451, 1,
-0.1324857, 1.154998, -0.4299927, 0, 1, 0.6352941, 1,
-0.1315274, -0.961328, -2.78266, 0, 1, 0.6392157, 1,
-0.1297843, -0.07684106, -0.5070818, 0, 1, 0.6470588, 1,
-0.1281502, 0.6012888, 2.039865, 0, 1, 0.6509804, 1,
-0.1271738, 1.835417, -0.6742951, 0, 1, 0.6588235, 1,
-0.1266162, -0.9583985, -2.986497, 0, 1, 0.6627451, 1,
-0.1217314, -0.166109, -1.686845, 0, 1, 0.6705883, 1,
-0.1146496, 1.709298, -0.2879315, 0, 1, 0.6745098, 1,
-0.1124834, -0.7874255, -2.432755, 0, 1, 0.682353, 1,
-0.1116982, -1.335333, -1.508007, 0, 1, 0.6862745, 1,
-0.1087419, 0.6186869, -1.757618, 0, 1, 0.6941177, 1,
-0.1054761, -1.358381, -2.956012, 0, 1, 0.7019608, 1,
-0.1028308, 1.162315, 0.8952505, 0, 1, 0.7058824, 1,
-0.1025083, 0.01633653, -2.067358, 0, 1, 0.7137255, 1,
-0.09972055, -1.089898, -2.024813, 0, 1, 0.7176471, 1,
-0.09716953, 0.2601359, -0.8212306, 0, 1, 0.7254902, 1,
-0.09673042, -1.215929, -3.287293, 0, 1, 0.7294118, 1,
-0.09556665, 0.4963825, -0.9731973, 0, 1, 0.7372549, 1,
-0.09432952, -1.611101, -2.495197, 0, 1, 0.7411765, 1,
-0.09391945, 1.79477, 1.271139, 0, 1, 0.7490196, 1,
-0.09265298, -0.04689658, -3.301672, 0, 1, 0.7529412, 1,
-0.09121169, 0.3255863, -1.891412, 0, 1, 0.7607843, 1,
-0.0892693, -1.707774, -2.480412, 0, 1, 0.7647059, 1,
-0.08871734, -0.2747524, -3.344107, 0, 1, 0.772549, 1,
-0.08765247, -0.6115978, -3.965855, 0, 1, 0.7764706, 1,
-0.0828707, 0.7208605, 0.135619, 0, 1, 0.7843137, 1,
-0.08245201, 1.580557, 0.05744939, 0, 1, 0.7882353, 1,
-0.07802926, 1.00594, -0.6619813, 0, 1, 0.7960784, 1,
-0.0734229, 1.857177, 0.6767178, 0, 1, 0.8039216, 1,
-0.07334588, -0.7875744, -2.087648, 0, 1, 0.8078431, 1,
-0.06100307, -1.662665, -2.120329, 0, 1, 0.8156863, 1,
-0.0597665, -0.4402794, -3.102644, 0, 1, 0.8196079, 1,
-0.05937032, 1.058228, 0.3029853, 0, 1, 0.827451, 1,
-0.05913325, -0.4529804, -3.912846, 0, 1, 0.8313726, 1,
-0.05555306, -0.8517966, -3.558983, 0, 1, 0.8392157, 1,
-0.05246976, 0.1418889, -1.242582, 0, 1, 0.8431373, 1,
-0.04999152, 0.2949899, 0.5803829, 0, 1, 0.8509804, 1,
-0.04994877, 0.3172727, -1.296, 0, 1, 0.854902, 1,
-0.04893027, 0.107496, -0.1821963, 0, 1, 0.8627451, 1,
-0.04602369, 0.06613381, -0.8447096, 0, 1, 0.8666667, 1,
-0.04591349, 0.7110517, -0.3420406, 0, 1, 0.8745098, 1,
-0.04250807, 0.2280166, 0.9179872, 0, 1, 0.8784314, 1,
-0.03668996, -0.8193818, -5.074165, 0, 1, 0.8862745, 1,
-0.03486269, 0.1340864, -0.5920238, 0, 1, 0.8901961, 1,
-0.02100618, -1.583894, -1.477471, 0, 1, 0.8980392, 1,
-0.02056155, 0.5254228, -0.08194745, 0, 1, 0.9058824, 1,
-0.02018636, 0.6487126, 0.5942221, 0, 1, 0.9098039, 1,
-0.01685119, -1.233331, -3.556181, 0, 1, 0.9176471, 1,
-0.01496854, -1.239735, -5.04091, 0, 1, 0.9215686, 1,
-0.0148472, -0.6580222, -4.242821, 0, 1, 0.9294118, 1,
-0.01381817, -0.738498, -3.627959, 0, 1, 0.9333333, 1,
-0.01182387, -0.04328775, -4.230376, 0, 1, 0.9411765, 1,
-0.007535993, -1.115561, -2.268429, 0, 1, 0.945098, 1,
-0.003120269, 1.153666, -0.1095392, 0, 1, 0.9529412, 1,
-0.003072433, -0.6139486, -0.5264591, 0, 1, 0.9568627, 1,
0.002336835, -0.7434094, 4.6302, 0, 1, 0.9647059, 1,
0.004543396, -0.7224279, 2.774349, 0, 1, 0.9686275, 1,
0.006461034, 0.3362438, 0.01230933, 0, 1, 0.9764706, 1,
0.01242696, -1.174625, 2.92589, 0, 1, 0.9803922, 1,
0.01250888, 0.4743702, 0.4699179, 0, 1, 0.9882353, 1,
0.01372583, -0.6902436, 2.74195, 0, 1, 0.9921569, 1,
0.01458522, 0.9959444, 0.6729354, 0, 1, 1, 1,
0.02120879, -0.3079784, 4.553873, 0, 0.9921569, 1, 1,
0.02881119, 1.803473, 2.448109, 0, 0.9882353, 1, 1,
0.034301, 1.589251, 1.061874, 0, 0.9803922, 1, 1,
0.04096785, 1.175067, -0.1200963, 0, 0.9764706, 1, 1,
0.0436274, -0.04598657, 2.117566, 0, 0.9686275, 1, 1,
0.04591965, -1.054843, 3.886686, 0, 0.9647059, 1, 1,
0.04700723, 1.253363, -1.324176, 0, 0.9568627, 1, 1,
0.04905334, 2.064321, 0.6932012, 0, 0.9529412, 1, 1,
0.05498982, -0.184035, 0.9333194, 0, 0.945098, 1, 1,
0.05736437, 0.9083598, 0.6261296, 0, 0.9411765, 1, 1,
0.05820468, -0.7643146, 2.100755, 0, 0.9333333, 1, 1,
0.05833651, 0.2432405, 0.003249888, 0, 0.9294118, 1, 1,
0.06527891, 2.712049, 0.7001603, 0, 0.9215686, 1, 1,
0.06784114, -0.2482979, 1.110494, 0, 0.9176471, 1, 1,
0.07197838, -0.03999234, 1.153639, 0, 0.9098039, 1, 1,
0.07236373, -1.027426, 3.332736, 0, 0.9058824, 1, 1,
0.08197594, 0.1185937, -1.027681, 0, 0.8980392, 1, 1,
0.08199112, 1.593304, -1.111432, 0, 0.8901961, 1, 1,
0.08331735, -0.744178, 4.15238, 0, 0.8862745, 1, 1,
0.08805316, -0.32578, 2.495676, 0, 0.8784314, 1, 1,
0.08855151, -0.6626781, 3.500141, 0, 0.8745098, 1, 1,
0.09001283, 1.438231, 2.450356, 0, 0.8666667, 1, 1,
0.09087409, 1.707395, -1.235617, 0, 0.8627451, 1, 1,
0.09118574, 0.4575999, -0.1223036, 0, 0.854902, 1, 1,
0.09143092, 0.1541463, 0.6178278, 0, 0.8509804, 1, 1,
0.09401906, 1.050903, 0.282855, 0, 0.8431373, 1, 1,
0.09666585, 1.833102, 0.6684258, 0, 0.8392157, 1, 1,
0.1022621, -0.4620966, 4.688253, 0, 0.8313726, 1, 1,
0.1064673, -0.225556, 3.790147, 0, 0.827451, 1, 1,
0.1217915, 0.5171909, 0.404166, 0, 0.8196079, 1, 1,
0.122016, 0.3379335, 0.5166131, 0, 0.8156863, 1, 1,
0.1273629, 0.1740843, 0.3377634, 0, 0.8078431, 1, 1,
0.1311372, -0.5165189, 1.948012, 0, 0.8039216, 1, 1,
0.1317519, 1.219, -0.3732551, 0, 0.7960784, 1, 1,
0.1329309, 0.5900689, -1.171898, 0, 0.7882353, 1, 1,
0.1360133, -0.4460603, 2.606848, 0, 0.7843137, 1, 1,
0.1373323, 0.2247277, 1.238806, 0, 0.7764706, 1, 1,
0.1386724, -0.7600595, 2.102548, 0, 0.772549, 1, 1,
0.1401428, 1.193153, 0.2513444, 0, 0.7647059, 1, 1,
0.1420111, -0.08059174, 1.504155, 0, 0.7607843, 1, 1,
0.1439757, 1.128776, -0.3793208, 0, 0.7529412, 1, 1,
0.1466246, -0.4736191, 2.470556, 0, 0.7490196, 1, 1,
0.1478024, 1.212098, -0.5599515, 0, 0.7411765, 1, 1,
0.1517232, -0.9910936, 2.877869, 0, 0.7372549, 1, 1,
0.1521047, -2.093053, 3.131483, 0, 0.7294118, 1, 1,
0.1544745, 1.320941, -2.184018, 0, 0.7254902, 1, 1,
0.1599482, -0.2616763, 3.764888, 0, 0.7176471, 1, 1,
0.1633161, -0.4263123, 3.447089, 0, 0.7137255, 1, 1,
0.1668352, 1.035459, -1.266515, 0, 0.7058824, 1, 1,
0.1733541, -1.496196, 1.8404, 0, 0.6980392, 1, 1,
0.1744109, -0.02378397, 0.4122447, 0, 0.6941177, 1, 1,
0.1766494, 0.1393164, -0.5355839, 0, 0.6862745, 1, 1,
0.1771963, -1.50335, 1.742359, 0, 0.682353, 1, 1,
0.1787841, 0.009602304, 1.427005, 0, 0.6745098, 1, 1,
0.1821099, 0.2116419, 0.4399551, 0, 0.6705883, 1, 1,
0.182635, -1.353011, 3.502258, 0, 0.6627451, 1, 1,
0.1840414, -0.3887911, 2.050755, 0, 0.6588235, 1, 1,
0.1891166, 0.9801009, -0.9511728, 0, 0.6509804, 1, 1,
0.1904041, 2.184453, 0.7322961, 0, 0.6470588, 1, 1,
0.1931069, -0.7103721, 1.132278, 0, 0.6392157, 1, 1,
0.1951315, -0.04438575, 3.744251, 0, 0.6352941, 1, 1,
0.2015231, 0.02552575, 0.949062, 0, 0.627451, 1, 1,
0.2064647, 0.4551352, 3.156585, 0, 0.6235294, 1, 1,
0.2087665, 0.3078511, 0.5513319, 0, 0.6156863, 1, 1,
0.2152969, 1.91571, 0.9079655, 0, 0.6117647, 1, 1,
0.219381, -0.0873346, 2.177892, 0, 0.6039216, 1, 1,
0.2207948, -0.1038793, 2.182358, 0, 0.5960785, 1, 1,
0.2210696, 0.6435017, 0.3041517, 0, 0.5921569, 1, 1,
0.2261534, -0.1546697, 0.06664164, 0, 0.5843138, 1, 1,
0.2271862, -0.2013656, 2.941482, 0, 0.5803922, 1, 1,
0.2278674, -0.5560707, 1.007017, 0, 0.572549, 1, 1,
0.2316891, -0.8270036, 4.311857, 0, 0.5686275, 1, 1,
0.2319852, -1.388837, 4.088068, 0, 0.5607843, 1, 1,
0.2332229, -1.040661, 2.166557, 0, 0.5568628, 1, 1,
0.2378607, -1.243669, 2.426631, 0, 0.5490196, 1, 1,
0.2394391, 0.5516335, 1.133087, 0, 0.5450981, 1, 1,
0.2411955, 1.074338, -0.3573528, 0, 0.5372549, 1, 1,
0.2424797, -0.9347607, 3.657702, 0, 0.5333334, 1, 1,
0.2475499, 0.499281, 0.006910928, 0, 0.5254902, 1, 1,
0.2501113, 0.1791382, 2.084191, 0, 0.5215687, 1, 1,
0.2501217, -0.6430472, 2.901897, 0, 0.5137255, 1, 1,
0.2520934, -1.137976, 2.491277, 0, 0.509804, 1, 1,
0.260421, 0.8963054, -1.249605, 0, 0.5019608, 1, 1,
0.2640173, -1.297909, 2.789859, 0, 0.4941176, 1, 1,
0.2660631, -0.5484647, 3.884138, 0, 0.4901961, 1, 1,
0.2681781, -0.4369484, 1.764896, 0, 0.4823529, 1, 1,
0.2685842, 0.7411978, 0.9005228, 0, 0.4784314, 1, 1,
0.2702469, 0.9702322, 1.590294, 0, 0.4705882, 1, 1,
0.2713892, -0.402638, 1.409531, 0, 0.4666667, 1, 1,
0.2721375, 0.4317905, 2.202335, 0, 0.4588235, 1, 1,
0.2726703, 0.1025904, 1.881678, 0, 0.454902, 1, 1,
0.2745853, 0.230286, 1.292207, 0, 0.4470588, 1, 1,
0.2746285, -0.1044326, 1.47623, 0, 0.4431373, 1, 1,
0.275843, -2.244931, 2.48159, 0, 0.4352941, 1, 1,
0.2760139, -0.5272854, 3.121498, 0, 0.4313726, 1, 1,
0.2772143, -0.8362848, 2.127934, 0, 0.4235294, 1, 1,
0.2781765, 0.009305976, 3.055717, 0, 0.4196078, 1, 1,
0.2784869, 1.318448, -1.228121, 0, 0.4117647, 1, 1,
0.2827968, -0.7041368, 2.284234, 0, 0.4078431, 1, 1,
0.2843053, 1.351536, 0.3043177, 0, 0.4, 1, 1,
0.2866823, -1.143601, 3.956029, 0, 0.3921569, 1, 1,
0.2890365, 0.3790369, 0.6012484, 0, 0.3882353, 1, 1,
0.2909834, -0.3250829, 2.815697, 0, 0.3803922, 1, 1,
0.2942853, 0.9469132, 0.3463796, 0, 0.3764706, 1, 1,
0.3044007, -1.153893, 1.919841, 0, 0.3686275, 1, 1,
0.3058095, -1.901654, 2.737076, 0, 0.3647059, 1, 1,
0.3064038, -0.178835, 1.706762, 0, 0.3568628, 1, 1,
0.3064481, 0.1265673, 0.2716526, 0, 0.3529412, 1, 1,
0.3106011, 0.5651667, 0.9660198, 0, 0.345098, 1, 1,
0.3117158, -1.05698, 2.310609, 0, 0.3411765, 1, 1,
0.3145821, 0.9527226, -1.512959, 0, 0.3333333, 1, 1,
0.3169092, -0.02756423, 0.4271975, 0, 0.3294118, 1, 1,
0.3187599, -1.222214, 3.378909, 0, 0.3215686, 1, 1,
0.3248214, -0.6908016, 3.072121, 0, 0.3176471, 1, 1,
0.326178, 0.8996403, -1.079913, 0, 0.3098039, 1, 1,
0.3295963, 1.595414, 0.06166125, 0, 0.3058824, 1, 1,
0.3304955, 0.8349745, -0.8834572, 0, 0.2980392, 1, 1,
0.3315031, -0.4466464, 1.468939, 0, 0.2901961, 1, 1,
0.3317144, 0.6744894, -1.388458, 0, 0.2862745, 1, 1,
0.3346976, -0.7047921, 2.655661, 0, 0.2784314, 1, 1,
0.3384898, -1.245247, 3.719456, 0, 0.2745098, 1, 1,
0.3396773, 0.9783373, 1.670236, 0, 0.2666667, 1, 1,
0.3422095, -3.115176, 2.62489, 0, 0.2627451, 1, 1,
0.3425615, 1.131511, 0.9555239, 0, 0.254902, 1, 1,
0.3432809, 1.368944, 1.998941, 0, 0.2509804, 1, 1,
0.3453325, 1.045601, 1.042919, 0, 0.2431373, 1, 1,
0.345628, -0.8863669, 2.599779, 0, 0.2392157, 1, 1,
0.3566124, 0.5457453, 0.01844751, 0, 0.2313726, 1, 1,
0.3597896, 0.3215408, 0.2174559, 0, 0.227451, 1, 1,
0.3605287, 0.06148842, 1.4807, 0, 0.2196078, 1, 1,
0.3658199, -0.02098748, 2.860004, 0, 0.2156863, 1, 1,
0.3672759, 2.193918, 0.1465768, 0, 0.2078431, 1, 1,
0.3694766, -2.234819, 2.638817, 0, 0.2039216, 1, 1,
0.3725758, 0.2486567, 1.950659, 0, 0.1960784, 1, 1,
0.3747457, 0.01283943, 1.136695, 0, 0.1882353, 1, 1,
0.3757983, -1.010558, 2.765143, 0, 0.1843137, 1, 1,
0.3769981, 0.185058, -0.3805474, 0, 0.1764706, 1, 1,
0.3852985, -0.6158193, 2.229735, 0, 0.172549, 1, 1,
0.3860656, 0.9280381, 1.939465, 0, 0.1647059, 1, 1,
0.3870464, 0.1694462, 0.3870849, 0, 0.1607843, 1, 1,
0.3973501, 1.167214, 0.5871417, 0, 0.1529412, 1, 1,
0.4047402, -2.415234, 1.402323, 0, 0.1490196, 1, 1,
0.4076423, -0.6722046, 3.403711, 0, 0.1411765, 1, 1,
0.4080976, 0.7411171, -0.1081875, 0, 0.1372549, 1, 1,
0.4083031, -1.009189, 3.953908, 0, 0.1294118, 1, 1,
0.413781, -0.008955772, 2.907947, 0, 0.1254902, 1, 1,
0.4160037, 1.987401, -0.4980806, 0, 0.1176471, 1, 1,
0.4173285, -0.3498943, 1.157019, 0, 0.1137255, 1, 1,
0.4176539, 0.9533233, -0.1271866, 0, 0.1058824, 1, 1,
0.4178173, -0.6188933, 3.603607, 0, 0.09803922, 1, 1,
0.4185622, -0.3582796, 3.588712, 0, 0.09411765, 1, 1,
0.423846, -0.2164011, 2.824917, 0, 0.08627451, 1, 1,
0.4303234, 0.6964558, -0.2694384, 0, 0.08235294, 1, 1,
0.4305041, -1.086387, 2.730352, 0, 0.07450981, 1, 1,
0.4320815, -1.065436, 5.282952, 0, 0.07058824, 1, 1,
0.4322163, 0.6677595, -1.482614, 0, 0.0627451, 1, 1,
0.435524, -0.2937227, 0.6272087, 0, 0.05882353, 1, 1,
0.4395276, 0.5382678, -0.3548432, 0, 0.05098039, 1, 1,
0.4397084, 0.6599425, -0.3622272, 0, 0.04705882, 1, 1,
0.4443544, -0.6098535, 1.846116, 0, 0.03921569, 1, 1,
0.4478514, -1.810768, 3.670215, 0, 0.03529412, 1, 1,
0.4575354, -0.3521928, 3.997978, 0, 0.02745098, 1, 1,
0.458526, 0.9910775, 0.384166, 0, 0.02352941, 1, 1,
0.4589661, -0.5941342, 1.758831, 0, 0.01568628, 1, 1,
0.4592926, 0.07787494, 0.2403016, 0, 0.01176471, 1, 1,
0.4601439, 0.1118836, 0.5832475, 0, 0.003921569, 1, 1,
0.4666624, 0.3214349, 0.6378225, 0.003921569, 0, 1, 1,
0.4673856, -0.003908009, 2.583627, 0.007843138, 0, 1, 1,
0.4679927, 0.2121971, 1.532975, 0.01568628, 0, 1, 1,
0.4680365, -0.1134292, 0.4046121, 0.01960784, 0, 1, 1,
0.4692914, -0.4693634, 2.436816, 0.02745098, 0, 1, 1,
0.4697727, -0.4039431, 1.531441, 0.03137255, 0, 1, 1,
0.4704039, 0.05166014, 0.581174, 0.03921569, 0, 1, 1,
0.4780622, -1.196412, 2.369327, 0.04313726, 0, 1, 1,
0.4832432, 1.264587, -1.710644, 0.05098039, 0, 1, 1,
0.4958135, 0.4995803, 2.923019, 0.05490196, 0, 1, 1,
0.4967432, -0.1391877, 1.026414, 0.0627451, 0, 1, 1,
0.4974208, -1.089405, 3.474101, 0.06666667, 0, 1, 1,
0.5045418, 0.3203959, 1.926228, 0.07450981, 0, 1, 1,
0.5060615, 0.1949044, 0.8740938, 0.07843138, 0, 1, 1,
0.5089782, 0.3410465, 2.757874, 0.08627451, 0, 1, 1,
0.5092615, 0.5538213, -0.3574862, 0.09019608, 0, 1, 1,
0.5104477, 0.4312269, 0.5199143, 0.09803922, 0, 1, 1,
0.5105739, 0.7945123, 0.9830182, 0.1058824, 0, 1, 1,
0.5116853, -0.2295788, 0.6019664, 0.1098039, 0, 1, 1,
0.5120553, 0.2727895, 3.200094, 0.1176471, 0, 1, 1,
0.5215642, -0.06146117, 2.691115, 0.1215686, 0, 1, 1,
0.5263939, 0.02914035, 1.413876, 0.1294118, 0, 1, 1,
0.5270447, 0.3520104, 0.1056736, 0.1333333, 0, 1, 1,
0.5298627, 0.2041878, 0.1742806, 0.1411765, 0, 1, 1,
0.5298856, 0.02524133, 2.020722, 0.145098, 0, 1, 1,
0.5300521, 1.562023, -0.03721685, 0.1529412, 0, 1, 1,
0.5311027, 0.1587901, 1.119306, 0.1568628, 0, 1, 1,
0.5381766, -1.699327, 2.798969, 0.1647059, 0, 1, 1,
0.5417311, -0.6772451, 1.271884, 0.1686275, 0, 1, 1,
0.5434647, -0.5390455, 1.858538, 0.1764706, 0, 1, 1,
0.5503651, -1.778085, 3.253557, 0.1803922, 0, 1, 1,
0.5551471, 0.1058165, 1.155976, 0.1882353, 0, 1, 1,
0.5573294, -1.5768, 2.149769, 0.1921569, 0, 1, 1,
0.5592071, -0.3153829, 1.701506, 0.2, 0, 1, 1,
0.560159, 0.7785768, 0.1136796, 0.2078431, 0, 1, 1,
0.5610698, -0.03465252, 1.059332, 0.2117647, 0, 1, 1,
0.5631099, 0.6058172, 0.2317342, 0.2196078, 0, 1, 1,
0.5644509, 0.477166, -0.7889491, 0.2235294, 0, 1, 1,
0.5679575, -0.2238923, 2.362381, 0.2313726, 0, 1, 1,
0.5683745, -0.8443284, 3.314647, 0.2352941, 0, 1, 1,
0.5691163, -0.1429853, 1.771384, 0.2431373, 0, 1, 1,
0.5691754, 1.146497, 0.2436521, 0.2470588, 0, 1, 1,
0.5747665, 1.405221, -0.2573739, 0.254902, 0, 1, 1,
0.575099, -0.8605897, 2.071265, 0.2588235, 0, 1, 1,
0.5780846, -0.4153397, 1.291783, 0.2666667, 0, 1, 1,
0.5782749, -0.2190946, 2.415648, 0.2705882, 0, 1, 1,
0.5804316, 0.8886729, 1.904737, 0.2784314, 0, 1, 1,
0.5825821, -0.8402243, 2.388911, 0.282353, 0, 1, 1,
0.5831593, -0.797709, 3.006705, 0.2901961, 0, 1, 1,
0.5845399, 0.7903674, 0.574272, 0.2941177, 0, 1, 1,
0.5902994, 0.5294515, 0.7556536, 0.3019608, 0, 1, 1,
0.5906702, 0.9676377, 0.7170879, 0.3098039, 0, 1, 1,
0.5916449, -0.51883, 3.533374, 0.3137255, 0, 1, 1,
0.591709, 1.22377, -0.2126151, 0.3215686, 0, 1, 1,
0.6035919, 0.4196741, 2.412886, 0.3254902, 0, 1, 1,
0.6092632, 0.7063103, 0.2602755, 0.3333333, 0, 1, 1,
0.6109566, -0.4400604, 3.099156, 0.3372549, 0, 1, 1,
0.6120918, 0.3813265, 1.492916, 0.345098, 0, 1, 1,
0.6167692, -0.06303427, 1.685725, 0.3490196, 0, 1, 1,
0.6185855, 0.0666107, 0.4134715, 0.3568628, 0, 1, 1,
0.6210194, -0.1804552, 1.630414, 0.3607843, 0, 1, 1,
0.6220191, -1.018412, 3.188972, 0.3686275, 0, 1, 1,
0.6257288, -1.474012, 4.015465, 0.372549, 0, 1, 1,
0.6289919, -1.463947, 3.480445, 0.3803922, 0, 1, 1,
0.6295356, 0.4527923, 1.308447, 0.3843137, 0, 1, 1,
0.6311913, 2.461512, -0.7489199, 0.3921569, 0, 1, 1,
0.6346273, 0.2834747, -0.8562226, 0.3960784, 0, 1, 1,
0.6421598, 0.281574, -0.624542, 0.4039216, 0, 1, 1,
0.6450382, 1.997234, 1.160079, 0.4117647, 0, 1, 1,
0.6457987, 1.726522, 0.4856992, 0.4156863, 0, 1, 1,
0.6509325, -0.672805, 2.088393, 0.4235294, 0, 1, 1,
0.6526629, -0.5145375, 2.499974, 0.427451, 0, 1, 1,
0.6561552, -0.3074032, 2.426308, 0.4352941, 0, 1, 1,
0.6575122, -0.7913335, 2.787546, 0.4392157, 0, 1, 1,
0.6602299, 0.2368466, 0.3259548, 0.4470588, 0, 1, 1,
0.660494, 0.4460162, 1.658816, 0.4509804, 0, 1, 1,
0.6662391, 0.4372716, 0.9943895, 0.4588235, 0, 1, 1,
0.6668937, 0.6578571, 0.8771368, 0.4627451, 0, 1, 1,
0.6758348, 0.3528576, 1.280728, 0.4705882, 0, 1, 1,
0.6789823, 1.656, 1.247691, 0.4745098, 0, 1, 1,
0.6847648, -0.4429099, 1.421318, 0.4823529, 0, 1, 1,
0.6875098, -1.207732, 2.399988, 0.4862745, 0, 1, 1,
0.6925338, 0.2893326, 2.397396, 0.4941176, 0, 1, 1,
0.6965263, -0.7819549, 2.000463, 0.5019608, 0, 1, 1,
0.6991592, 0.1592247, 0.2967227, 0.5058824, 0, 1, 1,
0.7048519, -0.8474912, 3.249493, 0.5137255, 0, 1, 1,
0.7110898, 0.9317043, -1.234565, 0.5176471, 0, 1, 1,
0.7117036, 0.6276096, 1.618815, 0.5254902, 0, 1, 1,
0.7135878, 0.5207291, -0.1443926, 0.5294118, 0, 1, 1,
0.7154766, -3.158895, 2.774145, 0.5372549, 0, 1, 1,
0.7156791, -1.624908, 2.921978, 0.5411765, 0, 1, 1,
0.7173696, 0.3487932, 1.020666, 0.5490196, 0, 1, 1,
0.7236006, -1.022471, 4.256084, 0.5529412, 0, 1, 1,
0.7245464, 0.672658, -1.745665, 0.5607843, 0, 1, 1,
0.7249218, -0.7048361, 0.8178401, 0.5647059, 0, 1, 1,
0.7258633, -0.2136475, 1.122359, 0.572549, 0, 1, 1,
0.7265164, -0.1202527, 0.6496562, 0.5764706, 0, 1, 1,
0.7292284, -0.9182838, 2.07141, 0.5843138, 0, 1, 1,
0.7346183, 1.602725, 0.9071786, 0.5882353, 0, 1, 1,
0.7349548, 1.156772, 0.332971, 0.5960785, 0, 1, 1,
0.7374991, -0.1779696, 2.168161, 0.6039216, 0, 1, 1,
0.7420121, 1.136249, -1.529595, 0.6078432, 0, 1, 1,
0.7425069, -0.318129, 2.992738, 0.6156863, 0, 1, 1,
0.7430044, 1.49455, 0.278066, 0.6196079, 0, 1, 1,
0.7449954, 1.711285, 1.069797, 0.627451, 0, 1, 1,
0.7479336, 1.501705, 0.9171459, 0.6313726, 0, 1, 1,
0.7480685, -1.300201, 2.545824, 0.6392157, 0, 1, 1,
0.7562872, 0.7248185, 1.743359, 0.6431373, 0, 1, 1,
0.7574528, -0.3018014, 2.392562, 0.6509804, 0, 1, 1,
0.7591466, 2.506244, 0.4567755, 0.654902, 0, 1, 1,
0.7646685, -0.2158477, 0.8817857, 0.6627451, 0, 1, 1,
0.76553, 1.700485, 0.8993927, 0.6666667, 0, 1, 1,
0.7662063, -1.057914, 1.251899, 0.6745098, 0, 1, 1,
0.7682964, 0.9146609, 0.01966695, 0.6784314, 0, 1, 1,
0.7694278, 1.881301, -0.6021516, 0.6862745, 0, 1, 1,
0.7729352, -0.9596282, 3.435593, 0.6901961, 0, 1, 1,
0.7754522, 0.3451214, 2.219476, 0.6980392, 0, 1, 1,
0.7763624, -1.100719, 1.778471, 0.7058824, 0, 1, 1,
0.7863038, -0.4947419, 2.198407, 0.7098039, 0, 1, 1,
0.7876467, -0.2073988, 0.2921017, 0.7176471, 0, 1, 1,
0.7912147, 0.8727896, 0.6764805, 0.7215686, 0, 1, 1,
0.7935241, -0.2164484, 1.268429, 0.7294118, 0, 1, 1,
0.7946329, -0.6219482, 4.548125, 0.7333333, 0, 1, 1,
0.7980111, -0.5187406, 1.851755, 0.7411765, 0, 1, 1,
0.8043104, -0.1689506, 2.01672, 0.7450981, 0, 1, 1,
0.8148076, -0.8752898, 2.736185, 0.7529412, 0, 1, 1,
0.816071, 0.9468232, 0.9722599, 0.7568628, 0, 1, 1,
0.8186646, 0.3971506, 2.643026, 0.7647059, 0, 1, 1,
0.8194203, -0.02662909, 1.76126, 0.7686275, 0, 1, 1,
0.8228754, 2.106137, 0.7950028, 0.7764706, 0, 1, 1,
0.8253604, -0.3087873, 2.963651, 0.7803922, 0, 1, 1,
0.8278658, 0.9480849, 0.7167084, 0.7882353, 0, 1, 1,
0.8307183, 1.746554, 0.6792702, 0.7921569, 0, 1, 1,
0.8363179, -0.5423535, 1.91171, 0.8, 0, 1, 1,
0.8368721, -0.2775588, 2.395253, 0.8078431, 0, 1, 1,
0.8400922, -0.3108769, 0.2710803, 0.8117647, 0, 1, 1,
0.8413667, -0.4718316, 1.688787, 0.8196079, 0, 1, 1,
0.8440278, 1.121608, 0.2237795, 0.8235294, 0, 1, 1,
0.8517409, -0.6166674, 3.610812, 0.8313726, 0, 1, 1,
0.8524759, 0.9219347, 0.3874408, 0.8352941, 0, 1, 1,
0.853043, -0.4454338, 3.198309, 0.8431373, 0, 1, 1,
0.8557039, 0.3950704, 2.449151, 0.8470588, 0, 1, 1,
0.8628166, -0.5153706, 2.582998, 0.854902, 0, 1, 1,
0.8649692, -0.4635768, 1.55991, 0.8588235, 0, 1, 1,
0.8728102, 0.7164907, 0.2270702, 0.8666667, 0, 1, 1,
0.8756014, 0.2041029, 0.3667311, 0.8705882, 0, 1, 1,
0.8761194, 0.7431362, 0.4170589, 0.8784314, 0, 1, 1,
0.8766563, -0.08399767, 2.562528, 0.8823529, 0, 1, 1,
0.87672, 0.3127331, 3.437999, 0.8901961, 0, 1, 1,
0.8777465, -1.660485, 2.194275, 0.8941177, 0, 1, 1,
0.8789564, 1.13674, 2.917002, 0.9019608, 0, 1, 1,
0.879453, 0.6562235, 1.516371, 0.9098039, 0, 1, 1,
0.8859033, -0.6554269, 2.316964, 0.9137255, 0, 1, 1,
0.8969826, 0.4694243, 2.03807, 0.9215686, 0, 1, 1,
0.8983171, 0.7022555, 0.1837517, 0.9254902, 0, 1, 1,
0.8990967, -0.2807284, 3.315672, 0.9333333, 0, 1, 1,
0.9043468, 0.9888979, 0.2891967, 0.9372549, 0, 1, 1,
0.9050202, -0.4073627, 2.874024, 0.945098, 0, 1, 1,
0.9149964, -1.029087, 1.960244, 0.9490196, 0, 1, 1,
0.9176037, -0.8135197, 3.724047, 0.9568627, 0, 1, 1,
0.9176149, -0.8117645, 2.923455, 0.9607843, 0, 1, 1,
0.919172, -0.4306226, 1.066201, 0.9686275, 0, 1, 1,
0.9203309, 0.01781674, 1.654844, 0.972549, 0, 1, 1,
0.9314743, -0.287935, 2.211128, 0.9803922, 0, 1, 1,
0.942062, -0.7259142, 2.480282, 0.9843137, 0, 1, 1,
0.9451606, -0.1353557, 2.69063, 0.9921569, 0, 1, 1,
0.9477847, 0.1653186, 1.299246, 0.9960784, 0, 1, 1,
0.9501458, -3.395087, 3.750841, 1, 0, 0.9960784, 1,
0.9505832, -1.306451, 2.146361, 1, 0, 0.9882353, 1,
0.9507602, 1.796543, 0.8430363, 1, 0, 0.9843137, 1,
0.955911, 0.8736126, 2.431135, 1, 0, 0.9764706, 1,
0.9631143, 1.055558, 0.1147225, 1, 0, 0.972549, 1,
0.9641249, 0.02995379, 0.1225649, 1, 0, 0.9647059, 1,
0.9697388, 0.1713182, 0.7627788, 1, 0, 0.9607843, 1,
0.9820537, 0.03811397, 2.173392, 1, 0, 0.9529412, 1,
0.9834011, 0.07499038, 0.5297968, 1, 0, 0.9490196, 1,
0.9835809, -0.7930202, 2.408336, 1, 0, 0.9411765, 1,
0.9879109, 2.410464, 0.6981922, 1, 0, 0.9372549, 1,
0.9880829, -1.703267, 3.719614, 1, 0, 0.9294118, 1,
0.9921104, 1.202773, 0.8367965, 1, 0, 0.9254902, 1,
0.9973857, 0.3039112, 3.546747, 1, 0, 0.9176471, 1,
1.004458, 0.7761176, -0.4856631, 1, 0, 0.9137255, 1,
1.013713, 0.4049772, 1.831501, 1, 0, 0.9058824, 1,
1.014796, 0.1203864, 1.97333, 1, 0, 0.9019608, 1,
1.015024, 0.349297, -0.4686337, 1, 0, 0.8941177, 1,
1.015231, 0.215624, 1.392865, 1, 0, 0.8862745, 1,
1.026917, -0.3178709, 3.444831, 1, 0, 0.8823529, 1,
1.029925, 1.009754, -1.239227, 1, 0, 0.8745098, 1,
1.03431, -1.356117, 1.188738, 1, 0, 0.8705882, 1,
1.040289, -0.126326, 2.423616, 1, 0, 0.8627451, 1,
1.041387, -0.6082664, 1.467843, 1, 0, 0.8588235, 1,
1.041919, -1.451754, 2.148513, 1, 0, 0.8509804, 1,
1.042257, 1.311603, -0.7395598, 1, 0, 0.8470588, 1,
1.043911, -1.679815, 3.414262, 1, 0, 0.8392157, 1,
1.051057, -0.0431327, 0.940164, 1, 0, 0.8352941, 1,
1.056117, -0.0442527, 3.050609, 1, 0, 0.827451, 1,
1.059793, 0.8854938, 2.390278, 1, 0, 0.8235294, 1,
1.061264, 1.44575, 0.9644292, 1, 0, 0.8156863, 1,
1.062206, -0.1117884, 2.643175, 1, 0, 0.8117647, 1,
1.066059, -1.158614, 2.092209, 1, 0, 0.8039216, 1,
1.081165, -0.1388218, 2.638164, 1, 0, 0.7960784, 1,
1.081432, 0.6586349, 0.5448339, 1, 0, 0.7921569, 1,
1.083823, -1.060367, 1.029558, 1, 0, 0.7843137, 1,
1.084299, -2.428267, 3.47756, 1, 0, 0.7803922, 1,
1.096758, 0.4793801, 1.759786, 1, 0, 0.772549, 1,
1.108316, 1.433379, 0.6413556, 1, 0, 0.7686275, 1,
1.11352, -0.3967253, 0.308961, 1, 0, 0.7607843, 1,
1.115885, -2.099982, 3.356246, 1, 0, 0.7568628, 1,
1.116205, -0.4136781, 2.032806, 1, 0, 0.7490196, 1,
1.118233, -0.3441546, -0.07595388, 1, 0, 0.7450981, 1,
1.11956, 0.76836, 1.024031, 1, 0, 0.7372549, 1,
1.125137, 0.2101291, 3.044574, 1, 0, 0.7333333, 1,
1.126658, -0.08451632, 1.255085, 1, 0, 0.7254902, 1,
1.135175, -0.8560603, 2.691837, 1, 0, 0.7215686, 1,
1.14131, -1.756682, 1.961234, 1, 0, 0.7137255, 1,
1.141552, 0.1188017, 2.333351, 1, 0, 0.7098039, 1,
1.148321, 2.290794, -0.2983697, 1, 0, 0.7019608, 1,
1.171405, -2.310328, 5.263561, 1, 0, 0.6941177, 1,
1.173, -0.1573108, 1.784412, 1, 0, 0.6901961, 1,
1.199711, -0.03758964, 3.741723, 1, 0, 0.682353, 1,
1.212895, 0.5443514, 1.066498, 1, 0, 0.6784314, 1,
1.217946, 0.3069693, 2.102115, 1, 0, 0.6705883, 1,
1.219711, -0.9975722, 3.260976, 1, 0, 0.6666667, 1,
1.223356, -0.3797932, 1.345962, 1, 0, 0.6588235, 1,
1.240949, -0.874155, 0.5254272, 1, 0, 0.654902, 1,
1.258406, -1.950428, 3.808261, 1, 0, 0.6470588, 1,
1.267327, 1.04106, 0.3375604, 1, 0, 0.6431373, 1,
1.271862, 1.110769, 1.595802, 1, 0, 0.6352941, 1,
1.272503, -0.973352, 0.2798144, 1, 0, 0.6313726, 1,
1.297357, -0.2317677, 2.0194, 1, 0, 0.6235294, 1,
1.297894, -0.968413, 2.054807, 1, 0, 0.6196079, 1,
1.300384, 0.1624053, 2.399766, 1, 0, 0.6117647, 1,
1.305414, -1.102439, 2.520139, 1, 0, 0.6078432, 1,
1.306801, 0.8484903, 0.6264362, 1, 0, 0.6, 1,
1.311462, 0.356614, -0.2374291, 1, 0, 0.5921569, 1,
1.311752, -0.3400874, 3.104349, 1, 0, 0.5882353, 1,
1.314272, -1.288157, 2.02106, 1, 0, 0.5803922, 1,
1.31996, -1.623057, 2.524827, 1, 0, 0.5764706, 1,
1.328598, -0.3294049, 1.891268, 1, 0, 0.5686275, 1,
1.332693, 1.613593, 0.5717959, 1, 0, 0.5647059, 1,
1.334314, -0.1693832, 1.799729, 1, 0, 0.5568628, 1,
1.33447, 0.8891925, -0.08255105, 1, 0, 0.5529412, 1,
1.346941, -2.231935, 2.335497, 1, 0, 0.5450981, 1,
1.348482, 0.4392842, 2.107245, 1, 0, 0.5411765, 1,
1.348855, -1.86109, 2.672874, 1, 0, 0.5333334, 1,
1.355543, -0.1722149, 0.7644873, 1, 0, 0.5294118, 1,
1.358498, 1.06035, 0.2884616, 1, 0, 0.5215687, 1,
1.35998, -0.3392912, 2.163794, 1, 0, 0.5176471, 1,
1.360947, -0.08777069, 3.526219, 1, 0, 0.509804, 1,
1.363589, -0.762717, 2.732209, 1, 0, 0.5058824, 1,
1.372553, 1.482528, 1.743227, 1, 0, 0.4980392, 1,
1.382909, 0.2381573, 1.696378, 1, 0, 0.4901961, 1,
1.418465, 0.07008485, 0.37195, 1, 0, 0.4862745, 1,
1.426489, -1.298358, 2.61399, 1, 0, 0.4784314, 1,
1.430524, 0.6682112, 1.408722, 1, 0, 0.4745098, 1,
1.435237, 0.181885, 1.12733, 1, 0, 0.4666667, 1,
1.43609, 1.030136, 1.86937, 1, 0, 0.4627451, 1,
1.447997, -0.6881694, 1.502004, 1, 0, 0.454902, 1,
1.453293, -1.03861, 2.553275, 1, 0, 0.4509804, 1,
1.512291, 0.7770886, 1.762942, 1, 0, 0.4431373, 1,
1.513939, -0.4529268, 1.102295, 1, 0, 0.4392157, 1,
1.520662, -0.3908988, 2.035065, 1, 0, 0.4313726, 1,
1.532024, 0.5114796, 0.4920024, 1, 0, 0.427451, 1,
1.537868, -0.7402044, 0.4686772, 1, 0, 0.4196078, 1,
1.539312, -0.6615694, 1.702836, 1, 0, 0.4156863, 1,
1.547883, -0.7776027, 1.327303, 1, 0, 0.4078431, 1,
1.550217, -0.2115049, 1.432738, 1, 0, 0.4039216, 1,
1.556606, 0.478, 1.263111, 1, 0, 0.3960784, 1,
1.574648, -1.282787, 2.389597, 1, 0, 0.3882353, 1,
1.592602, -0.1265515, 2.352949, 1, 0, 0.3843137, 1,
1.595622, -1.543287, 2.269551, 1, 0, 0.3764706, 1,
1.604303, 1.42296, 0.7421628, 1, 0, 0.372549, 1,
1.638161, 0.8889274, -0.3997867, 1, 0, 0.3647059, 1,
1.639304, -2.645458, 2.496616, 1, 0, 0.3607843, 1,
1.650165, -0.4937328, 2.311708, 1, 0, 0.3529412, 1,
1.653497, 1.164779, 1.082402, 1, 0, 0.3490196, 1,
1.655787, 0.7843531, 0.9874601, 1, 0, 0.3411765, 1,
1.682658, -0.5643903, 2.972846, 1, 0, 0.3372549, 1,
1.685387, 0.5468964, 2.061683, 1, 0, 0.3294118, 1,
1.711128, -0.002276321, 1.530599, 1, 0, 0.3254902, 1,
1.715255, -1.839328, 2.414132, 1, 0, 0.3176471, 1,
1.72032, -0.4714693, 1.093057, 1, 0, 0.3137255, 1,
1.737359, 1.276195, 0.7494596, 1, 0, 0.3058824, 1,
1.747997, -0.4884627, 1.953633, 1, 0, 0.2980392, 1,
1.753731, -0.2809354, 0.9835978, 1, 0, 0.2941177, 1,
1.766113, 0.6135663, -0.6206087, 1, 0, 0.2862745, 1,
1.766264, -0.4034005, 1.861812, 1, 0, 0.282353, 1,
1.766283, 0.1602093, 2.258005, 1, 0, 0.2745098, 1,
1.77042, -1.288949, 0.7168772, 1, 0, 0.2705882, 1,
1.774842, -1.793406, 2.134327, 1, 0, 0.2627451, 1,
1.784497, 1.240979, 1.548477, 1, 0, 0.2588235, 1,
1.795941, -1.133807, 0.3973674, 1, 0, 0.2509804, 1,
1.800219, 0.7373508, 0.3826049, 1, 0, 0.2470588, 1,
1.812294, 0.8287016, 0.3956569, 1, 0, 0.2392157, 1,
1.830968, 0.8753967, 1.611166, 1, 0, 0.2352941, 1,
1.854158, 0.5831915, -0.8197663, 1, 0, 0.227451, 1,
1.877129, -0.4612407, 1.661162, 1, 0, 0.2235294, 1,
1.880206, 0.7385082, 1.276927, 1, 0, 0.2156863, 1,
1.892129, -0.1753324, 1.552601, 1, 0, 0.2117647, 1,
1.893069, 0.6997067, 1.547244, 1, 0, 0.2039216, 1,
1.906889, 1.914596, -0.222205, 1, 0, 0.1960784, 1,
1.939353, -0.9178889, 4.140447, 1, 0, 0.1921569, 1,
1.945671, 1.24459, 0.02750747, 1, 0, 0.1843137, 1,
1.955622, 0.4671571, 1.158557, 1, 0, 0.1803922, 1,
1.961082, 0.7405813, 1.739945, 1, 0, 0.172549, 1,
1.986728, 0.5167469, 2.340246, 1, 0, 0.1686275, 1,
2.034335, -0.6427779, 1.737687, 1, 0, 0.1607843, 1,
2.078864, 1.813045, 1.300379, 1, 0, 0.1568628, 1,
2.102068, 0.7239792, 0.05953333, 1, 0, 0.1490196, 1,
2.138021, 0.7564254, 0.2220969, 1, 0, 0.145098, 1,
2.155671, -0.07001676, 2.937477, 1, 0, 0.1372549, 1,
2.169259, -1.096718, 2.738839, 1, 0, 0.1333333, 1,
2.261423, -0.03964502, 3.043426, 1, 0, 0.1254902, 1,
2.270659, -0.4562835, 3.19975, 1, 0, 0.1215686, 1,
2.334392, -0.6830599, 1.369319, 1, 0, 0.1137255, 1,
2.335318, 1.303429, 1.250064, 1, 0, 0.1098039, 1,
2.342041, -0.4009318, 1.017958, 1, 0, 0.1019608, 1,
2.350348, -0.9405962, 3.01725, 1, 0, 0.09411765, 1,
2.357277, -1.319486, 2.312095, 1, 0, 0.09019608, 1,
2.389285, -0.7378866, 1.20965, 1, 0, 0.08235294, 1,
2.524309, 0.04648965, 1.409341, 1, 0, 0.07843138, 1,
2.525461, -0.8529775, 2.61635, 1, 0, 0.07058824, 1,
2.558643, -1.543506, 2.360839, 1, 0, 0.06666667, 1,
2.642342, 0.2734055, 1.792007, 1, 0, 0.05882353, 1,
2.647898, 1.267958, 2.849307, 1, 0, 0.05490196, 1,
2.673597, -0.7815177, 0.8074027, 1, 0, 0.04705882, 1,
2.729245, -0.09939954, 0.9676681, 1, 0, 0.04313726, 1,
2.784941, -1.125706, 2.247486, 1, 0, 0.03529412, 1,
2.816572, -0.4530813, 1.769837, 1, 0, 0.03137255, 1,
2.947485, 1.872495, 1.469864, 1, 0, 0.02352941, 1,
3.0082, -0.3369437, 0.9252207, 1, 0, 0.01960784, 1,
3.09947, 0.3350207, 2.762327, 1, 0, 0.01176471, 1,
3.138338, 0.4268019, 2.507916, 1, 0, 0.007843138, 1
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
0.1103449, -4.57069, -6.829696, 0, -0.5, 0.5, 0.5,
0.1103449, -4.57069, -6.829696, 1, -0.5, 0.5, 0.5,
0.1103449, -4.57069, -6.829696, 1, 1.5, 0.5, 0.5,
0.1103449, -4.57069, -6.829696, 0, 1.5, 0.5, 0.5
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
-3.944138, 0.07276845, -6.829696, 0, -0.5, 0.5, 0.5,
-3.944138, 0.07276845, -6.829696, 1, -0.5, 0.5, 0.5,
-3.944138, 0.07276845, -6.829696, 1, 1.5, 0.5, 0.5,
-3.944138, 0.07276845, -6.829696, 0, 1.5, 0.5, 0.5
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
-3.944138, -4.57069, 0.1043937, 0, -0.5, 0.5, 0.5,
-3.944138, -4.57069, 0.1043937, 1, -0.5, 0.5, 0.5,
-3.944138, -4.57069, 0.1043937, 1, 1.5, 0.5, 0.5,
-3.944138, -4.57069, 0.1043937, 0, 1.5, 0.5, 0.5
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
-2, -3.499122, -5.229522,
3, -3.499122, -5.229522,
-2, -3.499122, -5.229522,
-2, -3.677717, -5.496217,
-1, -3.499122, -5.229522,
-1, -3.677717, -5.496217,
0, -3.499122, -5.229522,
0, -3.677717, -5.496217,
1, -3.499122, -5.229522,
1, -3.677717, -5.496217,
2, -3.499122, -5.229522,
2, -3.677717, -5.496217,
3, -3.499122, -5.229522,
3, -3.677717, -5.496217
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
-2, -4.034906, -6.029609, 0, -0.5, 0.5, 0.5,
-2, -4.034906, -6.029609, 1, -0.5, 0.5, 0.5,
-2, -4.034906, -6.029609, 1, 1.5, 0.5, 0.5,
-2, -4.034906, -6.029609, 0, 1.5, 0.5, 0.5,
-1, -4.034906, -6.029609, 0, -0.5, 0.5, 0.5,
-1, -4.034906, -6.029609, 1, -0.5, 0.5, 0.5,
-1, -4.034906, -6.029609, 1, 1.5, 0.5, 0.5,
-1, -4.034906, -6.029609, 0, 1.5, 0.5, 0.5,
0, -4.034906, -6.029609, 0, -0.5, 0.5, 0.5,
0, -4.034906, -6.029609, 1, -0.5, 0.5, 0.5,
0, -4.034906, -6.029609, 1, 1.5, 0.5, 0.5,
0, -4.034906, -6.029609, 0, 1.5, 0.5, 0.5,
1, -4.034906, -6.029609, 0, -0.5, 0.5, 0.5,
1, -4.034906, -6.029609, 1, -0.5, 0.5, 0.5,
1, -4.034906, -6.029609, 1, 1.5, 0.5, 0.5,
1, -4.034906, -6.029609, 0, 1.5, 0.5, 0.5,
2, -4.034906, -6.029609, 0, -0.5, 0.5, 0.5,
2, -4.034906, -6.029609, 1, -0.5, 0.5, 0.5,
2, -4.034906, -6.029609, 1, 1.5, 0.5, 0.5,
2, -4.034906, -6.029609, 0, 1.5, 0.5, 0.5,
3, -4.034906, -6.029609, 0, -0.5, 0.5, 0.5,
3, -4.034906, -6.029609, 1, -0.5, 0.5, 0.5,
3, -4.034906, -6.029609, 1, 1.5, 0.5, 0.5,
3, -4.034906, -6.029609, 0, 1.5, 0.5, 0.5
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
-3.008488, -3, -5.229522,
-3.008488, 3, -5.229522,
-3.008488, -3, -5.229522,
-3.16443, -3, -5.496217,
-3.008488, -2, -5.229522,
-3.16443, -2, -5.496217,
-3.008488, -1, -5.229522,
-3.16443, -1, -5.496217,
-3.008488, 0, -5.229522,
-3.16443, 0, -5.496217,
-3.008488, 1, -5.229522,
-3.16443, 1, -5.496217,
-3.008488, 2, -5.229522,
-3.16443, 2, -5.496217,
-3.008488, 3, -5.229522,
-3.16443, 3, -5.496217
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
-3.476313, -3, -6.029609, 0, -0.5, 0.5, 0.5,
-3.476313, -3, -6.029609, 1, -0.5, 0.5, 0.5,
-3.476313, -3, -6.029609, 1, 1.5, 0.5, 0.5,
-3.476313, -3, -6.029609, 0, 1.5, 0.5, 0.5,
-3.476313, -2, -6.029609, 0, -0.5, 0.5, 0.5,
-3.476313, -2, -6.029609, 1, -0.5, 0.5, 0.5,
-3.476313, -2, -6.029609, 1, 1.5, 0.5, 0.5,
-3.476313, -2, -6.029609, 0, 1.5, 0.5, 0.5,
-3.476313, -1, -6.029609, 0, -0.5, 0.5, 0.5,
-3.476313, -1, -6.029609, 1, -0.5, 0.5, 0.5,
-3.476313, -1, -6.029609, 1, 1.5, 0.5, 0.5,
-3.476313, -1, -6.029609, 0, 1.5, 0.5, 0.5,
-3.476313, 0, -6.029609, 0, -0.5, 0.5, 0.5,
-3.476313, 0, -6.029609, 1, -0.5, 0.5, 0.5,
-3.476313, 0, -6.029609, 1, 1.5, 0.5, 0.5,
-3.476313, 0, -6.029609, 0, 1.5, 0.5, 0.5,
-3.476313, 1, -6.029609, 0, -0.5, 0.5, 0.5,
-3.476313, 1, -6.029609, 1, -0.5, 0.5, 0.5,
-3.476313, 1, -6.029609, 1, 1.5, 0.5, 0.5,
-3.476313, 1, -6.029609, 0, 1.5, 0.5, 0.5,
-3.476313, 2, -6.029609, 0, -0.5, 0.5, 0.5,
-3.476313, 2, -6.029609, 1, -0.5, 0.5, 0.5,
-3.476313, 2, -6.029609, 1, 1.5, 0.5, 0.5,
-3.476313, 2, -6.029609, 0, 1.5, 0.5, 0.5,
-3.476313, 3, -6.029609, 0, -0.5, 0.5, 0.5,
-3.476313, 3, -6.029609, 1, -0.5, 0.5, 0.5,
-3.476313, 3, -6.029609, 1, 1.5, 0.5, 0.5,
-3.476313, 3, -6.029609, 0, 1.5, 0.5, 0.5
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
-3.008488, -3.499122, -4,
-3.008488, -3.499122, 4,
-3.008488, -3.499122, -4,
-3.16443, -3.677717, -4,
-3.008488, -3.499122, -2,
-3.16443, -3.677717, -2,
-3.008488, -3.499122, 0,
-3.16443, -3.677717, 0,
-3.008488, -3.499122, 2,
-3.16443, -3.677717, 2,
-3.008488, -3.499122, 4,
-3.16443, -3.677717, 4
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
-3.476313, -4.034906, -4, 0, -0.5, 0.5, 0.5,
-3.476313, -4.034906, -4, 1, -0.5, 0.5, 0.5,
-3.476313, -4.034906, -4, 1, 1.5, 0.5, 0.5,
-3.476313, -4.034906, -4, 0, 1.5, 0.5, 0.5,
-3.476313, -4.034906, -2, 0, -0.5, 0.5, 0.5,
-3.476313, -4.034906, -2, 1, -0.5, 0.5, 0.5,
-3.476313, -4.034906, -2, 1, 1.5, 0.5, 0.5,
-3.476313, -4.034906, -2, 0, 1.5, 0.5, 0.5,
-3.476313, -4.034906, 0, 0, -0.5, 0.5, 0.5,
-3.476313, -4.034906, 0, 1, -0.5, 0.5, 0.5,
-3.476313, -4.034906, 0, 1, 1.5, 0.5, 0.5,
-3.476313, -4.034906, 0, 0, 1.5, 0.5, 0.5,
-3.476313, -4.034906, 2, 0, -0.5, 0.5, 0.5,
-3.476313, -4.034906, 2, 1, -0.5, 0.5, 0.5,
-3.476313, -4.034906, 2, 1, 1.5, 0.5, 0.5,
-3.476313, -4.034906, 2, 0, 1.5, 0.5, 0.5,
-3.476313, -4.034906, 4, 0, -0.5, 0.5, 0.5,
-3.476313, -4.034906, 4, 1, -0.5, 0.5, 0.5,
-3.476313, -4.034906, 4, 1, 1.5, 0.5, 0.5,
-3.476313, -4.034906, 4, 0, 1.5, 0.5, 0.5
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
-3.008488, -3.499122, -5.229522,
-3.008488, 3.644659, -5.229522,
-3.008488, -3.499122, 5.438309,
-3.008488, 3.644659, 5.438309,
-3.008488, -3.499122, -5.229522,
-3.008488, -3.499122, 5.438309,
-3.008488, 3.644659, -5.229522,
-3.008488, 3.644659, 5.438309,
-3.008488, -3.499122, -5.229522,
3.229178, -3.499122, -5.229522,
-3.008488, -3.499122, 5.438309,
3.229178, -3.499122, 5.438309,
-3.008488, 3.644659, -5.229522,
3.229178, 3.644659, -5.229522,
-3.008488, 3.644659, 5.438309,
3.229178, 3.644659, 5.438309,
3.229178, -3.499122, -5.229522,
3.229178, 3.644659, -5.229522,
3.229178, -3.499122, 5.438309,
3.229178, 3.644659, 5.438309,
3.229178, -3.499122, -5.229522,
3.229178, -3.499122, 5.438309,
3.229178, 3.644659, -5.229522,
3.229178, 3.644659, 5.438309
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
var radius = 7.621994;
var distance = 33.91111;
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
mvMatrix.translate( -0.1103449, -0.07276845, -0.1043937 );
mvMatrix.scale( 1.321175, 1.153598, 0.7725141 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.91111);
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
cyclopentyloxy<-read.table("cyclopentyloxy.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-cyclopentyloxy$V2
```

```
## Error in eval(expr, envir, enclos): object 'cyclopentyloxy' not found
```

```r
y<-cyclopentyloxy$V3
```

```
## Error in eval(expr, envir, enclos): object 'cyclopentyloxy' not found
```

```r
z<-cyclopentyloxy$V4
```

```
## Error in eval(expr, envir, enclos): object 'cyclopentyloxy' not found
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
-2.917648, -0.9389879, -0.1711256, 0, 0, 1, 1, 1,
-2.864859, -0.04277097, -0.2910202, 1, 0, 0, 1, 1,
-2.802627, 0.4384364, -1.625467, 1, 0, 0, 1, 1,
-2.80241, -0.1574252, -1.27039, 1, 0, 0, 1, 1,
-2.746895, 0.7738175, -2.872435, 1, 0, 0, 1, 1,
-2.715316, -0.1319008, -1.313919, 1, 0, 0, 1, 1,
-2.694141, 0.2301625, -3.488348, 0, 0, 0, 1, 1,
-2.690564, -0.4169626, -2.686228, 0, 0, 0, 1, 1,
-2.66927, -0.8688511, -1.85312, 0, 0, 0, 1, 1,
-2.647766, 0.6342791, -0.3733552, 0, 0, 0, 1, 1,
-2.646554, -0.1712085, -2.256436, 0, 0, 0, 1, 1,
-2.585479, -0.1211434, -1.029614, 0, 0, 0, 1, 1,
-2.471716, 0.4342008, -3.744823, 0, 0, 0, 1, 1,
-2.422469, 0.3207909, -1.273887, 1, 1, 1, 1, 1,
-2.407882, 0.4668603, -0.9695015, 1, 1, 1, 1, 1,
-2.391505, -0.0883287, -0.8988981, 1, 1, 1, 1, 1,
-2.314063, 0.1815771, -0.8424824, 1, 1, 1, 1, 1,
-2.262932, 1.473847, -1.557067, 1, 1, 1, 1, 1,
-2.241477, -0.3830693, -0.9453702, 1, 1, 1, 1, 1,
-2.236576, -0.05904918, -0.4535618, 1, 1, 1, 1, 1,
-2.234806, -0.8947339, -2.35276, 1, 1, 1, 1, 1,
-2.213876, -0.2225808, -1.903306, 1, 1, 1, 1, 1,
-2.195849, -0.9489654, -2.271715, 1, 1, 1, 1, 1,
-2.184029, -0.8063741, -1.547025, 1, 1, 1, 1, 1,
-2.163279, 0.8387024, -2.351498, 1, 1, 1, 1, 1,
-2.113457, 0.2002958, -2.121741, 1, 1, 1, 1, 1,
-2.105195, 1.418059, -0.7901711, 1, 1, 1, 1, 1,
-2.101537, -2.766521, -1.844127, 1, 1, 1, 1, 1,
-2.071618, -1.848766, -3.294286, 0, 0, 1, 1, 1,
-2.066779, -0.4071259, -0.8323996, 1, 0, 0, 1, 1,
-2.030203, 0.2913097, -2.166282, 1, 0, 0, 1, 1,
-1.987764, -2.367414, -2.359955, 1, 0, 0, 1, 1,
-1.979548, -0.9353163, -2.554287, 1, 0, 0, 1, 1,
-1.949181, 1.011605, -0.7543506, 1, 0, 0, 1, 1,
-1.928219, -1.671565, -3.46095, 0, 0, 0, 1, 1,
-1.906569, -0.7152354, -3.697012, 0, 0, 0, 1, 1,
-1.8922, 0.5326312, -1.291662, 0, 0, 0, 1, 1,
-1.871945, 0.813702, -2.08242, 0, 0, 0, 1, 1,
-1.827996, -0.8228848, -2.579731, 0, 0, 0, 1, 1,
-1.823647, 1.132146, -1.629283, 0, 0, 0, 1, 1,
-1.822379, -0.8017992, -2.780726, 0, 0, 0, 1, 1,
-1.813174, -0.5479484, -0.5126272, 1, 1, 1, 1, 1,
-1.813038, 1.040924, -1.82502, 1, 1, 1, 1, 1,
-1.795953, -1.510945, -2.711513, 1, 1, 1, 1, 1,
-1.764632, 1.162182, -0.2329848, 1, 1, 1, 1, 1,
-1.749363, -0.6767655, -1.146248, 1, 1, 1, 1, 1,
-1.747085, -1.067415, -2.111918, 1, 1, 1, 1, 1,
-1.70955, -0.4515539, -3.281348, 1, 1, 1, 1, 1,
-1.702691, 0.7370731, -2.754653, 1, 1, 1, 1, 1,
-1.701939, 0.3866654, -0.5524449, 1, 1, 1, 1, 1,
-1.690561, -0.1110112, -0.2161214, 1, 1, 1, 1, 1,
-1.680637, 1.297732, -0.5297804, 1, 1, 1, 1, 1,
-1.675319, 0.01911888, -2.067113, 1, 1, 1, 1, 1,
-1.649237, 1.023703, -1.463519, 1, 1, 1, 1, 1,
-1.647588, -1.731172, -3.011212, 1, 1, 1, 1, 1,
-1.639948, -0.9257255, -2.510516, 1, 1, 1, 1, 1,
-1.628503, 1.108302, 0.04442409, 0, 0, 1, 1, 1,
-1.616194, -0.465956, -2.413349, 1, 0, 0, 1, 1,
-1.615859, 1.787416, 0.9784045, 1, 0, 0, 1, 1,
-1.607254, 1.892247, -0.5622318, 1, 0, 0, 1, 1,
-1.60323, -0.9486008, -1.69836, 1, 0, 0, 1, 1,
-1.591428, 1.07093, -0.115386, 1, 0, 0, 1, 1,
-1.575788, 0.1545233, -0.493791, 0, 0, 0, 1, 1,
-1.573833, -0.04345722, -0.1754918, 0, 0, 0, 1, 1,
-1.564197, -0.4106745, -1.104439, 0, 0, 0, 1, 1,
-1.563759, 1.692032, 0.9641528, 0, 0, 0, 1, 1,
-1.547132, -0.7908578, -1.651018, 0, 0, 0, 1, 1,
-1.54404, -0.3588098, -1.998158, 0, 0, 0, 1, 1,
-1.531758, 1.018365, 1.093325, 0, 0, 0, 1, 1,
-1.521504, -0.1622422, -2.678668, 1, 1, 1, 1, 1,
-1.518687, -0.4787351, -2.191385, 1, 1, 1, 1, 1,
-1.510428, 0.5163912, -1.27481, 1, 1, 1, 1, 1,
-1.497755, 0.4763162, -2.743893, 1, 1, 1, 1, 1,
-1.496501, -0.9875038, -3.671744, 1, 1, 1, 1, 1,
-1.495196, -1.558506, -2.263689, 1, 1, 1, 1, 1,
-1.485312, -0.4371772, -3.401488, 1, 1, 1, 1, 1,
-1.485236, -2.504744, -3.02989, 1, 1, 1, 1, 1,
-1.483053, -0.617993, -0.4585484, 1, 1, 1, 1, 1,
-1.472028, 1.565864, 1.023596, 1, 1, 1, 1, 1,
-1.4685, 0.1122668, -1.355794, 1, 1, 1, 1, 1,
-1.465403, -0.1123288, -2.167724, 1, 1, 1, 1, 1,
-1.465147, -0.5460116, -0.09516458, 1, 1, 1, 1, 1,
-1.456206, 0.5011201, -3.862267, 1, 1, 1, 1, 1,
-1.434906, -1.19781, -1.469724, 1, 1, 1, 1, 1,
-1.40341, 0.8289415, -1.329651, 0, 0, 1, 1, 1,
-1.39025, 1.230843, -0.6999038, 1, 0, 0, 1, 1,
-1.382856, -1.472461, -2.364629, 1, 0, 0, 1, 1,
-1.37918, 0.4165235, -1.364674, 1, 0, 0, 1, 1,
-1.37279, 1.124609, -1.096097, 1, 0, 0, 1, 1,
-1.369056, -1.387458, -1.817538, 1, 0, 0, 1, 1,
-1.36267, -1.044893, -2.302486, 0, 0, 0, 1, 1,
-1.359626, 0.6170558, 0.1448819, 0, 0, 0, 1, 1,
-1.354521, -0.6793686, -1.874943, 0, 0, 0, 1, 1,
-1.34087, 0.7917273, -1.984244, 0, 0, 0, 1, 1,
-1.338622, 0.1926654, -1.900228, 0, 0, 0, 1, 1,
-1.333705, -0.6722339, -2.161175, 0, 0, 0, 1, 1,
-1.330874, -0.06534099, -3.500955, 0, 0, 0, 1, 1,
-1.329454, -0.8589724, -3.284029, 1, 1, 1, 1, 1,
-1.329229, -0.3406644, -0.0005129861, 1, 1, 1, 1, 1,
-1.327841, -0.1433721, -2.593263, 1, 1, 1, 1, 1,
-1.316748, 1.120254, -1.549296, 1, 1, 1, 1, 1,
-1.310806, -2.043791, -3.320835, 1, 1, 1, 1, 1,
-1.280607, -0.5464824, -2.98975, 1, 1, 1, 1, 1,
-1.28023, -1.431496, -2.940776, 1, 1, 1, 1, 1,
-1.278995, -0.9849716, -1.473885, 1, 1, 1, 1, 1,
-1.277343, 0.5786124, -0.11766, 1, 1, 1, 1, 1,
-1.272962, 0.2925853, -1.390422, 1, 1, 1, 1, 1,
-1.272263, -1.038537, -2.347346, 1, 1, 1, 1, 1,
-1.26899, 0.0008840984, -1.384366, 1, 1, 1, 1, 1,
-1.268762, 0.6587921, -0.991589, 1, 1, 1, 1, 1,
-1.265122, 1.003599, -1.22386, 1, 1, 1, 1, 1,
-1.264267, -0.5534571, -0.8425899, 1, 1, 1, 1, 1,
-1.260753, 0.04708029, -0.8333294, 0, 0, 1, 1, 1,
-1.246665, -1.211104, -2.405632, 1, 0, 0, 1, 1,
-1.2418, -0.7671838, -1.159816, 1, 0, 0, 1, 1,
-1.218829, 0.8266363, -1.773622, 1, 0, 0, 1, 1,
-1.215474, 0.6339324, -0.04205137, 1, 0, 0, 1, 1,
-1.214718, -0.1268621, -1.869371, 1, 0, 0, 1, 1,
-1.20729, 1.514472, -0.5025313, 0, 0, 0, 1, 1,
-1.206317, -0.9239683, -1.563085, 0, 0, 0, 1, 1,
-1.202408, -0.6232653, -2.609264, 0, 0, 0, 1, 1,
-1.200652, -0.01487306, -0.5262721, 0, 0, 0, 1, 1,
-1.194499, 0.1334591, -0.4229496, 0, 0, 0, 1, 1,
-1.192847, 1.986605, 0.7626126, 0, 0, 0, 1, 1,
-1.188494, 0.01669428, -2.263642, 0, 0, 0, 1, 1,
-1.180647, 0.6541608, -0.05241986, 1, 1, 1, 1, 1,
-1.180053, 1.128993, -1.196726, 1, 1, 1, 1, 1,
-1.174657, 1.379224, -0.5903335, 1, 1, 1, 1, 1,
-1.164744, -1.208765, -2.673336, 1, 1, 1, 1, 1,
-1.164731, 0.5518326, -3.45765, 1, 1, 1, 1, 1,
-1.159632, 0.9180503, -1.897437, 1, 1, 1, 1, 1,
-1.15951, -1.396093, -2.238729, 1, 1, 1, 1, 1,
-1.158767, -0.7794411, -0.808722, 1, 1, 1, 1, 1,
-1.154545, 1.1127, -0.9707068, 1, 1, 1, 1, 1,
-1.153038, 0.6856233, -1.388067, 1, 1, 1, 1, 1,
-1.152964, 1.810777, 0.5077375, 1, 1, 1, 1, 1,
-1.148035, 1.020025, -0.6838487, 1, 1, 1, 1, 1,
-1.143389, 1.459969, 0.01103628, 1, 1, 1, 1, 1,
-1.131669, -0.5916303, -0.8321112, 1, 1, 1, 1, 1,
-1.126678, -0.4797547, -2.333153, 1, 1, 1, 1, 1,
-1.124524, -0.9598232, -2.686258, 0, 0, 1, 1, 1,
-1.123401, -0.1691313, -1.115513, 1, 0, 0, 1, 1,
-1.12002, -0.5942159, -0.6229196, 1, 0, 0, 1, 1,
-1.11798, -0.4332822, -2.41841, 1, 0, 0, 1, 1,
-1.117382, -0.7248, -3.301212, 1, 0, 0, 1, 1,
-1.11283, 2.646862, -0.2186411, 1, 0, 0, 1, 1,
-1.110095, -0.3815094, -0.2706982, 0, 0, 0, 1, 1,
-1.096641, 0.2087648, 0.5904244, 0, 0, 0, 1, 1,
-1.096147, -1.708301, -3.56174, 0, 0, 0, 1, 1,
-1.087857, -2.175077, -1.658798, 0, 0, 0, 1, 1,
-1.079781, -1.21729, -0.9974147, 0, 0, 0, 1, 1,
-1.0772, -0.1800786, -1.47886, 0, 0, 0, 1, 1,
-1.075714, -0.2856159, -1.451033, 0, 0, 0, 1, 1,
-1.054433, -0.142338, -0.8488619, 1, 1, 1, 1, 1,
-1.052769, -1.285575, -1.649958, 1, 1, 1, 1, 1,
-1.045187, -0.7441764, -1.535355, 1, 1, 1, 1, 1,
-1.044884, -1.104615, -0.7647007, 1, 1, 1, 1, 1,
-1.041319, 0.1228096, -1.600789, 1, 1, 1, 1, 1,
-1.038835, 2.269013, -0.1586874, 1, 1, 1, 1, 1,
-1.032233, 0.1533956, -0.7957367, 1, 1, 1, 1, 1,
-1.030583, 0.9419193, -1.133566, 1, 1, 1, 1, 1,
-1.016349, -1.238863, -2.662215, 1, 1, 1, 1, 1,
-1.016299, 1.06579, 0.2224267, 1, 1, 1, 1, 1,
-1.005691, -0.2694132, -2.877227, 1, 1, 1, 1, 1,
-1.005306, 0.6318058, -0.2813264, 1, 1, 1, 1, 1,
-1.00332, 0.04731165, -1.538758, 1, 1, 1, 1, 1,
-1.001844, 0.6791961, -0.8112611, 1, 1, 1, 1, 1,
-0.9986844, 0.07383417, -0.353231, 1, 1, 1, 1, 1,
-0.9761418, 1.047846, 0.7512221, 0, 0, 1, 1, 1,
-0.97594, -0.3560398, -2.02027, 1, 0, 0, 1, 1,
-0.9730563, -0.1539261, -1.116379, 1, 0, 0, 1, 1,
-0.9699759, -1.817919, -2.343019, 1, 0, 0, 1, 1,
-0.9690064, 1.30557, -1.209789, 1, 0, 0, 1, 1,
-0.9687999, -0.3884346, -1.544339, 1, 0, 0, 1, 1,
-0.9667884, 0.5723316, -0.457911, 0, 0, 0, 1, 1,
-0.9651197, 1.021294, -0.9450681, 0, 0, 0, 1, 1,
-0.9554837, 0.2530542, -3.21591, 0, 0, 0, 1, 1,
-0.9551135, -1.067351, -3.002006, 0, 0, 0, 1, 1,
-0.9547861, 1.119373, -1.674745, 0, 0, 0, 1, 1,
-0.9499522, -0.4497382, -0.9618208, 0, 0, 0, 1, 1,
-0.9489931, -0.9466729, -3.604323, 0, 0, 0, 1, 1,
-0.9434913, 0.2087654, -0.9335881, 1, 1, 1, 1, 1,
-0.9419913, 0.5603568, -0.8103139, 1, 1, 1, 1, 1,
-0.9315777, 0.2891518, -1.373332, 1, 1, 1, 1, 1,
-0.9293728, -0.4598349, -2.387173, 1, 1, 1, 1, 1,
-0.9243805, 0.7927575, -0.2838793, 1, 1, 1, 1, 1,
-0.9231352, 0.2947907, 0.1527815, 1, 1, 1, 1, 1,
-0.91856, 0.09152871, -1.300497, 1, 1, 1, 1, 1,
-0.9128398, 1.724604, 0.1357071, 1, 1, 1, 1, 1,
-0.9088917, 0.9465373, -0.3076462, 1, 1, 1, 1, 1,
-0.904423, -0.1801476, -1.499491, 1, 1, 1, 1, 1,
-0.9011338, -1.564228, -2.996748, 1, 1, 1, 1, 1,
-0.899672, -0.08703747, -3.269623, 1, 1, 1, 1, 1,
-0.8985963, 0.7806347, -1.613461, 1, 1, 1, 1, 1,
-0.8926091, 0.9383869, 0.7391562, 1, 1, 1, 1, 1,
-0.8909996, -0.7258443, -2.571404, 1, 1, 1, 1, 1,
-0.8871019, -0.9169289, -1.711512, 0, 0, 1, 1, 1,
-0.8867924, -1.096414, -2.070943, 1, 0, 0, 1, 1,
-0.8811359, -0.6964473, -4.281878, 1, 0, 0, 1, 1,
-0.8754663, 0.05894678, -2.34315, 1, 0, 0, 1, 1,
-0.8726484, -0.52011, -1.804591, 1, 0, 0, 1, 1,
-0.8704748, -0.8223546, -1.938882, 1, 0, 0, 1, 1,
-0.8598115, 0.2712868, -0.642498, 0, 0, 0, 1, 1,
-0.8568574, -0.2414378, -2.372847, 0, 0, 0, 1, 1,
-0.8565115, 0.8315452, -0.9926426, 0, 0, 0, 1, 1,
-0.8525059, 0.8904831, -1.685671, 0, 0, 0, 1, 1,
-0.8442959, 1.152914, 0.5570924, 0, 0, 0, 1, 1,
-0.8433784, -1.173294, -1.687683, 0, 0, 0, 1, 1,
-0.8422316, 0.466828, -0.8317975, 0, 0, 0, 1, 1,
-0.8314984, -0.8229328, -3.972266, 1, 1, 1, 1, 1,
-0.8298322, -0.08845508, -1.182121, 1, 1, 1, 1, 1,
-0.8238626, 0.6229076, 0.05358217, 1, 1, 1, 1, 1,
-0.8128789, 0.6262263, 0.526283, 1, 1, 1, 1, 1,
-0.8073254, -0.2104789, -2.434249, 1, 1, 1, 1, 1,
-0.8052861, -0.2378759, -0.8075111, 1, 1, 1, 1, 1,
-0.8052654, 0.04294324, -0.1802885, 1, 1, 1, 1, 1,
-0.7992498, 1.491997, -0.9209152, 1, 1, 1, 1, 1,
-0.7975987, 0.8519087, -0.2246011, 1, 1, 1, 1, 1,
-0.7900003, 0.4208301, -4.142077, 1, 1, 1, 1, 1,
-0.7899552, 0.5190888, -0.9061329, 1, 1, 1, 1, 1,
-0.7883322, -0.8241441, -1.234069, 1, 1, 1, 1, 1,
-0.7878589, 0.03510259, -1.321057, 1, 1, 1, 1, 1,
-0.7877231, -0.01560513, -1.384875, 1, 1, 1, 1, 1,
-0.7843213, -0.513687, -2.499614, 1, 1, 1, 1, 1,
-0.7833058, 0.3465176, -1.585181, 0, 0, 1, 1, 1,
-0.7609273, -0.4946294, -3.567348, 1, 0, 0, 1, 1,
-0.7549113, -1.097801, -2.559819, 1, 0, 0, 1, 1,
-0.7544671, -0.4253117, -2.218346, 1, 0, 0, 1, 1,
-0.7333297, 0.5567093, -0.6873996, 1, 0, 0, 1, 1,
-0.7298173, 1.625298, 0.4592981, 1, 0, 0, 1, 1,
-0.7288117, 1.018407, -2.191278, 0, 0, 0, 1, 1,
-0.7285931, 0.3948683, -0.6091292, 0, 0, 0, 1, 1,
-0.7284401, -0.7861043, -2.056853, 0, 0, 0, 1, 1,
-0.7253828, 0.1174747, -0.8994081, 0, 0, 0, 1, 1,
-0.7210597, -0.4310749, -2.293682, 0, 0, 0, 1, 1,
-0.7206946, -0.3524995, -2.54174, 0, 0, 0, 1, 1,
-0.719001, -0.4576064, -2.382082, 0, 0, 0, 1, 1,
-0.7183279, 0.5424086, -1.101865, 1, 1, 1, 1, 1,
-0.7118984, -0.31484, -3.080342, 1, 1, 1, 1, 1,
-0.7117776, -0.5725906, -1.392442, 1, 1, 1, 1, 1,
-0.7092992, 0.07850956, -2.99403, 1, 1, 1, 1, 1,
-0.7092389, -0.9634126, -0.914364, 1, 1, 1, 1, 1,
-0.704345, -0.6243939, -1.040623, 1, 1, 1, 1, 1,
-0.6969903, 0.2045687, -0.7744877, 1, 1, 1, 1, 1,
-0.6943432, -1.170835, -3.587075, 1, 1, 1, 1, 1,
-0.6877009, -1.741563, -0.7706437, 1, 1, 1, 1, 1,
-0.6860155, 0.3231084, -0.599108, 1, 1, 1, 1, 1,
-0.6859533, 0.4720529, -2.126409, 1, 1, 1, 1, 1,
-0.6843649, 0.5583928, -0.02412192, 1, 1, 1, 1, 1,
-0.6794443, -1.020206, -1.327256, 1, 1, 1, 1, 1,
-0.6781169, -0.05161545, -2.422859, 1, 1, 1, 1, 1,
-0.6761953, -0.09465032, -0.8333167, 1, 1, 1, 1, 1,
-0.6744382, -0.450336, -2.825269, 0, 0, 1, 1, 1,
-0.6660888, 1.462255, -0.1430239, 1, 0, 0, 1, 1,
-0.6647083, 0.6083836, -1.627097, 1, 0, 0, 1, 1,
-0.6628839, -0.7486708, -1.355536, 1, 0, 0, 1, 1,
-0.6610537, 1.028876, 0.801724, 1, 0, 0, 1, 1,
-0.6607921, -0.503512, -1.251761, 1, 0, 0, 1, 1,
-0.6591948, 0.4078996, -2.472125, 0, 0, 0, 1, 1,
-0.6564284, -0.2941849, -1.234196, 0, 0, 0, 1, 1,
-0.6480075, -0.7302647, -3.04361, 0, 0, 0, 1, 1,
-0.6473601, -0.6383678, -2.067633, 0, 0, 0, 1, 1,
-0.638941, -1.154418, -2.070015, 0, 0, 0, 1, 1,
-0.6369045, 0.003536566, 0.2831649, 0, 0, 0, 1, 1,
-0.6296688, -0.6300334, -2.98047, 0, 0, 0, 1, 1,
-0.6251206, -0.4729159, -2.083955, 1, 1, 1, 1, 1,
-0.6240609, -0.6346487, -2.492133, 1, 1, 1, 1, 1,
-0.6172881, 1.331709, 0.05992184, 1, 1, 1, 1, 1,
-0.6101115, 1.488215, 0.0530455, 1, 1, 1, 1, 1,
-0.6069589, -0.8056976, -3.18541, 1, 1, 1, 1, 1,
-0.6008844, -1.354114, -1.237199, 1, 1, 1, 1, 1,
-0.5988452, 0.1791741, -1.594748, 1, 1, 1, 1, 1,
-0.5984426, -0.7246071, -3.715498, 1, 1, 1, 1, 1,
-0.5974011, -0.08434626, -2.6178, 1, 1, 1, 1, 1,
-0.5964168, -1.083529, -3.268091, 1, 1, 1, 1, 1,
-0.5956395, -1.570021, -3.227391, 1, 1, 1, 1, 1,
-0.5948009, -1.713679, -2.954978, 1, 1, 1, 1, 1,
-0.592593, -0.2269659, 0.06054821, 1, 1, 1, 1, 1,
-0.5907204, 0.5865382, -0.5345004, 1, 1, 1, 1, 1,
-0.5897943, -0.1267725, -0.9728579, 1, 1, 1, 1, 1,
-0.5855879, -1.321685, -3.392821, 0, 0, 1, 1, 1,
-0.5833239, -1.488516, -2.061358, 1, 0, 0, 1, 1,
-0.5791026, 1.185243, -1.234482, 1, 0, 0, 1, 1,
-0.5764469, -0.8334149, -2.298361, 1, 0, 0, 1, 1,
-0.5748592, 2.612288, 0.06484536, 1, 0, 0, 1, 1,
-0.5644546, 0.1315791, 0.06195536, 1, 0, 0, 1, 1,
-0.5608265, -0.638326, -2.230636, 0, 0, 0, 1, 1,
-0.5599543, 0.00133139, -0.3574516, 0, 0, 0, 1, 1,
-0.5568694, 0.5021903, -1.456689, 0, 0, 0, 1, 1,
-0.5556086, 1.428201, -0.4942546, 0, 0, 0, 1, 1,
-0.5519968, 0.03407236, -2.257626, 0, 0, 0, 1, 1,
-0.5493303, -0.1241179, -2.628733, 0, 0, 0, 1, 1,
-0.5477753, 0.5318387, 0.2951431, 0, 0, 0, 1, 1,
-0.5476157, 0.1813302, -0.1201079, 1, 1, 1, 1, 1,
-0.5438681, -1.955557, -3.803722, 1, 1, 1, 1, 1,
-0.5430859, -1.076609, -0.65775, 1, 1, 1, 1, 1,
-0.5397394, 2.370882, -0.6069221, 1, 1, 1, 1, 1,
-0.533941, -1.160514, -4.185381, 1, 1, 1, 1, 1,
-0.5298633, 0.4460262, -0.7967133, 1, 1, 1, 1, 1,
-0.528181, 0.06193612, -2.337196, 1, 1, 1, 1, 1,
-0.5253426, 1.969609, -0.8051245, 1, 1, 1, 1, 1,
-0.5159099, 0.1732519, 0.1909028, 1, 1, 1, 1, 1,
-0.5118276, -1.043315, -3.240328, 1, 1, 1, 1, 1,
-0.5053453, 2.118467, 0.3267462, 1, 1, 1, 1, 1,
-0.5033229, -0.7176941, -2.614516, 1, 1, 1, 1, 1,
-0.5026504, -0.9082629, -2.963845, 1, 1, 1, 1, 1,
-0.5016769, -0.6202379, -3.88759, 1, 1, 1, 1, 1,
-0.4999455, -0.6394815, -3.063158, 1, 1, 1, 1, 1,
-0.4909936, 0.03310874, -2.001464, 0, 0, 1, 1, 1,
-0.4858477, 0.2893057, -1.061728, 1, 0, 0, 1, 1,
-0.4834239, 0.3957361, -0.04050404, 1, 0, 0, 1, 1,
-0.4825611, 1.046435, 0.09740324, 1, 0, 0, 1, 1,
-0.4819005, -1.847766, -2.518202, 1, 0, 0, 1, 1,
-0.4768045, 1.01477, -0.5919545, 1, 0, 0, 1, 1,
-0.4704146, 1.531557, 0.4451115, 0, 0, 0, 1, 1,
-0.461274, -0.3588339, -1.656644, 0, 0, 0, 1, 1,
-0.4602746, -1.768507, -2.171558, 0, 0, 0, 1, 1,
-0.450849, -0.1002188, -1.5247, 0, 0, 0, 1, 1,
-0.4483868, 1.913105, 1.19151, 0, 0, 0, 1, 1,
-0.4449287, 0.2787785, -0.3421919, 0, 0, 0, 1, 1,
-0.4405803, 1.72461, -1.842397, 0, 0, 0, 1, 1,
-0.4384154, 2.842701, -0.3435453, 1, 1, 1, 1, 1,
-0.4382493, -1.600889, -1.858283, 1, 1, 1, 1, 1,
-0.4346949, -0.4010406, -3.467586, 1, 1, 1, 1, 1,
-0.4292623, 0.9644215, -2.221174, 1, 1, 1, 1, 1,
-0.4228601, -1.50243, -1.938535, 1, 1, 1, 1, 1,
-0.4180741, 0.2754673, -0.4255833, 1, 1, 1, 1, 1,
-0.4083523, -0.2185586, -1.199013, 1, 1, 1, 1, 1,
-0.4050673, -1.288758, -3.799357, 1, 1, 1, 1, 1,
-0.4012452, 1.074444, 1.250593, 1, 1, 1, 1, 1,
-0.4007593, 0.7250899, 0.1093011, 1, 1, 1, 1, 1,
-0.3970531, 2.031231, -1.041667, 1, 1, 1, 1, 1,
-0.3956432, 0.1276601, -2.174965, 1, 1, 1, 1, 1,
-0.3913587, 1.300131, -1.943016, 1, 1, 1, 1, 1,
-0.3883677, 0.5502432, -1.836166, 1, 1, 1, 1, 1,
-0.3850803, -0.4725339, -2.414905, 1, 1, 1, 1, 1,
-0.3830332, -1.586293, -2.816918, 0, 0, 1, 1, 1,
-0.3826113, -2.080393, -2.748634, 1, 0, 0, 1, 1,
-0.3792639, -1.617287, -3.750634, 1, 0, 0, 1, 1,
-0.378159, -0.7645234, -1.529671, 1, 0, 0, 1, 1,
-0.3759651, 0.3818201, -0.3682577, 1, 0, 0, 1, 1,
-0.3633275, -0.1601725, -2.664011, 1, 0, 0, 1, 1,
-0.3585772, -1.271634, -1.753346, 0, 0, 0, 1, 1,
-0.3585562, -1.141166, -1.364043, 0, 0, 0, 1, 1,
-0.3567426, -1.008573, -2.514322, 0, 0, 0, 1, 1,
-0.3546234, 0.1061832, -1.053033, 0, 0, 0, 1, 1,
-0.3541345, 1.699776, 1.103896, 0, 0, 0, 1, 1,
-0.3500293, -1.730622, -2.607509, 0, 0, 0, 1, 1,
-0.3490193, 0.6244894, -0.2986317, 0, 0, 0, 1, 1,
-0.3433973, -1.541625, -1.928212, 1, 1, 1, 1, 1,
-0.3402013, 0.1489696, -1.687582, 1, 1, 1, 1, 1,
-0.3380829, 0.4666559, -0.7895371, 1, 1, 1, 1, 1,
-0.3375922, -0.1008712, -0.3579739, 1, 1, 1, 1, 1,
-0.3356854, -1.187848, -1.897165, 1, 1, 1, 1, 1,
-0.3302596, 0.5993391, -0.2116931, 1, 1, 1, 1, 1,
-0.3297738, -0.216531, -2.463716, 1, 1, 1, 1, 1,
-0.3259406, -0.5202487, -3.487681, 1, 1, 1, 1, 1,
-0.3250846, -0.02976094, -1.919193, 1, 1, 1, 1, 1,
-0.3229362, -1.907476, -1.988935, 1, 1, 1, 1, 1,
-0.3203149, -0.6432784, -1.632913, 1, 1, 1, 1, 1,
-0.3185757, 1.308669, -1.144158, 1, 1, 1, 1, 1,
-0.317349, -0.7629317, -1.446298, 1, 1, 1, 1, 1,
-0.3157281, -0.3888819, -2.781643, 1, 1, 1, 1, 1,
-0.3128388, 0.5187317, 0.4301179, 1, 1, 1, 1, 1,
-0.3117641, 1.326823, -0.3105613, 0, 0, 1, 1, 1,
-0.3108499, -0.2602246, -1.33107, 1, 0, 0, 1, 1,
-0.3015299, 0.2186211, 0.03079145, 1, 0, 0, 1, 1,
-0.2952271, -0.8769856, -1.429154, 1, 0, 0, 1, 1,
-0.294288, 0.6099133, -0.1090822, 1, 0, 0, 1, 1,
-0.292506, 0.5821924, -0.4758866, 1, 0, 0, 1, 1,
-0.2911803, 0.06024926, -1.377743, 0, 0, 0, 1, 1,
-0.2886986, -1.304078, -1.952404, 0, 0, 0, 1, 1,
-0.2865387, -0.0110914, 0.1807646, 0, 0, 0, 1, 1,
-0.284795, 1.181428, -0.3463506, 0, 0, 0, 1, 1,
-0.2842671, 0.7794476, 1.161652, 0, 0, 0, 1, 1,
-0.281864, -0.3225162, -1.747353, 0, 0, 0, 1, 1,
-0.2818272, -0.8973409, -3.705231, 0, 0, 0, 1, 1,
-0.2807827, -2.034522, -1.909604, 1, 1, 1, 1, 1,
-0.2791185, -0.253129, -1.630908, 1, 1, 1, 1, 1,
-0.2788966, -2.225763, -3.013708, 1, 1, 1, 1, 1,
-0.2767403, -2.193027, -4.054027, 1, 1, 1, 1, 1,
-0.2761341, 0.3276736, -0.9382852, 1, 1, 1, 1, 1,
-0.2707612, 0.6249609, -1.674837, 1, 1, 1, 1, 1,
-0.2707388, 0.6840555, -0.8036826, 1, 1, 1, 1, 1,
-0.2655631, -1.444466, -2.821965, 1, 1, 1, 1, 1,
-0.2648291, -0.3997897, -1.386521, 1, 1, 1, 1, 1,
-0.2644859, 1.711007, 0.411239, 1, 1, 1, 1, 1,
-0.2618324, -0.4776671, -4.018277, 1, 1, 1, 1, 1,
-0.2475136, -1.871892, -2.643613, 1, 1, 1, 1, 1,
-0.2460108, -1.203775, -1.358013, 1, 1, 1, 1, 1,
-0.2458405, 0.7967822, 0.8677611, 1, 1, 1, 1, 1,
-0.2456192, 3.540624, -0.4547113, 1, 1, 1, 1, 1,
-0.2445897, 0.8530589, 0.7625769, 0, 0, 1, 1, 1,
-0.2436053, -1.022101, -3.761196, 1, 0, 0, 1, 1,
-0.2432476, 0.4680538, 0.1600261, 1, 0, 0, 1, 1,
-0.2392879, 0.7718389, -0.8615093, 1, 0, 0, 1, 1,
-0.237646, -1.682703, -1.223575, 1, 0, 0, 1, 1,
-0.2347886, 0.9425723, 1.727586, 1, 0, 0, 1, 1,
-0.2325488, 0.1193044, -0.6481789, 0, 0, 0, 1, 1,
-0.2318987, -0.451297, -1.837022, 0, 0, 0, 1, 1,
-0.2306805, -1.279574, -3.444669, 0, 0, 0, 1, 1,
-0.2284523, 1.355396, -0.7569893, 0, 0, 0, 1, 1,
-0.225207, 0.3659503, 0.1279975, 0, 0, 0, 1, 1,
-0.2200652, 1.469269, -0.3710182, 0, 0, 0, 1, 1,
-0.2160768, -0.9583344, -2.12336, 0, 0, 0, 1, 1,
-0.2111587, -0.7892315, -2.498352, 1, 1, 1, 1, 1,
-0.2111296, -0.1679207, -2.337244, 1, 1, 1, 1, 1,
-0.2109649, -0.5366479, -2.940283, 1, 1, 1, 1, 1,
-0.2103491, -0.6193964, -2.498695, 1, 1, 1, 1, 1,
-0.2061764, -0.3217264, -1.878814, 1, 1, 1, 1, 1,
-0.2058914, -0.3287168, -2.375211, 1, 1, 1, 1, 1,
-0.2058558, -0.3357671, -3.918077, 1, 1, 1, 1, 1,
-0.2024904, 0.1481868, -2.477665, 1, 1, 1, 1, 1,
-0.201123, -0.8081502, -4.350875, 1, 1, 1, 1, 1,
-0.2006834, -0.2891102, -3.032787, 1, 1, 1, 1, 1,
-0.2002172, -0.7901284, -0.6046365, 1, 1, 1, 1, 1,
-0.197326, -1.043569, -2.441091, 1, 1, 1, 1, 1,
-0.1970083, -0.6562393, -3.915991, 1, 1, 1, 1, 1,
-0.1935347, -0.9630041, -2.886293, 1, 1, 1, 1, 1,
-0.1911516, 0.4724385, 0.07746595, 1, 1, 1, 1, 1,
-0.1900116, -1.359229, -2.442188, 0, 0, 1, 1, 1,
-0.1898081, 1.417303, -0.4189509, 1, 0, 0, 1, 1,
-0.188678, -0.5745602, -3.811371, 1, 0, 0, 1, 1,
-0.1838911, 0.588496, -0.3901672, 1, 0, 0, 1, 1,
-0.1776909, -1.120132, -2.885586, 1, 0, 0, 1, 1,
-0.1745362, -0.1559783, -3.35006, 1, 0, 0, 1, 1,
-0.1738974, -1.222813, -2.542855, 0, 0, 0, 1, 1,
-0.1696526, -0.7915069, -4.279202, 0, 0, 0, 1, 1,
-0.1693946, 0.5340914, -1.526227, 0, 0, 0, 1, 1,
-0.1682914, 0.04220459, -2.280216, 0, 0, 0, 1, 1,
-0.1675179, 1.100856, 1.639766, 0, 0, 0, 1, 1,
-0.1622214, -0.1958222, -3.419158, 0, 0, 0, 1, 1,
-0.1566648, 0.4626605, 1.136883, 0, 0, 0, 1, 1,
-0.1456316, 1.219311, 0.08329558, 1, 1, 1, 1, 1,
-0.1443117, -0.1145363, -2.001899, 1, 1, 1, 1, 1,
-0.1432208, -1.127726, -2.60604, 1, 1, 1, 1, 1,
-0.1430163, 0.4423187, -0.9053602, 1, 1, 1, 1, 1,
-0.1398612, 0.3558017, -1.472168, 1, 1, 1, 1, 1,
-0.1328399, -0.1315085, -2.026168, 1, 1, 1, 1, 1,
-0.1324857, 1.154998, -0.4299927, 1, 1, 1, 1, 1,
-0.1315274, -0.961328, -2.78266, 1, 1, 1, 1, 1,
-0.1297843, -0.07684106, -0.5070818, 1, 1, 1, 1, 1,
-0.1281502, 0.6012888, 2.039865, 1, 1, 1, 1, 1,
-0.1271738, 1.835417, -0.6742951, 1, 1, 1, 1, 1,
-0.1266162, -0.9583985, -2.986497, 1, 1, 1, 1, 1,
-0.1217314, -0.166109, -1.686845, 1, 1, 1, 1, 1,
-0.1146496, 1.709298, -0.2879315, 1, 1, 1, 1, 1,
-0.1124834, -0.7874255, -2.432755, 1, 1, 1, 1, 1,
-0.1116982, -1.335333, -1.508007, 0, 0, 1, 1, 1,
-0.1087419, 0.6186869, -1.757618, 1, 0, 0, 1, 1,
-0.1054761, -1.358381, -2.956012, 1, 0, 0, 1, 1,
-0.1028308, 1.162315, 0.8952505, 1, 0, 0, 1, 1,
-0.1025083, 0.01633653, -2.067358, 1, 0, 0, 1, 1,
-0.09972055, -1.089898, -2.024813, 1, 0, 0, 1, 1,
-0.09716953, 0.2601359, -0.8212306, 0, 0, 0, 1, 1,
-0.09673042, -1.215929, -3.287293, 0, 0, 0, 1, 1,
-0.09556665, 0.4963825, -0.9731973, 0, 0, 0, 1, 1,
-0.09432952, -1.611101, -2.495197, 0, 0, 0, 1, 1,
-0.09391945, 1.79477, 1.271139, 0, 0, 0, 1, 1,
-0.09265298, -0.04689658, -3.301672, 0, 0, 0, 1, 1,
-0.09121169, 0.3255863, -1.891412, 0, 0, 0, 1, 1,
-0.0892693, -1.707774, -2.480412, 1, 1, 1, 1, 1,
-0.08871734, -0.2747524, -3.344107, 1, 1, 1, 1, 1,
-0.08765247, -0.6115978, -3.965855, 1, 1, 1, 1, 1,
-0.0828707, 0.7208605, 0.135619, 1, 1, 1, 1, 1,
-0.08245201, 1.580557, 0.05744939, 1, 1, 1, 1, 1,
-0.07802926, 1.00594, -0.6619813, 1, 1, 1, 1, 1,
-0.0734229, 1.857177, 0.6767178, 1, 1, 1, 1, 1,
-0.07334588, -0.7875744, -2.087648, 1, 1, 1, 1, 1,
-0.06100307, -1.662665, -2.120329, 1, 1, 1, 1, 1,
-0.0597665, -0.4402794, -3.102644, 1, 1, 1, 1, 1,
-0.05937032, 1.058228, 0.3029853, 1, 1, 1, 1, 1,
-0.05913325, -0.4529804, -3.912846, 1, 1, 1, 1, 1,
-0.05555306, -0.8517966, -3.558983, 1, 1, 1, 1, 1,
-0.05246976, 0.1418889, -1.242582, 1, 1, 1, 1, 1,
-0.04999152, 0.2949899, 0.5803829, 1, 1, 1, 1, 1,
-0.04994877, 0.3172727, -1.296, 0, 0, 1, 1, 1,
-0.04893027, 0.107496, -0.1821963, 1, 0, 0, 1, 1,
-0.04602369, 0.06613381, -0.8447096, 1, 0, 0, 1, 1,
-0.04591349, 0.7110517, -0.3420406, 1, 0, 0, 1, 1,
-0.04250807, 0.2280166, 0.9179872, 1, 0, 0, 1, 1,
-0.03668996, -0.8193818, -5.074165, 1, 0, 0, 1, 1,
-0.03486269, 0.1340864, -0.5920238, 0, 0, 0, 1, 1,
-0.02100618, -1.583894, -1.477471, 0, 0, 0, 1, 1,
-0.02056155, 0.5254228, -0.08194745, 0, 0, 0, 1, 1,
-0.02018636, 0.6487126, 0.5942221, 0, 0, 0, 1, 1,
-0.01685119, -1.233331, -3.556181, 0, 0, 0, 1, 1,
-0.01496854, -1.239735, -5.04091, 0, 0, 0, 1, 1,
-0.0148472, -0.6580222, -4.242821, 0, 0, 0, 1, 1,
-0.01381817, -0.738498, -3.627959, 1, 1, 1, 1, 1,
-0.01182387, -0.04328775, -4.230376, 1, 1, 1, 1, 1,
-0.007535993, -1.115561, -2.268429, 1, 1, 1, 1, 1,
-0.003120269, 1.153666, -0.1095392, 1, 1, 1, 1, 1,
-0.003072433, -0.6139486, -0.5264591, 1, 1, 1, 1, 1,
0.002336835, -0.7434094, 4.6302, 1, 1, 1, 1, 1,
0.004543396, -0.7224279, 2.774349, 1, 1, 1, 1, 1,
0.006461034, 0.3362438, 0.01230933, 1, 1, 1, 1, 1,
0.01242696, -1.174625, 2.92589, 1, 1, 1, 1, 1,
0.01250888, 0.4743702, 0.4699179, 1, 1, 1, 1, 1,
0.01372583, -0.6902436, 2.74195, 1, 1, 1, 1, 1,
0.01458522, 0.9959444, 0.6729354, 1, 1, 1, 1, 1,
0.02120879, -0.3079784, 4.553873, 1, 1, 1, 1, 1,
0.02881119, 1.803473, 2.448109, 1, 1, 1, 1, 1,
0.034301, 1.589251, 1.061874, 1, 1, 1, 1, 1,
0.04096785, 1.175067, -0.1200963, 0, 0, 1, 1, 1,
0.0436274, -0.04598657, 2.117566, 1, 0, 0, 1, 1,
0.04591965, -1.054843, 3.886686, 1, 0, 0, 1, 1,
0.04700723, 1.253363, -1.324176, 1, 0, 0, 1, 1,
0.04905334, 2.064321, 0.6932012, 1, 0, 0, 1, 1,
0.05498982, -0.184035, 0.9333194, 1, 0, 0, 1, 1,
0.05736437, 0.9083598, 0.6261296, 0, 0, 0, 1, 1,
0.05820468, -0.7643146, 2.100755, 0, 0, 0, 1, 1,
0.05833651, 0.2432405, 0.003249888, 0, 0, 0, 1, 1,
0.06527891, 2.712049, 0.7001603, 0, 0, 0, 1, 1,
0.06784114, -0.2482979, 1.110494, 0, 0, 0, 1, 1,
0.07197838, -0.03999234, 1.153639, 0, 0, 0, 1, 1,
0.07236373, -1.027426, 3.332736, 0, 0, 0, 1, 1,
0.08197594, 0.1185937, -1.027681, 1, 1, 1, 1, 1,
0.08199112, 1.593304, -1.111432, 1, 1, 1, 1, 1,
0.08331735, -0.744178, 4.15238, 1, 1, 1, 1, 1,
0.08805316, -0.32578, 2.495676, 1, 1, 1, 1, 1,
0.08855151, -0.6626781, 3.500141, 1, 1, 1, 1, 1,
0.09001283, 1.438231, 2.450356, 1, 1, 1, 1, 1,
0.09087409, 1.707395, -1.235617, 1, 1, 1, 1, 1,
0.09118574, 0.4575999, -0.1223036, 1, 1, 1, 1, 1,
0.09143092, 0.1541463, 0.6178278, 1, 1, 1, 1, 1,
0.09401906, 1.050903, 0.282855, 1, 1, 1, 1, 1,
0.09666585, 1.833102, 0.6684258, 1, 1, 1, 1, 1,
0.1022621, -0.4620966, 4.688253, 1, 1, 1, 1, 1,
0.1064673, -0.225556, 3.790147, 1, 1, 1, 1, 1,
0.1217915, 0.5171909, 0.404166, 1, 1, 1, 1, 1,
0.122016, 0.3379335, 0.5166131, 1, 1, 1, 1, 1,
0.1273629, 0.1740843, 0.3377634, 0, 0, 1, 1, 1,
0.1311372, -0.5165189, 1.948012, 1, 0, 0, 1, 1,
0.1317519, 1.219, -0.3732551, 1, 0, 0, 1, 1,
0.1329309, 0.5900689, -1.171898, 1, 0, 0, 1, 1,
0.1360133, -0.4460603, 2.606848, 1, 0, 0, 1, 1,
0.1373323, 0.2247277, 1.238806, 1, 0, 0, 1, 1,
0.1386724, -0.7600595, 2.102548, 0, 0, 0, 1, 1,
0.1401428, 1.193153, 0.2513444, 0, 0, 0, 1, 1,
0.1420111, -0.08059174, 1.504155, 0, 0, 0, 1, 1,
0.1439757, 1.128776, -0.3793208, 0, 0, 0, 1, 1,
0.1466246, -0.4736191, 2.470556, 0, 0, 0, 1, 1,
0.1478024, 1.212098, -0.5599515, 0, 0, 0, 1, 1,
0.1517232, -0.9910936, 2.877869, 0, 0, 0, 1, 1,
0.1521047, -2.093053, 3.131483, 1, 1, 1, 1, 1,
0.1544745, 1.320941, -2.184018, 1, 1, 1, 1, 1,
0.1599482, -0.2616763, 3.764888, 1, 1, 1, 1, 1,
0.1633161, -0.4263123, 3.447089, 1, 1, 1, 1, 1,
0.1668352, 1.035459, -1.266515, 1, 1, 1, 1, 1,
0.1733541, -1.496196, 1.8404, 1, 1, 1, 1, 1,
0.1744109, -0.02378397, 0.4122447, 1, 1, 1, 1, 1,
0.1766494, 0.1393164, -0.5355839, 1, 1, 1, 1, 1,
0.1771963, -1.50335, 1.742359, 1, 1, 1, 1, 1,
0.1787841, 0.009602304, 1.427005, 1, 1, 1, 1, 1,
0.1821099, 0.2116419, 0.4399551, 1, 1, 1, 1, 1,
0.182635, -1.353011, 3.502258, 1, 1, 1, 1, 1,
0.1840414, -0.3887911, 2.050755, 1, 1, 1, 1, 1,
0.1891166, 0.9801009, -0.9511728, 1, 1, 1, 1, 1,
0.1904041, 2.184453, 0.7322961, 1, 1, 1, 1, 1,
0.1931069, -0.7103721, 1.132278, 0, 0, 1, 1, 1,
0.1951315, -0.04438575, 3.744251, 1, 0, 0, 1, 1,
0.2015231, 0.02552575, 0.949062, 1, 0, 0, 1, 1,
0.2064647, 0.4551352, 3.156585, 1, 0, 0, 1, 1,
0.2087665, 0.3078511, 0.5513319, 1, 0, 0, 1, 1,
0.2152969, 1.91571, 0.9079655, 1, 0, 0, 1, 1,
0.219381, -0.0873346, 2.177892, 0, 0, 0, 1, 1,
0.2207948, -0.1038793, 2.182358, 0, 0, 0, 1, 1,
0.2210696, 0.6435017, 0.3041517, 0, 0, 0, 1, 1,
0.2261534, -0.1546697, 0.06664164, 0, 0, 0, 1, 1,
0.2271862, -0.2013656, 2.941482, 0, 0, 0, 1, 1,
0.2278674, -0.5560707, 1.007017, 0, 0, 0, 1, 1,
0.2316891, -0.8270036, 4.311857, 0, 0, 0, 1, 1,
0.2319852, -1.388837, 4.088068, 1, 1, 1, 1, 1,
0.2332229, -1.040661, 2.166557, 1, 1, 1, 1, 1,
0.2378607, -1.243669, 2.426631, 1, 1, 1, 1, 1,
0.2394391, 0.5516335, 1.133087, 1, 1, 1, 1, 1,
0.2411955, 1.074338, -0.3573528, 1, 1, 1, 1, 1,
0.2424797, -0.9347607, 3.657702, 1, 1, 1, 1, 1,
0.2475499, 0.499281, 0.006910928, 1, 1, 1, 1, 1,
0.2501113, 0.1791382, 2.084191, 1, 1, 1, 1, 1,
0.2501217, -0.6430472, 2.901897, 1, 1, 1, 1, 1,
0.2520934, -1.137976, 2.491277, 1, 1, 1, 1, 1,
0.260421, 0.8963054, -1.249605, 1, 1, 1, 1, 1,
0.2640173, -1.297909, 2.789859, 1, 1, 1, 1, 1,
0.2660631, -0.5484647, 3.884138, 1, 1, 1, 1, 1,
0.2681781, -0.4369484, 1.764896, 1, 1, 1, 1, 1,
0.2685842, 0.7411978, 0.9005228, 1, 1, 1, 1, 1,
0.2702469, 0.9702322, 1.590294, 0, 0, 1, 1, 1,
0.2713892, -0.402638, 1.409531, 1, 0, 0, 1, 1,
0.2721375, 0.4317905, 2.202335, 1, 0, 0, 1, 1,
0.2726703, 0.1025904, 1.881678, 1, 0, 0, 1, 1,
0.2745853, 0.230286, 1.292207, 1, 0, 0, 1, 1,
0.2746285, -0.1044326, 1.47623, 1, 0, 0, 1, 1,
0.275843, -2.244931, 2.48159, 0, 0, 0, 1, 1,
0.2760139, -0.5272854, 3.121498, 0, 0, 0, 1, 1,
0.2772143, -0.8362848, 2.127934, 0, 0, 0, 1, 1,
0.2781765, 0.009305976, 3.055717, 0, 0, 0, 1, 1,
0.2784869, 1.318448, -1.228121, 0, 0, 0, 1, 1,
0.2827968, -0.7041368, 2.284234, 0, 0, 0, 1, 1,
0.2843053, 1.351536, 0.3043177, 0, 0, 0, 1, 1,
0.2866823, -1.143601, 3.956029, 1, 1, 1, 1, 1,
0.2890365, 0.3790369, 0.6012484, 1, 1, 1, 1, 1,
0.2909834, -0.3250829, 2.815697, 1, 1, 1, 1, 1,
0.2942853, 0.9469132, 0.3463796, 1, 1, 1, 1, 1,
0.3044007, -1.153893, 1.919841, 1, 1, 1, 1, 1,
0.3058095, -1.901654, 2.737076, 1, 1, 1, 1, 1,
0.3064038, -0.178835, 1.706762, 1, 1, 1, 1, 1,
0.3064481, 0.1265673, 0.2716526, 1, 1, 1, 1, 1,
0.3106011, 0.5651667, 0.9660198, 1, 1, 1, 1, 1,
0.3117158, -1.05698, 2.310609, 1, 1, 1, 1, 1,
0.3145821, 0.9527226, -1.512959, 1, 1, 1, 1, 1,
0.3169092, -0.02756423, 0.4271975, 1, 1, 1, 1, 1,
0.3187599, -1.222214, 3.378909, 1, 1, 1, 1, 1,
0.3248214, -0.6908016, 3.072121, 1, 1, 1, 1, 1,
0.326178, 0.8996403, -1.079913, 1, 1, 1, 1, 1,
0.3295963, 1.595414, 0.06166125, 0, 0, 1, 1, 1,
0.3304955, 0.8349745, -0.8834572, 1, 0, 0, 1, 1,
0.3315031, -0.4466464, 1.468939, 1, 0, 0, 1, 1,
0.3317144, 0.6744894, -1.388458, 1, 0, 0, 1, 1,
0.3346976, -0.7047921, 2.655661, 1, 0, 0, 1, 1,
0.3384898, -1.245247, 3.719456, 1, 0, 0, 1, 1,
0.3396773, 0.9783373, 1.670236, 0, 0, 0, 1, 1,
0.3422095, -3.115176, 2.62489, 0, 0, 0, 1, 1,
0.3425615, 1.131511, 0.9555239, 0, 0, 0, 1, 1,
0.3432809, 1.368944, 1.998941, 0, 0, 0, 1, 1,
0.3453325, 1.045601, 1.042919, 0, 0, 0, 1, 1,
0.345628, -0.8863669, 2.599779, 0, 0, 0, 1, 1,
0.3566124, 0.5457453, 0.01844751, 0, 0, 0, 1, 1,
0.3597896, 0.3215408, 0.2174559, 1, 1, 1, 1, 1,
0.3605287, 0.06148842, 1.4807, 1, 1, 1, 1, 1,
0.3658199, -0.02098748, 2.860004, 1, 1, 1, 1, 1,
0.3672759, 2.193918, 0.1465768, 1, 1, 1, 1, 1,
0.3694766, -2.234819, 2.638817, 1, 1, 1, 1, 1,
0.3725758, 0.2486567, 1.950659, 1, 1, 1, 1, 1,
0.3747457, 0.01283943, 1.136695, 1, 1, 1, 1, 1,
0.3757983, -1.010558, 2.765143, 1, 1, 1, 1, 1,
0.3769981, 0.185058, -0.3805474, 1, 1, 1, 1, 1,
0.3852985, -0.6158193, 2.229735, 1, 1, 1, 1, 1,
0.3860656, 0.9280381, 1.939465, 1, 1, 1, 1, 1,
0.3870464, 0.1694462, 0.3870849, 1, 1, 1, 1, 1,
0.3973501, 1.167214, 0.5871417, 1, 1, 1, 1, 1,
0.4047402, -2.415234, 1.402323, 1, 1, 1, 1, 1,
0.4076423, -0.6722046, 3.403711, 1, 1, 1, 1, 1,
0.4080976, 0.7411171, -0.1081875, 0, 0, 1, 1, 1,
0.4083031, -1.009189, 3.953908, 1, 0, 0, 1, 1,
0.413781, -0.008955772, 2.907947, 1, 0, 0, 1, 1,
0.4160037, 1.987401, -0.4980806, 1, 0, 0, 1, 1,
0.4173285, -0.3498943, 1.157019, 1, 0, 0, 1, 1,
0.4176539, 0.9533233, -0.1271866, 1, 0, 0, 1, 1,
0.4178173, -0.6188933, 3.603607, 0, 0, 0, 1, 1,
0.4185622, -0.3582796, 3.588712, 0, 0, 0, 1, 1,
0.423846, -0.2164011, 2.824917, 0, 0, 0, 1, 1,
0.4303234, 0.6964558, -0.2694384, 0, 0, 0, 1, 1,
0.4305041, -1.086387, 2.730352, 0, 0, 0, 1, 1,
0.4320815, -1.065436, 5.282952, 0, 0, 0, 1, 1,
0.4322163, 0.6677595, -1.482614, 0, 0, 0, 1, 1,
0.435524, -0.2937227, 0.6272087, 1, 1, 1, 1, 1,
0.4395276, 0.5382678, -0.3548432, 1, 1, 1, 1, 1,
0.4397084, 0.6599425, -0.3622272, 1, 1, 1, 1, 1,
0.4443544, -0.6098535, 1.846116, 1, 1, 1, 1, 1,
0.4478514, -1.810768, 3.670215, 1, 1, 1, 1, 1,
0.4575354, -0.3521928, 3.997978, 1, 1, 1, 1, 1,
0.458526, 0.9910775, 0.384166, 1, 1, 1, 1, 1,
0.4589661, -0.5941342, 1.758831, 1, 1, 1, 1, 1,
0.4592926, 0.07787494, 0.2403016, 1, 1, 1, 1, 1,
0.4601439, 0.1118836, 0.5832475, 1, 1, 1, 1, 1,
0.4666624, 0.3214349, 0.6378225, 1, 1, 1, 1, 1,
0.4673856, -0.003908009, 2.583627, 1, 1, 1, 1, 1,
0.4679927, 0.2121971, 1.532975, 1, 1, 1, 1, 1,
0.4680365, -0.1134292, 0.4046121, 1, 1, 1, 1, 1,
0.4692914, -0.4693634, 2.436816, 1, 1, 1, 1, 1,
0.4697727, -0.4039431, 1.531441, 0, 0, 1, 1, 1,
0.4704039, 0.05166014, 0.581174, 1, 0, 0, 1, 1,
0.4780622, -1.196412, 2.369327, 1, 0, 0, 1, 1,
0.4832432, 1.264587, -1.710644, 1, 0, 0, 1, 1,
0.4958135, 0.4995803, 2.923019, 1, 0, 0, 1, 1,
0.4967432, -0.1391877, 1.026414, 1, 0, 0, 1, 1,
0.4974208, -1.089405, 3.474101, 0, 0, 0, 1, 1,
0.5045418, 0.3203959, 1.926228, 0, 0, 0, 1, 1,
0.5060615, 0.1949044, 0.8740938, 0, 0, 0, 1, 1,
0.5089782, 0.3410465, 2.757874, 0, 0, 0, 1, 1,
0.5092615, 0.5538213, -0.3574862, 0, 0, 0, 1, 1,
0.5104477, 0.4312269, 0.5199143, 0, 0, 0, 1, 1,
0.5105739, 0.7945123, 0.9830182, 0, 0, 0, 1, 1,
0.5116853, -0.2295788, 0.6019664, 1, 1, 1, 1, 1,
0.5120553, 0.2727895, 3.200094, 1, 1, 1, 1, 1,
0.5215642, -0.06146117, 2.691115, 1, 1, 1, 1, 1,
0.5263939, 0.02914035, 1.413876, 1, 1, 1, 1, 1,
0.5270447, 0.3520104, 0.1056736, 1, 1, 1, 1, 1,
0.5298627, 0.2041878, 0.1742806, 1, 1, 1, 1, 1,
0.5298856, 0.02524133, 2.020722, 1, 1, 1, 1, 1,
0.5300521, 1.562023, -0.03721685, 1, 1, 1, 1, 1,
0.5311027, 0.1587901, 1.119306, 1, 1, 1, 1, 1,
0.5381766, -1.699327, 2.798969, 1, 1, 1, 1, 1,
0.5417311, -0.6772451, 1.271884, 1, 1, 1, 1, 1,
0.5434647, -0.5390455, 1.858538, 1, 1, 1, 1, 1,
0.5503651, -1.778085, 3.253557, 1, 1, 1, 1, 1,
0.5551471, 0.1058165, 1.155976, 1, 1, 1, 1, 1,
0.5573294, -1.5768, 2.149769, 1, 1, 1, 1, 1,
0.5592071, -0.3153829, 1.701506, 0, 0, 1, 1, 1,
0.560159, 0.7785768, 0.1136796, 1, 0, 0, 1, 1,
0.5610698, -0.03465252, 1.059332, 1, 0, 0, 1, 1,
0.5631099, 0.6058172, 0.2317342, 1, 0, 0, 1, 1,
0.5644509, 0.477166, -0.7889491, 1, 0, 0, 1, 1,
0.5679575, -0.2238923, 2.362381, 1, 0, 0, 1, 1,
0.5683745, -0.8443284, 3.314647, 0, 0, 0, 1, 1,
0.5691163, -0.1429853, 1.771384, 0, 0, 0, 1, 1,
0.5691754, 1.146497, 0.2436521, 0, 0, 0, 1, 1,
0.5747665, 1.405221, -0.2573739, 0, 0, 0, 1, 1,
0.575099, -0.8605897, 2.071265, 0, 0, 0, 1, 1,
0.5780846, -0.4153397, 1.291783, 0, 0, 0, 1, 1,
0.5782749, -0.2190946, 2.415648, 0, 0, 0, 1, 1,
0.5804316, 0.8886729, 1.904737, 1, 1, 1, 1, 1,
0.5825821, -0.8402243, 2.388911, 1, 1, 1, 1, 1,
0.5831593, -0.797709, 3.006705, 1, 1, 1, 1, 1,
0.5845399, 0.7903674, 0.574272, 1, 1, 1, 1, 1,
0.5902994, 0.5294515, 0.7556536, 1, 1, 1, 1, 1,
0.5906702, 0.9676377, 0.7170879, 1, 1, 1, 1, 1,
0.5916449, -0.51883, 3.533374, 1, 1, 1, 1, 1,
0.591709, 1.22377, -0.2126151, 1, 1, 1, 1, 1,
0.6035919, 0.4196741, 2.412886, 1, 1, 1, 1, 1,
0.6092632, 0.7063103, 0.2602755, 1, 1, 1, 1, 1,
0.6109566, -0.4400604, 3.099156, 1, 1, 1, 1, 1,
0.6120918, 0.3813265, 1.492916, 1, 1, 1, 1, 1,
0.6167692, -0.06303427, 1.685725, 1, 1, 1, 1, 1,
0.6185855, 0.0666107, 0.4134715, 1, 1, 1, 1, 1,
0.6210194, -0.1804552, 1.630414, 1, 1, 1, 1, 1,
0.6220191, -1.018412, 3.188972, 0, 0, 1, 1, 1,
0.6257288, -1.474012, 4.015465, 1, 0, 0, 1, 1,
0.6289919, -1.463947, 3.480445, 1, 0, 0, 1, 1,
0.6295356, 0.4527923, 1.308447, 1, 0, 0, 1, 1,
0.6311913, 2.461512, -0.7489199, 1, 0, 0, 1, 1,
0.6346273, 0.2834747, -0.8562226, 1, 0, 0, 1, 1,
0.6421598, 0.281574, -0.624542, 0, 0, 0, 1, 1,
0.6450382, 1.997234, 1.160079, 0, 0, 0, 1, 1,
0.6457987, 1.726522, 0.4856992, 0, 0, 0, 1, 1,
0.6509325, -0.672805, 2.088393, 0, 0, 0, 1, 1,
0.6526629, -0.5145375, 2.499974, 0, 0, 0, 1, 1,
0.6561552, -0.3074032, 2.426308, 0, 0, 0, 1, 1,
0.6575122, -0.7913335, 2.787546, 0, 0, 0, 1, 1,
0.6602299, 0.2368466, 0.3259548, 1, 1, 1, 1, 1,
0.660494, 0.4460162, 1.658816, 1, 1, 1, 1, 1,
0.6662391, 0.4372716, 0.9943895, 1, 1, 1, 1, 1,
0.6668937, 0.6578571, 0.8771368, 1, 1, 1, 1, 1,
0.6758348, 0.3528576, 1.280728, 1, 1, 1, 1, 1,
0.6789823, 1.656, 1.247691, 1, 1, 1, 1, 1,
0.6847648, -0.4429099, 1.421318, 1, 1, 1, 1, 1,
0.6875098, -1.207732, 2.399988, 1, 1, 1, 1, 1,
0.6925338, 0.2893326, 2.397396, 1, 1, 1, 1, 1,
0.6965263, -0.7819549, 2.000463, 1, 1, 1, 1, 1,
0.6991592, 0.1592247, 0.2967227, 1, 1, 1, 1, 1,
0.7048519, -0.8474912, 3.249493, 1, 1, 1, 1, 1,
0.7110898, 0.9317043, -1.234565, 1, 1, 1, 1, 1,
0.7117036, 0.6276096, 1.618815, 1, 1, 1, 1, 1,
0.7135878, 0.5207291, -0.1443926, 1, 1, 1, 1, 1,
0.7154766, -3.158895, 2.774145, 0, 0, 1, 1, 1,
0.7156791, -1.624908, 2.921978, 1, 0, 0, 1, 1,
0.7173696, 0.3487932, 1.020666, 1, 0, 0, 1, 1,
0.7236006, -1.022471, 4.256084, 1, 0, 0, 1, 1,
0.7245464, 0.672658, -1.745665, 1, 0, 0, 1, 1,
0.7249218, -0.7048361, 0.8178401, 1, 0, 0, 1, 1,
0.7258633, -0.2136475, 1.122359, 0, 0, 0, 1, 1,
0.7265164, -0.1202527, 0.6496562, 0, 0, 0, 1, 1,
0.7292284, -0.9182838, 2.07141, 0, 0, 0, 1, 1,
0.7346183, 1.602725, 0.9071786, 0, 0, 0, 1, 1,
0.7349548, 1.156772, 0.332971, 0, 0, 0, 1, 1,
0.7374991, -0.1779696, 2.168161, 0, 0, 0, 1, 1,
0.7420121, 1.136249, -1.529595, 0, 0, 0, 1, 1,
0.7425069, -0.318129, 2.992738, 1, 1, 1, 1, 1,
0.7430044, 1.49455, 0.278066, 1, 1, 1, 1, 1,
0.7449954, 1.711285, 1.069797, 1, 1, 1, 1, 1,
0.7479336, 1.501705, 0.9171459, 1, 1, 1, 1, 1,
0.7480685, -1.300201, 2.545824, 1, 1, 1, 1, 1,
0.7562872, 0.7248185, 1.743359, 1, 1, 1, 1, 1,
0.7574528, -0.3018014, 2.392562, 1, 1, 1, 1, 1,
0.7591466, 2.506244, 0.4567755, 1, 1, 1, 1, 1,
0.7646685, -0.2158477, 0.8817857, 1, 1, 1, 1, 1,
0.76553, 1.700485, 0.8993927, 1, 1, 1, 1, 1,
0.7662063, -1.057914, 1.251899, 1, 1, 1, 1, 1,
0.7682964, 0.9146609, 0.01966695, 1, 1, 1, 1, 1,
0.7694278, 1.881301, -0.6021516, 1, 1, 1, 1, 1,
0.7729352, -0.9596282, 3.435593, 1, 1, 1, 1, 1,
0.7754522, 0.3451214, 2.219476, 1, 1, 1, 1, 1,
0.7763624, -1.100719, 1.778471, 0, 0, 1, 1, 1,
0.7863038, -0.4947419, 2.198407, 1, 0, 0, 1, 1,
0.7876467, -0.2073988, 0.2921017, 1, 0, 0, 1, 1,
0.7912147, 0.8727896, 0.6764805, 1, 0, 0, 1, 1,
0.7935241, -0.2164484, 1.268429, 1, 0, 0, 1, 1,
0.7946329, -0.6219482, 4.548125, 1, 0, 0, 1, 1,
0.7980111, -0.5187406, 1.851755, 0, 0, 0, 1, 1,
0.8043104, -0.1689506, 2.01672, 0, 0, 0, 1, 1,
0.8148076, -0.8752898, 2.736185, 0, 0, 0, 1, 1,
0.816071, 0.9468232, 0.9722599, 0, 0, 0, 1, 1,
0.8186646, 0.3971506, 2.643026, 0, 0, 0, 1, 1,
0.8194203, -0.02662909, 1.76126, 0, 0, 0, 1, 1,
0.8228754, 2.106137, 0.7950028, 0, 0, 0, 1, 1,
0.8253604, -0.3087873, 2.963651, 1, 1, 1, 1, 1,
0.8278658, 0.9480849, 0.7167084, 1, 1, 1, 1, 1,
0.8307183, 1.746554, 0.6792702, 1, 1, 1, 1, 1,
0.8363179, -0.5423535, 1.91171, 1, 1, 1, 1, 1,
0.8368721, -0.2775588, 2.395253, 1, 1, 1, 1, 1,
0.8400922, -0.3108769, 0.2710803, 1, 1, 1, 1, 1,
0.8413667, -0.4718316, 1.688787, 1, 1, 1, 1, 1,
0.8440278, 1.121608, 0.2237795, 1, 1, 1, 1, 1,
0.8517409, -0.6166674, 3.610812, 1, 1, 1, 1, 1,
0.8524759, 0.9219347, 0.3874408, 1, 1, 1, 1, 1,
0.853043, -0.4454338, 3.198309, 1, 1, 1, 1, 1,
0.8557039, 0.3950704, 2.449151, 1, 1, 1, 1, 1,
0.8628166, -0.5153706, 2.582998, 1, 1, 1, 1, 1,
0.8649692, -0.4635768, 1.55991, 1, 1, 1, 1, 1,
0.8728102, 0.7164907, 0.2270702, 1, 1, 1, 1, 1,
0.8756014, 0.2041029, 0.3667311, 0, 0, 1, 1, 1,
0.8761194, 0.7431362, 0.4170589, 1, 0, 0, 1, 1,
0.8766563, -0.08399767, 2.562528, 1, 0, 0, 1, 1,
0.87672, 0.3127331, 3.437999, 1, 0, 0, 1, 1,
0.8777465, -1.660485, 2.194275, 1, 0, 0, 1, 1,
0.8789564, 1.13674, 2.917002, 1, 0, 0, 1, 1,
0.879453, 0.6562235, 1.516371, 0, 0, 0, 1, 1,
0.8859033, -0.6554269, 2.316964, 0, 0, 0, 1, 1,
0.8969826, 0.4694243, 2.03807, 0, 0, 0, 1, 1,
0.8983171, 0.7022555, 0.1837517, 0, 0, 0, 1, 1,
0.8990967, -0.2807284, 3.315672, 0, 0, 0, 1, 1,
0.9043468, 0.9888979, 0.2891967, 0, 0, 0, 1, 1,
0.9050202, -0.4073627, 2.874024, 0, 0, 0, 1, 1,
0.9149964, -1.029087, 1.960244, 1, 1, 1, 1, 1,
0.9176037, -0.8135197, 3.724047, 1, 1, 1, 1, 1,
0.9176149, -0.8117645, 2.923455, 1, 1, 1, 1, 1,
0.919172, -0.4306226, 1.066201, 1, 1, 1, 1, 1,
0.9203309, 0.01781674, 1.654844, 1, 1, 1, 1, 1,
0.9314743, -0.287935, 2.211128, 1, 1, 1, 1, 1,
0.942062, -0.7259142, 2.480282, 1, 1, 1, 1, 1,
0.9451606, -0.1353557, 2.69063, 1, 1, 1, 1, 1,
0.9477847, 0.1653186, 1.299246, 1, 1, 1, 1, 1,
0.9501458, -3.395087, 3.750841, 1, 1, 1, 1, 1,
0.9505832, -1.306451, 2.146361, 1, 1, 1, 1, 1,
0.9507602, 1.796543, 0.8430363, 1, 1, 1, 1, 1,
0.955911, 0.8736126, 2.431135, 1, 1, 1, 1, 1,
0.9631143, 1.055558, 0.1147225, 1, 1, 1, 1, 1,
0.9641249, 0.02995379, 0.1225649, 1, 1, 1, 1, 1,
0.9697388, 0.1713182, 0.7627788, 0, 0, 1, 1, 1,
0.9820537, 0.03811397, 2.173392, 1, 0, 0, 1, 1,
0.9834011, 0.07499038, 0.5297968, 1, 0, 0, 1, 1,
0.9835809, -0.7930202, 2.408336, 1, 0, 0, 1, 1,
0.9879109, 2.410464, 0.6981922, 1, 0, 0, 1, 1,
0.9880829, -1.703267, 3.719614, 1, 0, 0, 1, 1,
0.9921104, 1.202773, 0.8367965, 0, 0, 0, 1, 1,
0.9973857, 0.3039112, 3.546747, 0, 0, 0, 1, 1,
1.004458, 0.7761176, -0.4856631, 0, 0, 0, 1, 1,
1.013713, 0.4049772, 1.831501, 0, 0, 0, 1, 1,
1.014796, 0.1203864, 1.97333, 0, 0, 0, 1, 1,
1.015024, 0.349297, -0.4686337, 0, 0, 0, 1, 1,
1.015231, 0.215624, 1.392865, 0, 0, 0, 1, 1,
1.026917, -0.3178709, 3.444831, 1, 1, 1, 1, 1,
1.029925, 1.009754, -1.239227, 1, 1, 1, 1, 1,
1.03431, -1.356117, 1.188738, 1, 1, 1, 1, 1,
1.040289, -0.126326, 2.423616, 1, 1, 1, 1, 1,
1.041387, -0.6082664, 1.467843, 1, 1, 1, 1, 1,
1.041919, -1.451754, 2.148513, 1, 1, 1, 1, 1,
1.042257, 1.311603, -0.7395598, 1, 1, 1, 1, 1,
1.043911, -1.679815, 3.414262, 1, 1, 1, 1, 1,
1.051057, -0.0431327, 0.940164, 1, 1, 1, 1, 1,
1.056117, -0.0442527, 3.050609, 1, 1, 1, 1, 1,
1.059793, 0.8854938, 2.390278, 1, 1, 1, 1, 1,
1.061264, 1.44575, 0.9644292, 1, 1, 1, 1, 1,
1.062206, -0.1117884, 2.643175, 1, 1, 1, 1, 1,
1.066059, -1.158614, 2.092209, 1, 1, 1, 1, 1,
1.081165, -0.1388218, 2.638164, 1, 1, 1, 1, 1,
1.081432, 0.6586349, 0.5448339, 0, 0, 1, 1, 1,
1.083823, -1.060367, 1.029558, 1, 0, 0, 1, 1,
1.084299, -2.428267, 3.47756, 1, 0, 0, 1, 1,
1.096758, 0.4793801, 1.759786, 1, 0, 0, 1, 1,
1.108316, 1.433379, 0.6413556, 1, 0, 0, 1, 1,
1.11352, -0.3967253, 0.308961, 1, 0, 0, 1, 1,
1.115885, -2.099982, 3.356246, 0, 0, 0, 1, 1,
1.116205, -0.4136781, 2.032806, 0, 0, 0, 1, 1,
1.118233, -0.3441546, -0.07595388, 0, 0, 0, 1, 1,
1.11956, 0.76836, 1.024031, 0, 0, 0, 1, 1,
1.125137, 0.2101291, 3.044574, 0, 0, 0, 1, 1,
1.126658, -0.08451632, 1.255085, 0, 0, 0, 1, 1,
1.135175, -0.8560603, 2.691837, 0, 0, 0, 1, 1,
1.14131, -1.756682, 1.961234, 1, 1, 1, 1, 1,
1.141552, 0.1188017, 2.333351, 1, 1, 1, 1, 1,
1.148321, 2.290794, -0.2983697, 1, 1, 1, 1, 1,
1.171405, -2.310328, 5.263561, 1, 1, 1, 1, 1,
1.173, -0.1573108, 1.784412, 1, 1, 1, 1, 1,
1.199711, -0.03758964, 3.741723, 1, 1, 1, 1, 1,
1.212895, 0.5443514, 1.066498, 1, 1, 1, 1, 1,
1.217946, 0.3069693, 2.102115, 1, 1, 1, 1, 1,
1.219711, -0.9975722, 3.260976, 1, 1, 1, 1, 1,
1.223356, -0.3797932, 1.345962, 1, 1, 1, 1, 1,
1.240949, -0.874155, 0.5254272, 1, 1, 1, 1, 1,
1.258406, -1.950428, 3.808261, 1, 1, 1, 1, 1,
1.267327, 1.04106, 0.3375604, 1, 1, 1, 1, 1,
1.271862, 1.110769, 1.595802, 1, 1, 1, 1, 1,
1.272503, -0.973352, 0.2798144, 1, 1, 1, 1, 1,
1.297357, -0.2317677, 2.0194, 0, 0, 1, 1, 1,
1.297894, -0.968413, 2.054807, 1, 0, 0, 1, 1,
1.300384, 0.1624053, 2.399766, 1, 0, 0, 1, 1,
1.305414, -1.102439, 2.520139, 1, 0, 0, 1, 1,
1.306801, 0.8484903, 0.6264362, 1, 0, 0, 1, 1,
1.311462, 0.356614, -0.2374291, 1, 0, 0, 1, 1,
1.311752, -0.3400874, 3.104349, 0, 0, 0, 1, 1,
1.314272, -1.288157, 2.02106, 0, 0, 0, 1, 1,
1.31996, -1.623057, 2.524827, 0, 0, 0, 1, 1,
1.328598, -0.3294049, 1.891268, 0, 0, 0, 1, 1,
1.332693, 1.613593, 0.5717959, 0, 0, 0, 1, 1,
1.334314, -0.1693832, 1.799729, 0, 0, 0, 1, 1,
1.33447, 0.8891925, -0.08255105, 0, 0, 0, 1, 1,
1.346941, -2.231935, 2.335497, 1, 1, 1, 1, 1,
1.348482, 0.4392842, 2.107245, 1, 1, 1, 1, 1,
1.348855, -1.86109, 2.672874, 1, 1, 1, 1, 1,
1.355543, -0.1722149, 0.7644873, 1, 1, 1, 1, 1,
1.358498, 1.06035, 0.2884616, 1, 1, 1, 1, 1,
1.35998, -0.3392912, 2.163794, 1, 1, 1, 1, 1,
1.360947, -0.08777069, 3.526219, 1, 1, 1, 1, 1,
1.363589, -0.762717, 2.732209, 1, 1, 1, 1, 1,
1.372553, 1.482528, 1.743227, 1, 1, 1, 1, 1,
1.382909, 0.2381573, 1.696378, 1, 1, 1, 1, 1,
1.418465, 0.07008485, 0.37195, 1, 1, 1, 1, 1,
1.426489, -1.298358, 2.61399, 1, 1, 1, 1, 1,
1.430524, 0.6682112, 1.408722, 1, 1, 1, 1, 1,
1.435237, 0.181885, 1.12733, 1, 1, 1, 1, 1,
1.43609, 1.030136, 1.86937, 1, 1, 1, 1, 1,
1.447997, -0.6881694, 1.502004, 0, 0, 1, 1, 1,
1.453293, -1.03861, 2.553275, 1, 0, 0, 1, 1,
1.512291, 0.7770886, 1.762942, 1, 0, 0, 1, 1,
1.513939, -0.4529268, 1.102295, 1, 0, 0, 1, 1,
1.520662, -0.3908988, 2.035065, 1, 0, 0, 1, 1,
1.532024, 0.5114796, 0.4920024, 1, 0, 0, 1, 1,
1.537868, -0.7402044, 0.4686772, 0, 0, 0, 1, 1,
1.539312, -0.6615694, 1.702836, 0, 0, 0, 1, 1,
1.547883, -0.7776027, 1.327303, 0, 0, 0, 1, 1,
1.550217, -0.2115049, 1.432738, 0, 0, 0, 1, 1,
1.556606, 0.478, 1.263111, 0, 0, 0, 1, 1,
1.574648, -1.282787, 2.389597, 0, 0, 0, 1, 1,
1.592602, -0.1265515, 2.352949, 0, 0, 0, 1, 1,
1.595622, -1.543287, 2.269551, 1, 1, 1, 1, 1,
1.604303, 1.42296, 0.7421628, 1, 1, 1, 1, 1,
1.638161, 0.8889274, -0.3997867, 1, 1, 1, 1, 1,
1.639304, -2.645458, 2.496616, 1, 1, 1, 1, 1,
1.650165, -0.4937328, 2.311708, 1, 1, 1, 1, 1,
1.653497, 1.164779, 1.082402, 1, 1, 1, 1, 1,
1.655787, 0.7843531, 0.9874601, 1, 1, 1, 1, 1,
1.682658, -0.5643903, 2.972846, 1, 1, 1, 1, 1,
1.685387, 0.5468964, 2.061683, 1, 1, 1, 1, 1,
1.711128, -0.002276321, 1.530599, 1, 1, 1, 1, 1,
1.715255, -1.839328, 2.414132, 1, 1, 1, 1, 1,
1.72032, -0.4714693, 1.093057, 1, 1, 1, 1, 1,
1.737359, 1.276195, 0.7494596, 1, 1, 1, 1, 1,
1.747997, -0.4884627, 1.953633, 1, 1, 1, 1, 1,
1.753731, -0.2809354, 0.9835978, 1, 1, 1, 1, 1,
1.766113, 0.6135663, -0.6206087, 0, 0, 1, 1, 1,
1.766264, -0.4034005, 1.861812, 1, 0, 0, 1, 1,
1.766283, 0.1602093, 2.258005, 1, 0, 0, 1, 1,
1.77042, -1.288949, 0.7168772, 1, 0, 0, 1, 1,
1.774842, -1.793406, 2.134327, 1, 0, 0, 1, 1,
1.784497, 1.240979, 1.548477, 1, 0, 0, 1, 1,
1.795941, -1.133807, 0.3973674, 0, 0, 0, 1, 1,
1.800219, 0.7373508, 0.3826049, 0, 0, 0, 1, 1,
1.812294, 0.8287016, 0.3956569, 0, 0, 0, 1, 1,
1.830968, 0.8753967, 1.611166, 0, 0, 0, 1, 1,
1.854158, 0.5831915, -0.8197663, 0, 0, 0, 1, 1,
1.877129, -0.4612407, 1.661162, 0, 0, 0, 1, 1,
1.880206, 0.7385082, 1.276927, 0, 0, 0, 1, 1,
1.892129, -0.1753324, 1.552601, 1, 1, 1, 1, 1,
1.893069, 0.6997067, 1.547244, 1, 1, 1, 1, 1,
1.906889, 1.914596, -0.222205, 1, 1, 1, 1, 1,
1.939353, -0.9178889, 4.140447, 1, 1, 1, 1, 1,
1.945671, 1.24459, 0.02750747, 1, 1, 1, 1, 1,
1.955622, 0.4671571, 1.158557, 1, 1, 1, 1, 1,
1.961082, 0.7405813, 1.739945, 1, 1, 1, 1, 1,
1.986728, 0.5167469, 2.340246, 1, 1, 1, 1, 1,
2.034335, -0.6427779, 1.737687, 1, 1, 1, 1, 1,
2.078864, 1.813045, 1.300379, 1, 1, 1, 1, 1,
2.102068, 0.7239792, 0.05953333, 1, 1, 1, 1, 1,
2.138021, 0.7564254, 0.2220969, 1, 1, 1, 1, 1,
2.155671, -0.07001676, 2.937477, 1, 1, 1, 1, 1,
2.169259, -1.096718, 2.738839, 1, 1, 1, 1, 1,
2.261423, -0.03964502, 3.043426, 1, 1, 1, 1, 1,
2.270659, -0.4562835, 3.19975, 0, 0, 1, 1, 1,
2.334392, -0.6830599, 1.369319, 1, 0, 0, 1, 1,
2.335318, 1.303429, 1.250064, 1, 0, 0, 1, 1,
2.342041, -0.4009318, 1.017958, 1, 0, 0, 1, 1,
2.350348, -0.9405962, 3.01725, 1, 0, 0, 1, 1,
2.357277, -1.319486, 2.312095, 1, 0, 0, 1, 1,
2.389285, -0.7378866, 1.20965, 0, 0, 0, 1, 1,
2.524309, 0.04648965, 1.409341, 0, 0, 0, 1, 1,
2.525461, -0.8529775, 2.61635, 0, 0, 0, 1, 1,
2.558643, -1.543506, 2.360839, 0, 0, 0, 1, 1,
2.642342, 0.2734055, 1.792007, 0, 0, 0, 1, 1,
2.647898, 1.267958, 2.849307, 0, 0, 0, 1, 1,
2.673597, -0.7815177, 0.8074027, 0, 0, 0, 1, 1,
2.729245, -0.09939954, 0.9676681, 1, 1, 1, 1, 1,
2.784941, -1.125706, 2.247486, 1, 1, 1, 1, 1,
2.816572, -0.4530813, 1.769837, 1, 1, 1, 1, 1,
2.947485, 1.872495, 1.469864, 1, 1, 1, 1, 1,
3.0082, -0.3369437, 0.9252207, 1, 1, 1, 1, 1,
3.09947, 0.3350207, 2.762327, 1, 1, 1, 1, 1,
3.138338, 0.4268019, 2.507916, 1, 1, 1, 1, 1
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
var radius = 9.485614;
var distance = 33.31782;
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
mvMatrix.translate( -0.1103449, -0.07276845, -0.1043937 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.31782);
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
