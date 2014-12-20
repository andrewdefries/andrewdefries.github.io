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
-3.527688, -1.815978, -1.933097, 1, 0, 0, 1,
-3.375318, -0.6661128, -1.524629, 1, 0.007843138, 0, 1,
-3.11924, -0.7876623, -1.548363, 1, 0.01176471, 0, 1,
-2.988012, -0.2331016, -2.379841, 1, 0.01960784, 0, 1,
-2.660419, -0.6807097, -1.989037, 1, 0.02352941, 0, 1,
-2.58987, 2.152607, -0.2911003, 1, 0.03137255, 0, 1,
-2.536328, -0.5425237, -1.31125, 1, 0.03529412, 0, 1,
-2.519643, -0.01158311, -0.7011133, 1, 0.04313726, 0, 1,
-2.264108, -0.5928757, -4.099629, 1, 0.04705882, 0, 1,
-2.247365, 0.2831312, -1.631594, 1, 0.05490196, 0, 1,
-2.241183, 0.556164, -1.029477, 1, 0.05882353, 0, 1,
-2.237212, -0.09976649, -0.75545, 1, 0.06666667, 0, 1,
-2.218621, -1.51786, -1.925714, 1, 0.07058824, 0, 1,
-2.215416, 0.5418267, -0.6584056, 1, 0.07843138, 0, 1,
-2.197139, 0.3230799, -1.597338, 1, 0.08235294, 0, 1,
-2.194647, 0.7168161, -1.478058, 1, 0.09019608, 0, 1,
-2.18734, -0.3483613, -2.562991, 1, 0.09411765, 0, 1,
-2.151185, 1.407164, -0.5095533, 1, 0.1019608, 0, 1,
-2.14151, -0.8594141, -1.696339, 1, 0.1098039, 0, 1,
-2.138669, 0.7379944, -0.09156914, 1, 0.1137255, 0, 1,
-2.136645, 2.172149, -2.184211, 1, 0.1215686, 0, 1,
-2.100527, 0.6603878, -2.06947, 1, 0.1254902, 0, 1,
-2.065607, -0.2638576, -2.378683, 1, 0.1333333, 0, 1,
-2.050975, 0.2776105, -0.9428073, 1, 0.1372549, 0, 1,
-2.035143, 0.9457294, -1.306911, 1, 0.145098, 0, 1,
-2.034284, 0.2743386, -0.6008483, 1, 0.1490196, 0, 1,
-1.998786, 1.860556, 0.4127056, 1, 0.1568628, 0, 1,
-1.989271, 0.2862703, -0.7268877, 1, 0.1607843, 0, 1,
-1.988556, -0.8072557, -1.831859, 1, 0.1686275, 0, 1,
-1.985457, 1.635362, 0.5136901, 1, 0.172549, 0, 1,
-1.98197, 1.033752, -1.730047, 1, 0.1803922, 0, 1,
-1.9616, -0.4004589, -3.501568, 1, 0.1843137, 0, 1,
-1.958441, 0.09158371, -1.475999, 1, 0.1921569, 0, 1,
-1.946657, -0.473589, -1.636089, 1, 0.1960784, 0, 1,
-1.90583, 0.6722425, -0.661221, 1, 0.2039216, 0, 1,
-1.903165, -1.311147, -1.438328, 1, 0.2117647, 0, 1,
-1.893348, -1.299528, -1.488084, 1, 0.2156863, 0, 1,
-1.888672, -0.9931569, -3.122925, 1, 0.2235294, 0, 1,
-1.886468, -2.088593, -4.245802, 1, 0.227451, 0, 1,
-1.87891, -0.8300374, -1.236513, 1, 0.2352941, 0, 1,
-1.875097, 0.740951, -1.987125, 1, 0.2392157, 0, 1,
-1.871715, -0.5525035, -1.422181, 1, 0.2470588, 0, 1,
-1.854306, -2.211701, -1.348802, 1, 0.2509804, 0, 1,
-1.831935, -1.038105, -1.098438, 1, 0.2588235, 0, 1,
-1.82907, 0.4102736, -1.165314, 1, 0.2627451, 0, 1,
-1.813257, 0.2412821, -0.7905867, 1, 0.2705882, 0, 1,
-1.804217, -0.4212502, -2.688592, 1, 0.2745098, 0, 1,
-1.788625, -1.700402, -1.587064, 1, 0.282353, 0, 1,
-1.763815, -0.2138356, 0.2290545, 1, 0.2862745, 0, 1,
-1.748895, 0.09299067, -0.5322211, 1, 0.2941177, 0, 1,
-1.745833, -0.3357708, -0.009804761, 1, 0.3019608, 0, 1,
-1.741161, -1.000161, -3.591188, 1, 0.3058824, 0, 1,
-1.728199, -0.2175679, -2.115797, 1, 0.3137255, 0, 1,
-1.727913, 0.08698165, -1.704114, 1, 0.3176471, 0, 1,
-1.719671, 0.3198109, -2.891732, 1, 0.3254902, 0, 1,
-1.715525, 1.016997, -1.371156, 1, 0.3294118, 0, 1,
-1.711011, 0.1657383, -1.650169, 1, 0.3372549, 0, 1,
-1.70407, -1.145836, -2.251585, 1, 0.3411765, 0, 1,
-1.679193, 1.405206, -0.4526646, 1, 0.3490196, 0, 1,
-1.632929, -0.7409471, -2.208346, 1, 0.3529412, 0, 1,
-1.625105, 0.1065933, -2.01646, 1, 0.3607843, 0, 1,
-1.622091, 0.1774963, -1.86401, 1, 0.3647059, 0, 1,
-1.619913, 0.008107385, -0.8780491, 1, 0.372549, 0, 1,
-1.615825, 1.049405, -1.91858, 1, 0.3764706, 0, 1,
-1.610271, -0.7932658, -3.270545, 1, 0.3843137, 0, 1,
-1.604648, -0.9524311, -0.5733189, 1, 0.3882353, 0, 1,
-1.601544, 0.330457, -0.0008625332, 1, 0.3960784, 0, 1,
-1.59974, 0.5397339, 1.006789, 1, 0.4039216, 0, 1,
-1.598544, -2.283828, -2.449315, 1, 0.4078431, 0, 1,
-1.596085, 0.4886849, -1.219939, 1, 0.4156863, 0, 1,
-1.590099, -1.697787, -2.856878, 1, 0.4196078, 0, 1,
-1.58711, -0.712724, -2.328582, 1, 0.427451, 0, 1,
-1.571245, 0.6961243, -0.5403212, 1, 0.4313726, 0, 1,
-1.567606, 0.5275991, -1.118161, 1, 0.4392157, 0, 1,
-1.559869, -0.294705, -1.634941, 1, 0.4431373, 0, 1,
-1.558899, 0.8306858, 0.2144466, 1, 0.4509804, 0, 1,
-1.545265, -0.2450637, 0.6541485, 1, 0.454902, 0, 1,
-1.535645, 1.743025, -0.7168226, 1, 0.4627451, 0, 1,
-1.531081, 0.8909129, 1.262088, 1, 0.4666667, 0, 1,
-1.518207, -0.3482507, -0.9566708, 1, 0.4745098, 0, 1,
-1.51133, 0.7609307, -0.2753128, 1, 0.4784314, 0, 1,
-1.507232, 0.2250687, -1.027871, 1, 0.4862745, 0, 1,
-1.486512, -1.366544, -3.005036, 1, 0.4901961, 0, 1,
-1.478423, -1.120285, -1.111405, 1, 0.4980392, 0, 1,
-1.476354, -0.9355506, -1.754278, 1, 0.5058824, 0, 1,
-1.475413, -0.1421957, -0.1942354, 1, 0.509804, 0, 1,
-1.473109, -0.4002187, 0.2299204, 1, 0.5176471, 0, 1,
-1.469931, -0.01763162, -0.1402443, 1, 0.5215687, 0, 1,
-1.468361, 0.6421198, -1.702031, 1, 0.5294118, 0, 1,
-1.462104, 0.6596809, -1.036428, 1, 0.5333334, 0, 1,
-1.460825, -1.240408, -4.297316, 1, 0.5411765, 0, 1,
-1.457569, 0.996454, -0.9199441, 1, 0.5450981, 0, 1,
-1.451032, 0.2912266, -0.5612536, 1, 0.5529412, 0, 1,
-1.444566, 0.8194119, -1.835659, 1, 0.5568628, 0, 1,
-1.439585, -0.5608544, -2.087183, 1, 0.5647059, 0, 1,
-1.432592, -1.938866, -0.9653077, 1, 0.5686275, 0, 1,
-1.432016, 1.914664, 1.205765, 1, 0.5764706, 0, 1,
-1.428415, -0.1721199, -1.63411, 1, 0.5803922, 0, 1,
-1.416728, 0.7869733, 0.392009, 1, 0.5882353, 0, 1,
-1.396339, 1.069397, -0.7028774, 1, 0.5921569, 0, 1,
-1.390293, 0.3413011, -0.5715045, 1, 0.6, 0, 1,
-1.383403, 1.488437, -1.367061, 1, 0.6078432, 0, 1,
-1.378684, -0.8901205, -1.471828, 1, 0.6117647, 0, 1,
-1.36675, 0.620112, 0.0938605, 1, 0.6196079, 0, 1,
-1.346593, 0.1731895, -1.314001, 1, 0.6235294, 0, 1,
-1.334057, 1.753789, -0.02832584, 1, 0.6313726, 0, 1,
-1.332727, 1.68225, -0.7981392, 1, 0.6352941, 0, 1,
-1.324398, -0.96073, -2.45511, 1, 0.6431373, 0, 1,
-1.314729, -0.06910636, -2.271844, 1, 0.6470588, 0, 1,
-1.313782, -0.6122104, -2.387994, 1, 0.654902, 0, 1,
-1.313681, 0.7417558, 0.08393261, 1, 0.6588235, 0, 1,
-1.312361, -1.211642, -1.241155, 1, 0.6666667, 0, 1,
-1.307567, -1.336131, -3.070922, 1, 0.6705883, 0, 1,
-1.307074, 0.8775734, -0.1254603, 1, 0.6784314, 0, 1,
-1.304162, -0.9532169, -2.94727, 1, 0.682353, 0, 1,
-1.302398, 1.279088, -0.487665, 1, 0.6901961, 0, 1,
-1.298615, -0.4950116, -1.50531, 1, 0.6941177, 0, 1,
-1.293049, 0.8099373, -2.0253, 1, 0.7019608, 0, 1,
-1.288396, -0.93308, -1.625014, 1, 0.7098039, 0, 1,
-1.278783, -0.8051591, -2.973775, 1, 0.7137255, 0, 1,
-1.276159, -0.6995266, -0.4888313, 1, 0.7215686, 0, 1,
-1.272386, -0.3343916, -0.9566334, 1, 0.7254902, 0, 1,
-1.270763, 0.7238079, -0.1067277, 1, 0.7333333, 0, 1,
-1.267329, -0.04451291, -0.1062188, 1, 0.7372549, 0, 1,
-1.266088, -1.151474, -2.347059, 1, 0.7450981, 0, 1,
-1.260151, 0.2035498, -0.9362247, 1, 0.7490196, 0, 1,
-1.258432, -1.314297, -1.874274, 1, 0.7568628, 0, 1,
-1.256389, -0.1600466, -1.731115, 1, 0.7607843, 0, 1,
-1.250746, 0.9435099, 0.4717301, 1, 0.7686275, 0, 1,
-1.249816, -1.015519, -2.174117, 1, 0.772549, 0, 1,
-1.248346, 1.792315, -1.226951, 1, 0.7803922, 0, 1,
-1.247936, -0.6967747, -2.556249, 1, 0.7843137, 0, 1,
-1.247254, 2.531964, -0.9134859, 1, 0.7921569, 0, 1,
-1.247187, -0.9294479, -3.665301, 1, 0.7960784, 0, 1,
-1.24269, 0.1815473, -3.205882, 1, 0.8039216, 0, 1,
-1.240141, 1.508359, -2.029143, 1, 0.8117647, 0, 1,
-1.24008, -0.2477185, -3.785126, 1, 0.8156863, 0, 1,
-1.23461, -0.1525003, -1.371071, 1, 0.8235294, 0, 1,
-1.224425, -0.2458524, -1.835526, 1, 0.827451, 0, 1,
-1.221579, 0.7491482, -1.257973, 1, 0.8352941, 0, 1,
-1.207877, -0.7145307, -1.955721, 1, 0.8392157, 0, 1,
-1.201103, 0.4677757, 0.4656897, 1, 0.8470588, 0, 1,
-1.199307, -2.615394, -1.603375, 1, 0.8509804, 0, 1,
-1.19888, 1.285897, -0.8542585, 1, 0.8588235, 0, 1,
-1.189997, 0.5060273, -1.390586, 1, 0.8627451, 0, 1,
-1.187859, -0.4142354, -0.6169341, 1, 0.8705882, 0, 1,
-1.173599, 0.984849, -1.192176, 1, 0.8745098, 0, 1,
-1.172087, -0.8641365, -0.4805996, 1, 0.8823529, 0, 1,
-1.165927, 0.05711801, -1.016936, 1, 0.8862745, 0, 1,
-1.157271, -0.1655565, -2.786351, 1, 0.8941177, 0, 1,
-1.150584, 0.2588146, -0.5186722, 1, 0.8980392, 0, 1,
-1.130093, -0.4133424, -1.206796, 1, 0.9058824, 0, 1,
-1.12172, -0.1519685, -0.3126347, 1, 0.9137255, 0, 1,
-1.120293, 2.286253, -1.300342, 1, 0.9176471, 0, 1,
-1.109293, -0.06988363, -1.419361, 1, 0.9254902, 0, 1,
-1.099061, 0.998455, -0.2679637, 1, 0.9294118, 0, 1,
-1.09866, 0.02167747, -2.265296, 1, 0.9372549, 0, 1,
-1.097497, 0.5324996, -1.244617, 1, 0.9411765, 0, 1,
-1.09059, 0.5252525, -1.16881, 1, 0.9490196, 0, 1,
-1.088881, -0.3204942, -3.327391, 1, 0.9529412, 0, 1,
-1.086628, -0.6718628, -1.443438, 1, 0.9607843, 0, 1,
-1.085502, -0.05236288, -0.5020428, 1, 0.9647059, 0, 1,
-1.084924, -0.9706183, -1.78148, 1, 0.972549, 0, 1,
-1.08265, 0.7358597, -0.6292861, 1, 0.9764706, 0, 1,
-1.07923, -0.7844535, -2.569974, 1, 0.9843137, 0, 1,
-1.078483, 0.8635226, -0.8058289, 1, 0.9882353, 0, 1,
-1.076659, 2.057833, 1.178748, 1, 0.9960784, 0, 1,
-1.076496, -0.703027, -1.113414, 0.9960784, 1, 0, 1,
-1.076484, 1.07522, -1.16932, 0.9921569, 1, 0, 1,
-1.066004, -0.5744588, -1.644206, 0.9843137, 1, 0, 1,
-1.06349, 0.8800934, -0.08188106, 0.9803922, 1, 0, 1,
-1.061724, -0.4101507, -1.140541, 0.972549, 1, 0, 1,
-1.060964, -0.5032187, -1.816638, 0.9686275, 1, 0, 1,
-1.060622, -1.367926, -2.121504, 0.9607843, 1, 0, 1,
-1.056687, -0.9881393, -3.878647, 0.9568627, 1, 0, 1,
-1.054106, 0.7262863, -2.132779, 0.9490196, 1, 0, 1,
-1.052708, 0.4282732, -1.255948, 0.945098, 1, 0, 1,
-1.052213, -0.004232062, -1.242423, 0.9372549, 1, 0, 1,
-1.05191, -1.186567, -0.2105948, 0.9333333, 1, 0, 1,
-1.050333, -0.3819655, -1.211897, 0.9254902, 1, 0, 1,
-1.047734, -0.7874694, -3.337315, 0.9215686, 1, 0, 1,
-1.038084, 0.2632935, -0.4464971, 0.9137255, 1, 0, 1,
-1.034582, -0.8510182, -1.666391, 0.9098039, 1, 0, 1,
-1.030485, -1.334768, -3.018442, 0.9019608, 1, 0, 1,
-1.026871, -0.6035195, -0.8078359, 0.8941177, 1, 0, 1,
-1.022756, -0.03767002, -1.329679, 0.8901961, 1, 0, 1,
-1.021687, -0.5083901, -2.528494, 0.8823529, 1, 0, 1,
-1.021684, 1.37285, -1.531488, 0.8784314, 1, 0, 1,
-1.021413, -1.14352, -3.425426, 0.8705882, 1, 0, 1,
-1.016901, 0.5354793, 0.5089147, 0.8666667, 1, 0, 1,
-1.01611, 0.6928332, -1.618703, 0.8588235, 1, 0, 1,
-1.016006, 0.2520015, -0.6794301, 0.854902, 1, 0, 1,
-1.014585, 0.2314626, 1.02814, 0.8470588, 1, 0, 1,
-1.013163, 0.6925747, -1.779906, 0.8431373, 1, 0, 1,
-1.006816, 0.1103547, 1.807643, 0.8352941, 1, 0, 1,
-1.004368, 0.8315532, -1.676295, 0.8313726, 1, 0, 1,
-1.000424, -0.1476801, -1.064845, 0.8235294, 1, 0, 1,
-0.9999714, -0.6139386, -3.209236, 0.8196079, 1, 0, 1,
-0.9883749, 1.542381, -0.07727186, 0.8117647, 1, 0, 1,
-0.9860778, 0.79599, -0.9330295, 0.8078431, 1, 0, 1,
-0.9794388, -2.499737, -2.214885, 0.8, 1, 0, 1,
-0.9775618, -0.7863101, -0.2873648, 0.7921569, 1, 0, 1,
-0.9759305, 0.08353852, -1.624029, 0.7882353, 1, 0, 1,
-0.9623895, 1.251704, -0.940588, 0.7803922, 1, 0, 1,
-0.9580646, -0.1803261, -0.4240331, 0.7764706, 1, 0, 1,
-0.9561588, -1.684278, -2.816844, 0.7686275, 1, 0, 1,
-0.9468466, 0.4454204, -1.477213, 0.7647059, 1, 0, 1,
-0.9445725, -0.9799312, -2.870254, 0.7568628, 1, 0, 1,
-0.9423567, 0.5028635, -2.227629, 0.7529412, 1, 0, 1,
-0.9399598, 0.7543383, -1.347598, 0.7450981, 1, 0, 1,
-0.939737, 0.7969776, -1.271967, 0.7411765, 1, 0, 1,
-0.9372157, 0.9664653, -0.4906465, 0.7333333, 1, 0, 1,
-0.9322243, -0.27573, -1.404272, 0.7294118, 1, 0, 1,
-0.9265135, -2.150788, -2.298581, 0.7215686, 1, 0, 1,
-0.9264494, -1.227919, -2.071663, 0.7176471, 1, 0, 1,
-0.9183955, 0.5399629, -2.525876, 0.7098039, 1, 0, 1,
-0.9160496, -0.1617648, -1.491586, 0.7058824, 1, 0, 1,
-0.9129457, 0.6719841, -1.425041, 0.6980392, 1, 0, 1,
-0.90738, -0.08924079, -3.04562, 0.6901961, 1, 0, 1,
-0.9013498, 0.5106097, -0.400699, 0.6862745, 1, 0, 1,
-0.9011882, -0.1989659, -1.109194, 0.6784314, 1, 0, 1,
-0.8905808, -0.6718301, -1.297931, 0.6745098, 1, 0, 1,
-0.8897595, 0.6663967, -1.444249, 0.6666667, 1, 0, 1,
-0.8887132, -0.537653, -1.292737, 0.6627451, 1, 0, 1,
-0.8767633, 0.5214087, -1.027093, 0.654902, 1, 0, 1,
-0.8758065, 1.182138, -1.121747, 0.6509804, 1, 0, 1,
-0.8743738, -2.095031, -3.112761, 0.6431373, 1, 0, 1,
-0.8689095, -0.819221, -1.492813, 0.6392157, 1, 0, 1,
-0.8665321, 0.33955, -1.346397, 0.6313726, 1, 0, 1,
-0.8656113, -1.169279, -2.474437, 0.627451, 1, 0, 1,
-0.8651938, 0.2914222, 0.5691839, 0.6196079, 1, 0, 1,
-0.8537861, -0.2283432, -2.392601, 0.6156863, 1, 0, 1,
-0.8501014, 0.3347706, -1.035681, 0.6078432, 1, 0, 1,
-0.8391911, 0.4352461, -0.7286791, 0.6039216, 1, 0, 1,
-0.8355589, -0.04325533, 1.078642, 0.5960785, 1, 0, 1,
-0.8338388, -0.395454, -2.720366, 0.5882353, 1, 0, 1,
-0.8277726, -0.2235647, -1.805115, 0.5843138, 1, 0, 1,
-0.8250503, 1.075984, 0.08353776, 0.5764706, 1, 0, 1,
-0.8213025, 1.51948, -0.3097404, 0.572549, 1, 0, 1,
-0.8191963, 0.2179041, -0.7693762, 0.5647059, 1, 0, 1,
-0.8172042, -0.128226, -2.020716, 0.5607843, 1, 0, 1,
-0.8086361, -0.2138666, -0.1930413, 0.5529412, 1, 0, 1,
-0.8077579, 0.7858832, -0.3763102, 0.5490196, 1, 0, 1,
-0.807593, -0.5413201, -1.85625, 0.5411765, 1, 0, 1,
-0.8002102, 0.2107467, -0.7397403, 0.5372549, 1, 0, 1,
-0.8000448, -0.08964455, -0.8568702, 0.5294118, 1, 0, 1,
-0.7948909, -0.17341, -2.373079, 0.5254902, 1, 0, 1,
-0.7900076, -0.6148195, -2.174202, 0.5176471, 1, 0, 1,
-0.7807738, -0.1968375, -0.4138664, 0.5137255, 1, 0, 1,
-0.7792629, -1.373093, -1.794264, 0.5058824, 1, 0, 1,
-0.7787872, -0.4836201, -1.151588, 0.5019608, 1, 0, 1,
-0.775549, 0.630717, -2.183186, 0.4941176, 1, 0, 1,
-0.7715666, 1.148533, -0.6884614, 0.4862745, 1, 0, 1,
-0.7705664, -0.7609071, -2.259204, 0.4823529, 1, 0, 1,
-0.7616224, -0.5258864, -1.815008, 0.4745098, 1, 0, 1,
-0.7585648, -0.6645419, -2.72925, 0.4705882, 1, 0, 1,
-0.7548195, -1.161885, -2.697739, 0.4627451, 1, 0, 1,
-0.7540835, 0.8662872, 1.703447, 0.4588235, 1, 0, 1,
-0.7538478, -0.7439561, -0.5282808, 0.4509804, 1, 0, 1,
-0.7454099, -0.03977859, 0.1764125, 0.4470588, 1, 0, 1,
-0.7444726, -0.6107766, -2.076779, 0.4392157, 1, 0, 1,
-0.7444509, 1.801732, -1.535876, 0.4352941, 1, 0, 1,
-0.7405957, 0.2167144, -1.932318, 0.427451, 1, 0, 1,
-0.7333003, -2.056202, -1.861075, 0.4235294, 1, 0, 1,
-0.7295495, 1.254033, -0.5403118, 0.4156863, 1, 0, 1,
-0.7277691, 1.355285, 0.4916522, 0.4117647, 1, 0, 1,
-0.7255392, 1.093551, -1.674794, 0.4039216, 1, 0, 1,
-0.7227504, -0.4048647, -2.477516, 0.3960784, 1, 0, 1,
-0.7095622, -0.7007041, -2.625915, 0.3921569, 1, 0, 1,
-0.7088065, -0.6362504, -1.913805, 0.3843137, 1, 0, 1,
-0.7060916, 1.356826, 0.05033165, 0.3803922, 1, 0, 1,
-0.7039062, 0.04531291, -1.310973, 0.372549, 1, 0, 1,
-0.6913025, 0.5293459, -0.2832706, 0.3686275, 1, 0, 1,
-0.6910547, 0.02574252, -0.7651207, 0.3607843, 1, 0, 1,
-0.6882976, -0.3636225, -0.9352936, 0.3568628, 1, 0, 1,
-0.6805135, -0.427472, -1.511907, 0.3490196, 1, 0, 1,
-0.6687996, -1.418218, -1.915746, 0.345098, 1, 0, 1,
-0.6611385, -1.475074, -2.597671, 0.3372549, 1, 0, 1,
-0.6592148, -1.695611, -2.408863, 0.3333333, 1, 0, 1,
-0.6568298, 0.7751438, -1.873515, 0.3254902, 1, 0, 1,
-0.6559909, 1.251064, -1.307968, 0.3215686, 1, 0, 1,
-0.6470219, -0.1458905, -2.646533, 0.3137255, 1, 0, 1,
-0.6339025, -0.7011406, -2.992312, 0.3098039, 1, 0, 1,
-0.6270627, -1.107009, -1.984895, 0.3019608, 1, 0, 1,
-0.6234064, -0.3455441, -2.648275, 0.2941177, 1, 0, 1,
-0.6232998, -2.384696, -2.723306, 0.2901961, 1, 0, 1,
-0.6207203, -1.190114, -3.02448, 0.282353, 1, 0, 1,
-0.620167, -0.3876156, -3.047397, 0.2784314, 1, 0, 1,
-0.6182274, 1.672385, -1.68178, 0.2705882, 1, 0, 1,
-0.6177145, 1.053749, -1.364897, 0.2666667, 1, 0, 1,
-0.616092, 0.1979571, 0.06697538, 0.2588235, 1, 0, 1,
-0.6131944, 1.420456, -1.062174, 0.254902, 1, 0, 1,
-0.5984403, -2.066635, -2.261732, 0.2470588, 1, 0, 1,
-0.5925419, 0.1569465, -2.546138, 0.2431373, 1, 0, 1,
-0.588482, 1.920493, -0.4315397, 0.2352941, 1, 0, 1,
-0.5810968, -0.3564368, -1.899783, 0.2313726, 1, 0, 1,
-0.5740011, 1.067545, 2.034474, 0.2235294, 1, 0, 1,
-0.5734024, 1.594029, -1.365374, 0.2196078, 1, 0, 1,
-0.5701991, -0.3975939, -1.137147, 0.2117647, 1, 0, 1,
-0.5628124, 0.161745, -1.774917, 0.2078431, 1, 0, 1,
-0.5616343, -0.8663565, -2.487915, 0.2, 1, 0, 1,
-0.5609277, -0.4305528, -1.981661, 0.1921569, 1, 0, 1,
-0.5593404, 0.2384298, -1.518989, 0.1882353, 1, 0, 1,
-0.555319, -1.045364, -2.317516, 0.1803922, 1, 0, 1,
-0.5544467, -1.092231, -2.798881, 0.1764706, 1, 0, 1,
-0.551351, 0.3943134, -0.3225095, 0.1686275, 1, 0, 1,
-0.548154, -0.5476792, -2.719515, 0.1647059, 1, 0, 1,
-0.5470247, -0.7549058, -3.032301, 0.1568628, 1, 0, 1,
-0.5444449, -0.5507553, -2.360994, 0.1529412, 1, 0, 1,
-0.5416974, 1.243394, -0.3369374, 0.145098, 1, 0, 1,
-0.5410089, 0.02019347, -1.782486, 0.1411765, 1, 0, 1,
-0.5375522, -0.2738536, -2.044858, 0.1333333, 1, 0, 1,
-0.5371199, -0.5175497, -1.089681, 0.1294118, 1, 0, 1,
-0.5371191, 0.3312624, -1.286125, 0.1215686, 1, 0, 1,
-0.5349683, 0.8320203, -1.718539, 0.1176471, 1, 0, 1,
-0.5328157, -0.8056445, -2.627548, 0.1098039, 1, 0, 1,
-0.5283903, -0.276044, -0.962512, 0.1058824, 1, 0, 1,
-0.5265137, -0.4288494, -2.919628, 0.09803922, 1, 0, 1,
-0.5199723, 0.3158307, -2.532318, 0.09019608, 1, 0, 1,
-0.5149298, -0.3681217, -3.060901, 0.08627451, 1, 0, 1,
-0.5057748, -0.175152, -0.6513399, 0.07843138, 1, 0, 1,
-0.5041826, 0.1547225, 0.2746291, 0.07450981, 1, 0, 1,
-0.5036337, 0.09074494, 0.06129395, 0.06666667, 1, 0, 1,
-0.5034294, 1.868277, 0.2842243, 0.0627451, 1, 0, 1,
-0.5013469, -0.6765598, -0.6384565, 0.05490196, 1, 0, 1,
-0.5000978, -1.009838, -2.268633, 0.05098039, 1, 0, 1,
-0.490479, -0.8011859, -2.308121, 0.04313726, 1, 0, 1,
-0.4869335, -0.1949855, -0.6909335, 0.03921569, 1, 0, 1,
-0.4868096, -0.3855566, -3.565232, 0.03137255, 1, 0, 1,
-0.4860313, 0.03504176, -1.609725, 0.02745098, 1, 0, 1,
-0.4844359, 0.7634355, -0.1590259, 0.01960784, 1, 0, 1,
-0.4808171, -2.664926, -2.143301, 0.01568628, 1, 0, 1,
-0.4739167, 1.037891, -2.302311, 0.007843138, 1, 0, 1,
-0.4709539, -0.3545054, -2.699224, 0.003921569, 1, 0, 1,
-0.4666238, -0.5514489, -1.862942, 0, 1, 0.003921569, 1,
-0.4639456, -0.5040471, -3.454553, 0, 1, 0.01176471, 1,
-0.4501636, 1.020554, -0.004283025, 0, 1, 0.01568628, 1,
-0.44927, 1.121491, -0.5763299, 0, 1, 0.02352941, 1,
-0.4469489, 0.2574797, -1.053755, 0, 1, 0.02745098, 1,
-0.4448635, 0.7401476, -0.802772, 0, 1, 0.03529412, 1,
-0.4427067, -0.01109233, -1.037748, 0, 1, 0.03921569, 1,
-0.4414479, -1.633417, -3.275512, 0, 1, 0.04705882, 1,
-0.4386248, -0.7024121, -3.512187, 0, 1, 0.05098039, 1,
-0.4342327, -2.032523, -4.262742, 0, 1, 0.05882353, 1,
-0.4312419, -0.4184807, -2.032001, 0, 1, 0.0627451, 1,
-0.4246442, 2.049445, -0.4479976, 0, 1, 0.07058824, 1,
-0.42399, 0.5082091, -2.440957, 0, 1, 0.07450981, 1,
-0.4218209, -0.5855114, -4.943581, 0, 1, 0.08235294, 1,
-0.4192216, -1.317155, -2.200929, 0, 1, 0.08627451, 1,
-0.4186871, -0.1749198, -1.200508, 0, 1, 0.09411765, 1,
-0.4156708, -0.5800518, -1.751327, 0, 1, 0.1019608, 1,
-0.4087284, 0.6657594, 0.4378041, 0, 1, 0.1058824, 1,
-0.405243, 1.090759, -3.32367, 0, 1, 0.1137255, 1,
-0.4046104, 0.2001031, -1.405407, 0, 1, 0.1176471, 1,
-0.4032588, -0.3156674, -1.546411, 0, 1, 0.1254902, 1,
-0.4017611, -0.215055, -2.494652, 0, 1, 0.1294118, 1,
-0.4016419, 0.468634, -1.31531, 0, 1, 0.1372549, 1,
-0.4015211, 0.07077906, -3.222894, 0, 1, 0.1411765, 1,
-0.3968799, -0.05533547, -2.448592, 0, 1, 0.1490196, 1,
-0.3818056, -0.1213861, -1.356125, 0, 1, 0.1529412, 1,
-0.3807636, 0.1793744, -0.3142644, 0, 1, 0.1607843, 1,
-0.3777267, 0.07315677, -0.9296903, 0, 1, 0.1647059, 1,
-0.3737379, -0.5689363, -2.949359, 0, 1, 0.172549, 1,
-0.3733814, 0.7517, -0.2862752, 0, 1, 0.1764706, 1,
-0.3702568, 0.6217812, -0.2995794, 0, 1, 0.1843137, 1,
-0.3692922, 0.2102272, -1.694227, 0, 1, 0.1882353, 1,
-0.3679621, -0.909436, -1.712042, 0, 1, 0.1960784, 1,
-0.362228, -0.01947719, -2.582, 0, 1, 0.2039216, 1,
-0.3613364, -1.367847, -2.373078, 0, 1, 0.2078431, 1,
-0.3586263, -1.508953, -2.399494, 0, 1, 0.2156863, 1,
-0.357621, -0.2354064, -1.964384, 0, 1, 0.2196078, 1,
-0.3545306, -2.088253, -2.551739, 0, 1, 0.227451, 1,
-0.3537056, 0.01108208, -0.5090573, 0, 1, 0.2313726, 1,
-0.3504708, -0.3812218, -3.550484, 0, 1, 0.2392157, 1,
-0.3494322, 0.2465514, -0.404706, 0, 1, 0.2431373, 1,
-0.3481064, -0.907661, -2.266459, 0, 1, 0.2509804, 1,
-0.3468727, 1.133581, -0.8266991, 0, 1, 0.254902, 1,
-0.3442013, -0.3917324, -3.950485, 0, 1, 0.2627451, 1,
-0.3428561, 0.7662095, -1.585966, 0, 1, 0.2666667, 1,
-0.337698, -1.590719, -3.962254, 0, 1, 0.2745098, 1,
-0.337071, -0.07501885, -1.166745, 0, 1, 0.2784314, 1,
-0.33591, -0.4817018, -2.745962, 0, 1, 0.2862745, 1,
-0.3324717, 0.9487572, -0.5241988, 0, 1, 0.2901961, 1,
-0.3283121, -0.6413702, -3.56662, 0, 1, 0.2980392, 1,
-0.3273489, -0.2624244, -1.409261, 0, 1, 0.3058824, 1,
-0.3254556, 0.6700788, -0.8301126, 0, 1, 0.3098039, 1,
-0.32324, 1.261703, -0.378806, 0, 1, 0.3176471, 1,
-0.3232294, 1.283379, 0.2400495, 0, 1, 0.3215686, 1,
-0.3213172, -1.287536, -2.300299, 0, 1, 0.3294118, 1,
-0.3049888, 1.062065, 0.829872, 0, 1, 0.3333333, 1,
-0.3013976, -0.4730384, -2.778073, 0, 1, 0.3411765, 1,
-0.3000569, -0.3906665, -2.431917, 0, 1, 0.345098, 1,
-0.2995163, 0.2353067, 0.9676088, 0, 1, 0.3529412, 1,
-0.2982047, -0.5579284, -2.095794, 0, 1, 0.3568628, 1,
-0.2972241, -1.929358, -4.04178, 0, 1, 0.3647059, 1,
-0.2960566, 0.4218521, -0.5522695, 0, 1, 0.3686275, 1,
-0.2903356, -2.440062, -3.825134, 0, 1, 0.3764706, 1,
-0.288752, 0.5054626, -1.886109, 0, 1, 0.3803922, 1,
-0.2859699, 0.5311966, -1.427758, 0, 1, 0.3882353, 1,
-0.2834134, -2.342812, -3.325472, 0, 1, 0.3921569, 1,
-0.2822283, -0.2411024, -0.7606239, 0, 1, 0.4, 1,
-0.2814631, 1.372475, 0.3961759, 0, 1, 0.4078431, 1,
-0.2804731, 1.760522, 0.02036523, 0, 1, 0.4117647, 1,
-0.2797716, -0.4545252, -3.25843, 0, 1, 0.4196078, 1,
-0.2795438, 1.170672, 1.169906, 0, 1, 0.4235294, 1,
-0.2784678, 0.7144806, -1.196012, 0, 1, 0.4313726, 1,
-0.2643931, -0.6648873, -2.91777, 0, 1, 0.4352941, 1,
-0.2628103, -1.664144, -3.176912, 0, 1, 0.4431373, 1,
-0.2619099, 0.2141737, 0.02808021, 0, 1, 0.4470588, 1,
-0.2617353, -0.7745327, -3.842209, 0, 1, 0.454902, 1,
-0.2598899, -0.5282215, -2.195054, 0, 1, 0.4588235, 1,
-0.2582673, -0.5327836, -3.919026, 0, 1, 0.4666667, 1,
-0.2564978, -1.364806, -0.9692273, 0, 1, 0.4705882, 1,
-0.2551798, -0.6032628, -1.890009, 0, 1, 0.4784314, 1,
-0.2537399, -0.456562, -2.128566, 0, 1, 0.4823529, 1,
-0.2531699, 0.2091551, -1.465017, 0, 1, 0.4901961, 1,
-0.2491427, 0.4167327, -0.5754262, 0, 1, 0.4941176, 1,
-0.2464756, -0.3628504, -1.997652, 0, 1, 0.5019608, 1,
-0.2439982, 1.158349, -0.02284588, 0, 1, 0.509804, 1,
-0.2435769, -0.363436, -2.21451, 0, 1, 0.5137255, 1,
-0.2418017, 0.186769, -0.09450532, 0, 1, 0.5215687, 1,
-0.2369726, -0.7581161, -2.394006, 0, 1, 0.5254902, 1,
-0.2367343, 1.460518, -0.595858, 0, 1, 0.5333334, 1,
-0.2364801, -0.5619009, -3.458052, 0, 1, 0.5372549, 1,
-0.2360357, 0.7612274, -1.880549, 0, 1, 0.5450981, 1,
-0.2329902, -0.08467085, -2.633119, 0, 1, 0.5490196, 1,
-0.2313902, -1.163976, -0.7478695, 0, 1, 0.5568628, 1,
-0.2228931, 0.8595209, 0.2501228, 0, 1, 0.5607843, 1,
-0.2214716, 1.376848, -0.1585026, 0, 1, 0.5686275, 1,
-0.2211514, -0.3424336, -2.594953, 0, 1, 0.572549, 1,
-0.2199597, -0.5976257, -2.368881, 0, 1, 0.5803922, 1,
-0.2175296, 0.5889351, -0.6654086, 0, 1, 0.5843138, 1,
-0.2141265, -1.101233, -3.047134, 0, 1, 0.5921569, 1,
-0.2138394, -0.4857472, -2.755884, 0, 1, 0.5960785, 1,
-0.210955, 0.5035647, -2.211708, 0, 1, 0.6039216, 1,
-0.210824, -0.5158318, -2.965913, 0, 1, 0.6117647, 1,
-0.2105844, 0.958921, -0.09154236, 0, 1, 0.6156863, 1,
-0.2100187, -1.324794, -1.601025, 0, 1, 0.6235294, 1,
-0.207321, 0.1335552, -2.637678, 0, 1, 0.627451, 1,
-0.2065916, -1.333023, -2.233572, 0, 1, 0.6352941, 1,
-0.2032362, -0.190802, -2.104581, 0, 1, 0.6392157, 1,
-0.2003151, 0.5751601, 0.4467525, 0, 1, 0.6470588, 1,
-0.1995091, -0.5161508, -3.192567, 0, 1, 0.6509804, 1,
-0.1935699, -1.287192, -3.666473, 0, 1, 0.6588235, 1,
-0.1935268, 1.456902, 1.840562, 0, 1, 0.6627451, 1,
-0.1933057, 1.430475, 0.06904539, 0, 1, 0.6705883, 1,
-0.1875325, -1.201544, -2.075951, 0, 1, 0.6745098, 1,
-0.1874172, -1.431718, -2.002607, 0, 1, 0.682353, 1,
-0.1820586, -1.059121, -4.164788, 0, 1, 0.6862745, 1,
-0.1798286, -0.8122345, -4.402386, 0, 1, 0.6941177, 1,
-0.1775122, 1.72103, -0.5915843, 0, 1, 0.7019608, 1,
-0.1736531, 0.2079993, -0.892223, 0, 1, 0.7058824, 1,
-0.1732858, 1.017228, 0.1062919, 0, 1, 0.7137255, 1,
-0.1700882, -0.3086049, -1.889253, 0, 1, 0.7176471, 1,
-0.1686582, 1.631643, 1.257883, 0, 1, 0.7254902, 1,
-0.168413, -1.375762, -2.645972, 0, 1, 0.7294118, 1,
-0.1680048, 1.088777, -0.7278919, 0, 1, 0.7372549, 1,
-0.1671365, 0.3441038, -2.453267, 0, 1, 0.7411765, 1,
-0.1628903, -0.2788457, -3.799348, 0, 1, 0.7490196, 1,
-0.1616437, 0.2862153, 1.230093, 0, 1, 0.7529412, 1,
-0.1594443, -1.286499, -2.928784, 0, 1, 0.7607843, 1,
-0.1546912, 0.1158807, -2.239143, 0, 1, 0.7647059, 1,
-0.1513125, -0.647392, -3.229982, 0, 1, 0.772549, 1,
-0.1508893, 0.4686135, -0.3318096, 0, 1, 0.7764706, 1,
-0.1476735, 0.7623942, -0.7407764, 0, 1, 0.7843137, 1,
-0.1469164, 1.163201, -0.9657053, 0, 1, 0.7882353, 1,
-0.1462306, -2.045466, -3.662095, 0, 1, 0.7960784, 1,
-0.1448249, -0.7017138, -1.717326, 0, 1, 0.8039216, 1,
-0.1396714, 0.62294, 1.443196, 0, 1, 0.8078431, 1,
-0.1364754, 1.239731, 0.4590647, 0, 1, 0.8156863, 1,
-0.1318794, -0.3438258, -5.150385, 0, 1, 0.8196079, 1,
-0.1308429, 1.51022, -0.1490585, 0, 1, 0.827451, 1,
-0.1289704, 1.193423, -1.026951, 0, 1, 0.8313726, 1,
-0.128531, 0.3910137, -1.08444, 0, 1, 0.8392157, 1,
-0.1224299, -1.09149, -1.032793, 0, 1, 0.8431373, 1,
-0.1207092, 0.4619605, 0.5443903, 0, 1, 0.8509804, 1,
-0.1179135, 0.2274062, 0.8263652, 0, 1, 0.854902, 1,
-0.1171585, 0.4935697, -0.372249, 0, 1, 0.8627451, 1,
-0.1140978, 0.1209698, -0.4813341, 0, 1, 0.8666667, 1,
-0.1110009, 1.325225, -0.1709255, 0, 1, 0.8745098, 1,
-0.1084248, 0.6011626, -0.1608084, 0, 1, 0.8784314, 1,
-0.1057724, -0.27975, -2.791882, 0, 1, 0.8862745, 1,
-0.104626, 1.353425, -1.824663, 0, 1, 0.8901961, 1,
-0.1024343, -0.8764028, -1.59558, 0, 1, 0.8980392, 1,
-0.09583203, -0.5832851, -4.446066, 0, 1, 0.9058824, 1,
-0.09321029, -0.1609929, -1.713538, 0, 1, 0.9098039, 1,
-0.09128292, 0.04382341, -0.8716801, 0, 1, 0.9176471, 1,
-0.0891189, 1.042784, -0.9654058, 0, 1, 0.9215686, 1,
-0.08806387, 0.1130092, -0.629064, 0, 1, 0.9294118, 1,
-0.08674441, 1.503815, 0.1336983, 0, 1, 0.9333333, 1,
-0.08179458, -0.178661, -2.422426, 0, 1, 0.9411765, 1,
-0.08088339, 1.620863, 0.09364513, 0, 1, 0.945098, 1,
-0.07779524, 0.1324521, -0.1820031, 0, 1, 0.9529412, 1,
-0.07097045, -0.6947551, -4.105793, 0, 1, 0.9568627, 1,
-0.06924304, 1.436902, 0.7854329, 0, 1, 0.9647059, 1,
-0.06819949, -1.328786, -3.572352, 0, 1, 0.9686275, 1,
-0.06720438, -0.8768275, -3.607255, 0, 1, 0.9764706, 1,
-0.06257685, -0.540637, -3.395237, 0, 1, 0.9803922, 1,
-0.06152427, -0.7309932, -1.086586, 0, 1, 0.9882353, 1,
-0.05909739, 0.6834806, 1.738373, 0, 1, 0.9921569, 1,
-0.05824177, 0.9759957, 0.942579, 0, 1, 1, 1,
-0.0568156, -1.339244, -2.649483, 0, 0.9921569, 1, 1,
-0.05580747, 0.8941126, -1.579002, 0, 0.9882353, 1, 1,
-0.05566806, -0.8750162, -2.447292, 0, 0.9803922, 1, 1,
-0.05560754, -0.8495622, -1.606344, 0, 0.9764706, 1, 1,
-0.05543132, -0.2314865, -1.901591, 0, 0.9686275, 1, 1,
-0.05450252, -2.037965, -1.870404, 0, 0.9647059, 1, 1,
-0.05424191, -1.4735, -3.698137, 0, 0.9568627, 1, 1,
-0.05327531, 1.594295, 0.08950677, 0, 0.9529412, 1, 1,
-0.05325215, -0.3250346, -2.907898, 0, 0.945098, 1, 1,
-0.05250164, 0.5893486, -0.8982024, 0, 0.9411765, 1, 1,
-0.05205945, 0.05399713, -0.7073637, 0, 0.9333333, 1, 1,
-0.04787236, 0.05446528, 0.2197236, 0, 0.9294118, 1, 1,
-0.04773023, -0.8522531, -2.13221, 0, 0.9215686, 1, 1,
-0.04529383, 1.191089, -0.7821783, 0, 0.9176471, 1, 1,
-0.04505352, 0.7105467, 1.639048, 0, 0.9098039, 1, 1,
-0.03845768, -0.9827026, -3.014462, 0, 0.9058824, 1, 1,
-0.03512957, -1.62455, -3.485266, 0, 0.8980392, 1, 1,
-0.03233057, -0.4516025, -3.146545, 0, 0.8901961, 1, 1,
-0.0285808, 0.2928803, -0.5217893, 0, 0.8862745, 1, 1,
-0.02418132, -0.6072046, -5.157138, 0, 0.8784314, 1, 1,
-0.02403145, 0.9197397, -0.1383693, 0, 0.8745098, 1, 1,
-0.02382527, -0.6236441, -5.186544, 0, 0.8666667, 1, 1,
-0.02205252, -0.5470836, -3.262594, 0, 0.8627451, 1, 1,
-0.01878245, 0.4906599, -1.241068, 0, 0.854902, 1, 1,
-0.005857513, -0.009567685, -3.183159, 0, 0.8509804, 1, 1,
-0.004452805, -0.2923882, -3.723378, 0, 0.8431373, 1, 1,
0.003271339, 0.3114842, 2.12851, 0, 0.8392157, 1, 1,
0.004921091, -2.093599, 2.508874, 0, 0.8313726, 1, 1,
0.006672439, -0.259414, 4.521678, 0, 0.827451, 1, 1,
0.007774703, -1.509651, 3.447479, 0, 0.8196079, 1, 1,
0.00876385, 0.9226624, 0.197999, 0, 0.8156863, 1, 1,
0.01388332, 0.01452877, 0.4569668, 0, 0.8078431, 1, 1,
0.01913417, -0.3277892, 2.242749, 0, 0.8039216, 1, 1,
0.01925671, 0.05693325, 0.07061468, 0, 0.7960784, 1, 1,
0.02162682, -0.3904659, 4.084378, 0, 0.7882353, 1, 1,
0.02518257, 0.7097848, -0.5695938, 0, 0.7843137, 1, 1,
0.02661409, 0.9524221, 0.02308432, 0, 0.7764706, 1, 1,
0.03682441, -0.6875705, 3.936614, 0, 0.772549, 1, 1,
0.04332123, -0.3374811, 4.436056, 0, 0.7647059, 1, 1,
0.04558131, 1.433468, -1.137639, 0, 0.7607843, 1, 1,
0.04601158, -1.211366, 3.891548, 0, 0.7529412, 1, 1,
0.04615074, -0.1185455, 2.465305, 0, 0.7490196, 1, 1,
0.04675534, -0.3244565, 2.930291, 0, 0.7411765, 1, 1,
0.04713468, -0.8793464, 3.575921, 0, 0.7372549, 1, 1,
0.04782233, 0.3627374, -0.2359929, 0, 0.7294118, 1, 1,
0.04881097, 0.6323232, -0.1743962, 0, 0.7254902, 1, 1,
0.05015082, -1.322144, 3.450181, 0, 0.7176471, 1, 1,
0.0504369, 0.3624788, 1.888126, 0, 0.7137255, 1, 1,
0.05224106, 1.417187, -1.067351, 0, 0.7058824, 1, 1,
0.05411224, 1.133924, 0.7619455, 0, 0.6980392, 1, 1,
0.05708413, 0.7043377, -0.6904389, 0, 0.6941177, 1, 1,
0.05875308, -0.1839684, 4.143997, 0, 0.6862745, 1, 1,
0.06116907, -0.8197249, 1.731059, 0, 0.682353, 1, 1,
0.06457156, 0.8645726, 1.137064, 0, 0.6745098, 1, 1,
0.06722087, -0.08617774, 2.203055, 0, 0.6705883, 1, 1,
0.07156515, -0.7366516, 2.424342, 0, 0.6627451, 1, 1,
0.07500245, -0.4751134, 2.366761, 0, 0.6588235, 1, 1,
0.07711094, 0.2471602, 0.4910863, 0, 0.6509804, 1, 1,
0.08263125, -1.083869, 3.032644, 0, 0.6470588, 1, 1,
0.08581786, 1.152236, -0.592163, 0, 0.6392157, 1, 1,
0.08629057, 0.4574554, 0.04908366, 0, 0.6352941, 1, 1,
0.08968259, 1.045067, 0.2212813, 0, 0.627451, 1, 1,
0.09381404, -0.5510164, 3.034761, 0, 0.6235294, 1, 1,
0.1035768, -0.5808662, 4.057542, 0, 0.6156863, 1, 1,
0.1044253, 0.9946173, 0.8898556, 0, 0.6117647, 1, 1,
0.1215825, 0.4145065, -0.4272045, 0, 0.6039216, 1, 1,
0.1234809, 0.2226161, -0.5388837, 0, 0.5960785, 1, 1,
0.1239422, 0.7736666, -0.7280468, 0, 0.5921569, 1, 1,
0.1240747, 1.608588, 0.1234038, 0, 0.5843138, 1, 1,
0.1249168, -0.02471674, 1.206964, 0, 0.5803922, 1, 1,
0.125293, -1.138262, 1.755226, 0, 0.572549, 1, 1,
0.1265164, 1.036349, -0.3123919, 0, 0.5686275, 1, 1,
0.1272936, -0.5088084, 3.856128, 0, 0.5607843, 1, 1,
0.1357477, -0.9868031, 3.634038, 0, 0.5568628, 1, 1,
0.1368331, -0.2155395, 4.771037, 0, 0.5490196, 1, 1,
0.1434999, -0.5624089, 2.876687, 0, 0.5450981, 1, 1,
0.1439329, 2.518735, -0.173619, 0, 0.5372549, 1, 1,
0.1527799, 0.1436504, 0.3035027, 0, 0.5333334, 1, 1,
0.1571837, -0.126601, 3.247175, 0, 0.5254902, 1, 1,
0.1585167, -0.8542709, 1.886048, 0, 0.5215687, 1, 1,
0.1598944, -0.3477932, 2.823968, 0, 0.5137255, 1, 1,
0.1613211, -1.162967, 1.323137, 0, 0.509804, 1, 1,
0.1628298, -0.9421105, 2.046727, 0, 0.5019608, 1, 1,
0.1653943, 0.3336472, 0.3908062, 0, 0.4941176, 1, 1,
0.1684579, -0.7295079, 4.410735, 0, 0.4901961, 1, 1,
0.1819809, -0.3802671, 1.258404, 0, 0.4823529, 1, 1,
0.1855458, 0.5318215, 0.5631382, 0, 0.4784314, 1, 1,
0.1869065, 1.337389, 1.920621, 0, 0.4705882, 1, 1,
0.1940608, -0.208765, 1.092223, 0, 0.4666667, 1, 1,
0.1969681, -0.7758315, 4.85343, 0, 0.4588235, 1, 1,
0.2015098, 0.246287, 1.464864, 0, 0.454902, 1, 1,
0.2050539, 0.624337, -0.8164357, 0, 0.4470588, 1, 1,
0.2051002, 0.8423721, 0.2347845, 0, 0.4431373, 1, 1,
0.2055041, 0.6603711, 1.367575, 0, 0.4352941, 1, 1,
0.2061915, -0.7321986, 2.37791, 0, 0.4313726, 1, 1,
0.2087104, 0.5722233, 1.995839, 0, 0.4235294, 1, 1,
0.2099101, 0.2506092, 1.597626, 0, 0.4196078, 1, 1,
0.2113028, 0.646054, -0.6816199, 0, 0.4117647, 1, 1,
0.211729, -0.6599472, 3.258524, 0, 0.4078431, 1, 1,
0.2160581, 1.336335, -0.3601672, 0, 0.4, 1, 1,
0.217547, 1.34545, 0.4383034, 0, 0.3921569, 1, 1,
0.2224434, 1.626353, -0.366663, 0, 0.3882353, 1, 1,
0.2267433, 1.608052, 0.8649749, 0, 0.3803922, 1, 1,
0.2292337, 2.113363, 2.341238, 0, 0.3764706, 1, 1,
0.2318875, -2.146099, 3.090105, 0, 0.3686275, 1, 1,
0.2339795, -0.5367211, 1.617355, 0, 0.3647059, 1, 1,
0.234574, 1.27818, 1.665361, 0, 0.3568628, 1, 1,
0.2346953, 0.7104823, 1.047921, 0, 0.3529412, 1, 1,
0.2353091, 1.04252, 0.04826846, 0, 0.345098, 1, 1,
0.2363926, -0.9357449, 2.882159, 0, 0.3411765, 1, 1,
0.2409612, 0.8766271, 0.938086, 0, 0.3333333, 1, 1,
0.2410308, 0.8965328, 0.2677281, 0, 0.3294118, 1, 1,
0.2454629, -0.4702133, 1.327139, 0, 0.3215686, 1, 1,
0.2454668, 0.02854425, 0.2691633, 0, 0.3176471, 1, 1,
0.246401, -0.2380834, 1.498934, 0, 0.3098039, 1, 1,
0.247166, -0.4740843, 2.571928, 0, 0.3058824, 1, 1,
0.2480289, -0.844609, 1.847518, 0, 0.2980392, 1, 1,
0.2482577, 1.317688, 1.225516, 0, 0.2901961, 1, 1,
0.2503637, -0.3943816, 4.195202, 0, 0.2862745, 1, 1,
0.2522408, 0.9678041, -0.6865615, 0, 0.2784314, 1, 1,
0.2528058, 1.86059, 0.3377253, 0, 0.2745098, 1, 1,
0.254391, -0.1909287, 2.648079, 0, 0.2666667, 1, 1,
0.2545323, 0.8834441, -0.3818439, 0, 0.2627451, 1, 1,
0.2550336, -0.5224054, 2.723607, 0, 0.254902, 1, 1,
0.2564958, 1.282774, 2.398696, 0, 0.2509804, 1, 1,
0.2576157, -0.6962972, 2.736226, 0, 0.2431373, 1, 1,
0.26082, 1.027967, 1.970408, 0, 0.2392157, 1, 1,
0.2635241, 1.142749, 0.5894783, 0, 0.2313726, 1, 1,
0.2648053, 0.9731429, 1.173029, 0, 0.227451, 1, 1,
0.2675502, -0.9581814, 3.022144, 0, 0.2196078, 1, 1,
0.2675522, 1.384921, 1.153682, 0, 0.2156863, 1, 1,
0.2678255, -0.5066474, 2.971069, 0, 0.2078431, 1, 1,
0.2693985, 2.16743, 1.836097, 0, 0.2039216, 1, 1,
0.2739025, -1.197622, 3.033613, 0, 0.1960784, 1, 1,
0.2774615, -0.9067842, 3.692187, 0, 0.1882353, 1, 1,
0.2776816, -0.3958185, 3.229424, 0, 0.1843137, 1, 1,
0.2795063, -0.9598031, 3.263483, 0, 0.1764706, 1, 1,
0.2821422, -0.742974, 1.950239, 0, 0.172549, 1, 1,
0.2889641, -0.2850195, 2.090293, 0, 0.1647059, 1, 1,
0.2903412, -1.161984, 4.204931, 0, 0.1607843, 1, 1,
0.2933406, 0.4123611, -1.341662, 0, 0.1529412, 1, 1,
0.2944611, 0.02030972, 0.239658, 0, 0.1490196, 1, 1,
0.2976636, -0.9485576, 3.746293, 0, 0.1411765, 1, 1,
0.3072834, 0.963288, 0.4772954, 0, 0.1372549, 1, 1,
0.3074829, 0.1301536, 3.23587, 0, 0.1294118, 1, 1,
0.3091554, 0.5164224, 0.6800525, 0, 0.1254902, 1, 1,
0.3122247, 1.470712, 1.496123, 0, 0.1176471, 1, 1,
0.3155094, -0.2215573, 3.016564, 0, 0.1137255, 1, 1,
0.3159645, 2.050803, -0.5681678, 0, 0.1058824, 1, 1,
0.3278241, -0.2286878, 1.986699, 0, 0.09803922, 1, 1,
0.3309443, 0.2568738, 1.978764, 0, 0.09411765, 1, 1,
0.3334737, -0.6617085, 1.48314, 0, 0.08627451, 1, 1,
0.3393312, 0.6939374, -0.1557192, 0, 0.08235294, 1, 1,
0.3397588, 0.8981655, -0.1701321, 0, 0.07450981, 1, 1,
0.3404075, -1.530871, 3.519464, 0, 0.07058824, 1, 1,
0.3442976, 1.516549, -0.3279608, 0, 0.0627451, 1, 1,
0.3480502, -1.349164, 2.964244, 0, 0.05882353, 1, 1,
0.3498712, 0.2273683, 2.219199, 0, 0.05098039, 1, 1,
0.3588298, -1.223289, 4.141243, 0, 0.04705882, 1, 1,
0.3616439, -0.07664984, 1.424164, 0, 0.03921569, 1, 1,
0.3620887, -0.4146966, 2.188368, 0, 0.03529412, 1, 1,
0.3623472, -0.09491927, 3.198117, 0, 0.02745098, 1, 1,
0.3671688, 0.7541707, 0.8673109, 0, 0.02352941, 1, 1,
0.3695104, -0.9756825, 3.791215, 0, 0.01568628, 1, 1,
0.3720595, -1.440251, 3.0678, 0, 0.01176471, 1, 1,
0.3722637, 0.07474753, 2.45369, 0, 0.003921569, 1, 1,
0.3820815, -1.458034, 1.717534, 0.003921569, 0, 1, 1,
0.3869331, 0.704641, 0.3930642, 0.007843138, 0, 1, 1,
0.3879822, 1.051659, -1.409779, 0.01568628, 0, 1, 1,
0.390085, -0.459631, 3.717011, 0.01960784, 0, 1, 1,
0.395347, -0.5057679, 2.975557, 0.02745098, 0, 1, 1,
0.4006921, 0.188598, 2.29415, 0.03137255, 0, 1, 1,
0.4008748, 0.7110744, 0.3798042, 0.03921569, 0, 1, 1,
0.4040037, -1.230344, 3.854664, 0.04313726, 0, 1, 1,
0.4043571, 0.855483, 1.526644, 0.05098039, 0, 1, 1,
0.4078377, 0.5835813, 1.118518, 0.05490196, 0, 1, 1,
0.4081752, 0.2420027, 1.392418, 0.0627451, 0, 1, 1,
0.4083873, 0.4370697, -0.177774, 0.06666667, 0, 1, 1,
0.4083951, -0.6619561, 2.186927, 0.07450981, 0, 1, 1,
0.4086861, 0.4831666, 1.281413, 0.07843138, 0, 1, 1,
0.4090719, -0.3305423, 1.821519, 0.08627451, 0, 1, 1,
0.411134, 1.911692, 1.575975, 0.09019608, 0, 1, 1,
0.4116418, 0.7916065, 1.440871, 0.09803922, 0, 1, 1,
0.4131399, -0.6115069, 3.383116, 0.1058824, 0, 1, 1,
0.4179098, -0.6995377, 4.860476, 0.1098039, 0, 1, 1,
0.42215, -0.8074291, 2.469988, 0.1176471, 0, 1, 1,
0.42248, -0.8113081, 3.113943, 0.1215686, 0, 1, 1,
0.4324718, 0.7071347, 0.1544031, 0.1294118, 0, 1, 1,
0.4372399, 0.6332494, 2.698306, 0.1333333, 0, 1, 1,
0.4381167, -2.124275, 2.654283, 0.1411765, 0, 1, 1,
0.442569, -0.2788905, 0.6149674, 0.145098, 0, 1, 1,
0.4445822, -0.6322271, 3.451497, 0.1529412, 0, 1, 1,
0.4470588, -0.309752, 1.766557, 0.1568628, 0, 1, 1,
0.4482105, -1.135535, 4.648541, 0.1647059, 0, 1, 1,
0.4542898, 1.081269, 0.6737917, 0.1686275, 0, 1, 1,
0.459858, -0.9167831, 1.89814, 0.1764706, 0, 1, 1,
0.4645638, 0.6490418, 1.907192, 0.1803922, 0, 1, 1,
0.4657784, -1.209805, 3.399198, 0.1882353, 0, 1, 1,
0.4673678, 0.8986865, -0.1075414, 0.1921569, 0, 1, 1,
0.4674343, 0.7996082, 0.459124, 0.2, 0, 1, 1,
0.4696589, 0.4953803, 2.065417, 0.2078431, 0, 1, 1,
0.4756684, 0.2266596, 1.862864, 0.2117647, 0, 1, 1,
0.4849468, 0.3028158, 0.5850356, 0.2196078, 0, 1, 1,
0.4883549, -0.8042725, 1.619011, 0.2235294, 0, 1, 1,
0.4898733, 0.6303133, 1.900173, 0.2313726, 0, 1, 1,
0.4905752, -0.8064736, 3.133912, 0.2352941, 0, 1, 1,
0.4966156, -0.8235431, 3.126082, 0.2431373, 0, 1, 1,
0.4972129, -0.7610095, 0.7628248, 0.2470588, 0, 1, 1,
0.4974615, -0.1735376, 2.690665, 0.254902, 0, 1, 1,
0.497709, 0.619413, -1.456623, 0.2588235, 0, 1, 1,
0.499484, -1.125236, 1.866841, 0.2666667, 0, 1, 1,
0.499487, 0.4887667, 1.203878, 0.2705882, 0, 1, 1,
0.4995466, -0.3927493, 2.714992, 0.2784314, 0, 1, 1,
0.5024289, 0.5267661, 1.055305, 0.282353, 0, 1, 1,
0.5037885, 0.3927579, 1.00552, 0.2901961, 0, 1, 1,
0.5053763, 0.6924572, 0.3138488, 0.2941177, 0, 1, 1,
0.5080135, 0.4272528, 1.911508, 0.3019608, 0, 1, 1,
0.5154111, -1.45535, 2.854624, 0.3098039, 0, 1, 1,
0.5238016, 1.321925, 1.191522, 0.3137255, 0, 1, 1,
0.5258091, -1.442063, 2.414719, 0.3215686, 0, 1, 1,
0.5266539, 1.225614, -0.9512082, 0.3254902, 0, 1, 1,
0.5326821, -0.1638177, 1.960009, 0.3333333, 0, 1, 1,
0.5361508, -1.125807, 2.504648, 0.3372549, 0, 1, 1,
0.5372534, -0.4428674, 1.670375, 0.345098, 0, 1, 1,
0.5402592, 0.0523302, 1.164962, 0.3490196, 0, 1, 1,
0.5467801, 0.3182865, 0.602477, 0.3568628, 0, 1, 1,
0.5476791, 1.228056, 0.4233994, 0.3607843, 0, 1, 1,
0.5497536, -0.4474369, 2.993105, 0.3686275, 0, 1, 1,
0.5497683, -1.320223, 2.276993, 0.372549, 0, 1, 1,
0.552635, -0.8968079, 3.193009, 0.3803922, 0, 1, 1,
0.557528, -1.608135, 2.462642, 0.3843137, 0, 1, 1,
0.5681939, 0.3734865, 1.092642, 0.3921569, 0, 1, 1,
0.5736891, -1.084653, 0.6013474, 0.3960784, 0, 1, 1,
0.5812245, -0.8903402, 1.98699, 0.4039216, 0, 1, 1,
0.5823591, 0.1263027, 1.534699, 0.4117647, 0, 1, 1,
0.5891353, -1.424608, 3.073663, 0.4156863, 0, 1, 1,
0.5900616, 0.1091031, 1.263555, 0.4235294, 0, 1, 1,
0.5932072, -0.8861157, 3.870902, 0.427451, 0, 1, 1,
0.5934739, 0.4136996, 1.954222, 0.4352941, 0, 1, 1,
0.5998579, -0.7691933, 4.468883, 0.4392157, 0, 1, 1,
0.6081592, -0.08559367, 0.9737639, 0.4470588, 0, 1, 1,
0.6130711, 0.8974952, -0.6376781, 0.4509804, 0, 1, 1,
0.6174761, 0.6670486, -0.1298514, 0.4588235, 0, 1, 1,
0.6209274, 0.3381511, 2.057603, 0.4627451, 0, 1, 1,
0.6209415, -1.14783, 1.914197, 0.4705882, 0, 1, 1,
0.622316, 0.05739061, 0.9102773, 0.4745098, 0, 1, 1,
0.6251128, -1.783846, 3.077044, 0.4823529, 0, 1, 1,
0.6255528, 1.695395, 1.185793, 0.4862745, 0, 1, 1,
0.6267164, 0.77597, 0.6282296, 0.4941176, 0, 1, 1,
0.6332443, 0.8798929, 1.726444, 0.5019608, 0, 1, 1,
0.6332996, -1.451288, 2.091897, 0.5058824, 0, 1, 1,
0.6356703, 0.8321263, 1.871106, 0.5137255, 0, 1, 1,
0.6467696, -0.9127884, 1.98042, 0.5176471, 0, 1, 1,
0.6467814, 1.494066, 2.030522, 0.5254902, 0, 1, 1,
0.6469346, 0.4725648, 0.8768407, 0.5294118, 0, 1, 1,
0.6516109, -0.1815983, 2.857136, 0.5372549, 0, 1, 1,
0.6533387, 0.4166927, 0.843544, 0.5411765, 0, 1, 1,
0.6568362, -1.668718, 2.115066, 0.5490196, 0, 1, 1,
0.6644324, 0.1013219, 1.138032, 0.5529412, 0, 1, 1,
0.6681535, 0.6178743, 1.443716, 0.5607843, 0, 1, 1,
0.6704145, -0.236827, 0.2974751, 0.5647059, 0, 1, 1,
0.6765323, 1.164894, 2.152456, 0.572549, 0, 1, 1,
0.6812413, -0.6238887, 2.321375, 0.5764706, 0, 1, 1,
0.6841568, 1.124398, 1.114448, 0.5843138, 0, 1, 1,
0.6862008, -0.9726477, 3.443542, 0.5882353, 0, 1, 1,
0.6877126, -0.4692175, 2.37085, 0.5960785, 0, 1, 1,
0.6923383, -1.84015, 1.530538, 0.6039216, 0, 1, 1,
0.7022597, 2.888363, 0.3748311, 0.6078432, 0, 1, 1,
0.7062915, 0.9880664, -0.6303297, 0.6156863, 0, 1, 1,
0.7115353, -1.049119, 2.387741, 0.6196079, 0, 1, 1,
0.7137289, 0.3170317, -0.6646417, 0.627451, 0, 1, 1,
0.7174777, -0.3188531, 1.244214, 0.6313726, 0, 1, 1,
0.7198282, 0.3743952, 0.3863671, 0.6392157, 0, 1, 1,
0.7202334, -0.1620931, 2.50385, 0.6431373, 0, 1, 1,
0.7228422, 0.3894171, 0.3850219, 0.6509804, 0, 1, 1,
0.7331156, 0.6265358, -0.4241393, 0.654902, 0, 1, 1,
0.7356811, 0.8796749, 0.4833978, 0.6627451, 0, 1, 1,
0.7397191, -0.9705456, 1.695913, 0.6666667, 0, 1, 1,
0.7718439, -0.01610279, 2.908024, 0.6745098, 0, 1, 1,
0.7743626, 0.3286859, 1.408984, 0.6784314, 0, 1, 1,
0.7814963, -0.096398, 2.289999, 0.6862745, 0, 1, 1,
0.7841263, 1.314252, 1.765577, 0.6901961, 0, 1, 1,
0.7847204, -0.3663208, 1.748884, 0.6980392, 0, 1, 1,
0.7857905, 1.26286, -0.02627723, 0.7058824, 0, 1, 1,
0.7869236, -2.494416, 3.596946, 0.7098039, 0, 1, 1,
0.7915031, -0.6405956, 3.010317, 0.7176471, 0, 1, 1,
0.8003033, 2.281903, -1.053944, 0.7215686, 0, 1, 1,
0.8028519, -1.389144, 1.775117, 0.7294118, 0, 1, 1,
0.8057564, 0.3313385, 1.688783, 0.7333333, 0, 1, 1,
0.8062671, -0.3196755, 2.332097, 0.7411765, 0, 1, 1,
0.808076, 0.4509888, 0.6582486, 0.7450981, 0, 1, 1,
0.8107762, -0.8760659, 2.092047, 0.7529412, 0, 1, 1,
0.8118169, -0.5233616, 1.384703, 0.7568628, 0, 1, 1,
0.8202311, 2.511187, -1.526087, 0.7647059, 0, 1, 1,
0.8233848, -1.187667, 2.359232, 0.7686275, 0, 1, 1,
0.8239622, 0.7497153, 0.4665869, 0.7764706, 0, 1, 1,
0.8256016, 1.115904, 0.6926175, 0.7803922, 0, 1, 1,
0.8269075, -0.5725735, 2.280216, 0.7882353, 0, 1, 1,
0.8294512, 0.5104232, 1.471577, 0.7921569, 0, 1, 1,
0.8396024, -0.2617535, 0.9900624, 0.8, 0, 1, 1,
0.8498735, 0.2008761, 2.263124, 0.8078431, 0, 1, 1,
0.8545361, 0.4371262, -0.006283262, 0.8117647, 0, 1, 1,
0.8551362, -0.3744092, 2.098839, 0.8196079, 0, 1, 1,
0.8567997, -0.08534916, 1.385575, 0.8235294, 0, 1, 1,
0.8569201, -0.04274971, 3.276848, 0.8313726, 0, 1, 1,
0.8670371, 0.5192733, -0.8050209, 0.8352941, 0, 1, 1,
0.8708728, -0.01137312, 1.007813, 0.8431373, 0, 1, 1,
0.870988, -1.051618, 4.807894, 0.8470588, 0, 1, 1,
0.8723853, -0.142405, 1.223385, 0.854902, 0, 1, 1,
0.87311, 1.657657, 0.06834497, 0.8588235, 0, 1, 1,
0.8734359, 1.703411, 0.4444203, 0.8666667, 0, 1, 1,
0.8753992, 0.2603603, -0.5623095, 0.8705882, 0, 1, 1,
0.8768966, 0.1589647, 1.627936, 0.8784314, 0, 1, 1,
0.8888938, 0.4825405, 1.424269, 0.8823529, 0, 1, 1,
0.8951447, -0.1685513, 2.567172, 0.8901961, 0, 1, 1,
0.8957772, 1.066326, -0.7778898, 0.8941177, 0, 1, 1,
0.8980501, -0.2576222, 0.6420421, 0.9019608, 0, 1, 1,
0.8985119, 1.364063, 1.322227, 0.9098039, 0, 1, 1,
0.9047337, -0.07838113, -1.120885, 0.9137255, 0, 1, 1,
0.9109855, -0.2338914, 1.913223, 0.9215686, 0, 1, 1,
0.9113594, -0.2956454, 2.078816, 0.9254902, 0, 1, 1,
0.9116661, 0.5455479, 3.109863, 0.9333333, 0, 1, 1,
0.9123395, 0.05536104, 0.6924721, 0.9372549, 0, 1, 1,
0.9133179, -0.2142423, 4.806426, 0.945098, 0, 1, 1,
0.9241566, 1.386301, 0.2584909, 0.9490196, 0, 1, 1,
0.9330955, -0.389266, 1.852864, 0.9568627, 0, 1, 1,
0.943235, 0.652502, 2.683418, 0.9607843, 0, 1, 1,
0.9435751, -1.439515, 1.963608, 0.9686275, 0, 1, 1,
0.943581, -0.4906093, 1.819762, 0.972549, 0, 1, 1,
0.9438408, -0.2555669, 3.108357, 0.9803922, 0, 1, 1,
0.9452129, 0.4794242, 1.629912, 0.9843137, 0, 1, 1,
0.9584675, 1.313813, 0.4357892, 0.9921569, 0, 1, 1,
0.9615113, -0.7686681, 3.986746, 0.9960784, 0, 1, 1,
0.9625441, -0.783597, 1.734697, 1, 0, 0.9960784, 1,
0.9736649, 2.097814, 1.12618, 1, 0, 0.9882353, 1,
0.9756931, 0.3578347, 1.202446, 1, 0, 0.9843137, 1,
0.9797609, -0.4624276, 2.489337, 1, 0, 0.9764706, 1,
0.9828229, 0.6241932, 1.704699, 1, 0, 0.972549, 1,
0.9848159, -0.5361564, 4.152826, 1, 0, 0.9647059, 1,
0.9894325, -0.1759494, 2.895127, 1, 0, 0.9607843, 1,
0.9907109, 0.06490679, 2.221761, 1, 0, 0.9529412, 1,
0.9911754, 0.3302019, 2.574229, 1, 0, 0.9490196, 1,
0.9915871, -0.04097426, 2.152999, 1, 0, 0.9411765, 1,
1.00488, -0.1180797, 1.198953, 1, 0, 0.9372549, 1,
1.008602, -1.165813, 2.707564, 1, 0, 0.9294118, 1,
1.013238, 0.164761, 1.849157, 1, 0, 0.9254902, 1,
1.019431, 0.978143, 1.253334, 1, 0, 0.9176471, 1,
1.020276, 0.1337893, 2.330259, 1, 0, 0.9137255, 1,
1.023672, -0.2875305, 0.2041616, 1, 0, 0.9058824, 1,
1.024587, -0.4710543, 2.472703, 1, 0, 0.9019608, 1,
1.032409, -0.06833722, 1.2883, 1, 0, 0.8941177, 1,
1.037051, -0.02442983, 4.176424, 1, 0, 0.8862745, 1,
1.041399, -1.084062, 3.169046, 1, 0, 0.8823529, 1,
1.059884, 0.4823822, 2.618795, 1, 0, 0.8745098, 1,
1.064288, 0.8001097, -0.2966414, 1, 0, 0.8705882, 1,
1.072246, -1.262494, 2.03108, 1, 0, 0.8627451, 1,
1.072561, -1.501992, 2.217366, 1, 0, 0.8588235, 1,
1.075173, -0.6393918, 1.460107, 1, 0, 0.8509804, 1,
1.076155, 0.6636785, 1.161321, 1, 0, 0.8470588, 1,
1.085245, -1.389221, 1.68896, 1, 0, 0.8392157, 1,
1.088927, 0.1579993, 2.513834, 1, 0, 0.8352941, 1,
1.090383, -0.4953996, 2.879066, 1, 0, 0.827451, 1,
1.092054, -0.7386779, 1.637847, 1, 0, 0.8235294, 1,
1.095363, 0.3960905, 2.544454, 1, 0, 0.8156863, 1,
1.096564, 0.1389584, 0.9845276, 1, 0, 0.8117647, 1,
1.099617, -0.1710673, 3.824573, 1, 0, 0.8039216, 1,
1.106532, -0.4998181, 1.808782, 1, 0, 0.7960784, 1,
1.110257, -0.7629735, 0.9479805, 1, 0, 0.7921569, 1,
1.115482, -0.1850284, 3.033682, 1, 0, 0.7843137, 1,
1.116634, 1.57032, 0.1929304, 1, 0, 0.7803922, 1,
1.122904, 0.04903133, 2.783388, 1, 0, 0.772549, 1,
1.124989, -0.1731043, 2.473523, 1, 0, 0.7686275, 1,
1.130269, -0.2081657, 2.980763, 1, 0, 0.7607843, 1,
1.133512, 0.2287254, 1.238137, 1, 0, 0.7568628, 1,
1.140561, -0.6144326, 3.228852, 1, 0, 0.7490196, 1,
1.144204, 0.6504943, 1.821532, 1, 0, 0.7450981, 1,
1.150061, -0.3497782, 1.843595, 1, 0, 0.7372549, 1,
1.151354, 1.538779, 0.6681747, 1, 0, 0.7333333, 1,
1.154059, 0.07653793, 0.6100161, 1, 0, 0.7254902, 1,
1.15707, -0.401773, 1.791492, 1, 0, 0.7215686, 1,
1.158831, -0.1217574, 0.9571596, 1, 0, 0.7137255, 1,
1.159634, 0.6375631, 1.486273, 1, 0, 0.7098039, 1,
1.171419, 1.505131, 0.8656477, 1, 0, 0.7019608, 1,
1.178307, 1.088409, 2.001472, 1, 0, 0.6941177, 1,
1.180885, -0.6363832, 1.591521, 1, 0, 0.6901961, 1,
1.181007, 0.2251894, 1.187374, 1, 0, 0.682353, 1,
1.182942, 2.866719, -1.190511, 1, 0, 0.6784314, 1,
1.187113, 0.7249081, 0.9133412, 1, 0, 0.6705883, 1,
1.190098, 0.5685059, 1.011827, 1, 0, 0.6666667, 1,
1.190488, -0.894457, 2.858445, 1, 0, 0.6588235, 1,
1.194838, 1.692045, 1.157527, 1, 0, 0.654902, 1,
1.195075, -0.2310717, 1.958365, 1, 0, 0.6470588, 1,
1.197399, 1.156434, 0.2778448, 1, 0, 0.6431373, 1,
1.19815, 0.8944516, -0.3468455, 1, 0, 0.6352941, 1,
1.199717, -0.2984526, 2.199228, 1, 0, 0.6313726, 1,
1.200191, -1.940735, 1.205968, 1, 0, 0.6235294, 1,
1.201482, -1.601425, 4.169466, 1, 0, 0.6196079, 1,
1.203156, -0.6824926, 2.338363, 1, 0, 0.6117647, 1,
1.207196, 0.6994635, 2.096991, 1, 0, 0.6078432, 1,
1.212588, 1.614008, -0.8497881, 1, 0, 0.6, 1,
1.238285, 0.8524212, 1.059977, 1, 0, 0.5921569, 1,
1.241801, 1.467766, -0.2973197, 1, 0, 0.5882353, 1,
1.244191, -0.8320687, 2.627102, 1, 0, 0.5803922, 1,
1.245125, -0.5415072, 1.893843, 1, 0, 0.5764706, 1,
1.251333, -1.019249, 2.625661, 1, 0, 0.5686275, 1,
1.25613, -0.9372082, 2.126378, 1, 0, 0.5647059, 1,
1.256369, 2.139972, 1.093811, 1, 0, 0.5568628, 1,
1.263402, 0.8867164, 0.6046832, 1, 0, 0.5529412, 1,
1.275909, 0.02985636, 0.4577778, 1, 0, 0.5450981, 1,
1.279875, -0.01812505, 0.9356053, 1, 0, 0.5411765, 1,
1.28042, 1.17067, 0.9524173, 1, 0, 0.5333334, 1,
1.284352, -0.2134971, 2.300269, 1, 0, 0.5294118, 1,
1.296099, -0.4446552, 2.445732, 1, 0, 0.5215687, 1,
1.306946, -1.28022, 1.414983, 1, 0, 0.5176471, 1,
1.319835, -0.8337465, 2.867646, 1, 0, 0.509804, 1,
1.343582, 0.9842063, 0.08788007, 1, 0, 0.5058824, 1,
1.350697, -0.5732018, 0.708292, 1, 0, 0.4980392, 1,
1.363824, -1.227284, 3.057188, 1, 0, 0.4901961, 1,
1.370239, 0.3444469, 1.600153, 1, 0, 0.4862745, 1,
1.375602, 0.508637, 1.581521, 1, 0, 0.4784314, 1,
1.376625, 0.1337107, 2.007748, 1, 0, 0.4745098, 1,
1.379031, 0.5451798, 1.560016, 1, 0, 0.4666667, 1,
1.379687, 0.7581689, 1.745335, 1, 0, 0.4627451, 1,
1.384179, -1.503252, 2.428671, 1, 0, 0.454902, 1,
1.3913, 0.6343499, -0.1971979, 1, 0, 0.4509804, 1,
1.398819, -0.2541806, 1.10379, 1, 0, 0.4431373, 1,
1.402981, 1.062829, 1.855224, 1, 0, 0.4392157, 1,
1.404249, -0.4694338, 1.344494, 1, 0, 0.4313726, 1,
1.413373, 1.010411, 0.8966712, 1, 0, 0.427451, 1,
1.418191, -0.5089923, 0.5533534, 1, 0, 0.4196078, 1,
1.423933, 0.2660943, 1.25156, 1, 0, 0.4156863, 1,
1.444968, -0.2329893, 3.101162, 1, 0, 0.4078431, 1,
1.445239, -0.6707537, 2.100631, 1, 0, 0.4039216, 1,
1.447731, -0.3010577, 2.929291, 1, 0, 0.3960784, 1,
1.449899, 0.7164162, 2.006099, 1, 0, 0.3882353, 1,
1.468684, 0.3627326, 0.007175367, 1, 0, 0.3843137, 1,
1.470949, -0.4489602, 1.589579, 1, 0, 0.3764706, 1,
1.477769, -1.190181, 1.777188, 1, 0, 0.372549, 1,
1.482391, 1.331219, 1.024761, 1, 0, 0.3647059, 1,
1.485331, -1.541009, 4.228084, 1, 0, 0.3607843, 1,
1.486211, -0.2483505, 0.6844333, 1, 0, 0.3529412, 1,
1.488173, -1.500908, 1.601887, 1, 0, 0.3490196, 1,
1.495794, -1.124067, 2.269635, 1, 0, 0.3411765, 1,
1.502073, 0.3838663, 2.371831, 1, 0, 0.3372549, 1,
1.522101, 1.207333, -0.7237049, 1, 0, 0.3294118, 1,
1.525315, -1.551477, 1.962917, 1, 0, 0.3254902, 1,
1.53018, -1.666678, 3.47208, 1, 0, 0.3176471, 1,
1.579952, -2.452676, 4.194248, 1, 0, 0.3137255, 1,
1.585102, -0.7112932, 2.103457, 1, 0, 0.3058824, 1,
1.587184, -0.7005262, 3.090782, 1, 0, 0.2980392, 1,
1.597227, 0.2729434, -0.4139213, 1, 0, 0.2941177, 1,
1.601267, 0.2718613, 1.507101, 1, 0, 0.2862745, 1,
1.603943, -1.036068, 3.783359, 1, 0, 0.282353, 1,
1.615317, 1.40447, 2.26223, 1, 0, 0.2745098, 1,
1.627327, 0.1760954, 1.260607, 1, 0, 0.2705882, 1,
1.632649, -1.458713, 1.421774, 1, 0, 0.2627451, 1,
1.64764, 1.091987, 0.6503888, 1, 0, 0.2588235, 1,
1.656307, -0.1659577, 2.548365, 1, 0, 0.2509804, 1,
1.705322, -0.8598874, 2.645679, 1, 0, 0.2470588, 1,
1.716306, 0.3480459, 0.6584311, 1, 0, 0.2392157, 1,
1.718475, 0.0178948, 1.394912, 1, 0, 0.2352941, 1,
1.743083, -0.1493699, 3.520181, 1, 0, 0.227451, 1,
1.752813, -0.4580762, 0.9935022, 1, 0, 0.2235294, 1,
1.782375, -1.628831, 4.266361, 1, 0, 0.2156863, 1,
1.820712, 0.6171686, -0.3275296, 1, 0, 0.2117647, 1,
1.823467, 0.7360657, 1.500535, 1, 0, 0.2039216, 1,
1.830136, 0.317951, 2.647035, 1, 0, 0.1960784, 1,
1.84409, -0.1363805, 2.093596, 1, 0, 0.1921569, 1,
1.850662, 0.1233319, 2.481313, 1, 0, 0.1843137, 1,
1.85671, 0.8535141, 2.057655, 1, 0, 0.1803922, 1,
1.888252, 1.756253, 0.5011604, 1, 0, 0.172549, 1,
1.902477, 0.1655452, 0.0006868574, 1, 0, 0.1686275, 1,
1.937032, -0.791823, 2.541239, 1, 0, 0.1607843, 1,
1.958327, 0.07625612, 1.556946, 1, 0, 0.1568628, 1,
1.965218, -0.953666, 4.49675, 1, 0, 0.1490196, 1,
1.97008, 0.2831022, 1.584826, 1, 0, 0.145098, 1,
1.985752, 0.8820146, 0.1107498, 1, 0, 0.1372549, 1,
1.999574, -0.5048943, 1.176661, 1, 0, 0.1333333, 1,
2.016655, 0.832734, 1.753475, 1, 0, 0.1254902, 1,
2.017402, -1.385823, 1.652439, 1, 0, 0.1215686, 1,
2.092725, 0.1643835, 2.717811, 1, 0, 0.1137255, 1,
2.10419, 0.6478676, -0.1504044, 1, 0, 0.1098039, 1,
2.128503, -0.6043579, 1.244877, 1, 0, 0.1019608, 1,
2.157488, 0.9153502, -0.4457144, 1, 0, 0.09411765, 1,
2.209782, 1.063328, -0.2490842, 1, 0, 0.09019608, 1,
2.211963, 0.03442432, 3.596186, 1, 0, 0.08235294, 1,
2.226758, 1.462188, 0.1756425, 1, 0, 0.07843138, 1,
2.290485, 0.08137589, 1.05419, 1, 0, 0.07058824, 1,
2.365323, 1.921648, 0.1867843, 1, 0, 0.06666667, 1,
2.401689, -0.3352576, 1.966168, 1, 0, 0.05882353, 1,
2.512256, -0.2661071, 1.828039, 1, 0, 0.05490196, 1,
2.606189, -0.2938094, 2.669339, 1, 0, 0.04705882, 1,
2.655408, -0.2487223, 1.221951, 1, 0, 0.04313726, 1,
2.72176, -1.422724, 1.414083, 1, 0, 0.03529412, 1,
2.742865, 0.1153139, 1.362083, 1, 0, 0.03137255, 1,
2.758314, -1.099402, 3.811755, 1, 0, 0.02352941, 1,
2.877831, 1.031998, 1.504601, 1, 0, 0.01960784, 1,
2.995393, 0.04009894, 1.743998, 1, 0, 0.01176471, 1,
3.884858, -1.320105, 2.383188, 1, 0, 0.007843138, 1
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
0.1785849, -3.606209, -6.889514, 0, -0.5, 0.5, 0.5,
0.1785849, -3.606209, -6.889514, 1, -0.5, 0.5, 0.5,
0.1785849, -3.606209, -6.889514, 1, 1.5, 0.5, 0.5,
0.1785849, -3.606209, -6.889514, 0, 1.5, 0.5, 0.5
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
-4.784114, 0.1117182, -6.889514, 0, -0.5, 0.5, 0.5,
-4.784114, 0.1117182, -6.889514, 1, -0.5, 0.5, 0.5,
-4.784114, 0.1117182, -6.889514, 1, 1.5, 0.5, 0.5,
-4.784114, 0.1117182, -6.889514, 0, 1.5, 0.5, 0.5
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
-4.784114, -3.606209, -0.163034, 0, -0.5, 0.5, 0.5,
-4.784114, -3.606209, -0.163034, 1, -0.5, 0.5, 0.5,
-4.784114, -3.606209, -0.163034, 1, 1.5, 0.5, 0.5,
-4.784114, -3.606209, -0.163034, 0, 1.5, 0.5, 0.5
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
-2, -2.748226, -5.337249,
2, -2.748226, -5.337249,
-2, -2.748226, -5.337249,
-2, -2.891223, -5.59596,
0, -2.748226, -5.337249,
0, -2.891223, -5.59596,
2, -2.748226, -5.337249,
2, -2.891223, -5.59596
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
-2, -3.177217, -6.113381, 0, -0.5, 0.5, 0.5,
-2, -3.177217, -6.113381, 1, -0.5, 0.5, 0.5,
-2, -3.177217, -6.113381, 1, 1.5, 0.5, 0.5,
-2, -3.177217, -6.113381, 0, 1.5, 0.5, 0.5,
0, -3.177217, -6.113381, 0, -0.5, 0.5, 0.5,
0, -3.177217, -6.113381, 1, -0.5, 0.5, 0.5,
0, -3.177217, -6.113381, 1, 1.5, 0.5, 0.5,
0, -3.177217, -6.113381, 0, 1.5, 0.5, 0.5,
2, -3.177217, -6.113381, 0, -0.5, 0.5, 0.5,
2, -3.177217, -6.113381, 1, -0.5, 0.5, 0.5,
2, -3.177217, -6.113381, 1, 1.5, 0.5, 0.5,
2, -3.177217, -6.113381, 0, 1.5, 0.5, 0.5
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
-3.638876, -2, -5.337249,
-3.638876, 2, -5.337249,
-3.638876, -2, -5.337249,
-3.829749, -2, -5.59596,
-3.638876, -1, -5.337249,
-3.829749, -1, -5.59596,
-3.638876, 0, -5.337249,
-3.829749, 0, -5.59596,
-3.638876, 1, -5.337249,
-3.829749, 1, -5.59596,
-3.638876, 2, -5.337249,
-3.829749, 2, -5.59596
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
-4.211495, -2, -6.113381, 0, -0.5, 0.5, 0.5,
-4.211495, -2, -6.113381, 1, -0.5, 0.5, 0.5,
-4.211495, -2, -6.113381, 1, 1.5, 0.5, 0.5,
-4.211495, -2, -6.113381, 0, 1.5, 0.5, 0.5,
-4.211495, -1, -6.113381, 0, -0.5, 0.5, 0.5,
-4.211495, -1, -6.113381, 1, -0.5, 0.5, 0.5,
-4.211495, -1, -6.113381, 1, 1.5, 0.5, 0.5,
-4.211495, -1, -6.113381, 0, 1.5, 0.5, 0.5,
-4.211495, 0, -6.113381, 0, -0.5, 0.5, 0.5,
-4.211495, 0, -6.113381, 1, -0.5, 0.5, 0.5,
-4.211495, 0, -6.113381, 1, 1.5, 0.5, 0.5,
-4.211495, 0, -6.113381, 0, 1.5, 0.5, 0.5,
-4.211495, 1, -6.113381, 0, -0.5, 0.5, 0.5,
-4.211495, 1, -6.113381, 1, -0.5, 0.5, 0.5,
-4.211495, 1, -6.113381, 1, 1.5, 0.5, 0.5,
-4.211495, 1, -6.113381, 0, 1.5, 0.5, 0.5,
-4.211495, 2, -6.113381, 0, -0.5, 0.5, 0.5,
-4.211495, 2, -6.113381, 1, -0.5, 0.5, 0.5,
-4.211495, 2, -6.113381, 1, 1.5, 0.5, 0.5,
-4.211495, 2, -6.113381, 0, 1.5, 0.5, 0.5
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
-3.638876, -2.748226, -4,
-3.638876, -2.748226, 4,
-3.638876, -2.748226, -4,
-3.829749, -2.891223, -4,
-3.638876, -2.748226, -2,
-3.829749, -2.891223, -2,
-3.638876, -2.748226, 0,
-3.829749, -2.891223, 0,
-3.638876, -2.748226, 2,
-3.829749, -2.891223, 2,
-3.638876, -2.748226, 4,
-3.829749, -2.891223, 4
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
-4.211495, -3.177217, -4, 0, -0.5, 0.5, 0.5,
-4.211495, -3.177217, -4, 1, -0.5, 0.5, 0.5,
-4.211495, -3.177217, -4, 1, 1.5, 0.5, 0.5,
-4.211495, -3.177217, -4, 0, 1.5, 0.5, 0.5,
-4.211495, -3.177217, -2, 0, -0.5, 0.5, 0.5,
-4.211495, -3.177217, -2, 1, -0.5, 0.5, 0.5,
-4.211495, -3.177217, -2, 1, 1.5, 0.5, 0.5,
-4.211495, -3.177217, -2, 0, 1.5, 0.5, 0.5,
-4.211495, -3.177217, 0, 0, -0.5, 0.5, 0.5,
-4.211495, -3.177217, 0, 1, -0.5, 0.5, 0.5,
-4.211495, -3.177217, 0, 1, 1.5, 0.5, 0.5,
-4.211495, -3.177217, 0, 0, 1.5, 0.5, 0.5,
-4.211495, -3.177217, 2, 0, -0.5, 0.5, 0.5,
-4.211495, -3.177217, 2, 1, -0.5, 0.5, 0.5,
-4.211495, -3.177217, 2, 1, 1.5, 0.5, 0.5,
-4.211495, -3.177217, 2, 0, 1.5, 0.5, 0.5,
-4.211495, -3.177217, 4, 0, -0.5, 0.5, 0.5,
-4.211495, -3.177217, 4, 1, -0.5, 0.5, 0.5,
-4.211495, -3.177217, 4, 1, 1.5, 0.5, 0.5,
-4.211495, -3.177217, 4, 0, 1.5, 0.5, 0.5
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
-3.638876, -2.748226, -5.337249,
-3.638876, 2.971662, -5.337249,
-3.638876, -2.748226, 5.011181,
-3.638876, 2.971662, 5.011181,
-3.638876, -2.748226, -5.337249,
-3.638876, -2.748226, 5.011181,
-3.638876, 2.971662, -5.337249,
-3.638876, 2.971662, 5.011181,
-3.638876, -2.748226, -5.337249,
3.996046, -2.748226, -5.337249,
-3.638876, -2.748226, 5.011181,
3.996046, -2.748226, 5.011181,
-3.638876, 2.971662, -5.337249,
3.996046, 2.971662, -5.337249,
-3.638876, 2.971662, 5.011181,
3.996046, 2.971662, 5.011181,
3.996046, -2.748226, -5.337249,
3.996046, 2.971662, -5.337249,
3.996046, -2.748226, 5.011181,
3.996046, 2.971662, 5.011181,
3.996046, -2.748226, -5.337249,
3.996046, -2.748226, 5.011181,
3.996046, 2.971662, -5.337249,
3.996046, 2.971662, 5.011181
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
var radius = 7.515654;
var distance = 33.438;
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
mvMatrix.translate( -0.1785849, -0.1117182, 0.163034 );
mvMatrix.scale( 1.06433, 1.42067, 0.7852468 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.438);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
fenpiclonil<-read.table("fenpiclonil.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-fenpiclonil$V2
```

```
## Error in eval(expr, envir, enclos): object 'fenpiclonil' not found
```

```r
y<-fenpiclonil$V3
```

```
## Error in eval(expr, envir, enclos): object 'fenpiclonil' not found
```

```r
z<-fenpiclonil$V4
```

```
## Error in eval(expr, envir, enclos): object 'fenpiclonil' not found
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
-3.527688, -1.815978, -1.933097, 0, 0, 1, 1, 1,
-3.375318, -0.6661128, -1.524629, 1, 0, 0, 1, 1,
-3.11924, -0.7876623, -1.548363, 1, 0, 0, 1, 1,
-2.988012, -0.2331016, -2.379841, 1, 0, 0, 1, 1,
-2.660419, -0.6807097, -1.989037, 1, 0, 0, 1, 1,
-2.58987, 2.152607, -0.2911003, 1, 0, 0, 1, 1,
-2.536328, -0.5425237, -1.31125, 0, 0, 0, 1, 1,
-2.519643, -0.01158311, -0.7011133, 0, 0, 0, 1, 1,
-2.264108, -0.5928757, -4.099629, 0, 0, 0, 1, 1,
-2.247365, 0.2831312, -1.631594, 0, 0, 0, 1, 1,
-2.241183, 0.556164, -1.029477, 0, 0, 0, 1, 1,
-2.237212, -0.09976649, -0.75545, 0, 0, 0, 1, 1,
-2.218621, -1.51786, -1.925714, 0, 0, 0, 1, 1,
-2.215416, 0.5418267, -0.6584056, 1, 1, 1, 1, 1,
-2.197139, 0.3230799, -1.597338, 1, 1, 1, 1, 1,
-2.194647, 0.7168161, -1.478058, 1, 1, 1, 1, 1,
-2.18734, -0.3483613, -2.562991, 1, 1, 1, 1, 1,
-2.151185, 1.407164, -0.5095533, 1, 1, 1, 1, 1,
-2.14151, -0.8594141, -1.696339, 1, 1, 1, 1, 1,
-2.138669, 0.7379944, -0.09156914, 1, 1, 1, 1, 1,
-2.136645, 2.172149, -2.184211, 1, 1, 1, 1, 1,
-2.100527, 0.6603878, -2.06947, 1, 1, 1, 1, 1,
-2.065607, -0.2638576, -2.378683, 1, 1, 1, 1, 1,
-2.050975, 0.2776105, -0.9428073, 1, 1, 1, 1, 1,
-2.035143, 0.9457294, -1.306911, 1, 1, 1, 1, 1,
-2.034284, 0.2743386, -0.6008483, 1, 1, 1, 1, 1,
-1.998786, 1.860556, 0.4127056, 1, 1, 1, 1, 1,
-1.989271, 0.2862703, -0.7268877, 1, 1, 1, 1, 1,
-1.988556, -0.8072557, -1.831859, 0, 0, 1, 1, 1,
-1.985457, 1.635362, 0.5136901, 1, 0, 0, 1, 1,
-1.98197, 1.033752, -1.730047, 1, 0, 0, 1, 1,
-1.9616, -0.4004589, -3.501568, 1, 0, 0, 1, 1,
-1.958441, 0.09158371, -1.475999, 1, 0, 0, 1, 1,
-1.946657, -0.473589, -1.636089, 1, 0, 0, 1, 1,
-1.90583, 0.6722425, -0.661221, 0, 0, 0, 1, 1,
-1.903165, -1.311147, -1.438328, 0, 0, 0, 1, 1,
-1.893348, -1.299528, -1.488084, 0, 0, 0, 1, 1,
-1.888672, -0.9931569, -3.122925, 0, 0, 0, 1, 1,
-1.886468, -2.088593, -4.245802, 0, 0, 0, 1, 1,
-1.87891, -0.8300374, -1.236513, 0, 0, 0, 1, 1,
-1.875097, 0.740951, -1.987125, 0, 0, 0, 1, 1,
-1.871715, -0.5525035, -1.422181, 1, 1, 1, 1, 1,
-1.854306, -2.211701, -1.348802, 1, 1, 1, 1, 1,
-1.831935, -1.038105, -1.098438, 1, 1, 1, 1, 1,
-1.82907, 0.4102736, -1.165314, 1, 1, 1, 1, 1,
-1.813257, 0.2412821, -0.7905867, 1, 1, 1, 1, 1,
-1.804217, -0.4212502, -2.688592, 1, 1, 1, 1, 1,
-1.788625, -1.700402, -1.587064, 1, 1, 1, 1, 1,
-1.763815, -0.2138356, 0.2290545, 1, 1, 1, 1, 1,
-1.748895, 0.09299067, -0.5322211, 1, 1, 1, 1, 1,
-1.745833, -0.3357708, -0.009804761, 1, 1, 1, 1, 1,
-1.741161, -1.000161, -3.591188, 1, 1, 1, 1, 1,
-1.728199, -0.2175679, -2.115797, 1, 1, 1, 1, 1,
-1.727913, 0.08698165, -1.704114, 1, 1, 1, 1, 1,
-1.719671, 0.3198109, -2.891732, 1, 1, 1, 1, 1,
-1.715525, 1.016997, -1.371156, 1, 1, 1, 1, 1,
-1.711011, 0.1657383, -1.650169, 0, 0, 1, 1, 1,
-1.70407, -1.145836, -2.251585, 1, 0, 0, 1, 1,
-1.679193, 1.405206, -0.4526646, 1, 0, 0, 1, 1,
-1.632929, -0.7409471, -2.208346, 1, 0, 0, 1, 1,
-1.625105, 0.1065933, -2.01646, 1, 0, 0, 1, 1,
-1.622091, 0.1774963, -1.86401, 1, 0, 0, 1, 1,
-1.619913, 0.008107385, -0.8780491, 0, 0, 0, 1, 1,
-1.615825, 1.049405, -1.91858, 0, 0, 0, 1, 1,
-1.610271, -0.7932658, -3.270545, 0, 0, 0, 1, 1,
-1.604648, -0.9524311, -0.5733189, 0, 0, 0, 1, 1,
-1.601544, 0.330457, -0.0008625332, 0, 0, 0, 1, 1,
-1.59974, 0.5397339, 1.006789, 0, 0, 0, 1, 1,
-1.598544, -2.283828, -2.449315, 0, 0, 0, 1, 1,
-1.596085, 0.4886849, -1.219939, 1, 1, 1, 1, 1,
-1.590099, -1.697787, -2.856878, 1, 1, 1, 1, 1,
-1.58711, -0.712724, -2.328582, 1, 1, 1, 1, 1,
-1.571245, 0.6961243, -0.5403212, 1, 1, 1, 1, 1,
-1.567606, 0.5275991, -1.118161, 1, 1, 1, 1, 1,
-1.559869, -0.294705, -1.634941, 1, 1, 1, 1, 1,
-1.558899, 0.8306858, 0.2144466, 1, 1, 1, 1, 1,
-1.545265, -0.2450637, 0.6541485, 1, 1, 1, 1, 1,
-1.535645, 1.743025, -0.7168226, 1, 1, 1, 1, 1,
-1.531081, 0.8909129, 1.262088, 1, 1, 1, 1, 1,
-1.518207, -0.3482507, -0.9566708, 1, 1, 1, 1, 1,
-1.51133, 0.7609307, -0.2753128, 1, 1, 1, 1, 1,
-1.507232, 0.2250687, -1.027871, 1, 1, 1, 1, 1,
-1.486512, -1.366544, -3.005036, 1, 1, 1, 1, 1,
-1.478423, -1.120285, -1.111405, 1, 1, 1, 1, 1,
-1.476354, -0.9355506, -1.754278, 0, 0, 1, 1, 1,
-1.475413, -0.1421957, -0.1942354, 1, 0, 0, 1, 1,
-1.473109, -0.4002187, 0.2299204, 1, 0, 0, 1, 1,
-1.469931, -0.01763162, -0.1402443, 1, 0, 0, 1, 1,
-1.468361, 0.6421198, -1.702031, 1, 0, 0, 1, 1,
-1.462104, 0.6596809, -1.036428, 1, 0, 0, 1, 1,
-1.460825, -1.240408, -4.297316, 0, 0, 0, 1, 1,
-1.457569, 0.996454, -0.9199441, 0, 0, 0, 1, 1,
-1.451032, 0.2912266, -0.5612536, 0, 0, 0, 1, 1,
-1.444566, 0.8194119, -1.835659, 0, 0, 0, 1, 1,
-1.439585, -0.5608544, -2.087183, 0, 0, 0, 1, 1,
-1.432592, -1.938866, -0.9653077, 0, 0, 0, 1, 1,
-1.432016, 1.914664, 1.205765, 0, 0, 0, 1, 1,
-1.428415, -0.1721199, -1.63411, 1, 1, 1, 1, 1,
-1.416728, 0.7869733, 0.392009, 1, 1, 1, 1, 1,
-1.396339, 1.069397, -0.7028774, 1, 1, 1, 1, 1,
-1.390293, 0.3413011, -0.5715045, 1, 1, 1, 1, 1,
-1.383403, 1.488437, -1.367061, 1, 1, 1, 1, 1,
-1.378684, -0.8901205, -1.471828, 1, 1, 1, 1, 1,
-1.36675, 0.620112, 0.0938605, 1, 1, 1, 1, 1,
-1.346593, 0.1731895, -1.314001, 1, 1, 1, 1, 1,
-1.334057, 1.753789, -0.02832584, 1, 1, 1, 1, 1,
-1.332727, 1.68225, -0.7981392, 1, 1, 1, 1, 1,
-1.324398, -0.96073, -2.45511, 1, 1, 1, 1, 1,
-1.314729, -0.06910636, -2.271844, 1, 1, 1, 1, 1,
-1.313782, -0.6122104, -2.387994, 1, 1, 1, 1, 1,
-1.313681, 0.7417558, 0.08393261, 1, 1, 1, 1, 1,
-1.312361, -1.211642, -1.241155, 1, 1, 1, 1, 1,
-1.307567, -1.336131, -3.070922, 0, 0, 1, 1, 1,
-1.307074, 0.8775734, -0.1254603, 1, 0, 0, 1, 1,
-1.304162, -0.9532169, -2.94727, 1, 0, 0, 1, 1,
-1.302398, 1.279088, -0.487665, 1, 0, 0, 1, 1,
-1.298615, -0.4950116, -1.50531, 1, 0, 0, 1, 1,
-1.293049, 0.8099373, -2.0253, 1, 0, 0, 1, 1,
-1.288396, -0.93308, -1.625014, 0, 0, 0, 1, 1,
-1.278783, -0.8051591, -2.973775, 0, 0, 0, 1, 1,
-1.276159, -0.6995266, -0.4888313, 0, 0, 0, 1, 1,
-1.272386, -0.3343916, -0.9566334, 0, 0, 0, 1, 1,
-1.270763, 0.7238079, -0.1067277, 0, 0, 0, 1, 1,
-1.267329, -0.04451291, -0.1062188, 0, 0, 0, 1, 1,
-1.266088, -1.151474, -2.347059, 0, 0, 0, 1, 1,
-1.260151, 0.2035498, -0.9362247, 1, 1, 1, 1, 1,
-1.258432, -1.314297, -1.874274, 1, 1, 1, 1, 1,
-1.256389, -0.1600466, -1.731115, 1, 1, 1, 1, 1,
-1.250746, 0.9435099, 0.4717301, 1, 1, 1, 1, 1,
-1.249816, -1.015519, -2.174117, 1, 1, 1, 1, 1,
-1.248346, 1.792315, -1.226951, 1, 1, 1, 1, 1,
-1.247936, -0.6967747, -2.556249, 1, 1, 1, 1, 1,
-1.247254, 2.531964, -0.9134859, 1, 1, 1, 1, 1,
-1.247187, -0.9294479, -3.665301, 1, 1, 1, 1, 1,
-1.24269, 0.1815473, -3.205882, 1, 1, 1, 1, 1,
-1.240141, 1.508359, -2.029143, 1, 1, 1, 1, 1,
-1.24008, -0.2477185, -3.785126, 1, 1, 1, 1, 1,
-1.23461, -0.1525003, -1.371071, 1, 1, 1, 1, 1,
-1.224425, -0.2458524, -1.835526, 1, 1, 1, 1, 1,
-1.221579, 0.7491482, -1.257973, 1, 1, 1, 1, 1,
-1.207877, -0.7145307, -1.955721, 0, 0, 1, 1, 1,
-1.201103, 0.4677757, 0.4656897, 1, 0, 0, 1, 1,
-1.199307, -2.615394, -1.603375, 1, 0, 0, 1, 1,
-1.19888, 1.285897, -0.8542585, 1, 0, 0, 1, 1,
-1.189997, 0.5060273, -1.390586, 1, 0, 0, 1, 1,
-1.187859, -0.4142354, -0.6169341, 1, 0, 0, 1, 1,
-1.173599, 0.984849, -1.192176, 0, 0, 0, 1, 1,
-1.172087, -0.8641365, -0.4805996, 0, 0, 0, 1, 1,
-1.165927, 0.05711801, -1.016936, 0, 0, 0, 1, 1,
-1.157271, -0.1655565, -2.786351, 0, 0, 0, 1, 1,
-1.150584, 0.2588146, -0.5186722, 0, 0, 0, 1, 1,
-1.130093, -0.4133424, -1.206796, 0, 0, 0, 1, 1,
-1.12172, -0.1519685, -0.3126347, 0, 0, 0, 1, 1,
-1.120293, 2.286253, -1.300342, 1, 1, 1, 1, 1,
-1.109293, -0.06988363, -1.419361, 1, 1, 1, 1, 1,
-1.099061, 0.998455, -0.2679637, 1, 1, 1, 1, 1,
-1.09866, 0.02167747, -2.265296, 1, 1, 1, 1, 1,
-1.097497, 0.5324996, -1.244617, 1, 1, 1, 1, 1,
-1.09059, 0.5252525, -1.16881, 1, 1, 1, 1, 1,
-1.088881, -0.3204942, -3.327391, 1, 1, 1, 1, 1,
-1.086628, -0.6718628, -1.443438, 1, 1, 1, 1, 1,
-1.085502, -0.05236288, -0.5020428, 1, 1, 1, 1, 1,
-1.084924, -0.9706183, -1.78148, 1, 1, 1, 1, 1,
-1.08265, 0.7358597, -0.6292861, 1, 1, 1, 1, 1,
-1.07923, -0.7844535, -2.569974, 1, 1, 1, 1, 1,
-1.078483, 0.8635226, -0.8058289, 1, 1, 1, 1, 1,
-1.076659, 2.057833, 1.178748, 1, 1, 1, 1, 1,
-1.076496, -0.703027, -1.113414, 1, 1, 1, 1, 1,
-1.076484, 1.07522, -1.16932, 0, 0, 1, 1, 1,
-1.066004, -0.5744588, -1.644206, 1, 0, 0, 1, 1,
-1.06349, 0.8800934, -0.08188106, 1, 0, 0, 1, 1,
-1.061724, -0.4101507, -1.140541, 1, 0, 0, 1, 1,
-1.060964, -0.5032187, -1.816638, 1, 0, 0, 1, 1,
-1.060622, -1.367926, -2.121504, 1, 0, 0, 1, 1,
-1.056687, -0.9881393, -3.878647, 0, 0, 0, 1, 1,
-1.054106, 0.7262863, -2.132779, 0, 0, 0, 1, 1,
-1.052708, 0.4282732, -1.255948, 0, 0, 0, 1, 1,
-1.052213, -0.004232062, -1.242423, 0, 0, 0, 1, 1,
-1.05191, -1.186567, -0.2105948, 0, 0, 0, 1, 1,
-1.050333, -0.3819655, -1.211897, 0, 0, 0, 1, 1,
-1.047734, -0.7874694, -3.337315, 0, 0, 0, 1, 1,
-1.038084, 0.2632935, -0.4464971, 1, 1, 1, 1, 1,
-1.034582, -0.8510182, -1.666391, 1, 1, 1, 1, 1,
-1.030485, -1.334768, -3.018442, 1, 1, 1, 1, 1,
-1.026871, -0.6035195, -0.8078359, 1, 1, 1, 1, 1,
-1.022756, -0.03767002, -1.329679, 1, 1, 1, 1, 1,
-1.021687, -0.5083901, -2.528494, 1, 1, 1, 1, 1,
-1.021684, 1.37285, -1.531488, 1, 1, 1, 1, 1,
-1.021413, -1.14352, -3.425426, 1, 1, 1, 1, 1,
-1.016901, 0.5354793, 0.5089147, 1, 1, 1, 1, 1,
-1.01611, 0.6928332, -1.618703, 1, 1, 1, 1, 1,
-1.016006, 0.2520015, -0.6794301, 1, 1, 1, 1, 1,
-1.014585, 0.2314626, 1.02814, 1, 1, 1, 1, 1,
-1.013163, 0.6925747, -1.779906, 1, 1, 1, 1, 1,
-1.006816, 0.1103547, 1.807643, 1, 1, 1, 1, 1,
-1.004368, 0.8315532, -1.676295, 1, 1, 1, 1, 1,
-1.000424, -0.1476801, -1.064845, 0, 0, 1, 1, 1,
-0.9999714, -0.6139386, -3.209236, 1, 0, 0, 1, 1,
-0.9883749, 1.542381, -0.07727186, 1, 0, 0, 1, 1,
-0.9860778, 0.79599, -0.9330295, 1, 0, 0, 1, 1,
-0.9794388, -2.499737, -2.214885, 1, 0, 0, 1, 1,
-0.9775618, -0.7863101, -0.2873648, 1, 0, 0, 1, 1,
-0.9759305, 0.08353852, -1.624029, 0, 0, 0, 1, 1,
-0.9623895, 1.251704, -0.940588, 0, 0, 0, 1, 1,
-0.9580646, -0.1803261, -0.4240331, 0, 0, 0, 1, 1,
-0.9561588, -1.684278, -2.816844, 0, 0, 0, 1, 1,
-0.9468466, 0.4454204, -1.477213, 0, 0, 0, 1, 1,
-0.9445725, -0.9799312, -2.870254, 0, 0, 0, 1, 1,
-0.9423567, 0.5028635, -2.227629, 0, 0, 0, 1, 1,
-0.9399598, 0.7543383, -1.347598, 1, 1, 1, 1, 1,
-0.939737, 0.7969776, -1.271967, 1, 1, 1, 1, 1,
-0.9372157, 0.9664653, -0.4906465, 1, 1, 1, 1, 1,
-0.9322243, -0.27573, -1.404272, 1, 1, 1, 1, 1,
-0.9265135, -2.150788, -2.298581, 1, 1, 1, 1, 1,
-0.9264494, -1.227919, -2.071663, 1, 1, 1, 1, 1,
-0.9183955, 0.5399629, -2.525876, 1, 1, 1, 1, 1,
-0.9160496, -0.1617648, -1.491586, 1, 1, 1, 1, 1,
-0.9129457, 0.6719841, -1.425041, 1, 1, 1, 1, 1,
-0.90738, -0.08924079, -3.04562, 1, 1, 1, 1, 1,
-0.9013498, 0.5106097, -0.400699, 1, 1, 1, 1, 1,
-0.9011882, -0.1989659, -1.109194, 1, 1, 1, 1, 1,
-0.8905808, -0.6718301, -1.297931, 1, 1, 1, 1, 1,
-0.8897595, 0.6663967, -1.444249, 1, 1, 1, 1, 1,
-0.8887132, -0.537653, -1.292737, 1, 1, 1, 1, 1,
-0.8767633, 0.5214087, -1.027093, 0, 0, 1, 1, 1,
-0.8758065, 1.182138, -1.121747, 1, 0, 0, 1, 1,
-0.8743738, -2.095031, -3.112761, 1, 0, 0, 1, 1,
-0.8689095, -0.819221, -1.492813, 1, 0, 0, 1, 1,
-0.8665321, 0.33955, -1.346397, 1, 0, 0, 1, 1,
-0.8656113, -1.169279, -2.474437, 1, 0, 0, 1, 1,
-0.8651938, 0.2914222, 0.5691839, 0, 0, 0, 1, 1,
-0.8537861, -0.2283432, -2.392601, 0, 0, 0, 1, 1,
-0.8501014, 0.3347706, -1.035681, 0, 0, 0, 1, 1,
-0.8391911, 0.4352461, -0.7286791, 0, 0, 0, 1, 1,
-0.8355589, -0.04325533, 1.078642, 0, 0, 0, 1, 1,
-0.8338388, -0.395454, -2.720366, 0, 0, 0, 1, 1,
-0.8277726, -0.2235647, -1.805115, 0, 0, 0, 1, 1,
-0.8250503, 1.075984, 0.08353776, 1, 1, 1, 1, 1,
-0.8213025, 1.51948, -0.3097404, 1, 1, 1, 1, 1,
-0.8191963, 0.2179041, -0.7693762, 1, 1, 1, 1, 1,
-0.8172042, -0.128226, -2.020716, 1, 1, 1, 1, 1,
-0.8086361, -0.2138666, -0.1930413, 1, 1, 1, 1, 1,
-0.8077579, 0.7858832, -0.3763102, 1, 1, 1, 1, 1,
-0.807593, -0.5413201, -1.85625, 1, 1, 1, 1, 1,
-0.8002102, 0.2107467, -0.7397403, 1, 1, 1, 1, 1,
-0.8000448, -0.08964455, -0.8568702, 1, 1, 1, 1, 1,
-0.7948909, -0.17341, -2.373079, 1, 1, 1, 1, 1,
-0.7900076, -0.6148195, -2.174202, 1, 1, 1, 1, 1,
-0.7807738, -0.1968375, -0.4138664, 1, 1, 1, 1, 1,
-0.7792629, -1.373093, -1.794264, 1, 1, 1, 1, 1,
-0.7787872, -0.4836201, -1.151588, 1, 1, 1, 1, 1,
-0.775549, 0.630717, -2.183186, 1, 1, 1, 1, 1,
-0.7715666, 1.148533, -0.6884614, 0, 0, 1, 1, 1,
-0.7705664, -0.7609071, -2.259204, 1, 0, 0, 1, 1,
-0.7616224, -0.5258864, -1.815008, 1, 0, 0, 1, 1,
-0.7585648, -0.6645419, -2.72925, 1, 0, 0, 1, 1,
-0.7548195, -1.161885, -2.697739, 1, 0, 0, 1, 1,
-0.7540835, 0.8662872, 1.703447, 1, 0, 0, 1, 1,
-0.7538478, -0.7439561, -0.5282808, 0, 0, 0, 1, 1,
-0.7454099, -0.03977859, 0.1764125, 0, 0, 0, 1, 1,
-0.7444726, -0.6107766, -2.076779, 0, 0, 0, 1, 1,
-0.7444509, 1.801732, -1.535876, 0, 0, 0, 1, 1,
-0.7405957, 0.2167144, -1.932318, 0, 0, 0, 1, 1,
-0.7333003, -2.056202, -1.861075, 0, 0, 0, 1, 1,
-0.7295495, 1.254033, -0.5403118, 0, 0, 0, 1, 1,
-0.7277691, 1.355285, 0.4916522, 1, 1, 1, 1, 1,
-0.7255392, 1.093551, -1.674794, 1, 1, 1, 1, 1,
-0.7227504, -0.4048647, -2.477516, 1, 1, 1, 1, 1,
-0.7095622, -0.7007041, -2.625915, 1, 1, 1, 1, 1,
-0.7088065, -0.6362504, -1.913805, 1, 1, 1, 1, 1,
-0.7060916, 1.356826, 0.05033165, 1, 1, 1, 1, 1,
-0.7039062, 0.04531291, -1.310973, 1, 1, 1, 1, 1,
-0.6913025, 0.5293459, -0.2832706, 1, 1, 1, 1, 1,
-0.6910547, 0.02574252, -0.7651207, 1, 1, 1, 1, 1,
-0.6882976, -0.3636225, -0.9352936, 1, 1, 1, 1, 1,
-0.6805135, -0.427472, -1.511907, 1, 1, 1, 1, 1,
-0.6687996, -1.418218, -1.915746, 1, 1, 1, 1, 1,
-0.6611385, -1.475074, -2.597671, 1, 1, 1, 1, 1,
-0.6592148, -1.695611, -2.408863, 1, 1, 1, 1, 1,
-0.6568298, 0.7751438, -1.873515, 1, 1, 1, 1, 1,
-0.6559909, 1.251064, -1.307968, 0, 0, 1, 1, 1,
-0.6470219, -0.1458905, -2.646533, 1, 0, 0, 1, 1,
-0.6339025, -0.7011406, -2.992312, 1, 0, 0, 1, 1,
-0.6270627, -1.107009, -1.984895, 1, 0, 0, 1, 1,
-0.6234064, -0.3455441, -2.648275, 1, 0, 0, 1, 1,
-0.6232998, -2.384696, -2.723306, 1, 0, 0, 1, 1,
-0.6207203, -1.190114, -3.02448, 0, 0, 0, 1, 1,
-0.620167, -0.3876156, -3.047397, 0, 0, 0, 1, 1,
-0.6182274, 1.672385, -1.68178, 0, 0, 0, 1, 1,
-0.6177145, 1.053749, -1.364897, 0, 0, 0, 1, 1,
-0.616092, 0.1979571, 0.06697538, 0, 0, 0, 1, 1,
-0.6131944, 1.420456, -1.062174, 0, 0, 0, 1, 1,
-0.5984403, -2.066635, -2.261732, 0, 0, 0, 1, 1,
-0.5925419, 0.1569465, -2.546138, 1, 1, 1, 1, 1,
-0.588482, 1.920493, -0.4315397, 1, 1, 1, 1, 1,
-0.5810968, -0.3564368, -1.899783, 1, 1, 1, 1, 1,
-0.5740011, 1.067545, 2.034474, 1, 1, 1, 1, 1,
-0.5734024, 1.594029, -1.365374, 1, 1, 1, 1, 1,
-0.5701991, -0.3975939, -1.137147, 1, 1, 1, 1, 1,
-0.5628124, 0.161745, -1.774917, 1, 1, 1, 1, 1,
-0.5616343, -0.8663565, -2.487915, 1, 1, 1, 1, 1,
-0.5609277, -0.4305528, -1.981661, 1, 1, 1, 1, 1,
-0.5593404, 0.2384298, -1.518989, 1, 1, 1, 1, 1,
-0.555319, -1.045364, -2.317516, 1, 1, 1, 1, 1,
-0.5544467, -1.092231, -2.798881, 1, 1, 1, 1, 1,
-0.551351, 0.3943134, -0.3225095, 1, 1, 1, 1, 1,
-0.548154, -0.5476792, -2.719515, 1, 1, 1, 1, 1,
-0.5470247, -0.7549058, -3.032301, 1, 1, 1, 1, 1,
-0.5444449, -0.5507553, -2.360994, 0, 0, 1, 1, 1,
-0.5416974, 1.243394, -0.3369374, 1, 0, 0, 1, 1,
-0.5410089, 0.02019347, -1.782486, 1, 0, 0, 1, 1,
-0.5375522, -0.2738536, -2.044858, 1, 0, 0, 1, 1,
-0.5371199, -0.5175497, -1.089681, 1, 0, 0, 1, 1,
-0.5371191, 0.3312624, -1.286125, 1, 0, 0, 1, 1,
-0.5349683, 0.8320203, -1.718539, 0, 0, 0, 1, 1,
-0.5328157, -0.8056445, -2.627548, 0, 0, 0, 1, 1,
-0.5283903, -0.276044, -0.962512, 0, 0, 0, 1, 1,
-0.5265137, -0.4288494, -2.919628, 0, 0, 0, 1, 1,
-0.5199723, 0.3158307, -2.532318, 0, 0, 0, 1, 1,
-0.5149298, -0.3681217, -3.060901, 0, 0, 0, 1, 1,
-0.5057748, -0.175152, -0.6513399, 0, 0, 0, 1, 1,
-0.5041826, 0.1547225, 0.2746291, 1, 1, 1, 1, 1,
-0.5036337, 0.09074494, 0.06129395, 1, 1, 1, 1, 1,
-0.5034294, 1.868277, 0.2842243, 1, 1, 1, 1, 1,
-0.5013469, -0.6765598, -0.6384565, 1, 1, 1, 1, 1,
-0.5000978, -1.009838, -2.268633, 1, 1, 1, 1, 1,
-0.490479, -0.8011859, -2.308121, 1, 1, 1, 1, 1,
-0.4869335, -0.1949855, -0.6909335, 1, 1, 1, 1, 1,
-0.4868096, -0.3855566, -3.565232, 1, 1, 1, 1, 1,
-0.4860313, 0.03504176, -1.609725, 1, 1, 1, 1, 1,
-0.4844359, 0.7634355, -0.1590259, 1, 1, 1, 1, 1,
-0.4808171, -2.664926, -2.143301, 1, 1, 1, 1, 1,
-0.4739167, 1.037891, -2.302311, 1, 1, 1, 1, 1,
-0.4709539, -0.3545054, -2.699224, 1, 1, 1, 1, 1,
-0.4666238, -0.5514489, -1.862942, 1, 1, 1, 1, 1,
-0.4639456, -0.5040471, -3.454553, 1, 1, 1, 1, 1,
-0.4501636, 1.020554, -0.004283025, 0, 0, 1, 1, 1,
-0.44927, 1.121491, -0.5763299, 1, 0, 0, 1, 1,
-0.4469489, 0.2574797, -1.053755, 1, 0, 0, 1, 1,
-0.4448635, 0.7401476, -0.802772, 1, 0, 0, 1, 1,
-0.4427067, -0.01109233, -1.037748, 1, 0, 0, 1, 1,
-0.4414479, -1.633417, -3.275512, 1, 0, 0, 1, 1,
-0.4386248, -0.7024121, -3.512187, 0, 0, 0, 1, 1,
-0.4342327, -2.032523, -4.262742, 0, 0, 0, 1, 1,
-0.4312419, -0.4184807, -2.032001, 0, 0, 0, 1, 1,
-0.4246442, 2.049445, -0.4479976, 0, 0, 0, 1, 1,
-0.42399, 0.5082091, -2.440957, 0, 0, 0, 1, 1,
-0.4218209, -0.5855114, -4.943581, 0, 0, 0, 1, 1,
-0.4192216, -1.317155, -2.200929, 0, 0, 0, 1, 1,
-0.4186871, -0.1749198, -1.200508, 1, 1, 1, 1, 1,
-0.4156708, -0.5800518, -1.751327, 1, 1, 1, 1, 1,
-0.4087284, 0.6657594, 0.4378041, 1, 1, 1, 1, 1,
-0.405243, 1.090759, -3.32367, 1, 1, 1, 1, 1,
-0.4046104, 0.2001031, -1.405407, 1, 1, 1, 1, 1,
-0.4032588, -0.3156674, -1.546411, 1, 1, 1, 1, 1,
-0.4017611, -0.215055, -2.494652, 1, 1, 1, 1, 1,
-0.4016419, 0.468634, -1.31531, 1, 1, 1, 1, 1,
-0.4015211, 0.07077906, -3.222894, 1, 1, 1, 1, 1,
-0.3968799, -0.05533547, -2.448592, 1, 1, 1, 1, 1,
-0.3818056, -0.1213861, -1.356125, 1, 1, 1, 1, 1,
-0.3807636, 0.1793744, -0.3142644, 1, 1, 1, 1, 1,
-0.3777267, 0.07315677, -0.9296903, 1, 1, 1, 1, 1,
-0.3737379, -0.5689363, -2.949359, 1, 1, 1, 1, 1,
-0.3733814, 0.7517, -0.2862752, 1, 1, 1, 1, 1,
-0.3702568, 0.6217812, -0.2995794, 0, 0, 1, 1, 1,
-0.3692922, 0.2102272, -1.694227, 1, 0, 0, 1, 1,
-0.3679621, -0.909436, -1.712042, 1, 0, 0, 1, 1,
-0.362228, -0.01947719, -2.582, 1, 0, 0, 1, 1,
-0.3613364, -1.367847, -2.373078, 1, 0, 0, 1, 1,
-0.3586263, -1.508953, -2.399494, 1, 0, 0, 1, 1,
-0.357621, -0.2354064, -1.964384, 0, 0, 0, 1, 1,
-0.3545306, -2.088253, -2.551739, 0, 0, 0, 1, 1,
-0.3537056, 0.01108208, -0.5090573, 0, 0, 0, 1, 1,
-0.3504708, -0.3812218, -3.550484, 0, 0, 0, 1, 1,
-0.3494322, 0.2465514, -0.404706, 0, 0, 0, 1, 1,
-0.3481064, -0.907661, -2.266459, 0, 0, 0, 1, 1,
-0.3468727, 1.133581, -0.8266991, 0, 0, 0, 1, 1,
-0.3442013, -0.3917324, -3.950485, 1, 1, 1, 1, 1,
-0.3428561, 0.7662095, -1.585966, 1, 1, 1, 1, 1,
-0.337698, -1.590719, -3.962254, 1, 1, 1, 1, 1,
-0.337071, -0.07501885, -1.166745, 1, 1, 1, 1, 1,
-0.33591, -0.4817018, -2.745962, 1, 1, 1, 1, 1,
-0.3324717, 0.9487572, -0.5241988, 1, 1, 1, 1, 1,
-0.3283121, -0.6413702, -3.56662, 1, 1, 1, 1, 1,
-0.3273489, -0.2624244, -1.409261, 1, 1, 1, 1, 1,
-0.3254556, 0.6700788, -0.8301126, 1, 1, 1, 1, 1,
-0.32324, 1.261703, -0.378806, 1, 1, 1, 1, 1,
-0.3232294, 1.283379, 0.2400495, 1, 1, 1, 1, 1,
-0.3213172, -1.287536, -2.300299, 1, 1, 1, 1, 1,
-0.3049888, 1.062065, 0.829872, 1, 1, 1, 1, 1,
-0.3013976, -0.4730384, -2.778073, 1, 1, 1, 1, 1,
-0.3000569, -0.3906665, -2.431917, 1, 1, 1, 1, 1,
-0.2995163, 0.2353067, 0.9676088, 0, 0, 1, 1, 1,
-0.2982047, -0.5579284, -2.095794, 1, 0, 0, 1, 1,
-0.2972241, -1.929358, -4.04178, 1, 0, 0, 1, 1,
-0.2960566, 0.4218521, -0.5522695, 1, 0, 0, 1, 1,
-0.2903356, -2.440062, -3.825134, 1, 0, 0, 1, 1,
-0.288752, 0.5054626, -1.886109, 1, 0, 0, 1, 1,
-0.2859699, 0.5311966, -1.427758, 0, 0, 0, 1, 1,
-0.2834134, -2.342812, -3.325472, 0, 0, 0, 1, 1,
-0.2822283, -0.2411024, -0.7606239, 0, 0, 0, 1, 1,
-0.2814631, 1.372475, 0.3961759, 0, 0, 0, 1, 1,
-0.2804731, 1.760522, 0.02036523, 0, 0, 0, 1, 1,
-0.2797716, -0.4545252, -3.25843, 0, 0, 0, 1, 1,
-0.2795438, 1.170672, 1.169906, 0, 0, 0, 1, 1,
-0.2784678, 0.7144806, -1.196012, 1, 1, 1, 1, 1,
-0.2643931, -0.6648873, -2.91777, 1, 1, 1, 1, 1,
-0.2628103, -1.664144, -3.176912, 1, 1, 1, 1, 1,
-0.2619099, 0.2141737, 0.02808021, 1, 1, 1, 1, 1,
-0.2617353, -0.7745327, -3.842209, 1, 1, 1, 1, 1,
-0.2598899, -0.5282215, -2.195054, 1, 1, 1, 1, 1,
-0.2582673, -0.5327836, -3.919026, 1, 1, 1, 1, 1,
-0.2564978, -1.364806, -0.9692273, 1, 1, 1, 1, 1,
-0.2551798, -0.6032628, -1.890009, 1, 1, 1, 1, 1,
-0.2537399, -0.456562, -2.128566, 1, 1, 1, 1, 1,
-0.2531699, 0.2091551, -1.465017, 1, 1, 1, 1, 1,
-0.2491427, 0.4167327, -0.5754262, 1, 1, 1, 1, 1,
-0.2464756, -0.3628504, -1.997652, 1, 1, 1, 1, 1,
-0.2439982, 1.158349, -0.02284588, 1, 1, 1, 1, 1,
-0.2435769, -0.363436, -2.21451, 1, 1, 1, 1, 1,
-0.2418017, 0.186769, -0.09450532, 0, 0, 1, 1, 1,
-0.2369726, -0.7581161, -2.394006, 1, 0, 0, 1, 1,
-0.2367343, 1.460518, -0.595858, 1, 0, 0, 1, 1,
-0.2364801, -0.5619009, -3.458052, 1, 0, 0, 1, 1,
-0.2360357, 0.7612274, -1.880549, 1, 0, 0, 1, 1,
-0.2329902, -0.08467085, -2.633119, 1, 0, 0, 1, 1,
-0.2313902, -1.163976, -0.7478695, 0, 0, 0, 1, 1,
-0.2228931, 0.8595209, 0.2501228, 0, 0, 0, 1, 1,
-0.2214716, 1.376848, -0.1585026, 0, 0, 0, 1, 1,
-0.2211514, -0.3424336, -2.594953, 0, 0, 0, 1, 1,
-0.2199597, -0.5976257, -2.368881, 0, 0, 0, 1, 1,
-0.2175296, 0.5889351, -0.6654086, 0, 0, 0, 1, 1,
-0.2141265, -1.101233, -3.047134, 0, 0, 0, 1, 1,
-0.2138394, -0.4857472, -2.755884, 1, 1, 1, 1, 1,
-0.210955, 0.5035647, -2.211708, 1, 1, 1, 1, 1,
-0.210824, -0.5158318, -2.965913, 1, 1, 1, 1, 1,
-0.2105844, 0.958921, -0.09154236, 1, 1, 1, 1, 1,
-0.2100187, -1.324794, -1.601025, 1, 1, 1, 1, 1,
-0.207321, 0.1335552, -2.637678, 1, 1, 1, 1, 1,
-0.2065916, -1.333023, -2.233572, 1, 1, 1, 1, 1,
-0.2032362, -0.190802, -2.104581, 1, 1, 1, 1, 1,
-0.2003151, 0.5751601, 0.4467525, 1, 1, 1, 1, 1,
-0.1995091, -0.5161508, -3.192567, 1, 1, 1, 1, 1,
-0.1935699, -1.287192, -3.666473, 1, 1, 1, 1, 1,
-0.1935268, 1.456902, 1.840562, 1, 1, 1, 1, 1,
-0.1933057, 1.430475, 0.06904539, 1, 1, 1, 1, 1,
-0.1875325, -1.201544, -2.075951, 1, 1, 1, 1, 1,
-0.1874172, -1.431718, -2.002607, 1, 1, 1, 1, 1,
-0.1820586, -1.059121, -4.164788, 0, 0, 1, 1, 1,
-0.1798286, -0.8122345, -4.402386, 1, 0, 0, 1, 1,
-0.1775122, 1.72103, -0.5915843, 1, 0, 0, 1, 1,
-0.1736531, 0.2079993, -0.892223, 1, 0, 0, 1, 1,
-0.1732858, 1.017228, 0.1062919, 1, 0, 0, 1, 1,
-0.1700882, -0.3086049, -1.889253, 1, 0, 0, 1, 1,
-0.1686582, 1.631643, 1.257883, 0, 0, 0, 1, 1,
-0.168413, -1.375762, -2.645972, 0, 0, 0, 1, 1,
-0.1680048, 1.088777, -0.7278919, 0, 0, 0, 1, 1,
-0.1671365, 0.3441038, -2.453267, 0, 0, 0, 1, 1,
-0.1628903, -0.2788457, -3.799348, 0, 0, 0, 1, 1,
-0.1616437, 0.2862153, 1.230093, 0, 0, 0, 1, 1,
-0.1594443, -1.286499, -2.928784, 0, 0, 0, 1, 1,
-0.1546912, 0.1158807, -2.239143, 1, 1, 1, 1, 1,
-0.1513125, -0.647392, -3.229982, 1, 1, 1, 1, 1,
-0.1508893, 0.4686135, -0.3318096, 1, 1, 1, 1, 1,
-0.1476735, 0.7623942, -0.7407764, 1, 1, 1, 1, 1,
-0.1469164, 1.163201, -0.9657053, 1, 1, 1, 1, 1,
-0.1462306, -2.045466, -3.662095, 1, 1, 1, 1, 1,
-0.1448249, -0.7017138, -1.717326, 1, 1, 1, 1, 1,
-0.1396714, 0.62294, 1.443196, 1, 1, 1, 1, 1,
-0.1364754, 1.239731, 0.4590647, 1, 1, 1, 1, 1,
-0.1318794, -0.3438258, -5.150385, 1, 1, 1, 1, 1,
-0.1308429, 1.51022, -0.1490585, 1, 1, 1, 1, 1,
-0.1289704, 1.193423, -1.026951, 1, 1, 1, 1, 1,
-0.128531, 0.3910137, -1.08444, 1, 1, 1, 1, 1,
-0.1224299, -1.09149, -1.032793, 1, 1, 1, 1, 1,
-0.1207092, 0.4619605, 0.5443903, 1, 1, 1, 1, 1,
-0.1179135, 0.2274062, 0.8263652, 0, 0, 1, 1, 1,
-0.1171585, 0.4935697, -0.372249, 1, 0, 0, 1, 1,
-0.1140978, 0.1209698, -0.4813341, 1, 0, 0, 1, 1,
-0.1110009, 1.325225, -0.1709255, 1, 0, 0, 1, 1,
-0.1084248, 0.6011626, -0.1608084, 1, 0, 0, 1, 1,
-0.1057724, -0.27975, -2.791882, 1, 0, 0, 1, 1,
-0.104626, 1.353425, -1.824663, 0, 0, 0, 1, 1,
-0.1024343, -0.8764028, -1.59558, 0, 0, 0, 1, 1,
-0.09583203, -0.5832851, -4.446066, 0, 0, 0, 1, 1,
-0.09321029, -0.1609929, -1.713538, 0, 0, 0, 1, 1,
-0.09128292, 0.04382341, -0.8716801, 0, 0, 0, 1, 1,
-0.0891189, 1.042784, -0.9654058, 0, 0, 0, 1, 1,
-0.08806387, 0.1130092, -0.629064, 0, 0, 0, 1, 1,
-0.08674441, 1.503815, 0.1336983, 1, 1, 1, 1, 1,
-0.08179458, -0.178661, -2.422426, 1, 1, 1, 1, 1,
-0.08088339, 1.620863, 0.09364513, 1, 1, 1, 1, 1,
-0.07779524, 0.1324521, -0.1820031, 1, 1, 1, 1, 1,
-0.07097045, -0.6947551, -4.105793, 1, 1, 1, 1, 1,
-0.06924304, 1.436902, 0.7854329, 1, 1, 1, 1, 1,
-0.06819949, -1.328786, -3.572352, 1, 1, 1, 1, 1,
-0.06720438, -0.8768275, -3.607255, 1, 1, 1, 1, 1,
-0.06257685, -0.540637, -3.395237, 1, 1, 1, 1, 1,
-0.06152427, -0.7309932, -1.086586, 1, 1, 1, 1, 1,
-0.05909739, 0.6834806, 1.738373, 1, 1, 1, 1, 1,
-0.05824177, 0.9759957, 0.942579, 1, 1, 1, 1, 1,
-0.0568156, -1.339244, -2.649483, 1, 1, 1, 1, 1,
-0.05580747, 0.8941126, -1.579002, 1, 1, 1, 1, 1,
-0.05566806, -0.8750162, -2.447292, 1, 1, 1, 1, 1,
-0.05560754, -0.8495622, -1.606344, 0, 0, 1, 1, 1,
-0.05543132, -0.2314865, -1.901591, 1, 0, 0, 1, 1,
-0.05450252, -2.037965, -1.870404, 1, 0, 0, 1, 1,
-0.05424191, -1.4735, -3.698137, 1, 0, 0, 1, 1,
-0.05327531, 1.594295, 0.08950677, 1, 0, 0, 1, 1,
-0.05325215, -0.3250346, -2.907898, 1, 0, 0, 1, 1,
-0.05250164, 0.5893486, -0.8982024, 0, 0, 0, 1, 1,
-0.05205945, 0.05399713, -0.7073637, 0, 0, 0, 1, 1,
-0.04787236, 0.05446528, 0.2197236, 0, 0, 0, 1, 1,
-0.04773023, -0.8522531, -2.13221, 0, 0, 0, 1, 1,
-0.04529383, 1.191089, -0.7821783, 0, 0, 0, 1, 1,
-0.04505352, 0.7105467, 1.639048, 0, 0, 0, 1, 1,
-0.03845768, -0.9827026, -3.014462, 0, 0, 0, 1, 1,
-0.03512957, -1.62455, -3.485266, 1, 1, 1, 1, 1,
-0.03233057, -0.4516025, -3.146545, 1, 1, 1, 1, 1,
-0.0285808, 0.2928803, -0.5217893, 1, 1, 1, 1, 1,
-0.02418132, -0.6072046, -5.157138, 1, 1, 1, 1, 1,
-0.02403145, 0.9197397, -0.1383693, 1, 1, 1, 1, 1,
-0.02382527, -0.6236441, -5.186544, 1, 1, 1, 1, 1,
-0.02205252, -0.5470836, -3.262594, 1, 1, 1, 1, 1,
-0.01878245, 0.4906599, -1.241068, 1, 1, 1, 1, 1,
-0.005857513, -0.009567685, -3.183159, 1, 1, 1, 1, 1,
-0.004452805, -0.2923882, -3.723378, 1, 1, 1, 1, 1,
0.003271339, 0.3114842, 2.12851, 1, 1, 1, 1, 1,
0.004921091, -2.093599, 2.508874, 1, 1, 1, 1, 1,
0.006672439, -0.259414, 4.521678, 1, 1, 1, 1, 1,
0.007774703, -1.509651, 3.447479, 1, 1, 1, 1, 1,
0.00876385, 0.9226624, 0.197999, 1, 1, 1, 1, 1,
0.01388332, 0.01452877, 0.4569668, 0, 0, 1, 1, 1,
0.01913417, -0.3277892, 2.242749, 1, 0, 0, 1, 1,
0.01925671, 0.05693325, 0.07061468, 1, 0, 0, 1, 1,
0.02162682, -0.3904659, 4.084378, 1, 0, 0, 1, 1,
0.02518257, 0.7097848, -0.5695938, 1, 0, 0, 1, 1,
0.02661409, 0.9524221, 0.02308432, 1, 0, 0, 1, 1,
0.03682441, -0.6875705, 3.936614, 0, 0, 0, 1, 1,
0.04332123, -0.3374811, 4.436056, 0, 0, 0, 1, 1,
0.04558131, 1.433468, -1.137639, 0, 0, 0, 1, 1,
0.04601158, -1.211366, 3.891548, 0, 0, 0, 1, 1,
0.04615074, -0.1185455, 2.465305, 0, 0, 0, 1, 1,
0.04675534, -0.3244565, 2.930291, 0, 0, 0, 1, 1,
0.04713468, -0.8793464, 3.575921, 0, 0, 0, 1, 1,
0.04782233, 0.3627374, -0.2359929, 1, 1, 1, 1, 1,
0.04881097, 0.6323232, -0.1743962, 1, 1, 1, 1, 1,
0.05015082, -1.322144, 3.450181, 1, 1, 1, 1, 1,
0.0504369, 0.3624788, 1.888126, 1, 1, 1, 1, 1,
0.05224106, 1.417187, -1.067351, 1, 1, 1, 1, 1,
0.05411224, 1.133924, 0.7619455, 1, 1, 1, 1, 1,
0.05708413, 0.7043377, -0.6904389, 1, 1, 1, 1, 1,
0.05875308, -0.1839684, 4.143997, 1, 1, 1, 1, 1,
0.06116907, -0.8197249, 1.731059, 1, 1, 1, 1, 1,
0.06457156, 0.8645726, 1.137064, 1, 1, 1, 1, 1,
0.06722087, -0.08617774, 2.203055, 1, 1, 1, 1, 1,
0.07156515, -0.7366516, 2.424342, 1, 1, 1, 1, 1,
0.07500245, -0.4751134, 2.366761, 1, 1, 1, 1, 1,
0.07711094, 0.2471602, 0.4910863, 1, 1, 1, 1, 1,
0.08263125, -1.083869, 3.032644, 1, 1, 1, 1, 1,
0.08581786, 1.152236, -0.592163, 0, 0, 1, 1, 1,
0.08629057, 0.4574554, 0.04908366, 1, 0, 0, 1, 1,
0.08968259, 1.045067, 0.2212813, 1, 0, 0, 1, 1,
0.09381404, -0.5510164, 3.034761, 1, 0, 0, 1, 1,
0.1035768, -0.5808662, 4.057542, 1, 0, 0, 1, 1,
0.1044253, 0.9946173, 0.8898556, 1, 0, 0, 1, 1,
0.1215825, 0.4145065, -0.4272045, 0, 0, 0, 1, 1,
0.1234809, 0.2226161, -0.5388837, 0, 0, 0, 1, 1,
0.1239422, 0.7736666, -0.7280468, 0, 0, 0, 1, 1,
0.1240747, 1.608588, 0.1234038, 0, 0, 0, 1, 1,
0.1249168, -0.02471674, 1.206964, 0, 0, 0, 1, 1,
0.125293, -1.138262, 1.755226, 0, 0, 0, 1, 1,
0.1265164, 1.036349, -0.3123919, 0, 0, 0, 1, 1,
0.1272936, -0.5088084, 3.856128, 1, 1, 1, 1, 1,
0.1357477, -0.9868031, 3.634038, 1, 1, 1, 1, 1,
0.1368331, -0.2155395, 4.771037, 1, 1, 1, 1, 1,
0.1434999, -0.5624089, 2.876687, 1, 1, 1, 1, 1,
0.1439329, 2.518735, -0.173619, 1, 1, 1, 1, 1,
0.1527799, 0.1436504, 0.3035027, 1, 1, 1, 1, 1,
0.1571837, -0.126601, 3.247175, 1, 1, 1, 1, 1,
0.1585167, -0.8542709, 1.886048, 1, 1, 1, 1, 1,
0.1598944, -0.3477932, 2.823968, 1, 1, 1, 1, 1,
0.1613211, -1.162967, 1.323137, 1, 1, 1, 1, 1,
0.1628298, -0.9421105, 2.046727, 1, 1, 1, 1, 1,
0.1653943, 0.3336472, 0.3908062, 1, 1, 1, 1, 1,
0.1684579, -0.7295079, 4.410735, 1, 1, 1, 1, 1,
0.1819809, -0.3802671, 1.258404, 1, 1, 1, 1, 1,
0.1855458, 0.5318215, 0.5631382, 1, 1, 1, 1, 1,
0.1869065, 1.337389, 1.920621, 0, 0, 1, 1, 1,
0.1940608, -0.208765, 1.092223, 1, 0, 0, 1, 1,
0.1969681, -0.7758315, 4.85343, 1, 0, 0, 1, 1,
0.2015098, 0.246287, 1.464864, 1, 0, 0, 1, 1,
0.2050539, 0.624337, -0.8164357, 1, 0, 0, 1, 1,
0.2051002, 0.8423721, 0.2347845, 1, 0, 0, 1, 1,
0.2055041, 0.6603711, 1.367575, 0, 0, 0, 1, 1,
0.2061915, -0.7321986, 2.37791, 0, 0, 0, 1, 1,
0.2087104, 0.5722233, 1.995839, 0, 0, 0, 1, 1,
0.2099101, 0.2506092, 1.597626, 0, 0, 0, 1, 1,
0.2113028, 0.646054, -0.6816199, 0, 0, 0, 1, 1,
0.211729, -0.6599472, 3.258524, 0, 0, 0, 1, 1,
0.2160581, 1.336335, -0.3601672, 0, 0, 0, 1, 1,
0.217547, 1.34545, 0.4383034, 1, 1, 1, 1, 1,
0.2224434, 1.626353, -0.366663, 1, 1, 1, 1, 1,
0.2267433, 1.608052, 0.8649749, 1, 1, 1, 1, 1,
0.2292337, 2.113363, 2.341238, 1, 1, 1, 1, 1,
0.2318875, -2.146099, 3.090105, 1, 1, 1, 1, 1,
0.2339795, -0.5367211, 1.617355, 1, 1, 1, 1, 1,
0.234574, 1.27818, 1.665361, 1, 1, 1, 1, 1,
0.2346953, 0.7104823, 1.047921, 1, 1, 1, 1, 1,
0.2353091, 1.04252, 0.04826846, 1, 1, 1, 1, 1,
0.2363926, -0.9357449, 2.882159, 1, 1, 1, 1, 1,
0.2409612, 0.8766271, 0.938086, 1, 1, 1, 1, 1,
0.2410308, 0.8965328, 0.2677281, 1, 1, 1, 1, 1,
0.2454629, -0.4702133, 1.327139, 1, 1, 1, 1, 1,
0.2454668, 0.02854425, 0.2691633, 1, 1, 1, 1, 1,
0.246401, -0.2380834, 1.498934, 1, 1, 1, 1, 1,
0.247166, -0.4740843, 2.571928, 0, 0, 1, 1, 1,
0.2480289, -0.844609, 1.847518, 1, 0, 0, 1, 1,
0.2482577, 1.317688, 1.225516, 1, 0, 0, 1, 1,
0.2503637, -0.3943816, 4.195202, 1, 0, 0, 1, 1,
0.2522408, 0.9678041, -0.6865615, 1, 0, 0, 1, 1,
0.2528058, 1.86059, 0.3377253, 1, 0, 0, 1, 1,
0.254391, -0.1909287, 2.648079, 0, 0, 0, 1, 1,
0.2545323, 0.8834441, -0.3818439, 0, 0, 0, 1, 1,
0.2550336, -0.5224054, 2.723607, 0, 0, 0, 1, 1,
0.2564958, 1.282774, 2.398696, 0, 0, 0, 1, 1,
0.2576157, -0.6962972, 2.736226, 0, 0, 0, 1, 1,
0.26082, 1.027967, 1.970408, 0, 0, 0, 1, 1,
0.2635241, 1.142749, 0.5894783, 0, 0, 0, 1, 1,
0.2648053, 0.9731429, 1.173029, 1, 1, 1, 1, 1,
0.2675502, -0.9581814, 3.022144, 1, 1, 1, 1, 1,
0.2675522, 1.384921, 1.153682, 1, 1, 1, 1, 1,
0.2678255, -0.5066474, 2.971069, 1, 1, 1, 1, 1,
0.2693985, 2.16743, 1.836097, 1, 1, 1, 1, 1,
0.2739025, -1.197622, 3.033613, 1, 1, 1, 1, 1,
0.2774615, -0.9067842, 3.692187, 1, 1, 1, 1, 1,
0.2776816, -0.3958185, 3.229424, 1, 1, 1, 1, 1,
0.2795063, -0.9598031, 3.263483, 1, 1, 1, 1, 1,
0.2821422, -0.742974, 1.950239, 1, 1, 1, 1, 1,
0.2889641, -0.2850195, 2.090293, 1, 1, 1, 1, 1,
0.2903412, -1.161984, 4.204931, 1, 1, 1, 1, 1,
0.2933406, 0.4123611, -1.341662, 1, 1, 1, 1, 1,
0.2944611, 0.02030972, 0.239658, 1, 1, 1, 1, 1,
0.2976636, -0.9485576, 3.746293, 1, 1, 1, 1, 1,
0.3072834, 0.963288, 0.4772954, 0, 0, 1, 1, 1,
0.3074829, 0.1301536, 3.23587, 1, 0, 0, 1, 1,
0.3091554, 0.5164224, 0.6800525, 1, 0, 0, 1, 1,
0.3122247, 1.470712, 1.496123, 1, 0, 0, 1, 1,
0.3155094, -0.2215573, 3.016564, 1, 0, 0, 1, 1,
0.3159645, 2.050803, -0.5681678, 1, 0, 0, 1, 1,
0.3278241, -0.2286878, 1.986699, 0, 0, 0, 1, 1,
0.3309443, 0.2568738, 1.978764, 0, 0, 0, 1, 1,
0.3334737, -0.6617085, 1.48314, 0, 0, 0, 1, 1,
0.3393312, 0.6939374, -0.1557192, 0, 0, 0, 1, 1,
0.3397588, 0.8981655, -0.1701321, 0, 0, 0, 1, 1,
0.3404075, -1.530871, 3.519464, 0, 0, 0, 1, 1,
0.3442976, 1.516549, -0.3279608, 0, 0, 0, 1, 1,
0.3480502, -1.349164, 2.964244, 1, 1, 1, 1, 1,
0.3498712, 0.2273683, 2.219199, 1, 1, 1, 1, 1,
0.3588298, -1.223289, 4.141243, 1, 1, 1, 1, 1,
0.3616439, -0.07664984, 1.424164, 1, 1, 1, 1, 1,
0.3620887, -0.4146966, 2.188368, 1, 1, 1, 1, 1,
0.3623472, -0.09491927, 3.198117, 1, 1, 1, 1, 1,
0.3671688, 0.7541707, 0.8673109, 1, 1, 1, 1, 1,
0.3695104, -0.9756825, 3.791215, 1, 1, 1, 1, 1,
0.3720595, -1.440251, 3.0678, 1, 1, 1, 1, 1,
0.3722637, 0.07474753, 2.45369, 1, 1, 1, 1, 1,
0.3820815, -1.458034, 1.717534, 1, 1, 1, 1, 1,
0.3869331, 0.704641, 0.3930642, 1, 1, 1, 1, 1,
0.3879822, 1.051659, -1.409779, 1, 1, 1, 1, 1,
0.390085, -0.459631, 3.717011, 1, 1, 1, 1, 1,
0.395347, -0.5057679, 2.975557, 1, 1, 1, 1, 1,
0.4006921, 0.188598, 2.29415, 0, 0, 1, 1, 1,
0.4008748, 0.7110744, 0.3798042, 1, 0, 0, 1, 1,
0.4040037, -1.230344, 3.854664, 1, 0, 0, 1, 1,
0.4043571, 0.855483, 1.526644, 1, 0, 0, 1, 1,
0.4078377, 0.5835813, 1.118518, 1, 0, 0, 1, 1,
0.4081752, 0.2420027, 1.392418, 1, 0, 0, 1, 1,
0.4083873, 0.4370697, -0.177774, 0, 0, 0, 1, 1,
0.4083951, -0.6619561, 2.186927, 0, 0, 0, 1, 1,
0.4086861, 0.4831666, 1.281413, 0, 0, 0, 1, 1,
0.4090719, -0.3305423, 1.821519, 0, 0, 0, 1, 1,
0.411134, 1.911692, 1.575975, 0, 0, 0, 1, 1,
0.4116418, 0.7916065, 1.440871, 0, 0, 0, 1, 1,
0.4131399, -0.6115069, 3.383116, 0, 0, 0, 1, 1,
0.4179098, -0.6995377, 4.860476, 1, 1, 1, 1, 1,
0.42215, -0.8074291, 2.469988, 1, 1, 1, 1, 1,
0.42248, -0.8113081, 3.113943, 1, 1, 1, 1, 1,
0.4324718, 0.7071347, 0.1544031, 1, 1, 1, 1, 1,
0.4372399, 0.6332494, 2.698306, 1, 1, 1, 1, 1,
0.4381167, -2.124275, 2.654283, 1, 1, 1, 1, 1,
0.442569, -0.2788905, 0.6149674, 1, 1, 1, 1, 1,
0.4445822, -0.6322271, 3.451497, 1, 1, 1, 1, 1,
0.4470588, -0.309752, 1.766557, 1, 1, 1, 1, 1,
0.4482105, -1.135535, 4.648541, 1, 1, 1, 1, 1,
0.4542898, 1.081269, 0.6737917, 1, 1, 1, 1, 1,
0.459858, -0.9167831, 1.89814, 1, 1, 1, 1, 1,
0.4645638, 0.6490418, 1.907192, 1, 1, 1, 1, 1,
0.4657784, -1.209805, 3.399198, 1, 1, 1, 1, 1,
0.4673678, 0.8986865, -0.1075414, 1, 1, 1, 1, 1,
0.4674343, 0.7996082, 0.459124, 0, 0, 1, 1, 1,
0.4696589, 0.4953803, 2.065417, 1, 0, 0, 1, 1,
0.4756684, 0.2266596, 1.862864, 1, 0, 0, 1, 1,
0.4849468, 0.3028158, 0.5850356, 1, 0, 0, 1, 1,
0.4883549, -0.8042725, 1.619011, 1, 0, 0, 1, 1,
0.4898733, 0.6303133, 1.900173, 1, 0, 0, 1, 1,
0.4905752, -0.8064736, 3.133912, 0, 0, 0, 1, 1,
0.4966156, -0.8235431, 3.126082, 0, 0, 0, 1, 1,
0.4972129, -0.7610095, 0.7628248, 0, 0, 0, 1, 1,
0.4974615, -0.1735376, 2.690665, 0, 0, 0, 1, 1,
0.497709, 0.619413, -1.456623, 0, 0, 0, 1, 1,
0.499484, -1.125236, 1.866841, 0, 0, 0, 1, 1,
0.499487, 0.4887667, 1.203878, 0, 0, 0, 1, 1,
0.4995466, -0.3927493, 2.714992, 1, 1, 1, 1, 1,
0.5024289, 0.5267661, 1.055305, 1, 1, 1, 1, 1,
0.5037885, 0.3927579, 1.00552, 1, 1, 1, 1, 1,
0.5053763, 0.6924572, 0.3138488, 1, 1, 1, 1, 1,
0.5080135, 0.4272528, 1.911508, 1, 1, 1, 1, 1,
0.5154111, -1.45535, 2.854624, 1, 1, 1, 1, 1,
0.5238016, 1.321925, 1.191522, 1, 1, 1, 1, 1,
0.5258091, -1.442063, 2.414719, 1, 1, 1, 1, 1,
0.5266539, 1.225614, -0.9512082, 1, 1, 1, 1, 1,
0.5326821, -0.1638177, 1.960009, 1, 1, 1, 1, 1,
0.5361508, -1.125807, 2.504648, 1, 1, 1, 1, 1,
0.5372534, -0.4428674, 1.670375, 1, 1, 1, 1, 1,
0.5402592, 0.0523302, 1.164962, 1, 1, 1, 1, 1,
0.5467801, 0.3182865, 0.602477, 1, 1, 1, 1, 1,
0.5476791, 1.228056, 0.4233994, 1, 1, 1, 1, 1,
0.5497536, -0.4474369, 2.993105, 0, 0, 1, 1, 1,
0.5497683, -1.320223, 2.276993, 1, 0, 0, 1, 1,
0.552635, -0.8968079, 3.193009, 1, 0, 0, 1, 1,
0.557528, -1.608135, 2.462642, 1, 0, 0, 1, 1,
0.5681939, 0.3734865, 1.092642, 1, 0, 0, 1, 1,
0.5736891, -1.084653, 0.6013474, 1, 0, 0, 1, 1,
0.5812245, -0.8903402, 1.98699, 0, 0, 0, 1, 1,
0.5823591, 0.1263027, 1.534699, 0, 0, 0, 1, 1,
0.5891353, -1.424608, 3.073663, 0, 0, 0, 1, 1,
0.5900616, 0.1091031, 1.263555, 0, 0, 0, 1, 1,
0.5932072, -0.8861157, 3.870902, 0, 0, 0, 1, 1,
0.5934739, 0.4136996, 1.954222, 0, 0, 0, 1, 1,
0.5998579, -0.7691933, 4.468883, 0, 0, 0, 1, 1,
0.6081592, -0.08559367, 0.9737639, 1, 1, 1, 1, 1,
0.6130711, 0.8974952, -0.6376781, 1, 1, 1, 1, 1,
0.6174761, 0.6670486, -0.1298514, 1, 1, 1, 1, 1,
0.6209274, 0.3381511, 2.057603, 1, 1, 1, 1, 1,
0.6209415, -1.14783, 1.914197, 1, 1, 1, 1, 1,
0.622316, 0.05739061, 0.9102773, 1, 1, 1, 1, 1,
0.6251128, -1.783846, 3.077044, 1, 1, 1, 1, 1,
0.6255528, 1.695395, 1.185793, 1, 1, 1, 1, 1,
0.6267164, 0.77597, 0.6282296, 1, 1, 1, 1, 1,
0.6332443, 0.8798929, 1.726444, 1, 1, 1, 1, 1,
0.6332996, -1.451288, 2.091897, 1, 1, 1, 1, 1,
0.6356703, 0.8321263, 1.871106, 1, 1, 1, 1, 1,
0.6467696, -0.9127884, 1.98042, 1, 1, 1, 1, 1,
0.6467814, 1.494066, 2.030522, 1, 1, 1, 1, 1,
0.6469346, 0.4725648, 0.8768407, 1, 1, 1, 1, 1,
0.6516109, -0.1815983, 2.857136, 0, 0, 1, 1, 1,
0.6533387, 0.4166927, 0.843544, 1, 0, 0, 1, 1,
0.6568362, -1.668718, 2.115066, 1, 0, 0, 1, 1,
0.6644324, 0.1013219, 1.138032, 1, 0, 0, 1, 1,
0.6681535, 0.6178743, 1.443716, 1, 0, 0, 1, 1,
0.6704145, -0.236827, 0.2974751, 1, 0, 0, 1, 1,
0.6765323, 1.164894, 2.152456, 0, 0, 0, 1, 1,
0.6812413, -0.6238887, 2.321375, 0, 0, 0, 1, 1,
0.6841568, 1.124398, 1.114448, 0, 0, 0, 1, 1,
0.6862008, -0.9726477, 3.443542, 0, 0, 0, 1, 1,
0.6877126, -0.4692175, 2.37085, 0, 0, 0, 1, 1,
0.6923383, -1.84015, 1.530538, 0, 0, 0, 1, 1,
0.7022597, 2.888363, 0.3748311, 0, 0, 0, 1, 1,
0.7062915, 0.9880664, -0.6303297, 1, 1, 1, 1, 1,
0.7115353, -1.049119, 2.387741, 1, 1, 1, 1, 1,
0.7137289, 0.3170317, -0.6646417, 1, 1, 1, 1, 1,
0.7174777, -0.3188531, 1.244214, 1, 1, 1, 1, 1,
0.7198282, 0.3743952, 0.3863671, 1, 1, 1, 1, 1,
0.7202334, -0.1620931, 2.50385, 1, 1, 1, 1, 1,
0.7228422, 0.3894171, 0.3850219, 1, 1, 1, 1, 1,
0.7331156, 0.6265358, -0.4241393, 1, 1, 1, 1, 1,
0.7356811, 0.8796749, 0.4833978, 1, 1, 1, 1, 1,
0.7397191, -0.9705456, 1.695913, 1, 1, 1, 1, 1,
0.7718439, -0.01610279, 2.908024, 1, 1, 1, 1, 1,
0.7743626, 0.3286859, 1.408984, 1, 1, 1, 1, 1,
0.7814963, -0.096398, 2.289999, 1, 1, 1, 1, 1,
0.7841263, 1.314252, 1.765577, 1, 1, 1, 1, 1,
0.7847204, -0.3663208, 1.748884, 1, 1, 1, 1, 1,
0.7857905, 1.26286, -0.02627723, 0, 0, 1, 1, 1,
0.7869236, -2.494416, 3.596946, 1, 0, 0, 1, 1,
0.7915031, -0.6405956, 3.010317, 1, 0, 0, 1, 1,
0.8003033, 2.281903, -1.053944, 1, 0, 0, 1, 1,
0.8028519, -1.389144, 1.775117, 1, 0, 0, 1, 1,
0.8057564, 0.3313385, 1.688783, 1, 0, 0, 1, 1,
0.8062671, -0.3196755, 2.332097, 0, 0, 0, 1, 1,
0.808076, 0.4509888, 0.6582486, 0, 0, 0, 1, 1,
0.8107762, -0.8760659, 2.092047, 0, 0, 0, 1, 1,
0.8118169, -0.5233616, 1.384703, 0, 0, 0, 1, 1,
0.8202311, 2.511187, -1.526087, 0, 0, 0, 1, 1,
0.8233848, -1.187667, 2.359232, 0, 0, 0, 1, 1,
0.8239622, 0.7497153, 0.4665869, 0, 0, 0, 1, 1,
0.8256016, 1.115904, 0.6926175, 1, 1, 1, 1, 1,
0.8269075, -0.5725735, 2.280216, 1, 1, 1, 1, 1,
0.8294512, 0.5104232, 1.471577, 1, 1, 1, 1, 1,
0.8396024, -0.2617535, 0.9900624, 1, 1, 1, 1, 1,
0.8498735, 0.2008761, 2.263124, 1, 1, 1, 1, 1,
0.8545361, 0.4371262, -0.006283262, 1, 1, 1, 1, 1,
0.8551362, -0.3744092, 2.098839, 1, 1, 1, 1, 1,
0.8567997, -0.08534916, 1.385575, 1, 1, 1, 1, 1,
0.8569201, -0.04274971, 3.276848, 1, 1, 1, 1, 1,
0.8670371, 0.5192733, -0.8050209, 1, 1, 1, 1, 1,
0.8708728, -0.01137312, 1.007813, 1, 1, 1, 1, 1,
0.870988, -1.051618, 4.807894, 1, 1, 1, 1, 1,
0.8723853, -0.142405, 1.223385, 1, 1, 1, 1, 1,
0.87311, 1.657657, 0.06834497, 1, 1, 1, 1, 1,
0.8734359, 1.703411, 0.4444203, 1, 1, 1, 1, 1,
0.8753992, 0.2603603, -0.5623095, 0, 0, 1, 1, 1,
0.8768966, 0.1589647, 1.627936, 1, 0, 0, 1, 1,
0.8888938, 0.4825405, 1.424269, 1, 0, 0, 1, 1,
0.8951447, -0.1685513, 2.567172, 1, 0, 0, 1, 1,
0.8957772, 1.066326, -0.7778898, 1, 0, 0, 1, 1,
0.8980501, -0.2576222, 0.6420421, 1, 0, 0, 1, 1,
0.8985119, 1.364063, 1.322227, 0, 0, 0, 1, 1,
0.9047337, -0.07838113, -1.120885, 0, 0, 0, 1, 1,
0.9109855, -0.2338914, 1.913223, 0, 0, 0, 1, 1,
0.9113594, -0.2956454, 2.078816, 0, 0, 0, 1, 1,
0.9116661, 0.5455479, 3.109863, 0, 0, 0, 1, 1,
0.9123395, 0.05536104, 0.6924721, 0, 0, 0, 1, 1,
0.9133179, -0.2142423, 4.806426, 0, 0, 0, 1, 1,
0.9241566, 1.386301, 0.2584909, 1, 1, 1, 1, 1,
0.9330955, -0.389266, 1.852864, 1, 1, 1, 1, 1,
0.943235, 0.652502, 2.683418, 1, 1, 1, 1, 1,
0.9435751, -1.439515, 1.963608, 1, 1, 1, 1, 1,
0.943581, -0.4906093, 1.819762, 1, 1, 1, 1, 1,
0.9438408, -0.2555669, 3.108357, 1, 1, 1, 1, 1,
0.9452129, 0.4794242, 1.629912, 1, 1, 1, 1, 1,
0.9584675, 1.313813, 0.4357892, 1, 1, 1, 1, 1,
0.9615113, -0.7686681, 3.986746, 1, 1, 1, 1, 1,
0.9625441, -0.783597, 1.734697, 1, 1, 1, 1, 1,
0.9736649, 2.097814, 1.12618, 1, 1, 1, 1, 1,
0.9756931, 0.3578347, 1.202446, 1, 1, 1, 1, 1,
0.9797609, -0.4624276, 2.489337, 1, 1, 1, 1, 1,
0.9828229, 0.6241932, 1.704699, 1, 1, 1, 1, 1,
0.9848159, -0.5361564, 4.152826, 1, 1, 1, 1, 1,
0.9894325, -0.1759494, 2.895127, 0, 0, 1, 1, 1,
0.9907109, 0.06490679, 2.221761, 1, 0, 0, 1, 1,
0.9911754, 0.3302019, 2.574229, 1, 0, 0, 1, 1,
0.9915871, -0.04097426, 2.152999, 1, 0, 0, 1, 1,
1.00488, -0.1180797, 1.198953, 1, 0, 0, 1, 1,
1.008602, -1.165813, 2.707564, 1, 0, 0, 1, 1,
1.013238, 0.164761, 1.849157, 0, 0, 0, 1, 1,
1.019431, 0.978143, 1.253334, 0, 0, 0, 1, 1,
1.020276, 0.1337893, 2.330259, 0, 0, 0, 1, 1,
1.023672, -0.2875305, 0.2041616, 0, 0, 0, 1, 1,
1.024587, -0.4710543, 2.472703, 0, 0, 0, 1, 1,
1.032409, -0.06833722, 1.2883, 0, 0, 0, 1, 1,
1.037051, -0.02442983, 4.176424, 0, 0, 0, 1, 1,
1.041399, -1.084062, 3.169046, 1, 1, 1, 1, 1,
1.059884, 0.4823822, 2.618795, 1, 1, 1, 1, 1,
1.064288, 0.8001097, -0.2966414, 1, 1, 1, 1, 1,
1.072246, -1.262494, 2.03108, 1, 1, 1, 1, 1,
1.072561, -1.501992, 2.217366, 1, 1, 1, 1, 1,
1.075173, -0.6393918, 1.460107, 1, 1, 1, 1, 1,
1.076155, 0.6636785, 1.161321, 1, 1, 1, 1, 1,
1.085245, -1.389221, 1.68896, 1, 1, 1, 1, 1,
1.088927, 0.1579993, 2.513834, 1, 1, 1, 1, 1,
1.090383, -0.4953996, 2.879066, 1, 1, 1, 1, 1,
1.092054, -0.7386779, 1.637847, 1, 1, 1, 1, 1,
1.095363, 0.3960905, 2.544454, 1, 1, 1, 1, 1,
1.096564, 0.1389584, 0.9845276, 1, 1, 1, 1, 1,
1.099617, -0.1710673, 3.824573, 1, 1, 1, 1, 1,
1.106532, -0.4998181, 1.808782, 1, 1, 1, 1, 1,
1.110257, -0.7629735, 0.9479805, 0, 0, 1, 1, 1,
1.115482, -0.1850284, 3.033682, 1, 0, 0, 1, 1,
1.116634, 1.57032, 0.1929304, 1, 0, 0, 1, 1,
1.122904, 0.04903133, 2.783388, 1, 0, 0, 1, 1,
1.124989, -0.1731043, 2.473523, 1, 0, 0, 1, 1,
1.130269, -0.2081657, 2.980763, 1, 0, 0, 1, 1,
1.133512, 0.2287254, 1.238137, 0, 0, 0, 1, 1,
1.140561, -0.6144326, 3.228852, 0, 0, 0, 1, 1,
1.144204, 0.6504943, 1.821532, 0, 0, 0, 1, 1,
1.150061, -0.3497782, 1.843595, 0, 0, 0, 1, 1,
1.151354, 1.538779, 0.6681747, 0, 0, 0, 1, 1,
1.154059, 0.07653793, 0.6100161, 0, 0, 0, 1, 1,
1.15707, -0.401773, 1.791492, 0, 0, 0, 1, 1,
1.158831, -0.1217574, 0.9571596, 1, 1, 1, 1, 1,
1.159634, 0.6375631, 1.486273, 1, 1, 1, 1, 1,
1.171419, 1.505131, 0.8656477, 1, 1, 1, 1, 1,
1.178307, 1.088409, 2.001472, 1, 1, 1, 1, 1,
1.180885, -0.6363832, 1.591521, 1, 1, 1, 1, 1,
1.181007, 0.2251894, 1.187374, 1, 1, 1, 1, 1,
1.182942, 2.866719, -1.190511, 1, 1, 1, 1, 1,
1.187113, 0.7249081, 0.9133412, 1, 1, 1, 1, 1,
1.190098, 0.5685059, 1.011827, 1, 1, 1, 1, 1,
1.190488, -0.894457, 2.858445, 1, 1, 1, 1, 1,
1.194838, 1.692045, 1.157527, 1, 1, 1, 1, 1,
1.195075, -0.2310717, 1.958365, 1, 1, 1, 1, 1,
1.197399, 1.156434, 0.2778448, 1, 1, 1, 1, 1,
1.19815, 0.8944516, -0.3468455, 1, 1, 1, 1, 1,
1.199717, -0.2984526, 2.199228, 1, 1, 1, 1, 1,
1.200191, -1.940735, 1.205968, 0, 0, 1, 1, 1,
1.201482, -1.601425, 4.169466, 1, 0, 0, 1, 1,
1.203156, -0.6824926, 2.338363, 1, 0, 0, 1, 1,
1.207196, 0.6994635, 2.096991, 1, 0, 0, 1, 1,
1.212588, 1.614008, -0.8497881, 1, 0, 0, 1, 1,
1.238285, 0.8524212, 1.059977, 1, 0, 0, 1, 1,
1.241801, 1.467766, -0.2973197, 0, 0, 0, 1, 1,
1.244191, -0.8320687, 2.627102, 0, 0, 0, 1, 1,
1.245125, -0.5415072, 1.893843, 0, 0, 0, 1, 1,
1.251333, -1.019249, 2.625661, 0, 0, 0, 1, 1,
1.25613, -0.9372082, 2.126378, 0, 0, 0, 1, 1,
1.256369, 2.139972, 1.093811, 0, 0, 0, 1, 1,
1.263402, 0.8867164, 0.6046832, 0, 0, 0, 1, 1,
1.275909, 0.02985636, 0.4577778, 1, 1, 1, 1, 1,
1.279875, -0.01812505, 0.9356053, 1, 1, 1, 1, 1,
1.28042, 1.17067, 0.9524173, 1, 1, 1, 1, 1,
1.284352, -0.2134971, 2.300269, 1, 1, 1, 1, 1,
1.296099, -0.4446552, 2.445732, 1, 1, 1, 1, 1,
1.306946, -1.28022, 1.414983, 1, 1, 1, 1, 1,
1.319835, -0.8337465, 2.867646, 1, 1, 1, 1, 1,
1.343582, 0.9842063, 0.08788007, 1, 1, 1, 1, 1,
1.350697, -0.5732018, 0.708292, 1, 1, 1, 1, 1,
1.363824, -1.227284, 3.057188, 1, 1, 1, 1, 1,
1.370239, 0.3444469, 1.600153, 1, 1, 1, 1, 1,
1.375602, 0.508637, 1.581521, 1, 1, 1, 1, 1,
1.376625, 0.1337107, 2.007748, 1, 1, 1, 1, 1,
1.379031, 0.5451798, 1.560016, 1, 1, 1, 1, 1,
1.379687, 0.7581689, 1.745335, 1, 1, 1, 1, 1,
1.384179, -1.503252, 2.428671, 0, 0, 1, 1, 1,
1.3913, 0.6343499, -0.1971979, 1, 0, 0, 1, 1,
1.398819, -0.2541806, 1.10379, 1, 0, 0, 1, 1,
1.402981, 1.062829, 1.855224, 1, 0, 0, 1, 1,
1.404249, -0.4694338, 1.344494, 1, 0, 0, 1, 1,
1.413373, 1.010411, 0.8966712, 1, 0, 0, 1, 1,
1.418191, -0.5089923, 0.5533534, 0, 0, 0, 1, 1,
1.423933, 0.2660943, 1.25156, 0, 0, 0, 1, 1,
1.444968, -0.2329893, 3.101162, 0, 0, 0, 1, 1,
1.445239, -0.6707537, 2.100631, 0, 0, 0, 1, 1,
1.447731, -0.3010577, 2.929291, 0, 0, 0, 1, 1,
1.449899, 0.7164162, 2.006099, 0, 0, 0, 1, 1,
1.468684, 0.3627326, 0.007175367, 0, 0, 0, 1, 1,
1.470949, -0.4489602, 1.589579, 1, 1, 1, 1, 1,
1.477769, -1.190181, 1.777188, 1, 1, 1, 1, 1,
1.482391, 1.331219, 1.024761, 1, 1, 1, 1, 1,
1.485331, -1.541009, 4.228084, 1, 1, 1, 1, 1,
1.486211, -0.2483505, 0.6844333, 1, 1, 1, 1, 1,
1.488173, -1.500908, 1.601887, 1, 1, 1, 1, 1,
1.495794, -1.124067, 2.269635, 1, 1, 1, 1, 1,
1.502073, 0.3838663, 2.371831, 1, 1, 1, 1, 1,
1.522101, 1.207333, -0.7237049, 1, 1, 1, 1, 1,
1.525315, -1.551477, 1.962917, 1, 1, 1, 1, 1,
1.53018, -1.666678, 3.47208, 1, 1, 1, 1, 1,
1.579952, -2.452676, 4.194248, 1, 1, 1, 1, 1,
1.585102, -0.7112932, 2.103457, 1, 1, 1, 1, 1,
1.587184, -0.7005262, 3.090782, 1, 1, 1, 1, 1,
1.597227, 0.2729434, -0.4139213, 1, 1, 1, 1, 1,
1.601267, 0.2718613, 1.507101, 0, 0, 1, 1, 1,
1.603943, -1.036068, 3.783359, 1, 0, 0, 1, 1,
1.615317, 1.40447, 2.26223, 1, 0, 0, 1, 1,
1.627327, 0.1760954, 1.260607, 1, 0, 0, 1, 1,
1.632649, -1.458713, 1.421774, 1, 0, 0, 1, 1,
1.64764, 1.091987, 0.6503888, 1, 0, 0, 1, 1,
1.656307, -0.1659577, 2.548365, 0, 0, 0, 1, 1,
1.705322, -0.8598874, 2.645679, 0, 0, 0, 1, 1,
1.716306, 0.3480459, 0.6584311, 0, 0, 0, 1, 1,
1.718475, 0.0178948, 1.394912, 0, 0, 0, 1, 1,
1.743083, -0.1493699, 3.520181, 0, 0, 0, 1, 1,
1.752813, -0.4580762, 0.9935022, 0, 0, 0, 1, 1,
1.782375, -1.628831, 4.266361, 0, 0, 0, 1, 1,
1.820712, 0.6171686, -0.3275296, 1, 1, 1, 1, 1,
1.823467, 0.7360657, 1.500535, 1, 1, 1, 1, 1,
1.830136, 0.317951, 2.647035, 1, 1, 1, 1, 1,
1.84409, -0.1363805, 2.093596, 1, 1, 1, 1, 1,
1.850662, 0.1233319, 2.481313, 1, 1, 1, 1, 1,
1.85671, 0.8535141, 2.057655, 1, 1, 1, 1, 1,
1.888252, 1.756253, 0.5011604, 1, 1, 1, 1, 1,
1.902477, 0.1655452, 0.0006868574, 1, 1, 1, 1, 1,
1.937032, -0.791823, 2.541239, 1, 1, 1, 1, 1,
1.958327, 0.07625612, 1.556946, 1, 1, 1, 1, 1,
1.965218, -0.953666, 4.49675, 1, 1, 1, 1, 1,
1.97008, 0.2831022, 1.584826, 1, 1, 1, 1, 1,
1.985752, 0.8820146, 0.1107498, 1, 1, 1, 1, 1,
1.999574, -0.5048943, 1.176661, 1, 1, 1, 1, 1,
2.016655, 0.832734, 1.753475, 1, 1, 1, 1, 1,
2.017402, -1.385823, 1.652439, 0, 0, 1, 1, 1,
2.092725, 0.1643835, 2.717811, 1, 0, 0, 1, 1,
2.10419, 0.6478676, -0.1504044, 1, 0, 0, 1, 1,
2.128503, -0.6043579, 1.244877, 1, 0, 0, 1, 1,
2.157488, 0.9153502, -0.4457144, 1, 0, 0, 1, 1,
2.209782, 1.063328, -0.2490842, 1, 0, 0, 1, 1,
2.211963, 0.03442432, 3.596186, 0, 0, 0, 1, 1,
2.226758, 1.462188, 0.1756425, 0, 0, 0, 1, 1,
2.290485, 0.08137589, 1.05419, 0, 0, 0, 1, 1,
2.365323, 1.921648, 0.1867843, 0, 0, 0, 1, 1,
2.401689, -0.3352576, 1.966168, 0, 0, 0, 1, 1,
2.512256, -0.2661071, 1.828039, 0, 0, 0, 1, 1,
2.606189, -0.2938094, 2.669339, 0, 0, 0, 1, 1,
2.655408, -0.2487223, 1.221951, 1, 1, 1, 1, 1,
2.72176, -1.422724, 1.414083, 1, 1, 1, 1, 1,
2.742865, 0.1153139, 1.362083, 1, 1, 1, 1, 1,
2.758314, -1.099402, 3.811755, 1, 1, 1, 1, 1,
2.877831, 1.031998, 1.504601, 1, 1, 1, 1, 1,
2.995393, 0.04009894, 1.743998, 1, 1, 1, 1, 1,
3.884858, -1.320105, 2.383188, 1, 1, 1, 1, 1
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
var radius = 9.378732;
var distance = 32.9424;
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
mvMatrix.translate( -0.1785848, -0.1117182, 0.163034 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.9424);
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
