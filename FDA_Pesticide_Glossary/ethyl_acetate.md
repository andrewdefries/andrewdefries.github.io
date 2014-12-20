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
-3.032347, 0.6529687, -1.753102, 1, 0, 0, 1,
-2.864655, 0.4337899, -1.984714, 1, 0.007843138, 0, 1,
-2.669945, -0.382322, -1.208984, 1, 0.01176471, 0, 1,
-2.601759, -0.5262414, -0.6266866, 1, 0.01960784, 0, 1,
-2.59878, -0.07226346, -0.798376, 1, 0.02352941, 0, 1,
-2.474046, -0.02864265, -3.37926, 1, 0.03137255, 0, 1,
-2.415698, 0.141018, -0.5374949, 1, 0.03529412, 0, 1,
-2.294761, -0.3642637, 0.1640453, 1, 0.04313726, 0, 1,
-2.223958, 0.09324093, -0.7607841, 1, 0.04705882, 0, 1,
-2.152002, -0.9007323, -2.584498, 1, 0.05490196, 0, 1,
-2.120078, -0.8157075, -1.08889, 1, 0.05882353, 0, 1,
-2.070922, -0.5821198, -3.604245, 1, 0.06666667, 0, 1,
-2.062621, 0.6603841, -0.7778488, 1, 0.07058824, 0, 1,
-2.010666, 0.8141587, -1.267301, 1, 0.07843138, 0, 1,
-1.956012, 1.04641, -0.2965941, 1, 0.08235294, 0, 1,
-1.93266, 1.207908, -2.333014, 1, 0.09019608, 0, 1,
-1.922311, 0.8803972, -1.161228, 1, 0.09411765, 0, 1,
-1.91166, 1.51126, 0.1669335, 1, 0.1019608, 0, 1,
-1.854619, 0.1139573, -1.443347, 1, 0.1098039, 0, 1,
-1.841217, 0.2322043, -2.095996, 1, 0.1137255, 0, 1,
-1.835583, -0.4813933, 0.02803778, 1, 0.1215686, 0, 1,
-1.790339, -0.3267383, 1.410474, 1, 0.1254902, 0, 1,
-1.764033, -1.25316, -2.576633, 1, 0.1333333, 0, 1,
-1.729292, -0.8749099, -2.942425, 1, 0.1372549, 0, 1,
-1.72705, 0.3970653, -1.376656, 1, 0.145098, 0, 1,
-1.722617, -2.01224, -2.799524, 1, 0.1490196, 0, 1,
-1.720782, 1.207119, -2.100396, 1, 0.1568628, 0, 1,
-1.712094, -0.8577546, -2.163349, 1, 0.1607843, 0, 1,
-1.712013, -1.589849, -4.638948, 1, 0.1686275, 0, 1,
-1.706725, 2.651315, 0.6203448, 1, 0.172549, 0, 1,
-1.706401, 1.353295, -2.704096, 1, 0.1803922, 0, 1,
-1.679079, 0.4187014, -2.197467, 1, 0.1843137, 0, 1,
-1.672459, 0.8222271, -0.7178135, 1, 0.1921569, 0, 1,
-1.651777, -1.092576, -3.219377, 1, 0.1960784, 0, 1,
-1.640258, -1.487582, -1.426917, 1, 0.2039216, 0, 1,
-1.629042, -1.135652, -2.910736, 1, 0.2117647, 0, 1,
-1.627139, -0.9454518, -1.746058, 1, 0.2156863, 0, 1,
-1.618439, -0.08798525, -1.190689, 1, 0.2235294, 0, 1,
-1.613063, 0.7277374, -0.664769, 1, 0.227451, 0, 1,
-1.604131, 0.400551, -1.283121, 1, 0.2352941, 0, 1,
-1.579062, -1.096503, -2.639135, 1, 0.2392157, 0, 1,
-1.560376, -0.1895365, -1.296857, 1, 0.2470588, 0, 1,
-1.549808, -0.3501568, -1.019321, 1, 0.2509804, 0, 1,
-1.537616, -1.512604, -0.6219858, 1, 0.2588235, 0, 1,
-1.529811, 0.2480997, 0.2238241, 1, 0.2627451, 0, 1,
-1.521473, -0.9312975, -2.049417, 1, 0.2705882, 0, 1,
-1.518593, 0.1143919, -1.216451, 1, 0.2745098, 0, 1,
-1.489621, -0.9755117, -2.69033, 1, 0.282353, 0, 1,
-1.469154, 0.4794152, -0.132518, 1, 0.2862745, 0, 1,
-1.468257, 0.03041697, -1.419253, 1, 0.2941177, 0, 1,
-1.458425, -0.3533797, -1.546096, 1, 0.3019608, 0, 1,
-1.458333, -0.2317758, -2.898024, 1, 0.3058824, 0, 1,
-1.455304, 1.303464, -1.296721, 1, 0.3137255, 0, 1,
-1.448682, 0.6601512, -1.318494, 1, 0.3176471, 0, 1,
-1.437085, 0.5428206, -0.9314451, 1, 0.3254902, 0, 1,
-1.436614, 0.3608003, 0.6162489, 1, 0.3294118, 0, 1,
-1.428769, 0.3902398, -2.037638, 1, 0.3372549, 0, 1,
-1.423247, 0.370331, 0.2683781, 1, 0.3411765, 0, 1,
-1.411146, -0.4131153, -1.601589, 1, 0.3490196, 0, 1,
-1.40304, -1.173248, -2.722926, 1, 0.3529412, 0, 1,
-1.395361, -0.8505064, -2.482703, 1, 0.3607843, 0, 1,
-1.389614, 0.07668344, -2.13045, 1, 0.3647059, 0, 1,
-1.388606, 0.9116457, -0.3091171, 1, 0.372549, 0, 1,
-1.388217, -2.423563, -3.309144, 1, 0.3764706, 0, 1,
-1.388173, 1.908761, -0.4788781, 1, 0.3843137, 0, 1,
-1.376444, -0.7891642, -0.807368, 1, 0.3882353, 0, 1,
-1.374671, -0.9702268, -2.011692, 1, 0.3960784, 0, 1,
-1.372825, -0.7155941, -3.025384, 1, 0.4039216, 0, 1,
-1.37206, 2.207169, -1.296743, 1, 0.4078431, 0, 1,
-1.364362, 0.9889161, -1.982491, 1, 0.4156863, 0, 1,
-1.356976, 1.395763, -2.178389, 1, 0.4196078, 0, 1,
-1.339159, 1.114562, 0.5454988, 1, 0.427451, 0, 1,
-1.323991, -0.1069754, -1.65291, 1, 0.4313726, 0, 1,
-1.308638, -0.9750811, -3.793634, 1, 0.4392157, 0, 1,
-1.306585, 0.0209986, -1.209376, 1, 0.4431373, 0, 1,
-1.304325, -0.8217984, -3.6149, 1, 0.4509804, 0, 1,
-1.303714, 0.9687343, -1.66652, 1, 0.454902, 0, 1,
-1.299607, -0.4527512, -1.829585, 1, 0.4627451, 0, 1,
-1.291305, -0.5571651, -1.943524, 1, 0.4666667, 0, 1,
-1.28146, 0.4236178, -1.782343, 1, 0.4745098, 0, 1,
-1.275201, -0.6121895, -2.328619, 1, 0.4784314, 0, 1,
-1.27193, 1.43165, 0.175993, 1, 0.4862745, 0, 1,
-1.266566, -1.55936, -2.935443, 1, 0.4901961, 0, 1,
-1.266055, -1.100705, -2.27438, 1, 0.4980392, 0, 1,
-1.258549, -0.7088344, -2.788479, 1, 0.5058824, 0, 1,
-1.257577, -0.7102581, -2.923274, 1, 0.509804, 0, 1,
-1.244779, 1.588751, 0.3217987, 1, 0.5176471, 0, 1,
-1.241137, 2.521983, 0.1080778, 1, 0.5215687, 0, 1,
-1.238082, 0.889348, 0.8454747, 1, 0.5294118, 0, 1,
-1.229424, -0.1645722, -2.590327, 1, 0.5333334, 0, 1,
-1.224556, -0.0344658, -2.914415, 1, 0.5411765, 0, 1,
-1.222704, 0.225602, -0.5372712, 1, 0.5450981, 0, 1,
-1.213943, -1.239578, -3.263101, 1, 0.5529412, 0, 1,
-1.211359, 1.095842, 0.03683374, 1, 0.5568628, 0, 1,
-1.208986, 1.56249, 1.551786, 1, 0.5647059, 0, 1,
-1.198973, 0.9473205, -0.3738731, 1, 0.5686275, 0, 1,
-1.19321, 0.007297309, -0.02381688, 1, 0.5764706, 0, 1,
-1.191314, 0.1774346, -1.095649, 1, 0.5803922, 0, 1,
-1.189406, -1.406173, -0.2378404, 1, 0.5882353, 0, 1,
-1.178766, -1.584004, -4.302839, 1, 0.5921569, 0, 1,
-1.176806, -0.3446195, -1.451119, 1, 0.6, 0, 1,
-1.171907, 0.2276616, -1.466168, 1, 0.6078432, 0, 1,
-1.155114, 1.688713, -2.369628, 1, 0.6117647, 0, 1,
-1.150381, -0.2356951, -0.5260113, 1, 0.6196079, 0, 1,
-1.129477, 0.657162, -1.294831, 1, 0.6235294, 0, 1,
-1.122451, -0.1531685, -2.757669, 1, 0.6313726, 0, 1,
-1.12207, 0.15476, -2.635412, 1, 0.6352941, 0, 1,
-1.114422, 0.8647494, -0.9667511, 1, 0.6431373, 0, 1,
-1.110597, -0.08255231, -1.621161, 1, 0.6470588, 0, 1,
-1.109022, 0.02523743, -2.265786, 1, 0.654902, 0, 1,
-1.106671, -0.5108073, -2.429375, 1, 0.6588235, 0, 1,
-1.101036, -0.7371898, -2.230622, 1, 0.6666667, 0, 1,
-1.085395, -1.087163, -2.37094, 1, 0.6705883, 0, 1,
-1.083993, 1.32448, 0.5511995, 1, 0.6784314, 0, 1,
-1.08285, 0.9339254, -2.034713, 1, 0.682353, 0, 1,
-1.068114, -1.618052, -2.277992, 1, 0.6901961, 0, 1,
-1.065874, -0.2675906, -1.251834, 1, 0.6941177, 0, 1,
-1.056734, -0.9679737, -3.113516, 1, 0.7019608, 0, 1,
-1.052873, -1.091741, -2.436877, 1, 0.7098039, 0, 1,
-1.052746, -2.470743, -3.517495, 1, 0.7137255, 0, 1,
-1.050882, 1.173877, -0.2332072, 1, 0.7215686, 0, 1,
-1.047484, -0.1125796, -0.6042449, 1, 0.7254902, 0, 1,
-1.043496, 0.2519195, -1.031714, 1, 0.7333333, 0, 1,
-1.041021, -0.6361563, -2.593029, 1, 0.7372549, 0, 1,
-1.035427, 0.3416576, -1.629031, 1, 0.7450981, 0, 1,
-1.031908, 1.659334, -1.603286, 1, 0.7490196, 0, 1,
-1.016915, -0.779949, -1.671801, 1, 0.7568628, 0, 1,
-1.01506, 0.9400453, -0.6382745, 1, 0.7607843, 0, 1,
-1.013941, -1.381814, -1.583871, 1, 0.7686275, 0, 1,
-1.010082, -0.3061248, -3.076297, 1, 0.772549, 0, 1,
-1.004705, -0.3328627, -2.049681, 1, 0.7803922, 0, 1,
-1.004054, -0.4091001, -2.748406, 1, 0.7843137, 0, 1,
-1.003766, 0.6154965, 0.02048846, 1, 0.7921569, 0, 1,
-1.002177, 1.490571, -0.7639027, 1, 0.7960784, 0, 1,
-0.9946385, 0.2015407, -0.8072733, 1, 0.8039216, 0, 1,
-0.9936832, 0.8959088, -0.9438221, 1, 0.8117647, 0, 1,
-0.992429, 0.3157144, -1.635366, 1, 0.8156863, 0, 1,
-0.9880005, 0.5430279, -1.236844, 1, 0.8235294, 0, 1,
-0.9868246, -1.000203, -2.271561, 1, 0.827451, 0, 1,
-0.9854984, -0.006644312, -1.884411, 1, 0.8352941, 0, 1,
-0.9845009, 1.211543, 0.5092301, 1, 0.8392157, 0, 1,
-0.9842916, 0.9064932, -1.22346, 1, 0.8470588, 0, 1,
-0.9839204, -0.1129794, -1.114082, 1, 0.8509804, 0, 1,
-0.9790798, 0.9507499, 0.1628616, 1, 0.8588235, 0, 1,
-0.9710582, -0.7311013, -2.369045, 1, 0.8627451, 0, 1,
-0.970571, 0.1249639, -3.051599, 1, 0.8705882, 0, 1,
-0.9692608, 2.450438, 1.618574, 1, 0.8745098, 0, 1,
-0.9680276, 0.2849385, -2.585515, 1, 0.8823529, 0, 1,
-0.9630302, 0.03718897, -1.75168, 1, 0.8862745, 0, 1,
-0.950962, 1.49217, 0.2702837, 1, 0.8941177, 0, 1,
-0.9390575, 0.7255549, -2.32632, 1, 0.8980392, 0, 1,
-0.9352353, -0.1192615, 0.09247932, 1, 0.9058824, 0, 1,
-0.9281794, -0.2122628, -1.102861, 1, 0.9137255, 0, 1,
-0.9267419, 0.2241741, -2.310168, 1, 0.9176471, 0, 1,
-0.9259995, 0.3108273, -1.576972, 1, 0.9254902, 0, 1,
-0.9243885, -0.8053325, -2.657355, 1, 0.9294118, 0, 1,
-0.9215416, -1.855465, -1.815278, 1, 0.9372549, 0, 1,
-0.9174969, -0.8634703, -3.518672, 1, 0.9411765, 0, 1,
-0.9130854, 0.02151913, -2.739129, 1, 0.9490196, 0, 1,
-0.911709, 1.400609, -1.810151, 1, 0.9529412, 0, 1,
-0.9105219, -1.859367, -1.622863, 1, 0.9607843, 0, 1,
-0.9093083, 0.1841725, -0.6437098, 1, 0.9647059, 0, 1,
-0.9038036, 0.3635623, -0.3693462, 1, 0.972549, 0, 1,
-0.8992763, 0.3797324, -0.6510818, 1, 0.9764706, 0, 1,
-0.8961555, 0.4260108, -1.742965, 1, 0.9843137, 0, 1,
-0.8912116, -0.6871095, -1.941238, 1, 0.9882353, 0, 1,
-0.88919, -0.9433972, -3.309369, 1, 0.9960784, 0, 1,
-0.8789723, 0.8664514, -0.9255373, 0.9960784, 1, 0, 1,
-0.8777148, 3.246171, 0.9621137, 0.9921569, 1, 0, 1,
-0.8538642, -1.654, -1.246858, 0.9843137, 1, 0, 1,
-0.8490984, -2.1144, -3.74994, 0.9803922, 1, 0, 1,
-0.8487813, 0.7535065, 0.5126067, 0.972549, 1, 0, 1,
-0.8478863, -1.423354, -2.48855, 0.9686275, 1, 0, 1,
-0.8435516, 0.8692284, -1.237392, 0.9607843, 1, 0, 1,
-0.8425385, -1.159835, -3.734854, 0.9568627, 1, 0, 1,
-0.8424346, -0.2466468, -3.751475, 0.9490196, 1, 0, 1,
-0.8307651, -0.7818573, -3.405976, 0.945098, 1, 0, 1,
-0.818127, -1.305158, -2.769192, 0.9372549, 1, 0, 1,
-0.8142052, 0.3845517, -0.3331434, 0.9333333, 1, 0, 1,
-0.8139641, -0.6680093, -2.190032, 0.9254902, 1, 0, 1,
-0.8035682, 1.324422, 0.3222291, 0.9215686, 1, 0, 1,
-0.8035115, 2.255979, 0.2088055, 0.9137255, 1, 0, 1,
-0.7957751, -2.095093, -2.872547, 0.9098039, 1, 0, 1,
-0.7886155, 0.229878, -2.287457, 0.9019608, 1, 0, 1,
-0.7873476, -0.1819215, -1.927419, 0.8941177, 1, 0, 1,
-0.7847414, -0.2271967, -1.973182, 0.8901961, 1, 0, 1,
-0.7633688, 1.700221, -1.267861, 0.8823529, 1, 0, 1,
-0.7631376, 0.5078385, -0.7050429, 0.8784314, 1, 0, 1,
-0.7629661, -0.281911, -1.885631, 0.8705882, 1, 0, 1,
-0.7611031, -1.386205, -2.784599, 0.8666667, 1, 0, 1,
-0.7417741, -0.3648755, -5.537845, 0.8588235, 1, 0, 1,
-0.740997, -0.1844458, -2.90592, 0.854902, 1, 0, 1,
-0.739806, -1.624888, -2.056731, 0.8470588, 1, 0, 1,
-0.7382832, 0.8311074, -0.6907951, 0.8431373, 1, 0, 1,
-0.733981, -0.9194493, -1.030836, 0.8352941, 1, 0, 1,
-0.7280248, -0.6170241, -3.36261, 0.8313726, 1, 0, 1,
-0.7251382, 0.1588166, -0.6975113, 0.8235294, 1, 0, 1,
-0.7237561, -0.3485578, -1.837012, 0.8196079, 1, 0, 1,
-0.7104229, -0.7558759, -2.497368, 0.8117647, 1, 0, 1,
-0.7098063, -0.7007183, -1.509804, 0.8078431, 1, 0, 1,
-0.7040674, 0.392419, -1.968197, 0.8, 1, 0, 1,
-0.7014133, -0.15126, -1.229204, 0.7921569, 1, 0, 1,
-0.7004859, 1.019418, 0.07121377, 0.7882353, 1, 0, 1,
-0.7002481, -0.4762517, -0.972213, 0.7803922, 1, 0, 1,
-0.6990124, -1.135882, -2.21343, 0.7764706, 1, 0, 1,
-0.6986927, 0.6303856, -0.2327961, 0.7686275, 1, 0, 1,
-0.6936828, 0.4225899, -1.047454, 0.7647059, 1, 0, 1,
-0.6910914, 1.113067, -0.3184876, 0.7568628, 1, 0, 1,
-0.6842924, -0.2425001, -3.677368, 0.7529412, 1, 0, 1,
-0.6811388, 1.20618, -0.3728989, 0.7450981, 1, 0, 1,
-0.6801583, -2.765751, -1.857725, 0.7411765, 1, 0, 1,
-0.6796913, -0.07542608, -1.542022, 0.7333333, 1, 0, 1,
-0.6746427, 0.1085842, -3.318082, 0.7294118, 1, 0, 1,
-0.6714459, -1.950445, -2.797565, 0.7215686, 1, 0, 1,
-0.6712719, -2.310991, -2.420511, 0.7176471, 1, 0, 1,
-0.6681153, 0.2100131, -2.514205, 0.7098039, 1, 0, 1,
-0.6606155, 0.5870719, -1.281473, 0.7058824, 1, 0, 1,
-0.6593868, -0.1497209, -2.196657, 0.6980392, 1, 0, 1,
-0.6559674, 1.024481, -1.769096, 0.6901961, 1, 0, 1,
-0.6537747, -1.024338, -3.639421, 0.6862745, 1, 0, 1,
-0.6506058, -0.3258491, -2.459908, 0.6784314, 1, 0, 1,
-0.6475874, 0.2859426, -1.616768, 0.6745098, 1, 0, 1,
-0.6433165, -0.3982719, -3.364826, 0.6666667, 1, 0, 1,
-0.6420745, -2.247031, -2.811448, 0.6627451, 1, 0, 1,
-0.639108, -0.3976141, -2.542108, 0.654902, 1, 0, 1,
-0.6303632, 0.3373069, -0.2721955, 0.6509804, 1, 0, 1,
-0.6301985, -1.2047, -0.6791323, 0.6431373, 1, 0, 1,
-0.6275417, 1.451362, 0.9923451, 0.6392157, 1, 0, 1,
-0.6274409, -1.00303, -3.568247, 0.6313726, 1, 0, 1,
-0.6235251, -1.523222, -2.804407, 0.627451, 1, 0, 1,
-0.6219227, -2.187638, -4.502837, 0.6196079, 1, 0, 1,
-0.6193112, 0.2270101, -1.002406, 0.6156863, 1, 0, 1,
-0.6159008, 0.971828, 0.1622968, 0.6078432, 1, 0, 1,
-0.6133522, -0.3635885, -2.295697, 0.6039216, 1, 0, 1,
-0.6118549, -0.8757644, -2.07455, 0.5960785, 1, 0, 1,
-0.6100861, -0.003409205, -1.342443, 0.5882353, 1, 0, 1,
-0.6051741, -0.7744147, -2.355719, 0.5843138, 1, 0, 1,
-0.600197, 1.387496, -0.5192151, 0.5764706, 1, 0, 1,
-0.5999307, -0.7605239, -1.83727, 0.572549, 1, 0, 1,
-0.5979576, -0.769311, -1.998666, 0.5647059, 1, 0, 1,
-0.5928405, 0.8051919, -1.256043, 0.5607843, 1, 0, 1,
-0.5927446, 0.7019926, 0.9286183, 0.5529412, 1, 0, 1,
-0.5848151, 1.674853, -1.654875, 0.5490196, 1, 0, 1,
-0.5835648, -0.08484124, -1.285392, 0.5411765, 1, 0, 1,
-0.5819899, -0.2543997, 0.2429922, 0.5372549, 1, 0, 1,
-0.5804768, 0.2911834, -0.1903683, 0.5294118, 1, 0, 1,
-0.5776947, -0.8748852, -3.524668, 0.5254902, 1, 0, 1,
-0.5640222, -0.1256839, -0.3327032, 0.5176471, 1, 0, 1,
-0.5631929, 2.28792, -0.2438247, 0.5137255, 1, 0, 1,
-0.5622755, 0.6002082, 0.2422855, 0.5058824, 1, 0, 1,
-0.561829, 1.117358, -1.95471, 0.5019608, 1, 0, 1,
-0.5593837, -1.38326, -3.229864, 0.4941176, 1, 0, 1,
-0.5572239, -0.5376313, -2.176597, 0.4862745, 1, 0, 1,
-0.5558464, -0.8368524, -4.255815, 0.4823529, 1, 0, 1,
-0.5550519, -0.983856, -2.860771, 0.4745098, 1, 0, 1,
-0.5526763, 0.3626351, -1.259652, 0.4705882, 1, 0, 1,
-0.5439061, 0.368218, -1.745184, 0.4627451, 1, 0, 1,
-0.5418142, -1.032859, -3.247285, 0.4588235, 1, 0, 1,
-0.5391494, -1.633119, -2.488213, 0.4509804, 1, 0, 1,
-0.53777, -2.132697, -2.6833, 0.4470588, 1, 0, 1,
-0.5369719, 1.176833, -0.1383121, 0.4392157, 1, 0, 1,
-0.5360093, -0.02215795, 0.3695931, 0.4352941, 1, 0, 1,
-0.531634, -0.7202122, -2.531184, 0.427451, 1, 0, 1,
-0.531316, 0.1940223, 0.8540792, 0.4235294, 1, 0, 1,
-0.5294196, -0.04118631, -2.682567, 0.4156863, 1, 0, 1,
-0.5284604, 0.8970059, -0.4397236, 0.4117647, 1, 0, 1,
-0.5253018, -1.235866, -4.280812, 0.4039216, 1, 0, 1,
-0.5243244, 0.2971116, -1.141098, 0.3960784, 1, 0, 1,
-0.5210544, 0.01592954, -1.3054, 0.3921569, 1, 0, 1,
-0.5168419, 0.5050533, -1.412962, 0.3843137, 1, 0, 1,
-0.5164368, 0.8771278, -0.3240825, 0.3803922, 1, 0, 1,
-0.5152466, -0.7795607, -2.536442, 0.372549, 1, 0, 1,
-0.5042674, 0.3352601, 0.8403677, 0.3686275, 1, 0, 1,
-0.5016416, 0.09172685, -2.386404, 0.3607843, 1, 0, 1,
-0.4985293, 0.7171834, -1.536518, 0.3568628, 1, 0, 1,
-0.4950588, -0.7818179, -2.720921, 0.3490196, 1, 0, 1,
-0.494725, 0.7700244, 0.6646291, 0.345098, 1, 0, 1,
-0.4933106, 0.6678885, 1.621732, 0.3372549, 1, 0, 1,
-0.4913415, 1.208372, -1.834824, 0.3333333, 1, 0, 1,
-0.4844154, -1.430129, -3.937158, 0.3254902, 1, 0, 1,
-0.4822124, 0.4602682, -0.4935291, 0.3215686, 1, 0, 1,
-0.4815852, 0.2639076, -2.262322, 0.3137255, 1, 0, 1,
-0.4805384, 1.939903, 0.3423257, 0.3098039, 1, 0, 1,
-0.4774994, -0.5416825, -2.40254, 0.3019608, 1, 0, 1,
-0.4764825, -3.32332, -4.603664, 0.2941177, 1, 0, 1,
-0.4763272, 1.617153, 0.7206953, 0.2901961, 1, 0, 1,
-0.4752887, -2.098764, -0.8145356, 0.282353, 1, 0, 1,
-0.4708228, -0.7235935, -3.735524, 0.2784314, 1, 0, 1,
-0.4688623, 1.010466, -0.349535, 0.2705882, 1, 0, 1,
-0.4606031, 0.660268, 0.7033517, 0.2666667, 1, 0, 1,
-0.458788, 0.6806812, -1.900795, 0.2588235, 1, 0, 1,
-0.4545522, -0.4252264, -3.21997, 0.254902, 1, 0, 1,
-0.4477258, 0.4388684, -0.6331774, 0.2470588, 1, 0, 1,
-0.4447507, 0.1199132, -1.235131, 0.2431373, 1, 0, 1,
-0.4443112, -2.121343, -2.643423, 0.2352941, 1, 0, 1,
-0.4426827, 0.116325, -2.194217, 0.2313726, 1, 0, 1,
-0.4422067, 1.147371, -1.311006, 0.2235294, 1, 0, 1,
-0.4394858, 0.944161, -0.8106349, 0.2196078, 1, 0, 1,
-0.4357575, 0.6965458, -0.7604575, 0.2117647, 1, 0, 1,
-0.43285, 0.6898233, -1.152626, 0.2078431, 1, 0, 1,
-0.4291759, -1.645403, -3.117589, 0.2, 1, 0, 1,
-0.4279808, 1.785242, -1.185563, 0.1921569, 1, 0, 1,
-0.4243886, -0.1785196, -2.586516, 0.1882353, 1, 0, 1,
-0.4225752, 0.4370428, -0.8495688, 0.1803922, 1, 0, 1,
-0.4185965, 0.5132298, -0.7951897, 0.1764706, 1, 0, 1,
-0.4171398, -1.710885, -2.632784, 0.1686275, 1, 0, 1,
-0.4167307, -0.5434557, -3.137909, 0.1647059, 1, 0, 1,
-0.4158224, -0.6448826, -2.810896, 0.1568628, 1, 0, 1,
-0.4118211, 0.5677368, -0.7667304, 0.1529412, 1, 0, 1,
-0.4113328, -0.9231772, -2.864093, 0.145098, 1, 0, 1,
-0.4052146, 0.5191888, 0.1300278, 0.1411765, 1, 0, 1,
-0.3995721, -0.8309718, -2.372518, 0.1333333, 1, 0, 1,
-0.3995562, -0.4990401, -3.105574, 0.1294118, 1, 0, 1,
-0.3993525, 0.09955593, -1.734808, 0.1215686, 1, 0, 1,
-0.3991502, 0.8758964, -0.6569852, 0.1176471, 1, 0, 1,
-0.391999, 0.05733143, -0.701954, 0.1098039, 1, 0, 1,
-0.3819389, -0.8177635, -3.122812, 0.1058824, 1, 0, 1,
-0.3816908, -0.3904897, -1.980705, 0.09803922, 1, 0, 1,
-0.3810672, -0.2875959, -2.892191, 0.09019608, 1, 0, 1,
-0.3763098, -0.4229167, -3.119031, 0.08627451, 1, 0, 1,
-0.3739374, -0.3523542, -1.899879, 0.07843138, 1, 0, 1,
-0.3739127, -2.697641, -3.359668, 0.07450981, 1, 0, 1,
-0.3729315, -1.094774, -3.596382, 0.06666667, 1, 0, 1,
-0.3729164, -0.008629472, -0.3492942, 0.0627451, 1, 0, 1,
-0.3677111, 1.041557, -0.6055281, 0.05490196, 1, 0, 1,
-0.3655515, 0.5655083, 1.603392, 0.05098039, 1, 0, 1,
-0.3652458, -0.2539564, -3.6343, 0.04313726, 1, 0, 1,
-0.3596747, 0.2588371, -0.4074653, 0.03921569, 1, 0, 1,
-0.3573853, 0.8905026, -0.1039354, 0.03137255, 1, 0, 1,
-0.3571209, 0.7555109, -0.8720338, 0.02745098, 1, 0, 1,
-0.3513875, -0.02479579, -2.830939, 0.01960784, 1, 0, 1,
-0.3506547, 1.285865, -0.818643, 0.01568628, 1, 0, 1,
-0.3464617, 0.2259372, -1.192756, 0.007843138, 1, 0, 1,
-0.3455437, -2.165088, -2.317533, 0.003921569, 1, 0, 1,
-0.3448526, -0.7749116, -2.26702, 0, 1, 0.003921569, 1,
-0.343589, -0.3834332, -0.5288256, 0, 1, 0.01176471, 1,
-0.3418799, -0.4416028, -1.747717, 0, 1, 0.01568628, 1,
-0.3402184, -0.4884479, -3.197305, 0, 1, 0.02352941, 1,
-0.3373481, 1.269835, 0.1419311, 0, 1, 0.02745098, 1,
-0.33651, -1.486585, -1.868146, 0, 1, 0.03529412, 1,
-0.3355731, -0.8636374, -3.783493, 0, 1, 0.03921569, 1,
-0.335564, 0.03633267, -1.295979, 0, 1, 0.04705882, 1,
-0.334726, -0.4998593, -1.753388, 0, 1, 0.05098039, 1,
-0.3342473, -0.02800107, -1.99743, 0, 1, 0.05882353, 1,
-0.3267764, 1.58304, -0.3686928, 0, 1, 0.0627451, 1,
-0.325712, 1.788141, -0.6902634, 0, 1, 0.07058824, 1,
-0.3255491, 1.7411, 0.3333445, 0, 1, 0.07450981, 1,
-0.3211273, -0.5306861, -2.865968, 0, 1, 0.08235294, 1,
-0.3210444, 1.051465, -0.3530417, 0, 1, 0.08627451, 1,
-0.3194361, 2.104077, 0.5766384, 0, 1, 0.09411765, 1,
-0.3164631, 0.3059898, -2.487737, 0, 1, 0.1019608, 1,
-0.3146279, 0.8397063, -1.030696, 0, 1, 0.1058824, 1,
-0.3108997, 1.252756, -0.1466171, 0, 1, 0.1137255, 1,
-0.3105207, 0.4751223, -1.072369, 0, 1, 0.1176471, 1,
-0.3078496, 0.3196809, 0.7401091, 0, 1, 0.1254902, 1,
-0.3074746, -2.238314, -2.886076, 0, 1, 0.1294118, 1,
-0.304686, -0.3364071, -3.199556, 0, 1, 0.1372549, 1,
-0.3020618, -0.5980044, -1.77895, 0, 1, 0.1411765, 1,
-0.3008852, 0.5705248, -3.07313, 0, 1, 0.1490196, 1,
-0.3003131, -0.3133449, -2.5264, 0, 1, 0.1529412, 1,
-0.2914923, 0.6285709, 1.570329, 0, 1, 0.1607843, 1,
-0.2849847, 1.057477, -0.3958718, 0, 1, 0.1647059, 1,
-0.2845919, -1.963441, -3.264682, 0, 1, 0.172549, 1,
-0.2780223, -0.7856048, -4.164535, 0, 1, 0.1764706, 1,
-0.2778933, -1.232988, -0.8800672, 0, 1, 0.1843137, 1,
-0.2750838, 1.901905, -1.955161, 0, 1, 0.1882353, 1,
-0.2735886, -1.407775, -2.437726, 0, 1, 0.1960784, 1,
-0.2733679, 1.644177, -0.145428, 0, 1, 0.2039216, 1,
-0.2729321, 1.537761, 0.8796424, 0, 1, 0.2078431, 1,
-0.2673641, 0.4401394, -0.8831787, 0, 1, 0.2156863, 1,
-0.265681, 0.2320207, 0.5453283, 0, 1, 0.2196078, 1,
-0.2586626, 0.2970766, -2.180639, 0, 1, 0.227451, 1,
-0.252055, 0.4005897, 0.1060494, 0, 1, 0.2313726, 1,
-0.2510913, 1.288026, -0.3821663, 0, 1, 0.2392157, 1,
-0.2509664, 0.1123504, -1.790486, 0, 1, 0.2431373, 1,
-0.2463351, -0.1078385, -2.989972, 0, 1, 0.2509804, 1,
-0.2450393, -0.4443109, -2.023817, 0, 1, 0.254902, 1,
-0.2419047, 0.7000223, 1.239679, 0, 1, 0.2627451, 1,
-0.2411154, -2.196667, -2.081458, 0, 1, 0.2666667, 1,
-0.2373851, -0.8593823, -2.752635, 0, 1, 0.2745098, 1,
-0.237193, 0.6917634, 1.60882, 0, 1, 0.2784314, 1,
-0.2325723, -2.144398, -4.524886, 0, 1, 0.2862745, 1,
-0.2289545, 0.4076409, -2.773954, 0, 1, 0.2901961, 1,
-0.2219563, 0.08831957, -0.9085866, 0, 1, 0.2980392, 1,
-0.2207959, 1.25536, 0.9272824, 0, 1, 0.3058824, 1,
-0.2201162, -0.9856219, -2.312679, 0, 1, 0.3098039, 1,
-0.2195638, 2.050079, -0.04392843, 0, 1, 0.3176471, 1,
-0.2188603, -0.5800653, -4.223577, 0, 1, 0.3215686, 1,
-0.2168832, 1.36017, -0.2403823, 0, 1, 0.3294118, 1,
-0.2128647, -0.9921762, -2.036016, 0, 1, 0.3333333, 1,
-0.2056845, 2.18362, -0.5447605, 0, 1, 0.3411765, 1,
-0.2039645, 0.9106094, -0.2908917, 0, 1, 0.345098, 1,
-0.1997141, -0.9619502, -2.939662, 0, 1, 0.3529412, 1,
-0.1996298, -0.5515653, -1.445743, 0, 1, 0.3568628, 1,
-0.1975518, -1.342083, -3.350294, 0, 1, 0.3647059, 1,
-0.1944907, -0.7821713, -2.227417, 0, 1, 0.3686275, 1,
-0.1904495, 1.70209, -0.1006953, 0, 1, 0.3764706, 1,
-0.18506, -1.159279, -3.893841, 0, 1, 0.3803922, 1,
-0.1835403, -0.9659164, -3.215236, 0, 1, 0.3882353, 1,
-0.1801169, -0.2187286, -1.952146, 0, 1, 0.3921569, 1,
-0.1740623, 0.4218837, -0.2559868, 0, 1, 0.4, 1,
-0.1710881, -0.04462612, -1.721599, 0, 1, 0.4078431, 1,
-0.1707883, 0.4317127, -0.07624801, 0, 1, 0.4117647, 1,
-0.1668222, 0.9455543, -1.924639, 0, 1, 0.4196078, 1,
-0.162134, -1.23038, -3.855738, 0, 1, 0.4235294, 1,
-0.160142, 1.911372, 1.144013, 0, 1, 0.4313726, 1,
-0.1559635, -0.7134572, -2.347897, 0, 1, 0.4352941, 1,
-0.1551968, -0.9282224, -4.567389, 0, 1, 0.4431373, 1,
-0.1491952, -0.6703842, -3.226202, 0, 1, 0.4470588, 1,
-0.1476691, 0.1045262, -1.734555, 0, 1, 0.454902, 1,
-0.1466275, -0.9817491, -4.01071, 0, 1, 0.4588235, 1,
-0.1462997, -0.9689753, -2.729542, 0, 1, 0.4666667, 1,
-0.1432312, -1.181239, -2.633867, 0, 1, 0.4705882, 1,
-0.1406838, -0.06740469, -3.006439, 0, 1, 0.4784314, 1,
-0.1358472, 0.2104712, -0.0823985, 0, 1, 0.4823529, 1,
-0.1358266, 0.130572, -0.8900434, 0, 1, 0.4901961, 1,
-0.1339762, -0.1150741, -0.9314382, 0, 1, 0.4941176, 1,
-0.1333851, -1.662053, -2.052136, 0, 1, 0.5019608, 1,
-0.1322614, 0.5639206, 0.8334039, 0, 1, 0.509804, 1,
-0.1319107, 0.9000775, -0.889367, 0, 1, 0.5137255, 1,
-0.1292639, -0.3538529, -2.21417, 0, 1, 0.5215687, 1,
-0.1239835, 0.02005435, -2.551323, 0, 1, 0.5254902, 1,
-0.1235884, 0.08733913, -1.902219, 0, 1, 0.5333334, 1,
-0.1219222, 1.398405, -1.072751, 0, 1, 0.5372549, 1,
-0.1192997, 0.3448518, -1.450531, 0, 1, 0.5450981, 1,
-0.1172893, 1.293592, -1.171302, 0, 1, 0.5490196, 1,
-0.1149232, 0.3200999, -2.649352, 0, 1, 0.5568628, 1,
-0.1130813, -1.259963, -2.040141, 0, 1, 0.5607843, 1,
-0.1090969, 2.346552, -1.242908, 0, 1, 0.5686275, 1,
-0.1086469, -0.1453042, -1.699187, 0, 1, 0.572549, 1,
-0.107847, -1.449042, -3.838522, 0, 1, 0.5803922, 1,
-0.106049, -2.485944, -2.482968, 0, 1, 0.5843138, 1,
-0.103373, -0.7071993, -2.207582, 0, 1, 0.5921569, 1,
-0.09949157, -0.2945353, -4.531117, 0, 1, 0.5960785, 1,
-0.09699272, 0.5227694, 0.1675619, 0, 1, 0.6039216, 1,
-0.09684561, 1.741691, -1.512662, 0, 1, 0.6117647, 1,
-0.09646598, 0.1917394, -0.392699, 0, 1, 0.6156863, 1,
-0.09568767, -1.75477, -3.27318, 0, 1, 0.6235294, 1,
-0.09369569, 0.5112414, 0.2795784, 0, 1, 0.627451, 1,
-0.09321076, 0.3567832, 1.309765, 0, 1, 0.6352941, 1,
-0.09126829, -0.4108283, -3.549136, 0, 1, 0.6392157, 1,
-0.09014639, -1.447487, -1.997445, 0, 1, 0.6470588, 1,
-0.0900246, -1.048276, -3.573903, 0, 1, 0.6509804, 1,
-0.08942547, -0.5173838, -2.318964, 0, 1, 0.6588235, 1,
-0.08883019, -0.9561561, -4.054277, 0, 1, 0.6627451, 1,
-0.08717145, -1.662062, -2.350002, 0, 1, 0.6705883, 1,
-0.08546626, 0.7278801, -0.2071858, 0, 1, 0.6745098, 1,
-0.0842373, 0.02891235, -1.02259, 0, 1, 0.682353, 1,
-0.07751366, -0.1502193, -3.342436, 0, 1, 0.6862745, 1,
-0.07460203, -1.877906, -2.700865, 0, 1, 0.6941177, 1,
-0.07380442, 0.3883119, -1.942097, 0, 1, 0.7019608, 1,
-0.07298952, 0.5850564, -0.2848285, 0, 1, 0.7058824, 1,
-0.06814955, 1.439971, -0.008137397, 0, 1, 0.7137255, 1,
-0.06342369, -0.1082919, -3.796974, 0, 1, 0.7176471, 1,
-0.06288946, -0.3665105, -2.300361, 0, 1, 0.7254902, 1,
-0.06197336, -0.1511149, -4.129271, 0, 1, 0.7294118, 1,
-0.06046563, 1.320392, -1.107886, 0, 1, 0.7372549, 1,
-0.05769721, -0.7818528, -2.510361, 0, 1, 0.7411765, 1,
-0.05690571, 1.185159, 0.2251936, 0, 1, 0.7490196, 1,
-0.05650583, -0.01884589, -3.750928, 0, 1, 0.7529412, 1,
-0.05498568, 0.1066303, -0.5143042, 0, 1, 0.7607843, 1,
-0.04329057, 0.6666902, 0.1223639, 0, 1, 0.7647059, 1,
-0.04309338, 0.3501907, -0.5151442, 0, 1, 0.772549, 1,
-0.03673359, 0.1504648, 0.02507783, 0, 1, 0.7764706, 1,
-0.03435441, -1.633205, -4.160288, 0, 1, 0.7843137, 1,
-0.02822218, -0.1783518, -3.510143, 0, 1, 0.7882353, 1,
-0.02550475, -0.0001005186, -1.603002, 0, 1, 0.7960784, 1,
-0.02315772, 0.5481593, 0.4152112, 0, 1, 0.8039216, 1,
-0.01860957, 1.310898, 0.2647642, 0, 1, 0.8078431, 1,
-0.01798415, 0.07256977, -1.039785, 0, 1, 0.8156863, 1,
-0.01727875, -0.4648986, -3.613514, 0, 1, 0.8196079, 1,
-0.0097305, -0.1475442, -2.283339, 0, 1, 0.827451, 1,
-0.008818913, 0.5279562, 1.338994, 0, 1, 0.8313726, 1,
-0.008571669, 1.251195, -0.3604757, 0, 1, 0.8392157, 1,
-0.007905984, -0.656028, -2.623014, 0, 1, 0.8431373, 1,
-0.006558216, -0.1010203, -2.185485, 0, 1, 0.8509804, 1,
-0.002224341, -0.6137655, -4.515638, 0, 1, 0.854902, 1,
-0.001106959, -0.1374595, -4.318196, 0, 1, 0.8627451, 1,
0.003900358, 0.8445652, 1.047792, 0, 1, 0.8666667, 1,
0.003973211, 0.8079723, 0.2705488, 0, 1, 0.8745098, 1,
0.004560094, 0.5201766, -1.058744, 0, 1, 0.8784314, 1,
0.005164547, -0.9364375, 3.309817, 0, 1, 0.8862745, 1,
0.006343364, -0.694626, 3.01569, 0, 1, 0.8901961, 1,
0.007851115, 0.2032215, -0.8135418, 0, 1, 0.8980392, 1,
0.01260057, 1.271441, -1.329209, 0, 1, 0.9058824, 1,
0.01274141, 0.5734243, -0.2017455, 0, 1, 0.9098039, 1,
0.01612978, -1.010985, 1.379047, 0, 1, 0.9176471, 1,
0.01627446, 0.4137262, 0.04743568, 0, 1, 0.9215686, 1,
0.01845677, 0.8496556, -0.1771232, 0, 1, 0.9294118, 1,
0.02401018, -0.5587713, 4.333712, 0, 1, 0.9333333, 1,
0.02472249, 0.1477807, -1.400401, 0, 1, 0.9411765, 1,
0.02475927, -1.076622, 3.151358, 0, 1, 0.945098, 1,
0.0287453, 0.05225431, 0.1750434, 0, 1, 0.9529412, 1,
0.03441297, 1.211378, -1.200455, 0, 1, 0.9568627, 1,
0.03813313, 1.060154, 0.8736193, 0, 1, 0.9647059, 1,
0.03943092, 1.016832, -0.5071324, 0, 1, 0.9686275, 1,
0.03959101, -0.4633079, 1.647901, 0, 1, 0.9764706, 1,
0.04023575, -0.3035893, 4.877673, 0, 1, 0.9803922, 1,
0.0403431, -0.2562352, 4.774086, 0, 1, 0.9882353, 1,
0.04202519, -0.8257986, 3.761175, 0, 1, 0.9921569, 1,
0.04299663, 0.8106313, 0.0300728, 0, 1, 1, 1,
0.04517031, 0.6569344, -1.033901, 0, 0.9921569, 1, 1,
0.04548391, -0.9619732, 2.664147, 0, 0.9882353, 1, 1,
0.04706671, -0.4301114, 2.856733, 0, 0.9803922, 1, 1,
0.04988708, -1.453181, 3.159116, 0, 0.9764706, 1, 1,
0.05370485, -0.8116686, 2.677956, 0, 0.9686275, 1, 1,
0.05442927, 1.174326, -0.8067458, 0, 0.9647059, 1, 1,
0.06633957, 0.5516807, 0.09568129, 0, 0.9568627, 1, 1,
0.06836405, 0.3299522, -0.414254, 0, 0.9529412, 1, 1,
0.06881806, 0.2396633, 1.273144, 0, 0.945098, 1, 1,
0.07112195, 1.002232, -0.2750748, 0, 0.9411765, 1, 1,
0.0751704, 0.9824572, 0.1506854, 0, 0.9333333, 1, 1,
0.07583147, 2.174886, 0.04066087, 0, 0.9294118, 1, 1,
0.0785927, 0.4268782, 1.009731, 0, 0.9215686, 1, 1,
0.08464499, 0.9565342, -0.2663656, 0, 0.9176471, 1, 1,
0.08668491, 0.3250515, 0.9180074, 0, 0.9098039, 1, 1,
0.0869109, 1.517163, -0.03750397, 0, 0.9058824, 1, 1,
0.08840852, 1.19997, -0.2890205, 0, 0.8980392, 1, 1,
0.09078304, 0.844389, 0.6169958, 0, 0.8901961, 1, 1,
0.09089098, 0.1798322, -0.7866328, 0, 0.8862745, 1, 1,
0.09130009, -0.02202101, 1.630543, 0, 0.8784314, 1, 1,
0.09265588, -0.9349304, 3.901211, 0, 0.8745098, 1, 1,
0.09294003, -1.151201, 2.411346, 0, 0.8666667, 1, 1,
0.09568086, 0.6437811, -1.505443, 0, 0.8627451, 1, 1,
0.1012219, 0.4996307, 1.04655, 0, 0.854902, 1, 1,
0.1047627, -0.02339712, 1.687448, 0, 0.8509804, 1, 1,
0.1081085, 0.5746571, 0.6628948, 0, 0.8431373, 1, 1,
0.1116215, 1.420194, 1.753514, 0, 0.8392157, 1, 1,
0.114582, -0.5823951, 2.745908, 0, 0.8313726, 1, 1,
0.11482, 0.9812794, 1.209167, 0, 0.827451, 1, 1,
0.1159611, 2.365802, 0.3338967, 0, 0.8196079, 1, 1,
0.1188744, -0.3464267, 0.9949726, 0, 0.8156863, 1, 1,
0.1271283, -1.379253, 2.98101, 0, 0.8078431, 1, 1,
0.1271836, 0.113661, 0.8987879, 0, 0.8039216, 1, 1,
0.1298137, -0.6522287, 2.228024, 0, 0.7960784, 1, 1,
0.1306033, -0.4560233, 5.606302, 0, 0.7882353, 1, 1,
0.1349642, 0.2580602, 0.5620319, 0, 0.7843137, 1, 1,
0.1393127, -0.07651707, 2.769885, 0, 0.7764706, 1, 1,
0.1413514, 0.2466478, 0.1850835, 0, 0.772549, 1, 1,
0.1419766, 0.6273856, 0.45291, 0, 0.7647059, 1, 1,
0.1431674, 0.8258957, -0.3365323, 0, 0.7607843, 1, 1,
0.1443776, 1.581806, -1.022649, 0, 0.7529412, 1, 1,
0.1478649, 2.79901, 1.776223, 0, 0.7490196, 1, 1,
0.1486598, 0.4031309, 0.6874558, 0, 0.7411765, 1, 1,
0.150424, 1.495094, 0.6506103, 0, 0.7372549, 1, 1,
0.1553991, 0.1334468, 0.1710489, 0, 0.7294118, 1, 1,
0.1565869, 0.5749654, 0.2719599, 0, 0.7254902, 1, 1,
0.1589189, -0.197689, 2.293914, 0, 0.7176471, 1, 1,
0.1589497, -0.9131774, 2.966588, 0, 0.7137255, 1, 1,
0.1638328, -0.6533118, 2.416097, 0, 0.7058824, 1, 1,
0.1666634, -0.03158159, 2.591815, 0, 0.6980392, 1, 1,
0.1672715, -0.4821708, 2.482466, 0, 0.6941177, 1, 1,
0.1687207, 1.83949, -0.49829, 0, 0.6862745, 1, 1,
0.1762239, -0.264283, 3.525774, 0, 0.682353, 1, 1,
0.1790184, 1.637447, 1.973035, 0, 0.6745098, 1, 1,
0.1804426, 2.085721, -1.387648, 0, 0.6705883, 1, 1,
0.1808163, -0.3172741, 2.724662, 0, 0.6627451, 1, 1,
0.1822539, -0.3251638, 1.962946, 0, 0.6588235, 1, 1,
0.1859776, -1.081109, 3.26565, 0, 0.6509804, 1, 1,
0.187832, -0.8503572, 2.120128, 0, 0.6470588, 1, 1,
0.1886667, -0.9810452, 2.236954, 0, 0.6392157, 1, 1,
0.1889349, -0.06793304, 3.342968, 0, 0.6352941, 1, 1,
0.1922548, 1.777188, -0.09532672, 0, 0.627451, 1, 1,
0.1937593, -0.9172527, 2.993176, 0, 0.6235294, 1, 1,
0.1956442, -1.056088, 1.694612, 0, 0.6156863, 1, 1,
0.1990381, 0.7570112, 1.254119, 0, 0.6117647, 1, 1,
0.2012078, -0.8593649, 3.045739, 0, 0.6039216, 1, 1,
0.2048825, -2.315331, 3.03126, 0, 0.5960785, 1, 1,
0.2078224, -0.724322, 3.664475, 0, 0.5921569, 1, 1,
0.2084424, 0.1139806, 0.900494, 0, 0.5843138, 1, 1,
0.2110092, 0.846734, 0.3270105, 0, 0.5803922, 1, 1,
0.2249559, -0.8655654, 3.497372, 0, 0.572549, 1, 1,
0.2285345, -0.2877291, 2.314189, 0, 0.5686275, 1, 1,
0.2337983, 1.087246, -0.04398096, 0, 0.5607843, 1, 1,
0.2371868, 0.4050506, 0.7337925, 0, 0.5568628, 1, 1,
0.2373372, -0.6804972, 3.678901, 0, 0.5490196, 1, 1,
0.243604, 0.2239604, -0.1692982, 0, 0.5450981, 1, 1,
0.2456603, -0.3555508, 2.664049, 0, 0.5372549, 1, 1,
0.2506518, 0.5904988, 0.2441601, 0, 0.5333334, 1, 1,
0.2513802, -1.835205, 3.501405, 0, 0.5254902, 1, 1,
0.2539998, 0.5661452, 2.266544, 0, 0.5215687, 1, 1,
0.2559266, 2.047704, 0.7314681, 0, 0.5137255, 1, 1,
0.2580261, -0.4363819, 3.109842, 0, 0.509804, 1, 1,
0.2588876, -0.06534669, 3.015848, 0, 0.5019608, 1, 1,
0.2593742, -0.3451091, 3.749499, 0, 0.4941176, 1, 1,
0.2594591, -0.6690069, 1.606374, 0, 0.4901961, 1, 1,
0.2602303, 0.6443895, 0.8122891, 0, 0.4823529, 1, 1,
0.2633035, 1.28383, 0.3834726, 0, 0.4784314, 1, 1,
0.263747, -0.2686446, 2.459126, 0, 0.4705882, 1, 1,
0.2643403, -0.2070077, 4.41573, 0, 0.4666667, 1, 1,
0.2644009, -2.558068, 4.033689, 0, 0.4588235, 1, 1,
0.2656423, -0.5205825, 3.575798, 0, 0.454902, 1, 1,
0.2670269, 0.1677237, 1.199073, 0, 0.4470588, 1, 1,
0.2708474, -0.181792, 2.103374, 0, 0.4431373, 1, 1,
0.28067, 0.3713028, 1.926754, 0, 0.4352941, 1, 1,
0.2812347, -0.8114058, 4.033175, 0, 0.4313726, 1, 1,
0.2855078, -0.9087306, 2.885007, 0, 0.4235294, 1, 1,
0.2856493, 0.2365272, 1.995562, 0, 0.4196078, 1, 1,
0.2898616, -1.013726, 3.504044, 0, 0.4117647, 1, 1,
0.2909696, -1.13759, 3.713263, 0, 0.4078431, 1, 1,
0.2932642, -0.4035261, 1.608694, 0, 0.4, 1, 1,
0.294031, 0.6000687, -0.6462152, 0, 0.3921569, 1, 1,
0.2963707, 0.9733073, 0.4009243, 0, 0.3882353, 1, 1,
0.3032567, -1.531882, 1.182379, 0, 0.3803922, 1, 1,
0.3037297, 0.09686109, 1.76062, 0, 0.3764706, 1, 1,
0.3050644, 0.07593133, 2.391047, 0, 0.3686275, 1, 1,
0.3057942, 0.5068347, 1.505092, 0, 0.3647059, 1, 1,
0.3060384, -0.2844054, 2.381372, 0, 0.3568628, 1, 1,
0.3066782, -1.319036, 1.025291, 0, 0.3529412, 1, 1,
0.309489, -0.6610917, 2.335609, 0, 0.345098, 1, 1,
0.3101122, 1.670796, 1.575666, 0, 0.3411765, 1, 1,
0.310506, -0.9064594, 2.229218, 0, 0.3333333, 1, 1,
0.312668, 0.5684882, 0.4083786, 0, 0.3294118, 1, 1,
0.3136402, -0.9784731, 3.620378, 0, 0.3215686, 1, 1,
0.3194267, -0.1026679, 0.8604625, 0, 0.3176471, 1, 1,
0.3268561, 1.971152, 2.080336, 0, 0.3098039, 1, 1,
0.3269447, 1.407588, -0.6643168, 0, 0.3058824, 1, 1,
0.328831, -1.10362, 4.549314, 0, 0.2980392, 1, 1,
0.3303832, -2.640894, 5.058494, 0, 0.2901961, 1, 1,
0.3371036, -0.1598608, 1.780415, 0, 0.2862745, 1, 1,
0.3407168, 0.8740546, 1.698648, 0, 0.2784314, 1, 1,
0.3432414, 0.5189617, 0.1695951, 0, 0.2745098, 1, 1,
0.3441898, -0.7831404, 1.887232, 0, 0.2666667, 1, 1,
0.3451085, 0.3574174, -0.4384661, 0, 0.2627451, 1, 1,
0.3508388, -0.3487736, 2.76763, 0, 0.254902, 1, 1,
0.3548672, -0.1536865, 0.9854419, 0, 0.2509804, 1, 1,
0.3552527, -0.9824777, 3.33317, 0, 0.2431373, 1, 1,
0.3607054, -0.5686175, 1.563869, 0, 0.2392157, 1, 1,
0.3647655, 2.025967, 0.9669861, 0, 0.2313726, 1, 1,
0.3672904, 0.6381983, -0.7597492, 0, 0.227451, 1, 1,
0.3688872, -0.5397279, 2.822186, 0, 0.2196078, 1, 1,
0.3713836, 0.8116225, 0.7299777, 0, 0.2156863, 1, 1,
0.3756075, 0.3817881, 0.664536, 0, 0.2078431, 1, 1,
0.377115, -0.7432252, 2.557928, 0, 0.2039216, 1, 1,
0.3805495, 0.2864892, -0.6532098, 0, 0.1960784, 1, 1,
0.3860477, -0.2457613, 2.743942, 0, 0.1882353, 1, 1,
0.3872013, -0.527343, 2.896885, 0, 0.1843137, 1, 1,
0.3875975, -0.2679785, 3.120913, 0, 0.1764706, 1, 1,
0.3895113, 0.2355096, -0.09959546, 0, 0.172549, 1, 1,
0.3963829, -0.9692953, 3.160613, 0, 0.1647059, 1, 1,
0.4026277, -0.8570713, 3.990962, 0, 0.1607843, 1, 1,
0.4167806, 0.5053875, 0.2825553, 0, 0.1529412, 1, 1,
0.4222733, -0.0857816, 1.198233, 0, 0.1490196, 1, 1,
0.4239026, -0.1115851, 2.705736, 0, 0.1411765, 1, 1,
0.429485, 0.7010276, 0.2544097, 0, 0.1372549, 1, 1,
0.4391777, -0.3229147, 3.012516, 0, 0.1294118, 1, 1,
0.4405196, -0.1828388, 1.711331, 0, 0.1254902, 1, 1,
0.4424001, -0.6342604, 2.481081, 0, 0.1176471, 1, 1,
0.4546125, -0.651385, 1.342828, 0, 0.1137255, 1, 1,
0.455302, 0.5679352, 0.5200452, 0, 0.1058824, 1, 1,
0.4606637, -0.1610617, 2.195867, 0, 0.09803922, 1, 1,
0.4636228, 0.4446495, 0.3989314, 0, 0.09411765, 1, 1,
0.4648443, 0.9911717, 1.196274, 0, 0.08627451, 1, 1,
0.4655432, 0.8309755, 2.147885, 0, 0.08235294, 1, 1,
0.4707686, -0.2883674, 2.054479, 0, 0.07450981, 1, 1,
0.4747615, -0.7278056, 1.247189, 0, 0.07058824, 1, 1,
0.4781267, -0.8094399, 2.62911, 0, 0.0627451, 1, 1,
0.4798011, -0.2127916, 3.230334, 0, 0.05882353, 1, 1,
0.4799864, 0.5217779, 0.110245, 0, 0.05098039, 1, 1,
0.4800697, -1.311168, 2.333342, 0, 0.04705882, 1, 1,
0.4815778, -1.959383, 3.051106, 0, 0.03921569, 1, 1,
0.4821108, 0.5802026, -0.1710966, 0, 0.03529412, 1, 1,
0.4822365, 1.104709, 1.17448, 0, 0.02745098, 1, 1,
0.485723, 0.1493662, 2.224543, 0, 0.02352941, 1, 1,
0.4858206, -0.8128275, 2.504505, 0, 0.01568628, 1, 1,
0.486097, -0.6319258, 2.7863, 0, 0.01176471, 1, 1,
0.4870595, -0.5777073, 2.189157, 0, 0.003921569, 1, 1,
0.4878568, -0.7784017, 4.857347, 0.003921569, 0, 1, 1,
0.4927973, -1.104155, 1.66559, 0.007843138, 0, 1, 1,
0.4931559, -0.8006387, -0.6152172, 0.01568628, 0, 1, 1,
0.4959871, 0.145961, 2.156877, 0.01960784, 0, 1, 1,
0.4968246, -1.310397, 1.408693, 0.02745098, 0, 1, 1,
0.4969511, -0.3027911, 0.1889365, 0.03137255, 0, 1, 1,
0.5022124, 0.20632, -0.2422087, 0.03921569, 0, 1, 1,
0.5026397, -0.4501417, 3.127787, 0.04313726, 0, 1, 1,
0.502864, -0.09755024, 1.128595, 0.05098039, 0, 1, 1,
0.5044981, 0.339949, 2.164209, 0.05490196, 0, 1, 1,
0.5065739, 1.504416, 0.6795521, 0.0627451, 0, 1, 1,
0.5069017, 0.230249, 0.9884594, 0.06666667, 0, 1, 1,
0.5088924, -1.916951, 3.31618, 0.07450981, 0, 1, 1,
0.5111195, 1.535271, -1.68652, 0.07843138, 0, 1, 1,
0.5150985, 0.1486651, 0.3835947, 0.08627451, 0, 1, 1,
0.5158486, -0.570521, 1.63901, 0.09019608, 0, 1, 1,
0.5170549, -0.9031006, 2.7651, 0.09803922, 0, 1, 1,
0.5179982, -0.08731285, -0.2390164, 0.1058824, 0, 1, 1,
0.52646, 0.4363994, 1.11316, 0.1098039, 0, 1, 1,
0.529035, 0.3369638, 0.7193789, 0.1176471, 0, 1, 1,
0.5329266, 0.369114, 0.5576392, 0.1215686, 0, 1, 1,
0.5398873, 0.5968985, 1.221982, 0.1294118, 0, 1, 1,
0.5430138, 0.724113, -0.6311463, 0.1333333, 0, 1, 1,
0.5430438, -1.256888, 1.895646, 0.1411765, 0, 1, 1,
0.5455681, -0.8311795, 3.540999, 0.145098, 0, 1, 1,
0.5478095, 0.1781543, 0.5340639, 0.1529412, 0, 1, 1,
0.5491439, 0.6894652, 1.407169, 0.1568628, 0, 1, 1,
0.5502935, -0.4136179, 1.061688, 0.1647059, 0, 1, 1,
0.550458, 0.1026585, -1.32344, 0.1686275, 0, 1, 1,
0.5518935, -1.599225, 0.4082237, 0.1764706, 0, 1, 1,
0.5522007, 1.756142, -0.1188885, 0.1803922, 0, 1, 1,
0.5618381, -0.357526, 1.930394, 0.1882353, 0, 1, 1,
0.5625715, 1.538521, 1.221523, 0.1921569, 0, 1, 1,
0.5640094, 0.0162145, 1.562897, 0.2, 0, 1, 1,
0.5650541, 0.5264795, 2.457598, 0.2078431, 0, 1, 1,
0.5651029, 1.068388, -0.07854809, 0.2117647, 0, 1, 1,
0.5653616, -0.3881748, 3.2207, 0.2196078, 0, 1, 1,
0.5688762, -0.3218645, 2.582774, 0.2235294, 0, 1, 1,
0.5707253, 0.2426022, -0.1889277, 0.2313726, 0, 1, 1,
0.5721685, -0.7930936, 2.433898, 0.2352941, 0, 1, 1,
0.5737296, -1.28687, 4.688993, 0.2431373, 0, 1, 1,
0.5746195, -0.4128772, 4.181802, 0.2470588, 0, 1, 1,
0.5802629, -1.201314, 1.677107, 0.254902, 0, 1, 1,
0.588509, 0.6529782, -0.02513438, 0.2588235, 0, 1, 1,
0.5891232, 1.484533, 3.124382, 0.2666667, 0, 1, 1,
0.5908197, -1.272195, 3.532235, 0.2705882, 0, 1, 1,
0.5984954, -0.518261, -0.589446, 0.2784314, 0, 1, 1,
0.5990124, 1.355746, -0.2592538, 0.282353, 0, 1, 1,
0.5991459, 1.287683, 1.282149, 0.2901961, 0, 1, 1,
0.5999578, -1.379501, 1.763295, 0.2941177, 0, 1, 1,
0.6009442, -0.5958823, 3.193968, 0.3019608, 0, 1, 1,
0.6015927, -0.03732155, 1.794332, 0.3098039, 0, 1, 1,
0.6021302, 1.641315, 0.3187897, 0.3137255, 0, 1, 1,
0.6028939, -0.8307651, 2.038926, 0.3215686, 0, 1, 1,
0.6031253, -0.3432272, 1.40423, 0.3254902, 0, 1, 1,
0.6032075, 0.02689504, 2.046453, 0.3333333, 0, 1, 1,
0.6056433, -0.9778631, 1.725283, 0.3372549, 0, 1, 1,
0.6061869, 0.6216894, 1.183065, 0.345098, 0, 1, 1,
0.611405, 0.6051109, 1.594557, 0.3490196, 0, 1, 1,
0.6123801, -1.532711, 1.299566, 0.3568628, 0, 1, 1,
0.6152392, 1.147251, 0.9209988, 0.3607843, 0, 1, 1,
0.6164333, -0.8254278, 3.994559, 0.3686275, 0, 1, 1,
0.6192387, 0.1094501, 2.647347, 0.372549, 0, 1, 1,
0.6207184, -1.238868, 1.72379, 0.3803922, 0, 1, 1,
0.6250777, 1.36249, 1.575639, 0.3843137, 0, 1, 1,
0.6260865, 1.191378, 1.451849, 0.3921569, 0, 1, 1,
0.6326799, 1.54516, -1.693534, 0.3960784, 0, 1, 1,
0.6396115, 1.121424, 1.047967, 0.4039216, 0, 1, 1,
0.6432123, 0.40616, -0.1616993, 0.4117647, 0, 1, 1,
0.6444334, 0.1046444, 2.049181, 0.4156863, 0, 1, 1,
0.6496112, -0.1399769, 2.668019, 0.4235294, 0, 1, 1,
0.6517193, -0.1421224, 1.003763, 0.427451, 0, 1, 1,
0.6520965, -1.02488, 1.574109, 0.4352941, 0, 1, 1,
0.6561825, 2.021182, 0.4767716, 0.4392157, 0, 1, 1,
0.6585761, -0.3532732, 2.849229, 0.4470588, 0, 1, 1,
0.6588587, 1.053996, 0.6843345, 0.4509804, 0, 1, 1,
0.6636831, -1.108767, 4.295588, 0.4588235, 0, 1, 1,
0.6698112, -1.801118, 3.664073, 0.4627451, 0, 1, 1,
0.6833733, 1.46964, 0.5517693, 0.4705882, 0, 1, 1,
0.6876192, -0.4749934, 2.117225, 0.4745098, 0, 1, 1,
0.6908764, -0.9878179, 1.536261, 0.4823529, 0, 1, 1,
0.6953307, -0.3214483, 2.756864, 0.4862745, 0, 1, 1,
0.6969041, 0.4020753, -0.978812, 0.4941176, 0, 1, 1,
0.6969253, 0.03443511, 1.487113, 0.5019608, 0, 1, 1,
0.7015344, 0.317643, 0.6529253, 0.5058824, 0, 1, 1,
0.7058898, -0.05714658, 1.184549, 0.5137255, 0, 1, 1,
0.7131987, -1.051708, 2.834335, 0.5176471, 0, 1, 1,
0.7185147, -0.531256, 3.297332, 0.5254902, 0, 1, 1,
0.7244241, 2.090233, 1.482927, 0.5294118, 0, 1, 1,
0.7281832, -1.217801, 1.453979, 0.5372549, 0, 1, 1,
0.7329685, -0.7141908, 2.097082, 0.5411765, 0, 1, 1,
0.735142, 1.676966, -0.6426881, 0.5490196, 0, 1, 1,
0.7437682, 0.09121958, 1.778016, 0.5529412, 0, 1, 1,
0.7466021, 0.1219684, 1.240186, 0.5607843, 0, 1, 1,
0.7524952, 0.6889023, 0.6155884, 0.5647059, 0, 1, 1,
0.7594941, 0.1639007, 1.602288, 0.572549, 0, 1, 1,
0.7600441, 0.2781863, 2.987478, 0.5764706, 0, 1, 1,
0.7614565, -0.5325654, 1.934002, 0.5843138, 0, 1, 1,
0.7634016, -0.6541277, 2.23107, 0.5882353, 0, 1, 1,
0.7651421, -0.4584479, 2.636675, 0.5960785, 0, 1, 1,
0.7689305, 0.07007898, 3.552218, 0.6039216, 0, 1, 1,
0.7749836, -1.500192, 3.163049, 0.6078432, 0, 1, 1,
0.7769131, 0.2215655, 1.499629, 0.6156863, 0, 1, 1,
0.7793378, 0.9920111, 0.418949, 0.6196079, 0, 1, 1,
0.7798453, -0.3473099, 2.147233, 0.627451, 0, 1, 1,
0.7821587, 1.107192, -0.6342986, 0.6313726, 0, 1, 1,
0.7841578, -0.6739829, 1.709298, 0.6392157, 0, 1, 1,
0.7881567, -0.003209075, 2.038606, 0.6431373, 0, 1, 1,
0.7929515, 0.2781944, -1.4241, 0.6509804, 0, 1, 1,
0.8014351, 0.9126493, -0.07716837, 0.654902, 0, 1, 1,
0.8043761, -0.4521908, 2.257962, 0.6627451, 0, 1, 1,
0.8065045, 0.8391622, -1.481619, 0.6666667, 0, 1, 1,
0.8073544, -1.488268, 4.530428, 0.6745098, 0, 1, 1,
0.8123299, 0.8898445, 0.1346803, 0.6784314, 0, 1, 1,
0.8150971, -1.112252, 1.282538, 0.6862745, 0, 1, 1,
0.8160643, 0.9780855, 0.7648293, 0.6901961, 0, 1, 1,
0.8196861, -1.204961, 1.900057, 0.6980392, 0, 1, 1,
0.8200714, -1.325869, 2.093194, 0.7058824, 0, 1, 1,
0.8201604, 0.4659283, 1.14502, 0.7098039, 0, 1, 1,
0.8248141, -0.6409535, 4.455008, 0.7176471, 0, 1, 1,
0.829991, -1.52195, 3.850979, 0.7215686, 0, 1, 1,
0.8467629, 0.8226766, -2.008229, 0.7294118, 0, 1, 1,
0.8471538, 1.110316, 1.386628, 0.7333333, 0, 1, 1,
0.8473508, -0.3014875, 0.7627656, 0.7411765, 0, 1, 1,
0.8493132, 0.1161478, 1.377088, 0.7450981, 0, 1, 1,
0.8542473, -0.4832356, 1.967974, 0.7529412, 0, 1, 1,
0.8659718, 0.1400547, 0.3890788, 0.7568628, 0, 1, 1,
0.8689725, 1.830596, 1.563506, 0.7647059, 0, 1, 1,
0.8732181, 1.180687, -0.7118872, 0.7686275, 0, 1, 1,
0.8750752, -0.5844215, 2.45242, 0.7764706, 0, 1, 1,
0.8755603, 0.5400804, 0.9673764, 0.7803922, 0, 1, 1,
0.8788597, 0.6785246, 0.4945656, 0.7882353, 0, 1, 1,
0.8831809, -1.386512, 1.944006, 0.7921569, 0, 1, 1,
0.886194, -1.035141, 3.130835, 0.8, 0, 1, 1,
0.88753, 0.0653664, -0.6013371, 0.8078431, 0, 1, 1,
0.8881673, 0.826094, 0.3677019, 0.8117647, 0, 1, 1,
0.8912999, 0.02518894, 0.3096201, 0.8196079, 0, 1, 1,
0.8927358, 0.193148, 2.531692, 0.8235294, 0, 1, 1,
0.8950363, 1.065872, 1.475557, 0.8313726, 0, 1, 1,
0.9011395, -0.4922644, 1.641431, 0.8352941, 0, 1, 1,
0.903597, -1.787847, 2.357038, 0.8431373, 0, 1, 1,
0.9041249, -0.9720545, 3.516748, 0.8470588, 0, 1, 1,
0.9199944, -2.637254, 3.386367, 0.854902, 0, 1, 1,
0.9264699, 0.414567, 0.8727376, 0.8588235, 0, 1, 1,
0.927087, 1.467049, 0.5692316, 0.8666667, 0, 1, 1,
0.9404258, 0.2094314, 1.24363, 0.8705882, 0, 1, 1,
0.9415903, -0.1728669, 2.809943, 0.8784314, 0, 1, 1,
0.9536114, -0.3457787, 1.957652, 0.8823529, 0, 1, 1,
0.9567866, 0.3489636, 1.20747, 0.8901961, 0, 1, 1,
0.9619794, -2.307546, 2.228847, 0.8941177, 0, 1, 1,
0.9711882, 0.343297, 1.546625, 0.9019608, 0, 1, 1,
0.9742547, 0.04373763, 3.907259, 0.9098039, 0, 1, 1,
0.9767125, -1.144775, 3.187715, 0.9137255, 0, 1, 1,
0.9767721, -0.8517802, 0.7563013, 0.9215686, 0, 1, 1,
0.979091, 1.094649, -0.6527515, 0.9254902, 0, 1, 1,
0.9824979, 0.2403344, 0.8944725, 0.9333333, 0, 1, 1,
0.9912121, 1.017969, 1.419696, 0.9372549, 0, 1, 1,
0.9933524, -0.4862271, 2.490966, 0.945098, 0, 1, 1,
1.001797, -1.691584, 0.6089426, 0.9490196, 0, 1, 1,
1.003366, -1.115294, 2.705644, 0.9568627, 0, 1, 1,
1.005049, -0.1465045, 1.447867, 0.9607843, 0, 1, 1,
1.005725, -0.6740153, 1.836324, 0.9686275, 0, 1, 1,
1.019616, 0.2798532, 1.383854, 0.972549, 0, 1, 1,
1.021014, 1.680937, -0.4037095, 0.9803922, 0, 1, 1,
1.022956, 0.305688, 1.014678, 0.9843137, 0, 1, 1,
1.023054, -0.3896649, 2.411034, 0.9921569, 0, 1, 1,
1.03078, -0.7755077, -0.279896, 0.9960784, 0, 1, 1,
1.034935, -0.5604335, 0.6673934, 1, 0, 0.9960784, 1,
1.035214, -0.3885292, 1.52627, 1, 0, 0.9882353, 1,
1.035343, -1.001742, 2.600387, 1, 0, 0.9843137, 1,
1.035793, 0.2082628, 1.554761, 1, 0, 0.9764706, 1,
1.037727, -2.336867, 1.038807, 1, 0, 0.972549, 1,
1.042048, 1.525793, 0.4074908, 1, 0, 0.9647059, 1,
1.044535, -1.173375, 3.096558, 1, 0, 0.9607843, 1,
1.045036, 0.7457983, 0.317533, 1, 0, 0.9529412, 1,
1.054808, 0.2559882, 0.7436432, 1, 0, 0.9490196, 1,
1.060224, 0.4973636, 1.061495, 1, 0, 0.9411765, 1,
1.063136, -0.1847756, -0.4058743, 1, 0, 0.9372549, 1,
1.066426, 0.2076444, 0.1635527, 1, 0, 0.9294118, 1,
1.06682, -0.4829922, 1.269018, 1, 0, 0.9254902, 1,
1.072361, 1.785878, -1.163279, 1, 0, 0.9176471, 1,
1.072464, -0.6936275, 2.305704, 1, 0, 0.9137255, 1,
1.073967, -1.221811, 2.758415, 1, 0, 0.9058824, 1,
1.082602, 0.7585228, 1.350303, 1, 0, 0.9019608, 1,
1.086084, 1.109493, -0.8679931, 1, 0, 0.8941177, 1,
1.092452, -0.586386, 0.4630918, 1, 0, 0.8862745, 1,
1.09559, 1.153863, 2.195485, 1, 0, 0.8823529, 1,
1.102161, -0.6832908, 3.810754, 1, 0, 0.8745098, 1,
1.108243, -0.6643567, 1.424129, 1, 0, 0.8705882, 1,
1.110095, 0.5346919, 0.902782, 1, 0, 0.8627451, 1,
1.111669, 0.2278672, 0.5461883, 1, 0, 0.8588235, 1,
1.112826, -0.8990925, 2.41132, 1, 0, 0.8509804, 1,
1.116202, 0.5666361, 1.45362, 1, 0, 0.8470588, 1,
1.124875, -1.433972, 0.9259168, 1, 0, 0.8392157, 1,
1.125512, -0.005718658, 0.4448895, 1, 0, 0.8352941, 1,
1.134046, -0.6012458, 2.140507, 1, 0, 0.827451, 1,
1.134223, 0.7163067, 1.095837, 1, 0, 0.8235294, 1,
1.137393, 0.224606, 2.396356, 1, 0, 0.8156863, 1,
1.137769, 0.5325573, 1.215047, 1, 0, 0.8117647, 1,
1.142035, -1.186833, 2.178517, 1, 0, 0.8039216, 1,
1.148689, -1.530022, 3.187913, 1, 0, 0.7960784, 1,
1.149417, -0.1181625, 1.077224, 1, 0, 0.7921569, 1,
1.168196, -0.3601305, 2.022948, 1, 0, 0.7843137, 1,
1.170617, -0.3940887, 2.991797, 1, 0, 0.7803922, 1,
1.172938, 0.7847981, -0.1551393, 1, 0, 0.772549, 1,
1.172958, -0.07856201, 0.5185435, 1, 0, 0.7686275, 1,
1.182671, 0.1943717, 1.518323, 1, 0, 0.7607843, 1,
1.185775, 0.4428717, 0.2308563, 1, 0, 0.7568628, 1,
1.18589, -0.2383669, 1.870547, 1, 0, 0.7490196, 1,
1.194417, -0.2387108, 1.568361, 1, 0, 0.7450981, 1,
1.197054, -0.1118664, 2.921809, 1, 0, 0.7372549, 1,
1.208353, -0.5589718, 2.205945, 1, 0, 0.7333333, 1,
1.209151, 0.5636052, 0.9864727, 1, 0, 0.7254902, 1,
1.210875, -0.7535917, 4.004556, 1, 0, 0.7215686, 1,
1.2127, -0.9054275, 1.550222, 1, 0, 0.7137255, 1,
1.233834, 0.4168575, -0.3896564, 1, 0, 0.7098039, 1,
1.235998, -1.815779, 2.936165, 1, 0, 0.7019608, 1,
1.240087, 0.2608608, 0.9845165, 1, 0, 0.6941177, 1,
1.255803, -0.3802437, 2.6373, 1, 0, 0.6901961, 1,
1.25713, 0.8678814, 1.678406, 1, 0, 0.682353, 1,
1.260615, 1.859883, 1.390501, 1, 0, 0.6784314, 1,
1.263813, -0.5167128, 1.381774, 1, 0, 0.6705883, 1,
1.281797, 0.9218518, 1.526757, 1, 0, 0.6666667, 1,
1.292965, 0.6464444, 2.262507, 1, 0, 0.6588235, 1,
1.296386, -0.3356725, 1.674967, 1, 0, 0.654902, 1,
1.297155, 1.396108, 0.4952579, 1, 0, 0.6470588, 1,
1.307473, 2.732677, -0.3311461, 1, 0, 0.6431373, 1,
1.323721, -0.2287542, 2.197515, 1, 0, 0.6352941, 1,
1.323762, 0.9060765, 0.1174629, 1, 0, 0.6313726, 1,
1.325974, -1.080774, 2.567356, 1, 0, 0.6235294, 1,
1.339307, -0.2926082, 2.622396, 1, 0, 0.6196079, 1,
1.340823, -0.4199356, 1.857799, 1, 0, 0.6117647, 1,
1.341052, 0.541977, 0.6926748, 1, 0, 0.6078432, 1,
1.345121, 0.1399932, 0.1729301, 1, 0, 0.6, 1,
1.346616, -0.2995317, 2.05961, 1, 0, 0.5921569, 1,
1.347455, -0.8060634, 1.493305, 1, 0, 0.5882353, 1,
1.356089, -1.530406, 2.623472, 1, 0, 0.5803922, 1,
1.360841, -0.2793981, 3.067778, 1, 0, 0.5764706, 1,
1.368369, 1.29731, -1.902107, 1, 0, 0.5686275, 1,
1.368552, 0.579675, 2.771699, 1, 0, 0.5647059, 1,
1.37447, -0.1444578, 0.9843411, 1, 0, 0.5568628, 1,
1.38338, -0.3052662, 1.974248, 1, 0, 0.5529412, 1,
1.387776, -0.4761279, 1.715085, 1, 0, 0.5450981, 1,
1.390665, -1.696766, 4.271272, 1, 0, 0.5411765, 1,
1.397229, -2.017806, 2.85162, 1, 0, 0.5333334, 1,
1.397892, -0.6849697, 2.32932, 1, 0, 0.5294118, 1,
1.402742, -0.4949575, 1.857922, 1, 0, 0.5215687, 1,
1.406167, -0.4628066, 1.163338, 1, 0, 0.5176471, 1,
1.409552, 1.032283, 1.906683, 1, 0, 0.509804, 1,
1.413703, -0.06972676, 1.21467, 1, 0, 0.5058824, 1,
1.419144, 1.399925, 1.973282, 1, 0, 0.4980392, 1,
1.428225, -1.342187, 0.9697606, 1, 0, 0.4901961, 1,
1.428468, -0.5243225, 2.41297, 1, 0, 0.4862745, 1,
1.431989, -1.348834, 2.685627, 1, 0, 0.4784314, 1,
1.445713, -0.9037396, 1.941608, 1, 0, 0.4745098, 1,
1.446573, 1.015973, 0.867669, 1, 0, 0.4666667, 1,
1.453385, 0.5275338, 2.130679, 1, 0, 0.4627451, 1,
1.461814, 0.2525871, 2.190106, 1, 0, 0.454902, 1,
1.474133, -0.8940371, 1.393936, 1, 0, 0.4509804, 1,
1.475608, -1.439682, 2.377189, 1, 0, 0.4431373, 1,
1.486273, 0.3942824, 1.739218, 1, 0, 0.4392157, 1,
1.503116, -1.167776, 2.774588, 1, 0, 0.4313726, 1,
1.507659, 0.5692501, 1.002308, 1, 0, 0.427451, 1,
1.513664, -0.988552, 0.2143299, 1, 0, 0.4196078, 1,
1.517868, 1.297952, 0.1802333, 1, 0, 0.4156863, 1,
1.518178, 0.03362979, 2.282969, 1, 0, 0.4078431, 1,
1.518244, 0.2659237, 2.059404, 1, 0, 0.4039216, 1,
1.552204, 0.1264328, 1.815788, 1, 0, 0.3960784, 1,
1.552408, 0.3733391, 0.8935252, 1, 0, 0.3882353, 1,
1.562704, 0.9696043, 0.9329292, 1, 0, 0.3843137, 1,
1.585495, -1.241119, 3.187173, 1, 0, 0.3764706, 1,
1.588941, 0.8973374, 1.572423, 1, 0, 0.372549, 1,
1.589656, 2.112544, 0.7545924, 1, 0, 0.3647059, 1,
1.596017, -1.409879, 2.055803, 1, 0, 0.3607843, 1,
1.61737, -1.253585, 3.93167, 1, 0, 0.3529412, 1,
1.617406, 0.8945432, -0.3930032, 1, 0, 0.3490196, 1,
1.63901, -0.2307768, -0.695731, 1, 0, 0.3411765, 1,
1.640634, -0.9986773, 0.6594976, 1, 0, 0.3372549, 1,
1.647159, -0.4896874, 2.677036, 1, 0, 0.3294118, 1,
1.653442, 1.611597, 2.127891, 1, 0, 0.3254902, 1,
1.654713, 1.333867, 2.430225, 1, 0, 0.3176471, 1,
1.660287, 0.5243216, 1.558428, 1, 0, 0.3137255, 1,
1.66035, 0.5619355, -0.2265296, 1, 0, 0.3058824, 1,
1.68077, 0.1790394, 1.346581, 1, 0, 0.2980392, 1,
1.682828, 2.054701, -0.7997171, 1, 0, 0.2941177, 1,
1.690587, -0.1773794, 1.041303, 1, 0, 0.2862745, 1,
1.706067, -0.1121165, 1.623589, 1, 0, 0.282353, 1,
1.724906, 1.700909, -0.2159443, 1, 0, 0.2745098, 1,
1.741669, -0.6252697, 0.7468272, 1, 0, 0.2705882, 1,
1.745139, -0.5010673, 0.9304044, 1, 0, 0.2627451, 1,
1.759561, 0.9730793, 1.751848, 1, 0, 0.2588235, 1,
1.774462, 1.179708, 1.588076, 1, 0, 0.2509804, 1,
1.781637, 0.936848, 0.9676464, 1, 0, 0.2470588, 1,
1.800247, 0.6771238, 2.426368, 1, 0, 0.2392157, 1,
1.802405, 2.043442, 0.6444991, 1, 0, 0.2352941, 1,
1.803041, 1.779671, -0.5978974, 1, 0, 0.227451, 1,
1.814338, 0.4422852, 2.29537, 1, 0, 0.2235294, 1,
1.814561, -1.168095, 3.162885, 1, 0, 0.2156863, 1,
1.830306, 0.8064083, -0.09714437, 1, 0, 0.2117647, 1,
1.835435, 0.6465184, 0.04468011, 1, 0, 0.2039216, 1,
1.856762, 1.749894, 0.5637661, 1, 0, 0.1960784, 1,
1.890333, 0.06756064, 1.924265, 1, 0, 0.1921569, 1,
1.892052, -0.1823755, 1.785862, 1, 0, 0.1843137, 1,
1.904034, -1.710856, 1.852285, 1, 0, 0.1803922, 1,
1.932913, -0.004854087, 1.115213, 1, 0, 0.172549, 1,
1.935018, -2.427056, 3.59512, 1, 0, 0.1686275, 1,
1.97102, -0.3827089, 2.804839, 1, 0, 0.1607843, 1,
1.993379, -0.6739333, 3.22969, 1, 0, 0.1568628, 1,
1.995588, -1.082572, 3.209514, 1, 0, 0.1490196, 1,
2.016854, 0.4599933, 3.515975, 1, 0, 0.145098, 1,
2.036782, 0.1132981, 1.035599, 1, 0, 0.1372549, 1,
2.076457, 1.018563, 2.646011, 1, 0, 0.1333333, 1,
2.077722, -1.595343, 3.632043, 1, 0, 0.1254902, 1,
2.081141, -0.5474354, 2.299891, 1, 0, 0.1215686, 1,
2.130386, -0.6190372, 1.002787, 1, 0, 0.1137255, 1,
2.132626, -0.5024625, 1.805804, 1, 0, 0.1098039, 1,
2.141113, 0.8055496, 0.6953647, 1, 0, 0.1019608, 1,
2.199725, -0.2745486, 2.880161, 1, 0, 0.09411765, 1,
2.206552, -0.6379647, 2.86317, 1, 0, 0.09019608, 1,
2.247039, 0.9191435, -0.3156081, 1, 0, 0.08235294, 1,
2.311508, 0.4991915, 0.4347123, 1, 0, 0.07843138, 1,
2.316217, -1.130414, 1.898624, 1, 0, 0.07058824, 1,
2.328811, -0.2647606, 1.480424, 1, 0, 0.06666667, 1,
2.349114, -1.620538, 3.200813, 1, 0, 0.05882353, 1,
2.385374, -0.06980317, 0.9817373, 1, 0, 0.05490196, 1,
2.394178, -0.5841376, 0.9114874, 1, 0, 0.04705882, 1,
2.496338, 0.03111845, 2.639205, 1, 0, 0.04313726, 1,
2.542688, 0.5917146, 0.8463525, 1, 0, 0.03529412, 1,
2.572555, -0.7453669, 1.992634, 1, 0, 0.03137255, 1,
2.591364, -0.7249606, 3.055837, 1, 0, 0.02352941, 1,
2.726963, -0.5254233, 2.4138, 1, 0, 0.01960784, 1,
2.849467, 0.8804165, -0.08343004, 1, 0, 0.01176471, 1,
3.186865, -0.04238001, 0.7909644, 1, 0, 0.007843138, 1
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
0.07725883, -4.436849, -7.426777, 0, -0.5, 0.5, 0.5,
0.07725883, -4.436849, -7.426777, 1, -0.5, 0.5, 0.5,
0.07725883, -4.436849, -7.426777, 1, 1.5, 0.5, 0.5,
0.07725883, -4.436849, -7.426777, 0, 1.5, 0.5, 0.5
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
-4.086504, -0.0385747, -7.426777, 0, -0.5, 0.5, 0.5,
-4.086504, -0.0385747, -7.426777, 1, -0.5, 0.5, 0.5,
-4.086504, -0.0385747, -7.426777, 1, 1.5, 0.5, 0.5,
-4.086504, -0.0385747, -7.426777, 0, 1.5, 0.5, 0.5
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
-4.086504, -4.436849, 0.0342288, 0, -0.5, 0.5, 0.5,
-4.086504, -4.436849, 0.0342288, 1, -0.5, 0.5, 0.5,
-4.086504, -4.436849, 0.0342288, 1, 1.5, 0.5, 0.5,
-4.086504, -4.436849, 0.0342288, 0, 1.5, 0.5, 0.5
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
-3, -3.421863, -5.705007,
3, -3.421863, -5.705007,
-3, -3.421863, -5.705007,
-3, -3.591027, -5.991969,
-2, -3.421863, -5.705007,
-2, -3.591027, -5.991969,
-1, -3.421863, -5.705007,
-1, -3.591027, -5.991969,
0, -3.421863, -5.705007,
0, -3.591027, -5.991969,
1, -3.421863, -5.705007,
1, -3.591027, -5.991969,
2, -3.421863, -5.705007,
2, -3.591027, -5.991969,
3, -3.421863, -5.705007,
3, -3.591027, -5.991969
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
-3, -3.929356, -6.565892, 0, -0.5, 0.5, 0.5,
-3, -3.929356, -6.565892, 1, -0.5, 0.5, 0.5,
-3, -3.929356, -6.565892, 1, 1.5, 0.5, 0.5,
-3, -3.929356, -6.565892, 0, 1.5, 0.5, 0.5,
-2, -3.929356, -6.565892, 0, -0.5, 0.5, 0.5,
-2, -3.929356, -6.565892, 1, -0.5, 0.5, 0.5,
-2, -3.929356, -6.565892, 1, 1.5, 0.5, 0.5,
-2, -3.929356, -6.565892, 0, 1.5, 0.5, 0.5,
-1, -3.929356, -6.565892, 0, -0.5, 0.5, 0.5,
-1, -3.929356, -6.565892, 1, -0.5, 0.5, 0.5,
-1, -3.929356, -6.565892, 1, 1.5, 0.5, 0.5,
-1, -3.929356, -6.565892, 0, 1.5, 0.5, 0.5,
0, -3.929356, -6.565892, 0, -0.5, 0.5, 0.5,
0, -3.929356, -6.565892, 1, -0.5, 0.5, 0.5,
0, -3.929356, -6.565892, 1, 1.5, 0.5, 0.5,
0, -3.929356, -6.565892, 0, 1.5, 0.5, 0.5,
1, -3.929356, -6.565892, 0, -0.5, 0.5, 0.5,
1, -3.929356, -6.565892, 1, -0.5, 0.5, 0.5,
1, -3.929356, -6.565892, 1, 1.5, 0.5, 0.5,
1, -3.929356, -6.565892, 0, 1.5, 0.5, 0.5,
2, -3.929356, -6.565892, 0, -0.5, 0.5, 0.5,
2, -3.929356, -6.565892, 1, -0.5, 0.5, 0.5,
2, -3.929356, -6.565892, 1, 1.5, 0.5, 0.5,
2, -3.929356, -6.565892, 0, 1.5, 0.5, 0.5,
3, -3.929356, -6.565892, 0, -0.5, 0.5, 0.5,
3, -3.929356, -6.565892, 1, -0.5, 0.5, 0.5,
3, -3.929356, -6.565892, 1, 1.5, 0.5, 0.5,
3, -3.929356, -6.565892, 0, 1.5, 0.5, 0.5
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
-3.125635, -3, -5.705007,
-3.125635, 3, -5.705007,
-3.125635, -3, -5.705007,
-3.28578, -3, -5.991969,
-3.125635, -2, -5.705007,
-3.28578, -2, -5.991969,
-3.125635, -1, -5.705007,
-3.28578, -1, -5.991969,
-3.125635, 0, -5.705007,
-3.28578, 0, -5.991969,
-3.125635, 1, -5.705007,
-3.28578, 1, -5.991969,
-3.125635, 2, -5.705007,
-3.28578, 2, -5.991969,
-3.125635, 3, -5.705007,
-3.28578, 3, -5.991969
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
-3.606069, -3, -6.565892, 0, -0.5, 0.5, 0.5,
-3.606069, -3, -6.565892, 1, -0.5, 0.5, 0.5,
-3.606069, -3, -6.565892, 1, 1.5, 0.5, 0.5,
-3.606069, -3, -6.565892, 0, 1.5, 0.5, 0.5,
-3.606069, -2, -6.565892, 0, -0.5, 0.5, 0.5,
-3.606069, -2, -6.565892, 1, -0.5, 0.5, 0.5,
-3.606069, -2, -6.565892, 1, 1.5, 0.5, 0.5,
-3.606069, -2, -6.565892, 0, 1.5, 0.5, 0.5,
-3.606069, -1, -6.565892, 0, -0.5, 0.5, 0.5,
-3.606069, -1, -6.565892, 1, -0.5, 0.5, 0.5,
-3.606069, -1, -6.565892, 1, 1.5, 0.5, 0.5,
-3.606069, -1, -6.565892, 0, 1.5, 0.5, 0.5,
-3.606069, 0, -6.565892, 0, -0.5, 0.5, 0.5,
-3.606069, 0, -6.565892, 1, -0.5, 0.5, 0.5,
-3.606069, 0, -6.565892, 1, 1.5, 0.5, 0.5,
-3.606069, 0, -6.565892, 0, 1.5, 0.5, 0.5,
-3.606069, 1, -6.565892, 0, -0.5, 0.5, 0.5,
-3.606069, 1, -6.565892, 1, -0.5, 0.5, 0.5,
-3.606069, 1, -6.565892, 1, 1.5, 0.5, 0.5,
-3.606069, 1, -6.565892, 0, 1.5, 0.5, 0.5,
-3.606069, 2, -6.565892, 0, -0.5, 0.5, 0.5,
-3.606069, 2, -6.565892, 1, -0.5, 0.5, 0.5,
-3.606069, 2, -6.565892, 1, 1.5, 0.5, 0.5,
-3.606069, 2, -6.565892, 0, 1.5, 0.5, 0.5,
-3.606069, 3, -6.565892, 0, -0.5, 0.5, 0.5,
-3.606069, 3, -6.565892, 1, -0.5, 0.5, 0.5,
-3.606069, 3, -6.565892, 1, 1.5, 0.5, 0.5,
-3.606069, 3, -6.565892, 0, 1.5, 0.5, 0.5
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
-3.125635, -3.421863, -4,
-3.125635, -3.421863, 4,
-3.125635, -3.421863, -4,
-3.28578, -3.591027, -4,
-3.125635, -3.421863, -2,
-3.28578, -3.591027, -2,
-3.125635, -3.421863, 0,
-3.28578, -3.591027, 0,
-3.125635, -3.421863, 2,
-3.28578, -3.591027, 2,
-3.125635, -3.421863, 4,
-3.28578, -3.591027, 4
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
-3.606069, -3.929356, -4, 0, -0.5, 0.5, 0.5,
-3.606069, -3.929356, -4, 1, -0.5, 0.5, 0.5,
-3.606069, -3.929356, -4, 1, 1.5, 0.5, 0.5,
-3.606069, -3.929356, -4, 0, 1.5, 0.5, 0.5,
-3.606069, -3.929356, -2, 0, -0.5, 0.5, 0.5,
-3.606069, -3.929356, -2, 1, -0.5, 0.5, 0.5,
-3.606069, -3.929356, -2, 1, 1.5, 0.5, 0.5,
-3.606069, -3.929356, -2, 0, 1.5, 0.5, 0.5,
-3.606069, -3.929356, 0, 0, -0.5, 0.5, 0.5,
-3.606069, -3.929356, 0, 1, -0.5, 0.5, 0.5,
-3.606069, -3.929356, 0, 1, 1.5, 0.5, 0.5,
-3.606069, -3.929356, 0, 0, 1.5, 0.5, 0.5,
-3.606069, -3.929356, 2, 0, -0.5, 0.5, 0.5,
-3.606069, -3.929356, 2, 1, -0.5, 0.5, 0.5,
-3.606069, -3.929356, 2, 1, 1.5, 0.5, 0.5,
-3.606069, -3.929356, 2, 0, 1.5, 0.5, 0.5,
-3.606069, -3.929356, 4, 0, -0.5, 0.5, 0.5,
-3.606069, -3.929356, 4, 1, -0.5, 0.5, 0.5,
-3.606069, -3.929356, 4, 1, 1.5, 0.5, 0.5,
-3.606069, -3.929356, 4, 0, 1.5, 0.5, 0.5
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
-3.125635, -3.421863, -5.705007,
-3.125635, 3.344713, -5.705007,
-3.125635, -3.421863, 5.773465,
-3.125635, 3.344713, 5.773465,
-3.125635, -3.421863, -5.705007,
-3.125635, -3.421863, 5.773465,
-3.125635, 3.344713, -5.705007,
-3.125635, 3.344713, 5.773465,
-3.125635, -3.421863, -5.705007,
3.280153, -3.421863, -5.705007,
-3.125635, -3.421863, 5.773465,
3.280153, -3.421863, 5.773465,
-3.125635, 3.344713, -5.705007,
3.280153, 3.344713, -5.705007,
-3.125635, 3.344713, 5.773465,
3.280153, 3.344713, 5.773465,
3.280153, -3.421863, -5.705007,
3.280153, 3.344713, -5.705007,
3.280153, -3.421863, 5.773465,
3.280153, 3.344713, 5.773465,
3.280153, -3.421863, -5.705007,
3.280153, -3.421863, 5.773465,
3.280153, 3.344713, -5.705007,
3.280153, 3.344713, 5.773465
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
var radius = 7.894537;
var distance = 35.12369;
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
mvMatrix.translate( -0.07725883, 0.0385747, -0.0342288 );
mvMatrix.scale( 1.332502, 1.261455, 0.7436293 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.12369);
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
ethyl_acetate<-read.table("ethyl_acetate.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-ethyl_acetate$V2
```

```
## Error in eval(expr, envir, enclos): object 'ethyl_acetate' not found
```

```r
y<-ethyl_acetate$V3
```

```
## Error in eval(expr, envir, enclos): object 'ethyl_acetate' not found
```

```r
z<-ethyl_acetate$V4
```

```
## Error in eval(expr, envir, enclos): object 'ethyl_acetate' not found
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
-3.032347, 0.6529687, -1.753102, 0, 0, 1, 1, 1,
-2.864655, 0.4337899, -1.984714, 1, 0, 0, 1, 1,
-2.669945, -0.382322, -1.208984, 1, 0, 0, 1, 1,
-2.601759, -0.5262414, -0.6266866, 1, 0, 0, 1, 1,
-2.59878, -0.07226346, -0.798376, 1, 0, 0, 1, 1,
-2.474046, -0.02864265, -3.37926, 1, 0, 0, 1, 1,
-2.415698, 0.141018, -0.5374949, 0, 0, 0, 1, 1,
-2.294761, -0.3642637, 0.1640453, 0, 0, 0, 1, 1,
-2.223958, 0.09324093, -0.7607841, 0, 0, 0, 1, 1,
-2.152002, -0.9007323, -2.584498, 0, 0, 0, 1, 1,
-2.120078, -0.8157075, -1.08889, 0, 0, 0, 1, 1,
-2.070922, -0.5821198, -3.604245, 0, 0, 0, 1, 1,
-2.062621, 0.6603841, -0.7778488, 0, 0, 0, 1, 1,
-2.010666, 0.8141587, -1.267301, 1, 1, 1, 1, 1,
-1.956012, 1.04641, -0.2965941, 1, 1, 1, 1, 1,
-1.93266, 1.207908, -2.333014, 1, 1, 1, 1, 1,
-1.922311, 0.8803972, -1.161228, 1, 1, 1, 1, 1,
-1.91166, 1.51126, 0.1669335, 1, 1, 1, 1, 1,
-1.854619, 0.1139573, -1.443347, 1, 1, 1, 1, 1,
-1.841217, 0.2322043, -2.095996, 1, 1, 1, 1, 1,
-1.835583, -0.4813933, 0.02803778, 1, 1, 1, 1, 1,
-1.790339, -0.3267383, 1.410474, 1, 1, 1, 1, 1,
-1.764033, -1.25316, -2.576633, 1, 1, 1, 1, 1,
-1.729292, -0.8749099, -2.942425, 1, 1, 1, 1, 1,
-1.72705, 0.3970653, -1.376656, 1, 1, 1, 1, 1,
-1.722617, -2.01224, -2.799524, 1, 1, 1, 1, 1,
-1.720782, 1.207119, -2.100396, 1, 1, 1, 1, 1,
-1.712094, -0.8577546, -2.163349, 1, 1, 1, 1, 1,
-1.712013, -1.589849, -4.638948, 0, 0, 1, 1, 1,
-1.706725, 2.651315, 0.6203448, 1, 0, 0, 1, 1,
-1.706401, 1.353295, -2.704096, 1, 0, 0, 1, 1,
-1.679079, 0.4187014, -2.197467, 1, 0, 0, 1, 1,
-1.672459, 0.8222271, -0.7178135, 1, 0, 0, 1, 1,
-1.651777, -1.092576, -3.219377, 1, 0, 0, 1, 1,
-1.640258, -1.487582, -1.426917, 0, 0, 0, 1, 1,
-1.629042, -1.135652, -2.910736, 0, 0, 0, 1, 1,
-1.627139, -0.9454518, -1.746058, 0, 0, 0, 1, 1,
-1.618439, -0.08798525, -1.190689, 0, 0, 0, 1, 1,
-1.613063, 0.7277374, -0.664769, 0, 0, 0, 1, 1,
-1.604131, 0.400551, -1.283121, 0, 0, 0, 1, 1,
-1.579062, -1.096503, -2.639135, 0, 0, 0, 1, 1,
-1.560376, -0.1895365, -1.296857, 1, 1, 1, 1, 1,
-1.549808, -0.3501568, -1.019321, 1, 1, 1, 1, 1,
-1.537616, -1.512604, -0.6219858, 1, 1, 1, 1, 1,
-1.529811, 0.2480997, 0.2238241, 1, 1, 1, 1, 1,
-1.521473, -0.9312975, -2.049417, 1, 1, 1, 1, 1,
-1.518593, 0.1143919, -1.216451, 1, 1, 1, 1, 1,
-1.489621, -0.9755117, -2.69033, 1, 1, 1, 1, 1,
-1.469154, 0.4794152, -0.132518, 1, 1, 1, 1, 1,
-1.468257, 0.03041697, -1.419253, 1, 1, 1, 1, 1,
-1.458425, -0.3533797, -1.546096, 1, 1, 1, 1, 1,
-1.458333, -0.2317758, -2.898024, 1, 1, 1, 1, 1,
-1.455304, 1.303464, -1.296721, 1, 1, 1, 1, 1,
-1.448682, 0.6601512, -1.318494, 1, 1, 1, 1, 1,
-1.437085, 0.5428206, -0.9314451, 1, 1, 1, 1, 1,
-1.436614, 0.3608003, 0.6162489, 1, 1, 1, 1, 1,
-1.428769, 0.3902398, -2.037638, 0, 0, 1, 1, 1,
-1.423247, 0.370331, 0.2683781, 1, 0, 0, 1, 1,
-1.411146, -0.4131153, -1.601589, 1, 0, 0, 1, 1,
-1.40304, -1.173248, -2.722926, 1, 0, 0, 1, 1,
-1.395361, -0.8505064, -2.482703, 1, 0, 0, 1, 1,
-1.389614, 0.07668344, -2.13045, 1, 0, 0, 1, 1,
-1.388606, 0.9116457, -0.3091171, 0, 0, 0, 1, 1,
-1.388217, -2.423563, -3.309144, 0, 0, 0, 1, 1,
-1.388173, 1.908761, -0.4788781, 0, 0, 0, 1, 1,
-1.376444, -0.7891642, -0.807368, 0, 0, 0, 1, 1,
-1.374671, -0.9702268, -2.011692, 0, 0, 0, 1, 1,
-1.372825, -0.7155941, -3.025384, 0, 0, 0, 1, 1,
-1.37206, 2.207169, -1.296743, 0, 0, 0, 1, 1,
-1.364362, 0.9889161, -1.982491, 1, 1, 1, 1, 1,
-1.356976, 1.395763, -2.178389, 1, 1, 1, 1, 1,
-1.339159, 1.114562, 0.5454988, 1, 1, 1, 1, 1,
-1.323991, -0.1069754, -1.65291, 1, 1, 1, 1, 1,
-1.308638, -0.9750811, -3.793634, 1, 1, 1, 1, 1,
-1.306585, 0.0209986, -1.209376, 1, 1, 1, 1, 1,
-1.304325, -0.8217984, -3.6149, 1, 1, 1, 1, 1,
-1.303714, 0.9687343, -1.66652, 1, 1, 1, 1, 1,
-1.299607, -0.4527512, -1.829585, 1, 1, 1, 1, 1,
-1.291305, -0.5571651, -1.943524, 1, 1, 1, 1, 1,
-1.28146, 0.4236178, -1.782343, 1, 1, 1, 1, 1,
-1.275201, -0.6121895, -2.328619, 1, 1, 1, 1, 1,
-1.27193, 1.43165, 0.175993, 1, 1, 1, 1, 1,
-1.266566, -1.55936, -2.935443, 1, 1, 1, 1, 1,
-1.266055, -1.100705, -2.27438, 1, 1, 1, 1, 1,
-1.258549, -0.7088344, -2.788479, 0, 0, 1, 1, 1,
-1.257577, -0.7102581, -2.923274, 1, 0, 0, 1, 1,
-1.244779, 1.588751, 0.3217987, 1, 0, 0, 1, 1,
-1.241137, 2.521983, 0.1080778, 1, 0, 0, 1, 1,
-1.238082, 0.889348, 0.8454747, 1, 0, 0, 1, 1,
-1.229424, -0.1645722, -2.590327, 1, 0, 0, 1, 1,
-1.224556, -0.0344658, -2.914415, 0, 0, 0, 1, 1,
-1.222704, 0.225602, -0.5372712, 0, 0, 0, 1, 1,
-1.213943, -1.239578, -3.263101, 0, 0, 0, 1, 1,
-1.211359, 1.095842, 0.03683374, 0, 0, 0, 1, 1,
-1.208986, 1.56249, 1.551786, 0, 0, 0, 1, 1,
-1.198973, 0.9473205, -0.3738731, 0, 0, 0, 1, 1,
-1.19321, 0.007297309, -0.02381688, 0, 0, 0, 1, 1,
-1.191314, 0.1774346, -1.095649, 1, 1, 1, 1, 1,
-1.189406, -1.406173, -0.2378404, 1, 1, 1, 1, 1,
-1.178766, -1.584004, -4.302839, 1, 1, 1, 1, 1,
-1.176806, -0.3446195, -1.451119, 1, 1, 1, 1, 1,
-1.171907, 0.2276616, -1.466168, 1, 1, 1, 1, 1,
-1.155114, 1.688713, -2.369628, 1, 1, 1, 1, 1,
-1.150381, -0.2356951, -0.5260113, 1, 1, 1, 1, 1,
-1.129477, 0.657162, -1.294831, 1, 1, 1, 1, 1,
-1.122451, -0.1531685, -2.757669, 1, 1, 1, 1, 1,
-1.12207, 0.15476, -2.635412, 1, 1, 1, 1, 1,
-1.114422, 0.8647494, -0.9667511, 1, 1, 1, 1, 1,
-1.110597, -0.08255231, -1.621161, 1, 1, 1, 1, 1,
-1.109022, 0.02523743, -2.265786, 1, 1, 1, 1, 1,
-1.106671, -0.5108073, -2.429375, 1, 1, 1, 1, 1,
-1.101036, -0.7371898, -2.230622, 1, 1, 1, 1, 1,
-1.085395, -1.087163, -2.37094, 0, 0, 1, 1, 1,
-1.083993, 1.32448, 0.5511995, 1, 0, 0, 1, 1,
-1.08285, 0.9339254, -2.034713, 1, 0, 0, 1, 1,
-1.068114, -1.618052, -2.277992, 1, 0, 0, 1, 1,
-1.065874, -0.2675906, -1.251834, 1, 0, 0, 1, 1,
-1.056734, -0.9679737, -3.113516, 1, 0, 0, 1, 1,
-1.052873, -1.091741, -2.436877, 0, 0, 0, 1, 1,
-1.052746, -2.470743, -3.517495, 0, 0, 0, 1, 1,
-1.050882, 1.173877, -0.2332072, 0, 0, 0, 1, 1,
-1.047484, -0.1125796, -0.6042449, 0, 0, 0, 1, 1,
-1.043496, 0.2519195, -1.031714, 0, 0, 0, 1, 1,
-1.041021, -0.6361563, -2.593029, 0, 0, 0, 1, 1,
-1.035427, 0.3416576, -1.629031, 0, 0, 0, 1, 1,
-1.031908, 1.659334, -1.603286, 1, 1, 1, 1, 1,
-1.016915, -0.779949, -1.671801, 1, 1, 1, 1, 1,
-1.01506, 0.9400453, -0.6382745, 1, 1, 1, 1, 1,
-1.013941, -1.381814, -1.583871, 1, 1, 1, 1, 1,
-1.010082, -0.3061248, -3.076297, 1, 1, 1, 1, 1,
-1.004705, -0.3328627, -2.049681, 1, 1, 1, 1, 1,
-1.004054, -0.4091001, -2.748406, 1, 1, 1, 1, 1,
-1.003766, 0.6154965, 0.02048846, 1, 1, 1, 1, 1,
-1.002177, 1.490571, -0.7639027, 1, 1, 1, 1, 1,
-0.9946385, 0.2015407, -0.8072733, 1, 1, 1, 1, 1,
-0.9936832, 0.8959088, -0.9438221, 1, 1, 1, 1, 1,
-0.992429, 0.3157144, -1.635366, 1, 1, 1, 1, 1,
-0.9880005, 0.5430279, -1.236844, 1, 1, 1, 1, 1,
-0.9868246, -1.000203, -2.271561, 1, 1, 1, 1, 1,
-0.9854984, -0.006644312, -1.884411, 1, 1, 1, 1, 1,
-0.9845009, 1.211543, 0.5092301, 0, 0, 1, 1, 1,
-0.9842916, 0.9064932, -1.22346, 1, 0, 0, 1, 1,
-0.9839204, -0.1129794, -1.114082, 1, 0, 0, 1, 1,
-0.9790798, 0.9507499, 0.1628616, 1, 0, 0, 1, 1,
-0.9710582, -0.7311013, -2.369045, 1, 0, 0, 1, 1,
-0.970571, 0.1249639, -3.051599, 1, 0, 0, 1, 1,
-0.9692608, 2.450438, 1.618574, 0, 0, 0, 1, 1,
-0.9680276, 0.2849385, -2.585515, 0, 0, 0, 1, 1,
-0.9630302, 0.03718897, -1.75168, 0, 0, 0, 1, 1,
-0.950962, 1.49217, 0.2702837, 0, 0, 0, 1, 1,
-0.9390575, 0.7255549, -2.32632, 0, 0, 0, 1, 1,
-0.9352353, -0.1192615, 0.09247932, 0, 0, 0, 1, 1,
-0.9281794, -0.2122628, -1.102861, 0, 0, 0, 1, 1,
-0.9267419, 0.2241741, -2.310168, 1, 1, 1, 1, 1,
-0.9259995, 0.3108273, -1.576972, 1, 1, 1, 1, 1,
-0.9243885, -0.8053325, -2.657355, 1, 1, 1, 1, 1,
-0.9215416, -1.855465, -1.815278, 1, 1, 1, 1, 1,
-0.9174969, -0.8634703, -3.518672, 1, 1, 1, 1, 1,
-0.9130854, 0.02151913, -2.739129, 1, 1, 1, 1, 1,
-0.911709, 1.400609, -1.810151, 1, 1, 1, 1, 1,
-0.9105219, -1.859367, -1.622863, 1, 1, 1, 1, 1,
-0.9093083, 0.1841725, -0.6437098, 1, 1, 1, 1, 1,
-0.9038036, 0.3635623, -0.3693462, 1, 1, 1, 1, 1,
-0.8992763, 0.3797324, -0.6510818, 1, 1, 1, 1, 1,
-0.8961555, 0.4260108, -1.742965, 1, 1, 1, 1, 1,
-0.8912116, -0.6871095, -1.941238, 1, 1, 1, 1, 1,
-0.88919, -0.9433972, -3.309369, 1, 1, 1, 1, 1,
-0.8789723, 0.8664514, -0.9255373, 1, 1, 1, 1, 1,
-0.8777148, 3.246171, 0.9621137, 0, 0, 1, 1, 1,
-0.8538642, -1.654, -1.246858, 1, 0, 0, 1, 1,
-0.8490984, -2.1144, -3.74994, 1, 0, 0, 1, 1,
-0.8487813, 0.7535065, 0.5126067, 1, 0, 0, 1, 1,
-0.8478863, -1.423354, -2.48855, 1, 0, 0, 1, 1,
-0.8435516, 0.8692284, -1.237392, 1, 0, 0, 1, 1,
-0.8425385, -1.159835, -3.734854, 0, 0, 0, 1, 1,
-0.8424346, -0.2466468, -3.751475, 0, 0, 0, 1, 1,
-0.8307651, -0.7818573, -3.405976, 0, 0, 0, 1, 1,
-0.818127, -1.305158, -2.769192, 0, 0, 0, 1, 1,
-0.8142052, 0.3845517, -0.3331434, 0, 0, 0, 1, 1,
-0.8139641, -0.6680093, -2.190032, 0, 0, 0, 1, 1,
-0.8035682, 1.324422, 0.3222291, 0, 0, 0, 1, 1,
-0.8035115, 2.255979, 0.2088055, 1, 1, 1, 1, 1,
-0.7957751, -2.095093, -2.872547, 1, 1, 1, 1, 1,
-0.7886155, 0.229878, -2.287457, 1, 1, 1, 1, 1,
-0.7873476, -0.1819215, -1.927419, 1, 1, 1, 1, 1,
-0.7847414, -0.2271967, -1.973182, 1, 1, 1, 1, 1,
-0.7633688, 1.700221, -1.267861, 1, 1, 1, 1, 1,
-0.7631376, 0.5078385, -0.7050429, 1, 1, 1, 1, 1,
-0.7629661, -0.281911, -1.885631, 1, 1, 1, 1, 1,
-0.7611031, -1.386205, -2.784599, 1, 1, 1, 1, 1,
-0.7417741, -0.3648755, -5.537845, 1, 1, 1, 1, 1,
-0.740997, -0.1844458, -2.90592, 1, 1, 1, 1, 1,
-0.739806, -1.624888, -2.056731, 1, 1, 1, 1, 1,
-0.7382832, 0.8311074, -0.6907951, 1, 1, 1, 1, 1,
-0.733981, -0.9194493, -1.030836, 1, 1, 1, 1, 1,
-0.7280248, -0.6170241, -3.36261, 1, 1, 1, 1, 1,
-0.7251382, 0.1588166, -0.6975113, 0, 0, 1, 1, 1,
-0.7237561, -0.3485578, -1.837012, 1, 0, 0, 1, 1,
-0.7104229, -0.7558759, -2.497368, 1, 0, 0, 1, 1,
-0.7098063, -0.7007183, -1.509804, 1, 0, 0, 1, 1,
-0.7040674, 0.392419, -1.968197, 1, 0, 0, 1, 1,
-0.7014133, -0.15126, -1.229204, 1, 0, 0, 1, 1,
-0.7004859, 1.019418, 0.07121377, 0, 0, 0, 1, 1,
-0.7002481, -0.4762517, -0.972213, 0, 0, 0, 1, 1,
-0.6990124, -1.135882, -2.21343, 0, 0, 0, 1, 1,
-0.6986927, 0.6303856, -0.2327961, 0, 0, 0, 1, 1,
-0.6936828, 0.4225899, -1.047454, 0, 0, 0, 1, 1,
-0.6910914, 1.113067, -0.3184876, 0, 0, 0, 1, 1,
-0.6842924, -0.2425001, -3.677368, 0, 0, 0, 1, 1,
-0.6811388, 1.20618, -0.3728989, 1, 1, 1, 1, 1,
-0.6801583, -2.765751, -1.857725, 1, 1, 1, 1, 1,
-0.6796913, -0.07542608, -1.542022, 1, 1, 1, 1, 1,
-0.6746427, 0.1085842, -3.318082, 1, 1, 1, 1, 1,
-0.6714459, -1.950445, -2.797565, 1, 1, 1, 1, 1,
-0.6712719, -2.310991, -2.420511, 1, 1, 1, 1, 1,
-0.6681153, 0.2100131, -2.514205, 1, 1, 1, 1, 1,
-0.6606155, 0.5870719, -1.281473, 1, 1, 1, 1, 1,
-0.6593868, -0.1497209, -2.196657, 1, 1, 1, 1, 1,
-0.6559674, 1.024481, -1.769096, 1, 1, 1, 1, 1,
-0.6537747, -1.024338, -3.639421, 1, 1, 1, 1, 1,
-0.6506058, -0.3258491, -2.459908, 1, 1, 1, 1, 1,
-0.6475874, 0.2859426, -1.616768, 1, 1, 1, 1, 1,
-0.6433165, -0.3982719, -3.364826, 1, 1, 1, 1, 1,
-0.6420745, -2.247031, -2.811448, 1, 1, 1, 1, 1,
-0.639108, -0.3976141, -2.542108, 0, 0, 1, 1, 1,
-0.6303632, 0.3373069, -0.2721955, 1, 0, 0, 1, 1,
-0.6301985, -1.2047, -0.6791323, 1, 0, 0, 1, 1,
-0.6275417, 1.451362, 0.9923451, 1, 0, 0, 1, 1,
-0.6274409, -1.00303, -3.568247, 1, 0, 0, 1, 1,
-0.6235251, -1.523222, -2.804407, 1, 0, 0, 1, 1,
-0.6219227, -2.187638, -4.502837, 0, 0, 0, 1, 1,
-0.6193112, 0.2270101, -1.002406, 0, 0, 0, 1, 1,
-0.6159008, 0.971828, 0.1622968, 0, 0, 0, 1, 1,
-0.6133522, -0.3635885, -2.295697, 0, 0, 0, 1, 1,
-0.6118549, -0.8757644, -2.07455, 0, 0, 0, 1, 1,
-0.6100861, -0.003409205, -1.342443, 0, 0, 0, 1, 1,
-0.6051741, -0.7744147, -2.355719, 0, 0, 0, 1, 1,
-0.600197, 1.387496, -0.5192151, 1, 1, 1, 1, 1,
-0.5999307, -0.7605239, -1.83727, 1, 1, 1, 1, 1,
-0.5979576, -0.769311, -1.998666, 1, 1, 1, 1, 1,
-0.5928405, 0.8051919, -1.256043, 1, 1, 1, 1, 1,
-0.5927446, 0.7019926, 0.9286183, 1, 1, 1, 1, 1,
-0.5848151, 1.674853, -1.654875, 1, 1, 1, 1, 1,
-0.5835648, -0.08484124, -1.285392, 1, 1, 1, 1, 1,
-0.5819899, -0.2543997, 0.2429922, 1, 1, 1, 1, 1,
-0.5804768, 0.2911834, -0.1903683, 1, 1, 1, 1, 1,
-0.5776947, -0.8748852, -3.524668, 1, 1, 1, 1, 1,
-0.5640222, -0.1256839, -0.3327032, 1, 1, 1, 1, 1,
-0.5631929, 2.28792, -0.2438247, 1, 1, 1, 1, 1,
-0.5622755, 0.6002082, 0.2422855, 1, 1, 1, 1, 1,
-0.561829, 1.117358, -1.95471, 1, 1, 1, 1, 1,
-0.5593837, -1.38326, -3.229864, 1, 1, 1, 1, 1,
-0.5572239, -0.5376313, -2.176597, 0, 0, 1, 1, 1,
-0.5558464, -0.8368524, -4.255815, 1, 0, 0, 1, 1,
-0.5550519, -0.983856, -2.860771, 1, 0, 0, 1, 1,
-0.5526763, 0.3626351, -1.259652, 1, 0, 0, 1, 1,
-0.5439061, 0.368218, -1.745184, 1, 0, 0, 1, 1,
-0.5418142, -1.032859, -3.247285, 1, 0, 0, 1, 1,
-0.5391494, -1.633119, -2.488213, 0, 0, 0, 1, 1,
-0.53777, -2.132697, -2.6833, 0, 0, 0, 1, 1,
-0.5369719, 1.176833, -0.1383121, 0, 0, 0, 1, 1,
-0.5360093, -0.02215795, 0.3695931, 0, 0, 0, 1, 1,
-0.531634, -0.7202122, -2.531184, 0, 0, 0, 1, 1,
-0.531316, 0.1940223, 0.8540792, 0, 0, 0, 1, 1,
-0.5294196, -0.04118631, -2.682567, 0, 0, 0, 1, 1,
-0.5284604, 0.8970059, -0.4397236, 1, 1, 1, 1, 1,
-0.5253018, -1.235866, -4.280812, 1, 1, 1, 1, 1,
-0.5243244, 0.2971116, -1.141098, 1, 1, 1, 1, 1,
-0.5210544, 0.01592954, -1.3054, 1, 1, 1, 1, 1,
-0.5168419, 0.5050533, -1.412962, 1, 1, 1, 1, 1,
-0.5164368, 0.8771278, -0.3240825, 1, 1, 1, 1, 1,
-0.5152466, -0.7795607, -2.536442, 1, 1, 1, 1, 1,
-0.5042674, 0.3352601, 0.8403677, 1, 1, 1, 1, 1,
-0.5016416, 0.09172685, -2.386404, 1, 1, 1, 1, 1,
-0.4985293, 0.7171834, -1.536518, 1, 1, 1, 1, 1,
-0.4950588, -0.7818179, -2.720921, 1, 1, 1, 1, 1,
-0.494725, 0.7700244, 0.6646291, 1, 1, 1, 1, 1,
-0.4933106, 0.6678885, 1.621732, 1, 1, 1, 1, 1,
-0.4913415, 1.208372, -1.834824, 1, 1, 1, 1, 1,
-0.4844154, -1.430129, -3.937158, 1, 1, 1, 1, 1,
-0.4822124, 0.4602682, -0.4935291, 0, 0, 1, 1, 1,
-0.4815852, 0.2639076, -2.262322, 1, 0, 0, 1, 1,
-0.4805384, 1.939903, 0.3423257, 1, 0, 0, 1, 1,
-0.4774994, -0.5416825, -2.40254, 1, 0, 0, 1, 1,
-0.4764825, -3.32332, -4.603664, 1, 0, 0, 1, 1,
-0.4763272, 1.617153, 0.7206953, 1, 0, 0, 1, 1,
-0.4752887, -2.098764, -0.8145356, 0, 0, 0, 1, 1,
-0.4708228, -0.7235935, -3.735524, 0, 0, 0, 1, 1,
-0.4688623, 1.010466, -0.349535, 0, 0, 0, 1, 1,
-0.4606031, 0.660268, 0.7033517, 0, 0, 0, 1, 1,
-0.458788, 0.6806812, -1.900795, 0, 0, 0, 1, 1,
-0.4545522, -0.4252264, -3.21997, 0, 0, 0, 1, 1,
-0.4477258, 0.4388684, -0.6331774, 0, 0, 0, 1, 1,
-0.4447507, 0.1199132, -1.235131, 1, 1, 1, 1, 1,
-0.4443112, -2.121343, -2.643423, 1, 1, 1, 1, 1,
-0.4426827, 0.116325, -2.194217, 1, 1, 1, 1, 1,
-0.4422067, 1.147371, -1.311006, 1, 1, 1, 1, 1,
-0.4394858, 0.944161, -0.8106349, 1, 1, 1, 1, 1,
-0.4357575, 0.6965458, -0.7604575, 1, 1, 1, 1, 1,
-0.43285, 0.6898233, -1.152626, 1, 1, 1, 1, 1,
-0.4291759, -1.645403, -3.117589, 1, 1, 1, 1, 1,
-0.4279808, 1.785242, -1.185563, 1, 1, 1, 1, 1,
-0.4243886, -0.1785196, -2.586516, 1, 1, 1, 1, 1,
-0.4225752, 0.4370428, -0.8495688, 1, 1, 1, 1, 1,
-0.4185965, 0.5132298, -0.7951897, 1, 1, 1, 1, 1,
-0.4171398, -1.710885, -2.632784, 1, 1, 1, 1, 1,
-0.4167307, -0.5434557, -3.137909, 1, 1, 1, 1, 1,
-0.4158224, -0.6448826, -2.810896, 1, 1, 1, 1, 1,
-0.4118211, 0.5677368, -0.7667304, 0, 0, 1, 1, 1,
-0.4113328, -0.9231772, -2.864093, 1, 0, 0, 1, 1,
-0.4052146, 0.5191888, 0.1300278, 1, 0, 0, 1, 1,
-0.3995721, -0.8309718, -2.372518, 1, 0, 0, 1, 1,
-0.3995562, -0.4990401, -3.105574, 1, 0, 0, 1, 1,
-0.3993525, 0.09955593, -1.734808, 1, 0, 0, 1, 1,
-0.3991502, 0.8758964, -0.6569852, 0, 0, 0, 1, 1,
-0.391999, 0.05733143, -0.701954, 0, 0, 0, 1, 1,
-0.3819389, -0.8177635, -3.122812, 0, 0, 0, 1, 1,
-0.3816908, -0.3904897, -1.980705, 0, 0, 0, 1, 1,
-0.3810672, -0.2875959, -2.892191, 0, 0, 0, 1, 1,
-0.3763098, -0.4229167, -3.119031, 0, 0, 0, 1, 1,
-0.3739374, -0.3523542, -1.899879, 0, 0, 0, 1, 1,
-0.3739127, -2.697641, -3.359668, 1, 1, 1, 1, 1,
-0.3729315, -1.094774, -3.596382, 1, 1, 1, 1, 1,
-0.3729164, -0.008629472, -0.3492942, 1, 1, 1, 1, 1,
-0.3677111, 1.041557, -0.6055281, 1, 1, 1, 1, 1,
-0.3655515, 0.5655083, 1.603392, 1, 1, 1, 1, 1,
-0.3652458, -0.2539564, -3.6343, 1, 1, 1, 1, 1,
-0.3596747, 0.2588371, -0.4074653, 1, 1, 1, 1, 1,
-0.3573853, 0.8905026, -0.1039354, 1, 1, 1, 1, 1,
-0.3571209, 0.7555109, -0.8720338, 1, 1, 1, 1, 1,
-0.3513875, -0.02479579, -2.830939, 1, 1, 1, 1, 1,
-0.3506547, 1.285865, -0.818643, 1, 1, 1, 1, 1,
-0.3464617, 0.2259372, -1.192756, 1, 1, 1, 1, 1,
-0.3455437, -2.165088, -2.317533, 1, 1, 1, 1, 1,
-0.3448526, -0.7749116, -2.26702, 1, 1, 1, 1, 1,
-0.343589, -0.3834332, -0.5288256, 1, 1, 1, 1, 1,
-0.3418799, -0.4416028, -1.747717, 0, 0, 1, 1, 1,
-0.3402184, -0.4884479, -3.197305, 1, 0, 0, 1, 1,
-0.3373481, 1.269835, 0.1419311, 1, 0, 0, 1, 1,
-0.33651, -1.486585, -1.868146, 1, 0, 0, 1, 1,
-0.3355731, -0.8636374, -3.783493, 1, 0, 0, 1, 1,
-0.335564, 0.03633267, -1.295979, 1, 0, 0, 1, 1,
-0.334726, -0.4998593, -1.753388, 0, 0, 0, 1, 1,
-0.3342473, -0.02800107, -1.99743, 0, 0, 0, 1, 1,
-0.3267764, 1.58304, -0.3686928, 0, 0, 0, 1, 1,
-0.325712, 1.788141, -0.6902634, 0, 0, 0, 1, 1,
-0.3255491, 1.7411, 0.3333445, 0, 0, 0, 1, 1,
-0.3211273, -0.5306861, -2.865968, 0, 0, 0, 1, 1,
-0.3210444, 1.051465, -0.3530417, 0, 0, 0, 1, 1,
-0.3194361, 2.104077, 0.5766384, 1, 1, 1, 1, 1,
-0.3164631, 0.3059898, -2.487737, 1, 1, 1, 1, 1,
-0.3146279, 0.8397063, -1.030696, 1, 1, 1, 1, 1,
-0.3108997, 1.252756, -0.1466171, 1, 1, 1, 1, 1,
-0.3105207, 0.4751223, -1.072369, 1, 1, 1, 1, 1,
-0.3078496, 0.3196809, 0.7401091, 1, 1, 1, 1, 1,
-0.3074746, -2.238314, -2.886076, 1, 1, 1, 1, 1,
-0.304686, -0.3364071, -3.199556, 1, 1, 1, 1, 1,
-0.3020618, -0.5980044, -1.77895, 1, 1, 1, 1, 1,
-0.3008852, 0.5705248, -3.07313, 1, 1, 1, 1, 1,
-0.3003131, -0.3133449, -2.5264, 1, 1, 1, 1, 1,
-0.2914923, 0.6285709, 1.570329, 1, 1, 1, 1, 1,
-0.2849847, 1.057477, -0.3958718, 1, 1, 1, 1, 1,
-0.2845919, -1.963441, -3.264682, 1, 1, 1, 1, 1,
-0.2780223, -0.7856048, -4.164535, 1, 1, 1, 1, 1,
-0.2778933, -1.232988, -0.8800672, 0, 0, 1, 1, 1,
-0.2750838, 1.901905, -1.955161, 1, 0, 0, 1, 1,
-0.2735886, -1.407775, -2.437726, 1, 0, 0, 1, 1,
-0.2733679, 1.644177, -0.145428, 1, 0, 0, 1, 1,
-0.2729321, 1.537761, 0.8796424, 1, 0, 0, 1, 1,
-0.2673641, 0.4401394, -0.8831787, 1, 0, 0, 1, 1,
-0.265681, 0.2320207, 0.5453283, 0, 0, 0, 1, 1,
-0.2586626, 0.2970766, -2.180639, 0, 0, 0, 1, 1,
-0.252055, 0.4005897, 0.1060494, 0, 0, 0, 1, 1,
-0.2510913, 1.288026, -0.3821663, 0, 0, 0, 1, 1,
-0.2509664, 0.1123504, -1.790486, 0, 0, 0, 1, 1,
-0.2463351, -0.1078385, -2.989972, 0, 0, 0, 1, 1,
-0.2450393, -0.4443109, -2.023817, 0, 0, 0, 1, 1,
-0.2419047, 0.7000223, 1.239679, 1, 1, 1, 1, 1,
-0.2411154, -2.196667, -2.081458, 1, 1, 1, 1, 1,
-0.2373851, -0.8593823, -2.752635, 1, 1, 1, 1, 1,
-0.237193, 0.6917634, 1.60882, 1, 1, 1, 1, 1,
-0.2325723, -2.144398, -4.524886, 1, 1, 1, 1, 1,
-0.2289545, 0.4076409, -2.773954, 1, 1, 1, 1, 1,
-0.2219563, 0.08831957, -0.9085866, 1, 1, 1, 1, 1,
-0.2207959, 1.25536, 0.9272824, 1, 1, 1, 1, 1,
-0.2201162, -0.9856219, -2.312679, 1, 1, 1, 1, 1,
-0.2195638, 2.050079, -0.04392843, 1, 1, 1, 1, 1,
-0.2188603, -0.5800653, -4.223577, 1, 1, 1, 1, 1,
-0.2168832, 1.36017, -0.2403823, 1, 1, 1, 1, 1,
-0.2128647, -0.9921762, -2.036016, 1, 1, 1, 1, 1,
-0.2056845, 2.18362, -0.5447605, 1, 1, 1, 1, 1,
-0.2039645, 0.9106094, -0.2908917, 1, 1, 1, 1, 1,
-0.1997141, -0.9619502, -2.939662, 0, 0, 1, 1, 1,
-0.1996298, -0.5515653, -1.445743, 1, 0, 0, 1, 1,
-0.1975518, -1.342083, -3.350294, 1, 0, 0, 1, 1,
-0.1944907, -0.7821713, -2.227417, 1, 0, 0, 1, 1,
-0.1904495, 1.70209, -0.1006953, 1, 0, 0, 1, 1,
-0.18506, -1.159279, -3.893841, 1, 0, 0, 1, 1,
-0.1835403, -0.9659164, -3.215236, 0, 0, 0, 1, 1,
-0.1801169, -0.2187286, -1.952146, 0, 0, 0, 1, 1,
-0.1740623, 0.4218837, -0.2559868, 0, 0, 0, 1, 1,
-0.1710881, -0.04462612, -1.721599, 0, 0, 0, 1, 1,
-0.1707883, 0.4317127, -0.07624801, 0, 0, 0, 1, 1,
-0.1668222, 0.9455543, -1.924639, 0, 0, 0, 1, 1,
-0.162134, -1.23038, -3.855738, 0, 0, 0, 1, 1,
-0.160142, 1.911372, 1.144013, 1, 1, 1, 1, 1,
-0.1559635, -0.7134572, -2.347897, 1, 1, 1, 1, 1,
-0.1551968, -0.9282224, -4.567389, 1, 1, 1, 1, 1,
-0.1491952, -0.6703842, -3.226202, 1, 1, 1, 1, 1,
-0.1476691, 0.1045262, -1.734555, 1, 1, 1, 1, 1,
-0.1466275, -0.9817491, -4.01071, 1, 1, 1, 1, 1,
-0.1462997, -0.9689753, -2.729542, 1, 1, 1, 1, 1,
-0.1432312, -1.181239, -2.633867, 1, 1, 1, 1, 1,
-0.1406838, -0.06740469, -3.006439, 1, 1, 1, 1, 1,
-0.1358472, 0.2104712, -0.0823985, 1, 1, 1, 1, 1,
-0.1358266, 0.130572, -0.8900434, 1, 1, 1, 1, 1,
-0.1339762, -0.1150741, -0.9314382, 1, 1, 1, 1, 1,
-0.1333851, -1.662053, -2.052136, 1, 1, 1, 1, 1,
-0.1322614, 0.5639206, 0.8334039, 1, 1, 1, 1, 1,
-0.1319107, 0.9000775, -0.889367, 1, 1, 1, 1, 1,
-0.1292639, -0.3538529, -2.21417, 0, 0, 1, 1, 1,
-0.1239835, 0.02005435, -2.551323, 1, 0, 0, 1, 1,
-0.1235884, 0.08733913, -1.902219, 1, 0, 0, 1, 1,
-0.1219222, 1.398405, -1.072751, 1, 0, 0, 1, 1,
-0.1192997, 0.3448518, -1.450531, 1, 0, 0, 1, 1,
-0.1172893, 1.293592, -1.171302, 1, 0, 0, 1, 1,
-0.1149232, 0.3200999, -2.649352, 0, 0, 0, 1, 1,
-0.1130813, -1.259963, -2.040141, 0, 0, 0, 1, 1,
-0.1090969, 2.346552, -1.242908, 0, 0, 0, 1, 1,
-0.1086469, -0.1453042, -1.699187, 0, 0, 0, 1, 1,
-0.107847, -1.449042, -3.838522, 0, 0, 0, 1, 1,
-0.106049, -2.485944, -2.482968, 0, 0, 0, 1, 1,
-0.103373, -0.7071993, -2.207582, 0, 0, 0, 1, 1,
-0.09949157, -0.2945353, -4.531117, 1, 1, 1, 1, 1,
-0.09699272, 0.5227694, 0.1675619, 1, 1, 1, 1, 1,
-0.09684561, 1.741691, -1.512662, 1, 1, 1, 1, 1,
-0.09646598, 0.1917394, -0.392699, 1, 1, 1, 1, 1,
-0.09568767, -1.75477, -3.27318, 1, 1, 1, 1, 1,
-0.09369569, 0.5112414, 0.2795784, 1, 1, 1, 1, 1,
-0.09321076, 0.3567832, 1.309765, 1, 1, 1, 1, 1,
-0.09126829, -0.4108283, -3.549136, 1, 1, 1, 1, 1,
-0.09014639, -1.447487, -1.997445, 1, 1, 1, 1, 1,
-0.0900246, -1.048276, -3.573903, 1, 1, 1, 1, 1,
-0.08942547, -0.5173838, -2.318964, 1, 1, 1, 1, 1,
-0.08883019, -0.9561561, -4.054277, 1, 1, 1, 1, 1,
-0.08717145, -1.662062, -2.350002, 1, 1, 1, 1, 1,
-0.08546626, 0.7278801, -0.2071858, 1, 1, 1, 1, 1,
-0.0842373, 0.02891235, -1.02259, 1, 1, 1, 1, 1,
-0.07751366, -0.1502193, -3.342436, 0, 0, 1, 1, 1,
-0.07460203, -1.877906, -2.700865, 1, 0, 0, 1, 1,
-0.07380442, 0.3883119, -1.942097, 1, 0, 0, 1, 1,
-0.07298952, 0.5850564, -0.2848285, 1, 0, 0, 1, 1,
-0.06814955, 1.439971, -0.008137397, 1, 0, 0, 1, 1,
-0.06342369, -0.1082919, -3.796974, 1, 0, 0, 1, 1,
-0.06288946, -0.3665105, -2.300361, 0, 0, 0, 1, 1,
-0.06197336, -0.1511149, -4.129271, 0, 0, 0, 1, 1,
-0.06046563, 1.320392, -1.107886, 0, 0, 0, 1, 1,
-0.05769721, -0.7818528, -2.510361, 0, 0, 0, 1, 1,
-0.05690571, 1.185159, 0.2251936, 0, 0, 0, 1, 1,
-0.05650583, -0.01884589, -3.750928, 0, 0, 0, 1, 1,
-0.05498568, 0.1066303, -0.5143042, 0, 0, 0, 1, 1,
-0.04329057, 0.6666902, 0.1223639, 1, 1, 1, 1, 1,
-0.04309338, 0.3501907, -0.5151442, 1, 1, 1, 1, 1,
-0.03673359, 0.1504648, 0.02507783, 1, 1, 1, 1, 1,
-0.03435441, -1.633205, -4.160288, 1, 1, 1, 1, 1,
-0.02822218, -0.1783518, -3.510143, 1, 1, 1, 1, 1,
-0.02550475, -0.0001005186, -1.603002, 1, 1, 1, 1, 1,
-0.02315772, 0.5481593, 0.4152112, 1, 1, 1, 1, 1,
-0.01860957, 1.310898, 0.2647642, 1, 1, 1, 1, 1,
-0.01798415, 0.07256977, -1.039785, 1, 1, 1, 1, 1,
-0.01727875, -0.4648986, -3.613514, 1, 1, 1, 1, 1,
-0.0097305, -0.1475442, -2.283339, 1, 1, 1, 1, 1,
-0.008818913, 0.5279562, 1.338994, 1, 1, 1, 1, 1,
-0.008571669, 1.251195, -0.3604757, 1, 1, 1, 1, 1,
-0.007905984, -0.656028, -2.623014, 1, 1, 1, 1, 1,
-0.006558216, -0.1010203, -2.185485, 1, 1, 1, 1, 1,
-0.002224341, -0.6137655, -4.515638, 0, 0, 1, 1, 1,
-0.001106959, -0.1374595, -4.318196, 1, 0, 0, 1, 1,
0.003900358, 0.8445652, 1.047792, 1, 0, 0, 1, 1,
0.003973211, 0.8079723, 0.2705488, 1, 0, 0, 1, 1,
0.004560094, 0.5201766, -1.058744, 1, 0, 0, 1, 1,
0.005164547, -0.9364375, 3.309817, 1, 0, 0, 1, 1,
0.006343364, -0.694626, 3.01569, 0, 0, 0, 1, 1,
0.007851115, 0.2032215, -0.8135418, 0, 0, 0, 1, 1,
0.01260057, 1.271441, -1.329209, 0, 0, 0, 1, 1,
0.01274141, 0.5734243, -0.2017455, 0, 0, 0, 1, 1,
0.01612978, -1.010985, 1.379047, 0, 0, 0, 1, 1,
0.01627446, 0.4137262, 0.04743568, 0, 0, 0, 1, 1,
0.01845677, 0.8496556, -0.1771232, 0, 0, 0, 1, 1,
0.02401018, -0.5587713, 4.333712, 1, 1, 1, 1, 1,
0.02472249, 0.1477807, -1.400401, 1, 1, 1, 1, 1,
0.02475927, -1.076622, 3.151358, 1, 1, 1, 1, 1,
0.0287453, 0.05225431, 0.1750434, 1, 1, 1, 1, 1,
0.03441297, 1.211378, -1.200455, 1, 1, 1, 1, 1,
0.03813313, 1.060154, 0.8736193, 1, 1, 1, 1, 1,
0.03943092, 1.016832, -0.5071324, 1, 1, 1, 1, 1,
0.03959101, -0.4633079, 1.647901, 1, 1, 1, 1, 1,
0.04023575, -0.3035893, 4.877673, 1, 1, 1, 1, 1,
0.0403431, -0.2562352, 4.774086, 1, 1, 1, 1, 1,
0.04202519, -0.8257986, 3.761175, 1, 1, 1, 1, 1,
0.04299663, 0.8106313, 0.0300728, 1, 1, 1, 1, 1,
0.04517031, 0.6569344, -1.033901, 1, 1, 1, 1, 1,
0.04548391, -0.9619732, 2.664147, 1, 1, 1, 1, 1,
0.04706671, -0.4301114, 2.856733, 1, 1, 1, 1, 1,
0.04988708, -1.453181, 3.159116, 0, 0, 1, 1, 1,
0.05370485, -0.8116686, 2.677956, 1, 0, 0, 1, 1,
0.05442927, 1.174326, -0.8067458, 1, 0, 0, 1, 1,
0.06633957, 0.5516807, 0.09568129, 1, 0, 0, 1, 1,
0.06836405, 0.3299522, -0.414254, 1, 0, 0, 1, 1,
0.06881806, 0.2396633, 1.273144, 1, 0, 0, 1, 1,
0.07112195, 1.002232, -0.2750748, 0, 0, 0, 1, 1,
0.0751704, 0.9824572, 0.1506854, 0, 0, 0, 1, 1,
0.07583147, 2.174886, 0.04066087, 0, 0, 0, 1, 1,
0.0785927, 0.4268782, 1.009731, 0, 0, 0, 1, 1,
0.08464499, 0.9565342, -0.2663656, 0, 0, 0, 1, 1,
0.08668491, 0.3250515, 0.9180074, 0, 0, 0, 1, 1,
0.0869109, 1.517163, -0.03750397, 0, 0, 0, 1, 1,
0.08840852, 1.19997, -0.2890205, 1, 1, 1, 1, 1,
0.09078304, 0.844389, 0.6169958, 1, 1, 1, 1, 1,
0.09089098, 0.1798322, -0.7866328, 1, 1, 1, 1, 1,
0.09130009, -0.02202101, 1.630543, 1, 1, 1, 1, 1,
0.09265588, -0.9349304, 3.901211, 1, 1, 1, 1, 1,
0.09294003, -1.151201, 2.411346, 1, 1, 1, 1, 1,
0.09568086, 0.6437811, -1.505443, 1, 1, 1, 1, 1,
0.1012219, 0.4996307, 1.04655, 1, 1, 1, 1, 1,
0.1047627, -0.02339712, 1.687448, 1, 1, 1, 1, 1,
0.1081085, 0.5746571, 0.6628948, 1, 1, 1, 1, 1,
0.1116215, 1.420194, 1.753514, 1, 1, 1, 1, 1,
0.114582, -0.5823951, 2.745908, 1, 1, 1, 1, 1,
0.11482, 0.9812794, 1.209167, 1, 1, 1, 1, 1,
0.1159611, 2.365802, 0.3338967, 1, 1, 1, 1, 1,
0.1188744, -0.3464267, 0.9949726, 1, 1, 1, 1, 1,
0.1271283, -1.379253, 2.98101, 0, 0, 1, 1, 1,
0.1271836, 0.113661, 0.8987879, 1, 0, 0, 1, 1,
0.1298137, -0.6522287, 2.228024, 1, 0, 0, 1, 1,
0.1306033, -0.4560233, 5.606302, 1, 0, 0, 1, 1,
0.1349642, 0.2580602, 0.5620319, 1, 0, 0, 1, 1,
0.1393127, -0.07651707, 2.769885, 1, 0, 0, 1, 1,
0.1413514, 0.2466478, 0.1850835, 0, 0, 0, 1, 1,
0.1419766, 0.6273856, 0.45291, 0, 0, 0, 1, 1,
0.1431674, 0.8258957, -0.3365323, 0, 0, 0, 1, 1,
0.1443776, 1.581806, -1.022649, 0, 0, 0, 1, 1,
0.1478649, 2.79901, 1.776223, 0, 0, 0, 1, 1,
0.1486598, 0.4031309, 0.6874558, 0, 0, 0, 1, 1,
0.150424, 1.495094, 0.6506103, 0, 0, 0, 1, 1,
0.1553991, 0.1334468, 0.1710489, 1, 1, 1, 1, 1,
0.1565869, 0.5749654, 0.2719599, 1, 1, 1, 1, 1,
0.1589189, -0.197689, 2.293914, 1, 1, 1, 1, 1,
0.1589497, -0.9131774, 2.966588, 1, 1, 1, 1, 1,
0.1638328, -0.6533118, 2.416097, 1, 1, 1, 1, 1,
0.1666634, -0.03158159, 2.591815, 1, 1, 1, 1, 1,
0.1672715, -0.4821708, 2.482466, 1, 1, 1, 1, 1,
0.1687207, 1.83949, -0.49829, 1, 1, 1, 1, 1,
0.1762239, -0.264283, 3.525774, 1, 1, 1, 1, 1,
0.1790184, 1.637447, 1.973035, 1, 1, 1, 1, 1,
0.1804426, 2.085721, -1.387648, 1, 1, 1, 1, 1,
0.1808163, -0.3172741, 2.724662, 1, 1, 1, 1, 1,
0.1822539, -0.3251638, 1.962946, 1, 1, 1, 1, 1,
0.1859776, -1.081109, 3.26565, 1, 1, 1, 1, 1,
0.187832, -0.8503572, 2.120128, 1, 1, 1, 1, 1,
0.1886667, -0.9810452, 2.236954, 0, 0, 1, 1, 1,
0.1889349, -0.06793304, 3.342968, 1, 0, 0, 1, 1,
0.1922548, 1.777188, -0.09532672, 1, 0, 0, 1, 1,
0.1937593, -0.9172527, 2.993176, 1, 0, 0, 1, 1,
0.1956442, -1.056088, 1.694612, 1, 0, 0, 1, 1,
0.1990381, 0.7570112, 1.254119, 1, 0, 0, 1, 1,
0.2012078, -0.8593649, 3.045739, 0, 0, 0, 1, 1,
0.2048825, -2.315331, 3.03126, 0, 0, 0, 1, 1,
0.2078224, -0.724322, 3.664475, 0, 0, 0, 1, 1,
0.2084424, 0.1139806, 0.900494, 0, 0, 0, 1, 1,
0.2110092, 0.846734, 0.3270105, 0, 0, 0, 1, 1,
0.2249559, -0.8655654, 3.497372, 0, 0, 0, 1, 1,
0.2285345, -0.2877291, 2.314189, 0, 0, 0, 1, 1,
0.2337983, 1.087246, -0.04398096, 1, 1, 1, 1, 1,
0.2371868, 0.4050506, 0.7337925, 1, 1, 1, 1, 1,
0.2373372, -0.6804972, 3.678901, 1, 1, 1, 1, 1,
0.243604, 0.2239604, -0.1692982, 1, 1, 1, 1, 1,
0.2456603, -0.3555508, 2.664049, 1, 1, 1, 1, 1,
0.2506518, 0.5904988, 0.2441601, 1, 1, 1, 1, 1,
0.2513802, -1.835205, 3.501405, 1, 1, 1, 1, 1,
0.2539998, 0.5661452, 2.266544, 1, 1, 1, 1, 1,
0.2559266, 2.047704, 0.7314681, 1, 1, 1, 1, 1,
0.2580261, -0.4363819, 3.109842, 1, 1, 1, 1, 1,
0.2588876, -0.06534669, 3.015848, 1, 1, 1, 1, 1,
0.2593742, -0.3451091, 3.749499, 1, 1, 1, 1, 1,
0.2594591, -0.6690069, 1.606374, 1, 1, 1, 1, 1,
0.2602303, 0.6443895, 0.8122891, 1, 1, 1, 1, 1,
0.2633035, 1.28383, 0.3834726, 1, 1, 1, 1, 1,
0.263747, -0.2686446, 2.459126, 0, 0, 1, 1, 1,
0.2643403, -0.2070077, 4.41573, 1, 0, 0, 1, 1,
0.2644009, -2.558068, 4.033689, 1, 0, 0, 1, 1,
0.2656423, -0.5205825, 3.575798, 1, 0, 0, 1, 1,
0.2670269, 0.1677237, 1.199073, 1, 0, 0, 1, 1,
0.2708474, -0.181792, 2.103374, 1, 0, 0, 1, 1,
0.28067, 0.3713028, 1.926754, 0, 0, 0, 1, 1,
0.2812347, -0.8114058, 4.033175, 0, 0, 0, 1, 1,
0.2855078, -0.9087306, 2.885007, 0, 0, 0, 1, 1,
0.2856493, 0.2365272, 1.995562, 0, 0, 0, 1, 1,
0.2898616, -1.013726, 3.504044, 0, 0, 0, 1, 1,
0.2909696, -1.13759, 3.713263, 0, 0, 0, 1, 1,
0.2932642, -0.4035261, 1.608694, 0, 0, 0, 1, 1,
0.294031, 0.6000687, -0.6462152, 1, 1, 1, 1, 1,
0.2963707, 0.9733073, 0.4009243, 1, 1, 1, 1, 1,
0.3032567, -1.531882, 1.182379, 1, 1, 1, 1, 1,
0.3037297, 0.09686109, 1.76062, 1, 1, 1, 1, 1,
0.3050644, 0.07593133, 2.391047, 1, 1, 1, 1, 1,
0.3057942, 0.5068347, 1.505092, 1, 1, 1, 1, 1,
0.3060384, -0.2844054, 2.381372, 1, 1, 1, 1, 1,
0.3066782, -1.319036, 1.025291, 1, 1, 1, 1, 1,
0.309489, -0.6610917, 2.335609, 1, 1, 1, 1, 1,
0.3101122, 1.670796, 1.575666, 1, 1, 1, 1, 1,
0.310506, -0.9064594, 2.229218, 1, 1, 1, 1, 1,
0.312668, 0.5684882, 0.4083786, 1, 1, 1, 1, 1,
0.3136402, -0.9784731, 3.620378, 1, 1, 1, 1, 1,
0.3194267, -0.1026679, 0.8604625, 1, 1, 1, 1, 1,
0.3268561, 1.971152, 2.080336, 1, 1, 1, 1, 1,
0.3269447, 1.407588, -0.6643168, 0, 0, 1, 1, 1,
0.328831, -1.10362, 4.549314, 1, 0, 0, 1, 1,
0.3303832, -2.640894, 5.058494, 1, 0, 0, 1, 1,
0.3371036, -0.1598608, 1.780415, 1, 0, 0, 1, 1,
0.3407168, 0.8740546, 1.698648, 1, 0, 0, 1, 1,
0.3432414, 0.5189617, 0.1695951, 1, 0, 0, 1, 1,
0.3441898, -0.7831404, 1.887232, 0, 0, 0, 1, 1,
0.3451085, 0.3574174, -0.4384661, 0, 0, 0, 1, 1,
0.3508388, -0.3487736, 2.76763, 0, 0, 0, 1, 1,
0.3548672, -0.1536865, 0.9854419, 0, 0, 0, 1, 1,
0.3552527, -0.9824777, 3.33317, 0, 0, 0, 1, 1,
0.3607054, -0.5686175, 1.563869, 0, 0, 0, 1, 1,
0.3647655, 2.025967, 0.9669861, 0, 0, 0, 1, 1,
0.3672904, 0.6381983, -0.7597492, 1, 1, 1, 1, 1,
0.3688872, -0.5397279, 2.822186, 1, 1, 1, 1, 1,
0.3713836, 0.8116225, 0.7299777, 1, 1, 1, 1, 1,
0.3756075, 0.3817881, 0.664536, 1, 1, 1, 1, 1,
0.377115, -0.7432252, 2.557928, 1, 1, 1, 1, 1,
0.3805495, 0.2864892, -0.6532098, 1, 1, 1, 1, 1,
0.3860477, -0.2457613, 2.743942, 1, 1, 1, 1, 1,
0.3872013, -0.527343, 2.896885, 1, 1, 1, 1, 1,
0.3875975, -0.2679785, 3.120913, 1, 1, 1, 1, 1,
0.3895113, 0.2355096, -0.09959546, 1, 1, 1, 1, 1,
0.3963829, -0.9692953, 3.160613, 1, 1, 1, 1, 1,
0.4026277, -0.8570713, 3.990962, 1, 1, 1, 1, 1,
0.4167806, 0.5053875, 0.2825553, 1, 1, 1, 1, 1,
0.4222733, -0.0857816, 1.198233, 1, 1, 1, 1, 1,
0.4239026, -0.1115851, 2.705736, 1, 1, 1, 1, 1,
0.429485, 0.7010276, 0.2544097, 0, 0, 1, 1, 1,
0.4391777, -0.3229147, 3.012516, 1, 0, 0, 1, 1,
0.4405196, -0.1828388, 1.711331, 1, 0, 0, 1, 1,
0.4424001, -0.6342604, 2.481081, 1, 0, 0, 1, 1,
0.4546125, -0.651385, 1.342828, 1, 0, 0, 1, 1,
0.455302, 0.5679352, 0.5200452, 1, 0, 0, 1, 1,
0.4606637, -0.1610617, 2.195867, 0, 0, 0, 1, 1,
0.4636228, 0.4446495, 0.3989314, 0, 0, 0, 1, 1,
0.4648443, 0.9911717, 1.196274, 0, 0, 0, 1, 1,
0.4655432, 0.8309755, 2.147885, 0, 0, 0, 1, 1,
0.4707686, -0.2883674, 2.054479, 0, 0, 0, 1, 1,
0.4747615, -0.7278056, 1.247189, 0, 0, 0, 1, 1,
0.4781267, -0.8094399, 2.62911, 0, 0, 0, 1, 1,
0.4798011, -0.2127916, 3.230334, 1, 1, 1, 1, 1,
0.4799864, 0.5217779, 0.110245, 1, 1, 1, 1, 1,
0.4800697, -1.311168, 2.333342, 1, 1, 1, 1, 1,
0.4815778, -1.959383, 3.051106, 1, 1, 1, 1, 1,
0.4821108, 0.5802026, -0.1710966, 1, 1, 1, 1, 1,
0.4822365, 1.104709, 1.17448, 1, 1, 1, 1, 1,
0.485723, 0.1493662, 2.224543, 1, 1, 1, 1, 1,
0.4858206, -0.8128275, 2.504505, 1, 1, 1, 1, 1,
0.486097, -0.6319258, 2.7863, 1, 1, 1, 1, 1,
0.4870595, -0.5777073, 2.189157, 1, 1, 1, 1, 1,
0.4878568, -0.7784017, 4.857347, 1, 1, 1, 1, 1,
0.4927973, -1.104155, 1.66559, 1, 1, 1, 1, 1,
0.4931559, -0.8006387, -0.6152172, 1, 1, 1, 1, 1,
0.4959871, 0.145961, 2.156877, 1, 1, 1, 1, 1,
0.4968246, -1.310397, 1.408693, 1, 1, 1, 1, 1,
0.4969511, -0.3027911, 0.1889365, 0, 0, 1, 1, 1,
0.5022124, 0.20632, -0.2422087, 1, 0, 0, 1, 1,
0.5026397, -0.4501417, 3.127787, 1, 0, 0, 1, 1,
0.502864, -0.09755024, 1.128595, 1, 0, 0, 1, 1,
0.5044981, 0.339949, 2.164209, 1, 0, 0, 1, 1,
0.5065739, 1.504416, 0.6795521, 1, 0, 0, 1, 1,
0.5069017, 0.230249, 0.9884594, 0, 0, 0, 1, 1,
0.5088924, -1.916951, 3.31618, 0, 0, 0, 1, 1,
0.5111195, 1.535271, -1.68652, 0, 0, 0, 1, 1,
0.5150985, 0.1486651, 0.3835947, 0, 0, 0, 1, 1,
0.5158486, -0.570521, 1.63901, 0, 0, 0, 1, 1,
0.5170549, -0.9031006, 2.7651, 0, 0, 0, 1, 1,
0.5179982, -0.08731285, -0.2390164, 0, 0, 0, 1, 1,
0.52646, 0.4363994, 1.11316, 1, 1, 1, 1, 1,
0.529035, 0.3369638, 0.7193789, 1, 1, 1, 1, 1,
0.5329266, 0.369114, 0.5576392, 1, 1, 1, 1, 1,
0.5398873, 0.5968985, 1.221982, 1, 1, 1, 1, 1,
0.5430138, 0.724113, -0.6311463, 1, 1, 1, 1, 1,
0.5430438, -1.256888, 1.895646, 1, 1, 1, 1, 1,
0.5455681, -0.8311795, 3.540999, 1, 1, 1, 1, 1,
0.5478095, 0.1781543, 0.5340639, 1, 1, 1, 1, 1,
0.5491439, 0.6894652, 1.407169, 1, 1, 1, 1, 1,
0.5502935, -0.4136179, 1.061688, 1, 1, 1, 1, 1,
0.550458, 0.1026585, -1.32344, 1, 1, 1, 1, 1,
0.5518935, -1.599225, 0.4082237, 1, 1, 1, 1, 1,
0.5522007, 1.756142, -0.1188885, 1, 1, 1, 1, 1,
0.5618381, -0.357526, 1.930394, 1, 1, 1, 1, 1,
0.5625715, 1.538521, 1.221523, 1, 1, 1, 1, 1,
0.5640094, 0.0162145, 1.562897, 0, 0, 1, 1, 1,
0.5650541, 0.5264795, 2.457598, 1, 0, 0, 1, 1,
0.5651029, 1.068388, -0.07854809, 1, 0, 0, 1, 1,
0.5653616, -0.3881748, 3.2207, 1, 0, 0, 1, 1,
0.5688762, -0.3218645, 2.582774, 1, 0, 0, 1, 1,
0.5707253, 0.2426022, -0.1889277, 1, 0, 0, 1, 1,
0.5721685, -0.7930936, 2.433898, 0, 0, 0, 1, 1,
0.5737296, -1.28687, 4.688993, 0, 0, 0, 1, 1,
0.5746195, -0.4128772, 4.181802, 0, 0, 0, 1, 1,
0.5802629, -1.201314, 1.677107, 0, 0, 0, 1, 1,
0.588509, 0.6529782, -0.02513438, 0, 0, 0, 1, 1,
0.5891232, 1.484533, 3.124382, 0, 0, 0, 1, 1,
0.5908197, -1.272195, 3.532235, 0, 0, 0, 1, 1,
0.5984954, -0.518261, -0.589446, 1, 1, 1, 1, 1,
0.5990124, 1.355746, -0.2592538, 1, 1, 1, 1, 1,
0.5991459, 1.287683, 1.282149, 1, 1, 1, 1, 1,
0.5999578, -1.379501, 1.763295, 1, 1, 1, 1, 1,
0.6009442, -0.5958823, 3.193968, 1, 1, 1, 1, 1,
0.6015927, -0.03732155, 1.794332, 1, 1, 1, 1, 1,
0.6021302, 1.641315, 0.3187897, 1, 1, 1, 1, 1,
0.6028939, -0.8307651, 2.038926, 1, 1, 1, 1, 1,
0.6031253, -0.3432272, 1.40423, 1, 1, 1, 1, 1,
0.6032075, 0.02689504, 2.046453, 1, 1, 1, 1, 1,
0.6056433, -0.9778631, 1.725283, 1, 1, 1, 1, 1,
0.6061869, 0.6216894, 1.183065, 1, 1, 1, 1, 1,
0.611405, 0.6051109, 1.594557, 1, 1, 1, 1, 1,
0.6123801, -1.532711, 1.299566, 1, 1, 1, 1, 1,
0.6152392, 1.147251, 0.9209988, 1, 1, 1, 1, 1,
0.6164333, -0.8254278, 3.994559, 0, 0, 1, 1, 1,
0.6192387, 0.1094501, 2.647347, 1, 0, 0, 1, 1,
0.6207184, -1.238868, 1.72379, 1, 0, 0, 1, 1,
0.6250777, 1.36249, 1.575639, 1, 0, 0, 1, 1,
0.6260865, 1.191378, 1.451849, 1, 0, 0, 1, 1,
0.6326799, 1.54516, -1.693534, 1, 0, 0, 1, 1,
0.6396115, 1.121424, 1.047967, 0, 0, 0, 1, 1,
0.6432123, 0.40616, -0.1616993, 0, 0, 0, 1, 1,
0.6444334, 0.1046444, 2.049181, 0, 0, 0, 1, 1,
0.6496112, -0.1399769, 2.668019, 0, 0, 0, 1, 1,
0.6517193, -0.1421224, 1.003763, 0, 0, 0, 1, 1,
0.6520965, -1.02488, 1.574109, 0, 0, 0, 1, 1,
0.6561825, 2.021182, 0.4767716, 0, 0, 0, 1, 1,
0.6585761, -0.3532732, 2.849229, 1, 1, 1, 1, 1,
0.6588587, 1.053996, 0.6843345, 1, 1, 1, 1, 1,
0.6636831, -1.108767, 4.295588, 1, 1, 1, 1, 1,
0.6698112, -1.801118, 3.664073, 1, 1, 1, 1, 1,
0.6833733, 1.46964, 0.5517693, 1, 1, 1, 1, 1,
0.6876192, -0.4749934, 2.117225, 1, 1, 1, 1, 1,
0.6908764, -0.9878179, 1.536261, 1, 1, 1, 1, 1,
0.6953307, -0.3214483, 2.756864, 1, 1, 1, 1, 1,
0.6969041, 0.4020753, -0.978812, 1, 1, 1, 1, 1,
0.6969253, 0.03443511, 1.487113, 1, 1, 1, 1, 1,
0.7015344, 0.317643, 0.6529253, 1, 1, 1, 1, 1,
0.7058898, -0.05714658, 1.184549, 1, 1, 1, 1, 1,
0.7131987, -1.051708, 2.834335, 1, 1, 1, 1, 1,
0.7185147, -0.531256, 3.297332, 1, 1, 1, 1, 1,
0.7244241, 2.090233, 1.482927, 1, 1, 1, 1, 1,
0.7281832, -1.217801, 1.453979, 0, 0, 1, 1, 1,
0.7329685, -0.7141908, 2.097082, 1, 0, 0, 1, 1,
0.735142, 1.676966, -0.6426881, 1, 0, 0, 1, 1,
0.7437682, 0.09121958, 1.778016, 1, 0, 0, 1, 1,
0.7466021, 0.1219684, 1.240186, 1, 0, 0, 1, 1,
0.7524952, 0.6889023, 0.6155884, 1, 0, 0, 1, 1,
0.7594941, 0.1639007, 1.602288, 0, 0, 0, 1, 1,
0.7600441, 0.2781863, 2.987478, 0, 0, 0, 1, 1,
0.7614565, -0.5325654, 1.934002, 0, 0, 0, 1, 1,
0.7634016, -0.6541277, 2.23107, 0, 0, 0, 1, 1,
0.7651421, -0.4584479, 2.636675, 0, 0, 0, 1, 1,
0.7689305, 0.07007898, 3.552218, 0, 0, 0, 1, 1,
0.7749836, -1.500192, 3.163049, 0, 0, 0, 1, 1,
0.7769131, 0.2215655, 1.499629, 1, 1, 1, 1, 1,
0.7793378, 0.9920111, 0.418949, 1, 1, 1, 1, 1,
0.7798453, -0.3473099, 2.147233, 1, 1, 1, 1, 1,
0.7821587, 1.107192, -0.6342986, 1, 1, 1, 1, 1,
0.7841578, -0.6739829, 1.709298, 1, 1, 1, 1, 1,
0.7881567, -0.003209075, 2.038606, 1, 1, 1, 1, 1,
0.7929515, 0.2781944, -1.4241, 1, 1, 1, 1, 1,
0.8014351, 0.9126493, -0.07716837, 1, 1, 1, 1, 1,
0.8043761, -0.4521908, 2.257962, 1, 1, 1, 1, 1,
0.8065045, 0.8391622, -1.481619, 1, 1, 1, 1, 1,
0.8073544, -1.488268, 4.530428, 1, 1, 1, 1, 1,
0.8123299, 0.8898445, 0.1346803, 1, 1, 1, 1, 1,
0.8150971, -1.112252, 1.282538, 1, 1, 1, 1, 1,
0.8160643, 0.9780855, 0.7648293, 1, 1, 1, 1, 1,
0.8196861, -1.204961, 1.900057, 1, 1, 1, 1, 1,
0.8200714, -1.325869, 2.093194, 0, 0, 1, 1, 1,
0.8201604, 0.4659283, 1.14502, 1, 0, 0, 1, 1,
0.8248141, -0.6409535, 4.455008, 1, 0, 0, 1, 1,
0.829991, -1.52195, 3.850979, 1, 0, 0, 1, 1,
0.8467629, 0.8226766, -2.008229, 1, 0, 0, 1, 1,
0.8471538, 1.110316, 1.386628, 1, 0, 0, 1, 1,
0.8473508, -0.3014875, 0.7627656, 0, 0, 0, 1, 1,
0.8493132, 0.1161478, 1.377088, 0, 0, 0, 1, 1,
0.8542473, -0.4832356, 1.967974, 0, 0, 0, 1, 1,
0.8659718, 0.1400547, 0.3890788, 0, 0, 0, 1, 1,
0.8689725, 1.830596, 1.563506, 0, 0, 0, 1, 1,
0.8732181, 1.180687, -0.7118872, 0, 0, 0, 1, 1,
0.8750752, -0.5844215, 2.45242, 0, 0, 0, 1, 1,
0.8755603, 0.5400804, 0.9673764, 1, 1, 1, 1, 1,
0.8788597, 0.6785246, 0.4945656, 1, 1, 1, 1, 1,
0.8831809, -1.386512, 1.944006, 1, 1, 1, 1, 1,
0.886194, -1.035141, 3.130835, 1, 1, 1, 1, 1,
0.88753, 0.0653664, -0.6013371, 1, 1, 1, 1, 1,
0.8881673, 0.826094, 0.3677019, 1, 1, 1, 1, 1,
0.8912999, 0.02518894, 0.3096201, 1, 1, 1, 1, 1,
0.8927358, 0.193148, 2.531692, 1, 1, 1, 1, 1,
0.8950363, 1.065872, 1.475557, 1, 1, 1, 1, 1,
0.9011395, -0.4922644, 1.641431, 1, 1, 1, 1, 1,
0.903597, -1.787847, 2.357038, 1, 1, 1, 1, 1,
0.9041249, -0.9720545, 3.516748, 1, 1, 1, 1, 1,
0.9199944, -2.637254, 3.386367, 1, 1, 1, 1, 1,
0.9264699, 0.414567, 0.8727376, 1, 1, 1, 1, 1,
0.927087, 1.467049, 0.5692316, 1, 1, 1, 1, 1,
0.9404258, 0.2094314, 1.24363, 0, 0, 1, 1, 1,
0.9415903, -0.1728669, 2.809943, 1, 0, 0, 1, 1,
0.9536114, -0.3457787, 1.957652, 1, 0, 0, 1, 1,
0.9567866, 0.3489636, 1.20747, 1, 0, 0, 1, 1,
0.9619794, -2.307546, 2.228847, 1, 0, 0, 1, 1,
0.9711882, 0.343297, 1.546625, 1, 0, 0, 1, 1,
0.9742547, 0.04373763, 3.907259, 0, 0, 0, 1, 1,
0.9767125, -1.144775, 3.187715, 0, 0, 0, 1, 1,
0.9767721, -0.8517802, 0.7563013, 0, 0, 0, 1, 1,
0.979091, 1.094649, -0.6527515, 0, 0, 0, 1, 1,
0.9824979, 0.2403344, 0.8944725, 0, 0, 0, 1, 1,
0.9912121, 1.017969, 1.419696, 0, 0, 0, 1, 1,
0.9933524, -0.4862271, 2.490966, 0, 0, 0, 1, 1,
1.001797, -1.691584, 0.6089426, 1, 1, 1, 1, 1,
1.003366, -1.115294, 2.705644, 1, 1, 1, 1, 1,
1.005049, -0.1465045, 1.447867, 1, 1, 1, 1, 1,
1.005725, -0.6740153, 1.836324, 1, 1, 1, 1, 1,
1.019616, 0.2798532, 1.383854, 1, 1, 1, 1, 1,
1.021014, 1.680937, -0.4037095, 1, 1, 1, 1, 1,
1.022956, 0.305688, 1.014678, 1, 1, 1, 1, 1,
1.023054, -0.3896649, 2.411034, 1, 1, 1, 1, 1,
1.03078, -0.7755077, -0.279896, 1, 1, 1, 1, 1,
1.034935, -0.5604335, 0.6673934, 1, 1, 1, 1, 1,
1.035214, -0.3885292, 1.52627, 1, 1, 1, 1, 1,
1.035343, -1.001742, 2.600387, 1, 1, 1, 1, 1,
1.035793, 0.2082628, 1.554761, 1, 1, 1, 1, 1,
1.037727, -2.336867, 1.038807, 1, 1, 1, 1, 1,
1.042048, 1.525793, 0.4074908, 1, 1, 1, 1, 1,
1.044535, -1.173375, 3.096558, 0, 0, 1, 1, 1,
1.045036, 0.7457983, 0.317533, 1, 0, 0, 1, 1,
1.054808, 0.2559882, 0.7436432, 1, 0, 0, 1, 1,
1.060224, 0.4973636, 1.061495, 1, 0, 0, 1, 1,
1.063136, -0.1847756, -0.4058743, 1, 0, 0, 1, 1,
1.066426, 0.2076444, 0.1635527, 1, 0, 0, 1, 1,
1.06682, -0.4829922, 1.269018, 0, 0, 0, 1, 1,
1.072361, 1.785878, -1.163279, 0, 0, 0, 1, 1,
1.072464, -0.6936275, 2.305704, 0, 0, 0, 1, 1,
1.073967, -1.221811, 2.758415, 0, 0, 0, 1, 1,
1.082602, 0.7585228, 1.350303, 0, 0, 0, 1, 1,
1.086084, 1.109493, -0.8679931, 0, 0, 0, 1, 1,
1.092452, -0.586386, 0.4630918, 0, 0, 0, 1, 1,
1.09559, 1.153863, 2.195485, 1, 1, 1, 1, 1,
1.102161, -0.6832908, 3.810754, 1, 1, 1, 1, 1,
1.108243, -0.6643567, 1.424129, 1, 1, 1, 1, 1,
1.110095, 0.5346919, 0.902782, 1, 1, 1, 1, 1,
1.111669, 0.2278672, 0.5461883, 1, 1, 1, 1, 1,
1.112826, -0.8990925, 2.41132, 1, 1, 1, 1, 1,
1.116202, 0.5666361, 1.45362, 1, 1, 1, 1, 1,
1.124875, -1.433972, 0.9259168, 1, 1, 1, 1, 1,
1.125512, -0.005718658, 0.4448895, 1, 1, 1, 1, 1,
1.134046, -0.6012458, 2.140507, 1, 1, 1, 1, 1,
1.134223, 0.7163067, 1.095837, 1, 1, 1, 1, 1,
1.137393, 0.224606, 2.396356, 1, 1, 1, 1, 1,
1.137769, 0.5325573, 1.215047, 1, 1, 1, 1, 1,
1.142035, -1.186833, 2.178517, 1, 1, 1, 1, 1,
1.148689, -1.530022, 3.187913, 1, 1, 1, 1, 1,
1.149417, -0.1181625, 1.077224, 0, 0, 1, 1, 1,
1.168196, -0.3601305, 2.022948, 1, 0, 0, 1, 1,
1.170617, -0.3940887, 2.991797, 1, 0, 0, 1, 1,
1.172938, 0.7847981, -0.1551393, 1, 0, 0, 1, 1,
1.172958, -0.07856201, 0.5185435, 1, 0, 0, 1, 1,
1.182671, 0.1943717, 1.518323, 1, 0, 0, 1, 1,
1.185775, 0.4428717, 0.2308563, 0, 0, 0, 1, 1,
1.18589, -0.2383669, 1.870547, 0, 0, 0, 1, 1,
1.194417, -0.2387108, 1.568361, 0, 0, 0, 1, 1,
1.197054, -0.1118664, 2.921809, 0, 0, 0, 1, 1,
1.208353, -0.5589718, 2.205945, 0, 0, 0, 1, 1,
1.209151, 0.5636052, 0.9864727, 0, 0, 0, 1, 1,
1.210875, -0.7535917, 4.004556, 0, 0, 0, 1, 1,
1.2127, -0.9054275, 1.550222, 1, 1, 1, 1, 1,
1.233834, 0.4168575, -0.3896564, 1, 1, 1, 1, 1,
1.235998, -1.815779, 2.936165, 1, 1, 1, 1, 1,
1.240087, 0.2608608, 0.9845165, 1, 1, 1, 1, 1,
1.255803, -0.3802437, 2.6373, 1, 1, 1, 1, 1,
1.25713, 0.8678814, 1.678406, 1, 1, 1, 1, 1,
1.260615, 1.859883, 1.390501, 1, 1, 1, 1, 1,
1.263813, -0.5167128, 1.381774, 1, 1, 1, 1, 1,
1.281797, 0.9218518, 1.526757, 1, 1, 1, 1, 1,
1.292965, 0.6464444, 2.262507, 1, 1, 1, 1, 1,
1.296386, -0.3356725, 1.674967, 1, 1, 1, 1, 1,
1.297155, 1.396108, 0.4952579, 1, 1, 1, 1, 1,
1.307473, 2.732677, -0.3311461, 1, 1, 1, 1, 1,
1.323721, -0.2287542, 2.197515, 1, 1, 1, 1, 1,
1.323762, 0.9060765, 0.1174629, 1, 1, 1, 1, 1,
1.325974, -1.080774, 2.567356, 0, 0, 1, 1, 1,
1.339307, -0.2926082, 2.622396, 1, 0, 0, 1, 1,
1.340823, -0.4199356, 1.857799, 1, 0, 0, 1, 1,
1.341052, 0.541977, 0.6926748, 1, 0, 0, 1, 1,
1.345121, 0.1399932, 0.1729301, 1, 0, 0, 1, 1,
1.346616, -0.2995317, 2.05961, 1, 0, 0, 1, 1,
1.347455, -0.8060634, 1.493305, 0, 0, 0, 1, 1,
1.356089, -1.530406, 2.623472, 0, 0, 0, 1, 1,
1.360841, -0.2793981, 3.067778, 0, 0, 0, 1, 1,
1.368369, 1.29731, -1.902107, 0, 0, 0, 1, 1,
1.368552, 0.579675, 2.771699, 0, 0, 0, 1, 1,
1.37447, -0.1444578, 0.9843411, 0, 0, 0, 1, 1,
1.38338, -0.3052662, 1.974248, 0, 0, 0, 1, 1,
1.387776, -0.4761279, 1.715085, 1, 1, 1, 1, 1,
1.390665, -1.696766, 4.271272, 1, 1, 1, 1, 1,
1.397229, -2.017806, 2.85162, 1, 1, 1, 1, 1,
1.397892, -0.6849697, 2.32932, 1, 1, 1, 1, 1,
1.402742, -0.4949575, 1.857922, 1, 1, 1, 1, 1,
1.406167, -0.4628066, 1.163338, 1, 1, 1, 1, 1,
1.409552, 1.032283, 1.906683, 1, 1, 1, 1, 1,
1.413703, -0.06972676, 1.21467, 1, 1, 1, 1, 1,
1.419144, 1.399925, 1.973282, 1, 1, 1, 1, 1,
1.428225, -1.342187, 0.9697606, 1, 1, 1, 1, 1,
1.428468, -0.5243225, 2.41297, 1, 1, 1, 1, 1,
1.431989, -1.348834, 2.685627, 1, 1, 1, 1, 1,
1.445713, -0.9037396, 1.941608, 1, 1, 1, 1, 1,
1.446573, 1.015973, 0.867669, 1, 1, 1, 1, 1,
1.453385, 0.5275338, 2.130679, 1, 1, 1, 1, 1,
1.461814, 0.2525871, 2.190106, 0, 0, 1, 1, 1,
1.474133, -0.8940371, 1.393936, 1, 0, 0, 1, 1,
1.475608, -1.439682, 2.377189, 1, 0, 0, 1, 1,
1.486273, 0.3942824, 1.739218, 1, 0, 0, 1, 1,
1.503116, -1.167776, 2.774588, 1, 0, 0, 1, 1,
1.507659, 0.5692501, 1.002308, 1, 0, 0, 1, 1,
1.513664, -0.988552, 0.2143299, 0, 0, 0, 1, 1,
1.517868, 1.297952, 0.1802333, 0, 0, 0, 1, 1,
1.518178, 0.03362979, 2.282969, 0, 0, 0, 1, 1,
1.518244, 0.2659237, 2.059404, 0, 0, 0, 1, 1,
1.552204, 0.1264328, 1.815788, 0, 0, 0, 1, 1,
1.552408, 0.3733391, 0.8935252, 0, 0, 0, 1, 1,
1.562704, 0.9696043, 0.9329292, 0, 0, 0, 1, 1,
1.585495, -1.241119, 3.187173, 1, 1, 1, 1, 1,
1.588941, 0.8973374, 1.572423, 1, 1, 1, 1, 1,
1.589656, 2.112544, 0.7545924, 1, 1, 1, 1, 1,
1.596017, -1.409879, 2.055803, 1, 1, 1, 1, 1,
1.61737, -1.253585, 3.93167, 1, 1, 1, 1, 1,
1.617406, 0.8945432, -0.3930032, 1, 1, 1, 1, 1,
1.63901, -0.2307768, -0.695731, 1, 1, 1, 1, 1,
1.640634, -0.9986773, 0.6594976, 1, 1, 1, 1, 1,
1.647159, -0.4896874, 2.677036, 1, 1, 1, 1, 1,
1.653442, 1.611597, 2.127891, 1, 1, 1, 1, 1,
1.654713, 1.333867, 2.430225, 1, 1, 1, 1, 1,
1.660287, 0.5243216, 1.558428, 1, 1, 1, 1, 1,
1.66035, 0.5619355, -0.2265296, 1, 1, 1, 1, 1,
1.68077, 0.1790394, 1.346581, 1, 1, 1, 1, 1,
1.682828, 2.054701, -0.7997171, 1, 1, 1, 1, 1,
1.690587, -0.1773794, 1.041303, 0, 0, 1, 1, 1,
1.706067, -0.1121165, 1.623589, 1, 0, 0, 1, 1,
1.724906, 1.700909, -0.2159443, 1, 0, 0, 1, 1,
1.741669, -0.6252697, 0.7468272, 1, 0, 0, 1, 1,
1.745139, -0.5010673, 0.9304044, 1, 0, 0, 1, 1,
1.759561, 0.9730793, 1.751848, 1, 0, 0, 1, 1,
1.774462, 1.179708, 1.588076, 0, 0, 0, 1, 1,
1.781637, 0.936848, 0.9676464, 0, 0, 0, 1, 1,
1.800247, 0.6771238, 2.426368, 0, 0, 0, 1, 1,
1.802405, 2.043442, 0.6444991, 0, 0, 0, 1, 1,
1.803041, 1.779671, -0.5978974, 0, 0, 0, 1, 1,
1.814338, 0.4422852, 2.29537, 0, 0, 0, 1, 1,
1.814561, -1.168095, 3.162885, 0, 0, 0, 1, 1,
1.830306, 0.8064083, -0.09714437, 1, 1, 1, 1, 1,
1.835435, 0.6465184, 0.04468011, 1, 1, 1, 1, 1,
1.856762, 1.749894, 0.5637661, 1, 1, 1, 1, 1,
1.890333, 0.06756064, 1.924265, 1, 1, 1, 1, 1,
1.892052, -0.1823755, 1.785862, 1, 1, 1, 1, 1,
1.904034, -1.710856, 1.852285, 1, 1, 1, 1, 1,
1.932913, -0.004854087, 1.115213, 1, 1, 1, 1, 1,
1.935018, -2.427056, 3.59512, 1, 1, 1, 1, 1,
1.97102, -0.3827089, 2.804839, 1, 1, 1, 1, 1,
1.993379, -0.6739333, 3.22969, 1, 1, 1, 1, 1,
1.995588, -1.082572, 3.209514, 1, 1, 1, 1, 1,
2.016854, 0.4599933, 3.515975, 1, 1, 1, 1, 1,
2.036782, 0.1132981, 1.035599, 1, 1, 1, 1, 1,
2.076457, 1.018563, 2.646011, 1, 1, 1, 1, 1,
2.077722, -1.595343, 3.632043, 1, 1, 1, 1, 1,
2.081141, -0.5474354, 2.299891, 0, 0, 1, 1, 1,
2.130386, -0.6190372, 1.002787, 1, 0, 0, 1, 1,
2.132626, -0.5024625, 1.805804, 1, 0, 0, 1, 1,
2.141113, 0.8055496, 0.6953647, 1, 0, 0, 1, 1,
2.199725, -0.2745486, 2.880161, 1, 0, 0, 1, 1,
2.206552, -0.6379647, 2.86317, 1, 0, 0, 1, 1,
2.247039, 0.9191435, -0.3156081, 0, 0, 0, 1, 1,
2.311508, 0.4991915, 0.4347123, 0, 0, 0, 1, 1,
2.316217, -1.130414, 1.898624, 0, 0, 0, 1, 1,
2.328811, -0.2647606, 1.480424, 0, 0, 0, 1, 1,
2.349114, -1.620538, 3.200813, 0, 0, 0, 1, 1,
2.385374, -0.06980317, 0.9817373, 0, 0, 0, 1, 1,
2.394178, -0.5841376, 0.9114874, 0, 0, 0, 1, 1,
2.496338, 0.03111845, 2.639205, 1, 1, 1, 1, 1,
2.542688, 0.5917146, 0.8463525, 1, 1, 1, 1, 1,
2.572555, -0.7453669, 1.992634, 1, 1, 1, 1, 1,
2.591364, -0.7249606, 3.055837, 1, 1, 1, 1, 1,
2.726963, -0.5254233, 2.4138, 1, 1, 1, 1, 1,
2.849467, 0.8804165, -0.08343004, 1, 1, 1, 1, 1,
3.186865, -0.04238001, 0.7909644, 1, 1, 1, 1, 1
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
var radius = 9.742303;
var distance = 34.21943;
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
mvMatrix.translate( -0.07725906, 0.0385747, -0.0342288 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.21943);
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
