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
-4.238915, -1.341966, -2.099311, 1, 0, 0, 1,
-3.088724, -0.2530349, -2.704813, 1, 0.007843138, 0, 1,
-2.960837, -0.2904555, -1.109338, 1, 0.01176471, 0, 1,
-2.774591, -0.8087415, -3.876771, 1, 0.01960784, 0, 1,
-2.597651, 0.9103363, 0.208997, 1, 0.02352941, 0, 1,
-2.572626, -0.02699603, -1.722577, 1, 0.03137255, 0, 1,
-2.552215, -0.8548672, -0.9789244, 1, 0.03529412, 0, 1,
-2.372882, 0.3084059, -1.549473, 1, 0.04313726, 0, 1,
-2.360617, 1.185034, -0.6627108, 1, 0.04705882, 0, 1,
-2.348411, 0.4182409, -1.664119, 1, 0.05490196, 0, 1,
-2.321102, 0.1139789, -0.3274139, 1, 0.05882353, 0, 1,
-2.30646, 1.451195, -0.2626809, 1, 0.06666667, 0, 1,
-2.300421, 1.999183, 0.4438057, 1, 0.07058824, 0, 1,
-2.288496, 1.292316, -1.041904, 1, 0.07843138, 0, 1,
-2.246664, 0.494253, -1.461927, 1, 0.08235294, 0, 1,
-2.243739, -1.76371, -1.518855, 1, 0.09019608, 0, 1,
-2.214158, 1.850603, -0.3265437, 1, 0.09411765, 0, 1,
-2.204304, -0.5731266, -2.129572, 1, 0.1019608, 0, 1,
-2.201971, -2.392044, -1.232276, 1, 0.1098039, 0, 1,
-2.165901, 1.693312, -1.578832, 1, 0.1137255, 0, 1,
-2.142218, 0.6793319, 0.1350811, 1, 0.1215686, 0, 1,
-2.104837, 1.07341, -1.616221, 1, 0.1254902, 0, 1,
-2.101333, -1.634826, -1.108297, 1, 0.1333333, 0, 1,
-2.06401, 0.7888556, -1.290806, 1, 0.1372549, 0, 1,
-2.052442, -0.8017855, -0.3379034, 1, 0.145098, 0, 1,
-2.015944, -0.2956239, -3.339917, 1, 0.1490196, 0, 1,
-1.98297, 0.9750775, -1.271213, 1, 0.1568628, 0, 1,
-1.965364, -0.3360687, -1.56311, 1, 0.1607843, 0, 1,
-1.96146, 0.09408645, -2.47911, 1, 0.1686275, 0, 1,
-1.960011, -1.042227, -1.165255, 1, 0.172549, 0, 1,
-1.945862, -0.275723, -1.832544, 1, 0.1803922, 0, 1,
-1.941416, -0.7500798, -0.2994544, 1, 0.1843137, 0, 1,
-1.920513, -0.2119287, -2.386087, 1, 0.1921569, 0, 1,
-1.871217, -1.191548, -2.933974, 1, 0.1960784, 0, 1,
-1.869221, 0.2386133, -2.387013, 1, 0.2039216, 0, 1,
-1.862278, 0.9649683, -0.2888043, 1, 0.2117647, 0, 1,
-1.851438, -0.4375742, 0.02454147, 1, 0.2156863, 0, 1,
-1.839021, -0.3092719, -0.5482059, 1, 0.2235294, 0, 1,
-1.829012, 0.07889593, -1.439163, 1, 0.227451, 0, 1,
-1.815309, 1.341162, -0.4880702, 1, 0.2352941, 0, 1,
-1.814347, -1.303139, -2.814013, 1, 0.2392157, 0, 1,
-1.803032, 0.3272179, -1.157349, 1, 0.2470588, 0, 1,
-1.793, -1.163696, -2.02777, 1, 0.2509804, 0, 1,
-1.791502, 0.2669482, -0.7499599, 1, 0.2588235, 0, 1,
-1.787241, 1.872769, -1.307961, 1, 0.2627451, 0, 1,
-1.771976, 1.887926, -0.3348633, 1, 0.2705882, 0, 1,
-1.76945, -0.09715918, -1.650867, 1, 0.2745098, 0, 1,
-1.769146, -0.6455997, -1.386439, 1, 0.282353, 0, 1,
-1.753381, 1.123767, -2.405434, 1, 0.2862745, 0, 1,
-1.742254, -0.2497799, -1.190243, 1, 0.2941177, 0, 1,
-1.707248, 0.4568874, -1.111069, 1, 0.3019608, 0, 1,
-1.697818, 0.2235952, -0.3884495, 1, 0.3058824, 0, 1,
-1.675576, -0.9202788, -1.483418, 1, 0.3137255, 0, 1,
-1.645979, 0.02899054, -2.865454, 1, 0.3176471, 0, 1,
-1.624882, -0.3452621, -4.144335, 1, 0.3254902, 0, 1,
-1.623025, 1.034292, -1.034483, 1, 0.3294118, 0, 1,
-1.61713, -0.1535098, -1.175914, 1, 0.3372549, 0, 1,
-1.613613, -0.8286797, -1.922233, 1, 0.3411765, 0, 1,
-1.609293, 0.9831802, -1.579262, 1, 0.3490196, 0, 1,
-1.588576, 0.7819099, -0.3635679, 1, 0.3529412, 0, 1,
-1.586937, -0.8289706, -2.048605, 1, 0.3607843, 0, 1,
-1.580411, 0.4114491, -0.06658473, 1, 0.3647059, 0, 1,
-1.566176, 0.1870756, -1.979017, 1, 0.372549, 0, 1,
-1.55105, 0.468679, -2.537998, 1, 0.3764706, 0, 1,
-1.550049, 0.2453682, -0.5213651, 1, 0.3843137, 0, 1,
-1.548111, -1.553283, -1.219652, 1, 0.3882353, 0, 1,
-1.546715, -0.1574359, -3.554468, 1, 0.3960784, 0, 1,
-1.543454, -0.131414, -1.472524, 1, 0.4039216, 0, 1,
-1.535225, 0.175987, 0.01904331, 1, 0.4078431, 0, 1,
-1.527814, -2.158466, -2.366652, 1, 0.4156863, 0, 1,
-1.495067, -1.493624, -2.296969, 1, 0.4196078, 0, 1,
-1.489056, 0.7238496, -1.545669, 1, 0.427451, 0, 1,
-1.487048, 1.429974, -1.168863, 1, 0.4313726, 0, 1,
-1.484701, 0.4623146, 0.279151, 1, 0.4392157, 0, 1,
-1.477442, 0.9336488, -0.6041505, 1, 0.4431373, 0, 1,
-1.467977, -0.8831762, -1.298295, 1, 0.4509804, 0, 1,
-1.45484, 0.5263193, -0.655369, 1, 0.454902, 0, 1,
-1.447325, -0.3416125, -0.5509368, 1, 0.4627451, 0, 1,
-1.443058, -0.2171153, -1.762043, 1, 0.4666667, 0, 1,
-1.441923, 2.427115, -0.655899, 1, 0.4745098, 0, 1,
-1.441546, 1.29558, -1.427894, 1, 0.4784314, 0, 1,
-1.437168, 0.8723674, -1.538373, 1, 0.4862745, 0, 1,
-1.434312, -0.388512, -0.9846845, 1, 0.4901961, 0, 1,
-1.42068, 1.788415, -0.3394285, 1, 0.4980392, 0, 1,
-1.42032, 0.3653511, -1.88945, 1, 0.5058824, 0, 1,
-1.416041, -2.153575, 0.822202, 1, 0.509804, 0, 1,
-1.408294, -0.1207538, 0.1997716, 1, 0.5176471, 0, 1,
-1.403887, 0.3820459, -1.731505, 1, 0.5215687, 0, 1,
-1.40021, 1.103251, -0.5882623, 1, 0.5294118, 0, 1,
-1.399251, -0.3845556, -1.952532, 1, 0.5333334, 0, 1,
-1.392561, 0.2334142, -3.278987, 1, 0.5411765, 0, 1,
-1.390504, 0.2259194, -1.262709, 1, 0.5450981, 0, 1,
-1.373037, -1.279221, -1.953051, 1, 0.5529412, 0, 1,
-1.367308, -2.889829, -2.818238, 1, 0.5568628, 0, 1,
-1.363243, 1.368434, 0.1502097, 1, 0.5647059, 0, 1,
-1.354992, -1.091123, -3.231121, 1, 0.5686275, 0, 1,
-1.341494, -0.1913018, -1.425277, 1, 0.5764706, 0, 1,
-1.335154, -0.434857, 0.9416049, 1, 0.5803922, 0, 1,
-1.334973, 0.7015896, -0.9380461, 1, 0.5882353, 0, 1,
-1.300364, 1.427806, -1.923825, 1, 0.5921569, 0, 1,
-1.293719, 1.023011, 0.09367949, 1, 0.6, 0, 1,
-1.285936, 1.554959, -1.743645, 1, 0.6078432, 0, 1,
-1.279623, -0.7094395, -1.275767, 1, 0.6117647, 0, 1,
-1.278259, 0.9796705, -2.703353, 1, 0.6196079, 0, 1,
-1.276537, -0.2524383, -4.037339, 1, 0.6235294, 0, 1,
-1.267646, 1.39032, -0.7838377, 1, 0.6313726, 0, 1,
-1.265018, -0.7787129, -2.719625, 1, 0.6352941, 0, 1,
-1.244203, -2.067768, -2.886733, 1, 0.6431373, 0, 1,
-1.239596, 1.132063, -1.862162, 1, 0.6470588, 0, 1,
-1.229795, 1.945281, -1.490799, 1, 0.654902, 0, 1,
-1.21953, -0.2053905, -1.800415, 1, 0.6588235, 0, 1,
-1.21557, -0.718689, -0.7252181, 1, 0.6666667, 0, 1,
-1.212711, 1.304278, -2.564403, 1, 0.6705883, 0, 1,
-1.207832, 0.3134975, -2.105685, 1, 0.6784314, 0, 1,
-1.193168, -1.549027, -2.28934, 1, 0.682353, 0, 1,
-1.191638, 1.521, 0.1041787, 1, 0.6901961, 0, 1,
-1.189169, 0.2228931, -1.490803, 1, 0.6941177, 0, 1,
-1.185886, 0.7873386, 0.3283737, 1, 0.7019608, 0, 1,
-1.18283, 1.013332, 0.1614881, 1, 0.7098039, 0, 1,
-1.182156, 0.06045407, -1.619879, 1, 0.7137255, 0, 1,
-1.179037, 0.5198607, -1.247251, 1, 0.7215686, 0, 1,
-1.178952, 1.094447, -0.4778845, 1, 0.7254902, 0, 1,
-1.172976, 3.053248, -0.8713033, 1, 0.7333333, 0, 1,
-1.157738, 0.8912128, -1.767968, 1, 0.7372549, 0, 1,
-1.146339, -0.9866086, -3.850913, 1, 0.7450981, 0, 1,
-1.140205, -1.328628, -1.280732, 1, 0.7490196, 0, 1,
-1.13694, -1.033083, -3.763982, 1, 0.7568628, 0, 1,
-1.1261, 0.03721553, -0.5478145, 1, 0.7607843, 0, 1,
-1.124044, -1.173254, -2.489855, 1, 0.7686275, 0, 1,
-1.118249, -0.5190315, -3.320658, 1, 0.772549, 0, 1,
-1.116024, -0.7147372, -2.444563, 1, 0.7803922, 0, 1,
-1.107582, -1.704734, -3.096382, 1, 0.7843137, 0, 1,
-1.093161, 0.9631215, 0.6366082, 1, 0.7921569, 0, 1,
-1.086278, 2.413288, -0.5643447, 1, 0.7960784, 0, 1,
-1.084897, 1.516225, -0.9004735, 1, 0.8039216, 0, 1,
-1.083159, 2.018998, -0.5834762, 1, 0.8117647, 0, 1,
-1.082223, 0.01165296, -1.936319, 1, 0.8156863, 0, 1,
-1.072036, -0.005631013, -0.009856758, 1, 0.8235294, 0, 1,
-1.068234, -0.007154384, -2.007547, 1, 0.827451, 0, 1,
-1.062092, 1.346336, -0.7358892, 1, 0.8352941, 0, 1,
-1.061614, 0.09093577, -1.724431, 1, 0.8392157, 0, 1,
-1.053507, 2.158748, -1.618638, 1, 0.8470588, 0, 1,
-1.038331, -0.4272977, 0.1016018, 1, 0.8509804, 0, 1,
-1.036598, -0.2960492, -1.621664, 1, 0.8588235, 0, 1,
-1.035562, -0.4285872, -3.540747, 1, 0.8627451, 0, 1,
-1.017888, -0.2584417, -0.7671779, 1, 0.8705882, 0, 1,
-1.015481, 0.4501097, -1.566099, 1, 0.8745098, 0, 1,
-1.008538, -0.8161771, -3.821998, 1, 0.8823529, 0, 1,
-1.00676, -0.1235671, -2.10599, 1, 0.8862745, 0, 1,
-1.005871, -1.441898, -2.641804, 1, 0.8941177, 0, 1,
-1.00198, 1.719093, -0.5607745, 1, 0.8980392, 0, 1,
-0.9951558, -0.3608544, -1.610327, 1, 0.9058824, 0, 1,
-0.9938215, 0.4647695, -1.484451, 1, 0.9137255, 0, 1,
-0.9897002, 0.7066024, 0.006518539, 1, 0.9176471, 0, 1,
-0.9806417, -1.095629, -4.120597, 1, 0.9254902, 0, 1,
-0.97293, -1.114617, -0.8099074, 1, 0.9294118, 0, 1,
-0.971319, 1.062435, -0.3638103, 1, 0.9372549, 0, 1,
-0.9626876, 1.48026, -1.558008, 1, 0.9411765, 0, 1,
-0.9625773, 0.8402148, -0.759244, 1, 0.9490196, 0, 1,
-0.955506, -0.5036969, -1.263274, 1, 0.9529412, 0, 1,
-0.9518112, 1.75242, -1.166428, 1, 0.9607843, 0, 1,
-0.9444619, -2.327345, -2.305114, 1, 0.9647059, 0, 1,
-0.9434709, -0.7338128, -1.435864, 1, 0.972549, 0, 1,
-0.941648, 0.5949026, -0.6069021, 1, 0.9764706, 0, 1,
-0.9401587, 0.2973439, -1.510797, 1, 0.9843137, 0, 1,
-0.938922, -1.153153, -3.179488, 1, 0.9882353, 0, 1,
-0.9351503, -1.422156, -2.532826, 1, 0.9960784, 0, 1,
-0.9273407, 0.0514806, -1.134777, 0.9960784, 1, 0, 1,
-0.9219507, -1.087838, -1.542023, 0.9921569, 1, 0, 1,
-0.9164026, 1.296667, -1.688728, 0.9843137, 1, 0, 1,
-0.910517, 0.4069532, -2.301122, 0.9803922, 1, 0, 1,
-0.9104492, 0.1014518, -2.042167, 0.972549, 1, 0, 1,
-0.902518, -0.8791431, -0.2782232, 0.9686275, 1, 0, 1,
-0.90079, -0.648448, -2.420903, 0.9607843, 1, 0, 1,
-0.8913122, -0.8207653, -1.141117, 0.9568627, 1, 0, 1,
-0.8905106, -1.008397, -2.525303, 0.9490196, 1, 0, 1,
-0.8842299, -0.5789781, -1.894378, 0.945098, 1, 0, 1,
-0.8818755, -0.3808319, -2.792337, 0.9372549, 1, 0, 1,
-0.8786629, 0.2584475, -0.4243917, 0.9333333, 1, 0, 1,
-0.8745707, 0.4376566, -1.265721, 0.9254902, 1, 0, 1,
-0.8666695, -0.3107889, -2.638103, 0.9215686, 1, 0, 1,
-0.8650234, -1.013735, -3.962529, 0.9137255, 1, 0, 1,
-0.8578923, 0.8282589, -1.361557, 0.9098039, 1, 0, 1,
-0.8573703, -0.7549911, -2.955858, 0.9019608, 1, 0, 1,
-0.8568357, 1.051499, -2.621325, 0.8941177, 1, 0, 1,
-0.8562065, -0.1421851, -2.253408, 0.8901961, 1, 0, 1,
-0.8548917, 0.7197286, -1.588932, 0.8823529, 1, 0, 1,
-0.854666, 0.06712846, -0.9917973, 0.8784314, 1, 0, 1,
-0.852759, 0.2247994, 0.1288102, 0.8705882, 1, 0, 1,
-0.8514799, 0.02545567, -1.608647, 0.8666667, 1, 0, 1,
-0.8502945, -0.5221633, -3.104211, 0.8588235, 1, 0, 1,
-0.8478706, -0.1361651, -1.362679, 0.854902, 1, 0, 1,
-0.8471449, -0.4964536, -2.01724, 0.8470588, 1, 0, 1,
-0.8391643, -0.06476215, -2.958162, 0.8431373, 1, 0, 1,
-0.8365769, 0.6187993, -0.119699, 0.8352941, 1, 0, 1,
-0.835888, -1.304375, -2.086236, 0.8313726, 1, 0, 1,
-0.8337731, 1.587962, -1.884656, 0.8235294, 1, 0, 1,
-0.8265343, 1.072779, 0.2118439, 0.8196079, 1, 0, 1,
-0.8233708, 2.004611, -1.120244, 0.8117647, 1, 0, 1,
-0.8227464, -0.5505531, -1.421901, 0.8078431, 1, 0, 1,
-0.8207217, -1.212792, -2.030637, 0.8, 1, 0, 1,
-0.8198248, -0.369036, -1.385501, 0.7921569, 1, 0, 1,
-0.8148633, 0.5557041, -1.311776, 0.7882353, 1, 0, 1,
-0.810844, -1.237735, -1.033196, 0.7803922, 1, 0, 1,
-0.809638, -0.4100051, -2.990877, 0.7764706, 1, 0, 1,
-0.8060873, 1.326734, -0.5182175, 0.7686275, 1, 0, 1,
-0.8046379, 0.2718413, -1.840562, 0.7647059, 1, 0, 1,
-0.803129, -2.050508, -3.26191, 0.7568628, 1, 0, 1,
-0.7997759, 0.4521711, -0.5833637, 0.7529412, 1, 0, 1,
-0.7993376, -0.3573863, -1.424679, 0.7450981, 1, 0, 1,
-0.7993261, -0.7780651, -3.386186, 0.7411765, 1, 0, 1,
-0.7981627, 0.6158758, -0.6142746, 0.7333333, 1, 0, 1,
-0.7961621, -0.9722069, -3.912188, 0.7294118, 1, 0, 1,
-0.7952602, -0.09567034, -1.562638, 0.7215686, 1, 0, 1,
-0.7921866, 0.1258167, -1.477839, 0.7176471, 1, 0, 1,
-0.7888374, 0.5078338, -0.806646, 0.7098039, 1, 0, 1,
-0.7874258, 0.3686816, 0.1234125, 0.7058824, 1, 0, 1,
-0.7851313, 0.4119731, -1.969588, 0.6980392, 1, 0, 1,
-0.7827513, -2.236851, -1.451175, 0.6901961, 1, 0, 1,
-0.7767397, -0.7061053, -0.8698017, 0.6862745, 1, 0, 1,
-0.7738746, 0.2065055, -2.445434, 0.6784314, 1, 0, 1,
-0.7735309, 0.1571389, 0.2285355, 0.6745098, 1, 0, 1,
-0.773411, -0.7000929, -2.39239, 0.6666667, 1, 0, 1,
-0.771, 0.7486442, 1.717489, 0.6627451, 1, 0, 1,
-0.76408, 1.241527, 0.003372929, 0.654902, 1, 0, 1,
-0.7638269, 1.125099, -0.2534959, 0.6509804, 1, 0, 1,
-0.7592638, -0.7372243, -3.502994, 0.6431373, 1, 0, 1,
-0.7561932, 1.384647, 0.8053769, 0.6392157, 1, 0, 1,
-0.7558184, 0.03048561, -1.649481, 0.6313726, 1, 0, 1,
-0.7551695, -1.106248, -2.120884, 0.627451, 1, 0, 1,
-0.7538308, 0.9410933, -1.872612, 0.6196079, 1, 0, 1,
-0.7464471, -0.2524507, -2.16034, 0.6156863, 1, 0, 1,
-0.7429873, 1.028952, -0.1747129, 0.6078432, 1, 0, 1,
-0.7376285, -0.5300753, -0.6173842, 0.6039216, 1, 0, 1,
-0.729348, 0.05227263, -1.14998, 0.5960785, 1, 0, 1,
-0.7291867, 0.1902872, -1.056035, 0.5882353, 1, 0, 1,
-0.7263163, 1.246219, 0.4602988, 0.5843138, 1, 0, 1,
-0.7165262, 2.382793, -1.30283, 0.5764706, 1, 0, 1,
-0.7146412, 0.2593246, -0.409948, 0.572549, 1, 0, 1,
-0.714011, 1.087059, -1.244184, 0.5647059, 1, 0, 1,
-0.7118729, 1.22949, -1.068644, 0.5607843, 1, 0, 1,
-0.7108968, 0.48294, -1.465186, 0.5529412, 1, 0, 1,
-0.7058145, 0.2626697, -1.650526, 0.5490196, 1, 0, 1,
-0.7032908, 0.1845133, -0.5947234, 0.5411765, 1, 0, 1,
-0.7023925, 0.8372501, -1.812372, 0.5372549, 1, 0, 1,
-0.6943174, 0.6490468, -0.4534889, 0.5294118, 1, 0, 1,
-0.6942266, -0.7490692, -1.212998, 0.5254902, 1, 0, 1,
-0.6868208, 0.4089996, -0.3889235, 0.5176471, 1, 0, 1,
-0.6868178, 1.168809, -0.873082, 0.5137255, 1, 0, 1,
-0.6839415, 0.2648651, -1.402258, 0.5058824, 1, 0, 1,
-0.6738623, -1.259482, -3.412144, 0.5019608, 1, 0, 1,
-0.673655, -0.7708423, -4.853416, 0.4941176, 1, 0, 1,
-0.6703023, 0.5903138, -1.20927, 0.4862745, 1, 0, 1,
-0.6667026, -0.6464267, -2.129621, 0.4823529, 1, 0, 1,
-0.662519, -0.7170667, -1.480248, 0.4745098, 1, 0, 1,
-0.6623145, 0.3371181, -0.8334804, 0.4705882, 1, 0, 1,
-0.6559116, -1.315293, -2.500897, 0.4627451, 1, 0, 1,
-0.65561, 1.452562, -0.7703149, 0.4588235, 1, 0, 1,
-0.6478301, -0.07267281, 0.2559061, 0.4509804, 1, 0, 1,
-0.6449423, -1.637507, -5.124643, 0.4470588, 1, 0, 1,
-0.6405355, -0.9741053, -2.196179, 0.4392157, 1, 0, 1,
-0.6343066, -0.7249815, -2.497521, 0.4352941, 1, 0, 1,
-0.6329559, 1.714175, -0.9493654, 0.427451, 1, 0, 1,
-0.6150337, 0.7543696, -1.548488, 0.4235294, 1, 0, 1,
-0.607731, -0.6632317, -2.368854, 0.4156863, 1, 0, 1,
-0.607281, -1.413731, -1.850921, 0.4117647, 1, 0, 1,
-0.6026744, 1.423344, 0.4526807, 0.4039216, 1, 0, 1,
-0.5988581, -1.670794, -2.463587, 0.3960784, 1, 0, 1,
-0.5972343, 0.3758779, -1.197821, 0.3921569, 1, 0, 1,
-0.5898735, 1.922124, -0.3745624, 0.3843137, 1, 0, 1,
-0.5895883, -2.578231, -3.683453, 0.3803922, 1, 0, 1,
-0.5894742, 0.1757201, 0.1895981, 0.372549, 1, 0, 1,
-0.5894211, 0.124506, 0.07748826, 0.3686275, 1, 0, 1,
-0.5890884, -0.8393044, -3.405598, 0.3607843, 1, 0, 1,
-0.5841825, -1.51065, -3.091716, 0.3568628, 1, 0, 1,
-0.583087, 0.3495649, -1.832479, 0.3490196, 1, 0, 1,
-0.5822837, -0.7359371, -0.5752552, 0.345098, 1, 0, 1,
-0.5806286, -0.8901283, -2.097309, 0.3372549, 1, 0, 1,
-0.5748456, -2.095263, -1.906828, 0.3333333, 1, 0, 1,
-0.5743932, 0.5703886, -0.13894, 0.3254902, 1, 0, 1,
-0.5666767, 0.9196124, -1.154647, 0.3215686, 1, 0, 1,
-0.5641676, -0.3115124, -0.7085153, 0.3137255, 1, 0, 1,
-0.5639583, -1.220383, -4.028791, 0.3098039, 1, 0, 1,
-0.5613538, 2.366194, -1.405461, 0.3019608, 1, 0, 1,
-0.5585642, -0.5786969, -1.875477, 0.2941177, 1, 0, 1,
-0.5571652, -0.7005315, -4.787754, 0.2901961, 1, 0, 1,
-0.5429362, -0.2369197, -0.5790101, 0.282353, 1, 0, 1,
-0.538439, 0.06403317, 0.6968809, 0.2784314, 1, 0, 1,
-0.5381177, 1.676586, 0.7454926, 0.2705882, 1, 0, 1,
-0.5380805, -1.39418, -1.792463, 0.2666667, 1, 0, 1,
-0.5380144, -0.6045485, -3.009787, 0.2588235, 1, 0, 1,
-0.5343024, -1.084762, -0.4795866, 0.254902, 1, 0, 1,
-0.5265163, 0.0911644, -2.489812, 0.2470588, 1, 0, 1,
-0.5233564, -0.1536026, -2.676817, 0.2431373, 1, 0, 1,
-0.5207149, -1.221059, -2.410098, 0.2352941, 1, 0, 1,
-0.5172403, -0.6003149, -3.966247, 0.2313726, 1, 0, 1,
-0.5108551, 1.719135, -0.7358431, 0.2235294, 1, 0, 1,
-0.5076599, 0.1721536, -1.958851, 0.2196078, 1, 0, 1,
-0.5029655, 0.4621142, -1.493272, 0.2117647, 1, 0, 1,
-0.5015057, 0.4842763, 0.4684641, 0.2078431, 1, 0, 1,
-0.4992005, -0.07999125, -3.13507, 0.2, 1, 0, 1,
-0.4960611, 0.4940626, -1.114201, 0.1921569, 1, 0, 1,
-0.4954994, 0.8685358, 0.5876459, 0.1882353, 1, 0, 1,
-0.4952821, -1.080121, -2.8994, 0.1803922, 1, 0, 1,
-0.493817, 1.052756, -0.9355906, 0.1764706, 1, 0, 1,
-0.4937267, 0.2853678, -0.7036605, 0.1686275, 1, 0, 1,
-0.4924942, -1.626563, -2.49098, 0.1647059, 1, 0, 1,
-0.4898301, -1.342948, -3.223103, 0.1568628, 1, 0, 1,
-0.4869419, -1.259561, -4.365795, 0.1529412, 1, 0, 1,
-0.4827169, 1.265124, 0.2932644, 0.145098, 1, 0, 1,
-0.4798313, -0.5475578, -2.378902, 0.1411765, 1, 0, 1,
-0.4795137, 0.02269088, -1.919997, 0.1333333, 1, 0, 1,
-0.4765967, 0.07364355, -0.06757699, 0.1294118, 1, 0, 1,
-0.4758047, -0.03523329, -2.834144, 0.1215686, 1, 0, 1,
-0.4735121, -0.6317575, -3.575664, 0.1176471, 1, 0, 1,
-0.4717874, 0.715923, -0.7956662, 0.1098039, 1, 0, 1,
-0.4702788, -0.6715729, -2.38765, 0.1058824, 1, 0, 1,
-0.4675477, -0.6030558, -0.6686075, 0.09803922, 1, 0, 1,
-0.465926, 0.2154142, -1.866906, 0.09019608, 1, 0, 1,
-0.4631906, 1.204344, 1.280153, 0.08627451, 1, 0, 1,
-0.4629953, -0.7787555, -1.793091, 0.07843138, 1, 0, 1,
-0.4618201, 1.284402, -1.681553, 0.07450981, 1, 0, 1,
-0.4608239, 1.011395, 1.131731, 0.06666667, 1, 0, 1,
-0.4573278, -0.9930573, -2.584929, 0.0627451, 1, 0, 1,
-0.4547303, 0.2291013, -0.7751721, 0.05490196, 1, 0, 1,
-0.4522107, 1.209797, -0.1715502, 0.05098039, 1, 0, 1,
-0.4517394, 0.7675946, -0.05963183, 0.04313726, 1, 0, 1,
-0.4492941, 0.6790055, -0.9215888, 0.03921569, 1, 0, 1,
-0.4458389, -0.7963965, -1.51423, 0.03137255, 1, 0, 1,
-0.4432117, -1.009525, -0.1120113, 0.02745098, 1, 0, 1,
-0.4422071, 1.953032, -0.9301029, 0.01960784, 1, 0, 1,
-0.4395787, -0.01464002, -1.065914, 0.01568628, 1, 0, 1,
-0.4393994, -0.6095676, -3.278704, 0.007843138, 1, 0, 1,
-0.4384202, -0.2367133, -2.74059, 0.003921569, 1, 0, 1,
-0.434771, -0.2040703, -1.414282, 0, 1, 0.003921569, 1,
-0.4333482, 1.31734, -0.461283, 0, 1, 0.01176471, 1,
-0.4226568, -0.3365829, -2.288838, 0, 1, 0.01568628, 1,
-0.4224178, 0.5771493, -1.54657, 0, 1, 0.02352941, 1,
-0.4198108, 1.020402, -2.671637, 0, 1, 0.02745098, 1,
-0.4162594, 2.813543, 0.7395443, 0, 1, 0.03529412, 1,
-0.4149017, 0.1524467, 0.005396171, 0, 1, 0.03921569, 1,
-0.4142016, 0.8685699, -1.647812, 0, 1, 0.04705882, 1,
-0.4107271, -1.374066, -2.086838, 0, 1, 0.05098039, 1,
-0.4091347, 0.9196218, 0.7182136, 0, 1, 0.05882353, 1,
-0.4089137, -0.8580418, -0.5189827, 0, 1, 0.0627451, 1,
-0.4074019, -0.6441163, -2.32247, 0, 1, 0.07058824, 1,
-0.4061806, -1.426421, -2.639096, 0, 1, 0.07450981, 1,
-0.3986571, 0.5039265, -0.1756465, 0, 1, 0.08235294, 1,
-0.3971597, 0.4382941, -0.2080443, 0, 1, 0.08627451, 1,
-0.3937555, 0.6460795, 0.2412844, 0, 1, 0.09411765, 1,
-0.3880041, -0.8076379, -2.271475, 0, 1, 0.1019608, 1,
-0.3826291, 0.9794238, -1.225167, 0, 1, 0.1058824, 1,
-0.3777108, -0.5664328, -1.433977, 0, 1, 0.1137255, 1,
-0.3775064, -1.16152, -3.948878, 0, 1, 0.1176471, 1,
-0.3763479, 1.386023, -0.6062702, 0, 1, 0.1254902, 1,
-0.3756768, -0.7818471, -2.092999, 0, 1, 0.1294118, 1,
-0.3719828, 0.5128051, 0.5668171, 0, 1, 0.1372549, 1,
-0.3673069, -1.859844, -3.815272, 0, 1, 0.1411765, 1,
-0.3671039, 0.9031054, 1.577824, 0, 1, 0.1490196, 1,
-0.3640582, -1.35245, -4.232662, 0, 1, 0.1529412, 1,
-0.3634539, 1.072937, 0.4874888, 0, 1, 0.1607843, 1,
-0.3606614, -2.054937, -1.833689, 0, 1, 0.1647059, 1,
-0.3565702, -0.22802, -1.830196, 0, 1, 0.172549, 1,
-0.354231, -0.7361328, -3.938134, 0, 1, 0.1764706, 1,
-0.3532938, -0.4220162, -2.937971, 0, 1, 0.1843137, 1,
-0.3521348, 0.1298178, 1.27873, 0, 1, 0.1882353, 1,
-0.3506467, 0.7161782, -1.017644, 0, 1, 0.1960784, 1,
-0.3452264, 0.07334749, -2.120218, 0, 1, 0.2039216, 1,
-0.3441105, -0.5383282, -4.338391, 0, 1, 0.2078431, 1,
-0.3419287, 0.2475265, -0.3728284, 0, 1, 0.2156863, 1,
-0.3409764, -0.6533213, -3.116278, 0, 1, 0.2196078, 1,
-0.3403945, -0.401656, -2.467238, 0, 1, 0.227451, 1,
-0.3398945, 0.006234564, -1.763707, 0, 1, 0.2313726, 1,
-0.3390336, 1.497485, -2.139824, 0, 1, 0.2392157, 1,
-0.3362909, -0.3600663, -2.506359, 0, 1, 0.2431373, 1,
-0.335467, -1.158438, -1.724956, 0, 1, 0.2509804, 1,
-0.3331616, -0.2080747, -1.45391, 0, 1, 0.254902, 1,
-0.3318433, -1.206591, -3.649431, 0, 1, 0.2627451, 1,
-0.3283601, 0.3774363, -1.642507, 0, 1, 0.2666667, 1,
-0.3241001, 0.7694004, 0.4787121, 0, 1, 0.2745098, 1,
-0.3239567, 0.1122802, -1.444948, 0, 1, 0.2784314, 1,
-0.3237132, 0.9382921, 1.051958, 0, 1, 0.2862745, 1,
-0.3217592, -0.09861588, -1.388935, 0, 1, 0.2901961, 1,
-0.3201847, 0.09659739, 0.4124868, 0, 1, 0.2980392, 1,
-0.3173493, 2.188456, 0.1022448, 0, 1, 0.3058824, 1,
-0.3110609, -0.2125806, -0.9624007, 0, 1, 0.3098039, 1,
-0.3047525, -0.4077405, -2.437582, 0, 1, 0.3176471, 1,
-0.3044305, 1.077322, -1.523104, 0, 1, 0.3215686, 1,
-0.3041901, 0.7953016, -1.229641, 0, 1, 0.3294118, 1,
-0.2926185, -1.266558, -0.6652929, 0, 1, 0.3333333, 1,
-0.2854424, 0.2335795, -1.981385, 0, 1, 0.3411765, 1,
-0.2851141, -0.4085375, -1.984151, 0, 1, 0.345098, 1,
-0.2742714, 0.5481029, 0.05868642, 0, 1, 0.3529412, 1,
-0.2735403, 0.9171908, -0.7965881, 0, 1, 0.3568628, 1,
-0.2623788, 0.5269191, -1.415847, 0, 1, 0.3647059, 1,
-0.2557802, 0.4239193, -1.197693, 0, 1, 0.3686275, 1,
-0.2536434, -0.940187, -4.184525, 0, 1, 0.3764706, 1,
-0.2521411, 0.02040583, -2.464952, 0, 1, 0.3803922, 1,
-0.2505329, -0.7118444, -3.594885, 0, 1, 0.3882353, 1,
-0.2504355, 0.2902567, -1.583894, 0, 1, 0.3921569, 1,
-0.2441617, 0.003482147, -1.355466, 0, 1, 0.4, 1,
-0.2439946, -0.5929952, -4.655144, 0, 1, 0.4078431, 1,
-0.2413169, 0.4539284, 0.5142635, 0, 1, 0.4117647, 1,
-0.240098, -2.130266, -3.666797, 0, 1, 0.4196078, 1,
-0.2398542, 1.250695, 0.7051504, 0, 1, 0.4235294, 1,
-0.2367257, 0.6512658, -1.523845, 0, 1, 0.4313726, 1,
-0.2282643, -1.226721, -4.72492, 0, 1, 0.4352941, 1,
-0.2169397, -2.83549, -3.441814, 0, 1, 0.4431373, 1,
-0.2153511, 0.9965591, 0.1676313, 0, 1, 0.4470588, 1,
-0.2107192, 0.3065844, -0.1980478, 0, 1, 0.454902, 1,
-0.2085429, 0.2533054, 1.066207, 0, 1, 0.4588235, 1,
-0.178699, -0.1807852, -2.54099, 0, 1, 0.4666667, 1,
-0.1750951, 1.003943, 0.7280289, 0, 1, 0.4705882, 1,
-0.1717883, 0.1592142, -0.6274087, 0, 1, 0.4784314, 1,
-0.1652288, -0.4406335, -5.279367, 0, 1, 0.4823529, 1,
-0.1643136, -1.087068, -2.518703, 0, 1, 0.4901961, 1,
-0.1637437, 0.6718298, 0.9295869, 0, 1, 0.4941176, 1,
-0.1633791, -0.4449753, -1.38357, 0, 1, 0.5019608, 1,
-0.1624916, 0.4910949, -0.1285272, 0, 1, 0.509804, 1,
-0.1621761, 1.27512, -2.195916, 0, 1, 0.5137255, 1,
-0.1616317, -0.6010796, -2.342072, 0, 1, 0.5215687, 1,
-0.1541269, -0.7357311, -2.223336, 0, 1, 0.5254902, 1,
-0.144942, -1.563049, -4.364145, 0, 1, 0.5333334, 1,
-0.1411807, -0.3558152, -2.230203, 0, 1, 0.5372549, 1,
-0.137968, 0.7272285, 1.134348, 0, 1, 0.5450981, 1,
-0.1359974, 0.5173775, -0.1684203, 0, 1, 0.5490196, 1,
-0.1346879, 2.053715, -1.417481, 0, 1, 0.5568628, 1,
-0.134604, -1.167495, -3.665044, 0, 1, 0.5607843, 1,
-0.1344352, 0.03732473, -2.417601, 0, 1, 0.5686275, 1,
-0.1300247, 0.558448, -0.2261328, 0, 1, 0.572549, 1,
-0.1230712, -1.253008, -3.431232, 0, 1, 0.5803922, 1,
-0.1137451, 0.9224908, 0.1623811, 0, 1, 0.5843138, 1,
-0.1131411, 0.06992065, -1.138657, 0, 1, 0.5921569, 1,
-0.1128064, -0.2107477, -3.040924, 0, 1, 0.5960785, 1,
-0.112551, -2.001765, -3.33478, 0, 1, 0.6039216, 1,
-0.1021993, -1.086723, -2.485653, 0, 1, 0.6117647, 1,
-0.1003935, 0.5220101, 0.05435892, 0, 1, 0.6156863, 1,
-0.1000733, 0.5658665, -0.9542999, 0, 1, 0.6235294, 1,
-0.098205, 1.417156, -1.281445, 0, 1, 0.627451, 1,
-0.09433457, 0.843936, -1.245863, 0, 1, 0.6352941, 1,
-0.08955531, -1.188154, -5.148526, 0, 1, 0.6392157, 1,
-0.08872847, 0.1270444, -2.213838, 0, 1, 0.6470588, 1,
-0.0885684, -1.310581, -2.266704, 0, 1, 0.6509804, 1,
-0.08214241, -0.8335707, -2.435587, 0, 1, 0.6588235, 1,
-0.08122805, -0.7160724, -2.442192, 0, 1, 0.6627451, 1,
-0.07923628, 0.1995766, -1.357574, 0, 1, 0.6705883, 1,
-0.07907932, -0.2607285, -3.517743, 0, 1, 0.6745098, 1,
-0.07349703, 0.2678631, 1.367421, 0, 1, 0.682353, 1,
-0.07217896, -0.8178028, -2.068567, 0, 1, 0.6862745, 1,
-0.06749992, -1.479953, -4.822506, 0, 1, 0.6941177, 1,
-0.06661116, 0.247273, 1.114383, 0, 1, 0.7019608, 1,
-0.06481145, 1.284774, -0.505646, 0, 1, 0.7058824, 1,
-0.06376605, 0.7498962, 0.2129306, 0, 1, 0.7137255, 1,
-0.06267422, -0.0503231, -2.983699, 0, 1, 0.7176471, 1,
-0.06130137, 0.9760615, -1.492506, 0, 1, 0.7254902, 1,
-0.060917, -0.4342046, -3.087168, 0, 1, 0.7294118, 1,
-0.06087435, 0.767299, -0.9164413, 0, 1, 0.7372549, 1,
-0.05736622, -0.2178013, -2.728563, 0, 1, 0.7411765, 1,
-0.05582538, 0.3220654, 1.71248, 0, 1, 0.7490196, 1,
-0.05537301, -0.04003072, -0.7708732, 0, 1, 0.7529412, 1,
-0.05271614, -0.7367454, -3.269075, 0, 1, 0.7607843, 1,
-0.04586388, 0.1611104, -0.5559003, 0, 1, 0.7647059, 1,
-0.04228375, 0.4212256, -0.6468115, 0, 1, 0.772549, 1,
-0.04110126, 0.809793, 1.373058, 0, 1, 0.7764706, 1,
-0.03712395, 1.341558, 2.058459, 0, 1, 0.7843137, 1,
-0.02973647, 1.364254, -0.5973749, 0, 1, 0.7882353, 1,
-0.02560314, -0.09714946, -2.716617, 0, 1, 0.7960784, 1,
-0.02355278, 0.1977256, 0.14181, 0, 1, 0.8039216, 1,
-0.02243672, 0.721621, -0.307865, 0, 1, 0.8078431, 1,
-0.02191736, -0.4553415, -3.076164, 0, 1, 0.8156863, 1,
-0.02157499, -0.05365524, -1.151004, 0, 1, 0.8196079, 1,
-0.02090134, 1.210982, 0.335977, 0, 1, 0.827451, 1,
-0.01407406, -0.7037207, -3.749269, 0, 1, 0.8313726, 1,
-0.01230952, 0.735822, 0.4177778, 0, 1, 0.8392157, 1,
-0.01064973, 0.4630657, 0.03922319, 0, 1, 0.8431373, 1,
-0.006761032, -1.216753, -3.862363, 0, 1, 0.8509804, 1,
-0.006411708, -0.1004585, -4.839883, 0, 1, 0.854902, 1,
-0.003379414, -2.608618, -3.065427, 0, 1, 0.8627451, 1,
-0.00105155, -0.4290648, -2.548894, 0, 1, 0.8666667, 1,
0.003355315, 0.2677769, -0.2321722, 0, 1, 0.8745098, 1,
0.005452835, 1.064894, 0.09367666, 0, 1, 0.8784314, 1,
0.006899277, -0.9734498, 2.618302, 0, 1, 0.8862745, 1,
0.007396575, -2.012453, 2.354317, 0, 1, 0.8901961, 1,
0.008814747, 1.785291, -0.7617056, 0, 1, 0.8980392, 1,
0.009021305, -0.470679, 4.023545, 0, 1, 0.9058824, 1,
0.01206998, -0.6779379, 2.847093, 0, 1, 0.9098039, 1,
0.01445002, -1.214979, 4.634921, 0, 1, 0.9176471, 1,
0.01574275, 1.055279, -1.725868, 0, 1, 0.9215686, 1,
0.01973153, -0.9589241, 3.145894, 0, 1, 0.9294118, 1,
0.02120408, 0.8662956, -1.236567, 0, 1, 0.9333333, 1,
0.02511719, 0.4194477, -1.330549, 0, 1, 0.9411765, 1,
0.030288, 0.8351272, 0.0300914, 0, 1, 0.945098, 1,
0.03191138, -0.5034624, 2.342942, 0, 1, 0.9529412, 1,
0.03215127, -1.055907, 4.356415, 0, 1, 0.9568627, 1,
0.03313362, 0.4905524, -1.146933, 0, 1, 0.9647059, 1,
0.03425343, -0.04598007, 2.730531, 0, 1, 0.9686275, 1,
0.03443491, -0.9133366, 4.524876, 0, 1, 0.9764706, 1,
0.03478666, 0.9498072, 0.1051115, 0, 1, 0.9803922, 1,
0.0354816, -2.001461, 4.77734, 0, 1, 0.9882353, 1,
0.03562957, -1.124709, 2.833878, 0, 1, 0.9921569, 1,
0.03701631, -0.7431782, 3.526848, 0, 1, 1, 1,
0.03968791, 2.301714, 0.8757296, 0, 0.9921569, 1, 1,
0.04030063, -0.1238689, 3.42976, 0, 0.9882353, 1, 1,
0.04167278, -0.4281792, 1.949157, 0, 0.9803922, 1, 1,
0.04393007, -1.935154, 3.13633, 0, 0.9764706, 1, 1,
0.04559112, 1.753352, 0.4461294, 0, 0.9686275, 1, 1,
0.04703708, -2.380493, 2.893703, 0, 0.9647059, 1, 1,
0.04913658, 1.000309, 0.6822668, 0, 0.9568627, 1, 1,
0.04960162, -0.3051058, 4.011961, 0, 0.9529412, 1, 1,
0.05013779, -0.01480291, 0.7981719, 0, 0.945098, 1, 1,
0.05308766, 0.01092525, 2.206119, 0, 0.9411765, 1, 1,
0.05401307, -0.4929743, 3.657058, 0, 0.9333333, 1, 1,
0.05836478, 0.2924417, -0.8119051, 0, 0.9294118, 1, 1,
0.06173486, 1.536628, 0.8320069, 0, 0.9215686, 1, 1,
0.06235112, -1.374823, 3.570836, 0, 0.9176471, 1, 1,
0.06236141, -0.8179953, 2.561746, 0, 0.9098039, 1, 1,
0.06330812, -0.9360856, 2.843269, 0, 0.9058824, 1, 1,
0.06349197, -0.07356062, 2.542344, 0, 0.8980392, 1, 1,
0.0651893, -0.9395023, 2.655927, 0, 0.8901961, 1, 1,
0.06854188, 0.8202536, 1.976388, 0, 0.8862745, 1, 1,
0.06867891, 1.158402, 1.248632, 0, 0.8784314, 1, 1,
0.07078618, -2.3541, 4.461287, 0, 0.8745098, 1, 1,
0.07358775, -0.7287343, 3.9237, 0, 0.8666667, 1, 1,
0.0760877, 0.8267844, 1.122432, 0, 0.8627451, 1, 1,
0.0826188, 0.847113, 0.5593392, 0, 0.854902, 1, 1,
0.08389097, -0.2066268, 2.016011, 0, 0.8509804, 1, 1,
0.08715991, 0.3749896, 0.2728577, 0, 0.8431373, 1, 1,
0.08855184, -2.105747, 3.441925, 0, 0.8392157, 1, 1,
0.09212472, -1.312741, 3.279908, 0, 0.8313726, 1, 1,
0.09388312, 1.128824, 1.087589, 0, 0.827451, 1, 1,
0.1005421, 1.208039, -0.02260818, 0, 0.8196079, 1, 1,
0.1024162, 1.009138, -0.9309063, 0, 0.8156863, 1, 1,
0.1042502, -1.043892, 3.316644, 0, 0.8078431, 1, 1,
0.104706, 2.644811, -0.428095, 0, 0.8039216, 1, 1,
0.1061833, 1.104874, -0.6354936, 0, 0.7960784, 1, 1,
0.1117946, -2.050556, 1.993021, 0, 0.7882353, 1, 1,
0.1170076, 0.2502011, 1.378217, 0, 0.7843137, 1, 1,
0.1198235, -0.8347176, 3.280863, 0, 0.7764706, 1, 1,
0.1214232, 0.6243994, -1.958172, 0, 0.772549, 1, 1,
0.1218506, 1.176464, 0.3484256, 0, 0.7647059, 1, 1,
0.1232796, 0.5000637, 0.9795544, 0, 0.7607843, 1, 1,
0.1259585, -0.4198484, 3.489515, 0, 0.7529412, 1, 1,
0.128425, -1.029665, 1.701941, 0, 0.7490196, 1, 1,
0.1305581, -1.291564, 3.314803, 0, 0.7411765, 1, 1,
0.133742, -0.03213474, 1.270389, 0, 0.7372549, 1, 1,
0.13759, -0.3531668, 2.950046, 0, 0.7294118, 1, 1,
0.1399379, 0.7168076, -0.202677, 0, 0.7254902, 1, 1,
0.1473406, 1.068673, -0.2127662, 0, 0.7176471, 1, 1,
0.1473972, -1.006954, 2.618044, 0, 0.7137255, 1, 1,
0.1506246, 1.018065, -0.1989305, 0, 0.7058824, 1, 1,
0.1511475, -0.215036, 1.321908, 0, 0.6980392, 1, 1,
0.1536135, 0.07427849, -0.2181736, 0, 0.6941177, 1, 1,
0.1568601, 0.1911304, 0.7253318, 0, 0.6862745, 1, 1,
0.1595094, 0.6088206, -1.184761, 0, 0.682353, 1, 1,
0.1626693, 0.4312713, 0.009884915, 0, 0.6745098, 1, 1,
0.1639208, -1.629784, 3.677562, 0, 0.6705883, 1, 1,
0.164693, -0.413218, 1.137718, 0, 0.6627451, 1, 1,
0.1648023, -0.3257387, 1.547911, 0, 0.6588235, 1, 1,
0.16634, 0.9348361, 1.131855, 0, 0.6509804, 1, 1,
0.1673358, -0.8638256, 1.26484, 0, 0.6470588, 1, 1,
0.1673671, -0.3289626, 3.325412, 0, 0.6392157, 1, 1,
0.168688, 0.6530635, -1.209103, 0, 0.6352941, 1, 1,
0.1715602, -0.8952018, 4.258578, 0, 0.627451, 1, 1,
0.1733021, 0.3886328, -0.1771439, 0, 0.6235294, 1, 1,
0.1767379, 0.1494153, 1.773532, 0, 0.6156863, 1, 1,
0.1823257, -0.6582534, 4.524898, 0, 0.6117647, 1, 1,
0.1903557, -0.7506288, 3.167185, 0, 0.6039216, 1, 1,
0.1922555, 0.1387644, 0.8658742, 0, 0.5960785, 1, 1,
0.1923318, 1.068952, -2.183307, 0, 0.5921569, 1, 1,
0.1939447, 1.106524, -0.4264366, 0, 0.5843138, 1, 1,
0.195347, 0.02956387, 2.549027, 0, 0.5803922, 1, 1,
0.1974945, -2.029104, 3.18254, 0, 0.572549, 1, 1,
0.1998968, 1.05367, 0.2186641, 0, 0.5686275, 1, 1,
0.2022547, 0.1481753, 0.9891263, 0, 0.5607843, 1, 1,
0.2073724, -1.551259, 2.336833, 0, 0.5568628, 1, 1,
0.2083989, 0.9902561, 2.130504, 0, 0.5490196, 1, 1,
0.2086923, -0.05601361, 2.63184, 0, 0.5450981, 1, 1,
0.2127157, -0.1749786, 2.866102, 0, 0.5372549, 1, 1,
0.2159009, -1.023303, 2.047482, 0, 0.5333334, 1, 1,
0.2202518, 0.1606287, 1.592119, 0, 0.5254902, 1, 1,
0.225252, 0.2946447, 1.160647, 0, 0.5215687, 1, 1,
0.2262726, -0.7843642, 1.935219, 0, 0.5137255, 1, 1,
0.2328411, -1.467298, 4.443738, 0, 0.509804, 1, 1,
0.2331033, 1.857953, -0.2798963, 0, 0.5019608, 1, 1,
0.2355594, 0.2148992, 1.351587, 0, 0.4941176, 1, 1,
0.2374127, -0.999707, 3.192649, 0, 0.4901961, 1, 1,
0.2394218, -0.6706198, 1.625293, 0, 0.4823529, 1, 1,
0.2408243, -0.3799487, 2.177044, 0, 0.4784314, 1, 1,
0.2457067, -1.658897, 0.8950502, 0, 0.4705882, 1, 1,
0.2482869, 0.1879119, 0.3729911, 0, 0.4666667, 1, 1,
0.2495138, -0.07823078, 0.1516792, 0, 0.4588235, 1, 1,
0.2501478, -2.635003, 4.105128, 0, 0.454902, 1, 1,
0.2608915, -2.348034, 1.844242, 0, 0.4470588, 1, 1,
0.2615986, 0.8498785, 0.2452476, 0, 0.4431373, 1, 1,
0.2647659, 0.6957921, 0.7765049, 0, 0.4352941, 1, 1,
0.2657782, -0.4011967, 3.498225, 0, 0.4313726, 1, 1,
0.2657843, -0.8254824, 4.235926, 0, 0.4235294, 1, 1,
0.2753885, -0.4889329, 1.642808, 0, 0.4196078, 1, 1,
0.2757677, 1.268752, 2.389546, 0, 0.4117647, 1, 1,
0.2759421, -0.3043472, 2.230689, 0, 0.4078431, 1, 1,
0.2808814, 0.3073092, 0.7360697, 0, 0.4, 1, 1,
0.282373, 0.2663064, -0.1758558, 0, 0.3921569, 1, 1,
0.2834934, 0.29109, -0.4147336, 0, 0.3882353, 1, 1,
0.2879808, 0.3570344, 0.03341173, 0, 0.3803922, 1, 1,
0.288461, 0.6836897, 1.648662, 0, 0.3764706, 1, 1,
0.2890725, 1.173076, 0.3926123, 0, 0.3686275, 1, 1,
0.2893489, 0.1205172, 1.179289, 0, 0.3647059, 1, 1,
0.2899682, -0.3228458, 2.132035, 0, 0.3568628, 1, 1,
0.2925611, 0.416498, 1.118814, 0, 0.3529412, 1, 1,
0.2991477, 1.048482, 0.5960366, 0, 0.345098, 1, 1,
0.304349, 0.7144216, 0.04186372, 0, 0.3411765, 1, 1,
0.3054259, -1.439174, 2.727345, 0, 0.3333333, 1, 1,
0.3099608, 0.5935886, 0.4857288, 0, 0.3294118, 1, 1,
0.3106822, -2.525735, 3.72163, 0, 0.3215686, 1, 1,
0.3174434, 0.5534131, 0.1462013, 0, 0.3176471, 1, 1,
0.321922, -0.2644844, 2.202602, 0, 0.3098039, 1, 1,
0.3258285, 0.0134277, 0.5749751, 0, 0.3058824, 1, 1,
0.3318884, -2.890594, 3.851574, 0, 0.2980392, 1, 1,
0.336691, 2.681743, -0.1376648, 0, 0.2901961, 1, 1,
0.339645, -0.546231, 2.780809, 0, 0.2862745, 1, 1,
0.3398234, -0.9740562, 3.613457, 0, 0.2784314, 1, 1,
0.3423121, 0.7446972, 0.7053261, 0, 0.2745098, 1, 1,
0.3455732, -0.4270864, 1.163459, 0, 0.2666667, 1, 1,
0.3488572, -0.5191777, 3.38284, 0, 0.2627451, 1, 1,
0.3488936, 0.2049107, 2.370896, 0, 0.254902, 1, 1,
0.3506787, 1.452867, 0.7275668, 0, 0.2509804, 1, 1,
0.3516907, -1.545592, 1.565327, 0, 0.2431373, 1, 1,
0.3527996, 0.4909736, -0.2501255, 0, 0.2392157, 1, 1,
0.3538318, -0.8017099, 2.910122, 0, 0.2313726, 1, 1,
0.3544177, 1.010316, -1.348443, 0, 0.227451, 1, 1,
0.3580379, 0.1452507, 2.820849, 0, 0.2196078, 1, 1,
0.3606035, 0.5682879, 0.1484773, 0, 0.2156863, 1, 1,
0.3649179, 0.01345885, 1.115072, 0, 0.2078431, 1, 1,
0.3660703, -1.678997, 4.922077, 0, 0.2039216, 1, 1,
0.3665017, -1.55602, 2.147538, 0, 0.1960784, 1, 1,
0.369592, -2.223548, 1.438336, 0, 0.1882353, 1, 1,
0.3702582, 1.126986, -1.583402, 0, 0.1843137, 1, 1,
0.3753149, -1.077768, 2.634212, 0, 0.1764706, 1, 1,
0.3768093, 0.5173704, 0.03354342, 0, 0.172549, 1, 1,
0.3794263, 0.120352, 0.9693606, 0, 0.1647059, 1, 1,
0.3800424, -0.5401885, 2.796411, 0, 0.1607843, 1, 1,
0.3941413, 1.128835, -0.1248952, 0, 0.1529412, 1, 1,
0.3941761, 0.6091352, -2.096052, 0, 0.1490196, 1, 1,
0.3954623, -0.7681441, 2.270396, 0, 0.1411765, 1, 1,
0.3954669, -1.461685, 4.668311, 0, 0.1372549, 1, 1,
0.4002852, -0.4832707, 2.5162, 0, 0.1294118, 1, 1,
0.406137, 0.6501877, 0.725534, 0, 0.1254902, 1, 1,
0.4138431, -1.352503, 2.391105, 0, 0.1176471, 1, 1,
0.4211017, 0.158179, 1.785862, 0, 0.1137255, 1, 1,
0.4227826, -0.861254, 2.846859, 0, 0.1058824, 1, 1,
0.4250668, -0.02421243, 1.27481, 0, 0.09803922, 1, 1,
0.4284026, -0.9515878, 4.177074, 0, 0.09411765, 1, 1,
0.429139, 0.8947256, 1.255821, 0, 0.08627451, 1, 1,
0.4296972, -1.035808, 3.788913, 0, 0.08235294, 1, 1,
0.4317301, 0.3535143, -1.240211, 0, 0.07450981, 1, 1,
0.4402204, -0.5178408, 3.429858, 0, 0.07058824, 1, 1,
0.4420798, 1.71021, 0.4031608, 0, 0.0627451, 1, 1,
0.4438253, -0.5559562, 0.7858426, 0, 0.05882353, 1, 1,
0.4438847, -0.6496426, 0.637042, 0, 0.05098039, 1, 1,
0.4464861, -0.4047118, 2.245162, 0, 0.04705882, 1, 1,
0.4485588, 2.277412, 1.699257, 0, 0.03921569, 1, 1,
0.4510684, 0.8354593, 0.8947811, 0, 0.03529412, 1, 1,
0.4530039, 0.9880198, -0.7916615, 0, 0.02745098, 1, 1,
0.4547647, -1.141795, 3.033437, 0, 0.02352941, 1, 1,
0.4556094, -0.8898136, 4.27581, 0, 0.01568628, 1, 1,
0.4601943, -1.038888, 4.168409, 0, 0.01176471, 1, 1,
0.4602492, 1.162721, 1.023578, 0, 0.003921569, 1, 1,
0.4610971, -0.4355877, 2.352265, 0.003921569, 0, 1, 1,
0.4632857, -0.2702495, 2.176281, 0.007843138, 0, 1, 1,
0.4646573, 0.1268306, 1.562233, 0.01568628, 0, 1, 1,
0.464736, -0.1126634, 0.5197096, 0.01960784, 0, 1, 1,
0.4652042, 0.9161999, -0.6696308, 0.02745098, 0, 1, 1,
0.4691085, -1.581159, 3.222575, 0.03137255, 0, 1, 1,
0.4708082, -1.089053, 1.931626, 0.03921569, 0, 1, 1,
0.4709467, 0.892161, -0.4104009, 0.04313726, 0, 1, 1,
0.4714974, -0.720663, 0.489788, 0.05098039, 0, 1, 1,
0.4732032, 0.692147, 0.6595007, 0.05490196, 0, 1, 1,
0.4796161, 2.415212, 1.224212, 0.0627451, 0, 1, 1,
0.4855739, 0.7491777, 0.3308893, 0.06666667, 0, 1, 1,
0.4918316, 0.5099914, 1.419643, 0.07450981, 0, 1, 1,
0.4922782, 0.1791913, 0.8457041, 0.07843138, 0, 1, 1,
0.4927544, -0.7428113, 0.9534187, 0.08627451, 0, 1, 1,
0.4932908, 0.6603497, 0.1102105, 0.09019608, 0, 1, 1,
0.4963573, -0.6517602, 2.153644, 0.09803922, 0, 1, 1,
0.4963969, -1.257689, 3.437768, 0.1058824, 0, 1, 1,
0.4971806, -0.2897421, 0.9845632, 0.1098039, 0, 1, 1,
0.4987327, 0.5605224, -0.1356938, 0.1176471, 0, 1, 1,
0.5001544, 0.6817729, -0.1160614, 0.1215686, 0, 1, 1,
0.5005682, -1.396786, 1.121168, 0.1294118, 0, 1, 1,
0.5011726, 0.6604711, -0.5017144, 0.1333333, 0, 1, 1,
0.5100049, 0.3148626, 1.615455, 0.1411765, 0, 1, 1,
0.5123755, 0.3331068, 0.3759871, 0.145098, 0, 1, 1,
0.5200943, 0.06954268, 0.8455737, 0.1529412, 0, 1, 1,
0.5203491, -0.8996645, 2.532881, 0.1568628, 0, 1, 1,
0.5217362, -0.9777886, 3.092701, 0.1647059, 0, 1, 1,
0.5253102, -0.1893805, 2.201123, 0.1686275, 0, 1, 1,
0.5299271, 0.4550017, 0.629733, 0.1764706, 0, 1, 1,
0.5336428, -0.7762744, 2.808067, 0.1803922, 0, 1, 1,
0.5357264, 0.5102554, -0.8174444, 0.1882353, 0, 1, 1,
0.5417296, -1.30967, 3.108573, 0.1921569, 0, 1, 1,
0.5537715, -0.9527799, 2.605922, 0.2, 0, 1, 1,
0.554144, -0.3668573, 1.015353, 0.2078431, 0, 1, 1,
0.5542506, 1.169825, 2.046081, 0.2117647, 0, 1, 1,
0.5632455, -1.079985, 3.113415, 0.2196078, 0, 1, 1,
0.5658892, 1.151235, 0.4635631, 0.2235294, 0, 1, 1,
0.5675076, 1.312161, -0.1139766, 0.2313726, 0, 1, 1,
0.5676195, 0.1860044, 1.546239, 0.2352941, 0, 1, 1,
0.5679522, 0.9172779, 2.070039, 0.2431373, 0, 1, 1,
0.5699967, 1.900267, -0.8284315, 0.2470588, 0, 1, 1,
0.571368, -1.595823, 2.737296, 0.254902, 0, 1, 1,
0.5735645, 1.922565, 0.398977, 0.2588235, 0, 1, 1,
0.5757136, -1.709158, 2.666469, 0.2666667, 0, 1, 1,
0.5794466, 0.604996, 2.716911, 0.2705882, 0, 1, 1,
0.5802217, -0.1320453, 1.436421, 0.2784314, 0, 1, 1,
0.5837542, -1.230075, 4.326635, 0.282353, 0, 1, 1,
0.5865992, 0.6124936, 1.470414, 0.2901961, 0, 1, 1,
0.5867053, -0.0550383, 2.357862, 0.2941177, 0, 1, 1,
0.5870946, -0.3376217, 0.5908172, 0.3019608, 0, 1, 1,
0.5872922, 0.005951346, 1.438731, 0.3098039, 0, 1, 1,
0.5947555, 1.516614, 0.1326403, 0.3137255, 0, 1, 1,
0.5958166, 0.6427338, 0.2148369, 0.3215686, 0, 1, 1,
0.59725, 0.795955, -1.726931, 0.3254902, 0, 1, 1,
0.6013901, 0.6515097, 1.341036, 0.3333333, 0, 1, 1,
0.6032835, -1.724256, 3.224049, 0.3372549, 0, 1, 1,
0.6037289, -0.9184893, 4.267464, 0.345098, 0, 1, 1,
0.6144375, 0.306102, 1.256683, 0.3490196, 0, 1, 1,
0.6151309, -0.695516, 2.909431, 0.3568628, 0, 1, 1,
0.6152092, 0.09805424, -0.3172597, 0.3607843, 0, 1, 1,
0.6170793, 1.458482, -0.983503, 0.3686275, 0, 1, 1,
0.6215798, -0.8376328, 4.018325, 0.372549, 0, 1, 1,
0.6243418, -1.091815, 2.022747, 0.3803922, 0, 1, 1,
0.6293394, -0.6528725, 2.666464, 0.3843137, 0, 1, 1,
0.6343409, 0.24339, 3.125372, 0.3921569, 0, 1, 1,
0.636158, 0.8795782, 1.869306, 0.3960784, 0, 1, 1,
0.6413733, 0.9053952, 1.508909, 0.4039216, 0, 1, 1,
0.6436559, 0.3667507, 1.006434, 0.4117647, 0, 1, 1,
0.6441604, 0.8320569, 0.05439513, 0.4156863, 0, 1, 1,
0.6556181, -1.406049, 2.783965, 0.4235294, 0, 1, 1,
0.6627619, 0.9517795, -0.447123, 0.427451, 0, 1, 1,
0.6631035, 1.34724, -0.4905401, 0.4352941, 0, 1, 1,
0.6639723, 0.3783165, 2.987818, 0.4392157, 0, 1, 1,
0.6650639, -0.2644189, 1.460781, 0.4470588, 0, 1, 1,
0.6675627, 0.4477759, -1.601656, 0.4509804, 0, 1, 1,
0.6682023, 0.2488185, 2.381832, 0.4588235, 0, 1, 1,
0.6696843, 1.707302, -0.601954, 0.4627451, 0, 1, 1,
0.6743609, 0.8171093, -0.4029049, 0.4705882, 0, 1, 1,
0.6764473, -0.8556297, 4.716292, 0.4745098, 0, 1, 1,
0.6826951, 0.8663617, 0.9432878, 0.4823529, 0, 1, 1,
0.6859688, 0.3618388, 1.191192, 0.4862745, 0, 1, 1,
0.6872659, 1.804035, 1.161591, 0.4941176, 0, 1, 1,
0.688632, -0.00490672, 1.949287, 0.5019608, 0, 1, 1,
0.689395, -0.7717128, 0.7022217, 0.5058824, 0, 1, 1,
0.6975157, 0.06243428, 1.450028, 0.5137255, 0, 1, 1,
0.697912, -0.005880081, -0.1415218, 0.5176471, 0, 1, 1,
0.7012339, -0.09308997, 1.739551, 0.5254902, 0, 1, 1,
0.7014239, 0.05041332, 1.10482, 0.5294118, 0, 1, 1,
0.7098197, -0.6369345, 2.713899, 0.5372549, 0, 1, 1,
0.7107159, -0.1184036, 1.618508, 0.5411765, 0, 1, 1,
0.7110268, 1.070826, 0.9224131, 0.5490196, 0, 1, 1,
0.7127314, 0.02758384, 1.232913, 0.5529412, 0, 1, 1,
0.7158509, -0.4360068, 3.648574, 0.5607843, 0, 1, 1,
0.718505, 0.916709, 0.828498, 0.5647059, 0, 1, 1,
0.7240268, 0.007160508, 2.649637, 0.572549, 0, 1, 1,
0.724086, 0.5217771, 0.7884669, 0.5764706, 0, 1, 1,
0.7257275, -1.295135, 2.810462, 0.5843138, 0, 1, 1,
0.7263831, -1.461037, 2.494764, 0.5882353, 0, 1, 1,
0.7306108, -0.6393973, 2.178904, 0.5960785, 0, 1, 1,
0.7323375, -0.305217, 2.991439, 0.6039216, 0, 1, 1,
0.7335895, 0.6284677, 1.582173, 0.6078432, 0, 1, 1,
0.7343075, -0.9464625, 2.299141, 0.6156863, 0, 1, 1,
0.7365999, 0.3949134, 1.80417, 0.6196079, 0, 1, 1,
0.7410193, 0.08391819, 0.781064, 0.627451, 0, 1, 1,
0.7413918, 1.819461, -0.09797581, 0.6313726, 0, 1, 1,
0.7419205, 1.613691, 1.974191, 0.6392157, 0, 1, 1,
0.7427046, -0.6093577, 3.326599, 0.6431373, 0, 1, 1,
0.7430527, -0.342451, 0.08100399, 0.6509804, 0, 1, 1,
0.7448612, -0.8179623, 3.829197, 0.654902, 0, 1, 1,
0.7539046, 0.303603, 1.904683, 0.6627451, 0, 1, 1,
0.7679118, -0.9946476, 4.655635, 0.6666667, 0, 1, 1,
0.767961, 0.3120064, -0.2511336, 0.6745098, 0, 1, 1,
0.7691163, -0.7427504, 1.530155, 0.6784314, 0, 1, 1,
0.7692304, 0.5814406, 3.692212, 0.6862745, 0, 1, 1,
0.7713007, -1.04022, 3.422426, 0.6901961, 0, 1, 1,
0.7713076, 0.6493678, 2.170133, 0.6980392, 0, 1, 1,
0.7867005, 0.3661678, 0.07726429, 0.7058824, 0, 1, 1,
0.7886069, 0.08531915, -0.7922972, 0.7098039, 0, 1, 1,
0.7907216, -0.3633249, 1.755582, 0.7176471, 0, 1, 1,
0.7922112, -0.9343894, 2.121808, 0.7215686, 0, 1, 1,
0.7946812, 1.883533, -0.005769137, 0.7294118, 0, 1, 1,
0.7985706, 0.6812429, 0.6986951, 0.7333333, 0, 1, 1,
0.798641, -0.8001016, 1.191751, 0.7411765, 0, 1, 1,
0.809525, 0.01688773, 1.941009, 0.7450981, 0, 1, 1,
0.8141785, 1.099176, 0.6317521, 0.7529412, 0, 1, 1,
0.8238667, -0.7206015, 1.217437, 0.7568628, 0, 1, 1,
0.8282987, -0.02511307, 3.343199, 0.7647059, 0, 1, 1,
0.8387305, 0.4974632, 0.3217989, 0.7686275, 0, 1, 1,
0.8417551, -0.2828632, 3.182527, 0.7764706, 0, 1, 1,
0.8430783, 0.3179768, 2.7112, 0.7803922, 0, 1, 1,
0.8447489, 0.6354722, 1.681722, 0.7882353, 0, 1, 1,
0.8466032, 1.362073, -0.0002243629, 0.7921569, 0, 1, 1,
0.8521596, 0.8576023, 1.570641, 0.8, 0, 1, 1,
0.8599671, 0.444663, 1.870283, 0.8078431, 0, 1, 1,
0.8647088, 0.2549285, 1.444216, 0.8117647, 0, 1, 1,
0.8671975, -1.406644, 2.796263, 0.8196079, 0, 1, 1,
0.871079, -1.670443, 2.616988, 0.8235294, 0, 1, 1,
0.8715456, -0.3795161, 1.842419, 0.8313726, 0, 1, 1,
0.8723533, 0.1520108, 2.524671, 0.8352941, 0, 1, 1,
0.8753366, -0.2578863, 1.155199, 0.8431373, 0, 1, 1,
0.880504, 0.286645, 1.88374, 0.8470588, 0, 1, 1,
0.8806205, -0.7849769, 0.9856575, 0.854902, 0, 1, 1,
0.8842856, 0.5433558, 1.554581, 0.8588235, 0, 1, 1,
0.885152, 0.615099, 1.276523, 0.8666667, 0, 1, 1,
0.8853528, 1.600343, -1.058447, 0.8705882, 0, 1, 1,
0.8907833, -1.929342, 3.459732, 0.8784314, 0, 1, 1,
0.8919705, 0.361098, 1.866164, 0.8823529, 0, 1, 1,
0.8921577, -1.923984, 3.30024, 0.8901961, 0, 1, 1,
0.8938519, 0.02722745, 1.82196, 0.8941177, 0, 1, 1,
0.8962225, 0.4867932, 0.6673708, 0.9019608, 0, 1, 1,
0.8969953, 0.8588811, 1.538389, 0.9098039, 0, 1, 1,
0.8972368, -1.405624, 0.7239012, 0.9137255, 0, 1, 1,
0.9002649, 0.480814, 3.557771, 0.9215686, 0, 1, 1,
0.9046103, -0.374744, 3.938336, 0.9254902, 0, 1, 1,
0.9087654, 1.966458, 0.7818962, 0.9333333, 0, 1, 1,
0.9115793, 0.8156331, 1.44015, 0.9372549, 0, 1, 1,
0.9151867, 0.5902901, 2.427088, 0.945098, 0, 1, 1,
0.915278, 1.133746, 0.3828038, 0.9490196, 0, 1, 1,
0.9156325, -1.397674, 1.170244, 0.9568627, 0, 1, 1,
0.9197499, 1.023006, 1.664616, 0.9607843, 0, 1, 1,
0.9223917, 1.774849, 1.071364, 0.9686275, 0, 1, 1,
0.9325566, 1.983106, -0.1697404, 0.972549, 0, 1, 1,
0.9370669, -0.8202305, 3.551752, 0.9803922, 0, 1, 1,
0.9387693, 1.546351, 0.07445151, 0.9843137, 0, 1, 1,
0.9409095, -0.2519431, 2.873986, 0.9921569, 0, 1, 1,
0.9425487, 1.149685, -0.8310062, 0.9960784, 0, 1, 1,
0.9430371, -0.4082107, 2.402201, 1, 0, 0.9960784, 1,
0.9450612, -0.7628211, 3.167695, 1, 0, 0.9882353, 1,
0.9515797, -1.418209, 2.020834, 1, 0, 0.9843137, 1,
0.9523948, 0.9948465, 0.3873104, 1, 0, 0.9764706, 1,
0.9526227, -0.1101269, 0.262859, 1, 0, 0.972549, 1,
0.9699582, -0.4614304, 2.007134, 1, 0, 0.9647059, 1,
0.9799567, 0.03305332, 0.8287814, 1, 0, 0.9607843, 1,
0.9806267, -1.209803, 1.723208, 1, 0, 0.9529412, 1,
0.9925862, 0.5299011, 1.539922, 1, 0, 0.9490196, 1,
0.9980738, 0.06688377, 2.825108, 1, 0, 0.9411765, 1,
0.9982198, 0.6396922, 1.049098, 1, 0, 0.9372549, 1,
1.000667, -1.166875, 1.710832, 1, 0, 0.9294118, 1,
1.003219, 1.568611, -0.4354181, 1, 0, 0.9254902, 1,
1.006034, 0.8991179, 0.7543849, 1, 0, 0.9176471, 1,
1.006503, 0.4334782, 0.5796099, 1, 0, 0.9137255, 1,
1.007882, 2.172598, 0.7036321, 1, 0, 0.9058824, 1,
1.009318, -1.486947, 0.4283154, 1, 0, 0.9019608, 1,
1.0107, -1.949424, 0.7649748, 1, 0, 0.8941177, 1,
1.013641, 2.003206, 1.255214, 1, 0, 0.8862745, 1,
1.015344, 0.203189, 1.560686, 1, 0, 0.8823529, 1,
1.016939, 0.8232003, 0.6940598, 1, 0, 0.8745098, 1,
1.018888, -0.4049262, 2.309365, 1, 0, 0.8705882, 1,
1.025433, 0.05753457, 2.622667, 1, 0, 0.8627451, 1,
1.027422, -0.0742716, 1.834162, 1, 0, 0.8588235, 1,
1.029434, -0.03106521, 1.211, 1, 0, 0.8509804, 1,
1.031233, -1.182725, 2.517803, 1, 0, 0.8470588, 1,
1.031538, 0.4071051, 0.1955166, 1, 0, 0.8392157, 1,
1.032819, 1.764193, 0.1968659, 1, 0, 0.8352941, 1,
1.038655, 0.09335642, -0.5319821, 1, 0, 0.827451, 1,
1.038822, 0.6422858, 2.165218, 1, 0, 0.8235294, 1,
1.041237, 1.559473, 1.646536, 1, 0, 0.8156863, 1,
1.0437, -0.7788221, 2.703788, 1, 0, 0.8117647, 1,
1.050976, -0.3262518, 1.875392, 1, 0, 0.8039216, 1,
1.059213, 1.178173, 2.380753, 1, 0, 0.7960784, 1,
1.060353, 0.06829996, 1.022999, 1, 0, 0.7921569, 1,
1.076179, -0.1010355, 1.47172, 1, 0, 0.7843137, 1,
1.088859, -1.505485, 2.713326, 1, 0, 0.7803922, 1,
1.089597, 2.585173, 1.834302, 1, 0, 0.772549, 1,
1.091867, -1.071344, 3.861797, 1, 0, 0.7686275, 1,
1.09262, -0.009182424, 1.428147, 1, 0, 0.7607843, 1,
1.095548, 1.625829, 0.169327, 1, 0, 0.7568628, 1,
1.106624, 0.3930081, 0.6634516, 1, 0, 0.7490196, 1,
1.108462, 0.8301019, -1.022707, 1, 0, 0.7450981, 1,
1.121178, -1.315727, 1.903354, 1, 0, 0.7372549, 1,
1.125084, 1.400021, 0.9202974, 1, 0, 0.7333333, 1,
1.129061, 1.074719, 0.4863347, 1, 0, 0.7254902, 1,
1.133481, -0.7608625, 2.145802, 1, 0, 0.7215686, 1,
1.133735, -2.751926, 1.957351, 1, 0, 0.7137255, 1,
1.140149, 1.923112, 1.676226, 1, 0, 0.7098039, 1,
1.147414, -0.6983119, 1.389734, 1, 0, 0.7019608, 1,
1.151891, -0.6230555, 2.468584, 1, 0, 0.6941177, 1,
1.152072, -1.591382, 3.179702, 1, 0, 0.6901961, 1,
1.160292, -0.5848478, 4.012506, 1, 0, 0.682353, 1,
1.16122, 0.4313152, 1.379873, 1, 0, 0.6784314, 1,
1.162015, 1.328334, 2.541838, 1, 0, 0.6705883, 1,
1.162738, 0.5485623, 0.6652904, 1, 0, 0.6666667, 1,
1.164957, -1.000876, 4.197477, 1, 0, 0.6588235, 1,
1.176202, -1.660676, 1.272407, 1, 0, 0.654902, 1,
1.179821, -0.4795643, 1.722342, 1, 0, 0.6470588, 1,
1.184473, 1.222395, -0.2376643, 1, 0, 0.6431373, 1,
1.187191, -1.049501, 2.476512, 1, 0, 0.6352941, 1,
1.194105, -1.446758, 2.748844, 1, 0, 0.6313726, 1,
1.208907, -0.1140676, 0.5833395, 1, 0, 0.6235294, 1,
1.210687, 1.658656, 0.2551608, 1, 0, 0.6196079, 1,
1.21491, 1.307186, 2.661941, 1, 0, 0.6117647, 1,
1.216876, -1.923942, 1.676313, 1, 0, 0.6078432, 1,
1.217126, 0.03241576, 1.088745, 1, 0, 0.6, 1,
1.223024, -1.004941, 2.371529, 1, 0, 0.5921569, 1,
1.231491, 0.1472946, 2.141149, 1, 0, 0.5882353, 1,
1.236317, -0.08915976, 2.426274, 1, 0, 0.5803922, 1,
1.238292, 0.3924591, 1.826734, 1, 0, 0.5764706, 1,
1.240957, -1.697817, 2.767761, 1, 0, 0.5686275, 1,
1.241126, 0.1692353, 2.732049, 1, 0, 0.5647059, 1,
1.243091, 1.77181, 0.433774, 1, 0, 0.5568628, 1,
1.246013, -0.1693128, 1.263621, 1, 0, 0.5529412, 1,
1.246122, 0.5943208, 2.42393, 1, 0, 0.5450981, 1,
1.24898, -1.351982, 3.602408, 1, 0, 0.5411765, 1,
1.251891, -0.6733613, 3.208003, 1, 0, 0.5333334, 1,
1.263204, -0.6147056, 1.800521, 1, 0, 0.5294118, 1,
1.277097, 0.8505822, -0.07303251, 1, 0, 0.5215687, 1,
1.278251, -1.050808, 3.125165, 1, 0, 0.5176471, 1,
1.285429, -1.142521, 2.601088, 1, 0, 0.509804, 1,
1.293313, 1.587792, -0.4584835, 1, 0, 0.5058824, 1,
1.29352, 0.09956091, 3.779557, 1, 0, 0.4980392, 1,
1.299608, 0.01280424, 1.39818, 1, 0, 0.4901961, 1,
1.308476, 1.751718, -1.568961, 1, 0, 0.4862745, 1,
1.320935, 0.2253748, 2.631217, 1, 0, 0.4784314, 1,
1.322137, -1.835809, 2.936054, 1, 0, 0.4745098, 1,
1.33168, -0.7975339, 1.245302, 1, 0, 0.4666667, 1,
1.346564, -0.05033651, 1.42283, 1, 0, 0.4627451, 1,
1.349274, -0.1213227, 1.641645, 1, 0, 0.454902, 1,
1.35855, 0.7943787, 1.372701, 1, 0, 0.4509804, 1,
1.360136, 0.8861939, 1.300723, 1, 0, 0.4431373, 1,
1.364084, 0.184902, 3.438048, 1, 0, 0.4392157, 1,
1.377133, -0.08940228, 2.339497, 1, 0, 0.4313726, 1,
1.397196, 0.07756303, 1.326471, 1, 0, 0.427451, 1,
1.424839, 1.556523, -0.006373913, 1, 0, 0.4196078, 1,
1.433529, 1.184231, 0.4936297, 1, 0, 0.4156863, 1,
1.436368, -1.510307, 2.375211, 1, 0, 0.4078431, 1,
1.441252, 0.2038787, 0.5330712, 1, 0, 0.4039216, 1,
1.447939, -0.1555662, 2.503647, 1, 0, 0.3960784, 1,
1.451405, 0.4874754, 0.8635885, 1, 0, 0.3882353, 1,
1.459859, 1.92, 0.5004861, 1, 0, 0.3843137, 1,
1.467807, -0.4740869, 1.067547, 1, 0, 0.3764706, 1,
1.491647, 0.6003838, 1.060973, 1, 0, 0.372549, 1,
1.50968, 0.6436815, 0.0773224, 1, 0, 0.3647059, 1,
1.511039, -0.3043217, 0.8511406, 1, 0, 0.3607843, 1,
1.512626, -0.693169, 2.398703, 1, 0, 0.3529412, 1,
1.532509, -0.6550674, 1.58284, 1, 0, 0.3490196, 1,
1.539818, -0.152181, 2.429766, 1, 0, 0.3411765, 1,
1.540858, 0.07360896, -0.01613447, 1, 0, 0.3372549, 1,
1.552355, -0.08104126, 2.073365, 1, 0, 0.3294118, 1,
1.561301, -0.6237011, 2.569684, 1, 0, 0.3254902, 1,
1.568461, -0.9272639, 1.637739, 1, 0, 0.3176471, 1,
1.580839, -0.6867134, 3.175032, 1, 0, 0.3137255, 1,
1.590078, 1.494343, 0.1954916, 1, 0, 0.3058824, 1,
1.591186, 0.2609803, 2.95191, 1, 0, 0.2980392, 1,
1.604954, 0.950507, 0.8682889, 1, 0, 0.2941177, 1,
1.606942, 0.320545, 0.2372077, 1, 0, 0.2862745, 1,
1.635799, -1.296162, 1.610274, 1, 0, 0.282353, 1,
1.659811, -2.154311, 2.627975, 1, 0, 0.2745098, 1,
1.672169, -0.1113389, 0.0873387, 1, 0, 0.2705882, 1,
1.676108, -1.235192, 1.609692, 1, 0, 0.2627451, 1,
1.695864, -0.05785679, 0.825128, 1, 0, 0.2588235, 1,
1.697799, -0.7240746, 0.8996399, 1, 0, 0.2509804, 1,
1.701039, 2.022149, 0.6581689, 1, 0, 0.2470588, 1,
1.752079, 0.08757063, 0.9805908, 1, 0, 0.2392157, 1,
1.75445, -1.095911, 2.719109, 1, 0, 0.2352941, 1,
1.757726, -0.3352346, 2.116168, 1, 0, 0.227451, 1,
1.812423, -1.397059, 3.025127, 1, 0, 0.2235294, 1,
1.816113, -0.7529937, 3.718745, 1, 0, 0.2156863, 1,
1.828303, 0.1155801, 0.573609, 1, 0, 0.2117647, 1,
1.830357, -0.7378186, 2.592638, 1, 0, 0.2039216, 1,
1.83363, 2.091067, 1.535718, 1, 0, 0.1960784, 1,
1.849476, -1.027857, 2.062971, 1, 0, 0.1921569, 1,
1.856494, -0.1610606, 0.9530993, 1, 0, 0.1843137, 1,
1.888505, 0.4503505, 0.6677485, 1, 0, 0.1803922, 1,
1.922076, -0.2178593, -0.1680117, 1, 0, 0.172549, 1,
1.944132, -0.1786408, 0.3280543, 1, 0, 0.1686275, 1,
1.949461, 0.7375371, 0.650839, 1, 0, 0.1607843, 1,
1.957457, 0.8906019, 1.228681, 1, 0, 0.1568628, 1,
1.96469, -0.5322497, 3.3548, 1, 0, 0.1490196, 1,
1.969922, 0.4432961, 0.8933775, 1, 0, 0.145098, 1,
1.974393, -1.442473, 1.32133, 1, 0, 0.1372549, 1,
1.983256, -0.4348794, 1.31343, 1, 0, 0.1333333, 1,
2.004638, -0.105199, 0.7138353, 1, 0, 0.1254902, 1,
2.018203, 0.9597489, 1.850547, 1, 0, 0.1215686, 1,
2.022121, 2.65278, -0.2412064, 1, 0, 0.1137255, 1,
2.024986, 0.2339439, 2.786815, 1, 0, 0.1098039, 1,
2.134555, 1.339409, 2.948165, 1, 0, 0.1019608, 1,
2.150681, -0.4802925, 2.254329, 1, 0, 0.09411765, 1,
2.152743, 1.255247, 3.494924, 1, 0, 0.09019608, 1,
2.263449, 0.6630598, 1.719696, 1, 0, 0.08235294, 1,
2.27668, 0.2490727, 1.220462, 1, 0, 0.07843138, 1,
2.295526, 0.5250037, -0.2947069, 1, 0, 0.07058824, 1,
2.346595, 0.3247637, 1.626012, 1, 0, 0.06666667, 1,
2.39492, 0.3794018, 1.635336, 1, 0, 0.05882353, 1,
2.423793, -0.2223918, 2.236425, 1, 0, 0.05490196, 1,
2.435905, -0.5522538, 3.382897, 1, 0, 0.04705882, 1,
2.447553, -0.4734958, 0.008259506, 1, 0, 0.04313726, 1,
2.450093, 0.6405513, 2.415325, 1, 0, 0.03529412, 1,
2.467465, -0.008857959, 2.190753, 1, 0, 0.03137255, 1,
2.513033, 0.4151891, 1.908507, 1, 0, 0.02352941, 1,
2.567244, 0.353821, 1.588649, 1, 0, 0.01960784, 1,
2.788642, -0.6148749, 3.862071, 1, 0, 0.01176471, 1,
2.944466, 1.025757, -1.355775, 1, 0, 0.007843138, 1
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
-0.6472245, -3.898076, -7.008512, 0, -0.5, 0.5, 0.5,
-0.6472245, -3.898076, -7.008512, 1, -0.5, 0.5, 0.5,
-0.6472245, -3.898076, -7.008512, 1, 1.5, 0.5, 0.5,
-0.6472245, -3.898076, -7.008512, 0, 1.5, 0.5, 0.5
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
-5.456499, 0.08132708, -7.008512, 0, -0.5, 0.5, 0.5,
-5.456499, 0.08132708, -7.008512, 1, -0.5, 0.5, 0.5,
-5.456499, 0.08132708, -7.008512, 1, 1.5, 0.5, 0.5,
-5.456499, 0.08132708, -7.008512, 0, 1.5, 0.5, 0.5
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
-5.456499, -3.898076, -0.1786451, 0, -0.5, 0.5, 0.5,
-5.456499, -3.898076, -0.1786451, 1, -0.5, 0.5, 0.5,
-5.456499, -3.898076, -0.1786451, 1, 1.5, 0.5, 0.5,
-5.456499, -3.898076, -0.1786451, 0, 1.5, 0.5, 0.5
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
-4, -2.979752, -5.432389,
2, -2.979752, -5.432389,
-4, -2.979752, -5.432389,
-4, -3.132806, -5.695076,
-2, -2.979752, -5.432389,
-2, -3.132806, -5.695076,
0, -2.979752, -5.432389,
0, -3.132806, -5.695076,
2, -2.979752, -5.432389,
2, -3.132806, -5.695076
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
-4, -3.438914, -6.220451, 0, -0.5, 0.5, 0.5,
-4, -3.438914, -6.220451, 1, -0.5, 0.5, 0.5,
-4, -3.438914, -6.220451, 1, 1.5, 0.5, 0.5,
-4, -3.438914, -6.220451, 0, 1.5, 0.5, 0.5,
-2, -3.438914, -6.220451, 0, -0.5, 0.5, 0.5,
-2, -3.438914, -6.220451, 1, -0.5, 0.5, 0.5,
-2, -3.438914, -6.220451, 1, 1.5, 0.5, 0.5,
-2, -3.438914, -6.220451, 0, 1.5, 0.5, 0.5,
0, -3.438914, -6.220451, 0, -0.5, 0.5, 0.5,
0, -3.438914, -6.220451, 1, -0.5, 0.5, 0.5,
0, -3.438914, -6.220451, 1, 1.5, 0.5, 0.5,
0, -3.438914, -6.220451, 0, 1.5, 0.5, 0.5,
2, -3.438914, -6.220451, 0, -0.5, 0.5, 0.5,
2, -3.438914, -6.220451, 1, -0.5, 0.5, 0.5,
2, -3.438914, -6.220451, 1, 1.5, 0.5, 0.5,
2, -3.438914, -6.220451, 0, 1.5, 0.5, 0.5
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
-4.346666, -2, -5.432389,
-4.346666, 3, -5.432389,
-4.346666, -2, -5.432389,
-4.531638, -2, -5.695076,
-4.346666, -1, -5.432389,
-4.531638, -1, -5.695076,
-4.346666, 0, -5.432389,
-4.531638, 0, -5.695076,
-4.346666, 1, -5.432389,
-4.531638, 1, -5.695076,
-4.346666, 2, -5.432389,
-4.531638, 2, -5.695076,
-4.346666, 3, -5.432389,
-4.531638, 3, -5.695076
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
-4.901582, -2, -6.220451, 0, -0.5, 0.5, 0.5,
-4.901582, -2, -6.220451, 1, -0.5, 0.5, 0.5,
-4.901582, -2, -6.220451, 1, 1.5, 0.5, 0.5,
-4.901582, -2, -6.220451, 0, 1.5, 0.5, 0.5,
-4.901582, -1, -6.220451, 0, -0.5, 0.5, 0.5,
-4.901582, -1, -6.220451, 1, -0.5, 0.5, 0.5,
-4.901582, -1, -6.220451, 1, 1.5, 0.5, 0.5,
-4.901582, -1, -6.220451, 0, 1.5, 0.5, 0.5,
-4.901582, 0, -6.220451, 0, -0.5, 0.5, 0.5,
-4.901582, 0, -6.220451, 1, -0.5, 0.5, 0.5,
-4.901582, 0, -6.220451, 1, 1.5, 0.5, 0.5,
-4.901582, 0, -6.220451, 0, 1.5, 0.5, 0.5,
-4.901582, 1, -6.220451, 0, -0.5, 0.5, 0.5,
-4.901582, 1, -6.220451, 1, -0.5, 0.5, 0.5,
-4.901582, 1, -6.220451, 1, 1.5, 0.5, 0.5,
-4.901582, 1, -6.220451, 0, 1.5, 0.5, 0.5,
-4.901582, 2, -6.220451, 0, -0.5, 0.5, 0.5,
-4.901582, 2, -6.220451, 1, -0.5, 0.5, 0.5,
-4.901582, 2, -6.220451, 1, 1.5, 0.5, 0.5,
-4.901582, 2, -6.220451, 0, 1.5, 0.5, 0.5,
-4.901582, 3, -6.220451, 0, -0.5, 0.5, 0.5,
-4.901582, 3, -6.220451, 1, -0.5, 0.5, 0.5,
-4.901582, 3, -6.220451, 1, 1.5, 0.5, 0.5,
-4.901582, 3, -6.220451, 0, 1.5, 0.5, 0.5
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
-4.346666, -2.979752, -4,
-4.346666, -2.979752, 4,
-4.346666, -2.979752, -4,
-4.531638, -3.132806, -4,
-4.346666, -2.979752, -2,
-4.531638, -3.132806, -2,
-4.346666, -2.979752, 0,
-4.531638, -3.132806, 0,
-4.346666, -2.979752, 2,
-4.531638, -3.132806, 2,
-4.346666, -2.979752, 4,
-4.531638, -3.132806, 4
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
-4.901582, -3.438914, -4, 0, -0.5, 0.5, 0.5,
-4.901582, -3.438914, -4, 1, -0.5, 0.5, 0.5,
-4.901582, -3.438914, -4, 1, 1.5, 0.5, 0.5,
-4.901582, -3.438914, -4, 0, 1.5, 0.5, 0.5,
-4.901582, -3.438914, -2, 0, -0.5, 0.5, 0.5,
-4.901582, -3.438914, -2, 1, -0.5, 0.5, 0.5,
-4.901582, -3.438914, -2, 1, 1.5, 0.5, 0.5,
-4.901582, -3.438914, -2, 0, 1.5, 0.5, 0.5,
-4.901582, -3.438914, 0, 0, -0.5, 0.5, 0.5,
-4.901582, -3.438914, 0, 1, -0.5, 0.5, 0.5,
-4.901582, -3.438914, 0, 1, 1.5, 0.5, 0.5,
-4.901582, -3.438914, 0, 0, 1.5, 0.5, 0.5,
-4.901582, -3.438914, 2, 0, -0.5, 0.5, 0.5,
-4.901582, -3.438914, 2, 1, -0.5, 0.5, 0.5,
-4.901582, -3.438914, 2, 1, 1.5, 0.5, 0.5,
-4.901582, -3.438914, 2, 0, 1.5, 0.5, 0.5,
-4.901582, -3.438914, 4, 0, -0.5, 0.5, 0.5,
-4.901582, -3.438914, 4, 1, -0.5, 0.5, 0.5,
-4.901582, -3.438914, 4, 1, 1.5, 0.5, 0.5,
-4.901582, -3.438914, 4, 0, 1.5, 0.5, 0.5
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
-4.346666, -2.979752, -5.432389,
-4.346666, 3.142406, -5.432389,
-4.346666, -2.979752, 5.075099,
-4.346666, 3.142406, 5.075099,
-4.346666, -2.979752, -5.432389,
-4.346666, -2.979752, 5.075099,
-4.346666, 3.142406, -5.432389,
-4.346666, 3.142406, 5.075099,
-4.346666, -2.979752, -5.432389,
3.052217, -2.979752, -5.432389,
-4.346666, -2.979752, 5.075099,
3.052217, -2.979752, 5.075099,
-4.346666, 3.142406, -5.432389,
3.052217, 3.142406, -5.432389,
-4.346666, 3.142406, 5.075099,
3.052217, 3.142406, 5.075099,
3.052217, -2.979752, -5.432389,
3.052217, 3.142406, -5.432389,
3.052217, -2.979752, 5.075099,
3.052217, 3.142406, 5.075099,
3.052217, -2.979752, -5.432389,
3.052217, -2.979752, 5.075099,
3.052217, 3.142406, -5.432389,
3.052217, 3.142406, 5.075099
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
var radius = 7.601145;
var distance = 33.81836;
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
mvMatrix.translate( 0.6472245, -0.08132708, 0.1786451 );
mvMatrix.scale( 1.110777, 1.34242, 0.7821572 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.81836);
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
etoxazole<-read.table("etoxazole.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-etoxazole$V2
```

```
## Error in eval(expr, envir, enclos): object 'etoxazole' not found
```

```r
y<-etoxazole$V3
```

```
## Error in eval(expr, envir, enclos): object 'etoxazole' not found
```

```r
z<-etoxazole$V4
```

```
## Error in eval(expr, envir, enclos): object 'etoxazole' not found
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
-4.238915, -1.341966, -2.099311, 0, 0, 1, 1, 1,
-3.088724, -0.2530349, -2.704813, 1, 0, 0, 1, 1,
-2.960837, -0.2904555, -1.109338, 1, 0, 0, 1, 1,
-2.774591, -0.8087415, -3.876771, 1, 0, 0, 1, 1,
-2.597651, 0.9103363, 0.208997, 1, 0, 0, 1, 1,
-2.572626, -0.02699603, -1.722577, 1, 0, 0, 1, 1,
-2.552215, -0.8548672, -0.9789244, 0, 0, 0, 1, 1,
-2.372882, 0.3084059, -1.549473, 0, 0, 0, 1, 1,
-2.360617, 1.185034, -0.6627108, 0, 0, 0, 1, 1,
-2.348411, 0.4182409, -1.664119, 0, 0, 0, 1, 1,
-2.321102, 0.1139789, -0.3274139, 0, 0, 0, 1, 1,
-2.30646, 1.451195, -0.2626809, 0, 0, 0, 1, 1,
-2.300421, 1.999183, 0.4438057, 0, 0, 0, 1, 1,
-2.288496, 1.292316, -1.041904, 1, 1, 1, 1, 1,
-2.246664, 0.494253, -1.461927, 1, 1, 1, 1, 1,
-2.243739, -1.76371, -1.518855, 1, 1, 1, 1, 1,
-2.214158, 1.850603, -0.3265437, 1, 1, 1, 1, 1,
-2.204304, -0.5731266, -2.129572, 1, 1, 1, 1, 1,
-2.201971, -2.392044, -1.232276, 1, 1, 1, 1, 1,
-2.165901, 1.693312, -1.578832, 1, 1, 1, 1, 1,
-2.142218, 0.6793319, 0.1350811, 1, 1, 1, 1, 1,
-2.104837, 1.07341, -1.616221, 1, 1, 1, 1, 1,
-2.101333, -1.634826, -1.108297, 1, 1, 1, 1, 1,
-2.06401, 0.7888556, -1.290806, 1, 1, 1, 1, 1,
-2.052442, -0.8017855, -0.3379034, 1, 1, 1, 1, 1,
-2.015944, -0.2956239, -3.339917, 1, 1, 1, 1, 1,
-1.98297, 0.9750775, -1.271213, 1, 1, 1, 1, 1,
-1.965364, -0.3360687, -1.56311, 1, 1, 1, 1, 1,
-1.96146, 0.09408645, -2.47911, 0, 0, 1, 1, 1,
-1.960011, -1.042227, -1.165255, 1, 0, 0, 1, 1,
-1.945862, -0.275723, -1.832544, 1, 0, 0, 1, 1,
-1.941416, -0.7500798, -0.2994544, 1, 0, 0, 1, 1,
-1.920513, -0.2119287, -2.386087, 1, 0, 0, 1, 1,
-1.871217, -1.191548, -2.933974, 1, 0, 0, 1, 1,
-1.869221, 0.2386133, -2.387013, 0, 0, 0, 1, 1,
-1.862278, 0.9649683, -0.2888043, 0, 0, 0, 1, 1,
-1.851438, -0.4375742, 0.02454147, 0, 0, 0, 1, 1,
-1.839021, -0.3092719, -0.5482059, 0, 0, 0, 1, 1,
-1.829012, 0.07889593, -1.439163, 0, 0, 0, 1, 1,
-1.815309, 1.341162, -0.4880702, 0, 0, 0, 1, 1,
-1.814347, -1.303139, -2.814013, 0, 0, 0, 1, 1,
-1.803032, 0.3272179, -1.157349, 1, 1, 1, 1, 1,
-1.793, -1.163696, -2.02777, 1, 1, 1, 1, 1,
-1.791502, 0.2669482, -0.7499599, 1, 1, 1, 1, 1,
-1.787241, 1.872769, -1.307961, 1, 1, 1, 1, 1,
-1.771976, 1.887926, -0.3348633, 1, 1, 1, 1, 1,
-1.76945, -0.09715918, -1.650867, 1, 1, 1, 1, 1,
-1.769146, -0.6455997, -1.386439, 1, 1, 1, 1, 1,
-1.753381, 1.123767, -2.405434, 1, 1, 1, 1, 1,
-1.742254, -0.2497799, -1.190243, 1, 1, 1, 1, 1,
-1.707248, 0.4568874, -1.111069, 1, 1, 1, 1, 1,
-1.697818, 0.2235952, -0.3884495, 1, 1, 1, 1, 1,
-1.675576, -0.9202788, -1.483418, 1, 1, 1, 1, 1,
-1.645979, 0.02899054, -2.865454, 1, 1, 1, 1, 1,
-1.624882, -0.3452621, -4.144335, 1, 1, 1, 1, 1,
-1.623025, 1.034292, -1.034483, 1, 1, 1, 1, 1,
-1.61713, -0.1535098, -1.175914, 0, 0, 1, 1, 1,
-1.613613, -0.8286797, -1.922233, 1, 0, 0, 1, 1,
-1.609293, 0.9831802, -1.579262, 1, 0, 0, 1, 1,
-1.588576, 0.7819099, -0.3635679, 1, 0, 0, 1, 1,
-1.586937, -0.8289706, -2.048605, 1, 0, 0, 1, 1,
-1.580411, 0.4114491, -0.06658473, 1, 0, 0, 1, 1,
-1.566176, 0.1870756, -1.979017, 0, 0, 0, 1, 1,
-1.55105, 0.468679, -2.537998, 0, 0, 0, 1, 1,
-1.550049, 0.2453682, -0.5213651, 0, 0, 0, 1, 1,
-1.548111, -1.553283, -1.219652, 0, 0, 0, 1, 1,
-1.546715, -0.1574359, -3.554468, 0, 0, 0, 1, 1,
-1.543454, -0.131414, -1.472524, 0, 0, 0, 1, 1,
-1.535225, 0.175987, 0.01904331, 0, 0, 0, 1, 1,
-1.527814, -2.158466, -2.366652, 1, 1, 1, 1, 1,
-1.495067, -1.493624, -2.296969, 1, 1, 1, 1, 1,
-1.489056, 0.7238496, -1.545669, 1, 1, 1, 1, 1,
-1.487048, 1.429974, -1.168863, 1, 1, 1, 1, 1,
-1.484701, 0.4623146, 0.279151, 1, 1, 1, 1, 1,
-1.477442, 0.9336488, -0.6041505, 1, 1, 1, 1, 1,
-1.467977, -0.8831762, -1.298295, 1, 1, 1, 1, 1,
-1.45484, 0.5263193, -0.655369, 1, 1, 1, 1, 1,
-1.447325, -0.3416125, -0.5509368, 1, 1, 1, 1, 1,
-1.443058, -0.2171153, -1.762043, 1, 1, 1, 1, 1,
-1.441923, 2.427115, -0.655899, 1, 1, 1, 1, 1,
-1.441546, 1.29558, -1.427894, 1, 1, 1, 1, 1,
-1.437168, 0.8723674, -1.538373, 1, 1, 1, 1, 1,
-1.434312, -0.388512, -0.9846845, 1, 1, 1, 1, 1,
-1.42068, 1.788415, -0.3394285, 1, 1, 1, 1, 1,
-1.42032, 0.3653511, -1.88945, 0, 0, 1, 1, 1,
-1.416041, -2.153575, 0.822202, 1, 0, 0, 1, 1,
-1.408294, -0.1207538, 0.1997716, 1, 0, 0, 1, 1,
-1.403887, 0.3820459, -1.731505, 1, 0, 0, 1, 1,
-1.40021, 1.103251, -0.5882623, 1, 0, 0, 1, 1,
-1.399251, -0.3845556, -1.952532, 1, 0, 0, 1, 1,
-1.392561, 0.2334142, -3.278987, 0, 0, 0, 1, 1,
-1.390504, 0.2259194, -1.262709, 0, 0, 0, 1, 1,
-1.373037, -1.279221, -1.953051, 0, 0, 0, 1, 1,
-1.367308, -2.889829, -2.818238, 0, 0, 0, 1, 1,
-1.363243, 1.368434, 0.1502097, 0, 0, 0, 1, 1,
-1.354992, -1.091123, -3.231121, 0, 0, 0, 1, 1,
-1.341494, -0.1913018, -1.425277, 0, 0, 0, 1, 1,
-1.335154, -0.434857, 0.9416049, 1, 1, 1, 1, 1,
-1.334973, 0.7015896, -0.9380461, 1, 1, 1, 1, 1,
-1.300364, 1.427806, -1.923825, 1, 1, 1, 1, 1,
-1.293719, 1.023011, 0.09367949, 1, 1, 1, 1, 1,
-1.285936, 1.554959, -1.743645, 1, 1, 1, 1, 1,
-1.279623, -0.7094395, -1.275767, 1, 1, 1, 1, 1,
-1.278259, 0.9796705, -2.703353, 1, 1, 1, 1, 1,
-1.276537, -0.2524383, -4.037339, 1, 1, 1, 1, 1,
-1.267646, 1.39032, -0.7838377, 1, 1, 1, 1, 1,
-1.265018, -0.7787129, -2.719625, 1, 1, 1, 1, 1,
-1.244203, -2.067768, -2.886733, 1, 1, 1, 1, 1,
-1.239596, 1.132063, -1.862162, 1, 1, 1, 1, 1,
-1.229795, 1.945281, -1.490799, 1, 1, 1, 1, 1,
-1.21953, -0.2053905, -1.800415, 1, 1, 1, 1, 1,
-1.21557, -0.718689, -0.7252181, 1, 1, 1, 1, 1,
-1.212711, 1.304278, -2.564403, 0, 0, 1, 1, 1,
-1.207832, 0.3134975, -2.105685, 1, 0, 0, 1, 1,
-1.193168, -1.549027, -2.28934, 1, 0, 0, 1, 1,
-1.191638, 1.521, 0.1041787, 1, 0, 0, 1, 1,
-1.189169, 0.2228931, -1.490803, 1, 0, 0, 1, 1,
-1.185886, 0.7873386, 0.3283737, 1, 0, 0, 1, 1,
-1.18283, 1.013332, 0.1614881, 0, 0, 0, 1, 1,
-1.182156, 0.06045407, -1.619879, 0, 0, 0, 1, 1,
-1.179037, 0.5198607, -1.247251, 0, 0, 0, 1, 1,
-1.178952, 1.094447, -0.4778845, 0, 0, 0, 1, 1,
-1.172976, 3.053248, -0.8713033, 0, 0, 0, 1, 1,
-1.157738, 0.8912128, -1.767968, 0, 0, 0, 1, 1,
-1.146339, -0.9866086, -3.850913, 0, 0, 0, 1, 1,
-1.140205, -1.328628, -1.280732, 1, 1, 1, 1, 1,
-1.13694, -1.033083, -3.763982, 1, 1, 1, 1, 1,
-1.1261, 0.03721553, -0.5478145, 1, 1, 1, 1, 1,
-1.124044, -1.173254, -2.489855, 1, 1, 1, 1, 1,
-1.118249, -0.5190315, -3.320658, 1, 1, 1, 1, 1,
-1.116024, -0.7147372, -2.444563, 1, 1, 1, 1, 1,
-1.107582, -1.704734, -3.096382, 1, 1, 1, 1, 1,
-1.093161, 0.9631215, 0.6366082, 1, 1, 1, 1, 1,
-1.086278, 2.413288, -0.5643447, 1, 1, 1, 1, 1,
-1.084897, 1.516225, -0.9004735, 1, 1, 1, 1, 1,
-1.083159, 2.018998, -0.5834762, 1, 1, 1, 1, 1,
-1.082223, 0.01165296, -1.936319, 1, 1, 1, 1, 1,
-1.072036, -0.005631013, -0.009856758, 1, 1, 1, 1, 1,
-1.068234, -0.007154384, -2.007547, 1, 1, 1, 1, 1,
-1.062092, 1.346336, -0.7358892, 1, 1, 1, 1, 1,
-1.061614, 0.09093577, -1.724431, 0, 0, 1, 1, 1,
-1.053507, 2.158748, -1.618638, 1, 0, 0, 1, 1,
-1.038331, -0.4272977, 0.1016018, 1, 0, 0, 1, 1,
-1.036598, -0.2960492, -1.621664, 1, 0, 0, 1, 1,
-1.035562, -0.4285872, -3.540747, 1, 0, 0, 1, 1,
-1.017888, -0.2584417, -0.7671779, 1, 0, 0, 1, 1,
-1.015481, 0.4501097, -1.566099, 0, 0, 0, 1, 1,
-1.008538, -0.8161771, -3.821998, 0, 0, 0, 1, 1,
-1.00676, -0.1235671, -2.10599, 0, 0, 0, 1, 1,
-1.005871, -1.441898, -2.641804, 0, 0, 0, 1, 1,
-1.00198, 1.719093, -0.5607745, 0, 0, 0, 1, 1,
-0.9951558, -0.3608544, -1.610327, 0, 0, 0, 1, 1,
-0.9938215, 0.4647695, -1.484451, 0, 0, 0, 1, 1,
-0.9897002, 0.7066024, 0.006518539, 1, 1, 1, 1, 1,
-0.9806417, -1.095629, -4.120597, 1, 1, 1, 1, 1,
-0.97293, -1.114617, -0.8099074, 1, 1, 1, 1, 1,
-0.971319, 1.062435, -0.3638103, 1, 1, 1, 1, 1,
-0.9626876, 1.48026, -1.558008, 1, 1, 1, 1, 1,
-0.9625773, 0.8402148, -0.759244, 1, 1, 1, 1, 1,
-0.955506, -0.5036969, -1.263274, 1, 1, 1, 1, 1,
-0.9518112, 1.75242, -1.166428, 1, 1, 1, 1, 1,
-0.9444619, -2.327345, -2.305114, 1, 1, 1, 1, 1,
-0.9434709, -0.7338128, -1.435864, 1, 1, 1, 1, 1,
-0.941648, 0.5949026, -0.6069021, 1, 1, 1, 1, 1,
-0.9401587, 0.2973439, -1.510797, 1, 1, 1, 1, 1,
-0.938922, -1.153153, -3.179488, 1, 1, 1, 1, 1,
-0.9351503, -1.422156, -2.532826, 1, 1, 1, 1, 1,
-0.9273407, 0.0514806, -1.134777, 1, 1, 1, 1, 1,
-0.9219507, -1.087838, -1.542023, 0, 0, 1, 1, 1,
-0.9164026, 1.296667, -1.688728, 1, 0, 0, 1, 1,
-0.910517, 0.4069532, -2.301122, 1, 0, 0, 1, 1,
-0.9104492, 0.1014518, -2.042167, 1, 0, 0, 1, 1,
-0.902518, -0.8791431, -0.2782232, 1, 0, 0, 1, 1,
-0.90079, -0.648448, -2.420903, 1, 0, 0, 1, 1,
-0.8913122, -0.8207653, -1.141117, 0, 0, 0, 1, 1,
-0.8905106, -1.008397, -2.525303, 0, 0, 0, 1, 1,
-0.8842299, -0.5789781, -1.894378, 0, 0, 0, 1, 1,
-0.8818755, -0.3808319, -2.792337, 0, 0, 0, 1, 1,
-0.8786629, 0.2584475, -0.4243917, 0, 0, 0, 1, 1,
-0.8745707, 0.4376566, -1.265721, 0, 0, 0, 1, 1,
-0.8666695, -0.3107889, -2.638103, 0, 0, 0, 1, 1,
-0.8650234, -1.013735, -3.962529, 1, 1, 1, 1, 1,
-0.8578923, 0.8282589, -1.361557, 1, 1, 1, 1, 1,
-0.8573703, -0.7549911, -2.955858, 1, 1, 1, 1, 1,
-0.8568357, 1.051499, -2.621325, 1, 1, 1, 1, 1,
-0.8562065, -0.1421851, -2.253408, 1, 1, 1, 1, 1,
-0.8548917, 0.7197286, -1.588932, 1, 1, 1, 1, 1,
-0.854666, 0.06712846, -0.9917973, 1, 1, 1, 1, 1,
-0.852759, 0.2247994, 0.1288102, 1, 1, 1, 1, 1,
-0.8514799, 0.02545567, -1.608647, 1, 1, 1, 1, 1,
-0.8502945, -0.5221633, -3.104211, 1, 1, 1, 1, 1,
-0.8478706, -0.1361651, -1.362679, 1, 1, 1, 1, 1,
-0.8471449, -0.4964536, -2.01724, 1, 1, 1, 1, 1,
-0.8391643, -0.06476215, -2.958162, 1, 1, 1, 1, 1,
-0.8365769, 0.6187993, -0.119699, 1, 1, 1, 1, 1,
-0.835888, -1.304375, -2.086236, 1, 1, 1, 1, 1,
-0.8337731, 1.587962, -1.884656, 0, 0, 1, 1, 1,
-0.8265343, 1.072779, 0.2118439, 1, 0, 0, 1, 1,
-0.8233708, 2.004611, -1.120244, 1, 0, 0, 1, 1,
-0.8227464, -0.5505531, -1.421901, 1, 0, 0, 1, 1,
-0.8207217, -1.212792, -2.030637, 1, 0, 0, 1, 1,
-0.8198248, -0.369036, -1.385501, 1, 0, 0, 1, 1,
-0.8148633, 0.5557041, -1.311776, 0, 0, 0, 1, 1,
-0.810844, -1.237735, -1.033196, 0, 0, 0, 1, 1,
-0.809638, -0.4100051, -2.990877, 0, 0, 0, 1, 1,
-0.8060873, 1.326734, -0.5182175, 0, 0, 0, 1, 1,
-0.8046379, 0.2718413, -1.840562, 0, 0, 0, 1, 1,
-0.803129, -2.050508, -3.26191, 0, 0, 0, 1, 1,
-0.7997759, 0.4521711, -0.5833637, 0, 0, 0, 1, 1,
-0.7993376, -0.3573863, -1.424679, 1, 1, 1, 1, 1,
-0.7993261, -0.7780651, -3.386186, 1, 1, 1, 1, 1,
-0.7981627, 0.6158758, -0.6142746, 1, 1, 1, 1, 1,
-0.7961621, -0.9722069, -3.912188, 1, 1, 1, 1, 1,
-0.7952602, -0.09567034, -1.562638, 1, 1, 1, 1, 1,
-0.7921866, 0.1258167, -1.477839, 1, 1, 1, 1, 1,
-0.7888374, 0.5078338, -0.806646, 1, 1, 1, 1, 1,
-0.7874258, 0.3686816, 0.1234125, 1, 1, 1, 1, 1,
-0.7851313, 0.4119731, -1.969588, 1, 1, 1, 1, 1,
-0.7827513, -2.236851, -1.451175, 1, 1, 1, 1, 1,
-0.7767397, -0.7061053, -0.8698017, 1, 1, 1, 1, 1,
-0.7738746, 0.2065055, -2.445434, 1, 1, 1, 1, 1,
-0.7735309, 0.1571389, 0.2285355, 1, 1, 1, 1, 1,
-0.773411, -0.7000929, -2.39239, 1, 1, 1, 1, 1,
-0.771, 0.7486442, 1.717489, 1, 1, 1, 1, 1,
-0.76408, 1.241527, 0.003372929, 0, 0, 1, 1, 1,
-0.7638269, 1.125099, -0.2534959, 1, 0, 0, 1, 1,
-0.7592638, -0.7372243, -3.502994, 1, 0, 0, 1, 1,
-0.7561932, 1.384647, 0.8053769, 1, 0, 0, 1, 1,
-0.7558184, 0.03048561, -1.649481, 1, 0, 0, 1, 1,
-0.7551695, -1.106248, -2.120884, 1, 0, 0, 1, 1,
-0.7538308, 0.9410933, -1.872612, 0, 0, 0, 1, 1,
-0.7464471, -0.2524507, -2.16034, 0, 0, 0, 1, 1,
-0.7429873, 1.028952, -0.1747129, 0, 0, 0, 1, 1,
-0.7376285, -0.5300753, -0.6173842, 0, 0, 0, 1, 1,
-0.729348, 0.05227263, -1.14998, 0, 0, 0, 1, 1,
-0.7291867, 0.1902872, -1.056035, 0, 0, 0, 1, 1,
-0.7263163, 1.246219, 0.4602988, 0, 0, 0, 1, 1,
-0.7165262, 2.382793, -1.30283, 1, 1, 1, 1, 1,
-0.7146412, 0.2593246, -0.409948, 1, 1, 1, 1, 1,
-0.714011, 1.087059, -1.244184, 1, 1, 1, 1, 1,
-0.7118729, 1.22949, -1.068644, 1, 1, 1, 1, 1,
-0.7108968, 0.48294, -1.465186, 1, 1, 1, 1, 1,
-0.7058145, 0.2626697, -1.650526, 1, 1, 1, 1, 1,
-0.7032908, 0.1845133, -0.5947234, 1, 1, 1, 1, 1,
-0.7023925, 0.8372501, -1.812372, 1, 1, 1, 1, 1,
-0.6943174, 0.6490468, -0.4534889, 1, 1, 1, 1, 1,
-0.6942266, -0.7490692, -1.212998, 1, 1, 1, 1, 1,
-0.6868208, 0.4089996, -0.3889235, 1, 1, 1, 1, 1,
-0.6868178, 1.168809, -0.873082, 1, 1, 1, 1, 1,
-0.6839415, 0.2648651, -1.402258, 1, 1, 1, 1, 1,
-0.6738623, -1.259482, -3.412144, 1, 1, 1, 1, 1,
-0.673655, -0.7708423, -4.853416, 1, 1, 1, 1, 1,
-0.6703023, 0.5903138, -1.20927, 0, 0, 1, 1, 1,
-0.6667026, -0.6464267, -2.129621, 1, 0, 0, 1, 1,
-0.662519, -0.7170667, -1.480248, 1, 0, 0, 1, 1,
-0.6623145, 0.3371181, -0.8334804, 1, 0, 0, 1, 1,
-0.6559116, -1.315293, -2.500897, 1, 0, 0, 1, 1,
-0.65561, 1.452562, -0.7703149, 1, 0, 0, 1, 1,
-0.6478301, -0.07267281, 0.2559061, 0, 0, 0, 1, 1,
-0.6449423, -1.637507, -5.124643, 0, 0, 0, 1, 1,
-0.6405355, -0.9741053, -2.196179, 0, 0, 0, 1, 1,
-0.6343066, -0.7249815, -2.497521, 0, 0, 0, 1, 1,
-0.6329559, 1.714175, -0.9493654, 0, 0, 0, 1, 1,
-0.6150337, 0.7543696, -1.548488, 0, 0, 0, 1, 1,
-0.607731, -0.6632317, -2.368854, 0, 0, 0, 1, 1,
-0.607281, -1.413731, -1.850921, 1, 1, 1, 1, 1,
-0.6026744, 1.423344, 0.4526807, 1, 1, 1, 1, 1,
-0.5988581, -1.670794, -2.463587, 1, 1, 1, 1, 1,
-0.5972343, 0.3758779, -1.197821, 1, 1, 1, 1, 1,
-0.5898735, 1.922124, -0.3745624, 1, 1, 1, 1, 1,
-0.5895883, -2.578231, -3.683453, 1, 1, 1, 1, 1,
-0.5894742, 0.1757201, 0.1895981, 1, 1, 1, 1, 1,
-0.5894211, 0.124506, 0.07748826, 1, 1, 1, 1, 1,
-0.5890884, -0.8393044, -3.405598, 1, 1, 1, 1, 1,
-0.5841825, -1.51065, -3.091716, 1, 1, 1, 1, 1,
-0.583087, 0.3495649, -1.832479, 1, 1, 1, 1, 1,
-0.5822837, -0.7359371, -0.5752552, 1, 1, 1, 1, 1,
-0.5806286, -0.8901283, -2.097309, 1, 1, 1, 1, 1,
-0.5748456, -2.095263, -1.906828, 1, 1, 1, 1, 1,
-0.5743932, 0.5703886, -0.13894, 1, 1, 1, 1, 1,
-0.5666767, 0.9196124, -1.154647, 0, 0, 1, 1, 1,
-0.5641676, -0.3115124, -0.7085153, 1, 0, 0, 1, 1,
-0.5639583, -1.220383, -4.028791, 1, 0, 0, 1, 1,
-0.5613538, 2.366194, -1.405461, 1, 0, 0, 1, 1,
-0.5585642, -0.5786969, -1.875477, 1, 0, 0, 1, 1,
-0.5571652, -0.7005315, -4.787754, 1, 0, 0, 1, 1,
-0.5429362, -0.2369197, -0.5790101, 0, 0, 0, 1, 1,
-0.538439, 0.06403317, 0.6968809, 0, 0, 0, 1, 1,
-0.5381177, 1.676586, 0.7454926, 0, 0, 0, 1, 1,
-0.5380805, -1.39418, -1.792463, 0, 0, 0, 1, 1,
-0.5380144, -0.6045485, -3.009787, 0, 0, 0, 1, 1,
-0.5343024, -1.084762, -0.4795866, 0, 0, 0, 1, 1,
-0.5265163, 0.0911644, -2.489812, 0, 0, 0, 1, 1,
-0.5233564, -0.1536026, -2.676817, 1, 1, 1, 1, 1,
-0.5207149, -1.221059, -2.410098, 1, 1, 1, 1, 1,
-0.5172403, -0.6003149, -3.966247, 1, 1, 1, 1, 1,
-0.5108551, 1.719135, -0.7358431, 1, 1, 1, 1, 1,
-0.5076599, 0.1721536, -1.958851, 1, 1, 1, 1, 1,
-0.5029655, 0.4621142, -1.493272, 1, 1, 1, 1, 1,
-0.5015057, 0.4842763, 0.4684641, 1, 1, 1, 1, 1,
-0.4992005, -0.07999125, -3.13507, 1, 1, 1, 1, 1,
-0.4960611, 0.4940626, -1.114201, 1, 1, 1, 1, 1,
-0.4954994, 0.8685358, 0.5876459, 1, 1, 1, 1, 1,
-0.4952821, -1.080121, -2.8994, 1, 1, 1, 1, 1,
-0.493817, 1.052756, -0.9355906, 1, 1, 1, 1, 1,
-0.4937267, 0.2853678, -0.7036605, 1, 1, 1, 1, 1,
-0.4924942, -1.626563, -2.49098, 1, 1, 1, 1, 1,
-0.4898301, -1.342948, -3.223103, 1, 1, 1, 1, 1,
-0.4869419, -1.259561, -4.365795, 0, 0, 1, 1, 1,
-0.4827169, 1.265124, 0.2932644, 1, 0, 0, 1, 1,
-0.4798313, -0.5475578, -2.378902, 1, 0, 0, 1, 1,
-0.4795137, 0.02269088, -1.919997, 1, 0, 0, 1, 1,
-0.4765967, 0.07364355, -0.06757699, 1, 0, 0, 1, 1,
-0.4758047, -0.03523329, -2.834144, 1, 0, 0, 1, 1,
-0.4735121, -0.6317575, -3.575664, 0, 0, 0, 1, 1,
-0.4717874, 0.715923, -0.7956662, 0, 0, 0, 1, 1,
-0.4702788, -0.6715729, -2.38765, 0, 0, 0, 1, 1,
-0.4675477, -0.6030558, -0.6686075, 0, 0, 0, 1, 1,
-0.465926, 0.2154142, -1.866906, 0, 0, 0, 1, 1,
-0.4631906, 1.204344, 1.280153, 0, 0, 0, 1, 1,
-0.4629953, -0.7787555, -1.793091, 0, 0, 0, 1, 1,
-0.4618201, 1.284402, -1.681553, 1, 1, 1, 1, 1,
-0.4608239, 1.011395, 1.131731, 1, 1, 1, 1, 1,
-0.4573278, -0.9930573, -2.584929, 1, 1, 1, 1, 1,
-0.4547303, 0.2291013, -0.7751721, 1, 1, 1, 1, 1,
-0.4522107, 1.209797, -0.1715502, 1, 1, 1, 1, 1,
-0.4517394, 0.7675946, -0.05963183, 1, 1, 1, 1, 1,
-0.4492941, 0.6790055, -0.9215888, 1, 1, 1, 1, 1,
-0.4458389, -0.7963965, -1.51423, 1, 1, 1, 1, 1,
-0.4432117, -1.009525, -0.1120113, 1, 1, 1, 1, 1,
-0.4422071, 1.953032, -0.9301029, 1, 1, 1, 1, 1,
-0.4395787, -0.01464002, -1.065914, 1, 1, 1, 1, 1,
-0.4393994, -0.6095676, -3.278704, 1, 1, 1, 1, 1,
-0.4384202, -0.2367133, -2.74059, 1, 1, 1, 1, 1,
-0.434771, -0.2040703, -1.414282, 1, 1, 1, 1, 1,
-0.4333482, 1.31734, -0.461283, 1, 1, 1, 1, 1,
-0.4226568, -0.3365829, -2.288838, 0, 0, 1, 1, 1,
-0.4224178, 0.5771493, -1.54657, 1, 0, 0, 1, 1,
-0.4198108, 1.020402, -2.671637, 1, 0, 0, 1, 1,
-0.4162594, 2.813543, 0.7395443, 1, 0, 0, 1, 1,
-0.4149017, 0.1524467, 0.005396171, 1, 0, 0, 1, 1,
-0.4142016, 0.8685699, -1.647812, 1, 0, 0, 1, 1,
-0.4107271, -1.374066, -2.086838, 0, 0, 0, 1, 1,
-0.4091347, 0.9196218, 0.7182136, 0, 0, 0, 1, 1,
-0.4089137, -0.8580418, -0.5189827, 0, 0, 0, 1, 1,
-0.4074019, -0.6441163, -2.32247, 0, 0, 0, 1, 1,
-0.4061806, -1.426421, -2.639096, 0, 0, 0, 1, 1,
-0.3986571, 0.5039265, -0.1756465, 0, 0, 0, 1, 1,
-0.3971597, 0.4382941, -0.2080443, 0, 0, 0, 1, 1,
-0.3937555, 0.6460795, 0.2412844, 1, 1, 1, 1, 1,
-0.3880041, -0.8076379, -2.271475, 1, 1, 1, 1, 1,
-0.3826291, 0.9794238, -1.225167, 1, 1, 1, 1, 1,
-0.3777108, -0.5664328, -1.433977, 1, 1, 1, 1, 1,
-0.3775064, -1.16152, -3.948878, 1, 1, 1, 1, 1,
-0.3763479, 1.386023, -0.6062702, 1, 1, 1, 1, 1,
-0.3756768, -0.7818471, -2.092999, 1, 1, 1, 1, 1,
-0.3719828, 0.5128051, 0.5668171, 1, 1, 1, 1, 1,
-0.3673069, -1.859844, -3.815272, 1, 1, 1, 1, 1,
-0.3671039, 0.9031054, 1.577824, 1, 1, 1, 1, 1,
-0.3640582, -1.35245, -4.232662, 1, 1, 1, 1, 1,
-0.3634539, 1.072937, 0.4874888, 1, 1, 1, 1, 1,
-0.3606614, -2.054937, -1.833689, 1, 1, 1, 1, 1,
-0.3565702, -0.22802, -1.830196, 1, 1, 1, 1, 1,
-0.354231, -0.7361328, -3.938134, 1, 1, 1, 1, 1,
-0.3532938, -0.4220162, -2.937971, 0, 0, 1, 1, 1,
-0.3521348, 0.1298178, 1.27873, 1, 0, 0, 1, 1,
-0.3506467, 0.7161782, -1.017644, 1, 0, 0, 1, 1,
-0.3452264, 0.07334749, -2.120218, 1, 0, 0, 1, 1,
-0.3441105, -0.5383282, -4.338391, 1, 0, 0, 1, 1,
-0.3419287, 0.2475265, -0.3728284, 1, 0, 0, 1, 1,
-0.3409764, -0.6533213, -3.116278, 0, 0, 0, 1, 1,
-0.3403945, -0.401656, -2.467238, 0, 0, 0, 1, 1,
-0.3398945, 0.006234564, -1.763707, 0, 0, 0, 1, 1,
-0.3390336, 1.497485, -2.139824, 0, 0, 0, 1, 1,
-0.3362909, -0.3600663, -2.506359, 0, 0, 0, 1, 1,
-0.335467, -1.158438, -1.724956, 0, 0, 0, 1, 1,
-0.3331616, -0.2080747, -1.45391, 0, 0, 0, 1, 1,
-0.3318433, -1.206591, -3.649431, 1, 1, 1, 1, 1,
-0.3283601, 0.3774363, -1.642507, 1, 1, 1, 1, 1,
-0.3241001, 0.7694004, 0.4787121, 1, 1, 1, 1, 1,
-0.3239567, 0.1122802, -1.444948, 1, 1, 1, 1, 1,
-0.3237132, 0.9382921, 1.051958, 1, 1, 1, 1, 1,
-0.3217592, -0.09861588, -1.388935, 1, 1, 1, 1, 1,
-0.3201847, 0.09659739, 0.4124868, 1, 1, 1, 1, 1,
-0.3173493, 2.188456, 0.1022448, 1, 1, 1, 1, 1,
-0.3110609, -0.2125806, -0.9624007, 1, 1, 1, 1, 1,
-0.3047525, -0.4077405, -2.437582, 1, 1, 1, 1, 1,
-0.3044305, 1.077322, -1.523104, 1, 1, 1, 1, 1,
-0.3041901, 0.7953016, -1.229641, 1, 1, 1, 1, 1,
-0.2926185, -1.266558, -0.6652929, 1, 1, 1, 1, 1,
-0.2854424, 0.2335795, -1.981385, 1, 1, 1, 1, 1,
-0.2851141, -0.4085375, -1.984151, 1, 1, 1, 1, 1,
-0.2742714, 0.5481029, 0.05868642, 0, 0, 1, 1, 1,
-0.2735403, 0.9171908, -0.7965881, 1, 0, 0, 1, 1,
-0.2623788, 0.5269191, -1.415847, 1, 0, 0, 1, 1,
-0.2557802, 0.4239193, -1.197693, 1, 0, 0, 1, 1,
-0.2536434, -0.940187, -4.184525, 1, 0, 0, 1, 1,
-0.2521411, 0.02040583, -2.464952, 1, 0, 0, 1, 1,
-0.2505329, -0.7118444, -3.594885, 0, 0, 0, 1, 1,
-0.2504355, 0.2902567, -1.583894, 0, 0, 0, 1, 1,
-0.2441617, 0.003482147, -1.355466, 0, 0, 0, 1, 1,
-0.2439946, -0.5929952, -4.655144, 0, 0, 0, 1, 1,
-0.2413169, 0.4539284, 0.5142635, 0, 0, 0, 1, 1,
-0.240098, -2.130266, -3.666797, 0, 0, 0, 1, 1,
-0.2398542, 1.250695, 0.7051504, 0, 0, 0, 1, 1,
-0.2367257, 0.6512658, -1.523845, 1, 1, 1, 1, 1,
-0.2282643, -1.226721, -4.72492, 1, 1, 1, 1, 1,
-0.2169397, -2.83549, -3.441814, 1, 1, 1, 1, 1,
-0.2153511, 0.9965591, 0.1676313, 1, 1, 1, 1, 1,
-0.2107192, 0.3065844, -0.1980478, 1, 1, 1, 1, 1,
-0.2085429, 0.2533054, 1.066207, 1, 1, 1, 1, 1,
-0.178699, -0.1807852, -2.54099, 1, 1, 1, 1, 1,
-0.1750951, 1.003943, 0.7280289, 1, 1, 1, 1, 1,
-0.1717883, 0.1592142, -0.6274087, 1, 1, 1, 1, 1,
-0.1652288, -0.4406335, -5.279367, 1, 1, 1, 1, 1,
-0.1643136, -1.087068, -2.518703, 1, 1, 1, 1, 1,
-0.1637437, 0.6718298, 0.9295869, 1, 1, 1, 1, 1,
-0.1633791, -0.4449753, -1.38357, 1, 1, 1, 1, 1,
-0.1624916, 0.4910949, -0.1285272, 1, 1, 1, 1, 1,
-0.1621761, 1.27512, -2.195916, 1, 1, 1, 1, 1,
-0.1616317, -0.6010796, -2.342072, 0, 0, 1, 1, 1,
-0.1541269, -0.7357311, -2.223336, 1, 0, 0, 1, 1,
-0.144942, -1.563049, -4.364145, 1, 0, 0, 1, 1,
-0.1411807, -0.3558152, -2.230203, 1, 0, 0, 1, 1,
-0.137968, 0.7272285, 1.134348, 1, 0, 0, 1, 1,
-0.1359974, 0.5173775, -0.1684203, 1, 0, 0, 1, 1,
-0.1346879, 2.053715, -1.417481, 0, 0, 0, 1, 1,
-0.134604, -1.167495, -3.665044, 0, 0, 0, 1, 1,
-0.1344352, 0.03732473, -2.417601, 0, 0, 0, 1, 1,
-0.1300247, 0.558448, -0.2261328, 0, 0, 0, 1, 1,
-0.1230712, -1.253008, -3.431232, 0, 0, 0, 1, 1,
-0.1137451, 0.9224908, 0.1623811, 0, 0, 0, 1, 1,
-0.1131411, 0.06992065, -1.138657, 0, 0, 0, 1, 1,
-0.1128064, -0.2107477, -3.040924, 1, 1, 1, 1, 1,
-0.112551, -2.001765, -3.33478, 1, 1, 1, 1, 1,
-0.1021993, -1.086723, -2.485653, 1, 1, 1, 1, 1,
-0.1003935, 0.5220101, 0.05435892, 1, 1, 1, 1, 1,
-0.1000733, 0.5658665, -0.9542999, 1, 1, 1, 1, 1,
-0.098205, 1.417156, -1.281445, 1, 1, 1, 1, 1,
-0.09433457, 0.843936, -1.245863, 1, 1, 1, 1, 1,
-0.08955531, -1.188154, -5.148526, 1, 1, 1, 1, 1,
-0.08872847, 0.1270444, -2.213838, 1, 1, 1, 1, 1,
-0.0885684, -1.310581, -2.266704, 1, 1, 1, 1, 1,
-0.08214241, -0.8335707, -2.435587, 1, 1, 1, 1, 1,
-0.08122805, -0.7160724, -2.442192, 1, 1, 1, 1, 1,
-0.07923628, 0.1995766, -1.357574, 1, 1, 1, 1, 1,
-0.07907932, -0.2607285, -3.517743, 1, 1, 1, 1, 1,
-0.07349703, 0.2678631, 1.367421, 1, 1, 1, 1, 1,
-0.07217896, -0.8178028, -2.068567, 0, 0, 1, 1, 1,
-0.06749992, -1.479953, -4.822506, 1, 0, 0, 1, 1,
-0.06661116, 0.247273, 1.114383, 1, 0, 0, 1, 1,
-0.06481145, 1.284774, -0.505646, 1, 0, 0, 1, 1,
-0.06376605, 0.7498962, 0.2129306, 1, 0, 0, 1, 1,
-0.06267422, -0.0503231, -2.983699, 1, 0, 0, 1, 1,
-0.06130137, 0.9760615, -1.492506, 0, 0, 0, 1, 1,
-0.060917, -0.4342046, -3.087168, 0, 0, 0, 1, 1,
-0.06087435, 0.767299, -0.9164413, 0, 0, 0, 1, 1,
-0.05736622, -0.2178013, -2.728563, 0, 0, 0, 1, 1,
-0.05582538, 0.3220654, 1.71248, 0, 0, 0, 1, 1,
-0.05537301, -0.04003072, -0.7708732, 0, 0, 0, 1, 1,
-0.05271614, -0.7367454, -3.269075, 0, 0, 0, 1, 1,
-0.04586388, 0.1611104, -0.5559003, 1, 1, 1, 1, 1,
-0.04228375, 0.4212256, -0.6468115, 1, 1, 1, 1, 1,
-0.04110126, 0.809793, 1.373058, 1, 1, 1, 1, 1,
-0.03712395, 1.341558, 2.058459, 1, 1, 1, 1, 1,
-0.02973647, 1.364254, -0.5973749, 1, 1, 1, 1, 1,
-0.02560314, -0.09714946, -2.716617, 1, 1, 1, 1, 1,
-0.02355278, 0.1977256, 0.14181, 1, 1, 1, 1, 1,
-0.02243672, 0.721621, -0.307865, 1, 1, 1, 1, 1,
-0.02191736, -0.4553415, -3.076164, 1, 1, 1, 1, 1,
-0.02157499, -0.05365524, -1.151004, 1, 1, 1, 1, 1,
-0.02090134, 1.210982, 0.335977, 1, 1, 1, 1, 1,
-0.01407406, -0.7037207, -3.749269, 1, 1, 1, 1, 1,
-0.01230952, 0.735822, 0.4177778, 1, 1, 1, 1, 1,
-0.01064973, 0.4630657, 0.03922319, 1, 1, 1, 1, 1,
-0.006761032, -1.216753, -3.862363, 1, 1, 1, 1, 1,
-0.006411708, -0.1004585, -4.839883, 0, 0, 1, 1, 1,
-0.003379414, -2.608618, -3.065427, 1, 0, 0, 1, 1,
-0.00105155, -0.4290648, -2.548894, 1, 0, 0, 1, 1,
0.003355315, 0.2677769, -0.2321722, 1, 0, 0, 1, 1,
0.005452835, 1.064894, 0.09367666, 1, 0, 0, 1, 1,
0.006899277, -0.9734498, 2.618302, 1, 0, 0, 1, 1,
0.007396575, -2.012453, 2.354317, 0, 0, 0, 1, 1,
0.008814747, 1.785291, -0.7617056, 0, 0, 0, 1, 1,
0.009021305, -0.470679, 4.023545, 0, 0, 0, 1, 1,
0.01206998, -0.6779379, 2.847093, 0, 0, 0, 1, 1,
0.01445002, -1.214979, 4.634921, 0, 0, 0, 1, 1,
0.01574275, 1.055279, -1.725868, 0, 0, 0, 1, 1,
0.01973153, -0.9589241, 3.145894, 0, 0, 0, 1, 1,
0.02120408, 0.8662956, -1.236567, 1, 1, 1, 1, 1,
0.02511719, 0.4194477, -1.330549, 1, 1, 1, 1, 1,
0.030288, 0.8351272, 0.0300914, 1, 1, 1, 1, 1,
0.03191138, -0.5034624, 2.342942, 1, 1, 1, 1, 1,
0.03215127, -1.055907, 4.356415, 1, 1, 1, 1, 1,
0.03313362, 0.4905524, -1.146933, 1, 1, 1, 1, 1,
0.03425343, -0.04598007, 2.730531, 1, 1, 1, 1, 1,
0.03443491, -0.9133366, 4.524876, 1, 1, 1, 1, 1,
0.03478666, 0.9498072, 0.1051115, 1, 1, 1, 1, 1,
0.0354816, -2.001461, 4.77734, 1, 1, 1, 1, 1,
0.03562957, -1.124709, 2.833878, 1, 1, 1, 1, 1,
0.03701631, -0.7431782, 3.526848, 1, 1, 1, 1, 1,
0.03968791, 2.301714, 0.8757296, 1, 1, 1, 1, 1,
0.04030063, -0.1238689, 3.42976, 1, 1, 1, 1, 1,
0.04167278, -0.4281792, 1.949157, 1, 1, 1, 1, 1,
0.04393007, -1.935154, 3.13633, 0, 0, 1, 1, 1,
0.04559112, 1.753352, 0.4461294, 1, 0, 0, 1, 1,
0.04703708, -2.380493, 2.893703, 1, 0, 0, 1, 1,
0.04913658, 1.000309, 0.6822668, 1, 0, 0, 1, 1,
0.04960162, -0.3051058, 4.011961, 1, 0, 0, 1, 1,
0.05013779, -0.01480291, 0.7981719, 1, 0, 0, 1, 1,
0.05308766, 0.01092525, 2.206119, 0, 0, 0, 1, 1,
0.05401307, -0.4929743, 3.657058, 0, 0, 0, 1, 1,
0.05836478, 0.2924417, -0.8119051, 0, 0, 0, 1, 1,
0.06173486, 1.536628, 0.8320069, 0, 0, 0, 1, 1,
0.06235112, -1.374823, 3.570836, 0, 0, 0, 1, 1,
0.06236141, -0.8179953, 2.561746, 0, 0, 0, 1, 1,
0.06330812, -0.9360856, 2.843269, 0, 0, 0, 1, 1,
0.06349197, -0.07356062, 2.542344, 1, 1, 1, 1, 1,
0.0651893, -0.9395023, 2.655927, 1, 1, 1, 1, 1,
0.06854188, 0.8202536, 1.976388, 1, 1, 1, 1, 1,
0.06867891, 1.158402, 1.248632, 1, 1, 1, 1, 1,
0.07078618, -2.3541, 4.461287, 1, 1, 1, 1, 1,
0.07358775, -0.7287343, 3.9237, 1, 1, 1, 1, 1,
0.0760877, 0.8267844, 1.122432, 1, 1, 1, 1, 1,
0.0826188, 0.847113, 0.5593392, 1, 1, 1, 1, 1,
0.08389097, -0.2066268, 2.016011, 1, 1, 1, 1, 1,
0.08715991, 0.3749896, 0.2728577, 1, 1, 1, 1, 1,
0.08855184, -2.105747, 3.441925, 1, 1, 1, 1, 1,
0.09212472, -1.312741, 3.279908, 1, 1, 1, 1, 1,
0.09388312, 1.128824, 1.087589, 1, 1, 1, 1, 1,
0.1005421, 1.208039, -0.02260818, 1, 1, 1, 1, 1,
0.1024162, 1.009138, -0.9309063, 1, 1, 1, 1, 1,
0.1042502, -1.043892, 3.316644, 0, 0, 1, 1, 1,
0.104706, 2.644811, -0.428095, 1, 0, 0, 1, 1,
0.1061833, 1.104874, -0.6354936, 1, 0, 0, 1, 1,
0.1117946, -2.050556, 1.993021, 1, 0, 0, 1, 1,
0.1170076, 0.2502011, 1.378217, 1, 0, 0, 1, 1,
0.1198235, -0.8347176, 3.280863, 1, 0, 0, 1, 1,
0.1214232, 0.6243994, -1.958172, 0, 0, 0, 1, 1,
0.1218506, 1.176464, 0.3484256, 0, 0, 0, 1, 1,
0.1232796, 0.5000637, 0.9795544, 0, 0, 0, 1, 1,
0.1259585, -0.4198484, 3.489515, 0, 0, 0, 1, 1,
0.128425, -1.029665, 1.701941, 0, 0, 0, 1, 1,
0.1305581, -1.291564, 3.314803, 0, 0, 0, 1, 1,
0.133742, -0.03213474, 1.270389, 0, 0, 0, 1, 1,
0.13759, -0.3531668, 2.950046, 1, 1, 1, 1, 1,
0.1399379, 0.7168076, -0.202677, 1, 1, 1, 1, 1,
0.1473406, 1.068673, -0.2127662, 1, 1, 1, 1, 1,
0.1473972, -1.006954, 2.618044, 1, 1, 1, 1, 1,
0.1506246, 1.018065, -0.1989305, 1, 1, 1, 1, 1,
0.1511475, -0.215036, 1.321908, 1, 1, 1, 1, 1,
0.1536135, 0.07427849, -0.2181736, 1, 1, 1, 1, 1,
0.1568601, 0.1911304, 0.7253318, 1, 1, 1, 1, 1,
0.1595094, 0.6088206, -1.184761, 1, 1, 1, 1, 1,
0.1626693, 0.4312713, 0.009884915, 1, 1, 1, 1, 1,
0.1639208, -1.629784, 3.677562, 1, 1, 1, 1, 1,
0.164693, -0.413218, 1.137718, 1, 1, 1, 1, 1,
0.1648023, -0.3257387, 1.547911, 1, 1, 1, 1, 1,
0.16634, 0.9348361, 1.131855, 1, 1, 1, 1, 1,
0.1673358, -0.8638256, 1.26484, 1, 1, 1, 1, 1,
0.1673671, -0.3289626, 3.325412, 0, 0, 1, 1, 1,
0.168688, 0.6530635, -1.209103, 1, 0, 0, 1, 1,
0.1715602, -0.8952018, 4.258578, 1, 0, 0, 1, 1,
0.1733021, 0.3886328, -0.1771439, 1, 0, 0, 1, 1,
0.1767379, 0.1494153, 1.773532, 1, 0, 0, 1, 1,
0.1823257, -0.6582534, 4.524898, 1, 0, 0, 1, 1,
0.1903557, -0.7506288, 3.167185, 0, 0, 0, 1, 1,
0.1922555, 0.1387644, 0.8658742, 0, 0, 0, 1, 1,
0.1923318, 1.068952, -2.183307, 0, 0, 0, 1, 1,
0.1939447, 1.106524, -0.4264366, 0, 0, 0, 1, 1,
0.195347, 0.02956387, 2.549027, 0, 0, 0, 1, 1,
0.1974945, -2.029104, 3.18254, 0, 0, 0, 1, 1,
0.1998968, 1.05367, 0.2186641, 0, 0, 0, 1, 1,
0.2022547, 0.1481753, 0.9891263, 1, 1, 1, 1, 1,
0.2073724, -1.551259, 2.336833, 1, 1, 1, 1, 1,
0.2083989, 0.9902561, 2.130504, 1, 1, 1, 1, 1,
0.2086923, -0.05601361, 2.63184, 1, 1, 1, 1, 1,
0.2127157, -0.1749786, 2.866102, 1, 1, 1, 1, 1,
0.2159009, -1.023303, 2.047482, 1, 1, 1, 1, 1,
0.2202518, 0.1606287, 1.592119, 1, 1, 1, 1, 1,
0.225252, 0.2946447, 1.160647, 1, 1, 1, 1, 1,
0.2262726, -0.7843642, 1.935219, 1, 1, 1, 1, 1,
0.2328411, -1.467298, 4.443738, 1, 1, 1, 1, 1,
0.2331033, 1.857953, -0.2798963, 1, 1, 1, 1, 1,
0.2355594, 0.2148992, 1.351587, 1, 1, 1, 1, 1,
0.2374127, -0.999707, 3.192649, 1, 1, 1, 1, 1,
0.2394218, -0.6706198, 1.625293, 1, 1, 1, 1, 1,
0.2408243, -0.3799487, 2.177044, 1, 1, 1, 1, 1,
0.2457067, -1.658897, 0.8950502, 0, 0, 1, 1, 1,
0.2482869, 0.1879119, 0.3729911, 1, 0, 0, 1, 1,
0.2495138, -0.07823078, 0.1516792, 1, 0, 0, 1, 1,
0.2501478, -2.635003, 4.105128, 1, 0, 0, 1, 1,
0.2608915, -2.348034, 1.844242, 1, 0, 0, 1, 1,
0.2615986, 0.8498785, 0.2452476, 1, 0, 0, 1, 1,
0.2647659, 0.6957921, 0.7765049, 0, 0, 0, 1, 1,
0.2657782, -0.4011967, 3.498225, 0, 0, 0, 1, 1,
0.2657843, -0.8254824, 4.235926, 0, 0, 0, 1, 1,
0.2753885, -0.4889329, 1.642808, 0, 0, 0, 1, 1,
0.2757677, 1.268752, 2.389546, 0, 0, 0, 1, 1,
0.2759421, -0.3043472, 2.230689, 0, 0, 0, 1, 1,
0.2808814, 0.3073092, 0.7360697, 0, 0, 0, 1, 1,
0.282373, 0.2663064, -0.1758558, 1, 1, 1, 1, 1,
0.2834934, 0.29109, -0.4147336, 1, 1, 1, 1, 1,
0.2879808, 0.3570344, 0.03341173, 1, 1, 1, 1, 1,
0.288461, 0.6836897, 1.648662, 1, 1, 1, 1, 1,
0.2890725, 1.173076, 0.3926123, 1, 1, 1, 1, 1,
0.2893489, 0.1205172, 1.179289, 1, 1, 1, 1, 1,
0.2899682, -0.3228458, 2.132035, 1, 1, 1, 1, 1,
0.2925611, 0.416498, 1.118814, 1, 1, 1, 1, 1,
0.2991477, 1.048482, 0.5960366, 1, 1, 1, 1, 1,
0.304349, 0.7144216, 0.04186372, 1, 1, 1, 1, 1,
0.3054259, -1.439174, 2.727345, 1, 1, 1, 1, 1,
0.3099608, 0.5935886, 0.4857288, 1, 1, 1, 1, 1,
0.3106822, -2.525735, 3.72163, 1, 1, 1, 1, 1,
0.3174434, 0.5534131, 0.1462013, 1, 1, 1, 1, 1,
0.321922, -0.2644844, 2.202602, 1, 1, 1, 1, 1,
0.3258285, 0.0134277, 0.5749751, 0, 0, 1, 1, 1,
0.3318884, -2.890594, 3.851574, 1, 0, 0, 1, 1,
0.336691, 2.681743, -0.1376648, 1, 0, 0, 1, 1,
0.339645, -0.546231, 2.780809, 1, 0, 0, 1, 1,
0.3398234, -0.9740562, 3.613457, 1, 0, 0, 1, 1,
0.3423121, 0.7446972, 0.7053261, 1, 0, 0, 1, 1,
0.3455732, -0.4270864, 1.163459, 0, 0, 0, 1, 1,
0.3488572, -0.5191777, 3.38284, 0, 0, 0, 1, 1,
0.3488936, 0.2049107, 2.370896, 0, 0, 0, 1, 1,
0.3506787, 1.452867, 0.7275668, 0, 0, 0, 1, 1,
0.3516907, -1.545592, 1.565327, 0, 0, 0, 1, 1,
0.3527996, 0.4909736, -0.2501255, 0, 0, 0, 1, 1,
0.3538318, -0.8017099, 2.910122, 0, 0, 0, 1, 1,
0.3544177, 1.010316, -1.348443, 1, 1, 1, 1, 1,
0.3580379, 0.1452507, 2.820849, 1, 1, 1, 1, 1,
0.3606035, 0.5682879, 0.1484773, 1, 1, 1, 1, 1,
0.3649179, 0.01345885, 1.115072, 1, 1, 1, 1, 1,
0.3660703, -1.678997, 4.922077, 1, 1, 1, 1, 1,
0.3665017, -1.55602, 2.147538, 1, 1, 1, 1, 1,
0.369592, -2.223548, 1.438336, 1, 1, 1, 1, 1,
0.3702582, 1.126986, -1.583402, 1, 1, 1, 1, 1,
0.3753149, -1.077768, 2.634212, 1, 1, 1, 1, 1,
0.3768093, 0.5173704, 0.03354342, 1, 1, 1, 1, 1,
0.3794263, 0.120352, 0.9693606, 1, 1, 1, 1, 1,
0.3800424, -0.5401885, 2.796411, 1, 1, 1, 1, 1,
0.3941413, 1.128835, -0.1248952, 1, 1, 1, 1, 1,
0.3941761, 0.6091352, -2.096052, 1, 1, 1, 1, 1,
0.3954623, -0.7681441, 2.270396, 1, 1, 1, 1, 1,
0.3954669, -1.461685, 4.668311, 0, 0, 1, 1, 1,
0.4002852, -0.4832707, 2.5162, 1, 0, 0, 1, 1,
0.406137, 0.6501877, 0.725534, 1, 0, 0, 1, 1,
0.4138431, -1.352503, 2.391105, 1, 0, 0, 1, 1,
0.4211017, 0.158179, 1.785862, 1, 0, 0, 1, 1,
0.4227826, -0.861254, 2.846859, 1, 0, 0, 1, 1,
0.4250668, -0.02421243, 1.27481, 0, 0, 0, 1, 1,
0.4284026, -0.9515878, 4.177074, 0, 0, 0, 1, 1,
0.429139, 0.8947256, 1.255821, 0, 0, 0, 1, 1,
0.4296972, -1.035808, 3.788913, 0, 0, 0, 1, 1,
0.4317301, 0.3535143, -1.240211, 0, 0, 0, 1, 1,
0.4402204, -0.5178408, 3.429858, 0, 0, 0, 1, 1,
0.4420798, 1.71021, 0.4031608, 0, 0, 0, 1, 1,
0.4438253, -0.5559562, 0.7858426, 1, 1, 1, 1, 1,
0.4438847, -0.6496426, 0.637042, 1, 1, 1, 1, 1,
0.4464861, -0.4047118, 2.245162, 1, 1, 1, 1, 1,
0.4485588, 2.277412, 1.699257, 1, 1, 1, 1, 1,
0.4510684, 0.8354593, 0.8947811, 1, 1, 1, 1, 1,
0.4530039, 0.9880198, -0.7916615, 1, 1, 1, 1, 1,
0.4547647, -1.141795, 3.033437, 1, 1, 1, 1, 1,
0.4556094, -0.8898136, 4.27581, 1, 1, 1, 1, 1,
0.4601943, -1.038888, 4.168409, 1, 1, 1, 1, 1,
0.4602492, 1.162721, 1.023578, 1, 1, 1, 1, 1,
0.4610971, -0.4355877, 2.352265, 1, 1, 1, 1, 1,
0.4632857, -0.2702495, 2.176281, 1, 1, 1, 1, 1,
0.4646573, 0.1268306, 1.562233, 1, 1, 1, 1, 1,
0.464736, -0.1126634, 0.5197096, 1, 1, 1, 1, 1,
0.4652042, 0.9161999, -0.6696308, 1, 1, 1, 1, 1,
0.4691085, -1.581159, 3.222575, 0, 0, 1, 1, 1,
0.4708082, -1.089053, 1.931626, 1, 0, 0, 1, 1,
0.4709467, 0.892161, -0.4104009, 1, 0, 0, 1, 1,
0.4714974, -0.720663, 0.489788, 1, 0, 0, 1, 1,
0.4732032, 0.692147, 0.6595007, 1, 0, 0, 1, 1,
0.4796161, 2.415212, 1.224212, 1, 0, 0, 1, 1,
0.4855739, 0.7491777, 0.3308893, 0, 0, 0, 1, 1,
0.4918316, 0.5099914, 1.419643, 0, 0, 0, 1, 1,
0.4922782, 0.1791913, 0.8457041, 0, 0, 0, 1, 1,
0.4927544, -0.7428113, 0.9534187, 0, 0, 0, 1, 1,
0.4932908, 0.6603497, 0.1102105, 0, 0, 0, 1, 1,
0.4963573, -0.6517602, 2.153644, 0, 0, 0, 1, 1,
0.4963969, -1.257689, 3.437768, 0, 0, 0, 1, 1,
0.4971806, -0.2897421, 0.9845632, 1, 1, 1, 1, 1,
0.4987327, 0.5605224, -0.1356938, 1, 1, 1, 1, 1,
0.5001544, 0.6817729, -0.1160614, 1, 1, 1, 1, 1,
0.5005682, -1.396786, 1.121168, 1, 1, 1, 1, 1,
0.5011726, 0.6604711, -0.5017144, 1, 1, 1, 1, 1,
0.5100049, 0.3148626, 1.615455, 1, 1, 1, 1, 1,
0.5123755, 0.3331068, 0.3759871, 1, 1, 1, 1, 1,
0.5200943, 0.06954268, 0.8455737, 1, 1, 1, 1, 1,
0.5203491, -0.8996645, 2.532881, 1, 1, 1, 1, 1,
0.5217362, -0.9777886, 3.092701, 1, 1, 1, 1, 1,
0.5253102, -0.1893805, 2.201123, 1, 1, 1, 1, 1,
0.5299271, 0.4550017, 0.629733, 1, 1, 1, 1, 1,
0.5336428, -0.7762744, 2.808067, 1, 1, 1, 1, 1,
0.5357264, 0.5102554, -0.8174444, 1, 1, 1, 1, 1,
0.5417296, -1.30967, 3.108573, 1, 1, 1, 1, 1,
0.5537715, -0.9527799, 2.605922, 0, 0, 1, 1, 1,
0.554144, -0.3668573, 1.015353, 1, 0, 0, 1, 1,
0.5542506, 1.169825, 2.046081, 1, 0, 0, 1, 1,
0.5632455, -1.079985, 3.113415, 1, 0, 0, 1, 1,
0.5658892, 1.151235, 0.4635631, 1, 0, 0, 1, 1,
0.5675076, 1.312161, -0.1139766, 1, 0, 0, 1, 1,
0.5676195, 0.1860044, 1.546239, 0, 0, 0, 1, 1,
0.5679522, 0.9172779, 2.070039, 0, 0, 0, 1, 1,
0.5699967, 1.900267, -0.8284315, 0, 0, 0, 1, 1,
0.571368, -1.595823, 2.737296, 0, 0, 0, 1, 1,
0.5735645, 1.922565, 0.398977, 0, 0, 0, 1, 1,
0.5757136, -1.709158, 2.666469, 0, 0, 0, 1, 1,
0.5794466, 0.604996, 2.716911, 0, 0, 0, 1, 1,
0.5802217, -0.1320453, 1.436421, 1, 1, 1, 1, 1,
0.5837542, -1.230075, 4.326635, 1, 1, 1, 1, 1,
0.5865992, 0.6124936, 1.470414, 1, 1, 1, 1, 1,
0.5867053, -0.0550383, 2.357862, 1, 1, 1, 1, 1,
0.5870946, -0.3376217, 0.5908172, 1, 1, 1, 1, 1,
0.5872922, 0.005951346, 1.438731, 1, 1, 1, 1, 1,
0.5947555, 1.516614, 0.1326403, 1, 1, 1, 1, 1,
0.5958166, 0.6427338, 0.2148369, 1, 1, 1, 1, 1,
0.59725, 0.795955, -1.726931, 1, 1, 1, 1, 1,
0.6013901, 0.6515097, 1.341036, 1, 1, 1, 1, 1,
0.6032835, -1.724256, 3.224049, 1, 1, 1, 1, 1,
0.6037289, -0.9184893, 4.267464, 1, 1, 1, 1, 1,
0.6144375, 0.306102, 1.256683, 1, 1, 1, 1, 1,
0.6151309, -0.695516, 2.909431, 1, 1, 1, 1, 1,
0.6152092, 0.09805424, -0.3172597, 1, 1, 1, 1, 1,
0.6170793, 1.458482, -0.983503, 0, 0, 1, 1, 1,
0.6215798, -0.8376328, 4.018325, 1, 0, 0, 1, 1,
0.6243418, -1.091815, 2.022747, 1, 0, 0, 1, 1,
0.6293394, -0.6528725, 2.666464, 1, 0, 0, 1, 1,
0.6343409, 0.24339, 3.125372, 1, 0, 0, 1, 1,
0.636158, 0.8795782, 1.869306, 1, 0, 0, 1, 1,
0.6413733, 0.9053952, 1.508909, 0, 0, 0, 1, 1,
0.6436559, 0.3667507, 1.006434, 0, 0, 0, 1, 1,
0.6441604, 0.8320569, 0.05439513, 0, 0, 0, 1, 1,
0.6556181, -1.406049, 2.783965, 0, 0, 0, 1, 1,
0.6627619, 0.9517795, -0.447123, 0, 0, 0, 1, 1,
0.6631035, 1.34724, -0.4905401, 0, 0, 0, 1, 1,
0.6639723, 0.3783165, 2.987818, 0, 0, 0, 1, 1,
0.6650639, -0.2644189, 1.460781, 1, 1, 1, 1, 1,
0.6675627, 0.4477759, -1.601656, 1, 1, 1, 1, 1,
0.6682023, 0.2488185, 2.381832, 1, 1, 1, 1, 1,
0.6696843, 1.707302, -0.601954, 1, 1, 1, 1, 1,
0.6743609, 0.8171093, -0.4029049, 1, 1, 1, 1, 1,
0.6764473, -0.8556297, 4.716292, 1, 1, 1, 1, 1,
0.6826951, 0.8663617, 0.9432878, 1, 1, 1, 1, 1,
0.6859688, 0.3618388, 1.191192, 1, 1, 1, 1, 1,
0.6872659, 1.804035, 1.161591, 1, 1, 1, 1, 1,
0.688632, -0.00490672, 1.949287, 1, 1, 1, 1, 1,
0.689395, -0.7717128, 0.7022217, 1, 1, 1, 1, 1,
0.6975157, 0.06243428, 1.450028, 1, 1, 1, 1, 1,
0.697912, -0.005880081, -0.1415218, 1, 1, 1, 1, 1,
0.7012339, -0.09308997, 1.739551, 1, 1, 1, 1, 1,
0.7014239, 0.05041332, 1.10482, 1, 1, 1, 1, 1,
0.7098197, -0.6369345, 2.713899, 0, 0, 1, 1, 1,
0.7107159, -0.1184036, 1.618508, 1, 0, 0, 1, 1,
0.7110268, 1.070826, 0.9224131, 1, 0, 0, 1, 1,
0.7127314, 0.02758384, 1.232913, 1, 0, 0, 1, 1,
0.7158509, -0.4360068, 3.648574, 1, 0, 0, 1, 1,
0.718505, 0.916709, 0.828498, 1, 0, 0, 1, 1,
0.7240268, 0.007160508, 2.649637, 0, 0, 0, 1, 1,
0.724086, 0.5217771, 0.7884669, 0, 0, 0, 1, 1,
0.7257275, -1.295135, 2.810462, 0, 0, 0, 1, 1,
0.7263831, -1.461037, 2.494764, 0, 0, 0, 1, 1,
0.7306108, -0.6393973, 2.178904, 0, 0, 0, 1, 1,
0.7323375, -0.305217, 2.991439, 0, 0, 0, 1, 1,
0.7335895, 0.6284677, 1.582173, 0, 0, 0, 1, 1,
0.7343075, -0.9464625, 2.299141, 1, 1, 1, 1, 1,
0.7365999, 0.3949134, 1.80417, 1, 1, 1, 1, 1,
0.7410193, 0.08391819, 0.781064, 1, 1, 1, 1, 1,
0.7413918, 1.819461, -0.09797581, 1, 1, 1, 1, 1,
0.7419205, 1.613691, 1.974191, 1, 1, 1, 1, 1,
0.7427046, -0.6093577, 3.326599, 1, 1, 1, 1, 1,
0.7430527, -0.342451, 0.08100399, 1, 1, 1, 1, 1,
0.7448612, -0.8179623, 3.829197, 1, 1, 1, 1, 1,
0.7539046, 0.303603, 1.904683, 1, 1, 1, 1, 1,
0.7679118, -0.9946476, 4.655635, 1, 1, 1, 1, 1,
0.767961, 0.3120064, -0.2511336, 1, 1, 1, 1, 1,
0.7691163, -0.7427504, 1.530155, 1, 1, 1, 1, 1,
0.7692304, 0.5814406, 3.692212, 1, 1, 1, 1, 1,
0.7713007, -1.04022, 3.422426, 1, 1, 1, 1, 1,
0.7713076, 0.6493678, 2.170133, 1, 1, 1, 1, 1,
0.7867005, 0.3661678, 0.07726429, 0, 0, 1, 1, 1,
0.7886069, 0.08531915, -0.7922972, 1, 0, 0, 1, 1,
0.7907216, -0.3633249, 1.755582, 1, 0, 0, 1, 1,
0.7922112, -0.9343894, 2.121808, 1, 0, 0, 1, 1,
0.7946812, 1.883533, -0.005769137, 1, 0, 0, 1, 1,
0.7985706, 0.6812429, 0.6986951, 1, 0, 0, 1, 1,
0.798641, -0.8001016, 1.191751, 0, 0, 0, 1, 1,
0.809525, 0.01688773, 1.941009, 0, 0, 0, 1, 1,
0.8141785, 1.099176, 0.6317521, 0, 0, 0, 1, 1,
0.8238667, -0.7206015, 1.217437, 0, 0, 0, 1, 1,
0.8282987, -0.02511307, 3.343199, 0, 0, 0, 1, 1,
0.8387305, 0.4974632, 0.3217989, 0, 0, 0, 1, 1,
0.8417551, -0.2828632, 3.182527, 0, 0, 0, 1, 1,
0.8430783, 0.3179768, 2.7112, 1, 1, 1, 1, 1,
0.8447489, 0.6354722, 1.681722, 1, 1, 1, 1, 1,
0.8466032, 1.362073, -0.0002243629, 1, 1, 1, 1, 1,
0.8521596, 0.8576023, 1.570641, 1, 1, 1, 1, 1,
0.8599671, 0.444663, 1.870283, 1, 1, 1, 1, 1,
0.8647088, 0.2549285, 1.444216, 1, 1, 1, 1, 1,
0.8671975, -1.406644, 2.796263, 1, 1, 1, 1, 1,
0.871079, -1.670443, 2.616988, 1, 1, 1, 1, 1,
0.8715456, -0.3795161, 1.842419, 1, 1, 1, 1, 1,
0.8723533, 0.1520108, 2.524671, 1, 1, 1, 1, 1,
0.8753366, -0.2578863, 1.155199, 1, 1, 1, 1, 1,
0.880504, 0.286645, 1.88374, 1, 1, 1, 1, 1,
0.8806205, -0.7849769, 0.9856575, 1, 1, 1, 1, 1,
0.8842856, 0.5433558, 1.554581, 1, 1, 1, 1, 1,
0.885152, 0.615099, 1.276523, 1, 1, 1, 1, 1,
0.8853528, 1.600343, -1.058447, 0, 0, 1, 1, 1,
0.8907833, -1.929342, 3.459732, 1, 0, 0, 1, 1,
0.8919705, 0.361098, 1.866164, 1, 0, 0, 1, 1,
0.8921577, -1.923984, 3.30024, 1, 0, 0, 1, 1,
0.8938519, 0.02722745, 1.82196, 1, 0, 0, 1, 1,
0.8962225, 0.4867932, 0.6673708, 1, 0, 0, 1, 1,
0.8969953, 0.8588811, 1.538389, 0, 0, 0, 1, 1,
0.8972368, -1.405624, 0.7239012, 0, 0, 0, 1, 1,
0.9002649, 0.480814, 3.557771, 0, 0, 0, 1, 1,
0.9046103, -0.374744, 3.938336, 0, 0, 0, 1, 1,
0.9087654, 1.966458, 0.7818962, 0, 0, 0, 1, 1,
0.9115793, 0.8156331, 1.44015, 0, 0, 0, 1, 1,
0.9151867, 0.5902901, 2.427088, 0, 0, 0, 1, 1,
0.915278, 1.133746, 0.3828038, 1, 1, 1, 1, 1,
0.9156325, -1.397674, 1.170244, 1, 1, 1, 1, 1,
0.9197499, 1.023006, 1.664616, 1, 1, 1, 1, 1,
0.9223917, 1.774849, 1.071364, 1, 1, 1, 1, 1,
0.9325566, 1.983106, -0.1697404, 1, 1, 1, 1, 1,
0.9370669, -0.8202305, 3.551752, 1, 1, 1, 1, 1,
0.9387693, 1.546351, 0.07445151, 1, 1, 1, 1, 1,
0.9409095, -0.2519431, 2.873986, 1, 1, 1, 1, 1,
0.9425487, 1.149685, -0.8310062, 1, 1, 1, 1, 1,
0.9430371, -0.4082107, 2.402201, 1, 1, 1, 1, 1,
0.9450612, -0.7628211, 3.167695, 1, 1, 1, 1, 1,
0.9515797, -1.418209, 2.020834, 1, 1, 1, 1, 1,
0.9523948, 0.9948465, 0.3873104, 1, 1, 1, 1, 1,
0.9526227, -0.1101269, 0.262859, 1, 1, 1, 1, 1,
0.9699582, -0.4614304, 2.007134, 1, 1, 1, 1, 1,
0.9799567, 0.03305332, 0.8287814, 0, 0, 1, 1, 1,
0.9806267, -1.209803, 1.723208, 1, 0, 0, 1, 1,
0.9925862, 0.5299011, 1.539922, 1, 0, 0, 1, 1,
0.9980738, 0.06688377, 2.825108, 1, 0, 0, 1, 1,
0.9982198, 0.6396922, 1.049098, 1, 0, 0, 1, 1,
1.000667, -1.166875, 1.710832, 1, 0, 0, 1, 1,
1.003219, 1.568611, -0.4354181, 0, 0, 0, 1, 1,
1.006034, 0.8991179, 0.7543849, 0, 0, 0, 1, 1,
1.006503, 0.4334782, 0.5796099, 0, 0, 0, 1, 1,
1.007882, 2.172598, 0.7036321, 0, 0, 0, 1, 1,
1.009318, -1.486947, 0.4283154, 0, 0, 0, 1, 1,
1.0107, -1.949424, 0.7649748, 0, 0, 0, 1, 1,
1.013641, 2.003206, 1.255214, 0, 0, 0, 1, 1,
1.015344, 0.203189, 1.560686, 1, 1, 1, 1, 1,
1.016939, 0.8232003, 0.6940598, 1, 1, 1, 1, 1,
1.018888, -0.4049262, 2.309365, 1, 1, 1, 1, 1,
1.025433, 0.05753457, 2.622667, 1, 1, 1, 1, 1,
1.027422, -0.0742716, 1.834162, 1, 1, 1, 1, 1,
1.029434, -0.03106521, 1.211, 1, 1, 1, 1, 1,
1.031233, -1.182725, 2.517803, 1, 1, 1, 1, 1,
1.031538, 0.4071051, 0.1955166, 1, 1, 1, 1, 1,
1.032819, 1.764193, 0.1968659, 1, 1, 1, 1, 1,
1.038655, 0.09335642, -0.5319821, 1, 1, 1, 1, 1,
1.038822, 0.6422858, 2.165218, 1, 1, 1, 1, 1,
1.041237, 1.559473, 1.646536, 1, 1, 1, 1, 1,
1.0437, -0.7788221, 2.703788, 1, 1, 1, 1, 1,
1.050976, -0.3262518, 1.875392, 1, 1, 1, 1, 1,
1.059213, 1.178173, 2.380753, 1, 1, 1, 1, 1,
1.060353, 0.06829996, 1.022999, 0, 0, 1, 1, 1,
1.076179, -0.1010355, 1.47172, 1, 0, 0, 1, 1,
1.088859, -1.505485, 2.713326, 1, 0, 0, 1, 1,
1.089597, 2.585173, 1.834302, 1, 0, 0, 1, 1,
1.091867, -1.071344, 3.861797, 1, 0, 0, 1, 1,
1.09262, -0.009182424, 1.428147, 1, 0, 0, 1, 1,
1.095548, 1.625829, 0.169327, 0, 0, 0, 1, 1,
1.106624, 0.3930081, 0.6634516, 0, 0, 0, 1, 1,
1.108462, 0.8301019, -1.022707, 0, 0, 0, 1, 1,
1.121178, -1.315727, 1.903354, 0, 0, 0, 1, 1,
1.125084, 1.400021, 0.9202974, 0, 0, 0, 1, 1,
1.129061, 1.074719, 0.4863347, 0, 0, 0, 1, 1,
1.133481, -0.7608625, 2.145802, 0, 0, 0, 1, 1,
1.133735, -2.751926, 1.957351, 1, 1, 1, 1, 1,
1.140149, 1.923112, 1.676226, 1, 1, 1, 1, 1,
1.147414, -0.6983119, 1.389734, 1, 1, 1, 1, 1,
1.151891, -0.6230555, 2.468584, 1, 1, 1, 1, 1,
1.152072, -1.591382, 3.179702, 1, 1, 1, 1, 1,
1.160292, -0.5848478, 4.012506, 1, 1, 1, 1, 1,
1.16122, 0.4313152, 1.379873, 1, 1, 1, 1, 1,
1.162015, 1.328334, 2.541838, 1, 1, 1, 1, 1,
1.162738, 0.5485623, 0.6652904, 1, 1, 1, 1, 1,
1.164957, -1.000876, 4.197477, 1, 1, 1, 1, 1,
1.176202, -1.660676, 1.272407, 1, 1, 1, 1, 1,
1.179821, -0.4795643, 1.722342, 1, 1, 1, 1, 1,
1.184473, 1.222395, -0.2376643, 1, 1, 1, 1, 1,
1.187191, -1.049501, 2.476512, 1, 1, 1, 1, 1,
1.194105, -1.446758, 2.748844, 1, 1, 1, 1, 1,
1.208907, -0.1140676, 0.5833395, 0, 0, 1, 1, 1,
1.210687, 1.658656, 0.2551608, 1, 0, 0, 1, 1,
1.21491, 1.307186, 2.661941, 1, 0, 0, 1, 1,
1.216876, -1.923942, 1.676313, 1, 0, 0, 1, 1,
1.217126, 0.03241576, 1.088745, 1, 0, 0, 1, 1,
1.223024, -1.004941, 2.371529, 1, 0, 0, 1, 1,
1.231491, 0.1472946, 2.141149, 0, 0, 0, 1, 1,
1.236317, -0.08915976, 2.426274, 0, 0, 0, 1, 1,
1.238292, 0.3924591, 1.826734, 0, 0, 0, 1, 1,
1.240957, -1.697817, 2.767761, 0, 0, 0, 1, 1,
1.241126, 0.1692353, 2.732049, 0, 0, 0, 1, 1,
1.243091, 1.77181, 0.433774, 0, 0, 0, 1, 1,
1.246013, -0.1693128, 1.263621, 0, 0, 0, 1, 1,
1.246122, 0.5943208, 2.42393, 1, 1, 1, 1, 1,
1.24898, -1.351982, 3.602408, 1, 1, 1, 1, 1,
1.251891, -0.6733613, 3.208003, 1, 1, 1, 1, 1,
1.263204, -0.6147056, 1.800521, 1, 1, 1, 1, 1,
1.277097, 0.8505822, -0.07303251, 1, 1, 1, 1, 1,
1.278251, -1.050808, 3.125165, 1, 1, 1, 1, 1,
1.285429, -1.142521, 2.601088, 1, 1, 1, 1, 1,
1.293313, 1.587792, -0.4584835, 1, 1, 1, 1, 1,
1.29352, 0.09956091, 3.779557, 1, 1, 1, 1, 1,
1.299608, 0.01280424, 1.39818, 1, 1, 1, 1, 1,
1.308476, 1.751718, -1.568961, 1, 1, 1, 1, 1,
1.320935, 0.2253748, 2.631217, 1, 1, 1, 1, 1,
1.322137, -1.835809, 2.936054, 1, 1, 1, 1, 1,
1.33168, -0.7975339, 1.245302, 1, 1, 1, 1, 1,
1.346564, -0.05033651, 1.42283, 1, 1, 1, 1, 1,
1.349274, -0.1213227, 1.641645, 0, 0, 1, 1, 1,
1.35855, 0.7943787, 1.372701, 1, 0, 0, 1, 1,
1.360136, 0.8861939, 1.300723, 1, 0, 0, 1, 1,
1.364084, 0.184902, 3.438048, 1, 0, 0, 1, 1,
1.377133, -0.08940228, 2.339497, 1, 0, 0, 1, 1,
1.397196, 0.07756303, 1.326471, 1, 0, 0, 1, 1,
1.424839, 1.556523, -0.006373913, 0, 0, 0, 1, 1,
1.433529, 1.184231, 0.4936297, 0, 0, 0, 1, 1,
1.436368, -1.510307, 2.375211, 0, 0, 0, 1, 1,
1.441252, 0.2038787, 0.5330712, 0, 0, 0, 1, 1,
1.447939, -0.1555662, 2.503647, 0, 0, 0, 1, 1,
1.451405, 0.4874754, 0.8635885, 0, 0, 0, 1, 1,
1.459859, 1.92, 0.5004861, 0, 0, 0, 1, 1,
1.467807, -0.4740869, 1.067547, 1, 1, 1, 1, 1,
1.491647, 0.6003838, 1.060973, 1, 1, 1, 1, 1,
1.50968, 0.6436815, 0.0773224, 1, 1, 1, 1, 1,
1.511039, -0.3043217, 0.8511406, 1, 1, 1, 1, 1,
1.512626, -0.693169, 2.398703, 1, 1, 1, 1, 1,
1.532509, -0.6550674, 1.58284, 1, 1, 1, 1, 1,
1.539818, -0.152181, 2.429766, 1, 1, 1, 1, 1,
1.540858, 0.07360896, -0.01613447, 1, 1, 1, 1, 1,
1.552355, -0.08104126, 2.073365, 1, 1, 1, 1, 1,
1.561301, -0.6237011, 2.569684, 1, 1, 1, 1, 1,
1.568461, -0.9272639, 1.637739, 1, 1, 1, 1, 1,
1.580839, -0.6867134, 3.175032, 1, 1, 1, 1, 1,
1.590078, 1.494343, 0.1954916, 1, 1, 1, 1, 1,
1.591186, 0.2609803, 2.95191, 1, 1, 1, 1, 1,
1.604954, 0.950507, 0.8682889, 1, 1, 1, 1, 1,
1.606942, 0.320545, 0.2372077, 0, 0, 1, 1, 1,
1.635799, -1.296162, 1.610274, 1, 0, 0, 1, 1,
1.659811, -2.154311, 2.627975, 1, 0, 0, 1, 1,
1.672169, -0.1113389, 0.0873387, 1, 0, 0, 1, 1,
1.676108, -1.235192, 1.609692, 1, 0, 0, 1, 1,
1.695864, -0.05785679, 0.825128, 1, 0, 0, 1, 1,
1.697799, -0.7240746, 0.8996399, 0, 0, 0, 1, 1,
1.701039, 2.022149, 0.6581689, 0, 0, 0, 1, 1,
1.752079, 0.08757063, 0.9805908, 0, 0, 0, 1, 1,
1.75445, -1.095911, 2.719109, 0, 0, 0, 1, 1,
1.757726, -0.3352346, 2.116168, 0, 0, 0, 1, 1,
1.812423, -1.397059, 3.025127, 0, 0, 0, 1, 1,
1.816113, -0.7529937, 3.718745, 0, 0, 0, 1, 1,
1.828303, 0.1155801, 0.573609, 1, 1, 1, 1, 1,
1.830357, -0.7378186, 2.592638, 1, 1, 1, 1, 1,
1.83363, 2.091067, 1.535718, 1, 1, 1, 1, 1,
1.849476, -1.027857, 2.062971, 1, 1, 1, 1, 1,
1.856494, -0.1610606, 0.9530993, 1, 1, 1, 1, 1,
1.888505, 0.4503505, 0.6677485, 1, 1, 1, 1, 1,
1.922076, -0.2178593, -0.1680117, 1, 1, 1, 1, 1,
1.944132, -0.1786408, 0.3280543, 1, 1, 1, 1, 1,
1.949461, 0.7375371, 0.650839, 1, 1, 1, 1, 1,
1.957457, 0.8906019, 1.228681, 1, 1, 1, 1, 1,
1.96469, -0.5322497, 3.3548, 1, 1, 1, 1, 1,
1.969922, 0.4432961, 0.8933775, 1, 1, 1, 1, 1,
1.974393, -1.442473, 1.32133, 1, 1, 1, 1, 1,
1.983256, -0.4348794, 1.31343, 1, 1, 1, 1, 1,
2.004638, -0.105199, 0.7138353, 1, 1, 1, 1, 1,
2.018203, 0.9597489, 1.850547, 0, 0, 1, 1, 1,
2.022121, 2.65278, -0.2412064, 1, 0, 0, 1, 1,
2.024986, 0.2339439, 2.786815, 1, 0, 0, 1, 1,
2.134555, 1.339409, 2.948165, 1, 0, 0, 1, 1,
2.150681, -0.4802925, 2.254329, 1, 0, 0, 1, 1,
2.152743, 1.255247, 3.494924, 1, 0, 0, 1, 1,
2.263449, 0.6630598, 1.719696, 0, 0, 0, 1, 1,
2.27668, 0.2490727, 1.220462, 0, 0, 0, 1, 1,
2.295526, 0.5250037, -0.2947069, 0, 0, 0, 1, 1,
2.346595, 0.3247637, 1.626012, 0, 0, 0, 1, 1,
2.39492, 0.3794018, 1.635336, 0, 0, 0, 1, 1,
2.423793, -0.2223918, 2.236425, 0, 0, 0, 1, 1,
2.435905, -0.5522538, 3.382897, 0, 0, 0, 1, 1,
2.447553, -0.4734958, 0.008259506, 1, 1, 1, 1, 1,
2.450093, 0.6405513, 2.415325, 1, 1, 1, 1, 1,
2.467465, -0.008857959, 2.190753, 1, 1, 1, 1, 1,
2.513033, 0.4151891, 1.908507, 1, 1, 1, 1, 1,
2.567244, 0.353821, 1.588649, 1, 1, 1, 1, 1,
2.788642, -0.6148749, 3.862071, 1, 1, 1, 1, 1,
2.944466, 1.025757, -1.355775, 1, 1, 1, 1, 1
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
var radius = 9.467582;
var distance = 33.25448;
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
mvMatrix.translate( 0.6472245, -0.08132708, 0.1786451 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.25448);
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