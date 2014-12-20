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
-3.220946, -0.2597409, -2.86264, 1, 0, 0, 1,
-2.756794, -0.5665382, -1.775666, 1, 0.007843138, 0, 1,
-2.593675, 0.2244034, -3.180278, 1, 0.01176471, 0, 1,
-2.426617, 0.1447177, -2.390053, 1, 0.01960784, 0, 1,
-2.369443, 0.3354459, -0.7038313, 1, 0.02352941, 0, 1,
-2.297528, 0.4172542, -1.660852, 1, 0.03137255, 0, 1,
-2.290757, 0.3189836, -1.294364, 1, 0.03529412, 0, 1,
-2.268713, -1.270637, -2.271356, 1, 0.04313726, 0, 1,
-2.128116, 0.8166567, -1.386422, 1, 0.04705882, 0, 1,
-2.115716, -0.522741, -1.927019, 1, 0.05490196, 0, 1,
-2.074213, -2.295074, -2.653798, 1, 0.05882353, 0, 1,
-2.065643, -0.3990206, -3.513722, 1, 0.06666667, 0, 1,
-2.056407, -1.43649, -3.292372, 1, 0.07058824, 0, 1,
-2.033942, -0.3256458, -0.8682916, 1, 0.07843138, 0, 1,
-2.020133, -0.8680257, -1.651163, 1, 0.08235294, 0, 1,
-1.995633, 0.3449729, -1.570282, 1, 0.09019608, 0, 1,
-1.993029, -1.526378, -0.8006919, 1, 0.09411765, 0, 1,
-1.965007, 1.324059, 0.2418234, 1, 0.1019608, 0, 1,
-1.96006, -0.5692371, -0.3678513, 1, 0.1098039, 0, 1,
-1.947412, -1.551615, -2.130975, 1, 0.1137255, 0, 1,
-1.942551, 0.2719115, -1.411731, 1, 0.1215686, 0, 1,
-1.879379, -0.7953113, -3.968742, 1, 0.1254902, 0, 1,
-1.86556, 0.8877105, -2.982185, 1, 0.1333333, 0, 1,
-1.864057, -0.3556212, -1.999343, 1, 0.1372549, 0, 1,
-1.860601, -0.1941488, -2.071112, 1, 0.145098, 0, 1,
-1.847726, 0.1619335, -2.107974, 1, 0.1490196, 0, 1,
-1.825174, -1.025306, -1.218605, 1, 0.1568628, 0, 1,
-1.802632, -0.4645725, -0.777164, 1, 0.1607843, 0, 1,
-1.801841, 0.9705117, -0.1941753, 1, 0.1686275, 0, 1,
-1.797789, 0.4629139, -2.390181, 1, 0.172549, 0, 1,
-1.792706, -1.275287, -2.521234, 1, 0.1803922, 0, 1,
-1.781386, -1.160587, -4.077489, 1, 0.1843137, 0, 1,
-1.757868, 0.528162, -1.001637, 1, 0.1921569, 0, 1,
-1.756624, -1.196474, -2.442941, 1, 0.1960784, 0, 1,
-1.751653, 1.76023, -0.1332084, 1, 0.2039216, 0, 1,
-1.749856, 0.04881094, -1.357017, 1, 0.2117647, 0, 1,
-1.746662, 0.3497608, -0.4379715, 1, 0.2156863, 0, 1,
-1.724752, 0.321812, 1.059503, 1, 0.2235294, 0, 1,
-1.724149, 0.7786505, -0.8631225, 1, 0.227451, 0, 1,
-1.714258, -1.804435, -1.563124, 1, 0.2352941, 0, 1,
-1.70821, 0.5345894, -2.035975, 1, 0.2392157, 0, 1,
-1.696725, -1.428258, -0.2324203, 1, 0.2470588, 0, 1,
-1.687268, 0.07454302, 0.7106671, 1, 0.2509804, 0, 1,
-1.682643, -0.4202826, -0.8128549, 1, 0.2588235, 0, 1,
-1.678743, -1.042166, -2.86963, 1, 0.2627451, 0, 1,
-1.673565, 0.3630098, -2.584627, 1, 0.2705882, 0, 1,
-1.656321, 0.6342211, -0.6940927, 1, 0.2745098, 0, 1,
-1.645408, -0.354858, -2.601684, 1, 0.282353, 0, 1,
-1.627516, -0.4655032, -0.1709793, 1, 0.2862745, 0, 1,
-1.615424, 0.3789493, -1.287295, 1, 0.2941177, 0, 1,
-1.594176, 0.9014646, -1.640079, 1, 0.3019608, 0, 1,
-1.590334, -1.694545, -1.104416, 1, 0.3058824, 0, 1,
-1.583583, 0.1853937, -1.378675, 1, 0.3137255, 0, 1,
-1.583532, -0.02808792, -1.180152, 1, 0.3176471, 0, 1,
-1.579476, 0.2459219, -0.9620219, 1, 0.3254902, 0, 1,
-1.562548, 2.247802, 0.33885, 1, 0.3294118, 0, 1,
-1.561417, -1.394165, -1.063537, 1, 0.3372549, 0, 1,
-1.544321, -1.865978, -2.805068, 1, 0.3411765, 0, 1,
-1.543673, 0.632552, -2.992919, 1, 0.3490196, 0, 1,
-1.543366, -1.455359, -2.11495, 1, 0.3529412, 0, 1,
-1.533561, 0.5583454, -4.451557, 1, 0.3607843, 0, 1,
-1.520238, -2.32507, -1.94619, 1, 0.3647059, 0, 1,
-1.515383, -0.1808892, -1.39143, 1, 0.372549, 0, 1,
-1.506689, -1.010243, -3.469413, 1, 0.3764706, 0, 1,
-1.505735, -0.4032834, -1.442875, 1, 0.3843137, 0, 1,
-1.502923, 0.595603, -2.107276, 1, 0.3882353, 0, 1,
-1.501424, 0.3443232, -1.926117, 1, 0.3960784, 0, 1,
-1.498688, 0.743636, -0.1895972, 1, 0.4039216, 0, 1,
-1.486212, 1.269544, -2.16053, 1, 0.4078431, 0, 1,
-1.484025, 0.5295725, -0.6375131, 1, 0.4156863, 0, 1,
-1.482453, 1.896088, 0.4413807, 1, 0.4196078, 0, 1,
-1.478354, 0.7643442, -0.5575975, 1, 0.427451, 0, 1,
-1.476114, -0.6649352, -2.406645, 1, 0.4313726, 0, 1,
-1.446619, 1.283884, -2.74421, 1, 0.4392157, 0, 1,
-1.439609, -1.37634, -1.697643, 1, 0.4431373, 0, 1,
-1.43507, 0.3902138, -1.261762, 1, 0.4509804, 0, 1,
-1.429728, 0.3578296, -2.613021, 1, 0.454902, 0, 1,
-1.423923, -1.083772, -2.53175, 1, 0.4627451, 0, 1,
-1.418869, -0.8307852, -1.530087, 1, 0.4666667, 0, 1,
-1.416305, 0.145611, -0.7738389, 1, 0.4745098, 0, 1,
-1.414276, 0.1523312, -1.106543, 1, 0.4784314, 0, 1,
-1.405868, 2.365319, -2.086007, 1, 0.4862745, 0, 1,
-1.405028, 0.8217032, -0.6163441, 1, 0.4901961, 0, 1,
-1.395433, -0.07524199, -1.554643, 1, 0.4980392, 0, 1,
-1.382584, -1.623984, -4.809732, 1, 0.5058824, 0, 1,
-1.37416, -0.438583, -1.057742, 1, 0.509804, 0, 1,
-1.369871, -0.715676, -3.813762, 1, 0.5176471, 0, 1,
-1.369787, 1.197471, -1.255361, 1, 0.5215687, 0, 1,
-1.368736, -0.3072597, -1.335263, 1, 0.5294118, 0, 1,
-1.357335, -1.67344, -2.165008, 1, 0.5333334, 0, 1,
-1.354908, 0.4936237, -1.418769, 1, 0.5411765, 0, 1,
-1.345755, 0.6921918, 0.5900536, 1, 0.5450981, 0, 1,
-1.338858, 0.05740051, -2.121353, 1, 0.5529412, 0, 1,
-1.330303, -0.796121, -1.411816, 1, 0.5568628, 0, 1,
-1.320652, 0.9235477, 0.8557954, 1, 0.5647059, 0, 1,
-1.318801, 0.8113227, -1.637146, 1, 0.5686275, 0, 1,
-1.305971, 0.7912104, -0.4816825, 1, 0.5764706, 0, 1,
-1.305879, 1.600867, 0.9167293, 1, 0.5803922, 0, 1,
-1.302463, 0.319218, -1.349404, 1, 0.5882353, 0, 1,
-1.292746, 0.3265844, -1.183398, 1, 0.5921569, 0, 1,
-1.283375, 0.3959787, -0.8477113, 1, 0.6, 0, 1,
-1.277712, -0.6505821, -0.2664138, 1, 0.6078432, 0, 1,
-1.277168, -1.95036, -2.059013, 1, 0.6117647, 0, 1,
-1.276237, 0.9955543, 0.3949168, 1, 0.6196079, 0, 1,
-1.259976, 0.1783372, -1.648658, 1, 0.6235294, 0, 1,
-1.256537, -1.019014, -2.282777, 1, 0.6313726, 0, 1,
-1.252649, -0.555859, -2.435793, 1, 0.6352941, 0, 1,
-1.239245, -0.1891839, -1.748081, 1, 0.6431373, 0, 1,
-1.2362, -0.2051764, -4.105347, 1, 0.6470588, 0, 1,
-1.229373, 0.719611, -1.407453, 1, 0.654902, 0, 1,
-1.223493, -0.7341308, -2.968901, 1, 0.6588235, 0, 1,
-1.220979, 1.595724, -0.6045343, 1, 0.6666667, 0, 1,
-1.212417, -1.281503, -4.183111, 1, 0.6705883, 0, 1,
-1.212013, 0.7517664, -0.226926, 1, 0.6784314, 0, 1,
-1.198243, 1.008919, -0.7906844, 1, 0.682353, 0, 1,
-1.196224, -1.265063, -1.900705, 1, 0.6901961, 0, 1,
-1.1779, 1.804344, -0.541331, 1, 0.6941177, 0, 1,
-1.169948, 1.590876, 0.4423371, 1, 0.7019608, 0, 1,
-1.161568, 0.2336661, -0.6698587, 1, 0.7098039, 0, 1,
-1.158342, -1.981834, -3.831856, 1, 0.7137255, 0, 1,
-1.153777, 0.7563748, -2.413654, 1, 0.7215686, 0, 1,
-1.151126, 0.4619766, -1.410789, 1, 0.7254902, 0, 1,
-1.150282, -0.3174419, -1.202516, 1, 0.7333333, 0, 1,
-1.143424, -0.6767436, -2.161, 1, 0.7372549, 0, 1,
-1.137217, 0.7176951, -0.7525192, 1, 0.7450981, 0, 1,
-1.132478, -0.7925585, -2.944615, 1, 0.7490196, 0, 1,
-1.128739, -0.8869424, -2.982707, 1, 0.7568628, 0, 1,
-1.124418, 0.4507292, -0.5447555, 1, 0.7607843, 0, 1,
-1.122226, -0.1657186, -2.25948, 1, 0.7686275, 0, 1,
-1.116715, 1.727914, 0.6336448, 1, 0.772549, 0, 1,
-1.114549, 1.272934, -1.39433, 1, 0.7803922, 0, 1,
-1.111965, 1.320153, -0.4326921, 1, 0.7843137, 0, 1,
-1.105152, -0.6321515, -2.519832, 1, 0.7921569, 0, 1,
-1.098725, -0.5762209, -2.651755, 1, 0.7960784, 0, 1,
-1.09799, 0.1135254, -2.575487, 1, 0.8039216, 0, 1,
-1.095731, 1.509157, -1.900047, 1, 0.8117647, 0, 1,
-1.088308, -0.06847461, -0.3657583, 1, 0.8156863, 0, 1,
-1.075765, -1.548562, -1.468468, 1, 0.8235294, 0, 1,
-1.072523, 0.828185, 0.06281471, 1, 0.827451, 0, 1,
-1.067782, 0.2898083, -2.311899, 1, 0.8352941, 0, 1,
-1.061487, -1.136532, -2.083826, 1, 0.8392157, 0, 1,
-1.058417, -0.4444473, -3.889568, 1, 0.8470588, 0, 1,
-1.05762, 1.511135, 0.1282052, 1, 0.8509804, 0, 1,
-1.055975, -1.228931, -1.572855, 1, 0.8588235, 0, 1,
-1.04825, -0.6697807, -0.7020273, 1, 0.8627451, 0, 1,
-1.044282, 1.254772, -2.20208, 1, 0.8705882, 0, 1,
-1.034752, 0.2829753, -1.968494, 1, 0.8745098, 0, 1,
-1.032613, 0.4267898, -0.6328803, 1, 0.8823529, 0, 1,
-1.027743, 0.04111727, -1.007325, 1, 0.8862745, 0, 1,
-1.022777, 3.191081, -1.843164, 1, 0.8941177, 0, 1,
-1.017571, 1.012158, -0.9606401, 1, 0.8980392, 0, 1,
-1.011232, 1.75406, -1.172379, 1, 0.9058824, 0, 1,
-1.008033, -0.8586369, -2.280573, 1, 0.9137255, 0, 1,
-1.002903, 0.7224385, -1.596311, 1, 0.9176471, 0, 1,
-1.000917, -0.234367, -1.525287, 1, 0.9254902, 0, 1,
-0.9969795, -0.5999401, -1.702301, 1, 0.9294118, 0, 1,
-0.9965249, -1.348823, -1.395337, 1, 0.9372549, 0, 1,
-0.9922443, 1.242766, -1.941419, 1, 0.9411765, 0, 1,
-0.9802098, 1.209502, -0.9332852, 1, 0.9490196, 0, 1,
-0.9794014, 0.03770405, -1.589381, 1, 0.9529412, 0, 1,
-0.9784395, 0.8712314, 0.09454795, 1, 0.9607843, 0, 1,
-0.9733144, 0.7770055, -0.3964712, 1, 0.9647059, 0, 1,
-0.9721324, 2.5028, -0.1458217, 1, 0.972549, 0, 1,
-0.969851, 0.3727438, 0.4665207, 1, 0.9764706, 0, 1,
-0.9689471, -0.5146955, -2.36898, 1, 0.9843137, 0, 1,
-0.9642984, -0.6135234, -2.400694, 1, 0.9882353, 0, 1,
-0.9610118, 0.2465351, -0.569583, 1, 0.9960784, 0, 1,
-0.9589155, -1.275295, -2.324291, 0.9960784, 1, 0, 1,
-0.9582934, -1.355651, -2.01087, 0.9921569, 1, 0, 1,
-0.958015, -0.1572449, -0.5620887, 0.9843137, 1, 0, 1,
-0.9561787, -1.489813, -3.396507, 0.9803922, 1, 0, 1,
-0.9491605, 1.002954, 0.4446871, 0.972549, 1, 0, 1,
-0.9486098, -0.2267491, -2.550519, 0.9686275, 1, 0, 1,
-0.9466236, -1.049646, -2.451781, 0.9607843, 1, 0, 1,
-0.9328608, 0.8429031, -0.9107476, 0.9568627, 1, 0, 1,
-0.9323817, 1.810407, -1.200854, 0.9490196, 1, 0, 1,
-0.9309832, -1.858579, -1.018685, 0.945098, 1, 0, 1,
-0.92805, -0.00128098, -2.834174, 0.9372549, 1, 0, 1,
-0.9279748, 1.51562, -0.1738575, 0.9333333, 1, 0, 1,
-0.9219187, 0.1357341, -0.5455625, 0.9254902, 1, 0, 1,
-0.9186497, 0.4333472, -0.6186032, 0.9215686, 1, 0, 1,
-0.9156332, 1.320801, 0.2643032, 0.9137255, 1, 0, 1,
-0.9155332, -0.1592017, -3.196332, 0.9098039, 1, 0, 1,
-0.9090679, -0.9677795, -2.469355, 0.9019608, 1, 0, 1,
-0.9084515, -0.4821783, -1.793836, 0.8941177, 1, 0, 1,
-0.9080645, -0.1931747, -2.179369, 0.8901961, 1, 0, 1,
-0.9064998, 0.3088128, -0.774694, 0.8823529, 1, 0, 1,
-0.9030265, 1.241617, 1.473661, 0.8784314, 1, 0, 1,
-0.9025401, 0.4764494, -1.19855, 0.8705882, 1, 0, 1,
-0.9010674, 2.606697, 1.216861, 0.8666667, 1, 0, 1,
-0.8943897, -0.1873817, -2.715124, 0.8588235, 1, 0, 1,
-0.8930401, -0.8003491, -1.812817, 0.854902, 1, 0, 1,
-0.8923147, -0.7794542, -0.5587408, 0.8470588, 1, 0, 1,
-0.8918898, -1.58343, -3.449465, 0.8431373, 1, 0, 1,
-0.8879464, -1.034953, -3.068293, 0.8352941, 1, 0, 1,
-0.8825737, -0.5269653, -1.709628, 0.8313726, 1, 0, 1,
-0.8782367, -0.03178611, -1.419886, 0.8235294, 1, 0, 1,
-0.8766671, -0.1500167, -1.434207, 0.8196079, 1, 0, 1,
-0.8759751, -0.9279895, -2.306034, 0.8117647, 1, 0, 1,
-0.8757538, -0.02150079, -3.418543, 0.8078431, 1, 0, 1,
-0.8695151, -1.150154, -1.886849, 0.8, 1, 0, 1,
-0.8695077, -1.732143, -3.944853, 0.7921569, 1, 0, 1,
-0.8693259, 0.2094514, -1.061489, 0.7882353, 1, 0, 1,
-0.8684933, -0.5835291, -2.119297, 0.7803922, 1, 0, 1,
-0.8684274, 0.3013623, -2.701488, 0.7764706, 1, 0, 1,
-0.8607495, -0.2936895, -1.71224, 0.7686275, 1, 0, 1,
-0.8598123, 0.8798538, 0.9610715, 0.7647059, 1, 0, 1,
-0.8583446, -1.069252, -3.427321, 0.7568628, 1, 0, 1,
-0.8558759, -1.77806, -2.874421, 0.7529412, 1, 0, 1,
-0.8513452, -0.9089307, -1.850316, 0.7450981, 1, 0, 1,
-0.8506699, 1.334943, -1.64346, 0.7411765, 1, 0, 1,
-0.8490624, 0.7658686, -1.449903, 0.7333333, 1, 0, 1,
-0.8480226, 1.038733, -1.151251, 0.7294118, 1, 0, 1,
-0.8439872, -0.3955627, -2.464846, 0.7215686, 1, 0, 1,
-0.8360997, 0.5303852, -0.3942259, 0.7176471, 1, 0, 1,
-0.8271948, 0.2940948, -1.003022, 0.7098039, 1, 0, 1,
-0.8233582, -0.234584, -1.139801, 0.7058824, 1, 0, 1,
-0.8210341, 0.4732106, -2.397511, 0.6980392, 1, 0, 1,
-0.8126836, 0.2596516, 1.707015, 0.6901961, 1, 0, 1,
-0.8078564, 2.076641, -0.1983466, 0.6862745, 1, 0, 1,
-0.8077557, 0.3134538, -2.889846, 0.6784314, 1, 0, 1,
-0.8029917, -0.5203327, -3.207225, 0.6745098, 1, 0, 1,
-0.8001031, 1.555745, -2.130699, 0.6666667, 1, 0, 1,
-0.7925156, 0.462714, -2.017048, 0.6627451, 1, 0, 1,
-0.7908068, 2.106196, -1.44099, 0.654902, 1, 0, 1,
-0.7900957, -0.4806578, -1.71632, 0.6509804, 1, 0, 1,
-0.7897237, -0.4126455, -2.963902, 0.6431373, 1, 0, 1,
-0.7893073, 0.01866412, -1.392359, 0.6392157, 1, 0, 1,
-0.7872628, -0.8323531, -3.704564, 0.6313726, 1, 0, 1,
-0.784373, 0.2587142, -2.314726, 0.627451, 1, 0, 1,
-0.7792403, 0.1630949, -0.1078351, 0.6196079, 1, 0, 1,
-0.7785259, -1.674129, -2.660455, 0.6156863, 1, 0, 1,
-0.7686482, -1.356188, -3.560209, 0.6078432, 1, 0, 1,
-0.7648848, 0.29609, -2.544043, 0.6039216, 1, 0, 1,
-0.7590465, -0.4343539, -0.1391914, 0.5960785, 1, 0, 1,
-0.7577887, -0.150401, -1.830852, 0.5882353, 1, 0, 1,
-0.7571646, -0.1276209, -0.5595977, 0.5843138, 1, 0, 1,
-0.7569376, -0.284902, -1.703215, 0.5764706, 1, 0, 1,
-0.7515472, 0.766298, -1.876551, 0.572549, 1, 0, 1,
-0.7512892, 0.4333481, -0.5962211, 0.5647059, 1, 0, 1,
-0.7406738, -2.371901, -1.482119, 0.5607843, 1, 0, 1,
-0.7394858, 0.4037639, -0.8108627, 0.5529412, 1, 0, 1,
-0.7388852, 1.522, -1.683622, 0.5490196, 1, 0, 1,
-0.7351556, 0.06911913, -2.769853, 0.5411765, 1, 0, 1,
-0.7316174, 0.8448145, -1.852241, 0.5372549, 1, 0, 1,
-0.7279664, 0.7857509, 0.7039959, 0.5294118, 1, 0, 1,
-0.7237881, -1.147446, -2.397794, 0.5254902, 1, 0, 1,
-0.7210495, 1.625156, 0.2656892, 0.5176471, 1, 0, 1,
-0.720426, 0.2738429, -0.9710227, 0.5137255, 1, 0, 1,
-0.7179806, -0.5028026, -1.750782, 0.5058824, 1, 0, 1,
-0.7179484, 0.4582295, -0.8676723, 0.5019608, 1, 0, 1,
-0.7170884, -0.6781712, -1.062348, 0.4941176, 1, 0, 1,
-0.7132394, -0.3413635, -0.8681253, 0.4862745, 1, 0, 1,
-0.6958276, 2.084771, -1.684152, 0.4823529, 1, 0, 1,
-0.6861175, 1.307207, -0.1741154, 0.4745098, 1, 0, 1,
-0.6769758, -0.3726636, 0.1284353, 0.4705882, 1, 0, 1,
-0.675678, 0.06232451, -2.054861, 0.4627451, 1, 0, 1,
-0.675396, -0.562869, -1.511458, 0.4588235, 1, 0, 1,
-0.673255, 1.047664, -1.063882, 0.4509804, 1, 0, 1,
-0.6719594, -0.144424, -2.040825, 0.4470588, 1, 0, 1,
-0.671581, 1.313743, 0.55272, 0.4392157, 1, 0, 1,
-0.6693568, -1.250125, -3.052888, 0.4352941, 1, 0, 1,
-0.668354, 1.146325, -0.1260183, 0.427451, 1, 0, 1,
-0.6606702, 1.112698, 0.04672196, 0.4235294, 1, 0, 1,
-0.6587076, 1.72722, 0.9891384, 0.4156863, 1, 0, 1,
-0.6571746, 0.3897191, -2.067057, 0.4117647, 1, 0, 1,
-0.6566077, -0.5909832, -1.924248, 0.4039216, 1, 0, 1,
-0.6545877, -0.4804254, -3.11395, 0.3960784, 1, 0, 1,
-0.6497403, 1.489185, -0.1696464, 0.3921569, 1, 0, 1,
-0.645092, -1.005473, -3.596577, 0.3843137, 1, 0, 1,
-0.6431376, -0.9758638, -3.186825, 0.3803922, 1, 0, 1,
-0.641432, -0.1860097, -1.580342, 0.372549, 1, 0, 1,
-0.6374385, 0.1116877, -1.669717, 0.3686275, 1, 0, 1,
-0.6269948, 1.414503, -0.6436286, 0.3607843, 1, 0, 1,
-0.6252836, 0.4174921, 0.2594469, 0.3568628, 1, 0, 1,
-0.6161569, 1.373045, 0.0831736, 0.3490196, 1, 0, 1,
-0.6159657, 1.046946, 0.9432681, 0.345098, 1, 0, 1,
-0.6154641, 0.5801091, -1.198632, 0.3372549, 1, 0, 1,
-0.6115018, -1.953947, -3.840178, 0.3333333, 1, 0, 1,
-0.6112449, 0.6332019, -2.147004, 0.3254902, 1, 0, 1,
-0.6100461, 0.1928481, -2.215665, 0.3215686, 1, 0, 1,
-0.6013782, -0.8996602, -3.32889, 0.3137255, 1, 0, 1,
-0.5994199, 0.2591668, 0.2336197, 0.3098039, 1, 0, 1,
-0.5962123, -0.7973878, -1.424069, 0.3019608, 1, 0, 1,
-0.5935724, -0.7382062, -3.819752, 0.2941177, 1, 0, 1,
-0.5909286, -1.266363, -4.792802, 0.2901961, 1, 0, 1,
-0.5834376, 1.939797, 1.371208, 0.282353, 1, 0, 1,
-0.5824341, 1.624848, 0.02701821, 0.2784314, 1, 0, 1,
-0.5813552, -0.247106, -1.952803, 0.2705882, 1, 0, 1,
-0.5812265, -0.5184485, -0.8248784, 0.2666667, 1, 0, 1,
-0.5798735, 1.224092, -0.4310385, 0.2588235, 1, 0, 1,
-0.5789188, -0.4640121, -1.806221, 0.254902, 1, 0, 1,
-0.5754245, -0.06218496, -1.779749, 0.2470588, 1, 0, 1,
-0.5748681, 0.2937549, 0.146745, 0.2431373, 1, 0, 1,
-0.5739585, 0.02510463, -2.820578, 0.2352941, 1, 0, 1,
-0.5724373, 0.8765357, -0.593594, 0.2313726, 1, 0, 1,
-0.5669659, 1.810428, 0.2532962, 0.2235294, 1, 0, 1,
-0.5644725, 1.371255, -1.324952, 0.2196078, 1, 0, 1,
-0.5613393, -1.292789, -1.438269, 0.2117647, 1, 0, 1,
-0.5582253, -0.720786, -2.198061, 0.2078431, 1, 0, 1,
-0.5556082, -0.6915255, -1.401387, 0.2, 1, 0, 1,
-0.5532038, -0.06504393, -0.9384828, 0.1921569, 1, 0, 1,
-0.5489445, 2.954947, -1.090833, 0.1882353, 1, 0, 1,
-0.5436475, -0.06604132, -2.324826, 0.1803922, 1, 0, 1,
-0.5433069, 0.7295907, -0.06594859, 0.1764706, 1, 0, 1,
-0.5364512, 1.392506, 0.5900976, 0.1686275, 1, 0, 1,
-0.5353336, 0.7220641, 0.1352149, 0.1647059, 1, 0, 1,
-0.5301937, -1.332881, -2.142519, 0.1568628, 1, 0, 1,
-0.5298654, 0.1226762, -1.541974, 0.1529412, 1, 0, 1,
-0.5243264, 1.3533, -0.5152471, 0.145098, 1, 0, 1,
-0.5210498, -0.5723252, -1.697541, 0.1411765, 1, 0, 1,
-0.5084314, -0.3099371, -2.445449, 0.1333333, 1, 0, 1,
-0.503781, 0.6337996, -1.595087, 0.1294118, 1, 0, 1,
-0.4966221, -1.785539, -2.132383, 0.1215686, 1, 0, 1,
-0.4914311, -0.09622863, -2.230087, 0.1176471, 1, 0, 1,
-0.4911999, 0.1181454, -1.646418, 0.1098039, 1, 0, 1,
-0.4807908, 0.3050262, -2.237446, 0.1058824, 1, 0, 1,
-0.4769295, 0.3565818, -0.4001277, 0.09803922, 1, 0, 1,
-0.4681494, -0.5840554, -2.797699, 0.09019608, 1, 0, 1,
-0.4667156, -0.660723, -4.12323, 0.08627451, 1, 0, 1,
-0.4658751, 0.1318777, 0.01953468, 0.07843138, 1, 0, 1,
-0.4617039, 0.03540427, -1.102323, 0.07450981, 1, 0, 1,
-0.4571792, -0.1057758, -2.154635, 0.06666667, 1, 0, 1,
-0.4569575, -1.806642, -1.857171, 0.0627451, 1, 0, 1,
-0.453754, 0.5399472, -0.5594151, 0.05490196, 1, 0, 1,
-0.4439523, -1.884153, -3.199258, 0.05098039, 1, 0, 1,
-0.4356487, -0.8498087, -1.92271, 0.04313726, 1, 0, 1,
-0.4350256, -0.03947416, -1.989352, 0.03921569, 1, 0, 1,
-0.4336201, 1.241838, -1.341067, 0.03137255, 1, 0, 1,
-0.4329928, -0.06856128, -1.603592, 0.02745098, 1, 0, 1,
-0.4291617, 0.04673703, -1.392929, 0.01960784, 1, 0, 1,
-0.4281047, -0.7017844, -1.85389, 0.01568628, 1, 0, 1,
-0.4229774, -0.5303413, -3.855414, 0.007843138, 1, 0, 1,
-0.420065, -1.297327, -1.953033, 0.003921569, 1, 0, 1,
-0.4172941, -0.07595667, -2.741916, 0, 1, 0.003921569, 1,
-0.4166951, -0.02673271, -2.666763, 0, 1, 0.01176471, 1,
-0.4125422, 0.3524236, -1.442064, 0, 1, 0.01568628, 1,
-0.4108749, -0.7964669, -0.9442878, 0, 1, 0.02352941, 1,
-0.4037763, -0.9411181, -3.662074, 0, 1, 0.02745098, 1,
-0.4025885, 1.031105, 1.5089, 0, 1, 0.03529412, 1,
-0.3949051, 1.028709, -0.8817174, 0, 1, 0.03921569, 1,
-0.3932831, -1.339335, -1.029816, 0, 1, 0.04705882, 1,
-0.3925137, 0.4417039, 0.5058153, 0, 1, 0.05098039, 1,
-0.3922893, 0.9808768, -0.009631636, 0, 1, 0.05882353, 1,
-0.3879042, 0.738688, -1.166052, 0, 1, 0.0627451, 1,
-0.3861686, -0.003739629, -3.30409, 0, 1, 0.07058824, 1,
-0.3762912, 1.818905, 0.125483, 0, 1, 0.07450981, 1,
-0.3732193, 1.092968, 0.4608675, 0, 1, 0.08235294, 1,
-0.3682832, -1.753693, -2.772503, 0, 1, 0.08627451, 1,
-0.3639835, 1.367272, -4.697795, 0, 1, 0.09411765, 1,
-0.3613228, 0.4095167, -0.2146464, 0, 1, 0.1019608, 1,
-0.3607437, -0.8880063, -3.567806, 0, 1, 0.1058824, 1,
-0.3599105, 0.6686948, -1.315259, 0, 1, 0.1137255, 1,
-0.3582477, 1.205823, -0.7417403, 0, 1, 0.1176471, 1,
-0.357894, 1.553243, -0.9734875, 0, 1, 0.1254902, 1,
-0.3554057, -0.4431719, -0.5159196, 0, 1, 0.1294118, 1,
-0.3548269, 0.5980631, -0.3232571, 0, 1, 0.1372549, 1,
-0.3508563, 1.226989, 0.04164673, 0, 1, 0.1411765, 1,
-0.3449271, -1.118452, -3.532753, 0, 1, 0.1490196, 1,
-0.3418157, -0.1238518, -1.624482, 0, 1, 0.1529412, 1,
-0.3412668, -0.5743465, -2.836582, 0, 1, 0.1607843, 1,
-0.3412488, -0.2717576, -2.789268, 0, 1, 0.1647059, 1,
-0.336157, -0.08850253, -2.523458, 0, 1, 0.172549, 1,
-0.3361329, -0.4714747, -2.675425, 0, 1, 0.1764706, 1,
-0.3348548, -0.04068784, -1.792827, 0, 1, 0.1843137, 1,
-0.3319308, -0.1609395, -3.363509, 0, 1, 0.1882353, 1,
-0.327731, 1.275141, -0.04350249, 0, 1, 0.1960784, 1,
-0.3262631, 0.06300312, 0.6947145, 0, 1, 0.2039216, 1,
-0.3254797, -1.716131, -4.175094, 0, 1, 0.2078431, 1,
-0.3213537, -0.1451157, -1.813068, 0, 1, 0.2156863, 1,
-0.3200552, -0.9594792, -2.136996, 0, 1, 0.2196078, 1,
-0.3183423, 0.9550155, -0.08402307, 0, 1, 0.227451, 1,
-0.3176853, -0.5954844, -2.148893, 0, 1, 0.2313726, 1,
-0.3127458, 0.3643082, -0.561043, 0, 1, 0.2392157, 1,
-0.3101, -0.1706134, -3.126566, 0, 1, 0.2431373, 1,
-0.3072254, 1.010266, -1.195934, 0, 1, 0.2509804, 1,
-0.306614, -1.861561, -2.383621, 0, 1, 0.254902, 1,
-0.3063187, 1.431265, -1.479083, 0, 1, 0.2627451, 1,
-0.3046593, -1.056869, -3.022599, 0, 1, 0.2666667, 1,
-0.3006007, -1.693367, -4.174235, 0, 1, 0.2745098, 1,
-0.2855628, -1.365388, -3.338443, 0, 1, 0.2784314, 1,
-0.2845208, 0.5913131, -0.9388304, 0, 1, 0.2862745, 1,
-0.2791289, 0.1397921, -0.2308827, 0, 1, 0.2901961, 1,
-0.278834, 0.1683616, -1.098225, 0, 1, 0.2980392, 1,
-0.2783213, -0.2270086, -4.178611, 0, 1, 0.3058824, 1,
-0.2782101, 0.5857617, -0.5081858, 0, 1, 0.3098039, 1,
-0.2770762, 0.9567072, -0.2906307, 0, 1, 0.3176471, 1,
-0.273597, 1.824201, -1.08526, 0, 1, 0.3215686, 1,
-0.2726323, 0.03874289, -1.723654, 0, 1, 0.3294118, 1,
-0.2699516, 0.596205, 0.2821248, 0, 1, 0.3333333, 1,
-0.2682843, -0.6884242, -1.684154, 0, 1, 0.3411765, 1,
-0.2682425, 1.012613, 0.5773745, 0, 1, 0.345098, 1,
-0.2658499, 1.832655, 1.964618, 0, 1, 0.3529412, 1,
-0.2650291, 0.1416289, 0.03834859, 0, 1, 0.3568628, 1,
-0.2586204, 0.5696788, -1.552336, 0, 1, 0.3647059, 1,
-0.2583335, 1.07912, 0.2953722, 0, 1, 0.3686275, 1,
-0.2543707, 0.4203123, -0.8719112, 0, 1, 0.3764706, 1,
-0.2438317, -0.5044644, -0.6626444, 0, 1, 0.3803922, 1,
-0.2393779, 0.03489823, -1.78822, 0, 1, 0.3882353, 1,
-0.2386303, 2.030087, -0.1015044, 0, 1, 0.3921569, 1,
-0.2355786, -0.6138123, -2.55153, 0, 1, 0.4, 1,
-0.233073, -1.43023, -1.749128, 0, 1, 0.4078431, 1,
-0.2316134, 1.226138, -0.8798543, 0, 1, 0.4117647, 1,
-0.2276633, -0.3730902, -1.751944, 0, 1, 0.4196078, 1,
-0.2275989, 2.302504, -0.3673107, 0, 1, 0.4235294, 1,
-0.2270296, 1.900501, -1.852197, 0, 1, 0.4313726, 1,
-0.2256843, -0.9530975, -3.033251, 0, 1, 0.4352941, 1,
-0.2228709, 1.241744, -0.2357141, 0, 1, 0.4431373, 1,
-0.2198517, 0.1590902, -1.439669, 0, 1, 0.4470588, 1,
-0.2181441, 0.7235351, 0.8132794, 0, 1, 0.454902, 1,
-0.2179815, -0.3354063, -3.874544, 0, 1, 0.4588235, 1,
-0.2170571, 0.17991, -2.349509, 0, 1, 0.4666667, 1,
-0.2167278, 0.5594634, 0.8206231, 0, 1, 0.4705882, 1,
-0.2166136, -0.5863605, -3.118398, 0, 1, 0.4784314, 1,
-0.215724, -1.406498, -4.658438, 0, 1, 0.4823529, 1,
-0.2153835, -0.1074394, -1.879265, 0, 1, 0.4901961, 1,
-0.2124427, 2.185795, 0.1448965, 0, 1, 0.4941176, 1,
-0.2109565, -2.007367, -4.556684, 0, 1, 0.5019608, 1,
-0.2106079, 1.007849, -0.8575374, 0, 1, 0.509804, 1,
-0.2082495, -1.128044, -2.684456, 0, 1, 0.5137255, 1,
-0.2077085, 1.042433, 0.8987513, 0, 1, 0.5215687, 1,
-0.2062012, -0.5245587, -1.636104, 0, 1, 0.5254902, 1,
-0.2019917, 0.04543017, -2.288006, 0, 1, 0.5333334, 1,
-0.1996707, 0.6183351, -0.8626301, 0, 1, 0.5372549, 1,
-0.193539, 1.887794, -1.162925, 0, 1, 0.5450981, 1,
-0.1928127, -0.7894444, -3.452977, 0, 1, 0.5490196, 1,
-0.1910769, -0.1075016, -1.472767, 0, 1, 0.5568628, 1,
-0.1872651, -0.2007715, -1.829293, 0, 1, 0.5607843, 1,
-0.185585, -0.07655984, -1.269413, 0, 1, 0.5686275, 1,
-0.1827389, -0.6651447, -3.16865, 0, 1, 0.572549, 1,
-0.1814316, 1.352682, -0.1130354, 0, 1, 0.5803922, 1,
-0.1768483, 0.9426264, -0.4062643, 0, 1, 0.5843138, 1,
-0.1764849, 0.98299, -0.5552199, 0, 1, 0.5921569, 1,
-0.1739628, -0.4618217, -3.383224, 0, 1, 0.5960785, 1,
-0.1723227, -1.008386, -1.40601, 0, 1, 0.6039216, 1,
-0.170755, 0.2344073, -0.8626367, 0, 1, 0.6117647, 1,
-0.1687457, -1.59602, -2.504317, 0, 1, 0.6156863, 1,
-0.1675138, -0.6484653, -2.051521, 0, 1, 0.6235294, 1,
-0.1628657, 2.105965, 0.19184, 0, 1, 0.627451, 1,
-0.1585299, -0.6270477, -4.329424, 0, 1, 0.6352941, 1,
-0.1581481, 1.38258, 1.0158, 0, 1, 0.6392157, 1,
-0.1526129, 0.2405814, -0.5998691, 0, 1, 0.6470588, 1,
-0.1503541, 1.873252, -1.780848, 0, 1, 0.6509804, 1,
-0.1468471, -1.727793, -3.143967, 0, 1, 0.6588235, 1,
-0.1405766, -0.1601116, -1.688916, 0, 1, 0.6627451, 1,
-0.1403672, 0.3619388, -1.494493, 0, 1, 0.6705883, 1,
-0.138136, 0.3545757, 1.159027, 0, 1, 0.6745098, 1,
-0.1347381, 1.400846, -0.1178054, 0, 1, 0.682353, 1,
-0.1343666, 1.319592, -0.5738302, 0, 1, 0.6862745, 1,
-0.1321844, 0.832543, 0.3507217, 0, 1, 0.6941177, 1,
-0.129488, -0.9885758, -2.368096, 0, 1, 0.7019608, 1,
-0.129002, 0.1352634, -0.3084169, 0, 1, 0.7058824, 1,
-0.1264469, 0.06095027, -1.589708, 0, 1, 0.7137255, 1,
-0.1258016, 0.7515126, -1.124914, 0, 1, 0.7176471, 1,
-0.1210868, -0.03960123, -1.564411, 0, 1, 0.7254902, 1,
-0.1195475, -0.5597618, -3.67711, 0, 1, 0.7294118, 1,
-0.1183814, -1.391238, -5.308516, 0, 1, 0.7372549, 1,
-0.1173517, 0.5763642, 0.06366548, 0, 1, 0.7411765, 1,
-0.117235, -1.193107, -4.0834, 0, 1, 0.7490196, 1,
-0.1169412, -1.75718, -2.376399, 0, 1, 0.7529412, 1,
-0.1067094, 0.2792425, -0.7265818, 0, 1, 0.7607843, 1,
-0.09635423, -0.1702865, -2.837804, 0, 1, 0.7647059, 1,
-0.08996199, 1.226042, 0.8266367, 0, 1, 0.772549, 1,
-0.08921753, 0.4648939, 0.9660421, 0, 1, 0.7764706, 1,
-0.08810741, -0.8522012, -2.243395, 0, 1, 0.7843137, 1,
-0.08392246, 0.2067457, -0.2245324, 0, 1, 0.7882353, 1,
-0.07869584, 2.227895, -0.7508573, 0, 1, 0.7960784, 1,
-0.07458084, 0.2920419, -0.004192031, 0, 1, 0.8039216, 1,
-0.07227787, -1.385739, -1.724789, 0, 1, 0.8078431, 1,
-0.07002453, 0.8360003, 1.411732, 0, 1, 0.8156863, 1,
-0.06655487, -1.977914, -3.488438, 0, 1, 0.8196079, 1,
-0.06440554, 0.416082, -0.132014, 0, 1, 0.827451, 1,
-0.06274479, -0.2015395, -3.164754, 0, 1, 0.8313726, 1,
-0.06129244, -0.3940401, -2.094623, 0, 1, 0.8392157, 1,
-0.06083145, -0.2082879, -3.022081, 0, 1, 0.8431373, 1,
-0.05926533, 0.05645894, -1.321795, 0, 1, 0.8509804, 1,
-0.05767576, -0.2770536, -2.315838, 0, 1, 0.854902, 1,
-0.05701329, 1.324541, 0.06703136, 0, 1, 0.8627451, 1,
-0.04998355, 0.3147019, 1.007797, 0, 1, 0.8666667, 1,
-0.04789266, -0.2497662, -4.742023, 0, 1, 0.8745098, 1,
-0.044785, 1.621078, -0.3894895, 0, 1, 0.8784314, 1,
-0.04156097, 0.333864, 1.022002, 0, 1, 0.8862745, 1,
-0.04037308, 1.572131, -0.7735567, 0, 1, 0.8901961, 1,
-0.0355493, 0.5032097, 0.9130301, 0, 1, 0.8980392, 1,
-0.03297647, 0.9296215, -1.10643, 0, 1, 0.9058824, 1,
-0.0299448, -0.864994, -3.071599, 0, 1, 0.9098039, 1,
-0.02788158, 2.093004, -0.3408863, 0, 1, 0.9176471, 1,
-0.02708066, 1.496103, 0.8550963, 0, 1, 0.9215686, 1,
-0.0237198, -1.687967, -4.205226, 0, 1, 0.9294118, 1,
-0.0213255, 0.495168, -1.515323, 0, 1, 0.9333333, 1,
-0.02082116, 0.6353969, -0.8138144, 0, 1, 0.9411765, 1,
-0.0187234, 1.172578, -0.001366682, 0, 1, 0.945098, 1,
-0.01324556, 0.1484651, -1.786865, 0, 1, 0.9529412, 1,
-0.01227071, 1.710958, 0.7136914, 0, 1, 0.9568627, 1,
-0.002051507, 0.1743322, -0.2796876, 0, 1, 0.9647059, 1,
0.0021503, -0.1599767, 3.119616, 0, 1, 0.9686275, 1,
0.005935478, 0.05374798, -0.6042566, 0, 1, 0.9764706, 1,
0.007882427, -0.1361871, 3.166519, 0, 1, 0.9803922, 1,
0.009565216, 0.3037873, 1.585371, 0, 1, 0.9882353, 1,
0.01420922, -0.08063639, 2.689485, 0, 1, 0.9921569, 1,
0.01458429, -0.7164848, 2.818804, 0, 1, 1, 1,
0.01561056, -0.9310828, 2.411553, 0, 0.9921569, 1, 1,
0.01991976, 1.023692, -0.1261298, 0, 0.9882353, 1, 1,
0.0238741, -1.075854, 3.422417, 0, 0.9803922, 1, 1,
0.0277749, 1.363673, 0.6548512, 0, 0.9764706, 1, 1,
0.03352361, 0.8166454, 1.34409, 0, 0.9686275, 1, 1,
0.03537818, 1.34906, 1.262873, 0, 0.9647059, 1, 1,
0.03594976, 0.09565908, -0.1962321, 0, 0.9568627, 1, 1,
0.04651019, 0.3247526, 1.762763, 0, 0.9529412, 1, 1,
0.04668874, -1.021436, 2.950625, 0, 0.945098, 1, 1,
0.04882349, -0.3660668, 4.231882, 0, 0.9411765, 1, 1,
0.06591211, 0.2276382, -1.840461, 0, 0.9333333, 1, 1,
0.06879774, -0.5563889, 3.07806, 0, 0.9294118, 1, 1,
0.07171267, 0.7354063, -0.146262, 0, 0.9215686, 1, 1,
0.07435207, 0.281435, 0.7473855, 0, 0.9176471, 1, 1,
0.07689335, -0.2310081, 3.036271, 0, 0.9098039, 1, 1,
0.07861447, -0.3857057, 1.728915, 0, 0.9058824, 1, 1,
0.0787767, 0.7113193, -0.4861837, 0, 0.8980392, 1, 1,
0.08319538, 1.667812, -0.4007735, 0, 0.8901961, 1, 1,
0.08610798, -0.8054602, 3.227779, 0, 0.8862745, 1, 1,
0.0889237, -1.128328, 3.122473, 0, 0.8784314, 1, 1,
0.0936555, 0.2178013, 1.438745, 0, 0.8745098, 1, 1,
0.09482279, -0.7553559, 4.372739, 0, 0.8666667, 1, 1,
0.09831534, 0.4624269, -0.5035815, 0, 0.8627451, 1, 1,
0.1049117, -1.816149, 3.732343, 0, 0.854902, 1, 1,
0.1063883, 0.01240505, 2.767393, 0, 0.8509804, 1, 1,
0.1067011, -1.811912, 4.067193, 0, 0.8431373, 1, 1,
0.1086328, -0.1144582, 3.644492, 0, 0.8392157, 1, 1,
0.1099955, 0.4567578, 0.8082314, 0, 0.8313726, 1, 1,
0.110122, 0.6496928, 2.08832, 0, 0.827451, 1, 1,
0.1158449, -0.1264007, 2.792189, 0, 0.8196079, 1, 1,
0.116156, -0.2312818, 2.607643, 0, 0.8156863, 1, 1,
0.11981, 1.944906, 0.01572243, 0, 0.8078431, 1, 1,
0.1218743, -0.4781031, 4.540641, 0, 0.8039216, 1, 1,
0.122282, 0.498193, -0.8932549, 0, 0.7960784, 1, 1,
0.1247318, 1.089896, -0.6885558, 0, 0.7882353, 1, 1,
0.1301511, -1.511768, 2.844927, 0, 0.7843137, 1, 1,
0.1352178, 0.3485579, -0.7256332, 0, 0.7764706, 1, 1,
0.1398049, -1.576373, 3.11243, 0, 0.772549, 1, 1,
0.1401355, 0.2319346, 1.020365, 0, 0.7647059, 1, 1,
0.1421333, 1.121361, 0.2846207, 0, 0.7607843, 1, 1,
0.1433991, -0.3092359, 3.703398, 0, 0.7529412, 1, 1,
0.1469865, 0.8027679, 0.6213202, 0, 0.7490196, 1, 1,
0.1477636, -0.8328866, 3.355308, 0, 0.7411765, 1, 1,
0.1499933, -0.3249622, 2.806538, 0, 0.7372549, 1, 1,
0.1519678, 0.5077296, -0.8217976, 0, 0.7294118, 1, 1,
0.1519882, 0.6634651, 2.432318, 0, 0.7254902, 1, 1,
0.1566332, 0.5022497, -1.13924, 0, 0.7176471, 1, 1,
0.1581595, -0.3039727, 0.3071133, 0, 0.7137255, 1, 1,
0.1584556, -0.369252, 2.51309, 0, 0.7058824, 1, 1,
0.165263, -0.9648025, 4.142827, 0, 0.6980392, 1, 1,
0.1664357, -0.6953118, 2.677947, 0, 0.6941177, 1, 1,
0.1677512, -0.6104012, 2.46103, 0, 0.6862745, 1, 1,
0.1681132, -0.6240353, 3.320974, 0, 0.682353, 1, 1,
0.1684772, 1.415843, -0.507351, 0, 0.6745098, 1, 1,
0.1704115, -0.3658805, 2.164282, 0, 0.6705883, 1, 1,
0.1707319, 0.916144, 0.3079102, 0, 0.6627451, 1, 1,
0.1750307, 0.03453344, 2.203809, 0, 0.6588235, 1, 1,
0.1791922, -0.6387819, 4.186309, 0, 0.6509804, 1, 1,
0.1802007, 1.289551, -0.007163933, 0, 0.6470588, 1, 1,
0.1837427, 0.7220017, -0.8723401, 0, 0.6392157, 1, 1,
0.1867082, -0.3006429, 1.09941, 0, 0.6352941, 1, 1,
0.1886041, -0.4623756, 2.440658, 0, 0.627451, 1, 1,
0.1896023, 0.5895616, 1.434606, 0, 0.6235294, 1, 1,
0.1918535, -0.8608119, 2.685283, 0, 0.6156863, 1, 1,
0.2003905, 0.3798315, 0.3983943, 0, 0.6117647, 1, 1,
0.2020061, 1.079036, 0.1247617, 0, 0.6039216, 1, 1,
0.206792, 0.9054113, 0.03922986, 0, 0.5960785, 1, 1,
0.2100362, -0.921786, 3.202329, 0, 0.5921569, 1, 1,
0.2106611, -0.115153, 1.693027, 0, 0.5843138, 1, 1,
0.2118427, 1.058151, 0.4637653, 0, 0.5803922, 1, 1,
0.2192268, -1.008803, 4.202371, 0, 0.572549, 1, 1,
0.2196628, -0.4727744, 1.369603, 0, 0.5686275, 1, 1,
0.2199554, 0.3071871, 0.1384772, 0, 0.5607843, 1, 1,
0.2223627, 0.4798065, -0.5602518, 0, 0.5568628, 1, 1,
0.230998, -0.8507252, 5.702994, 0, 0.5490196, 1, 1,
0.235115, -0.4162696, 1.852222, 0, 0.5450981, 1, 1,
0.2361856, 1.090731, 1.446134, 0, 0.5372549, 1, 1,
0.2434421, -0.3173824, 3.69137, 0, 0.5333334, 1, 1,
0.2444183, -0.593246, 3.145495, 0, 0.5254902, 1, 1,
0.2454453, 0.02375531, 1.176565, 0, 0.5215687, 1, 1,
0.2484808, 0.7341625, -1.047561, 0, 0.5137255, 1, 1,
0.2529704, 0.9144522, 1.781648, 0, 0.509804, 1, 1,
0.2547826, 0.1015639, 1.704071, 0, 0.5019608, 1, 1,
0.2574319, 0.5935979, -0.542607, 0, 0.4941176, 1, 1,
0.2601849, 1.579146, -0.6114488, 0, 0.4901961, 1, 1,
0.2607451, 0.6914659, 0.4804142, 0, 0.4823529, 1, 1,
0.2609883, -1.004819, 2.832256, 0, 0.4784314, 1, 1,
0.2669126, -0.6608663, 3.342374, 0, 0.4705882, 1, 1,
0.2682934, -1.207852, 2.93161, 0, 0.4666667, 1, 1,
0.277188, 1.312573, -0.01282861, 0, 0.4588235, 1, 1,
0.2799348, 0.1235357, 0.8153231, 0, 0.454902, 1, 1,
0.2819394, 0.2901855, 2.542815, 0, 0.4470588, 1, 1,
0.2844688, -0.6722227, 4.144456, 0, 0.4431373, 1, 1,
0.286896, -0.3406446, 3.452288, 0, 0.4352941, 1, 1,
0.2896208, 0.9092033, 0.07257105, 0, 0.4313726, 1, 1,
0.2901439, -2.46854, 3.198551, 0, 0.4235294, 1, 1,
0.292268, -0.1864464, 2.681125, 0, 0.4196078, 1, 1,
0.2959462, -0.5808709, 3.227682, 0, 0.4117647, 1, 1,
0.2973026, 0.8049629, -1.305116, 0, 0.4078431, 1, 1,
0.299446, -0.996784, 2.581061, 0, 0.4, 1, 1,
0.3001682, 1.248741, -0.2658103, 0, 0.3921569, 1, 1,
0.3081034, 0.4487677, -0.6303573, 0, 0.3882353, 1, 1,
0.3134566, -0.4563943, 2.757127, 0, 0.3803922, 1, 1,
0.3169094, 1.792744, 1.850013, 0, 0.3764706, 1, 1,
0.3183228, -0.8688023, 2.392398, 0, 0.3686275, 1, 1,
0.31995, -0.6736829, 3.267048, 0, 0.3647059, 1, 1,
0.3221964, 0.6708382, -0.8521529, 0, 0.3568628, 1, 1,
0.324012, 0.1683217, 1.318932, 0, 0.3529412, 1, 1,
0.3271864, 0.03595892, 0.7753776, 0, 0.345098, 1, 1,
0.3294288, 0.7017524, -0.5932118, 0, 0.3411765, 1, 1,
0.3306585, 1.092127, -0.7018414, 0, 0.3333333, 1, 1,
0.3355713, -0.7822506, 2.461811, 0, 0.3294118, 1, 1,
0.3399775, 0.6743384, -0.1907904, 0, 0.3215686, 1, 1,
0.3412739, 0.02494046, 2.433194, 0, 0.3176471, 1, 1,
0.3435817, 0.09663136, 0.270283, 0, 0.3098039, 1, 1,
0.3473263, 1.873389, 0.2547631, 0, 0.3058824, 1, 1,
0.3474061, 0.9903837, -1.620446, 0, 0.2980392, 1, 1,
0.349848, -0.2032306, 2.545045, 0, 0.2901961, 1, 1,
0.3520282, 1.043883, -0.2679155, 0, 0.2862745, 1, 1,
0.3556923, 0.2512783, 0.9465128, 0, 0.2784314, 1, 1,
0.3579698, 0.2884238, 0.2856346, 0, 0.2745098, 1, 1,
0.3638523, 0.6300892, 1.591644, 0, 0.2666667, 1, 1,
0.3646386, -1.213729, 2.958467, 0, 0.2627451, 1, 1,
0.3653766, 0.3856887, 0.8770626, 0, 0.254902, 1, 1,
0.3708724, -0.07894795, 1.705937, 0, 0.2509804, 1, 1,
0.3712548, 0.1599099, 2.735059, 0, 0.2431373, 1, 1,
0.3748807, -0.6278714, 1.477519, 0, 0.2392157, 1, 1,
0.375744, 0.7610952, 1.217844, 0, 0.2313726, 1, 1,
0.3786959, 0.6004573, 1.203233, 0, 0.227451, 1, 1,
0.3822806, -0.9216773, 2.124405, 0, 0.2196078, 1, 1,
0.3834001, 2.111047, 0.02171588, 0, 0.2156863, 1, 1,
0.3849954, -0.2292279, 3.5318, 0, 0.2078431, 1, 1,
0.3852381, 0.236552, 0.7197945, 0, 0.2039216, 1, 1,
0.3856723, -0.4837057, 2.693655, 0, 0.1960784, 1, 1,
0.3933898, -1.197639, 2.971628, 0, 0.1882353, 1, 1,
0.3937377, -0.6288148, 2.723226, 0, 0.1843137, 1, 1,
0.3965707, -0.3879874, 1.165302, 0, 0.1764706, 1, 1,
0.397214, -0.8888195, 1.982344, 0, 0.172549, 1, 1,
0.4018874, 0.4328003, 1.69874, 0, 0.1647059, 1, 1,
0.4024764, -0.3660423, 3.626431, 0, 0.1607843, 1, 1,
0.4062305, 2.001, 1.970079, 0, 0.1529412, 1, 1,
0.409267, -0.7860294, 1.626996, 0, 0.1490196, 1, 1,
0.4095915, -0.4927305, 1.204482, 0, 0.1411765, 1, 1,
0.4106107, 0.2101892, 0.9294946, 0, 0.1372549, 1, 1,
0.4108833, 0.548992, 0.4788194, 0, 0.1294118, 1, 1,
0.4134066, 1.557623, 2.183056, 0, 0.1254902, 1, 1,
0.4144176, -0.7664226, 3.76446, 0, 0.1176471, 1, 1,
0.4216672, -0.4200157, 4.315424, 0, 0.1137255, 1, 1,
0.4216723, -0.3257633, 3.913189, 0, 0.1058824, 1, 1,
0.4249851, -0.4516885, 2.443965, 0, 0.09803922, 1, 1,
0.4273676, 0.1336461, 2.214465, 0, 0.09411765, 1, 1,
0.4277029, 0.4697947, 1.158376, 0, 0.08627451, 1, 1,
0.4285779, -0.01512284, 2.212, 0, 0.08235294, 1, 1,
0.431955, -1.511963, 3.504935, 0, 0.07450981, 1, 1,
0.4350366, 2.018924, 0.03395174, 0, 0.07058824, 1, 1,
0.4372726, 0.1394963, 2.570771, 0, 0.0627451, 1, 1,
0.4401976, 0.1387733, 1.122069, 0, 0.05882353, 1, 1,
0.442242, 1.990898, 1.674551, 0, 0.05098039, 1, 1,
0.4439358, 0.9627448, 2.785699, 0, 0.04705882, 1, 1,
0.4458287, 0.6572999, 0.1481469, 0, 0.03921569, 1, 1,
0.4573423, -0.5874916, 2.662174, 0, 0.03529412, 1, 1,
0.4590832, -0.09583806, 3.623587, 0, 0.02745098, 1, 1,
0.4621987, -0.3147389, 1.078983, 0, 0.02352941, 1, 1,
0.4623367, -0.4235424, -0.2729566, 0, 0.01568628, 1, 1,
0.4637927, 1.992379, -1.21167, 0, 0.01176471, 1, 1,
0.464718, 0.9316986, 0.7320856, 0, 0.003921569, 1, 1,
0.469843, 0.3484938, 2.087857, 0.003921569, 0, 1, 1,
0.4700476, 3.003825, -0.2517963, 0.007843138, 0, 1, 1,
0.4723494, 0.3677618, -0.5935047, 0.01568628, 0, 1, 1,
0.4730692, 0.1595442, -0.8490224, 0.01960784, 0, 1, 1,
0.4752387, -0.3549827, 1.932647, 0.02745098, 0, 1, 1,
0.4817637, 0.4106934, 1.217688, 0.03137255, 0, 1, 1,
0.4832, -1.239627, 3.638129, 0.03921569, 0, 1, 1,
0.4870042, 0.263656, 1.520503, 0.04313726, 0, 1, 1,
0.4895835, -0.4300968, 4.248415, 0.05098039, 0, 1, 1,
0.4919596, -0.8529933, 2.403069, 0.05490196, 0, 1, 1,
0.5022224, -1.708025, 2.611256, 0.0627451, 0, 1, 1,
0.502739, -1.315549, 2.804394, 0.06666667, 0, 1, 1,
0.5029314, 0.687762, 0.1168115, 0.07450981, 0, 1, 1,
0.5035285, 0.008332717, 0.6034226, 0.07843138, 0, 1, 1,
0.5059872, -0.3163804, 1.475925, 0.08627451, 0, 1, 1,
0.5060188, -0.4049803, 0.9262447, 0.09019608, 0, 1, 1,
0.5068765, -0.04499019, 2.794056, 0.09803922, 0, 1, 1,
0.5120233, 0.01988021, 2.176379, 0.1058824, 0, 1, 1,
0.5134308, 2.484382, 1.40698, 0.1098039, 0, 1, 1,
0.5139056, 1.370259, 0.6547256, 0.1176471, 0, 1, 1,
0.5158051, -0.9387499, 2.037632, 0.1215686, 0, 1, 1,
0.5198964, 0.4656372, 1.043533, 0.1294118, 0, 1, 1,
0.5227646, 0.6886242, 1.838049, 0.1333333, 0, 1, 1,
0.522949, 2.021947, -0.6754215, 0.1411765, 0, 1, 1,
0.5240769, 1.352819, 2.343579, 0.145098, 0, 1, 1,
0.5255977, -0.2126303, 2.149806, 0.1529412, 0, 1, 1,
0.5293123, 0.6256307, -1.559985, 0.1568628, 0, 1, 1,
0.5329791, 1.402685, 0.4176925, 0.1647059, 0, 1, 1,
0.53583, -0.772839, 2.216815, 0.1686275, 0, 1, 1,
0.540482, -0.4719157, 3.067865, 0.1764706, 0, 1, 1,
0.5430344, -1.021307, 0.6095688, 0.1803922, 0, 1, 1,
0.5485101, 0.7041539, -1.043265, 0.1882353, 0, 1, 1,
0.5489666, 2.245257, 0.8793594, 0.1921569, 0, 1, 1,
0.5495949, 1.290357, -0.2136151, 0.2, 0, 1, 1,
0.5545777, -0.8910887, 3.415284, 0.2078431, 0, 1, 1,
0.5546259, 0.9981326, 0.5217915, 0.2117647, 0, 1, 1,
0.5586329, 1.887391, -0.3337524, 0.2196078, 0, 1, 1,
0.5589928, 0.5763036, 2.619311, 0.2235294, 0, 1, 1,
0.5615537, -0.978395, 3.272426, 0.2313726, 0, 1, 1,
0.5627071, -1.058075, 3.961504, 0.2352941, 0, 1, 1,
0.567714, 0.1839253, 1.538523, 0.2431373, 0, 1, 1,
0.5723901, -0.7531192, 3.023268, 0.2470588, 0, 1, 1,
0.5748326, -0.07049505, 0.5385642, 0.254902, 0, 1, 1,
0.5750176, 0.7714443, 1.370838, 0.2588235, 0, 1, 1,
0.589206, 0.5520793, 1.854805, 0.2666667, 0, 1, 1,
0.5894664, 0.2976296, -0.03113881, 0.2705882, 0, 1, 1,
0.5925328, -0.8888317, 2.492113, 0.2784314, 0, 1, 1,
0.5935587, -0.05121765, 1.220279, 0.282353, 0, 1, 1,
0.5944145, -0.4012877, 0.4799998, 0.2901961, 0, 1, 1,
0.5987412, -0.6404783, 3.523165, 0.2941177, 0, 1, 1,
0.6000257, -0.08987179, 1.822627, 0.3019608, 0, 1, 1,
0.6052334, 1.461814, 1.436191, 0.3098039, 0, 1, 1,
0.6060265, 0.8454252, 1.961273, 0.3137255, 0, 1, 1,
0.6100397, 0.2287314, 3.443572, 0.3215686, 0, 1, 1,
0.6114726, 0.9074806, 0.107016, 0.3254902, 0, 1, 1,
0.6114727, 1.14202, -1.187591, 0.3333333, 0, 1, 1,
0.6115493, 0.418977, 1.74362, 0.3372549, 0, 1, 1,
0.6154894, -0.301918, 1.233233, 0.345098, 0, 1, 1,
0.6179689, 0.7017878, 1.995669, 0.3490196, 0, 1, 1,
0.6225275, -0.6621333, 3.744072, 0.3568628, 0, 1, 1,
0.6227394, -1.134579, 0.6711748, 0.3607843, 0, 1, 1,
0.6242605, -0.4903128, 1.046373, 0.3686275, 0, 1, 1,
0.6300811, -1.124257, 3.650398, 0.372549, 0, 1, 1,
0.630542, -0.3289767, 2.330737, 0.3803922, 0, 1, 1,
0.6319742, -0.2599221, 0.6202465, 0.3843137, 0, 1, 1,
0.6411266, -0.3697305, 1.830131, 0.3921569, 0, 1, 1,
0.6486402, 0.05780149, 0.8005397, 0.3960784, 0, 1, 1,
0.6525486, 0.7345699, 1.197873, 0.4039216, 0, 1, 1,
0.6598756, 0.0562208, 1.131546, 0.4117647, 0, 1, 1,
0.6618254, 0.4446961, 1.701556, 0.4156863, 0, 1, 1,
0.6630672, 0.1782389, 1.170937, 0.4235294, 0, 1, 1,
0.6678383, -0.702929, 1.243982, 0.427451, 0, 1, 1,
0.6699773, 1.51586, 0.8578616, 0.4352941, 0, 1, 1,
0.6722533, 1.106246, 0.9288044, 0.4392157, 0, 1, 1,
0.6728624, -0.1262176, 1.972616, 0.4470588, 0, 1, 1,
0.6786843, -1.238475, 2.559787, 0.4509804, 0, 1, 1,
0.6791939, -0.2724481, 1.590167, 0.4588235, 0, 1, 1,
0.6808278, 0.4798715, 0.8685396, 0.4627451, 0, 1, 1,
0.6838185, 1.431679, 2.301927, 0.4705882, 0, 1, 1,
0.6863369, 0.1051954, 1.073361, 0.4745098, 0, 1, 1,
0.6868859, 0.52401, 1.688239, 0.4823529, 0, 1, 1,
0.6933451, -0.7666637, 3.96861, 0.4862745, 0, 1, 1,
0.6943545, -0.0349112, 1.237638, 0.4941176, 0, 1, 1,
0.6961315, 0.7352375, -1.445839, 0.5019608, 0, 1, 1,
0.6968974, -0.1701229, 1.366832, 0.5058824, 0, 1, 1,
0.7035341, -0.7550555, 1.273055, 0.5137255, 0, 1, 1,
0.7059056, 0.7369311, -0.8623903, 0.5176471, 0, 1, 1,
0.7204956, 0.2021584, -0.4375432, 0.5254902, 0, 1, 1,
0.7250273, 0.5338588, -0.1975374, 0.5294118, 0, 1, 1,
0.7255925, -1.001871, 1.839566, 0.5372549, 0, 1, 1,
0.7297419, -0.6032339, 1.963882, 0.5411765, 0, 1, 1,
0.7362744, -1.127223, 3.004412, 0.5490196, 0, 1, 1,
0.7365016, 1.123352, 0.646306, 0.5529412, 0, 1, 1,
0.7386141, -0.2717069, 2.793418, 0.5607843, 0, 1, 1,
0.738837, -0.1526501, 1.468562, 0.5647059, 0, 1, 1,
0.7410493, 0.4273499, 0.9318199, 0.572549, 0, 1, 1,
0.7414465, -0.1735331, 1.297031, 0.5764706, 0, 1, 1,
0.7418527, -1.07029, 2.704821, 0.5843138, 0, 1, 1,
0.7483311, -1.138817, 2.773688, 0.5882353, 0, 1, 1,
0.7485885, -0.3835981, 3.137753, 0.5960785, 0, 1, 1,
0.7522481, -0.2619007, 0.6835433, 0.6039216, 0, 1, 1,
0.7549946, -0.3716583, 1.97263, 0.6078432, 0, 1, 1,
0.7553355, -0.8057754, -0.3933369, 0.6156863, 0, 1, 1,
0.7558538, 0.05158548, 0.2939306, 0.6196079, 0, 1, 1,
0.7586994, 0.7070245, 1.800904, 0.627451, 0, 1, 1,
0.7591974, -0.7312208, 3.851237, 0.6313726, 0, 1, 1,
0.759773, -0.1110014, 2.577316, 0.6392157, 0, 1, 1,
0.7636279, -1.447704, 1.599207, 0.6431373, 0, 1, 1,
0.7690699, 1.345742, 0.5463009, 0.6509804, 0, 1, 1,
0.7715667, 0.8452433, 0.8223215, 0.654902, 0, 1, 1,
0.7782732, -1.143869, 4.106307, 0.6627451, 0, 1, 1,
0.778535, -1.638153, 3.882131, 0.6666667, 0, 1, 1,
0.7801013, 1.133942, 0.3494177, 0.6745098, 0, 1, 1,
0.7822815, 0.6308548, 0.6052594, 0.6784314, 0, 1, 1,
0.785205, 0.8010795, -1.674498, 0.6862745, 0, 1, 1,
0.7979593, -1.566939, 0.3592017, 0.6901961, 0, 1, 1,
0.7982212, -0.2426933, 3.499421, 0.6980392, 0, 1, 1,
0.799605, 1.119823, -0.09213963, 0.7058824, 0, 1, 1,
0.8027315, 1.730062, -1.949705, 0.7098039, 0, 1, 1,
0.8056349, -0.06475689, 1.439255, 0.7176471, 0, 1, 1,
0.8087566, -0.04309265, 2.234489, 0.7215686, 0, 1, 1,
0.8091644, 1.179394, 1.638507, 0.7294118, 0, 1, 1,
0.8095582, -0.03587214, 1.92628, 0.7333333, 0, 1, 1,
0.8105435, -1.412442, 2.96623, 0.7411765, 0, 1, 1,
0.8124139, -0.9404688, 4.490975, 0.7450981, 0, 1, 1,
0.8174061, -0.3625482, 3.741032, 0.7529412, 0, 1, 1,
0.8288099, -1.049089, 2.33756, 0.7568628, 0, 1, 1,
0.8373134, -0.1561139, 0.945803, 0.7647059, 0, 1, 1,
0.8397431, 0.9571366, 1.055156, 0.7686275, 0, 1, 1,
0.8434864, 0.7192895, 0.06522579, 0.7764706, 0, 1, 1,
0.8443562, 0.01418076, 0.1323961, 0.7803922, 0, 1, 1,
0.8450702, -0.174555, 2.183349, 0.7882353, 0, 1, 1,
0.8470622, -0.6297814, 1.60366, 0.7921569, 0, 1, 1,
0.8509554, 0.1309061, 2.524522, 0.8, 0, 1, 1,
0.8575594, -1.633264, 0.06837177, 0.8078431, 0, 1, 1,
0.8584726, 1.17231, 0.02020712, 0.8117647, 0, 1, 1,
0.8634508, 0.5344948, -1.209508, 0.8196079, 0, 1, 1,
0.8676395, 0.8361017, 0.0007750014, 0.8235294, 0, 1, 1,
0.8693708, -0.9803113, 0.4868476, 0.8313726, 0, 1, 1,
0.8771383, -0.1257044, 2.795979, 0.8352941, 0, 1, 1,
0.8835443, -0.1296833, 2.441495, 0.8431373, 0, 1, 1,
0.8855975, 0.5908164, -0.1179977, 0.8470588, 0, 1, 1,
0.8874413, -0.5220488, 3.849582, 0.854902, 0, 1, 1,
0.8876868, 1.064941, 1.163302, 0.8588235, 0, 1, 1,
0.8883948, -0.411796, 1.546274, 0.8666667, 0, 1, 1,
0.8893141, 0.6333317, 1.324027, 0.8705882, 0, 1, 1,
0.9049176, -2.371105, 1.752422, 0.8784314, 0, 1, 1,
0.9112556, 1.241945, 0.4901447, 0.8823529, 0, 1, 1,
0.9196482, -1.152983, 4.194186, 0.8901961, 0, 1, 1,
0.9198252, -0.9980077, 1.013856, 0.8941177, 0, 1, 1,
0.9220946, 1.151887, 0.334164, 0.9019608, 0, 1, 1,
0.9225047, 0.05675737, 1.382834, 0.9098039, 0, 1, 1,
0.9337848, 1.288482, 0.1219214, 0.9137255, 0, 1, 1,
0.9466767, -0.4254819, 4.424371, 0.9215686, 0, 1, 1,
0.9467767, -0.6804563, 1.545161, 0.9254902, 0, 1, 1,
0.9479146, 0.07212833, 1.490223, 0.9333333, 0, 1, 1,
0.9555285, 0.3659128, 0.5473257, 0.9372549, 0, 1, 1,
0.9628688, 0.01651089, 1.010077, 0.945098, 0, 1, 1,
0.9644341, 1.981238, 0.9028134, 0.9490196, 0, 1, 1,
0.973223, 0.6324048, 0.4854979, 0.9568627, 0, 1, 1,
0.9749546, 1.548143, 2.125129, 0.9607843, 0, 1, 1,
0.9853724, -0.8415554, 4.329155, 0.9686275, 0, 1, 1,
0.9911282, -0.5724579, 1.624262, 0.972549, 0, 1, 1,
0.9922255, -0.6106606, 2.904531, 0.9803922, 0, 1, 1,
0.996002, -0.7653964, 2.875561, 0.9843137, 0, 1, 1,
0.9960241, -0.623292, 2.37928, 0.9921569, 0, 1, 1,
0.9979646, -0.4151132, 2.002247, 0.9960784, 0, 1, 1,
1.002219, -0.5707636, 1.673984, 1, 0, 0.9960784, 1,
1.007061, -0.8124285, 1.502227, 1, 0, 0.9882353, 1,
1.009521, 1.233775, 2.283426, 1, 0, 0.9843137, 1,
1.011603, 2.214627, 1.305189, 1, 0, 0.9764706, 1,
1.015718, -2.049882, 2.197328, 1, 0, 0.972549, 1,
1.019445, 0.5404238, 1.206983, 1, 0, 0.9647059, 1,
1.019733, -0.9543264, 1.446253, 1, 0, 0.9607843, 1,
1.026299, 0.6479466, 1.914419, 1, 0, 0.9529412, 1,
1.034668, 0.2094501, 1.760214, 1, 0, 0.9490196, 1,
1.035507, 0.7025338, 0.1552889, 1, 0, 0.9411765, 1,
1.058444, -0.4178219, 3.621881, 1, 0, 0.9372549, 1,
1.063351, 2.187821, -0.7135765, 1, 0, 0.9294118, 1,
1.066963, -0.8667809, 3.066766, 1, 0, 0.9254902, 1,
1.068404, -0.7312375, 1.76248, 1, 0, 0.9176471, 1,
1.069183, 1.367173, 0.1580683, 1, 0, 0.9137255, 1,
1.074242, -0.6828258, 1.62361, 1, 0, 0.9058824, 1,
1.078048, 0.1668495, 0.7718808, 1, 0, 0.9019608, 1,
1.078379, -0.6719425, 2.815189, 1, 0, 0.8941177, 1,
1.081098, 2.154937, 1.402243, 1, 0, 0.8862745, 1,
1.086666, 0.1664875, 0.2624568, 1, 0, 0.8823529, 1,
1.096982, 0.6625655, 1.475081, 1, 0, 0.8745098, 1,
1.106993, -1.030636, 4.256452, 1, 0, 0.8705882, 1,
1.107391, 0.2556908, -0.4370875, 1, 0, 0.8627451, 1,
1.110779, 0.2983087, 0.9891092, 1, 0, 0.8588235, 1,
1.116424, 0.494798, -0.09021492, 1, 0, 0.8509804, 1,
1.122584, -0.9148555, 2.098042, 1, 0, 0.8470588, 1,
1.12794, -0.6208879, 1.369409, 1, 0, 0.8392157, 1,
1.129902, 0.8575411, 0.2695063, 1, 0, 0.8352941, 1,
1.132718, -0.5454515, 2.892981, 1, 0, 0.827451, 1,
1.136858, -0.9567804, 1.354694, 1, 0, 0.8235294, 1,
1.143678, 0.09364636, 0.7644631, 1, 0, 0.8156863, 1,
1.144204, -0.6227127, 2.265362, 1, 0, 0.8117647, 1,
1.147271, -0.7280472, 3.93721, 1, 0, 0.8039216, 1,
1.150659, -1.148626, 2.229491, 1, 0, 0.7960784, 1,
1.161513, 0.350013, -0.1671991, 1, 0, 0.7921569, 1,
1.164311, -0.1030289, -0.1660681, 1, 0, 0.7843137, 1,
1.165552, -1.66641, 3.024458, 1, 0, 0.7803922, 1,
1.172842, -0.7493778, 0.3375725, 1, 0, 0.772549, 1,
1.176791, 2.324196, 1.701117, 1, 0, 0.7686275, 1,
1.183342, -0.7316075, 3.519398, 1, 0, 0.7607843, 1,
1.186192, 1.422839, -0.1454709, 1, 0, 0.7568628, 1,
1.189891, -0.3849692, 0.7209671, 1, 0, 0.7490196, 1,
1.195848, -1.326026, 1.55804, 1, 0, 0.7450981, 1,
1.199879, -0.9637122, 0.9075723, 1, 0, 0.7372549, 1,
1.201673, 1.424138, -0.1307836, 1, 0, 0.7333333, 1,
1.20297, -0.1981367, 2.387759, 1, 0, 0.7254902, 1,
1.204807, 1.601748, 1.618173, 1, 0, 0.7215686, 1,
1.204988, -0.9633526, 4.145034, 1, 0, 0.7137255, 1,
1.205584, -0.8513919, 3.163797, 1, 0, 0.7098039, 1,
1.207927, 0.1956805, 3.251668, 1, 0, 0.7019608, 1,
1.217854, 0.605776, 1.804306, 1, 0, 0.6941177, 1,
1.221585, 1.50499, 0.7946566, 1, 0, 0.6901961, 1,
1.22328, 0.9584532, 1.26079, 1, 0, 0.682353, 1,
1.224844, 0.3743154, 1.471642, 1, 0, 0.6784314, 1,
1.234503, 0.109515, 0.3872409, 1, 0, 0.6705883, 1,
1.235605, -1.156987, 1.640706, 1, 0, 0.6666667, 1,
1.244026, 0.9476216, 2.136644, 1, 0, 0.6588235, 1,
1.260971, -0.3548791, 1.616857, 1, 0, 0.654902, 1,
1.261842, 0.8956133, 0.6450688, 1, 0, 0.6470588, 1,
1.267149, 0.9736148, 2.49782, 1, 0, 0.6431373, 1,
1.270737, 0.862397, 0.3667203, 1, 0, 0.6352941, 1,
1.278811, 0.2474594, 1.716323, 1, 0, 0.6313726, 1,
1.298867, 0.7957544, 1.906761, 1, 0, 0.6235294, 1,
1.309387, -1.295369, 1.067715, 1, 0, 0.6196079, 1,
1.325695, 0.05873656, 2.899281, 1, 0, 0.6117647, 1,
1.327949, -2.084697, 1.835551, 1, 0, 0.6078432, 1,
1.345829, 2.686644, 0.5514938, 1, 0, 0.6, 1,
1.373447, -0.1910082, 1.994472, 1, 0, 0.5921569, 1,
1.384619, 1.239052, 0.2495856, 1, 0, 0.5882353, 1,
1.38606, 1.606039, 0.9356853, 1, 0, 0.5803922, 1,
1.392316, 1.185659, 0.1723691, 1, 0, 0.5764706, 1,
1.396012, 0.7264963, -0.6177217, 1, 0, 0.5686275, 1,
1.401105, -0.3107343, -0.9346668, 1, 0, 0.5647059, 1,
1.401864, 1.233194, 0.8133221, 1, 0, 0.5568628, 1,
1.408531, -0.3700911, 3.049231, 1, 0, 0.5529412, 1,
1.408809, -0.1258218, 1.661024, 1, 0, 0.5450981, 1,
1.41177, -0.3406495, 0.7794549, 1, 0, 0.5411765, 1,
1.41723, -1.196433, 3.299296, 1, 0, 0.5333334, 1,
1.419562, -0.5001659, 2.229855, 1, 0, 0.5294118, 1,
1.427784, 1.433996, 0.3326402, 1, 0, 0.5215687, 1,
1.441775, 0.888601, 0.6648411, 1, 0, 0.5176471, 1,
1.444209, 1.781442, 1.383742, 1, 0, 0.509804, 1,
1.447985, 0.6951464, 1.431415, 1, 0, 0.5058824, 1,
1.448147, -0.9565332, 1.665943, 1, 0, 0.4980392, 1,
1.45752, 0.4235413, 0.5519438, 1, 0, 0.4901961, 1,
1.462088, 1.234564, 0.02075509, 1, 0, 0.4862745, 1,
1.477934, 1.842105, 1.310333, 1, 0, 0.4784314, 1,
1.479135, 0.9459615, 0.4768422, 1, 0, 0.4745098, 1,
1.488242, -0.5407331, 1.59141, 1, 0, 0.4666667, 1,
1.493861, -1.043332, 0.92102, 1, 0, 0.4627451, 1,
1.495633, 1.75019, 0.1476729, 1, 0, 0.454902, 1,
1.498199, -0.8604325, 2.122978, 1, 0, 0.4509804, 1,
1.502933, 0.5469985, -0.08942036, 1, 0, 0.4431373, 1,
1.512744, -0.08565444, 2.858116, 1, 0, 0.4392157, 1,
1.515355, -1.327215, 0.9453917, 1, 0, 0.4313726, 1,
1.515531, 1.088382, 2.315575, 1, 0, 0.427451, 1,
1.524262, -1.704866, 1.741692, 1, 0, 0.4196078, 1,
1.537498, 0.02865699, 0.345633, 1, 0, 0.4156863, 1,
1.553002, -0.5686608, 1.869128, 1, 0, 0.4078431, 1,
1.553864, -0.1927397, 1.988836, 1, 0, 0.4039216, 1,
1.562208, 0.2207389, 1.640554, 1, 0, 0.3960784, 1,
1.567109, -2.05057, 3.940812, 1, 0, 0.3882353, 1,
1.56898, -0.3860714, 2.200959, 1, 0, 0.3843137, 1,
1.586042, 0.2738626, 1.979643, 1, 0, 0.3764706, 1,
1.590875, -0.9646102, 3.448324, 1, 0, 0.372549, 1,
1.590948, -0.6860256, 2.488342, 1, 0, 0.3647059, 1,
1.603775, 0.4882043, 1.86057, 1, 0, 0.3607843, 1,
1.619949, 0.1703678, 1.028139, 1, 0, 0.3529412, 1,
1.631498, -0.4853669, 0.4539765, 1, 0, 0.3490196, 1,
1.633251, 0.1814089, 1.062111, 1, 0, 0.3411765, 1,
1.638716, 1.796971, -1.355677, 1, 0, 0.3372549, 1,
1.640242, 1.863018, 1.886197, 1, 0, 0.3294118, 1,
1.641148, 1.019951, 1.852493, 1, 0, 0.3254902, 1,
1.65858, -0.4444032, 1.941507, 1, 0, 0.3176471, 1,
1.669651, -0.2773028, 2.472502, 1, 0, 0.3137255, 1,
1.693593, -0.1122466, 1.80382, 1, 0, 0.3058824, 1,
1.694944, 1.13007, 2.768223, 1, 0, 0.2980392, 1,
1.694987, 0.6398576, -0.2555637, 1, 0, 0.2941177, 1,
1.700165, -0.3343033, 1.963903, 1, 0, 0.2862745, 1,
1.703857, -0.436426, 1.717307, 1, 0, 0.282353, 1,
1.725364, 0.7925083, 1.404836, 1, 0, 0.2745098, 1,
1.733028, -1.734964, 2.946799, 1, 0, 0.2705882, 1,
1.740338, 0.6824831, 0.2421281, 1, 0, 0.2627451, 1,
1.755407, 0.8203741, -1.817199, 1, 0, 0.2588235, 1,
1.761116, -0.05466099, 0.8129429, 1, 0, 0.2509804, 1,
1.781763, 0.439851, 0.1302481, 1, 0, 0.2470588, 1,
1.787353, -0.3517421, 1.736187, 1, 0, 0.2392157, 1,
1.820118, 1.302206, 2.327854, 1, 0, 0.2352941, 1,
1.82135, 0.5361093, 2.799145, 1, 0, 0.227451, 1,
1.824913, -1.77373, 2.501213, 1, 0, 0.2235294, 1,
1.82861, -0.5512568, 2.840921, 1, 0, 0.2156863, 1,
1.846165, 1.470949, 0.7579578, 1, 0, 0.2117647, 1,
1.869325, 0.2922544, 1.179149, 1, 0, 0.2039216, 1,
1.902635, -1.219734, 1.10978, 1, 0, 0.1960784, 1,
1.910983, -1.09154, 1.651838, 1, 0, 0.1921569, 1,
1.931837, 0.4359598, 1.982845, 1, 0, 0.1843137, 1,
1.9687, -0.1886075, 0.0395226, 1, 0, 0.1803922, 1,
1.970068, 0.8873077, 1.597264, 1, 0, 0.172549, 1,
1.978164, -2.518623, 2.610748, 1, 0, 0.1686275, 1,
1.989838, -0.7901799, 1.303757, 1, 0, 0.1607843, 1,
2.0369, -1.253418, 1.63374, 1, 0, 0.1568628, 1,
2.064035, 0.7355397, 1.550202, 1, 0, 0.1490196, 1,
2.06867, -0.980024, 2.284656, 1, 0, 0.145098, 1,
2.073606, -1.16022, 3.183109, 1, 0, 0.1372549, 1,
2.098737, 0.05424932, 1.873799, 1, 0, 0.1333333, 1,
2.123192, -0.6868858, 2.442051, 1, 0, 0.1254902, 1,
2.1312, 0.7027267, 0.106764, 1, 0, 0.1215686, 1,
2.162055, -0.8593642, 0.9660128, 1, 0, 0.1137255, 1,
2.162201, -1.161182, 1.454032, 1, 0, 0.1098039, 1,
2.198863, -1.429804, 1.893623, 1, 0, 0.1019608, 1,
2.218997, -0.3019465, 2.08242, 1, 0, 0.09411765, 1,
2.241844, 1.047319, 0.2294212, 1, 0, 0.09019608, 1,
2.286257, 0.09831597, 0.4199651, 1, 0, 0.08235294, 1,
2.293209, 0.6616987, 2.65965, 1, 0, 0.07843138, 1,
2.322346, 1.857943, -0.2426308, 1, 0, 0.07058824, 1,
2.336275, 0.5430135, 1.333089, 1, 0, 0.06666667, 1,
2.338805, -1.016097, 0.9921142, 1, 0, 0.05882353, 1,
2.351701, 0.6512494, 0.6950088, 1, 0, 0.05490196, 1,
2.425109, 0.7995863, 0.918106, 1, 0, 0.04705882, 1,
2.489434, -1.487093, 1.749228, 1, 0, 0.04313726, 1,
2.502859, 0.7056239, 2.334364, 1, 0, 0.03529412, 1,
2.690165, -1.618351, 2.471858, 1, 0, 0.03137255, 1,
2.743419, 1.826347, 0.4191944, 1, 0, 0.02352941, 1,
3.108753, -2.240172, 1.333851, 1, 0, 0.01960784, 1,
3.142453, 0.5940706, -0.8836559, 1, 0, 0.01176471, 1,
3.357852, 0.5816597, 2.556466, 1, 0, 0.007843138, 1
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
0.06845343, -3.486417, -7.174966, 0, -0.5, 0.5, 0.5,
0.06845343, -3.486417, -7.174966, 1, -0.5, 0.5, 0.5,
0.06845343, -3.486417, -7.174966, 1, 1.5, 0.5, 0.5,
0.06845343, -3.486417, -7.174966, 0, 1.5, 0.5, 0.5
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
-4.336052, 0.3362291, -7.174966, 0, -0.5, 0.5, 0.5,
-4.336052, 0.3362291, -7.174966, 1, -0.5, 0.5, 0.5,
-4.336052, 0.3362291, -7.174966, 1, 1.5, 0.5, 0.5,
-4.336052, 0.3362291, -7.174966, 0, 1.5, 0.5, 0.5
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
-4.336052, -3.486417, 0.1972394, 0, -0.5, 0.5, 0.5,
-4.336052, -3.486417, 0.1972394, 1, -0.5, 0.5, 0.5,
-4.336052, -3.486417, 0.1972394, 1, 1.5, 0.5, 0.5,
-4.336052, -3.486417, 0.1972394, 0, 1.5, 0.5, 0.5
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
-3, -2.604268, -5.473688,
3, -2.604268, -5.473688,
-3, -2.604268, -5.473688,
-3, -2.751293, -5.757235,
-2, -2.604268, -5.473688,
-2, -2.751293, -5.757235,
-1, -2.604268, -5.473688,
-1, -2.751293, -5.757235,
0, -2.604268, -5.473688,
0, -2.751293, -5.757235,
1, -2.604268, -5.473688,
1, -2.751293, -5.757235,
2, -2.604268, -5.473688,
2, -2.751293, -5.757235,
3, -2.604268, -5.473688,
3, -2.751293, -5.757235
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
-3, -3.045343, -6.324327, 0, -0.5, 0.5, 0.5,
-3, -3.045343, -6.324327, 1, -0.5, 0.5, 0.5,
-3, -3.045343, -6.324327, 1, 1.5, 0.5, 0.5,
-3, -3.045343, -6.324327, 0, 1.5, 0.5, 0.5,
-2, -3.045343, -6.324327, 0, -0.5, 0.5, 0.5,
-2, -3.045343, -6.324327, 1, -0.5, 0.5, 0.5,
-2, -3.045343, -6.324327, 1, 1.5, 0.5, 0.5,
-2, -3.045343, -6.324327, 0, 1.5, 0.5, 0.5,
-1, -3.045343, -6.324327, 0, -0.5, 0.5, 0.5,
-1, -3.045343, -6.324327, 1, -0.5, 0.5, 0.5,
-1, -3.045343, -6.324327, 1, 1.5, 0.5, 0.5,
-1, -3.045343, -6.324327, 0, 1.5, 0.5, 0.5,
0, -3.045343, -6.324327, 0, -0.5, 0.5, 0.5,
0, -3.045343, -6.324327, 1, -0.5, 0.5, 0.5,
0, -3.045343, -6.324327, 1, 1.5, 0.5, 0.5,
0, -3.045343, -6.324327, 0, 1.5, 0.5, 0.5,
1, -3.045343, -6.324327, 0, -0.5, 0.5, 0.5,
1, -3.045343, -6.324327, 1, -0.5, 0.5, 0.5,
1, -3.045343, -6.324327, 1, 1.5, 0.5, 0.5,
1, -3.045343, -6.324327, 0, 1.5, 0.5, 0.5,
2, -3.045343, -6.324327, 0, -0.5, 0.5, 0.5,
2, -3.045343, -6.324327, 1, -0.5, 0.5, 0.5,
2, -3.045343, -6.324327, 1, 1.5, 0.5, 0.5,
2, -3.045343, -6.324327, 0, 1.5, 0.5, 0.5,
3, -3.045343, -6.324327, 0, -0.5, 0.5, 0.5,
3, -3.045343, -6.324327, 1, -0.5, 0.5, 0.5,
3, -3.045343, -6.324327, 1, 1.5, 0.5, 0.5,
3, -3.045343, -6.324327, 0, 1.5, 0.5, 0.5
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
-3.319628, -2, -5.473688,
-3.319628, 3, -5.473688,
-3.319628, -2, -5.473688,
-3.489032, -2, -5.757235,
-3.319628, -1, -5.473688,
-3.489032, -1, -5.757235,
-3.319628, 0, -5.473688,
-3.489032, 0, -5.757235,
-3.319628, 1, -5.473688,
-3.489032, 1, -5.757235,
-3.319628, 2, -5.473688,
-3.489032, 2, -5.757235,
-3.319628, 3, -5.473688,
-3.489032, 3, -5.757235
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
-3.82784, -2, -6.324327, 0, -0.5, 0.5, 0.5,
-3.82784, -2, -6.324327, 1, -0.5, 0.5, 0.5,
-3.82784, -2, -6.324327, 1, 1.5, 0.5, 0.5,
-3.82784, -2, -6.324327, 0, 1.5, 0.5, 0.5,
-3.82784, -1, -6.324327, 0, -0.5, 0.5, 0.5,
-3.82784, -1, -6.324327, 1, -0.5, 0.5, 0.5,
-3.82784, -1, -6.324327, 1, 1.5, 0.5, 0.5,
-3.82784, -1, -6.324327, 0, 1.5, 0.5, 0.5,
-3.82784, 0, -6.324327, 0, -0.5, 0.5, 0.5,
-3.82784, 0, -6.324327, 1, -0.5, 0.5, 0.5,
-3.82784, 0, -6.324327, 1, 1.5, 0.5, 0.5,
-3.82784, 0, -6.324327, 0, 1.5, 0.5, 0.5,
-3.82784, 1, -6.324327, 0, -0.5, 0.5, 0.5,
-3.82784, 1, -6.324327, 1, -0.5, 0.5, 0.5,
-3.82784, 1, -6.324327, 1, 1.5, 0.5, 0.5,
-3.82784, 1, -6.324327, 0, 1.5, 0.5, 0.5,
-3.82784, 2, -6.324327, 0, -0.5, 0.5, 0.5,
-3.82784, 2, -6.324327, 1, -0.5, 0.5, 0.5,
-3.82784, 2, -6.324327, 1, 1.5, 0.5, 0.5,
-3.82784, 2, -6.324327, 0, 1.5, 0.5, 0.5,
-3.82784, 3, -6.324327, 0, -0.5, 0.5, 0.5,
-3.82784, 3, -6.324327, 1, -0.5, 0.5, 0.5,
-3.82784, 3, -6.324327, 1, 1.5, 0.5, 0.5,
-3.82784, 3, -6.324327, 0, 1.5, 0.5, 0.5
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
-3.319628, -2.604268, -4,
-3.319628, -2.604268, 4,
-3.319628, -2.604268, -4,
-3.489032, -2.751293, -4,
-3.319628, -2.604268, -2,
-3.489032, -2.751293, -2,
-3.319628, -2.604268, 0,
-3.489032, -2.751293, 0,
-3.319628, -2.604268, 2,
-3.489032, -2.751293, 2,
-3.319628, -2.604268, 4,
-3.489032, -2.751293, 4
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
-3.82784, -3.045343, -4, 0, -0.5, 0.5, 0.5,
-3.82784, -3.045343, -4, 1, -0.5, 0.5, 0.5,
-3.82784, -3.045343, -4, 1, 1.5, 0.5, 0.5,
-3.82784, -3.045343, -4, 0, 1.5, 0.5, 0.5,
-3.82784, -3.045343, -2, 0, -0.5, 0.5, 0.5,
-3.82784, -3.045343, -2, 1, -0.5, 0.5, 0.5,
-3.82784, -3.045343, -2, 1, 1.5, 0.5, 0.5,
-3.82784, -3.045343, -2, 0, 1.5, 0.5, 0.5,
-3.82784, -3.045343, 0, 0, -0.5, 0.5, 0.5,
-3.82784, -3.045343, 0, 1, -0.5, 0.5, 0.5,
-3.82784, -3.045343, 0, 1, 1.5, 0.5, 0.5,
-3.82784, -3.045343, 0, 0, 1.5, 0.5, 0.5,
-3.82784, -3.045343, 2, 0, -0.5, 0.5, 0.5,
-3.82784, -3.045343, 2, 1, -0.5, 0.5, 0.5,
-3.82784, -3.045343, 2, 1, 1.5, 0.5, 0.5,
-3.82784, -3.045343, 2, 0, 1.5, 0.5, 0.5,
-3.82784, -3.045343, 4, 0, -0.5, 0.5, 0.5,
-3.82784, -3.045343, 4, 1, -0.5, 0.5, 0.5,
-3.82784, -3.045343, 4, 1, 1.5, 0.5, 0.5,
-3.82784, -3.045343, 4, 0, 1.5, 0.5, 0.5
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
-3.319628, -2.604268, -5.473688,
-3.319628, 3.276726, -5.473688,
-3.319628, -2.604268, 5.868167,
-3.319628, 3.276726, 5.868167,
-3.319628, -2.604268, -5.473688,
-3.319628, -2.604268, 5.868167,
-3.319628, 3.276726, -5.473688,
-3.319628, 3.276726, 5.868167,
-3.319628, -2.604268, -5.473688,
3.456534, -2.604268, -5.473688,
-3.319628, -2.604268, 5.868167,
3.456534, -2.604268, 5.868167,
-3.319628, 3.276726, -5.473688,
3.456534, 3.276726, -5.473688,
-3.319628, 3.276726, 5.868167,
3.456534, 3.276726, 5.868167,
3.456534, -2.604268, -5.473688,
3.456534, 3.276726, -5.473688,
3.456534, -2.604268, 5.868167,
3.456534, 3.276726, 5.868167,
3.456534, -2.604268, -5.473688,
3.456534, -2.604268, 5.868167,
3.456534, 3.276726, -5.473688,
3.456534, 3.276726, 5.868167
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
var radius = 7.722255;
var distance = 34.35719;
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
mvMatrix.translate( -0.06845343, -0.3362291, -0.1972394 );
mvMatrix.scale( 1.23218, 1.419735, 0.736163 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.35719);
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
imazethapyr<-read.table("imazethapyr.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-imazethapyr$V2
```

```
## Error in eval(expr, envir, enclos): object 'imazethapyr' not found
```

```r
y<-imazethapyr$V3
```

```
## Error in eval(expr, envir, enclos): object 'imazethapyr' not found
```

```r
z<-imazethapyr$V4
```

```
## Error in eval(expr, envir, enclos): object 'imazethapyr' not found
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
-3.220946, -0.2597409, -2.86264, 0, 0, 1, 1, 1,
-2.756794, -0.5665382, -1.775666, 1, 0, 0, 1, 1,
-2.593675, 0.2244034, -3.180278, 1, 0, 0, 1, 1,
-2.426617, 0.1447177, -2.390053, 1, 0, 0, 1, 1,
-2.369443, 0.3354459, -0.7038313, 1, 0, 0, 1, 1,
-2.297528, 0.4172542, -1.660852, 1, 0, 0, 1, 1,
-2.290757, 0.3189836, -1.294364, 0, 0, 0, 1, 1,
-2.268713, -1.270637, -2.271356, 0, 0, 0, 1, 1,
-2.128116, 0.8166567, -1.386422, 0, 0, 0, 1, 1,
-2.115716, -0.522741, -1.927019, 0, 0, 0, 1, 1,
-2.074213, -2.295074, -2.653798, 0, 0, 0, 1, 1,
-2.065643, -0.3990206, -3.513722, 0, 0, 0, 1, 1,
-2.056407, -1.43649, -3.292372, 0, 0, 0, 1, 1,
-2.033942, -0.3256458, -0.8682916, 1, 1, 1, 1, 1,
-2.020133, -0.8680257, -1.651163, 1, 1, 1, 1, 1,
-1.995633, 0.3449729, -1.570282, 1, 1, 1, 1, 1,
-1.993029, -1.526378, -0.8006919, 1, 1, 1, 1, 1,
-1.965007, 1.324059, 0.2418234, 1, 1, 1, 1, 1,
-1.96006, -0.5692371, -0.3678513, 1, 1, 1, 1, 1,
-1.947412, -1.551615, -2.130975, 1, 1, 1, 1, 1,
-1.942551, 0.2719115, -1.411731, 1, 1, 1, 1, 1,
-1.879379, -0.7953113, -3.968742, 1, 1, 1, 1, 1,
-1.86556, 0.8877105, -2.982185, 1, 1, 1, 1, 1,
-1.864057, -0.3556212, -1.999343, 1, 1, 1, 1, 1,
-1.860601, -0.1941488, -2.071112, 1, 1, 1, 1, 1,
-1.847726, 0.1619335, -2.107974, 1, 1, 1, 1, 1,
-1.825174, -1.025306, -1.218605, 1, 1, 1, 1, 1,
-1.802632, -0.4645725, -0.777164, 1, 1, 1, 1, 1,
-1.801841, 0.9705117, -0.1941753, 0, 0, 1, 1, 1,
-1.797789, 0.4629139, -2.390181, 1, 0, 0, 1, 1,
-1.792706, -1.275287, -2.521234, 1, 0, 0, 1, 1,
-1.781386, -1.160587, -4.077489, 1, 0, 0, 1, 1,
-1.757868, 0.528162, -1.001637, 1, 0, 0, 1, 1,
-1.756624, -1.196474, -2.442941, 1, 0, 0, 1, 1,
-1.751653, 1.76023, -0.1332084, 0, 0, 0, 1, 1,
-1.749856, 0.04881094, -1.357017, 0, 0, 0, 1, 1,
-1.746662, 0.3497608, -0.4379715, 0, 0, 0, 1, 1,
-1.724752, 0.321812, 1.059503, 0, 0, 0, 1, 1,
-1.724149, 0.7786505, -0.8631225, 0, 0, 0, 1, 1,
-1.714258, -1.804435, -1.563124, 0, 0, 0, 1, 1,
-1.70821, 0.5345894, -2.035975, 0, 0, 0, 1, 1,
-1.696725, -1.428258, -0.2324203, 1, 1, 1, 1, 1,
-1.687268, 0.07454302, 0.7106671, 1, 1, 1, 1, 1,
-1.682643, -0.4202826, -0.8128549, 1, 1, 1, 1, 1,
-1.678743, -1.042166, -2.86963, 1, 1, 1, 1, 1,
-1.673565, 0.3630098, -2.584627, 1, 1, 1, 1, 1,
-1.656321, 0.6342211, -0.6940927, 1, 1, 1, 1, 1,
-1.645408, -0.354858, -2.601684, 1, 1, 1, 1, 1,
-1.627516, -0.4655032, -0.1709793, 1, 1, 1, 1, 1,
-1.615424, 0.3789493, -1.287295, 1, 1, 1, 1, 1,
-1.594176, 0.9014646, -1.640079, 1, 1, 1, 1, 1,
-1.590334, -1.694545, -1.104416, 1, 1, 1, 1, 1,
-1.583583, 0.1853937, -1.378675, 1, 1, 1, 1, 1,
-1.583532, -0.02808792, -1.180152, 1, 1, 1, 1, 1,
-1.579476, 0.2459219, -0.9620219, 1, 1, 1, 1, 1,
-1.562548, 2.247802, 0.33885, 1, 1, 1, 1, 1,
-1.561417, -1.394165, -1.063537, 0, 0, 1, 1, 1,
-1.544321, -1.865978, -2.805068, 1, 0, 0, 1, 1,
-1.543673, 0.632552, -2.992919, 1, 0, 0, 1, 1,
-1.543366, -1.455359, -2.11495, 1, 0, 0, 1, 1,
-1.533561, 0.5583454, -4.451557, 1, 0, 0, 1, 1,
-1.520238, -2.32507, -1.94619, 1, 0, 0, 1, 1,
-1.515383, -0.1808892, -1.39143, 0, 0, 0, 1, 1,
-1.506689, -1.010243, -3.469413, 0, 0, 0, 1, 1,
-1.505735, -0.4032834, -1.442875, 0, 0, 0, 1, 1,
-1.502923, 0.595603, -2.107276, 0, 0, 0, 1, 1,
-1.501424, 0.3443232, -1.926117, 0, 0, 0, 1, 1,
-1.498688, 0.743636, -0.1895972, 0, 0, 0, 1, 1,
-1.486212, 1.269544, -2.16053, 0, 0, 0, 1, 1,
-1.484025, 0.5295725, -0.6375131, 1, 1, 1, 1, 1,
-1.482453, 1.896088, 0.4413807, 1, 1, 1, 1, 1,
-1.478354, 0.7643442, -0.5575975, 1, 1, 1, 1, 1,
-1.476114, -0.6649352, -2.406645, 1, 1, 1, 1, 1,
-1.446619, 1.283884, -2.74421, 1, 1, 1, 1, 1,
-1.439609, -1.37634, -1.697643, 1, 1, 1, 1, 1,
-1.43507, 0.3902138, -1.261762, 1, 1, 1, 1, 1,
-1.429728, 0.3578296, -2.613021, 1, 1, 1, 1, 1,
-1.423923, -1.083772, -2.53175, 1, 1, 1, 1, 1,
-1.418869, -0.8307852, -1.530087, 1, 1, 1, 1, 1,
-1.416305, 0.145611, -0.7738389, 1, 1, 1, 1, 1,
-1.414276, 0.1523312, -1.106543, 1, 1, 1, 1, 1,
-1.405868, 2.365319, -2.086007, 1, 1, 1, 1, 1,
-1.405028, 0.8217032, -0.6163441, 1, 1, 1, 1, 1,
-1.395433, -0.07524199, -1.554643, 1, 1, 1, 1, 1,
-1.382584, -1.623984, -4.809732, 0, 0, 1, 1, 1,
-1.37416, -0.438583, -1.057742, 1, 0, 0, 1, 1,
-1.369871, -0.715676, -3.813762, 1, 0, 0, 1, 1,
-1.369787, 1.197471, -1.255361, 1, 0, 0, 1, 1,
-1.368736, -0.3072597, -1.335263, 1, 0, 0, 1, 1,
-1.357335, -1.67344, -2.165008, 1, 0, 0, 1, 1,
-1.354908, 0.4936237, -1.418769, 0, 0, 0, 1, 1,
-1.345755, 0.6921918, 0.5900536, 0, 0, 0, 1, 1,
-1.338858, 0.05740051, -2.121353, 0, 0, 0, 1, 1,
-1.330303, -0.796121, -1.411816, 0, 0, 0, 1, 1,
-1.320652, 0.9235477, 0.8557954, 0, 0, 0, 1, 1,
-1.318801, 0.8113227, -1.637146, 0, 0, 0, 1, 1,
-1.305971, 0.7912104, -0.4816825, 0, 0, 0, 1, 1,
-1.305879, 1.600867, 0.9167293, 1, 1, 1, 1, 1,
-1.302463, 0.319218, -1.349404, 1, 1, 1, 1, 1,
-1.292746, 0.3265844, -1.183398, 1, 1, 1, 1, 1,
-1.283375, 0.3959787, -0.8477113, 1, 1, 1, 1, 1,
-1.277712, -0.6505821, -0.2664138, 1, 1, 1, 1, 1,
-1.277168, -1.95036, -2.059013, 1, 1, 1, 1, 1,
-1.276237, 0.9955543, 0.3949168, 1, 1, 1, 1, 1,
-1.259976, 0.1783372, -1.648658, 1, 1, 1, 1, 1,
-1.256537, -1.019014, -2.282777, 1, 1, 1, 1, 1,
-1.252649, -0.555859, -2.435793, 1, 1, 1, 1, 1,
-1.239245, -0.1891839, -1.748081, 1, 1, 1, 1, 1,
-1.2362, -0.2051764, -4.105347, 1, 1, 1, 1, 1,
-1.229373, 0.719611, -1.407453, 1, 1, 1, 1, 1,
-1.223493, -0.7341308, -2.968901, 1, 1, 1, 1, 1,
-1.220979, 1.595724, -0.6045343, 1, 1, 1, 1, 1,
-1.212417, -1.281503, -4.183111, 0, 0, 1, 1, 1,
-1.212013, 0.7517664, -0.226926, 1, 0, 0, 1, 1,
-1.198243, 1.008919, -0.7906844, 1, 0, 0, 1, 1,
-1.196224, -1.265063, -1.900705, 1, 0, 0, 1, 1,
-1.1779, 1.804344, -0.541331, 1, 0, 0, 1, 1,
-1.169948, 1.590876, 0.4423371, 1, 0, 0, 1, 1,
-1.161568, 0.2336661, -0.6698587, 0, 0, 0, 1, 1,
-1.158342, -1.981834, -3.831856, 0, 0, 0, 1, 1,
-1.153777, 0.7563748, -2.413654, 0, 0, 0, 1, 1,
-1.151126, 0.4619766, -1.410789, 0, 0, 0, 1, 1,
-1.150282, -0.3174419, -1.202516, 0, 0, 0, 1, 1,
-1.143424, -0.6767436, -2.161, 0, 0, 0, 1, 1,
-1.137217, 0.7176951, -0.7525192, 0, 0, 0, 1, 1,
-1.132478, -0.7925585, -2.944615, 1, 1, 1, 1, 1,
-1.128739, -0.8869424, -2.982707, 1, 1, 1, 1, 1,
-1.124418, 0.4507292, -0.5447555, 1, 1, 1, 1, 1,
-1.122226, -0.1657186, -2.25948, 1, 1, 1, 1, 1,
-1.116715, 1.727914, 0.6336448, 1, 1, 1, 1, 1,
-1.114549, 1.272934, -1.39433, 1, 1, 1, 1, 1,
-1.111965, 1.320153, -0.4326921, 1, 1, 1, 1, 1,
-1.105152, -0.6321515, -2.519832, 1, 1, 1, 1, 1,
-1.098725, -0.5762209, -2.651755, 1, 1, 1, 1, 1,
-1.09799, 0.1135254, -2.575487, 1, 1, 1, 1, 1,
-1.095731, 1.509157, -1.900047, 1, 1, 1, 1, 1,
-1.088308, -0.06847461, -0.3657583, 1, 1, 1, 1, 1,
-1.075765, -1.548562, -1.468468, 1, 1, 1, 1, 1,
-1.072523, 0.828185, 0.06281471, 1, 1, 1, 1, 1,
-1.067782, 0.2898083, -2.311899, 1, 1, 1, 1, 1,
-1.061487, -1.136532, -2.083826, 0, 0, 1, 1, 1,
-1.058417, -0.4444473, -3.889568, 1, 0, 0, 1, 1,
-1.05762, 1.511135, 0.1282052, 1, 0, 0, 1, 1,
-1.055975, -1.228931, -1.572855, 1, 0, 0, 1, 1,
-1.04825, -0.6697807, -0.7020273, 1, 0, 0, 1, 1,
-1.044282, 1.254772, -2.20208, 1, 0, 0, 1, 1,
-1.034752, 0.2829753, -1.968494, 0, 0, 0, 1, 1,
-1.032613, 0.4267898, -0.6328803, 0, 0, 0, 1, 1,
-1.027743, 0.04111727, -1.007325, 0, 0, 0, 1, 1,
-1.022777, 3.191081, -1.843164, 0, 0, 0, 1, 1,
-1.017571, 1.012158, -0.9606401, 0, 0, 0, 1, 1,
-1.011232, 1.75406, -1.172379, 0, 0, 0, 1, 1,
-1.008033, -0.8586369, -2.280573, 0, 0, 0, 1, 1,
-1.002903, 0.7224385, -1.596311, 1, 1, 1, 1, 1,
-1.000917, -0.234367, -1.525287, 1, 1, 1, 1, 1,
-0.9969795, -0.5999401, -1.702301, 1, 1, 1, 1, 1,
-0.9965249, -1.348823, -1.395337, 1, 1, 1, 1, 1,
-0.9922443, 1.242766, -1.941419, 1, 1, 1, 1, 1,
-0.9802098, 1.209502, -0.9332852, 1, 1, 1, 1, 1,
-0.9794014, 0.03770405, -1.589381, 1, 1, 1, 1, 1,
-0.9784395, 0.8712314, 0.09454795, 1, 1, 1, 1, 1,
-0.9733144, 0.7770055, -0.3964712, 1, 1, 1, 1, 1,
-0.9721324, 2.5028, -0.1458217, 1, 1, 1, 1, 1,
-0.969851, 0.3727438, 0.4665207, 1, 1, 1, 1, 1,
-0.9689471, -0.5146955, -2.36898, 1, 1, 1, 1, 1,
-0.9642984, -0.6135234, -2.400694, 1, 1, 1, 1, 1,
-0.9610118, 0.2465351, -0.569583, 1, 1, 1, 1, 1,
-0.9589155, -1.275295, -2.324291, 1, 1, 1, 1, 1,
-0.9582934, -1.355651, -2.01087, 0, 0, 1, 1, 1,
-0.958015, -0.1572449, -0.5620887, 1, 0, 0, 1, 1,
-0.9561787, -1.489813, -3.396507, 1, 0, 0, 1, 1,
-0.9491605, 1.002954, 0.4446871, 1, 0, 0, 1, 1,
-0.9486098, -0.2267491, -2.550519, 1, 0, 0, 1, 1,
-0.9466236, -1.049646, -2.451781, 1, 0, 0, 1, 1,
-0.9328608, 0.8429031, -0.9107476, 0, 0, 0, 1, 1,
-0.9323817, 1.810407, -1.200854, 0, 0, 0, 1, 1,
-0.9309832, -1.858579, -1.018685, 0, 0, 0, 1, 1,
-0.92805, -0.00128098, -2.834174, 0, 0, 0, 1, 1,
-0.9279748, 1.51562, -0.1738575, 0, 0, 0, 1, 1,
-0.9219187, 0.1357341, -0.5455625, 0, 0, 0, 1, 1,
-0.9186497, 0.4333472, -0.6186032, 0, 0, 0, 1, 1,
-0.9156332, 1.320801, 0.2643032, 1, 1, 1, 1, 1,
-0.9155332, -0.1592017, -3.196332, 1, 1, 1, 1, 1,
-0.9090679, -0.9677795, -2.469355, 1, 1, 1, 1, 1,
-0.9084515, -0.4821783, -1.793836, 1, 1, 1, 1, 1,
-0.9080645, -0.1931747, -2.179369, 1, 1, 1, 1, 1,
-0.9064998, 0.3088128, -0.774694, 1, 1, 1, 1, 1,
-0.9030265, 1.241617, 1.473661, 1, 1, 1, 1, 1,
-0.9025401, 0.4764494, -1.19855, 1, 1, 1, 1, 1,
-0.9010674, 2.606697, 1.216861, 1, 1, 1, 1, 1,
-0.8943897, -0.1873817, -2.715124, 1, 1, 1, 1, 1,
-0.8930401, -0.8003491, -1.812817, 1, 1, 1, 1, 1,
-0.8923147, -0.7794542, -0.5587408, 1, 1, 1, 1, 1,
-0.8918898, -1.58343, -3.449465, 1, 1, 1, 1, 1,
-0.8879464, -1.034953, -3.068293, 1, 1, 1, 1, 1,
-0.8825737, -0.5269653, -1.709628, 1, 1, 1, 1, 1,
-0.8782367, -0.03178611, -1.419886, 0, 0, 1, 1, 1,
-0.8766671, -0.1500167, -1.434207, 1, 0, 0, 1, 1,
-0.8759751, -0.9279895, -2.306034, 1, 0, 0, 1, 1,
-0.8757538, -0.02150079, -3.418543, 1, 0, 0, 1, 1,
-0.8695151, -1.150154, -1.886849, 1, 0, 0, 1, 1,
-0.8695077, -1.732143, -3.944853, 1, 0, 0, 1, 1,
-0.8693259, 0.2094514, -1.061489, 0, 0, 0, 1, 1,
-0.8684933, -0.5835291, -2.119297, 0, 0, 0, 1, 1,
-0.8684274, 0.3013623, -2.701488, 0, 0, 0, 1, 1,
-0.8607495, -0.2936895, -1.71224, 0, 0, 0, 1, 1,
-0.8598123, 0.8798538, 0.9610715, 0, 0, 0, 1, 1,
-0.8583446, -1.069252, -3.427321, 0, 0, 0, 1, 1,
-0.8558759, -1.77806, -2.874421, 0, 0, 0, 1, 1,
-0.8513452, -0.9089307, -1.850316, 1, 1, 1, 1, 1,
-0.8506699, 1.334943, -1.64346, 1, 1, 1, 1, 1,
-0.8490624, 0.7658686, -1.449903, 1, 1, 1, 1, 1,
-0.8480226, 1.038733, -1.151251, 1, 1, 1, 1, 1,
-0.8439872, -0.3955627, -2.464846, 1, 1, 1, 1, 1,
-0.8360997, 0.5303852, -0.3942259, 1, 1, 1, 1, 1,
-0.8271948, 0.2940948, -1.003022, 1, 1, 1, 1, 1,
-0.8233582, -0.234584, -1.139801, 1, 1, 1, 1, 1,
-0.8210341, 0.4732106, -2.397511, 1, 1, 1, 1, 1,
-0.8126836, 0.2596516, 1.707015, 1, 1, 1, 1, 1,
-0.8078564, 2.076641, -0.1983466, 1, 1, 1, 1, 1,
-0.8077557, 0.3134538, -2.889846, 1, 1, 1, 1, 1,
-0.8029917, -0.5203327, -3.207225, 1, 1, 1, 1, 1,
-0.8001031, 1.555745, -2.130699, 1, 1, 1, 1, 1,
-0.7925156, 0.462714, -2.017048, 1, 1, 1, 1, 1,
-0.7908068, 2.106196, -1.44099, 0, 0, 1, 1, 1,
-0.7900957, -0.4806578, -1.71632, 1, 0, 0, 1, 1,
-0.7897237, -0.4126455, -2.963902, 1, 0, 0, 1, 1,
-0.7893073, 0.01866412, -1.392359, 1, 0, 0, 1, 1,
-0.7872628, -0.8323531, -3.704564, 1, 0, 0, 1, 1,
-0.784373, 0.2587142, -2.314726, 1, 0, 0, 1, 1,
-0.7792403, 0.1630949, -0.1078351, 0, 0, 0, 1, 1,
-0.7785259, -1.674129, -2.660455, 0, 0, 0, 1, 1,
-0.7686482, -1.356188, -3.560209, 0, 0, 0, 1, 1,
-0.7648848, 0.29609, -2.544043, 0, 0, 0, 1, 1,
-0.7590465, -0.4343539, -0.1391914, 0, 0, 0, 1, 1,
-0.7577887, -0.150401, -1.830852, 0, 0, 0, 1, 1,
-0.7571646, -0.1276209, -0.5595977, 0, 0, 0, 1, 1,
-0.7569376, -0.284902, -1.703215, 1, 1, 1, 1, 1,
-0.7515472, 0.766298, -1.876551, 1, 1, 1, 1, 1,
-0.7512892, 0.4333481, -0.5962211, 1, 1, 1, 1, 1,
-0.7406738, -2.371901, -1.482119, 1, 1, 1, 1, 1,
-0.7394858, 0.4037639, -0.8108627, 1, 1, 1, 1, 1,
-0.7388852, 1.522, -1.683622, 1, 1, 1, 1, 1,
-0.7351556, 0.06911913, -2.769853, 1, 1, 1, 1, 1,
-0.7316174, 0.8448145, -1.852241, 1, 1, 1, 1, 1,
-0.7279664, 0.7857509, 0.7039959, 1, 1, 1, 1, 1,
-0.7237881, -1.147446, -2.397794, 1, 1, 1, 1, 1,
-0.7210495, 1.625156, 0.2656892, 1, 1, 1, 1, 1,
-0.720426, 0.2738429, -0.9710227, 1, 1, 1, 1, 1,
-0.7179806, -0.5028026, -1.750782, 1, 1, 1, 1, 1,
-0.7179484, 0.4582295, -0.8676723, 1, 1, 1, 1, 1,
-0.7170884, -0.6781712, -1.062348, 1, 1, 1, 1, 1,
-0.7132394, -0.3413635, -0.8681253, 0, 0, 1, 1, 1,
-0.6958276, 2.084771, -1.684152, 1, 0, 0, 1, 1,
-0.6861175, 1.307207, -0.1741154, 1, 0, 0, 1, 1,
-0.6769758, -0.3726636, 0.1284353, 1, 0, 0, 1, 1,
-0.675678, 0.06232451, -2.054861, 1, 0, 0, 1, 1,
-0.675396, -0.562869, -1.511458, 1, 0, 0, 1, 1,
-0.673255, 1.047664, -1.063882, 0, 0, 0, 1, 1,
-0.6719594, -0.144424, -2.040825, 0, 0, 0, 1, 1,
-0.671581, 1.313743, 0.55272, 0, 0, 0, 1, 1,
-0.6693568, -1.250125, -3.052888, 0, 0, 0, 1, 1,
-0.668354, 1.146325, -0.1260183, 0, 0, 0, 1, 1,
-0.6606702, 1.112698, 0.04672196, 0, 0, 0, 1, 1,
-0.6587076, 1.72722, 0.9891384, 0, 0, 0, 1, 1,
-0.6571746, 0.3897191, -2.067057, 1, 1, 1, 1, 1,
-0.6566077, -0.5909832, -1.924248, 1, 1, 1, 1, 1,
-0.6545877, -0.4804254, -3.11395, 1, 1, 1, 1, 1,
-0.6497403, 1.489185, -0.1696464, 1, 1, 1, 1, 1,
-0.645092, -1.005473, -3.596577, 1, 1, 1, 1, 1,
-0.6431376, -0.9758638, -3.186825, 1, 1, 1, 1, 1,
-0.641432, -0.1860097, -1.580342, 1, 1, 1, 1, 1,
-0.6374385, 0.1116877, -1.669717, 1, 1, 1, 1, 1,
-0.6269948, 1.414503, -0.6436286, 1, 1, 1, 1, 1,
-0.6252836, 0.4174921, 0.2594469, 1, 1, 1, 1, 1,
-0.6161569, 1.373045, 0.0831736, 1, 1, 1, 1, 1,
-0.6159657, 1.046946, 0.9432681, 1, 1, 1, 1, 1,
-0.6154641, 0.5801091, -1.198632, 1, 1, 1, 1, 1,
-0.6115018, -1.953947, -3.840178, 1, 1, 1, 1, 1,
-0.6112449, 0.6332019, -2.147004, 1, 1, 1, 1, 1,
-0.6100461, 0.1928481, -2.215665, 0, 0, 1, 1, 1,
-0.6013782, -0.8996602, -3.32889, 1, 0, 0, 1, 1,
-0.5994199, 0.2591668, 0.2336197, 1, 0, 0, 1, 1,
-0.5962123, -0.7973878, -1.424069, 1, 0, 0, 1, 1,
-0.5935724, -0.7382062, -3.819752, 1, 0, 0, 1, 1,
-0.5909286, -1.266363, -4.792802, 1, 0, 0, 1, 1,
-0.5834376, 1.939797, 1.371208, 0, 0, 0, 1, 1,
-0.5824341, 1.624848, 0.02701821, 0, 0, 0, 1, 1,
-0.5813552, -0.247106, -1.952803, 0, 0, 0, 1, 1,
-0.5812265, -0.5184485, -0.8248784, 0, 0, 0, 1, 1,
-0.5798735, 1.224092, -0.4310385, 0, 0, 0, 1, 1,
-0.5789188, -0.4640121, -1.806221, 0, 0, 0, 1, 1,
-0.5754245, -0.06218496, -1.779749, 0, 0, 0, 1, 1,
-0.5748681, 0.2937549, 0.146745, 1, 1, 1, 1, 1,
-0.5739585, 0.02510463, -2.820578, 1, 1, 1, 1, 1,
-0.5724373, 0.8765357, -0.593594, 1, 1, 1, 1, 1,
-0.5669659, 1.810428, 0.2532962, 1, 1, 1, 1, 1,
-0.5644725, 1.371255, -1.324952, 1, 1, 1, 1, 1,
-0.5613393, -1.292789, -1.438269, 1, 1, 1, 1, 1,
-0.5582253, -0.720786, -2.198061, 1, 1, 1, 1, 1,
-0.5556082, -0.6915255, -1.401387, 1, 1, 1, 1, 1,
-0.5532038, -0.06504393, -0.9384828, 1, 1, 1, 1, 1,
-0.5489445, 2.954947, -1.090833, 1, 1, 1, 1, 1,
-0.5436475, -0.06604132, -2.324826, 1, 1, 1, 1, 1,
-0.5433069, 0.7295907, -0.06594859, 1, 1, 1, 1, 1,
-0.5364512, 1.392506, 0.5900976, 1, 1, 1, 1, 1,
-0.5353336, 0.7220641, 0.1352149, 1, 1, 1, 1, 1,
-0.5301937, -1.332881, -2.142519, 1, 1, 1, 1, 1,
-0.5298654, 0.1226762, -1.541974, 0, 0, 1, 1, 1,
-0.5243264, 1.3533, -0.5152471, 1, 0, 0, 1, 1,
-0.5210498, -0.5723252, -1.697541, 1, 0, 0, 1, 1,
-0.5084314, -0.3099371, -2.445449, 1, 0, 0, 1, 1,
-0.503781, 0.6337996, -1.595087, 1, 0, 0, 1, 1,
-0.4966221, -1.785539, -2.132383, 1, 0, 0, 1, 1,
-0.4914311, -0.09622863, -2.230087, 0, 0, 0, 1, 1,
-0.4911999, 0.1181454, -1.646418, 0, 0, 0, 1, 1,
-0.4807908, 0.3050262, -2.237446, 0, 0, 0, 1, 1,
-0.4769295, 0.3565818, -0.4001277, 0, 0, 0, 1, 1,
-0.4681494, -0.5840554, -2.797699, 0, 0, 0, 1, 1,
-0.4667156, -0.660723, -4.12323, 0, 0, 0, 1, 1,
-0.4658751, 0.1318777, 0.01953468, 0, 0, 0, 1, 1,
-0.4617039, 0.03540427, -1.102323, 1, 1, 1, 1, 1,
-0.4571792, -0.1057758, -2.154635, 1, 1, 1, 1, 1,
-0.4569575, -1.806642, -1.857171, 1, 1, 1, 1, 1,
-0.453754, 0.5399472, -0.5594151, 1, 1, 1, 1, 1,
-0.4439523, -1.884153, -3.199258, 1, 1, 1, 1, 1,
-0.4356487, -0.8498087, -1.92271, 1, 1, 1, 1, 1,
-0.4350256, -0.03947416, -1.989352, 1, 1, 1, 1, 1,
-0.4336201, 1.241838, -1.341067, 1, 1, 1, 1, 1,
-0.4329928, -0.06856128, -1.603592, 1, 1, 1, 1, 1,
-0.4291617, 0.04673703, -1.392929, 1, 1, 1, 1, 1,
-0.4281047, -0.7017844, -1.85389, 1, 1, 1, 1, 1,
-0.4229774, -0.5303413, -3.855414, 1, 1, 1, 1, 1,
-0.420065, -1.297327, -1.953033, 1, 1, 1, 1, 1,
-0.4172941, -0.07595667, -2.741916, 1, 1, 1, 1, 1,
-0.4166951, -0.02673271, -2.666763, 1, 1, 1, 1, 1,
-0.4125422, 0.3524236, -1.442064, 0, 0, 1, 1, 1,
-0.4108749, -0.7964669, -0.9442878, 1, 0, 0, 1, 1,
-0.4037763, -0.9411181, -3.662074, 1, 0, 0, 1, 1,
-0.4025885, 1.031105, 1.5089, 1, 0, 0, 1, 1,
-0.3949051, 1.028709, -0.8817174, 1, 0, 0, 1, 1,
-0.3932831, -1.339335, -1.029816, 1, 0, 0, 1, 1,
-0.3925137, 0.4417039, 0.5058153, 0, 0, 0, 1, 1,
-0.3922893, 0.9808768, -0.009631636, 0, 0, 0, 1, 1,
-0.3879042, 0.738688, -1.166052, 0, 0, 0, 1, 1,
-0.3861686, -0.003739629, -3.30409, 0, 0, 0, 1, 1,
-0.3762912, 1.818905, 0.125483, 0, 0, 0, 1, 1,
-0.3732193, 1.092968, 0.4608675, 0, 0, 0, 1, 1,
-0.3682832, -1.753693, -2.772503, 0, 0, 0, 1, 1,
-0.3639835, 1.367272, -4.697795, 1, 1, 1, 1, 1,
-0.3613228, 0.4095167, -0.2146464, 1, 1, 1, 1, 1,
-0.3607437, -0.8880063, -3.567806, 1, 1, 1, 1, 1,
-0.3599105, 0.6686948, -1.315259, 1, 1, 1, 1, 1,
-0.3582477, 1.205823, -0.7417403, 1, 1, 1, 1, 1,
-0.357894, 1.553243, -0.9734875, 1, 1, 1, 1, 1,
-0.3554057, -0.4431719, -0.5159196, 1, 1, 1, 1, 1,
-0.3548269, 0.5980631, -0.3232571, 1, 1, 1, 1, 1,
-0.3508563, 1.226989, 0.04164673, 1, 1, 1, 1, 1,
-0.3449271, -1.118452, -3.532753, 1, 1, 1, 1, 1,
-0.3418157, -0.1238518, -1.624482, 1, 1, 1, 1, 1,
-0.3412668, -0.5743465, -2.836582, 1, 1, 1, 1, 1,
-0.3412488, -0.2717576, -2.789268, 1, 1, 1, 1, 1,
-0.336157, -0.08850253, -2.523458, 1, 1, 1, 1, 1,
-0.3361329, -0.4714747, -2.675425, 1, 1, 1, 1, 1,
-0.3348548, -0.04068784, -1.792827, 0, 0, 1, 1, 1,
-0.3319308, -0.1609395, -3.363509, 1, 0, 0, 1, 1,
-0.327731, 1.275141, -0.04350249, 1, 0, 0, 1, 1,
-0.3262631, 0.06300312, 0.6947145, 1, 0, 0, 1, 1,
-0.3254797, -1.716131, -4.175094, 1, 0, 0, 1, 1,
-0.3213537, -0.1451157, -1.813068, 1, 0, 0, 1, 1,
-0.3200552, -0.9594792, -2.136996, 0, 0, 0, 1, 1,
-0.3183423, 0.9550155, -0.08402307, 0, 0, 0, 1, 1,
-0.3176853, -0.5954844, -2.148893, 0, 0, 0, 1, 1,
-0.3127458, 0.3643082, -0.561043, 0, 0, 0, 1, 1,
-0.3101, -0.1706134, -3.126566, 0, 0, 0, 1, 1,
-0.3072254, 1.010266, -1.195934, 0, 0, 0, 1, 1,
-0.306614, -1.861561, -2.383621, 0, 0, 0, 1, 1,
-0.3063187, 1.431265, -1.479083, 1, 1, 1, 1, 1,
-0.3046593, -1.056869, -3.022599, 1, 1, 1, 1, 1,
-0.3006007, -1.693367, -4.174235, 1, 1, 1, 1, 1,
-0.2855628, -1.365388, -3.338443, 1, 1, 1, 1, 1,
-0.2845208, 0.5913131, -0.9388304, 1, 1, 1, 1, 1,
-0.2791289, 0.1397921, -0.2308827, 1, 1, 1, 1, 1,
-0.278834, 0.1683616, -1.098225, 1, 1, 1, 1, 1,
-0.2783213, -0.2270086, -4.178611, 1, 1, 1, 1, 1,
-0.2782101, 0.5857617, -0.5081858, 1, 1, 1, 1, 1,
-0.2770762, 0.9567072, -0.2906307, 1, 1, 1, 1, 1,
-0.273597, 1.824201, -1.08526, 1, 1, 1, 1, 1,
-0.2726323, 0.03874289, -1.723654, 1, 1, 1, 1, 1,
-0.2699516, 0.596205, 0.2821248, 1, 1, 1, 1, 1,
-0.2682843, -0.6884242, -1.684154, 1, 1, 1, 1, 1,
-0.2682425, 1.012613, 0.5773745, 1, 1, 1, 1, 1,
-0.2658499, 1.832655, 1.964618, 0, 0, 1, 1, 1,
-0.2650291, 0.1416289, 0.03834859, 1, 0, 0, 1, 1,
-0.2586204, 0.5696788, -1.552336, 1, 0, 0, 1, 1,
-0.2583335, 1.07912, 0.2953722, 1, 0, 0, 1, 1,
-0.2543707, 0.4203123, -0.8719112, 1, 0, 0, 1, 1,
-0.2438317, -0.5044644, -0.6626444, 1, 0, 0, 1, 1,
-0.2393779, 0.03489823, -1.78822, 0, 0, 0, 1, 1,
-0.2386303, 2.030087, -0.1015044, 0, 0, 0, 1, 1,
-0.2355786, -0.6138123, -2.55153, 0, 0, 0, 1, 1,
-0.233073, -1.43023, -1.749128, 0, 0, 0, 1, 1,
-0.2316134, 1.226138, -0.8798543, 0, 0, 0, 1, 1,
-0.2276633, -0.3730902, -1.751944, 0, 0, 0, 1, 1,
-0.2275989, 2.302504, -0.3673107, 0, 0, 0, 1, 1,
-0.2270296, 1.900501, -1.852197, 1, 1, 1, 1, 1,
-0.2256843, -0.9530975, -3.033251, 1, 1, 1, 1, 1,
-0.2228709, 1.241744, -0.2357141, 1, 1, 1, 1, 1,
-0.2198517, 0.1590902, -1.439669, 1, 1, 1, 1, 1,
-0.2181441, 0.7235351, 0.8132794, 1, 1, 1, 1, 1,
-0.2179815, -0.3354063, -3.874544, 1, 1, 1, 1, 1,
-0.2170571, 0.17991, -2.349509, 1, 1, 1, 1, 1,
-0.2167278, 0.5594634, 0.8206231, 1, 1, 1, 1, 1,
-0.2166136, -0.5863605, -3.118398, 1, 1, 1, 1, 1,
-0.215724, -1.406498, -4.658438, 1, 1, 1, 1, 1,
-0.2153835, -0.1074394, -1.879265, 1, 1, 1, 1, 1,
-0.2124427, 2.185795, 0.1448965, 1, 1, 1, 1, 1,
-0.2109565, -2.007367, -4.556684, 1, 1, 1, 1, 1,
-0.2106079, 1.007849, -0.8575374, 1, 1, 1, 1, 1,
-0.2082495, -1.128044, -2.684456, 1, 1, 1, 1, 1,
-0.2077085, 1.042433, 0.8987513, 0, 0, 1, 1, 1,
-0.2062012, -0.5245587, -1.636104, 1, 0, 0, 1, 1,
-0.2019917, 0.04543017, -2.288006, 1, 0, 0, 1, 1,
-0.1996707, 0.6183351, -0.8626301, 1, 0, 0, 1, 1,
-0.193539, 1.887794, -1.162925, 1, 0, 0, 1, 1,
-0.1928127, -0.7894444, -3.452977, 1, 0, 0, 1, 1,
-0.1910769, -0.1075016, -1.472767, 0, 0, 0, 1, 1,
-0.1872651, -0.2007715, -1.829293, 0, 0, 0, 1, 1,
-0.185585, -0.07655984, -1.269413, 0, 0, 0, 1, 1,
-0.1827389, -0.6651447, -3.16865, 0, 0, 0, 1, 1,
-0.1814316, 1.352682, -0.1130354, 0, 0, 0, 1, 1,
-0.1768483, 0.9426264, -0.4062643, 0, 0, 0, 1, 1,
-0.1764849, 0.98299, -0.5552199, 0, 0, 0, 1, 1,
-0.1739628, -0.4618217, -3.383224, 1, 1, 1, 1, 1,
-0.1723227, -1.008386, -1.40601, 1, 1, 1, 1, 1,
-0.170755, 0.2344073, -0.8626367, 1, 1, 1, 1, 1,
-0.1687457, -1.59602, -2.504317, 1, 1, 1, 1, 1,
-0.1675138, -0.6484653, -2.051521, 1, 1, 1, 1, 1,
-0.1628657, 2.105965, 0.19184, 1, 1, 1, 1, 1,
-0.1585299, -0.6270477, -4.329424, 1, 1, 1, 1, 1,
-0.1581481, 1.38258, 1.0158, 1, 1, 1, 1, 1,
-0.1526129, 0.2405814, -0.5998691, 1, 1, 1, 1, 1,
-0.1503541, 1.873252, -1.780848, 1, 1, 1, 1, 1,
-0.1468471, -1.727793, -3.143967, 1, 1, 1, 1, 1,
-0.1405766, -0.1601116, -1.688916, 1, 1, 1, 1, 1,
-0.1403672, 0.3619388, -1.494493, 1, 1, 1, 1, 1,
-0.138136, 0.3545757, 1.159027, 1, 1, 1, 1, 1,
-0.1347381, 1.400846, -0.1178054, 1, 1, 1, 1, 1,
-0.1343666, 1.319592, -0.5738302, 0, 0, 1, 1, 1,
-0.1321844, 0.832543, 0.3507217, 1, 0, 0, 1, 1,
-0.129488, -0.9885758, -2.368096, 1, 0, 0, 1, 1,
-0.129002, 0.1352634, -0.3084169, 1, 0, 0, 1, 1,
-0.1264469, 0.06095027, -1.589708, 1, 0, 0, 1, 1,
-0.1258016, 0.7515126, -1.124914, 1, 0, 0, 1, 1,
-0.1210868, -0.03960123, -1.564411, 0, 0, 0, 1, 1,
-0.1195475, -0.5597618, -3.67711, 0, 0, 0, 1, 1,
-0.1183814, -1.391238, -5.308516, 0, 0, 0, 1, 1,
-0.1173517, 0.5763642, 0.06366548, 0, 0, 0, 1, 1,
-0.117235, -1.193107, -4.0834, 0, 0, 0, 1, 1,
-0.1169412, -1.75718, -2.376399, 0, 0, 0, 1, 1,
-0.1067094, 0.2792425, -0.7265818, 0, 0, 0, 1, 1,
-0.09635423, -0.1702865, -2.837804, 1, 1, 1, 1, 1,
-0.08996199, 1.226042, 0.8266367, 1, 1, 1, 1, 1,
-0.08921753, 0.4648939, 0.9660421, 1, 1, 1, 1, 1,
-0.08810741, -0.8522012, -2.243395, 1, 1, 1, 1, 1,
-0.08392246, 0.2067457, -0.2245324, 1, 1, 1, 1, 1,
-0.07869584, 2.227895, -0.7508573, 1, 1, 1, 1, 1,
-0.07458084, 0.2920419, -0.004192031, 1, 1, 1, 1, 1,
-0.07227787, -1.385739, -1.724789, 1, 1, 1, 1, 1,
-0.07002453, 0.8360003, 1.411732, 1, 1, 1, 1, 1,
-0.06655487, -1.977914, -3.488438, 1, 1, 1, 1, 1,
-0.06440554, 0.416082, -0.132014, 1, 1, 1, 1, 1,
-0.06274479, -0.2015395, -3.164754, 1, 1, 1, 1, 1,
-0.06129244, -0.3940401, -2.094623, 1, 1, 1, 1, 1,
-0.06083145, -0.2082879, -3.022081, 1, 1, 1, 1, 1,
-0.05926533, 0.05645894, -1.321795, 1, 1, 1, 1, 1,
-0.05767576, -0.2770536, -2.315838, 0, 0, 1, 1, 1,
-0.05701329, 1.324541, 0.06703136, 1, 0, 0, 1, 1,
-0.04998355, 0.3147019, 1.007797, 1, 0, 0, 1, 1,
-0.04789266, -0.2497662, -4.742023, 1, 0, 0, 1, 1,
-0.044785, 1.621078, -0.3894895, 1, 0, 0, 1, 1,
-0.04156097, 0.333864, 1.022002, 1, 0, 0, 1, 1,
-0.04037308, 1.572131, -0.7735567, 0, 0, 0, 1, 1,
-0.0355493, 0.5032097, 0.9130301, 0, 0, 0, 1, 1,
-0.03297647, 0.9296215, -1.10643, 0, 0, 0, 1, 1,
-0.0299448, -0.864994, -3.071599, 0, 0, 0, 1, 1,
-0.02788158, 2.093004, -0.3408863, 0, 0, 0, 1, 1,
-0.02708066, 1.496103, 0.8550963, 0, 0, 0, 1, 1,
-0.0237198, -1.687967, -4.205226, 0, 0, 0, 1, 1,
-0.0213255, 0.495168, -1.515323, 1, 1, 1, 1, 1,
-0.02082116, 0.6353969, -0.8138144, 1, 1, 1, 1, 1,
-0.0187234, 1.172578, -0.001366682, 1, 1, 1, 1, 1,
-0.01324556, 0.1484651, -1.786865, 1, 1, 1, 1, 1,
-0.01227071, 1.710958, 0.7136914, 1, 1, 1, 1, 1,
-0.002051507, 0.1743322, -0.2796876, 1, 1, 1, 1, 1,
0.0021503, -0.1599767, 3.119616, 1, 1, 1, 1, 1,
0.005935478, 0.05374798, -0.6042566, 1, 1, 1, 1, 1,
0.007882427, -0.1361871, 3.166519, 1, 1, 1, 1, 1,
0.009565216, 0.3037873, 1.585371, 1, 1, 1, 1, 1,
0.01420922, -0.08063639, 2.689485, 1, 1, 1, 1, 1,
0.01458429, -0.7164848, 2.818804, 1, 1, 1, 1, 1,
0.01561056, -0.9310828, 2.411553, 1, 1, 1, 1, 1,
0.01991976, 1.023692, -0.1261298, 1, 1, 1, 1, 1,
0.0238741, -1.075854, 3.422417, 1, 1, 1, 1, 1,
0.0277749, 1.363673, 0.6548512, 0, 0, 1, 1, 1,
0.03352361, 0.8166454, 1.34409, 1, 0, 0, 1, 1,
0.03537818, 1.34906, 1.262873, 1, 0, 0, 1, 1,
0.03594976, 0.09565908, -0.1962321, 1, 0, 0, 1, 1,
0.04651019, 0.3247526, 1.762763, 1, 0, 0, 1, 1,
0.04668874, -1.021436, 2.950625, 1, 0, 0, 1, 1,
0.04882349, -0.3660668, 4.231882, 0, 0, 0, 1, 1,
0.06591211, 0.2276382, -1.840461, 0, 0, 0, 1, 1,
0.06879774, -0.5563889, 3.07806, 0, 0, 0, 1, 1,
0.07171267, 0.7354063, -0.146262, 0, 0, 0, 1, 1,
0.07435207, 0.281435, 0.7473855, 0, 0, 0, 1, 1,
0.07689335, -0.2310081, 3.036271, 0, 0, 0, 1, 1,
0.07861447, -0.3857057, 1.728915, 0, 0, 0, 1, 1,
0.0787767, 0.7113193, -0.4861837, 1, 1, 1, 1, 1,
0.08319538, 1.667812, -0.4007735, 1, 1, 1, 1, 1,
0.08610798, -0.8054602, 3.227779, 1, 1, 1, 1, 1,
0.0889237, -1.128328, 3.122473, 1, 1, 1, 1, 1,
0.0936555, 0.2178013, 1.438745, 1, 1, 1, 1, 1,
0.09482279, -0.7553559, 4.372739, 1, 1, 1, 1, 1,
0.09831534, 0.4624269, -0.5035815, 1, 1, 1, 1, 1,
0.1049117, -1.816149, 3.732343, 1, 1, 1, 1, 1,
0.1063883, 0.01240505, 2.767393, 1, 1, 1, 1, 1,
0.1067011, -1.811912, 4.067193, 1, 1, 1, 1, 1,
0.1086328, -0.1144582, 3.644492, 1, 1, 1, 1, 1,
0.1099955, 0.4567578, 0.8082314, 1, 1, 1, 1, 1,
0.110122, 0.6496928, 2.08832, 1, 1, 1, 1, 1,
0.1158449, -0.1264007, 2.792189, 1, 1, 1, 1, 1,
0.116156, -0.2312818, 2.607643, 1, 1, 1, 1, 1,
0.11981, 1.944906, 0.01572243, 0, 0, 1, 1, 1,
0.1218743, -0.4781031, 4.540641, 1, 0, 0, 1, 1,
0.122282, 0.498193, -0.8932549, 1, 0, 0, 1, 1,
0.1247318, 1.089896, -0.6885558, 1, 0, 0, 1, 1,
0.1301511, -1.511768, 2.844927, 1, 0, 0, 1, 1,
0.1352178, 0.3485579, -0.7256332, 1, 0, 0, 1, 1,
0.1398049, -1.576373, 3.11243, 0, 0, 0, 1, 1,
0.1401355, 0.2319346, 1.020365, 0, 0, 0, 1, 1,
0.1421333, 1.121361, 0.2846207, 0, 0, 0, 1, 1,
0.1433991, -0.3092359, 3.703398, 0, 0, 0, 1, 1,
0.1469865, 0.8027679, 0.6213202, 0, 0, 0, 1, 1,
0.1477636, -0.8328866, 3.355308, 0, 0, 0, 1, 1,
0.1499933, -0.3249622, 2.806538, 0, 0, 0, 1, 1,
0.1519678, 0.5077296, -0.8217976, 1, 1, 1, 1, 1,
0.1519882, 0.6634651, 2.432318, 1, 1, 1, 1, 1,
0.1566332, 0.5022497, -1.13924, 1, 1, 1, 1, 1,
0.1581595, -0.3039727, 0.3071133, 1, 1, 1, 1, 1,
0.1584556, -0.369252, 2.51309, 1, 1, 1, 1, 1,
0.165263, -0.9648025, 4.142827, 1, 1, 1, 1, 1,
0.1664357, -0.6953118, 2.677947, 1, 1, 1, 1, 1,
0.1677512, -0.6104012, 2.46103, 1, 1, 1, 1, 1,
0.1681132, -0.6240353, 3.320974, 1, 1, 1, 1, 1,
0.1684772, 1.415843, -0.507351, 1, 1, 1, 1, 1,
0.1704115, -0.3658805, 2.164282, 1, 1, 1, 1, 1,
0.1707319, 0.916144, 0.3079102, 1, 1, 1, 1, 1,
0.1750307, 0.03453344, 2.203809, 1, 1, 1, 1, 1,
0.1791922, -0.6387819, 4.186309, 1, 1, 1, 1, 1,
0.1802007, 1.289551, -0.007163933, 1, 1, 1, 1, 1,
0.1837427, 0.7220017, -0.8723401, 0, 0, 1, 1, 1,
0.1867082, -0.3006429, 1.09941, 1, 0, 0, 1, 1,
0.1886041, -0.4623756, 2.440658, 1, 0, 0, 1, 1,
0.1896023, 0.5895616, 1.434606, 1, 0, 0, 1, 1,
0.1918535, -0.8608119, 2.685283, 1, 0, 0, 1, 1,
0.2003905, 0.3798315, 0.3983943, 1, 0, 0, 1, 1,
0.2020061, 1.079036, 0.1247617, 0, 0, 0, 1, 1,
0.206792, 0.9054113, 0.03922986, 0, 0, 0, 1, 1,
0.2100362, -0.921786, 3.202329, 0, 0, 0, 1, 1,
0.2106611, -0.115153, 1.693027, 0, 0, 0, 1, 1,
0.2118427, 1.058151, 0.4637653, 0, 0, 0, 1, 1,
0.2192268, -1.008803, 4.202371, 0, 0, 0, 1, 1,
0.2196628, -0.4727744, 1.369603, 0, 0, 0, 1, 1,
0.2199554, 0.3071871, 0.1384772, 1, 1, 1, 1, 1,
0.2223627, 0.4798065, -0.5602518, 1, 1, 1, 1, 1,
0.230998, -0.8507252, 5.702994, 1, 1, 1, 1, 1,
0.235115, -0.4162696, 1.852222, 1, 1, 1, 1, 1,
0.2361856, 1.090731, 1.446134, 1, 1, 1, 1, 1,
0.2434421, -0.3173824, 3.69137, 1, 1, 1, 1, 1,
0.2444183, -0.593246, 3.145495, 1, 1, 1, 1, 1,
0.2454453, 0.02375531, 1.176565, 1, 1, 1, 1, 1,
0.2484808, 0.7341625, -1.047561, 1, 1, 1, 1, 1,
0.2529704, 0.9144522, 1.781648, 1, 1, 1, 1, 1,
0.2547826, 0.1015639, 1.704071, 1, 1, 1, 1, 1,
0.2574319, 0.5935979, -0.542607, 1, 1, 1, 1, 1,
0.2601849, 1.579146, -0.6114488, 1, 1, 1, 1, 1,
0.2607451, 0.6914659, 0.4804142, 1, 1, 1, 1, 1,
0.2609883, -1.004819, 2.832256, 1, 1, 1, 1, 1,
0.2669126, -0.6608663, 3.342374, 0, 0, 1, 1, 1,
0.2682934, -1.207852, 2.93161, 1, 0, 0, 1, 1,
0.277188, 1.312573, -0.01282861, 1, 0, 0, 1, 1,
0.2799348, 0.1235357, 0.8153231, 1, 0, 0, 1, 1,
0.2819394, 0.2901855, 2.542815, 1, 0, 0, 1, 1,
0.2844688, -0.6722227, 4.144456, 1, 0, 0, 1, 1,
0.286896, -0.3406446, 3.452288, 0, 0, 0, 1, 1,
0.2896208, 0.9092033, 0.07257105, 0, 0, 0, 1, 1,
0.2901439, -2.46854, 3.198551, 0, 0, 0, 1, 1,
0.292268, -0.1864464, 2.681125, 0, 0, 0, 1, 1,
0.2959462, -0.5808709, 3.227682, 0, 0, 0, 1, 1,
0.2973026, 0.8049629, -1.305116, 0, 0, 0, 1, 1,
0.299446, -0.996784, 2.581061, 0, 0, 0, 1, 1,
0.3001682, 1.248741, -0.2658103, 1, 1, 1, 1, 1,
0.3081034, 0.4487677, -0.6303573, 1, 1, 1, 1, 1,
0.3134566, -0.4563943, 2.757127, 1, 1, 1, 1, 1,
0.3169094, 1.792744, 1.850013, 1, 1, 1, 1, 1,
0.3183228, -0.8688023, 2.392398, 1, 1, 1, 1, 1,
0.31995, -0.6736829, 3.267048, 1, 1, 1, 1, 1,
0.3221964, 0.6708382, -0.8521529, 1, 1, 1, 1, 1,
0.324012, 0.1683217, 1.318932, 1, 1, 1, 1, 1,
0.3271864, 0.03595892, 0.7753776, 1, 1, 1, 1, 1,
0.3294288, 0.7017524, -0.5932118, 1, 1, 1, 1, 1,
0.3306585, 1.092127, -0.7018414, 1, 1, 1, 1, 1,
0.3355713, -0.7822506, 2.461811, 1, 1, 1, 1, 1,
0.3399775, 0.6743384, -0.1907904, 1, 1, 1, 1, 1,
0.3412739, 0.02494046, 2.433194, 1, 1, 1, 1, 1,
0.3435817, 0.09663136, 0.270283, 1, 1, 1, 1, 1,
0.3473263, 1.873389, 0.2547631, 0, 0, 1, 1, 1,
0.3474061, 0.9903837, -1.620446, 1, 0, 0, 1, 1,
0.349848, -0.2032306, 2.545045, 1, 0, 0, 1, 1,
0.3520282, 1.043883, -0.2679155, 1, 0, 0, 1, 1,
0.3556923, 0.2512783, 0.9465128, 1, 0, 0, 1, 1,
0.3579698, 0.2884238, 0.2856346, 1, 0, 0, 1, 1,
0.3638523, 0.6300892, 1.591644, 0, 0, 0, 1, 1,
0.3646386, -1.213729, 2.958467, 0, 0, 0, 1, 1,
0.3653766, 0.3856887, 0.8770626, 0, 0, 0, 1, 1,
0.3708724, -0.07894795, 1.705937, 0, 0, 0, 1, 1,
0.3712548, 0.1599099, 2.735059, 0, 0, 0, 1, 1,
0.3748807, -0.6278714, 1.477519, 0, 0, 0, 1, 1,
0.375744, 0.7610952, 1.217844, 0, 0, 0, 1, 1,
0.3786959, 0.6004573, 1.203233, 1, 1, 1, 1, 1,
0.3822806, -0.9216773, 2.124405, 1, 1, 1, 1, 1,
0.3834001, 2.111047, 0.02171588, 1, 1, 1, 1, 1,
0.3849954, -0.2292279, 3.5318, 1, 1, 1, 1, 1,
0.3852381, 0.236552, 0.7197945, 1, 1, 1, 1, 1,
0.3856723, -0.4837057, 2.693655, 1, 1, 1, 1, 1,
0.3933898, -1.197639, 2.971628, 1, 1, 1, 1, 1,
0.3937377, -0.6288148, 2.723226, 1, 1, 1, 1, 1,
0.3965707, -0.3879874, 1.165302, 1, 1, 1, 1, 1,
0.397214, -0.8888195, 1.982344, 1, 1, 1, 1, 1,
0.4018874, 0.4328003, 1.69874, 1, 1, 1, 1, 1,
0.4024764, -0.3660423, 3.626431, 1, 1, 1, 1, 1,
0.4062305, 2.001, 1.970079, 1, 1, 1, 1, 1,
0.409267, -0.7860294, 1.626996, 1, 1, 1, 1, 1,
0.4095915, -0.4927305, 1.204482, 1, 1, 1, 1, 1,
0.4106107, 0.2101892, 0.9294946, 0, 0, 1, 1, 1,
0.4108833, 0.548992, 0.4788194, 1, 0, 0, 1, 1,
0.4134066, 1.557623, 2.183056, 1, 0, 0, 1, 1,
0.4144176, -0.7664226, 3.76446, 1, 0, 0, 1, 1,
0.4216672, -0.4200157, 4.315424, 1, 0, 0, 1, 1,
0.4216723, -0.3257633, 3.913189, 1, 0, 0, 1, 1,
0.4249851, -0.4516885, 2.443965, 0, 0, 0, 1, 1,
0.4273676, 0.1336461, 2.214465, 0, 0, 0, 1, 1,
0.4277029, 0.4697947, 1.158376, 0, 0, 0, 1, 1,
0.4285779, -0.01512284, 2.212, 0, 0, 0, 1, 1,
0.431955, -1.511963, 3.504935, 0, 0, 0, 1, 1,
0.4350366, 2.018924, 0.03395174, 0, 0, 0, 1, 1,
0.4372726, 0.1394963, 2.570771, 0, 0, 0, 1, 1,
0.4401976, 0.1387733, 1.122069, 1, 1, 1, 1, 1,
0.442242, 1.990898, 1.674551, 1, 1, 1, 1, 1,
0.4439358, 0.9627448, 2.785699, 1, 1, 1, 1, 1,
0.4458287, 0.6572999, 0.1481469, 1, 1, 1, 1, 1,
0.4573423, -0.5874916, 2.662174, 1, 1, 1, 1, 1,
0.4590832, -0.09583806, 3.623587, 1, 1, 1, 1, 1,
0.4621987, -0.3147389, 1.078983, 1, 1, 1, 1, 1,
0.4623367, -0.4235424, -0.2729566, 1, 1, 1, 1, 1,
0.4637927, 1.992379, -1.21167, 1, 1, 1, 1, 1,
0.464718, 0.9316986, 0.7320856, 1, 1, 1, 1, 1,
0.469843, 0.3484938, 2.087857, 1, 1, 1, 1, 1,
0.4700476, 3.003825, -0.2517963, 1, 1, 1, 1, 1,
0.4723494, 0.3677618, -0.5935047, 1, 1, 1, 1, 1,
0.4730692, 0.1595442, -0.8490224, 1, 1, 1, 1, 1,
0.4752387, -0.3549827, 1.932647, 1, 1, 1, 1, 1,
0.4817637, 0.4106934, 1.217688, 0, 0, 1, 1, 1,
0.4832, -1.239627, 3.638129, 1, 0, 0, 1, 1,
0.4870042, 0.263656, 1.520503, 1, 0, 0, 1, 1,
0.4895835, -0.4300968, 4.248415, 1, 0, 0, 1, 1,
0.4919596, -0.8529933, 2.403069, 1, 0, 0, 1, 1,
0.5022224, -1.708025, 2.611256, 1, 0, 0, 1, 1,
0.502739, -1.315549, 2.804394, 0, 0, 0, 1, 1,
0.5029314, 0.687762, 0.1168115, 0, 0, 0, 1, 1,
0.5035285, 0.008332717, 0.6034226, 0, 0, 0, 1, 1,
0.5059872, -0.3163804, 1.475925, 0, 0, 0, 1, 1,
0.5060188, -0.4049803, 0.9262447, 0, 0, 0, 1, 1,
0.5068765, -0.04499019, 2.794056, 0, 0, 0, 1, 1,
0.5120233, 0.01988021, 2.176379, 0, 0, 0, 1, 1,
0.5134308, 2.484382, 1.40698, 1, 1, 1, 1, 1,
0.5139056, 1.370259, 0.6547256, 1, 1, 1, 1, 1,
0.5158051, -0.9387499, 2.037632, 1, 1, 1, 1, 1,
0.5198964, 0.4656372, 1.043533, 1, 1, 1, 1, 1,
0.5227646, 0.6886242, 1.838049, 1, 1, 1, 1, 1,
0.522949, 2.021947, -0.6754215, 1, 1, 1, 1, 1,
0.5240769, 1.352819, 2.343579, 1, 1, 1, 1, 1,
0.5255977, -0.2126303, 2.149806, 1, 1, 1, 1, 1,
0.5293123, 0.6256307, -1.559985, 1, 1, 1, 1, 1,
0.5329791, 1.402685, 0.4176925, 1, 1, 1, 1, 1,
0.53583, -0.772839, 2.216815, 1, 1, 1, 1, 1,
0.540482, -0.4719157, 3.067865, 1, 1, 1, 1, 1,
0.5430344, -1.021307, 0.6095688, 1, 1, 1, 1, 1,
0.5485101, 0.7041539, -1.043265, 1, 1, 1, 1, 1,
0.5489666, 2.245257, 0.8793594, 1, 1, 1, 1, 1,
0.5495949, 1.290357, -0.2136151, 0, 0, 1, 1, 1,
0.5545777, -0.8910887, 3.415284, 1, 0, 0, 1, 1,
0.5546259, 0.9981326, 0.5217915, 1, 0, 0, 1, 1,
0.5586329, 1.887391, -0.3337524, 1, 0, 0, 1, 1,
0.5589928, 0.5763036, 2.619311, 1, 0, 0, 1, 1,
0.5615537, -0.978395, 3.272426, 1, 0, 0, 1, 1,
0.5627071, -1.058075, 3.961504, 0, 0, 0, 1, 1,
0.567714, 0.1839253, 1.538523, 0, 0, 0, 1, 1,
0.5723901, -0.7531192, 3.023268, 0, 0, 0, 1, 1,
0.5748326, -0.07049505, 0.5385642, 0, 0, 0, 1, 1,
0.5750176, 0.7714443, 1.370838, 0, 0, 0, 1, 1,
0.589206, 0.5520793, 1.854805, 0, 0, 0, 1, 1,
0.5894664, 0.2976296, -0.03113881, 0, 0, 0, 1, 1,
0.5925328, -0.8888317, 2.492113, 1, 1, 1, 1, 1,
0.5935587, -0.05121765, 1.220279, 1, 1, 1, 1, 1,
0.5944145, -0.4012877, 0.4799998, 1, 1, 1, 1, 1,
0.5987412, -0.6404783, 3.523165, 1, 1, 1, 1, 1,
0.6000257, -0.08987179, 1.822627, 1, 1, 1, 1, 1,
0.6052334, 1.461814, 1.436191, 1, 1, 1, 1, 1,
0.6060265, 0.8454252, 1.961273, 1, 1, 1, 1, 1,
0.6100397, 0.2287314, 3.443572, 1, 1, 1, 1, 1,
0.6114726, 0.9074806, 0.107016, 1, 1, 1, 1, 1,
0.6114727, 1.14202, -1.187591, 1, 1, 1, 1, 1,
0.6115493, 0.418977, 1.74362, 1, 1, 1, 1, 1,
0.6154894, -0.301918, 1.233233, 1, 1, 1, 1, 1,
0.6179689, 0.7017878, 1.995669, 1, 1, 1, 1, 1,
0.6225275, -0.6621333, 3.744072, 1, 1, 1, 1, 1,
0.6227394, -1.134579, 0.6711748, 1, 1, 1, 1, 1,
0.6242605, -0.4903128, 1.046373, 0, 0, 1, 1, 1,
0.6300811, -1.124257, 3.650398, 1, 0, 0, 1, 1,
0.630542, -0.3289767, 2.330737, 1, 0, 0, 1, 1,
0.6319742, -0.2599221, 0.6202465, 1, 0, 0, 1, 1,
0.6411266, -0.3697305, 1.830131, 1, 0, 0, 1, 1,
0.6486402, 0.05780149, 0.8005397, 1, 0, 0, 1, 1,
0.6525486, 0.7345699, 1.197873, 0, 0, 0, 1, 1,
0.6598756, 0.0562208, 1.131546, 0, 0, 0, 1, 1,
0.6618254, 0.4446961, 1.701556, 0, 0, 0, 1, 1,
0.6630672, 0.1782389, 1.170937, 0, 0, 0, 1, 1,
0.6678383, -0.702929, 1.243982, 0, 0, 0, 1, 1,
0.6699773, 1.51586, 0.8578616, 0, 0, 0, 1, 1,
0.6722533, 1.106246, 0.9288044, 0, 0, 0, 1, 1,
0.6728624, -0.1262176, 1.972616, 1, 1, 1, 1, 1,
0.6786843, -1.238475, 2.559787, 1, 1, 1, 1, 1,
0.6791939, -0.2724481, 1.590167, 1, 1, 1, 1, 1,
0.6808278, 0.4798715, 0.8685396, 1, 1, 1, 1, 1,
0.6838185, 1.431679, 2.301927, 1, 1, 1, 1, 1,
0.6863369, 0.1051954, 1.073361, 1, 1, 1, 1, 1,
0.6868859, 0.52401, 1.688239, 1, 1, 1, 1, 1,
0.6933451, -0.7666637, 3.96861, 1, 1, 1, 1, 1,
0.6943545, -0.0349112, 1.237638, 1, 1, 1, 1, 1,
0.6961315, 0.7352375, -1.445839, 1, 1, 1, 1, 1,
0.6968974, -0.1701229, 1.366832, 1, 1, 1, 1, 1,
0.7035341, -0.7550555, 1.273055, 1, 1, 1, 1, 1,
0.7059056, 0.7369311, -0.8623903, 1, 1, 1, 1, 1,
0.7204956, 0.2021584, -0.4375432, 1, 1, 1, 1, 1,
0.7250273, 0.5338588, -0.1975374, 1, 1, 1, 1, 1,
0.7255925, -1.001871, 1.839566, 0, 0, 1, 1, 1,
0.7297419, -0.6032339, 1.963882, 1, 0, 0, 1, 1,
0.7362744, -1.127223, 3.004412, 1, 0, 0, 1, 1,
0.7365016, 1.123352, 0.646306, 1, 0, 0, 1, 1,
0.7386141, -0.2717069, 2.793418, 1, 0, 0, 1, 1,
0.738837, -0.1526501, 1.468562, 1, 0, 0, 1, 1,
0.7410493, 0.4273499, 0.9318199, 0, 0, 0, 1, 1,
0.7414465, -0.1735331, 1.297031, 0, 0, 0, 1, 1,
0.7418527, -1.07029, 2.704821, 0, 0, 0, 1, 1,
0.7483311, -1.138817, 2.773688, 0, 0, 0, 1, 1,
0.7485885, -0.3835981, 3.137753, 0, 0, 0, 1, 1,
0.7522481, -0.2619007, 0.6835433, 0, 0, 0, 1, 1,
0.7549946, -0.3716583, 1.97263, 0, 0, 0, 1, 1,
0.7553355, -0.8057754, -0.3933369, 1, 1, 1, 1, 1,
0.7558538, 0.05158548, 0.2939306, 1, 1, 1, 1, 1,
0.7586994, 0.7070245, 1.800904, 1, 1, 1, 1, 1,
0.7591974, -0.7312208, 3.851237, 1, 1, 1, 1, 1,
0.759773, -0.1110014, 2.577316, 1, 1, 1, 1, 1,
0.7636279, -1.447704, 1.599207, 1, 1, 1, 1, 1,
0.7690699, 1.345742, 0.5463009, 1, 1, 1, 1, 1,
0.7715667, 0.8452433, 0.8223215, 1, 1, 1, 1, 1,
0.7782732, -1.143869, 4.106307, 1, 1, 1, 1, 1,
0.778535, -1.638153, 3.882131, 1, 1, 1, 1, 1,
0.7801013, 1.133942, 0.3494177, 1, 1, 1, 1, 1,
0.7822815, 0.6308548, 0.6052594, 1, 1, 1, 1, 1,
0.785205, 0.8010795, -1.674498, 1, 1, 1, 1, 1,
0.7979593, -1.566939, 0.3592017, 1, 1, 1, 1, 1,
0.7982212, -0.2426933, 3.499421, 1, 1, 1, 1, 1,
0.799605, 1.119823, -0.09213963, 0, 0, 1, 1, 1,
0.8027315, 1.730062, -1.949705, 1, 0, 0, 1, 1,
0.8056349, -0.06475689, 1.439255, 1, 0, 0, 1, 1,
0.8087566, -0.04309265, 2.234489, 1, 0, 0, 1, 1,
0.8091644, 1.179394, 1.638507, 1, 0, 0, 1, 1,
0.8095582, -0.03587214, 1.92628, 1, 0, 0, 1, 1,
0.8105435, -1.412442, 2.96623, 0, 0, 0, 1, 1,
0.8124139, -0.9404688, 4.490975, 0, 0, 0, 1, 1,
0.8174061, -0.3625482, 3.741032, 0, 0, 0, 1, 1,
0.8288099, -1.049089, 2.33756, 0, 0, 0, 1, 1,
0.8373134, -0.1561139, 0.945803, 0, 0, 0, 1, 1,
0.8397431, 0.9571366, 1.055156, 0, 0, 0, 1, 1,
0.8434864, 0.7192895, 0.06522579, 0, 0, 0, 1, 1,
0.8443562, 0.01418076, 0.1323961, 1, 1, 1, 1, 1,
0.8450702, -0.174555, 2.183349, 1, 1, 1, 1, 1,
0.8470622, -0.6297814, 1.60366, 1, 1, 1, 1, 1,
0.8509554, 0.1309061, 2.524522, 1, 1, 1, 1, 1,
0.8575594, -1.633264, 0.06837177, 1, 1, 1, 1, 1,
0.8584726, 1.17231, 0.02020712, 1, 1, 1, 1, 1,
0.8634508, 0.5344948, -1.209508, 1, 1, 1, 1, 1,
0.8676395, 0.8361017, 0.0007750014, 1, 1, 1, 1, 1,
0.8693708, -0.9803113, 0.4868476, 1, 1, 1, 1, 1,
0.8771383, -0.1257044, 2.795979, 1, 1, 1, 1, 1,
0.8835443, -0.1296833, 2.441495, 1, 1, 1, 1, 1,
0.8855975, 0.5908164, -0.1179977, 1, 1, 1, 1, 1,
0.8874413, -0.5220488, 3.849582, 1, 1, 1, 1, 1,
0.8876868, 1.064941, 1.163302, 1, 1, 1, 1, 1,
0.8883948, -0.411796, 1.546274, 1, 1, 1, 1, 1,
0.8893141, 0.6333317, 1.324027, 0, 0, 1, 1, 1,
0.9049176, -2.371105, 1.752422, 1, 0, 0, 1, 1,
0.9112556, 1.241945, 0.4901447, 1, 0, 0, 1, 1,
0.9196482, -1.152983, 4.194186, 1, 0, 0, 1, 1,
0.9198252, -0.9980077, 1.013856, 1, 0, 0, 1, 1,
0.9220946, 1.151887, 0.334164, 1, 0, 0, 1, 1,
0.9225047, 0.05675737, 1.382834, 0, 0, 0, 1, 1,
0.9337848, 1.288482, 0.1219214, 0, 0, 0, 1, 1,
0.9466767, -0.4254819, 4.424371, 0, 0, 0, 1, 1,
0.9467767, -0.6804563, 1.545161, 0, 0, 0, 1, 1,
0.9479146, 0.07212833, 1.490223, 0, 0, 0, 1, 1,
0.9555285, 0.3659128, 0.5473257, 0, 0, 0, 1, 1,
0.9628688, 0.01651089, 1.010077, 0, 0, 0, 1, 1,
0.9644341, 1.981238, 0.9028134, 1, 1, 1, 1, 1,
0.973223, 0.6324048, 0.4854979, 1, 1, 1, 1, 1,
0.9749546, 1.548143, 2.125129, 1, 1, 1, 1, 1,
0.9853724, -0.8415554, 4.329155, 1, 1, 1, 1, 1,
0.9911282, -0.5724579, 1.624262, 1, 1, 1, 1, 1,
0.9922255, -0.6106606, 2.904531, 1, 1, 1, 1, 1,
0.996002, -0.7653964, 2.875561, 1, 1, 1, 1, 1,
0.9960241, -0.623292, 2.37928, 1, 1, 1, 1, 1,
0.9979646, -0.4151132, 2.002247, 1, 1, 1, 1, 1,
1.002219, -0.5707636, 1.673984, 1, 1, 1, 1, 1,
1.007061, -0.8124285, 1.502227, 1, 1, 1, 1, 1,
1.009521, 1.233775, 2.283426, 1, 1, 1, 1, 1,
1.011603, 2.214627, 1.305189, 1, 1, 1, 1, 1,
1.015718, -2.049882, 2.197328, 1, 1, 1, 1, 1,
1.019445, 0.5404238, 1.206983, 1, 1, 1, 1, 1,
1.019733, -0.9543264, 1.446253, 0, 0, 1, 1, 1,
1.026299, 0.6479466, 1.914419, 1, 0, 0, 1, 1,
1.034668, 0.2094501, 1.760214, 1, 0, 0, 1, 1,
1.035507, 0.7025338, 0.1552889, 1, 0, 0, 1, 1,
1.058444, -0.4178219, 3.621881, 1, 0, 0, 1, 1,
1.063351, 2.187821, -0.7135765, 1, 0, 0, 1, 1,
1.066963, -0.8667809, 3.066766, 0, 0, 0, 1, 1,
1.068404, -0.7312375, 1.76248, 0, 0, 0, 1, 1,
1.069183, 1.367173, 0.1580683, 0, 0, 0, 1, 1,
1.074242, -0.6828258, 1.62361, 0, 0, 0, 1, 1,
1.078048, 0.1668495, 0.7718808, 0, 0, 0, 1, 1,
1.078379, -0.6719425, 2.815189, 0, 0, 0, 1, 1,
1.081098, 2.154937, 1.402243, 0, 0, 0, 1, 1,
1.086666, 0.1664875, 0.2624568, 1, 1, 1, 1, 1,
1.096982, 0.6625655, 1.475081, 1, 1, 1, 1, 1,
1.106993, -1.030636, 4.256452, 1, 1, 1, 1, 1,
1.107391, 0.2556908, -0.4370875, 1, 1, 1, 1, 1,
1.110779, 0.2983087, 0.9891092, 1, 1, 1, 1, 1,
1.116424, 0.494798, -0.09021492, 1, 1, 1, 1, 1,
1.122584, -0.9148555, 2.098042, 1, 1, 1, 1, 1,
1.12794, -0.6208879, 1.369409, 1, 1, 1, 1, 1,
1.129902, 0.8575411, 0.2695063, 1, 1, 1, 1, 1,
1.132718, -0.5454515, 2.892981, 1, 1, 1, 1, 1,
1.136858, -0.9567804, 1.354694, 1, 1, 1, 1, 1,
1.143678, 0.09364636, 0.7644631, 1, 1, 1, 1, 1,
1.144204, -0.6227127, 2.265362, 1, 1, 1, 1, 1,
1.147271, -0.7280472, 3.93721, 1, 1, 1, 1, 1,
1.150659, -1.148626, 2.229491, 1, 1, 1, 1, 1,
1.161513, 0.350013, -0.1671991, 0, 0, 1, 1, 1,
1.164311, -0.1030289, -0.1660681, 1, 0, 0, 1, 1,
1.165552, -1.66641, 3.024458, 1, 0, 0, 1, 1,
1.172842, -0.7493778, 0.3375725, 1, 0, 0, 1, 1,
1.176791, 2.324196, 1.701117, 1, 0, 0, 1, 1,
1.183342, -0.7316075, 3.519398, 1, 0, 0, 1, 1,
1.186192, 1.422839, -0.1454709, 0, 0, 0, 1, 1,
1.189891, -0.3849692, 0.7209671, 0, 0, 0, 1, 1,
1.195848, -1.326026, 1.55804, 0, 0, 0, 1, 1,
1.199879, -0.9637122, 0.9075723, 0, 0, 0, 1, 1,
1.201673, 1.424138, -0.1307836, 0, 0, 0, 1, 1,
1.20297, -0.1981367, 2.387759, 0, 0, 0, 1, 1,
1.204807, 1.601748, 1.618173, 0, 0, 0, 1, 1,
1.204988, -0.9633526, 4.145034, 1, 1, 1, 1, 1,
1.205584, -0.8513919, 3.163797, 1, 1, 1, 1, 1,
1.207927, 0.1956805, 3.251668, 1, 1, 1, 1, 1,
1.217854, 0.605776, 1.804306, 1, 1, 1, 1, 1,
1.221585, 1.50499, 0.7946566, 1, 1, 1, 1, 1,
1.22328, 0.9584532, 1.26079, 1, 1, 1, 1, 1,
1.224844, 0.3743154, 1.471642, 1, 1, 1, 1, 1,
1.234503, 0.109515, 0.3872409, 1, 1, 1, 1, 1,
1.235605, -1.156987, 1.640706, 1, 1, 1, 1, 1,
1.244026, 0.9476216, 2.136644, 1, 1, 1, 1, 1,
1.260971, -0.3548791, 1.616857, 1, 1, 1, 1, 1,
1.261842, 0.8956133, 0.6450688, 1, 1, 1, 1, 1,
1.267149, 0.9736148, 2.49782, 1, 1, 1, 1, 1,
1.270737, 0.862397, 0.3667203, 1, 1, 1, 1, 1,
1.278811, 0.2474594, 1.716323, 1, 1, 1, 1, 1,
1.298867, 0.7957544, 1.906761, 0, 0, 1, 1, 1,
1.309387, -1.295369, 1.067715, 1, 0, 0, 1, 1,
1.325695, 0.05873656, 2.899281, 1, 0, 0, 1, 1,
1.327949, -2.084697, 1.835551, 1, 0, 0, 1, 1,
1.345829, 2.686644, 0.5514938, 1, 0, 0, 1, 1,
1.373447, -0.1910082, 1.994472, 1, 0, 0, 1, 1,
1.384619, 1.239052, 0.2495856, 0, 0, 0, 1, 1,
1.38606, 1.606039, 0.9356853, 0, 0, 0, 1, 1,
1.392316, 1.185659, 0.1723691, 0, 0, 0, 1, 1,
1.396012, 0.7264963, -0.6177217, 0, 0, 0, 1, 1,
1.401105, -0.3107343, -0.9346668, 0, 0, 0, 1, 1,
1.401864, 1.233194, 0.8133221, 0, 0, 0, 1, 1,
1.408531, -0.3700911, 3.049231, 0, 0, 0, 1, 1,
1.408809, -0.1258218, 1.661024, 1, 1, 1, 1, 1,
1.41177, -0.3406495, 0.7794549, 1, 1, 1, 1, 1,
1.41723, -1.196433, 3.299296, 1, 1, 1, 1, 1,
1.419562, -0.5001659, 2.229855, 1, 1, 1, 1, 1,
1.427784, 1.433996, 0.3326402, 1, 1, 1, 1, 1,
1.441775, 0.888601, 0.6648411, 1, 1, 1, 1, 1,
1.444209, 1.781442, 1.383742, 1, 1, 1, 1, 1,
1.447985, 0.6951464, 1.431415, 1, 1, 1, 1, 1,
1.448147, -0.9565332, 1.665943, 1, 1, 1, 1, 1,
1.45752, 0.4235413, 0.5519438, 1, 1, 1, 1, 1,
1.462088, 1.234564, 0.02075509, 1, 1, 1, 1, 1,
1.477934, 1.842105, 1.310333, 1, 1, 1, 1, 1,
1.479135, 0.9459615, 0.4768422, 1, 1, 1, 1, 1,
1.488242, -0.5407331, 1.59141, 1, 1, 1, 1, 1,
1.493861, -1.043332, 0.92102, 1, 1, 1, 1, 1,
1.495633, 1.75019, 0.1476729, 0, 0, 1, 1, 1,
1.498199, -0.8604325, 2.122978, 1, 0, 0, 1, 1,
1.502933, 0.5469985, -0.08942036, 1, 0, 0, 1, 1,
1.512744, -0.08565444, 2.858116, 1, 0, 0, 1, 1,
1.515355, -1.327215, 0.9453917, 1, 0, 0, 1, 1,
1.515531, 1.088382, 2.315575, 1, 0, 0, 1, 1,
1.524262, -1.704866, 1.741692, 0, 0, 0, 1, 1,
1.537498, 0.02865699, 0.345633, 0, 0, 0, 1, 1,
1.553002, -0.5686608, 1.869128, 0, 0, 0, 1, 1,
1.553864, -0.1927397, 1.988836, 0, 0, 0, 1, 1,
1.562208, 0.2207389, 1.640554, 0, 0, 0, 1, 1,
1.567109, -2.05057, 3.940812, 0, 0, 0, 1, 1,
1.56898, -0.3860714, 2.200959, 0, 0, 0, 1, 1,
1.586042, 0.2738626, 1.979643, 1, 1, 1, 1, 1,
1.590875, -0.9646102, 3.448324, 1, 1, 1, 1, 1,
1.590948, -0.6860256, 2.488342, 1, 1, 1, 1, 1,
1.603775, 0.4882043, 1.86057, 1, 1, 1, 1, 1,
1.619949, 0.1703678, 1.028139, 1, 1, 1, 1, 1,
1.631498, -0.4853669, 0.4539765, 1, 1, 1, 1, 1,
1.633251, 0.1814089, 1.062111, 1, 1, 1, 1, 1,
1.638716, 1.796971, -1.355677, 1, 1, 1, 1, 1,
1.640242, 1.863018, 1.886197, 1, 1, 1, 1, 1,
1.641148, 1.019951, 1.852493, 1, 1, 1, 1, 1,
1.65858, -0.4444032, 1.941507, 1, 1, 1, 1, 1,
1.669651, -0.2773028, 2.472502, 1, 1, 1, 1, 1,
1.693593, -0.1122466, 1.80382, 1, 1, 1, 1, 1,
1.694944, 1.13007, 2.768223, 1, 1, 1, 1, 1,
1.694987, 0.6398576, -0.2555637, 1, 1, 1, 1, 1,
1.700165, -0.3343033, 1.963903, 0, 0, 1, 1, 1,
1.703857, -0.436426, 1.717307, 1, 0, 0, 1, 1,
1.725364, 0.7925083, 1.404836, 1, 0, 0, 1, 1,
1.733028, -1.734964, 2.946799, 1, 0, 0, 1, 1,
1.740338, 0.6824831, 0.2421281, 1, 0, 0, 1, 1,
1.755407, 0.8203741, -1.817199, 1, 0, 0, 1, 1,
1.761116, -0.05466099, 0.8129429, 0, 0, 0, 1, 1,
1.781763, 0.439851, 0.1302481, 0, 0, 0, 1, 1,
1.787353, -0.3517421, 1.736187, 0, 0, 0, 1, 1,
1.820118, 1.302206, 2.327854, 0, 0, 0, 1, 1,
1.82135, 0.5361093, 2.799145, 0, 0, 0, 1, 1,
1.824913, -1.77373, 2.501213, 0, 0, 0, 1, 1,
1.82861, -0.5512568, 2.840921, 0, 0, 0, 1, 1,
1.846165, 1.470949, 0.7579578, 1, 1, 1, 1, 1,
1.869325, 0.2922544, 1.179149, 1, 1, 1, 1, 1,
1.902635, -1.219734, 1.10978, 1, 1, 1, 1, 1,
1.910983, -1.09154, 1.651838, 1, 1, 1, 1, 1,
1.931837, 0.4359598, 1.982845, 1, 1, 1, 1, 1,
1.9687, -0.1886075, 0.0395226, 1, 1, 1, 1, 1,
1.970068, 0.8873077, 1.597264, 1, 1, 1, 1, 1,
1.978164, -2.518623, 2.610748, 1, 1, 1, 1, 1,
1.989838, -0.7901799, 1.303757, 1, 1, 1, 1, 1,
2.0369, -1.253418, 1.63374, 1, 1, 1, 1, 1,
2.064035, 0.7355397, 1.550202, 1, 1, 1, 1, 1,
2.06867, -0.980024, 2.284656, 1, 1, 1, 1, 1,
2.073606, -1.16022, 3.183109, 1, 1, 1, 1, 1,
2.098737, 0.05424932, 1.873799, 1, 1, 1, 1, 1,
2.123192, -0.6868858, 2.442051, 1, 1, 1, 1, 1,
2.1312, 0.7027267, 0.106764, 0, 0, 1, 1, 1,
2.162055, -0.8593642, 0.9660128, 1, 0, 0, 1, 1,
2.162201, -1.161182, 1.454032, 1, 0, 0, 1, 1,
2.198863, -1.429804, 1.893623, 1, 0, 0, 1, 1,
2.218997, -0.3019465, 2.08242, 1, 0, 0, 1, 1,
2.241844, 1.047319, 0.2294212, 1, 0, 0, 1, 1,
2.286257, 0.09831597, 0.4199651, 0, 0, 0, 1, 1,
2.293209, 0.6616987, 2.65965, 0, 0, 0, 1, 1,
2.322346, 1.857943, -0.2426308, 0, 0, 0, 1, 1,
2.336275, 0.5430135, 1.333089, 0, 0, 0, 1, 1,
2.338805, -1.016097, 0.9921142, 0, 0, 0, 1, 1,
2.351701, 0.6512494, 0.6950088, 0, 0, 0, 1, 1,
2.425109, 0.7995863, 0.918106, 0, 0, 0, 1, 1,
2.489434, -1.487093, 1.749228, 1, 1, 1, 1, 1,
2.502859, 0.7056239, 2.334364, 1, 1, 1, 1, 1,
2.690165, -1.618351, 2.471858, 1, 1, 1, 1, 1,
2.743419, 1.826347, 0.4191944, 1, 1, 1, 1, 1,
3.108753, -2.240172, 1.333851, 1, 1, 1, 1, 1,
3.142453, 0.5940706, -0.8836559, 1, 1, 1, 1, 1,
3.357852, 0.5816597, 2.556466, 1, 1, 1, 1, 1
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
var radius = 9.563276;
var distance = 33.5906;
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
mvMatrix.translate( -0.06845355, -0.3362292, -0.1972394 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.5906);
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
