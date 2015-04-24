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
-3.064672, 0.23364, -0.5543422, 1, 0, 0, 1,
-2.934519, 0.367923, -0.3969098, 1, 0.007843138, 0, 1,
-2.672775, 1.675037, -1.607819, 1, 0.01176471, 0, 1,
-2.653682, 0.01223979, -1.704067, 1, 0.01960784, 0, 1,
-2.640865, -0.2898985, -2.238452, 1, 0.02352941, 0, 1,
-2.593281, -0.248791, -2.120864, 1, 0.03137255, 0, 1,
-2.551314, 0.3545002, -0.9867114, 1, 0.03529412, 0, 1,
-2.504522, 0.1387964, -1.315589, 1, 0.04313726, 0, 1,
-2.50263, -0.9898262, -1.742901, 1, 0.04705882, 0, 1,
-2.38942, 0.7179947, -2.131382, 1, 0.05490196, 0, 1,
-2.385014, 0.8258013, -2.746732, 1, 0.05882353, 0, 1,
-2.350486, -0.7916734, -2.153365, 1, 0.06666667, 0, 1,
-2.343575, 3.282219, -0.5521984, 1, 0.07058824, 0, 1,
-2.341892, 0.2399596, 0.03974962, 1, 0.07843138, 0, 1,
-2.31867, 1.221711, 0.07349044, 1, 0.08235294, 0, 1,
-2.295958, 1.855976, -0.5431499, 1, 0.09019608, 0, 1,
-2.256655, 1.52654, -1.498914, 1, 0.09411765, 0, 1,
-2.229489, -0.07631192, -2.195332, 1, 0.1019608, 0, 1,
-2.211942, -0.128194, -2.775031, 1, 0.1098039, 0, 1,
-2.190115, 1.235632, -0.5809721, 1, 0.1137255, 0, 1,
-2.172612, -1.017472, -2.602324, 1, 0.1215686, 0, 1,
-2.153814, 0.5986014, -1.669424, 1, 0.1254902, 0, 1,
-2.12386, 1.257833, 0.4598382, 1, 0.1333333, 0, 1,
-2.109528, 0.1035345, -0.334928, 1, 0.1372549, 0, 1,
-2.057216, 0.3770798, -3.728771, 1, 0.145098, 0, 1,
-2.008212, 0.4384397, -0.4362671, 1, 0.1490196, 0, 1,
-2.002002, -0.4351055, -2.170755, 1, 0.1568628, 0, 1,
-1.990515, 0.3415654, -2.36425, 1, 0.1607843, 0, 1,
-1.989058, -1.180817, -3.205671, 1, 0.1686275, 0, 1,
-1.980953, -1.767168, -3.003381, 1, 0.172549, 0, 1,
-1.952604, -1.724599, -1.938478, 1, 0.1803922, 0, 1,
-1.942243, 0.2855866, -1.227473, 1, 0.1843137, 0, 1,
-1.911568, 0.6688348, -0.9095922, 1, 0.1921569, 0, 1,
-1.88149, -1.454319, -2.110607, 1, 0.1960784, 0, 1,
-1.865814, 0.7838739, -0.1809271, 1, 0.2039216, 0, 1,
-1.846807, 1.607405, -0.5889403, 1, 0.2117647, 0, 1,
-1.835356, 0.2995201, -0.8479917, 1, 0.2156863, 0, 1,
-1.831387, 0.1681496, -1.245372, 1, 0.2235294, 0, 1,
-1.831272, -1.956882, -2.317724, 1, 0.227451, 0, 1,
-1.831254, -0.9705242, -1.757737, 1, 0.2352941, 0, 1,
-1.823853, 1.142909, -1.798725, 1, 0.2392157, 0, 1,
-1.821695, 1.697987, -2.407462, 1, 0.2470588, 0, 1,
-1.821477, 1.143377, -1.046022, 1, 0.2509804, 0, 1,
-1.807329, 0.3900393, -0.1794983, 1, 0.2588235, 0, 1,
-1.793454, 1.515398, -0.4452508, 1, 0.2627451, 0, 1,
-1.763807, 0.5110598, -1.966918, 1, 0.2705882, 0, 1,
-1.755347, -1.096888, -3.458581, 1, 0.2745098, 0, 1,
-1.736866, 2.060543, -0.4926544, 1, 0.282353, 0, 1,
-1.700162, -0.4003723, -2.470016, 1, 0.2862745, 0, 1,
-1.684995, 0.7780157, -0.7835266, 1, 0.2941177, 0, 1,
-1.682689, 1.26809, -1.405703, 1, 0.3019608, 0, 1,
-1.674049, 0.2618254, -1.673673, 1, 0.3058824, 0, 1,
-1.658258, 0.4072808, -1.528205, 1, 0.3137255, 0, 1,
-1.648391, 2.346854, 1.247883, 1, 0.3176471, 0, 1,
-1.646562, 0.3966984, -1.409511, 1, 0.3254902, 0, 1,
-1.639835, 0.4882972, 1.035215, 1, 0.3294118, 0, 1,
-1.638332, -0.6192376, -2.502401, 1, 0.3372549, 0, 1,
-1.618452, -1.141441, -1.13585, 1, 0.3411765, 0, 1,
-1.618387, -0.9537115, -2.226643, 1, 0.3490196, 0, 1,
-1.574949, 0.9205568, -2.345163, 1, 0.3529412, 0, 1,
-1.560193, 0.2288629, -0.02221462, 1, 0.3607843, 0, 1,
-1.536673, 1.637397, -0.7288349, 1, 0.3647059, 0, 1,
-1.494339, -1.197129, -1.722665, 1, 0.372549, 0, 1,
-1.493089, 1.047295, -0.2155941, 1, 0.3764706, 0, 1,
-1.4925, -0.6647212, -1.300189, 1, 0.3843137, 0, 1,
-1.492077, -0.01065501, -1.06408, 1, 0.3882353, 0, 1,
-1.486019, -0.1157494, 0.07233344, 1, 0.3960784, 0, 1,
-1.473808, 0.2467846, -1.228564, 1, 0.4039216, 0, 1,
-1.465559, -0.6847204, -2.060552, 1, 0.4078431, 0, 1,
-1.44857, -0.1495705, -1.359174, 1, 0.4156863, 0, 1,
-1.435714, 0.8204058, -1.955015, 1, 0.4196078, 0, 1,
-1.426401, 1.2055, -1.277465, 1, 0.427451, 0, 1,
-1.403502, 0.5779588, -0.5864802, 1, 0.4313726, 0, 1,
-1.395404, 0.3363022, -1.34352, 1, 0.4392157, 0, 1,
-1.377924, 0.1672273, -0.2203936, 1, 0.4431373, 0, 1,
-1.376816, -0.5180832, -1.359927, 1, 0.4509804, 0, 1,
-1.37002, 0.4171305, -2.687786, 1, 0.454902, 0, 1,
-1.358964, -0.9558334, -1.922036, 1, 0.4627451, 0, 1,
-1.355559, -1.185521, -3.226105, 1, 0.4666667, 0, 1,
-1.35406, -1.499659, -5.251734, 1, 0.4745098, 0, 1,
-1.350373, 0.6627411, -1.108741, 1, 0.4784314, 0, 1,
-1.349176, -0.9356511, -1.308656, 1, 0.4862745, 0, 1,
-1.341063, -0.3317419, -3.325695, 1, 0.4901961, 0, 1,
-1.336019, -0.1528612, -0.04130695, 1, 0.4980392, 0, 1,
-1.335887, 1.310491, 0.2122656, 1, 0.5058824, 0, 1,
-1.329537, 0.8564668, -2.043386, 1, 0.509804, 0, 1,
-1.329454, -1.800963, -2.780787, 1, 0.5176471, 0, 1,
-1.308277, 2.729644, 0.6086085, 1, 0.5215687, 0, 1,
-1.294809, -0.7647395, -3.407842, 1, 0.5294118, 0, 1,
-1.292711, 0.950733, -1.418226, 1, 0.5333334, 0, 1,
-1.291484, -0.0975595, 0.3415582, 1, 0.5411765, 0, 1,
-1.279443, -0.2171791, -2.833784, 1, 0.5450981, 0, 1,
-1.244171, -0.9454075, -3.431895, 1, 0.5529412, 0, 1,
-1.242706, 0.6935856, -1.552574, 1, 0.5568628, 0, 1,
-1.212415, 0.4016787, -2.171246, 1, 0.5647059, 0, 1,
-1.209217, -0.6856427, -2.031896, 1, 0.5686275, 0, 1,
-1.208791, -0.5898177, -0.4181178, 1, 0.5764706, 0, 1,
-1.208566, 0.9971098, -1.536742, 1, 0.5803922, 0, 1,
-1.202693, 0.4146574, -0.1528406, 1, 0.5882353, 0, 1,
-1.196595, -0.5005541, -1.939595, 1, 0.5921569, 0, 1,
-1.192684, -0.5854226, -1.215578, 1, 0.6, 0, 1,
-1.187003, -0.470353, -0.9190182, 1, 0.6078432, 0, 1,
-1.186757, -1.010449, -3.071875, 1, 0.6117647, 0, 1,
-1.184299, 1.695174, -2.375488, 1, 0.6196079, 0, 1,
-1.183569, -0.1565153, -2.813116, 1, 0.6235294, 0, 1,
-1.165114, -1.097045, -5.47548, 1, 0.6313726, 0, 1,
-1.159952, 0.8112281, -0.3431488, 1, 0.6352941, 0, 1,
-1.155103, 0.3791632, -2.221843, 1, 0.6431373, 0, 1,
-1.151399, 0.7778585, -0.6592907, 1, 0.6470588, 0, 1,
-1.146593, -0.416091, -2.739829, 1, 0.654902, 0, 1,
-1.142403, -0.2071598, -3.015608, 1, 0.6588235, 0, 1,
-1.14223, -0.08550712, -2.798513, 1, 0.6666667, 0, 1,
-1.139021, 1.237062, -1.019569, 1, 0.6705883, 0, 1,
-1.136472, 0.3274702, -1.617146, 1, 0.6784314, 0, 1,
-1.133256, -1.042459, -3.628603, 1, 0.682353, 0, 1,
-1.125487, 0.7140739, -0.02068172, 1, 0.6901961, 0, 1,
-1.122607, 0.6917809, -1.477779, 1, 0.6941177, 0, 1,
-1.121826, 0.687336, -1.639266, 1, 0.7019608, 0, 1,
-1.118098, -0.9735618, -2.810712, 1, 0.7098039, 0, 1,
-1.114559, -0.07780206, -1.263635, 1, 0.7137255, 0, 1,
-1.108962, -1.479714, -1.73405, 1, 0.7215686, 0, 1,
-1.106105, -1.783092, -1.921444, 1, 0.7254902, 0, 1,
-1.102896, -1.025625, -0.6311852, 1, 0.7333333, 0, 1,
-1.102584, -0.1695788, -3.49408, 1, 0.7372549, 0, 1,
-1.096709, -0.3124415, -3.507915, 1, 0.7450981, 0, 1,
-1.08932, 0.5344963, -0.9231979, 1, 0.7490196, 0, 1,
-1.086031, 0.07435109, -2.832942, 1, 0.7568628, 0, 1,
-1.074078, 1.363637, -1.846474, 1, 0.7607843, 0, 1,
-1.072387, 0.04125233, -0.9431667, 1, 0.7686275, 0, 1,
-1.068826, -0.7552955, -0.1445418, 1, 0.772549, 0, 1,
-1.068366, 0.5195543, -0.7650448, 1, 0.7803922, 0, 1,
-1.065138, -0.134544, -2.149118, 1, 0.7843137, 0, 1,
-1.064197, 1.128723, -3.040145, 1, 0.7921569, 0, 1,
-1.061155, 1.383675, -2.378446, 1, 0.7960784, 0, 1,
-1.054403, 1.098812, -0.312325, 1, 0.8039216, 0, 1,
-1.051441, 1.067419, 0.02878392, 1, 0.8117647, 0, 1,
-1.039525, -0.8905118, -3.331878, 1, 0.8156863, 0, 1,
-1.035923, -0.5082147, -1.322071, 1, 0.8235294, 0, 1,
-1.034519, -1.64302, -3.883133, 1, 0.827451, 0, 1,
-1.033629, 0.9805446, -0.633573, 1, 0.8352941, 0, 1,
-1.032954, -1.630217, -4.535273, 1, 0.8392157, 0, 1,
-1.024125, 0.07132044, -0.9697364, 1, 0.8470588, 0, 1,
-1.020551, -0.7373818, -2.950493, 1, 0.8509804, 0, 1,
-1.016336, -0.4161764, -1.009521, 1, 0.8588235, 0, 1,
-1.015176, 0.2128438, -3.922842, 1, 0.8627451, 0, 1,
-1.010442, -2.369128, -2.297007, 1, 0.8705882, 0, 1,
-1.005672, -0.0129048, -0.09233833, 1, 0.8745098, 0, 1,
-0.999706, -0.1429185, -1.950905, 1, 0.8823529, 0, 1,
-0.9971756, 0.6923801, 1.439562, 1, 0.8862745, 0, 1,
-0.9869006, -1.095462, -1.427636, 1, 0.8941177, 0, 1,
-0.9857644, 1.150247, -0.08776924, 1, 0.8980392, 0, 1,
-0.9760487, -0.5438778, -1.557318, 1, 0.9058824, 0, 1,
-0.9750541, -1.320435, -1.368248, 1, 0.9137255, 0, 1,
-0.9660196, 0.5752699, -0.448029, 1, 0.9176471, 0, 1,
-0.9603757, 0.651802, 0.5171437, 1, 0.9254902, 0, 1,
-0.944805, -1.142011, -1.542304, 1, 0.9294118, 0, 1,
-0.9345569, 0.7507346, 0.2024098, 1, 0.9372549, 0, 1,
-0.9290655, 0.5210216, -1.715511, 1, 0.9411765, 0, 1,
-0.927824, 0.05196041, -1.019968, 1, 0.9490196, 0, 1,
-0.924672, 1.48696, 1.078094, 1, 0.9529412, 0, 1,
-0.9219491, 0.466412, 0.9659805, 1, 0.9607843, 0, 1,
-0.916685, 0.008656946, -3.393153, 1, 0.9647059, 0, 1,
-0.9141951, 2.699376, -0.02568395, 1, 0.972549, 0, 1,
-0.9105487, -1.382156, -2.679882, 1, 0.9764706, 0, 1,
-0.9100327, 0.5958266, -3.005678, 1, 0.9843137, 0, 1,
-0.9066275, -0.5479457, -2.164581, 1, 0.9882353, 0, 1,
-0.9026543, 0.7598845, -1.282938, 1, 0.9960784, 0, 1,
-0.9005156, 0.03431895, -2.038427, 0.9960784, 1, 0, 1,
-0.8971364, 0.8823491, -1.084743, 0.9921569, 1, 0, 1,
-0.8933319, -0.2628985, -3.067786, 0.9843137, 1, 0, 1,
-0.8932401, -0.1160353, -1.984582, 0.9803922, 1, 0, 1,
-0.8930165, 0.3610081, -1.529845, 0.972549, 1, 0, 1,
-0.8860468, -0.0409756, -2.858606, 0.9686275, 1, 0, 1,
-0.8852732, -1.652062, -1.747199, 0.9607843, 1, 0, 1,
-0.8753477, -0.7327731, 0.8925836, 0.9568627, 1, 0, 1,
-0.8736303, -0.4593323, -2.184705, 0.9490196, 1, 0, 1,
-0.8665619, 0.4615733, -2.239619, 0.945098, 1, 0, 1,
-0.8583913, -1.3658, -2.198049, 0.9372549, 1, 0, 1,
-0.8550351, -0.08238568, -1.106633, 0.9333333, 1, 0, 1,
-0.8546227, 0.03223516, -2.892494, 0.9254902, 1, 0, 1,
-0.8533381, -0.6008921, -2.081391, 0.9215686, 1, 0, 1,
-0.8468913, 3.229311, -0.1268454, 0.9137255, 1, 0, 1,
-0.846742, 0.0126383, -1.614227, 0.9098039, 1, 0, 1,
-0.8446143, -0.6037406, -3.63666, 0.9019608, 1, 0, 1,
-0.8324184, 0.3594246, -1.911141, 0.8941177, 1, 0, 1,
-0.8320022, 1.441315, -0.2969293, 0.8901961, 1, 0, 1,
-0.8314405, 1.818274, 0.6333363, 0.8823529, 1, 0, 1,
-0.8292861, 0.6145533, -1.771917, 0.8784314, 1, 0, 1,
-0.8239546, 0.09676813, -1.400607, 0.8705882, 1, 0, 1,
-0.8202795, -1.030368, -1.788258, 0.8666667, 1, 0, 1,
-0.8184841, 1.313406, -1.301504, 0.8588235, 1, 0, 1,
-0.8138496, -0.04429614, -2.191329, 0.854902, 1, 0, 1,
-0.8106632, -1.792796, -3.182436, 0.8470588, 1, 0, 1,
-0.8105775, -2.947376, -3.856806, 0.8431373, 1, 0, 1,
-0.803555, 0.02527595, -2.452557, 0.8352941, 1, 0, 1,
-0.8031396, 0.8933125, -1.786811, 0.8313726, 1, 0, 1,
-0.7982622, -2.718832, -3.414907, 0.8235294, 1, 0, 1,
-0.7967571, 1.232238, -1.033513, 0.8196079, 1, 0, 1,
-0.7896982, 1.353444, -1.349622, 0.8117647, 1, 0, 1,
-0.7869976, -0.8601612, -2.427114, 0.8078431, 1, 0, 1,
-0.7862405, 0.2432537, -1.142662, 0.8, 1, 0, 1,
-0.7860898, -1.721812, -3.05332, 0.7921569, 1, 0, 1,
-0.779206, -0.1123401, -0.4674661, 0.7882353, 1, 0, 1,
-0.7780684, -1.317617, -3.249601, 0.7803922, 1, 0, 1,
-0.773446, -1.203087, -1.950749, 0.7764706, 1, 0, 1,
-0.7726219, 0.1008602, -0.7267725, 0.7686275, 1, 0, 1,
-0.7697572, -1.029217, -3.546436, 0.7647059, 1, 0, 1,
-0.7673196, -0.2718658, -2.229329, 0.7568628, 1, 0, 1,
-0.7636643, -1.285507, -2.496368, 0.7529412, 1, 0, 1,
-0.7585118, 1.34697, -2.22777, 0.7450981, 1, 0, 1,
-0.757551, -0.3010857, -3.061931, 0.7411765, 1, 0, 1,
-0.7571113, -0.2661266, -4.350152, 0.7333333, 1, 0, 1,
-0.7559331, 1.399194, -0.8612569, 0.7294118, 1, 0, 1,
-0.7558053, -0.6740183, -1.848934, 0.7215686, 1, 0, 1,
-0.7552931, -0.1976846, -3.021137, 0.7176471, 1, 0, 1,
-0.748173, 0.9869519, 0.5021769, 0.7098039, 1, 0, 1,
-0.740877, -1.78697, -1.93149, 0.7058824, 1, 0, 1,
-0.7391281, 2.194272, -0.8363685, 0.6980392, 1, 0, 1,
-0.7376998, -0.8597897, -1.896009, 0.6901961, 1, 0, 1,
-0.7356071, -1.1211, -2.400532, 0.6862745, 1, 0, 1,
-0.7354156, 1.660278, -0.1070045, 0.6784314, 1, 0, 1,
-0.7290065, -1.760096, -2.503875, 0.6745098, 1, 0, 1,
-0.7283353, 0.2063543, -1.698639, 0.6666667, 1, 0, 1,
-0.7246788, -1.149808, -4.252361, 0.6627451, 1, 0, 1,
-0.7216124, -0.5709891, -3.276454, 0.654902, 1, 0, 1,
-0.7202114, 0.5697455, 0.552501, 0.6509804, 1, 0, 1,
-0.7200028, 0.9739184, -1.139981, 0.6431373, 1, 0, 1,
-0.7168053, -0.6792369, -3.914633, 0.6392157, 1, 0, 1,
-0.7119924, 0.6167089, -1.195058, 0.6313726, 1, 0, 1,
-0.7004686, 0.5149033, -0.4900623, 0.627451, 1, 0, 1,
-0.6861141, 0.4459313, -2.048429, 0.6196079, 1, 0, 1,
-0.6859763, -0.7576742, -2.997125, 0.6156863, 1, 0, 1,
-0.6857007, -0.5856715, -3.094367, 0.6078432, 1, 0, 1,
-0.6818596, -2.425071, -2.733241, 0.6039216, 1, 0, 1,
-0.6765053, 0.009275022, -1.88981, 0.5960785, 1, 0, 1,
-0.6752205, 0.9245635, -1.237558, 0.5882353, 1, 0, 1,
-0.6724103, 0.2739998, 0.4304517, 0.5843138, 1, 0, 1,
-0.6706588, -0.09222522, -1.827707, 0.5764706, 1, 0, 1,
-0.6687921, 0.6466548, -0.4294533, 0.572549, 1, 0, 1,
-0.664435, 0.699065, -1.85031, 0.5647059, 1, 0, 1,
-0.6622723, 2.765053, 0.3124229, 0.5607843, 1, 0, 1,
-0.65669, -1.01889, -5.329159, 0.5529412, 1, 0, 1,
-0.6540347, -1.942688, -4.117835, 0.5490196, 1, 0, 1,
-0.6508223, -0.5629928, -4.181685, 0.5411765, 1, 0, 1,
-0.6493896, -1.420705, -1.617174, 0.5372549, 1, 0, 1,
-0.648487, 0.7452607, -1.232681, 0.5294118, 1, 0, 1,
-0.647757, 1.219548, -0.2893313, 0.5254902, 1, 0, 1,
-0.6475554, -0.06284558, -2.306236, 0.5176471, 1, 0, 1,
-0.6410291, 0.8034411, -0.04033455, 0.5137255, 1, 0, 1,
-0.6390218, 1.261691, 0.01082778, 0.5058824, 1, 0, 1,
-0.6372878, -1.7824, -3.421743, 0.5019608, 1, 0, 1,
-0.6337481, -0.7339399, -1.978291, 0.4941176, 1, 0, 1,
-0.6330985, -0.1240484, -1.014335, 0.4862745, 1, 0, 1,
-0.6327361, 1.029699, -0.6968743, 0.4823529, 1, 0, 1,
-0.629151, -0.5903414, -2.166961, 0.4745098, 1, 0, 1,
-0.6283028, 0.5057343, -3.065673, 0.4705882, 1, 0, 1,
-0.6255226, -0.6009719, -1.916828, 0.4627451, 1, 0, 1,
-0.6250142, -2.154419, -3.533073, 0.4588235, 1, 0, 1,
-0.623024, 0.9877822, -0.6362723, 0.4509804, 1, 0, 1,
-0.6178565, 0.1750547, -0.8704809, 0.4470588, 1, 0, 1,
-0.6166945, -0.8468369, -3.240785, 0.4392157, 1, 0, 1,
-0.609444, -0.5791178, -4.023836, 0.4352941, 1, 0, 1,
-0.6081062, 1.838811, -1.735214, 0.427451, 1, 0, 1,
-0.6033172, -1.012097, -1.677277, 0.4235294, 1, 0, 1,
-0.6018622, 0.6733475, -1.928014, 0.4156863, 1, 0, 1,
-0.5990199, 0.02314387, -1.600963, 0.4117647, 1, 0, 1,
-0.5933509, -0.3081714, -2.371157, 0.4039216, 1, 0, 1,
-0.5845642, -0.450874, -2.388747, 0.3960784, 1, 0, 1,
-0.5807707, -0.1092333, -1.341146, 0.3921569, 1, 0, 1,
-0.5783684, -0.003386427, -0.5733439, 0.3843137, 1, 0, 1,
-0.5731822, -0.7505925, -0.7261959, 0.3803922, 1, 0, 1,
-0.5725011, 0.8918675, 0.2282756, 0.372549, 1, 0, 1,
-0.5718687, -0.5502154, -2.190946, 0.3686275, 1, 0, 1,
-0.5673301, 1.778649, -0.7103197, 0.3607843, 1, 0, 1,
-0.5660099, 0.8344211, 0.5138983, 0.3568628, 1, 0, 1,
-0.5539306, -0.4630273, -1.411602, 0.3490196, 1, 0, 1,
-0.5530281, 2.164984, 1.471838, 0.345098, 1, 0, 1,
-0.5519851, 0.2693271, -2.690687, 0.3372549, 1, 0, 1,
-0.5477543, 1.027306, -0.4448575, 0.3333333, 1, 0, 1,
-0.5381482, -0.4634959, -2.724485, 0.3254902, 1, 0, 1,
-0.5381223, 1.319417, -2.066485, 0.3215686, 1, 0, 1,
-0.5378332, 0.2779297, 0.8001885, 0.3137255, 1, 0, 1,
-0.535706, 0.8607486, -0.6053463, 0.3098039, 1, 0, 1,
-0.5355088, 0.7667912, -0.2192468, 0.3019608, 1, 0, 1,
-0.5333821, -1.185868, -2.418888, 0.2941177, 1, 0, 1,
-0.5296516, 1.634248, -0.5183309, 0.2901961, 1, 0, 1,
-0.5193655, -0.6465296, -3.458041, 0.282353, 1, 0, 1,
-0.5177567, 0.408992, 0.2364602, 0.2784314, 1, 0, 1,
-0.5173731, -0.5123423, -1.303546, 0.2705882, 1, 0, 1,
-0.5166751, 0.673008, -2.119068, 0.2666667, 1, 0, 1,
-0.5161665, -0.3174784, -2.492911, 0.2588235, 1, 0, 1,
-0.5144063, 0.4027035, -1.975836, 0.254902, 1, 0, 1,
-0.5088099, -1.076653, -2.479895, 0.2470588, 1, 0, 1,
-0.5084437, -0.3861471, -1.185583, 0.2431373, 1, 0, 1,
-0.5041534, 0.1770839, -0.8763103, 0.2352941, 1, 0, 1,
-0.5027937, -0.3657256, -2.243625, 0.2313726, 1, 0, 1,
-0.5010889, -0.84995, -2.924824, 0.2235294, 1, 0, 1,
-0.4993226, -0.8206189, -3.582164, 0.2196078, 1, 0, 1,
-0.4989948, -1.302944, -1.602372, 0.2117647, 1, 0, 1,
-0.494074, 0.8649918, -0.1702713, 0.2078431, 1, 0, 1,
-0.4940638, 0.978304, -1.552685, 0.2, 1, 0, 1,
-0.4863238, 0.07952096, -1.194667, 0.1921569, 1, 0, 1,
-0.479899, -0.2896866, -2.41391, 0.1882353, 1, 0, 1,
-0.4741413, -0.1555152, -0.4569414, 0.1803922, 1, 0, 1,
-0.4675295, 1.164991, -0.9962301, 0.1764706, 1, 0, 1,
-0.4671403, 0.7124007, -1.134003, 0.1686275, 1, 0, 1,
-0.4670438, 2.584167, 0.8451824, 0.1647059, 1, 0, 1,
-0.463253, 0.7551362, -0.03645961, 0.1568628, 1, 0, 1,
-0.4581365, 0.2869957, -2.030752, 0.1529412, 1, 0, 1,
-0.4551491, -0.5759215, -1.124598, 0.145098, 1, 0, 1,
-0.4529429, -0.6985179, -1.679332, 0.1411765, 1, 0, 1,
-0.4469348, 1.146058, 0.593092, 0.1333333, 1, 0, 1,
-0.4433189, -0.3144454, -2.657948, 0.1294118, 1, 0, 1,
-0.4432003, 1.314191, 0.6391622, 0.1215686, 1, 0, 1,
-0.4420445, 0.7093361, -0.2682685, 0.1176471, 1, 0, 1,
-0.4383652, -0.4543985, -1.776913, 0.1098039, 1, 0, 1,
-0.4374522, -0.8774877, -2.230205, 0.1058824, 1, 0, 1,
-0.4372691, 2.204494, -2.817025, 0.09803922, 1, 0, 1,
-0.4343459, 0.0555615, -1.879715, 0.09019608, 1, 0, 1,
-0.4332668, -1.500334, -1.713818, 0.08627451, 1, 0, 1,
-0.4321132, 0.7562248, 0.176658, 0.07843138, 1, 0, 1,
-0.4315319, 0.3285152, -2.205768, 0.07450981, 1, 0, 1,
-0.4288813, -0.8998491, -4.112156, 0.06666667, 1, 0, 1,
-0.4275996, 1.792226, 0.08919659, 0.0627451, 1, 0, 1,
-0.4218484, 0.6205798, -0.5145412, 0.05490196, 1, 0, 1,
-0.416679, -0.7295151, -1.691841, 0.05098039, 1, 0, 1,
-0.41613, 1.184488, -0.02715339, 0.04313726, 1, 0, 1,
-0.413279, 0.316997, -0.6802039, 0.03921569, 1, 0, 1,
-0.4117627, 1.974219, -0.2761024, 0.03137255, 1, 0, 1,
-0.4089618, 1.264614, 0.8912098, 0.02745098, 1, 0, 1,
-0.4058902, 0.5052823, -0.2857398, 0.01960784, 1, 0, 1,
-0.4056644, -0.08920892, -1.042009, 0.01568628, 1, 0, 1,
-0.4043983, 1.598786, -1.414424, 0.007843138, 1, 0, 1,
-0.3964966, 0.4973154, -1.701697, 0.003921569, 1, 0, 1,
-0.3951782, 0.5805798, -1.039012, 0, 1, 0.003921569, 1,
-0.3935039, 0.895914, -0.7053872, 0, 1, 0.01176471, 1,
-0.3929631, 0.6102499, -1.60066, 0, 1, 0.01568628, 1,
-0.3888511, -1.789525, -2.604282, 0, 1, 0.02352941, 1,
-0.3819075, 0.6627801, -1.424407, 0, 1, 0.02745098, 1,
-0.3796886, -0.0253493, -1.771555, 0, 1, 0.03529412, 1,
-0.378066, -0.02690419, -1.036879, 0, 1, 0.03921569, 1,
-0.3777119, -0.6681722, -3.74704, 0, 1, 0.04705882, 1,
-0.3776551, 1.664241, 0.2935743, 0, 1, 0.05098039, 1,
-0.377396, -0.2351755, -1.029246, 0, 1, 0.05882353, 1,
-0.374888, -0.09557098, -1.045818, 0, 1, 0.0627451, 1,
-0.3666877, -0.2457183, -3.384164, 0, 1, 0.07058824, 1,
-0.3651634, -0.4326834, -0.8935021, 0, 1, 0.07450981, 1,
-0.3651421, 1.990406, -0.5224161, 0, 1, 0.08235294, 1,
-0.3646137, -0.530511, -1.359516, 0, 1, 0.08627451, 1,
-0.3625645, 0.7328859, -0.9506208, 0, 1, 0.09411765, 1,
-0.3604521, -0.3061325, -1.055829, 0, 1, 0.1019608, 1,
-0.352085, 1.422016, -1.399953, 0, 1, 0.1058824, 1,
-0.3505965, 0.6165527, -0.3569565, 0, 1, 0.1137255, 1,
-0.3432084, 0.3813452, 0.5509863, 0, 1, 0.1176471, 1,
-0.3406482, 0.6838331, -1.542225, 0, 1, 0.1254902, 1,
-0.3272402, 0.5128637, -1.019812, 0, 1, 0.1294118, 1,
-0.3250727, 0.7234737, 0.7485299, 0, 1, 0.1372549, 1,
-0.3227916, -1.140636, -3.311354, 0, 1, 0.1411765, 1,
-0.3196063, -2.433127, -2.040995, 0, 1, 0.1490196, 1,
-0.3136135, 0.7516237, 0.6875892, 0, 1, 0.1529412, 1,
-0.3103535, -0.03548504, -2.075784, 0, 1, 0.1607843, 1,
-0.3101375, 0.8899501, 0.04663866, 0, 1, 0.1647059, 1,
-0.3044791, -0.238721, -3.522939, 0, 1, 0.172549, 1,
-0.3038024, 0.543606, -1.844548, 0, 1, 0.1764706, 1,
-0.302421, -0.4069239, -2.585025, 0, 1, 0.1843137, 1,
-0.3015659, 0.1603762, -0.6606361, 0, 1, 0.1882353, 1,
-0.2925383, 0.3899821, -0.9760236, 0, 1, 0.1960784, 1,
-0.2917542, 0.4610927, -1.368899, 0, 1, 0.2039216, 1,
-0.2912063, -0.5472439, -3.398197, 0, 1, 0.2078431, 1,
-0.2899826, -0.1256147, -2.155069, 0, 1, 0.2156863, 1,
-0.2854019, 1.129486, -1.504093, 0, 1, 0.2196078, 1,
-0.281319, 1.076772, -1.528514, 0, 1, 0.227451, 1,
-0.2809917, -0.3365796, -2.752032, 0, 1, 0.2313726, 1,
-0.2802845, -1.692371, -2.71745, 0, 1, 0.2392157, 1,
-0.2792401, 0.3656827, -1.805881, 0, 1, 0.2431373, 1,
-0.277245, 1.199905, -1.351043, 0, 1, 0.2509804, 1,
-0.2770971, 1.043639, -0.2345925, 0, 1, 0.254902, 1,
-0.2756041, 0.1872695, -1.902305, 0, 1, 0.2627451, 1,
-0.2655093, 0.6042818, -0.4721392, 0, 1, 0.2666667, 1,
-0.2653218, 1.307571, -0.3353569, 0, 1, 0.2745098, 1,
-0.2630439, -1.072711, -2.098474, 0, 1, 0.2784314, 1,
-0.2626229, -0.9791466, -1.981017, 0, 1, 0.2862745, 1,
-0.2614027, 0.2373979, -1.416357, 0, 1, 0.2901961, 1,
-0.2600608, 0.3228788, 0.01900426, 0, 1, 0.2980392, 1,
-0.2591685, -1.450037, -2.777349, 0, 1, 0.3058824, 1,
-0.2583905, 1.102178, -1.835075, 0, 1, 0.3098039, 1,
-0.257252, -1.026958, -3.194811, 0, 1, 0.3176471, 1,
-0.2535418, 0.4545706, -0.01178262, 0, 1, 0.3215686, 1,
-0.2523312, 0.4108055, -1.347999, 0, 1, 0.3294118, 1,
-0.2487371, 1.910493, -0.639591, 0, 1, 0.3333333, 1,
-0.248676, -0.0009176121, -0.6579189, 0, 1, 0.3411765, 1,
-0.2442155, -0.7504632, -2.182659, 0, 1, 0.345098, 1,
-0.2423991, -0.5638936, -2.698282, 0, 1, 0.3529412, 1,
-0.2397005, 0.9510158, 0.04659458, 0, 1, 0.3568628, 1,
-0.2355497, -0.4987892, -2.331765, 0, 1, 0.3647059, 1,
-0.2265956, 0.03146116, -1.552867, 0, 1, 0.3686275, 1,
-0.225448, -0.9305784, -2.918736, 0, 1, 0.3764706, 1,
-0.224467, -0.1935644, -2.229446, 0, 1, 0.3803922, 1,
-0.2196686, 0.3446485, -0.4392584, 0, 1, 0.3882353, 1,
-0.2177879, 0.1696489, 0.4710609, 0, 1, 0.3921569, 1,
-0.216372, -0.9415691, -1.442528, 0, 1, 0.4, 1,
-0.2126641, -1.196869, -2.586521, 0, 1, 0.4078431, 1,
-0.2051605, -0.4105773, -2.16756, 0, 1, 0.4117647, 1,
-0.1999275, -0.6102235, -1.596097, 0, 1, 0.4196078, 1,
-0.1915148, -0.5344045, -0.894559, 0, 1, 0.4235294, 1,
-0.1837485, 1.651222, -0.6739396, 0, 1, 0.4313726, 1,
-0.1814215, 0.9238915, -1.146547, 0, 1, 0.4352941, 1,
-0.1808971, -0.6104248, -4.3043, 0, 1, 0.4431373, 1,
-0.1808104, 1.092842, -1.570894, 0, 1, 0.4470588, 1,
-0.1802136, -1.007831, -4.410167, 0, 1, 0.454902, 1,
-0.1776298, 0.1305445, -0.9871317, 0, 1, 0.4588235, 1,
-0.1772042, -0.6625996, -3.465744, 0, 1, 0.4666667, 1,
-0.1770863, -0.9658315, -1.731986, 0, 1, 0.4705882, 1,
-0.1725641, 0.3199713, -0.3084702, 0, 1, 0.4784314, 1,
-0.1692732, -0.1505482, -0.7848829, 0, 1, 0.4823529, 1,
-0.1617742, -2.138852, -3.063783, 0, 1, 0.4901961, 1,
-0.1607067, -0.8699512, -1.949386, 0, 1, 0.4941176, 1,
-0.1600151, 2.49962, -0.41441, 0, 1, 0.5019608, 1,
-0.1595237, 0.2668992, -0.7760745, 0, 1, 0.509804, 1,
-0.1586719, -1.063695, -2.69782, 0, 1, 0.5137255, 1,
-0.1530269, -0.143065, 0.02425165, 0, 1, 0.5215687, 1,
-0.1527288, -0.03361015, -1.790506, 0, 1, 0.5254902, 1,
-0.1523831, 1.400868, -0.09552957, 0, 1, 0.5333334, 1,
-0.1480797, -1.379809, -3.930945, 0, 1, 0.5372549, 1,
-0.1476828, 0.712039, 1.270396, 0, 1, 0.5450981, 1,
-0.1457868, -0.3007941, -3.324655, 0, 1, 0.5490196, 1,
-0.1379093, -0.1369632, -2.44735, 0, 1, 0.5568628, 1,
-0.133055, -1.208711, -3.328779, 0, 1, 0.5607843, 1,
-0.1277921, 0.1649576, -1.133226, 0, 1, 0.5686275, 1,
-0.1257663, 1.135529, -0.6534971, 0, 1, 0.572549, 1,
-0.1250787, -0.7811864, -4.866211, 0, 1, 0.5803922, 1,
-0.1221546, -1.749719, -2.366034, 0, 1, 0.5843138, 1,
-0.1212421, 0.7106921, 0.01964001, 0, 1, 0.5921569, 1,
-0.1203801, -1.105135, -3.77649, 0, 1, 0.5960785, 1,
-0.1193507, 0.3677597, -0.9311256, 0, 1, 0.6039216, 1,
-0.1160107, -1.681288, -2.779772, 0, 1, 0.6117647, 1,
-0.1149521, -0.1663424, -2.762918, 0, 1, 0.6156863, 1,
-0.1146987, -0.6225947, -4.090426, 0, 1, 0.6235294, 1,
-0.1138233, 0.8592924, -0.1979477, 0, 1, 0.627451, 1,
-0.1044895, 0.6464385, -0.02796285, 0, 1, 0.6352941, 1,
-0.1044296, -1.088004, -1.634743, 0, 1, 0.6392157, 1,
-0.1020717, -2.989505, -4.2012, 0, 1, 0.6470588, 1,
-0.09998707, -1.257411, -4.524879, 0, 1, 0.6509804, 1,
-0.09948733, 0.03480815, -0.8054398, 0, 1, 0.6588235, 1,
-0.09786066, 1.677502, 0.1578154, 0, 1, 0.6627451, 1,
-0.09703022, -1.872722, -2.347958, 0, 1, 0.6705883, 1,
-0.09042912, -0.7516941, -3.426436, 0, 1, 0.6745098, 1,
-0.08743989, 0.8148466, 0.8727806, 0, 1, 0.682353, 1,
-0.08438528, 0.6815419, -0.130147, 0, 1, 0.6862745, 1,
-0.08282046, -0.6491069, -1.913193, 0, 1, 0.6941177, 1,
-0.0782439, -1.189761, -2.317143, 0, 1, 0.7019608, 1,
-0.07817173, 0.02892071, -1.564856, 0, 1, 0.7058824, 1,
-0.07813313, -0.1595917, -4.365214, 0, 1, 0.7137255, 1,
-0.07758406, 1.074794, -0.3271407, 0, 1, 0.7176471, 1,
-0.07641345, -2.742484, -1.53284, 0, 1, 0.7254902, 1,
-0.07589971, 0.4910809, -0.2943539, 0, 1, 0.7294118, 1,
-0.07549927, -0.7980374, -3.760062, 0, 1, 0.7372549, 1,
-0.07501941, -0.9114628, -3.260994, 0, 1, 0.7411765, 1,
-0.07236733, -0.6312659, -6.031638, 0, 1, 0.7490196, 1,
-0.06971044, 0.2500084, -1.176668, 0, 1, 0.7529412, 1,
-0.06435838, 0.2148492, 0.7504061, 0, 1, 0.7607843, 1,
-0.06175915, 0.8722996, -0.4171339, 0, 1, 0.7647059, 1,
-0.06030077, 0.8439918, -0.4701723, 0, 1, 0.772549, 1,
-0.0599011, -0.04461055, -3.260026, 0, 1, 0.7764706, 1,
-0.05923258, -0.3873695, -2.99953, 0, 1, 0.7843137, 1,
-0.0586221, -1.576407, -3.95219, 0, 1, 0.7882353, 1,
-0.05662421, -0.07417318, -3.015846, 0, 1, 0.7960784, 1,
-0.05073794, -0.02616376, -1.962432, 0, 1, 0.8039216, 1,
-0.04971075, 2.171592, -1.194902, 0, 1, 0.8078431, 1,
-0.04546008, -0.1008128, -2.600796, 0, 1, 0.8156863, 1,
-0.0441478, -2.088672, -2.695604, 0, 1, 0.8196079, 1,
-0.04410372, -0.6981096, -1.754537, 0, 1, 0.827451, 1,
-0.04144912, -1.325964, -3.37852, 0, 1, 0.8313726, 1,
-0.03897728, 0.7333389, -0.3204738, 0, 1, 0.8392157, 1,
-0.03139406, -0.04436243, -3.464985, 0, 1, 0.8431373, 1,
-0.02599476, -0.3762334, -2.49253, 0, 1, 0.8509804, 1,
-0.02250587, -0.519348, -3.141439, 0, 1, 0.854902, 1,
-0.02232482, -2.172253, -2.829202, 0, 1, 0.8627451, 1,
-0.01581379, -1.785723, -3.701791, 0, 1, 0.8666667, 1,
-0.01343481, 0.07450248, -1.168166, 0, 1, 0.8745098, 1,
-0.01049454, -0.2059381, -2.899352, 0, 1, 0.8784314, 1,
-0.00890916, 0.9304097, -1.887543, 0, 1, 0.8862745, 1,
-0.007402428, 0.04277263, 0.3485849, 0, 1, 0.8901961, 1,
-0.00249868, -0.3951248, -2.998675, 0, 1, 0.8980392, 1,
0.004610017, -1.939669, 4.554732, 0, 1, 0.9058824, 1,
0.005700937, -0.5999792, 3.532476, 0, 1, 0.9098039, 1,
0.007826866, -0.5495297, 2.549977, 0, 1, 0.9176471, 1,
0.008571664, 1.246321, 1.071076, 0, 1, 0.9215686, 1,
0.008770035, -0.4679465, 1.899, 0, 1, 0.9294118, 1,
0.01481467, -0.5697448, 3.571889, 0, 1, 0.9333333, 1,
0.0168668, -0.1262493, 3.160647, 0, 1, 0.9411765, 1,
0.01934709, -0.1868492, 3.084802, 0, 1, 0.945098, 1,
0.02179694, 0.53935, 0.2159035, 0, 1, 0.9529412, 1,
0.02586065, 2.655579, 1.581128, 0, 1, 0.9568627, 1,
0.02627623, -0.418146, 2.981703, 0, 1, 0.9647059, 1,
0.02808901, 2.034293, 2.271381, 0, 1, 0.9686275, 1,
0.03445135, 0.4331701, 1.103735, 0, 1, 0.9764706, 1,
0.03529, -1.071241, 5.313654, 0, 1, 0.9803922, 1,
0.03627389, -0.9735177, 2.460211, 0, 1, 0.9882353, 1,
0.03769227, 1.153584, 0.3611999, 0, 1, 0.9921569, 1,
0.04303098, 1.276311, 0.701316, 0, 1, 1, 1,
0.04705345, 0.6776811, -1.099105, 0, 0.9921569, 1, 1,
0.05364546, 0.7751664, 0.7892123, 0, 0.9882353, 1, 1,
0.05901486, 1.36432, 0.1432936, 0, 0.9803922, 1, 1,
0.06446232, 0.731462, 0.1832073, 0, 0.9764706, 1, 1,
0.07224463, 0.2144569, 1.450774, 0, 0.9686275, 1, 1,
0.07819615, -1.738685, 3.457306, 0, 0.9647059, 1, 1,
0.07872774, -0.5102255, 3.721052, 0, 0.9568627, 1, 1,
0.0796498, -0.03923805, 0.0890114, 0, 0.9529412, 1, 1,
0.07979096, -0.2140555, 2.763956, 0, 0.945098, 1, 1,
0.08712453, 0.6615943, -0.3639041, 0, 0.9411765, 1, 1,
0.09173374, -1.202605, 2.032582, 0, 0.9333333, 1, 1,
0.09233242, -0.2513186, 3.07823, 0, 0.9294118, 1, 1,
0.09604495, 0.6070024, -0.1586597, 0, 0.9215686, 1, 1,
0.1010304, -0.3637839, 3.450016, 0, 0.9176471, 1, 1,
0.101556, -1.241405, 3.162388, 0, 0.9098039, 1, 1,
0.1025355, -0.007159464, 1.379391, 0, 0.9058824, 1, 1,
0.1037207, -1.442008, 2.190615, 0, 0.8980392, 1, 1,
0.10492, 0.07657867, 2.878063, 0, 0.8901961, 1, 1,
0.1050661, 0.02645432, 2.918453, 0, 0.8862745, 1, 1,
0.1127906, 0.1020238, 1.057325, 0, 0.8784314, 1, 1,
0.1130485, 1.232204, -0.1423845, 0, 0.8745098, 1, 1,
0.1130599, 0.5157402, 0.1669731, 0, 0.8666667, 1, 1,
0.1134616, 0.03733809, 0.9294382, 0, 0.8627451, 1, 1,
0.1205011, -2.92966, 1.944575, 0, 0.854902, 1, 1,
0.120925, 0.05558911, 0.8327585, 0, 0.8509804, 1, 1,
0.1230253, 0.7165969, -0.727278, 0, 0.8431373, 1, 1,
0.1245109, 0.4499069, -0.6058099, 0, 0.8392157, 1, 1,
0.1269323, -0.3821376, 2.853135, 0, 0.8313726, 1, 1,
0.1308192, -2.132904, 4.249605, 0, 0.827451, 1, 1,
0.1342974, -0.5392122, 3.454236, 0, 0.8196079, 1, 1,
0.1352381, 0.3829479, -0.3070856, 0, 0.8156863, 1, 1,
0.1375557, 0.1262697, 2.346297, 0, 0.8078431, 1, 1,
0.1381242, 2.988803, -1.124304, 0, 0.8039216, 1, 1,
0.1455603, 0.004680484, 1.921644, 0, 0.7960784, 1, 1,
0.1491096, -0.3189961, 2.93326, 0, 0.7882353, 1, 1,
0.1531863, 0.06990051, -1.408366, 0, 0.7843137, 1, 1,
0.1605376, 0.235589, -1.329643, 0, 0.7764706, 1, 1,
0.1624236, 0.507551, 0.7709645, 0, 0.772549, 1, 1,
0.1665567, -1.352869, 2.794937, 0, 0.7647059, 1, 1,
0.1669531, 1.682075, 1.016139, 0, 0.7607843, 1, 1,
0.1673928, -1.17623, 3.166113, 0, 0.7529412, 1, 1,
0.1678917, -0.6952167, 4.129613, 0, 0.7490196, 1, 1,
0.1686165, -0.8984707, 4.696309, 0, 0.7411765, 1, 1,
0.1732653, 1.146872, 0.9677427, 0, 0.7372549, 1, 1,
0.1745217, 0.834058, 0.7680786, 0, 0.7294118, 1, 1,
0.1748845, 0.05712785, 1.357697, 0, 0.7254902, 1, 1,
0.175305, 1.683771, 0.4570605, 0, 0.7176471, 1, 1,
0.1758923, 0.2185829, -0.9815789, 0, 0.7137255, 1, 1,
0.1763404, -0.1978285, 3.421056, 0, 0.7058824, 1, 1,
0.1767843, 0.5177021, 0.07235329, 0, 0.6980392, 1, 1,
0.1796828, -1.30516, 3.44507, 0, 0.6941177, 1, 1,
0.1799081, -1.356973, 4.349751, 0, 0.6862745, 1, 1,
0.1834881, -2.270048, 3.501902, 0, 0.682353, 1, 1,
0.1850976, 0.3665742, 0.7086248, 0, 0.6745098, 1, 1,
0.1887331, 1.29562, 1.404092, 0, 0.6705883, 1, 1,
0.1896485, 0.4870288, 1.620045, 0, 0.6627451, 1, 1,
0.1927407, -0.6408373, 2.730876, 0, 0.6588235, 1, 1,
0.1932784, 0.7824976, -0.5460773, 0, 0.6509804, 1, 1,
0.1967606, 0.3305363, -0.07563035, 0, 0.6470588, 1, 1,
0.2008787, -1.176045, 3.872857, 0, 0.6392157, 1, 1,
0.2025299, -0.4983457, 3.555804, 0, 0.6352941, 1, 1,
0.202562, -0.1119341, 4.160459, 0, 0.627451, 1, 1,
0.2029555, 1.139946, 2.34847, 0, 0.6235294, 1, 1,
0.2034678, -0.5955971, 4.020705, 0, 0.6156863, 1, 1,
0.2037605, -0.2312285, 1.16916, 0, 0.6117647, 1, 1,
0.2039304, 0.8438258, 0.3238454, 0, 0.6039216, 1, 1,
0.2067419, -0.7039912, 1.903129, 0, 0.5960785, 1, 1,
0.211396, 0.5690891, 0.1532164, 0, 0.5921569, 1, 1,
0.2128458, 0.2923015, 0.2050506, 0, 0.5843138, 1, 1,
0.2132684, 0.4298527, -0.4095522, 0, 0.5803922, 1, 1,
0.220475, 0.003513512, 1.347517, 0, 0.572549, 1, 1,
0.2228167, 0.8318201, 2.197213, 0, 0.5686275, 1, 1,
0.2243521, 0.303827, -0.6517087, 0, 0.5607843, 1, 1,
0.2248143, -1.265561, 1.850827, 0, 0.5568628, 1, 1,
0.2269036, -0.1061444, 1.221136, 0, 0.5490196, 1, 1,
0.2279768, -0.8960018, 2.25352, 0, 0.5450981, 1, 1,
0.2336504, 0.04993993, 0.8924706, 0, 0.5372549, 1, 1,
0.2351269, -0.4732681, 3.194373, 0, 0.5333334, 1, 1,
0.2367869, 0.6236102, 0.0485437, 0, 0.5254902, 1, 1,
0.240671, -0.6687008, 2.096284, 0, 0.5215687, 1, 1,
0.240815, 0.5620541, -0.7617753, 0, 0.5137255, 1, 1,
0.240817, -0.5579255, 2.792762, 0, 0.509804, 1, 1,
0.2423704, 0.6245621, 1.605986, 0, 0.5019608, 1, 1,
0.2454629, -1.460992, 3.194132, 0, 0.4941176, 1, 1,
0.2463749, 0.1257877, -0.1701129, 0, 0.4901961, 1, 1,
0.2470036, 0.9096687, -1.562183, 0, 0.4823529, 1, 1,
0.2470441, -0.8541481, 3.10054, 0, 0.4784314, 1, 1,
0.2482585, -0.1068427, 1.05521, 0, 0.4705882, 1, 1,
0.250516, -0.7427982, 2.414342, 0, 0.4666667, 1, 1,
0.2516483, -1.81935, 2.419343, 0, 0.4588235, 1, 1,
0.2517197, 3.009528, -0.7478601, 0, 0.454902, 1, 1,
0.2518401, 0.5453641, 1.383245, 0, 0.4470588, 1, 1,
0.2522534, 0.7317786, 0.3856247, 0, 0.4431373, 1, 1,
0.2530949, 1.576657, -0.4801393, 0, 0.4352941, 1, 1,
0.2532609, 0.5023252, -0.2867574, 0, 0.4313726, 1, 1,
0.2545604, -0.28203, -0.2350073, 0, 0.4235294, 1, 1,
0.2566909, 0.5007226, 2.06647, 0, 0.4196078, 1, 1,
0.2590717, -0.7141297, 3.666957, 0, 0.4117647, 1, 1,
0.2644626, -0.4802188, 3.185307, 0, 0.4078431, 1, 1,
0.2709231, -0.07378194, 0.9731269, 0, 0.4, 1, 1,
0.2728547, 0.3070372, -0.1891352, 0, 0.3921569, 1, 1,
0.2729062, -0.7712091, 1.158598, 0, 0.3882353, 1, 1,
0.2745845, 0.539686, 2.096158, 0, 0.3803922, 1, 1,
0.2816494, -0.2772862, 2.582897, 0, 0.3764706, 1, 1,
0.2823149, -1.582644, 4.595179, 0, 0.3686275, 1, 1,
0.2881896, -0.4295336, 2.839673, 0, 0.3647059, 1, 1,
0.2905699, 0.2638169, 0.3903292, 0, 0.3568628, 1, 1,
0.2912633, -1.264162, 3.954853, 0, 0.3529412, 1, 1,
0.2970863, 0.6745719, 0.6088714, 0, 0.345098, 1, 1,
0.3042091, -0.9703767, 1.737029, 0, 0.3411765, 1, 1,
0.3112848, 1.593127, 1.120068, 0, 0.3333333, 1, 1,
0.3122043, -0.7451313, 1.601076, 0, 0.3294118, 1, 1,
0.3162713, 0.3555607, 0.4397531, 0, 0.3215686, 1, 1,
0.3165164, 0.6563774, 1.550233, 0, 0.3176471, 1, 1,
0.3198141, -1.583806, 2.762527, 0, 0.3098039, 1, 1,
0.3240591, 0.1861599, 0.9263901, 0, 0.3058824, 1, 1,
0.3291101, -0.5649976, 3.851122, 0, 0.2980392, 1, 1,
0.3354944, 0.8173982, -1.42242, 0, 0.2901961, 1, 1,
0.3421615, -0.9091944, 1.360752, 0, 0.2862745, 1, 1,
0.3443194, 2.045526, -0.8260878, 0, 0.2784314, 1, 1,
0.3493317, -0.2635285, 0.6675331, 0, 0.2745098, 1, 1,
0.3502783, 1.726923, 0.0505992, 0, 0.2666667, 1, 1,
0.3515019, 0.2570987, 1.903959, 0, 0.2627451, 1, 1,
0.3552188, -0.1302842, 1.633385, 0, 0.254902, 1, 1,
0.3602478, 0.7709317, 0.1653657, 0, 0.2509804, 1, 1,
0.3630675, -0.4928579, 1.893038, 0, 0.2431373, 1, 1,
0.3692887, 0.5050255, 1.141156, 0, 0.2392157, 1, 1,
0.3767157, 0.7479537, 1.514424, 0, 0.2313726, 1, 1,
0.3801188, -0.435027, 1.182271, 0, 0.227451, 1, 1,
0.3851377, 0.6055982, 0.2351911, 0, 0.2196078, 1, 1,
0.3873539, -0.6961964, 3.490401, 0, 0.2156863, 1, 1,
0.3914008, 1.16953, -0.7964974, 0, 0.2078431, 1, 1,
0.3982898, -0.3977294, 2.390357, 0, 0.2039216, 1, 1,
0.3991192, 0.5059065, 0.5766571, 0, 0.1960784, 1, 1,
0.4008149, -2.024953, 3.99123, 0, 0.1882353, 1, 1,
0.4018947, -1.406122, 1.887218, 0, 0.1843137, 1, 1,
0.4041962, -0.6110815, 1.718554, 0, 0.1764706, 1, 1,
0.4049056, 1.145049, 1.677575, 0, 0.172549, 1, 1,
0.4058228, 1.235287, -0.3787837, 0, 0.1647059, 1, 1,
0.4107805, -0.3353015, 2.604326, 0, 0.1607843, 1, 1,
0.4171619, 0.571344, 0.596398, 0, 0.1529412, 1, 1,
0.4190806, -1.250272, 2.499036, 0, 0.1490196, 1, 1,
0.4208933, -1.179734, 4.076352, 0, 0.1411765, 1, 1,
0.4217494, -0.1136766, 2.067318, 0, 0.1372549, 1, 1,
0.423474, 0.987052, 1.433186, 0, 0.1294118, 1, 1,
0.4241596, -0.9137409, 3.416022, 0, 0.1254902, 1, 1,
0.424922, 1.195367, 1.873725, 0, 0.1176471, 1, 1,
0.429552, 0.762895, -1.810489, 0, 0.1137255, 1, 1,
0.4309774, 0.8423166, 0.6814973, 0, 0.1058824, 1, 1,
0.4316677, 0.8356918, 0.673746, 0, 0.09803922, 1, 1,
0.4360955, 0.909646, 1.324446, 0, 0.09411765, 1, 1,
0.4415412, -1.097775, 2.460823, 0, 0.08627451, 1, 1,
0.4421143, 0.1726068, 0.2775396, 0, 0.08235294, 1, 1,
0.4438654, -0.6700433, 1.806396, 0, 0.07450981, 1, 1,
0.4441946, -1.695067, 3.012568, 0, 0.07058824, 1, 1,
0.4474031, 0.8454311, 1.83576, 0, 0.0627451, 1, 1,
0.4510852, 0.8871091, -0.5123639, 0, 0.05882353, 1, 1,
0.4517453, 2.291256, 0.5499998, 0, 0.05098039, 1, 1,
0.4521429, 0.6406092, 0.1419498, 0, 0.04705882, 1, 1,
0.4524825, -1.002991, 3.98115, 0, 0.03921569, 1, 1,
0.4548445, -0.3939469, 2.005209, 0, 0.03529412, 1, 1,
0.4555019, -0.6173447, 3.200619, 0, 0.02745098, 1, 1,
0.4575297, -0.4572501, 3.317358, 0, 0.02352941, 1, 1,
0.4600741, -0.1108066, 3.349988, 0, 0.01568628, 1, 1,
0.460759, 0.5469723, 0.4972754, 0, 0.01176471, 1, 1,
0.4641111, -2.037521, 5.506274, 0, 0.003921569, 1, 1,
0.4666729, 1.767047, 0.3036776, 0.003921569, 0, 1, 1,
0.4669564, 1.124059, -0.248176, 0.007843138, 0, 1, 1,
0.469246, -0.5528628, 2.084905, 0.01568628, 0, 1, 1,
0.4709812, -0.05694407, 0.2510809, 0.01960784, 0, 1, 1,
0.4790921, 1.140529, 2.196146, 0.02745098, 0, 1, 1,
0.4791767, -0.9791955, 4.036434, 0.03137255, 0, 1, 1,
0.4811383, 0.2197682, 1.570635, 0.03921569, 0, 1, 1,
0.4936442, 0.7879279, -0.2810518, 0.04313726, 0, 1, 1,
0.4978065, -0.1506258, 2.991385, 0.05098039, 0, 1, 1,
0.4983509, -0.3054015, 1.430691, 0.05490196, 0, 1, 1,
0.5057492, -2.166597, 2.304715, 0.0627451, 0, 1, 1,
0.5078371, -1.687095, 4.690609, 0.06666667, 0, 1, 1,
0.5118588, 1.220893, -0.7493078, 0.07450981, 0, 1, 1,
0.5145826, -0.271633, 1.01912, 0.07843138, 0, 1, 1,
0.52512, -0.6041637, 2.479431, 0.08627451, 0, 1, 1,
0.5251486, 0.4401422, 0.3705343, 0.09019608, 0, 1, 1,
0.5255064, -0.1722175, 1.671089, 0.09803922, 0, 1, 1,
0.5268359, -0.2882216, 2.802123, 0.1058824, 0, 1, 1,
0.5272295, 0.1009603, 2.680707, 0.1098039, 0, 1, 1,
0.5336605, 0.252608, 2.003316, 0.1176471, 0, 1, 1,
0.5401354, 0.8012732, -0.04815688, 0.1215686, 0, 1, 1,
0.5462478, 1.346125, 0.1107776, 0.1294118, 0, 1, 1,
0.5483375, 0.5742819, -0.2151056, 0.1333333, 0, 1, 1,
0.5486745, -0.6078563, 2.120958, 0.1411765, 0, 1, 1,
0.5489705, 1.008298, 1.121478, 0.145098, 0, 1, 1,
0.5504066, -0.6352381, 0.9110316, 0.1529412, 0, 1, 1,
0.5526135, -2.585799, 2.421133, 0.1568628, 0, 1, 1,
0.5532342, -0.5474746, 2.971886, 0.1647059, 0, 1, 1,
0.5568773, 1.301456, -0.8245459, 0.1686275, 0, 1, 1,
0.5594239, -0.4139894, 2.003882, 0.1764706, 0, 1, 1,
0.563859, -0.2779233, 2.333523, 0.1803922, 0, 1, 1,
0.5646113, -0.9568786, 4.219303, 0.1882353, 0, 1, 1,
0.5764542, 0.2306631, 1.804241, 0.1921569, 0, 1, 1,
0.5783163, 0.506957, 0.4722839, 0.2, 0, 1, 1,
0.5803036, -0.9151166, 0.9628428, 0.2078431, 0, 1, 1,
0.5876869, -0.6982065, 1.749712, 0.2117647, 0, 1, 1,
0.5900754, 1.074971, 1.356596, 0.2196078, 0, 1, 1,
0.590822, 0.1975945, 0.5526286, 0.2235294, 0, 1, 1,
0.5925689, 0.9806578, -2.537155, 0.2313726, 0, 1, 1,
0.6003818, 1.568279, -0.04840293, 0.2352941, 0, 1, 1,
0.6017835, -2.221722, 2.351631, 0.2431373, 0, 1, 1,
0.6029002, 1.372278, 2.567671, 0.2470588, 0, 1, 1,
0.60489, 0.1232909, 1.673117, 0.254902, 0, 1, 1,
0.6067248, 0.3003587, 1.63425, 0.2588235, 0, 1, 1,
0.609983, 2.1912, -0.8355451, 0.2666667, 0, 1, 1,
0.6129879, 1.915558, 0.3851271, 0.2705882, 0, 1, 1,
0.6146349, -1.864555, 1.897136, 0.2784314, 0, 1, 1,
0.61494, 0.3389014, 2.320514, 0.282353, 0, 1, 1,
0.6156536, -0.1795165, 2.593118, 0.2901961, 0, 1, 1,
0.61607, 1.034692, 0.1667325, 0.2941177, 0, 1, 1,
0.6169037, 1.07779, 1.131228, 0.3019608, 0, 1, 1,
0.6169509, 1.215064, 0.04156504, 0.3098039, 0, 1, 1,
0.6235573, 1.069983, -0.4386413, 0.3137255, 0, 1, 1,
0.6245366, 0.3490455, 0.7889184, 0.3215686, 0, 1, 1,
0.6302633, 1.660489, 1.885957, 0.3254902, 0, 1, 1,
0.6336169, 0.6322163, -0.3021153, 0.3333333, 0, 1, 1,
0.6344809, -0.3179657, 1.614088, 0.3372549, 0, 1, 1,
0.6352994, 1.771634, -0.1347379, 0.345098, 0, 1, 1,
0.6394392, -0.5734961, 2.479413, 0.3490196, 0, 1, 1,
0.6463283, 0.8991506, 1.294769, 0.3568628, 0, 1, 1,
0.6476203, 0.3140189, 0.348083, 0.3607843, 0, 1, 1,
0.6498737, -1.991853, 2.619359, 0.3686275, 0, 1, 1,
0.6516322, 0.9452258, 1.371437, 0.372549, 0, 1, 1,
0.654272, -0.6825639, 3.495639, 0.3803922, 0, 1, 1,
0.6615109, -0.7173166, 1.79441, 0.3843137, 0, 1, 1,
0.6621329, -0.1732517, 1.754845, 0.3921569, 0, 1, 1,
0.6629449, -0.2837322, 2.796487, 0.3960784, 0, 1, 1,
0.6641431, 0.1181377, 0.5071306, 0.4039216, 0, 1, 1,
0.6643097, 2.401752, -0.1939386, 0.4117647, 0, 1, 1,
0.6644872, -0.4450863, 4.365767, 0.4156863, 0, 1, 1,
0.6689597, -0.1068342, 0.5062751, 0.4235294, 0, 1, 1,
0.6692367, 0.9966167, 1.417161, 0.427451, 0, 1, 1,
0.6707315, -0.1941992, 0.2040682, 0.4352941, 0, 1, 1,
0.6707693, -0.3453111, 3.103724, 0.4392157, 0, 1, 1,
0.6726004, -1.729664, 2.861882, 0.4470588, 0, 1, 1,
0.6764055, -0.5971079, 1.50572, 0.4509804, 0, 1, 1,
0.6766219, -1.28522, 3.619693, 0.4588235, 0, 1, 1,
0.6783472, 0.9268514, 0.6125675, 0.4627451, 0, 1, 1,
0.6794074, 0.6668257, 0.0509427, 0.4705882, 0, 1, 1,
0.6877519, 1.718684, -0.2439255, 0.4745098, 0, 1, 1,
0.6933095, 0.518116, 1.798237, 0.4823529, 0, 1, 1,
0.6953042, 0.485366, 0.8281242, 0.4862745, 0, 1, 1,
0.697721, -1.896038, 2.710697, 0.4941176, 0, 1, 1,
0.703067, 0.3823421, 1.700314, 0.5019608, 0, 1, 1,
0.7039705, -0.6439277, 0.5444322, 0.5058824, 0, 1, 1,
0.7069718, 0.6355993, 0.386736, 0.5137255, 0, 1, 1,
0.7081944, 0.1182774, 2.558309, 0.5176471, 0, 1, 1,
0.7110901, -1.02054, 3.126615, 0.5254902, 0, 1, 1,
0.7139055, -0.2894662, 4.285834, 0.5294118, 0, 1, 1,
0.7196207, -0.3497024, 0.8537085, 0.5372549, 0, 1, 1,
0.7211206, -1.230835, 2.50123, 0.5411765, 0, 1, 1,
0.7254016, 0.7907762, 1.521409, 0.5490196, 0, 1, 1,
0.7305436, 0.2303426, -0.2010656, 0.5529412, 0, 1, 1,
0.7380591, -0.2539625, 1.947762, 0.5607843, 0, 1, 1,
0.7457267, -0.3235045, 1.518862, 0.5647059, 0, 1, 1,
0.749404, -0.7872992, 3.550633, 0.572549, 0, 1, 1,
0.7500324, -0.2694763, 1.979268, 0.5764706, 0, 1, 1,
0.7569002, 0.9309218, -0.2946641, 0.5843138, 0, 1, 1,
0.7575966, -0.07475302, 1.599355, 0.5882353, 0, 1, 1,
0.7587112, -0.9381193, 2.286108, 0.5960785, 0, 1, 1,
0.762113, -0.8318051, 0.6855376, 0.6039216, 0, 1, 1,
0.7647209, 0.5999361, 1.670979, 0.6078432, 0, 1, 1,
0.7660445, -0.10853, 2.054643, 0.6156863, 0, 1, 1,
0.7691301, 0.7965751, 1.359093, 0.6196079, 0, 1, 1,
0.7703294, 0.2658196, -0.3020218, 0.627451, 0, 1, 1,
0.7745556, 1.683136, 0.9583697, 0.6313726, 0, 1, 1,
0.7762365, -0.9308219, 3.251394, 0.6392157, 0, 1, 1,
0.7793209, -0.02180853, 2.279573, 0.6431373, 0, 1, 1,
0.7810258, 1.447001, -1.314557, 0.6509804, 0, 1, 1,
0.7835863, -0.0519973, 1.165147, 0.654902, 0, 1, 1,
0.7863447, -1.942646, 3.393488, 0.6627451, 0, 1, 1,
0.8022366, -0.3669993, 3.127514, 0.6666667, 0, 1, 1,
0.8033515, -0.7916701, 2.559467, 0.6745098, 0, 1, 1,
0.8133313, 1.678152, -0.1179148, 0.6784314, 0, 1, 1,
0.8193235, 0.8802865, 1.283655, 0.6862745, 0, 1, 1,
0.8198434, -0.6401191, 2.569078, 0.6901961, 0, 1, 1,
0.8218021, 0.1046513, 1.127842, 0.6980392, 0, 1, 1,
0.8235471, 0.2021234, 1.62819, 0.7058824, 0, 1, 1,
0.8244199, -1.252489, 1.605292, 0.7098039, 0, 1, 1,
0.8295211, -0.5521886, 2.554683, 0.7176471, 0, 1, 1,
0.8315677, -1.644204, 3.193153, 0.7215686, 0, 1, 1,
0.8344176, 0.9119688, 1.325266, 0.7294118, 0, 1, 1,
0.8432246, -0.126575, 1.500781, 0.7333333, 0, 1, 1,
0.8470426, 0.7120821, 0.6509993, 0.7411765, 0, 1, 1,
0.8507943, 0.01907063, 0.1007515, 0.7450981, 0, 1, 1,
0.8519784, -0.4519663, 1.687237, 0.7529412, 0, 1, 1,
0.8534863, 0.6159519, 1.55712, 0.7568628, 0, 1, 1,
0.8538207, -0.8188158, 3.021133, 0.7647059, 0, 1, 1,
0.858022, 1.234612, -0.3495178, 0.7686275, 0, 1, 1,
0.8625303, -1.239393, 4.385992, 0.7764706, 0, 1, 1,
0.8646279, 1.455727, 0.8076469, 0.7803922, 0, 1, 1,
0.8651916, -0.6989528, 1.317761, 0.7882353, 0, 1, 1,
0.8686934, 0.3822004, 2.152886, 0.7921569, 0, 1, 1,
0.8688374, 0.4173925, 1.529754, 0.8, 0, 1, 1,
0.8729644, -0.9328079, 2.249265, 0.8078431, 0, 1, 1,
0.8761877, 0.8720991, 0.9130617, 0.8117647, 0, 1, 1,
0.8840823, 0.7543857, 2.032426, 0.8196079, 0, 1, 1,
0.8849316, 0.1737508, -0.3627889, 0.8235294, 0, 1, 1,
0.8921881, 0.009010857, 0.1846181, 0.8313726, 0, 1, 1,
0.8939131, -0.7756466, 3.257629, 0.8352941, 0, 1, 1,
0.8942997, 0.338109, 1.450531, 0.8431373, 0, 1, 1,
0.895074, 0.01568495, 1.202633, 0.8470588, 0, 1, 1,
0.9031683, -0.7038854, 2.01606, 0.854902, 0, 1, 1,
0.9032575, 1.258477, 0.1677054, 0.8588235, 0, 1, 1,
0.9050604, 0.365502, -0.0526222, 0.8666667, 0, 1, 1,
0.9060662, -0.8258535, 1.276763, 0.8705882, 0, 1, 1,
0.9088048, 1.283047, 0.1836852, 0.8784314, 0, 1, 1,
0.9107003, 1.111628, -0.2439672, 0.8823529, 0, 1, 1,
0.914319, 1.77203, 1.295449, 0.8901961, 0, 1, 1,
0.918258, 0.8408377, 0.7631865, 0.8941177, 0, 1, 1,
0.9274074, -0.7486131, 2.229559, 0.9019608, 0, 1, 1,
0.950944, 0.5257856, 0.5642399, 0.9098039, 0, 1, 1,
0.9518324, 1.116775, 2.181251, 0.9137255, 0, 1, 1,
0.9539123, -0.02819042, 1.827313, 0.9215686, 0, 1, 1,
0.9565653, 0.695429, 2.601763, 0.9254902, 0, 1, 1,
0.957704, 0.4396423, 2.002504, 0.9333333, 0, 1, 1,
0.957829, 0.7053747, 2.468243, 0.9372549, 0, 1, 1,
0.9643188, -0.3309544, 1.619083, 0.945098, 0, 1, 1,
0.9646881, 0.7292466, 1.637651, 0.9490196, 0, 1, 1,
0.9669719, 1.473383, -0.2398396, 0.9568627, 0, 1, 1,
0.9737117, 0.128579, 1.592422, 0.9607843, 0, 1, 1,
0.9752773, 1.121822, 2.742635, 0.9686275, 0, 1, 1,
0.9784737, -0.2685649, 1.86187, 0.972549, 0, 1, 1,
0.9831936, 0.193259, 1.564665, 0.9803922, 0, 1, 1,
0.9929345, -0.4650381, 1.993097, 0.9843137, 0, 1, 1,
0.9946297, -1.857511, 2.637417, 0.9921569, 0, 1, 1,
0.9997435, -0.464924, 3.197464, 0.9960784, 0, 1, 1,
1.009347, -0.6210054, 4.040618, 1, 0, 0.9960784, 1,
1.015927, -1.310009, 2.396005, 1, 0, 0.9882353, 1,
1.022164, 1.2813, 0.9790187, 1, 0, 0.9843137, 1,
1.025254, -1.231758, 4.66485, 1, 0, 0.9764706, 1,
1.02588, -1.268274, 3.836848, 1, 0, 0.972549, 1,
1.027221, 0.1492442, 0.2201533, 1, 0, 0.9647059, 1,
1.02811, 0.3379908, 1.541181, 1, 0, 0.9607843, 1,
1.028746, -1.322954, 3.866948, 1, 0, 0.9529412, 1,
1.030641, 0.3833776, 0.5406583, 1, 0, 0.9490196, 1,
1.035163, 1.408444, 2.354499, 1, 0, 0.9411765, 1,
1.036685, -0.2519062, 2.878571, 1, 0, 0.9372549, 1,
1.054488, -1.089384, 2.298719, 1, 0, 0.9294118, 1,
1.061141, -0.5332388, 0.148554, 1, 0, 0.9254902, 1,
1.064105, 0.6837237, 1.526238, 1, 0, 0.9176471, 1,
1.06837, -0.5021011, 3.000511, 1, 0, 0.9137255, 1,
1.069393, -0.5162902, 3.274347, 1, 0, 0.9058824, 1,
1.069757, 1.145804, 0.1359636, 1, 0, 0.9019608, 1,
1.073098, -0.3054293, 2.397305, 1, 0, 0.8941177, 1,
1.079527, -0.3424769, 3.373049, 1, 0, 0.8862745, 1,
1.088136, 2.06917, 0.593762, 1, 0, 0.8823529, 1,
1.097857, -1.637755, 1.979904, 1, 0, 0.8745098, 1,
1.100015, -0.7162171, 2.52381, 1, 0, 0.8705882, 1,
1.102102, 0.7875186, 0.2978987, 1, 0, 0.8627451, 1,
1.109503, 0.05464941, 1.547951, 1, 0, 0.8588235, 1,
1.118122, -0.2813385, 2.208155, 1, 0, 0.8509804, 1,
1.129075, 0.6458333, 1.259205, 1, 0, 0.8470588, 1,
1.129393, -0.1896427, 1.131267, 1, 0, 0.8392157, 1,
1.134935, -0.6877003, 3.696105, 1, 0, 0.8352941, 1,
1.136413, -0.7757819, 2.648178, 1, 0, 0.827451, 1,
1.148748, 0.04941647, 1.817462, 1, 0, 0.8235294, 1,
1.150533, -0.7581859, 1.135708, 1, 0, 0.8156863, 1,
1.151691, 2.808623, -1.262885, 1, 0, 0.8117647, 1,
1.152594, -1.480177, 3.10306, 1, 0, 0.8039216, 1,
1.158138, 0.8750921, 0.3316847, 1, 0, 0.7960784, 1,
1.158834, 0.8659555, 1.413753, 1, 0, 0.7921569, 1,
1.160902, 1.33198, 0.3515029, 1, 0, 0.7843137, 1,
1.161789, -1.276969, 2.679904, 1, 0, 0.7803922, 1,
1.162991, 1.002247, 0.5253264, 1, 0, 0.772549, 1,
1.163485, -1.662714, 3.01721, 1, 0, 0.7686275, 1,
1.167263, 0.1125574, -0.2015551, 1, 0, 0.7607843, 1,
1.171541, -1.268902, 2.183294, 1, 0, 0.7568628, 1,
1.177437, -0.5494435, 1.358083, 1, 0, 0.7490196, 1,
1.183897, 0.3241911, 2.715832, 1, 0, 0.7450981, 1,
1.183915, 1.11008, 2.403625, 1, 0, 0.7372549, 1,
1.186795, -0.9199549, 2.580054, 1, 0, 0.7333333, 1,
1.192003, 1.324557, 0.1396922, 1, 0, 0.7254902, 1,
1.202847, -0.9939811, 2.166385, 1, 0, 0.7215686, 1,
1.210027, 0.6130108, -0.3079413, 1, 0, 0.7137255, 1,
1.210102, 0.515915, 0.1109805, 1, 0, 0.7098039, 1,
1.213153, 0.5373357, -0.5497048, 1, 0, 0.7019608, 1,
1.218043, -0.07934678, 0.7351421, 1, 0, 0.6941177, 1,
1.22071, 0.2204078, 0.3513064, 1, 0, 0.6901961, 1,
1.222968, 0.5217183, 1.121258, 1, 0, 0.682353, 1,
1.230621, 0.6931267, 1.353474, 1, 0, 0.6784314, 1,
1.238762, 0.4727823, 1.023644, 1, 0, 0.6705883, 1,
1.241918, -1.745423, 3.054326, 1, 0, 0.6666667, 1,
1.252065, -0.2176073, 1.380798, 1, 0, 0.6588235, 1,
1.269143, -0.4773787, 2.09847, 1, 0, 0.654902, 1,
1.269679, -0.2467482, 0.5623205, 1, 0, 0.6470588, 1,
1.271565, 1.71807, 0.5855836, 1, 0, 0.6431373, 1,
1.28181, -0.5527099, 1.367145, 1, 0, 0.6352941, 1,
1.283073, 0.9548708, 0.3644443, 1, 0, 0.6313726, 1,
1.283286, 0.7841817, -0.4728262, 1, 0, 0.6235294, 1,
1.283445, 0.5614358, 0.7770886, 1, 0, 0.6196079, 1,
1.291931, -0.3539545, 1.358197, 1, 0, 0.6117647, 1,
1.295064, 0.1518537, 3.143546, 1, 0, 0.6078432, 1,
1.296786, 2.312567, 0.02049646, 1, 0, 0.6, 1,
1.305861, 0.4818175, -0.05898796, 1, 0, 0.5921569, 1,
1.317125, -0.6136361, 0.8442615, 1, 0, 0.5882353, 1,
1.319325, 1.196301, -0.09881689, 1, 0, 0.5803922, 1,
1.335379, 0.3823324, 0.8147775, 1, 0, 0.5764706, 1,
1.344097, -0.7407402, 2.211453, 1, 0, 0.5686275, 1,
1.344125, -1.61266, 1.969158, 1, 0, 0.5647059, 1,
1.354081, 0.260018, 0.9667362, 1, 0, 0.5568628, 1,
1.361805, -0.9528609, -0.2137323, 1, 0, 0.5529412, 1,
1.36403, -0.4024985, 1.195409, 1, 0, 0.5450981, 1,
1.378575, 0.02542679, 3.249325, 1, 0, 0.5411765, 1,
1.382143, 0.1500104, 2.111813, 1, 0, 0.5333334, 1,
1.385045, 0.7221003, -0.1798495, 1, 0, 0.5294118, 1,
1.39421, 0.06169742, 1.186564, 1, 0, 0.5215687, 1,
1.401178, 1.058718, 3.362354, 1, 0, 0.5176471, 1,
1.409967, 0.8869658, 1.304547, 1, 0, 0.509804, 1,
1.424981, -1.565926, 2.972248, 1, 0, 0.5058824, 1,
1.428803, 0.1912146, 0.1104558, 1, 0, 0.4980392, 1,
1.445025, -0.2483165, 1.542976, 1, 0, 0.4901961, 1,
1.449948, 0.6195598, 1.229292, 1, 0, 0.4862745, 1,
1.454179, -0.336794, 2.855075, 1, 0, 0.4784314, 1,
1.460071, -0.1293797, 2.016654, 1, 0, 0.4745098, 1,
1.463138, 0.7437537, 1.132621, 1, 0, 0.4666667, 1,
1.475043, 0.5561399, 1.994668, 1, 0, 0.4627451, 1,
1.483199, -2.074663, 3.040998, 1, 0, 0.454902, 1,
1.48733, 0.3020094, 2.280663, 1, 0, 0.4509804, 1,
1.488078, 0.7280085, 2.277778, 1, 0, 0.4431373, 1,
1.488972, -0.4022617, 1.407254, 1, 0, 0.4392157, 1,
1.490324, -2.440943, 1.977403, 1, 0, 0.4313726, 1,
1.502121, 0.1220363, 1.825604, 1, 0, 0.427451, 1,
1.512406, 0.6782916, 0.7565116, 1, 0, 0.4196078, 1,
1.51802, 1.331719, -0.3079816, 1, 0, 0.4156863, 1,
1.519767, 0.3789352, 0.5667579, 1, 0, 0.4078431, 1,
1.524353, -0.7397299, 3.1401, 1, 0, 0.4039216, 1,
1.527087, -0.7447048, 2.666422, 1, 0, 0.3960784, 1,
1.535021, -0.4807852, 1.743351, 1, 0, 0.3882353, 1,
1.549893, 1.187589, -0.3118716, 1, 0, 0.3843137, 1,
1.554539, 1.653312, -1.518603, 1, 0, 0.3764706, 1,
1.564255, 0.1137535, 1.58619, 1, 0, 0.372549, 1,
1.575868, -0.07146771, 0.00528283, 1, 0, 0.3647059, 1,
1.581881, 0.7012467, 1.442328, 1, 0, 0.3607843, 1,
1.597112, -0.4618081, 2.214826, 1, 0, 0.3529412, 1,
1.599424, -0.5342903, 1.222699, 1, 0, 0.3490196, 1,
1.603126, -0.03560514, -0.7454084, 1, 0, 0.3411765, 1,
1.603475, 0.03713207, 0.7814934, 1, 0, 0.3372549, 1,
1.606049, -0.4389543, 1.905673, 1, 0, 0.3294118, 1,
1.616499, -1.566521, 5.185354, 1, 0, 0.3254902, 1,
1.630127, -0.4642924, 3.057795, 1, 0, 0.3176471, 1,
1.655516, -0.8476666, 3.809116, 1, 0, 0.3137255, 1,
1.69902, 1.062068, 2.264485, 1, 0, 0.3058824, 1,
1.719404, -1.432879, 1.442809, 1, 0, 0.2980392, 1,
1.722434, 0.1876279, -0.5916545, 1, 0, 0.2941177, 1,
1.732878, -0.2968927, 2.50353, 1, 0, 0.2862745, 1,
1.735243, 2.701581, 0.9698185, 1, 0, 0.282353, 1,
1.735737, -0.2913895, 0.5290687, 1, 0, 0.2745098, 1,
1.754192, 1.874407, 0.8167083, 1, 0, 0.2705882, 1,
1.756225, -0.3916174, 1.887947, 1, 0, 0.2627451, 1,
1.759935, 1.05248, 0.8818355, 1, 0, 0.2588235, 1,
1.763689, -0.5073279, 1.760901, 1, 0, 0.2509804, 1,
1.763812, 0.1259352, 1.999856, 1, 0, 0.2470588, 1,
1.765045, 1.353717, 1.692489, 1, 0, 0.2392157, 1,
1.772952, 0.9113188, 2.5455, 1, 0, 0.2352941, 1,
1.781507, 1.028045, 2.076818, 1, 0, 0.227451, 1,
1.781639, 0.0329087, 1.257999, 1, 0, 0.2235294, 1,
1.807274, -0.9917261, 3.306747, 1, 0, 0.2156863, 1,
1.866858, 0.08336887, 1.815256, 1, 0, 0.2117647, 1,
1.869386, -0.7889367, 0.476157, 1, 0, 0.2039216, 1,
1.887543, -0.4691596, 2.22932, 1, 0, 0.1960784, 1,
1.887717, 1.039513, 1.356902, 1, 0, 0.1921569, 1,
1.924094, -0.9101655, 2.126156, 1, 0, 0.1843137, 1,
1.949926, -0.6315795, 1.545474, 1, 0, 0.1803922, 1,
1.953279, 0.8055379, 1.817449, 1, 0, 0.172549, 1,
2.065028, -0.6676897, 2.261253, 1, 0, 0.1686275, 1,
2.119127, -0.04630449, 1.804637, 1, 0, 0.1607843, 1,
2.120713, -0.3376842, 2.54933, 1, 0, 0.1568628, 1,
2.126064, 3.329885, 1.921147, 1, 0, 0.1490196, 1,
2.143951, 0.0329027, 3.422418, 1, 0, 0.145098, 1,
2.203332, 0.3982469, 0.9807457, 1, 0, 0.1372549, 1,
2.207681, 0.3376461, 3.281951, 1, 0, 0.1333333, 1,
2.226359, -1.486193, 0.1439959, 1, 0, 0.1254902, 1,
2.231723, 1.070951, 1.845302, 1, 0, 0.1215686, 1,
2.242799, 0.6133361, -0.1479819, 1, 0, 0.1137255, 1,
2.245155, -1.939738, 2.051148, 1, 0, 0.1098039, 1,
2.327188, 1.556829, 1.254021, 1, 0, 0.1019608, 1,
2.342936, -0.5321085, 1.010144, 1, 0, 0.09411765, 1,
2.345162, 0.4794355, 2.384733, 1, 0, 0.09019608, 1,
2.361283, -0.6948759, 1.776028, 1, 0, 0.08235294, 1,
2.382337, -1.035411, -0.2573937, 1, 0, 0.07843138, 1,
2.392611, -1.134456, 3.403356, 1, 0, 0.07058824, 1,
2.435543, -1.414708, 1.299429, 1, 0, 0.06666667, 1,
2.551502, -1.30224, 2.234145, 1, 0, 0.05882353, 1,
2.565892, -0.7242348, 3.388922, 1, 0, 0.05490196, 1,
2.659011, -1.016481, 2.006265, 1, 0, 0.04705882, 1,
2.712652, 1.273319, 1.784089, 1, 0, 0.04313726, 1,
2.747221, 0.4763103, 2.118071, 1, 0, 0.03529412, 1,
2.848177, 0.5331629, 1.001123, 1, 0, 0.03137255, 1,
2.971882, 1.127237, 1.136524, 1, 0, 0.02352941, 1,
2.995737, 0.2519558, 1.367882, 1, 0, 0.01960784, 1,
3.231359, -0.9772102, 3.402601, 1, 0, 0.01176471, 1,
3.278326, -1.278826, 2.447981, 1, 0, 0.007843138, 1
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
0.1068269, -4.060641, -7.987314, 0, -0.5, 0.5, 0.5,
0.1068269, -4.060641, -7.987314, 1, -0.5, 0.5, 0.5,
0.1068269, -4.060641, -7.987314, 1, 1.5, 0.5, 0.5,
0.1068269, -4.060641, -7.987314, 0, 1.5, 0.5, 0.5
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
-4.13981, 0.17019, -7.987314, 0, -0.5, 0.5, 0.5,
-4.13981, 0.17019, -7.987314, 1, -0.5, 0.5, 0.5,
-4.13981, 0.17019, -7.987314, 1, 1.5, 0.5, 0.5,
-4.13981, 0.17019, -7.987314, 0, 1.5, 0.5, 0.5
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
-4.13981, -4.060641, -0.262682, 0, -0.5, 0.5, 0.5,
-4.13981, -4.060641, -0.262682, 1, -0.5, 0.5, 0.5,
-4.13981, -4.060641, -0.262682, 1, 1.5, 0.5, 0.5,
-4.13981, -4.060641, -0.262682, 0, 1.5, 0.5, 0.5
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
-3, -3.084296, -6.204707,
3, -3.084296, -6.204707,
-3, -3.084296, -6.204707,
-3, -3.24702, -6.501808,
-2, -3.084296, -6.204707,
-2, -3.24702, -6.501808,
-1, -3.084296, -6.204707,
-1, -3.24702, -6.501808,
0, -3.084296, -6.204707,
0, -3.24702, -6.501808,
1, -3.084296, -6.204707,
1, -3.24702, -6.501808,
2, -3.084296, -6.204707,
2, -3.24702, -6.501808,
3, -3.084296, -6.204707,
3, -3.24702, -6.501808
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
-3, -3.572468, -7.096011, 0, -0.5, 0.5, 0.5,
-3, -3.572468, -7.096011, 1, -0.5, 0.5, 0.5,
-3, -3.572468, -7.096011, 1, 1.5, 0.5, 0.5,
-3, -3.572468, -7.096011, 0, 1.5, 0.5, 0.5,
-2, -3.572468, -7.096011, 0, -0.5, 0.5, 0.5,
-2, -3.572468, -7.096011, 1, -0.5, 0.5, 0.5,
-2, -3.572468, -7.096011, 1, 1.5, 0.5, 0.5,
-2, -3.572468, -7.096011, 0, 1.5, 0.5, 0.5,
-1, -3.572468, -7.096011, 0, -0.5, 0.5, 0.5,
-1, -3.572468, -7.096011, 1, -0.5, 0.5, 0.5,
-1, -3.572468, -7.096011, 1, 1.5, 0.5, 0.5,
-1, -3.572468, -7.096011, 0, 1.5, 0.5, 0.5,
0, -3.572468, -7.096011, 0, -0.5, 0.5, 0.5,
0, -3.572468, -7.096011, 1, -0.5, 0.5, 0.5,
0, -3.572468, -7.096011, 1, 1.5, 0.5, 0.5,
0, -3.572468, -7.096011, 0, 1.5, 0.5, 0.5,
1, -3.572468, -7.096011, 0, -0.5, 0.5, 0.5,
1, -3.572468, -7.096011, 1, -0.5, 0.5, 0.5,
1, -3.572468, -7.096011, 1, 1.5, 0.5, 0.5,
1, -3.572468, -7.096011, 0, 1.5, 0.5, 0.5,
2, -3.572468, -7.096011, 0, -0.5, 0.5, 0.5,
2, -3.572468, -7.096011, 1, -0.5, 0.5, 0.5,
2, -3.572468, -7.096011, 1, 1.5, 0.5, 0.5,
2, -3.572468, -7.096011, 0, 1.5, 0.5, 0.5,
3, -3.572468, -7.096011, 0, -0.5, 0.5, 0.5,
3, -3.572468, -7.096011, 1, -0.5, 0.5, 0.5,
3, -3.572468, -7.096011, 1, 1.5, 0.5, 0.5,
3, -3.572468, -7.096011, 0, 1.5, 0.5, 0.5
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
-3.159817, -2, -6.204707,
-3.159817, 3, -6.204707,
-3.159817, -2, -6.204707,
-3.323149, -2, -6.501808,
-3.159817, -1, -6.204707,
-3.323149, -1, -6.501808,
-3.159817, 0, -6.204707,
-3.323149, 0, -6.501808,
-3.159817, 1, -6.204707,
-3.323149, 1, -6.501808,
-3.159817, 2, -6.204707,
-3.323149, 2, -6.501808,
-3.159817, 3, -6.204707,
-3.323149, 3, -6.501808
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
-3.649813, -2, -7.096011, 0, -0.5, 0.5, 0.5,
-3.649813, -2, -7.096011, 1, -0.5, 0.5, 0.5,
-3.649813, -2, -7.096011, 1, 1.5, 0.5, 0.5,
-3.649813, -2, -7.096011, 0, 1.5, 0.5, 0.5,
-3.649813, -1, -7.096011, 0, -0.5, 0.5, 0.5,
-3.649813, -1, -7.096011, 1, -0.5, 0.5, 0.5,
-3.649813, -1, -7.096011, 1, 1.5, 0.5, 0.5,
-3.649813, -1, -7.096011, 0, 1.5, 0.5, 0.5,
-3.649813, 0, -7.096011, 0, -0.5, 0.5, 0.5,
-3.649813, 0, -7.096011, 1, -0.5, 0.5, 0.5,
-3.649813, 0, -7.096011, 1, 1.5, 0.5, 0.5,
-3.649813, 0, -7.096011, 0, 1.5, 0.5, 0.5,
-3.649813, 1, -7.096011, 0, -0.5, 0.5, 0.5,
-3.649813, 1, -7.096011, 1, -0.5, 0.5, 0.5,
-3.649813, 1, -7.096011, 1, 1.5, 0.5, 0.5,
-3.649813, 1, -7.096011, 0, 1.5, 0.5, 0.5,
-3.649813, 2, -7.096011, 0, -0.5, 0.5, 0.5,
-3.649813, 2, -7.096011, 1, -0.5, 0.5, 0.5,
-3.649813, 2, -7.096011, 1, 1.5, 0.5, 0.5,
-3.649813, 2, -7.096011, 0, 1.5, 0.5, 0.5,
-3.649813, 3, -7.096011, 0, -0.5, 0.5, 0.5,
-3.649813, 3, -7.096011, 1, -0.5, 0.5, 0.5,
-3.649813, 3, -7.096011, 1, 1.5, 0.5, 0.5,
-3.649813, 3, -7.096011, 0, 1.5, 0.5, 0.5
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
-3.159817, -3.084296, -6,
-3.159817, -3.084296, 4,
-3.159817, -3.084296, -6,
-3.323149, -3.24702, -6,
-3.159817, -3.084296, -4,
-3.323149, -3.24702, -4,
-3.159817, -3.084296, -2,
-3.323149, -3.24702, -2,
-3.159817, -3.084296, 0,
-3.323149, -3.24702, 0,
-3.159817, -3.084296, 2,
-3.323149, -3.24702, 2,
-3.159817, -3.084296, 4,
-3.323149, -3.24702, 4
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
"-6",
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
-3.649813, -3.572468, -6, 0, -0.5, 0.5, 0.5,
-3.649813, -3.572468, -6, 1, -0.5, 0.5, 0.5,
-3.649813, -3.572468, -6, 1, 1.5, 0.5, 0.5,
-3.649813, -3.572468, -6, 0, 1.5, 0.5, 0.5,
-3.649813, -3.572468, -4, 0, -0.5, 0.5, 0.5,
-3.649813, -3.572468, -4, 1, -0.5, 0.5, 0.5,
-3.649813, -3.572468, -4, 1, 1.5, 0.5, 0.5,
-3.649813, -3.572468, -4, 0, 1.5, 0.5, 0.5,
-3.649813, -3.572468, -2, 0, -0.5, 0.5, 0.5,
-3.649813, -3.572468, -2, 1, -0.5, 0.5, 0.5,
-3.649813, -3.572468, -2, 1, 1.5, 0.5, 0.5,
-3.649813, -3.572468, -2, 0, 1.5, 0.5, 0.5,
-3.649813, -3.572468, 0, 0, -0.5, 0.5, 0.5,
-3.649813, -3.572468, 0, 1, -0.5, 0.5, 0.5,
-3.649813, -3.572468, 0, 1, 1.5, 0.5, 0.5,
-3.649813, -3.572468, 0, 0, 1.5, 0.5, 0.5,
-3.649813, -3.572468, 2, 0, -0.5, 0.5, 0.5,
-3.649813, -3.572468, 2, 1, -0.5, 0.5, 0.5,
-3.649813, -3.572468, 2, 1, 1.5, 0.5, 0.5,
-3.649813, -3.572468, 2, 0, 1.5, 0.5, 0.5,
-3.649813, -3.572468, 4, 0, -0.5, 0.5, 0.5,
-3.649813, -3.572468, 4, 1, -0.5, 0.5, 0.5,
-3.649813, -3.572468, 4, 1, 1.5, 0.5, 0.5,
-3.649813, -3.572468, 4, 0, 1.5, 0.5, 0.5
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
-3.159817, -3.084296, -6.204707,
-3.159817, 3.424675, -6.204707,
-3.159817, -3.084296, 5.679343,
-3.159817, 3.424675, 5.679343,
-3.159817, -3.084296, -6.204707,
-3.159817, -3.084296, 5.679343,
-3.159817, 3.424675, -6.204707,
-3.159817, 3.424675, 5.679343,
-3.159817, -3.084296, -6.204707,
3.373471, -3.084296, -6.204707,
-3.159817, -3.084296, 5.679343,
3.373471, -3.084296, 5.679343,
-3.159817, 3.424675, -6.204707,
3.373471, 3.424675, -6.204707,
-3.159817, 3.424675, 5.679343,
3.373471, 3.424675, 5.679343,
3.373471, -3.084296, -6.204707,
3.373471, 3.424675, -6.204707,
3.373471, -3.084296, 5.679343,
3.373471, 3.424675, 5.679343,
3.373471, -3.084296, -6.204707,
3.373471, -3.084296, 5.679343,
3.373471, 3.424675, -6.204707,
3.373471, 3.424675, 5.679343
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
var radius = 8.032481;
var distance = 35.73742;
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
mvMatrix.translate( -0.1068269, -0.17019, 0.262682 );
mvMatrix.scale( 1.329327, 1.334293, 0.730801 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.73742);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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
fluazifop-P-butyl<-read.table("fluazifop-P-butyl.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-fluazifop-P-butyl$V2
```

```
## Error in eval(expr, envir, enclos): object 'fluazifop' not found
```

```r
y<-fluazifop-P-butyl$V3
```

```
## Error in eval(expr, envir, enclos): object 'fluazifop' not found
```

```r
z<-fluazifop-P-butyl$V4
```

```
## Error in eval(expr, envir, enclos): object 'fluazifop' not found
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
-3.064672, 0.23364, -0.5543422, 0, 0, 1, 1, 1,
-2.934519, 0.367923, -0.3969098, 1, 0, 0, 1, 1,
-2.672775, 1.675037, -1.607819, 1, 0, 0, 1, 1,
-2.653682, 0.01223979, -1.704067, 1, 0, 0, 1, 1,
-2.640865, -0.2898985, -2.238452, 1, 0, 0, 1, 1,
-2.593281, -0.248791, -2.120864, 1, 0, 0, 1, 1,
-2.551314, 0.3545002, -0.9867114, 0, 0, 0, 1, 1,
-2.504522, 0.1387964, -1.315589, 0, 0, 0, 1, 1,
-2.50263, -0.9898262, -1.742901, 0, 0, 0, 1, 1,
-2.38942, 0.7179947, -2.131382, 0, 0, 0, 1, 1,
-2.385014, 0.8258013, -2.746732, 0, 0, 0, 1, 1,
-2.350486, -0.7916734, -2.153365, 0, 0, 0, 1, 1,
-2.343575, 3.282219, -0.5521984, 0, 0, 0, 1, 1,
-2.341892, 0.2399596, 0.03974962, 1, 1, 1, 1, 1,
-2.31867, 1.221711, 0.07349044, 1, 1, 1, 1, 1,
-2.295958, 1.855976, -0.5431499, 1, 1, 1, 1, 1,
-2.256655, 1.52654, -1.498914, 1, 1, 1, 1, 1,
-2.229489, -0.07631192, -2.195332, 1, 1, 1, 1, 1,
-2.211942, -0.128194, -2.775031, 1, 1, 1, 1, 1,
-2.190115, 1.235632, -0.5809721, 1, 1, 1, 1, 1,
-2.172612, -1.017472, -2.602324, 1, 1, 1, 1, 1,
-2.153814, 0.5986014, -1.669424, 1, 1, 1, 1, 1,
-2.12386, 1.257833, 0.4598382, 1, 1, 1, 1, 1,
-2.109528, 0.1035345, -0.334928, 1, 1, 1, 1, 1,
-2.057216, 0.3770798, -3.728771, 1, 1, 1, 1, 1,
-2.008212, 0.4384397, -0.4362671, 1, 1, 1, 1, 1,
-2.002002, -0.4351055, -2.170755, 1, 1, 1, 1, 1,
-1.990515, 0.3415654, -2.36425, 1, 1, 1, 1, 1,
-1.989058, -1.180817, -3.205671, 0, 0, 1, 1, 1,
-1.980953, -1.767168, -3.003381, 1, 0, 0, 1, 1,
-1.952604, -1.724599, -1.938478, 1, 0, 0, 1, 1,
-1.942243, 0.2855866, -1.227473, 1, 0, 0, 1, 1,
-1.911568, 0.6688348, -0.9095922, 1, 0, 0, 1, 1,
-1.88149, -1.454319, -2.110607, 1, 0, 0, 1, 1,
-1.865814, 0.7838739, -0.1809271, 0, 0, 0, 1, 1,
-1.846807, 1.607405, -0.5889403, 0, 0, 0, 1, 1,
-1.835356, 0.2995201, -0.8479917, 0, 0, 0, 1, 1,
-1.831387, 0.1681496, -1.245372, 0, 0, 0, 1, 1,
-1.831272, -1.956882, -2.317724, 0, 0, 0, 1, 1,
-1.831254, -0.9705242, -1.757737, 0, 0, 0, 1, 1,
-1.823853, 1.142909, -1.798725, 0, 0, 0, 1, 1,
-1.821695, 1.697987, -2.407462, 1, 1, 1, 1, 1,
-1.821477, 1.143377, -1.046022, 1, 1, 1, 1, 1,
-1.807329, 0.3900393, -0.1794983, 1, 1, 1, 1, 1,
-1.793454, 1.515398, -0.4452508, 1, 1, 1, 1, 1,
-1.763807, 0.5110598, -1.966918, 1, 1, 1, 1, 1,
-1.755347, -1.096888, -3.458581, 1, 1, 1, 1, 1,
-1.736866, 2.060543, -0.4926544, 1, 1, 1, 1, 1,
-1.700162, -0.4003723, -2.470016, 1, 1, 1, 1, 1,
-1.684995, 0.7780157, -0.7835266, 1, 1, 1, 1, 1,
-1.682689, 1.26809, -1.405703, 1, 1, 1, 1, 1,
-1.674049, 0.2618254, -1.673673, 1, 1, 1, 1, 1,
-1.658258, 0.4072808, -1.528205, 1, 1, 1, 1, 1,
-1.648391, 2.346854, 1.247883, 1, 1, 1, 1, 1,
-1.646562, 0.3966984, -1.409511, 1, 1, 1, 1, 1,
-1.639835, 0.4882972, 1.035215, 1, 1, 1, 1, 1,
-1.638332, -0.6192376, -2.502401, 0, 0, 1, 1, 1,
-1.618452, -1.141441, -1.13585, 1, 0, 0, 1, 1,
-1.618387, -0.9537115, -2.226643, 1, 0, 0, 1, 1,
-1.574949, 0.9205568, -2.345163, 1, 0, 0, 1, 1,
-1.560193, 0.2288629, -0.02221462, 1, 0, 0, 1, 1,
-1.536673, 1.637397, -0.7288349, 1, 0, 0, 1, 1,
-1.494339, -1.197129, -1.722665, 0, 0, 0, 1, 1,
-1.493089, 1.047295, -0.2155941, 0, 0, 0, 1, 1,
-1.4925, -0.6647212, -1.300189, 0, 0, 0, 1, 1,
-1.492077, -0.01065501, -1.06408, 0, 0, 0, 1, 1,
-1.486019, -0.1157494, 0.07233344, 0, 0, 0, 1, 1,
-1.473808, 0.2467846, -1.228564, 0, 0, 0, 1, 1,
-1.465559, -0.6847204, -2.060552, 0, 0, 0, 1, 1,
-1.44857, -0.1495705, -1.359174, 1, 1, 1, 1, 1,
-1.435714, 0.8204058, -1.955015, 1, 1, 1, 1, 1,
-1.426401, 1.2055, -1.277465, 1, 1, 1, 1, 1,
-1.403502, 0.5779588, -0.5864802, 1, 1, 1, 1, 1,
-1.395404, 0.3363022, -1.34352, 1, 1, 1, 1, 1,
-1.377924, 0.1672273, -0.2203936, 1, 1, 1, 1, 1,
-1.376816, -0.5180832, -1.359927, 1, 1, 1, 1, 1,
-1.37002, 0.4171305, -2.687786, 1, 1, 1, 1, 1,
-1.358964, -0.9558334, -1.922036, 1, 1, 1, 1, 1,
-1.355559, -1.185521, -3.226105, 1, 1, 1, 1, 1,
-1.35406, -1.499659, -5.251734, 1, 1, 1, 1, 1,
-1.350373, 0.6627411, -1.108741, 1, 1, 1, 1, 1,
-1.349176, -0.9356511, -1.308656, 1, 1, 1, 1, 1,
-1.341063, -0.3317419, -3.325695, 1, 1, 1, 1, 1,
-1.336019, -0.1528612, -0.04130695, 1, 1, 1, 1, 1,
-1.335887, 1.310491, 0.2122656, 0, 0, 1, 1, 1,
-1.329537, 0.8564668, -2.043386, 1, 0, 0, 1, 1,
-1.329454, -1.800963, -2.780787, 1, 0, 0, 1, 1,
-1.308277, 2.729644, 0.6086085, 1, 0, 0, 1, 1,
-1.294809, -0.7647395, -3.407842, 1, 0, 0, 1, 1,
-1.292711, 0.950733, -1.418226, 1, 0, 0, 1, 1,
-1.291484, -0.0975595, 0.3415582, 0, 0, 0, 1, 1,
-1.279443, -0.2171791, -2.833784, 0, 0, 0, 1, 1,
-1.244171, -0.9454075, -3.431895, 0, 0, 0, 1, 1,
-1.242706, 0.6935856, -1.552574, 0, 0, 0, 1, 1,
-1.212415, 0.4016787, -2.171246, 0, 0, 0, 1, 1,
-1.209217, -0.6856427, -2.031896, 0, 0, 0, 1, 1,
-1.208791, -0.5898177, -0.4181178, 0, 0, 0, 1, 1,
-1.208566, 0.9971098, -1.536742, 1, 1, 1, 1, 1,
-1.202693, 0.4146574, -0.1528406, 1, 1, 1, 1, 1,
-1.196595, -0.5005541, -1.939595, 1, 1, 1, 1, 1,
-1.192684, -0.5854226, -1.215578, 1, 1, 1, 1, 1,
-1.187003, -0.470353, -0.9190182, 1, 1, 1, 1, 1,
-1.186757, -1.010449, -3.071875, 1, 1, 1, 1, 1,
-1.184299, 1.695174, -2.375488, 1, 1, 1, 1, 1,
-1.183569, -0.1565153, -2.813116, 1, 1, 1, 1, 1,
-1.165114, -1.097045, -5.47548, 1, 1, 1, 1, 1,
-1.159952, 0.8112281, -0.3431488, 1, 1, 1, 1, 1,
-1.155103, 0.3791632, -2.221843, 1, 1, 1, 1, 1,
-1.151399, 0.7778585, -0.6592907, 1, 1, 1, 1, 1,
-1.146593, -0.416091, -2.739829, 1, 1, 1, 1, 1,
-1.142403, -0.2071598, -3.015608, 1, 1, 1, 1, 1,
-1.14223, -0.08550712, -2.798513, 1, 1, 1, 1, 1,
-1.139021, 1.237062, -1.019569, 0, 0, 1, 1, 1,
-1.136472, 0.3274702, -1.617146, 1, 0, 0, 1, 1,
-1.133256, -1.042459, -3.628603, 1, 0, 0, 1, 1,
-1.125487, 0.7140739, -0.02068172, 1, 0, 0, 1, 1,
-1.122607, 0.6917809, -1.477779, 1, 0, 0, 1, 1,
-1.121826, 0.687336, -1.639266, 1, 0, 0, 1, 1,
-1.118098, -0.9735618, -2.810712, 0, 0, 0, 1, 1,
-1.114559, -0.07780206, -1.263635, 0, 0, 0, 1, 1,
-1.108962, -1.479714, -1.73405, 0, 0, 0, 1, 1,
-1.106105, -1.783092, -1.921444, 0, 0, 0, 1, 1,
-1.102896, -1.025625, -0.6311852, 0, 0, 0, 1, 1,
-1.102584, -0.1695788, -3.49408, 0, 0, 0, 1, 1,
-1.096709, -0.3124415, -3.507915, 0, 0, 0, 1, 1,
-1.08932, 0.5344963, -0.9231979, 1, 1, 1, 1, 1,
-1.086031, 0.07435109, -2.832942, 1, 1, 1, 1, 1,
-1.074078, 1.363637, -1.846474, 1, 1, 1, 1, 1,
-1.072387, 0.04125233, -0.9431667, 1, 1, 1, 1, 1,
-1.068826, -0.7552955, -0.1445418, 1, 1, 1, 1, 1,
-1.068366, 0.5195543, -0.7650448, 1, 1, 1, 1, 1,
-1.065138, -0.134544, -2.149118, 1, 1, 1, 1, 1,
-1.064197, 1.128723, -3.040145, 1, 1, 1, 1, 1,
-1.061155, 1.383675, -2.378446, 1, 1, 1, 1, 1,
-1.054403, 1.098812, -0.312325, 1, 1, 1, 1, 1,
-1.051441, 1.067419, 0.02878392, 1, 1, 1, 1, 1,
-1.039525, -0.8905118, -3.331878, 1, 1, 1, 1, 1,
-1.035923, -0.5082147, -1.322071, 1, 1, 1, 1, 1,
-1.034519, -1.64302, -3.883133, 1, 1, 1, 1, 1,
-1.033629, 0.9805446, -0.633573, 1, 1, 1, 1, 1,
-1.032954, -1.630217, -4.535273, 0, 0, 1, 1, 1,
-1.024125, 0.07132044, -0.9697364, 1, 0, 0, 1, 1,
-1.020551, -0.7373818, -2.950493, 1, 0, 0, 1, 1,
-1.016336, -0.4161764, -1.009521, 1, 0, 0, 1, 1,
-1.015176, 0.2128438, -3.922842, 1, 0, 0, 1, 1,
-1.010442, -2.369128, -2.297007, 1, 0, 0, 1, 1,
-1.005672, -0.0129048, -0.09233833, 0, 0, 0, 1, 1,
-0.999706, -0.1429185, -1.950905, 0, 0, 0, 1, 1,
-0.9971756, 0.6923801, 1.439562, 0, 0, 0, 1, 1,
-0.9869006, -1.095462, -1.427636, 0, 0, 0, 1, 1,
-0.9857644, 1.150247, -0.08776924, 0, 0, 0, 1, 1,
-0.9760487, -0.5438778, -1.557318, 0, 0, 0, 1, 1,
-0.9750541, -1.320435, -1.368248, 0, 0, 0, 1, 1,
-0.9660196, 0.5752699, -0.448029, 1, 1, 1, 1, 1,
-0.9603757, 0.651802, 0.5171437, 1, 1, 1, 1, 1,
-0.944805, -1.142011, -1.542304, 1, 1, 1, 1, 1,
-0.9345569, 0.7507346, 0.2024098, 1, 1, 1, 1, 1,
-0.9290655, 0.5210216, -1.715511, 1, 1, 1, 1, 1,
-0.927824, 0.05196041, -1.019968, 1, 1, 1, 1, 1,
-0.924672, 1.48696, 1.078094, 1, 1, 1, 1, 1,
-0.9219491, 0.466412, 0.9659805, 1, 1, 1, 1, 1,
-0.916685, 0.008656946, -3.393153, 1, 1, 1, 1, 1,
-0.9141951, 2.699376, -0.02568395, 1, 1, 1, 1, 1,
-0.9105487, -1.382156, -2.679882, 1, 1, 1, 1, 1,
-0.9100327, 0.5958266, -3.005678, 1, 1, 1, 1, 1,
-0.9066275, -0.5479457, -2.164581, 1, 1, 1, 1, 1,
-0.9026543, 0.7598845, -1.282938, 1, 1, 1, 1, 1,
-0.9005156, 0.03431895, -2.038427, 1, 1, 1, 1, 1,
-0.8971364, 0.8823491, -1.084743, 0, 0, 1, 1, 1,
-0.8933319, -0.2628985, -3.067786, 1, 0, 0, 1, 1,
-0.8932401, -0.1160353, -1.984582, 1, 0, 0, 1, 1,
-0.8930165, 0.3610081, -1.529845, 1, 0, 0, 1, 1,
-0.8860468, -0.0409756, -2.858606, 1, 0, 0, 1, 1,
-0.8852732, -1.652062, -1.747199, 1, 0, 0, 1, 1,
-0.8753477, -0.7327731, 0.8925836, 0, 0, 0, 1, 1,
-0.8736303, -0.4593323, -2.184705, 0, 0, 0, 1, 1,
-0.8665619, 0.4615733, -2.239619, 0, 0, 0, 1, 1,
-0.8583913, -1.3658, -2.198049, 0, 0, 0, 1, 1,
-0.8550351, -0.08238568, -1.106633, 0, 0, 0, 1, 1,
-0.8546227, 0.03223516, -2.892494, 0, 0, 0, 1, 1,
-0.8533381, -0.6008921, -2.081391, 0, 0, 0, 1, 1,
-0.8468913, 3.229311, -0.1268454, 1, 1, 1, 1, 1,
-0.846742, 0.0126383, -1.614227, 1, 1, 1, 1, 1,
-0.8446143, -0.6037406, -3.63666, 1, 1, 1, 1, 1,
-0.8324184, 0.3594246, -1.911141, 1, 1, 1, 1, 1,
-0.8320022, 1.441315, -0.2969293, 1, 1, 1, 1, 1,
-0.8314405, 1.818274, 0.6333363, 1, 1, 1, 1, 1,
-0.8292861, 0.6145533, -1.771917, 1, 1, 1, 1, 1,
-0.8239546, 0.09676813, -1.400607, 1, 1, 1, 1, 1,
-0.8202795, -1.030368, -1.788258, 1, 1, 1, 1, 1,
-0.8184841, 1.313406, -1.301504, 1, 1, 1, 1, 1,
-0.8138496, -0.04429614, -2.191329, 1, 1, 1, 1, 1,
-0.8106632, -1.792796, -3.182436, 1, 1, 1, 1, 1,
-0.8105775, -2.947376, -3.856806, 1, 1, 1, 1, 1,
-0.803555, 0.02527595, -2.452557, 1, 1, 1, 1, 1,
-0.8031396, 0.8933125, -1.786811, 1, 1, 1, 1, 1,
-0.7982622, -2.718832, -3.414907, 0, 0, 1, 1, 1,
-0.7967571, 1.232238, -1.033513, 1, 0, 0, 1, 1,
-0.7896982, 1.353444, -1.349622, 1, 0, 0, 1, 1,
-0.7869976, -0.8601612, -2.427114, 1, 0, 0, 1, 1,
-0.7862405, 0.2432537, -1.142662, 1, 0, 0, 1, 1,
-0.7860898, -1.721812, -3.05332, 1, 0, 0, 1, 1,
-0.779206, -0.1123401, -0.4674661, 0, 0, 0, 1, 1,
-0.7780684, -1.317617, -3.249601, 0, 0, 0, 1, 1,
-0.773446, -1.203087, -1.950749, 0, 0, 0, 1, 1,
-0.7726219, 0.1008602, -0.7267725, 0, 0, 0, 1, 1,
-0.7697572, -1.029217, -3.546436, 0, 0, 0, 1, 1,
-0.7673196, -0.2718658, -2.229329, 0, 0, 0, 1, 1,
-0.7636643, -1.285507, -2.496368, 0, 0, 0, 1, 1,
-0.7585118, 1.34697, -2.22777, 1, 1, 1, 1, 1,
-0.757551, -0.3010857, -3.061931, 1, 1, 1, 1, 1,
-0.7571113, -0.2661266, -4.350152, 1, 1, 1, 1, 1,
-0.7559331, 1.399194, -0.8612569, 1, 1, 1, 1, 1,
-0.7558053, -0.6740183, -1.848934, 1, 1, 1, 1, 1,
-0.7552931, -0.1976846, -3.021137, 1, 1, 1, 1, 1,
-0.748173, 0.9869519, 0.5021769, 1, 1, 1, 1, 1,
-0.740877, -1.78697, -1.93149, 1, 1, 1, 1, 1,
-0.7391281, 2.194272, -0.8363685, 1, 1, 1, 1, 1,
-0.7376998, -0.8597897, -1.896009, 1, 1, 1, 1, 1,
-0.7356071, -1.1211, -2.400532, 1, 1, 1, 1, 1,
-0.7354156, 1.660278, -0.1070045, 1, 1, 1, 1, 1,
-0.7290065, -1.760096, -2.503875, 1, 1, 1, 1, 1,
-0.7283353, 0.2063543, -1.698639, 1, 1, 1, 1, 1,
-0.7246788, -1.149808, -4.252361, 1, 1, 1, 1, 1,
-0.7216124, -0.5709891, -3.276454, 0, 0, 1, 1, 1,
-0.7202114, 0.5697455, 0.552501, 1, 0, 0, 1, 1,
-0.7200028, 0.9739184, -1.139981, 1, 0, 0, 1, 1,
-0.7168053, -0.6792369, -3.914633, 1, 0, 0, 1, 1,
-0.7119924, 0.6167089, -1.195058, 1, 0, 0, 1, 1,
-0.7004686, 0.5149033, -0.4900623, 1, 0, 0, 1, 1,
-0.6861141, 0.4459313, -2.048429, 0, 0, 0, 1, 1,
-0.6859763, -0.7576742, -2.997125, 0, 0, 0, 1, 1,
-0.6857007, -0.5856715, -3.094367, 0, 0, 0, 1, 1,
-0.6818596, -2.425071, -2.733241, 0, 0, 0, 1, 1,
-0.6765053, 0.009275022, -1.88981, 0, 0, 0, 1, 1,
-0.6752205, 0.9245635, -1.237558, 0, 0, 0, 1, 1,
-0.6724103, 0.2739998, 0.4304517, 0, 0, 0, 1, 1,
-0.6706588, -0.09222522, -1.827707, 1, 1, 1, 1, 1,
-0.6687921, 0.6466548, -0.4294533, 1, 1, 1, 1, 1,
-0.664435, 0.699065, -1.85031, 1, 1, 1, 1, 1,
-0.6622723, 2.765053, 0.3124229, 1, 1, 1, 1, 1,
-0.65669, -1.01889, -5.329159, 1, 1, 1, 1, 1,
-0.6540347, -1.942688, -4.117835, 1, 1, 1, 1, 1,
-0.6508223, -0.5629928, -4.181685, 1, 1, 1, 1, 1,
-0.6493896, -1.420705, -1.617174, 1, 1, 1, 1, 1,
-0.648487, 0.7452607, -1.232681, 1, 1, 1, 1, 1,
-0.647757, 1.219548, -0.2893313, 1, 1, 1, 1, 1,
-0.6475554, -0.06284558, -2.306236, 1, 1, 1, 1, 1,
-0.6410291, 0.8034411, -0.04033455, 1, 1, 1, 1, 1,
-0.6390218, 1.261691, 0.01082778, 1, 1, 1, 1, 1,
-0.6372878, -1.7824, -3.421743, 1, 1, 1, 1, 1,
-0.6337481, -0.7339399, -1.978291, 1, 1, 1, 1, 1,
-0.6330985, -0.1240484, -1.014335, 0, 0, 1, 1, 1,
-0.6327361, 1.029699, -0.6968743, 1, 0, 0, 1, 1,
-0.629151, -0.5903414, -2.166961, 1, 0, 0, 1, 1,
-0.6283028, 0.5057343, -3.065673, 1, 0, 0, 1, 1,
-0.6255226, -0.6009719, -1.916828, 1, 0, 0, 1, 1,
-0.6250142, -2.154419, -3.533073, 1, 0, 0, 1, 1,
-0.623024, 0.9877822, -0.6362723, 0, 0, 0, 1, 1,
-0.6178565, 0.1750547, -0.8704809, 0, 0, 0, 1, 1,
-0.6166945, -0.8468369, -3.240785, 0, 0, 0, 1, 1,
-0.609444, -0.5791178, -4.023836, 0, 0, 0, 1, 1,
-0.6081062, 1.838811, -1.735214, 0, 0, 0, 1, 1,
-0.6033172, -1.012097, -1.677277, 0, 0, 0, 1, 1,
-0.6018622, 0.6733475, -1.928014, 0, 0, 0, 1, 1,
-0.5990199, 0.02314387, -1.600963, 1, 1, 1, 1, 1,
-0.5933509, -0.3081714, -2.371157, 1, 1, 1, 1, 1,
-0.5845642, -0.450874, -2.388747, 1, 1, 1, 1, 1,
-0.5807707, -0.1092333, -1.341146, 1, 1, 1, 1, 1,
-0.5783684, -0.003386427, -0.5733439, 1, 1, 1, 1, 1,
-0.5731822, -0.7505925, -0.7261959, 1, 1, 1, 1, 1,
-0.5725011, 0.8918675, 0.2282756, 1, 1, 1, 1, 1,
-0.5718687, -0.5502154, -2.190946, 1, 1, 1, 1, 1,
-0.5673301, 1.778649, -0.7103197, 1, 1, 1, 1, 1,
-0.5660099, 0.8344211, 0.5138983, 1, 1, 1, 1, 1,
-0.5539306, -0.4630273, -1.411602, 1, 1, 1, 1, 1,
-0.5530281, 2.164984, 1.471838, 1, 1, 1, 1, 1,
-0.5519851, 0.2693271, -2.690687, 1, 1, 1, 1, 1,
-0.5477543, 1.027306, -0.4448575, 1, 1, 1, 1, 1,
-0.5381482, -0.4634959, -2.724485, 1, 1, 1, 1, 1,
-0.5381223, 1.319417, -2.066485, 0, 0, 1, 1, 1,
-0.5378332, 0.2779297, 0.8001885, 1, 0, 0, 1, 1,
-0.535706, 0.8607486, -0.6053463, 1, 0, 0, 1, 1,
-0.5355088, 0.7667912, -0.2192468, 1, 0, 0, 1, 1,
-0.5333821, -1.185868, -2.418888, 1, 0, 0, 1, 1,
-0.5296516, 1.634248, -0.5183309, 1, 0, 0, 1, 1,
-0.5193655, -0.6465296, -3.458041, 0, 0, 0, 1, 1,
-0.5177567, 0.408992, 0.2364602, 0, 0, 0, 1, 1,
-0.5173731, -0.5123423, -1.303546, 0, 0, 0, 1, 1,
-0.5166751, 0.673008, -2.119068, 0, 0, 0, 1, 1,
-0.5161665, -0.3174784, -2.492911, 0, 0, 0, 1, 1,
-0.5144063, 0.4027035, -1.975836, 0, 0, 0, 1, 1,
-0.5088099, -1.076653, -2.479895, 0, 0, 0, 1, 1,
-0.5084437, -0.3861471, -1.185583, 1, 1, 1, 1, 1,
-0.5041534, 0.1770839, -0.8763103, 1, 1, 1, 1, 1,
-0.5027937, -0.3657256, -2.243625, 1, 1, 1, 1, 1,
-0.5010889, -0.84995, -2.924824, 1, 1, 1, 1, 1,
-0.4993226, -0.8206189, -3.582164, 1, 1, 1, 1, 1,
-0.4989948, -1.302944, -1.602372, 1, 1, 1, 1, 1,
-0.494074, 0.8649918, -0.1702713, 1, 1, 1, 1, 1,
-0.4940638, 0.978304, -1.552685, 1, 1, 1, 1, 1,
-0.4863238, 0.07952096, -1.194667, 1, 1, 1, 1, 1,
-0.479899, -0.2896866, -2.41391, 1, 1, 1, 1, 1,
-0.4741413, -0.1555152, -0.4569414, 1, 1, 1, 1, 1,
-0.4675295, 1.164991, -0.9962301, 1, 1, 1, 1, 1,
-0.4671403, 0.7124007, -1.134003, 1, 1, 1, 1, 1,
-0.4670438, 2.584167, 0.8451824, 1, 1, 1, 1, 1,
-0.463253, 0.7551362, -0.03645961, 1, 1, 1, 1, 1,
-0.4581365, 0.2869957, -2.030752, 0, 0, 1, 1, 1,
-0.4551491, -0.5759215, -1.124598, 1, 0, 0, 1, 1,
-0.4529429, -0.6985179, -1.679332, 1, 0, 0, 1, 1,
-0.4469348, 1.146058, 0.593092, 1, 0, 0, 1, 1,
-0.4433189, -0.3144454, -2.657948, 1, 0, 0, 1, 1,
-0.4432003, 1.314191, 0.6391622, 1, 0, 0, 1, 1,
-0.4420445, 0.7093361, -0.2682685, 0, 0, 0, 1, 1,
-0.4383652, -0.4543985, -1.776913, 0, 0, 0, 1, 1,
-0.4374522, -0.8774877, -2.230205, 0, 0, 0, 1, 1,
-0.4372691, 2.204494, -2.817025, 0, 0, 0, 1, 1,
-0.4343459, 0.0555615, -1.879715, 0, 0, 0, 1, 1,
-0.4332668, -1.500334, -1.713818, 0, 0, 0, 1, 1,
-0.4321132, 0.7562248, 0.176658, 0, 0, 0, 1, 1,
-0.4315319, 0.3285152, -2.205768, 1, 1, 1, 1, 1,
-0.4288813, -0.8998491, -4.112156, 1, 1, 1, 1, 1,
-0.4275996, 1.792226, 0.08919659, 1, 1, 1, 1, 1,
-0.4218484, 0.6205798, -0.5145412, 1, 1, 1, 1, 1,
-0.416679, -0.7295151, -1.691841, 1, 1, 1, 1, 1,
-0.41613, 1.184488, -0.02715339, 1, 1, 1, 1, 1,
-0.413279, 0.316997, -0.6802039, 1, 1, 1, 1, 1,
-0.4117627, 1.974219, -0.2761024, 1, 1, 1, 1, 1,
-0.4089618, 1.264614, 0.8912098, 1, 1, 1, 1, 1,
-0.4058902, 0.5052823, -0.2857398, 1, 1, 1, 1, 1,
-0.4056644, -0.08920892, -1.042009, 1, 1, 1, 1, 1,
-0.4043983, 1.598786, -1.414424, 1, 1, 1, 1, 1,
-0.3964966, 0.4973154, -1.701697, 1, 1, 1, 1, 1,
-0.3951782, 0.5805798, -1.039012, 1, 1, 1, 1, 1,
-0.3935039, 0.895914, -0.7053872, 1, 1, 1, 1, 1,
-0.3929631, 0.6102499, -1.60066, 0, 0, 1, 1, 1,
-0.3888511, -1.789525, -2.604282, 1, 0, 0, 1, 1,
-0.3819075, 0.6627801, -1.424407, 1, 0, 0, 1, 1,
-0.3796886, -0.0253493, -1.771555, 1, 0, 0, 1, 1,
-0.378066, -0.02690419, -1.036879, 1, 0, 0, 1, 1,
-0.3777119, -0.6681722, -3.74704, 1, 0, 0, 1, 1,
-0.3776551, 1.664241, 0.2935743, 0, 0, 0, 1, 1,
-0.377396, -0.2351755, -1.029246, 0, 0, 0, 1, 1,
-0.374888, -0.09557098, -1.045818, 0, 0, 0, 1, 1,
-0.3666877, -0.2457183, -3.384164, 0, 0, 0, 1, 1,
-0.3651634, -0.4326834, -0.8935021, 0, 0, 0, 1, 1,
-0.3651421, 1.990406, -0.5224161, 0, 0, 0, 1, 1,
-0.3646137, -0.530511, -1.359516, 0, 0, 0, 1, 1,
-0.3625645, 0.7328859, -0.9506208, 1, 1, 1, 1, 1,
-0.3604521, -0.3061325, -1.055829, 1, 1, 1, 1, 1,
-0.352085, 1.422016, -1.399953, 1, 1, 1, 1, 1,
-0.3505965, 0.6165527, -0.3569565, 1, 1, 1, 1, 1,
-0.3432084, 0.3813452, 0.5509863, 1, 1, 1, 1, 1,
-0.3406482, 0.6838331, -1.542225, 1, 1, 1, 1, 1,
-0.3272402, 0.5128637, -1.019812, 1, 1, 1, 1, 1,
-0.3250727, 0.7234737, 0.7485299, 1, 1, 1, 1, 1,
-0.3227916, -1.140636, -3.311354, 1, 1, 1, 1, 1,
-0.3196063, -2.433127, -2.040995, 1, 1, 1, 1, 1,
-0.3136135, 0.7516237, 0.6875892, 1, 1, 1, 1, 1,
-0.3103535, -0.03548504, -2.075784, 1, 1, 1, 1, 1,
-0.3101375, 0.8899501, 0.04663866, 1, 1, 1, 1, 1,
-0.3044791, -0.238721, -3.522939, 1, 1, 1, 1, 1,
-0.3038024, 0.543606, -1.844548, 1, 1, 1, 1, 1,
-0.302421, -0.4069239, -2.585025, 0, 0, 1, 1, 1,
-0.3015659, 0.1603762, -0.6606361, 1, 0, 0, 1, 1,
-0.2925383, 0.3899821, -0.9760236, 1, 0, 0, 1, 1,
-0.2917542, 0.4610927, -1.368899, 1, 0, 0, 1, 1,
-0.2912063, -0.5472439, -3.398197, 1, 0, 0, 1, 1,
-0.2899826, -0.1256147, -2.155069, 1, 0, 0, 1, 1,
-0.2854019, 1.129486, -1.504093, 0, 0, 0, 1, 1,
-0.281319, 1.076772, -1.528514, 0, 0, 0, 1, 1,
-0.2809917, -0.3365796, -2.752032, 0, 0, 0, 1, 1,
-0.2802845, -1.692371, -2.71745, 0, 0, 0, 1, 1,
-0.2792401, 0.3656827, -1.805881, 0, 0, 0, 1, 1,
-0.277245, 1.199905, -1.351043, 0, 0, 0, 1, 1,
-0.2770971, 1.043639, -0.2345925, 0, 0, 0, 1, 1,
-0.2756041, 0.1872695, -1.902305, 1, 1, 1, 1, 1,
-0.2655093, 0.6042818, -0.4721392, 1, 1, 1, 1, 1,
-0.2653218, 1.307571, -0.3353569, 1, 1, 1, 1, 1,
-0.2630439, -1.072711, -2.098474, 1, 1, 1, 1, 1,
-0.2626229, -0.9791466, -1.981017, 1, 1, 1, 1, 1,
-0.2614027, 0.2373979, -1.416357, 1, 1, 1, 1, 1,
-0.2600608, 0.3228788, 0.01900426, 1, 1, 1, 1, 1,
-0.2591685, -1.450037, -2.777349, 1, 1, 1, 1, 1,
-0.2583905, 1.102178, -1.835075, 1, 1, 1, 1, 1,
-0.257252, -1.026958, -3.194811, 1, 1, 1, 1, 1,
-0.2535418, 0.4545706, -0.01178262, 1, 1, 1, 1, 1,
-0.2523312, 0.4108055, -1.347999, 1, 1, 1, 1, 1,
-0.2487371, 1.910493, -0.639591, 1, 1, 1, 1, 1,
-0.248676, -0.0009176121, -0.6579189, 1, 1, 1, 1, 1,
-0.2442155, -0.7504632, -2.182659, 1, 1, 1, 1, 1,
-0.2423991, -0.5638936, -2.698282, 0, 0, 1, 1, 1,
-0.2397005, 0.9510158, 0.04659458, 1, 0, 0, 1, 1,
-0.2355497, -0.4987892, -2.331765, 1, 0, 0, 1, 1,
-0.2265956, 0.03146116, -1.552867, 1, 0, 0, 1, 1,
-0.225448, -0.9305784, -2.918736, 1, 0, 0, 1, 1,
-0.224467, -0.1935644, -2.229446, 1, 0, 0, 1, 1,
-0.2196686, 0.3446485, -0.4392584, 0, 0, 0, 1, 1,
-0.2177879, 0.1696489, 0.4710609, 0, 0, 0, 1, 1,
-0.216372, -0.9415691, -1.442528, 0, 0, 0, 1, 1,
-0.2126641, -1.196869, -2.586521, 0, 0, 0, 1, 1,
-0.2051605, -0.4105773, -2.16756, 0, 0, 0, 1, 1,
-0.1999275, -0.6102235, -1.596097, 0, 0, 0, 1, 1,
-0.1915148, -0.5344045, -0.894559, 0, 0, 0, 1, 1,
-0.1837485, 1.651222, -0.6739396, 1, 1, 1, 1, 1,
-0.1814215, 0.9238915, -1.146547, 1, 1, 1, 1, 1,
-0.1808971, -0.6104248, -4.3043, 1, 1, 1, 1, 1,
-0.1808104, 1.092842, -1.570894, 1, 1, 1, 1, 1,
-0.1802136, -1.007831, -4.410167, 1, 1, 1, 1, 1,
-0.1776298, 0.1305445, -0.9871317, 1, 1, 1, 1, 1,
-0.1772042, -0.6625996, -3.465744, 1, 1, 1, 1, 1,
-0.1770863, -0.9658315, -1.731986, 1, 1, 1, 1, 1,
-0.1725641, 0.3199713, -0.3084702, 1, 1, 1, 1, 1,
-0.1692732, -0.1505482, -0.7848829, 1, 1, 1, 1, 1,
-0.1617742, -2.138852, -3.063783, 1, 1, 1, 1, 1,
-0.1607067, -0.8699512, -1.949386, 1, 1, 1, 1, 1,
-0.1600151, 2.49962, -0.41441, 1, 1, 1, 1, 1,
-0.1595237, 0.2668992, -0.7760745, 1, 1, 1, 1, 1,
-0.1586719, -1.063695, -2.69782, 1, 1, 1, 1, 1,
-0.1530269, -0.143065, 0.02425165, 0, 0, 1, 1, 1,
-0.1527288, -0.03361015, -1.790506, 1, 0, 0, 1, 1,
-0.1523831, 1.400868, -0.09552957, 1, 0, 0, 1, 1,
-0.1480797, -1.379809, -3.930945, 1, 0, 0, 1, 1,
-0.1476828, 0.712039, 1.270396, 1, 0, 0, 1, 1,
-0.1457868, -0.3007941, -3.324655, 1, 0, 0, 1, 1,
-0.1379093, -0.1369632, -2.44735, 0, 0, 0, 1, 1,
-0.133055, -1.208711, -3.328779, 0, 0, 0, 1, 1,
-0.1277921, 0.1649576, -1.133226, 0, 0, 0, 1, 1,
-0.1257663, 1.135529, -0.6534971, 0, 0, 0, 1, 1,
-0.1250787, -0.7811864, -4.866211, 0, 0, 0, 1, 1,
-0.1221546, -1.749719, -2.366034, 0, 0, 0, 1, 1,
-0.1212421, 0.7106921, 0.01964001, 0, 0, 0, 1, 1,
-0.1203801, -1.105135, -3.77649, 1, 1, 1, 1, 1,
-0.1193507, 0.3677597, -0.9311256, 1, 1, 1, 1, 1,
-0.1160107, -1.681288, -2.779772, 1, 1, 1, 1, 1,
-0.1149521, -0.1663424, -2.762918, 1, 1, 1, 1, 1,
-0.1146987, -0.6225947, -4.090426, 1, 1, 1, 1, 1,
-0.1138233, 0.8592924, -0.1979477, 1, 1, 1, 1, 1,
-0.1044895, 0.6464385, -0.02796285, 1, 1, 1, 1, 1,
-0.1044296, -1.088004, -1.634743, 1, 1, 1, 1, 1,
-0.1020717, -2.989505, -4.2012, 1, 1, 1, 1, 1,
-0.09998707, -1.257411, -4.524879, 1, 1, 1, 1, 1,
-0.09948733, 0.03480815, -0.8054398, 1, 1, 1, 1, 1,
-0.09786066, 1.677502, 0.1578154, 1, 1, 1, 1, 1,
-0.09703022, -1.872722, -2.347958, 1, 1, 1, 1, 1,
-0.09042912, -0.7516941, -3.426436, 1, 1, 1, 1, 1,
-0.08743989, 0.8148466, 0.8727806, 1, 1, 1, 1, 1,
-0.08438528, 0.6815419, -0.130147, 0, 0, 1, 1, 1,
-0.08282046, -0.6491069, -1.913193, 1, 0, 0, 1, 1,
-0.0782439, -1.189761, -2.317143, 1, 0, 0, 1, 1,
-0.07817173, 0.02892071, -1.564856, 1, 0, 0, 1, 1,
-0.07813313, -0.1595917, -4.365214, 1, 0, 0, 1, 1,
-0.07758406, 1.074794, -0.3271407, 1, 0, 0, 1, 1,
-0.07641345, -2.742484, -1.53284, 0, 0, 0, 1, 1,
-0.07589971, 0.4910809, -0.2943539, 0, 0, 0, 1, 1,
-0.07549927, -0.7980374, -3.760062, 0, 0, 0, 1, 1,
-0.07501941, -0.9114628, -3.260994, 0, 0, 0, 1, 1,
-0.07236733, -0.6312659, -6.031638, 0, 0, 0, 1, 1,
-0.06971044, 0.2500084, -1.176668, 0, 0, 0, 1, 1,
-0.06435838, 0.2148492, 0.7504061, 0, 0, 0, 1, 1,
-0.06175915, 0.8722996, -0.4171339, 1, 1, 1, 1, 1,
-0.06030077, 0.8439918, -0.4701723, 1, 1, 1, 1, 1,
-0.0599011, -0.04461055, -3.260026, 1, 1, 1, 1, 1,
-0.05923258, -0.3873695, -2.99953, 1, 1, 1, 1, 1,
-0.0586221, -1.576407, -3.95219, 1, 1, 1, 1, 1,
-0.05662421, -0.07417318, -3.015846, 1, 1, 1, 1, 1,
-0.05073794, -0.02616376, -1.962432, 1, 1, 1, 1, 1,
-0.04971075, 2.171592, -1.194902, 1, 1, 1, 1, 1,
-0.04546008, -0.1008128, -2.600796, 1, 1, 1, 1, 1,
-0.0441478, -2.088672, -2.695604, 1, 1, 1, 1, 1,
-0.04410372, -0.6981096, -1.754537, 1, 1, 1, 1, 1,
-0.04144912, -1.325964, -3.37852, 1, 1, 1, 1, 1,
-0.03897728, 0.7333389, -0.3204738, 1, 1, 1, 1, 1,
-0.03139406, -0.04436243, -3.464985, 1, 1, 1, 1, 1,
-0.02599476, -0.3762334, -2.49253, 1, 1, 1, 1, 1,
-0.02250587, -0.519348, -3.141439, 0, 0, 1, 1, 1,
-0.02232482, -2.172253, -2.829202, 1, 0, 0, 1, 1,
-0.01581379, -1.785723, -3.701791, 1, 0, 0, 1, 1,
-0.01343481, 0.07450248, -1.168166, 1, 0, 0, 1, 1,
-0.01049454, -0.2059381, -2.899352, 1, 0, 0, 1, 1,
-0.00890916, 0.9304097, -1.887543, 1, 0, 0, 1, 1,
-0.007402428, 0.04277263, 0.3485849, 0, 0, 0, 1, 1,
-0.00249868, -0.3951248, -2.998675, 0, 0, 0, 1, 1,
0.004610017, -1.939669, 4.554732, 0, 0, 0, 1, 1,
0.005700937, -0.5999792, 3.532476, 0, 0, 0, 1, 1,
0.007826866, -0.5495297, 2.549977, 0, 0, 0, 1, 1,
0.008571664, 1.246321, 1.071076, 0, 0, 0, 1, 1,
0.008770035, -0.4679465, 1.899, 0, 0, 0, 1, 1,
0.01481467, -0.5697448, 3.571889, 1, 1, 1, 1, 1,
0.0168668, -0.1262493, 3.160647, 1, 1, 1, 1, 1,
0.01934709, -0.1868492, 3.084802, 1, 1, 1, 1, 1,
0.02179694, 0.53935, 0.2159035, 1, 1, 1, 1, 1,
0.02586065, 2.655579, 1.581128, 1, 1, 1, 1, 1,
0.02627623, -0.418146, 2.981703, 1, 1, 1, 1, 1,
0.02808901, 2.034293, 2.271381, 1, 1, 1, 1, 1,
0.03445135, 0.4331701, 1.103735, 1, 1, 1, 1, 1,
0.03529, -1.071241, 5.313654, 1, 1, 1, 1, 1,
0.03627389, -0.9735177, 2.460211, 1, 1, 1, 1, 1,
0.03769227, 1.153584, 0.3611999, 1, 1, 1, 1, 1,
0.04303098, 1.276311, 0.701316, 1, 1, 1, 1, 1,
0.04705345, 0.6776811, -1.099105, 1, 1, 1, 1, 1,
0.05364546, 0.7751664, 0.7892123, 1, 1, 1, 1, 1,
0.05901486, 1.36432, 0.1432936, 1, 1, 1, 1, 1,
0.06446232, 0.731462, 0.1832073, 0, 0, 1, 1, 1,
0.07224463, 0.2144569, 1.450774, 1, 0, 0, 1, 1,
0.07819615, -1.738685, 3.457306, 1, 0, 0, 1, 1,
0.07872774, -0.5102255, 3.721052, 1, 0, 0, 1, 1,
0.0796498, -0.03923805, 0.0890114, 1, 0, 0, 1, 1,
0.07979096, -0.2140555, 2.763956, 1, 0, 0, 1, 1,
0.08712453, 0.6615943, -0.3639041, 0, 0, 0, 1, 1,
0.09173374, -1.202605, 2.032582, 0, 0, 0, 1, 1,
0.09233242, -0.2513186, 3.07823, 0, 0, 0, 1, 1,
0.09604495, 0.6070024, -0.1586597, 0, 0, 0, 1, 1,
0.1010304, -0.3637839, 3.450016, 0, 0, 0, 1, 1,
0.101556, -1.241405, 3.162388, 0, 0, 0, 1, 1,
0.1025355, -0.007159464, 1.379391, 0, 0, 0, 1, 1,
0.1037207, -1.442008, 2.190615, 1, 1, 1, 1, 1,
0.10492, 0.07657867, 2.878063, 1, 1, 1, 1, 1,
0.1050661, 0.02645432, 2.918453, 1, 1, 1, 1, 1,
0.1127906, 0.1020238, 1.057325, 1, 1, 1, 1, 1,
0.1130485, 1.232204, -0.1423845, 1, 1, 1, 1, 1,
0.1130599, 0.5157402, 0.1669731, 1, 1, 1, 1, 1,
0.1134616, 0.03733809, 0.9294382, 1, 1, 1, 1, 1,
0.1205011, -2.92966, 1.944575, 1, 1, 1, 1, 1,
0.120925, 0.05558911, 0.8327585, 1, 1, 1, 1, 1,
0.1230253, 0.7165969, -0.727278, 1, 1, 1, 1, 1,
0.1245109, 0.4499069, -0.6058099, 1, 1, 1, 1, 1,
0.1269323, -0.3821376, 2.853135, 1, 1, 1, 1, 1,
0.1308192, -2.132904, 4.249605, 1, 1, 1, 1, 1,
0.1342974, -0.5392122, 3.454236, 1, 1, 1, 1, 1,
0.1352381, 0.3829479, -0.3070856, 1, 1, 1, 1, 1,
0.1375557, 0.1262697, 2.346297, 0, 0, 1, 1, 1,
0.1381242, 2.988803, -1.124304, 1, 0, 0, 1, 1,
0.1455603, 0.004680484, 1.921644, 1, 0, 0, 1, 1,
0.1491096, -0.3189961, 2.93326, 1, 0, 0, 1, 1,
0.1531863, 0.06990051, -1.408366, 1, 0, 0, 1, 1,
0.1605376, 0.235589, -1.329643, 1, 0, 0, 1, 1,
0.1624236, 0.507551, 0.7709645, 0, 0, 0, 1, 1,
0.1665567, -1.352869, 2.794937, 0, 0, 0, 1, 1,
0.1669531, 1.682075, 1.016139, 0, 0, 0, 1, 1,
0.1673928, -1.17623, 3.166113, 0, 0, 0, 1, 1,
0.1678917, -0.6952167, 4.129613, 0, 0, 0, 1, 1,
0.1686165, -0.8984707, 4.696309, 0, 0, 0, 1, 1,
0.1732653, 1.146872, 0.9677427, 0, 0, 0, 1, 1,
0.1745217, 0.834058, 0.7680786, 1, 1, 1, 1, 1,
0.1748845, 0.05712785, 1.357697, 1, 1, 1, 1, 1,
0.175305, 1.683771, 0.4570605, 1, 1, 1, 1, 1,
0.1758923, 0.2185829, -0.9815789, 1, 1, 1, 1, 1,
0.1763404, -0.1978285, 3.421056, 1, 1, 1, 1, 1,
0.1767843, 0.5177021, 0.07235329, 1, 1, 1, 1, 1,
0.1796828, -1.30516, 3.44507, 1, 1, 1, 1, 1,
0.1799081, -1.356973, 4.349751, 1, 1, 1, 1, 1,
0.1834881, -2.270048, 3.501902, 1, 1, 1, 1, 1,
0.1850976, 0.3665742, 0.7086248, 1, 1, 1, 1, 1,
0.1887331, 1.29562, 1.404092, 1, 1, 1, 1, 1,
0.1896485, 0.4870288, 1.620045, 1, 1, 1, 1, 1,
0.1927407, -0.6408373, 2.730876, 1, 1, 1, 1, 1,
0.1932784, 0.7824976, -0.5460773, 1, 1, 1, 1, 1,
0.1967606, 0.3305363, -0.07563035, 1, 1, 1, 1, 1,
0.2008787, -1.176045, 3.872857, 0, 0, 1, 1, 1,
0.2025299, -0.4983457, 3.555804, 1, 0, 0, 1, 1,
0.202562, -0.1119341, 4.160459, 1, 0, 0, 1, 1,
0.2029555, 1.139946, 2.34847, 1, 0, 0, 1, 1,
0.2034678, -0.5955971, 4.020705, 1, 0, 0, 1, 1,
0.2037605, -0.2312285, 1.16916, 1, 0, 0, 1, 1,
0.2039304, 0.8438258, 0.3238454, 0, 0, 0, 1, 1,
0.2067419, -0.7039912, 1.903129, 0, 0, 0, 1, 1,
0.211396, 0.5690891, 0.1532164, 0, 0, 0, 1, 1,
0.2128458, 0.2923015, 0.2050506, 0, 0, 0, 1, 1,
0.2132684, 0.4298527, -0.4095522, 0, 0, 0, 1, 1,
0.220475, 0.003513512, 1.347517, 0, 0, 0, 1, 1,
0.2228167, 0.8318201, 2.197213, 0, 0, 0, 1, 1,
0.2243521, 0.303827, -0.6517087, 1, 1, 1, 1, 1,
0.2248143, -1.265561, 1.850827, 1, 1, 1, 1, 1,
0.2269036, -0.1061444, 1.221136, 1, 1, 1, 1, 1,
0.2279768, -0.8960018, 2.25352, 1, 1, 1, 1, 1,
0.2336504, 0.04993993, 0.8924706, 1, 1, 1, 1, 1,
0.2351269, -0.4732681, 3.194373, 1, 1, 1, 1, 1,
0.2367869, 0.6236102, 0.0485437, 1, 1, 1, 1, 1,
0.240671, -0.6687008, 2.096284, 1, 1, 1, 1, 1,
0.240815, 0.5620541, -0.7617753, 1, 1, 1, 1, 1,
0.240817, -0.5579255, 2.792762, 1, 1, 1, 1, 1,
0.2423704, 0.6245621, 1.605986, 1, 1, 1, 1, 1,
0.2454629, -1.460992, 3.194132, 1, 1, 1, 1, 1,
0.2463749, 0.1257877, -0.1701129, 1, 1, 1, 1, 1,
0.2470036, 0.9096687, -1.562183, 1, 1, 1, 1, 1,
0.2470441, -0.8541481, 3.10054, 1, 1, 1, 1, 1,
0.2482585, -0.1068427, 1.05521, 0, 0, 1, 1, 1,
0.250516, -0.7427982, 2.414342, 1, 0, 0, 1, 1,
0.2516483, -1.81935, 2.419343, 1, 0, 0, 1, 1,
0.2517197, 3.009528, -0.7478601, 1, 0, 0, 1, 1,
0.2518401, 0.5453641, 1.383245, 1, 0, 0, 1, 1,
0.2522534, 0.7317786, 0.3856247, 1, 0, 0, 1, 1,
0.2530949, 1.576657, -0.4801393, 0, 0, 0, 1, 1,
0.2532609, 0.5023252, -0.2867574, 0, 0, 0, 1, 1,
0.2545604, -0.28203, -0.2350073, 0, 0, 0, 1, 1,
0.2566909, 0.5007226, 2.06647, 0, 0, 0, 1, 1,
0.2590717, -0.7141297, 3.666957, 0, 0, 0, 1, 1,
0.2644626, -0.4802188, 3.185307, 0, 0, 0, 1, 1,
0.2709231, -0.07378194, 0.9731269, 0, 0, 0, 1, 1,
0.2728547, 0.3070372, -0.1891352, 1, 1, 1, 1, 1,
0.2729062, -0.7712091, 1.158598, 1, 1, 1, 1, 1,
0.2745845, 0.539686, 2.096158, 1, 1, 1, 1, 1,
0.2816494, -0.2772862, 2.582897, 1, 1, 1, 1, 1,
0.2823149, -1.582644, 4.595179, 1, 1, 1, 1, 1,
0.2881896, -0.4295336, 2.839673, 1, 1, 1, 1, 1,
0.2905699, 0.2638169, 0.3903292, 1, 1, 1, 1, 1,
0.2912633, -1.264162, 3.954853, 1, 1, 1, 1, 1,
0.2970863, 0.6745719, 0.6088714, 1, 1, 1, 1, 1,
0.3042091, -0.9703767, 1.737029, 1, 1, 1, 1, 1,
0.3112848, 1.593127, 1.120068, 1, 1, 1, 1, 1,
0.3122043, -0.7451313, 1.601076, 1, 1, 1, 1, 1,
0.3162713, 0.3555607, 0.4397531, 1, 1, 1, 1, 1,
0.3165164, 0.6563774, 1.550233, 1, 1, 1, 1, 1,
0.3198141, -1.583806, 2.762527, 1, 1, 1, 1, 1,
0.3240591, 0.1861599, 0.9263901, 0, 0, 1, 1, 1,
0.3291101, -0.5649976, 3.851122, 1, 0, 0, 1, 1,
0.3354944, 0.8173982, -1.42242, 1, 0, 0, 1, 1,
0.3421615, -0.9091944, 1.360752, 1, 0, 0, 1, 1,
0.3443194, 2.045526, -0.8260878, 1, 0, 0, 1, 1,
0.3493317, -0.2635285, 0.6675331, 1, 0, 0, 1, 1,
0.3502783, 1.726923, 0.0505992, 0, 0, 0, 1, 1,
0.3515019, 0.2570987, 1.903959, 0, 0, 0, 1, 1,
0.3552188, -0.1302842, 1.633385, 0, 0, 0, 1, 1,
0.3602478, 0.7709317, 0.1653657, 0, 0, 0, 1, 1,
0.3630675, -0.4928579, 1.893038, 0, 0, 0, 1, 1,
0.3692887, 0.5050255, 1.141156, 0, 0, 0, 1, 1,
0.3767157, 0.7479537, 1.514424, 0, 0, 0, 1, 1,
0.3801188, -0.435027, 1.182271, 1, 1, 1, 1, 1,
0.3851377, 0.6055982, 0.2351911, 1, 1, 1, 1, 1,
0.3873539, -0.6961964, 3.490401, 1, 1, 1, 1, 1,
0.3914008, 1.16953, -0.7964974, 1, 1, 1, 1, 1,
0.3982898, -0.3977294, 2.390357, 1, 1, 1, 1, 1,
0.3991192, 0.5059065, 0.5766571, 1, 1, 1, 1, 1,
0.4008149, -2.024953, 3.99123, 1, 1, 1, 1, 1,
0.4018947, -1.406122, 1.887218, 1, 1, 1, 1, 1,
0.4041962, -0.6110815, 1.718554, 1, 1, 1, 1, 1,
0.4049056, 1.145049, 1.677575, 1, 1, 1, 1, 1,
0.4058228, 1.235287, -0.3787837, 1, 1, 1, 1, 1,
0.4107805, -0.3353015, 2.604326, 1, 1, 1, 1, 1,
0.4171619, 0.571344, 0.596398, 1, 1, 1, 1, 1,
0.4190806, -1.250272, 2.499036, 1, 1, 1, 1, 1,
0.4208933, -1.179734, 4.076352, 1, 1, 1, 1, 1,
0.4217494, -0.1136766, 2.067318, 0, 0, 1, 1, 1,
0.423474, 0.987052, 1.433186, 1, 0, 0, 1, 1,
0.4241596, -0.9137409, 3.416022, 1, 0, 0, 1, 1,
0.424922, 1.195367, 1.873725, 1, 0, 0, 1, 1,
0.429552, 0.762895, -1.810489, 1, 0, 0, 1, 1,
0.4309774, 0.8423166, 0.6814973, 1, 0, 0, 1, 1,
0.4316677, 0.8356918, 0.673746, 0, 0, 0, 1, 1,
0.4360955, 0.909646, 1.324446, 0, 0, 0, 1, 1,
0.4415412, -1.097775, 2.460823, 0, 0, 0, 1, 1,
0.4421143, 0.1726068, 0.2775396, 0, 0, 0, 1, 1,
0.4438654, -0.6700433, 1.806396, 0, 0, 0, 1, 1,
0.4441946, -1.695067, 3.012568, 0, 0, 0, 1, 1,
0.4474031, 0.8454311, 1.83576, 0, 0, 0, 1, 1,
0.4510852, 0.8871091, -0.5123639, 1, 1, 1, 1, 1,
0.4517453, 2.291256, 0.5499998, 1, 1, 1, 1, 1,
0.4521429, 0.6406092, 0.1419498, 1, 1, 1, 1, 1,
0.4524825, -1.002991, 3.98115, 1, 1, 1, 1, 1,
0.4548445, -0.3939469, 2.005209, 1, 1, 1, 1, 1,
0.4555019, -0.6173447, 3.200619, 1, 1, 1, 1, 1,
0.4575297, -0.4572501, 3.317358, 1, 1, 1, 1, 1,
0.4600741, -0.1108066, 3.349988, 1, 1, 1, 1, 1,
0.460759, 0.5469723, 0.4972754, 1, 1, 1, 1, 1,
0.4641111, -2.037521, 5.506274, 1, 1, 1, 1, 1,
0.4666729, 1.767047, 0.3036776, 1, 1, 1, 1, 1,
0.4669564, 1.124059, -0.248176, 1, 1, 1, 1, 1,
0.469246, -0.5528628, 2.084905, 1, 1, 1, 1, 1,
0.4709812, -0.05694407, 0.2510809, 1, 1, 1, 1, 1,
0.4790921, 1.140529, 2.196146, 1, 1, 1, 1, 1,
0.4791767, -0.9791955, 4.036434, 0, 0, 1, 1, 1,
0.4811383, 0.2197682, 1.570635, 1, 0, 0, 1, 1,
0.4936442, 0.7879279, -0.2810518, 1, 0, 0, 1, 1,
0.4978065, -0.1506258, 2.991385, 1, 0, 0, 1, 1,
0.4983509, -0.3054015, 1.430691, 1, 0, 0, 1, 1,
0.5057492, -2.166597, 2.304715, 1, 0, 0, 1, 1,
0.5078371, -1.687095, 4.690609, 0, 0, 0, 1, 1,
0.5118588, 1.220893, -0.7493078, 0, 0, 0, 1, 1,
0.5145826, -0.271633, 1.01912, 0, 0, 0, 1, 1,
0.52512, -0.6041637, 2.479431, 0, 0, 0, 1, 1,
0.5251486, 0.4401422, 0.3705343, 0, 0, 0, 1, 1,
0.5255064, -0.1722175, 1.671089, 0, 0, 0, 1, 1,
0.5268359, -0.2882216, 2.802123, 0, 0, 0, 1, 1,
0.5272295, 0.1009603, 2.680707, 1, 1, 1, 1, 1,
0.5336605, 0.252608, 2.003316, 1, 1, 1, 1, 1,
0.5401354, 0.8012732, -0.04815688, 1, 1, 1, 1, 1,
0.5462478, 1.346125, 0.1107776, 1, 1, 1, 1, 1,
0.5483375, 0.5742819, -0.2151056, 1, 1, 1, 1, 1,
0.5486745, -0.6078563, 2.120958, 1, 1, 1, 1, 1,
0.5489705, 1.008298, 1.121478, 1, 1, 1, 1, 1,
0.5504066, -0.6352381, 0.9110316, 1, 1, 1, 1, 1,
0.5526135, -2.585799, 2.421133, 1, 1, 1, 1, 1,
0.5532342, -0.5474746, 2.971886, 1, 1, 1, 1, 1,
0.5568773, 1.301456, -0.8245459, 1, 1, 1, 1, 1,
0.5594239, -0.4139894, 2.003882, 1, 1, 1, 1, 1,
0.563859, -0.2779233, 2.333523, 1, 1, 1, 1, 1,
0.5646113, -0.9568786, 4.219303, 1, 1, 1, 1, 1,
0.5764542, 0.2306631, 1.804241, 1, 1, 1, 1, 1,
0.5783163, 0.506957, 0.4722839, 0, 0, 1, 1, 1,
0.5803036, -0.9151166, 0.9628428, 1, 0, 0, 1, 1,
0.5876869, -0.6982065, 1.749712, 1, 0, 0, 1, 1,
0.5900754, 1.074971, 1.356596, 1, 0, 0, 1, 1,
0.590822, 0.1975945, 0.5526286, 1, 0, 0, 1, 1,
0.5925689, 0.9806578, -2.537155, 1, 0, 0, 1, 1,
0.6003818, 1.568279, -0.04840293, 0, 0, 0, 1, 1,
0.6017835, -2.221722, 2.351631, 0, 0, 0, 1, 1,
0.6029002, 1.372278, 2.567671, 0, 0, 0, 1, 1,
0.60489, 0.1232909, 1.673117, 0, 0, 0, 1, 1,
0.6067248, 0.3003587, 1.63425, 0, 0, 0, 1, 1,
0.609983, 2.1912, -0.8355451, 0, 0, 0, 1, 1,
0.6129879, 1.915558, 0.3851271, 0, 0, 0, 1, 1,
0.6146349, -1.864555, 1.897136, 1, 1, 1, 1, 1,
0.61494, 0.3389014, 2.320514, 1, 1, 1, 1, 1,
0.6156536, -0.1795165, 2.593118, 1, 1, 1, 1, 1,
0.61607, 1.034692, 0.1667325, 1, 1, 1, 1, 1,
0.6169037, 1.07779, 1.131228, 1, 1, 1, 1, 1,
0.6169509, 1.215064, 0.04156504, 1, 1, 1, 1, 1,
0.6235573, 1.069983, -0.4386413, 1, 1, 1, 1, 1,
0.6245366, 0.3490455, 0.7889184, 1, 1, 1, 1, 1,
0.6302633, 1.660489, 1.885957, 1, 1, 1, 1, 1,
0.6336169, 0.6322163, -0.3021153, 1, 1, 1, 1, 1,
0.6344809, -0.3179657, 1.614088, 1, 1, 1, 1, 1,
0.6352994, 1.771634, -0.1347379, 1, 1, 1, 1, 1,
0.6394392, -0.5734961, 2.479413, 1, 1, 1, 1, 1,
0.6463283, 0.8991506, 1.294769, 1, 1, 1, 1, 1,
0.6476203, 0.3140189, 0.348083, 1, 1, 1, 1, 1,
0.6498737, -1.991853, 2.619359, 0, 0, 1, 1, 1,
0.6516322, 0.9452258, 1.371437, 1, 0, 0, 1, 1,
0.654272, -0.6825639, 3.495639, 1, 0, 0, 1, 1,
0.6615109, -0.7173166, 1.79441, 1, 0, 0, 1, 1,
0.6621329, -0.1732517, 1.754845, 1, 0, 0, 1, 1,
0.6629449, -0.2837322, 2.796487, 1, 0, 0, 1, 1,
0.6641431, 0.1181377, 0.5071306, 0, 0, 0, 1, 1,
0.6643097, 2.401752, -0.1939386, 0, 0, 0, 1, 1,
0.6644872, -0.4450863, 4.365767, 0, 0, 0, 1, 1,
0.6689597, -0.1068342, 0.5062751, 0, 0, 0, 1, 1,
0.6692367, 0.9966167, 1.417161, 0, 0, 0, 1, 1,
0.6707315, -0.1941992, 0.2040682, 0, 0, 0, 1, 1,
0.6707693, -0.3453111, 3.103724, 0, 0, 0, 1, 1,
0.6726004, -1.729664, 2.861882, 1, 1, 1, 1, 1,
0.6764055, -0.5971079, 1.50572, 1, 1, 1, 1, 1,
0.6766219, -1.28522, 3.619693, 1, 1, 1, 1, 1,
0.6783472, 0.9268514, 0.6125675, 1, 1, 1, 1, 1,
0.6794074, 0.6668257, 0.0509427, 1, 1, 1, 1, 1,
0.6877519, 1.718684, -0.2439255, 1, 1, 1, 1, 1,
0.6933095, 0.518116, 1.798237, 1, 1, 1, 1, 1,
0.6953042, 0.485366, 0.8281242, 1, 1, 1, 1, 1,
0.697721, -1.896038, 2.710697, 1, 1, 1, 1, 1,
0.703067, 0.3823421, 1.700314, 1, 1, 1, 1, 1,
0.7039705, -0.6439277, 0.5444322, 1, 1, 1, 1, 1,
0.7069718, 0.6355993, 0.386736, 1, 1, 1, 1, 1,
0.7081944, 0.1182774, 2.558309, 1, 1, 1, 1, 1,
0.7110901, -1.02054, 3.126615, 1, 1, 1, 1, 1,
0.7139055, -0.2894662, 4.285834, 1, 1, 1, 1, 1,
0.7196207, -0.3497024, 0.8537085, 0, 0, 1, 1, 1,
0.7211206, -1.230835, 2.50123, 1, 0, 0, 1, 1,
0.7254016, 0.7907762, 1.521409, 1, 0, 0, 1, 1,
0.7305436, 0.2303426, -0.2010656, 1, 0, 0, 1, 1,
0.7380591, -0.2539625, 1.947762, 1, 0, 0, 1, 1,
0.7457267, -0.3235045, 1.518862, 1, 0, 0, 1, 1,
0.749404, -0.7872992, 3.550633, 0, 0, 0, 1, 1,
0.7500324, -0.2694763, 1.979268, 0, 0, 0, 1, 1,
0.7569002, 0.9309218, -0.2946641, 0, 0, 0, 1, 1,
0.7575966, -0.07475302, 1.599355, 0, 0, 0, 1, 1,
0.7587112, -0.9381193, 2.286108, 0, 0, 0, 1, 1,
0.762113, -0.8318051, 0.6855376, 0, 0, 0, 1, 1,
0.7647209, 0.5999361, 1.670979, 0, 0, 0, 1, 1,
0.7660445, -0.10853, 2.054643, 1, 1, 1, 1, 1,
0.7691301, 0.7965751, 1.359093, 1, 1, 1, 1, 1,
0.7703294, 0.2658196, -0.3020218, 1, 1, 1, 1, 1,
0.7745556, 1.683136, 0.9583697, 1, 1, 1, 1, 1,
0.7762365, -0.9308219, 3.251394, 1, 1, 1, 1, 1,
0.7793209, -0.02180853, 2.279573, 1, 1, 1, 1, 1,
0.7810258, 1.447001, -1.314557, 1, 1, 1, 1, 1,
0.7835863, -0.0519973, 1.165147, 1, 1, 1, 1, 1,
0.7863447, -1.942646, 3.393488, 1, 1, 1, 1, 1,
0.8022366, -0.3669993, 3.127514, 1, 1, 1, 1, 1,
0.8033515, -0.7916701, 2.559467, 1, 1, 1, 1, 1,
0.8133313, 1.678152, -0.1179148, 1, 1, 1, 1, 1,
0.8193235, 0.8802865, 1.283655, 1, 1, 1, 1, 1,
0.8198434, -0.6401191, 2.569078, 1, 1, 1, 1, 1,
0.8218021, 0.1046513, 1.127842, 1, 1, 1, 1, 1,
0.8235471, 0.2021234, 1.62819, 0, 0, 1, 1, 1,
0.8244199, -1.252489, 1.605292, 1, 0, 0, 1, 1,
0.8295211, -0.5521886, 2.554683, 1, 0, 0, 1, 1,
0.8315677, -1.644204, 3.193153, 1, 0, 0, 1, 1,
0.8344176, 0.9119688, 1.325266, 1, 0, 0, 1, 1,
0.8432246, -0.126575, 1.500781, 1, 0, 0, 1, 1,
0.8470426, 0.7120821, 0.6509993, 0, 0, 0, 1, 1,
0.8507943, 0.01907063, 0.1007515, 0, 0, 0, 1, 1,
0.8519784, -0.4519663, 1.687237, 0, 0, 0, 1, 1,
0.8534863, 0.6159519, 1.55712, 0, 0, 0, 1, 1,
0.8538207, -0.8188158, 3.021133, 0, 0, 0, 1, 1,
0.858022, 1.234612, -0.3495178, 0, 0, 0, 1, 1,
0.8625303, -1.239393, 4.385992, 0, 0, 0, 1, 1,
0.8646279, 1.455727, 0.8076469, 1, 1, 1, 1, 1,
0.8651916, -0.6989528, 1.317761, 1, 1, 1, 1, 1,
0.8686934, 0.3822004, 2.152886, 1, 1, 1, 1, 1,
0.8688374, 0.4173925, 1.529754, 1, 1, 1, 1, 1,
0.8729644, -0.9328079, 2.249265, 1, 1, 1, 1, 1,
0.8761877, 0.8720991, 0.9130617, 1, 1, 1, 1, 1,
0.8840823, 0.7543857, 2.032426, 1, 1, 1, 1, 1,
0.8849316, 0.1737508, -0.3627889, 1, 1, 1, 1, 1,
0.8921881, 0.009010857, 0.1846181, 1, 1, 1, 1, 1,
0.8939131, -0.7756466, 3.257629, 1, 1, 1, 1, 1,
0.8942997, 0.338109, 1.450531, 1, 1, 1, 1, 1,
0.895074, 0.01568495, 1.202633, 1, 1, 1, 1, 1,
0.9031683, -0.7038854, 2.01606, 1, 1, 1, 1, 1,
0.9032575, 1.258477, 0.1677054, 1, 1, 1, 1, 1,
0.9050604, 0.365502, -0.0526222, 1, 1, 1, 1, 1,
0.9060662, -0.8258535, 1.276763, 0, 0, 1, 1, 1,
0.9088048, 1.283047, 0.1836852, 1, 0, 0, 1, 1,
0.9107003, 1.111628, -0.2439672, 1, 0, 0, 1, 1,
0.914319, 1.77203, 1.295449, 1, 0, 0, 1, 1,
0.918258, 0.8408377, 0.7631865, 1, 0, 0, 1, 1,
0.9274074, -0.7486131, 2.229559, 1, 0, 0, 1, 1,
0.950944, 0.5257856, 0.5642399, 0, 0, 0, 1, 1,
0.9518324, 1.116775, 2.181251, 0, 0, 0, 1, 1,
0.9539123, -0.02819042, 1.827313, 0, 0, 0, 1, 1,
0.9565653, 0.695429, 2.601763, 0, 0, 0, 1, 1,
0.957704, 0.4396423, 2.002504, 0, 0, 0, 1, 1,
0.957829, 0.7053747, 2.468243, 0, 0, 0, 1, 1,
0.9643188, -0.3309544, 1.619083, 0, 0, 0, 1, 1,
0.9646881, 0.7292466, 1.637651, 1, 1, 1, 1, 1,
0.9669719, 1.473383, -0.2398396, 1, 1, 1, 1, 1,
0.9737117, 0.128579, 1.592422, 1, 1, 1, 1, 1,
0.9752773, 1.121822, 2.742635, 1, 1, 1, 1, 1,
0.9784737, -0.2685649, 1.86187, 1, 1, 1, 1, 1,
0.9831936, 0.193259, 1.564665, 1, 1, 1, 1, 1,
0.9929345, -0.4650381, 1.993097, 1, 1, 1, 1, 1,
0.9946297, -1.857511, 2.637417, 1, 1, 1, 1, 1,
0.9997435, -0.464924, 3.197464, 1, 1, 1, 1, 1,
1.009347, -0.6210054, 4.040618, 1, 1, 1, 1, 1,
1.015927, -1.310009, 2.396005, 1, 1, 1, 1, 1,
1.022164, 1.2813, 0.9790187, 1, 1, 1, 1, 1,
1.025254, -1.231758, 4.66485, 1, 1, 1, 1, 1,
1.02588, -1.268274, 3.836848, 1, 1, 1, 1, 1,
1.027221, 0.1492442, 0.2201533, 1, 1, 1, 1, 1,
1.02811, 0.3379908, 1.541181, 0, 0, 1, 1, 1,
1.028746, -1.322954, 3.866948, 1, 0, 0, 1, 1,
1.030641, 0.3833776, 0.5406583, 1, 0, 0, 1, 1,
1.035163, 1.408444, 2.354499, 1, 0, 0, 1, 1,
1.036685, -0.2519062, 2.878571, 1, 0, 0, 1, 1,
1.054488, -1.089384, 2.298719, 1, 0, 0, 1, 1,
1.061141, -0.5332388, 0.148554, 0, 0, 0, 1, 1,
1.064105, 0.6837237, 1.526238, 0, 0, 0, 1, 1,
1.06837, -0.5021011, 3.000511, 0, 0, 0, 1, 1,
1.069393, -0.5162902, 3.274347, 0, 0, 0, 1, 1,
1.069757, 1.145804, 0.1359636, 0, 0, 0, 1, 1,
1.073098, -0.3054293, 2.397305, 0, 0, 0, 1, 1,
1.079527, -0.3424769, 3.373049, 0, 0, 0, 1, 1,
1.088136, 2.06917, 0.593762, 1, 1, 1, 1, 1,
1.097857, -1.637755, 1.979904, 1, 1, 1, 1, 1,
1.100015, -0.7162171, 2.52381, 1, 1, 1, 1, 1,
1.102102, 0.7875186, 0.2978987, 1, 1, 1, 1, 1,
1.109503, 0.05464941, 1.547951, 1, 1, 1, 1, 1,
1.118122, -0.2813385, 2.208155, 1, 1, 1, 1, 1,
1.129075, 0.6458333, 1.259205, 1, 1, 1, 1, 1,
1.129393, -0.1896427, 1.131267, 1, 1, 1, 1, 1,
1.134935, -0.6877003, 3.696105, 1, 1, 1, 1, 1,
1.136413, -0.7757819, 2.648178, 1, 1, 1, 1, 1,
1.148748, 0.04941647, 1.817462, 1, 1, 1, 1, 1,
1.150533, -0.7581859, 1.135708, 1, 1, 1, 1, 1,
1.151691, 2.808623, -1.262885, 1, 1, 1, 1, 1,
1.152594, -1.480177, 3.10306, 1, 1, 1, 1, 1,
1.158138, 0.8750921, 0.3316847, 1, 1, 1, 1, 1,
1.158834, 0.8659555, 1.413753, 0, 0, 1, 1, 1,
1.160902, 1.33198, 0.3515029, 1, 0, 0, 1, 1,
1.161789, -1.276969, 2.679904, 1, 0, 0, 1, 1,
1.162991, 1.002247, 0.5253264, 1, 0, 0, 1, 1,
1.163485, -1.662714, 3.01721, 1, 0, 0, 1, 1,
1.167263, 0.1125574, -0.2015551, 1, 0, 0, 1, 1,
1.171541, -1.268902, 2.183294, 0, 0, 0, 1, 1,
1.177437, -0.5494435, 1.358083, 0, 0, 0, 1, 1,
1.183897, 0.3241911, 2.715832, 0, 0, 0, 1, 1,
1.183915, 1.11008, 2.403625, 0, 0, 0, 1, 1,
1.186795, -0.9199549, 2.580054, 0, 0, 0, 1, 1,
1.192003, 1.324557, 0.1396922, 0, 0, 0, 1, 1,
1.202847, -0.9939811, 2.166385, 0, 0, 0, 1, 1,
1.210027, 0.6130108, -0.3079413, 1, 1, 1, 1, 1,
1.210102, 0.515915, 0.1109805, 1, 1, 1, 1, 1,
1.213153, 0.5373357, -0.5497048, 1, 1, 1, 1, 1,
1.218043, -0.07934678, 0.7351421, 1, 1, 1, 1, 1,
1.22071, 0.2204078, 0.3513064, 1, 1, 1, 1, 1,
1.222968, 0.5217183, 1.121258, 1, 1, 1, 1, 1,
1.230621, 0.6931267, 1.353474, 1, 1, 1, 1, 1,
1.238762, 0.4727823, 1.023644, 1, 1, 1, 1, 1,
1.241918, -1.745423, 3.054326, 1, 1, 1, 1, 1,
1.252065, -0.2176073, 1.380798, 1, 1, 1, 1, 1,
1.269143, -0.4773787, 2.09847, 1, 1, 1, 1, 1,
1.269679, -0.2467482, 0.5623205, 1, 1, 1, 1, 1,
1.271565, 1.71807, 0.5855836, 1, 1, 1, 1, 1,
1.28181, -0.5527099, 1.367145, 1, 1, 1, 1, 1,
1.283073, 0.9548708, 0.3644443, 1, 1, 1, 1, 1,
1.283286, 0.7841817, -0.4728262, 0, 0, 1, 1, 1,
1.283445, 0.5614358, 0.7770886, 1, 0, 0, 1, 1,
1.291931, -0.3539545, 1.358197, 1, 0, 0, 1, 1,
1.295064, 0.1518537, 3.143546, 1, 0, 0, 1, 1,
1.296786, 2.312567, 0.02049646, 1, 0, 0, 1, 1,
1.305861, 0.4818175, -0.05898796, 1, 0, 0, 1, 1,
1.317125, -0.6136361, 0.8442615, 0, 0, 0, 1, 1,
1.319325, 1.196301, -0.09881689, 0, 0, 0, 1, 1,
1.335379, 0.3823324, 0.8147775, 0, 0, 0, 1, 1,
1.344097, -0.7407402, 2.211453, 0, 0, 0, 1, 1,
1.344125, -1.61266, 1.969158, 0, 0, 0, 1, 1,
1.354081, 0.260018, 0.9667362, 0, 0, 0, 1, 1,
1.361805, -0.9528609, -0.2137323, 0, 0, 0, 1, 1,
1.36403, -0.4024985, 1.195409, 1, 1, 1, 1, 1,
1.378575, 0.02542679, 3.249325, 1, 1, 1, 1, 1,
1.382143, 0.1500104, 2.111813, 1, 1, 1, 1, 1,
1.385045, 0.7221003, -0.1798495, 1, 1, 1, 1, 1,
1.39421, 0.06169742, 1.186564, 1, 1, 1, 1, 1,
1.401178, 1.058718, 3.362354, 1, 1, 1, 1, 1,
1.409967, 0.8869658, 1.304547, 1, 1, 1, 1, 1,
1.424981, -1.565926, 2.972248, 1, 1, 1, 1, 1,
1.428803, 0.1912146, 0.1104558, 1, 1, 1, 1, 1,
1.445025, -0.2483165, 1.542976, 1, 1, 1, 1, 1,
1.449948, 0.6195598, 1.229292, 1, 1, 1, 1, 1,
1.454179, -0.336794, 2.855075, 1, 1, 1, 1, 1,
1.460071, -0.1293797, 2.016654, 1, 1, 1, 1, 1,
1.463138, 0.7437537, 1.132621, 1, 1, 1, 1, 1,
1.475043, 0.5561399, 1.994668, 1, 1, 1, 1, 1,
1.483199, -2.074663, 3.040998, 0, 0, 1, 1, 1,
1.48733, 0.3020094, 2.280663, 1, 0, 0, 1, 1,
1.488078, 0.7280085, 2.277778, 1, 0, 0, 1, 1,
1.488972, -0.4022617, 1.407254, 1, 0, 0, 1, 1,
1.490324, -2.440943, 1.977403, 1, 0, 0, 1, 1,
1.502121, 0.1220363, 1.825604, 1, 0, 0, 1, 1,
1.512406, 0.6782916, 0.7565116, 0, 0, 0, 1, 1,
1.51802, 1.331719, -0.3079816, 0, 0, 0, 1, 1,
1.519767, 0.3789352, 0.5667579, 0, 0, 0, 1, 1,
1.524353, -0.7397299, 3.1401, 0, 0, 0, 1, 1,
1.527087, -0.7447048, 2.666422, 0, 0, 0, 1, 1,
1.535021, -0.4807852, 1.743351, 0, 0, 0, 1, 1,
1.549893, 1.187589, -0.3118716, 0, 0, 0, 1, 1,
1.554539, 1.653312, -1.518603, 1, 1, 1, 1, 1,
1.564255, 0.1137535, 1.58619, 1, 1, 1, 1, 1,
1.575868, -0.07146771, 0.00528283, 1, 1, 1, 1, 1,
1.581881, 0.7012467, 1.442328, 1, 1, 1, 1, 1,
1.597112, -0.4618081, 2.214826, 1, 1, 1, 1, 1,
1.599424, -0.5342903, 1.222699, 1, 1, 1, 1, 1,
1.603126, -0.03560514, -0.7454084, 1, 1, 1, 1, 1,
1.603475, 0.03713207, 0.7814934, 1, 1, 1, 1, 1,
1.606049, -0.4389543, 1.905673, 1, 1, 1, 1, 1,
1.616499, -1.566521, 5.185354, 1, 1, 1, 1, 1,
1.630127, -0.4642924, 3.057795, 1, 1, 1, 1, 1,
1.655516, -0.8476666, 3.809116, 1, 1, 1, 1, 1,
1.69902, 1.062068, 2.264485, 1, 1, 1, 1, 1,
1.719404, -1.432879, 1.442809, 1, 1, 1, 1, 1,
1.722434, 0.1876279, -0.5916545, 1, 1, 1, 1, 1,
1.732878, -0.2968927, 2.50353, 0, 0, 1, 1, 1,
1.735243, 2.701581, 0.9698185, 1, 0, 0, 1, 1,
1.735737, -0.2913895, 0.5290687, 1, 0, 0, 1, 1,
1.754192, 1.874407, 0.8167083, 1, 0, 0, 1, 1,
1.756225, -0.3916174, 1.887947, 1, 0, 0, 1, 1,
1.759935, 1.05248, 0.8818355, 1, 0, 0, 1, 1,
1.763689, -0.5073279, 1.760901, 0, 0, 0, 1, 1,
1.763812, 0.1259352, 1.999856, 0, 0, 0, 1, 1,
1.765045, 1.353717, 1.692489, 0, 0, 0, 1, 1,
1.772952, 0.9113188, 2.5455, 0, 0, 0, 1, 1,
1.781507, 1.028045, 2.076818, 0, 0, 0, 1, 1,
1.781639, 0.0329087, 1.257999, 0, 0, 0, 1, 1,
1.807274, -0.9917261, 3.306747, 0, 0, 0, 1, 1,
1.866858, 0.08336887, 1.815256, 1, 1, 1, 1, 1,
1.869386, -0.7889367, 0.476157, 1, 1, 1, 1, 1,
1.887543, -0.4691596, 2.22932, 1, 1, 1, 1, 1,
1.887717, 1.039513, 1.356902, 1, 1, 1, 1, 1,
1.924094, -0.9101655, 2.126156, 1, 1, 1, 1, 1,
1.949926, -0.6315795, 1.545474, 1, 1, 1, 1, 1,
1.953279, 0.8055379, 1.817449, 1, 1, 1, 1, 1,
2.065028, -0.6676897, 2.261253, 1, 1, 1, 1, 1,
2.119127, -0.04630449, 1.804637, 1, 1, 1, 1, 1,
2.120713, -0.3376842, 2.54933, 1, 1, 1, 1, 1,
2.126064, 3.329885, 1.921147, 1, 1, 1, 1, 1,
2.143951, 0.0329027, 3.422418, 1, 1, 1, 1, 1,
2.203332, 0.3982469, 0.9807457, 1, 1, 1, 1, 1,
2.207681, 0.3376461, 3.281951, 1, 1, 1, 1, 1,
2.226359, -1.486193, 0.1439959, 1, 1, 1, 1, 1,
2.231723, 1.070951, 1.845302, 0, 0, 1, 1, 1,
2.242799, 0.6133361, -0.1479819, 1, 0, 0, 1, 1,
2.245155, -1.939738, 2.051148, 1, 0, 0, 1, 1,
2.327188, 1.556829, 1.254021, 1, 0, 0, 1, 1,
2.342936, -0.5321085, 1.010144, 1, 0, 0, 1, 1,
2.345162, 0.4794355, 2.384733, 1, 0, 0, 1, 1,
2.361283, -0.6948759, 1.776028, 0, 0, 0, 1, 1,
2.382337, -1.035411, -0.2573937, 0, 0, 0, 1, 1,
2.392611, -1.134456, 3.403356, 0, 0, 0, 1, 1,
2.435543, -1.414708, 1.299429, 0, 0, 0, 1, 1,
2.551502, -1.30224, 2.234145, 0, 0, 0, 1, 1,
2.565892, -0.7242348, 3.388922, 0, 0, 0, 1, 1,
2.659011, -1.016481, 2.006265, 0, 0, 0, 1, 1,
2.712652, 1.273319, 1.784089, 1, 1, 1, 1, 1,
2.747221, 0.4763103, 2.118071, 1, 1, 1, 1, 1,
2.848177, 0.5331629, 1.001123, 1, 1, 1, 1, 1,
2.971882, 1.127237, 1.136524, 1, 1, 1, 1, 1,
2.995737, 0.2519558, 1.367882, 1, 1, 1, 1, 1,
3.231359, -0.9772102, 3.402601, 1, 1, 1, 1, 1,
3.278326, -1.278826, 2.447981, 1, 1, 1, 1, 1
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
var radius = 9.870821;
var distance = 34.67084;
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
mvMatrix.translate( -0.106827, -0.17019, 0.262682 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.67084);
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