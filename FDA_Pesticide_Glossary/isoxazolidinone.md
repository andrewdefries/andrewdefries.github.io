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
-3.369512, -0.03423625, -3.098943, 1, 0, 0, 1,
-2.967038, 0.1955117, -0.3033736, 1, 0.007843138, 0, 1,
-2.631914, 0.1511548, -1.859076, 1, 0.01176471, 0, 1,
-2.510015, -0.6333743, -1.653935, 1, 0.01960784, 0, 1,
-2.483521, 0.4101387, -1.446106, 1, 0.02352941, 0, 1,
-2.476694, 0.479731, -0.9341153, 1, 0.03137255, 0, 1,
-2.357872, 1.551088, -1.571927, 1, 0.03529412, 0, 1,
-2.351309, -0.3490956, 0.4339101, 1, 0.04313726, 0, 1,
-2.261825, 0.4025037, -1.214677, 1, 0.04705882, 0, 1,
-2.243696, 0.5519699, 0.4018486, 1, 0.05490196, 0, 1,
-2.242081, -0.4519745, -0.01027281, 1, 0.05882353, 0, 1,
-2.236162, 0.9881676, -0.7489739, 1, 0.06666667, 0, 1,
-2.235258, 1.012497, 0.2139329, 1, 0.07058824, 0, 1,
-2.232621, 0.8991569, -1.172196, 1, 0.07843138, 0, 1,
-2.231815, -0.3301101, -1.712775, 1, 0.08235294, 0, 1,
-2.228837, -1.262104, -1.940718, 1, 0.09019608, 0, 1,
-2.142979, 0.8573258, -0.8235955, 1, 0.09411765, 0, 1,
-2.092447, 1.88083, -2.577823, 1, 0.1019608, 0, 1,
-2.084314, 0.5817351, -2.634394, 1, 0.1098039, 0, 1,
-2.028877, -0.6739365, -0.9295125, 1, 0.1137255, 0, 1,
-2.024019, -0.912705, -2.689536, 1, 0.1215686, 0, 1,
-2.01896, 0.08246213, -2.075221, 1, 0.1254902, 0, 1,
-2.011577, 1.162773, -1.661149, 1, 0.1333333, 0, 1,
-2.006168, -0.9012865, -0.9801354, 1, 0.1372549, 0, 1,
-1.993459, -0.7449906, -0.7894352, 1, 0.145098, 0, 1,
-1.99272, -0.3727275, -3.508464, 1, 0.1490196, 0, 1,
-1.978467, 0.9088045, -1.0117, 1, 0.1568628, 0, 1,
-1.967588, 1.569546, -0.1318607, 1, 0.1607843, 0, 1,
-1.952596, 0.02387085, -2.361223, 1, 0.1686275, 0, 1,
-1.943739, -0.516565, -3.054232, 1, 0.172549, 0, 1,
-1.920191, -0.1278506, -1.760241, 1, 0.1803922, 0, 1,
-1.898573, -0.188201, -4.328739, 1, 0.1843137, 0, 1,
-1.888247, -0.4050294, -0.0624623, 1, 0.1921569, 0, 1,
-1.886592, -0.1293069, -2.813613, 1, 0.1960784, 0, 1,
-1.81012, 0.03308631, -1.508202, 1, 0.2039216, 0, 1,
-1.794584, -0.1730306, -1.532489, 1, 0.2117647, 0, 1,
-1.792274, 1.767349, -0.2699009, 1, 0.2156863, 0, 1,
-1.792182, 0.5786432, -1.20136, 1, 0.2235294, 0, 1,
-1.786367, 1.372166, 0.139997, 1, 0.227451, 0, 1,
-1.785781, 0.136427, -2.520746, 1, 0.2352941, 0, 1,
-1.778562, 0.9416545, -0.7409714, 1, 0.2392157, 0, 1,
-1.772812, -0.260773, -3.13039, 1, 0.2470588, 0, 1,
-1.720292, 0.202449, -1.724259, 1, 0.2509804, 0, 1,
-1.708398, -0.3721965, -1.904836, 1, 0.2588235, 0, 1,
-1.698873, 0.08531814, -2.354436, 1, 0.2627451, 0, 1,
-1.685331, 0.5111123, -1.569834, 1, 0.2705882, 0, 1,
-1.684456, -0.5421431, -2.170448, 1, 0.2745098, 0, 1,
-1.668539, 0.1444295, -1.919632, 1, 0.282353, 0, 1,
-1.661142, 0.36582, -1.507447, 1, 0.2862745, 0, 1,
-1.648536, -0.1393449, -0.9089376, 1, 0.2941177, 0, 1,
-1.627838, 2.005844, -1.630278, 1, 0.3019608, 0, 1,
-1.614297, 0.8851418, -1.350667, 1, 0.3058824, 0, 1,
-1.612679, 0.01185272, -1.817085, 1, 0.3137255, 0, 1,
-1.608095, 0.558225, -2.026156, 1, 0.3176471, 0, 1,
-1.604414, -0.1714256, -2.133303, 1, 0.3254902, 0, 1,
-1.587605, 0.739802, -0.8495252, 1, 0.3294118, 0, 1,
-1.577771, -0.6427956, -1.449741, 1, 0.3372549, 0, 1,
-1.568304, 0.5672789, -1.374531, 1, 0.3411765, 0, 1,
-1.567139, -1.131917, -2.361345, 1, 0.3490196, 0, 1,
-1.565659, 0.04393546, -0.7502832, 1, 0.3529412, 0, 1,
-1.564211, 0.255397, -0.6486236, 1, 0.3607843, 0, 1,
-1.562952, 0.1592335, -1.733781, 1, 0.3647059, 0, 1,
-1.560164, -0.8617303, -2.833982, 1, 0.372549, 0, 1,
-1.553972, -0.1224468, -1.30333, 1, 0.3764706, 0, 1,
-1.544031, 0.2476431, -1.058634, 1, 0.3843137, 0, 1,
-1.531051, 0.5917339, -0.04352171, 1, 0.3882353, 0, 1,
-1.529939, -0.7708703, -0.3317517, 1, 0.3960784, 0, 1,
-1.518543, 1.731598, -1.106341, 1, 0.4039216, 0, 1,
-1.502008, -0.7210085, -2.780704, 1, 0.4078431, 0, 1,
-1.497092, 0.6765586, -1.033515, 1, 0.4156863, 0, 1,
-1.488675, -1.014129, -0.8871968, 1, 0.4196078, 0, 1,
-1.47941, 0.2291828, -0.5167571, 1, 0.427451, 0, 1,
-1.476656, -0.4361443, -2.279723, 1, 0.4313726, 0, 1,
-1.474884, -0.7673197, -3.059002, 1, 0.4392157, 0, 1,
-1.474013, -1.494543, -0.8805091, 1, 0.4431373, 0, 1,
-1.462795, 1.063942, -1.547366, 1, 0.4509804, 0, 1,
-1.462503, -1.934928, -2.570342, 1, 0.454902, 0, 1,
-1.456317, 0.7453237, -2.571282, 1, 0.4627451, 0, 1,
-1.449488, 0.2096032, -0.9201669, 1, 0.4666667, 0, 1,
-1.442277, -0.5817117, -1.27802, 1, 0.4745098, 0, 1,
-1.431928, -1.054387, -2.089762, 1, 0.4784314, 0, 1,
-1.421117, -0.2104976, -1.719699, 1, 0.4862745, 0, 1,
-1.412692, -0.7521517, -2.712126, 1, 0.4901961, 0, 1,
-1.387215, -2.046073, -3.096072, 1, 0.4980392, 0, 1,
-1.386488, -0.06140707, -2.212794, 1, 0.5058824, 0, 1,
-1.381095, -1.434596, -4.331134, 1, 0.509804, 0, 1,
-1.37275, 0.492211, -1.044331, 1, 0.5176471, 0, 1,
-1.369362, -0.6860251, -1.097597, 1, 0.5215687, 0, 1,
-1.367071, 0.2331211, 0.436121, 1, 0.5294118, 0, 1,
-1.36387, -1.420923, -3.574657, 1, 0.5333334, 0, 1,
-1.334067, -3.175875, -0.7162251, 1, 0.5411765, 0, 1,
-1.315672, 1.155911, -3.231754, 1, 0.5450981, 0, 1,
-1.314152, -0.7809783, -0.2898967, 1, 0.5529412, 0, 1,
-1.313432, 0.278699, -3.283149, 1, 0.5568628, 0, 1,
-1.303117, -0.4314382, -0.8446836, 1, 0.5647059, 0, 1,
-1.299099, 1.056523, -1.085283, 1, 0.5686275, 0, 1,
-1.294295, 0.3922296, -0.6926967, 1, 0.5764706, 0, 1,
-1.290122, 1.350647, -0.2537639, 1, 0.5803922, 0, 1,
-1.286766, 2.127301, 0.2046845, 1, 0.5882353, 0, 1,
-1.28183, -0.9824603, -1.599915, 1, 0.5921569, 0, 1,
-1.279413, -0.3532477, -1.490622, 1, 0.6, 0, 1,
-1.279367, -0.4492516, -3.08347, 1, 0.6078432, 0, 1,
-1.277419, 1.596561, -0.5045064, 1, 0.6117647, 0, 1,
-1.268472, 0.4747439, -2.242394, 1, 0.6196079, 0, 1,
-1.262598, -0.01352717, -0.9176052, 1, 0.6235294, 0, 1,
-1.261083, -0.7574167, -3.128659, 1, 0.6313726, 0, 1,
-1.259656, 0.3311945, 0.773035, 1, 0.6352941, 0, 1,
-1.255037, -0.1174756, -1.847146, 1, 0.6431373, 0, 1,
-1.250099, -1.34348, -1.303545, 1, 0.6470588, 0, 1,
-1.245808, -0.8779659, -2.287565, 1, 0.654902, 0, 1,
-1.243644, -2.468383, -1.676962, 1, 0.6588235, 0, 1,
-1.241383, 0.3338146, 0.07666325, 1, 0.6666667, 0, 1,
-1.238829, -0.8930346, -1.362758, 1, 0.6705883, 0, 1,
-1.237925, 0.06111262, -2.073355, 1, 0.6784314, 0, 1,
-1.234357, 1.264316, -0.8844248, 1, 0.682353, 0, 1,
-1.231993, 2.480902, 0.3079253, 1, 0.6901961, 0, 1,
-1.230414, 1.394208, -0.2949861, 1, 0.6941177, 0, 1,
-1.217406, -0.2397429, -0.9831687, 1, 0.7019608, 0, 1,
-1.211294, 0.2758621, -1.401802, 1, 0.7098039, 0, 1,
-1.206493, 0.05988537, -3.612617, 1, 0.7137255, 0, 1,
-1.204792, -1.453288, -2.653452, 1, 0.7215686, 0, 1,
-1.202618, 0.04090813, -2.694752, 1, 0.7254902, 0, 1,
-1.20173, 0.510525, -0.5405554, 1, 0.7333333, 0, 1,
-1.182776, 1.199847, -2.130512, 1, 0.7372549, 0, 1,
-1.180397, -2.141701, -2.354631, 1, 0.7450981, 0, 1,
-1.177096, 1.279866, -0.7008219, 1, 0.7490196, 0, 1,
-1.166906, 0.4849931, -1.029153, 1, 0.7568628, 0, 1,
-1.166887, -1.676277, -2.445371, 1, 0.7607843, 0, 1,
-1.148973, 0.1026573, -2.326209, 1, 0.7686275, 0, 1,
-1.147071, -0.6433697, -2.133587, 1, 0.772549, 0, 1,
-1.136848, -0.2795363, -1.856797, 1, 0.7803922, 0, 1,
-1.126749, 0.3527581, -0.07007927, 1, 0.7843137, 0, 1,
-1.12031, -0.3638386, -1.338717, 1, 0.7921569, 0, 1,
-1.118538, -0.255934, -2.286261, 1, 0.7960784, 0, 1,
-1.117774, 2.400547, -1.362735, 1, 0.8039216, 0, 1,
-1.11585, -0.5765904, -1.805082, 1, 0.8117647, 0, 1,
-1.108473, -0.352902, -5.184187, 1, 0.8156863, 0, 1,
-1.106392, -1.053198, -1.967812, 1, 0.8235294, 0, 1,
-1.094827, -0.160488, -2.105899, 1, 0.827451, 0, 1,
-1.094708, -0.2922744, -2.165821, 1, 0.8352941, 0, 1,
-1.092839, -0.4928125, -1.923777, 1, 0.8392157, 0, 1,
-1.089116, -1.195834, -1.018376, 1, 0.8470588, 0, 1,
-1.085124, -0.5622469, -3.204875, 1, 0.8509804, 0, 1,
-1.084909, 0.3262011, -2.100986, 1, 0.8588235, 0, 1,
-1.08292, -1.490536, -1.770929, 1, 0.8627451, 0, 1,
-1.081157, -0.9792634, -0.4368538, 1, 0.8705882, 0, 1,
-1.063872, 1.581138, 1.126338, 1, 0.8745098, 0, 1,
-1.063712, 1.629866, 0.4907396, 1, 0.8823529, 0, 1,
-1.062992, 0.2786918, -1.224028, 1, 0.8862745, 0, 1,
-1.05679, 0.766871, -0.2720123, 1, 0.8941177, 0, 1,
-1.05578, -0.5673849, -1.601367, 1, 0.8980392, 0, 1,
-1.036032, -0.08991381, -0.2143209, 1, 0.9058824, 0, 1,
-1.031175, 2.000149, 0.1696438, 1, 0.9137255, 0, 1,
-1.011411, 1.217094, -0.9673128, 1, 0.9176471, 0, 1,
-0.9985682, 1.331971, 1.904737, 1, 0.9254902, 0, 1,
-0.9860079, 0.5392271, -0.9640083, 1, 0.9294118, 0, 1,
-0.9800557, 1.394998, -0.1583154, 1, 0.9372549, 0, 1,
-0.9723147, 0.8781154, 0.9583207, 1, 0.9411765, 0, 1,
-0.9716338, -0.8158816, -2.028785, 1, 0.9490196, 0, 1,
-0.9696258, 0.1687556, -2.351584, 1, 0.9529412, 0, 1,
-0.9695551, -1.782715, -3.06008, 1, 0.9607843, 0, 1,
-0.9591815, -0.6560643, 0.2099192, 1, 0.9647059, 0, 1,
-0.9511114, 0.5238278, -2.323715, 1, 0.972549, 0, 1,
-0.9457079, 0.5562723, -1.563945, 1, 0.9764706, 0, 1,
-0.945006, -0.5856879, 0.2879096, 1, 0.9843137, 0, 1,
-0.9415899, -0.8569588, -3.103295, 1, 0.9882353, 0, 1,
-0.9363952, -1.339209, -1.922874, 1, 0.9960784, 0, 1,
-0.933853, -0.4009274, -2.173609, 0.9960784, 1, 0, 1,
-0.9317848, 0.7196416, -2.554791, 0.9921569, 1, 0, 1,
-0.9282689, 0.9309708, -2.646346, 0.9843137, 1, 0, 1,
-0.9282134, -0.6025654, -2.9534, 0.9803922, 1, 0, 1,
-0.9231221, 1.521806, -0.6000813, 0.972549, 1, 0, 1,
-0.9184111, -0.7239001, -2.039511, 0.9686275, 1, 0, 1,
-0.91447, -0.09798933, -1.643619, 0.9607843, 1, 0, 1,
-0.9102668, -1.279787, -1.899628, 0.9568627, 1, 0, 1,
-0.9019312, 1.040338, -1.745558, 0.9490196, 1, 0, 1,
-0.899725, -0.6158544, -2.262738, 0.945098, 1, 0, 1,
-0.8863286, 0.1608991, -2.025058, 0.9372549, 1, 0, 1,
-0.8845854, 0.4122157, -1.764579, 0.9333333, 1, 0, 1,
-0.8809389, -0.4501531, -2.486744, 0.9254902, 1, 0, 1,
-0.8802432, 1.253774, 0.8099968, 0.9215686, 1, 0, 1,
-0.8794884, -0.3489433, -2.543541, 0.9137255, 1, 0, 1,
-0.8660398, -0.8502405, -2.622146, 0.9098039, 1, 0, 1,
-0.8650433, 1.859218, -0.2903783, 0.9019608, 1, 0, 1,
-0.8627487, 0.7130421, -1.887318, 0.8941177, 1, 0, 1,
-0.8624304, 2.14075, -0.228514, 0.8901961, 1, 0, 1,
-0.8615298, 1.445229, -1.356647, 0.8823529, 1, 0, 1,
-0.8554782, -0.05565361, -1.079186, 0.8784314, 1, 0, 1,
-0.8537086, 0.1914307, -2.288181, 0.8705882, 1, 0, 1,
-0.8532181, 0.5569978, -0.1401097, 0.8666667, 1, 0, 1,
-0.84726, 0.8149623, -0.9651116, 0.8588235, 1, 0, 1,
-0.8444042, 0.2543824, -0.8166523, 0.854902, 1, 0, 1,
-0.8361849, -0.2029676, -1.195233, 0.8470588, 1, 0, 1,
-0.8344796, 1.442337, -1.339681, 0.8431373, 1, 0, 1,
-0.823043, -0.189655, -1.591872, 0.8352941, 1, 0, 1,
-0.8214555, 2.051362, -0.3029791, 0.8313726, 1, 0, 1,
-0.8199707, 0.4257955, -1.448749, 0.8235294, 1, 0, 1,
-0.8182034, -0.1144602, -1.678246, 0.8196079, 1, 0, 1,
-0.816254, -1.033212, -2.715493, 0.8117647, 1, 0, 1,
-0.8159816, 1.067377, -2.203484, 0.8078431, 1, 0, 1,
-0.8104572, 0.3799451, -0.1919663, 0.8, 1, 0, 1,
-0.8062965, 1.081981, -0.7502607, 0.7921569, 1, 0, 1,
-0.7974626, -0.8746747, -2.175126, 0.7882353, 1, 0, 1,
-0.7926946, -1.675255, -3.113958, 0.7803922, 1, 0, 1,
-0.7922255, -1.904392, -1.005495, 0.7764706, 1, 0, 1,
-0.7845718, -1.533448, -1.7588, 0.7686275, 1, 0, 1,
-0.78434, 1.194929, -0.4077055, 0.7647059, 1, 0, 1,
-0.7778602, -0.4505539, -1.645678, 0.7568628, 1, 0, 1,
-0.7723604, 0.4228289, -0.7657489, 0.7529412, 1, 0, 1,
-0.7718205, -1.461143, -3.532128, 0.7450981, 1, 0, 1,
-0.7714427, -0.3263809, -2.244337, 0.7411765, 1, 0, 1,
-0.7701424, -1.015552, -2.244, 0.7333333, 1, 0, 1,
-0.7657545, -1.092021, -1.395822, 0.7294118, 1, 0, 1,
-0.7567797, 0.5538823, 0.2779571, 0.7215686, 1, 0, 1,
-0.7559649, 0.800166, -1.510703, 0.7176471, 1, 0, 1,
-0.7445769, 0.2051633, 0.007858415, 0.7098039, 1, 0, 1,
-0.7423577, -1.932317, -2.652553, 0.7058824, 1, 0, 1,
-0.7410238, 0.5777485, -2.047965, 0.6980392, 1, 0, 1,
-0.7333111, -0.1243648, -0.4851857, 0.6901961, 1, 0, 1,
-0.7268593, 0.2957564, -0.1314919, 0.6862745, 1, 0, 1,
-0.7261922, 0.1567398, -0.7350764, 0.6784314, 1, 0, 1,
-0.7234174, 1.024359, -1.519337, 0.6745098, 1, 0, 1,
-0.7217147, -0.1896849, -1.314898, 0.6666667, 1, 0, 1,
-0.7154313, -1.200454, -3.230042, 0.6627451, 1, 0, 1,
-0.7117774, 1.66156, 1.170822, 0.654902, 1, 0, 1,
-0.709985, -0.3321173, -3.7702, 0.6509804, 1, 0, 1,
-0.7077326, -0.709518, -3.187229, 0.6431373, 1, 0, 1,
-0.7044175, -1.245828, -3.842801, 0.6392157, 1, 0, 1,
-0.7000135, -0.09638758, -2.183149, 0.6313726, 1, 0, 1,
-0.6992963, -0.08565186, -2.758469, 0.627451, 1, 0, 1,
-0.6947028, 0.01808298, -1.406373, 0.6196079, 1, 0, 1,
-0.6934762, -0.3565257, -0.5906329, 0.6156863, 1, 0, 1,
-0.687266, -2.631159, -3.373215, 0.6078432, 1, 0, 1,
-0.6864269, -1.863464, -0.5021241, 0.6039216, 1, 0, 1,
-0.6734726, -0.04620713, -2.781853, 0.5960785, 1, 0, 1,
-0.6726211, -0.9153712, -1.869495, 0.5882353, 1, 0, 1,
-0.6721289, -1.575799, -4.287299, 0.5843138, 1, 0, 1,
-0.6694697, -0.9557372, -1.743006, 0.5764706, 1, 0, 1,
-0.6630495, 0.4379228, -1.13537, 0.572549, 1, 0, 1,
-0.65584, 0.07560593, -2.566247, 0.5647059, 1, 0, 1,
-0.6550075, -1.579348, -2.872127, 0.5607843, 1, 0, 1,
-0.6523849, 1.045635, -1.813029, 0.5529412, 1, 0, 1,
-0.644484, -1.793622, -1.814099, 0.5490196, 1, 0, 1,
-0.6422733, -1.46542, -1.543629, 0.5411765, 1, 0, 1,
-0.6415721, 1.293339, 0.8098364, 0.5372549, 1, 0, 1,
-0.6386745, -0.003994889, -0.6077647, 0.5294118, 1, 0, 1,
-0.6323544, 1.240857, 0.7604586, 0.5254902, 1, 0, 1,
-0.6299204, 0.2139075, -1.972234, 0.5176471, 1, 0, 1,
-0.6273925, -0.8543288, -2.020948, 0.5137255, 1, 0, 1,
-0.6266324, -0.6391996, -2.860188, 0.5058824, 1, 0, 1,
-0.6218093, 0.5468376, -1.918854, 0.5019608, 1, 0, 1,
-0.6198519, -0.3611048, -2.406585, 0.4941176, 1, 0, 1,
-0.6166966, 2.41385, -0.1887573, 0.4862745, 1, 0, 1,
-0.6157093, -1.551331, -1.407995, 0.4823529, 1, 0, 1,
-0.6139212, 0.7309881, 0.2818803, 0.4745098, 1, 0, 1,
-0.6129149, -0.09722446, -1.938388, 0.4705882, 1, 0, 1,
-0.6114883, -1.479303, -4.132348, 0.4627451, 1, 0, 1,
-0.6043165, -0.5286353, -3.486361, 0.4588235, 1, 0, 1,
-0.6028083, -0.1052323, -1.73565, 0.4509804, 1, 0, 1,
-0.6016623, -0.6509617, -2.111516, 0.4470588, 1, 0, 1,
-0.601313, -0.5632213, -2.862457, 0.4392157, 1, 0, 1,
-0.5973122, -0.7906775, -2.134075, 0.4352941, 1, 0, 1,
-0.5966659, -0.9524546, -2.323485, 0.427451, 1, 0, 1,
-0.5954724, -1.996572, -2.186754, 0.4235294, 1, 0, 1,
-0.5917285, 0.1752739, -1.051405, 0.4156863, 1, 0, 1,
-0.5859322, -0.593734, -2.21096, 0.4117647, 1, 0, 1,
-0.5856782, -0.2205024, -3.136162, 0.4039216, 1, 0, 1,
-0.5848237, -0.3316371, -2.809445, 0.3960784, 1, 0, 1,
-0.5836155, 1.496427, -0.255843, 0.3921569, 1, 0, 1,
-0.5821895, -0.7155457, -2.40503, 0.3843137, 1, 0, 1,
-0.5735223, -0.4675928, -3.264934, 0.3803922, 1, 0, 1,
-0.572912, -0.04825826, -2.093623, 0.372549, 1, 0, 1,
-0.5701689, 0.5685449, 0.4215172, 0.3686275, 1, 0, 1,
-0.5527717, 0.3973878, -0.682406, 0.3607843, 1, 0, 1,
-0.5527623, 1.131313, -2.377423, 0.3568628, 1, 0, 1,
-0.5500249, 0.4435754, -1.300282, 0.3490196, 1, 0, 1,
-0.5417938, -0.4417011, -3.514453, 0.345098, 1, 0, 1,
-0.5290879, -1.518299, -4.422103, 0.3372549, 1, 0, 1,
-0.528255, 0.9750705, 0.8025064, 0.3333333, 1, 0, 1,
-0.5270866, 0.8893985, 1.128293, 0.3254902, 1, 0, 1,
-0.5231035, 0.3439947, -0.5349675, 0.3215686, 1, 0, 1,
-0.5220506, -0.1060763, -1.537929, 0.3137255, 1, 0, 1,
-0.5208449, 0.1465157, -1.276616, 0.3098039, 1, 0, 1,
-0.5198852, 0.4782449, -1.758942, 0.3019608, 1, 0, 1,
-0.5151776, 0.7691034, 0.185015, 0.2941177, 1, 0, 1,
-0.5028611, -0.7299014, -0.3003972, 0.2901961, 1, 0, 1,
-0.5016938, 0.4231069, -2.214282, 0.282353, 1, 0, 1,
-0.5010094, -1.681314, -2.577425, 0.2784314, 1, 0, 1,
-0.4993467, 1.02665, -0.4834104, 0.2705882, 1, 0, 1,
-0.4958864, 0.3668207, -1.159438, 0.2666667, 1, 0, 1,
-0.4933836, 0.1999839, -1.537525, 0.2588235, 1, 0, 1,
-0.4915216, 0.3837993, -1.120156, 0.254902, 1, 0, 1,
-0.4878502, 0.9713033, 0.2499708, 0.2470588, 1, 0, 1,
-0.4866234, -0.6489999, -3.810186, 0.2431373, 1, 0, 1,
-0.4847849, -0.9474351, -3.513784, 0.2352941, 1, 0, 1,
-0.4838587, 0.2576315, -0.6566426, 0.2313726, 1, 0, 1,
-0.4829991, 1.029091, -0.7622637, 0.2235294, 1, 0, 1,
-0.4761942, 1.505278, -1.194699, 0.2196078, 1, 0, 1,
-0.4741765, 0.7108167, -0.1727287, 0.2117647, 1, 0, 1,
-0.4678164, -1.094201, -3.638698, 0.2078431, 1, 0, 1,
-0.4675898, -0.1426426, -2.267327, 0.2, 1, 0, 1,
-0.4669896, 0.4600629, -0.4249333, 0.1921569, 1, 0, 1,
-0.4603665, -0.4291836, -3.034985, 0.1882353, 1, 0, 1,
-0.4576118, 0.04325766, -1.163621, 0.1803922, 1, 0, 1,
-0.4573603, -2.030799, -1.748296, 0.1764706, 1, 0, 1,
-0.4533798, -0.7901674, -5.63506, 0.1686275, 1, 0, 1,
-0.452641, 0.528625, -2.664497, 0.1647059, 1, 0, 1,
-0.4521852, 0.7559, 0.320633, 0.1568628, 1, 0, 1,
-0.4493286, -1.161384, -1.850626, 0.1529412, 1, 0, 1,
-0.4467795, 0.8487771, -0.4130084, 0.145098, 1, 0, 1,
-0.4421401, -2.912216, -3.375342, 0.1411765, 1, 0, 1,
-0.4382753, 0.815523, 0.4168556, 0.1333333, 1, 0, 1,
-0.430988, -0.06354573, -1.919803, 0.1294118, 1, 0, 1,
-0.4271847, 1.98826, 0.1489044, 0.1215686, 1, 0, 1,
-0.4266985, 0.006215448, -1.639184, 0.1176471, 1, 0, 1,
-0.4222172, -0.4699371, -3.616558, 0.1098039, 1, 0, 1,
-0.41284, 1.750259, -1.515478, 0.1058824, 1, 0, 1,
-0.4054099, -0.8256902, -2.935955, 0.09803922, 1, 0, 1,
-0.4051017, 0.3071352, -1.458767, 0.09019608, 1, 0, 1,
-0.4023508, -1.124234, -2.137012, 0.08627451, 1, 0, 1,
-0.3995747, 0.1319095, -2.684948, 0.07843138, 1, 0, 1,
-0.3995378, -0.08026113, -1.40407, 0.07450981, 1, 0, 1,
-0.3983447, -0.7907228, -3.819187, 0.06666667, 1, 0, 1,
-0.3885387, -0.4494233, -2.807979, 0.0627451, 1, 0, 1,
-0.3860976, 0.1552242, -0.5320094, 0.05490196, 1, 0, 1,
-0.3846165, -1.004517, -1.955526, 0.05098039, 1, 0, 1,
-0.3845893, 0.03963765, -3.019249, 0.04313726, 1, 0, 1,
-0.3831663, 1.241011, 0.7402615, 0.03921569, 1, 0, 1,
-0.3797423, 0.3237396, -1.111693, 0.03137255, 1, 0, 1,
-0.3789503, -0.2999052, 0.2013725, 0.02745098, 1, 0, 1,
-0.3784793, 0.7395426, 0.3861797, 0.01960784, 1, 0, 1,
-0.378056, 0.09843431, -1.742978, 0.01568628, 1, 0, 1,
-0.3757321, 1.023016, -0.1964055, 0.007843138, 1, 0, 1,
-0.3739443, 0.2009623, -2.219599, 0.003921569, 1, 0, 1,
-0.3714652, 0.5072723, -0.6511637, 0, 1, 0.003921569, 1,
-0.3697869, -0.5950909, -3.112508, 0, 1, 0.01176471, 1,
-0.369741, 1.162109, -0.7723127, 0, 1, 0.01568628, 1,
-0.3584614, -0.4106063, -5.601594, 0, 1, 0.02352941, 1,
-0.3584376, 1.740328, 1.652326, 0, 1, 0.02745098, 1,
-0.3582756, 0.1309582, -0.141576, 0, 1, 0.03529412, 1,
-0.3574353, -1.355095, -1.567396, 0, 1, 0.03921569, 1,
-0.3572985, 2.029607, -2.239501, 0, 1, 0.04705882, 1,
-0.3498839, -0.5192536, -2.198403, 0, 1, 0.05098039, 1,
-0.3471479, -1.56256, -3.248101, 0, 1, 0.05882353, 1,
-0.3460357, -0.3237702, -2.822887, 0, 1, 0.0627451, 1,
-0.3459982, -0.8347861, -2.583579, 0, 1, 0.07058824, 1,
-0.3420505, -0.385573, -4.152564, 0, 1, 0.07450981, 1,
-0.339926, -1.660365, -3.634466, 0, 1, 0.08235294, 1,
-0.3385636, -0.5441689, -1.602072, 0, 1, 0.08627451, 1,
-0.33405, -0.2347069, -2.280005, 0, 1, 0.09411765, 1,
-0.3324103, 0.6458167, -1.881297, 0, 1, 0.1019608, 1,
-0.3243164, 1.73214, -0.6764756, 0, 1, 0.1058824, 1,
-0.3204862, 2.130925, -0.2983479, 0, 1, 0.1137255, 1,
-0.3202274, -0.2774528, -1.074467, 0, 1, 0.1176471, 1,
-0.3186894, -0.004771505, -1.897069, 0, 1, 0.1254902, 1,
-0.315668, 0.1463498, -1.986179, 0, 1, 0.1294118, 1,
-0.3150843, -0.114133, -2.186445, 0, 1, 0.1372549, 1,
-0.3147108, 0.5678672, -1.272343, 0, 1, 0.1411765, 1,
-0.3129465, -0.6459852, -1.778775, 0, 1, 0.1490196, 1,
-0.3094889, 0.9069443, -0.496824, 0, 1, 0.1529412, 1,
-0.3067644, -0.3580932, -1.980202, 0, 1, 0.1607843, 1,
-0.3063105, 0.7705578, -0.6670122, 0, 1, 0.1647059, 1,
-0.3062086, 1.149635, -0.1832419, 0, 1, 0.172549, 1,
-0.3058912, -0.3294688, -4.117877, 0, 1, 0.1764706, 1,
-0.3035868, -1.989887, -2.731257, 0, 1, 0.1843137, 1,
-0.2967484, -0.7136167, -0.6971327, 0, 1, 0.1882353, 1,
-0.2899909, -0.3280789, -0.8014174, 0, 1, 0.1960784, 1,
-0.2894517, 1.225242, 0.8292013, 0, 1, 0.2039216, 1,
-0.2849023, 0.1350809, -2.645367, 0, 1, 0.2078431, 1,
-0.2834311, 1.855327, -0.03132926, 0, 1, 0.2156863, 1,
-0.2788103, -0.795021, -2.750176, 0, 1, 0.2196078, 1,
-0.2784643, -0.6401213, -3.454006, 0, 1, 0.227451, 1,
-0.2702171, 0.3873281, -0.2321391, 0, 1, 0.2313726, 1,
-0.266958, 0.979313, -0.4528565, 0, 1, 0.2392157, 1,
-0.2662413, 0.6759415, -1.46144, 0, 1, 0.2431373, 1,
-0.2548753, 1.066237, -1.238716, 0, 1, 0.2509804, 1,
-0.254325, 0.526337, 1.108321, 0, 1, 0.254902, 1,
-0.2522653, 0.7901579, -0.5418401, 0, 1, 0.2627451, 1,
-0.2512838, 1.953564, -0.479782, 0, 1, 0.2666667, 1,
-0.2499149, -0.5263258, -2.549405, 0, 1, 0.2745098, 1,
-0.2476356, 0.2622059, -0.4951593, 0, 1, 0.2784314, 1,
-0.2425715, 0.8597462, -1.105353, 0, 1, 0.2862745, 1,
-0.239657, -1.36931, -1.68, 0, 1, 0.2901961, 1,
-0.2362071, -0.623606, -3.297897, 0, 1, 0.2980392, 1,
-0.2349822, -1.728067, -2.945863, 0, 1, 0.3058824, 1,
-0.2333284, 1.861206, 0.5784859, 0, 1, 0.3098039, 1,
-0.2304969, 0.482798, -1.297636, 0, 1, 0.3176471, 1,
-0.2303395, 0.1836989, -0.004172063, 0, 1, 0.3215686, 1,
-0.2272258, 1.450025, -1.548921, 0, 1, 0.3294118, 1,
-0.2270636, 0.361342, -1.357727, 0, 1, 0.3333333, 1,
-0.2262749, -0.9396383, -2.36566, 0, 1, 0.3411765, 1,
-0.2241081, -1.123778, -2.854832, 0, 1, 0.345098, 1,
-0.2232085, -0.860241, -3.116255, 0, 1, 0.3529412, 1,
-0.2163897, -1.717922, -1.787078, 0, 1, 0.3568628, 1,
-0.2161008, 0.2737769, -0.4846196, 0, 1, 0.3647059, 1,
-0.2131595, -0.7687461, -4.711083, 0, 1, 0.3686275, 1,
-0.2124901, -1.20921, -4.83208, 0, 1, 0.3764706, 1,
-0.2036592, 0.1646337, -0.3047132, 0, 1, 0.3803922, 1,
-0.202827, -1.24731, -3.04557, 0, 1, 0.3882353, 1,
-0.2014547, 0.03878409, -0.7742829, 0, 1, 0.3921569, 1,
-0.2002401, -0.2681531, -1.626215, 0, 1, 0.4, 1,
-0.1975827, 0.7355334, -1.565226, 0, 1, 0.4078431, 1,
-0.1953934, 0.7496287, -0.09960626, 0, 1, 0.4117647, 1,
-0.1932643, -0.167494, -2.780499, 0, 1, 0.4196078, 1,
-0.1893214, -0.6241886, -3.942445, 0, 1, 0.4235294, 1,
-0.1880322, 0.04239077, -1.572687, 0, 1, 0.4313726, 1,
-0.1873224, -2.109533, -4.621807, 0, 1, 0.4352941, 1,
-0.1863214, -1.254703, -3.934222, 0, 1, 0.4431373, 1,
-0.1861512, -0.5666201, -3.507855, 0, 1, 0.4470588, 1,
-0.183345, -0.449979, -2.661085, 0, 1, 0.454902, 1,
-0.1782862, -0.1149926, -4.021916, 0, 1, 0.4588235, 1,
-0.1779402, 0.5159922, -0.5165575, 0, 1, 0.4666667, 1,
-0.1755284, 0.09904707, -0.2764585, 0, 1, 0.4705882, 1,
-0.1753531, 3.273528, -0.2608302, 0, 1, 0.4784314, 1,
-0.1749039, -1.78171, -2.629075, 0, 1, 0.4823529, 1,
-0.1744081, -0.6841187, -3.259537, 0, 1, 0.4901961, 1,
-0.172786, 0.9030637, -0.1434812, 0, 1, 0.4941176, 1,
-0.1727199, -0.6033242, -0.7632442, 0, 1, 0.5019608, 1,
-0.1692658, -0.1339542, -1.977609, 0, 1, 0.509804, 1,
-0.1678225, 0.6948633, -1.271008, 0, 1, 0.5137255, 1,
-0.1648937, 0.5629886, 0.1553017, 0, 1, 0.5215687, 1,
-0.1603401, 1.265835, 0.1846661, 0, 1, 0.5254902, 1,
-0.1597214, 0.3280554, -1.55706, 0, 1, 0.5333334, 1,
-0.1577875, 0.1750256, 0.09895366, 0, 1, 0.5372549, 1,
-0.1572838, -1.181574, -1.58452, 0, 1, 0.5450981, 1,
-0.156096, 0.2024633, -0.1942174, 0, 1, 0.5490196, 1,
-0.1542118, -1.386815, -3.883752, 0, 1, 0.5568628, 1,
-0.1535251, -0.7222534, -2.860893, 0, 1, 0.5607843, 1,
-0.151919, 0.3999477, -0.06193887, 0, 1, 0.5686275, 1,
-0.1506662, -0.3398982, -3.595509, 0, 1, 0.572549, 1,
-0.1501891, 1.800495, -0.6631758, 0, 1, 0.5803922, 1,
-0.1486292, -0.5870505, -3.568155, 0, 1, 0.5843138, 1,
-0.1460897, -0.3309631, -0.7871721, 0, 1, 0.5921569, 1,
-0.1435233, 1.504582, 1.053998, 0, 1, 0.5960785, 1,
-0.1433513, 0.2181856, -1.143631, 0, 1, 0.6039216, 1,
-0.1416054, -1.762046, -2.835099, 0, 1, 0.6117647, 1,
-0.141179, 0.08870797, -0.614647, 0, 1, 0.6156863, 1,
-0.1405281, -0.1887008, -0.8913249, 0, 1, 0.6235294, 1,
-0.1396153, 0.9995335, -1.488305, 0, 1, 0.627451, 1,
-0.1385538, -0.3868179, -3.099018, 0, 1, 0.6352941, 1,
-0.1383203, -0.1067266, -1.991755, 0, 1, 0.6392157, 1,
-0.1328691, -0.7311921, -2.850006, 0, 1, 0.6470588, 1,
-0.1268937, 0.6553165, 0.5112637, 0, 1, 0.6509804, 1,
-0.1191328, 0.9878809, -1.175291, 0, 1, 0.6588235, 1,
-0.1137222, 0.4865007, -0.4698331, 0, 1, 0.6627451, 1,
-0.1111287, -0.9697056, -4.768835, 0, 1, 0.6705883, 1,
-0.1103963, -0.3263181, -2.348042, 0, 1, 0.6745098, 1,
-0.1100368, -0.04879, -3.585786, 0, 1, 0.682353, 1,
-0.1069536, -0.3316203, -1.171135, 0, 1, 0.6862745, 1,
-0.1057028, 0.3765153, -0.6787846, 0, 1, 0.6941177, 1,
-0.1039357, -1.045037, -4.07389, 0, 1, 0.7019608, 1,
-0.1009219, -0.5281034, -2.219854, 0, 1, 0.7058824, 1,
-0.09913353, 2.441585, 0.7228121, 0, 1, 0.7137255, 1,
-0.09781787, 0.3595282, -0.4410578, 0, 1, 0.7176471, 1,
-0.09690879, 0.3612497, -0.7432531, 0, 1, 0.7254902, 1,
-0.09462667, -0.3394617, -2.305729, 0, 1, 0.7294118, 1,
-0.09188337, 0.1056613, 0.1581311, 0, 1, 0.7372549, 1,
-0.09165362, 0.2144886, -1.695238, 0, 1, 0.7411765, 1,
-0.08968069, -0.1829182, -2.138707, 0, 1, 0.7490196, 1,
-0.08614299, 1.642989, -0.6615817, 0, 1, 0.7529412, 1,
-0.08466373, 2.233053, 0.9761072, 0, 1, 0.7607843, 1,
-0.0832742, 1.162275, -0.4900429, 0, 1, 0.7647059, 1,
-0.07799711, -0.2297242, -3.458929, 0, 1, 0.772549, 1,
-0.07748421, 1.075994, -2.367498, 0, 1, 0.7764706, 1,
-0.07361628, -0.3989397, -3.937255, 0, 1, 0.7843137, 1,
-0.06948951, 1.482056, 1.01789, 0, 1, 0.7882353, 1,
-0.06717235, 0.4075822, -0.4345988, 0, 1, 0.7960784, 1,
-0.06309119, 1.224485, -1.532507, 0, 1, 0.8039216, 1,
-0.0603803, 1.294544, 1.30749, 0, 1, 0.8078431, 1,
-0.05929274, 1.535437, 0.5445673, 0, 1, 0.8156863, 1,
-0.05918586, 1.253471, -0.3835143, 0, 1, 0.8196079, 1,
-0.05816286, -0.04867039, -3.01789, 0, 1, 0.827451, 1,
-0.05512186, -2.341672, -4.074332, 0, 1, 0.8313726, 1,
-0.05435372, -0.5672943, -4.611747, 0, 1, 0.8392157, 1,
-0.05174124, -0.3381963, -1.815529, 0, 1, 0.8431373, 1,
-0.05121794, 2.155362, -0.1512611, 0, 1, 0.8509804, 1,
-0.05059067, 1.464824, 0.7158602, 0, 1, 0.854902, 1,
-0.04631273, 1.559335, -1.642356, 0, 1, 0.8627451, 1,
-0.04565058, -0.6374521, -1.61006, 0, 1, 0.8666667, 1,
-0.04524747, -1.056598, -3.729004, 0, 1, 0.8745098, 1,
-0.04222876, 0.287013, -1.83121, 0, 1, 0.8784314, 1,
-0.04139315, -0.3523344, -2.488686, 0, 1, 0.8862745, 1,
-0.04123608, -0.8317708, -1.004058, 0, 1, 0.8901961, 1,
-0.03958598, -0.9563981, -2.322555, 0, 1, 0.8980392, 1,
-0.03721085, -0.3676807, -3.343182, 0, 1, 0.9058824, 1,
-0.03676835, 1.05559, 0.3165806, 0, 1, 0.9098039, 1,
-0.02903293, -2.003363, -1.269648, 0, 1, 0.9176471, 1,
-0.02743533, -0.9222956, -3.600142, 0, 1, 0.9215686, 1,
-0.02664675, 0.4710395, -0.224582, 0, 1, 0.9294118, 1,
-0.02548582, 0.9486865, 1.093645, 0, 1, 0.9333333, 1,
-0.02390839, 0.07369733, 0.4756996, 0, 1, 0.9411765, 1,
-0.02265724, -0.6266128, -3.437716, 0, 1, 0.945098, 1,
-0.02112148, -1.206613, -3.706634, 0, 1, 0.9529412, 1,
-0.02091182, 0.2759027, 0.3822098, 0, 1, 0.9568627, 1,
-0.02079161, 0.1140293, -1.198902, 0, 1, 0.9647059, 1,
-0.01474358, 1.410947, 0.6231331, 0, 1, 0.9686275, 1,
-0.01384154, -1.747187, -3.647028, 0, 1, 0.9764706, 1,
-0.01169976, -0.7426383, -2.120731, 0, 1, 0.9803922, 1,
-0.009820235, -0.3262572, -2.163158, 0, 1, 0.9882353, 1,
-0.007613483, 1.106195, -0.2405862, 0, 1, 0.9921569, 1,
-0.006049446, 0.4797245, -0.8724291, 0, 1, 1, 1,
-0.003730982, -0.1664694, -3.131253, 0, 0.9921569, 1, 1,
-0.002808818, 0.9542194, -0.7578115, 0, 0.9882353, 1, 1,
-0.002655552, -0.04633952, -3.529963, 0, 0.9803922, 1, 1,
0.006681589, -1.732014, 1.650152, 0, 0.9764706, 1, 1,
0.006933569, 0.02880761, -0.6105067, 0, 0.9686275, 1, 1,
0.007874484, 0.8232371, -0.2781409, 0, 0.9647059, 1, 1,
0.01057921, 0.03865153, -0.6547498, 0, 0.9568627, 1, 1,
0.01110807, -0.6345778, 2.863808, 0, 0.9529412, 1, 1,
0.01900041, 0.3964122, -1.093807, 0, 0.945098, 1, 1,
0.02446334, -2.758588, 4.02581, 0, 0.9411765, 1, 1,
0.02494852, 0.6488811, 1.074749, 0, 0.9333333, 1, 1,
0.02764955, 0.02568181, 0.7258748, 0, 0.9294118, 1, 1,
0.04114622, 0.02879213, -0.2331208, 0, 0.9215686, 1, 1,
0.04131764, -0.6216756, 2.469109, 0, 0.9176471, 1, 1,
0.04265229, 0.3768965, -0.6690794, 0, 0.9098039, 1, 1,
0.0469659, 0.8453471, 0.5528349, 0, 0.9058824, 1, 1,
0.06005204, 1.030576, -0.4867299, 0, 0.8980392, 1, 1,
0.06276524, 0.6240591, 1.627467, 0, 0.8901961, 1, 1,
0.067095, -3.049703, 4.22844, 0, 0.8862745, 1, 1,
0.06960005, 0.7347937, -0.1962857, 0, 0.8784314, 1, 1,
0.07697769, -0.9108918, 2.449037, 0, 0.8745098, 1, 1,
0.08716731, 1.234553, 0.1040775, 0, 0.8666667, 1, 1,
0.08857419, -1.1123, 4.007888, 0, 0.8627451, 1, 1,
0.09130023, 0.09360213, 1.571612, 0, 0.854902, 1, 1,
0.09232166, -1.043189, 1.772144, 0, 0.8509804, 1, 1,
0.09664768, 1.053021, 0.7488567, 0, 0.8431373, 1, 1,
0.1067231, 0.2010471, -0.625368, 0, 0.8392157, 1, 1,
0.1078146, 0.5509948, -1.01023, 0, 0.8313726, 1, 1,
0.1104932, -0.4539451, 3.494542, 0, 0.827451, 1, 1,
0.1123684, 0.9081911, 0.5387049, 0, 0.8196079, 1, 1,
0.1127118, -0.3064725, 2.441943, 0, 0.8156863, 1, 1,
0.1172272, 0.55415, -1.303287, 0, 0.8078431, 1, 1,
0.1212582, 0.0008288266, -0.365201, 0, 0.8039216, 1, 1,
0.1285476, 1.103425, 0.4180273, 0, 0.7960784, 1, 1,
0.1302593, 1.649647, 0.3053032, 0, 0.7882353, 1, 1,
0.1317283, 0.6029361, -1.741431, 0, 0.7843137, 1, 1,
0.1388602, 2.040145, -0.5647232, 0, 0.7764706, 1, 1,
0.1395035, 3.266413, 1.092411, 0, 0.772549, 1, 1,
0.1414455, -0.5362978, 5.103499, 0, 0.7647059, 1, 1,
0.1521568, 0.4131548, -1.241303, 0, 0.7607843, 1, 1,
0.1554278, 0.8501853, 0.6487222, 0, 0.7529412, 1, 1,
0.1567119, -0.7283044, 2.403137, 0, 0.7490196, 1, 1,
0.1571519, 0.00899761, 1.074825, 0, 0.7411765, 1, 1,
0.159212, 0.5695634, 0.5450972, 0, 0.7372549, 1, 1,
0.1593371, -1.422687, 2.484057, 0, 0.7294118, 1, 1,
0.1643462, 0.1972916, -0.0366559, 0, 0.7254902, 1, 1,
0.1645079, 0.1048223, 0.6433618, 0, 0.7176471, 1, 1,
0.1647303, 0.937861, 1.77594, 0, 0.7137255, 1, 1,
0.1696914, 0.1106218, 1.354732, 0, 0.7058824, 1, 1,
0.1714437, 0.6349809, 0.8653157, 0, 0.6980392, 1, 1,
0.1721691, -3.062016, 2.618365, 0, 0.6941177, 1, 1,
0.1730589, -0.06000531, 0.7304814, 0, 0.6862745, 1, 1,
0.1821094, 0.5152979, 1.191074, 0, 0.682353, 1, 1,
0.182724, 0.768849, 1.485828, 0, 0.6745098, 1, 1,
0.1827497, -0.2135414, 3.488211, 0, 0.6705883, 1, 1,
0.1828178, -0.6805226, 4.275376, 0, 0.6627451, 1, 1,
0.1829714, -1.463175, 3.16449, 0, 0.6588235, 1, 1,
0.1835949, 0.0238658, 2.191358, 0, 0.6509804, 1, 1,
0.1858997, 0.08130952, -0.3414924, 0, 0.6470588, 1, 1,
0.1959751, 1.233693, 0.6651842, 0, 0.6392157, 1, 1,
0.205949, 0.1067689, 0.6330871, 0, 0.6352941, 1, 1,
0.2101903, -0.8185338, 1.641054, 0, 0.627451, 1, 1,
0.2130319, -1.494519, 3.362666, 0, 0.6235294, 1, 1,
0.2130916, -0.6737388, 2.995092, 0, 0.6156863, 1, 1,
0.2131246, -0.06367593, 2.020163, 0, 0.6117647, 1, 1,
0.2191678, -0.7215829, 2.52715, 0, 0.6039216, 1, 1,
0.2223346, 1.388995, -2.013492, 0, 0.5960785, 1, 1,
0.2227774, 0.8013416, 0.7413793, 0, 0.5921569, 1, 1,
0.2328534, 0.7322, -0.07539742, 0, 0.5843138, 1, 1,
0.2386599, -0.1375319, 2.895684, 0, 0.5803922, 1, 1,
0.2411063, 1.517309, 0.8859548, 0, 0.572549, 1, 1,
0.2411884, 0.3660797, -1.214953, 0, 0.5686275, 1, 1,
0.2428498, 0.1431326, 2.147969, 0, 0.5607843, 1, 1,
0.2494716, -0.2897395, 4.559617, 0, 0.5568628, 1, 1,
0.2498699, 0.399186, -0.7172886, 0, 0.5490196, 1, 1,
0.2529764, -1.184508, 2.373568, 0, 0.5450981, 1, 1,
0.2533322, 0.6664255, 1.29313, 0, 0.5372549, 1, 1,
0.2594469, -1.043625, 2.436679, 0, 0.5333334, 1, 1,
0.2637257, -0.78169, 4.667836, 0, 0.5254902, 1, 1,
0.2694359, 0.08357508, 0.913637, 0, 0.5215687, 1, 1,
0.2705542, 0.04038871, 1.659207, 0, 0.5137255, 1, 1,
0.2705728, 1.316516, 1.500969, 0, 0.509804, 1, 1,
0.2723377, -0.1062314, 0.4473968, 0, 0.5019608, 1, 1,
0.2768067, 0.989646, -0.08388181, 0, 0.4941176, 1, 1,
0.2820683, -0.2998857, 4.832146, 0, 0.4901961, 1, 1,
0.2916034, 0.5149167, 0.2944328, 0, 0.4823529, 1, 1,
0.2944616, -0.7629982, 1.893035, 0, 0.4784314, 1, 1,
0.2960608, -2.139066, 3.733745, 0, 0.4705882, 1, 1,
0.2987548, -0.251478, 4.143116, 0, 0.4666667, 1, 1,
0.3005931, -0.823016, 3.337032, 0, 0.4588235, 1, 1,
0.3018585, -0.5670367, 1.656219, 0, 0.454902, 1, 1,
0.3038475, -0.3489883, 2.307071, 0, 0.4470588, 1, 1,
0.3049528, -0.5941612, 2.473049, 0, 0.4431373, 1, 1,
0.3088092, 0.4865323, 0.224957, 0, 0.4352941, 1, 1,
0.3093438, -0.7867329, 4.080289, 0, 0.4313726, 1, 1,
0.3103057, -0.0498244, 4.074585, 0, 0.4235294, 1, 1,
0.3130966, 0.3378222, 0.6997272, 0, 0.4196078, 1, 1,
0.3131823, 1.539011, 1.130332, 0, 0.4117647, 1, 1,
0.3133213, -0.03995105, 1.34076, 0, 0.4078431, 1, 1,
0.3160321, 1.963284, 1.997221, 0, 0.4, 1, 1,
0.3166809, -0.9604672, 3.572724, 0, 0.3921569, 1, 1,
0.3178585, -1.760997, 2.721095, 0, 0.3882353, 1, 1,
0.3186722, 0.1827371, 0.9239656, 0, 0.3803922, 1, 1,
0.3187597, 1.306137, 0.1543286, 0, 0.3764706, 1, 1,
0.3207096, 0.1847267, 0.7459534, 0, 0.3686275, 1, 1,
0.3223472, -1.075732, 0.5048324, 0, 0.3647059, 1, 1,
0.3248169, -0.3300856, 2.737661, 0, 0.3568628, 1, 1,
0.3264643, 2.250786, -1.382062, 0, 0.3529412, 1, 1,
0.32882, -0.2827171, 2.795933, 0, 0.345098, 1, 1,
0.3296187, 0.3803685, 0.8104317, 0, 0.3411765, 1, 1,
0.3312991, -1.88631, 3.134751, 0, 0.3333333, 1, 1,
0.3367881, -0.9793183, 3.036381, 0, 0.3294118, 1, 1,
0.3429657, -1.15616, 4.581262, 0, 0.3215686, 1, 1,
0.3497642, -0.1381626, 1.906872, 0, 0.3176471, 1, 1,
0.3525257, -2.745143, 5.308797, 0, 0.3098039, 1, 1,
0.3549446, 0.8325417, -2.486481, 0, 0.3058824, 1, 1,
0.3601577, -0.9898359, 2.355736, 0, 0.2980392, 1, 1,
0.3699382, 0.6854421, -0.04319107, 0, 0.2901961, 1, 1,
0.3761091, -0.9913056, 2.531502, 0, 0.2862745, 1, 1,
0.3764629, 0.6206803, 2.169418, 0, 0.2784314, 1, 1,
0.3775253, 0.06506597, 0.8632618, 0, 0.2745098, 1, 1,
0.381939, -1.800292, 4.579948, 0, 0.2666667, 1, 1,
0.3839406, -1.369255, 2.470553, 0, 0.2627451, 1, 1,
0.3861974, -1.031415, 3.778164, 0, 0.254902, 1, 1,
0.3880808, 0.1820524, -0.3395954, 0, 0.2509804, 1, 1,
0.3891625, 0.1206412, 1.912123, 0, 0.2431373, 1, 1,
0.3916405, -0.3733295, 1.23188, 0, 0.2392157, 1, 1,
0.3937025, 0.6363034, 0.230056, 0, 0.2313726, 1, 1,
0.3987483, -1.624249, 3.070343, 0, 0.227451, 1, 1,
0.3998205, 0.2152276, 0.5751918, 0, 0.2196078, 1, 1,
0.4004692, -1.815572, 1.32862, 0, 0.2156863, 1, 1,
0.4007752, -0.09407952, 1.714228, 0, 0.2078431, 1, 1,
0.402058, -1.421324, 3.891328, 0, 0.2039216, 1, 1,
0.4023179, -0.8214284, 4.282712, 0, 0.1960784, 1, 1,
0.4040461, 1.512809, -1.467489, 0, 0.1882353, 1, 1,
0.404472, 0.3169447, -0.2513137, 0, 0.1843137, 1, 1,
0.4110528, -2.44051, 3.462222, 0, 0.1764706, 1, 1,
0.4130837, 0.9653416, -0.7158424, 0, 0.172549, 1, 1,
0.4136276, 0.1738228, 1.130622, 0, 0.1647059, 1, 1,
0.4160294, -0.65944, 2.439251, 0, 0.1607843, 1, 1,
0.4173337, -1.109782, 2.994923, 0, 0.1529412, 1, 1,
0.4248547, 0.735751, 0.6149495, 0, 0.1490196, 1, 1,
0.4262885, 0.9185821, -0.7411905, 0, 0.1411765, 1, 1,
0.4294457, -1.292494, 3.510247, 0, 0.1372549, 1, 1,
0.4301163, 0.8935003, 0.1402548, 0, 0.1294118, 1, 1,
0.4307926, -0.6101313, 3.995417, 0, 0.1254902, 1, 1,
0.432491, 1.034035, 1.069667, 0, 0.1176471, 1, 1,
0.441448, -0.2350589, 4.266171, 0, 0.1137255, 1, 1,
0.4422967, 0.005449636, 1.000461, 0, 0.1058824, 1, 1,
0.4428065, 1.078092, -0.07223979, 0, 0.09803922, 1, 1,
0.4552152, 0.606887, 1.441333, 0, 0.09411765, 1, 1,
0.4575017, 0.6452217, 0.9408529, 0, 0.08627451, 1, 1,
0.4589756, -0.8663597, 2.194171, 0, 0.08235294, 1, 1,
0.4597293, 1.150512, 0.1243874, 0, 0.07450981, 1, 1,
0.4648289, 0.1138695, 0.7540432, 0, 0.07058824, 1, 1,
0.4662188, -0.948104, 3.658143, 0, 0.0627451, 1, 1,
0.4695255, -0.4974228, 3.71364, 0, 0.05882353, 1, 1,
0.470008, 0.2286862, 0.2998793, 0, 0.05098039, 1, 1,
0.4709123, -2.22916, 3.909912, 0, 0.04705882, 1, 1,
0.4746701, -0.008976233, 2.429449, 0, 0.03921569, 1, 1,
0.4755352, 0.6922604, 0.2337229, 0, 0.03529412, 1, 1,
0.4761825, 0.331691, 0.1194716, 0, 0.02745098, 1, 1,
0.4824451, 0.2854699, 0.0004256357, 0, 0.02352941, 1, 1,
0.4847059, 0.21069, 2.330964, 0, 0.01568628, 1, 1,
0.4853441, 0.2331221, 1.601324, 0, 0.01176471, 1, 1,
0.4858443, 1.6976, -0.3315227, 0, 0.003921569, 1, 1,
0.4862917, 1.704936, 0.8763613, 0.003921569, 0, 1, 1,
0.4871073, -0.05695842, 1.982316, 0.007843138, 0, 1, 1,
0.4944458, 1.097759, -0.3214116, 0.01568628, 0, 1, 1,
0.4954286, -1.422859, 3.844815, 0.01960784, 0, 1, 1,
0.4960155, -0.03432211, 3.451453, 0.02745098, 0, 1, 1,
0.498491, -2.247103, 3.808114, 0.03137255, 0, 1, 1,
0.5023261, -1.049139, 3.033131, 0.03921569, 0, 1, 1,
0.5054425, 1.526806, -0.04661501, 0.04313726, 0, 1, 1,
0.5055125, -1.001972, 3.659736, 0.05098039, 0, 1, 1,
0.5082017, 1.522164, -0.4155802, 0.05490196, 0, 1, 1,
0.508835, 1.586583, -0.2809267, 0.0627451, 0, 1, 1,
0.5128305, -0.7929486, 1.983159, 0.06666667, 0, 1, 1,
0.5157951, 0.4954074, 2.23141, 0.07450981, 0, 1, 1,
0.5175892, -1.375536, 1.128683, 0.07843138, 0, 1, 1,
0.5188037, 0.9112548, -0.01868922, 0.08627451, 0, 1, 1,
0.5234379, -0.2622461, -0.2050132, 0.09019608, 0, 1, 1,
0.5262415, -0.07314558, 2.460942, 0.09803922, 0, 1, 1,
0.5279138, 0.4147497, 1.020954, 0.1058824, 0, 1, 1,
0.5291868, -2.187961, 3.347846, 0.1098039, 0, 1, 1,
0.5298503, -0.9973761, 3.371129, 0.1176471, 0, 1, 1,
0.5315866, 0.9338787, 0.5712995, 0.1215686, 0, 1, 1,
0.5344208, -0.5312787, 3.06995, 0.1294118, 0, 1, 1,
0.5380831, 0.380945, -0.4861223, 0.1333333, 0, 1, 1,
0.5405439, 1.135233, 1.333971, 0.1411765, 0, 1, 1,
0.5416168, 1.112354, 0.4861402, 0.145098, 0, 1, 1,
0.5446458, 0.0634615, 0.8713021, 0.1529412, 0, 1, 1,
0.550189, 0.4309781, 3.07666, 0.1568628, 0, 1, 1,
0.5507669, 0.3594974, -0.2425097, 0.1647059, 0, 1, 1,
0.5526247, -0.1204034, 1.725473, 0.1686275, 0, 1, 1,
0.553162, 0.5458409, 0.1146765, 0.1764706, 0, 1, 1,
0.5557528, 1.51961, -0.3382648, 0.1803922, 0, 1, 1,
0.5564254, 0.293602, 0.7522497, 0.1882353, 0, 1, 1,
0.5578524, -1.071402, 2.556499, 0.1921569, 0, 1, 1,
0.5638091, -0.4535469, 2.402248, 0.2, 0, 1, 1,
0.5651897, -0.8125896, 1.3444, 0.2078431, 0, 1, 1,
0.565504, 1.200922, 0.2856481, 0.2117647, 0, 1, 1,
0.5657408, 0.405219, 1.371198, 0.2196078, 0, 1, 1,
0.5665321, 1.045715, -0.433334, 0.2235294, 0, 1, 1,
0.5672539, -1.978824, 2.429132, 0.2313726, 0, 1, 1,
0.5697942, -0.04991433, 1.482212, 0.2352941, 0, 1, 1,
0.5707403, 2.21853, -0.6385235, 0.2431373, 0, 1, 1,
0.5754765, -0.6362266, 3.64656, 0.2470588, 0, 1, 1,
0.5759108, 0.4923227, 0.07162217, 0.254902, 0, 1, 1,
0.5791726, -1.534882, 1.798154, 0.2588235, 0, 1, 1,
0.580873, -0.4117778, 1.290403, 0.2666667, 0, 1, 1,
0.5856677, 0.6744169, 1.462353, 0.2705882, 0, 1, 1,
0.5919518, 0.3865338, 0.91263, 0.2784314, 0, 1, 1,
0.5920096, -0.6954536, 3.261069, 0.282353, 0, 1, 1,
0.5921454, 0.5915017, 1.095476, 0.2901961, 0, 1, 1,
0.6023123, 1.91488, 1.734276, 0.2941177, 0, 1, 1,
0.6043526, -3.893466, 2.194974, 0.3019608, 0, 1, 1,
0.6082338, 0.437005, 0.8238932, 0.3098039, 0, 1, 1,
0.6119379, 0.2047258, 0.2456036, 0.3137255, 0, 1, 1,
0.6254113, -0.766154, 3.676733, 0.3215686, 0, 1, 1,
0.6297919, 0.3810332, -0.4163055, 0.3254902, 0, 1, 1,
0.63454, 0.5346212, 0.4920838, 0.3333333, 0, 1, 1,
0.6405182, -0.1246674, 1.18944, 0.3372549, 0, 1, 1,
0.6407381, -0.0208256, 2.321002, 0.345098, 0, 1, 1,
0.6444886, -0.6824071, 2.829124, 0.3490196, 0, 1, 1,
0.646603, 0.9930294, -2.536731, 0.3568628, 0, 1, 1,
0.6487113, -0.3472471, 3.175672, 0.3607843, 0, 1, 1,
0.660676, 0.1796287, 1.074039, 0.3686275, 0, 1, 1,
0.6625452, -1.259324, 2.356884, 0.372549, 0, 1, 1,
0.6639053, -1.1472, 2.252312, 0.3803922, 0, 1, 1,
0.664152, 0.5627239, 2.112085, 0.3843137, 0, 1, 1,
0.6693797, -0.2024704, 0.3781275, 0.3921569, 0, 1, 1,
0.6750501, 1.461069, 0.907233, 0.3960784, 0, 1, 1,
0.6822886, -1.192766, 2.092542, 0.4039216, 0, 1, 1,
0.6826473, 0.8735789, 0.7692351, 0.4117647, 0, 1, 1,
0.6828757, -0.3690265, 1.32796, 0.4156863, 0, 1, 1,
0.6833593, 1.149275, 0.4753609, 0.4235294, 0, 1, 1,
0.6870561, -1.000318, 3.149006, 0.427451, 0, 1, 1,
0.6896968, -1.952411, 2.787664, 0.4352941, 0, 1, 1,
0.6961278, -0.07140971, 3.217343, 0.4392157, 0, 1, 1,
0.6974921, -0.5727086, 1.824156, 0.4470588, 0, 1, 1,
0.7017145, 0.8450914, -1.090153, 0.4509804, 0, 1, 1,
0.7033042, 1.190284, -1.65144, 0.4588235, 0, 1, 1,
0.7037197, -1.676768, 2.683953, 0.4627451, 0, 1, 1,
0.7051604, 0.2082298, 1.364466, 0.4705882, 0, 1, 1,
0.7114228, -0.08746088, 1.446828, 0.4745098, 0, 1, 1,
0.7196488, 1.703461, 1.002686, 0.4823529, 0, 1, 1,
0.72054, -0.8266974, 2.73767, 0.4862745, 0, 1, 1,
0.7239799, -0.3843136, 2.873093, 0.4941176, 0, 1, 1,
0.7241034, -0.01602963, 2.864105, 0.5019608, 0, 1, 1,
0.7310174, -1.056525, 1.837004, 0.5058824, 0, 1, 1,
0.7401373, -0.5999917, 1.693291, 0.5137255, 0, 1, 1,
0.749917, -1.193, 2.254128, 0.5176471, 0, 1, 1,
0.7501474, 1.714676, 1.223624, 0.5254902, 0, 1, 1,
0.75024, -0.6463875, 2.866558, 0.5294118, 0, 1, 1,
0.7671977, -0.3876706, -0.4452202, 0.5372549, 0, 1, 1,
0.770441, -0.4004618, 1.904129, 0.5411765, 0, 1, 1,
0.772982, 0.8162596, 0.3975218, 0.5490196, 0, 1, 1,
0.7740644, -0.2216019, 3.616396, 0.5529412, 0, 1, 1,
0.7754474, 0.2825012, 1.604375, 0.5607843, 0, 1, 1,
0.7762914, -0.08876582, 2.117672, 0.5647059, 0, 1, 1,
0.7771854, -0.3130557, 1.572147, 0.572549, 0, 1, 1,
0.7773916, -0.9046047, 2.419547, 0.5764706, 0, 1, 1,
0.7780165, -0.5378703, 2.354461, 0.5843138, 0, 1, 1,
0.7793649, 0.3200011, 1.422425, 0.5882353, 0, 1, 1,
0.7827958, -0.363663, 3.327121, 0.5960785, 0, 1, 1,
0.7830976, -0.8225077, 0.9963301, 0.6039216, 0, 1, 1,
0.7835597, 0.5892578, 0.8337222, 0.6078432, 0, 1, 1,
0.7846398, 0.6849955, 2.660887, 0.6156863, 0, 1, 1,
0.790472, 0.9294701, 2.575782, 0.6196079, 0, 1, 1,
0.7906352, -1.31318, 4.154065, 0.627451, 0, 1, 1,
0.7950448, 0.8415415, -0.1941499, 0.6313726, 0, 1, 1,
0.800167, 0.08910625, 1.955063, 0.6392157, 0, 1, 1,
0.8044679, -0.1740252, 4.116967, 0.6431373, 0, 1, 1,
0.8054799, -0.7681419, 1.525503, 0.6509804, 0, 1, 1,
0.8091682, -0.4815166, 1.48839, 0.654902, 0, 1, 1,
0.810177, 1.468048, 0.04320463, 0.6627451, 0, 1, 1,
0.8124428, -0.4331918, 2.435961, 0.6666667, 0, 1, 1,
0.8141722, 0.2859758, 1.957935, 0.6745098, 0, 1, 1,
0.8147584, -0.1423624, 0.9164783, 0.6784314, 0, 1, 1,
0.8192957, -0.3521921, 1.64531, 0.6862745, 0, 1, 1,
0.8200498, 0.7753698, 1.472315, 0.6901961, 0, 1, 1,
0.8248628, -1.093742, 0.9950088, 0.6980392, 0, 1, 1,
0.8255696, 0.5922294, 1.118123, 0.7058824, 0, 1, 1,
0.8261913, -0.2728097, 1.003627, 0.7098039, 0, 1, 1,
0.8289562, -1.615629, 2.777005, 0.7176471, 0, 1, 1,
0.8299237, 0.0502211, 0.395523, 0.7215686, 0, 1, 1,
0.830112, 0.8691093, 0.7024689, 0.7294118, 0, 1, 1,
0.8385566, -1.522733, 1.202094, 0.7333333, 0, 1, 1,
0.8385612, 1.293447, 0.2595468, 0.7411765, 0, 1, 1,
0.8455755, 2.040347, 0.8227974, 0.7450981, 0, 1, 1,
0.84624, 0.4492119, 2.603882, 0.7529412, 0, 1, 1,
0.8496275, 0.1161701, 1.291607, 0.7568628, 0, 1, 1,
0.8497834, -0.6888129, 2.48811, 0.7647059, 0, 1, 1,
0.8560403, -0.6490775, 2.670385, 0.7686275, 0, 1, 1,
0.85636, 0.7717055, 0.3043437, 0.7764706, 0, 1, 1,
0.8568823, -1.432351, 1.664841, 0.7803922, 0, 1, 1,
0.8601221, 1.605976, -0.1436477, 0.7882353, 0, 1, 1,
0.861398, -0.245, 1.654745, 0.7921569, 0, 1, 1,
0.8618613, -1.831486, 1.574438, 0.8, 0, 1, 1,
0.8624171, 1.011436, 0.4042355, 0.8078431, 0, 1, 1,
0.8655232, 1.765384, 0.172326, 0.8117647, 0, 1, 1,
0.8743936, 1.098464, 2.044936, 0.8196079, 0, 1, 1,
0.8749588, -0.8758734, 3.081897, 0.8235294, 0, 1, 1,
0.8870956, 1.264999, 0.2371393, 0.8313726, 0, 1, 1,
0.8886247, -0.9648722, 4.332044, 0.8352941, 0, 1, 1,
0.8983545, 0.379504, 0.7631123, 0.8431373, 0, 1, 1,
0.8996083, -0.7198604, 2.21314, 0.8470588, 0, 1, 1,
0.8996316, -0.2079648, 1.339125, 0.854902, 0, 1, 1,
0.9015855, 0.2169901, 2.028472, 0.8588235, 0, 1, 1,
0.9028496, -0.6159962, 1.317473, 0.8666667, 0, 1, 1,
0.9061235, -1.223081, 4.056954, 0.8705882, 0, 1, 1,
0.9080961, -1.401481, 2.788818, 0.8784314, 0, 1, 1,
0.9105185, -0.4183499, 1.660442, 0.8823529, 0, 1, 1,
0.9243504, 0.4187553, 2.844276, 0.8901961, 0, 1, 1,
0.925213, 0.3538788, 0.8867269, 0.8941177, 0, 1, 1,
0.9259306, 1.010772, 0.06003067, 0.9019608, 0, 1, 1,
0.936085, 1.592739, 0.1039883, 0.9098039, 0, 1, 1,
0.9430836, -2.100413, 2.687819, 0.9137255, 0, 1, 1,
0.9462833, 0.7325656, 1.565647, 0.9215686, 0, 1, 1,
0.948966, -1.69861, 3.056416, 0.9254902, 0, 1, 1,
0.9523142, 1.478585, -0.2356579, 0.9333333, 0, 1, 1,
0.9551109, 0.4032095, -0.208087, 0.9372549, 0, 1, 1,
0.9586936, 0.6721089, 1.563246, 0.945098, 0, 1, 1,
0.9619448, 0.8034428, 0.5852461, 0.9490196, 0, 1, 1,
0.9627372, -0.7871419, 2.182624, 0.9568627, 0, 1, 1,
0.963048, -1.131904, 2.840561, 0.9607843, 0, 1, 1,
0.9642525, 0.8302576, 1.989416, 0.9686275, 0, 1, 1,
0.9691381, 0.08665511, 2.364999, 0.972549, 0, 1, 1,
0.9705587, -0.1885215, 2.726039, 0.9803922, 0, 1, 1,
0.9779332, 0.8385109, -0.267452, 0.9843137, 0, 1, 1,
0.9860343, 0.0004015325, 1.842476, 0.9921569, 0, 1, 1,
1.010246, 0.1424601, 0.2037146, 0.9960784, 0, 1, 1,
1.018907, 0.5269184, 0.9088714, 1, 0, 0.9960784, 1,
1.0193, 1.824882, -0.2158793, 1, 0, 0.9882353, 1,
1.020044, 1.06938, 2.713698, 1, 0, 0.9843137, 1,
1.021736, 0.5579669, 1.934942, 1, 0, 0.9764706, 1,
1.02473, 0.3375114, 2.895236, 1, 0, 0.972549, 1,
1.028435, -0.5333703, 1.830702, 1, 0, 0.9647059, 1,
1.035137, -0.9633476, 3.087804, 1, 0, 0.9607843, 1,
1.041734, -2.255874, 3.403734, 1, 0, 0.9529412, 1,
1.046947, 0.3308076, 2.667944, 1, 0, 0.9490196, 1,
1.046989, -0.4791457, 1.451977, 1, 0, 0.9411765, 1,
1.050527, 0.4463089, 0.435122, 1, 0, 0.9372549, 1,
1.053809, 0.9070772, 1.724247, 1, 0, 0.9294118, 1,
1.060086, -2.13328, 0.2602364, 1, 0, 0.9254902, 1,
1.060285, 0.4845433, 3.073114, 1, 0, 0.9176471, 1,
1.062523, -1.410035, 2.849582, 1, 0, 0.9137255, 1,
1.062651, 0.6940191, 2.14963, 1, 0, 0.9058824, 1,
1.064706, -0.3308234, 2.518082, 1, 0, 0.9019608, 1,
1.069568, 0.09916075, 3.095524, 1, 0, 0.8941177, 1,
1.072172, -0.621514, 1.40678, 1, 0, 0.8862745, 1,
1.075556, -0.7788348, 4.562581, 1, 0, 0.8823529, 1,
1.083442, 0.6984133, 2.541103, 1, 0, 0.8745098, 1,
1.086268, 0.4433831, -0.2576902, 1, 0, 0.8705882, 1,
1.087064, -1.620591, 3.44577, 1, 0, 0.8627451, 1,
1.088611, 0.3638331, -0.09777021, 1, 0, 0.8588235, 1,
1.08941, 0.6360035, -1.008248, 1, 0, 0.8509804, 1,
1.090994, -0.3373239, 1.900916, 1, 0, 0.8470588, 1,
1.103249, -0.2783918, 1.884342, 1, 0, 0.8392157, 1,
1.108282, 1.466354, 0.151397, 1, 0, 0.8352941, 1,
1.118474, -0.2685305, 2.336443, 1, 0, 0.827451, 1,
1.123052, 0.7607821, 0.7080392, 1, 0, 0.8235294, 1,
1.124834, 0.4231276, 0.6367648, 1, 0, 0.8156863, 1,
1.128705, 0.3361333, 0.6188965, 1, 0, 0.8117647, 1,
1.129825, 1.976606, 1.022349, 1, 0, 0.8039216, 1,
1.131235, -0.6727409, 3.341706, 1, 0, 0.7960784, 1,
1.141541, 2.052422, 0.3699968, 1, 0, 0.7921569, 1,
1.141604, 2.018925, 0.3332253, 1, 0, 0.7843137, 1,
1.144397, 0.6617959, 0.4564376, 1, 0, 0.7803922, 1,
1.146817, 0.222837, 2.676911, 1, 0, 0.772549, 1,
1.149904, 1.58, 0.9704834, 1, 0, 0.7686275, 1,
1.150519, 0.3154344, -0.2093436, 1, 0, 0.7607843, 1,
1.155703, -1.751903, 1.973761, 1, 0, 0.7568628, 1,
1.160254, 0.0837326, 0.9181839, 1, 0, 0.7490196, 1,
1.167355, -0.9449389, 2.182942, 1, 0, 0.7450981, 1,
1.172321, 1.544196, 0.7944857, 1, 0, 0.7372549, 1,
1.178469, -1.532842, 1.83851, 1, 0, 0.7333333, 1,
1.183053, 0.01481726, 1.544204, 1, 0, 0.7254902, 1,
1.186935, 0.4236144, 1.818959, 1, 0, 0.7215686, 1,
1.192509, 0.3139481, 2.119376, 1, 0, 0.7137255, 1,
1.198795, 1.443343, 0.719274, 1, 0, 0.7098039, 1,
1.201212, -0.3573491, 3.575706, 1, 0, 0.7019608, 1,
1.216724, 1.425981, 1.168089, 1, 0, 0.6941177, 1,
1.220672, -1.260746, 1.988218, 1, 0, 0.6901961, 1,
1.222487, 1.307524, -0.1122167, 1, 0, 0.682353, 1,
1.231086, -0.6631267, 1.279738, 1, 0, 0.6784314, 1,
1.239995, 0.1051237, 2.302293, 1, 0, 0.6705883, 1,
1.25771, 0.3811029, 0.9477121, 1, 0, 0.6666667, 1,
1.268756, 1.518673, 1.937707, 1, 0, 0.6588235, 1,
1.271371, -0.2432104, 0.7273203, 1, 0, 0.654902, 1,
1.272326, 1.267905, 2.286484, 1, 0, 0.6470588, 1,
1.286665, -0.09666453, 2.316515, 1, 0, 0.6431373, 1,
1.291027, 1.493906, 1.139139, 1, 0, 0.6352941, 1,
1.295009, -1.015755, 2.167896, 1, 0, 0.6313726, 1,
1.302169, 0.5263836, 0.386841, 1, 0, 0.6235294, 1,
1.305358, 1.02001, 0.3804854, 1, 0, 0.6196079, 1,
1.307057, -0.8698348, 3.75473, 1, 0, 0.6117647, 1,
1.307361, 0.7328944, 0.1462904, 1, 0, 0.6078432, 1,
1.31549, -0.806074, 2.589928, 1, 0, 0.6, 1,
1.319851, -1.776341, 1.096077, 1, 0, 0.5921569, 1,
1.323552, -0.7684017, 0.5281413, 1, 0, 0.5882353, 1,
1.324127, -0.1387855, 1.474594, 1, 0, 0.5803922, 1,
1.331217, 0.05891525, 2.734892, 1, 0, 0.5764706, 1,
1.338327, -1.275866, 3.536768, 1, 0, 0.5686275, 1,
1.348184, -1.343439, 2.695524, 1, 0, 0.5647059, 1,
1.354766, 1.292446, 1.807681, 1, 0, 0.5568628, 1,
1.357084, -0.8427834, 2.530232, 1, 0, 0.5529412, 1,
1.36863, -1.833062, 2.72986, 1, 0, 0.5450981, 1,
1.382038, -0.3517997, 1.810919, 1, 0, 0.5411765, 1,
1.384535, 1.321449, 0.2456478, 1, 0, 0.5333334, 1,
1.391205, -0.07562193, 1.409482, 1, 0, 0.5294118, 1,
1.403999, -0.7759629, 2.650031, 1, 0, 0.5215687, 1,
1.407897, -1.402436, 3.271532, 1, 0, 0.5176471, 1,
1.418928, -0.1422874, 1.593507, 1, 0, 0.509804, 1,
1.419208, -0.5174398, 4.43533, 1, 0, 0.5058824, 1,
1.420863, -0.5670863, 1.210043, 1, 0, 0.4980392, 1,
1.425779, -0.5877921, 0.8163273, 1, 0, 0.4901961, 1,
1.429469, -0.3780175, 2.53915, 1, 0, 0.4862745, 1,
1.434112, 0.4416001, 2.782329, 1, 0, 0.4784314, 1,
1.439114, -1.699606, 2.920316, 1, 0, 0.4745098, 1,
1.44882, 0.4773664, 2.062073, 1, 0, 0.4666667, 1,
1.467092, 1.703188, -0.9779515, 1, 0, 0.4627451, 1,
1.469007, 0.3334798, 0.9955726, 1, 0, 0.454902, 1,
1.472915, -0.05986949, 1.572468, 1, 0, 0.4509804, 1,
1.476305, -0.02027802, 2.353002, 1, 0, 0.4431373, 1,
1.47819, -0.5756746, 0.7574795, 1, 0, 0.4392157, 1,
1.48094, -1.814292, 5.318904, 1, 0, 0.4313726, 1,
1.482475, -0.5406492, 1.947823, 1, 0, 0.427451, 1,
1.488497, 0.06977851, 2.067952, 1, 0, 0.4196078, 1,
1.512446, 0.1195497, 3.29204, 1, 0, 0.4156863, 1,
1.5134, 1.216822, 1.617663, 1, 0, 0.4078431, 1,
1.514507, 0.07887711, 2.176369, 1, 0, 0.4039216, 1,
1.515073, 0.4703639, 0.6786918, 1, 0, 0.3960784, 1,
1.532569, 0.2680932, 3.191427, 1, 0, 0.3882353, 1,
1.53653, -1.066149, 3.560987, 1, 0, 0.3843137, 1,
1.538821, -0.6485816, 2.008569, 1, 0, 0.3764706, 1,
1.540566, 0.590889, 2.962066, 1, 0, 0.372549, 1,
1.541089, -1.442217, 0.8468921, 1, 0, 0.3647059, 1,
1.54415, 0.1279278, 1.494729, 1, 0, 0.3607843, 1,
1.578256, 0.4238215, 1.134786, 1, 0, 0.3529412, 1,
1.594218, -0.1742961, 2.123747, 1, 0, 0.3490196, 1,
1.599618, -1.082496, 1.308548, 1, 0, 0.3411765, 1,
1.601431, -1.109486, 1.528083, 1, 0, 0.3372549, 1,
1.614811, 1.00606, 1.056181, 1, 0, 0.3294118, 1,
1.624926, -0.2872746, 3.098734, 1, 0, 0.3254902, 1,
1.628276, -0.6787591, 0.693697, 1, 0, 0.3176471, 1,
1.629506, -1.328537, 3.030521, 1, 0, 0.3137255, 1,
1.645144, 0.9796062, 1.01262, 1, 0, 0.3058824, 1,
1.647565, -1.260919, 2.909972, 1, 0, 0.2980392, 1,
1.648263, 1.109299, 0.9550886, 1, 0, 0.2941177, 1,
1.651561, 1.226348, 3.105191, 1, 0, 0.2862745, 1,
1.657241, -2.006531, 2.917233, 1, 0, 0.282353, 1,
1.666259, 0.4663573, 0.9343265, 1, 0, 0.2745098, 1,
1.677461, -0.8222133, -0.06685573, 1, 0, 0.2705882, 1,
1.694414, 1.194247, 0.9942619, 1, 0, 0.2627451, 1,
1.710278, -1.240204, 2.988005, 1, 0, 0.2588235, 1,
1.733367, -1.680892, 4.209089, 1, 0, 0.2509804, 1,
1.74225, -1.310913, 2.56329, 1, 0, 0.2470588, 1,
1.752127, 0.320247, 1.599626, 1, 0, 0.2392157, 1,
1.752599, -0.2742691, 1.302242, 1, 0, 0.2352941, 1,
1.765142, -0.2591386, 1.617253, 1, 0, 0.227451, 1,
1.772406, -1.247332, -0.2286732, 1, 0, 0.2235294, 1,
1.781853, -0.1585031, 1.424141, 1, 0, 0.2156863, 1,
1.78563, 0.8231171, 0.01380767, 1, 0, 0.2117647, 1,
1.794971, 0.2325762, 1.447478, 1, 0, 0.2039216, 1,
1.806833, 2.190719, 0.8825349, 1, 0, 0.1960784, 1,
1.811479, -0.9094551, 0.3777975, 1, 0, 0.1921569, 1,
1.822604, 1.66058, -0.1806854, 1, 0, 0.1843137, 1,
1.826021, -0.1521481, 2.702556, 1, 0, 0.1803922, 1,
1.851554, -2.137147, 2.756803, 1, 0, 0.172549, 1,
1.860029, 0.8408199, 2.283092, 1, 0, 0.1686275, 1,
1.876714, -0.5903754, 2.08881, 1, 0, 0.1607843, 1,
1.892554, 0.6338801, 1.942062, 1, 0, 0.1568628, 1,
1.918696, 0.8973051, 0.6822405, 1, 0, 0.1490196, 1,
1.92951, -0.7498783, 2.712254, 1, 0, 0.145098, 1,
1.964043, -0.1491006, 1.960259, 1, 0, 0.1372549, 1,
1.993889, 0.5760414, 0.5559481, 1, 0, 0.1333333, 1,
2.01729, 0.861768, 1.882634, 1, 0, 0.1254902, 1,
2.018833, 0.9152189, 1.892198, 1, 0, 0.1215686, 1,
2.048107, 0.03779717, 1.968799, 1, 0, 0.1137255, 1,
2.04971, 1.00234, 0.3951321, 1, 0, 0.1098039, 1,
2.115057, 0.561637, 0.8928367, 1, 0, 0.1019608, 1,
2.115733, 1.586411, 1.094495, 1, 0, 0.09411765, 1,
2.127899, -1.224952, 1.581968, 1, 0, 0.09019608, 1,
2.181453, 0.151436, 1.635748, 1, 0, 0.08235294, 1,
2.187724, 0.8648117, 1.883502, 1, 0, 0.07843138, 1,
2.232522, -1.037944, 2.569885, 1, 0, 0.07058824, 1,
2.408633, 1.292746, 1.375146, 1, 0, 0.06666667, 1,
2.473521, -0.03105608, 2.71604, 1, 0, 0.05882353, 1,
2.478428, 2.102519, 0.6178059, 1, 0, 0.05490196, 1,
2.514388, -2.09867, 3.566027, 1, 0, 0.04705882, 1,
2.577776, -0.658926, 1.845139, 1, 0, 0.04313726, 1,
2.637027, -0.5331297, 0.213863, 1, 0, 0.03529412, 1,
2.662454, 0.6353357, 1.311678, 1, 0, 0.03137255, 1,
2.88049, -0.1511447, 0.07266274, 1, 0, 0.02352941, 1,
3.151126, -0.2706827, 1.475443, 1, 0, 0.01960784, 1,
3.162881, 1.02606, 1.585519, 1, 0, 0.01176471, 1,
3.273348, -0.7857258, 1.52298, 1, 0, 0.007843138, 1
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
-0.04808187, -5.108271, -7.491757, 0, -0.5, 0.5, 0.5,
-0.04808187, -5.108271, -7.491757, 1, -0.5, 0.5, 0.5,
-0.04808187, -5.108271, -7.491757, 1, 1.5, 0.5, 0.5,
-0.04808187, -5.108271, -7.491757, 0, 1.5, 0.5, 0.5
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
-4.495476, -0.3099688, -7.491757, 0, -0.5, 0.5, 0.5,
-4.495476, -0.3099688, -7.491757, 1, -0.5, 0.5, 0.5,
-4.495476, -0.3099688, -7.491757, 1, 1.5, 0.5, 0.5,
-4.495476, -0.3099688, -7.491757, 0, 1.5, 0.5, 0.5
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
-4.495476, -5.108271, -0.158078, 0, -0.5, 0.5, 0.5,
-4.495476, -5.108271, -0.158078, 1, -0.5, 0.5, 0.5,
-4.495476, -5.108271, -0.158078, 1, 1.5, 0.5, 0.5,
-4.495476, -5.108271, -0.158078, 0, 1.5, 0.5, 0.5
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
-3, -4.00097, -5.79937,
3, -4.00097, -5.79937,
-3, -4.00097, -5.79937,
-3, -4.185521, -6.081434,
-2, -4.00097, -5.79937,
-2, -4.185521, -6.081434,
-1, -4.00097, -5.79937,
-1, -4.185521, -6.081434,
0, -4.00097, -5.79937,
0, -4.185521, -6.081434,
1, -4.00097, -5.79937,
1, -4.185521, -6.081434,
2, -4.00097, -5.79937,
2, -4.185521, -6.081434,
3, -4.00097, -5.79937,
3, -4.185521, -6.081434
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
-3, -4.554621, -6.645564, 0, -0.5, 0.5, 0.5,
-3, -4.554621, -6.645564, 1, -0.5, 0.5, 0.5,
-3, -4.554621, -6.645564, 1, 1.5, 0.5, 0.5,
-3, -4.554621, -6.645564, 0, 1.5, 0.5, 0.5,
-2, -4.554621, -6.645564, 0, -0.5, 0.5, 0.5,
-2, -4.554621, -6.645564, 1, -0.5, 0.5, 0.5,
-2, -4.554621, -6.645564, 1, 1.5, 0.5, 0.5,
-2, -4.554621, -6.645564, 0, 1.5, 0.5, 0.5,
-1, -4.554621, -6.645564, 0, -0.5, 0.5, 0.5,
-1, -4.554621, -6.645564, 1, -0.5, 0.5, 0.5,
-1, -4.554621, -6.645564, 1, 1.5, 0.5, 0.5,
-1, -4.554621, -6.645564, 0, 1.5, 0.5, 0.5,
0, -4.554621, -6.645564, 0, -0.5, 0.5, 0.5,
0, -4.554621, -6.645564, 1, -0.5, 0.5, 0.5,
0, -4.554621, -6.645564, 1, 1.5, 0.5, 0.5,
0, -4.554621, -6.645564, 0, 1.5, 0.5, 0.5,
1, -4.554621, -6.645564, 0, -0.5, 0.5, 0.5,
1, -4.554621, -6.645564, 1, -0.5, 0.5, 0.5,
1, -4.554621, -6.645564, 1, 1.5, 0.5, 0.5,
1, -4.554621, -6.645564, 0, 1.5, 0.5, 0.5,
2, -4.554621, -6.645564, 0, -0.5, 0.5, 0.5,
2, -4.554621, -6.645564, 1, -0.5, 0.5, 0.5,
2, -4.554621, -6.645564, 1, 1.5, 0.5, 0.5,
2, -4.554621, -6.645564, 0, 1.5, 0.5, 0.5,
3, -4.554621, -6.645564, 0, -0.5, 0.5, 0.5,
3, -4.554621, -6.645564, 1, -0.5, 0.5, 0.5,
3, -4.554621, -6.645564, 1, 1.5, 0.5, 0.5,
3, -4.554621, -6.645564, 0, 1.5, 0.5, 0.5
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
-3.469155, -2, -5.79937,
-3.469155, 2, -5.79937,
-3.469155, -2, -5.79937,
-3.640208, -2, -6.081434,
-3.469155, 0, -5.79937,
-3.640208, 0, -6.081434,
-3.469155, 2, -5.79937,
-3.640208, 2, -6.081434
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
-3.982315, -2, -6.645564, 0, -0.5, 0.5, 0.5,
-3.982315, -2, -6.645564, 1, -0.5, 0.5, 0.5,
-3.982315, -2, -6.645564, 1, 1.5, 0.5, 0.5,
-3.982315, -2, -6.645564, 0, 1.5, 0.5, 0.5,
-3.982315, 0, -6.645564, 0, -0.5, 0.5, 0.5,
-3.982315, 0, -6.645564, 1, -0.5, 0.5, 0.5,
-3.982315, 0, -6.645564, 1, 1.5, 0.5, 0.5,
-3.982315, 0, -6.645564, 0, 1.5, 0.5, 0.5,
-3.982315, 2, -6.645564, 0, -0.5, 0.5, 0.5,
-3.982315, 2, -6.645564, 1, -0.5, 0.5, 0.5,
-3.982315, 2, -6.645564, 1, 1.5, 0.5, 0.5,
-3.982315, 2, -6.645564, 0, 1.5, 0.5, 0.5
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
-3.469155, -4.00097, -4,
-3.469155, -4.00097, 4,
-3.469155, -4.00097, -4,
-3.640208, -4.185521, -4,
-3.469155, -4.00097, -2,
-3.640208, -4.185521, -2,
-3.469155, -4.00097, 0,
-3.640208, -4.185521, 0,
-3.469155, -4.00097, 2,
-3.640208, -4.185521, 2,
-3.469155, -4.00097, 4,
-3.640208, -4.185521, 4
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
-3.982315, -4.554621, -4, 0, -0.5, 0.5, 0.5,
-3.982315, -4.554621, -4, 1, -0.5, 0.5, 0.5,
-3.982315, -4.554621, -4, 1, 1.5, 0.5, 0.5,
-3.982315, -4.554621, -4, 0, 1.5, 0.5, 0.5,
-3.982315, -4.554621, -2, 0, -0.5, 0.5, 0.5,
-3.982315, -4.554621, -2, 1, -0.5, 0.5, 0.5,
-3.982315, -4.554621, -2, 1, 1.5, 0.5, 0.5,
-3.982315, -4.554621, -2, 0, 1.5, 0.5, 0.5,
-3.982315, -4.554621, 0, 0, -0.5, 0.5, 0.5,
-3.982315, -4.554621, 0, 1, -0.5, 0.5, 0.5,
-3.982315, -4.554621, 0, 1, 1.5, 0.5, 0.5,
-3.982315, -4.554621, 0, 0, 1.5, 0.5, 0.5,
-3.982315, -4.554621, 2, 0, -0.5, 0.5, 0.5,
-3.982315, -4.554621, 2, 1, -0.5, 0.5, 0.5,
-3.982315, -4.554621, 2, 1, 1.5, 0.5, 0.5,
-3.982315, -4.554621, 2, 0, 1.5, 0.5, 0.5,
-3.982315, -4.554621, 4, 0, -0.5, 0.5, 0.5,
-3.982315, -4.554621, 4, 1, -0.5, 0.5, 0.5,
-3.982315, -4.554621, 4, 1, 1.5, 0.5, 0.5,
-3.982315, -4.554621, 4, 0, 1.5, 0.5, 0.5
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
-3.469155, -4.00097, -5.79937,
-3.469155, 3.381033, -5.79937,
-3.469155, -4.00097, 5.483214,
-3.469155, 3.381033, 5.483214,
-3.469155, -4.00097, -5.79937,
-3.469155, -4.00097, 5.483214,
-3.469155, 3.381033, -5.79937,
-3.469155, 3.381033, 5.483214,
-3.469155, -4.00097, -5.79937,
3.372991, -4.00097, -5.79937,
-3.469155, -4.00097, 5.483214,
3.372991, -4.00097, 5.483214,
-3.469155, 3.381033, -5.79937,
3.372991, 3.381033, -5.79937,
-3.469155, 3.381033, 5.483214,
3.372991, 3.381033, 5.483214,
3.372991, -4.00097, -5.79937,
3.372991, 3.381033, -5.79937,
3.372991, -4.00097, 5.483214,
3.372991, 3.381033, 5.483214,
3.372991, -4.00097, -5.79937,
3.372991, -4.00097, 5.483214,
3.372991, 3.381033, -5.79937,
3.372991, 3.381033, 5.483214
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
var radius = 8.073631;
var distance = 35.92049;
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
mvMatrix.translate( 0.04808187, 0.3099688, 0.158078 );
mvMatrix.scale( 1.275823, 1.18252, 0.773703 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.92049);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
isoxazolidinone<-read.table("isoxazolidinone.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-isoxazolidinone$V2
```

```
## Error in eval(expr, envir, enclos): object 'isoxazolidinone' not found
```

```r
y<-isoxazolidinone$V3
```

```
## Error in eval(expr, envir, enclos): object 'isoxazolidinone' not found
```

```r
z<-isoxazolidinone$V4
```

```
## Error in eval(expr, envir, enclos): object 'isoxazolidinone' not found
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
-3.369512, -0.03423625, -3.098943, 0, 0, 1, 1, 1,
-2.967038, 0.1955117, -0.3033736, 1, 0, 0, 1, 1,
-2.631914, 0.1511548, -1.859076, 1, 0, 0, 1, 1,
-2.510015, -0.6333743, -1.653935, 1, 0, 0, 1, 1,
-2.483521, 0.4101387, -1.446106, 1, 0, 0, 1, 1,
-2.476694, 0.479731, -0.9341153, 1, 0, 0, 1, 1,
-2.357872, 1.551088, -1.571927, 0, 0, 0, 1, 1,
-2.351309, -0.3490956, 0.4339101, 0, 0, 0, 1, 1,
-2.261825, 0.4025037, -1.214677, 0, 0, 0, 1, 1,
-2.243696, 0.5519699, 0.4018486, 0, 0, 0, 1, 1,
-2.242081, -0.4519745, -0.01027281, 0, 0, 0, 1, 1,
-2.236162, 0.9881676, -0.7489739, 0, 0, 0, 1, 1,
-2.235258, 1.012497, 0.2139329, 0, 0, 0, 1, 1,
-2.232621, 0.8991569, -1.172196, 1, 1, 1, 1, 1,
-2.231815, -0.3301101, -1.712775, 1, 1, 1, 1, 1,
-2.228837, -1.262104, -1.940718, 1, 1, 1, 1, 1,
-2.142979, 0.8573258, -0.8235955, 1, 1, 1, 1, 1,
-2.092447, 1.88083, -2.577823, 1, 1, 1, 1, 1,
-2.084314, 0.5817351, -2.634394, 1, 1, 1, 1, 1,
-2.028877, -0.6739365, -0.9295125, 1, 1, 1, 1, 1,
-2.024019, -0.912705, -2.689536, 1, 1, 1, 1, 1,
-2.01896, 0.08246213, -2.075221, 1, 1, 1, 1, 1,
-2.011577, 1.162773, -1.661149, 1, 1, 1, 1, 1,
-2.006168, -0.9012865, -0.9801354, 1, 1, 1, 1, 1,
-1.993459, -0.7449906, -0.7894352, 1, 1, 1, 1, 1,
-1.99272, -0.3727275, -3.508464, 1, 1, 1, 1, 1,
-1.978467, 0.9088045, -1.0117, 1, 1, 1, 1, 1,
-1.967588, 1.569546, -0.1318607, 1, 1, 1, 1, 1,
-1.952596, 0.02387085, -2.361223, 0, 0, 1, 1, 1,
-1.943739, -0.516565, -3.054232, 1, 0, 0, 1, 1,
-1.920191, -0.1278506, -1.760241, 1, 0, 0, 1, 1,
-1.898573, -0.188201, -4.328739, 1, 0, 0, 1, 1,
-1.888247, -0.4050294, -0.0624623, 1, 0, 0, 1, 1,
-1.886592, -0.1293069, -2.813613, 1, 0, 0, 1, 1,
-1.81012, 0.03308631, -1.508202, 0, 0, 0, 1, 1,
-1.794584, -0.1730306, -1.532489, 0, 0, 0, 1, 1,
-1.792274, 1.767349, -0.2699009, 0, 0, 0, 1, 1,
-1.792182, 0.5786432, -1.20136, 0, 0, 0, 1, 1,
-1.786367, 1.372166, 0.139997, 0, 0, 0, 1, 1,
-1.785781, 0.136427, -2.520746, 0, 0, 0, 1, 1,
-1.778562, 0.9416545, -0.7409714, 0, 0, 0, 1, 1,
-1.772812, -0.260773, -3.13039, 1, 1, 1, 1, 1,
-1.720292, 0.202449, -1.724259, 1, 1, 1, 1, 1,
-1.708398, -0.3721965, -1.904836, 1, 1, 1, 1, 1,
-1.698873, 0.08531814, -2.354436, 1, 1, 1, 1, 1,
-1.685331, 0.5111123, -1.569834, 1, 1, 1, 1, 1,
-1.684456, -0.5421431, -2.170448, 1, 1, 1, 1, 1,
-1.668539, 0.1444295, -1.919632, 1, 1, 1, 1, 1,
-1.661142, 0.36582, -1.507447, 1, 1, 1, 1, 1,
-1.648536, -0.1393449, -0.9089376, 1, 1, 1, 1, 1,
-1.627838, 2.005844, -1.630278, 1, 1, 1, 1, 1,
-1.614297, 0.8851418, -1.350667, 1, 1, 1, 1, 1,
-1.612679, 0.01185272, -1.817085, 1, 1, 1, 1, 1,
-1.608095, 0.558225, -2.026156, 1, 1, 1, 1, 1,
-1.604414, -0.1714256, -2.133303, 1, 1, 1, 1, 1,
-1.587605, 0.739802, -0.8495252, 1, 1, 1, 1, 1,
-1.577771, -0.6427956, -1.449741, 0, 0, 1, 1, 1,
-1.568304, 0.5672789, -1.374531, 1, 0, 0, 1, 1,
-1.567139, -1.131917, -2.361345, 1, 0, 0, 1, 1,
-1.565659, 0.04393546, -0.7502832, 1, 0, 0, 1, 1,
-1.564211, 0.255397, -0.6486236, 1, 0, 0, 1, 1,
-1.562952, 0.1592335, -1.733781, 1, 0, 0, 1, 1,
-1.560164, -0.8617303, -2.833982, 0, 0, 0, 1, 1,
-1.553972, -0.1224468, -1.30333, 0, 0, 0, 1, 1,
-1.544031, 0.2476431, -1.058634, 0, 0, 0, 1, 1,
-1.531051, 0.5917339, -0.04352171, 0, 0, 0, 1, 1,
-1.529939, -0.7708703, -0.3317517, 0, 0, 0, 1, 1,
-1.518543, 1.731598, -1.106341, 0, 0, 0, 1, 1,
-1.502008, -0.7210085, -2.780704, 0, 0, 0, 1, 1,
-1.497092, 0.6765586, -1.033515, 1, 1, 1, 1, 1,
-1.488675, -1.014129, -0.8871968, 1, 1, 1, 1, 1,
-1.47941, 0.2291828, -0.5167571, 1, 1, 1, 1, 1,
-1.476656, -0.4361443, -2.279723, 1, 1, 1, 1, 1,
-1.474884, -0.7673197, -3.059002, 1, 1, 1, 1, 1,
-1.474013, -1.494543, -0.8805091, 1, 1, 1, 1, 1,
-1.462795, 1.063942, -1.547366, 1, 1, 1, 1, 1,
-1.462503, -1.934928, -2.570342, 1, 1, 1, 1, 1,
-1.456317, 0.7453237, -2.571282, 1, 1, 1, 1, 1,
-1.449488, 0.2096032, -0.9201669, 1, 1, 1, 1, 1,
-1.442277, -0.5817117, -1.27802, 1, 1, 1, 1, 1,
-1.431928, -1.054387, -2.089762, 1, 1, 1, 1, 1,
-1.421117, -0.2104976, -1.719699, 1, 1, 1, 1, 1,
-1.412692, -0.7521517, -2.712126, 1, 1, 1, 1, 1,
-1.387215, -2.046073, -3.096072, 1, 1, 1, 1, 1,
-1.386488, -0.06140707, -2.212794, 0, 0, 1, 1, 1,
-1.381095, -1.434596, -4.331134, 1, 0, 0, 1, 1,
-1.37275, 0.492211, -1.044331, 1, 0, 0, 1, 1,
-1.369362, -0.6860251, -1.097597, 1, 0, 0, 1, 1,
-1.367071, 0.2331211, 0.436121, 1, 0, 0, 1, 1,
-1.36387, -1.420923, -3.574657, 1, 0, 0, 1, 1,
-1.334067, -3.175875, -0.7162251, 0, 0, 0, 1, 1,
-1.315672, 1.155911, -3.231754, 0, 0, 0, 1, 1,
-1.314152, -0.7809783, -0.2898967, 0, 0, 0, 1, 1,
-1.313432, 0.278699, -3.283149, 0, 0, 0, 1, 1,
-1.303117, -0.4314382, -0.8446836, 0, 0, 0, 1, 1,
-1.299099, 1.056523, -1.085283, 0, 0, 0, 1, 1,
-1.294295, 0.3922296, -0.6926967, 0, 0, 0, 1, 1,
-1.290122, 1.350647, -0.2537639, 1, 1, 1, 1, 1,
-1.286766, 2.127301, 0.2046845, 1, 1, 1, 1, 1,
-1.28183, -0.9824603, -1.599915, 1, 1, 1, 1, 1,
-1.279413, -0.3532477, -1.490622, 1, 1, 1, 1, 1,
-1.279367, -0.4492516, -3.08347, 1, 1, 1, 1, 1,
-1.277419, 1.596561, -0.5045064, 1, 1, 1, 1, 1,
-1.268472, 0.4747439, -2.242394, 1, 1, 1, 1, 1,
-1.262598, -0.01352717, -0.9176052, 1, 1, 1, 1, 1,
-1.261083, -0.7574167, -3.128659, 1, 1, 1, 1, 1,
-1.259656, 0.3311945, 0.773035, 1, 1, 1, 1, 1,
-1.255037, -0.1174756, -1.847146, 1, 1, 1, 1, 1,
-1.250099, -1.34348, -1.303545, 1, 1, 1, 1, 1,
-1.245808, -0.8779659, -2.287565, 1, 1, 1, 1, 1,
-1.243644, -2.468383, -1.676962, 1, 1, 1, 1, 1,
-1.241383, 0.3338146, 0.07666325, 1, 1, 1, 1, 1,
-1.238829, -0.8930346, -1.362758, 0, 0, 1, 1, 1,
-1.237925, 0.06111262, -2.073355, 1, 0, 0, 1, 1,
-1.234357, 1.264316, -0.8844248, 1, 0, 0, 1, 1,
-1.231993, 2.480902, 0.3079253, 1, 0, 0, 1, 1,
-1.230414, 1.394208, -0.2949861, 1, 0, 0, 1, 1,
-1.217406, -0.2397429, -0.9831687, 1, 0, 0, 1, 1,
-1.211294, 0.2758621, -1.401802, 0, 0, 0, 1, 1,
-1.206493, 0.05988537, -3.612617, 0, 0, 0, 1, 1,
-1.204792, -1.453288, -2.653452, 0, 0, 0, 1, 1,
-1.202618, 0.04090813, -2.694752, 0, 0, 0, 1, 1,
-1.20173, 0.510525, -0.5405554, 0, 0, 0, 1, 1,
-1.182776, 1.199847, -2.130512, 0, 0, 0, 1, 1,
-1.180397, -2.141701, -2.354631, 0, 0, 0, 1, 1,
-1.177096, 1.279866, -0.7008219, 1, 1, 1, 1, 1,
-1.166906, 0.4849931, -1.029153, 1, 1, 1, 1, 1,
-1.166887, -1.676277, -2.445371, 1, 1, 1, 1, 1,
-1.148973, 0.1026573, -2.326209, 1, 1, 1, 1, 1,
-1.147071, -0.6433697, -2.133587, 1, 1, 1, 1, 1,
-1.136848, -0.2795363, -1.856797, 1, 1, 1, 1, 1,
-1.126749, 0.3527581, -0.07007927, 1, 1, 1, 1, 1,
-1.12031, -0.3638386, -1.338717, 1, 1, 1, 1, 1,
-1.118538, -0.255934, -2.286261, 1, 1, 1, 1, 1,
-1.117774, 2.400547, -1.362735, 1, 1, 1, 1, 1,
-1.11585, -0.5765904, -1.805082, 1, 1, 1, 1, 1,
-1.108473, -0.352902, -5.184187, 1, 1, 1, 1, 1,
-1.106392, -1.053198, -1.967812, 1, 1, 1, 1, 1,
-1.094827, -0.160488, -2.105899, 1, 1, 1, 1, 1,
-1.094708, -0.2922744, -2.165821, 1, 1, 1, 1, 1,
-1.092839, -0.4928125, -1.923777, 0, 0, 1, 1, 1,
-1.089116, -1.195834, -1.018376, 1, 0, 0, 1, 1,
-1.085124, -0.5622469, -3.204875, 1, 0, 0, 1, 1,
-1.084909, 0.3262011, -2.100986, 1, 0, 0, 1, 1,
-1.08292, -1.490536, -1.770929, 1, 0, 0, 1, 1,
-1.081157, -0.9792634, -0.4368538, 1, 0, 0, 1, 1,
-1.063872, 1.581138, 1.126338, 0, 0, 0, 1, 1,
-1.063712, 1.629866, 0.4907396, 0, 0, 0, 1, 1,
-1.062992, 0.2786918, -1.224028, 0, 0, 0, 1, 1,
-1.05679, 0.766871, -0.2720123, 0, 0, 0, 1, 1,
-1.05578, -0.5673849, -1.601367, 0, 0, 0, 1, 1,
-1.036032, -0.08991381, -0.2143209, 0, 0, 0, 1, 1,
-1.031175, 2.000149, 0.1696438, 0, 0, 0, 1, 1,
-1.011411, 1.217094, -0.9673128, 1, 1, 1, 1, 1,
-0.9985682, 1.331971, 1.904737, 1, 1, 1, 1, 1,
-0.9860079, 0.5392271, -0.9640083, 1, 1, 1, 1, 1,
-0.9800557, 1.394998, -0.1583154, 1, 1, 1, 1, 1,
-0.9723147, 0.8781154, 0.9583207, 1, 1, 1, 1, 1,
-0.9716338, -0.8158816, -2.028785, 1, 1, 1, 1, 1,
-0.9696258, 0.1687556, -2.351584, 1, 1, 1, 1, 1,
-0.9695551, -1.782715, -3.06008, 1, 1, 1, 1, 1,
-0.9591815, -0.6560643, 0.2099192, 1, 1, 1, 1, 1,
-0.9511114, 0.5238278, -2.323715, 1, 1, 1, 1, 1,
-0.9457079, 0.5562723, -1.563945, 1, 1, 1, 1, 1,
-0.945006, -0.5856879, 0.2879096, 1, 1, 1, 1, 1,
-0.9415899, -0.8569588, -3.103295, 1, 1, 1, 1, 1,
-0.9363952, -1.339209, -1.922874, 1, 1, 1, 1, 1,
-0.933853, -0.4009274, -2.173609, 1, 1, 1, 1, 1,
-0.9317848, 0.7196416, -2.554791, 0, 0, 1, 1, 1,
-0.9282689, 0.9309708, -2.646346, 1, 0, 0, 1, 1,
-0.9282134, -0.6025654, -2.9534, 1, 0, 0, 1, 1,
-0.9231221, 1.521806, -0.6000813, 1, 0, 0, 1, 1,
-0.9184111, -0.7239001, -2.039511, 1, 0, 0, 1, 1,
-0.91447, -0.09798933, -1.643619, 1, 0, 0, 1, 1,
-0.9102668, -1.279787, -1.899628, 0, 0, 0, 1, 1,
-0.9019312, 1.040338, -1.745558, 0, 0, 0, 1, 1,
-0.899725, -0.6158544, -2.262738, 0, 0, 0, 1, 1,
-0.8863286, 0.1608991, -2.025058, 0, 0, 0, 1, 1,
-0.8845854, 0.4122157, -1.764579, 0, 0, 0, 1, 1,
-0.8809389, -0.4501531, -2.486744, 0, 0, 0, 1, 1,
-0.8802432, 1.253774, 0.8099968, 0, 0, 0, 1, 1,
-0.8794884, -0.3489433, -2.543541, 1, 1, 1, 1, 1,
-0.8660398, -0.8502405, -2.622146, 1, 1, 1, 1, 1,
-0.8650433, 1.859218, -0.2903783, 1, 1, 1, 1, 1,
-0.8627487, 0.7130421, -1.887318, 1, 1, 1, 1, 1,
-0.8624304, 2.14075, -0.228514, 1, 1, 1, 1, 1,
-0.8615298, 1.445229, -1.356647, 1, 1, 1, 1, 1,
-0.8554782, -0.05565361, -1.079186, 1, 1, 1, 1, 1,
-0.8537086, 0.1914307, -2.288181, 1, 1, 1, 1, 1,
-0.8532181, 0.5569978, -0.1401097, 1, 1, 1, 1, 1,
-0.84726, 0.8149623, -0.9651116, 1, 1, 1, 1, 1,
-0.8444042, 0.2543824, -0.8166523, 1, 1, 1, 1, 1,
-0.8361849, -0.2029676, -1.195233, 1, 1, 1, 1, 1,
-0.8344796, 1.442337, -1.339681, 1, 1, 1, 1, 1,
-0.823043, -0.189655, -1.591872, 1, 1, 1, 1, 1,
-0.8214555, 2.051362, -0.3029791, 1, 1, 1, 1, 1,
-0.8199707, 0.4257955, -1.448749, 0, 0, 1, 1, 1,
-0.8182034, -0.1144602, -1.678246, 1, 0, 0, 1, 1,
-0.816254, -1.033212, -2.715493, 1, 0, 0, 1, 1,
-0.8159816, 1.067377, -2.203484, 1, 0, 0, 1, 1,
-0.8104572, 0.3799451, -0.1919663, 1, 0, 0, 1, 1,
-0.8062965, 1.081981, -0.7502607, 1, 0, 0, 1, 1,
-0.7974626, -0.8746747, -2.175126, 0, 0, 0, 1, 1,
-0.7926946, -1.675255, -3.113958, 0, 0, 0, 1, 1,
-0.7922255, -1.904392, -1.005495, 0, 0, 0, 1, 1,
-0.7845718, -1.533448, -1.7588, 0, 0, 0, 1, 1,
-0.78434, 1.194929, -0.4077055, 0, 0, 0, 1, 1,
-0.7778602, -0.4505539, -1.645678, 0, 0, 0, 1, 1,
-0.7723604, 0.4228289, -0.7657489, 0, 0, 0, 1, 1,
-0.7718205, -1.461143, -3.532128, 1, 1, 1, 1, 1,
-0.7714427, -0.3263809, -2.244337, 1, 1, 1, 1, 1,
-0.7701424, -1.015552, -2.244, 1, 1, 1, 1, 1,
-0.7657545, -1.092021, -1.395822, 1, 1, 1, 1, 1,
-0.7567797, 0.5538823, 0.2779571, 1, 1, 1, 1, 1,
-0.7559649, 0.800166, -1.510703, 1, 1, 1, 1, 1,
-0.7445769, 0.2051633, 0.007858415, 1, 1, 1, 1, 1,
-0.7423577, -1.932317, -2.652553, 1, 1, 1, 1, 1,
-0.7410238, 0.5777485, -2.047965, 1, 1, 1, 1, 1,
-0.7333111, -0.1243648, -0.4851857, 1, 1, 1, 1, 1,
-0.7268593, 0.2957564, -0.1314919, 1, 1, 1, 1, 1,
-0.7261922, 0.1567398, -0.7350764, 1, 1, 1, 1, 1,
-0.7234174, 1.024359, -1.519337, 1, 1, 1, 1, 1,
-0.7217147, -0.1896849, -1.314898, 1, 1, 1, 1, 1,
-0.7154313, -1.200454, -3.230042, 1, 1, 1, 1, 1,
-0.7117774, 1.66156, 1.170822, 0, 0, 1, 1, 1,
-0.709985, -0.3321173, -3.7702, 1, 0, 0, 1, 1,
-0.7077326, -0.709518, -3.187229, 1, 0, 0, 1, 1,
-0.7044175, -1.245828, -3.842801, 1, 0, 0, 1, 1,
-0.7000135, -0.09638758, -2.183149, 1, 0, 0, 1, 1,
-0.6992963, -0.08565186, -2.758469, 1, 0, 0, 1, 1,
-0.6947028, 0.01808298, -1.406373, 0, 0, 0, 1, 1,
-0.6934762, -0.3565257, -0.5906329, 0, 0, 0, 1, 1,
-0.687266, -2.631159, -3.373215, 0, 0, 0, 1, 1,
-0.6864269, -1.863464, -0.5021241, 0, 0, 0, 1, 1,
-0.6734726, -0.04620713, -2.781853, 0, 0, 0, 1, 1,
-0.6726211, -0.9153712, -1.869495, 0, 0, 0, 1, 1,
-0.6721289, -1.575799, -4.287299, 0, 0, 0, 1, 1,
-0.6694697, -0.9557372, -1.743006, 1, 1, 1, 1, 1,
-0.6630495, 0.4379228, -1.13537, 1, 1, 1, 1, 1,
-0.65584, 0.07560593, -2.566247, 1, 1, 1, 1, 1,
-0.6550075, -1.579348, -2.872127, 1, 1, 1, 1, 1,
-0.6523849, 1.045635, -1.813029, 1, 1, 1, 1, 1,
-0.644484, -1.793622, -1.814099, 1, 1, 1, 1, 1,
-0.6422733, -1.46542, -1.543629, 1, 1, 1, 1, 1,
-0.6415721, 1.293339, 0.8098364, 1, 1, 1, 1, 1,
-0.6386745, -0.003994889, -0.6077647, 1, 1, 1, 1, 1,
-0.6323544, 1.240857, 0.7604586, 1, 1, 1, 1, 1,
-0.6299204, 0.2139075, -1.972234, 1, 1, 1, 1, 1,
-0.6273925, -0.8543288, -2.020948, 1, 1, 1, 1, 1,
-0.6266324, -0.6391996, -2.860188, 1, 1, 1, 1, 1,
-0.6218093, 0.5468376, -1.918854, 1, 1, 1, 1, 1,
-0.6198519, -0.3611048, -2.406585, 1, 1, 1, 1, 1,
-0.6166966, 2.41385, -0.1887573, 0, 0, 1, 1, 1,
-0.6157093, -1.551331, -1.407995, 1, 0, 0, 1, 1,
-0.6139212, 0.7309881, 0.2818803, 1, 0, 0, 1, 1,
-0.6129149, -0.09722446, -1.938388, 1, 0, 0, 1, 1,
-0.6114883, -1.479303, -4.132348, 1, 0, 0, 1, 1,
-0.6043165, -0.5286353, -3.486361, 1, 0, 0, 1, 1,
-0.6028083, -0.1052323, -1.73565, 0, 0, 0, 1, 1,
-0.6016623, -0.6509617, -2.111516, 0, 0, 0, 1, 1,
-0.601313, -0.5632213, -2.862457, 0, 0, 0, 1, 1,
-0.5973122, -0.7906775, -2.134075, 0, 0, 0, 1, 1,
-0.5966659, -0.9524546, -2.323485, 0, 0, 0, 1, 1,
-0.5954724, -1.996572, -2.186754, 0, 0, 0, 1, 1,
-0.5917285, 0.1752739, -1.051405, 0, 0, 0, 1, 1,
-0.5859322, -0.593734, -2.21096, 1, 1, 1, 1, 1,
-0.5856782, -0.2205024, -3.136162, 1, 1, 1, 1, 1,
-0.5848237, -0.3316371, -2.809445, 1, 1, 1, 1, 1,
-0.5836155, 1.496427, -0.255843, 1, 1, 1, 1, 1,
-0.5821895, -0.7155457, -2.40503, 1, 1, 1, 1, 1,
-0.5735223, -0.4675928, -3.264934, 1, 1, 1, 1, 1,
-0.572912, -0.04825826, -2.093623, 1, 1, 1, 1, 1,
-0.5701689, 0.5685449, 0.4215172, 1, 1, 1, 1, 1,
-0.5527717, 0.3973878, -0.682406, 1, 1, 1, 1, 1,
-0.5527623, 1.131313, -2.377423, 1, 1, 1, 1, 1,
-0.5500249, 0.4435754, -1.300282, 1, 1, 1, 1, 1,
-0.5417938, -0.4417011, -3.514453, 1, 1, 1, 1, 1,
-0.5290879, -1.518299, -4.422103, 1, 1, 1, 1, 1,
-0.528255, 0.9750705, 0.8025064, 1, 1, 1, 1, 1,
-0.5270866, 0.8893985, 1.128293, 1, 1, 1, 1, 1,
-0.5231035, 0.3439947, -0.5349675, 0, 0, 1, 1, 1,
-0.5220506, -0.1060763, -1.537929, 1, 0, 0, 1, 1,
-0.5208449, 0.1465157, -1.276616, 1, 0, 0, 1, 1,
-0.5198852, 0.4782449, -1.758942, 1, 0, 0, 1, 1,
-0.5151776, 0.7691034, 0.185015, 1, 0, 0, 1, 1,
-0.5028611, -0.7299014, -0.3003972, 1, 0, 0, 1, 1,
-0.5016938, 0.4231069, -2.214282, 0, 0, 0, 1, 1,
-0.5010094, -1.681314, -2.577425, 0, 0, 0, 1, 1,
-0.4993467, 1.02665, -0.4834104, 0, 0, 0, 1, 1,
-0.4958864, 0.3668207, -1.159438, 0, 0, 0, 1, 1,
-0.4933836, 0.1999839, -1.537525, 0, 0, 0, 1, 1,
-0.4915216, 0.3837993, -1.120156, 0, 0, 0, 1, 1,
-0.4878502, 0.9713033, 0.2499708, 0, 0, 0, 1, 1,
-0.4866234, -0.6489999, -3.810186, 1, 1, 1, 1, 1,
-0.4847849, -0.9474351, -3.513784, 1, 1, 1, 1, 1,
-0.4838587, 0.2576315, -0.6566426, 1, 1, 1, 1, 1,
-0.4829991, 1.029091, -0.7622637, 1, 1, 1, 1, 1,
-0.4761942, 1.505278, -1.194699, 1, 1, 1, 1, 1,
-0.4741765, 0.7108167, -0.1727287, 1, 1, 1, 1, 1,
-0.4678164, -1.094201, -3.638698, 1, 1, 1, 1, 1,
-0.4675898, -0.1426426, -2.267327, 1, 1, 1, 1, 1,
-0.4669896, 0.4600629, -0.4249333, 1, 1, 1, 1, 1,
-0.4603665, -0.4291836, -3.034985, 1, 1, 1, 1, 1,
-0.4576118, 0.04325766, -1.163621, 1, 1, 1, 1, 1,
-0.4573603, -2.030799, -1.748296, 1, 1, 1, 1, 1,
-0.4533798, -0.7901674, -5.63506, 1, 1, 1, 1, 1,
-0.452641, 0.528625, -2.664497, 1, 1, 1, 1, 1,
-0.4521852, 0.7559, 0.320633, 1, 1, 1, 1, 1,
-0.4493286, -1.161384, -1.850626, 0, 0, 1, 1, 1,
-0.4467795, 0.8487771, -0.4130084, 1, 0, 0, 1, 1,
-0.4421401, -2.912216, -3.375342, 1, 0, 0, 1, 1,
-0.4382753, 0.815523, 0.4168556, 1, 0, 0, 1, 1,
-0.430988, -0.06354573, -1.919803, 1, 0, 0, 1, 1,
-0.4271847, 1.98826, 0.1489044, 1, 0, 0, 1, 1,
-0.4266985, 0.006215448, -1.639184, 0, 0, 0, 1, 1,
-0.4222172, -0.4699371, -3.616558, 0, 0, 0, 1, 1,
-0.41284, 1.750259, -1.515478, 0, 0, 0, 1, 1,
-0.4054099, -0.8256902, -2.935955, 0, 0, 0, 1, 1,
-0.4051017, 0.3071352, -1.458767, 0, 0, 0, 1, 1,
-0.4023508, -1.124234, -2.137012, 0, 0, 0, 1, 1,
-0.3995747, 0.1319095, -2.684948, 0, 0, 0, 1, 1,
-0.3995378, -0.08026113, -1.40407, 1, 1, 1, 1, 1,
-0.3983447, -0.7907228, -3.819187, 1, 1, 1, 1, 1,
-0.3885387, -0.4494233, -2.807979, 1, 1, 1, 1, 1,
-0.3860976, 0.1552242, -0.5320094, 1, 1, 1, 1, 1,
-0.3846165, -1.004517, -1.955526, 1, 1, 1, 1, 1,
-0.3845893, 0.03963765, -3.019249, 1, 1, 1, 1, 1,
-0.3831663, 1.241011, 0.7402615, 1, 1, 1, 1, 1,
-0.3797423, 0.3237396, -1.111693, 1, 1, 1, 1, 1,
-0.3789503, -0.2999052, 0.2013725, 1, 1, 1, 1, 1,
-0.3784793, 0.7395426, 0.3861797, 1, 1, 1, 1, 1,
-0.378056, 0.09843431, -1.742978, 1, 1, 1, 1, 1,
-0.3757321, 1.023016, -0.1964055, 1, 1, 1, 1, 1,
-0.3739443, 0.2009623, -2.219599, 1, 1, 1, 1, 1,
-0.3714652, 0.5072723, -0.6511637, 1, 1, 1, 1, 1,
-0.3697869, -0.5950909, -3.112508, 1, 1, 1, 1, 1,
-0.369741, 1.162109, -0.7723127, 0, 0, 1, 1, 1,
-0.3584614, -0.4106063, -5.601594, 1, 0, 0, 1, 1,
-0.3584376, 1.740328, 1.652326, 1, 0, 0, 1, 1,
-0.3582756, 0.1309582, -0.141576, 1, 0, 0, 1, 1,
-0.3574353, -1.355095, -1.567396, 1, 0, 0, 1, 1,
-0.3572985, 2.029607, -2.239501, 1, 0, 0, 1, 1,
-0.3498839, -0.5192536, -2.198403, 0, 0, 0, 1, 1,
-0.3471479, -1.56256, -3.248101, 0, 0, 0, 1, 1,
-0.3460357, -0.3237702, -2.822887, 0, 0, 0, 1, 1,
-0.3459982, -0.8347861, -2.583579, 0, 0, 0, 1, 1,
-0.3420505, -0.385573, -4.152564, 0, 0, 0, 1, 1,
-0.339926, -1.660365, -3.634466, 0, 0, 0, 1, 1,
-0.3385636, -0.5441689, -1.602072, 0, 0, 0, 1, 1,
-0.33405, -0.2347069, -2.280005, 1, 1, 1, 1, 1,
-0.3324103, 0.6458167, -1.881297, 1, 1, 1, 1, 1,
-0.3243164, 1.73214, -0.6764756, 1, 1, 1, 1, 1,
-0.3204862, 2.130925, -0.2983479, 1, 1, 1, 1, 1,
-0.3202274, -0.2774528, -1.074467, 1, 1, 1, 1, 1,
-0.3186894, -0.004771505, -1.897069, 1, 1, 1, 1, 1,
-0.315668, 0.1463498, -1.986179, 1, 1, 1, 1, 1,
-0.3150843, -0.114133, -2.186445, 1, 1, 1, 1, 1,
-0.3147108, 0.5678672, -1.272343, 1, 1, 1, 1, 1,
-0.3129465, -0.6459852, -1.778775, 1, 1, 1, 1, 1,
-0.3094889, 0.9069443, -0.496824, 1, 1, 1, 1, 1,
-0.3067644, -0.3580932, -1.980202, 1, 1, 1, 1, 1,
-0.3063105, 0.7705578, -0.6670122, 1, 1, 1, 1, 1,
-0.3062086, 1.149635, -0.1832419, 1, 1, 1, 1, 1,
-0.3058912, -0.3294688, -4.117877, 1, 1, 1, 1, 1,
-0.3035868, -1.989887, -2.731257, 0, 0, 1, 1, 1,
-0.2967484, -0.7136167, -0.6971327, 1, 0, 0, 1, 1,
-0.2899909, -0.3280789, -0.8014174, 1, 0, 0, 1, 1,
-0.2894517, 1.225242, 0.8292013, 1, 0, 0, 1, 1,
-0.2849023, 0.1350809, -2.645367, 1, 0, 0, 1, 1,
-0.2834311, 1.855327, -0.03132926, 1, 0, 0, 1, 1,
-0.2788103, -0.795021, -2.750176, 0, 0, 0, 1, 1,
-0.2784643, -0.6401213, -3.454006, 0, 0, 0, 1, 1,
-0.2702171, 0.3873281, -0.2321391, 0, 0, 0, 1, 1,
-0.266958, 0.979313, -0.4528565, 0, 0, 0, 1, 1,
-0.2662413, 0.6759415, -1.46144, 0, 0, 0, 1, 1,
-0.2548753, 1.066237, -1.238716, 0, 0, 0, 1, 1,
-0.254325, 0.526337, 1.108321, 0, 0, 0, 1, 1,
-0.2522653, 0.7901579, -0.5418401, 1, 1, 1, 1, 1,
-0.2512838, 1.953564, -0.479782, 1, 1, 1, 1, 1,
-0.2499149, -0.5263258, -2.549405, 1, 1, 1, 1, 1,
-0.2476356, 0.2622059, -0.4951593, 1, 1, 1, 1, 1,
-0.2425715, 0.8597462, -1.105353, 1, 1, 1, 1, 1,
-0.239657, -1.36931, -1.68, 1, 1, 1, 1, 1,
-0.2362071, -0.623606, -3.297897, 1, 1, 1, 1, 1,
-0.2349822, -1.728067, -2.945863, 1, 1, 1, 1, 1,
-0.2333284, 1.861206, 0.5784859, 1, 1, 1, 1, 1,
-0.2304969, 0.482798, -1.297636, 1, 1, 1, 1, 1,
-0.2303395, 0.1836989, -0.004172063, 1, 1, 1, 1, 1,
-0.2272258, 1.450025, -1.548921, 1, 1, 1, 1, 1,
-0.2270636, 0.361342, -1.357727, 1, 1, 1, 1, 1,
-0.2262749, -0.9396383, -2.36566, 1, 1, 1, 1, 1,
-0.2241081, -1.123778, -2.854832, 1, 1, 1, 1, 1,
-0.2232085, -0.860241, -3.116255, 0, 0, 1, 1, 1,
-0.2163897, -1.717922, -1.787078, 1, 0, 0, 1, 1,
-0.2161008, 0.2737769, -0.4846196, 1, 0, 0, 1, 1,
-0.2131595, -0.7687461, -4.711083, 1, 0, 0, 1, 1,
-0.2124901, -1.20921, -4.83208, 1, 0, 0, 1, 1,
-0.2036592, 0.1646337, -0.3047132, 1, 0, 0, 1, 1,
-0.202827, -1.24731, -3.04557, 0, 0, 0, 1, 1,
-0.2014547, 0.03878409, -0.7742829, 0, 0, 0, 1, 1,
-0.2002401, -0.2681531, -1.626215, 0, 0, 0, 1, 1,
-0.1975827, 0.7355334, -1.565226, 0, 0, 0, 1, 1,
-0.1953934, 0.7496287, -0.09960626, 0, 0, 0, 1, 1,
-0.1932643, -0.167494, -2.780499, 0, 0, 0, 1, 1,
-0.1893214, -0.6241886, -3.942445, 0, 0, 0, 1, 1,
-0.1880322, 0.04239077, -1.572687, 1, 1, 1, 1, 1,
-0.1873224, -2.109533, -4.621807, 1, 1, 1, 1, 1,
-0.1863214, -1.254703, -3.934222, 1, 1, 1, 1, 1,
-0.1861512, -0.5666201, -3.507855, 1, 1, 1, 1, 1,
-0.183345, -0.449979, -2.661085, 1, 1, 1, 1, 1,
-0.1782862, -0.1149926, -4.021916, 1, 1, 1, 1, 1,
-0.1779402, 0.5159922, -0.5165575, 1, 1, 1, 1, 1,
-0.1755284, 0.09904707, -0.2764585, 1, 1, 1, 1, 1,
-0.1753531, 3.273528, -0.2608302, 1, 1, 1, 1, 1,
-0.1749039, -1.78171, -2.629075, 1, 1, 1, 1, 1,
-0.1744081, -0.6841187, -3.259537, 1, 1, 1, 1, 1,
-0.172786, 0.9030637, -0.1434812, 1, 1, 1, 1, 1,
-0.1727199, -0.6033242, -0.7632442, 1, 1, 1, 1, 1,
-0.1692658, -0.1339542, -1.977609, 1, 1, 1, 1, 1,
-0.1678225, 0.6948633, -1.271008, 1, 1, 1, 1, 1,
-0.1648937, 0.5629886, 0.1553017, 0, 0, 1, 1, 1,
-0.1603401, 1.265835, 0.1846661, 1, 0, 0, 1, 1,
-0.1597214, 0.3280554, -1.55706, 1, 0, 0, 1, 1,
-0.1577875, 0.1750256, 0.09895366, 1, 0, 0, 1, 1,
-0.1572838, -1.181574, -1.58452, 1, 0, 0, 1, 1,
-0.156096, 0.2024633, -0.1942174, 1, 0, 0, 1, 1,
-0.1542118, -1.386815, -3.883752, 0, 0, 0, 1, 1,
-0.1535251, -0.7222534, -2.860893, 0, 0, 0, 1, 1,
-0.151919, 0.3999477, -0.06193887, 0, 0, 0, 1, 1,
-0.1506662, -0.3398982, -3.595509, 0, 0, 0, 1, 1,
-0.1501891, 1.800495, -0.6631758, 0, 0, 0, 1, 1,
-0.1486292, -0.5870505, -3.568155, 0, 0, 0, 1, 1,
-0.1460897, -0.3309631, -0.7871721, 0, 0, 0, 1, 1,
-0.1435233, 1.504582, 1.053998, 1, 1, 1, 1, 1,
-0.1433513, 0.2181856, -1.143631, 1, 1, 1, 1, 1,
-0.1416054, -1.762046, -2.835099, 1, 1, 1, 1, 1,
-0.141179, 0.08870797, -0.614647, 1, 1, 1, 1, 1,
-0.1405281, -0.1887008, -0.8913249, 1, 1, 1, 1, 1,
-0.1396153, 0.9995335, -1.488305, 1, 1, 1, 1, 1,
-0.1385538, -0.3868179, -3.099018, 1, 1, 1, 1, 1,
-0.1383203, -0.1067266, -1.991755, 1, 1, 1, 1, 1,
-0.1328691, -0.7311921, -2.850006, 1, 1, 1, 1, 1,
-0.1268937, 0.6553165, 0.5112637, 1, 1, 1, 1, 1,
-0.1191328, 0.9878809, -1.175291, 1, 1, 1, 1, 1,
-0.1137222, 0.4865007, -0.4698331, 1, 1, 1, 1, 1,
-0.1111287, -0.9697056, -4.768835, 1, 1, 1, 1, 1,
-0.1103963, -0.3263181, -2.348042, 1, 1, 1, 1, 1,
-0.1100368, -0.04879, -3.585786, 1, 1, 1, 1, 1,
-0.1069536, -0.3316203, -1.171135, 0, 0, 1, 1, 1,
-0.1057028, 0.3765153, -0.6787846, 1, 0, 0, 1, 1,
-0.1039357, -1.045037, -4.07389, 1, 0, 0, 1, 1,
-0.1009219, -0.5281034, -2.219854, 1, 0, 0, 1, 1,
-0.09913353, 2.441585, 0.7228121, 1, 0, 0, 1, 1,
-0.09781787, 0.3595282, -0.4410578, 1, 0, 0, 1, 1,
-0.09690879, 0.3612497, -0.7432531, 0, 0, 0, 1, 1,
-0.09462667, -0.3394617, -2.305729, 0, 0, 0, 1, 1,
-0.09188337, 0.1056613, 0.1581311, 0, 0, 0, 1, 1,
-0.09165362, 0.2144886, -1.695238, 0, 0, 0, 1, 1,
-0.08968069, -0.1829182, -2.138707, 0, 0, 0, 1, 1,
-0.08614299, 1.642989, -0.6615817, 0, 0, 0, 1, 1,
-0.08466373, 2.233053, 0.9761072, 0, 0, 0, 1, 1,
-0.0832742, 1.162275, -0.4900429, 1, 1, 1, 1, 1,
-0.07799711, -0.2297242, -3.458929, 1, 1, 1, 1, 1,
-0.07748421, 1.075994, -2.367498, 1, 1, 1, 1, 1,
-0.07361628, -0.3989397, -3.937255, 1, 1, 1, 1, 1,
-0.06948951, 1.482056, 1.01789, 1, 1, 1, 1, 1,
-0.06717235, 0.4075822, -0.4345988, 1, 1, 1, 1, 1,
-0.06309119, 1.224485, -1.532507, 1, 1, 1, 1, 1,
-0.0603803, 1.294544, 1.30749, 1, 1, 1, 1, 1,
-0.05929274, 1.535437, 0.5445673, 1, 1, 1, 1, 1,
-0.05918586, 1.253471, -0.3835143, 1, 1, 1, 1, 1,
-0.05816286, -0.04867039, -3.01789, 1, 1, 1, 1, 1,
-0.05512186, -2.341672, -4.074332, 1, 1, 1, 1, 1,
-0.05435372, -0.5672943, -4.611747, 1, 1, 1, 1, 1,
-0.05174124, -0.3381963, -1.815529, 1, 1, 1, 1, 1,
-0.05121794, 2.155362, -0.1512611, 1, 1, 1, 1, 1,
-0.05059067, 1.464824, 0.7158602, 0, 0, 1, 1, 1,
-0.04631273, 1.559335, -1.642356, 1, 0, 0, 1, 1,
-0.04565058, -0.6374521, -1.61006, 1, 0, 0, 1, 1,
-0.04524747, -1.056598, -3.729004, 1, 0, 0, 1, 1,
-0.04222876, 0.287013, -1.83121, 1, 0, 0, 1, 1,
-0.04139315, -0.3523344, -2.488686, 1, 0, 0, 1, 1,
-0.04123608, -0.8317708, -1.004058, 0, 0, 0, 1, 1,
-0.03958598, -0.9563981, -2.322555, 0, 0, 0, 1, 1,
-0.03721085, -0.3676807, -3.343182, 0, 0, 0, 1, 1,
-0.03676835, 1.05559, 0.3165806, 0, 0, 0, 1, 1,
-0.02903293, -2.003363, -1.269648, 0, 0, 0, 1, 1,
-0.02743533, -0.9222956, -3.600142, 0, 0, 0, 1, 1,
-0.02664675, 0.4710395, -0.224582, 0, 0, 0, 1, 1,
-0.02548582, 0.9486865, 1.093645, 1, 1, 1, 1, 1,
-0.02390839, 0.07369733, 0.4756996, 1, 1, 1, 1, 1,
-0.02265724, -0.6266128, -3.437716, 1, 1, 1, 1, 1,
-0.02112148, -1.206613, -3.706634, 1, 1, 1, 1, 1,
-0.02091182, 0.2759027, 0.3822098, 1, 1, 1, 1, 1,
-0.02079161, 0.1140293, -1.198902, 1, 1, 1, 1, 1,
-0.01474358, 1.410947, 0.6231331, 1, 1, 1, 1, 1,
-0.01384154, -1.747187, -3.647028, 1, 1, 1, 1, 1,
-0.01169976, -0.7426383, -2.120731, 1, 1, 1, 1, 1,
-0.009820235, -0.3262572, -2.163158, 1, 1, 1, 1, 1,
-0.007613483, 1.106195, -0.2405862, 1, 1, 1, 1, 1,
-0.006049446, 0.4797245, -0.8724291, 1, 1, 1, 1, 1,
-0.003730982, -0.1664694, -3.131253, 1, 1, 1, 1, 1,
-0.002808818, 0.9542194, -0.7578115, 1, 1, 1, 1, 1,
-0.002655552, -0.04633952, -3.529963, 1, 1, 1, 1, 1,
0.006681589, -1.732014, 1.650152, 0, 0, 1, 1, 1,
0.006933569, 0.02880761, -0.6105067, 1, 0, 0, 1, 1,
0.007874484, 0.8232371, -0.2781409, 1, 0, 0, 1, 1,
0.01057921, 0.03865153, -0.6547498, 1, 0, 0, 1, 1,
0.01110807, -0.6345778, 2.863808, 1, 0, 0, 1, 1,
0.01900041, 0.3964122, -1.093807, 1, 0, 0, 1, 1,
0.02446334, -2.758588, 4.02581, 0, 0, 0, 1, 1,
0.02494852, 0.6488811, 1.074749, 0, 0, 0, 1, 1,
0.02764955, 0.02568181, 0.7258748, 0, 0, 0, 1, 1,
0.04114622, 0.02879213, -0.2331208, 0, 0, 0, 1, 1,
0.04131764, -0.6216756, 2.469109, 0, 0, 0, 1, 1,
0.04265229, 0.3768965, -0.6690794, 0, 0, 0, 1, 1,
0.0469659, 0.8453471, 0.5528349, 0, 0, 0, 1, 1,
0.06005204, 1.030576, -0.4867299, 1, 1, 1, 1, 1,
0.06276524, 0.6240591, 1.627467, 1, 1, 1, 1, 1,
0.067095, -3.049703, 4.22844, 1, 1, 1, 1, 1,
0.06960005, 0.7347937, -0.1962857, 1, 1, 1, 1, 1,
0.07697769, -0.9108918, 2.449037, 1, 1, 1, 1, 1,
0.08716731, 1.234553, 0.1040775, 1, 1, 1, 1, 1,
0.08857419, -1.1123, 4.007888, 1, 1, 1, 1, 1,
0.09130023, 0.09360213, 1.571612, 1, 1, 1, 1, 1,
0.09232166, -1.043189, 1.772144, 1, 1, 1, 1, 1,
0.09664768, 1.053021, 0.7488567, 1, 1, 1, 1, 1,
0.1067231, 0.2010471, -0.625368, 1, 1, 1, 1, 1,
0.1078146, 0.5509948, -1.01023, 1, 1, 1, 1, 1,
0.1104932, -0.4539451, 3.494542, 1, 1, 1, 1, 1,
0.1123684, 0.9081911, 0.5387049, 1, 1, 1, 1, 1,
0.1127118, -0.3064725, 2.441943, 1, 1, 1, 1, 1,
0.1172272, 0.55415, -1.303287, 0, 0, 1, 1, 1,
0.1212582, 0.0008288266, -0.365201, 1, 0, 0, 1, 1,
0.1285476, 1.103425, 0.4180273, 1, 0, 0, 1, 1,
0.1302593, 1.649647, 0.3053032, 1, 0, 0, 1, 1,
0.1317283, 0.6029361, -1.741431, 1, 0, 0, 1, 1,
0.1388602, 2.040145, -0.5647232, 1, 0, 0, 1, 1,
0.1395035, 3.266413, 1.092411, 0, 0, 0, 1, 1,
0.1414455, -0.5362978, 5.103499, 0, 0, 0, 1, 1,
0.1521568, 0.4131548, -1.241303, 0, 0, 0, 1, 1,
0.1554278, 0.8501853, 0.6487222, 0, 0, 0, 1, 1,
0.1567119, -0.7283044, 2.403137, 0, 0, 0, 1, 1,
0.1571519, 0.00899761, 1.074825, 0, 0, 0, 1, 1,
0.159212, 0.5695634, 0.5450972, 0, 0, 0, 1, 1,
0.1593371, -1.422687, 2.484057, 1, 1, 1, 1, 1,
0.1643462, 0.1972916, -0.0366559, 1, 1, 1, 1, 1,
0.1645079, 0.1048223, 0.6433618, 1, 1, 1, 1, 1,
0.1647303, 0.937861, 1.77594, 1, 1, 1, 1, 1,
0.1696914, 0.1106218, 1.354732, 1, 1, 1, 1, 1,
0.1714437, 0.6349809, 0.8653157, 1, 1, 1, 1, 1,
0.1721691, -3.062016, 2.618365, 1, 1, 1, 1, 1,
0.1730589, -0.06000531, 0.7304814, 1, 1, 1, 1, 1,
0.1821094, 0.5152979, 1.191074, 1, 1, 1, 1, 1,
0.182724, 0.768849, 1.485828, 1, 1, 1, 1, 1,
0.1827497, -0.2135414, 3.488211, 1, 1, 1, 1, 1,
0.1828178, -0.6805226, 4.275376, 1, 1, 1, 1, 1,
0.1829714, -1.463175, 3.16449, 1, 1, 1, 1, 1,
0.1835949, 0.0238658, 2.191358, 1, 1, 1, 1, 1,
0.1858997, 0.08130952, -0.3414924, 1, 1, 1, 1, 1,
0.1959751, 1.233693, 0.6651842, 0, 0, 1, 1, 1,
0.205949, 0.1067689, 0.6330871, 1, 0, 0, 1, 1,
0.2101903, -0.8185338, 1.641054, 1, 0, 0, 1, 1,
0.2130319, -1.494519, 3.362666, 1, 0, 0, 1, 1,
0.2130916, -0.6737388, 2.995092, 1, 0, 0, 1, 1,
0.2131246, -0.06367593, 2.020163, 1, 0, 0, 1, 1,
0.2191678, -0.7215829, 2.52715, 0, 0, 0, 1, 1,
0.2223346, 1.388995, -2.013492, 0, 0, 0, 1, 1,
0.2227774, 0.8013416, 0.7413793, 0, 0, 0, 1, 1,
0.2328534, 0.7322, -0.07539742, 0, 0, 0, 1, 1,
0.2386599, -0.1375319, 2.895684, 0, 0, 0, 1, 1,
0.2411063, 1.517309, 0.8859548, 0, 0, 0, 1, 1,
0.2411884, 0.3660797, -1.214953, 0, 0, 0, 1, 1,
0.2428498, 0.1431326, 2.147969, 1, 1, 1, 1, 1,
0.2494716, -0.2897395, 4.559617, 1, 1, 1, 1, 1,
0.2498699, 0.399186, -0.7172886, 1, 1, 1, 1, 1,
0.2529764, -1.184508, 2.373568, 1, 1, 1, 1, 1,
0.2533322, 0.6664255, 1.29313, 1, 1, 1, 1, 1,
0.2594469, -1.043625, 2.436679, 1, 1, 1, 1, 1,
0.2637257, -0.78169, 4.667836, 1, 1, 1, 1, 1,
0.2694359, 0.08357508, 0.913637, 1, 1, 1, 1, 1,
0.2705542, 0.04038871, 1.659207, 1, 1, 1, 1, 1,
0.2705728, 1.316516, 1.500969, 1, 1, 1, 1, 1,
0.2723377, -0.1062314, 0.4473968, 1, 1, 1, 1, 1,
0.2768067, 0.989646, -0.08388181, 1, 1, 1, 1, 1,
0.2820683, -0.2998857, 4.832146, 1, 1, 1, 1, 1,
0.2916034, 0.5149167, 0.2944328, 1, 1, 1, 1, 1,
0.2944616, -0.7629982, 1.893035, 1, 1, 1, 1, 1,
0.2960608, -2.139066, 3.733745, 0, 0, 1, 1, 1,
0.2987548, -0.251478, 4.143116, 1, 0, 0, 1, 1,
0.3005931, -0.823016, 3.337032, 1, 0, 0, 1, 1,
0.3018585, -0.5670367, 1.656219, 1, 0, 0, 1, 1,
0.3038475, -0.3489883, 2.307071, 1, 0, 0, 1, 1,
0.3049528, -0.5941612, 2.473049, 1, 0, 0, 1, 1,
0.3088092, 0.4865323, 0.224957, 0, 0, 0, 1, 1,
0.3093438, -0.7867329, 4.080289, 0, 0, 0, 1, 1,
0.3103057, -0.0498244, 4.074585, 0, 0, 0, 1, 1,
0.3130966, 0.3378222, 0.6997272, 0, 0, 0, 1, 1,
0.3131823, 1.539011, 1.130332, 0, 0, 0, 1, 1,
0.3133213, -0.03995105, 1.34076, 0, 0, 0, 1, 1,
0.3160321, 1.963284, 1.997221, 0, 0, 0, 1, 1,
0.3166809, -0.9604672, 3.572724, 1, 1, 1, 1, 1,
0.3178585, -1.760997, 2.721095, 1, 1, 1, 1, 1,
0.3186722, 0.1827371, 0.9239656, 1, 1, 1, 1, 1,
0.3187597, 1.306137, 0.1543286, 1, 1, 1, 1, 1,
0.3207096, 0.1847267, 0.7459534, 1, 1, 1, 1, 1,
0.3223472, -1.075732, 0.5048324, 1, 1, 1, 1, 1,
0.3248169, -0.3300856, 2.737661, 1, 1, 1, 1, 1,
0.3264643, 2.250786, -1.382062, 1, 1, 1, 1, 1,
0.32882, -0.2827171, 2.795933, 1, 1, 1, 1, 1,
0.3296187, 0.3803685, 0.8104317, 1, 1, 1, 1, 1,
0.3312991, -1.88631, 3.134751, 1, 1, 1, 1, 1,
0.3367881, -0.9793183, 3.036381, 1, 1, 1, 1, 1,
0.3429657, -1.15616, 4.581262, 1, 1, 1, 1, 1,
0.3497642, -0.1381626, 1.906872, 1, 1, 1, 1, 1,
0.3525257, -2.745143, 5.308797, 1, 1, 1, 1, 1,
0.3549446, 0.8325417, -2.486481, 0, 0, 1, 1, 1,
0.3601577, -0.9898359, 2.355736, 1, 0, 0, 1, 1,
0.3699382, 0.6854421, -0.04319107, 1, 0, 0, 1, 1,
0.3761091, -0.9913056, 2.531502, 1, 0, 0, 1, 1,
0.3764629, 0.6206803, 2.169418, 1, 0, 0, 1, 1,
0.3775253, 0.06506597, 0.8632618, 1, 0, 0, 1, 1,
0.381939, -1.800292, 4.579948, 0, 0, 0, 1, 1,
0.3839406, -1.369255, 2.470553, 0, 0, 0, 1, 1,
0.3861974, -1.031415, 3.778164, 0, 0, 0, 1, 1,
0.3880808, 0.1820524, -0.3395954, 0, 0, 0, 1, 1,
0.3891625, 0.1206412, 1.912123, 0, 0, 0, 1, 1,
0.3916405, -0.3733295, 1.23188, 0, 0, 0, 1, 1,
0.3937025, 0.6363034, 0.230056, 0, 0, 0, 1, 1,
0.3987483, -1.624249, 3.070343, 1, 1, 1, 1, 1,
0.3998205, 0.2152276, 0.5751918, 1, 1, 1, 1, 1,
0.4004692, -1.815572, 1.32862, 1, 1, 1, 1, 1,
0.4007752, -0.09407952, 1.714228, 1, 1, 1, 1, 1,
0.402058, -1.421324, 3.891328, 1, 1, 1, 1, 1,
0.4023179, -0.8214284, 4.282712, 1, 1, 1, 1, 1,
0.4040461, 1.512809, -1.467489, 1, 1, 1, 1, 1,
0.404472, 0.3169447, -0.2513137, 1, 1, 1, 1, 1,
0.4110528, -2.44051, 3.462222, 1, 1, 1, 1, 1,
0.4130837, 0.9653416, -0.7158424, 1, 1, 1, 1, 1,
0.4136276, 0.1738228, 1.130622, 1, 1, 1, 1, 1,
0.4160294, -0.65944, 2.439251, 1, 1, 1, 1, 1,
0.4173337, -1.109782, 2.994923, 1, 1, 1, 1, 1,
0.4248547, 0.735751, 0.6149495, 1, 1, 1, 1, 1,
0.4262885, 0.9185821, -0.7411905, 1, 1, 1, 1, 1,
0.4294457, -1.292494, 3.510247, 0, 0, 1, 1, 1,
0.4301163, 0.8935003, 0.1402548, 1, 0, 0, 1, 1,
0.4307926, -0.6101313, 3.995417, 1, 0, 0, 1, 1,
0.432491, 1.034035, 1.069667, 1, 0, 0, 1, 1,
0.441448, -0.2350589, 4.266171, 1, 0, 0, 1, 1,
0.4422967, 0.005449636, 1.000461, 1, 0, 0, 1, 1,
0.4428065, 1.078092, -0.07223979, 0, 0, 0, 1, 1,
0.4552152, 0.606887, 1.441333, 0, 0, 0, 1, 1,
0.4575017, 0.6452217, 0.9408529, 0, 0, 0, 1, 1,
0.4589756, -0.8663597, 2.194171, 0, 0, 0, 1, 1,
0.4597293, 1.150512, 0.1243874, 0, 0, 0, 1, 1,
0.4648289, 0.1138695, 0.7540432, 0, 0, 0, 1, 1,
0.4662188, -0.948104, 3.658143, 0, 0, 0, 1, 1,
0.4695255, -0.4974228, 3.71364, 1, 1, 1, 1, 1,
0.470008, 0.2286862, 0.2998793, 1, 1, 1, 1, 1,
0.4709123, -2.22916, 3.909912, 1, 1, 1, 1, 1,
0.4746701, -0.008976233, 2.429449, 1, 1, 1, 1, 1,
0.4755352, 0.6922604, 0.2337229, 1, 1, 1, 1, 1,
0.4761825, 0.331691, 0.1194716, 1, 1, 1, 1, 1,
0.4824451, 0.2854699, 0.0004256357, 1, 1, 1, 1, 1,
0.4847059, 0.21069, 2.330964, 1, 1, 1, 1, 1,
0.4853441, 0.2331221, 1.601324, 1, 1, 1, 1, 1,
0.4858443, 1.6976, -0.3315227, 1, 1, 1, 1, 1,
0.4862917, 1.704936, 0.8763613, 1, 1, 1, 1, 1,
0.4871073, -0.05695842, 1.982316, 1, 1, 1, 1, 1,
0.4944458, 1.097759, -0.3214116, 1, 1, 1, 1, 1,
0.4954286, -1.422859, 3.844815, 1, 1, 1, 1, 1,
0.4960155, -0.03432211, 3.451453, 1, 1, 1, 1, 1,
0.498491, -2.247103, 3.808114, 0, 0, 1, 1, 1,
0.5023261, -1.049139, 3.033131, 1, 0, 0, 1, 1,
0.5054425, 1.526806, -0.04661501, 1, 0, 0, 1, 1,
0.5055125, -1.001972, 3.659736, 1, 0, 0, 1, 1,
0.5082017, 1.522164, -0.4155802, 1, 0, 0, 1, 1,
0.508835, 1.586583, -0.2809267, 1, 0, 0, 1, 1,
0.5128305, -0.7929486, 1.983159, 0, 0, 0, 1, 1,
0.5157951, 0.4954074, 2.23141, 0, 0, 0, 1, 1,
0.5175892, -1.375536, 1.128683, 0, 0, 0, 1, 1,
0.5188037, 0.9112548, -0.01868922, 0, 0, 0, 1, 1,
0.5234379, -0.2622461, -0.2050132, 0, 0, 0, 1, 1,
0.5262415, -0.07314558, 2.460942, 0, 0, 0, 1, 1,
0.5279138, 0.4147497, 1.020954, 0, 0, 0, 1, 1,
0.5291868, -2.187961, 3.347846, 1, 1, 1, 1, 1,
0.5298503, -0.9973761, 3.371129, 1, 1, 1, 1, 1,
0.5315866, 0.9338787, 0.5712995, 1, 1, 1, 1, 1,
0.5344208, -0.5312787, 3.06995, 1, 1, 1, 1, 1,
0.5380831, 0.380945, -0.4861223, 1, 1, 1, 1, 1,
0.5405439, 1.135233, 1.333971, 1, 1, 1, 1, 1,
0.5416168, 1.112354, 0.4861402, 1, 1, 1, 1, 1,
0.5446458, 0.0634615, 0.8713021, 1, 1, 1, 1, 1,
0.550189, 0.4309781, 3.07666, 1, 1, 1, 1, 1,
0.5507669, 0.3594974, -0.2425097, 1, 1, 1, 1, 1,
0.5526247, -0.1204034, 1.725473, 1, 1, 1, 1, 1,
0.553162, 0.5458409, 0.1146765, 1, 1, 1, 1, 1,
0.5557528, 1.51961, -0.3382648, 1, 1, 1, 1, 1,
0.5564254, 0.293602, 0.7522497, 1, 1, 1, 1, 1,
0.5578524, -1.071402, 2.556499, 1, 1, 1, 1, 1,
0.5638091, -0.4535469, 2.402248, 0, 0, 1, 1, 1,
0.5651897, -0.8125896, 1.3444, 1, 0, 0, 1, 1,
0.565504, 1.200922, 0.2856481, 1, 0, 0, 1, 1,
0.5657408, 0.405219, 1.371198, 1, 0, 0, 1, 1,
0.5665321, 1.045715, -0.433334, 1, 0, 0, 1, 1,
0.5672539, -1.978824, 2.429132, 1, 0, 0, 1, 1,
0.5697942, -0.04991433, 1.482212, 0, 0, 0, 1, 1,
0.5707403, 2.21853, -0.6385235, 0, 0, 0, 1, 1,
0.5754765, -0.6362266, 3.64656, 0, 0, 0, 1, 1,
0.5759108, 0.4923227, 0.07162217, 0, 0, 0, 1, 1,
0.5791726, -1.534882, 1.798154, 0, 0, 0, 1, 1,
0.580873, -0.4117778, 1.290403, 0, 0, 0, 1, 1,
0.5856677, 0.6744169, 1.462353, 0, 0, 0, 1, 1,
0.5919518, 0.3865338, 0.91263, 1, 1, 1, 1, 1,
0.5920096, -0.6954536, 3.261069, 1, 1, 1, 1, 1,
0.5921454, 0.5915017, 1.095476, 1, 1, 1, 1, 1,
0.6023123, 1.91488, 1.734276, 1, 1, 1, 1, 1,
0.6043526, -3.893466, 2.194974, 1, 1, 1, 1, 1,
0.6082338, 0.437005, 0.8238932, 1, 1, 1, 1, 1,
0.6119379, 0.2047258, 0.2456036, 1, 1, 1, 1, 1,
0.6254113, -0.766154, 3.676733, 1, 1, 1, 1, 1,
0.6297919, 0.3810332, -0.4163055, 1, 1, 1, 1, 1,
0.63454, 0.5346212, 0.4920838, 1, 1, 1, 1, 1,
0.6405182, -0.1246674, 1.18944, 1, 1, 1, 1, 1,
0.6407381, -0.0208256, 2.321002, 1, 1, 1, 1, 1,
0.6444886, -0.6824071, 2.829124, 1, 1, 1, 1, 1,
0.646603, 0.9930294, -2.536731, 1, 1, 1, 1, 1,
0.6487113, -0.3472471, 3.175672, 1, 1, 1, 1, 1,
0.660676, 0.1796287, 1.074039, 0, 0, 1, 1, 1,
0.6625452, -1.259324, 2.356884, 1, 0, 0, 1, 1,
0.6639053, -1.1472, 2.252312, 1, 0, 0, 1, 1,
0.664152, 0.5627239, 2.112085, 1, 0, 0, 1, 1,
0.6693797, -0.2024704, 0.3781275, 1, 0, 0, 1, 1,
0.6750501, 1.461069, 0.907233, 1, 0, 0, 1, 1,
0.6822886, -1.192766, 2.092542, 0, 0, 0, 1, 1,
0.6826473, 0.8735789, 0.7692351, 0, 0, 0, 1, 1,
0.6828757, -0.3690265, 1.32796, 0, 0, 0, 1, 1,
0.6833593, 1.149275, 0.4753609, 0, 0, 0, 1, 1,
0.6870561, -1.000318, 3.149006, 0, 0, 0, 1, 1,
0.6896968, -1.952411, 2.787664, 0, 0, 0, 1, 1,
0.6961278, -0.07140971, 3.217343, 0, 0, 0, 1, 1,
0.6974921, -0.5727086, 1.824156, 1, 1, 1, 1, 1,
0.7017145, 0.8450914, -1.090153, 1, 1, 1, 1, 1,
0.7033042, 1.190284, -1.65144, 1, 1, 1, 1, 1,
0.7037197, -1.676768, 2.683953, 1, 1, 1, 1, 1,
0.7051604, 0.2082298, 1.364466, 1, 1, 1, 1, 1,
0.7114228, -0.08746088, 1.446828, 1, 1, 1, 1, 1,
0.7196488, 1.703461, 1.002686, 1, 1, 1, 1, 1,
0.72054, -0.8266974, 2.73767, 1, 1, 1, 1, 1,
0.7239799, -0.3843136, 2.873093, 1, 1, 1, 1, 1,
0.7241034, -0.01602963, 2.864105, 1, 1, 1, 1, 1,
0.7310174, -1.056525, 1.837004, 1, 1, 1, 1, 1,
0.7401373, -0.5999917, 1.693291, 1, 1, 1, 1, 1,
0.749917, -1.193, 2.254128, 1, 1, 1, 1, 1,
0.7501474, 1.714676, 1.223624, 1, 1, 1, 1, 1,
0.75024, -0.6463875, 2.866558, 1, 1, 1, 1, 1,
0.7671977, -0.3876706, -0.4452202, 0, 0, 1, 1, 1,
0.770441, -0.4004618, 1.904129, 1, 0, 0, 1, 1,
0.772982, 0.8162596, 0.3975218, 1, 0, 0, 1, 1,
0.7740644, -0.2216019, 3.616396, 1, 0, 0, 1, 1,
0.7754474, 0.2825012, 1.604375, 1, 0, 0, 1, 1,
0.7762914, -0.08876582, 2.117672, 1, 0, 0, 1, 1,
0.7771854, -0.3130557, 1.572147, 0, 0, 0, 1, 1,
0.7773916, -0.9046047, 2.419547, 0, 0, 0, 1, 1,
0.7780165, -0.5378703, 2.354461, 0, 0, 0, 1, 1,
0.7793649, 0.3200011, 1.422425, 0, 0, 0, 1, 1,
0.7827958, -0.363663, 3.327121, 0, 0, 0, 1, 1,
0.7830976, -0.8225077, 0.9963301, 0, 0, 0, 1, 1,
0.7835597, 0.5892578, 0.8337222, 0, 0, 0, 1, 1,
0.7846398, 0.6849955, 2.660887, 1, 1, 1, 1, 1,
0.790472, 0.9294701, 2.575782, 1, 1, 1, 1, 1,
0.7906352, -1.31318, 4.154065, 1, 1, 1, 1, 1,
0.7950448, 0.8415415, -0.1941499, 1, 1, 1, 1, 1,
0.800167, 0.08910625, 1.955063, 1, 1, 1, 1, 1,
0.8044679, -0.1740252, 4.116967, 1, 1, 1, 1, 1,
0.8054799, -0.7681419, 1.525503, 1, 1, 1, 1, 1,
0.8091682, -0.4815166, 1.48839, 1, 1, 1, 1, 1,
0.810177, 1.468048, 0.04320463, 1, 1, 1, 1, 1,
0.8124428, -0.4331918, 2.435961, 1, 1, 1, 1, 1,
0.8141722, 0.2859758, 1.957935, 1, 1, 1, 1, 1,
0.8147584, -0.1423624, 0.9164783, 1, 1, 1, 1, 1,
0.8192957, -0.3521921, 1.64531, 1, 1, 1, 1, 1,
0.8200498, 0.7753698, 1.472315, 1, 1, 1, 1, 1,
0.8248628, -1.093742, 0.9950088, 1, 1, 1, 1, 1,
0.8255696, 0.5922294, 1.118123, 0, 0, 1, 1, 1,
0.8261913, -0.2728097, 1.003627, 1, 0, 0, 1, 1,
0.8289562, -1.615629, 2.777005, 1, 0, 0, 1, 1,
0.8299237, 0.0502211, 0.395523, 1, 0, 0, 1, 1,
0.830112, 0.8691093, 0.7024689, 1, 0, 0, 1, 1,
0.8385566, -1.522733, 1.202094, 1, 0, 0, 1, 1,
0.8385612, 1.293447, 0.2595468, 0, 0, 0, 1, 1,
0.8455755, 2.040347, 0.8227974, 0, 0, 0, 1, 1,
0.84624, 0.4492119, 2.603882, 0, 0, 0, 1, 1,
0.8496275, 0.1161701, 1.291607, 0, 0, 0, 1, 1,
0.8497834, -0.6888129, 2.48811, 0, 0, 0, 1, 1,
0.8560403, -0.6490775, 2.670385, 0, 0, 0, 1, 1,
0.85636, 0.7717055, 0.3043437, 0, 0, 0, 1, 1,
0.8568823, -1.432351, 1.664841, 1, 1, 1, 1, 1,
0.8601221, 1.605976, -0.1436477, 1, 1, 1, 1, 1,
0.861398, -0.245, 1.654745, 1, 1, 1, 1, 1,
0.8618613, -1.831486, 1.574438, 1, 1, 1, 1, 1,
0.8624171, 1.011436, 0.4042355, 1, 1, 1, 1, 1,
0.8655232, 1.765384, 0.172326, 1, 1, 1, 1, 1,
0.8743936, 1.098464, 2.044936, 1, 1, 1, 1, 1,
0.8749588, -0.8758734, 3.081897, 1, 1, 1, 1, 1,
0.8870956, 1.264999, 0.2371393, 1, 1, 1, 1, 1,
0.8886247, -0.9648722, 4.332044, 1, 1, 1, 1, 1,
0.8983545, 0.379504, 0.7631123, 1, 1, 1, 1, 1,
0.8996083, -0.7198604, 2.21314, 1, 1, 1, 1, 1,
0.8996316, -0.2079648, 1.339125, 1, 1, 1, 1, 1,
0.9015855, 0.2169901, 2.028472, 1, 1, 1, 1, 1,
0.9028496, -0.6159962, 1.317473, 1, 1, 1, 1, 1,
0.9061235, -1.223081, 4.056954, 0, 0, 1, 1, 1,
0.9080961, -1.401481, 2.788818, 1, 0, 0, 1, 1,
0.9105185, -0.4183499, 1.660442, 1, 0, 0, 1, 1,
0.9243504, 0.4187553, 2.844276, 1, 0, 0, 1, 1,
0.925213, 0.3538788, 0.8867269, 1, 0, 0, 1, 1,
0.9259306, 1.010772, 0.06003067, 1, 0, 0, 1, 1,
0.936085, 1.592739, 0.1039883, 0, 0, 0, 1, 1,
0.9430836, -2.100413, 2.687819, 0, 0, 0, 1, 1,
0.9462833, 0.7325656, 1.565647, 0, 0, 0, 1, 1,
0.948966, -1.69861, 3.056416, 0, 0, 0, 1, 1,
0.9523142, 1.478585, -0.2356579, 0, 0, 0, 1, 1,
0.9551109, 0.4032095, -0.208087, 0, 0, 0, 1, 1,
0.9586936, 0.6721089, 1.563246, 0, 0, 0, 1, 1,
0.9619448, 0.8034428, 0.5852461, 1, 1, 1, 1, 1,
0.9627372, -0.7871419, 2.182624, 1, 1, 1, 1, 1,
0.963048, -1.131904, 2.840561, 1, 1, 1, 1, 1,
0.9642525, 0.8302576, 1.989416, 1, 1, 1, 1, 1,
0.9691381, 0.08665511, 2.364999, 1, 1, 1, 1, 1,
0.9705587, -0.1885215, 2.726039, 1, 1, 1, 1, 1,
0.9779332, 0.8385109, -0.267452, 1, 1, 1, 1, 1,
0.9860343, 0.0004015325, 1.842476, 1, 1, 1, 1, 1,
1.010246, 0.1424601, 0.2037146, 1, 1, 1, 1, 1,
1.018907, 0.5269184, 0.9088714, 1, 1, 1, 1, 1,
1.0193, 1.824882, -0.2158793, 1, 1, 1, 1, 1,
1.020044, 1.06938, 2.713698, 1, 1, 1, 1, 1,
1.021736, 0.5579669, 1.934942, 1, 1, 1, 1, 1,
1.02473, 0.3375114, 2.895236, 1, 1, 1, 1, 1,
1.028435, -0.5333703, 1.830702, 1, 1, 1, 1, 1,
1.035137, -0.9633476, 3.087804, 0, 0, 1, 1, 1,
1.041734, -2.255874, 3.403734, 1, 0, 0, 1, 1,
1.046947, 0.3308076, 2.667944, 1, 0, 0, 1, 1,
1.046989, -0.4791457, 1.451977, 1, 0, 0, 1, 1,
1.050527, 0.4463089, 0.435122, 1, 0, 0, 1, 1,
1.053809, 0.9070772, 1.724247, 1, 0, 0, 1, 1,
1.060086, -2.13328, 0.2602364, 0, 0, 0, 1, 1,
1.060285, 0.4845433, 3.073114, 0, 0, 0, 1, 1,
1.062523, -1.410035, 2.849582, 0, 0, 0, 1, 1,
1.062651, 0.6940191, 2.14963, 0, 0, 0, 1, 1,
1.064706, -0.3308234, 2.518082, 0, 0, 0, 1, 1,
1.069568, 0.09916075, 3.095524, 0, 0, 0, 1, 1,
1.072172, -0.621514, 1.40678, 0, 0, 0, 1, 1,
1.075556, -0.7788348, 4.562581, 1, 1, 1, 1, 1,
1.083442, 0.6984133, 2.541103, 1, 1, 1, 1, 1,
1.086268, 0.4433831, -0.2576902, 1, 1, 1, 1, 1,
1.087064, -1.620591, 3.44577, 1, 1, 1, 1, 1,
1.088611, 0.3638331, -0.09777021, 1, 1, 1, 1, 1,
1.08941, 0.6360035, -1.008248, 1, 1, 1, 1, 1,
1.090994, -0.3373239, 1.900916, 1, 1, 1, 1, 1,
1.103249, -0.2783918, 1.884342, 1, 1, 1, 1, 1,
1.108282, 1.466354, 0.151397, 1, 1, 1, 1, 1,
1.118474, -0.2685305, 2.336443, 1, 1, 1, 1, 1,
1.123052, 0.7607821, 0.7080392, 1, 1, 1, 1, 1,
1.124834, 0.4231276, 0.6367648, 1, 1, 1, 1, 1,
1.128705, 0.3361333, 0.6188965, 1, 1, 1, 1, 1,
1.129825, 1.976606, 1.022349, 1, 1, 1, 1, 1,
1.131235, -0.6727409, 3.341706, 1, 1, 1, 1, 1,
1.141541, 2.052422, 0.3699968, 0, 0, 1, 1, 1,
1.141604, 2.018925, 0.3332253, 1, 0, 0, 1, 1,
1.144397, 0.6617959, 0.4564376, 1, 0, 0, 1, 1,
1.146817, 0.222837, 2.676911, 1, 0, 0, 1, 1,
1.149904, 1.58, 0.9704834, 1, 0, 0, 1, 1,
1.150519, 0.3154344, -0.2093436, 1, 0, 0, 1, 1,
1.155703, -1.751903, 1.973761, 0, 0, 0, 1, 1,
1.160254, 0.0837326, 0.9181839, 0, 0, 0, 1, 1,
1.167355, -0.9449389, 2.182942, 0, 0, 0, 1, 1,
1.172321, 1.544196, 0.7944857, 0, 0, 0, 1, 1,
1.178469, -1.532842, 1.83851, 0, 0, 0, 1, 1,
1.183053, 0.01481726, 1.544204, 0, 0, 0, 1, 1,
1.186935, 0.4236144, 1.818959, 0, 0, 0, 1, 1,
1.192509, 0.3139481, 2.119376, 1, 1, 1, 1, 1,
1.198795, 1.443343, 0.719274, 1, 1, 1, 1, 1,
1.201212, -0.3573491, 3.575706, 1, 1, 1, 1, 1,
1.216724, 1.425981, 1.168089, 1, 1, 1, 1, 1,
1.220672, -1.260746, 1.988218, 1, 1, 1, 1, 1,
1.222487, 1.307524, -0.1122167, 1, 1, 1, 1, 1,
1.231086, -0.6631267, 1.279738, 1, 1, 1, 1, 1,
1.239995, 0.1051237, 2.302293, 1, 1, 1, 1, 1,
1.25771, 0.3811029, 0.9477121, 1, 1, 1, 1, 1,
1.268756, 1.518673, 1.937707, 1, 1, 1, 1, 1,
1.271371, -0.2432104, 0.7273203, 1, 1, 1, 1, 1,
1.272326, 1.267905, 2.286484, 1, 1, 1, 1, 1,
1.286665, -0.09666453, 2.316515, 1, 1, 1, 1, 1,
1.291027, 1.493906, 1.139139, 1, 1, 1, 1, 1,
1.295009, -1.015755, 2.167896, 1, 1, 1, 1, 1,
1.302169, 0.5263836, 0.386841, 0, 0, 1, 1, 1,
1.305358, 1.02001, 0.3804854, 1, 0, 0, 1, 1,
1.307057, -0.8698348, 3.75473, 1, 0, 0, 1, 1,
1.307361, 0.7328944, 0.1462904, 1, 0, 0, 1, 1,
1.31549, -0.806074, 2.589928, 1, 0, 0, 1, 1,
1.319851, -1.776341, 1.096077, 1, 0, 0, 1, 1,
1.323552, -0.7684017, 0.5281413, 0, 0, 0, 1, 1,
1.324127, -0.1387855, 1.474594, 0, 0, 0, 1, 1,
1.331217, 0.05891525, 2.734892, 0, 0, 0, 1, 1,
1.338327, -1.275866, 3.536768, 0, 0, 0, 1, 1,
1.348184, -1.343439, 2.695524, 0, 0, 0, 1, 1,
1.354766, 1.292446, 1.807681, 0, 0, 0, 1, 1,
1.357084, -0.8427834, 2.530232, 0, 0, 0, 1, 1,
1.36863, -1.833062, 2.72986, 1, 1, 1, 1, 1,
1.382038, -0.3517997, 1.810919, 1, 1, 1, 1, 1,
1.384535, 1.321449, 0.2456478, 1, 1, 1, 1, 1,
1.391205, -0.07562193, 1.409482, 1, 1, 1, 1, 1,
1.403999, -0.7759629, 2.650031, 1, 1, 1, 1, 1,
1.407897, -1.402436, 3.271532, 1, 1, 1, 1, 1,
1.418928, -0.1422874, 1.593507, 1, 1, 1, 1, 1,
1.419208, -0.5174398, 4.43533, 1, 1, 1, 1, 1,
1.420863, -0.5670863, 1.210043, 1, 1, 1, 1, 1,
1.425779, -0.5877921, 0.8163273, 1, 1, 1, 1, 1,
1.429469, -0.3780175, 2.53915, 1, 1, 1, 1, 1,
1.434112, 0.4416001, 2.782329, 1, 1, 1, 1, 1,
1.439114, -1.699606, 2.920316, 1, 1, 1, 1, 1,
1.44882, 0.4773664, 2.062073, 1, 1, 1, 1, 1,
1.467092, 1.703188, -0.9779515, 1, 1, 1, 1, 1,
1.469007, 0.3334798, 0.9955726, 0, 0, 1, 1, 1,
1.472915, -0.05986949, 1.572468, 1, 0, 0, 1, 1,
1.476305, -0.02027802, 2.353002, 1, 0, 0, 1, 1,
1.47819, -0.5756746, 0.7574795, 1, 0, 0, 1, 1,
1.48094, -1.814292, 5.318904, 1, 0, 0, 1, 1,
1.482475, -0.5406492, 1.947823, 1, 0, 0, 1, 1,
1.488497, 0.06977851, 2.067952, 0, 0, 0, 1, 1,
1.512446, 0.1195497, 3.29204, 0, 0, 0, 1, 1,
1.5134, 1.216822, 1.617663, 0, 0, 0, 1, 1,
1.514507, 0.07887711, 2.176369, 0, 0, 0, 1, 1,
1.515073, 0.4703639, 0.6786918, 0, 0, 0, 1, 1,
1.532569, 0.2680932, 3.191427, 0, 0, 0, 1, 1,
1.53653, -1.066149, 3.560987, 0, 0, 0, 1, 1,
1.538821, -0.6485816, 2.008569, 1, 1, 1, 1, 1,
1.540566, 0.590889, 2.962066, 1, 1, 1, 1, 1,
1.541089, -1.442217, 0.8468921, 1, 1, 1, 1, 1,
1.54415, 0.1279278, 1.494729, 1, 1, 1, 1, 1,
1.578256, 0.4238215, 1.134786, 1, 1, 1, 1, 1,
1.594218, -0.1742961, 2.123747, 1, 1, 1, 1, 1,
1.599618, -1.082496, 1.308548, 1, 1, 1, 1, 1,
1.601431, -1.109486, 1.528083, 1, 1, 1, 1, 1,
1.614811, 1.00606, 1.056181, 1, 1, 1, 1, 1,
1.624926, -0.2872746, 3.098734, 1, 1, 1, 1, 1,
1.628276, -0.6787591, 0.693697, 1, 1, 1, 1, 1,
1.629506, -1.328537, 3.030521, 1, 1, 1, 1, 1,
1.645144, 0.9796062, 1.01262, 1, 1, 1, 1, 1,
1.647565, -1.260919, 2.909972, 1, 1, 1, 1, 1,
1.648263, 1.109299, 0.9550886, 1, 1, 1, 1, 1,
1.651561, 1.226348, 3.105191, 0, 0, 1, 1, 1,
1.657241, -2.006531, 2.917233, 1, 0, 0, 1, 1,
1.666259, 0.4663573, 0.9343265, 1, 0, 0, 1, 1,
1.677461, -0.8222133, -0.06685573, 1, 0, 0, 1, 1,
1.694414, 1.194247, 0.9942619, 1, 0, 0, 1, 1,
1.710278, -1.240204, 2.988005, 1, 0, 0, 1, 1,
1.733367, -1.680892, 4.209089, 0, 0, 0, 1, 1,
1.74225, -1.310913, 2.56329, 0, 0, 0, 1, 1,
1.752127, 0.320247, 1.599626, 0, 0, 0, 1, 1,
1.752599, -0.2742691, 1.302242, 0, 0, 0, 1, 1,
1.765142, -0.2591386, 1.617253, 0, 0, 0, 1, 1,
1.772406, -1.247332, -0.2286732, 0, 0, 0, 1, 1,
1.781853, -0.1585031, 1.424141, 0, 0, 0, 1, 1,
1.78563, 0.8231171, 0.01380767, 1, 1, 1, 1, 1,
1.794971, 0.2325762, 1.447478, 1, 1, 1, 1, 1,
1.806833, 2.190719, 0.8825349, 1, 1, 1, 1, 1,
1.811479, -0.9094551, 0.3777975, 1, 1, 1, 1, 1,
1.822604, 1.66058, -0.1806854, 1, 1, 1, 1, 1,
1.826021, -0.1521481, 2.702556, 1, 1, 1, 1, 1,
1.851554, -2.137147, 2.756803, 1, 1, 1, 1, 1,
1.860029, 0.8408199, 2.283092, 1, 1, 1, 1, 1,
1.876714, -0.5903754, 2.08881, 1, 1, 1, 1, 1,
1.892554, 0.6338801, 1.942062, 1, 1, 1, 1, 1,
1.918696, 0.8973051, 0.6822405, 1, 1, 1, 1, 1,
1.92951, -0.7498783, 2.712254, 1, 1, 1, 1, 1,
1.964043, -0.1491006, 1.960259, 1, 1, 1, 1, 1,
1.993889, 0.5760414, 0.5559481, 1, 1, 1, 1, 1,
2.01729, 0.861768, 1.882634, 1, 1, 1, 1, 1,
2.018833, 0.9152189, 1.892198, 0, 0, 1, 1, 1,
2.048107, 0.03779717, 1.968799, 1, 0, 0, 1, 1,
2.04971, 1.00234, 0.3951321, 1, 0, 0, 1, 1,
2.115057, 0.561637, 0.8928367, 1, 0, 0, 1, 1,
2.115733, 1.586411, 1.094495, 1, 0, 0, 1, 1,
2.127899, -1.224952, 1.581968, 1, 0, 0, 1, 1,
2.181453, 0.151436, 1.635748, 0, 0, 0, 1, 1,
2.187724, 0.8648117, 1.883502, 0, 0, 0, 1, 1,
2.232522, -1.037944, 2.569885, 0, 0, 0, 1, 1,
2.408633, 1.292746, 1.375146, 0, 0, 0, 1, 1,
2.473521, -0.03105608, 2.71604, 0, 0, 0, 1, 1,
2.478428, 2.102519, 0.6178059, 0, 0, 0, 1, 1,
2.514388, -2.09867, 3.566027, 0, 0, 0, 1, 1,
2.577776, -0.658926, 1.845139, 1, 1, 1, 1, 1,
2.637027, -0.5331297, 0.213863, 1, 1, 1, 1, 1,
2.662454, 0.6353357, 1.311678, 1, 1, 1, 1, 1,
2.88049, -0.1511447, 0.07266274, 1, 1, 1, 1, 1,
3.151126, -0.2706827, 1.475443, 1, 1, 1, 1, 1,
3.162881, 1.02606, 1.585519, 1, 1, 1, 1, 1,
3.273348, -0.7857258, 1.52298, 1, 1, 1, 1, 1
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
var radius = 9.938699;
var distance = 34.90926;
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
mvMatrix.translate( 0.04808187, 0.3099687, 0.158078 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.90926);
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
