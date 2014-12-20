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
-3.569616, 0.4136503, -0.4067038, 1, 0, 0, 1,
-3.09033, -0.3722007, -0.7076981, 1, 0.007843138, 0, 1,
-3.041982, -0.6244022, -2.433093, 1, 0.01176471, 0, 1,
-2.901416, 1.213541, -1.996475, 1, 0.01960784, 0, 1,
-2.812873, -1.87233, -0.7608325, 1, 0.02352941, 0, 1,
-2.687405, 0.2519832, -1.046104, 1, 0.03137255, 0, 1,
-2.65486, -0.2170857, -1.778016, 1, 0.03529412, 0, 1,
-2.652603, 0.830085, -1.584592, 1, 0.04313726, 0, 1,
-2.582513, -1.772125, -2.850569, 1, 0.04705882, 0, 1,
-2.575513, 0.3591719, -2.889996, 1, 0.05490196, 0, 1,
-2.573799, -1.162682, -1.850997, 1, 0.05882353, 0, 1,
-2.544891, 0.2841675, -2.047909, 1, 0.06666667, 0, 1,
-2.529466, 0.1277328, -1.091049, 1, 0.07058824, 0, 1,
-2.402733, -1.660897, -2.719173, 1, 0.07843138, 0, 1,
-2.341104, 1.036369, -1.254785, 1, 0.08235294, 0, 1,
-2.332745, -0.4749563, -1.604583, 1, 0.09019608, 0, 1,
-2.295765, -1.519776, -2.469343, 1, 0.09411765, 0, 1,
-2.276553, 1.218021, -3.241418, 1, 0.1019608, 0, 1,
-2.250115, -0.6683462, -2.033436, 1, 0.1098039, 0, 1,
-2.164921, -1.601496, -1.613888, 1, 0.1137255, 0, 1,
-2.145268, -0.3348351, -2.339229, 1, 0.1215686, 0, 1,
-2.133402, 0.2331429, -0.2408331, 1, 0.1254902, 0, 1,
-2.130019, -1.129538, -0.8939263, 1, 0.1333333, 0, 1,
-2.079886, -1.636084, -0.9771398, 1, 0.1372549, 0, 1,
-2.068227, 0.5431508, -1.833892, 1, 0.145098, 0, 1,
-2.053923, -0.9510399, -1.954984, 1, 0.1490196, 0, 1,
-2.044539, -1.551805, -3.649022, 1, 0.1568628, 0, 1,
-1.991777, 1.354548, 0.2867699, 1, 0.1607843, 0, 1,
-1.983019, -0.5982463, -1.588072, 1, 0.1686275, 0, 1,
-1.981952, 0.6551719, -0.4891437, 1, 0.172549, 0, 1,
-1.897679, -0.1850678, -2.402549, 1, 0.1803922, 0, 1,
-1.865245, -0.5948347, -0.8155275, 1, 0.1843137, 0, 1,
-1.855794, 0.444275, -0.6657884, 1, 0.1921569, 0, 1,
-1.840086, 0.3369785, -0.3763647, 1, 0.1960784, 0, 1,
-1.815759, -1.300648, -3.800072, 1, 0.2039216, 0, 1,
-1.814344, -1.46569, -2.559422, 1, 0.2117647, 0, 1,
-1.795285, -0.07552227, 1.144691, 1, 0.2156863, 0, 1,
-1.793904, -0.5413151, -2.635684, 1, 0.2235294, 0, 1,
-1.780604, 0.2465436, -0.06034131, 1, 0.227451, 0, 1,
-1.764869, 1.360276, -0.6932964, 1, 0.2352941, 0, 1,
-1.76161, -1.029391, -3.046875, 1, 0.2392157, 0, 1,
-1.733343, 1.249437, -1.999473, 1, 0.2470588, 0, 1,
-1.713316, -0.02837788, -0.8826569, 1, 0.2509804, 0, 1,
-1.712569, -0.4270598, -1.004051, 1, 0.2588235, 0, 1,
-1.693055, 1.27932, -0.1330999, 1, 0.2627451, 0, 1,
-1.677022, 0.4190348, -1.512791, 1, 0.2705882, 0, 1,
-1.668367, 0.4157522, -2.544158, 1, 0.2745098, 0, 1,
-1.658182, -0.1382524, -1.183409, 1, 0.282353, 0, 1,
-1.656708, 0.06296715, -2.127573, 1, 0.2862745, 0, 1,
-1.651248, 0.6120957, -0.6554268, 1, 0.2941177, 0, 1,
-1.612709, 0.6858416, -0.09305864, 1, 0.3019608, 0, 1,
-1.590763, 0.2386657, -1.669922, 1, 0.3058824, 0, 1,
-1.58709, -0.4673989, -1.099484, 1, 0.3137255, 0, 1,
-1.586156, 0.3245631, 0.06093103, 1, 0.3176471, 0, 1,
-1.557133, -0.3199344, -1.043407, 1, 0.3254902, 0, 1,
-1.530155, -0.9174624, -3.079697, 1, 0.3294118, 0, 1,
-1.521868, 1.443055, -1.706892, 1, 0.3372549, 0, 1,
-1.502929, 0.1101558, -1.878105, 1, 0.3411765, 0, 1,
-1.496888, -0.6478785, -0.4879124, 1, 0.3490196, 0, 1,
-1.482245, -0.8579621, -0.7487101, 1, 0.3529412, 0, 1,
-1.481548, -0.5041123, -1.835131, 1, 0.3607843, 0, 1,
-1.468749, 1.286187, -1.149606, 1, 0.3647059, 0, 1,
-1.442028, -0.8755956, -1.335883, 1, 0.372549, 0, 1,
-1.436066, -0.6691769, -3.432846, 1, 0.3764706, 0, 1,
-1.431012, -1.883361, -1.799674, 1, 0.3843137, 0, 1,
-1.420026, 0.8067548, -2.610321, 1, 0.3882353, 0, 1,
-1.401933, 0.3564526, -0.6150247, 1, 0.3960784, 0, 1,
-1.399925, -0.8133568, 0.1321107, 1, 0.4039216, 0, 1,
-1.398381, -1.775291, -2.353004, 1, 0.4078431, 0, 1,
-1.385292, 0.1747951, -1.106027, 1, 0.4156863, 0, 1,
-1.381665, 0.4599164, -0.8098859, 1, 0.4196078, 0, 1,
-1.379189, 0.6012691, -2.195535, 1, 0.427451, 0, 1,
-1.378471, -0.1514063, -0.3117022, 1, 0.4313726, 0, 1,
-1.377907, -0.8741193, 0.1735807, 1, 0.4392157, 0, 1,
-1.37654, 0.0498502, -1.634665, 1, 0.4431373, 0, 1,
-1.376031, -0.6014357, 0.3998657, 1, 0.4509804, 0, 1,
-1.364141, 1.369833, -0.9196719, 1, 0.454902, 0, 1,
-1.356514, 0.1484097, -1.618485, 1, 0.4627451, 0, 1,
-1.347977, -1.209108, -2.004424, 1, 0.4666667, 0, 1,
-1.333916, -0.6123536, -1.988168, 1, 0.4745098, 0, 1,
-1.324003, -0.4025819, -3.607203, 1, 0.4784314, 0, 1,
-1.318465, 0.7123011, -0.8632081, 1, 0.4862745, 0, 1,
-1.316444, -1.534354, -3.254483, 1, 0.4901961, 0, 1,
-1.313437, 1.643473, -1.144647, 1, 0.4980392, 0, 1,
-1.312878, 0.6093253, 0.2100161, 1, 0.5058824, 0, 1,
-1.311633, 2.053537, 0.01779577, 1, 0.509804, 0, 1,
-1.307223, -0.9282131, -2.126575, 1, 0.5176471, 0, 1,
-1.304075, -1.339689, -1.810689, 1, 0.5215687, 0, 1,
-1.279638, -0.1700693, -0.07216535, 1, 0.5294118, 0, 1,
-1.276937, 0.69718, -1.269938, 1, 0.5333334, 0, 1,
-1.274317, 0.4286362, -1.847833, 1, 0.5411765, 0, 1,
-1.274307, -0.7393591, -1.786209, 1, 0.5450981, 0, 1,
-1.269684, -0.4061173, -1.930454, 1, 0.5529412, 0, 1,
-1.2655, 0.1959606, -0.5795828, 1, 0.5568628, 0, 1,
-1.255103, -0.6524814, -1.666796, 1, 0.5647059, 0, 1,
-1.251815, 0.527505, -0.2659128, 1, 0.5686275, 0, 1,
-1.227354, -0.4486167, -0.7817711, 1, 0.5764706, 0, 1,
-1.224223, 0.0239701, -1.419054, 1, 0.5803922, 0, 1,
-1.220863, -0.1388875, -0.4598645, 1, 0.5882353, 0, 1,
-1.220592, -0.2863786, -0.9477503, 1, 0.5921569, 0, 1,
-1.213302, -1.56325, -3.822394, 1, 0.6, 0, 1,
-1.209095, 0.6234823, -1.891878, 1, 0.6078432, 0, 1,
-1.196825, 0.3598365, -2.950029, 1, 0.6117647, 0, 1,
-1.195479, -2.44762, -1.444951, 1, 0.6196079, 0, 1,
-1.18763, -1.329997, -1.708343, 1, 0.6235294, 0, 1,
-1.185161, -0.4510098, -2.954175, 1, 0.6313726, 0, 1,
-1.182001, 0.06879973, -2.007505, 1, 0.6352941, 0, 1,
-1.180147, -1.399377, -2.439457, 1, 0.6431373, 0, 1,
-1.177039, 0.09536453, -2.294502, 1, 0.6470588, 0, 1,
-1.167987, -2.30716, -2.671005, 1, 0.654902, 0, 1,
-1.159341, 0.9306939, -2.092541, 1, 0.6588235, 0, 1,
-1.136971, 0.3441291, -1.504884, 1, 0.6666667, 0, 1,
-1.134703, 0.9267098, -0.1535091, 1, 0.6705883, 0, 1,
-1.134081, 0.002855743, -1.100764, 1, 0.6784314, 0, 1,
-1.13322, -1.344584, -1.972031, 1, 0.682353, 0, 1,
-1.121333, -0.5591226, -2.525117, 1, 0.6901961, 0, 1,
-1.118219, -0.7587595, -1.831596, 1, 0.6941177, 0, 1,
-1.104664, -1.036001, -3.745469, 1, 0.7019608, 0, 1,
-1.101866, 0.1158986, -1.791058, 1, 0.7098039, 0, 1,
-1.099475, -0.001949258, -2.586577, 1, 0.7137255, 0, 1,
-1.099022, -1.279149, -2.001773, 1, 0.7215686, 0, 1,
-1.096466, 0.08434743, -0.9953119, 1, 0.7254902, 0, 1,
-1.094778, -0.8709124, -2.536954, 1, 0.7333333, 0, 1,
-1.093375, -0.4800829, -2.242312, 1, 0.7372549, 0, 1,
-1.091485, -0.5626569, -1.313282, 1, 0.7450981, 0, 1,
-1.090304, -1.268993, -1.630921, 1, 0.7490196, 0, 1,
-1.086167, 0.1929919, -1.620404, 1, 0.7568628, 0, 1,
-1.071482, -0.3429011, -1.887369, 1, 0.7607843, 0, 1,
-1.060654, 0.1279745, -1.585274, 1, 0.7686275, 0, 1,
-1.056482, 1.602312, -1.2753, 1, 0.772549, 0, 1,
-1.055108, -1.729838, -2.678146, 1, 0.7803922, 0, 1,
-1.050778, -0.06574743, -1.855283, 1, 0.7843137, 0, 1,
-1.050108, 0.263362, -1.999584, 1, 0.7921569, 0, 1,
-1.044871, 0.4818285, -1.817679, 1, 0.7960784, 0, 1,
-1.043745, -0.9112346, -1.986866, 1, 0.8039216, 0, 1,
-1.040766, -0.0672299, -1.070899, 1, 0.8117647, 0, 1,
-1.039775, -0.2810334, -1.240427, 1, 0.8156863, 0, 1,
-1.038991, 2.289162, -1.604629, 1, 0.8235294, 0, 1,
-1.035982, -0.2469793, -2.070009, 1, 0.827451, 0, 1,
-1.026596, 0.6746358, -1.760398, 1, 0.8352941, 0, 1,
-1.026413, 0.8789232, 0.01511057, 1, 0.8392157, 0, 1,
-1.024929, 0.9430726, -2.556726, 1, 0.8470588, 0, 1,
-1.020061, 0.621668, -0.7796811, 1, 0.8509804, 0, 1,
-1.019813, -0.140279, -0.5541208, 1, 0.8588235, 0, 1,
-1.010196, 1.920647, 0.8513695, 1, 0.8627451, 0, 1,
-1.009975, -0.1150717, -2.838574, 1, 0.8705882, 0, 1,
-1.007922, 0.216517, 0.1148856, 1, 0.8745098, 0, 1,
-1.004237, 1.245653, -0.229419, 1, 0.8823529, 0, 1,
-1.002582, 1.38134, -0.7731021, 1, 0.8862745, 0, 1,
-1.000159, 1.51074, 0.4311081, 1, 0.8941177, 0, 1,
-0.9979842, -0.01981817, -1.406955, 1, 0.8980392, 0, 1,
-0.9926729, -0.9356497, -2.468513, 1, 0.9058824, 0, 1,
-0.9901947, -0.9018681, -4.079969, 1, 0.9137255, 0, 1,
-0.9855349, 1.148685, -0.7361233, 1, 0.9176471, 0, 1,
-0.978639, -0.2524721, -2.331409, 1, 0.9254902, 0, 1,
-0.9719536, 0.7726212, 0.9132037, 1, 0.9294118, 0, 1,
-0.9691915, -1.725822, -2.49912, 1, 0.9372549, 0, 1,
-0.966688, 1.08475, -0.4304329, 1, 0.9411765, 0, 1,
-0.9651334, -1.883549, -3.702153, 1, 0.9490196, 0, 1,
-0.9639929, -1.808039, -2.207753, 1, 0.9529412, 0, 1,
-0.9443519, 0.5455696, -1.784254, 1, 0.9607843, 0, 1,
-0.9419266, -1.345414, -4.797931, 1, 0.9647059, 0, 1,
-0.9416617, -0.5301841, -1.936176, 1, 0.972549, 0, 1,
-0.9386587, -0.4306834, 0.133728, 1, 0.9764706, 0, 1,
-0.9321902, -1.35365, -3.128914, 1, 0.9843137, 0, 1,
-0.9252563, 1.024809, -1.238639, 1, 0.9882353, 0, 1,
-0.9224615, -0.4808567, -0.8961341, 1, 0.9960784, 0, 1,
-0.913089, -0.161129, -2.89857, 0.9960784, 1, 0, 1,
-0.9040871, 0.6618337, -1.093424, 0.9921569, 1, 0, 1,
-0.9037057, -0.5783662, -0.7107384, 0.9843137, 1, 0, 1,
-0.8923097, -0.4498801, -1.323745, 0.9803922, 1, 0, 1,
-0.8866005, -0.994294, -2.361968, 0.972549, 1, 0, 1,
-0.87813, 0.2873977, 0.1631853, 0.9686275, 1, 0, 1,
-0.8753529, -0.135201, -0.7280887, 0.9607843, 1, 0, 1,
-0.8728234, 0.09619723, -2.922137, 0.9568627, 1, 0, 1,
-0.8697194, 0.6904274, -3.466284, 0.9490196, 1, 0, 1,
-0.8645778, -0.3894495, -2.822128, 0.945098, 1, 0, 1,
-0.8643541, -3.133781, -4.764687, 0.9372549, 1, 0, 1,
-0.8597252, -0.01688715, -2.032076, 0.9333333, 1, 0, 1,
-0.8594561, -1.004889, 1.321468, 0.9254902, 1, 0, 1,
-0.8454384, -0.7356113, -4.2848, 0.9215686, 1, 0, 1,
-0.8361074, 2.77866, -1.352835, 0.9137255, 1, 0, 1,
-0.8295237, -0.3516109, -1.707051, 0.9098039, 1, 0, 1,
-0.8271821, -0.7222669, -0.399196, 0.9019608, 1, 0, 1,
-0.8253197, 2.073622, -2.457722, 0.8941177, 1, 0, 1,
-0.8235893, -2.020557, -1.76689, 0.8901961, 1, 0, 1,
-0.822183, 0.643584, -0.7514192, 0.8823529, 1, 0, 1,
-0.8195187, 0.679051, -0.9074402, 0.8784314, 1, 0, 1,
-0.8174942, 0.6413268, 0.8806936, 0.8705882, 1, 0, 1,
-0.8147236, -0.06798059, -2.167973, 0.8666667, 1, 0, 1,
-0.8125923, -0.3338537, -2.367687, 0.8588235, 1, 0, 1,
-0.8111168, -0.9948145, -4.03719, 0.854902, 1, 0, 1,
-0.8087935, 0.4956124, -1.215073, 0.8470588, 1, 0, 1,
-0.8070691, 0.6399341, 1.87116, 0.8431373, 1, 0, 1,
-0.8070163, 1.480013, -0.4387777, 0.8352941, 1, 0, 1,
-0.8058541, 0.5862822, -0.8195924, 0.8313726, 1, 0, 1,
-0.8020203, 1.447257, -2.080017, 0.8235294, 1, 0, 1,
-0.80103, 1.624857, -1.221536, 0.8196079, 1, 0, 1,
-0.7960885, -1.568197, -3.532248, 0.8117647, 1, 0, 1,
-0.7957528, 0.7723849, -0.8635519, 0.8078431, 1, 0, 1,
-0.7956265, -1.395827, -3.843281, 0.8, 1, 0, 1,
-0.7938456, -1.30293, -2.230738, 0.7921569, 1, 0, 1,
-0.7872061, -1.622298, -2.072325, 0.7882353, 1, 0, 1,
-0.7869914, -1.27328, -2.73368, 0.7803922, 1, 0, 1,
-0.7851173, -0.5203314, -0.9401873, 0.7764706, 1, 0, 1,
-0.7851154, -0.1123876, -1.170549, 0.7686275, 1, 0, 1,
-0.7848014, -0.6230515, -2.207296, 0.7647059, 1, 0, 1,
-0.7834759, 2.180748, -1.355056, 0.7568628, 1, 0, 1,
-0.7830436, 1.898886, 0.0325675, 0.7529412, 1, 0, 1,
-0.7821637, 0.9320995, -0.8385952, 0.7450981, 1, 0, 1,
-0.776931, -0.7391592, -2.901641, 0.7411765, 1, 0, 1,
-0.7755585, -1.781136, -2.835629, 0.7333333, 1, 0, 1,
-0.7745019, 0.9745693, -0.7279582, 0.7294118, 1, 0, 1,
-0.7736272, 1.155538, 0.6008442, 0.7215686, 1, 0, 1,
-0.7718554, 0.6431229, -2.688633, 0.7176471, 1, 0, 1,
-0.77008, 1.8274, -0.2667766, 0.7098039, 1, 0, 1,
-0.7682654, -1.489286, -2.550574, 0.7058824, 1, 0, 1,
-0.7603526, -1.83539, -2.945431, 0.6980392, 1, 0, 1,
-0.7574612, -1.881799, -3.443575, 0.6901961, 1, 0, 1,
-0.7552917, 1.71319, -1.659085, 0.6862745, 1, 0, 1,
-0.7549056, 0.03081264, -1.836991, 0.6784314, 1, 0, 1,
-0.7545276, 0.8372191, 0.2262398, 0.6745098, 1, 0, 1,
-0.7527246, 0.1558332, -0.8698847, 0.6666667, 1, 0, 1,
-0.7507578, 0.7577954, -0.1287445, 0.6627451, 1, 0, 1,
-0.750394, 0.1243321, -1.042775, 0.654902, 1, 0, 1,
-0.7493606, 2.045398, -1.524697, 0.6509804, 1, 0, 1,
-0.7470728, 1.059674, -2.043602, 0.6431373, 1, 0, 1,
-0.7469596, 0.3386117, -0.03667787, 0.6392157, 1, 0, 1,
-0.7438516, 1.03151, -0.9924166, 0.6313726, 1, 0, 1,
-0.7399046, -0.2607652, -2.453544, 0.627451, 1, 0, 1,
-0.7389473, 1.35182, -0.09978521, 0.6196079, 1, 0, 1,
-0.7366881, -0.8984314, -2.0572, 0.6156863, 1, 0, 1,
-0.7323452, -0.5913154, -2.799661, 0.6078432, 1, 0, 1,
-0.7307673, 0.04240577, -2.984774, 0.6039216, 1, 0, 1,
-0.7293543, 0.6015683, -1.368152, 0.5960785, 1, 0, 1,
-0.7274926, 1.671342, 0.2570486, 0.5882353, 1, 0, 1,
-0.7206975, 1.418478, -1.03779, 0.5843138, 1, 0, 1,
-0.7194104, -0.8654578, -1.381872, 0.5764706, 1, 0, 1,
-0.718821, 1.126551, -1.001225, 0.572549, 1, 0, 1,
-0.7182229, 0.1077062, 0.7537163, 0.5647059, 1, 0, 1,
-0.7180553, -1.092271, -2.564832, 0.5607843, 1, 0, 1,
-0.7095391, -0.3505465, -1.793588, 0.5529412, 1, 0, 1,
-0.7094041, 0.4603494, -1.699883, 0.5490196, 1, 0, 1,
-0.7089072, -0.08741074, -1.916131, 0.5411765, 1, 0, 1,
-0.7088982, 0.661529, -0.8739251, 0.5372549, 1, 0, 1,
-0.7053441, 0.1859415, -2.454365, 0.5294118, 1, 0, 1,
-0.703294, 0.8844637, -0.1933347, 0.5254902, 1, 0, 1,
-0.7008315, 0.8992204, -0.1648681, 0.5176471, 1, 0, 1,
-0.7000976, -1.239844, -3.574714, 0.5137255, 1, 0, 1,
-0.6983948, 0.1098263, -0.4663658, 0.5058824, 1, 0, 1,
-0.6909238, 0.0172733, -0.5754951, 0.5019608, 1, 0, 1,
-0.6905725, 0.2417776, -0.8428519, 0.4941176, 1, 0, 1,
-0.6759893, -0.3415992, -0.7306271, 0.4862745, 1, 0, 1,
-0.6753902, -1.634285, -1.960023, 0.4823529, 1, 0, 1,
-0.665099, 0.7608007, -2.466011, 0.4745098, 1, 0, 1,
-0.6631687, -1.355368, -3.197765, 0.4705882, 1, 0, 1,
-0.6581702, -0.3039545, -0.305508, 0.4627451, 1, 0, 1,
-0.6569716, -0.2217005, -2.926348, 0.4588235, 1, 0, 1,
-0.6546805, 0.7336268, -1.555207, 0.4509804, 1, 0, 1,
-0.6529075, -1.141169, -3.185278, 0.4470588, 1, 0, 1,
-0.6469609, 0.08126602, -0.8395314, 0.4392157, 1, 0, 1,
-0.6439974, -0.7021652, -0.6726628, 0.4352941, 1, 0, 1,
-0.6437044, -1.24603, -4.303302, 0.427451, 1, 0, 1,
-0.639838, -0.3984411, -2.830443, 0.4235294, 1, 0, 1,
-0.6341339, -0.6580765, -2.529876, 0.4156863, 1, 0, 1,
-0.6337293, 0.465468, -1.733307, 0.4117647, 1, 0, 1,
-0.6200202, 0.168699, -0.2363515, 0.4039216, 1, 0, 1,
-0.6155746, 1.263238, -0.4893368, 0.3960784, 1, 0, 1,
-0.6135122, 0.6389715, -0.4107912, 0.3921569, 1, 0, 1,
-0.6115068, 0.5944618, -1.400499, 0.3843137, 1, 0, 1,
-0.6032999, 0.582866, -0.1534446, 0.3803922, 1, 0, 1,
-0.602091, -0.7131076, -1.041642, 0.372549, 1, 0, 1,
-0.601248, -0.7167599, -2.152153, 0.3686275, 1, 0, 1,
-0.5983241, -0.8792498, -2.102235, 0.3607843, 1, 0, 1,
-0.5946974, -1.095676, -1.958656, 0.3568628, 1, 0, 1,
-0.5937926, 0.3129595, -1.451738, 0.3490196, 1, 0, 1,
-0.5875585, 1.919062, -1.106437, 0.345098, 1, 0, 1,
-0.5859411, 1.060781, -0.6687801, 0.3372549, 1, 0, 1,
-0.5857107, 0.01851961, -1.068842, 0.3333333, 1, 0, 1,
-0.5823495, -0.8141429, -1.432442, 0.3254902, 1, 0, 1,
-0.5764151, -0.2251936, -3.007407, 0.3215686, 1, 0, 1,
-0.5761841, -1.581202, -3.245817, 0.3137255, 1, 0, 1,
-0.5753608, 0.3929503, -1.190828, 0.3098039, 1, 0, 1,
-0.5730644, 0.9470215, -0.4357872, 0.3019608, 1, 0, 1,
-0.5726311, -1.71846, -3.897311, 0.2941177, 1, 0, 1,
-0.5724143, -2.550464, -2.185852, 0.2901961, 1, 0, 1,
-0.5702432, 0.4296325, -1.033609, 0.282353, 1, 0, 1,
-0.5631593, 1.085048, -0.4474295, 0.2784314, 1, 0, 1,
-0.5568031, 0.07288534, -1.685896, 0.2705882, 1, 0, 1,
-0.5558004, -1.50482, -3.975302, 0.2666667, 1, 0, 1,
-0.5520716, -0.7236597, -2.053858, 0.2588235, 1, 0, 1,
-0.5513139, -0.2106106, -2.619726, 0.254902, 1, 0, 1,
-0.5478017, 0.005446971, -0.4407954, 0.2470588, 1, 0, 1,
-0.5467452, -0.7962434, -4.273101, 0.2431373, 1, 0, 1,
-0.5446125, -0.5338969, -2.661674, 0.2352941, 1, 0, 1,
-0.5416693, -2.71553, -3.316613, 0.2313726, 1, 0, 1,
-0.5413573, -1.102281, -2.688557, 0.2235294, 1, 0, 1,
-0.5412129, 0.805661, -0.9073154, 0.2196078, 1, 0, 1,
-0.5364281, -0.6787238, -1.794835, 0.2117647, 1, 0, 1,
-0.5360351, 0.4574518, -1.208054, 0.2078431, 1, 0, 1,
-0.5295942, -0.7288916, -3.757698, 0.2, 1, 0, 1,
-0.5268054, 2.234619, -0.5818474, 0.1921569, 1, 0, 1,
-0.5242925, 1.012232, -2.203196, 0.1882353, 1, 0, 1,
-0.5171126, 0.08489703, -0.8966138, 0.1803922, 1, 0, 1,
-0.515919, 1.319924, -1.349624, 0.1764706, 1, 0, 1,
-0.5136618, 1.593723, -0.1722325, 0.1686275, 1, 0, 1,
-0.5136351, 0.1726659, -0.3593473, 0.1647059, 1, 0, 1,
-0.5123862, 0.2783786, -2.129049, 0.1568628, 1, 0, 1,
-0.5117402, -1.376693, -2.343672, 0.1529412, 1, 0, 1,
-0.5060319, 0.5591472, -1.605279, 0.145098, 1, 0, 1,
-0.5024799, 0.1561308, -1.451035, 0.1411765, 1, 0, 1,
-0.5001093, 0.5452729, -0.4971487, 0.1333333, 1, 0, 1,
-0.4999611, 0.5946349, -0.07325821, 0.1294118, 1, 0, 1,
-0.499881, 1.121375, -0.6042059, 0.1215686, 1, 0, 1,
-0.4990162, -0.5662946, -0.2374929, 0.1176471, 1, 0, 1,
-0.4957454, -1.135219, -2.776748, 0.1098039, 1, 0, 1,
-0.4949488, 0.5625757, -0.3752249, 0.1058824, 1, 0, 1,
-0.4942368, -1.56998, -5.102866, 0.09803922, 1, 0, 1,
-0.4920166, 1.868593, -2.23157, 0.09019608, 1, 0, 1,
-0.490731, 0.3645826, -0.3511315, 0.08627451, 1, 0, 1,
-0.4880711, -0.4075455, -3.451844, 0.07843138, 1, 0, 1,
-0.4862233, 0.6515338, -0.06152306, 0.07450981, 1, 0, 1,
-0.4847051, 0.6357296, -0.2938307, 0.06666667, 1, 0, 1,
-0.4804639, -0.7741477, -3.283584, 0.0627451, 1, 0, 1,
-0.4785628, 0.3738878, -0.06894801, 0.05490196, 1, 0, 1,
-0.4765157, -1.485941, -2.819345, 0.05098039, 1, 0, 1,
-0.4633979, -0.3404178, -2.341985, 0.04313726, 1, 0, 1,
-0.4614701, 1.462571, -0.7158224, 0.03921569, 1, 0, 1,
-0.4611522, -0.2985206, -3.59146, 0.03137255, 1, 0, 1,
-0.459087, -0.1164124, -2.559266, 0.02745098, 1, 0, 1,
-0.4577284, 0.5316556, -2.369027, 0.01960784, 1, 0, 1,
-0.4506413, 0.9629169, -1.112587, 0.01568628, 1, 0, 1,
-0.4501412, 1.278845, 0.5857395, 0.007843138, 1, 0, 1,
-0.4469121, 0.9789116, -0.5788222, 0.003921569, 1, 0, 1,
-0.4459531, -0.2513517, -3.313665, 0, 1, 0.003921569, 1,
-0.4459296, 0.2143182, -0.2434114, 0, 1, 0.01176471, 1,
-0.4434011, -1.960717, -1.484532, 0, 1, 0.01568628, 1,
-0.4407049, 0.05815748, -1.069219, 0, 1, 0.02352941, 1,
-0.4401098, 1.279532, -0.02232829, 0, 1, 0.02745098, 1,
-0.4390038, 0.8061205, 0.154427, 0, 1, 0.03529412, 1,
-0.4389502, -0.6443822, -3.17968, 0, 1, 0.03921569, 1,
-0.4384101, -2.074792, -4.361989, 0, 1, 0.04705882, 1,
-0.4383321, -1.380954, -3.040337, 0, 1, 0.05098039, 1,
-0.4382365, 0.1057714, -1.347028, 0, 1, 0.05882353, 1,
-0.4285929, 0.6460522, -0.1767294, 0, 1, 0.0627451, 1,
-0.4248934, -1.249097, -2.520257, 0, 1, 0.07058824, 1,
-0.4246408, 0.3060307, -0.7241349, 0, 1, 0.07450981, 1,
-0.4237876, 1.183719, -2.135786, 0, 1, 0.08235294, 1,
-0.4182962, -0.3613294, -1.508598, 0, 1, 0.08627451, 1,
-0.4152536, -0.7850093, -4.839403, 0, 1, 0.09411765, 1,
-0.4121035, -0.9971367, -1.950614, 0, 1, 0.1019608, 1,
-0.4064283, 1.153496, 0.1602179, 0, 1, 0.1058824, 1,
-0.4001876, 1.602002, -1.267626, 0, 1, 0.1137255, 1,
-0.3967836, -0.1391065, -1.041433, 0, 1, 0.1176471, 1,
-0.3946207, 0.1587057, -1.030717, 0, 1, 0.1254902, 1,
-0.39002, -1.196948, -1.433859, 0, 1, 0.1294118, 1,
-0.3882704, -0.02601926, -2.658818, 0, 1, 0.1372549, 1,
-0.3862572, 1.950598, -0.8600854, 0, 1, 0.1411765, 1,
-0.3828341, -0.1951812, -3.306002, 0, 1, 0.1490196, 1,
-0.3735069, 0.5501483, -1.063454, 0, 1, 0.1529412, 1,
-0.3733942, 1.221437, 1.246271, 0, 1, 0.1607843, 1,
-0.3727636, -0.1031573, -1.419101, 0, 1, 0.1647059, 1,
-0.3722253, 0.09959721, 0.2605308, 0, 1, 0.172549, 1,
-0.3719968, 0.6834649, -0.5289573, 0, 1, 0.1764706, 1,
-0.3715691, 1.201013, -1.963509, 0, 1, 0.1843137, 1,
-0.3699474, 0.5725907, -1.723737, 0, 1, 0.1882353, 1,
-0.3669724, 0.6899642, 0.9286485, 0, 1, 0.1960784, 1,
-0.3669011, 0.4375348, 0.3345022, 0, 1, 0.2039216, 1,
-0.364543, 0.4217121, -0.2994301, 0, 1, 0.2078431, 1,
-0.3632317, -1.173436, -0.6605846, 0, 1, 0.2156863, 1,
-0.3617951, 0.257619, -0.8005379, 0, 1, 0.2196078, 1,
-0.3614113, -0.8525162, -3.630766, 0, 1, 0.227451, 1,
-0.3590143, -0.4679366, -2.404132, 0, 1, 0.2313726, 1,
-0.3545385, 1.834485, 0.1534105, 0, 1, 0.2392157, 1,
-0.3542351, -0.7382147, -0.9184684, 0, 1, 0.2431373, 1,
-0.3529877, 0.3201115, -1.694703, 0, 1, 0.2509804, 1,
-0.3474125, -0.05223511, -1.274105, 0, 1, 0.254902, 1,
-0.3434862, 0.08334067, -1.756502, 0, 1, 0.2627451, 1,
-0.3387213, -0.1085231, -2.825974, 0, 1, 0.2666667, 1,
-0.3321754, 2.510754, -1.238437, 0, 1, 0.2745098, 1,
-0.3316192, 0.2480337, -1.586215, 0, 1, 0.2784314, 1,
-0.3309775, -0.07085325, -1.934936, 0, 1, 0.2862745, 1,
-0.3261862, 1.620091, 1.128537, 0, 1, 0.2901961, 1,
-0.3252276, -0.3605029, -2.931408, 0, 1, 0.2980392, 1,
-0.3219897, -0.08038933, -3.362012, 0, 1, 0.3058824, 1,
-0.3208851, 0.9073814, -2.597117, 0, 1, 0.3098039, 1,
-0.3199425, -0.4724941, -2.154475, 0, 1, 0.3176471, 1,
-0.3131738, -0.1296362, -1.645277, 0, 1, 0.3215686, 1,
-0.3104637, 0.8525349, 1.202101, 0, 1, 0.3294118, 1,
-0.3038644, -0.7088705, -1.604593, 0, 1, 0.3333333, 1,
-0.3032705, -2.134336, -3.077039, 0, 1, 0.3411765, 1,
-0.2957553, -0.34327, -1.135476, 0, 1, 0.345098, 1,
-0.2938399, 0.766313, 0.2610771, 0, 1, 0.3529412, 1,
-0.2922104, -0.2485142, -0.8369743, 0, 1, 0.3568628, 1,
-0.2901199, -0.175424, -0.7745829, 0, 1, 0.3647059, 1,
-0.2897318, 0.9376503, -0.8575931, 0, 1, 0.3686275, 1,
-0.2821327, -0.7245032, -3.365851, 0, 1, 0.3764706, 1,
-0.2808857, 0.05508611, -2.605075, 0, 1, 0.3803922, 1,
-0.2776277, -0.9188943, -2.275907, 0, 1, 0.3882353, 1,
-0.2747758, 0.169073, -2.224428, 0, 1, 0.3921569, 1,
-0.2684052, 0.9204187, -0.06497692, 0, 1, 0.4, 1,
-0.2660589, 1.457194, 0.9602427, 0, 1, 0.4078431, 1,
-0.264133, 2.557675, 1.399908, 0, 1, 0.4117647, 1,
-0.2620999, -1.125975, -3.081186, 0, 1, 0.4196078, 1,
-0.2586777, 0.3229288, -1.455884, 0, 1, 0.4235294, 1,
-0.2575136, 0.8775616, -1.643057, 0, 1, 0.4313726, 1,
-0.2553525, 1.883228, -0.05999778, 0, 1, 0.4352941, 1,
-0.2546065, 1.161664, 0.03008985, 0, 1, 0.4431373, 1,
-0.2532721, 1.561242, 0.8620346, 0, 1, 0.4470588, 1,
-0.2530709, 2.131857, 0.3378213, 0, 1, 0.454902, 1,
-0.2516197, 1.322245, 0.6629803, 0, 1, 0.4588235, 1,
-0.249663, -0.3433082, -4.837245, 0, 1, 0.4666667, 1,
-0.2463419, 1.682048, -0.5796705, 0, 1, 0.4705882, 1,
-0.2436651, -1.407529, -2.312486, 0, 1, 0.4784314, 1,
-0.2423717, 0.2173359, -0.928533, 0, 1, 0.4823529, 1,
-0.2420052, 0.4420277, 1.336154, 0, 1, 0.4901961, 1,
-0.2373114, 0.4875203, 0.7350836, 0, 1, 0.4941176, 1,
-0.2371136, 0.414223, -0.6403962, 0, 1, 0.5019608, 1,
-0.2368982, -0.2139126, -4.060385, 0, 1, 0.509804, 1,
-0.2346307, 0.1599663, -1.467533, 0, 1, 0.5137255, 1,
-0.2291274, -0.5983365, -3.659323, 0, 1, 0.5215687, 1,
-0.2268924, 0.9878118, -2.234055, 0, 1, 0.5254902, 1,
-0.2261137, -0.9370813, -3.05165, 0, 1, 0.5333334, 1,
-0.2180661, 0.726302, -2.210779, 0, 1, 0.5372549, 1,
-0.2173581, 1.087339, -1.693108, 0, 1, 0.5450981, 1,
-0.2168324, 1.453428, -0.7637878, 0, 1, 0.5490196, 1,
-0.2165204, -0.4615882, -2.375083, 0, 1, 0.5568628, 1,
-0.2121557, 0.6002409, -1.957925, 0, 1, 0.5607843, 1,
-0.2054748, -0.8842594, -4.011836, 0, 1, 0.5686275, 1,
-0.2016262, -0.8896494, -3.667648, 0, 1, 0.572549, 1,
-0.2008267, -0.1404895, -2.322845, 0, 1, 0.5803922, 1,
-0.1994566, -0.9874192, -2.816539, 0, 1, 0.5843138, 1,
-0.1990274, -1.341956, -3.189341, 0, 1, 0.5921569, 1,
-0.1938428, 1.232946, -0.5652945, 0, 1, 0.5960785, 1,
-0.1917166, -0.4577878, -3.336774, 0, 1, 0.6039216, 1,
-0.1907714, -0.1139822, -0.581131, 0, 1, 0.6117647, 1,
-0.189399, 0.7468076, 0.03886447, 0, 1, 0.6156863, 1,
-0.1891338, 0.4892852, -1.397624, 0, 1, 0.6235294, 1,
-0.188286, 0.8362767, 1.009163, 0, 1, 0.627451, 1,
-0.1850338, 0.4990721, -1.165462, 0, 1, 0.6352941, 1,
-0.1838837, 1.045561, 0.2195057, 0, 1, 0.6392157, 1,
-0.1826603, 0.2891126, -0.5069624, 0, 1, 0.6470588, 1,
-0.1813121, 0.4744156, 0.4157166, 0, 1, 0.6509804, 1,
-0.177251, 0.6199201, -1.406736, 0, 1, 0.6588235, 1,
-0.1761958, -0.4288055, -0.615757, 0, 1, 0.6627451, 1,
-0.1725378, 0.3000216, -0.1942485, 0, 1, 0.6705883, 1,
-0.1712317, -0.1031134, -2.148909, 0, 1, 0.6745098, 1,
-0.1682675, 1.968676, -1.432458, 0, 1, 0.682353, 1,
-0.1676537, 0.04724815, -1.609869, 0, 1, 0.6862745, 1,
-0.1570445, 0.186791, -1.998767, 0, 1, 0.6941177, 1,
-0.1557955, -0.236981, -2.216532, 0, 1, 0.7019608, 1,
-0.1546335, -1.1885, -3.443285, 0, 1, 0.7058824, 1,
-0.1528617, -2.64041, -4.13113, 0, 1, 0.7137255, 1,
-0.1496763, 1.418014, 0.09660882, 0, 1, 0.7176471, 1,
-0.1473988, 0.1097712, -0.297372, 0, 1, 0.7254902, 1,
-0.1399987, 1.229939, -1.250016, 0, 1, 0.7294118, 1,
-0.1250872, 0.1334282, -1.783096, 0, 1, 0.7372549, 1,
-0.1237225, -1.209955, -3.781238, 0, 1, 0.7411765, 1,
-0.1191361, 0.364007, 0.8350754, 0, 1, 0.7490196, 1,
-0.1175294, -2.366333, -3.29732, 0, 1, 0.7529412, 1,
-0.1162159, -2.17204, -3.788716, 0, 1, 0.7607843, 1,
-0.1160894, -0.7685832, -3.561717, 0, 1, 0.7647059, 1,
-0.1156397, 0.3809582, 0.403049, 0, 1, 0.772549, 1,
-0.1141903, -0.4597255, -2.714211, 0, 1, 0.7764706, 1,
-0.1121344, 0.03639651, -1.734295, 0, 1, 0.7843137, 1,
-0.1120809, -1.39603, -3.102993, 0, 1, 0.7882353, 1,
-0.1095982, -0.9676003, -3.127009, 0, 1, 0.7960784, 1,
-0.1045159, -0.03155006, -3.107035, 0, 1, 0.8039216, 1,
-0.1033023, 0.4307322, 0.7005057, 0, 1, 0.8078431, 1,
-0.1022978, 0.939258, -1.057161, 0, 1, 0.8156863, 1,
-0.1016563, 0.9641476, -0.3240204, 0, 1, 0.8196079, 1,
-0.09984151, -1.077348, -4.415012, 0, 1, 0.827451, 1,
-0.09834057, -0.3408973, -3.75873, 0, 1, 0.8313726, 1,
-0.08526429, -0.767823, -2.009925, 0, 1, 0.8392157, 1,
-0.08393203, 0.4132535, -2.753265, 0, 1, 0.8431373, 1,
-0.08195373, 0.2004219, 0.2613382, 0, 1, 0.8509804, 1,
-0.08025201, 0.1374709, -0.03246928, 0, 1, 0.854902, 1,
-0.07398284, 0.8679543, 0.2988466, 0, 1, 0.8627451, 1,
-0.07312743, -0.8736128, -1.277368, 0, 1, 0.8666667, 1,
-0.0723957, -1.182197, -3.08516, 0, 1, 0.8745098, 1,
-0.07133861, -1.897692, -3.611577, 0, 1, 0.8784314, 1,
-0.07126684, -0.2207605, -2.412549, 0, 1, 0.8862745, 1,
-0.06992461, -0.7554794, -1.436435, 0, 1, 0.8901961, 1,
-0.06879563, -0.1104346, -1.849541, 0, 1, 0.8980392, 1,
-0.06552705, -0.1212241, -2.019261, 0, 1, 0.9058824, 1,
-0.05833221, -0.3110203, -2.44901, 0, 1, 0.9098039, 1,
-0.05748712, -0.6181222, -3.615011, 0, 1, 0.9176471, 1,
-0.05527509, -0.6217554, -1.208948, 0, 1, 0.9215686, 1,
-0.04591434, 0.4624554, -0.9369967, 0, 1, 0.9294118, 1,
-0.04564129, 0.1290326, 0.999326, 0, 1, 0.9333333, 1,
-0.04454771, -1.66616, -3.254224, 0, 1, 0.9411765, 1,
-0.04260411, 0.1199993, 0.1871959, 0, 1, 0.945098, 1,
-0.04240384, 0.2262236, -0.3483708, 0, 1, 0.9529412, 1,
-0.04235494, 1.014779, 0.8216859, 0, 1, 0.9568627, 1,
-0.03992465, -0.3649579, -2.311056, 0, 1, 0.9647059, 1,
-0.03896613, -1.119077, -3.750317, 0, 1, 0.9686275, 1,
-0.03845954, 1.229662, -0.6856153, 0, 1, 0.9764706, 1,
-0.03552709, 1.542836, -0.1053086, 0, 1, 0.9803922, 1,
-0.03295387, -1.047995, -4.562991, 0, 1, 0.9882353, 1,
-0.03210856, -0.4227561, -3.793894, 0, 1, 0.9921569, 1,
-0.02571279, -0.209515, -2.683392, 0, 1, 1, 1,
-0.01802675, -0.9311101, -3.356276, 0, 0.9921569, 1, 1,
-0.01710193, -1.52456, -4.419486, 0, 0.9882353, 1, 1,
-0.01486699, 0.9467394, 0.3568449, 0, 0.9803922, 1, 1,
-0.01140757, 0.9614289, 0.5589483, 0, 0.9764706, 1, 1,
-0.008370267, -0.4580752, -3.29996, 0, 0.9686275, 1, 1,
-0.00727711, 1.726827, 1.438987, 0, 0.9647059, 1, 1,
0.001125111, 1.517187, -0.1432682, 0, 0.9568627, 1, 1,
0.00269953, 0.9382768, 0.3631923, 0, 0.9529412, 1, 1,
0.008727275, -0.8166723, 1.383999, 0, 0.945098, 1, 1,
0.0146956, -1.19333, 0.9491051, 0, 0.9411765, 1, 1,
0.01548668, -0.8921329, 4.873183, 0, 0.9333333, 1, 1,
0.01821281, -0.7904411, 2.689506, 0, 0.9294118, 1, 1,
0.01984994, 0.3610467, 0.6727956, 0, 0.9215686, 1, 1,
0.02575089, 1.558306, 0.02079876, 0, 0.9176471, 1, 1,
0.02582685, -0.35854, 4.074348, 0, 0.9098039, 1, 1,
0.02607063, -0.2086667, 2.259613, 0, 0.9058824, 1, 1,
0.02820506, -0.09524164, 2.412354, 0, 0.8980392, 1, 1,
0.02957671, -0.6113074, 4.215321, 0, 0.8901961, 1, 1,
0.0299472, 1.87016, 0.2274896, 0, 0.8862745, 1, 1,
0.03180604, 0.3415507, 0.406074, 0, 0.8784314, 1, 1,
0.03262927, 0.544767, -0.4464784, 0, 0.8745098, 1, 1,
0.03419776, 0.8210598, -0.1864839, 0, 0.8666667, 1, 1,
0.03623139, 2.025065, 0.6725819, 0, 0.8627451, 1, 1,
0.03971587, 1.084111, -1.660969, 0, 0.854902, 1, 1,
0.04108549, -0.6192469, 0.749299, 0, 0.8509804, 1, 1,
0.04878968, -0.1480302, 3.838093, 0, 0.8431373, 1, 1,
0.04907959, 0.8334391, -0.2757823, 0, 0.8392157, 1, 1,
0.05365811, 0.7041309, -0.8921233, 0, 0.8313726, 1, 1,
0.05373179, 2.512492, 0.5501158, 0, 0.827451, 1, 1,
0.05451864, 0.5882918, -0.2133024, 0, 0.8196079, 1, 1,
0.05564945, 0.619968, -1.958077, 0, 0.8156863, 1, 1,
0.05707996, -1.612595, 2.418002, 0, 0.8078431, 1, 1,
0.06153366, 0.4055309, -1.161729, 0, 0.8039216, 1, 1,
0.06188717, -0.4543562, 2.432849, 0, 0.7960784, 1, 1,
0.06614941, 1.923264, 0.4489108, 0, 0.7882353, 1, 1,
0.07034824, -0.0784701, 2.769186, 0, 0.7843137, 1, 1,
0.07651545, -0.9608735, 2.037647, 0, 0.7764706, 1, 1,
0.07896513, 1.91365, 0.6505232, 0, 0.772549, 1, 1,
0.07942759, -0.3637531, 3.079705, 0, 0.7647059, 1, 1,
0.08310773, 0.1185885, 2.430748, 0, 0.7607843, 1, 1,
0.08373592, -0.7182863, 2.38365, 0, 0.7529412, 1, 1,
0.0843464, -0.5442147, 2.492075, 0, 0.7490196, 1, 1,
0.09107697, -0.6488082, 3.539707, 0, 0.7411765, 1, 1,
0.09389102, 1.234114, -2.229892, 0, 0.7372549, 1, 1,
0.09565308, 0.548241, 1.269063, 0, 0.7294118, 1, 1,
0.09708798, 0.02273224, 4.129265, 0, 0.7254902, 1, 1,
0.09729673, -1.069108, 1.115345, 0, 0.7176471, 1, 1,
0.09824295, 0.2370574, -0.4489111, 0, 0.7137255, 1, 1,
0.1029245, 0.2298365, 1.305959, 0, 0.7058824, 1, 1,
0.1052809, -0.110997, 2.449867, 0, 0.6980392, 1, 1,
0.1071686, -0.6277119, 1.674351, 0, 0.6941177, 1, 1,
0.1072559, 0.5971061, 1.195523, 0, 0.6862745, 1, 1,
0.1096678, 1.223474, 0.0808963, 0, 0.682353, 1, 1,
0.1122995, 2.710938, 1.48321, 0, 0.6745098, 1, 1,
0.1159366, 0.346095, -0.2092446, 0, 0.6705883, 1, 1,
0.1164186, 1.715566, 1.388953, 0, 0.6627451, 1, 1,
0.12167, -0.1133172, 1.927657, 0, 0.6588235, 1, 1,
0.122916, -0.5476174, 3.896753, 0, 0.6509804, 1, 1,
0.1238565, 1.034523, -0.1760447, 0, 0.6470588, 1, 1,
0.1242114, 0.1877727, -1.039977, 0, 0.6392157, 1, 1,
0.1246788, -0.3076358, 3.21129, 0, 0.6352941, 1, 1,
0.1254679, 0.6993553, -0.6230208, 0, 0.627451, 1, 1,
0.1300425, 0.3449924, 1.255353, 0, 0.6235294, 1, 1,
0.1319512, -0.06461016, 4.104961, 0, 0.6156863, 1, 1,
0.1480151, -0.3616684, 1.490772, 0, 0.6117647, 1, 1,
0.1483039, 0.4101467, 0.4087929, 0, 0.6039216, 1, 1,
0.1514677, -0.6354536, 3.050826, 0, 0.5960785, 1, 1,
0.1524667, -0.002435228, 1.957972, 0, 0.5921569, 1, 1,
0.1550382, 0.2320695, 1.149598, 0, 0.5843138, 1, 1,
0.157817, 0.4784132, -0.02413562, 0, 0.5803922, 1, 1,
0.1619478, 2.443108, 2.04341, 0, 0.572549, 1, 1,
0.1643035, -0.9150611, 3.456186, 0, 0.5686275, 1, 1,
0.1666263, -0.02772927, 1.519021, 0, 0.5607843, 1, 1,
0.175349, 0.6570851, -0.1832061, 0, 0.5568628, 1, 1,
0.1805047, -0.7181669, 3.393274, 0, 0.5490196, 1, 1,
0.1825038, -1.420288, 2.598212, 0, 0.5450981, 1, 1,
0.1841666, -0.660005, 2.106802, 0, 0.5372549, 1, 1,
0.1867538, 1.368572, -0.6275271, 0, 0.5333334, 1, 1,
0.1888855, 0.8470917, -0.6855305, 0, 0.5254902, 1, 1,
0.1933317, -0.2707659, 1.347292, 0, 0.5215687, 1, 1,
0.1938442, -1.991725, 5.236849, 0, 0.5137255, 1, 1,
0.1947855, -0.2013484, 1.48164, 0, 0.509804, 1, 1,
0.1954147, -0.2622566, 0.8891161, 0, 0.5019608, 1, 1,
0.1959557, 0.8022784, 2.717384, 0, 0.4941176, 1, 1,
0.1975089, 1.364323, 1.179243, 0, 0.4901961, 1, 1,
0.1994805, 0.8535036, 0.6557617, 0, 0.4823529, 1, 1,
0.2091012, 0.6499519, -0.7067493, 0, 0.4784314, 1, 1,
0.2093797, -1.261716, 2.158996, 0, 0.4705882, 1, 1,
0.2126109, -0.9253299, 2.763708, 0, 0.4666667, 1, 1,
0.2143671, 2.405556, -0.06169103, 0, 0.4588235, 1, 1,
0.2166876, -0.2803048, 1.585046, 0, 0.454902, 1, 1,
0.2223375, 0.1904477, 1.130813, 0, 0.4470588, 1, 1,
0.2269795, -0.1034977, 2.623693, 0, 0.4431373, 1, 1,
0.2288219, 0.5080166, 0.8148263, 0, 0.4352941, 1, 1,
0.2350447, -0.3543861, 1.192223, 0, 0.4313726, 1, 1,
0.2393526, 2.574612, 0.1515909, 0, 0.4235294, 1, 1,
0.2408537, -1.331015, 4.329222, 0, 0.4196078, 1, 1,
0.2414065, 0.3419846, 0.7076032, 0, 0.4117647, 1, 1,
0.2414725, 0.2227511, 2.235581, 0, 0.4078431, 1, 1,
0.2464229, 0.3791575, 1.701331, 0, 0.4, 1, 1,
0.2504973, 0.819216, -0.685132, 0, 0.3921569, 1, 1,
0.2525805, 0.2782618, 1.522792, 0, 0.3882353, 1, 1,
0.2587974, 1.423202, 1.443961, 0, 0.3803922, 1, 1,
0.2617319, 1.032052, 0.1049855, 0, 0.3764706, 1, 1,
0.2662578, -0.674181, 3.845338, 0, 0.3686275, 1, 1,
0.2685912, 0.463237, 0.5322866, 0, 0.3647059, 1, 1,
0.2692968, 0.4462904, 0.8470975, 0, 0.3568628, 1, 1,
0.2719416, -0.618681, 3.996209, 0, 0.3529412, 1, 1,
0.2730465, 1.002683, -0.838815, 0, 0.345098, 1, 1,
0.2741176, -0.8242592, 2.567672, 0, 0.3411765, 1, 1,
0.285565, -0.5878167, 3.982918, 0, 0.3333333, 1, 1,
0.2858382, -0.6241844, 2.607212, 0, 0.3294118, 1, 1,
0.2907537, -0.4500287, 3.237784, 0, 0.3215686, 1, 1,
0.2952461, -0.1546359, 2.96997, 0, 0.3176471, 1, 1,
0.2961992, 0.3072341, 1.113676, 0, 0.3098039, 1, 1,
0.2967228, -0.1010191, 1.847466, 0, 0.3058824, 1, 1,
0.3004811, -0.9061583, 2.698366, 0, 0.2980392, 1, 1,
0.3009858, 2.160765, -0.2055352, 0, 0.2901961, 1, 1,
0.3049288, -0.9313763, 2.901793, 0, 0.2862745, 1, 1,
0.3078926, -0.009795257, 0.8616984, 0, 0.2784314, 1, 1,
0.3088033, 0.05655913, 0.7358872, 0, 0.2745098, 1, 1,
0.3145241, -0.0762737, 0.9777076, 0, 0.2666667, 1, 1,
0.3173942, -1.920992, 1.400212, 0, 0.2627451, 1, 1,
0.3234458, -1.604458, 0.8820801, 0, 0.254902, 1, 1,
0.3238065, 2.001075, 0.1369191, 0, 0.2509804, 1, 1,
0.3244962, 1.10912, -0.5356266, 0, 0.2431373, 1, 1,
0.3245975, -0.5165699, 1.214056, 0, 0.2392157, 1, 1,
0.3284598, -0.8880693, 2.027531, 0, 0.2313726, 1, 1,
0.3292015, 1.740373, 0.1047366, 0, 0.227451, 1, 1,
0.3351222, -0.9783314, 1.541403, 0, 0.2196078, 1, 1,
0.3366967, 0.3685466, -0.5551744, 0, 0.2156863, 1, 1,
0.3379139, 0.4565632, 2.470462, 0, 0.2078431, 1, 1,
0.3435604, 0.9729599, -0.09035161, 0, 0.2039216, 1, 1,
0.3472197, -1.76663, 4.212547, 0, 0.1960784, 1, 1,
0.3543592, 0.6923351, -0.05921392, 0, 0.1882353, 1, 1,
0.3598852, 1.504782, -0.8264332, 0, 0.1843137, 1, 1,
0.3608243, -0.6461631, 3.089874, 0, 0.1764706, 1, 1,
0.366803, 0.8701913, -0.4650194, 0, 0.172549, 1, 1,
0.3709456, -0.5690747, 1.438569, 0, 0.1647059, 1, 1,
0.3754393, 0.6447136, 1.232158, 0, 0.1607843, 1, 1,
0.3782144, -0.8181164, 2.426198, 0, 0.1529412, 1, 1,
0.3788776, 0.448795, 1.062001, 0, 0.1490196, 1, 1,
0.3804007, -0.1255689, 2.32552, 0, 0.1411765, 1, 1,
0.3927174, 0.2345655, 1.985824, 0, 0.1372549, 1, 1,
0.3957522, -0.7982283, 2.220407, 0, 0.1294118, 1, 1,
0.398802, -1.96635, 2.474743, 0, 0.1254902, 1, 1,
0.3988185, -0.7167618, 2.944231, 0, 0.1176471, 1, 1,
0.4022339, -0.225237, 0.9198035, 0, 0.1137255, 1, 1,
0.4055926, -0.726041, 3.154701, 0, 0.1058824, 1, 1,
0.40585, -1.188595, 1.191039, 0, 0.09803922, 1, 1,
0.4087602, 0.2869079, 2.515223, 0, 0.09411765, 1, 1,
0.4098668, -2.348224, 3.149016, 0, 0.08627451, 1, 1,
0.4116374, -0.2198384, 1.284666, 0, 0.08235294, 1, 1,
0.4136772, 0.6474037, -0.6302684, 0, 0.07450981, 1, 1,
0.4203536, 0.8544911, -1.055248, 0, 0.07058824, 1, 1,
0.4217292, -0.0302326, 1.495131, 0, 0.0627451, 1, 1,
0.4249307, -1.906637, 3.262275, 0, 0.05882353, 1, 1,
0.4255145, 0.4900959, 0.8187021, 0, 0.05098039, 1, 1,
0.4307712, 0.458134, -0.7304479, 0, 0.04705882, 1, 1,
0.4323771, 0.4800889, 1.37073, 0, 0.03921569, 1, 1,
0.4326526, 1.201605, -0.5135808, 0, 0.03529412, 1, 1,
0.4333622, -0.9659999, 2.449984, 0, 0.02745098, 1, 1,
0.4343479, -0.7104127, 2.336792, 0, 0.02352941, 1, 1,
0.4355193, 1.124951, 1.116961, 0, 0.01568628, 1, 1,
0.436259, 2.153015, -0.1264621, 0, 0.01176471, 1, 1,
0.4432087, -0.513024, 2.001047, 0, 0.003921569, 1, 1,
0.4493504, -1.448452, 2.653467, 0.003921569, 0, 1, 1,
0.4503587, -1.25577, 3.465746, 0.007843138, 0, 1, 1,
0.4526703, -0.003328048, 2.259537, 0.01568628, 0, 1, 1,
0.4530825, 0.0657035, 1.685467, 0.01960784, 0, 1, 1,
0.4537323, -0.7119541, 1.542142, 0.02745098, 0, 1, 1,
0.454679, -0.8969146, 3.101047, 0.03137255, 0, 1, 1,
0.4550812, 0.2732223, 1.352834, 0.03921569, 0, 1, 1,
0.4569339, 0.2597925, 0.2957736, 0.04313726, 0, 1, 1,
0.4601102, 0.2366305, 1.601077, 0.05098039, 0, 1, 1,
0.4653213, -0.5213863, 3.101347, 0.05490196, 0, 1, 1,
0.467904, 2.594976, -0.6028644, 0.0627451, 0, 1, 1,
0.4725105, -1.329003, 3.272302, 0.06666667, 0, 1, 1,
0.4731424, 0.579027, 0.3081921, 0.07450981, 0, 1, 1,
0.4762265, 1.237398, 0.2446744, 0.07843138, 0, 1, 1,
0.4773896, -0.4356004, 2.58878, 0.08627451, 0, 1, 1,
0.4796179, -1.527145, 3.612063, 0.09019608, 0, 1, 1,
0.4808609, 2.243187, -0.3955852, 0.09803922, 0, 1, 1,
0.4818757, -0.8919953, 1.877601, 0.1058824, 0, 1, 1,
0.4830653, -1.167134, 3.308273, 0.1098039, 0, 1, 1,
0.4841973, -0.4137003, 2.967478, 0.1176471, 0, 1, 1,
0.4871857, 0.9913532, -1.247904, 0.1215686, 0, 1, 1,
0.4948387, 1.54278, -0.4039062, 0.1294118, 0, 1, 1,
0.4992742, -1.57204, 3.156589, 0.1333333, 0, 1, 1,
0.4999861, -0.6401534, 2.356767, 0.1411765, 0, 1, 1,
0.5020461, 0.2478051, 1.473885, 0.145098, 0, 1, 1,
0.5055208, -0.04754564, 1.946058, 0.1529412, 0, 1, 1,
0.5060117, -0.5506487, 3.899972, 0.1568628, 0, 1, 1,
0.5073082, 0.9004569, 0.6496834, 0.1647059, 0, 1, 1,
0.511364, 0.5960051, 0.6118705, 0.1686275, 0, 1, 1,
0.5129679, 0.1031739, 1.972586, 0.1764706, 0, 1, 1,
0.519366, 1.422595, -0.5002827, 0.1803922, 0, 1, 1,
0.5237936, 0.2555882, 0.9299537, 0.1882353, 0, 1, 1,
0.5238289, 0.07063254, 0.7912503, 0.1921569, 0, 1, 1,
0.5296245, -0.4955485, 4.459987, 0.2, 0, 1, 1,
0.529703, 0.0179014, 0.2061416, 0.2078431, 0, 1, 1,
0.5331134, 0.9164138, 1.664688, 0.2117647, 0, 1, 1,
0.5340274, 0.1300378, 2.91276, 0.2196078, 0, 1, 1,
0.5343212, -0.4384809, 4.420856, 0.2235294, 0, 1, 1,
0.5364779, -0.4739626, 1.064817, 0.2313726, 0, 1, 1,
0.539184, -0.7254837, 0.6827908, 0.2352941, 0, 1, 1,
0.5488879, 2.66201, -0.06867879, 0.2431373, 0, 1, 1,
0.5510767, 0.8115388, 0.2091248, 0.2470588, 0, 1, 1,
0.5574257, -1.478789, 5.406218, 0.254902, 0, 1, 1,
0.5591642, -0.394282, 1.221975, 0.2588235, 0, 1, 1,
0.5602531, 0.503365, 1.439811, 0.2666667, 0, 1, 1,
0.5609947, 1.141154, -0.4422494, 0.2705882, 0, 1, 1,
0.5642925, 1.39275, 0.1291743, 0.2784314, 0, 1, 1,
0.5667779, 0.1677185, 0.8475611, 0.282353, 0, 1, 1,
0.5669581, 0.6762079, 0.0263746, 0.2901961, 0, 1, 1,
0.5683017, -0.9109391, 4.262749, 0.2941177, 0, 1, 1,
0.5692703, 1.020013, 1.621354, 0.3019608, 0, 1, 1,
0.5738225, 0.5456122, 1.042787, 0.3098039, 0, 1, 1,
0.5740664, 0.9900745, 1.325879, 0.3137255, 0, 1, 1,
0.5747291, -0.526233, 1.771446, 0.3215686, 0, 1, 1,
0.5803969, 0.07139977, -1.259053, 0.3254902, 0, 1, 1,
0.5808218, 0.2676544, -0.1517318, 0.3333333, 0, 1, 1,
0.588142, 0.3125303, 1.003167, 0.3372549, 0, 1, 1,
0.5904787, -0.4425595, 4.06328, 0.345098, 0, 1, 1,
0.5926213, 1.355564, 1.038307, 0.3490196, 0, 1, 1,
0.5945508, 2.270433, -0.3140795, 0.3568628, 0, 1, 1,
0.5947716, -0.1117841, 0.8476145, 0.3607843, 0, 1, 1,
0.5956751, -0.8622676, 1.234136, 0.3686275, 0, 1, 1,
0.5975416, -0.02106727, 1.992223, 0.372549, 0, 1, 1,
0.5986861, -1.080269, 2.763026, 0.3803922, 0, 1, 1,
0.5998792, -0.2171012, 2.061021, 0.3843137, 0, 1, 1,
0.6042233, -0.6855909, 0.6122337, 0.3921569, 0, 1, 1,
0.6096783, -1.785198, 2.579526, 0.3960784, 0, 1, 1,
0.6111735, -2.765683, 2.895828, 0.4039216, 0, 1, 1,
0.6126675, -2.253135, 2.961659, 0.4117647, 0, 1, 1,
0.6129296, -0.9649256, 1.65182, 0.4156863, 0, 1, 1,
0.618778, 0.4979942, 2.975092, 0.4235294, 0, 1, 1,
0.6233748, -1.360407, 1.396911, 0.427451, 0, 1, 1,
0.6246299, -0.5862974, 3.050746, 0.4352941, 0, 1, 1,
0.6273168, 0.2570233, 0.3181261, 0.4392157, 0, 1, 1,
0.6288434, -0.1427684, 2.060231, 0.4470588, 0, 1, 1,
0.631072, -0.09767312, 2.370169, 0.4509804, 0, 1, 1,
0.638409, -1.140166, 3.006186, 0.4588235, 0, 1, 1,
0.6433856, 0.09170306, -0.6406951, 0.4627451, 0, 1, 1,
0.6463397, -0.7875707, 2.038597, 0.4705882, 0, 1, 1,
0.6471187, 0.7561091, 2.331658, 0.4745098, 0, 1, 1,
0.6494841, 1.675103, 1.637956, 0.4823529, 0, 1, 1,
0.6499504, 1.238339, 1.165137, 0.4862745, 0, 1, 1,
0.6510324, 1.175371, 2.241765, 0.4941176, 0, 1, 1,
0.6569824, -1.201377, 3.529023, 0.5019608, 0, 1, 1,
0.6580282, -0.4552023, 4.412814, 0.5058824, 0, 1, 1,
0.6591938, 0.8130051, 0.702728, 0.5137255, 0, 1, 1,
0.6593538, 0.1637092, 0.4692392, 0.5176471, 0, 1, 1,
0.6595467, -0.719362, 3.210345, 0.5254902, 0, 1, 1,
0.6604234, -1.729469, 2.821596, 0.5294118, 0, 1, 1,
0.6606451, 0.991408, 0.7755283, 0.5372549, 0, 1, 1,
0.6615352, -1.993056, 3.747199, 0.5411765, 0, 1, 1,
0.6618053, -0.995243, 3.539405, 0.5490196, 0, 1, 1,
0.6634883, -0.1222148, 0.9828882, 0.5529412, 0, 1, 1,
0.6645644, 0.8231193, 1.433198, 0.5607843, 0, 1, 1,
0.6674501, 1.086662, 0.3605088, 0.5647059, 0, 1, 1,
0.6695921, 1.449287, -0.7305511, 0.572549, 0, 1, 1,
0.6708708, -0.8956573, 2.802079, 0.5764706, 0, 1, 1,
0.673055, 1.218168, 2.040998, 0.5843138, 0, 1, 1,
0.678006, -0.72079, 1.717607, 0.5882353, 0, 1, 1,
0.6792343, 0.3030642, 0.6801338, 0.5960785, 0, 1, 1,
0.6809838, -0.553987, 1.100913, 0.6039216, 0, 1, 1,
0.6835697, 1.512297, 0.8205175, 0.6078432, 0, 1, 1,
0.6870607, 0.2792191, -1.240505, 0.6156863, 0, 1, 1,
0.688597, 0.514169, 0.2109739, 0.6196079, 0, 1, 1,
0.6887337, 2.249481, 0.7340362, 0.627451, 0, 1, 1,
0.6891595, -1.255799, 1.748081, 0.6313726, 0, 1, 1,
0.6922626, 0.9573102, 0.09264786, 0.6392157, 0, 1, 1,
0.69411, -0.4139214, 2.575351, 0.6431373, 0, 1, 1,
0.6989169, 0.5989373, -1.067691, 0.6509804, 0, 1, 1,
0.7015306, 0.2172396, 3.164333, 0.654902, 0, 1, 1,
0.7026096, -1.714796, 2.559667, 0.6627451, 0, 1, 1,
0.7039453, 0.7609763, 0.7419143, 0.6666667, 0, 1, 1,
0.7122092, -0.2922292, 0.1540679, 0.6745098, 0, 1, 1,
0.7179542, 1.185903, 1.447555, 0.6784314, 0, 1, 1,
0.7185298, -1.327303, 3.383446, 0.6862745, 0, 1, 1,
0.7188448, -2.206575, 1.721485, 0.6901961, 0, 1, 1,
0.7219809, -1.502186, 2.873418, 0.6980392, 0, 1, 1,
0.7290298, -0.7967671, 3.251984, 0.7058824, 0, 1, 1,
0.7290616, -0.3281193, 2.334905, 0.7098039, 0, 1, 1,
0.7346948, 2.26232, -0.08409116, 0.7176471, 0, 1, 1,
0.7354472, 0.8464635, -0.5658295, 0.7215686, 0, 1, 1,
0.7364179, -0.4065437, 1.750451, 0.7294118, 0, 1, 1,
0.7424882, 0.6170489, 1.470859, 0.7333333, 0, 1, 1,
0.7430001, 0.06830129, 1.877961, 0.7411765, 0, 1, 1,
0.7433305, -0.06385355, 1.761544, 0.7450981, 0, 1, 1,
0.7436939, 0.6888381, 0.931752, 0.7529412, 0, 1, 1,
0.7470208, 2.736344, 2.774414, 0.7568628, 0, 1, 1,
0.7472443, -1.079138, 0.7889683, 0.7647059, 0, 1, 1,
0.7512725, 0.4052706, 1.292795, 0.7686275, 0, 1, 1,
0.7579944, -0.4626634, 1.976745, 0.7764706, 0, 1, 1,
0.7610642, 0.4535977, 2.400527, 0.7803922, 0, 1, 1,
0.7623987, 0.4641002, -0.6687873, 0.7882353, 0, 1, 1,
0.7679585, 0.8611581, 1.829342, 0.7921569, 0, 1, 1,
0.7714343, 0.475098, 0.3023784, 0.8, 0, 1, 1,
0.7761977, -0.97705, 3.678767, 0.8078431, 0, 1, 1,
0.7797851, 1.263815, -1.959041, 0.8117647, 0, 1, 1,
0.7828134, 0.6670297, 1.011873, 0.8196079, 0, 1, 1,
0.7910444, 0.4214728, 0.002423693, 0.8235294, 0, 1, 1,
0.7961602, 0.4088036, 1.221631, 0.8313726, 0, 1, 1,
0.7964334, 0.4398936, -0.4430774, 0.8352941, 0, 1, 1,
0.7995973, 0.3270809, -0.2742467, 0.8431373, 0, 1, 1,
0.8003346, -1.330765, 1.715229, 0.8470588, 0, 1, 1,
0.8055654, 0.2028486, 0.7275741, 0.854902, 0, 1, 1,
0.8070642, -0.7029048, 1.433723, 0.8588235, 0, 1, 1,
0.807285, -1.130524, 1.415415, 0.8666667, 0, 1, 1,
0.8082546, 1.881312, -0.2205046, 0.8705882, 0, 1, 1,
0.8148045, -1.373912, 2.052896, 0.8784314, 0, 1, 1,
0.8294436, -0.6327121, 3.482254, 0.8823529, 0, 1, 1,
0.8299446, 0.6169716, 2.489463, 0.8901961, 0, 1, 1,
0.8481903, -0.06647925, 0.5077971, 0.8941177, 0, 1, 1,
0.8486677, -0.002887065, 0.5974032, 0.9019608, 0, 1, 1,
0.8523591, -0.5268083, 4.110723, 0.9098039, 0, 1, 1,
0.8538485, -2.462418, 2.122213, 0.9137255, 0, 1, 1,
0.8579852, 1.119418, 0.5205082, 0.9215686, 0, 1, 1,
0.8646982, 0.3940434, 1.748126, 0.9254902, 0, 1, 1,
0.8686771, 1.14195, 0.9597142, 0.9333333, 0, 1, 1,
0.8728504, 0.09257001, 0.8662639, 0.9372549, 0, 1, 1,
0.8813829, 0.03881218, 0.4627912, 0.945098, 0, 1, 1,
0.8831953, 0.7376519, 0.1507358, 0.9490196, 0, 1, 1,
0.8837335, 0.1745785, 1.087798, 0.9568627, 0, 1, 1,
0.885705, -0.8311988, 1.797774, 0.9607843, 0, 1, 1,
0.8861021, -0.03706859, 0.7095056, 0.9686275, 0, 1, 1,
0.8868567, -0.83933, 1.982383, 0.972549, 0, 1, 1,
0.8900141, -2.637874, 2.475412, 0.9803922, 0, 1, 1,
0.8939061, -0.5176523, 1.636526, 0.9843137, 0, 1, 1,
0.9069809, -0.4859671, 2.321031, 0.9921569, 0, 1, 1,
0.9091989, 0.2913165, 2.126905, 0.9960784, 0, 1, 1,
0.9120153, -0.4182099, 1.913532, 1, 0, 0.9960784, 1,
0.9157565, 0.1597248, 0.8742387, 1, 0, 0.9882353, 1,
0.920935, 0.6460198, 0.2470045, 1, 0, 0.9843137, 1,
0.9218916, -0.2618248, 4.370272, 1, 0, 0.9764706, 1,
0.9275752, 1.255309, 0.4762471, 1, 0, 0.972549, 1,
0.9296301, 0.5028172, 0.7644844, 1, 0, 0.9647059, 1,
0.9297492, 0.1026611, 0.9362424, 1, 0, 0.9607843, 1,
0.9335544, 0.7777288, 0.8309071, 1, 0, 0.9529412, 1,
0.9367358, -1.837993, 1.401588, 1, 0, 0.9490196, 1,
0.9375936, -0.1080564, 2.42403, 1, 0, 0.9411765, 1,
0.9381121, -0.1555071, 2.702348, 1, 0, 0.9372549, 1,
0.9386365, -0.3869277, 1.1197, 1, 0, 0.9294118, 1,
0.9445504, 1.269273, -0.4434699, 1, 0, 0.9254902, 1,
0.9473699, -0.4975478, -0.5747907, 1, 0, 0.9176471, 1,
0.9545619, -1.482395, 2.970064, 1, 0, 0.9137255, 1,
0.9558516, -0.6023481, 2.350033, 1, 0, 0.9058824, 1,
0.9692153, -1.484505, 2.851185, 1, 0, 0.9019608, 1,
0.9908746, -0.04504012, 0.6650949, 1, 0, 0.8941177, 1,
0.9972718, -0.4996122, 0.908649, 1, 0, 0.8862745, 1,
1.000008, 0.4485155, 1.293537, 1, 0, 0.8823529, 1,
1.00176, -0.5372306, 2.815309, 1, 0, 0.8745098, 1,
1.004953, -0.03400598, 0.5941824, 1, 0, 0.8705882, 1,
1.007152, 1.091969, 1.461087, 1, 0, 0.8627451, 1,
1.009515, -0.09205705, 1.164643, 1, 0, 0.8588235, 1,
1.010177, 0.5053698, 2.178872, 1, 0, 0.8509804, 1,
1.010918, -0.2836548, 1.171236, 1, 0, 0.8470588, 1,
1.014822, -0.2883427, 3.000994, 1, 0, 0.8392157, 1,
1.017868, 1.223992, 0.2365205, 1, 0, 0.8352941, 1,
1.021651, -0.4359851, 2.722541, 1, 0, 0.827451, 1,
1.026886, -1.739629, 2.34101, 1, 0, 0.8235294, 1,
1.041795, -2.197148, 2.253547, 1, 0, 0.8156863, 1,
1.041941, -0.3439897, 1.211858, 1, 0, 0.8117647, 1,
1.043694, 0.5795206, 2.374388, 1, 0, 0.8039216, 1,
1.048515, 2.685953, -0.7754056, 1, 0, 0.7960784, 1,
1.056062, -0.1110986, 2.243055, 1, 0, 0.7921569, 1,
1.059148, 1.437602, 2.018562, 1, 0, 0.7843137, 1,
1.077048, -1.339889, 2.563351, 1, 0, 0.7803922, 1,
1.082888, 0.9791318, 1.629584, 1, 0, 0.772549, 1,
1.085513, 1.514929, -0.2734852, 1, 0, 0.7686275, 1,
1.087536, -1.202108, 2.359564, 1, 0, 0.7607843, 1,
1.096104, 0.06250737, 1.633171, 1, 0, 0.7568628, 1,
1.098382, -1.413328, 1.608948, 1, 0, 0.7490196, 1,
1.100125, -2.026868, 1.297856, 1, 0, 0.7450981, 1,
1.112456, 0.5302679, 0.730519, 1, 0, 0.7372549, 1,
1.115602, -1.221897, 2.617137, 1, 0, 0.7333333, 1,
1.118668, 0.3861533, 3.434634, 1, 0, 0.7254902, 1,
1.124419, -0.5415348, 1.978867, 1, 0, 0.7215686, 1,
1.126888, 0.9289516, 0.4368983, 1, 0, 0.7137255, 1,
1.128903, 0.4657819, 1.901614, 1, 0, 0.7098039, 1,
1.130998, -1.139252, 0.2619218, 1, 0, 0.7019608, 1,
1.139742, -1.03205, 2.315604, 1, 0, 0.6941177, 1,
1.14692, -1.049812, 2.071232, 1, 0, 0.6901961, 1,
1.149011, -0.3079991, 1.245163, 1, 0, 0.682353, 1,
1.150574, -2.101389, 3.663738, 1, 0, 0.6784314, 1,
1.160116, 0.3958286, -0.03146556, 1, 0, 0.6705883, 1,
1.176638, -1.36671, 3.082151, 1, 0, 0.6666667, 1,
1.180996, 0.02315841, 1.694125, 1, 0, 0.6588235, 1,
1.186274, 1.607653, 0.9593883, 1, 0, 0.654902, 1,
1.191899, 1.508764, 2.346792, 1, 0, 0.6470588, 1,
1.199685, -0.8626374, 1.541072, 1, 0, 0.6431373, 1,
1.208985, 0.3175232, 0.9022027, 1, 0, 0.6352941, 1,
1.210812, 0.3107184, 2.111599, 1, 0, 0.6313726, 1,
1.219727, 0.05541747, 1.666797, 1, 0, 0.6235294, 1,
1.222571, -0.9768465, 2.717605, 1, 0, 0.6196079, 1,
1.225581, -0.5334187, 1.920966, 1, 0, 0.6117647, 1,
1.233829, 0.7095357, -0.8165794, 1, 0, 0.6078432, 1,
1.240328, -1.956135, 1.947005, 1, 0, 0.6, 1,
1.250611, -0.511531, 2.727545, 1, 0, 0.5921569, 1,
1.251036, 0.1064303, 0.846191, 1, 0, 0.5882353, 1,
1.253342, 1.459603, 1.59025, 1, 0, 0.5803922, 1,
1.253807, -0.1500172, 1.373968, 1, 0, 0.5764706, 1,
1.27337, -0.3298644, 1.001239, 1, 0, 0.5686275, 1,
1.273866, -0.2602865, 0.2033433, 1, 0, 0.5647059, 1,
1.281877, 0.8603368, 1.321876, 1, 0, 0.5568628, 1,
1.284496, -0.4458827, 3.632112, 1, 0, 0.5529412, 1,
1.286713, 0.5946833, 0.2543264, 1, 0, 0.5450981, 1,
1.291439, 0.09285241, 0.4412584, 1, 0, 0.5411765, 1,
1.298134, -0.9535664, 1.937733, 1, 0, 0.5333334, 1,
1.307, -0.06061139, 2.103079, 1, 0, 0.5294118, 1,
1.311912, -0.6609822, 3.26057, 1, 0, 0.5215687, 1,
1.318153, -0.7942352, 1.768524, 1, 0, 0.5176471, 1,
1.320195, -0.1714145, 1.435819, 1, 0, 0.509804, 1,
1.320385, 0.2331793, 0.5865937, 1, 0, 0.5058824, 1,
1.324865, -0.1619022, 1.294999, 1, 0, 0.4980392, 1,
1.325243, 0.5793817, -0.7097258, 1, 0, 0.4901961, 1,
1.325971, 0.7168783, 0.196698, 1, 0, 0.4862745, 1,
1.339277, 0.6649646, -1.456, 1, 0, 0.4784314, 1,
1.344854, -0.4711511, 3.349994, 1, 0, 0.4745098, 1,
1.353206, 1.587318, 0.2358615, 1, 0, 0.4666667, 1,
1.368066, -1.055305, 1.328923, 1, 0, 0.4627451, 1,
1.368479, -1.751927, 3.19757, 1, 0, 0.454902, 1,
1.37197, 0.7722801, -0.3249341, 1, 0, 0.4509804, 1,
1.374238, -1.886687, 1.012197, 1, 0, 0.4431373, 1,
1.393008, 0.7203781, 0.4596115, 1, 0, 0.4392157, 1,
1.393265, -1.905585, 1.624503, 1, 0, 0.4313726, 1,
1.405546, 0.3338075, 1.598756, 1, 0, 0.427451, 1,
1.425963, -1.350165, 0.9209055, 1, 0, 0.4196078, 1,
1.434314, -0.1743018, 2.796374, 1, 0, 0.4156863, 1,
1.436399, 0.373298, 1.610532, 1, 0, 0.4078431, 1,
1.43719, 0.7144074, -0.07014401, 1, 0, 0.4039216, 1,
1.468529, -0.3475059, 0.9629032, 1, 0, 0.3960784, 1,
1.469335, -1.613587, 2.087005, 1, 0, 0.3882353, 1,
1.476819, 0.2664452, 1.344527, 1, 0, 0.3843137, 1,
1.480841, 0.1525351, 1.437931, 1, 0, 0.3764706, 1,
1.494351, -1.45536, 4.227429, 1, 0, 0.372549, 1,
1.523376, -0.01650825, 1.677085, 1, 0, 0.3647059, 1,
1.52732, -0.4823163, 1.014705, 1, 0, 0.3607843, 1,
1.536299, 0.8882773, 0.5488363, 1, 0, 0.3529412, 1,
1.543906, 0.5792135, 2.497481, 1, 0, 0.3490196, 1,
1.548916, 0.9351012, 0.7343619, 1, 0, 0.3411765, 1,
1.549271, -1.303326, 3.039227, 1, 0, 0.3372549, 1,
1.552748, 1.192807, 1.408552, 1, 0, 0.3294118, 1,
1.584805, -2.586702, 4.578258, 1, 0, 0.3254902, 1,
1.591651, 0.2962115, 0.8517208, 1, 0, 0.3176471, 1,
1.611321, 1.224747, 2.637456, 1, 0, 0.3137255, 1,
1.628208, -1.36018, 0.2392955, 1, 0, 0.3058824, 1,
1.639064, -0.05044584, 1.500035, 1, 0, 0.2980392, 1,
1.641277, -0.7810456, 1.058543, 1, 0, 0.2941177, 1,
1.653989, 1.018936, 0.04190101, 1, 0, 0.2862745, 1,
1.666482, 0.1261668, 2.466659, 1, 0, 0.282353, 1,
1.677153, -0.7307847, 1.382336, 1, 0, 0.2745098, 1,
1.690962, 1.597711, 1.289009, 1, 0, 0.2705882, 1,
1.702038, 0.1737274, -0.0247451, 1, 0, 0.2627451, 1,
1.720272, 0.5419292, 1.525206, 1, 0, 0.2588235, 1,
1.727508, -0.6131783, 0.6346485, 1, 0, 0.2509804, 1,
1.728014, 0.5312692, 0.7526888, 1, 0, 0.2470588, 1,
1.744642, 0.599884, 1.14821, 1, 0, 0.2392157, 1,
1.749084, -0.8129855, 0.243698, 1, 0, 0.2352941, 1,
1.769908, 0.105959, 1.860218, 1, 0, 0.227451, 1,
1.772332, 1.238207, -0.3504069, 1, 0, 0.2235294, 1,
1.783921, 0.7695224, 2.171939, 1, 0, 0.2156863, 1,
1.800097, 0.06596346, 1.277132, 1, 0, 0.2117647, 1,
1.821574, 0.585899, 1.028859, 1, 0, 0.2039216, 1,
1.824972, -0.2106982, 1.777225, 1, 0, 0.1960784, 1,
1.844485, -1.507972, 2.031068, 1, 0, 0.1921569, 1,
1.869169, -1.312976, 1.70503, 1, 0, 0.1843137, 1,
1.871488, 0.5431329, 1.493229, 1, 0, 0.1803922, 1,
1.873127, -0.8297078, 1.859248, 1, 0, 0.172549, 1,
1.877411, 0.07303896, 3.21211, 1, 0, 0.1686275, 1,
1.887846, 1.406527, 2.195854, 1, 0, 0.1607843, 1,
1.920802, 0.2556571, 1.858226, 1, 0, 0.1568628, 1,
1.925006, 1.47399, -0.2276043, 1, 0, 0.1490196, 1,
1.945494, -0.3793072, 0.9518254, 1, 0, 0.145098, 1,
1.959465, 0.1893378, 2.918135, 1, 0, 0.1372549, 1,
1.964777, 0.1920056, 1.780038, 1, 0, 0.1333333, 1,
2.007517, -0.9485562, 1.205876, 1, 0, 0.1254902, 1,
2.014117, 1.706617, 0.5189235, 1, 0, 0.1215686, 1,
2.048033, -0.1101648, -0.2089512, 1, 0, 0.1137255, 1,
2.063229, -0.835777, 2.170254, 1, 0, 0.1098039, 1,
2.086624, 0.8436705, 1.059803, 1, 0, 0.1019608, 1,
2.089308, -0.5119413, 0.8896877, 1, 0, 0.09411765, 1,
2.095162, -0.8991369, 0.6024296, 1, 0, 0.09019608, 1,
2.104046, 0.02962594, 0.7514769, 1, 0, 0.08235294, 1,
2.134794, -0.3049576, 1.881407, 1, 0, 0.07843138, 1,
2.167366, -0.5722925, 2.013717, 1, 0, 0.07058824, 1,
2.24663, 2.661109, 1.231456, 1, 0, 0.06666667, 1,
2.270517, -1.287668, 0.8935417, 1, 0, 0.05882353, 1,
2.303223, -0.8021687, -0.2115738, 1, 0, 0.05490196, 1,
2.377265, 1.699568, 3.17689, 1, 0, 0.04705882, 1,
2.385874, -0.751995, 0.6973858, 1, 0, 0.04313726, 1,
2.397745, 0.139901, 2.42119, 1, 0, 0.03529412, 1,
2.445563, 0.0798912, 0.2251965, 1, 0, 0.03137255, 1,
2.468095, -0.2594166, 1.218455, 1, 0, 0.02352941, 1,
2.614264, 0.5541747, 0.8744951, 1, 0, 0.01960784, 1,
2.848607, 0.07669466, 1.675808, 1, 0, 0.01176471, 1,
3.142514, 1.555713, 1.594503, 1, 0, 0.007843138, 1
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
-0.2135509, -4.13594, -6.884155, 0, -0.5, 0.5, 0.5,
-0.2135509, -4.13594, -6.884155, 1, -0.5, 0.5, 0.5,
-0.2135509, -4.13594, -6.884155, 1, 1.5, 0.5, 0.5,
-0.2135509, -4.13594, -6.884155, 0, 1.5, 0.5, 0.5
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
-4.707323, -0.1775607, -6.884155, 0, -0.5, 0.5, 0.5,
-4.707323, -0.1775607, -6.884155, 1, -0.5, 0.5, 0.5,
-4.707323, -0.1775607, -6.884155, 1, 1.5, 0.5, 0.5,
-4.707323, -0.1775607, -6.884155, 0, 1.5, 0.5, 0.5
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
-4.707323, -4.13594, 0.1516759, 0, -0.5, 0.5, 0.5,
-4.707323, -4.13594, 0.1516759, 1, -0.5, 0.5, 0.5,
-4.707323, -4.13594, 0.1516759, 1, 1.5, 0.5, 0.5,
-4.707323, -4.13594, 0.1516759, 0, 1.5, 0.5, 0.5
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
-3, -3.222468, -5.260502,
3, -3.222468, -5.260502,
-3, -3.222468, -5.260502,
-3, -3.374713, -5.531111,
-2, -3.222468, -5.260502,
-2, -3.374713, -5.531111,
-1, -3.222468, -5.260502,
-1, -3.374713, -5.531111,
0, -3.222468, -5.260502,
0, -3.374713, -5.531111,
1, -3.222468, -5.260502,
1, -3.374713, -5.531111,
2, -3.222468, -5.260502,
2, -3.374713, -5.531111,
3, -3.222468, -5.260502,
3, -3.374713, -5.531111
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
-3, -3.679204, -6.072329, 0, -0.5, 0.5, 0.5,
-3, -3.679204, -6.072329, 1, -0.5, 0.5, 0.5,
-3, -3.679204, -6.072329, 1, 1.5, 0.5, 0.5,
-3, -3.679204, -6.072329, 0, 1.5, 0.5, 0.5,
-2, -3.679204, -6.072329, 0, -0.5, 0.5, 0.5,
-2, -3.679204, -6.072329, 1, -0.5, 0.5, 0.5,
-2, -3.679204, -6.072329, 1, 1.5, 0.5, 0.5,
-2, -3.679204, -6.072329, 0, 1.5, 0.5, 0.5,
-1, -3.679204, -6.072329, 0, -0.5, 0.5, 0.5,
-1, -3.679204, -6.072329, 1, -0.5, 0.5, 0.5,
-1, -3.679204, -6.072329, 1, 1.5, 0.5, 0.5,
-1, -3.679204, -6.072329, 0, 1.5, 0.5, 0.5,
0, -3.679204, -6.072329, 0, -0.5, 0.5, 0.5,
0, -3.679204, -6.072329, 1, -0.5, 0.5, 0.5,
0, -3.679204, -6.072329, 1, 1.5, 0.5, 0.5,
0, -3.679204, -6.072329, 0, 1.5, 0.5, 0.5,
1, -3.679204, -6.072329, 0, -0.5, 0.5, 0.5,
1, -3.679204, -6.072329, 1, -0.5, 0.5, 0.5,
1, -3.679204, -6.072329, 1, 1.5, 0.5, 0.5,
1, -3.679204, -6.072329, 0, 1.5, 0.5, 0.5,
2, -3.679204, -6.072329, 0, -0.5, 0.5, 0.5,
2, -3.679204, -6.072329, 1, -0.5, 0.5, 0.5,
2, -3.679204, -6.072329, 1, 1.5, 0.5, 0.5,
2, -3.679204, -6.072329, 0, 1.5, 0.5, 0.5,
3, -3.679204, -6.072329, 0, -0.5, 0.5, 0.5,
3, -3.679204, -6.072329, 1, -0.5, 0.5, 0.5,
3, -3.679204, -6.072329, 1, 1.5, 0.5, 0.5,
3, -3.679204, -6.072329, 0, 1.5, 0.5, 0.5
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
-3.670298, -3, -5.260502,
-3.670298, 2, -5.260502,
-3.670298, -3, -5.260502,
-3.843136, -3, -5.531111,
-3.670298, -2, -5.260502,
-3.843136, -2, -5.531111,
-3.670298, -1, -5.260502,
-3.843136, -1, -5.531111,
-3.670298, 0, -5.260502,
-3.843136, 0, -5.531111,
-3.670298, 1, -5.260502,
-3.843136, 1, -5.531111,
-3.670298, 2, -5.260502,
-3.843136, 2, -5.531111
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
-4.18881, -3, -6.072329, 0, -0.5, 0.5, 0.5,
-4.18881, -3, -6.072329, 1, -0.5, 0.5, 0.5,
-4.18881, -3, -6.072329, 1, 1.5, 0.5, 0.5,
-4.18881, -3, -6.072329, 0, 1.5, 0.5, 0.5,
-4.18881, -2, -6.072329, 0, -0.5, 0.5, 0.5,
-4.18881, -2, -6.072329, 1, -0.5, 0.5, 0.5,
-4.18881, -2, -6.072329, 1, 1.5, 0.5, 0.5,
-4.18881, -2, -6.072329, 0, 1.5, 0.5, 0.5,
-4.18881, -1, -6.072329, 0, -0.5, 0.5, 0.5,
-4.18881, -1, -6.072329, 1, -0.5, 0.5, 0.5,
-4.18881, -1, -6.072329, 1, 1.5, 0.5, 0.5,
-4.18881, -1, -6.072329, 0, 1.5, 0.5, 0.5,
-4.18881, 0, -6.072329, 0, -0.5, 0.5, 0.5,
-4.18881, 0, -6.072329, 1, -0.5, 0.5, 0.5,
-4.18881, 0, -6.072329, 1, 1.5, 0.5, 0.5,
-4.18881, 0, -6.072329, 0, 1.5, 0.5, 0.5,
-4.18881, 1, -6.072329, 0, -0.5, 0.5, 0.5,
-4.18881, 1, -6.072329, 1, -0.5, 0.5, 0.5,
-4.18881, 1, -6.072329, 1, 1.5, 0.5, 0.5,
-4.18881, 1, -6.072329, 0, 1.5, 0.5, 0.5,
-4.18881, 2, -6.072329, 0, -0.5, 0.5, 0.5,
-4.18881, 2, -6.072329, 1, -0.5, 0.5, 0.5,
-4.18881, 2, -6.072329, 1, 1.5, 0.5, 0.5,
-4.18881, 2, -6.072329, 0, 1.5, 0.5, 0.5
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
-3.670298, -3.222468, -4,
-3.670298, -3.222468, 4,
-3.670298, -3.222468, -4,
-3.843136, -3.374713, -4,
-3.670298, -3.222468, -2,
-3.843136, -3.374713, -2,
-3.670298, -3.222468, 0,
-3.843136, -3.374713, 0,
-3.670298, -3.222468, 2,
-3.843136, -3.374713, 2,
-3.670298, -3.222468, 4,
-3.843136, -3.374713, 4
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
-4.18881, -3.679204, -4, 0, -0.5, 0.5, 0.5,
-4.18881, -3.679204, -4, 1, -0.5, 0.5, 0.5,
-4.18881, -3.679204, -4, 1, 1.5, 0.5, 0.5,
-4.18881, -3.679204, -4, 0, 1.5, 0.5, 0.5,
-4.18881, -3.679204, -2, 0, -0.5, 0.5, 0.5,
-4.18881, -3.679204, -2, 1, -0.5, 0.5, 0.5,
-4.18881, -3.679204, -2, 1, 1.5, 0.5, 0.5,
-4.18881, -3.679204, -2, 0, 1.5, 0.5, 0.5,
-4.18881, -3.679204, 0, 0, -0.5, 0.5, 0.5,
-4.18881, -3.679204, 0, 1, -0.5, 0.5, 0.5,
-4.18881, -3.679204, 0, 1, 1.5, 0.5, 0.5,
-4.18881, -3.679204, 0, 0, 1.5, 0.5, 0.5,
-4.18881, -3.679204, 2, 0, -0.5, 0.5, 0.5,
-4.18881, -3.679204, 2, 1, -0.5, 0.5, 0.5,
-4.18881, -3.679204, 2, 1, 1.5, 0.5, 0.5,
-4.18881, -3.679204, 2, 0, 1.5, 0.5, 0.5,
-4.18881, -3.679204, 4, 0, -0.5, 0.5, 0.5,
-4.18881, -3.679204, 4, 1, -0.5, 0.5, 0.5,
-4.18881, -3.679204, 4, 1, 1.5, 0.5, 0.5,
-4.18881, -3.679204, 4, 0, 1.5, 0.5, 0.5
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
-3.670298, -3.222468, -5.260502,
-3.670298, 2.867347, -5.260502,
-3.670298, -3.222468, 5.563854,
-3.670298, 2.867347, 5.563854,
-3.670298, -3.222468, -5.260502,
-3.670298, -3.222468, 5.563854,
-3.670298, 2.867347, -5.260502,
-3.670298, 2.867347, 5.563854,
-3.670298, -3.222468, -5.260502,
3.243196, -3.222468, -5.260502,
-3.670298, -3.222468, 5.563854,
3.243196, -3.222468, 5.563854,
-3.670298, 2.867347, -5.260502,
3.243196, 2.867347, -5.260502,
-3.670298, 2.867347, 5.563854,
3.243196, 2.867347, 5.563854,
3.243196, -3.222468, -5.260502,
3.243196, 2.867347, -5.260502,
3.243196, -3.222468, 5.563854,
3.243196, 2.867347, 5.563854,
3.243196, -3.222468, -5.260502,
3.243196, -3.222468, 5.563854,
3.243196, 2.867347, -5.260502,
3.243196, 2.867347, 5.563854
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
var radius = 7.590209;
var distance = 33.7697;
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
mvMatrix.translate( 0.2135509, 0.1775607, -0.1516759 );
mvMatrix.scale( 1.187053, 1.347608, 0.7581682 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.7697);
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
fluquinconazole<-read.table("fluquinconazole.xyz")
```

```
## Error in read.table("fluquinconazole.xyz"): no lines available in input
```

```r
x<-fluquinconazole$V2
```

```
## Error in eval(expr, envir, enclos): object 'fluquinconazole' not found
```

```r
y<-fluquinconazole$V3
```

```
## Error in eval(expr, envir, enclos): object 'fluquinconazole' not found
```

```r
z<-fluquinconazole$V4
```

```
## Error in eval(expr, envir, enclos): object 'fluquinconazole' not found
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
-3.569616, 0.4136503, -0.4067038, 0, 0, 1, 1, 1,
-3.09033, -0.3722007, -0.7076981, 1, 0, 0, 1, 1,
-3.041982, -0.6244022, -2.433093, 1, 0, 0, 1, 1,
-2.901416, 1.213541, -1.996475, 1, 0, 0, 1, 1,
-2.812873, -1.87233, -0.7608325, 1, 0, 0, 1, 1,
-2.687405, 0.2519832, -1.046104, 1, 0, 0, 1, 1,
-2.65486, -0.2170857, -1.778016, 0, 0, 0, 1, 1,
-2.652603, 0.830085, -1.584592, 0, 0, 0, 1, 1,
-2.582513, -1.772125, -2.850569, 0, 0, 0, 1, 1,
-2.575513, 0.3591719, -2.889996, 0, 0, 0, 1, 1,
-2.573799, -1.162682, -1.850997, 0, 0, 0, 1, 1,
-2.544891, 0.2841675, -2.047909, 0, 0, 0, 1, 1,
-2.529466, 0.1277328, -1.091049, 0, 0, 0, 1, 1,
-2.402733, -1.660897, -2.719173, 1, 1, 1, 1, 1,
-2.341104, 1.036369, -1.254785, 1, 1, 1, 1, 1,
-2.332745, -0.4749563, -1.604583, 1, 1, 1, 1, 1,
-2.295765, -1.519776, -2.469343, 1, 1, 1, 1, 1,
-2.276553, 1.218021, -3.241418, 1, 1, 1, 1, 1,
-2.250115, -0.6683462, -2.033436, 1, 1, 1, 1, 1,
-2.164921, -1.601496, -1.613888, 1, 1, 1, 1, 1,
-2.145268, -0.3348351, -2.339229, 1, 1, 1, 1, 1,
-2.133402, 0.2331429, -0.2408331, 1, 1, 1, 1, 1,
-2.130019, -1.129538, -0.8939263, 1, 1, 1, 1, 1,
-2.079886, -1.636084, -0.9771398, 1, 1, 1, 1, 1,
-2.068227, 0.5431508, -1.833892, 1, 1, 1, 1, 1,
-2.053923, -0.9510399, -1.954984, 1, 1, 1, 1, 1,
-2.044539, -1.551805, -3.649022, 1, 1, 1, 1, 1,
-1.991777, 1.354548, 0.2867699, 1, 1, 1, 1, 1,
-1.983019, -0.5982463, -1.588072, 0, 0, 1, 1, 1,
-1.981952, 0.6551719, -0.4891437, 1, 0, 0, 1, 1,
-1.897679, -0.1850678, -2.402549, 1, 0, 0, 1, 1,
-1.865245, -0.5948347, -0.8155275, 1, 0, 0, 1, 1,
-1.855794, 0.444275, -0.6657884, 1, 0, 0, 1, 1,
-1.840086, 0.3369785, -0.3763647, 1, 0, 0, 1, 1,
-1.815759, -1.300648, -3.800072, 0, 0, 0, 1, 1,
-1.814344, -1.46569, -2.559422, 0, 0, 0, 1, 1,
-1.795285, -0.07552227, 1.144691, 0, 0, 0, 1, 1,
-1.793904, -0.5413151, -2.635684, 0, 0, 0, 1, 1,
-1.780604, 0.2465436, -0.06034131, 0, 0, 0, 1, 1,
-1.764869, 1.360276, -0.6932964, 0, 0, 0, 1, 1,
-1.76161, -1.029391, -3.046875, 0, 0, 0, 1, 1,
-1.733343, 1.249437, -1.999473, 1, 1, 1, 1, 1,
-1.713316, -0.02837788, -0.8826569, 1, 1, 1, 1, 1,
-1.712569, -0.4270598, -1.004051, 1, 1, 1, 1, 1,
-1.693055, 1.27932, -0.1330999, 1, 1, 1, 1, 1,
-1.677022, 0.4190348, -1.512791, 1, 1, 1, 1, 1,
-1.668367, 0.4157522, -2.544158, 1, 1, 1, 1, 1,
-1.658182, -0.1382524, -1.183409, 1, 1, 1, 1, 1,
-1.656708, 0.06296715, -2.127573, 1, 1, 1, 1, 1,
-1.651248, 0.6120957, -0.6554268, 1, 1, 1, 1, 1,
-1.612709, 0.6858416, -0.09305864, 1, 1, 1, 1, 1,
-1.590763, 0.2386657, -1.669922, 1, 1, 1, 1, 1,
-1.58709, -0.4673989, -1.099484, 1, 1, 1, 1, 1,
-1.586156, 0.3245631, 0.06093103, 1, 1, 1, 1, 1,
-1.557133, -0.3199344, -1.043407, 1, 1, 1, 1, 1,
-1.530155, -0.9174624, -3.079697, 1, 1, 1, 1, 1,
-1.521868, 1.443055, -1.706892, 0, 0, 1, 1, 1,
-1.502929, 0.1101558, -1.878105, 1, 0, 0, 1, 1,
-1.496888, -0.6478785, -0.4879124, 1, 0, 0, 1, 1,
-1.482245, -0.8579621, -0.7487101, 1, 0, 0, 1, 1,
-1.481548, -0.5041123, -1.835131, 1, 0, 0, 1, 1,
-1.468749, 1.286187, -1.149606, 1, 0, 0, 1, 1,
-1.442028, -0.8755956, -1.335883, 0, 0, 0, 1, 1,
-1.436066, -0.6691769, -3.432846, 0, 0, 0, 1, 1,
-1.431012, -1.883361, -1.799674, 0, 0, 0, 1, 1,
-1.420026, 0.8067548, -2.610321, 0, 0, 0, 1, 1,
-1.401933, 0.3564526, -0.6150247, 0, 0, 0, 1, 1,
-1.399925, -0.8133568, 0.1321107, 0, 0, 0, 1, 1,
-1.398381, -1.775291, -2.353004, 0, 0, 0, 1, 1,
-1.385292, 0.1747951, -1.106027, 1, 1, 1, 1, 1,
-1.381665, 0.4599164, -0.8098859, 1, 1, 1, 1, 1,
-1.379189, 0.6012691, -2.195535, 1, 1, 1, 1, 1,
-1.378471, -0.1514063, -0.3117022, 1, 1, 1, 1, 1,
-1.377907, -0.8741193, 0.1735807, 1, 1, 1, 1, 1,
-1.37654, 0.0498502, -1.634665, 1, 1, 1, 1, 1,
-1.376031, -0.6014357, 0.3998657, 1, 1, 1, 1, 1,
-1.364141, 1.369833, -0.9196719, 1, 1, 1, 1, 1,
-1.356514, 0.1484097, -1.618485, 1, 1, 1, 1, 1,
-1.347977, -1.209108, -2.004424, 1, 1, 1, 1, 1,
-1.333916, -0.6123536, -1.988168, 1, 1, 1, 1, 1,
-1.324003, -0.4025819, -3.607203, 1, 1, 1, 1, 1,
-1.318465, 0.7123011, -0.8632081, 1, 1, 1, 1, 1,
-1.316444, -1.534354, -3.254483, 1, 1, 1, 1, 1,
-1.313437, 1.643473, -1.144647, 1, 1, 1, 1, 1,
-1.312878, 0.6093253, 0.2100161, 0, 0, 1, 1, 1,
-1.311633, 2.053537, 0.01779577, 1, 0, 0, 1, 1,
-1.307223, -0.9282131, -2.126575, 1, 0, 0, 1, 1,
-1.304075, -1.339689, -1.810689, 1, 0, 0, 1, 1,
-1.279638, -0.1700693, -0.07216535, 1, 0, 0, 1, 1,
-1.276937, 0.69718, -1.269938, 1, 0, 0, 1, 1,
-1.274317, 0.4286362, -1.847833, 0, 0, 0, 1, 1,
-1.274307, -0.7393591, -1.786209, 0, 0, 0, 1, 1,
-1.269684, -0.4061173, -1.930454, 0, 0, 0, 1, 1,
-1.2655, 0.1959606, -0.5795828, 0, 0, 0, 1, 1,
-1.255103, -0.6524814, -1.666796, 0, 0, 0, 1, 1,
-1.251815, 0.527505, -0.2659128, 0, 0, 0, 1, 1,
-1.227354, -0.4486167, -0.7817711, 0, 0, 0, 1, 1,
-1.224223, 0.0239701, -1.419054, 1, 1, 1, 1, 1,
-1.220863, -0.1388875, -0.4598645, 1, 1, 1, 1, 1,
-1.220592, -0.2863786, -0.9477503, 1, 1, 1, 1, 1,
-1.213302, -1.56325, -3.822394, 1, 1, 1, 1, 1,
-1.209095, 0.6234823, -1.891878, 1, 1, 1, 1, 1,
-1.196825, 0.3598365, -2.950029, 1, 1, 1, 1, 1,
-1.195479, -2.44762, -1.444951, 1, 1, 1, 1, 1,
-1.18763, -1.329997, -1.708343, 1, 1, 1, 1, 1,
-1.185161, -0.4510098, -2.954175, 1, 1, 1, 1, 1,
-1.182001, 0.06879973, -2.007505, 1, 1, 1, 1, 1,
-1.180147, -1.399377, -2.439457, 1, 1, 1, 1, 1,
-1.177039, 0.09536453, -2.294502, 1, 1, 1, 1, 1,
-1.167987, -2.30716, -2.671005, 1, 1, 1, 1, 1,
-1.159341, 0.9306939, -2.092541, 1, 1, 1, 1, 1,
-1.136971, 0.3441291, -1.504884, 1, 1, 1, 1, 1,
-1.134703, 0.9267098, -0.1535091, 0, 0, 1, 1, 1,
-1.134081, 0.002855743, -1.100764, 1, 0, 0, 1, 1,
-1.13322, -1.344584, -1.972031, 1, 0, 0, 1, 1,
-1.121333, -0.5591226, -2.525117, 1, 0, 0, 1, 1,
-1.118219, -0.7587595, -1.831596, 1, 0, 0, 1, 1,
-1.104664, -1.036001, -3.745469, 1, 0, 0, 1, 1,
-1.101866, 0.1158986, -1.791058, 0, 0, 0, 1, 1,
-1.099475, -0.001949258, -2.586577, 0, 0, 0, 1, 1,
-1.099022, -1.279149, -2.001773, 0, 0, 0, 1, 1,
-1.096466, 0.08434743, -0.9953119, 0, 0, 0, 1, 1,
-1.094778, -0.8709124, -2.536954, 0, 0, 0, 1, 1,
-1.093375, -0.4800829, -2.242312, 0, 0, 0, 1, 1,
-1.091485, -0.5626569, -1.313282, 0, 0, 0, 1, 1,
-1.090304, -1.268993, -1.630921, 1, 1, 1, 1, 1,
-1.086167, 0.1929919, -1.620404, 1, 1, 1, 1, 1,
-1.071482, -0.3429011, -1.887369, 1, 1, 1, 1, 1,
-1.060654, 0.1279745, -1.585274, 1, 1, 1, 1, 1,
-1.056482, 1.602312, -1.2753, 1, 1, 1, 1, 1,
-1.055108, -1.729838, -2.678146, 1, 1, 1, 1, 1,
-1.050778, -0.06574743, -1.855283, 1, 1, 1, 1, 1,
-1.050108, 0.263362, -1.999584, 1, 1, 1, 1, 1,
-1.044871, 0.4818285, -1.817679, 1, 1, 1, 1, 1,
-1.043745, -0.9112346, -1.986866, 1, 1, 1, 1, 1,
-1.040766, -0.0672299, -1.070899, 1, 1, 1, 1, 1,
-1.039775, -0.2810334, -1.240427, 1, 1, 1, 1, 1,
-1.038991, 2.289162, -1.604629, 1, 1, 1, 1, 1,
-1.035982, -0.2469793, -2.070009, 1, 1, 1, 1, 1,
-1.026596, 0.6746358, -1.760398, 1, 1, 1, 1, 1,
-1.026413, 0.8789232, 0.01511057, 0, 0, 1, 1, 1,
-1.024929, 0.9430726, -2.556726, 1, 0, 0, 1, 1,
-1.020061, 0.621668, -0.7796811, 1, 0, 0, 1, 1,
-1.019813, -0.140279, -0.5541208, 1, 0, 0, 1, 1,
-1.010196, 1.920647, 0.8513695, 1, 0, 0, 1, 1,
-1.009975, -0.1150717, -2.838574, 1, 0, 0, 1, 1,
-1.007922, 0.216517, 0.1148856, 0, 0, 0, 1, 1,
-1.004237, 1.245653, -0.229419, 0, 0, 0, 1, 1,
-1.002582, 1.38134, -0.7731021, 0, 0, 0, 1, 1,
-1.000159, 1.51074, 0.4311081, 0, 0, 0, 1, 1,
-0.9979842, -0.01981817, -1.406955, 0, 0, 0, 1, 1,
-0.9926729, -0.9356497, -2.468513, 0, 0, 0, 1, 1,
-0.9901947, -0.9018681, -4.079969, 0, 0, 0, 1, 1,
-0.9855349, 1.148685, -0.7361233, 1, 1, 1, 1, 1,
-0.978639, -0.2524721, -2.331409, 1, 1, 1, 1, 1,
-0.9719536, 0.7726212, 0.9132037, 1, 1, 1, 1, 1,
-0.9691915, -1.725822, -2.49912, 1, 1, 1, 1, 1,
-0.966688, 1.08475, -0.4304329, 1, 1, 1, 1, 1,
-0.9651334, -1.883549, -3.702153, 1, 1, 1, 1, 1,
-0.9639929, -1.808039, -2.207753, 1, 1, 1, 1, 1,
-0.9443519, 0.5455696, -1.784254, 1, 1, 1, 1, 1,
-0.9419266, -1.345414, -4.797931, 1, 1, 1, 1, 1,
-0.9416617, -0.5301841, -1.936176, 1, 1, 1, 1, 1,
-0.9386587, -0.4306834, 0.133728, 1, 1, 1, 1, 1,
-0.9321902, -1.35365, -3.128914, 1, 1, 1, 1, 1,
-0.9252563, 1.024809, -1.238639, 1, 1, 1, 1, 1,
-0.9224615, -0.4808567, -0.8961341, 1, 1, 1, 1, 1,
-0.913089, -0.161129, -2.89857, 1, 1, 1, 1, 1,
-0.9040871, 0.6618337, -1.093424, 0, 0, 1, 1, 1,
-0.9037057, -0.5783662, -0.7107384, 1, 0, 0, 1, 1,
-0.8923097, -0.4498801, -1.323745, 1, 0, 0, 1, 1,
-0.8866005, -0.994294, -2.361968, 1, 0, 0, 1, 1,
-0.87813, 0.2873977, 0.1631853, 1, 0, 0, 1, 1,
-0.8753529, -0.135201, -0.7280887, 1, 0, 0, 1, 1,
-0.8728234, 0.09619723, -2.922137, 0, 0, 0, 1, 1,
-0.8697194, 0.6904274, -3.466284, 0, 0, 0, 1, 1,
-0.8645778, -0.3894495, -2.822128, 0, 0, 0, 1, 1,
-0.8643541, -3.133781, -4.764687, 0, 0, 0, 1, 1,
-0.8597252, -0.01688715, -2.032076, 0, 0, 0, 1, 1,
-0.8594561, -1.004889, 1.321468, 0, 0, 0, 1, 1,
-0.8454384, -0.7356113, -4.2848, 0, 0, 0, 1, 1,
-0.8361074, 2.77866, -1.352835, 1, 1, 1, 1, 1,
-0.8295237, -0.3516109, -1.707051, 1, 1, 1, 1, 1,
-0.8271821, -0.7222669, -0.399196, 1, 1, 1, 1, 1,
-0.8253197, 2.073622, -2.457722, 1, 1, 1, 1, 1,
-0.8235893, -2.020557, -1.76689, 1, 1, 1, 1, 1,
-0.822183, 0.643584, -0.7514192, 1, 1, 1, 1, 1,
-0.8195187, 0.679051, -0.9074402, 1, 1, 1, 1, 1,
-0.8174942, 0.6413268, 0.8806936, 1, 1, 1, 1, 1,
-0.8147236, -0.06798059, -2.167973, 1, 1, 1, 1, 1,
-0.8125923, -0.3338537, -2.367687, 1, 1, 1, 1, 1,
-0.8111168, -0.9948145, -4.03719, 1, 1, 1, 1, 1,
-0.8087935, 0.4956124, -1.215073, 1, 1, 1, 1, 1,
-0.8070691, 0.6399341, 1.87116, 1, 1, 1, 1, 1,
-0.8070163, 1.480013, -0.4387777, 1, 1, 1, 1, 1,
-0.8058541, 0.5862822, -0.8195924, 1, 1, 1, 1, 1,
-0.8020203, 1.447257, -2.080017, 0, 0, 1, 1, 1,
-0.80103, 1.624857, -1.221536, 1, 0, 0, 1, 1,
-0.7960885, -1.568197, -3.532248, 1, 0, 0, 1, 1,
-0.7957528, 0.7723849, -0.8635519, 1, 0, 0, 1, 1,
-0.7956265, -1.395827, -3.843281, 1, 0, 0, 1, 1,
-0.7938456, -1.30293, -2.230738, 1, 0, 0, 1, 1,
-0.7872061, -1.622298, -2.072325, 0, 0, 0, 1, 1,
-0.7869914, -1.27328, -2.73368, 0, 0, 0, 1, 1,
-0.7851173, -0.5203314, -0.9401873, 0, 0, 0, 1, 1,
-0.7851154, -0.1123876, -1.170549, 0, 0, 0, 1, 1,
-0.7848014, -0.6230515, -2.207296, 0, 0, 0, 1, 1,
-0.7834759, 2.180748, -1.355056, 0, 0, 0, 1, 1,
-0.7830436, 1.898886, 0.0325675, 0, 0, 0, 1, 1,
-0.7821637, 0.9320995, -0.8385952, 1, 1, 1, 1, 1,
-0.776931, -0.7391592, -2.901641, 1, 1, 1, 1, 1,
-0.7755585, -1.781136, -2.835629, 1, 1, 1, 1, 1,
-0.7745019, 0.9745693, -0.7279582, 1, 1, 1, 1, 1,
-0.7736272, 1.155538, 0.6008442, 1, 1, 1, 1, 1,
-0.7718554, 0.6431229, -2.688633, 1, 1, 1, 1, 1,
-0.77008, 1.8274, -0.2667766, 1, 1, 1, 1, 1,
-0.7682654, -1.489286, -2.550574, 1, 1, 1, 1, 1,
-0.7603526, -1.83539, -2.945431, 1, 1, 1, 1, 1,
-0.7574612, -1.881799, -3.443575, 1, 1, 1, 1, 1,
-0.7552917, 1.71319, -1.659085, 1, 1, 1, 1, 1,
-0.7549056, 0.03081264, -1.836991, 1, 1, 1, 1, 1,
-0.7545276, 0.8372191, 0.2262398, 1, 1, 1, 1, 1,
-0.7527246, 0.1558332, -0.8698847, 1, 1, 1, 1, 1,
-0.7507578, 0.7577954, -0.1287445, 1, 1, 1, 1, 1,
-0.750394, 0.1243321, -1.042775, 0, 0, 1, 1, 1,
-0.7493606, 2.045398, -1.524697, 1, 0, 0, 1, 1,
-0.7470728, 1.059674, -2.043602, 1, 0, 0, 1, 1,
-0.7469596, 0.3386117, -0.03667787, 1, 0, 0, 1, 1,
-0.7438516, 1.03151, -0.9924166, 1, 0, 0, 1, 1,
-0.7399046, -0.2607652, -2.453544, 1, 0, 0, 1, 1,
-0.7389473, 1.35182, -0.09978521, 0, 0, 0, 1, 1,
-0.7366881, -0.8984314, -2.0572, 0, 0, 0, 1, 1,
-0.7323452, -0.5913154, -2.799661, 0, 0, 0, 1, 1,
-0.7307673, 0.04240577, -2.984774, 0, 0, 0, 1, 1,
-0.7293543, 0.6015683, -1.368152, 0, 0, 0, 1, 1,
-0.7274926, 1.671342, 0.2570486, 0, 0, 0, 1, 1,
-0.7206975, 1.418478, -1.03779, 0, 0, 0, 1, 1,
-0.7194104, -0.8654578, -1.381872, 1, 1, 1, 1, 1,
-0.718821, 1.126551, -1.001225, 1, 1, 1, 1, 1,
-0.7182229, 0.1077062, 0.7537163, 1, 1, 1, 1, 1,
-0.7180553, -1.092271, -2.564832, 1, 1, 1, 1, 1,
-0.7095391, -0.3505465, -1.793588, 1, 1, 1, 1, 1,
-0.7094041, 0.4603494, -1.699883, 1, 1, 1, 1, 1,
-0.7089072, -0.08741074, -1.916131, 1, 1, 1, 1, 1,
-0.7088982, 0.661529, -0.8739251, 1, 1, 1, 1, 1,
-0.7053441, 0.1859415, -2.454365, 1, 1, 1, 1, 1,
-0.703294, 0.8844637, -0.1933347, 1, 1, 1, 1, 1,
-0.7008315, 0.8992204, -0.1648681, 1, 1, 1, 1, 1,
-0.7000976, -1.239844, -3.574714, 1, 1, 1, 1, 1,
-0.6983948, 0.1098263, -0.4663658, 1, 1, 1, 1, 1,
-0.6909238, 0.0172733, -0.5754951, 1, 1, 1, 1, 1,
-0.6905725, 0.2417776, -0.8428519, 1, 1, 1, 1, 1,
-0.6759893, -0.3415992, -0.7306271, 0, 0, 1, 1, 1,
-0.6753902, -1.634285, -1.960023, 1, 0, 0, 1, 1,
-0.665099, 0.7608007, -2.466011, 1, 0, 0, 1, 1,
-0.6631687, -1.355368, -3.197765, 1, 0, 0, 1, 1,
-0.6581702, -0.3039545, -0.305508, 1, 0, 0, 1, 1,
-0.6569716, -0.2217005, -2.926348, 1, 0, 0, 1, 1,
-0.6546805, 0.7336268, -1.555207, 0, 0, 0, 1, 1,
-0.6529075, -1.141169, -3.185278, 0, 0, 0, 1, 1,
-0.6469609, 0.08126602, -0.8395314, 0, 0, 0, 1, 1,
-0.6439974, -0.7021652, -0.6726628, 0, 0, 0, 1, 1,
-0.6437044, -1.24603, -4.303302, 0, 0, 0, 1, 1,
-0.639838, -0.3984411, -2.830443, 0, 0, 0, 1, 1,
-0.6341339, -0.6580765, -2.529876, 0, 0, 0, 1, 1,
-0.6337293, 0.465468, -1.733307, 1, 1, 1, 1, 1,
-0.6200202, 0.168699, -0.2363515, 1, 1, 1, 1, 1,
-0.6155746, 1.263238, -0.4893368, 1, 1, 1, 1, 1,
-0.6135122, 0.6389715, -0.4107912, 1, 1, 1, 1, 1,
-0.6115068, 0.5944618, -1.400499, 1, 1, 1, 1, 1,
-0.6032999, 0.582866, -0.1534446, 1, 1, 1, 1, 1,
-0.602091, -0.7131076, -1.041642, 1, 1, 1, 1, 1,
-0.601248, -0.7167599, -2.152153, 1, 1, 1, 1, 1,
-0.5983241, -0.8792498, -2.102235, 1, 1, 1, 1, 1,
-0.5946974, -1.095676, -1.958656, 1, 1, 1, 1, 1,
-0.5937926, 0.3129595, -1.451738, 1, 1, 1, 1, 1,
-0.5875585, 1.919062, -1.106437, 1, 1, 1, 1, 1,
-0.5859411, 1.060781, -0.6687801, 1, 1, 1, 1, 1,
-0.5857107, 0.01851961, -1.068842, 1, 1, 1, 1, 1,
-0.5823495, -0.8141429, -1.432442, 1, 1, 1, 1, 1,
-0.5764151, -0.2251936, -3.007407, 0, 0, 1, 1, 1,
-0.5761841, -1.581202, -3.245817, 1, 0, 0, 1, 1,
-0.5753608, 0.3929503, -1.190828, 1, 0, 0, 1, 1,
-0.5730644, 0.9470215, -0.4357872, 1, 0, 0, 1, 1,
-0.5726311, -1.71846, -3.897311, 1, 0, 0, 1, 1,
-0.5724143, -2.550464, -2.185852, 1, 0, 0, 1, 1,
-0.5702432, 0.4296325, -1.033609, 0, 0, 0, 1, 1,
-0.5631593, 1.085048, -0.4474295, 0, 0, 0, 1, 1,
-0.5568031, 0.07288534, -1.685896, 0, 0, 0, 1, 1,
-0.5558004, -1.50482, -3.975302, 0, 0, 0, 1, 1,
-0.5520716, -0.7236597, -2.053858, 0, 0, 0, 1, 1,
-0.5513139, -0.2106106, -2.619726, 0, 0, 0, 1, 1,
-0.5478017, 0.005446971, -0.4407954, 0, 0, 0, 1, 1,
-0.5467452, -0.7962434, -4.273101, 1, 1, 1, 1, 1,
-0.5446125, -0.5338969, -2.661674, 1, 1, 1, 1, 1,
-0.5416693, -2.71553, -3.316613, 1, 1, 1, 1, 1,
-0.5413573, -1.102281, -2.688557, 1, 1, 1, 1, 1,
-0.5412129, 0.805661, -0.9073154, 1, 1, 1, 1, 1,
-0.5364281, -0.6787238, -1.794835, 1, 1, 1, 1, 1,
-0.5360351, 0.4574518, -1.208054, 1, 1, 1, 1, 1,
-0.5295942, -0.7288916, -3.757698, 1, 1, 1, 1, 1,
-0.5268054, 2.234619, -0.5818474, 1, 1, 1, 1, 1,
-0.5242925, 1.012232, -2.203196, 1, 1, 1, 1, 1,
-0.5171126, 0.08489703, -0.8966138, 1, 1, 1, 1, 1,
-0.515919, 1.319924, -1.349624, 1, 1, 1, 1, 1,
-0.5136618, 1.593723, -0.1722325, 1, 1, 1, 1, 1,
-0.5136351, 0.1726659, -0.3593473, 1, 1, 1, 1, 1,
-0.5123862, 0.2783786, -2.129049, 1, 1, 1, 1, 1,
-0.5117402, -1.376693, -2.343672, 0, 0, 1, 1, 1,
-0.5060319, 0.5591472, -1.605279, 1, 0, 0, 1, 1,
-0.5024799, 0.1561308, -1.451035, 1, 0, 0, 1, 1,
-0.5001093, 0.5452729, -0.4971487, 1, 0, 0, 1, 1,
-0.4999611, 0.5946349, -0.07325821, 1, 0, 0, 1, 1,
-0.499881, 1.121375, -0.6042059, 1, 0, 0, 1, 1,
-0.4990162, -0.5662946, -0.2374929, 0, 0, 0, 1, 1,
-0.4957454, -1.135219, -2.776748, 0, 0, 0, 1, 1,
-0.4949488, 0.5625757, -0.3752249, 0, 0, 0, 1, 1,
-0.4942368, -1.56998, -5.102866, 0, 0, 0, 1, 1,
-0.4920166, 1.868593, -2.23157, 0, 0, 0, 1, 1,
-0.490731, 0.3645826, -0.3511315, 0, 0, 0, 1, 1,
-0.4880711, -0.4075455, -3.451844, 0, 0, 0, 1, 1,
-0.4862233, 0.6515338, -0.06152306, 1, 1, 1, 1, 1,
-0.4847051, 0.6357296, -0.2938307, 1, 1, 1, 1, 1,
-0.4804639, -0.7741477, -3.283584, 1, 1, 1, 1, 1,
-0.4785628, 0.3738878, -0.06894801, 1, 1, 1, 1, 1,
-0.4765157, -1.485941, -2.819345, 1, 1, 1, 1, 1,
-0.4633979, -0.3404178, -2.341985, 1, 1, 1, 1, 1,
-0.4614701, 1.462571, -0.7158224, 1, 1, 1, 1, 1,
-0.4611522, -0.2985206, -3.59146, 1, 1, 1, 1, 1,
-0.459087, -0.1164124, -2.559266, 1, 1, 1, 1, 1,
-0.4577284, 0.5316556, -2.369027, 1, 1, 1, 1, 1,
-0.4506413, 0.9629169, -1.112587, 1, 1, 1, 1, 1,
-0.4501412, 1.278845, 0.5857395, 1, 1, 1, 1, 1,
-0.4469121, 0.9789116, -0.5788222, 1, 1, 1, 1, 1,
-0.4459531, -0.2513517, -3.313665, 1, 1, 1, 1, 1,
-0.4459296, 0.2143182, -0.2434114, 1, 1, 1, 1, 1,
-0.4434011, -1.960717, -1.484532, 0, 0, 1, 1, 1,
-0.4407049, 0.05815748, -1.069219, 1, 0, 0, 1, 1,
-0.4401098, 1.279532, -0.02232829, 1, 0, 0, 1, 1,
-0.4390038, 0.8061205, 0.154427, 1, 0, 0, 1, 1,
-0.4389502, -0.6443822, -3.17968, 1, 0, 0, 1, 1,
-0.4384101, -2.074792, -4.361989, 1, 0, 0, 1, 1,
-0.4383321, -1.380954, -3.040337, 0, 0, 0, 1, 1,
-0.4382365, 0.1057714, -1.347028, 0, 0, 0, 1, 1,
-0.4285929, 0.6460522, -0.1767294, 0, 0, 0, 1, 1,
-0.4248934, -1.249097, -2.520257, 0, 0, 0, 1, 1,
-0.4246408, 0.3060307, -0.7241349, 0, 0, 0, 1, 1,
-0.4237876, 1.183719, -2.135786, 0, 0, 0, 1, 1,
-0.4182962, -0.3613294, -1.508598, 0, 0, 0, 1, 1,
-0.4152536, -0.7850093, -4.839403, 1, 1, 1, 1, 1,
-0.4121035, -0.9971367, -1.950614, 1, 1, 1, 1, 1,
-0.4064283, 1.153496, 0.1602179, 1, 1, 1, 1, 1,
-0.4001876, 1.602002, -1.267626, 1, 1, 1, 1, 1,
-0.3967836, -0.1391065, -1.041433, 1, 1, 1, 1, 1,
-0.3946207, 0.1587057, -1.030717, 1, 1, 1, 1, 1,
-0.39002, -1.196948, -1.433859, 1, 1, 1, 1, 1,
-0.3882704, -0.02601926, -2.658818, 1, 1, 1, 1, 1,
-0.3862572, 1.950598, -0.8600854, 1, 1, 1, 1, 1,
-0.3828341, -0.1951812, -3.306002, 1, 1, 1, 1, 1,
-0.3735069, 0.5501483, -1.063454, 1, 1, 1, 1, 1,
-0.3733942, 1.221437, 1.246271, 1, 1, 1, 1, 1,
-0.3727636, -0.1031573, -1.419101, 1, 1, 1, 1, 1,
-0.3722253, 0.09959721, 0.2605308, 1, 1, 1, 1, 1,
-0.3719968, 0.6834649, -0.5289573, 1, 1, 1, 1, 1,
-0.3715691, 1.201013, -1.963509, 0, 0, 1, 1, 1,
-0.3699474, 0.5725907, -1.723737, 1, 0, 0, 1, 1,
-0.3669724, 0.6899642, 0.9286485, 1, 0, 0, 1, 1,
-0.3669011, 0.4375348, 0.3345022, 1, 0, 0, 1, 1,
-0.364543, 0.4217121, -0.2994301, 1, 0, 0, 1, 1,
-0.3632317, -1.173436, -0.6605846, 1, 0, 0, 1, 1,
-0.3617951, 0.257619, -0.8005379, 0, 0, 0, 1, 1,
-0.3614113, -0.8525162, -3.630766, 0, 0, 0, 1, 1,
-0.3590143, -0.4679366, -2.404132, 0, 0, 0, 1, 1,
-0.3545385, 1.834485, 0.1534105, 0, 0, 0, 1, 1,
-0.3542351, -0.7382147, -0.9184684, 0, 0, 0, 1, 1,
-0.3529877, 0.3201115, -1.694703, 0, 0, 0, 1, 1,
-0.3474125, -0.05223511, -1.274105, 0, 0, 0, 1, 1,
-0.3434862, 0.08334067, -1.756502, 1, 1, 1, 1, 1,
-0.3387213, -0.1085231, -2.825974, 1, 1, 1, 1, 1,
-0.3321754, 2.510754, -1.238437, 1, 1, 1, 1, 1,
-0.3316192, 0.2480337, -1.586215, 1, 1, 1, 1, 1,
-0.3309775, -0.07085325, -1.934936, 1, 1, 1, 1, 1,
-0.3261862, 1.620091, 1.128537, 1, 1, 1, 1, 1,
-0.3252276, -0.3605029, -2.931408, 1, 1, 1, 1, 1,
-0.3219897, -0.08038933, -3.362012, 1, 1, 1, 1, 1,
-0.3208851, 0.9073814, -2.597117, 1, 1, 1, 1, 1,
-0.3199425, -0.4724941, -2.154475, 1, 1, 1, 1, 1,
-0.3131738, -0.1296362, -1.645277, 1, 1, 1, 1, 1,
-0.3104637, 0.8525349, 1.202101, 1, 1, 1, 1, 1,
-0.3038644, -0.7088705, -1.604593, 1, 1, 1, 1, 1,
-0.3032705, -2.134336, -3.077039, 1, 1, 1, 1, 1,
-0.2957553, -0.34327, -1.135476, 1, 1, 1, 1, 1,
-0.2938399, 0.766313, 0.2610771, 0, 0, 1, 1, 1,
-0.2922104, -0.2485142, -0.8369743, 1, 0, 0, 1, 1,
-0.2901199, -0.175424, -0.7745829, 1, 0, 0, 1, 1,
-0.2897318, 0.9376503, -0.8575931, 1, 0, 0, 1, 1,
-0.2821327, -0.7245032, -3.365851, 1, 0, 0, 1, 1,
-0.2808857, 0.05508611, -2.605075, 1, 0, 0, 1, 1,
-0.2776277, -0.9188943, -2.275907, 0, 0, 0, 1, 1,
-0.2747758, 0.169073, -2.224428, 0, 0, 0, 1, 1,
-0.2684052, 0.9204187, -0.06497692, 0, 0, 0, 1, 1,
-0.2660589, 1.457194, 0.9602427, 0, 0, 0, 1, 1,
-0.264133, 2.557675, 1.399908, 0, 0, 0, 1, 1,
-0.2620999, -1.125975, -3.081186, 0, 0, 0, 1, 1,
-0.2586777, 0.3229288, -1.455884, 0, 0, 0, 1, 1,
-0.2575136, 0.8775616, -1.643057, 1, 1, 1, 1, 1,
-0.2553525, 1.883228, -0.05999778, 1, 1, 1, 1, 1,
-0.2546065, 1.161664, 0.03008985, 1, 1, 1, 1, 1,
-0.2532721, 1.561242, 0.8620346, 1, 1, 1, 1, 1,
-0.2530709, 2.131857, 0.3378213, 1, 1, 1, 1, 1,
-0.2516197, 1.322245, 0.6629803, 1, 1, 1, 1, 1,
-0.249663, -0.3433082, -4.837245, 1, 1, 1, 1, 1,
-0.2463419, 1.682048, -0.5796705, 1, 1, 1, 1, 1,
-0.2436651, -1.407529, -2.312486, 1, 1, 1, 1, 1,
-0.2423717, 0.2173359, -0.928533, 1, 1, 1, 1, 1,
-0.2420052, 0.4420277, 1.336154, 1, 1, 1, 1, 1,
-0.2373114, 0.4875203, 0.7350836, 1, 1, 1, 1, 1,
-0.2371136, 0.414223, -0.6403962, 1, 1, 1, 1, 1,
-0.2368982, -0.2139126, -4.060385, 1, 1, 1, 1, 1,
-0.2346307, 0.1599663, -1.467533, 1, 1, 1, 1, 1,
-0.2291274, -0.5983365, -3.659323, 0, 0, 1, 1, 1,
-0.2268924, 0.9878118, -2.234055, 1, 0, 0, 1, 1,
-0.2261137, -0.9370813, -3.05165, 1, 0, 0, 1, 1,
-0.2180661, 0.726302, -2.210779, 1, 0, 0, 1, 1,
-0.2173581, 1.087339, -1.693108, 1, 0, 0, 1, 1,
-0.2168324, 1.453428, -0.7637878, 1, 0, 0, 1, 1,
-0.2165204, -0.4615882, -2.375083, 0, 0, 0, 1, 1,
-0.2121557, 0.6002409, -1.957925, 0, 0, 0, 1, 1,
-0.2054748, -0.8842594, -4.011836, 0, 0, 0, 1, 1,
-0.2016262, -0.8896494, -3.667648, 0, 0, 0, 1, 1,
-0.2008267, -0.1404895, -2.322845, 0, 0, 0, 1, 1,
-0.1994566, -0.9874192, -2.816539, 0, 0, 0, 1, 1,
-0.1990274, -1.341956, -3.189341, 0, 0, 0, 1, 1,
-0.1938428, 1.232946, -0.5652945, 1, 1, 1, 1, 1,
-0.1917166, -0.4577878, -3.336774, 1, 1, 1, 1, 1,
-0.1907714, -0.1139822, -0.581131, 1, 1, 1, 1, 1,
-0.189399, 0.7468076, 0.03886447, 1, 1, 1, 1, 1,
-0.1891338, 0.4892852, -1.397624, 1, 1, 1, 1, 1,
-0.188286, 0.8362767, 1.009163, 1, 1, 1, 1, 1,
-0.1850338, 0.4990721, -1.165462, 1, 1, 1, 1, 1,
-0.1838837, 1.045561, 0.2195057, 1, 1, 1, 1, 1,
-0.1826603, 0.2891126, -0.5069624, 1, 1, 1, 1, 1,
-0.1813121, 0.4744156, 0.4157166, 1, 1, 1, 1, 1,
-0.177251, 0.6199201, -1.406736, 1, 1, 1, 1, 1,
-0.1761958, -0.4288055, -0.615757, 1, 1, 1, 1, 1,
-0.1725378, 0.3000216, -0.1942485, 1, 1, 1, 1, 1,
-0.1712317, -0.1031134, -2.148909, 1, 1, 1, 1, 1,
-0.1682675, 1.968676, -1.432458, 1, 1, 1, 1, 1,
-0.1676537, 0.04724815, -1.609869, 0, 0, 1, 1, 1,
-0.1570445, 0.186791, -1.998767, 1, 0, 0, 1, 1,
-0.1557955, -0.236981, -2.216532, 1, 0, 0, 1, 1,
-0.1546335, -1.1885, -3.443285, 1, 0, 0, 1, 1,
-0.1528617, -2.64041, -4.13113, 1, 0, 0, 1, 1,
-0.1496763, 1.418014, 0.09660882, 1, 0, 0, 1, 1,
-0.1473988, 0.1097712, -0.297372, 0, 0, 0, 1, 1,
-0.1399987, 1.229939, -1.250016, 0, 0, 0, 1, 1,
-0.1250872, 0.1334282, -1.783096, 0, 0, 0, 1, 1,
-0.1237225, -1.209955, -3.781238, 0, 0, 0, 1, 1,
-0.1191361, 0.364007, 0.8350754, 0, 0, 0, 1, 1,
-0.1175294, -2.366333, -3.29732, 0, 0, 0, 1, 1,
-0.1162159, -2.17204, -3.788716, 0, 0, 0, 1, 1,
-0.1160894, -0.7685832, -3.561717, 1, 1, 1, 1, 1,
-0.1156397, 0.3809582, 0.403049, 1, 1, 1, 1, 1,
-0.1141903, -0.4597255, -2.714211, 1, 1, 1, 1, 1,
-0.1121344, 0.03639651, -1.734295, 1, 1, 1, 1, 1,
-0.1120809, -1.39603, -3.102993, 1, 1, 1, 1, 1,
-0.1095982, -0.9676003, -3.127009, 1, 1, 1, 1, 1,
-0.1045159, -0.03155006, -3.107035, 1, 1, 1, 1, 1,
-0.1033023, 0.4307322, 0.7005057, 1, 1, 1, 1, 1,
-0.1022978, 0.939258, -1.057161, 1, 1, 1, 1, 1,
-0.1016563, 0.9641476, -0.3240204, 1, 1, 1, 1, 1,
-0.09984151, -1.077348, -4.415012, 1, 1, 1, 1, 1,
-0.09834057, -0.3408973, -3.75873, 1, 1, 1, 1, 1,
-0.08526429, -0.767823, -2.009925, 1, 1, 1, 1, 1,
-0.08393203, 0.4132535, -2.753265, 1, 1, 1, 1, 1,
-0.08195373, 0.2004219, 0.2613382, 1, 1, 1, 1, 1,
-0.08025201, 0.1374709, -0.03246928, 0, 0, 1, 1, 1,
-0.07398284, 0.8679543, 0.2988466, 1, 0, 0, 1, 1,
-0.07312743, -0.8736128, -1.277368, 1, 0, 0, 1, 1,
-0.0723957, -1.182197, -3.08516, 1, 0, 0, 1, 1,
-0.07133861, -1.897692, -3.611577, 1, 0, 0, 1, 1,
-0.07126684, -0.2207605, -2.412549, 1, 0, 0, 1, 1,
-0.06992461, -0.7554794, -1.436435, 0, 0, 0, 1, 1,
-0.06879563, -0.1104346, -1.849541, 0, 0, 0, 1, 1,
-0.06552705, -0.1212241, -2.019261, 0, 0, 0, 1, 1,
-0.05833221, -0.3110203, -2.44901, 0, 0, 0, 1, 1,
-0.05748712, -0.6181222, -3.615011, 0, 0, 0, 1, 1,
-0.05527509, -0.6217554, -1.208948, 0, 0, 0, 1, 1,
-0.04591434, 0.4624554, -0.9369967, 0, 0, 0, 1, 1,
-0.04564129, 0.1290326, 0.999326, 1, 1, 1, 1, 1,
-0.04454771, -1.66616, -3.254224, 1, 1, 1, 1, 1,
-0.04260411, 0.1199993, 0.1871959, 1, 1, 1, 1, 1,
-0.04240384, 0.2262236, -0.3483708, 1, 1, 1, 1, 1,
-0.04235494, 1.014779, 0.8216859, 1, 1, 1, 1, 1,
-0.03992465, -0.3649579, -2.311056, 1, 1, 1, 1, 1,
-0.03896613, -1.119077, -3.750317, 1, 1, 1, 1, 1,
-0.03845954, 1.229662, -0.6856153, 1, 1, 1, 1, 1,
-0.03552709, 1.542836, -0.1053086, 1, 1, 1, 1, 1,
-0.03295387, -1.047995, -4.562991, 1, 1, 1, 1, 1,
-0.03210856, -0.4227561, -3.793894, 1, 1, 1, 1, 1,
-0.02571279, -0.209515, -2.683392, 1, 1, 1, 1, 1,
-0.01802675, -0.9311101, -3.356276, 1, 1, 1, 1, 1,
-0.01710193, -1.52456, -4.419486, 1, 1, 1, 1, 1,
-0.01486699, 0.9467394, 0.3568449, 1, 1, 1, 1, 1,
-0.01140757, 0.9614289, 0.5589483, 0, 0, 1, 1, 1,
-0.008370267, -0.4580752, -3.29996, 1, 0, 0, 1, 1,
-0.00727711, 1.726827, 1.438987, 1, 0, 0, 1, 1,
0.001125111, 1.517187, -0.1432682, 1, 0, 0, 1, 1,
0.00269953, 0.9382768, 0.3631923, 1, 0, 0, 1, 1,
0.008727275, -0.8166723, 1.383999, 1, 0, 0, 1, 1,
0.0146956, -1.19333, 0.9491051, 0, 0, 0, 1, 1,
0.01548668, -0.8921329, 4.873183, 0, 0, 0, 1, 1,
0.01821281, -0.7904411, 2.689506, 0, 0, 0, 1, 1,
0.01984994, 0.3610467, 0.6727956, 0, 0, 0, 1, 1,
0.02575089, 1.558306, 0.02079876, 0, 0, 0, 1, 1,
0.02582685, -0.35854, 4.074348, 0, 0, 0, 1, 1,
0.02607063, -0.2086667, 2.259613, 0, 0, 0, 1, 1,
0.02820506, -0.09524164, 2.412354, 1, 1, 1, 1, 1,
0.02957671, -0.6113074, 4.215321, 1, 1, 1, 1, 1,
0.0299472, 1.87016, 0.2274896, 1, 1, 1, 1, 1,
0.03180604, 0.3415507, 0.406074, 1, 1, 1, 1, 1,
0.03262927, 0.544767, -0.4464784, 1, 1, 1, 1, 1,
0.03419776, 0.8210598, -0.1864839, 1, 1, 1, 1, 1,
0.03623139, 2.025065, 0.6725819, 1, 1, 1, 1, 1,
0.03971587, 1.084111, -1.660969, 1, 1, 1, 1, 1,
0.04108549, -0.6192469, 0.749299, 1, 1, 1, 1, 1,
0.04878968, -0.1480302, 3.838093, 1, 1, 1, 1, 1,
0.04907959, 0.8334391, -0.2757823, 1, 1, 1, 1, 1,
0.05365811, 0.7041309, -0.8921233, 1, 1, 1, 1, 1,
0.05373179, 2.512492, 0.5501158, 1, 1, 1, 1, 1,
0.05451864, 0.5882918, -0.2133024, 1, 1, 1, 1, 1,
0.05564945, 0.619968, -1.958077, 1, 1, 1, 1, 1,
0.05707996, -1.612595, 2.418002, 0, 0, 1, 1, 1,
0.06153366, 0.4055309, -1.161729, 1, 0, 0, 1, 1,
0.06188717, -0.4543562, 2.432849, 1, 0, 0, 1, 1,
0.06614941, 1.923264, 0.4489108, 1, 0, 0, 1, 1,
0.07034824, -0.0784701, 2.769186, 1, 0, 0, 1, 1,
0.07651545, -0.9608735, 2.037647, 1, 0, 0, 1, 1,
0.07896513, 1.91365, 0.6505232, 0, 0, 0, 1, 1,
0.07942759, -0.3637531, 3.079705, 0, 0, 0, 1, 1,
0.08310773, 0.1185885, 2.430748, 0, 0, 0, 1, 1,
0.08373592, -0.7182863, 2.38365, 0, 0, 0, 1, 1,
0.0843464, -0.5442147, 2.492075, 0, 0, 0, 1, 1,
0.09107697, -0.6488082, 3.539707, 0, 0, 0, 1, 1,
0.09389102, 1.234114, -2.229892, 0, 0, 0, 1, 1,
0.09565308, 0.548241, 1.269063, 1, 1, 1, 1, 1,
0.09708798, 0.02273224, 4.129265, 1, 1, 1, 1, 1,
0.09729673, -1.069108, 1.115345, 1, 1, 1, 1, 1,
0.09824295, 0.2370574, -0.4489111, 1, 1, 1, 1, 1,
0.1029245, 0.2298365, 1.305959, 1, 1, 1, 1, 1,
0.1052809, -0.110997, 2.449867, 1, 1, 1, 1, 1,
0.1071686, -0.6277119, 1.674351, 1, 1, 1, 1, 1,
0.1072559, 0.5971061, 1.195523, 1, 1, 1, 1, 1,
0.1096678, 1.223474, 0.0808963, 1, 1, 1, 1, 1,
0.1122995, 2.710938, 1.48321, 1, 1, 1, 1, 1,
0.1159366, 0.346095, -0.2092446, 1, 1, 1, 1, 1,
0.1164186, 1.715566, 1.388953, 1, 1, 1, 1, 1,
0.12167, -0.1133172, 1.927657, 1, 1, 1, 1, 1,
0.122916, -0.5476174, 3.896753, 1, 1, 1, 1, 1,
0.1238565, 1.034523, -0.1760447, 1, 1, 1, 1, 1,
0.1242114, 0.1877727, -1.039977, 0, 0, 1, 1, 1,
0.1246788, -0.3076358, 3.21129, 1, 0, 0, 1, 1,
0.1254679, 0.6993553, -0.6230208, 1, 0, 0, 1, 1,
0.1300425, 0.3449924, 1.255353, 1, 0, 0, 1, 1,
0.1319512, -0.06461016, 4.104961, 1, 0, 0, 1, 1,
0.1480151, -0.3616684, 1.490772, 1, 0, 0, 1, 1,
0.1483039, 0.4101467, 0.4087929, 0, 0, 0, 1, 1,
0.1514677, -0.6354536, 3.050826, 0, 0, 0, 1, 1,
0.1524667, -0.002435228, 1.957972, 0, 0, 0, 1, 1,
0.1550382, 0.2320695, 1.149598, 0, 0, 0, 1, 1,
0.157817, 0.4784132, -0.02413562, 0, 0, 0, 1, 1,
0.1619478, 2.443108, 2.04341, 0, 0, 0, 1, 1,
0.1643035, -0.9150611, 3.456186, 0, 0, 0, 1, 1,
0.1666263, -0.02772927, 1.519021, 1, 1, 1, 1, 1,
0.175349, 0.6570851, -0.1832061, 1, 1, 1, 1, 1,
0.1805047, -0.7181669, 3.393274, 1, 1, 1, 1, 1,
0.1825038, -1.420288, 2.598212, 1, 1, 1, 1, 1,
0.1841666, -0.660005, 2.106802, 1, 1, 1, 1, 1,
0.1867538, 1.368572, -0.6275271, 1, 1, 1, 1, 1,
0.1888855, 0.8470917, -0.6855305, 1, 1, 1, 1, 1,
0.1933317, -0.2707659, 1.347292, 1, 1, 1, 1, 1,
0.1938442, -1.991725, 5.236849, 1, 1, 1, 1, 1,
0.1947855, -0.2013484, 1.48164, 1, 1, 1, 1, 1,
0.1954147, -0.2622566, 0.8891161, 1, 1, 1, 1, 1,
0.1959557, 0.8022784, 2.717384, 1, 1, 1, 1, 1,
0.1975089, 1.364323, 1.179243, 1, 1, 1, 1, 1,
0.1994805, 0.8535036, 0.6557617, 1, 1, 1, 1, 1,
0.2091012, 0.6499519, -0.7067493, 1, 1, 1, 1, 1,
0.2093797, -1.261716, 2.158996, 0, 0, 1, 1, 1,
0.2126109, -0.9253299, 2.763708, 1, 0, 0, 1, 1,
0.2143671, 2.405556, -0.06169103, 1, 0, 0, 1, 1,
0.2166876, -0.2803048, 1.585046, 1, 0, 0, 1, 1,
0.2223375, 0.1904477, 1.130813, 1, 0, 0, 1, 1,
0.2269795, -0.1034977, 2.623693, 1, 0, 0, 1, 1,
0.2288219, 0.5080166, 0.8148263, 0, 0, 0, 1, 1,
0.2350447, -0.3543861, 1.192223, 0, 0, 0, 1, 1,
0.2393526, 2.574612, 0.1515909, 0, 0, 0, 1, 1,
0.2408537, -1.331015, 4.329222, 0, 0, 0, 1, 1,
0.2414065, 0.3419846, 0.7076032, 0, 0, 0, 1, 1,
0.2414725, 0.2227511, 2.235581, 0, 0, 0, 1, 1,
0.2464229, 0.3791575, 1.701331, 0, 0, 0, 1, 1,
0.2504973, 0.819216, -0.685132, 1, 1, 1, 1, 1,
0.2525805, 0.2782618, 1.522792, 1, 1, 1, 1, 1,
0.2587974, 1.423202, 1.443961, 1, 1, 1, 1, 1,
0.2617319, 1.032052, 0.1049855, 1, 1, 1, 1, 1,
0.2662578, -0.674181, 3.845338, 1, 1, 1, 1, 1,
0.2685912, 0.463237, 0.5322866, 1, 1, 1, 1, 1,
0.2692968, 0.4462904, 0.8470975, 1, 1, 1, 1, 1,
0.2719416, -0.618681, 3.996209, 1, 1, 1, 1, 1,
0.2730465, 1.002683, -0.838815, 1, 1, 1, 1, 1,
0.2741176, -0.8242592, 2.567672, 1, 1, 1, 1, 1,
0.285565, -0.5878167, 3.982918, 1, 1, 1, 1, 1,
0.2858382, -0.6241844, 2.607212, 1, 1, 1, 1, 1,
0.2907537, -0.4500287, 3.237784, 1, 1, 1, 1, 1,
0.2952461, -0.1546359, 2.96997, 1, 1, 1, 1, 1,
0.2961992, 0.3072341, 1.113676, 1, 1, 1, 1, 1,
0.2967228, -0.1010191, 1.847466, 0, 0, 1, 1, 1,
0.3004811, -0.9061583, 2.698366, 1, 0, 0, 1, 1,
0.3009858, 2.160765, -0.2055352, 1, 0, 0, 1, 1,
0.3049288, -0.9313763, 2.901793, 1, 0, 0, 1, 1,
0.3078926, -0.009795257, 0.8616984, 1, 0, 0, 1, 1,
0.3088033, 0.05655913, 0.7358872, 1, 0, 0, 1, 1,
0.3145241, -0.0762737, 0.9777076, 0, 0, 0, 1, 1,
0.3173942, -1.920992, 1.400212, 0, 0, 0, 1, 1,
0.3234458, -1.604458, 0.8820801, 0, 0, 0, 1, 1,
0.3238065, 2.001075, 0.1369191, 0, 0, 0, 1, 1,
0.3244962, 1.10912, -0.5356266, 0, 0, 0, 1, 1,
0.3245975, -0.5165699, 1.214056, 0, 0, 0, 1, 1,
0.3284598, -0.8880693, 2.027531, 0, 0, 0, 1, 1,
0.3292015, 1.740373, 0.1047366, 1, 1, 1, 1, 1,
0.3351222, -0.9783314, 1.541403, 1, 1, 1, 1, 1,
0.3366967, 0.3685466, -0.5551744, 1, 1, 1, 1, 1,
0.3379139, 0.4565632, 2.470462, 1, 1, 1, 1, 1,
0.3435604, 0.9729599, -0.09035161, 1, 1, 1, 1, 1,
0.3472197, -1.76663, 4.212547, 1, 1, 1, 1, 1,
0.3543592, 0.6923351, -0.05921392, 1, 1, 1, 1, 1,
0.3598852, 1.504782, -0.8264332, 1, 1, 1, 1, 1,
0.3608243, -0.6461631, 3.089874, 1, 1, 1, 1, 1,
0.366803, 0.8701913, -0.4650194, 1, 1, 1, 1, 1,
0.3709456, -0.5690747, 1.438569, 1, 1, 1, 1, 1,
0.3754393, 0.6447136, 1.232158, 1, 1, 1, 1, 1,
0.3782144, -0.8181164, 2.426198, 1, 1, 1, 1, 1,
0.3788776, 0.448795, 1.062001, 1, 1, 1, 1, 1,
0.3804007, -0.1255689, 2.32552, 1, 1, 1, 1, 1,
0.3927174, 0.2345655, 1.985824, 0, 0, 1, 1, 1,
0.3957522, -0.7982283, 2.220407, 1, 0, 0, 1, 1,
0.398802, -1.96635, 2.474743, 1, 0, 0, 1, 1,
0.3988185, -0.7167618, 2.944231, 1, 0, 0, 1, 1,
0.4022339, -0.225237, 0.9198035, 1, 0, 0, 1, 1,
0.4055926, -0.726041, 3.154701, 1, 0, 0, 1, 1,
0.40585, -1.188595, 1.191039, 0, 0, 0, 1, 1,
0.4087602, 0.2869079, 2.515223, 0, 0, 0, 1, 1,
0.4098668, -2.348224, 3.149016, 0, 0, 0, 1, 1,
0.4116374, -0.2198384, 1.284666, 0, 0, 0, 1, 1,
0.4136772, 0.6474037, -0.6302684, 0, 0, 0, 1, 1,
0.4203536, 0.8544911, -1.055248, 0, 0, 0, 1, 1,
0.4217292, -0.0302326, 1.495131, 0, 0, 0, 1, 1,
0.4249307, -1.906637, 3.262275, 1, 1, 1, 1, 1,
0.4255145, 0.4900959, 0.8187021, 1, 1, 1, 1, 1,
0.4307712, 0.458134, -0.7304479, 1, 1, 1, 1, 1,
0.4323771, 0.4800889, 1.37073, 1, 1, 1, 1, 1,
0.4326526, 1.201605, -0.5135808, 1, 1, 1, 1, 1,
0.4333622, -0.9659999, 2.449984, 1, 1, 1, 1, 1,
0.4343479, -0.7104127, 2.336792, 1, 1, 1, 1, 1,
0.4355193, 1.124951, 1.116961, 1, 1, 1, 1, 1,
0.436259, 2.153015, -0.1264621, 1, 1, 1, 1, 1,
0.4432087, -0.513024, 2.001047, 1, 1, 1, 1, 1,
0.4493504, -1.448452, 2.653467, 1, 1, 1, 1, 1,
0.4503587, -1.25577, 3.465746, 1, 1, 1, 1, 1,
0.4526703, -0.003328048, 2.259537, 1, 1, 1, 1, 1,
0.4530825, 0.0657035, 1.685467, 1, 1, 1, 1, 1,
0.4537323, -0.7119541, 1.542142, 1, 1, 1, 1, 1,
0.454679, -0.8969146, 3.101047, 0, 0, 1, 1, 1,
0.4550812, 0.2732223, 1.352834, 1, 0, 0, 1, 1,
0.4569339, 0.2597925, 0.2957736, 1, 0, 0, 1, 1,
0.4601102, 0.2366305, 1.601077, 1, 0, 0, 1, 1,
0.4653213, -0.5213863, 3.101347, 1, 0, 0, 1, 1,
0.467904, 2.594976, -0.6028644, 1, 0, 0, 1, 1,
0.4725105, -1.329003, 3.272302, 0, 0, 0, 1, 1,
0.4731424, 0.579027, 0.3081921, 0, 0, 0, 1, 1,
0.4762265, 1.237398, 0.2446744, 0, 0, 0, 1, 1,
0.4773896, -0.4356004, 2.58878, 0, 0, 0, 1, 1,
0.4796179, -1.527145, 3.612063, 0, 0, 0, 1, 1,
0.4808609, 2.243187, -0.3955852, 0, 0, 0, 1, 1,
0.4818757, -0.8919953, 1.877601, 0, 0, 0, 1, 1,
0.4830653, -1.167134, 3.308273, 1, 1, 1, 1, 1,
0.4841973, -0.4137003, 2.967478, 1, 1, 1, 1, 1,
0.4871857, 0.9913532, -1.247904, 1, 1, 1, 1, 1,
0.4948387, 1.54278, -0.4039062, 1, 1, 1, 1, 1,
0.4992742, -1.57204, 3.156589, 1, 1, 1, 1, 1,
0.4999861, -0.6401534, 2.356767, 1, 1, 1, 1, 1,
0.5020461, 0.2478051, 1.473885, 1, 1, 1, 1, 1,
0.5055208, -0.04754564, 1.946058, 1, 1, 1, 1, 1,
0.5060117, -0.5506487, 3.899972, 1, 1, 1, 1, 1,
0.5073082, 0.9004569, 0.6496834, 1, 1, 1, 1, 1,
0.511364, 0.5960051, 0.6118705, 1, 1, 1, 1, 1,
0.5129679, 0.1031739, 1.972586, 1, 1, 1, 1, 1,
0.519366, 1.422595, -0.5002827, 1, 1, 1, 1, 1,
0.5237936, 0.2555882, 0.9299537, 1, 1, 1, 1, 1,
0.5238289, 0.07063254, 0.7912503, 1, 1, 1, 1, 1,
0.5296245, -0.4955485, 4.459987, 0, 0, 1, 1, 1,
0.529703, 0.0179014, 0.2061416, 1, 0, 0, 1, 1,
0.5331134, 0.9164138, 1.664688, 1, 0, 0, 1, 1,
0.5340274, 0.1300378, 2.91276, 1, 0, 0, 1, 1,
0.5343212, -0.4384809, 4.420856, 1, 0, 0, 1, 1,
0.5364779, -0.4739626, 1.064817, 1, 0, 0, 1, 1,
0.539184, -0.7254837, 0.6827908, 0, 0, 0, 1, 1,
0.5488879, 2.66201, -0.06867879, 0, 0, 0, 1, 1,
0.5510767, 0.8115388, 0.2091248, 0, 0, 0, 1, 1,
0.5574257, -1.478789, 5.406218, 0, 0, 0, 1, 1,
0.5591642, -0.394282, 1.221975, 0, 0, 0, 1, 1,
0.5602531, 0.503365, 1.439811, 0, 0, 0, 1, 1,
0.5609947, 1.141154, -0.4422494, 0, 0, 0, 1, 1,
0.5642925, 1.39275, 0.1291743, 1, 1, 1, 1, 1,
0.5667779, 0.1677185, 0.8475611, 1, 1, 1, 1, 1,
0.5669581, 0.6762079, 0.0263746, 1, 1, 1, 1, 1,
0.5683017, -0.9109391, 4.262749, 1, 1, 1, 1, 1,
0.5692703, 1.020013, 1.621354, 1, 1, 1, 1, 1,
0.5738225, 0.5456122, 1.042787, 1, 1, 1, 1, 1,
0.5740664, 0.9900745, 1.325879, 1, 1, 1, 1, 1,
0.5747291, -0.526233, 1.771446, 1, 1, 1, 1, 1,
0.5803969, 0.07139977, -1.259053, 1, 1, 1, 1, 1,
0.5808218, 0.2676544, -0.1517318, 1, 1, 1, 1, 1,
0.588142, 0.3125303, 1.003167, 1, 1, 1, 1, 1,
0.5904787, -0.4425595, 4.06328, 1, 1, 1, 1, 1,
0.5926213, 1.355564, 1.038307, 1, 1, 1, 1, 1,
0.5945508, 2.270433, -0.3140795, 1, 1, 1, 1, 1,
0.5947716, -0.1117841, 0.8476145, 1, 1, 1, 1, 1,
0.5956751, -0.8622676, 1.234136, 0, 0, 1, 1, 1,
0.5975416, -0.02106727, 1.992223, 1, 0, 0, 1, 1,
0.5986861, -1.080269, 2.763026, 1, 0, 0, 1, 1,
0.5998792, -0.2171012, 2.061021, 1, 0, 0, 1, 1,
0.6042233, -0.6855909, 0.6122337, 1, 0, 0, 1, 1,
0.6096783, -1.785198, 2.579526, 1, 0, 0, 1, 1,
0.6111735, -2.765683, 2.895828, 0, 0, 0, 1, 1,
0.6126675, -2.253135, 2.961659, 0, 0, 0, 1, 1,
0.6129296, -0.9649256, 1.65182, 0, 0, 0, 1, 1,
0.618778, 0.4979942, 2.975092, 0, 0, 0, 1, 1,
0.6233748, -1.360407, 1.396911, 0, 0, 0, 1, 1,
0.6246299, -0.5862974, 3.050746, 0, 0, 0, 1, 1,
0.6273168, 0.2570233, 0.3181261, 0, 0, 0, 1, 1,
0.6288434, -0.1427684, 2.060231, 1, 1, 1, 1, 1,
0.631072, -0.09767312, 2.370169, 1, 1, 1, 1, 1,
0.638409, -1.140166, 3.006186, 1, 1, 1, 1, 1,
0.6433856, 0.09170306, -0.6406951, 1, 1, 1, 1, 1,
0.6463397, -0.7875707, 2.038597, 1, 1, 1, 1, 1,
0.6471187, 0.7561091, 2.331658, 1, 1, 1, 1, 1,
0.6494841, 1.675103, 1.637956, 1, 1, 1, 1, 1,
0.6499504, 1.238339, 1.165137, 1, 1, 1, 1, 1,
0.6510324, 1.175371, 2.241765, 1, 1, 1, 1, 1,
0.6569824, -1.201377, 3.529023, 1, 1, 1, 1, 1,
0.6580282, -0.4552023, 4.412814, 1, 1, 1, 1, 1,
0.6591938, 0.8130051, 0.702728, 1, 1, 1, 1, 1,
0.6593538, 0.1637092, 0.4692392, 1, 1, 1, 1, 1,
0.6595467, -0.719362, 3.210345, 1, 1, 1, 1, 1,
0.6604234, -1.729469, 2.821596, 1, 1, 1, 1, 1,
0.6606451, 0.991408, 0.7755283, 0, 0, 1, 1, 1,
0.6615352, -1.993056, 3.747199, 1, 0, 0, 1, 1,
0.6618053, -0.995243, 3.539405, 1, 0, 0, 1, 1,
0.6634883, -0.1222148, 0.9828882, 1, 0, 0, 1, 1,
0.6645644, 0.8231193, 1.433198, 1, 0, 0, 1, 1,
0.6674501, 1.086662, 0.3605088, 1, 0, 0, 1, 1,
0.6695921, 1.449287, -0.7305511, 0, 0, 0, 1, 1,
0.6708708, -0.8956573, 2.802079, 0, 0, 0, 1, 1,
0.673055, 1.218168, 2.040998, 0, 0, 0, 1, 1,
0.678006, -0.72079, 1.717607, 0, 0, 0, 1, 1,
0.6792343, 0.3030642, 0.6801338, 0, 0, 0, 1, 1,
0.6809838, -0.553987, 1.100913, 0, 0, 0, 1, 1,
0.6835697, 1.512297, 0.8205175, 0, 0, 0, 1, 1,
0.6870607, 0.2792191, -1.240505, 1, 1, 1, 1, 1,
0.688597, 0.514169, 0.2109739, 1, 1, 1, 1, 1,
0.6887337, 2.249481, 0.7340362, 1, 1, 1, 1, 1,
0.6891595, -1.255799, 1.748081, 1, 1, 1, 1, 1,
0.6922626, 0.9573102, 0.09264786, 1, 1, 1, 1, 1,
0.69411, -0.4139214, 2.575351, 1, 1, 1, 1, 1,
0.6989169, 0.5989373, -1.067691, 1, 1, 1, 1, 1,
0.7015306, 0.2172396, 3.164333, 1, 1, 1, 1, 1,
0.7026096, -1.714796, 2.559667, 1, 1, 1, 1, 1,
0.7039453, 0.7609763, 0.7419143, 1, 1, 1, 1, 1,
0.7122092, -0.2922292, 0.1540679, 1, 1, 1, 1, 1,
0.7179542, 1.185903, 1.447555, 1, 1, 1, 1, 1,
0.7185298, -1.327303, 3.383446, 1, 1, 1, 1, 1,
0.7188448, -2.206575, 1.721485, 1, 1, 1, 1, 1,
0.7219809, -1.502186, 2.873418, 1, 1, 1, 1, 1,
0.7290298, -0.7967671, 3.251984, 0, 0, 1, 1, 1,
0.7290616, -0.3281193, 2.334905, 1, 0, 0, 1, 1,
0.7346948, 2.26232, -0.08409116, 1, 0, 0, 1, 1,
0.7354472, 0.8464635, -0.5658295, 1, 0, 0, 1, 1,
0.7364179, -0.4065437, 1.750451, 1, 0, 0, 1, 1,
0.7424882, 0.6170489, 1.470859, 1, 0, 0, 1, 1,
0.7430001, 0.06830129, 1.877961, 0, 0, 0, 1, 1,
0.7433305, -0.06385355, 1.761544, 0, 0, 0, 1, 1,
0.7436939, 0.6888381, 0.931752, 0, 0, 0, 1, 1,
0.7470208, 2.736344, 2.774414, 0, 0, 0, 1, 1,
0.7472443, -1.079138, 0.7889683, 0, 0, 0, 1, 1,
0.7512725, 0.4052706, 1.292795, 0, 0, 0, 1, 1,
0.7579944, -0.4626634, 1.976745, 0, 0, 0, 1, 1,
0.7610642, 0.4535977, 2.400527, 1, 1, 1, 1, 1,
0.7623987, 0.4641002, -0.6687873, 1, 1, 1, 1, 1,
0.7679585, 0.8611581, 1.829342, 1, 1, 1, 1, 1,
0.7714343, 0.475098, 0.3023784, 1, 1, 1, 1, 1,
0.7761977, -0.97705, 3.678767, 1, 1, 1, 1, 1,
0.7797851, 1.263815, -1.959041, 1, 1, 1, 1, 1,
0.7828134, 0.6670297, 1.011873, 1, 1, 1, 1, 1,
0.7910444, 0.4214728, 0.002423693, 1, 1, 1, 1, 1,
0.7961602, 0.4088036, 1.221631, 1, 1, 1, 1, 1,
0.7964334, 0.4398936, -0.4430774, 1, 1, 1, 1, 1,
0.7995973, 0.3270809, -0.2742467, 1, 1, 1, 1, 1,
0.8003346, -1.330765, 1.715229, 1, 1, 1, 1, 1,
0.8055654, 0.2028486, 0.7275741, 1, 1, 1, 1, 1,
0.8070642, -0.7029048, 1.433723, 1, 1, 1, 1, 1,
0.807285, -1.130524, 1.415415, 1, 1, 1, 1, 1,
0.8082546, 1.881312, -0.2205046, 0, 0, 1, 1, 1,
0.8148045, -1.373912, 2.052896, 1, 0, 0, 1, 1,
0.8294436, -0.6327121, 3.482254, 1, 0, 0, 1, 1,
0.8299446, 0.6169716, 2.489463, 1, 0, 0, 1, 1,
0.8481903, -0.06647925, 0.5077971, 1, 0, 0, 1, 1,
0.8486677, -0.002887065, 0.5974032, 1, 0, 0, 1, 1,
0.8523591, -0.5268083, 4.110723, 0, 0, 0, 1, 1,
0.8538485, -2.462418, 2.122213, 0, 0, 0, 1, 1,
0.8579852, 1.119418, 0.5205082, 0, 0, 0, 1, 1,
0.8646982, 0.3940434, 1.748126, 0, 0, 0, 1, 1,
0.8686771, 1.14195, 0.9597142, 0, 0, 0, 1, 1,
0.8728504, 0.09257001, 0.8662639, 0, 0, 0, 1, 1,
0.8813829, 0.03881218, 0.4627912, 0, 0, 0, 1, 1,
0.8831953, 0.7376519, 0.1507358, 1, 1, 1, 1, 1,
0.8837335, 0.1745785, 1.087798, 1, 1, 1, 1, 1,
0.885705, -0.8311988, 1.797774, 1, 1, 1, 1, 1,
0.8861021, -0.03706859, 0.7095056, 1, 1, 1, 1, 1,
0.8868567, -0.83933, 1.982383, 1, 1, 1, 1, 1,
0.8900141, -2.637874, 2.475412, 1, 1, 1, 1, 1,
0.8939061, -0.5176523, 1.636526, 1, 1, 1, 1, 1,
0.9069809, -0.4859671, 2.321031, 1, 1, 1, 1, 1,
0.9091989, 0.2913165, 2.126905, 1, 1, 1, 1, 1,
0.9120153, -0.4182099, 1.913532, 1, 1, 1, 1, 1,
0.9157565, 0.1597248, 0.8742387, 1, 1, 1, 1, 1,
0.920935, 0.6460198, 0.2470045, 1, 1, 1, 1, 1,
0.9218916, -0.2618248, 4.370272, 1, 1, 1, 1, 1,
0.9275752, 1.255309, 0.4762471, 1, 1, 1, 1, 1,
0.9296301, 0.5028172, 0.7644844, 1, 1, 1, 1, 1,
0.9297492, 0.1026611, 0.9362424, 0, 0, 1, 1, 1,
0.9335544, 0.7777288, 0.8309071, 1, 0, 0, 1, 1,
0.9367358, -1.837993, 1.401588, 1, 0, 0, 1, 1,
0.9375936, -0.1080564, 2.42403, 1, 0, 0, 1, 1,
0.9381121, -0.1555071, 2.702348, 1, 0, 0, 1, 1,
0.9386365, -0.3869277, 1.1197, 1, 0, 0, 1, 1,
0.9445504, 1.269273, -0.4434699, 0, 0, 0, 1, 1,
0.9473699, -0.4975478, -0.5747907, 0, 0, 0, 1, 1,
0.9545619, -1.482395, 2.970064, 0, 0, 0, 1, 1,
0.9558516, -0.6023481, 2.350033, 0, 0, 0, 1, 1,
0.9692153, -1.484505, 2.851185, 0, 0, 0, 1, 1,
0.9908746, -0.04504012, 0.6650949, 0, 0, 0, 1, 1,
0.9972718, -0.4996122, 0.908649, 0, 0, 0, 1, 1,
1.000008, 0.4485155, 1.293537, 1, 1, 1, 1, 1,
1.00176, -0.5372306, 2.815309, 1, 1, 1, 1, 1,
1.004953, -0.03400598, 0.5941824, 1, 1, 1, 1, 1,
1.007152, 1.091969, 1.461087, 1, 1, 1, 1, 1,
1.009515, -0.09205705, 1.164643, 1, 1, 1, 1, 1,
1.010177, 0.5053698, 2.178872, 1, 1, 1, 1, 1,
1.010918, -0.2836548, 1.171236, 1, 1, 1, 1, 1,
1.014822, -0.2883427, 3.000994, 1, 1, 1, 1, 1,
1.017868, 1.223992, 0.2365205, 1, 1, 1, 1, 1,
1.021651, -0.4359851, 2.722541, 1, 1, 1, 1, 1,
1.026886, -1.739629, 2.34101, 1, 1, 1, 1, 1,
1.041795, -2.197148, 2.253547, 1, 1, 1, 1, 1,
1.041941, -0.3439897, 1.211858, 1, 1, 1, 1, 1,
1.043694, 0.5795206, 2.374388, 1, 1, 1, 1, 1,
1.048515, 2.685953, -0.7754056, 1, 1, 1, 1, 1,
1.056062, -0.1110986, 2.243055, 0, 0, 1, 1, 1,
1.059148, 1.437602, 2.018562, 1, 0, 0, 1, 1,
1.077048, -1.339889, 2.563351, 1, 0, 0, 1, 1,
1.082888, 0.9791318, 1.629584, 1, 0, 0, 1, 1,
1.085513, 1.514929, -0.2734852, 1, 0, 0, 1, 1,
1.087536, -1.202108, 2.359564, 1, 0, 0, 1, 1,
1.096104, 0.06250737, 1.633171, 0, 0, 0, 1, 1,
1.098382, -1.413328, 1.608948, 0, 0, 0, 1, 1,
1.100125, -2.026868, 1.297856, 0, 0, 0, 1, 1,
1.112456, 0.5302679, 0.730519, 0, 0, 0, 1, 1,
1.115602, -1.221897, 2.617137, 0, 0, 0, 1, 1,
1.118668, 0.3861533, 3.434634, 0, 0, 0, 1, 1,
1.124419, -0.5415348, 1.978867, 0, 0, 0, 1, 1,
1.126888, 0.9289516, 0.4368983, 1, 1, 1, 1, 1,
1.128903, 0.4657819, 1.901614, 1, 1, 1, 1, 1,
1.130998, -1.139252, 0.2619218, 1, 1, 1, 1, 1,
1.139742, -1.03205, 2.315604, 1, 1, 1, 1, 1,
1.14692, -1.049812, 2.071232, 1, 1, 1, 1, 1,
1.149011, -0.3079991, 1.245163, 1, 1, 1, 1, 1,
1.150574, -2.101389, 3.663738, 1, 1, 1, 1, 1,
1.160116, 0.3958286, -0.03146556, 1, 1, 1, 1, 1,
1.176638, -1.36671, 3.082151, 1, 1, 1, 1, 1,
1.180996, 0.02315841, 1.694125, 1, 1, 1, 1, 1,
1.186274, 1.607653, 0.9593883, 1, 1, 1, 1, 1,
1.191899, 1.508764, 2.346792, 1, 1, 1, 1, 1,
1.199685, -0.8626374, 1.541072, 1, 1, 1, 1, 1,
1.208985, 0.3175232, 0.9022027, 1, 1, 1, 1, 1,
1.210812, 0.3107184, 2.111599, 1, 1, 1, 1, 1,
1.219727, 0.05541747, 1.666797, 0, 0, 1, 1, 1,
1.222571, -0.9768465, 2.717605, 1, 0, 0, 1, 1,
1.225581, -0.5334187, 1.920966, 1, 0, 0, 1, 1,
1.233829, 0.7095357, -0.8165794, 1, 0, 0, 1, 1,
1.240328, -1.956135, 1.947005, 1, 0, 0, 1, 1,
1.250611, -0.511531, 2.727545, 1, 0, 0, 1, 1,
1.251036, 0.1064303, 0.846191, 0, 0, 0, 1, 1,
1.253342, 1.459603, 1.59025, 0, 0, 0, 1, 1,
1.253807, -0.1500172, 1.373968, 0, 0, 0, 1, 1,
1.27337, -0.3298644, 1.001239, 0, 0, 0, 1, 1,
1.273866, -0.2602865, 0.2033433, 0, 0, 0, 1, 1,
1.281877, 0.8603368, 1.321876, 0, 0, 0, 1, 1,
1.284496, -0.4458827, 3.632112, 0, 0, 0, 1, 1,
1.286713, 0.5946833, 0.2543264, 1, 1, 1, 1, 1,
1.291439, 0.09285241, 0.4412584, 1, 1, 1, 1, 1,
1.298134, -0.9535664, 1.937733, 1, 1, 1, 1, 1,
1.307, -0.06061139, 2.103079, 1, 1, 1, 1, 1,
1.311912, -0.6609822, 3.26057, 1, 1, 1, 1, 1,
1.318153, -0.7942352, 1.768524, 1, 1, 1, 1, 1,
1.320195, -0.1714145, 1.435819, 1, 1, 1, 1, 1,
1.320385, 0.2331793, 0.5865937, 1, 1, 1, 1, 1,
1.324865, -0.1619022, 1.294999, 1, 1, 1, 1, 1,
1.325243, 0.5793817, -0.7097258, 1, 1, 1, 1, 1,
1.325971, 0.7168783, 0.196698, 1, 1, 1, 1, 1,
1.339277, 0.6649646, -1.456, 1, 1, 1, 1, 1,
1.344854, -0.4711511, 3.349994, 1, 1, 1, 1, 1,
1.353206, 1.587318, 0.2358615, 1, 1, 1, 1, 1,
1.368066, -1.055305, 1.328923, 1, 1, 1, 1, 1,
1.368479, -1.751927, 3.19757, 0, 0, 1, 1, 1,
1.37197, 0.7722801, -0.3249341, 1, 0, 0, 1, 1,
1.374238, -1.886687, 1.012197, 1, 0, 0, 1, 1,
1.393008, 0.7203781, 0.4596115, 1, 0, 0, 1, 1,
1.393265, -1.905585, 1.624503, 1, 0, 0, 1, 1,
1.405546, 0.3338075, 1.598756, 1, 0, 0, 1, 1,
1.425963, -1.350165, 0.9209055, 0, 0, 0, 1, 1,
1.434314, -0.1743018, 2.796374, 0, 0, 0, 1, 1,
1.436399, 0.373298, 1.610532, 0, 0, 0, 1, 1,
1.43719, 0.7144074, -0.07014401, 0, 0, 0, 1, 1,
1.468529, -0.3475059, 0.9629032, 0, 0, 0, 1, 1,
1.469335, -1.613587, 2.087005, 0, 0, 0, 1, 1,
1.476819, 0.2664452, 1.344527, 0, 0, 0, 1, 1,
1.480841, 0.1525351, 1.437931, 1, 1, 1, 1, 1,
1.494351, -1.45536, 4.227429, 1, 1, 1, 1, 1,
1.523376, -0.01650825, 1.677085, 1, 1, 1, 1, 1,
1.52732, -0.4823163, 1.014705, 1, 1, 1, 1, 1,
1.536299, 0.8882773, 0.5488363, 1, 1, 1, 1, 1,
1.543906, 0.5792135, 2.497481, 1, 1, 1, 1, 1,
1.548916, 0.9351012, 0.7343619, 1, 1, 1, 1, 1,
1.549271, -1.303326, 3.039227, 1, 1, 1, 1, 1,
1.552748, 1.192807, 1.408552, 1, 1, 1, 1, 1,
1.584805, -2.586702, 4.578258, 1, 1, 1, 1, 1,
1.591651, 0.2962115, 0.8517208, 1, 1, 1, 1, 1,
1.611321, 1.224747, 2.637456, 1, 1, 1, 1, 1,
1.628208, -1.36018, 0.2392955, 1, 1, 1, 1, 1,
1.639064, -0.05044584, 1.500035, 1, 1, 1, 1, 1,
1.641277, -0.7810456, 1.058543, 1, 1, 1, 1, 1,
1.653989, 1.018936, 0.04190101, 0, 0, 1, 1, 1,
1.666482, 0.1261668, 2.466659, 1, 0, 0, 1, 1,
1.677153, -0.7307847, 1.382336, 1, 0, 0, 1, 1,
1.690962, 1.597711, 1.289009, 1, 0, 0, 1, 1,
1.702038, 0.1737274, -0.0247451, 1, 0, 0, 1, 1,
1.720272, 0.5419292, 1.525206, 1, 0, 0, 1, 1,
1.727508, -0.6131783, 0.6346485, 0, 0, 0, 1, 1,
1.728014, 0.5312692, 0.7526888, 0, 0, 0, 1, 1,
1.744642, 0.599884, 1.14821, 0, 0, 0, 1, 1,
1.749084, -0.8129855, 0.243698, 0, 0, 0, 1, 1,
1.769908, 0.105959, 1.860218, 0, 0, 0, 1, 1,
1.772332, 1.238207, -0.3504069, 0, 0, 0, 1, 1,
1.783921, 0.7695224, 2.171939, 0, 0, 0, 1, 1,
1.800097, 0.06596346, 1.277132, 1, 1, 1, 1, 1,
1.821574, 0.585899, 1.028859, 1, 1, 1, 1, 1,
1.824972, -0.2106982, 1.777225, 1, 1, 1, 1, 1,
1.844485, -1.507972, 2.031068, 1, 1, 1, 1, 1,
1.869169, -1.312976, 1.70503, 1, 1, 1, 1, 1,
1.871488, 0.5431329, 1.493229, 1, 1, 1, 1, 1,
1.873127, -0.8297078, 1.859248, 1, 1, 1, 1, 1,
1.877411, 0.07303896, 3.21211, 1, 1, 1, 1, 1,
1.887846, 1.406527, 2.195854, 1, 1, 1, 1, 1,
1.920802, 0.2556571, 1.858226, 1, 1, 1, 1, 1,
1.925006, 1.47399, -0.2276043, 1, 1, 1, 1, 1,
1.945494, -0.3793072, 0.9518254, 1, 1, 1, 1, 1,
1.959465, 0.1893378, 2.918135, 1, 1, 1, 1, 1,
1.964777, 0.1920056, 1.780038, 1, 1, 1, 1, 1,
2.007517, -0.9485562, 1.205876, 1, 1, 1, 1, 1,
2.014117, 1.706617, 0.5189235, 0, 0, 1, 1, 1,
2.048033, -0.1101648, -0.2089512, 1, 0, 0, 1, 1,
2.063229, -0.835777, 2.170254, 1, 0, 0, 1, 1,
2.086624, 0.8436705, 1.059803, 1, 0, 0, 1, 1,
2.089308, -0.5119413, 0.8896877, 1, 0, 0, 1, 1,
2.095162, -0.8991369, 0.6024296, 1, 0, 0, 1, 1,
2.104046, 0.02962594, 0.7514769, 0, 0, 0, 1, 1,
2.134794, -0.3049576, 1.881407, 0, 0, 0, 1, 1,
2.167366, -0.5722925, 2.013717, 0, 0, 0, 1, 1,
2.24663, 2.661109, 1.231456, 0, 0, 0, 1, 1,
2.270517, -1.287668, 0.8935417, 0, 0, 0, 1, 1,
2.303223, -0.8021687, -0.2115738, 0, 0, 0, 1, 1,
2.377265, 1.699568, 3.17689, 0, 0, 0, 1, 1,
2.385874, -0.751995, 0.6973858, 1, 1, 1, 1, 1,
2.397745, 0.139901, 2.42119, 1, 1, 1, 1, 1,
2.445563, 0.0798912, 0.2251965, 1, 1, 1, 1, 1,
2.468095, -0.2594166, 1.218455, 1, 1, 1, 1, 1,
2.614264, 0.5541747, 0.8744951, 1, 1, 1, 1, 1,
2.848607, 0.07669466, 1.675808, 1, 1, 1, 1, 1,
3.142514, 1.555713, 1.594503, 1, 1, 1, 1, 1
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
var radius = 9.446322;
var distance = 33.17981;
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
mvMatrix.translate( 0.213551, 0.1775607, -0.1516759 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.17981);
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
