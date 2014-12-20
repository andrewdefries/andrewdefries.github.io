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
-2.713939, -0.9475148, -0.7007166, 1, 0, 0, 1,
-2.547886, 0.8145888, -3.266394, 1, 0.007843138, 0, 1,
-2.534875, -0.9498845, -0.4576852, 1, 0.01176471, 0, 1,
-2.453218, -1.118242, -1.441798, 1, 0.01960784, 0, 1,
-2.40096, -0.8949898, -0.881034, 1, 0.02352941, 0, 1,
-2.396683, -0.4442303, -2.718687, 1, 0.03137255, 0, 1,
-2.394109, 0.4977424, -0.07506596, 1, 0.03529412, 0, 1,
-2.38, -0.4018141, -1.548477, 1, 0.04313726, 0, 1,
-2.318135, 1.827831, -1.787943, 1, 0.04705882, 0, 1,
-2.309542, -0.2486718, -0.5471998, 1, 0.05490196, 0, 1,
-2.296978, 1.457959, 0.7614042, 1, 0.05882353, 0, 1,
-2.22424, -0.5293705, -1.316266, 1, 0.06666667, 0, 1,
-2.215993, 0.917619, -2.424559, 1, 0.07058824, 0, 1,
-2.209278, -0.4963415, -0.8430469, 1, 0.07843138, 0, 1,
-2.196702, -0.7631074, -2.950254, 1, 0.08235294, 0, 1,
-2.117984, 0.9599697, -0.358093, 1, 0.09019608, 0, 1,
-2.117424, -1.156533, -3.058322, 1, 0.09411765, 0, 1,
-2.050708, -0.1805963, -2.332488, 1, 0.1019608, 0, 1,
-2.048002, -1.416493, -1.879733, 1, 0.1098039, 0, 1,
-2.008575, 0.01926064, -3.67185, 1, 0.1137255, 0, 1,
-2.004539, -0.2312809, -1.348714, 1, 0.1215686, 0, 1,
-1.997712, -1.7518, -3.491001, 1, 0.1254902, 0, 1,
-1.964288, 1.427164, -1.421214, 1, 0.1333333, 0, 1,
-1.944266, -0.7046925, -3.24661, 1, 0.1372549, 0, 1,
-1.926467, -0.002283722, -2.318678, 1, 0.145098, 0, 1,
-1.923151, 1.11751, -3.380271, 1, 0.1490196, 0, 1,
-1.915245, -1.885157, -2.991768, 1, 0.1568628, 0, 1,
-1.902884, -1.12108, -3.560102, 1, 0.1607843, 0, 1,
-1.900494, 0.5524656, -0.3222846, 1, 0.1686275, 0, 1,
-1.888857, 0.3736769, -1.453718, 1, 0.172549, 0, 1,
-1.867916, 0.8318883, -0.7962814, 1, 0.1803922, 0, 1,
-1.849171, 0.07797607, -1.229037, 1, 0.1843137, 0, 1,
-1.822809, 0.0817483, -2.240717, 1, 0.1921569, 0, 1,
-1.809798, -0.04913151, -2.605273, 1, 0.1960784, 0, 1,
-1.806159, 1.617713, -1.608526, 1, 0.2039216, 0, 1,
-1.805764, -1.071937, -4.180079, 1, 0.2117647, 0, 1,
-1.757333, 1.542016, -1.190707, 1, 0.2156863, 0, 1,
-1.748223, 0.9457798, 0.5729608, 1, 0.2235294, 0, 1,
-1.721233, -2.208922, -3.701743, 1, 0.227451, 0, 1,
-1.720557, 0.1945748, -1.347557, 1, 0.2352941, 0, 1,
-1.697938, 2.418358, -0.8814523, 1, 0.2392157, 0, 1,
-1.683419, -0.7856909, -3.036794, 1, 0.2470588, 0, 1,
-1.675345, -0.1967794, -3.284956, 1, 0.2509804, 0, 1,
-1.670208, -1.013869, -1.448985, 1, 0.2588235, 0, 1,
-1.670057, 0.007903188, -1.495338, 1, 0.2627451, 0, 1,
-1.655023, 0.5428332, -2.015398, 1, 0.2705882, 0, 1,
-1.6454, 0.4673992, -0.8863793, 1, 0.2745098, 0, 1,
-1.638251, 0.6440103, -3.097304, 1, 0.282353, 0, 1,
-1.629273, -0.1078698, -2.824239, 1, 0.2862745, 0, 1,
-1.62926, 2.815507, 0.08990052, 1, 0.2941177, 0, 1,
-1.623326, -2.127485, -2.547727, 1, 0.3019608, 0, 1,
-1.613816, -1.277419, -4.695826, 1, 0.3058824, 0, 1,
-1.597582, -0.01914636, 0.02183389, 1, 0.3137255, 0, 1,
-1.596558, -1.80398, -1.966195, 1, 0.3176471, 0, 1,
-1.584448, 0.6300906, -2.225957, 1, 0.3254902, 0, 1,
-1.579616, 0.7492055, -1.928857, 1, 0.3294118, 0, 1,
-1.574283, -0.5371088, -1.449012, 1, 0.3372549, 0, 1,
-1.559874, 1.214584, -1.592174, 1, 0.3411765, 0, 1,
-1.557418, -0.1705275, -0.4448622, 1, 0.3490196, 0, 1,
-1.542995, -0.4617253, -1.662556, 1, 0.3529412, 0, 1,
-1.534076, 1.079356, -0.6171374, 1, 0.3607843, 0, 1,
-1.533769, -0.1518718, -1.971738, 1, 0.3647059, 0, 1,
-1.52675, 0.8574935, -1.519725, 1, 0.372549, 0, 1,
-1.50997, -1.319561, -1.518859, 1, 0.3764706, 0, 1,
-1.504468, 0.7009663, -1.038588, 1, 0.3843137, 0, 1,
-1.503298, 1.825604, -0.6483876, 1, 0.3882353, 0, 1,
-1.497883, -1.636461, -1.640587, 1, 0.3960784, 0, 1,
-1.487242, -0.8346965, -1.809201, 1, 0.4039216, 0, 1,
-1.47671, -0.3814633, -0.9260159, 1, 0.4078431, 0, 1,
-1.469578, -0.2313782, -2.490157, 1, 0.4156863, 0, 1,
-1.465535, 0.142334, -1.353745, 1, 0.4196078, 0, 1,
-1.465416, 1.03664, 0.07968224, 1, 0.427451, 0, 1,
-1.461452, 0.3741669, -1.504699, 1, 0.4313726, 0, 1,
-1.461284, -0.1676001, -0.9750177, 1, 0.4392157, 0, 1,
-1.445975, -0.1483359, -1.701695, 1, 0.4431373, 0, 1,
-1.444624, -0.3272735, -2.301587, 1, 0.4509804, 0, 1,
-1.442102, -0.3172406, -1.805315, 1, 0.454902, 0, 1,
-1.412815, 0.7144532, -2.793413, 1, 0.4627451, 0, 1,
-1.410398, 0.1095446, -0.5859988, 1, 0.4666667, 0, 1,
-1.401324, -1.447556, -2.299561, 1, 0.4745098, 0, 1,
-1.377736, -0.8988541, -1.988322, 1, 0.4784314, 0, 1,
-1.369661, -1.053997, -4.957287, 1, 0.4862745, 0, 1,
-1.366753, 0.2402771, -1.481484, 1, 0.4901961, 0, 1,
-1.361121, -0.4406609, -2.270514, 1, 0.4980392, 0, 1,
-1.358856, 1.648844, -2.517156, 1, 0.5058824, 0, 1,
-1.357205, -2.130693, -3.673139, 1, 0.509804, 0, 1,
-1.346429, 0.8392959, -2.082046, 1, 0.5176471, 0, 1,
-1.346428, 0.8816786, -1.781155, 1, 0.5215687, 0, 1,
-1.342803, -0.02480406, -0.4508017, 1, 0.5294118, 0, 1,
-1.342602, -1.960851, -2.539605, 1, 0.5333334, 0, 1,
-1.335475, -0.2068634, -2.28689, 1, 0.5411765, 0, 1,
-1.328181, -0.1162818, -2.737319, 1, 0.5450981, 0, 1,
-1.32629, 1.46281, -1.332032, 1, 0.5529412, 0, 1,
-1.319012, 1.574513, -0.9643669, 1, 0.5568628, 0, 1,
-1.318646, -0.6013721, -3.469884, 1, 0.5647059, 0, 1,
-1.310455, 1.591189, -0.3227781, 1, 0.5686275, 0, 1,
-1.3029, 0.497435, -1.599846, 1, 0.5764706, 0, 1,
-1.296768, -0.9978101, -1.241014, 1, 0.5803922, 0, 1,
-1.293536, 1.395524, 0.1193059, 1, 0.5882353, 0, 1,
-1.289297, 1.352852, -1.984429, 1, 0.5921569, 0, 1,
-1.288269, -1.043236, -0.2848276, 1, 0.6, 0, 1,
-1.282472, -0.8345744, -2.224005, 1, 0.6078432, 0, 1,
-1.280426, -0.0146998, -1.069018, 1, 0.6117647, 0, 1,
-1.268739, 0.5439199, -1.390498, 1, 0.6196079, 0, 1,
-1.263122, -0.442877, -0.8232731, 1, 0.6235294, 0, 1,
-1.262056, 0.6541159, -1.413843, 1, 0.6313726, 0, 1,
-1.249128, -0.392942, -2.320801, 1, 0.6352941, 0, 1,
-1.245989, 0.2512651, -0.3195548, 1, 0.6431373, 0, 1,
-1.239734, 0.7531096, -0.9074545, 1, 0.6470588, 0, 1,
-1.23531, 0.4761317, -0.8924578, 1, 0.654902, 0, 1,
-1.233318, 0.164424, -3.733696, 1, 0.6588235, 0, 1,
-1.225838, -0.4757241, -1.629964, 1, 0.6666667, 0, 1,
-1.223887, -1.383833, -3.440093, 1, 0.6705883, 0, 1,
-1.212885, -0.4223914, -1.375986, 1, 0.6784314, 0, 1,
-1.209004, -0.2926025, -1.492553, 1, 0.682353, 0, 1,
-1.202253, 1.124632, 0.01974525, 1, 0.6901961, 0, 1,
-1.200607, 0.432576, 0.9034662, 1, 0.6941177, 0, 1,
-1.197423, 2.030242, 0.3079123, 1, 0.7019608, 0, 1,
-1.188663, 0.7719779, -1.806157, 1, 0.7098039, 0, 1,
-1.185452, 0.7274851, -1.225518, 1, 0.7137255, 0, 1,
-1.185123, -0.1911906, -0.7413359, 1, 0.7215686, 0, 1,
-1.181356, -0.5723417, -4.355874, 1, 0.7254902, 0, 1,
-1.177611, 0.9123203, -2.29631, 1, 0.7333333, 0, 1,
-1.176456, -0.6784542, -2.413269, 1, 0.7372549, 0, 1,
-1.175483, 0.204591, -0.415311, 1, 0.7450981, 0, 1,
-1.173902, -1.25653, -1.594496, 1, 0.7490196, 0, 1,
-1.170926, 0.3255859, -2.960035, 1, 0.7568628, 0, 1,
-1.165042, -0.58018, -2.049531, 1, 0.7607843, 0, 1,
-1.160616, 0.170165, -2.269159, 1, 0.7686275, 0, 1,
-1.158388, 0.9572536, -2.123369, 1, 0.772549, 0, 1,
-1.154562, -1.525366, -0.2701963, 1, 0.7803922, 0, 1,
-1.15237, -0.1106095, -0.7174453, 1, 0.7843137, 0, 1,
-1.148428, 0.3871174, -1.766728, 1, 0.7921569, 0, 1,
-1.148216, 1.693646, -0.3165328, 1, 0.7960784, 0, 1,
-1.14654, -0.5643671, -2.450255, 1, 0.8039216, 0, 1,
-1.144219, 0.850014, -1.374667, 1, 0.8117647, 0, 1,
-1.140766, 0.3044866, -1.030905, 1, 0.8156863, 0, 1,
-1.135888, -1.950275, -1.109109, 1, 0.8235294, 0, 1,
-1.132782, 1.077989, -0.2709866, 1, 0.827451, 0, 1,
-1.126843, -1.025509, -3.103436, 1, 0.8352941, 0, 1,
-1.119447, -0.9415312, -4.456656, 1, 0.8392157, 0, 1,
-1.112729, 1.241549, 0.2217716, 1, 0.8470588, 0, 1,
-1.107407, -1.368348, -1.284623, 1, 0.8509804, 0, 1,
-1.103008, -1.879711, -3.365873, 1, 0.8588235, 0, 1,
-1.102872, -0.257211, -1.827882, 1, 0.8627451, 0, 1,
-1.097653, -0.9928489, -3.232931, 1, 0.8705882, 0, 1,
-1.092366, -0.1174658, -1.152633, 1, 0.8745098, 0, 1,
-1.089668, -0.520209, 0.7060776, 1, 0.8823529, 0, 1,
-1.086355, -0.2874495, -2.432444, 1, 0.8862745, 0, 1,
-1.085689, 0.5786743, -2.536535, 1, 0.8941177, 0, 1,
-1.080203, 0.7008916, -0.5071617, 1, 0.8980392, 0, 1,
-1.079819, 2.478173, -0.8186996, 1, 0.9058824, 0, 1,
-1.076888, -1.464139, -3.736888, 1, 0.9137255, 0, 1,
-1.070427, 0.2558904, -1.637255, 1, 0.9176471, 0, 1,
-1.066881, -0.3664768, -1.892136, 1, 0.9254902, 0, 1,
-1.063247, 1.467351, 0.1498808, 1, 0.9294118, 0, 1,
-1.05738, 2.514937, -1.677157, 1, 0.9372549, 0, 1,
-1.053817, -0.1250917, -0.9087847, 1, 0.9411765, 0, 1,
-1.051763, 0.296248, -2.383124, 1, 0.9490196, 0, 1,
-1.045603, -2.371105, -4.388934, 1, 0.9529412, 0, 1,
-1.038915, -0.004337013, -1.472756, 1, 0.9607843, 0, 1,
-1.033292, -0.05544505, 0.3506073, 1, 0.9647059, 0, 1,
-1.032939, -0.2092813, 0.2385128, 1, 0.972549, 0, 1,
-1.030403, 0.6228389, -2.00167, 1, 0.9764706, 0, 1,
-1.029753, 1.211913, -0.9941801, 1, 0.9843137, 0, 1,
-1.029145, -1.852121, -1.16844, 1, 0.9882353, 0, 1,
-1.020485, -0.9847053, -2.576515, 1, 0.9960784, 0, 1,
-1.018983, -1.077569, -3.824482, 0.9960784, 1, 0, 1,
-1.017861, 0.6063645, -1.232426, 0.9921569, 1, 0, 1,
-1.010625, 1.744473, 0.05786592, 0.9843137, 1, 0, 1,
-1.006916, 0.6476219, -1.57672, 0.9803922, 1, 0, 1,
-1.003664, -0.4827578, -2.691643, 0.972549, 1, 0, 1,
-1.002258, 0.2458329, -3.407687, 0.9686275, 1, 0, 1,
-0.9937772, -1.913503, -2.823875, 0.9607843, 1, 0, 1,
-0.9836304, -0.9707, -3.255455, 0.9568627, 1, 0, 1,
-0.9794411, -0.9633433, -1.540412, 0.9490196, 1, 0, 1,
-0.9739069, 1.046501, -1.043822, 0.945098, 1, 0, 1,
-0.9676049, -1.431347, -3.135664, 0.9372549, 1, 0, 1,
-0.9619038, -0.5568033, -0.832706, 0.9333333, 1, 0, 1,
-0.9601129, -0.06192477, -2.647921, 0.9254902, 1, 0, 1,
-0.9585168, -1.247106, -0.7102793, 0.9215686, 1, 0, 1,
-0.943583, 1.49276, 0.03598464, 0.9137255, 1, 0, 1,
-0.9379908, 0.3753738, -0.9383156, 0.9098039, 1, 0, 1,
-0.9195173, -0.7820723, -2.59908, 0.9019608, 1, 0, 1,
-0.917668, 0.2304422, -0.7003849, 0.8941177, 1, 0, 1,
-0.9161832, 0.6677329, -2.703012, 0.8901961, 1, 0, 1,
-0.914913, -0.5460234, -1.887423, 0.8823529, 1, 0, 1,
-0.9113597, 1.839062, -0.8497216, 0.8784314, 1, 0, 1,
-0.9110562, -1.305037, -2.084818, 0.8705882, 1, 0, 1,
-0.9092198, 1.660036, -1.176983, 0.8666667, 1, 0, 1,
-0.9085761, 0.3934048, 0.4846489, 0.8588235, 1, 0, 1,
-0.9071252, 0.6329334, -1.980758, 0.854902, 1, 0, 1,
-0.9069351, -0.5006973, -1.140622, 0.8470588, 1, 0, 1,
-0.8993531, 0.9866636, -0.06723243, 0.8431373, 1, 0, 1,
-0.8990052, 0.7852752, -0.8874644, 0.8352941, 1, 0, 1,
-0.8987529, -0.4964469, -0.5700576, 0.8313726, 1, 0, 1,
-0.8982602, -1.353592, -3.119293, 0.8235294, 1, 0, 1,
-0.8958367, -0.2017677, -2.427377, 0.8196079, 1, 0, 1,
-0.8836641, -0.6543477, -2.193257, 0.8117647, 1, 0, 1,
-0.8679551, 0.7585664, 1.015268, 0.8078431, 1, 0, 1,
-0.8679533, -0.7105074, -0.9086796, 0.8, 1, 0, 1,
-0.8655738, -0.5028807, -1.278124, 0.7921569, 1, 0, 1,
-0.8625056, 1.745318, -1.538167, 0.7882353, 1, 0, 1,
-0.8619084, -0.3675774, -1.227674, 0.7803922, 1, 0, 1,
-0.8596585, 0.4294954, -0.06838539, 0.7764706, 1, 0, 1,
-0.853502, 1.507279, -0.5929506, 0.7686275, 1, 0, 1,
-0.8531566, 1.659787, 0.6580694, 0.7647059, 1, 0, 1,
-0.8501717, 0.1320122, -2.356898, 0.7568628, 1, 0, 1,
-0.8492898, 0.1985898, -0.8922536, 0.7529412, 1, 0, 1,
-0.848043, 0.5286792, -0.9624009, 0.7450981, 1, 0, 1,
-0.8386812, 1.48347, -0.4403856, 0.7411765, 1, 0, 1,
-0.8338482, -0.2782981, -1.726154, 0.7333333, 1, 0, 1,
-0.8289848, -0.03707768, -0.3891459, 0.7294118, 1, 0, 1,
-0.8271384, 0.1575615, -1.84883, 0.7215686, 1, 0, 1,
-0.8255439, -1.072385, 0.4367903, 0.7176471, 1, 0, 1,
-0.8164152, -1.236023, -1.615283, 0.7098039, 1, 0, 1,
-0.8100817, 1.215268, -0.9847924, 0.7058824, 1, 0, 1,
-0.8078914, 3.10457, -0.2554005, 0.6980392, 1, 0, 1,
-0.8059252, -0.5374851, -1.649772, 0.6901961, 1, 0, 1,
-0.7979729, 0.566375, -0.02128603, 0.6862745, 1, 0, 1,
-0.7978148, -1.83192, -0.582926, 0.6784314, 1, 0, 1,
-0.7921969, 0.1986269, -1.399069, 0.6745098, 1, 0, 1,
-0.7862124, -1.133793, -1.960797, 0.6666667, 1, 0, 1,
-0.7841977, 0.07020262, -1.80656, 0.6627451, 1, 0, 1,
-0.7737739, -0.1943155, -2.289485, 0.654902, 1, 0, 1,
-0.772058, -1.571805, -2.823497, 0.6509804, 1, 0, 1,
-0.7710587, -0.09907383, -3.275672, 0.6431373, 1, 0, 1,
-0.7686431, -0.1338077, -2.116619, 0.6392157, 1, 0, 1,
-0.7657377, -0.9982119, -3.648033, 0.6313726, 1, 0, 1,
-0.7629786, 1.093625, -0.09895663, 0.627451, 1, 0, 1,
-0.7616049, 0.2073349, -1.581629, 0.6196079, 1, 0, 1,
-0.7563816, 0.3612314, -1.63128, 0.6156863, 1, 0, 1,
-0.7552243, -0.9595432, -2.939286, 0.6078432, 1, 0, 1,
-0.7530931, 0.6793984, -0.6931963, 0.6039216, 1, 0, 1,
-0.7484127, -0.200626, -1.401481, 0.5960785, 1, 0, 1,
-0.7475951, -0.9853126, -2.738211, 0.5882353, 1, 0, 1,
-0.746584, -0.8579873, -0.7606478, 0.5843138, 1, 0, 1,
-0.7430903, 1.612869, -0.3729194, 0.5764706, 1, 0, 1,
-0.7409457, 1.658009, 0.9997965, 0.572549, 1, 0, 1,
-0.7377717, 0.7317685, -1.524683, 0.5647059, 1, 0, 1,
-0.7374888, -0.5827231, -2.436913, 0.5607843, 1, 0, 1,
-0.7317038, 0.2159357, -1.238908, 0.5529412, 1, 0, 1,
-0.7291567, 0.7417544, -0.333017, 0.5490196, 1, 0, 1,
-0.7281822, -1.004726, -2.112335, 0.5411765, 1, 0, 1,
-0.7266336, 0.6346892, 1.203548, 0.5372549, 1, 0, 1,
-0.7245296, -0.08921438, -1.659916, 0.5294118, 1, 0, 1,
-0.7220173, 1.567658, -1.218454, 0.5254902, 1, 0, 1,
-0.7168949, 0.1743836, -2.040475, 0.5176471, 1, 0, 1,
-0.7115445, -0.9562718, -2.741136, 0.5137255, 1, 0, 1,
-0.7112111, -0.05409507, -1.546423, 0.5058824, 1, 0, 1,
-0.7098968, -1.957536, -3.345825, 0.5019608, 1, 0, 1,
-0.7098281, 0.5000876, -0.2493864, 0.4941176, 1, 0, 1,
-0.7082153, -1.998004, -2.317003, 0.4862745, 1, 0, 1,
-0.7037099, -1.493553, -2.778108, 0.4823529, 1, 0, 1,
-0.6976144, 1.179701, 1.043507, 0.4745098, 1, 0, 1,
-0.6927063, -0.2121697, -2.488868, 0.4705882, 1, 0, 1,
-0.6919455, -0.9849359, -1.832614, 0.4627451, 1, 0, 1,
-0.6889942, -1.102798, -2.247921, 0.4588235, 1, 0, 1,
-0.6880118, -1.218058, -5.216959, 0.4509804, 1, 0, 1,
-0.6844817, -0.4183177, -1.075789, 0.4470588, 1, 0, 1,
-0.6806313, 1.340582, -1.062792, 0.4392157, 1, 0, 1,
-0.6744486, 0.5049204, -1.287427, 0.4352941, 1, 0, 1,
-0.6712146, -0.293431, -1.965969, 0.427451, 1, 0, 1,
-0.6684685, 0.4895869, -0.7984385, 0.4235294, 1, 0, 1,
-0.6674091, 1.050562, -0.6711955, 0.4156863, 1, 0, 1,
-0.6648266, 1.325602, -0.3569796, 0.4117647, 1, 0, 1,
-0.6614449, -1.246055, -3.143005, 0.4039216, 1, 0, 1,
-0.6614394, -1.049494, -1.772089, 0.3960784, 1, 0, 1,
-0.6572896, -0.5397976, -2.3248, 0.3921569, 1, 0, 1,
-0.6554372, -1.070136, -0.003122936, 0.3843137, 1, 0, 1,
-0.6550799, -0.4315314, -2.930526, 0.3803922, 1, 0, 1,
-0.6515034, -0.08633071, -2.721463, 0.372549, 1, 0, 1,
-0.648396, -0.01841171, -2.064734, 0.3686275, 1, 0, 1,
-0.6480903, -0.2126558, 0.4702842, 0.3607843, 1, 0, 1,
-0.6447054, 0.003698859, -0.9743353, 0.3568628, 1, 0, 1,
-0.6402516, -1.934854, -1.841416, 0.3490196, 1, 0, 1,
-0.6383985, -0.5857263, -3.435708, 0.345098, 1, 0, 1,
-0.6301523, 0.8681713, -0.2904882, 0.3372549, 1, 0, 1,
-0.6278389, -0.8483258, -1.913355, 0.3333333, 1, 0, 1,
-0.6237721, -0.9756401, -2.132633, 0.3254902, 1, 0, 1,
-0.6232363, 0.2865445, -1.586931, 0.3215686, 1, 0, 1,
-0.6224335, -0.3463724, -2.352932, 0.3137255, 1, 0, 1,
-0.6223931, 0.397216, -0.2450852, 0.3098039, 1, 0, 1,
-0.6154513, -0.4704511, -2.884916, 0.3019608, 1, 0, 1,
-0.6147523, -0.5139531, -2.747008, 0.2941177, 1, 0, 1,
-0.6114596, 0.8014285, -0.8000067, 0.2901961, 1, 0, 1,
-0.6102939, -0.9044641, -1.365849, 0.282353, 1, 0, 1,
-0.6101625, -1.731743, -5.343304, 0.2784314, 1, 0, 1,
-0.6061915, -0.09023568, -0.02088477, 0.2705882, 1, 0, 1,
-0.6040148, 0.9800658, -0.396565, 0.2666667, 1, 0, 1,
-0.5999963, -0.8812794, -3.08165, 0.2588235, 1, 0, 1,
-0.5972958, 1.599959, -0.5492904, 0.254902, 1, 0, 1,
-0.594884, -0.03398589, -1.698323, 0.2470588, 1, 0, 1,
-0.5948268, -0.5309449, -0.8336191, 0.2431373, 1, 0, 1,
-0.5917156, 0.7560377, -1.674909, 0.2352941, 1, 0, 1,
-0.5896031, -1.148295, -2.113119, 0.2313726, 1, 0, 1,
-0.5895481, 0.03866245, -1.035622, 0.2235294, 1, 0, 1,
-0.5880274, -0.9223301, -2.760762, 0.2196078, 1, 0, 1,
-0.5856903, 0.6429614, -1.71807, 0.2117647, 1, 0, 1,
-0.5705131, -1.918381, -1.911031, 0.2078431, 1, 0, 1,
-0.5646934, 0.06957061, -2.199108, 0.2, 1, 0, 1,
-0.5620769, 0.1834405, -1.085364, 0.1921569, 1, 0, 1,
-0.5605271, 0.8381899, 1.125162, 0.1882353, 1, 0, 1,
-0.5576497, -0.2374503, -2.338815, 0.1803922, 1, 0, 1,
-0.5570996, -0.6009939, -3.07818, 0.1764706, 1, 0, 1,
-0.553143, -0.8717493, -4.807938, 0.1686275, 1, 0, 1,
-0.5530158, 0.8635851, -1.005859, 0.1647059, 1, 0, 1,
-0.5494191, -0.9922982, -2.800692, 0.1568628, 1, 0, 1,
-0.5471378, 0.9405348, -0.5749121, 0.1529412, 1, 0, 1,
-0.5468955, 1.673892, -0.122291, 0.145098, 1, 0, 1,
-0.5422993, 0.7733416, 1.702218, 0.1411765, 1, 0, 1,
-0.5394261, 0.5633995, 0.4770429, 0.1333333, 1, 0, 1,
-0.5376015, 0.2006819, -0.8327273, 0.1294118, 1, 0, 1,
-0.530074, 0.6219826, -0.4299346, 0.1215686, 1, 0, 1,
-0.5291119, 0.5023171, 0.7909352, 0.1176471, 1, 0, 1,
-0.5281185, 0.4885766, -0.01220854, 0.1098039, 1, 0, 1,
-0.517624, -0.4847834, -1.739507, 0.1058824, 1, 0, 1,
-0.5067099, -1.239433, -4.378173, 0.09803922, 1, 0, 1,
-0.5060385, 0.7709789, -0.3575261, 0.09019608, 1, 0, 1,
-0.5009165, -0.7099456, -2.581305, 0.08627451, 1, 0, 1,
-0.4956478, -0.5533345, -3.091151, 0.07843138, 1, 0, 1,
-0.4925356, 0.2682009, -2.390593, 0.07450981, 1, 0, 1,
-0.4924065, -0.336664, -0.2985791, 0.06666667, 1, 0, 1,
-0.4832285, 0.2399241, -2.096416, 0.0627451, 1, 0, 1,
-0.481182, -0.06571733, -2.371387, 0.05490196, 1, 0, 1,
-0.4791819, -0.9552125, -1.810984, 0.05098039, 1, 0, 1,
-0.4766571, -0.4947269, -3.71365, 0.04313726, 1, 0, 1,
-0.4722295, 0.3765665, -1.342534, 0.03921569, 1, 0, 1,
-0.471672, 0.2302873, -1.006342, 0.03137255, 1, 0, 1,
-0.4650148, 0.8147658, -0.8745604, 0.02745098, 1, 0, 1,
-0.4615748, -0.5965993, -4.375921, 0.01960784, 1, 0, 1,
-0.4610715, -0.7172481, -3.490618, 0.01568628, 1, 0, 1,
-0.4600739, 0.5608422, -0.8959586, 0.007843138, 1, 0, 1,
-0.4580766, -0.09844434, -0.8188931, 0.003921569, 1, 0, 1,
-0.4534974, -0.02082301, -0.9793847, 0, 1, 0.003921569, 1,
-0.4470929, -0.4987102, -1.911499, 0, 1, 0.01176471, 1,
-0.4443994, -0.4016316, -1.612904, 0, 1, 0.01568628, 1,
-0.4431725, -1.907946, -3.335572, 0, 1, 0.02352941, 1,
-0.4425158, 0.9712291, -0.2422807, 0, 1, 0.02745098, 1,
-0.4424239, -1.393222, -2.525199, 0, 1, 0.03529412, 1,
-0.4423667, -1.430864, -3.473694, 0, 1, 0.03921569, 1,
-0.4343995, -0.3349836, -3.411766, 0, 1, 0.04705882, 1,
-0.4287809, -0.3310054, -1.918902, 0, 1, 0.05098039, 1,
-0.4229462, -0.1945284, -1.371382, 0, 1, 0.05882353, 1,
-0.4225304, -0.8645886, -1.794173, 0, 1, 0.0627451, 1,
-0.4202105, -1.99712, -2.414793, 0, 1, 0.07058824, 1,
-0.4180314, -0.4641154, -1.804996, 0, 1, 0.07450981, 1,
-0.4162846, 1.656091, -0.9295101, 0, 1, 0.08235294, 1,
-0.4137991, -0.7701872, -1.956315, 0, 1, 0.08627451, 1,
-0.4112545, -0.4967795, -1.088492, 0, 1, 0.09411765, 1,
-0.4065394, 0.6616464, -1.246623, 0, 1, 0.1019608, 1,
-0.4033031, 0.5698565, -0.1131244, 0, 1, 0.1058824, 1,
-0.4032739, -0.6376346, -3.262918, 0, 1, 0.1137255, 1,
-0.403269, 0.3764703, -1.203643, 0, 1, 0.1176471, 1,
-0.4025619, 1.252657, 0.2708563, 0, 1, 0.1254902, 1,
-0.4017575, -1.159685, -2.709598, 0, 1, 0.1294118, 1,
-0.3994445, 0.2146561, 0.0696174, 0, 1, 0.1372549, 1,
-0.3950925, 0.9132424, 0.2942967, 0, 1, 0.1411765, 1,
-0.3882652, 0.5188627, -1.371365, 0, 1, 0.1490196, 1,
-0.3848592, -1.679953, -2.685261, 0, 1, 0.1529412, 1,
-0.3790527, -0.7472566, -1.227734, 0, 1, 0.1607843, 1,
-0.3771881, 2.036292, -0.8482928, 0, 1, 0.1647059, 1,
-0.3755318, -0.4507653, -3.503911, 0, 1, 0.172549, 1,
-0.37185, -1.320598, -4.265587, 0, 1, 0.1764706, 1,
-0.3709984, 1.076255, 0.3458594, 0, 1, 0.1843137, 1,
-0.3674191, -0.6080926, -1.53319, 0, 1, 0.1882353, 1,
-0.367199, 0.2351302, -0.10286, 0, 1, 0.1960784, 1,
-0.362502, -0.1083866, -2.261205, 0, 1, 0.2039216, 1,
-0.3522481, 1.24068, -1.467802, 0, 1, 0.2078431, 1,
-0.35201, -0.7840719, -1.950729, 0, 1, 0.2156863, 1,
-0.3494125, 0.4599124, 0.02881934, 0, 1, 0.2196078, 1,
-0.3458295, -0.9988509, -2.114499, 0, 1, 0.227451, 1,
-0.3434005, 0.560657, -1.543075, 0, 1, 0.2313726, 1,
-0.3412199, -1.091345, -0.5646144, 0, 1, 0.2392157, 1,
-0.3330359, 0.1288345, 0.2198236, 0, 1, 0.2431373, 1,
-0.3304311, -0.9050785, -3.74085, 0, 1, 0.2509804, 1,
-0.3270122, 0.2672631, -0.3523076, 0, 1, 0.254902, 1,
-0.3259794, -0.001796631, -1.503967, 0, 1, 0.2627451, 1,
-0.3247557, 0.1529633, 0.4302953, 0, 1, 0.2666667, 1,
-0.3238747, -2.735956, -2.385733, 0, 1, 0.2745098, 1,
-0.3201279, 1.812538, 0.4166566, 0, 1, 0.2784314, 1,
-0.3145487, 0.5142629, -0.9045514, 0, 1, 0.2862745, 1,
-0.3136659, 0.299734, 0.005379073, 0, 1, 0.2901961, 1,
-0.3088072, 0.4578806, 0.2765084, 0, 1, 0.2980392, 1,
-0.3072369, -0.7950044, -4.392138, 0, 1, 0.3058824, 1,
-0.3061468, 0.2996148, -0.7460263, 0, 1, 0.3098039, 1,
-0.301948, -0.4230319, -5.166925, 0, 1, 0.3176471, 1,
-0.3003378, -0.1437703, -1.181406, 0, 1, 0.3215686, 1,
-0.2994286, 0.07672238, 1.030702, 0, 1, 0.3294118, 1,
-0.2963657, 1.194412, -0.3057314, 0, 1, 0.3333333, 1,
-0.295079, -0.1964168, -1.06529, 0, 1, 0.3411765, 1,
-0.2943593, -0.3348689, -3.265308, 0, 1, 0.345098, 1,
-0.2905997, -0.9723999, -4.077177, 0, 1, 0.3529412, 1,
-0.285679, 0.1407935, 0.1290527, 0, 1, 0.3568628, 1,
-0.2820754, 0.4867519, -0.6374352, 0, 1, 0.3647059, 1,
-0.2819425, 1.103401, -0.3364342, 0, 1, 0.3686275, 1,
-0.2806417, 0.1017118, -0.8452932, 0, 1, 0.3764706, 1,
-0.2755346, 0.2891999, -1.348409, 0, 1, 0.3803922, 1,
-0.2719863, 0.7960115, 1.685881, 0, 1, 0.3882353, 1,
-0.2675102, 0.1894022, -1.076112, 0, 1, 0.3921569, 1,
-0.2646976, -0.6214651, -2.279941, 0, 1, 0.4, 1,
-0.2639373, 0.552349, -1.991119, 0, 1, 0.4078431, 1,
-0.2616883, -1.165593, -2.338466, 0, 1, 0.4117647, 1,
-0.2582923, 1.159784, 1.399997, 0, 1, 0.4196078, 1,
-0.2580499, -0.765492, -2.716999, 0, 1, 0.4235294, 1,
-0.2543533, 0.4495624, -3.200754, 0, 1, 0.4313726, 1,
-0.2542216, 2.179584, -0.2883344, 0, 1, 0.4352941, 1,
-0.2469856, 0.1794653, -1.104026, 0, 1, 0.4431373, 1,
-0.2465983, -0.6141287, -0.4594432, 0, 1, 0.4470588, 1,
-0.2465688, -0.2387411, -1.176063, 0, 1, 0.454902, 1,
-0.2451234, 1.962298, -1.27323, 0, 1, 0.4588235, 1,
-0.2446764, 1.453365, 1.72409, 0, 1, 0.4666667, 1,
-0.2425006, -1.785078, -3.52735, 0, 1, 0.4705882, 1,
-0.2424913, 0.402182, -0.2353157, 0, 1, 0.4784314, 1,
-0.2408149, 0.3112401, -1.911671, 0, 1, 0.4823529, 1,
-0.237232, 0.849768, -0.4471819, 0, 1, 0.4901961, 1,
-0.2362184, -2.364538, -2.122155, 0, 1, 0.4941176, 1,
-0.2356147, 0.1153886, -0.6593815, 0, 1, 0.5019608, 1,
-0.2303655, -0.9822713, -2.71394, 0, 1, 0.509804, 1,
-0.2297397, 0.5986785, -0.4643244, 0, 1, 0.5137255, 1,
-0.2290504, 1.456575, 0.8796093, 0, 1, 0.5215687, 1,
-0.2272245, -0.2162075, -2.011811, 0, 1, 0.5254902, 1,
-0.2255284, -0.9073387, -2.774279, 0, 1, 0.5333334, 1,
-0.220028, 0.937104, -0.5402359, 0, 1, 0.5372549, 1,
-0.2166911, 0.1255941, -1.911162, 0, 1, 0.5450981, 1,
-0.216225, 1.845659, 2.428049, 0, 1, 0.5490196, 1,
-0.2151781, 1.107571, -1.18158, 0, 1, 0.5568628, 1,
-0.2139486, -0.8416976, -3.158211, 0, 1, 0.5607843, 1,
-0.2121031, 0.08675802, -0.04490838, 0, 1, 0.5686275, 1,
-0.2107485, 1.364093, 0.3089604, 0, 1, 0.572549, 1,
-0.2071366, -1.760433, -2.343443, 0, 1, 0.5803922, 1,
-0.2024745, 0.2430449, -2.506045, 0, 1, 0.5843138, 1,
-0.2020937, 0.02248864, -2.338702, 0, 1, 0.5921569, 1,
-0.2007023, 2.483419, -0.1057429, 0, 1, 0.5960785, 1,
-0.1971701, -0.1124773, -1.194338, 0, 1, 0.6039216, 1,
-0.1943639, -0.4980977, -2.383105, 0, 1, 0.6117647, 1,
-0.1921378, 0.5870213, -0.4118482, 0, 1, 0.6156863, 1,
-0.1909465, -0.4430367, -0.5019945, 0, 1, 0.6235294, 1,
-0.1883397, 1.812055, 0.7786707, 0, 1, 0.627451, 1,
-0.1785983, 0.5149005, 2.140442, 0, 1, 0.6352941, 1,
-0.178449, -1.460041, -2.819856, 0, 1, 0.6392157, 1,
-0.1725377, 0.1610627, -1.722266, 0, 1, 0.6470588, 1,
-0.1719389, 1.048801, -1.483258, 0, 1, 0.6509804, 1,
-0.1696473, 0.85134, -0.6581883, 0, 1, 0.6588235, 1,
-0.1650949, 1.027071, -0.4589598, 0, 1, 0.6627451, 1,
-0.1643622, 0.7146106, -1.634907, 0, 1, 0.6705883, 1,
-0.1635774, -1.160378, -2.97041, 0, 1, 0.6745098, 1,
-0.1632189, 0.4420002, 0.352784, 0, 1, 0.682353, 1,
-0.1622431, 0.7749338, 0.2631564, 0, 1, 0.6862745, 1,
-0.1620378, 0.6586378, 0.7206753, 0, 1, 0.6941177, 1,
-0.1616616, 0.729626, 2.093787, 0, 1, 0.7019608, 1,
-0.1535826, 0.8871188, 1.111538, 0, 1, 0.7058824, 1,
-0.1534353, 0.1828629, 0.9072735, 0, 1, 0.7137255, 1,
-0.1528257, -0.9681894, -3.512871, 0, 1, 0.7176471, 1,
-0.1472099, 0.3289806, -1.144749, 0, 1, 0.7254902, 1,
-0.1460305, 0.2759418, 2.539614, 0, 1, 0.7294118, 1,
-0.1401481, 1.319743, 0.2206778, 0, 1, 0.7372549, 1,
-0.1379635, -0.816649, -4.026219, 0, 1, 0.7411765, 1,
-0.1359361, 0.04943068, -2.115739, 0, 1, 0.7490196, 1,
-0.1340284, -0.6502554, -1.764932, 0, 1, 0.7529412, 1,
-0.1317196, -0.6817935, -1.756876, 0, 1, 0.7607843, 1,
-0.1294963, -1.106761, -3.054753, 0, 1, 0.7647059, 1,
-0.1279694, -1.722049, -2.205486, 0, 1, 0.772549, 1,
-0.1272103, -0.9775957, -2.994522, 0, 1, 0.7764706, 1,
-0.1253637, -0.5718512, -1.721342, 0, 1, 0.7843137, 1,
-0.1233799, 0.006040727, -0.4635262, 0, 1, 0.7882353, 1,
-0.1220743, -1.852813, -2.831933, 0, 1, 0.7960784, 1,
-0.1204796, -0.07420599, -1.621913, 0, 1, 0.8039216, 1,
-0.1198972, 0.226305, 1.098934, 0, 1, 0.8078431, 1,
-0.1195418, -1.326123, -1.576077, 0, 1, 0.8156863, 1,
-0.1126351, 0.8622487, -0.167817, 0, 1, 0.8196079, 1,
-0.1091772, -0.5994864, -3.110824, 0, 1, 0.827451, 1,
-0.1046629, -0.9941689, -2.13811, 0, 1, 0.8313726, 1,
-0.1026332, 2.173407, 0.1010265, 0, 1, 0.8392157, 1,
-0.09394114, 0.138614, 0.0003312078, 0, 1, 0.8431373, 1,
-0.09119758, 1.141553, -0.9445223, 0, 1, 0.8509804, 1,
-0.08829647, -0.3319286, 0.4888794, 0, 1, 0.854902, 1,
-0.08736381, 0.7446218, 1.030361, 0, 1, 0.8627451, 1,
-0.08045681, 0.5468845, 0.4187951, 0, 1, 0.8666667, 1,
-0.07712816, 0.4242729, 0.9297245, 0, 1, 0.8745098, 1,
-0.0739751, 0.9312979, -0.9645554, 0, 1, 0.8784314, 1,
-0.07351533, 0.823489, 1.055789, 0, 1, 0.8862745, 1,
-0.06792455, -0.677111, -2.506294, 0, 1, 0.8901961, 1,
-0.06364486, 0.4343535, -0.2266601, 0, 1, 0.8980392, 1,
-0.060948, -0.6012319, -4.224823, 0, 1, 0.9058824, 1,
-0.05921473, -0.103809, -3.274121, 0, 1, 0.9098039, 1,
-0.05374619, 0.8737585, 0.8379923, 0, 1, 0.9176471, 1,
-0.04641863, 0.4028205, -2.331577, 0, 1, 0.9215686, 1,
-0.04550711, 0.9851816, 0.3952578, 0, 1, 0.9294118, 1,
-0.04238852, -0.1752349, -4.481843, 0, 1, 0.9333333, 1,
-0.04197786, 0.4507594, 0.3402858, 0, 1, 0.9411765, 1,
-0.03660995, -1.427413, -3.126787, 0, 1, 0.945098, 1,
-0.03479999, 2.190766, -0.8039576, 0, 1, 0.9529412, 1,
-0.03213603, 1.66377, -0.01881464, 0, 1, 0.9568627, 1,
-0.0280108, -1.141864, -2.731378, 0, 1, 0.9647059, 1,
-0.02391119, -0.6167954, -3.076602, 0, 1, 0.9686275, 1,
-0.01818432, 0.2851892, 2.708482, 0, 1, 0.9764706, 1,
-0.01784837, -0.04845891, -3.968109, 0, 1, 0.9803922, 1,
-0.01523325, -0.488671, -1.536526, 0, 1, 0.9882353, 1,
-0.008224418, 0.8961272, -0.152612, 0, 1, 0.9921569, 1,
-0.006353826, -0.7285346, -3.316075, 0, 1, 1, 1,
-0.002954774, -1.729517, -4.805536, 0, 0.9921569, 1, 1,
0.003599033, 1.066934, 0.1052455, 0, 0.9882353, 1, 1,
0.004160631, -0.2682441, 2.572324, 0, 0.9803922, 1, 1,
0.009165212, -0.7442863, 2.484182, 0, 0.9764706, 1, 1,
0.01119775, -0.07575538, 2.698002, 0, 0.9686275, 1, 1,
0.01214725, 0.7579693, 0.1232272, 0, 0.9647059, 1, 1,
0.01541666, -0.1056069, 2.055619, 0, 0.9568627, 1, 1,
0.01875584, 1.25904, 0.6158925, 0, 0.9529412, 1, 1,
0.02055046, 0.5203491, -0.279693, 0, 0.945098, 1, 1,
0.02263023, 0.2501593, 0.1599881, 0, 0.9411765, 1, 1,
0.02528414, 0.3663742, -0.3396227, 0, 0.9333333, 1, 1,
0.02598708, 0.1760245, 1.141046, 0, 0.9294118, 1, 1,
0.02862977, -0.5456262, 1.779549, 0, 0.9215686, 1, 1,
0.02917845, 0.6959159, 1.105561, 0, 0.9176471, 1, 1,
0.03469664, -2.08898, 2.980605, 0, 0.9098039, 1, 1,
0.03675347, -1.45705, 3.680297, 0, 0.9058824, 1, 1,
0.04250522, -0.5167033, 1.499798, 0, 0.8980392, 1, 1,
0.0505002, 1.565504, -0.9731196, 0, 0.8901961, 1, 1,
0.05352078, 0.2415643, -0.4703591, 0, 0.8862745, 1, 1,
0.05401482, 0.1198567, 0.09764799, 0, 0.8784314, 1, 1,
0.05649037, -0.6826354, 3.584849, 0, 0.8745098, 1, 1,
0.05944106, 0.2982267, 0.9737772, 0, 0.8666667, 1, 1,
0.06113236, -1.527039, 4.735032, 0, 0.8627451, 1, 1,
0.06146324, -0.8556194, 3.040997, 0, 0.854902, 1, 1,
0.06411948, -0.7894651, 0.9396818, 0, 0.8509804, 1, 1,
0.07082205, 0.3821351, 1.853989, 0, 0.8431373, 1, 1,
0.07154467, 0.2801101, 2.090885, 0, 0.8392157, 1, 1,
0.07255407, -0.1779319, 2.095076, 0, 0.8313726, 1, 1,
0.0728699, 0.5821354, 0.3852895, 0, 0.827451, 1, 1,
0.07367013, 1.508008, -0.5122037, 0, 0.8196079, 1, 1,
0.07398561, 0.6376731, 0.6433073, 0, 0.8156863, 1, 1,
0.07461154, 0.1898521, 0.1423601, 0, 0.8078431, 1, 1,
0.0782617, 0.5291311, 0.982042, 0, 0.8039216, 1, 1,
0.08027773, -0.9963759, 5.281958, 0, 0.7960784, 1, 1,
0.08720067, 1.386588, -0.09767558, 0, 0.7882353, 1, 1,
0.08721348, -0.478586, 2.181961, 0, 0.7843137, 1, 1,
0.09220237, 0.4133029, -0.2786157, 0, 0.7764706, 1, 1,
0.09263977, -0.110638, 2.905387, 0, 0.772549, 1, 1,
0.09515184, 0.4870346, 1.635531, 0, 0.7647059, 1, 1,
0.09635093, 1.094604, -2.118778, 0, 0.7607843, 1, 1,
0.09683703, 0.79159, -0.9590598, 0, 0.7529412, 1, 1,
0.1000209, -0.8808875, 2.506708, 0, 0.7490196, 1, 1,
0.1042383, 0.9671974, 0.8583326, 0, 0.7411765, 1, 1,
0.1050338, 0.5491605, 0.2361477, 0, 0.7372549, 1, 1,
0.1050925, 0.7757284, 0.9474196, 0, 0.7294118, 1, 1,
0.1060137, -0.1347597, 3.035907, 0, 0.7254902, 1, 1,
0.1090566, -1.488147, 4.589272, 0, 0.7176471, 1, 1,
0.1146323, -0.2525465, 2.303372, 0, 0.7137255, 1, 1,
0.1158723, -0.3418752, 2.919671, 0, 0.7058824, 1, 1,
0.1167574, -0.7693549, 1.570115, 0, 0.6980392, 1, 1,
0.1174925, -0.1487668, 0.9427682, 0, 0.6941177, 1, 1,
0.1193178, -0.0454675, 2.58578, 0, 0.6862745, 1, 1,
0.1197209, 1.102451, 0.3439167, 0, 0.682353, 1, 1,
0.1220033, 1.347723, -0.7535032, 0, 0.6745098, 1, 1,
0.1221994, 0.1188199, 2.233143, 0, 0.6705883, 1, 1,
0.1260419, 0.0722598, 1.098039, 0, 0.6627451, 1, 1,
0.1271536, -0.5178853, 3.454147, 0, 0.6588235, 1, 1,
0.1344008, -0.05393565, 2.08974, 0, 0.6509804, 1, 1,
0.1376014, 0.2964474, 0.3545756, 0, 0.6470588, 1, 1,
0.1380371, -0.03283111, 1.22347, 0, 0.6392157, 1, 1,
0.139075, -0.9553605, 2.800241, 0, 0.6352941, 1, 1,
0.1423631, 1.106288, 0.4719218, 0, 0.627451, 1, 1,
0.1441369, -1.241278, 2.919243, 0, 0.6235294, 1, 1,
0.1470285, -0.2507755, 0.9581544, 0, 0.6156863, 1, 1,
0.1509988, 1.289967, -1.78846, 0, 0.6117647, 1, 1,
0.1524719, -0.3608983, 2.307026, 0, 0.6039216, 1, 1,
0.157226, 0.4341924, -0.7009023, 0, 0.5960785, 1, 1,
0.1580984, 0.427078, -1.454844, 0, 0.5921569, 1, 1,
0.1600638, -0.564645, 3.065445, 0, 0.5843138, 1, 1,
0.163372, 0.3636285, 0.3042324, 0, 0.5803922, 1, 1,
0.1645169, -0.213905, 4.020494, 0, 0.572549, 1, 1,
0.1664574, -1.003228, 3.083032, 0, 0.5686275, 1, 1,
0.1687051, 1.876484, -0.07466795, 0, 0.5607843, 1, 1,
0.1695059, 1.292546, -0.8240327, 0, 0.5568628, 1, 1,
0.1696796, 1.171231, 1.638855, 0, 0.5490196, 1, 1,
0.1710458, 1.62906, -0.9159911, 0, 0.5450981, 1, 1,
0.1713424, -1.524315, 2.222844, 0, 0.5372549, 1, 1,
0.1719956, 0.06120712, 0.7732381, 0, 0.5333334, 1, 1,
0.1746605, -1.171668, 4.202901, 0, 0.5254902, 1, 1,
0.1790095, 0.1601394, 1.246616, 0, 0.5215687, 1, 1,
0.1796399, -0.2511192, 4.957585, 0, 0.5137255, 1, 1,
0.1819524, 0.6213264, 1.462805, 0, 0.509804, 1, 1,
0.1845614, 1.134521, 0.7623564, 0, 0.5019608, 1, 1,
0.1862058, 0.2938934, 0.9918894, 0, 0.4941176, 1, 1,
0.1877702, -1.443719, 4.498138, 0, 0.4901961, 1, 1,
0.1905136, -0.1112634, 4.521513, 0, 0.4823529, 1, 1,
0.1926194, -0.6608897, 4.748275, 0, 0.4784314, 1, 1,
0.1931326, 0.5618132, 0.5568839, 0, 0.4705882, 1, 1,
0.1948664, 0.4010834, -0.2413454, 0, 0.4666667, 1, 1,
0.1980474, 0.06784853, 0.2411779, 0, 0.4588235, 1, 1,
0.1999996, 0.7754253, -0.6479855, 0, 0.454902, 1, 1,
0.2010745, 0.589713, -1.417883, 0, 0.4470588, 1, 1,
0.2035652, 0.5767713, 0.5518049, 0, 0.4431373, 1, 1,
0.2039905, 0.4898608, 0.3458305, 0, 0.4352941, 1, 1,
0.2046785, 0.2702857, 0.8452308, 0, 0.4313726, 1, 1,
0.2054094, -1.836242, 2.009156, 0, 0.4235294, 1, 1,
0.2062643, 1.838578, 1.723588, 0, 0.4196078, 1, 1,
0.207538, 0.6799043, -0.9282783, 0, 0.4117647, 1, 1,
0.2133819, 0.2879684, -0.5141537, 0, 0.4078431, 1, 1,
0.2143794, -0.07922455, 2.637765, 0, 0.4, 1, 1,
0.2186821, -1.269516, 2.709432, 0, 0.3921569, 1, 1,
0.2200385, -0.5120898, 2.078418, 0, 0.3882353, 1, 1,
0.2216495, -1.743414, 3.62959, 0, 0.3803922, 1, 1,
0.2252856, -1.13176, 3.677756, 0, 0.3764706, 1, 1,
0.2256949, -1.60419, 3.225067, 0, 0.3686275, 1, 1,
0.2352549, 0.4621395, -0.01195168, 0, 0.3647059, 1, 1,
0.2380056, 0.3621118, -0.3715402, 0, 0.3568628, 1, 1,
0.2387786, 0.07078116, 1.090039, 0, 0.3529412, 1, 1,
0.2418247, -0.001328453, 0.947803, 0, 0.345098, 1, 1,
0.246219, -0.3445708, 2.78409, 0, 0.3411765, 1, 1,
0.2500668, -0.2738651, 1.907704, 0, 0.3333333, 1, 1,
0.2512152, 0.9243461, 0.3285637, 0, 0.3294118, 1, 1,
0.2545543, 1.309746, -1.924546, 0, 0.3215686, 1, 1,
0.2587116, 1.807773, 1.052464, 0, 0.3176471, 1, 1,
0.2679469, 0.7640373, 1.318817, 0, 0.3098039, 1, 1,
0.2748403, 1.524, -2.391769, 0, 0.3058824, 1, 1,
0.2754107, 0.9405706, 0.7890731, 0, 0.2980392, 1, 1,
0.2807423, 0.5120318, 0.2261677, 0, 0.2901961, 1, 1,
0.2851829, 0.7802724, -0.3155779, 0, 0.2862745, 1, 1,
0.2913679, -1.277074, 2.596675, 0, 0.2784314, 1, 1,
0.2923676, -0.8801491, 2.699143, 0, 0.2745098, 1, 1,
0.2946793, -1.075765, 3.171959, 0, 0.2666667, 1, 1,
0.2974986, -0.4335342, 3.285207, 0, 0.2627451, 1, 1,
0.2991086, -0.2120722, 3.58554, 0, 0.254902, 1, 1,
0.2993604, -1.726156, 2.670696, 0, 0.2509804, 1, 1,
0.3057916, -1.384688, 4.017658, 0, 0.2431373, 1, 1,
0.3061038, 0.5272728, 1.160094, 0, 0.2392157, 1, 1,
0.3075107, 0.6424395, 0.6223988, 0, 0.2313726, 1, 1,
0.308231, -0.6160187, 2.025007, 0, 0.227451, 1, 1,
0.3134407, 1.438923, 1.552971, 0, 0.2196078, 1, 1,
0.3209342, 0.8261072, 1.25359, 0, 0.2156863, 1, 1,
0.3216639, -0.4339792, 4.07515, 0, 0.2078431, 1, 1,
0.325284, 0.3449425, 2.528876, 0, 0.2039216, 1, 1,
0.3301589, -1.041229, 2.491703, 0, 0.1960784, 1, 1,
0.3314601, 0.1763679, 1.182554, 0, 0.1882353, 1, 1,
0.332007, -1.800703, 5.047171, 0, 0.1843137, 1, 1,
0.3350825, -0.1557804, 2.395008, 0, 0.1764706, 1, 1,
0.3370621, 0.3222832, 0.64262, 0, 0.172549, 1, 1,
0.3376218, 1.435118, -0.1520267, 0, 0.1647059, 1, 1,
0.3398067, -0.5604909, 1.777845, 0, 0.1607843, 1, 1,
0.3401118, 0.8820775, 0.1462916, 0, 0.1529412, 1, 1,
0.3437221, -0.6351728, 1.4025, 0, 0.1490196, 1, 1,
0.3448033, 1.801604, 0.5159345, 0, 0.1411765, 1, 1,
0.3449889, -2.497278, 2.55918, 0, 0.1372549, 1, 1,
0.3453844, 1.354567, 1.307024, 0, 0.1294118, 1, 1,
0.3573831, -0.2298017, 2.860521, 0, 0.1254902, 1, 1,
0.3614398, -0.3205171, 2.564523, 0, 0.1176471, 1, 1,
0.3676811, 1.13096, 1.13286, 0, 0.1137255, 1, 1,
0.3736314, -0.4718345, 2.923562, 0, 0.1058824, 1, 1,
0.376564, -0.5184982, 2.688423, 0, 0.09803922, 1, 1,
0.3796765, 0.3750941, 0.03352819, 0, 0.09411765, 1, 1,
0.3840996, -0.5613667, 4.106547, 0, 0.08627451, 1, 1,
0.3884065, -1.220621, 3.10331, 0, 0.08235294, 1, 1,
0.3915054, 0.6508373, 0.0437648, 0, 0.07450981, 1, 1,
0.3932962, 1.49845, -0.253958, 0, 0.07058824, 1, 1,
0.3938001, -1.712849, 2.753606, 0, 0.0627451, 1, 1,
0.3945192, -0.4731372, 0.4088796, 0, 0.05882353, 1, 1,
0.3970748, -1.604537, 2.803404, 0, 0.05098039, 1, 1,
0.3987606, 0.6040513, 1.65881, 0, 0.04705882, 1, 1,
0.4019585, -0.613897, 2.595232, 0, 0.03921569, 1, 1,
0.4019966, -1.566936, 1.231723, 0, 0.03529412, 1, 1,
0.4023764, 0.5203055, 3.168076, 0, 0.02745098, 1, 1,
0.4050556, 0.3999098, 2.152298, 0, 0.02352941, 1, 1,
0.4134566, 0.466821, 1.141828, 0, 0.01568628, 1, 1,
0.4155267, -0.9011055, 2.569056, 0, 0.01176471, 1, 1,
0.4190986, -1.057531, 3.372425, 0, 0.003921569, 1, 1,
0.4222662, 0.9835218, -0.3695926, 0.003921569, 0, 1, 1,
0.4256679, 1.133999, -0.6030686, 0.007843138, 0, 1, 1,
0.4260767, 0.5852926, -1.997858, 0.01568628, 0, 1, 1,
0.4315484, 0.3517593, 0.4552197, 0.01960784, 0, 1, 1,
0.4325324, -0.5397494, 2.318368, 0.02745098, 0, 1, 1,
0.4342361, 0.7604168, 1.481196, 0.03137255, 0, 1, 1,
0.4372249, -1.663029, 4.176019, 0.03921569, 0, 1, 1,
0.4389122, 0.6375266, 1.979222, 0.04313726, 0, 1, 1,
0.439664, 0.2293484, 3.168211, 0.05098039, 0, 1, 1,
0.44038, 0.4180813, 0.6704844, 0.05490196, 0, 1, 1,
0.4406578, 0.4416755, 1.98784, 0.0627451, 0, 1, 1,
0.4421499, 1.063645, -0.07642792, 0.06666667, 0, 1, 1,
0.4492618, -1.291702, 3.44931, 0.07450981, 0, 1, 1,
0.4547712, 0.3969213, 0.8379076, 0.07843138, 0, 1, 1,
0.4594813, 1.196437, 0.1752612, 0.08627451, 0, 1, 1,
0.4615144, -1.217821, 2.493875, 0.09019608, 0, 1, 1,
0.4644165, -0.003844008, 1.751987, 0.09803922, 0, 1, 1,
0.4687915, 2.057592, -0.108071, 0.1058824, 0, 1, 1,
0.4736231, 0.03200079, 3.352164, 0.1098039, 0, 1, 1,
0.4756965, -0.8259265, 1.37621, 0.1176471, 0, 1, 1,
0.4764362, 0.7643639, 1.703007, 0.1215686, 0, 1, 1,
0.477464, 0.6284329, 0.08141443, 0.1294118, 0, 1, 1,
0.4788744, -0.7258511, 3.072513, 0.1333333, 0, 1, 1,
0.4817697, 1.07739, 0.4685942, 0.1411765, 0, 1, 1,
0.4879646, -0.8447525, 1.844547, 0.145098, 0, 1, 1,
0.4969746, 0.6647487, 1.056066, 0.1529412, 0, 1, 1,
0.4998914, 1.174055, 0.8562051, 0.1568628, 0, 1, 1,
0.5045131, -1.846021, 3.66363, 0.1647059, 0, 1, 1,
0.504667, -0.2884955, 1.724262, 0.1686275, 0, 1, 1,
0.5077369, 1.640178, 1.536299, 0.1764706, 0, 1, 1,
0.5124899, -0.7570018, 3.304954, 0.1803922, 0, 1, 1,
0.5170051, 0.6775894, 0.8553897, 0.1882353, 0, 1, 1,
0.5215859, 0.2191468, -0.6232185, 0.1921569, 0, 1, 1,
0.5263296, 1.733636, 0.2234569, 0.2, 0, 1, 1,
0.5275175, -0.1726865, 3.865635, 0.2078431, 0, 1, 1,
0.5304112, 0.3910041, 0.5974342, 0.2117647, 0, 1, 1,
0.5306279, 0.6567301, 0.5921711, 0.2196078, 0, 1, 1,
0.5311722, 0.0358055, 2.865913, 0.2235294, 0, 1, 1,
0.5339257, 0.9288934, -0.6373426, 0.2313726, 0, 1, 1,
0.5348316, -0.4788074, 2.75753, 0.2352941, 0, 1, 1,
0.5366895, 1.281432, 0.564068, 0.2431373, 0, 1, 1,
0.5379884, 0.3354678, 1.89934, 0.2470588, 0, 1, 1,
0.5396271, 0.1618852, 2.374597, 0.254902, 0, 1, 1,
0.5409561, -0.6566522, 3.447184, 0.2588235, 0, 1, 1,
0.5418684, -1.385001, 1.740674, 0.2666667, 0, 1, 1,
0.5423033, -0.146901, 0.6702464, 0.2705882, 0, 1, 1,
0.5426899, 0.4277149, 0.8254672, 0.2784314, 0, 1, 1,
0.5520122, -1.347305, 5.380189, 0.282353, 0, 1, 1,
0.5561408, 0.3291089, 1.971588, 0.2901961, 0, 1, 1,
0.5573049, 0.8764267, 1.264731, 0.2941177, 0, 1, 1,
0.5638681, -0.303322, 1.29132, 0.3019608, 0, 1, 1,
0.564756, -0.7142791, 2.55287, 0.3098039, 0, 1, 1,
0.5679458, 0.03509935, 0.9077447, 0.3137255, 0, 1, 1,
0.5703352, -0.474602, 0.8142626, 0.3215686, 0, 1, 1,
0.5703437, 0.1040469, 1.150635, 0.3254902, 0, 1, 1,
0.5752375, -0.5204127, 3.184248, 0.3333333, 0, 1, 1,
0.5863656, -1.664528, 2.954839, 0.3372549, 0, 1, 1,
0.58809, -0.3538875, 2.046437, 0.345098, 0, 1, 1,
0.5898406, 0.1067421, 0.5101588, 0.3490196, 0, 1, 1,
0.5911188, -0.6186339, 0.741714, 0.3568628, 0, 1, 1,
0.5922936, -0.5501996, 4.046821, 0.3607843, 0, 1, 1,
0.5929045, 0.5009993, 1.027527, 0.3686275, 0, 1, 1,
0.5953395, 0.5403333, 3.420774, 0.372549, 0, 1, 1,
0.5982156, -0.1112527, 0.8730987, 0.3803922, 0, 1, 1,
0.600691, 1.768792, 0.1737932, 0.3843137, 0, 1, 1,
0.6020318, 0.3513334, 0.627723, 0.3921569, 0, 1, 1,
0.6049436, 0.3114402, -0.7522373, 0.3960784, 0, 1, 1,
0.6057093, -1.084138, 2.441474, 0.4039216, 0, 1, 1,
0.609666, -0.8770059, 1.936458, 0.4117647, 0, 1, 1,
0.6135964, -0.5362264, 1.847302, 0.4156863, 0, 1, 1,
0.615006, 0.4557165, 0.5014579, 0.4235294, 0, 1, 1,
0.6177539, 0.8682127, 0.7287316, 0.427451, 0, 1, 1,
0.6242929, -0.4201327, 1.340956, 0.4352941, 0, 1, 1,
0.6247475, -2.04087, 3.036938, 0.4392157, 0, 1, 1,
0.628865, -0.3768148, 3.374568, 0.4470588, 0, 1, 1,
0.6311387, 0.6507994, 0.6655948, 0.4509804, 0, 1, 1,
0.6338197, -2.247775, 2.140199, 0.4588235, 0, 1, 1,
0.6339042, 0.9205456, 0.4117335, 0.4627451, 0, 1, 1,
0.6445812, -1.636148, 1.449351, 0.4705882, 0, 1, 1,
0.6486937, 0.4841266, -0.7740659, 0.4745098, 0, 1, 1,
0.6507437, -1.409777, 3.749025, 0.4823529, 0, 1, 1,
0.654964, -0.05662423, 3.131059, 0.4862745, 0, 1, 1,
0.6598948, 2.659793, 0.1647463, 0.4941176, 0, 1, 1,
0.666696, -1.116389, 1.624309, 0.5019608, 0, 1, 1,
0.6677456, 0.9326514, 0.6961253, 0.5058824, 0, 1, 1,
0.6684279, 2.12502, 0.9973329, 0.5137255, 0, 1, 1,
0.6750397, 0.4253771, 0.173297, 0.5176471, 0, 1, 1,
0.6770166, -0.8661053, 3.783874, 0.5254902, 0, 1, 1,
0.6777318, 0.04207687, 0.2392198, 0.5294118, 0, 1, 1,
0.682566, -0.7997147, 4.036089, 0.5372549, 0, 1, 1,
0.6836093, 0.04999707, 2.648794, 0.5411765, 0, 1, 1,
0.6854858, -1.791952, 1.57609, 0.5490196, 0, 1, 1,
0.6891192, 0.8245683, 0.6449229, 0.5529412, 0, 1, 1,
0.6896805, -0.7903361, 2.436168, 0.5607843, 0, 1, 1,
0.6903923, -0.2708881, 2.723936, 0.5647059, 0, 1, 1,
0.6915536, 0.8063813, 1.946969, 0.572549, 0, 1, 1,
0.695837, -1.504711, 5.225419, 0.5764706, 0, 1, 1,
0.6981735, -0.4340792, 1.575286, 0.5843138, 0, 1, 1,
0.7009456, -1.913793, 2.689579, 0.5882353, 0, 1, 1,
0.7025102, 0.4829619, 0.4685006, 0.5960785, 0, 1, 1,
0.7038671, -0.5546676, 2.192082, 0.6039216, 0, 1, 1,
0.7054989, 1.220316, -0.003849638, 0.6078432, 0, 1, 1,
0.7094914, -0.03153711, 0.7075753, 0.6156863, 0, 1, 1,
0.7140937, -0.130234, 2.214106, 0.6196079, 0, 1, 1,
0.7261779, 1.470566, 2.104065, 0.627451, 0, 1, 1,
0.7346174, 0.3883313, 0.5449252, 0.6313726, 0, 1, 1,
0.7370468, -1.347528, 2.197023, 0.6392157, 0, 1, 1,
0.7371219, 2.072768, 0.4847745, 0.6431373, 0, 1, 1,
0.7389624, 0.5627324, 0.8190904, 0.6509804, 0, 1, 1,
0.7432531, -0.2740198, 0.2185285, 0.654902, 0, 1, 1,
0.7516996, -0.9294888, 2.442621, 0.6627451, 0, 1, 1,
0.7525033, -0.8282868, 0.1302612, 0.6666667, 0, 1, 1,
0.7577261, 1.393072, 0.762743, 0.6745098, 0, 1, 1,
0.763495, 1.491262, 2.685562, 0.6784314, 0, 1, 1,
0.7639694, 0.9943638, 1.178255, 0.6862745, 0, 1, 1,
0.7643339, -0.4056149, 2.25625, 0.6901961, 0, 1, 1,
0.7647876, 2.216611, 0.6085072, 0.6980392, 0, 1, 1,
0.7653233, 0.07030819, 1.562601, 0.7058824, 0, 1, 1,
0.7745167, -1.151907, 2.550584, 0.7098039, 0, 1, 1,
0.7770202, 1.333459, 2.64171, 0.7176471, 0, 1, 1,
0.7902949, -1.199876, 0.2062977, 0.7215686, 0, 1, 1,
0.7936247, 0.1371913, 2.1472, 0.7294118, 0, 1, 1,
0.7993001, -0.413316, 1.544865, 0.7333333, 0, 1, 1,
0.7995735, -0.02026898, 2.49738, 0.7411765, 0, 1, 1,
0.8086426, 0.3246887, 1.848744, 0.7450981, 0, 1, 1,
0.809241, 0.8022436, -0.0945204, 0.7529412, 0, 1, 1,
0.814353, -0.3434673, 1.820782, 0.7568628, 0, 1, 1,
0.8148829, -0.314137, 2.361121, 0.7647059, 0, 1, 1,
0.8219466, -0.8508089, 2.62973, 0.7686275, 0, 1, 1,
0.8222773, -0.09598447, 0.8562391, 0.7764706, 0, 1, 1,
0.8227812, 0.828752, 0.5853659, 0.7803922, 0, 1, 1,
0.8281258, 1.277926, 0.9027544, 0.7882353, 0, 1, 1,
0.8304663, 0.2490637, 1.139693, 0.7921569, 0, 1, 1,
0.8312288, -1.495531, 2.690513, 0.8, 0, 1, 1,
0.8317955, 1.167836, -0.08825771, 0.8078431, 0, 1, 1,
0.8338088, -0.3344488, -0.2711585, 0.8117647, 0, 1, 1,
0.8383358, -0.2136223, 2.313433, 0.8196079, 0, 1, 1,
0.8392671, -1.632233, 3.184916, 0.8235294, 0, 1, 1,
0.8409116, 0.3359751, 1.251265, 0.8313726, 0, 1, 1,
0.8411394, -2.373891, 3.438757, 0.8352941, 0, 1, 1,
0.8452439, 1.843159, 0.1636974, 0.8431373, 0, 1, 1,
0.8477364, -0.8048426, 1.394874, 0.8470588, 0, 1, 1,
0.8487083, -0.1311119, 4.074664, 0.854902, 0, 1, 1,
0.8492315, -0.9749008, 1.103871, 0.8588235, 0, 1, 1,
0.8505578, -0.9091811, 0.634453, 0.8666667, 0, 1, 1,
0.8534036, 0.7205628, 0.9796465, 0.8705882, 0, 1, 1,
0.8542568, -0.2451685, 2.154299, 0.8784314, 0, 1, 1,
0.8583844, -0.7891399, 1.355868, 0.8823529, 0, 1, 1,
0.8596214, -0.4970334, 0.4243691, 0.8901961, 0, 1, 1,
0.8707649, 0.8125193, 0.3514506, 0.8941177, 0, 1, 1,
0.8709973, -1.513322, 1.068867, 0.9019608, 0, 1, 1,
0.8744713, 2.687632, -0.1066815, 0.9098039, 0, 1, 1,
0.8745156, 1.323894, 0.7898529, 0.9137255, 0, 1, 1,
0.8786016, 0.9351259, 1.521469, 0.9215686, 0, 1, 1,
0.878765, -0.629168, 2.345992, 0.9254902, 0, 1, 1,
0.8791261, -0.3886245, 1.110825, 0.9333333, 0, 1, 1,
0.8795902, -1.336659, 3.276893, 0.9372549, 0, 1, 1,
0.8865334, -0.2442562, 1.886308, 0.945098, 0, 1, 1,
0.8890594, 0.8352329, -0.4108847, 0.9490196, 0, 1, 1,
0.8927118, 1.010571, 1.556544, 0.9568627, 0, 1, 1,
0.9117808, 1.19596, 2.291843, 0.9607843, 0, 1, 1,
0.9139122, -0.53831, 1.556554, 0.9686275, 0, 1, 1,
0.9151477, -0.7220901, 3.252139, 0.972549, 0, 1, 1,
0.9233568, 0.3112211, 1.603865, 0.9803922, 0, 1, 1,
0.9342965, -0.8973455, 3.064959, 0.9843137, 0, 1, 1,
0.9496512, 1.568059, 0.463657, 0.9921569, 0, 1, 1,
0.9510351, -0.4294503, 0.8297006, 0.9960784, 0, 1, 1,
0.9539811, -0.4705905, 1.178228, 1, 0, 0.9960784, 1,
0.9562691, -0.9400304, 2.243091, 1, 0, 0.9882353, 1,
0.9585277, -0.3616258, 2.522265, 1, 0, 0.9843137, 1,
0.9593031, -0.7518194, 2.180218, 1, 0, 0.9764706, 1,
0.963152, -0.4679395, 4.915407, 1, 0, 0.972549, 1,
0.9638009, 0.7196405, 1.280044, 1, 0, 0.9647059, 1,
0.9639147, -0.02545442, 0.1690705, 1, 0, 0.9607843, 1,
0.9674098, -0.4038478, 2.948344, 1, 0, 0.9529412, 1,
0.9723583, -0.1461864, 2.2127, 1, 0, 0.9490196, 1,
0.9770949, 0.7237718, 1.825312, 1, 0, 0.9411765, 1,
0.9785446, 1.421825, 1.842162, 1, 0, 0.9372549, 1,
0.9804167, 1.070515, 0.1084377, 1, 0, 0.9294118, 1,
0.9843963, -0.7382026, 2.925759, 1, 0, 0.9254902, 1,
0.9879627, 0.238227, 1.707093, 1, 0, 0.9176471, 1,
0.9938341, -0.1659631, -0.9106302, 1, 0, 0.9137255, 1,
0.9952943, 1.115163, 0.9895148, 1, 0, 0.9058824, 1,
1.000898, 0.5013442, 1.168752, 1, 0, 0.9019608, 1,
1.006836, -0.006712761, 2.681219, 1, 0, 0.8941177, 1,
1.013277, -0.6116787, 1.757846, 1, 0, 0.8862745, 1,
1.014877, -0.7979398, 2.357311, 1, 0, 0.8823529, 1,
1.015988, -0.3550513, 1.154214, 1, 0, 0.8745098, 1,
1.017213, -0.5403088, 2.393809, 1, 0, 0.8705882, 1,
1.021776, 0.9084447, 0.9822719, 1, 0, 0.8627451, 1,
1.023107, 0.6494558, 1.049928, 1, 0, 0.8588235, 1,
1.024717, -0.8030042, -0.2665527, 1, 0, 0.8509804, 1,
1.028397, 3.013021, -0.651984, 1, 0, 0.8470588, 1,
1.029142, -1.120051, 1.420884, 1, 0, 0.8392157, 1,
1.033675, -0.9807535, 3.931477, 1, 0, 0.8352941, 1,
1.034169, -0.2861305, 0.736891, 1, 0, 0.827451, 1,
1.03435, -1.485641, 2.276084, 1, 0, 0.8235294, 1,
1.036294, 0.02572987, 0.7297295, 1, 0, 0.8156863, 1,
1.037313, 0.4575693, 1.188226, 1, 0, 0.8117647, 1,
1.069191, -1.430754, 3.616563, 1, 0, 0.8039216, 1,
1.081268, -0.3300048, 1.09977, 1, 0, 0.7960784, 1,
1.083917, 0.4435665, -0.7645063, 1, 0, 0.7921569, 1,
1.085063, -0.273634, 3.366963, 1, 0, 0.7843137, 1,
1.089096, 0.9369369, 1.758327, 1, 0, 0.7803922, 1,
1.089664, -0.9098075, 2.061623, 1, 0, 0.772549, 1,
1.115829, -1.897843, 2.681269, 1, 0, 0.7686275, 1,
1.127542, 1.050988, 0.5608091, 1, 0, 0.7607843, 1,
1.131726, 1.306324, -0.09892642, 1, 0, 0.7568628, 1,
1.133082, -0.5575724, 3.012487, 1, 0, 0.7490196, 1,
1.135612, -0.1874961, -0.119223, 1, 0, 0.7450981, 1,
1.151362, 1.001195, 2.127096, 1, 0, 0.7372549, 1,
1.159932, -0.09003308, 3.060226, 1, 0, 0.7333333, 1,
1.172361, 0.4137079, 2.243598, 1, 0, 0.7254902, 1,
1.180303, 1.485604, -1.376103, 1, 0, 0.7215686, 1,
1.183963, 0.6261669, 1.395511, 1, 0, 0.7137255, 1,
1.185604, 0.7942236, 0.6781242, 1, 0, 0.7098039, 1,
1.190946, 0.2320428, 1.735624, 1, 0, 0.7019608, 1,
1.193586, 0.8480275, 0.441351, 1, 0, 0.6941177, 1,
1.206778, 0.2557684, 0.8737624, 1, 0, 0.6901961, 1,
1.207882, 0.5765044, 0.6923752, 1, 0, 0.682353, 1,
1.2117, -0.5920473, 1.832554, 1, 0, 0.6784314, 1,
1.216079, -2.721876, 3.060049, 1, 0, 0.6705883, 1,
1.248838, -1.512353, 1.72306, 1, 0, 0.6666667, 1,
1.25445, -0.4981666, 1.012053, 1, 0, 0.6588235, 1,
1.263941, 0.06664556, 0.9099429, 1, 0, 0.654902, 1,
1.269679, 0.2734159, 1.32402, 1, 0, 0.6470588, 1,
1.270761, 0.2434009, 0.08451523, 1, 0, 0.6431373, 1,
1.285905, 0.1628431, 1.619079, 1, 0, 0.6352941, 1,
1.29235, -1.904477, 1.352025, 1, 0, 0.6313726, 1,
1.294091, 0.491851, -0.08583532, 1, 0, 0.6235294, 1,
1.294916, 1.617824, 1.486254, 1, 0, 0.6196079, 1,
1.295487, -1.403596, 1.217573, 1, 0, 0.6117647, 1,
1.298685, 0.2886001, -0.1515328, 1, 0, 0.6078432, 1,
1.316422, 1.232685, 0.3292224, 1, 0, 0.6, 1,
1.32567, -1.549801, 1.695056, 1, 0, 0.5921569, 1,
1.326604, -1.383959, 1.574395, 1, 0, 0.5882353, 1,
1.32907, -0.9760706, 3.289881, 1, 0, 0.5803922, 1,
1.32923, 0.5262275, 0.7035179, 1, 0, 0.5764706, 1,
1.3358, -0.1606249, 1.744926, 1, 0, 0.5686275, 1,
1.337299, 1.492062, 0.2275807, 1, 0, 0.5647059, 1,
1.337897, 0.2398537, 0.9705434, 1, 0, 0.5568628, 1,
1.338276, 0.1656472, -0.6526769, 1, 0, 0.5529412, 1,
1.339117, 0.354376, 0.8247884, 1, 0, 0.5450981, 1,
1.339314, 1.458856, 1.342691, 1, 0, 0.5411765, 1,
1.340821, -0.01882041, 1.69809, 1, 0, 0.5333334, 1,
1.344194, 2.86377, -0.2070473, 1, 0, 0.5294118, 1,
1.348457, -1.563123, 3.218593, 1, 0, 0.5215687, 1,
1.349456, 1.461257, 0.8863966, 1, 0, 0.5176471, 1,
1.354242, -2.308015, 2.285976, 1, 0, 0.509804, 1,
1.356573, 0.2803442, -0.07598729, 1, 0, 0.5058824, 1,
1.360576, 0.8409008, 1.702319, 1, 0, 0.4980392, 1,
1.372068, 0.4408707, 1.126935, 1, 0, 0.4901961, 1,
1.373281, -0.4773461, 2.155488, 1, 0, 0.4862745, 1,
1.392009, 1.461673, 0.5099433, 1, 0, 0.4784314, 1,
1.392254, 1.235924, 0.2530127, 1, 0, 0.4745098, 1,
1.424496, -0.247402, -0.4860352, 1, 0, 0.4666667, 1,
1.425502, -1.152439, 2.389512, 1, 0, 0.4627451, 1,
1.429995, 0.5466217, 1.400851, 1, 0, 0.454902, 1,
1.435862, -1.682176, 3.162708, 1, 0, 0.4509804, 1,
1.441074, -0.8810381, 3.604122, 1, 0, 0.4431373, 1,
1.44167, -1.158607, 0.6264666, 1, 0, 0.4392157, 1,
1.446225, 2.560523, 0.7316398, 1, 0, 0.4313726, 1,
1.452223, 0.4385237, 0.3898229, 1, 0, 0.427451, 1,
1.453336, -1.41354, 3.414759, 1, 0, 0.4196078, 1,
1.463922, -1.24356, 2.295551, 1, 0, 0.4156863, 1,
1.471853, -2.571895, 2.482684, 1, 0, 0.4078431, 1,
1.479136, -0.9264382, 1.177446, 1, 0, 0.4039216, 1,
1.498465, 1.193438, 0.1009757, 1, 0, 0.3960784, 1,
1.505384, -1.300742, 3.026085, 1, 0, 0.3882353, 1,
1.508159, -0.9456453, 2.100253, 1, 0, 0.3843137, 1,
1.518319, -0.3204746, 1.079922, 1, 0, 0.3764706, 1,
1.533241, 0.8997902, 1.062736, 1, 0, 0.372549, 1,
1.560823, 1.130461, -1.281367, 1, 0, 0.3647059, 1,
1.574035, -0.5342605, 2.152191, 1, 0, 0.3607843, 1,
1.574411, -0.5266768, 0.2487011, 1, 0, 0.3529412, 1,
1.576122, 1.005563, 0.3798429, 1, 0, 0.3490196, 1,
1.581378, -1.326855, 3.03351, 1, 0, 0.3411765, 1,
1.581907, -0.05468665, 1.935101, 1, 0, 0.3372549, 1,
1.587187, 0.2102267, 1.608426, 1, 0, 0.3294118, 1,
1.589776, 1.082101, 2.235225, 1, 0, 0.3254902, 1,
1.592533, 1.797207, -0.07133964, 1, 0, 0.3176471, 1,
1.592564, -1.945212, 2.401433, 1, 0, 0.3137255, 1,
1.593141, 0.4079057, 0.7881364, 1, 0, 0.3058824, 1,
1.598176, -0.1664654, 2.538024, 1, 0, 0.2980392, 1,
1.600524, 1.119976, 0.9162045, 1, 0, 0.2941177, 1,
1.605124, -0.6523402, 2.709131, 1, 0, 0.2862745, 1,
1.641573, 2.06075, 1.92523, 1, 0, 0.282353, 1,
1.643528, -0.4858208, 2.163903, 1, 0, 0.2745098, 1,
1.654365, 0.8286546, 1.184106, 1, 0, 0.2705882, 1,
1.655626, 1.383765, 0.3581262, 1, 0, 0.2627451, 1,
1.664126, 0.07349636, 1.632595, 1, 0, 0.2588235, 1,
1.665722, 1.038371, -1.021163, 1, 0, 0.2509804, 1,
1.670395, -1.070807, 1.95145, 1, 0, 0.2470588, 1,
1.691435, -0.7595711, 2.747564, 1, 0, 0.2392157, 1,
1.69778, -2.046912, 2.931538, 1, 0, 0.2352941, 1,
1.710693, 0.1424967, 0.8001272, 1, 0, 0.227451, 1,
1.726829, -0.7127665, 2.657639, 1, 0, 0.2235294, 1,
1.731371, 0.06636316, 1.639609, 1, 0, 0.2156863, 1,
1.743069, 0.3479306, 2.729879, 1, 0, 0.2117647, 1,
1.745229, -0.8112134, 2.119615, 1, 0, 0.2039216, 1,
1.747687, 0.7430002, 0.297998, 1, 0, 0.1960784, 1,
1.770041, -1.438727, 2.355898, 1, 0, 0.1921569, 1,
1.770977, 1.581479, 0.7318147, 1, 0, 0.1843137, 1,
1.775348, -1.603252, 0.9860237, 1, 0, 0.1803922, 1,
1.776313, 0.4002604, 1.13658, 1, 0, 0.172549, 1,
1.782575, -0.3649113, 0.8797653, 1, 0, 0.1686275, 1,
1.791048, -0.9311451, 1.993979, 1, 0, 0.1607843, 1,
1.79996, -0.1617213, 2.55559, 1, 0, 0.1568628, 1,
1.809379, -0.02620461, 0.4268548, 1, 0, 0.1490196, 1,
1.809502, 0.8291754, 0.288844, 1, 0, 0.145098, 1,
1.821278, 0.1933712, 1.783604, 1, 0, 0.1372549, 1,
1.837563, 0.05236029, 1.543801, 1, 0, 0.1333333, 1,
1.867955, 0.2221894, 1.35413, 1, 0, 0.1254902, 1,
1.873774, -0.583544, 0.194542, 1, 0, 0.1215686, 1,
1.886092, -2.582434, 2.51614, 1, 0, 0.1137255, 1,
1.905997, 0.9109846, 2.02479, 1, 0, 0.1098039, 1,
1.921468, -1.353896, 3.160258, 1, 0, 0.1019608, 1,
1.946368, -0.8492473, 3.369793, 1, 0, 0.09411765, 1,
1.995655, 0.3694489, 0.4623613, 1, 0, 0.09019608, 1,
2.051104, 0.3292332, 0.6601065, 1, 0, 0.08235294, 1,
2.057482, -0.326287, 1.181996, 1, 0, 0.07843138, 1,
2.084489, -0.1200518, 0.7112809, 1, 0, 0.07058824, 1,
2.115621, 0.8006535, 0.8301628, 1, 0, 0.06666667, 1,
2.167639, 0.005475989, 1.236469, 1, 0, 0.05882353, 1,
2.189464, -1.515411, 2.410676, 1, 0, 0.05490196, 1,
2.212641, 1.307017, -0.2381431, 1, 0, 0.04705882, 1,
2.266976, 0.127832, 1.89208, 1, 0, 0.04313726, 1,
2.317306, -1.325697, 0.7928913, 1, 0, 0.03529412, 1,
2.375513, 0.8498588, 1.18096, 1, 0, 0.03137255, 1,
2.588198, 0.7062232, 0.3188631, 1, 0, 0.02352941, 1,
2.641628, -0.6090629, 0.4261678, 1, 0, 0.01960784, 1,
2.649523, 0.937484, 1.51673, 1, 0, 0.01176471, 1,
3.172464, -0.8334939, 3.497831, 1, 0, 0.007843138, 1
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
0.2292624, -3.725925, -7.160936, 0, -0.5, 0.5, 0.5,
0.2292624, -3.725925, -7.160936, 1, -0.5, 0.5, 0.5,
0.2292624, -3.725925, -7.160936, 1, 1.5, 0.5, 0.5,
0.2292624, -3.725925, -7.160936, 0, 1.5, 0.5, 0.5
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
-3.711685, 0.1843072, -7.160936, 0, -0.5, 0.5, 0.5,
-3.711685, 0.1843072, -7.160936, 1, -0.5, 0.5, 0.5,
-3.711685, 0.1843072, -7.160936, 1, 1.5, 0.5, 0.5,
-3.711685, 0.1843072, -7.160936, 0, 1.5, 0.5, 0.5
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
-3.711685, -3.725925, 0.01844263, 0, -0.5, 0.5, 0.5,
-3.711685, -3.725925, 0.01844263, 1, -0.5, 0.5, 0.5,
-3.711685, -3.725925, 0.01844263, 1, 1.5, 0.5, 0.5,
-3.711685, -3.725925, 0.01844263, 0, 1.5, 0.5, 0.5
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
-2, -2.823564, -5.504156,
3, -2.823564, -5.504156,
-2, -2.823564, -5.504156,
-2, -2.973957, -5.780286,
-1, -2.823564, -5.504156,
-1, -2.973957, -5.780286,
0, -2.823564, -5.504156,
0, -2.973957, -5.780286,
1, -2.823564, -5.504156,
1, -2.973957, -5.780286,
2, -2.823564, -5.504156,
2, -2.973957, -5.780286,
3, -2.823564, -5.504156,
3, -2.973957, -5.780286
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
-2, -3.274744, -6.332546, 0, -0.5, 0.5, 0.5,
-2, -3.274744, -6.332546, 1, -0.5, 0.5, 0.5,
-2, -3.274744, -6.332546, 1, 1.5, 0.5, 0.5,
-2, -3.274744, -6.332546, 0, 1.5, 0.5, 0.5,
-1, -3.274744, -6.332546, 0, -0.5, 0.5, 0.5,
-1, -3.274744, -6.332546, 1, -0.5, 0.5, 0.5,
-1, -3.274744, -6.332546, 1, 1.5, 0.5, 0.5,
-1, -3.274744, -6.332546, 0, 1.5, 0.5, 0.5,
0, -3.274744, -6.332546, 0, -0.5, 0.5, 0.5,
0, -3.274744, -6.332546, 1, -0.5, 0.5, 0.5,
0, -3.274744, -6.332546, 1, 1.5, 0.5, 0.5,
0, -3.274744, -6.332546, 0, 1.5, 0.5, 0.5,
1, -3.274744, -6.332546, 0, -0.5, 0.5, 0.5,
1, -3.274744, -6.332546, 1, -0.5, 0.5, 0.5,
1, -3.274744, -6.332546, 1, 1.5, 0.5, 0.5,
1, -3.274744, -6.332546, 0, 1.5, 0.5, 0.5,
2, -3.274744, -6.332546, 0, -0.5, 0.5, 0.5,
2, -3.274744, -6.332546, 1, -0.5, 0.5, 0.5,
2, -3.274744, -6.332546, 1, 1.5, 0.5, 0.5,
2, -3.274744, -6.332546, 0, 1.5, 0.5, 0.5,
3, -3.274744, -6.332546, 0, -0.5, 0.5, 0.5,
3, -3.274744, -6.332546, 1, -0.5, 0.5, 0.5,
3, -3.274744, -6.332546, 1, 1.5, 0.5, 0.5,
3, -3.274744, -6.332546, 0, 1.5, 0.5, 0.5
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
-2.802235, -2, -5.504156,
-2.802235, 3, -5.504156,
-2.802235, -2, -5.504156,
-2.95381, -2, -5.780286,
-2.802235, -1, -5.504156,
-2.95381, -1, -5.780286,
-2.802235, 0, -5.504156,
-2.95381, 0, -5.780286,
-2.802235, 1, -5.504156,
-2.95381, 1, -5.780286,
-2.802235, 2, -5.504156,
-2.95381, 2, -5.780286,
-2.802235, 3, -5.504156,
-2.95381, 3, -5.780286
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
-3.25696, -2, -6.332546, 0, -0.5, 0.5, 0.5,
-3.25696, -2, -6.332546, 1, -0.5, 0.5, 0.5,
-3.25696, -2, -6.332546, 1, 1.5, 0.5, 0.5,
-3.25696, -2, -6.332546, 0, 1.5, 0.5, 0.5,
-3.25696, -1, -6.332546, 0, -0.5, 0.5, 0.5,
-3.25696, -1, -6.332546, 1, -0.5, 0.5, 0.5,
-3.25696, -1, -6.332546, 1, 1.5, 0.5, 0.5,
-3.25696, -1, -6.332546, 0, 1.5, 0.5, 0.5,
-3.25696, 0, -6.332546, 0, -0.5, 0.5, 0.5,
-3.25696, 0, -6.332546, 1, -0.5, 0.5, 0.5,
-3.25696, 0, -6.332546, 1, 1.5, 0.5, 0.5,
-3.25696, 0, -6.332546, 0, 1.5, 0.5, 0.5,
-3.25696, 1, -6.332546, 0, -0.5, 0.5, 0.5,
-3.25696, 1, -6.332546, 1, -0.5, 0.5, 0.5,
-3.25696, 1, -6.332546, 1, 1.5, 0.5, 0.5,
-3.25696, 1, -6.332546, 0, 1.5, 0.5, 0.5,
-3.25696, 2, -6.332546, 0, -0.5, 0.5, 0.5,
-3.25696, 2, -6.332546, 1, -0.5, 0.5, 0.5,
-3.25696, 2, -6.332546, 1, 1.5, 0.5, 0.5,
-3.25696, 2, -6.332546, 0, 1.5, 0.5, 0.5,
-3.25696, 3, -6.332546, 0, -0.5, 0.5, 0.5,
-3.25696, 3, -6.332546, 1, -0.5, 0.5, 0.5,
-3.25696, 3, -6.332546, 1, 1.5, 0.5, 0.5,
-3.25696, 3, -6.332546, 0, 1.5, 0.5, 0.5
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
-2.802235, -2.823564, -4,
-2.802235, -2.823564, 4,
-2.802235, -2.823564, -4,
-2.95381, -2.973957, -4,
-2.802235, -2.823564, -2,
-2.95381, -2.973957, -2,
-2.802235, -2.823564, 0,
-2.95381, -2.973957, 0,
-2.802235, -2.823564, 2,
-2.95381, -2.973957, 2,
-2.802235, -2.823564, 4,
-2.95381, -2.973957, 4
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
-3.25696, -3.274744, -4, 0, -0.5, 0.5, 0.5,
-3.25696, -3.274744, -4, 1, -0.5, 0.5, 0.5,
-3.25696, -3.274744, -4, 1, 1.5, 0.5, 0.5,
-3.25696, -3.274744, -4, 0, 1.5, 0.5, 0.5,
-3.25696, -3.274744, -2, 0, -0.5, 0.5, 0.5,
-3.25696, -3.274744, -2, 1, -0.5, 0.5, 0.5,
-3.25696, -3.274744, -2, 1, 1.5, 0.5, 0.5,
-3.25696, -3.274744, -2, 0, 1.5, 0.5, 0.5,
-3.25696, -3.274744, 0, 0, -0.5, 0.5, 0.5,
-3.25696, -3.274744, 0, 1, -0.5, 0.5, 0.5,
-3.25696, -3.274744, 0, 1, 1.5, 0.5, 0.5,
-3.25696, -3.274744, 0, 0, 1.5, 0.5, 0.5,
-3.25696, -3.274744, 2, 0, -0.5, 0.5, 0.5,
-3.25696, -3.274744, 2, 1, -0.5, 0.5, 0.5,
-3.25696, -3.274744, 2, 1, 1.5, 0.5, 0.5,
-3.25696, -3.274744, 2, 0, 1.5, 0.5, 0.5,
-3.25696, -3.274744, 4, 0, -0.5, 0.5, 0.5,
-3.25696, -3.274744, 4, 1, -0.5, 0.5, 0.5,
-3.25696, -3.274744, 4, 1, 1.5, 0.5, 0.5,
-3.25696, -3.274744, 4, 0, 1.5, 0.5, 0.5
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
-2.802235, -2.823564, -5.504156,
-2.802235, 3.192178, -5.504156,
-2.802235, -2.823564, 5.541041,
-2.802235, 3.192178, 5.541041,
-2.802235, -2.823564, -5.504156,
-2.802235, -2.823564, 5.541041,
-2.802235, 3.192178, -5.504156,
-2.802235, 3.192178, 5.541041,
-2.802235, -2.823564, -5.504156,
3.26076, -2.823564, -5.504156,
-2.802235, -2.823564, 5.541041,
3.26076, -2.823564, 5.541041,
-2.802235, 3.192178, -5.504156,
3.26076, 3.192178, -5.504156,
-2.802235, 3.192178, 5.541041,
3.26076, 3.192178, 5.541041,
3.26076, -2.823564, -5.504156,
3.26076, 3.192178, -5.504156,
3.26076, -2.823564, 5.541041,
3.26076, 3.192178, 5.541041,
3.26076, -2.823564, -5.504156,
3.26076, -2.823564, 5.541041,
3.26076, 3.192178, -5.504156,
3.26076, 3.192178, 5.541041
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
var radius = 7.45559;
var distance = 33.17076;
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
mvMatrix.translate( -0.2292624, -0.1843072, -0.01844263 );
mvMatrix.scale( 1.329562, 1.340006, 0.7298312 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.17076);
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
dinoseb<-read.table("dinoseb.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-dinoseb$V2
```

```
## Error in eval(expr, envir, enclos): object 'dinoseb' not found
```

```r
y<-dinoseb$V3
```

```
## Error in eval(expr, envir, enclos): object 'dinoseb' not found
```

```r
z<-dinoseb$V4
```

```
## Error in eval(expr, envir, enclos): object 'dinoseb' not found
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
-2.713939, -0.9475148, -0.7007166, 0, 0, 1, 1, 1,
-2.547886, 0.8145888, -3.266394, 1, 0, 0, 1, 1,
-2.534875, -0.9498845, -0.4576852, 1, 0, 0, 1, 1,
-2.453218, -1.118242, -1.441798, 1, 0, 0, 1, 1,
-2.40096, -0.8949898, -0.881034, 1, 0, 0, 1, 1,
-2.396683, -0.4442303, -2.718687, 1, 0, 0, 1, 1,
-2.394109, 0.4977424, -0.07506596, 0, 0, 0, 1, 1,
-2.38, -0.4018141, -1.548477, 0, 0, 0, 1, 1,
-2.318135, 1.827831, -1.787943, 0, 0, 0, 1, 1,
-2.309542, -0.2486718, -0.5471998, 0, 0, 0, 1, 1,
-2.296978, 1.457959, 0.7614042, 0, 0, 0, 1, 1,
-2.22424, -0.5293705, -1.316266, 0, 0, 0, 1, 1,
-2.215993, 0.917619, -2.424559, 0, 0, 0, 1, 1,
-2.209278, -0.4963415, -0.8430469, 1, 1, 1, 1, 1,
-2.196702, -0.7631074, -2.950254, 1, 1, 1, 1, 1,
-2.117984, 0.9599697, -0.358093, 1, 1, 1, 1, 1,
-2.117424, -1.156533, -3.058322, 1, 1, 1, 1, 1,
-2.050708, -0.1805963, -2.332488, 1, 1, 1, 1, 1,
-2.048002, -1.416493, -1.879733, 1, 1, 1, 1, 1,
-2.008575, 0.01926064, -3.67185, 1, 1, 1, 1, 1,
-2.004539, -0.2312809, -1.348714, 1, 1, 1, 1, 1,
-1.997712, -1.7518, -3.491001, 1, 1, 1, 1, 1,
-1.964288, 1.427164, -1.421214, 1, 1, 1, 1, 1,
-1.944266, -0.7046925, -3.24661, 1, 1, 1, 1, 1,
-1.926467, -0.002283722, -2.318678, 1, 1, 1, 1, 1,
-1.923151, 1.11751, -3.380271, 1, 1, 1, 1, 1,
-1.915245, -1.885157, -2.991768, 1, 1, 1, 1, 1,
-1.902884, -1.12108, -3.560102, 1, 1, 1, 1, 1,
-1.900494, 0.5524656, -0.3222846, 0, 0, 1, 1, 1,
-1.888857, 0.3736769, -1.453718, 1, 0, 0, 1, 1,
-1.867916, 0.8318883, -0.7962814, 1, 0, 0, 1, 1,
-1.849171, 0.07797607, -1.229037, 1, 0, 0, 1, 1,
-1.822809, 0.0817483, -2.240717, 1, 0, 0, 1, 1,
-1.809798, -0.04913151, -2.605273, 1, 0, 0, 1, 1,
-1.806159, 1.617713, -1.608526, 0, 0, 0, 1, 1,
-1.805764, -1.071937, -4.180079, 0, 0, 0, 1, 1,
-1.757333, 1.542016, -1.190707, 0, 0, 0, 1, 1,
-1.748223, 0.9457798, 0.5729608, 0, 0, 0, 1, 1,
-1.721233, -2.208922, -3.701743, 0, 0, 0, 1, 1,
-1.720557, 0.1945748, -1.347557, 0, 0, 0, 1, 1,
-1.697938, 2.418358, -0.8814523, 0, 0, 0, 1, 1,
-1.683419, -0.7856909, -3.036794, 1, 1, 1, 1, 1,
-1.675345, -0.1967794, -3.284956, 1, 1, 1, 1, 1,
-1.670208, -1.013869, -1.448985, 1, 1, 1, 1, 1,
-1.670057, 0.007903188, -1.495338, 1, 1, 1, 1, 1,
-1.655023, 0.5428332, -2.015398, 1, 1, 1, 1, 1,
-1.6454, 0.4673992, -0.8863793, 1, 1, 1, 1, 1,
-1.638251, 0.6440103, -3.097304, 1, 1, 1, 1, 1,
-1.629273, -0.1078698, -2.824239, 1, 1, 1, 1, 1,
-1.62926, 2.815507, 0.08990052, 1, 1, 1, 1, 1,
-1.623326, -2.127485, -2.547727, 1, 1, 1, 1, 1,
-1.613816, -1.277419, -4.695826, 1, 1, 1, 1, 1,
-1.597582, -0.01914636, 0.02183389, 1, 1, 1, 1, 1,
-1.596558, -1.80398, -1.966195, 1, 1, 1, 1, 1,
-1.584448, 0.6300906, -2.225957, 1, 1, 1, 1, 1,
-1.579616, 0.7492055, -1.928857, 1, 1, 1, 1, 1,
-1.574283, -0.5371088, -1.449012, 0, 0, 1, 1, 1,
-1.559874, 1.214584, -1.592174, 1, 0, 0, 1, 1,
-1.557418, -0.1705275, -0.4448622, 1, 0, 0, 1, 1,
-1.542995, -0.4617253, -1.662556, 1, 0, 0, 1, 1,
-1.534076, 1.079356, -0.6171374, 1, 0, 0, 1, 1,
-1.533769, -0.1518718, -1.971738, 1, 0, 0, 1, 1,
-1.52675, 0.8574935, -1.519725, 0, 0, 0, 1, 1,
-1.50997, -1.319561, -1.518859, 0, 0, 0, 1, 1,
-1.504468, 0.7009663, -1.038588, 0, 0, 0, 1, 1,
-1.503298, 1.825604, -0.6483876, 0, 0, 0, 1, 1,
-1.497883, -1.636461, -1.640587, 0, 0, 0, 1, 1,
-1.487242, -0.8346965, -1.809201, 0, 0, 0, 1, 1,
-1.47671, -0.3814633, -0.9260159, 0, 0, 0, 1, 1,
-1.469578, -0.2313782, -2.490157, 1, 1, 1, 1, 1,
-1.465535, 0.142334, -1.353745, 1, 1, 1, 1, 1,
-1.465416, 1.03664, 0.07968224, 1, 1, 1, 1, 1,
-1.461452, 0.3741669, -1.504699, 1, 1, 1, 1, 1,
-1.461284, -0.1676001, -0.9750177, 1, 1, 1, 1, 1,
-1.445975, -0.1483359, -1.701695, 1, 1, 1, 1, 1,
-1.444624, -0.3272735, -2.301587, 1, 1, 1, 1, 1,
-1.442102, -0.3172406, -1.805315, 1, 1, 1, 1, 1,
-1.412815, 0.7144532, -2.793413, 1, 1, 1, 1, 1,
-1.410398, 0.1095446, -0.5859988, 1, 1, 1, 1, 1,
-1.401324, -1.447556, -2.299561, 1, 1, 1, 1, 1,
-1.377736, -0.8988541, -1.988322, 1, 1, 1, 1, 1,
-1.369661, -1.053997, -4.957287, 1, 1, 1, 1, 1,
-1.366753, 0.2402771, -1.481484, 1, 1, 1, 1, 1,
-1.361121, -0.4406609, -2.270514, 1, 1, 1, 1, 1,
-1.358856, 1.648844, -2.517156, 0, 0, 1, 1, 1,
-1.357205, -2.130693, -3.673139, 1, 0, 0, 1, 1,
-1.346429, 0.8392959, -2.082046, 1, 0, 0, 1, 1,
-1.346428, 0.8816786, -1.781155, 1, 0, 0, 1, 1,
-1.342803, -0.02480406, -0.4508017, 1, 0, 0, 1, 1,
-1.342602, -1.960851, -2.539605, 1, 0, 0, 1, 1,
-1.335475, -0.2068634, -2.28689, 0, 0, 0, 1, 1,
-1.328181, -0.1162818, -2.737319, 0, 0, 0, 1, 1,
-1.32629, 1.46281, -1.332032, 0, 0, 0, 1, 1,
-1.319012, 1.574513, -0.9643669, 0, 0, 0, 1, 1,
-1.318646, -0.6013721, -3.469884, 0, 0, 0, 1, 1,
-1.310455, 1.591189, -0.3227781, 0, 0, 0, 1, 1,
-1.3029, 0.497435, -1.599846, 0, 0, 0, 1, 1,
-1.296768, -0.9978101, -1.241014, 1, 1, 1, 1, 1,
-1.293536, 1.395524, 0.1193059, 1, 1, 1, 1, 1,
-1.289297, 1.352852, -1.984429, 1, 1, 1, 1, 1,
-1.288269, -1.043236, -0.2848276, 1, 1, 1, 1, 1,
-1.282472, -0.8345744, -2.224005, 1, 1, 1, 1, 1,
-1.280426, -0.0146998, -1.069018, 1, 1, 1, 1, 1,
-1.268739, 0.5439199, -1.390498, 1, 1, 1, 1, 1,
-1.263122, -0.442877, -0.8232731, 1, 1, 1, 1, 1,
-1.262056, 0.6541159, -1.413843, 1, 1, 1, 1, 1,
-1.249128, -0.392942, -2.320801, 1, 1, 1, 1, 1,
-1.245989, 0.2512651, -0.3195548, 1, 1, 1, 1, 1,
-1.239734, 0.7531096, -0.9074545, 1, 1, 1, 1, 1,
-1.23531, 0.4761317, -0.8924578, 1, 1, 1, 1, 1,
-1.233318, 0.164424, -3.733696, 1, 1, 1, 1, 1,
-1.225838, -0.4757241, -1.629964, 1, 1, 1, 1, 1,
-1.223887, -1.383833, -3.440093, 0, 0, 1, 1, 1,
-1.212885, -0.4223914, -1.375986, 1, 0, 0, 1, 1,
-1.209004, -0.2926025, -1.492553, 1, 0, 0, 1, 1,
-1.202253, 1.124632, 0.01974525, 1, 0, 0, 1, 1,
-1.200607, 0.432576, 0.9034662, 1, 0, 0, 1, 1,
-1.197423, 2.030242, 0.3079123, 1, 0, 0, 1, 1,
-1.188663, 0.7719779, -1.806157, 0, 0, 0, 1, 1,
-1.185452, 0.7274851, -1.225518, 0, 0, 0, 1, 1,
-1.185123, -0.1911906, -0.7413359, 0, 0, 0, 1, 1,
-1.181356, -0.5723417, -4.355874, 0, 0, 0, 1, 1,
-1.177611, 0.9123203, -2.29631, 0, 0, 0, 1, 1,
-1.176456, -0.6784542, -2.413269, 0, 0, 0, 1, 1,
-1.175483, 0.204591, -0.415311, 0, 0, 0, 1, 1,
-1.173902, -1.25653, -1.594496, 1, 1, 1, 1, 1,
-1.170926, 0.3255859, -2.960035, 1, 1, 1, 1, 1,
-1.165042, -0.58018, -2.049531, 1, 1, 1, 1, 1,
-1.160616, 0.170165, -2.269159, 1, 1, 1, 1, 1,
-1.158388, 0.9572536, -2.123369, 1, 1, 1, 1, 1,
-1.154562, -1.525366, -0.2701963, 1, 1, 1, 1, 1,
-1.15237, -0.1106095, -0.7174453, 1, 1, 1, 1, 1,
-1.148428, 0.3871174, -1.766728, 1, 1, 1, 1, 1,
-1.148216, 1.693646, -0.3165328, 1, 1, 1, 1, 1,
-1.14654, -0.5643671, -2.450255, 1, 1, 1, 1, 1,
-1.144219, 0.850014, -1.374667, 1, 1, 1, 1, 1,
-1.140766, 0.3044866, -1.030905, 1, 1, 1, 1, 1,
-1.135888, -1.950275, -1.109109, 1, 1, 1, 1, 1,
-1.132782, 1.077989, -0.2709866, 1, 1, 1, 1, 1,
-1.126843, -1.025509, -3.103436, 1, 1, 1, 1, 1,
-1.119447, -0.9415312, -4.456656, 0, 0, 1, 1, 1,
-1.112729, 1.241549, 0.2217716, 1, 0, 0, 1, 1,
-1.107407, -1.368348, -1.284623, 1, 0, 0, 1, 1,
-1.103008, -1.879711, -3.365873, 1, 0, 0, 1, 1,
-1.102872, -0.257211, -1.827882, 1, 0, 0, 1, 1,
-1.097653, -0.9928489, -3.232931, 1, 0, 0, 1, 1,
-1.092366, -0.1174658, -1.152633, 0, 0, 0, 1, 1,
-1.089668, -0.520209, 0.7060776, 0, 0, 0, 1, 1,
-1.086355, -0.2874495, -2.432444, 0, 0, 0, 1, 1,
-1.085689, 0.5786743, -2.536535, 0, 0, 0, 1, 1,
-1.080203, 0.7008916, -0.5071617, 0, 0, 0, 1, 1,
-1.079819, 2.478173, -0.8186996, 0, 0, 0, 1, 1,
-1.076888, -1.464139, -3.736888, 0, 0, 0, 1, 1,
-1.070427, 0.2558904, -1.637255, 1, 1, 1, 1, 1,
-1.066881, -0.3664768, -1.892136, 1, 1, 1, 1, 1,
-1.063247, 1.467351, 0.1498808, 1, 1, 1, 1, 1,
-1.05738, 2.514937, -1.677157, 1, 1, 1, 1, 1,
-1.053817, -0.1250917, -0.9087847, 1, 1, 1, 1, 1,
-1.051763, 0.296248, -2.383124, 1, 1, 1, 1, 1,
-1.045603, -2.371105, -4.388934, 1, 1, 1, 1, 1,
-1.038915, -0.004337013, -1.472756, 1, 1, 1, 1, 1,
-1.033292, -0.05544505, 0.3506073, 1, 1, 1, 1, 1,
-1.032939, -0.2092813, 0.2385128, 1, 1, 1, 1, 1,
-1.030403, 0.6228389, -2.00167, 1, 1, 1, 1, 1,
-1.029753, 1.211913, -0.9941801, 1, 1, 1, 1, 1,
-1.029145, -1.852121, -1.16844, 1, 1, 1, 1, 1,
-1.020485, -0.9847053, -2.576515, 1, 1, 1, 1, 1,
-1.018983, -1.077569, -3.824482, 1, 1, 1, 1, 1,
-1.017861, 0.6063645, -1.232426, 0, 0, 1, 1, 1,
-1.010625, 1.744473, 0.05786592, 1, 0, 0, 1, 1,
-1.006916, 0.6476219, -1.57672, 1, 0, 0, 1, 1,
-1.003664, -0.4827578, -2.691643, 1, 0, 0, 1, 1,
-1.002258, 0.2458329, -3.407687, 1, 0, 0, 1, 1,
-0.9937772, -1.913503, -2.823875, 1, 0, 0, 1, 1,
-0.9836304, -0.9707, -3.255455, 0, 0, 0, 1, 1,
-0.9794411, -0.9633433, -1.540412, 0, 0, 0, 1, 1,
-0.9739069, 1.046501, -1.043822, 0, 0, 0, 1, 1,
-0.9676049, -1.431347, -3.135664, 0, 0, 0, 1, 1,
-0.9619038, -0.5568033, -0.832706, 0, 0, 0, 1, 1,
-0.9601129, -0.06192477, -2.647921, 0, 0, 0, 1, 1,
-0.9585168, -1.247106, -0.7102793, 0, 0, 0, 1, 1,
-0.943583, 1.49276, 0.03598464, 1, 1, 1, 1, 1,
-0.9379908, 0.3753738, -0.9383156, 1, 1, 1, 1, 1,
-0.9195173, -0.7820723, -2.59908, 1, 1, 1, 1, 1,
-0.917668, 0.2304422, -0.7003849, 1, 1, 1, 1, 1,
-0.9161832, 0.6677329, -2.703012, 1, 1, 1, 1, 1,
-0.914913, -0.5460234, -1.887423, 1, 1, 1, 1, 1,
-0.9113597, 1.839062, -0.8497216, 1, 1, 1, 1, 1,
-0.9110562, -1.305037, -2.084818, 1, 1, 1, 1, 1,
-0.9092198, 1.660036, -1.176983, 1, 1, 1, 1, 1,
-0.9085761, 0.3934048, 0.4846489, 1, 1, 1, 1, 1,
-0.9071252, 0.6329334, -1.980758, 1, 1, 1, 1, 1,
-0.9069351, -0.5006973, -1.140622, 1, 1, 1, 1, 1,
-0.8993531, 0.9866636, -0.06723243, 1, 1, 1, 1, 1,
-0.8990052, 0.7852752, -0.8874644, 1, 1, 1, 1, 1,
-0.8987529, -0.4964469, -0.5700576, 1, 1, 1, 1, 1,
-0.8982602, -1.353592, -3.119293, 0, 0, 1, 1, 1,
-0.8958367, -0.2017677, -2.427377, 1, 0, 0, 1, 1,
-0.8836641, -0.6543477, -2.193257, 1, 0, 0, 1, 1,
-0.8679551, 0.7585664, 1.015268, 1, 0, 0, 1, 1,
-0.8679533, -0.7105074, -0.9086796, 1, 0, 0, 1, 1,
-0.8655738, -0.5028807, -1.278124, 1, 0, 0, 1, 1,
-0.8625056, 1.745318, -1.538167, 0, 0, 0, 1, 1,
-0.8619084, -0.3675774, -1.227674, 0, 0, 0, 1, 1,
-0.8596585, 0.4294954, -0.06838539, 0, 0, 0, 1, 1,
-0.853502, 1.507279, -0.5929506, 0, 0, 0, 1, 1,
-0.8531566, 1.659787, 0.6580694, 0, 0, 0, 1, 1,
-0.8501717, 0.1320122, -2.356898, 0, 0, 0, 1, 1,
-0.8492898, 0.1985898, -0.8922536, 0, 0, 0, 1, 1,
-0.848043, 0.5286792, -0.9624009, 1, 1, 1, 1, 1,
-0.8386812, 1.48347, -0.4403856, 1, 1, 1, 1, 1,
-0.8338482, -0.2782981, -1.726154, 1, 1, 1, 1, 1,
-0.8289848, -0.03707768, -0.3891459, 1, 1, 1, 1, 1,
-0.8271384, 0.1575615, -1.84883, 1, 1, 1, 1, 1,
-0.8255439, -1.072385, 0.4367903, 1, 1, 1, 1, 1,
-0.8164152, -1.236023, -1.615283, 1, 1, 1, 1, 1,
-0.8100817, 1.215268, -0.9847924, 1, 1, 1, 1, 1,
-0.8078914, 3.10457, -0.2554005, 1, 1, 1, 1, 1,
-0.8059252, -0.5374851, -1.649772, 1, 1, 1, 1, 1,
-0.7979729, 0.566375, -0.02128603, 1, 1, 1, 1, 1,
-0.7978148, -1.83192, -0.582926, 1, 1, 1, 1, 1,
-0.7921969, 0.1986269, -1.399069, 1, 1, 1, 1, 1,
-0.7862124, -1.133793, -1.960797, 1, 1, 1, 1, 1,
-0.7841977, 0.07020262, -1.80656, 1, 1, 1, 1, 1,
-0.7737739, -0.1943155, -2.289485, 0, 0, 1, 1, 1,
-0.772058, -1.571805, -2.823497, 1, 0, 0, 1, 1,
-0.7710587, -0.09907383, -3.275672, 1, 0, 0, 1, 1,
-0.7686431, -0.1338077, -2.116619, 1, 0, 0, 1, 1,
-0.7657377, -0.9982119, -3.648033, 1, 0, 0, 1, 1,
-0.7629786, 1.093625, -0.09895663, 1, 0, 0, 1, 1,
-0.7616049, 0.2073349, -1.581629, 0, 0, 0, 1, 1,
-0.7563816, 0.3612314, -1.63128, 0, 0, 0, 1, 1,
-0.7552243, -0.9595432, -2.939286, 0, 0, 0, 1, 1,
-0.7530931, 0.6793984, -0.6931963, 0, 0, 0, 1, 1,
-0.7484127, -0.200626, -1.401481, 0, 0, 0, 1, 1,
-0.7475951, -0.9853126, -2.738211, 0, 0, 0, 1, 1,
-0.746584, -0.8579873, -0.7606478, 0, 0, 0, 1, 1,
-0.7430903, 1.612869, -0.3729194, 1, 1, 1, 1, 1,
-0.7409457, 1.658009, 0.9997965, 1, 1, 1, 1, 1,
-0.7377717, 0.7317685, -1.524683, 1, 1, 1, 1, 1,
-0.7374888, -0.5827231, -2.436913, 1, 1, 1, 1, 1,
-0.7317038, 0.2159357, -1.238908, 1, 1, 1, 1, 1,
-0.7291567, 0.7417544, -0.333017, 1, 1, 1, 1, 1,
-0.7281822, -1.004726, -2.112335, 1, 1, 1, 1, 1,
-0.7266336, 0.6346892, 1.203548, 1, 1, 1, 1, 1,
-0.7245296, -0.08921438, -1.659916, 1, 1, 1, 1, 1,
-0.7220173, 1.567658, -1.218454, 1, 1, 1, 1, 1,
-0.7168949, 0.1743836, -2.040475, 1, 1, 1, 1, 1,
-0.7115445, -0.9562718, -2.741136, 1, 1, 1, 1, 1,
-0.7112111, -0.05409507, -1.546423, 1, 1, 1, 1, 1,
-0.7098968, -1.957536, -3.345825, 1, 1, 1, 1, 1,
-0.7098281, 0.5000876, -0.2493864, 1, 1, 1, 1, 1,
-0.7082153, -1.998004, -2.317003, 0, 0, 1, 1, 1,
-0.7037099, -1.493553, -2.778108, 1, 0, 0, 1, 1,
-0.6976144, 1.179701, 1.043507, 1, 0, 0, 1, 1,
-0.6927063, -0.2121697, -2.488868, 1, 0, 0, 1, 1,
-0.6919455, -0.9849359, -1.832614, 1, 0, 0, 1, 1,
-0.6889942, -1.102798, -2.247921, 1, 0, 0, 1, 1,
-0.6880118, -1.218058, -5.216959, 0, 0, 0, 1, 1,
-0.6844817, -0.4183177, -1.075789, 0, 0, 0, 1, 1,
-0.6806313, 1.340582, -1.062792, 0, 0, 0, 1, 1,
-0.6744486, 0.5049204, -1.287427, 0, 0, 0, 1, 1,
-0.6712146, -0.293431, -1.965969, 0, 0, 0, 1, 1,
-0.6684685, 0.4895869, -0.7984385, 0, 0, 0, 1, 1,
-0.6674091, 1.050562, -0.6711955, 0, 0, 0, 1, 1,
-0.6648266, 1.325602, -0.3569796, 1, 1, 1, 1, 1,
-0.6614449, -1.246055, -3.143005, 1, 1, 1, 1, 1,
-0.6614394, -1.049494, -1.772089, 1, 1, 1, 1, 1,
-0.6572896, -0.5397976, -2.3248, 1, 1, 1, 1, 1,
-0.6554372, -1.070136, -0.003122936, 1, 1, 1, 1, 1,
-0.6550799, -0.4315314, -2.930526, 1, 1, 1, 1, 1,
-0.6515034, -0.08633071, -2.721463, 1, 1, 1, 1, 1,
-0.648396, -0.01841171, -2.064734, 1, 1, 1, 1, 1,
-0.6480903, -0.2126558, 0.4702842, 1, 1, 1, 1, 1,
-0.6447054, 0.003698859, -0.9743353, 1, 1, 1, 1, 1,
-0.6402516, -1.934854, -1.841416, 1, 1, 1, 1, 1,
-0.6383985, -0.5857263, -3.435708, 1, 1, 1, 1, 1,
-0.6301523, 0.8681713, -0.2904882, 1, 1, 1, 1, 1,
-0.6278389, -0.8483258, -1.913355, 1, 1, 1, 1, 1,
-0.6237721, -0.9756401, -2.132633, 1, 1, 1, 1, 1,
-0.6232363, 0.2865445, -1.586931, 0, 0, 1, 1, 1,
-0.6224335, -0.3463724, -2.352932, 1, 0, 0, 1, 1,
-0.6223931, 0.397216, -0.2450852, 1, 0, 0, 1, 1,
-0.6154513, -0.4704511, -2.884916, 1, 0, 0, 1, 1,
-0.6147523, -0.5139531, -2.747008, 1, 0, 0, 1, 1,
-0.6114596, 0.8014285, -0.8000067, 1, 0, 0, 1, 1,
-0.6102939, -0.9044641, -1.365849, 0, 0, 0, 1, 1,
-0.6101625, -1.731743, -5.343304, 0, 0, 0, 1, 1,
-0.6061915, -0.09023568, -0.02088477, 0, 0, 0, 1, 1,
-0.6040148, 0.9800658, -0.396565, 0, 0, 0, 1, 1,
-0.5999963, -0.8812794, -3.08165, 0, 0, 0, 1, 1,
-0.5972958, 1.599959, -0.5492904, 0, 0, 0, 1, 1,
-0.594884, -0.03398589, -1.698323, 0, 0, 0, 1, 1,
-0.5948268, -0.5309449, -0.8336191, 1, 1, 1, 1, 1,
-0.5917156, 0.7560377, -1.674909, 1, 1, 1, 1, 1,
-0.5896031, -1.148295, -2.113119, 1, 1, 1, 1, 1,
-0.5895481, 0.03866245, -1.035622, 1, 1, 1, 1, 1,
-0.5880274, -0.9223301, -2.760762, 1, 1, 1, 1, 1,
-0.5856903, 0.6429614, -1.71807, 1, 1, 1, 1, 1,
-0.5705131, -1.918381, -1.911031, 1, 1, 1, 1, 1,
-0.5646934, 0.06957061, -2.199108, 1, 1, 1, 1, 1,
-0.5620769, 0.1834405, -1.085364, 1, 1, 1, 1, 1,
-0.5605271, 0.8381899, 1.125162, 1, 1, 1, 1, 1,
-0.5576497, -0.2374503, -2.338815, 1, 1, 1, 1, 1,
-0.5570996, -0.6009939, -3.07818, 1, 1, 1, 1, 1,
-0.553143, -0.8717493, -4.807938, 1, 1, 1, 1, 1,
-0.5530158, 0.8635851, -1.005859, 1, 1, 1, 1, 1,
-0.5494191, -0.9922982, -2.800692, 1, 1, 1, 1, 1,
-0.5471378, 0.9405348, -0.5749121, 0, 0, 1, 1, 1,
-0.5468955, 1.673892, -0.122291, 1, 0, 0, 1, 1,
-0.5422993, 0.7733416, 1.702218, 1, 0, 0, 1, 1,
-0.5394261, 0.5633995, 0.4770429, 1, 0, 0, 1, 1,
-0.5376015, 0.2006819, -0.8327273, 1, 0, 0, 1, 1,
-0.530074, 0.6219826, -0.4299346, 1, 0, 0, 1, 1,
-0.5291119, 0.5023171, 0.7909352, 0, 0, 0, 1, 1,
-0.5281185, 0.4885766, -0.01220854, 0, 0, 0, 1, 1,
-0.517624, -0.4847834, -1.739507, 0, 0, 0, 1, 1,
-0.5067099, -1.239433, -4.378173, 0, 0, 0, 1, 1,
-0.5060385, 0.7709789, -0.3575261, 0, 0, 0, 1, 1,
-0.5009165, -0.7099456, -2.581305, 0, 0, 0, 1, 1,
-0.4956478, -0.5533345, -3.091151, 0, 0, 0, 1, 1,
-0.4925356, 0.2682009, -2.390593, 1, 1, 1, 1, 1,
-0.4924065, -0.336664, -0.2985791, 1, 1, 1, 1, 1,
-0.4832285, 0.2399241, -2.096416, 1, 1, 1, 1, 1,
-0.481182, -0.06571733, -2.371387, 1, 1, 1, 1, 1,
-0.4791819, -0.9552125, -1.810984, 1, 1, 1, 1, 1,
-0.4766571, -0.4947269, -3.71365, 1, 1, 1, 1, 1,
-0.4722295, 0.3765665, -1.342534, 1, 1, 1, 1, 1,
-0.471672, 0.2302873, -1.006342, 1, 1, 1, 1, 1,
-0.4650148, 0.8147658, -0.8745604, 1, 1, 1, 1, 1,
-0.4615748, -0.5965993, -4.375921, 1, 1, 1, 1, 1,
-0.4610715, -0.7172481, -3.490618, 1, 1, 1, 1, 1,
-0.4600739, 0.5608422, -0.8959586, 1, 1, 1, 1, 1,
-0.4580766, -0.09844434, -0.8188931, 1, 1, 1, 1, 1,
-0.4534974, -0.02082301, -0.9793847, 1, 1, 1, 1, 1,
-0.4470929, -0.4987102, -1.911499, 1, 1, 1, 1, 1,
-0.4443994, -0.4016316, -1.612904, 0, 0, 1, 1, 1,
-0.4431725, -1.907946, -3.335572, 1, 0, 0, 1, 1,
-0.4425158, 0.9712291, -0.2422807, 1, 0, 0, 1, 1,
-0.4424239, -1.393222, -2.525199, 1, 0, 0, 1, 1,
-0.4423667, -1.430864, -3.473694, 1, 0, 0, 1, 1,
-0.4343995, -0.3349836, -3.411766, 1, 0, 0, 1, 1,
-0.4287809, -0.3310054, -1.918902, 0, 0, 0, 1, 1,
-0.4229462, -0.1945284, -1.371382, 0, 0, 0, 1, 1,
-0.4225304, -0.8645886, -1.794173, 0, 0, 0, 1, 1,
-0.4202105, -1.99712, -2.414793, 0, 0, 0, 1, 1,
-0.4180314, -0.4641154, -1.804996, 0, 0, 0, 1, 1,
-0.4162846, 1.656091, -0.9295101, 0, 0, 0, 1, 1,
-0.4137991, -0.7701872, -1.956315, 0, 0, 0, 1, 1,
-0.4112545, -0.4967795, -1.088492, 1, 1, 1, 1, 1,
-0.4065394, 0.6616464, -1.246623, 1, 1, 1, 1, 1,
-0.4033031, 0.5698565, -0.1131244, 1, 1, 1, 1, 1,
-0.4032739, -0.6376346, -3.262918, 1, 1, 1, 1, 1,
-0.403269, 0.3764703, -1.203643, 1, 1, 1, 1, 1,
-0.4025619, 1.252657, 0.2708563, 1, 1, 1, 1, 1,
-0.4017575, -1.159685, -2.709598, 1, 1, 1, 1, 1,
-0.3994445, 0.2146561, 0.0696174, 1, 1, 1, 1, 1,
-0.3950925, 0.9132424, 0.2942967, 1, 1, 1, 1, 1,
-0.3882652, 0.5188627, -1.371365, 1, 1, 1, 1, 1,
-0.3848592, -1.679953, -2.685261, 1, 1, 1, 1, 1,
-0.3790527, -0.7472566, -1.227734, 1, 1, 1, 1, 1,
-0.3771881, 2.036292, -0.8482928, 1, 1, 1, 1, 1,
-0.3755318, -0.4507653, -3.503911, 1, 1, 1, 1, 1,
-0.37185, -1.320598, -4.265587, 1, 1, 1, 1, 1,
-0.3709984, 1.076255, 0.3458594, 0, 0, 1, 1, 1,
-0.3674191, -0.6080926, -1.53319, 1, 0, 0, 1, 1,
-0.367199, 0.2351302, -0.10286, 1, 0, 0, 1, 1,
-0.362502, -0.1083866, -2.261205, 1, 0, 0, 1, 1,
-0.3522481, 1.24068, -1.467802, 1, 0, 0, 1, 1,
-0.35201, -0.7840719, -1.950729, 1, 0, 0, 1, 1,
-0.3494125, 0.4599124, 0.02881934, 0, 0, 0, 1, 1,
-0.3458295, -0.9988509, -2.114499, 0, 0, 0, 1, 1,
-0.3434005, 0.560657, -1.543075, 0, 0, 0, 1, 1,
-0.3412199, -1.091345, -0.5646144, 0, 0, 0, 1, 1,
-0.3330359, 0.1288345, 0.2198236, 0, 0, 0, 1, 1,
-0.3304311, -0.9050785, -3.74085, 0, 0, 0, 1, 1,
-0.3270122, 0.2672631, -0.3523076, 0, 0, 0, 1, 1,
-0.3259794, -0.001796631, -1.503967, 1, 1, 1, 1, 1,
-0.3247557, 0.1529633, 0.4302953, 1, 1, 1, 1, 1,
-0.3238747, -2.735956, -2.385733, 1, 1, 1, 1, 1,
-0.3201279, 1.812538, 0.4166566, 1, 1, 1, 1, 1,
-0.3145487, 0.5142629, -0.9045514, 1, 1, 1, 1, 1,
-0.3136659, 0.299734, 0.005379073, 1, 1, 1, 1, 1,
-0.3088072, 0.4578806, 0.2765084, 1, 1, 1, 1, 1,
-0.3072369, -0.7950044, -4.392138, 1, 1, 1, 1, 1,
-0.3061468, 0.2996148, -0.7460263, 1, 1, 1, 1, 1,
-0.301948, -0.4230319, -5.166925, 1, 1, 1, 1, 1,
-0.3003378, -0.1437703, -1.181406, 1, 1, 1, 1, 1,
-0.2994286, 0.07672238, 1.030702, 1, 1, 1, 1, 1,
-0.2963657, 1.194412, -0.3057314, 1, 1, 1, 1, 1,
-0.295079, -0.1964168, -1.06529, 1, 1, 1, 1, 1,
-0.2943593, -0.3348689, -3.265308, 1, 1, 1, 1, 1,
-0.2905997, -0.9723999, -4.077177, 0, 0, 1, 1, 1,
-0.285679, 0.1407935, 0.1290527, 1, 0, 0, 1, 1,
-0.2820754, 0.4867519, -0.6374352, 1, 0, 0, 1, 1,
-0.2819425, 1.103401, -0.3364342, 1, 0, 0, 1, 1,
-0.2806417, 0.1017118, -0.8452932, 1, 0, 0, 1, 1,
-0.2755346, 0.2891999, -1.348409, 1, 0, 0, 1, 1,
-0.2719863, 0.7960115, 1.685881, 0, 0, 0, 1, 1,
-0.2675102, 0.1894022, -1.076112, 0, 0, 0, 1, 1,
-0.2646976, -0.6214651, -2.279941, 0, 0, 0, 1, 1,
-0.2639373, 0.552349, -1.991119, 0, 0, 0, 1, 1,
-0.2616883, -1.165593, -2.338466, 0, 0, 0, 1, 1,
-0.2582923, 1.159784, 1.399997, 0, 0, 0, 1, 1,
-0.2580499, -0.765492, -2.716999, 0, 0, 0, 1, 1,
-0.2543533, 0.4495624, -3.200754, 1, 1, 1, 1, 1,
-0.2542216, 2.179584, -0.2883344, 1, 1, 1, 1, 1,
-0.2469856, 0.1794653, -1.104026, 1, 1, 1, 1, 1,
-0.2465983, -0.6141287, -0.4594432, 1, 1, 1, 1, 1,
-0.2465688, -0.2387411, -1.176063, 1, 1, 1, 1, 1,
-0.2451234, 1.962298, -1.27323, 1, 1, 1, 1, 1,
-0.2446764, 1.453365, 1.72409, 1, 1, 1, 1, 1,
-0.2425006, -1.785078, -3.52735, 1, 1, 1, 1, 1,
-0.2424913, 0.402182, -0.2353157, 1, 1, 1, 1, 1,
-0.2408149, 0.3112401, -1.911671, 1, 1, 1, 1, 1,
-0.237232, 0.849768, -0.4471819, 1, 1, 1, 1, 1,
-0.2362184, -2.364538, -2.122155, 1, 1, 1, 1, 1,
-0.2356147, 0.1153886, -0.6593815, 1, 1, 1, 1, 1,
-0.2303655, -0.9822713, -2.71394, 1, 1, 1, 1, 1,
-0.2297397, 0.5986785, -0.4643244, 1, 1, 1, 1, 1,
-0.2290504, 1.456575, 0.8796093, 0, 0, 1, 1, 1,
-0.2272245, -0.2162075, -2.011811, 1, 0, 0, 1, 1,
-0.2255284, -0.9073387, -2.774279, 1, 0, 0, 1, 1,
-0.220028, 0.937104, -0.5402359, 1, 0, 0, 1, 1,
-0.2166911, 0.1255941, -1.911162, 1, 0, 0, 1, 1,
-0.216225, 1.845659, 2.428049, 1, 0, 0, 1, 1,
-0.2151781, 1.107571, -1.18158, 0, 0, 0, 1, 1,
-0.2139486, -0.8416976, -3.158211, 0, 0, 0, 1, 1,
-0.2121031, 0.08675802, -0.04490838, 0, 0, 0, 1, 1,
-0.2107485, 1.364093, 0.3089604, 0, 0, 0, 1, 1,
-0.2071366, -1.760433, -2.343443, 0, 0, 0, 1, 1,
-0.2024745, 0.2430449, -2.506045, 0, 0, 0, 1, 1,
-0.2020937, 0.02248864, -2.338702, 0, 0, 0, 1, 1,
-0.2007023, 2.483419, -0.1057429, 1, 1, 1, 1, 1,
-0.1971701, -0.1124773, -1.194338, 1, 1, 1, 1, 1,
-0.1943639, -0.4980977, -2.383105, 1, 1, 1, 1, 1,
-0.1921378, 0.5870213, -0.4118482, 1, 1, 1, 1, 1,
-0.1909465, -0.4430367, -0.5019945, 1, 1, 1, 1, 1,
-0.1883397, 1.812055, 0.7786707, 1, 1, 1, 1, 1,
-0.1785983, 0.5149005, 2.140442, 1, 1, 1, 1, 1,
-0.178449, -1.460041, -2.819856, 1, 1, 1, 1, 1,
-0.1725377, 0.1610627, -1.722266, 1, 1, 1, 1, 1,
-0.1719389, 1.048801, -1.483258, 1, 1, 1, 1, 1,
-0.1696473, 0.85134, -0.6581883, 1, 1, 1, 1, 1,
-0.1650949, 1.027071, -0.4589598, 1, 1, 1, 1, 1,
-0.1643622, 0.7146106, -1.634907, 1, 1, 1, 1, 1,
-0.1635774, -1.160378, -2.97041, 1, 1, 1, 1, 1,
-0.1632189, 0.4420002, 0.352784, 1, 1, 1, 1, 1,
-0.1622431, 0.7749338, 0.2631564, 0, 0, 1, 1, 1,
-0.1620378, 0.6586378, 0.7206753, 1, 0, 0, 1, 1,
-0.1616616, 0.729626, 2.093787, 1, 0, 0, 1, 1,
-0.1535826, 0.8871188, 1.111538, 1, 0, 0, 1, 1,
-0.1534353, 0.1828629, 0.9072735, 1, 0, 0, 1, 1,
-0.1528257, -0.9681894, -3.512871, 1, 0, 0, 1, 1,
-0.1472099, 0.3289806, -1.144749, 0, 0, 0, 1, 1,
-0.1460305, 0.2759418, 2.539614, 0, 0, 0, 1, 1,
-0.1401481, 1.319743, 0.2206778, 0, 0, 0, 1, 1,
-0.1379635, -0.816649, -4.026219, 0, 0, 0, 1, 1,
-0.1359361, 0.04943068, -2.115739, 0, 0, 0, 1, 1,
-0.1340284, -0.6502554, -1.764932, 0, 0, 0, 1, 1,
-0.1317196, -0.6817935, -1.756876, 0, 0, 0, 1, 1,
-0.1294963, -1.106761, -3.054753, 1, 1, 1, 1, 1,
-0.1279694, -1.722049, -2.205486, 1, 1, 1, 1, 1,
-0.1272103, -0.9775957, -2.994522, 1, 1, 1, 1, 1,
-0.1253637, -0.5718512, -1.721342, 1, 1, 1, 1, 1,
-0.1233799, 0.006040727, -0.4635262, 1, 1, 1, 1, 1,
-0.1220743, -1.852813, -2.831933, 1, 1, 1, 1, 1,
-0.1204796, -0.07420599, -1.621913, 1, 1, 1, 1, 1,
-0.1198972, 0.226305, 1.098934, 1, 1, 1, 1, 1,
-0.1195418, -1.326123, -1.576077, 1, 1, 1, 1, 1,
-0.1126351, 0.8622487, -0.167817, 1, 1, 1, 1, 1,
-0.1091772, -0.5994864, -3.110824, 1, 1, 1, 1, 1,
-0.1046629, -0.9941689, -2.13811, 1, 1, 1, 1, 1,
-0.1026332, 2.173407, 0.1010265, 1, 1, 1, 1, 1,
-0.09394114, 0.138614, 0.0003312078, 1, 1, 1, 1, 1,
-0.09119758, 1.141553, -0.9445223, 1, 1, 1, 1, 1,
-0.08829647, -0.3319286, 0.4888794, 0, 0, 1, 1, 1,
-0.08736381, 0.7446218, 1.030361, 1, 0, 0, 1, 1,
-0.08045681, 0.5468845, 0.4187951, 1, 0, 0, 1, 1,
-0.07712816, 0.4242729, 0.9297245, 1, 0, 0, 1, 1,
-0.0739751, 0.9312979, -0.9645554, 1, 0, 0, 1, 1,
-0.07351533, 0.823489, 1.055789, 1, 0, 0, 1, 1,
-0.06792455, -0.677111, -2.506294, 0, 0, 0, 1, 1,
-0.06364486, 0.4343535, -0.2266601, 0, 0, 0, 1, 1,
-0.060948, -0.6012319, -4.224823, 0, 0, 0, 1, 1,
-0.05921473, -0.103809, -3.274121, 0, 0, 0, 1, 1,
-0.05374619, 0.8737585, 0.8379923, 0, 0, 0, 1, 1,
-0.04641863, 0.4028205, -2.331577, 0, 0, 0, 1, 1,
-0.04550711, 0.9851816, 0.3952578, 0, 0, 0, 1, 1,
-0.04238852, -0.1752349, -4.481843, 1, 1, 1, 1, 1,
-0.04197786, 0.4507594, 0.3402858, 1, 1, 1, 1, 1,
-0.03660995, -1.427413, -3.126787, 1, 1, 1, 1, 1,
-0.03479999, 2.190766, -0.8039576, 1, 1, 1, 1, 1,
-0.03213603, 1.66377, -0.01881464, 1, 1, 1, 1, 1,
-0.0280108, -1.141864, -2.731378, 1, 1, 1, 1, 1,
-0.02391119, -0.6167954, -3.076602, 1, 1, 1, 1, 1,
-0.01818432, 0.2851892, 2.708482, 1, 1, 1, 1, 1,
-0.01784837, -0.04845891, -3.968109, 1, 1, 1, 1, 1,
-0.01523325, -0.488671, -1.536526, 1, 1, 1, 1, 1,
-0.008224418, 0.8961272, -0.152612, 1, 1, 1, 1, 1,
-0.006353826, -0.7285346, -3.316075, 1, 1, 1, 1, 1,
-0.002954774, -1.729517, -4.805536, 1, 1, 1, 1, 1,
0.003599033, 1.066934, 0.1052455, 1, 1, 1, 1, 1,
0.004160631, -0.2682441, 2.572324, 1, 1, 1, 1, 1,
0.009165212, -0.7442863, 2.484182, 0, 0, 1, 1, 1,
0.01119775, -0.07575538, 2.698002, 1, 0, 0, 1, 1,
0.01214725, 0.7579693, 0.1232272, 1, 0, 0, 1, 1,
0.01541666, -0.1056069, 2.055619, 1, 0, 0, 1, 1,
0.01875584, 1.25904, 0.6158925, 1, 0, 0, 1, 1,
0.02055046, 0.5203491, -0.279693, 1, 0, 0, 1, 1,
0.02263023, 0.2501593, 0.1599881, 0, 0, 0, 1, 1,
0.02528414, 0.3663742, -0.3396227, 0, 0, 0, 1, 1,
0.02598708, 0.1760245, 1.141046, 0, 0, 0, 1, 1,
0.02862977, -0.5456262, 1.779549, 0, 0, 0, 1, 1,
0.02917845, 0.6959159, 1.105561, 0, 0, 0, 1, 1,
0.03469664, -2.08898, 2.980605, 0, 0, 0, 1, 1,
0.03675347, -1.45705, 3.680297, 0, 0, 0, 1, 1,
0.04250522, -0.5167033, 1.499798, 1, 1, 1, 1, 1,
0.0505002, 1.565504, -0.9731196, 1, 1, 1, 1, 1,
0.05352078, 0.2415643, -0.4703591, 1, 1, 1, 1, 1,
0.05401482, 0.1198567, 0.09764799, 1, 1, 1, 1, 1,
0.05649037, -0.6826354, 3.584849, 1, 1, 1, 1, 1,
0.05944106, 0.2982267, 0.9737772, 1, 1, 1, 1, 1,
0.06113236, -1.527039, 4.735032, 1, 1, 1, 1, 1,
0.06146324, -0.8556194, 3.040997, 1, 1, 1, 1, 1,
0.06411948, -0.7894651, 0.9396818, 1, 1, 1, 1, 1,
0.07082205, 0.3821351, 1.853989, 1, 1, 1, 1, 1,
0.07154467, 0.2801101, 2.090885, 1, 1, 1, 1, 1,
0.07255407, -0.1779319, 2.095076, 1, 1, 1, 1, 1,
0.0728699, 0.5821354, 0.3852895, 1, 1, 1, 1, 1,
0.07367013, 1.508008, -0.5122037, 1, 1, 1, 1, 1,
0.07398561, 0.6376731, 0.6433073, 1, 1, 1, 1, 1,
0.07461154, 0.1898521, 0.1423601, 0, 0, 1, 1, 1,
0.0782617, 0.5291311, 0.982042, 1, 0, 0, 1, 1,
0.08027773, -0.9963759, 5.281958, 1, 0, 0, 1, 1,
0.08720067, 1.386588, -0.09767558, 1, 0, 0, 1, 1,
0.08721348, -0.478586, 2.181961, 1, 0, 0, 1, 1,
0.09220237, 0.4133029, -0.2786157, 1, 0, 0, 1, 1,
0.09263977, -0.110638, 2.905387, 0, 0, 0, 1, 1,
0.09515184, 0.4870346, 1.635531, 0, 0, 0, 1, 1,
0.09635093, 1.094604, -2.118778, 0, 0, 0, 1, 1,
0.09683703, 0.79159, -0.9590598, 0, 0, 0, 1, 1,
0.1000209, -0.8808875, 2.506708, 0, 0, 0, 1, 1,
0.1042383, 0.9671974, 0.8583326, 0, 0, 0, 1, 1,
0.1050338, 0.5491605, 0.2361477, 0, 0, 0, 1, 1,
0.1050925, 0.7757284, 0.9474196, 1, 1, 1, 1, 1,
0.1060137, -0.1347597, 3.035907, 1, 1, 1, 1, 1,
0.1090566, -1.488147, 4.589272, 1, 1, 1, 1, 1,
0.1146323, -0.2525465, 2.303372, 1, 1, 1, 1, 1,
0.1158723, -0.3418752, 2.919671, 1, 1, 1, 1, 1,
0.1167574, -0.7693549, 1.570115, 1, 1, 1, 1, 1,
0.1174925, -0.1487668, 0.9427682, 1, 1, 1, 1, 1,
0.1193178, -0.0454675, 2.58578, 1, 1, 1, 1, 1,
0.1197209, 1.102451, 0.3439167, 1, 1, 1, 1, 1,
0.1220033, 1.347723, -0.7535032, 1, 1, 1, 1, 1,
0.1221994, 0.1188199, 2.233143, 1, 1, 1, 1, 1,
0.1260419, 0.0722598, 1.098039, 1, 1, 1, 1, 1,
0.1271536, -0.5178853, 3.454147, 1, 1, 1, 1, 1,
0.1344008, -0.05393565, 2.08974, 1, 1, 1, 1, 1,
0.1376014, 0.2964474, 0.3545756, 1, 1, 1, 1, 1,
0.1380371, -0.03283111, 1.22347, 0, 0, 1, 1, 1,
0.139075, -0.9553605, 2.800241, 1, 0, 0, 1, 1,
0.1423631, 1.106288, 0.4719218, 1, 0, 0, 1, 1,
0.1441369, -1.241278, 2.919243, 1, 0, 0, 1, 1,
0.1470285, -0.2507755, 0.9581544, 1, 0, 0, 1, 1,
0.1509988, 1.289967, -1.78846, 1, 0, 0, 1, 1,
0.1524719, -0.3608983, 2.307026, 0, 0, 0, 1, 1,
0.157226, 0.4341924, -0.7009023, 0, 0, 0, 1, 1,
0.1580984, 0.427078, -1.454844, 0, 0, 0, 1, 1,
0.1600638, -0.564645, 3.065445, 0, 0, 0, 1, 1,
0.163372, 0.3636285, 0.3042324, 0, 0, 0, 1, 1,
0.1645169, -0.213905, 4.020494, 0, 0, 0, 1, 1,
0.1664574, -1.003228, 3.083032, 0, 0, 0, 1, 1,
0.1687051, 1.876484, -0.07466795, 1, 1, 1, 1, 1,
0.1695059, 1.292546, -0.8240327, 1, 1, 1, 1, 1,
0.1696796, 1.171231, 1.638855, 1, 1, 1, 1, 1,
0.1710458, 1.62906, -0.9159911, 1, 1, 1, 1, 1,
0.1713424, -1.524315, 2.222844, 1, 1, 1, 1, 1,
0.1719956, 0.06120712, 0.7732381, 1, 1, 1, 1, 1,
0.1746605, -1.171668, 4.202901, 1, 1, 1, 1, 1,
0.1790095, 0.1601394, 1.246616, 1, 1, 1, 1, 1,
0.1796399, -0.2511192, 4.957585, 1, 1, 1, 1, 1,
0.1819524, 0.6213264, 1.462805, 1, 1, 1, 1, 1,
0.1845614, 1.134521, 0.7623564, 1, 1, 1, 1, 1,
0.1862058, 0.2938934, 0.9918894, 1, 1, 1, 1, 1,
0.1877702, -1.443719, 4.498138, 1, 1, 1, 1, 1,
0.1905136, -0.1112634, 4.521513, 1, 1, 1, 1, 1,
0.1926194, -0.6608897, 4.748275, 1, 1, 1, 1, 1,
0.1931326, 0.5618132, 0.5568839, 0, 0, 1, 1, 1,
0.1948664, 0.4010834, -0.2413454, 1, 0, 0, 1, 1,
0.1980474, 0.06784853, 0.2411779, 1, 0, 0, 1, 1,
0.1999996, 0.7754253, -0.6479855, 1, 0, 0, 1, 1,
0.2010745, 0.589713, -1.417883, 1, 0, 0, 1, 1,
0.2035652, 0.5767713, 0.5518049, 1, 0, 0, 1, 1,
0.2039905, 0.4898608, 0.3458305, 0, 0, 0, 1, 1,
0.2046785, 0.2702857, 0.8452308, 0, 0, 0, 1, 1,
0.2054094, -1.836242, 2.009156, 0, 0, 0, 1, 1,
0.2062643, 1.838578, 1.723588, 0, 0, 0, 1, 1,
0.207538, 0.6799043, -0.9282783, 0, 0, 0, 1, 1,
0.2133819, 0.2879684, -0.5141537, 0, 0, 0, 1, 1,
0.2143794, -0.07922455, 2.637765, 0, 0, 0, 1, 1,
0.2186821, -1.269516, 2.709432, 1, 1, 1, 1, 1,
0.2200385, -0.5120898, 2.078418, 1, 1, 1, 1, 1,
0.2216495, -1.743414, 3.62959, 1, 1, 1, 1, 1,
0.2252856, -1.13176, 3.677756, 1, 1, 1, 1, 1,
0.2256949, -1.60419, 3.225067, 1, 1, 1, 1, 1,
0.2352549, 0.4621395, -0.01195168, 1, 1, 1, 1, 1,
0.2380056, 0.3621118, -0.3715402, 1, 1, 1, 1, 1,
0.2387786, 0.07078116, 1.090039, 1, 1, 1, 1, 1,
0.2418247, -0.001328453, 0.947803, 1, 1, 1, 1, 1,
0.246219, -0.3445708, 2.78409, 1, 1, 1, 1, 1,
0.2500668, -0.2738651, 1.907704, 1, 1, 1, 1, 1,
0.2512152, 0.9243461, 0.3285637, 1, 1, 1, 1, 1,
0.2545543, 1.309746, -1.924546, 1, 1, 1, 1, 1,
0.2587116, 1.807773, 1.052464, 1, 1, 1, 1, 1,
0.2679469, 0.7640373, 1.318817, 1, 1, 1, 1, 1,
0.2748403, 1.524, -2.391769, 0, 0, 1, 1, 1,
0.2754107, 0.9405706, 0.7890731, 1, 0, 0, 1, 1,
0.2807423, 0.5120318, 0.2261677, 1, 0, 0, 1, 1,
0.2851829, 0.7802724, -0.3155779, 1, 0, 0, 1, 1,
0.2913679, -1.277074, 2.596675, 1, 0, 0, 1, 1,
0.2923676, -0.8801491, 2.699143, 1, 0, 0, 1, 1,
0.2946793, -1.075765, 3.171959, 0, 0, 0, 1, 1,
0.2974986, -0.4335342, 3.285207, 0, 0, 0, 1, 1,
0.2991086, -0.2120722, 3.58554, 0, 0, 0, 1, 1,
0.2993604, -1.726156, 2.670696, 0, 0, 0, 1, 1,
0.3057916, -1.384688, 4.017658, 0, 0, 0, 1, 1,
0.3061038, 0.5272728, 1.160094, 0, 0, 0, 1, 1,
0.3075107, 0.6424395, 0.6223988, 0, 0, 0, 1, 1,
0.308231, -0.6160187, 2.025007, 1, 1, 1, 1, 1,
0.3134407, 1.438923, 1.552971, 1, 1, 1, 1, 1,
0.3209342, 0.8261072, 1.25359, 1, 1, 1, 1, 1,
0.3216639, -0.4339792, 4.07515, 1, 1, 1, 1, 1,
0.325284, 0.3449425, 2.528876, 1, 1, 1, 1, 1,
0.3301589, -1.041229, 2.491703, 1, 1, 1, 1, 1,
0.3314601, 0.1763679, 1.182554, 1, 1, 1, 1, 1,
0.332007, -1.800703, 5.047171, 1, 1, 1, 1, 1,
0.3350825, -0.1557804, 2.395008, 1, 1, 1, 1, 1,
0.3370621, 0.3222832, 0.64262, 1, 1, 1, 1, 1,
0.3376218, 1.435118, -0.1520267, 1, 1, 1, 1, 1,
0.3398067, -0.5604909, 1.777845, 1, 1, 1, 1, 1,
0.3401118, 0.8820775, 0.1462916, 1, 1, 1, 1, 1,
0.3437221, -0.6351728, 1.4025, 1, 1, 1, 1, 1,
0.3448033, 1.801604, 0.5159345, 1, 1, 1, 1, 1,
0.3449889, -2.497278, 2.55918, 0, 0, 1, 1, 1,
0.3453844, 1.354567, 1.307024, 1, 0, 0, 1, 1,
0.3573831, -0.2298017, 2.860521, 1, 0, 0, 1, 1,
0.3614398, -0.3205171, 2.564523, 1, 0, 0, 1, 1,
0.3676811, 1.13096, 1.13286, 1, 0, 0, 1, 1,
0.3736314, -0.4718345, 2.923562, 1, 0, 0, 1, 1,
0.376564, -0.5184982, 2.688423, 0, 0, 0, 1, 1,
0.3796765, 0.3750941, 0.03352819, 0, 0, 0, 1, 1,
0.3840996, -0.5613667, 4.106547, 0, 0, 0, 1, 1,
0.3884065, -1.220621, 3.10331, 0, 0, 0, 1, 1,
0.3915054, 0.6508373, 0.0437648, 0, 0, 0, 1, 1,
0.3932962, 1.49845, -0.253958, 0, 0, 0, 1, 1,
0.3938001, -1.712849, 2.753606, 0, 0, 0, 1, 1,
0.3945192, -0.4731372, 0.4088796, 1, 1, 1, 1, 1,
0.3970748, -1.604537, 2.803404, 1, 1, 1, 1, 1,
0.3987606, 0.6040513, 1.65881, 1, 1, 1, 1, 1,
0.4019585, -0.613897, 2.595232, 1, 1, 1, 1, 1,
0.4019966, -1.566936, 1.231723, 1, 1, 1, 1, 1,
0.4023764, 0.5203055, 3.168076, 1, 1, 1, 1, 1,
0.4050556, 0.3999098, 2.152298, 1, 1, 1, 1, 1,
0.4134566, 0.466821, 1.141828, 1, 1, 1, 1, 1,
0.4155267, -0.9011055, 2.569056, 1, 1, 1, 1, 1,
0.4190986, -1.057531, 3.372425, 1, 1, 1, 1, 1,
0.4222662, 0.9835218, -0.3695926, 1, 1, 1, 1, 1,
0.4256679, 1.133999, -0.6030686, 1, 1, 1, 1, 1,
0.4260767, 0.5852926, -1.997858, 1, 1, 1, 1, 1,
0.4315484, 0.3517593, 0.4552197, 1, 1, 1, 1, 1,
0.4325324, -0.5397494, 2.318368, 1, 1, 1, 1, 1,
0.4342361, 0.7604168, 1.481196, 0, 0, 1, 1, 1,
0.4372249, -1.663029, 4.176019, 1, 0, 0, 1, 1,
0.4389122, 0.6375266, 1.979222, 1, 0, 0, 1, 1,
0.439664, 0.2293484, 3.168211, 1, 0, 0, 1, 1,
0.44038, 0.4180813, 0.6704844, 1, 0, 0, 1, 1,
0.4406578, 0.4416755, 1.98784, 1, 0, 0, 1, 1,
0.4421499, 1.063645, -0.07642792, 0, 0, 0, 1, 1,
0.4492618, -1.291702, 3.44931, 0, 0, 0, 1, 1,
0.4547712, 0.3969213, 0.8379076, 0, 0, 0, 1, 1,
0.4594813, 1.196437, 0.1752612, 0, 0, 0, 1, 1,
0.4615144, -1.217821, 2.493875, 0, 0, 0, 1, 1,
0.4644165, -0.003844008, 1.751987, 0, 0, 0, 1, 1,
0.4687915, 2.057592, -0.108071, 0, 0, 0, 1, 1,
0.4736231, 0.03200079, 3.352164, 1, 1, 1, 1, 1,
0.4756965, -0.8259265, 1.37621, 1, 1, 1, 1, 1,
0.4764362, 0.7643639, 1.703007, 1, 1, 1, 1, 1,
0.477464, 0.6284329, 0.08141443, 1, 1, 1, 1, 1,
0.4788744, -0.7258511, 3.072513, 1, 1, 1, 1, 1,
0.4817697, 1.07739, 0.4685942, 1, 1, 1, 1, 1,
0.4879646, -0.8447525, 1.844547, 1, 1, 1, 1, 1,
0.4969746, 0.6647487, 1.056066, 1, 1, 1, 1, 1,
0.4998914, 1.174055, 0.8562051, 1, 1, 1, 1, 1,
0.5045131, -1.846021, 3.66363, 1, 1, 1, 1, 1,
0.504667, -0.2884955, 1.724262, 1, 1, 1, 1, 1,
0.5077369, 1.640178, 1.536299, 1, 1, 1, 1, 1,
0.5124899, -0.7570018, 3.304954, 1, 1, 1, 1, 1,
0.5170051, 0.6775894, 0.8553897, 1, 1, 1, 1, 1,
0.5215859, 0.2191468, -0.6232185, 1, 1, 1, 1, 1,
0.5263296, 1.733636, 0.2234569, 0, 0, 1, 1, 1,
0.5275175, -0.1726865, 3.865635, 1, 0, 0, 1, 1,
0.5304112, 0.3910041, 0.5974342, 1, 0, 0, 1, 1,
0.5306279, 0.6567301, 0.5921711, 1, 0, 0, 1, 1,
0.5311722, 0.0358055, 2.865913, 1, 0, 0, 1, 1,
0.5339257, 0.9288934, -0.6373426, 1, 0, 0, 1, 1,
0.5348316, -0.4788074, 2.75753, 0, 0, 0, 1, 1,
0.5366895, 1.281432, 0.564068, 0, 0, 0, 1, 1,
0.5379884, 0.3354678, 1.89934, 0, 0, 0, 1, 1,
0.5396271, 0.1618852, 2.374597, 0, 0, 0, 1, 1,
0.5409561, -0.6566522, 3.447184, 0, 0, 0, 1, 1,
0.5418684, -1.385001, 1.740674, 0, 0, 0, 1, 1,
0.5423033, -0.146901, 0.6702464, 0, 0, 0, 1, 1,
0.5426899, 0.4277149, 0.8254672, 1, 1, 1, 1, 1,
0.5520122, -1.347305, 5.380189, 1, 1, 1, 1, 1,
0.5561408, 0.3291089, 1.971588, 1, 1, 1, 1, 1,
0.5573049, 0.8764267, 1.264731, 1, 1, 1, 1, 1,
0.5638681, -0.303322, 1.29132, 1, 1, 1, 1, 1,
0.564756, -0.7142791, 2.55287, 1, 1, 1, 1, 1,
0.5679458, 0.03509935, 0.9077447, 1, 1, 1, 1, 1,
0.5703352, -0.474602, 0.8142626, 1, 1, 1, 1, 1,
0.5703437, 0.1040469, 1.150635, 1, 1, 1, 1, 1,
0.5752375, -0.5204127, 3.184248, 1, 1, 1, 1, 1,
0.5863656, -1.664528, 2.954839, 1, 1, 1, 1, 1,
0.58809, -0.3538875, 2.046437, 1, 1, 1, 1, 1,
0.5898406, 0.1067421, 0.5101588, 1, 1, 1, 1, 1,
0.5911188, -0.6186339, 0.741714, 1, 1, 1, 1, 1,
0.5922936, -0.5501996, 4.046821, 1, 1, 1, 1, 1,
0.5929045, 0.5009993, 1.027527, 0, 0, 1, 1, 1,
0.5953395, 0.5403333, 3.420774, 1, 0, 0, 1, 1,
0.5982156, -0.1112527, 0.8730987, 1, 0, 0, 1, 1,
0.600691, 1.768792, 0.1737932, 1, 0, 0, 1, 1,
0.6020318, 0.3513334, 0.627723, 1, 0, 0, 1, 1,
0.6049436, 0.3114402, -0.7522373, 1, 0, 0, 1, 1,
0.6057093, -1.084138, 2.441474, 0, 0, 0, 1, 1,
0.609666, -0.8770059, 1.936458, 0, 0, 0, 1, 1,
0.6135964, -0.5362264, 1.847302, 0, 0, 0, 1, 1,
0.615006, 0.4557165, 0.5014579, 0, 0, 0, 1, 1,
0.6177539, 0.8682127, 0.7287316, 0, 0, 0, 1, 1,
0.6242929, -0.4201327, 1.340956, 0, 0, 0, 1, 1,
0.6247475, -2.04087, 3.036938, 0, 0, 0, 1, 1,
0.628865, -0.3768148, 3.374568, 1, 1, 1, 1, 1,
0.6311387, 0.6507994, 0.6655948, 1, 1, 1, 1, 1,
0.6338197, -2.247775, 2.140199, 1, 1, 1, 1, 1,
0.6339042, 0.9205456, 0.4117335, 1, 1, 1, 1, 1,
0.6445812, -1.636148, 1.449351, 1, 1, 1, 1, 1,
0.6486937, 0.4841266, -0.7740659, 1, 1, 1, 1, 1,
0.6507437, -1.409777, 3.749025, 1, 1, 1, 1, 1,
0.654964, -0.05662423, 3.131059, 1, 1, 1, 1, 1,
0.6598948, 2.659793, 0.1647463, 1, 1, 1, 1, 1,
0.666696, -1.116389, 1.624309, 1, 1, 1, 1, 1,
0.6677456, 0.9326514, 0.6961253, 1, 1, 1, 1, 1,
0.6684279, 2.12502, 0.9973329, 1, 1, 1, 1, 1,
0.6750397, 0.4253771, 0.173297, 1, 1, 1, 1, 1,
0.6770166, -0.8661053, 3.783874, 1, 1, 1, 1, 1,
0.6777318, 0.04207687, 0.2392198, 1, 1, 1, 1, 1,
0.682566, -0.7997147, 4.036089, 0, 0, 1, 1, 1,
0.6836093, 0.04999707, 2.648794, 1, 0, 0, 1, 1,
0.6854858, -1.791952, 1.57609, 1, 0, 0, 1, 1,
0.6891192, 0.8245683, 0.6449229, 1, 0, 0, 1, 1,
0.6896805, -0.7903361, 2.436168, 1, 0, 0, 1, 1,
0.6903923, -0.2708881, 2.723936, 1, 0, 0, 1, 1,
0.6915536, 0.8063813, 1.946969, 0, 0, 0, 1, 1,
0.695837, -1.504711, 5.225419, 0, 0, 0, 1, 1,
0.6981735, -0.4340792, 1.575286, 0, 0, 0, 1, 1,
0.7009456, -1.913793, 2.689579, 0, 0, 0, 1, 1,
0.7025102, 0.4829619, 0.4685006, 0, 0, 0, 1, 1,
0.7038671, -0.5546676, 2.192082, 0, 0, 0, 1, 1,
0.7054989, 1.220316, -0.003849638, 0, 0, 0, 1, 1,
0.7094914, -0.03153711, 0.7075753, 1, 1, 1, 1, 1,
0.7140937, -0.130234, 2.214106, 1, 1, 1, 1, 1,
0.7261779, 1.470566, 2.104065, 1, 1, 1, 1, 1,
0.7346174, 0.3883313, 0.5449252, 1, 1, 1, 1, 1,
0.7370468, -1.347528, 2.197023, 1, 1, 1, 1, 1,
0.7371219, 2.072768, 0.4847745, 1, 1, 1, 1, 1,
0.7389624, 0.5627324, 0.8190904, 1, 1, 1, 1, 1,
0.7432531, -0.2740198, 0.2185285, 1, 1, 1, 1, 1,
0.7516996, -0.9294888, 2.442621, 1, 1, 1, 1, 1,
0.7525033, -0.8282868, 0.1302612, 1, 1, 1, 1, 1,
0.7577261, 1.393072, 0.762743, 1, 1, 1, 1, 1,
0.763495, 1.491262, 2.685562, 1, 1, 1, 1, 1,
0.7639694, 0.9943638, 1.178255, 1, 1, 1, 1, 1,
0.7643339, -0.4056149, 2.25625, 1, 1, 1, 1, 1,
0.7647876, 2.216611, 0.6085072, 1, 1, 1, 1, 1,
0.7653233, 0.07030819, 1.562601, 0, 0, 1, 1, 1,
0.7745167, -1.151907, 2.550584, 1, 0, 0, 1, 1,
0.7770202, 1.333459, 2.64171, 1, 0, 0, 1, 1,
0.7902949, -1.199876, 0.2062977, 1, 0, 0, 1, 1,
0.7936247, 0.1371913, 2.1472, 1, 0, 0, 1, 1,
0.7993001, -0.413316, 1.544865, 1, 0, 0, 1, 1,
0.7995735, -0.02026898, 2.49738, 0, 0, 0, 1, 1,
0.8086426, 0.3246887, 1.848744, 0, 0, 0, 1, 1,
0.809241, 0.8022436, -0.0945204, 0, 0, 0, 1, 1,
0.814353, -0.3434673, 1.820782, 0, 0, 0, 1, 1,
0.8148829, -0.314137, 2.361121, 0, 0, 0, 1, 1,
0.8219466, -0.8508089, 2.62973, 0, 0, 0, 1, 1,
0.8222773, -0.09598447, 0.8562391, 0, 0, 0, 1, 1,
0.8227812, 0.828752, 0.5853659, 1, 1, 1, 1, 1,
0.8281258, 1.277926, 0.9027544, 1, 1, 1, 1, 1,
0.8304663, 0.2490637, 1.139693, 1, 1, 1, 1, 1,
0.8312288, -1.495531, 2.690513, 1, 1, 1, 1, 1,
0.8317955, 1.167836, -0.08825771, 1, 1, 1, 1, 1,
0.8338088, -0.3344488, -0.2711585, 1, 1, 1, 1, 1,
0.8383358, -0.2136223, 2.313433, 1, 1, 1, 1, 1,
0.8392671, -1.632233, 3.184916, 1, 1, 1, 1, 1,
0.8409116, 0.3359751, 1.251265, 1, 1, 1, 1, 1,
0.8411394, -2.373891, 3.438757, 1, 1, 1, 1, 1,
0.8452439, 1.843159, 0.1636974, 1, 1, 1, 1, 1,
0.8477364, -0.8048426, 1.394874, 1, 1, 1, 1, 1,
0.8487083, -0.1311119, 4.074664, 1, 1, 1, 1, 1,
0.8492315, -0.9749008, 1.103871, 1, 1, 1, 1, 1,
0.8505578, -0.9091811, 0.634453, 1, 1, 1, 1, 1,
0.8534036, 0.7205628, 0.9796465, 0, 0, 1, 1, 1,
0.8542568, -0.2451685, 2.154299, 1, 0, 0, 1, 1,
0.8583844, -0.7891399, 1.355868, 1, 0, 0, 1, 1,
0.8596214, -0.4970334, 0.4243691, 1, 0, 0, 1, 1,
0.8707649, 0.8125193, 0.3514506, 1, 0, 0, 1, 1,
0.8709973, -1.513322, 1.068867, 1, 0, 0, 1, 1,
0.8744713, 2.687632, -0.1066815, 0, 0, 0, 1, 1,
0.8745156, 1.323894, 0.7898529, 0, 0, 0, 1, 1,
0.8786016, 0.9351259, 1.521469, 0, 0, 0, 1, 1,
0.878765, -0.629168, 2.345992, 0, 0, 0, 1, 1,
0.8791261, -0.3886245, 1.110825, 0, 0, 0, 1, 1,
0.8795902, -1.336659, 3.276893, 0, 0, 0, 1, 1,
0.8865334, -0.2442562, 1.886308, 0, 0, 0, 1, 1,
0.8890594, 0.8352329, -0.4108847, 1, 1, 1, 1, 1,
0.8927118, 1.010571, 1.556544, 1, 1, 1, 1, 1,
0.9117808, 1.19596, 2.291843, 1, 1, 1, 1, 1,
0.9139122, -0.53831, 1.556554, 1, 1, 1, 1, 1,
0.9151477, -0.7220901, 3.252139, 1, 1, 1, 1, 1,
0.9233568, 0.3112211, 1.603865, 1, 1, 1, 1, 1,
0.9342965, -0.8973455, 3.064959, 1, 1, 1, 1, 1,
0.9496512, 1.568059, 0.463657, 1, 1, 1, 1, 1,
0.9510351, -0.4294503, 0.8297006, 1, 1, 1, 1, 1,
0.9539811, -0.4705905, 1.178228, 1, 1, 1, 1, 1,
0.9562691, -0.9400304, 2.243091, 1, 1, 1, 1, 1,
0.9585277, -0.3616258, 2.522265, 1, 1, 1, 1, 1,
0.9593031, -0.7518194, 2.180218, 1, 1, 1, 1, 1,
0.963152, -0.4679395, 4.915407, 1, 1, 1, 1, 1,
0.9638009, 0.7196405, 1.280044, 1, 1, 1, 1, 1,
0.9639147, -0.02545442, 0.1690705, 0, 0, 1, 1, 1,
0.9674098, -0.4038478, 2.948344, 1, 0, 0, 1, 1,
0.9723583, -0.1461864, 2.2127, 1, 0, 0, 1, 1,
0.9770949, 0.7237718, 1.825312, 1, 0, 0, 1, 1,
0.9785446, 1.421825, 1.842162, 1, 0, 0, 1, 1,
0.9804167, 1.070515, 0.1084377, 1, 0, 0, 1, 1,
0.9843963, -0.7382026, 2.925759, 0, 0, 0, 1, 1,
0.9879627, 0.238227, 1.707093, 0, 0, 0, 1, 1,
0.9938341, -0.1659631, -0.9106302, 0, 0, 0, 1, 1,
0.9952943, 1.115163, 0.9895148, 0, 0, 0, 1, 1,
1.000898, 0.5013442, 1.168752, 0, 0, 0, 1, 1,
1.006836, -0.006712761, 2.681219, 0, 0, 0, 1, 1,
1.013277, -0.6116787, 1.757846, 0, 0, 0, 1, 1,
1.014877, -0.7979398, 2.357311, 1, 1, 1, 1, 1,
1.015988, -0.3550513, 1.154214, 1, 1, 1, 1, 1,
1.017213, -0.5403088, 2.393809, 1, 1, 1, 1, 1,
1.021776, 0.9084447, 0.9822719, 1, 1, 1, 1, 1,
1.023107, 0.6494558, 1.049928, 1, 1, 1, 1, 1,
1.024717, -0.8030042, -0.2665527, 1, 1, 1, 1, 1,
1.028397, 3.013021, -0.651984, 1, 1, 1, 1, 1,
1.029142, -1.120051, 1.420884, 1, 1, 1, 1, 1,
1.033675, -0.9807535, 3.931477, 1, 1, 1, 1, 1,
1.034169, -0.2861305, 0.736891, 1, 1, 1, 1, 1,
1.03435, -1.485641, 2.276084, 1, 1, 1, 1, 1,
1.036294, 0.02572987, 0.7297295, 1, 1, 1, 1, 1,
1.037313, 0.4575693, 1.188226, 1, 1, 1, 1, 1,
1.069191, -1.430754, 3.616563, 1, 1, 1, 1, 1,
1.081268, -0.3300048, 1.09977, 1, 1, 1, 1, 1,
1.083917, 0.4435665, -0.7645063, 0, 0, 1, 1, 1,
1.085063, -0.273634, 3.366963, 1, 0, 0, 1, 1,
1.089096, 0.9369369, 1.758327, 1, 0, 0, 1, 1,
1.089664, -0.9098075, 2.061623, 1, 0, 0, 1, 1,
1.115829, -1.897843, 2.681269, 1, 0, 0, 1, 1,
1.127542, 1.050988, 0.5608091, 1, 0, 0, 1, 1,
1.131726, 1.306324, -0.09892642, 0, 0, 0, 1, 1,
1.133082, -0.5575724, 3.012487, 0, 0, 0, 1, 1,
1.135612, -0.1874961, -0.119223, 0, 0, 0, 1, 1,
1.151362, 1.001195, 2.127096, 0, 0, 0, 1, 1,
1.159932, -0.09003308, 3.060226, 0, 0, 0, 1, 1,
1.172361, 0.4137079, 2.243598, 0, 0, 0, 1, 1,
1.180303, 1.485604, -1.376103, 0, 0, 0, 1, 1,
1.183963, 0.6261669, 1.395511, 1, 1, 1, 1, 1,
1.185604, 0.7942236, 0.6781242, 1, 1, 1, 1, 1,
1.190946, 0.2320428, 1.735624, 1, 1, 1, 1, 1,
1.193586, 0.8480275, 0.441351, 1, 1, 1, 1, 1,
1.206778, 0.2557684, 0.8737624, 1, 1, 1, 1, 1,
1.207882, 0.5765044, 0.6923752, 1, 1, 1, 1, 1,
1.2117, -0.5920473, 1.832554, 1, 1, 1, 1, 1,
1.216079, -2.721876, 3.060049, 1, 1, 1, 1, 1,
1.248838, -1.512353, 1.72306, 1, 1, 1, 1, 1,
1.25445, -0.4981666, 1.012053, 1, 1, 1, 1, 1,
1.263941, 0.06664556, 0.9099429, 1, 1, 1, 1, 1,
1.269679, 0.2734159, 1.32402, 1, 1, 1, 1, 1,
1.270761, 0.2434009, 0.08451523, 1, 1, 1, 1, 1,
1.285905, 0.1628431, 1.619079, 1, 1, 1, 1, 1,
1.29235, -1.904477, 1.352025, 1, 1, 1, 1, 1,
1.294091, 0.491851, -0.08583532, 0, 0, 1, 1, 1,
1.294916, 1.617824, 1.486254, 1, 0, 0, 1, 1,
1.295487, -1.403596, 1.217573, 1, 0, 0, 1, 1,
1.298685, 0.2886001, -0.1515328, 1, 0, 0, 1, 1,
1.316422, 1.232685, 0.3292224, 1, 0, 0, 1, 1,
1.32567, -1.549801, 1.695056, 1, 0, 0, 1, 1,
1.326604, -1.383959, 1.574395, 0, 0, 0, 1, 1,
1.32907, -0.9760706, 3.289881, 0, 0, 0, 1, 1,
1.32923, 0.5262275, 0.7035179, 0, 0, 0, 1, 1,
1.3358, -0.1606249, 1.744926, 0, 0, 0, 1, 1,
1.337299, 1.492062, 0.2275807, 0, 0, 0, 1, 1,
1.337897, 0.2398537, 0.9705434, 0, 0, 0, 1, 1,
1.338276, 0.1656472, -0.6526769, 0, 0, 0, 1, 1,
1.339117, 0.354376, 0.8247884, 1, 1, 1, 1, 1,
1.339314, 1.458856, 1.342691, 1, 1, 1, 1, 1,
1.340821, -0.01882041, 1.69809, 1, 1, 1, 1, 1,
1.344194, 2.86377, -0.2070473, 1, 1, 1, 1, 1,
1.348457, -1.563123, 3.218593, 1, 1, 1, 1, 1,
1.349456, 1.461257, 0.8863966, 1, 1, 1, 1, 1,
1.354242, -2.308015, 2.285976, 1, 1, 1, 1, 1,
1.356573, 0.2803442, -0.07598729, 1, 1, 1, 1, 1,
1.360576, 0.8409008, 1.702319, 1, 1, 1, 1, 1,
1.372068, 0.4408707, 1.126935, 1, 1, 1, 1, 1,
1.373281, -0.4773461, 2.155488, 1, 1, 1, 1, 1,
1.392009, 1.461673, 0.5099433, 1, 1, 1, 1, 1,
1.392254, 1.235924, 0.2530127, 1, 1, 1, 1, 1,
1.424496, -0.247402, -0.4860352, 1, 1, 1, 1, 1,
1.425502, -1.152439, 2.389512, 1, 1, 1, 1, 1,
1.429995, 0.5466217, 1.400851, 0, 0, 1, 1, 1,
1.435862, -1.682176, 3.162708, 1, 0, 0, 1, 1,
1.441074, -0.8810381, 3.604122, 1, 0, 0, 1, 1,
1.44167, -1.158607, 0.6264666, 1, 0, 0, 1, 1,
1.446225, 2.560523, 0.7316398, 1, 0, 0, 1, 1,
1.452223, 0.4385237, 0.3898229, 1, 0, 0, 1, 1,
1.453336, -1.41354, 3.414759, 0, 0, 0, 1, 1,
1.463922, -1.24356, 2.295551, 0, 0, 0, 1, 1,
1.471853, -2.571895, 2.482684, 0, 0, 0, 1, 1,
1.479136, -0.9264382, 1.177446, 0, 0, 0, 1, 1,
1.498465, 1.193438, 0.1009757, 0, 0, 0, 1, 1,
1.505384, -1.300742, 3.026085, 0, 0, 0, 1, 1,
1.508159, -0.9456453, 2.100253, 0, 0, 0, 1, 1,
1.518319, -0.3204746, 1.079922, 1, 1, 1, 1, 1,
1.533241, 0.8997902, 1.062736, 1, 1, 1, 1, 1,
1.560823, 1.130461, -1.281367, 1, 1, 1, 1, 1,
1.574035, -0.5342605, 2.152191, 1, 1, 1, 1, 1,
1.574411, -0.5266768, 0.2487011, 1, 1, 1, 1, 1,
1.576122, 1.005563, 0.3798429, 1, 1, 1, 1, 1,
1.581378, -1.326855, 3.03351, 1, 1, 1, 1, 1,
1.581907, -0.05468665, 1.935101, 1, 1, 1, 1, 1,
1.587187, 0.2102267, 1.608426, 1, 1, 1, 1, 1,
1.589776, 1.082101, 2.235225, 1, 1, 1, 1, 1,
1.592533, 1.797207, -0.07133964, 1, 1, 1, 1, 1,
1.592564, -1.945212, 2.401433, 1, 1, 1, 1, 1,
1.593141, 0.4079057, 0.7881364, 1, 1, 1, 1, 1,
1.598176, -0.1664654, 2.538024, 1, 1, 1, 1, 1,
1.600524, 1.119976, 0.9162045, 1, 1, 1, 1, 1,
1.605124, -0.6523402, 2.709131, 0, 0, 1, 1, 1,
1.641573, 2.06075, 1.92523, 1, 0, 0, 1, 1,
1.643528, -0.4858208, 2.163903, 1, 0, 0, 1, 1,
1.654365, 0.8286546, 1.184106, 1, 0, 0, 1, 1,
1.655626, 1.383765, 0.3581262, 1, 0, 0, 1, 1,
1.664126, 0.07349636, 1.632595, 1, 0, 0, 1, 1,
1.665722, 1.038371, -1.021163, 0, 0, 0, 1, 1,
1.670395, -1.070807, 1.95145, 0, 0, 0, 1, 1,
1.691435, -0.7595711, 2.747564, 0, 0, 0, 1, 1,
1.69778, -2.046912, 2.931538, 0, 0, 0, 1, 1,
1.710693, 0.1424967, 0.8001272, 0, 0, 0, 1, 1,
1.726829, -0.7127665, 2.657639, 0, 0, 0, 1, 1,
1.731371, 0.06636316, 1.639609, 0, 0, 0, 1, 1,
1.743069, 0.3479306, 2.729879, 1, 1, 1, 1, 1,
1.745229, -0.8112134, 2.119615, 1, 1, 1, 1, 1,
1.747687, 0.7430002, 0.297998, 1, 1, 1, 1, 1,
1.770041, -1.438727, 2.355898, 1, 1, 1, 1, 1,
1.770977, 1.581479, 0.7318147, 1, 1, 1, 1, 1,
1.775348, -1.603252, 0.9860237, 1, 1, 1, 1, 1,
1.776313, 0.4002604, 1.13658, 1, 1, 1, 1, 1,
1.782575, -0.3649113, 0.8797653, 1, 1, 1, 1, 1,
1.791048, -0.9311451, 1.993979, 1, 1, 1, 1, 1,
1.79996, -0.1617213, 2.55559, 1, 1, 1, 1, 1,
1.809379, -0.02620461, 0.4268548, 1, 1, 1, 1, 1,
1.809502, 0.8291754, 0.288844, 1, 1, 1, 1, 1,
1.821278, 0.1933712, 1.783604, 1, 1, 1, 1, 1,
1.837563, 0.05236029, 1.543801, 1, 1, 1, 1, 1,
1.867955, 0.2221894, 1.35413, 1, 1, 1, 1, 1,
1.873774, -0.583544, 0.194542, 0, 0, 1, 1, 1,
1.886092, -2.582434, 2.51614, 1, 0, 0, 1, 1,
1.905997, 0.9109846, 2.02479, 1, 0, 0, 1, 1,
1.921468, -1.353896, 3.160258, 1, 0, 0, 1, 1,
1.946368, -0.8492473, 3.369793, 1, 0, 0, 1, 1,
1.995655, 0.3694489, 0.4623613, 1, 0, 0, 1, 1,
2.051104, 0.3292332, 0.6601065, 0, 0, 0, 1, 1,
2.057482, -0.326287, 1.181996, 0, 0, 0, 1, 1,
2.084489, -0.1200518, 0.7112809, 0, 0, 0, 1, 1,
2.115621, 0.8006535, 0.8301628, 0, 0, 0, 1, 1,
2.167639, 0.005475989, 1.236469, 0, 0, 0, 1, 1,
2.189464, -1.515411, 2.410676, 0, 0, 0, 1, 1,
2.212641, 1.307017, -0.2381431, 0, 0, 0, 1, 1,
2.266976, 0.127832, 1.89208, 1, 1, 1, 1, 1,
2.317306, -1.325697, 0.7928913, 1, 1, 1, 1, 1,
2.375513, 0.8498588, 1.18096, 1, 1, 1, 1, 1,
2.588198, 0.7062232, 0.3188631, 1, 1, 1, 1, 1,
2.641628, -0.6090629, 0.4261678, 1, 1, 1, 1, 1,
2.649523, 0.937484, 1.51673, 1, 1, 1, 1, 1,
3.172464, -0.8334939, 3.497831, 1, 1, 1, 1, 1
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
var radius = 9.294129;
var distance = 32.64523;
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
mvMatrix.translate( -0.2292625, -0.1843073, -0.01844263 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.64523);
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
