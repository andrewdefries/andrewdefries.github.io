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
-3.401288, 0.8291739, 0.181263, 1, 0, 0, 1,
-3.078206, -0.7718964, -2.310568, 1, 0.007843138, 0, 1,
-2.531736, -1.172276, -2.138098, 1, 0.01176471, 0, 1,
-2.436699, 0.6600912, -1.645333, 1, 0.01960784, 0, 1,
-2.37851, 0.8171781, -1.853581, 1, 0.02352941, 0, 1,
-2.331105, 2.070467, -1.008531, 1, 0.03137255, 0, 1,
-2.299244, -0.8696321, -3.044446, 1, 0.03529412, 0, 1,
-2.258897, -0.4490859, -0.754861, 1, 0.04313726, 0, 1,
-2.243773, -1.110929, -3.216835, 1, 0.04705882, 0, 1,
-2.235345, 0.686607, 0.2944404, 1, 0.05490196, 0, 1,
-2.206187, 0.2076999, -2.79924, 1, 0.05882353, 0, 1,
-2.117887, -0.9661285, -2.365336, 1, 0.06666667, 0, 1,
-2.113865, 0.2559604, -1.427564, 1, 0.07058824, 0, 1,
-2.063882, -0.1905973, -1.493091, 1, 0.07843138, 0, 1,
-2.059467, -1.428721, -4.694978, 1, 0.08235294, 0, 1,
-2.03764, 1.114655, -3.775975, 1, 0.09019608, 0, 1,
-2.036067, 0.6468859, -0.446419, 1, 0.09411765, 0, 1,
-2.030925, 0.4268329, -0.773622, 1, 0.1019608, 0, 1,
-2.004472, -0.3120974, 0.7804261, 1, 0.1098039, 0, 1,
-1.990203, -0.4314918, -2.679542, 1, 0.1137255, 0, 1,
-1.987898, -2.446701, -2.001764, 1, 0.1215686, 0, 1,
-1.978999, -0.8398687, -0.9597709, 1, 0.1254902, 0, 1,
-1.978426, 0.290013, -2.572788, 1, 0.1333333, 0, 1,
-1.96673, -0.1707127, -0.7105511, 1, 0.1372549, 0, 1,
-1.931408, 0.7131352, -0.9358749, 1, 0.145098, 0, 1,
-1.927023, -0.5754721, -1.650468, 1, 0.1490196, 0, 1,
-1.92489, 0.3663175, -0.3720633, 1, 0.1568628, 0, 1,
-1.910276, 0.4175297, -1.33258, 1, 0.1607843, 0, 1,
-1.9069, 2.387535, -1.115393, 1, 0.1686275, 0, 1,
-1.899025, -0.3028364, -1.874938, 1, 0.172549, 0, 1,
-1.865818, 1.376955, -0.5992545, 1, 0.1803922, 0, 1,
-1.864863, -0.5986807, -0.7111768, 1, 0.1843137, 0, 1,
-1.857989, -0.210517, -1.345326, 1, 0.1921569, 0, 1,
-1.844133, -1.578586, -2.093906, 1, 0.1960784, 0, 1,
-1.794407, -0.1782361, -1.063719, 1, 0.2039216, 0, 1,
-1.787494, -0.537563, -1.007238, 1, 0.2117647, 0, 1,
-1.782998, -0.1192154, -1.155211, 1, 0.2156863, 0, 1,
-1.765389, 0.4136995, 0.4149629, 1, 0.2235294, 0, 1,
-1.761726, -0.2311824, -2.088131, 1, 0.227451, 0, 1,
-1.755788, 0.2434525, -2.107086, 1, 0.2352941, 0, 1,
-1.74798, -0.7938609, -4.593548, 1, 0.2392157, 0, 1,
-1.743378, 0.2769827, -1.439425, 1, 0.2470588, 0, 1,
-1.713572, -0.4044974, -1.353112, 1, 0.2509804, 0, 1,
-1.71209, -1.933987, -4.261534, 1, 0.2588235, 0, 1,
-1.701272, -0.3413702, -2.52983, 1, 0.2627451, 0, 1,
-1.69564, 1.007132, -0.06108293, 1, 0.2705882, 0, 1,
-1.692795, -0.8706732, -2.901532, 1, 0.2745098, 0, 1,
-1.692237, 1.441625, -1.414459, 1, 0.282353, 0, 1,
-1.673343, 2.091162, -0.2003954, 1, 0.2862745, 0, 1,
-1.666361, 1.146749, -0.7974564, 1, 0.2941177, 0, 1,
-1.66209, -0.1239692, -0.8454098, 1, 0.3019608, 0, 1,
-1.636732, -1.361012, -2.520434, 1, 0.3058824, 0, 1,
-1.631678, 0.6599133, -0.2717813, 1, 0.3137255, 0, 1,
-1.626524, -0.03451879, -2.193517, 1, 0.3176471, 0, 1,
-1.621001, 0.2725274, -1.825892, 1, 0.3254902, 0, 1,
-1.6193, 0.519699, -1.457406, 1, 0.3294118, 0, 1,
-1.607929, 0.5759503, -2.311098, 1, 0.3372549, 0, 1,
-1.600152, 0.3067897, -1.442558, 1, 0.3411765, 0, 1,
-1.598409, 0.5815516, -2.889545, 1, 0.3490196, 0, 1,
-1.592267, 0.8376144, -1.428704, 1, 0.3529412, 0, 1,
-1.589239, -0.7954087, -1.83277, 1, 0.3607843, 0, 1,
-1.57466, -0.1729029, -2.676337, 1, 0.3647059, 0, 1,
-1.573224, -1.838877, -4.140378, 1, 0.372549, 0, 1,
-1.57066, 0.958042, -0.8472803, 1, 0.3764706, 0, 1,
-1.551087, -0.6046379, -2.424806, 1, 0.3843137, 0, 1,
-1.54039, -1.940494, -1.837455, 1, 0.3882353, 0, 1,
-1.540195, 0.4562198, -1.049391, 1, 0.3960784, 0, 1,
-1.537545, -0.9987734, -0.7696068, 1, 0.4039216, 0, 1,
-1.532212, -0.9619756, -2.365005, 1, 0.4078431, 0, 1,
-1.518312, 0.2848709, -3.362456, 1, 0.4156863, 0, 1,
-1.511803, 0.3687339, -0.7324839, 1, 0.4196078, 0, 1,
-1.499341, 0.4121016, -2.632165, 1, 0.427451, 0, 1,
-1.485893, 1.662236, 0.06329829, 1, 0.4313726, 0, 1,
-1.48132, 2.344488, -1.606144, 1, 0.4392157, 0, 1,
-1.466516, -0.3539436, -2.361655, 1, 0.4431373, 0, 1,
-1.457709, 1.65405, -0.6839696, 1, 0.4509804, 0, 1,
-1.457636, -0.5729686, -1.120628, 1, 0.454902, 0, 1,
-1.447949, -0.1835753, -1.590205, 1, 0.4627451, 0, 1,
-1.442628, -0.04910477, -2.583507, 1, 0.4666667, 0, 1,
-1.438936, 0.1135521, -2.286569, 1, 0.4745098, 0, 1,
-1.421575, -0.4112791, -2.078318, 1, 0.4784314, 0, 1,
-1.418757, 1.890961, -0.7173823, 1, 0.4862745, 0, 1,
-1.415268, -0.4812931, -0.3686713, 1, 0.4901961, 0, 1,
-1.414037, -2.37968, -2.49138, 1, 0.4980392, 0, 1,
-1.407385, 3.557045, 0.01449833, 1, 0.5058824, 0, 1,
-1.403801, 2.096304, -0.05987826, 1, 0.509804, 0, 1,
-1.402922, 1.17504, -0.7782037, 1, 0.5176471, 0, 1,
-1.396789, 0.4606073, 0.205553, 1, 0.5215687, 0, 1,
-1.38946, 0.1516936, -1.160663, 1, 0.5294118, 0, 1,
-1.385263, 1.195725, -1.496756, 1, 0.5333334, 0, 1,
-1.376862, 2.113847, -0.7739376, 1, 0.5411765, 0, 1,
-1.365782, 0.3169593, -2.510109, 1, 0.5450981, 0, 1,
-1.360996, -1.261921, -3.507329, 1, 0.5529412, 0, 1,
-1.353344, 0.8160999, -0.484861, 1, 0.5568628, 0, 1,
-1.321477, -0.6045254, -2.745927, 1, 0.5647059, 0, 1,
-1.311543, -0.4400538, -1.864736, 1, 0.5686275, 0, 1,
-1.305096, 1.520178, -0.1978641, 1, 0.5764706, 0, 1,
-1.305056, -0.5259429, -1.062735, 1, 0.5803922, 0, 1,
-1.300304, 2.154556, -0.9552831, 1, 0.5882353, 0, 1,
-1.298564, 1.770332, -0.6289012, 1, 0.5921569, 0, 1,
-1.298476, 1.806869, 0.7021955, 1, 0.6, 0, 1,
-1.298247, 0.6405526, 0.2835211, 1, 0.6078432, 0, 1,
-1.291912, -0.2739259, -1.655411, 1, 0.6117647, 0, 1,
-1.286643, -0.9446244, -0.7125155, 1, 0.6196079, 0, 1,
-1.284802, -0.07662302, -1.124384, 1, 0.6235294, 0, 1,
-1.269071, 0.7214463, -0.6278421, 1, 0.6313726, 0, 1,
-1.265969, 0.04241264, -0.3569206, 1, 0.6352941, 0, 1,
-1.257084, 0.9434115, -2.702477, 1, 0.6431373, 0, 1,
-1.256914, -0.3678586, -1.483661, 1, 0.6470588, 0, 1,
-1.240793, -0.8633277, -1.931223, 1, 0.654902, 0, 1,
-1.237112, 0.8503788, -1.849195, 1, 0.6588235, 0, 1,
-1.236134, -0.1096417, -3.728085, 1, 0.6666667, 0, 1,
-1.233449, 1.103738, 0.1652267, 1, 0.6705883, 0, 1,
-1.232758, 0.6390815, -1.772688, 1, 0.6784314, 0, 1,
-1.229765, -0.1329865, -1.96046, 1, 0.682353, 0, 1,
-1.228572, 1.39545, 0.0891467, 1, 0.6901961, 0, 1,
-1.226904, -1.109074, -3.68258, 1, 0.6941177, 0, 1,
-1.221269, 0.3763998, -1.014223, 1, 0.7019608, 0, 1,
-1.213553, 0.7174125, -3.787657, 1, 0.7098039, 0, 1,
-1.210332, 0.2993936, -1.96898, 1, 0.7137255, 0, 1,
-1.206627, -0.4811551, -3.130437, 1, 0.7215686, 0, 1,
-1.205183, -0.3115803, -1.859381, 1, 0.7254902, 0, 1,
-1.201924, 0.1918903, -4.188468, 1, 0.7333333, 0, 1,
-1.19513, -0.234744, -2.793698, 1, 0.7372549, 0, 1,
-1.185305, 0.2427478, -1.904156, 1, 0.7450981, 0, 1,
-1.183912, -0.6654333, -3.418198, 1, 0.7490196, 0, 1,
-1.181942, 0.0983028, -1.796408, 1, 0.7568628, 0, 1,
-1.18129, 0.9870509, -1.678772, 1, 0.7607843, 0, 1,
-1.167097, -1.159817, -2.254795, 1, 0.7686275, 0, 1,
-1.166019, -0.487536, -3.95011, 1, 0.772549, 0, 1,
-1.164157, -0.9968362, -2.949433, 1, 0.7803922, 0, 1,
-1.153062, -1.878615, -2.101413, 1, 0.7843137, 0, 1,
-1.146588, -1.803205, -1.421062, 1, 0.7921569, 0, 1,
-1.133175, 0.8010738, 1.437043, 1, 0.7960784, 0, 1,
-1.131149, 0.5414572, -2.554095, 1, 0.8039216, 0, 1,
-1.128413, -1.071179, -1.025714, 1, 0.8117647, 0, 1,
-1.122387, -0.2192275, -1.531442, 1, 0.8156863, 0, 1,
-1.114643, 0.3234309, -2.244214, 1, 0.8235294, 0, 1,
-1.113479, -0.6329932, -0.3870346, 1, 0.827451, 0, 1,
-1.104268, 0.5579725, -2.416202, 1, 0.8352941, 0, 1,
-1.101045, 1.085946, 0.1520673, 1, 0.8392157, 0, 1,
-1.099569, 1.942959, -0.7300555, 1, 0.8470588, 0, 1,
-1.096508, -1.451761, -1.20165, 1, 0.8509804, 0, 1,
-1.094602, 1.136187, 0.6569204, 1, 0.8588235, 0, 1,
-1.094204, -0.6949165, -3.233543, 1, 0.8627451, 0, 1,
-1.084278, 0.730719, 0.1941715, 1, 0.8705882, 0, 1,
-1.08403, 0.2319519, -1.887613, 1, 0.8745098, 0, 1,
-1.081682, -0.1434867, -2.048449, 1, 0.8823529, 0, 1,
-1.080166, -2.190532, -2.995736, 1, 0.8862745, 0, 1,
-1.078735, -0.02745726, -1.2547, 1, 0.8941177, 0, 1,
-1.073758, 0.3434297, -2.05402, 1, 0.8980392, 0, 1,
-1.070017, -1.427002, -2.712102, 1, 0.9058824, 0, 1,
-1.064358, -0.7969749, -3.252208, 1, 0.9137255, 0, 1,
-1.059279, -0.03308793, -1.357312, 1, 0.9176471, 0, 1,
-1.051914, 0.1980746, -1.303872, 1, 0.9254902, 0, 1,
-1.051445, 1.386812, -1.061133, 1, 0.9294118, 0, 1,
-1.04622, -0.8250529, -2.058977, 1, 0.9372549, 0, 1,
-1.044147, 0.6492567, -0.7692598, 1, 0.9411765, 0, 1,
-1.039528, 0.4199297, -1.941528, 1, 0.9490196, 0, 1,
-1.038143, 0.2766909, -0.5657178, 1, 0.9529412, 0, 1,
-1.033894, 0.07853387, -0.9613357, 1, 0.9607843, 0, 1,
-1.033754, 0.6047309, 0.06680593, 1, 0.9647059, 0, 1,
-1.033579, 0.3108422, -1.899658, 1, 0.972549, 0, 1,
-1.03068, 0.685509, -0.5875952, 1, 0.9764706, 0, 1,
-1.029707, -0.4924591, -1.545889, 1, 0.9843137, 0, 1,
-1.028376, -0.3062327, -1.571936, 1, 0.9882353, 0, 1,
-1.019514, 0.427794, -0.2005402, 1, 0.9960784, 0, 1,
-1.018051, 0.3751951, -3.347823, 0.9960784, 1, 0, 1,
-1.016146, 1.345704, -0.2104991, 0.9921569, 1, 0, 1,
-1.009144, 0.8353837, -0.9296865, 0.9843137, 1, 0, 1,
-1.003842, -1.116271, -3.065362, 0.9803922, 1, 0, 1,
-0.9977267, -0.2962838, -0.1492235, 0.972549, 1, 0, 1,
-0.9957862, 0.514354, -0.5236448, 0.9686275, 1, 0, 1,
-0.9940234, 0.8212042, -0.7639883, 0.9607843, 1, 0, 1,
-0.9926402, -0.8014438, -2.251044, 0.9568627, 1, 0, 1,
-0.9923511, 0.06729693, -0.629476, 0.9490196, 1, 0, 1,
-0.9891976, -0.01041128, -0.9019476, 0.945098, 1, 0, 1,
-0.9829999, -1.740479, -3.73315, 0.9372549, 1, 0, 1,
-0.9775702, 0.4556339, -0.4700313, 0.9333333, 1, 0, 1,
-0.9681354, -0.8407052, -0.1220798, 0.9254902, 1, 0, 1,
-0.9671055, -0.5105474, -2.295988, 0.9215686, 1, 0, 1,
-0.9654357, -0.8720265, -2.885484, 0.9137255, 1, 0, 1,
-0.9564138, -0.001182691, -1.987311, 0.9098039, 1, 0, 1,
-0.9505561, 1.456052, -1.611949, 0.9019608, 1, 0, 1,
-0.9497198, 1.840781, 0.0629328, 0.8941177, 1, 0, 1,
-0.9483497, 0.3807544, -1.444406, 0.8901961, 1, 0, 1,
-0.9461935, 0.7970246, -1.540436, 0.8823529, 1, 0, 1,
-0.9450725, 0.4476341, -1.964593, 0.8784314, 1, 0, 1,
-0.9395646, 0.9780483, -1.183916, 0.8705882, 1, 0, 1,
-0.9357938, 0.02249303, -3.071139, 0.8666667, 1, 0, 1,
-0.9250772, 0.8143267, -0.2490335, 0.8588235, 1, 0, 1,
-0.9130149, -0.1651202, -1.234468, 0.854902, 1, 0, 1,
-0.9065073, 0.3314885, -0.4525508, 0.8470588, 1, 0, 1,
-0.9038337, 0.8086243, -0.2877419, 0.8431373, 1, 0, 1,
-0.9004872, 0.08230739, -2.852733, 0.8352941, 1, 0, 1,
-0.8999385, -0.2186172, -1.599138, 0.8313726, 1, 0, 1,
-0.8978701, 0.06600413, -2.330891, 0.8235294, 1, 0, 1,
-0.8947085, 0.3954981, -0.5286005, 0.8196079, 1, 0, 1,
-0.8936875, 1.843286, -0.6786294, 0.8117647, 1, 0, 1,
-0.8932372, 0.7085658, -0.009562994, 0.8078431, 1, 0, 1,
-0.8923196, 0.5704648, -1.687174, 0.8, 1, 0, 1,
-0.8913239, -1.640722, -2.740421, 0.7921569, 1, 0, 1,
-0.8912647, 0.872673, -2.450409, 0.7882353, 1, 0, 1,
-0.8871396, -0.213116, -4.048616, 0.7803922, 1, 0, 1,
-0.8867931, -1.063065, -4.267873, 0.7764706, 1, 0, 1,
-0.8859328, 0.003287607, -1.478583, 0.7686275, 1, 0, 1,
-0.8834441, -1.334527, -1.882697, 0.7647059, 1, 0, 1,
-0.8747191, 1.347023, -1.089078, 0.7568628, 1, 0, 1,
-0.873174, -1.147539, 0.04166784, 0.7529412, 1, 0, 1,
-0.8621357, 0.06174735, -1.13287, 0.7450981, 1, 0, 1,
-0.8617541, 0.1093211, -0.9141724, 0.7411765, 1, 0, 1,
-0.8579148, 0.6157947, -0.9809958, 0.7333333, 1, 0, 1,
-0.8533232, -0.8445557, -1.492114, 0.7294118, 1, 0, 1,
-0.8489619, 0.3407914, -2.922425, 0.7215686, 1, 0, 1,
-0.8443101, 1.001801, 0.0649709, 0.7176471, 1, 0, 1,
-0.8431738, 1.123802, -1.869474, 0.7098039, 1, 0, 1,
-0.8406261, -1.070539, -4.107163, 0.7058824, 1, 0, 1,
-0.8396441, 0.02437517, -2.15601, 0.6980392, 1, 0, 1,
-0.8346555, 0.8217607, -2.04459, 0.6901961, 1, 0, 1,
-0.8310815, 0.4275931, -1.302416, 0.6862745, 1, 0, 1,
-0.8294144, 0.401909, -1.202487, 0.6784314, 1, 0, 1,
-0.8287439, -1.865647, -3.362302, 0.6745098, 1, 0, 1,
-0.8185619, -1.176035, -2.456583, 0.6666667, 1, 0, 1,
-0.8148356, 0.7602349, -0.4038542, 0.6627451, 1, 0, 1,
-0.8024899, 1.330546, -0.7011948, 0.654902, 1, 0, 1,
-0.8003713, -1.265849, -4.0993, 0.6509804, 1, 0, 1,
-0.7977945, 0.4744233, -1.337656, 0.6431373, 1, 0, 1,
-0.7938441, -0.8860618, -4.15302, 0.6392157, 1, 0, 1,
-0.7925878, 0.5937173, -1.010389, 0.6313726, 1, 0, 1,
-0.7911746, 0.2623863, -1.844022, 0.627451, 1, 0, 1,
-0.7862935, 0.07145412, -0.6889241, 0.6196079, 1, 0, 1,
-0.7858851, -1.265036, -2.820834, 0.6156863, 1, 0, 1,
-0.7792276, -0.7744922, -1.069236, 0.6078432, 1, 0, 1,
-0.77472, 0.7392293, -0.008215771, 0.6039216, 1, 0, 1,
-0.774629, 0.547522, -0.5979929, 0.5960785, 1, 0, 1,
-0.7724678, -0.01408547, -2.141559, 0.5882353, 1, 0, 1,
-0.7692339, -1.617513, -1.306672, 0.5843138, 1, 0, 1,
-0.7623413, 2.001359, -0.08773741, 0.5764706, 1, 0, 1,
-0.7607042, -0.9820843, -0.9152455, 0.572549, 1, 0, 1,
-0.760082, -0.4764617, -2.082866, 0.5647059, 1, 0, 1,
-0.7587157, 0.7106253, -0.495286, 0.5607843, 1, 0, 1,
-0.7559803, 2.335013, 1.466926, 0.5529412, 1, 0, 1,
-0.7555131, 0.7600511, -1.276271, 0.5490196, 1, 0, 1,
-0.7516447, -1.032419, -0.7240868, 0.5411765, 1, 0, 1,
-0.7476026, 0.9282226, -0.06154517, 0.5372549, 1, 0, 1,
-0.7461409, -1.28654, -2.512868, 0.5294118, 1, 0, 1,
-0.7461391, -0.2550495, -1.744098, 0.5254902, 1, 0, 1,
-0.7418198, 0.3950343, -1.049665, 0.5176471, 1, 0, 1,
-0.7364098, -0.0434119, -2.362222, 0.5137255, 1, 0, 1,
-0.7349304, -0.4729525, -2.545773, 0.5058824, 1, 0, 1,
-0.734771, 0.3299392, 0.4773145, 0.5019608, 1, 0, 1,
-0.7292937, -1.440205, -4.07673, 0.4941176, 1, 0, 1,
-0.7272953, -1.652284, -2.670991, 0.4862745, 1, 0, 1,
-0.726067, 0.6142147, -2.401322, 0.4823529, 1, 0, 1,
-0.7253465, 0.8007399, -1.059786, 0.4745098, 1, 0, 1,
-0.7200591, 0.5082441, -0.3258854, 0.4705882, 1, 0, 1,
-0.7194437, 0.4849842, -0.8870976, 0.4627451, 1, 0, 1,
-0.7143983, 2.98747, 1.05256, 0.4588235, 1, 0, 1,
-0.7120916, 0.2137165, -2.07142, 0.4509804, 1, 0, 1,
-0.7111611, 0.913794, -0.337081, 0.4470588, 1, 0, 1,
-0.7018698, 0.693582, -0.00695587, 0.4392157, 1, 0, 1,
-0.6933488, 1.667631, -1.726146, 0.4352941, 1, 0, 1,
-0.6926935, -0.5028135, -2.844239, 0.427451, 1, 0, 1,
-0.6921619, 0.8860757, 0.07281382, 0.4235294, 1, 0, 1,
-0.6916191, -0.8170763, -2.173174, 0.4156863, 1, 0, 1,
-0.6873447, -0.8752785, -2.72211, 0.4117647, 1, 0, 1,
-0.687095, -0.6120442, -2.35843, 0.4039216, 1, 0, 1,
-0.686626, -0.8434958, -0.6180882, 0.3960784, 1, 0, 1,
-0.6814689, 1.048911, 1.389266, 0.3921569, 1, 0, 1,
-0.6798761, 0.6374066, -0.2477509, 0.3843137, 1, 0, 1,
-0.6791914, 0.2519517, -1.333855, 0.3803922, 1, 0, 1,
-0.6766835, 0.3877213, -1.874559, 0.372549, 1, 0, 1,
-0.6726484, -1.16491, -0.8575059, 0.3686275, 1, 0, 1,
-0.6725478, 1.632649, 0.7226032, 0.3607843, 1, 0, 1,
-0.6724765, 0.2885018, 0.7566267, 0.3568628, 1, 0, 1,
-0.6714623, -0.03329238, -2.10506, 0.3490196, 1, 0, 1,
-0.6702193, 1.563052, -0.3252641, 0.345098, 1, 0, 1,
-0.6685658, -0.04319752, -2.262609, 0.3372549, 1, 0, 1,
-0.6633782, 0.3339384, -0.4896421, 0.3333333, 1, 0, 1,
-0.6550995, 0.3554378, -2.514044, 0.3254902, 1, 0, 1,
-0.6501397, 0.5987323, -0.8398184, 0.3215686, 1, 0, 1,
-0.645366, -1.171617, -1.540406, 0.3137255, 1, 0, 1,
-0.6434422, -0.6044585, -1.639181, 0.3098039, 1, 0, 1,
-0.6428487, 0.07149833, -0.8464231, 0.3019608, 1, 0, 1,
-0.640708, 0.8163164, 0.2109614, 0.2941177, 1, 0, 1,
-0.6406224, -0.1219536, -2.022381, 0.2901961, 1, 0, 1,
-0.6352403, -1.63931, -3.044919, 0.282353, 1, 0, 1,
-0.6349262, 0.7015564, -0.2213549, 0.2784314, 1, 0, 1,
-0.6265073, 0.9305345, -0.3144998, 0.2705882, 1, 0, 1,
-0.6235624, 1.724404, -1.200858, 0.2666667, 1, 0, 1,
-0.6211677, 0.1545004, -0.7901518, 0.2588235, 1, 0, 1,
-0.6209278, -1.125236, -2.510922, 0.254902, 1, 0, 1,
-0.6172825, -1.549983, -1.333359, 0.2470588, 1, 0, 1,
-0.6158832, 0.3730142, 0.49939, 0.2431373, 1, 0, 1,
-0.6130231, -0.6282254, -1.588821, 0.2352941, 1, 0, 1,
-0.6112425, -0.9434964, -1.393116, 0.2313726, 1, 0, 1,
-0.600455, -0.4320244, -3.530787, 0.2235294, 1, 0, 1,
-0.5937486, -0.01268645, -1.002322, 0.2196078, 1, 0, 1,
-0.5914757, 0.3384807, -0.946812, 0.2117647, 1, 0, 1,
-0.5892571, 0.04327822, 0.6540474, 0.2078431, 1, 0, 1,
-0.5870265, -0.2765639, -1.583581, 0.2, 1, 0, 1,
-0.5858043, 0.05741934, -1.899637, 0.1921569, 1, 0, 1,
-0.5857509, 0.7951301, 2.035359, 0.1882353, 1, 0, 1,
-0.5846389, -2.403783, -2.298804, 0.1803922, 1, 0, 1,
-0.5836995, 0.4000999, -1.014357, 0.1764706, 1, 0, 1,
-0.5820985, -1.878731, -4.276701, 0.1686275, 1, 0, 1,
-0.5766098, -0.9343876, 0.6426554, 0.1647059, 1, 0, 1,
-0.5757476, -0.3272068, -2.406074, 0.1568628, 1, 0, 1,
-0.5731748, -1.720448, -2.475561, 0.1529412, 1, 0, 1,
-0.5662318, 0.4692387, 0.3554161, 0.145098, 1, 0, 1,
-0.565323, -1.305069, -1.50154, 0.1411765, 1, 0, 1,
-0.5607741, -1.599856, -2.664291, 0.1333333, 1, 0, 1,
-0.5594969, -1.004332, -1.949738, 0.1294118, 1, 0, 1,
-0.5561114, -0.9683067, -4.025675, 0.1215686, 1, 0, 1,
-0.5555512, 1.629673, -0.8973606, 0.1176471, 1, 0, 1,
-0.5424083, -0.2188019, -0.9784685, 0.1098039, 1, 0, 1,
-0.5353732, -0.7031999, -3.004251, 0.1058824, 1, 0, 1,
-0.5329518, 1.027065, -0.9018364, 0.09803922, 1, 0, 1,
-0.5316833, 0.5665284, -1.644907, 0.09019608, 1, 0, 1,
-0.5314411, 0.218449, -2.561198, 0.08627451, 1, 0, 1,
-0.5256557, 0.6161579, -1.286256, 0.07843138, 1, 0, 1,
-0.5244651, 0.9587131, -0.7389174, 0.07450981, 1, 0, 1,
-0.5210159, -1.306608, -3.712436, 0.06666667, 1, 0, 1,
-0.5185586, 0.1054388, -1.964435, 0.0627451, 1, 0, 1,
-0.5171366, 1.636321, 0.3805332, 0.05490196, 1, 0, 1,
-0.515281, -0.7513785, -2.908838, 0.05098039, 1, 0, 1,
-0.5131811, 1.212606, 0.2963206, 0.04313726, 1, 0, 1,
-0.4972874, -0.9794394, -2.005987, 0.03921569, 1, 0, 1,
-0.4948583, 1.062931, 0.3447057, 0.03137255, 1, 0, 1,
-0.4938764, -0.03256422, -1.277354, 0.02745098, 1, 0, 1,
-0.4779466, 1.109404, -2.524741, 0.01960784, 1, 0, 1,
-0.4731057, 0.2403289, -2.038626, 0.01568628, 1, 0, 1,
-0.4722994, -2.312807, -4.718783, 0.007843138, 1, 0, 1,
-0.4692313, 0.2806672, -1.712326, 0.003921569, 1, 0, 1,
-0.4598314, 0.1945371, -0.3450217, 0, 1, 0.003921569, 1,
-0.4596694, 1.247736, -0.7890578, 0, 1, 0.01176471, 1,
-0.4586984, -0.8261868, -2.857333, 0, 1, 0.01568628, 1,
-0.4585006, -1.847013, -0.7644286, 0, 1, 0.02352941, 1,
-0.4484614, -0.3492637, -2.09437, 0, 1, 0.02745098, 1,
-0.4484521, 1.646434, -1.285759, 0, 1, 0.03529412, 1,
-0.448386, 0.3657979, -2.813264, 0, 1, 0.03921569, 1,
-0.4461315, 1.728644, 0.2991413, 0, 1, 0.04705882, 1,
-0.4456146, -0.5817252, -0.3732084, 0, 1, 0.05098039, 1,
-0.4423609, 0.04069461, -0.7073286, 0, 1, 0.05882353, 1,
-0.4397513, -1.068652, -2.878247, 0, 1, 0.0627451, 1,
-0.4375947, 0.9436967, -0.423603, 0, 1, 0.07058824, 1,
-0.4354042, 0.5240936, 0.168985, 0, 1, 0.07450981, 1,
-0.434971, 0.6701717, -0.08338229, 0, 1, 0.08235294, 1,
-0.4313282, -0.2061554, -2.745556, 0, 1, 0.08627451, 1,
-0.4312571, 0.1664888, -1.312629, 0, 1, 0.09411765, 1,
-0.4310619, 0.4798404, -0.599298, 0, 1, 0.1019608, 1,
-0.4259358, 1.218104, 0.3775108, 0, 1, 0.1058824, 1,
-0.4259242, -0.3518867, -1.052581, 0, 1, 0.1137255, 1,
-0.4254991, 1.837091, -1.325444, 0, 1, 0.1176471, 1,
-0.421232, -0.630716, -4.200192, 0, 1, 0.1254902, 1,
-0.4182391, 0.000256839, -1.710037, 0, 1, 0.1294118, 1,
-0.4154933, -0.943518, -2.707087, 0, 1, 0.1372549, 1,
-0.4149332, 0.06448369, -1.603444, 0, 1, 0.1411765, 1,
-0.4043227, -0.03449805, -1.788971, 0, 1, 0.1490196, 1,
-0.4040971, 1.078498, -0.7774293, 0, 1, 0.1529412, 1,
-0.3870568, -0.2339799, -1.068398, 0, 1, 0.1607843, 1,
-0.3852998, 1.543522, 0.4814597, 0, 1, 0.1647059, 1,
-0.3846541, -0.8518575, -3.01284, 0, 1, 0.172549, 1,
-0.3818659, -0.2327804, 0.2777699, 0, 1, 0.1764706, 1,
-0.3736467, -1.177158, -2.880306, 0, 1, 0.1843137, 1,
-0.3735357, -0.4123626, -4.098904, 0, 1, 0.1882353, 1,
-0.371891, -0.6075805, -3.746783, 0, 1, 0.1960784, 1,
-0.3718227, -2.102222, -1.09562, 0, 1, 0.2039216, 1,
-0.365568, -1.311246, -1.281576, 0, 1, 0.2078431, 1,
-0.3645521, 0.0772596, -1.562122, 0, 1, 0.2156863, 1,
-0.3610542, 1.942669, -1.649837, 0, 1, 0.2196078, 1,
-0.3608705, 0.2178828, -1.173244, 0, 1, 0.227451, 1,
-0.3558663, -1.622813, -2.646874, 0, 1, 0.2313726, 1,
-0.3499369, -0.4822716, -2.305695, 0, 1, 0.2392157, 1,
-0.349129, 0.7242117, -1.026676, 0, 1, 0.2431373, 1,
-0.3473086, 0.07782178, -2.768446, 0, 1, 0.2509804, 1,
-0.3443515, 0.1677954, -2.169647, 0, 1, 0.254902, 1,
-0.3361716, 0.9785644, 0.02196182, 0, 1, 0.2627451, 1,
-0.3348399, 0.8386353, -0.6992228, 0, 1, 0.2666667, 1,
-0.3347016, -0.3218594, -1.87529, 0, 1, 0.2745098, 1,
-0.3292923, -0.3394072, -2.340078, 0, 1, 0.2784314, 1,
-0.3278933, -0.8157036, -4.070551, 0, 1, 0.2862745, 1,
-0.3220942, 1.224585, -0.4546587, 0, 1, 0.2901961, 1,
-0.3207144, 0.6031607, -0.1844535, 0, 1, 0.2980392, 1,
-0.3189678, 0.4948485, -0.6128869, 0, 1, 0.3058824, 1,
-0.3155461, -1.132185, -3.936708, 0, 1, 0.3098039, 1,
-0.3148411, 0.07426176, -1.499525, 0, 1, 0.3176471, 1,
-0.3132096, 0.8940865, 0.626109, 0, 1, 0.3215686, 1,
-0.3024364, 0.6056227, -1.355904, 0, 1, 0.3294118, 1,
-0.2989083, 0.7964541, -0.08178368, 0, 1, 0.3333333, 1,
-0.2981822, 0.8623347, -0.9249118, 0, 1, 0.3411765, 1,
-0.295949, 0.3372785, 2.225973, 0, 1, 0.345098, 1,
-0.2955285, 0.4913741, 0.08139846, 0, 1, 0.3529412, 1,
-0.2943717, 0.3816828, 0.1517103, 0, 1, 0.3568628, 1,
-0.2920582, -0.329327, -0.7078591, 0, 1, 0.3647059, 1,
-0.289182, 0.9310912, 0.08625833, 0, 1, 0.3686275, 1,
-0.2853473, -0.1565949, -1.999334, 0, 1, 0.3764706, 1,
-0.2842526, -0.217297, -0.8627084, 0, 1, 0.3803922, 1,
-0.2823067, -0.1864075, -1.951424, 0, 1, 0.3882353, 1,
-0.2802044, -0.3742061, -0.6823506, 0, 1, 0.3921569, 1,
-0.2749601, 0.9763792, 0.1647077, 0, 1, 0.4, 1,
-0.2687155, 1.003525, 0.5737312, 0, 1, 0.4078431, 1,
-0.266301, -0.6116331, -3.445551, 0, 1, 0.4117647, 1,
-0.2661596, 0.02911799, -1.797168, 0, 1, 0.4196078, 1,
-0.265459, -0.2451838, -1.832676, 0, 1, 0.4235294, 1,
-0.2507418, 1.670716, -2.031378, 0, 1, 0.4313726, 1,
-0.2492213, -1.270627, -4.731106, 0, 1, 0.4352941, 1,
-0.2483671, 0.4091966, -2.197271, 0, 1, 0.4431373, 1,
-0.2481263, -1.677025, -1.565388, 0, 1, 0.4470588, 1,
-0.2475803, 0.4476639, 1.243368, 0, 1, 0.454902, 1,
-0.2406594, 2.169358, 1.042034, 0, 1, 0.4588235, 1,
-0.2380404, 2.05214, 0.6078979, 0, 1, 0.4666667, 1,
-0.2376161, 0.5184604, 0.9296774, 0, 1, 0.4705882, 1,
-0.2358668, 1.87327, -1.416234, 0, 1, 0.4784314, 1,
-0.2345479, 0.3178229, -0.01437448, 0, 1, 0.4823529, 1,
-0.2315108, 1.295021, 0.2158879, 0, 1, 0.4901961, 1,
-0.2284078, 0.4189953, -1.173018, 0, 1, 0.4941176, 1,
-0.2226508, 0.2992437, 0.03305532, 0, 1, 0.5019608, 1,
-0.2204259, 0.8174593, 0.2862121, 0, 1, 0.509804, 1,
-0.2180318, 1.419559, -0.1661256, 0, 1, 0.5137255, 1,
-0.2172923, -0.1121435, -2.963273, 0, 1, 0.5215687, 1,
-0.2161465, -0.5606452, -2.687777, 0, 1, 0.5254902, 1,
-0.2153867, -0.02862372, -2.150284, 0, 1, 0.5333334, 1,
-0.2112613, -0.7350816, -4.436238, 0, 1, 0.5372549, 1,
-0.2085831, 0.473547, -0.136765, 0, 1, 0.5450981, 1,
-0.203748, 0.07649237, 0.02141569, 0, 1, 0.5490196, 1,
-0.2029285, 0.6950436, -1.666768, 0, 1, 0.5568628, 1,
-0.1989035, 0.2754331, 0.5019175, 0, 1, 0.5607843, 1,
-0.1971481, 1.359059, -0.9944858, 0, 1, 0.5686275, 1,
-0.196493, 0.4840874, -2.075335, 0, 1, 0.572549, 1,
-0.1844445, -0.1286527, -2.297974, 0, 1, 0.5803922, 1,
-0.1840867, 0.0004914462, 0.1014252, 0, 1, 0.5843138, 1,
-0.1833386, 0.5533866, 0.4663238, 0, 1, 0.5921569, 1,
-0.1832477, 0.7632868, -1.594005, 0, 1, 0.5960785, 1,
-0.1737613, 1.953594, -0.6925966, 0, 1, 0.6039216, 1,
-0.1705749, 1.51383, 0.09501018, 0, 1, 0.6117647, 1,
-0.1622767, 0.997532, -0.5849687, 0, 1, 0.6156863, 1,
-0.1509532, -0.5572395, -3.694319, 0, 1, 0.6235294, 1,
-0.1505831, -1.189366, -4.01829, 0, 1, 0.627451, 1,
-0.1491666, 0.3042274, -0.1710237, 0, 1, 0.6352941, 1,
-0.145338, 2.018916, -0.07414849, 0, 1, 0.6392157, 1,
-0.1437462, 0.1735995, 0.2653714, 0, 1, 0.6470588, 1,
-0.1431737, -0.9333443, -0.9914738, 0, 1, 0.6509804, 1,
-0.1411138, 1.087696, -1.208755, 0, 1, 0.6588235, 1,
-0.1303752, 0.02408057, -1.778882, 0, 1, 0.6627451, 1,
-0.1297964, 0.1614157, -0.8005176, 0, 1, 0.6705883, 1,
-0.1282719, 0.3184551, -0.7328314, 0, 1, 0.6745098, 1,
-0.1277255, -0.3550175, -1.886289, 0, 1, 0.682353, 1,
-0.1276826, -1.362044, -3.090446, 0, 1, 0.6862745, 1,
-0.1273934, 0.2641763, 1.246505, 0, 1, 0.6941177, 1,
-0.126224, -0.2816148, -2.524022, 0, 1, 0.7019608, 1,
-0.1249074, -0.5525607, -4.547976, 0, 1, 0.7058824, 1,
-0.1212153, -0.09402769, -2.206559, 0, 1, 0.7137255, 1,
-0.1119511, 0.9372171, -0.1200511, 0, 1, 0.7176471, 1,
-0.1101653, -0.2717755, -1.084264, 0, 1, 0.7254902, 1,
-0.1061237, 0.7421111, -0.7339476, 0, 1, 0.7294118, 1,
-0.1042833, 0.2373316, -1.396714, 0, 1, 0.7372549, 1,
-0.09362879, 0.2690088, -2.330759, 0, 1, 0.7411765, 1,
-0.09051867, 0.8305961, 1.274851, 0, 1, 0.7490196, 1,
-0.08640081, 0.6167257, -0.2634381, 0, 1, 0.7529412, 1,
-0.08582298, 1.006456, -0.3544857, 0, 1, 0.7607843, 1,
-0.08450493, -0.8315735, -4.018563, 0, 1, 0.7647059, 1,
-0.08401382, -0.336221, -2.648298, 0, 1, 0.772549, 1,
-0.08251251, 0.5827131, -1.050592, 0, 1, 0.7764706, 1,
-0.08148904, -0.01285339, -2.402616, 0, 1, 0.7843137, 1,
-0.07885011, 0.3318439, 1.727646, 0, 1, 0.7882353, 1,
-0.07647127, -1.48589, -3.107038, 0, 1, 0.7960784, 1,
-0.07626729, 0.1962178, 0.4394788, 0, 1, 0.8039216, 1,
-0.07616868, -0.5212288, -3.282958, 0, 1, 0.8078431, 1,
-0.07395119, 0.6079426, -1.207106, 0, 1, 0.8156863, 1,
-0.07341284, 0.4405785, 0.03536473, 0, 1, 0.8196079, 1,
-0.07261259, -1.059057, -2.721122, 0, 1, 0.827451, 1,
-0.06770191, -1.408104, -1.944204, 0, 1, 0.8313726, 1,
-0.06478454, 0.9348921, 1.295152, 0, 1, 0.8392157, 1,
-0.06333924, 0.5315216, 0.04500889, 0, 1, 0.8431373, 1,
-0.06164168, 0.7021534, -0.4673612, 0, 1, 0.8509804, 1,
-0.06126976, 1.638931, 1.580568, 0, 1, 0.854902, 1,
-0.058911, 0.4514473, -1.147445, 0, 1, 0.8627451, 1,
-0.05786071, 0.8865776, 0.3243303, 0, 1, 0.8666667, 1,
-0.05763583, 1.210513, -0.9926719, 0, 1, 0.8745098, 1,
-0.05724385, 0.9245455, 0.8984947, 0, 1, 0.8784314, 1,
-0.05551393, -2.277993, -3.058612, 0, 1, 0.8862745, 1,
-0.05486551, 0.9724449, -2.287608, 0, 1, 0.8901961, 1,
-0.054731, 0.0828822, 0.7504352, 0, 1, 0.8980392, 1,
-0.05008284, -1.673723, -3.90557, 0, 1, 0.9058824, 1,
-0.04428252, 1.120729, -1.346532, 0, 1, 0.9098039, 1,
-0.04244259, -1.195738, -2.781173, 0, 1, 0.9176471, 1,
-0.04136394, 1.622191, -0.1566373, 0, 1, 0.9215686, 1,
-0.02857959, 0.1661798, -1.982675, 0, 1, 0.9294118, 1,
-0.02696415, -1.475334, -2.497431, 0, 1, 0.9333333, 1,
-0.02360067, 0.1151363, -0.7461907, 0, 1, 0.9411765, 1,
-0.02324021, -1.041639, -1.640391, 0, 1, 0.945098, 1,
-0.02297535, -0.05557321, -3.67522, 0, 1, 0.9529412, 1,
-0.01985374, 0.3934771, 1.29093, 0, 1, 0.9568627, 1,
-0.01536831, -0.5010962, -2.156994, 0, 1, 0.9647059, 1,
-0.01209901, -0.06644192, -2.801801, 0, 1, 0.9686275, 1,
-0.01092362, 1.570093, -1.005885, 0, 1, 0.9764706, 1,
-0.008417998, 0.2156311, -0.9005636, 0, 1, 0.9803922, 1,
-0.00816885, 1.012863, -0.3179883, 0, 1, 0.9882353, 1,
-0.006787758, -0.1411528, -2.448868, 0, 1, 0.9921569, 1,
-0.005955713, -0.4623605, -3.500608, 0, 1, 1, 1,
-0.005667284, -0.03552778, -4.324203, 0, 0.9921569, 1, 1,
-0.004913082, -1.022368, -1.815843, 0, 0.9882353, 1, 1,
-0.003429579, -0.4761856, -4.264113, 0, 0.9803922, 1, 1,
0.001775322, -0.627111, 3.321882, 0, 0.9764706, 1, 1,
0.006068438, 1.023282, 1.212945, 0, 0.9686275, 1, 1,
0.006216001, 0.1959584, 0.9628494, 0, 0.9647059, 1, 1,
0.01045715, -0.5911272, 5.514507, 0, 0.9568627, 1, 1,
0.01433119, 0.76704, -0.6837634, 0, 0.9529412, 1, 1,
0.01716864, 0.5533562, 0.2712483, 0, 0.945098, 1, 1,
0.01763346, 2.797875, 0.178395, 0, 0.9411765, 1, 1,
0.01877095, 2.093082, 0.5936704, 0, 0.9333333, 1, 1,
0.01907428, -0.770832, 0.01550985, 0, 0.9294118, 1, 1,
0.019421, 0.65093, -0.2406237, 0, 0.9215686, 1, 1,
0.02322388, -0.9946262, 3.684219, 0, 0.9176471, 1, 1,
0.02560375, -0.9333794, 3.468741, 0, 0.9098039, 1, 1,
0.02828835, 0.07716413, 0.4873549, 0, 0.9058824, 1, 1,
0.03804444, 0.5994763, 0.8380823, 0, 0.8980392, 1, 1,
0.04531305, 2.102918, -0.1002882, 0, 0.8901961, 1, 1,
0.05130642, 0.7010593, -1.157668, 0, 0.8862745, 1, 1,
0.056208, -0.9132002, 3.270286, 0, 0.8784314, 1, 1,
0.05728015, -0.6726921, 5.088151, 0, 0.8745098, 1, 1,
0.06446373, -2.189857, 2.733756, 0, 0.8666667, 1, 1,
0.06639907, -0.02670209, 3.61392, 0, 0.8627451, 1, 1,
0.06913708, 0.1543134, 0.1497048, 0, 0.854902, 1, 1,
0.07433653, -0.1785724, 3.582354, 0, 0.8509804, 1, 1,
0.08814818, -2.044592, 3.268534, 0, 0.8431373, 1, 1,
0.08862816, 0.8379334, 0.4485533, 0, 0.8392157, 1, 1,
0.08879402, -1.774132, 2.161298, 0, 0.8313726, 1, 1,
0.09040499, -1.80789, 2.568415, 0, 0.827451, 1, 1,
0.09459077, -0.1722811, 3.186285, 0, 0.8196079, 1, 1,
0.09675246, -0.2246645, 5.198759, 0, 0.8156863, 1, 1,
0.09735328, 0.04774871, 2.416189, 0, 0.8078431, 1, 1,
0.1001298, -0.1107035, 0.8046607, 0, 0.8039216, 1, 1,
0.1025633, -1.008334, 3.416805, 0, 0.7960784, 1, 1,
0.1045917, -1.565926, 2.745652, 0, 0.7882353, 1, 1,
0.1053008, -3.120837, 4.543822, 0, 0.7843137, 1, 1,
0.1073161, -1.353095, 1.508756, 0, 0.7764706, 1, 1,
0.1090517, -0.7673761, 4.06454, 0, 0.772549, 1, 1,
0.1133648, -0.5816753, 2.400341, 0, 0.7647059, 1, 1,
0.1150868, -1.974567, 3.324967, 0, 0.7607843, 1, 1,
0.1165528, -0.002403965, 1.735793, 0, 0.7529412, 1, 1,
0.1203725, 1.411111, -0.9225114, 0, 0.7490196, 1, 1,
0.1215849, 2.445273, -0.4186378, 0, 0.7411765, 1, 1,
0.12464, -0.08326166, 1.216654, 0, 0.7372549, 1, 1,
0.1260479, -0.1754239, 2.1994, 0, 0.7294118, 1, 1,
0.1269215, -0.6188119, 2.873554, 0, 0.7254902, 1, 1,
0.1274557, -0.3897863, 2.273615, 0, 0.7176471, 1, 1,
0.1281177, 1.504807, 0.8705205, 0, 0.7137255, 1, 1,
0.1294854, 0.8149337, 0.3823702, 0, 0.7058824, 1, 1,
0.1351323, 0.3389537, 0.4943547, 0, 0.6980392, 1, 1,
0.1423942, -0.6110312, 1.607904, 0, 0.6941177, 1, 1,
0.1452401, -0.4187175, 1.516269, 0, 0.6862745, 1, 1,
0.1456506, -0.6163692, 2.463244, 0, 0.682353, 1, 1,
0.1503635, 1.164231, -0.3950919, 0, 0.6745098, 1, 1,
0.1523502, -1.756338, 0.831484, 0, 0.6705883, 1, 1,
0.154861, -0.2832639, 3.64977, 0, 0.6627451, 1, 1,
0.1560865, 0.3415617, -1.224597, 0, 0.6588235, 1, 1,
0.1565181, -0.9124564, 3.572598, 0, 0.6509804, 1, 1,
0.1589327, 0.7964211, 0.2281256, 0, 0.6470588, 1, 1,
0.1597895, -0.4927771, 3.10356, 0, 0.6392157, 1, 1,
0.1623148, -0.4224605, 3.283157, 0, 0.6352941, 1, 1,
0.1653582, 0.1859188, 1.363947, 0, 0.627451, 1, 1,
0.168916, -0.002424865, 0.5218136, 0, 0.6235294, 1, 1,
0.1828371, -0.1136986, 1.333221, 0, 0.6156863, 1, 1,
0.1852723, 0.3938373, -0.2919729, 0, 0.6117647, 1, 1,
0.1859355, 1.544411, 1.913663, 0, 0.6039216, 1, 1,
0.1883609, -0.3048248, 2.728908, 0, 0.5960785, 1, 1,
0.188933, 0.195306, 1.198065, 0, 0.5921569, 1, 1,
0.1896636, 0.214973, -0.1830942, 0, 0.5843138, 1, 1,
0.1941146, -0.3076163, 1.797283, 0, 0.5803922, 1, 1,
0.1947134, -0.1363923, 1.263535, 0, 0.572549, 1, 1,
0.1949184, 0.2648911, 1.481269, 0, 0.5686275, 1, 1,
0.1974104, -2.032435, 2.834598, 0, 0.5607843, 1, 1,
0.2063453, -1.961643, 3.40958, 0, 0.5568628, 1, 1,
0.2067858, 0.1868048, -0.2081529, 0, 0.5490196, 1, 1,
0.214031, 1.236496, -1.518685, 0, 0.5450981, 1, 1,
0.21506, -0.04866352, 2.291771, 0, 0.5372549, 1, 1,
0.2174744, -0.8510678, 3.067895, 0, 0.5333334, 1, 1,
0.2195019, 0.6586571, -1.661719, 0, 0.5254902, 1, 1,
0.2307865, -1.660781, 1.152007, 0, 0.5215687, 1, 1,
0.2329785, 0.1243121, 3.221576, 0, 0.5137255, 1, 1,
0.2349163, -0.08536398, -0.3357161, 0, 0.509804, 1, 1,
0.2351576, 1.433325, 0.3657824, 0, 0.5019608, 1, 1,
0.2390229, 0.5216404, 0.4893358, 0, 0.4941176, 1, 1,
0.2471239, -0.01704922, -0.1582942, 0, 0.4901961, 1, 1,
0.2530466, -0.2217373, 0.7312909, 0, 0.4823529, 1, 1,
0.2561635, -0.7127954, 0.9355783, 0, 0.4784314, 1, 1,
0.2574953, 0.53699, 1.70238, 0, 0.4705882, 1, 1,
0.2602414, -1.09101, 0.1078605, 0, 0.4666667, 1, 1,
0.2612671, 0.03741025, 0.2872713, 0, 0.4588235, 1, 1,
0.2620031, -0.4876246, 2.465186, 0, 0.454902, 1, 1,
0.2633567, -0.6256995, 3.159759, 0, 0.4470588, 1, 1,
0.2707377, -0.6860397, 2.226503, 0, 0.4431373, 1, 1,
0.2762648, 0.2487583, 0.6563529, 0, 0.4352941, 1, 1,
0.2792738, 1.954969, -1.210356, 0, 0.4313726, 1, 1,
0.2809358, 0.6906568, 0.1610469, 0, 0.4235294, 1, 1,
0.282223, -1.143617, 3.144969, 0, 0.4196078, 1, 1,
0.2838152, -0.5074046, 2.632442, 0, 0.4117647, 1, 1,
0.2858085, 0.9162271, 0.5168647, 0, 0.4078431, 1, 1,
0.2871881, 0.3780876, -0.06432123, 0, 0.4, 1, 1,
0.2893885, -0.6864066, 2.752902, 0, 0.3921569, 1, 1,
0.2897812, -1.722534, 3.196626, 0, 0.3882353, 1, 1,
0.2905143, 0.40184, 0.4348539, 0, 0.3803922, 1, 1,
0.2955073, -1.145007, 2.26441, 0, 0.3764706, 1, 1,
0.2963773, 0.02253838, 0.7623515, 0, 0.3686275, 1, 1,
0.2964862, -1.159277, 2.723158, 0, 0.3647059, 1, 1,
0.3012095, -0.9498187, 3.987825, 0, 0.3568628, 1, 1,
0.3056422, 0.2070941, 0.1309683, 0, 0.3529412, 1, 1,
0.3075407, -0.4081924, 1.950727, 0, 0.345098, 1, 1,
0.3076121, -0.6381575, 2.766446, 0, 0.3411765, 1, 1,
0.3080614, 0.1118939, -0.3902061, 0, 0.3333333, 1, 1,
0.3101079, 1.485418, 0.4089932, 0, 0.3294118, 1, 1,
0.3107313, 0.1697577, 2.930337, 0, 0.3215686, 1, 1,
0.3122836, -1.040612, 3.202699, 0, 0.3176471, 1, 1,
0.3131272, 1.732299, 0.1047393, 0, 0.3098039, 1, 1,
0.316351, 1.599742, -0.1660481, 0, 0.3058824, 1, 1,
0.3192981, -1.567079, 3.795149, 0, 0.2980392, 1, 1,
0.3201754, 0.2670495, 0.5255144, 0, 0.2901961, 1, 1,
0.3216047, 0.8219261, 2.135443, 0, 0.2862745, 1, 1,
0.3250088, -1.547293, 2.744003, 0, 0.2784314, 1, 1,
0.3260713, -1.263954, 3.644532, 0, 0.2745098, 1, 1,
0.3275328, -2.357591, 3.002134, 0, 0.2666667, 1, 1,
0.3283922, -0.127938, 2.195383, 0, 0.2627451, 1, 1,
0.3320239, -0.3923848, 2.894411, 0, 0.254902, 1, 1,
0.3329341, -1.008313, 2.476652, 0, 0.2509804, 1, 1,
0.3331566, -0.5831245, 4.836299, 0, 0.2431373, 1, 1,
0.3365541, -0.1284527, 2.941808, 0, 0.2392157, 1, 1,
0.3377043, 0.8478864, 0.7949255, 0, 0.2313726, 1, 1,
0.338277, -1.554372, 2.918681, 0, 0.227451, 1, 1,
0.3389612, -0.005930796, 2.012135, 0, 0.2196078, 1, 1,
0.3404445, 0.2273598, 1.994868, 0, 0.2156863, 1, 1,
0.3435086, -0.9949138, 4.374671, 0, 0.2078431, 1, 1,
0.343915, 1.04479, 1.251071, 0, 0.2039216, 1, 1,
0.3462295, 0.08436542, 0.7950149, 0, 0.1960784, 1, 1,
0.3481299, -0.1685245, 0.8005157, 0, 0.1882353, 1, 1,
0.3516111, 0.7482782, 0.3626189, 0, 0.1843137, 1, 1,
0.3530353, 0.8682359, -0.3144912, 0, 0.1764706, 1, 1,
0.3543042, 2.09415, 2.381606, 0, 0.172549, 1, 1,
0.3566997, 1.203112, -0.9738011, 0, 0.1647059, 1, 1,
0.356793, -0.7002046, 3.805704, 0, 0.1607843, 1, 1,
0.3581337, 0.3933099, 1.411661, 0, 0.1529412, 1, 1,
0.362377, 0.3871563, 1.661946, 0, 0.1490196, 1, 1,
0.3646922, 1.265274, -0.3712698, 0, 0.1411765, 1, 1,
0.3648649, 0.0575412, 1.681814, 0, 0.1372549, 1, 1,
0.3692466, -0.2105227, 1.83604, 0, 0.1294118, 1, 1,
0.3698426, 0.7098394, -0.3760551, 0, 0.1254902, 1, 1,
0.3716064, -0.1042246, 2.877352, 0, 0.1176471, 1, 1,
0.3785837, 0.6952161, 1.736333, 0, 0.1137255, 1, 1,
0.3857268, 0.938849, 1.122452, 0, 0.1058824, 1, 1,
0.3863679, 0.3170676, 0.31041, 0, 0.09803922, 1, 1,
0.3868339, 2.037188, -0.07367466, 0, 0.09411765, 1, 1,
0.3906169, -0.9105515, 1.622242, 0, 0.08627451, 1, 1,
0.3956101, 0.8254143, 0.573285, 0, 0.08235294, 1, 1,
0.3987746, -0.7034507, 3.557774, 0, 0.07450981, 1, 1,
0.4157712, -0.02908166, 1.259385, 0, 0.07058824, 1, 1,
0.4192356, -0.008802447, 1.490009, 0, 0.0627451, 1, 1,
0.4222653, 0.03752218, 0.7995443, 0, 0.05882353, 1, 1,
0.4238018, -0.3158122, -0.3240673, 0, 0.05098039, 1, 1,
0.4268428, 0.3035279, 0.3632077, 0, 0.04705882, 1, 1,
0.4274617, -1.049849, 1.737535, 0, 0.03921569, 1, 1,
0.4279942, 0.06289558, 0.4209591, 0, 0.03529412, 1, 1,
0.429412, -1.62993, 0.4509041, 0, 0.02745098, 1, 1,
0.4315302, 0.3628592, 0.8276898, 0, 0.02352941, 1, 1,
0.4323401, 0.4825341, 0.7874656, 0, 0.01568628, 1, 1,
0.4346797, 2.695398, -0.277464, 0, 0.01176471, 1, 1,
0.4354014, 0.8023835, 1.667434, 0, 0.003921569, 1, 1,
0.4355507, -0.8731596, 2.829478, 0.003921569, 0, 1, 1,
0.4557288, 0.7844754, -0.7525225, 0.007843138, 0, 1, 1,
0.4591772, -0.900579, 0.8390733, 0.01568628, 0, 1, 1,
0.4607016, 0.7936075, 2.358692, 0.01960784, 0, 1, 1,
0.4607602, 0.9007746, 0.1729499, 0.02745098, 0, 1, 1,
0.4618358, 0.5592289, 0.7692955, 0.03137255, 0, 1, 1,
0.4695966, 0.5790043, 2.383196, 0.03921569, 0, 1, 1,
0.4717014, -0.1174962, 1.771284, 0.04313726, 0, 1, 1,
0.4726467, -1.777304, 1.460146, 0.05098039, 0, 1, 1,
0.4727084, 0.7090627, 1.326548, 0.05490196, 0, 1, 1,
0.4760774, 0.02152559, 2.456217, 0.0627451, 0, 1, 1,
0.4814511, -1.307126, 2.743457, 0.06666667, 0, 1, 1,
0.4818885, -0.7833062, 0.4490116, 0.07450981, 0, 1, 1,
0.4830162, -0.1783344, 2.628688, 0.07843138, 0, 1, 1,
0.4879123, -0.9056588, 1.657449, 0.08627451, 0, 1, 1,
0.4918751, 1.872051, 0.3158622, 0.09019608, 0, 1, 1,
0.4924316, 0.2861677, 1.00975, 0.09803922, 0, 1, 1,
0.4942518, -1.584278, 3.701283, 0.1058824, 0, 1, 1,
0.4970791, -0.2474547, 1.434202, 0.1098039, 0, 1, 1,
0.4973691, -0.1482152, -0.4760418, 0.1176471, 0, 1, 1,
0.5005929, -0.2122526, 2.476869, 0.1215686, 0, 1, 1,
0.5030361, -0.3213626, 1.763497, 0.1294118, 0, 1, 1,
0.505814, 0.1723586, 1.56361, 0.1333333, 0, 1, 1,
0.5075926, -0.7390668, 3.377352, 0.1411765, 0, 1, 1,
0.5133954, 1.66248, -0.5258145, 0.145098, 0, 1, 1,
0.5145056, 1.521006, 0.4807045, 0.1529412, 0, 1, 1,
0.5164489, -0.755407, 2.993717, 0.1568628, 0, 1, 1,
0.5190911, -1.102661, 2.675073, 0.1647059, 0, 1, 1,
0.5191619, 0.9619221, 1.704244, 0.1686275, 0, 1, 1,
0.5219369, -0.1561297, 3.753857, 0.1764706, 0, 1, 1,
0.5288072, 2.413049, -1.821176, 0.1803922, 0, 1, 1,
0.5312162, 0.8495619, 1.652248, 0.1882353, 0, 1, 1,
0.5313481, 1.91621, 0.1067735, 0.1921569, 0, 1, 1,
0.5326946, 0.3589515, 3.14495, 0.2, 0, 1, 1,
0.5365354, -0.03439654, 1.802804, 0.2078431, 0, 1, 1,
0.5393933, 0.05872545, -0.2270461, 0.2117647, 0, 1, 1,
0.5418804, 1.004655, 1.571244, 0.2196078, 0, 1, 1,
0.5580789, -0.5442931, 2.443479, 0.2235294, 0, 1, 1,
0.5604851, -1.16504, 2.334699, 0.2313726, 0, 1, 1,
0.5612732, 0.5395716, 0.4579601, 0.2352941, 0, 1, 1,
0.5613006, -0.2804572, 1.89867, 0.2431373, 0, 1, 1,
0.5622614, 1.087267, 0.4600055, 0.2470588, 0, 1, 1,
0.5643386, 3.140308, -0.03095589, 0.254902, 0, 1, 1,
0.5669057, -1.097989, 3.533587, 0.2588235, 0, 1, 1,
0.5671445, -0.1393038, 4.081665, 0.2666667, 0, 1, 1,
0.5755011, -0.5577362, 2.550254, 0.2705882, 0, 1, 1,
0.5765145, 1.228095, -0.2000633, 0.2784314, 0, 1, 1,
0.5800339, -2.006437, 3.01127, 0.282353, 0, 1, 1,
0.5809081, 0.6466753, 1.806741, 0.2901961, 0, 1, 1,
0.5863628, 0.7042303, 2.122658, 0.2941177, 0, 1, 1,
0.5866102, 2.002148, 0.9383109, 0.3019608, 0, 1, 1,
0.5900019, -0.4847431, 2.140786, 0.3098039, 0, 1, 1,
0.5909498, 0.009417723, 1.773312, 0.3137255, 0, 1, 1,
0.5938538, -0.1122991, 1.946234, 0.3215686, 0, 1, 1,
0.5988256, 0.529581, -0.6162033, 0.3254902, 0, 1, 1,
0.6024504, 0.4981076, -0.814472, 0.3333333, 0, 1, 1,
0.6140021, -0.7444743, 2.729175, 0.3372549, 0, 1, 1,
0.6153691, -0.08326106, 2.57457, 0.345098, 0, 1, 1,
0.6163052, -0.8762958, 0.9621188, 0.3490196, 0, 1, 1,
0.618358, -0.01081469, 1.900411, 0.3568628, 0, 1, 1,
0.6198249, 0.8658919, -0.8475661, 0.3607843, 0, 1, 1,
0.6266695, 0.01121512, 1.526354, 0.3686275, 0, 1, 1,
0.6268517, -0.04140449, 2.175076, 0.372549, 0, 1, 1,
0.6283845, 0.1041196, 1.121913, 0.3803922, 0, 1, 1,
0.6356495, 0.1198521, 1.558064, 0.3843137, 0, 1, 1,
0.6389329, 0.472085, 0.4938118, 0.3921569, 0, 1, 1,
0.6389782, 0.248501, 2.422041, 0.3960784, 0, 1, 1,
0.6396861, -1.546812, 1.465315, 0.4039216, 0, 1, 1,
0.6413279, -1.728907, 2.05685, 0.4117647, 0, 1, 1,
0.6421819, -0.2778639, 2.883588, 0.4156863, 0, 1, 1,
0.6478161, 1.579128, 1.898259, 0.4235294, 0, 1, 1,
0.649042, 1.807208, -0.907443, 0.427451, 0, 1, 1,
0.6511427, -0.6557702, 1.873214, 0.4352941, 0, 1, 1,
0.6526962, -0.3151572, 0.7320724, 0.4392157, 0, 1, 1,
0.6633937, 0.04547537, -1.822606, 0.4470588, 0, 1, 1,
0.6662914, 0.3848255, 1.380971, 0.4509804, 0, 1, 1,
0.6716433, 0.4479045, -1.505049, 0.4588235, 0, 1, 1,
0.6739337, -0.4561742, 2.085384, 0.4627451, 0, 1, 1,
0.6758188, -1.262643, 2.255181, 0.4705882, 0, 1, 1,
0.680639, 1.109593, 0.5755207, 0.4745098, 0, 1, 1,
0.6817352, 0.01628459, 0.391218, 0.4823529, 0, 1, 1,
0.6839314, -1.315655, 2.886068, 0.4862745, 0, 1, 1,
0.6851851, -0.7823527, 3.039122, 0.4941176, 0, 1, 1,
0.6866381, -1.342136, 2.136269, 0.5019608, 0, 1, 1,
0.6893022, -0.4071677, 0.3494533, 0.5058824, 0, 1, 1,
0.6901193, -1.335479, 2.140638, 0.5137255, 0, 1, 1,
0.6981466, -0.4180859, 1.630447, 0.5176471, 0, 1, 1,
0.69942, 0.09203902, 1.627588, 0.5254902, 0, 1, 1,
0.7119684, 1.719325, 1.669948, 0.5294118, 0, 1, 1,
0.7134452, 0.1106681, 0.2583992, 0.5372549, 0, 1, 1,
0.7144379, -0.01558687, 1.505706, 0.5411765, 0, 1, 1,
0.7199508, -1.134832, 2.379427, 0.5490196, 0, 1, 1,
0.7230724, -1.352904, 2.806489, 0.5529412, 0, 1, 1,
0.7244011, 0.4087429, -0.3158111, 0.5607843, 0, 1, 1,
0.7245514, 0.3030124, 2.099602, 0.5647059, 0, 1, 1,
0.725563, 0.9506806, 1.00707, 0.572549, 0, 1, 1,
0.7296312, -0.07082928, 1.869628, 0.5764706, 0, 1, 1,
0.7298805, 0.1414434, 1.543226, 0.5843138, 0, 1, 1,
0.733425, -0.4116229, 4.060936, 0.5882353, 0, 1, 1,
0.7371804, -0.3408685, 4.58735, 0.5960785, 0, 1, 1,
0.7418162, -1.29461, 4.008202, 0.6039216, 0, 1, 1,
0.7429847, -0.8444338, 1.623232, 0.6078432, 0, 1, 1,
0.7459814, -0.8529128, 3.477617, 0.6156863, 0, 1, 1,
0.7524926, 0.3904037, 0.5127664, 0.6196079, 0, 1, 1,
0.7564031, 0.3513731, 0.6563741, 0.627451, 0, 1, 1,
0.7580309, 0.3103318, 1.393986, 0.6313726, 0, 1, 1,
0.7601865, 0.4123682, 0.0164323, 0.6392157, 0, 1, 1,
0.7608783, -0.4673227, 2.676213, 0.6431373, 0, 1, 1,
0.7677378, -1.271249, 1.792974, 0.6509804, 0, 1, 1,
0.7714195, -0.1306718, 3.107604, 0.654902, 0, 1, 1,
0.7778123, 0.7352835, 2.594448, 0.6627451, 0, 1, 1,
0.7788175, 1.220868, 2.048421, 0.6666667, 0, 1, 1,
0.781997, -0.6588347, 3.764133, 0.6745098, 0, 1, 1,
0.782758, -0.232173, 0.8144286, 0.6784314, 0, 1, 1,
0.7837018, -0.06791202, 2.002017, 0.6862745, 0, 1, 1,
0.7934365, 0.7775846, 2.210252, 0.6901961, 0, 1, 1,
0.7994367, 0.3310702, 2.407541, 0.6980392, 0, 1, 1,
0.8002254, -1.164881, 2.280013, 0.7058824, 0, 1, 1,
0.8019122, 0.6296313, 2.381426, 0.7098039, 0, 1, 1,
0.8043223, 0.3750644, 2.406001, 0.7176471, 0, 1, 1,
0.805174, -1.801306, 3.241086, 0.7215686, 0, 1, 1,
0.8057715, -0.463443, 1.541724, 0.7294118, 0, 1, 1,
0.8098649, -0.1642636, 2.341072, 0.7333333, 0, 1, 1,
0.8149617, 0.3253237, 2.533017, 0.7411765, 0, 1, 1,
0.8247408, -1.014223, 3.41736, 0.7450981, 0, 1, 1,
0.8289856, -0.4792873, 3.01682, 0.7529412, 0, 1, 1,
0.8305427, 0.1063731, 1.091924, 0.7568628, 0, 1, 1,
0.8339425, -0.2012596, 2.484537, 0.7647059, 0, 1, 1,
0.8348244, 0.7716078, 0.2924954, 0.7686275, 0, 1, 1,
0.8355369, 2.414592, 0.766813, 0.7764706, 0, 1, 1,
0.8357553, -1.85115, 2.468723, 0.7803922, 0, 1, 1,
0.8374187, 0.8642581, 0.8495821, 0.7882353, 0, 1, 1,
0.8376081, 0.05477362, 2.389156, 0.7921569, 0, 1, 1,
0.8382138, -0.2123156, 2.158933, 0.8, 0, 1, 1,
0.8460958, 1.33723, 0.2167189, 0.8078431, 0, 1, 1,
0.8461642, -0.4419889, 3.494023, 0.8117647, 0, 1, 1,
0.8485297, 0.04645316, 0.6546136, 0.8196079, 0, 1, 1,
0.8500381, -1.897799, 3.678369, 0.8235294, 0, 1, 1,
0.8500903, -0.2331312, 0.8945975, 0.8313726, 0, 1, 1,
0.8520155, -2.400335, 4.14046, 0.8352941, 0, 1, 1,
0.8520762, 0.0114366, 1.705279, 0.8431373, 0, 1, 1,
0.8531737, 0.3182218, 0.8963996, 0.8470588, 0, 1, 1,
0.857344, -0.2197504, 2.386193, 0.854902, 0, 1, 1,
0.8583827, -0.7797858, 4.859096, 0.8588235, 0, 1, 1,
0.8694351, 1.544444, -0.7137753, 0.8666667, 0, 1, 1,
0.8791286, 2.424502, 0.6026942, 0.8705882, 0, 1, 1,
0.8820102, 1.10475, 2.243733, 0.8784314, 0, 1, 1,
0.8863198, 0.1636555, 0.3748819, 0.8823529, 0, 1, 1,
0.8900434, 0.3385084, 0.9596305, 0.8901961, 0, 1, 1,
0.896464, -0.8451189, 2.554613, 0.8941177, 0, 1, 1,
0.8988304, 0.01044984, 0.8870007, 0.9019608, 0, 1, 1,
0.9022356, 0.1494871, 1.637433, 0.9098039, 0, 1, 1,
0.9031296, -0.9043927, 1.135119, 0.9137255, 0, 1, 1,
0.9129205, -0.4115941, 2.579492, 0.9215686, 0, 1, 1,
0.9131522, 1.490722, -0.102557, 0.9254902, 0, 1, 1,
0.9140732, -0.3024429, 1.047014, 0.9333333, 0, 1, 1,
0.9178796, -1.139567, 2.354974, 0.9372549, 0, 1, 1,
0.925496, 0.7921025, 1.287334, 0.945098, 0, 1, 1,
0.9412048, -0.372089, 1.942865, 0.9490196, 0, 1, 1,
0.9440699, 0.1349351, 0.1896002, 0.9568627, 0, 1, 1,
0.9446066, 0.5576257, 1.377293, 0.9607843, 0, 1, 1,
0.9466081, 2.496933, -0.4606399, 0.9686275, 0, 1, 1,
0.9480219, -0.1204168, 2.477919, 0.972549, 0, 1, 1,
0.9572035, 0.2288831, 2.115661, 0.9803922, 0, 1, 1,
0.9573167, 1.275049, -0.2702065, 0.9843137, 0, 1, 1,
0.9574907, -0.07378998, 3.337488, 0.9921569, 0, 1, 1,
0.9595482, 0.2179369, 0.02795435, 0.9960784, 0, 1, 1,
0.9615566, -0.5029776, 2.485747, 1, 0, 0.9960784, 1,
0.9668497, -0.05252323, 2.251937, 1, 0, 0.9882353, 1,
0.9772726, -1.109854, 1.628917, 1, 0, 0.9843137, 1,
0.9817371, -2.827598, 2.638825, 1, 0, 0.9764706, 1,
0.9831265, -0.8800908, 3.168448, 1, 0, 0.972549, 1,
0.991004, 0.8227869, 0.9046323, 1, 0, 0.9647059, 1,
0.9971819, -0.5595556, 1.90681, 1, 0, 0.9607843, 1,
1.000233, 1.245662, 0.6359603, 1, 0, 0.9529412, 1,
1.001268, 1.146854, 0.4774066, 1, 0, 0.9490196, 1,
1.003163, 0.5863603, 2.715143, 1, 0, 0.9411765, 1,
1.008936, -0.2199115, 1.43903, 1, 0, 0.9372549, 1,
1.014088, -1.805296, 1.487496, 1, 0, 0.9294118, 1,
1.018933, 0.4913657, 1.0302, 1, 0, 0.9254902, 1,
1.033832, 1.51868, 1.484833, 1, 0, 0.9176471, 1,
1.036169, 1.675035, 0.06803707, 1, 0, 0.9137255, 1,
1.036813, -0.1498389, 2.11106, 1, 0, 0.9058824, 1,
1.040653, -1.407174, 2.983644, 1, 0, 0.9019608, 1,
1.041378, -1.034559, 1.903907, 1, 0, 0.8941177, 1,
1.046373, 0.02698634, 1.152022, 1, 0, 0.8862745, 1,
1.04986, 1.155787, -0.1726063, 1, 0, 0.8823529, 1,
1.05163, 0.4566376, 0.4133283, 1, 0, 0.8745098, 1,
1.054737, 0.1291255, 0.7933214, 1, 0, 0.8705882, 1,
1.068504, 0.5003911, 1.100433, 1, 0, 0.8627451, 1,
1.068668, -1.805476, 1.714288, 1, 0, 0.8588235, 1,
1.075853, -0.6208495, 2.657412, 1, 0, 0.8509804, 1,
1.076375, -1.531823, 2.279483, 1, 0, 0.8470588, 1,
1.078006, -0.7578412, 3.254863, 1, 0, 0.8392157, 1,
1.090829, -1.116533, 0.2111997, 1, 0, 0.8352941, 1,
1.093842, -0.09512818, 2.265965, 1, 0, 0.827451, 1,
1.09663, -0.8645675, 1.334449, 1, 0, 0.8235294, 1,
1.09961, -1.559534, 2.679234, 1, 0, 0.8156863, 1,
1.118746, 0.04550411, 1.000832, 1, 0, 0.8117647, 1,
1.127175, 1.083578, 0.6453874, 1, 0, 0.8039216, 1,
1.128237, -0.4998328, 3.6147, 1, 0, 0.7960784, 1,
1.143999, 0.3896136, 0.6726967, 1, 0, 0.7921569, 1,
1.144004, 0.2336299, 1.697166, 1, 0, 0.7843137, 1,
1.145228, 1.877858, 0.8178617, 1, 0, 0.7803922, 1,
1.147408, 0.1036095, 2.421238, 1, 0, 0.772549, 1,
1.147871, 0.8699225, 0.8639229, 1, 0, 0.7686275, 1,
1.150841, -0.3477333, 1.472863, 1, 0, 0.7607843, 1,
1.158253, 1.562065, -1.247061, 1, 0, 0.7568628, 1,
1.161808, 0.08404168, 1.345682, 1, 0, 0.7490196, 1,
1.165781, 0.7282453, 1.188355, 1, 0, 0.7450981, 1,
1.168005, -0.5128461, 0.9090614, 1, 0, 0.7372549, 1,
1.188162, -0.2073755, 1.41455, 1, 0, 0.7333333, 1,
1.192945, -0.4892901, 1.291317, 1, 0, 0.7254902, 1,
1.20144, -2.203454, 0.7635224, 1, 0, 0.7215686, 1,
1.207965, 1.151644, 0.5098504, 1, 0, 0.7137255, 1,
1.215536, 1.74776, 1.079005, 1, 0, 0.7098039, 1,
1.216171, -1.103202, 3.364023, 1, 0, 0.7019608, 1,
1.219714, 0.3695965, 2.828779, 1, 0, 0.6941177, 1,
1.224089, 1.994405, 0.3148874, 1, 0, 0.6901961, 1,
1.227052, -1.004928, 1.401655, 1, 0, 0.682353, 1,
1.232936, 1.644333, 1.434393, 1, 0, 0.6784314, 1,
1.255554, -0.03884317, 1.135763, 1, 0, 0.6705883, 1,
1.259558, 1.568655, 0.4139125, 1, 0, 0.6666667, 1,
1.263469, -0.5881636, 3.135458, 1, 0, 0.6588235, 1,
1.270828, -1.120488, 3.537819, 1, 0, 0.654902, 1,
1.271057, -0.592239, 2.487094, 1, 0, 0.6470588, 1,
1.279181, 1.384205, 1.146657, 1, 0, 0.6431373, 1,
1.282866, 0.405876, 3.262151, 1, 0, 0.6352941, 1,
1.283342, 0.704704, 2.015311, 1, 0, 0.6313726, 1,
1.292222, -0.08355393, 1.495718, 1, 0, 0.6235294, 1,
1.295944, 0.843273, 0.8922261, 1, 0, 0.6196079, 1,
1.305449, -1.537088, 0.3991579, 1, 0, 0.6117647, 1,
1.306946, -1.716131, 2.195937, 1, 0, 0.6078432, 1,
1.318965, 0.8780861, 0.3815844, 1, 0, 0.6, 1,
1.322017, -1.315069, 2.270574, 1, 0, 0.5921569, 1,
1.324974, 1.000694, 2.312523, 1, 0, 0.5882353, 1,
1.332059, -0.561287, 2.29132, 1, 0, 0.5803922, 1,
1.340061, -0.8445393, 3.902144, 1, 0, 0.5764706, 1,
1.344844, -0.258487, 2.385554, 1, 0, 0.5686275, 1,
1.345251, -2.44372, 4.234105, 1, 0, 0.5647059, 1,
1.357935, -0.02916065, 1.531968, 1, 0, 0.5568628, 1,
1.366535, 0.8449544, 0.7086009, 1, 0, 0.5529412, 1,
1.366752, 0.6099471, 2.490729, 1, 0, 0.5450981, 1,
1.368998, -0.3998969, 2.438998, 1, 0, 0.5411765, 1,
1.371226, 2.062969, 2.130775, 1, 0, 0.5333334, 1,
1.384359, 0.3283085, 3.113113, 1, 0, 0.5294118, 1,
1.418464, -1.436751, 3.52261, 1, 0, 0.5215687, 1,
1.418719, 1.048315, 0.1603781, 1, 0, 0.5176471, 1,
1.423381, 1.480533, 1.254598, 1, 0, 0.509804, 1,
1.442939, 1.145628, 0.3128435, 1, 0, 0.5058824, 1,
1.443777, -1.730506, 2.735639, 1, 0, 0.4980392, 1,
1.444945, 0.3311886, 2.347023, 1, 0, 0.4901961, 1,
1.446481, -0.6619341, 2.792939, 1, 0, 0.4862745, 1,
1.44816, 0.09120411, 1.542851, 1, 0, 0.4784314, 1,
1.450235, 0.7202441, 0.9991116, 1, 0, 0.4745098, 1,
1.453618, -0.6090123, 2.436247, 1, 0, 0.4666667, 1,
1.455424, 0.361822, 0.9427782, 1, 0, 0.4627451, 1,
1.473577, -2.083889, 3.928463, 1, 0, 0.454902, 1,
1.476126, 0.7651536, 0.6734943, 1, 0, 0.4509804, 1,
1.48053, 0.4686194, 1.063516, 1, 0, 0.4431373, 1,
1.480916, 1.255648, 1.242181, 1, 0, 0.4392157, 1,
1.486706, -0.242204, 3.579414, 1, 0, 0.4313726, 1,
1.488639, -0.2011911, 0.7520597, 1, 0, 0.427451, 1,
1.491734, 0.03331482, 1.701071, 1, 0, 0.4196078, 1,
1.49913, 0.07561857, 1.747897, 1, 0, 0.4156863, 1,
1.502545, -2.626703, 4.379004, 1, 0, 0.4078431, 1,
1.512411, 0.300453, 0.09465241, 1, 0, 0.4039216, 1,
1.521352, 0.4686074, 0.4698723, 1, 0, 0.3960784, 1,
1.527065, 0.2312254, 1.022178, 1, 0, 0.3882353, 1,
1.528007, -0.1185979, 2.225125, 1, 0, 0.3843137, 1,
1.542082, -0.5777966, 3.416968, 1, 0, 0.3764706, 1,
1.546738, 0.3908587, 1.550336, 1, 0, 0.372549, 1,
1.553801, 0.09115524, 1.130789, 1, 0, 0.3647059, 1,
1.559889, -0.8060481, 2.563069, 1, 0, 0.3607843, 1,
1.563677, 0.1285401, 2.978321, 1, 0, 0.3529412, 1,
1.566438, -0.2580785, 1.112783, 1, 0, 0.3490196, 1,
1.593861, 0.1400329, 1.221786, 1, 0, 0.3411765, 1,
1.596248, 1.133151, 3.442552, 1, 0, 0.3372549, 1,
1.602527, -1.594847, 1.756179, 1, 0, 0.3294118, 1,
1.609037, 0.03670148, 2.385088, 1, 0, 0.3254902, 1,
1.613986, 0.8016681, -0.664942, 1, 0, 0.3176471, 1,
1.635358, 0.5065074, 0.3471643, 1, 0, 0.3137255, 1,
1.639838, -0.4245367, 1.504328, 1, 0, 0.3058824, 1,
1.657135, 0.390199, 1.107976, 1, 0, 0.2980392, 1,
1.66616, -2.07342, 0.2693552, 1, 0, 0.2941177, 1,
1.691082, -0.07071378, 0.5744512, 1, 0, 0.2862745, 1,
1.699385, 1.726372, -0.6434752, 1, 0, 0.282353, 1,
1.699703, 1.012399, 3.533179, 1, 0, 0.2745098, 1,
1.702087, -0.4101709, 0.4678667, 1, 0, 0.2705882, 1,
1.719823, 1.743558, 1.761982, 1, 0, 0.2627451, 1,
1.724932, 0.567908, 0.156459, 1, 0, 0.2588235, 1,
1.737945, -0.3220143, 1.655114, 1, 0, 0.2509804, 1,
1.755256, -0.209252, 1.875222, 1, 0, 0.2470588, 1,
1.766323, -0.8576762, 2.061568, 1, 0, 0.2392157, 1,
1.766881, -0.3957767, 1.153583, 1, 0, 0.2352941, 1,
1.772512, 0.4563209, 1.990312, 1, 0, 0.227451, 1,
1.781356, 0.0470319, 1.830592, 1, 0, 0.2235294, 1,
1.793639, 0.905872, -1.121265, 1, 0, 0.2156863, 1,
1.79407, -1.27476, 2.234997, 1, 0, 0.2117647, 1,
1.801846, -1.214984, 2.596145, 1, 0, 0.2039216, 1,
1.804604, -0.6712972, 2.560406, 1, 0, 0.1960784, 1,
1.80779, 0.9036546, 1.187468, 1, 0, 0.1921569, 1,
1.808862, 0.8814062, 1.216992, 1, 0, 0.1843137, 1,
1.835462, -0.7182045, 3.470453, 1, 0, 0.1803922, 1,
1.845276, -0.2775329, 4.443515, 1, 0, 0.172549, 1,
1.852987, 0.5268389, 2.20861, 1, 0, 0.1686275, 1,
1.88198, -1.064022, 2.691395, 1, 0, 0.1607843, 1,
1.888888, -0.164655, 1.371325, 1, 0, 0.1568628, 1,
1.932824, 1.498977, 1.146566, 1, 0, 0.1490196, 1,
1.941033, -0.8902172, 0.8098767, 1, 0, 0.145098, 1,
1.941485, 0.6720333, 1.717806, 1, 0, 0.1372549, 1,
1.960326, 0.572601, 2.364036, 1, 0, 0.1333333, 1,
1.967203, 0.965178, 1.261673, 1, 0, 0.1254902, 1,
1.984296, -1.040866, 3.278115, 1, 0, 0.1215686, 1,
2.009269, -1.911092, 0.5996739, 1, 0, 0.1137255, 1,
2.014378, 1.22477, 1.600107, 1, 0, 0.1098039, 1,
2.026554, -0.7687989, 2.041955, 1, 0, 0.1019608, 1,
2.027189, -0.227705, 0.08876967, 1, 0, 0.09411765, 1,
2.063121, -0.04802116, 2.21254, 1, 0, 0.09019608, 1,
2.097546, 0.1503152, 1.902141, 1, 0, 0.08235294, 1,
2.12417, -1.829717, 3.104881, 1, 0, 0.07843138, 1,
2.15346, 0.8350836, 1.930177, 1, 0, 0.07058824, 1,
2.172531, -0.5046651, 2.562721, 1, 0, 0.06666667, 1,
2.184449, -1.009963, 2.621955, 1, 0, 0.05882353, 1,
2.316278, 0.1655253, 1.616314, 1, 0, 0.05490196, 1,
2.447719, 0.2192208, 0.8424911, 1, 0, 0.04705882, 1,
2.460137, -1.014563, 1.489995, 1, 0, 0.04313726, 1,
2.573508, -0.6325317, 1.097026, 1, 0, 0.03529412, 1,
2.730464, -2.134491, 1.392605, 1, 0, 0.03137255, 1,
2.755128, 1.038226, 0.7746474, 1, 0, 0.02352941, 1,
2.820047, -0.6048748, 2.131374, 1, 0, 0.01960784, 1,
2.959843, -0.5961305, 2.20541, 1, 0, 0.01176471, 1,
3.082937, -0.1012529, 1.497449, 1, 0, 0.007843138, 1
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
-0.1591753, -4.252738, -6.467737, 0, -0.5, 0.5, 0.5,
-0.1591753, -4.252738, -6.467737, 1, -0.5, 0.5, 0.5,
-0.1591753, -4.252738, -6.467737, 1, 1.5, 0.5, 0.5,
-0.1591753, -4.252738, -6.467737, 0, 1.5, 0.5, 0.5
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
-4.500364, 0.2181041, -6.467737, 0, -0.5, 0.5, 0.5,
-4.500364, 0.2181041, -6.467737, 1, -0.5, 0.5, 0.5,
-4.500364, 0.2181041, -6.467737, 1, 1.5, 0.5, 0.5,
-4.500364, 0.2181041, -6.467737, 0, 1.5, 0.5, 0.5
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
-4.500364, -4.252738, 0.3917007, 0, -0.5, 0.5, 0.5,
-4.500364, -4.252738, 0.3917007, 1, -0.5, 0.5, 0.5,
-4.500364, -4.252738, 0.3917007, 1, 1.5, 0.5, 0.5,
-4.500364, -4.252738, 0.3917007, 0, 1.5, 0.5, 0.5
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
-3, -3.221005, -4.88479,
3, -3.221005, -4.88479,
-3, -3.221005, -4.88479,
-3, -3.392961, -5.148614,
-2, -3.221005, -4.88479,
-2, -3.392961, -5.148614,
-1, -3.221005, -4.88479,
-1, -3.392961, -5.148614,
0, -3.221005, -4.88479,
0, -3.392961, -5.148614,
1, -3.221005, -4.88479,
1, -3.392961, -5.148614,
2, -3.221005, -4.88479,
2, -3.392961, -5.148614,
3, -3.221005, -4.88479,
3, -3.392961, -5.148614
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
-3, -3.736872, -5.676264, 0, -0.5, 0.5, 0.5,
-3, -3.736872, -5.676264, 1, -0.5, 0.5, 0.5,
-3, -3.736872, -5.676264, 1, 1.5, 0.5, 0.5,
-3, -3.736872, -5.676264, 0, 1.5, 0.5, 0.5,
-2, -3.736872, -5.676264, 0, -0.5, 0.5, 0.5,
-2, -3.736872, -5.676264, 1, -0.5, 0.5, 0.5,
-2, -3.736872, -5.676264, 1, 1.5, 0.5, 0.5,
-2, -3.736872, -5.676264, 0, 1.5, 0.5, 0.5,
-1, -3.736872, -5.676264, 0, -0.5, 0.5, 0.5,
-1, -3.736872, -5.676264, 1, -0.5, 0.5, 0.5,
-1, -3.736872, -5.676264, 1, 1.5, 0.5, 0.5,
-1, -3.736872, -5.676264, 0, 1.5, 0.5, 0.5,
0, -3.736872, -5.676264, 0, -0.5, 0.5, 0.5,
0, -3.736872, -5.676264, 1, -0.5, 0.5, 0.5,
0, -3.736872, -5.676264, 1, 1.5, 0.5, 0.5,
0, -3.736872, -5.676264, 0, 1.5, 0.5, 0.5,
1, -3.736872, -5.676264, 0, -0.5, 0.5, 0.5,
1, -3.736872, -5.676264, 1, -0.5, 0.5, 0.5,
1, -3.736872, -5.676264, 1, 1.5, 0.5, 0.5,
1, -3.736872, -5.676264, 0, 1.5, 0.5, 0.5,
2, -3.736872, -5.676264, 0, -0.5, 0.5, 0.5,
2, -3.736872, -5.676264, 1, -0.5, 0.5, 0.5,
2, -3.736872, -5.676264, 1, 1.5, 0.5, 0.5,
2, -3.736872, -5.676264, 0, 1.5, 0.5, 0.5,
3, -3.736872, -5.676264, 0, -0.5, 0.5, 0.5,
3, -3.736872, -5.676264, 1, -0.5, 0.5, 0.5,
3, -3.736872, -5.676264, 1, 1.5, 0.5, 0.5,
3, -3.736872, -5.676264, 0, 1.5, 0.5, 0.5
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
-3.498551, -3, -4.88479,
-3.498551, 3, -4.88479,
-3.498551, -3, -4.88479,
-3.66552, -3, -5.148614,
-3.498551, -2, -4.88479,
-3.66552, -2, -5.148614,
-3.498551, -1, -4.88479,
-3.66552, -1, -5.148614,
-3.498551, 0, -4.88479,
-3.66552, 0, -5.148614,
-3.498551, 1, -4.88479,
-3.66552, 1, -5.148614,
-3.498551, 2, -4.88479,
-3.66552, 2, -5.148614,
-3.498551, 3, -4.88479,
-3.66552, 3, -5.148614
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
-3.999458, -3, -5.676264, 0, -0.5, 0.5, 0.5,
-3.999458, -3, -5.676264, 1, -0.5, 0.5, 0.5,
-3.999458, -3, -5.676264, 1, 1.5, 0.5, 0.5,
-3.999458, -3, -5.676264, 0, 1.5, 0.5, 0.5,
-3.999458, -2, -5.676264, 0, -0.5, 0.5, 0.5,
-3.999458, -2, -5.676264, 1, -0.5, 0.5, 0.5,
-3.999458, -2, -5.676264, 1, 1.5, 0.5, 0.5,
-3.999458, -2, -5.676264, 0, 1.5, 0.5, 0.5,
-3.999458, -1, -5.676264, 0, -0.5, 0.5, 0.5,
-3.999458, -1, -5.676264, 1, -0.5, 0.5, 0.5,
-3.999458, -1, -5.676264, 1, 1.5, 0.5, 0.5,
-3.999458, -1, -5.676264, 0, 1.5, 0.5, 0.5,
-3.999458, 0, -5.676264, 0, -0.5, 0.5, 0.5,
-3.999458, 0, -5.676264, 1, -0.5, 0.5, 0.5,
-3.999458, 0, -5.676264, 1, 1.5, 0.5, 0.5,
-3.999458, 0, -5.676264, 0, 1.5, 0.5, 0.5,
-3.999458, 1, -5.676264, 0, -0.5, 0.5, 0.5,
-3.999458, 1, -5.676264, 1, -0.5, 0.5, 0.5,
-3.999458, 1, -5.676264, 1, 1.5, 0.5, 0.5,
-3.999458, 1, -5.676264, 0, 1.5, 0.5, 0.5,
-3.999458, 2, -5.676264, 0, -0.5, 0.5, 0.5,
-3.999458, 2, -5.676264, 1, -0.5, 0.5, 0.5,
-3.999458, 2, -5.676264, 1, 1.5, 0.5, 0.5,
-3.999458, 2, -5.676264, 0, 1.5, 0.5, 0.5,
-3.999458, 3, -5.676264, 0, -0.5, 0.5, 0.5,
-3.999458, 3, -5.676264, 1, -0.5, 0.5, 0.5,
-3.999458, 3, -5.676264, 1, 1.5, 0.5, 0.5,
-3.999458, 3, -5.676264, 0, 1.5, 0.5, 0.5
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
-3.498551, -3.221005, -4,
-3.498551, -3.221005, 4,
-3.498551, -3.221005, -4,
-3.66552, -3.392961, -4,
-3.498551, -3.221005, -2,
-3.66552, -3.392961, -2,
-3.498551, -3.221005, 0,
-3.66552, -3.392961, 0,
-3.498551, -3.221005, 2,
-3.66552, -3.392961, 2,
-3.498551, -3.221005, 4,
-3.66552, -3.392961, 4
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
-3.999458, -3.736872, -4, 0, -0.5, 0.5, 0.5,
-3.999458, -3.736872, -4, 1, -0.5, 0.5, 0.5,
-3.999458, -3.736872, -4, 1, 1.5, 0.5, 0.5,
-3.999458, -3.736872, -4, 0, 1.5, 0.5, 0.5,
-3.999458, -3.736872, -2, 0, -0.5, 0.5, 0.5,
-3.999458, -3.736872, -2, 1, -0.5, 0.5, 0.5,
-3.999458, -3.736872, -2, 1, 1.5, 0.5, 0.5,
-3.999458, -3.736872, -2, 0, 1.5, 0.5, 0.5,
-3.999458, -3.736872, 0, 0, -0.5, 0.5, 0.5,
-3.999458, -3.736872, 0, 1, -0.5, 0.5, 0.5,
-3.999458, -3.736872, 0, 1, 1.5, 0.5, 0.5,
-3.999458, -3.736872, 0, 0, 1.5, 0.5, 0.5,
-3.999458, -3.736872, 2, 0, -0.5, 0.5, 0.5,
-3.999458, -3.736872, 2, 1, -0.5, 0.5, 0.5,
-3.999458, -3.736872, 2, 1, 1.5, 0.5, 0.5,
-3.999458, -3.736872, 2, 0, 1.5, 0.5, 0.5,
-3.999458, -3.736872, 4, 0, -0.5, 0.5, 0.5,
-3.999458, -3.736872, 4, 1, -0.5, 0.5, 0.5,
-3.999458, -3.736872, 4, 1, 1.5, 0.5, 0.5,
-3.999458, -3.736872, 4, 0, 1.5, 0.5, 0.5
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
-3.498551, -3.221005, -4.88479,
-3.498551, 3.657213, -4.88479,
-3.498551, -3.221005, 5.668191,
-3.498551, 3.657213, 5.668191,
-3.498551, -3.221005, -4.88479,
-3.498551, -3.221005, 5.668191,
-3.498551, 3.657213, -4.88479,
-3.498551, 3.657213, 5.668191,
-3.498551, -3.221005, -4.88479,
3.180201, -3.221005, -4.88479,
-3.498551, -3.221005, 5.668191,
3.180201, -3.221005, 5.668191,
-3.498551, 3.657213, -4.88479,
3.180201, 3.657213, -4.88479,
-3.498551, 3.657213, 5.668191,
3.180201, 3.657213, 5.668191,
3.180201, -3.221005, -4.88479,
3.180201, 3.657213, -4.88479,
3.180201, -3.221005, 5.668191,
3.180201, 3.657213, 5.668191,
3.180201, -3.221005, -4.88479,
3.180201, -3.221005, 5.668191,
3.180201, 3.657213, -4.88479,
3.180201, 3.657213, 5.668191
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
var radius = 7.613317;
var distance = 33.87251;
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
mvMatrix.translate( 0.1591753, -0.2181041, -0.3917007 );
mvMatrix.scale( 1.232516, 1.196773, 0.7800324 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.87251);
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
diclomezine<-read.table("diclomezine.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-diclomezine$V2
```

```
## Error in eval(expr, envir, enclos): object 'diclomezine' not found
```

```r
y<-diclomezine$V3
```

```
## Error in eval(expr, envir, enclos): object 'diclomezine' not found
```

```r
z<-diclomezine$V4
```

```
## Error in eval(expr, envir, enclos): object 'diclomezine' not found
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
-3.401288, 0.8291739, 0.181263, 0, 0, 1, 1, 1,
-3.078206, -0.7718964, -2.310568, 1, 0, 0, 1, 1,
-2.531736, -1.172276, -2.138098, 1, 0, 0, 1, 1,
-2.436699, 0.6600912, -1.645333, 1, 0, 0, 1, 1,
-2.37851, 0.8171781, -1.853581, 1, 0, 0, 1, 1,
-2.331105, 2.070467, -1.008531, 1, 0, 0, 1, 1,
-2.299244, -0.8696321, -3.044446, 0, 0, 0, 1, 1,
-2.258897, -0.4490859, -0.754861, 0, 0, 0, 1, 1,
-2.243773, -1.110929, -3.216835, 0, 0, 0, 1, 1,
-2.235345, 0.686607, 0.2944404, 0, 0, 0, 1, 1,
-2.206187, 0.2076999, -2.79924, 0, 0, 0, 1, 1,
-2.117887, -0.9661285, -2.365336, 0, 0, 0, 1, 1,
-2.113865, 0.2559604, -1.427564, 0, 0, 0, 1, 1,
-2.063882, -0.1905973, -1.493091, 1, 1, 1, 1, 1,
-2.059467, -1.428721, -4.694978, 1, 1, 1, 1, 1,
-2.03764, 1.114655, -3.775975, 1, 1, 1, 1, 1,
-2.036067, 0.6468859, -0.446419, 1, 1, 1, 1, 1,
-2.030925, 0.4268329, -0.773622, 1, 1, 1, 1, 1,
-2.004472, -0.3120974, 0.7804261, 1, 1, 1, 1, 1,
-1.990203, -0.4314918, -2.679542, 1, 1, 1, 1, 1,
-1.987898, -2.446701, -2.001764, 1, 1, 1, 1, 1,
-1.978999, -0.8398687, -0.9597709, 1, 1, 1, 1, 1,
-1.978426, 0.290013, -2.572788, 1, 1, 1, 1, 1,
-1.96673, -0.1707127, -0.7105511, 1, 1, 1, 1, 1,
-1.931408, 0.7131352, -0.9358749, 1, 1, 1, 1, 1,
-1.927023, -0.5754721, -1.650468, 1, 1, 1, 1, 1,
-1.92489, 0.3663175, -0.3720633, 1, 1, 1, 1, 1,
-1.910276, 0.4175297, -1.33258, 1, 1, 1, 1, 1,
-1.9069, 2.387535, -1.115393, 0, 0, 1, 1, 1,
-1.899025, -0.3028364, -1.874938, 1, 0, 0, 1, 1,
-1.865818, 1.376955, -0.5992545, 1, 0, 0, 1, 1,
-1.864863, -0.5986807, -0.7111768, 1, 0, 0, 1, 1,
-1.857989, -0.210517, -1.345326, 1, 0, 0, 1, 1,
-1.844133, -1.578586, -2.093906, 1, 0, 0, 1, 1,
-1.794407, -0.1782361, -1.063719, 0, 0, 0, 1, 1,
-1.787494, -0.537563, -1.007238, 0, 0, 0, 1, 1,
-1.782998, -0.1192154, -1.155211, 0, 0, 0, 1, 1,
-1.765389, 0.4136995, 0.4149629, 0, 0, 0, 1, 1,
-1.761726, -0.2311824, -2.088131, 0, 0, 0, 1, 1,
-1.755788, 0.2434525, -2.107086, 0, 0, 0, 1, 1,
-1.74798, -0.7938609, -4.593548, 0, 0, 0, 1, 1,
-1.743378, 0.2769827, -1.439425, 1, 1, 1, 1, 1,
-1.713572, -0.4044974, -1.353112, 1, 1, 1, 1, 1,
-1.71209, -1.933987, -4.261534, 1, 1, 1, 1, 1,
-1.701272, -0.3413702, -2.52983, 1, 1, 1, 1, 1,
-1.69564, 1.007132, -0.06108293, 1, 1, 1, 1, 1,
-1.692795, -0.8706732, -2.901532, 1, 1, 1, 1, 1,
-1.692237, 1.441625, -1.414459, 1, 1, 1, 1, 1,
-1.673343, 2.091162, -0.2003954, 1, 1, 1, 1, 1,
-1.666361, 1.146749, -0.7974564, 1, 1, 1, 1, 1,
-1.66209, -0.1239692, -0.8454098, 1, 1, 1, 1, 1,
-1.636732, -1.361012, -2.520434, 1, 1, 1, 1, 1,
-1.631678, 0.6599133, -0.2717813, 1, 1, 1, 1, 1,
-1.626524, -0.03451879, -2.193517, 1, 1, 1, 1, 1,
-1.621001, 0.2725274, -1.825892, 1, 1, 1, 1, 1,
-1.6193, 0.519699, -1.457406, 1, 1, 1, 1, 1,
-1.607929, 0.5759503, -2.311098, 0, 0, 1, 1, 1,
-1.600152, 0.3067897, -1.442558, 1, 0, 0, 1, 1,
-1.598409, 0.5815516, -2.889545, 1, 0, 0, 1, 1,
-1.592267, 0.8376144, -1.428704, 1, 0, 0, 1, 1,
-1.589239, -0.7954087, -1.83277, 1, 0, 0, 1, 1,
-1.57466, -0.1729029, -2.676337, 1, 0, 0, 1, 1,
-1.573224, -1.838877, -4.140378, 0, 0, 0, 1, 1,
-1.57066, 0.958042, -0.8472803, 0, 0, 0, 1, 1,
-1.551087, -0.6046379, -2.424806, 0, 0, 0, 1, 1,
-1.54039, -1.940494, -1.837455, 0, 0, 0, 1, 1,
-1.540195, 0.4562198, -1.049391, 0, 0, 0, 1, 1,
-1.537545, -0.9987734, -0.7696068, 0, 0, 0, 1, 1,
-1.532212, -0.9619756, -2.365005, 0, 0, 0, 1, 1,
-1.518312, 0.2848709, -3.362456, 1, 1, 1, 1, 1,
-1.511803, 0.3687339, -0.7324839, 1, 1, 1, 1, 1,
-1.499341, 0.4121016, -2.632165, 1, 1, 1, 1, 1,
-1.485893, 1.662236, 0.06329829, 1, 1, 1, 1, 1,
-1.48132, 2.344488, -1.606144, 1, 1, 1, 1, 1,
-1.466516, -0.3539436, -2.361655, 1, 1, 1, 1, 1,
-1.457709, 1.65405, -0.6839696, 1, 1, 1, 1, 1,
-1.457636, -0.5729686, -1.120628, 1, 1, 1, 1, 1,
-1.447949, -0.1835753, -1.590205, 1, 1, 1, 1, 1,
-1.442628, -0.04910477, -2.583507, 1, 1, 1, 1, 1,
-1.438936, 0.1135521, -2.286569, 1, 1, 1, 1, 1,
-1.421575, -0.4112791, -2.078318, 1, 1, 1, 1, 1,
-1.418757, 1.890961, -0.7173823, 1, 1, 1, 1, 1,
-1.415268, -0.4812931, -0.3686713, 1, 1, 1, 1, 1,
-1.414037, -2.37968, -2.49138, 1, 1, 1, 1, 1,
-1.407385, 3.557045, 0.01449833, 0, 0, 1, 1, 1,
-1.403801, 2.096304, -0.05987826, 1, 0, 0, 1, 1,
-1.402922, 1.17504, -0.7782037, 1, 0, 0, 1, 1,
-1.396789, 0.4606073, 0.205553, 1, 0, 0, 1, 1,
-1.38946, 0.1516936, -1.160663, 1, 0, 0, 1, 1,
-1.385263, 1.195725, -1.496756, 1, 0, 0, 1, 1,
-1.376862, 2.113847, -0.7739376, 0, 0, 0, 1, 1,
-1.365782, 0.3169593, -2.510109, 0, 0, 0, 1, 1,
-1.360996, -1.261921, -3.507329, 0, 0, 0, 1, 1,
-1.353344, 0.8160999, -0.484861, 0, 0, 0, 1, 1,
-1.321477, -0.6045254, -2.745927, 0, 0, 0, 1, 1,
-1.311543, -0.4400538, -1.864736, 0, 0, 0, 1, 1,
-1.305096, 1.520178, -0.1978641, 0, 0, 0, 1, 1,
-1.305056, -0.5259429, -1.062735, 1, 1, 1, 1, 1,
-1.300304, 2.154556, -0.9552831, 1, 1, 1, 1, 1,
-1.298564, 1.770332, -0.6289012, 1, 1, 1, 1, 1,
-1.298476, 1.806869, 0.7021955, 1, 1, 1, 1, 1,
-1.298247, 0.6405526, 0.2835211, 1, 1, 1, 1, 1,
-1.291912, -0.2739259, -1.655411, 1, 1, 1, 1, 1,
-1.286643, -0.9446244, -0.7125155, 1, 1, 1, 1, 1,
-1.284802, -0.07662302, -1.124384, 1, 1, 1, 1, 1,
-1.269071, 0.7214463, -0.6278421, 1, 1, 1, 1, 1,
-1.265969, 0.04241264, -0.3569206, 1, 1, 1, 1, 1,
-1.257084, 0.9434115, -2.702477, 1, 1, 1, 1, 1,
-1.256914, -0.3678586, -1.483661, 1, 1, 1, 1, 1,
-1.240793, -0.8633277, -1.931223, 1, 1, 1, 1, 1,
-1.237112, 0.8503788, -1.849195, 1, 1, 1, 1, 1,
-1.236134, -0.1096417, -3.728085, 1, 1, 1, 1, 1,
-1.233449, 1.103738, 0.1652267, 0, 0, 1, 1, 1,
-1.232758, 0.6390815, -1.772688, 1, 0, 0, 1, 1,
-1.229765, -0.1329865, -1.96046, 1, 0, 0, 1, 1,
-1.228572, 1.39545, 0.0891467, 1, 0, 0, 1, 1,
-1.226904, -1.109074, -3.68258, 1, 0, 0, 1, 1,
-1.221269, 0.3763998, -1.014223, 1, 0, 0, 1, 1,
-1.213553, 0.7174125, -3.787657, 0, 0, 0, 1, 1,
-1.210332, 0.2993936, -1.96898, 0, 0, 0, 1, 1,
-1.206627, -0.4811551, -3.130437, 0, 0, 0, 1, 1,
-1.205183, -0.3115803, -1.859381, 0, 0, 0, 1, 1,
-1.201924, 0.1918903, -4.188468, 0, 0, 0, 1, 1,
-1.19513, -0.234744, -2.793698, 0, 0, 0, 1, 1,
-1.185305, 0.2427478, -1.904156, 0, 0, 0, 1, 1,
-1.183912, -0.6654333, -3.418198, 1, 1, 1, 1, 1,
-1.181942, 0.0983028, -1.796408, 1, 1, 1, 1, 1,
-1.18129, 0.9870509, -1.678772, 1, 1, 1, 1, 1,
-1.167097, -1.159817, -2.254795, 1, 1, 1, 1, 1,
-1.166019, -0.487536, -3.95011, 1, 1, 1, 1, 1,
-1.164157, -0.9968362, -2.949433, 1, 1, 1, 1, 1,
-1.153062, -1.878615, -2.101413, 1, 1, 1, 1, 1,
-1.146588, -1.803205, -1.421062, 1, 1, 1, 1, 1,
-1.133175, 0.8010738, 1.437043, 1, 1, 1, 1, 1,
-1.131149, 0.5414572, -2.554095, 1, 1, 1, 1, 1,
-1.128413, -1.071179, -1.025714, 1, 1, 1, 1, 1,
-1.122387, -0.2192275, -1.531442, 1, 1, 1, 1, 1,
-1.114643, 0.3234309, -2.244214, 1, 1, 1, 1, 1,
-1.113479, -0.6329932, -0.3870346, 1, 1, 1, 1, 1,
-1.104268, 0.5579725, -2.416202, 1, 1, 1, 1, 1,
-1.101045, 1.085946, 0.1520673, 0, 0, 1, 1, 1,
-1.099569, 1.942959, -0.7300555, 1, 0, 0, 1, 1,
-1.096508, -1.451761, -1.20165, 1, 0, 0, 1, 1,
-1.094602, 1.136187, 0.6569204, 1, 0, 0, 1, 1,
-1.094204, -0.6949165, -3.233543, 1, 0, 0, 1, 1,
-1.084278, 0.730719, 0.1941715, 1, 0, 0, 1, 1,
-1.08403, 0.2319519, -1.887613, 0, 0, 0, 1, 1,
-1.081682, -0.1434867, -2.048449, 0, 0, 0, 1, 1,
-1.080166, -2.190532, -2.995736, 0, 0, 0, 1, 1,
-1.078735, -0.02745726, -1.2547, 0, 0, 0, 1, 1,
-1.073758, 0.3434297, -2.05402, 0, 0, 0, 1, 1,
-1.070017, -1.427002, -2.712102, 0, 0, 0, 1, 1,
-1.064358, -0.7969749, -3.252208, 0, 0, 0, 1, 1,
-1.059279, -0.03308793, -1.357312, 1, 1, 1, 1, 1,
-1.051914, 0.1980746, -1.303872, 1, 1, 1, 1, 1,
-1.051445, 1.386812, -1.061133, 1, 1, 1, 1, 1,
-1.04622, -0.8250529, -2.058977, 1, 1, 1, 1, 1,
-1.044147, 0.6492567, -0.7692598, 1, 1, 1, 1, 1,
-1.039528, 0.4199297, -1.941528, 1, 1, 1, 1, 1,
-1.038143, 0.2766909, -0.5657178, 1, 1, 1, 1, 1,
-1.033894, 0.07853387, -0.9613357, 1, 1, 1, 1, 1,
-1.033754, 0.6047309, 0.06680593, 1, 1, 1, 1, 1,
-1.033579, 0.3108422, -1.899658, 1, 1, 1, 1, 1,
-1.03068, 0.685509, -0.5875952, 1, 1, 1, 1, 1,
-1.029707, -0.4924591, -1.545889, 1, 1, 1, 1, 1,
-1.028376, -0.3062327, -1.571936, 1, 1, 1, 1, 1,
-1.019514, 0.427794, -0.2005402, 1, 1, 1, 1, 1,
-1.018051, 0.3751951, -3.347823, 1, 1, 1, 1, 1,
-1.016146, 1.345704, -0.2104991, 0, 0, 1, 1, 1,
-1.009144, 0.8353837, -0.9296865, 1, 0, 0, 1, 1,
-1.003842, -1.116271, -3.065362, 1, 0, 0, 1, 1,
-0.9977267, -0.2962838, -0.1492235, 1, 0, 0, 1, 1,
-0.9957862, 0.514354, -0.5236448, 1, 0, 0, 1, 1,
-0.9940234, 0.8212042, -0.7639883, 1, 0, 0, 1, 1,
-0.9926402, -0.8014438, -2.251044, 0, 0, 0, 1, 1,
-0.9923511, 0.06729693, -0.629476, 0, 0, 0, 1, 1,
-0.9891976, -0.01041128, -0.9019476, 0, 0, 0, 1, 1,
-0.9829999, -1.740479, -3.73315, 0, 0, 0, 1, 1,
-0.9775702, 0.4556339, -0.4700313, 0, 0, 0, 1, 1,
-0.9681354, -0.8407052, -0.1220798, 0, 0, 0, 1, 1,
-0.9671055, -0.5105474, -2.295988, 0, 0, 0, 1, 1,
-0.9654357, -0.8720265, -2.885484, 1, 1, 1, 1, 1,
-0.9564138, -0.001182691, -1.987311, 1, 1, 1, 1, 1,
-0.9505561, 1.456052, -1.611949, 1, 1, 1, 1, 1,
-0.9497198, 1.840781, 0.0629328, 1, 1, 1, 1, 1,
-0.9483497, 0.3807544, -1.444406, 1, 1, 1, 1, 1,
-0.9461935, 0.7970246, -1.540436, 1, 1, 1, 1, 1,
-0.9450725, 0.4476341, -1.964593, 1, 1, 1, 1, 1,
-0.9395646, 0.9780483, -1.183916, 1, 1, 1, 1, 1,
-0.9357938, 0.02249303, -3.071139, 1, 1, 1, 1, 1,
-0.9250772, 0.8143267, -0.2490335, 1, 1, 1, 1, 1,
-0.9130149, -0.1651202, -1.234468, 1, 1, 1, 1, 1,
-0.9065073, 0.3314885, -0.4525508, 1, 1, 1, 1, 1,
-0.9038337, 0.8086243, -0.2877419, 1, 1, 1, 1, 1,
-0.9004872, 0.08230739, -2.852733, 1, 1, 1, 1, 1,
-0.8999385, -0.2186172, -1.599138, 1, 1, 1, 1, 1,
-0.8978701, 0.06600413, -2.330891, 0, 0, 1, 1, 1,
-0.8947085, 0.3954981, -0.5286005, 1, 0, 0, 1, 1,
-0.8936875, 1.843286, -0.6786294, 1, 0, 0, 1, 1,
-0.8932372, 0.7085658, -0.009562994, 1, 0, 0, 1, 1,
-0.8923196, 0.5704648, -1.687174, 1, 0, 0, 1, 1,
-0.8913239, -1.640722, -2.740421, 1, 0, 0, 1, 1,
-0.8912647, 0.872673, -2.450409, 0, 0, 0, 1, 1,
-0.8871396, -0.213116, -4.048616, 0, 0, 0, 1, 1,
-0.8867931, -1.063065, -4.267873, 0, 0, 0, 1, 1,
-0.8859328, 0.003287607, -1.478583, 0, 0, 0, 1, 1,
-0.8834441, -1.334527, -1.882697, 0, 0, 0, 1, 1,
-0.8747191, 1.347023, -1.089078, 0, 0, 0, 1, 1,
-0.873174, -1.147539, 0.04166784, 0, 0, 0, 1, 1,
-0.8621357, 0.06174735, -1.13287, 1, 1, 1, 1, 1,
-0.8617541, 0.1093211, -0.9141724, 1, 1, 1, 1, 1,
-0.8579148, 0.6157947, -0.9809958, 1, 1, 1, 1, 1,
-0.8533232, -0.8445557, -1.492114, 1, 1, 1, 1, 1,
-0.8489619, 0.3407914, -2.922425, 1, 1, 1, 1, 1,
-0.8443101, 1.001801, 0.0649709, 1, 1, 1, 1, 1,
-0.8431738, 1.123802, -1.869474, 1, 1, 1, 1, 1,
-0.8406261, -1.070539, -4.107163, 1, 1, 1, 1, 1,
-0.8396441, 0.02437517, -2.15601, 1, 1, 1, 1, 1,
-0.8346555, 0.8217607, -2.04459, 1, 1, 1, 1, 1,
-0.8310815, 0.4275931, -1.302416, 1, 1, 1, 1, 1,
-0.8294144, 0.401909, -1.202487, 1, 1, 1, 1, 1,
-0.8287439, -1.865647, -3.362302, 1, 1, 1, 1, 1,
-0.8185619, -1.176035, -2.456583, 1, 1, 1, 1, 1,
-0.8148356, 0.7602349, -0.4038542, 1, 1, 1, 1, 1,
-0.8024899, 1.330546, -0.7011948, 0, 0, 1, 1, 1,
-0.8003713, -1.265849, -4.0993, 1, 0, 0, 1, 1,
-0.7977945, 0.4744233, -1.337656, 1, 0, 0, 1, 1,
-0.7938441, -0.8860618, -4.15302, 1, 0, 0, 1, 1,
-0.7925878, 0.5937173, -1.010389, 1, 0, 0, 1, 1,
-0.7911746, 0.2623863, -1.844022, 1, 0, 0, 1, 1,
-0.7862935, 0.07145412, -0.6889241, 0, 0, 0, 1, 1,
-0.7858851, -1.265036, -2.820834, 0, 0, 0, 1, 1,
-0.7792276, -0.7744922, -1.069236, 0, 0, 0, 1, 1,
-0.77472, 0.7392293, -0.008215771, 0, 0, 0, 1, 1,
-0.774629, 0.547522, -0.5979929, 0, 0, 0, 1, 1,
-0.7724678, -0.01408547, -2.141559, 0, 0, 0, 1, 1,
-0.7692339, -1.617513, -1.306672, 0, 0, 0, 1, 1,
-0.7623413, 2.001359, -0.08773741, 1, 1, 1, 1, 1,
-0.7607042, -0.9820843, -0.9152455, 1, 1, 1, 1, 1,
-0.760082, -0.4764617, -2.082866, 1, 1, 1, 1, 1,
-0.7587157, 0.7106253, -0.495286, 1, 1, 1, 1, 1,
-0.7559803, 2.335013, 1.466926, 1, 1, 1, 1, 1,
-0.7555131, 0.7600511, -1.276271, 1, 1, 1, 1, 1,
-0.7516447, -1.032419, -0.7240868, 1, 1, 1, 1, 1,
-0.7476026, 0.9282226, -0.06154517, 1, 1, 1, 1, 1,
-0.7461409, -1.28654, -2.512868, 1, 1, 1, 1, 1,
-0.7461391, -0.2550495, -1.744098, 1, 1, 1, 1, 1,
-0.7418198, 0.3950343, -1.049665, 1, 1, 1, 1, 1,
-0.7364098, -0.0434119, -2.362222, 1, 1, 1, 1, 1,
-0.7349304, -0.4729525, -2.545773, 1, 1, 1, 1, 1,
-0.734771, 0.3299392, 0.4773145, 1, 1, 1, 1, 1,
-0.7292937, -1.440205, -4.07673, 1, 1, 1, 1, 1,
-0.7272953, -1.652284, -2.670991, 0, 0, 1, 1, 1,
-0.726067, 0.6142147, -2.401322, 1, 0, 0, 1, 1,
-0.7253465, 0.8007399, -1.059786, 1, 0, 0, 1, 1,
-0.7200591, 0.5082441, -0.3258854, 1, 0, 0, 1, 1,
-0.7194437, 0.4849842, -0.8870976, 1, 0, 0, 1, 1,
-0.7143983, 2.98747, 1.05256, 1, 0, 0, 1, 1,
-0.7120916, 0.2137165, -2.07142, 0, 0, 0, 1, 1,
-0.7111611, 0.913794, -0.337081, 0, 0, 0, 1, 1,
-0.7018698, 0.693582, -0.00695587, 0, 0, 0, 1, 1,
-0.6933488, 1.667631, -1.726146, 0, 0, 0, 1, 1,
-0.6926935, -0.5028135, -2.844239, 0, 0, 0, 1, 1,
-0.6921619, 0.8860757, 0.07281382, 0, 0, 0, 1, 1,
-0.6916191, -0.8170763, -2.173174, 0, 0, 0, 1, 1,
-0.6873447, -0.8752785, -2.72211, 1, 1, 1, 1, 1,
-0.687095, -0.6120442, -2.35843, 1, 1, 1, 1, 1,
-0.686626, -0.8434958, -0.6180882, 1, 1, 1, 1, 1,
-0.6814689, 1.048911, 1.389266, 1, 1, 1, 1, 1,
-0.6798761, 0.6374066, -0.2477509, 1, 1, 1, 1, 1,
-0.6791914, 0.2519517, -1.333855, 1, 1, 1, 1, 1,
-0.6766835, 0.3877213, -1.874559, 1, 1, 1, 1, 1,
-0.6726484, -1.16491, -0.8575059, 1, 1, 1, 1, 1,
-0.6725478, 1.632649, 0.7226032, 1, 1, 1, 1, 1,
-0.6724765, 0.2885018, 0.7566267, 1, 1, 1, 1, 1,
-0.6714623, -0.03329238, -2.10506, 1, 1, 1, 1, 1,
-0.6702193, 1.563052, -0.3252641, 1, 1, 1, 1, 1,
-0.6685658, -0.04319752, -2.262609, 1, 1, 1, 1, 1,
-0.6633782, 0.3339384, -0.4896421, 1, 1, 1, 1, 1,
-0.6550995, 0.3554378, -2.514044, 1, 1, 1, 1, 1,
-0.6501397, 0.5987323, -0.8398184, 0, 0, 1, 1, 1,
-0.645366, -1.171617, -1.540406, 1, 0, 0, 1, 1,
-0.6434422, -0.6044585, -1.639181, 1, 0, 0, 1, 1,
-0.6428487, 0.07149833, -0.8464231, 1, 0, 0, 1, 1,
-0.640708, 0.8163164, 0.2109614, 1, 0, 0, 1, 1,
-0.6406224, -0.1219536, -2.022381, 1, 0, 0, 1, 1,
-0.6352403, -1.63931, -3.044919, 0, 0, 0, 1, 1,
-0.6349262, 0.7015564, -0.2213549, 0, 0, 0, 1, 1,
-0.6265073, 0.9305345, -0.3144998, 0, 0, 0, 1, 1,
-0.6235624, 1.724404, -1.200858, 0, 0, 0, 1, 1,
-0.6211677, 0.1545004, -0.7901518, 0, 0, 0, 1, 1,
-0.6209278, -1.125236, -2.510922, 0, 0, 0, 1, 1,
-0.6172825, -1.549983, -1.333359, 0, 0, 0, 1, 1,
-0.6158832, 0.3730142, 0.49939, 1, 1, 1, 1, 1,
-0.6130231, -0.6282254, -1.588821, 1, 1, 1, 1, 1,
-0.6112425, -0.9434964, -1.393116, 1, 1, 1, 1, 1,
-0.600455, -0.4320244, -3.530787, 1, 1, 1, 1, 1,
-0.5937486, -0.01268645, -1.002322, 1, 1, 1, 1, 1,
-0.5914757, 0.3384807, -0.946812, 1, 1, 1, 1, 1,
-0.5892571, 0.04327822, 0.6540474, 1, 1, 1, 1, 1,
-0.5870265, -0.2765639, -1.583581, 1, 1, 1, 1, 1,
-0.5858043, 0.05741934, -1.899637, 1, 1, 1, 1, 1,
-0.5857509, 0.7951301, 2.035359, 1, 1, 1, 1, 1,
-0.5846389, -2.403783, -2.298804, 1, 1, 1, 1, 1,
-0.5836995, 0.4000999, -1.014357, 1, 1, 1, 1, 1,
-0.5820985, -1.878731, -4.276701, 1, 1, 1, 1, 1,
-0.5766098, -0.9343876, 0.6426554, 1, 1, 1, 1, 1,
-0.5757476, -0.3272068, -2.406074, 1, 1, 1, 1, 1,
-0.5731748, -1.720448, -2.475561, 0, 0, 1, 1, 1,
-0.5662318, 0.4692387, 0.3554161, 1, 0, 0, 1, 1,
-0.565323, -1.305069, -1.50154, 1, 0, 0, 1, 1,
-0.5607741, -1.599856, -2.664291, 1, 0, 0, 1, 1,
-0.5594969, -1.004332, -1.949738, 1, 0, 0, 1, 1,
-0.5561114, -0.9683067, -4.025675, 1, 0, 0, 1, 1,
-0.5555512, 1.629673, -0.8973606, 0, 0, 0, 1, 1,
-0.5424083, -0.2188019, -0.9784685, 0, 0, 0, 1, 1,
-0.5353732, -0.7031999, -3.004251, 0, 0, 0, 1, 1,
-0.5329518, 1.027065, -0.9018364, 0, 0, 0, 1, 1,
-0.5316833, 0.5665284, -1.644907, 0, 0, 0, 1, 1,
-0.5314411, 0.218449, -2.561198, 0, 0, 0, 1, 1,
-0.5256557, 0.6161579, -1.286256, 0, 0, 0, 1, 1,
-0.5244651, 0.9587131, -0.7389174, 1, 1, 1, 1, 1,
-0.5210159, -1.306608, -3.712436, 1, 1, 1, 1, 1,
-0.5185586, 0.1054388, -1.964435, 1, 1, 1, 1, 1,
-0.5171366, 1.636321, 0.3805332, 1, 1, 1, 1, 1,
-0.515281, -0.7513785, -2.908838, 1, 1, 1, 1, 1,
-0.5131811, 1.212606, 0.2963206, 1, 1, 1, 1, 1,
-0.4972874, -0.9794394, -2.005987, 1, 1, 1, 1, 1,
-0.4948583, 1.062931, 0.3447057, 1, 1, 1, 1, 1,
-0.4938764, -0.03256422, -1.277354, 1, 1, 1, 1, 1,
-0.4779466, 1.109404, -2.524741, 1, 1, 1, 1, 1,
-0.4731057, 0.2403289, -2.038626, 1, 1, 1, 1, 1,
-0.4722994, -2.312807, -4.718783, 1, 1, 1, 1, 1,
-0.4692313, 0.2806672, -1.712326, 1, 1, 1, 1, 1,
-0.4598314, 0.1945371, -0.3450217, 1, 1, 1, 1, 1,
-0.4596694, 1.247736, -0.7890578, 1, 1, 1, 1, 1,
-0.4586984, -0.8261868, -2.857333, 0, 0, 1, 1, 1,
-0.4585006, -1.847013, -0.7644286, 1, 0, 0, 1, 1,
-0.4484614, -0.3492637, -2.09437, 1, 0, 0, 1, 1,
-0.4484521, 1.646434, -1.285759, 1, 0, 0, 1, 1,
-0.448386, 0.3657979, -2.813264, 1, 0, 0, 1, 1,
-0.4461315, 1.728644, 0.2991413, 1, 0, 0, 1, 1,
-0.4456146, -0.5817252, -0.3732084, 0, 0, 0, 1, 1,
-0.4423609, 0.04069461, -0.7073286, 0, 0, 0, 1, 1,
-0.4397513, -1.068652, -2.878247, 0, 0, 0, 1, 1,
-0.4375947, 0.9436967, -0.423603, 0, 0, 0, 1, 1,
-0.4354042, 0.5240936, 0.168985, 0, 0, 0, 1, 1,
-0.434971, 0.6701717, -0.08338229, 0, 0, 0, 1, 1,
-0.4313282, -0.2061554, -2.745556, 0, 0, 0, 1, 1,
-0.4312571, 0.1664888, -1.312629, 1, 1, 1, 1, 1,
-0.4310619, 0.4798404, -0.599298, 1, 1, 1, 1, 1,
-0.4259358, 1.218104, 0.3775108, 1, 1, 1, 1, 1,
-0.4259242, -0.3518867, -1.052581, 1, 1, 1, 1, 1,
-0.4254991, 1.837091, -1.325444, 1, 1, 1, 1, 1,
-0.421232, -0.630716, -4.200192, 1, 1, 1, 1, 1,
-0.4182391, 0.000256839, -1.710037, 1, 1, 1, 1, 1,
-0.4154933, -0.943518, -2.707087, 1, 1, 1, 1, 1,
-0.4149332, 0.06448369, -1.603444, 1, 1, 1, 1, 1,
-0.4043227, -0.03449805, -1.788971, 1, 1, 1, 1, 1,
-0.4040971, 1.078498, -0.7774293, 1, 1, 1, 1, 1,
-0.3870568, -0.2339799, -1.068398, 1, 1, 1, 1, 1,
-0.3852998, 1.543522, 0.4814597, 1, 1, 1, 1, 1,
-0.3846541, -0.8518575, -3.01284, 1, 1, 1, 1, 1,
-0.3818659, -0.2327804, 0.2777699, 1, 1, 1, 1, 1,
-0.3736467, -1.177158, -2.880306, 0, 0, 1, 1, 1,
-0.3735357, -0.4123626, -4.098904, 1, 0, 0, 1, 1,
-0.371891, -0.6075805, -3.746783, 1, 0, 0, 1, 1,
-0.3718227, -2.102222, -1.09562, 1, 0, 0, 1, 1,
-0.365568, -1.311246, -1.281576, 1, 0, 0, 1, 1,
-0.3645521, 0.0772596, -1.562122, 1, 0, 0, 1, 1,
-0.3610542, 1.942669, -1.649837, 0, 0, 0, 1, 1,
-0.3608705, 0.2178828, -1.173244, 0, 0, 0, 1, 1,
-0.3558663, -1.622813, -2.646874, 0, 0, 0, 1, 1,
-0.3499369, -0.4822716, -2.305695, 0, 0, 0, 1, 1,
-0.349129, 0.7242117, -1.026676, 0, 0, 0, 1, 1,
-0.3473086, 0.07782178, -2.768446, 0, 0, 0, 1, 1,
-0.3443515, 0.1677954, -2.169647, 0, 0, 0, 1, 1,
-0.3361716, 0.9785644, 0.02196182, 1, 1, 1, 1, 1,
-0.3348399, 0.8386353, -0.6992228, 1, 1, 1, 1, 1,
-0.3347016, -0.3218594, -1.87529, 1, 1, 1, 1, 1,
-0.3292923, -0.3394072, -2.340078, 1, 1, 1, 1, 1,
-0.3278933, -0.8157036, -4.070551, 1, 1, 1, 1, 1,
-0.3220942, 1.224585, -0.4546587, 1, 1, 1, 1, 1,
-0.3207144, 0.6031607, -0.1844535, 1, 1, 1, 1, 1,
-0.3189678, 0.4948485, -0.6128869, 1, 1, 1, 1, 1,
-0.3155461, -1.132185, -3.936708, 1, 1, 1, 1, 1,
-0.3148411, 0.07426176, -1.499525, 1, 1, 1, 1, 1,
-0.3132096, 0.8940865, 0.626109, 1, 1, 1, 1, 1,
-0.3024364, 0.6056227, -1.355904, 1, 1, 1, 1, 1,
-0.2989083, 0.7964541, -0.08178368, 1, 1, 1, 1, 1,
-0.2981822, 0.8623347, -0.9249118, 1, 1, 1, 1, 1,
-0.295949, 0.3372785, 2.225973, 1, 1, 1, 1, 1,
-0.2955285, 0.4913741, 0.08139846, 0, 0, 1, 1, 1,
-0.2943717, 0.3816828, 0.1517103, 1, 0, 0, 1, 1,
-0.2920582, -0.329327, -0.7078591, 1, 0, 0, 1, 1,
-0.289182, 0.9310912, 0.08625833, 1, 0, 0, 1, 1,
-0.2853473, -0.1565949, -1.999334, 1, 0, 0, 1, 1,
-0.2842526, -0.217297, -0.8627084, 1, 0, 0, 1, 1,
-0.2823067, -0.1864075, -1.951424, 0, 0, 0, 1, 1,
-0.2802044, -0.3742061, -0.6823506, 0, 0, 0, 1, 1,
-0.2749601, 0.9763792, 0.1647077, 0, 0, 0, 1, 1,
-0.2687155, 1.003525, 0.5737312, 0, 0, 0, 1, 1,
-0.266301, -0.6116331, -3.445551, 0, 0, 0, 1, 1,
-0.2661596, 0.02911799, -1.797168, 0, 0, 0, 1, 1,
-0.265459, -0.2451838, -1.832676, 0, 0, 0, 1, 1,
-0.2507418, 1.670716, -2.031378, 1, 1, 1, 1, 1,
-0.2492213, -1.270627, -4.731106, 1, 1, 1, 1, 1,
-0.2483671, 0.4091966, -2.197271, 1, 1, 1, 1, 1,
-0.2481263, -1.677025, -1.565388, 1, 1, 1, 1, 1,
-0.2475803, 0.4476639, 1.243368, 1, 1, 1, 1, 1,
-0.2406594, 2.169358, 1.042034, 1, 1, 1, 1, 1,
-0.2380404, 2.05214, 0.6078979, 1, 1, 1, 1, 1,
-0.2376161, 0.5184604, 0.9296774, 1, 1, 1, 1, 1,
-0.2358668, 1.87327, -1.416234, 1, 1, 1, 1, 1,
-0.2345479, 0.3178229, -0.01437448, 1, 1, 1, 1, 1,
-0.2315108, 1.295021, 0.2158879, 1, 1, 1, 1, 1,
-0.2284078, 0.4189953, -1.173018, 1, 1, 1, 1, 1,
-0.2226508, 0.2992437, 0.03305532, 1, 1, 1, 1, 1,
-0.2204259, 0.8174593, 0.2862121, 1, 1, 1, 1, 1,
-0.2180318, 1.419559, -0.1661256, 1, 1, 1, 1, 1,
-0.2172923, -0.1121435, -2.963273, 0, 0, 1, 1, 1,
-0.2161465, -0.5606452, -2.687777, 1, 0, 0, 1, 1,
-0.2153867, -0.02862372, -2.150284, 1, 0, 0, 1, 1,
-0.2112613, -0.7350816, -4.436238, 1, 0, 0, 1, 1,
-0.2085831, 0.473547, -0.136765, 1, 0, 0, 1, 1,
-0.203748, 0.07649237, 0.02141569, 1, 0, 0, 1, 1,
-0.2029285, 0.6950436, -1.666768, 0, 0, 0, 1, 1,
-0.1989035, 0.2754331, 0.5019175, 0, 0, 0, 1, 1,
-0.1971481, 1.359059, -0.9944858, 0, 0, 0, 1, 1,
-0.196493, 0.4840874, -2.075335, 0, 0, 0, 1, 1,
-0.1844445, -0.1286527, -2.297974, 0, 0, 0, 1, 1,
-0.1840867, 0.0004914462, 0.1014252, 0, 0, 0, 1, 1,
-0.1833386, 0.5533866, 0.4663238, 0, 0, 0, 1, 1,
-0.1832477, 0.7632868, -1.594005, 1, 1, 1, 1, 1,
-0.1737613, 1.953594, -0.6925966, 1, 1, 1, 1, 1,
-0.1705749, 1.51383, 0.09501018, 1, 1, 1, 1, 1,
-0.1622767, 0.997532, -0.5849687, 1, 1, 1, 1, 1,
-0.1509532, -0.5572395, -3.694319, 1, 1, 1, 1, 1,
-0.1505831, -1.189366, -4.01829, 1, 1, 1, 1, 1,
-0.1491666, 0.3042274, -0.1710237, 1, 1, 1, 1, 1,
-0.145338, 2.018916, -0.07414849, 1, 1, 1, 1, 1,
-0.1437462, 0.1735995, 0.2653714, 1, 1, 1, 1, 1,
-0.1431737, -0.9333443, -0.9914738, 1, 1, 1, 1, 1,
-0.1411138, 1.087696, -1.208755, 1, 1, 1, 1, 1,
-0.1303752, 0.02408057, -1.778882, 1, 1, 1, 1, 1,
-0.1297964, 0.1614157, -0.8005176, 1, 1, 1, 1, 1,
-0.1282719, 0.3184551, -0.7328314, 1, 1, 1, 1, 1,
-0.1277255, -0.3550175, -1.886289, 1, 1, 1, 1, 1,
-0.1276826, -1.362044, -3.090446, 0, 0, 1, 1, 1,
-0.1273934, 0.2641763, 1.246505, 1, 0, 0, 1, 1,
-0.126224, -0.2816148, -2.524022, 1, 0, 0, 1, 1,
-0.1249074, -0.5525607, -4.547976, 1, 0, 0, 1, 1,
-0.1212153, -0.09402769, -2.206559, 1, 0, 0, 1, 1,
-0.1119511, 0.9372171, -0.1200511, 1, 0, 0, 1, 1,
-0.1101653, -0.2717755, -1.084264, 0, 0, 0, 1, 1,
-0.1061237, 0.7421111, -0.7339476, 0, 0, 0, 1, 1,
-0.1042833, 0.2373316, -1.396714, 0, 0, 0, 1, 1,
-0.09362879, 0.2690088, -2.330759, 0, 0, 0, 1, 1,
-0.09051867, 0.8305961, 1.274851, 0, 0, 0, 1, 1,
-0.08640081, 0.6167257, -0.2634381, 0, 0, 0, 1, 1,
-0.08582298, 1.006456, -0.3544857, 0, 0, 0, 1, 1,
-0.08450493, -0.8315735, -4.018563, 1, 1, 1, 1, 1,
-0.08401382, -0.336221, -2.648298, 1, 1, 1, 1, 1,
-0.08251251, 0.5827131, -1.050592, 1, 1, 1, 1, 1,
-0.08148904, -0.01285339, -2.402616, 1, 1, 1, 1, 1,
-0.07885011, 0.3318439, 1.727646, 1, 1, 1, 1, 1,
-0.07647127, -1.48589, -3.107038, 1, 1, 1, 1, 1,
-0.07626729, 0.1962178, 0.4394788, 1, 1, 1, 1, 1,
-0.07616868, -0.5212288, -3.282958, 1, 1, 1, 1, 1,
-0.07395119, 0.6079426, -1.207106, 1, 1, 1, 1, 1,
-0.07341284, 0.4405785, 0.03536473, 1, 1, 1, 1, 1,
-0.07261259, -1.059057, -2.721122, 1, 1, 1, 1, 1,
-0.06770191, -1.408104, -1.944204, 1, 1, 1, 1, 1,
-0.06478454, 0.9348921, 1.295152, 1, 1, 1, 1, 1,
-0.06333924, 0.5315216, 0.04500889, 1, 1, 1, 1, 1,
-0.06164168, 0.7021534, -0.4673612, 1, 1, 1, 1, 1,
-0.06126976, 1.638931, 1.580568, 0, 0, 1, 1, 1,
-0.058911, 0.4514473, -1.147445, 1, 0, 0, 1, 1,
-0.05786071, 0.8865776, 0.3243303, 1, 0, 0, 1, 1,
-0.05763583, 1.210513, -0.9926719, 1, 0, 0, 1, 1,
-0.05724385, 0.9245455, 0.8984947, 1, 0, 0, 1, 1,
-0.05551393, -2.277993, -3.058612, 1, 0, 0, 1, 1,
-0.05486551, 0.9724449, -2.287608, 0, 0, 0, 1, 1,
-0.054731, 0.0828822, 0.7504352, 0, 0, 0, 1, 1,
-0.05008284, -1.673723, -3.90557, 0, 0, 0, 1, 1,
-0.04428252, 1.120729, -1.346532, 0, 0, 0, 1, 1,
-0.04244259, -1.195738, -2.781173, 0, 0, 0, 1, 1,
-0.04136394, 1.622191, -0.1566373, 0, 0, 0, 1, 1,
-0.02857959, 0.1661798, -1.982675, 0, 0, 0, 1, 1,
-0.02696415, -1.475334, -2.497431, 1, 1, 1, 1, 1,
-0.02360067, 0.1151363, -0.7461907, 1, 1, 1, 1, 1,
-0.02324021, -1.041639, -1.640391, 1, 1, 1, 1, 1,
-0.02297535, -0.05557321, -3.67522, 1, 1, 1, 1, 1,
-0.01985374, 0.3934771, 1.29093, 1, 1, 1, 1, 1,
-0.01536831, -0.5010962, -2.156994, 1, 1, 1, 1, 1,
-0.01209901, -0.06644192, -2.801801, 1, 1, 1, 1, 1,
-0.01092362, 1.570093, -1.005885, 1, 1, 1, 1, 1,
-0.008417998, 0.2156311, -0.9005636, 1, 1, 1, 1, 1,
-0.00816885, 1.012863, -0.3179883, 1, 1, 1, 1, 1,
-0.006787758, -0.1411528, -2.448868, 1, 1, 1, 1, 1,
-0.005955713, -0.4623605, -3.500608, 1, 1, 1, 1, 1,
-0.005667284, -0.03552778, -4.324203, 1, 1, 1, 1, 1,
-0.004913082, -1.022368, -1.815843, 1, 1, 1, 1, 1,
-0.003429579, -0.4761856, -4.264113, 1, 1, 1, 1, 1,
0.001775322, -0.627111, 3.321882, 0, 0, 1, 1, 1,
0.006068438, 1.023282, 1.212945, 1, 0, 0, 1, 1,
0.006216001, 0.1959584, 0.9628494, 1, 0, 0, 1, 1,
0.01045715, -0.5911272, 5.514507, 1, 0, 0, 1, 1,
0.01433119, 0.76704, -0.6837634, 1, 0, 0, 1, 1,
0.01716864, 0.5533562, 0.2712483, 1, 0, 0, 1, 1,
0.01763346, 2.797875, 0.178395, 0, 0, 0, 1, 1,
0.01877095, 2.093082, 0.5936704, 0, 0, 0, 1, 1,
0.01907428, -0.770832, 0.01550985, 0, 0, 0, 1, 1,
0.019421, 0.65093, -0.2406237, 0, 0, 0, 1, 1,
0.02322388, -0.9946262, 3.684219, 0, 0, 0, 1, 1,
0.02560375, -0.9333794, 3.468741, 0, 0, 0, 1, 1,
0.02828835, 0.07716413, 0.4873549, 0, 0, 0, 1, 1,
0.03804444, 0.5994763, 0.8380823, 1, 1, 1, 1, 1,
0.04531305, 2.102918, -0.1002882, 1, 1, 1, 1, 1,
0.05130642, 0.7010593, -1.157668, 1, 1, 1, 1, 1,
0.056208, -0.9132002, 3.270286, 1, 1, 1, 1, 1,
0.05728015, -0.6726921, 5.088151, 1, 1, 1, 1, 1,
0.06446373, -2.189857, 2.733756, 1, 1, 1, 1, 1,
0.06639907, -0.02670209, 3.61392, 1, 1, 1, 1, 1,
0.06913708, 0.1543134, 0.1497048, 1, 1, 1, 1, 1,
0.07433653, -0.1785724, 3.582354, 1, 1, 1, 1, 1,
0.08814818, -2.044592, 3.268534, 1, 1, 1, 1, 1,
0.08862816, 0.8379334, 0.4485533, 1, 1, 1, 1, 1,
0.08879402, -1.774132, 2.161298, 1, 1, 1, 1, 1,
0.09040499, -1.80789, 2.568415, 1, 1, 1, 1, 1,
0.09459077, -0.1722811, 3.186285, 1, 1, 1, 1, 1,
0.09675246, -0.2246645, 5.198759, 1, 1, 1, 1, 1,
0.09735328, 0.04774871, 2.416189, 0, 0, 1, 1, 1,
0.1001298, -0.1107035, 0.8046607, 1, 0, 0, 1, 1,
0.1025633, -1.008334, 3.416805, 1, 0, 0, 1, 1,
0.1045917, -1.565926, 2.745652, 1, 0, 0, 1, 1,
0.1053008, -3.120837, 4.543822, 1, 0, 0, 1, 1,
0.1073161, -1.353095, 1.508756, 1, 0, 0, 1, 1,
0.1090517, -0.7673761, 4.06454, 0, 0, 0, 1, 1,
0.1133648, -0.5816753, 2.400341, 0, 0, 0, 1, 1,
0.1150868, -1.974567, 3.324967, 0, 0, 0, 1, 1,
0.1165528, -0.002403965, 1.735793, 0, 0, 0, 1, 1,
0.1203725, 1.411111, -0.9225114, 0, 0, 0, 1, 1,
0.1215849, 2.445273, -0.4186378, 0, 0, 0, 1, 1,
0.12464, -0.08326166, 1.216654, 0, 0, 0, 1, 1,
0.1260479, -0.1754239, 2.1994, 1, 1, 1, 1, 1,
0.1269215, -0.6188119, 2.873554, 1, 1, 1, 1, 1,
0.1274557, -0.3897863, 2.273615, 1, 1, 1, 1, 1,
0.1281177, 1.504807, 0.8705205, 1, 1, 1, 1, 1,
0.1294854, 0.8149337, 0.3823702, 1, 1, 1, 1, 1,
0.1351323, 0.3389537, 0.4943547, 1, 1, 1, 1, 1,
0.1423942, -0.6110312, 1.607904, 1, 1, 1, 1, 1,
0.1452401, -0.4187175, 1.516269, 1, 1, 1, 1, 1,
0.1456506, -0.6163692, 2.463244, 1, 1, 1, 1, 1,
0.1503635, 1.164231, -0.3950919, 1, 1, 1, 1, 1,
0.1523502, -1.756338, 0.831484, 1, 1, 1, 1, 1,
0.154861, -0.2832639, 3.64977, 1, 1, 1, 1, 1,
0.1560865, 0.3415617, -1.224597, 1, 1, 1, 1, 1,
0.1565181, -0.9124564, 3.572598, 1, 1, 1, 1, 1,
0.1589327, 0.7964211, 0.2281256, 1, 1, 1, 1, 1,
0.1597895, -0.4927771, 3.10356, 0, 0, 1, 1, 1,
0.1623148, -0.4224605, 3.283157, 1, 0, 0, 1, 1,
0.1653582, 0.1859188, 1.363947, 1, 0, 0, 1, 1,
0.168916, -0.002424865, 0.5218136, 1, 0, 0, 1, 1,
0.1828371, -0.1136986, 1.333221, 1, 0, 0, 1, 1,
0.1852723, 0.3938373, -0.2919729, 1, 0, 0, 1, 1,
0.1859355, 1.544411, 1.913663, 0, 0, 0, 1, 1,
0.1883609, -0.3048248, 2.728908, 0, 0, 0, 1, 1,
0.188933, 0.195306, 1.198065, 0, 0, 0, 1, 1,
0.1896636, 0.214973, -0.1830942, 0, 0, 0, 1, 1,
0.1941146, -0.3076163, 1.797283, 0, 0, 0, 1, 1,
0.1947134, -0.1363923, 1.263535, 0, 0, 0, 1, 1,
0.1949184, 0.2648911, 1.481269, 0, 0, 0, 1, 1,
0.1974104, -2.032435, 2.834598, 1, 1, 1, 1, 1,
0.2063453, -1.961643, 3.40958, 1, 1, 1, 1, 1,
0.2067858, 0.1868048, -0.2081529, 1, 1, 1, 1, 1,
0.214031, 1.236496, -1.518685, 1, 1, 1, 1, 1,
0.21506, -0.04866352, 2.291771, 1, 1, 1, 1, 1,
0.2174744, -0.8510678, 3.067895, 1, 1, 1, 1, 1,
0.2195019, 0.6586571, -1.661719, 1, 1, 1, 1, 1,
0.2307865, -1.660781, 1.152007, 1, 1, 1, 1, 1,
0.2329785, 0.1243121, 3.221576, 1, 1, 1, 1, 1,
0.2349163, -0.08536398, -0.3357161, 1, 1, 1, 1, 1,
0.2351576, 1.433325, 0.3657824, 1, 1, 1, 1, 1,
0.2390229, 0.5216404, 0.4893358, 1, 1, 1, 1, 1,
0.2471239, -0.01704922, -0.1582942, 1, 1, 1, 1, 1,
0.2530466, -0.2217373, 0.7312909, 1, 1, 1, 1, 1,
0.2561635, -0.7127954, 0.9355783, 1, 1, 1, 1, 1,
0.2574953, 0.53699, 1.70238, 0, 0, 1, 1, 1,
0.2602414, -1.09101, 0.1078605, 1, 0, 0, 1, 1,
0.2612671, 0.03741025, 0.2872713, 1, 0, 0, 1, 1,
0.2620031, -0.4876246, 2.465186, 1, 0, 0, 1, 1,
0.2633567, -0.6256995, 3.159759, 1, 0, 0, 1, 1,
0.2707377, -0.6860397, 2.226503, 1, 0, 0, 1, 1,
0.2762648, 0.2487583, 0.6563529, 0, 0, 0, 1, 1,
0.2792738, 1.954969, -1.210356, 0, 0, 0, 1, 1,
0.2809358, 0.6906568, 0.1610469, 0, 0, 0, 1, 1,
0.282223, -1.143617, 3.144969, 0, 0, 0, 1, 1,
0.2838152, -0.5074046, 2.632442, 0, 0, 0, 1, 1,
0.2858085, 0.9162271, 0.5168647, 0, 0, 0, 1, 1,
0.2871881, 0.3780876, -0.06432123, 0, 0, 0, 1, 1,
0.2893885, -0.6864066, 2.752902, 1, 1, 1, 1, 1,
0.2897812, -1.722534, 3.196626, 1, 1, 1, 1, 1,
0.2905143, 0.40184, 0.4348539, 1, 1, 1, 1, 1,
0.2955073, -1.145007, 2.26441, 1, 1, 1, 1, 1,
0.2963773, 0.02253838, 0.7623515, 1, 1, 1, 1, 1,
0.2964862, -1.159277, 2.723158, 1, 1, 1, 1, 1,
0.3012095, -0.9498187, 3.987825, 1, 1, 1, 1, 1,
0.3056422, 0.2070941, 0.1309683, 1, 1, 1, 1, 1,
0.3075407, -0.4081924, 1.950727, 1, 1, 1, 1, 1,
0.3076121, -0.6381575, 2.766446, 1, 1, 1, 1, 1,
0.3080614, 0.1118939, -0.3902061, 1, 1, 1, 1, 1,
0.3101079, 1.485418, 0.4089932, 1, 1, 1, 1, 1,
0.3107313, 0.1697577, 2.930337, 1, 1, 1, 1, 1,
0.3122836, -1.040612, 3.202699, 1, 1, 1, 1, 1,
0.3131272, 1.732299, 0.1047393, 1, 1, 1, 1, 1,
0.316351, 1.599742, -0.1660481, 0, 0, 1, 1, 1,
0.3192981, -1.567079, 3.795149, 1, 0, 0, 1, 1,
0.3201754, 0.2670495, 0.5255144, 1, 0, 0, 1, 1,
0.3216047, 0.8219261, 2.135443, 1, 0, 0, 1, 1,
0.3250088, -1.547293, 2.744003, 1, 0, 0, 1, 1,
0.3260713, -1.263954, 3.644532, 1, 0, 0, 1, 1,
0.3275328, -2.357591, 3.002134, 0, 0, 0, 1, 1,
0.3283922, -0.127938, 2.195383, 0, 0, 0, 1, 1,
0.3320239, -0.3923848, 2.894411, 0, 0, 0, 1, 1,
0.3329341, -1.008313, 2.476652, 0, 0, 0, 1, 1,
0.3331566, -0.5831245, 4.836299, 0, 0, 0, 1, 1,
0.3365541, -0.1284527, 2.941808, 0, 0, 0, 1, 1,
0.3377043, 0.8478864, 0.7949255, 0, 0, 0, 1, 1,
0.338277, -1.554372, 2.918681, 1, 1, 1, 1, 1,
0.3389612, -0.005930796, 2.012135, 1, 1, 1, 1, 1,
0.3404445, 0.2273598, 1.994868, 1, 1, 1, 1, 1,
0.3435086, -0.9949138, 4.374671, 1, 1, 1, 1, 1,
0.343915, 1.04479, 1.251071, 1, 1, 1, 1, 1,
0.3462295, 0.08436542, 0.7950149, 1, 1, 1, 1, 1,
0.3481299, -0.1685245, 0.8005157, 1, 1, 1, 1, 1,
0.3516111, 0.7482782, 0.3626189, 1, 1, 1, 1, 1,
0.3530353, 0.8682359, -0.3144912, 1, 1, 1, 1, 1,
0.3543042, 2.09415, 2.381606, 1, 1, 1, 1, 1,
0.3566997, 1.203112, -0.9738011, 1, 1, 1, 1, 1,
0.356793, -0.7002046, 3.805704, 1, 1, 1, 1, 1,
0.3581337, 0.3933099, 1.411661, 1, 1, 1, 1, 1,
0.362377, 0.3871563, 1.661946, 1, 1, 1, 1, 1,
0.3646922, 1.265274, -0.3712698, 1, 1, 1, 1, 1,
0.3648649, 0.0575412, 1.681814, 0, 0, 1, 1, 1,
0.3692466, -0.2105227, 1.83604, 1, 0, 0, 1, 1,
0.3698426, 0.7098394, -0.3760551, 1, 0, 0, 1, 1,
0.3716064, -0.1042246, 2.877352, 1, 0, 0, 1, 1,
0.3785837, 0.6952161, 1.736333, 1, 0, 0, 1, 1,
0.3857268, 0.938849, 1.122452, 1, 0, 0, 1, 1,
0.3863679, 0.3170676, 0.31041, 0, 0, 0, 1, 1,
0.3868339, 2.037188, -0.07367466, 0, 0, 0, 1, 1,
0.3906169, -0.9105515, 1.622242, 0, 0, 0, 1, 1,
0.3956101, 0.8254143, 0.573285, 0, 0, 0, 1, 1,
0.3987746, -0.7034507, 3.557774, 0, 0, 0, 1, 1,
0.4157712, -0.02908166, 1.259385, 0, 0, 0, 1, 1,
0.4192356, -0.008802447, 1.490009, 0, 0, 0, 1, 1,
0.4222653, 0.03752218, 0.7995443, 1, 1, 1, 1, 1,
0.4238018, -0.3158122, -0.3240673, 1, 1, 1, 1, 1,
0.4268428, 0.3035279, 0.3632077, 1, 1, 1, 1, 1,
0.4274617, -1.049849, 1.737535, 1, 1, 1, 1, 1,
0.4279942, 0.06289558, 0.4209591, 1, 1, 1, 1, 1,
0.429412, -1.62993, 0.4509041, 1, 1, 1, 1, 1,
0.4315302, 0.3628592, 0.8276898, 1, 1, 1, 1, 1,
0.4323401, 0.4825341, 0.7874656, 1, 1, 1, 1, 1,
0.4346797, 2.695398, -0.277464, 1, 1, 1, 1, 1,
0.4354014, 0.8023835, 1.667434, 1, 1, 1, 1, 1,
0.4355507, -0.8731596, 2.829478, 1, 1, 1, 1, 1,
0.4557288, 0.7844754, -0.7525225, 1, 1, 1, 1, 1,
0.4591772, -0.900579, 0.8390733, 1, 1, 1, 1, 1,
0.4607016, 0.7936075, 2.358692, 1, 1, 1, 1, 1,
0.4607602, 0.9007746, 0.1729499, 1, 1, 1, 1, 1,
0.4618358, 0.5592289, 0.7692955, 0, 0, 1, 1, 1,
0.4695966, 0.5790043, 2.383196, 1, 0, 0, 1, 1,
0.4717014, -0.1174962, 1.771284, 1, 0, 0, 1, 1,
0.4726467, -1.777304, 1.460146, 1, 0, 0, 1, 1,
0.4727084, 0.7090627, 1.326548, 1, 0, 0, 1, 1,
0.4760774, 0.02152559, 2.456217, 1, 0, 0, 1, 1,
0.4814511, -1.307126, 2.743457, 0, 0, 0, 1, 1,
0.4818885, -0.7833062, 0.4490116, 0, 0, 0, 1, 1,
0.4830162, -0.1783344, 2.628688, 0, 0, 0, 1, 1,
0.4879123, -0.9056588, 1.657449, 0, 0, 0, 1, 1,
0.4918751, 1.872051, 0.3158622, 0, 0, 0, 1, 1,
0.4924316, 0.2861677, 1.00975, 0, 0, 0, 1, 1,
0.4942518, -1.584278, 3.701283, 0, 0, 0, 1, 1,
0.4970791, -0.2474547, 1.434202, 1, 1, 1, 1, 1,
0.4973691, -0.1482152, -0.4760418, 1, 1, 1, 1, 1,
0.5005929, -0.2122526, 2.476869, 1, 1, 1, 1, 1,
0.5030361, -0.3213626, 1.763497, 1, 1, 1, 1, 1,
0.505814, 0.1723586, 1.56361, 1, 1, 1, 1, 1,
0.5075926, -0.7390668, 3.377352, 1, 1, 1, 1, 1,
0.5133954, 1.66248, -0.5258145, 1, 1, 1, 1, 1,
0.5145056, 1.521006, 0.4807045, 1, 1, 1, 1, 1,
0.5164489, -0.755407, 2.993717, 1, 1, 1, 1, 1,
0.5190911, -1.102661, 2.675073, 1, 1, 1, 1, 1,
0.5191619, 0.9619221, 1.704244, 1, 1, 1, 1, 1,
0.5219369, -0.1561297, 3.753857, 1, 1, 1, 1, 1,
0.5288072, 2.413049, -1.821176, 1, 1, 1, 1, 1,
0.5312162, 0.8495619, 1.652248, 1, 1, 1, 1, 1,
0.5313481, 1.91621, 0.1067735, 1, 1, 1, 1, 1,
0.5326946, 0.3589515, 3.14495, 0, 0, 1, 1, 1,
0.5365354, -0.03439654, 1.802804, 1, 0, 0, 1, 1,
0.5393933, 0.05872545, -0.2270461, 1, 0, 0, 1, 1,
0.5418804, 1.004655, 1.571244, 1, 0, 0, 1, 1,
0.5580789, -0.5442931, 2.443479, 1, 0, 0, 1, 1,
0.5604851, -1.16504, 2.334699, 1, 0, 0, 1, 1,
0.5612732, 0.5395716, 0.4579601, 0, 0, 0, 1, 1,
0.5613006, -0.2804572, 1.89867, 0, 0, 0, 1, 1,
0.5622614, 1.087267, 0.4600055, 0, 0, 0, 1, 1,
0.5643386, 3.140308, -0.03095589, 0, 0, 0, 1, 1,
0.5669057, -1.097989, 3.533587, 0, 0, 0, 1, 1,
0.5671445, -0.1393038, 4.081665, 0, 0, 0, 1, 1,
0.5755011, -0.5577362, 2.550254, 0, 0, 0, 1, 1,
0.5765145, 1.228095, -0.2000633, 1, 1, 1, 1, 1,
0.5800339, -2.006437, 3.01127, 1, 1, 1, 1, 1,
0.5809081, 0.6466753, 1.806741, 1, 1, 1, 1, 1,
0.5863628, 0.7042303, 2.122658, 1, 1, 1, 1, 1,
0.5866102, 2.002148, 0.9383109, 1, 1, 1, 1, 1,
0.5900019, -0.4847431, 2.140786, 1, 1, 1, 1, 1,
0.5909498, 0.009417723, 1.773312, 1, 1, 1, 1, 1,
0.5938538, -0.1122991, 1.946234, 1, 1, 1, 1, 1,
0.5988256, 0.529581, -0.6162033, 1, 1, 1, 1, 1,
0.6024504, 0.4981076, -0.814472, 1, 1, 1, 1, 1,
0.6140021, -0.7444743, 2.729175, 1, 1, 1, 1, 1,
0.6153691, -0.08326106, 2.57457, 1, 1, 1, 1, 1,
0.6163052, -0.8762958, 0.9621188, 1, 1, 1, 1, 1,
0.618358, -0.01081469, 1.900411, 1, 1, 1, 1, 1,
0.6198249, 0.8658919, -0.8475661, 1, 1, 1, 1, 1,
0.6266695, 0.01121512, 1.526354, 0, 0, 1, 1, 1,
0.6268517, -0.04140449, 2.175076, 1, 0, 0, 1, 1,
0.6283845, 0.1041196, 1.121913, 1, 0, 0, 1, 1,
0.6356495, 0.1198521, 1.558064, 1, 0, 0, 1, 1,
0.6389329, 0.472085, 0.4938118, 1, 0, 0, 1, 1,
0.6389782, 0.248501, 2.422041, 1, 0, 0, 1, 1,
0.6396861, -1.546812, 1.465315, 0, 0, 0, 1, 1,
0.6413279, -1.728907, 2.05685, 0, 0, 0, 1, 1,
0.6421819, -0.2778639, 2.883588, 0, 0, 0, 1, 1,
0.6478161, 1.579128, 1.898259, 0, 0, 0, 1, 1,
0.649042, 1.807208, -0.907443, 0, 0, 0, 1, 1,
0.6511427, -0.6557702, 1.873214, 0, 0, 0, 1, 1,
0.6526962, -0.3151572, 0.7320724, 0, 0, 0, 1, 1,
0.6633937, 0.04547537, -1.822606, 1, 1, 1, 1, 1,
0.6662914, 0.3848255, 1.380971, 1, 1, 1, 1, 1,
0.6716433, 0.4479045, -1.505049, 1, 1, 1, 1, 1,
0.6739337, -0.4561742, 2.085384, 1, 1, 1, 1, 1,
0.6758188, -1.262643, 2.255181, 1, 1, 1, 1, 1,
0.680639, 1.109593, 0.5755207, 1, 1, 1, 1, 1,
0.6817352, 0.01628459, 0.391218, 1, 1, 1, 1, 1,
0.6839314, -1.315655, 2.886068, 1, 1, 1, 1, 1,
0.6851851, -0.7823527, 3.039122, 1, 1, 1, 1, 1,
0.6866381, -1.342136, 2.136269, 1, 1, 1, 1, 1,
0.6893022, -0.4071677, 0.3494533, 1, 1, 1, 1, 1,
0.6901193, -1.335479, 2.140638, 1, 1, 1, 1, 1,
0.6981466, -0.4180859, 1.630447, 1, 1, 1, 1, 1,
0.69942, 0.09203902, 1.627588, 1, 1, 1, 1, 1,
0.7119684, 1.719325, 1.669948, 1, 1, 1, 1, 1,
0.7134452, 0.1106681, 0.2583992, 0, 0, 1, 1, 1,
0.7144379, -0.01558687, 1.505706, 1, 0, 0, 1, 1,
0.7199508, -1.134832, 2.379427, 1, 0, 0, 1, 1,
0.7230724, -1.352904, 2.806489, 1, 0, 0, 1, 1,
0.7244011, 0.4087429, -0.3158111, 1, 0, 0, 1, 1,
0.7245514, 0.3030124, 2.099602, 1, 0, 0, 1, 1,
0.725563, 0.9506806, 1.00707, 0, 0, 0, 1, 1,
0.7296312, -0.07082928, 1.869628, 0, 0, 0, 1, 1,
0.7298805, 0.1414434, 1.543226, 0, 0, 0, 1, 1,
0.733425, -0.4116229, 4.060936, 0, 0, 0, 1, 1,
0.7371804, -0.3408685, 4.58735, 0, 0, 0, 1, 1,
0.7418162, -1.29461, 4.008202, 0, 0, 0, 1, 1,
0.7429847, -0.8444338, 1.623232, 0, 0, 0, 1, 1,
0.7459814, -0.8529128, 3.477617, 1, 1, 1, 1, 1,
0.7524926, 0.3904037, 0.5127664, 1, 1, 1, 1, 1,
0.7564031, 0.3513731, 0.6563741, 1, 1, 1, 1, 1,
0.7580309, 0.3103318, 1.393986, 1, 1, 1, 1, 1,
0.7601865, 0.4123682, 0.0164323, 1, 1, 1, 1, 1,
0.7608783, -0.4673227, 2.676213, 1, 1, 1, 1, 1,
0.7677378, -1.271249, 1.792974, 1, 1, 1, 1, 1,
0.7714195, -0.1306718, 3.107604, 1, 1, 1, 1, 1,
0.7778123, 0.7352835, 2.594448, 1, 1, 1, 1, 1,
0.7788175, 1.220868, 2.048421, 1, 1, 1, 1, 1,
0.781997, -0.6588347, 3.764133, 1, 1, 1, 1, 1,
0.782758, -0.232173, 0.8144286, 1, 1, 1, 1, 1,
0.7837018, -0.06791202, 2.002017, 1, 1, 1, 1, 1,
0.7934365, 0.7775846, 2.210252, 1, 1, 1, 1, 1,
0.7994367, 0.3310702, 2.407541, 1, 1, 1, 1, 1,
0.8002254, -1.164881, 2.280013, 0, 0, 1, 1, 1,
0.8019122, 0.6296313, 2.381426, 1, 0, 0, 1, 1,
0.8043223, 0.3750644, 2.406001, 1, 0, 0, 1, 1,
0.805174, -1.801306, 3.241086, 1, 0, 0, 1, 1,
0.8057715, -0.463443, 1.541724, 1, 0, 0, 1, 1,
0.8098649, -0.1642636, 2.341072, 1, 0, 0, 1, 1,
0.8149617, 0.3253237, 2.533017, 0, 0, 0, 1, 1,
0.8247408, -1.014223, 3.41736, 0, 0, 0, 1, 1,
0.8289856, -0.4792873, 3.01682, 0, 0, 0, 1, 1,
0.8305427, 0.1063731, 1.091924, 0, 0, 0, 1, 1,
0.8339425, -0.2012596, 2.484537, 0, 0, 0, 1, 1,
0.8348244, 0.7716078, 0.2924954, 0, 0, 0, 1, 1,
0.8355369, 2.414592, 0.766813, 0, 0, 0, 1, 1,
0.8357553, -1.85115, 2.468723, 1, 1, 1, 1, 1,
0.8374187, 0.8642581, 0.8495821, 1, 1, 1, 1, 1,
0.8376081, 0.05477362, 2.389156, 1, 1, 1, 1, 1,
0.8382138, -0.2123156, 2.158933, 1, 1, 1, 1, 1,
0.8460958, 1.33723, 0.2167189, 1, 1, 1, 1, 1,
0.8461642, -0.4419889, 3.494023, 1, 1, 1, 1, 1,
0.8485297, 0.04645316, 0.6546136, 1, 1, 1, 1, 1,
0.8500381, -1.897799, 3.678369, 1, 1, 1, 1, 1,
0.8500903, -0.2331312, 0.8945975, 1, 1, 1, 1, 1,
0.8520155, -2.400335, 4.14046, 1, 1, 1, 1, 1,
0.8520762, 0.0114366, 1.705279, 1, 1, 1, 1, 1,
0.8531737, 0.3182218, 0.8963996, 1, 1, 1, 1, 1,
0.857344, -0.2197504, 2.386193, 1, 1, 1, 1, 1,
0.8583827, -0.7797858, 4.859096, 1, 1, 1, 1, 1,
0.8694351, 1.544444, -0.7137753, 1, 1, 1, 1, 1,
0.8791286, 2.424502, 0.6026942, 0, 0, 1, 1, 1,
0.8820102, 1.10475, 2.243733, 1, 0, 0, 1, 1,
0.8863198, 0.1636555, 0.3748819, 1, 0, 0, 1, 1,
0.8900434, 0.3385084, 0.9596305, 1, 0, 0, 1, 1,
0.896464, -0.8451189, 2.554613, 1, 0, 0, 1, 1,
0.8988304, 0.01044984, 0.8870007, 1, 0, 0, 1, 1,
0.9022356, 0.1494871, 1.637433, 0, 0, 0, 1, 1,
0.9031296, -0.9043927, 1.135119, 0, 0, 0, 1, 1,
0.9129205, -0.4115941, 2.579492, 0, 0, 0, 1, 1,
0.9131522, 1.490722, -0.102557, 0, 0, 0, 1, 1,
0.9140732, -0.3024429, 1.047014, 0, 0, 0, 1, 1,
0.9178796, -1.139567, 2.354974, 0, 0, 0, 1, 1,
0.925496, 0.7921025, 1.287334, 0, 0, 0, 1, 1,
0.9412048, -0.372089, 1.942865, 1, 1, 1, 1, 1,
0.9440699, 0.1349351, 0.1896002, 1, 1, 1, 1, 1,
0.9446066, 0.5576257, 1.377293, 1, 1, 1, 1, 1,
0.9466081, 2.496933, -0.4606399, 1, 1, 1, 1, 1,
0.9480219, -0.1204168, 2.477919, 1, 1, 1, 1, 1,
0.9572035, 0.2288831, 2.115661, 1, 1, 1, 1, 1,
0.9573167, 1.275049, -0.2702065, 1, 1, 1, 1, 1,
0.9574907, -0.07378998, 3.337488, 1, 1, 1, 1, 1,
0.9595482, 0.2179369, 0.02795435, 1, 1, 1, 1, 1,
0.9615566, -0.5029776, 2.485747, 1, 1, 1, 1, 1,
0.9668497, -0.05252323, 2.251937, 1, 1, 1, 1, 1,
0.9772726, -1.109854, 1.628917, 1, 1, 1, 1, 1,
0.9817371, -2.827598, 2.638825, 1, 1, 1, 1, 1,
0.9831265, -0.8800908, 3.168448, 1, 1, 1, 1, 1,
0.991004, 0.8227869, 0.9046323, 1, 1, 1, 1, 1,
0.9971819, -0.5595556, 1.90681, 0, 0, 1, 1, 1,
1.000233, 1.245662, 0.6359603, 1, 0, 0, 1, 1,
1.001268, 1.146854, 0.4774066, 1, 0, 0, 1, 1,
1.003163, 0.5863603, 2.715143, 1, 0, 0, 1, 1,
1.008936, -0.2199115, 1.43903, 1, 0, 0, 1, 1,
1.014088, -1.805296, 1.487496, 1, 0, 0, 1, 1,
1.018933, 0.4913657, 1.0302, 0, 0, 0, 1, 1,
1.033832, 1.51868, 1.484833, 0, 0, 0, 1, 1,
1.036169, 1.675035, 0.06803707, 0, 0, 0, 1, 1,
1.036813, -0.1498389, 2.11106, 0, 0, 0, 1, 1,
1.040653, -1.407174, 2.983644, 0, 0, 0, 1, 1,
1.041378, -1.034559, 1.903907, 0, 0, 0, 1, 1,
1.046373, 0.02698634, 1.152022, 0, 0, 0, 1, 1,
1.04986, 1.155787, -0.1726063, 1, 1, 1, 1, 1,
1.05163, 0.4566376, 0.4133283, 1, 1, 1, 1, 1,
1.054737, 0.1291255, 0.7933214, 1, 1, 1, 1, 1,
1.068504, 0.5003911, 1.100433, 1, 1, 1, 1, 1,
1.068668, -1.805476, 1.714288, 1, 1, 1, 1, 1,
1.075853, -0.6208495, 2.657412, 1, 1, 1, 1, 1,
1.076375, -1.531823, 2.279483, 1, 1, 1, 1, 1,
1.078006, -0.7578412, 3.254863, 1, 1, 1, 1, 1,
1.090829, -1.116533, 0.2111997, 1, 1, 1, 1, 1,
1.093842, -0.09512818, 2.265965, 1, 1, 1, 1, 1,
1.09663, -0.8645675, 1.334449, 1, 1, 1, 1, 1,
1.09961, -1.559534, 2.679234, 1, 1, 1, 1, 1,
1.118746, 0.04550411, 1.000832, 1, 1, 1, 1, 1,
1.127175, 1.083578, 0.6453874, 1, 1, 1, 1, 1,
1.128237, -0.4998328, 3.6147, 1, 1, 1, 1, 1,
1.143999, 0.3896136, 0.6726967, 0, 0, 1, 1, 1,
1.144004, 0.2336299, 1.697166, 1, 0, 0, 1, 1,
1.145228, 1.877858, 0.8178617, 1, 0, 0, 1, 1,
1.147408, 0.1036095, 2.421238, 1, 0, 0, 1, 1,
1.147871, 0.8699225, 0.8639229, 1, 0, 0, 1, 1,
1.150841, -0.3477333, 1.472863, 1, 0, 0, 1, 1,
1.158253, 1.562065, -1.247061, 0, 0, 0, 1, 1,
1.161808, 0.08404168, 1.345682, 0, 0, 0, 1, 1,
1.165781, 0.7282453, 1.188355, 0, 0, 0, 1, 1,
1.168005, -0.5128461, 0.9090614, 0, 0, 0, 1, 1,
1.188162, -0.2073755, 1.41455, 0, 0, 0, 1, 1,
1.192945, -0.4892901, 1.291317, 0, 0, 0, 1, 1,
1.20144, -2.203454, 0.7635224, 0, 0, 0, 1, 1,
1.207965, 1.151644, 0.5098504, 1, 1, 1, 1, 1,
1.215536, 1.74776, 1.079005, 1, 1, 1, 1, 1,
1.216171, -1.103202, 3.364023, 1, 1, 1, 1, 1,
1.219714, 0.3695965, 2.828779, 1, 1, 1, 1, 1,
1.224089, 1.994405, 0.3148874, 1, 1, 1, 1, 1,
1.227052, -1.004928, 1.401655, 1, 1, 1, 1, 1,
1.232936, 1.644333, 1.434393, 1, 1, 1, 1, 1,
1.255554, -0.03884317, 1.135763, 1, 1, 1, 1, 1,
1.259558, 1.568655, 0.4139125, 1, 1, 1, 1, 1,
1.263469, -0.5881636, 3.135458, 1, 1, 1, 1, 1,
1.270828, -1.120488, 3.537819, 1, 1, 1, 1, 1,
1.271057, -0.592239, 2.487094, 1, 1, 1, 1, 1,
1.279181, 1.384205, 1.146657, 1, 1, 1, 1, 1,
1.282866, 0.405876, 3.262151, 1, 1, 1, 1, 1,
1.283342, 0.704704, 2.015311, 1, 1, 1, 1, 1,
1.292222, -0.08355393, 1.495718, 0, 0, 1, 1, 1,
1.295944, 0.843273, 0.8922261, 1, 0, 0, 1, 1,
1.305449, -1.537088, 0.3991579, 1, 0, 0, 1, 1,
1.306946, -1.716131, 2.195937, 1, 0, 0, 1, 1,
1.318965, 0.8780861, 0.3815844, 1, 0, 0, 1, 1,
1.322017, -1.315069, 2.270574, 1, 0, 0, 1, 1,
1.324974, 1.000694, 2.312523, 0, 0, 0, 1, 1,
1.332059, -0.561287, 2.29132, 0, 0, 0, 1, 1,
1.340061, -0.8445393, 3.902144, 0, 0, 0, 1, 1,
1.344844, -0.258487, 2.385554, 0, 0, 0, 1, 1,
1.345251, -2.44372, 4.234105, 0, 0, 0, 1, 1,
1.357935, -0.02916065, 1.531968, 0, 0, 0, 1, 1,
1.366535, 0.8449544, 0.7086009, 0, 0, 0, 1, 1,
1.366752, 0.6099471, 2.490729, 1, 1, 1, 1, 1,
1.368998, -0.3998969, 2.438998, 1, 1, 1, 1, 1,
1.371226, 2.062969, 2.130775, 1, 1, 1, 1, 1,
1.384359, 0.3283085, 3.113113, 1, 1, 1, 1, 1,
1.418464, -1.436751, 3.52261, 1, 1, 1, 1, 1,
1.418719, 1.048315, 0.1603781, 1, 1, 1, 1, 1,
1.423381, 1.480533, 1.254598, 1, 1, 1, 1, 1,
1.442939, 1.145628, 0.3128435, 1, 1, 1, 1, 1,
1.443777, -1.730506, 2.735639, 1, 1, 1, 1, 1,
1.444945, 0.3311886, 2.347023, 1, 1, 1, 1, 1,
1.446481, -0.6619341, 2.792939, 1, 1, 1, 1, 1,
1.44816, 0.09120411, 1.542851, 1, 1, 1, 1, 1,
1.450235, 0.7202441, 0.9991116, 1, 1, 1, 1, 1,
1.453618, -0.6090123, 2.436247, 1, 1, 1, 1, 1,
1.455424, 0.361822, 0.9427782, 1, 1, 1, 1, 1,
1.473577, -2.083889, 3.928463, 0, 0, 1, 1, 1,
1.476126, 0.7651536, 0.6734943, 1, 0, 0, 1, 1,
1.48053, 0.4686194, 1.063516, 1, 0, 0, 1, 1,
1.480916, 1.255648, 1.242181, 1, 0, 0, 1, 1,
1.486706, -0.242204, 3.579414, 1, 0, 0, 1, 1,
1.488639, -0.2011911, 0.7520597, 1, 0, 0, 1, 1,
1.491734, 0.03331482, 1.701071, 0, 0, 0, 1, 1,
1.49913, 0.07561857, 1.747897, 0, 0, 0, 1, 1,
1.502545, -2.626703, 4.379004, 0, 0, 0, 1, 1,
1.512411, 0.300453, 0.09465241, 0, 0, 0, 1, 1,
1.521352, 0.4686074, 0.4698723, 0, 0, 0, 1, 1,
1.527065, 0.2312254, 1.022178, 0, 0, 0, 1, 1,
1.528007, -0.1185979, 2.225125, 0, 0, 0, 1, 1,
1.542082, -0.5777966, 3.416968, 1, 1, 1, 1, 1,
1.546738, 0.3908587, 1.550336, 1, 1, 1, 1, 1,
1.553801, 0.09115524, 1.130789, 1, 1, 1, 1, 1,
1.559889, -0.8060481, 2.563069, 1, 1, 1, 1, 1,
1.563677, 0.1285401, 2.978321, 1, 1, 1, 1, 1,
1.566438, -0.2580785, 1.112783, 1, 1, 1, 1, 1,
1.593861, 0.1400329, 1.221786, 1, 1, 1, 1, 1,
1.596248, 1.133151, 3.442552, 1, 1, 1, 1, 1,
1.602527, -1.594847, 1.756179, 1, 1, 1, 1, 1,
1.609037, 0.03670148, 2.385088, 1, 1, 1, 1, 1,
1.613986, 0.8016681, -0.664942, 1, 1, 1, 1, 1,
1.635358, 0.5065074, 0.3471643, 1, 1, 1, 1, 1,
1.639838, -0.4245367, 1.504328, 1, 1, 1, 1, 1,
1.657135, 0.390199, 1.107976, 1, 1, 1, 1, 1,
1.66616, -2.07342, 0.2693552, 1, 1, 1, 1, 1,
1.691082, -0.07071378, 0.5744512, 0, 0, 1, 1, 1,
1.699385, 1.726372, -0.6434752, 1, 0, 0, 1, 1,
1.699703, 1.012399, 3.533179, 1, 0, 0, 1, 1,
1.702087, -0.4101709, 0.4678667, 1, 0, 0, 1, 1,
1.719823, 1.743558, 1.761982, 1, 0, 0, 1, 1,
1.724932, 0.567908, 0.156459, 1, 0, 0, 1, 1,
1.737945, -0.3220143, 1.655114, 0, 0, 0, 1, 1,
1.755256, -0.209252, 1.875222, 0, 0, 0, 1, 1,
1.766323, -0.8576762, 2.061568, 0, 0, 0, 1, 1,
1.766881, -0.3957767, 1.153583, 0, 0, 0, 1, 1,
1.772512, 0.4563209, 1.990312, 0, 0, 0, 1, 1,
1.781356, 0.0470319, 1.830592, 0, 0, 0, 1, 1,
1.793639, 0.905872, -1.121265, 0, 0, 0, 1, 1,
1.79407, -1.27476, 2.234997, 1, 1, 1, 1, 1,
1.801846, -1.214984, 2.596145, 1, 1, 1, 1, 1,
1.804604, -0.6712972, 2.560406, 1, 1, 1, 1, 1,
1.80779, 0.9036546, 1.187468, 1, 1, 1, 1, 1,
1.808862, 0.8814062, 1.216992, 1, 1, 1, 1, 1,
1.835462, -0.7182045, 3.470453, 1, 1, 1, 1, 1,
1.845276, -0.2775329, 4.443515, 1, 1, 1, 1, 1,
1.852987, 0.5268389, 2.20861, 1, 1, 1, 1, 1,
1.88198, -1.064022, 2.691395, 1, 1, 1, 1, 1,
1.888888, -0.164655, 1.371325, 1, 1, 1, 1, 1,
1.932824, 1.498977, 1.146566, 1, 1, 1, 1, 1,
1.941033, -0.8902172, 0.8098767, 1, 1, 1, 1, 1,
1.941485, 0.6720333, 1.717806, 1, 1, 1, 1, 1,
1.960326, 0.572601, 2.364036, 1, 1, 1, 1, 1,
1.967203, 0.965178, 1.261673, 1, 1, 1, 1, 1,
1.984296, -1.040866, 3.278115, 0, 0, 1, 1, 1,
2.009269, -1.911092, 0.5996739, 1, 0, 0, 1, 1,
2.014378, 1.22477, 1.600107, 1, 0, 0, 1, 1,
2.026554, -0.7687989, 2.041955, 1, 0, 0, 1, 1,
2.027189, -0.227705, 0.08876967, 1, 0, 0, 1, 1,
2.063121, -0.04802116, 2.21254, 1, 0, 0, 1, 1,
2.097546, 0.1503152, 1.902141, 0, 0, 0, 1, 1,
2.12417, -1.829717, 3.104881, 0, 0, 0, 1, 1,
2.15346, 0.8350836, 1.930177, 0, 0, 0, 1, 1,
2.172531, -0.5046651, 2.562721, 0, 0, 0, 1, 1,
2.184449, -1.009963, 2.621955, 0, 0, 0, 1, 1,
2.316278, 0.1655253, 1.616314, 0, 0, 0, 1, 1,
2.447719, 0.2192208, 0.8424911, 0, 0, 0, 1, 1,
2.460137, -1.014563, 1.489995, 1, 1, 1, 1, 1,
2.573508, -0.6325317, 1.097026, 1, 1, 1, 1, 1,
2.730464, -2.134491, 1.392605, 1, 1, 1, 1, 1,
2.755128, 1.038226, 0.7746474, 1, 1, 1, 1, 1,
2.820047, -0.6048748, 2.131374, 1, 1, 1, 1, 1,
2.959843, -0.5961305, 2.20541, 1, 1, 1, 1, 1,
3.082937, -0.1012529, 1.497449, 1, 1, 1, 1, 1
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
var radius = 9.482401;
var distance = 33.30653;
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
mvMatrix.translate( 0.1591754, -0.2181039, -0.3917007 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.30653);
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
