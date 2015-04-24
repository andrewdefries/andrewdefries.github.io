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
-4.459504, 3.132883, 0.304316, 1, 0, 0, 1,
-3.120085, 1.629378, -1.447922, 1, 0.007843138, 0, 1,
-2.882547, -0.2694269, -2.156459, 1, 0.01176471, 0, 1,
-2.803239, -0.5989662, -0.2573391, 1, 0.01960784, 0, 1,
-2.727472, 0.3822996, -1.502668, 1, 0.02352941, 0, 1,
-2.625005, 0.1329834, -0.792616, 1, 0.03137255, 0, 1,
-2.591774, 0.7858512, 0.6814905, 1, 0.03529412, 0, 1,
-2.569011, -0.5405631, -1.446898, 1, 0.04313726, 0, 1,
-2.5402, 0.3858974, 0.2375275, 1, 0.04705882, 0, 1,
-2.348091, 0.1668186, 0.4579732, 1, 0.05490196, 0, 1,
-2.338607, -1.151642, -1.840674, 1, 0.05882353, 0, 1,
-2.300226, 0.2478174, -2.06066, 1, 0.06666667, 0, 1,
-2.288432, -0.8404314, -0.9429404, 1, 0.07058824, 0, 1,
-2.277294, -0.4990353, -2.520034, 1, 0.07843138, 0, 1,
-2.274943, -0.3908686, -1.936491, 1, 0.08235294, 0, 1,
-2.211596, 0.5295226, -1.964878, 1, 0.09019608, 0, 1,
-2.211593, 0.5272407, -2.246935, 1, 0.09411765, 0, 1,
-2.210272, -1.369835, -3.495692, 1, 0.1019608, 0, 1,
-2.174432, -1.821027, -3.298969, 1, 0.1098039, 0, 1,
-2.173588, -1.1656, -4.182217, 1, 0.1137255, 0, 1,
-2.130283, -0.8470443, -3.414717, 1, 0.1215686, 0, 1,
-2.112132, 0.7436534, -0.5502452, 1, 0.1254902, 0, 1,
-2.090504, -0.1062663, -1.784435, 1, 0.1333333, 0, 1,
-2.069131, 0.1772497, -1.132169, 1, 0.1372549, 0, 1,
-2.069105, 0.87637, -1.480336, 1, 0.145098, 0, 1,
-2.022214, 1.38212, -0.2711818, 1, 0.1490196, 0, 1,
-2.021691, 0.336084, -1.411915, 1, 0.1568628, 0, 1,
-2.018496, 0.7617626, 0.389048, 1, 0.1607843, 0, 1,
-2.01119, 0.7003511, -1.154809, 1, 0.1686275, 0, 1,
-2.007209, -1.377206, -1.728435, 1, 0.172549, 0, 1,
-2.003137, -1.684187, -3.642991, 1, 0.1803922, 0, 1,
-1.964956, 1.041659, -2.710295, 1, 0.1843137, 0, 1,
-1.935975, 0.2741772, -1.133189, 1, 0.1921569, 0, 1,
-1.921624, -0.2730077, -1.115035, 1, 0.1960784, 0, 1,
-1.909305, -0.3570006, -0.9553773, 1, 0.2039216, 0, 1,
-1.84564, -0.3869537, -3.392434, 1, 0.2117647, 0, 1,
-1.844064, -0.1959989, -1.923321, 1, 0.2156863, 0, 1,
-1.842336, 0.3993101, -2.439446, 1, 0.2235294, 0, 1,
-1.787609, 0.5462918, -1.66344, 1, 0.227451, 0, 1,
-1.782425, -1.585128, -3.429676, 1, 0.2352941, 0, 1,
-1.77911, -1.0486, -1.212732, 1, 0.2392157, 0, 1,
-1.755691, -0.1371715, -0.8821602, 1, 0.2470588, 0, 1,
-1.75455, 2.437122, 0.06857577, 1, 0.2509804, 0, 1,
-1.746127, -0.6680867, -1.665935, 1, 0.2588235, 0, 1,
-1.744244, -0.6262205, -2.209207, 1, 0.2627451, 0, 1,
-1.729694, 0.217522, -0.8282141, 1, 0.2705882, 0, 1,
-1.718742, 0.609041, -0.5019438, 1, 0.2745098, 0, 1,
-1.703909, -0.2845947, -1.856666, 1, 0.282353, 0, 1,
-1.696648, 0.7929567, 0.3410651, 1, 0.2862745, 0, 1,
-1.690154, -1.496523, -3.324641, 1, 0.2941177, 0, 1,
-1.679241, 0.963581, -0.07350292, 1, 0.3019608, 0, 1,
-1.654115, 0.2432065, -1.42948, 1, 0.3058824, 0, 1,
-1.643647, -0.3219108, -2.208793, 1, 0.3137255, 0, 1,
-1.643426, 1.663405, 1.493809, 1, 0.3176471, 0, 1,
-1.641991, -0.3121926, -1.707718, 1, 0.3254902, 0, 1,
-1.641582, 0.8277009, 0.1465252, 1, 0.3294118, 0, 1,
-1.622773, -0.1477985, 0.02314654, 1, 0.3372549, 0, 1,
-1.607662, -0.5441203, -1.253917, 1, 0.3411765, 0, 1,
-1.60376, -0.5132295, -0.4204025, 1, 0.3490196, 0, 1,
-1.596303, -0.711666, -2.086255, 1, 0.3529412, 0, 1,
-1.581865, -0.5495641, -3.733023, 1, 0.3607843, 0, 1,
-1.54806, -0.7355579, -1.355628, 1, 0.3647059, 0, 1,
-1.541324, 0.3872613, -3.058691, 1, 0.372549, 0, 1,
-1.537169, 1.206351, 0.02273223, 1, 0.3764706, 0, 1,
-1.535026, 1.174528, -1.51298, 1, 0.3843137, 0, 1,
-1.53361, 2.095236, 0.2923453, 1, 0.3882353, 0, 1,
-1.528344, -0.06318164, -0.4713829, 1, 0.3960784, 0, 1,
-1.526625, 1.297225, -1.769458, 1, 0.4039216, 0, 1,
-1.514022, -0.6395084, -1.859082, 1, 0.4078431, 0, 1,
-1.510105, 0.7623948, -0.2168408, 1, 0.4156863, 0, 1,
-1.504136, 0.6167834, -0.637545, 1, 0.4196078, 0, 1,
-1.501177, -0.6293814, -1.554729, 1, 0.427451, 0, 1,
-1.496765, 0.4909501, -1.465753, 1, 0.4313726, 0, 1,
-1.49345, 0.9232449, -0.7219447, 1, 0.4392157, 0, 1,
-1.492591, -0.4793, -0.9072737, 1, 0.4431373, 0, 1,
-1.48247, -0.9792083, -2.117652, 1, 0.4509804, 0, 1,
-1.46266, 0.7593919, -1.144335, 1, 0.454902, 0, 1,
-1.43689, -0.3783008, -1.168463, 1, 0.4627451, 0, 1,
-1.435652, -0.1025993, -1.080511, 1, 0.4666667, 0, 1,
-1.430054, -0.9732009, -1.634247, 1, 0.4745098, 0, 1,
-1.396008, -0.6311216, -1.073419, 1, 0.4784314, 0, 1,
-1.384126, -1.594816, -2.855483, 1, 0.4862745, 0, 1,
-1.380907, -1.146317, -4.022901, 1, 0.4901961, 0, 1,
-1.376849, 0.4202836, -1.769518, 1, 0.4980392, 0, 1,
-1.37284, 0.6068448, -1.361911, 1, 0.5058824, 0, 1,
-1.366538, -0.2438307, -1.004711, 1, 0.509804, 0, 1,
-1.365903, 1.04824, 0.1517269, 1, 0.5176471, 0, 1,
-1.363443, -0.4584963, -1.85511, 1, 0.5215687, 0, 1,
-1.361944, 1.943031, -1.143406, 1, 0.5294118, 0, 1,
-1.349032, -0.6363435, -1.947355, 1, 0.5333334, 0, 1,
-1.341338, -0.492191, -3.19355, 1, 0.5411765, 0, 1,
-1.338033, 0.7883822, 0.8934228, 1, 0.5450981, 0, 1,
-1.325395, 0.1527213, -1.473114, 1, 0.5529412, 0, 1,
-1.317306, 0.08679299, -3.09554, 1, 0.5568628, 0, 1,
-1.315924, -0.02375032, 0.3671154, 1, 0.5647059, 0, 1,
-1.310095, 1.232361, -1.043548, 1, 0.5686275, 0, 1,
-1.309913, 0.04903481, -0.619884, 1, 0.5764706, 0, 1,
-1.285424, -0.5107502, -1.689627, 1, 0.5803922, 0, 1,
-1.278959, 0.037193, -0.6254921, 1, 0.5882353, 0, 1,
-1.271178, 0.2072145, -1.885183, 1, 0.5921569, 0, 1,
-1.270763, -0.8439859, -2.027319, 1, 0.6, 0, 1,
-1.268269, -0.3486416, -3.098606, 1, 0.6078432, 0, 1,
-1.267299, 0.5922354, -1.973848, 1, 0.6117647, 0, 1,
-1.264256, -1.313484, 0.4800069, 1, 0.6196079, 0, 1,
-1.262361, -1.905451, -3.637125, 1, 0.6235294, 0, 1,
-1.243711, -0.0687151, -0.4273964, 1, 0.6313726, 0, 1,
-1.236779, -0.3606192, -2.906042, 1, 0.6352941, 0, 1,
-1.231757, 0.09627829, -1.318042, 1, 0.6431373, 0, 1,
-1.210318, -1.150469, -2.004093, 1, 0.6470588, 0, 1,
-1.20855, -0.608704, -0.4343008, 1, 0.654902, 0, 1,
-1.201223, 0.4823755, -0.6376303, 1, 0.6588235, 0, 1,
-1.200647, -0.4797175, -0.9751363, 1, 0.6666667, 0, 1,
-1.199171, 0.1810325, -2.392825, 1, 0.6705883, 0, 1,
-1.1896, -1.081827, -3.333834, 1, 0.6784314, 0, 1,
-1.185488, 2.240117, -0.5294673, 1, 0.682353, 0, 1,
-1.171393, 0.5012883, 1.197799, 1, 0.6901961, 0, 1,
-1.166031, -0.4240533, -0.4524657, 1, 0.6941177, 0, 1,
-1.165955, 1.05365, -1.611046, 1, 0.7019608, 0, 1,
-1.165667, 0.005765619, -2.408649, 1, 0.7098039, 0, 1,
-1.160858, -0.203786, -1.066985, 1, 0.7137255, 0, 1,
-1.160227, -0.2586516, -0.6697187, 1, 0.7215686, 0, 1,
-1.155942, -1.437071, -3.391047, 1, 0.7254902, 0, 1,
-1.151407, -1.325445, -1.300805, 1, 0.7333333, 0, 1,
-1.147256, -0.1448425, -2.440613, 1, 0.7372549, 0, 1,
-1.143706, -1.538038, 0.3301233, 1, 0.7450981, 0, 1,
-1.138305, 2.161653, -1.192814, 1, 0.7490196, 0, 1,
-1.134245, -1.828989, -0.7383339, 1, 0.7568628, 0, 1,
-1.130349, -0.8260416, 0.07636508, 1, 0.7607843, 0, 1,
-1.128864, 0.3422784, -2.12155, 1, 0.7686275, 0, 1,
-1.115264, -0.4946713, -3.105386, 1, 0.772549, 0, 1,
-1.106875, 1.05616, -2.285851, 1, 0.7803922, 0, 1,
-1.10573, 1.04597, -0.2522969, 1, 0.7843137, 0, 1,
-1.098241, 0.2183043, -0.06515335, 1, 0.7921569, 0, 1,
-1.068681, -1.455826, -2.436341, 1, 0.7960784, 0, 1,
-1.067334, -0.4760164, -2.705457, 1, 0.8039216, 0, 1,
-1.053728, 0.2105421, -2.231541, 1, 0.8117647, 0, 1,
-1.050903, -0.602225, -3.446818, 1, 0.8156863, 0, 1,
-1.044721, 0.8593446, -0.8774031, 1, 0.8235294, 0, 1,
-1.044652, 0.6194815, -1.185193, 1, 0.827451, 0, 1,
-1.041773, 1.042674, -1.445847, 1, 0.8352941, 0, 1,
-1.039686, -0.1950406, -1.693622, 1, 0.8392157, 0, 1,
-1.037564, -0.5958373, -0.6733947, 1, 0.8470588, 0, 1,
-1.035678, 0.7649783, -0.7941644, 1, 0.8509804, 0, 1,
-1.033539, -0.2093847, 0.10605, 1, 0.8588235, 0, 1,
-1.033237, 2.232185, -2.048114, 1, 0.8627451, 0, 1,
-1.028965, -1.055208, -1.750805, 1, 0.8705882, 0, 1,
-1.026441, 0.5628586, -2.369808, 1, 0.8745098, 0, 1,
-1.024195, 1.511906, -1.832942, 1, 0.8823529, 0, 1,
-1.020828, -0.3014598, -1.867478, 1, 0.8862745, 0, 1,
-1.016864, -0.7954477, -2.876938, 1, 0.8941177, 0, 1,
-1.014728, 0.9986386, -0.7122235, 1, 0.8980392, 0, 1,
-1.004457, -1.498222, -3.717613, 1, 0.9058824, 0, 1,
-1.003075, 0.2809098, -1.312971, 1, 0.9137255, 0, 1,
-1.001545, 0.003577277, -2.019266, 1, 0.9176471, 0, 1,
-0.9870685, -0.8478411, -1.177912, 1, 0.9254902, 0, 1,
-0.9825402, 0.01167941, -3.99692, 1, 0.9294118, 0, 1,
-0.9743431, -1.085769, -3.39247, 1, 0.9372549, 0, 1,
-0.9731068, 0.7951725, -1.549549, 1, 0.9411765, 0, 1,
-0.9694564, -0.2374149, -3.171014, 1, 0.9490196, 0, 1,
-0.9629559, -0.9158997, -2.7704, 1, 0.9529412, 0, 1,
-0.9453938, -0.4300538, -2.715571, 1, 0.9607843, 0, 1,
-0.9451442, -1.083947, -0.4295841, 1, 0.9647059, 0, 1,
-0.9372933, 0.1839159, -0.9363189, 1, 0.972549, 0, 1,
-0.9347764, -1.492025, -4.134263, 1, 0.9764706, 0, 1,
-0.9290075, -0.8692546, -1.845904, 1, 0.9843137, 0, 1,
-0.9289817, -0.1048572, -1.535839, 1, 0.9882353, 0, 1,
-0.9281234, -1.646583, -2.275872, 1, 0.9960784, 0, 1,
-0.9275169, -0.007494248, -3.384714, 0.9960784, 1, 0, 1,
-0.9242995, -1.954117, -2.826969, 0.9921569, 1, 0, 1,
-0.9227934, 1.606535, 0.02429292, 0.9843137, 1, 0, 1,
-0.9190929, -0.2836413, -0.5046594, 0.9803922, 1, 0, 1,
-0.9146911, 0.1231681, -3.688496, 0.972549, 1, 0, 1,
-0.9072109, -0.3211237, -1.768701, 0.9686275, 1, 0, 1,
-0.8968475, -0.04095162, -2.408653, 0.9607843, 1, 0, 1,
-0.8892543, 0.0549224, -1.693272, 0.9568627, 1, 0, 1,
-0.8860723, 1.362545, 0.6998479, 0.9490196, 1, 0, 1,
-0.8846015, 0.7555104, -1.348123, 0.945098, 1, 0, 1,
-0.8819422, -0.06752925, -0.5882368, 0.9372549, 1, 0, 1,
-0.8782476, 0.4259709, 0.1598418, 0.9333333, 1, 0, 1,
-0.872481, -2.385186, -1.710827, 0.9254902, 1, 0, 1,
-0.871941, -0.6197442, -3.014763, 0.9215686, 1, 0, 1,
-0.8687701, 0.3623566, 1.181423, 0.9137255, 1, 0, 1,
-0.8662212, -0.7206679, -2.573407, 0.9098039, 1, 0, 1,
-0.8568392, -0.6866876, -3.670894, 0.9019608, 1, 0, 1,
-0.8452464, 0.6101718, 0.8345949, 0.8941177, 1, 0, 1,
-0.8410155, -1.767642, -1.929776, 0.8901961, 1, 0, 1,
-0.8379481, 0.4720893, -2.79252, 0.8823529, 1, 0, 1,
-0.8335448, -1.233824, -2.55378, 0.8784314, 1, 0, 1,
-0.8194411, -1.153909, -2.990773, 0.8705882, 1, 0, 1,
-0.8187144, -1.269349, 0.2027728, 0.8666667, 1, 0, 1,
-0.8038728, 0.201559, -1.914642, 0.8588235, 1, 0, 1,
-0.7954424, 0.1475024, -1.654171, 0.854902, 1, 0, 1,
-0.7948756, -1.914837, -1.524252, 0.8470588, 1, 0, 1,
-0.7942185, 1.38742, -0.8647129, 0.8431373, 1, 0, 1,
-0.7824337, 0.7991794, -1.792085, 0.8352941, 1, 0, 1,
-0.7814394, -1.307321, -3.169027, 0.8313726, 1, 0, 1,
-0.7734356, 0.2204206, -3.227886, 0.8235294, 1, 0, 1,
-0.7716784, -0.08037932, -1.752273, 0.8196079, 1, 0, 1,
-0.7715761, 0.8373531, -1.826792, 0.8117647, 1, 0, 1,
-0.770804, -1.292112, -3.814124, 0.8078431, 1, 0, 1,
-0.75984, 0.2091756, -1.340303, 0.8, 1, 0, 1,
-0.7562648, -1.705628, -0.5314928, 0.7921569, 1, 0, 1,
-0.754007, -2.351375, -5.788633, 0.7882353, 1, 0, 1,
-0.7528214, 2.013324, 0.3029024, 0.7803922, 1, 0, 1,
-0.7476652, 1.138212, 0.4031884, 0.7764706, 1, 0, 1,
-0.7468145, 0.4645305, -2.341586, 0.7686275, 1, 0, 1,
-0.7461615, 1.30218, -0.6802173, 0.7647059, 1, 0, 1,
-0.7439687, -0.9031444, -4.819102, 0.7568628, 1, 0, 1,
-0.7404481, 0.08960517, -1.733683, 0.7529412, 1, 0, 1,
-0.7384506, 0.1681305, -1.251612, 0.7450981, 1, 0, 1,
-0.7379513, 1.167591, 0.2718141, 0.7411765, 1, 0, 1,
-0.712413, 0.7254241, 0.8692167, 0.7333333, 1, 0, 1,
-0.6998888, 0.2647702, -0.4810475, 0.7294118, 1, 0, 1,
-0.6949316, 1.175587, -1.188903, 0.7215686, 1, 0, 1,
-0.6931695, 1.563315, -0.08154218, 0.7176471, 1, 0, 1,
-0.6904469, 0.1002287, -0.4833777, 0.7098039, 1, 0, 1,
-0.6890211, -0.4770395, -2.749527, 0.7058824, 1, 0, 1,
-0.6846593, -0.687535, -2.641836, 0.6980392, 1, 0, 1,
-0.6786041, 0.2830904, 0.7740198, 0.6901961, 1, 0, 1,
-0.6748458, -0.6056914, -4.280097, 0.6862745, 1, 0, 1,
-0.6662234, 1.975885, -0.6591427, 0.6784314, 1, 0, 1,
-0.6629909, 0.9087041, 0.2190607, 0.6745098, 1, 0, 1,
-0.6624414, 1.642437, -0.8610938, 0.6666667, 1, 0, 1,
-0.6597239, -1.483193, -2.734519, 0.6627451, 1, 0, 1,
-0.6581215, -0.09144642, -4.493461, 0.654902, 1, 0, 1,
-0.6536224, -1.341086, -1.110505, 0.6509804, 1, 0, 1,
-0.652627, -0.6582291, -2.797729, 0.6431373, 1, 0, 1,
-0.652528, -0.9098486, -2.863347, 0.6392157, 1, 0, 1,
-0.6511746, 0.1746667, 1.228095, 0.6313726, 1, 0, 1,
-0.6485928, 1.229129, -1.023298, 0.627451, 1, 0, 1,
-0.6465157, -0.1452938, 0.312506, 0.6196079, 1, 0, 1,
-0.643883, -1.094278, -2.887757, 0.6156863, 1, 0, 1,
-0.6378443, 0.1536153, -0.8139927, 0.6078432, 1, 0, 1,
-0.622182, -0.6274687, -2.244061, 0.6039216, 1, 0, 1,
-0.6212237, 1.812187, 0.4314615, 0.5960785, 1, 0, 1,
-0.6155447, 1.817829, 0.43479, 0.5882353, 1, 0, 1,
-0.6150022, -1.726594, -1.860734, 0.5843138, 1, 0, 1,
-0.6143171, 0.6712455, -1.279525, 0.5764706, 1, 0, 1,
-0.6057284, -0.6132894, -3.012444, 0.572549, 1, 0, 1,
-0.6056646, 0.1389427, -3.589202, 0.5647059, 1, 0, 1,
-0.6055087, -1.291113, -3.054838, 0.5607843, 1, 0, 1,
-0.597298, -1.742713, -1.330573, 0.5529412, 1, 0, 1,
-0.593798, -0.9758843, -2.437157, 0.5490196, 1, 0, 1,
-0.5870779, -1.259873, -2.806222, 0.5411765, 1, 0, 1,
-0.586242, -0.9215491, -0.6339347, 0.5372549, 1, 0, 1,
-0.5798602, -0.1280556, -2.461154, 0.5294118, 1, 0, 1,
-0.5795658, 0.08715809, -2.853159, 0.5254902, 1, 0, 1,
-0.5763569, -0.7499301, -2.632206, 0.5176471, 1, 0, 1,
-0.5742881, 1.012865, 0.2300479, 0.5137255, 1, 0, 1,
-0.5678722, -0.7368146, -3.122358, 0.5058824, 1, 0, 1,
-0.5672581, 2.562701, -0.6279969, 0.5019608, 1, 0, 1,
-0.5626954, 1.160865, 0.6427932, 0.4941176, 1, 0, 1,
-0.5610172, -0.4982578, -2.780138, 0.4862745, 1, 0, 1,
-0.5537292, -0.7600542, -1.766238, 0.4823529, 1, 0, 1,
-0.5495499, -1.373549, -4.914479, 0.4745098, 1, 0, 1,
-0.5471374, -0.9981385, -3.506279, 0.4705882, 1, 0, 1,
-0.544938, 0.9638684, -1.662116, 0.4627451, 1, 0, 1,
-0.5419388, 0.1813655, 0.9524311, 0.4588235, 1, 0, 1,
-0.5417101, 0.2935791, -0.2408121, 0.4509804, 1, 0, 1,
-0.5404641, -0.2991498, -1.6366, 0.4470588, 1, 0, 1,
-0.5326145, 2.375807, -1.218699, 0.4392157, 1, 0, 1,
-0.5286909, -0.1975797, -3.181032, 0.4352941, 1, 0, 1,
-0.5272747, 1.183061, -0.04571706, 0.427451, 1, 0, 1,
-0.5258816, 0.405891, -2.198484, 0.4235294, 1, 0, 1,
-0.5256648, 0.9370706, 1.756675, 0.4156863, 1, 0, 1,
-0.5245863, 0.05967937, 1.074713, 0.4117647, 1, 0, 1,
-0.5238943, 0.9084491, 0.0397741, 0.4039216, 1, 0, 1,
-0.5135776, 0.02227009, -1.381916, 0.3960784, 1, 0, 1,
-0.5119539, 0.7546942, 0.2308975, 0.3921569, 1, 0, 1,
-0.5089901, 0.596644, -1.840531, 0.3843137, 1, 0, 1,
-0.5084708, -0.9206652, -2.958177, 0.3803922, 1, 0, 1,
-0.504033, -1.066808, -2.765158, 0.372549, 1, 0, 1,
-0.5036509, -0.07823349, -0.3350317, 0.3686275, 1, 0, 1,
-0.5010147, -0.04461114, -0.05791008, 0.3607843, 1, 0, 1,
-0.4967741, 0.6021823, -0.8855284, 0.3568628, 1, 0, 1,
-0.4962315, -0.659236, -4.248849, 0.3490196, 1, 0, 1,
-0.4929813, -1.217865, -0.8176447, 0.345098, 1, 0, 1,
-0.490361, 0.7884244, -0.121124, 0.3372549, 1, 0, 1,
-0.489993, 0.4668925, 0.4031262, 0.3333333, 1, 0, 1,
-0.4864785, -0.4970827, -1.60903, 0.3254902, 1, 0, 1,
-0.4818415, 1.022973, -1.379008, 0.3215686, 1, 0, 1,
-0.4770417, -0.4110843, -1.584503, 0.3137255, 1, 0, 1,
-0.4712407, 0.5546661, 1.030142, 0.3098039, 1, 0, 1,
-0.4709538, 0.4926437, -2.004137, 0.3019608, 1, 0, 1,
-0.4704423, -2.345259, -3.444998, 0.2941177, 1, 0, 1,
-0.4619403, -0.4586049, -2.254051, 0.2901961, 1, 0, 1,
-0.4615674, 1.452501, 0.1707408, 0.282353, 1, 0, 1,
-0.4605566, 0.5148978, -0.1942713, 0.2784314, 1, 0, 1,
-0.4580847, 1.083126, 0.3879909, 0.2705882, 1, 0, 1,
-0.4578508, 0.3775863, -1.014674, 0.2666667, 1, 0, 1,
-0.4555206, 0.2858204, -0.200975, 0.2588235, 1, 0, 1,
-0.4550606, 1.179503, -0.04798067, 0.254902, 1, 0, 1,
-0.4539314, -0.3595214, -3.441887, 0.2470588, 1, 0, 1,
-0.4525563, -0.2935071, -1.575845, 0.2431373, 1, 0, 1,
-0.4490397, -1.648846, -2.816648, 0.2352941, 1, 0, 1,
-0.4459375, 0.1053568, -1.99831, 0.2313726, 1, 0, 1,
-0.4413242, 0.3988319, -0.3775509, 0.2235294, 1, 0, 1,
-0.4409273, -0.8499946, -3.257967, 0.2196078, 1, 0, 1,
-0.4376751, 1.24072, -0.6370242, 0.2117647, 1, 0, 1,
-0.4376063, -0.5499892, -0.8726292, 0.2078431, 1, 0, 1,
-0.4367479, -0.2061564, -2.652281, 0.2, 1, 0, 1,
-0.4337098, -1.669736, -1.532015, 0.1921569, 1, 0, 1,
-0.4315588, 1.06536, -1.661811, 0.1882353, 1, 0, 1,
-0.4233234, -0.7652251, -0.9950056, 0.1803922, 1, 0, 1,
-0.4195855, -1.126216, -2.165543, 0.1764706, 1, 0, 1,
-0.4187125, 1.084847, -1.293196, 0.1686275, 1, 0, 1,
-0.4155137, -0.0658486, -1.110312, 0.1647059, 1, 0, 1,
-0.4143854, 0.4438633, -2.55464, 0.1568628, 1, 0, 1,
-0.4130297, -0.6445188, -3.777755, 0.1529412, 1, 0, 1,
-0.4116314, 0.01030317, -1.591871, 0.145098, 1, 0, 1,
-0.4086134, 0.3121007, 0.08447409, 0.1411765, 1, 0, 1,
-0.4065741, 0.2270926, -1.453381, 0.1333333, 1, 0, 1,
-0.4043787, -0.3831423, -0.9899562, 0.1294118, 1, 0, 1,
-0.3989413, 0.8200431, -0.1693646, 0.1215686, 1, 0, 1,
-0.3967222, 0.08560948, -1.623034, 0.1176471, 1, 0, 1,
-0.3959159, 1.992017, 0.6602823, 0.1098039, 1, 0, 1,
-0.3941, 0.4439537, -1.545939, 0.1058824, 1, 0, 1,
-0.3939963, 0.8175245, 0.4166689, 0.09803922, 1, 0, 1,
-0.3934992, 0.5385261, -0.7600985, 0.09019608, 1, 0, 1,
-0.3934719, -0.422956, -4.634806, 0.08627451, 1, 0, 1,
-0.3884981, -1.254406, -1.186793, 0.07843138, 1, 0, 1,
-0.3866906, -0.2835425, -3.376817, 0.07450981, 1, 0, 1,
-0.3851059, -0.1511896, -1.354436, 0.06666667, 1, 0, 1,
-0.3813856, 1.020468, -2.163363, 0.0627451, 1, 0, 1,
-0.3809235, -0.9883873, -2.021701, 0.05490196, 1, 0, 1,
-0.3781314, -0.2277504, -1.712102, 0.05098039, 1, 0, 1,
-0.3778693, -1.522578, -4.874581, 0.04313726, 1, 0, 1,
-0.3769845, -0.6233032, -2.954308, 0.03921569, 1, 0, 1,
-0.3743651, 0.5463735, -1.446723, 0.03137255, 1, 0, 1,
-0.373691, 0.5954834, 0.2864762, 0.02745098, 1, 0, 1,
-0.3731369, 0.8620471, -0.3345437, 0.01960784, 1, 0, 1,
-0.3704654, 0.7901114, -0.08656271, 0.01568628, 1, 0, 1,
-0.3688102, 0.1341935, -0.9878841, 0.007843138, 1, 0, 1,
-0.3680215, 0.2995023, -1.385485, 0.003921569, 1, 0, 1,
-0.3662195, -0.6561784, -1.724532, 0, 1, 0.003921569, 1,
-0.3565123, -0.01890048, -0.3216649, 0, 1, 0.01176471, 1,
-0.3497626, 1.027192, -0.2205275, 0, 1, 0.01568628, 1,
-0.347632, -0.5846987, -2.828224, 0, 1, 0.02352941, 1,
-0.3437993, -0.194158, -1.62786, 0, 1, 0.02745098, 1,
-0.3428017, 1.049238, -1.17235, 0, 1, 0.03529412, 1,
-0.3422036, 1.763956, -0.866398, 0, 1, 0.03921569, 1,
-0.3369203, 0.5617862, 0.3708642, 0, 1, 0.04705882, 1,
-0.3357273, 0.02619579, -3.35091, 0, 1, 0.05098039, 1,
-0.3332996, 0.2318105, -1.151998, 0, 1, 0.05882353, 1,
-0.332125, 0.4912823, -2.239161, 0, 1, 0.0627451, 1,
-0.3295143, 0.7096694, -1.285063, 0, 1, 0.07058824, 1,
-0.3273717, 1.226732, 0.24515, 0, 1, 0.07450981, 1,
-0.3235462, 0.4722831, -0.2060413, 0, 1, 0.08235294, 1,
-0.3226776, -0.7811052, -2.427873, 0, 1, 0.08627451, 1,
-0.3226738, 1.393522, -2.42599, 0, 1, 0.09411765, 1,
-0.3185659, -0.4314921, -4.294038, 0, 1, 0.1019608, 1,
-0.3171173, -0.06355713, -2.73815, 0, 1, 0.1058824, 1,
-0.3162562, 0.3598104, 0.7612531, 0, 1, 0.1137255, 1,
-0.3157467, -1.774851, -4.434961, 0, 1, 0.1176471, 1,
-0.3135986, -0.1618198, -2.83525, 0, 1, 0.1254902, 1,
-0.306672, 0.919554, 0.5078511, 0, 1, 0.1294118, 1,
-0.3051879, -0.03382492, -1.690686, 0, 1, 0.1372549, 1,
-0.3017487, -0.3354205, -2.348852, 0, 1, 0.1411765, 1,
-0.2961258, 0.8647546, -0.4158307, 0, 1, 0.1490196, 1,
-0.2957422, -1.001539, -2.894839, 0, 1, 0.1529412, 1,
-0.294273, 0.6690672, -2.101763, 0, 1, 0.1607843, 1,
-0.2937711, -0.191015, -0.8953404, 0, 1, 0.1647059, 1,
-0.2904949, -0.2178333, -1.488675, 0, 1, 0.172549, 1,
-0.2863106, 1.683725, -0.422243, 0, 1, 0.1764706, 1,
-0.286121, -0.2066925, -1.358379, 0, 1, 0.1843137, 1,
-0.2786373, -1.036041, -4.115215, 0, 1, 0.1882353, 1,
-0.2695161, -0.04681959, -1.228034, 0, 1, 0.1960784, 1,
-0.2687154, 2.012717, -1.233086, 0, 1, 0.2039216, 1,
-0.266223, -0.7678005, -4.279656, 0, 1, 0.2078431, 1,
-0.2648651, -0.2425346, -2.228092, 0, 1, 0.2156863, 1,
-0.2625098, 0.4852611, -1.11696, 0, 1, 0.2196078, 1,
-0.2623459, -0.5432987, -1.19177, 0, 1, 0.227451, 1,
-0.2592928, 0.4066724, -1.284205, 0, 1, 0.2313726, 1,
-0.2585354, -1.591051, -2.171406, 0, 1, 0.2392157, 1,
-0.2536486, -0.118818, -1.302158, 0, 1, 0.2431373, 1,
-0.2430659, 0.04110872, -1.299834, 0, 1, 0.2509804, 1,
-0.2402451, -2.054891, -2.525708, 0, 1, 0.254902, 1,
-0.2385114, 1.304007, -1.93177, 0, 1, 0.2627451, 1,
-0.2379566, 2.013992, 0.3494599, 0, 1, 0.2666667, 1,
-0.2361719, -0.6915091, -2.438983, 0, 1, 0.2745098, 1,
-0.2282166, 1.475208, -0.3988155, 0, 1, 0.2784314, 1,
-0.2194203, -0.6028534, -4.541782, 0, 1, 0.2862745, 1,
-0.212249, -0.291399, -3.644129, 0, 1, 0.2901961, 1,
-0.209163, -0.1182053, -1.759819, 0, 1, 0.2980392, 1,
-0.2067657, 1.099661, -0.4235108, 0, 1, 0.3058824, 1,
-0.2063212, -1.186901, -0.3236697, 0, 1, 0.3098039, 1,
-0.206245, 0.1849267, -1.391826, 0, 1, 0.3176471, 1,
-0.2033833, 0.1066975, -2.082434, 0, 1, 0.3215686, 1,
-0.2028292, -0.7811801, -3.301828, 0, 1, 0.3294118, 1,
-0.2004614, -0.02493773, -2.048992, 0, 1, 0.3333333, 1,
-0.1992914, -2.006891, -2.294676, 0, 1, 0.3411765, 1,
-0.1979447, 0.6589234, 1.038059, 0, 1, 0.345098, 1,
-0.1950867, -0.1352971, -1.982279, 0, 1, 0.3529412, 1,
-0.1945903, -1.075343, -3.756566, 0, 1, 0.3568628, 1,
-0.1929116, -1.329783, -5.02415, 0, 1, 0.3647059, 1,
-0.1910776, -0.9201496, -2.157838, 0, 1, 0.3686275, 1,
-0.1867464, -0.7631145, -1.887968, 0, 1, 0.3764706, 1,
-0.1846208, -0.1920167, -1.405926, 0, 1, 0.3803922, 1,
-0.1797984, 0.6870751, -0.2631193, 0, 1, 0.3882353, 1,
-0.1787166, -0.397939, -1.104385, 0, 1, 0.3921569, 1,
-0.1779332, 0.1250591, -1.144354, 0, 1, 0.4, 1,
-0.1735475, -0.2754201, -1.425613, 0, 1, 0.4078431, 1,
-0.1721359, -2.945332, -4.729127, 0, 1, 0.4117647, 1,
-0.1720501, -2.938802, -4.78233, 0, 1, 0.4196078, 1,
-0.1673736, 0.7873578, -0.02919088, 0, 1, 0.4235294, 1,
-0.1640071, 1.2937, -0.84378, 0, 1, 0.4313726, 1,
-0.1638351, -0.3440414, -2.330791, 0, 1, 0.4352941, 1,
-0.1620222, 0.1407823, -0.2747647, 0, 1, 0.4431373, 1,
-0.1609237, 1.032648, -0.8905483, 0, 1, 0.4470588, 1,
-0.1534234, -0.1618179, -3.436699, 0, 1, 0.454902, 1,
-0.1421277, -0.124134, -1.948173, 0, 1, 0.4588235, 1,
-0.1388037, 0.1887384, -0.819461, 0, 1, 0.4666667, 1,
-0.1376905, 1.402199, 1.472699, 0, 1, 0.4705882, 1,
-0.134813, 0.3939513, -0.7173572, 0, 1, 0.4784314, 1,
-0.1340138, -1.081796, -3.127073, 0, 1, 0.4823529, 1,
-0.1314061, -0.1788653, -2.498965, 0, 1, 0.4901961, 1,
-0.1274353, 1.359318, -0.4309115, 0, 1, 0.4941176, 1,
-0.1250297, 1.93897, -0.7903738, 0, 1, 0.5019608, 1,
-0.1249242, -0.5924333, -4.225462, 0, 1, 0.509804, 1,
-0.1199953, 0.8608007, -0.6906711, 0, 1, 0.5137255, 1,
-0.1183358, 1.15022, -2.063669, 0, 1, 0.5215687, 1,
-0.118107, 1.86823, 1.015987, 0, 1, 0.5254902, 1,
-0.1178792, -0.728813, -2.875356, 0, 1, 0.5333334, 1,
-0.1153536, 1.110667, -0.3098679, 0, 1, 0.5372549, 1,
-0.1129578, 0.3920448, -0.2392789, 0, 1, 0.5450981, 1,
-0.1122062, -0.1028506, -1.42064, 0, 1, 0.5490196, 1,
-0.1085947, 1.423518, 0.7513037, 0, 1, 0.5568628, 1,
-0.1082914, -0.3849366, -3.070698, 0, 1, 0.5607843, 1,
-0.1067177, -0.5253939, -3.415553, 0, 1, 0.5686275, 1,
-0.1064449, -0.6198022, -3.27553, 0, 1, 0.572549, 1,
-0.1049211, 0.2654621, -0.06883219, 0, 1, 0.5803922, 1,
-0.1026046, 2.381412, 0.02269123, 0, 1, 0.5843138, 1,
-0.1017895, 0.06184879, -0.5820457, 0, 1, 0.5921569, 1,
-0.1004797, -0.06690091, -2.874325, 0, 1, 0.5960785, 1,
-0.09328625, 0.7182547, -0.2693884, 0, 1, 0.6039216, 1,
-0.0892248, 0.1599296, 0.2495067, 0, 1, 0.6117647, 1,
-0.08827081, -0.838064, -2.932815, 0, 1, 0.6156863, 1,
-0.08658806, 0.194123, -1.338398, 0, 1, 0.6235294, 1,
-0.08527964, -0.2231433, -3.23008, 0, 1, 0.627451, 1,
-0.07782175, 0.3861258, -1.387942, 0, 1, 0.6352941, 1,
-0.07662632, -0.6087611, -2.374665, 0, 1, 0.6392157, 1,
-0.07479724, -0.9365287, -4.003318, 0, 1, 0.6470588, 1,
-0.07463266, 0.7540273, 0.2956356, 0, 1, 0.6509804, 1,
-0.0738276, 0.2135487, -0.4150931, 0, 1, 0.6588235, 1,
-0.0726447, -0.7643374, -1.681816, 0, 1, 0.6627451, 1,
-0.07220427, -1.34556, -3.475436, 0, 1, 0.6705883, 1,
-0.07080936, 1.299045, -0.6064782, 0, 1, 0.6745098, 1,
-0.06945986, 1.029194, 0.1083805, 0, 1, 0.682353, 1,
-0.06668232, -1.269566, -3.373427, 0, 1, 0.6862745, 1,
-0.06521162, 0.8509714, -0.6475638, 0, 1, 0.6941177, 1,
-0.06362033, 1.669266, 0.2393873, 0, 1, 0.7019608, 1,
-0.05957265, 0.4081178, 0.03588369, 0, 1, 0.7058824, 1,
-0.05913045, -1.061545, -2.566344, 0, 1, 0.7137255, 1,
-0.05904593, 0.9261717, 1.014298, 0, 1, 0.7176471, 1,
-0.05895826, 0.713048, -0.03090285, 0, 1, 0.7254902, 1,
-0.05882629, -0.7256145, -3.630799, 0, 1, 0.7294118, 1,
-0.05871902, -1.3829, -3.590708, 0, 1, 0.7372549, 1,
-0.05779979, 0.6147234, 0.1502131, 0, 1, 0.7411765, 1,
-0.0502721, -1.282451, -3.298954, 0, 1, 0.7490196, 1,
-0.04932922, 0.9596121, -0.580719, 0, 1, 0.7529412, 1,
-0.04828741, -0.548824, -4.983946, 0, 1, 0.7607843, 1,
-0.04737055, 1.813925, -0.4135551, 0, 1, 0.7647059, 1,
-0.04538597, 0.2963309, -0.1709459, 0, 1, 0.772549, 1,
-0.04470964, 0.3313313, -1.748746, 0, 1, 0.7764706, 1,
-0.04313274, -0.735179, -3.253929, 0, 1, 0.7843137, 1,
-0.04190995, 0.7775146, -1.818807, 0, 1, 0.7882353, 1,
-0.04088138, 1.885714, -0.1109296, 0, 1, 0.7960784, 1,
-0.03955267, -0.1754351, -3.013163, 0, 1, 0.8039216, 1,
-0.03874583, 1.047346, -0.9109555, 0, 1, 0.8078431, 1,
-0.03807588, -0.8014284, -3.313485, 0, 1, 0.8156863, 1,
-0.02663874, 1.265308, 0.3884948, 0, 1, 0.8196079, 1,
-0.02319233, -0.9041479, -3.623531, 0, 1, 0.827451, 1,
-0.02261056, 0.5253736, 0.08175071, 0, 1, 0.8313726, 1,
-0.02226347, -0.666488, -3.70617, 0, 1, 0.8392157, 1,
-0.01387734, 0.8713171, -2.22918, 0, 1, 0.8431373, 1,
-0.01312551, -1.81827, -3.806764, 0, 1, 0.8509804, 1,
-0.006134965, -0.01626413, -4.039806, 0, 1, 0.854902, 1,
-0.003926736, 0.6796822, 0.1270187, 0, 1, 0.8627451, 1,
-0.003092354, -0.9102053, -4.263528, 0, 1, 0.8666667, 1,
-0.002891517, -0.1593418, -2.346904, 0, 1, 0.8745098, 1,
-0.002283984, -1.078897, -4.252157, 0, 1, 0.8784314, 1,
-0.0005678549, -0.06056567, -3.863673, 0, 1, 0.8862745, 1,
0.004928003, 0.09779128, 0.3941419, 0, 1, 0.8901961, 1,
0.005850923, 1.10034, 0.7707227, 0, 1, 0.8980392, 1,
0.007413261, -0.5872395, 2.936034, 0, 1, 0.9058824, 1,
0.007934545, 0.6147408, 1.111116, 0, 1, 0.9098039, 1,
0.01266829, -1.001117, 2.711433, 0, 1, 0.9176471, 1,
0.01509807, -1.101924, 3.536636, 0, 1, 0.9215686, 1,
0.0163755, -1.067313, 3.20018, 0, 1, 0.9294118, 1,
0.02045171, -0.07437343, 3.195487, 0, 1, 0.9333333, 1,
0.02173634, -1.437498, 1.196429, 0, 1, 0.9411765, 1,
0.0224119, 0.5682821, 0.2692036, 0, 1, 0.945098, 1,
0.02582043, -0.5301974, 5.524293, 0, 1, 0.9529412, 1,
0.02839257, -0.2650861, 4.250211, 0, 1, 0.9568627, 1,
0.03289835, -2.146464, 1.263695, 0, 1, 0.9647059, 1,
0.03511862, 0.3831434, 1.009634, 0, 1, 0.9686275, 1,
0.03730617, 0.6099517, 1.705148, 0, 1, 0.9764706, 1,
0.04039524, 0.4085429, 0.2235977, 0, 1, 0.9803922, 1,
0.0417517, 0.4964068, -1.136829, 0, 1, 0.9882353, 1,
0.04518814, -0.102505, 2.083086, 0, 1, 0.9921569, 1,
0.04726943, -0.3944637, 2.910475, 0, 1, 1, 1,
0.04796553, 0.6605831, -1.176026, 0, 0.9921569, 1, 1,
0.04966528, 0.744378, -1.183368, 0, 0.9882353, 1, 1,
0.05264811, 0.2987608, 0.7507387, 0, 0.9803922, 1, 1,
0.05273392, -0.3350433, 3.725194, 0, 0.9764706, 1, 1,
0.05445765, -0.02628156, 1.8442, 0, 0.9686275, 1, 1,
0.05636254, -0.1387273, 4.322836, 0, 0.9647059, 1, 1,
0.05831443, 1.649395, -2.307685, 0, 0.9568627, 1, 1,
0.05886404, 0.8258664, -1.514033, 0, 0.9529412, 1, 1,
0.06607246, 0.15351, 0.9944153, 0, 0.945098, 1, 1,
0.0666219, -0.6888368, 3.148278, 0, 0.9411765, 1, 1,
0.0716746, -0.5415735, 2.952075, 0, 0.9333333, 1, 1,
0.08556854, 1.152226, 2.133089, 0, 0.9294118, 1, 1,
0.08602837, -0.252357, 2.040994, 0, 0.9215686, 1, 1,
0.08884446, -0.3450574, 2.073605, 0, 0.9176471, 1, 1,
0.09085386, -0.5680708, 1.776811, 0, 0.9098039, 1, 1,
0.09161938, -1.348626, 1.9738, 0, 0.9058824, 1, 1,
0.09327774, 0.106857, 1.95723, 0, 0.8980392, 1, 1,
0.09741247, 0.8169208, 0.4686158, 0, 0.8901961, 1, 1,
0.104164, 1.313133, -0.5719063, 0, 0.8862745, 1, 1,
0.1048503, -2.182303, 3.412232, 0, 0.8784314, 1, 1,
0.1057737, 0.05636989, 2.107882, 0, 0.8745098, 1, 1,
0.1076669, 1.327877, 0.2971357, 0, 0.8666667, 1, 1,
0.1101422, -1.262754, 3.715484, 0, 0.8627451, 1, 1,
0.1102947, -1.620949, 3.071103, 0, 0.854902, 1, 1,
0.1197286, -1.004596, 3.53755, 0, 0.8509804, 1, 1,
0.1201483, -0.2590962, 3.369973, 0, 0.8431373, 1, 1,
0.1229436, 0.8341196, 0.8331757, 0, 0.8392157, 1, 1,
0.1236676, 0.4269518, 1.665235, 0, 0.8313726, 1, 1,
0.126535, -0.8144299, 2.240813, 0, 0.827451, 1, 1,
0.1284098, -1.291855, 1.163862, 0, 0.8196079, 1, 1,
0.1312408, -0.3890664, 4.262269, 0, 0.8156863, 1, 1,
0.1328309, -1.292639, 3.439764, 0, 0.8078431, 1, 1,
0.1344819, 0.6854042, -0.1501215, 0, 0.8039216, 1, 1,
0.1408641, -0.3552538, 4.145732, 0, 0.7960784, 1, 1,
0.1464493, 0.661842, 0.3825394, 0, 0.7882353, 1, 1,
0.1483888, 0.1644351, 1.055533, 0, 0.7843137, 1, 1,
0.1507594, -0.833183, 2.177065, 0, 0.7764706, 1, 1,
0.1547925, 1.596267, 1.974516, 0, 0.772549, 1, 1,
0.1562065, -1.012727, 3.612695, 0, 0.7647059, 1, 1,
0.1611851, 1.216031, -0.4579273, 0, 0.7607843, 1, 1,
0.1657856, -0.6528134, 2.960501, 0, 0.7529412, 1, 1,
0.1714648, 0.7745557, 1.392532, 0, 0.7490196, 1, 1,
0.1715877, -0.3707688, 4.110721, 0, 0.7411765, 1, 1,
0.1732906, 0.5306309, 0.7340338, 0, 0.7372549, 1, 1,
0.1767429, -1.281947, 4.672688, 0, 0.7294118, 1, 1,
0.1767772, 0.9070628, 0.808719, 0, 0.7254902, 1, 1,
0.1809979, -0.7461429, 1.860573, 0, 0.7176471, 1, 1,
0.1821597, -0.884598, 2.618086, 0, 0.7137255, 1, 1,
0.1841747, 0.8687031, 0.7722964, 0, 0.7058824, 1, 1,
0.1842516, 0.01290447, 2.198122, 0, 0.6980392, 1, 1,
0.1847832, -0.9662606, 4.119198, 0, 0.6941177, 1, 1,
0.1957132, -0.6729493, 2.664621, 0, 0.6862745, 1, 1,
0.1962537, -0.2245098, 1.893829, 0, 0.682353, 1, 1,
0.1967673, 1.168628, -0.0697863, 0, 0.6745098, 1, 1,
0.1992713, -0.8139018, 1.573829, 0, 0.6705883, 1, 1,
0.1999559, 0.9880853, 0.6765208, 0, 0.6627451, 1, 1,
0.2003853, -1.118048, 2.319574, 0, 0.6588235, 1, 1,
0.2009842, -0.2459526, 2.941708, 0, 0.6509804, 1, 1,
0.2051101, -1.200796, 0.8525167, 0, 0.6470588, 1, 1,
0.2063854, 0.8679399, 0.5514863, 0, 0.6392157, 1, 1,
0.2074438, -0.4131333, 1.475541, 0, 0.6352941, 1, 1,
0.2094988, -1.025999, 3.644481, 0, 0.627451, 1, 1,
0.210894, -1.55438, 2.853054, 0, 0.6235294, 1, 1,
0.2111617, -1.011804, 3.313406, 0, 0.6156863, 1, 1,
0.2122947, -0.4455925, 3.91017, 0, 0.6117647, 1, 1,
0.2123559, 0.005371803, 3.165334, 0, 0.6039216, 1, 1,
0.2146071, 0.6000928, -0.3894936, 0, 0.5960785, 1, 1,
0.2147343, -0.7536745, 1.19827, 0, 0.5921569, 1, 1,
0.216319, 0.3268248, 0.8770574, 0, 0.5843138, 1, 1,
0.2179071, -0.2510355, 2.138637, 0, 0.5803922, 1, 1,
0.2199922, 0.04705015, 1.453987, 0, 0.572549, 1, 1,
0.220433, 0.8364938, 0.06903376, 0, 0.5686275, 1, 1,
0.222239, -0.4087649, 2.399413, 0, 0.5607843, 1, 1,
0.2283287, 0.3810404, -0.7991354, 0, 0.5568628, 1, 1,
0.2300783, -0.9055659, 4.106181, 0, 0.5490196, 1, 1,
0.2353922, 0.2500145, 1.861278, 0, 0.5450981, 1, 1,
0.239062, 1.68631, 0.2928434, 0, 0.5372549, 1, 1,
0.2442271, 0.1220698, 0.998941, 0, 0.5333334, 1, 1,
0.2477794, -0.6189127, 4.085806, 0, 0.5254902, 1, 1,
0.2477977, 0.006630181, 2.415173, 0, 0.5215687, 1, 1,
0.2495491, 0.8288094, 0.3291587, 0, 0.5137255, 1, 1,
0.2495747, -0.3692738, 3.623855, 0, 0.509804, 1, 1,
0.2510361, 0.4498625, -1.576131, 0, 0.5019608, 1, 1,
0.2515413, 1.814333, 2.091904, 0, 0.4941176, 1, 1,
0.2551219, 0.7031411, 1.541861, 0, 0.4901961, 1, 1,
0.2562831, -1.085208, 4.337108, 0, 0.4823529, 1, 1,
0.2564768, -0.3027989, 1.61891, 0, 0.4784314, 1, 1,
0.2575163, -0.2141487, 3.884136, 0, 0.4705882, 1, 1,
0.258808, 0.6425577, 0.4368462, 0, 0.4666667, 1, 1,
0.2615651, -2.134, 2.339333, 0, 0.4588235, 1, 1,
0.2643293, -0.7958779, 1.774434, 0, 0.454902, 1, 1,
0.2666547, -1.628945, 3.147009, 0, 0.4470588, 1, 1,
0.2671525, -1.562488, 1.556531, 0, 0.4431373, 1, 1,
0.2688723, -0.01732465, 3.32469, 0, 0.4352941, 1, 1,
0.2708955, 0.5857543, 0.644742, 0, 0.4313726, 1, 1,
0.2720648, 0.04906134, -1.177956, 0, 0.4235294, 1, 1,
0.2751985, -1.314079, 3.029913, 0, 0.4196078, 1, 1,
0.2759737, -2.160661, 2.677059, 0, 0.4117647, 1, 1,
0.2781372, 0.7879826, -1.144532, 0, 0.4078431, 1, 1,
0.2818115, -0.4648768, 2.456291, 0, 0.4, 1, 1,
0.2823598, 1.101708, -0.8050861, 0, 0.3921569, 1, 1,
0.2828229, -0.5483406, 4.411162, 0, 0.3882353, 1, 1,
0.2850414, 0.9299669, 1.595163, 0, 0.3803922, 1, 1,
0.2915917, -1.061117, 1.779169, 0, 0.3764706, 1, 1,
0.2999958, 0.324245, 1.16571, 0, 0.3686275, 1, 1,
0.3046328, 0.5892791, 1.580859, 0, 0.3647059, 1, 1,
0.3050165, 0.4655253, 0.6309505, 0, 0.3568628, 1, 1,
0.3077179, 0.510325, -0.5418949, 0, 0.3529412, 1, 1,
0.3087555, 0.02022757, 1.596736, 0, 0.345098, 1, 1,
0.313155, 0.901139, 2.88958, 0, 0.3411765, 1, 1,
0.317046, 1.708767, -0.3082128, 0, 0.3333333, 1, 1,
0.3221807, -0.8244954, 1.224717, 0, 0.3294118, 1, 1,
0.3238682, -0.9915307, 1.424928, 0, 0.3215686, 1, 1,
0.3246807, 1.713298, 0.2278655, 0, 0.3176471, 1, 1,
0.3289292, -0.9252533, 2.045924, 0, 0.3098039, 1, 1,
0.3298483, -0.2823666, 2.404608, 0, 0.3058824, 1, 1,
0.3318399, 1.09559, 0.7637506, 0, 0.2980392, 1, 1,
0.3358538, 0.08688752, 1.024121, 0, 0.2901961, 1, 1,
0.3364913, -0.09606016, 1.61273, 0, 0.2862745, 1, 1,
0.3381644, -2.039615, 1.95113, 0, 0.2784314, 1, 1,
0.339721, -0.375676, 3.25054, 0, 0.2745098, 1, 1,
0.3462521, -0.4210608, 2.65179, 0, 0.2666667, 1, 1,
0.349061, 1.006847, 1.562529, 0, 0.2627451, 1, 1,
0.3504292, 0.8931477, 0.2363133, 0, 0.254902, 1, 1,
0.3518431, 0.5838853, 1.113653, 0, 0.2509804, 1, 1,
0.3531131, 0.08009978, 0.9474362, 0, 0.2431373, 1, 1,
0.3551438, -0.1769712, 1.530654, 0, 0.2392157, 1, 1,
0.3569074, -0.9312457, 2.314488, 0, 0.2313726, 1, 1,
0.357364, 2.792269, -0.8715171, 0, 0.227451, 1, 1,
0.3648923, 0.4088471, -0.09106342, 0, 0.2196078, 1, 1,
0.3701515, 1.168405, 1.319797, 0, 0.2156863, 1, 1,
0.3703176, 0.9853023, -0.9361507, 0, 0.2078431, 1, 1,
0.3710447, 0.09825607, 0.5331819, 0, 0.2039216, 1, 1,
0.3763838, 1.328861, -0.2488836, 0, 0.1960784, 1, 1,
0.3846498, 0.6476089, 0.9847003, 0, 0.1882353, 1, 1,
0.3851421, -1.839129, 3.470277, 0, 0.1843137, 1, 1,
0.3858086, 0.5556666, 1.404875, 0, 0.1764706, 1, 1,
0.3873803, -1.743861, 2.912011, 0, 0.172549, 1, 1,
0.3887211, 0.8866462, 1.535477, 0, 0.1647059, 1, 1,
0.3892929, 2.183471, 1.310791, 0, 0.1607843, 1, 1,
0.3898866, -0.6288266, 1.146816, 0, 0.1529412, 1, 1,
0.3930937, 1.468952, -0.4554153, 0, 0.1490196, 1, 1,
0.395688, 0.8696503, -1.579367, 0, 0.1411765, 1, 1,
0.3965493, 1.138885, 0.2915892, 0, 0.1372549, 1, 1,
0.3987858, -0.4181353, 2.588419, 0, 0.1294118, 1, 1,
0.400773, -0.5938985, 3.179026, 0, 0.1254902, 1, 1,
0.4012075, 0.02619114, 0.6763967, 0, 0.1176471, 1, 1,
0.4031755, -1.765629, 2.625386, 0, 0.1137255, 1, 1,
0.4063718, -0.5751128, 2.696789, 0, 0.1058824, 1, 1,
0.4078538, 0.1137694, 1.974343, 0, 0.09803922, 1, 1,
0.4099102, 0.3185303, 1.113532, 0, 0.09411765, 1, 1,
0.4114338, -0.005190867, 0.9590662, 0, 0.08627451, 1, 1,
0.4127048, 0.2644776, 0.6387188, 0, 0.08235294, 1, 1,
0.4127872, 0.7064838, 0.553126, 0, 0.07450981, 1, 1,
0.4349543, 0.6588526, 0.7897531, 0, 0.07058824, 1, 1,
0.4362611, -0.9213732, 3.414002, 0, 0.0627451, 1, 1,
0.4369099, -0.6104091, 3.931627, 0, 0.05882353, 1, 1,
0.4375331, -0.3388518, 1.813798, 0, 0.05098039, 1, 1,
0.4385885, 0.3773778, 0.976558, 0, 0.04705882, 1, 1,
0.4396669, -0.1689682, 1.320693, 0, 0.03921569, 1, 1,
0.4414879, -0.7055169, 2.147571, 0, 0.03529412, 1, 1,
0.4436736, -0.4272079, 2.642242, 0, 0.02745098, 1, 1,
0.4448583, 0.3160073, 1.480116, 0, 0.02352941, 1, 1,
0.4463795, -0.7043648, 2.994383, 0, 0.01568628, 1, 1,
0.4483454, -0.930425, 4.521513, 0, 0.01176471, 1, 1,
0.4488154, -2.450489, 3.355895, 0, 0.003921569, 1, 1,
0.4515456, -1.771921, 2.481863, 0.003921569, 0, 1, 1,
0.4544615, 0.5346013, -0.06796503, 0.007843138, 0, 1, 1,
0.4551241, -0.2770254, 2.427729, 0.01568628, 0, 1, 1,
0.457731, 0.3378878, 0.8411297, 0.01960784, 0, 1, 1,
0.4679149, 1.203034, -0.3280457, 0.02745098, 0, 1, 1,
0.4816621, 0.5173211, 0.4835701, 0.03137255, 0, 1, 1,
0.4874426, 0.1300461, 2.716952, 0.03921569, 0, 1, 1,
0.4896923, -0.6847996, 2.445736, 0.04313726, 0, 1, 1,
0.4912865, 1.203462, 1.345535, 0.05098039, 0, 1, 1,
0.4988245, 0.6381881, 1.602001, 0.05490196, 0, 1, 1,
0.4993942, 0.0951013, 1.540027, 0.0627451, 0, 1, 1,
0.4997505, 0.7768053, 0.211098, 0.06666667, 0, 1, 1,
0.5010574, -0.09987433, 1.157172, 0.07450981, 0, 1, 1,
0.5019374, -1.468673, 2.884695, 0.07843138, 0, 1, 1,
0.5025955, -0.8855868, 2.08673, 0.08627451, 0, 1, 1,
0.5046601, -0.7247858, 1.913407, 0.09019608, 0, 1, 1,
0.5072655, 1.370739, 1.212868, 0.09803922, 0, 1, 1,
0.5085553, -1.867485, 2.386635, 0.1058824, 0, 1, 1,
0.5101218, -0.7994412, 3.420579, 0.1098039, 0, 1, 1,
0.5139199, 0.9722187, 0.07630394, 0.1176471, 0, 1, 1,
0.5166665, -0.6932105, 2.790483, 0.1215686, 0, 1, 1,
0.5229811, 1.002862, -0.9836777, 0.1294118, 0, 1, 1,
0.5244117, 1.395853, 2.001534, 0.1333333, 0, 1, 1,
0.5300496, -1.092721, 2.214276, 0.1411765, 0, 1, 1,
0.5300661, -1.146095, 0.4017592, 0.145098, 0, 1, 1,
0.5325838, 0.03685045, 1.546508, 0.1529412, 0, 1, 1,
0.537024, -3.290824, 4.217022, 0.1568628, 0, 1, 1,
0.5399247, -0.2692529, 2.10953, 0.1647059, 0, 1, 1,
0.5415157, -0.5218777, 1.354437, 0.1686275, 0, 1, 1,
0.5446154, 0.1963979, 0.1890375, 0.1764706, 0, 1, 1,
0.5460054, -0.6165616, 2.179586, 0.1803922, 0, 1, 1,
0.5525922, -1.156918, 2.866463, 0.1882353, 0, 1, 1,
0.5602283, -0.6742041, 0.772764, 0.1921569, 0, 1, 1,
0.5610417, -1.329, 2.71947, 0.2, 0, 1, 1,
0.5618983, -0.6284163, 2.406973, 0.2078431, 0, 1, 1,
0.5655305, -1.518865, 3.469679, 0.2117647, 0, 1, 1,
0.5669066, 0.1065671, 1.455923, 0.2196078, 0, 1, 1,
0.5672514, 1.008192, -0.05007005, 0.2235294, 0, 1, 1,
0.5685878, 1.124378, -0.3545696, 0.2313726, 0, 1, 1,
0.5704093, 1.521063, 1.710948, 0.2352941, 0, 1, 1,
0.5723224, -1.991529, 1.894565, 0.2431373, 0, 1, 1,
0.5727234, -1.537533, 1.934063, 0.2470588, 0, 1, 1,
0.5767165, -1.149684, 1.128868, 0.254902, 0, 1, 1,
0.5831941, -0.1566129, 2.484657, 0.2588235, 0, 1, 1,
0.5840878, -1.916047, 1.749997, 0.2666667, 0, 1, 1,
0.5901209, -1.477383, 3.026777, 0.2705882, 0, 1, 1,
0.5935987, -0.3861128, 2.114816, 0.2784314, 0, 1, 1,
0.5962389, -0.3573841, 3.889722, 0.282353, 0, 1, 1,
0.5985881, -1.146779, 3.640394, 0.2901961, 0, 1, 1,
0.599049, -0.9558868, 1.814356, 0.2941177, 0, 1, 1,
0.5997005, 1.302552, 0.6616093, 0.3019608, 0, 1, 1,
0.6023992, 0.5332852, -0.286424, 0.3098039, 0, 1, 1,
0.602979, 0.3889905, 1.84051, 0.3137255, 0, 1, 1,
0.6054959, 0.6517013, 0.2482478, 0.3215686, 0, 1, 1,
0.6060105, 2.154485, 1.723175, 0.3254902, 0, 1, 1,
0.6094015, -0.4573907, 3.290021, 0.3333333, 0, 1, 1,
0.611401, -2.657215, 4.540485, 0.3372549, 0, 1, 1,
0.6152928, -0.27632, 3.346197, 0.345098, 0, 1, 1,
0.6154277, -0.666735, 2.679035, 0.3490196, 0, 1, 1,
0.6160737, 0.03974007, -0.1312839, 0.3568628, 0, 1, 1,
0.628129, -1.078631, 2.935842, 0.3607843, 0, 1, 1,
0.6283737, -0.4606686, 1.952975, 0.3686275, 0, 1, 1,
0.6310666, -1.320526, 1.62314, 0.372549, 0, 1, 1,
0.6401405, 1.246152, -0.9360009, 0.3803922, 0, 1, 1,
0.6406482, 1.242905, 2.246957, 0.3843137, 0, 1, 1,
0.6479946, -0.884535, 2.853672, 0.3921569, 0, 1, 1,
0.6595621, -0.1158686, 1.566751, 0.3960784, 0, 1, 1,
0.6598705, 0.08457018, 0.6869024, 0.4039216, 0, 1, 1,
0.6624203, -0.8905258, 4.134224, 0.4117647, 0, 1, 1,
0.6678431, -0.9182206, 3.035266, 0.4156863, 0, 1, 1,
0.6685518, 1.683832, -0.4699001, 0.4235294, 0, 1, 1,
0.6710242, -0.3919338, 2.996629, 0.427451, 0, 1, 1,
0.6712824, -0.291929, 2.297508, 0.4352941, 0, 1, 1,
0.6718286, -0.9083818, 2.173413, 0.4392157, 0, 1, 1,
0.6768216, -0.03578129, 2.169541, 0.4470588, 0, 1, 1,
0.6784512, 0.7728379, 2.504309, 0.4509804, 0, 1, 1,
0.6824248, -2.549809, 3.221726, 0.4588235, 0, 1, 1,
0.6843874, 0.4049945, -0.0297604, 0.4627451, 0, 1, 1,
0.6934069, 0.3981219, 0.7113975, 0.4705882, 0, 1, 1,
0.6969379, -0.882268, 3.178522, 0.4745098, 0, 1, 1,
0.6984141, -0.4236454, 2.099076, 0.4823529, 0, 1, 1,
0.7039499, 0.5774474, -0.1209783, 0.4862745, 0, 1, 1,
0.7044955, 0.7582169, 1.973245, 0.4941176, 0, 1, 1,
0.7050974, -0.7936351, 2.558459, 0.5019608, 0, 1, 1,
0.7091794, 0.9875026, 2.383362, 0.5058824, 0, 1, 1,
0.7130265, -0.5863064, 1.53759, 0.5137255, 0, 1, 1,
0.7148184, -0.06559316, 1.254076, 0.5176471, 0, 1, 1,
0.7219533, 0.322264, 1.29502, 0.5254902, 0, 1, 1,
0.7226766, -1.787404, 2.203846, 0.5294118, 0, 1, 1,
0.7231967, 1.099234, -0.2419134, 0.5372549, 0, 1, 1,
0.7245539, 0.7786582, 0.4895971, 0.5411765, 0, 1, 1,
0.7248314, -0.3291707, 2.19948, 0.5490196, 0, 1, 1,
0.7249441, 1.752226, 0.7706194, 0.5529412, 0, 1, 1,
0.7320608, 0.1989036, 1.568483, 0.5607843, 0, 1, 1,
0.733613, 0.8171099, -0.06483473, 0.5647059, 0, 1, 1,
0.7375979, -0.9185694, 2.822937, 0.572549, 0, 1, 1,
0.7382072, -0.5043383, 2.128039, 0.5764706, 0, 1, 1,
0.7395546, -0.3093669, 2.139539, 0.5843138, 0, 1, 1,
0.7417747, 0.534738, 1.295681, 0.5882353, 0, 1, 1,
0.7483653, 1.47667, -0.5299936, 0.5960785, 0, 1, 1,
0.7552006, -1.323712, 1.844837, 0.6039216, 0, 1, 1,
0.7590498, -2.085676, 2.853302, 0.6078432, 0, 1, 1,
0.7634232, -1.423416, 3.198306, 0.6156863, 0, 1, 1,
0.7643943, 0.9936796, 0.6414097, 0.6196079, 0, 1, 1,
0.7679817, -0.7549872, 2.402981, 0.627451, 0, 1, 1,
0.770817, 0.01093091, 1.623305, 0.6313726, 0, 1, 1,
0.7721064, -0.05729005, -0.1974376, 0.6392157, 0, 1, 1,
0.7724181, 1.81629, -0.3321678, 0.6431373, 0, 1, 1,
0.773747, 0.6821948, 3.041077, 0.6509804, 0, 1, 1,
0.7792677, 0.3106385, 1.331006, 0.654902, 0, 1, 1,
0.7813696, 1.319994, 0.8291269, 0.6627451, 0, 1, 1,
0.7833866, 1.350378, -0.4075721, 0.6666667, 0, 1, 1,
0.7850738, -0.03741577, 1.712902, 0.6745098, 0, 1, 1,
0.7889793, 1.445468, -0.1743353, 0.6784314, 0, 1, 1,
0.7902386, -0.3080403, 4.089363, 0.6862745, 0, 1, 1,
0.7971326, -0.690532, 1.927491, 0.6901961, 0, 1, 1,
0.7978034, 0.03940735, 2.468862, 0.6980392, 0, 1, 1,
0.8017896, -1.780673, 3.997349, 0.7058824, 0, 1, 1,
0.8106277, -0.1115247, 0.8825811, 0.7098039, 0, 1, 1,
0.8132576, -2.660919, 3.390842, 0.7176471, 0, 1, 1,
0.8163424, 0.5012633, 0.7321783, 0.7215686, 0, 1, 1,
0.8211775, -0.07139848, 0.2644779, 0.7294118, 0, 1, 1,
0.8219267, 0.7157194, -0.0468864, 0.7333333, 0, 1, 1,
0.8226845, 0.4810674, 1.450844, 0.7411765, 0, 1, 1,
0.8231368, 0.2668974, 2.534253, 0.7450981, 0, 1, 1,
0.823315, -0.4891018, 2.938948, 0.7529412, 0, 1, 1,
0.8238136, 0.2002263, 0.3247816, 0.7568628, 0, 1, 1,
0.8261415, 1.106455, 1.092756, 0.7647059, 0, 1, 1,
0.8292844, -0.327743, 1.932771, 0.7686275, 0, 1, 1,
0.8416301, 0.6624169, 2.070313, 0.7764706, 0, 1, 1,
0.8469312, -0.409625, 1.54649, 0.7803922, 0, 1, 1,
0.8520557, -0.3388946, 0.9032639, 0.7882353, 0, 1, 1,
0.8556536, 0.4659978, 0.5257067, 0.7921569, 0, 1, 1,
0.8593643, -1.335802, 2.643784, 0.8, 0, 1, 1,
0.8642522, 0.5922061, 0.2747678, 0.8078431, 0, 1, 1,
0.8663561, -0.3746591, 1.303128, 0.8117647, 0, 1, 1,
0.8750802, 1.511062, -0.8202084, 0.8196079, 0, 1, 1,
0.8798264, -0.2182368, 0.8599142, 0.8235294, 0, 1, 1,
0.8830364, -0.6467202, 2.163465, 0.8313726, 0, 1, 1,
0.8901352, 0.05810121, 0.8834396, 0.8352941, 0, 1, 1,
0.9060522, -0.5626363, 1.588262, 0.8431373, 0, 1, 1,
0.9136009, -0.2169366, 1.000342, 0.8470588, 0, 1, 1,
0.9145254, 1.002829, 0.1471992, 0.854902, 0, 1, 1,
0.9212982, -0.739044, 0.4466398, 0.8588235, 0, 1, 1,
0.9217021, 1.417947, 1.520738, 0.8666667, 0, 1, 1,
0.9219156, 0.6182638, 0.8221806, 0.8705882, 0, 1, 1,
0.9244637, 1.114837, 1.073446, 0.8784314, 0, 1, 1,
0.9274518, -1.792791, 1.874218, 0.8823529, 0, 1, 1,
0.928326, -0.5966086, 3.07732, 0.8901961, 0, 1, 1,
0.9284795, -0.1339173, 2.491987, 0.8941177, 0, 1, 1,
0.9286236, 0.7769321, 0.9968027, 0.9019608, 0, 1, 1,
0.9305265, 0.1049876, 1.579473, 0.9098039, 0, 1, 1,
0.9311414, -0.1557131, 0.4015539, 0.9137255, 0, 1, 1,
0.9363503, 0.2163072, 1.959117, 0.9215686, 0, 1, 1,
0.944037, -1.205315, 1.26424, 0.9254902, 0, 1, 1,
0.9443669, -1.079011, 3.299678, 0.9333333, 0, 1, 1,
0.947868, 0.1836116, 1.755123, 0.9372549, 0, 1, 1,
0.951573, -1.42166, 2.37168, 0.945098, 0, 1, 1,
0.9551255, 1.4137, 0.3209615, 0.9490196, 0, 1, 1,
0.9593698, 1.095264, 2.018975, 0.9568627, 0, 1, 1,
0.963782, -0.4445082, 2.243121, 0.9607843, 0, 1, 1,
0.9638953, -1.069678, 3.528258, 0.9686275, 0, 1, 1,
0.978534, 1.965874, 1.71698, 0.972549, 0, 1, 1,
0.9826151, -2.240142, 4.884628, 0.9803922, 0, 1, 1,
0.9857561, -0.1288707, 2.153236, 0.9843137, 0, 1, 1,
0.9926548, 0.3640762, 1.777298, 0.9921569, 0, 1, 1,
0.9927936, 0.07703878, 3.305063, 0.9960784, 0, 1, 1,
0.9932199, -0.9218717, 1.015189, 1, 0, 0.9960784, 1,
1.001231, 0.2579085, 3.488641, 1, 0, 0.9882353, 1,
1.002818, -0.05931633, -0.1397394, 1, 0, 0.9843137, 1,
1.008378, -0.2955052, 4.512515, 1, 0, 0.9764706, 1,
1.009561, 1.768189, 2.41642, 1, 0, 0.972549, 1,
1.015577, -0.2949263, 1.672537, 1, 0, 0.9647059, 1,
1.016476, -0.3173242, 2.02964, 1, 0, 0.9607843, 1,
1.020617, 0.006121447, 2.312872, 1, 0, 0.9529412, 1,
1.022459, 1.899476, -0.2186821, 1, 0, 0.9490196, 1,
1.022911, 1.091198, 0.517118, 1, 0, 0.9411765, 1,
1.029078, 0.154189, 0.897512, 1, 0, 0.9372549, 1,
1.032156, -1.03752, 2.158054, 1, 0, 0.9294118, 1,
1.038026, -0.2203099, 1.95559, 1, 0, 0.9254902, 1,
1.044877, -1.711338, 3.884025, 1, 0, 0.9176471, 1,
1.045654, 0.899745, 1.885184, 1, 0, 0.9137255, 1,
1.050661, 1.704592, 0.8272779, 1, 0, 0.9058824, 1,
1.06253, -0.7051316, 2.382281, 1, 0, 0.9019608, 1,
1.064084, 0.5949436, 1.962842, 1, 0, 0.8941177, 1,
1.066412, -0.3746308, 1.125413, 1, 0, 0.8862745, 1,
1.067052, 0.5495307, -0.5289019, 1, 0, 0.8823529, 1,
1.067437, 0.6558821, -0.2507691, 1, 0, 0.8745098, 1,
1.068719, 0.3990415, 2.156328, 1, 0, 0.8705882, 1,
1.073793, 2.549357, 0.3458657, 1, 0, 0.8627451, 1,
1.076976, 0.8398556, 1.583318, 1, 0, 0.8588235, 1,
1.092911, 0.7993923, 1.007823, 1, 0, 0.8509804, 1,
1.098658, -0.09101597, 0.8109913, 1, 0, 0.8470588, 1,
1.098861, 1.013232, 0.8376656, 1, 0, 0.8392157, 1,
1.099361, -0.1448044, 0.5905371, 1, 0, 0.8352941, 1,
1.105044, 0.6186914, 0.8466763, 1, 0, 0.827451, 1,
1.108697, -1.600869, 2.13026, 1, 0, 0.8235294, 1,
1.110083, 1.025351, 0.6949183, 1, 0, 0.8156863, 1,
1.114143, 0.3645889, 2.763047, 1, 0, 0.8117647, 1,
1.120037, 1.8735, -0.6696311, 1, 0, 0.8039216, 1,
1.121922, -0.8754956, 2.014464, 1, 0, 0.7960784, 1,
1.122727, 0.3387875, 2.809513, 1, 0, 0.7921569, 1,
1.123293, -0.3005652, 1.941371, 1, 0, 0.7843137, 1,
1.126599, 0.5255815, 0.2640797, 1, 0, 0.7803922, 1,
1.131557, -0.6535583, 3.452124, 1, 0, 0.772549, 1,
1.134005, 0.6146684, 1.329867, 1, 0, 0.7686275, 1,
1.134208, -0.8403321, 2.426317, 1, 0, 0.7607843, 1,
1.135965, 1.923641, -0.2307223, 1, 0, 0.7568628, 1,
1.137767, -0.5516743, 2.433515, 1, 0, 0.7490196, 1,
1.157046, -1.35457, 1.634001, 1, 0, 0.7450981, 1,
1.158907, 1.450934, -0.5815687, 1, 0, 0.7372549, 1,
1.165083, 1.183854, 0.5446878, 1, 0, 0.7333333, 1,
1.169675, 0.6723009, 1.14899, 1, 0, 0.7254902, 1,
1.17283, 0.5504498, 1.996757, 1, 0, 0.7215686, 1,
1.175779, -0.3661451, 2.085568, 1, 0, 0.7137255, 1,
1.182655, -3.175852, 3.66922, 1, 0, 0.7098039, 1,
1.182887, 0.3657823, -0.3640031, 1, 0, 0.7019608, 1,
1.185628, 0.2224383, 2.348694, 1, 0, 0.6941177, 1,
1.190049, 1.479636, 0.4937986, 1, 0, 0.6901961, 1,
1.196392, -0.2921675, 2.602649, 1, 0, 0.682353, 1,
1.199765, -1.147372, 1.243072, 1, 0, 0.6784314, 1,
1.200866, 0.09099657, 1.269978, 1, 0, 0.6705883, 1,
1.202538, -0.8720912, 2.058833, 1, 0, 0.6666667, 1,
1.214944, 1.344288, -0.5276263, 1, 0, 0.6588235, 1,
1.218367, -0.4665203, 1.064497, 1, 0, 0.654902, 1,
1.219822, -0.4400449, 1.035654, 1, 0, 0.6470588, 1,
1.221046, -0.2086829, 2.38138, 1, 0, 0.6431373, 1,
1.221453, 1.313253, 1.14439, 1, 0, 0.6352941, 1,
1.221872, 0.2939431, 2.268287, 1, 0, 0.6313726, 1,
1.23074, 1.227851, 0.1416116, 1, 0, 0.6235294, 1,
1.232785, 0.5099252, 0.2190132, 1, 0, 0.6196079, 1,
1.243254, 1.21601, 1.752637, 1, 0, 0.6117647, 1,
1.246608, -0.02631864, 1.26356, 1, 0, 0.6078432, 1,
1.247594, -0.2555775, 0.9138211, 1, 0, 0.6, 1,
1.251396, 0.03441177, 1.752301, 1, 0, 0.5921569, 1,
1.253734, -0.8604044, 4.035674, 1, 0, 0.5882353, 1,
1.283873, -1.102691, 3.037462, 1, 0, 0.5803922, 1,
1.293016, -2.518579, 1.252907, 1, 0, 0.5764706, 1,
1.293355, 1.845167, 0.1157357, 1, 0, 0.5686275, 1,
1.294129, 0.03066097, 1.305634, 1, 0, 0.5647059, 1,
1.30088, 0.1100362, 3.015701, 1, 0, 0.5568628, 1,
1.307509, 0.6134459, 0.3742078, 1, 0, 0.5529412, 1,
1.312977, -0.1405817, 2.438435, 1, 0, 0.5450981, 1,
1.313956, 1.090415, 2.015262, 1, 0, 0.5411765, 1,
1.318376, -0.9530958, 1.755784, 1, 0, 0.5333334, 1,
1.337567, -0.1218332, 0.009986443, 1, 0, 0.5294118, 1,
1.339038, 1.505819, -1.014058, 1, 0, 0.5215687, 1,
1.342788, 0.2042457, 2.60509, 1, 0, 0.5176471, 1,
1.344274, -0.8895497, 1.805865, 1, 0, 0.509804, 1,
1.346151, 0.4973032, 1.559847, 1, 0, 0.5058824, 1,
1.34986, -0.3463923, 2.634301, 1, 0, 0.4980392, 1,
1.353572, 0.7930954, 4.207363, 1, 0, 0.4901961, 1,
1.381642, -0.4697734, 1.273117, 1, 0, 0.4862745, 1,
1.385113, -0.9214296, 1.863424, 1, 0, 0.4784314, 1,
1.385499, -0.667865, 1.376848, 1, 0, 0.4745098, 1,
1.388873, 0.5897076, 2.956722, 1, 0, 0.4666667, 1,
1.4132, 1.00141, 0.7325617, 1, 0, 0.4627451, 1,
1.414749, 0.4799258, 1.70231, 1, 0, 0.454902, 1,
1.41638, 2.498399, 1.704646, 1, 0, 0.4509804, 1,
1.428121, 0.2177763, 1.722364, 1, 0, 0.4431373, 1,
1.433264, 0.3863535, 0.6411752, 1, 0, 0.4392157, 1,
1.434489, 0.3645874, 2.541315, 1, 0, 0.4313726, 1,
1.440665, -0.8559247, 1.614802, 1, 0, 0.427451, 1,
1.460327, -0.3810976, 1.99073, 1, 0, 0.4196078, 1,
1.478043, 1.476416, 0.3063292, 1, 0, 0.4156863, 1,
1.488438, 1.575841, 1.159858, 1, 0, 0.4078431, 1,
1.497805, 0.1445911, -0.8086587, 1, 0, 0.4039216, 1,
1.498767, 0.3781954, 1.8481, 1, 0, 0.3960784, 1,
1.508142, -0.5430006, 2.394773, 1, 0, 0.3882353, 1,
1.521917, 1.581151, -0.3946935, 1, 0, 0.3843137, 1,
1.52298, -1.043506, 2.173858, 1, 0, 0.3764706, 1,
1.526847, -0.9568357, 2.383246, 1, 0, 0.372549, 1,
1.531691, 0.122259, 0.9603921, 1, 0, 0.3647059, 1,
1.534029, 1.52, 2.510284, 1, 0, 0.3607843, 1,
1.548779, -0.8388867, 0.9217555, 1, 0, 0.3529412, 1,
1.559466, -0.242391, 2.444076, 1, 0, 0.3490196, 1,
1.562506, 0.8750879, 2.801179, 1, 0, 0.3411765, 1,
1.577202, -1.340997, 2.561757, 1, 0, 0.3372549, 1,
1.584604, -0.8910629, 2.63832, 1, 0, 0.3294118, 1,
1.592956, 0.7919766, 1.526189, 1, 0, 0.3254902, 1,
1.600772, -0.1123116, 2.769795, 1, 0, 0.3176471, 1,
1.608571, -1.030354, 1.800877, 1, 0, 0.3137255, 1,
1.616319, 1.511007, 0.3629458, 1, 0, 0.3058824, 1,
1.624958, -2.946912, 0.7340996, 1, 0, 0.2980392, 1,
1.660623, -0.05017278, 0.03554356, 1, 0, 0.2941177, 1,
1.6752, 0.2120268, 2.418286, 1, 0, 0.2862745, 1,
1.681798, 1.287164, 3.019451, 1, 0, 0.282353, 1,
1.700505, 1.663154, 0.6760764, 1, 0, 0.2745098, 1,
1.724003, 0.2117285, 0.9787098, 1, 0, 0.2705882, 1,
1.748848, 0.9358518, 1.702397, 1, 0, 0.2627451, 1,
1.755534, 1.150573, 0.3826137, 1, 0, 0.2588235, 1,
1.756622, 0.7926915, 1.929837, 1, 0, 0.2509804, 1,
1.769519, -0.4231201, 1.598612, 1, 0, 0.2470588, 1,
1.822216, 0.1580732, 0.6490576, 1, 0, 0.2392157, 1,
1.873984, 1.662716, 1.555649, 1, 0, 0.2352941, 1,
1.893277, 0.8771097, 0.2945849, 1, 0, 0.227451, 1,
1.894827, -0.9865046, 1.621601, 1, 0, 0.2235294, 1,
1.901424, -1.289594, 2.809012, 1, 0, 0.2156863, 1,
1.924775, 0.1062846, 1.02024, 1, 0, 0.2117647, 1,
1.948359, 2.14502, -1.654509, 1, 0, 0.2039216, 1,
1.962367, 0.1984181, 1.09436, 1, 0, 0.1960784, 1,
1.96498, -1.103501, 1.377886, 1, 0, 0.1921569, 1,
1.969677, 0.8672376, 1.838539, 1, 0, 0.1843137, 1,
2.003677, -0.5095266, 2.223152, 1, 0, 0.1803922, 1,
2.015001, 0.1697857, 0.6644377, 1, 0, 0.172549, 1,
2.019272, 2.347914, 0.9556872, 1, 0, 0.1686275, 1,
2.019993, -1.743638, 2.559916, 1, 0, 0.1607843, 1,
2.054272, 1.697022, 2.368111, 1, 0, 0.1568628, 1,
2.07488, -0.4423107, 1.818331, 1, 0, 0.1490196, 1,
2.076168, 0.2094877, -0.1333984, 1, 0, 0.145098, 1,
2.08295, 0.4087515, 2.083922, 1, 0, 0.1372549, 1,
2.107912, 0.04518296, 0.01890673, 1, 0, 0.1333333, 1,
2.118806, -0.7837666, 2.861599, 1, 0, 0.1254902, 1,
2.171293, 0.8884207, 1.727998, 1, 0, 0.1215686, 1,
2.186125, -0.4992128, 2.048839, 1, 0, 0.1137255, 1,
2.228241, 0.4752233, 1.41942, 1, 0, 0.1098039, 1,
2.231762, 0.3049761, 0.0613773, 1, 0, 0.1019608, 1,
2.2392, -0.536863, 0.6195395, 1, 0, 0.09411765, 1,
2.240205, 1.069763, 0.8491507, 1, 0, 0.09019608, 1,
2.265665, 1.218633, 2.988989, 1, 0, 0.08235294, 1,
2.27988, 1.171149, 2.549856, 1, 0, 0.07843138, 1,
2.295921, -0.1974557, 0.8497758, 1, 0, 0.07058824, 1,
2.296064, -0.2778304, 1.516871, 1, 0, 0.06666667, 1,
2.356884, 0.9931829, 0.5676753, 1, 0, 0.05882353, 1,
2.384949, 0.7351695, 3.051515, 1, 0, 0.05490196, 1,
2.431087, 1.186889, 2.800839, 1, 0, 0.04705882, 1,
2.45884, 0.3247505, 0.6979558, 1, 0, 0.04313726, 1,
2.461006, 1.139858, 1.521254, 1, 0, 0.03529412, 1,
2.537383, -2.607258, 1.500802, 1, 0, 0.03137255, 1,
2.546633, 0.2520657, 4.083871, 1, 0, 0.02352941, 1,
2.597089, 0.786346, 1.317883, 1, 0, 0.01960784, 1,
2.628073, -0.7193477, 1.949284, 1, 0, 0.01176471, 1,
2.884768, -0.5855222, 0.08724791, 1, 0, 0.007843138, 1
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
-0.7873681, -4.379642, -7.706174, 0, -0.5, 0.5, 0.5,
-0.7873681, -4.379642, -7.706174, 1, -0.5, 0.5, 0.5,
-0.7873681, -4.379642, -7.706174, 1, 1.5, 0.5, 0.5,
-0.7873681, -4.379642, -7.706174, 0, 1.5, 0.5, 0.5
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
-5.704358, -0.07897067, -7.706174, 0, -0.5, 0.5, 0.5,
-5.704358, -0.07897067, -7.706174, 1, -0.5, 0.5, 0.5,
-5.704358, -0.07897067, -7.706174, 1, 1.5, 0.5, 0.5,
-5.704358, -0.07897067, -7.706174, 0, 1.5, 0.5, 0.5
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
-5.704358, -4.379642, -0.1321697, 0, -0.5, 0.5, 0.5,
-5.704358, -4.379642, -0.1321697, 1, -0.5, 0.5, 0.5,
-5.704358, -4.379642, -0.1321697, 1, 1.5, 0.5, 0.5,
-5.704358, -4.379642, -0.1321697, 0, 1.5, 0.5, 0.5
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
-4, -3.38718, -5.958327,
2, -3.38718, -5.958327,
-4, -3.38718, -5.958327,
-4, -3.55259, -6.249635,
-2, -3.38718, -5.958327,
-2, -3.55259, -6.249635,
0, -3.38718, -5.958327,
0, -3.55259, -6.249635,
2, -3.38718, -5.958327,
2, -3.55259, -6.249635
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
-4, -3.883411, -6.83225, 0, -0.5, 0.5, 0.5,
-4, -3.883411, -6.83225, 1, -0.5, 0.5, 0.5,
-4, -3.883411, -6.83225, 1, 1.5, 0.5, 0.5,
-4, -3.883411, -6.83225, 0, 1.5, 0.5, 0.5,
-2, -3.883411, -6.83225, 0, -0.5, 0.5, 0.5,
-2, -3.883411, -6.83225, 1, -0.5, 0.5, 0.5,
-2, -3.883411, -6.83225, 1, 1.5, 0.5, 0.5,
-2, -3.883411, -6.83225, 0, 1.5, 0.5, 0.5,
0, -3.883411, -6.83225, 0, -0.5, 0.5, 0.5,
0, -3.883411, -6.83225, 1, -0.5, 0.5, 0.5,
0, -3.883411, -6.83225, 1, 1.5, 0.5, 0.5,
0, -3.883411, -6.83225, 0, 1.5, 0.5, 0.5,
2, -3.883411, -6.83225, 0, -0.5, 0.5, 0.5,
2, -3.883411, -6.83225, 1, -0.5, 0.5, 0.5,
2, -3.883411, -6.83225, 1, 1.5, 0.5, 0.5,
2, -3.883411, -6.83225, 0, 1.5, 0.5, 0.5
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
-4.569668, -3, -5.958327,
-4.569668, 3, -5.958327,
-4.569668, -3, -5.958327,
-4.758783, -3, -6.249635,
-4.569668, -2, -5.958327,
-4.758783, -2, -6.249635,
-4.569668, -1, -5.958327,
-4.758783, -1, -6.249635,
-4.569668, 0, -5.958327,
-4.758783, 0, -6.249635,
-4.569668, 1, -5.958327,
-4.758783, 1, -6.249635,
-4.569668, 2, -5.958327,
-4.758783, 2, -6.249635,
-4.569668, 3, -5.958327,
-4.758783, 3, -6.249635
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
-5.137013, -3, -6.83225, 0, -0.5, 0.5, 0.5,
-5.137013, -3, -6.83225, 1, -0.5, 0.5, 0.5,
-5.137013, -3, -6.83225, 1, 1.5, 0.5, 0.5,
-5.137013, -3, -6.83225, 0, 1.5, 0.5, 0.5,
-5.137013, -2, -6.83225, 0, -0.5, 0.5, 0.5,
-5.137013, -2, -6.83225, 1, -0.5, 0.5, 0.5,
-5.137013, -2, -6.83225, 1, 1.5, 0.5, 0.5,
-5.137013, -2, -6.83225, 0, 1.5, 0.5, 0.5,
-5.137013, -1, -6.83225, 0, -0.5, 0.5, 0.5,
-5.137013, -1, -6.83225, 1, -0.5, 0.5, 0.5,
-5.137013, -1, -6.83225, 1, 1.5, 0.5, 0.5,
-5.137013, -1, -6.83225, 0, 1.5, 0.5, 0.5,
-5.137013, 0, -6.83225, 0, -0.5, 0.5, 0.5,
-5.137013, 0, -6.83225, 1, -0.5, 0.5, 0.5,
-5.137013, 0, -6.83225, 1, 1.5, 0.5, 0.5,
-5.137013, 0, -6.83225, 0, 1.5, 0.5, 0.5,
-5.137013, 1, -6.83225, 0, -0.5, 0.5, 0.5,
-5.137013, 1, -6.83225, 1, -0.5, 0.5, 0.5,
-5.137013, 1, -6.83225, 1, 1.5, 0.5, 0.5,
-5.137013, 1, -6.83225, 0, 1.5, 0.5, 0.5,
-5.137013, 2, -6.83225, 0, -0.5, 0.5, 0.5,
-5.137013, 2, -6.83225, 1, -0.5, 0.5, 0.5,
-5.137013, 2, -6.83225, 1, 1.5, 0.5, 0.5,
-5.137013, 2, -6.83225, 0, 1.5, 0.5, 0.5,
-5.137013, 3, -6.83225, 0, -0.5, 0.5, 0.5,
-5.137013, 3, -6.83225, 1, -0.5, 0.5, 0.5,
-5.137013, 3, -6.83225, 1, 1.5, 0.5, 0.5,
-5.137013, 3, -6.83225, 0, 1.5, 0.5, 0.5
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
-4.569668, -3.38718, -4,
-4.569668, -3.38718, 4,
-4.569668, -3.38718, -4,
-4.758783, -3.55259, -4,
-4.569668, -3.38718, -2,
-4.758783, -3.55259, -2,
-4.569668, -3.38718, 0,
-4.758783, -3.55259, 0,
-4.569668, -3.38718, 2,
-4.758783, -3.55259, 2,
-4.569668, -3.38718, 4,
-4.758783, -3.55259, 4
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
-5.137013, -3.883411, -4, 0, -0.5, 0.5, 0.5,
-5.137013, -3.883411, -4, 1, -0.5, 0.5, 0.5,
-5.137013, -3.883411, -4, 1, 1.5, 0.5, 0.5,
-5.137013, -3.883411, -4, 0, 1.5, 0.5, 0.5,
-5.137013, -3.883411, -2, 0, -0.5, 0.5, 0.5,
-5.137013, -3.883411, -2, 1, -0.5, 0.5, 0.5,
-5.137013, -3.883411, -2, 1, 1.5, 0.5, 0.5,
-5.137013, -3.883411, -2, 0, 1.5, 0.5, 0.5,
-5.137013, -3.883411, 0, 0, -0.5, 0.5, 0.5,
-5.137013, -3.883411, 0, 1, -0.5, 0.5, 0.5,
-5.137013, -3.883411, 0, 1, 1.5, 0.5, 0.5,
-5.137013, -3.883411, 0, 0, 1.5, 0.5, 0.5,
-5.137013, -3.883411, 2, 0, -0.5, 0.5, 0.5,
-5.137013, -3.883411, 2, 1, -0.5, 0.5, 0.5,
-5.137013, -3.883411, 2, 1, 1.5, 0.5, 0.5,
-5.137013, -3.883411, 2, 0, 1.5, 0.5, 0.5,
-5.137013, -3.883411, 4, 0, -0.5, 0.5, 0.5,
-5.137013, -3.883411, 4, 1, -0.5, 0.5, 0.5,
-5.137013, -3.883411, 4, 1, 1.5, 0.5, 0.5,
-5.137013, -3.883411, 4, 0, 1.5, 0.5, 0.5
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
-4.569668, -3.38718, -5.958327,
-4.569668, 3.229238, -5.958327,
-4.569668, -3.38718, 5.693987,
-4.569668, 3.229238, 5.693987,
-4.569668, -3.38718, -5.958327,
-4.569668, -3.38718, 5.693987,
-4.569668, 3.229238, -5.958327,
-4.569668, 3.229238, 5.693987,
-4.569668, -3.38718, -5.958327,
2.994932, -3.38718, -5.958327,
-4.569668, -3.38718, 5.693987,
2.994932, -3.38718, 5.693987,
-4.569668, 3.229238, -5.958327,
2.994932, 3.229238, -5.958327,
-4.569668, 3.229238, 5.693987,
2.994932, 3.229238, 5.693987,
2.994932, -3.38718, -5.958327,
2.994932, 3.229238, -5.958327,
2.994932, -3.38718, 5.693987,
2.994932, 3.229238, 5.693987,
2.994932, -3.38718, -5.958327,
2.994932, -3.38718, 5.693987,
2.994932, 3.229238, -5.958327,
2.994932, 3.229238, 5.693987
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
var radius = 8.216651;
var distance = 36.55681;
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
mvMatrix.translate( 0.7873681, 0.07897067, 0.1321697 );
mvMatrix.scale( 1.174418, 1.342721, 0.762424 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.55681);
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
endothal<-read.table("endothal.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-endothal$V2
```

```
## Error in eval(expr, envir, enclos): object 'endothal' not found
```

```r
y<-endothal$V3
```

```
## Error in eval(expr, envir, enclos): object 'endothal' not found
```

```r
z<-endothal$V4
```

```
## Error in eval(expr, envir, enclos): object 'endothal' not found
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
-4.459504, 3.132883, 0.304316, 0, 0, 1, 1, 1,
-3.120085, 1.629378, -1.447922, 1, 0, 0, 1, 1,
-2.882547, -0.2694269, -2.156459, 1, 0, 0, 1, 1,
-2.803239, -0.5989662, -0.2573391, 1, 0, 0, 1, 1,
-2.727472, 0.3822996, -1.502668, 1, 0, 0, 1, 1,
-2.625005, 0.1329834, -0.792616, 1, 0, 0, 1, 1,
-2.591774, 0.7858512, 0.6814905, 0, 0, 0, 1, 1,
-2.569011, -0.5405631, -1.446898, 0, 0, 0, 1, 1,
-2.5402, 0.3858974, 0.2375275, 0, 0, 0, 1, 1,
-2.348091, 0.1668186, 0.4579732, 0, 0, 0, 1, 1,
-2.338607, -1.151642, -1.840674, 0, 0, 0, 1, 1,
-2.300226, 0.2478174, -2.06066, 0, 0, 0, 1, 1,
-2.288432, -0.8404314, -0.9429404, 0, 0, 0, 1, 1,
-2.277294, -0.4990353, -2.520034, 1, 1, 1, 1, 1,
-2.274943, -0.3908686, -1.936491, 1, 1, 1, 1, 1,
-2.211596, 0.5295226, -1.964878, 1, 1, 1, 1, 1,
-2.211593, 0.5272407, -2.246935, 1, 1, 1, 1, 1,
-2.210272, -1.369835, -3.495692, 1, 1, 1, 1, 1,
-2.174432, -1.821027, -3.298969, 1, 1, 1, 1, 1,
-2.173588, -1.1656, -4.182217, 1, 1, 1, 1, 1,
-2.130283, -0.8470443, -3.414717, 1, 1, 1, 1, 1,
-2.112132, 0.7436534, -0.5502452, 1, 1, 1, 1, 1,
-2.090504, -0.1062663, -1.784435, 1, 1, 1, 1, 1,
-2.069131, 0.1772497, -1.132169, 1, 1, 1, 1, 1,
-2.069105, 0.87637, -1.480336, 1, 1, 1, 1, 1,
-2.022214, 1.38212, -0.2711818, 1, 1, 1, 1, 1,
-2.021691, 0.336084, -1.411915, 1, 1, 1, 1, 1,
-2.018496, 0.7617626, 0.389048, 1, 1, 1, 1, 1,
-2.01119, 0.7003511, -1.154809, 0, 0, 1, 1, 1,
-2.007209, -1.377206, -1.728435, 1, 0, 0, 1, 1,
-2.003137, -1.684187, -3.642991, 1, 0, 0, 1, 1,
-1.964956, 1.041659, -2.710295, 1, 0, 0, 1, 1,
-1.935975, 0.2741772, -1.133189, 1, 0, 0, 1, 1,
-1.921624, -0.2730077, -1.115035, 1, 0, 0, 1, 1,
-1.909305, -0.3570006, -0.9553773, 0, 0, 0, 1, 1,
-1.84564, -0.3869537, -3.392434, 0, 0, 0, 1, 1,
-1.844064, -0.1959989, -1.923321, 0, 0, 0, 1, 1,
-1.842336, 0.3993101, -2.439446, 0, 0, 0, 1, 1,
-1.787609, 0.5462918, -1.66344, 0, 0, 0, 1, 1,
-1.782425, -1.585128, -3.429676, 0, 0, 0, 1, 1,
-1.77911, -1.0486, -1.212732, 0, 0, 0, 1, 1,
-1.755691, -0.1371715, -0.8821602, 1, 1, 1, 1, 1,
-1.75455, 2.437122, 0.06857577, 1, 1, 1, 1, 1,
-1.746127, -0.6680867, -1.665935, 1, 1, 1, 1, 1,
-1.744244, -0.6262205, -2.209207, 1, 1, 1, 1, 1,
-1.729694, 0.217522, -0.8282141, 1, 1, 1, 1, 1,
-1.718742, 0.609041, -0.5019438, 1, 1, 1, 1, 1,
-1.703909, -0.2845947, -1.856666, 1, 1, 1, 1, 1,
-1.696648, 0.7929567, 0.3410651, 1, 1, 1, 1, 1,
-1.690154, -1.496523, -3.324641, 1, 1, 1, 1, 1,
-1.679241, 0.963581, -0.07350292, 1, 1, 1, 1, 1,
-1.654115, 0.2432065, -1.42948, 1, 1, 1, 1, 1,
-1.643647, -0.3219108, -2.208793, 1, 1, 1, 1, 1,
-1.643426, 1.663405, 1.493809, 1, 1, 1, 1, 1,
-1.641991, -0.3121926, -1.707718, 1, 1, 1, 1, 1,
-1.641582, 0.8277009, 0.1465252, 1, 1, 1, 1, 1,
-1.622773, -0.1477985, 0.02314654, 0, 0, 1, 1, 1,
-1.607662, -0.5441203, -1.253917, 1, 0, 0, 1, 1,
-1.60376, -0.5132295, -0.4204025, 1, 0, 0, 1, 1,
-1.596303, -0.711666, -2.086255, 1, 0, 0, 1, 1,
-1.581865, -0.5495641, -3.733023, 1, 0, 0, 1, 1,
-1.54806, -0.7355579, -1.355628, 1, 0, 0, 1, 1,
-1.541324, 0.3872613, -3.058691, 0, 0, 0, 1, 1,
-1.537169, 1.206351, 0.02273223, 0, 0, 0, 1, 1,
-1.535026, 1.174528, -1.51298, 0, 0, 0, 1, 1,
-1.53361, 2.095236, 0.2923453, 0, 0, 0, 1, 1,
-1.528344, -0.06318164, -0.4713829, 0, 0, 0, 1, 1,
-1.526625, 1.297225, -1.769458, 0, 0, 0, 1, 1,
-1.514022, -0.6395084, -1.859082, 0, 0, 0, 1, 1,
-1.510105, 0.7623948, -0.2168408, 1, 1, 1, 1, 1,
-1.504136, 0.6167834, -0.637545, 1, 1, 1, 1, 1,
-1.501177, -0.6293814, -1.554729, 1, 1, 1, 1, 1,
-1.496765, 0.4909501, -1.465753, 1, 1, 1, 1, 1,
-1.49345, 0.9232449, -0.7219447, 1, 1, 1, 1, 1,
-1.492591, -0.4793, -0.9072737, 1, 1, 1, 1, 1,
-1.48247, -0.9792083, -2.117652, 1, 1, 1, 1, 1,
-1.46266, 0.7593919, -1.144335, 1, 1, 1, 1, 1,
-1.43689, -0.3783008, -1.168463, 1, 1, 1, 1, 1,
-1.435652, -0.1025993, -1.080511, 1, 1, 1, 1, 1,
-1.430054, -0.9732009, -1.634247, 1, 1, 1, 1, 1,
-1.396008, -0.6311216, -1.073419, 1, 1, 1, 1, 1,
-1.384126, -1.594816, -2.855483, 1, 1, 1, 1, 1,
-1.380907, -1.146317, -4.022901, 1, 1, 1, 1, 1,
-1.376849, 0.4202836, -1.769518, 1, 1, 1, 1, 1,
-1.37284, 0.6068448, -1.361911, 0, 0, 1, 1, 1,
-1.366538, -0.2438307, -1.004711, 1, 0, 0, 1, 1,
-1.365903, 1.04824, 0.1517269, 1, 0, 0, 1, 1,
-1.363443, -0.4584963, -1.85511, 1, 0, 0, 1, 1,
-1.361944, 1.943031, -1.143406, 1, 0, 0, 1, 1,
-1.349032, -0.6363435, -1.947355, 1, 0, 0, 1, 1,
-1.341338, -0.492191, -3.19355, 0, 0, 0, 1, 1,
-1.338033, 0.7883822, 0.8934228, 0, 0, 0, 1, 1,
-1.325395, 0.1527213, -1.473114, 0, 0, 0, 1, 1,
-1.317306, 0.08679299, -3.09554, 0, 0, 0, 1, 1,
-1.315924, -0.02375032, 0.3671154, 0, 0, 0, 1, 1,
-1.310095, 1.232361, -1.043548, 0, 0, 0, 1, 1,
-1.309913, 0.04903481, -0.619884, 0, 0, 0, 1, 1,
-1.285424, -0.5107502, -1.689627, 1, 1, 1, 1, 1,
-1.278959, 0.037193, -0.6254921, 1, 1, 1, 1, 1,
-1.271178, 0.2072145, -1.885183, 1, 1, 1, 1, 1,
-1.270763, -0.8439859, -2.027319, 1, 1, 1, 1, 1,
-1.268269, -0.3486416, -3.098606, 1, 1, 1, 1, 1,
-1.267299, 0.5922354, -1.973848, 1, 1, 1, 1, 1,
-1.264256, -1.313484, 0.4800069, 1, 1, 1, 1, 1,
-1.262361, -1.905451, -3.637125, 1, 1, 1, 1, 1,
-1.243711, -0.0687151, -0.4273964, 1, 1, 1, 1, 1,
-1.236779, -0.3606192, -2.906042, 1, 1, 1, 1, 1,
-1.231757, 0.09627829, -1.318042, 1, 1, 1, 1, 1,
-1.210318, -1.150469, -2.004093, 1, 1, 1, 1, 1,
-1.20855, -0.608704, -0.4343008, 1, 1, 1, 1, 1,
-1.201223, 0.4823755, -0.6376303, 1, 1, 1, 1, 1,
-1.200647, -0.4797175, -0.9751363, 1, 1, 1, 1, 1,
-1.199171, 0.1810325, -2.392825, 0, 0, 1, 1, 1,
-1.1896, -1.081827, -3.333834, 1, 0, 0, 1, 1,
-1.185488, 2.240117, -0.5294673, 1, 0, 0, 1, 1,
-1.171393, 0.5012883, 1.197799, 1, 0, 0, 1, 1,
-1.166031, -0.4240533, -0.4524657, 1, 0, 0, 1, 1,
-1.165955, 1.05365, -1.611046, 1, 0, 0, 1, 1,
-1.165667, 0.005765619, -2.408649, 0, 0, 0, 1, 1,
-1.160858, -0.203786, -1.066985, 0, 0, 0, 1, 1,
-1.160227, -0.2586516, -0.6697187, 0, 0, 0, 1, 1,
-1.155942, -1.437071, -3.391047, 0, 0, 0, 1, 1,
-1.151407, -1.325445, -1.300805, 0, 0, 0, 1, 1,
-1.147256, -0.1448425, -2.440613, 0, 0, 0, 1, 1,
-1.143706, -1.538038, 0.3301233, 0, 0, 0, 1, 1,
-1.138305, 2.161653, -1.192814, 1, 1, 1, 1, 1,
-1.134245, -1.828989, -0.7383339, 1, 1, 1, 1, 1,
-1.130349, -0.8260416, 0.07636508, 1, 1, 1, 1, 1,
-1.128864, 0.3422784, -2.12155, 1, 1, 1, 1, 1,
-1.115264, -0.4946713, -3.105386, 1, 1, 1, 1, 1,
-1.106875, 1.05616, -2.285851, 1, 1, 1, 1, 1,
-1.10573, 1.04597, -0.2522969, 1, 1, 1, 1, 1,
-1.098241, 0.2183043, -0.06515335, 1, 1, 1, 1, 1,
-1.068681, -1.455826, -2.436341, 1, 1, 1, 1, 1,
-1.067334, -0.4760164, -2.705457, 1, 1, 1, 1, 1,
-1.053728, 0.2105421, -2.231541, 1, 1, 1, 1, 1,
-1.050903, -0.602225, -3.446818, 1, 1, 1, 1, 1,
-1.044721, 0.8593446, -0.8774031, 1, 1, 1, 1, 1,
-1.044652, 0.6194815, -1.185193, 1, 1, 1, 1, 1,
-1.041773, 1.042674, -1.445847, 1, 1, 1, 1, 1,
-1.039686, -0.1950406, -1.693622, 0, 0, 1, 1, 1,
-1.037564, -0.5958373, -0.6733947, 1, 0, 0, 1, 1,
-1.035678, 0.7649783, -0.7941644, 1, 0, 0, 1, 1,
-1.033539, -0.2093847, 0.10605, 1, 0, 0, 1, 1,
-1.033237, 2.232185, -2.048114, 1, 0, 0, 1, 1,
-1.028965, -1.055208, -1.750805, 1, 0, 0, 1, 1,
-1.026441, 0.5628586, -2.369808, 0, 0, 0, 1, 1,
-1.024195, 1.511906, -1.832942, 0, 0, 0, 1, 1,
-1.020828, -0.3014598, -1.867478, 0, 0, 0, 1, 1,
-1.016864, -0.7954477, -2.876938, 0, 0, 0, 1, 1,
-1.014728, 0.9986386, -0.7122235, 0, 0, 0, 1, 1,
-1.004457, -1.498222, -3.717613, 0, 0, 0, 1, 1,
-1.003075, 0.2809098, -1.312971, 0, 0, 0, 1, 1,
-1.001545, 0.003577277, -2.019266, 1, 1, 1, 1, 1,
-0.9870685, -0.8478411, -1.177912, 1, 1, 1, 1, 1,
-0.9825402, 0.01167941, -3.99692, 1, 1, 1, 1, 1,
-0.9743431, -1.085769, -3.39247, 1, 1, 1, 1, 1,
-0.9731068, 0.7951725, -1.549549, 1, 1, 1, 1, 1,
-0.9694564, -0.2374149, -3.171014, 1, 1, 1, 1, 1,
-0.9629559, -0.9158997, -2.7704, 1, 1, 1, 1, 1,
-0.9453938, -0.4300538, -2.715571, 1, 1, 1, 1, 1,
-0.9451442, -1.083947, -0.4295841, 1, 1, 1, 1, 1,
-0.9372933, 0.1839159, -0.9363189, 1, 1, 1, 1, 1,
-0.9347764, -1.492025, -4.134263, 1, 1, 1, 1, 1,
-0.9290075, -0.8692546, -1.845904, 1, 1, 1, 1, 1,
-0.9289817, -0.1048572, -1.535839, 1, 1, 1, 1, 1,
-0.9281234, -1.646583, -2.275872, 1, 1, 1, 1, 1,
-0.9275169, -0.007494248, -3.384714, 1, 1, 1, 1, 1,
-0.9242995, -1.954117, -2.826969, 0, 0, 1, 1, 1,
-0.9227934, 1.606535, 0.02429292, 1, 0, 0, 1, 1,
-0.9190929, -0.2836413, -0.5046594, 1, 0, 0, 1, 1,
-0.9146911, 0.1231681, -3.688496, 1, 0, 0, 1, 1,
-0.9072109, -0.3211237, -1.768701, 1, 0, 0, 1, 1,
-0.8968475, -0.04095162, -2.408653, 1, 0, 0, 1, 1,
-0.8892543, 0.0549224, -1.693272, 0, 0, 0, 1, 1,
-0.8860723, 1.362545, 0.6998479, 0, 0, 0, 1, 1,
-0.8846015, 0.7555104, -1.348123, 0, 0, 0, 1, 1,
-0.8819422, -0.06752925, -0.5882368, 0, 0, 0, 1, 1,
-0.8782476, 0.4259709, 0.1598418, 0, 0, 0, 1, 1,
-0.872481, -2.385186, -1.710827, 0, 0, 0, 1, 1,
-0.871941, -0.6197442, -3.014763, 0, 0, 0, 1, 1,
-0.8687701, 0.3623566, 1.181423, 1, 1, 1, 1, 1,
-0.8662212, -0.7206679, -2.573407, 1, 1, 1, 1, 1,
-0.8568392, -0.6866876, -3.670894, 1, 1, 1, 1, 1,
-0.8452464, 0.6101718, 0.8345949, 1, 1, 1, 1, 1,
-0.8410155, -1.767642, -1.929776, 1, 1, 1, 1, 1,
-0.8379481, 0.4720893, -2.79252, 1, 1, 1, 1, 1,
-0.8335448, -1.233824, -2.55378, 1, 1, 1, 1, 1,
-0.8194411, -1.153909, -2.990773, 1, 1, 1, 1, 1,
-0.8187144, -1.269349, 0.2027728, 1, 1, 1, 1, 1,
-0.8038728, 0.201559, -1.914642, 1, 1, 1, 1, 1,
-0.7954424, 0.1475024, -1.654171, 1, 1, 1, 1, 1,
-0.7948756, -1.914837, -1.524252, 1, 1, 1, 1, 1,
-0.7942185, 1.38742, -0.8647129, 1, 1, 1, 1, 1,
-0.7824337, 0.7991794, -1.792085, 1, 1, 1, 1, 1,
-0.7814394, -1.307321, -3.169027, 1, 1, 1, 1, 1,
-0.7734356, 0.2204206, -3.227886, 0, 0, 1, 1, 1,
-0.7716784, -0.08037932, -1.752273, 1, 0, 0, 1, 1,
-0.7715761, 0.8373531, -1.826792, 1, 0, 0, 1, 1,
-0.770804, -1.292112, -3.814124, 1, 0, 0, 1, 1,
-0.75984, 0.2091756, -1.340303, 1, 0, 0, 1, 1,
-0.7562648, -1.705628, -0.5314928, 1, 0, 0, 1, 1,
-0.754007, -2.351375, -5.788633, 0, 0, 0, 1, 1,
-0.7528214, 2.013324, 0.3029024, 0, 0, 0, 1, 1,
-0.7476652, 1.138212, 0.4031884, 0, 0, 0, 1, 1,
-0.7468145, 0.4645305, -2.341586, 0, 0, 0, 1, 1,
-0.7461615, 1.30218, -0.6802173, 0, 0, 0, 1, 1,
-0.7439687, -0.9031444, -4.819102, 0, 0, 0, 1, 1,
-0.7404481, 0.08960517, -1.733683, 0, 0, 0, 1, 1,
-0.7384506, 0.1681305, -1.251612, 1, 1, 1, 1, 1,
-0.7379513, 1.167591, 0.2718141, 1, 1, 1, 1, 1,
-0.712413, 0.7254241, 0.8692167, 1, 1, 1, 1, 1,
-0.6998888, 0.2647702, -0.4810475, 1, 1, 1, 1, 1,
-0.6949316, 1.175587, -1.188903, 1, 1, 1, 1, 1,
-0.6931695, 1.563315, -0.08154218, 1, 1, 1, 1, 1,
-0.6904469, 0.1002287, -0.4833777, 1, 1, 1, 1, 1,
-0.6890211, -0.4770395, -2.749527, 1, 1, 1, 1, 1,
-0.6846593, -0.687535, -2.641836, 1, 1, 1, 1, 1,
-0.6786041, 0.2830904, 0.7740198, 1, 1, 1, 1, 1,
-0.6748458, -0.6056914, -4.280097, 1, 1, 1, 1, 1,
-0.6662234, 1.975885, -0.6591427, 1, 1, 1, 1, 1,
-0.6629909, 0.9087041, 0.2190607, 1, 1, 1, 1, 1,
-0.6624414, 1.642437, -0.8610938, 1, 1, 1, 1, 1,
-0.6597239, -1.483193, -2.734519, 1, 1, 1, 1, 1,
-0.6581215, -0.09144642, -4.493461, 0, 0, 1, 1, 1,
-0.6536224, -1.341086, -1.110505, 1, 0, 0, 1, 1,
-0.652627, -0.6582291, -2.797729, 1, 0, 0, 1, 1,
-0.652528, -0.9098486, -2.863347, 1, 0, 0, 1, 1,
-0.6511746, 0.1746667, 1.228095, 1, 0, 0, 1, 1,
-0.6485928, 1.229129, -1.023298, 1, 0, 0, 1, 1,
-0.6465157, -0.1452938, 0.312506, 0, 0, 0, 1, 1,
-0.643883, -1.094278, -2.887757, 0, 0, 0, 1, 1,
-0.6378443, 0.1536153, -0.8139927, 0, 0, 0, 1, 1,
-0.622182, -0.6274687, -2.244061, 0, 0, 0, 1, 1,
-0.6212237, 1.812187, 0.4314615, 0, 0, 0, 1, 1,
-0.6155447, 1.817829, 0.43479, 0, 0, 0, 1, 1,
-0.6150022, -1.726594, -1.860734, 0, 0, 0, 1, 1,
-0.6143171, 0.6712455, -1.279525, 1, 1, 1, 1, 1,
-0.6057284, -0.6132894, -3.012444, 1, 1, 1, 1, 1,
-0.6056646, 0.1389427, -3.589202, 1, 1, 1, 1, 1,
-0.6055087, -1.291113, -3.054838, 1, 1, 1, 1, 1,
-0.597298, -1.742713, -1.330573, 1, 1, 1, 1, 1,
-0.593798, -0.9758843, -2.437157, 1, 1, 1, 1, 1,
-0.5870779, -1.259873, -2.806222, 1, 1, 1, 1, 1,
-0.586242, -0.9215491, -0.6339347, 1, 1, 1, 1, 1,
-0.5798602, -0.1280556, -2.461154, 1, 1, 1, 1, 1,
-0.5795658, 0.08715809, -2.853159, 1, 1, 1, 1, 1,
-0.5763569, -0.7499301, -2.632206, 1, 1, 1, 1, 1,
-0.5742881, 1.012865, 0.2300479, 1, 1, 1, 1, 1,
-0.5678722, -0.7368146, -3.122358, 1, 1, 1, 1, 1,
-0.5672581, 2.562701, -0.6279969, 1, 1, 1, 1, 1,
-0.5626954, 1.160865, 0.6427932, 1, 1, 1, 1, 1,
-0.5610172, -0.4982578, -2.780138, 0, 0, 1, 1, 1,
-0.5537292, -0.7600542, -1.766238, 1, 0, 0, 1, 1,
-0.5495499, -1.373549, -4.914479, 1, 0, 0, 1, 1,
-0.5471374, -0.9981385, -3.506279, 1, 0, 0, 1, 1,
-0.544938, 0.9638684, -1.662116, 1, 0, 0, 1, 1,
-0.5419388, 0.1813655, 0.9524311, 1, 0, 0, 1, 1,
-0.5417101, 0.2935791, -0.2408121, 0, 0, 0, 1, 1,
-0.5404641, -0.2991498, -1.6366, 0, 0, 0, 1, 1,
-0.5326145, 2.375807, -1.218699, 0, 0, 0, 1, 1,
-0.5286909, -0.1975797, -3.181032, 0, 0, 0, 1, 1,
-0.5272747, 1.183061, -0.04571706, 0, 0, 0, 1, 1,
-0.5258816, 0.405891, -2.198484, 0, 0, 0, 1, 1,
-0.5256648, 0.9370706, 1.756675, 0, 0, 0, 1, 1,
-0.5245863, 0.05967937, 1.074713, 1, 1, 1, 1, 1,
-0.5238943, 0.9084491, 0.0397741, 1, 1, 1, 1, 1,
-0.5135776, 0.02227009, -1.381916, 1, 1, 1, 1, 1,
-0.5119539, 0.7546942, 0.2308975, 1, 1, 1, 1, 1,
-0.5089901, 0.596644, -1.840531, 1, 1, 1, 1, 1,
-0.5084708, -0.9206652, -2.958177, 1, 1, 1, 1, 1,
-0.504033, -1.066808, -2.765158, 1, 1, 1, 1, 1,
-0.5036509, -0.07823349, -0.3350317, 1, 1, 1, 1, 1,
-0.5010147, -0.04461114, -0.05791008, 1, 1, 1, 1, 1,
-0.4967741, 0.6021823, -0.8855284, 1, 1, 1, 1, 1,
-0.4962315, -0.659236, -4.248849, 1, 1, 1, 1, 1,
-0.4929813, -1.217865, -0.8176447, 1, 1, 1, 1, 1,
-0.490361, 0.7884244, -0.121124, 1, 1, 1, 1, 1,
-0.489993, 0.4668925, 0.4031262, 1, 1, 1, 1, 1,
-0.4864785, -0.4970827, -1.60903, 1, 1, 1, 1, 1,
-0.4818415, 1.022973, -1.379008, 0, 0, 1, 1, 1,
-0.4770417, -0.4110843, -1.584503, 1, 0, 0, 1, 1,
-0.4712407, 0.5546661, 1.030142, 1, 0, 0, 1, 1,
-0.4709538, 0.4926437, -2.004137, 1, 0, 0, 1, 1,
-0.4704423, -2.345259, -3.444998, 1, 0, 0, 1, 1,
-0.4619403, -0.4586049, -2.254051, 1, 0, 0, 1, 1,
-0.4615674, 1.452501, 0.1707408, 0, 0, 0, 1, 1,
-0.4605566, 0.5148978, -0.1942713, 0, 0, 0, 1, 1,
-0.4580847, 1.083126, 0.3879909, 0, 0, 0, 1, 1,
-0.4578508, 0.3775863, -1.014674, 0, 0, 0, 1, 1,
-0.4555206, 0.2858204, -0.200975, 0, 0, 0, 1, 1,
-0.4550606, 1.179503, -0.04798067, 0, 0, 0, 1, 1,
-0.4539314, -0.3595214, -3.441887, 0, 0, 0, 1, 1,
-0.4525563, -0.2935071, -1.575845, 1, 1, 1, 1, 1,
-0.4490397, -1.648846, -2.816648, 1, 1, 1, 1, 1,
-0.4459375, 0.1053568, -1.99831, 1, 1, 1, 1, 1,
-0.4413242, 0.3988319, -0.3775509, 1, 1, 1, 1, 1,
-0.4409273, -0.8499946, -3.257967, 1, 1, 1, 1, 1,
-0.4376751, 1.24072, -0.6370242, 1, 1, 1, 1, 1,
-0.4376063, -0.5499892, -0.8726292, 1, 1, 1, 1, 1,
-0.4367479, -0.2061564, -2.652281, 1, 1, 1, 1, 1,
-0.4337098, -1.669736, -1.532015, 1, 1, 1, 1, 1,
-0.4315588, 1.06536, -1.661811, 1, 1, 1, 1, 1,
-0.4233234, -0.7652251, -0.9950056, 1, 1, 1, 1, 1,
-0.4195855, -1.126216, -2.165543, 1, 1, 1, 1, 1,
-0.4187125, 1.084847, -1.293196, 1, 1, 1, 1, 1,
-0.4155137, -0.0658486, -1.110312, 1, 1, 1, 1, 1,
-0.4143854, 0.4438633, -2.55464, 1, 1, 1, 1, 1,
-0.4130297, -0.6445188, -3.777755, 0, 0, 1, 1, 1,
-0.4116314, 0.01030317, -1.591871, 1, 0, 0, 1, 1,
-0.4086134, 0.3121007, 0.08447409, 1, 0, 0, 1, 1,
-0.4065741, 0.2270926, -1.453381, 1, 0, 0, 1, 1,
-0.4043787, -0.3831423, -0.9899562, 1, 0, 0, 1, 1,
-0.3989413, 0.8200431, -0.1693646, 1, 0, 0, 1, 1,
-0.3967222, 0.08560948, -1.623034, 0, 0, 0, 1, 1,
-0.3959159, 1.992017, 0.6602823, 0, 0, 0, 1, 1,
-0.3941, 0.4439537, -1.545939, 0, 0, 0, 1, 1,
-0.3939963, 0.8175245, 0.4166689, 0, 0, 0, 1, 1,
-0.3934992, 0.5385261, -0.7600985, 0, 0, 0, 1, 1,
-0.3934719, -0.422956, -4.634806, 0, 0, 0, 1, 1,
-0.3884981, -1.254406, -1.186793, 0, 0, 0, 1, 1,
-0.3866906, -0.2835425, -3.376817, 1, 1, 1, 1, 1,
-0.3851059, -0.1511896, -1.354436, 1, 1, 1, 1, 1,
-0.3813856, 1.020468, -2.163363, 1, 1, 1, 1, 1,
-0.3809235, -0.9883873, -2.021701, 1, 1, 1, 1, 1,
-0.3781314, -0.2277504, -1.712102, 1, 1, 1, 1, 1,
-0.3778693, -1.522578, -4.874581, 1, 1, 1, 1, 1,
-0.3769845, -0.6233032, -2.954308, 1, 1, 1, 1, 1,
-0.3743651, 0.5463735, -1.446723, 1, 1, 1, 1, 1,
-0.373691, 0.5954834, 0.2864762, 1, 1, 1, 1, 1,
-0.3731369, 0.8620471, -0.3345437, 1, 1, 1, 1, 1,
-0.3704654, 0.7901114, -0.08656271, 1, 1, 1, 1, 1,
-0.3688102, 0.1341935, -0.9878841, 1, 1, 1, 1, 1,
-0.3680215, 0.2995023, -1.385485, 1, 1, 1, 1, 1,
-0.3662195, -0.6561784, -1.724532, 1, 1, 1, 1, 1,
-0.3565123, -0.01890048, -0.3216649, 1, 1, 1, 1, 1,
-0.3497626, 1.027192, -0.2205275, 0, 0, 1, 1, 1,
-0.347632, -0.5846987, -2.828224, 1, 0, 0, 1, 1,
-0.3437993, -0.194158, -1.62786, 1, 0, 0, 1, 1,
-0.3428017, 1.049238, -1.17235, 1, 0, 0, 1, 1,
-0.3422036, 1.763956, -0.866398, 1, 0, 0, 1, 1,
-0.3369203, 0.5617862, 0.3708642, 1, 0, 0, 1, 1,
-0.3357273, 0.02619579, -3.35091, 0, 0, 0, 1, 1,
-0.3332996, 0.2318105, -1.151998, 0, 0, 0, 1, 1,
-0.332125, 0.4912823, -2.239161, 0, 0, 0, 1, 1,
-0.3295143, 0.7096694, -1.285063, 0, 0, 0, 1, 1,
-0.3273717, 1.226732, 0.24515, 0, 0, 0, 1, 1,
-0.3235462, 0.4722831, -0.2060413, 0, 0, 0, 1, 1,
-0.3226776, -0.7811052, -2.427873, 0, 0, 0, 1, 1,
-0.3226738, 1.393522, -2.42599, 1, 1, 1, 1, 1,
-0.3185659, -0.4314921, -4.294038, 1, 1, 1, 1, 1,
-0.3171173, -0.06355713, -2.73815, 1, 1, 1, 1, 1,
-0.3162562, 0.3598104, 0.7612531, 1, 1, 1, 1, 1,
-0.3157467, -1.774851, -4.434961, 1, 1, 1, 1, 1,
-0.3135986, -0.1618198, -2.83525, 1, 1, 1, 1, 1,
-0.306672, 0.919554, 0.5078511, 1, 1, 1, 1, 1,
-0.3051879, -0.03382492, -1.690686, 1, 1, 1, 1, 1,
-0.3017487, -0.3354205, -2.348852, 1, 1, 1, 1, 1,
-0.2961258, 0.8647546, -0.4158307, 1, 1, 1, 1, 1,
-0.2957422, -1.001539, -2.894839, 1, 1, 1, 1, 1,
-0.294273, 0.6690672, -2.101763, 1, 1, 1, 1, 1,
-0.2937711, -0.191015, -0.8953404, 1, 1, 1, 1, 1,
-0.2904949, -0.2178333, -1.488675, 1, 1, 1, 1, 1,
-0.2863106, 1.683725, -0.422243, 1, 1, 1, 1, 1,
-0.286121, -0.2066925, -1.358379, 0, 0, 1, 1, 1,
-0.2786373, -1.036041, -4.115215, 1, 0, 0, 1, 1,
-0.2695161, -0.04681959, -1.228034, 1, 0, 0, 1, 1,
-0.2687154, 2.012717, -1.233086, 1, 0, 0, 1, 1,
-0.266223, -0.7678005, -4.279656, 1, 0, 0, 1, 1,
-0.2648651, -0.2425346, -2.228092, 1, 0, 0, 1, 1,
-0.2625098, 0.4852611, -1.11696, 0, 0, 0, 1, 1,
-0.2623459, -0.5432987, -1.19177, 0, 0, 0, 1, 1,
-0.2592928, 0.4066724, -1.284205, 0, 0, 0, 1, 1,
-0.2585354, -1.591051, -2.171406, 0, 0, 0, 1, 1,
-0.2536486, -0.118818, -1.302158, 0, 0, 0, 1, 1,
-0.2430659, 0.04110872, -1.299834, 0, 0, 0, 1, 1,
-0.2402451, -2.054891, -2.525708, 0, 0, 0, 1, 1,
-0.2385114, 1.304007, -1.93177, 1, 1, 1, 1, 1,
-0.2379566, 2.013992, 0.3494599, 1, 1, 1, 1, 1,
-0.2361719, -0.6915091, -2.438983, 1, 1, 1, 1, 1,
-0.2282166, 1.475208, -0.3988155, 1, 1, 1, 1, 1,
-0.2194203, -0.6028534, -4.541782, 1, 1, 1, 1, 1,
-0.212249, -0.291399, -3.644129, 1, 1, 1, 1, 1,
-0.209163, -0.1182053, -1.759819, 1, 1, 1, 1, 1,
-0.2067657, 1.099661, -0.4235108, 1, 1, 1, 1, 1,
-0.2063212, -1.186901, -0.3236697, 1, 1, 1, 1, 1,
-0.206245, 0.1849267, -1.391826, 1, 1, 1, 1, 1,
-0.2033833, 0.1066975, -2.082434, 1, 1, 1, 1, 1,
-0.2028292, -0.7811801, -3.301828, 1, 1, 1, 1, 1,
-0.2004614, -0.02493773, -2.048992, 1, 1, 1, 1, 1,
-0.1992914, -2.006891, -2.294676, 1, 1, 1, 1, 1,
-0.1979447, 0.6589234, 1.038059, 1, 1, 1, 1, 1,
-0.1950867, -0.1352971, -1.982279, 0, 0, 1, 1, 1,
-0.1945903, -1.075343, -3.756566, 1, 0, 0, 1, 1,
-0.1929116, -1.329783, -5.02415, 1, 0, 0, 1, 1,
-0.1910776, -0.9201496, -2.157838, 1, 0, 0, 1, 1,
-0.1867464, -0.7631145, -1.887968, 1, 0, 0, 1, 1,
-0.1846208, -0.1920167, -1.405926, 1, 0, 0, 1, 1,
-0.1797984, 0.6870751, -0.2631193, 0, 0, 0, 1, 1,
-0.1787166, -0.397939, -1.104385, 0, 0, 0, 1, 1,
-0.1779332, 0.1250591, -1.144354, 0, 0, 0, 1, 1,
-0.1735475, -0.2754201, -1.425613, 0, 0, 0, 1, 1,
-0.1721359, -2.945332, -4.729127, 0, 0, 0, 1, 1,
-0.1720501, -2.938802, -4.78233, 0, 0, 0, 1, 1,
-0.1673736, 0.7873578, -0.02919088, 0, 0, 0, 1, 1,
-0.1640071, 1.2937, -0.84378, 1, 1, 1, 1, 1,
-0.1638351, -0.3440414, -2.330791, 1, 1, 1, 1, 1,
-0.1620222, 0.1407823, -0.2747647, 1, 1, 1, 1, 1,
-0.1609237, 1.032648, -0.8905483, 1, 1, 1, 1, 1,
-0.1534234, -0.1618179, -3.436699, 1, 1, 1, 1, 1,
-0.1421277, -0.124134, -1.948173, 1, 1, 1, 1, 1,
-0.1388037, 0.1887384, -0.819461, 1, 1, 1, 1, 1,
-0.1376905, 1.402199, 1.472699, 1, 1, 1, 1, 1,
-0.134813, 0.3939513, -0.7173572, 1, 1, 1, 1, 1,
-0.1340138, -1.081796, -3.127073, 1, 1, 1, 1, 1,
-0.1314061, -0.1788653, -2.498965, 1, 1, 1, 1, 1,
-0.1274353, 1.359318, -0.4309115, 1, 1, 1, 1, 1,
-0.1250297, 1.93897, -0.7903738, 1, 1, 1, 1, 1,
-0.1249242, -0.5924333, -4.225462, 1, 1, 1, 1, 1,
-0.1199953, 0.8608007, -0.6906711, 1, 1, 1, 1, 1,
-0.1183358, 1.15022, -2.063669, 0, 0, 1, 1, 1,
-0.118107, 1.86823, 1.015987, 1, 0, 0, 1, 1,
-0.1178792, -0.728813, -2.875356, 1, 0, 0, 1, 1,
-0.1153536, 1.110667, -0.3098679, 1, 0, 0, 1, 1,
-0.1129578, 0.3920448, -0.2392789, 1, 0, 0, 1, 1,
-0.1122062, -0.1028506, -1.42064, 1, 0, 0, 1, 1,
-0.1085947, 1.423518, 0.7513037, 0, 0, 0, 1, 1,
-0.1082914, -0.3849366, -3.070698, 0, 0, 0, 1, 1,
-0.1067177, -0.5253939, -3.415553, 0, 0, 0, 1, 1,
-0.1064449, -0.6198022, -3.27553, 0, 0, 0, 1, 1,
-0.1049211, 0.2654621, -0.06883219, 0, 0, 0, 1, 1,
-0.1026046, 2.381412, 0.02269123, 0, 0, 0, 1, 1,
-0.1017895, 0.06184879, -0.5820457, 0, 0, 0, 1, 1,
-0.1004797, -0.06690091, -2.874325, 1, 1, 1, 1, 1,
-0.09328625, 0.7182547, -0.2693884, 1, 1, 1, 1, 1,
-0.0892248, 0.1599296, 0.2495067, 1, 1, 1, 1, 1,
-0.08827081, -0.838064, -2.932815, 1, 1, 1, 1, 1,
-0.08658806, 0.194123, -1.338398, 1, 1, 1, 1, 1,
-0.08527964, -0.2231433, -3.23008, 1, 1, 1, 1, 1,
-0.07782175, 0.3861258, -1.387942, 1, 1, 1, 1, 1,
-0.07662632, -0.6087611, -2.374665, 1, 1, 1, 1, 1,
-0.07479724, -0.9365287, -4.003318, 1, 1, 1, 1, 1,
-0.07463266, 0.7540273, 0.2956356, 1, 1, 1, 1, 1,
-0.0738276, 0.2135487, -0.4150931, 1, 1, 1, 1, 1,
-0.0726447, -0.7643374, -1.681816, 1, 1, 1, 1, 1,
-0.07220427, -1.34556, -3.475436, 1, 1, 1, 1, 1,
-0.07080936, 1.299045, -0.6064782, 1, 1, 1, 1, 1,
-0.06945986, 1.029194, 0.1083805, 1, 1, 1, 1, 1,
-0.06668232, -1.269566, -3.373427, 0, 0, 1, 1, 1,
-0.06521162, 0.8509714, -0.6475638, 1, 0, 0, 1, 1,
-0.06362033, 1.669266, 0.2393873, 1, 0, 0, 1, 1,
-0.05957265, 0.4081178, 0.03588369, 1, 0, 0, 1, 1,
-0.05913045, -1.061545, -2.566344, 1, 0, 0, 1, 1,
-0.05904593, 0.9261717, 1.014298, 1, 0, 0, 1, 1,
-0.05895826, 0.713048, -0.03090285, 0, 0, 0, 1, 1,
-0.05882629, -0.7256145, -3.630799, 0, 0, 0, 1, 1,
-0.05871902, -1.3829, -3.590708, 0, 0, 0, 1, 1,
-0.05779979, 0.6147234, 0.1502131, 0, 0, 0, 1, 1,
-0.0502721, -1.282451, -3.298954, 0, 0, 0, 1, 1,
-0.04932922, 0.9596121, -0.580719, 0, 0, 0, 1, 1,
-0.04828741, -0.548824, -4.983946, 0, 0, 0, 1, 1,
-0.04737055, 1.813925, -0.4135551, 1, 1, 1, 1, 1,
-0.04538597, 0.2963309, -0.1709459, 1, 1, 1, 1, 1,
-0.04470964, 0.3313313, -1.748746, 1, 1, 1, 1, 1,
-0.04313274, -0.735179, -3.253929, 1, 1, 1, 1, 1,
-0.04190995, 0.7775146, -1.818807, 1, 1, 1, 1, 1,
-0.04088138, 1.885714, -0.1109296, 1, 1, 1, 1, 1,
-0.03955267, -0.1754351, -3.013163, 1, 1, 1, 1, 1,
-0.03874583, 1.047346, -0.9109555, 1, 1, 1, 1, 1,
-0.03807588, -0.8014284, -3.313485, 1, 1, 1, 1, 1,
-0.02663874, 1.265308, 0.3884948, 1, 1, 1, 1, 1,
-0.02319233, -0.9041479, -3.623531, 1, 1, 1, 1, 1,
-0.02261056, 0.5253736, 0.08175071, 1, 1, 1, 1, 1,
-0.02226347, -0.666488, -3.70617, 1, 1, 1, 1, 1,
-0.01387734, 0.8713171, -2.22918, 1, 1, 1, 1, 1,
-0.01312551, -1.81827, -3.806764, 1, 1, 1, 1, 1,
-0.006134965, -0.01626413, -4.039806, 0, 0, 1, 1, 1,
-0.003926736, 0.6796822, 0.1270187, 1, 0, 0, 1, 1,
-0.003092354, -0.9102053, -4.263528, 1, 0, 0, 1, 1,
-0.002891517, -0.1593418, -2.346904, 1, 0, 0, 1, 1,
-0.002283984, -1.078897, -4.252157, 1, 0, 0, 1, 1,
-0.0005678549, -0.06056567, -3.863673, 1, 0, 0, 1, 1,
0.004928003, 0.09779128, 0.3941419, 0, 0, 0, 1, 1,
0.005850923, 1.10034, 0.7707227, 0, 0, 0, 1, 1,
0.007413261, -0.5872395, 2.936034, 0, 0, 0, 1, 1,
0.007934545, 0.6147408, 1.111116, 0, 0, 0, 1, 1,
0.01266829, -1.001117, 2.711433, 0, 0, 0, 1, 1,
0.01509807, -1.101924, 3.536636, 0, 0, 0, 1, 1,
0.0163755, -1.067313, 3.20018, 0, 0, 0, 1, 1,
0.02045171, -0.07437343, 3.195487, 1, 1, 1, 1, 1,
0.02173634, -1.437498, 1.196429, 1, 1, 1, 1, 1,
0.0224119, 0.5682821, 0.2692036, 1, 1, 1, 1, 1,
0.02582043, -0.5301974, 5.524293, 1, 1, 1, 1, 1,
0.02839257, -0.2650861, 4.250211, 1, 1, 1, 1, 1,
0.03289835, -2.146464, 1.263695, 1, 1, 1, 1, 1,
0.03511862, 0.3831434, 1.009634, 1, 1, 1, 1, 1,
0.03730617, 0.6099517, 1.705148, 1, 1, 1, 1, 1,
0.04039524, 0.4085429, 0.2235977, 1, 1, 1, 1, 1,
0.0417517, 0.4964068, -1.136829, 1, 1, 1, 1, 1,
0.04518814, -0.102505, 2.083086, 1, 1, 1, 1, 1,
0.04726943, -0.3944637, 2.910475, 1, 1, 1, 1, 1,
0.04796553, 0.6605831, -1.176026, 1, 1, 1, 1, 1,
0.04966528, 0.744378, -1.183368, 1, 1, 1, 1, 1,
0.05264811, 0.2987608, 0.7507387, 1, 1, 1, 1, 1,
0.05273392, -0.3350433, 3.725194, 0, 0, 1, 1, 1,
0.05445765, -0.02628156, 1.8442, 1, 0, 0, 1, 1,
0.05636254, -0.1387273, 4.322836, 1, 0, 0, 1, 1,
0.05831443, 1.649395, -2.307685, 1, 0, 0, 1, 1,
0.05886404, 0.8258664, -1.514033, 1, 0, 0, 1, 1,
0.06607246, 0.15351, 0.9944153, 1, 0, 0, 1, 1,
0.0666219, -0.6888368, 3.148278, 0, 0, 0, 1, 1,
0.0716746, -0.5415735, 2.952075, 0, 0, 0, 1, 1,
0.08556854, 1.152226, 2.133089, 0, 0, 0, 1, 1,
0.08602837, -0.252357, 2.040994, 0, 0, 0, 1, 1,
0.08884446, -0.3450574, 2.073605, 0, 0, 0, 1, 1,
0.09085386, -0.5680708, 1.776811, 0, 0, 0, 1, 1,
0.09161938, -1.348626, 1.9738, 0, 0, 0, 1, 1,
0.09327774, 0.106857, 1.95723, 1, 1, 1, 1, 1,
0.09741247, 0.8169208, 0.4686158, 1, 1, 1, 1, 1,
0.104164, 1.313133, -0.5719063, 1, 1, 1, 1, 1,
0.1048503, -2.182303, 3.412232, 1, 1, 1, 1, 1,
0.1057737, 0.05636989, 2.107882, 1, 1, 1, 1, 1,
0.1076669, 1.327877, 0.2971357, 1, 1, 1, 1, 1,
0.1101422, -1.262754, 3.715484, 1, 1, 1, 1, 1,
0.1102947, -1.620949, 3.071103, 1, 1, 1, 1, 1,
0.1197286, -1.004596, 3.53755, 1, 1, 1, 1, 1,
0.1201483, -0.2590962, 3.369973, 1, 1, 1, 1, 1,
0.1229436, 0.8341196, 0.8331757, 1, 1, 1, 1, 1,
0.1236676, 0.4269518, 1.665235, 1, 1, 1, 1, 1,
0.126535, -0.8144299, 2.240813, 1, 1, 1, 1, 1,
0.1284098, -1.291855, 1.163862, 1, 1, 1, 1, 1,
0.1312408, -0.3890664, 4.262269, 1, 1, 1, 1, 1,
0.1328309, -1.292639, 3.439764, 0, 0, 1, 1, 1,
0.1344819, 0.6854042, -0.1501215, 1, 0, 0, 1, 1,
0.1408641, -0.3552538, 4.145732, 1, 0, 0, 1, 1,
0.1464493, 0.661842, 0.3825394, 1, 0, 0, 1, 1,
0.1483888, 0.1644351, 1.055533, 1, 0, 0, 1, 1,
0.1507594, -0.833183, 2.177065, 1, 0, 0, 1, 1,
0.1547925, 1.596267, 1.974516, 0, 0, 0, 1, 1,
0.1562065, -1.012727, 3.612695, 0, 0, 0, 1, 1,
0.1611851, 1.216031, -0.4579273, 0, 0, 0, 1, 1,
0.1657856, -0.6528134, 2.960501, 0, 0, 0, 1, 1,
0.1714648, 0.7745557, 1.392532, 0, 0, 0, 1, 1,
0.1715877, -0.3707688, 4.110721, 0, 0, 0, 1, 1,
0.1732906, 0.5306309, 0.7340338, 0, 0, 0, 1, 1,
0.1767429, -1.281947, 4.672688, 1, 1, 1, 1, 1,
0.1767772, 0.9070628, 0.808719, 1, 1, 1, 1, 1,
0.1809979, -0.7461429, 1.860573, 1, 1, 1, 1, 1,
0.1821597, -0.884598, 2.618086, 1, 1, 1, 1, 1,
0.1841747, 0.8687031, 0.7722964, 1, 1, 1, 1, 1,
0.1842516, 0.01290447, 2.198122, 1, 1, 1, 1, 1,
0.1847832, -0.9662606, 4.119198, 1, 1, 1, 1, 1,
0.1957132, -0.6729493, 2.664621, 1, 1, 1, 1, 1,
0.1962537, -0.2245098, 1.893829, 1, 1, 1, 1, 1,
0.1967673, 1.168628, -0.0697863, 1, 1, 1, 1, 1,
0.1992713, -0.8139018, 1.573829, 1, 1, 1, 1, 1,
0.1999559, 0.9880853, 0.6765208, 1, 1, 1, 1, 1,
0.2003853, -1.118048, 2.319574, 1, 1, 1, 1, 1,
0.2009842, -0.2459526, 2.941708, 1, 1, 1, 1, 1,
0.2051101, -1.200796, 0.8525167, 1, 1, 1, 1, 1,
0.2063854, 0.8679399, 0.5514863, 0, 0, 1, 1, 1,
0.2074438, -0.4131333, 1.475541, 1, 0, 0, 1, 1,
0.2094988, -1.025999, 3.644481, 1, 0, 0, 1, 1,
0.210894, -1.55438, 2.853054, 1, 0, 0, 1, 1,
0.2111617, -1.011804, 3.313406, 1, 0, 0, 1, 1,
0.2122947, -0.4455925, 3.91017, 1, 0, 0, 1, 1,
0.2123559, 0.005371803, 3.165334, 0, 0, 0, 1, 1,
0.2146071, 0.6000928, -0.3894936, 0, 0, 0, 1, 1,
0.2147343, -0.7536745, 1.19827, 0, 0, 0, 1, 1,
0.216319, 0.3268248, 0.8770574, 0, 0, 0, 1, 1,
0.2179071, -0.2510355, 2.138637, 0, 0, 0, 1, 1,
0.2199922, 0.04705015, 1.453987, 0, 0, 0, 1, 1,
0.220433, 0.8364938, 0.06903376, 0, 0, 0, 1, 1,
0.222239, -0.4087649, 2.399413, 1, 1, 1, 1, 1,
0.2283287, 0.3810404, -0.7991354, 1, 1, 1, 1, 1,
0.2300783, -0.9055659, 4.106181, 1, 1, 1, 1, 1,
0.2353922, 0.2500145, 1.861278, 1, 1, 1, 1, 1,
0.239062, 1.68631, 0.2928434, 1, 1, 1, 1, 1,
0.2442271, 0.1220698, 0.998941, 1, 1, 1, 1, 1,
0.2477794, -0.6189127, 4.085806, 1, 1, 1, 1, 1,
0.2477977, 0.006630181, 2.415173, 1, 1, 1, 1, 1,
0.2495491, 0.8288094, 0.3291587, 1, 1, 1, 1, 1,
0.2495747, -0.3692738, 3.623855, 1, 1, 1, 1, 1,
0.2510361, 0.4498625, -1.576131, 1, 1, 1, 1, 1,
0.2515413, 1.814333, 2.091904, 1, 1, 1, 1, 1,
0.2551219, 0.7031411, 1.541861, 1, 1, 1, 1, 1,
0.2562831, -1.085208, 4.337108, 1, 1, 1, 1, 1,
0.2564768, -0.3027989, 1.61891, 1, 1, 1, 1, 1,
0.2575163, -0.2141487, 3.884136, 0, 0, 1, 1, 1,
0.258808, 0.6425577, 0.4368462, 1, 0, 0, 1, 1,
0.2615651, -2.134, 2.339333, 1, 0, 0, 1, 1,
0.2643293, -0.7958779, 1.774434, 1, 0, 0, 1, 1,
0.2666547, -1.628945, 3.147009, 1, 0, 0, 1, 1,
0.2671525, -1.562488, 1.556531, 1, 0, 0, 1, 1,
0.2688723, -0.01732465, 3.32469, 0, 0, 0, 1, 1,
0.2708955, 0.5857543, 0.644742, 0, 0, 0, 1, 1,
0.2720648, 0.04906134, -1.177956, 0, 0, 0, 1, 1,
0.2751985, -1.314079, 3.029913, 0, 0, 0, 1, 1,
0.2759737, -2.160661, 2.677059, 0, 0, 0, 1, 1,
0.2781372, 0.7879826, -1.144532, 0, 0, 0, 1, 1,
0.2818115, -0.4648768, 2.456291, 0, 0, 0, 1, 1,
0.2823598, 1.101708, -0.8050861, 1, 1, 1, 1, 1,
0.2828229, -0.5483406, 4.411162, 1, 1, 1, 1, 1,
0.2850414, 0.9299669, 1.595163, 1, 1, 1, 1, 1,
0.2915917, -1.061117, 1.779169, 1, 1, 1, 1, 1,
0.2999958, 0.324245, 1.16571, 1, 1, 1, 1, 1,
0.3046328, 0.5892791, 1.580859, 1, 1, 1, 1, 1,
0.3050165, 0.4655253, 0.6309505, 1, 1, 1, 1, 1,
0.3077179, 0.510325, -0.5418949, 1, 1, 1, 1, 1,
0.3087555, 0.02022757, 1.596736, 1, 1, 1, 1, 1,
0.313155, 0.901139, 2.88958, 1, 1, 1, 1, 1,
0.317046, 1.708767, -0.3082128, 1, 1, 1, 1, 1,
0.3221807, -0.8244954, 1.224717, 1, 1, 1, 1, 1,
0.3238682, -0.9915307, 1.424928, 1, 1, 1, 1, 1,
0.3246807, 1.713298, 0.2278655, 1, 1, 1, 1, 1,
0.3289292, -0.9252533, 2.045924, 1, 1, 1, 1, 1,
0.3298483, -0.2823666, 2.404608, 0, 0, 1, 1, 1,
0.3318399, 1.09559, 0.7637506, 1, 0, 0, 1, 1,
0.3358538, 0.08688752, 1.024121, 1, 0, 0, 1, 1,
0.3364913, -0.09606016, 1.61273, 1, 0, 0, 1, 1,
0.3381644, -2.039615, 1.95113, 1, 0, 0, 1, 1,
0.339721, -0.375676, 3.25054, 1, 0, 0, 1, 1,
0.3462521, -0.4210608, 2.65179, 0, 0, 0, 1, 1,
0.349061, 1.006847, 1.562529, 0, 0, 0, 1, 1,
0.3504292, 0.8931477, 0.2363133, 0, 0, 0, 1, 1,
0.3518431, 0.5838853, 1.113653, 0, 0, 0, 1, 1,
0.3531131, 0.08009978, 0.9474362, 0, 0, 0, 1, 1,
0.3551438, -0.1769712, 1.530654, 0, 0, 0, 1, 1,
0.3569074, -0.9312457, 2.314488, 0, 0, 0, 1, 1,
0.357364, 2.792269, -0.8715171, 1, 1, 1, 1, 1,
0.3648923, 0.4088471, -0.09106342, 1, 1, 1, 1, 1,
0.3701515, 1.168405, 1.319797, 1, 1, 1, 1, 1,
0.3703176, 0.9853023, -0.9361507, 1, 1, 1, 1, 1,
0.3710447, 0.09825607, 0.5331819, 1, 1, 1, 1, 1,
0.3763838, 1.328861, -0.2488836, 1, 1, 1, 1, 1,
0.3846498, 0.6476089, 0.9847003, 1, 1, 1, 1, 1,
0.3851421, -1.839129, 3.470277, 1, 1, 1, 1, 1,
0.3858086, 0.5556666, 1.404875, 1, 1, 1, 1, 1,
0.3873803, -1.743861, 2.912011, 1, 1, 1, 1, 1,
0.3887211, 0.8866462, 1.535477, 1, 1, 1, 1, 1,
0.3892929, 2.183471, 1.310791, 1, 1, 1, 1, 1,
0.3898866, -0.6288266, 1.146816, 1, 1, 1, 1, 1,
0.3930937, 1.468952, -0.4554153, 1, 1, 1, 1, 1,
0.395688, 0.8696503, -1.579367, 1, 1, 1, 1, 1,
0.3965493, 1.138885, 0.2915892, 0, 0, 1, 1, 1,
0.3987858, -0.4181353, 2.588419, 1, 0, 0, 1, 1,
0.400773, -0.5938985, 3.179026, 1, 0, 0, 1, 1,
0.4012075, 0.02619114, 0.6763967, 1, 0, 0, 1, 1,
0.4031755, -1.765629, 2.625386, 1, 0, 0, 1, 1,
0.4063718, -0.5751128, 2.696789, 1, 0, 0, 1, 1,
0.4078538, 0.1137694, 1.974343, 0, 0, 0, 1, 1,
0.4099102, 0.3185303, 1.113532, 0, 0, 0, 1, 1,
0.4114338, -0.005190867, 0.9590662, 0, 0, 0, 1, 1,
0.4127048, 0.2644776, 0.6387188, 0, 0, 0, 1, 1,
0.4127872, 0.7064838, 0.553126, 0, 0, 0, 1, 1,
0.4349543, 0.6588526, 0.7897531, 0, 0, 0, 1, 1,
0.4362611, -0.9213732, 3.414002, 0, 0, 0, 1, 1,
0.4369099, -0.6104091, 3.931627, 1, 1, 1, 1, 1,
0.4375331, -0.3388518, 1.813798, 1, 1, 1, 1, 1,
0.4385885, 0.3773778, 0.976558, 1, 1, 1, 1, 1,
0.4396669, -0.1689682, 1.320693, 1, 1, 1, 1, 1,
0.4414879, -0.7055169, 2.147571, 1, 1, 1, 1, 1,
0.4436736, -0.4272079, 2.642242, 1, 1, 1, 1, 1,
0.4448583, 0.3160073, 1.480116, 1, 1, 1, 1, 1,
0.4463795, -0.7043648, 2.994383, 1, 1, 1, 1, 1,
0.4483454, -0.930425, 4.521513, 1, 1, 1, 1, 1,
0.4488154, -2.450489, 3.355895, 1, 1, 1, 1, 1,
0.4515456, -1.771921, 2.481863, 1, 1, 1, 1, 1,
0.4544615, 0.5346013, -0.06796503, 1, 1, 1, 1, 1,
0.4551241, -0.2770254, 2.427729, 1, 1, 1, 1, 1,
0.457731, 0.3378878, 0.8411297, 1, 1, 1, 1, 1,
0.4679149, 1.203034, -0.3280457, 1, 1, 1, 1, 1,
0.4816621, 0.5173211, 0.4835701, 0, 0, 1, 1, 1,
0.4874426, 0.1300461, 2.716952, 1, 0, 0, 1, 1,
0.4896923, -0.6847996, 2.445736, 1, 0, 0, 1, 1,
0.4912865, 1.203462, 1.345535, 1, 0, 0, 1, 1,
0.4988245, 0.6381881, 1.602001, 1, 0, 0, 1, 1,
0.4993942, 0.0951013, 1.540027, 1, 0, 0, 1, 1,
0.4997505, 0.7768053, 0.211098, 0, 0, 0, 1, 1,
0.5010574, -0.09987433, 1.157172, 0, 0, 0, 1, 1,
0.5019374, -1.468673, 2.884695, 0, 0, 0, 1, 1,
0.5025955, -0.8855868, 2.08673, 0, 0, 0, 1, 1,
0.5046601, -0.7247858, 1.913407, 0, 0, 0, 1, 1,
0.5072655, 1.370739, 1.212868, 0, 0, 0, 1, 1,
0.5085553, -1.867485, 2.386635, 0, 0, 0, 1, 1,
0.5101218, -0.7994412, 3.420579, 1, 1, 1, 1, 1,
0.5139199, 0.9722187, 0.07630394, 1, 1, 1, 1, 1,
0.5166665, -0.6932105, 2.790483, 1, 1, 1, 1, 1,
0.5229811, 1.002862, -0.9836777, 1, 1, 1, 1, 1,
0.5244117, 1.395853, 2.001534, 1, 1, 1, 1, 1,
0.5300496, -1.092721, 2.214276, 1, 1, 1, 1, 1,
0.5300661, -1.146095, 0.4017592, 1, 1, 1, 1, 1,
0.5325838, 0.03685045, 1.546508, 1, 1, 1, 1, 1,
0.537024, -3.290824, 4.217022, 1, 1, 1, 1, 1,
0.5399247, -0.2692529, 2.10953, 1, 1, 1, 1, 1,
0.5415157, -0.5218777, 1.354437, 1, 1, 1, 1, 1,
0.5446154, 0.1963979, 0.1890375, 1, 1, 1, 1, 1,
0.5460054, -0.6165616, 2.179586, 1, 1, 1, 1, 1,
0.5525922, -1.156918, 2.866463, 1, 1, 1, 1, 1,
0.5602283, -0.6742041, 0.772764, 1, 1, 1, 1, 1,
0.5610417, -1.329, 2.71947, 0, 0, 1, 1, 1,
0.5618983, -0.6284163, 2.406973, 1, 0, 0, 1, 1,
0.5655305, -1.518865, 3.469679, 1, 0, 0, 1, 1,
0.5669066, 0.1065671, 1.455923, 1, 0, 0, 1, 1,
0.5672514, 1.008192, -0.05007005, 1, 0, 0, 1, 1,
0.5685878, 1.124378, -0.3545696, 1, 0, 0, 1, 1,
0.5704093, 1.521063, 1.710948, 0, 0, 0, 1, 1,
0.5723224, -1.991529, 1.894565, 0, 0, 0, 1, 1,
0.5727234, -1.537533, 1.934063, 0, 0, 0, 1, 1,
0.5767165, -1.149684, 1.128868, 0, 0, 0, 1, 1,
0.5831941, -0.1566129, 2.484657, 0, 0, 0, 1, 1,
0.5840878, -1.916047, 1.749997, 0, 0, 0, 1, 1,
0.5901209, -1.477383, 3.026777, 0, 0, 0, 1, 1,
0.5935987, -0.3861128, 2.114816, 1, 1, 1, 1, 1,
0.5962389, -0.3573841, 3.889722, 1, 1, 1, 1, 1,
0.5985881, -1.146779, 3.640394, 1, 1, 1, 1, 1,
0.599049, -0.9558868, 1.814356, 1, 1, 1, 1, 1,
0.5997005, 1.302552, 0.6616093, 1, 1, 1, 1, 1,
0.6023992, 0.5332852, -0.286424, 1, 1, 1, 1, 1,
0.602979, 0.3889905, 1.84051, 1, 1, 1, 1, 1,
0.6054959, 0.6517013, 0.2482478, 1, 1, 1, 1, 1,
0.6060105, 2.154485, 1.723175, 1, 1, 1, 1, 1,
0.6094015, -0.4573907, 3.290021, 1, 1, 1, 1, 1,
0.611401, -2.657215, 4.540485, 1, 1, 1, 1, 1,
0.6152928, -0.27632, 3.346197, 1, 1, 1, 1, 1,
0.6154277, -0.666735, 2.679035, 1, 1, 1, 1, 1,
0.6160737, 0.03974007, -0.1312839, 1, 1, 1, 1, 1,
0.628129, -1.078631, 2.935842, 1, 1, 1, 1, 1,
0.6283737, -0.4606686, 1.952975, 0, 0, 1, 1, 1,
0.6310666, -1.320526, 1.62314, 1, 0, 0, 1, 1,
0.6401405, 1.246152, -0.9360009, 1, 0, 0, 1, 1,
0.6406482, 1.242905, 2.246957, 1, 0, 0, 1, 1,
0.6479946, -0.884535, 2.853672, 1, 0, 0, 1, 1,
0.6595621, -0.1158686, 1.566751, 1, 0, 0, 1, 1,
0.6598705, 0.08457018, 0.6869024, 0, 0, 0, 1, 1,
0.6624203, -0.8905258, 4.134224, 0, 0, 0, 1, 1,
0.6678431, -0.9182206, 3.035266, 0, 0, 0, 1, 1,
0.6685518, 1.683832, -0.4699001, 0, 0, 0, 1, 1,
0.6710242, -0.3919338, 2.996629, 0, 0, 0, 1, 1,
0.6712824, -0.291929, 2.297508, 0, 0, 0, 1, 1,
0.6718286, -0.9083818, 2.173413, 0, 0, 0, 1, 1,
0.6768216, -0.03578129, 2.169541, 1, 1, 1, 1, 1,
0.6784512, 0.7728379, 2.504309, 1, 1, 1, 1, 1,
0.6824248, -2.549809, 3.221726, 1, 1, 1, 1, 1,
0.6843874, 0.4049945, -0.0297604, 1, 1, 1, 1, 1,
0.6934069, 0.3981219, 0.7113975, 1, 1, 1, 1, 1,
0.6969379, -0.882268, 3.178522, 1, 1, 1, 1, 1,
0.6984141, -0.4236454, 2.099076, 1, 1, 1, 1, 1,
0.7039499, 0.5774474, -0.1209783, 1, 1, 1, 1, 1,
0.7044955, 0.7582169, 1.973245, 1, 1, 1, 1, 1,
0.7050974, -0.7936351, 2.558459, 1, 1, 1, 1, 1,
0.7091794, 0.9875026, 2.383362, 1, 1, 1, 1, 1,
0.7130265, -0.5863064, 1.53759, 1, 1, 1, 1, 1,
0.7148184, -0.06559316, 1.254076, 1, 1, 1, 1, 1,
0.7219533, 0.322264, 1.29502, 1, 1, 1, 1, 1,
0.7226766, -1.787404, 2.203846, 1, 1, 1, 1, 1,
0.7231967, 1.099234, -0.2419134, 0, 0, 1, 1, 1,
0.7245539, 0.7786582, 0.4895971, 1, 0, 0, 1, 1,
0.7248314, -0.3291707, 2.19948, 1, 0, 0, 1, 1,
0.7249441, 1.752226, 0.7706194, 1, 0, 0, 1, 1,
0.7320608, 0.1989036, 1.568483, 1, 0, 0, 1, 1,
0.733613, 0.8171099, -0.06483473, 1, 0, 0, 1, 1,
0.7375979, -0.9185694, 2.822937, 0, 0, 0, 1, 1,
0.7382072, -0.5043383, 2.128039, 0, 0, 0, 1, 1,
0.7395546, -0.3093669, 2.139539, 0, 0, 0, 1, 1,
0.7417747, 0.534738, 1.295681, 0, 0, 0, 1, 1,
0.7483653, 1.47667, -0.5299936, 0, 0, 0, 1, 1,
0.7552006, -1.323712, 1.844837, 0, 0, 0, 1, 1,
0.7590498, -2.085676, 2.853302, 0, 0, 0, 1, 1,
0.7634232, -1.423416, 3.198306, 1, 1, 1, 1, 1,
0.7643943, 0.9936796, 0.6414097, 1, 1, 1, 1, 1,
0.7679817, -0.7549872, 2.402981, 1, 1, 1, 1, 1,
0.770817, 0.01093091, 1.623305, 1, 1, 1, 1, 1,
0.7721064, -0.05729005, -0.1974376, 1, 1, 1, 1, 1,
0.7724181, 1.81629, -0.3321678, 1, 1, 1, 1, 1,
0.773747, 0.6821948, 3.041077, 1, 1, 1, 1, 1,
0.7792677, 0.3106385, 1.331006, 1, 1, 1, 1, 1,
0.7813696, 1.319994, 0.8291269, 1, 1, 1, 1, 1,
0.7833866, 1.350378, -0.4075721, 1, 1, 1, 1, 1,
0.7850738, -0.03741577, 1.712902, 1, 1, 1, 1, 1,
0.7889793, 1.445468, -0.1743353, 1, 1, 1, 1, 1,
0.7902386, -0.3080403, 4.089363, 1, 1, 1, 1, 1,
0.7971326, -0.690532, 1.927491, 1, 1, 1, 1, 1,
0.7978034, 0.03940735, 2.468862, 1, 1, 1, 1, 1,
0.8017896, -1.780673, 3.997349, 0, 0, 1, 1, 1,
0.8106277, -0.1115247, 0.8825811, 1, 0, 0, 1, 1,
0.8132576, -2.660919, 3.390842, 1, 0, 0, 1, 1,
0.8163424, 0.5012633, 0.7321783, 1, 0, 0, 1, 1,
0.8211775, -0.07139848, 0.2644779, 1, 0, 0, 1, 1,
0.8219267, 0.7157194, -0.0468864, 1, 0, 0, 1, 1,
0.8226845, 0.4810674, 1.450844, 0, 0, 0, 1, 1,
0.8231368, 0.2668974, 2.534253, 0, 0, 0, 1, 1,
0.823315, -0.4891018, 2.938948, 0, 0, 0, 1, 1,
0.8238136, 0.2002263, 0.3247816, 0, 0, 0, 1, 1,
0.8261415, 1.106455, 1.092756, 0, 0, 0, 1, 1,
0.8292844, -0.327743, 1.932771, 0, 0, 0, 1, 1,
0.8416301, 0.6624169, 2.070313, 0, 0, 0, 1, 1,
0.8469312, -0.409625, 1.54649, 1, 1, 1, 1, 1,
0.8520557, -0.3388946, 0.9032639, 1, 1, 1, 1, 1,
0.8556536, 0.4659978, 0.5257067, 1, 1, 1, 1, 1,
0.8593643, -1.335802, 2.643784, 1, 1, 1, 1, 1,
0.8642522, 0.5922061, 0.2747678, 1, 1, 1, 1, 1,
0.8663561, -0.3746591, 1.303128, 1, 1, 1, 1, 1,
0.8750802, 1.511062, -0.8202084, 1, 1, 1, 1, 1,
0.8798264, -0.2182368, 0.8599142, 1, 1, 1, 1, 1,
0.8830364, -0.6467202, 2.163465, 1, 1, 1, 1, 1,
0.8901352, 0.05810121, 0.8834396, 1, 1, 1, 1, 1,
0.9060522, -0.5626363, 1.588262, 1, 1, 1, 1, 1,
0.9136009, -0.2169366, 1.000342, 1, 1, 1, 1, 1,
0.9145254, 1.002829, 0.1471992, 1, 1, 1, 1, 1,
0.9212982, -0.739044, 0.4466398, 1, 1, 1, 1, 1,
0.9217021, 1.417947, 1.520738, 1, 1, 1, 1, 1,
0.9219156, 0.6182638, 0.8221806, 0, 0, 1, 1, 1,
0.9244637, 1.114837, 1.073446, 1, 0, 0, 1, 1,
0.9274518, -1.792791, 1.874218, 1, 0, 0, 1, 1,
0.928326, -0.5966086, 3.07732, 1, 0, 0, 1, 1,
0.9284795, -0.1339173, 2.491987, 1, 0, 0, 1, 1,
0.9286236, 0.7769321, 0.9968027, 1, 0, 0, 1, 1,
0.9305265, 0.1049876, 1.579473, 0, 0, 0, 1, 1,
0.9311414, -0.1557131, 0.4015539, 0, 0, 0, 1, 1,
0.9363503, 0.2163072, 1.959117, 0, 0, 0, 1, 1,
0.944037, -1.205315, 1.26424, 0, 0, 0, 1, 1,
0.9443669, -1.079011, 3.299678, 0, 0, 0, 1, 1,
0.947868, 0.1836116, 1.755123, 0, 0, 0, 1, 1,
0.951573, -1.42166, 2.37168, 0, 0, 0, 1, 1,
0.9551255, 1.4137, 0.3209615, 1, 1, 1, 1, 1,
0.9593698, 1.095264, 2.018975, 1, 1, 1, 1, 1,
0.963782, -0.4445082, 2.243121, 1, 1, 1, 1, 1,
0.9638953, -1.069678, 3.528258, 1, 1, 1, 1, 1,
0.978534, 1.965874, 1.71698, 1, 1, 1, 1, 1,
0.9826151, -2.240142, 4.884628, 1, 1, 1, 1, 1,
0.9857561, -0.1288707, 2.153236, 1, 1, 1, 1, 1,
0.9926548, 0.3640762, 1.777298, 1, 1, 1, 1, 1,
0.9927936, 0.07703878, 3.305063, 1, 1, 1, 1, 1,
0.9932199, -0.9218717, 1.015189, 1, 1, 1, 1, 1,
1.001231, 0.2579085, 3.488641, 1, 1, 1, 1, 1,
1.002818, -0.05931633, -0.1397394, 1, 1, 1, 1, 1,
1.008378, -0.2955052, 4.512515, 1, 1, 1, 1, 1,
1.009561, 1.768189, 2.41642, 1, 1, 1, 1, 1,
1.015577, -0.2949263, 1.672537, 1, 1, 1, 1, 1,
1.016476, -0.3173242, 2.02964, 0, 0, 1, 1, 1,
1.020617, 0.006121447, 2.312872, 1, 0, 0, 1, 1,
1.022459, 1.899476, -0.2186821, 1, 0, 0, 1, 1,
1.022911, 1.091198, 0.517118, 1, 0, 0, 1, 1,
1.029078, 0.154189, 0.897512, 1, 0, 0, 1, 1,
1.032156, -1.03752, 2.158054, 1, 0, 0, 1, 1,
1.038026, -0.2203099, 1.95559, 0, 0, 0, 1, 1,
1.044877, -1.711338, 3.884025, 0, 0, 0, 1, 1,
1.045654, 0.899745, 1.885184, 0, 0, 0, 1, 1,
1.050661, 1.704592, 0.8272779, 0, 0, 0, 1, 1,
1.06253, -0.7051316, 2.382281, 0, 0, 0, 1, 1,
1.064084, 0.5949436, 1.962842, 0, 0, 0, 1, 1,
1.066412, -0.3746308, 1.125413, 0, 0, 0, 1, 1,
1.067052, 0.5495307, -0.5289019, 1, 1, 1, 1, 1,
1.067437, 0.6558821, -0.2507691, 1, 1, 1, 1, 1,
1.068719, 0.3990415, 2.156328, 1, 1, 1, 1, 1,
1.073793, 2.549357, 0.3458657, 1, 1, 1, 1, 1,
1.076976, 0.8398556, 1.583318, 1, 1, 1, 1, 1,
1.092911, 0.7993923, 1.007823, 1, 1, 1, 1, 1,
1.098658, -0.09101597, 0.8109913, 1, 1, 1, 1, 1,
1.098861, 1.013232, 0.8376656, 1, 1, 1, 1, 1,
1.099361, -0.1448044, 0.5905371, 1, 1, 1, 1, 1,
1.105044, 0.6186914, 0.8466763, 1, 1, 1, 1, 1,
1.108697, -1.600869, 2.13026, 1, 1, 1, 1, 1,
1.110083, 1.025351, 0.6949183, 1, 1, 1, 1, 1,
1.114143, 0.3645889, 2.763047, 1, 1, 1, 1, 1,
1.120037, 1.8735, -0.6696311, 1, 1, 1, 1, 1,
1.121922, -0.8754956, 2.014464, 1, 1, 1, 1, 1,
1.122727, 0.3387875, 2.809513, 0, 0, 1, 1, 1,
1.123293, -0.3005652, 1.941371, 1, 0, 0, 1, 1,
1.126599, 0.5255815, 0.2640797, 1, 0, 0, 1, 1,
1.131557, -0.6535583, 3.452124, 1, 0, 0, 1, 1,
1.134005, 0.6146684, 1.329867, 1, 0, 0, 1, 1,
1.134208, -0.8403321, 2.426317, 1, 0, 0, 1, 1,
1.135965, 1.923641, -0.2307223, 0, 0, 0, 1, 1,
1.137767, -0.5516743, 2.433515, 0, 0, 0, 1, 1,
1.157046, -1.35457, 1.634001, 0, 0, 0, 1, 1,
1.158907, 1.450934, -0.5815687, 0, 0, 0, 1, 1,
1.165083, 1.183854, 0.5446878, 0, 0, 0, 1, 1,
1.169675, 0.6723009, 1.14899, 0, 0, 0, 1, 1,
1.17283, 0.5504498, 1.996757, 0, 0, 0, 1, 1,
1.175779, -0.3661451, 2.085568, 1, 1, 1, 1, 1,
1.182655, -3.175852, 3.66922, 1, 1, 1, 1, 1,
1.182887, 0.3657823, -0.3640031, 1, 1, 1, 1, 1,
1.185628, 0.2224383, 2.348694, 1, 1, 1, 1, 1,
1.190049, 1.479636, 0.4937986, 1, 1, 1, 1, 1,
1.196392, -0.2921675, 2.602649, 1, 1, 1, 1, 1,
1.199765, -1.147372, 1.243072, 1, 1, 1, 1, 1,
1.200866, 0.09099657, 1.269978, 1, 1, 1, 1, 1,
1.202538, -0.8720912, 2.058833, 1, 1, 1, 1, 1,
1.214944, 1.344288, -0.5276263, 1, 1, 1, 1, 1,
1.218367, -0.4665203, 1.064497, 1, 1, 1, 1, 1,
1.219822, -0.4400449, 1.035654, 1, 1, 1, 1, 1,
1.221046, -0.2086829, 2.38138, 1, 1, 1, 1, 1,
1.221453, 1.313253, 1.14439, 1, 1, 1, 1, 1,
1.221872, 0.2939431, 2.268287, 1, 1, 1, 1, 1,
1.23074, 1.227851, 0.1416116, 0, 0, 1, 1, 1,
1.232785, 0.5099252, 0.2190132, 1, 0, 0, 1, 1,
1.243254, 1.21601, 1.752637, 1, 0, 0, 1, 1,
1.246608, -0.02631864, 1.26356, 1, 0, 0, 1, 1,
1.247594, -0.2555775, 0.9138211, 1, 0, 0, 1, 1,
1.251396, 0.03441177, 1.752301, 1, 0, 0, 1, 1,
1.253734, -0.8604044, 4.035674, 0, 0, 0, 1, 1,
1.283873, -1.102691, 3.037462, 0, 0, 0, 1, 1,
1.293016, -2.518579, 1.252907, 0, 0, 0, 1, 1,
1.293355, 1.845167, 0.1157357, 0, 0, 0, 1, 1,
1.294129, 0.03066097, 1.305634, 0, 0, 0, 1, 1,
1.30088, 0.1100362, 3.015701, 0, 0, 0, 1, 1,
1.307509, 0.6134459, 0.3742078, 0, 0, 0, 1, 1,
1.312977, -0.1405817, 2.438435, 1, 1, 1, 1, 1,
1.313956, 1.090415, 2.015262, 1, 1, 1, 1, 1,
1.318376, -0.9530958, 1.755784, 1, 1, 1, 1, 1,
1.337567, -0.1218332, 0.009986443, 1, 1, 1, 1, 1,
1.339038, 1.505819, -1.014058, 1, 1, 1, 1, 1,
1.342788, 0.2042457, 2.60509, 1, 1, 1, 1, 1,
1.344274, -0.8895497, 1.805865, 1, 1, 1, 1, 1,
1.346151, 0.4973032, 1.559847, 1, 1, 1, 1, 1,
1.34986, -0.3463923, 2.634301, 1, 1, 1, 1, 1,
1.353572, 0.7930954, 4.207363, 1, 1, 1, 1, 1,
1.381642, -0.4697734, 1.273117, 1, 1, 1, 1, 1,
1.385113, -0.9214296, 1.863424, 1, 1, 1, 1, 1,
1.385499, -0.667865, 1.376848, 1, 1, 1, 1, 1,
1.388873, 0.5897076, 2.956722, 1, 1, 1, 1, 1,
1.4132, 1.00141, 0.7325617, 1, 1, 1, 1, 1,
1.414749, 0.4799258, 1.70231, 0, 0, 1, 1, 1,
1.41638, 2.498399, 1.704646, 1, 0, 0, 1, 1,
1.428121, 0.2177763, 1.722364, 1, 0, 0, 1, 1,
1.433264, 0.3863535, 0.6411752, 1, 0, 0, 1, 1,
1.434489, 0.3645874, 2.541315, 1, 0, 0, 1, 1,
1.440665, -0.8559247, 1.614802, 1, 0, 0, 1, 1,
1.460327, -0.3810976, 1.99073, 0, 0, 0, 1, 1,
1.478043, 1.476416, 0.3063292, 0, 0, 0, 1, 1,
1.488438, 1.575841, 1.159858, 0, 0, 0, 1, 1,
1.497805, 0.1445911, -0.8086587, 0, 0, 0, 1, 1,
1.498767, 0.3781954, 1.8481, 0, 0, 0, 1, 1,
1.508142, -0.5430006, 2.394773, 0, 0, 0, 1, 1,
1.521917, 1.581151, -0.3946935, 0, 0, 0, 1, 1,
1.52298, -1.043506, 2.173858, 1, 1, 1, 1, 1,
1.526847, -0.9568357, 2.383246, 1, 1, 1, 1, 1,
1.531691, 0.122259, 0.9603921, 1, 1, 1, 1, 1,
1.534029, 1.52, 2.510284, 1, 1, 1, 1, 1,
1.548779, -0.8388867, 0.9217555, 1, 1, 1, 1, 1,
1.559466, -0.242391, 2.444076, 1, 1, 1, 1, 1,
1.562506, 0.8750879, 2.801179, 1, 1, 1, 1, 1,
1.577202, -1.340997, 2.561757, 1, 1, 1, 1, 1,
1.584604, -0.8910629, 2.63832, 1, 1, 1, 1, 1,
1.592956, 0.7919766, 1.526189, 1, 1, 1, 1, 1,
1.600772, -0.1123116, 2.769795, 1, 1, 1, 1, 1,
1.608571, -1.030354, 1.800877, 1, 1, 1, 1, 1,
1.616319, 1.511007, 0.3629458, 1, 1, 1, 1, 1,
1.624958, -2.946912, 0.7340996, 1, 1, 1, 1, 1,
1.660623, -0.05017278, 0.03554356, 1, 1, 1, 1, 1,
1.6752, 0.2120268, 2.418286, 0, 0, 1, 1, 1,
1.681798, 1.287164, 3.019451, 1, 0, 0, 1, 1,
1.700505, 1.663154, 0.6760764, 1, 0, 0, 1, 1,
1.724003, 0.2117285, 0.9787098, 1, 0, 0, 1, 1,
1.748848, 0.9358518, 1.702397, 1, 0, 0, 1, 1,
1.755534, 1.150573, 0.3826137, 1, 0, 0, 1, 1,
1.756622, 0.7926915, 1.929837, 0, 0, 0, 1, 1,
1.769519, -0.4231201, 1.598612, 0, 0, 0, 1, 1,
1.822216, 0.1580732, 0.6490576, 0, 0, 0, 1, 1,
1.873984, 1.662716, 1.555649, 0, 0, 0, 1, 1,
1.893277, 0.8771097, 0.2945849, 0, 0, 0, 1, 1,
1.894827, -0.9865046, 1.621601, 0, 0, 0, 1, 1,
1.901424, -1.289594, 2.809012, 0, 0, 0, 1, 1,
1.924775, 0.1062846, 1.02024, 1, 1, 1, 1, 1,
1.948359, 2.14502, -1.654509, 1, 1, 1, 1, 1,
1.962367, 0.1984181, 1.09436, 1, 1, 1, 1, 1,
1.96498, -1.103501, 1.377886, 1, 1, 1, 1, 1,
1.969677, 0.8672376, 1.838539, 1, 1, 1, 1, 1,
2.003677, -0.5095266, 2.223152, 1, 1, 1, 1, 1,
2.015001, 0.1697857, 0.6644377, 1, 1, 1, 1, 1,
2.019272, 2.347914, 0.9556872, 1, 1, 1, 1, 1,
2.019993, -1.743638, 2.559916, 1, 1, 1, 1, 1,
2.054272, 1.697022, 2.368111, 1, 1, 1, 1, 1,
2.07488, -0.4423107, 1.818331, 1, 1, 1, 1, 1,
2.076168, 0.2094877, -0.1333984, 1, 1, 1, 1, 1,
2.08295, 0.4087515, 2.083922, 1, 1, 1, 1, 1,
2.107912, 0.04518296, 0.01890673, 1, 1, 1, 1, 1,
2.118806, -0.7837666, 2.861599, 1, 1, 1, 1, 1,
2.171293, 0.8884207, 1.727998, 0, 0, 1, 1, 1,
2.186125, -0.4992128, 2.048839, 1, 0, 0, 1, 1,
2.228241, 0.4752233, 1.41942, 1, 0, 0, 1, 1,
2.231762, 0.3049761, 0.0613773, 1, 0, 0, 1, 1,
2.2392, -0.536863, 0.6195395, 1, 0, 0, 1, 1,
2.240205, 1.069763, 0.8491507, 1, 0, 0, 1, 1,
2.265665, 1.218633, 2.988989, 0, 0, 0, 1, 1,
2.27988, 1.171149, 2.549856, 0, 0, 0, 1, 1,
2.295921, -0.1974557, 0.8497758, 0, 0, 0, 1, 1,
2.296064, -0.2778304, 1.516871, 0, 0, 0, 1, 1,
2.356884, 0.9931829, 0.5676753, 0, 0, 0, 1, 1,
2.384949, 0.7351695, 3.051515, 0, 0, 0, 1, 1,
2.431087, 1.186889, 2.800839, 0, 0, 0, 1, 1,
2.45884, 0.3247505, 0.6979558, 1, 1, 1, 1, 1,
2.461006, 1.139858, 1.521254, 1, 1, 1, 1, 1,
2.537383, -2.607258, 1.500802, 1, 1, 1, 1, 1,
2.546633, 0.2520657, 4.083871, 1, 1, 1, 1, 1,
2.597089, 0.786346, 1.317883, 1, 1, 1, 1, 1,
2.628073, -0.7193477, 1.949284, 1, 1, 1, 1, 1,
2.884768, -0.5855222, 0.08724791, 1, 1, 1, 1, 1
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
var radius = 10.07429;
var distance = 35.38551;
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
mvMatrix.translate( 0.7873681, 0.07897067, 0.1321697 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.38551);
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