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
-3.490579, 1.210521, -1.252901, 1, 0, 0, 1,
-2.9002, 1.035441, -1.207212, 1, 0.007843138, 0, 1,
-2.873926, 0.438485, -0.3788445, 1, 0.01176471, 0, 1,
-2.608669, 0.8062575, -1.702256, 1, 0.01960784, 0, 1,
-2.604944, -0.3885498, -2.074411, 1, 0.02352941, 0, 1,
-2.550428, 0.3461363, -1.936111, 1, 0.03137255, 0, 1,
-2.545288, 1.846679, -1.11641, 1, 0.03529412, 0, 1,
-2.493858, -1.697902, -1.55301, 1, 0.04313726, 0, 1,
-2.39553, -0.5237993, -1.582416, 1, 0.04705882, 0, 1,
-2.389374, 0.01868005, -3.03802, 1, 0.05490196, 0, 1,
-2.306829, -0.05452333, -4.206193, 1, 0.05882353, 0, 1,
-2.206903, 1.826455, -1.535827, 1, 0.06666667, 0, 1,
-2.18947, 2.356051, -1.267227, 1, 0.07058824, 0, 1,
-2.18694, 1.791249, -0.7652681, 1, 0.07843138, 0, 1,
-2.184236, 0.858489, -0.8034133, 1, 0.08235294, 0, 1,
-2.172781, -0.8592741, -2.441343, 1, 0.09019608, 0, 1,
-2.171637, 0.443676, -2.345324, 1, 0.09411765, 0, 1,
-2.154935, 1.044055, -1.901326, 1, 0.1019608, 0, 1,
-2.119527, 0.9763822, -0.5582491, 1, 0.1098039, 0, 1,
-2.09981, 2.088653, -1.695217, 1, 0.1137255, 0, 1,
-2.037605, 1.716113, 0.2730185, 1, 0.1215686, 0, 1,
-2.026753, -0.4999381, -0.6232556, 1, 0.1254902, 0, 1,
-2.007994, -0.2676135, -2.457079, 1, 0.1333333, 0, 1,
-1.975482, -0.1406122, -3.58076, 1, 0.1372549, 0, 1,
-1.962468, -0.1314078, -2.367074, 1, 0.145098, 0, 1,
-1.934423, 0.1727563, -3.017013, 1, 0.1490196, 0, 1,
-1.926515, 0.04476691, -1.414124, 1, 0.1568628, 0, 1,
-1.923303, -0.529403, -0.3414529, 1, 0.1607843, 0, 1,
-1.915477, 0.8593068, -1.902452, 1, 0.1686275, 0, 1,
-1.888359, -0.3581111, -2.589871, 1, 0.172549, 0, 1,
-1.879385, 0.4210185, -0.1989366, 1, 0.1803922, 0, 1,
-1.857335, -0.1989389, -2.421396, 1, 0.1843137, 0, 1,
-1.849665, 0.6878314, -0.6494385, 1, 0.1921569, 0, 1,
-1.819184, 1.968289, -1.16917, 1, 0.1960784, 0, 1,
-1.815286, 0.6266503, -1.10258, 1, 0.2039216, 0, 1,
-1.799736, -0.222273, -2.888986, 1, 0.2117647, 0, 1,
-1.799558, -0.8913137, -2.796024, 1, 0.2156863, 0, 1,
-1.797781, -0.9743994, -2.4223, 1, 0.2235294, 0, 1,
-1.78716, -0.264821, -1.878673, 1, 0.227451, 0, 1,
-1.777238, 1.084669, -2.462628, 1, 0.2352941, 0, 1,
-1.77532, -2.365157, -1.139806, 1, 0.2392157, 0, 1,
-1.76615, -0.1960771, -1.573261, 1, 0.2470588, 0, 1,
-1.76101, 0.289807, -1.259147, 1, 0.2509804, 0, 1,
-1.727732, 0.4470685, -2.930872, 1, 0.2588235, 0, 1,
-1.712542, 0.5156103, -2.250241, 1, 0.2627451, 0, 1,
-1.705426, -2.148373, -2.320001, 1, 0.2705882, 0, 1,
-1.690713, -0.5175433, -1.383821, 1, 0.2745098, 0, 1,
-1.681142, 0.7376779, -2.269873, 1, 0.282353, 0, 1,
-1.667943, -0.364783, -2.37516, 1, 0.2862745, 0, 1,
-1.649288, 0.5231855, -1.489194, 1, 0.2941177, 0, 1,
-1.648666, 0.2349887, -1.733257, 1, 0.3019608, 0, 1,
-1.642451, -1.234872, -4.091624, 1, 0.3058824, 0, 1,
-1.64206, 0.2271722, 0.3120113, 1, 0.3137255, 0, 1,
-1.64007, -0.6953919, -0.2532435, 1, 0.3176471, 0, 1,
-1.632565, 0.8297955, 1.01065, 1, 0.3254902, 0, 1,
-1.630543, -0.1792281, -1.494047, 1, 0.3294118, 0, 1,
-1.622712, 0.3035219, -3.271779, 1, 0.3372549, 0, 1,
-1.621316, -1.315627, -4.364113, 1, 0.3411765, 0, 1,
-1.608799, -1.836897, -2.509384, 1, 0.3490196, 0, 1,
-1.591424, 0.2207645, -0.6801375, 1, 0.3529412, 0, 1,
-1.585934, 0.9593012, -0.9821051, 1, 0.3607843, 0, 1,
-1.573104, 0.2626375, -0.9451226, 1, 0.3647059, 0, 1,
-1.57143, -0.004946866, -1.463808, 1, 0.372549, 0, 1,
-1.558463, 1.723576, -2.189325, 1, 0.3764706, 0, 1,
-1.554858, -0.7060799, -2.400322, 1, 0.3843137, 0, 1,
-1.528256, 0.5573212, -3.179191, 1, 0.3882353, 0, 1,
-1.50929, 0.4010527, -0.5485125, 1, 0.3960784, 0, 1,
-1.496041, -0.3720001, -1.525741, 1, 0.4039216, 0, 1,
-1.490422, -0.2095793, -1.905476, 1, 0.4078431, 0, 1,
-1.483054, 1.299553, -0.1846731, 1, 0.4156863, 0, 1,
-1.480383, -0.5417092, -1.188966, 1, 0.4196078, 0, 1,
-1.478713, 0.1811842, -3.439152, 1, 0.427451, 0, 1,
-1.477336, 0.7456686, -0.3871078, 1, 0.4313726, 0, 1,
-1.472484, 0.5462172, 0.2505504, 1, 0.4392157, 0, 1,
-1.459735, 1.001499, -0.01871734, 1, 0.4431373, 0, 1,
-1.458794, 0.7949309, -0.09402773, 1, 0.4509804, 0, 1,
-1.450927, -0.3564657, -1.731377, 1, 0.454902, 0, 1,
-1.444672, 1.065462, -0.5803244, 1, 0.4627451, 0, 1,
-1.430498, 0.714482, -1.745359, 1, 0.4666667, 0, 1,
-1.422318, -1.709008, -3.825879, 1, 0.4745098, 0, 1,
-1.420877, 1.125725, -0.4520307, 1, 0.4784314, 0, 1,
-1.412576, 2.370528, 0.6958619, 1, 0.4862745, 0, 1,
-1.409837, -2.370722, -1.967125, 1, 0.4901961, 0, 1,
-1.397779, 1.958529, -0.2766169, 1, 0.4980392, 0, 1,
-1.375612, -0.5417603, -3.535344, 1, 0.5058824, 0, 1,
-1.367297, -0.1652242, -0.5358881, 1, 0.509804, 0, 1,
-1.367153, -0.8283549, -3.747303, 1, 0.5176471, 0, 1,
-1.364015, 0.9802288, -0.4853491, 1, 0.5215687, 0, 1,
-1.354481, -0.4586551, -3.490127, 1, 0.5294118, 0, 1,
-1.347213, -1.58469, -2.045705, 1, 0.5333334, 0, 1,
-1.339815, -0.5062962, -1.787716, 1, 0.5411765, 0, 1,
-1.335701, 0.07405957, -2.002433, 1, 0.5450981, 0, 1,
-1.33215, 0.08852366, -1.364185, 1, 0.5529412, 0, 1,
-1.327324, -0.1954446, -2.725686, 1, 0.5568628, 0, 1,
-1.325632, 0.02526501, -1.723036, 1, 0.5647059, 0, 1,
-1.319867, 0.6507489, -1.12295, 1, 0.5686275, 0, 1,
-1.319658, -0.2918883, -1.32498, 1, 0.5764706, 0, 1,
-1.313171, -0.9356008, -2.266459, 1, 0.5803922, 0, 1,
-1.306595, -0.7560352, -3.206436, 1, 0.5882353, 0, 1,
-1.304797, -0.8373481, -3.204577, 1, 0.5921569, 0, 1,
-1.279129, -0.09746183, -1.885442, 1, 0.6, 0, 1,
-1.279018, -0.6197351, -0.8039879, 1, 0.6078432, 0, 1,
-1.277537, 1.04881, -1.743575, 1, 0.6117647, 0, 1,
-1.276709, 0.8608195, -0.1088992, 1, 0.6196079, 0, 1,
-1.274422, 0.9405923, -0.6025656, 1, 0.6235294, 0, 1,
-1.272193, -0.9272802, -1.942241, 1, 0.6313726, 0, 1,
-1.272055, -1.135068, -2.925134, 1, 0.6352941, 0, 1,
-1.270161, 0.0007386421, -1.670613, 1, 0.6431373, 0, 1,
-1.264877, -0.5805925, -2.3043, 1, 0.6470588, 0, 1,
-1.263029, -0.7030408, -0.1896338, 1, 0.654902, 0, 1,
-1.256976, -0.2848075, -1.508446, 1, 0.6588235, 0, 1,
-1.252292, -1.213186, -3.549219, 1, 0.6666667, 0, 1,
-1.247033, -0.1950254, -0.6111425, 1, 0.6705883, 0, 1,
-1.239553, -0.2985795, -3.009105, 1, 0.6784314, 0, 1,
-1.235075, 0.6465568, -1.504457, 1, 0.682353, 0, 1,
-1.227854, -0.8576818, -2.408721, 1, 0.6901961, 0, 1,
-1.225237, -1.0785, -1.757254, 1, 0.6941177, 0, 1,
-1.224984, -2.335045, -4.752692, 1, 0.7019608, 0, 1,
-1.218838, 0.3221412, -0.7107681, 1, 0.7098039, 0, 1,
-1.194422, 2.174572, -0.2466677, 1, 0.7137255, 0, 1,
-1.187106, -0.3972313, -3.109604, 1, 0.7215686, 0, 1,
-1.186485, 0.09594803, -1.957888, 1, 0.7254902, 0, 1,
-1.186353, -0.2846267, -1.431515, 1, 0.7333333, 0, 1,
-1.174504, 0.9593984, 0.4464757, 1, 0.7372549, 0, 1,
-1.168065, -1.713945, -0.7646131, 1, 0.7450981, 0, 1,
-1.166617, 0.6161091, -1.142921, 1, 0.7490196, 0, 1,
-1.166121, -1.371487, -3.081061, 1, 0.7568628, 0, 1,
-1.164015, 0.1926016, -1.826673, 1, 0.7607843, 0, 1,
-1.158217, 0.9170887, -2.539611, 1, 0.7686275, 0, 1,
-1.156176, 0.1149016, -2.212768, 1, 0.772549, 0, 1,
-1.14947, 1.814349, 0.9586653, 1, 0.7803922, 0, 1,
-1.145921, -0.1499182, -0.9168163, 1, 0.7843137, 0, 1,
-1.14514, -0.216967, -0.7361838, 1, 0.7921569, 0, 1,
-1.136508, -0.3620628, -2.06151, 1, 0.7960784, 0, 1,
-1.130181, 0.2143797, 0.2550036, 1, 0.8039216, 0, 1,
-1.123745, -0.7219123, -2.285654, 1, 0.8117647, 0, 1,
-1.121555, 2.440987, 0.3061339, 1, 0.8156863, 0, 1,
-1.118473, -1.378485, -3.591054, 1, 0.8235294, 0, 1,
-1.105559, -1.121317, -0.3386872, 1, 0.827451, 0, 1,
-1.104467, 0.0240697, -1.341959, 1, 0.8352941, 0, 1,
-1.070045, 0.07384589, -0.1451694, 1, 0.8392157, 0, 1,
-1.069715, -0.6492202, -3.626943, 1, 0.8470588, 0, 1,
-1.063553, 0.1434031, -2.809341, 1, 0.8509804, 0, 1,
-1.062082, -0.5369025, -1.303828, 1, 0.8588235, 0, 1,
-1.056365, -2.068187, -3.065226, 1, 0.8627451, 0, 1,
-1.05022, -0.6367297, -1.178607, 1, 0.8705882, 0, 1,
-1.045565, -0.5207532, -1.40181, 1, 0.8745098, 0, 1,
-1.041283, 1.828832, -0.3789916, 1, 0.8823529, 0, 1,
-1.031365, 1.060458, -2.249041, 1, 0.8862745, 0, 1,
-1.025839, 0.03877477, -1.574797, 1, 0.8941177, 0, 1,
-1.022839, 0.6920666, -0.6563075, 1, 0.8980392, 0, 1,
-1.021678, 0.3445985, -0.9671602, 1, 0.9058824, 0, 1,
-1.018982, 1.117629, -0.7889427, 1, 0.9137255, 0, 1,
-1.011655, -0.6805773, -2.536438, 1, 0.9176471, 0, 1,
-1.011413, -0.6003577, -0.1618154, 1, 0.9254902, 0, 1,
-1.004778, 0.6505211, -2.152313, 1, 0.9294118, 0, 1,
-0.9993317, 2.055258, -1.632516, 1, 0.9372549, 0, 1,
-0.9983817, -0.02429202, -0.3695457, 1, 0.9411765, 0, 1,
-0.9961264, -1.331835, -3.005199, 1, 0.9490196, 0, 1,
-0.9935605, -1.359735, -0.4265912, 1, 0.9529412, 0, 1,
-0.984669, -1.955471, -0.951849, 1, 0.9607843, 0, 1,
-0.982173, -1.828602, -4.004734, 1, 0.9647059, 0, 1,
-0.9812179, -0.4458404, -1.266861, 1, 0.972549, 0, 1,
-0.9763761, -1.615102, -1.246034, 1, 0.9764706, 0, 1,
-0.9678164, -1.539079, -3.470177, 1, 0.9843137, 0, 1,
-0.9676821, -0.2038513, -2.281266, 1, 0.9882353, 0, 1,
-0.9669172, 0.336705, -0.7886794, 1, 0.9960784, 0, 1,
-0.9634375, 0.4956743, -0.8396924, 0.9960784, 1, 0, 1,
-0.9538977, 0.172375, -1.359259, 0.9921569, 1, 0, 1,
-0.9516863, 0.3258514, -2.114916, 0.9843137, 1, 0, 1,
-0.9492802, 0.318715, -1.115826, 0.9803922, 1, 0, 1,
-0.9467353, -2.919822, -2.708565, 0.972549, 1, 0, 1,
-0.9458816, 1.537644, -2.202128, 0.9686275, 1, 0, 1,
-0.9441649, 0.8204096, 1.070219, 0.9607843, 1, 0, 1,
-0.9301713, -0.556143, -2.535823, 0.9568627, 1, 0, 1,
-0.9264055, 1.254819, -0.6697556, 0.9490196, 1, 0, 1,
-0.92414, 1.155829, -0.6797192, 0.945098, 1, 0, 1,
-0.9240631, -0.2397295, -2.091834, 0.9372549, 1, 0, 1,
-0.9238166, 0.6196366, -1.603592, 0.9333333, 1, 0, 1,
-0.9210133, -1.293202, -2.597209, 0.9254902, 1, 0, 1,
-0.9197209, -0.3241381, -1.021136, 0.9215686, 1, 0, 1,
-0.9169538, -0.4917779, -1.455511, 0.9137255, 1, 0, 1,
-0.8991331, 0.5023927, -0.4436333, 0.9098039, 1, 0, 1,
-0.8983755, -2.168828, -3.005758, 0.9019608, 1, 0, 1,
-0.8943851, -1.395544, -2.75191, 0.8941177, 1, 0, 1,
-0.8935165, -0.6683486, -0.3591883, 0.8901961, 1, 0, 1,
-0.8863224, -1.604623, -2.603634, 0.8823529, 1, 0, 1,
-0.8855779, 0.5756795, -3.383378, 0.8784314, 1, 0, 1,
-0.8766157, -0.3207562, -3.144958, 0.8705882, 1, 0, 1,
-0.8655564, 1.708479, -0.1424735, 0.8666667, 1, 0, 1,
-0.8583075, 1.372219, -1.619392, 0.8588235, 1, 0, 1,
-0.85618, -1.694061, -1.262038, 0.854902, 1, 0, 1,
-0.8491328, 0.3972197, -0.7939504, 0.8470588, 1, 0, 1,
-0.8378152, -0.1420102, -3.604826, 0.8431373, 1, 0, 1,
-0.8355969, 1.028379, -0.3008529, 0.8352941, 1, 0, 1,
-0.834707, 1.770183, -0.1653144, 0.8313726, 1, 0, 1,
-0.8260774, -0.9506162, -4.70979, 0.8235294, 1, 0, 1,
-0.8248509, -0.1310168, -0.6379641, 0.8196079, 1, 0, 1,
-0.8232007, 1.602987, -1.857437, 0.8117647, 1, 0, 1,
-0.8220324, 0.1031039, -1.371999, 0.8078431, 1, 0, 1,
-0.8182346, -0.3467511, -4.757908, 0.8, 1, 0, 1,
-0.8168479, 0.4080957, -0.5053476, 0.7921569, 1, 0, 1,
-0.8164147, -0.9662898, -2.049919, 0.7882353, 1, 0, 1,
-0.8092216, 0.5098461, -1.71065, 0.7803922, 1, 0, 1,
-0.8080693, -2.282052, -2.383393, 0.7764706, 1, 0, 1,
-0.8037187, 0.6722136, -1.542646, 0.7686275, 1, 0, 1,
-0.8026581, 0.8557808, -1.174563, 0.7647059, 1, 0, 1,
-0.7945145, 2.2515, -0.5451339, 0.7568628, 1, 0, 1,
-0.7941553, 0.4706683, -0.8648462, 0.7529412, 1, 0, 1,
-0.7928746, -0.2867264, -1.031755, 0.7450981, 1, 0, 1,
-0.7927995, 0.9275867, -0.1700691, 0.7411765, 1, 0, 1,
-0.7925763, 0.03458551, -2.393709, 0.7333333, 1, 0, 1,
-0.7915154, 0.09071519, -3.039052, 0.7294118, 1, 0, 1,
-0.7911747, 0.05384962, -0.5679356, 0.7215686, 1, 0, 1,
-0.7878632, -0.53044, -2.72226, 0.7176471, 1, 0, 1,
-0.7853447, -1.064141, -2.385643, 0.7098039, 1, 0, 1,
-0.7850546, -0.07462579, -3.163374, 0.7058824, 1, 0, 1,
-0.7785283, -0.1708323, -2.193845, 0.6980392, 1, 0, 1,
-0.7777657, -0.7913769, -1.622787, 0.6901961, 1, 0, 1,
-0.7742583, 1.222817, 0.1952128, 0.6862745, 1, 0, 1,
-0.7655663, 2.711828, 0.7033356, 0.6784314, 1, 0, 1,
-0.7649081, 0.791716, -0.3532522, 0.6745098, 1, 0, 1,
-0.7618241, -0.2500895, -2.917104, 0.6666667, 1, 0, 1,
-0.7541061, -0.1176496, -1.720217, 0.6627451, 1, 0, 1,
-0.7538578, -2.672308, -3.213709, 0.654902, 1, 0, 1,
-0.7469695, 1.511068, -1.65266, 0.6509804, 1, 0, 1,
-0.7453414, -1.653631, -1.789468, 0.6431373, 1, 0, 1,
-0.7436822, 0.9769808, 0.2145961, 0.6392157, 1, 0, 1,
-0.7436617, 1.326202, 0.116572, 0.6313726, 1, 0, 1,
-0.7365432, 0.2384981, -0.6586058, 0.627451, 1, 0, 1,
-0.7326144, 1.153518, 0.2395081, 0.6196079, 1, 0, 1,
-0.729157, -1.070097, -2.166758, 0.6156863, 1, 0, 1,
-0.7186125, 0.2147448, -1.571895, 0.6078432, 1, 0, 1,
-0.7163286, 0.3379507, -2.304342, 0.6039216, 1, 0, 1,
-0.7159727, -0.673103, -3.765089, 0.5960785, 1, 0, 1,
-0.7151731, 1.076498, 1.654233, 0.5882353, 1, 0, 1,
-0.7070449, 0.5749884, -1.002649, 0.5843138, 1, 0, 1,
-0.7055833, -0.3110577, -1.938502, 0.5764706, 1, 0, 1,
-0.7016681, 0.3672354, -1.199298, 0.572549, 1, 0, 1,
-0.700627, -1.289578, -3.195696, 0.5647059, 1, 0, 1,
-0.6964838, 1.448539, 1.250816, 0.5607843, 1, 0, 1,
-0.6949323, -0.6449788, -1.728551, 0.5529412, 1, 0, 1,
-0.6932564, -2.136932, -2.42935, 0.5490196, 1, 0, 1,
-0.6903455, 1.492192, 0.2364384, 0.5411765, 1, 0, 1,
-0.6899584, -0.8189533, -0.5590432, 0.5372549, 1, 0, 1,
-0.6853412, 1.243838, 0.3087487, 0.5294118, 1, 0, 1,
-0.6831867, 0.8276654, -0.6443594, 0.5254902, 1, 0, 1,
-0.6807713, 1.183355, 0.2106254, 0.5176471, 1, 0, 1,
-0.6773801, -0.03291138, -2.563416, 0.5137255, 1, 0, 1,
-0.6759546, 0.8430492, -2.596905, 0.5058824, 1, 0, 1,
-0.6744756, 0.2497916, -2.609565, 0.5019608, 1, 0, 1,
-0.6731741, 0.3607154, -1.651865, 0.4941176, 1, 0, 1,
-0.6645913, -0.8810913, -1.788498, 0.4862745, 1, 0, 1,
-0.6642044, 2.300549, -0.07132128, 0.4823529, 1, 0, 1,
-0.6614917, 1.170704, -0.2938416, 0.4745098, 1, 0, 1,
-0.6604987, -0.9692221, -2.89548, 0.4705882, 1, 0, 1,
-0.6524565, -0.07877551, -2.107486, 0.4627451, 1, 0, 1,
-0.6507277, -0.3131148, -3.000993, 0.4588235, 1, 0, 1,
-0.6427644, 2.194108, -0.01687744, 0.4509804, 1, 0, 1,
-0.6411955, -0.09325493, -2.620095, 0.4470588, 1, 0, 1,
-0.6407204, -0.4538504, -1.137839, 0.4392157, 1, 0, 1,
-0.6396282, -0.5120375, -2.562215, 0.4352941, 1, 0, 1,
-0.6352984, 1.173356, -0.1549124, 0.427451, 1, 0, 1,
-0.6348506, 0.2571144, -0.9892332, 0.4235294, 1, 0, 1,
-0.6304044, -1.302753, -3.195219, 0.4156863, 1, 0, 1,
-0.6302921, 0.8330264, -1.800614, 0.4117647, 1, 0, 1,
-0.6256537, -0.3121125, -0.7003105, 0.4039216, 1, 0, 1,
-0.6073067, -0.654134, -1.19432, 0.3960784, 1, 0, 1,
-0.6006596, -1.05474, -1.574224, 0.3921569, 1, 0, 1,
-0.5997942, 0.2363409, -1.081776, 0.3843137, 1, 0, 1,
-0.5989733, -0.2840826, -3.284379, 0.3803922, 1, 0, 1,
-0.5981456, -0.3726371, -2.766544, 0.372549, 1, 0, 1,
-0.5925516, 0.2766255, -0.9676733, 0.3686275, 1, 0, 1,
-0.5872459, -1.204895, -2.280263, 0.3607843, 1, 0, 1,
-0.5869802, 0.6920017, -0.6302294, 0.3568628, 1, 0, 1,
-0.5853096, -1.365121, -2.135192, 0.3490196, 1, 0, 1,
-0.5840518, 0.7351254, -0.5139509, 0.345098, 1, 0, 1,
-0.5827668, -0.5448473, -0.8743074, 0.3372549, 1, 0, 1,
-0.5812039, 0.8887716, -0.08836203, 0.3333333, 1, 0, 1,
-0.5798845, -0.3515135, -2.820187, 0.3254902, 1, 0, 1,
-0.5791994, -0.8327166, -2.455735, 0.3215686, 1, 0, 1,
-0.5779681, 1.568274, -1.501313, 0.3137255, 1, 0, 1,
-0.5775189, 0.5470712, -2.31827, 0.3098039, 1, 0, 1,
-0.5747259, -1.095317, -2.827974, 0.3019608, 1, 0, 1,
-0.5716918, 0.8927687, -1.923484, 0.2941177, 1, 0, 1,
-0.5688376, 1.455611, -0.16744, 0.2901961, 1, 0, 1,
-0.5658044, 0.2864827, 0.3943437, 0.282353, 1, 0, 1,
-0.5606492, 1.627249, 0.03080776, 0.2784314, 1, 0, 1,
-0.5420939, -1.066382, -2.459134, 0.2705882, 1, 0, 1,
-0.5402892, -1.20612, -3.359654, 0.2666667, 1, 0, 1,
-0.5359658, -0.004169094, -2.860249, 0.2588235, 1, 0, 1,
-0.5320913, 0.4336639, -1.627081, 0.254902, 1, 0, 1,
-0.5315357, -0.6478856, -2.275517, 0.2470588, 1, 0, 1,
-0.5301934, 0.9120311, -1.274243, 0.2431373, 1, 0, 1,
-0.5266848, -2.654618, -3.317729, 0.2352941, 1, 0, 1,
-0.5258531, 1.310646, 1.632489, 0.2313726, 1, 0, 1,
-0.5249239, -0.4790373, 0.3360954, 0.2235294, 1, 0, 1,
-0.5235258, -0.04530808, -1.494944, 0.2196078, 1, 0, 1,
-0.5167928, 0.5445687, -0.1573598, 0.2117647, 1, 0, 1,
-0.5095713, -0.9027734, -0.8648842, 0.2078431, 1, 0, 1,
-0.4991463, -0.5959176, -2.880901, 0.2, 1, 0, 1,
-0.499035, -0.7195696, -1.96534, 0.1921569, 1, 0, 1,
-0.4982887, -0.376983, -2.38387, 0.1882353, 1, 0, 1,
-0.495145, 0.9093409, -0.1566169, 0.1803922, 1, 0, 1,
-0.494819, 0.2636306, -1.231024, 0.1764706, 1, 0, 1,
-0.4914569, -0.3532883, -1.684194, 0.1686275, 1, 0, 1,
-0.4881501, -1.424315, -3.683198, 0.1647059, 1, 0, 1,
-0.4878702, 0.03254423, -0.479126, 0.1568628, 1, 0, 1,
-0.4856834, 1.049822, 0.1320773, 0.1529412, 1, 0, 1,
-0.4836861, 0.5595907, -0.2149457, 0.145098, 1, 0, 1,
-0.4836213, -0.8736441, -3.573434, 0.1411765, 1, 0, 1,
-0.480987, -0.6495091, -2.405839, 0.1333333, 1, 0, 1,
-0.4806459, 1.861484, 0.1574412, 0.1294118, 1, 0, 1,
-0.4806281, 0.2224452, -0.990678, 0.1215686, 1, 0, 1,
-0.479449, -1.737301, -1.369176, 0.1176471, 1, 0, 1,
-0.4774065, 0.9073076, -0.4977779, 0.1098039, 1, 0, 1,
-0.4771954, 1.24824, -1.412047, 0.1058824, 1, 0, 1,
-0.4759574, -0.3152887, -0.7375707, 0.09803922, 1, 0, 1,
-0.4744694, 0.5428245, -0.4501388, 0.09019608, 1, 0, 1,
-0.4722873, 0.4562903, -2.74046, 0.08627451, 1, 0, 1,
-0.4719212, 0.5671982, -0.5171162, 0.07843138, 1, 0, 1,
-0.4693627, 1.363878, 1.732215, 0.07450981, 1, 0, 1,
-0.4666871, -0.7189972, -0.6872722, 0.06666667, 1, 0, 1,
-0.4648682, -0.08112045, -1.484679, 0.0627451, 1, 0, 1,
-0.4632687, -0.4706804, -3.566259, 0.05490196, 1, 0, 1,
-0.4604136, 1.156194, 0.946836, 0.05098039, 1, 0, 1,
-0.4592396, 0.1291233, 0.2745074, 0.04313726, 1, 0, 1,
-0.4553601, 0.005048474, -0.6862532, 0.03921569, 1, 0, 1,
-0.4491662, -0.4814812, -3.404788, 0.03137255, 1, 0, 1,
-0.4480172, 1.144056, -0.1527222, 0.02745098, 1, 0, 1,
-0.4468638, -0.2903839, -1.931127, 0.01960784, 1, 0, 1,
-0.4444936, -1.307657, -1.308614, 0.01568628, 1, 0, 1,
-0.43854, 1.728465, -0.3912483, 0.007843138, 1, 0, 1,
-0.4372272, 1.642054, -1.034079, 0.003921569, 1, 0, 1,
-0.4347927, 0.3027485, -0.664785, 0, 1, 0.003921569, 1,
-0.4329014, 0.3539362, -0.9573256, 0, 1, 0.01176471, 1,
-0.4297533, 0.9017062, 0.6039787, 0, 1, 0.01568628, 1,
-0.4218717, -0.2391695, -4.001617, 0, 1, 0.02352941, 1,
-0.4182085, -0.4444943, -2.311522, 0, 1, 0.02745098, 1,
-0.416329, 0.6788807, 0.7243124, 0, 1, 0.03529412, 1,
-0.4141354, -0.5095798, -2.225212, 0, 1, 0.03921569, 1,
-0.4123129, -0.8046953, -3.299341, 0, 1, 0.04705882, 1,
-0.4101742, 1.815063, 0.9259437, 0, 1, 0.05098039, 1,
-0.4086785, -1.854251, -2.706186, 0, 1, 0.05882353, 1,
-0.407525, -0.4387947, -2.296175, 0, 1, 0.0627451, 1,
-0.4052777, -0.05549254, -4.834416, 0, 1, 0.07058824, 1,
-0.4045927, 1.086314, -1.157841, 0, 1, 0.07450981, 1,
-0.4013597, -0.5690932, -2.349187, 0, 1, 0.08235294, 1,
-0.3987432, -0.7761236, -3.531596, 0, 1, 0.08627451, 1,
-0.3910434, -0.9346677, -3.523942, 0, 1, 0.09411765, 1,
-0.3868248, 0.496453, -0.6397951, 0, 1, 0.1019608, 1,
-0.3815924, 2.723057, -1.650591, 0, 1, 0.1058824, 1,
-0.3789332, -1.918451, -2.673085, 0, 1, 0.1137255, 1,
-0.3770904, -0.2017245, -0.09426458, 0, 1, 0.1176471, 1,
-0.3767067, -1.85853, -0.2277673, 0, 1, 0.1254902, 1,
-0.3712952, -0.597179, -2.093765, 0, 1, 0.1294118, 1,
-0.370957, -0.2125172, 0.07757036, 0, 1, 0.1372549, 1,
-0.3641704, -0.1145791, -1.475365, 0, 1, 0.1411765, 1,
-0.363936, 1.285551, 0.5596213, 0, 1, 0.1490196, 1,
-0.3616568, 0.04435533, -0.8181633, 0, 1, 0.1529412, 1,
-0.3575162, -0.3058479, -3.056095, 0, 1, 0.1607843, 1,
-0.3564767, -0.642, -0.6650139, 0, 1, 0.1647059, 1,
-0.3523764, 0.7200478, -1.222523, 0, 1, 0.172549, 1,
-0.3500782, -1.841478, -2.548561, 0, 1, 0.1764706, 1,
-0.3466852, 1.762913, 0.916648, 0, 1, 0.1843137, 1,
-0.345651, 0.1055315, -2.98796, 0, 1, 0.1882353, 1,
-0.3415011, -0.2372168, -1.27438, 0, 1, 0.1960784, 1,
-0.3399292, -0.369764, -2.083017, 0, 1, 0.2039216, 1,
-0.3388271, 0.5557451, 0.4242204, 0, 1, 0.2078431, 1,
-0.3367195, -0.1601782, -3.598012, 0, 1, 0.2156863, 1,
-0.3355903, -0.986865, -3.945757, 0, 1, 0.2196078, 1,
-0.3317015, -0.2803252, -1.904619, 0, 1, 0.227451, 1,
-0.3299824, 1.080714, -0.1226319, 0, 1, 0.2313726, 1,
-0.3256386, 0.997489, -0.296093, 0, 1, 0.2392157, 1,
-0.3252603, 0.9870845, -1.534629, 0, 1, 0.2431373, 1,
-0.3248143, 0.4302353, -1.098203, 0, 1, 0.2509804, 1,
-0.3205331, -1.321208, -2.049445, 0, 1, 0.254902, 1,
-0.3181919, -0.05021551, -1.586386, 0, 1, 0.2627451, 1,
-0.3168091, 0.95042, -0.362867, 0, 1, 0.2666667, 1,
-0.3149774, -1.061359, -2.318268, 0, 1, 0.2745098, 1,
-0.3124243, -0.386959, -2.728196, 0, 1, 0.2784314, 1,
-0.3111024, 0.02222011, -0.7861838, 0, 1, 0.2862745, 1,
-0.309817, -1.341476, -2.489804, 0, 1, 0.2901961, 1,
-0.3059926, -0.5358656, -3.056663, 0, 1, 0.2980392, 1,
-0.2991495, 1.60243, -0.4376155, 0, 1, 0.3058824, 1,
-0.2933278, 0.2679934, 0.7389303, 0, 1, 0.3098039, 1,
-0.2923463, -3.439042, -3.601421, 0, 1, 0.3176471, 1,
-0.2867433, 0.7295111, 0.07181723, 0, 1, 0.3215686, 1,
-0.2859312, -0.5814509, -4.178228, 0, 1, 0.3294118, 1,
-0.2817273, -0.1538777, -3.606874, 0, 1, 0.3333333, 1,
-0.2774482, -0.7995726, -2.215708, 0, 1, 0.3411765, 1,
-0.277326, 2.394519, -0.1199433, 0, 1, 0.345098, 1,
-0.2772605, 0.8555006, -1.754864, 0, 1, 0.3529412, 1,
-0.2748824, -0.6918972, -2.841839, 0, 1, 0.3568628, 1,
-0.271485, -0.02997785, -0.8085816, 0, 1, 0.3647059, 1,
-0.2647429, -1.759485, -4.704646, 0, 1, 0.3686275, 1,
-0.2620588, -0.9201156, -3.353366, 0, 1, 0.3764706, 1,
-0.2579242, 0.2928286, 1.144824, 0, 1, 0.3803922, 1,
-0.2565743, 0.01216032, -0.7057843, 0, 1, 0.3882353, 1,
-0.2550905, 0.4528628, -0.4729263, 0, 1, 0.3921569, 1,
-0.2542682, -0.7267513, -1.265378, 0, 1, 0.4, 1,
-0.253127, -1.688746, -3.371684, 0, 1, 0.4078431, 1,
-0.2526952, -0.4473401, -3.787877, 0, 1, 0.4117647, 1,
-0.2465938, 0.6259634, -0.1660659, 0, 1, 0.4196078, 1,
-0.2458386, -1.088851, -3.000826, 0, 1, 0.4235294, 1,
-0.2450848, -0.05249251, -2.21079, 0, 1, 0.4313726, 1,
-0.2441539, -1.322155, -2.541495, 0, 1, 0.4352941, 1,
-0.2417304, 1.364267, -0.4691653, 0, 1, 0.4431373, 1,
-0.240865, -1.157094, -1.382704, 0, 1, 0.4470588, 1,
-0.2407795, -0.9029955, -3.439959, 0, 1, 0.454902, 1,
-0.2391771, 0.7528649, 0.1861182, 0, 1, 0.4588235, 1,
-0.2361834, -1.867349, -4.912568, 0, 1, 0.4666667, 1,
-0.23598, -0.5928445, -0.8201332, 0, 1, 0.4705882, 1,
-0.2336181, 1.495626, 1.028632, 0, 1, 0.4784314, 1,
-0.2263057, 0.3507747, -1.606053, 0, 1, 0.4823529, 1,
-0.2246471, 1.557982, -0.1471547, 0, 1, 0.4901961, 1,
-0.2232389, -0.9667242, -5.614237, 0, 1, 0.4941176, 1,
-0.2223653, 0.1920626, -2.366484, 0, 1, 0.5019608, 1,
-0.2194141, 0.2629196, -0.7017287, 0, 1, 0.509804, 1,
-0.2176511, -0.4533269, -2.261944, 0, 1, 0.5137255, 1,
-0.2139994, -1.292018, -2.33494, 0, 1, 0.5215687, 1,
-0.2130567, 1.207166, -0.1580705, 0, 1, 0.5254902, 1,
-0.206903, -1.115229, -3.400323, 0, 1, 0.5333334, 1,
-0.202242, 0.2464648, -0.8426486, 0, 1, 0.5372549, 1,
-0.2019343, -0.665305, -2.571573, 0, 1, 0.5450981, 1,
-0.2006342, 0.4086311, 0.9936486, 0, 1, 0.5490196, 1,
-0.1991397, -0.7535121, -3.694823, 0, 1, 0.5568628, 1,
-0.1964804, 1.148372, -0.5073713, 0, 1, 0.5607843, 1,
-0.1896109, -0.8506945, -2.648295, 0, 1, 0.5686275, 1,
-0.1880729, 1.094207, -0.6007548, 0, 1, 0.572549, 1,
-0.1879495, -0.6919701, -1.78024, 0, 1, 0.5803922, 1,
-0.1878863, -1.187238, -3.033423, 0, 1, 0.5843138, 1,
-0.1861199, 0.1178325, -1.141886, 0, 1, 0.5921569, 1,
-0.1745959, -1.485649, -2.556539, 0, 1, 0.5960785, 1,
-0.1727552, 0.9117191, -0.7590008, 0, 1, 0.6039216, 1,
-0.1718558, -0.1320293, -2.76086, 0, 1, 0.6117647, 1,
-0.1709859, -0.8489597, -4.074349, 0, 1, 0.6156863, 1,
-0.1682173, 0.1375616, -2.161817, 0, 1, 0.6235294, 1,
-0.1615686, -0.502243, -1.851025, 0, 1, 0.627451, 1,
-0.1582703, 0.4971731, 0.4092367, 0, 1, 0.6352941, 1,
-0.1569044, -1.842668, -2.6497, 0, 1, 0.6392157, 1,
-0.1565911, 1.188294, -0.04326383, 0, 1, 0.6470588, 1,
-0.1564504, 1.98808, 1.329069, 0, 1, 0.6509804, 1,
-0.1549513, -2.26686, -0.6929582, 0, 1, 0.6588235, 1,
-0.1545326, -1.616906, -4.622571, 0, 1, 0.6627451, 1,
-0.1534844, -1.301362, -4.678751, 0, 1, 0.6705883, 1,
-0.1466013, -0.2648667, -3.841812, 0, 1, 0.6745098, 1,
-0.1397533, -0.6755682, -4.711882, 0, 1, 0.682353, 1,
-0.1396692, -1.205879, -2.960968, 0, 1, 0.6862745, 1,
-0.1394663, 0.9307376, 0.4131292, 0, 1, 0.6941177, 1,
-0.1382651, -0.1389475, -1.68743, 0, 1, 0.7019608, 1,
-0.138162, 2.294589, 1.198891, 0, 1, 0.7058824, 1,
-0.1368215, -0.1616552, -1.299978, 0, 1, 0.7137255, 1,
-0.134138, -0.05108744, -2.261806, 0, 1, 0.7176471, 1,
-0.1332362, 0.7676765, 0.7122794, 0, 1, 0.7254902, 1,
-0.1325175, 0.323552, -2.539375, 0, 1, 0.7294118, 1,
-0.1285347, -1.483424, -3.596034, 0, 1, 0.7372549, 1,
-0.1268418, -0.2444988, 0.08563851, 0, 1, 0.7411765, 1,
-0.1263508, 0.3247787, -0.4494455, 0, 1, 0.7490196, 1,
-0.125678, -1.250848, -2.551474, 0, 1, 0.7529412, 1,
-0.1249284, 0.1272802, -0.7608671, 0, 1, 0.7607843, 1,
-0.1224707, -2.416344, -4.697637, 0, 1, 0.7647059, 1,
-0.117864, 2.471222, 0.08233728, 0, 1, 0.772549, 1,
-0.1172569, 0.4149821, 0.09348391, 0, 1, 0.7764706, 1,
-0.1159452, 0.5752907, -0.2956652, 0, 1, 0.7843137, 1,
-0.1146525, -0.1082406, -2.138363, 0, 1, 0.7882353, 1,
-0.1132268, -0.071876, -3.377426, 0, 1, 0.7960784, 1,
-0.1047529, 0.3424292, 1.046763, 0, 1, 0.8039216, 1,
-0.1034395, 1.316392, -0.2519933, 0, 1, 0.8078431, 1,
-0.1026604, -1.329569, -3.276964, 0, 1, 0.8156863, 1,
-0.1013676, 0.623352, -0.4744667, 0, 1, 0.8196079, 1,
-0.09916523, 0.8995044, -0.1203597, 0, 1, 0.827451, 1,
-0.09076086, 0.004338702, -1.146632, 0, 1, 0.8313726, 1,
-0.090299, -1.635157, -2.623434, 0, 1, 0.8392157, 1,
-0.08815438, 0.4523005, 1.445527, 0, 1, 0.8431373, 1,
-0.08750124, 0.4301528, -0.7517042, 0, 1, 0.8509804, 1,
-0.08744384, 0.6704451, -0.0195768, 0, 1, 0.854902, 1,
-0.08615665, -0.8013912, -2.359998, 0, 1, 0.8627451, 1,
-0.08552868, 0.5923688, 0.09400874, 0, 1, 0.8666667, 1,
-0.0839491, 0.4580669, -0.2991223, 0, 1, 0.8745098, 1,
-0.08173759, 0.6367098, -0.08049783, 0, 1, 0.8784314, 1,
-0.07658823, -1.072433, -2.247299, 0, 1, 0.8862745, 1,
-0.07627414, -1.215776, -2.017694, 0, 1, 0.8901961, 1,
-0.07236357, 0.3379484, 1.596066, 0, 1, 0.8980392, 1,
-0.07129767, -1.516232, -5.329329, 0, 1, 0.9058824, 1,
-0.06897828, 0.6638334, 0.7682238, 0, 1, 0.9098039, 1,
-0.06602555, 0.6094878, -0.071266, 0, 1, 0.9176471, 1,
-0.06519212, -0.2108222, -3.174939, 0, 1, 0.9215686, 1,
-0.06396898, -1.341709, -5.151547, 0, 1, 0.9294118, 1,
-0.0618767, -0.3611013, -2.563989, 0, 1, 0.9333333, 1,
-0.05878311, -1.25348, -1.613406, 0, 1, 0.9411765, 1,
-0.05876519, 0.341068, -1.123935, 0, 1, 0.945098, 1,
-0.05871775, -1.241767, -2.294906, 0, 1, 0.9529412, 1,
-0.05587896, 1.562214, 0.6157984, 0, 1, 0.9568627, 1,
-0.05402175, -1.483385, -4.860844, 0, 1, 0.9647059, 1,
-0.05383609, -0.4626426, -2.758672, 0, 1, 0.9686275, 1,
-0.05272882, 1.349668, -1.395052, 0, 1, 0.9764706, 1,
-0.05236937, -0.2001197, -2.746752, 0, 1, 0.9803922, 1,
-0.05010028, 2.360186, -1.500304, 0, 1, 0.9882353, 1,
-0.0496993, 1.500135, 0.7185349, 0, 1, 0.9921569, 1,
-0.04635856, -1.097714, -3.993988, 0, 1, 1, 1,
-0.04523163, -0.6602569, -3.202845, 0, 0.9921569, 1, 1,
-0.04447159, 0.5173649, 0.8643523, 0, 0.9882353, 1, 1,
-0.04159852, -2.226703, -2.830573, 0, 0.9803922, 1, 1,
-0.04147178, 0.4949119, 0.2697225, 0, 0.9764706, 1, 1,
-0.03552328, -0.157932, -5.03828, 0, 0.9686275, 1, 1,
-0.03483377, -1.010015, -4.40922, 0, 0.9647059, 1, 1,
-0.0321639, -0.378026, -3.687328, 0, 0.9568627, 1, 1,
-0.03017834, -1.205547, -1.704361, 0, 0.9529412, 1, 1,
-0.02878174, -0.674102, -1.555284, 0, 0.945098, 1, 1,
-0.02807081, -1.630785, -2.264279, 0, 0.9411765, 1, 1,
-0.02253662, 0.3948836, -0.2459303, 0, 0.9333333, 1, 1,
-0.0202151, 1.588204, 1.159258, 0, 0.9294118, 1, 1,
-0.01959567, -0.6344908, -1.996866, 0, 0.9215686, 1, 1,
-0.01863104, 1.893401, 1.727786, 0, 0.9176471, 1, 1,
-0.01829781, -1.552266, -2.669809, 0, 0.9098039, 1, 1,
-0.01772086, -0.06940519, -2.340107, 0, 0.9058824, 1, 1,
-0.01732573, -0.7446144, -3.447731, 0, 0.8980392, 1, 1,
-0.01396409, 0.9089496, -0.9035911, 0, 0.8901961, 1, 1,
-0.01354033, 1.044666, -1.340272, 0, 0.8862745, 1, 1,
-0.01275567, 1.796415, 1.1873, 0, 0.8784314, 1, 1,
-0.01192325, -0.3408274, -3.066245, 0, 0.8745098, 1, 1,
-0.01057078, -1.090166, -2.261643, 0, 0.8666667, 1, 1,
-0.00646484, -0.7816417, -2.799082, 0, 0.8627451, 1, 1,
-0.003553991, 0.03167778, 0.3806422, 0, 0.854902, 1, 1,
0.001910345, 0.3070819, -1.944826, 0, 0.8509804, 1, 1,
0.008364414, -0.142652, 3.527227, 0, 0.8431373, 1, 1,
0.008856904, -1.2469, 4.13301, 0, 0.8392157, 1, 1,
0.01124632, 0.7521298, -1.170554, 0, 0.8313726, 1, 1,
0.01223352, -0.3720039, 3.727763, 0, 0.827451, 1, 1,
0.01736535, 0.5400227, 0.73283, 0, 0.8196079, 1, 1,
0.01767571, 0.4777952, 0.9629068, 0, 0.8156863, 1, 1,
0.02076347, 1.529815, 0.0661736, 0, 0.8078431, 1, 1,
0.02264964, -1.42417, 5.053646, 0, 0.8039216, 1, 1,
0.03035132, -0.2456238, 1.682241, 0, 0.7960784, 1, 1,
0.03503042, 1.30889, 1.856061, 0, 0.7882353, 1, 1,
0.03668968, -1.66612, 3.494883, 0, 0.7843137, 1, 1,
0.03780852, -1.18, 3.400893, 0, 0.7764706, 1, 1,
0.04058971, -0.3087696, 3.557451, 0, 0.772549, 1, 1,
0.04064374, -0.8402697, 2.584771, 0, 0.7647059, 1, 1,
0.04528524, 0.4907191, 0.8230263, 0, 0.7607843, 1, 1,
0.04668941, 0.008501533, 1.457016, 0, 0.7529412, 1, 1,
0.05151192, -0.08632647, 3.427163, 0, 0.7490196, 1, 1,
0.05341895, -0.1906454, 2.273492, 0, 0.7411765, 1, 1,
0.05348096, 0.4342201, 1.173078, 0, 0.7372549, 1, 1,
0.05392504, 1.207442, -1.502921, 0, 0.7294118, 1, 1,
0.05484876, 1.213286, 0.8504323, 0, 0.7254902, 1, 1,
0.05661203, 0.3603028, 1.385116, 0, 0.7176471, 1, 1,
0.06103615, -0.7146443, 3.831218, 0, 0.7137255, 1, 1,
0.0666229, -0.8107825, 3.785557, 0, 0.7058824, 1, 1,
0.06999209, -0.894851, 3.496519, 0, 0.6980392, 1, 1,
0.07054482, -2.168658, 2.249311, 0, 0.6941177, 1, 1,
0.07118665, 0.5433154, 2.394922, 0, 0.6862745, 1, 1,
0.07181155, 0.5567111, -1.553599, 0, 0.682353, 1, 1,
0.07470032, 1.254688, 0.2910064, 0, 0.6745098, 1, 1,
0.07745291, 0.5840929, -0.2044465, 0, 0.6705883, 1, 1,
0.08203867, 0.7439399, -1.000617, 0, 0.6627451, 1, 1,
0.08209455, -0.03537959, 2.980741, 0, 0.6588235, 1, 1,
0.08209917, 0.04248561, 0.6850818, 0, 0.6509804, 1, 1,
0.08807167, 0.4327588, 0.1597604, 0, 0.6470588, 1, 1,
0.08886052, 0.3867671, -0.1738255, 0, 0.6392157, 1, 1,
0.09755243, -0.2876141, 2.929743, 0, 0.6352941, 1, 1,
0.09781536, -0.3723145, 2.933653, 0, 0.627451, 1, 1,
0.09920141, -1.193146, 1.861322, 0, 0.6235294, 1, 1,
0.1020402, 0.6533383, 0.4476278, 0, 0.6156863, 1, 1,
0.1070836, 0.7662114, 0.0500275, 0, 0.6117647, 1, 1,
0.1088685, -1.165622, 0.8304358, 0, 0.6039216, 1, 1,
0.1088878, 0.744126, 0.5513476, 0, 0.5960785, 1, 1,
0.1098969, -0.3896571, 2.494159, 0, 0.5921569, 1, 1,
0.1142792, 2.173996, 0.5362934, 0, 0.5843138, 1, 1,
0.1168969, 0.05081328, 1.420574, 0, 0.5803922, 1, 1,
0.1188349, 0.7463635, 0.1241488, 0, 0.572549, 1, 1,
0.1192374, -0.4844102, 3.792367, 0, 0.5686275, 1, 1,
0.1214613, 0.4204904, 1.225124, 0, 0.5607843, 1, 1,
0.1290554, -0.7194893, 3.90426, 0, 0.5568628, 1, 1,
0.1291756, -0.3005483, 1.579439, 0, 0.5490196, 1, 1,
0.1303028, -0.9991688, 2.651175, 0, 0.5450981, 1, 1,
0.1319329, 1.409778, 1.644113, 0, 0.5372549, 1, 1,
0.1379418, -0.45288, 3.301609, 0, 0.5333334, 1, 1,
0.1436918, 0.2581558, 0.9368327, 0, 0.5254902, 1, 1,
0.1501854, 0.9435911, 1.344277, 0, 0.5215687, 1, 1,
0.1505192, 0.4243069, -1.384586, 0, 0.5137255, 1, 1,
0.1513746, -3.361575, 3.139843, 0, 0.509804, 1, 1,
0.154091, -0.7017868, 1.975546, 0, 0.5019608, 1, 1,
0.1572212, -0.04832043, 1.863435, 0, 0.4941176, 1, 1,
0.1599551, -0.1881096, 1.851334, 0, 0.4901961, 1, 1,
0.1644604, 0.8177165, 0.2748914, 0, 0.4823529, 1, 1,
0.1645585, -1.488229, 1.561439, 0, 0.4784314, 1, 1,
0.1653538, 1.264328, -3.825698, 0, 0.4705882, 1, 1,
0.1658793, 1.706759, 1.010222, 0, 0.4666667, 1, 1,
0.1662474, 0.07403821, 0.5422195, 0, 0.4588235, 1, 1,
0.1672427, 0.7153233, 0.4266663, 0, 0.454902, 1, 1,
0.1676423, -0.2477673, 2.963951, 0, 0.4470588, 1, 1,
0.1680311, -0.5928668, 2.789388, 0, 0.4431373, 1, 1,
0.1753051, 0.8477454, -0.7822934, 0, 0.4352941, 1, 1,
0.175577, -1.167548, 2.901645, 0, 0.4313726, 1, 1,
0.1771892, -0.006373188, 0.0798537, 0, 0.4235294, 1, 1,
0.1774862, 0.5379413, 1.821606, 0, 0.4196078, 1, 1,
0.1943877, 1.854, -1.351504, 0, 0.4117647, 1, 1,
0.1977819, -0.3604281, 2.167038, 0, 0.4078431, 1, 1,
0.203018, 0.4413913, 1.406247, 0, 0.4, 1, 1,
0.2059994, 1.504077, 1.761486, 0, 0.3921569, 1, 1,
0.2181958, -0.5744121, 2.924884, 0, 0.3882353, 1, 1,
0.2335292, -0.5436285, 4.546005, 0, 0.3803922, 1, 1,
0.2354314, -2.03704, 0.4993073, 0, 0.3764706, 1, 1,
0.2359959, -0.3885424, 3.745559, 0, 0.3686275, 1, 1,
0.2397264, -1.231811, 5.256792, 0, 0.3647059, 1, 1,
0.2420397, -0.1279541, 2.603261, 0, 0.3568628, 1, 1,
0.2427232, -1.050543, 2.98384, 0, 0.3529412, 1, 1,
0.2440693, -0.4256437, 1.941985, 0, 0.345098, 1, 1,
0.2487922, 0.8221254, -0.5107653, 0, 0.3411765, 1, 1,
0.2507135, 0.4558039, 0.2303429, 0, 0.3333333, 1, 1,
0.2585309, -0.1286798, 2.272078, 0, 0.3294118, 1, 1,
0.2618608, -0.4951781, 2.679087, 0, 0.3215686, 1, 1,
0.2624038, 1.742924, 0.1696874, 0, 0.3176471, 1, 1,
0.2640643, 0.9983804, 1.731705, 0, 0.3098039, 1, 1,
0.2646695, -0.1078048, 1.92525, 0, 0.3058824, 1, 1,
0.2665362, 1.117928, -0.524182, 0, 0.2980392, 1, 1,
0.2683755, -0.6900018, 2.140328, 0, 0.2901961, 1, 1,
0.2707044, -0.9726222, 3.329268, 0, 0.2862745, 1, 1,
0.2711246, -0.5940681, 4.098083, 0, 0.2784314, 1, 1,
0.2721686, 0.4794006, 0.4564973, 0, 0.2745098, 1, 1,
0.2747111, 1.044206, -0.6013854, 0, 0.2666667, 1, 1,
0.275505, -0.6749887, 3.609713, 0, 0.2627451, 1, 1,
0.2771012, -0.1346689, 3.398338, 0, 0.254902, 1, 1,
0.2794454, 1.293137, -0.6718469, 0, 0.2509804, 1, 1,
0.2832368, 0.7026498, 0.8800999, 0, 0.2431373, 1, 1,
0.2863745, 0.6062353, 0.07922442, 0, 0.2392157, 1, 1,
0.2867281, 1.497925, 0.4513012, 0, 0.2313726, 1, 1,
0.2881834, -0.03617756, -0.4008446, 0, 0.227451, 1, 1,
0.2908346, 0.0764557, 0.05135913, 0, 0.2196078, 1, 1,
0.2915564, -0.8753676, 1.449241, 0, 0.2156863, 1, 1,
0.2943115, 0.1979578, 1.0064, 0, 0.2078431, 1, 1,
0.2956075, 0.9379581, 1.068527, 0, 0.2039216, 1, 1,
0.2974908, -0.02357013, 1.211542, 0, 0.1960784, 1, 1,
0.2980599, 1.244039, -0.8602569, 0, 0.1882353, 1, 1,
0.2985133, 0.4514352, -0.4999584, 0, 0.1843137, 1, 1,
0.3002115, 1.147997, -0.3135233, 0, 0.1764706, 1, 1,
0.3008832, 0.5106203, -1.371994, 0, 0.172549, 1, 1,
0.3040983, 0.5846313, -0.1376993, 0, 0.1647059, 1, 1,
0.304229, -0.6985791, 1.19275, 0, 0.1607843, 1, 1,
0.3048924, -0.02891603, 2.988732, 0, 0.1529412, 1, 1,
0.3179406, 1.209284, 0.2548302, 0, 0.1490196, 1, 1,
0.3189804, -1.609071, 2.828621, 0, 0.1411765, 1, 1,
0.3203654, -0.3378923, 1.770387, 0, 0.1372549, 1, 1,
0.3239549, 0.09509428, 1.073484, 0, 0.1294118, 1, 1,
0.3263173, -1.262341, 3.233851, 0, 0.1254902, 1, 1,
0.3264695, 0.6048126, 0.4808345, 0, 0.1176471, 1, 1,
0.3272585, -0.4044422, 1.991448, 0, 0.1137255, 1, 1,
0.3295839, 0.2361048, 2.287878, 0, 0.1058824, 1, 1,
0.3332725, 0.598133, -1.687611, 0, 0.09803922, 1, 1,
0.3336459, -0.2449227, 2.287248, 0, 0.09411765, 1, 1,
0.3347267, -0.793048, 2.45233, 0, 0.08627451, 1, 1,
0.3394639, -0.7067305, 1.773785, 0, 0.08235294, 1, 1,
0.3448673, -1.728134, 3.270254, 0, 0.07450981, 1, 1,
0.3449932, -1.875084, 4.379113, 0, 0.07058824, 1, 1,
0.3476051, -0.5077789, 2.754461, 0, 0.0627451, 1, 1,
0.3518743, -0.2858894, 2.795875, 0, 0.05882353, 1, 1,
0.3519177, 0.7415484, 1.595462, 0, 0.05098039, 1, 1,
0.3558083, -1.349309, 3.814305, 0, 0.04705882, 1, 1,
0.3584768, 0.7025663, 0.9290313, 0, 0.03921569, 1, 1,
0.3626894, -1.164014, 5.57733, 0, 0.03529412, 1, 1,
0.3630559, 1.925533, -1.466354, 0, 0.02745098, 1, 1,
0.3635863, 0.8010595, -1.535853, 0, 0.02352941, 1, 1,
0.3650841, -1.334898, 2.528812, 0, 0.01568628, 1, 1,
0.3690668, 0.4895586, 0.2810188, 0, 0.01176471, 1, 1,
0.3702113, -1.612207, 3.41549, 0, 0.003921569, 1, 1,
0.3714836, -1.481001, 3.315895, 0.003921569, 0, 1, 1,
0.3717882, 1.607881, -1.086232, 0.007843138, 0, 1, 1,
0.3723567, 0.7175111, 0.3559472, 0.01568628, 0, 1, 1,
0.3730261, 1.721985, 0.1674855, 0.01960784, 0, 1, 1,
0.3758535, 1.084925, 1.54062, 0.02745098, 0, 1, 1,
0.3801303, -0.3689446, 1.875943, 0.03137255, 0, 1, 1,
0.3828547, 1.084013, 0.1884582, 0.03921569, 0, 1, 1,
0.3860405, -0.2490346, 2.396822, 0.04313726, 0, 1, 1,
0.394068, 0.4941582, 0.6000038, 0.05098039, 0, 1, 1,
0.3965004, -0.04203398, 0.2208107, 0.05490196, 0, 1, 1,
0.3967801, -0.3900077, 2.280642, 0.0627451, 0, 1, 1,
0.3977851, -1.014908, 2.209105, 0.06666667, 0, 1, 1,
0.4045672, 0.1818196, 0.1091052, 0.07450981, 0, 1, 1,
0.4068958, 0.1412918, 2.196504, 0.07843138, 0, 1, 1,
0.4122247, -1.765851, 1.892082, 0.08627451, 0, 1, 1,
0.4164718, -0.3689443, 2.76067, 0.09019608, 0, 1, 1,
0.4184426, -0.8268817, 2.1349, 0.09803922, 0, 1, 1,
0.4185301, -0.9455071, 3.219111, 0.1058824, 0, 1, 1,
0.4190084, -1.214449, 3.332817, 0.1098039, 0, 1, 1,
0.4196614, 0.5411724, 0.5651679, 0.1176471, 0, 1, 1,
0.4327959, 0.1807773, 1.441277, 0.1215686, 0, 1, 1,
0.437405, -0.8625499, 1.852814, 0.1294118, 0, 1, 1,
0.4402856, -2.461811, 1.357121, 0.1333333, 0, 1, 1,
0.4410795, -1.207637, 2.542799, 0.1411765, 0, 1, 1,
0.4429248, 0.6100082, 0.5758483, 0.145098, 0, 1, 1,
0.4443471, -0.1774189, 1.092739, 0.1529412, 0, 1, 1,
0.4540857, -0.1783, 2.145005, 0.1568628, 0, 1, 1,
0.455482, 0.4179555, 0.3393131, 0.1647059, 0, 1, 1,
0.4563973, -1.209336, 2.155352, 0.1686275, 0, 1, 1,
0.4570272, -1.815445, 2.413967, 0.1764706, 0, 1, 1,
0.4576271, 0.4824048, 0.3466256, 0.1803922, 0, 1, 1,
0.457693, -0.002086111, 0.1267457, 0.1882353, 0, 1, 1,
0.4627135, -0.6829702, 1.543933, 0.1921569, 0, 1, 1,
0.4660731, -0.08982866, 0.2108684, 0.2, 0, 1, 1,
0.4674946, -0.2217943, 0.8340233, 0.2078431, 0, 1, 1,
0.4725587, -0.928502, 2.76097, 0.2117647, 0, 1, 1,
0.4733106, -0.7998893, 3.425938, 0.2196078, 0, 1, 1,
0.4734445, 1.028937, -0.4387187, 0.2235294, 0, 1, 1,
0.4759631, -0.4496083, 1.007815, 0.2313726, 0, 1, 1,
0.4760722, -0.01421575, 0.6382993, 0.2352941, 0, 1, 1,
0.4777392, -1.401891, 1.877993, 0.2431373, 0, 1, 1,
0.481416, 1.736949, -0.1693655, 0.2470588, 0, 1, 1,
0.4844142, 0.4975277, 2.130349, 0.254902, 0, 1, 1,
0.4853427, 0.2540711, 2.946264, 0.2588235, 0, 1, 1,
0.4935592, -1.317782, 3.686964, 0.2666667, 0, 1, 1,
0.495004, 1.37392, 0.7126079, 0.2705882, 0, 1, 1,
0.4954531, -1.927607, 3.064397, 0.2784314, 0, 1, 1,
0.4998408, 0.4225024, 0.3532504, 0.282353, 0, 1, 1,
0.5005038, -0.9037797, 1.702436, 0.2901961, 0, 1, 1,
0.5093492, -0.07727475, 0.8305426, 0.2941177, 0, 1, 1,
0.5095979, -0.3739997, 1.912702, 0.3019608, 0, 1, 1,
0.5099726, 0.1475078, 0.2086339, 0.3098039, 0, 1, 1,
0.5100371, -0.3290371, 1.849377, 0.3137255, 0, 1, 1,
0.5131947, -1.337885, 4.090402, 0.3215686, 0, 1, 1,
0.5209034, -0.08388861, 2.253066, 0.3254902, 0, 1, 1,
0.5211852, 0.1539874, 0.03290389, 0.3333333, 0, 1, 1,
0.5221598, 0.7817702, -0.07076246, 0.3372549, 0, 1, 1,
0.5240375, -0.486868, 3.623163, 0.345098, 0, 1, 1,
0.5261045, 0.5176684, -0.03038299, 0.3490196, 0, 1, 1,
0.5303639, -0.1829759, 2.004987, 0.3568628, 0, 1, 1,
0.5312902, 0.9499933, 2.040694, 0.3607843, 0, 1, 1,
0.5351346, -1.582389, 1.230197, 0.3686275, 0, 1, 1,
0.5362883, 0.3003012, 1.804025, 0.372549, 0, 1, 1,
0.5386243, -0.7608403, 2.217443, 0.3803922, 0, 1, 1,
0.5389097, 0.2745717, 1.456249, 0.3843137, 0, 1, 1,
0.539508, 0.7252286, 0.6872833, 0.3921569, 0, 1, 1,
0.5433446, 1.204999, -0.619441, 0.3960784, 0, 1, 1,
0.5474882, -1.06102, 2.558039, 0.4039216, 0, 1, 1,
0.5477741, -1.235411, 4.02712, 0.4117647, 0, 1, 1,
0.5571088, 1.300592, 1.43046, 0.4156863, 0, 1, 1,
0.5641284, -1.602408, 4.560573, 0.4235294, 0, 1, 1,
0.5681433, -0.5486174, 4.054499, 0.427451, 0, 1, 1,
0.5686202, -0.367484, 3.187767, 0.4352941, 0, 1, 1,
0.5755843, 0.229701, 0.9525853, 0.4392157, 0, 1, 1,
0.5760773, 0.9983141, 0.894551, 0.4470588, 0, 1, 1,
0.5761601, 0.419007, 1.4969, 0.4509804, 0, 1, 1,
0.5838322, -0.3378711, 2.376944, 0.4588235, 0, 1, 1,
0.5846243, 1.459654, 0.9387359, 0.4627451, 0, 1, 1,
0.5864187, -0.7123044, 2.456756, 0.4705882, 0, 1, 1,
0.5946689, 0.9469495, 1.395989, 0.4745098, 0, 1, 1,
0.5969089, -0.3929203, 0.9318833, 0.4823529, 0, 1, 1,
0.5981899, 1.45644, 0.3171075, 0.4862745, 0, 1, 1,
0.6003848, -0.7277336, 0.8877039, 0.4941176, 0, 1, 1,
0.6033206, -0.6340615, 1.891839, 0.5019608, 0, 1, 1,
0.6053289, -0.8938339, 1.179539, 0.5058824, 0, 1, 1,
0.6096555, 0.487688, -0.3820462, 0.5137255, 0, 1, 1,
0.6121596, 0.1850036, 1.690122, 0.5176471, 0, 1, 1,
0.6215746, 1.755018, 0.1023909, 0.5254902, 0, 1, 1,
0.6242113, -0.08231084, 1.456984, 0.5294118, 0, 1, 1,
0.6272284, -0.1772179, 0.9770165, 0.5372549, 0, 1, 1,
0.6333777, -0.5207153, -0.2002458, 0.5411765, 0, 1, 1,
0.6361246, -0.126213, 1.787397, 0.5490196, 0, 1, 1,
0.6371142, -0.6592126, 1.19511, 0.5529412, 0, 1, 1,
0.6395583, -1.509833, 2.53759, 0.5607843, 0, 1, 1,
0.6406757, 0.09967057, 2.448686, 0.5647059, 0, 1, 1,
0.6491204, 2.01499, 0.2906744, 0.572549, 0, 1, 1,
0.6492434, 1.546968, 0.3873287, 0.5764706, 0, 1, 1,
0.65538, -0.3843898, 2.934669, 0.5843138, 0, 1, 1,
0.6577638, -0.1758202, 1.525331, 0.5882353, 0, 1, 1,
0.6580339, -0.3436943, 3.032321, 0.5960785, 0, 1, 1,
0.664196, 2.368637, -0.03350651, 0.6039216, 0, 1, 1,
0.6687932, -1.408198, 2.099157, 0.6078432, 0, 1, 1,
0.6691281, 0.17931, 0.9528429, 0.6156863, 0, 1, 1,
0.6734238, 0.1175206, 1.474037, 0.6196079, 0, 1, 1,
0.6742065, -0.656085, 2.662036, 0.627451, 0, 1, 1,
0.6786444, 1.224756, 0.2341354, 0.6313726, 0, 1, 1,
0.685614, 0.04486734, 1.934271, 0.6392157, 0, 1, 1,
0.6950043, -1.701351, 2.924635, 0.6431373, 0, 1, 1,
0.7002525, 1.51596, 0.535912, 0.6509804, 0, 1, 1,
0.7010943, -1.37414, 2.94386, 0.654902, 0, 1, 1,
0.7070266, 0.1334805, 0.5628765, 0.6627451, 0, 1, 1,
0.7080016, 0.8951299, 1.726753, 0.6666667, 0, 1, 1,
0.715342, -0.239851, 2.290233, 0.6745098, 0, 1, 1,
0.7201425, 0.345566, 0.1671979, 0.6784314, 0, 1, 1,
0.7288485, -0.07911108, 2.712903, 0.6862745, 0, 1, 1,
0.7328846, -0.3530347, 0.6023297, 0.6901961, 0, 1, 1,
0.7413222, -0.6743385, 1.388936, 0.6980392, 0, 1, 1,
0.7421578, -0.9485779, 3.644221, 0.7058824, 0, 1, 1,
0.7430043, -1.205607, 5.040455, 0.7098039, 0, 1, 1,
0.7435423, -1.257033, 4.20663, 0.7176471, 0, 1, 1,
0.7467034, -0.08452407, 2.335513, 0.7215686, 0, 1, 1,
0.7487644, 0.9427403, 0.8884125, 0.7294118, 0, 1, 1,
0.7517421, 0.5527403, 3.548211, 0.7333333, 0, 1, 1,
0.7555683, -0.7667927, 2.870736, 0.7411765, 0, 1, 1,
0.7581252, -0.04356379, 1.029186, 0.7450981, 0, 1, 1,
0.7647583, -0.2097, 2.37354, 0.7529412, 0, 1, 1,
0.7701595, -1.617307, 3.019683, 0.7568628, 0, 1, 1,
0.7706048, 0.7706431, 0.6861245, 0.7647059, 0, 1, 1,
0.7784723, 0.4506719, 0.01806473, 0.7686275, 0, 1, 1,
0.7801552, -0.5819421, 1.127956, 0.7764706, 0, 1, 1,
0.7814286, 0.6358429, 1.742183, 0.7803922, 0, 1, 1,
0.7915987, -1.068166, 0.9321792, 0.7882353, 0, 1, 1,
0.7993289, 0.5544829, -1.020247, 0.7921569, 0, 1, 1,
0.8008361, 1.536143, 0.1151147, 0.8, 0, 1, 1,
0.8134369, 0.4918228, 1.234928, 0.8078431, 0, 1, 1,
0.8146409, -1.210019, 2.247837, 0.8117647, 0, 1, 1,
0.8149848, -2.427991, 4.705346, 0.8196079, 0, 1, 1,
0.81623, -0.03483611, 2.355324, 0.8235294, 0, 1, 1,
0.8210801, 2.325315, 0.9543508, 0.8313726, 0, 1, 1,
0.821221, 0.2547292, 2.794181, 0.8352941, 0, 1, 1,
0.8228055, -0.4555264, 1.681685, 0.8431373, 0, 1, 1,
0.8434598, -0.02578168, 3.235166, 0.8470588, 0, 1, 1,
0.8447704, -0.512161, 1.785301, 0.854902, 0, 1, 1,
0.8558452, 0.3877976, 1.665492, 0.8588235, 0, 1, 1,
0.8572141, 1.404118, 0.5574045, 0.8666667, 0, 1, 1,
0.8575772, 0.4082446, 0.3532042, 0.8705882, 0, 1, 1,
0.862149, -0.8483686, 2.277527, 0.8784314, 0, 1, 1,
0.8681411, 0.3379117, 2.353054, 0.8823529, 0, 1, 1,
0.8699356, -0.1175941, 0.8095734, 0.8901961, 0, 1, 1,
0.8702087, 1.043981, 0.1428527, 0.8941177, 0, 1, 1,
0.8703331, 0.3680746, 0.1710896, 0.9019608, 0, 1, 1,
0.8830816, 0.4603729, 1.191276, 0.9098039, 0, 1, 1,
0.8877832, 0.6779721, 0.02477506, 0.9137255, 0, 1, 1,
0.8897631, -0.07526207, 0.5976868, 0.9215686, 0, 1, 1,
0.9003093, 0.06808662, 1.4911, 0.9254902, 0, 1, 1,
0.9011714, 0.9820451, -0.2126155, 0.9333333, 0, 1, 1,
0.9054565, -1.949289, 4.347486, 0.9372549, 0, 1, 1,
0.9101967, -0.6549919, 2.31538, 0.945098, 0, 1, 1,
0.9116967, -1.457485, 0.6703555, 0.9490196, 0, 1, 1,
0.9152169, 2.074834, -0.710735, 0.9568627, 0, 1, 1,
0.9153057, 0.02027486, 1.884078, 0.9607843, 0, 1, 1,
0.915644, -1.414333, 2.644659, 0.9686275, 0, 1, 1,
0.9194103, -0.6012503, 4.057315, 0.972549, 0, 1, 1,
0.9220391, 1.16707, 1.158512, 0.9803922, 0, 1, 1,
0.9223846, -0.8298379, 2.59937, 0.9843137, 0, 1, 1,
0.9259689, 1.647031, 2.089154, 0.9921569, 0, 1, 1,
0.9338112, -1.218298, 0.9821838, 0.9960784, 0, 1, 1,
0.9433069, -0.1953779, 1.930171, 1, 0, 0.9960784, 1,
0.9453138, -0.3417999, 3.563196, 1, 0, 0.9882353, 1,
0.9460742, -0.2469864, 4.963042, 1, 0, 0.9843137, 1,
0.9465287, 0.4053402, 0.7497917, 1, 0, 0.9764706, 1,
0.947419, -1.026992, 2.584006, 1, 0, 0.972549, 1,
0.9632947, -0.9027162, 2.065441, 1, 0, 0.9647059, 1,
0.9703436, 0.9058891, -0.02658085, 1, 0, 0.9607843, 1,
0.9721744, -0.7539015, 3.595008, 1, 0, 0.9529412, 1,
0.9741966, 0.04265638, 0.6990631, 1, 0, 0.9490196, 1,
0.9744171, -0.9196312, 3.081047, 1, 0, 0.9411765, 1,
0.9749476, 0.3981043, -1.559236, 1, 0, 0.9372549, 1,
0.9781783, 0.7037183, 0.3024947, 1, 0, 0.9294118, 1,
0.9794441, -0.5314722, 3.092471, 1, 0, 0.9254902, 1,
0.9833295, -0.3609042, 2.272312, 1, 0, 0.9176471, 1,
0.9877154, -1.101429, 2.376906, 1, 0, 0.9137255, 1,
0.9895946, 0.5811841, 0.6929141, 1, 0, 0.9058824, 1,
1.004173, -0.2762263, 1.121435, 1, 0, 0.9019608, 1,
1.010561, 0.008505372, 0.462278, 1, 0, 0.8941177, 1,
1.015103, -0.1713176, 1.886941, 1, 0, 0.8862745, 1,
1.015949, 0.8226873, 1.685559, 1, 0, 0.8823529, 1,
1.025955, -0.4051262, 1.450119, 1, 0, 0.8745098, 1,
1.026541, 0.9827761, 0.8801659, 1, 0, 0.8705882, 1,
1.027204, -0.5902922, 1.573092, 1, 0, 0.8627451, 1,
1.028665, 0.5196622, 0.6238773, 1, 0, 0.8588235, 1,
1.034248, 1.275214, -0.5599609, 1, 0, 0.8509804, 1,
1.037443, -0.3523473, 2.531657, 1, 0, 0.8470588, 1,
1.037981, -0.3073709, 1.709936, 1, 0, 0.8392157, 1,
1.04737, -0.09233081, 0.8700793, 1, 0, 0.8352941, 1,
1.052927, -0.4858971, 1.44915, 1, 0, 0.827451, 1,
1.054971, 1.052283, 0.5006548, 1, 0, 0.8235294, 1,
1.055618, 0.05753961, 2.74307, 1, 0, 0.8156863, 1,
1.05971, -0.6611177, -0.09670136, 1, 0, 0.8117647, 1,
1.060238, 0.8380535, 0.6064091, 1, 0, 0.8039216, 1,
1.063589, -1.555125, 3.735649, 1, 0, 0.7960784, 1,
1.073172, 0.3157399, 0.7676488, 1, 0, 0.7921569, 1,
1.073534, 0.273847, 1.20662, 1, 0, 0.7843137, 1,
1.079144, -0.87771, 1.841104, 1, 0, 0.7803922, 1,
1.08412, 0.6903047, 0.6206073, 1, 0, 0.772549, 1,
1.08842, 0.6112157, 0.5050613, 1, 0, 0.7686275, 1,
1.103833, 1.114992, -0.1302592, 1, 0, 0.7607843, 1,
1.111753, -0.03518164, 0.5003932, 1, 0, 0.7568628, 1,
1.116976, -0.7546074, 0.9384782, 1, 0, 0.7490196, 1,
1.117511, -0.086291, 0.6986097, 1, 0, 0.7450981, 1,
1.122059, -0.1641227, 2.940475, 1, 0, 0.7372549, 1,
1.124415, -0.2211078, 2.307015, 1, 0, 0.7333333, 1,
1.125735, -0.5700923, 0.4756931, 1, 0, 0.7254902, 1,
1.127956, -0.258145, 0.3094005, 1, 0, 0.7215686, 1,
1.131614, -1.010541, 1.565153, 1, 0, 0.7137255, 1,
1.134377, -1.226729, 2.411994, 1, 0, 0.7098039, 1,
1.142949, 0.02429171, -0.4566428, 1, 0, 0.7019608, 1,
1.15316, 0.7559674, 0.7094293, 1, 0, 0.6941177, 1,
1.159775, -0.3255853, 1.283751, 1, 0, 0.6901961, 1,
1.161328, 0.9926664, 0.592394, 1, 0, 0.682353, 1,
1.168422, -0.01156993, 3.566983, 1, 0, 0.6784314, 1,
1.184135, -0.02526711, 1.898928, 1, 0, 0.6705883, 1,
1.184875, 0.9834341, 0.5367378, 1, 0, 0.6666667, 1,
1.188036, -0.3186426, 2.427371, 1, 0, 0.6588235, 1,
1.199976, 0.8346867, 1.499418, 1, 0, 0.654902, 1,
1.208162, -1.915072, 2.637316, 1, 0, 0.6470588, 1,
1.219845, -0.2567756, 1.113811, 1, 0, 0.6431373, 1,
1.22812, 0.1355305, 2.086094, 1, 0, 0.6352941, 1,
1.229759, -0.523177, 1.578355, 1, 0, 0.6313726, 1,
1.241105, -1.100217, 1.983894, 1, 0, 0.6235294, 1,
1.254485, -0.5689355, 1.588204, 1, 0, 0.6196079, 1,
1.254789, -0.846436, 2.425649, 1, 0, 0.6117647, 1,
1.269165, -0.5330486, 1.580202, 1, 0, 0.6078432, 1,
1.269465, 0.2647792, 0.1865322, 1, 0, 0.6, 1,
1.2907, -1.591562, 1.412424, 1, 0, 0.5921569, 1,
1.29479, -2.145386, 2.878773, 1, 0, 0.5882353, 1,
1.29917, -0.2650069, 1.091442, 1, 0, 0.5803922, 1,
1.300152, -0.4597251, 0.995479, 1, 0, 0.5764706, 1,
1.300644, 0.1449266, 0.4157167, 1, 0, 0.5686275, 1,
1.306181, -0.5593406, 1.262911, 1, 0, 0.5647059, 1,
1.310199, 1.573072, 1.723065, 1, 0, 0.5568628, 1,
1.312176, -0.5994996, 2.274263, 1, 0, 0.5529412, 1,
1.31333, 1.981146, 0.251537, 1, 0, 0.5450981, 1,
1.323868, -0.7937233, 2.42492, 1, 0, 0.5411765, 1,
1.325883, 0.9651614, 0.3387529, 1, 0, 0.5333334, 1,
1.327829, 1.044306, 1.571764, 1, 0, 0.5294118, 1,
1.335073, -0.5315832, 0.7883615, 1, 0, 0.5215687, 1,
1.343032, 0.1152332, 1.434343, 1, 0, 0.5176471, 1,
1.348961, -0.1264728, 1.741901, 1, 0, 0.509804, 1,
1.366907, -2.615163, 2.827962, 1, 0, 0.5058824, 1,
1.372734, 1.315627, -0.01900294, 1, 0, 0.4980392, 1,
1.389781, 1.450558, 0.46635, 1, 0, 0.4901961, 1,
1.403039, -0.08405232, 2.586513, 1, 0, 0.4862745, 1,
1.414039, 0.2762575, 1.585174, 1, 0, 0.4784314, 1,
1.419287, 0.7613807, 0.8579282, 1, 0, 0.4745098, 1,
1.42168, -1.220798, 2.595558, 1, 0, 0.4666667, 1,
1.422655, -1.333086, 2.086652, 1, 0, 0.4627451, 1,
1.428819, -0.4721885, 2.393735, 1, 0, 0.454902, 1,
1.447079, -0.1541658, 1.582956, 1, 0, 0.4509804, 1,
1.447773, 0.2366677, 3.466648, 1, 0, 0.4431373, 1,
1.44789, 0.938536, 0.543474, 1, 0, 0.4392157, 1,
1.452721, 0.7052433, -0.1637764, 1, 0, 0.4313726, 1,
1.455894, -0.6349014, 1.471297, 1, 0, 0.427451, 1,
1.459058, 0.9238459, 1.516982, 1, 0, 0.4196078, 1,
1.491276, 0.5090353, 0.8335993, 1, 0, 0.4156863, 1,
1.493029, -1.068697, 3.202895, 1, 0, 0.4078431, 1,
1.49533, 0.5637021, 2.751098, 1, 0, 0.4039216, 1,
1.519172, -0.2919461, 0.01612012, 1, 0, 0.3960784, 1,
1.51973, 1.153004, 1.29905, 1, 0, 0.3882353, 1,
1.521635, -0.1160285, -1.519506, 1, 0, 0.3843137, 1,
1.545717, -0.3258712, 1.472734, 1, 0, 0.3764706, 1,
1.571252, 0.6785719, 0.1459962, 1, 0, 0.372549, 1,
1.575343, -0.5111917, 1.197935, 1, 0, 0.3647059, 1,
1.583388, -1.60543, 2.906863, 1, 0, 0.3607843, 1,
1.587227, 0.4150758, 2.504645, 1, 0, 0.3529412, 1,
1.589122, -0.1203491, 0.1925712, 1, 0, 0.3490196, 1,
1.591316, 1.477969, -0.4319547, 1, 0, 0.3411765, 1,
1.613625, -1.241116, 2.396791, 1, 0, 0.3372549, 1,
1.636455, 0.5155787, 1.20401, 1, 0, 0.3294118, 1,
1.640169, -0.575582, 2.913516, 1, 0, 0.3254902, 1,
1.66364, 0.2150739, 2.751525, 1, 0, 0.3176471, 1,
1.66638, -0.3671809, 1.777272, 1, 0, 0.3137255, 1,
1.669483, -1.311614, 1.485764, 1, 0, 0.3058824, 1,
1.669506, 1.327392, -0.09648272, 1, 0, 0.2980392, 1,
1.682618, -0.4275879, 1.656615, 1, 0, 0.2941177, 1,
1.683533, 1.470945, 1.754014, 1, 0, 0.2862745, 1,
1.691771, 0.3367845, 0.9779693, 1, 0, 0.282353, 1,
1.697789, -0.4196912, 1.604771, 1, 0, 0.2745098, 1,
1.70314, 0.621161, 0.9228601, 1, 0, 0.2705882, 1,
1.716402, 0.1331389, 1.29598, 1, 0, 0.2627451, 1,
1.723132, 2.668756, -1.347643, 1, 0, 0.2588235, 1,
1.732486, 0.2689674, 2.585536, 1, 0, 0.2509804, 1,
1.747374, 1.0283, 1.020735, 1, 0, 0.2470588, 1,
1.757219, 1.046073, 0.5081804, 1, 0, 0.2392157, 1,
1.759459, -0.109268, 1.898172, 1, 0, 0.2352941, 1,
1.762493, 1.482615, -1.12455, 1, 0, 0.227451, 1,
1.770051, 0.3352357, 1.444876, 1, 0, 0.2235294, 1,
1.773332, 0.5333194, 4.063398, 1, 0, 0.2156863, 1,
1.779949, -1.353691, 2.548279, 1, 0, 0.2117647, 1,
1.785419, -1.039075, 1.658843, 1, 0, 0.2039216, 1,
1.813004, -1.070497, 3.064396, 1, 0, 0.1960784, 1,
1.82772, 0.5460165, 1.245926, 1, 0, 0.1921569, 1,
1.836303, 0.4420539, -1.649652, 1, 0, 0.1843137, 1,
1.846793, -0.1527151, 2.279605, 1, 0, 0.1803922, 1,
1.850571, -0.7807304, 2.478072, 1, 0, 0.172549, 1,
1.863795, 0.5884946, 1.271005, 1, 0, 0.1686275, 1,
1.864575, -0.5894859, 1.396738, 1, 0, 0.1607843, 1,
1.869082, 2.247328, 1.359278, 1, 0, 0.1568628, 1,
1.877198, 0.02509533, 2.997867, 1, 0, 0.1490196, 1,
1.907071, -0.8050041, 2.433627, 1, 0, 0.145098, 1,
1.909865, 0.6769647, 0.130477, 1, 0, 0.1372549, 1,
1.917989, -0.9221463, 2.806554, 1, 0, 0.1333333, 1,
1.943934, 1.276338, 0.8388454, 1, 0, 0.1254902, 1,
1.950601, 0.2577208, 1.65489, 1, 0, 0.1215686, 1,
2.033777, 0.4353687, 0.6363829, 1, 0, 0.1137255, 1,
2.071859, -1.095272, -0.3350308, 1, 0, 0.1098039, 1,
2.093613, 1.41553, 0.4682387, 1, 0, 0.1019608, 1,
2.116278, -0.6146252, 0.6892095, 1, 0, 0.09411765, 1,
2.220864, -1.451986, 1.893729, 1, 0, 0.09019608, 1,
2.250148, 1.81952, -0.591861, 1, 0, 0.08235294, 1,
2.281994, 0.6849207, 3.20403, 1, 0, 0.07843138, 1,
2.343354, -0.345225, 3.045721, 1, 0, 0.07058824, 1,
2.397553, -0.1652621, 2.818923, 1, 0, 0.06666667, 1,
2.407521, 0.9203802, 0.9550526, 1, 0, 0.05882353, 1,
2.423487, 0.6690078, 1.783153, 1, 0, 0.05490196, 1,
2.437919, -0.1961034, 1.728733, 1, 0, 0.04705882, 1,
2.492488, -0.01552984, 1.979487, 1, 0, 0.04313726, 1,
2.532524, 1.595019, 1.740772, 1, 0, 0.03529412, 1,
2.595814, -0.1500602, 1.31257, 1, 0, 0.03137255, 1,
2.61913, 1.835036, 1.198449, 1, 0, 0.02352941, 1,
2.631752, 1.404269, 1.821427, 1, 0, 0.01960784, 1,
2.722457, -0.8823237, 2.088471, 1, 0, 0.01176471, 1,
3.095298, -0.09255788, 2.352406, 1, 0, 0.007843138, 1
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
-0.1976403, -4.483518, -7.511208, 0, -0.5, 0.5, 0.5,
-0.1976403, -4.483518, -7.511208, 1, -0.5, 0.5, 0.5,
-0.1976403, -4.483518, -7.511208, 1, 1.5, 0.5, 0.5,
-0.1976403, -4.483518, -7.511208, 0, 1.5, 0.5, 0.5
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
-4.606885, -0.3579923, -7.511208, 0, -0.5, 0.5, 0.5,
-4.606885, -0.3579923, -7.511208, 1, -0.5, 0.5, 0.5,
-4.606885, -0.3579923, -7.511208, 1, 1.5, 0.5, 0.5,
-4.606885, -0.3579923, -7.511208, 0, 1.5, 0.5, 0.5
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
-4.606885, -4.483518, -0.01845384, 0, -0.5, 0.5, 0.5,
-4.606885, -4.483518, -0.01845384, 1, -0.5, 0.5, 0.5,
-4.606885, -4.483518, -0.01845384, 1, 1.5, 0.5, 0.5,
-4.606885, -4.483518, -0.01845384, 0, 1.5, 0.5, 0.5
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
-3, -3.531473, -5.782111,
3, -3.531473, -5.782111,
-3, -3.531473, -5.782111,
-3, -3.690147, -6.070293,
-2, -3.531473, -5.782111,
-2, -3.690147, -6.070293,
-1, -3.531473, -5.782111,
-1, -3.690147, -6.070293,
0, -3.531473, -5.782111,
0, -3.690147, -6.070293,
1, -3.531473, -5.782111,
1, -3.690147, -6.070293,
2, -3.531473, -5.782111,
2, -3.690147, -6.070293,
3, -3.531473, -5.782111,
3, -3.690147, -6.070293
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
-3, -4.007495, -6.646659, 0, -0.5, 0.5, 0.5,
-3, -4.007495, -6.646659, 1, -0.5, 0.5, 0.5,
-3, -4.007495, -6.646659, 1, 1.5, 0.5, 0.5,
-3, -4.007495, -6.646659, 0, 1.5, 0.5, 0.5,
-2, -4.007495, -6.646659, 0, -0.5, 0.5, 0.5,
-2, -4.007495, -6.646659, 1, -0.5, 0.5, 0.5,
-2, -4.007495, -6.646659, 1, 1.5, 0.5, 0.5,
-2, -4.007495, -6.646659, 0, 1.5, 0.5, 0.5,
-1, -4.007495, -6.646659, 0, -0.5, 0.5, 0.5,
-1, -4.007495, -6.646659, 1, -0.5, 0.5, 0.5,
-1, -4.007495, -6.646659, 1, 1.5, 0.5, 0.5,
-1, -4.007495, -6.646659, 0, 1.5, 0.5, 0.5,
0, -4.007495, -6.646659, 0, -0.5, 0.5, 0.5,
0, -4.007495, -6.646659, 1, -0.5, 0.5, 0.5,
0, -4.007495, -6.646659, 1, 1.5, 0.5, 0.5,
0, -4.007495, -6.646659, 0, 1.5, 0.5, 0.5,
1, -4.007495, -6.646659, 0, -0.5, 0.5, 0.5,
1, -4.007495, -6.646659, 1, -0.5, 0.5, 0.5,
1, -4.007495, -6.646659, 1, 1.5, 0.5, 0.5,
1, -4.007495, -6.646659, 0, 1.5, 0.5, 0.5,
2, -4.007495, -6.646659, 0, -0.5, 0.5, 0.5,
2, -4.007495, -6.646659, 1, -0.5, 0.5, 0.5,
2, -4.007495, -6.646659, 1, 1.5, 0.5, 0.5,
2, -4.007495, -6.646659, 0, 1.5, 0.5, 0.5,
3, -4.007495, -6.646659, 0, -0.5, 0.5, 0.5,
3, -4.007495, -6.646659, 1, -0.5, 0.5, 0.5,
3, -4.007495, -6.646659, 1, 1.5, 0.5, 0.5,
3, -4.007495, -6.646659, 0, 1.5, 0.5, 0.5
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
-3.589367, -3, -5.782111,
-3.589367, 2, -5.782111,
-3.589367, -3, -5.782111,
-3.758953, -3, -6.070293,
-3.589367, -2, -5.782111,
-3.758953, -2, -6.070293,
-3.589367, -1, -5.782111,
-3.758953, -1, -6.070293,
-3.589367, 0, -5.782111,
-3.758953, 0, -6.070293,
-3.589367, 1, -5.782111,
-3.758953, 1, -6.070293,
-3.589367, 2, -5.782111,
-3.758953, 2, -6.070293
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
-4.098126, -3, -6.646659, 0, -0.5, 0.5, 0.5,
-4.098126, -3, -6.646659, 1, -0.5, 0.5, 0.5,
-4.098126, -3, -6.646659, 1, 1.5, 0.5, 0.5,
-4.098126, -3, -6.646659, 0, 1.5, 0.5, 0.5,
-4.098126, -2, -6.646659, 0, -0.5, 0.5, 0.5,
-4.098126, -2, -6.646659, 1, -0.5, 0.5, 0.5,
-4.098126, -2, -6.646659, 1, 1.5, 0.5, 0.5,
-4.098126, -2, -6.646659, 0, 1.5, 0.5, 0.5,
-4.098126, -1, -6.646659, 0, -0.5, 0.5, 0.5,
-4.098126, -1, -6.646659, 1, -0.5, 0.5, 0.5,
-4.098126, -1, -6.646659, 1, 1.5, 0.5, 0.5,
-4.098126, -1, -6.646659, 0, 1.5, 0.5, 0.5,
-4.098126, 0, -6.646659, 0, -0.5, 0.5, 0.5,
-4.098126, 0, -6.646659, 1, -0.5, 0.5, 0.5,
-4.098126, 0, -6.646659, 1, 1.5, 0.5, 0.5,
-4.098126, 0, -6.646659, 0, 1.5, 0.5, 0.5,
-4.098126, 1, -6.646659, 0, -0.5, 0.5, 0.5,
-4.098126, 1, -6.646659, 1, -0.5, 0.5, 0.5,
-4.098126, 1, -6.646659, 1, 1.5, 0.5, 0.5,
-4.098126, 1, -6.646659, 0, 1.5, 0.5, 0.5,
-4.098126, 2, -6.646659, 0, -0.5, 0.5, 0.5,
-4.098126, 2, -6.646659, 1, -0.5, 0.5, 0.5,
-4.098126, 2, -6.646659, 1, 1.5, 0.5, 0.5,
-4.098126, 2, -6.646659, 0, 1.5, 0.5, 0.5
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
-3.589367, -3.531473, -4,
-3.589367, -3.531473, 4,
-3.589367, -3.531473, -4,
-3.758953, -3.690147, -4,
-3.589367, -3.531473, -2,
-3.758953, -3.690147, -2,
-3.589367, -3.531473, 0,
-3.758953, -3.690147, 0,
-3.589367, -3.531473, 2,
-3.758953, -3.690147, 2,
-3.589367, -3.531473, 4,
-3.758953, -3.690147, 4
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
-4.098126, -4.007495, -4, 0, -0.5, 0.5, 0.5,
-4.098126, -4.007495, -4, 1, -0.5, 0.5, 0.5,
-4.098126, -4.007495, -4, 1, 1.5, 0.5, 0.5,
-4.098126, -4.007495, -4, 0, 1.5, 0.5, 0.5,
-4.098126, -4.007495, -2, 0, -0.5, 0.5, 0.5,
-4.098126, -4.007495, -2, 1, -0.5, 0.5, 0.5,
-4.098126, -4.007495, -2, 1, 1.5, 0.5, 0.5,
-4.098126, -4.007495, -2, 0, 1.5, 0.5, 0.5,
-4.098126, -4.007495, 0, 0, -0.5, 0.5, 0.5,
-4.098126, -4.007495, 0, 1, -0.5, 0.5, 0.5,
-4.098126, -4.007495, 0, 1, 1.5, 0.5, 0.5,
-4.098126, -4.007495, 0, 0, 1.5, 0.5, 0.5,
-4.098126, -4.007495, 2, 0, -0.5, 0.5, 0.5,
-4.098126, -4.007495, 2, 1, -0.5, 0.5, 0.5,
-4.098126, -4.007495, 2, 1, 1.5, 0.5, 0.5,
-4.098126, -4.007495, 2, 0, 1.5, 0.5, 0.5,
-4.098126, -4.007495, 4, 0, -0.5, 0.5, 0.5,
-4.098126, -4.007495, 4, 1, -0.5, 0.5, 0.5,
-4.098126, -4.007495, 4, 1, 1.5, 0.5, 0.5,
-4.098126, -4.007495, 4, 0, 1.5, 0.5, 0.5
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
-3.589367, -3.531473, -5.782111,
-3.589367, 2.815489, -5.782111,
-3.589367, -3.531473, 5.745203,
-3.589367, 2.815489, 5.745203,
-3.589367, -3.531473, -5.782111,
-3.589367, -3.531473, 5.745203,
-3.589367, 2.815489, -5.782111,
-3.589367, 2.815489, 5.745203,
-3.589367, -3.531473, -5.782111,
3.194086, -3.531473, -5.782111,
-3.589367, -3.531473, 5.745203,
3.194086, -3.531473, 5.745203,
-3.589367, 2.815489, -5.782111,
3.194086, 2.815489, -5.782111,
-3.589367, 2.815489, 5.745203,
3.194086, 2.815489, 5.745203,
3.194086, -3.531473, -5.782111,
3.194086, 2.815489, -5.782111,
3.194086, -3.531473, 5.745203,
3.194086, 2.815489, 5.745203,
3.194086, -3.531473, -5.782111,
3.194086, -3.531473, 5.745203,
3.194086, 2.815489, -5.782111,
3.194086, 2.815489, 5.745203
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
var radius = 7.905404;
var distance = 35.17204;
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
mvMatrix.translate( 0.1976403, 0.3579923, 0.01845384 );
mvMatrix.scale( 1.260048, 1.346704, 0.7414978 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.17204);
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
furalaxyl<-read.table("furalaxyl.xyz")
```

```
## Error in read.table("furalaxyl.xyz"): no lines available in input
```

```r
x<-furalaxyl$V2
```

```
## Error in eval(expr, envir, enclos): object 'furalaxyl' not found
```

```r
y<-furalaxyl$V3
```

```
## Error in eval(expr, envir, enclos): object 'furalaxyl' not found
```

```r
z<-furalaxyl$V4
```

```
## Error in eval(expr, envir, enclos): object 'furalaxyl' not found
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
-3.490579, 1.210521, -1.252901, 0, 0, 1, 1, 1,
-2.9002, 1.035441, -1.207212, 1, 0, 0, 1, 1,
-2.873926, 0.438485, -0.3788445, 1, 0, 0, 1, 1,
-2.608669, 0.8062575, -1.702256, 1, 0, 0, 1, 1,
-2.604944, -0.3885498, -2.074411, 1, 0, 0, 1, 1,
-2.550428, 0.3461363, -1.936111, 1, 0, 0, 1, 1,
-2.545288, 1.846679, -1.11641, 0, 0, 0, 1, 1,
-2.493858, -1.697902, -1.55301, 0, 0, 0, 1, 1,
-2.39553, -0.5237993, -1.582416, 0, 0, 0, 1, 1,
-2.389374, 0.01868005, -3.03802, 0, 0, 0, 1, 1,
-2.306829, -0.05452333, -4.206193, 0, 0, 0, 1, 1,
-2.206903, 1.826455, -1.535827, 0, 0, 0, 1, 1,
-2.18947, 2.356051, -1.267227, 0, 0, 0, 1, 1,
-2.18694, 1.791249, -0.7652681, 1, 1, 1, 1, 1,
-2.184236, 0.858489, -0.8034133, 1, 1, 1, 1, 1,
-2.172781, -0.8592741, -2.441343, 1, 1, 1, 1, 1,
-2.171637, 0.443676, -2.345324, 1, 1, 1, 1, 1,
-2.154935, 1.044055, -1.901326, 1, 1, 1, 1, 1,
-2.119527, 0.9763822, -0.5582491, 1, 1, 1, 1, 1,
-2.09981, 2.088653, -1.695217, 1, 1, 1, 1, 1,
-2.037605, 1.716113, 0.2730185, 1, 1, 1, 1, 1,
-2.026753, -0.4999381, -0.6232556, 1, 1, 1, 1, 1,
-2.007994, -0.2676135, -2.457079, 1, 1, 1, 1, 1,
-1.975482, -0.1406122, -3.58076, 1, 1, 1, 1, 1,
-1.962468, -0.1314078, -2.367074, 1, 1, 1, 1, 1,
-1.934423, 0.1727563, -3.017013, 1, 1, 1, 1, 1,
-1.926515, 0.04476691, -1.414124, 1, 1, 1, 1, 1,
-1.923303, -0.529403, -0.3414529, 1, 1, 1, 1, 1,
-1.915477, 0.8593068, -1.902452, 0, 0, 1, 1, 1,
-1.888359, -0.3581111, -2.589871, 1, 0, 0, 1, 1,
-1.879385, 0.4210185, -0.1989366, 1, 0, 0, 1, 1,
-1.857335, -0.1989389, -2.421396, 1, 0, 0, 1, 1,
-1.849665, 0.6878314, -0.6494385, 1, 0, 0, 1, 1,
-1.819184, 1.968289, -1.16917, 1, 0, 0, 1, 1,
-1.815286, 0.6266503, -1.10258, 0, 0, 0, 1, 1,
-1.799736, -0.222273, -2.888986, 0, 0, 0, 1, 1,
-1.799558, -0.8913137, -2.796024, 0, 0, 0, 1, 1,
-1.797781, -0.9743994, -2.4223, 0, 0, 0, 1, 1,
-1.78716, -0.264821, -1.878673, 0, 0, 0, 1, 1,
-1.777238, 1.084669, -2.462628, 0, 0, 0, 1, 1,
-1.77532, -2.365157, -1.139806, 0, 0, 0, 1, 1,
-1.76615, -0.1960771, -1.573261, 1, 1, 1, 1, 1,
-1.76101, 0.289807, -1.259147, 1, 1, 1, 1, 1,
-1.727732, 0.4470685, -2.930872, 1, 1, 1, 1, 1,
-1.712542, 0.5156103, -2.250241, 1, 1, 1, 1, 1,
-1.705426, -2.148373, -2.320001, 1, 1, 1, 1, 1,
-1.690713, -0.5175433, -1.383821, 1, 1, 1, 1, 1,
-1.681142, 0.7376779, -2.269873, 1, 1, 1, 1, 1,
-1.667943, -0.364783, -2.37516, 1, 1, 1, 1, 1,
-1.649288, 0.5231855, -1.489194, 1, 1, 1, 1, 1,
-1.648666, 0.2349887, -1.733257, 1, 1, 1, 1, 1,
-1.642451, -1.234872, -4.091624, 1, 1, 1, 1, 1,
-1.64206, 0.2271722, 0.3120113, 1, 1, 1, 1, 1,
-1.64007, -0.6953919, -0.2532435, 1, 1, 1, 1, 1,
-1.632565, 0.8297955, 1.01065, 1, 1, 1, 1, 1,
-1.630543, -0.1792281, -1.494047, 1, 1, 1, 1, 1,
-1.622712, 0.3035219, -3.271779, 0, 0, 1, 1, 1,
-1.621316, -1.315627, -4.364113, 1, 0, 0, 1, 1,
-1.608799, -1.836897, -2.509384, 1, 0, 0, 1, 1,
-1.591424, 0.2207645, -0.6801375, 1, 0, 0, 1, 1,
-1.585934, 0.9593012, -0.9821051, 1, 0, 0, 1, 1,
-1.573104, 0.2626375, -0.9451226, 1, 0, 0, 1, 1,
-1.57143, -0.004946866, -1.463808, 0, 0, 0, 1, 1,
-1.558463, 1.723576, -2.189325, 0, 0, 0, 1, 1,
-1.554858, -0.7060799, -2.400322, 0, 0, 0, 1, 1,
-1.528256, 0.5573212, -3.179191, 0, 0, 0, 1, 1,
-1.50929, 0.4010527, -0.5485125, 0, 0, 0, 1, 1,
-1.496041, -0.3720001, -1.525741, 0, 0, 0, 1, 1,
-1.490422, -0.2095793, -1.905476, 0, 0, 0, 1, 1,
-1.483054, 1.299553, -0.1846731, 1, 1, 1, 1, 1,
-1.480383, -0.5417092, -1.188966, 1, 1, 1, 1, 1,
-1.478713, 0.1811842, -3.439152, 1, 1, 1, 1, 1,
-1.477336, 0.7456686, -0.3871078, 1, 1, 1, 1, 1,
-1.472484, 0.5462172, 0.2505504, 1, 1, 1, 1, 1,
-1.459735, 1.001499, -0.01871734, 1, 1, 1, 1, 1,
-1.458794, 0.7949309, -0.09402773, 1, 1, 1, 1, 1,
-1.450927, -0.3564657, -1.731377, 1, 1, 1, 1, 1,
-1.444672, 1.065462, -0.5803244, 1, 1, 1, 1, 1,
-1.430498, 0.714482, -1.745359, 1, 1, 1, 1, 1,
-1.422318, -1.709008, -3.825879, 1, 1, 1, 1, 1,
-1.420877, 1.125725, -0.4520307, 1, 1, 1, 1, 1,
-1.412576, 2.370528, 0.6958619, 1, 1, 1, 1, 1,
-1.409837, -2.370722, -1.967125, 1, 1, 1, 1, 1,
-1.397779, 1.958529, -0.2766169, 1, 1, 1, 1, 1,
-1.375612, -0.5417603, -3.535344, 0, 0, 1, 1, 1,
-1.367297, -0.1652242, -0.5358881, 1, 0, 0, 1, 1,
-1.367153, -0.8283549, -3.747303, 1, 0, 0, 1, 1,
-1.364015, 0.9802288, -0.4853491, 1, 0, 0, 1, 1,
-1.354481, -0.4586551, -3.490127, 1, 0, 0, 1, 1,
-1.347213, -1.58469, -2.045705, 1, 0, 0, 1, 1,
-1.339815, -0.5062962, -1.787716, 0, 0, 0, 1, 1,
-1.335701, 0.07405957, -2.002433, 0, 0, 0, 1, 1,
-1.33215, 0.08852366, -1.364185, 0, 0, 0, 1, 1,
-1.327324, -0.1954446, -2.725686, 0, 0, 0, 1, 1,
-1.325632, 0.02526501, -1.723036, 0, 0, 0, 1, 1,
-1.319867, 0.6507489, -1.12295, 0, 0, 0, 1, 1,
-1.319658, -0.2918883, -1.32498, 0, 0, 0, 1, 1,
-1.313171, -0.9356008, -2.266459, 1, 1, 1, 1, 1,
-1.306595, -0.7560352, -3.206436, 1, 1, 1, 1, 1,
-1.304797, -0.8373481, -3.204577, 1, 1, 1, 1, 1,
-1.279129, -0.09746183, -1.885442, 1, 1, 1, 1, 1,
-1.279018, -0.6197351, -0.8039879, 1, 1, 1, 1, 1,
-1.277537, 1.04881, -1.743575, 1, 1, 1, 1, 1,
-1.276709, 0.8608195, -0.1088992, 1, 1, 1, 1, 1,
-1.274422, 0.9405923, -0.6025656, 1, 1, 1, 1, 1,
-1.272193, -0.9272802, -1.942241, 1, 1, 1, 1, 1,
-1.272055, -1.135068, -2.925134, 1, 1, 1, 1, 1,
-1.270161, 0.0007386421, -1.670613, 1, 1, 1, 1, 1,
-1.264877, -0.5805925, -2.3043, 1, 1, 1, 1, 1,
-1.263029, -0.7030408, -0.1896338, 1, 1, 1, 1, 1,
-1.256976, -0.2848075, -1.508446, 1, 1, 1, 1, 1,
-1.252292, -1.213186, -3.549219, 1, 1, 1, 1, 1,
-1.247033, -0.1950254, -0.6111425, 0, 0, 1, 1, 1,
-1.239553, -0.2985795, -3.009105, 1, 0, 0, 1, 1,
-1.235075, 0.6465568, -1.504457, 1, 0, 0, 1, 1,
-1.227854, -0.8576818, -2.408721, 1, 0, 0, 1, 1,
-1.225237, -1.0785, -1.757254, 1, 0, 0, 1, 1,
-1.224984, -2.335045, -4.752692, 1, 0, 0, 1, 1,
-1.218838, 0.3221412, -0.7107681, 0, 0, 0, 1, 1,
-1.194422, 2.174572, -0.2466677, 0, 0, 0, 1, 1,
-1.187106, -0.3972313, -3.109604, 0, 0, 0, 1, 1,
-1.186485, 0.09594803, -1.957888, 0, 0, 0, 1, 1,
-1.186353, -0.2846267, -1.431515, 0, 0, 0, 1, 1,
-1.174504, 0.9593984, 0.4464757, 0, 0, 0, 1, 1,
-1.168065, -1.713945, -0.7646131, 0, 0, 0, 1, 1,
-1.166617, 0.6161091, -1.142921, 1, 1, 1, 1, 1,
-1.166121, -1.371487, -3.081061, 1, 1, 1, 1, 1,
-1.164015, 0.1926016, -1.826673, 1, 1, 1, 1, 1,
-1.158217, 0.9170887, -2.539611, 1, 1, 1, 1, 1,
-1.156176, 0.1149016, -2.212768, 1, 1, 1, 1, 1,
-1.14947, 1.814349, 0.9586653, 1, 1, 1, 1, 1,
-1.145921, -0.1499182, -0.9168163, 1, 1, 1, 1, 1,
-1.14514, -0.216967, -0.7361838, 1, 1, 1, 1, 1,
-1.136508, -0.3620628, -2.06151, 1, 1, 1, 1, 1,
-1.130181, 0.2143797, 0.2550036, 1, 1, 1, 1, 1,
-1.123745, -0.7219123, -2.285654, 1, 1, 1, 1, 1,
-1.121555, 2.440987, 0.3061339, 1, 1, 1, 1, 1,
-1.118473, -1.378485, -3.591054, 1, 1, 1, 1, 1,
-1.105559, -1.121317, -0.3386872, 1, 1, 1, 1, 1,
-1.104467, 0.0240697, -1.341959, 1, 1, 1, 1, 1,
-1.070045, 0.07384589, -0.1451694, 0, 0, 1, 1, 1,
-1.069715, -0.6492202, -3.626943, 1, 0, 0, 1, 1,
-1.063553, 0.1434031, -2.809341, 1, 0, 0, 1, 1,
-1.062082, -0.5369025, -1.303828, 1, 0, 0, 1, 1,
-1.056365, -2.068187, -3.065226, 1, 0, 0, 1, 1,
-1.05022, -0.6367297, -1.178607, 1, 0, 0, 1, 1,
-1.045565, -0.5207532, -1.40181, 0, 0, 0, 1, 1,
-1.041283, 1.828832, -0.3789916, 0, 0, 0, 1, 1,
-1.031365, 1.060458, -2.249041, 0, 0, 0, 1, 1,
-1.025839, 0.03877477, -1.574797, 0, 0, 0, 1, 1,
-1.022839, 0.6920666, -0.6563075, 0, 0, 0, 1, 1,
-1.021678, 0.3445985, -0.9671602, 0, 0, 0, 1, 1,
-1.018982, 1.117629, -0.7889427, 0, 0, 0, 1, 1,
-1.011655, -0.6805773, -2.536438, 1, 1, 1, 1, 1,
-1.011413, -0.6003577, -0.1618154, 1, 1, 1, 1, 1,
-1.004778, 0.6505211, -2.152313, 1, 1, 1, 1, 1,
-0.9993317, 2.055258, -1.632516, 1, 1, 1, 1, 1,
-0.9983817, -0.02429202, -0.3695457, 1, 1, 1, 1, 1,
-0.9961264, -1.331835, -3.005199, 1, 1, 1, 1, 1,
-0.9935605, -1.359735, -0.4265912, 1, 1, 1, 1, 1,
-0.984669, -1.955471, -0.951849, 1, 1, 1, 1, 1,
-0.982173, -1.828602, -4.004734, 1, 1, 1, 1, 1,
-0.9812179, -0.4458404, -1.266861, 1, 1, 1, 1, 1,
-0.9763761, -1.615102, -1.246034, 1, 1, 1, 1, 1,
-0.9678164, -1.539079, -3.470177, 1, 1, 1, 1, 1,
-0.9676821, -0.2038513, -2.281266, 1, 1, 1, 1, 1,
-0.9669172, 0.336705, -0.7886794, 1, 1, 1, 1, 1,
-0.9634375, 0.4956743, -0.8396924, 1, 1, 1, 1, 1,
-0.9538977, 0.172375, -1.359259, 0, 0, 1, 1, 1,
-0.9516863, 0.3258514, -2.114916, 1, 0, 0, 1, 1,
-0.9492802, 0.318715, -1.115826, 1, 0, 0, 1, 1,
-0.9467353, -2.919822, -2.708565, 1, 0, 0, 1, 1,
-0.9458816, 1.537644, -2.202128, 1, 0, 0, 1, 1,
-0.9441649, 0.8204096, 1.070219, 1, 0, 0, 1, 1,
-0.9301713, -0.556143, -2.535823, 0, 0, 0, 1, 1,
-0.9264055, 1.254819, -0.6697556, 0, 0, 0, 1, 1,
-0.92414, 1.155829, -0.6797192, 0, 0, 0, 1, 1,
-0.9240631, -0.2397295, -2.091834, 0, 0, 0, 1, 1,
-0.9238166, 0.6196366, -1.603592, 0, 0, 0, 1, 1,
-0.9210133, -1.293202, -2.597209, 0, 0, 0, 1, 1,
-0.9197209, -0.3241381, -1.021136, 0, 0, 0, 1, 1,
-0.9169538, -0.4917779, -1.455511, 1, 1, 1, 1, 1,
-0.8991331, 0.5023927, -0.4436333, 1, 1, 1, 1, 1,
-0.8983755, -2.168828, -3.005758, 1, 1, 1, 1, 1,
-0.8943851, -1.395544, -2.75191, 1, 1, 1, 1, 1,
-0.8935165, -0.6683486, -0.3591883, 1, 1, 1, 1, 1,
-0.8863224, -1.604623, -2.603634, 1, 1, 1, 1, 1,
-0.8855779, 0.5756795, -3.383378, 1, 1, 1, 1, 1,
-0.8766157, -0.3207562, -3.144958, 1, 1, 1, 1, 1,
-0.8655564, 1.708479, -0.1424735, 1, 1, 1, 1, 1,
-0.8583075, 1.372219, -1.619392, 1, 1, 1, 1, 1,
-0.85618, -1.694061, -1.262038, 1, 1, 1, 1, 1,
-0.8491328, 0.3972197, -0.7939504, 1, 1, 1, 1, 1,
-0.8378152, -0.1420102, -3.604826, 1, 1, 1, 1, 1,
-0.8355969, 1.028379, -0.3008529, 1, 1, 1, 1, 1,
-0.834707, 1.770183, -0.1653144, 1, 1, 1, 1, 1,
-0.8260774, -0.9506162, -4.70979, 0, 0, 1, 1, 1,
-0.8248509, -0.1310168, -0.6379641, 1, 0, 0, 1, 1,
-0.8232007, 1.602987, -1.857437, 1, 0, 0, 1, 1,
-0.8220324, 0.1031039, -1.371999, 1, 0, 0, 1, 1,
-0.8182346, -0.3467511, -4.757908, 1, 0, 0, 1, 1,
-0.8168479, 0.4080957, -0.5053476, 1, 0, 0, 1, 1,
-0.8164147, -0.9662898, -2.049919, 0, 0, 0, 1, 1,
-0.8092216, 0.5098461, -1.71065, 0, 0, 0, 1, 1,
-0.8080693, -2.282052, -2.383393, 0, 0, 0, 1, 1,
-0.8037187, 0.6722136, -1.542646, 0, 0, 0, 1, 1,
-0.8026581, 0.8557808, -1.174563, 0, 0, 0, 1, 1,
-0.7945145, 2.2515, -0.5451339, 0, 0, 0, 1, 1,
-0.7941553, 0.4706683, -0.8648462, 0, 0, 0, 1, 1,
-0.7928746, -0.2867264, -1.031755, 1, 1, 1, 1, 1,
-0.7927995, 0.9275867, -0.1700691, 1, 1, 1, 1, 1,
-0.7925763, 0.03458551, -2.393709, 1, 1, 1, 1, 1,
-0.7915154, 0.09071519, -3.039052, 1, 1, 1, 1, 1,
-0.7911747, 0.05384962, -0.5679356, 1, 1, 1, 1, 1,
-0.7878632, -0.53044, -2.72226, 1, 1, 1, 1, 1,
-0.7853447, -1.064141, -2.385643, 1, 1, 1, 1, 1,
-0.7850546, -0.07462579, -3.163374, 1, 1, 1, 1, 1,
-0.7785283, -0.1708323, -2.193845, 1, 1, 1, 1, 1,
-0.7777657, -0.7913769, -1.622787, 1, 1, 1, 1, 1,
-0.7742583, 1.222817, 0.1952128, 1, 1, 1, 1, 1,
-0.7655663, 2.711828, 0.7033356, 1, 1, 1, 1, 1,
-0.7649081, 0.791716, -0.3532522, 1, 1, 1, 1, 1,
-0.7618241, -0.2500895, -2.917104, 1, 1, 1, 1, 1,
-0.7541061, -0.1176496, -1.720217, 1, 1, 1, 1, 1,
-0.7538578, -2.672308, -3.213709, 0, 0, 1, 1, 1,
-0.7469695, 1.511068, -1.65266, 1, 0, 0, 1, 1,
-0.7453414, -1.653631, -1.789468, 1, 0, 0, 1, 1,
-0.7436822, 0.9769808, 0.2145961, 1, 0, 0, 1, 1,
-0.7436617, 1.326202, 0.116572, 1, 0, 0, 1, 1,
-0.7365432, 0.2384981, -0.6586058, 1, 0, 0, 1, 1,
-0.7326144, 1.153518, 0.2395081, 0, 0, 0, 1, 1,
-0.729157, -1.070097, -2.166758, 0, 0, 0, 1, 1,
-0.7186125, 0.2147448, -1.571895, 0, 0, 0, 1, 1,
-0.7163286, 0.3379507, -2.304342, 0, 0, 0, 1, 1,
-0.7159727, -0.673103, -3.765089, 0, 0, 0, 1, 1,
-0.7151731, 1.076498, 1.654233, 0, 0, 0, 1, 1,
-0.7070449, 0.5749884, -1.002649, 0, 0, 0, 1, 1,
-0.7055833, -0.3110577, -1.938502, 1, 1, 1, 1, 1,
-0.7016681, 0.3672354, -1.199298, 1, 1, 1, 1, 1,
-0.700627, -1.289578, -3.195696, 1, 1, 1, 1, 1,
-0.6964838, 1.448539, 1.250816, 1, 1, 1, 1, 1,
-0.6949323, -0.6449788, -1.728551, 1, 1, 1, 1, 1,
-0.6932564, -2.136932, -2.42935, 1, 1, 1, 1, 1,
-0.6903455, 1.492192, 0.2364384, 1, 1, 1, 1, 1,
-0.6899584, -0.8189533, -0.5590432, 1, 1, 1, 1, 1,
-0.6853412, 1.243838, 0.3087487, 1, 1, 1, 1, 1,
-0.6831867, 0.8276654, -0.6443594, 1, 1, 1, 1, 1,
-0.6807713, 1.183355, 0.2106254, 1, 1, 1, 1, 1,
-0.6773801, -0.03291138, -2.563416, 1, 1, 1, 1, 1,
-0.6759546, 0.8430492, -2.596905, 1, 1, 1, 1, 1,
-0.6744756, 0.2497916, -2.609565, 1, 1, 1, 1, 1,
-0.6731741, 0.3607154, -1.651865, 1, 1, 1, 1, 1,
-0.6645913, -0.8810913, -1.788498, 0, 0, 1, 1, 1,
-0.6642044, 2.300549, -0.07132128, 1, 0, 0, 1, 1,
-0.6614917, 1.170704, -0.2938416, 1, 0, 0, 1, 1,
-0.6604987, -0.9692221, -2.89548, 1, 0, 0, 1, 1,
-0.6524565, -0.07877551, -2.107486, 1, 0, 0, 1, 1,
-0.6507277, -0.3131148, -3.000993, 1, 0, 0, 1, 1,
-0.6427644, 2.194108, -0.01687744, 0, 0, 0, 1, 1,
-0.6411955, -0.09325493, -2.620095, 0, 0, 0, 1, 1,
-0.6407204, -0.4538504, -1.137839, 0, 0, 0, 1, 1,
-0.6396282, -0.5120375, -2.562215, 0, 0, 0, 1, 1,
-0.6352984, 1.173356, -0.1549124, 0, 0, 0, 1, 1,
-0.6348506, 0.2571144, -0.9892332, 0, 0, 0, 1, 1,
-0.6304044, -1.302753, -3.195219, 0, 0, 0, 1, 1,
-0.6302921, 0.8330264, -1.800614, 1, 1, 1, 1, 1,
-0.6256537, -0.3121125, -0.7003105, 1, 1, 1, 1, 1,
-0.6073067, -0.654134, -1.19432, 1, 1, 1, 1, 1,
-0.6006596, -1.05474, -1.574224, 1, 1, 1, 1, 1,
-0.5997942, 0.2363409, -1.081776, 1, 1, 1, 1, 1,
-0.5989733, -0.2840826, -3.284379, 1, 1, 1, 1, 1,
-0.5981456, -0.3726371, -2.766544, 1, 1, 1, 1, 1,
-0.5925516, 0.2766255, -0.9676733, 1, 1, 1, 1, 1,
-0.5872459, -1.204895, -2.280263, 1, 1, 1, 1, 1,
-0.5869802, 0.6920017, -0.6302294, 1, 1, 1, 1, 1,
-0.5853096, -1.365121, -2.135192, 1, 1, 1, 1, 1,
-0.5840518, 0.7351254, -0.5139509, 1, 1, 1, 1, 1,
-0.5827668, -0.5448473, -0.8743074, 1, 1, 1, 1, 1,
-0.5812039, 0.8887716, -0.08836203, 1, 1, 1, 1, 1,
-0.5798845, -0.3515135, -2.820187, 1, 1, 1, 1, 1,
-0.5791994, -0.8327166, -2.455735, 0, 0, 1, 1, 1,
-0.5779681, 1.568274, -1.501313, 1, 0, 0, 1, 1,
-0.5775189, 0.5470712, -2.31827, 1, 0, 0, 1, 1,
-0.5747259, -1.095317, -2.827974, 1, 0, 0, 1, 1,
-0.5716918, 0.8927687, -1.923484, 1, 0, 0, 1, 1,
-0.5688376, 1.455611, -0.16744, 1, 0, 0, 1, 1,
-0.5658044, 0.2864827, 0.3943437, 0, 0, 0, 1, 1,
-0.5606492, 1.627249, 0.03080776, 0, 0, 0, 1, 1,
-0.5420939, -1.066382, -2.459134, 0, 0, 0, 1, 1,
-0.5402892, -1.20612, -3.359654, 0, 0, 0, 1, 1,
-0.5359658, -0.004169094, -2.860249, 0, 0, 0, 1, 1,
-0.5320913, 0.4336639, -1.627081, 0, 0, 0, 1, 1,
-0.5315357, -0.6478856, -2.275517, 0, 0, 0, 1, 1,
-0.5301934, 0.9120311, -1.274243, 1, 1, 1, 1, 1,
-0.5266848, -2.654618, -3.317729, 1, 1, 1, 1, 1,
-0.5258531, 1.310646, 1.632489, 1, 1, 1, 1, 1,
-0.5249239, -0.4790373, 0.3360954, 1, 1, 1, 1, 1,
-0.5235258, -0.04530808, -1.494944, 1, 1, 1, 1, 1,
-0.5167928, 0.5445687, -0.1573598, 1, 1, 1, 1, 1,
-0.5095713, -0.9027734, -0.8648842, 1, 1, 1, 1, 1,
-0.4991463, -0.5959176, -2.880901, 1, 1, 1, 1, 1,
-0.499035, -0.7195696, -1.96534, 1, 1, 1, 1, 1,
-0.4982887, -0.376983, -2.38387, 1, 1, 1, 1, 1,
-0.495145, 0.9093409, -0.1566169, 1, 1, 1, 1, 1,
-0.494819, 0.2636306, -1.231024, 1, 1, 1, 1, 1,
-0.4914569, -0.3532883, -1.684194, 1, 1, 1, 1, 1,
-0.4881501, -1.424315, -3.683198, 1, 1, 1, 1, 1,
-0.4878702, 0.03254423, -0.479126, 1, 1, 1, 1, 1,
-0.4856834, 1.049822, 0.1320773, 0, 0, 1, 1, 1,
-0.4836861, 0.5595907, -0.2149457, 1, 0, 0, 1, 1,
-0.4836213, -0.8736441, -3.573434, 1, 0, 0, 1, 1,
-0.480987, -0.6495091, -2.405839, 1, 0, 0, 1, 1,
-0.4806459, 1.861484, 0.1574412, 1, 0, 0, 1, 1,
-0.4806281, 0.2224452, -0.990678, 1, 0, 0, 1, 1,
-0.479449, -1.737301, -1.369176, 0, 0, 0, 1, 1,
-0.4774065, 0.9073076, -0.4977779, 0, 0, 0, 1, 1,
-0.4771954, 1.24824, -1.412047, 0, 0, 0, 1, 1,
-0.4759574, -0.3152887, -0.7375707, 0, 0, 0, 1, 1,
-0.4744694, 0.5428245, -0.4501388, 0, 0, 0, 1, 1,
-0.4722873, 0.4562903, -2.74046, 0, 0, 0, 1, 1,
-0.4719212, 0.5671982, -0.5171162, 0, 0, 0, 1, 1,
-0.4693627, 1.363878, 1.732215, 1, 1, 1, 1, 1,
-0.4666871, -0.7189972, -0.6872722, 1, 1, 1, 1, 1,
-0.4648682, -0.08112045, -1.484679, 1, 1, 1, 1, 1,
-0.4632687, -0.4706804, -3.566259, 1, 1, 1, 1, 1,
-0.4604136, 1.156194, 0.946836, 1, 1, 1, 1, 1,
-0.4592396, 0.1291233, 0.2745074, 1, 1, 1, 1, 1,
-0.4553601, 0.005048474, -0.6862532, 1, 1, 1, 1, 1,
-0.4491662, -0.4814812, -3.404788, 1, 1, 1, 1, 1,
-0.4480172, 1.144056, -0.1527222, 1, 1, 1, 1, 1,
-0.4468638, -0.2903839, -1.931127, 1, 1, 1, 1, 1,
-0.4444936, -1.307657, -1.308614, 1, 1, 1, 1, 1,
-0.43854, 1.728465, -0.3912483, 1, 1, 1, 1, 1,
-0.4372272, 1.642054, -1.034079, 1, 1, 1, 1, 1,
-0.4347927, 0.3027485, -0.664785, 1, 1, 1, 1, 1,
-0.4329014, 0.3539362, -0.9573256, 1, 1, 1, 1, 1,
-0.4297533, 0.9017062, 0.6039787, 0, 0, 1, 1, 1,
-0.4218717, -0.2391695, -4.001617, 1, 0, 0, 1, 1,
-0.4182085, -0.4444943, -2.311522, 1, 0, 0, 1, 1,
-0.416329, 0.6788807, 0.7243124, 1, 0, 0, 1, 1,
-0.4141354, -0.5095798, -2.225212, 1, 0, 0, 1, 1,
-0.4123129, -0.8046953, -3.299341, 1, 0, 0, 1, 1,
-0.4101742, 1.815063, 0.9259437, 0, 0, 0, 1, 1,
-0.4086785, -1.854251, -2.706186, 0, 0, 0, 1, 1,
-0.407525, -0.4387947, -2.296175, 0, 0, 0, 1, 1,
-0.4052777, -0.05549254, -4.834416, 0, 0, 0, 1, 1,
-0.4045927, 1.086314, -1.157841, 0, 0, 0, 1, 1,
-0.4013597, -0.5690932, -2.349187, 0, 0, 0, 1, 1,
-0.3987432, -0.7761236, -3.531596, 0, 0, 0, 1, 1,
-0.3910434, -0.9346677, -3.523942, 1, 1, 1, 1, 1,
-0.3868248, 0.496453, -0.6397951, 1, 1, 1, 1, 1,
-0.3815924, 2.723057, -1.650591, 1, 1, 1, 1, 1,
-0.3789332, -1.918451, -2.673085, 1, 1, 1, 1, 1,
-0.3770904, -0.2017245, -0.09426458, 1, 1, 1, 1, 1,
-0.3767067, -1.85853, -0.2277673, 1, 1, 1, 1, 1,
-0.3712952, -0.597179, -2.093765, 1, 1, 1, 1, 1,
-0.370957, -0.2125172, 0.07757036, 1, 1, 1, 1, 1,
-0.3641704, -0.1145791, -1.475365, 1, 1, 1, 1, 1,
-0.363936, 1.285551, 0.5596213, 1, 1, 1, 1, 1,
-0.3616568, 0.04435533, -0.8181633, 1, 1, 1, 1, 1,
-0.3575162, -0.3058479, -3.056095, 1, 1, 1, 1, 1,
-0.3564767, -0.642, -0.6650139, 1, 1, 1, 1, 1,
-0.3523764, 0.7200478, -1.222523, 1, 1, 1, 1, 1,
-0.3500782, -1.841478, -2.548561, 1, 1, 1, 1, 1,
-0.3466852, 1.762913, 0.916648, 0, 0, 1, 1, 1,
-0.345651, 0.1055315, -2.98796, 1, 0, 0, 1, 1,
-0.3415011, -0.2372168, -1.27438, 1, 0, 0, 1, 1,
-0.3399292, -0.369764, -2.083017, 1, 0, 0, 1, 1,
-0.3388271, 0.5557451, 0.4242204, 1, 0, 0, 1, 1,
-0.3367195, -0.1601782, -3.598012, 1, 0, 0, 1, 1,
-0.3355903, -0.986865, -3.945757, 0, 0, 0, 1, 1,
-0.3317015, -0.2803252, -1.904619, 0, 0, 0, 1, 1,
-0.3299824, 1.080714, -0.1226319, 0, 0, 0, 1, 1,
-0.3256386, 0.997489, -0.296093, 0, 0, 0, 1, 1,
-0.3252603, 0.9870845, -1.534629, 0, 0, 0, 1, 1,
-0.3248143, 0.4302353, -1.098203, 0, 0, 0, 1, 1,
-0.3205331, -1.321208, -2.049445, 0, 0, 0, 1, 1,
-0.3181919, -0.05021551, -1.586386, 1, 1, 1, 1, 1,
-0.3168091, 0.95042, -0.362867, 1, 1, 1, 1, 1,
-0.3149774, -1.061359, -2.318268, 1, 1, 1, 1, 1,
-0.3124243, -0.386959, -2.728196, 1, 1, 1, 1, 1,
-0.3111024, 0.02222011, -0.7861838, 1, 1, 1, 1, 1,
-0.309817, -1.341476, -2.489804, 1, 1, 1, 1, 1,
-0.3059926, -0.5358656, -3.056663, 1, 1, 1, 1, 1,
-0.2991495, 1.60243, -0.4376155, 1, 1, 1, 1, 1,
-0.2933278, 0.2679934, 0.7389303, 1, 1, 1, 1, 1,
-0.2923463, -3.439042, -3.601421, 1, 1, 1, 1, 1,
-0.2867433, 0.7295111, 0.07181723, 1, 1, 1, 1, 1,
-0.2859312, -0.5814509, -4.178228, 1, 1, 1, 1, 1,
-0.2817273, -0.1538777, -3.606874, 1, 1, 1, 1, 1,
-0.2774482, -0.7995726, -2.215708, 1, 1, 1, 1, 1,
-0.277326, 2.394519, -0.1199433, 1, 1, 1, 1, 1,
-0.2772605, 0.8555006, -1.754864, 0, 0, 1, 1, 1,
-0.2748824, -0.6918972, -2.841839, 1, 0, 0, 1, 1,
-0.271485, -0.02997785, -0.8085816, 1, 0, 0, 1, 1,
-0.2647429, -1.759485, -4.704646, 1, 0, 0, 1, 1,
-0.2620588, -0.9201156, -3.353366, 1, 0, 0, 1, 1,
-0.2579242, 0.2928286, 1.144824, 1, 0, 0, 1, 1,
-0.2565743, 0.01216032, -0.7057843, 0, 0, 0, 1, 1,
-0.2550905, 0.4528628, -0.4729263, 0, 0, 0, 1, 1,
-0.2542682, -0.7267513, -1.265378, 0, 0, 0, 1, 1,
-0.253127, -1.688746, -3.371684, 0, 0, 0, 1, 1,
-0.2526952, -0.4473401, -3.787877, 0, 0, 0, 1, 1,
-0.2465938, 0.6259634, -0.1660659, 0, 0, 0, 1, 1,
-0.2458386, -1.088851, -3.000826, 0, 0, 0, 1, 1,
-0.2450848, -0.05249251, -2.21079, 1, 1, 1, 1, 1,
-0.2441539, -1.322155, -2.541495, 1, 1, 1, 1, 1,
-0.2417304, 1.364267, -0.4691653, 1, 1, 1, 1, 1,
-0.240865, -1.157094, -1.382704, 1, 1, 1, 1, 1,
-0.2407795, -0.9029955, -3.439959, 1, 1, 1, 1, 1,
-0.2391771, 0.7528649, 0.1861182, 1, 1, 1, 1, 1,
-0.2361834, -1.867349, -4.912568, 1, 1, 1, 1, 1,
-0.23598, -0.5928445, -0.8201332, 1, 1, 1, 1, 1,
-0.2336181, 1.495626, 1.028632, 1, 1, 1, 1, 1,
-0.2263057, 0.3507747, -1.606053, 1, 1, 1, 1, 1,
-0.2246471, 1.557982, -0.1471547, 1, 1, 1, 1, 1,
-0.2232389, -0.9667242, -5.614237, 1, 1, 1, 1, 1,
-0.2223653, 0.1920626, -2.366484, 1, 1, 1, 1, 1,
-0.2194141, 0.2629196, -0.7017287, 1, 1, 1, 1, 1,
-0.2176511, -0.4533269, -2.261944, 1, 1, 1, 1, 1,
-0.2139994, -1.292018, -2.33494, 0, 0, 1, 1, 1,
-0.2130567, 1.207166, -0.1580705, 1, 0, 0, 1, 1,
-0.206903, -1.115229, -3.400323, 1, 0, 0, 1, 1,
-0.202242, 0.2464648, -0.8426486, 1, 0, 0, 1, 1,
-0.2019343, -0.665305, -2.571573, 1, 0, 0, 1, 1,
-0.2006342, 0.4086311, 0.9936486, 1, 0, 0, 1, 1,
-0.1991397, -0.7535121, -3.694823, 0, 0, 0, 1, 1,
-0.1964804, 1.148372, -0.5073713, 0, 0, 0, 1, 1,
-0.1896109, -0.8506945, -2.648295, 0, 0, 0, 1, 1,
-0.1880729, 1.094207, -0.6007548, 0, 0, 0, 1, 1,
-0.1879495, -0.6919701, -1.78024, 0, 0, 0, 1, 1,
-0.1878863, -1.187238, -3.033423, 0, 0, 0, 1, 1,
-0.1861199, 0.1178325, -1.141886, 0, 0, 0, 1, 1,
-0.1745959, -1.485649, -2.556539, 1, 1, 1, 1, 1,
-0.1727552, 0.9117191, -0.7590008, 1, 1, 1, 1, 1,
-0.1718558, -0.1320293, -2.76086, 1, 1, 1, 1, 1,
-0.1709859, -0.8489597, -4.074349, 1, 1, 1, 1, 1,
-0.1682173, 0.1375616, -2.161817, 1, 1, 1, 1, 1,
-0.1615686, -0.502243, -1.851025, 1, 1, 1, 1, 1,
-0.1582703, 0.4971731, 0.4092367, 1, 1, 1, 1, 1,
-0.1569044, -1.842668, -2.6497, 1, 1, 1, 1, 1,
-0.1565911, 1.188294, -0.04326383, 1, 1, 1, 1, 1,
-0.1564504, 1.98808, 1.329069, 1, 1, 1, 1, 1,
-0.1549513, -2.26686, -0.6929582, 1, 1, 1, 1, 1,
-0.1545326, -1.616906, -4.622571, 1, 1, 1, 1, 1,
-0.1534844, -1.301362, -4.678751, 1, 1, 1, 1, 1,
-0.1466013, -0.2648667, -3.841812, 1, 1, 1, 1, 1,
-0.1397533, -0.6755682, -4.711882, 1, 1, 1, 1, 1,
-0.1396692, -1.205879, -2.960968, 0, 0, 1, 1, 1,
-0.1394663, 0.9307376, 0.4131292, 1, 0, 0, 1, 1,
-0.1382651, -0.1389475, -1.68743, 1, 0, 0, 1, 1,
-0.138162, 2.294589, 1.198891, 1, 0, 0, 1, 1,
-0.1368215, -0.1616552, -1.299978, 1, 0, 0, 1, 1,
-0.134138, -0.05108744, -2.261806, 1, 0, 0, 1, 1,
-0.1332362, 0.7676765, 0.7122794, 0, 0, 0, 1, 1,
-0.1325175, 0.323552, -2.539375, 0, 0, 0, 1, 1,
-0.1285347, -1.483424, -3.596034, 0, 0, 0, 1, 1,
-0.1268418, -0.2444988, 0.08563851, 0, 0, 0, 1, 1,
-0.1263508, 0.3247787, -0.4494455, 0, 0, 0, 1, 1,
-0.125678, -1.250848, -2.551474, 0, 0, 0, 1, 1,
-0.1249284, 0.1272802, -0.7608671, 0, 0, 0, 1, 1,
-0.1224707, -2.416344, -4.697637, 1, 1, 1, 1, 1,
-0.117864, 2.471222, 0.08233728, 1, 1, 1, 1, 1,
-0.1172569, 0.4149821, 0.09348391, 1, 1, 1, 1, 1,
-0.1159452, 0.5752907, -0.2956652, 1, 1, 1, 1, 1,
-0.1146525, -0.1082406, -2.138363, 1, 1, 1, 1, 1,
-0.1132268, -0.071876, -3.377426, 1, 1, 1, 1, 1,
-0.1047529, 0.3424292, 1.046763, 1, 1, 1, 1, 1,
-0.1034395, 1.316392, -0.2519933, 1, 1, 1, 1, 1,
-0.1026604, -1.329569, -3.276964, 1, 1, 1, 1, 1,
-0.1013676, 0.623352, -0.4744667, 1, 1, 1, 1, 1,
-0.09916523, 0.8995044, -0.1203597, 1, 1, 1, 1, 1,
-0.09076086, 0.004338702, -1.146632, 1, 1, 1, 1, 1,
-0.090299, -1.635157, -2.623434, 1, 1, 1, 1, 1,
-0.08815438, 0.4523005, 1.445527, 1, 1, 1, 1, 1,
-0.08750124, 0.4301528, -0.7517042, 1, 1, 1, 1, 1,
-0.08744384, 0.6704451, -0.0195768, 0, 0, 1, 1, 1,
-0.08615665, -0.8013912, -2.359998, 1, 0, 0, 1, 1,
-0.08552868, 0.5923688, 0.09400874, 1, 0, 0, 1, 1,
-0.0839491, 0.4580669, -0.2991223, 1, 0, 0, 1, 1,
-0.08173759, 0.6367098, -0.08049783, 1, 0, 0, 1, 1,
-0.07658823, -1.072433, -2.247299, 1, 0, 0, 1, 1,
-0.07627414, -1.215776, -2.017694, 0, 0, 0, 1, 1,
-0.07236357, 0.3379484, 1.596066, 0, 0, 0, 1, 1,
-0.07129767, -1.516232, -5.329329, 0, 0, 0, 1, 1,
-0.06897828, 0.6638334, 0.7682238, 0, 0, 0, 1, 1,
-0.06602555, 0.6094878, -0.071266, 0, 0, 0, 1, 1,
-0.06519212, -0.2108222, -3.174939, 0, 0, 0, 1, 1,
-0.06396898, -1.341709, -5.151547, 0, 0, 0, 1, 1,
-0.0618767, -0.3611013, -2.563989, 1, 1, 1, 1, 1,
-0.05878311, -1.25348, -1.613406, 1, 1, 1, 1, 1,
-0.05876519, 0.341068, -1.123935, 1, 1, 1, 1, 1,
-0.05871775, -1.241767, -2.294906, 1, 1, 1, 1, 1,
-0.05587896, 1.562214, 0.6157984, 1, 1, 1, 1, 1,
-0.05402175, -1.483385, -4.860844, 1, 1, 1, 1, 1,
-0.05383609, -0.4626426, -2.758672, 1, 1, 1, 1, 1,
-0.05272882, 1.349668, -1.395052, 1, 1, 1, 1, 1,
-0.05236937, -0.2001197, -2.746752, 1, 1, 1, 1, 1,
-0.05010028, 2.360186, -1.500304, 1, 1, 1, 1, 1,
-0.0496993, 1.500135, 0.7185349, 1, 1, 1, 1, 1,
-0.04635856, -1.097714, -3.993988, 1, 1, 1, 1, 1,
-0.04523163, -0.6602569, -3.202845, 1, 1, 1, 1, 1,
-0.04447159, 0.5173649, 0.8643523, 1, 1, 1, 1, 1,
-0.04159852, -2.226703, -2.830573, 1, 1, 1, 1, 1,
-0.04147178, 0.4949119, 0.2697225, 0, 0, 1, 1, 1,
-0.03552328, -0.157932, -5.03828, 1, 0, 0, 1, 1,
-0.03483377, -1.010015, -4.40922, 1, 0, 0, 1, 1,
-0.0321639, -0.378026, -3.687328, 1, 0, 0, 1, 1,
-0.03017834, -1.205547, -1.704361, 1, 0, 0, 1, 1,
-0.02878174, -0.674102, -1.555284, 1, 0, 0, 1, 1,
-0.02807081, -1.630785, -2.264279, 0, 0, 0, 1, 1,
-0.02253662, 0.3948836, -0.2459303, 0, 0, 0, 1, 1,
-0.0202151, 1.588204, 1.159258, 0, 0, 0, 1, 1,
-0.01959567, -0.6344908, -1.996866, 0, 0, 0, 1, 1,
-0.01863104, 1.893401, 1.727786, 0, 0, 0, 1, 1,
-0.01829781, -1.552266, -2.669809, 0, 0, 0, 1, 1,
-0.01772086, -0.06940519, -2.340107, 0, 0, 0, 1, 1,
-0.01732573, -0.7446144, -3.447731, 1, 1, 1, 1, 1,
-0.01396409, 0.9089496, -0.9035911, 1, 1, 1, 1, 1,
-0.01354033, 1.044666, -1.340272, 1, 1, 1, 1, 1,
-0.01275567, 1.796415, 1.1873, 1, 1, 1, 1, 1,
-0.01192325, -0.3408274, -3.066245, 1, 1, 1, 1, 1,
-0.01057078, -1.090166, -2.261643, 1, 1, 1, 1, 1,
-0.00646484, -0.7816417, -2.799082, 1, 1, 1, 1, 1,
-0.003553991, 0.03167778, 0.3806422, 1, 1, 1, 1, 1,
0.001910345, 0.3070819, -1.944826, 1, 1, 1, 1, 1,
0.008364414, -0.142652, 3.527227, 1, 1, 1, 1, 1,
0.008856904, -1.2469, 4.13301, 1, 1, 1, 1, 1,
0.01124632, 0.7521298, -1.170554, 1, 1, 1, 1, 1,
0.01223352, -0.3720039, 3.727763, 1, 1, 1, 1, 1,
0.01736535, 0.5400227, 0.73283, 1, 1, 1, 1, 1,
0.01767571, 0.4777952, 0.9629068, 1, 1, 1, 1, 1,
0.02076347, 1.529815, 0.0661736, 0, 0, 1, 1, 1,
0.02264964, -1.42417, 5.053646, 1, 0, 0, 1, 1,
0.03035132, -0.2456238, 1.682241, 1, 0, 0, 1, 1,
0.03503042, 1.30889, 1.856061, 1, 0, 0, 1, 1,
0.03668968, -1.66612, 3.494883, 1, 0, 0, 1, 1,
0.03780852, -1.18, 3.400893, 1, 0, 0, 1, 1,
0.04058971, -0.3087696, 3.557451, 0, 0, 0, 1, 1,
0.04064374, -0.8402697, 2.584771, 0, 0, 0, 1, 1,
0.04528524, 0.4907191, 0.8230263, 0, 0, 0, 1, 1,
0.04668941, 0.008501533, 1.457016, 0, 0, 0, 1, 1,
0.05151192, -0.08632647, 3.427163, 0, 0, 0, 1, 1,
0.05341895, -0.1906454, 2.273492, 0, 0, 0, 1, 1,
0.05348096, 0.4342201, 1.173078, 0, 0, 0, 1, 1,
0.05392504, 1.207442, -1.502921, 1, 1, 1, 1, 1,
0.05484876, 1.213286, 0.8504323, 1, 1, 1, 1, 1,
0.05661203, 0.3603028, 1.385116, 1, 1, 1, 1, 1,
0.06103615, -0.7146443, 3.831218, 1, 1, 1, 1, 1,
0.0666229, -0.8107825, 3.785557, 1, 1, 1, 1, 1,
0.06999209, -0.894851, 3.496519, 1, 1, 1, 1, 1,
0.07054482, -2.168658, 2.249311, 1, 1, 1, 1, 1,
0.07118665, 0.5433154, 2.394922, 1, 1, 1, 1, 1,
0.07181155, 0.5567111, -1.553599, 1, 1, 1, 1, 1,
0.07470032, 1.254688, 0.2910064, 1, 1, 1, 1, 1,
0.07745291, 0.5840929, -0.2044465, 1, 1, 1, 1, 1,
0.08203867, 0.7439399, -1.000617, 1, 1, 1, 1, 1,
0.08209455, -0.03537959, 2.980741, 1, 1, 1, 1, 1,
0.08209917, 0.04248561, 0.6850818, 1, 1, 1, 1, 1,
0.08807167, 0.4327588, 0.1597604, 1, 1, 1, 1, 1,
0.08886052, 0.3867671, -0.1738255, 0, 0, 1, 1, 1,
0.09755243, -0.2876141, 2.929743, 1, 0, 0, 1, 1,
0.09781536, -0.3723145, 2.933653, 1, 0, 0, 1, 1,
0.09920141, -1.193146, 1.861322, 1, 0, 0, 1, 1,
0.1020402, 0.6533383, 0.4476278, 1, 0, 0, 1, 1,
0.1070836, 0.7662114, 0.0500275, 1, 0, 0, 1, 1,
0.1088685, -1.165622, 0.8304358, 0, 0, 0, 1, 1,
0.1088878, 0.744126, 0.5513476, 0, 0, 0, 1, 1,
0.1098969, -0.3896571, 2.494159, 0, 0, 0, 1, 1,
0.1142792, 2.173996, 0.5362934, 0, 0, 0, 1, 1,
0.1168969, 0.05081328, 1.420574, 0, 0, 0, 1, 1,
0.1188349, 0.7463635, 0.1241488, 0, 0, 0, 1, 1,
0.1192374, -0.4844102, 3.792367, 0, 0, 0, 1, 1,
0.1214613, 0.4204904, 1.225124, 1, 1, 1, 1, 1,
0.1290554, -0.7194893, 3.90426, 1, 1, 1, 1, 1,
0.1291756, -0.3005483, 1.579439, 1, 1, 1, 1, 1,
0.1303028, -0.9991688, 2.651175, 1, 1, 1, 1, 1,
0.1319329, 1.409778, 1.644113, 1, 1, 1, 1, 1,
0.1379418, -0.45288, 3.301609, 1, 1, 1, 1, 1,
0.1436918, 0.2581558, 0.9368327, 1, 1, 1, 1, 1,
0.1501854, 0.9435911, 1.344277, 1, 1, 1, 1, 1,
0.1505192, 0.4243069, -1.384586, 1, 1, 1, 1, 1,
0.1513746, -3.361575, 3.139843, 1, 1, 1, 1, 1,
0.154091, -0.7017868, 1.975546, 1, 1, 1, 1, 1,
0.1572212, -0.04832043, 1.863435, 1, 1, 1, 1, 1,
0.1599551, -0.1881096, 1.851334, 1, 1, 1, 1, 1,
0.1644604, 0.8177165, 0.2748914, 1, 1, 1, 1, 1,
0.1645585, -1.488229, 1.561439, 1, 1, 1, 1, 1,
0.1653538, 1.264328, -3.825698, 0, 0, 1, 1, 1,
0.1658793, 1.706759, 1.010222, 1, 0, 0, 1, 1,
0.1662474, 0.07403821, 0.5422195, 1, 0, 0, 1, 1,
0.1672427, 0.7153233, 0.4266663, 1, 0, 0, 1, 1,
0.1676423, -0.2477673, 2.963951, 1, 0, 0, 1, 1,
0.1680311, -0.5928668, 2.789388, 1, 0, 0, 1, 1,
0.1753051, 0.8477454, -0.7822934, 0, 0, 0, 1, 1,
0.175577, -1.167548, 2.901645, 0, 0, 0, 1, 1,
0.1771892, -0.006373188, 0.0798537, 0, 0, 0, 1, 1,
0.1774862, 0.5379413, 1.821606, 0, 0, 0, 1, 1,
0.1943877, 1.854, -1.351504, 0, 0, 0, 1, 1,
0.1977819, -0.3604281, 2.167038, 0, 0, 0, 1, 1,
0.203018, 0.4413913, 1.406247, 0, 0, 0, 1, 1,
0.2059994, 1.504077, 1.761486, 1, 1, 1, 1, 1,
0.2181958, -0.5744121, 2.924884, 1, 1, 1, 1, 1,
0.2335292, -0.5436285, 4.546005, 1, 1, 1, 1, 1,
0.2354314, -2.03704, 0.4993073, 1, 1, 1, 1, 1,
0.2359959, -0.3885424, 3.745559, 1, 1, 1, 1, 1,
0.2397264, -1.231811, 5.256792, 1, 1, 1, 1, 1,
0.2420397, -0.1279541, 2.603261, 1, 1, 1, 1, 1,
0.2427232, -1.050543, 2.98384, 1, 1, 1, 1, 1,
0.2440693, -0.4256437, 1.941985, 1, 1, 1, 1, 1,
0.2487922, 0.8221254, -0.5107653, 1, 1, 1, 1, 1,
0.2507135, 0.4558039, 0.2303429, 1, 1, 1, 1, 1,
0.2585309, -0.1286798, 2.272078, 1, 1, 1, 1, 1,
0.2618608, -0.4951781, 2.679087, 1, 1, 1, 1, 1,
0.2624038, 1.742924, 0.1696874, 1, 1, 1, 1, 1,
0.2640643, 0.9983804, 1.731705, 1, 1, 1, 1, 1,
0.2646695, -0.1078048, 1.92525, 0, 0, 1, 1, 1,
0.2665362, 1.117928, -0.524182, 1, 0, 0, 1, 1,
0.2683755, -0.6900018, 2.140328, 1, 0, 0, 1, 1,
0.2707044, -0.9726222, 3.329268, 1, 0, 0, 1, 1,
0.2711246, -0.5940681, 4.098083, 1, 0, 0, 1, 1,
0.2721686, 0.4794006, 0.4564973, 1, 0, 0, 1, 1,
0.2747111, 1.044206, -0.6013854, 0, 0, 0, 1, 1,
0.275505, -0.6749887, 3.609713, 0, 0, 0, 1, 1,
0.2771012, -0.1346689, 3.398338, 0, 0, 0, 1, 1,
0.2794454, 1.293137, -0.6718469, 0, 0, 0, 1, 1,
0.2832368, 0.7026498, 0.8800999, 0, 0, 0, 1, 1,
0.2863745, 0.6062353, 0.07922442, 0, 0, 0, 1, 1,
0.2867281, 1.497925, 0.4513012, 0, 0, 0, 1, 1,
0.2881834, -0.03617756, -0.4008446, 1, 1, 1, 1, 1,
0.2908346, 0.0764557, 0.05135913, 1, 1, 1, 1, 1,
0.2915564, -0.8753676, 1.449241, 1, 1, 1, 1, 1,
0.2943115, 0.1979578, 1.0064, 1, 1, 1, 1, 1,
0.2956075, 0.9379581, 1.068527, 1, 1, 1, 1, 1,
0.2974908, -0.02357013, 1.211542, 1, 1, 1, 1, 1,
0.2980599, 1.244039, -0.8602569, 1, 1, 1, 1, 1,
0.2985133, 0.4514352, -0.4999584, 1, 1, 1, 1, 1,
0.3002115, 1.147997, -0.3135233, 1, 1, 1, 1, 1,
0.3008832, 0.5106203, -1.371994, 1, 1, 1, 1, 1,
0.3040983, 0.5846313, -0.1376993, 1, 1, 1, 1, 1,
0.304229, -0.6985791, 1.19275, 1, 1, 1, 1, 1,
0.3048924, -0.02891603, 2.988732, 1, 1, 1, 1, 1,
0.3179406, 1.209284, 0.2548302, 1, 1, 1, 1, 1,
0.3189804, -1.609071, 2.828621, 1, 1, 1, 1, 1,
0.3203654, -0.3378923, 1.770387, 0, 0, 1, 1, 1,
0.3239549, 0.09509428, 1.073484, 1, 0, 0, 1, 1,
0.3263173, -1.262341, 3.233851, 1, 0, 0, 1, 1,
0.3264695, 0.6048126, 0.4808345, 1, 0, 0, 1, 1,
0.3272585, -0.4044422, 1.991448, 1, 0, 0, 1, 1,
0.3295839, 0.2361048, 2.287878, 1, 0, 0, 1, 1,
0.3332725, 0.598133, -1.687611, 0, 0, 0, 1, 1,
0.3336459, -0.2449227, 2.287248, 0, 0, 0, 1, 1,
0.3347267, -0.793048, 2.45233, 0, 0, 0, 1, 1,
0.3394639, -0.7067305, 1.773785, 0, 0, 0, 1, 1,
0.3448673, -1.728134, 3.270254, 0, 0, 0, 1, 1,
0.3449932, -1.875084, 4.379113, 0, 0, 0, 1, 1,
0.3476051, -0.5077789, 2.754461, 0, 0, 0, 1, 1,
0.3518743, -0.2858894, 2.795875, 1, 1, 1, 1, 1,
0.3519177, 0.7415484, 1.595462, 1, 1, 1, 1, 1,
0.3558083, -1.349309, 3.814305, 1, 1, 1, 1, 1,
0.3584768, 0.7025663, 0.9290313, 1, 1, 1, 1, 1,
0.3626894, -1.164014, 5.57733, 1, 1, 1, 1, 1,
0.3630559, 1.925533, -1.466354, 1, 1, 1, 1, 1,
0.3635863, 0.8010595, -1.535853, 1, 1, 1, 1, 1,
0.3650841, -1.334898, 2.528812, 1, 1, 1, 1, 1,
0.3690668, 0.4895586, 0.2810188, 1, 1, 1, 1, 1,
0.3702113, -1.612207, 3.41549, 1, 1, 1, 1, 1,
0.3714836, -1.481001, 3.315895, 1, 1, 1, 1, 1,
0.3717882, 1.607881, -1.086232, 1, 1, 1, 1, 1,
0.3723567, 0.7175111, 0.3559472, 1, 1, 1, 1, 1,
0.3730261, 1.721985, 0.1674855, 1, 1, 1, 1, 1,
0.3758535, 1.084925, 1.54062, 1, 1, 1, 1, 1,
0.3801303, -0.3689446, 1.875943, 0, 0, 1, 1, 1,
0.3828547, 1.084013, 0.1884582, 1, 0, 0, 1, 1,
0.3860405, -0.2490346, 2.396822, 1, 0, 0, 1, 1,
0.394068, 0.4941582, 0.6000038, 1, 0, 0, 1, 1,
0.3965004, -0.04203398, 0.2208107, 1, 0, 0, 1, 1,
0.3967801, -0.3900077, 2.280642, 1, 0, 0, 1, 1,
0.3977851, -1.014908, 2.209105, 0, 0, 0, 1, 1,
0.4045672, 0.1818196, 0.1091052, 0, 0, 0, 1, 1,
0.4068958, 0.1412918, 2.196504, 0, 0, 0, 1, 1,
0.4122247, -1.765851, 1.892082, 0, 0, 0, 1, 1,
0.4164718, -0.3689443, 2.76067, 0, 0, 0, 1, 1,
0.4184426, -0.8268817, 2.1349, 0, 0, 0, 1, 1,
0.4185301, -0.9455071, 3.219111, 0, 0, 0, 1, 1,
0.4190084, -1.214449, 3.332817, 1, 1, 1, 1, 1,
0.4196614, 0.5411724, 0.5651679, 1, 1, 1, 1, 1,
0.4327959, 0.1807773, 1.441277, 1, 1, 1, 1, 1,
0.437405, -0.8625499, 1.852814, 1, 1, 1, 1, 1,
0.4402856, -2.461811, 1.357121, 1, 1, 1, 1, 1,
0.4410795, -1.207637, 2.542799, 1, 1, 1, 1, 1,
0.4429248, 0.6100082, 0.5758483, 1, 1, 1, 1, 1,
0.4443471, -0.1774189, 1.092739, 1, 1, 1, 1, 1,
0.4540857, -0.1783, 2.145005, 1, 1, 1, 1, 1,
0.455482, 0.4179555, 0.3393131, 1, 1, 1, 1, 1,
0.4563973, -1.209336, 2.155352, 1, 1, 1, 1, 1,
0.4570272, -1.815445, 2.413967, 1, 1, 1, 1, 1,
0.4576271, 0.4824048, 0.3466256, 1, 1, 1, 1, 1,
0.457693, -0.002086111, 0.1267457, 1, 1, 1, 1, 1,
0.4627135, -0.6829702, 1.543933, 1, 1, 1, 1, 1,
0.4660731, -0.08982866, 0.2108684, 0, 0, 1, 1, 1,
0.4674946, -0.2217943, 0.8340233, 1, 0, 0, 1, 1,
0.4725587, -0.928502, 2.76097, 1, 0, 0, 1, 1,
0.4733106, -0.7998893, 3.425938, 1, 0, 0, 1, 1,
0.4734445, 1.028937, -0.4387187, 1, 0, 0, 1, 1,
0.4759631, -0.4496083, 1.007815, 1, 0, 0, 1, 1,
0.4760722, -0.01421575, 0.6382993, 0, 0, 0, 1, 1,
0.4777392, -1.401891, 1.877993, 0, 0, 0, 1, 1,
0.481416, 1.736949, -0.1693655, 0, 0, 0, 1, 1,
0.4844142, 0.4975277, 2.130349, 0, 0, 0, 1, 1,
0.4853427, 0.2540711, 2.946264, 0, 0, 0, 1, 1,
0.4935592, -1.317782, 3.686964, 0, 0, 0, 1, 1,
0.495004, 1.37392, 0.7126079, 0, 0, 0, 1, 1,
0.4954531, -1.927607, 3.064397, 1, 1, 1, 1, 1,
0.4998408, 0.4225024, 0.3532504, 1, 1, 1, 1, 1,
0.5005038, -0.9037797, 1.702436, 1, 1, 1, 1, 1,
0.5093492, -0.07727475, 0.8305426, 1, 1, 1, 1, 1,
0.5095979, -0.3739997, 1.912702, 1, 1, 1, 1, 1,
0.5099726, 0.1475078, 0.2086339, 1, 1, 1, 1, 1,
0.5100371, -0.3290371, 1.849377, 1, 1, 1, 1, 1,
0.5131947, -1.337885, 4.090402, 1, 1, 1, 1, 1,
0.5209034, -0.08388861, 2.253066, 1, 1, 1, 1, 1,
0.5211852, 0.1539874, 0.03290389, 1, 1, 1, 1, 1,
0.5221598, 0.7817702, -0.07076246, 1, 1, 1, 1, 1,
0.5240375, -0.486868, 3.623163, 1, 1, 1, 1, 1,
0.5261045, 0.5176684, -0.03038299, 1, 1, 1, 1, 1,
0.5303639, -0.1829759, 2.004987, 1, 1, 1, 1, 1,
0.5312902, 0.9499933, 2.040694, 1, 1, 1, 1, 1,
0.5351346, -1.582389, 1.230197, 0, 0, 1, 1, 1,
0.5362883, 0.3003012, 1.804025, 1, 0, 0, 1, 1,
0.5386243, -0.7608403, 2.217443, 1, 0, 0, 1, 1,
0.5389097, 0.2745717, 1.456249, 1, 0, 0, 1, 1,
0.539508, 0.7252286, 0.6872833, 1, 0, 0, 1, 1,
0.5433446, 1.204999, -0.619441, 1, 0, 0, 1, 1,
0.5474882, -1.06102, 2.558039, 0, 0, 0, 1, 1,
0.5477741, -1.235411, 4.02712, 0, 0, 0, 1, 1,
0.5571088, 1.300592, 1.43046, 0, 0, 0, 1, 1,
0.5641284, -1.602408, 4.560573, 0, 0, 0, 1, 1,
0.5681433, -0.5486174, 4.054499, 0, 0, 0, 1, 1,
0.5686202, -0.367484, 3.187767, 0, 0, 0, 1, 1,
0.5755843, 0.229701, 0.9525853, 0, 0, 0, 1, 1,
0.5760773, 0.9983141, 0.894551, 1, 1, 1, 1, 1,
0.5761601, 0.419007, 1.4969, 1, 1, 1, 1, 1,
0.5838322, -0.3378711, 2.376944, 1, 1, 1, 1, 1,
0.5846243, 1.459654, 0.9387359, 1, 1, 1, 1, 1,
0.5864187, -0.7123044, 2.456756, 1, 1, 1, 1, 1,
0.5946689, 0.9469495, 1.395989, 1, 1, 1, 1, 1,
0.5969089, -0.3929203, 0.9318833, 1, 1, 1, 1, 1,
0.5981899, 1.45644, 0.3171075, 1, 1, 1, 1, 1,
0.6003848, -0.7277336, 0.8877039, 1, 1, 1, 1, 1,
0.6033206, -0.6340615, 1.891839, 1, 1, 1, 1, 1,
0.6053289, -0.8938339, 1.179539, 1, 1, 1, 1, 1,
0.6096555, 0.487688, -0.3820462, 1, 1, 1, 1, 1,
0.6121596, 0.1850036, 1.690122, 1, 1, 1, 1, 1,
0.6215746, 1.755018, 0.1023909, 1, 1, 1, 1, 1,
0.6242113, -0.08231084, 1.456984, 1, 1, 1, 1, 1,
0.6272284, -0.1772179, 0.9770165, 0, 0, 1, 1, 1,
0.6333777, -0.5207153, -0.2002458, 1, 0, 0, 1, 1,
0.6361246, -0.126213, 1.787397, 1, 0, 0, 1, 1,
0.6371142, -0.6592126, 1.19511, 1, 0, 0, 1, 1,
0.6395583, -1.509833, 2.53759, 1, 0, 0, 1, 1,
0.6406757, 0.09967057, 2.448686, 1, 0, 0, 1, 1,
0.6491204, 2.01499, 0.2906744, 0, 0, 0, 1, 1,
0.6492434, 1.546968, 0.3873287, 0, 0, 0, 1, 1,
0.65538, -0.3843898, 2.934669, 0, 0, 0, 1, 1,
0.6577638, -0.1758202, 1.525331, 0, 0, 0, 1, 1,
0.6580339, -0.3436943, 3.032321, 0, 0, 0, 1, 1,
0.664196, 2.368637, -0.03350651, 0, 0, 0, 1, 1,
0.6687932, -1.408198, 2.099157, 0, 0, 0, 1, 1,
0.6691281, 0.17931, 0.9528429, 1, 1, 1, 1, 1,
0.6734238, 0.1175206, 1.474037, 1, 1, 1, 1, 1,
0.6742065, -0.656085, 2.662036, 1, 1, 1, 1, 1,
0.6786444, 1.224756, 0.2341354, 1, 1, 1, 1, 1,
0.685614, 0.04486734, 1.934271, 1, 1, 1, 1, 1,
0.6950043, -1.701351, 2.924635, 1, 1, 1, 1, 1,
0.7002525, 1.51596, 0.535912, 1, 1, 1, 1, 1,
0.7010943, -1.37414, 2.94386, 1, 1, 1, 1, 1,
0.7070266, 0.1334805, 0.5628765, 1, 1, 1, 1, 1,
0.7080016, 0.8951299, 1.726753, 1, 1, 1, 1, 1,
0.715342, -0.239851, 2.290233, 1, 1, 1, 1, 1,
0.7201425, 0.345566, 0.1671979, 1, 1, 1, 1, 1,
0.7288485, -0.07911108, 2.712903, 1, 1, 1, 1, 1,
0.7328846, -0.3530347, 0.6023297, 1, 1, 1, 1, 1,
0.7413222, -0.6743385, 1.388936, 1, 1, 1, 1, 1,
0.7421578, -0.9485779, 3.644221, 0, 0, 1, 1, 1,
0.7430043, -1.205607, 5.040455, 1, 0, 0, 1, 1,
0.7435423, -1.257033, 4.20663, 1, 0, 0, 1, 1,
0.7467034, -0.08452407, 2.335513, 1, 0, 0, 1, 1,
0.7487644, 0.9427403, 0.8884125, 1, 0, 0, 1, 1,
0.7517421, 0.5527403, 3.548211, 1, 0, 0, 1, 1,
0.7555683, -0.7667927, 2.870736, 0, 0, 0, 1, 1,
0.7581252, -0.04356379, 1.029186, 0, 0, 0, 1, 1,
0.7647583, -0.2097, 2.37354, 0, 0, 0, 1, 1,
0.7701595, -1.617307, 3.019683, 0, 0, 0, 1, 1,
0.7706048, 0.7706431, 0.6861245, 0, 0, 0, 1, 1,
0.7784723, 0.4506719, 0.01806473, 0, 0, 0, 1, 1,
0.7801552, -0.5819421, 1.127956, 0, 0, 0, 1, 1,
0.7814286, 0.6358429, 1.742183, 1, 1, 1, 1, 1,
0.7915987, -1.068166, 0.9321792, 1, 1, 1, 1, 1,
0.7993289, 0.5544829, -1.020247, 1, 1, 1, 1, 1,
0.8008361, 1.536143, 0.1151147, 1, 1, 1, 1, 1,
0.8134369, 0.4918228, 1.234928, 1, 1, 1, 1, 1,
0.8146409, -1.210019, 2.247837, 1, 1, 1, 1, 1,
0.8149848, -2.427991, 4.705346, 1, 1, 1, 1, 1,
0.81623, -0.03483611, 2.355324, 1, 1, 1, 1, 1,
0.8210801, 2.325315, 0.9543508, 1, 1, 1, 1, 1,
0.821221, 0.2547292, 2.794181, 1, 1, 1, 1, 1,
0.8228055, -0.4555264, 1.681685, 1, 1, 1, 1, 1,
0.8434598, -0.02578168, 3.235166, 1, 1, 1, 1, 1,
0.8447704, -0.512161, 1.785301, 1, 1, 1, 1, 1,
0.8558452, 0.3877976, 1.665492, 1, 1, 1, 1, 1,
0.8572141, 1.404118, 0.5574045, 1, 1, 1, 1, 1,
0.8575772, 0.4082446, 0.3532042, 0, 0, 1, 1, 1,
0.862149, -0.8483686, 2.277527, 1, 0, 0, 1, 1,
0.8681411, 0.3379117, 2.353054, 1, 0, 0, 1, 1,
0.8699356, -0.1175941, 0.8095734, 1, 0, 0, 1, 1,
0.8702087, 1.043981, 0.1428527, 1, 0, 0, 1, 1,
0.8703331, 0.3680746, 0.1710896, 1, 0, 0, 1, 1,
0.8830816, 0.4603729, 1.191276, 0, 0, 0, 1, 1,
0.8877832, 0.6779721, 0.02477506, 0, 0, 0, 1, 1,
0.8897631, -0.07526207, 0.5976868, 0, 0, 0, 1, 1,
0.9003093, 0.06808662, 1.4911, 0, 0, 0, 1, 1,
0.9011714, 0.9820451, -0.2126155, 0, 0, 0, 1, 1,
0.9054565, -1.949289, 4.347486, 0, 0, 0, 1, 1,
0.9101967, -0.6549919, 2.31538, 0, 0, 0, 1, 1,
0.9116967, -1.457485, 0.6703555, 1, 1, 1, 1, 1,
0.9152169, 2.074834, -0.710735, 1, 1, 1, 1, 1,
0.9153057, 0.02027486, 1.884078, 1, 1, 1, 1, 1,
0.915644, -1.414333, 2.644659, 1, 1, 1, 1, 1,
0.9194103, -0.6012503, 4.057315, 1, 1, 1, 1, 1,
0.9220391, 1.16707, 1.158512, 1, 1, 1, 1, 1,
0.9223846, -0.8298379, 2.59937, 1, 1, 1, 1, 1,
0.9259689, 1.647031, 2.089154, 1, 1, 1, 1, 1,
0.9338112, -1.218298, 0.9821838, 1, 1, 1, 1, 1,
0.9433069, -0.1953779, 1.930171, 1, 1, 1, 1, 1,
0.9453138, -0.3417999, 3.563196, 1, 1, 1, 1, 1,
0.9460742, -0.2469864, 4.963042, 1, 1, 1, 1, 1,
0.9465287, 0.4053402, 0.7497917, 1, 1, 1, 1, 1,
0.947419, -1.026992, 2.584006, 1, 1, 1, 1, 1,
0.9632947, -0.9027162, 2.065441, 1, 1, 1, 1, 1,
0.9703436, 0.9058891, -0.02658085, 0, 0, 1, 1, 1,
0.9721744, -0.7539015, 3.595008, 1, 0, 0, 1, 1,
0.9741966, 0.04265638, 0.6990631, 1, 0, 0, 1, 1,
0.9744171, -0.9196312, 3.081047, 1, 0, 0, 1, 1,
0.9749476, 0.3981043, -1.559236, 1, 0, 0, 1, 1,
0.9781783, 0.7037183, 0.3024947, 1, 0, 0, 1, 1,
0.9794441, -0.5314722, 3.092471, 0, 0, 0, 1, 1,
0.9833295, -0.3609042, 2.272312, 0, 0, 0, 1, 1,
0.9877154, -1.101429, 2.376906, 0, 0, 0, 1, 1,
0.9895946, 0.5811841, 0.6929141, 0, 0, 0, 1, 1,
1.004173, -0.2762263, 1.121435, 0, 0, 0, 1, 1,
1.010561, 0.008505372, 0.462278, 0, 0, 0, 1, 1,
1.015103, -0.1713176, 1.886941, 0, 0, 0, 1, 1,
1.015949, 0.8226873, 1.685559, 1, 1, 1, 1, 1,
1.025955, -0.4051262, 1.450119, 1, 1, 1, 1, 1,
1.026541, 0.9827761, 0.8801659, 1, 1, 1, 1, 1,
1.027204, -0.5902922, 1.573092, 1, 1, 1, 1, 1,
1.028665, 0.5196622, 0.6238773, 1, 1, 1, 1, 1,
1.034248, 1.275214, -0.5599609, 1, 1, 1, 1, 1,
1.037443, -0.3523473, 2.531657, 1, 1, 1, 1, 1,
1.037981, -0.3073709, 1.709936, 1, 1, 1, 1, 1,
1.04737, -0.09233081, 0.8700793, 1, 1, 1, 1, 1,
1.052927, -0.4858971, 1.44915, 1, 1, 1, 1, 1,
1.054971, 1.052283, 0.5006548, 1, 1, 1, 1, 1,
1.055618, 0.05753961, 2.74307, 1, 1, 1, 1, 1,
1.05971, -0.6611177, -0.09670136, 1, 1, 1, 1, 1,
1.060238, 0.8380535, 0.6064091, 1, 1, 1, 1, 1,
1.063589, -1.555125, 3.735649, 1, 1, 1, 1, 1,
1.073172, 0.3157399, 0.7676488, 0, 0, 1, 1, 1,
1.073534, 0.273847, 1.20662, 1, 0, 0, 1, 1,
1.079144, -0.87771, 1.841104, 1, 0, 0, 1, 1,
1.08412, 0.6903047, 0.6206073, 1, 0, 0, 1, 1,
1.08842, 0.6112157, 0.5050613, 1, 0, 0, 1, 1,
1.103833, 1.114992, -0.1302592, 1, 0, 0, 1, 1,
1.111753, -0.03518164, 0.5003932, 0, 0, 0, 1, 1,
1.116976, -0.7546074, 0.9384782, 0, 0, 0, 1, 1,
1.117511, -0.086291, 0.6986097, 0, 0, 0, 1, 1,
1.122059, -0.1641227, 2.940475, 0, 0, 0, 1, 1,
1.124415, -0.2211078, 2.307015, 0, 0, 0, 1, 1,
1.125735, -0.5700923, 0.4756931, 0, 0, 0, 1, 1,
1.127956, -0.258145, 0.3094005, 0, 0, 0, 1, 1,
1.131614, -1.010541, 1.565153, 1, 1, 1, 1, 1,
1.134377, -1.226729, 2.411994, 1, 1, 1, 1, 1,
1.142949, 0.02429171, -0.4566428, 1, 1, 1, 1, 1,
1.15316, 0.7559674, 0.7094293, 1, 1, 1, 1, 1,
1.159775, -0.3255853, 1.283751, 1, 1, 1, 1, 1,
1.161328, 0.9926664, 0.592394, 1, 1, 1, 1, 1,
1.168422, -0.01156993, 3.566983, 1, 1, 1, 1, 1,
1.184135, -0.02526711, 1.898928, 1, 1, 1, 1, 1,
1.184875, 0.9834341, 0.5367378, 1, 1, 1, 1, 1,
1.188036, -0.3186426, 2.427371, 1, 1, 1, 1, 1,
1.199976, 0.8346867, 1.499418, 1, 1, 1, 1, 1,
1.208162, -1.915072, 2.637316, 1, 1, 1, 1, 1,
1.219845, -0.2567756, 1.113811, 1, 1, 1, 1, 1,
1.22812, 0.1355305, 2.086094, 1, 1, 1, 1, 1,
1.229759, -0.523177, 1.578355, 1, 1, 1, 1, 1,
1.241105, -1.100217, 1.983894, 0, 0, 1, 1, 1,
1.254485, -0.5689355, 1.588204, 1, 0, 0, 1, 1,
1.254789, -0.846436, 2.425649, 1, 0, 0, 1, 1,
1.269165, -0.5330486, 1.580202, 1, 0, 0, 1, 1,
1.269465, 0.2647792, 0.1865322, 1, 0, 0, 1, 1,
1.2907, -1.591562, 1.412424, 1, 0, 0, 1, 1,
1.29479, -2.145386, 2.878773, 0, 0, 0, 1, 1,
1.29917, -0.2650069, 1.091442, 0, 0, 0, 1, 1,
1.300152, -0.4597251, 0.995479, 0, 0, 0, 1, 1,
1.300644, 0.1449266, 0.4157167, 0, 0, 0, 1, 1,
1.306181, -0.5593406, 1.262911, 0, 0, 0, 1, 1,
1.310199, 1.573072, 1.723065, 0, 0, 0, 1, 1,
1.312176, -0.5994996, 2.274263, 0, 0, 0, 1, 1,
1.31333, 1.981146, 0.251537, 1, 1, 1, 1, 1,
1.323868, -0.7937233, 2.42492, 1, 1, 1, 1, 1,
1.325883, 0.9651614, 0.3387529, 1, 1, 1, 1, 1,
1.327829, 1.044306, 1.571764, 1, 1, 1, 1, 1,
1.335073, -0.5315832, 0.7883615, 1, 1, 1, 1, 1,
1.343032, 0.1152332, 1.434343, 1, 1, 1, 1, 1,
1.348961, -0.1264728, 1.741901, 1, 1, 1, 1, 1,
1.366907, -2.615163, 2.827962, 1, 1, 1, 1, 1,
1.372734, 1.315627, -0.01900294, 1, 1, 1, 1, 1,
1.389781, 1.450558, 0.46635, 1, 1, 1, 1, 1,
1.403039, -0.08405232, 2.586513, 1, 1, 1, 1, 1,
1.414039, 0.2762575, 1.585174, 1, 1, 1, 1, 1,
1.419287, 0.7613807, 0.8579282, 1, 1, 1, 1, 1,
1.42168, -1.220798, 2.595558, 1, 1, 1, 1, 1,
1.422655, -1.333086, 2.086652, 1, 1, 1, 1, 1,
1.428819, -0.4721885, 2.393735, 0, 0, 1, 1, 1,
1.447079, -0.1541658, 1.582956, 1, 0, 0, 1, 1,
1.447773, 0.2366677, 3.466648, 1, 0, 0, 1, 1,
1.44789, 0.938536, 0.543474, 1, 0, 0, 1, 1,
1.452721, 0.7052433, -0.1637764, 1, 0, 0, 1, 1,
1.455894, -0.6349014, 1.471297, 1, 0, 0, 1, 1,
1.459058, 0.9238459, 1.516982, 0, 0, 0, 1, 1,
1.491276, 0.5090353, 0.8335993, 0, 0, 0, 1, 1,
1.493029, -1.068697, 3.202895, 0, 0, 0, 1, 1,
1.49533, 0.5637021, 2.751098, 0, 0, 0, 1, 1,
1.519172, -0.2919461, 0.01612012, 0, 0, 0, 1, 1,
1.51973, 1.153004, 1.29905, 0, 0, 0, 1, 1,
1.521635, -0.1160285, -1.519506, 0, 0, 0, 1, 1,
1.545717, -0.3258712, 1.472734, 1, 1, 1, 1, 1,
1.571252, 0.6785719, 0.1459962, 1, 1, 1, 1, 1,
1.575343, -0.5111917, 1.197935, 1, 1, 1, 1, 1,
1.583388, -1.60543, 2.906863, 1, 1, 1, 1, 1,
1.587227, 0.4150758, 2.504645, 1, 1, 1, 1, 1,
1.589122, -0.1203491, 0.1925712, 1, 1, 1, 1, 1,
1.591316, 1.477969, -0.4319547, 1, 1, 1, 1, 1,
1.613625, -1.241116, 2.396791, 1, 1, 1, 1, 1,
1.636455, 0.5155787, 1.20401, 1, 1, 1, 1, 1,
1.640169, -0.575582, 2.913516, 1, 1, 1, 1, 1,
1.66364, 0.2150739, 2.751525, 1, 1, 1, 1, 1,
1.66638, -0.3671809, 1.777272, 1, 1, 1, 1, 1,
1.669483, -1.311614, 1.485764, 1, 1, 1, 1, 1,
1.669506, 1.327392, -0.09648272, 1, 1, 1, 1, 1,
1.682618, -0.4275879, 1.656615, 1, 1, 1, 1, 1,
1.683533, 1.470945, 1.754014, 0, 0, 1, 1, 1,
1.691771, 0.3367845, 0.9779693, 1, 0, 0, 1, 1,
1.697789, -0.4196912, 1.604771, 1, 0, 0, 1, 1,
1.70314, 0.621161, 0.9228601, 1, 0, 0, 1, 1,
1.716402, 0.1331389, 1.29598, 1, 0, 0, 1, 1,
1.723132, 2.668756, -1.347643, 1, 0, 0, 1, 1,
1.732486, 0.2689674, 2.585536, 0, 0, 0, 1, 1,
1.747374, 1.0283, 1.020735, 0, 0, 0, 1, 1,
1.757219, 1.046073, 0.5081804, 0, 0, 0, 1, 1,
1.759459, -0.109268, 1.898172, 0, 0, 0, 1, 1,
1.762493, 1.482615, -1.12455, 0, 0, 0, 1, 1,
1.770051, 0.3352357, 1.444876, 0, 0, 0, 1, 1,
1.773332, 0.5333194, 4.063398, 0, 0, 0, 1, 1,
1.779949, -1.353691, 2.548279, 1, 1, 1, 1, 1,
1.785419, -1.039075, 1.658843, 1, 1, 1, 1, 1,
1.813004, -1.070497, 3.064396, 1, 1, 1, 1, 1,
1.82772, 0.5460165, 1.245926, 1, 1, 1, 1, 1,
1.836303, 0.4420539, -1.649652, 1, 1, 1, 1, 1,
1.846793, -0.1527151, 2.279605, 1, 1, 1, 1, 1,
1.850571, -0.7807304, 2.478072, 1, 1, 1, 1, 1,
1.863795, 0.5884946, 1.271005, 1, 1, 1, 1, 1,
1.864575, -0.5894859, 1.396738, 1, 1, 1, 1, 1,
1.869082, 2.247328, 1.359278, 1, 1, 1, 1, 1,
1.877198, 0.02509533, 2.997867, 1, 1, 1, 1, 1,
1.907071, -0.8050041, 2.433627, 1, 1, 1, 1, 1,
1.909865, 0.6769647, 0.130477, 1, 1, 1, 1, 1,
1.917989, -0.9221463, 2.806554, 1, 1, 1, 1, 1,
1.943934, 1.276338, 0.8388454, 1, 1, 1, 1, 1,
1.950601, 0.2577208, 1.65489, 0, 0, 1, 1, 1,
2.033777, 0.4353687, 0.6363829, 1, 0, 0, 1, 1,
2.071859, -1.095272, -0.3350308, 1, 0, 0, 1, 1,
2.093613, 1.41553, 0.4682387, 1, 0, 0, 1, 1,
2.116278, -0.6146252, 0.6892095, 1, 0, 0, 1, 1,
2.220864, -1.451986, 1.893729, 1, 0, 0, 1, 1,
2.250148, 1.81952, -0.591861, 0, 0, 0, 1, 1,
2.281994, 0.6849207, 3.20403, 0, 0, 0, 1, 1,
2.343354, -0.345225, 3.045721, 0, 0, 0, 1, 1,
2.397553, -0.1652621, 2.818923, 0, 0, 0, 1, 1,
2.407521, 0.9203802, 0.9550526, 0, 0, 0, 1, 1,
2.423487, 0.6690078, 1.783153, 0, 0, 0, 1, 1,
2.437919, -0.1961034, 1.728733, 0, 0, 0, 1, 1,
2.492488, -0.01552984, 1.979487, 1, 1, 1, 1, 1,
2.532524, 1.595019, 1.740772, 1, 1, 1, 1, 1,
2.595814, -0.1500602, 1.31257, 1, 1, 1, 1, 1,
2.61913, 1.835036, 1.198449, 1, 1, 1, 1, 1,
2.631752, 1.404269, 1.821427, 1, 1, 1, 1, 1,
2.722457, -0.8823237, 2.088471, 1, 1, 1, 1, 1,
3.095298, -0.09255788, 2.352406, 1, 1, 1, 1, 1
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
var radius = 9.751526;
var distance = 34.25182;
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
mvMatrix.translate( 0.1976404, 0.3579924, 0.01845384 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.25182);
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
