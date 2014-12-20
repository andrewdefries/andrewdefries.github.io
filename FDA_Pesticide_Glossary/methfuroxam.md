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
-3.113309, -0.1121135, -0.5659438, 1, 0, 0, 1,
-2.938972, -0.9711302, -2.493052, 1, 0.007843138, 0, 1,
-2.909157, 0.1550941, -2.311105, 1, 0.01176471, 0, 1,
-2.894394, 1.55909, 0.02165686, 1, 0.01960784, 0, 1,
-2.85007, -1.384726, -1.563411, 1, 0.02352941, 0, 1,
-2.795086, 0.1161502, -1.691665, 1, 0.03137255, 0, 1,
-2.772453, 0.9169281, -1.22822, 1, 0.03529412, 0, 1,
-2.710839, 1.059429, -2.777111, 1, 0.04313726, 0, 1,
-2.625501, -0.2606913, -3.074712, 1, 0.04705882, 0, 1,
-2.581848, 1.978354, -1.984617, 1, 0.05490196, 0, 1,
-2.560899, 1.264213, -1.072323, 1, 0.05882353, 0, 1,
-2.515656, -1.198045, -0.4907493, 1, 0.06666667, 0, 1,
-2.506442, -0.1761681, -1.715578, 1, 0.07058824, 0, 1,
-2.418341, 2.132762, -1.526947, 1, 0.07843138, 0, 1,
-2.302334, -0.5219062, 0.7047942, 1, 0.08235294, 0, 1,
-2.288415, 1.357713, 0.4405848, 1, 0.09019608, 0, 1,
-2.261652, -2.898657, -1.707658, 1, 0.09411765, 0, 1,
-2.250831, -0.0218055, -1.979283, 1, 0.1019608, 0, 1,
-2.249804, -0.5163997, -2.643991, 1, 0.1098039, 0, 1,
-2.247224, 0.05007667, -0.9246739, 1, 0.1137255, 0, 1,
-2.240604, -2.826848, -3.000182, 1, 0.1215686, 0, 1,
-2.232671, 1.078303, -1.56894, 1, 0.1254902, 0, 1,
-2.223714, -1.577399, -0.9890416, 1, 0.1333333, 0, 1,
-2.178617, -0.9522141, -2.176259, 1, 0.1372549, 0, 1,
-2.171435, 0.8549603, -0.3937764, 1, 0.145098, 0, 1,
-2.164491, 0.6657377, -3.646098, 1, 0.1490196, 0, 1,
-2.155317, 0.7852282, -1.21224, 1, 0.1568628, 0, 1,
-2.131998, -0.2784258, -0.3962015, 1, 0.1607843, 0, 1,
-2.114435, -0.2411756, -2.942017, 1, 0.1686275, 0, 1,
-2.063624, 0.4425493, 0.88107, 1, 0.172549, 0, 1,
-2.049433, 0.05745697, -0.02786946, 1, 0.1803922, 0, 1,
-2.032556, 0.18072, -1.960256, 1, 0.1843137, 0, 1,
-2.031679, 0.3206321, 0.9001892, 1, 0.1921569, 0, 1,
-2.017491, -0.5382805, -2.028534, 1, 0.1960784, 0, 1,
-1.991282, 0.2809795, -0.8076158, 1, 0.2039216, 0, 1,
-1.977034, -0.5441944, -1.463202, 1, 0.2117647, 0, 1,
-1.902243, 0.5739498, -0.6085925, 1, 0.2156863, 0, 1,
-1.867661, -2.046366, -2.558802, 1, 0.2235294, 0, 1,
-1.845542, -0.7917205, -2.300756, 1, 0.227451, 0, 1,
-1.84438, 0.1248886, -0.09346282, 1, 0.2352941, 0, 1,
-1.832444, -0.568957, -2.950537, 1, 0.2392157, 0, 1,
-1.829847, 1.027415, -0.173063, 1, 0.2470588, 0, 1,
-1.790656, 0.02569764, -1.774099, 1, 0.2509804, 0, 1,
-1.779909, -1.464417, -1.818528, 1, 0.2588235, 0, 1,
-1.779716, -0.2378747, -1.350756, 1, 0.2627451, 0, 1,
-1.777822, -0.8363209, -2.037148, 1, 0.2705882, 0, 1,
-1.764864, -0.3858742, -1.90539, 1, 0.2745098, 0, 1,
-1.755756, 0.2596054, -0.9899064, 1, 0.282353, 0, 1,
-1.731705, 0.3846619, -2.802303, 1, 0.2862745, 0, 1,
-1.728858, 0.2838293, -1.030912, 1, 0.2941177, 0, 1,
-1.723088, 1.457908, -0.4910694, 1, 0.3019608, 0, 1,
-1.690567, 0.4221404, -1.66088, 1, 0.3058824, 0, 1,
-1.66504, -1.25603, -2.497398, 1, 0.3137255, 0, 1,
-1.658778, -0.06849068, -2.402427, 1, 0.3176471, 0, 1,
-1.656593, 0.09123206, -1.83214, 1, 0.3254902, 0, 1,
-1.655035, -0.8925218, -0.4473069, 1, 0.3294118, 0, 1,
-1.647929, 1.677607, -0.7295102, 1, 0.3372549, 0, 1,
-1.644663, -0.6475511, -2.187149, 1, 0.3411765, 0, 1,
-1.627721, 1.74572, 1.002288, 1, 0.3490196, 0, 1,
-1.604427, -0.3690878, -0.7795827, 1, 0.3529412, 0, 1,
-1.590612, -0.4898962, -3.17176, 1, 0.3607843, 0, 1,
-1.580125, -0.8336959, -0.8186821, 1, 0.3647059, 0, 1,
-1.572353, 1.083464, -1.534935, 1, 0.372549, 0, 1,
-1.569591, 0.8939518, -1.095348, 1, 0.3764706, 0, 1,
-1.546932, -0.08884764, -2.030793, 1, 0.3843137, 0, 1,
-1.529249, -0.8959727, -2.678026, 1, 0.3882353, 0, 1,
-1.527565, -0.3854061, -2.374993, 1, 0.3960784, 0, 1,
-1.520382, 0.8575706, -0.856297, 1, 0.4039216, 0, 1,
-1.508648, -0.814469, -3.098717, 1, 0.4078431, 0, 1,
-1.496938, -0.05256281, -2.735484, 1, 0.4156863, 0, 1,
-1.487823, -0.8521999, -3.204022, 1, 0.4196078, 0, 1,
-1.478389, 0.6678937, -2.448498, 1, 0.427451, 0, 1,
-1.47484, -2.052028, -0.9964626, 1, 0.4313726, 0, 1,
-1.472392, 1.483557, -0.4420598, 1, 0.4392157, 0, 1,
-1.472101, 0.1137364, -1.436252, 1, 0.4431373, 0, 1,
-1.444336, -1.603006, -3.807066, 1, 0.4509804, 0, 1,
-1.441485, -0.7304881, -3.033024, 1, 0.454902, 0, 1,
-1.424681, 1.259438, -0.7722465, 1, 0.4627451, 0, 1,
-1.410548, -0.7070643, -2.692437, 1, 0.4666667, 0, 1,
-1.404794, -0.08371823, 0.2254978, 1, 0.4745098, 0, 1,
-1.404062, 0.7972348, -1.177269, 1, 0.4784314, 0, 1,
-1.397738, -1.706394, -1.927508, 1, 0.4862745, 0, 1,
-1.396188, 1.360233, -0.4323377, 1, 0.4901961, 0, 1,
-1.379685, -0.3171504, -2.802673, 1, 0.4980392, 0, 1,
-1.374586, 0.5314431, -0.6239792, 1, 0.5058824, 0, 1,
-1.368484, 0.8972005, -0.05375317, 1, 0.509804, 0, 1,
-1.364161, -0.08009583, 0.8437455, 1, 0.5176471, 0, 1,
-1.357945, -0.9205512, -3.655092, 1, 0.5215687, 0, 1,
-1.344857, 0.4020518, -0.2686618, 1, 0.5294118, 0, 1,
-1.338787, 1.123184, -0.5952659, 1, 0.5333334, 0, 1,
-1.336141, -0.8366492, -2.038929, 1, 0.5411765, 0, 1,
-1.336022, -1.395863, -2.346822, 1, 0.5450981, 0, 1,
-1.331342, -1.545688, -3.35582, 1, 0.5529412, 0, 1,
-1.324893, -0.5412331, -0.9320977, 1, 0.5568628, 0, 1,
-1.31686, -0.5963992, -2.027655, 1, 0.5647059, 0, 1,
-1.312643, -1.182601, -2.35194, 1, 0.5686275, 0, 1,
-1.310522, 0.3811473, -1.771788, 1, 0.5764706, 0, 1,
-1.303052, -1.041095, -3.969488, 1, 0.5803922, 0, 1,
-1.300798, -1.139892, -1.528263, 1, 0.5882353, 0, 1,
-1.297852, -0.3301329, -2.702044, 1, 0.5921569, 0, 1,
-1.279863, -0.4950319, -1.460203, 1, 0.6, 0, 1,
-1.268383, -1.784643, -2.934921, 1, 0.6078432, 0, 1,
-1.262328, -0.2581606, -1.17312, 1, 0.6117647, 0, 1,
-1.260023, -1.710579, -3.938081, 1, 0.6196079, 0, 1,
-1.25142, -1.043029, -1.783523, 1, 0.6235294, 0, 1,
-1.251079, -1.163846, -4.038151, 1, 0.6313726, 0, 1,
-1.242921, 1.7579, -1.135161, 1, 0.6352941, 0, 1,
-1.232563, 1.050253, -1.678253, 1, 0.6431373, 0, 1,
-1.22825, -0.594685, -1.46435, 1, 0.6470588, 0, 1,
-1.225649, 0.8021744, -0.8398004, 1, 0.654902, 0, 1,
-1.225248, 1.967834, -0.4835486, 1, 0.6588235, 0, 1,
-1.216116, 0.1269505, -2.165099, 1, 0.6666667, 0, 1,
-1.189443, 0.3019539, -2.652708, 1, 0.6705883, 0, 1,
-1.184116, -2.094152, -3.392667, 1, 0.6784314, 0, 1,
-1.167942, -2.963294, -3.669587, 1, 0.682353, 0, 1,
-1.16516, 1.493651, 0.6445714, 1, 0.6901961, 0, 1,
-1.164085, 1.176593, -1.571081, 1, 0.6941177, 0, 1,
-1.161169, 1.011269, -0.1583911, 1, 0.7019608, 0, 1,
-1.160545, -0.274781, -0.4873972, 1, 0.7098039, 0, 1,
-1.160517, -1.334671, -1.604375, 1, 0.7137255, 0, 1,
-1.14583, -1.294934, -2.388285, 1, 0.7215686, 0, 1,
-1.142309, 1.584452, -2.6655, 1, 0.7254902, 0, 1,
-1.12789, -1.654412, -3.075522, 1, 0.7333333, 0, 1,
-1.122482, -1.29537, -2.388903, 1, 0.7372549, 0, 1,
-1.12137, 0.4459099, -1.351109, 1, 0.7450981, 0, 1,
-1.11339, 0.2494961, -2.040861, 1, 0.7490196, 0, 1,
-1.109592, 0.6650807, 0.8257097, 1, 0.7568628, 0, 1,
-1.099606, 0.03398321, -2.418148, 1, 0.7607843, 0, 1,
-1.092356, -0.5684498, -1.821612, 1, 0.7686275, 0, 1,
-1.087403, 0.4187073, 0.01267077, 1, 0.772549, 0, 1,
-1.086716, -2.204496, -2.646123, 1, 0.7803922, 0, 1,
-1.080832, 2.036809, 0.1761146, 1, 0.7843137, 0, 1,
-1.079787, -0.7075271, -2.261776, 1, 0.7921569, 0, 1,
-1.077409, -0.4863604, -2.03524, 1, 0.7960784, 0, 1,
-1.073684, -0.5237631, -1.067844, 1, 0.8039216, 0, 1,
-1.073189, 2.097444, -0.3885118, 1, 0.8117647, 0, 1,
-1.071943, 1.564293, -0.9620989, 1, 0.8156863, 0, 1,
-1.065242, -2.383373, -3.24057, 1, 0.8235294, 0, 1,
-1.063092, -0.6566398, -4.098556, 1, 0.827451, 0, 1,
-1.06039, 1.605809, -0.779263, 1, 0.8352941, 0, 1,
-1.059823, -0.8484123, -3.238243, 1, 0.8392157, 0, 1,
-1.05719, 1.530401, -1.332538, 1, 0.8470588, 0, 1,
-1.056479, 1.073328, -0.5626546, 1, 0.8509804, 0, 1,
-1.0547, -0.5737172, -2.242055, 1, 0.8588235, 0, 1,
-1.041898, 1.504542, 1.09941, 1, 0.8627451, 0, 1,
-1.039762, 1.129823, -0.2177924, 1, 0.8705882, 0, 1,
-1.03101, 0.6122795, -2.105219, 1, 0.8745098, 0, 1,
-1.027312, 0.2343978, -0.4695232, 1, 0.8823529, 0, 1,
-1.024956, 1.659868, -2.639949, 1, 0.8862745, 0, 1,
-1.017232, 0.1498102, -1.624796, 1, 0.8941177, 0, 1,
-1.014342, -0.2491685, -0.8985612, 1, 0.8980392, 0, 1,
-1.013428, 1.349809, -0.9907654, 1, 0.9058824, 0, 1,
-1.009716, 0.6795182, 0.284776, 1, 0.9137255, 0, 1,
-1.00845, 1.577778, -1.292267, 1, 0.9176471, 0, 1,
-1.004605, -0.637468, 0.005277521, 1, 0.9254902, 0, 1,
-1.003907, 0.3401457, -0.3263173, 1, 0.9294118, 0, 1,
-0.9993932, -0.126774, -2.517836, 1, 0.9372549, 0, 1,
-0.9993625, -0.647598, -0.9849167, 1, 0.9411765, 0, 1,
-0.9876643, 0.4193791, 0.2090057, 1, 0.9490196, 0, 1,
-0.9862564, 1.223457, -0.599347, 1, 0.9529412, 0, 1,
-0.9847644, -2.93559, -3.121861, 1, 0.9607843, 0, 1,
-0.9822891, 1.237305, -0.7565739, 1, 0.9647059, 0, 1,
-0.9811664, 0.1661796, -1.605754, 1, 0.972549, 0, 1,
-0.9694929, 0.2506209, -1.742085, 1, 0.9764706, 0, 1,
-0.968158, -2.153511, -2.173938, 1, 0.9843137, 0, 1,
-0.9638351, 0.5828494, -0.6392664, 1, 0.9882353, 0, 1,
-0.9634483, -0.8014627, -3.522276, 1, 0.9960784, 0, 1,
-0.9535923, 0.7572569, -1.075583, 0.9960784, 1, 0, 1,
-0.9439158, -1.434784, -2.817839, 0.9921569, 1, 0, 1,
-0.9438876, -1.284069, -2.814667, 0.9843137, 1, 0, 1,
-0.9422211, -0.7039253, -0.9720885, 0.9803922, 1, 0, 1,
-0.9404284, 0.270201, -1.462201, 0.972549, 1, 0, 1,
-0.936577, 0.6557685, -1.599848, 0.9686275, 1, 0, 1,
-0.9339089, -0.4417235, -2.601345, 0.9607843, 1, 0, 1,
-0.9311618, -1.13285, -3.81153, 0.9568627, 1, 0, 1,
-0.9268656, 1.114232, 0.4243239, 0.9490196, 1, 0, 1,
-0.9260018, 0.8299792, -2.498915, 0.945098, 1, 0, 1,
-0.9216523, 0.7250664, -2.312234, 0.9372549, 1, 0, 1,
-0.9205377, 0.03954496, -0.06565387, 0.9333333, 1, 0, 1,
-0.9115747, 0.02243002, -1.492553, 0.9254902, 1, 0, 1,
-0.9057974, -0.8766696, -0.1402343, 0.9215686, 1, 0, 1,
-0.9056728, 0.1595987, -1.998701, 0.9137255, 1, 0, 1,
-0.8940938, 0.2030645, 0.4440214, 0.9098039, 1, 0, 1,
-0.8900938, 0.676754, -1.412286, 0.9019608, 1, 0, 1,
-0.8891461, 0.6975103, -0.9514238, 0.8941177, 1, 0, 1,
-0.8817511, 1.298242, 0.4570888, 0.8901961, 1, 0, 1,
-0.8797318, -0.1631523, -3.055344, 0.8823529, 1, 0, 1,
-0.8769199, 1.072594, -1.830599, 0.8784314, 1, 0, 1,
-0.8750823, -1.519527, -4.074273, 0.8705882, 1, 0, 1,
-0.8701344, -1.624842, -0.6074011, 0.8666667, 1, 0, 1,
-0.8671454, 0.2928355, -1.097293, 0.8588235, 1, 0, 1,
-0.8626525, -0.5102099, -1.621461, 0.854902, 1, 0, 1,
-0.861598, 0.8940818, 0.6921328, 0.8470588, 1, 0, 1,
-0.8558831, -0.3392387, -1.831682, 0.8431373, 1, 0, 1,
-0.8530213, -0.2102843, -1.525027, 0.8352941, 1, 0, 1,
-0.8510138, -0.5721056, -0.3103449, 0.8313726, 1, 0, 1,
-0.850713, -0.5504987, -2.456, 0.8235294, 1, 0, 1,
-0.8482444, 0.1190516, -0.1150493, 0.8196079, 1, 0, 1,
-0.8443667, -0.9322968, -0.3371739, 0.8117647, 1, 0, 1,
-0.839929, 2.024251, -2.52874, 0.8078431, 1, 0, 1,
-0.8391774, 0.6801888, -1.325557, 0.8, 1, 0, 1,
-0.8389887, -0.006489383, -1.455545, 0.7921569, 1, 0, 1,
-0.8350294, -0.4730985, -3.755606, 0.7882353, 1, 0, 1,
-0.8323466, 1.591327, 0.8309864, 0.7803922, 1, 0, 1,
-0.8274179, 1.83792, -0.5367513, 0.7764706, 1, 0, 1,
-0.8247964, -0.3698922, -1.410806, 0.7686275, 1, 0, 1,
-0.8245188, 2.699843, 0.1220611, 0.7647059, 1, 0, 1,
-0.8240626, 1.124518, 0.8839074, 0.7568628, 1, 0, 1,
-0.8240179, 1.052542, -1.422647, 0.7529412, 1, 0, 1,
-0.8135925, 0.218069, -0.6709, 0.7450981, 1, 0, 1,
-0.8101729, 0.7268133, 0.7068122, 0.7411765, 1, 0, 1,
-0.8074142, -1.203893, -3.385236, 0.7333333, 1, 0, 1,
-0.8051991, 0.8488594, -0.8060918, 0.7294118, 1, 0, 1,
-0.8014517, -0.3823418, -1.266479, 0.7215686, 1, 0, 1,
-0.7876711, -0.7492868, -1.877422, 0.7176471, 1, 0, 1,
-0.7864088, -0.8505023, -3.28586, 0.7098039, 1, 0, 1,
-0.7862169, -1.705091, -3.096085, 0.7058824, 1, 0, 1,
-0.7812533, -0.113039, -1.115985, 0.6980392, 1, 0, 1,
-0.7780225, 0.5088814, -0.2864317, 0.6901961, 1, 0, 1,
-0.7761577, -0.9341948, -2.545217, 0.6862745, 1, 0, 1,
-0.7684054, -0.314086, 0.1620322, 0.6784314, 1, 0, 1,
-0.7676035, -0.7091053, -1.404229, 0.6745098, 1, 0, 1,
-0.7578398, -1.261651, -2.633902, 0.6666667, 1, 0, 1,
-0.7518461, -0.4927173, -1.547977, 0.6627451, 1, 0, 1,
-0.7483212, 0.4340962, -1.576846, 0.654902, 1, 0, 1,
-0.748233, 1.530105, -0.6601202, 0.6509804, 1, 0, 1,
-0.7475164, 0.1350882, 0.9318026, 0.6431373, 1, 0, 1,
-0.7399469, -0.05416717, 0.5848743, 0.6392157, 1, 0, 1,
-0.7238179, -1.882772, -3.660247, 0.6313726, 1, 0, 1,
-0.7202412, -0.3163125, -1.469347, 0.627451, 1, 0, 1,
-0.7175182, -0.3556354, -2.279261, 0.6196079, 1, 0, 1,
-0.7174561, 1.393897, -0.8322262, 0.6156863, 1, 0, 1,
-0.7171991, -0.768013, 0.6586952, 0.6078432, 1, 0, 1,
-0.7132141, 0.7936209, -1.108063, 0.6039216, 1, 0, 1,
-0.7118686, -0.7180934, -1.260286, 0.5960785, 1, 0, 1,
-0.7106233, -0.3070915, -0.5760265, 0.5882353, 1, 0, 1,
-0.7045163, -0.9128972, -1.595999, 0.5843138, 1, 0, 1,
-0.7021862, 1.174706, -0.8545604, 0.5764706, 1, 0, 1,
-0.7007972, 1.006963, 0.8940337, 0.572549, 1, 0, 1,
-0.6993008, 0.4678757, -1.035236, 0.5647059, 1, 0, 1,
-0.6943388, -0.6248246, -0.4866855, 0.5607843, 1, 0, 1,
-0.6917868, 0.621612, 1.201488, 0.5529412, 1, 0, 1,
-0.6895852, -0.1480096, -1.371971, 0.5490196, 1, 0, 1,
-0.6773024, 1.191184, 0.2419614, 0.5411765, 1, 0, 1,
-0.6761795, 0.4523059, -0.5388379, 0.5372549, 1, 0, 1,
-0.6750748, 1.674772, -0.06323014, 0.5294118, 1, 0, 1,
-0.6744986, -1.132695, -1.182837, 0.5254902, 1, 0, 1,
-0.6739159, -0.5279875, -1.423735, 0.5176471, 1, 0, 1,
-0.6734177, 0.3641723, -3.165485, 0.5137255, 1, 0, 1,
-0.6719374, -0.2563301, -2.377282, 0.5058824, 1, 0, 1,
-0.671804, 0.5696324, -0.4229946, 0.5019608, 1, 0, 1,
-0.6716701, 1.133232, -0.2655049, 0.4941176, 1, 0, 1,
-0.6617752, 1.13064, -0.7592742, 0.4862745, 1, 0, 1,
-0.6521333, 0.3873747, 0.2982097, 0.4823529, 1, 0, 1,
-0.6518961, -0.9910421, -2.956843, 0.4745098, 1, 0, 1,
-0.6458339, -0.9815789, -3.167119, 0.4705882, 1, 0, 1,
-0.6433402, -0.3945624, -1.22525, 0.4627451, 1, 0, 1,
-0.6420947, 0.314602, 1.061255, 0.4588235, 1, 0, 1,
-0.6387544, -0.4748882, -1.037279, 0.4509804, 1, 0, 1,
-0.6379316, -2.176617, -2.057059, 0.4470588, 1, 0, 1,
-0.6367483, -0.6433562, -2.774481, 0.4392157, 1, 0, 1,
-0.6366323, -1.775501, -1.93372, 0.4352941, 1, 0, 1,
-0.6361815, 0.5474699, -1.169327, 0.427451, 1, 0, 1,
-0.634896, 0.3960991, 2.722531, 0.4235294, 1, 0, 1,
-0.6332859, 0.7140653, -1.802174, 0.4156863, 1, 0, 1,
-0.6320922, -1.586213, -1.310661, 0.4117647, 1, 0, 1,
-0.6296126, -1.848298, -2.626642, 0.4039216, 1, 0, 1,
-0.6293564, -0.2287214, -3.31861, 0.3960784, 1, 0, 1,
-0.6237392, -0.9117864, -1.929848, 0.3921569, 1, 0, 1,
-0.6146979, -0.6965091, -1.45767, 0.3843137, 1, 0, 1,
-0.6117463, -0.4819389, 0.1661414, 0.3803922, 1, 0, 1,
-0.6027367, -0.02632942, -0.8325743, 0.372549, 1, 0, 1,
-0.5976034, -0.6166894, -2.233883, 0.3686275, 1, 0, 1,
-0.5965269, 1.160753, 0.05718705, 0.3607843, 1, 0, 1,
-0.5929569, 1.670513, -0.5427511, 0.3568628, 1, 0, 1,
-0.5926236, -0.2735073, -1.789052, 0.3490196, 1, 0, 1,
-0.5891048, -0.6963055, -2.118854, 0.345098, 1, 0, 1,
-0.5884684, 1.332114, 0.2288029, 0.3372549, 1, 0, 1,
-0.5882908, -0.7240201, -1.147878, 0.3333333, 1, 0, 1,
-0.5872678, 0.5094667, 1.524138, 0.3254902, 1, 0, 1,
-0.5836059, 0.4574992, 0.2745194, 0.3215686, 1, 0, 1,
-0.578327, 0.6140165, -1.952444, 0.3137255, 1, 0, 1,
-0.5741357, 0.2955667, 0.07540946, 0.3098039, 1, 0, 1,
-0.5676116, -0.4272403, -2.49269, 0.3019608, 1, 0, 1,
-0.5589267, -0.8546116, -4.485088, 0.2941177, 1, 0, 1,
-0.5510467, -0.0494351, -2.995751, 0.2901961, 1, 0, 1,
-0.5508006, -0.142398, -3.217943, 0.282353, 1, 0, 1,
-0.5475613, -0.9224524, -5.035684, 0.2784314, 1, 0, 1,
-0.5452684, 0.1613735, -1.632926, 0.2705882, 1, 0, 1,
-0.5447117, -0.1392916, -3.049025, 0.2666667, 1, 0, 1,
-0.544645, -0.4690561, -2.567359, 0.2588235, 1, 0, 1,
-0.5440238, -1.504537, -2.760212, 0.254902, 1, 0, 1,
-0.5425097, 0.4278605, -0.9644992, 0.2470588, 1, 0, 1,
-0.5284384, 0.9926447, -1.841704, 0.2431373, 1, 0, 1,
-0.5256432, -0.1682398, -2.042881, 0.2352941, 1, 0, 1,
-0.5240024, -0.2638656, -1.03636, 0.2313726, 1, 0, 1,
-0.5211653, -0.875991, -2.046794, 0.2235294, 1, 0, 1,
-0.5205022, 0.1235588, -1.150746, 0.2196078, 1, 0, 1,
-0.5178105, 0.836657, -1.28766, 0.2117647, 1, 0, 1,
-0.5163938, -0.06842656, -1.749591, 0.2078431, 1, 0, 1,
-0.5131426, 1.044015, 0.2600292, 0.2, 1, 0, 1,
-0.5131375, -0.05699537, -2.941192, 0.1921569, 1, 0, 1,
-0.5113859, -0.02197724, -0.5258786, 0.1882353, 1, 0, 1,
-0.5113443, -1.685614, -3.418285, 0.1803922, 1, 0, 1,
-0.5111849, 0.5129483, 0.1802931, 0.1764706, 1, 0, 1,
-0.5093464, -1.074043, -2.723302, 0.1686275, 1, 0, 1,
-0.5053233, -0.4139989, -2.656081, 0.1647059, 1, 0, 1,
-0.5048091, -0.2558396, -1.918904, 0.1568628, 1, 0, 1,
-0.4969448, 1.718562, -0.01192848, 0.1529412, 1, 0, 1,
-0.4928073, -0.325853, -2.502987, 0.145098, 1, 0, 1,
-0.4917834, 0.1190169, -0.4012636, 0.1411765, 1, 0, 1,
-0.4914236, 1.656223, 1.094982, 0.1333333, 1, 0, 1,
-0.4886758, 0.8165305, -2.886431, 0.1294118, 1, 0, 1,
-0.4882677, 0.2311324, -2.40054, 0.1215686, 1, 0, 1,
-0.4861604, -0.2468592, -3.202176, 0.1176471, 1, 0, 1,
-0.4824672, 1.053081, 0.6191121, 0.1098039, 1, 0, 1,
-0.481595, -0.1113835, -2.162885, 0.1058824, 1, 0, 1,
-0.4810443, 2.255697, -0.6851787, 0.09803922, 1, 0, 1,
-0.4757949, 0.699532, -0.8007336, 0.09019608, 1, 0, 1,
-0.4747256, 0.3442004, 0.8844014, 0.08627451, 1, 0, 1,
-0.4741903, 0.6069105, -0.9016672, 0.07843138, 1, 0, 1,
-0.4712555, 0.4292295, -1.538313, 0.07450981, 1, 0, 1,
-0.4667451, 0.8455952, 0.3393357, 0.06666667, 1, 0, 1,
-0.4641468, -0.1375329, 0.236983, 0.0627451, 1, 0, 1,
-0.4611259, 0.4228672, 0.9045506, 0.05490196, 1, 0, 1,
-0.460818, -0.5114868, -2.449705, 0.05098039, 1, 0, 1,
-0.4604851, -1.051595, -2.807036, 0.04313726, 1, 0, 1,
-0.4589198, -0.1227843, -1.837192, 0.03921569, 1, 0, 1,
-0.4533417, -1.803948, -2.550105, 0.03137255, 1, 0, 1,
-0.4524894, -0.2771097, -1.653769, 0.02745098, 1, 0, 1,
-0.4500483, 0.633291, -0.1482753, 0.01960784, 1, 0, 1,
-0.4460547, -0.1194717, 0.3050231, 0.01568628, 1, 0, 1,
-0.4437298, 0.6904094, -0.06177711, 0.007843138, 1, 0, 1,
-0.4435251, 0.6024803, -1.323084, 0.003921569, 1, 0, 1,
-0.4298408, 0.7688164, -0.8216586, 0, 1, 0.003921569, 1,
-0.4291591, -0.3336544, 0.05261865, 0, 1, 0.01176471, 1,
-0.4286084, -0.2150389, -1.547023, 0, 1, 0.01568628, 1,
-0.4264363, -0.91078, -1.914114, 0, 1, 0.02352941, 1,
-0.4244134, 0.05823286, -0.5086693, 0, 1, 0.02745098, 1,
-0.4220862, -0.2604133, -0.9866096, 0, 1, 0.03529412, 1,
-0.4206375, -0.05863801, 0.4627984, 0, 1, 0.03921569, 1,
-0.4188931, -0.1945468, -2.9687, 0, 1, 0.04705882, 1,
-0.4141215, 0.4535623, -1.266931, 0, 1, 0.05098039, 1,
-0.4132794, 0.3954655, 2.922087, 0, 1, 0.05882353, 1,
-0.4111989, -2.084789, -1.433331, 0, 1, 0.0627451, 1,
-0.4076662, 0.176664, -0.07134829, 0, 1, 0.07058824, 1,
-0.4054219, -1.14144, -3.944553, 0, 1, 0.07450981, 1,
-0.4005441, -0.4462527, -3.681716, 0, 1, 0.08235294, 1,
-0.3936212, 1.359598, -0.5915844, 0, 1, 0.08627451, 1,
-0.3933999, 0.08559195, -2.467006, 0, 1, 0.09411765, 1,
-0.3909999, 0.2377179, -0.7029964, 0, 1, 0.1019608, 1,
-0.382043, -0.950278, -2.368216, 0, 1, 0.1058824, 1,
-0.3788595, -0.8731247, -3.484992, 0, 1, 0.1137255, 1,
-0.3741087, 1.472438, -1.911572, 0, 1, 0.1176471, 1,
-0.3725379, -1.137067, -1.801955, 0, 1, 0.1254902, 1,
-0.3716615, -0.1703501, -4.899468, 0, 1, 0.1294118, 1,
-0.3709883, 1.190813, -1.081344, 0, 1, 0.1372549, 1,
-0.3696599, -0.4221216, -2.872825, 0, 1, 0.1411765, 1,
-0.3679422, 1.037628, -0.2197158, 0, 1, 0.1490196, 1,
-0.3653349, 0.4096013, -2.522016, 0, 1, 0.1529412, 1,
-0.3632298, -2.686356, -2.270314, 0, 1, 0.1607843, 1,
-0.3585748, 0.7645697, -1.598623, 0, 1, 0.1647059, 1,
-0.3573762, -0.1535665, -1.123435, 0, 1, 0.172549, 1,
-0.3551803, -1.112755, -3.765961, 0, 1, 0.1764706, 1,
-0.3538789, -0.1122724, -2.478522, 0, 1, 0.1843137, 1,
-0.3422281, -0.07025599, -1.492445, 0, 1, 0.1882353, 1,
-0.3398139, 0.6163867, 0.567418, 0, 1, 0.1960784, 1,
-0.3357142, 0.1847592, -1.559959, 0, 1, 0.2039216, 1,
-0.3352042, 1.494837, -0.235549, 0, 1, 0.2078431, 1,
-0.3348019, 0.2190495, -1.748971, 0, 1, 0.2156863, 1,
-0.3302819, -1.264398, -3.506352, 0, 1, 0.2196078, 1,
-0.3264635, 0.1281502, -2.8937, 0, 1, 0.227451, 1,
-0.3221778, -2.469394, -2.934745, 0, 1, 0.2313726, 1,
-0.3167112, -1.278767, -2.804981, 0, 1, 0.2392157, 1,
-0.3135332, 0.4716893, -1.210184, 0, 1, 0.2431373, 1,
-0.3083768, -0.815014, -1.752369, 0, 1, 0.2509804, 1,
-0.3014005, -1.097003, -3.009506, 0, 1, 0.254902, 1,
-0.3004495, -0.8933345, -3.511784, 0, 1, 0.2627451, 1,
-0.2969595, -0.864651, -2.512449, 0, 1, 0.2666667, 1,
-0.2966299, -2.402709, -0.4751262, 0, 1, 0.2745098, 1,
-0.2940204, 0.643586, 0.3902782, 0, 1, 0.2784314, 1,
-0.2931051, 1.036613, 0.1569552, 0, 1, 0.2862745, 1,
-0.285055, -0.9724577, -3.518871, 0, 1, 0.2901961, 1,
-0.2842218, 1.837916, -0.4681564, 0, 1, 0.2980392, 1,
-0.2796278, -1.522609, -3.622492, 0, 1, 0.3058824, 1,
-0.2791955, 0.6490659, 0.8010436, 0, 1, 0.3098039, 1,
-0.2786912, 1.34963, 1.713115, 0, 1, 0.3176471, 1,
-0.2761293, -0.5237542, -2.937528, 0, 1, 0.3215686, 1,
-0.2735878, -0.05803345, -1.873406, 0, 1, 0.3294118, 1,
-0.2712219, 1.560488, 1.338424, 0, 1, 0.3333333, 1,
-0.270284, -1.845931, -2.158176, 0, 1, 0.3411765, 1,
-0.2665705, 0.2933598, -0.6395417, 0, 1, 0.345098, 1,
-0.265743, 1.011274, 0.314647, 0, 1, 0.3529412, 1,
-0.2651212, 1.391213, -0.1295509, 0, 1, 0.3568628, 1,
-0.2596658, 0.5533479, -0.9267885, 0, 1, 0.3647059, 1,
-0.2596343, 0.03245543, -1.224681, 0, 1, 0.3686275, 1,
-0.254878, -0.2324829, -2.416687, 0, 1, 0.3764706, 1,
-0.2533507, 0.07751942, -1.26326, 0, 1, 0.3803922, 1,
-0.2530347, 0.2759851, -0.2412877, 0, 1, 0.3882353, 1,
-0.2524276, -0.1467803, -3.523403, 0, 1, 0.3921569, 1,
-0.2508095, -1.083992, -1.906605, 0, 1, 0.4, 1,
-0.2484761, -0.7011998, -2.869062, 0, 1, 0.4078431, 1,
-0.2481671, -1.947158, -0.8106918, 0, 1, 0.4117647, 1,
-0.2430045, -0.04688494, -1.17317, 0, 1, 0.4196078, 1,
-0.2421424, -0.9552354, -1.03312, 0, 1, 0.4235294, 1,
-0.2354657, 0.8150268, -0.008205571, 0, 1, 0.4313726, 1,
-0.2334332, -1.230294, -3.500018, 0, 1, 0.4352941, 1,
-0.2292967, -0.5741098, -3.226691, 0, 1, 0.4431373, 1,
-0.2263044, -0.8284877, -3.19353, 0, 1, 0.4470588, 1,
-0.2239204, -1.237901, -1.957153, 0, 1, 0.454902, 1,
-0.2201689, -0.4364614, -2.423748, 0, 1, 0.4588235, 1,
-0.2193628, -0.2106065, -1.303622, 0, 1, 0.4666667, 1,
-0.2189421, -0.6527807, -2.465334, 0, 1, 0.4705882, 1,
-0.2144932, -1.591633, -3.311842, 0, 1, 0.4784314, 1,
-0.2140784, -0.4923255, -2.049296, 0, 1, 0.4823529, 1,
-0.2068584, 0.8031828, -0.9379259, 0, 1, 0.4901961, 1,
-0.1993945, 0.2305206, -1.455675, 0, 1, 0.4941176, 1,
-0.1965789, 2.203897, 1.149292, 0, 1, 0.5019608, 1,
-0.1934432, 0.1698459, -0.1170033, 0, 1, 0.509804, 1,
-0.1911427, 0.01809138, -1.92204, 0, 1, 0.5137255, 1,
-0.1878392, -0.07127602, -1.704238, 0, 1, 0.5215687, 1,
-0.1832699, -0.3050329, -1.765624, 0, 1, 0.5254902, 1,
-0.1823441, 1.30519, 0.3875515, 0, 1, 0.5333334, 1,
-0.1804247, 0.2873245, -2.230074, 0, 1, 0.5372549, 1,
-0.1744057, 0.434458, -1.720515, 0, 1, 0.5450981, 1,
-0.174374, -1.145346, -2.386098, 0, 1, 0.5490196, 1,
-0.1734216, -0.164206, -2.833518, 0, 1, 0.5568628, 1,
-0.1732989, 0.4738117, -0.1958982, 0, 1, 0.5607843, 1,
-0.1708169, -1.908961, -3.000532, 0, 1, 0.5686275, 1,
-0.169636, 0.4565816, -1.559484, 0, 1, 0.572549, 1,
-0.1637971, 0.2659979, 1.429369, 0, 1, 0.5803922, 1,
-0.1617438, -0.1289994, -4.767519, 0, 1, 0.5843138, 1,
-0.1611902, -1.691273, -3.715379, 0, 1, 0.5921569, 1,
-0.1603964, 0.04223006, -1.29399, 0, 1, 0.5960785, 1,
-0.1601454, 1.637631, -1.083997, 0, 1, 0.6039216, 1,
-0.1546129, -1.33835, -2.689837, 0, 1, 0.6117647, 1,
-0.1520247, -1.935304, -3.607863, 0, 1, 0.6156863, 1,
-0.1513249, -1.659283, -4.196137, 0, 1, 0.6235294, 1,
-0.1481799, 0.3811379, 0.5153106, 0, 1, 0.627451, 1,
-0.1459491, 0.7395231, -1.187392, 0, 1, 0.6352941, 1,
-0.1431186, -0.07915978, -1.92626, 0, 1, 0.6392157, 1,
-0.1383213, -0.7181036, -3.591392, 0, 1, 0.6470588, 1,
-0.134753, 0.4834777, -0.3221745, 0, 1, 0.6509804, 1,
-0.1292805, 0.7800906, 0.6170408, 0, 1, 0.6588235, 1,
-0.1264169, 0.1673258, -0.000544208, 0, 1, 0.6627451, 1,
-0.124591, 0.8813399, -1.168325, 0, 1, 0.6705883, 1,
-0.1185021, -0.2653473, -2.930538, 0, 1, 0.6745098, 1,
-0.118273, 1.130949, -0.1854402, 0, 1, 0.682353, 1,
-0.1128481, 1.315002, 0.49662, 0, 1, 0.6862745, 1,
-0.1018429, 2.489153, -0.178069, 0, 1, 0.6941177, 1,
-0.1007544, -0.8090288, -3.218084, 0, 1, 0.7019608, 1,
-0.1002967, 0.03439898, -1.754397, 0, 1, 0.7058824, 1,
-0.09532391, 0.9536573, -0.0223421, 0, 1, 0.7137255, 1,
-0.09193728, -0.4849582, -3.339381, 0, 1, 0.7176471, 1,
-0.08960697, -0.744181, -2.959865, 0, 1, 0.7254902, 1,
-0.08588866, 1.321789, -1.335867, 0, 1, 0.7294118, 1,
-0.08506574, -1.588737, -5.570374, 0, 1, 0.7372549, 1,
-0.08404798, 0.366172, -1.062219, 0, 1, 0.7411765, 1,
-0.08127639, 0.5806196, -0.168719, 0, 1, 0.7490196, 1,
-0.07416689, 1.033062, -0.3004533, 0, 1, 0.7529412, 1,
-0.06943903, -0.6904656, -4.513111, 0, 1, 0.7607843, 1,
-0.06785798, -0.03851112, -1.715487, 0, 1, 0.7647059, 1,
-0.06743575, -0.6827449, -3.756415, 0, 1, 0.772549, 1,
-0.06361045, -0.7279388, -1.548895, 0, 1, 0.7764706, 1,
-0.06162303, 1.491981, -0.8066165, 0, 1, 0.7843137, 1,
-0.05895023, -0.1853705, -4.135334, 0, 1, 0.7882353, 1,
-0.05882794, -2.042098, -4.024756, 0, 1, 0.7960784, 1,
-0.04807805, -0.4415857, -3.238282, 0, 1, 0.8039216, 1,
-0.04719059, 0.6847672, -0.3292848, 0, 1, 0.8078431, 1,
-0.04267526, -0.530218, -3.008901, 0, 1, 0.8156863, 1,
-0.04007132, -1.63999, -3.227199, 0, 1, 0.8196079, 1,
-0.03861985, -1.795866, -3.088118, 0, 1, 0.827451, 1,
-0.03001682, 1.052625, 0.03463371, 0, 1, 0.8313726, 1,
-0.02800327, -1.65409, -2.664654, 0, 1, 0.8392157, 1,
-0.02470211, 0.3960295, -1.456243, 0, 1, 0.8431373, 1,
-0.02267965, -0.09481957, -2.582346, 0, 1, 0.8509804, 1,
-0.01842766, -0.4012029, -1.944952, 0, 1, 0.854902, 1,
-0.018287, -0.3255426, -2.685562, 0, 1, 0.8627451, 1,
-0.01523259, -1.856181, -3.631495, 0, 1, 0.8666667, 1,
-0.01502088, -0.5390628, -3.128181, 0, 1, 0.8745098, 1,
-0.01445406, -0.1635028, -1.666813, 0, 1, 0.8784314, 1,
-0.01397975, -0.8271594, -1.961491, 0, 1, 0.8862745, 1,
-0.01163759, 0.6100005, 0.8251656, 0, 1, 0.8901961, 1,
-0.005306332, -0.9972173, -3.270904, 0, 1, 0.8980392, 1,
-0.002356521, 0.385871, 0.3285235, 0, 1, 0.9058824, 1,
0.0007711165, -1.306284, 1.892762, 0, 1, 0.9098039, 1,
0.005367292, -0.05171577, 2.148715, 0, 1, 0.9176471, 1,
0.01478719, -0.5406569, 1.841768, 0, 1, 0.9215686, 1,
0.01943616, 0.8792719, -1.345847, 0, 1, 0.9294118, 1,
0.02111272, -0.2072151, 1.686646, 0, 1, 0.9333333, 1,
0.02693402, 0.9380348, -1.413992, 0, 1, 0.9411765, 1,
0.02771454, 1.218708, -0.7278497, 0, 1, 0.945098, 1,
0.02960961, -0.9970022, 4.69033, 0, 1, 0.9529412, 1,
0.0362306, 0.9182733, 0.1502917, 0, 1, 0.9568627, 1,
0.03827395, -1.35892, 1.721028, 0, 1, 0.9647059, 1,
0.0410506, 0.06974117, 0.5445299, 0, 1, 0.9686275, 1,
0.04710525, -0.1162654, 2.572891, 0, 1, 0.9764706, 1,
0.05316042, -0.09956326, 2.943806, 0, 1, 0.9803922, 1,
0.05418272, 0.04617843, 0.06415121, 0, 1, 0.9882353, 1,
0.05703256, 0.8207405, -1.612528, 0, 1, 0.9921569, 1,
0.06317934, -0.2744784, -0.5575333, 0, 1, 1, 1,
0.06510811, 0.8811652, 0.5567608, 0, 0.9921569, 1, 1,
0.0675703, -0.4651687, 3.138509, 0, 0.9882353, 1, 1,
0.06916188, 1.355851, -0.2965603, 0, 0.9803922, 1, 1,
0.07010452, 1.011021, -1.180959, 0, 0.9764706, 1, 1,
0.07082419, 0.2767793, -0.01959052, 0, 0.9686275, 1, 1,
0.07152106, 0.5907945, -2.20832, 0, 0.9647059, 1, 1,
0.07798375, 1.180214, 0.3567773, 0, 0.9568627, 1, 1,
0.07798872, 1.429211, -0.1047696, 0, 0.9529412, 1, 1,
0.08328192, 1.05075, -0.7310296, 0, 0.945098, 1, 1,
0.08911219, 1.080623, -0.9700345, 0, 0.9411765, 1, 1,
0.08979958, 0.2989661, 0.1911835, 0, 0.9333333, 1, 1,
0.09293222, -1.626407, 3.245297, 0, 0.9294118, 1, 1,
0.09857348, 1.307702, -0.1792355, 0, 0.9215686, 1, 1,
0.09970781, 0.1376944, 2.175344, 0, 0.9176471, 1, 1,
0.1040376, 0.2279713, -0.09100749, 0, 0.9098039, 1, 1,
0.1049257, 0.3549963, -0.6934419, 0, 0.9058824, 1, 1,
0.1085729, -0.9569966, 4.233378, 0, 0.8980392, 1, 1,
0.1132255, 1.242193, 0.5534382, 0, 0.8901961, 1, 1,
0.1137823, 0.2681836, -0.5867853, 0, 0.8862745, 1, 1,
0.11633, 0.5869948, 0.1801298, 0, 0.8784314, 1, 1,
0.1169417, -1.476827, 3.692112, 0, 0.8745098, 1, 1,
0.1172299, 0.08300028, 1.068088, 0, 0.8666667, 1, 1,
0.1200388, -0.01066303, 2.130661, 0, 0.8627451, 1, 1,
0.1295091, -1.180008, 2.701808, 0, 0.854902, 1, 1,
0.1300717, 2.893002, -0.9145004, 0, 0.8509804, 1, 1,
0.1315366, 0.6585427, 0.3331253, 0, 0.8431373, 1, 1,
0.13401, -1.473304, 2.152201, 0, 0.8392157, 1, 1,
0.1343891, -1.104265, 3.082558, 0, 0.8313726, 1, 1,
0.1384015, -0.2396016, 2.528992, 0, 0.827451, 1, 1,
0.1414515, 1.046885, -0.9038505, 0, 0.8196079, 1, 1,
0.1434748, 1.277837, -1.598863, 0, 0.8156863, 1, 1,
0.1468813, 1.636989, 0.3396241, 0, 0.8078431, 1, 1,
0.1504204, 1.295422, -0.9273484, 0, 0.8039216, 1, 1,
0.1536962, -0.7757782, 3.103716, 0, 0.7960784, 1, 1,
0.1537385, -0.8596925, 2.519265, 0, 0.7882353, 1, 1,
0.1557092, -0.1056882, 2.732347, 0, 0.7843137, 1, 1,
0.1635578, 1.734383, -0.7695629, 0, 0.7764706, 1, 1,
0.1706129, -1.013898, 3.132892, 0, 0.772549, 1, 1,
0.1721827, 0.06141317, 1.746669, 0, 0.7647059, 1, 1,
0.1733889, -0.5268603, 2.499123, 0, 0.7607843, 1, 1,
0.1818756, -0.2404432, 2.751485, 0, 0.7529412, 1, 1,
0.1893525, 0.5882872, 0.8001357, 0, 0.7490196, 1, 1,
0.1909089, 0.08629531, -0.7151512, 0, 0.7411765, 1, 1,
0.1909995, 1.559889, -0.3480313, 0, 0.7372549, 1, 1,
0.1924847, -1.331741, 3.762162, 0, 0.7294118, 1, 1,
0.1952854, 1.718104, -1.487737, 0, 0.7254902, 1, 1,
0.1982996, -1.613057, 1.495842, 0, 0.7176471, 1, 1,
0.2005306, 0.5483009, -0.1453668, 0, 0.7137255, 1, 1,
0.2037547, -1.422304, 3.325431, 0, 0.7058824, 1, 1,
0.2047622, -0.8199865, 3.85193, 0, 0.6980392, 1, 1,
0.2076491, 0.2124903, 0.8475195, 0, 0.6941177, 1, 1,
0.2087376, -1.71563, 5.112149, 0, 0.6862745, 1, 1,
0.2087431, 0.3403011, -0.01259066, 0, 0.682353, 1, 1,
0.2108458, 0.6758848, 0.6108126, 0, 0.6745098, 1, 1,
0.2154859, 1.997307, -0.8871344, 0, 0.6705883, 1, 1,
0.2212829, -0.5440808, 2.125315, 0, 0.6627451, 1, 1,
0.2215182, -0.8541321, 0.9592252, 0, 0.6588235, 1, 1,
0.2221479, 1.309627, -0.2622456, 0, 0.6509804, 1, 1,
0.2267836, -0.6292827, 2.778548, 0, 0.6470588, 1, 1,
0.2273529, -1.459676, 4.477952, 0, 0.6392157, 1, 1,
0.2283936, -1.595482, 1.637877, 0, 0.6352941, 1, 1,
0.2295841, -0.6612758, 3.852917, 0, 0.627451, 1, 1,
0.229675, -0.4343288, 3.320327, 0, 0.6235294, 1, 1,
0.2308083, -0.7380558, 3.10179, 0, 0.6156863, 1, 1,
0.2334797, 0.9210786, 1.10836, 0, 0.6117647, 1, 1,
0.2339677, 0.9132972, 0.3024712, 0, 0.6039216, 1, 1,
0.2340911, 0.8748102, 0.7694491, 0, 0.5960785, 1, 1,
0.2354056, -0.003274339, 0.1271645, 0, 0.5921569, 1, 1,
0.2358981, -0.5700495, 2.469778, 0, 0.5843138, 1, 1,
0.237934, -0.7515897, 4.676128, 0, 0.5803922, 1, 1,
0.2470526, 0.9583932, -0.01848768, 0, 0.572549, 1, 1,
0.2487057, -1.882356, 0.7557852, 0, 0.5686275, 1, 1,
0.2511917, -0.6339207, 3.302989, 0, 0.5607843, 1, 1,
0.2529449, 0.1222, 3.497853, 0, 0.5568628, 1, 1,
0.2629218, -0.2278551, 1.283409, 0, 0.5490196, 1, 1,
0.2636631, -0.6139611, 1.617405, 0, 0.5450981, 1, 1,
0.2677951, 1.883029, -0.6235719, 0, 0.5372549, 1, 1,
0.2678615, 0.2822548, 1.271359, 0, 0.5333334, 1, 1,
0.2686851, -0.6070822, 2.948074, 0, 0.5254902, 1, 1,
0.269235, -0.3794802, 3.627593, 0, 0.5215687, 1, 1,
0.2737428, 0.8715342, 0.9057277, 0, 0.5137255, 1, 1,
0.2752042, -0.2868284, 2.69699, 0, 0.509804, 1, 1,
0.2775117, 0.2821465, -1.3248, 0, 0.5019608, 1, 1,
0.2776472, 1.161121, 1.369187, 0, 0.4941176, 1, 1,
0.2778945, 0.4450245, -0.4678637, 0, 0.4901961, 1, 1,
0.2788379, 1.358105, 0.8791112, 0, 0.4823529, 1, 1,
0.2792596, 0.2410086, 0.2924072, 0, 0.4784314, 1, 1,
0.2866917, 0.6740798, 1.05294, 0, 0.4705882, 1, 1,
0.2868562, -0.05111227, 1.946377, 0, 0.4666667, 1, 1,
0.2934964, 0.7375192, 0.09224424, 0, 0.4588235, 1, 1,
0.2946407, -1.387167, 2.443017, 0, 0.454902, 1, 1,
0.2950508, -0.08016356, 1.505433, 0, 0.4470588, 1, 1,
0.2953554, -1.79037, 2.55397, 0, 0.4431373, 1, 1,
0.2967928, -0.1536095, 0.7480131, 0, 0.4352941, 1, 1,
0.2973936, -0.2711852, 1.651536, 0, 0.4313726, 1, 1,
0.3045952, 0.3806494, -0.9553517, 0, 0.4235294, 1, 1,
0.3067991, -0.03939077, 0.5216439, 0, 0.4196078, 1, 1,
0.3072334, -1.212909, 1.027508, 0, 0.4117647, 1, 1,
0.309443, 0.7060009, -0.3509311, 0, 0.4078431, 1, 1,
0.3100295, -0.311134, 1.133255, 0, 0.4, 1, 1,
0.3109192, 0.3757617, 2.0188, 0, 0.3921569, 1, 1,
0.3122449, -0.01100556, 1.683011, 0, 0.3882353, 1, 1,
0.3134467, 0.1897718, 2.092079, 0, 0.3803922, 1, 1,
0.3151751, -0.4889535, 3.373396, 0, 0.3764706, 1, 1,
0.3154201, -0.6479243, 4.222347, 0, 0.3686275, 1, 1,
0.3205734, 0.3610166, 0.473539, 0, 0.3647059, 1, 1,
0.3207442, -1.013419, 2.62547, 0, 0.3568628, 1, 1,
0.3213904, -0.07990047, 1.282848, 0, 0.3529412, 1, 1,
0.322917, 0.03607247, 1.575072, 0, 0.345098, 1, 1,
0.3270003, 2.714614, 0.3949673, 0, 0.3411765, 1, 1,
0.3322838, 1.046298, 1.196486, 0, 0.3333333, 1, 1,
0.334855, 0.2078539, 0.3849101, 0, 0.3294118, 1, 1,
0.3363952, 0.1427831, 2.027221, 0, 0.3215686, 1, 1,
0.3373837, -0.2746634, 2.221022, 0, 0.3176471, 1, 1,
0.3382075, -1.965214, 2.967453, 0, 0.3098039, 1, 1,
0.3387666, -0.7643564, 1.50998, 0, 0.3058824, 1, 1,
0.3395211, -0.7107766, 1.404624, 0, 0.2980392, 1, 1,
0.341263, 0.6246422, -0.2431349, 0, 0.2901961, 1, 1,
0.3437617, -0.9345537, 0.9167879, 0, 0.2862745, 1, 1,
0.344032, 2.079707, 2.765164, 0, 0.2784314, 1, 1,
0.3440882, 0.523562, 0.6149804, 0, 0.2745098, 1, 1,
0.3458453, 0.9401603, 1.215484, 0, 0.2666667, 1, 1,
0.3501401, 0.07979562, 1.638368, 0, 0.2627451, 1, 1,
0.3532989, -1.069379, 2.949159, 0, 0.254902, 1, 1,
0.3535419, -0.1434801, 2.363561, 0, 0.2509804, 1, 1,
0.3545514, 1.243361, -0.009238365, 0, 0.2431373, 1, 1,
0.3553266, 0.186098, 1.953258, 0, 0.2392157, 1, 1,
0.355462, 1.359118, 1.647294, 0, 0.2313726, 1, 1,
0.3574712, 0.2305839, 0.1342431, 0, 0.227451, 1, 1,
0.3591445, 0.1189037, 0.2215514, 0, 0.2196078, 1, 1,
0.3598154, 1.122858, -0.4658509, 0, 0.2156863, 1, 1,
0.3672953, 2.498741, -1.551445, 0, 0.2078431, 1, 1,
0.368347, -0.6719187, 2.682853, 0, 0.2039216, 1, 1,
0.3726308, 0.5078576, 0.9900407, 0, 0.1960784, 1, 1,
0.3735398, -0.1133512, 1.482266, 0, 0.1882353, 1, 1,
0.3746389, -1.330944, 1.557764, 0, 0.1843137, 1, 1,
0.3771227, 0.0650913, 1.953032, 0, 0.1764706, 1, 1,
0.3795791, 0.8833067, 0.2776524, 0, 0.172549, 1, 1,
0.379673, -0.5890285, 2.88118, 0, 0.1647059, 1, 1,
0.3818107, 0.1283603, 1.347682, 0, 0.1607843, 1, 1,
0.3857355, -0.4224188, 1.990136, 0, 0.1529412, 1, 1,
0.3859963, 0.409084, 2.67955, 0, 0.1490196, 1, 1,
0.3863263, 0.5868769, 0.9634434, 0, 0.1411765, 1, 1,
0.3900389, 0.3486703, 0.8216588, 0, 0.1372549, 1, 1,
0.3943104, -1.400133, 3.917294, 0, 0.1294118, 1, 1,
0.4011655, -0.6395005, 3.544014, 0, 0.1254902, 1, 1,
0.4024571, -0.279864, 1.401519, 0, 0.1176471, 1, 1,
0.4040883, -0.01887267, 3.116252, 0, 0.1137255, 1, 1,
0.4042002, 0.7194538, 0.4656162, 0, 0.1058824, 1, 1,
0.4053609, 0.9622182, 1.053216, 0, 0.09803922, 1, 1,
0.409164, -0.1038365, 1.986098, 0, 0.09411765, 1, 1,
0.4186627, -1.382974, 2.735096, 0, 0.08627451, 1, 1,
0.4212598, -2.600246, 0.7831205, 0, 0.08235294, 1, 1,
0.422592, -0.2592362, 2.856948, 0, 0.07450981, 1, 1,
0.4244835, -1.427533, 2.422032, 0, 0.07058824, 1, 1,
0.4293354, 0.02886847, 1.825486, 0, 0.0627451, 1, 1,
0.4299991, 0.5018458, 0.8795003, 0, 0.05882353, 1, 1,
0.4335979, -1.010695, 3.248998, 0, 0.05098039, 1, 1,
0.4365572, -0.6538023, 2.185741, 0, 0.04705882, 1, 1,
0.4367922, 1.708907, 0.0007787131, 0, 0.03921569, 1, 1,
0.4372332, -0.388373, 3.195546, 0, 0.03529412, 1, 1,
0.4402074, 0.1788748, -0.9594418, 0, 0.02745098, 1, 1,
0.4456859, -1.202037, 3.50388, 0, 0.02352941, 1, 1,
0.4467648, 0.4241344, -0.07843196, 0, 0.01568628, 1, 1,
0.4565243, 1.195387, -0.9555511, 0, 0.01176471, 1, 1,
0.4615062, -0.1913869, 2.847703, 0, 0.003921569, 1, 1,
0.4622215, 0.1477345, 1.985299, 0.003921569, 0, 1, 1,
0.4632415, -0.2991575, 3.401339, 0.007843138, 0, 1, 1,
0.4634297, -1.136357, 1.858435, 0.01568628, 0, 1, 1,
0.4644935, 1.345229, -0.1964575, 0.01960784, 0, 1, 1,
0.4648523, 0.6926744, -0.05997153, 0.02745098, 0, 1, 1,
0.4677942, -0.4785331, 0.4968054, 0.03137255, 0, 1, 1,
0.4740131, -0.3054551, 3.432085, 0.03921569, 0, 1, 1,
0.4742863, -0.2244325, 1.754906, 0.04313726, 0, 1, 1,
0.4756939, 0.4725399, 0.2998966, 0.05098039, 0, 1, 1,
0.4783693, -0.5051029, 1.320236, 0.05490196, 0, 1, 1,
0.4799299, 0.01553186, 1.172551, 0.0627451, 0, 1, 1,
0.4818411, 1.655418, 0.2272941, 0.06666667, 0, 1, 1,
0.482011, 0.3850817, -0.675256, 0.07450981, 0, 1, 1,
0.4826923, 0.2370289, -0.06712481, 0.07843138, 0, 1, 1,
0.4846416, -1.216534, 0.4859743, 0.08627451, 0, 1, 1,
0.4866325, -0.5187122, 5.256402, 0.09019608, 0, 1, 1,
0.4872971, 1.757009, 0.921731, 0.09803922, 0, 1, 1,
0.4880586, -0.02082456, 0.6610872, 0.1058824, 0, 1, 1,
0.488533, 0.9753861, 1.526282, 0.1098039, 0, 1, 1,
0.490833, 0.811976, 0.1169473, 0.1176471, 0, 1, 1,
0.4928797, -1.302309, 1.329318, 0.1215686, 0, 1, 1,
0.5004555, -0.2893813, 0.1633478, 0.1294118, 0, 1, 1,
0.5030659, 2.102737, 0.4279734, 0.1333333, 0, 1, 1,
0.5072438, 0.1064745, 1.313322, 0.1411765, 0, 1, 1,
0.5105299, -0.6343993, 1.480528, 0.145098, 0, 1, 1,
0.5169577, 0.7913414, 2.197105, 0.1529412, 0, 1, 1,
0.5213744, 0.430319, 2.48338, 0.1568628, 0, 1, 1,
0.5244269, 0.1625549, 1.382819, 0.1647059, 0, 1, 1,
0.5267203, -0.2450882, 2.908544, 0.1686275, 0, 1, 1,
0.5276509, -1.652014, 4.448507, 0.1764706, 0, 1, 1,
0.5284788, 0.5262771, 2.214724, 0.1803922, 0, 1, 1,
0.5295395, -0.6961467, 3.820211, 0.1882353, 0, 1, 1,
0.5316187, -1.372401, 3.659958, 0.1921569, 0, 1, 1,
0.5320017, -0.8422557, 0.2505, 0.2, 0, 1, 1,
0.5385993, -0.1563537, 3.337308, 0.2078431, 0, 1, 1,
0.5389585, 1.414243, 0.7845832, 0.2117647, 0, 1, 1,
0.5442878, -1.974427, 3.691176, 0.2196078, 0, 1, 1,
0.5493761, 2.192525, -0.1315641, 0.2235294, 0, 1, 1,
0.5509802, -0.2994641, 0.4660041, 0.2313726, 0, 1, 1,
0.5574378, -1.316769, 1.588404, 0.2352941, 0, 1, 1,
0.5592061, -1.977886, 2.796983, 0.2431373, 0, 1, 1,
0.5592823, -0.2968484, 2.361458, 0.2470588, 0, 1, 1,
0.56441, 1.214986, 0.6230568, 0.254902, 0, 1, 1,
0.5722258, -0.4635125, 2.042827, 0.2588235, 0, 1, 1,
0.57333, 1.006164, 1.722449, 0.2666667, 0, 1, 1,
0.5758895, 0.9480682, 0.9240513, 0.2705882, 0, 1, 1,
0.5820687, 1.760035, -0.2470206, 0.2784314, 0, 1, 1,
0.5834077, -0.9899904, 3.731883, 0.282353, 0, 1, 1,
0.5883552, 1.42093, -0.2560638, 0.2901961, 0, 1, 1,
0.5887967, 0.9149321, 0.7654745, 0.2941177, 0, 1, 1,
0.5894701, 0.4526813, 1.150629, 0.3019608, 0, 1, 1,
0.5962713, 1.478534, 0.330997, 0.3098039, 0, 1, 1,
0.6045911, -1.875977, 2.732559, 0.3137255, 0, 1, 1,
0.6076115, -1.629621, 2.229151, 0.3215686, 0, 1, 1,
0.6088189, -0.09499257, 2.286884, 0.3254902, 0, 1, 1,
0.610655, 0.9752543, -0.2169429, 0.3333333, 0, 1, 1,
0.6127435, 0.4166271, 1.241473, 0.3372549, 0, 1, 1,
0.6148745, -1.163823, 3.240093, 0.345098, 0, 1, 1,
0.6156958, -0.2419298, 1.534501, 0.3490196, 0, 1, 1,
0.6194547, 0.8258088, 0.2515163, 0.3568628, 0, 1, 1,
0.6236721, -0.2035614, 1.18366, 0.3607843, 0, 1, 1,
0.6255868, -0.07024083, 1.265939, 0.3686275, 0, 1, 1,
0.6268843, 0.5247175, 1.457, 0.372549, 0, 1, 1,
0.6292352, -0.6681077, 2.183214, 0.3803922, 0, 1, 1,
0.6309569, 0.2636655, 0.7663083, 0.3843137, 0, 1, 1,
0.6320907, -1.058876, 1.278683, 0.3921569, 0, 1, 1,
0.637329, 0.4789971, 3.993247, 0.3960784, 0, 1, 1,
0.6376169, 0.6464882, 0.3932628, 0.4039216, 0, 1, 1,
0.6382817, 2.110364, 1.299232, 0.4117647, 0, 1, 1,
0.6385203, 0.6254727, 0.89711, 0.4156863, 0, 1, 1,
0.6398338, 1.163728, -0.5718821, 0.4235294, 0, 1, 1,
0.6503859, 0.7598386, 1.273304, 0.427451, 0, 1, 1,
0.654157, 0.5964699, -0.04615977, 0.4352941, 0, 1, 1,
0.6546011, 0.1210881, -0.1934131, 0.4392157, 0, 1, 1,
0.6634198, -0.8180692, 2.649981, 0.4470588, 0, 1, 1,
0.6757358, -0.7884354, 2.216475, 0.4509804, 0, 1, 1,
0.6818209, -0.361818, 0.3955793, 0.4588235, 0, 1, 1,
0.6857356, 1.776589, 0.3507027, 0.4627451, 0, 1, 1,
0.6857551, 0.06100746, 0.5208628, 0.4705882, 0, 1, 1,
0.686276, -0.935929, 4.611826, 0.4745098, 0, 1, 1,
0.6866001, 0.2557726, 2.399449, 0.4823529, 0, 1, 1,
0.6976693, -0.8631842, 1.822384, 0.4862745, 0, 1, 1,
0.7041177, 0.3137763, 1.77313, 0.4941176, 0, 1, 1,
0.7079563, 0.1994149, 0.9619316, 0.5019608, 0, 1, 1,
0.7194566, 0.6937457, 0.6599302, 0.5058824, 0, 1, 1,
0.7226704, 1.761818, -0.1514183, 0.5137255, 0, 1, 1,
0.7269658, -0.7358212, 2.916075, 0.5176471, 0, 1, 1,
0.7271115, 0.9088961, 0.9768174, 0.5254902, 0, 1, 1,
0.7273812, 0.3014032, 1.433964, 0.5294118, 0, 1, 1,
0.7338899, 0.5017013, 0.444525, 0.5372549, 0, 1, 1,
0.734188, -0.005487273, 1.44214, 0.5411765, 0, 1, 1,
0.7362213, 0.07521476, 1.495549, 0.5490196, 0, 1, 1,
0.7397007, 0.7830099, -0.2051838, 0.5529412, 0, 1, 1,
0.7408783, 0.6196716, 1.864424, 0.5607843, 0, 1, 1,
0.7431347, -0.1609219, 2.430717, 0.5647059, 0, 1, 1,
0.7464418, -1.439304, 3.197998, 0.572549, 0, 1, 1,
0.7469553, -1.100947, 1.234631, 0.5764706, 0, 1, 1,
0.7472678, -2.305107, 2.688007, 0.5843138, 0, 1, 1,
0.748786, 2.614053, -1.554671, 0.5882353, 0, 1, 1,
0.7545049, 2.040946, 0.638293, 0.5960785, 0, 1, 1,
0.755789, -0.8750164, 1.906434, 0.6039216, 0, 1, 1,
0.756783, -2.792063, 2.124626, 0.6078432, 0, 1, 1,
0.7586679, 0.8460135, -0.5037362, 0.6156863, 0, 1, 1,
0.7613158, 0.3784238, -0.4820697, 0.6196079, 0, 1, 1,
0.7635688, 0.7034097, 0.3212788, 0.627451, 0, 1, 1,
0.7744896, 1.87417, -0.4143931, 0.6313726, 0, 1, 1,
0.7745906, -1.171903, 2.283038, 0.6392157, 0, 1, 1,
0.7771807, 0.9261577, -0.8877258, 0.6431373, 0, 1, 1,
0.7797862, 0.4452512, 1.339005, 0.6509804, 0, 1, 1,
0.7816936, -0.450317, 3.801594, 0.654902, 0, 1, 1,
0.7852928, 1.383761, 2.478816, 0.6627451, 0, 1, 1,
0.7868009, 0.7450425, 0.6670852, 0.6666667, 0, 1, 1,
0.7893059, 1.434199, 0.04000189, 0.6745098, 0, 1, 1,
0.7977403, 0.7386192, 1.179081, 0.6784314, 0, 1, 1,
0.7993913, -2.578306, 3.499893, 0.6862745, 0, 1, 1,
0.8009455, -0.02238297, 2.831761, 0.6901961, 0, 1, 1,
0.8046393, -0.4819675, 3.392972, 0.6980392, 0, 1, 1,
0.8051379, 1.354649, -0.5356477, 0.7058824, 0, 1, 1,
0.8085166, 0.05146362, 1.266057, 0.7098039, 0, 1, 1,
0.8113229, 1.488718, 0.473133, 0.7176471, 0, 1, 1,
0.8121747, -0.4280514, 2.624429, 0.7215686, 0, 1, 1,
0.8151442, -1.72465, 2.697305, 0.7294118, 0, 1, 1,
0.8181364, -2.013021, 3.027358, 0.7333333, 0, 1, 1,
0.8202919, 0.182791, 0.08717433, 0.7411765, 0, 1, 1,
0.8246442, -1.110315, 3.203301, 0.7450981, 0, 1, 1,
0.827688, 0.09794366, 1.961119, 0.7529412, 0, 1, 1,
0.8297238, -1.354616, 0.2554339, 0.7568628, 0, 1, 1,
0.8318992, -0.9402004, 2.691838, 0.7647059, 0, 1, 1,
0.8423727, 0.4221641, 2.82383, 0.7686275, 0, 1, 1,
0.8428416, -0.8123842, 2.696502, 0.7764706, 0, 1, 1,
0.8432437, -0.6951293, 2.273587, 0.7803922, 0, 1, 1,
0.8439649, 0.203966, 2.515546, 0.7882353, 0, 1, 1,
0.8459622, -0.9094748, 2.684192, 0.7921569, 0, 1, 1,
0.8493778, 0.5630534, 2.191975, 0.8, 0, 1, 1,
0.8519915, -1.083844, 2.136081, 0.8078431, 0, 1, 1,
0.8526236, 0.262724, 0.3880847, 0.8117647, 0, 1, 1,
0.8530046, 0.3915865, 0.4090067, 0.8196079, 0, 1, 1,
0.8653642, -0.1660121, 0.8911164, 0.8235294, 0, 1, 1,
0.8708582, 0.4803562, 2.122296, 0.8313726, 0, 1, 1,
0.8737286, -0.4808901, 3.143122, 0.8352941, 0, 1, 1,
0.8741235, 1.49204, 1.312047, 0.8431373, 0, 1, 1,
0.8747872, 1.443956, 0.09411089, 0.8470588, 0, 1, 1,
0.8770431, -0.1623099, 2.008361, 0.854902, 0, 1, 1,
0.8781069, 1.044982, 1.09961, 0.8588235, 0, 1, 1,
0.8782018, 0.5821339, 2.306854, 0.8666667, 0, 1, 1,
0.8807339, 0.05687771, 0.8198922, 0.8705882, 0, 1, 1,
0.8839996, -0.1882881, 2.923021, 0.8784314, 0, 1, 1,
0.8846954, -0.6291018, 2.407253, 0.8823529, 0, 1, 1,
0.8875986, 1.147802, -0.214278, 0.8901961, 0, 1, 1,
0.8905071, 0.1870761, 1.810674, 0.8941177, 0, 1, 1,
0.8907227, 1.215685, 0.6126688, 0.9019608, 0, 1, 1,
0.8921383, 0.03447209, 2.130313, 0.9098039, 0, 1, 1,
0.8948971, 1.198537, 0.951237, 0.9137255, 0, 1, 1,
0.9034702, 0.1841391, 2.225798, 0.9215686, 0, 1, 1,
0.9066544, 2.682884, -1.046216, 0.9254902, 0, 1, 1,
0.9083895, -1.045752, 2.426981, 0.9333333, 0, 1, 1,
0.9084645, -0.8122735, 2.641187, 0.9372549, 0, 1, 1,
0.9101335, -1.481015, 3.192457, 0.945098, 0, 1, 1,
0.9136781, 0.9513754, 0.9709385, 0.9490196, 0, 1, 1,
0.9178122, 0.9836917, 2.534901, 0.9568627, 0, 1, 1,
0.9234062, -0.4870807, 2.060992, 0.9607843, 0, 1, 1,
0.9270365, -0.9165393, 3.750581, 0.9686275, 0, 1, 1,
0.9289317, 1.585571, 0.6520967, 0.972549, 0, 1, 1,
0.9332853, 1.162943, 1.819549, 0.9803922, 0, 1, 1,
0.935159, 0.6479266, 1.335033, 0.9843137, 0, 1, 1,
0.935353, 0.3268991, 1.945836, 0.9921569, 0, 1, 1,
0.93557, 0.8854292, 2.322846, 0.9960784, 0, 1, 1,
0.937613, -0.6691235, 2.908552, 1, 0, 0.9960784, 1,
0.9392154, -0.09088077, 1.55345, 1, 0, 0.9882353, 1,
0.9466913, -0.5861367, 2.657151, 1, 0, 0.9843137, 1,
0.9500563, -0.3750268, 0.1317223, 1, 0, 0.9764706, 1,
0.9515296, 0.1003107, 1.372283, 1, 0, 0.972549, 1,
0.9557917, -0.6491318, 0.6467436, 1, 0, 0.9647059, 1,
0.9586097, -0.02355406, 2.174342, 1, 0, 0.9607843, 1,
0.9590303, -0.5555384, 1.19016, 1, 0, 0.9529412, 1,
0.9634814, 0.7861803, 0.1026963, 1, 0, 0.9490196, 1,
0.9710269, -0.03211862, 1.744041, 1, 0, 0.9411765, 1,
0.9745573, 0.03267898, 1.544263, 1, 0, 0.9372549, 1,
0.9753605, -0.05339929, 1.910476, 1, 0, 0.9294118, 1,
0.975781, -2.585554, 3.667914, 1, 0, 0.9254902, 1,
0.9781616, 0.6831839, 0.157558, 1, 0, 0.9176471, 1,
0.9864459, -1.068887, 1.511866, 1, 0, 0.9137255, 1,
0.9890121, -0.04963926, 3.656525, 1, 0, 0.9058824, 1,
1.005706, 1.224985, 0.05929145, 1, 0, 0.9019608, 1,
1.012629, -1.351725, 4.928765, 1, 0, 0.8941177, 1,
1.015796, -0.8342729, 2.292652, 1, 0, 0.8862745, 1,
1.016314, -0.5197506, -0.02793181, 1, 0, 0.8823529, 1,
1.016484, 0.7595991, -0.4585986, 1, 0, 0.8745098, 1,
1.016824, -0.3012143, 3.933493, 1, 0, 0.8705882, 1,
1.032707, 0.633736, 0.5995044, 1, 0, 0.8627451, 1,
1.033319, -1.544332, 3.166544, 1, 0, 0.8588235, 1,
1.044312, -1.514226, 0.3037531, 1, 0, 0.8509804, 1,
1.046793, 0.4010868, 0.983917, 1, 0, 0.8470588, 1,
1.056931, -0.2394011, 0.8768468, 1, 0, 0.8392157, 1,
1.058123, -0.4578575, 0.8957662, 1, 0, 0.8352941, 1,
1.059817, -0.2101448, 0.970757, 1, 0, 0.827451, 1,
1.060253, -1.549403, 2.484192, 1, 0, 0.8235294, 1,
1.064513, 1.06269, 1.470315, 1, 0, 0.8156863, 1,
1.072313, 0.920274, 1.136673, 1, 0, 0.8117647, 1,
1.081081, -0.5384285, 3.681307, 1, 0, 0.8039216, 1,
1.087297, -1.067236, 3.099826, 1, 0, 0.7960784, 1,
1.10207, -0.653037, 3.466616, 1, 0, 0.7921569, 1,
1.104696, 1.207784, -0.784548, 1, 0, 0.7843137, 1,
1.109675, 0.1541462, 0.9434224, 1, 0, 0.7803922, 1,
1.112901, 1.009006, 0.7948612, 1, 0, 0.772549, 1,
1.120378, 0.5486479, 0.9640641, 1, 0, 0.7686275, 1,
1.122126, -0.5346901, 1.748707, 1, 0, 0.7607843, 1,
1.123693, 2.860852, -0.1647564, 1, 0, 0.7568628, 1,
1.129359, 1.920116, 0.6667829, 1, 0, 0.7490196, 1,
1.129853, 1.781147, 1.260276, 1, 0, 0.7450981, 1,
1.132765, 1.017211, -0.3165944, 1, 0, 0.7372549, 1,
1.135251, -0.722487, 2.241981, 1, 0, 0.7333333, 1,
1.135469, 1.419089, -0.5403345, 1, 0, 0.7254902, 1,
1.148151, -0.4810806, 2.52582, 1, 0, 0.7215686, 1,
1.152032, -0.4480253, 2.331462, 1, 0, 0.7137255, 1,
1.155406, 0.005095207, 2.082889, 1, 0, 0.7098039, 1,
1.164193, -0.303582, 1.223594, 1, 0, 0.7019608, 1,
1.165005, -0.141158, 1.194089, 1, 0, 0.6941177, 1,
1.166088, -0.1445786, 2.462105, 1, 0, 0.6901961, 1,
1.170223, -1.469642, 3.515455, 1, 0, 0.682353, 1,
1.172103, 0.1163004, -0.002081884, 1, 0, 0.6784314, 1,
1.183072, -1.351623, 0.8236558, 1, 0, 0.6705883, 1,
1.190742, 0.3722648, 2.864242, 1, 0, 0.6666667, 1,
1.193625, 1.067507, 1.219991, 1, 0, 0.6588235, 1,
1.195702, 1.272875, 1.114267, 1, 0, 0.654902, 1,
1.197063, 0.4443277, 2.026813, 1, 0, 0.6470588, 1,
1.202664, -1.534061, 3.262923, 1, 0, 0.6431373, 1,
1.207569, -1.129257, 4.43413, 1, 0, 0.6352941, 1,
1.208603, 0.8321382, 1.131566, 1, 0, 0.6313726, 1,
1.209569, 0.7748217, 1.646175, 1, 0, 0.6235294, 1,
1.211253, 1.671466, 0.9043083, 1, 0, 0.6196079, 1,
1.218198, 1.524905, 1.308404, 1, 0, 0.6117647, 1,
1.235262, 0.3152649, 1.707654, 1, 0, 0.6078432, 1,
1.259853, 0.588129, 0.5615751, 1, 0, 0.6, 1,
1.272283, -0.1661107, 3.042119, 1, 0, 0.5921569, 1,
1.276194, -1.312375, 2.550759, 1, 0, 0.5882353, 1,
1.276675, 0.2201723, 2.272696, 1, 0, 0.5803922, 1,
1.283322, 0.9450646, 2.033414, 1, 0, 0.5764706, 1,
1.283892, -0.8225504, 2.290427, 1, 0, 0.5686275, 1,
1.301937, -1.144592, 1.878592, 1, 0, 0.5647059, 1,
1.316453, -0.9668888, 1.343837, 1, 0, 0.5568628, 1,
1.327914, 0.06770084, 2.310852, 1, 0, 0.5529412, 1,
1.354156, 0.4220442, 1.293434, 1, 0, 0.5450981, 1,
1.356463, 1.09161, 0.3959367, 1, 0, 0.5411765, 1,
1.359228, -1.897109, 3.122723, 1, 0, 0.5333334, 1,
1.368843, -0.01276841, 1.742888, 1, 0, 0.5294118, 1,
1.373443, -0.9349026, 3.585814, 1, 0, 0.5215687, 1,
1.389486, -1.930396, 2.982947, 1, 0, 0.5176471, 1,
1.397552, 0.1246233, 2.133316, 1, 0, 0.509804, 1,
1.405901, -2.803919, 1.625049, 1, 0, 0.5058824, 1,
1.423691, -1.973058, 1.797103, 1, 0, 0.4980392, 1,
1.432199, 0.7340544, 1.192812, 1, 0, 0.4901961, 1,
1.435442, 0.7385382, 0.4370894, 1, 0, 0.4862745, 1,
1.440679, 0.7691098, 2.395972, 1, 0, 0.4784314, 1,
1.446608, -0.429912, 1.25692, 1, 0, 0.4745098, 1,
1.446668, 0.4976981, 1.26146, 1, 0, 0.4666667, 1,
1.447876, -0.433886, 2.228812, 1, 0, 0.4627451, 1,
1.451111, 0.5394216, 2.115491, 1, 0, 0.454902, 1,
1.451239, 0.7182124, 2.097428, 1, 0, 0.4509804, 1,
1.461841, -0.2622553, 2.881181, 1, 0, 0.4431373, 1,
1.487376, 1.964099, 0.3922782, 1, 0, 0.4392157, 1,
1.489698, 0.6170508, -0.7543779, 1, 0, 0.4313726, 1,
1.506419, -0.1689067, 1.170931, 1, 0, 0.427451, 1,
1.510248, 1.054491, 2.611598, 1, 0, 0.4196078, 1,
1.519284, 0.5527997, 2.238498, 1, 0, 0.4156863, 1,
1.535212, -1.116054, 2.915019, 1, 0, 0.4078431, 1,
1.552763, -0.5049288, 1.351434, 1, 0, 0.4039216, 1,
1.569383, -0.166926, 0.1387836, 1, 0, 0.3960784, 1,
1.569877, 0.06213919, 1.913891, 1, 0, 0.3882353, 1,
1.576445, -1.059235, 2.389506, 1, 0, 0.3843137, 1,
1.579615, 0.7355978, -0.4669475, 1, 0, 0.3764706, 1,
1.599579, -1.040717, 0.08793476, 1, 0, 0.372549, 1,
1.605193, 0.1877386, 1.21169, 1, 0, 0.3647059, 1,
1.609261, 0.2112508, 2.29874, 1, 0, 0.3607843, 1,
1.611402, -2.435804, 2.312615, 1, 0, 0.3529412, 1,
1.612196, 1.283695, 2.063982, 1, 0, 0.3490196, 1,
1.613658, 0.6013893, 1.713261, 1, 0, 0.3411765, 1,
1.615339, 1.037026, 0.4454912, 1, 0, 0.3372549, 1,
1.620859, 0.893598, -0.4871414, 1, 0, 0.3294118, 1,
1.624369, 1.342263, 0.8467637, 1, 0, 0.3254902, 1,
1.62545, -1.014725, 3.314071, 1, 0, 0.3176471, 1,
1.629079, 1.005481, 1.441359, 1, 0, 0.3137255, 1,
1.631396, 2.961397, 1.72098, 1, 0, 0.3058824, 1,
1.657208, 0.7305346, 0.6231319, 1, 0, 0.2980392, 1,
1.664878, -2.342774, 1.984849, 1, 0, 0.2941177, 1,
1.667664, -0.619042, 2.134771, 1, 0, 0.2862745, 1,
1.67964, 1.225011, 1.652008, 1, 0, 0.282353, 1,
1.684092, -1.007809, 3.381453, 1, 0, 0.2745098, 1,
1.694596, -0.3540502, -0.5663975, 1, 0, 0.2705882, 1,
1.735728, -0.3307159, 1.576253, 1, 0, 0.2627451, 1,
1.739136, 0.7525513, 2.43345, 1, 0, 0.2588235, 1,
1.739562, -1.681006, 1.954618, 1, 0, 0.2509804, 1,
1.74146, 0.3328767, 2.142236, 1, 0, 0.2470588, 1,
1.743418, 0.1402773, -1.200997, 1, 0, 0.2392157, 1,
1.757138, -0.9114373, 2.893535, 1, 0, 0.2352941, 1,
1.759038, -1.542668, 3.075741, 1, 0, 0.227451, 1,
1.783503, -0.3873391, 0.7638246, 1, 0, 0.2235294, 1,
1.824931, -0.2459688, 3.508172, 1, 0, 0.2156863, 1,
1.832309, -0.07607084, 1.172726, 1, 0, 0.2117647, 1,
1.849599, -0.5825609, 3.560018, 1, 0, 0.2039216, 1,
1.855097, -0.7124929, -0.584053, 1, 0, 0.1960784, 1,
1.864362, 0.9650986, 2.838102, 1, 0, 0.1921569, 1,
1.865894, -0.8737875, 3.737931, 1, 0, 0.1843137, 1,
1.898583, -0.3893707, 1.921713, 1, 0, 0.1803922, 1,
1.931071, 0.1598957, 0.99572, 1, 0, 0.172549, 1,
1.957251, -0.5331016, 3.025225, 1, 0, 0.1686275, 1,
1.96162, 1.516922, 1.639578, 1, 0, 0.1607843, 1,
1.975613, -0.2575662, 0.8101391, 1, 0, 0.1568628, 1,
2.029338, -0.75006, 3.105373, 1, 0, 0.1490196, 1,
2.067723, 0.3564473, 1.276491, 1, 0, 0.145098, 1,
2.070857, 0.6931777, 2.085119, 1, 0, 0.1372549, 1,
2.089198, -0.3725673, 0.6236449, 1, 0, 0.1333333, 1,
2.092021, -0.3086269, 1.21377, 1, 0, 0.1254902, 1,
2.110949, 0.06497502, -0.02018626, 1, 0, 0.1215686, 1,
2.11666, 0.9125683, 0.7131047, 1, 0, 0.1137255, 1,
2.170222, 1.474647, 0.9673756, 1, 0, 0.1098039, 1,
2.179608, 0.6240895, 3.550844, 1, 0, 0.1019608, 1,
2.189859, 0.329514, 0.6340823, 1, 0, 0.09411765, 1,
2.243197, 0.3232517, 1.281225, 1, 0, 0.09019608, 1,
2.259443, -0.475547, 1.288959, 1, 0, 0.08235294, 1,
2.357219, -0.3235021, 2.340083, 1, 0, 0.07843138, 1,
2.369501, 1.746944, 1.529066, 1, 0, 0.07058824, 1,
2.480024, 0.006417724, 2.595691, 1, 0, 0.06666667, 1,
2.48109, 1.529448, 0.8730919, 1, 0, 0.05882353, 1,
2.503387, 0.05680726, 2.248101, 1, 0, 0.05490196, 1,
2.514387, 1.533149, 1.968799, 1, 0, 0.04705882, 1,
2.612031, -0.4057101, 0.7804771, 1, 0, 0.04313726, 1,
2.641163, -1.337212, 1.784988, 1, 0, 0.03529412, 1,
2.868575, -1.092185, 1.237798, 1, 0, 0.03137255, 1,
2.952715, 0.1333262, 2.275534, 1, 0, 0.02352941, 1,
2.967052, -0.3302593, 2.6411, 1, 0, 0.01960784, 1,
2.99717, -0.2284742, 1.614053, 1, 0, 0.01176471, 1,
3.100991, -0.9972251, 2.161023, 1, 0, 0.007843138, 1
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
-0.00615871, -3.967529, -7.405512, 0, -0.5, 0.5, 0.5,
-0.00615871, -3.967529, -7.405512, 1, -0.5, 0.5, 0.5,
-0.00615871, -3.967529, -7.405512, 1, 1.5, 0.5, 0.5,
-0.00615871, -3.967529, -7.405512, 0, 1.5, 0.5, 0.5
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
-4.166633, -0.0009484291, -7.405512, 0, -0.5, 0.5, 0.5,
-4.166633, -0.0009484291, -7.405512, 1, -0.5, 0.5, 0.5,
-4.166633, -0.0009484291, -7.405512, 1, 1.5, 0.5, 0.5,
-4.166633, -0.0009484291, -7.405512, 0, 1.5, 0.5, 0.5
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
-4.166633, -3.967529, -0.156986, 0, -0.5, 0.5, 0.5,
-4.166633, -3.967529, -0.156986, 1, -0.5, 0.5, 0.5,
-4.166633, -3.967529, -0.156986, 1, 1.5, 0.5, 0.5,
-4.166633, -3.967529, -0.156986, 0, 1.5, 0.5, 0.5
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
-3, -3.052164, -5.732775,
3, -3.052164, -5.732775,
-3, -3.052164, -5.732775,
-3, -3.204725, -6.011565,
-2, -3.052164, -5.732775,
-2, -3.204725, -6.011565,
-1, -3.052164, -5.732775,
-1, -3.204725, -6.011565,
0, -3.052164, -5.732775,
0, -3.204725, -6.011565,
1, -3.052164, -5.732775,
1, -3.204725, -6.011565,
2, -3.052164, -5.732775,
2, -3.204725, -6.011565,
3, -3.052164, -5.732775,
3, -3.204725, -6.011565
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
-3, -3.509846, -6.569144, 0, -0.5, 0.5, 0.5,
-3, -3.509846, -6.569144, 1, -0.5, 0.5, 0.5,
-3, -3.509846, -6.569144, 1, 1.5, 0.5, 0.5,
-3, -3.509846, -6.569144, 0, 1.5, 0.5, 0.5,
-2, -3.509846, -6.569144, 0, -0.5, 0.5, 0.5,
-2, -3.509846, -6.569144, 1, -0.5, 0.5, 0.5,
-2, -3.509846, -6.569144, 1, 1.5, 0.5, 0.5,
-2, -3.509846, -6.569144, 0, 1.5, 0.5, 0.5,
-1, -3.509846, -6.569144, 0, -0.5, 0.5, 0.5,
-1, -3.509846, -6.569144, 1, -0.5, 0.5, 0.5,
-1, -3.509846, -6.569144, 1, 1.5, 0.5, 0.5,
-1, -3.509846, -6.569144, 0, 1.5, 0.5, 0.5,
0, -3.509846, -6.569144, 0, -0.5, 0.5, 0.5,
0, -3.509846, -6.569144, 1, -0.5, 0.5, 0.5,
0, -3.509846, -6.569144, 1, 1.5, 0.5, 0.5,
0, -3.509846, -6.569144, 0, 1.5, 0.5, 0.5,
1, -3.509846, -6.569144, 0, -0.5, 0.5, 0.5,
1, -3.509846, -6.569144, 1, -0.5, 0.5, 0.5,
1, -3.509846, -6.569144, 1, 1.5, 0.5, 0.5,
1, -3.509846, -6.569144, 0, 1.5, 0.5, 0.5,
2, -3.509846, -6.569144, 0, -0.5, 0.5, 0.5,
2, -3.509846, -6.569144, 1, -0.5, 0.5, 0.5,
2, -3.509846, -6.569144, 1, 1.5, 0.5, 0.5,
2, -3.509846, -6.569144, 0, 1.5, 0.5, 0.5,
3, -3.509846, -6.569144, 0, -0.5, 0.5, 0.5,
3, -3.509846, -6.569144, 1, -0.5, 0.5, 0.5,
3, -3.509846, -6.569144, 1, 1.5, 0.5, 0.5,
3, -3.509846, -6.569144, 0, 1.5, 0.5, 0.5
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
-3.206523, -2, -5.732775,
-3.206523, 2, -5.732775,
-3.206523, -2, -5.732775,
-3.366541, -2, -6.011565,
-3.206523, -1, -5.732775,
-3.366541, -1, -6.011565,
-3.206523, 0, -5.732775,
-3.366541, 0, -6.011565,
-3.206523, 1, -5.732775,
-3.366541, 1, -6.011565,
-3.206523, 2, -5.732775,
-3.366541, 2, -6.011565
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
-3.686578, -2, -6.569144, 0, -0.5, 0.5, 0.5,
-3.686578, -2, -6.569144, 1, -0.5, 0.5, 0.5,
-3.686578, -2, -6.569144, 1, 1.5, 0.5, 0.5,
-3.686578, -2, -6.569144, 0, 1.5, 0.5, 0.5,
-3.686578, -1, -6.569144, 0, -0.5, 0.5, 0.5,
-3.686578, -1, -6.569144, 1, -0.5, 0.5, 0.5,
-3.686578, -1, -6.569144, 1, 1.5, 0.5, 0.5,
-3.686578, -1, -6.569144, 0, 1.5, 0.5, 0.5,
-3.686578, 0, -6.569144, 0, -0.5, 0.5, 0.5,
-3.686578, 0, -6.569144, 1, -0.5, 0.5, 0.5,
-3.686578, 0, -6.569144, 1, 1.5, 0.5, 0.5,
-3.686578, 0, -6.569144, 0, 1.5, 0.5, 0.5,
-3.686578, 1, -6.569144, 0, -0.5, 0.5, 0.5,
-3.686578, 1, -6.569144, 1, -0.5, 0.5, 0.5,
-3.686578, 1, -6.569144, 1, 1.5, 0.5, 0.5,
-3.686578, 1, -6.569144, 0, 1.5, 0.5, 0.5,
-3.686578, 2, -6.569144, 0, -0.5, 0.5, 0.5,
-3.686578, 2, -6.569144, 1, -0.5, 0.5, 0.5,
-3.686578, 2, -6.569144, 1, 1.5, 0.5, 0.5,
-3.686578, 2, -6.569144, 0, 1.5, 0.5, 0.5
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
-3.206523, -3.052164, -4,
-3.206523, -3.052164, 4,
-3.206523, -3.052164, -4,
-3.366541, -3.204725, -4,
-3.206523, -3.052164, -2,
-3.366541, -3.204725, -2,
-3.206523, -3.052164, 0,
-3.366541, -3.204725, 0,
-3.206523, -3.052164, 2,
-3.366541, -3.204725, 2,
-3.206523, -3.052164, 4,
-3.366541, -3.204725, 4
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
-3.686578, -3.509846, -4, 0, -0.5, 0.5, 0.5,
-3.686578, -3.509846, -4, 1, -0.5, 0.5, 0.5,
-3.686578, -3.509846, -4, 1, 1.5, 0.5, 0.5,
-3.686578, -3.509846, -4, 0, 1.5, 0.5, 0.5,
-3.686578, -3.509846, -2, 0, -0.5, 0.5, 0.5,
-3.686578, -3.509846, -2, 1, -0.5, 0.5, 0.5,
-3.686578, -3.509846, -2, 1, 1.5, 0.5, 0.5,
-3.686578, -3.509846, -2, 0, 1.5, 0.5, 0.5,
-3.686578, -3.509846, 0, 0, -0.5, 0.5, 0.5,
-3.686578, -3.509846, 0, 1, -0.5, 0.5, 0.5,
-3.686578, -3.509846, 0, 1, 1.5, 0.5, 0.5,
-3.686578, -3.509846, 0, 0, 1.5, 0.5, 0.5,
-3.686578, -3.509846, 2, 0, -0.5, 0.5, 0.5,
-3.686578, -3.509846, 2, 1, -0.5, 0.5, 0.5,
-3.686578, -3.509846, 2, 1, 1.5, 0.5, 0.5,
-3.686578, -3.509846, 2, 0, 1.5, 0.5, 0.5,
-3.686578, -3.509846, 4, 0, -0.5, 0.5, 0.5,
-3.686578, -3.509846, 4, 1, -0.5, 0.5, 0.5,
-3.686578, -3.509846, 4, 1, 1.5, 0.5, 0.5,
-3.686578, -3.509846, 4, 0, 1.5, 0.5, 0.5
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
-3.206523, -3.052164, -5.732775,
-3.206523, 3.050267, -5.732775,
-3.206523, -3.052164, 5.418803,
-3.206523, 3.050267, 5.418803,
-3.206523, -3.052164, -5.732775,
-3.206523, -3.052164, 5.418803,
-3.206523, 3.050267, -5.732775,
-3.206523, 3.050267, 5.418803,
-3.206523, -3.052164, -5.732775,
3.194206, -3.052164, -5.732775,
-3.206523, -3.052164, 5.418803,
3.194206, -3.052164, 5.418803,
-3.206523, 3.050267, -5.732775,
3.194206, 3.050267, -5.732775,
-3.206523, 3.050267, 5.418803,
3.194206, 3.050267, 5.418803,
3.194206, -3.052164, -5.732775,
3.194206, 3.050267, -5.732775,
3.194206, -3.052164, 5.418803,
3.194206, 3.050267, 5.418803,
3.194206, -3.052164, -5.732775,
3.194206, -3.052164, 5.418803,
3.194206, 3.050267, -5.732775,
3.194206, 3.050267, 5.418803
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
var radius = 7.599928;
var distance = 33.81294;
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
mvMatrix.translate( 0.00615871, 0.0009484291, 0.156986 );
mvMatrix.scale( 1.28379, 1.346544, 0.7368636 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.81294);
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
methfuroxam<-read.table("methfuroxam.xyz")
```

```
## Error in read.table("methfuroxam.xyz"): no lines available in input
```

```r
x<-methfuroxam$V2
```

```
## Error in eval(expr, envir, enclos): object 'methfuroxam' not found
```

```r
y<-methfuroxam$V3
```

```
## Error in eval(expr, envir, enclos): object 'methfuroxam' not found
```

```r
z<-methfuroxam$V4
```

```
## Error in eval(expr, envir, enclos): object 'methfuroxam' not found
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
-3.113309, -0.1121135, -0.5659438, 0, 0, 1, 1, 1,
-2.938972, -0.9711302, -2.493052, 1, 0, 0, 1, 1,
-2.909157, 0.1550941, -2.311105, 1, 0, 0, 1, 1,
-2.894394, 1.55909, 0.02165686, 1, 0, 0, 1, 1,
-2.85007, -1.384726, -1.563411, 1, 0, 0, 1, 1,
-2.795086, 0.1161502, -1.691665, 1, 0, 0, 1, 1,
-2.772453, 0.9169281, -1.22822, 0, 0, 0, 1, 1,
-2.710839, 1.059429, -2.777111, 0, 0, 0, 1, 1,
-2.625501, -0.2606913, -3.074712, 0, 0, 0, 1, 1,
-2.581848, 1.978354, -1.984617, 0, 0, 0, 1, 1,
-2.560899, 1.264213, -1.072323, 0, 0, 0, 1, 1,
-2.515656, -1.198045, -0.4907493, 0, 0, 0, 1, 1,
-2.506442, -0.1761681, -1.715578, 0, 0, 0, 1, 1,
-2.418341, 2.132762, -1.526947, 1, 1, 1, 1, 1,
-2.302334, -0.5219062, 0.7047942, 1, 1, 1, 1, 1,
-2.288415, 1.357713, 0.4405848, 1, 1, 1, 1, 1,
-2.261652, -2.898657, -1.707658, 1, 1, 1, 1, 1,
-2.250831, -0.0218055, -1.979283, 1, 1, 1, 1, 1,
-2.249804, -0.5163997, -2.643991, 1, 1, 1, 1, 1,
-2.247224, 0.05007667, -0.9246739, 1, 1, 1, 1, 1,
-2.240604, -2.826848, -3.000182, 1, 1, 1, 1, 1,
-2.232671, 1.078303, -1.56894, 1, 1, 1, 1, 1,
-2.223714, -1.577399, -0.9890416, 1, 1, 1, 1, 1,
-2.178617, -0.9522141, -2.176259, 1, 1, 1, 1, 1,
-2.171435, 0.8549603, -0.3937764, 1, 1, 1, 1, 1,
-2.164491, 0.6657377, -3.646098, 1, 1, 1, 1, 1,
-2.155317, 0.7852282, -1.21224, 1, 1, 1, 1, 1,
-2.131998, -0.2784258, -0.3962015, 1, 1, 1, 1, 1,
-2.114435, -0.2411756, -2.942017, 0, 0, 1, 1, 1,
-2.063624, 0.4425493, 0.88107, 1, 0, 0, 1, 1,
-2.049433, 0.05745697, -0.02786946, 1, 0, 0, 1, 1,
-2.032556, 0.18072, -1.960256, 1, 0, 0, 1, 1,
-2.031679, 0.3206321, 0.9001892, 1, 0, 0, 1, 1,
-2.017491, -0.5382805, -2.028534, 1, 0, 0, 1, 1,
-1.991282, 0.2809795, -0.8076158, 0, 0, 0, 1, 1,
-1.977034, -0.5441944, -1.463202, 0, 0, 0, 1, 1,
-1.902243, 0.5739498, -0.6085925, 0, 0, 0, 1, 1,
-1.867661, -2.046366, -2.558802, 0, 0, 0, 1, 1,
-1.845542, -0.7917205, -2.300756, 0, 0, 0, 1, 1,
-1.84438, 0.1248886, -0.09346282, 0, 0, 0, 1, 1,
-1.832444, -0.568957, -2.950537, 0, 0, 0, 1, 1,
-1.829847, 1.027415, -0.173063, 1, 1, 1, 1, 1,
-1.790656, 0.02569764, -1.774099, 1, 1, 1, 1, 1,
-1.779909, -1.464417, -1.818528, 1, 1, 1, 1, 1,
-1.779716, -0.2378747, -1.350756, 1, 1, 1, 1, 1,
-1.777822, -0.8363209, -2.037148, 1, 1, 1, 1, 1,
-1.764864, -0.3858742, -1.90539, 1, 1, 1, 1, 1,
-1.755756, 0.2596054, -0.9899064, 1, 1, 1, 1, 1,
-1.731705, 0.3846619, -2.802303, 1, 1, 1, 1, 1,
-1.728858, 0.2838293, -1.030912, 1, 1, 1, 1, 1,
-1.723088, 1.457908, -0.4910694, 1, 1, 1, 1, 1,
-1.690567, 0.4221404, -1.66088, 1, 1, 1, 1, 1,
-1.66504, -1.25603, -2.497398, 1, 1, 1, 1, 1,
-1.658778, -0.06849068, -2.402427, 1, 1, 1, 1, 1,
-1.656593, 0.09123206, -1.83214, 1, 1, 1, 1, 1,
-1.655035, -0.8925218, -0.4473069, 1, 1, 1, 1, 1,
-1.647929, 1.677607, -0.7295102, 0, 0, 1, 1, 1,
-1.644663, -0.6475511, -2.187149, 1, 0, 0, 1, 1,
-1.627721, 1.74572, 1.002288, 1, 0, 0, 1, 1,
-1.604427, -0.3690878, -0.7795827, 1, 0, 0, 1, 1,
-1.590612, -0.4898962, -3.17176, 1, 0, 0, 1, 1,
-1.580125, -0.8336959, -0.8186821, 1, 0, 0, 1, 1,
-1.572353, 1.083464, -1.534935, 0, 0, 0, 1, 1,
-1.569591, 0.8939518, -1.095348, 0, 0, 0, 1, 1,
-1.546932, -0.08884764, -2.030793, 0, 0, 0, 1, 1,
-1.529249, -0.8959727, -2.678026, 0, 0, 0, 1, 1,
-1.527565, -0.3854061, -2.374993, 0, 0, 0, 1, 1,
-1.520382, 0.8575706, -0.856297, 0, 0, 0, 1, 1,
-1.508648, -0.814469, -3.098717, 0, 0, 0, 1, 1,
-1.496938, -0.05256281, -2.735484, 1, 1, 1, 1, 1,
-1.487823, -0.8521999, -3.204022, 1, 1, 1, 1, 1,
-1.478389, 0.6678937, -2.448498, 1, 1, 1, 1, 1,
-1.47484, -2.052028, -0.9964626, 1, 1, 1, 1, 1,
-1.472392, 1.483557, -0.4420598, 1, 1, 1, 1, 1,
-1.472101, 0.1137364, -1.436252, 1, 1, 1, 1, 1,
-1.444336, -1.603006, -3.807066, 1, 1, 1, 1, 1,
-1.441485, -0.7304881, -3.033024, 1, 1, 1, 1, 1,
-1.424681, 1.259438, -0.7722465, 1, 1, 1, 1, 1,
-1.410548, -0.7070643, -2.692437, 1, 1, 1, 1, 1,
-1.404794, -0.08371823, 0.2254978, 1, 1, 1, 1, 1,
-1.404062, 0.7972348, -1.177269, 1, 1, 1, 1, 1,
-1.397738, -1.706394, -1.927508, 1, 1, 1, 1, 1,
-1.396188, 1.360233, -0.4323377, 1, 1, 1, 1, 1,
-1.379685, -0.3171504, -2.802673, 1, 1, 1, 1, 1,
-1.374586, 0.5314431, -0.6239792, 0, 0, 1, 1, 1,
-1.368484, 0.8972005, -0.05375317, 1, 0, 0, 1, 1,
-1.364161, -0.08009583, 0.8437455, 1, 0, 0, 1, 1,
-1.357945, -0.9205512, -3.655092, 1, 0, 0, 1, 1,
-1.344857, 0.4020518, -0.2686618, 1, 0, 0, 1, 1,
-1.338787, 1.123184, -0.5952659, 1, 0, 0, 1, 1,
-1.336141, -0.8366492, -2.038929, 0, 0, 0, 1, 1,
-1.336022, -1.395863, -2.346822, 0, 0, 0, 1, 1,
-1.331342, -1.545688, -3.35582, 0, 0, 0, 1, 1,
-1.324893, -0.5412331, -0.9320977, 0, 0, 0, 1, 1,
-1.31686, -0.5963992, -2.027655, 0, 0, 0, 1, 1,
-1.312643, -1.182601, -2.35194, 0, 0, 0, 1, 1,
-1.310522, 0.3811473, -1.771788, 0, 0, 0, 1, 1,
-1.303052, -1.041095, -3.969488, 1, 1, 1, 1, 1,
-1.300798, -1.139892, -1.528263, 1, 1, 1, 1, 1,
-1.297852, -0.3301329, -2.702044, 1, 1, 1, 1, 1,
-1.279863, -0.4950319, -1.460203, 1, 1, 1, 1, 1,
-1.268383, -1.784643, -2.934921, 1, 1, 1, 1, 1,
-1.262328, -0.2581606, -1.17312, 1, 1, 1, 1, 1,
-1.260023, -1.710579, -3.938081, 1, 1, 1, 1, 1,
-1.25142, -1.043029, -1.783523, 1, 1, 1, 1, 1,
-1.251079, -1.163846, -4.038151, 1, 1, 1, 1, 1,
-1.242921, 1.7579, -1.135161, 1, 1, 1, 1, 1,
-1.232563, 1.050253, -1.678253, 1, 1, 1, 1, 1,
-1.22825, -0.594685, -1.46435, 1, 1, 1, 1, 1,
-1.225649, 0.8021744, -0.8398004, 1, 1, 1, 1, 1,
-1.225248, 1.967834, -0.4835486, 1, 1, 1, 1, 1,
-1.216116, 0.1269505, -2.165099, 1, 1, 1, 1, 1,
-1.189443, 0.3019539, -2.652708, 0, 0, 1, 1, 1,
-1.184116, -2.094152, -3.392667, 1, 0, 0, 1, 1,
-1.167942, -2.963294, -3.669587, 1, 0, 0, 1, 1,
-1.16516, 1.493651, 0.6445714, 1, 0, 0, 1, 1,
-1.164085, 1.176593, -1.571081, 1, 0, 0, 1, 1,
-1.161169, 1.011269, -0.1583911, 1, 0, 0, 1, 1,
-1.160545, -0.274781, -0.4873972, 0, 0, 0, 1, 1,
-1.160517, -1.334671, -1.604375, 0, 0, 0, 1, 1,
-1.14583, -1.294934, -2.388285, 0, 0, 0, 1, 1,
-1.142309, 1.584452, -2.6655, 0, 0, 0, 1, 1,
-1.12789, -1.654412, -3.075522, 0, 0, 0, 1, 1,
-1.122482, -1.29537, -2.388903, 0, 0, 0, 1, 1,
-1.12137, 0.4459099, -1.351109, 0, 0, 0, 1, 1,
-1.11339, 0.2494961, -2.040861, 1, 1, 1, 1, 1,
-1.109592, 0.6650807, 0.8257097, 1, 1, 1, 1, 1,
-1.099606, 0.03398321, -2.418148, 1, 1, 1, 1, 1,
-1.092356, -0.5684498, -1.821612, 1, 1, 1, 1, 1,
-1.087403, 0.4187073, 0.01267077, 1, 1, 1, 1, 1,
-1.086716, -2.204496, -2.646123, 1, 1, 1, 1, 1,
-1.080832, 2.036809, 0.1761146, 1, 1, 1, 1, 1,
-1.079787, -0.7075271, -2.261776, 1, 1, 1, 1, 1,
-1.077409, -0.4863604, -2.03524, 1, 1, 1, 1, 1,
-1.073684, -0.5237631, -1.067844, 1, 1, 1, 1, 1,
-1.073189, 2.097444, -0.3885118, 1, 1, 1, 1, 1,
-1.071943, 1.564293, -0.9620989, 1, 1, 1, 1, 1,
-1.065242, -2.383373, -3.24057, 1, 1, 1, 1, 1,
-1.063092, -0.6566398, -4.098556, 1, 1, 1, 1, 1,
-1.06039, 1.605809, -0.779263, 1, 1, 1, 1, 1,
-1.059823, -0.8484123, -3.238243, 0, 0, 1, 1, 1,
-1.05719, 1.530401, -1.332538, 1, 0, 0, 1, 1,
-1.056479, 1.073328, -0.5626546, 1, 0, 0, 1, 1,
-1.0547, -0.5737172, -2.242055, 1, 0, 0, 1, 1,
-1.041898, 1.504542, 1.09941, 1, 0, 0, 1, 1,
-1.039762, 1.129823, -0.2177924, 1, 0, 0, 1, 1,
-1.03101, 0.6122795, -2.105219, 0, 0, 0, 1, 1,
-1.027312, 0.2343978, -0.4695232, 0, 0, 0, 1, 1,
-1.024956, 1.659868, -2.639949, 0, 0, 0, 1, 1,
-1.017232, 0.1498102, -1.624796, 0, 0, 0, 1, 1,
-1.014342, -0.2491685, -0.8985612, 0, 0, 0, 1, 1,
-1.013428, 1.349809, -0.9907654, 0, 0, 0, 1, 1,
-1.009716, 0.6795182, 0.284776, 0, 0, 0, 1, 1,
-1.00845, 1.577778, -1.292267, 1, 1, 1, 1, 1,
-1.004605, -0.637468, 0.005277521, 1, 1, 1, 1, 1,
-1.003907, 0.3401457, -0.3263173, 1, 1, 1, 1, 1,
-0.9993932, -0.126774, -2.517836, 1, 1, 1, 1, 1,
-0.9993625, -0.647598, -0.9849167, 1, 1, 1, 1, 1,
-0.9876643, 0.4193791, 0.2090057, 1, 1, 1, 1, 1,
-0.9862564, 1.223457, -0.599347, 1, 1, 1, 1, 1,
-0.9847644, -2.93559, -3.121861, 1, 1, 1, 1, 1,
-0.9822891, 1.237305, -0.7565739, 1, 1, 1, 1, 1,
-0.9811664, 0.1661796, -1.605754, 1, 1, 1, 1, 1,
-0.9694929, 0.2506209, -1.742085, 1, 1, 1, 1, 1,
-0.968158, -2.153511, -2.173938, 1, 1, 1, 1, 1,
-0.9638351, 0.5828494, -0.6392664, 1, 1, 1, 1, 1,
-0.9634483, -0.8014627, -3.522276, 1, 1, 1, 1, 1,
-0.9535923, 0.7572569, -1.075583, 1, 1, 1, 1, 1,
-0.9439158, -1.434784, -2.817839, 0, 0, 1, 1, 1,
-0.9438876, -1.284069, -2.814667, 1, 0, 0, 1, 1,
-0.9422211, -0.7039253, -0.9720885, 1, 0, 0, 1, 1,
-0.9404284, 0.270201, -1.462201, 1, 0, 0, 1, 1,
-0.936577, 0.6557685, -1.599848, 1, 0, 0, 1, 1,
-0.9339089, -0.4417235, -2.601345, 1, 0, 0, 1, 1,
-0.9311618, -1.13285, -3.81153, 0, 0, 0, 1, 1,
-0.9268656, 1.114232, 0.4243239, 0, 0, 0, 1, 1,
-0.9260018, 0.8299792, -2.498915, 0, 0, 0, 1, 1,
-0.9216523, 0.7250664, -2.312234, 0, 0, 0, 1, 1,
-0.9205377, 0.03954496, -0.06565387, 0, 0, 0, 1, 1,
-0.9115747, 0.02243002, -1.492553, 0, 0, 0, 1, 1,
-0.9057974, -0.8766696, -0.1402343, 0, 0, 0, 1, 1,
-0.9056728, 0.1595987, -1.998701, 1, 1, 1, 1, 1,
-0.8940938, 0.2030645, 0.4440214, 1, 1, 1, 1, 1,
-0.8900938, 0.676754, -1.412286, 1, 1, 1, 1, 1,
-0.8891461, 0.6975103, -0.9514238, 1, 1, 1, 1, 1,
-0.8817511, 1.298242, 0.4570888, 1, 1, 1, 1, 1,
-0.8797318, -0.1631523, -3.055344, 1, 1, 1, 1, 1,
-0.8769199, 1.072594, -1.830599, 1, 1, 1, 1, 1,
-0.8750823, -1.519527, -4.074273, 1, 1, 1, 1, 1,
-0.8701344, -1.624842, -0.6074011, 1, 1, 1, 1, 1,
-0.8671454, 0.2928355, -1.097293, 1, 1, 1, 1, 1,
-0.8626525, -0.5102099, -1.621461, 1, 1, 1, 1, 1,
-0.861598, 0.8940818, 0.6921328, 1, 1, 1, 1, 1,
-0.8558831, -0.3392387, -1.831682, 1, 1, 1, 1, 1,
-0.8530213, -0.2102843, -1.525027, 1, 1, 1, 1, 1,
-0.8510138, -0.5721056, -0.3103449, 1, 1, 1, 1, 1,
-0.850713, -0.5504987, -2.456, 0, 0, 1, 1, 1,
-0.8482444, 0.1190516, -0.1150493, 1, 0, 0, 1, 1,
-0.8443667, -0.9322968, -0.3371739, 1, 0, 0, 1, 1,
-0.839929, 2.024251, -2.52874, 1, 0, 0, 1, 1,
-0.8391774, 0.6801888, -1.325557, 1, 0, 0, 1, 1,
-0.8389887, -0.006489383, -1.455545, 1, 0, 0, 1, 1,
-0.8350294, -0.4730985, -3.755606, 0, 0, 0, 1, 1,
-0.8323466, 1.591327, 0.8309864, 0, 0, 0, 1, 1,
-0.8274179, 1.83792, -0.5367513, 0, 0, 0, 1, 1,
-0.8247964, -0.3698922, -1.410806, 0, 0, 0, 1, 1,
-0.8245188, 2.699843, 0.1220611, 0, 0, 0, 1, 1,
-0.8240626, 1.124518, 0.8839074, 0, 0, 0, 1, 1,
-0.8240179, 1.052542, -1.422647, 0, 0, 0, 1, 1,
-0.8135925, 0.218069, -0.6709, 1, 1, 1, 1, 1,
-0.8101729, 0.7268133, 0.7068122, 1, 1, 1, 1, 1,
-0.8074142, -1.203893, -3.385236, 1, 1, 1, 1, 1,
-0.8051991, 0.8488594, -0.8060918, 1, 1, 1, 1, 1,
-0.8014517, -0.3823418, -1.266479, 1, 1, 1, 1, 1,
-0.7876711, -0.7492868, -1.877422, 1, 1, 1, 1, 1,
-0.7864088, -0.8505023, -3.28586, 1, 1, 1, 1, 1,
-0.7862169, -1.705091, -3.096085, 1, 1, 1, 1, 1,
-0.7812533, -0.113039, -1.115985, 1, 1, 1, 1, 1,
-0.7780225, 0.5088814, -0.2864317, 1, 1, 1, 1, 1,
-0.7761577, -0.9341948, -2.545217, 1, 1, 1, 1, 1,
-0.7684054, -0.314086, 0.1620322, 1, 1, 1, 1, 1,
-0.7676035, -0.7091053, -1.404229, 1, 1, 1, 1, 1,
-0.7578398, -1.261651, -2.633902, 1, 1, 1, 1, 1,
-0.7518461, -0.4927173, -1.547977, 1, 1, 1, 1, 1,
-0.7483212, 0.4340962, -1.576846, 0, 0, 1, 1, 1,
-0.748233, 1.530105, -0.6601202, 1, 0, 0, 1, 1,
-0.7475164, 0.1350882, 0.9318026, 1, 0, 0, 1, 1,
-0.7399469, -0.05416717, 0.5848743, 1, 0, 0, 1, 1,
-0.7238179, -1.882772, -3.660247, 1, 0, 0, 1, 1,
-0.7202412, -0.3163125, -1.469347, 1, 0, 0, 1, 1,
-0.7175182, -0.3556354, -2.279261, 0, 0, 0, 1, 1,
-0.7174561, 1.393897, -0.8322262, 0, 0, 0, 1, 1,
-0.7171991, -0.768013, 0.6586952, 0, 0, 0, 1, 1,
-0.7132141, 0.7936209, -1.108063, 0, 0, 0, 1, 1,
-0.7118686, -0.7180934, -1.260286, 0, 0, 0, 1, 1,
-0.7106233, -0.3070915, -0.5760265, 0, 0, 0, 1, 1,
-0.7045163, -0.9128972, -1.595999, 0, 0, 0, 1, 1,
-0.7021862, 1.174706, -0.8545604, 1, 1, 1, 1, 1,
-0.7007972, 1.006963, 0.8940337, 1, 1, 1, 1, 1,
-0.6993008, 0.4678757, -1.035236, 1, 1, 1, 1, 1,
-0.6943388, -0.6248246, -0.4866855, 1, 1, 1, 1, 1,
-0.6917868, 0.621612, 1.201488, 1, 1, 1, 1, 1,
-0.6895852, -0.1480096, -1.371971, 1, 1, 1, 1, 1,
-0.6773024, 1.191184, 0.2419614, 1, 1, 1, 1, 1,
-0.6761795, 0.4523059, -0.5388379, 1, 1, 1, 1, 1,
-0.6750748, 1.674772, -0.06323014, 1, 1, 1, 1, 1,
-0.6744986, -1.132695, -1.182837, 1, 1, 1, 1, 1,
-0.6739159, -0.5279875, -1.423735, 1, 1, 1, 1, 1,
-0.6734177, 0.3641723, -3.165485, 1, 1, 1, 1, 1,
-0.6719374, -0.2563301, -2.377282, 1, 1, 1, 1, 1,
-0.671804, 0.5696324, -0.4229946, 1, 1, 1, 1, 1,
-0.6716701, 1.133232, -0.2655049, 1, 1, 1, 1, 1,
-0.6617752, 1.13064, -0.7592742, 0, 0, 1, 1, 1,
-0.6521333, 0.3873747, 0.2982097, 1, 0, 0, 1, 1,
-0.6518961, -0.9910421, -2.956843, 1, 0, 0, 1, 1,
-0.6458339, -0.9815789, -3.167119, 1, 0, 0, 1, 1,
-0.6433402, -0.3945624, -1.22525, 1, 0, 0, 1, 1,
-0.6420947, 0.314602, 1.061255, 1, 0, 0, 1, 1,
-0.6387544, -0.4748882, -1.037279, 0, 0, 0, 1, 1,
-0.6379316, -2.176617, -2.057059, 0, 0, 0, 1, 1,
-0.6367483, -0.6433562, -2.774481, 0, 0, 0, 1, 1,
-0.6366323, -1.775501, -1.93372, 0, 0, 0, 1, 1,
-0.6361815, 0.5474699, -1.169327, 0, 0, 0, 1, 1,
-0.634896, 0.3960991, 2.722531, 0, 0, 0, 1, 1,
-0.6332859, 0.7140653, -1.802174, 0, 0, 0, 1, 1,
-0.6320922, -1.586213, -1.310661, 1, 1, 1, 1, 1,
-0.6296126, -1.848298, -2.626642, 1, 1, 1, 1, 1,
-0.6293564, -0.2287214, -3.31861, 1, 1, 1, 1, 1,
-0.6237392, -0.9117864, -1.929848, 1, 1, 1, 1, 1,
-0.6146979, -0.6965091, -1.45767, 1, 1, 1, 1, 1,
-0.6117463, -0.4819389, 0.1661414, 1, 1, 1, 1, 1,
-0.6027367, -0.02632942, -0.8325743, 1, 1, 1, 1, 1,
-0.5976034, -0.6166894, -2.233883, 1, 1, 1, 1, 1,
-0.5965269, 1.160753, 0.05718705, 1, 1, 1, 1, 1,
-0.5929569, 1.670513, -0.5427511, 1, 1, 1, 1, 1,
-0.5926236, -0.2735073, -1.789052, 1, 1, 1, 1, 1,
-0.5891048, -0.6963055, -2.118854, 1, 1, 1, 1, 1,
-0.5884684, 1.332114, 0.2288029, 1, 1, 1, 1, 1,
-0.5882908, -0.7240201, -1.147878, 1, 1, 1, 1, 1,
-0.5872678, 0.5094667, 1.524138, 1, 1, 1, 1, 1,
-0.5836059, 0.4574992, 0.2745194, 0, 0, 1, 1, 1,
-0.578327, 0.6140165, -1.952444, 1, 0, 0, 1, 1,
-0.5741357, 0.2955667, 0.07540946, 1, 0, 0, 1, 1,
-0.5676116, -0.4272403, -2.49269, 1, 0, 0, 1, 1,
-0.5589267, -0.8546116, -4.485088, 1, 0, 0, 1, 1,
-0.5510467, -0.0494351, -2.995751, 1, 0, 0, 1, 1,
-0.5508006, -0.142398, -3.217943, 0, 0, 0, 1, 1,
-0.5475613, -0.9224524, -5.035684, 0, 0, 0, 1, 1,
-0.5452684, 0.1613735, -1.632926, 0, 0, 0, 1, 1,
-0.5447117, -0.1392916, -3.049025, 0, 0, 0, 1, 1,
-0.544645, -0.4690561, -2.567359, 0, 0, 0, 1, 1,
-0.5440238, -1.504537, -2.760212, 0, 0, 0, 1, 1,
-0.5425097, 0.4278605, -0.9644992, 0, 0, 0, 1, 1,
-0.5284384, 0.9926447, -1.841704, 1, 1, 1, 1, 1,
-0.5256432, -0.1682398, -2.042881, 1, 1, 1, 1, 1,
-0.5240024, -0.2638656, -1.03636, 1, 1, 1, 1, 1,
-0.5211653, -0.875991, -2.046794, 1, 1, 1, 1, 1,
-0.5205022, 0.1235588, -1.150746, 1, 1, 1, 1, 1,
-0.5178105, 0.836657, -1.28766, 1, 1, 1, 1, 1,
-0.5163938, -0.06842656, -1.749591, 1, 1, 1, 1, 1,
-0.5131426, 1.044015, 0.2600292, 1, 1, 1, 1, 1,
-0.5131375, -0.05699537, -2.941192, 1, 1, 1, 1, 1,
-0.5113859, -0.02197724, -0.5258786, 1, 1, 1, 1, 1,
-0.5113443, -1.685614, -3.418285, 1, 1, 1, 1, 1,
-0.5111849, 0.5129483, 0.1802931, 1, 1, 1, 1, 1,
-0.5093464, -1.074043, -2.723302, 1, 1, 1, 1, 1,
-0.5053233, -0.4139989, -2.656081, 1, 1, 1, 1, 1,
-0.5048091, -0.2558396, -1.918904, 1, 1, 1, 1, 1,
-0.4969448, 1.718562, -0.01192848, 0, 0, 1, 1, 1,
-0.4928073, -0.325853, -2.502987, 1, 0, 0, 1, 1,
-0.4917834, 0.1190169, -0.4012636, 1, 0, 0, 1, 1,
-0.4914236, 1.656223, 1.094982, 1, 0, 0, 1, 1,
-0.4886758, 0.8165305, -2.886431, 1, 0, 0, 1, 1,
-0.4882677, 0.2311324, -2.40054, 1, 0, 0, 1, 1,
-0.4861604, -0.2468592, -3.202176, 0, 0, 0, 1, 1,
-0.4824672, 1.053081, 0.6191121, 0, 0, 0, 1, 1,
-0.481595, -0.1113835, -2.162885, 0, 0, 0, 1, 1,
-0.4810443, 2.255697, -0.6851787, 0, 0, 0, 1, 1,
-0.4757949, 0.699532, -0.8007336, 0, 0, 0, 1, 1,
-0.4747256, 0.3442004, 0.8844014, 0, 0, 0, 1, 1,
-0.4741903, 0.6069105, -0.9016672, 0, 0, 0, 1, 1,
-0.4712555, 0.4292295, -1.538313, 1, 1, 1, 1, 1,
-0.4667451, 0.8455952, 0.3393357, 1, 1, 1, 1, 1,
-0.4641468, -0.1375329, 0.236983, 1, 1, 1, 1, 1,
-0.4611259, 0.4228672, 0.9045506, 1, 1, 1, 1, 1,
-0.460818, -0.5114868, -2.449705, 1, 1, 1, 1, 1,
-0.4604851, -1.051595, -2.807036, 1, 1, 1, 1, 1,
-0.4589198, -0.1227843, -1.837192, 1, 1, 1, 1, 1,
-0.4533417, -1.803948, -2.550105, 1, 1, 1, 1, 1,
-0.4524894, -0.2771097, -1.653769, 1, 1, 1, 1, 1,
-0.4500483, 0.633291, -0.1482753, 1, 1, 1, 1, 1,
-0.4460547, -0.1194717, 0.3050231, 1, 1, 1, 1, 1,
-0.4437298, 0.6904094, -0.06177711, 1, 1, 1, 1, 1,
-0.4435251, 0.6024803, -1.323084, 1, 1, 1, 1, 1,
-0.4298408, 0.7688164, -0.8216586, 1, 1, 1, 1, 1,
-0.4291591, -0.3336544, 0.05261865, 1, 1, 1, 1, 1,
-0.4286084, -0.2150389, -1.547023, 0, 0, 1, 1, 1,
-0.4264363, -0.91078, -1.914114, 1, 0, 0, 1, 1,
-0.4244134, 0.05823286, -0.5086693, 1, 0, 0, 1, 1,
-0.4220862, -0.2604133, -0.9866096, 1, 0, 0, 1, 1,
-0.4206375, -0.05863801, 0.4627984, 1, 0, 0, 1, 1,
-0.4188931, -0.1945468, -2.9687, 1, 0, 0, 1, 1,
-0.4141215, 0.4535623, -1.266931, 0, 0, 0, 1, 1,
-0.4132794, 0.3954655, 2.922087, 0, 0, 0, 1, 1,
-0.4111989, -2.084789, -1.433331, 0, 0, 0, 1, 1,
-0.4076662, 0.176664, -0.07134829, 0, 0, 0, 1, 1,
-0.4054219, -1.14144, -3.944553, 0, 0, 0, 1, 1,
-0.4005441, -0.4462527, -3.681716, 0, 0, 0, 1, 1,
-0.3936212, 1.359598, -0.5915844, 0, 0, 0, 1, 1,
-0.3933999, 0.08559195, -2.467006, 1, 1, 1, 1, 1,
-0.3909999, 0.2377179, -0.7029964, 1, 1, 1, 1, 1,
-0.382043, -0.950278, -2.368216, 1, 1, 1, 1, 1,
-0.3788595, -0.8731247, -3.484992, 1, 1, 1, 1, 1,
-0.3741087, 1.472438, -1.911572, 1, 1, 1, 1, 1,
-0.3725379, -1.137067, -1.801955, 1, 1, 1, 1, 1,
-0.3716615, -0.1703501, -4.899468, 1, 1, 1, 1, 1,
-0.3709883, 1.190813, -1.081344, 1, 1, 1, 1, 1,
-0.3696599, -0.4221216, -2.872825, 1, 1, 1, 1, 1,
-0.3679422, 1.037628, -0.2197158, 1, 1, 1, 1, 1,
-0.3653349, 0.4096013, -2.522016, 1, 1, 1, 1, 1,
-0.3632298, -2.686356, -2.270314, 1, 1, 1, 1, 1,
-0.3585748, 0.7645697, -1.598623, 1, 1, 1, 1, 1,
-0.3573762, -0.1535665, -1.123435, 1, 1, 1, 1, 1,
-0.3551803, -1.112755, -3.765961, 1, 1, 1, 1, 1,
-0.3538789, -0.1122724, -2.478522, 0, 0, 1, 1, 1,
-0.3422281, -0.07025599, -1.492445, 1, 0, 0, 1, 1,
-0.3398139, 0.6163867, 0.567418, 1, 0, 0, 1, 1,
-0.3357142, 0.1847592, -1.559959, 1, 0, 0, 1, 1,
-0.3352042, 1.494837, -0.235549, 1, 0, 0, 1, 1,
-0.3348019, 0.2190495, -1.748971, 1, 0, 0, 1, 1,
-0.3302819, -1.264398, -3.506352, 0, 0, 0, 1, 1,
-0.3264635, 0.1281502, -2.8937, 0, 0, 0, 1, 1,
-0.3221778, -2.469394, -2.934745, 0, 0, 0, 1, 1,
-0.3167112, -1.278767, -2.804981, 0, 0, 0, 1, 1,
-0.3135332, 0.4716893, -1.210184, 0, 0, 0, 1, 1,
-0.3083768, -0.815014, -1.752369, 0, 0, 0, 1, 1,
-0.3014005, -1.097003, -3.009506, 0, 0, 0, 1, 1,
-0.3004495, -0.8933345, -3.511784, 1, 1, 1, 1, 1,
-0.2969595, -0.864651, -2.512449, 1, 1, 1, 1, 1,
-0.2966299, -2.402709, -0.4751262, 1, 1, 1, 1, 1,
-0.2940204, 0.643586, 0.3902782, 1, 1, 1, 1, 1,
-0.2931051, 1.036613, 0.1569552, 1, 1, 1, 1, 1,
-0.285055, -0.9724577, -3.518871, 1, 1, 1, 1, 1,
-0.2842218, 1.837916, -0.4681564, 1, 1, 1, 1, 1,
-0.2796278, -1.522609, -3.622492, 1, 1, 1, 1, 1,
-0.2791955, 0.6490659, 0.8010436, 1, 1, 1, 1, 1,
-0.2786912, 1.34963, 1.713115, 1, 1, 1, 1, 1,
-0.2761293, -0.5237542, -2.937528, 1, 1, 1, 1, 1,
-0.2735878, -0.05803345, -1.873406, 1, 1, 1, 1, 1,
-0.2712219, 1.560488, 1.338424, 1, 1, 1, 1, 1,
-0.270284, -1.845931, -2.158176, 1, 1, 1, 1, 1,
-0.2665705, 0.2933598, -0.6395417, 1, 1, 1, 1, 1,
-0.265743, 1.011274, 0.314647, 0, 0, 1, 1, 1,
-0.2651212, 1.391213, -0.1295509, 1, 0, 0, 1, 1,
-0.2596658, 0.5533479, -0.9267885, 1, 0, 0, 1, 1,
-0.2596343, 0.03245543, -1.224681, 1, 0, 0, 1, 1,
-0.254878, -0.2324829, -2.416687, 1, 0, 0, 1, 1,
-0.2533507, 0.07751942, -1.26326, 1, 0, 0, 1, 1,
-0.2530347, 0.2759851, -0.2412877, 0, 0, 0, 1, 1,
-0.2524276, -0.1467803, -3.523403, 0, 0, 0, 1, 1,
-0.2508095, -1.083992, -1.906605, 0, 0, 0, 1, 1,
-0.2484761, -0.7011998, -2.869062, 0, 0, 0, 1, 1,
-0.2481671, -1.947158, -0.8106918, 0, 0, 0, 1, 1,
-0.2430045, -0.04688494, -1.17317, 0, 0, 0, 1, 1,
-0.2421424, -0.9552354, -1.03312, 0, 0, 0, 1, 1,
-0.2354657, 0.8150268, -0.008205571, 1, 1, 1, 1, 1,
-0.2334332, -1.230294, -3.500018, 1, 1, 1, 1, 1,
-0.2292967, -0.5741098, -3.226691, 1, 1, 1, 1, 1,
-0.2263044, -0.8284877, -3.19353, 1, 1, 1, 1, 1,
-0.2239204, -1.237901, -1.957153, 1, 1, 1, 1, 1,
-0.2201689, -0.4364614, -2.423748, 1, 1, 1, 1, 1,
-0.2193628, -0.2106065, -1.303622, 1, 1, 1, 1, 1,
-0.2189421, -0.6527807, -2.465334, 1, 1, 1, 1, 1,
-0.2144932, -1.591633, -3.311842, 1, 1, 1, 1, 1,
-0.2140784, -0.4923255, -2.049296, 1, 1, 1, 1, 1,
-0.2068584, 0.8031828, -0.9379259, 1, 1, 1, 1, 1,
-0.1993945, 0.2305206, -1.455675, 1, 1, 1, 1, 1,
-0.1965789, 2.203897, 1.149292, 1, 1, 1, 1, 1,
-0.1934432, 0.1698459, -0.1170033, 1, 1, 1, 1, 1,
-0.1911427, 0.01809138, -1.92204, 1, 1, 1, 1, 1,
-0.1878392, -0.07127602, -1.704238, 0, 0, 1, 1, 1,
-0.1832699, -0.3050329, -1.765624, 1, 0, 0, 1, 1,
-0.1823441, 1.30519, 0.3875515, 1, 0, 0, 1, 1,
-0.1804247, 0.2873245, -2.230074, 1, 0, 0, 1, 1,
-0.1744057, 0.434458, -1.720515, 1, 0, 0, 1, 1,
-0.174374, -1.145346, -2.386098, 1, 0, 0, 1, 1,
-0.1734216, -0.164206, -2.833518, 0, 0, 0, 1, 1,
-0.1732989, 0.4738117, -0.1958982, 0, 0, 0, 1, 1,
-0.1708169, -1.908961, -3.000532, 0, 0, 0, 1, 1,
-0.169636, 0.4565816, -1.559484, 0, 0, 0, 1, 1,
-0.1637971, 0.2659979, 1.429369, 0, 0, 0, 1, 1,
-0.1617438, -0.1289994, -4.767519, 0, 0, 0, 1, 1,
-0.1611902, -1.691273, -3.715379, 0, 0, 0, 1, 1,
-0.1603964, 0.04223006, -1.29399, 1, 1, 1, 1, 1,
-0.1601454, 1.637631, -1.083997, 1, 1, 1, 1, 1,
-0.1546129, -1.33835, -2.689837, 1, 1, 1, 1, 1,
-0.1520247, -1.935304, -3.607863, 1, 1, 1, 1, 1,
-0.1513249, -1.659283, -4.196137, 1, 1, 1, 1, 1,
-0.1481799, 0.3811379, 0.5153106, 1, 1, 1, 1, 1,
-0.1459491, 0.7395231, -1.187392, 1, 1, 1, 1, 1,
-0.1431186, -0.07915978, -1.92626, 1, 1, 1, 1, 1,
-0.1383213, -0.7181036, -3.591392, 1, 1, 1, 1, 1,
-0.134753, 0.4834777, -0.3221745, 1, 1, 1, 1, 1,
-0.1292805, 0.7800906, 0.6170408, 1, 1, 1, 1, 1,
-0.1264169, 0.1673258, -0.000544208, 1, 1, 1, 1, 1,
-0.124591, 0.8813399, -1.168325, 1, 1, 1, 1, 1,
-0.1185021, -0.2653473, -2.930538, 1, 1, 1, 1, 1,
-0.118273, 1.130949, -0.1854402, 1, 1, 1, 1, 1,
-0.1128481, 1.315002, 0.49662, 0, 0, 1, 1, 1,
-0.1018429, 2.489153, -0.178069, 1, 0, 0, 1, 1,
-0.1007544, -0.8090288, -3.218084, 1, 0, 0, 1, 1,
-0.1002967, 0.03439898, -1.754397, 1, 0, 0, 1, 1,
-0.09532391, 0.9536573, -0.0223421, 1, 0, 0, 1, 1,
-0.09193728, -0.4849582, -3.339381, 1, 0, 0, 1, 1,
-0.08960697, -0.744181, -2.959865, 0, 0, 0, 1, 1,
-0.08588866, 1.321789, -1.335867, 0, 0, 0, 1, 1,
-0.08506574, -1.588737, -5.570374, 0, 0, 0, 1, 1,
-0.08404798, 0.366172, -1.062219, 0, 0, 0, 1, 1,
-0.08127639, 0.5806196, -0.168719, 0, 0, 0, 1, 1,
-0.07416689, 1.033062, -0.3004533, 0, 0, 0, 1, 1,
-0.06943903, -0.6904656, -4.513111, 0, 0, 0, 1, 1,
-0.06785798, -0.03851112, -1.715487, 1, 1, 1, 1, 1,
-0.06743575, -0.6827449, -3.756415, 1, 1, 1, 1, 1,
-0.06361045, -0.7279388, -1.548895, 1, 1, 1, 1, 1,
-0.06162303, 1.491981, -0.8066165, 1, 1, 1, 1, 1,
-0.05895023, -0.1853705, -4.135334, 1, 1, 1, 1, 1,
-0.05882794, -2.042098, -4.024756, 1, 1, 1, 1, 1,
-0.04807805, -0.4415857, -3.238282, 1, 1, 1, 1, 1,
-0.04719059, 0.6847672, -0.3292848, 1, 1, 1, 1, 1,
-0.04267526, -0.530218, -3.008901, 1, 1, 1, 1, 1,
-0.04007132, -1.63999, -3.227199, 1, 1, 1, 1, 1,
-0.03861985, -1.795866, -3.088118, 1, 1, 1, 1, 1,
-0.03001682, 1.052625, 0.03463371, 1, 1, 1, 1, 1,
-0.02800327, -1.65409, -2.664654, 1, 1, 1, 1, 1,
-0.02470211, 0.3960295, -1.456243, 1, 1, 1, 1, 1,
-0.02267965, -0.09481957, -2.582346, 1, 1, 1, 1, 1,
-0.01842766, -0.4012029, -1.944952, 0, 0, 1, 1, 1,
-0.018287, -0.3255426, -2.685562, 1, 0, 0, 1, 1,
-0.01523259, -1.856181, -3.631495, 1, 0, 0, 1, 1,
-0.01502088, -0.5390628, -3.128181, 1, 0, 0, 1, 1,
-0.01445406, -0.1635028, -1.666813, 1, 0, 0, 1, 1,
-0.01397975, -0.8271594, -1.961491, 1, 0, 0, 1, 1,
-0.01163759, 0.6100005, 0.8251656, 0, 0, 0, 1, 1,
-0.005306332, -0.9972173, -3.270904, 0, 0, 0, 1, 1,
-0.002356521, 0.385871, 0.3285235, 0, 0, 0, 1, 1,
0.0007711165, -1.306284, 1.892762, 0, 0, 0, 1, 1,
0.005367292, -0.05171577, 2.148715, 0, 0, 0, 1, 1,
0.01478719, -0.5406569, 1.841768, 0, 0, 0, 1, 1,
0.01943616, 0.8792719, -1.345847, 0, 0, 0, 1, 1,
0.02111272, -0.2072151, 1.686646, 1, 1, 1, 1, 1,
0.02693402, 0.9380348, -1.413992, 1, 1, 1, 1, 1,
0.02771454, 1.218708, -0.7278497, 1, 1, 1, 1, 1,
0.02960961, -0.9970022, 4.69033, 1, 1, 1, 1, 1,
0.0362306, 0.9182733, 0.1502917, 1, 1, 1, 1, 1,
0.03827395, -1.35892, 1.721028, 1, 1, 1, 1, 1,
0.0410506, 0.06974117, 0.5445299, 1, 1, 1, 1, 1,
0.04710525, -0.1162654, 2.572891, 1, 1, 1, 1, 1,
0.05316042, -0.09956326, 2.943806, 1, 1, 1, 1, 1,
0.05418272, 0.04617843, 0.06415121, 1, 1, 1, 1, 1,
0.05703256, 0.8207405, -1.612528, 1, 1, 1, 1, 1,
0.06317934, -0.2744784, -0.5575333, 1, 1, 1, 1, 1,
0.06510811, 0.8811652, 0.5567608, 1, 1, 1, 1, 1,
0.0675703, -0.4651687, 3.138509, 1, 1, 1, 1, 1,
0.06916188, 1.355851, -0.2965603, 1, 1, 1, 1, 1,
0.07010452, 1.011021, -1.180959, 0, 0, 1, 1, 1,
0.07082419, 0.2767793, -0.01959052, 1, 0, 0, 1, 1,
0.07152106, 0.5907945, -2.20832, 1, 0, 0, 1, 1,
0.07798375, 1.180214, 0.3567773, 1, 0, 0, 1, 1,
0.07798872, 1.429211, -0.1047696, 1, 0, 0, 1, 1,
0.08328192, 1.05075, -0.7310296, 1, 0, 0, 1, 1,
0.08911219, 1.080623, -0.9700345, 0, 0, 0, 1, 1,
0.08979958, 0.2989661, 0.1911835, 0, 0, 0, 1, 1,
0.09293222, -1.626407, 3.245297, 0, 0, 0, 1, 1,
0.09857348, 1.307702, -0.1792355, 0, 0, 0, 1, 1,
0.09970781, 0.1376944, 2.175344, 0, 0, 0, 1, 1,
0.1040376, 0.2279713, -0.09100749, 0, 0, 0, 1, 1,
0.1049257, 0.3549963, -0.6934419, 0, 0, 0, 1, 1,
0.1085729, -0.9569966, 4.233378, 1, 1, 1, 1, 1,
0.1132255, 1.242193, 0.5534382, 1, 1, 1, 1, 1,
0.1137823, 0.2681836, -0.5867853, 1, 1, 1, 1, 1,
0.11633, 0.5869948, 0.1801298, 1, 1, 1, 1, 1,
0.1169417, -1.476827, 3.692112, 1, 1, 1, 1, 1,
0.1172299, 0.08300028, 1.068088, 1, 1, 1, 1, 1,
0.1200388, -0.01066303, 2.130661, 1, 1, 1, 1, 1,
0.1295091, -1.180008, 2.701808, 1, 1, 1, 1, 1,
0.1300717, 2.893002, -0.9145004, 1, 1, 1, 1, 1,
0.1315366, 0.6585427, 0.3331253, 1, 1, 1, 1, 1,
0.13401, -1.473304, 2.152201, 1, 1, 1, 1, 1,
0.1343891, -1.104265, 3.082558, 1, 1, 1, 1, 1,
0.1384015, -0.2396016, 2.528992, 1, 1, 1, 1, 1,
0.1414515, 1.046885, -0.9038505, 1, 1, 1, 1, 1,
0.1434748, 1.277837, -1.598863, 1, 1, 1, 1, 1,
0.1468813, 1.636989, 0.3396241, 0, 0, 1, 1, 1,
0.1504204, 1.295422, -0.9273484, 1, 0, 0, 1, 1,
0.1536962, -0.7757782, 3.103716, 1, 0, 0, 1, 1,
0.1537385, -0.8596925, 2.519265, 1, 0, 0, 1, 1,
0.1557092, -0.1056882, 2.732347, 1, 0, 0, 1, 1,
0.1635578, 1.734383, -0.7695629, 1, 0, 0, 1, 1,
0.1706129, -1.013898, 3.132892, 0, 0, 0, 1, 1,
0.1721827, 0.06141317, 1.746669, 0, 0, 0, 1, 1,
0.1733889, -0.5268603, 2.499123, 0, 0, 0, 1, 1,
0.1818756, -0.2404432, 2.751485, 0, 0, 0, 1, 1,
0.1893525, 0.5882872, 0.8001357, 0, 0, 0, 1, 1,
0.1909089, 0.08629531, -0.7151512, 0, 0, 0, 1, 1,
0.1909995, 1.559889, -0.3480313, 0, 0, 0, 1, 1,
0.1924847, -1.331741, 3.762162, 1, 1, 1, 1, 1,
0.1952854, 1.718104, -1.487737, 1, 1, 1, 1, 1,
0.1982996, -1.613057, 1.495842, 1, 1, 1, 1, 1,
0.2005306, 0.5483009, -0.1453668, 1, 1, 1, 1, 1,
0.2037547, -1.422304, 3.325431, 1, 1, 1, 1, 1,
0.2047622, -0.8199865, 3.85193, 1, 1, 1, 1, 1,
0.2076491, 0.2124903, 0.8475195, 1, 1, 1, 1, 1,
0.2087376, -1.71563, 5.112149, 1, 1, 1, 1, 1,
0.2087431, 0.3403011, -0.01259066, 1, 1, 1, 1, 1,
0.2108458, 0.6758848, 0.6108126, 1, 1, 1, 1, 1,
0.2154859, 1.997307, -0.8871344, 1, 1, 1, 1, 1,
0.2212829, -0.5440808, 2.125315, 1, 1, 1, 1, 1,
0.2215182, -0.8541321, 0.9592252, 1, 1, 1, 1, 1,
0.2221479, 1.309627, -0.2622456, 1, 1, 1, 1, 1,
0.2267836, -0.6292827, 2.778548, 1, 1, 1, 1, 1,
0.2273529, -1.459676, 4.477952, 0, 0, 1, 1, 1,
0.2283936, -1.595482, 1.637877, 1, 0, 0, 1, 1,
0.2295841, -0.6612758, 3.852917, 1, 0, 0, 1, 1,
0.229675, -0.4343288, 3.320327, 1, 0, 0, 1, 1,
0.2308083, -0.7380558, 3.10179, 1, 0, 0, 1, 1,
0.2334797, 0.9210786, 1.10836, 1, 0, 0, 1, 1,
0.2339677, 0.9132972, 0.3024712, 0, 0, 0, 1, 1,
0.2340911, 0.8748102, 0.7694491, 0, 0, 0, 1, 1,
0.2354056, -0.003274339, 0.1271645, 0, 0, 0, 1, 1,
0.2358981, -0.5700495, 2.469778, 0, 0, 0, 1, 1,
0.237934, -0.7515897, 4.676128, 0, 0, 0, 1, 1,
0.2470526, 0.9583932, -0.01848768, 0, 0, 0, 1, 1,
0.2487057, -1.882356, 0.7557852, 0, 0, 0, 1, 1,
0.2511917, -0.6339207, 3.302989, 1, 1, 1, 1, 1,
0.2529449, 0.1222, 3.497853, 1, 1, 1, 1, 1,
0.2629218, -0.2278551, 1.283409, 1, 1, 1, 1, 1,
0.2636631, -0.6139611, 1.617405, 1, 1, 1, 1, 1,
0.2677951, 1.883029, -0.6235719, 1, 1, 1, 1, 1,
0.2678615, 0.2822548, 1.271359, 1, 1, 1, 1, 1,
0.2686851, -0.6070822, 2.948074, 1, 1, 1, 1, 1,
0.269235, -0.3794802, 3.627593, 1, 1, 1, 1, 1,
0.2737428, 0.8715342, 0.9057277, 1, 1, 1, 1, 1,
0.2752042, -0.2868284, 2.69699, 1, 1, 1, 1, 1,
0.2775117, 0.2821465, -1.3248, 1, 1, 1, 1, 1,
0.2776472, 1.161121, 1.369187, 1, 1, 1, 1, 1,
0.2778945, 0.4450245, -0.4678637, 1, 1, 1, 1, 1,
0.2788379, 1.358105, 0.8791112, 1, 1, 1, 1, 1,
0.2792596, 0.2410086, 0.2924072, 1, 1, 1, 1, 1,
0.2866917, 0.6740798, 1.05294, 0, 0, 1, 1, 1,
0.2868562, -0.05111227, 1.946377, 1, 0, 0, 1, 1,
0.2934964, 0.7375192, 0.09224424, 1, 0, 0, 1, 1,
0.2946407, -1.387167, 2.443017, 1, 0, 0, 1, 1,
0.2950508, -0.08016356, 1.505433, 1, 0, 0, 1, 1,
0.2953554, -1.79037, 2.55397, 1, 0, 0, 1, 1,
0.2967928, -0.1536095, 0.7480131, 0, 0, 0, 1, 1,
0.2973936, -0.2711852, 1.651536, 0, 0, 0, 1, 1,
0.3045952, 0.3806494, -0.9553517, 0, 0, 0, 1, 1,
0.3067991, -0.03939077, 0.5216439, 0, 0, 0, 1, 1,
0.3072334, -1.212909, 1.027508, 0, 0, 0, 1, 1,
0.309443, 0.7060009, -0.3509311, 0, 0, 0, 1, 1,
0.3100295, -0.311134, 1.133255, 0, 0, 0, 1, 1,
0.3109192, 0.3757617, 2.0188, 1, 1, 1, 1, 1,
0.3122449, -0.01100556, 1.683011, 1, 1, 1, 1, 1,
0.3134467, 0.1897718, 2.092079, 1, 1, 1, 1, 1,
0.3151751, -0.4889535, 3.373396, 1, 1, 1, 1, 1,
0.3154201, -0.6479243, 4.222347, 1, 1, 1, 1, 1,
0.3205734, 0.3610166, 0.473539, 1, 1, 1, 1, 1,
0.3207442, -1.013419, 2.62547, 1, 1, 1, 1, 1,
0.3213904, -0.07990047, 1.282848, 1, 1, 1, 1, 1,
0.322917, 0.03607247, 1.575072, 1, 1, 1, 1, 1,
0.3270003, 2.714614, 0.3949673, 1, 1, 1, 1, 1,
0.3322838, 1.046298, 1.196486, 1, 1, 1, 1, 1,
0.334855, 0.2078539, 0.3849101, 1, 1, 1, 1, 1,
0.3363952, 0.1427831, 2.027221, 1, 1, 1, 1, 1,
0.3373837, -0.2746634, 2.221022, 1, 1, 1, 1, 1,
0.3382075, -1.965214, 2.967453, 1, 1, 1, 1, 1,
0.3387666, -0.7643564, 1.50998, 0, 0, 1, 1, 1,
0.3395211, -0.7107766, 1.404624, 1, 0, 0, 1, 1,
0.341263, 0.6246422, -0.2431349, 1, 0, 0, 1, 1,
0.3437617, -0.9345537, 0.9167879, 1, 0, 0, 1, 1,
0.344032, 2.079707, 2.765164, 1, 0, 0, 1, 1,
0.3440882, 0.523562, 0.6149804, 1, 0, 0, 1, 1,
0.3458453, 0.9401603, 1.215484, 0, 0, 0, 1, 1,
0.3501401, 0.07979562, 1.638368, 0, 0, 0, 1, 1,
0.3532989, -1.069379, 2.949159, 0, 0, 0, 1, 1,
0.3535419, -0.1434801, 2.363561, 0, 0, 0, 1, 1,
0.3545514, 1.243361, -0.009238365, 0, 0, 0, 1, 1,
0.3553266, 0.186098, 1.953258, 0, 0, 0, 1, 1,
0.355462, 1.359118, 1.647294, 0, 0, 0, 1, 1,
0.3574712, 0.2305839, 0.1342431, 1, 1, 1, 1, 1,
0.3591445, 0.1189037, 0.2215514, 1, 1, 1, 1, 1,
0.3598154, 1.122858, -0.4658509, 1, 1, 1, 1, 1,
0.3672953, 2.498741, -1.551445, 1, 1, 1, 1, 1,
0.368347, -0.6719187, 2.682853, 1, 1, 1, 1, 1,
0.3726308, 0.5078576, 0.9900407, 1, 1, 1, 1, 1,
0.3735398, -0.1133512, 1.482266, 1, 1, 1, 1, 1,
0.3746389, -1.330944, 1.557764, 1, 1, 1, 1, 1,
0.3771227, 0.0650913, 1.953032, 1, 1, 1, 1, 1,
0.3795791, 0.8833067, 0.2776524, 1, 1, 1, 1, 1,
0.379673, -0.5890285, 2.88118, 1, 1, 1, 1, 1,
0.3818107, 0.1283603, 1.347682, 1, 1, 1, 1, 1,
0.3857355, -0.4224188, 1.990136, 1, 1, 1, 1, 1,
0.3859963, 0.409084, 2.67955, 1, 1, 1, 1, 1,
0.3863263, 0.5868769, 0.9634434, 1, 1, 1, 1, 1,
0.3900389, 0.3486703, 0.8216588, 0, 0, 1, 1, 1,
0.3943104, -1.400133, 3.917294, 1, 0, 0, 1, 1,
0.4011655, -0.6395005, 3.544014, 1, 0, 0, 1, 1,
0.4024571, -0.279864, 1.401519, 1, 0, 0, 1, 1,
0.4040883, -0.01887267, 3.116252, 1, 0, 0, 1, 1,
0.4042002, 0.7194538, 0.4656162, 1, 0, 0, 1, 1,
0.4053609, 0.9622182, 1.053216, 0, 0, 0, 1, 1,
0.409164, -0.1038365, 1.986098, 0, 0, 0, 1, 1,
0.4186627, -1.382974, 2.735096, 0, 0, 0, 1, 1,
0.4212598, -2.600246, 0.7831205, 0, 0, 0, 1, 1,
0.422592, -0.2592362, 2.856948, 0, 0, 0, 1, 1,
0.4244835, -1.427533, 2.422032, 0, 0, 0, 1, 1,
0.4293354, 0.02886847, 1.825486, 0, 0, 0, 1, 1,
0.4299991, 0.5018458, 0.8795003, 1, 1, 1, 1, 1,
0.4335979, -1.010695, 3.248998, 1, 1, 1, 1, 1,
0.4365572, -0.6538023, 2.185741, 1, 1, 1, 1, 1,
0.4367922, 1.708907, 0.0007787131, 1, 1, 1, 1, 1,
0.4372332, -0.388373, 3.195546, 1, 1, 1, 1, 1,
0.4402074, 0.1788748, -0.9594418, 1, 1, 1, 1, 1,
0.4456859, -1.202037, 3.50388, 1, 1, 1, 1, 1,
0.4467648, 0.4241344, -0.07843196, 1, 1, 1, 1, 1,
0.4565243, 1.195387, -0.9555511, 1, 1, 1, 1, 1,
0.4615062, -0.1913869, 2.847703, 1, 1, 1, 1, 1,
0.4622215, 0.1477345, 1.985299, 1, 1, 1, 1, 1,
0.4632415, -0.2991575, 3.401339, 1, 1, 1, 1, 1,
0.4634297, -1.136357, 1.858435, 1, 1, 1, 1, 1,
0.4644935, 1.345229, -0.1964575, 1, 1, 1, 1, 1,
0.4648523, 0.6926744, -0.05997153, 1, 1, 1, 1, 1,
0.4677942, -0.4785331, 0.4968054, 0, 0, 1, 1, 1,
0.4740131, -0.3054551, 3.432085, 1, 0, 0, 1, 1,
0.4742863, -0.2244325, 1.754906, 1, 0, 0, 1, 1,
0.4756939, 0.4725399, 0.2998966, 1, 0, 0, 1, 1,
0.4783693, -0.5051029, 1.320236, 1, 0, 0, 1, 1,
0.4799299, 0.01553186, 1.172551, 1, 0, 0, 1, 1,
0.4818411, 1.655418, 0.2272941, 0, 0, 0, 1, 1,
0.482011, 0.3850817, -0.675256, 0, 0, 0, 1, 1,
0.4826923, 0.2370289, -0.06712481, 0, 0, 0, 1, 1,
0.4846416, -1.216534, 0.4859743, 0, 0, 0, 1, 1,
0.4866325, -0.5187122, 5.256402, 0, 0, 0, 1, 1,
0.4872971, 1.757009, 0.921731, 0, 0, 0, 1, 1,
0.4880586, -0.02082456, 0.6610872, 0, 0, 0, 1, 1,
0.488533, 0.9753861, 1.526282, 1, 1, 1, 1, 1,
0.490833, 0.811976, 0.1169473, 1, 1, 1, 1, 1,
0.4928797, -1.302309, 1.329318, 1, 1, 1, 1, 1,
0.5004555, -0.2893813, 0.1633478, 1, 1, 1, 1, 1,
0.5030659, 2.102737, 0.4279734, 1, 1, 1, 1, 1,
0.5072438, 0.1064745, 1.313322, 1, 1, 1, 1, 1,
0.5105299, -0.6343993, 1.480528, 1, 1, 1, 1, 1,
0.5169577, 0.7913414, 2.197105, 1, 1, 1, 1, 1,
0.5213744, 0.430319, 2.48338, 1, 1, 1, 1, 1,
0.5244269, 0.1625549, 1.382819, 1, 1, 1, 1, 1,
0.5267203, -0.2450882, 2.908544, 1, 1, 1, 1, 1,
0.5276509, -1.652014, 4.448507, 1, 1, 1, 1, 1,
0.5284788, 0.5262771, 2.214724, 1, 1, 1, 1, 1,
0.5295395, -0.6961467, 3.820211, 1, 1, 1, 1, 1,
0.5316187, -1.372401, 3.659958, 1, 1, 1, 1, 1,
0.5320017, -0.8422557, 0.2505, 0, 0, 1, 1, 1,
0.5385993, -0.1563537, 3.337308, 1, 0, 0, 1, 1,
0.5389585, 1.414243, 0.7845832, 1, 0, 0, 1, 1,
0.5442878, -1.974427, 3.691176, 1, 0, 0, 1, 1,
0.5493761, 2.192525, -0.1315641, 1, 0, 0, 1, 1,
0.5509802, -0.2994641, 0.4660041, 1, 0, 0, 1, 1,
0.5574378, -1.316769, 1.588404, 0, 0, 0, 1, 1,
0.5592061, -1.977886, 2.796983, 0, 0, 0, 1, 1,
0.5592823, -0.2968484, 2.361458, 0, 0, 0, 1, 1,
0.56441, 1.214986, 0.6230568, 0, 0, 0, 1, 1,
0.5722258, -0.4635125, 2.042827, 0, 0, 0, 1, 1,
0.57333, 1.006164, 1.722449, 0, 0, 0, 1, 1,
0.5758895, 0.9480682, 0.9240513, 0, 0, 0, 1, 1,
0.5820687, 1.760035, -0.2470206, 1, 1, 1, 1, 1,
0.5834077, -0.9899904, 3.731883, 1, 1, 1, 1, 1,
0.5883552, 1.42093, -0.2560638, 1, 1, 1, 1, 1,
0.5887967, 0.9149321, 0.7654745, 1, 1, 1, 1, 1,
0.5894701, 0.4526813, 1.150629, 1, 1, 1, 1, 1,
0.5962713, 1.478534, 0.330997, 1, 1, 1, 1, 1,
0.6045911, -1.875977, 2.732559, 1, 1, 1, 1, 1,
0.6076115, -1.629621, 2.229151, 1, 1, 1, 1, 1,
0.6088189, -0.09499257, 2.286884, 1, 1, 1, 1, 1,
0.610655, 0.9752543, -0.2169429, 1, 1, 1, 1, 1,
0.6127435, 0.4166271, 1.241473, 1, 1, 1, 1, 1,
0.6148745, -1.163823, 3.240093, 1, 1, 1, 1, 1,
0.6156958, -0.2419298, 1.534501, 1, 1, 1, 1, 1,
0.6194547, 0.8258088, 0.2515163, 1, 1, 1, 1, 1,
0.6236721, -0.2035614, 1.18366, 1, 1, 1, 1, 1,
0.6255868, -0.07024083, 1.265939, 0, 0, 1, 1, 1,
0.6268843, 0.5247175, 1.457, 1, 0, 0, 1, 1,
0.6292352, -0.6681077, 2.183214, 1, 0, 0, 1, 1,
0.6309569, 0.2636655, 0.7663083, 1, 0, 0, 1, 1,
0.6320907, -1.058876, 1.278683, 1, 0, 0, 1, 1,
0.637329, 0.4789971, 3.993247, 1, 0, 0, 1, 1,
0.6376169, 0.6464882, 0.3932628, 0, 0, 0, 1, 1,
0.6382817, 2.110364, 1.299232, 0, 0, 0, 1, 1,
0.6385203, 0.6254727, 0.89711, 0, 0, 0, 1, 1,
0.6398338, 1.163728, -0.5718821, 0, 0, 0, 1, 1,
0.6503859, 0.7598386, 1.273304, 0, 0, 0, 1, 1,
0.654157, 0.5964699, -0.04615977, 0, 0, 0, 1, 1,
0.6546011, 0.1210881, -0.1934131, 0, 0, 0, 1, 1,
0.6634198, -0.8180692, 2.649981, 1, 1, 1, 1, 1,
0.6757358, -0.7884354, 2.216475, 1, 1, 1, 1, 1,
0.6818209, -0.361818, 0.3955793, 1, 1, 1, 1, 1,
0.6857356, 1.776589, 0.3507027, 1, 1, 1, 1, 1,
0.6857551, 0.06100746, 0.5208628, 1, 1, 1, 1, 1,
0.686276, -0.935929, 4.611826, 1, 1, 1, 1, 1,
0.6866001, 0.2557726, 2.399449, 1, 1, 1, 1, 1,
0.6976693, -0.8631842, 1.822384, 1, 1, 1, 1, 1,
0.7041177, 0.3137763, 1.77313, 1, 1, 1, 1, 1,
0.7079563, 0.1994149, 0.9619316, 1, 1, 1, 1, 1,
0.7194566, 0.6937457, 0.6599302, 1, 1, 1, 1, 1,
0.7226704, 1.761818, -0.1514183, 1, 1, 1, 1, 1,
0.7269658, -0.7358212, 2.916075, 1, 1, 1, 1, 1,
0.7271115, 0.9088961, 0.9768174, 1, 1, 1, 1, 1,
0.7273812, 0.3014032, 1.433964, 1, 1, 1, 1, 1,
0.7338899, 0.5017013, 0.444525, 0, 0, 1, 1, 1,
0.734188, -0.005487273, 1.44214, 1, 0, 0, 1, 1,
0.7362213, 0.07521476, 1.495549, 1, 0, 0, 1, 1,
0.7397007, 0.7830099, -0.2051838, 1, 0, 0, 1, 1,
0.7408783, 0.6196716, 1.864424, 1, 0, 0, 1, 1,
0.7431347, -0.1609219, 2.430717, 1, 0, 0, 1, 1,
0.7464418, -1.439304, 3.197998, 0, 0, 0, 1, 1,
0.7469553, -1.100947, 1.234631, 0, 0, 0, 1, 1,
0.7472678, -2.305107, 2.688007, 0, 0, 0, 1, 1,
0.748786, 2.614053, -1.554671, 0, 0, 0, 1, 1,
0.7545049, 2.040946, 0.638293, 0, 0, 0, 1, 1,
0.755789, -0.8750164, 1.906434, 0, 0, 0, 1, 1,
0.756783, -2.792063, 2.124626, 0, 0, 0, 1, 1,
0.7586679, 0.8460135, -0.5037362, 1, 1, 1, 1, 1,
0.7613158, 0.3784238, -0.4820697, 1, 1, 1, 1, 1,
0.7635688, 0.7034097, 0.3212788, 1, 1, 1, 1, 1,
0.7744896, 1.87417, -0.4143931, 1, 1, 1, 1, 1,
0.7745906, -1.171903, 2.283038, 1, 1, 1, 1, 1,
0.7771807, 0.9261577, -0.8877258, 1, 1, 1, 1, 1,
0.7797862, 0.4452512, 1.339005, 1, 1, 1, 1, 1,
0.7816936, -0.450317, 3.801594, 1, 1, 1, 1, 1,
0.7852928, 1.383761, 2.478816, 1, 1, 1, 1, 1,
0.7868009, 0.7450425, 0.6670852, 1, 1, 1, 1, 1,
0.7893059, 1.434199, 0.04000189, 1, 1, 1, 1, 1,
0.7977403, 0.7386192, 1.179081, 1, 1, 1, 1, 1,
0.7993913, -2.578306, 3.499893, 1, 1, 1, 1, 1,
0.8009455, -0.02238297, 2.831761, 1, 1, 1, 1, 1,
0.8046393, -0.4819675, 3.392972, 1, 1, 1, 1, 1,
0.8051379, 1.354649, -0.5356477, 0, 0, 1, 1, 1,
0.8085166, 0.05146362, 1.266057, 1, 0, 0, 1, 1,
0.8113229, 1.488718, 0.473133, 1, 0, 0, 1, 1,
0.8121747, -0.4280514, 2.624429, 1, 0, 0, 1, 1,
0.8151442, -1.72465, 2.697305, 1, 0, 0, 1, 1,
0.8181364, -2.013021, 3.027358, 1, 0, 0, 1, 1,
0.8202919, 0.182791, 0.08717433, 0, 0, 0, 1, 1,
0.8246442, -1.110315, 3.203301, 0, 0, 0, 1, 1,
0.827688, 0.09794366, 1.961119, 0, 0, 0, 1, 1,
0.8297238, -1.354616, 0.2554339, 0, 0, 0, 1, 1,
0.8318992, -0.9402004, 2.691838, 0, 0, 0, 1, 1,
0.8423727, 0.4221641, 2.82383, 0, 0, 0, 1, 1,
0.8428416, -0.8123842, 2.696502, 0, 0, 0, 1, 1,
0.8432437, -0.6951293, 2.273587, 1, 1, 1, 1, 1,
0.8439649, 0.203966, 2.515546, 1, 1, 1, 1, 1,
0.8459622, -0.9094748, 2.684192, 1, 1, 1, 1, 1,
0.8493778, 0.5630534, 2.191975, 1, 1, 1, 1, 1,
0.8519915, -1.083844, 2.136081, 1, 1, 1, 1, 1,
0.8526236, 0.262724, 0.3880847, 1, 1, 1, 1, 1,
0.8530046, 0.3915865, 0.4090067, 1, 1, 1, 1, 1,
0.8653642, -0.1660121, 0.8911164, 1, 1, 1, 1, 1,
0.8708582, 0.4803562, 2.122296, 1, 1, 1, 1, 1,
0.8737286, -0.4808901, 3.143122, 1, 1, 1, 1, 1,
0.8741235, 1.49204, 1.312047, 1, 1, 1, 1, 1,
0.8747872, 1.443956, 0.09411089, 1, 1, 1, 1, 1,
0.8770431, -0.1623099, 2.008361, 1, 1, 1, 1, 1,
0.8781069, 1.044982, 1.09961, 1, 1, 1, 1, 1,
0.8782018, 0.5821339, 2.306854, 1, 1, 1, 1, 1,
0.8807339, 0.05687771, 0.8198922, 0, 0, 1, 1, 1,
0.8839996, -0.1882881, 2.923021, 1, 0, 0, 1, 1,
0.8846954, -0.6291018, 2.407253, 1, 0, 0, 1, 1,
0.8875986, 1.147802, -0.214278, 1, 0, 0, 1, 1,
0.8905071, 0.1870761, 1.810674, 1, 0, 0, 1, 1,
0.8907227, 1.215685, 0.6126688, 1, 0, 0, 1, 1,
0.8921383, 0.03447209, 2.130313, 0, 0, 0, 1, 1,
0.8948971, 1.198537, 0.951237, 0, 0, 0, 1, 1,
0.9034702, 0.1841391, 2.225798, 0, 0, 0, 1, 1,
0.9066544, 2.682884, -1.046216, 0, 0, 0, 1, 1,
0.9083895, -1.045752, 2.426981, 0, 0, 0, 1, 1,
0.9084645, -0.8122735, 2.641187, 0, 0, 0, 1, 1,
0.9101335, -1.481015, 3.192457, 0, 0, 0, 1, 1,
0.9136781, 0.9513754, 0.9709385, 1, 1, 1, 1, 1,
0.9178122, 0.9836917, 2.534901, 1, 1, 1, 1, 1,
0.9234062, -0.4870807, 2.060992, 1, 1, 1, 1, 1,
0.9270365, -0.9165393, 3.750581, 1, 1, 1, 1, 1,
0.9289317, 1.585571, 0.6520967, 1, 1, 1, 1, 1,
0.9332853, 1.162943, 1.819549, 1, 1, 1, 1, 1,
0.935159, 0.6479266, 1.335033, 1, 1, 1, 1, 1,
0.935353, 0.3268991, 1.945836, 1, 1, 1, 1, 1,
0.93557, 0.8854292, 2.322846, 1, 1, 1, 1, 1,
0.937613, -0.6691235, 2.908552, 1, 1, 1, 1, 1,
0.9392154, -0.09088077, 1.55345, 1, 1, 1, 1, 1,
0.9466913, -0.5861367, 2.657151, 1, 1, 1, 1, 1,
0.9500563, -0.3750268, 0.1317223, 1, 1, 1, 1, 1,
0.9515296, 0.1003107, 1.372283, 1, 1, 1, 1, 1,
0.9557917, -0.6491318, 0.6467436, 1, 1, 1, 1, 1,
0.9586097, -0.02355406, 2.174342, 0, 0, 1, 1, 1,
0.9590303, -0.5555384, 1.19016, 1, 0, 0, 1, 1,
0.9634814, 0.7861803, 0.1026963, 1, 0, 0, 1, 1,
0.9710269, -0.03211862, 1.744041, 1, 0, 0, 1, 1,
0.9745573, 0.03267898, 1.544263, 1, 0, 0, 1, 1,
0.9753605, -0.05339929, 1.910476, 1, 0, 0, 1, 1,
0.975781, -2.585554, 3.667914, 0, 0, 0, 1, 1,
0.9781616, 0.6831839, 0.157558, 0, 0, 0, 1, 1,
0.9864459, -1.068887, 1.511866, 0, 0, 0, 1, 1,
0.9890121, -0.04963926, 3.656525, 0, 0, 0, 1, 1,
1.005706, 1.224985, 0.05929145, 0, 0, 0, 1, 1,
1.012629, -1.351725, 4.928765, 0, 0, 0, 1, 1,
1.015796, -0.8342729, 2.292652, 0, 0, 0, 1, 1,
1.016314, -0.5197506, -0.02793181, 1, 1, 1, 1, 1,
1.016484, 0.7595991, -0.4585986, 1, 1, 1, 1, 1,
1.016824, -0.3012143, 3.933493, 1, 1, 1, 1, 1,
1.032707, 0.633736, 0.5995044, 1, 1, 1, 1, 1,
1.033319, -1.544332, 3.166544, 1, 1, 1, 1, 1,
1.044312, -1.514226, 0.3037531, 1, 1, 1, 1, 1,
1.046793, 0.4010868, 0.983917, 1, 1, 1, 1, 1,
1.056931, -0.2394011, 0.8768468, 1, 1, 1, 1, 1,
1.058123, -0.4578575, 0.8957662, 1, 1, 1, 1, 1,
1.059817, -0.2101448, 0.970757, 1, 1, 1, 1, 1,
1.060253, -1.549403, 2.484192, 1, 1, 1, 1, 1,
1.064513, 1.06269, 1.470315, 1, 1, 1, 1, 1,
1.072313, 0.920274, 1.136673, 1, 1, 1, 1, 1,
1.081081, -0.5384285, 3.681307, 1, 1, 1, 1, 1,
1.087297, -1.067236, 3.099826, 1, 1, 1, 1, 1,
1.10207, -0.653037, 3.466616, 0, 0, 1, 1, 1,
1.104696, 1.207784, -0.784548, 1, 0, 0, 1, 1,
1.109675, 0.1541462, 0.9434224, 1, 0, 0, 1, 1,
1.112901, 1.009006, 0.7948612, 1, 0, 0, 1, 1,
1.120378, 0.5486479, 0.9640641, 1, 0, 0, 1, 1,
1.122126, -0.5346901, 1.748707, 1, 0, 0, 1, 1,
1.123693, 2.860852, -0.1647564, 0, 0, 0, 1, 1,
1.129359, 1.920116, 0.6667829, 0, 0, 0, 1, 1,
1.129853, 1.781147, 1.260276, 0, 0, 0, 1, 1,
1.132765, 1.017211, -0.3165944, 0, 0, 0, 1, 1,
1.135251, -0.722487, 2.241981, 0, 0, 0, 1, 1,
1.135469, 1.419089, -0.5403345, 0, 0, 0, 1, 1,
1.148151, -0.4810806, 2.52582, 0, 0, 0, 1, 1,
1.152032, -0.4480253, 2.331462, 1, 1, 1, 1, 1,
1.155406, 0.005095207, 2.082889, 1, 1, 1, 1, 1,
1.164193, -0.303582, 1.223594, 1, 1, 1, 1, 1,
1.165005, -0.141158, 1.194089, 1, 1, 1, 1, 1,
1.166088, -0.1445786, 2.462105, 1, 1, 1, 1, 1,
1.170223, -1.469642, 3.515455, 1, 1, 1, 1, 1,
1.172103, 0.1163004, -0.002081884, 1, 1, 1, 1, 1,
1.183072, -1.351623, 0.8236558, 1, 1, 1, 1, 1,
1.190742, 0.3722648, 2.864242, 1, 1, 1, 1, 1,
1.193625, 1.067507, 1.219991, 1, 1, 1, 1, 1,
1.195702, 1.272875, 1.114267, 1, 1, 1, 1, 1,
1.197063, 0.4443277, 2.026813, 1, 1, 1, 1, 1,
1.202664, -1.534061, 3.262923, 1, 1, 1, 1, 1,
1.207569, -1.129257, 4.43413, 1, 1, 1, 1, 1,
1.208603, 0.8321382, 1.131566, 1, 1, 1, 1, 1,
1.209569, 0.7748217, 1.646175, 0, 0, 1, 1, 1,
1.211253, 1.671466, 0.9043083, 1, 0, 0, 1, 1,
1.218198, 1.524905, 1.308404, 1, 0, 0, 1, 1,
1.235262, 0.3152649, 1.707654, 1, 0, 0, 1, 1,
1.259853, 0.588129, 0.5615751, 1, 0, 0, 1, 1,
1.272283, -0.1661107, 3.042119, 1, 0, 0, 1, 1,
1.276194, -1.312375, 2.550759, 0, 0, 0, 1, 1,
1.276675, 0.2201723, 2.272696, 0, 0, 0, 1, 1,
1.283322, 0.9450646, 2.033414, 0, 0, 0, 1, 1,
1.283892, -0.8225504, 2.290427, 0, 0, 0, 1, 1,
1.301937, -1.144592, 1.878592, 0, 0, 0, 1, 1,
1.316453, -0.9668888, 1.343837, 0, 0, 0, 1, 1,
1.327914, 0.06770084, 2.310852, 0, 0, 0, 1, 1,
1.354156, 0.4220442, 1.293434, 1, 1, 1, 1, 1,
1.356463, 1.09161, 0.3959367, 1, 1, 1, 1, 1,
1.359228, -1.897109, 3.122723, 1, 1, 1, 1, 1,
1.368843, -0.01276841, 1.742888, 1, 1, 1, 1, 1,
1.373443, -0.9349026, 3.585814, 1, 1, 1, 1, 1,
1.389486, -1.930396, 2.982947, 1, 1, 1, 1, 1,
1.397552, 0.1246233, 2.133316, 1, 1, 1, 1, 1,
1.405901, -2.803919, 1.625049, 1, 1, 1, 1, 1,
1.423691, -1.973058, 1.797103, 1, 1, 1, 1, 1,
1.432199, 0.7340544, 1.192812, 1, 1, 1, 1, 1,
1.435442, 0.7385382, 0.4370894, 1, 1, 1, 1, 1,
1.440679, 0.7691098, 2.395972, 1, 1, 1, 1, 1,
1.446608, -0.429912, 1.25692, 1, 1, 1, 1, 1,
1.446668, 0.4976981, 1.26146, 1, 1, 1, 1, 1,
1.447876, -0.433886, 2.228812, 1, 1, 1, 1, 1,
1.451111, 0.5394216, 2.115491, 0, 0, 1, 1, 1,
1.451239, 0.7182124, 2.097428, 1, 0, 0, 1, 1,
1.461841, -0.2622553, 2.881181, 1, 0, 0, 1, 1,
1.487376, 1.964099, 0.3922782, 1, 0, 0, 1, 1,
1.489698, 0.6170508, -0.7543779, 1, 0, 0, 1, 1,
1.506419, -0.1689067, 1.170931, 1, 0, 0, 1, 1,
1.510248, 1.054491, 2.611598, 0, 0, 0, 1, 1,
1.519284, 0.5527997, 2.238498, 0, 0, 0, 1, 1,
1.535212, -1.116054, 2.915019, 0, 0, 0, 1, 1,
1.552763, -0.5049288, 1.351434, 0, 0, 0, 1, 1,
1.569383, -0.166926, 0.1387836, 0, 0, 0, 1, 1,
1.569877, 0.06213919, 1.913891, 0, 0, 0, 1, 1,
1.576445, -1.059235, 2.389506, 0, 0, 0, 1, 1,
1.579615, 0.7355978, -0.4669475, 1, 1, 1, 1, 1,
1.599579, -1.040717, 0.08793476, 1, 1, 1, 1, 1,
1.605193, 0.1877386, 1.21169, 1, 1, 1, 1, 1,
1.609261, 0.2112508, 2.29874, 1, 1, 1, 1, 1,
1.611402, -2.435804, 2.312615, 1, 1, 1, 1, 1,
1.612196, 1.283695, 2.063982, 1, 1, 1, 1, 1,
1.613658, 0.6013893, 1.713261, 1, 1, 1, 1, 1,
1.615339, 1.037026, 0.4454912, 1, 1, 1, 1, 1,
1.620859, 0.893598, -0.4871414, 1, 1, 1, 1, 1,
1.624369, 1.342263, 0.8467637, 1, 1, 1, 1, 1,
1.62545, -1.014725, 3.314071, 1, 1, 1, 1, 1,
1.629079, 1.005481, 1.441359, 1, 1, 1, 1, 1,
1.631396, 2.961397, 1.72098, 1, 1, 1, 1, 1,
1.657208, 0.7305346, 0.6231319, 1, 1, 1, 1, 1,
1.664878, -2.342774, 1.984849, 1, 1, 1, 1, 1,
1.667664, -0.619042, 2.134771, 0, 0, 1, 1, 1,
1.67964, 1.225011, 1.652008, 1, 0, 0, 1, 1,
1.684092, -1.007809, 3.381453, 1, 0, 0, 1, 1,
1.694596, -0.3540502, -0.5663975, 1, 0, 0, 1, 1,
1.735728, -0.3307159, 1.576253, 1, 0, 0, 1, 1,
1.739136, 0.7525513, 2.43345, 1, 0, 0, 1, 1,
1.739562, -1.681006, 1.954618, 0, 0, 0, 1, 1,
1.74146, 0.3328767, 2.142236, 0, 0, 0, 1, 1,
1.743418, 0.1402773, -1.200997, 0, 0, 0, 1, 1,
1.757138, -0.9114373, 2.893535, 0, 0, 0, 1, 1,
1.759038, -1.542668, 3.075741, 0, 0, 0, 1, 1,
1.783503, -0.3873391, 0.7638246, 0, 0, 0, 1, 1,
1.824931, -0.2459688, 3.508172, 0, 0, 0, 1, 1,
1.832309, -0.07607084, 1.172726, 1, 1, 1, 1, 1,
1.849599, -0.5825609, 3.560018, 1, 1, 1, 1, 1,
1.855097, -0.7124929, -0.584053, 1, 1, 1, 1, 1,
1.864362, 0.9650986, 2.838102, 1, 1, 1, 1, 1,
1.865894, -0.8737875, 3.737931, 1, 1, 1, 1, 1,
1.898583, -0.3893707, 1.921713, 1, 1, 1, 1, 1,
1.931071, 0.1598957, 0.99572, 1, 1, 1, 1, 1,
1.957251, -0.5331016, 3.025225, 1, 1, 1, 1, 1,
1.96162, 1.516922, 1.639578, 1, 1, 1, 1, 1,
1.975613, -0.2575662, 0.8101391, 1, 1, 1, 1, 1,
2.029338, -0.75006, 3.105373, 1, 1, 1, 1, 1,
2.067723, 0.3564473, 1.276491, 1, 1, 1, 1, 1,
2.070857, 0.6931777, 2.085119, 1, 1, 1, 1, 1,
2.089198, -0.3725673, 0.6236449, 1, 1, 1, 1, 1,
2.092021, -0.3086269, 1.21377, 1, 1, 1, 1, 1,
2.110949, 0.06497502, -0.02018626, 0, 0, 1, 1, 1,
2.11666, 0.9125683, 0.7131047, 1, 0, 0, 1, 1,
2.170222, 1.474647, 0.9673756, 1, 0, 0, 1, 1,
2.179608, 0.6240895, 3.550844, 1, 0, 0, 1, 1,
2.189859, 0.329514, 0.6340823, 1, 0, 0, 1, 1,
2.243197, 0.3232517, 1.281225, 1, 0, 0, 1, 1,
2.259443, -0.475547, 1.288959, 0, 0, 0, 1, 1,
2.357219, -0.3235021, 2.340083, 0, 0, 0, 1, 1,
2.369501, 1.746944, 1.529066, 0, 0, 0, 1, 1,
2.480024, 0.006417724, 2.595691, 0, 0, 0, 1, 1,
2.48109, 1.529448, 0.8730919, 0, 0, 0, 1, 1,
2.503387, 0.05680726, 2.248101, 0, 0, 0, 1, 1,
2.514387, 1.533149, 1.968799, 0, 0, 0, 1, 1,
2.612031, -0.4057101, 0.7804771, 1, 1, 1, 1, 1,
2.641163, -1.337212, 1.784988, 1, 1, 1, 1, 1,
2.868575, -1.092185, 1.237798, 1, 1, 1, 1, 1,
2.952715, 0.1333262, 2.275534, 1, 1, 1, 1, 1,
2.967052, -0.3302593, 2.6411, 1, 1, 1, 1, 1,
2.99717, -0.2284742, 1.614053, 1, 1, 1, 1, 1,
3.100991, -0.9972251, 2.161023, 1, 1, 1, 1, 1
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
var radius = 9.443383;
var distance = 33.16948;
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
mvMatrix.translate( 0.006158829, 0.0009484291, 0.156986 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.16948);
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
