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
-2.883363, -0.3593458, 0.3988296, 1, 0, 0, 1,
-2.568938, 1.053174, -2.609195, 1, 0.007843138, 0, 1,
-2.542216, 0.08829471, -2.209094, 1, 0.01176471, 0, 1,
-2.467414, -0.3459393, -1.772644, 1, 0.01960784, 0, 1,
-2.426626, 0.4152521, -2.397442, 1, 0.02352941, 0, 1,
-2.405627, -0.6185056, -2.255365, 1, 0.03137255, 0, 1,
-2.395192, -0.5922357, -2.30249, 1, 0.03529412, 0, 1,
-2.225082, -0.5213084, -0.9406096, 1, 0.04313726, 0, 1,
-2.197363, 1.586453, -1.070368, 1, 0.04705882, 0, 1,
-2.193897, 0.5757103, -1.286769, 1, 0.05490196, 0, 1,
-2.157851, -0.5864564, -1.946103, 1, 0.05882353, 0, 1,
-2.150051, 0.7439074, -2.011035, 1, 0.06666667, 0, 1,
-2.149915, 1.123757, -1.141997, 1, 0.07058824, 0, 1,
-2.104653, -1.058111, -2.418628, 1, 0.07843138, 0, 1,
-2.05062, -2.734201, -3.419822, 1, 0.08235294, 0, 1,
-2.047813, 1.176202, 0.4115103, 1, 0.09019608, 0, 1,
-2.032726, -1.377063, -2.375347, 1, 0.09411765, 0, 1,
-2.007467, 1.409813, -2.49957, 1, 0.1019608, 0, 1,
-1.986651, 0.1593843, -1.252926, 1, 0.1098039, 0, 1,
-1.975027, -0.3564728, -1.206778, 1, 0.1137255, 0, 1,
-1.964288, 1.555574, 0.2406647, 1, 0.1215686, 0, 1,
-1.958774, 1.066929, -0.3180744, 1, 0.1254902, 0, 1,
-1.95231, -0.8112961, -1.928472, 1, 0.1333333, 0, 1,
-1.945023, 0.6250243, -1.671323, 1, 0.1372549, 0, 1,
-1.944286, 1.095061, -1.673165, 1, 0.145098, 0, 1,
-1.934386, 0.5188467, -1.098051, 1, 0.1490196, 0, 1,
-1.913156, -0.08021247, 0.5156581, 1, 0.1568628, 0, 1,
-1.884281, -0.4901297, -1.81049, 1, 0.1607843, 0, 1,
-1.85411, -1.278243, -2.508898, 1, 0.1686275, 0, 1,
-1.846157, 0.422113, -0.5833042, 1, 0.172549, 0, 1,
-1.819117, -1.330367, 0.251488, 1, 0.1803922, 0, 1,
-1.787323, -1.208145, -2.368725, 1, 0.1843137, 0, 1,
-1.7826, 0.8638125, -1.036988, 1, 0.1921569, 0, 1,
-1.674323, -0.2790105, -1.268353, 1, 0.1960784, 0, 1,
-1.656197, 0.06846328, -0.8570471, 1, 0.2039216, 0, 1,
-1.632918, -0.2567453, -0.5742103, 1, 0.2117647, 0, 1,
-1.624348, 0.119413, -2.087236, 1, 0.2156863, 0, 1,
-1.616532, -0.2900122, -1.62102, 1, 0.2235294, 0, 1,
-1.61596, -0.2747852, -0.5577149, 1, 0.227451, 0, 1,
-1.612518, -1.312977, -1.79994, 1, 0.2352941, 0, 1,
-1.604306, 1.19858, -1.296032, 1, 0.2392157, 0, 1,
-1.589895, -0.6632581, -1.873663, 1, 0.2470588, 0, 1,
-1.564205, 0.675796, 0.1244245, 1, 0.2509804, 0, 1,
-1.558903, 1.661226, -1.597721, 1, 0.2588235, 0, 1,
-1.558704, -0.1295843, -0.8550372, 1, 0.2627451, 0, 1,
-1.555294, 0.2188929, -1.846004, 1, 0.2705882, 0, 1,
-1.546085, 0.05959979, -0.3771391, 1, 0.2745098, 0, 1,
-1.543576, -1.069433, -0.9008774, 1, 0.282353, 0, 1,
-1.541596, 1.455447, 0.6150178, 1, 0.2862745, 0, 1,
-1.540707, 1.517161, -1.254963, 1, 0.2941177, 0, 1,
-1.534397, 0.1566098, -2.331241, 1, 0.3019608, 0, 1,
-1.514874, -0.9213027, -1.708493, 1, 0.3058824, 0, 1,
-1.511605, 0.02085392, -0.5196863, 1, 0.3137255, 0, 1,
-1.511599, -0.3612978, -2.630969, 1, 0.3176471, 0, 1,
-1.509565, 0.9562845, -0.4000296, 1, 0.3254902, 0, 1,
-1.498596, 0.3613384, -3.386182, 1, 0.3294118, 0, 1,
-1.46989, 1.084578, 0.3497415, 1, 0.3372549, 0, 1,
-1.46656, -0.5467532, -0.9444196, 1, 0.3411765, 0, 1,
-1.464527, 0.0588598, -2.956831, 1, 0.3490196, 0, 1,
-1.447444, -1.180135, -0.1461812, 1, 0.3529412, 0, 1,
-1.429751, -0.151248, -1.994606, 1, 0.3607843, 0, 1,
-1.427345, 0.4696297, -0.04167966, 1, 0.3647059, 0, 1,
-1.425713, 0.9683684, -0.5498647, 1, 0.372549, 0, 1,
-1.424246, 0.1243906, -0.7846975, 1, 0.3764706, 0, 1,
-1.422557, -0.01532543, -1.709223, 1, 0.3843137, 0, 1,
-1.419526, 0.04890078, -1.174525, 1, 0.3882353, 0, 1,
-1.402547, 0.4528799, -2.194068, 1, 0.3960784, 0, 1,
-1.391021, -1.387798, -2.42695, 1, 0.4039216, 0, 1,
-1.376279, 0.1307963, -1.041298, 1, 0.4078431, 0, 1,
-1.371379, 0.1358493, -1.760959, 1, 0.4156863, 0, 1,
-1.368931, 0.956889, 1.357052, 1, 0.4196078, 0, 1,
-1.365267, -0.2837653, -2.006949, 1, 0.427451, 0, 1,
-1.361332, 0.3272627, -1.10813, 1, 0.4313726, 0, 1,
-1.360373, -0.2222344, -1.746539, 1, 0.4392157, 0, 1,
-1.346147, -1.062194, -2.192909, 1, 0.4431373, 0, 1,
-1.326445, 0.2549217, 0.1578273, 1, 0.4509804, 0, 1,
-1.325557, 0.2308662, -1.487131, 1, 0.454902, 0, 1,
-1.317578, 0.04435216, -1.156867, 1, 0.4627451, 0, 1,
-1.30985, -0.2154008, -2.451434, 1, 0.4666667, 0, 1,
-1.304872, 2.116524, -0.2149736, 1, 0.4745098, 0, 1,
-1.298697, -0.07729645, -1.272764, 1, 0.4784314, 0, 1,
-1.288044, 1.975701, -1.774209, 1, 0.4862745, 0, 1,
-1.284234, -0.04380577, -0.6471764, 1, 0.4901961, 0, 1,
-1.272997, 0.7489814, -1.646446, 1, 0.4980392, 0, 1,
-1.256959, 0.6230668, -0.7596486, 1, 0.5058824, 0, 1,
-1.24922, -1.791183, -0.1987713, 1, 0.509804, 0, 1,
-1.247247, 1.134496, -1.09416, 1, 0.5176471, 0, 1,
-1.246695, 0.8067997, -2.132137, 1, 0.5215687, 0, 1,
-1.229119, -0.54927, -2.26988, 1, 0.5294118, 0, 1,
-1.220705, 0.1031284, -2.686601, 1, 0.5333334, 0, 1,
-1.212445, -0.09990038, -2.536598, 1, 0.5411765, 0, 1,
-1.199521, -0.176823, -1.742821, 1, 0.5450981, 0, 1,
-1.197631, 0.9120463, -0.4380407, 1, 0.5529412, 0, 1,
-1.190104, -1.491516, -1.545116, 1, 0.5568628, 0, 1,
-1.188639, 0.9448858, -1.424767, 1, 0.5647059, 0, 1,
-1.185761, 1.370251, -0.3164738, 1, 0.5686275, 0, 1,
-1.181026, -1.331177, -0.697027, 1, 0.5764706, 0, 1,
-1.17918, -0.4772048, -1.579851, 1, 0.5803922, 0, 1,
-1.17877, 2.111232, -0.2315847, 1, 0.5882353, 0, 1,
-1.178312, 0.1323258, 1.279882, 1, 0.5921569, 0, 1,
-1.172092, 1.929306, -0.5748257, 1, 0.6, 0, 1,
-1.170795, -0.1465701, -3.474011, 1, 0.6078432, 0, 1,
-1.166731, -0.5124559, -2.255236, 1, 0.6117647, 0, 1,
-1.157181, -0.2756311, -3.123611, 1, 0.6196079, 0, 1,
-1.143698, -0.6523514, -3.014503, 1, 0.6235294, 0, 1,
-1.141746, 0.8319539, -1.942405, 1, 0.6313726, 0, 1,
-1.140942, 1.079422, -0.1949848, 1, 0.6352941, 0, 1,
-1.132365, -0.1792641, -1.009849, 1, 0.6431373, 0, 1,
-1.130822, 1.083975, -1.117437, 1, 0.6470588, 0, 1,
-1.106873, 0.6005316, 0.1720686, 1, 0.654902, 0, 1,
-1.106786, 1.194479, -1.167178, 1, 0.6588235, 0, 1,
-1.105411, -0.7019611, -2.242186, 1, 0.6666667, 0, 1,
-1.105369, 0.1568861, -2.635123, 1, 0.6705883, 0, 1,
-1.095167, -1.565959, -2.630677, 1, 0.6784314, 0, 1,
-1.09204, 0.794691, -0.6498025, 1, 0.682353, 0, 1,
-1.091948, -1.387267, -3.063991, 1, 0.6901961, 0, 1,
-1.088112, -1.151994, -2.778368, 1, 0.6941177, 0, 1,
-1.077692, 0.7119592, -1.666851, 1, 0.7019608, 0, 1,
-1.074653, 1.118274, 0.8758699, 1, 0.7098039, 0, 1,
-1.071214, 1.562455, 0.05163531, 1, 0.7137255, 0, 1,
-1.066393, -1.147199, -2.258064, 1, 0.7215686, 0, 1,
-1.060388, -2.404954, -1.567594, 1, 0.7254902, 0, 1,
-1.056529, -0.5272362, -2.791019, 1, 0.7333333, 0, 1,
-1.05559, 0.6820837, 0.02961166, 1, 0.7372549, 0, 1,
-1.054043, 0.7902636, 0.8090581, 1, 0.7450981, 0, 1,
-1.053367, 0.571056, -0.4289298, 1, 0.7490196, 0, 1,
-1.053156, -0.3643672, -1.464815, 1, 0.7568628, 0, 1,
-1.051082, -0.2273416, -2.151403, 1, 0.7607843, 0, 1,
-1.037385, -1.038626, -1.540885, 1, 0.7686275, 0, 1,
-1.036147, -2.744859, -2.724701, 1, 0.772549, 0, 1,
-1.0342, -0.3614609, -1.641559, 1, 0.7803922, 0, 1,
-1.030977, 2.77803, -1.052881, 1, 0.7843137, 0, 1,
-1.027627, 1.522202, 0.6267547, 1, 0.7921569, 0, 1,
-1.027473, -0.6019599, -2.648029, 1, 0.7960784, 0, 1,
-1.016855, -1.045901, -1.732643, 1, 0.8039216, 0, 1,
-1.016709, 0.7051417, 0.3903609, 1, 0.8117647, 0, 1,
-1.012482, 0.2333959, -1.547054, 1, 0.8156863, 0, 1,
-1.010222, 0.1044998, 0.5546093, 1, 0.8235294, 0, 1,
-1.008777, -0.8738827, -1.006059, 1, 0.827451, 0, 1,
-0.9999808, 0.5319729, -3.148595, 1, 0.8352941, 0, 1,
-0.9955361, -1.33873, -1.12617, 1, 0.8392157, 0, 1,
-0.9950829, -1.870549, -3.721869, 1, 0.8470588, 0, 1,
-0.9920174, -1.11188, -2.904931, 1, 0.8509804, 0, 1,
-0.9919167, -0.3773773, -2.034445, 1, 0.8588235, 0, 1,
-0.9910754, 1.533917, 0.1430626, 1, 0.8627451, 0, 1,
-0.9750106, -0.8114553, -2.734878, 1, 0.8705882, 0, 1,
-0.9676924, 0.2736103, 0.3321438, 1, 0.8745098, 0, 1,
-0.9668335, -1.262925, -1.889571, 1, 0.8823529, 0, 1,
-0.9654424, -1.130016, -1.338572, 1, 0.8862745, 0, 1,
-0.965146, 0.2282581, -1.805263, 1, 0.8941177, 0, 1,
-0.951018, -0.9336808, -1.137926, 1, 0.8980392, 0, 1,
-0.9494591, -0.02262044, -1.443941, 1, 0.9058824, 0, 1,
-0.942717, -0.2851682, -2.259518, 1, 0.9137255, 0, 1,
-0.9245725, 0.3571819, -1.263162, 1, 0.9176471, 0, 1,
-0.9224511, -0.01547833, -2.066458, 1, 0.9254902, 0, 1,
-0.9211234, 0.4349935, 0.729805, 1, 0.9294118, 0, 1,
-0.9118352, -1.762876, -4.339009, 1, 0.9372549, 0, 1,
-0.9116634, 0.07008822, -0.2010981, 1, 0.9411765, 0, 1,
-0.909728, -1.741835, -2.660141, 1, 0.9490196, 0, 1,
-0.9089149, -1.041362, -1.445912, 1, 0.9529412, 0, 1,
-0.8989665, -0.2599323, -1.726753, 1, 0.9607843, 0, 1,
-0.8952337, -1.426257, -2.472601, 1, 0.9647059, 0, 1,
-0.8930258, 0.7297971, -0.774761, 1, 0.972549, 0, 1,
-0.8889453, 0.5747223, -3.044414, 1, 0.9764706, 0, 1,
-0.8887731, 0.5184935, -2.853112, 1, 0.9843137, 0, 1,
-0.8848938, 2.15082, -0.7912351, 1, 0.9882353, 0, 1,
-0.8829288, 1.253013, 0.3233238, 1, 0.9960784, 0, 1,
-0.8813775, -0.1945316, -2.024858, 0.9960784, 1, 0, 1,
-0.8800673, -0.7884007, -0.8801314, 0.9921569, 1, 0, 1,
-0.8777221, -0.8303667, -2.331688, 0.9843137, 1, 0, 1,
-0.8681099, -1.171292, -1.080603, 0.9803922, 1, 0, 1,
-0.8674837, 2.164324, -0.2051099, 0.972549, 1, 0, 1,
-0.8621335, 1.635631, 0.03035347, 0.9686275, 1, 0, 1,
-0.8607609, 0.2186692, -1.256259, 0.9607843, 1, 0, 1,
-0.8602594, 0.6161739, -1.65959, 0.9568627, 1, 0, 1,
-0.8545732, -0.1094126, -2.070859, 0.9490196, 1, 0, 1,
-0.8497205, -0.5628495, -2.331733, 0.945098, 1, 0, 1,
-0.8470219, 0.7719142, 1.318489, 0.9372549, 1, 0, 1,
-0.8467068, 0.2029417, -1.018509, 0.9333333, 1, 0, 1,
-0.8421643, 1.137688, -0.9481946, 0.9254902, 1, 0, 1,
-0.8384699, 0.1749109, -1.589659, 0.9215686, 1, 0, 1,
-0.8258011, 0.02767153, -3.339629, 0.9137255, 1, 0, 1,
-0.8208839, -1.285198, -3.52033, 0.9098039, 1, 0, 1,
-0.8182098, 1.106955, -1.609403, 0.9019608, 1, 0, 1,
-0.8178232, 0.01955229, -2.729946, 0.8941177, 1, 0, 1,
-0.8157503, -0.2840967, -2.656864, 0.8901961, 1, 0, 1,
-0.813467, -0.06653506, -1.894391, 0.8823529, 1, 0, 1,
-0.8058687, -1.530394, -3.557946, 0.8784314, 1, 0, 1,
-0.799471, -0.5183885, -2.229743, 0.8705882, 1, 0, 1,
-0.7932453, 0.1336516, -2.92194, 0.8666667, 1, 0, 1,
-0.7926824, -1.387736, -0.9162808, 0.8588235, 1, 0, 1,
-0.7890042, 0.2338731, -2.013435, 0.854902, 1, 0, 1,
-0.7867669, -2.814917, -3.087127, 0.8470588, 1, 0, 1,
-0.7827753, -0.6470776, -2.77612, 0.8431373, 1, 0, 1,
-0.7750441, -1.626407, -2.769555, 0.8352941, 1, 0, 1,
-0.7739283, 0.1085005, -1.438142, 0.8313726, 1, 0, 1,
-0.7723625, 0.6532552, -3.116572, 0.8235294, 1, 0, 1,
-0.7689516, -1.535353, -1.323998, 0.8196079, 1, 0, 1,
-0.7687957, 0.6528562, -1.473947, 0.8117647, 1, 0, 1,
-0.7662615, 0.4063382, -1.826928, 0.8078431, 1, 0, 1,
-0.7510089, -0.4840349, -2.251173, 0.8, 1, 0, 1,
-0.7492557, 0.23622, -0.356762, 0.7921569, 1, 0, 1,
-0.7440757, 1.45748, -0.5629182, 0.7882353, 1, 0, 1,
-0.742906, -0.3490936, -1.27212, 0.7803922, 1, 0, 1,
-0.7415845, -0.2614827, -2.317291, 0.7764706, 1, 0, 1,
-0.7407789, -1.199511, -3.022894, 0.7686275, 1, 0, 1,
-0.7399764, 0.07515354, -3.054417, 0.7647059, 1, 0, 1,
-0.7386643, -1.114128, -3.48857, 0.7568628, 1, 0, 1,
-0.7375467, 0.5582412, -0.699195, 0.7529412, 1, 0, 1,
-0.7368683, 1.172121, -0.9545717, 0.7450981, 1, 0, 1,
-0.7348072, 0.06032751, -2.031912, 0.7411765, 1, 0, 1,
-0.7329771, -1.035968, -3.065195, 0.7333333, 1, 0, 1,
-0.7311932, 0.7422638, -0.9995324, 0.7294118, 1, 0, 1,
-0.7290557, -0.8074021, -3.064, 0.7215686, 1, 0, 1,
-0.7230521, -1.28862, -3.805861, 0.7176471, 1, 0, 1,
-0.7218485, -1.025004, -1.484456, 0.7098039, 1, 0, 1,
-0.7134438, 0.538074, -1.296322, 0.7058824, 1, 0, 1,
-0.7120784, -1.152833, -3.562014, 0.6980392, 1, 0, 1,
-0.7110645, -0.7108681, -2.426759, 0.6901961, 1, 0, 1,
-0.7085146, 0.6433555, -0.7112311, 0.6862745, 1, 0, 1,
-0.7068888, 1.297708, -1.021564, 0.6784314, 1, 0, 1,
-0.7034062, -1.066816, -3.173422, 0.6745098, 1, 0, 1,
-0.7015058, -0.5329568, -2.054982, 0.6666667, 1, 0, 1,
-0.6991088, 1.598467, -0.03745839, 0.6627451, 1, 0, 1,
-0.6961007, -0.4326644, -1.077808, 0.654902, 1, 0, 1,
-0.6947187, -0.1550027, -1.841194, 0.6509804, 1, 0, 1,
-0.6936989, 0.7510481, -1.008638, 0.6431373, 1, 0, 1,
-0.6928537, -0.5620188, -3.210741, 0.6392157, 1, 0, 1,
-0.6926256, -0.5141298, -2.211861, 0.6313726, 1, 0, 1,
-0.6898245, 1.041039, 0.2634534, 0.627451, 1, 0, 1,
-0.6809196, -0.8500921, -1.634613, 0.6196079, 1, 0, 1,
-0.6757193, -0.8022935, -1.852154, 0.6156863, 1, 0, 1,
-0.6756436, 0.614756, -1.851381, 0.6078432, 1, 0, 1,
-0.6690563, 0.3515035, 0.4297085, 0.6039216, 1, 0, 1,
-0.6688195, 1.436144, -0.7728866, 0.5960785, 1, 0, 1,
-0.6647702, 0.2823285, -1.762169, 0.5882353, 1, 0, 1,
-0.6609953, -0.6351956, -1.308747, 0.5843138, 1, 0, 1,
-0.6592741, 0.6197889, -0.1511528, 0.5764706, 1, 0, 1,
-0.656994, -0.859208, -2.53984, 0.572549, 1, 0, 1,
-0.6520022, -1.58746, -2.725451, 0.5647059, 1, 0, 1,
-0.6507174, 1.00241, -1.590012, 0.5607843, 1, 0, 1,
-0.6480984, -1.570755, -3.328549, 0.5529412, 1, 0, 1,
-0.6431175, -0.4157523, -2.287007, 0.5490196, 1, 0, 1,
-0.6425666, 2.361047, -0.05362546, 0.5411765, 1, 0, 1,
-0.6414725, -1.653208, -2.381791, 0.5372549, 1, 0, 1,
-0.6408023, 0.07145514, -1.130479, 0.5294118, 1, 0, 1,
-0.6400939, -1.077081, -3.693517, 0.5254902, 1, 0, 1,
-0.637709, 1.097097, -1.100564, 0.5176471, 1, 0, 1,
-0.6333519, -0.4366988, -3.027893, 0.5137255, 1, 0, 1,
-0.6324714, -0.7215304, -2.637653, 0.5058824, 1, 0, 1,
-0.6309049, -1.269631, -3.275843, 0.5019608, 1, 0, 1,
-0.6244844, 0.3219117, -1.474041, 0.4941176, 1, 0, 1,
-0.6232228, 0.8698013, -0.9174692, 0.4862745, 1, 0, 1,
-0.6201233, 1.037035, 0.1999998, 0.4823529, 1, 0, 1,
-0.6191472, 1.475258, 0.3810553, 0.4745098, 1, 0, 1,
-0.6183578, 1.71133, -0.3797905, 0.4705882, 1, 0, 1,
-0.6164876, 0.6396712, -1.586767, 0.4627451, 1, 0, 1,
-0.6147519, 0.01841086, -1.859942, 0.4588235, 1, 0, 1,
-0.6078799, 0.03946536, -0.7797516, 0.4509804, 1, 0, 1,
-0.6023971, 0.5546456, 0.08228654, 0.4470588, 1, 0, 1,
-0.5992104, 0.2051071, -0.3955424, 0.4392157, 1, 0, 1,
-0.5991468, 0.5403371, 0.1569117, 0.4352941, 1, 0, 1,
-0.5982144, 1.958099, 1.962566, 0.427451, 1, 0, 1,
-0.5933427, 1.160346, -0.7637991, 0.4235294, 1, 0, 1,
-0.5932856, 0.720161, 0.5084847, 0.4156863, 1, 0, 1,
-0.5878211, 1.262058, -1.482636, 0.4117647, 1, 0, 1,
-0.5840041, 1.792383, -1.298463, 0.4039216, 1, 0, 1,
-0.58383, -1.167978, -4.017975, 0.3960784, 1, 0, 1,
-0.5780004, -0.2360436, -2.222335, 0.3921569, 1, 0, 1,
-0.5749186, -0.2672793, -3.012776, 0.3843137, 1, 0, 1,
-0.5709408, 0.8029692, 1.196741, 0.3803922, 1, 0, 1,
-0.5692783, 0.720515, -0.2865519, 0.372549, 1, 0, 1,
-0.5652072, -0.214934, -1.118581, 0.3686275, 1, 0, 1,
-0.5642616, -0.02659249, -0.8851415, 0.3607843, 1, 0, 1,
-0.5638192, 1.367386, -1.558073, 0.3568628, 1, 0, 1,
-0.561625, 0.1628931, -0.8588654, 0.3490196, 1, 0, 1,
-0.555661, -1.851097, -2.366882, 0.345098, 1, 0, 1,
-0.5524001, -0.8514193, -3.287141, 0.3372549, 1, 0, 1,
-0.5513039, -0.488589, -2.88879, 0.3333333, 1, 0, 1,
-0.5493945, 0.7808126, 0.8863143, 0.3254902, 1, 0, 1,
-0.5489199, 1.212578, -1.314191, 0.3215686, 1, 0, 1,
-0.5466642, -1.815102, -4.137002, 0.3137255, 1, 0, 1,
-0.5461878, -0.5693257, -3.575067, 0.3098039, 1, 0, 1,
-0.5443902, -0.1265534, -0.7173465, 0.3019608, 1, 0, 1,
-0.5426967, 0.08033055, -1.452465, 0.2941177, 1, 0, 1,
-0.5402058, 0.7955586, -0.6237873, 0.2901961, 1, 0, 1,
-0.536284, 0.8158848, -1.225687, 0.282353, 1, 0, 1,
-0.5345477, -0.1494522, -2.19997, 0.2784314, 1, 0, 1,
-0.5301508, 0.201427, -0.4286776, 0.2705882, 1, 0, 1,
-0.5299343, -1.699023, -3.05562, 0.2666667, 1, 0, 1,
-0.5294548, 0.8185835, -1.328295, 0.2588235, 1, 0, 1,
-0.5272994, 2.980344, -0.03882836, 0.254902, 1, 0, 1,
-0.5246683, -0.6715953, -4.002505, 0.2470588, 1, 0, 1,
-0.5218143, -0.7468269, -1.008771, 0.2431373, 1, 0, 1,
-0.5189843, 1.022242, 0.2616747, 0.2352941, 1, 0, 1,
-0.5145999, 0.8317035, -1.077856, 0.2313726, 1, 0, 1,
-0.51335, -0.4275096, -1.412038, 0.2235294, 1, 0, 1,
-0.5105276, -0.8410656, -3.168985, 0.2196078, 1, 0, 1,
-0.5068482, -0.8296908, -0.9502715, 0.2117647, 1, 0, 1,
-0.5051533, -0.03073196, -1.662396, 0.2078431, 1, 0, 1,
-0.5039386, 0.413042, -0.941121, 0.2, 1, 0, 1,
-0.5037135, 0.2730584, -0.4330575, 0.1921569, 1, 0, 1,
-0.5032573, -0.1150477, 0.1295603, 0.1882353, 1, 0, 1,
-0.4898461, -1.313794, -2.474138, 0.1803922, 1, 0, 1,
-0.4895323, -1.073201, -3.310623, 0.1764706, 1, 0, 1,
-0.4884333, -0.2637686, -2.763466, 0.1686275, 1, 0, 1,
-0.4879304, 0.7203978, -1.371418, 0.1647059, 1, 0, 1,
-0.4861466, 0.04210461, -1.880278, 0.1568628, 1, 0, 1,
-0.4807042, -1.099252, -2.559067, 0.1529412, 1, 0, 1,
-0.4778731, -0.1732265, 0.192877, 0.145098, 1, 0, 1,
-0.4768132, 0.0287485, -0.4126291, 0.1411765, 1, 0, 1,
-0.476689, -0.6845151, -1.673812, 0.1333333, 1, 0, 1,
-0.474429, 0.3593483, 1.477742, 0.1294118, 1, 0, 1,
-0.4740437, -0.01016957, -1.608123, 0.1215686, 1, 0, 1,
-0.4738505, 2.090319, 1.909081, 0.1176471, 1, 0, 1,
-0.4717538, 0.7599761, 0.2747225, 0.1098039, 1, 0, 1,
-0.4640992, -0.6468607, -4.308474, 0.1058824, 1, 0, 1,
-0.4632863, 1.707882, -1.250075, 0.09803922, 1, 0, 1,
-0.4618108, -0.07429516, -4.32992, 0.09019608, 1, 0, 1,
-0.4585984, 0.5292791, -1.100663, 0.08627451, 1, 0, 1,
-0.4545588, 0.3839135, -1.267589, 0.07843138, 1, 0, 1,
-0.4542548, 1.367321, 0.2919214, 0.07450981, 1, 0, 1,
-0.4525923, 0.4096217, -0.8257661, 0.06666667, 1, 0, 1,
-0.4492498, 0.331147, -3.62279, 0.0627451, 1, 0, 1,
-0.4474567, -0.7074766, -1.908917, 0.05490196, 1, 0, 1,
-0.446868, 1.766073, -1.178475, 0.05098039, 1, 0, 1,
-0.4455365, 0.6034487, -0.9097326, 0.04313726, 1, 0, 1,
-0.4377695, -1.09189, -2.161927, 0.03921569, 1, 0, 1,
-0.4322781, 1.522278, -0.4941213, 0.03137255, 1, 0, 1,
-0.4311356, 0.6213142, 0.9950216, 0.02745098, 1, 0, 1,
-0.4303737, 1.093555, 0.01851531, 0.01960784, 1, 0, 1,
-0.4294507, -0.553912, -4.18828, 0.01568628, 1, 0, 1,
-0.4238976, -1.385649, -0.2523295, 0.007843138, 1, 0, 1,
-0.4223789, 0.367808, -0.4872441, 0.003921569, 1, 0, 1,
-0.418738, -1.542658, -2.397722, 0, 1, 0.003921569, 1,
-0.4156622, -1.333805, -3.19586, 0, 1, 0.01176471, 1,
-0.4130749, -0.7628538, -1.597106, 0, 1, 0.01568628, 1,
-0.4126632, 1.923257, -1.021675, 0, 1, 0.02352941, 1,
-0.412331, -0.1459443, -2.697188, 0, 1, 0.02745098, 1,
-0.4096839, -0.9504988, -2.885777, 0, 1, 0.03529412, 1,
-0.408255, -1.384989, -2.209, 0, 1, 0.03921569, 1,
-0.40693, 0.7929089, -2.381731, 0, 1, 0.04705882, 1,
-0.4066452, 1.256396, -1.137806, 0, 1, 0.05098039, 1,
-0.4049938, 1.940925, 1.42166, 0, 1, 0.05882353, 1,
-0.4043046, -0.1074281, -0.3138335, 0, 1, 0.0627451, 1,
-0.4011021, 0.4110388, -0.3976844, 0, 1, 0.07058824, 1,
-0.3945619, 0.1199633, -1.908817, 0, 1, 0.07450981, 1,
-0.3938165, -0.1770503, -1.701781, 0, 1, 0.08235294, 1,
-0.3932971, 2.260277, -0.2903733, 0, 1, 0.08627451, 1,
-0.3876966, -1.001516, -2.592137, 0, 1, 0.09411765, 1,
-0.3874204, 0.5341361, 0.2402769, 0, 1, 0.1019608, 1,
-0.3861254, -0.225777, -2.082207, 0, 1, 0.1058824, 1,
-0.385708, -1.094153, -2.65883, 0, 1, 0.1137255, 1,
-0.3855975, -0.361144, -3.364985, 0, 1, 0.1176471, 1,
-0.3812748, 1.212246, -1.556046, 0, 1, 0.1254902, 1,
-0.3807247, -0.9245558, -0.8836409, 0, 1, 0.1294118, 1,
-0.3766828, -0.1901932, -1.53875, 0, 1, 0.1372549, 1,
-0.3766558, 0.2035147, -0.6019667, 0, 1, 0.1411765, 1,
-0.3703653, 0.1224802, -1.853302, 0, 1, 0.1490196, 1,
-0.3674291, -1.544048, -4.087546, 0, 1, 0.1529412, 1,
-0.3673279, 0.5950181, -0.4010754, 0, 1, 0.1607843, 1,
-0.3653102, -0.9338005, -4.469627, 0, 1, 0.1647059, 1,
-0.362933, -1.215546, -4.945779, 0, 1, 0.172549, 1,
-0.3624181, 0.3138428, -0.7340878, 0, 1, 0.1764706, 1,
-0.3611962, 2.139489, -0.2133498, 0, 1, 0.1843137, 1,
-0.3553535, 1.120111, 0.6436597, 0, 1, 0.1882353, 1,
-0.3489461, -0.6459379, -2.400378, 0, 1, 0.1960784, 1,
-0.3460118, -0.7599124, -1.576697, 0, 1, 0.2039216, 1,
-0.3419071, 0.2866825, -0.1536282, 0, 1, 0.2078431, 1,
-0.3418522, -0.0247895, -3.604117, 0, 1, 0.2156863, 1,
-0.3416569, 0.6190548, -0.9861851, 0, 1, 0.2196078, 1,
-0.3414073, 0.6214914, 0.5077226, 0, 1, 0.227451, 1,
-0.3401458, 0.8743374, -0.2078341, 0, 1, 0.2313726, 1,
-0.3342569, -2.924542, -2.311481, 0, 1, 0.2392157, 1,
-0.3325322, -1.055313, -2.131016, 0, 1, 0.2431373, 1,
-0.3285045, 0.00752375, -0.7411677, 0, 1, 0.2509804, 1,
-0.3280004, -0.3972533, -1.76585, 0, 1, 0.254902, 1,
-0.3216104, 0.1125337, 0.2531312, 0, 1, 0.2627451, 1,
-0.3203506, 0.2169122, -1.426229, 0, 1, 0.2666667, 1,
-0.3195361, 0.5554561, -0.08119521, 0, 1, 0.2745098, 1,
-0.3173378, -1.433251, -3.886545, 0, 1, 0.2784314, 1,
-0.3161249, -0.295283, -4.256365, 0, 1, 0.2862745, 1,
-0.3160512, 0.2593013, -1.343858, 0, 1, 0.2901961, 1,
-0.3151854, 0.1436822, -1.452663, 0, 1, 0.2980392, 1,
-0.3134204, -1.078361, -2.478444, 0, 1, 0.3058824, 1,
-0.3133472, 2.824131, -1.370107, 0, 1, 0.3098039, 1,
-0.3122668, 0.6956085, -0.7069939, 0, 1, 0.3176471, 1,
-0.3102663, -0.3578414, -3.154093, 0, 1, 0.3215686, 1,
-0.3082162, -0.3790332, -1.246514, 0, 1, 0.3294118, 1,
-0.3065233, 0.3730813, 1.050048, 0, 1, 0.3333333, 1,
-0.3056541, -0.9093425, -2.450903, 0, 1, 0.3411765, 1,
-0.3042171, 0.4904715, 0.7873013, 0, 1, 0.345098, 1,
-0.3039122, 0.6293101, 0.4471443, 0, 1, 0.3529412, 1,
-0.3030554, -0.8916183, -2.567374, 0, 1, 0.3568628, 1,
-0.3021458, 0.8195539, -0.9419913, 0, 1, 0.3647059, 1,
-0.3007189, 1.052665, 0.433726, 0, 1, 0.3686275, 1,
-0.2995164, -0.1784884, -2.850734, 0, 1, 0.3764706, 1,
-0.2984186, -1.741347, -3.551701, 0, 1, 0.3803922, 1,
-0.29836, 0.4870562, -0.827841, 0, 1, 0.3882353, 1,
-0.2972874, -0.6098261, -3.98058, 0, 1, 0.3921569, 1,
-0.2966328, 0.01438821, -1.718262, 0, 1, 0.4, 1,
-0.2955881, 1.995466, 0.7889758, 0, 1, 0.4078431, 1,
-0.2879447, 0.7794969, -0.71327, 0, 1, 0.4117647, 1,
-0.2877415, -0.33634, -3.229076, 0, 1, 0.4196078, 1,
-0.2815343, -0.3684556, -1.884859, 0, 1, 0.4235294, 1,
-0.2810961, -0.9544326, -1.65222, 0, 1, 0.4313726, 1,
-0.2800114, 0.2125016, -1.207272, 0, 1, 0.4352941, 1,
-0.2784255, -0.1331414, -0.5980125, 0, 1, 0.4431373, 1,
-0.2769264, 1.516758, 1.666612, 0, 1, 0.4470588, 1,
-0.2752216, -0.1292709, -0.0006735303, 0, 1, 0.454902, 1,
-0.2747494, -1.004012, -4.147296, 0, 1, 0.4588235, 1,
-0.2669094, -1.485921, -2.782912, 0, 1, 0.4666667, 1,
-0.2664048, 0.8287021, -0.1971905, 0, 1, 0.4705882, 1,
-0.2656393, -0.1609956, -1.188692, 0, 1, 0.4784314, 1,
-0.2588156, -0.3917329, -2.572381, 0, 1, 0.4823529, 1,
-0.2562476, 0.5700995, 0.4347162, 0, 1, 0.4901961, 1,
-0.2561738, -0.9859172, -2.76986, 0, 1, 0.4941176, 1,
-0.2549968, -1.393396, -3.216339, 0, 1, 0.5019608, 1,
-0.25498, 0.4102784, -0.7633288, 0, 1, 0.509804, 1,
-0.2540074, -1.252925, -4.925151, 0, 1, 0.5137255, 1,
-0.2535469, -0.3899623, -2.92486, 0, 1, 0.5215687, 1,
-0.2531903, -2.540624, -3.4679, 0, 1, 0.5254902, 1,
-0.2509067, -3.248234, -3.237726, 0, 1, 0.5333334, 1,
-0.2490674, -0.04624179, -0.5084526, 0, 1, 0.5372549, 1,
-0.2482825, -0.590678, -4.441299, 0, 1, 0.5450981, 1,
-0.2482466, 1.331672, -0.545489, 0, 1, 0.5490196, 1,
-0.2440993, -0.08950632, -3.836067, 0, 1, 0.5568628, 1,
-0.2426061, 0.4150432, -0.3351226, 0, 1, 0.5607843, 1,
-0.2413373, -0.6040229, -3.298446, 0, 1, 0.5686275, 1,
-0.2389389, 0.5064459, -0.7835523, 0, 1, 0.572549, 1,
-0.233077, 0.007647205, 0.2088247, 0, 1, 0.5803922, 1,
-0.2310127, -0.1854013, -2.621586, 0, 1, 0.5843138, 1,
-0.230792, 0.765981, -0.3935224, 0, 1, 0.5921569, 1,
-0.2305881, -1.283918, -3.760973, 0, 1, 0.5960785, 1,
-0.2303207, 1.108853, 0.05283521, 0, 1, 0.6039216, 1,
-0.2272955, 0.04723277, -2.456562, 0, 1, 0.6117647, 1,
-0.2270285, -1.217384, -3.234182, 0, 1, 0.6156863, 1,
-0.2239267, 0.1076823, 0.5378428, 0, 1, 0.6235294, 1,
-0.2172599, -0.3894602, -2.851571, 0, 1, 0.627451, 1,
-0.212881, -1.278042, -4.010888, 0, 1, 0.6352941, 1,
-0.212597, -0.4362061, -4.678281, 0, 1, 0.6392157, 1,
-0.210526, -0.2526811, -1.110918, 0, 1, 0.6470588, 1,
-0.2073106, -1.476475, -2.710398, 0, 1, 0.6509804, 1,
-0.206536, 1.522312, -1.2377, 0, 1, 0.6588235, 1,
-0.2062664, 1.655394, -0.3527664, 0, 1, 0.6627451, 1,
-0.2030829, -0.4365935, -2.489597, 0, 1, 0.6705883, 1,
-0.2013847, 1.687565, -0.2299136, 0, 1, 0.6745098, 1,
-0.2000784, -1.018785, -1.62624, 0, 1, 0.682353, 1,
-0.197825, -2.273885, -3.494117, 0, 1, 0.6862745, 1,
-0.1955923, -0.5580096, -2.497149, 0, 1, 0.6941177, 1,
-0.19523, -0.5649498, -4.80177, 0, 1, 0.7019608, 1,
-0.194344, -1.794251, -3.487291, 0, 1, 0.7058824, 1,
-0.18376, 0.7294708, -2.097053, 0, 1, 0.7137255, 1,
-0.1834915, 1.434543, -1.067013, 0, 1, 0.7176471, 1,
-0.1818588, -0.5202245, -3.259075, 0, 1, 0.7254902, 1,
-0.1790494, 2.076099, 0.1609545, 0, 1, 0.7294118, 1,
-0.1779804, -0.955707, -1.935517, 0, 1, 0.7372549, 1,
-0.1777293, -0.2236338, -2.063037, 0, 1, 0.7411765, 1,
-0.1713081, 0.1508459, -1.962944, 0, 1, 0.7490196, 1,
-0.1712728, -0.6731184, -2.094835, 0, 1, 0.7529412, 1,
-0.165863, -0.4889434, -3.275477, 0, 1, 0.7607843, 1,
-0.1656041, -0.7615144, -3.454104, 0, 1, 0.7647059, 1,
-0.1634745, -0.7382982, -3.064145, 0, 1, 0.772549, 1,
-0.1625574, -0.2426385, -3.30118, 0, 1, 0.7764706, 1,
-0.1551272, 0.321347, 2.396686, 0, 1, 0.7843137, 1,
-0.150138, 1.020498, -2.298539, 0, 1, 0.7882353, 1,
-0.1492614, 0.0843465, -1.70359, 0, 1, 0.7960784, 1,
-0.1483207, 0.548036, -1.517581, 0, 1, 0.8039216, 1,
-0.147475, -0.1109313, -3.747049, 0, 1, 0.8078431, 1,
-0.1455643, -0.2431929, -3.71462, 0, 1, 0.8156863, 1,
-0.1403626, -0.2424816, -3.170751, 0, 1, 0.8196079, 1,
-0.1393501, 0.9059651, -0.7162361, 0, 1, 0.827451, 1,
-0.1348142, 0.4536383, 0.4418071, 0, 1, 0.8313726, 1,
-0.1333669, 1.014116, -1.166813, 0, 1, 0.8392157, 1,
-0.1307967, -1.978508, -2.360274, 0, 1, 0.8431373, 1,
-0.126791, -0.4371077, -3.81096, 0, 1, 0.8509804, 1,
-0.1259053, -0.03595989, -1.662792, 0, 1, 0.854902, 1,
-0.1240073, 0.3803768, -2.516213, 0, 1, 0.8627451, 1,
-0.1229979, -0.3015568, -4.761778, 0, 1, 0.8666667, 1,
-0.1212964, 1.140338, -2.056934, 0, 1, 0.8745098, 1,
-0.1197376, -0.4923877, -1.738744, 0, 1, 0.8784314, 1,
-0.1169773, 0.4753395, -1.476393, 0, 1, 0.8862745, 1,
-0.1132686, -0.6235344, -2.8848, 0, 1, 0.8901961, 1,
-0.1115427, -0.5635073, -1.886514, 0, 1, 0.8980392, 1,
-0.1083211, 0.7472647, -1.041597, 0, 1, 0.9058824, 1,
-0.1071732, 0.08212592, -1.05389, 0, 1, 0.9098039, 1,
-0.1061092, 0.2920103, -0.1711255, 0, 1, 0.9176471, 1,
-0.1047663, 0.3870913, -0.2996756, 0, 1, 0.9215686, 1,
-0.102241, -1.895788, -5.242287, 0, 1, 0.9294118, 1,
-0.102044, 1.616671, 1.396387, 0, 1, 0.9333333, 1,
-0.097547, 0.6136431, 1.045062, 0, 1, 0.9411765, 1,
-0.09485853, -2.41825, -2.513487, 0, 1, 0.945098, 1,
-0.09432342, -1.109924, -4.546087, 0, 1, 0.9529412, 1,
-0.09268306, 2.306535, -0.6303928, 0, 1, 0.9568627, 1,
-0.09136242, 0.4505504, -0.4848707, 0, 1, 0.9647059, 1,
-0.08225324, -0.4342708, -3.369383, 0, 1, 0.9686275, 1,
-0.07495289, 2.19363, -1.011118, 0, 1, 0.9764706, 1,
-0.07418568, -0.5125571, -1.165201, 0, 1, 0.9803922, 1,
-0.0735472, 0.3792799, -1.312664, 0, 1, 0.9882353, 1,
-0.0711479, -1.933544, -5.102184, 0, 1, 0.9921569, 1,
-0.06778502, 0.2670786, -1.11189, 0, 1, 1, 1,
-0.06551538, -0.9413218, -4.773794, 0, 0.9921569, 1, 1,
-0.06505505, -1.321555, -3.156906, 0, 0.9882353, 1, 1,
-0.06339089, -0.1775295, -2.598388, 0, 0.9803922, 1, 1,
-0.06284449, -0.574953, -3.918113, 0, 0.9764706, 1, 1,
-0.06248433, 0.3810089, 0.6694618, 0, 0.9686275, 1, 1,
-0.06162146, 0.01419707, -0.9524279, 0, 0.9647059, 1, 1,
-0.05763293, -1.828154, -3.043617, 0, 0.9568627, 1, 1,
-0.05730326, 1.620254, -0.4175579, 0, 0.9529412, 1, 1,
-0.05543109, 0.4793423, -1.387326, 0, 0.945098, 1, 1,
-0.05016259, -2.09834, -5.27741, 0, 0.9411765, 1, 1,
-0.04991635, 1.100373, 0.1875793, 0, 0.9333333, 1, 1,
-0.04672182, -0.6318846, -2.305332, 0, 0.9294118, 1, 1,
-0.0445966, -0.6733226, -2.505935, 0, 0.9215686, 1, 1,
-0.04059666, 0.483411, 0.9680273, 0, 0.9176471, 1, 1,
-0.0335055, -0.2641709, -3.985661, 0, 0.9098039, 1, 1,
-0.02862911, -1.01338, -4.83011, 0, 0.9058824, 1, 1,
-0.02614541, -1.581171, -2.885608, 0, 0.8980392, 1, 1,
-0.02594502, 1.184602, 0.449401, 0, 0.8901961, 1, 1,
-0.02001601, -0.148194, -2.104675, 0, 0.8862745, 1, 1,
-0.01414097, -1.107624, -3.594422, 0, 0.8784314, 1, 1,
-0.01387792, -0.7188938, -4.761899, 0, 0.8745098, 1, 1,
-0.01283218, 1.792464, 0.7258772, 0, 0.8666667, 1, 1,
-0.0127678, -0.3851611, -2.257743, 0, 0.8627451, 1, 1,
-0.01058246, -1.163828, -3.2573, 0, 0.854902, 1, 1,
-0.002974753, -0.2677204, -4.091203, 0, 0.8509804, 1, 1,
-0.002125956, 0.668542, -0.7333798, 0, 0.8431373, 1, 1,
0.0002837448, -0.00156762, 3.99217, 0, 0.8392157, 1, 1,
0.002200906, 0.8934256, 0.06974424, 0, 0.8313726, 1, 1,
0.002472131, 0.8441609, 1.831768, 0, 0.827451, 1, 1,
0.00378877, 1.146677, -1.336803, 0, 0.8196079, 1, 1,
0.0046301, 0.709056, -0.8254458, 0, 0.8156863, 1, 1,
0.005678687, -0.08734242, 2.899192, 0, 0.8078431, 1, 1,
0.006594343, 0.5664828, -0.1215297, 0, 0.8039216, 1, 1,
0.01227508, 0.5593546, 0.4001934, 0, 0.7960784, 1, 1,
0.01499582, -2.570512, 1.749837, 0, 0.7882353, 1, 1,
0.01803963, -0.3607014, 3.964363, 0, 0.7843137, 1, 1,
0.02007656, -0.7918139, 3.473776, 0, 0.7764706, 1, 1,
0.02327989, 0.8710465, 0.2570328, 0, 0.772549, 1, 1,
0.02779319, -0.225227, 2.087959, 0, 0.7647059, 1, 1,
0.02811417, 1.219564, -0.8362718, 0, 0.7607843, 1, 1,
0.03666084, 0.6118841, -0.5518098, 0, 0.7529412, 1, 1,
0.03713148, -0.1363776, 3.770602, 0, 0.7490196, 1, 1,
0.03917835, -1.309487, 2.130365, 0, 0.7411765, 1, 1,
0.0392422, 0.3175805, -0.1696422, 0, 0.7372549, 1, 1,
0.04133572, 1.138247, 0.9911274, 0, 0.7294118, 1, 1,
0.0422483, 0.1540937, 0.09582691, 0, 0.7254902, 1, 1,
0.04514994, 0.781734, 0.1010894, 0, 0.7176471, 1, 1,
0.047865, -0.2525578, 2.163526, 0, 0.7137255, 1, 1,
0.0485853, 1.604814, 0.1425611, 0, 0.7058824, 1, 1,
0.0566408, -3.294914, 2.117555, 0, 0.6980392, 1, 1,
0.05965372, 0.1214776, 2.361781, 0, 0.6941177, 1, 1,
0.06035576, 0.2446612, -0.9271749, 0, 0.6862745, 1, 1,
0.06212771, -0.6667259, 4.48173, 0, 0.682353, 1, 1,
0.06480756, 0.3348463, -0.6669562, 0, 0.6745098, 1, 1,
0.06751286, 0.1454589, 0.8649651, 0, 0.6705883, 1, 1,
0.06759552, -0.03626367, 1.949141, 0, 0.6627451, 1, 1,
0.06911933, -1.344613, 3.990834, 0, 0.6588235, 1, 1,
0.07028774, 0.5498471, 0.1432066, 0, 0.6509804, 1, 1,
0.07334577, 0.9637722, 0.5362365, 0, 0.6470588, 1, 1,
0.07401779, 0.2972467, -1.532114, 0, 0.6392157, 1, 1,
0.07459772, 0.01496531, 1.524278, 0, 0.6352941, 1, 1,
0.07635782, -0.3887527, 2.076121, 0, 0.627451, 1, 1,
0.07750889, 0.5639688, 0.7517263, 0, 0.6235294, 1, 1,
0.07866431, -1.286873, 3.194715, 0, 0.6156863, 1, 1,
0.08349284, -1.168015, 4.005499, 0, 0.6117647, 1, 1,
0.08431295, 0.4729299, 0.3123927, 0, 0.6039216, 1, 1,
0.09263387, -1.240743, 2.434359, 0, 0.5960785, 1, 1,
0.09289373, -0.4517615, 3.666034, 0, 0.5921569, 1, 1,
0.09356866, 1.558498, -0.3996563, 0, 0.5843138, 1, 1,
0.09770181, 0.07409969, 1.998801, 0, 0.5803922, 1, 1,
0.09811395, -1.47893, 3.597914, 0, 0.572549, 1, 1,
0.1002694, 0.747595, 0.6193371, 0, 0.5686275, 1, 1,
0.1004511, 0.06892307, 1.822692, 0, 0.5607843, 1, 1,
0.1006672, 0.01554919, 2.770393, 0, 0.5568628, 1, 1,
0.1043314, 0.1363848, -0.7305427, 0, 0.5490196, 1, 1,
0.1089617, 0.8376095, 0.2419509, 0, 0.5450981, 1, 1,
0.110567, -0.9499983, 2.180825, 0, 0.5372549, 1, 1,
0.1140794, 0.8078359, 1.22008, 0, 0.5333334, 1, 1,
0.1148954, 0.6370714, 0.6603415, 0, 0.5254902, 1, 1,
0.1150438, -0.3962711, 3.484154, 0, 0.5215687, 1, 1,
0.1151262, 0.9007044, -0.5096838, 0, 0.5137255, 1, 1,
0.116308, -0.468234, 2.757527, 0, 0.509804, 1, 1,
0.1194026, 0.1850242, 0.75227, 0, 0.5019608, 1, 1,
0.1254156, 0.4680132, 0.0005944087, 0, 0.4941176, 1, 1,
0.1261235, 1.565359, -1.05397, 0, 0.4901961, 1, 1,
0.1334013, -0.8296971, 3.146484, 0, 0.4823529, 1, 1,
0.136049, -1.433133, 4.317498, 0, 0.4784314, 1, 1,
0.1404424, 1.283909, 1.14082, 0, 0.4705882, 1, 1,
0.1424163, 1.984897, 2.047226, 0, 0.4666667, 1, 1,
0.1466113, -0.6335617, 4.232134, 0, 0.4588235, 1, 1,
0.1466976, 0.6683356, 0.3045028, 0, 0.454902, 1, 1,
0.1503421, 1.124348, 0.4022914, 0, 0.4470588, 1, 1,
0.1527768, -1.966655, 3.991432, 0, 0.4431373, 1, 1,
0.1555341, -0.5656579, 1.461697, 0, 0.4352941, 1, 1,
0.1581193, 0.238471, 1.442411, 0, 0.4313726, 1, 1,
0.1613469, -0.2149982, 2.276684, 0, 0.4235294, 1, 1,
0.1642914, 1.18209, 0.4378186, 0, 0.4196078, 1, 1,
0.1661356, -0.05958002, 1.331609, 0, 0.4117647, 1, 1,
0.166753, -0.1449928, 1.503718, 0, 0.4078431, 1, 1,
0.1687046, -0.06461599, 1.249785, 0, 0.4, 1, 1,
0.1691034, -0.1576284, 1.636642, 0, 0.3921569, 1, 1,
0.1740313, 1.58802, -0.7044938, 0, 0.3882353, 1, 1,
0.174637, -0.1360917, 2.079791, 0, 0.3803922, 1, 1,
0.1856731, 0.7813781, 0.3457643, 0, 0.3764706, 1, 1,
0.191739, 0.8390594, 0.5872482, 0, 0.3686275, 1, 1,
0.1930332, -0.6584688, 2.438138, 0, 0.3647059, 1, 1,
0.1931695, -1.5138, 3.867018, 0, 0.3568628, 1, 1,
0.1982999, 1.84976, 0.7609221, 0, 0.3529412, 1, 1,
0.1999877, 0.648048, 1.485515, 0, 0.345098, 1, 1,
0.2025274, -1.677635, 2.695208, 0, 0.3411765, 1, 1,
0.2052597, 1.234227, 0.4504041, 0, 0.3333333, 1, 1,
0.2059887, 0.207408, 0.03384623, 0, 0.3294118, 1, 1,
0.2074175, -0.3721264, 1.710093, 0, 0.3215686, 1, 1,
0.2075959, 0.7943737, -1.230381, 0, 0.3176471, 1, 1,
0.2082417, -0.06870314, 1.431784, 0, 0.3098039, 1, 1,
0.209351, 1.683972, 1.778345, 0, 0.3058824, 1, 1,
0.2098063, 0.3178076, 0.5265933, 0, 0.2980392, 1, 1,
0.210163, 1.280637, 1.275798, 0, 0.2901961, 1, 1,
0.2116291, -1.428464, 3.33627, 0, 0.2862745, 1, 1,
0.2141808, 1.132513, 1.182204, 0, 0.2784314, 1, 1,
0.217736, 0.33492, 0.4527712, 0, 0.2745098, 1, 1,
0.2208878, -0.6875144, 0.9874753, 0, 0.2666667, 1, 1,
0.2214711, -2.162977, 3.08324, 0, 0.2627451, 1, 1,
0.2238867, 0.5976399, 0.7742797, 0, 0.254902, 1, 1,
0.2316038, 1.45501, 2.264609, 0, 0.2509804, 1, 1,
0.2358895, -0.5019791, 1.970168, 0, 0.2431373, 1, 1,
0.2396351, 0.379071, -0.6707871, 0, 0.2392157, 1, 1,
0.2404248, 1.347396, 0.8605521, 0, 0.2313726, 1, 1,
0.2405538, 0.1137057, 1.105467, 0, 0.227451, 1, 1,
0.2443414, -0.4523744, 2.299562, 0, 0.2196078, 1, 1,
0.2466133, 0.5400211, -0.3895949, 0, 0.2156863, 1, 1,
0.2474347, 0.9022174, -0.9357932, 0, 0.2078431, 1, 1,
0.252711, -1.067917, 3.341525, 0, 0.2039216, 1, 1,
0.2572704, 0.2777174, -0.5427352, 0, 0.1960784, 1, 1,
0.2585371, 0.2038896, 3.103586, 0, 0.1882353, 1, 1,
0.2588001, 1.146844, -1.700503, 0, 0.1843137, 1, 1,
0.2592588, -1.86909, 2.324738, 0, 0.1764706, 1, 1,
0.2676328, 0.3014376, 1.398088, 0, 0.172549, 1, 1,
0.2710965, -0.7316884, 3.395274, 0, 0.1647059, 1, 1,
0.271155, -0.1837669, 3.784983, 0, 0.1607843, 1, 1,
0.2732652, 0.9625416, -1.350481, 0, 0.1529412, 1, 1,
0.273587, 2.628693, -0.4034305, 0, 0.1490196, 1, 1,
0.2803345, 1.151795, -0.4534987, 0, 0.1411765, 1, 1,
0.2811303, 0.5668336, -0.6824157, 0, 0.1372549, 1, 1,
0.2815829, 0.006517715, 0.553103, 0, 0.1294118, 1, 1,
0.2820008, 1.070173, 1.106644, 0, 0.1254902, 1, 1,
0.2882783, -0.9711305, 2.575011, 0, 0.1176471, 1, 1,
0.2885468, 1.131665, 1.131303, 0, 0.1137255, 1, 1,
0.2888114, -0.06960927, 3.040131, 0, 0.1058824, 1, 1,
0.2898841, 0.1056133, 1.769288, 0, 0.09803922, 1, 1,
0.2911732, -0.7824228, 1.351708, 0, 0.09411765, 1, 1,
0.2935728, 1.731361, -1.153194, 0, 0.08627451, 1, 1,
0.293798, 1.370712, -0.730786, 0, 0.08235294, 1, 1,
0.2967353, 0.7569312, 2.496728, 0, 0.07450981, 1, 1,
0.2969382, 1.484642, 1.930328, 0, 0.07058824, 1, 1,
0.3025168, -1.509888, 1.445319, 0, 0.0627451, 1, 1,
0.3052313, 2.462803, 2.391118, 0, 0.05882353, 1, 1,
0.3112561, 1.643854, -0.1285751, 0, 0.05098039, 1, 1,
0.3201017, -0.8567741, 3.164806, 0, 0.04705882, 1, 1,
0.3260055, -2.286898, 3.834642, 0, 0.03921569, 1, 1,
0.326251, 0.5695486, 2.071253, 0, 0.03529412, 1, 1,
0.3279606, 1.721371, 1.320255, 0, 0.02745098, 1, 1,
0.3299612, 0.249851, 0.1809767, 0, 0.02352941, 1, 1,
0.332355, 0.01759687, 0.3630248, 0, 0.01568628, 1, 1,
0.3361634, -1.049176, 2.102429, 0, 0.01176471, 1, 1,
0.3376404, -0.5126746, 2.248961, 0, 0.003921569, 1, 1,
0.3415387, 0.3707744, 0.7290211, 0.003921569, 0, 1, 1,
0.3490191, 0.7695133, 1.196837, 0.007843138, 0, 1, 1,
0.3516959, -0.2288275, 0.98837, 0.01568628, 0, 1, 1,
0.3523448, -0.08112837, 1.62184, 0.01960784, 0, 1, 1,
0.3593985, -0.7751147, 2.717122, 0.02745098, 0, 1, 1,
0.359669, 1.622335, 2.777659, 0.03137255, 0, 1, 1,
0.359825, 0.7698597, -0.1729109, 0.03921569, 0, 1, 1,
0.360268, 0.1577979, 0.4151786, 0.04313726, 0, 1, 1,
0.3653817, -1.578397, 4.044555, 0.05098039, 0, 1, 1,
0.366727, -1.126686, 1.796929, 0.05490196, 0, 1, 1,
0.374543, 0.8314854, 1.868675, 0.0627451, 0, 1, 1,
0.3746991, -0.117902, 1.205216, 0.06666667, 0, 1, 1,
0.3829747, -0.6934621, 3.081189, 0.07450981, 0, 1, 1,
0.3831303, 0.4235268, -0.2900641, 0.07843138, 0, 1, 1,
0.3832178, 0.4228539, 1.146658, 0.08627451, 0, 1, 1,
0.3833503, 0.8941289, 1.203862, 0.09019608, 0, 1, 1,
0.3855355, -1.976057, 2.117911, 0.09803922, 0, 1, 1,
0.3899016, 1.412199, 1.006495, 0.1058824, 0, 1, 1,
0.3912099, 0.5199794, -0.4020392, 0.1098039, 0, 1, 1,
0.3930979, -1.658943, 2.862094, 0.1176471, 0, 1, 1,
0.3937138, -1.626, 2.792085, 0.1215686, 0, 1, 1,
0.3968967, 0.583881, -0.2036241, 0.1294118, 0, 1, 1,
0.3974186, 0.6006938, 0.465817, 0.1333333, 0, 1, 1,
0.3992231, -0.6010796, 2.259849, 0.1411765, 0, 1, 1,
0.4017488, 1.177302, -0.4346064, 0.145098, 0, 1, 1,
0.4029143, 0.2971881, 1.715654, 0.1529412, 0, 1, 1,
0.4035133, -0.8338254, 2.039629, 0.1568628, 0, 1, 1,
0.4152129, -2.272594, 2.330418, 0.1647059, 0, 1, 1,
0.4153817, 0.02712461, 2.450082, 0.1686275, 0, 1, 1,
0.4159471, 0.426641, -0.248182, 0.1764706, 0, 1, 1,
0.4167236, 0.3932386, 0.6232642, 0.1803922, 0, 1, 1,
0.4224286, 0.9278293, 1.163843, 0.1882353, 0, 1, 1,
0.4235895, -1.477586, 1.658201, 0.1921569, 0, 1, 1,
0.4251616, -2.034934, 4.15757, 0.2, 0, 1, 1,
0.4253284, 0.2846791, 1.400731, 0.2078431, 0, 1, 1,
0.4259637, 1.368831, 2.44176, 0.2117647, 0, 1, 1,
0.4280266, -1.342891, 2.294267, 0.2196078, 0, 1, 1,
0.4310152, 1.039535, 1.099358, 0.2235294, 0, 1, 1,
0.4314091, -0.3019548, 1.723675, 0.2313726, 0, 1, 1,
0.4342821, -0.119661, 2.794843, 0.2352941, 0, 1, 1,
0.4456543, -0.7813081, 1.976837, 0.2431373, 0, 1, 1,
0.4481847, -1.922457, 2.119443, 0.2470588, 0, 1, 1,
0.4510598, 0.2474155, 3.461911, 0.254902, 0, 1, 1,
0.4555099, -0.5539703, 3.1101, 0.2588235, 0, 1, 1,
0.455709, 0.3814671, -0.03036922, 0.2666667, 0, 1, 1,
0.4612976, 0.987084, 1.22308, 0.2705882, 0, 1, 1,
0.4624596, -0.0003634029, 2.368022, 0.2784314, 0, 1, 1,
0.4685781, 0.3015922, 0.716596, 0.282353, 0, 1, 1,
0.4698283, -0.01122784, 1.91141, 0.2901961, 0, 1, 1,
0.4727721, -0.2677651, 2.626156, 0.2941177, 0, 1, 1,
0.4760661, -0.5639906, 2.02777, 0.3019608, 0, 1, 1,
0.4789498, 0.3056651, 1.204818, 0.3098039, 0, 1, 1,
0.4794717, 0.1627569, 1.431095, 0.3137255, 0, 1, 1,
0.4843958, -0.6279597, 2.643944, 0.3215686, 0, 1, 1,
0.4858038, -1.42067, 3.234098, 0.3254902, 0, 1, 1,
0.4865164, 0.803014, -0.6335892, 0.3333333, 0, 1, 1,
0.4947146, 0.2911042, 0.6141953, 0.3372549, 0, 1, 1,
0.513741, -0.5543128, 1.945976, 0.345098, 0, 1, 1,
0.5304716, -1.324229, 3.595678, 0.3490196, 0, 1, 1,
0.5503129, -1.269406, 3.447387, 0.3568628, 0, 1, 1,
0.5511711, -0.5380316, 3.575989, 0.3607843, 0, 1, 1,
0.5606177, -0.9339096, 2.58443, 0.3686275, 0, 1, 1,
0.5661165, -1.00927, 2.575032, 0.372549, 0, 1, 1,
0.5688161, 1.518535, 1.289743, 0.3803922, 0, 1, 1,
0.5703502, 1.804702, 0.7075199, 0.3843137, 0, 1, 1,
0.5734139, 0.4140872, 1.850388, 0.3921569, 0, 1, 1,
0.5828974, 1.068126, 2.051368, 0.3960784, 0, 1, 1,
0.5834149, -0.2209884, 3.772848, 0.4039216, 0, 1, 1,
0.5853559, 0.3605319, 2.315776, 0.4117647, 0, 1, 1,
0.595225, -1.453325, 4.527323, 0.4156863, 0, 1, 1,
0.5982112, -0.22583, 3.458859, 0.4235294, 0, 1, 1,
0.5983058, 1.863653, 0.992106, 0.427451, 0, 1, 1,
0.6025035, -0.07955068, 3.019715, 0.4352941, 0, 1, 1,
0.6063894, -0.6597478, 2.806528, 0.4392157, 0, 1, 1,
0.6118592, -1.016402, 2.938168, 0.4470588, 0, 1, 1,
0.6121181, 0.09429187, 1.321769, 0.4509804, 0, 1, 1,
0.6147428, 0.5021185, 1.483157, 0.4588235, 0, 1, 1,
0.6172761, 1.222713, 0.2069853, 0.4627451, 0, 1, 1,
0.6192468, -1.740373, 2.645287, 0.4705882, 0, 1, 1,
0.6206358, -1.301443, 5.212222, 0.4745098, 0, 1, 1,
0.6226484, 1.1401, -0.6292074, 0.4823529, 0, 1, 1,
0.6350952, -1.050545, 2.191051, 0.4862745, 0, 1, 1,
0.6368856, 0.273541, 2.01178, 0.4941176, 0, 1, 1,
0.6389645, 0.6929316, -0.3321157, 0.5019608, 0, 1, 1,
0.6397573, -0.6048718, 2.563136, 0.5058824, 0, 1, 1,
0.6405373, 1.018683, 1.685647, 0.5137255, 0, 1, 1,
0.6450653, 0.9810025, 0.3087639, 0.5176471, 0, 1, 1,
0.6484303, -0.9676056, 2.909796, 0.5254902, 0, 1, 1,
0.6544406, 1.209213, 1.05539, 0.5294118, 0, 1, 1,
0.6545169, 2.435319, 2.115422, 0.5372549, 0, 1, 1,
0.659295, -0.9726561, 2.283871, 0.5411765, 0, 1, 1,
0.6615043, -1.554937, 3.09777, 0.5490196, 0, 1, 1,
0.6621054, 0.02178389, 1.704923, 0.5529412, 0, 1, 1,
0.6624886, -0.2520512, 1.04672, 0.5607843, 0, 1, 1,
0.6674171, -1.208751, 2.387483, 0.5647059, 0, 1, 1,
0.6674274, -2.34271, 1.987032, 0.572549, 0, 1, 1,
0.6676389, 0.2095995, 0.3112482, 0.5764706, 0, 1, 1,
0.6684583, 1.886152, 2.977306, 0.5843138, 0, 1, 1,
0.6715167, -0.04200942, 2.586944, 0.5882353, 0, 1, 1,
0.6721773, 0.1542245, -0.04609398, 0.5960785, 0, 1, 1,
0.6739102, -0.4605145, 1.667814, 0.6039216, 0, 1, 1,
0.6765301, -1.128343, 2.893718, 0.6078432, 0, 1, 1,
0.6794138, -0.7206551, 3.117533, 0.6156863, 0, 1, 1,
0.6809605, -1.353828, 4.319304, 0.6196079, 0, 1, 1,
0.6862662, 0.6181076, -0.3595158, 0.627451, 0, 1, 1,
0.6927457, -0.3167628, 2.866877, 0.6313726, 0, 1, 1,
0.6993513, -0.2325002, 2.056537, 0.6392157, 0, 1, 1,
0.7014798, 0.4444611, 2.344064, 0.6431373, 0, 1, 1,
0.703954, -0.2904087, 2.521446, 0.6509804, 0, 1, 1,
0.7056209, 0.2209218, 1.268162, 0.654902, 0, 1, 1,
0.7158823, 0.3392897, 0.737394, 0.6627451, 0, 1, 1,
0.7162649, 0.7122364, 1.61047, 0.6666667, 0, 1, 1,
0.7170896, -1.074749, 2.469836, 0.6745098, 0, 1, 1,
0.7179559, 0.2362803, 1.580305, 0.6784314, 0, 1, 1,
0.7180616, 1.770552, 1.581981, 0.6862745, 0, 1, 1,
0.7221195, 0.4812647, 1.373171, 0.6901961, 0, 1, 1,
0.7231624, 0.7460965, -0.3291517, 0.6980392, 0, 1, 1,
0.724608, -2.246498, 3.630838, 0.7058824, 0, 1, 1,
0.7246537, 0.7478016, 2.183586, 0.7098039, 0, 1, 1,
0.7259842, -0.1665099, 0.7929361, 0.7176471, 0, 1, 1,
0.7290295, 0.7491904, 0.2378616, 0.7215686, 0, 1, 1,
0.7297078, 3.407473, 0.9528983, 0.7294118, 0, 1, 1,
0.7298605, -0.5816293, 3.211102, 0.7333333, 0, 1, 1,
0.7361766, 1.171239, 1.162498, 0.7411765, 0, 1, 1,
0.7421154, 0.2070803, 1.658067, 0.7450981, 0, 1, 1,
0.7450392, 0.8954449, 1.841591, 0.7529412, 0, 1, 1,
0.7523046, 0.0009004399, 0.4355931, 0.7568628, 0, 1, 1,
0.7541, 1.40892, 1.394201, 0.7647059, 0, 1, 1,
0.7552278, -0.1092158, 1.673806, 0.7686275, 0, 1, 1,
0.7552568, -0.8832085, 2.337772, 0.7764706, 0, 1, 1,
0.7599789, -0.6577934, 3.052134, 0.7803922, 0, 1, 1,
0.7639638, -1.221721, 1.759956, 0.7882353, 0, 1, 1,
0.7646344, -0.0360971, 3.564987, 0.7921569, 0, 1, 1,
0.7665235, -0.4934791, 3.809283, 0.8, 0, 1, 1,
0.7733401, 0.05611857, 1.652712, 0.8078431, 0, 1, 1,
0.7829857, 1.033087, -0.8214994, 0.8117647, 0, 1, 1,
0.7932041, -1.507495, 4.240378, 0.8196079, 0, 1, 1,
0.7933903, 0.3102187, -0.945255, 0.8235294, 0, 1, 1,
0.7945937, 0.02087838, 0.01591192, 0.8313726, 0, 1, 1,
0.7949582, 0.8591176, 0.1343582, 0.8352941, 0, 1, 1,
0.7951353, -0.321836, 3.263334, 0.8431373, 0, 1, 1,
0.8100001, 2.926365, 1.136954, 0.8470588, 0, 1, 1,
0.8100422, 0.26605, -0.9810724, 0.854902, 0, 1, 1,
0.8134323, -0.1296143, -0.05894591, 0.8588235, 0, 1, 1,
0.8166355, -0.7490892, 3.439701, 0.8666667, 0, 1, 1,
0.8169014, -0.5065035, 3.000368, 0.8705882, 0, 1, 1,
0.8185955, 0.3527765, 0.9915054, 0.8784314, 0, 1, 1,
0.8199965, -1.162588, 1.570946, 0.8823529, 0, 1, 1,
0.82652, 0.7655486, 1.752493, 0.8901961, 0, 1, 1,
0.8283277, -1.121897, 2.002809, 0.8941177, 0, 1, 1,
0.8392739, 0.8817332, 2.679592, 0.9019608, 0, 1, 1,
0.8398843, 1.281326, -0.4099924, 0.9098039, 0, 1, 1,
0.8550526, 1.485443, -1.343202, 0.9137255, 0, 1, 1,
0.8570063, -0.3800785, 0.6063319, 0.9215686, 0, 1, 1,
0.8599432, -1.092685, 3.896377, 0.9254902, 0, 1, 1,
0.8714996, -0.4679733, 1.033619, 0.9333333, 0, 1, 1,
0.8744969, 1.137576, 1.584538, 0.9372549, 0, 1, 1,
0.8753992, 1.197268, 0.5356959, 0.945098, 0, 1, 1,
0.876733, 0.3658087, 1.24837, 0.9490196, 0, 1, 1,
0.88015, -0.462945, 2.073777, 0.9568627, 0, 1, 1,
0.8806034, -1.180502, 3.401699, 0.9607843, 0, 1, 1,
0.8812328, 0.6301962, 0.1765719, 0.9686275, 0, 1, 1,
0.8819402, -0.02958196, 0.1379355, 0.972549, 0, 1, 1,
0.8822586, -0.008072517, 1.274055, 0.9803922, 0, 1, 1,
0.8842484, -0.7190632, 1.061156, 0.9843137, 0, 1, 1,
0.8918278, -0.4984273, 1.865188, 0.9921569, 0, 1, 1,
0.8949215, 1.180272, 1.765048, 0.9960784, 0, 1, 1,
0.9049276, 0.2677881, 2.055259, 1, 0, 0.9960784, 1,
0.9063638, 0.854157, 1.293277, 1, 0, 0.9882353, 1,
0.9074955, 2.522475, -0.8633422, 1, 0, 0.9843137, 1,
0.9107387, -0.3603614, 1.632213, 1, 0, 0.9764706, 1,
0.9142289, -0.4542152, 3.55428, 1, 0, 0.972549, 1,
0.9179798, -0.6759163, 1.428389, 1, 0, 0.9647059, 1,
0.9186653, -0.8200933, 0.9716088, 1, 0, 0.9607843, 1,
0.9211441, 2.132908, -0.9392714, 1, 0, 0.9529412, 1,
0.9287469, 0.4375165, 1.027073, 1, 0, 0.9490196, 1,
0.9340254, 0.2432745, -0.7024221, 1, 0, 0.9411765, 1,
0.9362475, 0.719914, -0.06459585, 1, 0, 0.9372549, 1,
0.9450097, -0.03619758, 0.8228764, 1, 0, 0.9294118, 1,
0.9474558, -0.5184319, 3.254247, 1, 0, 0.9254902, 1,
0.9485519, 1.715925, 1.504655, 1, 0, 0.9176471, 1,
0.9511917, -1.272731, 1.911289, 1, 0, 0.9137255, 1,
0.9518392, 0.5920271, -0.008712286, 1, 0, 0.9058824, 1,
0.9544529, -1.769382, 1.714397, 1, 0, 0.9019608, 1,
0.9598123, 0.8615261, 0.7564968, 1, 0, 0.8941177, 1,
0.9629963, 0.6963133, 0.5152549, 1, 0, 0.8862745, 1,
0.9666762, 2.580649, 0.2191064, 1, 0, 0.8823529, 1,
0.97259, 1.48979, 1.190575, 1, 0, 0.8745098, 1,
0.9758164, -1.608116, 3.69919, 1, 0, 0.8705882, 1,
0.9955894, 1.385165, 1.23332, 1, 0, 0.8627451, 1,
1.006591, -0.00178184, 2.850141, 1, 0, 0.8588235, 1,
1.012991, 0.4105167, 1.822064, 1, 0, 0.8509804, 1,
1.014301, 1.920091, 0.2715697, 1, 0, 0.8470588, 1,
1.018737, 0.7462949, 1.322166, 1, 0, 0.8392157, 1,
1.019274, 0.4553102, 2.030771, 1, 0, 0.8352941, 1,
1.026144, -2.414443, 2.211322, 1, 0, 0.827451, 1,
1.027531, 0.5777848, 0.5147377, 1, 0, 0.8235294, 1,
1.032247, -0.2914849, 1.101313, 1, 0, 0.8156863, 1,
1.040503, 0.3484232, 2.206066, 1, 0, 0.8117647, 1,
1.042155, 0.345224, 1.062685, 1, 0, 0.8039216, 1,
1.052689, 0.7394914, -0.4292471, 1, 0, 0.7960784, 1,
1.058486, 1.032088, 1.80697, 1, 0, 0.7921569, 1,
1.060764, 0.3710654, 0.7139631, 1, 0, 0.7843137, 1,
1.06212, -0.7865779, 2.395961, 1, 0, 0.7803922, 1,
1.066118, 0.3787057, -0.1045768, 1, 0, 0.772549, 1,
1.073285, 0.5107461, 2.780599, 1, 0, 0.7686275, 1,
1.074343, -1.044367, 2.377829, 1, 0, 0.7607843, 1,
1.080855, -0.6515072, 2.61667, 1, 0, 0.7568628, 1,
1.085603, -3.099882, 2.407867, 1, 0, 0.7490196, 1,
1.085696, -1.398172, 3.836899, 1, 0, 0.7450981, 1,
1.086725, 0.8914235, 1.956835, 1, 0, 0.7372549, 1,
1.087462, -0.839219, 3.667268, 1, 0, 0.7333333, 1,
1.097606, 2.605468, -0.03785368, 1, 0, 0.7254902, 1,
1.099395, 1.48517, 1.500382, 1, 0, 0.7215686, 1,
1.10643, -1.508999, 1.859637, 1, 0, 0.7137255, 1,
1.110335, -1.121434, 1.537386, 1, 0, 0.7098039, 1,
1.119311, -0.7428039, 3.75475, 1, 0, 0.7019608, 1,
1.119578, 0.1730584, 2.224668, 1, 0, 0.6941177, 1,
1.121548, -1.122797, 1.877203, 1, 0, 0.6901961, 1,
1.124035, -0.339639, 1.172628, 1, 0, 0.682353, 1,
1.13448, 0.3766017, -0.193592, 1, 0, 0.6784314, 1,
1.134632, -1.069862, 2.668516, 1, 0, 0.6705883, 1,
1.136762, 0.5935565, 2.188617, 1, 0, 0.6666667, 1,
1.147354, -0.2266989, 1.767995, 1, 0, 0.6588235, 1,
1.157021, -0.3050097, 0.9303378, 1, 0, 0.654902, 1,
1.164158, -0.3586939, 0.8251581, 1, 0, 0.6470588, 1,
1.169648, 2.57675, 0.6171739, 1, 0, 0.6431373, 1,
1.181947, -0.628522, 1.024834, 1, 0, 0.6352941, 1,
1.195658, -0.6495606, 1.025217, 1, 0, 0.6313726, 1,
1.196357, -0.2451859, 0.8700954, 1, 0, 0.6235294, 1,
1.212915, -0.3880354, 1.245492, 1, 0, 0.6196079, 1,
1.215594, -0.4125931, 0.646015, 1, 0, 0.6117647, 1,
1.22464, -1.351091, 4.151197, 1, 0, 0.6078432, 1,
1.225141, 0.8089983, 1.352674, 1, 0, 0.6, 1,
1.2293, 1.735623, -0.09748386, 1, 0, 0.5921569, 1,
1.230758, 0.08503353, 2.256444, 1, 0, 0.5882353, 1,
1.235103, -0.1058888, 2.265352, 1, 0, 0.5803922, 1,
1.245332, -1.666392, 2.70767, 1, 0, 0.5764706, 1,
1.268989, -0.8728761, 2.672902, 1, 0, 0.5686275, 1,
1.277651, -1.527764, 0.6855373, 1, 0, 0.5647059, 1,
1.277776, 0.3264452, 1.254877, 1, 0, 0.5568628, 1,
1.289724, 1.496294, 0.415963, 1, 0, 0.5529412, 1,
1.297273, 1.520138, 0.4103946, 1, 0, 0.5450981, 1,
1.318318, -1.538073, 3.952156, 1, 0, 0.5411765, 1,
1.322495, 0.3599701, 2.660405, 1, 0, 0.5333334, 1,
1.324763, -0.06629219, 2.501348, 1, 0, 0.5294118, 1,
1.342062, 0.7096797, -0.2946739, 1, 0, 0.5215687, 1,
1.349093, 0.3347627, 1.336137, 1, 0, 0.5176471, 1,
1.351738, 1.52755, 1.271465, 1, 0, 0.509804, 1,
1.35474, -0.3519334, 0.2552202, 1, 0, 0.5058824, 1,
1.357537, -0.4807677, 1.208697, 1, 0, 0.4980392, 1,
1.363566, -1.387892, 3.630388, 1, 0, 0.4901961, 1,
1.37004, 0.1144844, 1.176438, 1, 0, 0.4862745, 1,
1.387424, 0.1303361, 1.306065, 1, 0, 0.4784314, 1,
1.387963, -0.2378665, 2.409537, 1, 0, 0.4745098, 1,
1.388052, 1.6454, 0.2006614, 1, 0, 0.4666667, 1,
1.394643, -0.7750185, -0.1267316, 1, 0, 0.4627451, 1,
1.417694, -0.07757118, -0.4385663, 1, 0, 0.454902, 1,
1.419117, -1.443203, 1.42655, 1, 0, 0.4509804, 1,
1.423122, -0.1096012, 1.218002, 1, 0, 0.4431373, 1,
1.425295, -2.611032, 3.424129, 1, 0, 0.4392157, 1,
1.428622, 0.3317905, 0.4613621, 1, 0, 0.4313726, 1,
1.436251, -1.165755, -0.7537577, 1, 0, 0.427451, 1,
1.448281, 0.1227232, 1.166957, 1, 0, 0.4196078, 1,
1.455084, 0.5351751, 0.6276999, 1, 0, 0.4156863, 1,
1.458525, -0.1275644, 3.130696, 1, 0, 0.4078431, 1,
1.462392, -0.339623, 1.01342, 1, 0, 0.4039216, 1,
1.463102, 0.9296446, 1.525712, 1, 0, 0.3960784, 1,
1.467889, 2.217018, -0.06336313, 1, 0, 0.3882353, 1,
1.474086, -0.523691, 2.187709, 1, 0, 0.3843137, 1,
1.483245, 0.8754095, 0.8488033, 1, 0, 0.3764706, 1,
1.484742, -0.3027603, 2.135079, 1, 0, 0.372549, 1,
1.500363, 0.4318261, -0.133124, 1, 0, 0.3647059, 1,
1.507878, 1.83242, 0.3265458, 1, 0, 0.3607843, 1,
1.533812, 0.06474119, 3.125476, 1, 0, 0.3529412, 1,
1.540572, 1.247071, 1.845608, 1, 0, 0.3490196, 1,
1.54367, -0.8816437, 1.838117, 1, 0, 0.3411765, 1,
1.55904, 0.8069285, 0.06040232, 1, 0, 0.3372549, 1,
1.561593, 0.8883592, 2.832189, 1, 0, 0.3294118, 1,
1.564072, -1.373963, 2.774503, 1, 0, 0.3254902, 1,
1.568001, 1.320006, 0.4318494, 1, 0, 0.3176471, 1,
1.582069, -1.228714, 2.47466, 1, 0, 0.3137255, 1,
1.598112, -0.9048509, 2.101077, 1, 0, 0.3058824, 1,
1.598584, -0.9215798, 1.980649, 1, 0, 0.2980392, 1,
1.59989, -1.661418, 4.167223, 1, 0, 0.2941177, 1,
1.62027, -0.08771957, 2.639336, 1, 0, 0.2862745, 1,
1.631293, -0.671897, 2.468774, 1, 0, 0.282353, 1,
1.647185, 0.8112804, 0.9276262, 1, 0, 0.2745098, 1,
1.650636, -1.040845, 0.8649659, 1, 0, 0.2705882, 1,
1.653071, 0.02582239, 3.528573, 1, 0, 0.2627451, 1,
1.66293, -2.836408, 3.578003, 1, 0, 0.2588235, 1,
1.666932, 1.535035, 0.9926066, 1, 0, 0.2509804, 1,
1.693528, -1.093706, 2.352542, 1, 0, 0.2470588, 1,
1.696361, 0.2145083, 1.259163, 1, 0, 0.2392157, 1,
1.703253, -0.7999105, 2.726679, 1, 0, 0.2352941, 1,
1.707601, -1.063039, 3.600561, 1, 0, 0.227451, 1,
1.710436, -0.2515435, 2.648223, 1, 0, 0.2235294, 1,
1.712079, 0.7968518, 1.009693, 1, 0, 0.2156863, 1,
1.732201, -0.3044625, 2.355837, 1, 0, 0.2117647, 1,
1.740655, 0.1553546, 0.5383079, 1, 0, 0.2039216, 1,
1.747028, 0.1787832, 0.1180686, 1, 0, 0.1960784, 1,
1.755101, -2.409962, 2.773824, 1, 0, 0.1921569, 1,
1.760375, 0.6365163, 1.450491, 1, 0, 0.1843137, 1,
1.765314, 0.3498054, 1.451761, 1, 0, 0.1803922, 1,
1.779033, 1.348793, 1.962445, 1, 0, 0.172549, 1,
1.797259, -1.432634, 1.870351, 1, 0, 0.1686275, 1,
1.861607, 0.2884539, 0.6004751, 1, 0, 0.1607843, 1,
1.8877, -0.7919388, 2.658502, 1, 0, 0.1568628, 1,
1.921562, 0.1740552, 2.446375, 1, 0, 0.1490196, 1,
1.937211, -0.3170104, 2.058488, 1, 0, 0.145098, 1,
1.937231, 0.01722003, 1.830256, 1, 0, 0.1372549, 1,
1.972584, 1.195808, 1.976087, 1, 0, 0.1333333, 1,
1.998259, 0.8664892, 0.6427094, 1, 0, 0.1254902, 1,
2.059296, -1.948107, 1.701095, 1, 0, 0.1215686, 1,
2.069635, -0.519146, 3.027775, 1, 0, 0.1137255, 1,
2.082642, 0.1967821, 0.9098989, 1, 0, 0.1098039, 1,
2.0961, 1.283616, -0.7173449, 1, 0, 0.1019608, 1,
2.118622, -0.4106009, -0.1279856, 1, 0, 0.09411765, 1,
2.147792, 0.2647175, 1.683988, 1, 0, 0.09019608, 1,
2.155028, -0.3287873, 4.346442, 1, 0, 0.08235294, 1,
2.166587, 1.385432, 0.8727155, 1, 0, 0.07843138, 1,
2.171365, -0.1965598, 2.416551, 1, 0, 0.07058824, 1,
2.289701, -0.2308136, 2.862179, 1, 0, 0.06666667, 1,
2.354918, -1.183228, 1.599793, 1, 0, 0.05882353, 1,
2.397337, 0.3830829, 3.468465, 1, 0, 0.05490196, 1,
2.419943, 0.6533529, 1.796967, 1, 0, 0.04705882, 1,
2.436725, -0.4519524, 2.867109, 1, 0, 0.04313726, 1,
2.583711, -0.7015502, 2.928998, 1, 0, 0.03529412, 1,
2.661463, 1.592513, 1.439492, 1, 0, 0.03137255, 1,
2.672827, 1.57802, 0.4791638, 1, 0, 0.02352941, 1,
2.803202, 0.02407005, 1.421057, 1, 0, 0.01960784, 1,
2.805727, 0.06419509, 2.157671, 1, 0, 0.01176471, 1,
3.940011, -0.5691946, 2.556086, 1, 0, 0.007843138, 1
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
0.528324, -4.430969, -7.055402, 0, -0.5, 0.5, 0.5,
0.528324, -4.430969, -7.055402, 1, -0.5, 0.5, 0.5,
0.528324, -4.430969, -7.055402, 1, 1.5, 0.5, 0.5,
0.528324, -4.430969, -7.055402, 0, 1.5, 0.5, 0.5
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
-4.039925, 0.05627942, -7.055402, 0, -0.5, 0.5, 0.5,
-4.039925, 0.05627942, -7.055402, 1, -0.5, 0.5, 0.5,
-4.039925, 0.05627942, -7.055402, 1, 1.5, 0.5, 0.5,
-4.039925, 0.05627942, -7.055402, 0, 1.5, 0.5, 0.5
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
-4.039925, -4.430969, -0.03259373, 0, -0.5, 0.5, 0.5,
-4.039925, -4.430969, -0.03259373, 1, -0.5, 0.5, 0.5,
-4.039925, -4.430969, -0.03259373, 1, 1.5, 0.5, 0.5,
-4.039925, -4.430969, -0.03259373, 0, 1.5, 0.5, 0.5
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
-2, -3.39545, -5.434754,
3, -3.39545, -5.434754,
-2, -3.39545, -5.434754,
-2, -3.568037, -5.704862,
-1, -3.39545, -5.434754,
-1, -3.568037, -5.704862,
0, -3.39545, -5.434754,
0, -3.568037, -5.704862,
1, -3.39545, -5.434754,
1, -3.568037, -5.704862,
2, -3.39545, -5.434754,
2, -3.568037, -5.704862,
3, -3.39545, -5.434754,
3, -3.568037, -5.704862
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
-2, -3.91321, -6.245078, 0, -0.5, 0.5, 0.5,
-2, -3.91321, -6.245078, 1, -0.5, 0.5, 0.5,
-2, -3.91321, -6.245078, 1, 1.5, 0.5, 0.5,
-2, -3.91321, -6.245078, 0, 1.5, 0.5, 0.5,
-1, -3.91321, -6.245078, 0, -0.5, 0.5, 0.5,
-1, -3.91321, -6.245078, 1, -0.5, 0.5, 0.5,
-1, -3.91321, -6.245078, 1, 1.5, 0.5, 0.5,
-1, -3.91321, -6.245078, 0, 1.5, 0.5, 0.5,
0, -3.91321, -6.245078, 0, -0.5, 0.5, 0.5,
0, -3.91321, -6.245078, 1, -0.5, 0.5, 0.5,
0, -3.91321, -6.245078, 1, 1.5, 0.5, 0.5,
0, -3.91321, -6.245078, 0, 1.5, 0.5, 0.5,
1, -3.91321, -6.245078, 0, -0.5, 0.5, 0.5,
1, -3.91321, -6.245078, 1, -0.5, 0.5, 0.5,
1, -3.91321, -6.245078, 1, 1.5, 0.5, 0.5,
1, -3.91321, -6.245078, 0, 1.5, 0.5, 0.5,
2, -3.91321, -6.245078, 0, -0.5, 0.5, 0.5,
2, -3.91321, -6.245078, 1, -0.5, 0.5, 0.5,
2, -3.91321, -6.245078, 1, 1.5, 0.5, 0.5,
2, -3.91321, -6.245078, 0, 1.5, 0.5, 0.5,
3, -3.91321, -6.245078, 0, -0.5, 0.5, 0.5,
3, -3.91321, -6.245078, 1, -0.5, 0.5, 0.5,
3, -3.91321, -6.245078, 1, 1.5, 0.5, 0.5,
3, -3.91321, -6.245078, 0, 1.5, 0.5, 0.5
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
-2.985713, -3, -5.434754,
-2.985713, 3, -5.434754,
-2.985713, -3, -5.434754,
-3.161415, -3, -5.704862,
-2.985713, -2, -5.434754,
-3.161415, -2, -5.704862,
-2.985713, -1, -5.434754,
-3.161415, -1, -5.704862,
-2.985713, 0, -5.434754,
-3.161415, 0, -5.704862,
-2.985713, 1, -5.434754,
-3.161415, 1, -5.704862,
-2.985713, 2, -5.434754,
-3.161415, 2, -5.704862,
-2.985713, 3, -5.434754,
-3.161415, 3, -5.704862
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
-3.512819, -3, -6.245078, 0, -0.5, 0.5, 0.5,
-3.512819, -3, -6.245078, 1, -0.5, 0.5, 0.5,
-3.512819, -3, -6.245078, 1, 1.5, 0.5, 0.5,
-3.512819, -3, -6.245078, 0, 1.5, 0.5, 0.5,
-3.512819, -2, -6.245078, 0, -0.5, 0.5, 0.5,
-3.512819, -2, -6.245078, 1, -0.5, 0.5, 0.5,
-3.512819, -2, -6.245078, 1, 1.5, 0.5, 0.5,
-3.512819, -2, -6.245078, 0, 1.5, 0.5, 0.5,
-3.512819, -1, -6.245078, 0, -0.5, 0.5, 0.5,
-3.512819, -1, -6.245078, 1, -0.5, 0.5, 0.5,
-3.512819, -1, -6.245078, 1, 1.5, 0.5, 0.5,
-3.512819, -1, -6.245078, 0, 1.5, 0.5, 0.5,
-3.512819, 0, -6.245078, 0, -0.5, 0.5, 0.5,
-3.512819, 0, -6.245078, 1, -0.5, 0.5, 0.5,
-3.512819, 0, -6.245078, 1, 1.5, 0.5, 0.5,
-3.512819, 0, -6.245078, 0, 1.5, 0.5, 0.5,
-3.512819, 1, -6.245078, 0, -0.5, 0.5, 0.5,
-3.512819, 1, -6.245078, 1, -0.5, 0.5, 0.5,
-3.512819, 1, -6.245078, 1, 1.5, 0.5, 0.5,
-3.512819, 1, -6.245078, 0, 1.5, 0.5, 0.5,
-3.512819, 2, -6.245078, 0, -0.5, 0.5, 0.5,
-3.512819, 2, -6.245078, 1, -0.5, 0.5, 0.5,
-3.512819, 2, -6.245078, 1, 1.5, 0.5, 0.5,
-3.512819, 2, -6.245078, 0, 1.5, 0.5, 0.5,
-3.512819, 3, -6.245078, 0, -0.5, 0.5, 0.5,
-3.512819, 3, -6.245078, 1, -0.5, 0.5, 0.5,
-3.512819, 3, -6.245078, 1, 1.5, 0.5, 0.5,
-3.512819, 3, -6.245078, 0, 1.5, 0.5, 0.5
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
-2.985713, -3.39545, -4,
-2.985713, -3.39545, 4,
-2.985713, -3.39545, -4,
-3.161415, -3.568037, -4,
-2.985713, -3.39545, -2,
-3.161415, -3.568037, -2,
-2.985713, -3.39545, 0,
-3.161415, -3.568037, 0,
-2.985713, -3.39545, 2,
-3.161415, -3.568037, 2,
-2.985713, -3.39545, 4,
-3.161415, -3.568037, 4
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
-3.512819, -3.91321, -4, 0, -0.5, 0.5, 0.5,
-3.512819, -3.91321, -4, 1, -0.5, 0.5, 0.5,
-3.512819, -3.91321, -4, 1, 1.5, 0.5, 0.5,
-3.512819, -3.91321, -4, 0, 1.5, 0.5, 0.5,
-3.512819, -3.91321, -2, 0, -0.5, 0.5, 0.5,
-3.512819, -3.91321, -2, 1, -0.5, 0.5, 0.5,
-3.512819, -3.91321, -2, 1, 1.5, 0.5, 0.5,
-3.512819, -3.91321, -2, 0, 1.5, 0.5, 0.5,
-3.512819, -3.91321, 0, 0, -0.5, 0.5, 0.5,
-3.512819, -3.91321, 0, 1, -0.5, 0.5, 0.5,
-3.512819, -3.91321, 0, 1, 1.5, 0.5, 0.5,
-3.512819, -3.91321, 0, 0, 1.5, 0.5, 0.5,
-3.512819, -3.91321, 2, 0, -0.5, 0.5, 0.5,
-3.512819, -3.91321, 2, 1, -0.5, 0.5, 0.5,
-3.512819, -3.91321, 2, 1, 1.5, 0.5, 0.5,
-3.512819, -3.91321, 2, 0, 1.5, 0.5, 0.5,
-3.512819, -3.91321, 4, 0, -0.5, 0.5, 0.5,
-3.512819, -3.91321, 4, 1, -0.5, 0.5, 0.5,
-3.512819, -3.91321, 4, 1, 1.5, 0.5, 0.5,
-3.512819, -3.91321, 4, 0, 1.5, 0.5, 0.5
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
-2.985713, -3.39545, -5.434754,
-2.985713, 3.508009, -5.434754,
-2.985713, -3.39545, 5.369566,
-2.985713, 3.508009, 5.369566,
-2.985713, -3.39545, -5.434754,
-2.985713, -3.39545, 5.369566,
-2.985713, 3.508009, -5.434754,
-2.985713, 3.508009, 5.369566,
-2.985713, -3.39545, -5.434754,
4.042361, -3.39545, -5.434754,
-2.985713, -3.39545, 5.369566,
4.042361, -3.39545, 5.369566,
-2.985713, 3.508009, -5.434754,
4.042361, 3.508009, -5.434754,
-2.985713, 3.508009, 5.369566,
4.042361, 3.508009, 5.369566,
4.042361, -3.39545, -5.434754,
4.042361, 3.508009, -5.434754,
4.042361, -3.39545, 5.369566,
4.042361, 3.508009, 5.369566,
4.042361, -3.39545, -5.434754,
4.042361, -3.39545, 5.369566,
4.042361, 3.508009, -5.434754,
4.042361, 3.508009, 5.369566
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
var radius = 7.807536;
var distance = 34.73661;
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
mvMatrix.translate( -0.528324, -0.05627942, 0.03259373 );
mvMatrix.scale( 1.201134, 1.222816, 0.7813227 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.73661);
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
dimefox<-read.table("dimefox.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-dimefox$V2
```

```
## Error in eval(expr, envir, enclos): object 'dimefox' not found
```

```r
y<-dimefox$V3
```

```
## Error in eval(expr, envir, enclos): object 'dimefox' not found
```

```r
z<-dimefox$V4
```

```
## Error in eval(expr, envir, enclos): object 'dimefox' not found
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
-2.883363, -0.3593458, 0.3988296, 0, 0, 1, 1, 1,
-2.568938, 1.053174, -2.609195, 1, 0, 0, 1, 1,
-2.542216, 0.08829471, -2.209094, 1, 0, 0, 1, 1,
-2.467414, -0.3459393, -1.772644, 1, 0, 0, 1, 1,
-2.426626, 0.4152521, -2.397442, 1, 0, 0, 1, 1,
-2.405627, -0.6185056, -2.255365, 1, 0, 0, 1, 1,
-2.395192, -0.5922357, -2.30249, 0, 0, 0, 1, 1,
-2.225082, -0.5213084, -0.9406096, 0, 0, 0, 1, 1,
-2.197363, 1.586453, -1.070368, 0, 0, 0, 1, 1,
-2.193897, 0.5757103, -1.286769, 0, 0, 0, 1, 1,
-2.157851, -0.5864564, -1.946103, 0, 0, 0, 1, 1,
-2.150051, 0.7439074, -2.011035, 0, 0, 0, 1, 1,
-2.149915, 1.123757, -1.141997, 0, 0, 0, 1, 1,
-2.104653, -1.058111, -2.418628, 1, 1, 1, 1, 1,
-2.05062, -2.734201, -3.419822, 1, 1, 1, 1, 1,
-2.047813, 1.176202, 0.4115103, 1, 1, 1, 1, 1,
-2.032726, -1.377063, -2.375347, 1, 1, 1, 1, 1,
-2.007467, 1.409813, -2.49957, 1, 1, 1, 1, 1,
-1.986651, 0.1593843, -1.252926, 1, 1, 1, 1, 1,
-1.975027, -0.3564728, -1.206778, 1, 1, 1, 1, 1,
-1.964288, 1.555574, 0.2406647, 1, 1, 1, 1, 1,
-1.958774, 1.066929, -0.3180744, 1, 1, 1, 1, 1,
-1.95231, -0.8112961, -1.928472, 1, 1, 1, 1, 1,
-1.945023, 0.6250243, -1.671323, 1, 1, 1, 1, 1,
-1.944286, 1.095061, -1.673165, 1, 1, 1, 1, 1,
-1.934386, 0.5188467, -1.098051, 1, 1, 1, 1, 1,
-1.913156, -0.08021247, 0.5156581, 1, 1, 1, 1, 1,
-1.884281, -0.4901297, -1.81049, 1, 1, 1, 1, 1,
-1.85411, -1.278243, -2.508898, 0, 0, 1, 1, 1,
-1.846157, 0.422113, -0.5833042, 1, 0, 0, 1, 1,
-1.819117, -1.330367, 0.251488, 1, 0, 0, 1, 1,
-1.787323, -1.208145, -2.368725, 1, 0, 0, 1, 1,
-1.7826, 0.8638125, -1.036988, 1, 0, 0, 1, 1,
-1.674323, -0.2790105, -1.268353, 1, 0, 0, 1, 1,
-1.656197, 0.06846328, -0.8570471, 0, 0, 0, 1, 1,
-1.632918, -0.2567453, -0.5742103, 0, 0, 0, 1, 1,
-1.624348, 0.119413, -2.087236, 0, 0, 0, 1, 1,
-1.616532, -0.2900122, -1.62102, 0, 0, 0, 1, 1,
-1.61596, -0.2747852, -0.5577149, 0, 0, 0, 1, 1,
-1.612518, -1.312977, -1.79994, 0, 0, 0, 1, 1,
-1.604306, 1.19858, -1.296032, 0, 0, 0, 1, 1,
-1.589895, -0.6632581, -1.873663, 1, 1, 1, 1, 1,
-1.564205, 0.675796, 0.1244245, 1, 1, 1, 1, 1,
-1.558903, 1.661226, -1.597721, 1, 1, 1, 1, 1,
-1.558704, -0.1295843, -0.8550372, 1, 1, 1, 1, 1,
-1.555294, 0.2188929, -1.846004, 1, 1, 1, 1, 1,
-1.546085, 0.05959979, -0.3771391, 1, 1, 1, 1, 1,
-1.543576, -1.069433, -0.9008774, 1, 1, 1, 1, 1,
-1.541596, 1.455447, 0.6150178, 1, 1, 1, 1, 1,
-1.540707, 1.517161, -1.254963, 1, 1, 1, 1, 1,
-1.534397, 0.1566098, -2.331241, 1, 1, 1, 1, 1,
-1.514874, -0.9213027, -1.708493, 1, 1, 1, 1, 1,
-1.511605, 0.02085392, -0.5196863, 1, 1, 1, 1, 1,
-1.511599, -0.3612978, -2.630969, 1, 1, 1, 1, 1,
-1.509565, 0.9562845, -0.4000296, 1, 1, 1, 1, 1,
-1.498596, 0.3613384, -3.386182, 1, 1, 1, 1, 1,
-1.46989, 1.084578, 0.3497415, 0, 0, 1, 1, 1,
-1.46656, -0.5467532, -0.9444196, 1, 0, 0, 1, 1,
-1.464527, 0.0588598, -2.956831, 1, 0, 0, 1, 1,
-1.447444, -1.180135, -0.1461812, 1, 0, 0, 1, 1,
-1.429751, -0.151248, -1.994606, 1, 0, 0, 1, 1,
-1.427345, 0.4696297, -0.04167966, 1, 0, 0, 1, 1,
-1.425713, 0.9683684, -0.5498647, 0, 0, 0, 1, 1,
-1.424246, 0.1243906, -0.7846975, 0, 0, 0, 1, 1,
-1.422557, -0.01532543, -1.709223, 0, 0, 0, 1, 1,
-1.419526, 0.04890078, -1.174525, 0, 0, 0, 1, 1,
-1.402547, 0.4528799, -2.194068, 0, 0, 0, 1, 1,
-1.391021, -1.387798, -2.42695, 0, 0, 0, 1, 1,
-1.376279, 0.1307963, -1.041298, 0, 0, 0, 1, 1,
-1.371379, 0.1358493, -1.760959, 1, 1, 1, 1, 1,
-1.368931, 0.956889, 1.357052, 1, 1, 1, 1, 1,
-1.365267, -0.2837653, -2.006949, 1, 1, 1, 1, 1,
-1.361332, 0.3272627, -1.10813, 1, 1, 1, 1, 1,
-1.360373, -0.2222344, -1.746539, 1, 1, 1, 1, 1,
-1.346147, -1.062194, -2.192909, 1, 1, 1, 1, 1,
-1.326445, 0.2549217, 0.1578273, 1, 1, 1, 1, 1,
-1.325557, 0.2308662, -1.487131, 1, 1, 1, 1, 1,
-1.317578, 0.04435216, -1.156867, 1, 1, 1, 1, 1,
-1.30985, -0.2154008, -2.451434, 1, 1, 1, 1, 1,
-1.304872, 2.116524, -0.2149736, 1, 1, 1, 1, 1,
-1.298697, -0.07729645, -1.272764, 1, 1, 1, 1, 1,
-1.288044, 1.975701, -1.774209, 1, 1, 1, 1, 1,
-1.284234, -0.04380577, -0.6471764, 1, 1, 1, 1, 1,
-1.272997, 0.7489814, -1.646446, 1, 1, 1, 1, 1,
-1.256959, 0.6230668, -0.7596486, 0, 0, 1, 1, 1,
-1.24922, -1.791183, -0.1987713, 1, 0, 0, 1, 1,
-1.247247, 1.134496, -1.09416, 1, 0, 0, 1, 1,
-1.246695, 0.8067997, -2.132137, 1, 0, 0, 1, 1,
-1.229119, -0.54927, -2.26988, 1, 0, 0, 1, 1,
-1.220705, 0.1031284, -2.686601, 1, 0, 0, 1, 1,
-1.212445, -0.09990038, -2.536598, 0, 0, 0, 1, 1,
-1.199521, -0.176823, -1.742821, 0, 0, 0, 1, 1,
-1.197631, 0.9120463, -0.4380407, 0, 0, 0, 1, 1,
-1.190104, -1.491516, -1.545116, 0, 0, 0, 1, 1,
-1.188639, 0.9448858, -1.424767, 0, 0, 0, 1, 1,
-1.185761, 1.370251, -0.3164738, 0, 0, 0, 1, 1,
-1.181026, -1.331177, -0.697027, 0, 0, 0, 1, 1,
-1.17918, -0.4772048, -1.579851, 1, 1, 1, 1, 1,
-1.17877, 2.111232, -0.2315847, 1, 1, 1, 1, 1,
-1.178312, 0.1323258, 1.279882, 1, 1, 1, 1, 1,
-1.172092, 1.929306, -0.5748257, 1, 1, 1, 1, 1,
-1.170795, -0.1465701, -3.474011, 1, 1, 1, 1, 1,
-1.166731, -0.5124559, -2.255236, 1, 1, 1, 1, 1,
-1.157181, -0.2756311, -3.123611, 1, 1, 1, 1, 1,
-1.143698, -0.6523514, -3.014503, 1, 1, 1, 1, 1,
-1.141746, 0.8319539, -1.942405, 1, 1, 1, 1, 1,
-1.140942, 1.079422, -0.1949848, 1, 1, 1, 1, 1,
-1.132365, -0.1792641, -1.009849, 1, 1, 1, 1, 1,
-1.130822, 1.083975, -1.117437, 1, 1, 1, 1, 1,
-1.106873, 0.6005316, 0.1720686, 1, 1, 1, 1, 1,
-1.106786, 1.194479, -1.167178, 1, 1, 1, 1, 1,
-1.105411, -0.7019611, -2.242186, 1, 1, 1, 1, 1,
-1.105369, 0.1568861, -2.635123, 0, 0, 1, 1, 1,
-1.095167, -1.565959, -2.630677, 1, 0, 0, 1, 1,
-1.09204, 0.794691, -0.6498025, 1, 0, 0, 1, 1,
-1.091948, -1.387267, -3.063991, 1, 0, 0, 1, 1,
-1.088112, -1.151994, -2.778368, 1, 0, 0, 1, 1,
-1.077692, 0.7119592, -1.666851, 1, 0, 0, 1, 1,
-1.074653, 1.118274, 0.8758699, 0, 0, 0, 1, 1,
-1.071214, 1.562455, 0.05163531, 0, 0, 0, 1, 1,
-1.066393, -1.147199, -2.258064, 0, 0, 0, 1, 1,
-1.060388, -2.404954, -1.567594, 0, 0, 0, 1, 1,
-1.056529, -0.5272362, -2.791019, 0, 0, 0, 1, 1,
-1.05559, 0.6820837, 0.02961166, 0, 0, 0, 1, 1,
-1.054043, 0.7902636, 0.8090581, 0, 0, 0, 1, 1,
-1.053367, 0.571056, -0.4289298, 1, 1, 1, 1, 1,
-1.053156, -0.3643672, -1.464815, 1, 1, 1, 1, 1,
-1.051082, -0.2273416, -2.151403, 1, 1, 1, 1, 1,
-1.037385, -1.038626, -1.540885, 1, 1, 1, 1, 1,
-1.036147, -2.744859, -2.724701, 1, 1, 1, 1, 1,
-1.0342, -0.3614609, -1.641559, 1, 1, 1, 1, 1,
-1.030977, 2.77803, -1.052881, 1, 1, 1, 1, 1,
-1.027627, 1.522202, 0.6267547, 1, 1, 1, 1, 1,
-1.027473, -0.6019599, -2.648029, 1, 1, 1, 1, 1,
-1.016855, -1.045901, -1.732643, 1, 1, 1, 1, 1,
-1.016709, 0.7051417, 0.3903609, 1, 1, 1, 1, 1,
-1.012482, 0.2333959, -1.547054, 1, 1, 1, 1, 1,
-1.010222, 0.1044998, 0.5546093, 1, 1, 1, 1, 1,
-1.008777, -0.8738827, -1.006059, 1, 1, 1, 1, 1,
-0.9999808, 0.5319729, -3.148595, 1, 1, 1, 1, 1,
-0.9955361, -1.33873, -1.12617, 0, 0, 1, 1, 1,
-0.9950829, -1.870549, -3.721869, 1, 0, 0, 1, 1,
-0.9920174, -1.11188, -2.904931, 1, 0, 0, 1, 1,
-0.9919167, -0.3773773, -2.034445, 1, 0, 0, 1, 1,
-0.9910754, 1.533917, 0.1430626, 1, 0, 0, 1, 1,
-0.9750106, -0.8114553, -2.734878, 1, 0, 0, 1, 1,
-0.9676924, 0.2736103, 0.3321438, 0, 0, 0, 1, 1,
-0.9668335, -1.262925, -1.889571, 0, 0, 0, 1, 1,
-0.9654424, -1.130016, -1.338572, 0, 0, 0, 1, 1,
-0.965146, 0.2282581, -1.805263, 0, 0, 0, 1, 1,
-0.951018, -0.9336808, -1.137926, 0, 0, 0, 1, 1,
-0.9494591, -0.02262044, -1.443941, 0, 0, 0, 1, 1,
-0.942717, -0.2851682, -2.259518, 0, 0, 0, 1, 1,
-0.9245725, 0.3571819, -1.263162, 1, 1, 1, 1, 1,
-0.9224511, -0.01547833, -2.066458, 1, 1, 1, 1, 1,
-0.9211234, 0.4349935, 0.729805, 1, 1, 1, 1, 1,
-0.9118352, -1.762876, -4.339009, 1, 1, 1, 1, 1,
-0.9116634, 0.07008822, -0.2010981, 1, 1, 1, 1, 1,
-0.909728, -1.741835, -2.660141, 1, 1, 1, 1, 1,
-0.9089149, -1.041362, -1.445912, 1, 1, 1, 1, 1,
-0.8989665, -0.2599323, -1.726753, 1, 1, 1, 1, 1,
-0.8952337, -1.426257, -2.472601, 1, 1, 1, 1, 1,
-0.8930258, 0.7297971, -0.774761, 1, 1, 1, 1, 1,
-0.8889453, 0.5747223, -3.044414, 1, 1, 1, 1, 1,
-0.8887731, 0.5184935, -2.853112, 1, 1, 1, 1, 1,
-0.8848938, 2.15082, -0.7912351, 1, 1, 1, 1, 1,
-0.8829288, 1.253013, 0.3233238, 1, 1, 1, 1, 1,
-0.8813775, -0.1945316, -2.024858, 1, 1, 1, 1, 1,
-0.8800673, -0.7884007, -0.8801314, 0, 0, 1, 1, 1,
-0.8777221, -0.8303667, -2.331688, 1, 0, 0, 1, 1,
-0.8681099, -1.171292, -1.080603, 1, 0, 0, 1, 1,
-0.8674837, 2.164324, -0.2051099, 1, 0, 0, 1, 1,
-0.8621335, 1.635631, 0.03035347, 1, 0, 0, 1, 1,
-0.8607609, 0.2186692, -1.256259, 1, 0, 0, 1, 1,
-0.8602594, 0.6161739, -1.65959, 0, 0, 0, 1, 1,
-0.8545732, -0.1094126, -2.070859, 0, 0, 0, 1, 1,
-0.8497205, -0.5628495, -2.331733, 0, 0, 0, 1, 1,
-0.8470219, 0.7719142, 1.318489, 0, 0, 0, 1, 1,
-0.8467068, 0.2029417, -1.018509, 0, 0, 0, 1, 1,
-0.8421643, 1.137688, -0.9481946, 0, 0, 0, 1, 1,
-0.8384699, 0.1749109, -1.589659, 0, 0, 0, 1, 1,
-0.8258011, 0.02767153, -3.339629, 1, 1, 1, 1, 1,
-0.8208839, -1.285198, -3.52033, 1, 1, 1, 1, 1,
-0.8182098, 1.106955, -1.609403, 1, 1, 1, 1, 1,
-0.8178232, 0.01955229, -2.729946, 1, 1, 1, 1, 1,
-0.8157503, -0.2840967, -2.656864, 1, 1, 1, 1, 1,
-0.813467, -0.06653506, -1.894391, 1, 1, 1, 1, 1,
-0.8058687, -1.530394, -3.557946, 1, 1, 1, 1, 1,
-0.799471, -0.5183885, -2.229743, 1, 1, 1, 1, 1,
-0.7932453, 0.1336516, -2.92194, 1, 1, 1, 1, 1,
-0.7926824, -1.387736, -0.9162808, 1, 1, 1, 1, 1,
-0.7890042, 0.2338731, -2.013435, 1, 1, 1, 1, 1,
-0.7867669, -2.814917, -3.087127, 1, 1, 1, 1, 1,
-0.7827753, -0.6470776, -2.77612, 1, 1, 1, 1, 1,
-0.7750441, -1.626407, -2.769555, 1, 1, 1, 1, 1,
-0.7739283, 0.1085005, -1.438142, 1, 1, 1, 1, 1,
-0.7723625, 0.6532552, -3.116572, 0, 0, 1, 1, 1,
-0.7689516, -1.535353, -1.323998, 1, 0, 0, 1, 1,
-0.7687957, 0.6528562, -1.473947, 1, 0, 0, 1, 1,
-0.7662615, 0.4063382, -1.826928, 1, 0, 0, 1, 1,
-0.7510089, -0.4840349, -2.251173, 1, 0, 0, 1, 1,
-0.7492557, 0.23622, -0.356762, 1, 0, 0, 1, 1,
-0.7440757, 1.45748, -0.5629182, 0, 0, 0, 1, 1,
-0.742906, -0.3490936, -1.27212, 0, 0, 0, 1, 1,
-0.7415845, -0.2614827, -2.317291, 0, 0, 0, 1, 1,
-0.7407789, -1.199511, -3.022894, 0, 0, 0, 1, 1,
-0.7399764, 0.07515354, -3.054417, 0, 0, 0, 1, 1,
-0.7386643, -1.114128, -3.48857, 0, 0, 0, 1, 1,
-0.7375467, 0.5582412, -0.699195, 0, 0, 0, 1, 1,
-0.7368683, 1.172121, -0.9545717, 1, 1, 1, 1, 1,
-0.7348072, 0.06032751, -2.031912, 1, 1, 1, 1, 1,
-0.7329771, -1.035968, -3.065195, 1, 1, 1, 1, 1,
-0.7311932, 0.7422638, -0.9995324, 1, 1, 1, 1, 1,
-0.7290557, -0.8074021, -3.064, 1, 1, 1, 1, 1,
-0.7230521, -1.28862, -3.805861, 1, 1, 1, 1, 1,
-0.7218485, -1.025004, -1.484456, 1, 1, 1, 1, 1,
-0.7134438, 0.538074, -1.296322, 1, 1, 1, 1, 1,
-0.7120784, -1.152833, -3.562014, 1, 1, 1, 1, 1,
-0.7110645, -0.7108681, -2.426759, 1, 1, 1, 1, 1,
-0.7085146, 0.6433555, -0.7112311, 1, 1, 1, 1, 1,
-0.7068888, 1.297708, -1.021564, 1, 1, 1, 1, 1,
-0.7034062, -1.066816, -3.173422, 1, 1, 1, 1, 1,
-0.7015058, -0.5329568, -2.054982, 1, 1, 1, 1, 1,
-0.6991088, 1.598467, -0.03745839, 1, 1, 1, 1, 1,
-0.6961007, -0.4326644, -1.077808, 0, 0, 1, 1, 1,
-0.6947187, -0.1550027, -1.841194, 1, 0, 0, 1, 1,
-0.6936989, 0.7510481, -1.008638, 1, 0, 0, 1, 1,
-0.6928537, -0.5620188, -3.210741, 1, 0, 0, 1, 1,
-0.6926256, -0.5141298, -2.211861, 1, 0, 0, 1, 1,
-0.6898245, 1.041039, 0.2634534, 1, 0, 0, 1, 1,
-0.6809196, -0.8500921, -1.634613, 0, 0, 0, 1, 1,
-0.6757193, -0.8022935, -1.852154, 0, 0, 0, 1, 1,
-0.6756436, 0.614756, -1.851381, 0, 0, 0, 1, 1,
-0.6690563, 0.3515035, 0.4297085, 0, 0, 0, 1, 1,
-0.6688195, 1.436144, -0.7728866, 0, 0, 0, 1, 1,
-0.6647702, 0.2823285, -1.762169, 0, 0, 0, 1, 1,
-0.6609953, -0.6351956, -1.308747, 0, 0, 0, 1, 1,
-0.6592741, 0.6197889, -0.1511528, 1, 1, 1, 1, 1,
-0.656994, -0.859208, -2.53984, 1, 1, 1, 1, 1,
-0.6520022, -1.58746, -2.725451, 1, 1, 1, 1, 1,
-0.6507174, 1.00241, -1.590012, 1, 1, 1, 1, 1,
-0.6480984, -1.570755, -3.328549, 1, 1, 1, 1, 1,
-0.6431175, -0.4157523, -2.287007, 1, 1, 1, 1, 1,
-0.6425666, 2.361047, -0.05362546, 1, 1, 1, 1, 1,
-0.6414725, -1.653208, -2.381791, 1, 1, 1, 1, 1,
-0.6408023, 0.07145514, -1.130479, 1, 1, 1, 1, 1,
-0.6400939, -1.077081, -3.693517, 1, 1, 1, 1, 1,
-0.637709, 1.097097, -1.100564, 1, 1, 1, 1, 1,
-0.6333519, -0.4366988, -3.027893, 1, 1, 1, 1, 1,
-0.6324714, -0.7215304, -2.637653, 1, 1, 1, 1, 1,
-0.6309049, -1.269631, -3.275843, 1, 1, 1, 1, 1,
-0.6244844, 0.3219117, -1.474041, 1, 1, 1, 1, 1,
-0.6232228, 0.8698013, -0.9174692, 0, 0, 1, 1, 1,
-0.6201233, 1.037035, 0.1999998, 1, 0, 0, 1, 1,
-0.6191472, 1.475258, 0.3810553, 1, 0, 0, 1, 1,
-0.6183578, 1.71133, -0.3797905, 1, 0, 0, 1, 1,
-0.6164876, 0.6396712, -1.586767, 1, 0, 0, 1, 1,
-0.6147519, 0.01841086, -1.859942, 1, 0, 0, 1, 1,
-0.6078799, 0.03946536, -0.7797516, 0, 0, 0, 1, 1,
-0.6023971, 0.5546456, 0.08228654, 0, 0, 0, 1, 1,
-0.5992104, 0.2051071, -0.3955424, 0, 0, 0, 1, 1,
-0.5991468, 0.5403371, 0.1569117, 0, 0, 0, 1, 1,
-0.5982144, 1.958099, 1.962566, 0, 0, 0, 1, 1,
-0.5933427, 1.160346, -0.7637991, 0, 0, 0, 1, 1,
-0.5932856, 0.720161, 0.5084847, 0, 0, 0, 1, 1,
-0.5878211, 1.262058, -1.482636, 1, 1, 1, 1, 1,
-0.5840041, 1.792383, -1.298463, 1, 1, 1, 1, 1,
-0.58383, -1.167978, -4.017975, 1, 1, 1, 1, 1,
-0.5780004, -0.2360436, -2.222335, 1, 1, 1, 1, 1,
-0.5749186, -0.2672793, -3.012776, 1, 1, 1, 1, 1,
-0.5709408, 0.8029692, 1.196741, 1, 1, 1, 1, 1,
-0.5692783, 0.720515, -0.2865519, 1, 1, 1, 1, 1,
-0.5652072, -0.214934, -1.118581, 1, 1, 1, 1, 1,
-0.5642616, -0.02659249, -0.8851415, 1, 1, 1, 1, 1,
-0.5638192, 1.367386, -1.558073, 1, 1, 1, 1, 1,
-0.561625, 0.1628931, -0.8588654, 1, 1, 1, 1, 1,
-0.555661, -1.851097, -2.366882, 1, 1, 1, 1, 1,
-0.5524001, -0.8514193, -3.287141, 1, 1, 1, 1, 1,
-0.5513039, -0.488589, -2.88879, 1, 1, 1, 1, 1,
-0.5493945, 0.7808126, 0.8863143, 1, 1, 1, 1, 1,
-0.5489199, 1.212578, -1.314191, 0, 0, 1, 1, 1,
-0.5466642, -1.815102, -4.137002, 1, 0, 0, 1, 1,
-0.5461878, -0.5693257, -3.575067, 1, 0, 0, 1, 1,
-0.5443902, -0.1265534, -0.7173465, 1, 0, 0, 1, 1,
-0.5426967, 0.08033055, -1.452465, 1, 0, 0, 1, 1,
-0.5402058, 0.7955586, -0.6237873, 1, 0, 0, 1, 1,
-0.536284, 0.8158848, -1.225687, 0, 0, 0, 1, 1,
-0.5345477, -0.1494522, -2.19997, 0, 0, 0, 1, 1,
-0.5301508, 0.201427, -0.4286776, 0, 0, 0, 1, 1,
-0.5299343, -1.699023, -3.05562, 0, 0, 0, 1, 1,
-0.5294548, 0.8185835, -1.328295, 0, 0, 0, 1, 1,
-0.5272994, 2.980344, -0.03882836, 0, 0, 0, 1, 1,
-0.5246683, -0.6715953, -4.002505, 0, 0, 0, 1, 1,
-0.5218143, -0.7468269, -1.008771, 1, 1, 1, 1, 1,
-0.5189843, 1.022242, 0.2616747, 1, 1, 1, 1, 1,
-0.5145999, 0.8317035, -1.077856, 1, 1, 1, 1, 1,
-0.51335, -0.4275096, -1.412038, 1, 1, 1, 1, 1,
-0.5105276, -0.8410656, -3.168985, 1, 1, 1, 1, 1,
-0.5068482, -0.8296908, -0.9502715, 1, 1, 1, 1, 1,
-0.5051533, -0.03073196, -1.662396, 1, 1, 1, 1, 1,
-0.5039386, 0.413042, -0.941121, 1, 1, 1, 1, 1,
-0.5037135, 0.2730584, -0.4330575, 1, 1, 1, 1, 1,
-0.5032573, -0.1150477, 0.1295603, 1, 1, 1, 1, 1,
-0.4898461, -1.313794, -2.474138, 1, 1, 1, 1, 1,
-0.4895323, -1.073201, -3.310623, 1, 1, 1, 1, 1,
-0.4884333, -0.2637686, -2.763466, 1, 1, 1, 1, 1,
-0.4879304, 0.7203978, -1.371418, 1, 1, 1, 1, 1,
-0.4861466, 0.04210461, -1.880278, 1, 1, 1, 1, 1,
-0.4807042, -1.099252, -2.559067, 0, 0, 1, 1, 1,
-0.4778731, -0.1732265, 0.192877, 1, 0, 0, 1, 1,
-0.4768132, 0.0287485, -0.4126291, 1, 0, 0, 1, 1,
-0.476689, -0.6845151, -1.673812, 1, 0, 0, 1, 1,
-0.474429, 0.3593483, 1.477742, 1, 0, 0, 1, 1,
-0.4740437, -0.01016957, -1.608123, 1, 0, 0, 1, 1,
-0.4738505, 2.090319, 1.909081, 0, 0, 0, 1, 1,
-0.4717538, 0.7599761, 0.2747225, 0, 0, 0, 1, 1,
-0.4640992, -0.6468607, -4.308474, 0, 0, 0, 1, 1,
-0.4632863, 1.707882, -1.250075, 0, 0, 0, 1, 1,
-0.4618108, -0.07429516, -4.32992, 0, 0, 0, 1, 1,
-0.4585984, 0.5292791, -1.100663, 0, 0, 0, 1, 1,
-0.4545588, 0.3839135, -1.267589, 0, 0, 0, 1, 1,
-0.4542548, 1.367321, 0.2919214, 1, 1, 1, 1, 1,
-0.4525923, 0.4096217, -0.8257661, 1, 1, 1, 1, 1,
-0.4492498, 0.331147, -3.62279, 1, 1, 1, 1, 1,
-0.4474567, -0.7074766, -1.908917, 1, 1, 1, 1, 1,
-0.446868, 1.766073, -1.178475, 1, 1, 1, 1, 1,
-0.4455365, 0.6034487, -0.9097326, 1, 1, 1, 1, 1,
-0.4377695, -1.09189, -2.161927, 1, 1, 1, 1, 1,
-0.4322781, 1.522278, -0.4941213, 1, 1, 1, 1, 1,
-0.4311356, 0.6213142, 0.9950216, 1, 1, 1, 1, 1,
-0.4303737, 1.093555, 0.01851531, 1, 1, 1, 1, 1,
-0.4294507, -0.553912, -4.18828, 1, 1, 1, 1, 1,
-0.4238976, -1.385649, -0.2523295, 1, 1, 1, 1, 1,
-0.4223789, 0.367808, -0.4872441, 1, 1, 1, 1, 1,
-0.418738, -1.542658, -2.397722, 1, 1, 1, 1, 1,
-0.4156622, -1.333805, -3.19586, 1, 1, 1, 1, 1,
-0.4130749, -0.7628538, -1.597106, 0, 0, 1, 1, 1,
-0.4126632, 1.923257, -1.021675, 1, 0, 0, 1, 1,
-0.412331, -0.1459443, -2.697188, 1, 0, 0, 1, 1,
-0.4096839, -0.9504988, -2.885777, 1, 0, 0, 1, 1,
-0.408255, -1.384989, -2.209, 1, 0, 0, 1, 1,
-0.40693, 0.7929089, -2.381731, 1, 0, 0, 1, 1,
-0.4066452, 1.256396, -1.137806, 0, 0, 0, 1, 1,
-0.4049938, 1.940925, 1.42166, 0, 0, 0, 1, 1,
-0.4043046, -0.1074281, -0.3138335, 0, 0, 0, 1, 1,
-0.4011021, 0.4110388, -0.3976844, 0, 0, 0, 1, 1,
-0.3945619, 0.1199633, -1.908817, 0, 0, 0, 1, 1,
-0.3938165, -0.1770503, -1.701781, 0, 0, 0, 1, 1,
-0.3932971, 2.260277, -0.2903733, 0, 0, 0, 1, 1,
-0.3876966, -1.001516, -2.592137, 1, 1, 1, 1, 1,
-0.3874204, 0.5341361, 0.2402769, 1, 1, 1, 1, 1,
-0.3861254, -0.225777, -2.082207, 1, 1, 1, 1, 1,
-0.385708, -1.094153, -2.65883, 1, 1, 1, 1, 1,
-0.3855975, -0.361144, -3.364985, 1, 1, 1, 1, 1,
-0.3812748, 1.212246, -1.556046, 1, 1, 1, 1, 1,
-0.3807247, -0.9245558, -0.8836409, 1, 1, 1, 1, 1,
-0.3766828, -0.1901932, -1.53875, 1, 1, 1, 1, 1,
-0.3766558, 0.2035147, -0.6019667, 1, 1, 1, 1, 1,
-0.3703653, 0.1224802, -1.853302, 1, 1, 1, 1, 1,
-0.3674291, -1.544048, -4.087546, 1, 1, 1, 1, 1,
-0.3673279, 0.5950181, -0.4010754, 1, 1, 1, 1, 1,
-0.3653102, -0.9338005, -4.469627, 1, 1, 1, 1, 1,
-0.362933, -1.215546, -4.945779, 1, 1, 1, 1, 1,
-0.3624181, 0.3138428, -0.7340878, 1, 1, 1, 1, 1,
-0.3611962, 2.139489, -0.2133498, 0, 0, 1, 1, 1,
-0.3553535, 1.120111, 0.6436597, 1, 0, 0, 1, 1,
-0.3489461, -0.6459379, -2.400378, 1, 0, 0, 1, 1,
-0.3460118, -0.7599124, -1.576697, 1, 0, 0, 1, 1,
-0.3419071, 0.2866825, -0.1536282, 1, 0, 0, 1, 1,
-0.3418522, -0.0247895, -3.604117, 1, 0, 0, 1, 1,
-0.3416569, 0.6190548, -0.9861851, 0, 0, 0, 1, 1,
-0.3414073, 0.6214914, 0.5077226, 0, 0, 0, 1, 1,
-0.3401458, 0.8743374, -0.2078341, 0, 0, 0, 1, 1,
-0.3342569, -2.924542, -2.311481, 0, 0, 0, 1, 1,
-0.3325322, -1.055313, -2.131016, 0, 0, 0, 1, 1,
-0.3285045, 0.00752375, -0.7411677, 0, 0, 0, 1, 1,
-0.3280004, -0.3972533, -1.76585, 0, 0, 0, 1, 1,
-0.3216104, 0.1125337, 0.2531312, 1, 1, 1, 1, 1,
-0.3203506, 0.2169122, -1.426229, 1, 1, 1, 1, 1,
-0.3195361, 0.5554561, -0.08119521, 1, 1, 1, 1, 1,
-0.3173378, -1.433251, -3.886545, 1, 1, 1, 1, 1,
-0.3161249, -0.295283, -4.256365, 1, 1, 1, 1, 1,
-0.3160512, 0.2593013, -1.343858, 1, 1, 1, 1, 1,
-0.3151854, 0.1436822, -1.452663, 1, 1, 1, 1, 1,
-0.3134204, -1.078361, -2.478444, 1, 1, 1, 1, 1,
-0.3133472, 2.824131, -1.370107, 1, 1, 1, 1, 1,
-0.3122668, 0.6956085, -0.7069939, 1, 1, 1, 1, 1,
-0.3102663, -0.3578414, -3.154093, 1, 1, 1, 1, 1,
-0.3082162, -0.3790332, -1.246514, 1, 1, 1, 1, 1,
-0.3065233, 0.3730813, 1.050048, 1, 1, 1, 1, 1,
-0.3056541, -0.9093425, -2.450903, 1, 1, 1, 1, 1,
-0.3042171, 0.4904715, 0.7873013, 1, 1, 1, 1, 1,
-0.3039122, 0.6293101, 0.4471443, 0, 0, 1, 1, 1,
-0.3030554, -0.8916183, -2.567374, 1, 0, 0, 1, 1,
-0.3021458, 0.8195539, -0.9419913, 1, 0, 0, 1, 1,
-0.3007189, 1.052665, 0.433726, 1, 0, 0, 1, 1,
-0.2995164, -0.1784884, -2.850734, 1, 0, 0, 1, 1,
-0.2984186, -1.741347, -3.551701, 1, 0, 0, 1, 1,
-0.29836, 0.4870562, -0.827841, 0, 0, 0, 1, 1,
-0.2972874, -0.6098261, -3.98058, 0, 0, 0, 1, 1,
-0.2966328, 0.01438821, -1.718262, 0, 0, 0, 1, 1,
-0.2955881, 1.995466, 0.7889758, 0, 0, 0, 1, 1,
-0.2879447, 0.7794969, -0.71327, 0, 0, 0, 1, 1,
-0.2877415, -0.33634, -3.229076, 0, 0, 0, 1, 1,
-0.2815343, -0.3684556, -1.884859, 0, 0, 0, 1, 1,
-0.2810961, -0.9544326, -1.65222, 1, 1, 1, 1, 1,
-0.2800114, 0.2125016, -1.207272, 1, 1, 1, 1, 1,
-0.2784255, -0.1331414, -0.5980125, 1, 1, 1, 1, 1,
-0.2769264, 1.516758, 1.666612, 1, 1, 1, 1, 1,
-0.2752216, -0.1292709, -0.0006735303, 1, 1, 1, 1, 1,
-0.2747494, -1.004012, -4.147296, 1, 1, 1, 1, 1,
-0.2669094, -1.485921, -2.782912, 1, 1, 1, 1, 1,
-0.2664048, 0.8287021, -0.1971905, 1, 1, 1, 1, 1,
-0.2656393, -0.1609956, -1.188692, 1, 1, 1, 1, 1,
-0.2588156, -0.3917329, -2.572381, 1, 1, 1, 1, 1,
-0.2562476, 0.5700995, 0.4347162, 1, 1, 1, 1, 1,
-0.2561738, -0.9859172, -2.76986, 1, 1, 1, 1, 1,
-0.2549968, -1.393396, -3.216339, 1, 1, 1, 1, 1,
-0.25498, 0.4102784, -0.7633288, 1, 1, 1, 1, 1,
-0.2540074, -1.252925, -4.925151, 1, 1, 1, 1, 1,
-0.2535469, -0.3899623, -2.92486, 0, 0, 1, 1, 1,
-0.2531903, -2.540624, -3.4679, 1, 0, 0, 1, 1,
-0.2509067, -3.248234, -3.237726, 1, 0, 0, 1, 1,
-0.2490674, -0.04624179, -0.5084526, 1, 0, 0, 1, 1,
-0.2482825, -0.590678, -4.441299, 1, 0, 0, 1, 1,
-0.2482466, 1.331672, -0.545489, 1, 0, 0, 1, 1,
-0.2440993, -0.08950632, -3.836067, 0, 0, 0, 1, 1,
-0.2426061, 0.4150432, -0.3351226, 0, 0, 0, 1, 1,
-0.2413373, -0.6040229, -3.298446, 0, 0, 0, 1, 1,
-0.2389389, 0.5064459, -0.7835523, 0, 0, 0, 1, 1,
-0.233077, 0.007647205, 0.2088247, 0, 0, 0, 1, 1,
-0.2310127, -0.1854013, -2.621586, 0, 0, 0, 1, 1,
-0.230792, 0.765981, -0.3935224, 0, 0, 0, 1, 1,
-0.2305881, -1.283918, -3.760973, 1, 1, 1, 1, 1,
-0.2303207, 1.108853, 0.05283521, 1, 1, 1, 1, 1,
-0.2272955, 0.04723277, -2.456562, 1, 1, 1, 1, 1,
-0.2270285, -1.217384, -3.234182, 1, 1, 1, 1, 1,
-0.2239267, 0.1076823, 0.5378428, 1, 1, 1, 1, 1,
-0.2172599, -0.3894602, -2.851571, 1, 1, 1, 1, 1,
-0.212881, -1.278042, -4.010888, 1, 1, 1, 1, 1,
-0.212597, -0.4362061, -4.678281, 1, 1, 1, 1, 1,
-0.210526, -0.2526811, -1.110918, 1, 1, 1, 1, 1,
-0.2073106, -1.476475, -2.710398, 1, 1, 1, 1, 1,
-0.206536, 1.522312, -1.2377, 1, 1, 1, 1, 1,
-0.2062664, 1.655394, -0.3527664, 1, 1, 1, 1, 1,
-0.2030829, -0.4365935, -2.489597, 1, 1, 1, 1, 1,
-0.2013847, 1.687565, -0.2299136, 1, 1, 1, 1, 1,
-0.2000784, -1.018785, -1.62624, 1, 1, 1, 1, 1,
-0.197825, -2.273885, -3.494117, 0, 0, 1, 1, 1,
-0.1955923, -0.5580096, -2.497149, 1, 0, 0, 1, 1,
-0.19523, -0.5649498, -4.80177, 1, 0, 0, 1, 1,
-0.194344, -1.794251, -3.487291, 1, 0, 0, 1, 1,
-0.18376, 0.7294708, -2.097053, 1, 0, 0, 1, 1,
-0.1834915, 1.434543, -1.067013, 1, 0, 0, 1, 1,
-0.1818588, -0.5202245, -3.259075, 0, 0, 0, 1, 1,
-0.1790494, 2.076099, 0.1609545, 0, 0, 0, 1, 1,
-0.1779804, -0.955707, -1.935517, 0, 0, 0, 1, 1,
-0.1777293, -0.2236338, -2.063037, 0, 0, 0, 1, 1,
-0.1713081, 0.1508459, -1.962944, 0, 0, 0, 1, 1,
-0.1712728, -0.6731184, -2.094835, 0, 0, 0, 1, 1,
-0.165863, -0.4889434, -3.275477, 0, 0, 0, 1, 1,
-0.1656041, -0.7615144, -3.454104, 1, 1, 1, 1, 1,
-0.1634745, -0.7382982, -3.064145, 1, 1, 1, 1, 1,
-0.1625574, -0.2426385, -3.30118, 1, 1, 1, 1, 1,
-0.1551272, 0.321347, 2.396686, 1, 1, 1, 1, 1,
-0.150138, 1.020498, -2.298539, 1, 1, 1, 1, 1,
-0.1492614, 0.0843465, -1.70359, 1, 1, 1, 1, 1,
-0.1483207, 0.548036, -1.517581, 1, 1, 1, 1, 1,
-0.147475, -0.1109313, -3.747049, 1, 1, 1, 1, 1,
-0.1455643, -0.2431929, -3.71462, 1, 1, 1, 1, 1,
-0.1403626, -0.2424816, -3.170751, 1, 1, 1, 1, 1,
-0.1393501, 0.9059651, -0.7162361, 1, 1, 1, 1, 1,
-0.1348142, 0.4536383, 0.4418071, 1, 1, 1, 1, 1,
-0.1333669, 1.014116, -1.166813, 1, 1, 1, 1, 1,
-0.1307967, -1.978508, -2.360274, 1, 1, 1, 1, 1,
-0.126791, -0.4371077, -3.81096, 1, 1, 1, 1, 1,
-0.1259053, -0.03595989, -1.662792, 0, 0, 1, 1, 1,
-0.1240073, 0.3803768, -2.516213, 1, 0, 0, 1, 1,
-0.1229979, -0.3015568, -4.761778, 1, 0, 0, 1, 1,
-0.1212964, 1.140338, -2.056934, 1, 0, 0, 1, 1,
-0.1197376, -0.4923877, -1.738744, 1, 0, 0, 1, 1,
-0.1169773, 0.4753395, -1.476393, 1, 0, 0, 1, 1,
-0.1132686, -0.6235344, -2.8848, 0, 0, 0, 1, 1,
-0.1115427, -0.5635073, -1.886514, 0, 0, 0, 1, 1,
-0.1083211, 0.7472647, -1.041597, 0, 0, 0, 1, 1,
-0.1071732, 0.08212592, -1.05389, 0, 0, 0, 1, 1,
-0.1061092, 0.2920103, -0.1711255, 0, 0, 0, 1, 1,
-0.1047663, 0.3870913, -0.2996756, 0, 0, 0, 1, 1,
-0.102241, -1.895788, -5.242287, 0, 0, 0, 1, 1,
-0.102044, 1.616671, 1.396387, 1, 1, 1, 1, 1,
-0.097547, 0.6136431, 1.045062, 1, 1, 1, 1, 1,
-0.09485853, -2.41825, -2.513487, 1, 1, 1, 1, 1,
-0.09432342, -1.109924, -4.546087, 1, 1, 1, 1, 1,
-0.09268306, 2.306535, -0.6303928, 1, 1, 1, 1, 1,
-0.09136242, 0.4505504, -0.4848707, 1, 1, 1, 1, 1,
-0.08225324, -0.4342708, -3.369383, 1, 1, 1, 1, 1,
-0.07495289, 2.19363, -1.011118, 1, 1, 1, 1, 1,
-0.07418568, -0.5125571, -1.165201, 1, 1, 1, 1, 1,
-0.0735472, 0.3792799, -1.312664, 1, 1, 1, 1, 1,
-0.0711479, -1.933544, -5.102184, 1, 1, 1, 1, 1,
-0.06778502, 0.2670786, -1.11189, 1, 1, 1, 1, 1,
-0.06551538, -0.9413218, -4.773794, 1, 1, 1, 1, 1,
-0.06505505, -1.321555, -3.156906, 1, 1, 1, 1, 1,
-0.06339089, -0.1775295, -2.598388, 1, 1, 1, 1, 1,
-0.06284449, -0.574953, -3.918113, 0, 0, 1, 1, 1,
-0.06248433, 0.3810089, 0.6694618, 1, 0, 0, 1, 1,
-0.06162146, 0.01419707, -0.9524279, 1, 0, 0, 1, 1,
-0.05763293, -1.828154, -3.043617, 1, 0, 0, 1, 1,
-0.05730326, 1.620254, -0.4175579, 1, 0, 0, 1, 1,
-0.05543109, 0.4793423, -1.387326, 1, 0, 0, 1, 1,
-0.05016259, -2.09834, -5.27741, 0, 0, 0, 1, 1,
-0.04991635, 1.100373, 0.1875793, 0, 0, 0, 1, 1,
-0.04672182, -0.6318846, -2.305332, 0, 0, 0, 1, 1,
-0.0445966, -0.6733226, -2.505935, 0, 0, 0, 1, 1,
-0.04059666, 0.483411, 0.9680273, 0, 0, 0, 1, 1,
-0.0335055, -0.2641709, -3.985661, 0, 0, 0, 1, 1,
-0.02862911, -1.01338, -4.83011, 0, 0, 0, 1, 1,
-0.02614541, -1.581171, -2.885608, 1, 1, 1, 1, 1,
-0.02594502, 1.184602, 0.449401, 1, 1, 1, 1, 1,
-0.02001601, -0.148194, -2.104675, 1, 1, 1, 1, 1,
-0.01414097, -1.107624, -3.594422, 1, 1, 1, 1, 1,
-0.01387792, -0.7188938, -4.761899, 1, 1, 1, 1, 1,
-0.01283218, 1.792464, 0.7258772, 1, 1, 1, 1, 1,
-0.0127678, -0.3851611, -2.257743, 1, 1, 1, 1, 1,
-0.01058246, -1.163828, -3.2573, 1, 1, 1, 1, 1,
-0.002974753, -0.2677204, -4.091203, 1, 1, 1, 1, 1,
-0.002125956, 0.668542, -0.7333798, 1, 1, 1, 1, 1,
0.0002837448, -0.00156762, 3.99217, 1, 1, 1, 1, 1,
0.002200906, 0.8934256, 0.06974424, 1, 1, 1, 1, 1,
0.002472131, 0.8441609, 1.831768, 1, 1, 1, 1, 1,
0.00378877, 1.146677, -1.336803, 1, 1, 1, 1, 1,
0.0046301, 0.709056, -0.8254458, 1, 1, 1, 1, 1,
0.005678687, -0.08734242, 2.899192, 0, 0, 1, 1, 1,
0.006594343, 0.5664828, -0.1215297, 1, 0, 0, 1, 1,
0.01227508, 0.5593546, 0.4001934, 1, 0, 0, 1, 1,
0.01499582, -2.570512, 1.749837, 1, 0, 0, 1, 1,
0.01803963, -0.3607014, 3.964363, 1, 0, 0, 1, 1,
0.02007656, -0.7918139, 3.473776, 1, 0, 0, 1, 1,
0.02327989, 0.8710465, 0.2570328, 0, 0, 0, 1, 1,
0.02779319, -0.225227, 2.087959, 0, 0, 0, 1, 1,
0.02811417, 1.219564, -0.8362718, 0, 0, 0, 1, 1,
0.03666084, 0.6118841, -0.5518098, 0, 0, 0, 1, 1,
0.03713148, -0.1363776, 3.770602, 0, 0, 0, 1, 1,
0.03917835, -1.309487, 2.130365, 0, 0, 0, 1, 1,
0.0392422, 0.3175805, -0.1696422, 0, 0, 0, 1, 1,
0.04133572, 1.138247, 0.9911274, 1, 1, 1, 1, 1,
0.0422483, 0.1540937, 0.09582691, 1, 1, 1, 1, 1,
0.04514994, 0.781734, 0.1010894, 1, 1, 1, 1, 1,
0.047865, -0.2525578, 2.163526, 1, 1, 1, 1, 1,
0.0485853, 1.604814, 0.1425611, 1, 1, 1, 1, 1,
0.0566408, -3.294914, 2.117555, 1, 1, 1, 1, 1,
0.05965372, 0.1214776, 2.361781, 1, 1, 1, 1, 1,
0.06035576, 0.2446612, -0.9271749, 1, 1, 1, 1, 1,
0.06212771, -0.6667259, 4.48173, 1, 1, 1, 1, 1,
0.06480756, 0.3348463, -0.6669562, 1, 1, 1, 1, 1,
0.06751286, 0.1454589, 0.8649651, 1, 1, 1, 1, 1,
0.06759552, -0.03626367, 1.949141, 1, 1, 1, 1, 1,
0.06911933, -1.344613, 3.990834, 1, 1, 1, 1, 1,
0.07028774, 0.5498471, 0.1432066, 1, 1, 1, 1, 1,
0.07334577, 0.9637722, 0.5362365, 1, 1, 1, 1, 1,
0.07401779, 0.2972467, -1.532114, 0, 0, 1, 1, 1,
0.07459772, 0.01496531, 1.524278, 1, 0, 0, 1, 1,
0.07635782, -0.3887527, 2.076121, 1, 0, 0, 1, 1,
0.07750889, 0.5639688, 0.7517263, 1, 0, 0, 1, 1,
0.07866431, -1.286873, 3.194715, 1, 0, 0, 1, 1,
0.08349284, -1.168015, 4.005499, 1, 0, 0, 1, 1,
0.08431295, 0.4729299, 0.3123927, 0, 0, 0, 1, 1,
0.09263387, -1.240743, 2.434359, 0, 0, 0, 1, 1,
0.09289373, -0.4517615, 3.666034, 0, 0, 0, 1, 1,
0.09356866, 1.558498, -0.3996563, 0, 0, 0, 1, 1,
0.09770181, 0.07409969, 1.998801, 0, 0, 0, 1, 1,
0.09811395, -1.47893, 3.597914, 0, 0, 0, 1, 1,
0.1002694, 0.747595, 0.6193371, 0, 0, 0, 1, 1,
0.1004511, 0.06892307, 1.822692, 1, 1, 1, 1, 1,
0.1006672, 0.01554919, 2.770393, 1, 1, 1, 1, 1,
0.1043314, 0.1363848, -0.7305427, 1, 1, 1, 1, 1,
0.1089617, 0.8376095, 0.2419509, 1, 1, 1, 1, 1,
0.110567, -0.9499983, 2.180825, 1, 1, 1, 1, 1,
0.1140794, 0.8078359, 1.22008, 1, 1, 1, 1, 1,
0.1148954, 0.6370714, 0.6603415, 1, 1, 1, 1, 1,
0.1150438, -0.3962711, 3.484154, 1, 1, 1, 1, 1,
0.1151262, 0.9007044, -0.5096838, 1, 1, 1, 1, 1,
0.116308, -0.468234, 2.757527, 1, 1, 1, 1, 1,
0.1194026, 0.1850242, 0.75227, 1, 1, 1, 1, 1,
0.1254156, 0.4680132, 0.0005944087, 1, 1, 1, 1, 1,
0.1261235, 1.565359, -1.05397, 1, 1, 1, 1, 1,
0.1334013, -0.8296971, 3.146484, 1, 1, 1, 1, 1,
0.136049, -1.433133, 4.317498, 1, 1, 1, 1, 1,
0.1404424, 1.283909, 1.14082, 0, 0, 1, 1, 1,
0.1424163, 1.984897, 2.047226, 1, 0, 0, 1, 1,
0.1466113, -0.6335617, 4.232134, 1, 0, 0, 1, 1,
0.1466976, 0.6683356, 0.3045028, 1, 0, 0, 1, 1,
0.1503421, 1.124348, 0.4022914, 1, 0, 0, 1, 1,
0.1527768, -1.966655, 3.991432, 1, 0, 0, 1, 1,
0.1555341, -0.5656579, 1.461697, 0, 0, 0, 1, 1,
0.1581193, 0.238471, 1.442411, 0, 0, 0, 1, 1,
0.1613469, -0.2149982, 2.276684, 0, 0, 0, 1, 1,
0.1642914, 1.18209, 0.4378186, 0, 0, 0, 1, 1,
0.1661356, -0.05958002, 1.331609, 0, 0, 0, 1, 1,
0.166753, -0.1449928, 1.503718, 0, 0, 0, 1, 1,
0.1687046, -0.06461599, 1.249785, 0, 0, 0, 1, 1,
0.1691034, -0.1576284, 1.636642, 1, 1, 1, 1, 1,
0.1740313, 1.58802, -0.7044938, 1, 1, 1, 1, 1,
0.174637, -0.1360917, 2.079791, 1, 1, 1, 1, 1,
0.1856731, 0.7813781, 0.3457643, 1, 1, 1, 1, 1,
0.191739, 0.8390594, 0.5872482, 1, 1, 1, 1, 1,
0.1930332, -0.6584688, 2.438138, 1, 1, 1, 1, 1,
0.1931695, -1.5138, 3.867018, 1, 1, 1, 1, 1,
0.1982999, 1.84976, 0.7609221, 1, 1, 1, 1, 1,
0.1999877, 0.648048, 1.485515, 1, 1, 1, 1, 1,
0.2025274, -1.677635, 2.695208, 1, 1, 1, 1, 1,
0.2052597, 1.234227, 0.4504041, 1, 1, 1, 1, 1,
0.2059887, 0.207408, 0.03384623, 1, 1, 1, 1, 1,
0.2074175, -0.3721264, 1.710093, 1, 1, 1, 1, 1,
0.2075959, 0.7943737, -1.230381, 1, 1, 1, 1, 1,
0.2082417, -0.06870314, 1.431784, 1, 1, 1, 1, 1,
0.209351, 1.683972, 1.778345, 0, 0, 1, 1, 1,
0.2098063, 0.3178076, 0.5265933, 1, 0, 0, 1, 1,
0.210163, 1.280637, 1.275798, 1, 0, 0, 1, 1,
0.2116291, -1.428464, 3.33627, 1, 0, 0, 1, 1,
0.2141808, 1.132513, 1.182204, 1, 0, 0, 1, 1,
0.217736, 0.33492, 0.4527712, 1, 0, 0, 1, 1,
0.2208878, -0.6875144, 0.9874753, 0, 0, 0, 1, 1,
0.2214711, -2.162977, 3.08324, 0, 0, 0, 1, 1,
0.2238867, 0.5976399, 0.7742797, 0, 0, 0, 1, 1,
0.2316038, 1.45501, 2.264609, 0, 0, 0, 1, 1,
0.2358895, -0.5019791, 1.970168, 0, 0, 0, 1, 1,
0.2396351, 0.379071, -0.6707871, 0, 0, 0, 1, 1,
0.2404248, 1.347396, 0.8605521, 0, 0, 0, 1, 1,
0.2405538, 0.1137057, 1.105467, 1, 1, 1, 1, 1,
0.2443414, -0.4523744, 2.299562, 1, 1, 1, 1, 1,
0.2466133, 0.5400211, -0.3895949, 1, 1, 1, 1, 1,
0.2474347, 0.9022174, -0.9357932, 1, 1, 1, 1, 1,
0.252711, -1.067917, 3.341525, 1, 1, 1, 1, 1,
0.2572704, 0.2777174, -0.5427352, 1, 1, 1, 1, 1,
0.2585371, 0.2038896, 3.103586, 1, 1, 1, 1, 1,
0.2588001, 1.146844, -1.700503, 1, 1, 1, 1, 1,
0.2592588, -1.86909, 2.324738, 1, 1, 1, 1, 1,
0.2676328, 0.3014376, 1.398088, 1, 1, 1, 1, 1,
0.2710965, -0.7316884, 3.395274, 1, 1, 1, 1, 1,
0.271155, -0.1837669, 3.784983, 1, 1, 1, 1, 1,
0.2732652, 0.9625416, -1.350481, 1, 1, 1, 1, 1,
0.273587, 2.628693, -0.4034305, 1, 1, 1, 1, 1,
0.2803345, 1.151795, -0.4534987, 1, 1, 1, 1, 1,
0.2811303, 0.5668336, -0.6824157, 0, 0, 1, 1, 1,
0.2815829, 0.006517715, 0.553103, 1, 0, 0, 1, 1,
0.2820008, 1.070173, 1.106644, 1, 0, 0, 1, 1,
0.2882783, -0.9711305, 2.575011, 1, 0, 0, 1, 1,
0.2885468, 1.131665, 1.131303, 1, 0, 0, 1, 1,
0.2888114, -0.06960927, 3.040131, 1, 0, 0, 1, 1,
0.2898841, 0.1056133, 1.769288, 0, 0, 0, 1, 1,
0.2911732, -0.7824228, 1.351708, 0, 0, 0, 1, 1,
0.2935728, 1.731361, -1.153194, 0, 0, 0, 1, 1,
0.293798, 1.370712, -0.730786, 0, 0, 0, 1, 1,
0.2967353, 0.7569312, 2.496728, 0, 0, 0, 1, 1,
0.2969382, 1.484642, 1.930328, 0, 0, 0, 1, 1,
0.3025168, -1.509888, 1.445319, 0, 0, 0, 1, 1,
0.3052313, 2.462803, 2.391118, 1, 1, 1, 1, 1,
0.3112561, 1.643854, -0.1285751, 1, 1, 1, 1, 1,
0.3201017, -0.8567741, 3.164806, 1, 1, 1, 1, 1,
0.3260055, -2.286898, 3.834642, 1, 1, 1, 1, 1,
0.326251, 0.5695486, 2.071253, 1, 1, 1, 1, 1,
0.3279606, 1.721371, 1.320255, 1, 1, 1, 1, 1,
0.3299612, 0.249851, 0.1809767, 1, 1, 1, 1, 1,
0.332355, 0.01759687, 0.3630248, 1, 1, 1, 1, 1,
0.3361634, -1.049176, 2.102429, 1, 1, 1, 1, 1,
0.3376404, -0.5126746, 2.248961, 1, 1, 1, 1, 1,
0.3415387, 0.3707744, 0.7290211, 1, 1, 1, 1, 1,
0.3490191, 0.7695133, 1.196837, 1, 1, 1, 1, 1,
0.3516959, -0.2288275, 0.98837, 1, 1, 1, 1, 1,
0.3523448, -0.08112837, 1.62184, 1, 1, 1, 1, 1,
0.3593985, -0.7751147, 2.717122, 1, 1, 1, 1, 1,
0.359669, 1.622335, 2.777659, 0, 0, 1, 1, 1,
0.359825, 0.7698597, -0.1729109, 1, 0, 0, 1, 1,
0.360268, 0.1577979, 0.4151786, 1, 0, 0, 1, 1,
0.3653817, -1.578397, 4.044555, 1, 0, 0, 1, 1,
0.366727, -1.126686, 1.796929, 1, 0, 0, 1, 1,
0.374543, 0.8314854, 1.868675, 1, 0, 0, 1, 1,
0.3746991, -0.117902, 1.205216, 0, 0, 0, 1, 1,
0.3829747, -0.6934621, 3.081189, 0, 0, 0, 1, 1,
0.3831303, 0.4235268, -0.2900641, 0, 0, 0, 1, 1,
0.3832178, 0.4228539, 1.146658, 0, 0, 0, 1, 1,
0.3833503, 0.8941289, 1.203862, 0, 0, 0, 1, 1,
0.3855355, -1.976057, 2.117911, 0, 0, 0, 1, 1,
0.3899016, 1.412199, 1.006495, 0, 0, 0, 1, 1,
0.3912099, 0.5199794, -0.4020392, 1, 1, 1, 1, 1,
0.3930979, -1.658943, 2.862094, 1, 1, 1, 1, 1,
0.3937138, -1.626, 2.792085, 1, 1, 1, 1, 1,
0.3968967, 0.583881, -0.2036241, 1, 1, 1, 1, 1,
0.3974186, 0.6006938, 0.465817, 1, 1, 1, 1, 1,
0.3992231, -0.6010796, 2.259849, 1, 1, 1, 1, 1,
0.4017488, 1.177302, -0.4346064, 1, 1, 1, 1, 1,
0.4029143, 0.2971881, 1.715654, 1, 1, 1, 1, 1,
0.4035133, -0.8338254, 2.039629, 1, 1, 1, 1, 1,
0.4152129, -2.272594, 2.330418, 1, 1, 1, 1, 1,
0.4153817, 0.02712461, 2.450082, 1, 1, 1, 1, 1,
0.4159471, 0.426641, -0.248182, 1, 1, 1, 1, 1,
0.4167236, 0.3932386, 0.6232642, 1, 1, 1, 1, 1,
0.4224286, 0.9278293, 1.163843, 1, 1, 1, 1, 1,
0.4235895, -1.477586, 1.658201, 1, 1, 1, 1, 1,
0.4251616, -2.034934, 4.15757, 0, 0, 1, 1, 1,
0.4253284, 0.2846791, 1.400731, 1, 0, 0, 1, 1,
0.4259637, 1.368831, 2.44176, 1, 0, 0, 1, 1,
0.4280266, -1.342891, 2.294267, 1, 0, 0, 1, 1,
0.4310152, 1.039535, 1.099358, 1, 0, 0, 1, 1,
0.4314091, -0.3019548, 1.723675, 1, 0, 0, 1, 1,
0.4342821, -0.119661, 2.794843, 0, 0, 0, 1, 1,
0.4456543, -0.7813081, 1.976837, 0, 0, 0, 1, 1,
0.4481847, -1.922457, 2.119443, 0, 0, 0, 1, 1,
0.4510598, 0.2474155, 3.461911, 0, 0, 0, 1, 1,
0.4555099, -0.5539703, 3.1101, 0, 0, 0, 1, 1,
0.455709, 0.3814671, -0.03036922, 0, 0, 0, 1, 1,
0.4612976, 0.987084, 1.22308, 0, 0, 0, 1, 1,
0.4624596, -0.0003634029, 2.368022, 1, 1, 1, 1, 1,
0.4685781, 0.3015922, 0.716596, 1, 1, 1, 1, 1,
0.4698283, -0.01122784, 1.91141, 1, 1, 1, 1, 1,
0.4727721, -0.2677651, 2.626156, 1, 1, 1, 1, 1,
0.4760661, -0.5639906, 2.02777, 1, 1, 1, 1, 1,
0.4789498, 0.3056651, 1.204818, 1, 1, 1, 1, 1,
0.4794717, 0.1627569, 1.431095, 1, 1, 1, 1, 1,
0.4843958, -0.6279597, 2.643944, 1, 1, 1, 1, 1,
0.4858038, -1.42067, 3.234098, 1, 1, 1, 1, 1,
0.4865164, 0.803014, -0.6335892, 1, 1, 1, 1, 1,
0.4947146, 0.2911042, 0.6141953, 1, 1, 1, 1, 1,
0.513741, -0.5543128, 1.945976, 1, 1, 1, 1, 1,
0.5304716, -1.324229, 3.595678, 1, 1, 1, 1, 1,
0.5503129, -1.269406, 3.447387, 1, 1, 1, 1, 1,
0.5511711, -0.5380316, 3.575989, 1, 1, 1, 1, 1,
0.5606177, -0.9339096, 2.58443, 0, 0, 1, 1, 1,
0.5661165, -1.00927, 2.575032, 1, 0, 0, 1, 1,
0.5688161, 1.518535, 1.289743, 1, 0, 0, 1, 1,
0.5703502, 1.804702, 0.7075199, 1, 0, 0, 1, 1,
0.5734139, 0.4140872, 1.850388, 1, 0, 0, 1, 1,
0.5828974, 1.068126, 2.051368, 1, 0, 0, 1, 1,
0.5834149, -0.2209884, 3.772848, 0, 0, 0, 1, 1,
0.5853559, 0.3605319, 2.315776, 0, 0, 0, 1, 1,
0.595225, -1.453325, 4.527323, 0, 0, 0, 1, 1,
0.5982112, -0.22583, 3.458859, 0, 0, 0, 1, 1,
0.5983058, 1.863653, 0.992106, 0, 0, 0, 1, 1,
0.6025035, -0.07955068, 3.019715, 0, 0, 0, 1, 1,
0.6063894, -0.6597478, 2.806528, 0, 0, 0, 1, 1,
0.6118592, -1.016402, 2.938168, 1, 1, 1, 1, 1,
0.6121181, 0.09429187, 1.321769, 1, 1, 1, 1, 1,
0.6147428, 0.5021185, 1.483157, 1, 1, 1, 1, 1,
0.6172761, 1.222713, 0.2069853, 1, 1, 1, 1, 1,
0.6192468, -1.740373, 2.645287, 1, 1, 1, 1, 1,
0.6206358, -1.301443, 5.212222, 1, 1, 1, 1, 1,
0.6226484, 1.1401, -0.6292074, 1, 1, 1, 1, 1,
0.6350952, -1.050545, 2.191051, 1, 1, 1, 1, 1,
0.6368856, 0.273541, 2.01178, 1, 1, 1, 1, 1,
0.6389645, 0.6929316, -0.3321157, 1, 1, 1, 1, 1,
0.6397573, -0.6048718, 2.563136, 1, 1, 1, 1, 1,
0.6405373, 1.018683, 1.685647, 1, 1, 1, 1, 1,
0.6450653, 0.9810025, 0.3087639, 1, 1, 1, 1, 1,
0.6484303, -0.9676056, 2.909796, 1, 1, 1, 1, 1,
0.6544406, 1.209213, 1.05539, 1, 1, 1, 1, 1,
0.6545169, 2.435319, 2.115422, 0, 0, 1, 1, 1,
0.659295, -0.9726561, 2.283871, 1, 0, 0, 1, 1,
0.6615043, -1.554937, 3.09777, 1, 0, 0, 1, 1,
0.6621054, 0.02178389, 1.704923, 1, 0, 0, 1, 1,
0.6624886, -0.2520512, 1.04672, 1, 0, 0, 1, 1,
0.6674171, -1.208751, 2.387483, 1, 0, 0, 1, 1,
0.6674274, -2.34271, 1.987032, 0, 0, 0, 1, 1,
0.6676389, 0.2095995, 0.3112482, 0, 0, 0, 1, 1,
0.6684583, 1.886152, 2.977306, 0, 0, 0, 1, 1,
0.6715167, -0.04200942, 2.586944, 0, 0, 0, 1, 1,
0.6721773, 0.1542245, -0.04609398, 0, 0, 0, 1, 1,
0.6739102, -0.4605145, 1.667814, 0, 0, 0, 1, 1,
0.6765301, -1.128343, 2.893718, 0, 0, 0, 1, 1,
0.6794138, -0.7206551, 3.117533, 1, 1, 1, 1, 1,
0.6809605, -1.353828, 4.319304, 1, 1, 1, 1, 1,
0.6862662, 0.6181076, -0.3595158, 1, 1, 1, 1, 1,
0.6927457, -0.3167628, 2.866877, 1, 1, 1, 1, 1,
0.6993513, -0.2325002, 2.056537, 1, 1, 1, 1, 1,
0.7014798, 0.4444611, 2.344064, 1, 1, 1, 1, 1,
0.703954, -0.2904087, 2.521446, 1, 1, 1, 1, 1,
0.7056209, 0.2209218, 1.268162, 1, 1, 1, 1, 1,
0.7158823, 0.3392897, 0.737394, 1, 1, 1, 1, 1,
0.7162649, 0.7122364, 1.61047, 1, 1, 1, 1, 1,
0.7170896, -1.074749, 2.469836, 1, 1, 1, 1, 1,
0.7179559, 0.2362803, 1.580305, 1, 1, 1, 1, 1,
0.7180616, 1.770552, 1.581981, 1, 1, 1, 1, 1,
0.7221195, 0.4812647, 1.373171, 1, 1, 1, 1, 1,
0.7231624, 0.7460965, -0.3291517, 1, 1, 1, 1, 1,
0.724608, -2.246498, 3.630838, 0, 0, 1, 1, 1,
0.7246537, 0.7478016, 2.183586, 1, 0, 0, 1, 1,
0.7259842, -0.1665099, 0.7929361, 1, 0, 0, 1, 1,
0.7290295, 0.7491904, 0.2378616, 1, 0, 0, 1, 1,
0.7297078, 3.407473, 0.9528983, 1, 0, 0, 1, 1,
0.7298605, -0.5816293, 3.211102, 1, 0, 0, 1, 1,
0.7361766, 1.171239, 1.162498, 0, 0, 0, 1, 1,
0.7421154, 0.2070803, 1.658067, 0, 0, 0, 1, 1,
0.7450392, 0.8954449, 1.841591, 0, 0, 0, 1, 1,
0.7523046, 0.0009004399, 0.4355931, 0, 0, 0, 1, 1,
0.7541, 1.40892, 1.394201, 0, 0, 0, 1, 1,
0.7552278, -0.1092158, 1.673806, 0, 0, 0, 1, 1,
0.7552568, -0.8832085, 2.337772, 0, 0, 0, 1, 1,
0.7599789, -0.6577934, 3.052134, 1, 1, 1, 1, 1,
0.7639638, -1.221721, 1.759956, 1, 1, 1, 1, 1,
0.7646344, -0.0360971, 3.564987, 1, 1, 1, 1, 1,
0.7665235, -0.4934791, 3.809283, 1, 1, 1, 1, 1,
0.7733401, 0.05611857, 1.652712, 1, 1, 1, 1, 1,
0.7829857, 1.033087, -0.8214994, 1, 1, 1, 1, 1,
0.7932041, -1.507495, 4.240378, 1, 1, 1, 1, 1,
0.7933903, 0.3102187, -0.945255, 1, 1, 1, 1, 1,
0.7945937, 0.02087838, 0.01591192, 1, 1, 1, 1, 1,
0.7949582, 0.8591176, 0.1343582, 1, 1, 1, 1, 1,
0.7951353, -0.321836, 3.263334, 1, 1, 1, 1, 1,
0.8100001, 2.926365, 1.136954, 1, 1, 1, 1, 1,
0.8100422, 0.26605, -0.9810724, 1, 1, 1, 1, 1,
0.8134323, -0.1296143, -0.05894591, 1, 1, 1, 1, 1,
0.8166355, -0.7490892, 3.439701, 1, 1, 1, 1, 1,
0.8169014, -0.5065035, 3.000368, 0, 0, 1, 1, 1,
0.8185955, 0.3527765, 0.9915054, 1, 0, 0, 1, 1,
0.8199965, -1.162588, 1.570946, 1, 0, 0, 1, 1,
0.82652, 0.7655486, 1.752493, 1, 0, 0, 1, 1,
0.8283277, -1.121897, 2.002809, 1, 0, 0, 1, 1,
0.8392739, 0.8817332, 2.679592, 1, 0, 0, 1, 1,
0.8398843, 1.281326, -0.4099924, 0, 0, 0, 1, 1,
0.8550526, 1.485443, -1.343202, 0, 0, 0, 1, 1,
0.8570063, -0.3800785, 0.6063319, 0, 0, 0, 1, 1,
0.8599432, -1.092685, 3.896377, 0, 0, 0, 1, 1,
0.8714996, -0.4679733, 1.033619, 0, 0, 0, 1, 1,
0.8744969, 1.137576, 1.584538, 0, 0, 0, 1, 1,
0.8753992, 1.197268, 0.5356959, 0, 0, 0, 1, 1,
0.876733, 0.3658087, 1.24837, 1, 1, 1, 1, 1,
0.88015, -0.462945, 2.073777, 1, 1, 1, 1, 1,
0.8806034, -1.180502, 3.401699, 1, 1, 1, 1, 1,
0.8812328, 0.6301962, 0.1765719, 1, 1, 1, 1, 1,
0.8819402, -0.02958196, 0.1379355, 1, 1, 1, 1, 1,
0.8822586, -0.008072517, 1.274055, 1, 1, 1, 1, 1,
0.8842484, -0.7190632, 1.061156, 1, 1, 1, 1, 1,
0.8918278, -0.4984273, 1.865188, 1, 1, 1, 1, 1,
0.8949215, 1.180272, 1.765048, 1, 1, 1, 1, 1,
0.9049276, 0.2677881, 2.055259, 1, 1, 1, 1, 1,
0.9063638, 0.854157, 1.293277, 1, 1, 1, 1, 1,
0.9074955, 2.522475, -0.8633422, 1, 1, 1, 1, 1,
0.9107387, -0.3603614, 1.632213, 1, 1, 1, 1, 1,
0.9142289, -0.4542152, 3.55428, 1, 1, 1, 1, 1,
0.9179798, -0.6759163, 1.428389, 1, 1, 1, 1, 1,
0.9186653, -0.8200933, 0.9716088, 0, 0, 1, 1, 1,
0.9211441, 2.132908, -0.9392714, 1, 0, 0, 1, 1,
0.9287469, 0.4375165, 1.027073, 1, 0, 0, 1, 1,
0.9340254, 0.2432745, -0.7024221, 1, 0, 0, 1, 1,
0.9362475, 0.719914, -0.06459585, 1, 0, 0, 1, 1,
0.9450097, -0.03619758, 0.8228764, 1, 0, 0, 1, 1,
0.9474558, -0.5184319, 3.254247, 0, 0, 0, 1, 1,
0.9485519, 1.715925, 1.504655, 0, 0, 0, 1, 1,
0.9511917, -1.272731, 1.911289, 0, 0, 0, 1, 1,
0.9518392, 0.5920271, -0.008712286, 0, 0, 0, 1, 1,
0.9544529, -1.769382, 1.714397, 0, 0, 0, 1, 1,
0.9598123, 0.8615261, 0.7564968, 0, 0, 0, 1, 1,
0.9629963, 0.6963133, 0.5152549, 0, 0, 0, 1, 1,
0.9666762, 2.580649, 0.2191064, 1, 1, 1, 1, 1,
0.97259, 1.48979, 1.190575, 1, 1, 1, 1, 1,
0.9758164, -1.608116, 3.69919, 1, 1, 1, 1, 1,
0.9955894, 1.385165, 1.23332, 1, 1, 1, 1, 1,
1.006591, -0.00178184, 2.850141, 1, 1, 1, 1, 1,
1.012991, 0.4105167, 1.822064, 1, 1, 1, 1, 1,
1.014301, 1.920091, 0.2715697, 1, 1, 1, 1, 1,
1.018737, 0.7462949, 1.322166, 1, 1, 1, 1, 1,
1.019274, 0.4553102, 2.030771, 1, 1, 1, 1, 1,
1.026144, -2.414443, 2.211322, 1, 1, 1, 1, 1,
1.027531, 0.5777848, 0.5147377, 1, 1, 1, 1, 1,
1.032247, -0.2914849, 1.101313, 1, 1, 1, 1, 1,
1.040503, 0.3484232, 2.206066, 1, 1, 1, 1, 1,
1.042155, 0.345224, 1.062685, 1, 1, 1, 1, 1,
1.052689, 0.7394914, -0.4292471, 1, 1, 1, 1, 1,
1.058486, 1.032088, 1.80697, 0, 0, 1, 1, 1,
1.060764, 0.3710654, 0.7139631, 1, 0, 0, 1, 1,
1.06212, -0.7865779, 2.395961, 1, 0, 0, 1, 1,
1.066118, 0.3787057, -0.1045768, 1, 0, 0, 1, 1,
1.073285, 0.5107461, 2.780599, 1, 0, 0, 1, 1,
1.074343, -1.044367, 2.377829, 1, 0, 0, 1, 1,
1.080855, -0.6515072, 2.61667, 0, 0, 0, 1, 1,
1.085603, -3.099882, 2.407867, 0, 0, 0, 1, 1,
1.085696, -1.398172, 3.836899, 0, 0, 0, 1, 1,
1.086725, 0.8914235, 1.956835, 0, 0, 0, 1, 1,
1.087462, -0.839219, 3.667268, 0, 0, 0, 1, 1,
1.097606, 2.605468, -0.03785368, 0, 0, 0, 1, 1,
1.099395, 1.48517, 1.500382, 0, 0, 0, 1, 1,
1.10643, -1.508999, 1.859637, 1, 1, 1, 1, 1,
1.110335, -1.121434, 1.537386, 1, 1, 1, 1, 1,
1.119311, -0.7428039, 3.75475, 1, 1, 1, 1, 1,
1.119578, 0.1730584, 2.224668, 1, 1, 1, 1, 1,
1.121548, -1.122797, 1.877203, 1, 1, 1, 1, 1,
1.124035, -0.339639, 1.172628, 1, 1, 1, 1, 1,
1.13448, 0.3766017, -0.193592, 1, 1, 1, 1, 1,
1.134632, -1.069862, 2.668516, 1, 1, 1, 1, 1,
1.136762, 0.5935565, 2.188617, 1, 1, 1, 1, 1,
1.147354, -0.2266989, 1.767995, 1, 1, 1, 1, 1,
1.157021, -0.3050097, 0.9303378, 1, 1, 1, 1, 1,
1.164158, -0.3586939, 0.8251581, 1, 1, 1, 1, 1,
1.169648, 2.57675, 0.6171739, 1, 1, 1, 1, 1,
1.181947, -0.628522, 1.024834, 1, 1, 1, 1, 1,
1.195658, -0.6495606, 1.025217, 1, 1, 1, 1, 1,
1.196357, -0.2451859, 0.8700954, 0, 0, 1, 1, 1,
1.212915, -0.3880354, 1.245492, 1, 0, 0, 1, 1,
1.215594, -0.4125931, 0.646015, 1, 0, 0, 1, 1,
1.22464, -1.351091, 4.151197, 1, 0, 0, 1, 1,
1.225141, 0.8089983, 1.352674, 1, 0, 0, 1, 1,
1.2293, 1.735623, -0.09748386, 1, 0, 0, 1, 1,
1.230758, 0.08503353, 2.256444, 0, 0, 0, 1, 1,
1.235103, -0.1058888, 2.265352, 0, 0, 0, 1, 1,
1.245332, -1.666392, 2.70767, 0, 0, 0, 1, 1,
1.268989, -0.8728761, 2.672902, 0, 0, 0, 1, 1,
1.277651, -1.527764, 0.6855373, 0, 0, 0, 1, 1,
1.277776, 0.3264452, 1.254877, 0, 0, 0, 1, 1,
1.289724, 1.496294, 0.415963, 0, 0, 0, 1, 1,
1.297273, 1.520138, 0.4103946, 1, 1, 1, 1, 1,
1.318318, -1.538073, 3.952156, 1, 1, 1, 1, 1,
1.322495, 0.3599701, 2.660405, 1, 1, 1, 1, 1,
1.324763, -0.06629219, 2.501348, 1, 1, 1, 1, 1,
1.342062, 0.7096797, -0.2946739, 1, 1, 1, 1, 1,
1.349093, 0.3347627, 1.336137, 1, 1, 1, 1, 1,
1.351738, 1.52755, 1.271465, 1, 1, 1, 1, 1,
1.35474, -0.3519334, 0.2552202, 1, 1, 1, 1, 1,
1.357537, -0.4807677, 1.208697, 1, 1, 1, 1, 1,
1.363566, -1.387892, 3.630388, 1, 1, 1, 1, 1,
1.37004, 0.1144844, 1.176438, 1, 1, 1, 1, 1,
1.387424, 0.1303361, 1.306065, 1, 1, 1, 1, 1,
1.387963, -0.2378665, 2.409537, 1, 1, 1, 1, 1,
1.388052, 1.6454, 0.2006614, 1, 1, 1, 1, 1,
1.394643, -0.7750185, -0.1267316, 1, 1, 1, 1, 1,
1.417694, -0.07757118, -0.4385663, 0, 0, 1, 1, 1,
1.419117, -1.443203, 1.42655, 1, 0, 0, 1, 1,
1.423122, -0.1096012, 1.218002, 1, 0, 0, 1, 1,
1.425295, -2.611032, 3.424129, 1, 0, 0, 1, 1,
1.428622, 0.3317905, 0.4613621, 1, 0, 0, 1, 1,
1.436251, -1.165755, -0.7537577, 1, 0, 0, 1, 1,
1.448281, 0.1227232, 1.166957, 0, 0, 0, 1, 1,
1.455084, 0.5351751, 0.6276999, 0, 0, 0, 1, 1,
1.458525, -0.1275644, 3.130696, 0, 0, 0, 1, 1,
1.462392, -0.339623, 1.01342, 0, 0, 0, 1, 1,
1.463102, 0.9296446, 1.525712, 0, 0, 0, 1, 1,
1.467889, 2.217018, -0.06336313, 0, 0, 0, 1, 1,
1.474086, -0.523691, 2.187709, 0, 0, 0, 1, 1,
1.483245, 0.8754095, 0.8488033, 1, 1, 1, 1, 1,
1.484742, -0.3027603, 2.135079, 1, 1, 1, 1, 1,
1.500363, 0.4318261, -0.133124, 1, 1, 1, 1, 1,
1.507878, 1.83242, 0.3265458, 1, 1, 1, 1, 1,
1.533812, 0.06474119, 3.125476, 1, 1, 1, 1, 1,
1.540572, 1.247071, 1.845608, 1, 1, 1, 1, 1,
1.54367, -0.8816437, 1.838117, 1, 1, 1, 1, 1,
1.55904, 0.8069285, 0.06040232, 1, 1, 1, 1, 1,
1.561593, 0.8883592, 2.832189, 1, 1, 1, 1, 1,
1.564072, -1.373963, 2.774503, 1, 1, 1, 1, 1,
1.568001, 1.320006, 0.4318494, 1, 1, 1, 1, 1,
1.582069, -1.228714, 2.47466, 1, 1, 1, 1, 1,
1.598112, -0.9048509, 2.101077, 1, 1, 1, 1, 1,
1.598584, -0.9215798, 1.980649, 1, 1, 1, 1, 1,
1.59989, -1.661418, 4.167223, 1, 1, 1, 1, 1,
1.62027, -0.08771957, 2.639336, 0, 0, 1, 1, 1,
1.631293, -0.671897, 2.468774, 1, 0, 0, 1, 1,
1.647185, 0.8112804, 0.9276262, 1, 0, 0, 1, 1,
1.650636, -1.040845, 0.8649659, 1, 0, 0, 1, 1,
1.653071, 0.02582239, 3.528573, 1, 0, 0, 1, 1,
1.66293, -2.836408, 3.578003, 1, 0, 0, 1, 1,
1.666932, 1.535035, 0.9926066, 0, 0, 0, 1, 1,
1.693528, -1.093706, 2.352542, 0, 0, 0, 1, 1,
1.696361, 0.2145083, 1.259163, 0, 0, 0, 1, 1,
1.703253, -0.7999105, 2.726679, 0, 0, 0, 1, 1,
1.707601, -1.063039, 3.600561, 0, 0, 0, 1, 1,
1.710436, -0.2515435, 2.648223, 0, 0, 0, 1, 1,
1.712079, 0.7968518, 1.009693, 0, 0, 0, 1, 1,
1.732201, -0.3044625, 2.355837, 1, 1, 1, 1, 1,
1.740655, 0.1553546, 0.5383079, 1, 1, 1, 1, 1,
1.747028, 0.1787832, 0.1180686, 1, 1, 1, 1, 1,
1.755101, -2.409962, 2.773824, 1, 1, 1, 1, 1,
1.760375, 0.6365163, 1.450491, 1, 1, 1, 1, 1,
1.765314, 0.3498054, 1.451761, 1, 1, 1, 1, 1,
1.779033, 1.348793, 1.962445, 1, 1, 1, 1, 1,
1.797259, -1.432634, 1.870351, 1, 1, 1, 1, 1,
1.861607, 0.2884539, 0.6004751, 1, 1, 1, 1, 1,
1.8877, -0.7919388, 2.658502, 1, 1, 1, 1, 1,
1.921562, 0.1740552, 2.446375, 1, 1, 1, 1, 1,
1.937211, -0.3170104, 2.058488, 1, 1, 1, 1, 1,
1.937231, 0.01722003, 1.830256, 1, 1, 1, 1, 1,
1.972584, 1.195808, 1.976087, 1, 1, 1, 1, 1,
1.998259, 0.8664892, 0.6427094, 1, 1, 1, 1, 1,
2.059296, -1.948107, 1.701095, 0, 0, 1, 1, 1,
2.069635, -0.519146, 3.027775, 1, 0, 0, 1, 1,
2.082642, 0.1967821, 0.9098989, 1, 0, 0, 1, 1,
2.0961, 1.283616, -0.7173449, 1, 0, 0, 1, 1,
2.118622, -0.4106009, -0.1279856, 1, 0, 0, 1, 1,
2.147792, 0.2647175, 1.683988, 1, 0, 0, 1, 1,
2.155028, -0.3287873, 4.346442, 0, 0, 0, 1, 1,
2.166587, 1.385432, 0.8727155, 0, 0, 0, 1, 1,
2.171365, -0.1965598, 2.416551, 0, 0, 0, 1, 1,
2.289701, -0.2308136, 2.862179, 0, 0, 0, 1, 1,
2.354918, -1.183228, 1.599793, 0, 0, 0, 1, 1,
2.397337, 0.3830829, 3.468465, 0, 0, 0, 1, 1,
2.419943, 0.6533529, 1.796967, 0, 0, 0, 1, 1,
2.436725, -0.4519524, 2.867109, 1, 1, 1, 1, 1,
2.583711, -0.7015502, 2.928998, 1, 1, 1, 1, 1,
2.661463, 1.592513, 1.439492, 1, 1, 1, 1, 1,
2.672827, 1.57802, 0.4791638, 1, 1, 1, 1, 1,
2.803202, 0.02407005, 1.421057, 1, 1, 1, 1, 1,
2.805727, 0.06419509, 2.157671, 1, 1, 1, 1, 1,
3.940011, -0.5691946, 2.556086, 1, 1, 1, 1, 1
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
var radius = 9.677099;
var distance = 33.9904;
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
mvMatrix.translate( -0.5283241, -0.05627966, 0.03259373 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.9904);
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
