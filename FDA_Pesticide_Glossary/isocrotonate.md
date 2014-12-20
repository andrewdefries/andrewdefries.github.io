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
-3.310636, 0.7464876, -1.00696, 1, 0, 0, 1,
-3.207989, -0.07248896, 0.3727705, 1, 0.007843138, 0, 1,
-2.970397, 0.5656406, -0.5268054, 1, 0.01176471, 0, 1,
-2.934422, -1.309535, -2.099017, 1, 0.01960784, 0, 1,
-2.867165, -0.02775141, -2.851731, 1, 0.02352941, 0, 1,
-2.78202, -1.424055, -1.852383, 1, 0.03137255, 0, 1,
-2.670791, -0.4894515, -0.6078179, 1, 0.03529412, 0, 1,
-2.590239, -1.372994, -3.07782, 1, 0.04313726, 0, 1,
-2.540269, -1.202073, -1.888886, 1, 0.04705882, 0, 1,
-2.374859, -1.184528, -3.109085, 1, 0.05490196, 0, 1,
-2.362197, -0.5386668, -2.367621, 1, 0.05882353, 0, 1,
-2.34481, 0.1667008, -1.628907, 1, 0.06666667, 0, 1,
-2.33073, -1.329731, -2.567698, 1, 0.07058824, 0, 1,
-2.270456, 3.129613, -0.9850645, 1, 0.07843138, 0, 1,
-2.258635, 0.9718536, -1.050946, 1, 0.08235294, 0, 1,
-2.253883, -1.823341, -3.67619, 1, 0.09019608, 0, 1,
-2.204954, -1.202142, -2.35465, 1, 0.09411765, 0, 1,
-2.19315, -1.962674, -1.664093, 1, 0.1019608, 0, 1,
-2.182725, -1.204542, -0.1400401, 1, 0.1098039, 0, 1,
-2.181789, 0.4528744, -1.420826, 1, 0.1137255, 0, 1,
-2.170618, 0.8453466, -0.3905375, 1, 0.1215686, 0, 1,
-2.163981, 0.8471137, -0.07356799, 1, 0.1254902, 0, 1,
-2.159707, -0.7815573, -2.879752, 1, 0.1333333, 0, 1,
-2.142993, 2.007854, -0.5902539, 1, 0.1372549, 0, 1,
-2.121327, -0.9396871, -2.874052, 1, 0.145098, 0, 1,
-2.106969, -0.1084177, -1.350493, 1, 0.1490196, 0, 1,
-2.104541, -0.8349229, -2.525555, 1, 0.1568628, 0, 1,
-2.102076, 0.07006872, -0.3448899, 1, 0.1607843, 0, 1,
-2.069983, 0.1712308, -3.046486, 1, 0.1686275, 0, 1,
-2.036777, -0.5730874, -2.515594, 1, 0.172549, 0, 1,
-2.004405, -0.0989794, -3.611864, 1, 0.1803922, 0, 1,
-2.002792, 2.394278, 2.006285, 1, 0.1843137, 0, 1,
-1.971802, -1.084409, -1.568837, 1, 0.1921569, 0, 1,
-1.969302, 0.8130359, -2.104625, 1, 0.1960784, 0, 1,
-1.950731, -0.731384, -2.705078, 1, 0.2039216, 0, 1,
-1.936848, 0.04169002, -1.268043, 1, 0.2117647, 0, 1,
-1.920033, -0.7868371, -0.9414245, 1, 0.2156863, 0, 1,
-1.904553, 0.2382687, -2.418815, 1, 0.2235294, 0, 1,
-1.874278, 0.7611457, -2.434124, 1, 0.227451, 0, 1,
-1.872604, 1.940636, 0.9929566, 1, 0.2352941, 0, 1,
-1.864686, 0.4172685, 0.02339636, 1, 0.2392157, 0, 1,
-1.856109, 0.6349188, -1.648333, 1, 0.2470588, 0, 1,
-1.851978, 0.2641666, -1.158352, 1, 0.2509804, 0, 1,
-1.839448, -0.6026587, -1.732296, 1, 0.2588235, 0, 1,
-1.813171, -0.5030017, -3.138134, 1, 0.2627451, 0, 1,
-1.788928, -0.3238746, -3.489144, 1, 0.2705882, 0, 1,
-1.787531, 0.1339161, -3.713971, 1, 0.2745098, 0, 1,
-1.783234, 0.1625909, -3.68534, 1, 0.282353, 0, 1,
-1.776936, 0.8945485, -1.924595, 1, 0.2862745, 0, 1,
-1.775092, 1.35687, -1.333158, 1, 0.2941177, 0, 1,
-1.769139, -0.4302786, -3.299811, 1, 0.3019608, 0, 1,
-1.760735, -1.272904, -2.366904, 1, 0.3058824, 0, 1,
-1.73836, 0.1128474, -1.993272, 1, 0.3137255, 0, 1,
-1.705164, 0.9303185, -0.6646965, 1, 0.3176471, 0, 1,
-1.689617, 0.8397012, -1.517004, 1, 0.3254902, 0, 1,
-1.676323, -0.8195237, -2.206595, 1, 0.3294118, 0, 1,
-1.669143, 0.7006215, -0.4029709, 1, 0.3372549, 0, 1,
-1.664051, -0.9651786, -2.882873, 1, 0.3411765, 0, 1,
-1.658893, -1.53259, -2.744571, 1, 0.3490196, 0, 1,
-1.636312, -0.9389749, -2.508385, 1, 0.3529412, 0, 1,
-1.635305, 0.1744191, -4.127859, 1, 0.3607843, 0, 1,
-1.623178, -0.7031653, -2.482504, 1, 0.3647059, 0, 1,
-1.597705, -0.3829413, -1.375325, 1, 0.372549, 0, 1,
-1.596328, 0.6580006, -0.6180451, 1, 0.3764706, 0, 1,
-1.593025, -1.073175, -1.459131, 1, 0.3843137, 0, 1,
-1.590435, -0.002565464, -2.833909, 1, 0.3882353, 0, 1,
-1.586241, -0.4008268, -4.998374, 1, 0.3960784, 0, 1,
-1.584462, -0.1453216, -2.422236, 1, 0.4039216, 0, 1,
-1.567157, -1.645947, -1.292536, 1, 0.4078431, 0, 1,
-1.534821, -0.1647355, -2.427168, 1, 0.4156863, 0, 1,
-1.529015, -0.5003353, -3.087962, 1, 0.4196078, 0, 1,
-1.527416, 0.1395246, -0.6848892, 1, 0.427451, 0, 1,
-1.522183, -2.437479, -3.216328, 1, 0.4313726, 0, 1,
-1.521354, -2.426191, -3.264323, 1, 0.4392157, 0, 1,
-1.519156, 1.205015, -1.841183, 1, 0.4431373, 0, 1,
-1.518039, -0.2174131, -2.071641, 1, 0.4509804, 0, 1,
-1.510818, -0.1764636, 0.3493344, 1, 0.454902, 0, 1,
-1.507262, -0.3363148, -2.122305, 1, 0.4627451, 0, 1,
-1.474913, -0.1761942, -0.2898067, 1, 0.4666667, 0, 1,
-1.474332, -1.545268, -0.8925296, 1, 0.4745098, 0, 1,
-1.468835, -0.07503913, -2.927192, 1, 0.4784314, 0, 1,
-1.468429, -1.626032, -3.090816, 1, 0.4862745, 0, 1,
-1.468093, 0.7095282, -1.693513, 1, 0.4901961, 0, 1,
-1.467818, 0.3866866, 0.606683, 1, 0.4980392, 0, 1,
-1.460467, -0.7181252, -2.131019, 1, 0.5058824, 0, 1,
-1.456842, 1.445779, -2.224496, 1, 0.509804, 0, 1,
-1.455812, -1.171622, -3.463528, 1, 0.5176471, 0, 1,
-1.44775, 1.517562, -1.955478, 1, 0.5215687, 0, 1,
-1.445651, 0.04716437, -1.640628, 1, 0.5294118, 0, 1,
-1.444345, -0.1128041, -1.176976, 1, 0.5333334, 0, 1,
-1.440851, 2.399217, 0.4727548, 1, 0.5411765, 0, 1,
-1.440356, 0.15147, -1.64596, 1, 0.5450981, 0, 1,
-1.437567, -0.7279471, -2.8335, 1, 0.5529412, 0, 1,
-1.43733, 1.550545, -2.351354, 1, 0.5568628, 0, 1,
-1.417528, 0.02522044, -2.50858, 1, 0.5647059, 0, 1,
-1.410698, 0.1139089, -1.712521, 1, 0.5686275, 0, 1,
-1.404652, -1.513573, -2.827402, 1, 0.5764706, 0, 1,
-1.385637, -0.6900065, -1.371746, 1, 0.5803922, 0, 1,
-1.384738, -0.2324726, -0.7709388, 1, 0.5882353, 0, 1,
-1.375828, 0.8621628, -0.9617799, 1, 0.5921569, 0, 1,
-1.354513, -1.320011, -1.498051, 1, 0.6, 0, 1,
-1.352116, 1.554851, -0.6101397, 1, 0.6078432, 0, 1,
-1.349773, 0.7602971, -0.9737172, 1, 0.6117647, 0, 1,
-1.342426, -0.3043735, -4.069761, 1, 0.6196079, 0, 1,
-1.34156, 0.08260432, -1.244758, 1, 0.6235294, 0, 1,
-1.330461, 0.2322441, -3.959941, 1, 0.6313726, 0, 1,
-1.307528, 0.2958088, -0.4564154, 1, 0.6352941, 0, 1,
-1.305494, -0.6008072, -2.510638, 1, 0.6431373, 0, 1,
-1.29647, -0.7724073, -2.464491, 1, 0.6470588, 0, 1,
-1.294868, 1.203696, -0.377073, 1, 0.654902, 0, 1,
-1.285229, -0.777331, -1.261159, 1, 0.6588235, 0, 1,
-1.279893, 0.1856601, -1.289546, 1, 0.6666667, 0, 1,
-1.278689, 0.8893659, -0.3504928, 1, 0.6705883, 0, 1,
-1.278533, -0.4250968, -2.638028, 1, 0.6784314, 0, 1,
-1.277292, -1.42291, 0.02021129, 1, 0.682353, 0, 1,
-1.26822, -0.1149814, -0.7176395, 1, 0.6901961, 0, 1,
-1.261826, -1.448987, -2.227169, 1, 0.6941177, 0, 1,
-1.244336, -0.620856, -0.8289635, 1, 0.7019608, 0, 1,
-1.238495, -0.6355844, -3.277851, 1, 0.7098039, 0, 1,
-1.232968, -1.7411, -2.25789, 1, 0.7137255, 0, 1,
-1.225769, 1.136138, -1.588723, 1, 0.7215686, 0, 1,
-1.222521, 1.081841, 1.320775, 1, 0.7254902, 0, 1,
-1.220498, 1.126521, -2.799932, 1, 0.7333333, 0, 1,
-1.220017, -0.2601868, -3.679029, 1, 0.7372549, 0, 1,
-1.216454, -0.7814533, -2.345224, 1, 0.7450981, 0, 1,
-1.202897, -0.76501, -1.464486, 1, 0.7490196, 0, 1,
-1.200014, 1.370955, -2.417193, 1, 0.7568628, 0, 1,
-1.195889, -0.3368107, -2.651171, 1, 0.7607843, 0, 1,
-1.195469, -0.2030292, -1.792908, 1, 0.7686275, 0, 1,
-1.189951, 0.9447039, -2.110961, 1, 0.772549, 0, 1,
-1.188365, -0.006035997, -1.834763, 1, 0.7803922, 0, 1,
-1.172727, -0.5965113, -3.848471, 1, 0.7843137, 0, 1,
-1.171239, -0.4346068, -2.883098, 1, 0.7921569, 0, 1,
-1.158061, -1.050116, -2.203192, 1, 0.7960784, 0, 1,
-1.156589, -1.670109, -2.933553, 1, 0.8039216, 0, 1,
-1.152128, 0.7677078, -0.9913458, 1, 0.8117647, 0, 1,
-1.148249, 0.01742663, -1.396959, 1, 0.8156863, 0, 1,
-1.147112, -0.3040372, -2.857902, 1, 0.8235294, 0, 1,
-1.145773, -1.234507, -0.8467329, 1, 0.827451, 0, 1,
-1.141039, 1.226272, -2.971968, 1, 0.8352941, 0, 1,
-1.130344, 1.833694, 0.9298586, 1, 0.8392157, 0, 1,
-1.129283, 1.870906, -3.095734, 1, 0.8470588, 0, 1,
-1.125294, -0.5682505, -1.96997, 1, 0.8509804, 0, 1,
-1.124312, 2.184678, -0.2531265, 1, 0.8588235, 0, 1,
-1.117399, -0.5435925, -3.139052, 1, 0.8627451, 0, 1,
-1.115205, 0.5268074, -0.4010557, 1, 0.8705882, 0, 1,
-1.105732, -1.667918, -2.600281, 1, 0.8745098, 0, 1,
-1.104765, -1.763777, -2.985722, 1, 0.8823529, 0, 1,
-1.100945, 0.7685774, -2.430553, 1, 0.8862745, 0, 1,
-1.099506, -1.031452, -1.69585, 1, 0.8941177, 0, 1,
-1.094155, -1.214858, -2.255944, 1, 0.8980392, 0, 1,
-1.087316, 0.3655962, -2.146554, 1, 0.9058824, 0, 1,
-1.085145, 2.023455, 0.686209, 1, 0.9137255, 0, 1,
-1.072393, 0.4429569, -1.542175, 1, 0.9176471, 0, 1,
-1.064724, -1.430736, -2.008248, 1, 0.9254902, 0, 1,
-1.057573, 1.111125, -3.042269, 1, 0.9294118, 0, 1,
-1.052298, -0.1801759, -1.560547, 1, 0.9372549, 0, 1,
-1.051029, 0.2602148, -1.291656, 1, 0.9411765, 0, 1,
-1.049523, -0.03716087, -1.717352, 1, 0.9490196, 0, 1,
-1.046098, 1.551325, -1.292904, 1, 0.9529412, 0, 1,
-1.045846, -0.7276452, -3.185457, 1, 0.9607843, 0, 1,
-1.04544, -0.7650341, -1.987903, 1, 0.9647059, 0, 1,
-1.038735, 0.8580977, -0.5223941, 1, 0.972549, 0, 1,
-1.038238, 0.9554412, -2.800169, 1, 0.9764706, 0, 1,
-1.037344, 1.045407, -1.38158, 1, 0.9843137, 0, 1,
-1.037002, 0.3161562, -1.654651, 1, 0.9882353, 0, 1,
-1.023714, 0.7022257, 1.197846, 1, 0.9960784, 0, 1,
-1.019458, 0.5252969, -0.3763417, 0.9960784, 1, 0, 1,
-1.015187, 0.08408587, -1.546209, 0.9921569, 1, 0, 1,
-1.012264, 0.8926615, -1.978468, 0.9843137, 1, 0, 1,
-1.009685, -1.276357, -1.976125, 0.9803922, 1, 0, 1,
-1.005559, 1.245731, 1.798286, 0.972549, 1, 0, 1,
-1.002026, -1.033929, -1.83366, 0.9686275, 1, 0, 1,
-1.000369, -1.023685, -1.607288, 0.9607843, 1, 0, 1,
-0.9931209, 0.4026986, -1.733655, 0.9568627, 1, 0, 1,
-0.9897445, -0.2574167, -0.891108, 0.9490196, 1, 0, 1,
-0.9813281, 0.6617554, -0.7148196, 0.945098, 1, 0, 1,
-0.9791621, -0.01097821, -1.754122, 0.9372549, 1, 0, 1,
-0.9714035, 0.9222211, -1.40349, 0.9333333, 1, 0, 1,
-0.9669003, 0.4092831, -2.064043, 0.9254902, 1, 0, 1,
-0.9542783, -0.7636917, -1.832378, 0.9215686, 1, 0, 1,
-0.9352089, -0.1180795, -0.9402049, 0.9137255, 1, 0, 1,
-0.9348884, -0.8898814, -1.888523, 0.9098039, 1, 0, 1,
-0.9308544, 2.210408, -2.903413, 0.9019608, 1, 0, 1,
-0.9241061, 0.2587693, -0.2645355, 0.8941177, 1, 0, 1,
-0.9179735, -0.1144221, -0.2480773, 0.8901961, 1, 0, 1,
-0.9176428, 0.1054035, -1.246007, 0.8823529, 1, 0, 1,
-0.917583, 1.693917, 0.8341156, 0.8784314, 1, 0, 1,
-0.9142084, -0.2001005, -0.9641698, 0.8705882, 1, 0, 1,
-0.9123716, -0.5568672, -0.6034476, 0.8666667, 1, 0, 1,
-0.9108381, 1.228893, -0.24435, 0.8588235, 1, 0, 1,
-0.9077857, 1.527956, -0.4229123, 0.854902, 1, 0, 1,
-0.9043545, -0.999615, -1.724406, 0.8470588, 1, 0, 1,
-0.9041302, 0.1137151, -2.193892, 0.8431373, 1, 0, 1,
-0.8939739, 0.1106892, -0.5621517, 0.8352941, 1, 0, 1,
-0.893428, -1.986111, -2.651769, 0.8313726, 1, 0, 1,
-0.89327, -0.1913311, -2.412958, 0.8235294, 1, 0, 1,
-0.8797408, -1.316123, -2.388028, 0.8196079, 1, 0, 1,
-0.8791032, 0.7578911, -2.352742, 0.8117647, 1, 0, 1,
-0.874217, 0.4370279, -0.163949, 0.8078431, 1, 0, 1,
-0.8722103, -0.06410763, -2.417561, 0.8, 1, 0, 1,
-0.8659366, -0.6943758, -1.528517, 0.7921569, 1, 0, 1,
-0.8640816, 0.2656261, -3.080509, 0.7882353, 1, 0, 1,
-0.8605098, 0.303818, -1.581548, 0.7803922, 1, 0, 1,
-0.8577682, 1.044006, 0.06720802, 0.7764706, 1, 0, 1,
-0.8547101, 0.2374008, -1.761697, 0.7686275, 1, 0, 1,
-0.8492048, -0.947817, -2.624552, 0.7647059, 1, 0, 1,
-0.8482709, -0.2078173, -4.527208, 0.7568628, 1, 0, 1,
-0.8478357, -0.1529439, -2.545922, 0.7529412, 1, 0, 1,
-0.8436171, 0.588401, -1.34037, 0.7450981, 1, 0, 1,
-0.8410314, 0.8122996, -0.6227482, 0.7411765, 1, 0, 1,
-0.8406234, -0.07143814, -2.580745, 0.7333333, 1, 0, 1,
-0.8400055, 0.1342441, 0.206877, 0.7294118, 1, 0, 1,
-0.8364009, -1.730261, -2.021652, 0.7215686, 1, 0, 1,
-0.8334831, -0.2106625, -1.833041, 0.7176471, 1, 0, 1,
-0.8329083, 0.2077241, -1.251189, 0.7098039, 1, 0, 1,
-0.829962, 1.704174, 0.5289004, 0.7058824, 1, 0, 1,
-0.8219754, -0.1492459, -0.1931113, 0.6980392, 1, 0, 1,
-0.8211027, 1.477146, -0.9897046, 0.6901961, 1, 0, 1,
-0.8185192, 0.4358125, -0.5488732, 0.6862745, 1, 0, 1,
-0.8168806, 0.06276901, -1.816344, 0.6784314, 1, 0, 1,
-0.8115817, -0.8034924, -2.447281, 0.6745098, 1, 0, 1,
-0.8089265, 0.1019574, -1.249632, 0.6666667, 1, 0, 1,
-0.8080972, -0.1723935, -2.354271, 0.6627451, 1, 0, 1,
-0.8078797, -0.5239843, -0.7364535, 0.654902, 1, 0, 1,
-0.8063319, -0.5304559, -1.998945, 0.6509804, 1, 0, 1,
-0.80576, 0.3464077, -2.178919, 0.6431373, 1, 0, 1,
-0.8013101, 0.8823145, -2.316164, 0.6392157, 1, 0, 1,
-0.7952567, -1.499296, -3.259779, 0.6313726, 1, 0, 1,
-0.7856469, -0.6262417, -1.379258, 0.627451, 1, 0, 1,
-0.7739367, -1.483734, -2.190813, 0.6196079, 1, 0, 1,
-0.7690715, -0.271705, -2.682464, 0.6156863, 1, 0, 1,
-0.7682235, -2.149834, -3.292523, 0.6078432, 1, 0, 1,
-0.7673709, -0.02082326, -1.859601, 0.6039216, 1, 0, 1,
-0.7665188, -0.3155607, -1.578388, 0.5960785, 1, 0, 1,
-0.7659582, -0.8212832, -2.46223, 0.5882353, 1, 0, 1,
-0.7595206, -0.4237243, -0.5112493, 0.5843138, 1, 0, 1,
-0.7555146, -1.481885, -3.718017, 0.5764706, 1, 0, 1,
-0.7543233, -0.4863982, -1.878625, 0.572549, 1, 0, 1,
-0.7519666, 0.2514775, -2.575089, 0.5647059, 1, 0, 1,
-0.7477331, -0.9855204, -3.208497, 0.5607843, 1, 0, 1,
-0.7461288, 1.588144, -2.94091, 0.5529412, 1, 0, 1,
-0.7412473, 1.181701, -0.8133683, 0.5490196, 1, 0, 1,
-0.7260806, 0.8935027, -2.105346, 0.5411765, 1, 0, 1,
-0.7258155, 0.7652301, 0.4314024, 0.5372549, 1, 0, 1,
-0.7230603, -0.8814382, -4.00989, 0.5294118, 1, 0, 1,
-0.7220141, -0.759768, -3.375586, 0.5254902, 1, 0, 1,
-0.7184942, 0.4864323, -1.2172, 0.5176471, 1, 0, 1,
-0.7151945, 0.1825723, -0.4434365, 0.5137255, 1, 0, 1,
-0.7136364, 1.269378, 0.7843583, 0.5058824, 1, 0, 1,
-0.7114416, -1.345411, -2.66393, 0.5019608, 1, 0, 1,
-0.70314, -0.9725961, -2.230663, 0.4941176, 1, 0, 1,
-0.7011219, 2.143874, 1.29844, 0.4862745, 1, 0, 1,
-0.6921445, -0.9392759, -2.638909, 0.4823529, 1, 0, 1,
-0.6916817, 0.4223533, 1.169511, 0.4745098, 1, 0, 1,
-0.6852753, 0.2000478, -1.805051, 0.4705882, 1, 0, 1,
-0.6850283, 0.3898331, 0.04676897, 0.4627451, 1, 0, 1,
-0.6836785, 0.7699714, -1.292181, 0.4588235, 1, 0, 1,
-0.6820018, -1.057091, -3.153207, 0.4509804, 1, 0, 1,
-0.680276, -1.228856, -0.8473961, 0.4470588, 1, 0, 1,
-0.6764957, 0.9159049, 0.7610443, 0.4392157, 1, 0, 1,
-0.6749328, -0.9088666, -2.522605, 0.4352941, 1, 0, 1,
-0.6666877, 0.02880047, -3.114053, 0.427451, 1, 0, 1,
-0.6650277, -0.1968217, -1.805063, 0.4235294, 1, 0, 1,
-0.6594107, 0.2411804, 0.0919788, 0.4156863, 1, 0, 1,
-0.6591139, 0.2754074, -2.552215, 0.4117647, 1, 0, 1,
-0.6566466, -0.147847, -0.8586776, 0.4039216, 1, 0, 1,
-0.6563572, -0.4295606, -0.7170545, 0.3960784, 1, 0, 1,
-0.6554585, 0.2987023, 0.332105, 0.3921569, 1, 0, 1,
-0.6537382, -1.907194, -4.281434, 0.3843137, 1, 0, 1,
-0.6436006, -0.7007621, -2.44722, 0.3803922, 1, 0, 1,
-0.641683, 0.1952637, -2.082236, 0.372549, 1, 0, 1,
-0.6415083, -0.5316787, -3.622981, 0.3686275, 1, 0, 1,
-0.6367775, 0.2344, -2.291033, 0.3607843, 1, 0, 1,
-0.6362857, -0.9818618, -1.958179, 0.3568628, 1, 0, 1,
-0.6293861, -1.301553, -3.361878, 0.3490196, 1, 0, 1,
-0.628969, -1.341088, -4.165635, 0.345098, 1, 0, 1,
-0.6273558, 1.552994, -0.3435249, 0.3372549, 1, 0, 1,
-0.6250696, 0.3924575, -2.488759, 0.3333333, 1, 0, 1,
-0.6242194, 1.579498, -0.7657795, 0.3254902, 1, 0, 1,
-0.6199383, 0.1492351, 0.4902503, 0.3215686, 1, 0, 1,
-0.6195257, -0.5480523, -2.058838, 0.3137255, 1, 0, 1,
-0.6168269, 0.6966047, -0.6022874, 0.3098039, 1, 0, 1,
-0.6163353, 0.2941186, -0.8589647, 0.3019608, 1, 0, 1,
-0.6157072, -0.5447906, -3.303421, 0.2941177, 1, 0, 1,
-0.6152443, -0.108948, -1.773816, 0.2901961, 1, 0, 1,
-0.6124612, 0.9196228, 0.4173068, 0.282353, 1, 0, 1,
-0.6089391, 0.5829998, -1.175529, 0.2784314, 1, 0, 1,
-0.6082015, -0.009652729, -0.7138976, 0.2705882, 1, 0, 1,
-0.6030806, 0.6683555, -1.652221, 0.2666667, 1, 0, 1,
-0.6030196, 0.04633147, -3.397086, 0.2588235, 1, 0, 1,
-0.6029938, -2.701546, -3.386927, 0.254902, 1, 0, 1,
-0.6019742, 0.4370862, -1.142655, 0.2470588, 1, 0, 1,
-0.5947835, 0.8200932, 0.5444207, 0.2431373, 1, 0, 1,
-0.5943681, 0.9767288, -0.3802458, 0.2352941, 1, 0, 1,
-0.5928065, 0.3801379, -0.4139752, 0.2313726, 1, 0, 1,
-0.5922699, 0.7598787, 1.76751, 0.2235294, 1, 0, 1,
-0.5921546, -0.4218169, -2.095282, 0.2196078, 1, 0, 1,
-0.5806782, 0.5045806, 0.129021, 0.2117647, 1, 0, 1,
-0.5787191, 0.5284966, -1.53272, 0.2078431, 1, 0, 1,
-0.5777819, -1.426921, -3.055849, 0.2, 1, 0, 1,
-0.5763134, 0.881375, 1.82859, 0.1921569, 1, 0, 1,
-0.5720378, -0.6774119, -1.197256, 0.1882353, 1, 0, 1,
-0.5701091, 0.1080653, -0.6067564, 0.1803922, 1, 0, 1,
-0.5680158, -0.1018367, -2.434116, 0.1764706, 1, 0, 1,
-0.5676972, -0.6253915, -2.568742, 0.1686275, 1, 0, 1,
-0.5658281, 0.4150144, 1.200264, 0.1647059, 1, 0, 1,
-0.5548409, 0.3331726, -1.495956, 0.1568628, 1, 0, 1,
-0.5523128, 0.7412549, -0.08490688, 0.1529412, 1, 0, 1,
-0.5463146, 0.1487847, -1.765115, 0.145098, 1, 0, 1,
-0.5417135, 1.030383, -2.392316, 0.1411765, 1, 0, 1,
-0.5376495, 0.8020607, 0.3765602, 0.1333333, 1, 0, 1,
-0.537551, -0.2402389, -2.999615, 0.1294118, 1, 0, 1,
-0.534853, -0.6228345, -2.988909, 0.1215686, 1, 0, 1,
-0.5283625, -1.221242, -1.811155, 0.1176471, 1, 0, 1,
-0.525601, -2.613689, -3.01091, 0.1098039, 1, 0, 1,
-0.5226005, -0.4774797, -0.4737032, 0.1058824, 1, 0, 1,
-0.5148293, -0.7316899, -2.918098, 0.09803922, 1, 0, 1,
-0.5073152, 0.7847092, -1.577908, 0.09019608, 1, 0, 1,
-0.5069193, 0.1610812, -1.777776, 0.08627451, 1, 0, 1,
-0.5012984, -1.379482, -1.250486, 0.07843138, 1, 0, 1,
-0.491976, 1.517198, -0.6711743, 0.07450981, 1, 0, 1,
-0.4880563, -1.122657, -3.338914, 0.06666667, 1, 0, 1,
-0.4839042, 0.04939805, -0.5366129, 0.0627451, 1, 0, 1,
-0.4795558, -0.4313802, -4.08142, 0.05490196, 1, 0, 1,
-0.478763, -2.327584, -1.108229, 0.05098039, 1, 0, 1,
-0.4761803, -0.002478182, -1.991445, 0.04313726, 1, 0, 1,
-0.4741433, 0.8383695, -0.9359574, 0.03921569, 1, 0, 1,
-0.4731979, 0.9033112, 0.1381919, 0.03137255, 1, 0, 1,
-0.4721276, -0.4842624, -2.085432, 0.02745098, 1, 0, 1,
-0.4713885, 0.1035068, -1.270433, 0.01960784, 1, 0, 1,
-0.4635312, 1.126272, -0.7288734, 0.01568628, 1, 0, 1,
-0.4626869, 1.042939, -2.410933, 0.007843138, 1, 0, 1,
-0.4523898, 1.508129, -1.382194, 0.003921569, 1, 0, 1,
-0.447822, 0.4549211, -0.3699191, 0, 1, 0.003921569, 1,
-0.445727, 0.4850035, 0.5176072, 0, 1, 0.01176471, 1,
-0.4456564, -0.387903, -2.168324, 0, 1, 0.01568628, 1,
-0.4422271, 0.3033379, -0.6088169, 0, 1, 0.02352941, 1,
-0.44038, -0.308985, -1.089286, 0, 1, 0.02745098, 1,
-0.4391266, 0.3564297, -1.365779, 0, 1, 0.03529412, 1,
-0.4383581, -0.2990422, -1.633417, 0, 1, 0.03921569, 1,
-0.4377523, -0.7855812, -2.993485, 0, 1, 0.04705882, 1,
-0.4350103, -1.154784, -0.930848, 0, 1, 0.05098039, 1,
-0.4346482, -0.9016861, -3.532169, 0, 1, 0.05882353, 1,
-0.4341536, 1.081933, 0.5018356, 0, 1, 0.0627451, 1,
-0.4309934, -1.607552, -4.255191, 0, 1, 0.07058824, 1,
-0.4267759, -1.363326, -4.062651, 0, 1, 0.07450981, 1,
-0.4242906, 0.3606645, 0.7582078, 0, 1, 0.08235294, 1,
-0.4167495, 1.067958, -0.8376654, 0, 1, 0.08627451, 1,
-0.4145273, 0.4753855, -3.053742, 0, 1, 0.09411765, 1,
-0.4133679, -0.147726, -1.717386, 0, 1, 0.1019608, 1,
-0.4125471, 0.6632154, -1.006759, 0, 1, 0.1058824, 1,
-0.4105764, -0.841581, -3.294653, 0, 1, 0.1137255, 1,
-0.4096848, -1.008911, -2.034159, 0, 1, 0.1176471, 1,
-0.404067, -0.982787, -2.576115, 0, 1, 0.1254902, 1,
-0.4006722, 1.273501, 0.2866911, 0, 1, 0.1294118, 1,
-0.4003359, 0.3347043, -0.8731298, 0, 1, 0.1372549, 1,
-0.3997657, 0.1972701, -2.205996, 0, 1, 0.1411765, 1,
-0.3984528, -1.195863, -3.609615, 0, 1, 0.1490196, 1,
-0.3978073, -0.6732156, -1.530939, 0, 1, 0.1529412, 1,
-0.3961568, 0.3636528, -1.327254, 0, 1, 0.1607843, 1,
-0.3883792, -2.302652, -2.935999, 0, 1, 0.1647059, 1,
-0.3872432, 1.610318, -1.405246, 0, 1, 0.172549, 1,
-0.3871053, -1.193969, -2.674661, 0, 1, 0.1764706, 1,
-0.3866645, 0.1817114, -0.1387757, 0, 1, 0.1843137, 1,
-0.3864354, 0.6612914, -1.11293, 0, 1, 0.1882353, 1,
-0.386366, -0.3183761, -1.162116, 0, 1, 0.1960784, 1,
-0.3850074, -0.2638952, -2.63239, 0, 1, 0.2039216, 1,
-0.3821699, 0.2325878, -1.439475, 0, 1, 0.2078431, 1,
-0.3782282, -0.1861555, -1.276819, 0, 1, 0.2156863, 1,
-0.3736041, 0.9702359, -0.9982308, 0, 1, 0.2196078, 1,
-0.3717452, 0.909915, -0.2006534, 0, 1, 0.227451, 1,
-0.3695725, -0.9649448, -4.147213, 0, 1, 0.2313726, 1,
-0.3673436, -0.6563759, -2.659864, 0, 1, 0.2392157, 1,
-0.3662057, -1.732597, -1.755121, 0, 1, 0.2431373, 1,
-0.3639469, -1.544811, -3.11697, 0, 1, 0.2509804, 1,
-0.3608098, 0.7576533, 0.728, 0, 1, 0.254902, 1,
-0.3602828, -0.6579448, -1.956457, 0, 1, 0.2627451, 1,
-0.3595131, 0.9275836, -0.9245807, 0, 1, 0.2666667, 1,
-0.3552252, 1.502608, -0.005129436, 0, 1, 0.2745098, 1,
-0.354631, -0.8066837, -3.526608, 0, 1, 0.2784314, 1,
-0.3537894, -0.4048646, -1.001278, 0, 1, 0.2862745, 1,
-0.344803, 0.07247914, -0.8208901, 0, 1, 0.2901961, 1,
-0.343318, -0.4392872, -1.906703, 0, 1, 0.2980392, 1,
-0.3398626, 0.4768427, -1.032407, 0, 1, 0.3058824, 1,
-0.3374522, 0.5924578, -0.2727907, 0, 1, 0.3098039, 1,
-0.3336389, 0.5170116, -3.299612, 0, 1, 0.3176471, 1,
-0.3333053, 1.565334, 1.439322, 0, 1, 0.3215686, 1,
-0.3323202, 0.2136311, 0.3255396, 0, 1, 0.3294118, 1,
-0.3304162, 0.9419666, -0.9591413, 0, 1, 0.3333333, 1,
-0.325949, -0.8754048, -3.850787, 0, 1, 0.3411765, 1,
-0.3094952, 1.642259, 0.6759034, 0, 1, 0.345098, 1,
-0.307068, -2.026482, -4.332556, 0, 1, 0.3529412, 1,
-0.3050428, 0.5020697, -1.835403, 0, 1, 0.3568628, 1,
-0.2986119, 0.7019628, -0.7243721, 0, 1, 0.3647059, 1,
-0.2973038, 0.08711131, -1.268409, 0, 1, 0.3686275, 1,
-0.2937688, 1.181411, 1.642711, 0, 1, 0.3764706, 1,
-0.2909744, -0.1310771, -2.754018, 0, 1, 0.3803922, 1,
-0.2892334, -0.3822292, -2.266444, 0, 1, 0.3882353, 1,
-0.2874621, 1.347177, -0.09873044, 0, 1, 0.3921569, 1,
-0.2869385, 0.4281893, 0.5400842, 0, 1, 0.4, 1,
-0.2836014, 0.04439852, -2.781627, 0, 1, 0.4078431, 1,
-0.2718966, -1.080408, -2.228447, 0, 1, 0.4117647, 1,
-0.270936, 1.712333, -0.1572689, 0, 1, 0.4196078, 1,
-0.2674738, 0.3243385, -1.016219, 0, 1, 0.4235294, 1,
-0.2646184, -2.198175, -1.861785, 0, 1, 0.4313726, 1,
-0.264427, 1.673265, 0.8070573, 0, 1, 0.4352941, 1,
-0.2571694, -0.001855687, -1.079026, 0, 1, 0.4431373, 1,
-0.2528968, -1.27259, -3.876951, 0, 1, 0.4470588, 1,
-0.2514835, 0.3475923, -1.190182, 0, 1, 0.454902, 1,
-0.2514113, 1.418602, -0.6272401, 0, 1, 0.4588235, 1,
-0.2513603, 0.8338093, -0.3934574, 0, 1, 0.4666667, 1,
-0.2494806, -0.9912254, -5.169632, 0, 1, 0.4705882, 1,
-0.2490277, 0.3129627, 0.2817483, 0, 1, 0.4784314, 1,
-0.2465046, 0.008608278, -0.0956608, 0, 1, 0.4823529, 1,
-0.2450457, -1.556799, -2.698078, 0, 1, 0.4901961, 1,
-0.2412864, -0.09438917, -2.050342, 0, 1, 0.4941176, 1,
-0.2360114, -0.4047236, -1.9304, 0, 1, 0.5019608, 1,
-0.2349825, 0.5293875, -1.668644, 0, 1, 0.509804, 1,
-0.2347335, 0.3673919, -1.596019, 0, 1, 0.5137255, 1,
-0.2324077, 1.073927, 0.4006093, 0, 1, 0.5215687, 1,
-0.2322232, -0.6337784, -2.402234, 0, 1, 0.5254902, 1,
-0.2285291, 1.69238, 0.2164429, 0, 1, 0.5333334, 1,
-0.213643, 0.2213009, -0.9956349, 0, 1, 0.5372549, 1,
-0.2100281, 0.202622, -1.296106, 0, 1, 0.5450981, 1,
-0.2085343, -0.03554391, -1.61701, 0, 1, 0.5490196, 1,
-0.2069686, -1.012994, -2.587862, 0, 1, 0.5568628, 1,
-0.2037974, -0.01926858, -2.070702, 0, 1, 0.5607843, 1,
-0.1979035, -0.6733598, -3.69303, 0, 1, 0.5686275, 1,
-0.1931195, 0.7733481, -0.7011551, 0, 1, 0.572549, 1,
-0.1879075, -0.1803876, -3.934659, 0, 1, 0.5803922, 1,
-0.1834783, -0.2130807, -2.945801, 0, 1, 0.5843138, 1,
-0.1744484, 0.0534164, -1.222969, 0, 1, 0.5921569, 1,
-0.1742737, 0.198285, -1.618338, 0, 1, 0.5960785, 1,
-0.1683196, -0.5897725, -3.816679, 0, 1, 0.6039216, 1,
-0.1650156, 1.738827, -0.2310046, 0, 1, 0.6117647, 1,
-0.1631242, 0.5225102, -0.3405026, 0, 1, 0.6156863, 1,
-0.1587468, 1.113313, 1.231915, 0, 1, 0.6235294, 1,
-0.1583681, -0.4467692, -2.946756, 0, 1, 0.627451, 1,
-0.1555147, -1.463789, -2.791305, 0, 1, 0.6352941, 1,
-0.151926, -1.782515, -4.040354, 0, 1, 0.6392157, 1,
-0.1428638, -0.04055523, -0.494615, 0, 1, 0.6470588, 1,
-0.1417812, 1.761025, -0.6135923, 0, 1, 0.6509804, 1,
-0.141166, 1.099102, -0.3435991, 0, 1, 0.6588235, 1,
-0.1383948, 0.4783586, -0.2992715, 0, 1, 0.6627451, 1,
-0.1260619, -0.5815634, -2.354455, 0, 1, 0.6705883, 1,
-0.1244434, 0.1112585, -1.712454, 0, 1, 0.6745098, 1,
-0.1208867, -0.2123651, -0.8762434, 0, 1, 0.682353, 1,
-0.1192119, -1.027536, -4.58105, 0, 1, 0.6862745, 1,
-0.1083586, -0.8451931, -2.617587, 0, 1, 0.6941177, 1,
-0.1055713, 0.9648764, 1.251897, 0, 1, 0.7019608, 1,
-0.1029206, 0.5549338, -0.1844411, 0, 1, 0.7058824, 1,
-0.101944, 0.2202353, -0.05593521, 0, 1, 0.7137255, 1,
-0.1018458, 1.063334, -1.417911, 0, 1, 0.7176471, 1,
-0.09893443, -0.1295135, -1.308473, 0, 1, 0.7254902, 1,
-0.09599362, 0.6119419, -0.3460953, 0, 1, 0.7294118, 1,
-0.0936783, -0.4725802, -4.895733, 0, 1, 0.7372549, 1,
-0.08969949, 1.449624, -0.2802562, 0, 1, 0.7411765, 1,
-0.08707076, -1.523754, -1.603886, 0, 1, 0.7490196, 1,
-0.08589665, 0.424369, -1.107314, 0, 1, 0.7529412, 1,
-0.08427963, -0.5771962, -3.410174, 0, 1, 0.7607843, 1,
-0.07616752, -1.288277, -3.451018, 0, 1, 0.7647059, 1,
-0.07610736, 0.9541749, 1.387056, 0, 1, 0.772549, 1,
-0.0726422, -0.6958125, -0.9672996, 0, 1, 0.7764706, 1,
-0.07250851, 0.4068479, 0.6110851, 0, 1, 0.7843137, 1,
-0.07116166, -0.2137616, -2.401188, 0, 1, 0.7882353, 1,
-0.06327153, -0.04533735, -1.507571, 0, 1, 0.7960784, 1,
-0.06067791, -0.6537498, -3.784921, 0, 1, 0.8039216, 1,
-0.05938376, 0.2713338, 0.790674, 0, 1, 0.8078431, 1,
-0.05815314, -1.086261, -1.696256, 0, 1, 0.8156863, 1,
-0.05704363, -2.57808, -1.407573, 0, 1, 0.8196079, 1,
-0.05693743, 0.5340788, -0.6144586, 0, 1, 0.827451, 1,
-0.05374054, -0.2655918, -2.367079, 0, 1, 0.8313726, 1,
-0.05006649, 0.4682617, -0.2243149, 0, 1, 0.8392157, 1,
-0.0495615, 2.358198, -0.871462, 0, 1, 0.8431373, 1,
-0.04808607, -0.5054192, -3.594594, 0, 1, 0.8509804, 1,
-0.04757977, 0.09671614, -1.912218, 0, 1, 0.854902, 1,
-0.04533108, 2.255409, 1.320017, 0, 1, 0.8627451, 1,
-0.04162732, -1.502492, -2.163392, 0, 1, 0.8666667, 1,
-0.03934968, -1.009943, -2.472004, 0, 1, 0.8745098, 1,
-0.03766442, 0.3094828, -1.518044, 0, 1, 0.8784314, 1,
-0.03480814, 0.4533178, 2.244922, 0, 1, 0.8862745, 1,
-0.03397771, 1.288951, 0.6783216, 0, 1, 0.8901961, 1,
-0.03216783, 0.7697212, -0.1057429, 0, 1, 0.8980392, 1,
-0.03124478, 1.044298, -0.09849917, 0, 1, 0.9058824, 1,
-0.02840721, -1.071554, -2.252708, 0, 1, 0.9098039, 1,
-0.02837134, -0.5304218, -3.288485, 0, 1, 0.9176471, 1,
-0.02688148, -0.3106725, -3.058878, 0, 1, 0.9215686, 1,
-0.01842486, -0.01641853, -2.863517, 0, 1, 0.9294118, 1,
-0.01466742, 0.3928905, -0.2599375, 0, 1, 0.9333333, 1,
-0.01451744, -2.149445, -2.462085, 0, 1, 0.9411765, 1,
-0.01210042, -0.9882476, -2.719689, 0, 1, 0.945098, 1,
-0.006876913, -0.9743851, -3.950417, 0, 1, 0.9529412, 1,
-0.002851724, -1.929848, -3.154789, 0, 1, 0.9568627, 1,
-0.001112861, 1.889858, -0.07353792, 0, 1, 0.9647059, 1,
0.0004758555, 0.1246286, -1.023494, 0, 1, 0.9686275, 1,
0.002881759, 2.271565, -0.4252049, 0, 1, 0.9764706, 1,
0.003238174, -1.188303, 4.221801, 0, 1, 0.9803922, 1,
0.004789558, -1.481175, 2.649336, 0, 1, 0.9882353, 1,
0.004910049, 1.141013, 0.939429, 0, 1, 0.9921569, 1,
0.005049725, -0.1171105, 2.269973, 0, 1, 1, 1,
0.008212063, -0.7030742, 1.972474, 0, 0.9921569, 1, 1,
0.009516117, -0.1525706, 3.132999, 0, 0.9882353, 1, 1,
0.01015877, -0.9104875, 3.421467, 0, 0.9803922, 1, 1,
0.01133697, -0.7351706, 3.418371, 0, 0.9764706, 1, 1,
0.01265043, -0.6863418, 2.114919, 0, 0.9686275, 1, 1,
0.01413833, 1.078964, 0.0366176, 0, 0.9647059, 1, 1,
0.01813587, -2.239566, 1.376828, 0, 0.9568627, 1, 1,
0.01945865, 0.5488288, -0.2954378, 0, 0.9529412, 1, 1,
0.02155325, 1.57828, -0.9092638, 0, 0.945098, 1, 1,
0.02215072, -1.729472, 3.413186, 0, 0.9411765, 1, 1,
0.02500941, 0.6299056, 1.090672, 0, 0.9333333, 1, 1,
0.02679388, 0.2178302, 1.230436, 0, 0.9294118, 1, 1,
0.02759186, -2.343984, 2.934733, 0, 0.9215686, 1, 1,
0.03069029, -0.4800187, 3.424672, 0, 0.9176471, 1, 1,
0.03084114, -0.8864297, 2.891491, 0, 0.9098039, 1, 1,
0.03373297, -0.1966138, 3.155748, 0, 0.9058824, 1, 1,
0.0346491, 0.6858844, 0.5104203, 0, 0.8980392, 1, 1,
0.03479219, 2.028057, 0.541981, 0, 0.8901961, 1, 1,
0.03486105, -0.6432602, 4.297983, 0, 0.8862745, 1, 1,
0.03703915, -0.7877035, 2.817896, 0, 0.8784314, 1, 1,
0.03833979, -0.1221924, 2.790527, 0, 0.8745098, 1, 1,
0.04141585, -1.20371, 4.720196, 0, 0.8666667, 1, 1,
0.04158352, 0.3611387, -0.9399279, 0, 0.8627451, 1, 1,
0.04165793, -0.2835815, 3.237731, 0, 0.854902, 1, 1,
0.04524273, -1.604177, 2.745466, 0, 0.8509804, 1, 1,
0.04685026, 1.256367, -1.550002, 0, 0.8431373, 1, 1,
0.04807865, 0.412599, 1.07556, 0, 0.8392157, 1, 1,
0.04940623, -0.2386162, 3.345512, 0, 0.8313726, 1, 1,
0.05015386, 1.275965, 0.8905748, 0, 0.827451, 1, 1,
0.05082884, -1.847821, 2.895529, 0, 0.8196079, 1, 1,
0.05476176, 0.1107105, -0.7953008, 0, 0.8156863, 1, 1,
0.05610688, -1.539392, 4.392075, 0, 0.8078431, 1, 1,
0.0561346, -0.7729957, 3.268859, 0, 0.8039216, 1, 1,
0.05747457, 0.5465216, 0.8416455, 0, 0.7960784, 1, 1,
0.05940288, 0.4419361, 1.124171, 0, 0.7882353, 1, 1,
0.06208527, 0.1305601, 1.379432, 0, 0.7843137, 1, 1,
0.06265151, -1.524979, 2.94429, 0, 0.7764706, 1, 1,
0.06846745, -0.8847649, 4.910919, 0, 0.772549, 1, 1,
0.06997927, 1.592055, 0.6436858, 0, 0.7647059, 1, 1,
0.07017665, 0.7959185, 0.7702534, 0, 0.7607843, 1, 1,
0.07653996, 1.693982, -1.233484, 0, 0.7529412, 1, 1,
0.0823703, 1.632772, 1.338953, 0, 0.7490196, 1, 1,
0.08423182, 0.3670854, -1.696096, 0, 0.7411765, 1, 1,
0.08538725, -1.04313, 2.917006, 0, 0.7372549, 1, 1,
0.08973995, -2.237196, 3.586018, 0, 0.7294118, 1, 1,
0.0901804, 0.9721473, 1.730536, 0, 0.7254902, 1, 1,
0.09086316, 0.1243523, 0.1062903, 0, 0.7176471, 1, 1,
0.09227838, -1.429425, 2.674832, 0, 0.7137255, 1, 1,
0.09431856, -1.058061, 1.082116, 0, 0.7058824, 1, 1,
0.0944986, -2.548316, 2.832279, 0, 0.6980392, 1, 1,
0.09965003, -1.481634, 1.56875, 0, 0.6941177, 1, 1,
0.1012793, 0.4554974, 0.7858132, 0, 0.6862745, 1, 1,
0.1028297, -0.5445896, 3.493631, 0, 0.682353, 1, 1,
0.1038195, -1.194402, 2.054218, 0, 0.6745098, 1, 1,
0.1085455, -0.3649488, 4.288754, 0, 0.6705883, 1, 1,
0.1147571, 0.3155079, 0.8342772, 0, 0.6627451, 1, 1,
0.1160032, 1.558654, 0.5188425, 0, 0.6588235, 1, 1,
0.1162021, 0.1094959, -0.1944748, 0, 0.6509804, 1, 1,
0.1164384, 0.5754116, 0.506919, 0, 0.6470588, 1, 1,
0.1169953, -0.2308363, 2.842312, 0, 0.6392157, 1, 1,
0.1181854, 1.344935, 0.371812, 0, 0.6352941, 1, 1,
0.1199837, -0.5684112, 1.981134, 0, 0.627451, 1, 1,
0.1236376, -0.09794848, 3.250917, 0, 0.6235294, 1, 1,
0.124685, 0.9644404, 0.9791216, 0, 0.6156863, 1, 1,
0.1257804, 0.4046122, -0.787807, 0, 0.6117647, 1, 1,
0.1297039, 0.4514003, 0.8600711, 0, 0.6039216, 1, 1,
0.1303811, 0.7548028, 0.1845789, 0, 0.5960785, 1, 1,
0.1321589, 0.6758052, -0.2295106, 0, 0.5921569, 1, 1,
0.1366607, 0.1973017, 0.521513, 0, 0.5843138, 1, 1,
0.1367805, -1.056489, 2.698416, 0, 0.5803922, 1, 1,
0.137027, 0.800139, -0.639365, 0, 0.572549, 1, 1,
0.1382267, -0.1154413, 0.8102924, 0, 0.5686275, 1, 1,
0.147182, 0.5222343, 0.220047, 0, 0.5607843, 1, 1,
0.148173, 0.5618106, 2.404341, 0, 0.5568628, 1, 1,
0.1481964, 0.4952247, 0.2558438, 0, 0.5490196, 1, 1,
0.1509548, -1.360541, 4.486457, 0, 0.5450981, 1, 1,
0.1576722, -0.1524188, 3.057553, 0, 0.5372549, 1, 1,
0.1611365, 0.1330897, 0.9451669, 0, 0.5333334, 1, 1,
0.1615522, -0.02079564, 1.75192, 0, 0.5254902, 1, 1,
0.1637959, 0.3565153, -0.1310479, 0, 0.5215687, 1, 1,
0.16607, 0.6037784, -1.109942, 0, 0.5137255, 1, 1,
0.166494, -1.060596, 3.850456, 0, 0.509804, 1, 1,
0.1686909, -0.6592166, 3.204254, 0, 0.5019608, 1, 1,
0.1756648, 0.2740052, -0.3236953, 0, 0.4941176, 1, 1,
0.1771881, -0.7924183, 2.615718, 0, 0.4901961, 1, 1,
0.1810324, 2.338142, 0.3294083, 0, 0.4823529, 1, 1,
0.1822097, 1.057313, 1.025249, 0, 0.4784314, 1, 1,
0.1870952, 0.7584445, -1.328176, 0, 0.4705882, 1, 1,
0.1874865, 0.2292337, 1.435868, 0, 0.4666667, 1, 1,
0.1935329, 1.113373, 0.2734244, 0, 0.4588235, 1, 1,
0.2015894, -0.1580915, 0.9938074, 0, 0.454902, 1, 1,
0.2034364, 0.5732747, -0.1616938, 0, 0.4470588, 1, 1,
0.2048052, 1.076431, 0.4298302, 0, 0.4431373, 1, 1,
0.2134937, -1.348283, 2.629014, 0, 0.4352941, 1, 1,
0.2141767, 1.052937, -0.2772638, 0, 0.4313726, 1, 1,
0.2159065, 0.4366424, -0.6389458, 0, 0.4235294, 1, 1,
0.2166454, -0.7131266, 2.685987, 0, 0.4196078, 1, 1,
0.2198327, 0.6601503, 0.2586622, 0, 0.4117647, 1, 1,
0.2217559, 0.7008968, 0.4983835, 0, 0.4078431, 1, 1,
0.2311136, -0.8244029, 1.883976, 0, 0.4, 1, 1,
0.2337517, -1.634412, 3.287012, 0, 0.3921569, 1, 1,
0.2343914, -0.703373, 4.101213, 0, 0.3882353, 1, 1,
0.2365983, -0.7860678, 4.584641, 0, 0.3803922, 1, 1,
0.2421336, -1.042037, 5.130076, 0, 0.3764706, 1, 1,
0.2425082, -0.8547401, 3.188153, 0, 0.3686275, 1, 1,
0.2449246, 0.2377643, 0.2431884, 0, 0.3647059, 1, 1,
0.250734, -0.3595231, 2.949964, 0, 0.3568628, 1, 1,
0.2552263, -0.4590859, 0.4314468, 0, 0.3529412, 1, 1,
0.2557895, -1.855531, 3.661014, 0, 0.345098, 1, 1,
0.2558317, 0.7507854, -1.530501, 0, 0.3411765, 1, 1,
0.259617, -1.153338, 1.796112, 0, 0.3333333, 1, 1,
0.2616717, 0.2327966, 0.5489519, 0, 0.3294118, 1, 1,
0.2645624, 1.877205, -0.5258797, 0, 0.3215686, 1, 1,
0.2662781, -0.9014721, 2.68766, 0, 0.3176471, 1, 1,
0.2693101, 0.6022611, 2.128336, 0, 0.3098039, 1, 1,
0.2697698, -1.381092, 3.728811, 0, 0.3058824, 1, 1,
0.2751003, 0.1256003, -0.7917961, 0, 0.2980392, 1, 1,
0.278255, -0.9421049, 2.158783, 0, 0.2901961, 1, 1,
0.2831186, -0.03789331, 0.478736, 0, 0.2862745, 1, 1,
0.2847624, 0.6824478, 0.9230146, 0, 0.2784314, 1, 1,
0.2877836, -0.1278525, 1.4745, 0, 0.2745098, 1, 1,
0.3013391, -1.284531, 1.790256, 0, 0.2666667, 1, 1,
0.3059147, -0.002345138, 1.268101, 0, 0.2627451, 1, 1,
0.3062036, 0.7079526, 0.8558684, 0, 0.254902, 1, 1,
0.3068013, -2.479911, 2.697189, 0, 0.2509804, 1, 1,
0.3084222, 0.03311456, 2.71452, 0, 0.2431373, 1, 1,
0.3171381, -0.4502144, 2.232676, 0, 0.2392157, 1, 1,
0.318339, 0.2441594, 1.266729, 0, 0.2313726, 1, 1,
0.3195576, -0.3049935, 2.74673, 0, 0.227451, 1, 1,
0.3261176, -0.09896568, 2.691379, 0, 0.2196078, 1, 1,
0.327531, -4.166008, 2.955321, 0, 0.2156863, 1, 1,
0.3336889, 0.5122795, 0.7113156, 0, 0.2078431, 1, 1,
0.3337384, 0.9211612, -0.5128773, 0, 0.2039216, 1, 1,
0.3351599, 1.069216, 0.153389, 0, 0.1960784, 1, 1,
0.33796, -0.3845583, 2.516634, 0, 0.1882353, 1, 1,
0.3432404, 0.7433786, 2.505734, 0, 0.1843137, 1, 1,
0.3457705, -0.8417279, 2.693729, 0, 0.1764706, 1, 1,
0.347021, -0.6106281, 2.056277, 0, 0.172549, 1, 1,
0.3542406, 1.280885, 0.9878193, 0, 0.1647059, 1, 1,
0.3543583, 0.9151964, 0.322482, 0, 0.1607843, 1, 1,
0.3559599, 0.48016, 0.3699099, 0, 0.1529412, 1, 1,
0.3561868, -1.155357, 2.41032, 0, 0.1490196, 1, 1,
0.3576128, -0.2968718, 3.088719, 0, 0.1411765, 1, 1,
0.3583592, 1.092838, -0.03496256, 0, 0.1372549, 1, 1,
0.3586494, -1.622604, 1.179455, 0, 0.1294118, 1, 1,
0.3591915, -0.06167619, 0.7019699, 0, 0.1254902, 1, 1,
0.3593157, 0.003781325, 1.137522, 0, 0.1176471, 1, 1,
0.3612204, -2.040235, 1.479661, 0, 0.1137255, 1, 1,
0.364012, 0.5797208, -0.8886527, 0, 0.1058824, 1, 1,
0.3640286, -1.717412, 1.625945, 0, 0.09803922, 1, 1,
0.3685298, 2.010571, 0.474407, 0, 0.09411765, 1, 1,
0.368937, 0.1184209, 1.205827, 0, 0.08627451, 1, 1,
0.3694055, -1.881711, 3.060602, 0, 0.08235294, 1, 1,
0.3717411, -0.2736461, 2.271334, 0, 0.07450981, 1, 1,
0.3733689, 0.4555213, 0.3567692, 0, 0.07058824, 1, 1,
0.374841, -0.6023779, 4.443241, 0, 0.0627451, 1, 1,
0.3765935, -0.2246426, 1.018047, 0, 0.05882353, 1, 1,
0.37684, 0.07227018, 1.712587, 0, 0.05098039, 1, 1,
0.3775792, -1.235205, 3.79251, 0, 0.04705882, 1, 1,
0.3777716, 0.516254, 1.655769, 0, 0.03921569, 1, 1,
0.3857926, -0.09498431, 1.962813, 0, 0.03529412, 1, 1,
0.3870061, 0.08150802, 3.304626, 0, 0.02745098, 1, 1,
0.3878587, -0.3388965, 2.56228, 0, 0.02352941, 1, 1,
0.3927822, -0.03963412, 0.9001189, 0, 0.01568628, 1, 1,
0.397181, 2.236504, 0.6784247, 0, 0.01176471, 1, 1,
0.3988699, 0.171887, 0.828438, 0, 0.003921569, 1, 1,
0.399499, 1.503616, 0.6892491, 0.003921569, 0, 1, 1,
0.401291, -3.293128, 3.205409, 0.007843138, 0, 1, 1,
0.4029247, 0.4068285, 0.6161112, 0.01568628, 0, 1, 1,
0.4062174, -0.4802269, 3.77692, 0.01960784, 0, 1, 1,
0.4071009, 2.707561, 0.06678913, 0.02745098, 0, 1, 1,
0.4083136, 0.6721856, 0.6918049, 0.03137255, 0, 1, 1,
0.4108811, 1.518218, 0.03519469, 0.03921569, 0, 1, 1,
0.4182925, -1.483878, 2.531237, 0.04313726, 0, 1, 1,
0.4198349, -0.7877344, 3.029309, 0.05098039, 0, 1, 1,
0.4236177, 2.168413, 0.7101111, 0.05490196, 0, 1, 1,
0.424195, 0.7073133, 1.166645, 0.0627451, 0, 1, 1,
0.4254881, 1.231369, 1.401028, 0.06666667, 0, 1, 1,
0.4291376, 0.6097013, 2.004188, 0.07450981, 0, 1, 1,
0.4291561, 0.1211787, 0.4953997, 0.07843138, 0, 1, 1,
0.4316191, 0.8245822, 2.148226, 0.08627451, 0, 1, 1,
0.433104, 1.488072, -0.7945464, 0.09019608, 0, 1, 1,
0.4355424, -1.639757, 3.321282, 0.09803922, 0, 1, 1,
0.4408124, 0.7010816, 0.6493329, 0.1058824, 0, 1, 1,
0.4412104, 0.09451054, 2.175141, 0.1098039, 0, 1, 1,
0.4426976, -0.5602074, 0.5027313, 0.1176471, 0, 1, 1,
0.4429388, 0.4085344, 2.649983, 0.1215686, 0, 1, 1,
0.4432031, 0.09398324, 1.807984, 0.1294118, 0, 1, 1,
0.4468835, 1.982157, -0.1508894, 0.1333333, 0, 1, 1,
0.4473501, -0.2875025, 3.768869, 0.1411765, 0, 1, 1,
0.4475547, 0.8288839, 2.143424, 0.145098, 0, 1, 1,
0.4490426, 0.7871481, 1.975199, 0.1529412, 0, 1, 1,
0.452901, -1.179816, 3.553622, 0.1568628, 0, 1, 1,
0.4610551, 0.1561828, 2.514824, 0.1647059, 0, 1, 1,
0.4621834, 0.7842658, 0.08254241, 0.1686275, 0, 1, 1,
0.4631956, 2.217828, -0.8999409, 0.1764706, 0, 1, 1,
0.4666759, 1.321129, 0.6568195, 0.1803922, 0, 1, 1,
0.466983, 0.3937713, 2.055356, 0.1882353, 0, 1, 1,
0.4685308, -1.034479, 0.3588432, 0.1921569, 0, 1, 1,
0.4700423, 0.8295197, 1.026098, 0.2, 0, 1, 1,
0.4706032, 0.9470257, 0.992083, 0.2078431, 0, 1, 1,
0.4727252, -0.5534101, 2.671294, 0.2117647, 0, 1, 1,
0.4738815, -1.561373, 4.151488, 0.2196078, 0, 1, 1,
0.4767888, 0.7646879, -0.8114549, 0.2235294, 0, 1, 1,
0.4833827, -1.165737, 2.790024, 0.2313726, 0, 1, 1,
0.4869547, 0.05023628, 2.512403, 0.2352941, 0, 1, 1,
0.4914929, 1.056392, -0.3559594, 0.2431373, 0, 1, 1,
0.4933762, -1.350096, 3.097604, 0.2470588, 0, 1, 1,
0.494935, -0.1564578, 0.7188508, 0.254902, 0, 1, 1,
0.5004327, -0.4300974, 1.381867, 0.2588235, 0, 1, 1,
0.5006813, -0.08081675, 2.651678, 0.2666667, 0, 1, 1,
0.5022019, -0.2322067, 1.674658, 0.2705882, 0, 1, 1,
0.5076335, 0.1371086, 0.5309732, 0.2784314, 0, 1, 1,
0.5098073, -0.3105058, 0.9640039, 0.282353, 0, 1, 1,
0.5137796, 0.49806, 0.4146552, 0.2901961, 0, 1, 1,
0.5141373, 1.309628, -0.1036067, 0.2941177, 0, 1, 1,
0.5149991, -0.3719095, 2.101695, 0.3019608, 0, 1, 1,
0.5195252, -1.551067, 3.04793, 0.3098039, 0, 1, 1,
0.5195475, 0.6966065, -0.406667, 0.3137255, 0, 1, 1,
0.5209022, -1.325383, 2.70801, 0.3215686, 0, 1, 1,
0.5274259, -1.658765, 2.780334, 0.3254902, 0, 1, 1,
0.530394, 0.2235463, 2.041494, 0.3333333, 0, 1, 1,
0.5307719, 0.4909833, 1.118624, 0.3372549, 0, 1, 1,
0.5350102, 0.8401974, -0.1537344, 0.345098, 0, 1, 1,
0.537065, 1.058267, 0.01532765, 0.3490196, 0, 1, 1,
0.5397711, -0.7699426, 4.133817, 0.3568628, 0, 1, 1,
0.5400889, 0.3792198, 0.8658432, 0.3607843, 0, 1, 1,
0.5416526, 0.1495013, 3.274925, 0.3686275, 0, 1, 1,
0.5420783, -0.06231627, 2.162263, 0.372549, 0, 1, 1,
0.5504088, 0.2365955, 0.4451625, 0.3803922, 0, 1, 1,
0.5549449, -0.235198, 2.819657, 0.3843137, 0, 1, 1,
0.5555609, 0.8707253, 1.520197, 0.3921569, 0, 1, 1,
0.5588236, 0.4051314, 0.08164711, 0.3960784, 0, 1, 1,
0.5592998, 0.3070796, 1.568825, 0.4039216, 0, 1, 1,
0.5605009, 1.176728, 0.7780334, 0.4117647, 0, 1, 1,
0.564252, -0.3314277, 2.248457, 0.4156863, 0, 1, 1,
0.5766512, 0.1601675, -0.03140929, 0.4235294, 0, 1, 1,
0.5785207, -0.01304932, 2.974322, 0.427451, 0, 1, 1,
0.5785299, 1.078482, 0.80927, 0.4352941, 0, 1, 1,
0.5883919, -0.5192491, 0.9911582, 0.4392157, 0, 1, 1,
0.593983, 1.149984, 1.144201, 0.4470588, 0, 1, 1,
0.6025424, 0.6095405, 3.335338, 0.4509804, 0, 1, 1,
0.6125407, 0.9811386, -0.454984, 0.4588235, 0, 1, 1,
0.6201771, 0.5506862, 0.9144914, 0.4627451, 0, 1, 1,
0.6238281, -1.0568, 3.225905, 0.4705882, 0, 1, 1,
0.6241712, 0.03729222, 1.104109, 0.4745098, 0, 1, 1,
0.6283461, -0.07214134, 0.9377215, 0.4823529, 0, 1, 1,
0.6295368, -0.8924287, 2.401803, 0.4862745, 0, 1, 1,
0.6297122, -0.5088693, 2.72837, 0.4941176, 0, 1, 1,
0.6324228, 0.8225899, 1.777691, 0.5019608, 0, 1, 1,
0.6350942, 0.9409347, 1.824986, 0.5058824, 0, 1, 1,
0.6380619, 0.4212842, 0.7460479, 0.5137255, 0, 1, 1,
0.6397365, -1.409025, 0.3849572, 0.5176471, 0, 1, 1,
0.6442337, 0.6036647, 0.1295931, 0.5254902, 0, 1, 1,
0.649196, -0.4950933, 2.018886, 0.5294118, 0, 1, 1,
0.6504191, -1.906615, 3.539136, 0.5372549, 0, 1, 1,
0.6509198, -1.562395, 1.369628, 0.5411765, 0, 1, 1,
0.6595922, 0.3862431, 0.3938135, 0.5490196, 0, 1, 1,
0.6620569, -0.1611999, 1.05061, 0.5529412, 0, 1, 1,
0.6638952, 0.4109985, 1.1098, 0.5607843, 0, 1, 1,
0.6657544, -0.3842989, 2.177309, 0.5647059, 0, 1, 1,
0.6696199, 1.35766, 1.45406, 0.572549, 0, 1, 1,
0.674301, -0.7552356, 2.644525, 0.5764706, 0, 1, 1,
0.6748382, 0.264234, 1.429367, 0.5843138, 0, 1, 1,
0.6775968, 1.673356, -0.3633885, 0.5882353, 0, 1, 1,
0.6803906, 1.571458, -0.02358812, 0.5960785, 0, 1, 1,
0.682239, 0.6091976, 1.85884, 0.6039216, 0, 1, 1,
0.6865005, -1.927396, 3.340263, 0.6078432, 0, 1, 1,
0.6905864, 1.262515, 1.468931, 0.6156863, 0, 1, 1,
0.7003425, 1.165314, 3.107376, 0.6196079, 0, 1, 1,
0.7022168, 1.866251, 0.01020436, 0.627451, 0, 1, 1,
0.7048988, -1.328699, 2.857044, 0.6313726, 0, 1, 1,
0.7097585, -0.3200959, 3.540853, 0.6392157, 0, 1, 1,
0.7158996, 1.788188, 0.2584766, 0.6431373, 0, 1, 1,
0.7163281, -0.6936095, 3.826905, 0.6509804, 0, 1, 1,
0.7231962, -0.3551123, 2.507059, 0.654902, 0, 1, 1,
0.7237899, -0.4870121, 2.48093, 0.6627451, 0, 1, 1,
0.7238261, 0.1658305, 1.06312, 0.6666667, 0, 1, 1,
0.7257458, -0.4118311, 3.052886, 0.6745098, 0, 1, 1,
0.7282093, -0.09958375, -0.008242249, 0.6784314, 0, 1, 1,
0.7297572, -0.7323014, 1.619654, 0.6862745, 0, 1, 1,
0.7300192, -1.227772, 2.997313, 0.6901961, 0, 1, 1,
0.7339861, 0.09079102, 1.551192, 0.6980392, 0, 1, 1,
0.7415168, 1.94515, -0.3242413, 0.7058824, 0, 1, 1,
0.7446121, -2.18071, 3.052229, 0.7098039, 0, 1, 1,
0.74922, -0.8211743, 2.925307, 0.7176471, 0, 1, 1,
0.7539329, 0.5149508, 0.1704478, 0.7215686, 0, 1, 1,
0.7547205, 0.9480562, 0.06545407, 0.7294118, 0, 1, 1,
0.7556327, 1.364502, 0.2982128, 0.7333333, 0, 1, 1,
0.7558369, 1.044061, -0.5170588, 0.7411765, 0, 1, 1,
0.7586197, 0.534085, 2.098529, 0.7450981, 0, 1, 1,
0.7589953, -0.02208794, 1.302106, 0.7529412, 0, 1, 1,
0.7616791, -1.048456, 4.327518, 0.7568628, 0, 1, 1,
0.7618011, 1.728651, 0.9296631, 0.7647059, 0, 1, 1,
0.765637, 0.08886306, 1.096024, 0.7686275, 0, 1, 1,
0.7663021, 0.6129246, -0.06645517, 0.7764706, 0, 1, 1,
0.7683926, -0.09653375, 3.247166, 0.7803922, 0, 1, 1,
0.7734869, 0.3908258, 0.20488, 0.7882353, 0, 1, 1,
0.774695, 0.7534732, -0.5936744, 0.7921569, 0, 1, 1,
0.7805037, 0.1091647, 2.089128, 0.8, 0, 1, 1,
0.7848374, -0.4466993, 3.436964, 0.8078431, 0, 1, 1,
0.7890944, 0.6633962, 0.3604085, 0.8117647, 0, 1, 1,
0.8009782, 0.3527066, 0.5646012, 0.8196079, 0, 1, 1,
0.8040184, -1.508995, 2.890175, 0.8235294, 0, 1, 1,
0.808968, 0.2962937, 3.516713, 0.8313726, 0, 1, 1,
0.8089902, 0.0577338, 2.674395, 0.8352941, 0, 1, 1,
0.8115821, -0.1431986, 1.654333, 0.8431373, 0, 1, 1,
0.8139285, 1.067083, 2.659634, 0.8470588, 0, 1, 1,
0.815428, 1.435067, 0.5654036, 0.854902, 0, 1, 1,
0.819948, 0.5054163, 0.6038784, 0.8588235, 0, 1, 1,
0.8209434, 0.4434169, 1.045508, 0.8666667, 0, 1, 1,
0.8339235, -1.31611, 1.021661, 0.8705882, 0, 1, 1,
0.8399688, 1.991971, 0.5699493, 0.8784314, 0, 1, 1,
0.8425814, -0.1538346, 0.7927361, 0.8823529, 0, 1, 1,
0.8577783, 0.6687919, 0.3878589, 0.8901961, 0, 1, 1,
0.8609525, 0.7709996, 1.664206, 0.8941177, 0, 1, 1,
0.8729741, -0.7082029, 2.914534, 0.9019608, 0, 1, 1,
0.8801739, 0.5358641, 2.452333, 0.9098039, 0, 1, 1,
0.8826393, -0.09429331, 0.9038245, 0.9137255, 0, 1, 1,
0.8945534, 0.1774755, 0.7163885, 0.9215686, 0, 1, 1,
0.8968959, 2.206975, 0.2020623, 0.9254902, 0, 1, 1,
0.8983619, -0.207027, 0.8082865, 0.9333333, 0, 1, 1,
0.9006948, 0.6553202, 0.5838464, 0.9372549, 0, 1, 1,
0.9007168, 0.1922733, 2.483308, 0.945098, 0, 1, 1,
0.9032786, 0.4503894, 2.119664, 0.9490196, 0, 1, 1,
0.912552, -1.262004, 2.501025, 0.9568627, 0, 1, 1,
0.9134188, -0.3927489, 0.91053, 0.9607843, 0, 1, 1,
0.914439, 0.3368335, 1.831769, 0.9686275, 0, 1, 1,
0.9190843, -0.235971, 0.6736311, 0.972549, 0, 1, 1,
0.9215067, 1.481884, 1.582114, 0.9803922, 0, 1, 1,
0.9233968, -0.3592534, 2.22648, 0.9843137, 0, 1, 1,
0.9241613, -0.3196448, 3.454417, 0.9921569, 0, 1, 1,
0.9254693, -0.09088054, 2.222761, 0.9960784, 0, 1, 1,
0.925658, 0.5619843, 0.09107462, 1, 0, 0.9960784, 1,
0.9292915, 0.2461303, 2.093432, 1, 0, 0.9882353, 1,
0.9378217, 0.6613147, 2.164239, 1, 0, 0.9843137, 1,
0.9435936, 1.859288, 0.848922, 1, 0, 0.9764706, 1,
0.9478709, 0.9283072, 1.672031, 1, 0, 0.972549, 1,
0.9488675, 0.5807088, 1.602646, 1, 0, 0.9647059, 1,
0.9521894, 0.2580366, 1.318418, 1, 0, 0.9607843, 1,
0.9594032, -0.1001796, 2.716345, 1, 0, 0.9529412, 1,
0.9643142, 0.05708773, 3.644994, 1, 0, 0.9490196, 1,
0.9657329, -2.958123, 1.739444, 1, 0, 0.9411765, 1,
0.96785, -0.167817, 2.383649, 1, 0, 0.9372549, 1,
0.9725394, 1.213642, 0.7170845, 1, 0, 0.9294118, 1,
0.9788864, 2.49097, 0.6902335, 1, 0, 0.9254902, 1,
0.9807352, 0.4639743, 1.019069, 1, 0, 0.9176471, 1,
0.9922612, 1.058554, 1.876816, 1, 0, 0.9137255, 1,
0.9972449, 0.0498164, 0.5852932, 1, 0, 0.9058824, 1,
1.00804, 0.6279117, 1.207158, 1, 0, 0.9019608, 1,
1.009935, -1.474144, 5.799832, 1, 0, 0.8941177, 1,
1.012312, -2.490778, 2.422462, 1, 0, 0.8862745, 1,
1.013832, 0.3373171, 0.5580029, 1, 0, 0.8823529, 1,
1.015529, 0.3212014, 2.652977, 1, 0, 0.8745098, 1,
1.020908, 1.472468, 1.703608, 1, 0, 0.8705882, 1,
1.02294, 0.488595, -0.6878781, 1, 0, 0.8627451, 1,
1.023407, -0.6718895, 2.115716, 1, 0, 0.8588235, 1,
1.023692, -1.025276, 4.697995, 1, 0, 0.8509804, 1,
1.024869, -0.3568933, 1.683593, 1, 0, 0.8470588, 1,
1.040028, 1.469002, 0.1724725, 1, 0, 0.8392157, 1,
1.055174, 1.021222, 0.3964673, 1, 0, 0.8352941, 1,
1.062373, 1.26587, 2.190616, 1, 0, 0.827451, 1,
1.066592, 0.1747916, -0.1647881, 1, 0, 0.8235294, 1,
1.073537, 1.350232, 0.6322944, 1, 0, 0.8156863, 1,
1.07992, -2.357072, 2.17527, 1, 0, 0.8117647, 1,
1.086584, 0.5205584, -0.7684973, 1, 0, 0.8039216, 1,
1.095559, 0.5492716, -2.369904, 1, 0, 0.7960784, 1,
1.096498, 0.5573553, 1.049359, 1, 0, 0.7921569, 1,
1.099184, 0.4415344, 1.284131, 1, 0, 0.7843137, 1,
1.104087, -0.9453328, 2.442205, 1, 0, 0.7803922, 1,
1.105666, 2.019851, 0.05708181, 1, 0, 0.772549, 1,
1.106917, 1.187818, 0.3421303, 1, 0, 0.7686275, 1,
1.109036, -2.079792, 3.045609, 1, 0, 0.7607843, 1,
1.114377, 0.2220155, 2.518576, 1, 0, 0.7568628, 1,
1.114485, 0.5402402, 2.293468, 1, 0, 0.7490196, 1,
1.120146, 0.9709593, 0.5198656, 1, 0, 0.7450981, 1,
1.121895, 0.2027915, -0.1271699, 1, 0, 0.7372549, 1,
1.12599, 1.115376, 1.29686, 1, 0, 0.7333333, 1,
1.133954, -0.99099, 1.171262, 1, 0, 0.7254902, 1,
1.133987, -0.990137, 2.509083, 1, 0, 0.7215686, 1,
1.134169, 0.7404513, 1.82867, 1, 0, 0.7137255, 1,
1.134891, 0.4272213, 0.2516383, 1, 0, 0.7098039, 1,
1.135873, 0.1530835, 0.07900416, 1, 0, 0.7019608, 1,
1.139399, -1.186628, 3.230458, 1, 0, 0.6941177, 1,
1.140307, -1.470893, 2.561144, 1, 0, 0.6901961, 1,
1.144915, 1.049549, -0.543249, 1, 0, 0.682353, 1,
1.145267, -0.641185, 1.49707, 1, 0, 0.6784314, 1,
1.150631, -0.6282315, 1.882065, 1, 0, 0.6705883, 1,
1.161521, -0.9828644, 2.097789, 1, 0, 0.6666667, 1,
1.166629, -1.518643, 2.246535, 1, 0, 0.6588235, 1,
1.170935, -1.05274, 3.622649, 1, 0, 0.654902, 1,
1.183072, -0.3900997, 0.5957009, 1, 0, 0.6470588, 1,
1.186991, 0.8477579, 1.468347, 1, 0, 0.6431373, 1,
1.188571, -0.6457348, 2.384163, 1, 0, 0.6352941, 1,
1.192462, -0.7358405, 2.591291, 1, 0, 0.6313726, 1,
1.196861, -0.3915418, 1.210575, 1, 0, 0.6235294, 1,
1.201288, -1.721308, 3.408624, 1, 0, 0.6196079, 1,
1.203481, -1.923265, 2.667245, 1, 0, 0.6117647, 1,
1.203513, -0.4950706, 2.392595, 1, 0, 0.6078432, 1,
1.205657, -0.7833916, 1.789734, 1, 0, 0.6, 1,
1.223076, 1.314894, 0.3168466, 1, 0, 0.5921569, 1,
1.228149, 0.6402259, 1.091564, 1, 0, 0.5882353, 1,
1.230758, 0.2869786, -0.04685939, 1, 0, 0.5803922, 1,
1.232933, -0.2624568, 2.954381, 1, 0, 0.5764706, 1,
1.238077, -1.110926, -0.06368974, 1, 0, 0.5686275, 1,
1.243351, 0.8116149, -0.5875722, 1, 0, 0.5647059, 1,
1.251725, 0.5522724, 2.407254, 1, 0, 0.5568628, 1,
1.252083, 0.2561572, 1.19271, 1, 0, 0.5529412, 1,
1.266866, -0.09507245, 2.979064, 1, 0, 0.5450981, 1,
1.268847, -0.494314, 2.198249, 1, 0, 0.5411765, 1,
1.269796, -0.525704, 1.019778, 1, 0, 0.5333334, 1,
1.270059, -0.2187774, 1.910122, 1, 0, 0.5294118, 1,
1.275735, -0.7381571, 2.671089, 1, 0, 0.5215687, 1,
1.280135, 0.8775102, 0.05818363, 1, 0, 0.5176471, 1,
1.290769, 0.1477582, 0.9082057, 1, 0, 0.509804, 1,
1.2941, 0.6251454, 0.6595703, 1, 0, 0.5058824, 1,
1.304098, -1.01922, -0.1206741, 1, 0, 0.4980392, 1,
1.306604, -0.8816666, 1.377633, 1, 0, 0.4901961, 1,
1.308269, -0.7759775, 1.299846, 1, 0, 0.4862745, 1,
1.311946, 0.5137692, 0.5647519, 1, 0, 0.4784314, 1,
1.339763, 1.584998, 0.05535616, 1, 0, 0.4745098, 1,
1.351971, -1.704153, 3.05878, 1, 0, 0.4666667, 1,
1.394543, 0.6302658, 0.4145611, 1, 0, 0.4627451, 1,
1.395362, -0.004689114, 1.24575, 1, 0, 0.454902, 1,
1.398899, -0.798979, 1.184315, 1, 0, 0.4509804, 1,
1.409826, -1.486975, 2.889005, 1, 0, 0.4431373, 1,
1.432928, -2.651201, 1.976358, 1, 0, 0.4392157, 1,
1.440188, 3.487386, -1.15273, 1, 0, 0.4313726, 1,
1.442792, -0.1717665, 1.711694, 1, 0, 0.427451, 1,
1.444399, -0.005135402, 1.453361, 1, 0, 0.4196078, 1,
1.451198, 0.4497735, 2.267575, 1, 0, 0.4156863, 1,
1.451777, 0.6840842, 0.4358995, 1, 0, 0.4078431, 1,
1.458565, -0.3707927, 0.5384401, 1, 0, 0.4039216, 1,
1.468052, -1.376569, 4.392619, 1, 0, 0.3960784, 1,
1.472371, 0.5771422, 0.839316, 1, 0, 0.3882353, 1,
1.479038, -1.007175, 1.592228, 1, 0, 0.3843137, 1,
1.480036, -1.094217, 1.917312, 1, 0, 0.3764706, 1,
1.482222, 0.1933699, 0.331623, 1, 0, 0.372549, 1,
1.48581, 0.100255, 3.018579, 1, 0, 0.3647059, 1,
1.49012, 0.3506112, 1.176642, 1, 0, 0.3607843, 1,
1.494506, 0.9400661, -0.2901377, 1, 0, 0.3529412, 1,
1.496688, 0.1068436, 2.512522, 1, 0, 0.3490196, 1,
1.50209, -0.9204612, 0.5898614, 1, 0, 0.3411765, 1,
1.553645, -1.035722, 1.642346, 1, 0, 0.3372549, 1,
1.55446, -0.9372426, 1.398985, 1, 0, 0.3294118, 1,
1.556864, -0.3567157, 3.119995, 1, 0, 0.3254902, 1,
1.557056, 0.6694244, 3.184705, 1, 0, 0.3176471, 1,
1.559765, 1.515704, 0.8149643, 1, 0, 0.3137255, 1,
1.566564, 1.669025, -0.3023776, 1, 0, 0.3058824, 1,
1.575553, -2.711394, 1.52396, 1, 0, 0.2980392, 1,
1.576906, -0.1522586, 2.562182, 1, 0, 0.2941177, 1,
1.577047, -1.253634, 3.371496, 1, 0, 0.2862745, 1,
1.580811, 0.4891456, 2.106539, 1, 0, 0.282353, 1,
1.601972, 1.405069, 0.4211393, 1, 0, 0.2745098, 1,
1.61113, 2.250315, 1.390662, 1, 0, 0.2705882, 1,
1.611819, 0.6649762, 1.341865, 1, 0, 0.2627451, 1,
1.657122, -0.2520339, 1.064287, 1, 0, 0.2588235, 1,
1.691589, -0.8499212, 0.8340251, 1, 0, 0.2509804, 1,
1.69519, -0.1914611, 0.5024028, 1, 0, 0.2470588, 1,
1.72623, 1.052002, 0.05369931, 1, 0, 0.2392157, 1,
1.729229, -0.5580774, 2.467752, 1, 0, 0.2352941, 1,
1.751579, -0.2321784, 2.695536, 1, 0, 0.227451, 1,
1.754739, 0.172558, 2.746762, 1, 0, 0.2235294, 1,
1.778925, 1.016704, 1.477492, 1, 0, 0.2156863, 1,
1.798443, 0.487748, 1.720732, 1, 0, 0.2117647, 1,
1.807249, 2.022055, 0.5685334, 1, 0, 0.2039216, 1,
1.816513, -1.568998, 3.583714, 1, 0, 0.1960784, 1,
1.820573, -0.8647165, 1.046368, 1, 0, 0.1921569, 1,
1.821408, 0.5479131, -0.5121016, 1, 0, 0.1843137, 1,
1.849099, 0.6574996, 0.215004, 1, 0, 0.1803922, 1,
1.86269, -0.3645874, 1.497254, 1, 0, 0.172549, 1,
1.875317, -0.1913736, 3.168395, 1, 0, 0.1686275, 1,
1.875641, -1.360988, 3.184792, 1, 0, 0.1607843, 1,
1.906285, 0.8593704, 0.7919307, 1, 0, 0.1568628, 1,
1.909572, -0.6404029, 0.5939753, 1, 0, 0.1490196, 1,
1.916448, -1.087143, 0.6841345, 1, 0, 0.145098, 1,
1.922123, -0.4735851, 2.339083, 1, 0, 0.1372549, 1,
1.926158, 0.413952, 0.9065096, 1, 0, 0.1333333, 1,
1.969925, -0.2954626, 2.092307, 1, 0, 0.1254902, 1,
1.972836, -1.459795, 1.164617, 1, 0, 0.1215686, 1,
1.987751, -0.5364901, 1.83985, 1, 0, 0.1137255, 1,
2.007924, -0.5788453, 2.616486, 1, 0, 0.1098039, 1,
2.010428, -1.304016, 3.998295, 1, 0, 0.1019608, 1,
2.048075, 1.157185, -0.07968751, 1, 0, 0.09411765, 1,
2.062756, -0.7142008, 1.117085, 1, 0, 0.09019608, 1,
2.126688, -0.5419047, 4.392858, 1, 0, 0.08235294, 1,
2.169875, 1.966618, 1.886997, 1, 0, 0.07843138, 1,
2.192028, 0.3689344, 2.474844, 1, 0, 0.07058824, 1,
2.222354, -0.4539194, 1.633958, 1, 0, 0.06666667, 1,
2.282719, 0.6803537, 1.395792, 1, 0, 0.05882353, 1,
2.302781, -0.7544028, 3.090492, 1, 0, 0.05490196, 1,
2.313137, -0.1426042, 2.010833, 1, 0, 0.04705882, 1,
2.351238, -1.80601, 2.487409, 1, 0, 0.04313726, 1,
2.387622, -0.5425117, 1.612409, 1, 0, 0.03529412, 1,
2.416764, -0.5512141, 1.950562, 1, 0, 0.03137255, 1,
2.510356, -3.091254, 3.529116, 1, 0, 0.02352941, 1,
2.630932, 0.463808, 0.481441, 1, 0, 0.01960784, 1,
3.150196, -0.1123229, 0.8395388, 1, 0, 0.01176471, 1,
3.340292, 0.3949174, 1.422417, 1, 0, 0.007843138, 1
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
0.01482821, -5.463259, -7.028956, 0, -0.5, 0.5, 0.5,
0.01482821, -5.463259, -7.028956, 1, -0.5, 0.5, 0.5,
0.01482821, -5.463259, -7.028956, 1, 1.5, 0.5, 0.5,
0.01482821, -5.463259, -7.028956, 0, 1.5, 0.5, 0.5
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
-4.437968, -0.339311, -7.028956, 0, -0.5, 0.5, 0.5,
-4.437968, -0.339311, -7.028956, 1, -0.5, 0.5, 0.5,
-4.437968, -0.339311, -7.028956, 1, 1.5, 0.5, 0.5,
-4.437968, -0.339311, -7.028956, 0, 1.5, 0.5, 0.5
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
-4.437968, -5.463259, 0.3151002, 0, -0.5, 0.5, 0.5,
-4.437968, -5.463259, 0.3151002, 1, -0.5, 0.5, 0.5,
-4.437968, -5.463259, 0.3151002, 1, 1.5, 0.5, 0.5,
-4.437968, -5.463259, 0.3151002, 0, 1.5, 0.5, 0.5
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
-3, -4.280809, -5.334174,
3, -4.280809, -5.334174,
-3, -4.280809, -5.334174,
-3, -4.477884, -5.616638,
-2, -4.280809, -5.334174,
-2, -4.477884, -5.616638,
-1, -4.280809, -5.334174,
-1, -4.477884, -5.616638,
0, -4.280809, -5.334174,
0, -4.477884, -5.616638,
1, -4.280809, -5.334174,
1, -4.477884, -5.616638,
2, -4.280809, -5.334174,
2, -4.477884, -5.616638,
3, -4.280809, -5.334174,
3, -4.477884, -5.616638
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
-3, -4.872034, -6.181565, 0, -0.5, 0.5, 0.5,
-3, -4.872034, -6.181565, 1, -0.5, 0.5, 0.5,
-3, -4.872034, -6.181565, 1, 1.5, 0.5, 0.5,
-3, -4.872034, -6.181565, 0, 1.5, 0.5, 0.5,
-2, -4.872034, -6.181565, 0, -0.5, 0.5, 0.5,
-2, -4.872034, -6.181565, 1, -0.5, 0.5, 0.5,
-2, -4.872034, -6.181565, 1, 1.5, 0.5, 0.5,
-2, -4.872034, -6.181565, 0, 1.5, 0.5, 0.5,
-1, -4.872034, -6.181565, 0, -0.5, 0.5, 0.5,
-1, -4.872034, -6.181565, 1, -0.5, 0.5, 0.5,
-1, -4.872034, -6.181565, 1, 1.5, 0.5, 0.5,
-1, -4.872034, -6.181565, 0, 1.5, 0.5, 0.5,
0, -4.872034, -6.181565, 0, -0.5, 0.5, 0.5,
0, -4.872034, -6.181565, 1, -0.5, 0.5, 0.5,
0, -4.872034, -6.181565, 1, 1.5, 0.5, 0.5,
0, -4.872034, -6.181565, 0, 1.5, 0.5, 0.5,
1, -4.872034, -6.181565, 0, -0.5, 0.5, 0.5,
1, -4.872034, -6.181565, 1, -0.5, 0.5, 0.5,
1, -4.872034, -6.181565, 1, 1.5, 0.5, 0.5,
1, -4.872034, -6.181565, 0, 1.5, 0.5, 0.5,
2, -4.872034, -6.181565, 0, -0.5, 0.5, 0.5,
2, -4.872034, -6.181565, 1, -0.5, 0.5, 0.5,
2, -4.872034, -6.181565, 1, 1.5, 0.5, 0.5,
2, -4.872034, -6.181565, 0, 1.5, 0.5, 0.5,
3, -4.872034, -6.181565, 0, -0.5, 0.5, 0.5,
3, -4.872034, -6.181565, 1, -0.5, 0.5, 0.5,
3, -4.872034, -6.181565, 1, 1.5, 0.5, 0.5,
3, -4.872034, -6.181565, 0, 1.5, 0.5, 0.5
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
-3.4104, -4, -5.334174,
-3.4104, 2, -5.334174,
-3.4104, -4, -5.334174,
-3.581661, -4, -5.616638,
-3.4104, -2, -5.334174,
-3.581661, -2, -5.616638,
-3.4104, 0, -5.334174,
-3.581661, 0, -5.616638,
-3.4104, 2, -5.334174,
-3.581661, 2, -5.616638
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
"-4",
"-2",
"0",
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
-3.924184, -4, -6.181565, 0, -0.5, 0.5, 0.5,
-3.924184, -4, -6.181565, 1, -0.5, 0.5, 0.5,
-3.924184, -4, -6.181565, 1, 1.5, 0.5, 0.5,
-3.924184, -4, -6.181565, 0, 1.5, 0.5, 0.5,
-3.924184, -2, -6.181565, 0, -0.5, 0.5, 0.5,
-3.924184, -2, -6.181565, 1, -0.5, 0.5, 0.5,
-3.924184, -2, -6.181565, 1, 1.5, 0.5, 0.5,
-3.924184, -2, -6.181565, 0, 1.5, 0.5, 0.5,
-3.924184, 0, -6.181565, 0, -0.5, 0.5, 0.5,
-3.924184, 0, -6.181565, 1, -0.5, 0.5, 0.5,
-3.924184, 0, -6.181565, 1, 1.5, 0.5, 0.5,
-3.924184, 0, -6.181565, 0, 1.5, 0.5, 0.5,
-3.924184, 2, -6.181565, 0, -0.5, 0.5, 0.5,
-3.924184, 2, -6.181565, 1, -0.5, 0.5, 0.5,
-3.924184, 2, -6.181565, 1, 1.5, 0.5, 0.5,
-3.924184, 2, -6.181565, 0, 1.5, 0.5, 0.5
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
-3.4104, -4.280809, -4,
-3.4104, -4.280809, 4,
-3.4104, -4.280809, -4,
-3.581661, -4.477884, -4,
-3.4104, -4.280809, -2,
-3.581661, -4.477884, -2,
-3.4104, -4.280809, 0,
-3.581661, -4.477884, 0,
-3.4104, -4.280809, 2,
-3.581661, -4.477884, 2,
-3.4104, -4.280809, 4,
-3.581661, -4.477884, 4
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
-3.924184, -4.872034, -4, 0, -0.5, 0.5, 0.5,
-3.924184, -4.872034, -4, 1, -0.5, 0.5, 0.5,
-3.924184, -4.872034, -4, 1, 1.5, 0.5, 0.5,
-3.924184, -4.872034, -4, 0, 1.5, 0.5, 0.5,
-3.924184, -4.872034, -2, 0, -0.5, 0.5, 0.5,
-3.924184, -4.872034, -2, 1, -0.5, 0.5, 0.5,
-3.924184, -4.872034, -2, 1, 1.5, 0.5, 0.5,
-3.924184, -4.872034, -2, 0, 1.5, 0.5, 0.5,
-3.924184, -4.872034, 0, 0, -0.5, 0.5, 0.5,
-3.924184, -4.872034, 0, 1, -0.5, 0.5, 0.5,
-3.924184, -4.872034, 0, 1, 1.5, 0.5, 0.5,
-3.924184, -4.872034, 0, 0, 1.5, 0.5, 0.5,
-3.924184, -4.872034, 2, 0, -0.5, 0.5, 0.5,
-3.924184, -4.872034, 2, 1, -0.5, 0.5, 0.5,
-3.924184, -4.872034, 2, 1, 1.5, 0.5, 0.5,
-3.924184, -4.872034, 2, 0, 1.5, 0.5, 0.5,
-3.924184, -4.872034, 4, 0, -0.5, 0.5, 0.5,
-3.924184, -4.872034, 4, 1, -0.5, 0.5, 0.5,
-3.924184, -4.872034, 4, 1, 1.5, 0.5, 0.5,
-3.924184, -4.872034, 4, 0, 1.5, 0.5, 0.5
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
-3.4104, -4.280809, -5.334174,
-3.4104, 3.602187, -5.334174,
-3.4104, -4.280809, 5.964375,
-3.4104, 3.602187, 5.964375,
-3.4104, -4.280809, -5.334174,
-3.4104, -4.280809, 5.964375,
-3.4104, 3.602187, -5.334174,
-3.4104, 3.602187, 5.964375,
-3.4104, -4.280809, -5.334174,
3.440056, -4.280809, -5.334174,
-3.4104, -4.280809, 5.964375,
3.440056, -4.280809, 5.964375,
-3.4104, 3.602187, -5.334174,
3.440056, 3.602187, -5.334174,
-3.4104, 3.602187, 5.964375,
3.440056, 3.602187, 5.964375,
3.440056, -4.280809, -5.334174,
3.440056, 3.602187, -5.334174,
3.440056, -4.280809, 5.964375,
3.440056, 3.602187, 5.964375,
3.440056, -4.280809, -5.334174,
3.440056, -4.280809, 5.964375,
3.440056, 3.602187, -5.334174,
3.440056, 3.602187, 5.964375
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
var radius = 8.215801;
var distance = 36.55302;
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
mvMatrix.translate( -0.01482821, 0.339311, -0.3151002 );
mvMatrix.scale( 1.296714, 1.126866, 0.7862147 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.55302);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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
isocrotonate<-read.table("isocrotonate.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-isocrotonate$V2
```

```
## Error in eval(expr, envir, enclos): object 'isocrotonate' not found
```

```r
y<-isocrotonate$V3
```

```
## Error in eval(expr, envir, enclos): object 'isocrotonate' not found
```

```r
z<-isocrotonate$V4
```

```
## Error in eval(expr, envir, enclos): object 'isocrotonate' not found
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
-3.310636, 0.7464876, -1.00696, 0, 0, 1, 1, 1,
-3.207989, -0.07248896, 0.3727705, 1, 0, 0, 1, 1,
-2.970397, 0.5656406, -0.5268054, 1, 0, 0, 1, 1,
-2.934422, -1.309535, -2.099017, 1, 0, 0, 1, 1,
-2.867165, -0.02775141, -2.851731, 1, 0, 0, 1, 1,
-2.78202, -1.424055, -1.852383, 1, 0, 0, 1, 1,
-2.670791, -0.4894515, -0.6078179, 0, 0, 0, 1, 1,
-2.590239, -1.372994, -3.07782, 0, 0, 0, 1, 1,
-2.540269, -1.202073, -1.888886, 0, 0, 0, 1, 1,
-2.374859, -1.184528, -3.109085, 0, 0, 0, 1, 1,
-2.362197, -0.5386668, -2.367621, 0, 0, 0, 1, 1,
-2.34481, 0.1667008, -1.628907, 0, 0, 0, 1, 1,
-2.33073, -1.329731, -2.567698, 0, 0, 0, 1, 1,
-2.270456, 3.129613, -0.9850645, 1, 1, 1, 1, 1,
-2.258635, 0.9718536, -1.050946, 1, 1, 1, 1, 1,
-2.253883, -1.823341, -3.67619, 1, 1, 1, 1, 1,
-2.204954, -1.202142, -2.35465, 1, 1, 1, 1, 1,
-2.19315, -1.962674, -1.664093, 1, 1, 1, 1, 1,
-2.182725, -1.204542, -0.1400401, 1, 1, 1, 1, 1,
-2.181789, 0.4528744, -1.420826, 1, 1, 1, 1, 1,
-2.170618, 0.8453466, -0.3905375, 1, 1, 1, 1, 1,
-2.163981, 0.8471137, -0.07356799, 1, 1, 1, 1, 1,
-2.159707, -0.7815573, -2.879752, 1, 1, 1, 1, 1,
-2.142993, 2.007854, -0.5902539, 1, 1, 1, 1, 1,
-2.121327, -0.9396871, -2.874052, 1, 1, 1, 1, 1,
-2.106969, -0.1084177, -1.350493, 1, 1, 1, 1, 1,
-2.104541, -0.8349229, -2.525555, 1, 1, 1, 1, 1,
-2.102076, 0.07006872, -0.3448899, 1, 1, 1, 1, 1,
-2.069983, 0.1712308, -3.046486, 0, 0, 1, 1, 1,
-2.036777, -0.5730874, -2.515594, 1, 0, 0, 1, 1,
-2.004405, -0.0989794, -3.611864, 1, 0, 0, 1, 1,
-2.002792, 2.394278, 2.006285, 1, 0, 0, 1, 1,
-1.971802, -1.084409, -1.568837, 1, 0, 0, 1, 1,
-1.969302, 0.8130359, -2.104625, 1, 0, 0, 1, 1,
-1.950731, -0.731384, -2.705078, 0, 0, 0, 1, 1,
-1.936848, 0.04169002, -1.268043, 0, 0, 0, 1, 1,
-1.920033, -0.7868371, -0.9414245, 0, 0, 0, 1, 1,
-1.904553, 0.2382687, -2.418815, 0, 0, 0, 1, 1,
-1.874278, 0.7611457, -2.434124, 0, 0, 0, 1, 1,
-1.872604, 1.940636, 0.9929566, 0, 0, 0, 1, 1,
-1.864686, 0.4172685, 0.02339636, 0, 0, 0, 1, 1,
-1.856109, 0.6349188, -1.648333, 1, 1, 1, 1, 1,
-1.851978, 0.2641666, -1.158352, 1, 1, 1, 1, 1,
-1.839448, -0.6026587, -1.732296, 1, 1, 1, 1, 1,
-1.813171, -0.5030017, -3.138134, 1, 1, 1, 1, 1,
-1.788928, -0.3238746, -3.489144, 1, 1, 1, 1, 1,
-1.787531, 0.1339161, -3.713971, 1, 1, 1, 1, 1,
-1.783234, 0.1625909, -3.68534, 1, 1, 1, 1, 1,
-1.776936, 0.8945485, -1.924595, 1, 1, 1, 1, 1,
-1.775092, 1.35687, -1.333158, 1, 1, 1, 1, 1,
-1.769139, -0.4302786, -3.299811, 1, 1, 1, 1, 1,
-1.760735, -1.272904, -2.366904, 1, 1, 1, 1, 1,
-1.73836, 0.1128474, -1.993272, 1, 1, 1, 1, 1,
-1.705164, 0.9303185, -0.6646965, 1, 1, 1, 1, 1,
-1.689617, 0.8397012, -1.517004, 1, 1, 1, 1, 1,
-1.676323, -0.8195237, -2.206595, 1, 1, 1, 1, 1,
-1.669143, 0.7006215, -0.4029709, 0, 0, 1, 1, 1,
-1.664051, -0.9651786, -2.882873, 1, 0, 0, 1, 1,
-1.658893, -1.53259, -2.744571, 1, 0, 0, 1, 1,
-1.636312, -0.9389749, -2.508385, 1, 0, 0, 1, 1,
-1.635305, 0.1744191, -4.127859, 1, 0, 0, 1, 1,
-1.623178, -0.7031653, -2.482504, 1, 0, 0, 1, 1,
-1.597705, -0.3829413, -1.375325, 0, 0, 0, 1, 1,
-1.596328, 0.6580006, -0.6180451, 0, 0, 0, 1, 1,
-1.593025, -1.073175, -1.459131, 0, 0, 0, 1, 1,
-1.590435, -0.002565464, -2.833909, 0, 0, 0, 1, 1,
-1.586241, -0.4008268, -4.998374, 0, 0, 0, 1, 1,
-1.584462, -0.1453216, -2.422236, 0, 0, 0, 1, 1,
-1.567157, -1.645947, -1.292536, 0, 0, 0, 1, 1,
-1.534821, -0.1647355, -2.427168, 1, 1, 1, 1, 1,
-1.529015, -0.5003353, -3.087962, 1, 1, 1, 1, 1,
-1.527416, 0.1395246, -0.6848892, 1, 1, 1, 1, 1,
-1.522183, -2.437479, -3.216328, 1, 1, 1, 1, 1,
-1.521354, -2.426191, -3.264323, 1, 1, 1, 1, 1,
-1.519156, 1.205015, -1.841183, 1, 1, 1, 1, 1,
-1.518039, -0.2174131, -2.071641, 1, 1, 1, 1, 1,
-1.510818, -0.1764636, 0.3493344, 1, 1, 1, 1, 1,
-1.507262, -0.3363148, -2.122305, 1, 1, 1, 1, 1,
-1.474913, -0.1761942, -0.2898067, 1, 1, 1, 1, 1,
-1.474332, -1.545268, -0.8925296, 1, 1, 1, 1, 1,
-1.468835, -0.07503913, -2.927192, 1, 1, 1, 1, 1,
-1.468429, -1.626032, -3.090816, 1, 1, 1, 1, 1,
-1.468093, 0.7095282, -1.693513, 1, 1, 1, 1, 1,
-1.467818, 0.3866866, 0.606683, 1, 1, 1, 1, 1,
-1.460467, -0.7181252, -2.131019, 0, 0, 1, 1, 1,
-1.456842, 1.445779, -2.224496, 1, 0, 0, 1, 1,
-1.455812, -1.171622, -3.463528, 1, 0, 0, 1, 1,
-1.44775, 1.517562, -1.955478, 1, 0, 0, 1, 1,
-1.445651, 0.04716437, -1.640628, 1, 0, 0, 1, 1,
-1.444345, -0.1128041, -1.176976, 1, 0, 0, 1, 1,
-1.440851, 2.399217, 0.4727548, 0, 0, 0, 1, 1,
-1.440356, 0.15147, -1.64596, 0, 0, 0, 1, 1,
-1.437567, -0.7279471, -2.8335, 0, 0, 0, 1, 1,
-1.43733, 1.550545, -2.351354, 0, 0, 0, 1, 1,
-1.417528, 0.02522044, -2.50858, 0, 0, 0, 1, 1,
-1.410698, 0.1139089, -1.712521, 0, 0, 0, 1, 1,
-1.404652, -1.513573, -2.827402, 0, 0, 0, 1, 1,
-1.385637, -0.6900065, -1.371746, 1, 1, 1, 1, 1,
-1.384738, -0.2324726, -0.7709388, 1, 1, 1, 1, 1,
-1.375828, 0.8621628, -0.9617799, 1, 1, 1, 1, 1,
-1.354513, -1.320011, -1.498051, 1, 1, 1, 1, 1,
-1.352116, 1.554851, -0.6101397, 1, 1, 1, 1, 1,
-1.349773, 0.7602971, -0.9737172, 1, 1, 1, 1, 1,
-1.342426, -0.3043735, -4.069761, 1, 1, 1, 1, 1,
-1.34156, 0.08260432, -1.244758, 1, 1, 1, 1, 1,
-1.330461, 0.2322441, -3.959941, 1, 1, 1, 1, 1,
-1.307528, 0.2958088, -0.4564154, 1, 1, 1, 1, 1,
-1.305494, -0.6008072, -2.510638, 1, 1, 1, 1, 1,
-1.29647, -0.7724073, -2.464491, 1, 1, 1, 1, 1,
-1.294868, 1.203696, -0.377073, 1, 1, 1, 1, 1,
-1.285229, -0.777331, -1.261159, 1, 1, 1, 1, 1,
-1.279893, 0.1856601, -1.289546, 1, 1, 1, 1, 1,
-1.278689, 0.8893659, -0.3504928, 0, 0, 1, 1, 1,
-1.278533, -0.4250968, -2.638028, 1, 0, 0, 1, 1,
-1.277292, -1.42291, 0.02021129, 1, 0, 0, 1, 1,
-1.26822, -0.1149814, -0.7176395, 1, 0, 0, 1, 1,
-1.261826, -1.448987, -2.227169, 1, 0, 0, 1, 1,
-1.244336, -0.620856, -0.8289635, 1, 0, 0, 1, 1,
-1.238495, -0.6355844, -3.277851, 0, 0, 0, 1, 1,
-1.232968, -1.7411, -2.25789, 0, 0, 0, 1, 1,
-1.225769, 1.136138, -1.588723, 0, 0, 0, 1, 1,
-1.222521, 1.081841, 1.320775, 0, 0, 0, 1, 1,
-1.220498, 1.126521, -2.799932, 0, 0, 0, 1, 1,
-1.220017, -0.2601868, -3.679029, 0, 0, 0, 1, 1,
-1.216454, -0.7814533, -2.345224, 0, 0, 0, 1, 1,
-1.202897, -0.76501, -1.464486, 1, 1, 1, 1, 1,
-1.200014, 1.370955, -2.417193, 1, 1, 1, 1, 1,
-1.195889, -0.3368107, -2.651171, 1, 1, 1, 1, 1,
-1.195469, -0.2030292, -1.792908, 1, 1, 1, 1, 1,
-1.189951, 0.9447039, -2.110961, 1, 1, 1, 1, 1,
-1.188365, -0.006035997, -1.834763, 1, 1, 1, 1, 1,
-1.172727, -0.5965113, -3.848471, 1, 1, 1, 1, 1,
-1.171239, -0.4346068, -2.883098, 1, 1, 1, 1, 1,
-1.158061, -1.050116, -2.203192, 1, 1, 1, 1, 1,
-1.156589, -1.670109, -2.933553, 1, 1, 1, 1, 1,
-1.152128, 0.7677078, -0.9913458, 1, 1, 1, 1, 1,
-1.148249, 0.01742663, -1.396959, 1, 1, 1, 1, 1,
-1.147112, -0.3040372, -2.857902, 1, 1, 1, 1, 1,
-1.145773, -1.234507, -0.8467329, 1, 1, 1, 1, 1,
-1.141039, 1.226272, -2.971968, 1, 1, 1, 1, 1,
-1.130344, 1.833694, 0.9298586, 0, 0, 1, 1, 1,
-1.129283, 1.870906, -3.095734, 1, 0, 0, 1, 1,
-1.125294, -0.5682505, -1.96997, 1, 0, 0, 1, 1,
-1.124312, 2.184678, -0.2531265, 1, 0, 0, 1, 1,
-1.117399, -0.5435925, -3.139052, 1, 0, 0, 1, 1,
-1.115205, 0.5268074, -0.4010557, 1, 0, 0, 1, 1,
-1.105732, -1.667918, -2.600281, 0, 0, 0, 1, 1,
-1.104765, -1.763777, -2.985722, 0, 0, 0, 1, 1,
-1.100945, 0.7685774, -2.430553, 0, 0, 0, 1, 1,
-1.099506, -1.031452, -1.69585, 0, 0, 0, 1, 1,
-1.094155, -1.214858, -2.255944, 0, 0, 0, 1, 1,
-1.087316, 0.3655962, -2.146554, 0, 0, 0, 1, 1,
-1.085145, 2.023455, 0.686209, 0, 0, 0, 1, 1,
-1.072393, 0.4429569, -1.542175, 1, 1, 1, 1, 1,
-1.064724, -1.430736, -2.008248, 1, 1, 1, 1, 1,
-1.057573, 1.111125, -3.042269, 1, 1, 1, 1, 1,
-1.052298, -0.1801759, -1.560547, 1, 1, 1, 1, 1,
-1.051029, 0.2602148, -1.291656, 1, 1, 1, 1, 1,
-1.049523, -0.03716087, -1.717352, 1, 1, 1, 1, 1,
-1.046098, 1.551325, -1.292904, 1, 1, 1, 1, 1,
-1.045846, -0.7276452, -3.185457, 1, 1, 1, 1, 1,
-1.04544, -0.7650341, -1.987903, 1, 1, 1, 1, 1,
-1.038735, 0.8580977, -0.5223941, 1, 1, 1, 1, 1,
-1.038238, 0.9554412, -2.800169, 1, 1, 1, 1, 1,
-1.037344, 1.045407, -1.38158, 1, 1, 1, 1, 1,
-1.037002, 0.3161562, -1.654651, 1, 1, 1, 1, 1,
-1.023714, 0.7022257, 1.197846, 1, 1, 1, 1, 1,
-1.019458, 0.5252969, -0.3763417, 1, 1, 1, 1, 1,
-1.015187, 0.08408587, -1.546209, 0, 0, 1, 1, 1,
-1.012264, 0.8926615, -1.978468, 1, 0, 0, 1, 1,
-1.009685, -1.276357, -1.976125, 1, 0, 0, 1, 1,
-1.005559, 1.245731, 1.798286, 1, 0, 0, 1, 1,
-1.002026, -1.033929, -1.83366, 1, 0, 0, 1, 1,
-1.000369, -1.023685, -1.607288, 1, 0, 0, 1, 1,
-0.9931209, 0.4026986, -1.733655, 0, 0, 0, 1, 1,
-0.9897445, -0.2574167, -0.891108, 0, 0, 0, 1, 1,
-0.9813281, 0.6617554, -0.7148196, 0, 0, 0, 1, 1,
-0.9791621, -0.01097821, -1.754122, 0, 0, 0, 1, 1,
-0.9714035, 0.9222211, -1.40349, 0, 0, 0, 1, 1,
-0.9669003, 0.4092831, -2.064043, 0, 0, 0, 1, 1,
-0.9542783, -0.7636917, -1.832378, 0, 0, 0, 1, 1,
-0.9352089, -0.1180795, -0.9402049, 1, 1, 1, 1, 1,
-0.9348884, -0.8898814, -1.888523, 1, 1, 1, 1, 1,
-0.9308544, 2.210408, -2.903413, 1, 1, 1, 1, 1,
-0.9241061, 0.2587693, -0.2645355, 1, 1, 1, 1, 1,
-0.9179735, -0.1144221, -0.2480773, 1, 1, 1, 1, 1,
-0.9176428, 0.1054035, -1.246007, 1, 1, 1, 1, 1,
-0.917583, 1.693917, 0.8341156, 1, 1, 1, 1, 1,
-0.9142084, -0.2001005, -0.9641698, 1, 1, 1, 1, 1,
-0.9123716, -0.5568672, -0.6034476, 1, 1, 1, 1, 1,
-0.9108381, 1.228893, -0.24435, 1, 1, 1, 1, 1,
-0.9077857, 1.527956, -0.4229123, 1, 1, 1, 1, 1,
-0.9043545, -0.999615, -1.724406, 1, 1, 1, 1, 1,
-0.9041302, 0.1137151, -2.193892, 1, 1, 1, 1, 1,
-0.8939739, 0.1106892, -0.5621517, 1, 1, 1, 1, 1,
-0.893428, -1.986111, -2.651769, 1, 1, 1, 1, 1,
-0.89327, -0.1913311, -2.412958, 0, 0, 1, 1, 1,
-0.8797408, -1.316123, -2.388028, 1, 0, 0, 1, 1,
-0.8791032, 0.7578911, -2.352742, 1, 0, 0, 1, 1,
-0.874217, 0.4370279, -0.163949, 1, 0, 0, 1, 1,
-0.8722103, -0.06410763, -2.417561, 1, 0, 0, 1, 1,
-0.8659366, -0.6943758, -1.528517, 1, 0, 0, 1, 1,
-0.8640816, 0.2656261, -3.080509, 0, 0, 0, 1, 1,
-0.8605098, 0.303818, -1.581548, 0, 0, 0, 1, 1,
-0.8577682, 1.044006, 0.06720802, 0, 0, 0, 1, 1,
-0.8547101, 0.2374008, -1.761697, 0, 0, 0, 1, 1,
-0.8492048, -0.947817, -2.624552, 0, 0, 0, 1, 1,
-0.8482709, -0.2078173, -4.527208, 0, 0, 0, 1, 1,
-0.8478357, -0.1529439, -2.545922, 0, 0, 0, 1, 1,
-0.8436171, 0.588401, -1.34037, 1, 1, 1, 1, 1,
-0.8410314, 0.8122996, -0.6227482, 1, 1, 1, 1, 1,
-0.8406234, -0.07143814, -2.580745, 1, 1, 1, 1, 1,
-0.8400055, 0.1342441, 0.206877, 1, 1, 1, 1, 1,
-0.8364009, -1.730261, -2.021652, 1, 1, 1, 1, 1,
-0.8334831, -0.2106625, -1.833041, 1, 1, 1, 1, 1,
-0.8329083, 0.2077241, -1.251189, 1, 1, 1, 1, 1,
-0.829962, 1.704174, 0.5289004, 1, 1, 1, 1, 1,
-0.8219754, -0.1492459, -0.1931113, 1, 1, 1, 1, 1,
-0.8211027, 1.477146, -0.9897046, 1, 1, 1, 1, 1,
-0.8185192, 0.4358125, -0.5488732, 1, 1, 1, 1, 1,
-0.8168806, 0.06276901, -1.816344, 1, 1, 1, 1, 1,
-0.8115817, -0.8034924, -2.447281, 1, 1, 1, 1, 1,
-0.8089265, 0.1019574, -1.249632, 1, 1, 1, 1, 1,
-0.8080972, -0.1723935, -2.354271, 1, 1, 1, 1, 1,
-0.8078797, -0.5239843, -0.7364535, 0, 0, 1, 1, 1,
-0.8063319, -0.5304559, -1.998945, 1, 0, 0, 1, 1,
-0.80576, 0.3464077, -2.178919, 1, 0, 0, 1, 1,
-0.8013101, 0.8823145, -2.316164, 1, 0, 0, 1, 1,
-0.7952567, -1.499296, -3.259779, 1, 0, 0, 1, 1,
-0.7856469, -0.6262417, -1.379258, 1, 0, 0, 1, 1,
-0.7739367, -1.483734, -2.190813, 0, 0, 0, 1, 1,
-0.7690715, -0.271705, -2.682464, 0, 0, 0, 1, 1,
-0.7682235, -2.149834, -3.292523, 0, 0, 0, 1, 1,
-0.7673709, -0.02082326, -1.859601, 0, 0, 0, 1, 1,
-0.7665188, -0.3155607, -1.578388, 0, 0, 0, 1, 1,
-0.7659582, -0.8212832, -2.46223, 0, 0, 0, 1, 1,
-0.7595206, -0.4237243, -0.5112493, 0, 0, 0, 1, 1,
-0.7555146, -1.481885, -3.718017, 1, 1, 1, 1, 1,
-0.7543233, -0.4863982, -1.878625, 1, 1, 1, 1, 1,
-0.7519666, 0.2514775, -2.575089, 1, 1, 1, 1, 1,
-0.7477331, -0.9855204, -3.208497, 1, 1, 1, 1, 1,
-0.7461288, 1.588144, -2.94091, 1, 1, 1, 1, 1,
-0.7412473, 1.181701, -0.8133683, 1, 1, 1, 1, 1,
-0.7260806, 0.8935027, -2.105346, 1, 1, 1, 1, 1,
-0.7258155, 0.7652301, 0.4314024, 1, 1, 1, 1, 1,
-0.7230603, -0.8814382, -4.00989, 1, 1, 1, 1, 1,
-0.7220141, -0.759768, -3.375586, 1, 1, 1, 1, 1,
-0.7184942, 0.4864323, -1.2172, 1, 1, 1, 1, 1,
-0.7151945, 0.1825723, -0.4434365, 1, 1, 1, 1, 1,
-0.7136364, 1.269378, 0.7843583, 1, 1, 1, 1, 1,
-0.7114416, -1.345411, -2.66393, 1, 1, 1, 1, 1,
-0.70314, -0.9725961, -2.230663, 1, 1, 1, 1, 1,
-0.7011219, 2.143874, 1.29844, 0, 0, 1, 1, 1,
-0.6921445, -0.9392759, -2.638909, 1, 0, 0, 1, 1,
-0.6916817, 0.4223533, 1.169511, 1, 0, 0, 1, 1,
-0.6852753, 0.2000478, -1.805051, 1, 0, 0, 1, 1,
-0.6850283, 0.3898331, 0.04676897, 1, 0, 0, 1, 1,
-0.6836785, 0.7699714, -1.292181, 1, 0, 0, 1, 1,
-0.6820018, -1.057091, -3.153207, 0, 0, 0, 1, 1,
-0.680276, -1.228856, -0.8473961, 0, 0, 0, 1, 1,
-0.6764957, 0.9159049, 0.7610443, 0, 0, 0, 1, 1,
-0.6749328, -0.9088666, -2.522605, 0, 0, 0, 1, 1,
-0.6666877, 0.02880047, -3.114053, 0, 0, 0, 1, 1,
-0.6650277, -0.1968217, -1.805063, 0, 0, 0, 1, 1,
-0.6594107, 0.2411804, 0.0919788, 0, 0, 0, 1, 1,
-0.6591139, 0.2754074, -2.552215, 1, 1, 1, 1, 1,
-0.6566466, -0.147847, -0.8586776, 1, 1, 1, 1, 1,
-0.6563572, -0.4295606, -0.7170545, 1, 1, 1, 1, 1,
-0.6554585, 0.2987023, 0.332105, 1, 1, 1, 1, 1,
-0.6537382, -1.907194, -4.281434, 1, 1, 1, 1, 1,
-0.6436006, -0.7007621, -2.44722, 1, 1, 1, 1, 1,
-0.641683, 0.1952637, -2.082236, 1, 1, 1, 1, 1,
-0.6415083, -0.5316787, -3.622981, 1, 1, 1, 1, 1,
-0.6367775, 0.2344, -2.291033, 1, 1, 1, 1, 1,
-0.6362857, -0.9818618, -1.958179, 1, 1, 1, 1, 1,
-0.6293861, -1.301553, -3.361878, 1, 1, 1, 1, 1,
-0.628969, -1.341088, -4.165635, 1, 1, 1, 1, 1,
-0.6273558, 1.552994, -0.3435249, 1, 1, 1, 1, 1,
-0.6250696, 0.3924575, -2.488759, 1, 1, 1, 1, 1,
-0.6242194, 1.579498, -0.7657795, 1, 1, 1, 1, 1,
-0.6199383, 0.1492351, 0.4902503, 0, 0, 1, 1, 1,
-0.6195257, -0.5480523, -2.058838, 1, 0, 0, 1, 1,
-0.6168269, 0.6966047, -0.6022874, 1, 0, 0, 1, 1,
-0.6163353, 0.2941186, -0.8589647, 1, 0, 0, 1, 1,
-0.6157072, -0.5447906, -3.303421, 1, 0, 0, 1, 1,
-0.6152443, -0.108948, -1.773816, 1, 0, 0, 1, 1,
-0.6124612, 0.9196228, 0.4173068, 0, 0, 0, 1, 1,
-0.6089391, 0.5829998, -1.175529, 0, 0, 0, 1, 1,
-0.6082015, -0.009652729, -0.7138976, 0, 0, 0, 1, 1,
-0.6030806, 0.6683555, -1.652221, 0, 0, 0, 1, 1,
-0.6030196, 0.04633147, -3.397086, 0, 0, 0, 1, 1,
-0.6029938, -2.701546, -3.386927, 0, 0, 0, 1, 1,
-0.6019742, 0.4370862, -1.142655, 0, 0, 0, 1, 1,
-0.5947835, 0.8200932, 0.5444207, 1, 1, 1, 1, 1,
-0.5943681, 0.9767288, -0.3802458, 1, 1, 1, 1, 1,
-0.5928065, 0.3801379, -0.4139752, 1, 1, 1, 1, 1,
-0.5922699, 0.7598787, 1.76751, 1, 1, 1, 1, 1,
-0.5921546, -0.4218169, -2.095282, 1, 1, 1, 1, 1,
-0.5806782, 0.5045806, 0.129021, 1, 1, 1, 1, 1,
-0.5787191, 0.5284966, -1.53272, 1, 1, 1, 1, 1,
-0.5777819, -1.426921, -3.055849, 1, 1, 1, 1, 1,
-0.5763134, 0.881375, 1.82859, 1, 1, 1, 1, 1,
-0.5720378, -0.6774119, -1.197256, 1, 1, 1, 1, 1,
-0.5701091, 0.1080653, -0.6067564, 1, 1, 1, 1, 1,
-0.5680158, -0.1018367, -2.434116, 1, 1, 1, 1, 1,
-0.5676972, -0.6253915, -2.568742, 1, 1, 1, 1, 1,
-0.5658281, 0.4150144, 1.200264, 1, 1, 1, 1, 1,
-0.5548409, 0.3331726, -1.495956, 1, 1, 1, 1, 1,
-0.5523128, 0.7412549, -0.08490688, 0, 0, 1, 1, 1,
-0.5463146, 0.1487847, -1.765115, 1, 0, 0, 1, 1,
-0.5417135, 1.030383, -2.392316, 1, 0, 0, 1, 1,
-0.5376495, 0.8020607, 0.3765602, 1, 0, 0, 1, 1,
-0.537551, -0.2402389, -2.999615, 1, 0, 0, 1, 1,
-0.534853, -0.6228345, -2.988909, 1, 0, 0, 1, 1,
-0.5283625, -1.221242, -1.811155, 0, 0, 0, 1, 1,
-0.525601, -2.613689, -3.01091, 0, 0, 0, 1, 1,
-0.5226005, -0.4774797, -0.4737032, 0, 0, 0, 1, 1,
-0.5148293, -0.7316899, -2.918098, 0, 0, 0, 1, 1,
-0.5073152, 0.7847092, -1.577908, 0, 0, 0, 1, 1,
-0.5069193, 0.1610812, -1.777776, 0, 0, 0, 1, 1,
-0.5012984, -1.379482, -1.250486, 0, 0, 0, 1, 1,
-0.491976, 1.517198, -0.6711743, 1, 1, 1, 1, 1,
-0.4880563, -1.122657, -3.338914, 1, 1, 1, 1, 1,
-0.4839042, 0.04939805, -0.5366129, 1, 1, 1, 1, 1,
-0.4795558, -0.4313802, -4.08142, 1, 1, 1, 1, 1,
-0.478763, -2.327584, -1.108229, 1, 1, 1, 1, 1,
-0.4761803, -0.002478182, -1.991445, 1, 1, 1, 1, 1,
-0.4741433, 0.8383695, -0.9359574, 1, 1, 1, 1, 1,
-0.4731979, 0.9033112, 0.1381919, 1, 1, 1, 1, 1,
-0.4721276, -0.4842624, -2.085432, 1, 1, 1, 1, 1,
-0.4713885, 0.1035068, -1.270433, 1, 1, 1, 1, 1,
-0.4635312, 1.126272, -0.7288734, 1, 1, 1, 1, 1,
-0.4626869, 1.042939, -2.410933, 1, 1, 1, 1, 1,
-0.4523898, 1.508129, -1.382194, 1, 1, 1, 1, 1,
-0.447822, 0.4549211, -0.3699191, 1, 1, 1, 1, 1,
-0.445727, 0.4850035, 0.5176072, 1, 1, 1, 1, 1,
-0.4456564, -0.387903, -2.168324, 0, 0, 1, 1, 1,
-0.4422271, 0.3033379, -0.6088169, 1, 0, 0, 1, 1,
-0.44038, -0.308985, -1.089286, 1, 0, 0, 1, 1,
-0.4391266, 0.3564297, -1.365779, 1, 0, 0, 1, 1,
-0.4383581, -0.2990422, -1.633417, 1, 0, 0, 1, 1,
-0.4377523, -0.7855812, -2.993485, 1, 0, 0, 1, 1,
-0.4350103, -1.154784, -0.930848, 0, 0, 0, 1, 1,
-0.4346482, -0.9016861, -3.532169, 0, 0, 0, 1, 1,
-0.4341536, 1.081933, 0.5018356, 0, 0, 0, 1, 1,
-0.4309934, -1.607552, -4.255191, 0, 0, 0, 1, 1,
-0.4267759, -1.363326, -4.062651, 0, 0, 0, 1, 1,
-0.4242906, 0.3606645, 0.7582078, 0, 0, 0, 1, 1,
-0.4167495, 1.067958, -0.8376654, 0, 0, 0, 1, 1,
-0.4145273, 0.4753855, -3.053742, 1, 1, 1, 1, 1,
-0.4133679, -0.147726, -1.717386, 1, 1, 1, 1, 1,
-0.4125471, 0.6632154, -1.006759, 1, 1, 1, 1, 1,
-0.4105764, -0.841581, -3.294653, 1, 1, 1, 1, 1,
-0.4096848, -1.008911, -2.034159, 1, 1, 1, 1, 1,
-0.404067, -0.982787, -2.576115, 1, 1, 1, 1, 1,
-0.4006722, 1.273501, 0.2866911, 1, 1, 1, 1, 1,
-0.4003359, 0.3347043, -0.8731298, 1, 1, 1, 1, 1,
-0.3997657, 0.1972701, -2.205996, 1, 1, 1, 1, 1,
-0.3984528, -1.195863, -3.609615, 1, 1, 1, 1, 1,
-0.3978073, -0.6732156, -1.530939, 1, 1, 1, 1, 1,
-0.3961568, 0.3636528, -1.327254, 1, 1, 1, 1, 1,
-0.3883792, -2.302652, -2.935999, 1, 1, 1, 1, 1,
-0.3872432, 1.610318, -1.405246, 1, 1, 1, 1, 1,
-0.3871053, -1.193969, -2.674661, 1, 1, 1, 1, 1,
-0.3866645, 0.1817114, -0.1387757, 0, 0, 1, 1, 1,
-0.3864354, 0.6612914, -1.11293, 1, 0, 0, 1, 1,
-0.386366, -0.3183761, -1.162116, 1, 0, 0, 1, 1,
-0.3850074, -0.2638952, -2.63239, 1, 0, 0, 1, 1,
-0.3821699, 0.2325878, -1.439475, 1, 0, 0, 1, 1,
-0.3782282, -0.1861555, -1.276819, 1, 0, 0, 1, 1,
-0.3736041, 0.9702359, -0.9982308, 0, 0, 0, 1, 1,
-0.3717452, 0.909915, -0.2006534, 0, 0, 0, 1, 1,
-0.3695725, -0.9649448, -4.147213, 0, 0, 0, 1, 1,
-0.3673436, -0.6563759, -2.659864, 0, 0, 0, 1, 1,
-0.3662057, -1.732597, -1.755121, 0, 0, 0, 1, 1,
-0.3639469, -1.544811, -3.11697, 0, 0, 0, 1, 1,
-0.3608098, 0.7576533, 0.728, 0, 0, 0, 1, 1,
-0.3602828, -0.6579448, -1.956457, 1, 1, 1, 1, 1,
-0.3595131, 0.9275836, -0.9245807, 1, 1, 1, 1, 1,
-0.3552252, 1.502608, -0.005129436, 1, 1, 1, 1, 1,
-0.354631, -0.8066837, -3.526608, 1, 1, 1, 1, 1,
-0.3537894, -0.4048646, -1.001278, 1, 1, 1, 1, 1,
-0.344803, 0.07247914, -0.8208901, 1, 1, 1, 1, 1,
-0.343318, -0.4392872, -1.906703, 1, 1, 1, 1, 1,
-0.3398626, 0.4768427, -1.032407, 1, 1, 1, 1, 1,
-0.3374522, 0.5924578, -0.2727907, 1, 1, 1, 1, 1,
-0.3336389, 0.5170116, -3.299612, 1, 1, 1, 1, 1,
-0.3333053, 1.565334, 1.439322, 1, 1, 1, 1, 1,
-0.3323202, 0.2136311, 0.3255396, 1, 1, 1, 1, 1,
-0.3304162, 0.9419666, -0.9591413, 1, 1, 1, 1, 1,
-0.325949, -0.8754048, -3.850787, 1, 1, 1, 1, 1,
-0.3094952, 1.642259, 0.6759034, 1, 1, 1, 1, 1,
-0.307068, -2.026482, -4.332556, 0, 0, 1, 1, 1,
-0.3050428, 0.5020697, -1.835403, 1, 0, 0, 1, 1,
-0.2986119, 0.7019628, -0.7243721, 1, 0, 0, 1, 1,
-0.2973038, 0.08711131, -1.268409, 1, 0, 0, 1, 1,
-0.2937688, 1.181411, 1.642711, 1, 0, 0, 1, 1,
-0.2909744, -0.1310771, -2.754018, 1, 0, 0, 1, 1,
-0.2892334, -0.3822292, -2.266444, 0, 0, 0, 1, 1,
-0.2874621, 1.347177, -0.09873044, 0, 0, 0, 1, 1,
-0.2869385, 0.4281893, 0.5400842, 0, 0, 0, 1, 1,
-0.2836014, 0.04439852, -2.781627, 0, 0, 0, 1, 1,
-0.2718966, -1.080408, -2.228447, 0, 0, 0, 1, 1,
-0.270936, 1.712333, -0.1572689, 0, 0, 0, 1, 1,
-0.2674738, 0.3243385, -1.016219, 0, 0, 0, 1, 1,
-0.2646184, -2.198175, -1.861785, 1, 1, 1, 1, 1,
-0.264427, 1.673265, 0.8070573, 1, 1, 1, 1, 1,
-0.2571694, -0.001855687, -1.079026, 1, 1, 1, 1, 1,
-0.2528968, -1.27259, -3.876951, 1, 1, 1, 1, 1,
-0.2514835, 0.3475923, -1.190182, 1, 1, 1, 1, 1,
-0.2514113, 1.418602, -0.6272401, 1, 1, 1, 1, 1,
-0.2513603, 0.8338093, -0.3934574, 1, 1, 1, 1, 1,
-0.2494806, -0.9912254, -5.169632, 1, 1, 1, 1, 1,
-0.2490277, 0.3129627, 0.2817483, 1, 1, 1, 1, 1,
-0.2465046, 0.008608278, -0.0956608, 1, 1, 1, 1, 1,
-0.2450457, -1.556799, -2.698078, 1, 1, 1, 1, 1,
-0.2412864, -0.09438917, -2.050342, 1, 1, 1, 1, 1,
-0.2360114, -0.4047236, -1.9304, 1, 1, 1, 1, 1,
-0.2349825, 0.5293875, -1.668644, 1, 1, 1, 1, 1,
-0.2347335, 0.3673919, -1.596019, 1, 1, 1, 1, 1,
-0.2324077, 1.073927, 0.4006093, 0, 0, 1, 1, 1,
-0.2322232, -0.6337784, -2.402234, 1, 0, 0, 1, 1,
-0.2285291, 1.69238, 0.2164429, 1, 0, 0, 1, 1,
-0.213643, 0.2213009, -0.9956349, 1, 0, 0, 1, 1,
-0.2100281, 0.202622, -1.296106, 1, 0, 0, 1, 1,
-0.2085343, -0.03554391, -1.61701, 1, 0, 0, 1, 1,
-0.2069686, -1.012994, -2.587862, 0, 0, 0, 1, 1,
-0.2037974, -0.01926858, -2.070702, 0, 0, 0, 1, 1,
-0.1979035, -0.6733598, -3.69303, 0, 0, 0, 1, 1,
-0.1931195, 0.7733481, -0.7011551, 0, 0, 0, 1, 1,
-0.1879075, -0.1803876, -3.934659, 0, 0, 0, 1, 1,
-0.1834783, -0.2130807, -2.945801, 0, 0, 0, 1, 1,
-0.1744484, 0.0534164, -1.222969, 0, 0, 0, 1, 1,
-0.1742737, 0.198285, -1.618338, 1, 1, 1, 1, 1,
-0.1683196, -0.5897725, -3.816679, 1, 1, 1, 1, 1,
-0.1650156, 1.738827, -0.2310046, 1, 1, 1, 1, 1,
-0.1631242, 0.5225102, -0.3405026, 1, 1, 1, 1, 1,
-0.1587468, 1.113313, 1.231915, 1, 1, 1, 1, 1,
-0.1583681, -0.4467692, -2.946756, 1, 1, 1, 1, 1,
-0.1555147, -1.463789, -2.791305, 1, 1, 1, 1, 1,
-0.151926, -1.782515, -4.040354, 1, 1, 1, 1, 1,
-0.1428638, -0.04055523, -0.494615, 1, 1, 1, 1, 1,
-0.1417812, 1.761025, -0.6135923, 1, 1, 1, 1, 1,
-0.141166, 1.099102, -0.3435991, 1, 1, 1, 1, 1,
-0.1383948, 0.4783586, -0.2992715, 1, 1, 1, 1, 1,
-0.1260619, -0.5815634, -2.354455, 1, 1, 1, 1, 1,
-0.1244434, 0.1112585, -1.712454, 1, 1, 1, 1, 1,
-0.1208867, -0.2123651, -0.8762434, 1, 1, 1, 1, 1,
-0.1192119, -1.027536, -4.58105, 0, 0, 1, 1, 1,
-0.1083586, -0.8451931, -2.617587, 1, 0, 0, 1, 1,
-0.1055713, 0.9648764, 1.251897, 1, 0, 0, 1, 1,
-0.1029206, 0.5549338, -0.1844411, 1, 0, 0, 1, 1,
-0.101944, 0.2202353, -0.05593521, 1, 0, 0, 1, 1,
-0.1018458, 1.063334, -1.417911, 1, 0, 0, 1, 1,
-0.09893443, -0.1295135, -1.308473, 0, 0, 0, 1, 1,
-0.09599362, 0.6119419, -0.3460953, 0, 0, 0, 1, 1,
-0.0936783, -0.4725802, -4.895733, 0, 0, 0, 1, 1,
-0.08969949, 1.449624, -0.2802562, 0, 0, 0, 1, 1,
-0.08707076, -1.523754, -1.603886, 0, 0, 0, 1, 1,
-0.08589665, 0.424369, -1.107314, 0, 0, 0, 1, 1,
-0.08427963, -0.5771962, -3.410174, 0, 0, 0, 1, 1,
-0.07616752, -1.288277, -3.451018, 1, 1, 1, 1, 1,
-0.07610736, 0.9541749, 1.387056, 1, 1, 1, 1, 1,
-0.0726422, -0.6958125, -0.9672996, 1, 1, 1, 1, 1,
-0.07250851, 0.4068479, 0.6110851, 1, 1, 1, 1, 1,
-0.07116166, -0.2137616, -2.401188, 1, 1, 1, 1, 1,
-0.06327153, -0.04533735, -1.507571, 1, 1, 1, 1, 1,
-0.06067791, -0.6537498, -3.784921, 1, 1, 1, 1, 1,
-0.05938376, 0.2713338, 0.790674, 1, 1, 1, 1, 1,
-0.05815314, -1.086261, -1.696256, 1, 1, 1, 1, 1,
-0.05704363, -2.57808, -1.407573, 1, 1, 1, 1, 1,
-0.05693743, 0.5340788, -0.6144586, 1, 1, 1, 1, 1,
-0.05374054, -0.2655918, -2.367079, 1, 1, 1, 1, 1,
-0.05006649, 0.4682617, -0.2243149, 1, 1, 1, 1, 1,
-0.0495615, 2.358198, -0.871462, 1, 1, 1, 1, 1,
-0.04808607, -0.5054192, -3.594594, 1, 1, 1, 1, 1,
-0.04757977, 0.09671614, -1.912218, 0, 0, 1, 1, 1,
-0.04533108, 2.255409, 1.320017, 1, 0, 0, 1, 1,
-0.04162732, -1.502492, -2.163392, 1, 0, 0, 1, 1,
-0.03934968, -1.009943, -2.472004, 1, 0, 0, 1, 1,
-0.03766442, 0.3094828, -1.518044, 1, 0, 0, 1, 1,
-0.03480814, 0.4533178, 2.244922, 1, 0, 0, 1, 1,
-0.03397771, 1.288951, 0.6783216, 0, 0, 0, 1, 1,
-0.03216783, 0.7697212, -0.1057429, 0, 0, 0, 1, 1,
-0.03124478, 1.044298, -0.09849917, 0, 0, 0, 1, 1,
-0.02840721, -1.071554, -2.252708, 0, 0, 0, 1, 1,
-0.02837134, -0.5304218, -3.288485, 0, 0, 0, 1, 1,
-0.02688148, -0.3106725, -3.058878, 0, 0, 0, 1, 1,
-0.01842486, -0.01641853, -2.863517, 0, 0, 0, 1, 1,
-0.01466742, 0.3928905, -0.2599375, 1, 1, 1, 1, 1,
-0.01451744, -2.149445, -2.462085, 1, 1, 1, 1, 1,
-0.01210042, -0.9882476, -2.719689, 1, 1, 1, 1, 1,
-0.006876913, -0.9743851, -3.950417, 1, 1, 1, 1, 1,
-0.002851724, -1.929848, -3.154789, 1, 1, 1, 1, 1,
-0.001112861, 1.889858, -0.07353792, 1, 1, 1, 1, 1,
0.0004758555, 0.1246286, -1.023494, 1, 1, 1, 1, 1,
0.002881759, 2.271565, -0.4252049, 1, 1, 1, 1, 1,
0.003238174, -1.188303, 4.221801, 1, 1, 1, 1, 1,
0.004789558, -1.481175, 2.649336, 1, 1, 1, 1, 1,
0.004910049, 1.141013, 0.939429, 1, 1, 1, 1, 1,
0.005049725, -0.1171105, 2.269973, 1, 1, 1, 1, 1,
0.008212063, -0.7030742, 1.972474, 1, 1, 1, 1, 1,
0.009516117, -0.1525706, 3.132999, 1, 1, 1, 1, 1,
0.01015877, -0.9104875, 3.421467, 1, 1, 1, 1, 1,
0.01133697, -0.7351706, 3.418371, 0, 0, 1, 1, 1,
0.01265043, -0.6863418, 2.114919, 1, 0, 0, 1, 1,
0.01413833, 1.078964, 0.0366176, 1, 0, 0, 1, 1,
0.01813587, -2.239566, 1.376828, 1, 0, 0, 1, 1,
0.01945865, 0.5488288, -0.2954378, 1, 0, 0, 1, 1,
0.02155325, 1.57828, -0.9092638, 1, 0, 0, 1, 1,
0.02215072, -1.729472, 3.413186, 0, 0, 0, 1, 1,
0.02500941, 0.6299056, 1.090672, 0, 0, 0, 1, 1,
0.02679388, 0.2178302, 1.230436, 0, 0, 0, 1, 1,
0.02759186, -2.343984, 2.934733, 0, 0, 0, 1, 1,
0.03069029, -0.4800187, 3.424672, 0, 0, 0, 1, 1,
0.03084114, -0.8864297, 2.891491, 0, 0, 0, 1, 1,
0.03373297, -0.1966138, 3.155748, 0, 0, 0, 1, 1,
0.0346491, 0.6858844, 0.5104203, 1, 1, 1, 1, 1,
0.03479219, 2.028057, 0.541981, 1, 1, 1, 1, 1,
0.03486105, -0.6432602, 4.297983, 1, 1, 1, 1, 1,
0.03703915, -0.7877035, 2.817896, 1, 1, 1, 1, 1,
0.03833979, -0.1221924, 2.790527, 1, 1, 1, 1, 1,
0.04141585, -1.20371, 4.720196, 1, 1, 1, 1, 1,
0.04158352, 0.3611387, -0.9399279, 1, 1, 1, 1, 1,
0.04165793, -0.2835815, 3.237731, 1, 1, 1, 1, 1,
0.04524273, -1.604177, 2.745466, 1, 1, 1, 1, 1,
0.04685026, 1.256367, -1.550002, 1, 1, 1, 1, 1,
0.04807865, 0.412599, 1.07556, 1, 1, 1, 1, 1,
0.04940623, -0.2386162, 3.345512, 1, 1, 1, 1, 1,
0.05015386, 1.275965, 0.8905748, 1, 1, 1, 1, 1,
0.05082884, -1.847821, 2.895529, 1, 1, 1, 1, 1,
0.05476176, 0.1107105, -0.7953008, 1, 1, 1, 1, 1,
0.05610688, -1.539392, 4.392075, 0, 0, 1, 1, 1,
0.0561346, -0.7729957, 3.268859, 1, 0, 0, 1, 1,
0.05747457, 0.5465216, 0.8416455, 1, 0, 0, 1, 1,
0.05940288, 0.4419361, 1.124171, 1, 0, 0, 1, 1,
0.06208527, 0.1305601, 1.379432, 1, 0, 0, 1, 1,
0.06265151, -1.524979, 2.94429, 1, 0, 0, 1, 1,
0.06846745, -0.8847649, 4.910919, 0, 0, 0, 1, 1,
0.06997927, 1.592055, 0.6436858, 0, 0, 0, 1, 1,
0.07017665, 0.7959185, 0.7702534, 0, 0, 0, 1, 1,
0.07653996, 1.693982, -1.233484, 0, 0, 0, 1, 1,
0.0823703, 1.632772, 1.338953, 0, 0, 0, 1, 1,
0.08423182, 0.3670854, -1.696096, 0, 0, 0, 1, 1,
0.08538725, -1.04313, 2.917006, 0, 0, 0, 1, 1,
0.08973995, -2.237196, 3.586018, 1, 1, 1, 1, 1,
0.0901804, 0.9721473, 1.730536, 1, 1, 1, 1, 1,
0.09086316, 0.1243523, 0.1062903, 1, 1, 1, 1, 1,
0.09227838, -1.429425, 2.674832, 1, 1, 1, 1, 1,
0.09431856, -1.058061, 1.082116, 1, 1, 1, 1, 1,
0.0944986, -2.548316, 2.832279, 1, 1, 1, 1, 1,
0.09965003, -1.481634, 1.56875, 1, 1, 1, 1, 1,
0.1012793, 0.4554974, 0.7858132, 1, 1, 1, 1, 1,
0.1028297, -0.5445896, 3.493631, 1, 1, 1, 1, 1,
0.1038195, -1.194402, 2.054218, 1, 1, 1, 1, 1,
0.1085455, -0.3649488, 4.288754, 1, 1, 1, 1, 1,
0.1147571, 0.3155079, 0.8342772, 1, 1, 1, 1, 1,
0.1160032, 1.558654, 0.5188425, 1, 1, 1, 1, 1,
0.1162021, 0.1094959, -0.1944748, 1, 1, 1, 1, 1,
0.1164384, 0.5754116, 0.506919, 1, 1, 1, 1, 1,
0.1169953, -0.2308363, 2.842312, 0, 0, 1, 1, 1,
0.1181854, 1.344935, 0.371812, 1, 0, 0, 1, 1,
0.1199837, -0.5684112, 1.981134, 1, 0, 0, 1, 1,
0.1236376, -0.09794848, 3.250917, 1, 0, 0, 1, 1,
0.124685, 0.9644404, 0.9791216, 1, 0, 0, 1, 1,
0.1257804, 0.4046122, -0.787807, 1, 0, 0, 1, 1,
0.1297039, 0.4514003, 0.8600711, 0, 0, 0, 1, 1,
0.1303811, 0.7548028, 0.1845789, 0, 0, 0, 1, 1,
0.1321589, 0.6758052, -0.2295106, 0, 0, 0, 1, 1,
0.1366607, 0.1973017, 0.521513, 0, 0, 0, 1, 1,
0.1367805, -1.056489, 2.698416, 0, 0, 0, 1, 1,
0.137027, 0.800139, -0.639365, 0, 0, 0, 1, 1,
0.1382267, -0.1154413, 0.8102924, 0, 0, 0, 1, 1,
0.147182, 0.5222343, 0.220047, 1, 1, 1, 1, 1,
0.148173, 0.5618106, 2.404341, 1, 1, 1, 1, 1,
0.1481964, 0.4952247, 0.2558438, 1, 1, 1, 1, 1,
0.1509548, -1.360541, 4.486457, 1, 1, 1, 1, 1,
0.1576722, -0.1524188, 3.057553, 1, 1, 1, 1, 1,
0.1611365, 0.1330897, 0.9451669, 1, 1, 1, 1, 1,
0.1615522, -0.02079564, 1.75192, 1, 1, 1, 1, 1,
0.1637959, 0.3565153, -0.1310479, 1, 1, 1, 1, 1,
0.16607, 0.6037784, -1.109942, 1, 1, 1, 1, 1,
0.166494, -1.060596, 3.850456, 1, 1, 1, 1, 1,
0.1686909, -0.6592166, 3.204254, 1, 1, 1, 1, 1,
0.1756648, 0.2740052, -0.3236953, 1, 1, 1, 1, 1,
0.1771881, -0.7924183, 2.615718, 1, 1, 1, 1, 1,
0.1810324, 2.338142, 0.3294083, 1, 1, 1, 1, 1,
0.1822097, 1.057313, 1.025249, 1, 1, 1, 1, 1,
0.1870952, 0.7584445, -1.328176, 0, 0, 1, 1, 1,
0.1874865, 0.2292337, 1.435868, 1, 0, 0, 1, 1,
0.1935329, 1.113373, 0.2734244, 1, 0, 0, 1, 1,
0.2015894, -0.1580915, 0.9938074, 1, 0, 0, 1, 1,
0.2034364, 0.5732747, -0.1616938, 1, 0, 0, 1, 1,
0.2048052, 1.076431, 0.4298302, 1, 0, 0, 1, 1,
0.2134937, -1.348283, 2.629014, 0, 0, 0, 1, 1,
0.2141767, 1.052937, -0.2772638, 0, 0, 0, 1, 1,
0.2159065, 0.4366424, -0.6389458, 0, 0, 0, 1, 1,
0.2166454, -0.7131266, 2.685987, 0, 0, 0, 1, 1,
0.2198327, 0.6601503, 0.2586622, 0, 0, 0, 1, 1,
0.2217559, 0.7008968, 0.4983835, 0, 0, 0, 1, 1,
0.2311136, -0.8244029, 1.883976, 0, 0, 0, 1, 1,
0.2337517, -1.634412, 3.287012, 1, 1, 1, 1, 1,
0.2343914, -0.703373, 4.101213, 1, 1, 1, 1, 1,
0.2365983, -0.7860678, 4.584641, 1, 1, 1, 1, 1,
0.2421336, -1.042037, 5.130076, 1, 1, 1, 1, 1,
0.2425082, -0.8547401, 3.188153, 1, 1, 1, 1, 1,
0.2449246, 0.2377643, 0.2431884, 1, 1, 1, 1, 1,
0.250734, -0.3595231, 2.949964, 1, 1, 1, 1, 1,
0.2552263, -0.4590859, 0.4314468, 1, 1, 1, 1, 1,
0.2557895, -1.855531, 3.661014, 1, 1, 1, 1, 1,
0.2558317, 0.7507854, -1.530501, 1, 1, 1, 1, 1,
0.259617, -1.153338, 1.796112, 1, 1, 1, 1, 1,
0.2616717, 0.2327966, 0.5489519, 1, 1, 1, 1, 1,
0.2645624, 1.877205, -0.5258797, 1, 1, 1, 1, 1,
0.2662781, -0.9014721, 2.68766, 1, 1, 1, 1, 1,
0.2693101, 0.6022611, 2.128336, 1, 1, 1, 1, 1,
0.2697698, -1.381092, 3.728811, 0, 0, 1, 1, 1,
0.2751003, 0.1256003, -0.7917961, 1, 0, 0, 1, 1,
0.278255, -0.9421049, 2.158783, 1, 0, 0, 1, 1,
0.2831186, -0.03789331, 0.478736, 1, 0, 0, 1, 1,
0.2847624, 0.6824478, 0.9230146, 1, 0, 0, 1, 1,
0.2877836, -0.1278525, 1.4745, 1, 0, 0, 1, 1,
0.3013391, -1.284531, 1.790256, 0, 0, 0, 1, 1,
0.3059147, -0.002345138, 1.268101, 0, 0, 0, 1, 1,
0.3062036, 0.7079526, 0.8558684, 0, 0, 0, 1, 1,
0.3068013, -2.479911, 2.697189, 0, 0, 0, 1, 1,
0.3084222, 0.03311456, 2.71452, 0, 0, 0, 1, 1,
0.3171381, -0.4502144, 2.232676, 0, 0, 0, 1, 1,
0.318339, 0.2441594, 1.266729, 0, 0, 0, 1, 1,
0.3195576, -0.3049935, 2.74673, 1, 1, 1, 1, 1,
0.3261176, -0.09896568, 2.691379, 1, 1, 1, 1, 1,
0.327531, -4.166008, 2.955321, 1, 1, 1, 1, 1,
0.3336889, 0.5122795, 0.7113156, 1, 1, 1, 1, 1,
0.3337384, 0.9211612, -0.5128773, 1, 1, 1, 1, 1,
0.3351599, 1.069216, 0.153389, 1, 1, 1, 1, 1,
0.33796, -0.3845583, 2.516634, 1, 1, 1, 1, 1,
0.3432404, 0.7433786, 2.505734, 1, 1, 1, 1, 1,
0.3457705, -0.8417279, 2.693729, 1, 1, 1, 1, 1,
0.347021, -0.6106281, 2.056277, 1, 1, 1, 1, 1,
0.3542406, 1.280885, 0.9878193, 1, 1, 1, 1, 1,
0.3543583, 0.9151964, 0.322482, 1, 1, 1, 1, 1,
0.3559599, 0.48016, 0.3699099, 1, 1, 1, 1, 1,
0.3561868, -1.155357, 2.41032, 1, 1, 1, 1, 1,
0.3576128, -0.2968718, 3.088719, 1, 1, 1, 1, 1,
0.3583592, 1.092838, -0.03496256, 0, 0, 1, 1, 1,
0.3586494, -1.622604, 1.179455, 1, 0, 0, 1, 1,
0.3591915, -0.06167619, 0.7019699, 1, 0, 0, 1, 1,
0.3593157, 0.003781325, 1.137522, 1, 0, 0, 1, 1,
0.3612204, -2.040235, 1.479661, 1, 0, 0, 1, 1,
0.364012, 0.5797208, -0.8886527, 1, 0, 0, 1, 1,
0.3640286, -1.717412, 1.625945, 0, 0, 0, 1, 1,
0.3685298, 2.010571, 0.474407, 0, 0, 0, 1, 1,
0.368937, 0.1184209, 1.205827, 0, 0, 0, 1, 1,
0.3694055, -1.881711, 3.060602, 0, 0, 0, 1, 1,
0.3717411, -0.2736461, 2.271334, 0, 0, 0, 1, 1,
0.3733689, 0.4555213, 0.3567692, 0, 0, 0, 1, 1,
0.374841, -0.6023779, 4.443241, 0, 0, 0, 1, 1,
0.3765935, -0.2246426, 1.018047, 1, 1, 1, 1, 1,
0.37684, 0.07227018, 1.712587, 1, 1, 1, 1, 1,
0.3775792, -1.235205, 3.79251, 1, 1, 1, 1, 1,
0.3777716, 0.516254, 1.655769, 1, 1, 1, 1, 1,
0.3857926, -0.09498431, 1.962813, 1, 1, 1, 1, 1,
0.3870061, 0.08150802, 3.304626, 1, 1, 1, 1, 1,
0.3878587, -0.3388965, 2.56228, 1, 1, 1, 1, 1,
0.3927822, -0.03963412, 0.9001189, 1, 1, 1, 1, 1,
0.397181, 2.236504, 0.6784247, 1, 1, 1, 1, 1,
0.3988699, 0.171887, 0.828438, 1, 1, 1, 1, 1,
0.399499, 1.503616, 0.6892491, 1, 1, 1, 1, 1,
0.401291, -3.293128, 3.205409, 1, 1, 1, 1, 1,
0.4029247, 0.4068285, 0.6161112, 1, 1, 1, 1, 1,
0.4062174, -0.4802269, 3.77692, 1, 1, 1, 1, 1,
0.4071009, 2.707561, 0.06678913, 1, 1, 1, 1, 1,
0.4083136, 0.6721856, 0.6918049, 0, 0, 1, 1, 1,
0.4108811, 1.518218, 0.03519469, 1, 0, 0, 1, 1,
0.4182925, -1.483878, 2.531237, 1, 0, 0, 1, 1,
0.4198349, -0.7877344, 3.029309, 1, 0, 0, 1, 1,
0.4236177, 2.168413, 0.7101111, 1, 0, 0, 1, 1,
0.424195, 0.7073133, 1.166645, 1, 0, 0, 1, 1,
0.4254881, 1.231369, 1.401028, 0, 0, 0, 1, 1,
0.4291376, 0.6097013, 2.004188, 0, 0, 0, 1, 1,
0.4291561, 0.1211787, 0.4953997, 0, 0, 0, 1, 1,
0.4316191, 0.8245822, 2.148226, 0, 0, 0, 1, 1,
0.433104, 1.488072, -0.7945464, 0, 0, 0, 1, 1,
0.4355424, -1.639757, 3.321282, 0, 0, 0, 1, 1,
0.4408124, 0.7010816, 0.6493329, 0, 0, 0, 1, 1,
0.4412104, 0.09451054, 2.175141, 1, 1, 1, 1, 1,
0.4426976, -0.5602074, 0.5027313, 1, 1, 1, 1, 1,
0.4429388, 0.4085344, 2.649983, 1, 1, 1, 1, 1,
0.4432031, 0.09398324, 1.807984, 1, 1, 1, 1, 1,
0.4468835, 1.982157, -0.1508894, 1, 1, 1, 1, 1,
0.4473501, -0.2875025, 3.768869, 1, 1, 1, 1, 1,
0.4475547, 0.8288839, 2.143424, 1, 1, 1, 1, 1,
0.4490426, 0.7871481, 1.975199, 1, 1, 1, 1, 1,
0.452901, -1.179816, 3.553622, 1, 1, 1, 1, 1,
0.4610551, 0.1561828, 2.514824, 1, 1, 1, 1, 1,
0.4621834, 0.7842658, 0.08254241, 1, 1, 1, 1, 1,
0.4631956, 2.217828, -0.8999409, 1, 1, 1, 1, 1,
0.4666759, 1.321129, 0.6568195, 1, 1, 1, 1, 1,
0.466983, 0.3937713, 2.055356, 1, 1, 1, 1, 1,
0.4685308, -1.034479, 0.3588432, 1, 1, 1, 1, 1,
0.4700423, 0.8295197, 1.026098, 0, 0, 1, 1, 1,
0.4706032, 0.9470257, 0.992083, 1, 0, 0, 1, 1,
0.4727252, -0.5534101, 2.671294, 1, 0, 0, 1, 1,
0.4738815, -1.561373, 4.151488, 1, 0, 0, 1, 1,
0.4767888, 0.7646879, -0.8114549, 1, 0, 0, 1, 1,
0.4833827, -1.165737, 2.790024, 1, 0, 0, 1, 1,
0.4869547, 0.05023628, 2.512403, 0, 0, 0, 1, 1,
0.4914929, 1.056392, -0.3559594, 0, 0, 0, 1, 1,
0.4933762, -1.350096, 3.097604, 0, 0, 0, 1, 1,
0.494935, -0.1564578, 0.7188508, 0, 0, 0, 1, 1,
0.5004327, -0.4300974, 1.381867, 0, 0, 0, 1, 1,
0.5006813, -0.08081675, 2.651678, 0, 0, 0, 1, 1,
0.5022019, -0.2322067, 1.674658, 0, 0, 0, 1, 1,
0.5076335, 0.1371086, 0.5309732, 1, 1, 1, 1, 1,
0.5098073, -0.3105058, 0.9640039, 1, 1, 1, 1, 1,
0.5137796, 0.49806, 0.4146552, 1, 1, 1, 1, 1,
0.5141373, 1.309628, -0.1036067, 1, 1, 1, 1, 1,
0.5149991, -0.3719095, 2.101695, 1, 1, 1, 1, 1,
0.5195252, -1.551067, 3.04793, 1, 1, 1, 1, 1,
0.5195475, 0.6966065, -0.406667, 1, 1, 1, 1, 1,
0.5209022, -1.325383, 2.70801, 1, 1, 1, 1, 1,
0.5274259, -1.658765, 2.780334, 1, 1, 1, 1, 1,
0.530394, 0.2235463, 2.041494, 1, 1, 1, 1, 1,
0.5307719, 0.4909833, 1.118624, 1, 1, 1, 1, 1,
0.5350102, 0.8401974, -0.1537344, 1, 1, 1, 1, 1,
0.537065, 1.058267, 0.01532765, 1, 1, 1, 1, 1,
0.5397711, -0.7699426, 4.133817, 1, 1, 1, 1, 1,
0.5400889, 0.3792198, 0.8658432, 1, 1, 1, 1, 1,
0.5416526, 0.1495013, 3.274925, 0, 0, 1, 1, 1,
0.5420783, -0.06231627, 2.162263, 1, 0, 0, 1, 1,
0.5504088, 0.2365955, 0.4451625, 1, 0, 0, 1, 1,
0.5549449, -0.235198, 2.819657, 1, 0, 0, 1, 1,
0.5555609, 0.8707253, 1.520197, 1, 0, 0, 1, 1,
0.5588236, 0.4051314, 0.08164711, 1, 0, 0, 1, 1,
0.5592998, 0.3070796, 1.568825, 0, 0, 0, 1, 1,
0.5605009, 1.176728, 0.7780334, 0, 0, 0, 1, 1,
0.564252, -0.3314277, 2.248457, 0, 0, 0, 1, 1,
0.5766512, 0.1601675, -0.03140929, 0, 0, 0, 1, 1,
0.5785207, -0.01304932, 2.974322, 0, 0, 0, 1, 1,
0.5785299, 1.078482, 0.80927, 0, 0, 0, 1, 1,
0.5883919, -0.5192491, 0.9911582, 0, 0, 0, 1, 1,
0.593983, 1.149984, 1.144201, 1, 1, 1, 1, 1,
0.6025424, 0.6095405, 3.335338, 1, 1, 1, 1, 1,
0.6125407, 0.9811386, -0.454984, 1, 1, 1, 1, 1,
0.6201771, 0.5506862, 0.9144914, 1, 1, 1, 1, 1,
0.6238281, -1.0568, 3.225905, 1, 1, 1, 1, 1,
0.6241712, 0.03729222, 1.104109, 1, 1, 1, 1, 1,
0.6283461, -0.07214134, 0.9377215, 1, 1, 1, 1, 1,
0.6295368, -0.8924287, 2.401803, 1, 1, 1, 1, 1,
0.6297122, -0.5088693, 2.72837, 1, 1, 1, 1, 1,
0.6324228, 0.8225899, 1.777691, 1, 1, 1, 1, 1,
0.6350942, 0.9409347, 1.824986, 1, 1, 1, 1, 1,
0.6380619, 0.4212842, 0.7460479, 1, 1, 1, 1, 1,
0.6397365, -1.409025, 0.3849572, 1, 1, 1, 1, 1,
0.6442337, 0.6036647, 0.1295931, 1, 1, 1, 1, 1,
0.649196, -0.4950933, 2.018886, 1, 1, 1, 1, 1,
0.6504191, -1.906615, 3.539136, 0, 0, 1, 1, 1,
0.6509198, -1.562395, 1.369628, 1, 0, 0, 1, 1,
0.6595922, 0.3862431, 0.3938135, 1, 0, 0, 1, 1,
0.6620569, -0.1611999, 1.05061, 1, 0, 0, 1, 1,
0.6638952, 0.4109985, 1.1098, 1, 0, 0, 1, 1,
0.6657544, -0.3842989, 2.177309, 1, 0, 0, 1, 1,
0.6696199, 1.35766, 1.45406, 0, 0, 0, 1, 1,
0.674301, -0.7552356, 2.644525, 0, 0, 0, 1, 1,
0.6748382, 0.264234, 1.429367, 0, 0, 0, 1, 1,
0.6775968, 1.673356, -0.3633885, 0, 0, 0, 1, 1,
0.6803906, 1.571458, -0.02358812, 0, 0, 0, 1, 1,
0.682239, 0.6091976, 1.85884, 0, 0, 0, 1, 1,
0.6865005, -1.927396, 3.340263, 0, 0, 0, 1, 1,
0.6905864, 1.262515, 1.468931, 1, 1, 1, 1, 1,
0.7003425, 1.165314, 3.107376, 1, 1, 1, 1, 1,
0.7022168, 1.866251, 0.01020436, 1, 1, 1, 1, 1,
0.7048988, -1.328699, 2.857044, 1, 1, 1, 1, 1,
0.7097585, -0.3200959, 3.540853, 1, 1, 1, 1, 1,
0.7158996, 1.788188, 0.2584766, 1, 1, 1, 1, 1,
0.7163281, -0.6936095, 3.826905, 1, 1, 1, 1, 1,
0.7231962, -0.3551123, 2.507059, 1, 1, 1, 1, 1,
0.7237899, -0.4870121, 2.48093, 1, 1, 1, 1, 1,
0.7238261, 0.1658305, 1.06312, 1, 1, 1, 1, 1,
0.7257458, -0.4118311, 3.052886, 1, 1, 1, 1, 1,
0.7282093, -0.09958375, -0.008242249, 1, 1, 1, 1, 1,
0.7297572, -0.7323014, 1.619654, 1, 1, 1, 1, 1,
0.7300192, -1.227772, 2.997313, 1, 1, 1, 1, 1,
0.7339861, 0.09079102, 1.551192, 1, 1, 1, 1, 1,
0.7415168, 1.94515, -0.3242413, 0, 0, 1, 1, 1,
0.7446121, -2.18071, 3.052229, 1, 0, 0, 1, 1,
0.74922, -0.8211743, 2.925307, 1, 0, 0, 1, 1,
0.7539329, 0.5149508, 0.1704478, 1, 0, 0, 1, 1,
0.7547205, 0.9480562, 0.06545407, 1, 0, 0, 1, 1,
0.7556327, 1.364502, 0.2982128, 1, 0, 0, 1, 1,
0.7558369, 1.044061, -0.5170588, 0, 0, 0, 1, 1,
0.7586197, 0.534085, 2.098529, 0, 0, 0, 1, 1,
0.7589953, -0.02208794, 1.302106, 0, 0, 0, 1, 1,
0.7616791, -1.048456, 4.327518, 0, 0, 0, 1, 1,
0.7618011, 1.728651, 0.9296631, 0, 0, 0, 1, 1,
0.765637, 0.08886306, 1.096024, 0, 0, 0, 1, 1,
0.7663021, 0.6129246, -0.06645517, 0, 0, 0, 1, 1,
0.7683926, -0.09653375, 3.247166, 1, 1, 1, 1, 1,
0.7734869, 0.3908258, 0.20488, 1, 1, 1, 1, 1,
0.774695, 0.7534732, -0.5936744, 1, 1, 1, 1, 1,
0.7805037, 0.1091647, 2.089128, 1, 1, 1, 1, 1,
0.7848374, -0.4466993, 3.436964, 1, 1, 1, 1, 1,
0.7890944, 0.6633962, 0.3604085, 1, 1, 1, 1, 1,
0.8009782, 0.3527066, 0.5646012, 1, 1, 1, 1, 1,
0.8040184, -1.508995, 2.890175, 1, 1, 1, 1, 1,
0.808968, 0.2962937, 3.516713, 1, 1, 1, 1, 1,
0.8089902, 0.0577338, 2.674395, 1, 1, 1, 1, 1,
0.8115821, -0.1431986, 1.654333, 1, 1, 1, 1, 1,
0.8139285, 1.067083, 2.659634, 1, 1, 1, 1, 1,
0.815428, 1.435067, 0.5654036, 1, 1, 1, 1, 1,
0.819948, 0.5054163, 0.6038784, 1, 1, 1, 1, 1,
0.8209434, 0.4434169, 1.045508, 1, 1, 1, 1, 1,
0.8339235, -1.31611, 1.021661, 0, 0, 1, 1, 1,
0.8399688, 1.991971, 0.5699493, 1, 0, 0, 1, 1,
0.8425814, -0.1538346, 0.7927361, 1, 0, 0, 1, 1,
0.8577783, 0.6687919, 0.3878589, 1, 0, 0, 1, 1,
0.8609525, 0.7709996, 1.664206, 1, 0, 0, 1, 1,
0.8729741, -0.7082029, 2.914534, 1, 0, 0, 1, 1,
0.8801739, 0.5358641, 2.452333, 0, 0, 0, 1, 1,
0.8826393, -0.09429331, 0.9038245, 0, 0, 0, 1, 1,
0.8945534, 0.1774755, 0.7163885, 0, 0, 0, 1, 1,
0.8968959, 2.206975, 0.2020623, 0, 0, 0, 1, 1,
0.8983619, -0.207027, 0.8082865, 0, 0, 0, 1, 1,
0.9006948, 0.6553202, 0.5838464, 0, 0, 0, 1, 1,
0.9007168, 0.1922733, 2.483308, 0, 0, 0, 1, 1,
0.9032786, 0.4503894, 2.119664, 1, 1, 1, 1, 1,
0.912552, -1.262004, 2.501025, 1, 1, 1, 1, 1,
0.9134188, -0.3927489, 0.91053, 1, 1, 1, 1, 1,
0.914439, 0.3368335, 1.831769, 1, 1, 1, 1, 1,
0.9190843, -0.235971, 0.6736311, 1, 1, 1, 1, 1,
0.9215067, 1.481884, 1.582114, 1, 1, 1, 1, 1,
0.9233968, -0.3592534, 2.22648, 1, 1, 1, 1, 1,
0.9241613, -0.3196448, 3.454417, 1, 1, 1, 1, 1,
0.9254693, -0.09088054, 2.222761, 1, 1, 1, 1, 1,
0.925658, 0.5619843, 0.09107462, 1, 1, 1, 1, 1,
0.9292915, 0.2461303, 2.093432, 1, 1, 1, 1, 1,
0.9378217, 0.6613147, 2.164239, 1, 1, 1, 1, 1,
0.9435936, 1.859288, 0.848922, 1, 1, 1, 1, 1,
0.9478709, 0.9283072, 1.672031, 1, 1, 1, 1, 1,
0.9488675, 0.5807088, 1.602646, 1, 1, 1, 1, 1,
0.9521894, 0.2580366, 1.318418, 0, 0, 1, 1, 1,
0.9594032, -0.1001796, 2.716345, 1, 0, 0, 1, 1,
0.9643142, 0.05708773, 3.644994, 1, 0, 0, 1, 1,
0.9657329, -2.958123, 1.739444, 1, 0, 0, 1, 1,
0.96785, -0.167817, 2.383649, 1, 0, 0, 1, 1,
0.9725394, 1.213642, 0.7170845, 1, 0, 0, 1, 1,
0.9788864, 2.49097, 0.6902335, 0, 0, 0, 1, 1,
0.9807352, 0.4639743, 1.019069, 0, 0, 0, 1, 1,
0.9922612, 1.058554, 1.876816, 0, 0, 0, 1, 1,
0.9972449, 0.0498164, 0.5852932, 0, 0, 0, 1, 1,
1.00804, 0.6279117, 1.207158, 0, 0, 0, 1, 1,
1.009935, -1.474144, 5.799832, 0, 0, 0, 1, 1,
1.012312, -2.490778, 2.422462, 0, 0, 0, 1, 1,
1.013832, 0.3373171, 0.5580029, 1, 1, 1, 1, 1,
1.015529, 0.3212014, 2.652977, 1, 1, 1, 1, 1,
1.020908, 1.472468, 1.703608, 1, 1, 1, 1, 1,
1.02294, 0.488595, -0.6878781, 1, 1, 1, 1, 1,
1.023407, -0.6718895, 2.115716, 1, 1, 1, 1, 1,
1.023692, -1.025276, 4.697995, 1, 1, 1, 1, 1,
1.024869, -0.3568933, 1.683593, 1, 1, 1, 1, 1,
1.040028, 1.469002, 0.1724725, 1, 1, 1, 1, 1,
1.055174, 1.021222, 0.3964673, 1, 1, 1, 1, 1,
1.062373, 1.26587, 2.190616, 1, 1, 1, 1, 1,
1.066592, 0.1747916, -0.1647881, 1, 1, 1, 1, 1,
1.073537, 1.350232, 0.6322944, 1, 1, 1, 1, 1,
1.07992, -2.357072, 2.17527, 1, 1, 1, 1, 1,
1.086584, 0.5205584, -0.7684973, 1, 1, 1, 1, 1,
1.095559, 0.5492716, -2.369904, 1, 1, 1, 1, 1,
1.096498, 0.5573553, 1.049359, 0, 0, 1, 1, 1,
1.099184, 0.4415344, 1.284131, 1, 0, 0, 1, 1,
1.104087, -0.9453328, 2.442205, 1, 0, 0, 1, 1,
1.105666, 2.019851, 0.05708181, 1, 0, 0, 1, 1,
1.106917, 1.187818, 0.3421303, 1, 0, 0, 1, 1,
1.109036, -2.079792, 3.045609, 1, 0, 0, 1, 1,
1.114377, 0.2220155, 2.518576, 0, 0, 0, 1, 1,
1.114485, 0.5402402, 2.293468, 0, 0, 0, 1, 1,
1.120146, 0.9709593, 0.5198656, 0, 0, 0, 1, 1,
1.121895, 0.2027915, -0.1271699, 0, 0, 0, 1, 1,
1.12599, 1.115376, 1.29686, 0, 0, 0, 1, 1,
1.133954, -0.99099, 1.171262, 0, 0, 0, 1, 1,
1.133987, -0.990137, 2.509083, 0, 0, 0, 1, 1,
1.134169, 0.7404513, 1.82867, 1, 1, 1, 1, 1,
1.134891, 0.4272213, 0.2516383, 1, 1, 1, 1, 1,
1.135873, 0.1530835, 0.07900416, 1, 1, 1, 1, 1,
1.139399, -1.186628, 3.230458, 1, 1, 1, 1, 1,
1.140307, -1.470893, 2.561144, 1, 1, 1, 1, 1,
1.144915, 1.049549, -0.543249, 1, 1, 1, 1, 1,
1.145267, -0.641185, 1.49707, 1, 1, 1, 1, 1,
1.150631, -0.6282315, 1.882065, 1, 1, 1, 1, 1,
1.161521, -0.9828644, 2.097789, 1, 1, 1, 1, 1,
1.166629, -1.518643, 2.246535, 1, 1, 1, 1, 1,
1.170935, -1.05274, 3.622649, 1, 1, 1, 1, 1,
1.183072, -0.3900997, 0.5957009, 1, 1, 1, 1, 1,
1.186991, 0.8477579, 1.468347, 1, 1, 1, 1, 1,
1.188571, -0.6457348, 2.384163, 1, 1, 1, 1, 1,
1.192462, -0.7358405, 2.591291, 1, 1, 1, 1, 1,
1.196861, -0.3915418, 1.210575, 0, 0, 1, 1, 1,
1.201288, -1.721308, 3.408624, 1, 0, 0, 1, 1,
1.203481, -1.923265, 2.667245, 1, 0, 0, 1, 1,
1.203513, -0.4950706, 2.392595, 1, 0, 0, 1, 1,
1.205657, -0.7833916, 1.789734, 1, 0, 0, 1, 1,
1.223076, 1.314894, 0.3168466, 1, 0, 0, 1, 1,
1.228149, 0.6402259, 1.091564, 0, 0, 0, 1, 1,
1.230758, 0.2869786, -0.04685939, 0, 0, 0, 1, 1,
1.232933, -0.2624568, 2.954381, 0, 0, 0, 1, 1,
1.238077, -1.110926, -0.06368974, 0, 0, 0, 1, 1,
1.243351, 0.8116149, -0.5875722, 0, 0, 0, 1, 1,
1.251725, 0.5522724, 2.407254, 0, 0, 0, 1, 1,
1.252083, 0.2561572, 1.19271, 0, 0, 0, 1, 1,
1.266866, -0.09507245, 2.979064, 1, 1, 1, 1, 1,
1.268847, -0.494314, 2.198249, 1, 1, 1, 1, 1,
1.269796, -0.525704, 1.019778, 1, 1, 1, 1, 1,
1.270059, -0.2187774, 1.910122, 1, 1, 1, 1, 1,
1.275735, -0.7381571, 2.671089, 1, 1, 1, 1, 1,
1.280135, 0.8775102, 0.05818363, 1, 1, 1, 1, 1,
1.290769, 0.1477582, 0.9082057, 1, 1, 1, 1, 1,
1.2941, 0.6251454, 0.6595703, 1, 1, 1, 1, 1,
1.304098, -1.01922, -0.1206741, 1, 1, 1, 1, 1,
1.306604, -0.8816666, 1.377633, 1, 1, 1, 1, 1,
1.308269, -0.7759775, 1.299846, 1, 1, 1, 1, 1,
1.311946, 0.5137692, 0.5647519, 1, 1, 1, 1, 1,
1.339763, 1.584998, 0.05535616, 1, 1, 1, 1, 1,
1.351971, -1.704153, 3.05878, 1, 1, 1, 1, 1,
1.394543, 0.6302658, 0.4145611, 1, 1, 1, 1, 1,
1.395362, -0.004689114, 1.24575, 0, 0, 1, 1, 1,
1.398899, -0.798979, 1.184315, 1, 0, 0, 1, 1,
1.409826, -1.486975, 2.889005, 1, 0, 0, 1, 1,
1.432928, -2.651201, 1.976358, 1, 0, 0, 1, 1,
1.440188, 3.487386, -1.15273, 1, 0, 0, 1, 1,
1.442792, -0.1717665, 1.711694, 1, 0, 0, 1, 1,
1.444399, -0.005135402, 1.453361, 0, 0, 0, 1, 1,
1.451198, 0.4497735, 2.267575, 0, 0, 0, 1, 1,
1.451777, 0.6840842, 0.4358995, 0, 0, 0, 1, 1,
1.458565, -0.3707927, 0.5384401, 0, 0, 0, 1, 1,
1.468052, -1.376569, 4.392619, 0, 0, 0, 1, 1,
1.472371, 0.5771422, 0.839316, 0, 0, 0, 1, 1,
1.479038, -1.007175, 1.592228, 0, 0, 0, 1, 1,
1.480036, -1.094217, 1.917312, 1, 1, 1, 1, 1,
1.482222, 0.1933699, 0.331623, 1, 1, 1, 1, 1,
1.48581, 0.100255, 3.018579, 1, 1, 1, 1, 1,
1.49012, 0.3506112, 1.176642, 1, 1, 1, 1, 1,
1.494506, 0.9400661, -0.2901377, 1, 1, 1, 1, 1,
1.496688, 0.1068436, 2.512522, 1, 1, 1, 1, 1,
1.50209, -0.9204612, 0.5898614, 1, 1, 1, 1, 1,
1.553645, -1.035722, 1.642346, 1, 1, 1, 1, 1,
1.55446, -0.9372426, 1.398985, 1, 1, 1, 1, 1,
1.556864, -0.3567157, 3.119995, 1, 1, 1, 1, 1,
1.557056, 0.6694244, 3.184705, 1, 1, 1, 1, 1,
1.559765, 1.515704, 0.8149643, 1, 1, 1, 1, 1,
1.566564, 1.669025, -0.3023776, 1, 1, 1, 1, 1,
1.575553, -2.711394, 1.52396, 1, 1, 1, 1, 1,
1.576906, -0.1522586, 2.562182, 1, 1, 1, 1, 1,
1.577047, -1.253634, 3.371496, 0, 0, 1, 1, 1,
1.580811, 0.4891456, 2.106539, 1, 0, 0, 1, 1,
1.601972, 1.405069, 0.4211393, 1, 0, 0, 1, 1,
1.61113, 2.250315, 1.390662, 1, 0, 0, 1, 1,
1.611819, 0.6649762, 1.341865, 1, 0, 0, 1, 1,
1.657122, -0.2520339, 1.064287, 1, 0, 0, 1, 1,
1.691589, -0.8499212, 0.8340251, 0, 0, 0, 1, 1,
1.69519, -0.1914611, 0.5024028, 0, 0, 0, 1, 1,
1.72623, 1.052002, 0.05369931, 0, 0, 0, 1, 1,
1.729229, -0.5580774, 2.467752, 0, 0, 0, 1, 1,
1.751579, -0.2321784, 2.695536, 0, 0, 0, 1, 1,
1.754739, 0.172558, 2.746762, 0, 0, 0, 1, 1,
1.778925, 1.016704, 1.477492, 0, 0, 0, 1, 1,
1.798443, 0.487748, 1.720732, 1, 1, 1, 1, 1,
1.807249, 2.022055, 0.5685334, 1, 1, 1, 1, 1,
1.816513, -1.568998, 3.583714, 1, 1, 1, 1, 1,
1.820573, -0.8647165, 1.046368, 1, 1, 1, 1, 1,
1.821408, 0.5479131, -0.5121016, 1, 1, 1, 1, 1,
1.849099, 0.6574996, 0.215004, 1, 1, 1, 1, 1,
1.86269, -0.3645874, 1.497254, 1, 1, 1, 1, 1,
1.875317, -0.1913736, 3.168395, 1, 1, 1, 1, 1,
1.875641, -1.360988, 3.184792, 1, 1, 1, 1, 1,
1.906285, 0.8593704, 0.7919307, 1, 1, 1, 1, 1,
1.909572, -0.6404029, 0.5939753, 1, 1, 1, 1, 1,
1.916448, -1.087143, 0.6841345, 1, 1, 1, 1, 1,
1.922123, -0.4735851, 2.339083, 1, 1, 1, 1, 1,
1.926158, 0.413952, 0.9065096, 1, 1, 1, 1, 1,
1.969925, -0.2954626, 2.092307, 1, 1, 1, 1, 1,
1.972836, -1.459795, 1.164617, 0, 0, 1, 1, 1,
1.987751, -0.5364901, 1.83985, 1, 0, 0, 1, 1,
2.007924, -0.5788453, 2.616486, 1, 0, 0, 1, 1,
2.010428, -1.304016, 3.998295, 1, 0, 0, 1, 1,
2.048075, 1.157185, -0.07968751, 1, 0, 0, 1, 1,
2.062756, -0.7142008, 1.117085, 1, 0, 0, 1, 1,
2.126688, -0.5419047, 4.392858, 0, 0, 0, 1, 1,
2.169875, 1.966618, 1.886997, 0, 0, 0, 1, 1,
2.192028, 0.3689344, 2.474844, 0, 0, 0, 1, 1,
2.222354, -0.4539194, 1.633958, 0, 0, 0, 1, 1,
2.282719, 0.6803537, 1.395792, 0, 0, 0, 1, 1,
2.302781, -0.7544028, 3.090492, 0, 0, 0, 1, 1,
2.313137, -0.1426042, 2.010833, 0, 0, 0, 1, 1,
2.351238, -1.80601, 2.487409, 1, 1, 1, 1, 1,
2.387622, -0.5425117, 1.612409, 1, 1, 1, 1, 1,
2.416764, -0.5512141, 1.950562, 1, 1, 1, 1, 1,
2.510356, -3.091254, 3.529116, 1, 1, 1, 1, 1,
2.630932, 0.463808, 0.481441, 1, 1, 1, 1, 1,
3.150196, -0.1123229, 0.8395388, 1, 1, 1, 1, 1,
3.340292, 0.3949174, 1.422417, 1, 1, 1, 1, 1
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
var radius = 10.08517;
var distance = 35.42373;
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
mvMatrix.translate( -0.01482821, 0.3393109, -0.3151002 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.42373);
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
