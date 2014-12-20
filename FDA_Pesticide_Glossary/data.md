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
-3.686737, 1.489807, -2.444744, 1, 0, 0, 1,
-3.403867, 0.3052364, -1.137016, 1, 0.007843138, 0, 1,
-3.369438, -1.839931, -1.934471, 1, 0.01176471, 0, 1,
-3.015423, 0.6466348, -2.481892, 1, 0.01960784, 0, 1,
-2.72321, 1.130719, -1.732965, 1, 0.02352941, 0, 1,
-2.640276, -0.6372321, -0.3083923, 1, 0.03137255, 0, 1,
-2.583427, -1.630737, -1.194486, 1, 0.03529412, 0, 1,
-2.385505, 1.053602, 0.6341532, 1, 0.04313726, 0, 1,
-2.385228, -0.1441433, -1.904581, 1, 0.04705882, 0, 1,
-2.34864, -2.255268, -2.713149, 1, 0.05490196, 0, 1,
-2.339521, -1.223872, -5.101376, 1, 0.05882353, 0, 1,
-2.336576, 2.319022, -1.007962, 1, 0.06666667, 0, 1,
-2.316503, -1.378213, -0.6567013, 1, 0.07058824, 0, 1,
-2.305, 1.605411, -2.152876, 1, 0.07843138, 0, 1,
-2.298901, 1.123677, -1.025453, 1, 0.08235294, 0, 1,
-2.287366, -0.2860471, -1.424748, 1, 0.09019608, 0, 1,
-2.269658, 1.485206, -1.860622, 1, 0.09411765, 0, 1,
-2.217699, 1.700938, -2.525467, 1, 0.1019608, 0, 1,
-2.167496, -1.28864, -2.139645, 1, 0.1098039, 0, 1,
-2.154289, -0.1984529, -3.716995, 1, 0.1137255, 0, 1,
-2.136467, -0.6719321, -1.091746, 1, 0.1215686, 0, 1,
-2.110903, 1.043032, -2.017775, 1, 0.1254902, 0, 1,
-2.085051, -1.382422, -2.333314, 1, 0.1333333, 0, 1,
-2.074217, 0.2121516, -1.105243, 1, 0.1372549, 0, 1,
-2.073185, 0.3833403, -1.925983, 1, 0.145098, 0, 1,
-2.044284, 0.1715425, -1.521333, 1, 0.1490196, 0, 1,
-2.038602, 0.1785183, -2.208575, 1, 0.1568628, 0, 1,
-2.020255, 1.567243, -0.8844824, 1, 0.1607843, 0, 1,
-2.006496, -0.3703736, -3.220295, 1, 0.1686275, 0, 1,
-2.005739, 0.1823008, -0.7892686, 1, 0.172549, 0, 1,
-1.989556, -0.924851, 0.4631551, 1, 0.1803922, 0, 1,
-1.98736, -2.032896, -2.532774, 1, 0.1843137, 0, 1,
-1.981623, -0.1539549, -1.996015, 1, 0.1921569, 0, 1,
-1.96824, -0.4475718, 0.84105, 1, 0.1960784, 0, 1,
-1.966747, 0.1635574, -3.282635, 1, 0.2039216, 0, 1,
-1.954284, 0.1610883, -1.018917, 1, 0.2117647, 0, 1,
-1.917997, 0.3969943, -1.641679, 1, 0.2156863, 0, 1,
-1.904918, 0.2296805, -1.883325, 1, 0.2235294, 0, 1,
-1.886392, -0.7398839, -3.219775, 1, 0.227451, 0, 1,
-1.885495, -1.041236, -2.04766, 1, 0.2352941, 0, 1,
-1.866689, -1.210995, -1.267523, 1, 0.2392157, 0, 1,
-1.864614, 0.5671112, -2.315479, 1, 0.2470588, 0, 1,
-1.829333, -0.7042478, -1.726629, 1, 0.2509804, 0, 1,
-1.822687, 1.337208, -1.177486, 1, 0.2588235, 0, 1,
-1.810837, 0.6455992, -1.711889, 1, 0.2627451, 0, 1,
-1.810201, 0.6377044, -0.8770891, 1, 0.2705882, 0, 1,
-1.801428, -0.1406091, -2.267707, 1, 0.2745098, 0, 1,
-1.790945, 2.050176, -0.9806716, 1, 0.282353, 0, 1,
-1.788273, 0.3957736, -2.441407, 1, 0.2862745, 0, 1,
-1.780659, 0.6815478, 0.0128292, 1, 0.2941177, 0, 1,
-1.761858, 1.631759, -2.145986, 1, 0.3019608, 0, 1,
-1.747908, -0.2710807, -1.071116, 1, 0.3058824, 0, 1,
-1.746079, 1.191273, -0.1047044, 1, 0.3137255, 0, 1,
-1.740591, 0.03428343, -1.800584, 1, 0.3176471, 0, 1,
-1.729343, 0.1071492, 0.006620495, 1, 0.3254902, 0, 1,
-1.725646, 0.2530719, -2.454914, 1, 0.3294118, 0, 1,
-1.722475, 0.5710118, -0.4472849, 1, 0.3372549, 0, 1,
-1.716907, 1.007526, -1.310083, 1, 0.3411765, 0, 1,
-1.694515, -0.7805143, -2.915608, 1, 0.3490196, 0, 1,
-1.67319, 0.2648886, -1.707025, 1, 0.3529412, 0, 1,
-1.663896, -0.8645607, -1.899601, 1, 0.3607843, 0, 1,
-1.658842, -0.6442868, -1.43063, 1, 0.3647059, 0, 1,
-1.654724, 0.8539901, -2.711641, 1, 0.372549, 0, 1,
-1.64992, 1.828199, 0.1591727, 1, 0.3764706, 0, 1,
-1.64175, -1.534805, -2.247078, 1, 0.3843137, 0, 1,
-1.629304, -1.026768, -1.912891, 1, 0.3882353, 0, 1,
-1.623263, -0.4578251, -2.082078, 1, 0.3960784, 0, 1,
-1.613475, -0.07180357, -0.6729371, 1, 0.4039216, 0, 1,
-1.592179, 2.538069, -0.226374, 1, 0.4078431, 0, 1,
-1.587944, 0.8391073, 0.1425231, 1, 0.4156863, 0, 1,
-1.584405, 1.633036, -0.6671859, 1, 0.4196078, 0, 1,
-1.580405, 1.439397, -1.341748, 1, 0.427451, 0, 1,
-1.574713, -0.1041869, -1.473311, 1, 0.4313726, 0, 1,
-1.560608, -0.1289634, -1.852446, 1, 0.4392157, 0, 1,
-1.55943, -0.1495276, -2.641161, 1, 0.4431373, 0, 1,
-1.537306, 1.764017, 0.254728, 1, 0.4509804, 0, 1,
-1.53526, 0.7351598, -0.3481735, 1, 0.454902, 0, 1,
-1.487612, 0.762879, -0.6790931, 1, 0.4627451, 0, 1,
-1.480732, 1.938825, -1.081276, 1, 0.4666667, 0, 1,
-1.477271, -0.5008084, -1.228857, 1, 0.4745098, 0, 1,
-1.458561, 1.486249, -1.033994, 1, 0.4784314, 0, 1,
-1.45363, -0.923768, -1.314425, 1, 0.4862745, 0, 1,
-1.438912, 0.4375779, -0.4232596, 1, 0.4901961, 0, 1,
-1.4357, 1.007295, 0.6579367, 1, 0.4980392, 0, 1,
-1.42682, -1.318279, -1.963864, 1, 0.5058824, 0, 1,
-1.421594, -0.03165344, -1.472743, 1, 0.509804, 0, 1,
-1.420743, 1.904192, -2.024728, 1, 0.5176471, 0, 1,
-1.410547, 0.2232007, -1.066311, 1, 0.5215687, 0, 1,
-1.405315, 1.595997, -1.089708, 1, 0.5294118, 0, 1,
-1.399602, -1.112769, -2.159483, 1, 0.5333334, 0, 1,
-1.389806, 2.308141, -0.289367, 1, 0.5411765, 0, 1,
-1.387238, -0.102344, -3.162781, 1, 0.5450981, 0, 1,
-1.385368, 0.02647283, -2.970805, 1, 0.5529412, 0, 1,
-1.38008, -0.3176821, -2.053394, 1, 0.5568628, 0, 1,
-1.374731, 0.009703355, -0.2693136, 1, 0.5647059, 0, 1,
-1.365568, -0.8372144, -1.957182, 1, 0.5686275, 0, 1,
-1.362007, 0.4634198, -0.6243806, 1, 0.5764706, 0, 1,
-1.351012, -0.24255, -0.9665408, 1, 0.5803922, 0, 1,
-1.341399, 1.742114, -0.3333928, 1, 0.5882353, 0, 1,
-1.339297, -1.180255, -2.556321, 1, 0.5921569, 0, 1,
-1.330057, -0.08935204, -1.709271, 1, 0.6, 0, 1,
-1.330055, -0.1789847, -1.819451, 1, 0.6078432, 0, 1,
-1.325603, 0.7820058, -1.079355, 1, 0.6117647, 0, 1,
-1.320312, 0.7593961, 1.200437, 1, 0.6196079, 0, 1,
-1.319023, 0.9504081, 0.4368784, 1, 0.6235294, 0, 1,
-1.299846, -0.3131479, -0.6460203, 1, 0.6313726, 0, 1,
-1.291908, 1.287644, -1.577443, 1, 0.6352941, 0, 1,
-1.290989, 0.184304, -3.946093, 1, 0.6431373, 0, 1,
-1.288425, 0.5184338, -1.32357, 1, 0.6470588, 0, 1,
-1.284187, 0.6915811, -1.026218, 1, 0.654902, 0, 1,
-1.274249, 0.1843362, 0.2839233, 1, 0.6588235, 0, 1,
-1.273592, 0.6944027, -2.049959, 1, 0.6666667, 0, 1,
-1.272538, -0.7798473, -2.479908, 1, 0.6705883, 0, 1,
-1.27059, 0.7840921, 0.2512072, 1, 0.6784314, 0, 1,
-1.266506, -0.03393916, -1.684988, 1, 0.682353, 0, 1,
-1.234115, 1.047771, -1.164348, 1, 0.6901961, 0, 1,
-1.232164, 1.130337, -1.440262, 1, 0.6941177, 0, 1,
-1.222874, -0.01750305, -0.5003766, 1, 0.7019608, 0, 1,
-1.217482, -0.3799657, -0.9992542, 1, 0.7098039, 0, 1,
-1.216896, -0.869643, -2.557569, 1, 0.7137255, 0, 1,
-1.216825, -0.5016975, -1.921353, 1, 0.7215686, 0, 1,
-1.20993, -0.3208776, -2.569771, 1, 0.7254902, 0, 1,
-1.202236, -1.267441, -2.50872, 1, 0.7333333, 0, 1,
-1.193279, -0.5837002, -3.294132, 1, 0.7372549, 0, 1,
-1.192859, -0.4102032, -2.001976, 1, 0.7450981, 0, 1,
-1.18175, 0.1991935, -2.604013, 1, 0.7490196, 0, 1,
-1.180198, 1.133288, -0.5790565, 1, 0.7568628, 0, 1,
-1.178579, 1.435524, 0.3857117, 1, 0.7607843, 0, 1,
-1.17731, -0.5112987, -3.308569, 1, 0.7686275, 0, 1,
-1.176331, -0.8599895, -2.413088, 1, 0.772549, 0, 1,
-1.175796, -0.3956694, -3.680207, 1, 0.7803922, 0, 1,
-1.175302, 0.08275811, -0.9935536, 1, 0.7843137, 0, 1,
-1.17464, -0.07903703, -1.832307, 1, 0.7921569, 0, 1,
-1.172548, 1.512392, -1.540638, 1, 0.7960784, 0, 1,
-1.168342, -0.5015466, -1.896169, 1, 0.8039216, 0, 1,
-1.162544, -0.8979192, -1.540983, 1, 0.8117647, 0, 1,
-1.153194, 1.418806, -0.122453, 1, 0.8156863, 0, 1,
-1.14878, 0.8717555, -0.1703968, 1, 0.8235294, 0, 1,
-1.144764, 0.7851065, -0.7943262, 1, 0.827451, 0, 1,
-1.142797, -0.9670125, -1.802529, 1, 0.8352941, 0, 1,
-1.135103, 0.05679845, -0.2806114, 1, 0.8392157, 0, 1,
-1.121586, -0.2003893, -0.9274151, 1, 0.8470588, 0, 1,
-1.119832, 1.270054, -1.834851, 1, 0.8509804, 0, 1,
-1.119468, 1.646944, -1.037108, 1, 0.8588235, 0, 1,
-1.118425, -0.7967251, -0.3319294, 1, 0.8627451, 0, 1,
-1.115119, 1.135642, -1.30225, 1, 0.8705882, 0, 1,
-1.109837, -0.4238898, -2.297732, 1, 0.8745098, 0, 1,
-1.109536, 0.8919376, -1.905383, 1, 0.8823529, 0, 1,
-1.106812, -0.478023, -1.254291, 1, 0.8862745, 0, 1,
-1.10535, -0.129203, -1.290105, 1, 0.8941177, 0, 1,
-1.099934, 0.636894, -1.559246, 1, 0.8980392, 0, 1,
-1.095443, 0.4339173, -0.6966988, 1, 0.9058824, 0, 1,
-1.093068, 1.138716, 0.01048188, 1, 0.9137255, 0, 1,
-1.086405, 2.401558, 0.9287916, 1, 0.9176471, 0, 1,
-1.079178, -0.8547745, -2.334055, 1, 0.9254902, 0, 1,
-1.078964, -1.375932, -1.190816, 1, 0.9294118, 0, 1,
-1.078152, -1.271588, -1.84827, 1, 0.9372549, 0, 1,
-1.070653, 0.4323064, -0.8803533, 1, 0.9411765, 0, 1,
-1.069232, 0.5629494, -0.7503162, 1, 0.9490196, 0, 1,
-1.066471, 0.9703196, 1.285346, 1, 0.9529412, 0, 1,
-1.065394, 1.401469, -0.5631859, 1, 0.9607843, 0, 1,
-1.06347, 1.241063, 1.017391, 1, 0.9647059, 0, 1,
-1.059844, -1.453348, -4.986914, 1, 0.972549, 0, 1,
-1.058802, 0.4692614, -0.7867672, 1, 0.9764706, 0, 1,
-1.044084, -0.3061135, -1.388651, 1, 0.9843137, 0, 1,
-1.042544, 0.3206171, -1.654991, 1, 0.9882353, 0, 1,
-1.034469, 0.3676835, -1.278674, 1, 0.9960784, 0, 1,
-1.025703, -0.233482, -3.15388, 0.9960784, 1, 0, 1,
-1.023031, -0.9313985, -2.669155, 0.9921569, 1, 0, 1,
-1.011077, -1.073875, -0.5679525, 0.9843137, 1, 0, 1,
-1.006235, -0.5879823, -2.758187, 0.9803922, 1, 0, 1,
-1.004882, -0.546816, -2.975249, 0.972549, 1, 0, 1,
-1.00061, 2.305418, 0.6728233, 0.9686275, 1, 0, 1,
-0.9974294, 1.047627, -1.1582, 0.9607843, 1, 0, 1,
-0.9861892, -1.062164, -2.481957, 0.9568627, 1, 0, 1,
-0.9844463, -0.3968171, -4.675343, 0.9490196, 1, 0, 1,
-0.9689122, -1.208842, -1.779373, 0.945098, 1, 0, 1,
-0.9680114, -1.828724, -4.126747, 0.9372549, 1, 0, 1,
-0.9661843, 0.2584531, -2.252927, 0.9333333, 1, 0, 1,
-0.9620056, -0.7619743, -1.54821, 0.9254902, 1, 0, 1,
-0.9563739, 0.4325584, -1.40629, 0.9215686, 1, 0, 1,
-0.9548202, -0.2107725, -1.00259, 0.9137255, 1, 0, 1,
-0.9543492, 0.6794441, -0.8555375, 0.9098039, 1, 0, 1,
-0.9490467, -0.892481, -1.666661, 0.9019608, 1, 0, 1,
-0.9415201, 0.9995333, -1.019905, 0.8941177, 1, 0, 1,
-0.9246889, 0.2704313, -2.111969, 0.8901961, 1, 0, 1,
-0.9206495, 0.08868418, -1.707715, 0.8823529, 1, 0, 1,
-0.9159648, 0.9012299, -1.61866, 0.8784314, 1, 0, 1,
-0.912263, 1.267222, -0.9685376, 0.8705882, 1, 0, 1,
-0.9113088, -1.62004, -3.286311, 0.8666667, 1, 0, 1,
-0.9071219, -0.2414251, -2.92241, 0.8588235, 1, 0, 1,
-0.899031, 1.694036, -0.1641674, 0.854902, 1, 0, 1,
-0.8985315, 0.4509782, -1.974244, 0.8470588, 1, 0, 1,
-0.8961181, -0.104233, -1.061272, 0.8431373, 1, 0, 1,
-0.8952177, 0.4604407, 0.3526296, 0.8352941, 1, 0, 1,
-0.8939111, -0.9371392, -4.402097, 0.8313726, 1, 0, 1,
-0.8911899, -1.025647, -2.442985, 0.8235294, 1, 0, 1,
-0.8864317, 0.004613359, -0.9494695, 0.8196079, 1, 0, 1,
-0.8796049, -0.05776201, -0.4477211, 0.8117647, 1, 0, 1,
-0.8780783, -0.8824446, -3.062276, 0.8078431, 1, 0, 1,
-0.8737129, 0.1760046, -2.497751, 0.8, 1, 0, 1,
-0.8735152, -1.529736, -2.686577, 0.7921569, 1, 0, 1,
-0.8735034, -1.621687, -1.76797, 0.7882353, 1, 0, 1,
-0.8659048, -0.2543075, -2.977127, 0.7803922, 1, 0, 1,
-0.8623955, -1.399582, -1.826102, 0.7764706, 1, 0, 1,
-0.8616225, -0.2065901, -2.915373, 0.7686275, 1, 0, 1,
-0.8609429, -2.117817, -2.037802, 0.7647059, 1, 0, 1,
-0.8591953, -0.1162931, -2.986871, 0.7568628, 1, 0, 1,
-0.8587784, 0.279271, -1.165187, 0.7529412, 1, 0, 1,
-0.8554599, -0.9153976, -2.26568, 0.7450981, 1, 0, 1,
-0.8540793, -0.4666722, -2.324317, 0.7411765, 1, 0, 1,
-0.845256, -0.129122, -3.997126, 0.7333333, 1, 0, 1,
-0.8368915, -2.062523, -2.794384, 0.7294118, 1, 0, 1,
-0.8358122, 3.419817, -0.1519747, 0.7215686, 1, 0, 1,
-0.8319368, -0.3614566, -2.023528, 0.7176471, 1, 0, 1,
-0.8311533, 0.5997142, -1.767197, 0.7098039, 1, 0, 1,
-0.8266294, 0.9891665, -1.007761, 0.7058824, 1, 0, 1,
-0.8264657, -1.452732, -0.2828337, 0.6980392, 1, 0, 1,
-0.8256176, 0.9318276, -0.09825645, 0.6901961, 1, 0, 1,
-0.8218631, -0.9251616, -3.522771, 0.6862745, 1, 0, 1,
-0.8187419, -0.7822083, -3.644015, 0.6784314, 1, 0, 1,
-0.8162669, 0.9679327, -0.2907253, 0.6745098, 1, 0, 1,
-0.8145819, 1.782881, -1.699315, 0.6666667, 1, 0, 1,
-0.811469, 1.339306, -1.087271, 0.6627451, 1, 0, 1,
-0.8102127, -0.9847506, -2.848591, 0.654902, 1, 0, 1,
-0.8090175, 0.3934394, -3.195908, 0.6509804, 1, 0, 1,
-0.805905, -0.4134222, -1.832896, 0.6431373, 1, 0, 1,
-0.7972375, 1.918154, 0.7499894, 0.6392157, 1, 0, 1,
-0.79334, 1.084582, -0.9584647, 0.6313726, 1, 0, 1,
-0.7803106, 0.3515744, -1.767559, 0.627451, 1, 0, 1,
-0.7724209, -0.4491515, -0.3449487, 0.6196079, 1, 0, 1,
-0.7646625, -0.6051461, -2.389198, 0.6156863, 1, 0, 1,
-0.757941, 0.1767229, -1.384473, 0.6078432, 1, 0, 1,
-0.7571626, 0.04889692, -1.288849, 0.6039216, 1, 0, 1,
-0.7534545, -0.389087, -0.964917, 0.5960785, 1, 0, 1,
-0.7528617, 0.5865025, -1.276827, 0.5882353, 1, 0, 1,
-0.7468976, -1.244637, -3.118828, 0.5843138, 1, 0, 1,
-0.7466774, 0.5158746, -0.2956183, 0.5764706, 1, 0, 1,
-0.7429381, 1.194686, -0.4271462, 0.572549, 1, 0, 1,
-0.7400788, 2.08512, -0.01449106, 0.5647059, 1, 0, 1,
-0.7394492, -1.363217, -2.32777, 0.5607843, 1, 0, 1,
-0.738942, -0.1410446, -3.999144, 0.5529412, 1, 0, 1,
-0.7375579, 1.319732, 0.1943376, 0.5490196, 1, 0, 1,
-0.7370027, 1.133137, -0.7566437, 0.5411765, 1, 0, 1,
-0.7317641, 0.03599968, -1.985116, 0.5372549, 1, 0, 1,
-0.7314243, 0.1966419, -0.5703591, 0.5294118, 1, 0, 1,
-0.7301461, -1.007999, -2.66556, 0.5254902, 1, 0, 1,
-0.7275194, 1.252295, -0.09219375, 0.5176471, 1, 0, 1,
-0.7240494, -0.1001185, -1.406519, 0.5137255, 1, 0, 1,
-0.7203249, -0.3143688, -2.936792, 0.5058824, 1, 0, 1,
-0.7181396, 0.1352063, -2.304172, 0.5019608, 1, 0, 1,
-0.717186, 0.3173264, -0.07600942, 0.4941176, 1, 0, 1,
-0.7166989, 1.655812, -1.206433, 0.4862745, 1, 0, 1,
-0.7121856, 0.2727441, -2.356169, 0.4823529, 1, 0, 1,
-0.7104698, 0.0820629, -0.9978839, 0.4745098, 1, 0, 1,
-0.7096862, 1.096265, -1.402456, 0.4705882, 1, 0, 1,
-0.7073685, -0.8619544, -1.813002, 0.4627451, 1, 0, 1,
-0.7034019, -0.03697642, -0.6907223, 0.4588235, 1, 0, 1,
-0.7019721, 0.7445639, -1.1172, 0.4509804, 1, 0, 1,
-0.7014647, -0.5688702, -2.775722, 0.4470588, 1, 0, 1,
-0.6987979, 0.3702469, -0.334054, 0.4392157, 1, 0, 1,
-0.6986886, 1.747834, -0.2391166, 0.4352941, 1, 0, 1,
-0.6984522, 0.03548485, -0.6823581, 0.427451, 1, 0, 1,
-0.6838312, 0.8474007, -1.097341, 0.4235294, 1, 0, 1,
-0.6830043, -0.2873926, -2.365055, 0.4156863, 1, 0, 1,
-0.6813014, -1.291884, -3.781663, 0.4117647, 1, 0, 1,
-0.6705393, -0.4475459, -1.502766, 0.4039216, 1, 0, 1,
-0.6664572, 1.78983, 0.7385599, 0.3960784, 1, 0, 1,
-0.6546207, -0.2934074, -2.794488, 0.3921569, 1, 0, 1,
-0.6520231, -0.4549929, -1.478477, 0.3843137, 1, 0, 1,
-0.6468791, 0.6820483, -2.985661, 0.3803922, 1, 0, 1,
-0.6438377, 0.4066076, 0.2388105, 0.372549, 1, 0, 1,
-0.6369814, -0.5094627, -2.295486, 0.3686275, 1, 0, 1,
-0.6345673, 1.932549, -1.065149, 0.3607843, 1, 0, 1,
-0.6264041, -0.1890367, -1.174402, 0.3568628, 1, 0, 1,
-0.6249951, -1.334739, -2.613419, 0.3490196, 1, 0, 1,
-0.6224291, 1.064164, -0.7399771, 0.345098, 1, 0, 1,
-0.6212196, -0.212912, -2.115329, 0.3372549, 1, 0, 1,
-0.6208374, 0.4634115, -2.523584, 0.3333333, 1, 0, 1,
-0.6201221, -0.8782986, -2.633472, 0.3254902, 1, 0, 1,
-0.6169624, -1.160195, -1.989461, 0.3215686, 1, 0, 1,
-0.6104711, -0.6763173, -2.252364, 0.3137255, 1, 0, 1,
-0.6063452, -1.170836, -4.454016, 0.3098039, 1, 0, 1,
-0.6022425, -1.212871, -0.1805792, 0.3019608, 1, 0, 1,
-0.5994452, 1.07059, -0.3696751, 0.2941177, 1, 0, 1,
-0.5917138, 0.4502655, -0.6412827, 0.2901961, 1, 0, 1,
-0.5915801, -1.54326, -2.474423, 0.282353, 1, 0, 1,
-0.5893159, 0.6453404, 0.09431977, 0.2784314, 1, 0, 1,
-0.5879757, -0.4089216, -3.38008, 0.2705882, 1, 0, 1,
-0.5829798, 0.4732262, 0.2169826, 0.2666667, 1, 0, 1,
-0.5828559, -0.07611492, -0.2348347, 0.2588235, 1, 0, 1,
-0.5814346, -0.271161, -1.527439, 0.254902, 1, 0, 1,
-0.5802153, 0.4388159, -0.4877392, 0.2470588, 1, 0, 1,
-0.579701, -0.1826455, 0.9171097, 0.2431373, 1, 0, 1,
-0.5789028, -0.3548965, -1.815493, 0.2352941, 1, 0, 1,
-0.5768212, 1.060413, -0.2542322, 0.2313726, 1, 0, 1,
-0.5736907, -1.45878, -3.348279, 0.2235294, 1, 0, 1,
-0.5728665, -1.957687, -2.810373, 0.2196078, 1, 0, 1,
-0.5721409, 0.4754843, -1.278688, 0.2117647, 1, 0, 1,
-0.5703752, -0.240962, -2.562864, 0.2078431, 1, 0, 1,
-0.5658293, 0.0481689, -2.451029, 0.2, 1, 0, 1,
-0.5646921, 1.70714, 0.5352603, 0.1921569, 1, 0, 1,
-0.5609861, -1.27795, -2.817774, 0.1882353, 1, 0, 1,
-0.5609429, -1.016705, -3.718011, 0.1803922, 1, 0, 1,
-0.5556355, -0.03210241, -1.642386, 0.1764706, 1, 0, 1,
-0.5517782, -0.6956301, -3.371998, 0.1686275, 1, 0, 1,
-0.550159, -0.03713533, -3.135773, 0.1647059, 1, 0, 1,
-0.5486062, 0.952613, -0.29313, 0.1568628, 1, 0, 1,
-0.545565, 0.7000505, -0.250266, 0.1529412, 1, 0, 1,
-0.5426088, 2.202689, 0.1277395, 0.145098, 1, 0, 1,
-0.5423687, -0.3794286, -3.25915, 0.1411765, 1, 0, 1,
-0.5411727, 0.2325123, -0.9517638, 0.1333333, 1, 0, 1,
-0.5377054, -0.2477283, -1.572607, 0.1294118, 1, 0, 1,
-0.528261, 0.9317332, -1.280018, 0.1215686, 1, 0, 1,
-0.5224005, 0.7031497, 0.3054663, 0.1176471, 1, 0, 1,
-0.5209818, -0.5461822, -1.038026, 0.1098039, 1, 0, 1,
-0.5174551, 0.4898056, -0.6716239, 0.1058824, 1, 0, 1,
-0.5157331, -0.5775598, -2.427078, 0.09803922, 1, 0, 1,
-0.5019127, 0.358657, 1.750084, 0.09019608, 1, 0, 1,
-0.5017881, 1.936718, 0.2384681, 0.08627451, 1, 0, 1,
-0.5007092, -2.515268, -2.33717, 0.07843138, 1, 0, 1,
-0.4960403, -0.3952023, -1.316687, 0.07450981, 1, 0, 1,
-0.492049, -0.3120053, -2.714856, 0.06666667, 1, 0, 1,
-0.4821528, 0.7295264, -0.04835901, 0.0627451, 1, 0, 1,
-0.4789191, 1.291133, -1.815463, 0.05490196, 1, 0, 1,
-0.4709231, 0.002243311, -2.426105, 0.05098039, 1, 0, 1,
-0.4695965, -1.568536, -4.209843, 0.04313726, 1, 0, 1,
-0.468749, 1.654997, -0.181425, 0.03921569, 1, 0, 1,
-0.4677346, 0.1004663, -1.132833, 0.03137255, 1, 0, 1,
-0.4632094, 0.4323185, 0.2654015, 0.02745098, 1, 0, 1,
-0.4579399, 0.3869434, -0.5204613, 0.01960784, 1, 0, 1,
-0.4571624, 0.1380675, -0.6149923, 0.01568628, 1, 0, 1,
-0.4555153, -1.849395, -0.2689779, 0.007843138, 1, 0, 1,
-0.4541582, 2.08818, -1.123627, 0.003921569, 1, 0, 1,
-0.4533699, 0.8834963, -0.8836436, 0, 1, 0.003921569, 1,
-0.4522227, 0.4534542, -0.2150777, 0, 1, 0.01176471, 1,
-0.4434414, 1.094101, -0.9832073, 0, 1, 0.01568628, 1,
-0.4331503, 2.498512, 0.6763157, 0, 1, 0.02352941, 1,
-0.4279346, 0.4234349, 0.08175439, 0, 1, 0.02745098, 1,
-0.4272689, -0.5247789, -1.95977, 0, 1, 0.03529412, 1,
-0.4236332, -1.015609, -3.220284, 0, 1, 0.03921569, 1,
-0.4231531, 0.8568016, -0.1410773, 0, 1, 0.04705882, 1,
-0.4210371, -0.1216092, -1.650322, 0, 1, 0.05098039, 1,
-0.4112081, 0.083938, -2.708956, 0, 1, 0.05882353, 1,
-0.4049987, -2.773762, -5.49253, 0, 1, 0.0627451, 1,
-0.4035289, -1.788028, -2.745099, 0, 1, 0.07058824, 1,
-0.4031424, 1.418292, 0.5502411, 0, 1, 0.07450981, 1,
-0.4026688, 1.60574, 0.001926734, 0, 1, 0.08235294, 1,
-0.3983062, 0.04095973, -1.645992, 0, 1, 0.08627451, 1,
-0.3829204, 0.9865566, -1.019598, 0, 1, 0.09411765, 1,
-0.3826854, 0.1337973, 0.2631239, 0, 1, 0.1019608, 1,
-0.3726682, 0.3142905, 0.3350856, 0, 1, 0.1058824, 1,
-0.3684449, -1.337109, -4.506941, 0, 1, 0.1137255, 1,
-0.3640602, 0.6579999, 1.028041, 0, 1, 0.1176471, 1,
-0.3542606, 0.1343528, -1.14231, 0, 1, 0.1254902, 1,
-0.3538942, 0.7688856, -0.5107334, 0, 1, 0.1294118, 1,
-0.3518465, -2.065552, -1.997157, 0, 1, 0.1372549, 1,
-0.3514979, -0.6157725, -3.653136, 0, 1, 0.1411765, 1,
-0.3451808, 0.2013994, -1.136277, 0, 1, 0.1490196, 1,
-0.3449397, -0.4260515, -1.037049, 0, 1, 0.1529412, 1,
-0.3448586, 0.9344921, -0.9872457, 0, 1, 0.1607843, 1,
-0.343655, 0.9444587, -1.743336, 0, 1, 0.1647059, 1,
-0.3427827, 1.659874, -0.8560477, 0, 1, 0.172549, 1,
-0.3424847, 0.7253115, -0.05495434, 0, 1, 0.1764706, 1,
-0.3408971, -0.1049216, -0.991264, 0, 1, 0.1843137, 1,
-0.3392969, -0.08576124, -1.281222, 0, 1, 0.1882353, 1,
-0.3378108, 0.3083736, -0.9820791, 0, 1, 0.1960784, 1,
-0.3355794, -1.298363, -2.288509, 0, 1, 0.2039216, 1,
-0.3342056, -1.456032, -3.235056, 0, 1, 0.2078431, 1,
-0.3327049, 0.8439438, -2.589863, 0, 1, 0.2156863, 1,
-0.3282447, 0.1788015, -1.891926, 0, 1, 0.2196078, 1,
-0.3249144, -2.157075, -3.994331, 0, 1, 0.227451, 1,
-0.3218304, -1.467076, -3.160254, 0, 1, 0.2313726, 1,
-0.3210531, 1.002681, -0.6800118, 0, 1, 0.2392157, 1,
-0.3184493, -0.8592513, -2.685765, 0, 1, 0.2431373, 1,
-0.3180147, 2.194739, -1.828855, 0, 1, 0.2509804, 1,
-0.317855, 0.1157105, -1.96508, 0, 1, 0.254902, 1,
-0.3131699, 0.09011842, -2.293906, 0, 1, 0.2627451, 1,
-0.3125721, 0.1173645, 0.2739624, 0, 1, 0.2666667, 1,
-0.3093257, -0.3341647, -3.736507, 0, 1, 0.2745098, 1,
-0.3077423, -0.1938075, -2.841759, 0, 1, 0.2784314, 1,
-0.3047692, -0.3403508, -0.968521, 0, 1, 0.2862745, 1,
-0.2953511, -0.2718902, -1.336794, 0, 1, 0.2901961, 1,
-0.2915757, 1.132569, -0.2680299, 0, 1, 0.2980392, 1,
-0.2865211, 0.7295955, -1.754658, 0, 1, 0.3058824, 1,
-0.286191, -0.2140385, -1.722232, 0, 1, 0.3098039, 1,
-0.2796707, -1.642334, -1.886978, 0, 1, 0.3176471, 1,
-0.2787048, -0.3773639, -2.298876, 0, 1, 0.3215686, 1,
-0.2726666, 0.2075931, -0.28497, 0, 1, 0.3294118, 1,
-0.2707675, -0.470817, -3.932734, 0, 1, 0.3333333, 1,
-0.2695719, 0.4606149, -2.45183, 0, 1, 0.3411765, 1,
-0.2654182, 0.3197263, -2.258756, 0, 1, 0.345098, 1,
-0.2644713, -0.1240235, -3.701846, 0, 1, 0.3529412, 1,
-0.2624111, -0.1668992, -2.885455, 0, 1, 0.3568628, 1,
-0.2615885, 0.1435145, 0.063696, 0, 1, 0.3647059, 1,
-0.2602838, 0.2102582, -0.5560032, 0, 1, 0.3686275, 1,
-0.2581096, 0.7678772, -0.3534636, 0, 1, 0.3764706, 1,
-0.2534687, 0.5088915, -0.6647863, 0, 1, 0.3803922, 1,
-0.2486543, 0.7442795, -0.5575087, 0, 1, 0.3882353, 1,
-0.2482208, 0.1794877, -0.5662783, 0, 1, 0.3921569, 1,
-0.2454654, 0.4365611, 1.989851, 0, 1, 0.4, 1,
-0.2439658, -1.785901, -2.937637, 0, 1, 0.4078431, 1,
-0.2400936, 0.9259024, -2.027118, 0, 1, 0.4117647, 1,
-0.2392965, 1.56054, 0.2535276, 0, 1, 0.4196078, 1,
-0.2363232, -0.7111634, -2.479476, 0, 1, 0.4235294, 1,
-0.2337757, 1.321809, -0.01127371, 0, 1, 0.4313726, 1,
-0.2322599, 0.5832492, 1.639133, 0, 1, 0.4352941, 1,
-0.22907, 0.8246784, -1.255616, 0, 1, 0.4431373, 1,
-0.2247677, 0.2701821, -1.204479, 0, 1, 0.4470588, 1,
-0.2200295, 1.531391, 0.2437469, 0, 1, 0.454902, 1,
-0.2198291, 0.5028855, -0.6669275, 0, 1, 0.4588235, 1,
-0.2179967, -0.8101999, -1.892624, 0, 1, 0.4666667, 1,
-0.2165153, 1.447342, -1.340711, 0, 1, 0.4705882, 1,
-0.2158843, 0.1803648, -0.9125493, 0, 1, 0.4784314, 1,
-0.214542, 0.3824174, -1.327714, 0, 1, 0.4823529, 1,
-0.2134573, -1.798272, -2.45541, 0, 1, 0.4901961, 1,
-0.2127534, -0.3640354, -3.218165, 0, 1, 0.4941176, 1,
-0.2114266, 0.02261474, -0.5467891, 0, 1, 0.5019608, 1,
-0.2033888, -0.2552435, -2.262206, 0, 1, 0.509804, 1,
-0.2008823, -0.01313003, -2.381682, 0, 1, 0.5137255, 1,
-0.197242, -2.386204, -2.4814, 0, 1, 0.5215687, 1,
-0.195819, -0.4096442, -1.444203, 0, 1, 0.5254902, 1,
-0.1951585, -0.1107492, -0.8418257, 0, 1, 0.5333334, 1,
-0.1895744, -0.8222377, -3.077256, 0, 1, 0.5372549, 1,
-0.1863834, -0.1024231, -2.804169, 0, 1, 0.5450981, 1,
-0.1828934, -1.213727, -2.351284, 0, 1, 0.5490196, 1,
-0.1820747, 0.7407513, -0.9064873, 0, 1, 0.5568628, 1,
-0.1711003, 0.2206823, -1.67874, 0, 1, 0.5607843, 1,
-0.1683165, -0.3395547, -2.235025, 0, 1, 0.5686275, 1,
-0.1639293, 1.069039, -2.617666, 0, 1, 0.572549, 1,
-0.1606149, -0.698051, -4.209973, 0, 1, 0.5803922, 1,
-0.1600226, -0.3926222, -4.061329, 0, 1, 0.5843138, 1,
-0.1570149, 1.144771, -0.1887651, 0, 1, 0.5921569, 1,
-0.1523242, -0.3553164, -3.054914, 0, 1, 0.5960785, 1,
-0.1515273, 1.220498, 0.6828621, 0, 1, 0.6039216, 1,
-0.1484285, 0.8079581, -0.6642929, 0, 1, 0.6117647, 1,
-0.1443233, -1.091192, -4.101328, 0, 1, 0.6156863, 1,
-0.1434845, -0.8637515, -1.046241, 0, 1, 0.6235294, 1,
-0.1419459, 1.836517, -0.7863537, 0, 1, 0.627451, 1,
-0.1401254, -0.4990154, -3.344023, 0, 1, 0.6352941, 1,
-0.1390201, 0.7755378, 0.5596321, 0, 1, 0.6392157, 1,
-0.1355918, 0.283191, -2.347489, 0, 1, 0.6470588, 1,
-0.133947, 0.3927548, -1.403881, 0, 1, 0.6509804, 1,
-0.1306317, -1.654049, -2.274663, 0, 1, 0.6588235, 1,
-0.1303791, 0.9087168, 2.024674, 0, 1, 0.6627451, 1,
-0.1303091, -1.231426, -5.823224, 0, 1, 0.6705883, 1,
-0.1294663, 0.7626515, -2.120467, 0, 1, 0.6745098, 1,
-0.1275802, -0.4287817, -2.605121, 0, 1, 0.682353, 1,
-0.1243601, 0.5390094, -3.788582, 0, 1, 0.6862745, 1,
-0.1242647, -1.101956, -3.58611, 0, 1, 0.6941177, 1,
-0.1231218, -0.5233382, -3.079664, 0, 1, 0.7019608, 1,
-0.1179263, -0.02268378, -1.608349, 0, 1, 0.7058824, 1,
-0.1110966, 0.2840742, 1.537343, 0, 1, 0.7137255, 1,
-0.111079, -1.237431, -3.287422, 0, 1, 0.7176471, 1,
-0.1101502, -1.075131, -1.350324, 0, 1, 0.7254902, 1,
-0.1038097, -0.39394, -2.79235, 0, 1, 0.7294118, 1,
-0.09714285, 0.1732235, -0.8575075, 0, 1, 0.7372549, 1,
-0.09523933, 0.337476, -1.012903, 0, 1, 0.7411765, 1,
-0.08909974, -0.7377402, -3.217111, 0, 1, 0.7490196, 1,
-0.08683904, 1.083722, -2.329875, 0, 1, 0.7529412, 1,
-0.0811839, 0.9704432, -0.6074299, 0, 1, 0.7607843, 1,
-0.07416227, 0.6293976, -1.990965, 0, 1, 0.7647059, 1,
-0.07310435, 0.9152777, 0.003780687, 0, 1, 0.772549, 1,
-0.06829292, -0.3132705, -2.732646, 0, 1, 0.7764706, 1,
-0.06630959, -0.1689693, -2.898169, 0, 1, 0.7843137, 1,
-0.05905574, -0.7689443, -4.147615, 0, 1, 0.7882353, 1,
-0.05876455, -0.3728731, -2.238346, 0, 1, 0.7960784, 1,
-0.05690876, -0.7062327, -1.128473, 0, 1, 0.8039216, 1,
-0.05301885, -0.1839083, -3.570747, 0, 1, 0.8078431, 1,
-0.05054163, 0.1599213, -0.5102892, 0, 1, 0.8156863, 1,
-0.04838785, -0.6086163, -3.742298, 0, 1, 0.8196079, 1,
-0.04619379, -0.08361425, -2.973277, 0, 1, 0.827451, 1,
-0.04447123, -0.06218752, -2.239713, 0, 1, 0.8313726, 1,
-0.04136917, 0.8442594, 0.1733178, 0, 1, 0.8392157, 1,
-0.04064742, -0.06123737, -0.7557388, 0, 1, 0.8431373, 1,
-0.04056508, -0.8585541, -2.374172, 0, 1, 0.8509804, 1,
-0.03260371, 0.8953156, 0.8481929, 0, 1, 0.854902, 1,
-0.03217874, 0.5436836, -0.2274083, 0, 1, 0.8627451, 1,
-0.03215224, 0.6234028, -0.1828468, 0, 1, 0.8666667, 1,
-0.03068745, 0.9902809, -0.7577935, 0, 1, 0.8745098, 1,
-0.03063701, -0.7731051, -3.21743, 0, 1, 0.8784314, 1,
-0.02934822, -0.9212308, -4.456699, 0, 1, 0.8862745, 1,
-0.02879871, 0.5597864, -2.003529, 0, 1, 0.8901961, 1,
-0.02864634, 0.5642145, 0.2485633, 0, 1, 0.8980392, 1,
-0.02766862, -1.247874, -1.982344, 0, 1, 0.9058824, 1,
-0.02332633, 0.7488471, -0.3885008, 0, 1, 0.9098039, 1,
-0.02093474, 1.761063, -0.07360539, 0, 1, 0.9176471, 1,
-0.01859391, -1.09623, -2.428007, 0, 1, 0.9215686, 1,
-0.01695951, -0.8948935, -2.988854, 0, 1, 0.9294118, 1,
-0.007721237, 0.6669313, 0.09449632, 0, 1, 0.9333333, 1,
-0.00690918, 0.3117521, -0.4658568, 0, 1, 0.9411765, 1,
-0.005556682, 0.09967466, 1.368963, 0, 1, 0.945098, 1,
-0.004873017, -0.1522216, -1.183957, 0, 1, 0.9529412, 1,
0.0001281499, 0.9560844, -1.603496, 0, 1, 0.9568627, 1,
0.0005454288, 0.4860763, 1.095978, 0, 1, 0.9647059, 1,
0.003537269, 0.09014574, 1.506408, 0, 1, 0.9686275, 1,
0.006404515, 1.059134, 0.5229027, 0, 1, 0.9764706, 1,
0.007642279, -0.1439923, 2.909091, 0, 1, 0.9803922, 1,
0.01625429, -0.0001341192, 2.485255, 0, 1, 0.9882353, 1,
0.01995278, -1.484451, 3.284425, 0, 1, 0.9921569, 1,
0.0226288, 1.955972, -0.1404146, 0, 1, 1, 1,
0.02563992, -0.3127357, 2.920274, 0, 0.9921569, 1, 1,
0.028755, -0.5058843, 2.176458, 0, 0.9882353, 1, 1,
0.04064722, -0.6738062, 3.105617, 0, 0.9803922, 1, 1,
0.04210738, 3.385553, -1.837329, 0, 0.9764706, 1, 1,
0.04272277, 0.587041, -0.8134305, 0, 0.9686275, 1, 1,
0.04323876, 0.5152488, 1.758132, 0, 0.9647059, 1, 1,
0.04428805, -1.793766, 3.420225, 0, 0.9568627, 1, 1,
0.04745666, 0.2296003, -1.560661, 0, 0.9529412, 1, 1,
0.04792973, 0.7494604, -0.7631567, 0, 0.945098, 1, 1,
0.04903507, 0.09236238, -0.5054126, 0, 0.9411765, 1, 1,
0.04979012, 0.004015729, 0.7206979, 0, 0.9333333, 1, 1,
0.0514177, -1.23611, 2.822605, 0, 0.9294118, 1, 1,
0.05252979, 1.092505, 1.180031, 0, 0.9215686, 1, 1,
0.05573981, 0.8193612, 0.401505, 0, 0.9176471, 1, 1,
0.05693695, 0.29575, -0.3081329, 0, 0.9098039, 1, 1,
0.05809221, 1.287946, 0.2210295, 0, 0.9058824, 1, 1,
0.05878221, -0.9353687, 5.04956, 0, 0.8980392, 1, 1,
0.05974546, 1.681122, 1.151064, 0, 0.8901961, 1, 1,
0.0632095, 2.104882, -0.1370515, 0, 0.8862745, 1, 1,
0.07166862, 0.1710861, 1.331259, 0, 0.8784314, 1, 1,
0.0720695, 1.673294, -0.8421324, 0, 0.8745098, 1, 1,
0.0758995, -1.41389, 3.361197, 0, 0.8666667, 1, 1,
0.07849114, 1.581047, -0.3034218, 0, 0.8627451, 1, 1,
0.08068848, 0.9107686, 0.6661062, 0, 0.854902, 1, 1,
0.08101264, -0.6815034, 2.784205, 0, 0.8509804, 1, 1,
0.08189117, -1.454175, 0.9113438, 0, 0.8431373, 1, 1,
0.08248889, 0.7454188, 1.786412, 0, 0.8392157, 1, 1,
0.08897311, -1.540208, 4.525947, 0, 0.8313726, 1, 1,
0.08939736, 0.2819718, 1.912435, 0, 0.827451, 1, 1,
0.09363437, 0.3125309, 0.5244029, 0, 0.8196079, 1, 1,
0.09364408, 0.2935814, 0.8381178, 0, 0.8156863, 1, 1,
0.09637599, 0.5350268, 0.5016015, 0, 0.8078431, 1, 1,
0.09648778, 0.1964313, 2.26254, 0, 0.8039216, 1, 1,
0.09794249, -0.2323418, 2.976609, 0, 0.7960784, 1, 1,
0.1000208, 0.3940831, 3.210743, 0, 0.7882353, 1, 1,
0.1007841, 0.5744831, 0.3765591, 0, 0.7843137, 1, 1,
0.1039822, -0.6078438, 1.6128, 0, 0.7764706, 1, 1,
0.1049357, -0.4208114, 2.383118, 0, 0.772549, 1, 1,
0.1069571, 0.06344388, 1.37915, 0, 0.7647059, 1, 1,
0.1085825, -0.4911065, 2.431047, 0, 0.7607843, 1, 1,
0.109784, -0.3800851, 3.338139, 0, 0.7529412, 1, 1,
0.1112232, 0.7881454, -0.5622519, 0, 0.7490196, 1, 1,
0.1124494, -2.340216, 1.643629, 0, 0.7411765, 1, 1,
0.1150662, 0.03329019, 1.081741, 0, 0.7372549, 1, 1,
0.1168836, -0.6666468, 2.720737, 0, 0.7294118, 1, 1,
0.1235924, 0.3737881, 0.9484757, 0, 0.7254902, 1, 1,
0.1278041, 0.7157189, 0.4332188, 0, 0.7176471, 1, 1,
0.1279804, -1.521063, 2.898859, 0, 0.7137255, 1, 1,
0.1280274, -1.773035, 1.590558, 0, 0.7058824, 1, 1,
0.1286573, 1.15122, -0.6771544, 0, 0.6980392, 1, 1,
0.1304407, -1.291407, 4.983296, 0, 0.6941177, 1, 1,
0.1306338, -0.1727877, 0.9406114, 0, 0.6862745, 1, 1,
0.1313371, -0.1727979, 1.136003, 0, 0.682353, 1, 1,
0.132764, 0.08922756, -0.1378011, 0, 0.6745098, 1, 1,
0.1328007, 0.3121618, 1.584903, 0, 0.6705883, 1, 1,
0.1329248, -0.4715222, 4.923172, 0, 0.6627451, 1, 1,
0.1400508, 1.773034, 0.172038, 0, 0.6588235, 1, 1,
0.1409187, 0.7261254, 0.05602786, 0, 0.6509804, 1, 1,
0.1413857, 0.243679, 1.225378, 0, 0.6470588, 1, 1,
0.1426426, 0.03498527, 1.957062, 0, 0.6392157, 1, 1,
0.1427164, -0.5755359, 2.807898, 0, 0.6352941, 1, 1,
0.1438817, -0.5937765, 3.527427, 0, 0.627451, 1, 1,
0.1449655, 0.2417963, 0.7246322, 0, 0.6235294, 1, 1,
0.1470951, 0.5950197, 0.9782089, 0, 0.6156863, 1, 1,
0.1487217, -0.1690035, 3.368659, 0, 0.6117647, 1, 1,
0.1488548, -0.3672458, 3.649812, 0, 0.6039216, 1, 1,
0.1545282, -0.828748, 2.978266, 0, 0.5960785, 1, 1,
0.1553499, 1.898422, -0.9009043, 0, 0.5921569, 1, 1,
0.156909, -0.7824048, 3.801595, 0, 0.5843138, 1, 1,
0.1579123, -0.7032324, 1.615433, 0, 0.5803922, 1, 1,
0.1581036, 0.3915546, 1.746946, 0, 0.572549, 1, 1,
0.1594549, -1.782382, 3.208183, 0, 0.5686275, 1, 1,
0.1679415, 0.1748367, -0.4459525, 0, 0.5607843, 1, 1,
0.1703581, -0.3749335, 3.43651, 0, 0.5568628, 1, 1,
0.1726062, 0.5730723, 1.257345, 0, 0.5490196, 1, 1,
0.1755847, -0.3065535, 2.036541, 0, 0.5450981, 1, 1,
0.1758479, 0.4710283, 0.1098732, 0, 0.5372549, 1, 1,
0.1761673, -1.443308, 2.403746, 0, 0.5333334, 1, 1,
0.1763253, -0.6357309, 4.662292, 0, 0.5254902, 1, 1,
0.1788835, 0.2800032, 2.150234, 0, 0.5215687, 1, 1,
0.180159, -0.8199212, 2.370583, 0, 0.5137255, 1, 1,
0.1829759, 0.2212601, 2.388172, 0, 0.509804, 1, 1,
0.1837172, 0.3300839, 0.6634687, 0, 0.5019608, 1, 1,
0.1896379, -1.747288, 3.415, 0, 0.4941176, 1, 1,
0.1928102, 0.4456059, -0.1151712, 0, 0.4901961, 1, 1,
0.1984707, -0.1470737, 2.377856, 0, 0.4823529, 1, 1,
0.2073286, -0.5540779, 1.542334, 0, 0.4784314, 1, 1,
0.212935, -1.089195, 2.992673, 0, 0.4705882, 1, 1,
0.2133944, -0.68968, 3.257993, 0, 0.4666667, 1, 1,
0.2145221, -0.7827981, 2.829179, 0, 0.4588235, 1, 1,
0.2154969, -0.9490173, 3.68596, 0, 0.454902, 1, 1,
0.2173553, -0.2140152, 2.387662, 0, 0.4470588, 1, 1,
0.2175618, -1.219663, 2.28431, 0, 0.4431373, 1, 1,
0.2184705, 0.1231568, -0.04731218, 0, 0.4352941, 1, 1,
0.2228166, 0.197858, 0.8126826, 0, 0.4313726, 1, 1,
0.2230703, -1.186553, 1.915807, 0, 0.4235294, 1, 1,
0.2243432, 0.2070024, 1.499279, 0, 0.4196078, 1, 1,
0.2273579, -0.5332853, 4.95738, 0, 0.4117647, 1, 1,
0.2335221, 0.2836764, 1.657438, 0, 0.4078431, 1, 1,
0.2401326, -0.8520265, 1.169102, 0, 0.4, 1, 1,
0.2411693, 0.4238407, -0.1067991, 0, 0.3921569, 1, 1,
0.2435199, 0.2057791, 1.962645, 0, 0.3882353, 1, 1,
0.2459295, 0.1234305, 0.6877581, 0, 0.3803922, 1, 1,
0.24807, 0.9262543, 0.2511248, 0, 0.3764706, 1, 1,
0.2540219, -0.7435375, 3.082213, 0, 0.3686275, 1, 1,
0.2544567, -1.639324, 2.963218, 0, 0.3647059, 1, 1,
0.2546432, -0.01444305, 1.940816, 0, 0.3568628, 1, 1,
0.2575283, -0.3233111, 2.794759, 0, 0.3529412, 1, 1,
0.2588873, 2.377601, -0.5744407, 0, 0.345098, 1, 1,
0.2599477, 0.7648445, 0.4524922, 0, 0.3411765, 1, 1,
0.2641163, -0.4721755, 0.5195648, 0, 0.3333333, 1, 1,
0.2662672, 1.375461, -1.871018, 0, 0.3294118, 1, 1,
0.2706952, 1.159371, 2.11988, 0, 0.3215686, 1, 1,
0.2767267, 0.3438713, 1.135907, 0, 0.3176471, 1, 1,
0.280578, 2.073712, 0.3210503, 0, 0.3098039, 1, 1,
0.281451, -1.817326, 3.818874, 0, 0.3058824, 1, 1,
0.2873311, 0.5066233, 0.8673487, 0, 0.2980392, 1, 1,
0.2896045, -1.246759, 2.405582, 0, 0.2901961, 1, 1,
0.2901326, -0.4651798, 2.749263, 0, 0.2862745, 1, 1,
0.2910367, -0.1177066, 1.605712, 0, 0.2784314, 1, 1,
0.2935622, 0.5764059, -0.3479751, 0, 0.2745098, 1, 1,
0.2939048, -0.1282074, 0.9839407, 0, 0.2666667, 1, 1,
0.2954696, -0.1126139, 2.792472, 0, 0.2627451, 1, 1,
0.2971706, -0.1006551, 2.6134, 0, 0.254902, 1, 1,
0.2972916, -2.151498, 2.849591, 0, 0.2509804, 1, 1,
0.2976364, 1.703669, -1.419423, 0, 0.2431373, 1, 1,
0.2982965, 0.7911023, 1.987491, 0, 0.2392157, 1, 1,
0.2986547, -0.754162, 2.291119, 0, 0.2313726, 1, 1,
0.2993645, 0.5792704, 0.7406769, 0, 0.227451, 1, 1,
0.3020403, 0.3162764, 1.470497, 0, 0.2196078, 1, 1,
0.3048485, -1.187613, 3.120101, 0, 0.2156863, 1, 1,
0.3104253, -1.037657, 2.610127, 0, 0.2078431, 1, 1,
0.3136758, -1.307556, 3.887209, 0, 0.2039216, 1, 1,
0.3273489, 0.2831429, 0.4309502, 0, 0.1960784, 1, 1,
0.328919, -0.2805162, 1.715876, 0, 0.1882353, 1, 1,
0.3298367, 0.5312195, -0.4126752, 0, 0.1843137, 1, 1,
0.3305138, -1.410599, 2.917918, 0, 0.1764706, 1, 1,
0.3342195, 0.3372043, 0.9195428, 0, 0.172549, 1, 1,
0.3355015, 0.7067727, 0.1095777, 0, 0.1647059, 1, 1,
0.3379466, -0.2285036, 0.8348556, 0, 0.1607843, 1, 1,
0.3384904, -2.024146, 1.919019, 0, 0.1529412, 1, 1,
0.3404589, 1.012994, -0.1678015, 0, 0.1490196, 1, 1,
0.3413027, -0.5487027, 4.445021, 0, 0.1411765, 1, 1,
0.3428857, 1.812728, 1.065784, 0, 0.1372549, 1, 1,
0.3520347, 1.080583, -1.1609, 0, 0.1294118, 1, 1,
0.3565784, 0.6149288, 1.587996, 0, 0.1254902, 1, 1,
0.3597587, 1.36663, 0.6136531, 0, 0.1176471, 1, 1,
0.3609394, 0.5975659, 0.2958468, 0, 0.1137255, 1, 1,
0.3614098, -0.9581918, 2.291804, 0, 0.1058824, 1, 1,
0.3647805, -1.255005, 3.026618, 0, 0.09803922, 1, 1,
0.3647837, -0.4031379, 2.687837, 0, 0.09411765, 1, 1,
0.3678797, 1.073238, -1.409296, 0, 0.08627451, 1, 1,
0.368296, -0.1068424, 2.035577, 0, 0.08235294, 1, 1,
0.374671, -0.5426306, 2.437718, 0, 0.07450981, 1, 1,
0.3806485, 0.6626549, 1.4276, 0, 0.07058824, 1, 1,
0.3812908, -0.7543597, 2.848137, 0, 0.0627451, 1, 1,
0.3843873, -1.268224, 1.365628, 0, 0.05882353, 1, 1,
0.3862355, -1.203108, 3.364253, 0, 0.05098039, 1, 1,
0.3877848, 0.6444722, 2.392934, 0, 0.04705882, 1, 1,
0.390753, 0.05055119, 0.4699727, 0, 0.03921569, 1, 1,
0.3944266, 0.7366807, 0.9306066, 0, 0.03529412, 1, 1,
0.3988048, -0.09959725, 2.692942, 0, 0.02745098, 1, 1,
0.4032821, 0.7098964, 1.825353, 0, 0.02352941, 1, 1,
0.4143789, 0.7257212, 1.983933, 0, 0.01568628, 1, 1,
0.4167677, 0.8997395, 1.103042, 0, 0.01176471, 1, 1,
0.4180955, 1.673921, 0.5357345, 0, 0.003921569, 1, 1,
0.4191386, -1.261671, 2.176193, 0.003921569, 0, 1, 1,
0.4194773, -0.4096311, 3.119462, 0.007843138, 0, 1, 1,
0.4208715, -1.941349, 2.813411, 0.01568628, 0, 1, 1,
0.4228133, 0.2433559, 1.205793, 0.01960784, 0, 1, 1,
0.4282155, 0.4474922, 1.378542, 0.02745098, 0, 1, 1,
0.431175, 0.9694108, 0.9983448, 0.03137255, 0, 1, 1,
0.4367494, 1.20497, 0.7423717, 0.03921569, 0, 1, 1,
0.4388738, -0.03530545, 2.041305, 0.04313726, 0, 1, 1,
0.4393323, 0.3185394, 1.939935, 0.05098039, 0, 1, 1,
0.4404916, -0.8447785, 1.625501, 0.05490196, 0, 1, 1,
0.4413107, -0.4574181, 1.425252, 0.0627451, 0, 1, 1,
0.4419168, -0.625015, 3.031925, 0.06666667, 0, 1, 1,
0.4432417, 0.1836314, 1.725956, 0.07450981, 0, 1, 1,
0.4443922, -0.3556667, 2.731699, 0.07843138, 0, 1, 1,
0.4444571, 0.1314606, 2.139604, 0.08627451, 0, 1, 1,
0.456553, -0.5793034, 1.915817, 0.09019608, 0, 1, 1,
0.4589354, 1.625456, 0.2050491, 0.09803922, 0, 1, 1,
0.4642048, 0.2756502, -1.002948, 0.1058824, 0, 1, 1,
0.4679632, -2.34695, 0.1297699, 0.1098039, 0, 1, 1,
0.4726179, 0.6489695, -0.1376136, 0.1176471, 0, 1, 1,
0.472823, 1.087851, 0.4224288, 0.1215686, 0, 1, 1,
0.4773394, 1.2405, 0.4973331, 0.1294118, 0, 1, 1,
0.4853299, 0.5650487, -0.1098082, 0.1333333, 0, 1, 1,
0.4873761, 0.6100197, 0.008122231, 0.1411765, 0, 1, 1,
0.4878973, 0.5658949, -1.034473, 0.145098, 0, 1, 1,
0.4890025, 0.2492326, 2.237354, 0.1529412, 0, 1, 1,
0.4891061, -0.3709638, 3.556248, 0.1568628, 0, 1, 1,
0.4952075, 0.7414556, 0.8354576, 0.1647059, 0, 1, 1,
0.4998734, -0.3822525, 0.8337669, 0.1686275, 0, 1, 1,
0.5021093, 0.631156, -1.507124, 0.1764706, 0, 1, 1,
0.5023203, 0.35503, 1.684023, 0.1803922, 0, 1, 1,
0.5031377, -0.1947469, -0.7801471, 0.1882353, 0, 1, 1,
0.5079564, 0.5702931, 1.608879, 0.1921569, 0, 1, 1,
0.5091948, 1.312591, 0.6682341, 0.2, 0, 1, 1,
0.5119237, -1.21913, 1.998362, 0.2078431, 0, 1, 1,
0.5132768, -2.108201, 3.917813, 0.2117647, 0, 1, 1,
0.5145376, -1.608518, 2.976116, 0.2196078, 0, 1, 1,
0.5182271, 0.5825033, -0.9487477, 0.2235294, 0, 1, 1,
0.5226907, -1.776244, 4.268691, 0.2313726, 0, 1, 1,
0.5236301, 0.6183048, -0.07882625, 0.2352941, 0, 1, 1,
0.5248154, 1.054029, 0.2943426, 0.2431373, 0, 1, 1,
0.5278089, 0.1734503, -0.2093531, 0.2470588, 0, 1, 1,
0.5368651, -1.295975, 4.461149, 0.254902, 0, 1, 1,
0.543986, -0.8660253, 0.7961101, 0.2588235, 0, 1, 1,
0.5458585, -0.6870999, 0.1998748, 0.2666667, 0, 1, 1,
0.5491467, -0.3545691, 2.8924, 0.2705882, 0, 1, 1,
0.5515811, 0.5504629, 0.6041385, 0.2784314, 0, 1, 1,
0.5521576, -1.286812, 3.722687, 0.282353, 0, 1, 1,
0.5540264, 0.2339727, 1.182434, 0.2901961, 0, 1, 1,
0.5540472, -1.933918, 2.801743, 0.2941177, 0, 1, 1,
0.5562888, -2.38632, 2.235765, 0.3019608, 0, 1, 1,
0.5570089, 0.2774471, 1.377675, 0.3098039, 0, 1, 1,
0.5579293, -0.06361265, 0.4808916, 0.3137255, 0, 1, 1,
0.5657455, -1.472898, 3.973882, 0.3215686, 0, 1, 1,
0.5668576, -1.509542, 2.760389, 0.3254902, 0, 1, 1,
0.5710073, -0.1900619, 1.822128, 0.3333333, 0, 1, 1,
0.5727878, -2.179593, 4.498722, 0.3372549, 0, 1, 1,
0.5763674, -0.7700987, 2.210308, 0.345098, 0, 1, 1,
0.57844, -0.2936454, 2.913899, 0.3490196, 0, 1, 1,
0.5824678, -0.3364287, 1.26814, 0.3568628, 0, 1, 1,
0.5899999, 0.021883, 0.7871163, 0.3607843, 0, 1, 1,
0.590823, 0.2504459, 1.875181, 0.3686275, 0, 1, 1,
0.5921279, -1.418956, 3.797368, 0.372549, 0, 1, 1,
0.5926973, 0.4444931, 0.9562491, 0.3803922, 0, 1, 1,
0.5958249, -0.04778724, 0.9396964, 0.3843137, 0, 1, 1,
0.6001636, -0.744857, 2.211957, 0.3921569, 0, 1, 1,
0.6003453, 1.151082, -0.07733127, 0.3960784, 0, 1, 1,
0.6036158, 0.4243788, 1.278409, 0.4039216, 0, 1, 1,
0.6115438, -0.2395505, 3.169085, 0.4117647, 0, 1, 1,
0.614092, -0.9812141, 3.347058, 0.4156863, 0, 1, 1,
0.6145581, 1.204454, 0.3171875, 0.4235294, 0, 1, 1,
0.6147161, -0.8543622, 4.186058, 0.427451, 0, 1, 1,
0.6161554, -1.341511, 5.251438, 0.4352941, 0, 1, 1,
0.6164604, -2.520748, 3.742751, 0.4392157, 0, 1, 1,
0.6171938, -0.3343175, 4.780346, 0.4470588, 0, 1, 1,
0.6183476, 0.1344926, 0.3363053, 0.4509804, 0, 1, 1,
0.6225467, -0.3067805, 1.358907, 0.4588235, 0, 1, 1,
0.6262748, -1.210336, 3.045476, 0.4627451, 0, 1, 1,
0.6264684, -2.165904, 2.024928, 0.4705882, 0, 1, 1,
0.6293347, -1.313622, 3.417084, 0.4745098, 0, 1, 1,
0.6312799, 1.344492, 2.120812, 0.4823529, 0, 1, 1,
0.6320216, -0.5648898, 2.356874, 0.4862745, 0, 1, 1,
0.6365887, -1.571828, 2.882356, 0.4941176, 0, 1, 1,
0.6427328, 0.153807, 1.950807, 0.5019608, 0, 1, 1,
0.6432515, 1.242656, -1.722146, 0.5058824, 0, 1, 1,
0.6480648, -2.129089, 3.466251, 0.5137255, 0, 1, 1,
0.6494345, -1.140823, 2.950686, 0.5176471, 0, 1, 1,
0.6538624, 0.12484, 1.756294, 0.5254902, 0, 1, 1,
0.6558728, 0.7188282, -1.218016, 0.5294118, 0, 1, 1,
0.6642311, 0.3829099, 3.24783, 0.5372549, 0, 1, 1,
0.6718522, -0.5385941, 2.965738, 0.5411765, 0, 1, 1,
0.6768799, -1.8118, 1.979692, 0.5490196, 0, 1, 1,
0.6779526, -0.3075774, 2.273996, 0.5529412, 0, 1, 1,
0.6779711, -1.505961, 3.983439, 0.5607843, 0, 1, 1,
0.6784773, 0.1037775, 2.052156, 0.5647059, 0, 1, 1,
0.6797751, -1.581139, 3.946779, 0.572549, 0, 1, 1,
0.6808885, 0.7714068, 0.1371596, 0.5764706, 0, 1, 1,
0.6812152, -0.008167828, 0.8734213, 0.5843138, 0, 1, 1,
0.6852258, -0.4685289, 2.444923, 0.5882353, 0, 1, 1,
0.6877594, -0.7252585, 3.985538, 0.5960785, 0, 1, 1,
0.6973742, 1.851223, 0.8597575, 0.6039216, 0, 1, 1,
0.70328, -0.3947274, 0.2085423, 0.6078432, 0, 1, 1,
0.71021, -1.695903, 2.158669, 0.6156863, 0, 1, 1,
0.7213245, -0.211558, 1.913956, 0.6196079, 0, 1, 1,
0.7254801, -0.02631348, -0.1555331, 0.627451, 0, 1, 1,
0.7266069, -0.5456495, 1.865034, 0.6313726, 0, 1, 1,
0.7330743, 1.626658, 0.02123277, 0.6392157, 0, 1, 1,
0.7351735, -1.953452, 2.180857, 0.6431373, 0, 1, 1,
0.7377105, -0.5693781, 3.885454, 0.6509804, 0, 1, 1,
0.7422058, 0.3079244, 2.193862, 0.654902, 0, 1, 1,
0.7456436, 1.902073, 1.050358, 0.6627451, 0, 1, 1,
0.7506378, 0.01898074, 1.083637, 0.6666667, 0, 1, 1,
0.750885, 1.245702, 1.140256, 0.6745098, 0, 1, 1,
0.7512859, 0.5617443, 0.5164622, 0.6784314, 0, 1, 1,
0.7527552, 1.16603, 1.284844, 0.6862745, 0, 1, 1,
0.7528788, 0.2586191, 2.36693, 0.6901961, 0, 1, 1,
0.7551761, -2.124816, 2.240222, 0.6980392, 0, 1, 1,
0.7556838, -0.08068572, 1.052645, 0.7058824, 0, 1, 1,
0.7664541, -0.32941, 2.606032, 0.7098039, 0, 1, 1,
0.7682715, -1.251077, 3.097432, 0.7176471, 0, 1, 1,
0.7689984, -1.23798, 1.54708, 0.7215686, 0, 1, 1,
0.7702571, 0.7151439, 2.284832, 0.7294118, 0, 1, 1,
0.7756662, -0.2431861, 0.7842898, 0.7333333, 0, 1, 1,
0.7758577, 0.8902702, 0.6341508, 0.7411765, 0, 1, 1,
0.7760774, 0.03653433, 1.370742, 0.7450981, 0, 1, 1,
0.7781739, -1.367149, 2.599682, 0.7529412, 0, 1, 1,
0.7801644, 1.781431, 0.6003717, 0.7568628, 0, 1, 1,
0.7819857, -0.7502957, 2.886824, 0.7647059, 0, 1, 1,
0.7859483, 0.05584899, 2.087379, 0.7686275, 0, 1, 1,
0.786259, -0.614014, 2.667862, 0.7764706, 0, 1, 1,
0.7882507, -0.9184293, 3.040473, 0.7803922, 0, 1, 1,
0.7956268, -0.3544531, 2.939615, 0.7882353, 0, 1, 1,
0.7987173, 1.51972, 0.6710694, 0.7921569, 0, 1, 1,
0.8022924, 0.708976, 0.5119207, 0.8, 0, 1, 1,
0.8054985, 1.061741, 0.2399194, 0.8078431, 0, 1, 1,
0.8103784, -0.3013705, 3.534447, 0.8117647, 0, 1, 1,
0.8150122, -1.210735, 4.789469, 0.8196079, 0, 1, 1,
0.8177332, -0.06425492, 1.24963, 0.8235294, 0, 1, 1,
0.8428678, 0.224483, -0.8752968, 0.8313726, 0, 1, 1,
0.8485191, 0.2711443, 1.258665, 0.8352941, 0, 1, 1,
0.8551604, -0.5167284, 2.364911, 0.8431373, 0, 1, 1,
0.8695605, -2.85395, 3.17169, 0.8470588, 0, 1, 1,
0.8737987, -0.5578741, 2.67942, 0.854902, 0, 1, 1,
0.8781266, -0.2080916, 2.084986, 0.8588235, 0, 1, 1,
0.8828, -1.973836, 1.825709, 0.8666667, 0, 1, 1,
0.8878098, 1.443036, 0.7123029, 0.8705882, 0, 1, 1,
0.8906785, 0.7066312, 1.010047, 0.8784314, 0, 1, 1,
0.8947782, 0.3961042, 0.7590465, 0.8823529, 0, 1, 1,
0.8949533, 0.287255, 2.363056, 0.8901961, 0, 1, 1,
0.9008653, -0.5975429, 1.939579, 0.8941177, 0, 1, 1,
0.9046066, 1.607737, 1.547002, 0.9019608, 0, 1, 1,
0.9109071, 0.5346668, 1.631004, 0.9098039, 0, 1, 1,
0.918884, 1.05925, -0.5553149, 0.9137255, 0, 1, 1,
0.9253899, -1.049272, 2.926675, 0.9215686, 0, 1, 1,
0.9266412, 0.8130987, 1.026706, 0.9254902, 0, 1, 1,
0.9277182, 0.3564655, 2.101543, 0.9333333, 0, 1, 1,
0.9425617, 0.3806132, 1.833878, 0.9372549, 0, 1, 1,
0.9567187, 0.06232692, 0.7485983, 0.945098, 0, 1, 1,
0.9571398, 0.7258029, 0.3454071, 0.9490196, 0, 1, 1,
0.9579553, -0.4239308, 0.9816503, 0.9568627, 0, 1, 1,
0.9624447, 0.6475621, 0.6810076, 0.9607843, 0, 1, 1,
0.9639784, -0.6225623, 2.633957, 0.9686275, 0, 1, 1,
0.967557, 2.355403, -0.03035407, 0.972549, 0, 1, 1,
0.9681161, 0.2218349, 2.114461, 0.9803922, 0, 1, 1,
0.9712275, -0.5438889, 2.6203, 0.9843137, 0, 1, 1,
0.9728023, 0.7015374, 1.932045, 0.9921569, 0, 1, 1,
0.980558, 0.2889492, -1.170923, 0.9960784, 0, 1, 1,
0.983926, 0.8525301, 0.4055793, 1, 0, 0.9960784, 1,
0.9844735, -0.6128121, 2.341038, 1, 0, 0.9882353, 1,
0.987942, 1.455142, 0.8875392, 1, 0, 0.9843137, 1,
0.9977809, -2.55226, 3.41804, 1, 0, 0.9764706, 1,
1.000441, 1.972502, -0.3455557, 1, 0, 0.972549, 1,
1.002112, -0.4503573, 3.088722, 1, 0, 0.9647059, 1,
1.002946, -2.629716, 2.366876, 1, 0, 0.9607843, 1,
1.003565, 0.3086433, 2.834723, 1, 0, 0.9529412, 1,
1.005441, 0.2019078, 1.370089, 1, 0, 0.9490196, 1,
1.009647, -0.02542824, 2.258523, 1, 0, 0.9411765, 1,
1.011259, -1.069422, 3.253594, 1, 0, 0.9372549, 1,
1.014642, -0.5261075, 1.750521, 1, 0, 0.9294118, 1,
1.022245, -0.3236632, 2.946182, 1, 0, 0.9254902, 1,
1.031614, 0.4727429, -0.9045691, 1, 0, 0.9176471, 1,
1.032242, -0.03157741, 2.245476, 1, 0, 0.9137255, 1,
1.038484, -1.777618, 1.07333, 1, 0, 0.9058824, 1,
1.039454, 0.9951448, 2.443645, 1, 0, 0.9019608, 1,
1.039509, -0.6031538, 1.921201, 1, 0, 0.8941177, 1,
1.041672, -2.088033, 3.249319, 1, 0, 0.8862745, 1,
1.044216, 0.7314165, 0.9753852, 1, 0, 0.8823529, 1,
1.049335, 0.102709, 0.7513494, 1, 0, 0.8745098, 1,
1.054195, 1.338227, 0.9892742, 1, 0, 0.8705882, 1,
1.054977, 1.125178, 0.6905726, 1, 0, 0.8627451, 1,
1.055253, -0.1550266, 2.180915, 1, 0, 0.8588235, 1,
1.057622, 2.765967, 0.5500927, 1, 0, 0.8509804, 1,
1.060929, -0.3765869, 0.7586196, 1, 0, 0.8470588, 1,
1.062419, 1.848997, 1.092515, 1, 0, 0.8392157, 1,
1.063064, -0.5548822, 3.046686, 1, 0, 0.8352941, 1,
1.063965, -0.631421, 2.564317, 1, 0, 0.827451, 1,
1.070251, 0.4503026, 1.510637, 1, 0, 0.8235294, 1,
1.086612, 1.908641, 0.5134526, 1, 0, 0.8156863, 1,
1.087298, -1.441932, 1.471228, 1, 0, 0.8117647, 1,
1.091362, -0.8991082, 1.816443, 1, 0, 0.8039216, 1,
1.093372, 0.3550631, -0.8279688, 1, 0, 0.7960784, 1,
1.094321, -0.7254962, 3.304493, 1, 0, 0.7921569, 1,
1.09596, 1.396467, 0.985148, 1, 0, 0.7843137, 1,
1.096729, -0.4034649, 2.742759, 1, 0, 0.7803922, 1,
1.098174, -1.171645, 2.364398, 1, 0, 0.772549, 1,
1.106827, -1.264682, 1.503284, 1, 0, 0.7686275, 1,
1.109949, -0.3651068, 3.993101, 1, 0, 0.7607843, 1,
1.112418, -0.662505, 2.085894, 1, 0, 0.7568628, 1,
1.115914, 1.127462, 2.378366, 1, 0, 0.7490196, 1,
1.118478, 0.8959723, 1.155254, 1, 0, 0.7450981, 1,
1.121514, -0.2748815, 1.897577, 1, 0, 0.7372549, 1,
1.122891, 0.4758377, 1.145141, 1, 0, 0.7333333, 1,
1.130131, -0.8419503, 3.437542, 1, 0, 0.7254902, 1,
1.138294, 0.0514322, 1.163664, 1, 0, 0.7215686, 1,
1.141941, -0.7967092, 1.515457, 1, 0, 0.7137255, 1,
1.145624, 1.173917, -0.8205475, 1, 0, 0.7098039, 1,
1.148522, -0.002590327, 1.226261, 1, 0, 0.7019608, 1,
1.149301, -0.110382, 1.934439, 1, 0, 0.6941177, 1,
1.154774, -0.7209099, 2.559631, 1, 0, 0.6901961, 1,
1.167137, -1.116487, 2.247029, 1, 0, 0.682353, 1,
1.167496, -0.3492593, 2.335974, 1, 0, 0.6784314, 1,
1.183707, 1.568938, -0.1282382, 1, 0, 0.6705883, 1,
1.18557, 1.456236, -0.5512071, 1, 0, 0.6666667, 1,
1.188755, -0.5002053, 2.726872, 1, 0, 0.6588235, 1,
1.195407, -1.306778, 2.423409, 1, 0, 0.654902, 1,
1.195537, -1.654357, 3.009157, 1, 0, 0.6470588, 1,
1.196315, 1.037688, -0.8441502, 1, 0, 0.6431373, 1,
1.198529, -0.7060971, 1.884668, 1, 0, 0.6352941, 1,
1.20483, -0.6737245, 3.026664, 1, 0, 0.6313726, 1,
1.208281, 0.4835261, 1.024657, 1, 0, 0.6235294, 1,
1.211598, -0.3175993, 2.745768, 1, 0, 0.6196079, 1,
1.214334, 0.2938677, 2.00003, 1, 0, 0.6117647, 1,
1.215131, 0.1852904, 1.321851, 1, 0, 0.6078432, 1,
1.215458, -0.0440416, 2.337424, 1, 0, 0.6, 1,
1.219501, 0.9702097, 0.4805282, 1, 0, 0.5921569, 1,
1.229618, 1.327548, 1.529287, 1, 0, 0.5882353, 1,
1.239445, -0.07556787, 2.403736, 1, 0, 0.5803922, 1,
1.247271, 0.381355, -0.2975795, 1, 0, 0.5764706, 1,
1.247329, 0.5938637, -0.7838288, 1, 0, 0.5686275, 1,
1.253379, 0.09042075, 1.616925, 1, 0, 0.5647059, 1,
1.255073, -1.34302, 3.688536, 1, 0, 0.5568628, 1,
1.258092, -1.157991, 1.528978, 1, 0, 0.5529412, 1,
1.26606, -0.6015325, 1.637581, 1, 0, 0.5450981, 1,
1.266163, -0.5827382, 0.8894508, 1, 0, 0.5411765, 1,
1.270044, 0.3885698, 0.1189377, 1, 0, 0.5333334, 1,
1.281519, 1.797035, 2.101669, 1, 0, 0.5294118, 1,
1.282166, 0.1262694, 0.1782337, 1, 0, 0.5215687, 1,
1.290729, -0.8224183, 2.016041, 1, 0, 0.5176471, 1,
1.293697, -0.8959966, 3.566314, 1, 0, 0.509804, 1,
1.297714, -2.771307, 2.704641, 1, 0, 0.5058824, 1,
1.300979, 1.553475, 0.4028937, 1, 0, 0.4980392, 1,
1.30527, -0.2948134, 0.3484173, 1, 0, 0.4901961, 1,
1.316501, -0.3065341, -0.0114237, 1, 0, 0.4862745, 1,
1.31978, -0.956995, 0.8809643, 1, 0, 0.4784314, 1,
1.323527, 1.232633, 0.234381, 1, 0, 0.4745098, 1,
1.330761, -0.1112986, 0.8352787, 1, 0, 0.4666667, 1,
1.336727, 0.4655444, 0.3893411, 1, 0, 0.4627451, 1,
1.355172, -0.7849752, 4.145292, 1, 0, 0.454902, 1,
1.358752, -1.383738, 2.10339, 1, 0, 0.4509804, 1,
1.378224, 1.201841, 0.1577208, 1, 0, 0.4431373, 1,
1.378488, -0.3491176, 3.353837, 1, 0, 0.4392157, 1,
1.38837, -0.2313784, 1.545381, 1, 0, 0.4313726, 1,
1.392437, 1.220173, 1.664826, 1, 0, 0.427451, 1,
1.399841, 1.073168, 1.448628, 1, 0, 0.4196078, 1,
1.412731, -0.07964234, 0.8007816, 1, 0, 0.4156863, 1,
1.413813, -1.272631, 1.907339, 1, 0, 0.4078431, 1,
1.416547, -0.1176708, 0.00649325, 1, 0, 0.4039216, 1,
1.440223, -0.07326249, 2.151031, 1, 0, 0.3960784, 1,
1.46492, 0.03160143, 1.456979, 1, 0, 0.3882353, 1,
1.470562, 1.968547, 0.9651052, 1, 0, 0.3843137, 1,
1.475667, -0.07445893, 0.5404202, 1, 0, 0.3764706, 1,
1.476727, 0.3680678, 1.097749, 1, 0, 0.372549, 1,
1.480213, -1.82394, 3.959188, 1, 0, 0.3647059, 1,
1.484071, -2.151752, 2.158269, 1, 0, 0.3607843, 1,
1.504823, 1.460104, 0.3751466, 1, 0, 0.3529412, 1,
1.509352, 0.1035038, 2.860393, 1, 0, 0.3490196, 1,
1.53789, -0.6513053, 1.535764, 1, 0, 0.3411765, 1,
1.541108, -0.1548159, 2.059743, 1, 0, 0.3372549, 1,
1.55002, 2.108721, -1.011408, 1, 0, 0.3294118, 1,
1.557283, -0.9520023, 2.161526, 1, 0, 0.3254902, 1,
1.56112, 1.065048, 0.7804448, 1, 0, 0.3176471, 1,
1.57813, -0.5438383, 1.831422, 1, 0, 0.3137255, 1,
1.621161, 2.53741, -0.4677221, 1, 0, 0.3058824, 1,
1.631834, 0.8474379, -0.4389087, 1, 0, 0.2980392, 1,
1.642164, 1.84545, 2.525022, 1, 0, 0.2941177, 1,
1.657336, 0.1241963, 0.784334, 1, 0, 0.2862745, 1,
1.658769, -1.528524, 2.353045, 1, 0, 0.282353, 1,
1.661348, -0.2575935, 3.226925, 1, 0, 0.2745098, 1,
1.664591, -0.2361531, 1.501589, 1, 0, 0.2705882, 1,
1.665877, -0.8531582, 1.348358, 1, 0, 0.2627451, 1,
1.670438, -1.068303, 1.308472, 1, 0, 0.2588235, 1,
1.679357, 2.15704, -0.05524658, 1, 0, 0.2509804, 1,
1.681342, -0.4590648, 0.3379746, 1, 0, 0.2470588, 1,
1.68737, -0.7242984, -0.2824831, 1, 0, 0.2392157, 1,
1.698856, -1.741908, 2.038232, 1, 0, 0.2352941, 1,
1.704686, -0.3617378, 2.351173, 1, 0, 0.227451, 1,
1.718456, 1.420535, 0.1968269, 1, 0, 0.2235294, 1,
1.71916, 0.5171044, 1.04713, 1, 0, 0.2156863, 1,
1.732094, 0.1182917, 2.498668, 1, 0, 0.2117647, 1,
1.73347, 0.7996631, 1.790063, 1, 0, 0.2039216, 1,
1.757952, -1.323959, 2.731092, 1, 0, 0.1960784, 1,
1.762343, -1.368536, 2.974539, 1, 0, 0.1921569, 1,
1.793036, -0.1891127, 0.1353819, 1, 0, 0.1843137, 1,
1.794119, -1.019011, 1.287855, 1, 0, 0.1803922, 1,
1.82382, -1.475476, 1.964216, 1, 0, 0.172549, 1,
1.857109, 0.7122221, -0.2499591, 1, 0, 0.1686275, 1,
1.895427, -0.823082, 2.483272, 1, 0, 0.1607843, 1,
1.921036, 1.559688, -0.7798634, 1, 0, 0.1568628, 1,
1.92549, -1.571115, 1.190936, 1, 0, 0.1490196, 1,
1.941903, -0.9977749, 4.659035, 1, 0, 0.145098, 1,
1.970298, 0.4484431, 1.372473, 1, 0, 0.1372549, 1,
1.973659, 0.441719, -1.068941, 1, 0, 0.1333333, 1,
1.993305, -1.952678, 2.561878, 1, 0, 0.1254902, 1,
2.062782, 0.5749059, 1.285905, 1, 0, 0.1215686, 1,
2.072242, 0.2495098, 1.388186, 1, 0, 0.1137255, 1,
2.084246, 0.6194254, 2.153469, 1, 0, 0.1098039, 1,
2.090178, 0.005287287, 1.563115, 1, 0, 0.1019608, 1,
2.112012, 0.7418267, 2.689994, 1, 0, 0.09411765, 1,
2.120292, 0.2448571, 0.01506976, 1, 0, 0.09019608, 1,
2.209282, -2.194333, 1.850751, 1, 0, 0.08235294, 1,
2.262856, 0.9124739, 1.952624, 1, 0, 0.07843138, 1,
2.287678, -1.04336, 1.956328, 1, 0, 0.07058824, 1,
2.312115, -2.582044, 1.528417, 1, 0, 0.06666667, 1,
2.335308, 0.288321, 0.08779299, 1, 0, 0.05882353, 1,
2.347478, 1.464182, 1.609396, 1, 0, 0.05490196, 1,
2.376922, 0.2777688, 1.699749, 1, 0, 0.04705882, 1,
2.512507, -0.849576, 1.911173, 1, 0, 0.04313726, 1,
2.550364, -0.04089792, 1.873227, 1, 0, 0.03529412, 1,
2.586189, -0.4721936, 2.822484, 1, 0, 0.03137255, 1,
2.611435, 1.118822, 0.05059807, 1, 0, 0.02352941, 1,
2.930556, -0.4747905, 0.3440103, 1, 0, 0.01960784, 1,
3.023419, 0.09598146, 2.262654, 1, 0, 0.01176471, 1,
3.296751, -0.993744, 0.8846481, 1, 0, 0.007843138, 1
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
-0.1949928, -3.917353, -7.700379, 0, -0.5, 0.5, 0.5,
-0.1949928, -3.917353, -7.700379, 1, -0.5, 0.5, 0.5,
-0.1949928, -3.917353, -7.700379, 1, 1.5, 0.5, 0.5,
-0.1949928, -3.917353, -7.700379, 0, 1.5, 0.5, 0.5
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
-4.870438, 0.2829337, -7.700379, 0, -0.5, 0.5, 0.5,
-4.870438, 0.2829337, -7.700379, 1, -0.5, 0.5, 0.5,
-4.870438, 0.2829337, -7.700379, 1, 1.5, 0.5, 0.5,
-4.870438, 0.2829337, -7.700379, 0, 1.5, 0.5, 0.5
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
-4.870438, -3.917353, -0.2858932, 0, -0.5, 0.5, 0.5,
-4.870438, -3.917353, -0.2858932, 1, -0.5, 0.5, 0.5,
-4.870438, -3.917353, -0.2858932, 1, 1.5, 0.5, 0.5,
-4.870438, -3.917353, -0.2858932, 0, 1.5, 0.5, 0.5
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
-3, -2.948056, -5.989344,
3, -2.948056, -5.989344,
-3, -2.948056, -5.989344,
-3, -3.109606, -6.274517,
-2, -2.948056, -5.989344,
-2, -3.109606, -6.274517,
-1, -2.948056, -5.989344,
-1, -3.109606, -6.274517,
0, -2.948056, -5.989344,
0, -3.109606, -6.274517,
1, -2.948056, -5.989344,
1, -3.109606, -6.274517,
2, -2.948056, -5.989344,
2, -3.109606, -6.274517,
3, -2.948056, -5.989344,
3, -3.109606, -6.274517
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
-3, -3.432705, -6.844862, 0, -0.5, 0.5, 0.5,
-3, -3.432705, -6.844862, 1, -0.5, 0.5, 0.5,
-3, -3.432705, -6.844862, 1, 1.5, 0.5, 0.5,
-3, -3.432705, -6.844862, 0, 1.5, 0.5, 0.5,
-2, -3.432705, -6.844862, 0, -0.5, 0.5, 0.5,
-2, -3.432705, -6.844862, 1, -0.5, 0.5, 0.5,
-2, -3.432705, -6.844862, 1, 1.5, 0.5, 0.5,
-2, -3.432705, -6.844862, 0, 1.5, 0.5, 0.5,
-1, -3.432705, -6.844862, 0, -0.5, 0.5, 0.5,
-1, -3.432705, -6.844862, 1, -0.5, 0.5, 0.5,
-1, -3.432705, -6.844862, 1, 1.5, 0.5, 0.5,
-1, -3.432705, -6.844862, 0, 1.5, 0.5, 0.5,
0, -3.432705, -6.844862, 0, -0.5, 0.5, 0.5,
0, -3.432705, -6.844862, 1, -0.5, 0.5, 0.5,
0, -3.432705, -6.844862, 1, 1.5, 0.5, 0.5,
0, -3.432705, -6.844862, 0, 1.5, 0.5, 0.5,
1, -3.432705, -6.844862, 0, -0.5, 0.5, 0.5,
1, -3.432705, -6.844862, 1, -0.5, 0.5, 0.5,
1, -3.432705, -6.844862, 1, 1.5, 0.5, 0.5,
1, -3.432705, -6.844862, 0, 1.5, 0.5, 0.5,
2, -3.432705, -6.844862, 0, -0.5, 0.5, 0.5,
2, -3.432705, -6.844862, 1, -0.5, 0.5, 0.5,
2, -3.432705, -6.844862, 1, 1.5, 0.5, 0.5,
2, -3.432705, -6.844862, 0, 1.5, 0.5, 0.5,
3, -3.432705, -6.844862, 0, -0.5, 0.5, 0.5,
3, -3.432705, -6.844862, 1, -0.5, 0.5, 0.5,
3, -3.432705, -6.844862, 1, 1.5, 0.5, 0.5,
3, -3.432705, -6.844862, 0, 1.5, 0.5, 0.5
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
-3.791489, -2, -5.989344,
-3.791489, 3, -5.989344,
-3.791489, -2, -5.989344,
-3.971314, -2, -6.274517,
-3.791489, -1, -5.989344,
-3.971314, -1, -6.274517,
-3.791489, 0, -5.989344,
-3.971314, 0, -6.274517,
-3.791489, 1, -5.989344,
-3.971314, 1, -6.274517,
-3.791489, 2, -5.989344,
-3.971314, 2, -6.274517,
-3.791489, 3, -5.989344,
-3.971314, 3, -6.274517
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
-4.330964, -2, -6.844862, 0, -0.5, 0.5, 0.5,
-4.330964, -2, -6.844862, 1, -0.5, 0.5, 0.5,
-4.330964, -2, -6.844862, 1, 1.5, 0.5, 0.5,
-4.330964, -2, -6.844862, 0, 1.5, 0.5, 0.5,
-4.330964, -1, -6.844862, 0, -0.5, 0.5, 0.5,
-4.330964, -1, -6.844862, 1, -0.5, 0.5, 0.5,
-4.330964, -1, -6.844862, 1, 1.5, 0.5, 0.5,
-4.330964, -1, -6.844862, 0, 1.5, 0.5, 0.5,
-4.330964, 0, -6.844862, 0, -0.5, 0.5, 0.5,
-4.330964, 0, -6.844862, 1, -0.5, 0.5, 0.5,
-4.330964, 0, -6.844862, 1, 1.5, 0.5, 0.5,
-4.330964, 0, -6.844862, 0, 1.5, 0.5, 0.5,
-4.330964, 1, -6.844862, 0, -0.5, 0.5, 0.5,
-4.330964, 1, -6.844862, 1, -0.5, 0.5, 0.5,
-4.330964, 1, -6.844862, 1, 1.5, 0.5, 0.5,
-4.330964, 1, -6.844862, 0, 1.5, 0.5, 0.5,
-4.330964, 2, -6.844862, 0, -0.5, 0.5, 0.5,
-4.330964, 2, -6.844862, 1, -0.5, 0.5, 0.5,
-4.330964, 2, -6.844862, 1, 1.5, 0.5, 0.5,
-4.330964, 2, -6.844862, 0, 1.5, 0.5, 0.5,
-4.330964, 3, -6.844862, 0, -0.5, 0.5, 0.5,
-4.330964, 3, -6.844862, 1, -0.5, 0.5, 0.5,
-4.330964, 3, -6.844862, 1, 1.5, 0.5, 0.5,
-4.330964, 3, -6.844862, 0, 1.5, 0.5, 0.5
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
-3.791489, -2.948056, -4,
-3.791489, -2.948056, 4,
-3.791489, -2.948056, -4,
-3.971314, -3.109606, -4,
-3.791489, -2.948056, -2,
-3.971314, -3.109606, -2,
-3.791489, -2.948056, 0,
-3.971314, -3.109606, 0,
-3.791489, -2.948056, 2,
-3.971314, -3.109606, 2,
-3.791489, -2.948056, 4,
-3.971314, -3.109606, 4
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
-4.330964, -3.432705, -4, 0, -0.5, 0.5, 0.5,
-4.330964, -3.432705, -4, 1, -0.5, 0.5, 0.5,
-4.330964, -3.432705, -4, 1, 1.5, 0.5, 0.5,
-4.330964, -3.432705, -4, 0, 1.5, 0.5, 0.5,
-4.330964, -3.432705, -2, 0, -0.5, 0.5, 0.5,
-4.330964, -3.432705, -2, 1, -0.5, 0.5, 0.5,
-4.330964, -3.432705, -2, 1, 1.5, 0.5, 0.5,
-4.330964, -3.432705, -2, 0, 1.5, 0.5, 0.5,
-4.330964, -3.432705, 0, 0, -0.5, 0.5, 0.5,
-4.330964, -3.432705, 0, 1, -0.5, 0.5, 0.5,
-4.330964, -3.432705, 0, 1, 1.5, 0.5, 0.5,
-4.330964, -3.432705, 0, 0, 1.5, 0.5, 0.5,
-4.330964, -3.432705, 2, 0, -0.5, 0.5, 0.5,
-4.330964, -3.432705, 2, 1, -0.5, 0.5, 0.5,
-4.330964, -3.432705, 2, 1, 1.5, 0.5, 0.5,
-4.330964, -3.432705, 2, 0, 1.5, 0.5, 0.5,
-4.330964, -3.432705, 4, 0, -0.5, 0.5, 0.5,
-4.330964, -3.432705, 4, 1, -0.5, 0.5, 0.5,
-4.330964, -3.432705, 4, 1, 1.5, 0.5, 0.5,
-4.330964, -3.432705, 4, 0, 1.5, 0.5, 0.5
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
-3.791489, -2.948056, -5.989344,
-3.791489, 3.513924, -5.989344,
-3.791489, -2.948056, 5.417558,
-3.791489, 3.513924, 5.417558,
-3.791489, -2.948056, -5.989344,
-3.791489, -2.948056, 5.417558,
-3.791489, 3.513924, -5.989344,
-3.791489, 3.513924, 5.417558,
-3.791489, -2.948056, -5.989344,
3.401504, -2.948056, -5.989344,
-3.791489, -2.948056, 5.417558,
3.401504, -2.948056, 5.417558,
-3.791489, 3.513924, -5.989344,
3.401504, 3.513924, -5.989344,
-3.791489, 3.513924, 5.417558,
3.401504, 3.513924, 5.417558,
3.401504, -2.948056, -5.989344,
3.401504, 3.513924, -5.989344,
3.401504, -2.948056, 5.417558,
3.401504, 3.513924, 5.417558,
3.401504, -2.948056, -5.989344,
3.401504, -2.948056, 5.417558,
3.401504, 3.513924, -5.989344,
3.401504, 3.513924, 5.417558
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
var radius = 7.984996;
var distance = 35.52615;
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
mvMatrix.translate( 0.1949928, -0.2829337, 0.2858932 );
mvMatrix.scale( 1.20027, 1.336051, 0.7568693 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.52615);
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
data<-read.table("data.xyz", skip=1)
x<-data$V2
y<-data$V3
z<-data$V4
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
-1.4425, 3.8203, -0.1067, 0, 0, 1, 1, 1,
2.1604, 0.4365, 0.1057, 1, 0, 0, 1, 1,
-2.2867, -1.0529, 0.0325, 1, 0, 0, 1, 1,
-0.0528, -0.3391, 0.0703, 1, 0, 0, 1, 1,
0.4264, 2.0113, 0.0066, 1, 0, 0, 1, 1,
-1.8486, 1.2493, -0.0308, 1, 0, 0, 1, 1,
2.7052, -0.9026, 0.166, 0, 0, 0, 1, 1,
4.1224, -0.8435, 0.7203, 0, 0, 0, 1, 1,
2.6783, -1.5257, -1.2236, 0, 0, 0, 1, 1,
0.8047, 0.7107, 0.0596, 0, 0, 0, 1, 1,
-1.9029, -2.4287, 0.0879, 0, 0, 0, 1, 1,
-1.3503, 0.0036, 0.0237, 0, 0, 0, 1, 1,
-3.1117, -3.341, 0.1242, 0, 0, 0, 1, 1,
-0.902, 2.2018, -0.0358, 1, 1, 1, 1, 1,
2.1146, -1.5229, 0.852, 1, 1, 1, 1, 1,
2.7907, 1.2284, 0.0472, 1, 1, 1, 1, 1,
4.5538, -1.847, 0.7977, 1, 1, 1, 1, 1,
4.7777, -0.2407, 0.0813, 1, 1, 1, 1, 1,
4.1314, -0.3935, 1.7193, 1, 1, 1, 1, 1,
1.6576, -1.6165, -1.609, 1, 1, 1, 1, 1,
3.1148, -2.5299, -1.206, 1, 1, 1, 1, 1,
3.2474, -0.923, -1.9406, 1, 1, 1, 1, 1,
-1.2931, -2.6856, -0.7864, 1, 1, 1, 1, 1,
-1.2967, -2.6169, 0.982, 1, 1, 1, 1, 1,
-3.2653, -0.7918, -0.006, 1, 1, 1, 1, 1,
-3.7347, -3.1326, 1.0005, 1, 1, 1, 1, 1,
-3.7333, -3.2048, -0.7672, 1, 1, 1, 1, 1,
-2.8002, -4.3892, 0.1671, 1, 1, 1, 1, 1
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
var radius = 8.640059;
var distance = 30.34784;
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
mvMatrix.translate( -0.5214999, 0.2844501, 0.1106499 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -30.34784);
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
for (var i = 0; i < 28; i++) {
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
