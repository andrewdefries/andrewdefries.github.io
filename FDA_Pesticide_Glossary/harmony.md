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
-3.357339, 1.320678, -0.8130032, 1, 0, 0, 1,
-3.295996, -0.4013883, -0.8833267, 1, 0.007843138, 0, 1,
-3.037806, 0.3154895, -2.403517, 1, 0.01176471, 0, 1,
-3.02647, -0.2564315, -2.382676, 1, 0.01960784, 0, 1,
-2.620892, 1.684318, 1.30007, 1, 0.02352941, 0, 1,
-2.615645, 0.2573205, -1.589811, 1, 0.03137255, 0, 1,
-2.605289, -0.2376938, -1.732557, 1, 0.03529412, 0, 1,
-2.581684, -0.4441779, -1.683217, 1, 0.04313726, 0, 1,
-2.550208, -2.524536, -0.151713, 1, 0.04705882, 0, 1,
-2.506125, 2.158166, -1.685351, 1, 0.05490196, 0, 1,
-2.472128, 0.02556632, -1.418531, 1, 0.05882353, 0, 1,
-2.470208, -0.6587391, -2.614853, 1, 0.06666667, 0, 1,
-2.450116, -1.228622, -1.981202, 1, 0.07058824, 0, 1,
-2.407064, 0.5103223, -1.145538, 1, 0.07843138, 0, 1,
-2.379559, 0.2152123, -1.053571, 1, 0.08235294, 0, 1,
-2.367829, -1.280313, -3.20344, 1, 0.09019608, 0, 1,
-2.36564, -0.3014825, -3.547622, 1, 0.09411765, 0, 1,
-2.264078, 0.1120402, -1.514643, 1, 0.1019608, 0, 1,
-2.214948, 0.885416, -2.268356, 1, 0.1098039, 0, 1,
-2.17691, -0.1064397, -2.708368, 1, 0.1137255, 0, 1,
-2.102848, -0.5673005, -1.219709, 1, 0.1215686, 0, 1,
-2.046435, 3.442629, 1.404444, 1, 0.1254902, 0, 1,
-1.996819, 0.9268303, -0.9065487, 1, 0.1333333, 0, 1,
-1.99216, 0.9565814, 0.526792, 1, 0.1372549, 0, 1,
-1.977487, 0.0314583, -1.653715, 1, 0.145098, 0, 1,
-1.965204, 0.4669461, -0.9655433, 1, 0.1490196, 0, 1,
-1.964822, -0.7557119, -3.098231, 1, 0.1568628, 0, 1,
-1.883976, 0.6116392, -1.680609, 1, 0.1607843, 0, 1,
-1.878558, 0.3643881, -1.82168, 1, 0.1686275, 0, 1,
-1.871985, 0.4259559, -2.297107, 1, 0.172549, 0, 1,
-1.826031, -0.1143293, -2.118096, 1, 0.1803922, 0, 1,
-1.816656, 0.4154749, -1.906975, 1, 0.1843137, 0, 1,
-1.814929, 0.7924928, -2.000862, 1, 0.1921569, 0, 1,
-1.797524, -0.04898947, 0.4023629, 1, 0.1960784, 0, 1,
-1.782665, -1.272891, -3.438877, 1, 0.2039216, 0, 1,
-1.76463, -0.06530381, -2.11554, 1, 0.2117647, 0, 1,
-1.751452, 1.729019, 1.908344, 1, 0.2156863, 0, 1,
-1.733241, 0.1670545, -1.589878, 1, 0.2235294, 0, 1,
-1.733202, 1.041353, -1.144119, 1, 0.227451, 0, 1,
-1.716589, -0.5718402, -2.449703, 1, 0.2352941, 0, 1,
-1.709516, 0.3383119, -0.321586, 1, 0.2392157, 0, 1,
-1.708704, 1.405601, -1.416489, 1, 0.2470588, 0, 1,
-1.689538, -1.010085, -1.64525, 1, 0.2509804, 0, 1,
-1.668001, 0.2624495, -1.439009, 1, 0.2588235, 0, 1,
-1.659654, -0.09215044, -1.138752, 1, 0.2627451, 0, 1,
-1.659155, 0.2662455, -1.698804, 1, 0.2705882, 0, 1,
-1.637784, -0.4554707, -1.950801, 1, 0.2745098, 0, 1,
-1.637509, 1.215804, -1.275405, 1, 0.282353, 0, 1,
-1.619565, -0.5451582, -2.437213, 1, 0.2862745, 0, 1,
-1.606142, -0.2633767, 0.0499377, 1, 0.2941177, 0, 1,
-1.594087, -1.864227, -2.766533, 1, 0.3019608, 0, 1,
-1.586305, 0.2208945, -1.873102, 1, 0.3058824, 0, 1,
-1.57388, 0.5743721, -3.007606, 1, 0.3137255, 0, 1,
-1.570679, 0.2649259, -2.09546, 1, 0.3176471, 0, 1,
-1.548212, -0.749967, -1.669481, 1, 0.3254902, 0, 1,
-1.51982, 0.4257157, -1.340218, 1, 0.3294118, 0, 1,
-1.516328, 0.2098653, -1.493826, 1, 0.3372549, 0, 1,
-1.514964, 1.260725, -1.532411, 1, 0.3411765, 0, 1,
-1.507837, -1.143925, -2.346669, 1, 0.3490196, 0, 1,
-1.505825, 0.3340742, -1.381688, 1, 0.3529412, 0, 1,
-1.500185, 0.5667177, -0.3678646, 1, 0.3607843, 0, 1,
-1.493913, 0.1135764, -0.4259887, 1, 0.3647059, 0, 1,
-1.482747, 0.5487402, 1.847685, 1, 0.372549, 0, 1,
-1.474804, -0.1128036, -1.786161, 1, 0.3764706, 0, 1,
-1.453777, -0.6147186, -2.405093, 1, 0.3843137, 0, 1,
-1.450897, 0.3749312, -0.119449, 1, 0.3882353, 0, 1,
-1.445853, 0.4427253, -2.656341, 1, 0.3960784, 0, 1,
-1.440493, 0.4541383, -1.765986, 1, 0.4039216, 0, 1,
-1.440174, 0.6025707, -2.418327, 1, 0.4078431, 0, 1,
-1.423808, -0.4812838, -0.8646075, 1, 0.4156863, 0, 1,
-1.416576, 1.833519, 0.537237, 1, 0.4196078, 0, 1,
-1.412816, -0.4470821, 0.140252, 1, 0.427451, 0, 1,
-1.41237, 1.486729, -0.2527998, 1, 0.4313726, 0, 1,
-1.407754, -1.172477, -1.973408, 1, 0.4392157, 0, 1,
-1.407175, -0.2658672, -1.213959, 1, 0.4431373, 0, 1,
-1.402181, -1.607605, -3.264317, 1, 0.4509804, 0, 1,
-1.389842, -2.029438, -3.193255, 1, 0.454902, 0, 1,
-1.377893, 0.222698, -1.626269, 1, 0.4627451, 0, 1,
-1.367388, 0.8626332, -0.5694611, 1, 0.4666667, 0, 1,
-1.355846, 0.6710235, -0.7792729, 1, 0.4745098, 0, 1,
-1.352887, 1.46895, -0.9784881, 1, 0.4784314, 0, 1,
-1.351307, -0.3409355, -1.54126, 1, 0.4862745, 0, 1,
-1.346443, -0.4838064, -0.2622008, 1, 0.4901961, 0, 1,
-1.344385, -0.8604472, -2.274157, 1, 0.4980392, 0, 1,
-1.342431, -1.199349, -2.940181, 1, 0.5058824, 0, 1,
-1.3423, 0.8229527, -0.9628052, 1, 0.509804, 0, 1,
-1.34206, -1.052973, -2.819317, 1, 0.5176471, 0, 1,
-1.339094, -0.6735447, -1.749775, 1, 0.5215687, 0, 1,
-1.3336, 0.6249227, -1.152117, 1, 0.5294118, 0, 1,
-1.33235, 0.5050626, -3.172731, 1, 0.5333334, 0, 1,
-1.326345, 1.98026, -0.5283029, 1, 0.5411765, 0, 1,
-1.321453, 0.3974667, -2.762395, 1, 0.5450981, 0, 1,
-1.317572, 0.3428365, -0.6867716, 1, 0.5529412, 0, 1,
-1.310559, -0.2099394, -2.588464, 1, 0.5568628, 0, 1,
-1.302442, -0.7312788, -1.707028, 1, 0.5647059, 0, 1,
-1.302422, 0.8250136, -1.723159, 1, 0.5686275, 0, 1,
-1.294359, 0.6474242, -0.9082604, 1, 0.5764706, 0, 1,
-1.284613, -0.8041871, -1.755546, 1, 0.5803922, 0, 1,
-1.280109, 0.6847426, -0.7614251, 1, 0.5882353, 0, 1,
-1.264841, -0.9258023, -1.68226, 1, 0.5921569, 0, 1,
-1.254873, 1.334596, -0.1320352, 1, 0.6, 0, 1,
-1.248847, -0.5766631, -2.252495, 1, 0.6078432, 0, 1,
-1.247988, 0.117726, -2.425537, 1, 0.6117647, 0, 1,
-1.235803, 0.1149853, -2.957833, 1, 0.6196079, 0, 1,
-1.234923, -0.5746145, -0.8873274, 1, 0.6235294, 0, 1,
-1.224856, -0.5530466, -0.2679246, 1, 0.6313726, 0, 1,
-1.221451, 0.2993554, 0.06945702, 1, 0.6352941, 0, 1,
-1.220372, 0.5965837, -2.288046, 1, 0.6431373, 0, 1,
-1.21885, -0.1159063, -0.6331444, 1, 0.6470588, 0, 1,
-1.215623, -1.159905, -3.806364, 1, 0.654902, 0, 1,
-1.200362, 0.6523298, 1.149338, 1, 0.6588235, 0, 1,
-1.193898, 0.5079505, -0.767383, 1, 0.6666667, 0, 1,
-1.19042, 0.4822155, -1.680201, 1, 0.6705883, 0, 1,
-1.1903, -0.6432824, -3.324182, 1, 0.6784314, 0, 1,
-1.183972, 2.572026, -2.497209, 1, 0.682353, 0, 1,
-1.182881, 0.1749492, -2.026417, 1, 0.6901961, 0, 1,
-1.16869, 0.9731307, -1.895448, 1, 0.6941177, 0, 1,
-1.167022, 1.637167, -1.48765, 1, 0.7019608, 0, 1,
-1.166388, 0.3050234, -1.045206, 1, 0.7098039, 0, 1,
-1.166036, 0.8273205, -0.8845277, 1, 0.7137255, 0, 1,
-1.151199, 1.756052, -1.508211, 1, 0.7215686, 0, 1,
-1.145746, -0.2344194, -1.567404, 1, 0.7254902, 0, 1,
-1.135968, -1.762163, -2.276419, 1, 0.7333333, 0, 1,
-1.126981, 0.2277995, -1.759598, 1, 0.7372549, 0, 1,
-1.121119, 0.6837616, -1.383105, 1, 0.7450981, 0, 1,
-1.113213, -1.709575, -4.468041, 1, 0.7490196, 0, 1,
-1.109923, -1.300541, -2.699637, 1, 0.7568628, 0, 1,
-1.108895, 1.197494, -1.974901, 1, 0.7607843, 0, 1,
-1.105542, -0.2188284, -1.074395, 1, 0.7686275, 0, 1,
-1.105176, -0.3038295, -3.634413, 1, 0.772549, 0, 1,
-1.1039, -0.4824755, -1.169645, 1, 0.7803922, 0, 1,
-1.101509, 0.7652417, -2.331775, 1, 0.7843137, 0, 1,
-1.093639, 0.2820606, -0.8251315, 1, 0.7921569, 0, 1,
-1.086565, -0.9211476, -1.907418, 1, 0.7960784, 0, 1,
-1.085864, 1.248947, -0.2864613, 1, 0.8039216, 0, 1,
-1.084947, 0.6252739, -1.631978, 1, 0.8117647, 0, 1,
-1.083188, 0.8511319, -0.8663487, 1, 0.8156863, 0, 1,
-1.08101, 2.484438, -0.1171455, 1, 0.8235294, 0, 1,
-1.079061, 1.306864, -1.427653, 1, 0.827451, 0, 1,
-1.076576, 1.071345, 0.5143275, 1, 0.8352941, 0, 1,
-1.07454, -1.117577, -3.402435, 1, 0.8392157, 0, 1,
-1.072989, 0.7723552, -1.157719, 1, 0.8470588, 0, 1,
-1.070087, -1.164356, -3.296551, 1, 0.8509804, 0, 1,
-1.06898, -0.02428957, -1.660909, 1, 0.8588235, 0, 1,
-1.052881, 0.3179122, -3.161937, 1, 0.8627451, 0, 1,
-1.045748, 0.4134406, -2.238422, 1, 0.8705882, 0, 1,
-1.027696, -0.60888, -1.995416, 1, 0.8745098, 0, 1,
-1.027087, -0.2785827, -2.150469, 1, 0.8823529, 0, 1,
-1.017515, 1.439269, -0.8410764, 1, 0.8862745, 0, 1,
-1.013586, -0.6031386, -2.054389, 1, 0.8941177, 0, 1,
-1.013114, -1.066689, -2.54583, 1, 0.8980392, 0, 1,
-1.010407, -0.5008578, -3.018718, 1, 0.9058824, 0, 1,
-1.008643, -0.9328426, -1.855758, 1, 0.9137255, 0, 1,
-1.007159, 0.2251136, -2.314052, 1, 0.9176471, 0, 1,
-1.006646, -0.1156781, -2.363375, 1, 0.9254902, 0, 1,
-0.9852057, 0.6138924, -1.102234, 1, 0.9294118, 0, 1,
-0.980226, -0.353399, -1.43173, 1, 0.9372549, 0, 1,
-0.9759842, 1.531338, -1.2316, 1, 0.9411765, 0, 1,
-0.9739338, 1.362959, -0.7693663, 1, 0.9490196, 0, 1,
-0.9702182, -1.373078, -1.314523, 1, 0.9529412, 0, 1,
-0.9617547, 0.4441956, -1.389019, 1, 0.9607843, 0, 1,
-0.9560203, 1.044334, -0.5860555, 1, 0.9647059, 0, 1,
-0.9481663, 0.396608, -2.700686, 1, 0.972549, 0, 1,
-0.9463882, 0.9921679, -2.467901, 1, 0.9764706, 0, 1,
-0.9428012, -0.9874624, -1.646295, 1, 0.9843137, 0, 1,
-0.9426916, -0.4018109, -1.744416, 1, 0.9882353, 0, 1,
-0.9308372, -0.04236156, -2.412015, 1, 0.9960784, 0, 1,
-0.930365, -0.1497726, -1.969418, 0.9960784, 1, 0, 1,
-0.9213794, 0.07814996, -0.5938525, 0.9921569, 1, 0, 1,
-0.9195713, -0.03983718, -0.9543868, 0.9843137, 1, 0, 1,
-0.9149497, 0.4930933, -1.880029, 0.9803922, 1, 0, 1,
-0.9094791, 0.3880875, -2.68749, 0.972549, 1, 0, 1,
-0.9092638, 1.454461, 0.898603, 0.9686275, 1, 0, 1,
-0.9024854, -0.2733138, -2.417056, 0.9607843, 1, 0, 1,
-0.8974333, -0.224808, -1.467625, 0.9568627, 1, 0, 1,
-0.8943776, 1.28798, -0.1325729, 0.9490196, 1, 0, 1,
-0.885206, -1.541906, -2.71335, 0.945098, 1, 0, 1,
-0.8849682, 0.9210318, 0.292149, 0.9372549, 1, 0, 1,
-0.8777429, 0.9037256, -2.742575, 0.9333333, 1, 0, 1,
-0.8733408, 0.321964, -0.1146917, 0.9254902, 1, 0, 1,
-0.8720261, -1.062641, -1.887145, 0.9215686, 1, 0, 1,
-0.8710087, 1.060075, -0.1944624, 0.9137255, 1, 0, 1,
-0.8686799, 1.266181, -1.687908, 0.9098039, 1, 0, 1,
-0.8672201, 0.9166589, -1.023483, 0.9019608, 1, 0, 1,
-0.8653842, -0.1332645, -1.41502, 0.8941177, 1, 0, 1,
-0.8650008, 1.009576, 0.3139248, 0.8901961, 1, 0, 1,
-0.8649269, 0.3973587, 0.2341108, 0.8823529, 1, 0, 1,
-0.8625919, -0.1870915, -1.891584, 0.8784314, 1, 0, 1,
-0.8621451, -2.364437, -2.652132, 0.8705882, 1, 0, 1,
-0.8598461, 0.5825832, -0.2218456, 0.8666667, 1, 0, 1,
-0.8580816, -0.6753764, -2.757716, 0.8588235, 1, 0, 1,
-0.855012, 1.142055, 0.6043478, 0.854902, 1, 0, 1,
-0.8534934, -1.070207, -3.639889, 0.8470588, 1, 0, 1,
-0.853035, 0.1016251, -1.617687, 0.8431373, 1, 0, 1,
-0.8421518, -1.543323, -2.572157, 0.8352941, 1, 0, 1,
-0.840553, -0.4150992, -3.427857, 0.8313726, 1, 0, 1,
-0.8376644, 0.1616044, -0.8875245, 0.8235294, 1, 0, 1,
-0.8242602, -0.2967155, -1.576418, 0.8196079, 1, 0, 1,
-0.8185745, 0.3068834, -1.130208, 0.8117647, 1, 0, 1,
-0.8162903, 0.5365906, -1.201323, 0.8078431, 1, 0, 1,
-0.8105957, -1.19572, -2.080364, 0.8, 1, 0, 1,
-0.8104864, -0.280469, 0.2834788, 0.7921569, 1, 0, 1,
-0.8083821, 0.1129644, -2.252532, 0.7882353, 1, 0, 1,
-0.8020142, 2.64443, 2.05985, 0.7803922, 1, 0, 1,
-0.7821264, 0.04964989, -1.690883, 0.7764706, 1, 0, 1,
-0.775417, 0.4470702, -0.3276375, 0.7686275, 1, 0, 1,
-0.7649563, -1.806967, -3.847304, 0.7647059, 1, 0, 1,
-0.7610144, -0.8007815, -2.128018, 0.7568628, 1, 0, 1,
-0.7526525, -0.9220459, -1.2653, 0.7529412, 1, 0, 1,
-0.7523255, 1.279687, -0.3854332, 0.7450981, 1, 0, 1,
-0.7464016, -2.673685, -1.932853, 0.7411765, 1, 0, 1,
-0.742914, 1.937979, -1.795829, 0.7333333, 1, 0, 1,
-0.7426015, -0.5269355, -2.294054, 0.7294118, 1, 0, 1,
-0.7316909, 0.3242499, -1.93977, 0.7215686, 1, 0, 1,
-0.7287914, -0.4965115, -2.399725, 0.7176471, 1, 0, 1,
-0.7282799, 0.9412827, -1.150154, 0.7098039, 1, 0, 1,
-0.7274636, 2.572338, -0.4184736, 0.7058824, 1, 0, 1,
-0.7265939, 0.2153361, -0.1707573, 0.6980392, 1, 0, 1,
-0.7187637, -0.5475073, -2.330911, 0.6901961, 1, 0, 1,
-0.7174688, 1.623413, -1.763946, 0.6862745, 1, 0, 1,
-0.7165582, -1.359461, -1.947297, 0.6784314, 1, 0, 1,
-0.7158149, -0.1062296, -1.813257, 0.6745098, 1, 0, 1,
-0.7116292, 0.660003, -0.9972268, 0.6666667, 1, 0, 1,
-0.7081783, -0.8929302, -1.527698, 0.6627451, 1, 0, 1,
-0.7079323, -0.8476991, -3.166892, 0.654902, 1, 0, 1,
-0.7052349, -0.5126657, -2.702235, 0.6509804, 1, 0, 1,
-0.7026413, -0.7562146, -0.6233928, 0.6431373, 1, 0, 1,
-0.6957459, 0.2722118, -0.1619599, 0.6392157, 1, 0, 1,
-0.6946908, 0.07579587, -1.772136, 0.6313726, 1, 0, 1,
-0.6946654, -0.02643006, -1.606878, 0.627451, 1, 0, 1,
-0.6815606, 0.04462331, -2.943974, 0.6196079, 1, 0, 1,
-0.666879, 0.8279893, -1.660632, 0.6156863, 1, 0, 1,
-0.6585434, 0.3910947, 0.4727315, 0.6078432, 1, 0, 1,
-0.6555743, 0.7985176, -0.8974585, 0.6039216, 1, 0, 1,
-0.6542426, -0.1740515, -1.876584, 0.5960785, 1, 0, 1,
-0.6518134, 1.225894, -0.8127115, 0.5882353, 1, 0, 1,
-0.6499233, -1.68932, -2.409391, 0.5843138, 1, 0, 1,
-0.6485699, 0.7982562, -1.472423, 0.5764706, 1, 0, 1,
-0.6474857, 0.4789771, -0.7836258, 0.572549, 1, 0, 1,
-0.6462013, 0.9364197, 0.9473758, 0.5647059, 1, 0, 1,
-0.6452516, 0.3100909, -1.038587, 0.5607843, 1, 0, 1,
-0.6447439, -0.2274124, -2.805325, 0.5529412, 1, 0, 1,
-0.6422098, -1.581082, -4.765991, 0.5490196, 1, 0, 1,
-0.6372198, 0.3982519, -1.717401, 0.5411765, 1, 0, 1,
-0.6319519, -1.093216, -5.281697, 0.5372549, 1, 0, 1,
-0.6222315, -0.700236, -3.326545, 0.5294118, 1, 0, 1,
-0.6160421, -0.5873582, -1.746608, 0.5254902, 1, 0, 1,
-0.6152099, -1.536482, -3.856069, 0.5176471, 1, 0, 1,
-0.6109793, 0.7386001, 0.04936406, 0.5137255, 1, 0, 1,
-0.6081787, -0.712235, -1.470918, 0.5058824, 1, 0, 1,
-0.6069668, -0.5418259, -2.723825, 0.5019608, 1, 0, 1,
-0.6052363, 0.07721847, -0.9878755, 0.4941176, 1, 0, 1,
-0.6023971, 0.1755278, -1.892016, 0.4862745, 1, 0, 1,
-0.6023196, -0.6458198, -3.056479, 0.4823529, 1, 0, 1,
-0.6009212, -0.8249088, -4.575994, 0.4745098, 1, 0, 1,
-0.6006119, -0.3168673, -1.349301, 0.4705882, 1, 0, 1,
-0.5944028, -0.3713384, -3.296312, 0.4627451, 1, 0, 1,
-0.5913194, 0.3221365, -2.634249, 0.4588235, 1, 0, 1,
-0.5904326, 0.1728804, -0.8032404, 0.4509804, 1, 0, 1,
-0.590146, -0.1055504, -2.434585, 0.4470588, 1, 0, 1,
-0.588922, -0.1437499, -1.681245, 0.4392157, 1, 0, 1,
-0.5884338, -1.172368, -2.737685, 0.4352941, 1, 0, 1,
-0.5857307, -0.1185761, -2.894638, 0.427451, 1, 0, 1,
-0.5855311, 1.888124, -1.197305, 0.4235294, 1, 0, 1,
-0.5777954, -0.4181248, -2.834606, 0.4156863, 1, 0, 1,
-0.5718254, 0.7889359, -1.964119, 0.4117647, 1, 0, 1,
-0.5694183, 0.1167972, -2.783431, 0.4039216, 1, 0, 1,
-0.5681772, 1.475451, 1.153276, 0.3960784, 1, 0, 1,
-0.5655761, 0.1271254, -0.5144296, 0.3921569, 1, 0, 1,
-0.5564548, 1.644395, -1.175849, 0.3843137, 1, 0, 1,
-0.5547388, 0.06325354, -2.246132, 0.3803922, 1, 0, 1,
-0.552637, 0.663678, 0.9027327, 0.372549, 1, 0, 1,
-0.5525275, -0.6794421, -3.222083, 0.3686275, 1, 0, 1,
-0.5516854, 0.8696403, 1.78615, 0.3607843, 1, 0, 1,
-0.5454214, -0.1799769, -1.60396, 0.3568628, 1, 0, 1,
-0.5452485, -0.6082008, -2.944423, 0.3490196, 1, 0, 1,
-0.5404646, 0.4442477, -0.7267973, 0.345098, 1, 0, 1,
-0.5396916, -1.272, -1.649244, 0.3372549, 1, 0, 1,
-0.5389363, -0.06103364, -0.4990233, 0.3333333, 1, 0, 1,
-0.5338078, -1.444915, -3.96657, 0.3254902, 1, 0, 1,
-0.5305244, 0.4391665, -1.540533, 0.3215686, 1, 0, 1,
-0.5234329, -0.8241168, -5.052101, 0.3137255, 1, 0, 1,
-0.5189286, 0.9378223, 1.087342, 0.3098039, 1, 0, 1,
-0.5185647, -1.795568, -2.254482, 0.3019608, 1, 0, 1,
-0.5176802, -1.305237, -3.708724, 0.2941177, 1, 0, 1,
-0.5151657, -0.8459084, -2.060491, 0.2901961, 1, 0, 1,
-0.5144097, 0.3862794, -2.745208, 0.282353, 1, 0, 1,
-0.513415, -0.1325642, -0.9818164, 0.2784314, 1, 0, 1,
-0.5108584, -0.04881303, -4.050312, 0.2705882, 1, 0, 1,
-0.5090234, -1.191123, -1.920577, 0.2666667, 1, 0, 1,
-0.5070401, -0.4954346, -2.534481, 0.2588235, 1, 0, 1,
-0.5064169, -0.4884048, -0.7094665, 0.254902, 1, 0, 1,
-0.4972489, 0.1954606, -0.3260151, 0.2470588, 1, 0, 1,
-0.4918182, -0.1689189, -3.570218, 0.2431373, 1, 0, 1,
-0.4900669, 0.9547267, -0.9607524, 0.2352941, 1, 0, 1,
-0.48748, -0.7885777, -2.609316, 0.2313726, 1, 0, 1,
-0.483998, 0.4378216, -0.4285219, 0.2235294, 1, 0, 1,
-0.4817434, -0.28318, -0.409583, 0.2196078, 1, 0, 1,
-0.4802556, 0.3031819, -0.340061, 0.2117647, 1, 0, 1,
-0.4795439, 1.051152, 0.2984051, 0.2078431, 1, 0, 1,
-0.4794504, 0.1441264, -2.268125, 0.2, 1, 0, 1,
-0.477315, -0.09928964, -0.4337161, 0.1921569, 1, 0, 1,
-0.4761234, 1.051699, -0.0392828, 0.1882353, 1, 0, 1,
-0.4757619, -0.8374045, -2.330873, 0.1803922, 1, 0, 1,
-0.4743485, 0.4414433, -0.7398731, 0.1764706, 1, 0, 1,
-0.4725354, 0.5148522, -0.7871805, 0.1686275, 1, 0, 1,
-0.4685177, 1.241214, 0.02629023, 0.1647059, 1, 0, 1,
-0.4684252, 0.6489336, -0.2750663, 0.1568628, 1, 0, 1,
-0.4679529, -2.355374, -2.880416, 0.1529412, 1, 0, 1,
-0.4665288, 0.7889081, -1.2951, 0.145098, 1, 0, 1,
-0.4636351, -0.5890992, -2.865282, 0.1411765, 1, 0, 1,
-0.4625683, -0.04887276, -0.9123365, 0.1333333, 1, 0, 1,
-0.4618399, -0.5768571, -3.537981, 0.1294118, 1, 0, 1,
-0.4611788, 0.5439285, -0.4694514, 0.1215686, 1, 0, 1,
-0.4553957, 0.5565704, 1.798518, 0.1176471, 1, 0, 1,
-0.4516018, -0.3271396, -3.865209, 0.1098039, 1, 0, 1,
-0.449004, -0.9206202, -1.891388, 0.1058824, 1, 0, 1,
-0.4461628, -1.039071, -2.868938, 0.09803922, 1, 0, 1,
-0.4329214, 1.282306, -1.33549, 0.09019608, 1, 0, 1,
-0.431635, -0.409629, -1.80297, 0.08627451, 1, 0, 1,
-0.4104837, 0.7460201, 0.9484915, 0.07843138, 1, 0, 1,
-0.4058621, 0.5471925, -3.242327, 0.07450981, 1, 0, 1,
-0.4043507, -0.898036, -1.519893, 0.06666667, 1, 0, 1,
-0.3966943, -1.25486, -2.963357, 0.0627451, 1, 0, 1,
-0.396503, -0.2456955, -2.754235, 0.05490196, 1, 0, 1,
-0.3915616, 0.4713833, -1.261413, 0.05098039, 1, 0, 1,
-0.3841966, -0.3946704, -1.929171, 0.04313726, 1, 0, 1,
-0.3805881, -0.5155974, -2.743694, 0.03921569, 1, 0, 1,
-0.3798229, -1.196656, -4.143325, 0.03137255, 1, 0, 1,
-0.3727957, 1.760793, 0.0155547, 0.02745098, 1, 0, 1,
-0.3714036, -0.5677134, -3.451933, 0.01960784, 1, 0, 1,
-0.3695719, -1.724202, -3.201136, 0.01568628, 1, 0, 1,
-0.3694074, 0.1053738, 1.551919, 0.007843138, 1, 0, 1,
-0.3691025, -1.393648, -1.867549, 0.003921569, 1, 0, 1,
-0.3687375, -0.7299107, -2.697911, 0, 1, 0.003921569, 1,
-0.3661352, 0.8376225, -0.3997772, 0, 1, 0.01176471, 1,
-0.3559434, -0.4467137, -2.088745, 0, 1, 0.01568628, 1,
-0.3539623, 0.6600828, -0.3266308, 0, 1, 0.02352941, 1,
-0.3534053, -0.1679998, -2.412071, 0, 1, 0.02745098, 1,
-0.3514581, 0.1031185, -2.598109, 0, 1, 0.03529412, 1,
-0.3513789, 0.4778039, 0.09652383, 0, 1, 0.03921569, 1,
-0.3512746, 0.3032005, -1.083738, 0, 1, 0.04705882, 1,
-0.3486908, 1.250901, -0.2795903, 0, 1, 0.05098039, 1,
-0.3454422, 1.50615, -0.3559019, 0, 1, 0.05882353, 1,
-0.3447476, -0.3385115, -1.547078, 0, 1, 0.0627451, 1,
-0.3409868, 0.4179575, -0.4424036, 0, 1, 0.07058824, 1,
-0.3400668, 0.9049118, -0.0620388, 0, 1, 0.07450981, 1,
-0.3367658, 0.3929163, -1.798503, 0, 1, 0.08235294, 1,
-0.3341129, 1.523237, 2.326476, 0, 1, 0.08627451, 1,
-0.3324842, 1.75649, -2.227137, 0, 1, 0.09411765, 1,
-0.3282539, -0.5395384, -0.773158, 0, 1, 0.1019608, 1,
-0.3265945, -0.3609871, -3.199583, 0, 1, 0.1058824, 1,
-0.3249594, -0.5783045, -3.960395, 0, 1, 0.1137255, 1,
-0.3154185, -0.8054751, -4.260441, 0, 1, 0.1176471, 1,
-0.3152422, -1.636054, -3.34882, 0, 1, 0.1254902, 1,
-0.3131942, -0.2767701, -1.802098, 0, 1, 0.1294118, 1,
-0.3098329, 0.2288104, 0.7304833, 0, 1, 0.1372549, 1,
-0.3053228, 1.608241, -0.8236509, 0, 1, 0.1411765, 1,
-0.3039998, 0.7288457, 0.09617971, 0, 1, 0.1490196, 1,
-0.2957448, 0.08189867, -1.085656, 0, 1, 0.1529412, 1,
-0.2954808, 0.3148513, -0.9700609, 0, 1, 0.1607843, 1,
-0.2937436, 0.5678897, -0.7890862, 0, 1, 0.1647059, 1,
-0.2907268, 1.750975, -0.8532677, 0, 1, 0.172549, 1,
-0.2869652, 0.8008094, -1.147023, 0, 1, 0.1764706, 1,
-0.2844513, -0.6249848, -2.277643, 0, 1, 0.1843137, 1,
-0.2795559, -0.7121823, -2.37716, 0, 1, 0.1882353, 1,
-0.2757263, -0.3946151, -4.718017, 0, 1, 0.1960784, 1,
-0.2626664, 0.975369, 0.6754367, 0, 1, 0.2039216, 1,
-0.2596723, -0.8546097, -3.776876, 0, 1, 0.2078431, 1,
-0.2587937, -2.085996, -1.67106, 0, 1, 0.2156863, 1,
-0.2543695, 0.8555012, -0.9174764, 0, 1, 0.2196078, 1,
-0.2529295, 2.017296, -1.348444, 0, 1, 0.227451, 1,
-0.2527967, -0.9695017, -1.554955, 0, 1, 0.2313726, 1,
-0.246994, -0.2868379, -1.271, 0, 1, 0.2392157, 1,
-0.2460025, -0.3661794, -2.813905, 0, 1, 0.2431373, 1,
-0.2423384, -0.1926859, -2.691435, 0, 1, 0.2509804, 1,
-0.2422274, -0.437416, -4.232337, 0, 1, 0.254902, 1,
-0.2406732, -0.05696666, 0.544474, 0, 1, 0.2627451, 1,
-0.2386232, 0.1777313, 1.396509, 0, 1, 0.2666667, 1,
-0.2380442, -0.0677234, -0.6984957, 0, 1, 0.2745098, 1,
-0.2363467, 0.2677439, 0.04196866, 0, 1, 0.2784314, 1,
-0.2358725, -0.3999978, -1.899932, 0, 1, 0.2862745, 1,
-0.2347554, -2.267464, -2.736803, 0, 1, 0.2901961, 1,
-0.2334584, -1.065361, -2.088198, 0, 1, 0.2980392, 1,
-0.2307794, -1.398978, -2.578705, 0, 1, 0.3058824, 1,
-0.2270256, 2.619934, -0.04823051, 0, 1, 0.3098039, 1,
-0.2232318, 1.118505, 0.9463613, 0, 1, 0.3176471, 1,
-0.2205675, -0.2412939, -2.319843, 0, 1, 0.3215686, 1,
-0.2165484, 0.89811, -0.1427501, 0, 1, 0.3294118, 1,
-0.2160847, -1.606378, -3.845937, 0, 1, 0.3333333, 1,
-0.2133275, -1.055592, -2.899821, 0, 1, 0.3411765, 1,
-0.2080162, 0.4288505, -0.2340992, 0, 1, 0.345098, 1,
-0.2022965, 0.4103454, 0.6180884, 0, 1, 0.3529412, 1,
-0.2019201, 0.4549337, 0.7605519, 0, 1, 0.3568628, 1,
-0.2017604, 0.4180466, -1.690369, 0, 1, 0.3647059, 1,
-0.2000543, 0.1452617, -1.766044, 0, 1, 0.3686275, 1,
-0.199338, -1.571826, -4.089355, 0, 1, 0.3764706, 1,
-0.1990615, 0.2412226, -2.288615, 0, 1, 0.3803922, 1,
-0.1984461, -0.1656134, -1.602189, 0, 1, 0.3882353, 1,
-0.1959093, 0.5326907, -0.7233028, 0, 1, 0.3921569, 1,
-0.1955401, 0.3789629, 1.150509, 0, 1, 0.4, 1,
-0.1916961, 0.5544042, -1.297157, 0, 1, 0.4078431, 1,
-0.1880216, 0.6416272, -1.936328, 0, 1, 0.4117647, 1,
-0.1769006, -1.174587, -3.807327, 0, 1, 0.4196078, 1,
-0.1746336, -0.2382545, -4.351387, 0, 1, 0.4235294, 1,
-0.1744036, 0.5906995, -0.5044832, 0, 1, 0.4313726, 1,
-0.1740282, 0.2988762, 0.7095175, 0, 1, 0.4352941, 1,
-0.1697602, 0.03916231, -0.1949938, 0, 1, 0.4431373, 1,
-0.1660333, 1.316247, 0.4083757, 0, 1, 0.4470588, 1,
-0.1647786, 0.1369148, -0.5649688, 0, 1, 0.454902, 1,
-0.1630528, 1.354676, 0.2155084, 0, 1, 0.4588235, 1,
-0.1629457, -0.57894, -1.621593, 0, 1, 0.4666667, 1,
-0.154335, 0.04226266, -0.7063231, 0, 1, 0.4705882, 1,
-0.1513991, -0.07059839, -3.614662, 0, 1, 0.4784314, 1,
-0.1487009, -0.9102364, -1.479771, 0, 1, 0.4823529, 1,
-0.1480612, 0.5547431, 0.7137879, 0, 1, 0.4901961, 1,
-0.1473239, 0.5985276, -0.602345, 0, 1, 0.4941176, 1,
-0.1391153, 0.05203892, -0.58146, 0, 1, 0.5019608, 1,
-0.1352303, -0.740347, -4.038758, 0, 1, 0.509804, 1,
-0.1265676, 1.442098, -1.287675, 0, 1, 0.5137255, 1,
-0.1247241, 0.1936212, -0.7696753, 0, 1, 0.5215687, 1,
-0.1231958, 0.9879045, 1.140275, 0, 1, 0.5254902, 1,
-0.1206811, -1.81181, -3.481435, 0, 1, 0.5333334, 1,
-0.1204798, -2.754185, -3.353523, 0, 1, 0.5372549, 1,
-0.1173897, 1.737035, -0.9979256, 0, 1, 0.5450981, 1,
-0.1167421, -1.293146, -2.947096, 0, 1, 0.5490196, 1,
-0.1160329, 1.560986, 0.07037257, 0, 1, 0.5568628, 1,
-0.1086905, 0.7498415, 1.373452, 0, 1, 0.5607843, 1,
-0.1073578, -1.101674, -4.314129, 0, 1, 0.5686275, 1,
-0.106558, -0.3250389, -3.915985, 0, 1, 0.572549, 1,
-0.1008202, -0.1603354, -4.222472, 0, 1, 0.5803922, 1,
-0.09102564, 0.3481928, 0.2730596, 0, 1, 0.5843138, 1,
-0.08842763, 0.3521184, -1.286278, 0, 1, 0.5921569, 1,
-0.08789694, 0.1125915, -2.135321, 0, 1, 0.5960785, 1,
-0.08472019, -0.9576941, -3.008504, 0, 1, 0.6039216, 1,
-0.08439267, 1.144861, -0.3823115, 0, 1, 0.6117647, 1,
-0.08298758, -0.8480323, -0.6709352, 0, 1, 0.6156863, 1,
-0.0820351, -0.1192448, -3.15606, 0, 1, 0.6235294, 1,
-0.07534319, 0.09558994, -0.7446938, 0, 1, 0.627451, 1,
-0.07528242, 1.952969, 1.46475, 0, 1, 0.6352941, 1,
-0.07351781, -0.0253023, -1.56007, 0, 1, 0.6392157, 1,
-0.07248325, -1.541284, -2.76322, 0, 1, 0.6470588, 1,
-0.07097889, -0.5272393, -2.322668, 0, 1, 0.6509804, 1,
-0.06888346, 0.2337843, -0.1157191, 0, 1, 0.6588235, 1,
-0.06886519, -1.557224, -3.589884, 0, 1, 0.6627451, 1,
-0.06708319, -0.08607676, -2.759134, 0, 1, 0.6705883, 1,
-0.05988769, 0.9540862, 0.7026569, 0, 1, 0.6745098, 1,
-0.05725877, 1.22909, 0.1377635, 0, 1, 0.682353, 1,
-0.05724579, 1.175177, 0.3728973, 0, 1, 0.6862745, 1,
-0.05625786, -1.09023, -1.07057, 0, 1, 0.6941177, 1,
-0.05483721, -0.7538823, -3.980949, 0, 1, 0.7019608, 1,
-0.05323873, 1.033038, 0.09443769, 0, 1, 0.7058824, 1,
-0.04970754, 0.3343088, -1.082619, 0, 1, 0.7137255, 1,
-0.04868701, -1.256558, -2.102935, 0, 1, 0.7176471, 1,
-0.04575193, 0.849717, -0.8127133, 0, 1, 0.7254902, 1,
-0.04485686, 0.1671412, -0.5574939, 0, 1, 0.7294118, 1,
-0.04447152, 0.9608374, 0.5798288, 0, 1, 0.7372549, 1,
-0.04398679, 0.8925806, 1.291986, 0, 1, 0.7411765, 1,
-0.04101607, -1.243767, -1.24751, 0, 1, 0.7490196, 1,
-0.0409129, 1.114601, 0.6598035, 0, 1, 0.7529412, 1,
-0.03863103, -0.1281124, -3.347194, 0, 1, 0.7607843, 1,
-0.03732126, -1.60857, -3.745159, 0, 1, 0.7647059, 1,
-0.03695208, -0.6853748, -2.449111, 0, 1, 0.772549, 1,
-0.03491643, -0.1349162, -1.886909, 0, 1, 0.7764706, 1,
-0.03244882, -1.001403, -3.910771, 0, 1, 0.7843137, 1,
-0.03214145, 0.656014, 1.638229, 0, 1, 0.7882353, 1,
-0.03011775, -0.05332637, -3.339083, 0, 1, 0.7960784, 1,
-0.02943848, -1.495285, -2.853405, 0, 1, 0.8039216, 1,
-0.02457008, -0.6035246, -4.789165, 0, 1, 0.8078431, 1,
-0.02078613, 0.2949648, -2.789001, 0, 1, 0.8156863, 1,
-0.01723053, -1.834771, -2.441908, 0, 1, 0.8196079, 1,
-0.01618886, 0.4532537, 0.1858758, 0, 1, 0.827451, 1,
-0.01041313, -0.4796919, -2.489884, 0, 1, 0.8313726, 1,
-0.009563218, 1.414465, -0.888198, 0, 1, 0.8392157, 1,
-0.009526944, 1.323971, -1.38466, 0, 1, 0.8431373, 1,
-0.006951001, 1.863195, 0.6341931, 0, 1, 0.8509804, 1,
-0.005857581, -0.2358218, -2.961762, 0, 1, 0.854902, 1,
-0.005340352, -1.087422, -3.783536, 0, 1, 0.8627451, 1,
-0.004173575, 2.202578, 0.2036737, 0, 1, 0.8666667, 1,
-0.002016241, -0.9308582, -4.103192, 0, 1, 0.8745098, 1,
-0.0008809683, -0.9596743, -6.074875, 0, 1, 0.8784314, 1,
0.00489236, 0.7598228, 0.6810538, 0, 1, 0.8862745, 1,
0.005841346, 0.9578897, -1.088694, 0, 1, 0.8901961, 1,
0.005966709, 0.3792943, -0.9612561, 0, 1, 0.8980392, 1,
0.01167226, -0.4459699, 3.669894, 0, 1, 0.9058824, 1,
0.01730498, 1.058545, -0.2952309, 0, 1, 0.9098039, 1,
0.02198727, -0.6500626, 3.745114, 0, 1, 0.9176471, 1,
0.02424746, -0.6179343, 3.449125, 0, 1, 0.9215686, 1,
0.02475355, 0.02244305, 0.2066453, 0, 1, 0.9294118, 1,
0.02714526, -1.747336, 2.495155, 0, 1, 0.9333333, 1,
0.03518932, 0.7284957, -1.212878, 0, 1, 0.9411765, 1,
0.0357152, -0.117952, 2.603897, 0, 1, 0.945098, 1,
0.03725355, -0.6332951, 2.563278, 0, 1, 0.9529412, 1,
0.03796753, -0.2422161, 3.491051, 0, 1, 0.9568627, 1,
0.04309438, -0.8639752, 2.358602, 0, 1, 0.9647059, 1,
0.04421202, 0.1987148, -0.1866679, 0, 1, 0.9686275, 1,
0.04457912, 0.8280811, 2.752084, 0, 1, 0.9764706, 1,
0.04698657, -1.307345, 2.311367, 0, 1, 0.9803922, 1,
0.04901556, 1.945214, -0.2279018, 0, 1, 0.9882353, 1,
0.05020613, -2.50409, 4.598372, 0, 1, 0.9921569, 1,
0.05069809, 1.971671, 0.5282999, 0, 1, 1, 1,
0.0524101, 1.55401, -2.705699, 0, 0.9921569, 1, 1,
0.05347601, 1.478809, 0.03595151, 0, 0.9882353, 1, 1,
0.05376454, 0.4820069, 0.09549512, 0, 0.9803922, 1, 1,
0.0543461, 0.6023468, 0.128248, 0, 0.9764706, 1, 1,
0.05725582, -1.240756, 2.892333, 0, 0.9686275, 1, 1,
0.06121448, 0.3114989, 0.3091103, 0, 0.9647059, 1, 1,
0.06538843, -0.219288, 2.695433, 0, 0.9568627, 1, 1,
0.06628572, -1.153832, 4.54158, 0, 0.9529412, 1, 1,
0.06648473, 0.2747166, -2.367353, 0, 0.945098, 1, 1,
0.06937481, 2.089751, 0.06517117, 0, 0.9411765, 1, 1,
0.07143854, 0.196708, 1.157736, 0, 0.9333333, 1, 1,
0.07223582, -0.3703789, 1.815601, 0, 0.9294118, 1, 1,
0.07610775, -1.012083, 3.897404, 0, 0.9215686, 1, 1,
0.07728606, 1.374851, 0.1399143, 0, 0.9176471, 1, 1,
0.07802845, -1.782208, 3.809659, 0, 0.9098039, 1, 1,
0.08317258, 0.1217955, 1.954468, 0, 0.9058824, 1, 1,
0.08377205, 0.1848553, 2.18018, 0, 0.8980392, 1, 1,
0.08436944, -0.3690206, 2.152891, 0, 0.8901961, 1, 1,
0.0908277, 0.228986, 0.3261515, 0, 0.8862745, 1, 1,
0.0909684, -1.786597, 2.479139, 0, 0.8784314, 1, 1,
0.0910522, 1.023203, -0.6895028, 0, 0.8745098, 1, 1,
0.09363897, 1.124304, -1.271094, 0, 0.8666667, 1, 1,
0.09836227, 0.3828768, -0.8484437, 0, 0.8627451, 1, 1,
0.09880596, 0.263623, -1.40669, 0, 0.854902, 1, 1,
0.09890365, -0.9605659, 2.770625, 0, 0.8509804, 1, 1,
0.09966403, 0.3520593, 1.088326, 0, 0.8431373, 1, 1,
0.09987985, 0.9704956, 0.6239462, 0, 0.8392157, 1, 1,
0.1042919, 0.8190446, -0.8322824, 0, 0.8313726, 1, 1,
0.1049481, 0.8886625, 0.3746623, 0, 0.827451, 1, 1,
0.106109, 0.9808119, 0.1713196, 0, 0.8196079, 1, 1,
0.1132661, 0.2264854, 0.8187894, 0, 0.8156863, 1, 1,
0.1138695, 0.4021419, 0.8013585, 0, 0.8078431, 1, 1,
0.1182737, -0.4455581, 2.526655, 0, 0.8039216, 1, 1,
0.1193652, -0.4989031, 4.192263, 0, 0.7960784, 1, 1,
0.1227339, -0.01547403, 0.9033194, 0, 0.7882353, 1, 1,
0.1249451, -1.738768, 2.866503, 0, 0.7843137, 1, 1,
0.1264254, -1.59234, 2.325912, 0, 0.7764706, 1, 1,
0.1272796, -0.2315484, 3.896574, 0, 0.772549, 1, 1,
0.1284576, 0.3992957, 0.495732, 0, 0.7647059, 1, 1,
0.1313266, 0.8331847, 0.911303, 0, 0.7607843, 1, 1,
0.136893, 0.02205831, 2.546198, 0, 0.7529412, 1, 1,
0.1388483, -1.175028, 1.562729, 0, 0.7490196, 1, 1,
0.1392366, -0.9632449, 2.827578, 0, 0.7411765, 1, 1,
0.1400572, -0.3044983, 3.13882, 0, 0.7372549, 1, 1,
0.147734, -0.7329192, 1.294849, 0, 0.7294118, 1, 1,
0.1490594, -0.3798604, 1.060771, 0, 0.7254902, 1, 1,
0.1507042, 0.9427002, -1.54117, 0, 0.7176471, 1, 1,
0.1541992, -0.9921949, 2.10265, 0, 0.7137255, 1, 1,
0.1566008, 1.784171, 0.3695569, 0, 0.7058824, 1, 1,
0.1601102, -0.8162494, 2.597828, 0, 0.6980392, 1, 1,
0.1611237, 0.777748, -1.134492, 0, 0.6941177, 1, 1,
0.1611299, 0.07609829, 1.905515, 0, 0.6862745, 1, 1,
0.1612066, -0.2688315, 2.557214, 0, 0.682353, 1, 1,
0.1627337, 0.377837, 0.7771354, 0, 0.6745098, 1, 1,
0.1645323, -0.9972247, 4.778819, 0, 0.6705883, 1, 1,
0.1672127, 0.6744593, 0.9616001, 0, 0.6627451, 1, 1,
0.1684509, 0.7964527, 0.6359739, 0, 0.6588235, 1, 1,
0.1714376, 1.321515, 0.1990286, 0, 0.6509804, 1, 1,
0.1725691, -1.57505, 3.027986, 0, 0.6470588, 1, 1,
0.1732565, -0.1624997, 3.488403, 0, 0.6392157, 1, 1,
0.1777766, -1.417348, 3.155523, 0, 0.6352941, 1, 1,
0.1787887, -0.3921334, 3.673585, 0, 0.627451, 1, 1,
0.1823223, -2.190964, 3.078899, 0, 0.6235294, 1, 1,
0.1865547, -1.169459, 3.419681, 0, 0.6156863, 1, 1,
0.1891778, 1.698231, 0.3033728, 0, 0.6117647, 1, 1,
0.1926647, -0.4313929, 1.876459, 0, 0.6039216, 1, 1,
0.2043935, 0.7021186, 0.1768571, 0, 0.5960785, 1, 1,
0.2053157, -0.7346362, 2.121874, 0, 0.5921569, 1, 1,
0.2061323, 2.283345, 2.075476, 0, 0.5843138, 1, 1,
0.2064055, 0.4961777, 0.3193599, 0, 0.5803922, 1, 1,
0.2066089, -0.4083334, 2.393923, 0, 0.572549, 1, 1,
0.2104205, 1.109911, 2.073325, 0, 0.5686275, 1, 1,
0.2130181, 0.3488617, 1.527901, 0, 0.5607843, 1, 1,
0.2153752, 1.544035, 0.1398652, 0, 0.5568628, 1, 1,
0.2156316, 0.1372285, -0.3790549, 0, 0.5490196, 1, 1,
0.2165943, -0.1935923, 2.48177, 0, 0.5450981, 1, 1,
0.2179957, -0.9517161, 3.513477, 0, 0.5372549, 1, 1,
0.2186515, 0.9392824, -1.101215, 0, 0.5333334, 1, 1,
0.2222163, -1.594278, 2.850822, 0, 0.5254902, 1, 1,
0.2231845, 1.187715, 0.7025127, 0, 0.5215687, 1, 1,
0.2257516, 1.382218, -0.7776915, 0, 0.5137255, 1, 1,
0.2262391, 0.1987046, 0.5723683, 0, 0.509804, 1, 1,
0.2265056, -0.113838, 2.925299, 0, 0.5019608, 1, 1,
0.231363, -0.08061382, 1.021636, 0, 0.4941176, 1, 1,
0.232769, -0.5063672, 2.627043, 0, 0.4901961, 1, 1,
0.2351617, 2.013183, -0.1217527, 0, 0.4823529, 1, 1,
0.2396925, -0.2960846, 4.654674, 0, 0.4784314, 1, 1,
0.2421962, -2.361823, 4.0522, 0, 0.4705882, 1, 1,
0.2425892, -1.74831, 3.611104, 0, 0.4666667, 1, 1,
0.2428782, -0.9928551, 3.321333, 0, 0.4588235, 1, 1,
0.2437989, -0.242753, 1.823971, 0, 0.454902, 1, 1,
0.2465064, 0.08322035, 2.384896, 0, 0.4470588, 1, 1,
0.2494255, 0.6979005, 0.8239844, 0, 0.4431373, 1, 1,
0.2498852, 1.200533, -0.6830178, 0, 0.4352941, 1, 1,
0.2535752, -0.9793591, 2.720438, 0, 0.4313726, 1, 1,
0.2547479, 1.003836, -1.310655, 0, 0.4235294, 1, 1,
0.2552983, 0.1571302, 0.7335359, 0, 0.4196078, 1, 1,
0.2556017, 0.4798421, 0.176365, 0, 0.4117647, 1, 1,
0.2589486, 1.714362, -1.433325, 0, 0.4078431, 1, 1,
0.2610657, 1.457226, -0.3028339, 0, 0.4, 1, 1,
0.2670458, 0.4078695, 0.01037627, 0, 0.3921569, 1, 1,
0.2693489, 0.8736978, 0.4562243, 0, 0.3882353, 1, 1,
0.269355, -1.758619, 4.011511, 0, 0.3803922, 1, 1,
0.2814579, -2.583004, 3.591104, 0, 0.3764706, 1, 1,
0.2817284, 0.9791638, -0.1433261, 0, 0.3686275, 1, 1,
0.2881505, -0.1493764, 2.741341, 0, 0.3647059, 1, 1,
0.2892044, 0.07520507, 1.356773, 0, 0.3568628, 1, 1,
0.2921503, 0.5036084, -0.9176136, 0, 0.3529412, 1, 1,
0.2926881, 0.1607778, 2.76251, 0, 0.345098, 1, 1,
0.2927981, 2.48477, -1.88629, 0, 0.3411765, 1, 1,
0.2940697, -0.648981, 2.833035, 0, 0.3333333, 1, 1,
0.2971763, 2.348535, 0.06662463, 0, 0.3294118, 1, 1,
0.2987289, -1.979138, 2.982339, 0, 0.3215686, 1, 1,
0.2995129, -0.2118105, 2.172834, 0, 0.3176471, 1, 1,
0.2995778, -1.412594, 4.012379, 0, 0.3098039, 1, 1,
0.300992, -0.5402594, 1.798045, 0, 0.3058824, 1, 1,
0.3032415, 0.9198229, 0.8918368, 0, 0.2980392, 1, 1,
0.3045897, 1.243281, 0.1588785, 0, 0.2901961, 1, 1,
0.306604, -0.2630182, 1.540086, 0, 0.2862745, 1, 1,
0.3091152, -0.04004031, 0.1338162, 0, 0.2784314, 1, 1,
0.3094202, 1.248634, 0.6672654, 0, 0.2745098, 1, 1,
0.3126493, -0.169009, 2.103666, 0, 0.2666667, 1, 1,
0.313988, 1.508471, 0.4890217, 0, 0.2627451, 1, 1,
0.3173424, 0.8608265, 0.81407, 0, 0.254902, 1, 1,
0.3290328, -1.191177, 1.242678, 0, 0.2509804, 1, 1,
0.3292693, 1.639813, -1.06269, 0, 0.2431373, 1, 1,
0.3311799, -0.7226946, 4.548948, 0, 0.2392157, 1, 1,
0.337189, 1.242372, 0.1481779, 0, 0.2313726, 1, 1,
0.3380628, -1.436803, 3.294827, 0, 0.227451, 1, 1,
0.3384564, 0.5002656, 0.4215563, 0, 0.2196078, 1, 1,
0.3387685, 0.9362524, -0.8916257, 0, 0.2156863, 1, 1,
0.3393638, -1.367351, 3.469818, 0, 0.2078431, 1, 1,
0.3429512, 0.3065519, 0.6829639, 0, 0.2039216, 1, 1,
0.3442707, 0.7592473, 2.485886, 0, 0.1960784, 1, 1,
0.3459725, -1.341626, 3.207329, 0, 0.1882353, 1, 1,
0.3468659, 0.03521355, 0.4620675, 0, 0.1843137, 1, 1,
0.3500024, 0.1253605, 2.120105, 0, 0.1764706, 1, 1,
0.3502624, 0.5343862, 0.2642873, 0, 0.172549, 1, 1,
0.3510697, 1.538792, 0.9169438, 0, 0.1647059, 1, 1,
0.3519821, 0.7972251, -1.146767, 0, 0.1607843, 1, 1,
0.352217, -1.363757, 3.98307, 0, 0.1529412, 1, 1,
0.3547727, -0.5585964, 2.871321, 0, 0.1490196, 1, 1,
0.3592152, 0.03629421, 0.6826239, 0, 0.1411765, 1, 1,
0.3593258, -0.9497604, 4.552167, 0, 0.1372549, 1, 1,
0.360132, -0.6119991, 2.442593, 0, 0.1294118, 1, 1,
0.3612594, 1.289286, 1.163358, 0, 0.1254902, 1, 1,
0.3676045, -1.189652, 3.537539, 0, 0.1176471, 1, 1,
0.3703601, 0.4430312, -0.9610569, 0, 0.1137255, 1, 1,
0.371675, 0.7367907, -0.542264, 0, 0.1058824, 1, 1,
0.377695, -1.582384, 1.339511, 0, 0.09803922, 1, 1,
0.3778539, -0.8565131, 2.965491, 0, 0.09411765, 1, 1,
0.3783462, 1.426101, -0.6147761, 0, 0.08627451, 1, 1,
0.3802352, -0.1740152, 0.8876076, 0, 0.08235294, 1, 1,
0.3812971, 0.0600103, 1.7737, 0, 0.07450981, 1, 1,
0.3890296, -1.890597, 3.954212, 0, 0.07058824, 1, 1,
0.3891329, -0.6855956, 3.117283, 0, 0.0627451, 1, 1,
0.391104, 0.5706351, 0.5892711, 0, 0.05882353, 1, 1,
0.3936213, 1.483864, -0.303954, 0, 0.05098039, 1, 1,
0.4009808, -0.1272114, 1.198981, 0, 0.04705882, 1, 1,
0.4023959, 1.480367, -0.136381, 0, 0.03921569, 1, 1,
0.405227, 0.5770938, 2.192929, 0, 0.03529412, 1, 1,
0.4081759, 1.521133, -0.1822058, 0, 0.02745098, 1, 1,
0.4107578, 1.1953, -0.444494, 0, 0.02352941, 1, 1,
0.4116535, 1.049163, 0.7643179, 0, 0.01568628, 1, 1,
0.4163559, -1.156551, 3.437767, 0, 0.01176471, 1, 1,
0.4224564, 1.792206, -0.3707707, 0, 0.003921569, 1, 1,
0.4234213, 0.5706373, 1.669993, 0.003921569, 0, 1, 1,
0.4275057, -0.6547927, 3.17146, 0.007843138, 0, 1, 1,
0.428586, -0.8514552, 1.525275, 0.01568628, 0, 1, 1,
0.4312312, -0.5303932, 3.610869, 0.01960784, 0, 1, 1,
0.4314712, 0.7834945, 0.5297799, 0.02745098, 0, 1, 1,
0.442716, 1.09278, 0.9678296, 0.03137255, 0, 1, 1,
0.4429307, -0.5999776, 1.266982, 0.03921569, 0, 1, 1,
0.4434462, 0.2829801, -0.3150808, 0.04313726, 0, 1, 1,
0.4466021, 1.4675, 3.908938, 0.05098039, 0, 1, 1,
0.4484031, -0.5182267, 2.021911, 0.05490196, 0, 1, 1,
0.4516684, 0.03029525, 1.428779, 0.0627451, 0, 1, 1,
0.4518386, 0.3594461, 0.9045897, 0.06666667, 0, 1, 1,
0.4522437, 0.9374566, 0.2907979, 0.07450981, 0, 1, 1,
0.4526097, 0.5404512, 1.420685, 0.07843138, 0, 1, 1,
0.4604628, 0.1411431, 2.415208, 0.08627451, 0, 1, 1,
0.4641265, -0.08573288, 0.7580702, 0.09019608, 0, 1, 1,
0.4647612, -0.07791654, 2.65367, 0.09803922, 0, 1, 1,
0.4681741, -0.896098, 1.791247, 0.1058824, 0, 1, 1,
0.4715238, -0.2317077, 1.943426, 0.1098039, 0, 1, 1,
0.4757055, 1.748886, 1.495372, 0.1176471, 0, 1, 1,
0.4778215, 0.4334853, 0.7005705, 0.1215686, 0, 1, 1,
0.4796553, 1.246064, -1.142467, 0.1294118, 0, 1, 1,
0.4808799, -0.2157266, 1.559028, 0.1333333, 0, 1, 1,
0.4820956, -0.6178659, 4.074297, 0.1411765, 0, 1, 1,
0.4825257, -0.8523706, 1.738151, 0.145098, 0, 1, 1,
0.48402, -0.2571778, 3.215074, 0.1529412, 0, 1, 1,
0.484659, -0.0404571, 1.538073, 0.1568628, 0, 1, 1,
0.4870197, -0.6107612, 3.081409, 0.1647059, 0, 1, 1,
0.4898873, 0.3378775, 3.190768, 0.1686275, 0, 1, 1,
0.4909572, -0.5334942, 0.7383382, 0.1764706, 0, 1, 1,
0.4941915, -0.6993581, 2.934406, 0.1803922, 0, 1, 1,
0.4981204, -0.2244985, 1.979286, 0.1882353, 0, 1, 1,
0.5018649, 1.4528, -1.077955, 0.1921569, 0, 1, 1,
0.5080271, 0.3585479, 1.230303, 0.2, 0, 1, 1,
0.5082182, 0.1405428, 0.8058038, 0.2078431, 0, 1, 1,
0.509591, -1.26494, 2.276145, 0.2117647, 0, 1, 1,
0.5155613, -1.138008, 2.885936, 0.2196078, 0, 1, 1,
0.5160423, 0.2297778, 0.2045419, 0.2235294, 0, 1, 1,
0.5170516, 0.7929989, 0.7863167, 0.2313726, 0, 1, 1,
0.5198446, 1.427844, -0.5526432, 0.2352941, 0, 1, 1,
0.5207661, 0.1953381, 1.766785, 0.2431373, 0, 1, 1,
0.5215784, -0.7305241, 2.065984, 0.2470588, 0, 1, 1,
0.5314177, 0.7754491, 0.04999981, 0.254902, 0, 1, 1,
0.5314478, 0.3037179, 1.556963, 0.2588235, 0, 1, 1,
0.5338079, 1.116292, -1.899306, 0.2666667, 0, 1, 1,
0.5350457, 0.7057967, 0.6262852, 0.2705882, 0, 1, 1,
0.5366488, -0.2781634, 1.651607, 0.2784314, 0, 1, 1,
0.5409793, 0.1301305, 1.352506, 0.282353, 0, 1, 1,
0.542199, 0.7414144, 0.7316316, 0.2901961, 0, 1, 1,
0.5436146, 0.4956462, -0.3107421, 0.2941177, 0, 1, 1,
0.5454366, 0.1605715, 1.8055, 0.3019608, 0, 1, 1,
0.5462521, -0.02535594, 1.218457, 0.3098039, 0, 1, 1,
0.5482674, -0.1180795, 3.491788, 0.3137255, 0, 1, 1,
0.5503323, 0.8156859, 0.4697818, 0.3215686, 0, 1, 1,
0.5518675, -0.07668249, 1.771559, 0.3254902, 0, 1, 1,
0.5645707, 0.0833364, 2.167379, 0.3333333, 0, 1, 1,
0.5651512, -0.7853991, 1.408223, 0.3372549, 0, 1, 1,
0.5719355, 0.8982893, -1.423647, 0.345098, 0, 1, 1,
0.5719666, 0.8158157, 0.8160248, 0.3490196, 0, 1, 1,
0.5720217, -1.613434, 3.212149, 0.3568628, 0, 1, 1,
0.5739155, 0.4294511, 1.280199, 0.3607843, 0, 1, 1,
0.5742548, 0.142684, 1.127031, 0.3686275, 0, 1, 1,
0.589491, -0.00801251, 0.4992273, 0.372549, 0, 1, 1,
0.5935242, -0.1137674, 3.068593, 0.3803922, 0, 1, 1,
0.6024947, -1.432829, 2.135716, 0.3843137, 0, 1, 1,
0.6025035, -0.8452964, 2.787458, 0.3921569, 0, 1, 1,
0.6054835, 0.6906767, -0.9501483, 0.3960784, 0, 1, 1,
0.6074464, -1.30983, 3.008889, 0.4039216, 0, 1, 1,
0.6076455, 0.3571045, -0.64338, 0.4117647, 0, 1, 1,
0.6127393, -1.741202, 2.969423, 0.4156863, 0, 1, 1,
0.6171651, -0.8524094, 1.982791, 0.4235294, 0, 1, 1,
0.6172783, -0.02301137, 3.228026, 0.427451, 0, 1, 1,
0.6174375, 0.4880778, 0.330645, 0.4352941, 0, 1, 1,
0.6241943, -1.273465, 3.223942, 0.4392157, 0, 1, 1,
0.6256367, 0.4060724, 2.81038, 0.4470588, 0, 1, 1,
0.6323177, 0.8338287, 0.9587523, 0.4509804, 0, 1, 1,
0.6368992, -1.069979, 2.864412, 0.4588235, 0, 1, 1,
0.6384056, -1.549447, 3.392019, 0.4627451, 0, 1, 1,
0.6400138, 0.5136614, -0.546352, 0.4705882, 0, 1, 1,
0.6400785, -0.5114069, 2.67738, 0.4745098, 0, 1, 1,
0.6498824, 0.8042041, 0.8801355, 0.4823529, 0, 1, 1,
0.6524161, -0.5234206, 3.855379, 0.4862745, 0, 1, 1,
0.6574124, 0.4181828, 0.5702829, 0.4941176, 0, 1, 1,
0.6632259, 0.475541, 0.8268952, 0.5019608, 0, 1, 1,
0.6689206, -2.559474, 2.197925, 0.5058824, 0, 1, 1,
0.6704425, -0.7213272, 1.997823, 0.5137255, 0, 1, 1,
0.6764416, -0.6954371, 2.380661, 0.5176471, 0, 1, 1,
0.6825244, 1.087506, -0.04149451, 0.5254902, 0, 1, 1,
0.683541, -0.09489334, 1.947515, 0.5294118, 0, 1, 1,
0.6862171, 0.6661773, 1.891932, 0.5372549, 0, 1, 1,
0.6899124, -1.158806, 2.117802, 0.5411765, 0, 1, 1,
0.6899684, -2.226631, 2.349548, 0.5490196, 0, 1, 1,
0.6939004, 0.4768525, -0.3903084, 0.5529412, 0, 1, 1,
0.6959791, 1.040845, 0.5026134, 0.5607843, 0, 1, 1,
0.6971623, -0.4779836, 1.329226, 0.5647059, 0, 1, 1,
0.6980883, 1.439823, 1.739935, 0.572549, 0, 1, 1,
0.699305, -0.6993968, 1.356879, 0.5764706, 0, 1, 1,
0.6999912, 2.010459, 0.05802654, 0.5843138, 0, 1, 1,
0.7014777, -0.2807056, 1.73368, 0.5882353, 0, 1, 1,
0.7040392, 0.3829858, 1.073116, 0.5960785, 0, 1, 1,
0.7153101, -1.502364, 0.3534631, 0.6039216, 0, 1, 1,
0.7268026, 0.8939208, 0.4793395, 0.6078432, 0, 1, 1,
0.7332662, 0.1637994, 1.283235, 0.6156863, 0, 1, 1,
0.7365922, -1.11913, 3.843807, 0.6196079, 0, 1, 1,
0.7386363, 1.628016, 0.7437951, 0.627451, 0, 1, 1,
0.7401305, 1.454803, 1.707001, 0.6313726, 0, 1, 1,
0.7430171, 0.8786963, 3.230325, 0.6392157, 0, 1, 1,
0.743786, -1.067139, 1.959006, 0.6431373, 0, 1, 1,
0.7463974, 0.2388677, 1.765967, 0.6509804, 0, 1, 1,
0.7516194, 0.3597688, 1.277533, 0.654902, 0, 1, 1,
0.7517717, 0.5969579, 0.625295, 0.6627451, 0, 1, 1,
0.7570562, -1.409052, 3.165639, 0.6666667, 0, 1, 1,
0.7598786, -0.06051601, -0.5820221, 0.6745098, 0, 1, 1,
0.7711003, 1.170199, 0.6622407, 0.6784314, 0, 1, 1,
0.7718251, 0.5945833, 0.1606754, 0.6862745, 0, 1, 1,
0.774076, -0.3034403, 1.530401, 0.6901961, 0, 1, 1,
0.7773636, 0.7352466, 1.162592, 0.6980392, 0, 1, 1,
0.7775482, -1.432102, 3.289657, 0.7058824, 0, 1, 1,
0.7780241, 0.7556185, 0.7035147, 0.7098039, 0, 1, 1,
0.7808021, 1.139013, -0.6004408, 0.7176471, 0, 1, 1,
0.7834286, -1.014715, 2.965266, 0.7215686, 0, 1, 1,
0.7841905, 0.7105541, 1.625253, 0.7294118, 0, 1, 1,
0.7869749, 1.033285, 0.7248223, 0.7333333, 0, 1, 1,
0.7882468, -1.493659, 2.864952, 0.7411765, 0, 1, 1,
0.7931725, -0.5355774, 0.4852761, 0.7450981, 0, 1, 1,
0.7970852, 0.7692598, 1.203977, 0.7529412, 0, 1, 1,
0.7982933, -1.312164, 2.58831, 0.7568628, 0, 1, 1,
0.8024734, 0.4959486, 1.483395, 0.7647059, 0, 1, 1,
0.8036187, 0.8312199, 0.3136339, 0.7686275, 0, 1, 1,
0.8058037, -0.1420121, 0.719126, 0.7764706, 0, 1, 1,
0.8088555, 1.782922, 0.5563355, 0.7803922, 0, 1, 1,
0.8102511, 0.5784821, 1.69651, 0.7882353, 0, 1, 1,
0.8109788, 0.7542281, 1.826518, 0.7921569, 0, 1, 1,
0.8141004, -0.9190186, 0.8502733, 0.8, 0, 1, 1,
0.8159367, 0.9688437, 0.7881088, 0.8078431, 0, 1, 1,
0.8213838, 1.530401, -0.3643495, 0.8117647, 0, 1, 1,
0.8224838, 1.710262, -1.199812, 0.8196079, 0, 1, 1,
0.8270381, 0.3978886, 2.588528, 0.8235294, 0, 1, 1,
0.8372412, -0.2255926, 0.3394333, 0.8313726, 0, 1, 1,
0.8441699, 1.146932, 1.738674, 0.8352941, 0, 1, 1,
0.8470404, 0.89064, 1.332919, 0.8431373, 0, 1, 1,
0.8535027, -0.2528342, 0.2914486, 0.8470588, 0, 1, 1,
0.8539913, 0.0731492, 2.805992, 0.854902, 0, 1, 1,
0.8554811, 1.132021, 2.478616, 0.8588235, 0, 1, 1,
0.8581224, 0.1371368, 0.7029804, 0.8666667, 0, 1, 1,
0.8608624, 1.155746, -1.142752, 0.8705882, 0, 1, 1,
0.8670791, 0.6789083, 0.02510698, 0.8784314, 0, 1, 1,
0.8678057, -0.09744746, 0.8243085, 0.8823529, 0, 1, 1,
0.8697114, 0.8113369, 0.9858974, 0.8901961, 0, 1, 1,
0.8741965, 0.5415663, 1.896986, 0.8941177, 0, 1, 1,
0.8806822, -1.916524, 3.778342, 0.9019608, 0, 1, 1,
0.8814886, -1.616983, 1.076623, 0.9098039, 0, 1, 1,
0.8826371, -0.2363933, 1.425268, 0.9137255, 0, 1, 1,
0.8957891, -1.43488, 2.76726, 0.9215686, 0, 1, 1,
0.8959911, -1.288, 2.7943, 0.9254902, 0, 1, 1,
0.9059807, 0.3371812, 2.18364, 0.9333333, 0, 1, 1,
0.9073731, -0.2830407, 2.355634, 0.9372549, 0, 1, 1,
0.9094557, 0.5793269, 1.747416, 0.945098, 0, 1, 1,
0.9095291, 0.05154506, 3.349217, 0.9490196, 0, 1, 1,
0.9106725, -0.1366313, 2.433242, 0.9568627, 0, 1, 1,
0.9108075, -1.073692, 1.339604, 0.9607843, 0, 1, 1,
0.9111645, 0.5239256, 1.50612, 0.9686275, 0, 1, 1,
0.9200548, -0.8043332, 2.857876, 0.972549, 0, 1, 1,
0.9206885, -0.6714452, 2.001969, 0.9803922, 0, 1, 1,
0.9228699, 0.9674577, 2.403743, 0.9843137, 0, 1, 1,
0.9258937, 1.197091, -0.09053804, 0.9921569, 0, 1, 1,
0.9297866, -0.2506503, 2.68918, 0.9960784, 0, 1, 1,
0.9316107, -0.7986553, 4.490188, 1, 0, 0.9960784, 1,
0.9320677, -1.031387, 3.002938, 1, 0, 0.9882353, 1,
0.9342888, 0.3958407, 0.9195134, 1, 0, 0.9843137, 1,
0.9421825, 1.005925, 1.589242, 1, 0, 0.9764706, 1,
0.9474574, -0.3071543, 1.842777, 1, 0, 0.972549, 1,
0.9503043, 0.4226791, 1.2057, 1, 0, 0.9647059, 1,
0.9518725, -1.31929, 0.4291589, 1, 0, 0.9607843, 1,
0.9585412, 0.2144481, 1.498412, 1, 0, 0.9529412, 1,
0.9661332, 1.185291, 0.8932071, 1, 0, 0.9490196, 1,
0.9673479, -0.0657444, 2.639197, 1, 0, 0.9411765, 1,
0.9698882, -2.750761, 3.191244, 1, 0, 0.9372549, 1,
0.9720117, -0.8435002, 2.845166, 1, 0, 0.9294118, 1,
0.9767005, 0.432798, 0.4393303, 1, 0, 0.9254902, 1,
0.9777593, 1.176969, -0.3302409, 1, 0, 0.9176471, 1,
0.983509, -0.5465195, 1.270026, 1, 0, 0.9137255, 1,
0.9854881, 0.2476077, 2.515377, 1, 0, 0.9058824, 1,
0.9938199, -1.90805, 1.382161, 1, 0, 0.9019608, 1,
0.996187, -1.136974, 2.335768, 1, 0, 0.8941177, 1,
0.9995104, -0.7284927, 0.4532954, 1, 0, 0.8862745, 1,
0.9995871, -3.179496, 0.9442165, 1, 0, 0.8823529, 1,
1.00094, -0.5615642, 0.1432446, 1, 0, 0.8745098, 1,
1.003777, 1.057745, -0.5722063, 1, 0, 0.8705882, 1,
1.009847, 1.400747, 0.780826, 1, 0, 0.8627451, 1,
1.010694, -0.7676763, 2.253711, 1, 0, 0.8588235, 1,
1.013692, -0.3177546, 1.548115, 1, 0, 0.8509804, 1,
1.019397, -0.1217987, 1.979523, 1, 0, 0.8470588, 1,
1.019434, 0.04936821, -0.08007772, 1, 0, 0.8392157, 1,
1.020272, 0.1050311, 2.187094, 1, 0, 0.8352941, 1,
1.025193, -0.3212187, 1.941258, 1, 0, 0.827451, 1,
1.031795, 1.3138, -0.4252287, 1, 0, 0.8235294, 1,
1.037701, 0.7119865, 3.148932, 1, 0, 0.8156863, 1,
1.040395, -0.1706851, 1.827464, 1, 0, 0.8117647, 1,
1.040762, -0.9956328, 3.116567, 1, 0, 0.8039216, 1,
1.041694, 0.4180016, 0.01191751, 1, 0, 0.7960784, 1,
1.046494, -0.2684761, 0.3358727, 1, 0, 0.7921569, 1,
1.048706, 0.3726748, 2.237771, 1, 0, 0.7843137, 1,
1.049876, -1.158952, 2.550583, 1, 0, 0.7803922, 1,
1.052676, 0.9332677, 0.8780819, 1, 0, 0.772549, 1,
1.063175, -1.562578, 1.601975, 1, 0, 0.7686275, 1,
1.066364, 0.1666826, 0.4203789, 1, 0, 0.7607843, 1,
1.06659, 2.81056, -0.2350064, 1, 0, 0.7568628, 1,
1.066645, 0.1158998, 2.389046, 1, 0, 0.7490196, 1,
1.067977, -0.1253215, 3.449004, 1, 0, 0.7450981, 1,
1.071955, 1.486698, -0.4609464, 1, 0, 0.7372549, 1,
1.072994, -0.7549114, 2.667029, 1, 0, 0.7333333, 1,
1.07573, 0.1023718, 0.8320472, 1, 0, 0.7254902, 1,
1.083391, 1.256272, 0.7583224, 1, 0, 0.7215686, 1,
1.08926, -0.8372117, 3.675858, 1, 0, 0.7137255, 1,
1.104308, -0.2090844, 1.247099, 1, 0, 0.7098039, 1,
1.106034, -0.7867573, 3.702206, 1, 0, 0.7019608, 1,
1.111635, 0.8926213, 1.84233, 1, 0, 0.6941177, 1,
1.117461, 1.855096, 1.257746, 1, 0, 0.6901961, 1,
1.117547, 0.7244205, 0.5277084, 1, 0, 0.682353, 1,
1.118383, -0.7976171, 2.047591, 1, 0, 0.6784314, 1,
1.120043, -0.7034093, 3.380159, 1, 0, 0.6705883, 1,
1.122548, 0.9342951, 1.004416, 1, 0, 0.6666667, 1,
1.132867, 0.4549166, 2.321359, 1, 0, 0.6588235, 1,
1.138119, 1.083857, 3.351145, 1, 0, 0.654902, 1,
1.14815, 0.02940172, 1.457303, 1, 0, 0.6470588, 1,
1.157264, -2.244582, 2.910733, 1, 0, 0.6431373, 1,
1.166957, -0.2428599, 0.809268, 1, 0, 0.6352941, 1,
1.16738, 0.8630335, 2.120416, 1, 0, 0.6313726, 1,
1.175248, -2.635601, 1.385114, 1, 0, 0.6235294, 1,
1.181216, -1.356541, 1.139419, 1, 0, 0.6196079, 1,
1.181407, -1.569044, 3.286095, 1, 0, 0.6117647, 1,
1.182813, 0.4895693, 0.08386299, 1, 0, 0.6078432, 1,
1.185261, 0.4291615, 0.07330719, 1, 0, 0.6, 1,
1.185493, 0.5681037, 0.903973, 1, 0, 0.5921569, 1,
1.192462, -2.076257, 0.8450437, 1, 0, 0.5882353, 1,
1.192904, -0.2934819, 1.738743, 1, 0, 0.5803922, 1,
1.193225, 0.4014975, 0.8081796, 1, 0, 0.5764706, 1,
1.197239, -0.2746551, 2.208676, 1, 0, 0.5686275, 1,
1.201269, 1.181825, 0.1801601, 1, 0, 0.5647059, 1,
1.21707, -1.054021, 2.072494, 1, 0, 0.5568628, 1,
1.224835, 1.599131, 0.1696082, 1, 0, 0.5529412, 1,
1.234457, 0.8172675, -0.6635388, 1, 0, 0.5450981, 1,
1.241176, -0.2210681, 2.63049, 1, 0, 0.5411765, 1,
1.243115, -0.1848426, 1.742232, 1, 0, 0.5333334, 1,
1.249708, -1.417905, 2.65994, 1, 0, 0.5294118, 1,
1.25642, 0.3599671, 0.5198871, 1, 0, 0.5215687, 1,
1.27147, 1.123337, 0.2075998, 1, 0, 0.5176471, 1,
1.277053, 0.9760246, 2.767726, 1, 0, 0.509804, 1,
1.280205, 0.7995745, 2.056329, 1, 0, 0.5058824, 1,
1.28292, -0.1129311, 2.632495, 1, 0, 0.4980392, 1,
1.285118, -0.4051771, 2.260031, 1, 0, 0.4901961, 1,
1.299509, -0.6353428, 3.014563, 1, 0, 0.4862745, 1,
1.300431, 0.6624581, 1.72625, 1, 0, 0.4784314, 1,
1.30729, -0.885291, 2.712387, 1, 0, 0.4745098, 1,
1.317232, 0.333564, 1.626624, 1, 0, 0.4666667, 1,
1.317311, 0.4422897, 0.7816495, 1, 0, 0.4627451, 1,
1.334789, -0.6820863, 3.430287, 1, 0, 0.454902, 1,
1.336375, 1.049524, 1.436521, 1, 0, 0.4509804, 1,
1.340495, -0.4178421, 2.646516, 1, 0, 0.4431373, 1,
1.359684, 0.3552772, 1.176077, 1, 0, 0.4392157, 1,
1.363551, -1.019809, 0.8804017, 1, 0, 0.4313726, 1,
1.366745, 0.5330811, 2.678644, 1, 0, 0.427451, 1,
1.367931, -0.3387374, 1.73911, 1, 0, 0.4196078, 1,
1.371872, 2.148757, -0.5215082, 1, 0, 0.4156863, 1,
1.373766, -0.3776161, 2.2357, 1, 0, 0.4078431, 1,
1.376148, 2.746623, 0.4647291, 1, 0, 0.4039216, 1,
1.380726, 0.9302639, -1.074972, 1, 0, 0.3960784, 1,
1.387824, 0.391151, 0.696012, 1, 0, 0.3882353, 1,
1.396211, -1.489287, 1.969093, 1, 0, 0.3843137, 1,
1.400047, 1.265762, 0.1695103, 1, 0, 0.3764706, 1,
1.413002, 1.277235, 0.4360427, 1, 0, 0.372549, 1,
1.423742, 1.363149, 0.07592648, 1, 0, 0.3647059, 1,
1.426471, -1.034689, 2.86277, 1, 0, 0.3607843, 1,
1.429783, 0.1811124, 3.219744, 1, 0, 0.3529412, 1,
1.431449, -0.6042649, 1.188654, 1, 0, 0.3490196, 1,
1.441945, 0.5243922, 0.4725494, 1, 0, 0.3411765, 1,
1.459473, -0.6978527, 2.713361, 1, 0, 0.3372549, 1,
1.462786, 0.2008924, 0.5423291, 1, 0, 0.3294118, 1,
1.472316, -0.4292617, 1.990811, 1, 0, 0.3254902, 1,
1.493523, 0.5679763, 1.398297, 1, 0, 0.3176471, 1,
1.498777, -0.4977123, 3.417104, 1, 0, 0.3137255, 1,
1.522494, -0.8609813, 2.542493, 1, 0, 0.3058824, 1,
1.52388, -0.4479884, 1.975653, 1, 0, 0.2980392, 1,
1.5346, -1.554697, 2.996799, 1, 0, 0.2941177, 1,
1.550096, -0.9020401, 2.932551, 1, 0, 0.2862745, 1,
1.570822, -0.3164782, 2.356634, 1, 0, 0.282353, 1,
1.572445, -1.452264, 4.564829, 1, 0, 0.2745098, 1,
1.58369, 0.1118103, 1.917189, 1, 0, 0.2705882, 1,
1.59159, 0.520291, 0.9693148, 1, 0, 0.2627451, 1,
1.592728, -0.9254962, 1.258034, 1, 0, 0.2588235, 1,
1.597232, 0.8732182, 1.985733, 1, 0, 0.2509804, 1,
1.60154, -0.3279033, 2.095583, 1, 0, 0.2470588, 1,
1.602401, 0.965492, 2.072403, 1, 0, 0.2392157, 1,
1.642515, -0.4067756, -0.01582476, 1, 0, 0.2352941, 1,
1.64949, 0.1239675, -0.08568599, 1, 0, 0.227451, 1,
1.659501, 1.12521, 0.2176569, 1, 0, 0.2235294, 1,
1.661167, 1.52449, 0.3654214, 1, 0, 0.2156863, 1,
1.664485, 0.4032829, 0.9001166, 1, 0, 0.2117647, 1,
1.694545, -0.05802619, -0.219994, 1, 0, 0.2039216, 1,
1.708865, 1.158644, 0.943871, 1, 0, 0.1960784, 1,
1.733997, -0.724201, -0.2599895, 1, 0, 0.1921569, 1,
1.736726, 1.560446, 1.27888, 1, 0, 0.1843137, 1,
1.736966, 0.5715106, 2.294756, 1, 0, 0.1803922, 1,
1.776305, 0.3108809, -0.6613223, 1, 0, 0.172549, 1,
1.832175, -2.261686, 3.453291, 1, 0, 0.1686275, 1,
1.912928, -1.265196, 2.967363, 1, 0, 0.1607843, 1,
1.920843, -0.01722722, 1.068523, 1, 0, 0.1568628, 1,
1.947958, -0.1268189, 0.2782454, 1, 0, 0.1490196, 1,
1.966709, -0.1192967, 2.068243, 1, 0, 0.145098, 1,
1.968309, -0.1524261, 1.667333, 1, 0, 0.1372549, 1,
1.980028, -0.8876074, 1.498956, 1, 0, 0.1333333, 1,
2.020866, 0.1696395, 1.241914, 1, 0, 0.1254902, 1,
2.03085, 1.384497, 0.7919632, 1, 0, 0.1215686, 1,
2.035052, -1.371653, 1.799002, 1, 0, 0.1137255, 1,
2.092771, -0.6519825, 2.721428, 1, 0, 0.1098039, 1,
2.100353, -0.7261338, 1.973748, 1, 0, 0.1019608, 1,
2.168627, 1.903523, -0.723362, 1, 0, 0.09411765, 1,
2.291084, 0.5325601, 2.553959, 1, 0, 0.09019608, 1,
2.311266, 1.37901, 0.4942572, 1, 0, 0.08235294, 1,
2.391039, 1.756886, 2.36948, 1, 0, 0.07843138, 1,
2.411093, -0.450367, -1.140185, 1, 0, 0.07058824, 1,
2.418158, 0.00476283, 2.133237, 1, 0, 0.06666667, 1,
2.431535, -0.5504603, 1.200648, 1, 0, 0.05882353, 1,
2.434324, 0.6084888, 2.119898, 1, 0, 0.05490196, 1,
2.446914, -0.9692028, 3.901204, 1, 0, 0.04705882, 1,
2.458136, 1.204912, -0.2816925, 1, 0, 0.04313726, 1,
2.470161, 1.485408, 0.7816516, 1, 0, 0.03529412, 1,
2.554099, -0.9722719, 0.1043414, 1, 0, 0.03137255, 1,
2.724187, -0.6505504, 0.9318149, 1, 0, 0.02352941, 1,
2.745701, -0.6155968, 1.520009, 1, 0, 0.01960784, 1,
2.778757, -1.33223, 2.818488, 1, 0, 0.01176471, 1,
2.916556, 0.3141851, 1.901782, 1, 0, 0.007843138, 1
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
-0.2203914, -4.301946, -7.914577, 0, -0.5, 0.5, 0.5,
-0.2203914, -4.301946, -7.914577, 1, -0.5, 0.5, 0.5,
-0.2203914, -4.301946, -7.914577, 1, 1.5, 0.5, 0.5,
-0.2203914, -4.301946, -7.914577, 0, 1.5, 0.5, 0.5
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
-4.420764, 0.1315664, -7.914577, 0, -0.5, 0.5, 0.5,
-4.420764, 0.1315664, -7.914577, 1, -0.5, 0.5, 0.5,
-4.420764, 0.1315664, -7.914577, 1, 1.5, 0.5, 0.5,
-4.420764, 0.1315664, -7.914577, 0, 1.5, 0.5, 0.5
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
-4.420764, -4.301946, -0.6480284, 0, -0.5, 0.5, 0.5,
-4.420764, -4.301946, -0.6480284, 1, -0.5, 0.5, 0.5,
-4.420764, -4.301946, -0.6480284, 1, 1.5, 0.5, 0.5,
-4.420764, -4.301946, -0.6480284, 0, 1.5, 0.5, 0.5
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
-3, -3.278828, -6.237681,
2, -3.278828, -6.237681,
-3, -3.278828, -6.237681,
-3, -3.449348, -6.517163,
-2, -3.278828, -6.237681,
-2, -3.449348, -6.517163,
-1, -3.278828, -6.237681,
-1, -3.449348, -6.517163,
0, -3.278828, -6.237681,
0, -3.449348, -6.517163,
1, -3.278828, -6.237681,
1, -3.449348, -6.517163,
2, -3.278828, -6.237681,
2, -3.449348, -6.517163
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
-3, -3.790387, -7.076128, 0, -0.5, 0.5, 0.5,
-3, -3.790387, -7.076128, 1, -0.5, 0.5, 0.5,
-3, -3.790387, -7.076128, 1, 1.5, 0.5, 0.5,
-3, -3.790387, -7.076128, 0, 1.5, 0.5, 0.5,
-2, -3.790387, -7.076128, 0, -0.5, 0.5, 0.5,
-2, -3.790387, -7.076128, 1, -0.5, 0.5, 0.5,
-2, -3.790387, -7.076128, 1, 1.5, 0.5, 0.5,
-2, -3.790387, -7.076128, 0, 1.5, 0.5, 0.5,
-1, -3.790387, -7.076128, 0, -0.5, 0.5, 0.5,
-1, -3.790387, -7.076128, 1, -0.5, 0.5, 0.5,
-1, -3.790387, -7.076128, 1, 1.5, 0.5, 0.5,
-1, -3.790387, -7.076128, 0, 1.5, 0.5, 0.5,
0, -3.790387, -7.076128, 0, -0.5, 0.5, 0.5,
0, -3.790387, -7.076128, 1, -0.5, 0.5, 0.5,
0, -3.790387, -7.076128, 1, 1.5, 0.5, 0.5,
0, -3.790387, -7.076128, 0, 1.5, 0.5, 0.5,
1, -3.790387, -7.076128, 0, -0.5, 0.5, 0.5,
1, -3.790387, -7.076128, 1, -0.5, 0.5, 0.5,
1, -3.790387, -7.076128, 1, 1.5, 0.5, 0.5,
1, -3.790387, -7.076128, 0, 1.5, 0.5, 0.5,
2, -3.790387, -7.076128, 0, -0.5, 0.5, 0.5,
2, -3.790387, -7.076128, 1, -0.5, 0.5, 0.5,
2, -3.790387, -7.076128, 1, 1.5, 0.5, 0.5,
2, -3.790387, -7.076128, 0, 1.5, 0.5, 0.5
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
-3.451447, -3, -6.237681,
-3.451447, 3, -6.237681,
-3.451447, -3, -6.237681,
-3.613, -3, -6.517163,
-3.451447, -2, -6.237681,
-3.613, -2, -6.517163,
-3.451447, -1, -6.237681,
-3.613, -1, -6.517163,
-3.451447, 0, -6.237681,
-3.613, 0, -6.517163,
-3.451447, 1, -6.237681,
-3.613, 1, -6.517163,
-3.451447, 2, -6.237681,
-3.613, 2, -6.517163,
-3.451447, 3, -6.237681,
-3.613, 3, -6.517163
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
-3.936105, -3, -7.076128, 0, -0.5, 0.5, 0.5,
-3.936105, -3, -7.076128, 1, -0.5, 0.5, 0.5,
-3.936105, -3, -7.076128, 1, 1.5, 0.5, 0.5,
-3.936105, -3, -7.076128, 0, 1.5, 0.5, 0.5,
-3.936105, -2, -7.076128, 0, -0.5, 0.5, 0.5,
-3.936105, -2, -7.076128, 1, -0.5, 0.5, 0.5,
-3.936105, -2, -7.076128, 1, 1.5, 0.5, 0.5,
-3.936105, -2, -7.076128, 0, 1.5, 0.5, 0.5,
-3.936105, -1, -7.076128, 0, -0.5, 0.5, 0.5,
-3.936105, -1, -7.076128, 1, -0.5, 0.5, 0.5,
-3.936105, -1, -7.076128, 1, 1.5, 0.5, 0.5,
-3.936105, -1, -7.076128, 0, 1.5, 0.5, 0.5,
-3.936105, 0, -7.076128, 0, -0.5, 0.5, 0.5,
-3.936105, 0, -7.076128, 1, -0.5, 0.5, 0.5,
-3.936105, 0, -7.076128, 1, 1.5, 0.5, 0.5,
-3.936105, 0, -7.076128, 0, 1.5, 0.5, 0.5,
-3.936105, 1, -7.076128, 0, -0.5, 0.5, 0.5,
-3.936105, 1, -7.076128, 1, -0.5, 0.5, 0.5,
-3.936105, 1, -7.076128, 1, 1.5, 0.5, 0.5,
-3.936105, 1, -7.076128, 0, 1.5, 0.5, 0.5,
-3.936105, 2, -7.076128, 0, -0.5, 0.5, 0.5,
-3.936105, 2, -7.076128, 1, -0.5, 0.5, 0.5,
-3.936105, 2, -7.076128, 1, 1.5, 0.5, 0.5,
-3.936105, 2, -7.076128, 0, 1.5, 0.5, 0.5,
-3.936105, 3, -7.076128, 0, -0.5, 0.5, 0.5,
-3.936105, 3, -7.076128, 1, -0.5, 0.5, 0.5,
-3.936105, 3, -7.076128, 1, 1.5, 0.5, 0.5,
-3.936105, 3, -7.076128, 0, 1.5, 0.5, 0.5
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
-3.451447, -3.278828, -6,
-3.451447, -3.278828, 4,
-3.451447, -3.278828, -6,
-3.613, -3.449348, -6,
-3.451447, -3.278828, -4,
-3.613, -3.449348, -4,
-3.451447, -3.278828, -2,
-3.613, -3.449348, -2,
-3.451447, -3.278828, 0,
-3.613, -3.449348, 0,
-3.451447, -3.278828, 2,
-3.613, -3.449348, 2,
-3.451447, -3.278828, 4,
-3.613, -3.449348, 4
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
-3.936105, -3.790387, -6, 0, -0.5, 0.5, 0.5,
-3.936105, -3.790387, -6, 1, -0.5, 0.5, 0.5,
-3.936105, -3.790387, -6, 1, 1.5, 0.5, 0.5,
-3.936105, -3.790387, -6, 0, 1.5, 0.5, 0.5,
-3.936105, -3.790387, -4, 0, -0.5, 0.5, 0.5,
-3.936105, -3.790387, -4, 1, -0.5, 0.5, 0.5,
-3.936105, -3.790387, -4, 1, 1.5, 0.5, 0.5,
-3.936105, -3.790387, -4, 0, 1.5, 0.5, 0.5,
-3.936105, -3.790387, -2, 0, -0.5, 0.5, 0.5,
-3.936105, -3.790387, -2, 1, -0.5, 0.5, 0.5,
-3.936105, -3.790387, -2, 1, 1.5, 0.5, 0.5,
-3.936105, -3.790387, -2, 0, 1.5, 0.5, 0.5,
-3.936105, -3.790387, 0, 0, -0.5, 0.5, 0.5,
-3.936105, -3.790387, 0, 1, -0.5, 0.5, 0.5,
-3.936105, -3.790387, 0, 1, 1.5, 0.5, 0.5,
-3.936105, -3.790387, 0, 0, 1.5, 0.5, 0.5,
-3.936105, -3.790387, 2, 0, -0.5, 0.5, 0.5,
-3.936105, -3.790387, 2, 1, -0.5, 0.5, 0.5,
-3.936105, -3.790387, 2, 1, 1.5, 0.5, 0.5,
-3.936105, -3.790387, 2, 0, 1.5, 0.5, 0.5,
-3.936105, -3.790387, 4, 0, -0.5, 0.5, 0.5,
-3.936105, -3.790387, 4, 1, -0.5, 0.5, 0.5,
-3.936105, -3.790387, 4, 1, 1.5, 0.5, 0.5,
-3.936105, -3.790387, 4, 0, 1.5, 0.5, 0.5
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
-3.451447, -3.278828, -6.237681,
-3.451447, 3.541961, -6.237681,
-3.451447, -3.278828, 4.941624,
-3.451447, 3.541961, 4.941624,
-3.451447, -3.278828, -6.237681,
-3.451447, -3.278828, 4.941624,
-3.451447, 3.541961, -6.237681,
-3.451447, 3.541961, 4.941624,
-3.451447, -3.278828, -6.237681,
3.010664, -3.278828, -6.237681,
-3.451447, -3.278828, 4.941624,
3.010664, -3.278828, 4.941624,
-3.451447, 3.541961, -6.237681,
3.010664, 3.541961, -6.237681,
-3.451447, 3.541961, 4.941624,
3.010664, 3.541961, 4.941624,
3.010664, -3.278828, -6.237681,
3.010664, 3.541961, -6.237681,
3.010664, -3.278828, 4.941624,
3.010664, 3.541961, 4.941624,
3.010664, -3.278828, -6.237681,
3.010664, -3.278828, 4.941624,
3.010664, 3.541961, -6.237681,
3.010664, 3.541961, 4.941624
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
var radius = 7.797925;
var distance = 34.69385;
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
mvMatrix.translate( 0.2203914, -0.1315664, 0.6480284 );
mvMatrix.scale( 1.304724, 1.236114, 0.7541854 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.69385);
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
harmony<-read.table("harmony.xyz")
```

```
## Error in read.table("harmony.xyz"): no lines available in input
```

```r
x<-harmony$V2
```

```
## Error in eval(expr, envir, enclos): object 'harmony' not found
```

```r
y<-harmony$V3
```

```
## Error in eval(expr, envir, enclos): object 'harmony' not found
```

```r
z<-harmony$V4
```

```
## Error in eval(expr, envir, enclos): object 'harmony' not found
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
-3.357339, 1.320678, -0.8130032, 0, 0, 1, 1, 1,
-3.295996, -0.4013883, -0.8833267, 1, 0, 0, 1, 1,
-3.037806, 0.3154895, -2.403517, 1, 0, 0, 1, 1,
-3.02647, -0.2564315, -2.382676, 1, 0, 0, 1, 1,
-2.620892, 1.684318, 1.30007, 1, 0, 0, 1, 1,
-2.615645, 0.2573205, -1.589811, 1, 0, 0, 1, 1,
-2.605289, -0.2376938, -1.732557, 0, 0, 0, 1, 1,
-2.581684, -0.4441779, -1.683217, 0, 0, 0, 1, 1,
-2.550208, -2.524536, -0.151713, 0, 0, 0, 1, 1,
-2.506125, 2.158166, -1.685351, 0, 0, 0, 1, 1,
-2.472128, 0.02556632, -1.418531, 0, 0, 0, 1, 1,
-2.470208, -0.6587391, -2.614853, 0, 0, 0, 1, 1,
-2.450116, -1.228622, -1.981202, 0, 0, 0, 1, 1,
-2.407064, 0.5103223, -1.145538, 1, 1, 1, 1, 1,
-2.379559, 0.2152123, -1.053571, 1, 1, 1, 1, 1,
-2.367829, -1.280313, -3.20344, 1, 1, 1, 1, 1,
-2.36564, -0.3014825, -3.547622, 1, 1, 1, 1, 1,
-2.264078, 0.1120402, -1.514643, 1, 1, 1, 1, 1,
-2.214948, 0.885416, -2.268356, 1, 1, 1, 1, 1,
-2.17691, -0.1064397, -2.708368, 1, 1, 1, 1, 1,
-2.102848, -0.5673005, -1.219709, 1, 1, 1, 1, 1,
-2.046435, 3.442629, 1.404444, 1, 1, 1, 1, 1,
-1.996819, 0.9268303, -0.9065487, 1, 1, 1, 1, 1,
-1.99216, 0.9565814, 0.526792, 1, 1, 1, 1, 1,
-1.977487, 0.0314583, -1.653715, 1, 1, 1, 1, 1,
-1.965204, 0.4669461, -0.9655433, 1, 1, 1, 1, 1,
-1.964822, -0.7557119, -3.098231, 1, 1, 1, 1, 1,
-1.883976, 0.6116392, -1.680609, 1, 1, 1, 1, 1,
-1.878558, 0.3643881, -1.82168, 0, 0, 1, 1, 1,
-1.871985, 0.4259559, -2.297107, 1, 0, 0, 1, 1,
-1.826031, -0.1143293, -2.118096, 1, 0, 0, 1, 1,
-1.816656, 0.4154749, -1.906975, 1, 0, 0, 1, 1,
-1.814929, 0.7924928, -2.000862, 1, 0, 0, 1, 1,
-1.797524, -0.04898947, 0.4023629, 1, 0, 0, 1, 1,
-1.782665, -1.272891, -3.438877, 0, 0, 0, 1, 1,
-1.76463, -0.06530381, -2.11554, 0, 0, 0, 1, 1,
-1.751452, 1.729019, 1.908344, 0, 0, 0, 1, 1,
-1.733241, 0.1670545, -1.589878, 0, 0, 0, 1, 1,
-1.733202, 1.041353, -1.144119, 0, 0, 0, 1, 1,
-1.716589, -0.5718402, -2.449703, 0, 0, 0, 1, 1,
-1.709516, 0.3383119, -0.321586, 0, 0, 0, 1, 1,
-1.708704, 1.405601, -1.416489, 1, 1, 1, 1, 1,
-1.689538, -1.010085, -1.64525, 1, 1, 1, 1, 1,
-1.668001, 0.2624495, -1.439009, 1, 1, 1, 1, 1,
-1.659654, -0.09215044, -1.138752, 1, 1, 1, 1, 1,
-1.659155, 0.2662455, -1.698804, 1, 1, 1, 1, 1,
-1.637784, -0.4554707, -1.950801, 1, 1, 1, 1, 1,
-1.637509, 1.215804, -1.275405, 1, 1, 1, 1, 1,
-1.619565, -0.5451582, -2.437213, 1, 1, 1, 1, 1,
-1.606142, -0.2633767, 0.0499377, 1, 1, 1, 1, 1,
-1.594087, -1.864227, -2.766533, 1, 1, 1, 1, 1,
-1.586305, 0.2208945, -1.873102, 1, 1, 1, 1, 1,
-1.57388, 0.5743721, -3.007606, 1, 1, 1, 1, 1,
-1.570679, 0.2649259, -2.09546, 1, 1, 1, 1, 1,
-1.548212, -0.749967, -1.669481, 1, 1, 1, 1, 1,
-1.51982, 0.4257157, -1.340218, 1, 1, 1, 1, 1,
-1.516328, 0.2098653, -1.493826, 0, 0, 1, 1, 1,
-1.514964, 1.260725, -1.532411, 1, 0, 0, 1, 1,
-1.507837, -1.143925, -2.346669, 1, 0, 0, 1, 1,
-1.505825, 0.3340742, -1.381688, 1, 0, 0, 1, 1,
-1.500185, 0.5667177, -0.3678646, 1, 0, 0, 1, 1,
-1.493913, 0.1135764, -0.4259887, 1, 0, 0, 1, 1,
-1.482747, 0.5487402, 1.847685, 0, 0, 0, 1, 1,
-1.474804, -0.1128036, -1.786161, 0, 0, 0, 1, 1,
-1.453777, -0.6147186, -2.405093, 0, 0, 0, 1, 1,
-1.450897, 0.3749312, -0.119449, 0, 0, 0, 1, 1,
-1.445853, 0.4427253, -2.656341, 0, 0, 0, 1, 1,
-1.440493, 0.4541383, -1.765986, 0, 0, 0, 1, 1,
-1.440174, 0.6025707, -2.418327, 0, 0, 0, 1, 1,
-1.423808, -0.4812838, -0.8646075, 1, 1, 1, 1, 1,
-1.416576, 1.833519, 0.537237, 1, 1, 1, 1, 1,
-1.412816, -0.4470821, 0.140252, 1, 1, 1, 1, 1,
-1.41237, 1.486729, -0.2527998, 1, 1, 1, 1, 1,
-1.407754, -1.172477, -1.973408, 1, 1, 1, 1, 1,
-1.407175, -0.2658672, -1.213959, 1, 1, 1, 1, 1,
-1.402181, -1.607605, -3.264317, 1, 1, 1, 1, 1,
-1.389842, -2.029438, -3.193255, 1, 1, 1, 1, 1,
-1.377893, 0.222698, -1.626269, 1, 1, 1, 1, 1,
-1.367388, 0.8626332, -0.5694611, 1, 1, 1, 1, 1,
-1.355846, 0.6710235, -0.7792729, 1, 1, 1, 1, 1,
-1.352887, 1.46895, -0.9784881, 1, 1, 1, 1, 1,
-1.351307, -0.3409355, -1.54126, 1, 1, 1, 1, 1,
-1.346443, -0.4838064, -0.2622008, 1, 1, 1, 1, 1,
-1.344385, -0.8604472, -2.274157, 1, 1, 1, 1, 1,
-1.342431, -1.199349, -2.940181, 0, 0, 1, 1, 1,
-1.3423, 0.8229527, -0.9628052, 1, 0, 0, 1, 1,
-1.34206, -1.052973, -2.819317, 1, 0, 0, 1, 1,
-1.339094, -0.6735447, -1.749775, 1, 0, 0, 1, 1,
-1.3336, 0.6249227, -1.152117, 1, 0, 0, 1, 1,
-1.33235, 0.5050626, -3.172731, 1, 0, 0, 1, 1,
-1.326345, 1.98026, -0.5283029, 0, 0, 0, 1, 1,
-1.321453, 0.3974667, -2.762395, 0, 0, 0, 1, 1,
-1.317572, 0.3428365, -0.6867716, 0, 0, 0, 1, 1,
-1.310559, -0.2099394, -2.588464, 0, 0, 0, 1, 1,
-1.302442, -0.7312788, -1.707028, 0, 0, 0, 1, 1,
-1.302422, 0.8250136, -1.723159, 0, 0, 0, 1, 1,
-1.294359, 0.6474242, -0.9082604, 0, 0, 0, 1, 1,
-1.284613, -0.8041871, -1.755546, 1, 1, 1, 1, 1,
-1.280109, 0.6847426, -0.7614251, 1, 1, 1, 1, 1,
-1.264841, -0.9258023, -1.68226, 1, 1, 1, 1, 1,
-1.254873, 1.334596, -0.1320352, 1, 1, 1, 1, 1,
-1.248847, -0.5766631, -2.252495, 1, 1, 1, 1, 1,
-1.247988, 0.117726, -2.425537, 1, 1, 1, 1, 1,
-1.235803, 0.1149853, -2.957833, 1, 1, 1, 1, 1,
-1.234923, -0.5746145, -0.8873274, 1, 1, 1, 1, 1,
-1.224856, -0.5530466, -0.2679246, 1, 1, 1, 1, 1,
-1.221451, 0.2993554, 0.06945702, 1, 1, 1, 1, 1,
-1.220372, 0.5965837, -2.288046, 1, 1, 1, 1, 1,
-1.21885, -0.1159063, -0.6331444, 1, 1, 1, 1, 1,
-1.215623, -1.159905, -3.806364, 1, 1, 1, 1, 1,
-1.200362, 0.6523298, 1.149338, 1, 1, 1, 1, 1,
-1.193898, 0.5079505, -0.767383, 1, 1, 1, 1, 1,
-1.19042, 0.4822155, -1.680201, 0, 0, 1, 1, 1,
-1.1903, -0.6432824, -3.324182, 1, 0, 0, 1, 1,
-1.183972, 2.572026, -2.497209, 1, 0, 0, 1, 1,
-1.182881, 0.1749492, -2.026417, 1, 0, 0, 1, 1,
-1.16869, 0.9731307, -1.895448, 1, 0, 0, 1, 1,
-1.167022, 1.637167, -1.48765, 1, 0, 0, 1, 1,
-1.166388, 0.3050234, -1.045206, 0, 0, 0, 1, 1,
-1.166036, 0.8273205, -0.8845277, 0, 0, 0, 1, 1,
-1.151199, 1.756052, -1.508211, 0, 0, 0, 1, 1,
-1.145746, -0.2344194, -1.567404, 0, 0, 0, 1, 1,
-1.135968, -1.762163, -2.276419, 0, 0, 0, 1, 1,
-1.126981, 0.2277995, -1.759598, 0, 0, 0, 1, 1,
-1.121119, 0.6837616, -1.383105, 0, 0, 0, 1, 1,
-1.113213, -1.709575, -4.468041, 1, 1, 1, 1, 1,
-1.109923, -1.300541, -2.699637, 1, 1, 1, 1, 1,
-1.108895, 1.197494, -1.974901, 1, 1, 1, 1, 1,
-1.105542, -0.2188284, -1.074395, 1, 1, 1, 1, 1,
-1.105176, -0.3038295, -3.634413, 1, 1, 1, 1, 1,
-1.1039, -0.4824755, -1.169645, 1, 1, 1, 1, 1,
-1.101509, 0.7652417, -2.331775, 1, 1, 1, 1, 1,
-1.093639, 0.2820606, -0.8251315, 1, 1, 1, 1, 1,
-1.086565, -0.9211476, -1.907418, 1, 1, 1, 1, 1,
-1.085864, 1.248947, -0.2864613, 1, 1, 1, 1, 1,
-1.084947, 0.6252739, -1.631978, 1, 1, 1, 1, 1,
-1.083188, 0.8511319, -0.8663487, 1, 1, 1, 1, 1,
-1.08101, 2.484438, -0.1171455, 1, 1, 1, 1, 1,
-1.079061, 1.306864, -1.427653, 1, 1, 1, 1, 1,
-1.076576, 1.071345, 0.5143275, 1, 1, 1, 1, 1,
-1.07454, -1.117577, -3.402435, 0, 0, 1, 1, 1,
-1.072989, 0.7723552, -1.157719, 1, 0, 0, 1, 1,
-1.070087, -1.164356, -3.296551, 1, 0, 0, 1, 1,
-1.06898, -0.02428957, -1.660909, 1, 0, 0, 1, 1,
-1.052881, 0.3179122, -3.161937, 1, 0, 0, 1, 1,
-1.045748, 0.4134406, -2.238422, 1, 0, 0, 1, 1,
-1.027696, -0.60888, -1.995416, 0, 0, 0, 1, 1,
-1.027087, -0.2785827, -2.150469, 0, 0, 0, 1, 1,
-1.017515, 1.439269, -0.8410764, 0, 0, 0, 1, 1,
-1.013586, -0.6031386, -2.054389, 0, 0, 0, 1, 1,
-1.013114, -1.066689, -2.54583, 0, 0, 0, 1, 1,
-1.010407, -0.5008578, -3.018718, 0, 0, 0, 1, 1,
-1.008643, -0.9328426, -1.855758, 0, 0, 0, 1, 1,
-1.007159, 0.2251136, -2.314052, 1, 1, 1, 1, 1,
-1.006646, -0.1156781, -2.363375, 1, 1, 1, 1, 1,
-0.9852057, 0.6138924, -1.102234, 1, 1, 1, 1, 1,
-0.980226, -0.353399, -1.43173, 1, 1, 1, 1, 1,
-0.9759842, 1.531338, -1.2316, 1, 1, 1, 1, 1,
-0.9739338, 1.362959, -0.7693663, 1, 1, 1, 1, 1,
-0.9702182, -1.373078, -1.314523, 1, 1, 1, 1, 1,
-0.9617547, 0.4441956, -1.389019, 1, 1, 1, 1, 1,
-0.9560203, 1.044334, -0.5860555, 1, 1, 1, 1, 1,
-0.9481663, 0.396608, -2.700686, 1, 1, 1, 1, 1,
-0.9463882, 0.9921679, -2.467901, 1, 1, 1, 1, 1,
-0.9428012, -0.9874624, -1.646295, 1, 1, 1, 1, 1,
-0.9426916, -0.4018109, -1.744416, 1, 1, 1, 1, 1,
-0.9308372, -0.04236156, -2.412015, 1, 1, 1, 1, 1,
-0.930365, -0.1497726, -1.969418, 1, 1, 1, 1, 1,
-0.9213794, 0.07814996, -0.5938525, 0, 0, 1, 1, 1,
-0.9195713, -0.03983718, -0.9543868, 1, 0, 0, 1, 1,
-0.9149497, 0.4930933, -1.880029, 1, 0, 0, 1, 1,
-0.9094791, 0.3880875, -2.68749, 1, 0, 0, 1, 1,
-0.9092638, 1.454461, 0.898603, 1, 0, 0, 1, 1,
-0.9024854, -0.2733138, -2.417056, 1, 0, 0, 1, 1,
-0.8974333, -0.224808, -1.467625, 0, 0, 0, 1, 1,
-0.8943776, 1.28798, -0.1325729, 0, 0, 0, 1, 1,
-0.885206, -1.541906, -2.71335, 0, 0, 0, 1, 1,
-0.8849682, 0.9210318, 0.292149, 0, 0, 0, 1, 1,
-0.8777429, 0.9037256, -2.742575, 0, 0, 0, 1, 1,
-0.8733408, 0.321964, -0.1146917, 0, 0, 0, 1, 1,
-0.8720261, -1.062641, -1.887145, 0, 0, 0, 1, 1,
-0.8710087, 1.060075, -0.1944624, 1, 1, 1, 1, 1,
-0.8686799, 1.266181, -1.687908, 1, 1, 1, 1, 1,
-0.8672201, 0.9166589, -1.023483, 1, 1, 1, 1, 1,
-0.8653842, -0.1332645, -1.41502, 1, 1, 1, 1, 1,
-0.8650008, 1.009576, 0.3139248, 1, 1, 1, 1, 1,
-0.8649269, 0.3973587, 0.2341108, 1, 1, 1, 1, 1,
-0.8625919, -0.1870915, -1.891584, 1, 1, 1, 1, 1,
-0.8621451, -2.364437, -2.652132, 1, 1, 1, 1, 1,
-0.8598461, 0.5825832, -0.2218456, 1, 1, 1, 1, 1,
-0.8580816, -0.6753764, -2.757716, 1, 1, 1, 1, 1,
-0.855012, 1.142055, 0.6043478, 1, 1, 1, 1, 1,
-0.8534934, -1.070207, -3.639889, 1, 1, 1, 1, 1,
-0.853035, 0.1016251, -1.617687, 1, 1, 1, 1, 1,
-0.8421518, -1.543323, -2.572157, 1, 1, 1, 1, 1,
-0.840553, -0.4150992, -3.427857, 1, 1, 1, 1, 1,
-0.8376644, 0.1616044, -0.8875245, 0, 0, 1, 1, 1,
-0.8242602, -0.2967155, -1.576418, 1, 0, 0, 1, 1,
-0.8185745, 0.3068834, -1.130208, 1, 0, 0, 1, 1,
-0.8162903, 0.5365906, -1.201323, 1, 0, 0, 1, 1,
-0.8105957, -1.19572, -2.080364, 1, 0, 0, 1, 1,
-0.8104864, -0.280469, 0.2834788, 1, 0, 0, 1, 1,
-0.8083821, 0.1129644, -2.252532, 0, 0, 0, 1, 1,
-0.8020142, 2.64443, 2.05985, 0, 0, 0, 1, 1,
-0.7821264, 0.04964989, -1.690883, 0, 0, 0, 1, 1,
-0.775417, 0.4470702, -0.3276375, 0, 0, 0, 1, 1,
-0.7649563, -1.806967, -3.847304, 0, 0, 0, 1, 1,
-0.7610144, -0.8007815, -2.128018, 0, 0, 0, 1, 1,
-0.7526525, -0.9220459, -1.2653, 0, 0, 0, 1, 1,
-0.7523255, 1.279687, -0.3854332, 1, 1, 1, 1, 1,
-0.7464016, -2.673685, -1.932853, 1, 1, 1, 1, 1,
-0.742914, 1.937979, -1.795829, 1, 1, 1, 1, 1,
-0.7426015, -0.5269355, -2.294054, 1, 1, 1, 1, 1,
-0.7316909, 0.3242499, -1.93977, 1, 1, 1, 1, 1,
-0.7287914, -0.4965115, -2.399725, 1, 1, 1, 1, 1,
-0.7282799, 0.9412827, -1.150154, 1, 1, 1, 1, 1,
-0.7274636, 2.572338, -0.4184736, 1, 1, 1, 1, 1,
-0.7265939, 0.2153361, -0.1707573, 1, 1, 1, 1, 1,
-0.7187637, -0.5475073, -2.330911, 1, 1, 1, 1, 1,
-0.7174688, 1.623413, -1.763946, 1, 1, 1, 1, 1,
-0.7165582, -1.359461, -1.947297, 1, 1, 1, 1, 1,
-0.7158149, -0.1062296, -1.813257, 1, 1, 1, 1, 1,
-0.7116292, 0.660003, -0.9972268, 1, 1, 1, 1, 1,
-0.7081783, -0.8929302, -1.527698, 1, 1, 1, 1, 1,
-0.7079323, -0.8476991, -3.166892, 0, 0, 1, 1, 1,
-0.7052349, -0.5126657, -2.702235, 1, 0, 0, 1, 1,
-0.7026413, -0.7562146, -0.6233928, 1, 0, 0, 1, 1,
-0.6957459, 0.2722118, -0.1619599, 1, 0, 0, 1, 1,
-0.6946908, 0.07579587, -1.772136, 1, 0, 0, 1, 1,
-0.6946654, -0.02643006, -1.606878, 1, 0, 0, 1, 1,
-0.6815606, 0.04462331, -2.943974, 0, 0, 0, 1, 1,
-0.666879, 0.8279893, -1.660632, 0, 0, 0, 1, 1,
-0.6585434, 0.3910947, 0.4727315, 0, 0, 0, 1, 1,
-0.6555743, 0.7985176, -0.8974585, 0, 0, 0, 1, 1,
-0.6542426, -0.1740515, -1.876584, 0, 0, 0, 1, 1,
-0.6518134, 1.225894, -0.8127115, 0, 0, 0, 1, 1,
-0.6499233, -1.68932, -2.409391, 0, 0, 0, 1, 1,
-0.6485699, 0.7982562, -1.472423, 1, 1, 1, 1, 1,
-0.6474857, 0.4789771, -0.7836258, 1, 1, 1, 1, 1,
-0.6462013, 0.9364197, 0.9473758, 1, 1, 1, 1, 1,
-0.6452516, 0.3100909, -1.038587, 1, 1, 1, 1, 1,
-0.6447439, -0.2274124, -2.805325, 1, 1, 1, 1, 1,
-0.6422098, -1.581082, -4.765991, 1, 1, 1, 1, 1,
-0.6372198, 0.3982519, -1.717401, 1, 1, 1, 1, 1,
-0.6319519, -1.093216, -5.281697, 1, 1, 1, 1, 1,
-0.6222315, -0.700236, -3.326545, 1, 1, 1, 1, 1,
-0.6160421, -0.5873582, -1.746608, 1, 1, 1, 1, 1,
-0.6152099, -1.536482, -3.856069, 1, 1, 1, 1, 1,
-0.6109793, 0.7386001, 0.04936406, 1, 1, 1, 1, 1,
-0.6081787, -0.712235, -1.470918, 1, 1, 1, 1, 1,
-0.6069668, -0.5418259, -2.723825, 1, 1, 1, 1, 1,
-0.6052363, 0.07721847, -0.9878755, 1, 1, 1, 1, 1,
-0.6023971, 0.1755278, -1.892016, 0, 0, 1, 1, 1,
-0.6023196, -0.6458198, -3.056479, 1, 0, 0, 1, 1,
-0.6009212, -0.8249088, -4.575994, 1, 0, 0, 1, 1,
-0.6006119, -0.3168673, -1.349301, 1, 0, 0, 1, 1,
-0.5944028, -0.3713384, -3.296312, 1, 0, 0, 1, 1,
-0.5913194, 0.3221365, -2.634249, 1, 0, 0, 1, 1,
-0.5904326, 0.1728804, -0.8032404, 0, 0, 0, 1, 1,
-0.590146, -0.1055504, -2.434585, 0, 0, 0, 1, 1,
-0.588922, -0.1437499, -1.681245, 0, 0, 0, 1, 1,
-0.5884338, -1.172368, -2.737685, 0, 0, 0, 1, 1,
-0.5857307, -0.1185761, -2.894638, 0, 0, 0, 1, 1,
-0.5855311, 1.888124, -1.197305, 0, 0, 0, 1, 1,
-0.5777954, -0.4181248, -2.834606, 0, 0, 0, 1, 1,
-0.5718254, 0.7889359, -1.964119, 1, 1, 1, 1, 1,
-0.5694183, 0.1167972, -2.783431, 1, 1, 1, 1, 1,
-0.5681772, 1.475451, 1.153276, 1, 1, 1, 1, 1,
-0.5655761, 0.1271254, -0.5144296, 1, 1, 1, 1, 1,
-0.5564548, 1.644395, -1.175849, 1, 1, 1, 1, 1,
-0.5547388, 0.06325354, -2.246132, 1, 1, 1, 1, 1,
-0.552637, 0.663678, 0.9027327, 1, 1, 1, 1, 1,
-0.5525275, -0.6794421, -3.222083, 1, 1, 1, 1, 1,
-0.5516854, 0.8696403, 1.78615, 1, 1, 1, 1, 1,
-0.5454214, -0.1799769, -1.60396, 1, 1, 1, 1, 1,
-0.5452485, -0.6082008, -2.944423, 1, 1, 1, 1, 1,
-0.5404646, 0.4442477, -0.7267973, 1, 1, 1, 1, 1,
-0.5396916, -1.272, -1.649244, 1, 1, 1, 1, 1,
-0.5389363, -0.06103364, -0.4990233, 1, 1, 1, 1, 1,
-0.5338078, -1.444915, -3.96657, 1, 1, 1, 1, 1,
-0.5305244, 0.4391665, -1.540533, 0, 0, 1, 1, 1,
-0.5234329, -0.8241168, -5.052101, 1, 0, 0, 1, 1,
-0.5189286, 0.9378223, 1.087342, 1, 0, 0, 1, 1,
-0.5185647, -1.795568, -2.254482, 1, 0, 0, 1, 1,
-0.5176802, -1.305237, -3.708724, 1, 0, 0, 1, 1,
-0.5151657, -0.8459084, -2.060491, 1, 0, 0, 1, 1,
-0.5144097, 0.3862794, -2.745208, 0, 0, 0, 1, 1,
-0.513415, -0.1325642, -0.9818164, 0, 0, 0, 1, 1,
-0.5108584, -0.04881303, -4.050312, 0, 0, 0, 1, 1,
-0.5090234, -1.191123, -1.920577, 0, 0, 0, 1, 1,
-0.5070401, -0.4954346, -2.534481, 0, 0, 0, 1, 1,
-0.5064169, -0.4884048, -0.7094665, 0, 0, 0, 1, 1,
-0.4972489, 0.1954606, -0.3260151, 0, 0, 0, 1, 1,
-0.4918182, -0.1689189, -3.570218, 1, 1, 1, 1, 1,
-0.4900669, 0.9547267, -0.9607524, 1, 1, 1, 1, 1,
-0.48748, -0.7885777, -2.609316, 1, 1, 1, 1, 1,
-0.483998, 0.4378216, -0.4285219, 1, 1, 1, 1, 1,
-0.4817434, -0.28318, -0.409583, 1, 1, 1, 1, 1,
-0.4802556, 0.3031819, -0.340061, 1, 1, 1, 1, 1,
-0.4795439, 1.051152, 0.2984051, 1, 1, 1, 1, 1,
-0.4794504, 0.1441264, -2.268125, 1, 1, 1, 1, 1,
-0.477315, -0.09928964, -0.4337161, 1, 1, 1, 1, 1,
-0.4761234, 1.051699, -0.0392828, 1, 1, 1, 1, 1,
-0.4757619, -0.8374045, -2.330873, 1, 1, 1, 1, 1,
-0.4743485, 0.4414433, -0.7398731, 1, 1, 1, 1, 1,
-0.4725354, 0.5148522, -0.7871805, 1, 1, 1, 1, 1,
-0.4685177, 1.241214, 0.02629023, 1, 1, 1, 1, 1,
-0.4684252, 0.6489336, -0.2750663, 1, 1, 1, 1, 1,
-0.4679529, -2.355374, -2.880416, 0, 0, 1, 1, 1,
-0.4665288, 0.7889081, -1.2951, 1, 0, 0, 1, 1,
-0.4636351, -0.5890992, -2.865282, 1, 0, 0, 1, 1,
-0.4625683, -0.04887276, -0.9123365, 1, 0, 0, 1, 1,
-0.4618399, -0.5768571, -3.537981, 1, 0, 0, 1, 1,
-0.4611788, 0.5439285, -0.4694514, 1, 0, 0, 1, 1,
-0.4553957, 0.5565704, 1.798518, 0, 0, 0, 1, 1,
-0.4516018, -0.3271396, -3.865209, 0, 0, 0, 1, 1,
-0.449004, -0.9206202, -1.891388, 0, 0, 0, 1, 1,
-0.4461628, -1.039071, -2.868938, 0, 0, 0, 1, 1,
-0.4329214, 1.282306, -1.33549, 0, 0, 0, 1, 1,
-0.431635, -0.409629, -1.80297, 0, 0, 0, 1, 1,
-0.4104837, 0.7460201, 0.9484915, 0, 0, 0, 1, 1,
-0.4058621, 0.5471925, -3.242327, 1, 1, 1, 1, 1,
-0.4043507, -0.898036, -1.519893, 1, 1, 1, 1, 1,
-0.3966943, -1.25486, -2.963357, 1, 1, 1, 1, 1,
-0.396503, -0.2456955, -2.754235, 1, 1, 1, 1, 1,
-0.3915616, 0.4713833, -1.261413, 1, 1, 1, 1, 1,
-0.3841966, -0.3946704, -1.929171, 1, 1, 1, 1, 1,
-0.3805881, -0.5155974, -2.743694, 1, 1, 1, 1, 1,
-0.3798229, -1.196656, -4.143325, 1, 1, 1, 1, 1,
-0.3727957, 1.760793, 0.0155547, 1, 1, 1, 1, 1,
-0.3714036, -0.5677134, -3.451933, 1, 1, 1, 1, 1,
-0.3695719, -1.724202, -3.201136, 1, 1, 1, 1, 1,
-0.3694074, 0.1053738, 1.551919, 1, 1, 1, 1, 1,
-0.3691025, -1.393648, -1.867549, 1, 1, 1, 1, 1,
-0.3687375, -0.7299107, -2.697911, 1, 1, 1, 1, 1,
-0.3661352, 0.8376225, -0.3997772, 1, 1, 1, 1, 1,
-0.3559434, -0.4467137, -2.088745, 0, 0, 1, 1, 1,
-0.3539623, 0.6600828, -0.3266308, 1, 0, 0, 1, 1,
-0.3534053, -0.1679998, -2.412071, 1, 0, 0, 1, 1,
-0.3514581, 0.1031185, -2.598109, 1, 0, 0, 1, 1,
-0.3513789, 0.4778039, 0.09652383, 1, 0, 0, 1, 1,
-0.3512746, 0.3032005, -1.083738, 1, 0, 0, 1, 1,
-0.3486908, 1.250901, -0.2795903, 0, 0, 0, 1, 1,
-0.3454422, 1.50615, -0.3559019, 0, 0, 0, 1, 1,
-0.3447476, -0.3385115, -1.547078, 0, 0, 0, 1, 1,
-0.3409868, 0.4179575, -0.4424036, 0, 0, 0, 1, 1,
-0.3400668, 0.9049118, -0.0620388, 0, 0, 0, 1, 1,
-0.3367658, 0.3929163, -1.798503, 0, 0, 0, 1, 1,
-0.3341129, 1.523237, 2.326476, 0, 0, 0, 1, 1,
-0.3324842, 1.75649, -2.227137, 1, 1, 1, 1, 1,
-0.3282539, -0.5395384, -0.773158, 1, 1, 1, 1, 1,
-0.3265945, -0.3609871, -3.199583, 1, 1, 1, 1, 1,
-0.3249594, -0.5783045, -3.960395, 1, 1, 1, 1, 1,
-0.3154185, -0.8054751, -4.260441, 1, 1, 1, 1, 1,
-0.3152422, -1.636054, -3.34882, 1, 1, 1, 1, 1,
-0.3131942, -0.2767701, -1.802098, 1, 1, 1, 1, 1,
-0.3098329, 0.2288104, 0.7304833, 1, 1, 1, 1, 1,
-0.3053228, 1.608241, -0.8236509, 1, 1, 1, 1, 1,
-0.3039998, 0.7288457, 0.09617971, 1, 1, 1, 1, 1,
-0.2957448, 0.08189867, -1.085656, 1, 1, 1, 1, 1,
-0.2954808, 0.3148513, -0.9700609, 1, 1, 1, 1, 1,
-0.2937436, 0.5678897, -0.7890862, 1, 1, 1, 1, 1,
-0.2907268, 1.750975, -0.8532677, 1, 1, 1, 1, 1,
-0.2869652, 0.8008094, -1.147023, 1, 1, 1, 1, 1,
-0.2844513, -0.6249848, -2.277643, 0, 0, 1, 1, 1,
-0.2795559, -0.7121823, -2.37716, 1, 0, 0, 1, 1,
-0.2757263, -0.3946151, -4.718017, 1, 0, 0, 1, 1,
-0.2626664, 0.975369, 0.6754367, 1, 0, 0, 1, 1,
-0.2596723, -0.8546097, -3.776876, 1, 0, 0, 1, 1,
-0.2587937, -2.085996, -1.67106, 1, 0, 0, 1, 1,
-0.2543695, 0.8555012, -0.9174764, 0, 0, 0, 1, 1,
-0.2529295, 2.017296, -1.348444, 0, 0, 0, 1, 1,
-0.2527967, -0.9695017, -1.554955, 0, 0, 0, 1, 1,
-0.246994, -0.2868379, -1.271, 0, 0, 0, 1, 1,
-0.2460025, -0.3661794, -2.813905, 0, 0, 0, 1, 1,
-0.2423384, -0.1926859, -2.691435, 0, 0, 0, 1, 1,
-0.2422274, -0.437416, -4.232337, 0, 0, 0, 1, 1,
-0.2406732, -0.05696666, 0.544474, 1, 1, 1, 1, 1,
-0.2386232, 0.1777313, 1.396509, 1, 1, 1, 1, 1,
-0.2380442, -0.0677234, -0.6984957, 1, 1, 1, 1, 1,
-0.2363467, 0.2677439, 0.04196866, 1, 1, 1, 1, 1,
-0.2358725, -0.3999978, -1.899932, 1, 1, 1, 1, 1,
-0.2347554, -2.267464, -2.736803, 1, 1, 1, 1, 1,
-0.2334584, -1.065361, -2.088198, 1, 1, 1, 1, 1,
-0.2307794, -1.398978, -2.578705, 1, 1, 1, 1, 1,
-0.2270256, 2.619934, -0.04823051, 1, 1, 1, 1, 1,
-0.2232318, 1.118505, 0.9463613, 1, 1, 1, 1, 1,
-0.2205675, -0.2412939, -2.319843, 1, 1, 1, 1, 1,
-0.2165484, 0.89811, -0.1427501, 1, 1, 1, 1, 1,
-0.2160847, -1.606378, -3.845937, 1, 1, 1, 1, 1,
-0.2133275, -1.055592, -2.899821, 1, 1, 1, 1, 1,
-0.2080162, 0.4288505, -0.2340992, 1, 1, 1, 1, 1,
-0.2022965, 0.4103454, 0.6180884, 0, 0, 1, 1, 1,
-0.2019201, 0.4549337, 0.7605519, 1, 0, 0, 1, 1,
-0.2017604, 0.4180466, -1.690369, 1, 0, 0, 1, 1,
-0.2000543, 0.1452617, -1.766044, 1, 0, 0, 1, 1,
-0.199338, -1.571826, -4.089355, 1, 0, 0, 1, 1,
-0.1990615, 0.2412226, -2.288615, 1, 0, 0, 1, 1,
-0.1984461, -0.1656134, -1.602189, 0, 0, 0, 1, 1,
-0.1959093, 0.5326907, -0.7233028, 0, 0, 0, 1, 1,
-0.1955401, 0.3789629, 1.150509, 0, 0, 0, 1, 1,
-0.1916961, 0.5544042, -1.297157, 0, 0, 0, 1, 1,
-0.1880216, 0.6416272, -1.936328, 0, 0, 0, 1, 1,
-0.1769006, -1.174587, -3.807327, 0, 0, 0, 1, 1,
-0.1746336, -0.2382545, -4.351387, 0, 0, 0, 1, 1,
-0.1744036, 0.5906995, -0.5044832, 1, 1, 1, 1, 1,
-0.1740282, 0.2988762, 0.7095175, 1, 1, 1, 1, 1,
-0.1697602, 0.03916231, -0.1949938, 1, 1, 1, 1, 1,
-0.1660333, 1.316247, 0.4083757, 1, 1, 1, 1, 1,
-0.1647786, 0.1369148, -0.5649688, 1, 1, 1, 1, 1,
-0.1630528, 1.354676, 0.2155084, 1, 1, 1, 1, 1,
-0.1629457, -0.57894, -1.621593, 1, 1, 1, 1, 1,
-0.154335, 0.04226266, -0.7063231, 1, 1, 1, 1, 1,
-0.1513991, -0.07059839, -3.614662, 1, 1, 1, 1, 1,
-0.1487009, -0.9102364, -1.479771, 1, 1, 1, 1, 1,
-0.1480612, 0.5547431, 0.7137879, 1, 1, 1, 1, 1,
-0.1473239, 0.5985276, -0.602345, 1, 1, 1, 1, 1,
-0.1391153, 0.05203892, -0.58146, 1, 1, 1, 1, 1,
-0.1352303, -0.740347, -4.038758, 1, 1, 1, 1, 1,
-0.1265676, 1.442098, -1.287675, 1, 1, 1, 1, 1,
-0.1247241, 0.1936212, -0.7696753, 0, 0, 1, 1, 1,
-0.1231958, 0.9879045, 1.140275, 1, 0, 0, 1, 1,
-0.1206811, -1.81181, -3.481435, 1, 0, 0, 1, 1,
-0.1204798, -2.754185, -3.353523, 1, 0, 0, 1, 1,
-0.1173897, 1.737035, -0.9979256, 1, 0, 0, 1, 1,
-0.1167421, -1.293146, -2.947096, 1, 0, 0, 1, 1,
-0.1160329, 1.560986, 0.07037257, 0, 0, 0, 1, 1,
-0.1086905, 0.7498415, 1.373452, 0, 0, 0, 1, 1,
-0.1073578, -1.101674, -4.314129, 0, 0, 0, 1, 1,
-0.106558, -0.3250389, -3.915985, 0, 0, 0, 1, 1,
-0.1008202, -0.1603354, -4.222472, 0, 0, 0, 1, 1,
-0.09102564, 0.3481928, 0.2730596, 0, 0, 0, 1, 1,
-0.08842763, 0.3521184, -1.286278, 0, 0, 0, 1, 1,
-0.08789694, 0.1125915, -2.135321, 1, 1, 1, 1, 1,
-0.08472019, -0.9576941, -3.008504, 1, 1, 1, 1, 1,
-0.08439267, 1.144861, -0.3823115, 1, 1, 1, 1, 1,
-0.08298758, -0.8480323, -0.6709352, 1, 1, 1, 1, 1,
-0.0820351, -0.1192448, -3.15606, 1, 1, 1, 1, 1,
-0.07534319, 0.09558994, -0.7446938, 1, 1, 1, 1, 1,
-0.07528242, 1.952969, 1.46475, 1, 1, 1, 1, 1,
-0.07351781, -0.0253023, -1.56007, 1, 1, 1, 1, 1,
-0.07248325, -1.541284, -2.76322, 1, 1, 1, 1, 1,
-0.07097889, -0.5272393, -2.322668, 1, 1, 1, 1, 1,
-0.06888346, 0.2337843, -0.1157191, 1, 1, 1, 1, 1,
-0.06886519, -1.557224, -3.589884, 1, 1, 1, 1, 1,
-0.06708319, -0.08607676, -2.759134, 1, 1, 1, 1, 1,
-0.05988769, 0.9540862, 0.7026569, 1, 1, 1, 1, 1,
-0.05725877, 1.22909, 0.1377635, 1, 1, 1, 1, 1,
-0.05724579, 1.175177, 0.3728973, 0, 0, 1, 1, 1,
-0.05625786, -1.09023, -1.07057, 1, 0, 0, 1, 1,
-0.05483721, -0.7538823, -3.980949, 1, 0, 0, 1, 1,
-0.05323873, 1.033038, 0.09443769, 1, 0, 0, 1, 1,
-0.04970754, 0.3343088, -1.082619, 1, 0, 0, 1, 1,
-0.04868701, -1.256558, -2.102935, 1, 0, 0, 1, 1,
-0.04575193, 0.849717, -0.8127133, 0, 0, 0, 1, 1,
-0.04485686, 0.1671412, -0.5574939, 0, 0, 0, 1, 1,
-0.04447152, 0.9608374, 0.5798288, 0, 0, 0, 1, 1,
-0.04398679, 0.8925806, 1.291986, 0, 0, 0, 1, 1,
-0.04101607, -1.243767, -1.24751, 0, 0, 0, 1, 1,
-0.0409129, 1.114601, 0.6598035, 0, 0, 0, 1, 1,
-0.03863103, -0.1281124, -3.347194, 0, 0, 0, 1, 1,
-0.03732126, -1.60857, -3.745159, 1, 1, 1, 1, 1,
-0.03695208, -0.6853748, -2.449111, 1, 1, 1, 1, 1,
-0.03491643, -0.1349162, -1.886909, 1, 1, 1, 1, 1,
-0.03244882, -1.001403, -3.910771, 1, 1, 1, 1, 1,
-0.03214145, 0.656014, 1.638229, 1, 1, 1, 1, 1,
-0.03011775, -0.05332637, -3.339083, 1, 1, 1, 1, 1,
-0.02943848, -1.495285, -2.853405, 1, 1, 1, 1, 1,
-0.02457008, -0.6035246, -4.789165, 1, 1, 1, 1, 1,
-0.02078613, 0.2949648, -2.789001, 1, 1, 1, 1, 1,
-0.01723053, -1.834771, -2.441908, 1, 1, 1, 1, 1,
-0.01618886, 0.4532537, 0.1858758, 1, 1, 1, 1, 1,
-0.01041313, -0.4796919, -2.489884, 1, 1, 1, 1, 1,
-0.009563218, 1.414465, -0.888198, 1, 1, 1, 1, 1,
-0.009526944, 1.323971, -1.38466, 1, 1, 1, 1, 1,
-0.006951001, 1.863195, 0.6341931, 1, 1, 1, 1, 1,
-0.005857581, -0.2358218, -2.961762, 0, 0, 1, 1, 1,
-0.005340352, -1.087422, -3.783536, 1, 0, 0, 1, 1,
-0.004173575, 2.202578, 0.2036737, 1, 0, 0, 1, 1,
-0.002016241, -0.9308582, -4.103192, 1, 0, 0, 1, 1,
-0.0008809683, -0.9596743, -6.074875, 1, 0, 0, 1, 1,
0.00489236, 0.7598228, 0.6810538, 1, 0, 0, 1, 1,
0.005841346, 0.9578897, -1.088694, 0, 0, 0, 1, 1,
0.005966709, 0.3792943, -0.9612561, 0, 0, 0, 1, 1,
0.01167226, -0.4459699, 3.669894, 0, 0, 0, 1, 1,
0.01730498, 1.058545, -0.2952309, 0, 0, 0, 1, 1,
0.02198727, -0.6500626, 3.745114, 0, 0, 0, 1, 1,
0.02424746, -0.6179343, 3.449125, 0, 0, 0, 1, 1,
0.02475355, 0.02244305, 0.2066453, 0, 0, 0, 1, 1,
0.02714526, -1.747336, 2.495155, 1, 1, 1, 1, 1,
0.03518932, 0.7284957, -1.212878, 1, 1, 1, 1, 1,
0.0357152, -0.117952, 2.603897, 1, 1, 1, 1, 1,
0.03725355, -0.6332951, 2.563278, 1, 1, 1, 1, 1,
0.03796753, -0.2422161, 3.491051, 1, 1, 1, 1, 1,
0.04309438, -0.8639752, 2.358602, 1, 1, 1, 1, 1,
0.04421202, 0.1987148, -0.1866679, 1, 1, 1, 1, 1,
0.04457912, 0.8280811, 2.752084, 1, 1, 1, 1, 1,
0.04698657, -1.307345, 2.311367, 1, 1, 1, 1, 1,
0.04901556, 1.945214, -0.2279018, 1, 1, 1, 1, 1,
0.05020613, -2.50409, 4.598372, 1, 1, 1, 1, 1,
0.05069809, 1.971671, 0.5282999, 1, 1, 1, 1, 1,
0.0524101, 1.55401, -2.705699, 1, 1, 1, 1, 1,
0.05347601, 1.478809, 0.03595151, 1, 1, 1, 1, 1,
0.05376454, 0.4820069, 0.09549512, 1, 1, 1, 1, 1,
0.0543461, 0.6023468, 0.128248, 0, 0, 1, 1, 1,
0.05725582, -1.240756, 2.892333, 1, 0, 0, 1, 1,
0.06121448, 0.3114989, 0.3091103, 1, 0, 0, 1, 1,
0.06538843, -0.219288, 2.695433, 1, 0, 0, 1, 1,
0.06628572, -1.153832, 4.54158, 1, 0, 0, 1, 1,
0.06648473, 0.2747166, -2.367353, 1, 0, 0, 1, 1,
0.06937481, 2.089751, 0.06517117, 0, 0, 0, 1, 1,
0.07143854, 0.196708, 1.157736, 0, 0, 0, 1, 1,
0.07223582, -0.3703789, 1.815601, 0, 0, 0, 1, 1,
0.07610775, -1.012083, 3.897404, 0, 0, 0, 1, 1,
0.07728606, 1.374851, 0.1399143, 0, 0, 0, 1, 1,
0.07802845, -1.782208, 3.809659, 0, 0, 0, 1, 1,
0.08317258, 0.1217955, 1.954468, 0, 0, 0, 1, 1,
0.08377205, 0.1848553, 2.18018, 1, 1, 1, 1, 1,
0.08436944, -0.3690206, 2.152891, 1, 1, 1, 1, 1,
0.0908277, 0.228986, 0.3261515, 1, 1, 1, 1, 1,
0.0909684, -1.786597, 2.479139, 1, 1, 1, 1, 1,
0.0910522, 1.023203, -0.6895028, 1, 1, 1, 1, 1,
0.09363897, 1.124304, -1.271094, 1, 1, 1, 1, 1,
0.09836227, 0.3828768, -0.8484437, 1, 1, 1, 1, 1,
0.09880596, 0.263623, -1.40669, 1, 1, 1, 1, 1,
0.09890365, -0.9605659, 2.770625, 1, 1, 1, 1, 1,
0.09966403, 0.3520593, 1.088326, 1, 1, 1, 1, 1,
0.09987985, 0.9704956, 0.6239462, 1, 1, 1, 1, 1,
0.1042919, 0.8190446, -0.8322824, 1, 1, 1, 1, 1,
0.1049481, 0.8886625, 0.3746623, 1, 1, 1, 1, 1,
0.106109, 0.9808119, 0.1713196, 1, 1, 1, 1, 1,
0.1132661, 0.2264854, 0.8187894, 1, 1, 1, 1, 1,
0.1138695, 0.4021419, 0.8013585, 0, 0, 1, 1, 1,
0.1182737, -0.4455581, 2.526655, 1, 0, 0, 1, 1,
0.1193652, -0.4989031, 4.192263, 1, 0, 0, 1, 1,
0.1227339, -0.01547403, 0.9033194, 1, 0, 0, 1, 1,
0.1249451, -1.738768, 2.866503, 1, 0, 0, 1, 1,
0.1264254, -1.59234, 2.325912, 1, 0, 0, 1, 1,
0.1272796, -0.2315484, 3.896574, 0, 0, 0, 1, 1,
0.1284576, 0.3992957, 0.495732, 0, 0, 0, 1, 1,
0.1313266, 0.8331847, 0.911303, 0, 0, 0, 1, 1,
0.136893, 0.02205831, 2.546198, 0, 0, 0, 1, 1,
0.1388483, -1.175028, 1.562729, 0, 0, 0, 1, 1,
0.1392366, -0.9632449, 2.827578, 0, 0, 0, 1, 1,
0.1400572, -0.3044983, 3.13882, 0, 0, 0, 1, 1,
0.147734, -0.7329192, 1.294849, 1, 1, 1, 1, 1,
0.1490594, -0.3798604, 1.060771, 1, 1, 1, 1, 1,
0.1507042, 0.9427002, -1.54117, 1, 1, 1, 1, 1,
0.1541992, -0.9921949, 2.10265, 1, 1, 1, 1, 1,
0.1566008, 1.784171, 0.3695569, 1, 1, 1, 1, 1,
0.1601102, -0.8162494, 2.597828, 1, 1, 1, 1, 1,
0.1611237, 0.777748, -1.134492, 1, 1, 1, 1, 1,
0.1611299, 0.07609829, 1.905515, 1, 1, 1, 1, 1,
0.1612066, -0.2688315, 2.557214, 1, 1, 1, 1, 1,
0.1627337, 0.377837, 0.7771354, 1, 1, 1, 1, 1,
0.1645323, -0.9972247, 4.778819, 1, 1, 1, 1, 1,
0.1672127, 0.6744593, 0.9616001, 1, 1, 1, 1, 1,
0.1684509, 0.7964527, 0.6359739, 1, 1, 1, 1, 1,
0.1714376, 1.321515, 0.1990286, 1, 1, 1, 1, 1,
0.1725691, -1.57505, 3.027986, 1, 1, 1, 1, 1,
0.1732565, -0.1624997, 3.488403, 0, 0, 1, 1, 1,
0.1777766, -1.417348, 3.155523, 1, 0, 0, 1, 1,
0.1787887, -0.3921334, 3.673585, 1, 0, 0, 1, 1,
0.1823223, -2.190964, 3.078899, 1, 0, 0, 1, 1,
0.1865547, -1.169459, 3.419681, 1, 0, 0, 1, 1,
0.1891778, 1.698231, 0.3033728, 1, 0, 0, 1, 1,
0.1926647, -0.4313929, 1.876459, 0, 0, 0, 1, 1,
0.2043935, 0.7021186, 0.1768571, 0, 0, 0, 1, 1,
0.2053157, -0.7346362, 2.121874, 0, 0, 0, 1, 1,
0.2061323, 2.283345, 2.075476, 0, 0, 0, 1, 1,
0.2064055, 0.4961777, 0.3193599, 0, 0, 0, 1, 1,
0.2066089, -0.4083334, 2.393923, 0, 0, 0, 1, 1,
0.2104205, 1.109911, 2.073325, 0, 0, 0, 1, 1,
0.2130181, 0.3488617, 1.527901, 1, 1, 1, 1, 1,
0.2153752, 1.544035, 0.1398652, 1, 1, 1, 1, 1,
0.2156316, 0.1372285, -0.3790549, 1, 1, 1, 1, 1,
0.2165943, -0.1935923, 2.48177, 1, 1, 1, 1, 1,
0.2179957, -0.9517161, 3.513477, 1, 1, 1, 1, 1,
0.2186515, 0.9392824, -1.101215, 1, 1, 1, 1, 1,
0.2222163, -1.594278, 2.850822, 1, 1, 1, 1, 1,
0.2231845, 1.187715, 0.7025127, 1, 1, 1, 1, 1,
0.2257516, 1.382218, -0.7776915, 1, 1, 1, 1, 1,
0.2262391, 0.1987046, 0.5723683, 1, 1, 1, 1, 1,
0.2265056, -0.113838, 2.925299, 1, 1, 1, 1, 1,
0.231363, -0.08061382, 1.021636, 1, 1, 1, 1, 1,
0.232769, -0.5063672, 2.627043, 1, 1, 1, 1, 1,
0.2351617, 2.013183, -0.1217527, 1, 1, 1, 1, 1,
0.2396925, -0.2960846, 4.654674, 1, 1, 1, 1, 1,
0.2421962, -2.361823, 4.0522, 0, 0, 1, 1, 1,
0.2425892, -1.74831, 3.611104, 1, 0, 0, 1, 1,
0.2428782, -0.9928551, 3.321333, 1, 0, 0, 1, 1,
0.2437989, -0.242753, 1.823971, 1, 0, 0, 1, 1,
0.2465064, 0.08322035, 2.384896, 1, 0, 0, 1, 1,
0.2494255, 0.6979005, 0.8239844, 1, 0, 0, 1, 1,
0.2498852, 1.200533, -0.6830178, 0, 0, 0, 1, 1,
0.2535752, -0.9793591, 2.720438, 0, 0, 0, 1, 1,
0.2547479, 1.003836, -1.310655, 0, 0, 0, 1, 1,
0.2552983, 0.1571302, 0.7335359, 0, 0, 0, 1, 1,
0.2556017, 0.4798421, 0.176365, 0, 0, 0, 1, 1,
0.2589486, 1.714362, -1.433325, 0, 0, 0, 1, 1,
0.2610657, 1.457226, -0.3028339, 0, 0, 0, 1, 1,
0.2670458, 0.4078695, 0.01037627, 1, 1, 1, 1, 1,
0.2693489, 0.8736978, 0.4562243, 1, 1, 1, 1, 1,
0.269355, -1.758619, 4.011511, 1, 1, 1, 1, 1,
0.2814579, -2.583004, 3.591104, 1, 1, 1, 1, 1,
0.2817284, 0.9791638, -0.1433261, 1, 1, 1, 1, 1,
0.2881505, -0.1493764, 2.741341, 1, 1, 1, 1, 1,
0.2892044, 0.07520507, 1.356773, 1, 1, 1, 1, 1,
0.2921503, 0.5036084, -0.9176136, 1, 1, 1, 1, 1,
0.2926881, 0.1607778, 2.76251, 1, 1, 1, 1, 1,
0.2927981, 2.48477, -1.88629, 1, 1, 1, 1, 1,
0.2940697, -0.648981, 2.833035, 1, 1, 1, 1, 1,
0.2971763, 2.348535, 0.06662463, 1, 1, 1, 1, 1,
0.2987289, -1.979138, 2.982339, 1, 1, 1, 1, 1,
0.2995129, -0.2118105, 2.172834, 1, 1, 1, 1, 1,
0.2995778, -1.412594, 4.012379, 1, 1, 1, 1, 1,
0.300992, -0.5402594, 1.798045, 0, 0, 1, 1, 1,
0.3032415, 0.9198229, 0.8918368, 1, 0, 0, 1, 1,
0.3045897, 1.243281, 0.1588785, 1, 0, 0, 1, 1,
0.306604, -0.2630182, 1.540086, 1, 0, 0, 1, 1,
0.3091152, -0.04004031, 0.1338162, 1, 0, 0, 1, 1,
0.3094202, 1.248634, 0.6672654, 1, 0, 0, 1, 1,
0.3126493, -0.169009, 2.103666, 0, 0, 0, 1, 1,
0.313988, 1.508471, 0.4890217, 0, 0, 0, 1, 1,
0.3173424, 0.8608265, 0.81407, 0, 0, 0, 1, 1,
0.3290328, -1.191177, 1.242678, 0, 0, 0, 1, 1,
0.3292693, 1.639813, -1.06269, 0, 0, 0, 1, 1,
0.3311799, -0.7226946, 4.548948, 0, 0, 0, 1, 1,
0.337189, 1.242372, 0.1481779, 0, 0, 0, 1, 1,
0.3380628, -1.436803, 3.294827, 1, 1, 1, 1, 1,
0.3384564, 0.5002656, 0.4215563, 1, 1, 1, 1, 1,
0.3387685, 0.9362524, -0.8916257, 1, 1, 1, 1, 1,
0.3393638, -1.367351, 3.469818, 1, 1, 1, 1, 1,
0.3429512, 0.3065519, 0.6829639, 1, 1, 1, 1, 1,
0.3442707, 0.7592473, 2.485886, 1, 1, 1, 1, 1,
0.3459725, -1.341626, 3.207329, 1, 1, 1, 1, 1,
0.3468659, 0.03521355, 0.4620675, 1, 1, 1, 1, 1,
0.3500024, 0.1253605, 2.120105, 1, 1, 1, 1, 1,
0.3502624, 0.5343862, 0.2642873, 1, 1, 1, 1, 1,
0.3510697, 1.538792, 0.9169438, 1, 1, 1, 1, 1,
0.3519821, 0.7972251, -1.146767, 1, 1, 1, 1, 1,
0.352217, -1.363757, 3.98307, 1, 1, 1, 1, 1,
0.3547727, -0.5585964, 2.871321, 1, 1, 1, 1, 1,
0.3592152, 0.03629421, 0.6826239, 1, 1, 1, 1, 1,
0.3593258, -0.9497604, 4.552167, 0, 0, 1, 1, 1,
0.360132, -0.6119991, 2.442593, 1, 0, 0, 1, 1,
0.3612594, 1.289286, 1.163358, 1, 0, 0, 1, 1,
0.3676045, -1.189652, 3.537539, 1, 0, 0, 1, 1,
0.3703601, 0.4430312, -0.9610569, 1, 0, 0, 1, 1,
0.371675, 0.7367907, -0.542264, 1, 0, 0, 1, 1,
0.377695, -1.582384, 1.339511, 0, 0, 0, 1, 1,
0.3778539, -0.8565131, 2.965491, 0, 0, 0, 1, 1,
0.3783462, 1.426101, -0.6147761, 0, 0, 0, 1, 1,
0.3802352, -0.1740152, 0.8876076, 0, 0, 0, 1, 1,
0.3812971, 0.0600103, 1.7737, 0, 0, 0, 1, 1,
0.3890296, -1.890597, 3.954212, 0, 0, 0, 1, 1,
0.3891329, -0.6855956, 3.117283, 0, 0, 0, 1, 1,
0.391104, 0.5706351, 0.5892711, 1, 1, 1, 1, 1,
0.3936213, 1.483864, -0.303954, 1, 1, 1, 1, 1,
0.4009808, -0.1272114, 1.198981, 1, 1, 1, 1, 1,
0.4023959, 1.480367, -0.136381, 1, 1, 1, 1, 1,
0.405227, 0.5770938, 2.192929, 1, 1, 1, 1, 1,
0.4081759, 1.521133, -0.1822058, 1, 1, 1, 1, 1,
0.4107578, 1.1953, -0.444494, 1, 1, 1, 1, 1,
0.4116535, 1.049163, 0.7643179, 1, 1, 1, 1, 1,
0.4163559, -1.156551, 3.437767, 1, 1, 1, 1, 1,
0.4224564, 1.792206, -0.3707707, 1, 1, 1, 1, 1,
0.4234213, 0.5706373, 1.669993, 1, 1, 1, 1, 1,
0.4275057, -0.6547927, 3.17146, 1, 1, 1, 1, 1,
0.428586, -0.8514552, 1.525275, 1, 1, 1, 1, 1,
0.4312312, -0.5303932, 3.610869, 1, 1, 1, 1, 1,
0.4314712, 0.7834945, 0.5297799, 1, 1, 1, 1, 1,
0.442716, 1.09278, 0.9678296, 0, 0, 1, 1, 1,
0.4429307, -0.5999776, 1.266982, 1, 0, 0, 1, 1,
0.4434462, 0.2829801, -0.3150808, 1, 0, 0, 1, 1,
0.4466021, 1.4675, 3.908938, 1, 0, 0, 1, 1,
0.4484031, -0.5182267, 2.021911, 1, 0, 0, 1, 1,
0.4516684, 0.03029525, 1.428779, 1, 0, 0, 1, 1,
0.4518386, 0.3594461, 0.9045897, 0, 0, 0, 1, 1,
0.4522437, 0.9374566, 0.2907979, 0, 0, 0, 1, 1,
0.4526097, 0.5404512, 1.420685, 0, 0, 0, 1, 1,
0.4604628, 0.1411431, 2.415208, 0, 0, 0, 1, 1,
0.4641265, -0.08573288, 0.7580702, 0, 0, 0, 1, 1,
0.4647612, -0.07791654, 2.65367, 0, 0, 0, 1, 1,
0.4681741, -0.896098, 1.791247, 0, 0, 0, 1, 1,
0.4715238, -0.2317077, 1.943426, 1, 1, 1, 1, 1,
0.4757055, 1.748886, 1.495372, 1, 1, 1, 1, 1,
0.4778215, 0.4334853, 0.7005705, 1, 1, 1, 1, 1,
0.4796553, 1.246064, -1.142467, 1, 1, 1, 1, 1,
0.4808799, -0.2157266, 1.559028, 1, 1, 1, 1, 1,
0.4820956, -0.6178659, 4.074297, 1, 1, 1, 1, 1,
0.4825257, -0.8523706, 1.738151, 1, 1, 1, 1, 1,
0.48402, -0.2571778, 3.215074, 1, 1, 1, 1, 1,
0.484659, -0.0404571, 1.538073, 1, 1, 1, 1, 1,
0.4870197, -0.6107612, 3.081409, 1, 1, 1, 1, 1,
0.4898873, 0.3378775, 3.190768, 1, 1, 1, 1, 1,
0.4909572, -0.5334942, 0.7383382, 1, 1, 1, 1, 1,
0.4941915, -0.6993581, 2.934406, 1, 1, 1, 1, 1,
0.4981204, -0.2244985, 1.979286, 1, 1, 1, 1, 1,
0.5018649, 1.4528, -1.077955, 1, 1, 1, 1, 1,
0.5080271, 0.3585479, 1.230303, 0, 0, 1, 1, 1,
0.5082182, 0.1405428, 0.8058038, 1, 0, 0, 1, 1,
0.509591, -1.26494, 2.276145, 1, 0, 0, 1, 1,
0.5155613, -1.138008, 2.885936, 1, 0, 0, 1, 1,
0.5160423, 0.2297778, 0.2045419, 1, 0, 0, 1, 1,
0.5170516, 0.7929989, 0.7863167, 1, 0, 0, 1, 1,
0.5198446, 1.427844, -0.5526432, 0, 0, 0, 1, 1,
0.5207661, 0.1953381, 1.766785, 0, 0, 0, 1, 1,
0.5215784, -0.7305241, 2.065984, 0, 0, 0, 1, 1,
0.5314177, 0.7754491, 0.04999981, 0, 0, 0, 1, 1,
0.5314478, 0.3037179, 1.556963, 0, 0, 0, 1, 1,
0.5338079, 1.116292, -1.899306, 0, 0, 0, 1, 1,
0.5350457, 0.7057967, 0.6262852, 0, 0, 0, 1, 1,
0.5366488, -0.2781634, 1.651607, 1, 1, 1, 1, 1,
0.5409793, 0.1301305, 1.352506, 1, 1, 1, 1, 1,
0.542199, 0.7414144, 0.7316316, 1, 1, 1, 1, 1,
0.5436146, 0.4956462, -0.3107421, 1, 1, 1, 1, 1,
0.5454366, 0.1605715, 1.8055, 1, 1, 1, 1, 1,
0.5462521, -0.02535594, 1.218457, 1, 1, 1, 1, 1,
0.5482674, -0.1180795, 3.491788, 1, 1, 1, 1, 1,
0.5503323, 0.8156859, 0.4697818, 1, 1, 1, 1, 1,
0.5518675, -0.07668249, 1.771559, 1, 1, 1, 1, 1,
0.5645707, 0.0833364, 2.167379, 1, 1, 1, 1, 1,
0.5651512, -0.7853991, 1.408223, 1, 1, 1, 1, 1,
0.5719355, 0.8982893, -1.423647, 1, 1, 1, 1, 1,
0.5719666, 0.8158157, 0.8160248, 1, 1, 1, 1, 1,
0.5720217, -1.613434, 3.212149, 1, 1, 1, 1, 1,
0.5739155, 0.4294511, 1.280199, 1, 1, 1, 1, 1,
0.5742548, 0.142684, 1.127031, 0, 0, 1, 1, 1,
0.589491, -0.00801251, 0.4992273, 1, 0, 0, 1, 1,
0.5935242, -0.1137674, 3.068593, 1, 0, 0, 1, 1,
0.6024947, -1.432829, 2.135716, 1, 0, 0, 1, 1,
0.6025035, -0.8452964, 2.787458, 1, 0, 0, 1, 1,
0.6054835, 0.6906767, -0.9501483, 1, 0, 0, 1, 1,
0.6074464, -1.30983, 3.008889, 0, 0, 0, 1, 1,
0.6076455, 0.3571045, -0.64338, 0, 0, 0, 1, 1,
0.6127393, -1.741202, 2.969423, 0, 0, 0, 1, 1,
0.6171651, -0.8524094, 1.982791, 0, 0, 0, 1, 1,
0.6172783, -0.02301137, 3.228026, 0, 0, 0, 1, 1,
0.6174375, 0.4880778, 0.330645, 0, 0, 0, 1, 1,
0.6241943, -1.273465, 3.223942, 0, 0, 0, 1, 1,
0.6256367, 0.4060724, 2.81038, 1, 1, 1, 1, 1,
0.6323177, 0.8338287, 0.9587523, 1, 1, 1, 1, 1,
0.6368992, -1.069979, 2.864412, 1, 1, 1, 1, 1,
0.6384056, -1.549447, 3.392019, 1, 1, 1, 1, 1,
0.6400138, 0.5136614, -0.546352, 1, 1, 1, 1, 1,
0.6400785, -0.5114069, 2.67738, 1, 1, 1, 1, 1,
0.6498824, 0.8042041, 0.8801355, 1, 1, 1, 1, 1,
0.6524161, -0.5234206, 3.855379, 1, 1, 1, 1, 1,
0.6574124, 0.4181828, 0.5702829, 1, 1, 1, 1, 1,
0.6632259, 0.475541, 0.8268952, 1, 1, 1, 1, 1,
0.6689206, -2.559474, 2.197925, 1, 1, 1, 1, 1,
0.6704425, -0.7213272, 1.997823, 1, 1, 1, 1, 1,
0.6764416, -0.6954371, 2.380661, 1, 1, 1, 1, 1,
0.6825244, 1.087506, -0.04149451, 1, 1, 1, 1, 1,
0.683541, -0.09489334, 1.947515, 1, 1, 1, 1, 1,
0.6862171, 0.6661773, 1.891932, 0, 0, 1, 1, 1,
0.6899124, -1.158806, 2.117802, 1, 0, 0, 1, 1,
0.6899684, -2.226631, 2.349548, 1, 0, 0, 1, 1,
0.6939004, 0.4768525, -0.3903084, 1, 0, 0, 1, 1,
0.6959791, 1.040845, 0.5026134, 1, 0, 0, 1, 1,
0.6971623, -0.4779836, 1.329226, 1, 0, 0, 1, 1,
0.6980883, 1.439823, 1.739935, 0, 0, 0, 1, 1,
0.699305, -0.6993968, 1.356879, 0, 0, 0, 1, 1,
0.6999912, 2.010459, 0.05802654, 0, 0, 0, 1, 1,
0.7014777, -0.2807056, 1.73368, 0, 0, 0, 1, 1,
0.7040392, 0.3829858, 1.073116, 0, 0, 0, 1, 1,
0.7153101, -1.502364, 0.3534631, 0, 0, 0, 1, 1,
0.7268026, 0.8939208, 0.4793395, 0, 0, 0, 1, 1,
0.7332662, 0.1637994, 1.283235, 1, 1, 1, 1, 1,
0.7365922, -1.11913, 3.843807, 1, 1, 1, 1, 1,
0.7386363, 1.628016, 0.7437951, 1, 1, 1, 1, 1,
0.7401305, 1.454803, 1.707001, 1, 1, 1, 1, 1,
0.7430171, 0.8786963, 3.230325, 1, 1, 1, 1, 1,
0.743786, -1.067139, 1.959006, 1, 1, 1, 1, 1,
0.7463974, 0.2388677, 1.765967, 1, 1, 1, 1, 1,
0.7516194, 0.3597688, 1.277533, 1, 1, 1, 1, 1,
0.7517717, 0.5969579, 0.625295, 1, 1, 1, 1, 1,
0.7570562, -1.409052, 3.165639, 1, 1, 1, 1, 1,
0.7598786, -0.06051601, -0.5820221, 1, 1, 1, 1, 1,
0.7711003, 1.170199, 0.6622407, 1, 1, 1, 1, 1,
0.7718251, 0.5945833, 0.1606754, 1, 1, 1, 1, 1,
0.774076, -0.3034403, 1.530401, 1, 1, 1, 1, 1,
0.7773636, 0.7352466, 1.162592, 1, 1, 1, 1, 1,
0.7775482, -1.432102, 3.289657, 0, 0, 1, 1, 1,
0.7780241, 0.7556185, 0.7035147, 1, 0, 0, 1, 1,
0.7808021, 1.139013, -0.6004408, 1, 0, 0, 1, 1,
0.7834286, -1.014715, 2.965266, 1, 0, 0, 1, 1,
0.7841905, 0.7105541, 1.625253, 1, 0, 0, 1, 1,
0.7869749, 1.033285, 0.7248223, 1, 0, 0, 1, 1,
0.7882468, -1.493659, 2.864952, 0, 0, 0, 1, 1,
0.7931725, -0.5355774, 0.4852761, 0, 0, 0, 1, 1,
0.7970852, 0.7692598, 1.203977, 0, 0, 0, 1, 1,
0.7982933, -1.312164, 2.58831, 0, 0, 0, 1, 1,
0.8024734, 0.4959486, 1.483395, 0, 0, 0, 1, 1,
0.8036187, 0.8312199, 0.3136339, 0, 0, 0, 1, 1,
0.8058037, -0.1420121, 0.719126, 0, 0, 0, 1, 1,
0.8088555, 1.782922, 0.5563355, 1, 1, 1, 1, 1,
0.8102511, 0.5784821, 1.69651, 1, 1, 1, 1, 1,
0.8109788, 0.7542281, 1.826518, 1, 1, 1, 1, 1,
0.8141004, -0.9190186, 0.8502733, 1, 1, 1, 1, 1,
0.8159367, 0.9688437, 0.7881088, 1, 1, 1, 1, 1,
0.8213838, 1.530401, -0.3643495, 1, 1, 1, 1, 1,
0.8224838, 1.710262, -1.199812, 1, 1, 1, 1, 1,
0.8270381, 0.3978886, 2.588528, 1, 1, 1, 1, 1,
0.8372412, -0.2255926, 0.3394333, 1, 1, 1, 1, 1,
0.8441699, 1.146932, 1.738674, 1, 1, 1, 1, 1,
0.8470404, 0.89064, 1.332919, 1, 1, 1, 1, 1,
0.8535027, -0.2528342, 0.2914486, 1, 1, 1, 1, 1,
0.8539913, 0.0731492, 2.805992, 1, 1, 1, 1, 1,
0.8554811, 1.132021, 2.478616, 1, 1, 1, 1, 1,
0.8581224, 0.1371368, 0.7029804, 1, 1, 1, 1, 1,
0.8608624, 1.155746, -1.142752, 0, 0, 1, 1, 1,
0.8670791, 0.6789083, 0.02510698, 1, 0, 0, 1, 1,
0.8678057, -0.09744746, 0.8243085, 1, 0, 0, 1, 1,
0.8697114, 0.8113369, 0.9858974, 1, 0, 0, 1, 1,
0.8741965, 0.5415663, 1.896986, 1, 0, 0, 1, 1,
0.8806822, -1.916524, 3.778342, 1, 0, 0, 1, 1,
0.8814886, -1.616983, 1.076623, 0, 0, 0, 1, 1,
0.8826371, -0.2363933, 1.425268, 0, 0, 0, 1, 1,
0.8957891, -1.43488, 2.76726, 0, 0, 0, 1, 1,
0.8959911, -1.288, 2.7943, 0, 0, 0, 1, 1,
0.9059807, 0.3371812, 2.18364, 0, 0, 0, 1, 1,
0.9073731, -0.2830407, 2.355634, 0, 0, 0, 1, 1,
0.9094557, 0.5793269, 1.747416, 0, 0, 0, 1, 1,
0.9095291, 0.05154506, 3.349217, 1, 1, 1, 1, 1,
0.9106725, -0.1366313, 2.433242, 1, 1, 1, 1, 1,
0.9108075, -1.073692, 1.339604, 1, 1, 1, 1, 1,
0.9111645, 0.5239256, 1.50612, 1, 1, 1, 1, 1,
0.9200548, -0.8043332, 2.857876, 1, 1, 1, 1, 1,
0.9206885, -0.6714452, 2.001969, 1, 1, 1, 1, 1,
0.9228699, 0.9674577, 2.403743, 1, 1, 1, 1, 1,
0.9258937, 1.197091, -0.09053804, 1, 1, 1, 1, 1,
0.9297866, -0.2506503, 2.68918, 1, 1, 1, 1, 1,
0.9316107, -0.7986553, 4.490188, 1, 1, 1, 1, 1,
0.9320677, -1.031387, 3.002938, 1, 1, 1, 1, 1,
0.9342888, 0.3958407, 0.9195134, 1, 1, 1, 1, 1,
0.9421825, 1.005925, 1.589242, 1, 1, 1, 1, 1,
0.9474574, -0.3071543, 1.842777, 1, 1, 1, 1, 1,
0.9503043, 0.4226791, 1.2057, 1, 1, 1, 1, 1,
0.9518725, -1.31929, 0.4291589, 0, 0, 1, 1, 1,
0.9585412, 0.2144481, 1.498412, 1, 0, 0, 1, 1,
0.9661332, 1.185291, 0.8932071, 1, 0, 0, 1, 1,
0.9673479, -0.0657444, 2.639197, 1, 0, 0, 1, 1,
0.9698882, -2.750761, 3.191244, 1, 0, 0, 1, 1,
0.9720117, -0.8435002, 2.845166, 1, 0, 0, 1, 1,
0.9767005, 0.432798, 0.4393303, 0, 0, 0, 1, 1,
0.9777593, 1.176969, -0.3302409, 0, 0, 0, 1, 1,
0.983509, -0.5465195, 1.270026, 0, 0, 0, 1, 1,
0.9854881, 0.2476077, 2.515377, 0, 0, 0, 1, 1,
0.9938199, -1.90805, 1.382161, 0, 0, 0, 1, 1,
0.996187, -1.136974, 2.335768, 0, 0, 0, 1, 1,
0.9995104, -0.7284927, 0.4532954, 0, 0, 0, 1, 1,
0.9995871, -3.179496, 0.9442165, 1, 1, 1, 1, 1,
1.00094, -0.5615642, 0.1432446, 1, 1, 1, 1, 1,
1.003777, 1.057745, -0.5722063, 1, 1, 1, 1, 1,
1.009847, 1.400747, 0.780826, 1, 1, 1, 1, 1,
1.010694, -0.7676763, 2.253711, 1, 1, 1, 1, 1,
1.013692, -0.3177546, 1.548115, 1, 1, 1, 1, 1,
1.019397, -0.1217987, 1.979523, 1, 1, 1, 1, 1,
1.019434, 0.04936821, -0.08007772, 1, 1, 1, 1, 1,
1.020272, 0.1050311, 2.187094, 1, 1, 1, 1, 1,
1.025193, -0.3212187, 1.941258, 1, 1, 1, 1, 1,
1.031795, 1.3138, -0.4252287, 1, 1, 1, 1, 1,
1.037701, 0.7119865, 3.148932, 1, 1, 1, 1, 1,
1.040395, -0.1706851, 1.827464, 1, 1, 1, 1, 1,
1.040762, -0.9956328, 3.116567, 1, 1, 1, 1, 1,
1.041694, 0.4180016, 0.01191751, 1, 1, 1, 1, 1,
1.046494, -0.2684761, 0.3358727, 0, 0, 1, 1, 1,
1.048706, 0.3726748, 2.237771, 1, 0, 0, 1, 1,
1.049876, -1.158952, 2.550583, 1, 0, 0, 1, 1,
1.052676, 0.9332677, 0.8780819, 1, 0, 0, 1, 1,
1.063175, -1.562578, 1.601975, 1, 0, 0, 1, 1,
1.066364, 0.1666826, 0.4203789, 1, 0, 0, 1, 1,
1.06659, 2.81056, -0.2350064, 0, 0, 0, 1, 1,
1.066645, 0.1158998, 2.389046, 0, 0, 0, 1, 1,
1.067977, -0.1253215, 3.449004, 0, 0, 0, 1, 1,
1.071955, 1.486698, -0.4609464, 0, 0, 0, 1, 1,
1.072994, -0.7549114, 2.667029, 0, 0, 0, 1, 1,
1.07573, 0.1023718, 0.8320472, 0, 0, 0, 1, 1,
1.083391, 1.256272, 0.7583224, 0, 0, 0, 1, 1,
1.08926, -0.8372117, 3.675858, 1, 1, 1, 1, 1,
1.104308, -0.2090844, 1.247099, 1, 1, 1, 1, 1,
1.106034, -0.7867573, 3.702206, 1, 1, 1, 1, 1,
1.111635, 0.8926213, 1.84233, 1, 1, 1, 1, 1,
1.117461, 1.855096, 1.257746, 1, 1, 1, 1, 1,
1.117547, 0.7244205, 0.5277084, 1, 1, 1, 1, 1,
1.118383, -0.7976171, 2.047591, 1, 1, 1, 1, 1,
1.120043, -0.7034093, 3.380159, 1, 1, 1, 1, 1,
1.122548, 0.9342951, 1.004416, 1, 1, 1, 1, 1,
1.132867, 0.4549166, 2.321359, 1, 1, 1, 1, 1,
1.138119, 1.083857, 3.351145, 1, 1, 1, 1, 1,
1.14815, 0.02940172, 1.457303, 1, 1, 1, 1, 1,
1.157264, -2.244582, 2.910733, 1, 1, 1, 1, 1,
1.166957, -0.2428599, 0.809268, 1, 1, 1, 1, 1,
1.16738, 0.8630335, 2.120416, 1, 1, 1, 1, 1,
1.175248, -2.635601, 1.385114, 0, 0, 1, 1, 1,
1.181216, -1.356541, 1.139419, 1, 0, 0, 1, 1,
1.181407, -1.569044, 3.286095, 1, 0, 0, 1, 1,
1.182813, 0.4895693, 0.08386299, 1, 0, 0, 1, 1,
1.185261, 0.4291615, 0.07330719, 1, 0, 0, 1, 1,
1.185493, 0.5681037, 0.903973, 1, 0, 0, 1, 1,
1.192462, -2.076257, 0.8450437, 0, 0, 0, 1, 1,
1.192904, -0.2934819, 1.738743, 0, 0, 0, 1, 1,
1.193225, 0.4014975, 0.8081796, 0, 0, 0, 1, 1,
1.197239, -0.2746551, 2.208676, 0, 0, 0, 1, 1,
1.201269, 1.181825, 0.1801601, 0, 0, 0, 1, 1,
1.21707, -1.054021, 2.072494, 0, 0, 0, 1, 1,
1.224835, 1.599131, 0.1696082, 0, 0, 0, 1, 1,
1.234457, 0.8172675, -0.6635388, 1, 1, 1, 1, 1,
1.241176, -0.2210681, 2.63049, 1, 1, 1, 1, 1,
1.243115, -0.1848426, 1.742232, 1, 1, 1, 1, 1,
1.249708, -1.417905, 2.65994, 1, 1, 1, 1, 1,
1.25642, 0.3599671, 0.5198871, 1, 1, 1, 1, 1,
1.27147, 1.123337, 0.2075998, 1, 1, 1, 1, 1,
1.277053, 0.9760246, 2.767726, 1, 1, 1, 1, 1,
1.280205, 0.7995745, 2.056329, 1, 1, 1, 1, 1,
1.28292, -0.1129311, 2.632495, 1, 1, 1, 1, 1,
1.285118, -0.4051771, 2.260031, 1, 1, 1, 1, 1,
1.299509, -0.6353428, 3.014563, 1, 1, 1, 1, 1,
1.300431, 0.6624581, 1.72625, 1, 1, 1, 1, 1,
1.30729, -0.885291, 2.712387, 1, 1, 1, 1, 1,
1.317232, 0.333564, 1.626624, 1, 1, 1, 1, 1,
1.317311, 0.4422897, 0.7816495, 1, 1, 1, 1, 1,
1.334789, -0.6820863, 3.430287, 0, 0, 1, 1, 1,
1.336375, 1.049524, 1.436521, 1, 0, 0, 1, 1,
1.340495, -0.4178421, 2.646516, 1, 0, 0, 1, 1,
1.359684, 0.3552772, 1.176077, 1, 0, 0, 1, 1,
1.363551, -1.019809, 0.8804017, 1, 0, 0, 1, 1,
1.366745, 0.5330811, 2.678644, 1, 0, 0, 1, 1,
1.367931, -0.3387374, 1.73911, 0, 0, 0, 1, 1,
1.371872, 2.148757, -0.5215082, 0, 0, 0, 1, 1,
1.373766, -0.3776161, 2.2357, 0, 0, 0, 1, 1,
1.376148, 2.746623, 0.4647291, 0, 0, 0, 1, 1,
1.380726, 0.9302639, -1.074972, 0, 0, 0, 1, 1,
1.387824, 0.391151, 0.696012, 0, 0, 0, 1, 1,
1.396211, -1.489287, 1.969093, 0, 0, 0, 1, 1,
1.400047, 1.265762, 0.1695103, 1, 1, 1, 1, 1,
1.413002, 1.277235, 0.4360427, 1, 1, 1, 1, 1,
1.423742, 1.363149, 0.07592648, 1, 1, 1, 1, 1,
1.426471, -1.034689, 2.86277, 1, 1, 1, 1, 1,
1.429783, 0.1811124, 3.219744, 1, 1, 1, 1, 1,
1.431449, -0.6042649, 1.188654, 1, 1, 1, 1, 1,
1.441945, 0.5243922, 0.4725494, 1, 1, 1, 1, 1,
1.459473, -0.6978527, 2.713361, 1, 1, 1, 1, 1,
1.462786, 0.2008924, 0.5423291, 1, 1, 1, 1, 1,
1.472316, -0.4292617, 1.990811, 1, 1, 1, 1, 1,
1.493523, 0.5679763, 1.398297, 1, 1, 1, 1, 1,
1.498777, -0.4977123, 3.417104, 1, 1, 1, 1, 1,
1.522494, -0.8609813, 2.542493, 1, 1, 1, 1, 1,
1.52388, -0.4479884, 1.975653, 1, 1, 1, 1, 1,
1.5346, -1.554697, 2.996799, 1, 1, 1, 1, 1,
1.550096, -0.9020401, 2.932551, 0, 0, 1, 1, 1,
1.570822, -0.3164782, 2.356634, 1, 0, 0, 1, 1,
1.572445, -1.452264, 4.564829, 1, 0, 0, 1, 1,
1.58369, 0.1118103, 1.917189, 1, 0, 0, 1, 1,
1.59159, 0.520291, 0.9693148, 1, 0, 0, 1, 1,
1.592728, -0.9254962, 1.258034, 1, 0, 0, 1, 1,
1.597232, 0.8732182, 1.985733, 0, 0, 0, 1, 1,
1.60154, -0.3279033, 2.095583, 0, 0, 0, 1, 1,
1.602401, 0.965492, 2.072403, 0, 0, 0, 1, 1,
1.642515, -0.4067756, -0.01582476, 0, 0, 0, 1, 1,
1.64949, 0.1239675, -0.08568599, 0, 0, 0, 1, 1,
1.659501, 1.12521, 0.2176569, 0, 0, 0, 1, 1,
1.661167, 1.52449, 0.3654214, 0, 0, 0, 1, 1,
1.664485, 0.4032829, 0.9001166, 1, 1, 1, 1, 1,
1.694545, -0.05802619, -0.219994, 1, 1, 1, 1, 1,
1.708865, 1.158644, 0.943871, 1, 1, 1, 1, 1,
1.733997, -0.724201, -0.2599895, 1, 1, 1, 1, 1,
1.736726, 1.560446, 1.27888, 1, 1, 1, 1, 1,
1.736966, 0.5715106, 2.294756, 1, 1, 1, 1, 1,
1.776305, 0.3108809, -0.6613223, 1, 1, 1, 1, 1,
1.832175, -2.261686, 3.453291, 1, 1, 1, 1, 1,
1.912928, -1.265196, 2.967363, 1, 1, 1, 1, 1,
1.920843, -0.01722722, 1.068523, 1, 1, 1, 1, 1,
1.947958, -0.1268189, 0.2782454, 1, 1, 1, 1, 1,
1.966709, -0.1192967, 2.068243, 1, 1, 1, 1, 1,
1.968309, -0.1524261, 1.667333, 1, 1, 1, 1, 1,
1.980028, -0.8876074, 1.498956, 1, 1, 1, 1, 1,
2.020866, 0.1696395, 1.241914, 1, 1, 1, 1, 1,
2.03085, 1.384497, 0.7919632, 0, 0, 1, 1, 1,
2.035052, -1.371653, 1.799002, 1, 0, 0, 1, 1,
2.092771, -0.6519825, 2.721428, 1, 0, 0, 1, 1,
2.100353, -0.7261338, 1.973748, 1, 0, 0, 1, 1,
2.168627, 1.903523, -0.723362, 1, 0, 0, 1, 1,
2.291084, 0.5325601, 2.553959, 1, 0, 0, 1, 1,
2.311266, 1.37901, 0.4942572, 0, 0, 0, 1, 1,
2.391039, 1.756886, 2.36948, 0, 0, 0, 1, 1,
2.411093, -0.450367, -1.140185, 0, 0, 0, 1, 1,
2.418158, 0.00476283, 2.133237, 0, 0, 0, 1, 1,
2.431535, -0.5504603, 1.200648, 0, 0, 0, 1, 1,
2.434324, 0.6084888, 2.119898, 0, 0, 0, 1, 1,
2.446914, -0.9692028, 3.901204, 0, 0, 0, 1, 1,
2.458136, 1.204912, -0.2816925, 1, 1, 1, 1, 1,
2.470161, 1.485408, 0.7816516, 1, 1, 1, 1, 1,
2.554099, -0.9722719, 0.1043414, 1, 1, 1, 1, 1,
2.724187, -0.6505504, 0.9318149, 1, 1, 1, 1, 1,
2.745701, -0.6155968, 1.520009, 1, 1, 1, 1, 1,
2.778757, -1.33223, 2.818488, 1, 1, 1, 1, 1,
2.916556, 0.3141851, 1.901782, 1, 1, 1, 1, 1
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
var radius = 9.652709;
var distance = 33.90473;
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
mvMatrix.translate( 0.2203915, -0.1315665, 0.6480284 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.90473);
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
