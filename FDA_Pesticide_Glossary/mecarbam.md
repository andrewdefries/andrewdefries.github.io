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
-2.841008, 0.4160855, -0.1081084, 1, 0, 0, 1,
-2.632548, 1.677528, -2.172437, 1, 0.007843138, 0, 1,
-2.598377, -0.4786786, -2.663466, 1, 0.01176471, 0, 1,
-2.557219, 1.662386, -0.7812624, 1, 0.01960784, 0, 1,
-2.509068, 0.6826289, -2.076837, 1, 0.02352941, 0, 1,
-2.508359, 0.2365367, -2.532125, 1, 0.03137255, 0, 1,
-2.496485, 0.3024632, -0.5252298, 1, 0.03529412, 0, 1,
-2.48134, 1.425433, -1.100407, 1, 0.04313726, 0, 1,
-2.477832, -0.3459441, -2.220749, 1, 0.04705882, 0, 1,
-2.45269, -0.3461123, -1.657815, 1, 0.05490196, 0, 1,
-2.403102, -0.8822662, -2.23994, 1, 0.05882353, 0, 1,
-2.399522, -0.6869946, -2.48917, 1, 0.06666667, 0, 1,
-2.36364, 0.9983425, -3.372855, 1, 0.07058824, 0, 1,
-2.307606, -0.6698871, -1.82662, 1, 0.07843138, 0, 1,
-2.262888, -0.759914, -0.9372132, 1, 0.08235294, 0, 1,
-2.256584, 0.4122117, -1.232684, 1, 0.09019608, 0, 1,
-2.2401, -0.7368844, -2.958749, 1, 0.09411765, 0, 1,
-2.176679, 1.876461, -0.3835092, 1, 0.1019608, 0, 1,
-2.174488, -1.547811, -2.064961, 1, 0.1098039, 0, 1,
-2.163557, -0.8590018, -2.733938, 1, 0.1137255, 0, 1,
-2.003726, -1.201406, -2.94812, 1, 0.1215686, 0, 1,
-1.982625, 0.5231661, -0.3475219, 1, 0.1254902, 0, 1,
-1.969967, -0.9144122, -1.478532, 1, 0.1333333, 0, 1,
-1.968822, -1.920952, -1.191387, 1, 0.1372549, 0, 1,
-1.95939, 1.084996, -1.187887, 1, 0.145098, 0, 1,
-1.950711, -0.2803456, -3.027868, 1, 0.1490196, 0, 1,
-1.915906, 0.6272097, -1.544133, 1, 0.1568628, 0, 1,
-1.913208, -1.447325, -0.747987, 1, 0.1607843, 0, 1,
-1.897992, -0.3205192, -2.958681, 1, 0.1686275, 0, 1,
-1.883197, -0.728062, -2.115713, 1, 0.172549, 0, 1,
-1.847446, -0.4052481, -0.821202, 1, 0.1803922, 0, 1,
-1.844063, -0.1151727, -0.527438, 1, 0.1843137, 0, 1,
-1.830957, 0.8726112, 0.3515184, 1, 0.1921569, 0, 1,
-1.821309, -1.955222, -3.460585, 1, 0.1960784, 0, 1,
-1.800723, -0.6400184, -3.352832, 1, 0.2039216, 0, 1,
-1.780964, -0.2554771, -0.8187981, 1, 0.2117647, 0, 1,
-1.779246, 0.6512908, -1.455945, 1, 0.2156863, 0, 1,
-1.767572, 0.1135601, -0.6851518, 1, 0.2235294, 0, 1,
-1.766728, -0.1782176, -2.419801, 1, 0.227451, 0, 1,
-1.75337, -0.1441954, -0.7211253, 1, 0.2352941, 0, 1,
-1.752407, 0.9091486, 0.1532474, 1, 0.2392157, 0, 1,
-1.750072, -0.8560717, -2.229194, 1, 0.2470588, 0, 1,
-1.743221, 0.5310397, -1.123999, 1, 0.2509804, 0, 1,
-1.727754, -0.8810349, -2.490708, 1, 0.2588235, 0, 1,
-1.71595, 0.1722337, -0.3818893, 1, 0.2627451, 0, 1,
-1.715939, -0.9866268, -0.05496262, 1, 0.2705882, 0, 1,
-1.701122, 0.5205792, -3.48867, 1, 0.2745098, 0, 1,
-1.681512, 0.05127404, -2.366953, 1, 0.282353, 0, 1,
-1.679194, -0.7470157, -3.536796, 1, 0.2862745, 0, 1,
-1.676761, 0.3052922, -2.946943, 1, 0.2941177, 0, 1,
-1.663859, 1.194004, 0.2139827, 1, 0.3019608, 0, 1,
-1.656545, 0.9942452, -1.072502, 1, 0.3058824, 0, 1,
-1.641194, 0.9016535, -0.06426722, 1, 0.3137255, 0, 1,
-1.624886, -0.6521541, -2.835163, 1, 0.3176471, 0, 1,
-1.599972, 0.5600875, -0.2243457, 1, 0.3254902, 0, 1,
-1.590506, 0.8369628, -1.683017, 1, 0.3294118, 0, 1,
-1.585117, -1.589425, -2.509015, 1, 0.3372549, 0, 1,
-1.571685, -0.9932731, -1.66724, 1, 0.3411765, 0, 1,
-1.565768, 1.413185, -0.2937219, 1, 0.3490196, 0, 1,
-1.559081, 0.6411911, -1.372195, 1, 0.3529412, 0, 1,
-1.548669, -0.1843904, -2.360657, 1, 0.3607843, 0, 1,
-1.543135, 0.6098049, -0.4302702, 1, 0.3647059, 0, 1,
-1.54007, 1.796864, 0.1135017, 1, 0.372549, 0, 1,
-1.536682, -0.7033004, -2.434863, 1, 0.3764706, 0, 1,
-1.511754, -0.1142426, -1.188502, 1, 0.3843137, 0, 1,
-1.503534, -0.6811628, -1.784315, 1, 0.3882353, 0, 1,
-1.503241, -1.986254, -2.300377, 1, 0.3960784, 0, 1,
-1.487589, -0.4106297, -0.4393673, 1, 0.4039216, 0, 1,
-1.470076, 0.1239324, -1.94251, 1, 0.4078431, 0, 1,
-1.436726, 0.7430328, -1.069025, 1, 0.4156863, 0, 1,
-1.43657, -1.097609, -2.62762, 1, 0.4196078, 0, 1,
-1.43117, -0.9611159, -3.004121, 1, 0.427451, 0, 1,
-1.425747, -0.4260418, -3.125067, 1, 0.4313726, 0, 1,
-1.424496, -0.9181453, -2.810105, 1, 0.4392157, 0, 1,
-1.417425, -1.109638, -3.943137, 1, 0.4431373, 0, 1,
-1.411992, -1.733511, -0.8179552, 1, 0.4509804, 0, 1,
-1.406761, -1.037323, -1.18086, 1, 0.454902, 0, 1,
-1.405112, -1.219577, -1.140041, 1, 0.4627451, 0, 1,
-1.404107, 0.94916, -0.479171, 1, 0.4666667, 0, 1,
-1.403373, 0.2775442, -2.520588, 1, 0.4745098, 0, 1,
-1.393693, 0.29104, -0.2151283, 1, 0.4784314, 0, 1,
-1.393028, 0.4960208, -1.736983, 1, 0.4862745, 0, 1,
-1.390834, -1.338381, -0.7843497, 1, 0.4901961, 0, 1,
-1.388673, -1.597202, -2.182809, 1, 0.4980392, 0, 1,
-1.387661, -1.262188, -1.687682, 1, 0.5058824, 0, 1,
-1.375479, -1.092597, -2.186327, 1, 0.509804, 0, 1,
-1.36916, 1.540047, 0.06848401, 1, 0.5176471, 0, 1,
-1.363991, -1.415045, -3.378888, 1, 0.5215687, 0, 1,
-1.35372, -1.726944, -2.024047, 1, 0.5294118, 0, 1,
-1.349972, -0.7834442, -3.015578, 1, 0.5333334, 0, 1,
-1.323026, -0.5882432, -1.39555, 1, 0.5411765, 0, 1,
-1.320327, 0.5175109, -0.7395262, 1, 0.5450981, 0, 1,
-1.304447, -0.3139161, -0.4298751, 1, 0.5529412, 0, 1,
-1.302701, 2.017014, -0.8640031, 1, 0.5568628, 0, 1,
-1.287285, 0.7919965, -0.8330105, 1, 0.5647059, 0, 1,
-1.283386, 2.718416, 1.423895, 1, 0.5686275, 0, 1,
-1.271654, -0.2985879, -3.095487, 1, 0.5764706, 0, 1,
-1.27066, 1.169573, -0.4835409, 1, 0.5803922, 0, 1,
-1.247801, 0.02211583, -2.086443, 1, 0.5882353, 0, 1,
-1.245147, -0.3728736, -0.5232732, 1, 0.5921569, 0, 1,
-1.237174, -1.229113, -1.500483, 1, 0.6, 0, 1,
-1.225785, 0.3389575, -1.17976, 1, 0.6078432, 0, 1,
-1.212427, -0.6847618, -0.3879933, 1, 0.6117647, 0, 1,
-1.206832, -0.299205, -1.401843, 1, 0.6196079, 0, 1,
-1.206213, -0.03699813, -2.24893, 1, 0.6235294, 0, 1,
-1.204848, -0.08866999, -0.9467531, 1, 0.6313726, 0, 1,
-1.187815, -0.3802567, -3.280033, 1, 0.6352941, 0, 1,
-1.187354, 0.2072167, -0.7150225, 1, 0.6431373, 0, 1,
-1.183804, 1.0683, -1.650927, 1, 0.6470588, 0, 1,
-1.165484, -0.1270481, -3.384318, 1, 0.654902, 0, 1,
-1.161249, -0.1897029, -0.1299739, 1, 0.6588235, 0, 1,
-1.159576, -1.513025, -2.573763, 1, 0.6666667, 0, 1,
-1.158127, -1.030195, -0.6887879, 1, 0.6705883, 0, 1,
-1.154103, -0.2055213, -2.191708, 1, 0.6784314, 0, 1,
-1.150656, -1.848778, -1.797801, 1, 0.682353, 0, 1,
-1.136374, 0.6650134, -1.789127, 1, 0.6901961, 0, 1,
-1.128763, -0.5551399, -2.900828, 1, 0.6941177, 0, 1,
-1.128465, 0.04961182, 0.3395588, 1, 0.7019608, 0, 1,
-1.126142, -0.4578377, -1.963664, 1, 0.7098039, 0, 1,
-1.118412, -0.1191836, 0.23762, 1, 0.7137255, 0, 1,
-1.117386, 0.0892012, -1.784473, 1, 0.7215686, 0, 1,
-1.109426, 1.159996, -0.4150228, 1, 0.7254902, 0, 1,
-1.10524, -0.1248874, -2.726675, 1, 0.7333333, 0, 1,
-1.103003, -0.5820773, -0.5480168, 1, 0.7372549, 0, 1,
-1.102974, 2.208923, -0.7684832, 1, 0.7450981, 0, 1,
-1.100829, 0.1107516, -2.696576, 1, 0.7490196, 0, 1,
-1.092816, 1.461104, -2.793044, 1, 0.7568628, 0, 1,
-1.0916, -0.7251223, -0.947908, 1, 0.7607843, 0, 1,
-1.086404, -0.9387274, -2.292553, 1, 0.7686275, 0, 1,
-1.086181, 0.229389, -0.9233533, 1, 0.772549, 0, 1,
-1.081949, 2.395111, 0.1655559, 1, 0.7803922, 0, 1,
-1.081762, 0.5827686, -0.5032836, 1, 0.7843137, 0, 1,
-1.080591, 1.183207, 0.4411342, 1, 0.7921569, 0, 1,
-1.076272, -0.07401981, -2.258289, 1, 0.7960784, 0, 1,
-1.066805, -0.685531, -1.923818, 1, 0.8039216, 0, 1,
-1.06072, -0.9357713, -3.344193, 1, 0.8117647, 0, 1,
-1.058198, 0.3771575, 0.236496, 1, 0.8156863, 0, 1,
-1.037166, 0.1030372, -1.929344, 1, 0.8235294, 0, 1,
-1.034519, -1.148431, -1.138093, 1, 0.827451, 0, 1,
-1.023295, 0.1062415, -1.809565, 1, 0.8352941, 0, 1,
-1.019994, -1.093246, -2.535996, 1, 0.8392157, 0, 1,
-1.017989, 0.2724467, 0.05459869, 1, 0.8470588, 0, 1,
-1.016966, 0.923492, -0.9135678, 1, 0.8509804, 0, 1,
-1.009361, 1.025396, -1.704461, 1, 0.8588235, 0, 1,
-1.009155, 0.07678376, -0.8146983, 1, 0.8627451, 0, 1,
-1.004509, 0.1775316, 0.008328824, 1, 0.8705882, 0, 1,
-1.001988, 0.678803, -1.174473, 1, 0.8745098, 0, 1,
-0.9974625, -0.001851402, -0.9244479, 1, 0.8823529, 0, 1,
-0.9906063, -1.091081, -3.483998, 1, 0.8862745, 0, 1,
-0.9868603, -0.767351, -2.503776, 1, 0.8941177, 0, 1,
-0.9848691, -1.497722, -2.632105, 1, 0.8980392, 0, 1,
-0.9813361, -0.8918651, -2.297235, 1, 0.9058824, 0, 1,
-0.9791151, 0.1706675, -0.9936038, 1, 0.9137255, 0, 1,
-0.9773593, 0.3880033, -1.301754, 1, 0.9176471, 0, 1,
-0.9760509, 0.3481131, -0.8505293, 1, 0.9254902, 0, 1,
-0.9720391, 0.21504, -0.9098362, 1, 0.9294118, 0, 1,
-0.9672878, -1.066698, -2.543276, 1, 0.9372549, 0, 1,
-0.9672337, -0.01675498, -2.264107, 1, 0.9411765, 0, 1,
-0.9624712, -1.403745, -1.047668, 1, 0.9490196, 0, 1,
-0.9618976, 0.356306, -1.887224, 1, 0.9529412, 0, 1,
-0.9559414, -0.7155524, -1.940206, 1, 0.9607843, 0, 1,
-0.9506793, -0.3570647, -2.448361, 1, 0.9647059, 0, 1,
-0.947908, -0.3818665, -2.301127, 1, 0.972549, 0, 1,
-0.9475629, -0.2833402, -2.253939, 1, 0.9764706, 0, 1,
-0.9453206, -1.230582, -3.832127, 1, 0.9843137, 0, 1,
-0.9409409, 1.047609, -0.02027375, 1, 0.9882353, 0, 1,
-0.9356429, 0.247783, -3.25697, 1, 0.9960784, 0, 1,
-0.9269527, 0.9029168, -1.615075, 0.9960784, 1, 0, 1,
-0.9256629, -1.136741, -4.248884, 0.9921569, 1, 0, 1,
-0.9156957, -0.3006822, -2.89291, 0.9843137, 1, 0, 1,
-0.9066358, -0.5262567, -2.462463, 0.9803922, 1, 0, 1,
-0.9066286, 0.1811059, -2.009936, 0.972549, 1, 0, 1,
-0.904646, 0.7292879, -1.543884, 0.9686275, 1, 0, 1,
-0.891263, -0.6348193, -0.9036531, 0.9607843, 1, 0, 1,
-0.8852583, 1.361855, 0.06475258, 0.9568627, 1, 0, 1,
-0.8840316, 1.201124, -0.3757766, 0.9490196, 1, 0, 1,
-0.8805207, -0.3119294, -2.406637, 0.945098, 1, 0, 1,
-0.8786545, 0.5187407, -0.1074406, 0.9372549, 1, 0, 1,
-0.8753909, 0.8386869, -1.6556, 0.9333333, 1, 0, 1,
-0.8748762, -1.09097, -1.619933, 0.9254902, 1, 0, 1,
-0.8700351, -0.06711026, -0.4156649, 0.9215686, 1, 0, 1,
-0.8683587, 0.2459884, -1.292228, 0.9137255, 1, 0, 1,
-0.8677833, -0.1913795, -0.8922135, 0.9098039, 1, 0, 1,
-0.862579, -0.6014109, -1.365967, 0.9019608, 1, 0, 1,
-0.8490869, -2.000667, -4.93533, 0.8941177, 1, 0, 1,
-0.8466775, -0.2470898, -1.949287, 0.8901961, 1, 0, 1,
-0.8465977, -0.6882075, -2.115825, 0.8823529, 1, 0, 1,
-0.8329448, 0.12256, -0.5825057, 0.8784314, 1, 0, 1,
-0.8317751, -3.705771, -3.636265, 0.8705882, 1, 0, 1,
-0.8298731, 0.02873885, -1.14323, 0.8666667, 1, 0, 1,
-0.8292845, 0.2804888, -2.544232, 0.8588235, 1, 0, 1,
-0.8238431, 0.2765147, -0.2519371, 0.854902, 1, 0, 1,
-0.818732, 1.073333, -2.064279, 0.8470588, 1, 0, 1,
-0.81363, -0.9579563, -3.940754, 0.8431373, 1, 0, 1,
-0.8112626, 0.5316241, 0.4817515, 0.8352941, 1, 0, 1,
-0.8087103, -1.579769, -5.571311, 0.8313726, 1, 0, 1,
-0.8057737, 0.2848105, -2.024874, 0.8235294, 1, 0, 1,
-0.7975475, -0.2567576, -1.145232, 0.8196079, 1, 0, 1,
-0.791704, -0.1579615, -2.345965, 0.8117647, 1, 0, 1,
-0.7915287, -0.06711675, -2.820125, 0.8078431, 1, 0, 1,
-0.7854916, 0.3050381, -1.095945, 0.8, 1, 0, 1,
-0.7811393, -0.4393962, -1.124054, 0.7921569, 1, 0, 1,
-0.7802942, -1.562531, -2.34183, 0.7882353, 1, 0, 1,
-0.7796106, -0.3358665, -2.112733, 0.7803922, 1, 0, 1,
-0.7746808, -0.2442196, -2.500419, 0.7764706, 1, 0, 1,
-0.7740287, -0.7304209, -2.135641, 0.7686275, 1, 0, 1,
-0.7698197, -0.689369, -1.336106, 0.7647059, 1, 0, 1,
-0.7619486, 0.2326489, -1.989014, 0.7568628, 1, 0, 1,
-0.7601606, 1.733985, -1.32337, 0.7529412, 1, 0, 1,
-0.7582722, 2.273218, -0.1868297, 0.7450981, 1, 0, 1,
-0.757304, 0.1157994, -0.6360804, 0.7411765, 1, 0, 1,
-0.755499, -0.4149377, -1.738672, 0.7333333, 1, 0, 1,
-0.7534122, -0.3174353, -1.931017, 0.7294118, 1, 0, 1,
-0.7512853, -1.452295, -1.987003, 0.7215686, 1, 0, 1,
-0.7464995, -0.03966079, -2.542007, 0.7176471, 1, 0, 1,
-0.7378168, -0.08351546, -1.948129, 0.7098039, 1, 0, 1,
-0.737597, -0.4615779, -4.086213, 0.7058824, 1, 0, 1,
-0.7349417, -1.919121, -3.161581, 0.6980392, 1, 0, 1,
-0.7143424, -0.08446714, -1.935536, 0.6901961, 1, 0, 1,
-0.7114828, -0.6906377, -1.898253, 0.6862745, 1, 0, 1,
-0.7114221, 0.07170109, -3.393239, 0.6784314, 1, 0, 1,
-0.7082206, 0.6529611, 0.6870542, 0.6745098, 1, 0, 1,
-0.7038038, -2.413148, -4.361533, 0.6666667, 1, 0, 1,
-0.6964836, -2.900486, -2.606788, 0.6627451, 1, 0, 1,
-0.694628, -1.479844, -2.757765, 0.654902, 1, 0, 1,
-0.693371, 0.1910076, -1.607783, 0.6509804, 1, 0, 1,
-0.6927134, -1.103484, -6.218848, 0.6431373, 1, 0, 1,
-0.6878687, 0.1718215, -2.189236, 0.6392157, 1, 0, 1,
-0.6853795, 0.4944746, -1.206416, 0.6313726, 1, 0, 1,
-0.6845884, 1.200242, -1.927597, 0.627451, 1, 0, 1,
-0.6768262, -0.5424047, -3.645073, 0.6196079, 1, 0, 1,
-0.670026, -1.591255, -0.4608727, 0.6156863, 1, 0, 1,
-0.6682823, -0.9914351, -2.210092, 0.6078432, 1, 0, 1,
-0.6670918, -0.6118627, -2.068769, 0.6039216, 1, 0, 1,
-0.664598, -1.513294, -1.830092, 0.5960785, 1, 0, 1,
-0.658753, -0.09322938, -0.9925275, 0.5882353, 1, 0, 1,
-0.6557855, -1.375244, -2.682433, 0.5843138, 1, 0, 1,
-0.6468567, -2.187824, -3.644031, 0.5764706, 1, 0, 1,
-0.6465985, -0.06004924, -2.837701, 0.572549, 1, 0, 1,
-0.6435276, -0.4389924, -2.646181, 0.5647059, 1, 0, 1,
-0.6429635, -0.9794176, -3.862462, 0.5607843, 1, 0, 1,
-0.6377347, 0.8272189, -2.128075, 0.5529412, 1, 0, 1,
-0.6345112, 0.6166772, -0.9150438, 0.5490196, 1, 0, 1,
-0.6315485, -1.277574, -1.514424, 0.5411765, 1, 0, 1,
-0.6269168, 0.9621475, -0.7446488, 0.5372549, 1, 0, 1,
-0.6243865, -0.01114964, -2.675452, 0.5294118, 1, 0, 1,
-0.6181142, -0.2354442, -1.15423, 0.5254902, 1, 0, 1,
-0.6162171, -0.9717956, -1.636802, 0.5176471, 1, 0, 1,
-0.615952, -2.32988, -2.469827, 0.5137255, 1, 0, 1,
-0.6125858, -0.67362, -2.162724, 0.5058824, 1, 0, 1,
-0.6117114, -0.1684929, -1.083362, 0.5019608, 1, 0, 1,
-0.6075063, 0.2590954, -1.057837, 0.4941176, 1, 0, 1,
-0.6052004, -0.2781, -0.6900172, 0.4862745, 1, 0, 1,
-0.6039638, -0.08930729, -2.733415, 0.4823529, 1, 0, 1,
-0.5984512, 1.699475, -1.804807, 0.4745098, 1, 0, 1,
-0.5958907, 0.2022111, -1.523779, 0.4705882, 1, 0, 1,
-0.5958005, -0.6232535, -3.381782, 0.4627451, 1, 0, 1,
-0.5894395, 0.2149421, -0.147352, 0.4588235, 1, 0, 1,
-0.5893607, -0.8808169, -3.858772, 0.4509804, 1, 0, 1,
-0.5872897, 0.2279192, -0.81828, 0.4470588, 1, 0, 1,
-0.5838982, -0.8474805, -2.380785, 0.4392157, 1, 0, 1,
-0.5787001, 0.7894459, -0.7923586, 0.4352941, 1, 0, 1,
-0.5783108, 0.3213129, -1.284485, 0.427451, 1, 0, 1,
-0.577986, 0.07203798, -1.4102, 0.4235294, 1, 0, 1,
-0.5762221, 1.080655, -0.1767687, 0.4156863, 1, 0, 1,
-0.5751539, -1.170414, -2.350185, 0.4117647, 1, 0, 1,
-0.5724468, 1.584364, 1.644285, 0.4039216, 1, 0, 1,
-0.5704362, 0.9205466, 0.2062264, 0.3960784, 1, 0, 1,
-0.5702688, 1.57478, -0.455602, 0.3921569, 1, 0, 1,
-0.5625803, -1.330023, -2.545952, 0.3843137, 1, 0, 1,
-0.5610226, 0.8201258, -0.6492161, 0.3803922, 1, 0, 1,
-0.5600159, 0.7764205, 1.139281, 0.372549, 1, 0, 1,
-0.5545879, -0.6911111, -3.815236, 0.3686275, 1, 0, 1,
-0.5519766, -0.8821048, -2.66742, 0.3607843, 1, 0, 1,
-0.5433417, -0.1799143, -2.782839, 0.3568628, 1, 0, 1,
-0.5427046, 0.4215391, 0.1664775, 0.3490196, 1, 0, 1,
-0.5424496, -0.02642814, -0.8313707, 0.345098, 1, 0, 1,
-0.5415161, -0.701474, -4.667705, 0.3372549, 1, 0, 1,
-0.5333795, -1.32197, -2.920923, 0.3333333, 1, 0, 1,
-0.52166, 1.722581, -0.8113018, 0.3254902, 1, 0, 1,
-0.5213994, -0.737408, -2.406688, 0.3215686, 1, 0, 1,
-0.5210643, -0.924624, -1.417611, 0.3137255, 1, 0, 1,
-0.5200763, 0.9307314, -1.602226, 0.3098039, 1, 0, 1,
-0.5196977, -2.080389, -1.679003, 0.3019608, 1, 0, 1,
-0.5176681, 0.2397157, -0.6031907, 0.2941177, 1, 0, 1,
-0.5163748, 0.4523574, -0.8913755, 0.2901961, 1, 0, 1,
-0.5150095, -1.164821, -2.55637, 0.282353, 1, 0, 1,
-0.5145928, 0.3662656, 0.0009054198, 0.2784314, 1, 0, 1,
-0.5128494, -0.2640496, -1.583517, 0.2705882, 1, 0, 1,
-0.5020707, 0.3779616, -0.8748556, 0.2666667, 1, 0, 1,
-0.4978731, 0.9576293, -1.088565, 0.2588235, 1, 0, 1,
-0.4937924, 0.2444705, -2.261717, 0.254902, 1, 0, 1,
-0.4912068, 0.9791019, -1.314846, 0.2470588, 1, 0, 1,
-0.4904069, 1.704042, 0.605535, 0.2431373, 1, 0, 1,
-0.4873356, -0.1932353, -2.959125, 0.2352941, 1, 0, 1,
-0.4805959, 0.5146558, -0.4902616, 0.2313726, 1, 0, 1,
-0.4786493, -0.4876791, -4.538907, 0.2235294, 1, 0, 1,
-0.4786206, -0.9307889, -2.597594, 0.2196078, 1, 0, 1,
-0.4759938, -0.9293994, -1.482811, 0.2117647, 1, 0, 1,
-0.473471, 0.4923359, -0.4629637, 0.2078431, 1, 0, 1,
-0.4723998, -1.121525, -1.47284, 0.2, 1, 0, 1,
-0.468241, 0.2157044, -1.916326, 0.1921569, 1, 0, 1,
-0.4662868, 1.046444, 2.964274, 0.1882353, 1, 0, 1,
-0.4594881, -0.7604211, -2.848313, 0.1803922, 1, 0, 1,
-0.4548765, 1.426634, -0.164154, 0.1764706, 1, 0, 1,
-0.4544269, 0.967496, 0.3195054, 0.1686275, 1, 0, 1,
-0.4474557, -0.8899296, -2.003938, 0.1647059, 1, 0, 1,
-0.4467654, -0.5350749, -3.50824, 0.1568628, 1, 0, 1,
-0.4436466, 0.7615385, -1.475749, 0.1529412, 1, 0, 1,
-0.4416244, -0.7941767, -2.769855, 0.145098, 1, 0, 1,
-0.4407926, -0.3353663, -1.646407, 0.1411765, 1, 0, 1,
-0.4401196, 2.065066, -1.335904, 0.1333333, 1, 0, 1,
-0.4397382, 0.6290178, -1.342339, 0.1294118, 1, 0, 1,
-0.4354875, -0.4189015, -3.409551, 0.1215686, 1, 0, 1,
-0.4338512, -0.7759652, -2.557149, 0.1176471, 1, 0, 1,
-0.4316947, 2.535153, -0.8670428, 0.1098039, 1, 0, 1,
-0.4291354, 0.806941, -0.08424004, 0.1058824, 1, 0, 1,
-0.4285645, 0.06599738, -1.517107, 0.09803922, 1, 0, 1,
-0.428529, -0.6403082, -4.152141, 0.09019608, 1, 0, 1,
-0.4262854, 2.399552, -0.4312591, 0.08627451, 1, 0, 1,
-0.4246223, -0.6009281, -1.593959, 0.07843138, 1, 0, 1,
-0.4218837, 2.767552, -0.6566307, 0.07450981, 1, 0, 1,
-0.4154249, -1.493711, -1.900299, 0.06666667, 1, 0, 1,
-0.4145293, 0.5275855, -0.5637382, 0.0627451, 1, 0, 1,
-0.414005, 1.926358, -0.6759062, 0.05490196, 1, 0, 1,
-0.4134752, 0.904039, 1.265031, 0.05098039, 1, 0, 1,
-0.4116143, 0.8236738, 0.5951007, 0.04313726, 1, 0, 1,
-0.4101954, -0.2088047, -1.638234, 0.03921569, 1, 0, 1,
-0.4076877, 0.770907, -0.9190201, 0.03137255, 1, 0, 1,
-0.4075218, 1.040681, -0.2873671, 0.02745098, 1, 0, 1,
-0.4073652, -1.146428, -3.327499, 0.01960784, 1, 0, 1,
-0.4073142, -1.396795, -5.036739, 0.01568628, 1, 0, 1,
-0.4040331, -0.6031227, -2.265491, 0.007843138, 1, 0, 1,
-0.4031883, 0.7912756, -0.7738153, 0.003921569, 1, 0, 1,
-0.4005761, -0.4266459, -2.66349, 0, 1, 0.003921569, 1,
-0.3946596, -0.9964094, -2.806501, 0, 1, 0.01176471, 1,
-0.3942244, 0.0427845, -0.1528516, 0, 1, 0.01568628, 1,
-0.3832117, -1.047812, -2.329145, 0, 1, 0.02352941, 1,
-0.3825781, -0.2209763, -2.151557, 0, 1, 0.02745098, 1,
-0.3792051, 0.09471793, -0.2174538, 0, 1, 0.03529412, 1,
-0.3780867, -0.001777619, -2.09288, 0, 1, 0.03921569, 1,
-0.3770753, -0.7361869, -1.330828, 0, 1, 0.04705882, 1,
-0.3756776, -0.9729193, -1.848117, 0, 1, 0.05098039, 1,
-0.375486, 1.539724, 0.1028523, 0, 1, 0.05882353, 1,
-0.3731677, -0.9483647, -2.417423, 0, 1, 0.0627451, 1,
-0.3729701, 0.03519496, -2.043679, 0, 1, 0.07058824, 1,
-0.370817, -0.4049797, -2.949015, 0, 1, 0.07450981, 1,
-0.3675218, 1.692923, -1.360123, 0, 1, 0.08235294, 1,
-0.3659791, -0.8123864, -4.037038, 0, 1, 0.08627451, 1,
-0.3640568, -1.990614, -2.857844, 0, 1, 0.09411765, 1,
-0.3598998, -0.9165925, -1.063734, 0, 1, 0.1019608, 1,
-0.3585119, 1.065883, -2.1076, 0, 1, 0.1058824, 1,
-0.3577358, -3.605487, -3.854005, 0, 1, 0.1137255, 1,
-0.3558017, 0.5512114, -1.267004, 0, 1, 0.1176471, 1,
-0.352945, 0.7294483, -0.2812381, 0, 1, 0.1254902, 1,
-0.3515422, 0.9956813, -0.6153626, 0, 1, 0.1294118, 1,
-0.3396084, -1.377559, -3.381651, 0, 1, 0.1372549, 1,
-0.3314876, -1.159114, -2.814509, 0, 1, 0.1411765, 1,
-0.3309294, -0.2687773, -2.630372, 0, 1, 0.1490196, 1,
-0.3299002, -0.07723633, -1.167738, 0, 1, 0.1529412, 1,
-0.3285743, 0.8575046, -0.5016547, 0, 1, 0.1607843, 1,
-0.3224112, 0.7612308, -1.481788, 0, 1, 0.1647059, 1,
-0.3151791, 0.7354069, -0.3659906, 0, 1, 0.172549, 1,
-0.312635, 0.5753456, -0.2326214, 0, 1, 0.1764706, 1,
-0.312164, 0.2435692, -0.1119551, 0, 1, 0.1843137, 1,
-0.3111452, -2.166722, -2.460485, 0, 1, 0.1882353, 1,
-0.3048607, -1.019376, -3.474618, 0, 1, 0.1960784, 1,
-0.3045184, -0.5688339, -2.040978, 0, 1, 0.2039216, 1,
-0.3027509, 0.4522163, 0.2752798, 0, 1, 0.2078431, 1,
-0.300971, -1.224323, -3.008271, 0, 1, 0.2156863, 1,
-0.2981298, -2.340544, -3.187306, 0, 1, 0.2196078, 1,
-0.2975377, 0.2934746, -0.6140072, 0, 1, 0.227451, 1,
-0.2870298, 0.7278408, -0.6770703, 0, 1, 0.2313726, 1,
-0.2865494, -1.398196, -3.584851, 0, 1, 0.2392157, 1,
-0.2846107, 0.7911269, -0.5253406, 0, 1, 0.2431373, 1,
-0.2754306, -0.3803478, -2.66644, 0, 1, 0.2509804, 1,
-0.2748375, -0.3102533, -2.28107, 0, 1, 0.254902, 1,
-0.2734639, 1.06081, -1.187184, 0, 1, 0.2627451, 1,
-0.2709042, -1.507293, -2.957049, 0, 1, 0.2666667, 1,
-0.2699438, 0.7150761, 0.6299238, 0, 1, 0.2745098, 1,
-0.2657775, 0.1027445, -1.617823, 0, 1, 0.2784314, 1,
-0.264255, 0.115824, 0.9191175, 0, 1, 0.2862745, 1,
-0.2626392, 0.06579324, -3.819979, 0, 1, 0.2901961, 1,
-0.2621562, -0.714753, -3.649786, 0, 1, 0.2980392, 1,
-0.2566362, 1.598107, -0.2544627, 0, 1, 0.3058824, 1,
-0.255825, 1.049429, -0.5310566, 0, 1, 0.3098039, 1,
-0.2537497, -0.7762023, -3.102938, 0, 1, 0.3176471, 1,
-0.2521086, 0.8671916, -0.9347353, 0, 1, 0.3215686, 1,
-0.2503005, -0.8506973, -3.902837, 0, 1, 0.3294118, 1,
-0.2438719, 0.6131931, 0.2457191, 0, 1, 0.3333333, 1,
-0.2436846, -0.05876758, -0.5762999, 0, 1, 0.3411765, 1,
-0.2434243, 1.028131, 0.9843931, 0, 1, 0.345098, 1,
-0.2347907, 0.4051105, -1.440391, 0, 1, 0.3529412, 1,
-0.2346207, -3.060788, -4.488617, 0, 1, 0.3568628, 1,
-0.2342949, 0.5973914, 1.052028, 0, 1, 0.3647059, 1,
-0.234043, 1.35474, -0.2037972, 0, 1, 0.3686275, 1,
-0.2336642, -0.6924306, -3.669111, 0, 1, 0.3764706, 1,
-0.2332705, 0.2722768, 0.735339, 0, 1, 0.3803922, 1,
-0.2270303, -0.107409, -3.327096, 0, 1, 0.3882353, 1,
-0.2267212, 1.925644, -0.7223515, 0, 1, 0.3921569, 1,
-0.226716, -0.7427077, -2.077292, 0, 1, 0.4, 1,
-0.2220078, 0.06523351, -1.780044, 0, 1, 0.4078431, 1,
-0.221145, 2.588688, -1.204232, 0, 1, 0.4117647, 1,
-0.2196121, -0.1911795, -1.509379, 0, 1, 0.4196078, 1,
-0.2195508, -0.8775473, -3.155348, 0, 1, 0.4235294, 1,
-0.2132933, -0.03331539, -0.6888152, 0, 1, 0.4313726, 1,
-0.2126344, 0.7631902, 1.299132, 0, 1, 0.4352941, 1,
-0.2124864, 0.3718214, -3.461782, 0, 1, 0.4431373, 1,
-0.2119908, 1.670543, -1.508259, 0, 1, 0.4470588, 1,
-0.2031864, 0.05069251, -1.139851, 0, 1, 0.454902, 1,
-0.2000715, -0.4656326, -4.096293, 0, 1, 0.4588235, 1,
-0.1995663, -1.103686, -3.213905, 0, 1, 0.4666667, 1,
-0.1984511, 0.7009268, -1.315892, 0, 1, 0.4705882, 1,
-0.1960118, -0.880733, -3.276954, 0, 1, 0.4784314, 1,
-0.1928683, 0.3117194, -1.930393, 0, 1, 0.4823529, 1,
-0.191697, -0.2360669, -1.486869, 0, 1, 0.4901961, 1,
-0.1904052, 0.9313223, -2.207253, 0, 1, 0.4941176, 1,
-0.1859241, -1.018713, -1.420185, 0, 1, 0.5019608, 1,
-0.1838141, 1.145834, -0.7978828, 0, 1, 0.509804, 1,
-0.1831815, -0.7541062, -4.136507, 0, 1, 0.5137255, 1,
-0.1797878, -0.4680123, -3.124673, 0, 1, 0.5215687, 1,
-0.17939, -0.7645826, -1.666076, 0, 1, 0.5254902, 1,
-0.1748147, 1.473252, -0.7087739, 0, 1, 0.5333334, 1,
-0.1733461, -1.260654, -3.892668, 0, 1, 0.5372549, 1,
-0.1711709, 0.4256299, -0.06981932, 0, 1, 0.5450981, 1,
-0.1675221, 0.1637252, -1.981029, 0, 1, 0.5490196, 1,
-0.1668836, 2.076816, -1.133109, 0, 1, 0.5568628, 1,
-0.164966, -1.066902, -1.20147, 0, 1, 0.5607843, 1,
-0.1625965, 0.8716682, 1.299533, 0, 1, 0.5686275, 1,
-0.1568712, -0.2703853, -3.249323, 0, 1, 0.572549, 1,
-0.1561848, 0.045943, -0.8662485, 0, 1, 0.5803922, 1,
-0.1543216, -0.02276646, -2.126438, 0, 1, 0.5843138, 1,
-0.1542934, 0.3656693, -0.853538, 0, 1, 0.5921569, 1,
-0.1484549, 1.705747, 0.6573853, 0, 1, 0.5960785, 1,
-0.1458298, -0.1931897, -3.691018, 0, 1, 0.6039216, 1,
-0.1444631, 0.08152688, -1.451851, 0, 1, 0.6117647, 1,
-0.1388694, 0.8567644, -0.2008863, 0, 1, 0.6156863, 1,
-0.1351682, 2.014579, 0.1221312, 0, 1, 0.6235294, 1,
-0.1292271, 1.115364, 0.8340769, 0, 1, 0.627451, 1,
-0.1290834, -1.000275, -3.114034, 0, 1, 0.6352941, 1,
-0.1174469, 1.292372, 0.1715361, 0, 1, 0.6392157, 1,
-0.1169033, -0.008462267, -0.6483089, 0, 1, 0.6470588, 1,
-0.1162175, -0.7658715, -2.65227, 0, 1, 0.6509804, 1,
-0.1131773, 0.1383988, 0.3040443, 0, 1, 0.6588235, 1,
-0.1104748, -0.5971491, -1.691728, 0, 1, 0.6627451, 1,
-0.1086807, -1.241323, -3.620894, 0, 1, 0.6705883, 1,
-0.1058322, 0.7248916, -0.1175417, 0, 1, 0.6745098, 1,
-0.1033242, -0.4356291, -0.9350007, 0, 1, 0.682353, 1,
-0.1032012, -0.07651602, -2.344186, 0, 1, 0.6862745, 1,
-0.09688804, 0.1929204, -0.3523487, 0, 1, 0.6941177, 1,
-0.09240834, 0.5104257, 0.4232372, 0, 1, 0.7019608, 1,
-0.09006957, 0.01494466, -2.649145, 0, 1, 0.7058824, 1,
-0.08998644, -0.4478138, -2.763176, 0, 1, 0.7137255, 1,
-0.08928382, -0.2599317, -2.343509, 0, 1, 0.7176471, 1,
-0.08251957, 0.9859933, 1.053403, 0, 1, 0.7254902, 1,
-0.08204894, -1.457338, -3.778415, 0, 1, 0.7294118, 1,
-0.08131366, -0.3159869, -3.779332, 0, 1, 0.7372549, 1,
-0.08087322, 0.4631191, -0.1634014, 0, 1, 0.7411765, 1,
-0.08029803, 0.06369174, 1.170331, 0, 1, 0.7490196, 1,
-0.07566828, 1.132388, 0.5033288, 0, 1, 0.7529412, 1,
-0.07310316, -0.2158183, -1.881352, 0, 1, 0.7607843, 1,
-0.07252304, 1.398009, -1.565093, 0, 1, 0.7647059, 1,
-0.0717693, -0.5800552, -1.935877, 0, 1, 0.772549, 1,
-0.07154976, -0.1044821, -2.153599, 0, 1, 0.7764706, 1,
-0.06921696, 0.1891769, 0.6098364, 0, 1, 0.7843137, 1,
-0.06899386, 1.418507, 0.3160645, 0, 1, 0.7882353, 1,
-0.06713594, 0.6009172, -0.4702972, 0, 1, 0.7960784, 1,
-0.06712393, -0.1495776, -2.289698, 0, 1, 0.8039216, 1,
-0.0651581, 0.4231666, -1.471743, 0, 1, 0.8078431, 1,
-0.0640215, 0.4668778, 0.1894525, 0, 1, 0.8156863, 1,
-0.05767073, 0.1634564, 0.1222291, 0, 1, 0.8196079, 1,
-0.05747449, 0.918786, 0.6165057, 0, 1, 0.827451, 1,
-0.05692113, -0.4455706, -3.354738, 0, 1, 0.8313726, 1,
-0.04987452, -0.09376858, -1.521646, 0, 1, 0.8392157, 1,
-0.04885557, 1.03742, -0.141958, 0, 1, 0.8431373, 1,
-0.04615638, -0.2230573, -2.501584, 0, 1, 0.8509804, 1,
-0.04521634, -1.931525, -2.259076, 0, 1, 0.854902, 1,
-0.03956504, -0.7314106, -2.614044, 0, 1, 0.8627451, 1,
-0.03800485, -0.5780094, -3.359956, 0, 1, 0.8666667, 1,
-0.0247883, 0.5583335, 0.3220506, 0, 1, 0.8745098, 1,
-0.02372179, 0.3267072, 1.025809, 0, 1, 0.8784314, 1,
-0.02118972, 1.342716, -0.5668675, 0, 1, 0.8862745, 1,
-0.01869144, 1.449679, 0.9660143, 0, 1, 0.8901961, 1,
-0.01824715, -0.4783311, -2.15839, 0, 1, 0.8980392, 1,
-0.0165393, -0.6313092, -2.743482, 0, 1, 0.9058824, 1,
-0.0156932, -0.0007805313, 0.5399233, 0, 1, 0.9098039, 1,
-0.01482327, 0.9781892, 1.684778, 0, 1, 0.9176471, 1,
-0.01382849, -1.159001, -1.340931, 0, 1, 0.9215686, 1,
-0.01288184, 0.2854033, -2.03528, 0, 1, 0.9294118, 1,
-0.01126236, 0.2319793, 0.125288, 0, 1, 0.9333333, 1,
-0.009843549, -0.2542918, -0.8985326, 0, 1, 0.9411765, 1,
-0.008200918, 0.7877715, 0.7600903, 0, 1, 0.945098, 1,
-0.005746945, 1.458634, 1.232409, 0, 1, 0.9529412, 1,
-0.004665832, 0.3560715, -0.111215, 0, 1, 0.9568627, 1,
-0.002915978, -0.7995011, -2.198728, 0, 1, 0.9647059, 1,
0.004144899, -0.6559778, 2.871644, 0, 1, 0.9686275, 1,
0.00503604, -1.256364, 3.036675, 0, 1, 0.9764706, 1,
0.005087143, -0.3340367, 0.5479628, 0, 1, 0.9803922, 1,
0.01043688, 2.086948, -1.40348, 0, 1, 0.9882353, 1,
0.01221141, -0.4661787, 2.509191, 0, 1, 0.9921569, 1,
0.0137806, 0.9320071, -0.2285503, 0, 1, 1, 1,
0.01658101, -1.117972, 2.854891, 0, 0.9921569, 1, 1,
0.01807627, 0.7462199, -0.8590757, 0, 0.9882353, 1, 1,
0.02092541, -0.2009256, 1.727295, 0, 0.9803922, 1, 1,
0.02213283, -0.7234814, 2.085386, 0, 0.9764706, 1, 1,
0.02293686, -1.655699, 3.507712, 0, 0.9686275, 1, 1,
0.02448863, 1.770156, -0.1680972, 0, 0.9647059, 1, 1,
0.0254327, 0.3835148, 0.5444679, 0, 0.9568627, 1, 1,
0.0265383, 0.3787914, 0.2288043, 0, 0.9529412, 1, 1,
0.02831993, 1.305923, 0.3133089, 0, 0.945098, 1, 1,
0.0308457, 1.082349, 1.116488, 0, 0.9411765, 1, 1,
0.03245357, -0.8883421, 4.750727, 0, 0.9333333, 1, 1,
0.03581181, -0.2293601, 2.024397, 0, 0.9294118, 1, 1,
0.03679176, -0.5138445, 2.666253, 0, 0.9215686, 1, 1,
0.03792065, -0.7005717, 2.176829, 0, 0.9176471, 1, 1,
0.03945526, -0.3145926, 4.625405, 0, 0.9098039, 1, 1,
0.04346612, -1.757353, 2.28548, 0, 0.9058824, 1, 1,
0.04411867, 0.5687582, -0.9377311, 0, 0.8980392, 1, 1,
0.04682293, 2.230121, 1.043525, 0, 0.8901961, 1, 1,
0.06163103, -1.197578, 3.251383, 0, 0.8862745, 1, 1,
0.0624187, -1.406118, 1.99183, 0, 0.8784314, 1, 1,
0.06274672, -0.2721813, 4.307772, 0, 0.8745098, 1, 1,
0.06337783, 0.9583728, 0.2073126, 0, 0.8666667, 1, 1,
0.06411701, 0.6959127, 1.557935, 0, 0.8627451, 1, 1,
0.06941772, 1.02033, -0.2000053, 0, 0.854902, 1, 1,
0.07074083, 0.1281154, 1.849552, 0, 0.8509804, 1, 1,
0.0712039, 0.6615758, -0.6479282, 0, 0.8431373, 1, 1,
0.07366756, 0.7030404, -0.3981326, 0, 0.8392157, 1, 1,
0.08686111, 1.061409, 0.6455134, 0, 0.8313726, 1, 1,
0.09072521, 0.9937546, 1.331612, 0, 0.827451, 1, 1,
0.09956318, 3.106421, -0.90753, 0, 0.8196079, 1, 1,
0.1080198, -1.237932, 2.91768, 0, 0.8156863, 1, 1,
0.1086236, -0.8162965, 5.869712, 0, 0.8078431, 1, 1,
0.1133066, 1.093822, -0.3458705, 0, 0.8039216, 1, 1,
0.1140558, -1.286344, 3.215596, 0, 0.7960784, 1, 1,
0.1189112, -2.402449, 2.734052, 0, 0.7882353, 1, 1,
0.1210623, -0.139657, 2.478245, 0, 0.7843137, 1, 1,
0.1223002, 0.2824565, 0.8568116, 0, 0.7764706, 1, 1,
0.1262612, 0.6738625, -1.803053, 0, 0.772549, 1, 1,
0.127594, 0.527278, -2.103083, 0, 0.7647059, 1, 1,
0.1282283, 0.4755546, -0.5548093, 0, 0.7607843, 1, 1,
0.129326, 1.392092, -1.57482, 0, 0.7529412, 1, 1,
0.1329669, 0.5063063, -0.4111275, 0, 0.7490196, 1, 1,
0.1330449, -0.3807867, 2.644946, 0, 0.7411765, 1, 1,
0.1335605, 1.082105, 0.706665, 0, 0.7372549, 1, 1,
0.1364296, -0.9722822, 0.929244, 0, 0.7294118, 1, 1,
0.1404055, 0.460219, -0.5327612, 0, 0.7254902, 1, 1,
0.1415163, 0.7619438, 0.06681768, 0, 0.7176471, 1, 1,
0.1421598, 0.3610079, 2.012861, 0, 0.7137255, 1, 1,
0.1427119, 1.647748, -0.4580217, 0, 0.7058824, 1, 1,
0.1473674, 0.4494701, -1.535745, 0, 0.6980392, 1, 1,
0.1481275, -0.6002907, 3.420594, 0, 0.6941177, 1, 1,
0.1527032, -0.7429762, 1.990598, 0, 0.6862745, 1, 1,
0.1529604, -0.1655656, 4.125458, 0, 0.682353, 1, 1,
0.1565286, -0.2453999, 2.483602, 0, 0.6745098, 1, 1,
0.162648, 2.606307, -0.5101114, 0, 0.6705883, 1, 1,
0.1650601, 0.1400862, 1.64816, 0, 0.6627451, 1, 1,
0.1660619, 0.3339236, -0.6743819, 0, 0.6588235, 1, 1,
0.1713678, 0.4642158, 0.6344374, 0, 0.6509804, 1, 1,
0.1808205, 0.6220939, -0.3675743, 0, 0.6470588, 1, 1,
0.181107, 0.2600233, -0.7303683, 0, 0.6392157, 1, 1,
0.181384, 0.4981444, -0.02306854, 0, 0.6352941, 1, 1,
0.1820017, 0.1498083, 0.2400467, 0, 0.627451, 1, 1,
0.1823949, -0.1454218, 1.82566, 0, 0.6235294, 1, 1,
0.184424, 0.2804744, -1.479925, 0, 0.6156863, 1, 1,
0.1849448, 0.8842141, 0.6057877, 0, 0.6117647, 1, 1,
0.1860943, 1.043038, -0.2022593, 0, 0.6039216, 1, 1,
0.1876534, -1.165527, 1.474855, 0, 0.5960785, 1, 1,
0.1878224, -0.7743078, 0.8152483, 0, 0.5921569, 1, 1,
0.1879468, 1.027686, 0.6556857, 0, 0.5843138, 1, 1,
0.1959194, -0.05411005, 0.8229526, 0, 0.5803922, 1, 1,
0.1968116, -0.9557881, 0.2735292, 0, 0.572549, 1, 1,
0.2022464, -1.694029, 1.915163, 0, 0.5686275, 1, 1,
0.2035152, -1.715939, 1.447969, 0, 0.5607843, 1, 1,
0.2045241, 0.7032402, 0.2140016, 0, 0.5568628, 1, 1,
0.2050424, -0.2514114, 1.975956, 0, 0.5490196, 1, 1,
0.2051029, 1.664601, 0.6192012, 0, 0.5450981, 1, 1,
0.2056397, -2.112137, 3.206823, 0, 0.5372549, 1, 1,
0.2132232, 0.03823638, 0.817652, 0, 0.5333334, 1, 1,
0.2143885, -0.03175404, 0.4750344, 0, 0.5254902, 1, 1,
0.2226886, -0.7854427, 2.310374, 0, 0.5215687, 1, 1,
0.2228684, 0.7692723, 1.121199, 0, 0.5137255, 1, 1,
0.2252124, -1.088361, 3.264446, 0, 0.509804, 1, 1,
0.2260158, 1.438044, -0.6878176, 0, 0.5019608, 1, 1,
0.2275271, 0.7363657, 1.282191, 0, 0.4941176, 1, 1,
0.2276992, -0.9549047, 4.43392, 0, 0.4901961, 1, 1,
0.2331596, 0.3840044, 0.05092977, 0, 0.4823529, 1, 1,
0.2341001, -0.484226, 1.370141, 0, 0.4784314, 1, 1,
0.2375292, 0.8220413, -1.018133, 0, 0.4705882, 1, 1,
0.2447765, 0.4283324, -0.3653671, 0, 0.4666667, 1, 1,
0.2501981, 0.5531172, 0.5829189, 0, 0.4588235, 1, 1,
0.2551891, 0.2711127, 2.321337, 0, 0.454902, 1, 1,
0.2556311, 0.3030522, -0.8167008, 0, 0.4470588, 1, 1,
0.2584628, 2.042889, 0.7367408, 0, 0.4431373, 1, 1,
0.2588026, 0.9599667, 1.002334, 0, 0.4352941, 1, 1,
0.2589397, 0.6180932, -0.04474739, 0, 0.4313726, 1, 1,
0.261602, -0.5271701, 4.472023, 0, 0.4235294, 1, 1,
0.2666961, -1.711777, 3.532155, 0, 0.4196078, 1, 1,
0.267132, -0.2868801, 1.927837, 0, 0.4117647, 1, 1,
0.2675512, -0.6602126, 3.370113, 0, 0.4078431, 1, 1,
0.272735, 1.166424, 1.654316, 0, 0.4, 1, 1,
0.2744109, -0.3071899, 3.553684, 0, 0.3921569, 1, 1,
0.2747701, 0.3274937, 1.395858, 0, 0.3882353, 1, 1,
0.2751957, -0.363318, 4.149881, 0, 0.3803922, 1, 1,
0.2762831, 1.550282, -0.9111857, 0, 0.3764706, 1, 1,
0.2788697, -1.070966, 2.165252, 0, 0.3686275, 1, 1,
0.2807378, 0.1067512, 2.490914, 0, 0.3647059, 1, 1,
0.2828809, -3.153506, 3.548603, 0, 0.3568628, 1, 1,
0.2872646, 0.01337683, 0.2779115, 0, 0.3529412, 1, 1,
0.2912631, 1.149462, 0.1111202, 0, 0.345098, 1, 1,
0.2936378, -0.9583085, 3.802596, 0, 0.3411765, 1, 1,
0.2951961, 0.2730935, 2.013803, 0, 0.3333333, 1, 1,
0.295529, -2.250093, 5.398625, 0, 0.3294118, 1, 1,
0.2958637, 1.837751, -1.652825, 0, 0.3215686, 1, 1,
0.2967616, -0.9108433, 4.168186, 0, 0.3176471, 1, 1,
0.3014967, -0.8253832, 4.981776, 0, 0.3098039, 1, 1,
0.3033407, 1.458979, -1.517039, 0, 0.3058824, 1, 1,
0.305096, -0.9648687, 3.043221, 0, 0.2980392, 1, 1,
0.3066619, 0.1392964, 1.470164, 0, 0.2901961, 1, 1,
0.3077377, -0.9327129, 3.013521, 0, 0.2862745, 1, 1,
0.3078331, -1.334388, 4.444186, 0, 0.2784314, 1, 1,
0.3125032, 1.435242, -0.625034, 0, 0.2745098, 1, 1,
0.3151209, 1.054019, 1.351361, 0, 0.2666667, 1, 1,
0.3202739, 0.2297537, 1.643923, 0, 0.2627451, 1, 1,
0.3209906, 0.201904, 0.7881554, 0, 0.254902, 1, 1,
0.3220018, 0.1384002, 0.7899806, 0, 0.2509804, 1, 1,
0.3360091, -1.737832, 2.031915, 0, 0.2431373, 1, 1,
0.3386089, -0.3411925, 1.588254, 0, 0.2392157, 1, 1,
0.3390167, -0.7472945, 2.12961, 0, 0.2313726, 1, 1,
0.3410297, -0.5517217, 2.128249, 0, 0.227451, 1, 1,
0.3461441, 1.308197, 0.004606498, 0, 0.2196078, 1, 1,
0.3535215, 0.5463163, 1.591432, 0, 0.2156863, 1, 1,
0.3627928, -1.516773, 2.091735, 0, 0.2078431, 1, 1,
0.3631903, 0.6151335, 0.2444539, 0, 0.2039216, 1, 1,
0.3714468, 0.6828048, 0.7970058, 0, 0.1960784, 1, 1,
0.3719927, 0.134153, 1.195329, 0, 0.1882353, 1, 1,
0.372732, -1.195243, 3.009204, 0, 0.1843137, 1, 1,
0.3732747, 0.5397263, -0.1014476, 0, 0.1764706, 1, 1,
0.3737302, 0.1696455, 0.970089, 0, 0.172549, 1, 1,
0.3769208, -0.2678509, 2.524149, 0, 0.1647059, 1, 1,
0.3806615, 1.619538, 0.5094808, 0, 0.1607843, 1, 1,
0.3843153, -1.952347, 2.618835, 0, 0.1529412, 1, 1,
0.3863225, 0.3352458, 2.024678, 0, 0.1490196, 1, 1,
0.3927481, 0.6672552, -0.1946263, 0, 0.1411765, 1, 1,
0.393074, 0.04537139, 3.009928, 0, 0.1372549, 1, 1,
0.3971458, 0.3671724, -0.1981684, 0, 0.1294118, 1, 1,
0.3997504, 1.341372, -0.1760545, 0, 0.1254902, 1, 1,
0.4037823, -0.007767767, 0.6792086, 0, 0.1176471, 1, 1,
0.4062193, -0.9647315, 3.61583, 0, 0.1137255, 1, 1,
0.4093616, -0.1942096, 3.640971, 0, 0.1058824, 1, 1,
0.4111471, -0.2868395, 2.330329, 0, 0.09803922, 1, 1,
0.4113073, -0.3159089, 1.691344, 0, 0.09411765, 1, 1,
0.4175524, -0.4424658, 3.533099, 0, 0.08627451, 1, 1,
0.4245298, -0.9140821, 2.710547, 0, 0.08235294, 1, 1,
0.4249084, -1.107775, 3.207996, 0, 0.07450981, 1, 1,
0.42805, -0.7335923, 2.261242, 0, 0.07058824, 1, 1,
0.4336808, -0.6100061, 1.944544, 0, 0.0627451, 1, 1,
0.4342815, 1.67848, -1.243995, 0, 0.05882353, 1, 1,
0.4375117, -0.6739106, 2.190159, 0, 0.05098039, 1, 1,
0.4402515, -0.2691739, 2.501727, 0, 0.04705882, 1, 1,
0.4458497, -0.7955648, 2.79964, 0, 0.03921569, 1, 1,
0.4487203, -0.1188935, -0.05830003, 0, 0.03529412, 1, 1,
0.4534296, -3.015718, 1.900143, 0, 0.02745098, 1, 1,
0.4543892, 0.4822595, 1.03575, 0, 0.02352941, 1, 1,
0.4562961, 0.04232477, -0.02674769, 0, 0.01568628, 1, 1,
0.45954, 1.089083, 0.5329983, 0, 0.01176471, 1, 1,
0.4620655, -0.1592425, 2.217672, 0, 0.003921569, 1, 1,
0.4633143, -0.8927306, 3.213796, 0.003921569, 0, 1, 1,
0.4685047, 1.993572, 0.9284114, 0.007843138, 0, 1, 1,
0.4693947, -0.3798226, 3.036167, 0.01568628, 0, 1, 1,
0.4775783, -0.1235812, 1.953955, 0.01960784, 0, 1, 1,
0.4799494, 1.189486, 0.9953941, 0.02745098, 0, 1, 1,
0.4803317, -0.4195541, 1.622646, 0.03137255, 0, 1, 1,
0.4813448, 0.9365514, 1.963413, 0.03921569, 0, 1, 1,
0.4824403, 0.6781546, -2.038848, 0.04313726, 0, 1, 1,
0.484362, 1.55994, 1.253029, 0.05098039, 0, 1, 1,
0.4849999, -0.920196, 3.680623, 0.05490196, 0, 1, 1,
0.4862305, 0.1723538, 1.017437, 0.0627451, 0, 1, 1,
0.4904615, -0.06517, 0.4192414, 0.06666667, 0, 1, 1,
0.4905002, -1.579232, 2.686534, 0.07450981, 0, 1, 1,
0.4919688, -0.3920181, 0.9971882, 0.07843138, 0, 1, 1,
0.4921008, -1.208232, 1.817376, 0.08627451, 0, 1, 1,
0.4927795, -0.425777, 2.431387, 0.09019608, 0, 1, 1,
0.4945219, 1.644951, 0.6487103, 0.09803922, 0, 1, 1,
0.499356, -0.06174747, 1.562433, 0.1058824, 0, 1, 1,
0.5054268, -0.1982583, 0.8270501, 0.1098039, 0, 1, 1,
0.5086362, 1.176869, 1.546567, 0.1176471, 0, 1, 1,
0.5117718, 2.214485, 2.339041, 0.1215686, 0, 1, 1,
0.5121036, 0.03909712, 1.179918, 0.1294118, 0, 1, 1,
0.5218486, 0.9043404, -0.03232072, 0.1333333, 0, 1, 1,
0.5245374, 0.6173164, 0.8364645, 0.1411765, 0, 1, 1,
0.5307158, -1.093951, 1.936403, 0.145098, 0, 1, 1,
0.5333409, 0.8411078, 0.7840239, 0.1529412, 0, 1, 1,
0.5346739, 0.09475872, 0.9601472, 0.1568628, 0, 1, 1,
0.5347666, -0.6503721, 3.641634, 0.1647059, 0, 1, 1,
0.5368092, -1.38782, 2.0888, 0.1686275, 0, 1, 1,
0.5368248, -0.5424098, 2.23383, 0.1764706, 0, 1, 1,
0.5425961, 1.587939, 1.731358, 0.1803922, 0, 1, 1,
0.542603, -0.07388145, 1.698601, 0.1882353, 0, 1, 1,
0.5462911, 1.244274, -0.7405365, 0.1921569, 0, 1, 1,
0.5537164, -1.813111, 2.047294, 0.2, 0, 1, 1,
0.5556282, 2.007046, -0.01503173, 0.2078431, 0, 1, 1,
0.5573677, -1.28616, 3.364036, 0.2117647, 0, 1, 1,
0.5602851, -0.2193151, 1.049671, 0.2196078, 0, 1, 1,
0.5629304, 0.2130725, 1.23282, 0.2235294, 0, 1, 1,
0.5644167, -0.4205487, 1.420914, 0.2313726, 0, 1, 1,
0.5677956, -1.100246, 3.163046, 0.2352941, 0, 1, 1,
0.5705117, -0.6334312, 2.863732, 0.2431373, 0, 1, 1,
0.5707877, 0.5566405, 0.6806923, 0.2470588, 0, 1, 1,
0.5725119, -0.3618308, 1.709423, 0.254902, 0, 1, 1,
0.5749001, 0.9480909, 0.5531651, 0.2588235, 0, 1, 1,
0.5786889, 0.5103826, -1.24903, 0.2666667, 0, 1, 1,
0.5789347, -0.5378939, 1.961965, 0.2705882, 0, 1, 1,
0.5931525, 0.6081206, 0.3455192, 0.2784314, 0, 1, 1,
0.5957047, 0.3358093, 0.561271, 0.282353, 0, 1, 1,
0.6049981, -0.6166736, 1.686238, 0.2901961, 0, 1, 1,
0.6054937, 0.4436608, 1.193442, 0.2941177, 0, 1, 1,
0.6059492, -1.137664, 4.036302, 0.3019608, 0, 1, 1,
0.6076174, 1.21345, 0.6234109, 0.3098039, 0, 1, 1,
0.6110747, -0.3928733, 2.518391, 0.3137255, 0, 1, 1,
0.6164858, 0.6469992, -0.1783093, 0.3215686, 0, 1, 1,
0.6210738, 0.5129433, 1.13876, 0.3254902, 0, 1, 1,
0.6220283, 0.3372307, 0.7960678, 0.3333333, 0, 1, 1,
0.6226966, -0.3606628, 2.523535, 0.3372549, 0, 1, 1,
0.6244657, -0.5309601, 1.968445, 0.345098, 0, 1, 1,
0.6263805, 1.057915, -1.53486, 0.3490196, 0, 1, 1,
0.6274599, -0.174675, 2.036809, 0.3568628, 0, 1, 1,
0.6302924, -0.2970308, 4.258973, 0.3607843, 0, 1, 1,
0.6332749, 0.5524323, -1.224367, 0.3686275, 0, 1, 1,
0.6334012, -0.9541251, 2.637058, 0.372549, 0, 1, 1,
0.6362959, -0.3683247, 2.450462, 0.3803922, 0, 1, 1,
0.6401407, -0.4261054, 1.172664, 0.3843137, 0, 1, 1,
0.6420362, 0.8474663, 0.9762704, 0.3921569, 0, 1, 1,
0.6459406, -2.475166, 3.620828, 0.3960784, 0, 1, 1,
0.6477404, -0.6328081, 3.005003, 0.4039216, 0, 1, 1,
0.6484824, -1.31719, 1.559462, 0.4117647, 0, 1, 1,
0.6526726, 1.359142, 0.4759693, 0.4156863, 0, 1, 1,
0.6615729, 0.5791128, 1.206858, 0.4235294, 0, 1, 1,
0.6623575, 0.6525444, 1.295659, 0.427451, 0, 1, 1,
0.665897, 0.18941, -1.134199, 0.4352941, 0, 1, 1,
0.6699112, -1.094185, 4.086029, 0.4392157, 0, 1, 1,
0.6699632, 2.0079, 0.4918073, 0.4470588, 0, 1, 1,
0.6742129, -0.1965869, 2.992999, 0.4509804, 0, 1, 1,
0.6806476, 0.3202662, 0.8861832, 0.4588235, 0, 1, 1,
0.6856164, 0.5153063, 0.8058408, 0.4627451, 0, 1, 1,
0.6932056, -0.7768628, 1.350776, 0.4705882, 0, 1, 1,
0.6945191, -1.107721, 3.278639, 0.4745098, 0, 1, 1,
0.6962171, -0.9337986, 5.386854, 0.4823529, 0, 1, 1,
0.6984205, -0.4757759, 2.548181, 0.4862745, 0, 1, 1,
0.7017865, -0.6042225, 1.392746, 0.4941176, 0, 1, 1,
0.709209, 0.3523494, 0.2065451, 0.5019608, 0, 1, 1,
0.7146452, -0.6738879, 3.544075, 0.5058824, 0, 1, 1,
0.7171156, -0.8658166, 3.642384, 0.5137255, 0, 1, 1,
0.7246215, -0.01101019, 1.110498, 0.5176471, 0, 1, 1,
0.7277477, -1.154834, 2.644717, 0.5254902, 0, 1, 1,
0.7303144, 1.06696, 0.2796306, 0.5294118, 0, 1, 1,
0.7354422, -0.7490121, 4.324989, 0.5372549, 0, 1, 1,
0.7356116, 1.165209, -0.6370387, 0.5411765, 0, 1, 1,
0.7367914, 0.4548483, 0.06827227, 0.5490196, 0, 1, 1,
0.7448526, -0.1375435, 1.319834, 0.5529412, 0, 1, 1,
0.7465779, 0.03379564, 2.06203, 0.5607843, 0, 1, 1,
0.7481052, 0.5116273, 1.257939, 0.5647059, 0, 1, 1,
0.7499208, 0.1683962, 1.546342, 0.572549, 0, 1, 1,
0.7512728, 0.2133382, 2.022469, 0.5764706, 0, 1, 1,
0.7570492, 0.1272683, 3.062417, 0.5843138, 0, 1, 1,
0.7612338, -0.9828339, 1.340186, 0.5882353, 0, 1, 1,
0.7613525, -1.366597, 2.378839, 0.5960785, 0, 1, 1,
0.7615998, -0.003066696, 1.461321, 0.6039216, 0, 1, 1,
0.7677946, 0.3139938, 1.216463, 0.6078432, 0, 1, 1,
0.7685941, -1.060791, 0.7713486, 0.6156863, 0, 1, 1,
0.7688564, -1.543037, 2.606871, 0.6196079, 0, 1, 1,
0.7768193, 0.3580127, 0.914084, 0.627451, 0, 1, 1,
0.7804992, -0.3339372, 1.89395, 0.6313726, 0, 1, 1,
0.781137, 0.03403048, 1.901801, 0.6392157, 0, 1, 1,
0.7869642, 0.7612761, 2.446472, 0.6431373, 0, 1, 1,
0.7938094, 0.3742251, -0.6300457, 0.6509804, 0, 1, 1,
0.7953695, -1.527598, 2.376297, 0.654902, 0, 1, 1,
0.7992495, 1.040513, 1.023158, 0.6627451, 0, 1, 1,
0.8009211, 0.2392247, -0.3553712, 0.6666667, 0, 1, 1,
0.801056, -0.281112, 1.069237, 0.6745098, 0, 1, 1,
0.8040101, -0.0831295, 1.523913, 0.6784314, 0, 1, 1,
0.8056799, 0.3213268, 2.772895, 0.6862745, 0, 1, 1,
0.8240058, 0.06857728, 0.5328134, 0.6901961, 0, 1, 1,
0.8265458, -0.1821799, 1.163489, 0.6980392, 0, 1, 1,
0.8271041, 0.5164188, 0.3945615, 0.7058824, 0, 1, 1,
0.8302333, -0.2232763, 1.476068, 0.7098039, 0, 1, 1,
0.8347329, 0.5992511, 0.34074, 0.7176471, 0, 1, 1,
0.8371658, -0.6114236, 1.606175, 0.7215686, 0, 1, 1,
0.8375817, 0.8536217, 1.215351, 0.7294118, 0, 1, 1,
0.8405868, -0.4221355, 2.594113, 0.7333333, 0, 1, 1,
0.8412451, 0.9258457, 1.746985, 0.7411765, 0, 1, 1,
0.8445239, -0.01243161, 0.983643, 0.7450981, 0, 1, 1,
0.8539072, 0.9642334, -0.1006718, 0.7529412, 0, 1, 1,
0.8586237, 0.6907012, 0.07679641, 0.7568628, 0, 1, 1,
0.8636209, 0.06037141, 1.653898, 0.7647059, 0, 1, 1,
0.8683956, 0.6689637, 1.137686, 0.7686275, 0, 1, 1,
0.8706325, 0.4888102, -1.703463, 0.7764706, 0, 1, 1,
0.8753392, -0.7177073, 2.362214, 0.7803922, 0, 1, 1,
0.8827038, 0.3450306, -0.2543471, 0.7882353, 0, 1, 1,
0.8830196, -0.2860634, 3.101717, 0.7921569, 0, 1, 1,
0.8890918, 1.594033, 2.15654, 0.8, 0, 1, 1,
0.8952892, -0.5316511, 2.467642, 0.8078431, 0, 1, 1,
0.9003468, -0.8816453, 2.996928, 0.8117647, 0, 1, 1,
0.9069067, -0.3593396, 2.424316, 0.8196079, 0, 1, 1,
0.9082662, -1.010139, 3.099224, 0.8235294, 0, 1, 1,
0.9122595, 0.7726935, 0.9459412, 0.8313726, 0, 1, 1,
0.9323088, -0.08731621, 0.8534901, 0.8352941, 0, 1, 1,
0.933766, 0.79887, 0.5999669, 0.8431373, 0, 1, 1,
0.9489067, -0.8475023, 3.748128, 0.8470588, 0, 1, 1,
0.9596274, -0.1464571, 3.029905, 0.854902, 0, 1, 1,
0.9604642, 0.1762142, 2.423574, 0.8588235, 0, 1, 1,
0.9695018, -1.621015, 2.632696, 0.8666667, 0, 1, 1,
0.9808, 0.4612214, 2.71918, 0.8705882, 0, 1, 1,
0.9819241, 0.2547804, 1.55165, 0.8784314, 0, 1, 1,
0.9831679, 1.52483, 2.018488, 0.8823529, 0, 1, 1,
0.9859411, 0.8326187, -1.430632, 0.8901961, 0, 1, 1,
0.9879082, -1.009736, 1.438956, 0.8941177, 0, 1, 1,
0.9896028, -0.2446846, 2.463282, 0.9019608, 0, 1, 1,
0.9927226, 0.6126738, 0.5277386, 0.9098039, 0, 1, 1,
0.9945759, 0.3383906, 1.894617, 0.9137255, 0, 1, 1,
1.0019, -0.3245476, 1.728288, 0.9215686, 0, 1, 1,
1.004101, 0.08188868, -0.0119233, 0.9254902, 0, 1, 1,
1.004734, -1.266319, 3.178886, 0.9333333, 0, 1, 1,
1.007099, 0.05862407, 0.8982899, 0.9372549, 0, 1, 1,
1.009207, 0.002185802, 0.6982253, 0.945098, 0, 1, 1,
1.013123, -0.9485543, 1.451618, 0.9490196, 0, 1, 1,
1.025707, -1.40698, 1.5326, 0.9568627, 0, 1, 1,
1.025968, 0.7600684, 0.8461365, 0.9607843, 0, 1, 1,
1.027451, -1.39377, 2.238583, 0.9686275, 0, 1, 1,
1.040364, -0.696931, 3.264103, 0.972549, 0, 1, 1,
1.043279, -0.840112, 3.422173, 0.9803922, 0, 1, 1,
1.047052, 0.4080659, -0.9325755, 0.9843137, 0, 1, 1,
1.049441, 0.274043, 1.962392, 0.9921569, 0, 1, 1,
1.053961, -1.087343, -0.4472266, 0.9960784, 0, 1, 1,
1.054038, -1.565454, 1.450253, 1, 0, 0.9960784, 1,
1.067728, 0.1209314, 0.3071216, 1, 0, 0.9882353, 1,
1.072588, 0.4287578, -0.4248434, 1, 0, 0.9843137, 1,
1.08548, 0.2460093, 1.777759, 1, 0, 0.9764706, 1,
1.091337, -0.8651021, 2.244405, 1, 0, 0.972549, 1,
1.093859, -0.7428624, 1.687015, 1, 0, 0.9647059, 1,
1.095051, 0.2649334, -0.5631739, 1, 0, 0.9607843, 1,
1.098968, -0.8405051, 1.890981, 1, 0, 0.9529412, 1,
1.102495, 0.5523769, 0.9406051, 1, 0, 0.9490196, 1,
1.103044, 0.4637771, 0.5465767, 1, 0, 0.9411765, 1,
1.103799, -1.203635, 2.706257, 1, 0, 0.9372549, 1,
1.109422, 0.1945344, 1.344644, 1, 0, 0.9294118, 1,
1.115705, -0.8698426, 4.214802, 1, 0, 0.9254902, 1,
1.117272, -0.7106627, 0.8766817, 1, 0, 0.9176471, 1,
1.128678, -1.471126, 2.416733, 1, 0, 0.9137255, 1,
1.129044, 0.01390627, 1.557261, 1, 0, 0.9058824, 1,
1.132205, 0.3317836, 2.432984, 1, 0, 0.9019608, 1,
1.133576, -0.05931629, 2.276574, 1, 0, 0.8941177, 1,
1.138565, -1.302736, 4.217527, 1, 0, 0.8862745, 1,
1.138903, 0.4319835, 0.4560644, 1, 0, 0.8823529, 1,
1.141727, -0.006470953, 2.816744, 1, 0, 0.8745098, 1,
1.14326, -1.52004, 1.207817, 1, 0, 0.8705882, 1,
1.150639, -0.5446424, 2.230237, 1, 0, 0.8627451, 1,
1.152781, -0.2740471, 1.462623, 1, 0, 0.8588235, 1,
1.154697, -0.5343763, 2.720722, 1, 0, 0.8509804, 1,
1.166022, -1.11051, 1.77062, 1, 0, 0.8470588, 1,
1.167627, 1.407242, 1.285231, 1, 0, 0.8392157, 1,
1.177017, -0.6831877, 2.545661, 1, 0, 0.8352941, 1,
1.179432, -1.232192, 2.403251, 1, 0, 0.827451, 1,
1.179466, -0.6674147, 1.530675, 1, 0, 0.8235294, 1,
1.183168, 0.5993404, 0.9890221, 1, 0, 0.8156863, 1,
1.186984, -0.298773, 1.15531, 1, 0, 0.8117647, 1,
1.191436, -0.1818223, 3.980161, 1, 0, 0.8039216, 1,
1.197848, 1.323136, -0.5034309, 1, 0, 0.7960784, 1,
1.200304, -1.726102, 1.467463, 1, 0, 0.7921569, 1,
1.201556, -1.365955, 2.560731, 1, 0, 0.7843137, 1,
1.203348, 0.8113288, 2.147212, 1, 0, 0.7803922, 1,
1.208674, -0.7471032, 1.62287, 1, 0, 0.772549, 1,
1.212055, 0.462302, -0.791048, 1, 0, 0.7686275, 1,
1.214195, -1.205462, 3.183187, 1, 0, 0.7607843, 1,
1.224635, -2.113463, 3.199034, 1, 0, 0.7568628, 1,
1.227758, 1.305226, 1.658609, 1, 0, 0.7490196, 1,
1.231811, 1.128747, 0.1149533, 1, 0, 0.7450981, 1,
1.232306, -0.09510792, 0.3819584, 1, 0, 0.7372549, 1,
1.235875, -1.235674, 1.676355, 1, 0, 0.7333333, 1,
1.238189, -1.54867, 2.461414, 1, 0, 0.7254902, 1,
1.238213, 1.151747, 1.648405, 1, 0, 0.7215686, 1,
1.242866, -0.2425438, 1.50741, 1, 0, 0.7137255, 1,
1.244813, 0.2308072, 0.4207515, 1, 0, 0.7098039, 1,
1.247766, 0.4071704, 3.636955, 1, 0, 0.7019608, 1,
1.248317, -1.236934, 2.112481, 1, 0, 0.6941177, 1,
1.252077, -0.2872126, 1.200192, 1, 0, 0.6901961, 1,
1.254838, 0.6760218, 2.101969, 1, 0, 0.682353, 1,
1.257702, 1.020541, -0.09320149, 1, 0, 0.6784314, 1,
1.266351, -0.1236051, 2.886927, 1, 0, 0.6705883, 1,
1.271732, -0.9317025, 2.129728, 1, 0, 0.6666667, 1,
1.272429, -1.097782, 3.153159, 1, 0, 0.6588235, 1,
1.274267, 2.002376, 1.147402, 1, 0, 0.654902, 1,
1.281126, 0.1684494, 1.53776, 1, 0, 0.6470588, 1,
1.290998, -2.225859, 1.552354, 1, 0, 0.6431373, 1,
1.29811, -1.487167, 2.629419, 1, 0, 0.6352941, 1,
1.305601, 1.310898, 3.447653, 1, 0, 0.6313726, 1,
1.312044, 0.5956196, 0.5559675, 1, 0, 0.6235294, 1,
1.316016, 1.264116, -0.6682754, 1, 0, 0.6196079, 1,
1.329963, 0.03874236, 1.260007, 1, 0, 0.6117647, 1,
1.334237, -0.04251812, 0.5446217, 1, 0, 0.6078432, 1,
1.336295, -0.4096062, 3.037593, 1, 0, 0.6, 1,
1.346977, 0.556184, 0.02261097, 1, 0, 0.5921569, 1,
1.350681, 0.2378206, -1.497134, 1, 0, 0.5882353, 1,
1.352117, -0.3921644, 0.8584768, 1, 0, 0.5803922, 1,
1.354716, -0.7762448, 2.516371, 1, 0, 0.5764706, 1,
1.362717, 0.5095983, 1.695843, 1, 0, 0.5686275, 1,
1.365484, 1.448802, 1.341532, 1, 0, 0.5647059, 1,
1.369683, 1.440999, 1.940868, 1, 0, 0.5568628, 1,
1.372726, 0.3670136, 0.9757091, 1, 0, 0.5529412, 1,
1.381946, -1.249097, 2.671785, 1, 0, 0.5450981, 1,
1.394957, -0.3186095, 0.5804061, 1, 0, 0.5411765, 1,
1.398507, 1.973692, -0.6677107, 1, 0, 0.5333334, 1,
1.398873, -0.1198733, 1.255009, 1, 0, 0.5294118, 1,
1.402806, -0.1138905, 2.738408, 1, 0, 0.5215687, 1,
1.405665, 0.3131636, 1.322375, 1, 0, 0.5176471, 1,
1.412537, -0.2475837, 2.183266, 1, 0, 0.509804, 1,
1.424686, 0.316203, 1.430929, 1, 0, 0.5058824, 1,
1.425409, -1.434502, 1.808979, 1, 0, 0.4980392, 1,
1.426156, -0.1765477, 1.724663, 1, 0, 0.4901961, 1,
1.427718, -0.5079023, 4.305792, 1, 0, 0.4862745, 1,
1.428955, -0.108668, 1.584121, 1, 0, 0.4784314, 1,
1.441376, 1.698608, 0.2846593, 1, 0, 0.4745098, 1,
1.444124, -0.2729047, 2.107206, 1, 0, 0.4666667, 1,
1.448733, -0.5954496, 1.170566, 1, 0, 0.4627451, 1,
1.459984, -0.2395631, 1.714978, 1, 0, 0.454902, 1,
1.461086, -0.2902468, 1.750246, 1, 0, 0.4509804, 1,
1.461547, -0.9968792, 2.630189, 1, 0, 0.4431373, 1,
1.462351, -1.64248, 1.058413, 1, 0, 0.4392157, 1,
1.46464, -0.9732494, 0.4998287, 1, 0, 0.4313726, 1,
1.468086, -0.5992402, 3.341278, 1, 0, 0.427451, 1,
1.468867, 2.109416, 1.480913, 1, 0, 0.4196078, 1,
1.477661, 0.9517615, 0.7641065, 1, 0, 0.4156863, 1,
1.485802, 0.2782966, 0.395586, 1, 0, 0.4078431, 1,
1.502492, 2.267884, -0.08928951, 1, 0, 0.4039216, 1,
1.504026, -0.6850319, 2.300231, 1, 0, 0.3960784, 1,
1.525823, -0.01780177, 0.2882751, 1, 0, 0.3882353, 1,
1.536213, 0.09167964, 1.006895, 1, 0, 0.3843137, 1,
1.543417, 1.101103, 2.956852, 1, 0, 0.3764706, 1,
1.555592, 0.9055752, -0.3151341, 1, 0, 0.372549, 1,
1.557025, -0.462161, 3.144217, 1, 0, 0.3647059, 1,
1.561182, 1.14534, 2.339715, 1, 0, 0.3607843, 1,
1.563406, 1.926207, 2.002221, 1, 0, 0.3529412, 1,
1.565005, 1.488361, 1.12696, 1, 0, 0.3490196, 1,
1.57143, -0.4974543, 3.237634, 1, 0, 0.3411765, 1,
1.572481, 1.067148, 1.45754, 1, 0, 0.3372549, 1,
1.58194, -0.9542925, 1.793862, 1, 0, 0.3294118, 1,
1.58618, -0.8874639, 0.6534014, 1, 0, 0.3254902, 1,
1.616378, 0.7641365, 0.5796329, 1, 0, 0.3176471, 1,
1.624256, 0.06630111, 1.467716, 1, 0, 0.3137255, 1,
1.625007, -0.7633692, 3.495908, 1, 0, 0.3058824, 1,
1.645039, -0.2218915, 2.860451, 1, 0, 0.2980392, 1,
1.654148, 0.4485705, 1.434664, 1, 0, 0.2941177, 1,
1.656532, -0.2394246, 1.623706, 1, 0, 0.2862745, 1,
1.657109, -0.8691394, 0.9649198, 1, 0, 0.282353, 1,
1.692267, -2.563145, 3.469631, 1, 0, 0.2745098, 1,
1.699019, 0.06641591, 0.9477894, 1, 0, 0.2705882, 1,
1.72394, 1.330586, 0.7903508, 1, 0, 0.2627451, 1,
1.757896, -1.903367, 3.377176, 1, 0, 0.2588235, 1,
1.781124, -0.4941728, 1.533431, 1, 0, 0.2509804, 1,
1.794991, 0.05918835, 1.52984, 1, 0, 0.2470588, 1,
1.803002, 0.1115129, 1.565077, 1, 0, 0.2392157, 1,
1.81268, -0.111117, 0.6797466, 1, 0, 0.2352941, 1,
1.813456, 1.931889, 0.6107224, 1, 0, 0.227451, 1,
1.817419, -1.232317, 4.004085, 1, 0, 0.2235294, 1,
1.852876, -0.9118429, 2.804686, 1, 0, 0.2156863, 1,
1.862098, -0.05952906, 3.616632, 1, 0, 0.2117647, 1,
1.869365, 0.6469583, 1.697273, 1, 0, 0.2039216, 1,
1.872773, -1.939983, -0.4681853, 1, 0, 0.1960784, 1,
1.889396, 1.500353, 3.074131, 1, 0, 0.1921569, 1,
1.907428, -0.2866181, 2.194843, 1, 0, 0.1843137, 1,
1.910916, -0.1463104, 1.648968, 1, 0, 0.1803922, 1,
1.920026, -0.6628751, 1.666379, 1, 0, 0.172549, 1,
1.941334, -0.7130306, 2.616439, 1, 0, 0.1686275, 1,
1.953887, -0.7224292, 2.028615, 1, 0, 0.1607843, 1,
1.9605, -0.5082425, 2.456637, 1, 0, 0.1568628, 1,
1.987712, -0.9395991, 0.7950038, 1, 0, 0.1490196, 1,
2.054045, 0.6922352, 0.8317019, 1, 0, 0.145098, 1,
2.057748, -0.7012551, 2.70453, 1, 0, 0.1372549, 1,
2.069467, 0.6137028, 1.821493, 1, 0, 0.1333333, 1,
2.097966, -0.2179179, 0.8918732, 1, 0, 0.1254902, 1,
2.105357, 0.4469284, 1.271692, 1, 0, 0.1215686, 1,
2.155274, 2.083893, 0.9659563, 1, 0, 0.1137255, 1,
2.16323, 0.8076572, 0.4124472, 1, 0, 0.1098039, 1,
2.195032, 0.9057098, 0.3221791, 1, 0, 0.1019608, 1,
2.278723, -2.247594, 1.262074, 1, 0, 0.09411765, 1,
2.296455, 1.399054, 2.41099, 1, 0, 0.09019608, 1,
2.297884, 1.818132, 1.299647, 1, 0, 0.08235294, 1,
2.342512, -0.04109985, 2.66288, 1, 0, 0.07843138, 1,
2.344051, 0.2748771, 1.680001, 1, 0, 0.07058824, 1,
2.355775, -0.8744345, 2.422389, 1, 0, 0.06666667, 1,
2.370755, -0.5429245, 0.8610011, 1, 0, 0.05882353, 1,
2.462439, 0.4682196, 2.935125, 1, 0, 0.05490196, 1,
2.529847, 0.6604628, 1.520813, 1, 0, 0.04705882, 1,
2.537371, -0.7577712, 2.850439, 1, 0, 0.04313726, 1,
2.562554, 0.5130888, 2.040913, 1, 0, 0.03529412, 1,
2.65731, 0.7642412, 1.714088, 1, 0, 0.03137255, 1,
2.691659, 0.5600832, 1.768464, 1, 0, 0.02352941, 1,
2.942905, -1.74026, 0.790345, 1, 0, 0.01960784, 1,
3.064214, 1.053551, -0.1695283, 1, 0, 0.01176471, 1,
3.34289, 0.1077841, 0.04871807, 1, 0, 0.007843138, 1
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
0.2509409, -4.860438, -8.267859, 0, -0.5, 0.5, 0.5,
0.2509409, -4.860438, -8.267859, 1, -0.5, 0.5, 0.5,
0.2509409, -4.860438, -8.267859, 1, 1.5, 0.5, 0.5,
0.2509409, -4.860438, -8.267859, 0, 1.5, 0.5, 0.5
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
-3.889178, -0.2996755, -8.267859, 0, -0.5, 0.5, 0.5,
-3.889178, -0.2996755, -8.267859, 1, -0.5, 0.5, 0.5,
-3.889178, -0.2996755, -8.267859, 1, 1.5, 0.5, 0.5,
-3.889178, -0.2996755, -8.267859, 0, 1.5, 0.5, 0.5
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
-3.889178, -4.860438, -0.1745679, 0, -0.5, 0.5, 0.5,
-3.889178, -4.860438, -0.1745679, 1, -0.5, 0.5, 0.5,
-3.889178, -4.860438, -0.1745679, 1, 1.5, 0.5, 0.5,
-3.889178, -4.860438, -0.1745679, 0, 1.5, 0.5, 0.5
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
-2, -3.807954, -6.400177,
3, -3.807954, -6.400177,
-2, -3.807954, -6.400177,
-2, -3.983368, -6.711457,
-1, -3.807954, -6.400177,
-1, -3.983368, -6.711457,
0, -3.807954, -6.400177,
0, -3.983368, -6.711457,
1, -3.807954, -6.400177,
1, -3.983368, -6.711457,
2, -3.807954, -6.400177,
2, -3.983368, -6.711457,
3, -3.807954, -6.400177,
3, -3.983368, -6.711457
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
-2, -4.334196, -7.334018, 0, -0.5, 0.5, 0.5,
-2, -4.334196, -7.334018, 1, -0.5, 0.5, 0.5,
-2, -4.334196, -7.334018, 1, 1.5, 0.5, 0.5,
-2, -4.334196, -7.334018, 0, 1.5, 0.5, 0.5,
-1, -4.334196, -7.334018, 0, -0.5, 0.5, 0.5,
-1, -4.334196, -7.334018, 1, -0.5, 0.5, 0.5,
-1, -4.334196, -7.334018, 1, 1.5, 0.5, 0.5,
-1, -4.334196, -7.334018, 0, 1.5, 0.5, 0.5,
0, -4.334196, -7.334018, 0, -0.5, 0.5, 0.5,
0, -4.334196, -7.334018, 1, -0.5, 0.5, 0.5,
0, -4.334196, -7.334018, 1, 1.5, 0.5, 0.5,
0, -4.334196, -7.334018, 0, 1.5, 0.5, 0.5,
1, -4.334196, -7.334018, 0, -0.5, 0.5, 0.5,
1, -4.334196, -7.334018, 1, -0.5, 0.5, 0.5,
1, -4.334196, -7.334018, 1, 1.5, 0.5, 0.5,
1, -4.334196, -7.334018, 0, 1.5, 0.5, 0.5,
2, -4.334196, -7.334018, 0, -0.5, 0.5, 0.5,
2, -4.334196, -7.334018, 1, -0.5, 0.5, 0.5,
2, -4.334196, -7.334018, 1, 1.5, 0.5, 0.5,
2, -4.334196, -7.334018, 0, 1.5, 0.5, 0.5,
3, -4.334196, -7.334018, 0, -0.5, 0.5, 0.5,
3, -4.334196, -7.334018, 1, -0.5, 0.5, 0.5,
3, -4.334196, -7.334018, 1, 1.5, 0.5, 0.5,
3, -4.334196, -7.334018, 0, 1.5, 0.5, 0.5
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
-2.933766, -3, -6.400177,
-2.933766, 3, -6.400177,
-2.933766, -3, -6.400177,
-3.093002, -3, -6.711457,
-2.933766, -2, -6.400177,
-3.093002, -2, -6.711457,
-2.933766, -1, -6.400177,
-3.093002, -1, -6.711457,
-2.933766, 0, -6.400177,
-3.093002, 0, -6.711457,
-2.933766, 1, -6.400177,
-3.093002, 1, -6.711457,
-2.933766, 2, -6.400177,
-3.093002, 2, -6.711457,
-2.933766, 3, -6.400177,
-3.093002, 3, -6.711457
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
-3.411472, -3, -7.334018, 0, -0.5, 0.5, 0.5,
-3.411472, -3, -7.334018, 1, -0.5, 0.5, 0.5,
-3.411472, -3, -7.334018, 1, 1.5, 0.5, 0.5,
-3.411472, -3, -7.334018, 0, 1.5, 0.5, 0.5,
-3.411472, -2, -7.334018, 0, -0.5, 0.5, 0.5,
-3.411472, -2, -7.334018, 1, -0.5, 0.5, 0.5,
-3.411472, -2, -7.334018, 1, 1.5, 0.5, 0.5,
-3.411472, -2, -7.334018, 0, 1.5, 0.5, 0.5,
-3.411472, -1, -7.334018, 0, -0.5, 0.5, 0.5,
-3.411472, -1, -7.334018, 1, -0.5, 0.5, 0.5,
-3.411472, -1, -7.334018, 1, 1.5, 0.5, 0.5,
-3.411472, -1, -7.334018, 0, 1.5, 0.5, 0.5,
-3.411472, 0, -7.334018, 0, -0.5, 0.5, 0.5,
-3.411472, 0, -7.334018, 1, -0.5, 0.5, 0.5,
-3.411472, 0, -7.334018, 1, 1.5, 0.5, 0.5,
-3.411472, 0, -7.334018, 0, 1.5, 0.5, 0.5,
-3.411472, 1, -7.334018, 0, -0.5, 0.5, 0.5,
-3.411472, 1, -7.334018, 1, -0.5, 0.5, 0.5,
-3.411472, 1, -7.334018, 1, 1.5, 0.5, 0.5,
-3.411472, 1, -7.334018, 0, 1.5, 0.5, 0.5,
-3.411472, 2, -7.334018, 0, -0.5, 0.5, 0.5,
-3.411472, 2, -7.334018, 1, -0.5, 0.5, 0.5,
-3.411472, 2, -7.334018, 1, 1.5, 0.5, 0.5,
-3.411472, 2, -7.334018, 0, 1.5, 0.5, 0.5,
-3.411472, 3, -7.334018, 0, -0.5, 0.5, 0.5,
-3.411472, 3, -7.334018, 1, -0.5, 0.5, 0.5,
-3.411472, 3, -7.334018, 1, 1.5, 0.5, 0.5,
-3.411472, 3, -7.334018, 0, 1.5, 0.5, 0.5
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
-2.933766, -3.807954, -6,
-2.933766, -3.807954, 4,
-2.933766, -3.807954, -6,
-3.093002, -3.983368, -6,
-2.933766, -3.807954, -4,
-3.093002, -3.983368, -4,
-2.933766, -3.807954, -2,
-3.093002, -3.983368, -2,
-2.933766, -3.807954, 0,
-3.093002, -3.983368, 0,
-2.933766, -3.807954, 2,
-3.093002, -3.983368, 2,
-2.933766, -3.807954, 4,
-3.093002, -3.983368, 4
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
-3.411472, -4.334196, -6, 0, -0.5, 0.5, 0.5,
-3.411472, -4.334196, -6, 1, -0.5, 0.5, 0.5,
-3.411472, -4.334196, -6, 1, 1.5, 0.5, 0.5,
-3.411472, -4.334196, -6, 0, 1.5, 0.5, 0.5,
-3.411472, -4.334196, -4, 0, -0.5, 0.5, 0.5,
-3.411472, -4.334196, -4, 1, -0.5, 0.5, 0.5,
-3.411472, -4.334196, -4, 1, 1.5, 0.5, 0.5,
-3.411472, -4.334196, -4, 0, 1.5, 0.5, 0.5,
-3.411472, -4.334196, -2, 0, -0.5, 0.5, 0.5,
-3.411472, -4.334196, -2, 1, -0.5, 0.5, 0.5,
-3.411472, -4.334196, -2, 1, 1.5, 0.5, 0.5,
-3.411472, -4.334196, -2, 0, 1.5, 0.5, 0.5,
-3.411472, -4.334196, 0, 0, -0.5, 0.5, 0.5,
-3.411472, -4.334196, 0, 1, -0.5, 0.5, 0.5,
-3.411472, -4.334196, 0, 1, 1.5, 0.5, 0.5,
-3.411472, -4.334196, 0, 0, 1.5, 0.5, 0.5,
-3.411472, -4.334196, 2, 0, -0.5, 0.5, 0.5,
-3.411472, -4.334196, 2, 1, -0.5, 0.5, 0.5,
-3.411472, -4.334196, 2, 1, 1.5, 0.5, 0.5,
-3.411472, -4.334196, 2, 0, 1.5, 0.5, 0.5,
-3.411472, -4.334196, 4, 0, -0.5, 0.5, 0.5,
-3.411472, -4.334196, 4, 1, -0.5, 0.5, 0.5,
-3.411472, -4.334196, 4, 1, 1.5, 0.5, 0.5,
-3.411472, -4.334196, 4, 0, 1.5, 0.5, 0.5
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
-2.933766, -3.807954, -6.400177,
-2.933766, 3.208603, -6.400177,
-2.933766, -3.807954, 6.051041,
-2.933766, 3.208603, 6.051041,
-2.933766, -3.807954, -6.400177,
-2.933766, -3.807954, 6.051041,
-2.933766, 3.208603, -6.400177,
-2.933766, 3.208603, 6.051041,
-2.933766, -3.807954, -6.400177,
3.435648, -3.807954, -6.400177,
-2.933766, -3.807954, 6.051041,
3.435648, -3.807954, 6.051041,
-2.933766, 3.208603, -6.400177,
3.435648, 3.208603, -6.400177,
-2.933766, 3.208603, 6.051041,
3.435648, 3.208603, 6.051041,
3.435648, -3.807954, -6.400177,
3.435648, 3.208603, -6.400177,
3.435648, -3.807954, 6.051041,
3.435648, 3.208603, 6.051041,
3.435648, -3.807954, -6.400177,
3.435648, -3.807954, 6.051041,
3.435648, 3.208603, -6.400177,
3.435648, 3.208603, 6.051041
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
var radius = 8.355292;
var distance = 37.17363;
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
mvMatrix.translate( -0.2509409, 0.2996755, 0.1745679 );
mvMatrix.scale( 1.418326, 1.287512, 0.7255439 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -37.17363);
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
mecarbam<-read.table("mecarbam.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-mecarbam$V2
```

```
## Error in eval(expr, envir, enclos): object 'mecarbam' not found
```

```r
y<-mecarbam$V3
```

```
## Error in eval(expr, envir, enclos): object 'mecarbam' not found
```

```r
z<-mecarbam$V4
```

```
## Error in eval(expr, envir, enclos): object 'mecarbam' not found
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
-2.841008, 0.4160855, -0.1081084, 0, 0, 1, 1, 1,
-2.632548, 1.677528, -2.172437, 1, 0, 0, 1, 1,
-2.598377, -0.4786786, -2.663466, 1, 0, 0, 1, 1,
-2.557219, 1.662386, -0.7812624, 1, 0, 0, 1, 1,
-2.509068, 0.6826289, -2.076837, 1, 0, 0, 1, 1,
-2.508359, 0.2365367, -2.532125, 1, 0, 0, 1, 1,
-2.496485, 0.3024632, -0.5252298, 0, 0, 0, 1, 1,
-2.48134, 1.425433, -1.100407, 0, 0, 0, 1, 1,
-2.477832, -0.3459441, -2.220749, 0, 0, 0, 1, 1,
-2.45269, -0.3461123, -1.657815, 0, 0, 0, 1, 1,
-2.403102, -0.8822662, -2.23994, 0, 0, 0, 1, 1,
-2.399522, -0.6869946, -2.48917, 0, 0, 0, 1, 1,
-2.36364, 0.9983425, -3.372855, 0, 0, 0, 1, 1,
-2.307606, -0.6698871, -1.82662, 1, 1, 1, 1, 1,
-2.262888, -0.759914, -0.9372132, 1, 1, 1, 1, 1,
-2.256584, 0.4122117, -1.232684, 1, 1, 1, 1, 1,
-2.2401, -0.7368844, -2.958749, 1, 1, 1, 1, 1,
-2.176679, 1.876461, -0.3835092, 1, 1, 1, 1, 1,
-2.174488, -1.547811, -2.064961, 1, 1, 1, 1, 1,
-2.163557, -0.8590018, -2.733938, 1, 1, 1, 1, 1,
-2.003726, -1.201406, -2.94812, 1, 1, 1, 1, 1,
-1.982625, 0.5231661, -0.3475219, 1, 1, 1, 1, 1,
-1.969967, -0.9144122, -1.478532, 1, 1, 1, 1, 1,
-1.968822, -1.920952, -1.191387, 1, 1, 1, 1, 1,
-1.95939, 1.084996, -1.187887, 1, 1, 1, 1, 1,
-1.950711, -0.2803456, -3.027868, 1, 1, 1, 1, 1,
-1.915906, 0.6272097, -1.544133, 1, 1, 1, 1, 1,
-1.913208, -1.447325, -0.747987, 1, 1, 1, 1, 1,
-1.897992, -0.3205192, -2.958681, 0, 0, 1, 1, 1,
-1.883197, -0.728062, -2.115713, 1, 0, 0, 1, 1,
-1.847446, -0.4052481, -0.821202, 1, 0, 0, 1, 1,
-1.844063, -0.1151727, -0.527438, 1, 0, 0, 1, 1,
-1.830957, 0.8726112, 0.3515184, 1, 0, 0, 1, 1,
-1.821309, -1.955222, -3.460585, 1, 0, 0, 1, 1,
-1.800723, -0.6400184, -3.352832, 0, 0, 0, 1, 1,
-1.780964, -0.2554771, -0.8187981, 0, 0, 0, 1, 1,
-1.779246, 0.6512908, -1.455945, 0, 0, 0, 1, 1,
-1.767572, 0.1135601, -0.6851518, 0, 0, 0, 1, 1,
-1.766728, -0.1782176, -2.419801, 0, 0, 0, 1, 1,
-1.75337, -0.1441954, -0.7211253, 0, 0, 0, 1, 1,
-1.752407, 0.9091486, 0.1532474, 0, 0, 0, 1, 1,
-1.750072, -0.8560717, -2.229194, 1, 1, 1, 1, 1,
-1.743221, 0.5310397, -1.123999, 1, 1, 1, 1, 1,
-1.727754, -0.8810349, -2.490708, 1, 1, 1, 1, 1,
-1.71595, 0.1722337, -0.3818893, 1, 1, 1, 1, 1,
-1.715939, -0.9866268, -0.05496262, 1, 1, 1, 1, 1,
-1.701122, 0.5205792, -3.48867, 1, 1, 1, 1, 1,
-1.681512, 0.05127404, -2.366953, 1, 1, 1, 1, 1,
-1.679194, -0.7470157, -3.536796, 1, 1, 1, 1, 1,
-1.676761, 0.3052922, -2.946943, 1, 1, 1, 1, 1,
-1.663859, 1.194004, 0.2139827, 1, 1, 1, 1, 1,
-1.656545, 0.9942452, -1.072502, 1, 1, 1, 1, 1,
-1.641194, 0.9016535, -0.06426722, 1, 1, 1, 1, 1,
-1.624886, -0.6521541, -2.835163, 1, 1, 1, 1, 1,
-1.599972, 0.5600875, -0.2243457, 1, 1, 1, 1, 1,
-1.590506, 0.8369628, -1.683017, 1, 1, 1, 1, 1,
-1.585117, -1.589425, -2.509015, 0, 0, 1, 1, 1,
-1.571685, -0.9932731, -1.66724, 1, 0, 0, 1, 1,
-1.565768, 1.413185, -0.2937219, 1, 0, 0, 1, 1,
-1.559081, 0.6411911, -1.372195, 1, 0, 0, 1, 1,
-1.548669, -0.1843904, -2.360657, 1, 0, 0, 1, 1,
-1.543135, 0.6098049, -0.4302702, 1, 0, 0, 1, 1,
-1.54007, 1.796864, 0.1135017, 0, 0, 0, 1, 1,
-1.536682, -0.7033004, -2.434863, 0, 0, 0, 1, 1,
-1.511754, -0.1142426, -1.188502, 0, 0, 0, 1, 1,
-1.503534, -0.6811628, -1.784315, 0, 0, 0, 1, 1,
-1.503241, -1.986254, -2.300377, 0, 0, 0, 1, 1,
-1.487589, -0.4106297, -0.4393673, 0, 0, 0, 1, 1,
-1.470076, 0.1239324, -1.94251, 0, 0, 0, 1, 1,
-1.436726, 0.7430328, -1.069025, 1, 1, 1, 1, 1,
-1.43657, -1.097609, -2.62762, 1, 1, 1, 1, 1,
-1.43117, -0.9611159, -3.004121, 1, 1, 1, 1, 1,
-1.425747, -0.4260418, -3.125067, 1, 1, 1, 1, 1,
-1.424496, -0.9181453, -2.810105, 1, 1, 1, 1, 1,
-1.417425, -1.109638, -3.943137, 1, 1, 1, 1, 1,
-1.411992, -1.733511, -0.8179552, 1, 1, 1, 1, 1,
-1.406761, -1.037323, -1.18086, 1, 1, 1, 1, 1,
-1.405112, -1.219577, -1.140041, 1, 1, 1, 1, 1,
-1.404107, 0.94916, -0.479171, 1, 1, 1, 1, 1,
-1.403373, 0.2775442, -2.520588, 1, 1, 1, 1, 1,
-1.393693, 0.29104, -0.2151283, 1, 1, 1, 1, 1,
-1.393028, 0.4960208, -1.736983, 1, 1, 1, 1, 1,
-1.390834, -1.338381, -0.7843497, 1, 1, 1, 1, 1,
-1.388673, -1.597202, -2.182809, 1, 1, 1, 1, 1,
-1.387661, -1.262188, -1.687682, 0, 0, 1, 1, 1,
-1.375479, -1.092597, -2.186327, 1, 0, 0, 1, 1,
-1.36916, 1.540047, 0.06848401, 1, 0, 0, 1, 1,
-1.363991, -1.415045, -3.378888, 1, 0, 0, 1, 1,
-1.35372, -1.726944, -2.024047, 1, 0, 0, 1, 1,
-1.349972, -0.7834442, -3.015578, 1, 0, 0, 1, 1,
-1.323026, -0.5882432, -1.39555, 0, 0, 0, 1, 1,
-1.320327, 0.5175109, -0.7395262, 0, 0, 0, 1, 1,
-1.304447, -0.3139161, -0.4298751, 0, 0, 0, 1, 1,
-1.302701, 2.017014, -0.8640031, 0, 0, 0, 1, 1,
-1.287285, 0.7919965, -0.8330105, 0, 0, 0, 1, 1,
-1.283386, 2.718416, 1.423895, 0, 0, 0, 1, 1,
-1.271654, -0.2985879, -3.095487, 0, 0, 0, 1, 1,
-1.27066, 1.169573, -0.4835409, 1, 1, 1, 1, 1,
-1.247801, 0.02211583, -2.086443, 1, 1, 1, 1, 1,
-1.245147, -0.3728736, -0.5232732, 1, 1, 1, 1, 1,
-1.237174, -1.229113, -1.500483, 1, 1, 1, 1, 1,
-1.225785, 0.3389575, -1.17976, 1, 1, 1, 1, 1,
-1.212427, -0.6847618, -0.3879933, 1, 1, 1, 1, 1,
-1.206832, -0.299205, -1.401843, 1, 1, 1, 1, 1,
-1.206213, -0.03699813, -2.24893, 1, 1, 1, 1, 1,
-1.204848, -0.08866999, -0.9467531, 1, 1, 1, 1, 1,
-1.187815, -0.3802567, -3.280033, 1, 1, 1, 1, 1,
-1.187354, 0.2072167, -0.7150225, 1, 1, 1, 1, 1,
-1.183804, 1.0683, -1.650927, 1, 1, 1, 1, 1,
-1.165484, -0.1270481, -3.384318, 1, 1, 1, 1, 1,
-1.161249, -0.1897029, -0.1299739, 1, 1, 1, 1, 1,
-1.159576, -1.513025, -2.573763, 1, 1, 1, 1, 1,
-1.158127, -1.030195, -0.6887879, 0, 0, 1, 1, 1,
-1.154103, -0.2055213, -2.191708, 1, 0, 0, 1, 1,
-1.150656, -1.848778, -1.797801, 1, 0, 0, 1, 1,
-1.136374, 0.6650134, -1.789127, 1, 0, 0, 1, 1,
-1.128763, -0.5551399, -2.900828, 1, 0, 0, 1, 1,
-1.128465, 0.04961182, 0.3395588, 1, 0, 0, 1, 1,
-1.126142, -0.4578377, -1.963664, 0, 0, 0, 1, 1,
-1.118412, -0.1191836, 0.23762, 0, 0, 0, 1, 1,
-1.117386, 0.0892012, -1.784473, 0, 0, 0, 1, 1,
-1.109426, 1.159996, -0.4150228, 0, 0, 0, 1, 1,
-1.10524, -0.1248874, -2.726675, 0, 0, 0, 1, 1,
-1.103003, -0.5820773, -0.5480168, 0, 0, 0, 1, 1,
-1.102974, 2.208923, -0.7684832, 0, 0, 0, 1, 1,
-1.100829, 0.1107516, -2.696576, 1, 1, 1, 1, 1,
-1.092816, 1.461104, -2.793044, 1, 1, 1, 1, 1,
-1.0916, -0.7251223, -0.947908, 1, 1, 1, 1, 1,
-1.086404, -0.9387274, -2.292553, 1, 1, 1, 1, 1,
-1.086181, 0.229389, -0.9233533, 1, 1, 1, 1, 1,
-1.081949, 2.395111, 0.1655559, 1, 1, 1, 1, 1,
-1.081762, 0.5827686, -0.5032836, 1, 1, 1, 1, 1,
-1.080591, 1.183207, 0.4411342, 1, 1, 1, 1, 1,
-1.076272, -0.07401981, -2.258289, 1, 1, 1, 1, 1,
-1.066805, -0.685531, -1.923818, 1, 1, 1, 1, 1,
-1.06072, -0.9357713, -3.344193, 1, 1, 1, 1, 1,
-1.058198, 0.3771575, 0.236496, 1, 1, 1, 1, 1,
-1.037166, 0.1030372, -1.929344, 1, 1, 1, 1, 1,
-1.034519, -1.148431, -1.138093, 1, 1, 1, 1, 1,
-1.023295, 0.1062415, -1.809565, 1, 1, 1, 1, 1,
-1.019994, -1.093246, -2.535996, 0, 0, 1, 1, 1,
-1.017989, 0.2724467, 0.05459869, 1, 0, 0, 1, 1,
-1.016966, 0.923492, -0.9135678, 1, 0, 0, 1, 1,
-1.009361, 1.025396, -1.704461, 1, 0, 0, 1, 1,
-1.009155, 0.07678376, -0.8146983, 1, 0, 0, 1, 1,
-1.004509, 0.1775316, 0.008328824, 1, 0, 0, 1, 1,
-1.001988, 0.678803, -1.174473, 0, 0, 0, 1, 1,
-0.9974625, -0.001851402, -0.9244479, 0, 0, 0, 1, 1,
-0.9906063, -1.091081, -3.483998, 0, 0, 0, 1, 1,
-0.9868603, -0.767351, -2.503776, 0, 0, 0, 1, 1,
-0.9848691, -1.497722, -2.632105, 0, 0, 0, 1, 1,
-0.9813361, -0.8918651, -2.297235, 0, 0, 0, 1, 1,
-0.9791151, 0.1706675, -0.9936038, 0, 0, 0, 1, 1,
-0.9773593, 0.3880033, -1.301754, 1, 1, 1, 1, 1,
-0.9760509, 0.3481131, -0.8505293, 1, 1, 1, 1, 1,
-0.9720391, 0.21504, -0.9098362, 1, 1, 1, 1, 1,
-0.9672878, -1.066698, -2.543276, 1, 1, 1, 1, 1,
-0.9672337, -0.01675498, -2.264107, 1, 1, 1, 1, 1,
-0.9624712, -1.403745, -1.047668, 1, 1, 1, 1, 1,
-0.9618976, 0.356306, -1.887224, 1, 1, 1, 1, 1,
-0.9559414, -0.7155524, -1.940206, 1, 1, 1, 1, 1,
-0.9506793, -0.3570647, -2.448361, 1, 1, 1, 1, 1,
-0.947908, -0.3818665, -2.301127, 1, 1, 1, 1, 1,
-0.9475629, -0.2833402, -2.253939, 1, 1, 1, 1, 1,
-0.9453206, -1.230582, -3.832127, 1, 1, 1, 1, 1,
-0.9409409, 1.047609, -0.02027375, 1, 1, 1, 1, 1,
-0.9356429, 0.247783, -3.25697, 1, 1, 1, 1, 1,
-0.9269527, 0.9029168, -1.615075, 1, 1, 1, 1, 1,
-0.9256629, -1.136741, -4.248884, 0, 0, 1, 1, 1,
-0.9156957, -0.3006822, -2.89291, 1, 0, 0, 1, 1,
-0.9066358, -0.5262567, -2.462463, 1, 0, 0, 1, 1,
-0.9066286, 0.1811059, -2.009936, 1, 0, 0, 1, 1,
-0.904646, 0.7292879, -1.543884, 1, 0, 0, 1, 1,
-0.891263, -0.6348193, -0.9036531, 1, 0, 0, 1, 1,
-0.8852583, 1.361855, 0.06475258, 0, 0, 0, 1, 1,
-0.8840316, 1.201124, -0.3757766, 0, 0, 0, 1, 1,
-0.8805207, -0.3119294, -2.406637, 0, 0, 0, 1, 1,
-0.8786545, 0.5187407, -0.1074406, 0, 0, 0, 1, 1,
-0.8753909, 0.8386869, -1.6556, 0, 0, 0, 1, 1,
-0.8748762, -1.09097, -1.619933, 0, 0, 0, 1, 1,
-0.8700351, -0.06711026, -0.4156649, 0, 0, 0, 1, 1,
-0.8683587, 0.2459884, -1.292228, 1, 1, 1, 1, 1,
-0.8677833, -0.1913795, -0.8922135, 1, 1, 1, 1, 1,
-0.862579, -0.6014109, -1.365967, 1, 1, 1, 1, 1,
-0.8490869, -2.000667, -4.93533, 1, 1, 1, 1, 1,
-0.8466775, -0.2470898, -1.949287, 1, 1, 1, 1, 1,
-0.8465977, -0.6882075, -2.115825, 1, 1, 1, 1, 1,
-0.8329448, 0.12256, -0.5825057, 1, 1, 1, 1, 1,
-0.8317751, -3.705771, -3.636265, 1, 1, 1, 1, 1,
-0.8298731, 0.02873885, -1.14323, 1, 1, 1, 1, 1,
-0.8292845, 0.2804888, -2.544232, 1, 1, 1, 1, 1,
-0.8238431, 0.2765147, -0.2519371, 1, 1, 1, 1, 1,
-0.818732, 1.073333, -2.064279, 1, 1, 1, 1, 1,
-0.81363, -0.9579563, -3.940754, 1, 1, 1, 1, 1,
-0.8112626, 0.5316241, 0.4817515, 1, 1, 1, 1, 1,
-0.8087103, -1.579769, -5.571311, 1, 1, 1, 1, 1,
-0.8057737, 0.2848105, -2.024874, 0, 0, 1, 1, 1,
-0.7975475, -0.2567576, -1.145232, 1, 0, 0, 1, 1,
-0.791704, -0.1579615, -2.345965, 1, 0, 0, 1, 1,
-0.7915287, -0.06711675, -2.820125, 1, 0, 0, 1, 1,
-0.7854916, 0.3050381, -1.095945, 1, 0, 0, 1, 1,
-0.7811393, -0.4393962, -1.124054, 1, 0, 0, 1, 1,
-0.7802942, -1.562531, -2.34183, 0, 0, 0, 1, 1,
-0.7796106, -0.3358665, -2.112733, 0, 0, 0, 1, 1,
-0.7746808, -0.2442196, -2.500419, 0, 0, 0, 1, 1,
-0.7740287, -0.7304209, -2.135641, 0, 0, 0, 1, 1,
-0.7698197, -0.689369, -1.336106, 0, 0, 0, 1, 1,
-0.7619486, 0.2326489, -1.989014, 0, 0, 0, 1, 1,
-0.7601606, 1.733985, -1.32337, 0, 0, 0, 1, 1,
-0.7582722, 2.273218, -0.1868297, 1, 1, 1, 1, 1,
-0.757304, 0.1157994, -0.6360804, 1, 1, 1, 1, 1,
-0.755499, -0.4149377, -1.738672, 1, 1, 1, 1, 1,
-0.7534122, -0.3174353, -1.931017, 1, 1, 1, 1, 1,
-0.7512853, -1.452295, -1.987003, 1, 1, 1, 1, 1,
-0.7464995, -0.03966079, -2.542007, 1, 1, 1, 1, 1,
-0.7378168, -0.08351546, -1.948129, 1, 1, 1, 1, 1,
-0.737597, -0.4615779, -4.086213, 1, 1, 1, 1, 1,
-0.7349417, -1.919121, -3.161581, 1, 1, 1, 1, 1,
-0.7143424, -0.08446714, -1.935536, 1, 1, 1, 1, 1,
-0.7114828, -0.6906377, -1.898253, 1, 1, 1, 1, 1,
-0.7114221, 0.07170109, -3.393239, 1, 1, 1, 1, 1,
-0.7082206, 0.6529611, 0.6870542, 1, 1, 1, 1, 1,
-0.7038038, -2.413148, -4.361533, 1, 1, 1, 1, 1,
-0.6964836, -2.900486, -2.606788, 1, 1, 1, 1, 1,
-0.694628, -1.479844, -2.757765, 0, 0, 1, 1, 1,
-0.693371, 0.1910076, -1.607783, 1, 0, 0, 1, 1,
-0.6927134, -1.103484, -6.218848, 1, 0, 0, 1, 1,
-0.6878687, 0.1718215, -2.189236, 1, 0, 0, 1, 1,
-0.6853795, 0.4944746, -1.206416, 1, 0, 0, 1, 1,
-0.6845884, 1.200242, -1.927597, 1, 0, 0, 1, 1,
-0.6768262, -0.5424047, -3.645073, 0, 0, 0, 1, 1,
-0.670026, -1.591255, -0.4608727, 0, 0, 0, 1, 1,
-0.6682823, -0.9914351, -2.210092, 0, 0, 0, 1, 1,
-0.6670918, -0.6118627, -2.068769, 0, 0, 0, 1, 1,
-0.664598, -1.513294, -1.830092, 0, 0, 0, 1, 1,
-0.658753, -0.09322938, -0.9925275, 0, 0, 0, 1, 1,
-0.6557855, -1.375244, -2.682433, 0, 0, 0, 1, 1,
-0.6468567, -2.187824, -3.644031, 1, 1, 1, 1, 1,
-0.6465985, -0.06004924, -2.837701, 1, 1, 1, 1, 1,
-0.6435276, -0.4389924, -2.646181, 1, 1, 1, 1, 1,
-0.6429635, -0.9794176, -3.862462, 1, 1, 1, 1, 1,
-0.6377347, 0.8272189, -2.128075, 1, 1, 1, 1, 1,
-0.6345112, 0.6166772, -0.9150438, 1, 1, 1, 1, 1,
-0.6315485, -1.277574, -1.514424, 1, 1, 1, 1, 1,
-0.6269168, 0.9621475, -0.7446488, 1, 1, 1, 1, 1,
-0.6243865, -0.01114964, -2.675452, 1, 1, 1, 1, 1,
-0.6181142, -0.2354442, -1.15423, 1, 1, 1, 1, 1,
-0.6162171, -0.9717956, -1.636802, 1, 1, 1, 1, 1,
-0.615952, -2.32988, -2.469827, 1, 1, 1, 1, 1,
-0.6125858, -0.67362, -2.162724, 1, 1, 1, 1, 1,
-0.6117114, -0.1684929, -1.083362, 1, 1, 1, 1, 1,
-0.6075063, 0.2590954, -1.057837, 1, 1, 1, 1, 1,
-0.6052004, -0.2781, -0.6900172, 0, 0, 1, 1, 1,
-0.6039638, -0.08930729, -2.733415, 1, 0, 0, 1, 1,
-0.5984512, 1.699475, -1.804807, 1, 0, 0, 1, 1,
-0.5958907, 0.2022111, -1.523779, 1, 0, 0, 1, 1,
-0.5958005, -0.6232535, -3.381782, 1, 0, 0, 1, 1,
-0.5894395, 0.2149421, -0.147352, 1, 0, 0, 1, 1,
-0.5893607, -0.8808169, -3.858772, 0, 0, 0, 1, 1,
-0.5872897, 0.2279192, -0.81828, 0, 0, 0, 1, 1,
-0.5838982, -0.8474805, -2.380785, 0, 0, 0, 1, 1,
-0.5787001, 0.7894459, -0.7923586, 0, 0, 0, 1, 1,
-0.5783108, 0.3213129, -1.284485, 0, 0, 0, 1, 1,
-0.577986, 0.07203798, -1.4102, 0, 0, 0, 1, 1,
-0.5762221, 1.080655, -0.1767687, 0, 0, 0, 1, 1,
-0.5751539, -1.170414, -2.350185, 1, 1, 1, 1, 1,
-0.5724468, 1.584364, 1.644285, 1, 1, 1, 1, 1,
-0.5704362, 0.9205466, 0.2062264, 1, 1, 1, 1, 1,
-0.5702688, 1.57478, -0.455602, 1, 1, 1, 1, 1,
-0.5625803, -1.330023, -2.545952, 1, 1, 1, 1, 1,
-0.5610226, 0.8201258, -0.6492161, 1, 1, 1, 1, 1,
-0.5600159, 0.7764205, 1.139281, 1, 1, 1, 1, 1,
-0.5545879, -0.6911111, -3.815236, 1, 1, 1, 1, 1,
-0.5519766, -0.8821048, -2.66742, 1, 1, 1, 1, 1,
-0.5433417, -0.1799143, -2.782839, 1, 1, 1, 1, 1,
-0.5427046, 0.4215391, 0.1664775, 1, 1, 1, 1, 1,
-0.5424496, -0.02642814, -0.8313707, 1, 1, 1, 1, 1,
-0.5415161, -0.701474, -4.667705, 1, 1, 1, 1, 1,
-0.5333795, -1.32197, -2.920923, 1, 1, 1, 1, 1,
-0.52166, 1.722581, -0.8113018, 1, 1, 1, 1, 1,
-0.5213994, -0.737408, -2.406688, 0, 0, 1, 1, 1,
-0.5210643, -0.924624, -1.417611, 1, 0, 0, 1, 1,
-0.5200763, 0.9307314, -1.602226, 1, 0, 0, 1, 1,
-0.5196977, -2.080389, -1.679003, 1, 0, 0, 1, 1,
-0.5176681, 0.2397157, -0.6031907, 1, 0, 0, 1, 1,
-0.5163748, 0.4523574, -0.8913755, 1, 0, 0, 1, 1,
-0.5150095, -1.164821, -2.55637, 0, 0, 0, 1, 1,
-0.5145928, 0.3662656, 0.0009054198, 0, 0, 0, 1, 1,
-0.5128494, -0.2640496, -1.583517, 0, 0, 0, 1, 1,
-0.5020707, 0.3779616, -0.8748556, 0, 0, 0, 1, 1,
-0.4978731, 0.9576293, -1.088565, 0, 0, 0, 1, 1,
-0.4937924, 0.2444705, -2.261717, 0, 0, 0, 1, 1,
-0.4912068, 0.9791019, -1.314846, 0, 0, 0, 1, 1,
-0.4904069, 1.704042, 0.605535, 1, 1, 1, 1, 1,
-0.4873356, -0.1932353, -2.959125, 1, 1, 1, 1, 1,
-0.4805959, 0.5146558, -0.4902616, 1, 1, 1, 1, 1,
-0.4786493, -0.4876791, -4.538907, 1, 1, 1, 1, 1,
-0.4786206, -0.9307889, -2.597594, 1, 1, 1, 1, 1,
-0.4759938, -0.9293994, -1.482811, 1, 1, 1, 1, 1,
-0.473471, 0.4923359, -0.4629637, 1, 1, 1, 1, 1,
-0.4723998, -1.121525, -1.47284, 1, 1, 1, 1, 1,
-0.468241, 0.2157044, -1.916326, 1, 1, 1, 1, 1,
-0.4662868, 1.046444, 2.964274, 1, 1, 1, 1, 1,
-0.4594881, -0.7604211, -2.848313, 1, 1, 1, 1, 1,
-0.4548765, 1.426634, -0.164154, 1, 1, 1, 1, 1,
-0.4544269, 0.967496, 0.3195054, 1, 1, 1, 1, 1,
-0.4474557, -0.8899296, -2.003938, 1, 1, 1, 1, 1,
-0.4467654, -0.5350749, -3.50824, 1, 1, 1, 1, 1,
-0.4436466, 0.7615385, -1.475749, 0, 0, 1, 1, 1,
-0.4416244, -0.7941767, -2.769855, 1, 0, 0, 1, 1,
-0.4407926, -0.3353663, -1.646407, 1, 0, 0, 1, 1,
-0.4401196, 2.065066, -1.335904, 1, 0, 0, 1, 1,
-0.4397382, 0.6290178, -1.342339, 1, 0, 0, 1, 1,
-0.4354875, -0.4189015, -3.409551, 1, 0, 0, 1, 1,
-0.4338512, -0.7759652, -2.557149, 0, 0, 0, 1, 1,
-0.4316947, 2.535153, -0.8670428, 0, 0, 0, 1, 1,
-0.4291354, 0.806941, -0.08424004, 0, 0, 0, 1, 1,
-0.4285645, 0.06599738, -1.517107, 0, 0, 0, 1, 1,
-0.428529, -0.6403082, -4.152141, 0, 0, 0, 1, 1,
-0.4262854, 2.399552, -0.4312591, 0, 0, 0, 1, 1,
-0.4246223, -0.6009281, -1.593959, 0, 0, 0, 1, 1,
-0.4218837, 2.767552, -0.6566307, 1, 1, 1, 1, 1,
-0.4154249, -1.493711, -1.900299, 1, 1, 1, 1, 1,
-0.4145293, 0.5275855, -0.5637382, 1, 1, 1, 1, 1,
-0.414005, 1.926358, -0.6759062, 1, 1, 1, 1, 1,
-0.4134752, 0.904039, 1.265031, 1, 1, 1, 1, 1,
-0.4116143, 0.8236738, 0.5951007, 1, 1, 1, 1, 1,
-0.4101954, -0.2088047, -1.638234, 1, 1, 1, 1, 1,
-0.4076877, 0.770907, -0.9190201, 1, 1, 1, 1, 1,
-0.4075218, 1.040681, -0.2873671, 1, 1, 1, 1, 1,
-0.4073652, -1.146428, -3.327499, 1, 1, 1, 1, 1,
-0.4073142, -1.396795, -5.036739, 1, 1, 1, 1, 1,
-0.4040331, -0.6031227, -2.265491, 1, 1, 1, 1, 1,
-0.4031883, 0.7912756, -0.7738153, 1, 1, 1, 1, 1,
-0.4005761, -0.4266459, -2.66349, 1, 1, 1, 1, 1,
-0.3946596, -0.9964094, -2.806501, 1, 1, 1, 1, 1,
-0.3942244, 0.0427845, -0.1528516, 0, 0, 1, 1, 1,
-0.3832117, -1.047812, -2.329145, 1, 0, 0, 1, 1,
-0.3825781, -0.2209763, -2.151557, 1, 0, 0, 1, 1,
-0.3792051, 0.09471793, -0.2174538, 1, 0, 0, 1, 1,
-0.3780867, -0.001777619, -2.09288, 1, 0, 0, 1, 1,
-0.3770753, -0.7361869, -1.330828, 1, 0, 0, 1, 1,
-0.3756776, -0.9729193, -1.848117, 0, 0, 0, 1, 1,
-0.375486, 1.539724, 0.1028523, 0, 0, 0, 1, 1,
-0.3731677, -0.9483647, -2.417423, 0, 0, 0, 1, 1,
-0.3729701, 0.03519496, -2.043679, 0, 0, 0, 1, 1,
-0.370817, -0.4049797, -2.949015, 0, 0, 0, 1, 1,
-0.3675218, 1.692923, -1.360123, 0, 0, 0, 1, 1,
-0.3659791, -0.8123864, -4.037038, 0, 0, 0, 1, 1,
-0.3640568, -1.990614, -2.857844, 1, 1, 1, 1, 1,
-0.3598998, -0.9165925, -1.063734, 1, 1, 1, 1, 1,
-0.3585119, 1.065883, -2.1076, 1, 1, 1, 1, 1,
-0.3577358, -3.605487, -3.854005, 1, 1, 1, 1, 1,
-0.3558017, 0.5512114, -1.267004, 1, 1, 1, 1, 1,
-0.352945, 0.7294483, -0.2812381, 1, 1, 1, 1, 1,
-0.3515422, 0.9956813, -0.6153626, 1, 1, 1, 1, 1,
-0.3396084, -1.377559, -3.381651, 1, 1, 1, 1, 1,
-0.3314876, -1.159114, -2.814509, 1, 1, 1, 1, 1,
-0.3309294, -0.2687773, -2.630372, 1, 1, 1, 1, 1,
-0.3299002, -0.07723633, -1.167738, 1, 1, 1, 1, 1,
-0.3285743, 0.8575046, -0.5016547, 1, 1, 1, 1, 1,
-0.3224112, 0.7612308, -1.481788, 1, 1, 1, 1, 1,
-0.3151791, 0.7354069, -0.3659906, 1, 1, 1, 1, 1,
-0.312635, 0.5753456, -0.2326214, 1, 1, 1, 1, 1,
-0.312164, 0.2435692, -0.1119551, 0, 0, 1, 1, 1,
-0.3111452, -2.166722, -2.460485, 1, 0, 0, 1, 1,
-0.3048607, -1.019376, -3.474618, 1, 0, 0, 1, 1,
-0.3045184, -0.5688339, -2.040978, 1, 0, 0, 1, 1,
-0.3027509, 0.4522163, 0.2752798, 1, 0, 0, 1, 1,
-0.300971, -1.224323, -3.008271, 1, 0, 0, 1, 1,
-0.2981298, -2.340544, -3.187306, 0, 0, 0, 1, 1,
-0.2975377, 0.2934746, -0.6140072, 0, 0, 0, 1, 1,
-0.2870298, 0.7278408, -0.6770703, 0, 0, 0, 1, 1,
-0.2865494, -1.398196, -3.584851, 0, 0, 0, 1, 1,
-0.2846107, 0.7911269, -0.5253406, 0, 0, 0, 1, 1,
-0.2754306, -0.3803478, -2.66644, 0, 0, 0, 1, 1,
-0.2748375, -0.3102533, -2.28107, 0, 0, 0, 1, 1,
-0.2734639, 1.06081, -1.187184, 1, 1, 1, 1, 1,
-0.2709042, -1.507293, -2.957049, 1, 1, 1, 1, 1,
-0.2699438, 0.7150761, 0.6299238, 1, 1, 1, 1, 1,
-0.2657775, 0.1027445, -1.617823, 1, 1, 1, 1, 1,
-0.264255, 0.115824, 0.9191175, 1, 1, 1, 1, 1,
-0.2626392, 0.06579324, -3.819979, 1, 1, 1, 1, 1,
-0.2621562, -0.714753, -3.649786, 1, 1, 1, 1, 1,
-0.2566362, 1.598107, -0.2544627, 1, 1, 1, 1, 1,
-0.255825, 1.049429, -0.5310566, 1, 1, 1, 1, 1,
-0.2537497, -0.7762023, -3.102938, 1, 1, 1, 1, 1,
-0.2521086, 0.8671916, -0.9347353, 1, 1, 1, 1, 1,
-0.2503005, -0.8506973, -3.902837, 1, 1, 1, 1, 1,
-0.2438719, 0.6131931, 0.2457191, 1, 1, 1, 1, 1,
-0.2436846, -0.05876758, -0.5762999, 1, 1, 1, 1, 1,
-0.2434243, 1.028131, 0.9843931, 1, 1, 1, 1, 1,
-0.2347907, 0.4051105, -1.440391, 0, 0, 1, 1, 1,
-0.2346207, -3.060788, -4.488617, 1, 0, 0, 1, 1,
-0.2342949, 0.5973914, 1.052028, 1, 0, 0, 1, 1,
-0.234043, 1.35474, -0.2037972, 1, 0, 0, 1, 1,
-0.2336642, -0.6924306, -3.669111, 1, 0, 0, 1, 1,
-0.2332705, 0.2722768, 0.735339, 1, 0, 0, 1, 1,
-0.2270303, -0.107409, -3.327096, 0, 0, 0, 1, 1,
-0.2267212, 1.925644, -0.7223515, 0, 0, 0, 1, 1,
-0.226716, -0.7427077, -2.077292, 0, 0, 0, 1, 1,
-0.2220078, 0.06523351, -1.780044, 0, 0, 0, 1, 1,
-0.221145, 2.588688, -1.204232, 0, 0, 0, 1, 1,
-0.2196121, -0.1911795, -1.509379, 0, 0, 0, 1, 1,
-0.2195508, -0.8775473, -3.155348, 0, 0, 0, 1, 1,
-0.2132933, -0.03331539, -0.6888152, 1, 1, 1, 1, 1,
-0.2126344, 0.7631902, 1.299132, 1, 1, 1, 1, 1,
-0.2124864, 0.3718214, -3.461782, 1, 1, 1, 1, 1,
-0.2119908, 1.670543, -1.508259, 1, 1, 1, 1, 1,
-0.2031864, 0.05069251, -1.139851, 1, 1, 1, 1, 1,
-0.2000715, -0.4656326, -4.096293, 1, 1, 1, 1, 1,
-0.1995663, -1.103686, -3.213905, 1, 1, 1, 1, 1,
-0.1984511, 0.7009268, -1.315892, 1, 1, 1, 1, 1,
-0.1960118, -0.880733, -3.276954, 1, 1, 1, 1, 1,
-0.1928683, 0.3117194, -1.930393, 1, 1, 1, 1, 1,
-0.191697, -0.2360669, -1.486869, 1, 1, 1, 1, 1,
-0.1904052, 0.9313223, -2.207253, 1, 1, 1, 1, 1,
-0.1859241, -1.018713, -1.420185, 1, 1, 1, 1, 1,
-0.1838141, 1.145834, -0.7978828, 1, 1, 1, 1, 1,
-0.1831815, -0.7541062, -4.136507, 1, 1, 1, 1, 1,
-0.1797878, -0.4680123, -3.124673, 0, 0, 1, 1, 1,
-0.17939, -0.7645826, -1.666076, 1, 0, 0, 1, 1,
-0.1748147, 1.473252, -0.7087739, 1, 0, 0, 1, 1,
-0.1733461, -1.260654, -3.892668, 1, 0, 0, 1, 1,
-0.1711709, 0.4256299, -0.06981932, 1, 0, 0, 1, 1,
-0.1675221, 0.1637252, -1.981029, 1, 0, 0, 1, 1,
-0.1668836, 2.076816, -1.133109, 0, 0, 0, 1, 1,
-0.164966, -1.066902, -1.20147, 0, 0, 0, 1, 1,
-0.1625965, 0.8716682, 1.299533, 0, 0, 0, 1, 1,
-0.1568712, -0.2703853, -3.249323, 0, 0, 0, 1, 1,
-0.1561848, 0.045943, -0.8662485, 0, 0, 0, 1, 1,
-0.1543216, -0.02276646, -2.126438, 0, 0, 0, 1, 1,
-0.1542934, 0.3656693, -0.853538, 0, 0, 0, 1, 1,
-0.1484549, 1.705747, 0.6573853, 1, 1, 1, 1, 1,
-0.1458298, -0.1931897, -3.691018, 1, 1, 1, 1, 1,
-0.1444631, 0.08152688, -1.451851, 1, 1, 1, 1, 1,
-0.1388694, 0.8567644, -0.2008863, 1, 1, 1, 1, 1,
-0.1351682, 2.014579, 0.1221312, 1, 1, 1, 1, 1,
-0.1292271, 1.115364, 0.8340769, 1, 1, 1, 1, 1,
-0.1290834, -1.000275, -3.114034, 1, 1, 1, 1, 1,
-0.1174469, 1.292372, 0.1715361, 1, 1, 1, 1, 1,
-0.1169033, -0.008462267, -0.6483089, 1, 1, 1, 1, 1,
-0.1162175, -0.7658715, -2.65227, 1, 1, 1, 1, 1,
-0.1131773, 0.1383988, 0.3040443, 1, 1, 1, 1, 1,
-0.1104748, -0.5971491, -1.691728, 1, 1, 1, 1, 1,
-0.1086807, -1.241323, -3.620894, 1, 1, 1, 1, 1,
-0.1058322, 0.7248916, -0.1175417, 1, 1, 1, 1, 1,
-0.1033242, -0.4356291, -0.9350007, 1, 1, 1, 1, 1,
-0.1032012, -0.07651602, -2.344186, 0, 0, 1, 1, 1,
-0.09688804, 0.1929204, -0.3523487, 1, 0, 0, 1, 1,
-0.09240834, 0.5104257, 0.4232372, 1, 0, 0, 1, 1,
-0.09006957, 0.01494466, -2.649145, 1, 0, 0, 1, 1,
-0.08998644, -0.4478138, -2.763176, 1, 0, 0, 1, 1,
-0.08928382, -0.2599317, -2.343509, 1, 0, 0, 1, 1,
-0.08251957, 0.9859933, 1.053403, 0, 0, 0, 1, 1,
-0.08204894, -1.457338, -3.778415, 0, 0, 0, 1, 1,
-0.08131366, -0.3159869, -3.779332, 0, 0, 0, 1, 1,
-0.08087322, 0.4631191, -0.1634014, 0, 0, 0, 1, 1,
-0.08029803, 0.06369174, 1.170331, 0, 0, 0, 1, 1,
-0.07566828, 1.132388, 0.5033288, 0, 0, 0, 1, 1,
-0.07310316, -0.2158183, -1.881352, 0, 0, 0, 1, 1,
-0.07252304, 1.398009, -1.565093, 1, 1, 1, 1, 1,
-0.0717693, -0.5800552, -1.935877, 1, 1, 1, 1, 1,
-0.07154976, -0.1044821, -2.153599, 1, 1, 1, 1, 1,
-0.06921696, 0.1891769, 0.6098364, 1, 1, 1, 1, 1,
-0.06899386, 1.418507, 0.3160645, 1, 1, 1, 1, 1,
-0.06713594, 0.6009172, -0.4702972, 1, 1, 1, 1, 1,
-0.06712393, -0.1495776, -2.289698, 1, 1, 1, 1, 1,
-0.0651581, 0.4231666, -1.471743, 1, 1, 1, 1, 1,
-0.0640215, 0.4668778, 0.1894525, 1, 1, 1, 1, 1,
-0.05767073, 0.1634564, 0.1222291, 1, 1, 1, 1, 1,
-0.05747449, 0.918786, 0.6165057, 1, 1, 1, 1, 1,
-0.05692113, -0.4455706, -3.354738, 1, 1, 1, 1, 1,
-0.04987452, -0.09376858, -1.521646, 1, 1, 1, 1, 1,
-0.04885557, 1.03742, -0.141958, 1, 1, 1, 1, 1,
-0.04615638, -0.2230573, -2.501584, 1, 1, 1, 1, 1,
-0.04521634, -1.931525, -2.259076, 0, 0, 1, 1, 1,
-0.03956504, -0.7314106, -2.614044, 1, 0, 0, 1, 1,
-0.03800485, -0.5780094, -3.359956, 1, 0, 0, 1, 1,
-0.0247883, 0.5583335, 0.3220506, 1, 0, 0, 1, 1,
-0.02372179, 0.3267072, 1.025809, 1, 0, 0, 1, 1,
-0.02118972, 1.342716, -0.5668675, 1, 0, 0, 1, 1,
-0.01869144, 1.449679, 0.9660143, 0, 0, 0, 1, 1,
-0.01824715, -0.4783311, -2.15839, 0, 0, 0, 1, 1,
-0.0165393, -0.6313092, -2.743482, 0, 0, 0, 1, 1,
-0.0156932, -0.0007805313, 0.5399233, 0, 0, 0, 1, 1,
-0.01482327, 0.9781892, 1.684778, 0, 0, 0, 1, 1,
-0.01382849, -1.159001, -1.340931, 0, 0, 0, 1, 1,
-0.01288184, 0.2854033, -2.03528, 0, 0, 0, 1, 1,
-0.01126236, 0.2319793, 0.125288, 1, 1, 1, 1, 1,
-0.009843549, -0.2542918, -0.8985326, 1, 1, 1, 1, 1,
-0.008200918, 0.7877715, 0.7600903, 1, 1, 1, 1, 1,
-0.005746945, 1.458634, 1.232409, 1, 1, 1, 1, 1,
-0.004665832, 0.3560715, -0.111215, 1, 1, 1, 1, 1,
-0.002915978, -0.7995011, -2.198728, 1, 1, 1, 1, 1,
0.004144899, -0.6559778, 2.871644, 1, 1, 1, 1, 1,
0.00503604, -1.256364, 3.036675, 1, 1, 1, 1, 1,
0.005087143, -0.3340367, 0.5479628, 1, 1, 1, 1, 1,
0.01043688, 2.086948, -1.40348, 1, 1, 1, 1, 1,
0.01221141, -0.4661787, 2.509191, 1, 1, 1, 1, 1,
0.0137806, 0.9320071, -0.2285503, 1, 1, 1, 1, 1,
0.01658101, -1.117972, 2.854891, 1, 1, 1, 1, 1,
0.01807627, 0.7462199, -0.8590757, 1, 1, 1, 1, 1,
0.02092541, -0.2009256, 1.727295, 1, 1, 1, 1, 1,
0.02213283, -0.7234814, 2.085386, 0, 0, 1, 1, 1,
0.02293686, -1.655699, 3.507712, 1, 0, 0, 1, 1,
0.02448863, 1.770156, -0.1680972, 1, 0, 0, 1, 1,
0.0254327, 0.3835148, 0.5444679, 1, 0, 0, 1, 1,
0.0265383, 0.3787914, 0.2288043, 1, 0, 0, 1, 1,
0.02831993, 1.305923, 0.3133089, 1, 0, 0, 1, 1,
0.0308457, 1.082349, 1.116488, 0, 0, 0, 1, 1,
0.03245357, -0.8883421, 4.750727, 0, 0, 0, 1, 1,
0.03581181, -0.2293601, 2.024397, 0, 0, 0, 1, 1,
0.03679176, -0.5138445, 2.666253, 0, 0, 0, 1, 1,
0.03792065, -0.7005717, 2.176829, 0, 0, 0, 1, 1,
0.03945526, -0.3145926, 4.625405, 0, 0, 0, 1, 1,
0.04346612, -1.757353, 2.28548, 0, 0, 0, 1, 1,
0.04411867, 0.5687582, -0.9377311, 1, 1, 1, 1, 1,
0.04682293, 2.230121, 1.043525, 1, 1, 1, 1, 1,
0.06163103, -1.197578, 3.251383, 1, 1, 1, 1, 1,
0.0624187, -1.406118, 1.99183, 1, 1, 1, 1, 1,
0.06274672, -0.2721813, 4.307772, 1, 1, 1, 1, 1,
0.06337783, 0.9583728, 0.2073126, 1, 1, 1, 1, 1,
0.06411701, 0.6959127, 1.557935, 1, 1, 1, 1, 1,
0.06941772, 1.02033, -0.2000053, 1, 1, 1, 1, 1,
0.07074083, 0.1281154, 1.849552, 1, 1, 1, 1, 1,
0.0712039, 0.6615758, -0.6479282, 1, 1, 1, 1, 1,
0.07366756, 0.7030404, -0.3981326, 1, 1, 1, 1, 1,
0.08686111, 1.061409, 0.6455134, 1, 1, 1, 1, 1,
0.09072521, 0.9937546, 1.331612, 1, 1, 1, 1, 1,
0.09956318, 3.106421, -0.90753, 1, 1, 1, 1, 1,
0.1080198, -1.237932, 2.91768, 1, 1, 1, 1, 1,
0.1086236, -0.8162965, 5.869712, 0, 0, 1, 1, 1,
0.1133066, 1.093822, -0.3458705, 1, 0, 0, 1, 1,
0.1140558, -1.286344, 3.215596, 1, 0, 0, 1, 1,
0.1189112, -2.402449, 2.734052, 1, 0, 0, 1, 1,
0.1210623, -0.139657, 2.478245, 1, 0, 0, 1, 1,
0.1223002, 0.2824565, 0.8568116, 1, 0, 0, 1, 1,
0.1262612, 0.6738625, -1.803053, 0, 0, 0, 1, 1,
0.127594, 0.527278, -2.103083, 0, 0, 0, 1, 1,
0.1282283, 0.4755546, -0.5548093, 0, 0, 0, 1, 1,
0.129326, 1.392092, -1.57482, 0, 0, 0, 1, 1,
0.1329669, 0.5063063, -0.4111275, 0, 0, 0, 1, 1,
0.1330449, -0.3807867, 2.644946, 0, 0, 0, 1, 1,
0.1335605, 1.082105, 0.706665, 0, 0, 0, 1, 1,
0.1364296, -0.9722822, 0.929244, 1, 1, 1, 1, 1,
0.1404055, 0.460219, -0.5327612, 1, 1, 1, 1, 1,
0.1415163, 0.7619438, 0.06681768, 1, 1, 1, 1, 1,
0.1421598, 0.3610079, 2.012861, 1, 1, 1, 1, 1,
0.1427119, 1.647748, -0.4580217, 1, 1, 1, 1, 1,
0.1473674, 0.4494701, -1.535745, 1, 1, 1, 1, 1,
0.1481275, -0.6002907, 3.420594, 1, 1, 1, 1, 1,
0.1527032, -0.7429762, 1.990598, 1, 1, 1, 1, 1,
0.1529604, -0.1655656, 4.125458, 1, 1, 1, 1, 1,
0.1565286, -0.2453999, 2.483602, 1, 1, 1, 1, 1,
0.162648, 2.606307, -0.5101114, 1, 1, 1, 1, 1,
0.1650601, 0.1400862, 1.64816, 1, 1, 1, 1, 1,
0.1660619, 0.3339236, -0.6743819, 1, 1, 1, 1, 1,
0.1713678, 0.4642158, 0.6344374, 1, 1, 1, 1, 1,
0.1808205, 0.6220939, -0.3675743, 1, 1, 1, 1, 1,
0.181107, 0.2600233, -0.7303683, 0, 0, 1, 1, 1,
0.181384, 0.4981444, -0.02306854, 1, 0, 0, 1, 1,
0.1820017, 0.1498083, 0.2400467, 1, 0, 0, 1, 1,
0.1823949, -0.1454218, 1.82566, 1, 0, 0, 1, 1,
0.184424, 0.2804744, -1.479925, 1, 0, 0, 1, 1,
0.1849448, 0.8842141, 0.6057877, 1, 0, 0, 1, 1,
0.1860943, 1.043038, -0.2022593, 0, 0, 0, 1, 1,
0.1876534, -1.165527, 1.474855, 0, 0, 0, 1, 1,
0.1878224, -0.7743078, 0.8152483, 0, 0, 0, 1, 1,
0.1879468, 1.027686, 0.6556857, 0, 0, 0, 1, 1,
0.1959194, -0.05411005, 0.8229526, 0, 0, 0, 1, 1,
0.1968116, -0.9557881, 0.2735292, 0, 0, 0, 1, 1,
0.2022464, -1.694029, 1.915163, 0, 0, 0, 1, 1,
0.2035152, -1.715939, 1.447969, 1, 1, 1, 1, 1,
0.2045241, 0.7032402, 0.2140016, 1, 1, 1, 1, 1,
0.2050424, -0.2514114, 1.975956, 1, 1, 1, 1, 1,
0.2051029, 1.664601, 0.6192012, 1, 1, 1, 1, 1,
0.2056397, -2.112137, 3.206823, 1, 1, 1, 1, 1,
0.2132232, 0.03823638, 0.817652, 1, 1, 1, 1, 1,
0.2143885, -0.03175404, 0.4750344, 1, 1, 1, 1, 1,
0.2226886, -0.7854427, 2.310374, 1, 1, 1, 1, 1,
0.2228684, 0.7692723, 1.121199, 1, 1, 1, 1, 1,
0.2252124, -1.088361, 3.264446, 1, 1, 1, 1, 1,
0.2260158, 1.438044, -0.6878176, 1, 1, 1, 1, 1,
0.2275271, 0.7363657, 1.282191, 1, 1, 1, 1, 1,
0.2276992, -0.9549047, 4.43392, 1, 1, 1, 1, 1,
0.2331596, 0.3840044, 0.05092977, 1, 1, 1, 1, 1,
0.2341001, -0.484226, 1.370141, 1, 1, 1, 1, 1,
0.2375292, 0.8220413, -1.018133, 0, 0, 1, 1, 1,
0.2447765, 0.4283324, -0.3653671, 1, 0, 0, 1, 1,
0.2501981, 0.5531172, 0.5829189, 1, 0, 0, 1, 1,
0.2551891, 0.2711127, 2.321337, 1, 0, 0, 1, 1,
0.2556311, 0.3030522, -0.8167008, 1, 0, 0, 1, 1,
0.2584628, 2.042889, 0.7367408, 1, 0, 0, 1, 1,
0.2588026, 0.9599667, 1.002334, 0, 0, 0, 1, 1,
0.2589397, 0.6180932, -0.04474739, 0, 0, 0, 1, 1,
0.261602, -0.5271701, 4.472023, 0, 0, 0, 1, 1,
0.2666961, -1.711777, 3.532155, 0, 0, 0, 1, 1,
0.267132, -0.2868801, 1.927837, 0, 0, 0, 1, 1,
0.2675512, -0.6602126, 3.370113, 0, 0, 0, 1, 1,
0.272735, 1.166424, 1.654316, 0, 0, 0, 1, 1,
0.2744109, -0.3071899, 3.553684, 1, 1, 1, 1, 1,
0.2747701, 0.3274937, 1.395858, 1, 1, 1, 1, 1,
0.2751957, -0.363318, 4.149881, 1, 1, 1, 1, 1,
0.2762831, 1.550282, -0.9111857, 1, 1, 1, 1, 1,
0.2788697, -1.070966, 2.165252, 1, 1, 1, 1, 1,
0.2807378, 0.1067512, 2.490914, 1, 1, 1, 1, 1,
0.2828809, -3.153506, 3.548603, 1, 1, 1, 1, 1,
0.2872646, 0.01337683, 0.2779115, 1, 1, 1, 1, 1,
0.2912631, 1.149462, 0.1111202, 1, 1, 1, 1, 1,
0.2936378, -0.9583085, 3.802596, 1, 1, 1, 1, 1,
0.2951961, 0.2730935, 2.013803, 1, 1, 1, 1, 1,
0.295529, -2.250093, 5.398625, 1, 1, 1, 1, 1,
0.2958637, 1.837751, -1.652825, 1, 1, 1, 1, 1,
0.2967616, -0.9108433, 4.168186, 1, 1, 1, 1, 1,
0.3014967, -0.8253832, 4.981776, 1, 1, 1, 1, 1,
0.3033407, 1.458979, -1.517039, 0, 0, 1, 1, 1,
0.305096, -0.9648687, 3.043221, 1, 0, 0, 1, 1,
0.3066619, 0.1392964, 1.470164, 1, 0, 0, 1, 1,
0.3077377, -0.9327129, 3.013521, 1, 0, 0, 1, 1,
0.3078331, -1.334388, 4.444186, 1, 0, 0, 1, 1,
0.3125032, 1.435242, -0.625034, 1, 0, 0, 1, 1,
0.3151209, 1.054019, 1.351361, 0, 0, 0, 1, 1,
0.3202739, 0.2297537, 1.643923, 0, 0, 0, 1, 1,
0.3209906, 0.201904, 0.7881554, 0, 0, 0, 1, 1,
0.3220018, 0.1384002, 0.7899806, 0, 0, 0, 1, 1,
0.3360091, -1.737832, 2.031915, 0, 0, 0, 1, 1,
0.3386089, -0.3411925, 1.588254, 0, 0, 0, 1, 1,
0.3390167, -0.7472945, 2.12961, 0, 0, 0, 1, 1,
0.3410297, -0.5517217, 2.128249, 1, 1, 1, 1, 1,
0.3461441, 1.308197, 0.004606498, 1, 1, 1, 1, 1,
0.3535215, 0.5463163, 1.591432, 1, 1, 1, 1, 1,
0.3627928, -1.516773, 2.091735, 1, 1, 1, 1, 1,
0.3631903, 0.6151335, 0.2444539, 1, 1, 1, 1, 1,
0.3714468, 0.6828048, 0.7970058, 1, 1, 1, 1, 1,
0.3719927, 0.134153, 1.195329, 1, 1, 1, 1, 1,
0.372732, -1.195243, 3.009204, 1, 1, 1, 1, 1,
0.3732747, 0.5397263, -0.1014476, 1, 1, 1, 1, 1,
0.3737302, 0.1696455, 0.970089, 1, 1, 1, 1, 1,
0.3769208, -0.2678509, 2.524149, 1, 1, 1, 1, 1,
0.3806615, 1.619538, 0.5094808, 1, 1, 1, 1, 1,
0.3843153, -1.952347, 2.618835, 1, 1, 1, 1, 1,
0.3863225, 0.3352458, 2.024678, 1, 1, 1, 1, 1,
0.3927481, 0.6672552, -0.1946263, 1, 1, 1, 1, 1,
0.393074, 0.04537139, 3.009928, 0, 0, 1, 1, 1,
0.3971458, 0.3671724, -0.1981684, 1, 0, 0, 1, 1,
0.3997504, 1.341372, -0.1760545, 1, 0, 0, 1, 1,
0.4037823, -0.007767767, 0.6792086, 1, 0, 0, 1, 1,
0.4062193, -0.9647315, 3.61583, 1, 0, 0, 1, 1,
0.4093616, -0.1942096, 3.640971, 1, 0, 0, 1, 1,
0.4111471, -0.2868395, 2.330329, 0, 0, 0, 1, 1,
0.4113073, -0.3159089, 1.691344, 0, 0, 0, 1, 1,
0.4175524, -0.4424658, 3.533099, 0, 0, 0, 1, 1,
0.4245298, -0.9140821, 2.710547, 0, 0, 0, 1, 1,
0.4249084, -1.107775, 3.207996, 0, 0, 0, 1, 1,
0.42805, -0.7335923, 2.261242, 0, 0, 0, 1, 1,
0.4336808, -0.6100061, 1.944544, 0, 0, 0, 1, 1,
0.4342815, 1.67848, -1.243995, 1, 1, 1, 1, 1,
0.4375117, -0.6739106, 2.190159, 1, 1, 1, 1, 1,
0.4402515, -0.2691739, 2.501727, 1, 1, 1, 1, 1,
0.4458497, -0.7955648, 2.79964, 1, 1, 1, 1, 1,
0.4487203, -0.1188935, -0.05830003, 1, 1, 1, 1, 1,
0.4534296, -3.015718, 1.900143, 1, 1, 1, 1, 1,
0.4543892, 0.4822595, 1.03575, 1, 1, 1, 1, 1,
0.4562961, 0.04232477, -0.02674769, 1, 1, 1, 1, 1,
0.45954, 1.089083, 0.5329983, 1, 1, 1, 1, 1,
0.4620655, -0.1592425, 2.217672, 1, 1, 1, 1, 1,
0.4633143, -0.8927306, 3.213796, 1, 1, 1, 1, 1,
0.4685047, 1.993572, 0.9284114, 1, 1, 1, 1, 1,
0.4693947, -0.3798226, 3.036167, 1, 1, 1, 1, 1,
0.4775783, -0.1235812, 1.953955, 1, 1, 1, 1, 1,
0.4799494, 1.189486, 0.9953941, 1, 1, 1, 1, 1,
0.4803317, -0.4195541, 1.622646, 0, 0, 1, 1, 1,
0.4813448, 0.9365514, 1.963413, 1, 0, 0, 1, 1,
0.4824403, 0.6781546, -2.038848, 1, 0, 0, 1, 1,
0.484362, 1.55994, 1.253029, 1, 0, 0, 1, 1,
0.4849999, -0.920196, 3.680623, 1, 0, 0, 1, 1,
0.4862305, 0.1723538, 1.017437, 1, 0, 0, 1, 1,
0.4904615, -0.06517, 0.4192414, 0, 0, 0, 1, 1,
0.4905002, -1.579232, 2.686534, 0, 0, 0, 1, 1,
0.4919688, -0.3920181, 0.9971882, 0, 0, 0, 1, 1,
0.4921008, -1.208232, 1.817376, 0, 0, 0, 1, 1,
0.4927795, -0.425777, 2.431387, 0, 0, 0, 1, 1,
0.4945219, 1.644951, 0.6487103, 0, 0, 0, 1, 1,
0.499356, -0.06174747, 1.562433, 0, 0, 0, 1, 1,
0.5054268, -0.1982583, 0.8270501, 1, 1, 1, 1, 1,
0.5086362, 1.176869, 1.546567, 1, 1, 1, 1, 1,
0.5117718, 2.214485, 2.339041, 1, 1, 1, 1, 1,
0.5121036, 0.03909712, 1.179918, 1, 1, 1, 1, 1,
0.5218486, 0.9043404, -0.03232072, 1, 1, 1, 1, 1,
0.5245374, 0.6173164, 0.8364645, 1, 1, 1, 1, 1,
0.5307158, -1.093951, 1.936403, 1, 1, 1, 1, 1,
0.5333409, 0.8411078, 0.7840239, 1, 1, 1, 1, 1,
0.5346739, 0.09475872, 0.9601472, 1, 1, 1, 1, 1,
0.5347666, -0.6503721, 3.641634, 1, 1, 1, 1, 1,
0.5368092, -1.38782, 2.0888, 1, 1, 1, 1, 1,
0.5368248, -0.5424098, 2.23383, 1, 1, 1, 1, 1,
0.5425961, 1.587939, 1.731358, 1, 1, 1, 1, 1,
0.542603, -0.07388145, 1.698601, 1, 1, 1, 1, 1,
0.5462911, 1.244274, -0.7405365, 1, 1, 1, 1, 1,
0.5537164, -1.813111, 2.047294, 0, 0, 1, 1, 1,
0.5556282, 2.007046, -0.01503173, 1, 0, 0, 1, 1,
0.5573677, -1.28616, 3.364036, 1, 0, 0, 1, 1,
0.5602851, -0.2193151, 1.049671, 1, 0, 0, 1, 1,
0.5629304, 0.2130725, 1.23282, 1, 0, 0, 1, 1,
0.5644167, -0.4205487, 1.420914, 1, 0, 0, 1, 1,
0.5677956, -1.100246, 3.163046, 0, 0, 0, 1, 1,
0.5705117, -0.6334312, 2.863732, 0, 0, 0, 1, 1,
0.5707877, 0.5566405, 0.6806923, 0, 0, 0, 1, 1,
0.5725119, -0.3618308, 1.709423, 0, 0, 0, 1, 1,
0.5749001, 0.9480909, 0.5531651, 0, 0, 0, 1, 1,
0.5786889, 0.5103826, -1.24903, 0, 0, 0, 1, 1,
0.5789347, -0.5378939, 1.961965, 0, 0, 0, 1, 1,
0.5931525, 0.6081206, 0.3455192, 1, 1, 1, 1, 1,
0.5957047, 0.3358093, 0.561271, 1, 1, 1, 1, 1,
0.6049981, -0.6166736, 1.686238, 1, 1, 1, 1, 1,
0.6054937, 0.4436608, 1.193442, 1, 1, 1, 1, 1,
0.6059492, -1.137664, 4.036302, 1, 1, 1, 1, 1,
0.6076174, 1.21345, 0.6234109, 1, 1, 1, 1, 1,
0.6110747, -0.3928733, 2.518391, 1, 1, 1, 1, 1,
0.6164858, 0.6469992, -0.1783093, 1, 1, 1, 1, 1,
0.6210738, 0.5129433, 1.13876, 1, 1, 1, 1, 1,
0.6220283, 0.3372307, 0.7960678, 1, 1, 1, 1, 1,
0.6226966, -0.3606628, 2.523535, 1, 1, 1, 1, 1,
0.6244657, -0.5309601, 1.968445, 1, 1, 1, 1, 1,
0.6263805, 1.057915, -1.53486, 1, 1, 1, 1, 1,
0.6274599, -0.174675, 2.036809, 1, 1, 1, 1, 1,
0.6302924, -0.2970308, 4.258973, 1, 1, 1, 1, 1,
0.6332749, 0.5524323, -1.224367, 0, 0, 1, 1, 1,
0.6334012, -0.9541251, 2.637058, 1, 0, 0, 1, 1,
0.6362959, -0.3683247, 2.450462, 1, 0, 0, 1, 1,
0.6401407, -0.4261054, 1.172664, 1, 0, 0, 1, 1,
0.6420362, 0.8474663, 0.9762704, 1, 0, 0, 1, 1,
0.6459406, -2.475166, 3.620828, 1, 0, 0, 1, 1,
0.6477404, -0.6328081, 3.005003, 0, 0, 0, 1, 1,
0.6484824, -1.31719, 1.559462, 0, 0, 0, 1, 1,
0.6526726, 1.359142, 0.4759693, 0, 0, 0, 1, 1,
0.6615729, 0.5791128, 1.206858, 0, 0, 0, 1, 1,
0.6623575, 0.6525444, 1.295659, 0, 0, 0, 1, 1,
0.665897, 0.18941, -1.134199, 0, 0, 0, 1, 1,
0.6699112, -1.094185, 4.086029, 0, 0, 0, 1, 1,
0.6699632, 2.0079, 0.4918073, 1, 1, 1, 1, 1,
0.6742129, -0.1965869, 2.992999, 1, 1, 1, 1, 1,
0.6806476, 0.3202662, 0.8861832, 1, 1, 1, 1, 1,
0.6856164, 0.5153063, 0.8058408, 1, 1, 1, 1, 1,
0.6932056, -0.7768628, 1.350776, 1, 1, 1, 1, 1,
0.6945191, -1.107721, 3.278639, 1, 1, 1, 1, 1,
0.6962171, -0.9337986, 5.386854, 1, 1, 1, 1, 1,
0.6984205, -0.4757759, 2.548181, 1, 1, 1, 1, 1,
0.7017865, -0.6042225, 1.392746, 1, 1, 1, 1, 1,
0.709209, 0.3523494, 0.2065451, 1, 1, 1, 1, 1,
0.7146452, -0.6738879, 3.544075, 1, 1, 1, 1, 1,
0.7171156, -0.8658166, 3.642384, 1, 1, 1, 1, 1,
0.7246215, -0.01101019, 1.110498, 1, 1, 1, 1, 1,
0.7277477, -1.154834, 2.644717, 1, 1, 1, 1, 1,
0.7303144, 1.06696, 0.2796306, 1, 1, 1, 1, 1,
0.7354422, -0.7490121, 4.324989, 0, 0, 1, 1, 1,
0.7356116, 1.165209, -0.6370387, 1, 0, 0, 1, 1,
0.7367914, 0.4548483, 0.06827227, 1, 0, 0, 1, 1,
0.7448526, -0.1375435, 1.319834, 1, 0, 0, 1, 1,
0.7465779, 0.03379564, 2.06203, 1, 0, 0, 1, 1,
0.7481052, 0.5116273, 1.257939, 1, 0, 0, 1, 1,
0.7499208, 0.1683962, 1.546342, 0, 0, 0, 1, 1,
0.7512728, 0.2133382, 2.022469, 0, 0, 0, 1, 1,
0.7570492, 0.1272683, 3.062417, 0, 0, 0, 1, 1,
0.7612338, -0.9828339, 1.340186, 0, 0, 0, 1, 1,
0.7613525, -1.366597, 2.378839, 0, 0, 0, 1, 1,
0.7615998, -0.003066696, 1.461321, 0, 0, 0, 1, 1,
0.7677946, 0.3139938, 1.216463, 0, 0, 0, 1, 1,
0.7685941, -1.060791, 0.7713486, 1, 1, 1, 1, 1,
0.7688564, -1.543037, 2.606871, 1, 1, 1, 1, 1,
0.7768193, 0.3580127, 0.914084, 1, 1, 1, 1, 1,
0.7804992, -0.3339372, 1.89395, 1, 1, 1, 1, 1,
0.781137, 0.03403048, 1.901801, 1, 1, 1, 1, 1,
0.7869642, 0.7612761, 2.446472, 1, 1, 1, 1, 1,
0.7938094, 0.3742251, -0.6300457, 1, 1, 1, 1, 1,
0.7953695, -1.527598, 2.376297, 1, 1, 1, 1, 1,
0.7992495, 1.040513, 1.023158, 1, 1, 1, 1, 1,
0.8009211, 0.2392247, -0.3553712, 1, 1, 1, 1, 1,
0.801056, -0.281112, 1.069237, 1, 1, 1, 1, 1,
0.8040101, -0.0831295, 1.523913, 1, 1, 1, 1, 1,
0.8056799, 0.3213268, 2.772895, 1, 1, 1, 1, 1,
0.8240058, 0.06857728, 0.5328134, 1, 1, 1, 1, 1,
0.8265458, -0.1821799, 1.163489, 1, 1, 1, 1, 1,
0.8271041, 0.5164188, 0.3945615, 0, 0, 1, 1, 1,
0.8302333, -0.2232763, 1.476068, 1, 0, 0, 1, 1,
0.8347329, 0.5992511, 0.34074, 1, 0, 0, 1, 1,
0.8371658, -0.6114236, 1.606175, 1, 0, 0, 1, 1,
0.8375817, 0.8536217, 1.215351, 1, 0, 0, 1, 1,
0.8405868, -0.4221355, 2.594113, 1, 0, 0, 1, 1,
0.8412451, 0.9258457, 1.746985, 0, 0, 0, 1, 1,
0.8445239, -0.01243161, 0.983643, 0, 0, 0, 1, 1,
0.8539072, 0.9642334, -0.1006718, 0, 0, 0, 1, 1,
0.8586237, 0.6907012, 0.07679641, 0, 0, 0, 1, 1,
0.8636209, 0.06037141, 1.653898, 0, 0, 0, 1, 1,
0.8683956, 0.6689637, 1.137686, 0, 0, 0, 1, 1,
0.8706325, 0.4888102, -1.703463, 0, 0, 0, 1, 1,
0.8753392, -0.7177073, 2.362214, 1, 1, 1, 1, 1,
0.8827038, 0.3450306, -0.2543471, 1, 1, 1, 1, 1,
0.8830196, -0.2860634, 3.101717, 1, 1, 1, 1, 1,
0.8890918, 1.594033, 2.15654, 1, 1, 1, 1, 1,
0.8952892, -0.5316511, 2.467642, 1, 1, 1, 1, 1,
0.9003468, -0.8816453, 2.996928, 1, 1, 1, 1, 1,
0.9069067, -0.3593396, 2.424316, 1, 1, 1, 1, 1,
0.9082662, -1.010139, 3.099224, 1, 1, 1, 1, 1,
0.9122595, 0.7726935, 0.9459412, 1, 1, 1, 1, 1,
0.9323088, -0.08731621, 0.8534901, 1, 1, 1, 1, 1,
0.933766, 0.79887, 0.5999669, 1, 1, 1, 1, 1,
0.9489067, -0.8475023, 3.748128, 1, 1, 1, 1, 1,
0.9596274, -0.1464571, 3.029905, 1, 1, 1, 1, 1,
0.9604642, 0.1762142, 2.423574, 1, 1, 1, 1, 1,
0.9695018, -1.621015, 2.632696, 1, 1, 1, 1, 1,
0.9808, 0.4612214, 2.71918, 0, 0, 1, 1, 1,
0.9819241, 0.2547804, 1.55165, 1, 0, 0, 1, 1,
0.9831679, 1.52483, 2.018488, 1, 0, 0, 1, 1,
0.9859411, 0.8326187, -1.430632, 1, 0, 0, 1, 1,
0.9879082, -1.009736, 1.438956, 1, 0, 0, 1, 1,
0.9896028, -0.2446846, 2.463282, 1, 0, 0, 1, 1,
0.9927226, 0.6126738, 0.5277386, 0, 0, 0, 1, 1,
0.9945759, 0.3383906, 1.894617, 0, 0, 0, 1, 1,
1.0019, -0.3245476, 1.728288, 0, 0, 0, 1, 1,
1.004101, 0.08188868, -0.0119233, 0, 0, 0, 1, 1,
1.004734, -1.266319, 3.178886, 0, 0, 0, 1, 1,
1.007099, 0.05862407, 0.8982899, 0, 0, 0, 1, 1,
1.009207, 0.002185802, 0.6982253, 0, 0, 0, 1, 1,
1.013123, -0.9485543, 1.451618, 1, 1, 1, 1, 1,
1.025707, -1.40698, 1.5326, 1, 1, 1, 1, 1,
1.025968, 0.7600684, 0.8461365, 1, 1, 1, 1, 1,
1.027451, -1.39377, 2.238583, 1, 1, 1, 1, 1,
1.040364, -0.696931, 3.264103, 1, 1, 1, 1, 1,
1.043279, -0.840112, 3.422173, 1, 1, 1, 1, 1,
1.047052, 0.4080659, -0.9325755, 1, 1, 1, 1, 1,
1.049441, 0.274043, 1.962392, 1, 1, 1, 1, 1,
1.053961, -1.087343, -0.4472266, 1, 1, 1, 1, 1,
1.054038, -1.565454, 1.450253, 1, 1, 1, 1, 1,
1.067728, 0.1209314, 0.3071216, 1, 1, 1, 1, 1,
1.072588, 0.4287578, -0.4248434, 1, 1, 1, 1, 1,
1.08548, 0.2460093, 1.777759, 1, 1, 1, 1, 1,
1.091337, -0.8651021, 2.244405, 1, 1, 1, 1, 1,
1.093859, -0.7428624, 1.687015, 1, 1, 1, 1, 1,
1.095051, 0.2649334, -0.5631739, 0, 0, 1, 1, 1,
1.098968, -0.8405051, 1.890981, 1, 0, 0, 1, 1,
1.102495, 0.5523769, 0.9406051, 1, 0, 0, 1, 1,
1.103044, 0.4637771, 0.5465767, 1, 0, 0, 1, 1,
1.103799, -1.203635, 2.706257, 1, 0, 0, 1, 1,
1.109422, 0.1945344, 1.344644, 1, 0, 0, 1, 1,
1.115705, -0.8698426, 4.214802, 0, 0, 0, 1, 1,
1.117272, -0.7106627, 0.8766817, 0, 0, 0, 1, 1,
1.128678, -1.471126, 2.416733, 0, 0, 0, 1, 1,
1.129044, 0.01390627, 1.557261, 0, 0, 0, 1, 1,
1.132205, 0.3317836, 2.432984, 0, 0, 0, 1, 1,
1.133576, -0.05931629, 2.276574, 0, 0, 0, 1, 1,
1.138565, -1.302736, 4.217527, 0, 0, 0, 1, 1,
1.138903, 0.4319835, 0.4560644, 1, 1, 1, 1, 1,
1.141727, -0.006470953, 2.816744, 1, 1, 1, 1, 1,
1.14326, -1.52004, 1.207817, 1, 1, 1, 1, 1,
1.150639, -0.5446424, 2.230237, 1, 1, 1, 1, 1,
1.152781, -0.2740471, 1.462623, 1, 1, 1, 1, 1,
1.154697, -0.5343763, 2.720722, 1, 1, 1, 1, 1,
1.166022, -1.11051, 1.77062, 1, 1, 1, 1, 1,
1.167627, 1.407242, 1.285231, 1, 1, 1, 1, 1,
1.177017, -0.6831877, 2.545661, 1, 1, 1, 1, 1,
1.179432, -1.232192, 2.403251, 1, 1, 1, 1, 1,
1.179466, -0.6674147, 1.530675, 1, 1, 1, 1, 1,
1.183168, 0.5993404, 0.9890221, 1, 1, 1, 1, 1,
1.186984, -0.298773, 1.15531, 1, 1, 1, 1, 1,
1.191436, -0.1818223, 3.980161, 1, 1, 1, 1, 1,
1.197848, 1.323136, -0.5034309, 1, 1, 1, 1, 1,
1.200304, -1.726102, 1.467463, 0, 0, 1, 1, 1,
1.201556, -1.365955, 2.560731, 1, 0, 0, 1, 1,
1.203348, 0.8113288, 2.147212, 1, 0, 0, 1, 1,
1.208674, -0.7471032, 1.62287, 1, 0, 0, 1, 1,
1.212055, 0.462302, -0.791048, 1, 0, 0, 1, 1,
1.214195, -1.205462, 3.183187, 1, 0, 0, 1, 1,
1.224635, -2.113463, 3.199034, 0, 0, 0, 1, 1,
1.227758, 1.305226, 1.658609, 0, 0, 0, 1, 1,
1.231811, 1.128747, 0.1149533, 0, 0, 0, 1, 1,
1.232306, -0.09510792, 0.3819584, 0, 0, 0, 1, 1,
1.235875, -1.235674, 1.676355, 0, 0, 0, 1, 1,
1.238189, -1.54867, 2.461414, 0, 0, 0, 1, 1,
1.238213, 1.151747, 1.648405, 0, 0, 0, 1, 1,
1.242866, -0.2425438, 1.50741, 1, 1, 1, 1, 1,
1.244813, 0.2308072, 0.4207515, 1, 1, 1, 1, 1,
1.247766, 0.4071704, 3.636955, 1, 1, 1, 1, 1,
1.248317, -1.236934, 2.112481, 1, 1, 1, 1, 1,
1.252077, -0.2872126, 1.200192, 1, 1, 1, 1, 1,
1.254838, 0.6760218, 2.101969, 1, 1, 1, 1, 1,
1.257702, 1.020541, -0.09320149, 1, 1, 1, 1, 1,
1.266351, -0.1236051, 2.886927, 1, 1, 1, 1, 1,
1.271732, -0.9317025, 2.129728, 1, 1, 1, 1, 1,
1.272429, -1.097782, 3.153159, 1, 1, 1, 1, 1,
1.274267, 2.002376, 1.147402, 1, 1, 1, 1, 1,
1.281126, 0.1684494, 1.53776, 1, 1, 1, 1, 1,
1.290998, -2.225859, 1.552354, 1, 1, 1, 1, 1,
1.29811, -1.487167, 2.629419, 1, 1, 1, 1, 1,
1.305601, 1.310898, 3.447653, 1, 1, 1, 1, 1,
1.312044, 0.5956196, 0.5559675, 0, 0, 1, 1, 1,
1.316016, 1.264116, -0.6682754, 1, 0, 0, 1, 1,
1.329963, 0.03874236, 1.260007, 1, 0, 0, 1, 1,
1.334237, -0.04251812, 0.5446217, 1, 0, 0, 1, 1,
1.336295, -0.4096062, 3.037593, 1, 0, 0, 1, 1,
1.346977, 0.556184, 0.02261097, 1, 0, 0, 1, 1,
1.350681, 0.2378206, -1.497134, 0, 0, 0, 1, 1,
1.352117, -0.3921644, 0.8584768, 0, 0, 0, 1, 1,
1.354716, -0.7762448, 2.516371, 0, 0, 0, 1, 1,
1.362717, 0.5095983, 1.695843, 0, 0, 0, 1, 1,
1.365484, 1.448802, 1.341532, 0, 0, 0, 1, 1,
1.369683, 1.440999, 1.940868, 0, 0, 0, 1, 1,
1.372726, 0.3670136, 0.9757091, 0, 0, 0, 1, 1,
1.381946, -1.249097, 2.671785, 1, 1, 1, 1, 1,
1.394957, -0.3186095, 0.5804061, 1, 1, 1, 1, 1,
1.398507, 1.973692, -0.6677107, 1, 1, 1, 1, 1,
1.398873, -0.1198733, 1.255009, 1, 1, 1, 1, 1,
1.402806, -0.1138905, 2.738408, 1, 1, 1, 1, 1,
1.405665, 0.3131636, 1.322375, 1, 1, 1, 1, 1,
1.412537, -0.2475837, 2.183266, 1, 1, 1, 1, 1,
1.424686, 0.316203, 1.430929, 1, 1, 1, 1, 1,
1.425409, -1.434502, 1.808979, 1, 1, 1, 1, 1,
1.426156, -0.1765477, 1.724663, 1, 1, 1, 1, 1,
1.427718, -0.5079023, 4.305792, 1, 1, 1, 1, 1,
1.428955, -0.108668, 1.584121, 1, 1, 1, 1, 1,
1.441376, 1.698608, 0.2846593, 1, 1, 1, 1, 1,
1.444124, -0.2729047, 2.107206, 1, 1, 1, 1, 1,
1.448733, -0.5954496, 1.170566, 1, 1, 1, 1, 1,
1.459984, -0.2395631, 1.714978, 0, 0, 1, 1, 1,
1.461086, -0.2902468, 1.750246, 1, 0, 0, 1, 1,
1.461547, -0.9968792, 2.630189, 1, 0, 0, 1, 1,
1.462351, -1.64248, 1.058413, 1, 0, 0, 1, 1,
1.46464, -0.9732494, 0.4998287, 1, 0, 0, 1, 1,
1.468086, -0.5992402, 3.341278, 1, 0, 0, 1, 1,
1.468867, 2.109416, 1.480913, 0, 0, 0, 1, 1,
1.477661, 0.9517615, 0.7641065, 0, 0, 0, 1, 1,
1.485802, 0.2782966, 0.395586, 0, 0, 0, 1, 1,
1.502492, 2.267884, -0.08928951, 0, 0, 0, 1, 1,
1.504026, -0.6850319, 2.300231, 0, 0, 0, 1, 1,
1.525823, -0.01780177, 0.2882751, 0, 0, 0, 1, 1,
1.536213, 0.09167964, 1.006895, 0, 0, 0, 1, 1,
1.543417, 1.101103, 2.956852, 1, 1, 1, 1, 1,
1.555592, 0.9055752, -0.3151341, 1, 1, 1, 1, 1,
1.557025, -0.462161, 3.144217, 1, 1, 1, 1, 1,
1.561182, 1.14534, 2.339715, 1, 1, 1, 1, 1,
1.563406, 1.926207, 2.002221, 1, 1, 1, 1, 1,
1.565005, 1.488361, 1.12696, 1, 1, 1, 1, 1,
1.57143, -0.4974543, 3.237634, 1, 1, 1, 1, 1,
1.572481, 1.067148, 1.45754, 1, 1, 1, 1, 1,
1.58194, -0.9542925, 1.793862, 1, 1, 1, 1, 1,
1.58618, -0.8874639, 0.6534014, 1, 1, 1, 1, 1,
1.616378, 0.7641365, 0.5796329, 1, 1, 1, 1, 1,
1.624256, 0.06630111, 1.467716, 1, 1, 1, 1, 1,
1.625007, -0.7633692, 3.495908, 1, 1, 1, 1, 1,
1.645039, -0.2218915, 2.860451, 1, 1, 1, 1, 1,
1.654148, 0.4485705, 1.434664, 1, 1, 1, 1, 1,
1.656532, -0.2394246, 1.623706, 0, 0, 1, 1, 1,
1.657109, -0.8691394, 0.9649198, 1, 0, 0, 1, 1,
1.692267, -2.563145, 3.469631, 1, 0, 0, 1, 1,
1.699019, 0.06641591, 0.9477894, 1, 0, 0, 1, 1,
1.72394, 1.330586, 0.7903508, 1, 0, 0, 1, 1,
1.757896, -1.903367, 3.377176, 1, 0, 0, 1, 1,
1.781124, -0.4941728, 1.533431, 0, 0, 0, 1, 1,
1.794991, 0.05918835, 1.52984, 0, 0, 0, 1, 1,
1.803002, 0.1115129, 1.565077, 0, 0, 0, 1, 1,
1.81268, -0.111117, 0.6797466, 0, 0, 0, 1, 1,
1.813456, 1.931889, 0.6107224, 0, 0, 0, 1, 1,
1.817419, -1.232317, 4.004085, 0, 0, 0, 1, 1,
1.852876, -0.9118429, 2.804686, 0, 0, 0, 1, 1,
1.862098, -0.05952906, 3.616632, 1, 1, 1, 1, 1,
1.869365, 0.6469583, 1.697273, 1, 1, 1, 1, 1,
1.872773, -1.939983, -0.4681853, 1, 1, 1, 1, 1,
1.889396, 1.500353, 3.074131, 1, 1, 1, 1, 1,
1.907428, -0.2866181, 2.194843, 1, 1, 1, 1, 1,
1.910916, -0.1463104, 1.648968, 1, 1, 1, 1, 1,
1.920026, -0.6628751, 1.666379, 1, 1, 1, 1, 1,
1.941334, -0.7130306, 2.616439, 1, 1, 1, 1, 1,
1.953887, -0.7224292, 2.028615, 1, 1, 1, 1, 1,
1.9605, -0.5082425, 2.456637, 1, 1, 1, 1, 1,
1.987712, -0.9395991, 0.7950038, 1, 1, 1, 1, 1,
2.054045, 0.6922352, 0.8317019, 1, 1, 1, 1, 1,
2.057748, -0.7012551, 2.70453, 1, 1, 1, 1, 1,
2.069467, 0.6137028, 1.821493, 1, 1, 1, 1, 1,
2.097966, -0.2179179, 0.8918732, 1, 1, 1, 1, 1,
2.105357, 0.4469284, 1.271692, 0, 0, 1, 1, 1,
2.155274, 2.083893, 0.9659563, 1, 0, 0, 1, 1,
2.16323, 0.8076572, 0.4124472, 1, 0, 0, 1, 1,
2.195032, 0.9057098, 0.3221791, 1, 0, 0, 1, 1,
2.278723, -2.247594, 1.262074, 1, 0, 0, 1, 1,
2.296455, 1.399054, 2.41099, 1, 0, 0, 1, 1,
2.297884, 1.818132, 1.299647, 0, 0, 0, 1, 1,
2.342512, -0.04109985, 2.66288, 0, 0, 0, 1, 1,
2.344051, 0.2748771, 1.680001, 0, 0, 0, 1, 1,
2.355775, -0.8744345, 2.422389, 0, 0, 0, 1, 1,
2.370755, -0.5429245, 0.8610011, 0, 0, 0, 1, 1,
2.462439, 0.4682196, 2.935125, 0, 0, 0, 1, 1,
2.529847, 0.6604628, 1.520813, 0, 0, 0, 1, 1,
2.537371, -0.7577712, 2.850439, 1, 1, 1, 1, 1,
2.562554, 0.5130888, 2.040913, 1, 1, 1, 1, 1,
2.65731, 0.7642412, 1.714088, 1, 1, 1, 1, 1,
2.691659, 0.5600832, 1.768464, 1, 1, 1, 1, 1,
2.942905, -1.74026, 0.790345, 1, 1, 1, 1, 1,
3.064214, 1.053551, -0.1695283, 1, 1, 1, 1, 1,
3.34289, 0.1077841, 0.04871807, 1, 1, 1, 1, 1
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
var radius = 10.1879;
var distance = 35.78457;
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
mvMatrix.translate( -0.250941, 0.2996755, 0.1745679 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.78457);
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
