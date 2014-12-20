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
-3.404245, 0.2412146, -1.479152, 1, 0, 0, 1,
-3.042859, -1.597792, -3.638085, 1, 0.007843138, 0, 1,
-2.907894, 1.386112, -0.5204417, 1, 0.01176471, 0, 1,
-2.907474, -0.2459482, -1.034, 1, 0.01960784, 0, 1,
-2.804837, -0.5227152, 0.2299165, 1, 0.02352941, 0, 1,
-2.754663, -0.4465179, -0.5230686, 1, 0.03137255, 0, 1,
-2.664901, 0.6849295, -1.126668, 1, 0.03529412, 0, 1,
-2.651647, 0.4862238, -1.278397, 1, 0.04313726, 0, 1,
-2.563834, -0.4208489, -0.2240222, 1, 0.04705882, 0, 1,
-2.490329, -0.6368904, -0.5510145, 1, 0.05490196, 0, 1,
-2.443183, -0.5616739, 0.4760696, 1, 0.05882353, 0, 1,
-2.395697, -1.43022, -0.8900117, 1, 0.06666667, 0, 1,
-2.257745, -0.8541512, -1.6829, 1, 0.07058824, 0, 1,
-2.248645, 0.7292898, -2.502318, 1, 0.07843138, 0, 1,
-2.231211, 0.6326878, -2.145383, 1, 0.08235294, 0, 1,
-2.16547, -0.1819824, -3.362938, 1, 0.09019608, 0, 1,
-2.139387, 0.5960879, -0.6240693, 1, 0.09411765, 0, 1,
-2.138523, 0.1521584, -3.520534, 1, 0.1019608, 0, 1,
-2.063017, -0.05701627, -2.520208, 1, 0.1098039, 0, 1,
-2.044202, -0.5124508, -0.6483316, 1, 0.1137255, 0, 1,
-2.030256, -0.9205347, -2.413569, 1, 0.1215686, 0, 1,
-2.025327, 1.098778, -0.2231799, 1, 0.1254902, 0, 1,
-2.009311, 0.4143193, -1.907026, 1, 0.1333333, 0, 1,
-1.996189, -0.1014432, -0.2552025, 1, 0.1372549, 0, 1,
-1.981599, 1.447449, -0.8699592, 1, 0.145098, 0, 1,
-1.963376, -0.8559473, -1.110433, 1, 0.1490196, 0, 1,
-1.952878, -1.960462, -3.113289, 1, 0.1568628, 0, 1,
-1.948576, -2.169009, -3.028235, 1, 0.1607843, 0, 1,
-1.946871, 0.4279608, 0.9746944, 1, 0.1686275, 0, 1,
-1.945809, 0.7798014, -0.4967718, 1, 0.172549, 0, 1,
-1.927377, 0.8225079, -1.939736, 1, 0.1803922, 0, 1,
-1.900531, -0.6968027, -1.684875, 1, 0.1843137, 0, 1,
-1.883336, 1.582068, -1.763028, 1, 0.1921569, 0, 1,
-1.869573, -1.460664, -0.7169026, 1, 0.1960784, 0, 1,
-1.855102, 0.5382482, -1.742841, 1, 0.2039216, 0, 1,
-1.850636, -0.5159932, -2.54139, 1, 0.2117647, 0, 1,
-1.809357, 1.131556, -1.486816, 1, 0.2156863, 0, 1,
-1.804868, -0.07458235, -1.502228, 1, 0.2235294, 0, 1,
-1.803542, 0.5154278, -1.461303, 1, 0.227451, 0, 1,
-1.791002, 2.204106, -0.2333705, 1, 0.2352941, 0, 1,
-1.774634, -0.337027, -0.9580275, 1, 0.2392157, 0, 1,
-1.757514, 0.8566614, -0.7786736, 1, 0.2470588, 0, 1,
-1.757454, -0.8518645, 0.08337777, 1, 0.2509804, 0, 1,
-1.75661, -0.2474879, -0.7711002, 1, 0.2588235, 0, 1,
-1.750451, 0.5745442, -1.723137, 1, 0.2627451, 0, 1,
-1.742793, -0.3691342, -2.853701, 1, 0.2705882, 0, 1,
-1.741532, -0.9854863, -2.740015, 1, 0.2745098, 0, 1,
-1.738689, -1.062921, -2.805752, 1, 0.282353, 0, 1,
-1.736373, -0.1753217, -2.953698, 1, 0.2862745, 0, 1,
-1.710759, 0.1217135, -1.136946, 1, 0.2941177, 0, 1,
-1.710678, 1.182461, -0.4721994, 1, 0.3019608, 0, 1,
-1.695694, -0.6683862, -2.321543, 1, 0.3058824, 0, 1,
-1.687184, 0.8805755, -0.879756, 1, 0.3137255, 0, 1,
-1.684315, -1.776806, -3.676171, 1, 0.3176471, 0, 1,
-1.682074, 0.2227849, 0.8926606, 1, 0.3254902, 0, 1,
-1.678564, 1.428828, -2.076246, 1, 0.3294118, 0, 1,
-1.663459, 0.1678267, -0.655202, 1, 0.3372549, 0, 1,
-1.643439, -0.1827706, -1.715127, 1, 0.3411765, 0, 1,
-1.631662, 0.6452165, -2.932257, 1, 0.3490196, 0, 1,
-1.609915, -0.8177841, -1.086659, 1, 0.3529412, 0, 1,
-1.580587, -1.177488, -2.612805, 1, 0.3607843, 0, 1,
-1.57822, 1.402983, -0.9732696, 1, 0.3647059, 0, 1,
-1.574499, -1.319706, -2.56723, 1, 0.372549, 0, 1,
-1.569727, 0.8473126, -0.1144834, 1, 0.3764706, 0, 1,
-1.555307, 0.8439063, 0.4299293, 1, 0.3843137, 0, 1,
-1.554582, -0.3465765, -3.292771, 1, 0.3882353, 0, 1,
-1.544155, 0.731414, -1.368605, 1, 0.3960784, 0, 1,
-1.530352, 0.8454712, -1.604085, 1, 0.4039216, 0, 1,
-1.529289, -0.4387701, -0.6909596, 1, 0.4078431, 0, 1,
-1.514648, -1.468467, -1.411247, 1, 0.4156863, 0, 1,
-1.509675, -0.289003, -2.219394, 1, 0.4196078, 0, 1,
-1.508908, 1.126186, -1.755342, 1, 0.427451, 0, 1,
-1.507614, 1.278213, 0.9258654, 1, 0.4313726, 0, 1,
-1.505341, -1.452318, -3.574531, 1, 0.4392157, 0, 1,
-1.489828, -0.3403982, -2.309997, 1, 0.4431373, 0, 1,
-1.470396, 2.231308, 0.7272204, 1, 0.4509804, 0, 1,
-1.467207, -1.421338, -1.316243, 1, 0.454902, 0, 1,
-1.458626, 0.7648347, 0.763318, 1, 0.4627451, 0, 1,
-1.452518, 0.9501958, -1.818541, 1, 0.4666667, 0, 1,
-1.451553, 1.67398, -0.1761447, 1, 0.4745098, 0, 1,
-1.45009, -0.1443072, -1.967406, 1, 0.4784314, 0, 1,
-1.444107, 1.050644, -0.6919506, 1, 0.4862745, 0, 1,
-1.433848, -1.157579, -0.7267526, 1, 0.4901961, 0, 1,
-1.413016, 0.3885326, -1.31377, 1, 0.4980392, 0, 1,
-1.398564, 0.5157627, -1.786455, 1, 0.5058824, 0, 1,
-1.386036, 0.8857181, -1.412381, 1, 0.509804, 0, 1,
-1.381338, -1.523435, -2.361769, 1, 0.5176471, 0, 1,
-1.378543, 0.2608491, -2.919572, 1, 0.5215687, 0, 1,
-1.375921, 1.011518, -1.407007, 1, 0.5294118, 0, 1,
-1.37261, 0.04478106, -0.716539, 1, 0.5333334, 0, 1,
-1.370928, 1.135378, -0.3091823, 1, 0.5411765, 0, 1,
-1.370625, -0.2766197, -3.079784, 1, 0.5450981, 0, 1,
-1.360904, -0.6168277, -3.944269, 1, 0.5529412, 0, 1,
-1.35144, 1.377093, -0.805209, 1, 0.5568628, 0, 1,
-1.336703, -1.256149, -2.545599, 1, 0.5647059, 0, 1,
-1.324669, -0.183344, -1.548485, 1, 0.5686275, 0, 1,
-1.322552, -2.134457, -2.335055, 1, 0.5764706, 0, 1,
-1.305992, -0.7238129, -1.227308, 1, 0.5803922, 0, 1,
-1.301023, -0.4280309, -4.06689, 1, 0.5882353, 0, 1,
-1.295562, 0.162651, -0.7624581, 1, 0.5921569, 0, 1,
-1.285601, 2.31822, 0.6692983, 1, 0.6, 0, 1,
-1.282182, 0.3807443, -0.1302701, 1, 0.6078432, 0, 1,
-1.280446, -0.06520091, -1.389887, 1, 0.6117647, 0, 1,
-1.278966, 0.7796052, -0.3174204, 1, 0.6196079, 0, 1,
-1.278764, 0.8464096, 1.688934, 1, 0.6235294, 0, 1,
-1.266887, 0.08723949, -2.681512, 1, 0.6313726, 0, 1,
-1.263342, 2.32162, -0.8515807, 1, 0.6352941, 0, 1,
-1.261078, -0.5300116, -2.388232, 1, 0.6431373, 0, 1,
-1.259602, 0.2052289, -1.800092, 1, 0.6470588, 0, 1,
-1.258816, -0.9983252, -3.159189, 1, 0.654902, 0, 1,
-1.257366, -0.6032897, -3.234863, 1, 0.6588235, 0, 1,
-1.25535, -0.8080934, 0.5595769, 1, 0.6666667, 0, 1,
-1.251139, -0.480869, -1.35671, 1, 0.6705883, 0, 1,
-1.250763, -0.2681552, -1.649497, 1, 0.6784314, 0, 1,
-1.249824, -1.008702, -2.420745, 1, 0.682353, 0, 1,
-1.244331, -0.8832275, -2.45047, 1, 0.6901961, 0, 1,
-1.242301, -0.04820544, -2.129481, 1, 0.6941177, 0, 1,
-1.241347, 0.8885996, -1.042478, 1, 0.7019608, 0, 1,
-1.239179, -0.1522523, -1.75589, 1, 0.7098039, 0, 1,
-1.236463, -0.01406412, -1.606044, 1, 0.7137255, 0, 1,
-1.235093, -2.143328, -1.643066, 1, 0.7215686, 0, 1,
-1.223432, 1.544346, 1.004909, 1, 0.7254902, 0, 1,
-1.223055, -0.3662112, -0.7589547, 1, 0.7333333, 0, 1,
-1.220276, 0.1613208, -0.8467709, 1, 0.7372549, 0, 1,
-1.213095, -0.8936718, -2.32212, 1, 0.7450981, 0, 1,
-1.211252, -1.157481, -2.150376, 1, 0.7490196, 0, 1,
-1.209867, -1.638126, -2.44432, 1, 0.7568628, 0, 1,
-1.207759, 0.5834777, -0.4823712, 1, 0.7607843, 0, 1,
-1.195376, 0.2343123, -1.196016, 1, 0.7686275, 0, 1,
-1.193173, 0.2149917, -1.872167, 1, 0.772549, 0, 1,
-1.191658, -0.4370779, -2.370506, 1, 0.7803922, 0, 1,
-1.189575, 0.1241734, -2.32738, 1, 0.7843137, 0, 1,
-1.188416, -0.7358811, -3.120812, 1, 0.7921569, 0, 1,
-1.184469, -0.7215595, -0.9990549, 1, 0.7960784, 0, 1,
-1.180665, 1.132122, -0.3578631, 1, 0.8039216, 0, 1,
-1.178898, -0.1497893, -2.217777, 1, 0.8117647, 0, 1,
-1.175287, -1.248551, -1.142565, 1, 0.8156863, 0, 1,
-1.174854, -0.6863083, -2.80539, 1, 0.8235294, 0, 1,
-1.172512, 2.021585, -0.970036, 1, 0.827451, 0, 1,
-1.169292, -0.3081256, -1.058657, 1, 0.8352941, 0, 1,
-1.168401, 0.0125349, -1.520736, 1, 0.8392157, 0, 1,
-1.159667, -0.5360188, -2.8073, 1, 0.8470588, 0, 1,
-1.158554, -0.9358627, -2.062872, 1, 0.8509804, 0, 1,
-1.150652, -1.876141, -1.954904, 1, 0.8588235, 0, 1,
-1.148293, -1.084493, -1.693919, 1, 0.8627451, 0, 1,
-1.14783, 0.09607664, -0.3533345, 1, 0.8705882, 0, 1,
-1.141, 1.34519, 0.3274437, 1, 0.8745098, 0, 1,
-1.139015, 0.793355, -1.154422, 1, 0.8823529, 0, 1,
-1.137161, 0.7919515, -0.3209272, 1, 0.8862745, 0, 1,
-1.128713, -0.3685002, -1.939347, 1, 0.8941177, 0, 1,
-1.12773, -0.6875381, -1.51082, 1, 0.8980392, 0, 1,
-1.126755, -0.8223647, -2.205776, 1, 0.9058824, 0, 1,
-1.12659, -0.4734187, -1.693476, 1, 0.9137255, 0, 1,
-1.125539, -0.1951776, -1.34301, 1, 0.9176471, 0, 1,
-1.118036, 0.4312444, -1.036798, 1, 0.9254902, 0, 1,
-1.116683, -0.7858528, -1.617203, 1, 0.9294118, 0, 1,
-1.115086, -0.913368, -1.380193, 1, 0.9372549, 0, 1,
-1.11384, -0.873982, -1.906201, 1, 0.9411765, 0, 1,
-1.10921, 0.5750462, -0.08302811, 1, 0.9490196, 0, 1,
-1.10821, 0.2782369, -1.829548, 1, 0.9529412, 0, 1,
-1.10521, 0.2381628, -1.170804, 1, 0.9607843, 0, 1,
-1.093373, 2.432165, 0.8779812, 1, 0.9647059, 0, 1,
-1.090211, 1.087229, -1.931164, 1, 0.972549, 0, 1,
-1.090028, 1.407192, -0.5872675, 1, 0.9764706, 0, 1,
-1.084945, -0.5568391, -0.05388598, 1, 0.9843137, 0, 1,
-1.084933, 0.3700392, -1.65577, 1, 0.9882353, 0, 1,
-1.082372, -0.6923648, -1.42458, 1, 0.9960784, 0, 1,
-1.081918, -0.05038627, -1.10822, 0.9960784, 1, 0, 1,
-1.081427, -0.3448525, -1.857681, 0.9921569, 1, 0, 1,
-1.079723, -0.8198714, -2.642014, 0.9843137, 1, 0, 1,
-1.073382, 0.2489883, -0.5867801, 0.9803922, 1, 0, 1,
-1.070913, 0.1333287, -3.20051, 0.972549, 1, 0, 1,
-1.06889, 1.226282, -1.957066, 0.9686275, 1, 0, 1,
-1.067044, 1.405196, -1.742192, 0.9607843, 1, 0, 1,
-1.063287, -1.282131, -1.383812, 0.9568627, 1, 0, 1,
-1.062098, -0.0001190156, -2.438611, 0.9490196, 1, 0, 1,
-1.059692, -1.18723, -3.386194, 0.945098, 1, 0, 1,
-1.055014, -0.04589662, -1.433921, 0.9372549, 1, 0, 1,
-1.05072, -1.065756, -1.464213, 0.9333333, 1, 0, 1,
-1.041413, 0.1612036, -1.191856, 0.9254902, 1, 0, 1,
-1.037966, -0.02324044, -0.9369615, 0.9215686, 1, 0, 1,
-1.037657, -0.09228314, -1.968257, 0.9137255, 1, 0, 1,
-1.029009, -1.549121, -4.00545, 0.9098039, 1, 0, 1,
-1.026474, 0.08383546, -0.645209, 0.9019608, 1, 0, 1,
-1.023996, -1.609227, -2.836711, 0.8941177, 1, 0, 1,
-1.023572, 0.2009003, -1.149591, 0.8901961, 1, 0, 1,
-1.020336, 0.4676763, -1.755729, 0.8823529, 1, 0, 1,
-1.018958, -1.323534, -1.298334, 0.8784314, 1, 0, 1,
-1.013902, 0.08401951, -2.317953, 0.8705882, 1, 0, 1,
-1.013552, -0.2516807, -2.667595, 0.8666667, 1, 0, 1,
-1.012872, 0.2454668, -2.837188, 0.8588235, 1, 0, 1,
-1.012079, 0.1939709, -1.830251, 0.854902, 1, 0, 1,
-0.9979621, -1.847187, -3.204249, 0.8470588, 1, 0, 1,
-0.9892836, 0.2708328, -0.1285754, 0.8431373, 1, 0, 1,
-0.9889238, -0.5832423, -1.113173, 0.8352941, 1, 0, 1,
-0.9863898, 0.6039785, -1.808488, 0.8313726, 1, 0, 1,
-0.9773621, 1.478315, 0.4885, 0.8235294, 1, 0, 1,
-0.9747583, -0.01079584, -1.849651, 0.8196079, 1, 0, 1,
-0.9741603, 0.3154085, -0.310441, 0.8117647, 1, 0, 1,
-0.9693547, -0.1621742, 0.2401147, 0.8078431, 1, 0, 1,
-0.9673691, 0.140112, -2.212459, 0.8, 1, 0, 1,
-0.9614336, -0.2274387, -0.6604173, 0.7921569, 1, 0, 1,
-0.9542307, 0.9391361, -1.86159, 0.7882353, 1, 0, 1,
-0.9485294, 0.7302746, -0.1148924, 0.7803922, 1, 0, 1,
-0.9447243, 0.5635903, -2.511269, 0.7764706, 1, 0, 1,
-0.9434121, 0.7174988, 0.3942719, 0.7686275, 1, 0, 1,
-0.9424594, 0.4248385, -0.8755293, 0.7647059, 1, 0, 1,
-0.9360316, -0.4903989, -2.462848, 0.7568628, 1, 0, 1,
-0.9311516, -0.8847923, -1.852195, 0.7529412, 1, 0, 1,
-0.9294788, -0.3697753, -2.270704, 0.7450981, 1, 0, 1,
-0.9268954, -0.3888316, -2.41626, 0.7411765, 1, 0, 1,
-0.9183754, 0.5320944, -0.7508203, 0.7333333, 1, 0, 1,
-0.9183075, -0.9615828, -1.813065, 0.7294118, 1, 0, 1,
-0.9152822, -0.8296907, -1.479174, 0.7215686, 1, 0, 1,
-0.9147248, 0.9186786, 0.1149566, 0.7176471, 1, 0, 1,
-0.9121408, 0.343586, -2.057651, 0.7098039, 1, 0, 1,
-0.9120421, -0.7313332, -2.831614, 0.7058824, 1, 0, 1,
-0.9067146, 1.006338, -0.171171, 0.6980392, 1, 0, 1,
-0.9047133, 0.471759, -1.696175, 0.6901961, 1, 0, 1,
-0.9025688, 1.337217, -0.14216, 0.6862745, 1, 0, 1,
-0.8926377, 1.648166, -1.665862, 0.6784314, 1, 0, 1,
-0.8918079, 0.8830476, -1.642077, 0.6745098, 1, 0, 1,
-0.8873978, 0.8660771, 0.1425367, 0.6666667, 1, 0, 1,
-0.8872424, 0.1065672, -2.026758, 0.6627451, 1, 0, 1,
-0.8859147, 1.251381, -1.483727, 0.654902, 1, 0, 1,
-0.8824582, 1.388941, -1.424452, 0.6509804, 1, 0, 1,
-0.878951, 1.697015, -0.5352387, 0.6431373, 1, 0, 1,
-0.8769079, -0.5557628, -2.63462, 0.6392157, 1, 0, 1,
-0.8685858, -1.664918, -2.95346, 0.6313726, 1, 0, 1,
-0.866827, 1.125435, -1.442266, 0.627451, 1, 0, 1,
-0.8665792, 0.8125226, -1.224705, 0.6196079, 1, 0, 1,
-0.8644578, 1.796564, -1.023135, 0.6156863, 1, 0, 1,
-0.8596889, -0.01064831, -1.751386, 0.6078432, 1, 0, 1,
-0.8589964, 1.697547, -1.12162, 0.6039216, 1, 0, 1,
-0.8534735, -0.1409224, -1.792797, 0.5960785, 1, 0, 1,
-0.8528492, -0.7310117, -3.386503, 0.5882353, 1, 0, 1,
-0.8404076, 0.1217156, -0.2095781, 0.5843138, 1, 0, 1,
-0.8374491, -0.9265094, -0.4007444, 0.5764706, 1, 0, 1,
-0.8366001, -0.8410981, -1.588691, 0.572549, 1, 0, 1,
-0.8360522, -0.06875349, -1.284548, 0.5647059, 1, 0, 1,
-0.8309342, -1.844292, -2.508464, 0.5607843, 1, 0, 1,
-0.8299884, -0.7092431, -3.891986, 0.5529412, 1, 0, 1,
-0.8267346, 0.3162803, -0.6896993, 0.5490196, 1, 0, 1,
-0.821584, 0.269465, -1.937804, 0.5411765, 1, 0, 1,
-0.8174073, 0.7740873, -0.06907469, 0.5372549, 1, 0, 1,
-0.8129287, 0.6094169, -1.306105, 0.5294118, 1, 0, 1,
-0.8094929, -0.5279923, -1.497787, 0.5254902, 1, 0, 1,
-0.8044537, 0.03754754, -2.041365, 0.5176471, 1, 0, 1,
-0.8040541, 0.3836628, 0.6013712, 0.5137255, 1, 0, 1,
-0.802702, -2.183021, -3.347679, 0.5058824, 1, 0, 1,
-0.7966993, 0.1086704, -1.185764, 0.5019608, 1, 0, 1,
-0.7959405, 0.3140863, -1.314664, 0.4941176, 1, 0, 1,
-0.7937683, 0.6595715, -1.256457, 0.4862745, 1, 0, 1,
-0.7935174, -1.376874, -2.896505, 0.4823529, 1, 0, 1,
-0.7920322, -0.3855085, -1.457193, 0.4745098, 1, 0, 1,
-0.7894935, -0.4471098, -1.900674, 0.4705882, 1, 0, 1,
-0.7834935, 0.7286684, 0.5067171, 0.4627451, 1, 0, 1,
-0.7796111, 0.6619744, -2.478225, 0.4588235, 1, 0, 1,
-0.7779739, 0.5840423, -1.51125, 0.4509804, 1, 0, 1,
-0.7759973, 0.8255574, -2.48886, 0.4470588, 1, 0, 1,
-0.7738973, 0.702714, 0.02625364, 0.4392157, 1, 0, 1,
-0.7675865, -0.6931435, -1.753285, 0.4352941, 1, 0, 1,
-0.7652321, 0.5221998, -0.9656378, 0.427451, 1, 0, 1,
-0.7604428, -0.09283627, -0.1517235, 0.4235294, 1, 0, 1,
-0.7536944, -1.602881, -2.441548, 0.4156863, 1, 0, 1,
-0.7515145, 0.7518625, -0.5810144, 0.4117647, 1, 0, 1,
-0.7504358, 0.75002, -1.173337, 0.4039216, 1, 0, 1,
-0.7464415, 0.7098644, -0.6921138, 0.3960784, 1, 0, 1,
-0.7444292, 0.7360946, 0.2787566, 0.3921569, 1, 0, 1,
-0.743803, 1.11882, -0.1678473, 0.3843137, 1, 0, 1,
-0.7424788, -0.9577938, -3.54476, 0.3803922, 1, 0, 1,
-0.7413502, -0.2265067, -2.255574, 0.372549, 1, 0, 1,
-0.7408799, 1.829056, 0.5361159, 0.3686275, 1, 0, 1,
-0.7281959, 0.8696239, -0.258022, 0.3607843, 1, 0, 1,
-0.7261206, 0.294985, -0.1621943, 0.3568628, 1, 0, 1,
-0.7231594, 0.4449313, -0.3702422, 0.3490196, 1, 0, 1,
-0.7231236, 0.2811726, 0.3649153, 0.345098, 1, 0, 1,
-0.7201574, -1.474799, -4.385521, 0.3372549, 1, 0, 1,
-0.7143897, 0.6449067, -1.98751, 0.3333333, 1, 0, 1,
-0.7076619, 1.305948, 0.3638251, 0.3254902, 1, 0, 1,
-0.7053306, -2.114406, -2.658649, 0.3215686, 1, 0, 1,
-0.7036976, 0.9958127, -0.9220021, 0.3137255, 1, 0, 1,
-0.7032571, 0.0197622, -2.55949, 0.3098039, 1, 0, 1,
-0.6923453, 0.2212382, -1.795187, 0.3019608, 1, 0, 1,
-0.6914563, 0.1639565, -1.550066, 0.2941177, 1, 0, 1,
-0.6862422, 0.0007662281, -2.242398, 0.2901961, 1, 0, 1,
-0.6849551, -1.565547, -2.384566, 0.282353, 1, 0, 1,
-0.6806363, 0.03731061, -0.8794855, 0.2784314, 1, 0, 1,
-0.6778437, 0.4982165, -0.7000906, 0.2705882, 1, 0, 1,
-0.671795, -0.5774025, -2.246748, 0.2666667, 1, 0, 1,
-0.6716213, -0.05883244, -0.7908005, 0.2588235, 1, 0, 1,
-0.6691369, -0.7849234, -1.124345, 0.254902, 1, 0, 1,
-0.6689152, 0.5018666, -0.4783706, 0.2470588, 1, 0, 1,
-0.6683059, 0.6769091, -0.8340027, 0.2431373, 1, 0, 1,
-0.6673536, -0.5228961, -0.4583806, 0.2352941, 1, 0, 1,
-0.6645023, -1.622522, -1.896969, 0.2313726, 1, 0, 1,
-0.6642013, 0.7300665, -1.124693, 0.2235294, 1, 0, 1,
-0.6546795, 2.355652, 2.393767, 0.2196078, 1, 0, 1,
-0.6545255, -1.110618, -1.65765, 0.2117647, 1, 0, 1,
-0.6539862, 0.5571511, -1.658626, 0.2078431, 1, 0, 1,
-0.6525377, -1.523418, -3.020852, 0.2, 1, 0, 1,
-0.6513073, 1.398398, 0.6843492, 0.1921569, 1, 0, 1,
-0.6509767, -0.3355868, -2.816048, 0.1882353, 1, 0, 1,
-0.647826, 2.472341, 0.1333107, 0.1803922, 1, 0, 1,
-0.6453937, -0.04465412, -2.37232, 0.1764706, 1, 0, 1,
-0.6451252, -0.4102326, -2.712774, 0.1686275, 1, 0, 1,
-0.6300924, 0.1719663, -1.776163, 0.1647059, 1, 0, 1,
-0.6163118, 0.2601877, -0.3023161, 0.1568628, 1, 0, 1,
-0.6099017, -2.819491, -0.5845326, 0.1529412, 1, 0, 1,
-0.6066022, -0.5712368, -1.928658, 0.145098, 1, 0, 1,
-0.6038738, -0.5351884, -2.538778, 0.1411765, 1, 0, 1,
-0.5950187, -0.3047235, -2.761878, 0.1333333, 1, 0, 1,
-0.5937226, -0.7550222, -4.540463, 0.1294118, 1, 0, 1,
-0.5932438, -0.06350595, -1.672153, 0.1215686, 1, 0, 1,
-0.5918301, -0.2291466, -0.6464586, 0.1176471, 1, 0, 1,
-0.5916709, -1.088816, -3.214632, 0.1098039, 1, 0, 1,
-0.5872399, 0.08931366, -3.014734, 0.1058824, 1, 0, 1,
-0.5813203, 0.4603682, -0.3267579, 0.09803922, 1, 0, 1,
-0.5765836, -1.231352, -1.488629, 0.09019608, 1, 0, 1,
-0.5760521, 1.364972, -1.956434, 0.08627451, 1, 0, 1,
-0.5675276, -0.01842591, -0.8886792, 0.07843138, 1, 0, 1,
-0.5641961, 0.9464285, -0.0101743, 0.07450981, 1, 0, 1,
-0.5582066, 0.8413192, 0.4793559, 0.06666667, 1, 0, 1,
-0.5554599, -1.413627, -2.156515, 0.0627451, 1, 0, 1,
-0.5544617, 1.049904, 0.5522748, 0.05490196, 1, 0, 1,
-0.5537354, 0.6344518, -0.05820177, 0.05098039, 1, 0, 1,
-0.5510587, 1.176359, 0.225807, 0.04313726, 1, 0, 1,
-0.5495361, 0.4077694, -0.2320556, 0.03921569, 1, 0, 1,
-0.5481695, 0.2211518, -1.46189, 0.03137255, 1, 0, 1,
-0.547626, 0.255534, -0.1940823, 0.02745098, 1, 0, 1,
-0.547363, -0.3430077, -3.043946, 0.01960784, 1, 0, 1,
-0.5409563, 1.170068, -1.108859, 0.01568628, 1, 0, 1,
-0.5381796, 0.1657994, 0.1286549, 0.007843138, 1, 0, 1,
-0.5352215, -0.7099252, -3.336826, 0.003921569, 1, 0, 1,
-0.5319809, -0.565783, -2.09011, 0, 1, 0.003921569, 1,
-0.5273474, -0.7675197, -1.39051, 0, 1, 0.01176471, 1,
-0.522896, 0.7846586, -0.8603097, 0, 1, 0.01568628, 1,
-0.5150651, -0.3074394, -2.890917, 0, 1, 0.02352941, 1,
-0.5139855, -0.05693729, -2.42798, 0, 1, 0.02745098, 1,
-0.5136983, -0.1959782, -2.279859, 0, 1, 0.03529412, 1,
-0.5113572, 1.156939, -0.1959442, 0, 1, 0.03921569, 1,
-0.5104879, -1.02088, -2.660582, 0, 1, 0.04705882, 1,
-0.5095919, 0.3692395, -0.4547988, 0, 1, 0.05098039, 1,
-0.5048876, 1.635411, -0.09319464, 0, 1, 0.05882353, 1,
-0.5048826, -0.4791647, -2.255709, 0, 1, 0.0627451, 1,
-0.4973766, 1.34906, -1.333799, 0, 1, 0.07058824, 1,
-0.4938689, -0.2743237, -2.851887, 0, 1, 0.07450981, 1,
-0.4927029, -0.2794975, -2.854975, 0, 1, 0.08235294, 1,
-0.4916447, -0.3314857, -3.109145, 0, 1, 0.08627451, 1,
-0.4916226, 1.772802, 2.447482, 0, 1, 0.09411765, 1,
-0.4913973, -0.168072, -1.383934, 0, 1, 0.1019608, 1,
-0.4903977, 1.043559, -1.778598, 0, 1, 0.1058824, 1,
-0.4881105, -0.4190805, -1.016161, 0, 1, 0.1137255, 1,
-0.4872614, -0.4065117, -1.442428, 0, 1, 0.1176471, 1,
-0.4736895, 0.549758, -1.293743, 0, 1, 0.1254902, 1,
-0.4696379, -0.7438036, -3.070119, 0, 1, 0.1294118, 1,
-0.4652535, -0.5343783, -3.404168, 0, 1, 0.1372549, 1,
-0.462602, 0.7475168, 0.3995127, 0, 1, 0.1411765, 1,
-0.4569107, 0.1275469, 0.2541767, 0, 1, 0.1490196, 1,
-0.4545018, -0.5590572, -1.828819, 0, 1, 0.1529412, 1,
-0.4527157, 0.1901831, 0.04292263, 0, 1, 0.1607843, 1,
-0.4526563, 1.104808, -0.1394281, 0, 1, 0.1647059, 1,
-0.4475604, 0.7369227, 1.179138, 0, 1, 0.172549, 1,
-0.443355, -0.6700535, -3.86795, 0, 1, 0.1764706, 1,
-0.4379303, -0.2903153, -0.3163215, 0, 1, 0.1843137, 1,
-0.4364243, 0.04832416, -1.212974, 0, 1, 0.1882353, 1,
-0.4349671, -0.1377345, -2.515311, 0, 1, 0.1960784, 1,
-0.4304109, 0.1172947, -3.74889, 0, 1, 0.2039216, 1,
-0.4303247, 0.5111186, -1.475246, 0, 1, 0.2078431, 1,
-0.4287488, -0.5535597, -1.337228, 0, 1, 0.2156863, 1,
-0.4273353, 0.01641926, -1.822284, 0, 1, 0.2196078, 1,
-0.422473, -1.104077, -4.21816, 0, 1, 0.227451, 1,
-0.4177587, -1.779608, -1.918861, 0, 1, 0.2313726, 1,
-0.4059941, 0.4750583, -1.15117, 0, 1, 0.2392157, 1,
-0.4059517, -0.2248944, -1.899091, 0, 1, 0.2431373, 1,
-0.4043875, -1.63656, -3.517709, 0, 1, 0.2509804, 1,
-0.4001847, 0.4581105, -0.4055002, 0, 1, 0.254902, 1,
-0.4000947, 1.059448, -1.744184, 0, 1, 0.2627451, 1,
-0.3991187, -0.4625186, -2.699732, 0, 1, 0.2666667, 1,
-0.3962421, 0.006266098, -1.010038, 0, 1, 0.2745098, 1,
-0.3889927, -2.469411, -3.129243, 0, 1, 0.2784314, 1,
-0.3856431, -1.578892, -3.846892, 0, 1, 0.2862745, 1,
-0.3796014, 0.03208334, -1.013392, 0, 1, 0.2901961, 1,
-0.3767994, -0.5454695, -2.423213, 0, 1, 0.2980392, 1,
-0.3744591, -0.8347722, -2.356208, 0, 1, 0.3058824, 1,
-0.368781, 1.484224, -0.3508853, 0, 1, 0.3098039, 1,
-0.3662113, -0.8444695, -3.266138, 0, 1, 0.3176471, 1,
-0.3635282, -0.3509003, -2.537362, 0, 1, 0.3215686, 1,
-0.3615009, -0.8977147, -1.305423, 0, 1, 0.3294118, 1,
-0.3587882, 2.482064, 0.3531338, 0, 1, 0.3333333, 1,
-0.3582228, -0.5925809, -2.946052, 0, 1, 0.3411765, 1,
-0.3486055, -0.05416562, -2.396632, 0, 1, 0.345098, 1,
-0.3480721, -1.664292, -3.371843, 0, 1, 0.3529412, 1,
-0.3452407, 0.3953927, -0.8713585, 0, 1, 0.3568628, 1,
-0.3449322, 0.3956603, -0.06190759, 0, 1, 0.3647059, 1,
-0.3435133, 0.8955091, -1.167686, 0, 1, 0.3686275, 1,
-0.3390039, 0.3882575, -0.4849522, 0, 1, 0.3764706, 1,
-0.3364971, 0.3108413, 0.110147, 0, 1, 0.3803922, 1,
-0.3350711, -0.85334, -2.28884, 0, 1, 0.3882353, 1,
-0.3339013, -0.5355471, -2.241661, 0, 1, 0.3921569, 1,
-0.3287353, -0.3454902, -4.356446, 0, 1, 0.4, 1,
-0.3282368, -1.60882, -3.37019, 0, 1, 0.4078431, 1,
-0.3282039, -1.158569, -4.246953, 0, 1, 0.4117647, 1,
-0.3269078, -0.9033928, -3.020706, 0, 1, 0.4196078, 1,
-0.3268408, -0.8628823, -1.409083, 0, 1, 0.4235294, 1,
-0.3264449, -0.8563247, -4.098896, 0, 1, 0.4313726, 1,
-0.3259863, -0.3582516, -1.968723, 0, 1, 0.4352941, 1,
-0.3258851, -1.567059, -2.656184, 0, 1, 0.4431373, 1,
-0.3240067, 0.2605173, -0.2965871, 0, 1, 0.4470588, 1,
-0.3227648, -0.7102569, -4.126232, 0, 1, 0.454902, 1,
-0.3167359, -1.355888, -2.15834, 0, 1, 0.4588235, 1,
-0.3164381, 1.535758, 0.4221412, 0, 1, 0.4666667, 1,
-0.3134377, 0.8980551, 1.450418, 0, 1, 0.4705882, 1,
-0.3130796, -0.8018874, -1.964935, 0, 1, 0.4784314, 1,
-0.312877, 0.5037324, -2.348465, 0, 1, 0.4823529, 1,
-0.3117459, 1.991411, -0.6382012, 0, 1, 0.4901961, 1,
-0.3098382, -0.1788668, -2.204682, 0, 1, 0.4941176, 1,
-0.3080261, 1.030281, 0.7552288, 0, 1, 0.5019608, 1,
-0.3077374, 1.007227, -1.169724, 0, 1, 0.509804, 1,
-0.3075499, 0.1404615, -2.588335, 0, 1, 0.5137255, 1,
-0.3043286, 0.904659, 0.3182583, 0, 1, 0.5215687, 1,
-0.2999834, -0.2539254, -1.676892, 0, 1, 0.5254902, 1,
-0.2977229, -0.4760041, -2.643708, 0, 1, 0.5333334, 1,
-0.2952255, -1.127312, -2.752158, 0, 1, 0.5372549, 1,
-0.2941245, 0.2563564, 0.1212434, 0, 1, 0.5450981, 1,
-0.2940497, -0.1637547, -2.19055, 0, 1, 0.5490196, 1,
-0.2933266, 0.2928994, -2.077458, 0, 1, 0.5568628, 1,
-0.2920688, 0.6483343, -0.02317259, 0, 1, 0.5607843, 1,
-0.2887842, 0.3310751, -0.4135805, 0, 1, 0.5686275, 1,
-0.2840242, 1.054406, -1.442179, 0, 1, 0.572549, 1,
-0.2803746, 0.9968578, -0.5138213, 0, 1, 0.5803922, 1,
-0.2798752, -1.716467, -3.776502, 0, 1, 0.5843138, 1,
-0.2711298, -0.8000179, -4.034071, 0, 1, 0.5921569, 1,
-0.2690269, -1.032749, -4.701619, 0, 1, 0.5960785, 1,
-0.2685292, -0.01502362, -2.455291, 0, 1, 0.6039216, 1,
-0.2655783, 0.8701734, 0.08323653, 0, 1, 0.6117647, 1,
-0.2622582, -1.79918, -3.817961, 0, 1, 0.6156863, 1,
-0.2586727, -0.7295266, -2.510036, 0, 1, 0.6235294, 1,
-0.2544604, 0.9184185, 0.8319359, 0, 1, 0.627451, 1,
-0.2509973, 0.6190979, -0.3484875, 0, 1, 0.6352941, 1,
-0.2420017, 0.20141, -2.147823, 0, 1, 0.6392157, 1,
-0.2369047, 0.7503592, 1.273507, 0, 1, 0.6470588, 1,
-0.2334077, 0.05236977, -1.360408, 0, 1, 0.6509804, 1,
-0.2332405, 1.750455, 0.4176867, 0, 1, 0.6588235, 1,
-0.2282907, -2.303555, -4.606448, 0, 1, 0.6627451, 1,
-0.2271205, 0.3141367, 0.1605372, 0, 1, 0.6705883, 1,
-0.2209037, 0.9149555, -1.132451, 0, 1, 0.6745098, 1,
-0.21669, -0.7298821, -3.481615, 0, 1, 0.682353, 1,
-0.2150659, 0.807281, -0.5103797, 0, 1, 0.6862745, 1,
-0.2150217, 1.376926, 0.9059143, 0, 1, 0.6941177, 1,
-0.2128774, -0.03095257, -2.87973, 0, 1, 0.7019608, 1,
-0.2120456, 0.5012388, -0.1250359, 0, 1, 0.7058824, 1,
-0.2047788, 0.353489, 0.4883121, 0, 1, 0.7137255, 1,
-0.2043706, 0.7459765, 0.8918976, 0, 1, 0.7176471, 1,
-0.2011158, 0.8336697, -1.133154, 0, 1, 0.7254902, 1,
-0.200583, -1.332936, -0.7967398, 0, 1, 0.7294118, 1,
-0.2003711, -0.4635647, -4.370622, 0, 1, 0.7372549, 1,
-0.1998363, 0.3370308, -1.783639, 0, 1, 0.7411765, 1,
-0.1996759, -1.060279, -3.146841, 0, 1, 0.7490196, 1,
-0.1981495, -0.2875296, 0.01453856, 0, 1, 0.7529412, 1,
-0.192574, -0.1261155, -2.389608, 0, 1, 0.7607843, 1,
-0.1925198, 1.011096, -0.9319461, 0, 1, 0.7647059, 1,
-0.1918535, -1.18474, -3.530391, 0, 1, 0.772549, 1,
-0.1878597, 0.139609, -0.432551, 0, 1, 0.7764706, 1,
-0.1840099, 1.134798, 1.992076, 0, 1, 0.7843137, 1,
-0.1837585, -0.4705999, -1.125931, 0, 1, 0.7882353, 1,
-0.1799129, 0.3304298, 0.1326765, 0, 1, 0.7960784, 1,
-0.1796367, 1.000103, 0.2908131, 0, 1, 0.8039216, 1,
-0.1764091, -1.525766, -2.091343, 0, 1, 0.8078431, 1,
-0.1725084, -0.5081266, -2.394318, 0, 1, 0.8156863, 1,
-0.1642828, -0.1673101, -2.610774, 0, 1, 0.8196079, 1,
-0.164167, -1.282789, -4.869626, 0, 1, 0.827451, 1,
-0.1630341, -0.2961867, -2.368918, 0, 1, 0.8313726, 1,
-0.1626893, -0.2219852, -2.694576, 0, 1, 0.8392157, 1,
-0.1584835, -0.1396054, -2.86038, 0, 1, 0.8431373, 1,
-0.1580446, 0.4120787, -0.4962021, 0, 1, 0.8509804, 1,
-0.1553442, -0.8697718, -3.663507, 0, 1, 0.854902, 1,
-0.1528108, 1.212552, 0.2892309, 0, 1, 0.8627451, 1,
-0.1477102, 1.305799, 0.569405, 0, 1, 0.8666667, 1,
-0.1469676, 0.0947763, -1.647718, 0, 1, 0.8745098, 1,
-0.1468856, 1.099056, -0.9486119, 0, 1, 0.8784314, 1,
-0.1460778, 1.097375, -0.5543068, 0, 1, 0.8862745, 1,
-0.1378698, -1.796515, -3.828114, 0, 1, 0.8901961, 1,
-0.1375063, -0.1904526, -3.153237, 0, 1, 0.8980392, 1,
-0.1346858, 0.1148113, -1.226675, 0, 1, 0.9058824, 1,
-0.132716, -0.4252831, -1.866554, 0, 1, 0.9098039, 1,
-0.1276633, 0.3330922, 0.4730507, 0, 1, 0.9176471, 1,
-0.1275671, 0.956874, -0.03945376, 0, 1, 0.9215686, 1,
-0.1240425, -0.8031946, -4.049361, 0, 1, 0.9294118, 1,
-0.1237636, -0.1183458, -3.361026, 0, 1, 0.9333333, 1,
-0.1215819, 1.05075, -0.2851114, 0, 1, 0.9411765, 1,
-0.1162434, -0.1013933, -3.479872, 0, 1, 0.945098, 1,
-0.1146959, -0.2925807, -2.707369, 0, 1, 0.9529412, 1,
-0.1146371, 0.4134418, -0.8202904, 0, 1, 0.9568627, 1,
-0.1120807, 0.1124451, -0.122659, 0, 1, 0.9647059, 1,
-0.1119603, -0.6595655, -4.729456, 0, 1, 0.9686275, 1,
-0.1107613, 0.4683651, 1.06178, 0, 1, 0.9764706, 1,
-0.1079607, -0.6436958, -2.151759, 0, 1, 0.9803922, 1,
-0.1023536, -1.070748, -2.583982, 0, 1, 0.9882353, 1,
-0.1010248, 0.1763014, -1.118975, 0, 1, 0.9921569, 1,
-0.1002087, 0.6226521, 0.01102624, 0, 1, 1, 1,
-0.09635852, -0.1437528, -2.266097, 0, 0.9921569, 1, 1,
-0.09539462, 1.069415, 0.05245391, 0, 0.9882353, 1, 1,
-0.09453452, 1.418951, 0.3203563, 0, 0.9803922, 1, 1,
-0.09104466, 0.7471411, -0.1442605, 0, 0.9764706, 1, 1,
-0.08984911, 0.6598973, -0.04420139, 0, 0.9686275, 1, 1,
-0.0896948, 1.793174, 1.005044, 0, 0.9647059, 1, 1,
-0.08499124, -1.374709, -2.52913, 0, 0.9568627, 1, 1,
-0.07971139, 0.3427847, 0.024835, 0, 0.9529412, 1, 1,
-0.07805058, -0.5982271, -3.141534, 0, 0.945098, 1, 1,
-0.074054, -0.3220574, -3.229935, 0, 0.9411765, 1, 1,
-0.06983492, -0.7857323, -1.150509, 0, 0.9333333, 1, 1,
-0.06694617, -0.4979426, -3.973633, 0, 0.9294118, 1, 1,
-0.06387022, 0.2699405, 1.616062, 0, 0.9215686, 1, 1,
-0.06209583, 0.6764874, 0.9344441, 0, 0.9176471, 1, 1,
-0.05300286, -0.5360247, -3.811226, 0, 0.9098039, 1, 1,
-0.04672476, 0.1192335, 0.3060779, 0, 0.9058824, 1, 1,
-0.04657399, -0.1011264, -2.317012, 0, 0.8980392, 1, 1,
-0.0464515, 0.2744345, 0.0331302, 0, 0.8901961, 1, 1,
-0.04352694, 1.370173, -1.461826, 0, 0.8862745, 1, 1,
-0.04081813, -1.271244, -3.312575, 0, 0.8784314, 1, 1,
-0.04003533, -0.2834729, -1.986467, 0, 0.8745098, 1, 1,
-0.0395339, -1.960235, -2.500054, 0, 0.8666667, 1, 1,
-0.03533573, 1.262454, 0.0221804, 0, 0.8627451, 1, 1,
-0.02691045, 1.599461, 1.416751, 0, 0.854902, 1, 1,
-0.02488242, -2.232435, -2.529586, 0, 0.8509804, 1, 1,
-0.01275397, 0.2315316, 0.5526351, 0, 0.8431373, 1, 1,
-0.01221473, -2.274728, -3.03392, 0, 0.8392157, 1, 1,
-0.01118026, -0.5751183, -2.94311, 0, 0.8313726, 1, 1,
-0.007342002, -1.933446, -2.91438, 0, 0.827451, 1, 1,
-0.0006482961, 0.1409565, -0.7247967, 0, 0.8196079, 1, 1,
0.005598888, 0.4221669, 0.9199492, 0, 0.8156863, 1, 1,
0.01221924, -1.63161, 3.123052, 0, 0.8078431, 1, 1,
0.0124027, -0.759477, 3.494489, 0, 0.8039216, 1, 1,
0.013825, -0.1315523, 3.376246, 0, 0.7960784, 1, 1,
0.01410646, -0.2450459, 4.425912, 0, 0.7882353, 1, 1,
0.01519658, 0.8516928, -1.447427, 0, 0.7843137, 1, 1,
0.01712705, -0.3443418, 2.300954, 0, 0.7764706, 1, 1,
0.01737127, 1.495065, 0.6576659, 0, 0.772549, 1, 1,
0.02361556, 0.9571859, -0.2018535, 0, 0.7647059, 1, 1,
0.02399502, 1.411964, -1.696554, 0, 0.7607843, 1, 1,
0.02529862, 1.417386, 2.510341, 0, 0.7529412, 1, 1,
0.02561475, 0.3640459, -1.748332, 0, 0.7490196, 1, 1,
0.02744557, 0.6355454, -0.3584181, 0, 0.7411765, 1, 1,
0.02896942, 0.1007108, -1.619249, 0, 0.7372549, 1, 1,
0.03235433, 0.1114589, 0.3448586, 0, 0.7294118, 1, 1,
0.03332156, -0.6266944, 2.970529, 0, 0.7254902, 1, 1,
0.0352929, 0.1417422, 0.7251201, 0, 0.7176471, 1, 1,
0.03617999, 0.4104433, 0.3207906, 0, 0.7137255, 1, 1,
0.03777312, 1.075729, -0.8606151, 0, 0.7058824, 1, 1,
0.03924839, 0.9598383, -0.1587723, 0, 0.6980392, 1, 1,
0.04170907, -0.177442, 4.448494, 0, 0.6941177, 1, 1,
0.04199536, -1.218272, 4.538887, 0, 0.6862745, 1, 1,
0.04514193, 1.65732, 2.288232, 0, 0.682353, 1, 1,
0.04900548, 0.7913929, 0.5641629, 0, 0.6745098, 1, 1,
0.05117703, -2.337048, 3.503376, 0, 0.6705883, 1, 1,
0.05231843, -0.5882709, 1.709277, 0, 0.6627451, 1, 1,
0.05665438, 1.319095, 0.7823623, 0, 0.6588235, 1, 1,
0.05686526, 0.2577262, -0.8715724, 0, 0.6509804, 1, 1,
0.07024128, -1.49872, 3.144633, 0, 0.6470588, 1, 1,
0.07561562, -0.9989829, 1.671529, 0, 0.6392157, 1, 1,
0.07629093, -0.4852996, 1.547826, 0, 0.6352941, 1, 1,
0.08001687, 0.4541647, -0.2486655, 0, 0.627451, 1, 1,
0.08454396, -0.2610978, 2.805177, 0, 0.6235294, 1, 1,
0.08537193, 1.523648, 2.380801, 0, 0.6156863, 1, 1,
0.08811089, -0.6009536, 2.058172, 0, 0.6117647, 1, 1,
0.09024109, -0.2600271, 1.444995, 0, 0.6039216, 1, 1,
0.09091526, -2.603776, 1.729412, 0, 0.5960785, 1, 1,
0.0936509, 0.41559, 1.200069, 0, 0.5921569, 1, 1,
0.09452032, 0.7167954, 3.716874, 0, 0.5843138, 1, 1,
0.1016098, 0.5592459, 0.5594367, 0, 0.5803922, 1, 1,
0.1039043, -0.3681257, 2.661903, 0, 0.572549, 1, 1,
0.1042694, 1.471512, -0.09733703, 0, 0.5686275, 1, 1,
0.1052961, -0.7152686, 1.488888, 0, 0.5607843, 1, 1,
0.1064737, -0.2698933, 3.838264, 0, 0.5568628, 1, 1,
0.1112451, -1.809861, 2.405413, 0, 0.5490196, 1, 1,
0.1117967, 0.7196605, 1.153208, 0, 0.5450981, 1, 1,
0.1126453, -0.2000714, 1.468919, 0, 0.5372549, 1, 1,
0.1128237, -0.7130776, 3.37888, 0, 0.5333334, 1, 1,
0.1163172, 0.1250364, 0.5466098, 0, 0.5254902, 1, 1,
0.1173362, -0.5106843, 1.169106, 0, 0.5215687, 1, 1,
0.1299027, -1.125675, 1.714422, 0, 0.5137255, 1, 1,
0.1305394, -0.9642044, 3.300183, 0, 0.509804, 1, 1,
0.1314497, -1.014198, 3.432392, 0, 0.5019608, 1, 1,
0.1320577, 1.688624, -0.8912677, 0, 0.4941176, 1, 1,
0.132393, -0.3943525, 1.929585, 0, 0.4901961, 1, 1,
0.1365655, -0.1230827, 1.591539, 0, 0.4823529, 1, 1,
0.1428044, 0.8852957, -0.4604724, 0, 0.4784314, 1, 1,
0.1432325, -0.8111802, 3.597112, 0, 0.4705882, 1, 1,
0.1438035, 0.01741713, 2.598335, 0, 0.4666667, 1, 1,
0.1503695, -0.03892789, 2.12168, 0, 0.4588235, 1, 1,
0.1519062, 0.3602397, 1.894264, 0, 0.454902, 1, 1,
0.1580516, -1.2282, 2.696996, 0, 0.4470588, 1, 1,
0.1589215, -0.6631571, 4.077137, 0, 0.4431373, 1, 1,
0.1606427, 0.5121945, -0.6296678, 0, 0.4352941, 1, 1,
0.1644244, 0.5033137, -2.37686, 0, 0.4313726, 1, 1,
0.1683171, 0.4637859, -0.1677982, 0, 0.4235294, 1, 1,
0.17122, -0.8732006, 3.101114, 0, 0.4196078, 1, 1,
0.1747219, -0.6333035, 1.462565, 0, 0.4117647, 1, 1,
0.174935, -1.787987, 2.481219, 0, 0.4078431, 1, 1,
0.1819185, 0.4185017, 0.09431655, 0, 0.4, 1, 1,
0.1872191, -0.8386462, 2.967034, 0, 0.3921569, 1, 1,
0.1906443, -0.7773842, 3.176319, 0, 0.3882353, 1, 1,
0.1910859, -0.3197263, 4.274961, 0, 0.3803922, 1, 1,
0.1922595, -0.5680914, 5.563002, 0, 0.3764706, 1, 1,
0.1962466, -0.6671294, 3.872627, 0, 0.3686275, 1, 1,
0.1982519, -0.2682641, 3.609455, 0, 0.3647059, 1, 1,
0.2009702, -2.216733, 2.604341, 0, 0.3568628, 1, 1,
0.2062465, 2.080259, 0.9468037, 0, 0.3529412, 1, 1,
0.2080507, -1.427089, 3.753397, 0, 0.345098, 1, 1,
0.2110977, -0.03777647, 0.7428141, 0, 0.3411765, 1, 1,
0.218647, 2.007399, -0.5452289, 0, 0.3333333, 1, 1,
0.2195171, 0.6471223, 0.898765, 0, 0.3294118, 1, 1,
0.2201354, -1.447597, 2.952359, 0, 0.3215686, 1, 1,
0.2215733, -0.4695322, 2.666662, 0, 0.3176471, 1, 1,
0.2258377, 1.49929, -0.1700559, 0, 0.3098039, 1, 1,
0.2283902, 0.838456, 1.246539, 0, 0.3058824, 1, 1,
0.2302174, -0.2448383, 3.245897, 0, 0.2980392, 1, 1,
0.2318575, 1.22128, -0.5007502, 0, 0.2901961, 1, 1,
0.2330393, -2.130648, 2.28499, 0, 0.2862745, 1, 1,
0.2348605, 0.1081313, 0.6988382, 0, 0.2784314, 1, 1,
0.2370549, -0.06426812, 0.791967, 0, 0.2745098, 1, 1,
0.2387348, -1.111969, 1.784956, 0, 0.2666667, 1, 1,
0.2404584, 0.1736165, -0.6246176, 0, 0.2627451, 1, 1,
0.2418186, 0.4598407, 0.8437069, 0, 0.254902, 1, 1,
0.2418544, -0.4558394, 1.525936, 0, 0.2509804, 1, 1,
0.2435358, -0.9907249, 1.973621, 0, 0.2431373, 1, 1,
0.2448502, 2.680146, 1.741737, 0, 0.2392157, 1, 1,
0.2453173, -1.291192, 3.931361, 0, 0.2313726, 1, 1,
0.2568572, -0.7316511, 2.771919, 0, 0.227451, 1, 1,
0.2684984, -0.2736949, 1.959834, 0, 0.2196078, 1, 1,
0.2687737, -2.376274, 3.306432, 0, 0.2156863, 1, 1,
0.2702445, -0.1099787, 1.93269, 0, 0.2078431, 1, 1,
0.2760829, 1.765586, 0.8292848, 0, 0.2039216, 1, 1,
0.2767193, 0.128362, 0.8870504, 0, 0.1960784, 1, 1,
0.2789295, 1.522107, -0.1092669, 0, 0.1882353, 1, 1,
0.2791151, 0.08881173, 1.000979, 0, 0.1843137, 1, 1,
0.2798205, 0.3073316, 0.6257051, 0, 0.1764706, 1, 1,
0.2820051, 0.08746688, 2.334541, 0, 0.172549, 1, 1,
0.286721, -0.7424711, 1.960211, 0, 0.1647059, 1, 1,
0.2931255, -0.06460899, 1.496484, 0, 0.1607843, 1, 1,
0.2975842, 0.4826611, -0.03300452, 0, 0.1529412, 1, 1,
0.2984384, -1.113425, 2.772502, 0, 0.1490196, 1, 1,
0.2991872, 0.4965635, 1.585021, 0, 0.1411765, 1, 1,
0.3001666, -0.2619997, 1.527488, 0, 0.1372549, 1, 1,
0.3008641, -0.1554953, 1.489409, 0, 0.1294118, 1, 1,
0.3012548, -0.773286, 4.627465, 0, 0.1254902, 1, 1,
0.3020903, 0.5581337, 1.663212, 0, 0.1176471, 1, 1,
0.3039867, -1.611893, 1.797407, 0, 0.1137255, 1, 1,
0.3046732, -0.06990547, -0.2957427, 0, 0.1058824, 1, 1,
0.3134605, -0.3612824, 1.444947, 0, 0.09803922, 1, 1,
0.3185263, -0.630137, 3.590271, 0, 0.09411765, 1, 1,
0.3210775, -0.9899707, 2.818708, 0, 0.08627451, 1, 1,
0.3216771, -0.3053109, 3.143315, 0, 0.08235294, 1, 1,
0.3230638, -0.8309366, 2.517777, 0, 0.07450981, 1, 1,
0.3289621, -1.055707, 2.803605, 0, 0.07058824, 1, 1,
0.330491, 0.5715783, 1.386252, 0, 0.0627451, 1, 1,
0.3346373, -0.9037142, 1.364043, 0, 0.05882353, 1, 1,
0.3365203, 1.12033, -0.2083775, 0, 0.05098039, 1, 1,
0.3534176, 0.2969353, 1.180668, 0, 0.04705882, 1, 1,
0.360086, -0.3385345, 2.340984, 0, 0.03921569, 1, 1,
0.361747, -0.2169932, 1.705771, 0, 0.03529412, 1, 1,
0.3620764, 1.333974, -1.263382, 0, 0.02745098, 1, 1,
0.3667144, 1.476881, 0.3169362, 0, 0.02352941, 1, 1,
0.3671513, 1.386745, 1.801668, 0, 0.01568628, 1, 1,
0.3708051, -0.5524907, 1.885529, 0, 0.01176471, 1, 1,
0.3710855, 1.856609, -0.453189, 0, 0.003921569, 1, 1,
0.37308, -0.3377169, 2.651433, 0.003921569, 0, 1, 1,
0.3739102, 0.06390722, 3.49248, 0.007843138, 0, 1, 1,
0.3828223, -0.5208212, 2.92018, 0.01568628, 0, 1, 1,
0.385021, 1.056238, 0.04821296, 0.01960784, 0, 1, 1,
0.3881928, -1.06999, 2.45787, 0.02745098, 0, 1, 1,
0.3915453, -0.3155024, 1.256322, 0.03137255, 0, 1, 1,
0.3969861, 1.644637, -1.471741, 0.03921569, 0, 1, 1,
0.3982271, -0.8891879, 3.440754, 0.04313726, 0, 1, 1,
0.3985296, 0.6732355, 1.894517, 0.05098039, 0, 1, 1,
0.4026175, -0.7239155, 1.989667, 0.05490196, 0, 1, 1,
0.403909, -1.774513, 1.730899, 0.0627451, 0, 1, 1,
0.4154632, -0.4628723, 3.825967, 0.06666667, 0, 1, 1,
0.4172396, 1.415903, 1.286681, 0.07450981, 0, 1, 1,
0.4182276, -1.21135, 3.488698, 0.07843138, 0, 1, 1,
0.4190258, 1.159529, -0.3256302, 0.08627451, 0, 1, 1,
0.4204615, -0.6812842, 1.349441, 0.09019608, 0, 1, 1,
0.4219793, 0.7776932, 1.065566, 0.09803922, 0, 1, 1,
0.4234735, -0.1967971, 1.615688, 0.1058824, 0, 1, 1,
0.4269851, 1.091112, 2.657474, 0.1098039, 0, 1, 1,
0.4285294, -0.2518868, 1.991807, 0.1176471, 0, 1, 1,
0.428595, -0.1002206, 2.132353, 0.1215686, 0, 1, 1,
0.4332345, 0.2434409, 1.786808, 0.1294118, 0, 1, 1,
0.4332401, -0.2914653, 2.467888, 0.1333333, 0, 1, 1,
0.4335262, 0.2421052, 2.134297, 0.1411765, 0, 1, 1,
0.433809, 1.758929, 0.2793279, 0.145098, 0, 1, 1,
0.433944, -0.04535488, 0.3926497, 0.1529412, 0, 1, 1,
0.4395281, -0.1194594, 1.03222, 0.1568628, 0, 1, 1,
0.443355, -1.315898, 1.314983, 0.1647059, 0, 1, 1,
0.4458476, -1.596181, 3.394496, 0.1686275, 0, 1, 1,
0.4479544, 0.9932954, 1.12605, 0.1764706, 0, 1, 1,
0.4586056, -1.162826, 3.354985, 0.1803922, 0, 1, 1,
0.4611435, -1.254919, 3.143284, 0.1882353, 0, 1, 1,
0.4611634, -1.03597, 2.579461, 0.1921569, 0, 1, 1,
0.4674394, 0.1301418, 2.141664, 0.2, 0, 1, 1,
0.472411, 0.180118, 0.07981502, 0.2078431, 0, 1, 1,
0.4773588, -0.09895828, 4.026643, 0.2117647, 0, 1, 1,
0.4789807, -0.3199773, 4.125806, 0.2196078, 0, 1, 1,
0.4862099, -0.619416, 2.363946, 0.2235294, 0, 1, 1,
0.4866704, 1.302245, -0.8009408, 0.2313726, 0, 1, 1,
0.4901532, -0.6034082, 3.601019, 0.2352941, 0, 1, 1,
0.4945554, 0.08740271, 3.209086, 0.2431373, 0, 1, 1,
0.5021489, 0.2010999, 0.5417536, 0.2470588, 0, 1, 1,
0.5036529, 0.9563372, -0.02725912, 0.254902, 0, 1, 1,
0.5094202, -0.5943501, 2.255911, 0.2588235, 0, 1, 1,
0.515714, -1.593969, 3.473703, 0.2666667, 0, 1, 1,
0.515761, -0.2004283, 1.361164, 0.2705882, 0, 1, 1,
0.5164749, -0.7906467, 3.920134, 0.2784314, 0, 1, 1,
0.5214473, 0.9593603, -1.472044, 0.282353, 0, 1, 1,
0.5214894, -0.9694969, 2.64461, 0.2901961, 0, 1, 1,
0.5262166, -0.2838331, 1.133631, 0.2941177, 0, 1, 1,
0.5265359, -0.5816133, 3.050071, 0.3019608, 0, 1, 1,
0.5272498, 0.6291008, 0.8159685, 0.3098039, 0, 1, 1,
0.5292103, 0.7523295, 1.513132, 0.3137255, 0, 1, 1,
0.5378315, -0.544012, 2.212655, 0.3215686, 0, 1, 1,
0.539288, 0.3828872, 1.574157, 0.3254902, 0, 1, 1,
0.5447693, -0.5388432, 3.212216, 0.3333333, 0, 1, 1,
0.5510401, 1.090703, 0.4231617, 0.3372549, 0, 1, 1,
0.5541596, -3.302468, 2.082251, 0.345098, 0, 1, 1,
0.5612851, 1.166194, 0.4657761, 0.3490196, 0, 1, 1,
0.5613272, 0.09271822, 2.24471, 0.3568628, 0, 1, 1,
0.563292, 0.2572193, 2.235387, 0.3607843, 0, 1, 1,
0.571336, -0.01415974, 1.007886, 0.3686275, 0, 1, 1,
0.572308, 0.254439, 2.618879, 0.372549, 0, 1, 1,
0.5733076, -0.3301727, 1.989534, 0.3803922, 0, 1, 1,
0.5770199, -0.4034022, 2.599243, 0.3843137, 0, 1, 1,
0.5795472, 0.02221513, 1.770928, 0.3921569, 0, 1, 1,
0.5816138, 0.678062, -0.0609345, 0.3960784, 0, 1, 1,
0.5891545, -1.392403, 2.91593, 0.4039216, 0, 1, 1,
0.5892736, 0.01179383, 1.10794, 0.4117647, 0, 1, 1,
0.5908937, 2.73935, 0.4908784, 0.4156863, 0, 1, 1,
0.598676, -0.3500233, 1.64221, 0.4235294, 0, 1, 1,
0.599063, -1.673684, 3.141759, 0.427451, 0, 1, 1,
0.6008391, -0.8614162, 3.387569, 0.4352941, 0, 1, 1,
0.608789, -0.9823138, 2.806722, 0.4392157, 0, 1, 1,
0.6096372, -0.9371988, 2.007637, 0.4470588, 0, 1, 1,
0.6159669, 1.223124, -0.4331492, 0.4509804, 0, 1, 1,
0.6177416, -0.1021735, 0.511837, 0.4588235, 0, 1, 1,
0.6183339, 0.6302238, 0.9380439, 0.4627451, 0, 1, 1,
0.6223423, -1.058509, 2.183175, 0.4705882, 0, 1, 1,
0.6229274, -1.503494, 3.66693, 0.4745098, 0, 1, 1,
0.6365002, 0.9497995, 0.02645189, 0.4823529, 0, 1, 1,
0.6370561, -1.476258, 1.338853, 0.4862745, 0, 1, 1,
0.6428338, 2.701204, -0.09464204, 0.4941176, 0, 1, 1,
0.6456434, -0.5489731, 3.553973, 0.5019608, 0, 1, 1,
0.6467571, -0.189194, 2.697589, 0.5058824, 0, 1, 1,
0.6517262, -0.9062257, 1.597507, 0.5137255, 0, 1, 1,
0.6557087, 0.3243334, 0.5661772, 0.5176471, 0, 1, 1,
0.6564463, 0.8791193, 1.367804, 0.5254902, 0, 1, 1,
0.6602474, 0.6786431, 1.911788, 0.5294118, 0, 1, 1,
0.6629568, -0.6689587, 1.372601, 0.5372549, 0, 1, 1,
0.6644464, -0.3254393, 2.330784, 0.5411765, 0, 1, 1,
0.6658025, 0.8728555, 1.784132, 0.5490196, 0, 1, 1,
0.6793637, 0.3075499, 2.393591, 0.5529412, 0, 1, 1,
0.6794706, -0.09530105, -0.808319, 0.5607843, 0, 1, 1,
0.6802949, -0.4505039, 1.878122, 0.5647059, 0, 1, 1,
0.685168, 1.843829, -1.105076, 0.572549, 0, 1, 1,
0.6892083, -0.7799503, 1.640556, 0.5764706, 0, 1, 1,
0.6923511, -1.275108, 2.34566, 0.5843138, 0, 1, 1,
0.69586, -0.4424222, 1.607983, 0.5882353, 0, 1, 1,
0.6967987, 0.1223076, 0.1749036, 0.5960785, 0, 1, 1,
0.7012721, 0.2271985, 0.0618028, 0.6039216, 0, 1, 1,
0.7078209, -0.5907101, 2.935274, 0.6078432, 0, 1, 1,
0.7146685, 1.026225, 1.295321, 0.6156863, 0, 1, 1,
0.7160197, -1.496765, 3.560011, 0.6196079, 0, 1, 1,
0.7162027, -1.234047, 3.155447, 0.627451, 0, 1, 1,
0.7221435, -0.8131722, 2.818775, 0.6313726, 0, 1, 1,
0.7236298, 0.6438141, 0.11408, 0.6392157, 0, 1, 1,
0.7244266, 0.03928751, 1.956035, 0.6431373, 0, 1, 1,
0.7457813, 2.2841, 1.513566, 0.6509804, 0, 1, 1,
0.7480697, 0.5013073, 2.177831, 0.654902, 0, 1, 1,
0.7484049, -2.141143, 1.929646, 0.6627451, 0, 1, 1,
0.7487295, -0.8141187, 2.011533, 0.6666667, 0, 1, 1,
0.7554924, -0.9571283, 5.782993, 0.6745098, 0, 1, 1,
0.7633246, 2.132392, 1.141005, 0.6784314, 0, 1, 1,
0.7659997, 0.09439341, 0.4000729, 0.6862745, 0, 1, 1,
0.7663189, 0.9971199, 1.113954, 0.6901961, 0, 1, 1,
0.7684587, -1.507353, 4.061309, 0.6980392, 0, 1, 1,
0.7686657, 0.977906, -0.02680636, 0.7058824, 0, 1, 1,
0.7804822, -1.432017, 0.9010296, 0.7098039, 0, 1, 1,
0.7938997, 0.7831565, 1.861206, 0.7176471, 0, 1, 1,
0.8104912, 0.9101222, 0.3935528, 0.7215686, 0, 1, 1,
0.8117241, 0.2360428, 0.8376899, 0.7294118, 0, 1, 1,
0.8153483, -2.179975, 3.762053, 0.7333333, 0, 1, 1,
0.8153633, 1.840793, -0.6017276, 0.7411765, 0, 1, 1,
0.8290339, -1.453368, 3.925582, 0.7450981, 0, 1, 1,
0.8290755, -0.6643658, 1.178266, 0.7529412, 0, 1, 1,
0.8293896, 1.789909, 1.360311, 0.7568628, 0, 1, 1,
0.8301489, 0.02614088, 0.7193393, 0.7647059, 0, 1, 1,
0.8324184, 2.19192, 0.7903894, 0.7686275, 0, 1, 1,
0.832518, -0.8120806, 4.411476, 0.7764706, 0, 1, 1,
0.8353638, 0.6005699, -0.186809, 0.7803922, 0, 1, 1,
0.8376295, -1.302648, 2.373249, 0.7882353, 0, 1, 1,
0.8421054, -0.5497112, 1.222335, 0.7921569, 0, 1, 1,
0.8427744, -0.5108953, 0.677628, 0.8, 0, 1, 1,
0.8583019, 0.7803121, 1.576926, 0.8078431, 0, 1, 1,
0.8640472, -0.07322547, 2.49734, 0.8117647, 0, 1, 1,
0.8644048, -0.7606167, 0.2538131, 0.8196079, 0, 1, 1,
0.8690558, -0.1142987, 1.001842, 0.8235294, 0, 1, 1,
0.8729736, -0.06568397, 0.5364744, 0.8313726, 0, 1, 1,
0.8750347, 1.880926, -1.276871, 0.8352941, 0, 1, 1,
0.8761291, -0.3876111, 1.891195, 0.8431373, 0, 1, 1,
0.8796008, 0.2267295, -0.06539142, 0.8470588, 0, 1, 1,
0.884563, -0.4041123, 2.309466, 0.854902, 0, 1, 1,
0.8898481, -1.302367, 2.426261, 0.8588235, 0, 1, 1,
0.8949217, 0.4415032, 1.440547, 0.8666667, 0, 1, 1,
0.8992201, -0.07718068, 1.660401, 0.8705882, 0, 1, 1,
0.9020494, -1.596523, 2.012398, 0.8784314, 0, 1, 1,
0.9029467, 0.1825109, 1.489698, 0.8823529, 0, 1, 1,
0.9032274, -2.580604, 2.723365, 0.8901961, 0, 1, 1,
0.9066347, -1.712618, 2.08093, 0.8941177, 0, 1, 1,
0.9094293, -1.696186, 2.670546, 0.9019608, 0, 1, 1,
0.9108219, 0.6705431, 2.497114, 0.9098039, 0, 1, 1,
0.9125734, 0.1241627, 1.244849, 0.9137255, 0, 1, 1,
0.9353008, -1.258696, 2.676521, 0.9215686, 0, 1, 1,
0.9405776, 1.025028, 1.179462, 0.9254902, 0, 1, 1,
0.9457723, -1.890515, 4.722671, 0.9333333, 0, 1, 1,
0.9462912, 1.228425, 1.002699, 0.9372549, 0, 1, 1,
0.9696645, 0.4654132, 1.121863, 0.945098, 0, 1, 1,
0.9711031, -2.297267, 2.939629, 0.9490196, 0, 1, 1,
0.9866945, -0.1298766, 2.446368, 0.9568627, 0, 1, 1,
0.9934149, -0.8630921, 2.059701, 0.9607843, 0, 1, 1,
0.9938487, -1.451522, 2.802293, 0.9686275, 0, 1, 1,
0.9946416, 0.3112576, 2.458965, 0.972549, 0, 1, 1,
1.003101, 0.06683145, 1.153133, 0.9803922, 0, 1, 1,
1.007739, -1.401559, 2.900584, 0.9843137, 0, 1, 1,
1.013975, 0.6075019, 0.4314313, 0.9921569, 0, 1, 1,
1.014496, 0.4258512, 0.0186521, 0.9960784, 0, 1, 1,
1.023344, -0.5370883, 0.3382618, 1, 0, 0.9960784, 1,
1.024565, -1.04359, 0.7134936, 1, 0, 0.9882353, 1,
1.024688, -1.832901, 0.7236578, 1, 0, 0.9843137, 1,
1.029114, -0.3638013, 1.605554, 1, 0, 0.9764706, 1,
1.029131, -0.2608184, 3.274514, 1, 0, 0.972549, 1,
1.033444, -0.2445008, 2.026228, 1, 0, 0.9647059, 1,
1.039352, 0.2348953, 1.359468, 1, 0, 0.9607843, 1,
1.051375, 0.6116951, 0.95141, 1, 0, 0.9529412, 1,
1.061015, 0.7723032, 1.548045, 1, 0, 0.9490196, 1,
1.06279, -0.109661, 2.014365, 1, 0, 0.9411765, 1,
1.07031, 1.372686, -0.452821, 1, 0, 0.9372549, 1,
1.073835, 0.8219555, 1.527574, 1, 0, 0.9294118, 1,
1.076005, 1.696181, 0.4295759, 1, 0, 0.9254902, 1,
1.077839, -0.334139, 1.455607, 1, 0, 0.9176471, 1,
1.085856, 0.07787141, 0.2057144, 1, 0, 0.9137255, 1,
1.0931, 0.9685786, 1.652562, 1, 0, 0.9058824, 1,
1.102838, 1.56752, -0.9827804, 1, 0, 0.9019608, 1,
1.103252, 0.6454648, 1.460556, 1, 0, 0.8941177, 1,
1.105334, 0.3576464, 2.132163, 1, 0, 0.8862745, 1,
1.113211, 0.9137421, -0.01392258, 1, 0, 0.8823529, 1,
1.119393, 0.3527747, -0.6190775, 1, 0, 0.8745098, 1,
1.127198, -1.048608, 2.728677, 1, 0, 0.8705882, 1,
1.127408, 0.3125153, 1.353254, 1, 0, 0.8627451, 1,
1.128728, 0.9445542, 0.04148528, 1, 0, 0.8588235, 1,
1.138968, 1.12191, 1.65573, 1, 0, 0.8509804, 1,
1.140194, -1.952046, 1.443562, 1, 0, 0.8470588, 1,
1.151243, 1.79834, 0.9877753, 1, 0, 0.8392157, 1,
1.153382, -0.5117786, 1.460505, 1, 0, 0.8352941, 1,
1.159513, 0.7614452, 1.956425, 1, 0, 0.827451, 1,
1.16429, 1.079971, 0.382739, 1, 0, 0.8235294, 1,
1.16596, 0.06255876, 2.457293, 1, 0, 0.8156863, 1,
1.16613, -0.1659198, 1.659004, 1, 0, 0.8117647, 1,
1.172028, 0.3591203, 0.7915472, 1, 0, 0.8039216, 1,
1.17697, 2.557881, -0.2501241, 1, 0, 0.7960784, 1,
1.181888, 0.5925554, 3.03107, 1, 0, 0.7921569, 1,
1.184248, -0.01567344, 1.184021, 1, 0, 0.7843137, 1,
1.184904, 0.3101939, 0.8564349, 1, 0, 0.7803922, 1,
1.190573, -0.8961765, 1.424894, 1, 0, 0.772549, 1,
1.196237, 0.6005828, 0.3101569, 1, 0, 0.7686275, 1,
1.207426, -0.4444913, 2.998082, 1, 0, 0.7607843, 1,
1.213221, -2.882021, 5.611746, 1, 0, 0.7568628, 1,
1.214258, 0.1819588, 1.838455, 1, 0, 0.7490196, 1,
1.22092, -1.130556, 2.042397, 1, 0, 0.7450981, 1,
1.224451, 0.4750827, 3.860782, 1, 0, 0.7372549, 1,
1.225345, -0.1100285, 2.405805, 1, 0, 0.7333333, 1,
1.229888, -0.5622872, 2.852535, 1, 0, 0.7254902, 1,
1.233357, -0.6775447, 3.047814, 1, 0, 0.7215686, 1,
1.236718, 1.563856, 0.4506775, 1, 0, 0.7137255, 1,
1.237543, -0.8868016, 0.9774004, 1, 0, 0.7098039, 1,
1.23894, 0.395536, 1.021208, 1, 0, 0.7019608, 1,
1.253193, 0.6478105, 2.359786, 1, 0, 0.6941177, 1,
1.263448, 0.1937954, 0.2919955, 1, 0, 0.6901961, 1,
1.266426, -1.040675, 0.4135385, 1, 0, 0.682353, 1,
1.2801, -0.5154428, 3.861067, 1, 0, 0.6784314, 1,
1.284851, -0.08994911, 1.928686, 1, 0, 0.6705883, 1,
1.285019, 2.006851, 0.3610461, 1, 0, 0.6666667, 1,
1.291006, -0.7249599, 3.024005, 1, 0, 0.6588235, 1,
1.295791, 0.1226579, 2.449113, 1, 0, 0.654902, 1,
1.305395, 1.805645, 0.9599499, 1, 0, 0.6470588, 1,
1.306473, -1.100622, 1.972841, 1, 0, 0.6431373, 1,
1.326463, -0.09627446, 0.5532004, 1, 0, 0.6352941, 1,
1.335335, -1.459298, 2.826192, 1, 0, 0.6313726, 1,
1.358752, 0.966696, 1.531518, 1, 0, 0.6235294, 1,
1.361598, -2.45069, 2.086631, 1, 0, 0.6196079, 1,
1.380692, 1.024501, 0.3167005, 1, 0, 0.6117647, 1,
1.382767, 0.9788812, 0.2980154, 1, 0, 0.6078432, 1,
1.394323, -0.05722168, 2.441586, 1, 0, 0.6, 1,
1.398612, 0.4174781, 2.068429, 1, 0, 0.5921569, 1,
1.407174, -2.97484, 3.027216, 1, 0, 0.5882353, 1,
1.411666, 0.535837, 1.511439, 1, 0, 0.5803922, 1,
1.41389, 0.4450827, 1.899406, 1, 0, 0.5764706, 1,
1.415547, -0.3493477, 1.888835, 1, 0, 0.5686275, 1,
1.416449, -0.9441555, 1.247439, 1, 0, 0.5647059, 1,
1.426671, 0.7816405, 2.257559, 1, 0, 0.5568628, 1,
1.428789, 1.084643, 0.1596209, 1, 0, 0.5529412, 1,
1.431815, 0.4695265, 1.446405, 1, 0, 0.5450981, 1,
1.441725, 1.663579, 0.364272, 1, 0, 0.5411765, 1,
1.457285, -1.42665, 2.007694, 1, 0, 0.5333334, 1,
1.457576, 1.082448, 1.780277, 1, 0, 0.5294118, 1,
1.458385, 0.05957592, 0.6478283, 1, 0, 0.5215687, 1,
1.462253, -0.901563, 1.155836, 1, 0, 0.5176471, 1,
1.474105, -1.409058, 3.138733, 1, 0, 0.509804, 1,
1.483881, 0.2111783, 1.059812, 1, 0, 0.5058824, 1,
1.483957, 0.7486098, -0.2394246, 1, 0, 0.4980392, 1,
1.494608, -2.768853, 1.65371, 1, 0, 0.4901961, 1,
1.505071, -0.6392983, 3.685613, 1, 0, 0.4862745, 1,
1.510126, 2.514378, 0.271189, 1, 0, 0.4784314, 1,
1.51678, -0.5686277, 2.652612, 1, 0, 0.4745098, 1,
1.520936, 0.6723371, 2.391579, 1, 0, 0.4666667, 1,
1.522931, 0.218226, 2.392722, 1, 0, 0.4627451, 1,
1.527972, 0.8994715, 0.9345703, 1, 0, 0.454902, 1,
1.533084, 0.7074016, 1.171322, 1, 0, 0.4509804, 1,
1.540148, 1.127853, 0.6769795, 1, 0, 0.4431373, 1,
1.54025, 0.842399, 0.253151, 1, 0, 0.4392157, 1,
1.542062, 2.388853, 0.9707427, 1, 0, 0.4313726, 1,
1.547273, 0.957033, 1.594212, 1, 0, 0.427451, 1,
1.555917, -0.2185686, 2.646277, 1, 0, 0.4196078, 1,
1.565489, 0.1309123, 2.20398, 1, 0, 0.4156863, 1,
1.571222, -0.7767571, 1.297583, 1, 0, 0.4078431, 1,
1.573349, 0.3829094, 0.7823991, 1, 0, 0.4039216, 1,
1.575556, -1.444179, 1.861182, 1, 0, 0.3960784, 1,
1.589625, -0.4728908, 2.250773, 1, 0, 0.3882353, 1,
1.591031, 2.030356, 0.9868259, 1, 0, 0.3843137, 1,
1.594268, 1.512887, 2.592352, 1, 0, 0.3764706, 1,
1.598178, -1.123056, 2.258324, 1, 0, 0.372549, 1,
1.599685, 2.832929, 0.02540529, 1, 0, 0.3647059, 1,
1.601865, -0.635573, 3.135981, 1, 0, 0.3607843, 1,
1.609043, 0.2476853, 1.477478, 1, 0, 0.3529412, 1,
1.609465, 0.4009993, 0.004289611, 1, 0, 0.3490196, 1,
1.617027, -1.159644, 1.684666, 1, 0, 0.3411765, 1,
1.620743, 0.8601755, 2.580362, 1, 0, 0.3372549, 1,
1.633904, 0.7129224, 1.853034, 1, 0, 0.3294118, 1,
1.637946, -0.5815725, 0.6832414, 1, 0, 0.3254902, 1,
1.639131, 2.738416, -0.09187958, 1, 0, 0.3176471, 1,
1.645393, -0.05719506, 1.418368, 1, 0, 0.3137255, 1,
1.655188, 1.39108, 0.3528794, 1, 0, 0.3058824, 1,
1.660646, -0.1869656, 1.911628, 1, 0, 0.2980392, 1,
1.661897, 1.48608, 1.705433, 1, 0, 0.2941177, 1,
1.671728, 0.6975855, 2.949387, 1, 0, 0.2862745, 1,
1.673782, 0.9336798, 1.378015, 1, 0, 0.282353, 1,
1.675435, 0.855464, 0.8209988, 1, 0, 0.2745098, 1,
1.676408, 0.1728546, 1.703549, 1, 0, 0.2705882, 1,
1.676471, -0.2004937, 2.240686, 1, 0, 0.2627451, 1,
1.688281, -0.2040107, 1.39732, 1, 0, 0.2588235, 1,
1.689985, 0.6157746, 0.283035, 1, 0, 0.2509804, 1,
1.694134, 2.178097, 0.5540625, 1, 0, 0.2470588, 1,
1.698354, -1.504641, 1.771092, 1, 0, 0.2392157, 1,
1.721047, 0.1213663, 1.979342, 1, 0, 0.2352941, 1,
1.730786, 0.9507213, -0.3113367, 1, 0, 0.227451, 1,
1.738417, -0.1203599, 2.237546, 1, 0, 0.2235294, 1,
1.741852, -1.973453, 1.469885, 1, 0, 0.2156863, 1,
1.744099, 0.9284997, 2.314791, 1, 0, 0.2117647, 1,
1.782331, -1.062486, 0.2922309, 1, 0, 0.2039216, 1,
1.784282, -0.08545561, 0.4487651, 1, 0, 0.1960784, 1,
1.785386, -0.2035399, 1.326157, 1, 0, 0.1921569, 1,
1.793339, -0.4227483, -0.3136012, 1, 0, 0.1843137, 1,
1.855091, 1.16962, 0.8676978, 1, 0, 0.1803922, 1,
1.879914, 1.204634, 1.491154, 1, 0, 0.172549, 1,
1.895148, 0.1383456, 3.122496, 1, 0, 0.1686275, 1,
1.901444, -0.1587863, 1.779947, 1, 0, 0.1607843, 1,
1.902021, -1.247449, 1.789554, 1, 0, 0.1568628, 1,
1.940681, -0.02712894, 1.478468, 1, 0, 0.1490196, 1,
1.946342, -0.6998754, 1.879106, 1, 0, 0.145098, 1,
1.976639, -0.2504969, 1.408245, 1, 0, 0.1372549, 1,
2.007674, -0.806042, 0.7946547, 1, 0, 0.1333333, 1,
2.013472, -0.09168214, 2.268418, 1, 0, 0.1254902, 1,
2.014214, -0.7892923, 2.84493, 1, 0, 0.1215686, 1,
2.026925, 0.5195208, 2.09241, 1, 0, 0.1137255, 1,
2.042103, 0.2169778, -0.3761352, 1, 0, 0.1098039, 1,
2.051476, 0.4924393, -1.025406, 1, 0, 0.1019608, 1,
2.138491, -0.5419878, 2.636597, 1, 0, 0.09411765, 1,
2.160572, 0.2641115, 0.4445294, 1, 0, 0.09019608, 1,
2.177145, -0.2779135, 2.125469, 1, 0, 0.08235294, 1,
2.18442, -0.1020634, 0.6203418, 1, 0, 0.07843138, 1,
2.206235, -0.3894003, 1.190464, 1, 0, 0.07058824, 1,
2.206407, 0.4877772, 1.623682, 1, 0, 0.06666667, 1,
2.238687, -1.223495, 3.710249, 1, 0, 0.05882353, 1,
2.244509, -0.2431901, 2.843885, 1, 0, 0.05490196, 1,
2.272613, -0.6266947, 2.263859, 1, 0, 0.04705882, 1,
2.310408, 1.615014, 0.598502, 1, 0, 0.04313726, 1,
2.394114, 0.9498132, -0.9618836, 1, 0, 0.03529412, 1,
2.424409, 0.005452807, 1.98417, 1, 0, 0.03137255, 1,
2.731189, 0.2216865, 2.581985, 1, 0, 0.02352941, 1,
2.833522, -0.6556754, 2.409642, 1, 0, 0.01960784, 1,
2.870008, -0.3754176, 1.617624, 1, 0, 0.01176471, 1,
3.231004, 0.2440267, 1.849247, 1, 0, 0.007843138, 1
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
-0.08662021, -4.342417, -6.675244, 0, -0.5, 0.5, 0.5,
-0.08662021, -4.342417, -6.675244, 1, -0.5, 0.5, 0.5,
-0.08662021, -4.342417, -6.675244, 1, 1.5, 0.5, 0.5,
-0.08662021, -4.342417, -6.675244, 0, 1.5, 0.5, 0.5
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
-4.52892, -0.2347691, -6.675244, 0, -0.5, 0.5, 0.5,
-4.52892, -0.2347691, -6.675244, 1, -0.5, 0.5, 0.5,
-4.52892, -0.2347691, -6.675244, 1, 1.5, 0.5, 0.5,
-4.52892, -0.2347691, -6.675244, 0, 1.5, 0.5, 0.5
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
-4.52892, -4.342417, 0.4566836, 0, -0.5, 0.5, 0.5,
-4.52892, -4.342417, 0.4566836, 1, -0.5, 0.5, 0.5,
-4.52892, -4.342417, 0.4566836, 1, 1.5, 0.5, 0.5,
-4.52892, -4.342417, 0.4566836, 0, 1.5, 0.5, 0.5
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
-3, -3.394499, -5.029415,
3, -3.394499, -5.029415,
-3, -3.394499, -5.029415,
-3, -3.552485, -5.30372,
-2, -3.394499, -5.029415,
-2, -3.552485, -5.30372,
-1, -3.394499, -5.029415,
-1, -3.552485, -5.30372,
0, -3.394499, -5.029415,
0, -3.552485, -5.30372,
1, -3.394499, -5.029415,
1, -3.552485, -5.30372,
2, -3.394499, -5.029415,
2, -3.552485, -5.30372,
3, -3.394499, -5.029415,
3, -3.552485, -5.30372
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
-3, -3.868458, -5.85233, 0, -0.5, 0.5, 0.5,
-3, -3.868458, -5.85233, 1, -0.5, 0.5, 0.5,
-3, -3.868458, -5.85233, 1, 1.5, 0.5, 0.5,
-3, -3.868458, -5.85233, 0, 1.5, 0.5, 0.5,
-2, -3.868458, -5.85233, 0, -0.5, 0.5, 0.5,
-2, -3.868458, -5.85233, 1, -0.5, 0.5, 0.5,
-2, -3.868458, -5.85233, 1, 1.5, 0.5, 0.5,
-2, -3.868458, -5.85233, 0, 1.5, 0.5, 0.5,
-1, -3.868458, -5.85233, 0, -0.5, 0.5, 0.5,
-1, -3.868458, -5.85233, 1, -0.5, 0.5, 0.5,
-1, -3.868458, -5.85233, 1, 1.5, 0.5, 0.5,
-1, -3.868458, -5.85233, 0, 1.5, 0.5, 0.5,
0, -3.868458, -5.85233, 0, -0.5, 0.5, 0.5,
0, -3.868458, -5.85233, 1, -0.5, 0.5, 0.5,
0, -3.868458, -5.85233, 1, 1.5, 0.5, 0.5,
0, -3.868458, -5.85233, 0, 1.5, 0.5, 0.5,
1, -3.868458, -5.85233, 0, -0.5, 0.5, 0.5,
1, -3.868458, -5.85233, 1, -0.5, 0.5, 0.5,
1, -3.868458, -5.85233, 1, 1.5, 0.5, 0.5,
1, -3.868458, -5.85233, 0, 1.5, 0.5, 0.5,
2, -3.868458, -5.85233, 0, -0.5, 0.5, 0.5,
2, -3.868458, -5.85233, 1, -0.5, 0.5, 0.5,
2, -3.868458, -5.85233, 1, 1.5, 0.5, 0.5,
2, -3.868458, -5.85233, 0, 1.5, 0.5, 0.5,
3, -3.868458, -5.85233, 0, -0.5, 0.5, 0.5,
3, -3.868458, -5.85233, 1, -0.5, 0.5, 0.5,
3, -3.868458, -5.85233, 1, 1.5, 0.5, 0.5,
3, -3.868458, -5.85233, 0, 1.5, 0.5, 0.5
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
-3.503774, -3, -5.029415,
-3.503774, 2, -5.029415,
-3.503774, -3, -5.029415,
-3.674631, -3, -5.30372,
-3.503774, -2, -5.029415,
-3.674631, -2, -5.30372,
-3.503774, -1, -5.029415,
-3.674631, -1, -5.30372,
-3.503774, 0, -5.029415,
-3.674631, 0, -5.30372,
-3.503774, 1, -5.029415,
-3.674631, 1, -5.30372,
-3.503774, 2, -5.029415,
-3.674631, 2, -5.30372
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
-4.016346, -3, -5.85233, 0, -0.5, 0.5, 0.5,
-4.016346, -3, -5.85233, 1, -0.5, 0.5, 0.5,
-4.016346, -3, -5.85233, 1, 1.5, 0.5, 0.5,
-4.016346, -3, -5.85233, 0, 1.5, 0.5, 0.5,
-4.016346, -2, -5.85233, 0, -0.5, 0.5, 0.5,
-4.016346, -2, -5.85233, 1, -0.5, 0.5, 0.5,
-4.016346, -2, -5.85233, 1, 1.5, 0.5, 0.5,
-4.016346, -2, -5.85233, 0, 1.5, 0.5, 0.5,
-4.016346, -1, -5.85233, 0, -0.5, 0.5, 0.5,
-4.016346, -1, -5.85233, 1, -0.5, 0.5, 0.5,
-4.016346, -1, -5.85233, 1, 1.5, 0.5, 0.5,
-4.016346, -1, -5.85233, 0, 1.5, 0.5, 0.5,
-4.016346, 0, -5.85233, 0, -0.5, 0.5, 0.5,
-4.016346, 0, -5.85233, 1, -0.5, 0.5, 0.5,
-4.016346, 0, -5.85233, 1, 1.5, 0.5, 0.5,
-4.016346, 0, -5.85233, 0, 1.5, 0.5, 0.5,
-4.016346, 1, -5.85233, 0, -0.5, 0.5, 0.5,
-4.016346, 1, -5.85233, 1, -0.5, 0.5, 0.5,
-4.016346, 1, -5.85233, 1, 1.5, 0.5, 0.5,
-4.016346, 1, -5.85233, 0, 1.5, 0.5, 0.5,
-4.016346, 2, -5.85233, 0, -0.5, 0.5, 0.5,
-4.016346, 2, -5.85233, 1, -0.5, 0.5, 0.5,
-4.016346, 2, -5.85233, 1, 1.5, 0.5, 0.5,
-4.016346, 2, -5.85233, 0, 1.5, 0.5, 0.5
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
-3.503774, -3.394499, -4,
-3.503774, -3.394499, 4,
-3.503774, -3.394499, -4,
-3.674631, -3.552485, -4,
-3.503774, -3.394499, -2,
-3.674631, -3.552485, -2,
-3.503774, -3.394499, 0,
-3.674631, -3.552485, 0,
-3.503774, -3.394499, 2,
-3.674631, -3.552485, 2,
-3.503774, -3.394499, 4,
-3.674631, -3.552485, 4
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
-4.016346, -3.868458, -4, 0, -0.5, 0.5, 0.5,
-4.016346, -3.868458, -4, 1, -0.5, 0.5, 0.5,
-4.016346, -3.868458, -4, 1, 1.5, 0.5, 0.5,
-4.016346, -3.868458, -4, 0, 1.5, 0.5, 0.5,
-4.016346, -3.868458, -2, 0, -0.5, 0.5, 0.5,
-4.016346, -3.868458, -2, 1, -0.5, 0.5, 0.5,
-4.016346, -3.868458, -2, 1, 1.5, 0.5, 0.5,
-4.016346, -3.868458, -2, 0, 1.5, 0.5, 0.5,
-4.016346, -3.868458, 0, 0, -0.5, 0.5, 0.5,
-4.016346, -3.868458, 0, 1, -0.5, 0.5, 0.5,
-4.016346, -3.868458, 0, 1, 1.5, 0.5, 0.5,
-4.016346, -3.868458, 0, 0, 1.5, 0.5, 0.5,
-4.016346, -3.868458, 2, 0, -0.5, 0.5, 0.5,
-4.016346, -3.868458, 2, 1, -0.5, 0.5, 0.5,
-4.016346, -3.868458, 2, 1, 1.5, 0.5, 0.5,
-4.016346, -3.868458, 2, 0, 1.5, 0.5, 0.5,
-4.016346, -3.868458, 4, 0, -0.5, 0.5, 0.5,
-4.016346, -3.868458, 4, 1, -0.5, 0.5, 0.5,
-4.016346, -3.868458, 4, 1, 1.5, 0.5, 0.5,
-4.016346, -3.868458, 4, 0, 1.5, 0.5, 0.5
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
-3.503774, -3.394499, -5.029415,
-3.503774, 2.92496, -5.029415,
-3.503774, -3.394499, 5.942782,
-3.503774, 2.92496, 5.942782,
-3.503774, -3.394499, -5.029415,
-3.503774, -3.394499, 5.942782,
-3.503774, 2.92496, -5.029415,
-3.503774, 2.92496, 5.942782,
-3.503774, -3.394499, -5.029415,
3.330533, -3.394499, -5.029415,
-3.503774, -3.394499, 5.942782,
3.330533, -3.394499, 5.942782,
-3.503774, 2.92496, -5.029415,
3.330533, 2.92496, -5.029415,
-3.503774, 2.92496, 5.942782,
3.330533, 2.92496, 5.942782,
3.330533, -3.394499, -5.029415,
3.330533, 2.92496, -5.029415,
3.330533, -3.394499, 5.942782,
3.330533, 2.92496, 5.942782,
3.330533, -3.394499, -5.029415,
3.330533, -3.394499, 5.942782,
3.330533, 2.92496, -5.029415,
3.330533, 2.92496, 5.942782
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
var radius = 7.683244;
var distance = 34.18362;
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
mvMatrix.translate( 0.08662021, 0.2347691, -0.4566836 );
mvMatrix.scale( 1.215526, 1.314555, 0.7571204 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.18362);
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
methylarsonate<-read.table("methylarsonate.xyz")
```

```
## Error in read.table("methylarsonate.xyz"): no lines available in input
```

```r
x<-methylarsonate$V2
```

```
## Error in eval(expr, envir, enclos): object 'methylarsonate' not found
```

```r
y<-methylarsonate$V3
```

```
## Error in eval(expr, envir, enclos): object 'methylarsonate' not found
```

```r
z<-methylarsonate$V4
```

```
## Error in eval(expr, envir, enclos): object 'methylarsonate' not found
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
-3.404245, 0.2412146, -1.479152, 0, 0, 1, 1, 1,
-3.042859, -1.597792, -3.638085, 1, 0, 0, 1, 1,
-2.907894, 1.386112, -0.5204417, 1, 0, 0, 1, 1,
-2.907474, -0.2459482, -1.034, 1, 0, 0, 1, 1,
-2.804837, -0.5227152, 0.2299165, 1, 0, 0, 1, 1,
-2.754663, -0.4465179, -0.5230686, 1, 0, 0, 1, 1,
-2.664901, 0.6849295, -1.126668, 0, 0, 0, 1, 1,
-2.651647, 0.4862238, -1.278397, 0, 0, 0, 1, 1,
-2.563834, -0.4208489, -0.2240222, 0, 0, 0, 1, 1,
-2.490329, -0.6368904, -0.5510145, 0, 0, 0, 1, 1,
-2.443183, -0.5616739, 0.4760696, 0, 0, 0, 1, 1,
-2.395697, -1.43022, -0.8900117, 0, 0, 0, 1, 1,
-2.257745, -0.8541512, -1.6829, 0, 0, 0, 1, 1,
-2.248645, 0.7292898, -2.502318, 1, 1, 1, 1, 1,
-2.231211, 0.6326878, -2.145383, 1, 1, 1, 1, 1,
-2.16547, -0.1819824, -3.362938, 1, 1, 1, 1, 1,
-2.139387, 0.5960879, -0.6240693, 1, 1, 1, 1, 1,
-2.138523, 0.1521584, -3.520534, 1, 1, 1, 1, 1,
-2.063017, -0.05701627, -2.520208, 1, 1, 1, 1, 1,
-2.044202, -0.5124508, -0.6483316, 1, 1, 1, 1, 1,
-2.030256, -0.9205347, -2.413569, 1, 1, 1, 1, 1,
-2.025327, 1.098778, -0.2231799, 1, 1, 1, 1, 1,
-2.009311, 0.4143193, -1.907026, 1, 1, 1, 1, 1,
-1.996189, -0.1014432, -0.2552025, 1, 1, 1, 1, 1,
-1.981599, 1.447449, -0.8699592, 1, 1, 1, 1, 1,
-1.963376, -0.8559473, -1.110433, 1, 1, 1, 1, 1,
-1.952878, -1.960462, -3.113289, 1, 1, 1, 1, 1,
-1.948576, -2.169009, -3.028235, 1, 1, 1, 1, 1,
-1.946871, 0.4279608, 0.9746944, 0, 0, 1, 1, 1,
-1.945809, 0.7798014, -0.4967718, 1, 0, 0, 1, 1,
-1.927377, 0.8225079, -1.939736, 1, 0, 0, 1, 1,
-1.900531, -0.6968027, -1.684875, 1, 0, 0, 1, 1,
-1.883336, 1.582068, -1.763028, 1, 0, 0, 1, 1,
-1.869573, -1.460664, -0.7169026, 1, 0, 0, 1, 1,
-1.855102, 0.5382482, -1.742841, 0, 0, 0, 1, 1,
-1.850636, -0.5159932, -2.54139, 0, 0, 0, 1, 1,
-1.809357, 1.131556, -1.486816, 0, 0, 0, 1, 1,
-1.804868, -0.07458235, -1.502228, 0, 0, 0, 1, 1,
-1.803542, 0.5154278, -1.461303, 0, 0, 0, 1, 1,
-1.791002, 2.204106, -0.2333705, 0, 0, 0, 1, 1,
-1.774634, -0.337027, -0.9580275, 0, 0, 0, 1, 1,
-1.757514, 0.8566614, -0.7786736, 1, 1, 1, 1, 1,
-1.757454, -0.8518645, 0.08337777, 1, 1, 1, 1, 1,
-1.75661, -0.2474879, -0.7711002, 1, 1, 1, 1, 1,
-1.750451, 0.5745442, -1.723137, 1, 1, 1, 1, 1,
-1.742793, -0.3691342, -2.853701, 1, 1, 1, 1, 1,
-1.741532, -0.9854863, -2.740015, 1, 1, 1, 1, 1,
-1.738689, -1.062921, -2.805752, 1, 1, 1, 1, 1,
-1.736373, -0.1753217, -2.953698, 1, 1, 1, 1, 1,
-1.710759, 0.1217135, -1.136946, 1, 1, 1, 1, 1,
-1.710678, 1.182461, -0.4721994, 1, 1, 1, 1, 1,
-1.695694, -0.6683862, -2.321543, 1, 1, 1, 1, 1,
-1.687184, 0.8805755, -0.879756, 1, 1, 1, 1, 1,
-1.684315, -1.776806, -3.676171, 1, 1, 1, 1, 1,
-1.682074, 0.2227849, 0.8926606, 1, 1, 1, 1, 1,
-1.678564, 1.428828, -2.076246, 1, 1, 1, 1, 1,
-1.663459, 0.1678267, -0.655202, 0, 0, 1, 1, 1,
-1.643439, -0.1827706, -1.715127, 1, 0, 0, 1, 1,
-1.631662, 0.6452165, -2.932257, 1, 0, 0, 1, 1,
-1.609915, -0.8177841, -1.086659, 1, 0, 0, 1, 1,
-1.580587, -1.177488, -2.612805, 1, 0, 0, 1, 1,
-1.57822, 1.402983, -0.9732696, 1, 0, 0, 1, 1,
-1.574499, -1.319706, -2.56723, 0, 0, 0, 1, 1,
-1.569727, 0.8473126, -0.1144834, 0, 0, 0, 1, 1,
-1.555307, 0.8439063, 0.4299293, 0, 0, 0, 1, 1,
-1.554582, -0.3465765, -3.292771, 0, 0, 0, 1, 1,
-1.544155, 0.731414, -1.368605, 0, 0, 0, 1, 1,
-1.530352, 0.8454712, -1.604085, 0, 0, 0, 1, 1,
-1.529289, -0.4387701, -0.6909596, 0, 0, 0, 1, 1,
-1.514648, -1.468467, -1.411247, 1, 1, 1, 1, 1,
-1.509675, -0.289003, -2.219394, 1, 1, 1, 1, 1,
-1.508908, 1.126186, -1.755342, 1, 1, 1, 1, 1,
-1.507614, 1.278213, 0.9258654, 1, 1, 1, 1, 1,
-1.505341, -1.452318, -3.574531, 1, 1, 1, 1, 1,
-1.489828, -0.3403982, -2.309997, 1, 1, 1, 1, 1,
-1.470396, 2.231308, 0.7272204, 1, 1, 1, 1, 1,
-1.467207, -1.421338, -1.316243, 1, 1, 1, 1, 1,
-1.458626, 0.7648347, 0.763318, 1, 1, 1, 1, 1,
-1.452518, 0.9501958, -1.818541, 1, 1, 1, 1, 1,
-1.451553, 1.67398, -0.1761447, 1, 1, 1, 1, 1,
-1.45009, -0.1443072, -1.967406, 1, 1, 1, 1, 1,
-1.444107, 1.050644, -0.6919506, 1, 1, 1, 1, 1,
-1.433848, -1.157579, -0.7267526, 1, 1, 1, 1, 1,
-1.413016, 0.3885326, -1.31377, 1, 1, 1, 1, 1,
-1.398564, 0.5157627, -1.786455, 0, 0, 1, 1, 1,
-1.386036, 0.8857181, -1.412381, 1, 0, 0, 1, 1,
-1.381338, -1.523435, -2.361769, 1, 0, 0, 1, 1,
-1.378543, 0.2608491, -2.919572, 1, 0, 0, 1, 1,
-1.375921, 1.011518, -1.407007, 1, 0, 0, 1, 1,
-1.37261, 0.04478106, -0.716539, 1, 0, 0, 1, 1,
-1.370928, 1.135378, -0.3091823, 0, 0, 0, 1, 1,
-1.370625, -0.2766197, -3.079784, 0, 0, 0, 1, 1,
-1.360904, -0.6168277, -3.944269, 0, 0, 0, 1, 1,
-1.35144, 1.377093, -0.805209, 0, 0, 0, 1, 1,
-1.336703, -1.256149, -2.545599, 0, 0, 0, 1, 1,
-1.324669, -0.183344, -1.548485, 0, 0, 0, 1, 1,
-1.322552, -2.134457, -2.335055, 0, 0, 0, 1, 1,
-1.305992, -0.7238129, -1.227308, 1, 1, 1, 1, 1,
-1.301023, -0.4280309, -4.06689, 1, 1, 1, 1, 1,
-1.295562, 0.162651, -0.7624581, 1, 1, 1, 1, 1,
-1.285601, 2.31822, 0.6692983, 1, 1, 1, 1, 1,
-1.282182, 0.3807443, -0.1302701, 1, 1, 1, 1, 1,
-1.280446, -0.06520091, -1.389887, 1, 1, 1, 1, 1,
-1.278966, 0.7796052, -0.3174204, 1, 1, 1, 1, 1,
-1.278764, 0.8464096, 1.688934, 1, 1, 1, 1, 1,
-1.266887, 0.08723949, -2.681512, 1, 1, 1, 1, 1,
-1.263342, 2.32162, -0.8515807, 1, 1, 1, 1, 1,
-1.261078, -0.5300116, -2.388232, 1, 1, 1, 1, 1,
-1.259602, 0.2052289, -1.800092, 1, 1, 1, 1, 1,
-1.258816, -0.9983252, -3.159189, 1, 1, 1, 1, 1,
-1.257366, -0.6032897, -3.234863, 1, 1, 1, 1, 1,
-1.25535, -0.8080934, 0.5595769, 1, 1, 1, 1, 1,
-1.251139, -0.480869, -1.35671, 0, 0, 1, 1, 1,
-1.250763, -0.2681552, -1.649497, 1, 0, 0, 1, 1,
-1.249824, -1.008702, -2.420745, 1, 0, 0, 1, 1,
-1.244331, -0.8832275, -2.45047, 1, 0, 0, 1, 1,
-1.242301, -0.04820544, -2.129481, 1, 0, 0, 1, 1,
-1.241347, 0.8885996, -1.042478, 1, 0, 0, 1, 1,
-1.239179, -0.1522523, -1.75589, 0, 0, 0, 1, 1,
-1.236463, -0.01406412, -1.606044, 0, 0, 0, 1, 1,
-1.235093, -2.143328, -1.643066, 0, 0, 0, 1, 1,
-1.223432, 1.544346, 1.004909, 0, 0, 0, 1, 1,
-1.223055, -0.3662112, -0.7589547, 0, 0, 0, 1, 1,
-1.220276, 0.1613208, -0.8467709, 0, 0, 0, 1, 1,
-1.213095, -0.8936718, -2.32212, 0, 0, 0, 1, 1,
-1.211252, -1.157481, -2.150376, 1, 1, 1, 1, 1,
-1.209867, -1.638126, -2.44432, 1, 1, 1, 1, 1,
-1.207759, 0.5834777, -0.4823712, 1, 1, 1, 1, 1,
-1.195376, 0.2343123, -1.196016, 1, 1, 1, 1, 1,
-1.193173, 0.2149917, -1.872167, 1, 1, 1, 1, 1,
-1.191658, -0.4370779, -2.370506, 1, 1, 1, 1, 1,
-1.189575, 0.1241734, -2.32738, 1, 1, 1, 1, 1,
-1.188416, -0.7358811, -3.120812, 1, 1, 1, 1, 1,
-1.184469, -0.7215595, -0.9990549, 1, 1, 1, 1, 1,
-1.180665, 1.132122, -0.3578631, 1, 1, 1, 1, 1,
-1.178898, -0.1497893, -2.217777, 1, 1, 1, 1, 1,
-1.175287, -1.248551, -1.142565, 1, 1, 1, 1, 1,
-1.174854, -0.6863083, -2.80539, 1, 1, 1, 1, 1,
-1.172512, 2.021585, -0.970036, 1, 1, 1, 1, 1,
-1.169292, -0.3081256, -1.058657, 1, 1, 1, 1, 1,
-1.168401, 0.0125349, -1.520736, 0, 0, 1, 1, 1,
-1.159667, -0.5360188, -2.8073, 1, 0, 0, 1, 1,
-1.158554, -0.9358627, -2.062872, 1, 0, 0, 1, 1,
-1.150652, -1.876141, -1.954904, 1, 0, 0, 1, 1,
-1.148293, -1.084493, -1.693919, 1, 0, 0, 1, 1,
-1.14783, 0.09607664, -0.3533345, 1, 0, 0, 1, 1,
-1.141, 1.34519, 0.3274437, 0, 0, 0, 1, 1,
-1.139015, 0.793355, -1.154422, 0, 0, 0, 1, 1,
-1.137161, 0.7919515, -0.3209272, 0, 0, 0, 1, 1,
-1.128713, -0.3685002, -1.939347, 0, 0, 0, 1, 1,
-1.12773, -0.6875381, -1.51082, 0, 0, 0, 1, 1,
-1.126755, -0.8223647, -2.205776, 0, 0, 0, 1, 1,
-1.12659, -0.4734187, -1.693476, 0, 0, 0, 1, 1,
-1.125539, -0.1951776, -1.34301, 1, 1, 1, 1, 1,
-1.118036, 0.4312444, -1.036798, 1, 1, 1, 1, 1,
-1.116683, -0.7858528, -1.617203, 1, 1, 1, 1, 1,
-1.115086, -0.913368, -1.380193, 1, 1, 1, 1, 1,
-1.11384, -0.873982, -1.906201, 1, 1, 1, 1, 1,
-1.10921, 0.5750462, -0.08302811, 1, 1, 1, 1, 1,
-1.10821, 0.2782369, -1.829548, 1, 1, 1, 1, 1,
-1.10521, 0.2381628, -1.170804, 1, 1, 1, 1, 1,
-1.093373, 2.432165, 0.8779812, 1, 1, 1, 1, 1,
-1.090211, 1.087229, -1.931164, 1, 1, 1, 1, 1,
-1.090028, 1.407192, -0.5872675, 1, 1, 1, 1, 1,
-1.084945, -0.5568391, -0.05388598, 1, 1, 1, 1, 1,
-1.084933, 0.3700392, -1.65577, 1, 1, 1, 1, 1,
-1.082372, -0.6923648, -1.42458, 1, 1, 1, 1, 1,
-1.081918, -0.05038627, -1.10822, 1, 1, 1, 1, 1,
-1.081427, -0.3448525, -1.857681, 0, 0, 1, 1, 1,
-1.079723, -0.8198714, -2.642014, 1, 0, 0, 1, 1,
-1.073382, 0.2489883, -0.5867801, 1, 0, 0, 1, 1,
-1.070913, 0.1333287, -3.20051, 1, 0, 0, 1, 1,
-1.06889, 1.226282, -1.957066, 1, 0, 0, 1, 1,
-1.067044, 1.405196, -1.742192, 1, 0, 0, 1, 1,
-1.063287, -1.282131, -1.383812, 0, 0, 0, 1, 1,
-1.062098, -0.0001190156, -2.438611, 0, 0, 0, 1, 1,
-1.059692, -1.18723, -3.386194, 0, 0, 0, 1, 1,
-1.055014, -0.04589662, -1.433921, 0, 0, 0, 1, 1,
-1.05072, -1.065756, -1.464213, 0, 0, 0, 1, 1,
-1.041413, 0.1612036, -1.191856, 0, 0, 0, 1, 1,
-1.037966, -0.02324044, -0.9369615, 0, 0, 0, 1, 1,
-1.037657, -0.09228314, -1.968257, 1, 1, 1, 1, 1,
-1.029009, -1.549121, -4.00545, 1, 1, 1, 1, 1,
-1.026474, 0.08383546, -0.645209, 1, 1, 1, 1, 1,
-1.023996, -1.609227, -2.836711, 1, 1, 1, 1, 1,
-1.023572, 0.2009003, -1.149591, 1, 1, 1, 1, 1,
-1.020336, 0.4676763, -1.755729, 1, 1, 1, 1, 1,
-1.018958, -1.323534, -1.298334, 1, 1, 1, 1, 1,
-1.013902, 0.08401951, -2.317953, 1, 1, 1, 1, 1,
-1.013552, -0.2516807, -2.667595, 1, 1, 1, 1, 1,
-1.012872, 0.2454668, -2.837188, 1, 1, 1, 1, 1,
-1.012079, 0.1939709, -1.830251, 1, 1, 1, 1, 1,
-0.9979621, -1.847187, -3.204249, 1, 1, 1, 1, 1,
-0.9892836, 0.2708328, -0.1285754, 1, 1, 1, 1, 1,
-0.9889238, -0.5832423, -1.113173, 1, 1, 1, 1, 1,
-0.9863898, 0.6039785, -1.808488, 1, 1, 1, 1, 1,
-0.9773621, 1.478315, 0.4885, 0, 0, 1, 1, 1,
-0.9747583, -0.01079584, -1.849651, 1, 0, 0, 1, 1,
-0.9741603, 0.3154085, -0.310441, 1, 0, 0, 1, 1,
-0.9693547, -0.1621742, 0.2401147, 1, 0, 0, 1, 1,
-0.9673691, 0.140112, -2.212459, 1, 0, 0, 1, 1,
-0.9614336, -0.2274387, -0.6604173, 1, 0, 0, 1, 1,
-0.9542307, 0.9391361, -1.86159, 0, 0, 0, 1, 1,
-0.9485294, 0.7302746, -0.1148924, 0, 0, 0, 1, 1,
-0.9447243, 0.5635903, -2.511269, 0, 0, 0, 1, 1,
-0.9434121, 0.7174988, 0.3942719, 0, 0, 0, 1, 1,
-0.9424594, 0.4248385, -0.8755293, 0, 0, 0, 1, 1,
-0.9360316, -0.4903989, -2.462848, 0, 0, 0, 1, 1,
-0.9311516, -0.8847923, -1.852195, 0, 0, 0, 1, 1,
-0.9294788, -0.3697753, -2.270704, 1, 1, 1, 1, 1,
-0.9268954, -0.3888316, -2.41626, 1, 1, 1, 1, 1,
-0.9183754, 0.5320944, -0.7508203, 1, 1, 1, 1, 1,
-0.9183075, -0.9615828, -1.813065, 1, 1, 1, 1, 1,
-0.9152822, -0.8296907, -1.479174, 1, 1, 1, 1, 1,
-0.9147248, 0.9186786, 0.1149566, 1, 1, 1, 1, 1,
-0.9121408, 0.343586, -2.057651, 1, 1, 1, 1, 1,
-0.9120421, -0.7313332, -2.831614, 1, 1, 1, 1, 1,
-0.9067146, 1.006338, -0.171171, 1, 1, 1, 1, 1,
-0.9047133, 0.471759, -1.696175, 1, 1, 1, 1, 1,
-0.9025688, 1.337217, -0.14216, 1, 1, 1, 1, 1,
-0.8926377, 1.648166, -1.665862, 1, 1, 1, 1, 1,
-0.8918079, 0.8830476, -1.642077, 1, 1, 1, 1, 1,
-0.8873978, 0.8660771, 0.1425367, 1, 1, 1, 1, 1,
-0.8872424, 0.1065672, -2.026758, 1, 1, 1, 1, 1,
-0.8859147, 1.251381, -1.483727, 0, 0, 1, 1, 1,
-0.8824582, 1.388941, -1.424452, 1, 0, 0, 1, 1,
-0.878951, 1.697015, -0.5352387, 1, 0, 0, 1, 1,
-0.8769079, -0.5557628, -2.63462, 1, 0, 0, 1, 1,
-0.8685858, -1.664918, -2.95346, 1, 0, 0, 1, 1,
-0.866827, 1.125435, -1.442266, 1, 0, 0, 1, 1,
-0.8665792, 0.8125226, -1.224705, 0, 0, 0, 1, 1,
-0.8644578, 1.796564, -1.023135, 0, 0, 0, 1, 1,
-0.8596889, -0.01064831, -1.751386, 0, 0, 0, 1, 1,
-0.8589964, 1.697547, -1.12162, 0, 0, 0, 1, 1,
-0.8534735, -0.1409224, -1.792797, 0, 0, 0, 1, 1,
-0.8528492, -0.7310117, -3.386503, 0, 0, 0, 1, 1,
-0.8404076, 0.1217156, -0.2095781, 0, 0, 0, 1, 1,
-0.8374491, -0.9265094, -0.4007444, 1, 1, 1, 1, 1,
-0.8366001, -0.8410981, -1.588691, 1, 1, 1, 1, 1,
-0.8360522, -0.06875349, -1.284548, 1, 1, 1, 1, 1,
-0.8309342, -1.844292, -2.508464, 1, 1, 1, 1, 1,
-0.8299884, -0.7092431, -3.891986, 1, 1, 1, 1, 1,
-0.8267346, 0.3162803, -0.6896993, 1, 1, 1, 1, 1,
-0.821584, 0.269465, -1.937804, 1, 1, 1, 1, 1,
-0.8174073, 0.7740873, -0.06907469, 1, 1, 1, 1, 1,
-0.8129287, 0.6094169, -1.306105, 1, 1, 1, 1, 1,
-0.8094929, -0.5279923, -1.497787, 1, 1, 1, 1, 1,
-0.8044537, 0.03754754, -2.041365, 1, 1, 1, 1, 1,
-0.8040541, 0.3836628, 0.6013712, 1, 1, 1, 1, 1,
-0.802702, -2.183021, -3.347679, 1, 1, 1, 1, 1,
-0.7966993, 0.1086704, -1.185764, 1, 1, 1, 1, 1,
-0.7959405, 0.3140863, -1.314664, 1, 1, 1, 1, 1,
-0.7937683, 0.6595715, -1.256457, 0, 0, 1, 1, 1,
-0.7935174, -1.376874, -2.896505, 1, 0, 0, 1, 1,
-0.7920322, -0.3855085, -1.457193, 1, 0, 0, 1, 1,
-0.7894935, -0.4471098, -1.900674, 1, 0, 0, 1, 1,
-0.7834935, 0.7286684, 0.5067171, 1, 0, 0, 1, 1,
-0.7796111, 0.6619744, -2.478225, 1, 0, 0, 1, 1,
-0.7779739, 0.5840423, -1.51125, 0, 0, 0, 1, 1,
-0.7759973, 0.8255574, -2.48886, 0, 0, 0, 1, 1,
-0.7738973, 0.702714, 0.02625364, 0, 0, 0, 1, 1,
-0.7675865, -0.6931435, -1.753285, 0, 0, 0, 1, 1,
-0.7652321, 0.5221998, -0.9656378, 0, 0, 0, 1, 1,
-0.7604428, -0.09283627, -0.1517235, 0, 0, 0, 1, 1,
-0.7536944, -1.602881, -2.441548, 0, 0, 0, 1, 1,
-0.7515145, 0.7518625, -0.5810144, 1, 1, 1, 1, 1,
-0.7504358, 0.75002, -1.173337, 1, 1, 1, 1, 1,
-0.7464415, 0.7098644, -0.6921138, 1, 1, 1, 1, 1,
-0.7444292, 0.7360946, 0.2787566, 1, 1, 1, 1, 1,
-0.743803, 1.11882, -0.1678473, 1, 1, 1, 1, 1,
-0.7424788, -0.9577938, -3.54476, 1, 1, 1, 1, 1,
-0.7413502, -0.2265067, -2.255574, 1, 1, 1, 1, 1,
-0.7408799, 1.829056, 0.5361159, 1, 1, 1, 1, 1,
-0.7281959, 0.8696239, -0.258022, 1, 1, 1, 1, 1,
-0.7261206, 0.294985, -0.1621943, 1, 1, 1, 1, 1,
-0.7231594, 0.4449313, -0.3702422, 1, 1, 1, 1, 1,
-0.7231236, 0.2811726, 0.3649153, 1, 1, 1, 1, 1,
-0.7201574, -1.474799, -4.385521, 1, 1, 1, 1, 1,
-0.7143897, 0.6449067, -1.98751, 1, 1, 1, 1, 1,
-0.7076619, 1.305948, 0.3638251, 1, 1, 1, 1, 1,
-0.7053306, -2.114406, -2.658649, 0, 0, 1, 1, 1,
-0.7036976, 0.9958127, -0.9220021, 1, 0, 0, 1, 1,
-0.7032571, 0.0197622, -2.55949, 1, 0, 0, 1, 1,
-0.6923453, 0.2212382, -1.795187, 1, 0, 0, 1, 1,
-0.6914563, 0.1639565, -1.550066, 1, 0, 0, 1, 1,
-0.6862422, 0.0007662281, -2.242398, 1, 0, 0, 1, 1,
-0.6849551, -1.565547, -2.384566, 0, 0, 0, 1, 1,
-0.6806363, 0.03731061, -0.8794855, 0, 0, 0, 1, 1,
-0.6778437, 0.4982165, -0.7000906, 0, 0, 0, 1, 1,
-0.671795, -0.5774025, -2.246748, 0, 0, 0, 1, 1,
-0.6716213, -0.05883244, -0.7908005, 0, 0, 0, 1, 1,
-0.6691369, -0.7849234, -1.124345, 0, 0, 0, 1, 1,
-0.6689152, 0.5018666, -0.4783706, 0, 0, 0, 1, 1,
-0.6683059, 0.6769091, -0.8340027, 1, 1, 1, 1, 1,
-0.6673536, -0.5228961, -0.4583806, 1, 1, 1, 1, 1,
-0.6645023, -1.622522, -1.896969, 1, 1, 1, 1, 1,
-0.6642013, 0.7300665, -1.124693, 1, 1, 1, 1, 1,
-0.6546795, 2.355652, 2.393767, 1, 1, 1, 1, 1,
-0.6545255, -1.110618, -1.65765, 1, 1, 1, 1, 1,
-0.6539862, 0.5571511, -1.658626, 1, 1, 1, 1, 1,
-0.6525377, -1.523418, -3.020852, 1, 1, 1, 1, 1,
-0.6513073, 1.398398, 0.6843492, 1, 1, 1, 1, 1,
-0.6509767, -0.3355868, -2.816048, 1, 1, 1, 1, 1,
-0.647826, 2.472341, 0.1333107, 1, 1, 1, 1, 1,
-0.6453937, -0.04465412, -2.37232, 1, 1, 1, 1, 1,
-0.6451252, -0.4102326, -2.712774, 1, 1, 1, 1, 1,
-0.6300924, 0.1719663, -1.776163, 1, 1, 1, 1, 1,
-0.6163118, 0.2601877, -0.3023161, 1, 1, 1, 1, 1,
-0.6099017, -2.819491, -0.5845326, 0, 0, 1, 1, 1,
-0.6066022, -0.5712368, -1.928658, 1, 0, 0, 1, 1,
-0.6038738, -0.5351884, -2.538778, 1, 0, 0, 1, 1,
-0.5950187, -0.3047235, -2.761878, 1, 0, 0, 1, 1,
-0.5937226, -0.7550222, -4.540463, 1, 0, 0, 1, 1,
-0.5932438, -0.06350595, -1.672153, 1, 0, 0, 1, 1,
-0.5918301, -0.2291466, -0.6464586, 0, 0, 0, 1, 1,
-0.5916709, -1.088816, -3.214632, 0, 0, 0, 1, 1,
-0.5872399, 0.08931366, -3.014734, 0, 0, 0, 1, 1,
-0.5813203, 0.4603682, -0.3267579, 0, 0, 0, 1, 1,
-0.5765836, -1.231352, -1.488629, 0, 0, 0, 1, 1,
-0.5760521, 1.364972, -1.956434, 0, 0, 0, 1, 1,
-0.5675276, -0.01842591, -0.8886792, 0, 0, 0, 1, 1,
-0.5641961, 0.9464285, -0.0101743, 1, 1, 1, 1, 1,
-0.5582066, 0.8413192, 0.4793559, 1, 1, 1, 1, 1,
-0.5554599, -1.413627, -2.156515, 1, 1, 1, 1, 1,
-0.5544617, 1.049904, 0.5522748, 1, 1, 1, 1, 1,
-0.5537354, 0.6344518, -0.05820177, 1, 1, 1, 1, 1,
-0.5510587, 1.176359, 0.225807, 1, 1, 1, 1, 1,
-0.5495361, 0.4077694, -0.2320556, 1, 1, 1, 1, 1,
-0.5481695, 0.2211518, -1.46189, 1, 1, 1, 1, 1,
-0.547626, 0.255534, -0.1940823, 1, 1, 1, 1, 1,
-0.547363, -0.3430077, -3.043946, 1, 1, 1, 1, 1,
-0.5409563, 1.170068, -1.108859, 1, 1, 1, 1, 1,
-0.5381796, 0.1657994, 0.1286549, 1, 1, 1, 1, 1,
-0.5352215, -0.7099252, -3.336826, 1, 1, 1, 1, 1,
-0.5319809, -0.565783, -2.09011, 1, 1, 1, 1, 1,
-0.5273474, -0.7675197, -1.39051, 1, 1, 1, 1, 1,
-0.522896, 0.7846586, -0.8603097, 0, 0, 1, 1, 1,
-0.5150651, -0.3074394, -2.890917, 1, 0, 0, 1, 1,
-0.5139855, -0.05693729, -2.42798, 1, 0, 0, 1, 1,
-0.5136983, -0.1959782, -2.279859, 1, 0, 0, 1, 1,
-0.5113572, 1.156939, -0.1959442, 1, 0, 0, 1, 1,
-0.5104879, -1.02088, -2.660582, 1, 0, 0, 1, 1,
-0.5095919, 0.3692395, -0.4547988, 0, 0, 0, 1, 1,
-0.5048876, 1.635411, -0.09319464, 0, 0, 0, 1, 1,
-0.5048826, -0.4791647, -2.255709, 0, 0, 0, 1, 1,
-0.4973766, 1.34906, -1.333799, 0, 0, 0, 1, 1,
-0.4938689, -0.2743237, -2.851887, 0, 0, 0, 1, 1,
-0.4927029, -0.2794975, -2.854975, 0, 0, 0, 1, 1,
-0.4916447, -0.3314857, -3.109145, 0, 0, 0, 1, 1,
-0.4916226, 1.772802, 2.447482, 1, 1, 1, 1, 1,
-0.4913973, -0.168072, -1.383934, 1, 1, 1, 1, 1,
-0.4903977, 1.043559, -1.778598, 1, 1, 1, 1, 1,
-0.4881105, -0.4190805, -1.016161, 1, 1, 1, 1, 1,
-0.4872614, -0.4065117, -1.442428, 1, 1, 1, 1, 1,
-0.4736895, 0.549758, -1.293743, 1, 1, 1, 1, 1,
-0.4696379, -0.7438036, -3.070119, 1, 1, 1, 1, 1,
-0.4652535, -0.5343783, -3.404168, 1, 1, 1, 1, 1,
-0.462602, 0.7475168, 0.3995127, 1, 1, 1, 1, 1,
-0.4569107, 0.1275469, 0.2541767, 1, 1, 1, 1, 1,
-0.4545018, -0.5590572, -1.828819, 1, 1, 1, 1, 1,
-0.4527157, 0.1901831, 0.04292263, 1, 1, 1, 1, 1,
-0.4526563, 1.104808, -0.1394281, 1, 1, 1, 1, 1,
-0.4475604, 0.7369227, 1.179138, 1, 1, 1, 1, 1,
-0.443355, -0.6700535, -3.86795, 1, 1, 1, 1, 1,
-0.4379303, -0.2903153, -0.3163215, 0, 0, 1, 1, 1,
-0.4364243, 0.04832416, -1.212974, 1, 0, 0, 1, 1,
-0.4349671, -0.1377345, -2.515311, 1, 0, 0, 1, 1,
-0.4304109, 0.1172947, -3.74889, 1, 0, 0, 1, 1,
-0.4303247, 0.5111186, -1.475246, 1, 0, 0, 1, 1,
-0.4287488, -0.5535597, -1.337228, 1, 0, 0, 1, 1,
-0.4273353, 0.01641926, -1.822284, 0, 0, 0, 1, 1,
-0.422473, -1.104077, -4.21816, 0, 0, 0, 1, 1,
-0.4177587, -1.779608, -1.918861, 0, 0, 0, 1, 1,
-0.4059941, 0.4750583, -1.15117, 0, 0, 0, 1, 1,
-0.4059517, -0.2248944, -1.899091, 0, 0, 0, 1, 1,
-0.4043875, -1.63656, -3.517709, 0, 0, 0, 1, 1,
-0.4001847, 0.4581105, -0.4055002, 0, 0, 0, 1, 1,
-0.4000947, 1.059448, -1.744184, 1, 1, 1, 1, 1,
-0.3991187, -0.4625186, -2.699732, 1, 1, 1, 1, 1,
-0.3962421, 0.006266098, -1.010038, 1, 1, 1, 1, 1,
-0.3889927, -2.469411, -3.129243, 1, 1, 1, 1, 1,
-0.3856431, -1.578892, -3.846892, 1, 1, 1, 1, 1,
-0.3796014, 0.03208334, -1.013392, 1, 1, 1, 1, 1,
-0.3767994, -0.5454695, -2.423213, 1, 1, 1, 1, 1,
-0.3744591, -0.8347722, -2.356208, 1, 1, 1, 1, 1,
-0.368781, 1.484224, -0.3508853, 1, 1, 1, 1, 1,
-0.3662113, -0.8444695, -3.266138, 1, 1, 1, 1, 1,
-0.3635282, -0.3509003, -2.537362, 1, 1, 1, 1, 1,
-0.3615009, -0.8977147, -1.305423, 1, 1, 1, 1, 1,
-0.3587882, 2.482064, 0.3531338, 1, 1, 1, 1, 1,
-0.3582228, -0.5925809, -2.946052, 1, 1, 1, 1, 1,
-0.3486055, -0.05416562, -2.396632, 1, 1, 1, 1, 1,
-0.3480721, -1.664292, -3.371843, 0, 0, 1, 1, 1,
-0.3452407, 0.3953927, -0.8713585, 1, 0, 0, 1, 1,
-0.3449322, 0.3956603, -0.06190759, 1, 0, 0, 1, 1,
-0.3435133, 0.8955091, -1.167686, 1, 0, 0, 1, 1,
-0.3390039, 0.3882575, -0.4849522, 1, 0, 0, 1, 1,
-0.3364971, 0.3108413, 0.110147, 1, 0, 0, 1, 1,
-0.3350711, -0.85334, -2.28884, 0, 0, 0, 1, 1,
-0.3339013, -0.5355471, -2.241661, 0, 0, 0, 1, 1,
-0.3287353, -0.3454902, -4.356446, 0, 0, 0, 1, 1,
-0.3282368, -1.60882, -3.37019, 0, 0, 0, 1, 1,
-0.3282039, -1.158569, -4.246953, 0, 0, 0, 1, 1,
-0.3269078, -0.9033928, -3.020706, 0, 0, 0, 1, 1,
-0.3268408, -0.8628823, -1.409083, 0, 0, 0, 1, 1,
-0.3264449, -0.8563247, -4.098896, 1, 1, 1, 1, 1,
-0.3259863, -0.3582516, -1.968723, 1, 1, 1, 1, 1,
-0.3258851, -1.567059, -2.656184, 1, 1, 1, 1, 1,
-0.3240067, 0.2605173, -0.2965871, 1, 1, 1, 1, 1,
-0.3227648, -0.7102569, -4.126232, 1, 1, 1, 1, 1,
-0.3167359, -1.355888, -2.15834, 1, 1, 1, 1, 1,
-0.3164381, 1.535758, 0.4221412, 1, 1, 1, 1, 1,
-0.3134377, 0.8980551, 1.450418, 1, 1, 1, 1, 1,
-0.3130796, -0.8018874, -1.964935, 1, 1, 1, 1, 1,
-0.312877, 0.5037324, -2.348465, 1, 1, 1, 1, 1,
-0.3117459, 1.991411, -0.6382012, 1, 1, 1, 1, 1,
-0.3098382, -0.1788668, -2.204682, 1, 1, 1, 1, 1,
-0.3080261, 1.030281, 0.7552288, 1, 1, 1, 1, 1,
-0.3077374, 1.007227, -1.169724, 1, 1, 1, 1, 1,
-0.3075499, 0.1404615, -2.588335, 1, 1, 1, 1, 1,
-0.3043286, 0.904659, 0.3182583, 0, 0, 1, 1, 1,
-0.2999834, -0.2539254, -1.676892, 1, 0, 0, 1, 1,
-0.2977229, -0.4760041, -2.643708, 1, 0, 0, 1, 1,
-0.2952255, -1.127312, -2.752158, 1, 0, 0, 1, 1,
-0.2941245, 0.2563564, 0.1212434, 1, 0, 0, 1, 1,
-0.2940497, -0.1637547, -2.19055, 1, 0, 0, 1, 1,
-0.2933266, 0.2928994, -2.077458, 0, 0, 0, 1, 1,
-0.2920688, 0.6483343, -0.02317259, 0, 0, 0, 1, 1,
-0.2887842, 0.3310751, -0.4135805, 0, 0, 0, 1, 1,
-0.2840242, 1.054406, -1.442179, 0, 0, 0, 1, 1,
-0.2803746, 0.9968578, -0.5138213, 0, 0, 0, 1, 1,
-0.2798752, -1.716467, -3.776502, 0, 0, 0, 1, 1,
-0.2711298, -0.8000179, -4.034071, 0, 0, 0, 1, 1,
-0.2690269, -1.032749, -4.701619, 1, 1, 1, 1, 1,
-0.2685292, -0.01502362, -2.455291, 1, 1, 1, 1, 1,
-0.2655783, 0.8701734, 0.08323653, 1, 1, 1, 1, 1,
-0.2622582, -1.79918, -3.817961, 1, 1, 1, 1, 1,
-0.2586727, -0.7295266, -2.510036, 1, 1, 1, 1, 1,
-0.2544604, 0.9184185, 0.8319359, 1, 1, 1, 1, 1,
-0.2509973, 0.6190979, -0.3484875, 1, 1, 1, 1, 1,
-0.2420017, 0.20141, -2.147823, 1, 1, 1, 1, 1,
-0.2369047, 0.7503592, 1.273507, 1, 1, 1, 1, 1,
-0.2334077, 0.05236977, -1.360408, 1, 1, 1, 1, 1,
-0.2332405, 1.750455, 0.4176867, 1, 1, 1, 1, 1,
-0.2282907, -2.303555, -4.606448, 1, 1, 1, 1, 1,
-0.2271205, 0.3141367, 0.1605372, 1, 1, 1, 1, 1,
-0.2209037, 0.9149555, -1.132451, 1, 1, 1, 1, 1,
-0.21669, -0.7298821, -3.481615, 1, 1, 1, 1, 1,
-0.2150659, 0.807281, -0.5103797, 0, 0, 1, 1, 1,
-0.2150217, 1.376926, 0.9059143, 1, 0, 0, 1, 1,
-0.2128774, -0.03095257, -2.87973, 1, 0, 0, 1, 1,
-0.2120456, 0.5012388, -0.1250359, 1, 0, 0, 1, 1,
-0.2047788, 0.353489, 0.4883121, 1, 0, 0, 1, 1,
-0.2043706, 0.7459765, 0.8918976, 1, 0, 0, 1, 1,
-0.2011158, 0.8336697, -1.133154, 0, 0, 0, 1, 1,
-0.200583, -1.332936, -0.7967398, 0, 0, 0, 1, 1,
-0.2003711, -0.4635647, -4.370622, 0, 0, 0, 1, 1,
-0.1998363, 0.3370308, -1.783639, 0, 0, 0, 1, 1,
-0.1996759, -1.060279, -3.146841, 0, 0, 0, 1, 1,
-0.1981495, -0.2875296, 0.01453856, 0, 0, 0, 1, 1,
-0.192574, -0.1261155, -2.389608, 0, 0, 0, 1, 1,
-0.1925198, 1.011096, -0.9319461, 1, 1, 1, 1, 1,
-0.1918535, -1.18474, -3.530391, 1, 1, 1, 1, 1,
-0.1878597, 0.139609, -0.432551, 1, 1, 1, 1, 1,
-0.1840099, 1.134798, 1.992076, 1, 1, 1, 1, 1,
-0.1837585, -0.4705999, -1.125931, 1, 1, 1, 1, 1,
-0.1799129, 0.3304298, 0.1326765, 1, 1, 1, 1, 1,
-0.1796367, 1.000103, 0.2908131, 1, 1, 1, 1, 1,
-0.1764091, -1.525766, -2.091343, 1, 1, 1, 1, 1,
-0.1725084, -0.5081266, -2.394318, 1, 1, 1, 1, 1,
-0.1642828, -0.1673101, -2.610774, 1, 1, 1, 1, 1,
-0.164167, -1.282789, -4.869626, 1, 1, 1, 1, 1,
-0.1630341, -0.2961867, -2.368918, 1, 1, 1, 1, 1,
-0.1626893, -0.2219852, -2.694576, 1, 1, 1, 1, 1,
-0.1584835, -0.1396054, -2.86038, 1, 1, 1, 1, 1,
-0.1580446, 0.4120787, -0.4962021, 1, 1, 1, 1, 1,
-0.1553442, -0.8697718, -3.663507, 0, 0, 1, 1, 1,
-0.1528108, 1.212552, 0.2892309, 1, 0, 0, 1, 1,
-0.1477102, 1.305799, 0.569405, 1, 0, 0, 1, 1,
-0.1469676, 0.0947763, -1.647718, 1, 0, 0, 1, 1,
-0.1468856, 1.099056, -0.9486119, 1, 0, 0, 1, 1,
-0.1460778, 1.097375, -0.5543068, 1, 0, 0, 1, 1,
-0.1378698, -1.796515, -3.828114, 0, 0, 0, 1, 1,
-0.1375063, -0.1904526, -3.153237, 0, 0, 0, 1, 1,
-0.1346858, 0.1148113, -1.226675, 0, 0, 0, 1, 1,
-0.132716, -0.4252831, -1.866554, 0, 0, 0, 1, 1,
-0.1276633, 0.3330922, 0.4730507, 0, 0, 0, 1, 1,
-0.1275671, 0.956874, -0.03945376, 0, 0, 0, 1, 1,
-0.1240425, -0.8031946, -4.049361, 0, 0, 0, 1, 1,
-0.1237636, -0.1183458, -3.361026, 1, 1, 1, 1, 1,
-0.1215819, 1.05075, -0.2851114, 1, 1, 1, 1, 1,
-0.1162434, -0.1013933, -3.479872, 1, 1, 1, 1, 1,
-0.1146959, -0.2925807, -2.707369, 1, 1, 1, 1, 1,
-0.1146371, 0.4134418, -0.8202904, 1, 1, 1, 1, 1,
-0.1120807, 0.1124451, -0.122659, 1, 1, 1, 1, 1,
-0.1119603, -0.6595655, -4.729456, 1, 1, 1, 1, 1,
-0.1107613, 0.4683651, 1.06178, 1, 1, 1, 1, 1,
-0.1079607, -0.6436958, -2.151759, 1, 1, 1, 1, 1,
-0.1023536, -1.070748, -2.583982, 1, 1, 1, 1, 1,
-0.1010248, 0.1763014, -1.118975, 1, 1, 1, 1, 1,
-0.1002087, 0.6226521, 0.01102624, 1, 1, 1, 1, 1,
-0.09635852, -0.1437528, -2.266097, 1, 1, 1, 1, 1,
-0.09539462, 1.069415, 0.05245391, 1, 1, 1, 1, 1,
-0.09453452, 1.418951, 0.3203563, 1, 1, 1, 1, 1,
-0.09104466, 0.7471411, -0.1442605, 0, 0, 1, 1, 1,
-0.08984911, 0.6598973, -0.04420139, 1, 0, 0, 1, 1,
-0.0896948, 1.793174, 1.005044, 1, 0, 0, 1, 1,
-0.08499124, -1.374709, -2.52913, 1, 0, 0, 1, 1,
-0.07971139, 0.3427847, 0.024835, 1, 0, 0, 1, 1,
-0.07805058, -0.5982271, -3.141534, 1, 0, 0, 1, 1,
-0.074054, -0.3220574, -3.229935, 0, 0, 0, 1, 1,
-0.06983492, -0.7857323, -1.150509, 0, 0, 0, 1, 1,
-0.06694617, -0.4979426, -3.973633, 0, 0, 0, 1, 1,
-0.06387022, 0.2699405, 1.616062, 0, 0, 0, 1, 1,
-0.06209583, 0.6764874, 0.9344441, 0, 0, 0, 1, 1,
-0.05300286, -0.5360247, -3.811226, 0, 0, 0, 1, 1,
-0.04672476, 0.1192335, 0.3060779, 0, 0, 0, 1, 1,
-0.04657399, -0.1011264, -2.317012, 1, 1, 1, 1, 1,
-0.0464515, 0.2744345, 0.0331302, 1, 1, 1, 1, 1,
-0.04352694, 1.370173, -1.461826, 1, 1, 1, 1, 1,
-0.04081813, -1.271244, -3.312575, 1, 1, 1, 1, 1,
-0.04003533, -0.2834729, -1.986467, 1, 1, 1, 1, 1,
-0.0395339, -1.960235, -2.500054, 1, 1, 1, 1, 1,
-0.03533573, 1.262454, 0.0221804, 1, 1, 1, 1, 1,
-0.02691045, 1.599461, 1.416751, 1, 1, 1, 1, 1,
-0.02488242, -2.232435, -2.529586, 1, 1, 1, 1, 1,
-0.01275397, 0.2315316, 0.5526351, 1, 1, 1, 1, 1,
-0.01221473, -2.274728, -3.03392, 1, 1, 1, 1, 1,
-0.01118026, -0.5751183, -2.94311, 1, 1, 1, 1, 1,
-0.007342002, -1.933446, -2.91438, 1, 1, 1, 1, 1,
-0.0006482961, 0.1409565, -0.7247967, 1, 1, 1, 1, 1,
0.005598888, 0.4221669, 0.9199492, 1, 1, 1, 1, 1,
0.01221924, -1.63161, 3.123052, 0, 0, 1, 1, 1,
0.0124027, -0.759477, 3.494489, 1, 0, 0, 1, 1,
0.013825, -0.1315523, 3.376246, 1, 0, 0, 1, 1,
0.01410646, -0.2450459, 4.425912, 1, 0, 0, 1, 1,
0.01519658, 0.8516928, -1.447427, 1, 0, 0, 1, 1,
0.01712705, -0.3443418, 2.300954, 1, 0, 0, 1, 1,
0.01737127, 1.495065, 0.6576659, 0, 0, 0, 1, 1,
0.02361556, 0.9571859, -0.2018535, 0, 0, 0, 1, 1,
0.02399502, 1.411964, -1.696554, 0, 0, 0, 1, 1,
0.02529862, 1.417386, 2.510341, 0, 0, 0, 1, 1,
0.02561475, 0.3640459, -1.748332, 0, 0, 0, 1, 1,
0.02744557, 0.6355454, -0.3584181, 0, 0, 0, 1, 1,
0.02896942, 0.1007108, -1.619249, 0, 0, 0, 1, 1,
0.03235433, 0.1114589, 0.3448586, 1, 1, 1, 1, 1,
0.03332156, -0.6266944, 2.970529, 1, 1, 1, 1, 1,
0.0352929, 0.1417422, 0.7251201, 1, 1, 1, 1, 1,
0.03617999, 0.4104433, 0.3207906, 1, 1, 1, 1, 1,
0.03777312, 1.075729, -0.8606151, 1, 1, 1, 1, 1,
0.03924839, 0.9598383, -0.1587723, 1, 1, 1, 1, 1,
0.04170907, -0.177442, 4.448494, 1, 1, 1, 1, 1,
0.04199536, -1.218272, 4.538887, 1, 1, 1, 1, 1,
0.04514193, 1.65732, 2.288232, 1, 1, 1, 1, 1,
0.04900548, 0.7913929, 0.5641629, 1, 1, 1, 1, 1,
0.05117703, -2.337048, 3.503376, 1, 1, 1, 1, 1,
0.05231843, -0.5882709, 1.709277, 1, 1, 1, 1, 1,
0.05665438, 1.319095, 0.7823623, 1, 1, 1, 1, 1,
0.05686526, 0.2577262, -0.8715724, 1, 1, 1, 1, 1,
0.07024128, -1.49872, 3.144633, 1, 1, 1, 1, 1,
0.07561562, -0.9989829, 1.671529, 0, 0, 1, 1, 1,
0.07629093, -0.4852996, 1.547826, 1, 0, 0, 1, 1,
0.08001687, 0.4541647, -0.2486655, 1, 0, 0, 1, 1,
0.08454396, -0.2610978, 2.805177, 1, 0, 0, 1, 1,
0.08537193, 1.523648, 2.380801, 1, 0, 0, 1, 1,
0.08811089, -0.6009536, 2.058172, 1, 0, 0, 1, 1,
0.09024109, -0.2600271, 1.444995, 0, 0, 0, 1, 1,
0.09091526, -2.603776, 1.729412, 0, 0, 0, 1, 1,
0.0936509, 0.41559, 1.200069, 0, 0, 0, 1, 1,
0.09452032, 0.7167954, 3.716874, 0, 0, 0, 1, 1,
0.1016098, 0.5592459, 0.5594367, 0, 0, 0, 1, 1,
0.1039043, -0.3681257, 2.661903, 0, 0, 0, 1, 1,
0.1042694, 1.471512, -0.09733703, 0, 0, 0, 1, 1,
0.1052961, -0.7152686, 1.488888, 1, 1, 1, 1, 1,
0.1064737, -0.2698933, 3.838264, 1, 1, 1, 1, 1,
0.1112451, -1.809861, 2.405413, 1, 1, 1, 1, 1,
0.1117967, 0.7196605, 1.153208, 1, 1, 1, 1, 1,
0.1126453, -0.2000714, 1.468919, 1, 1, 1, 1, 1,
0.1128237, -0.7130776, 3.37888, 1, 1, 1, 1, 1,
0.1163172, 0.1250364, 0.5466098, 1, 1, 1, 1, 1,
0.1173362, -0.5106843, 1.169106, 1, 1, 1, 1, 1,
0.1299027, -1.125675, 1.714422, 1, 1, 1, 1, 1,
0.1305394, -0.9642044, 3.300183, 1, 1, 1, 1, 1,
0.1314497, -1.014198, 3.432392, 1, 1, 1, 1, 1,
0.1320577, 1.688624, -0.8912677, 1, 1, 1, 1, 1,
0.132393, -0.3943525, 1.929585, 1, 1, 1, 1, 1,
0.1365655, -0.1230827, 1.591539, 1, 1, 1, 1, 1,
0.1428044, 0.8852957, -0.4604724, 1, 1, 1, 1, 1,
0.1432325, -0.8111802, 3.597112, 0, 0, 1, 1, 1,
0.1438035, 0.01741713, 2.598335, 1, 0, 0, 1, 1,
0.1503695, -0.03892789, 2.12168, 1, 0, 0, 1, 1,
0.1519062, 0.3602397, 1.894264, 1, 0, 0, 1, 1,
0.1580516, -1.2282, 2.696996, 1, 0, 0, 1, 1,
0.1589215, -0.6631571, 4.077137, 1, 0, 0, 1, 1,
0.1606427, 0.5121945, -0.6296678, 0, 0, 0, 1, 1,
0.1644244, 0.5033137, -2.37686, 0, 0, 0, 1, 1,
0.1683171, 0.4637859, -0.1677982, 0, 0, 0, 1, 1,
0.17122, -0.8732006, 3.101114, 0, 0, 0, 1, 1,
0.1747219, -0.6333035, 1.462565, 0, 0, 0, 1, 1,
0.174935, -1.787987, 2.481219, 0, 0, 0, 1, 1,
0.1819185, 0.4185017, 0.09431655, 0, 0, 0, 1, 1,
0.1872191, -0.8386462, 2.967034, 1, 1, 1, 1, 1,
0.1906443, -0.7773842, 3.176319, 1, 1, 1, 1, 1,
0.1910859, -0.3197263, 4.274961, 1, 1, 1, 1, 1,
0.1922595, -0.5680914, 5.563002, 1, 1, 1, 1, 1,
0.1962466, -0.6671294, 3.872627, 1, 1, 1, 1, 1,
0.1982519, -0.2682641, 3.609455, 1, 1, 1, 1, 1,
0.2009702, -2.216733, 2.604341, 1, 1, 1, 1, 1,
0.2062465, 2.080259, 0.9468037, 1, 1, 1, 1, 1,
0.2080507, -1.427089, 3.753397, 1, 1, 1, 1, 1,
0.2110977, -0.03777647, 0.7428141, 1, 1, 1, 1, 1,
0.218647, 2.007399, -0.5452289, 1, 1, 1, 1, 1,
0.2195171, 0.6471223, 0.898765, 1, 1, 1, 1, 1,
0.2201354, -1.447597, 2.952359, 1, 1, 1, 1, 1,
0.2215733, -0.4695322, 2.666662, 1, 1, 1, 1, 1,
0.2258377, 1.49929, -0.1700559, 1, 1, 1, 1, 1,
0.2283902, 0.838456, 1.246539, 0, 0, 1, 1, 1,
0.2302174, -0.2448383, 3.245897, 1, 0, 0, 1, 1,
0.2318575, 1.22128, -0.5007502, 1, 0, 0, 1, 1,
0.2330393, -2.130648, 2.28499, 1, 0, 0, 1, 1,
0.2348605, 0.1081313, 0.6988382, 1, 0, 0, 1, 1,
0.2370549, -0.06426812, 0.791967, 1, 0, 0, 1, 1,
0.2387348, -1.111969, 1.784956, 0, 0, 0, 1, 1,
0.2404584, 0.1736165, -0.6246176, 0, 0, 0, 1, 1,
0.2418186, 0.4598407, 0.8437069, 0, 0, 0, 1, 1,
0.2418544, -0.4558394, 1.525936, 0, 0, 0, 1, 1,
0.2435358, -0.9907249, 1.973621, 0, 0, 0, 1, 1,
0.2448502, 2.680146, 1.741737, 0, 0, 0, 1, 1,
0.2453173, -1.291192, 3.931361, 0, 0, 0, 1, 1,
0.2568572, -0.7316511, 2.771919, 1, 1, 1, 1, 1,
0.2684984, -0.2736949, 1.959834, 1, 1, 1, 1, 1,
0.2687737, -2.376274, 3.306432, 1, 1, 1, 1, 1,
0.2702445, -0.1099787, 1.93269, 1, 1, 1, 1, 1,
0.2760829, 1.765586, 0.8292848, 1, 1, 1, 1, 1,
0.2767193, 0.128362, 0.8870504, 1, 1, 1, 1, 1,
0.2789295, 1.522107, -0.1092669, 1, 1, 1, 1, 1,
0.2791151, 0.08881173, 1.000979, 1, 1, 1, 1, 1,
0.2798205, 0.3073316, 0.6257051, 1, 1, 1, 1, 1,
0.2820051, 0.08746688, 2.334541, 1, 1, 1, 1, 1,
0.286721, -0.7424711, 1.960211, 1, 1, 1, 1, 1,
0.2931255, -0.06460899, 1.496484, 1, 1, 1, 1, 1,
0.2975842, 0.4826611, -0.03300452, 1, 1, 1, 1, 1,
0.2984384, -1.113425, 2.772502, 1, 1, 1, 1, 1,
0.2991872, 0.4965635, 1.585021, 1, 1, 1, 1, 1,
0.3001666, -0.2619997, 1.527488, 0, 0, 1, 1, 1,
0.3008641, -0.1554953, 1.489409, 1, 0, 0, 1, 1,
0.3012548, -0.773286, 4.627465, 1, 0, 0, 1, 1,
0.3020903, 0.5581337, 1.663212, 1, 0, 0, 1, 1,
0.3039867, -1.611893, 1.797407, 1, 0, 0, 1, 1,
0.3046732, -0.06990547, -0.2957427, 1, 0, 0, 1, 1,
0.3134605, -0.3612824, 1.444947, 0, 0, 0, 1, 1,
0.3185263, -0.630137, 3.590271, 0, 0, 0, 1, 1,
0.3210775, -0.9899707, 2.818708, 0, 0, 0, 1, 1,
0.3216771, -0.3053109, 3.143315, 0, 0, 0, 1, 1,
0.3230638, -0.8309366, 2.517777, 0, 0, 0, 1, 1,
0.3289621, -1.055707, 2.803605, 0, 0, 0, 1, 1,
0.330491, 0.5715783, 1.386252, 0, 0, 0, 1, 1,
0.3346373, -0.9037142, 1.364043, 1, 1, 1, 1, 1,
0.3365203, 1.12033, -0.2083775, 1, 1, 1, 1, 1,
0.3534176, 0.2969353, 1.180668, 1, 1, 1, 1, 1,
0.360086, -0.3385345, 2.340984, 1, 1, 1, 1, 1,
0.361747, -0.2169932, 1.705771, 1, 1, 1, 1, 1,
0.3620764, 1.333974, -1.263382, 1, 1, 1, 1, 1,
0.3667144, 1.476881, 0.3169362, 1, 1, 1, 1, 1,
0.3671513, 1.386745, 1.801668, 1, 1, 1, 1, 1,
0.3708051, -0.5524907, 1.885529, 1, 1, 1, 1, 1,
0.3710855, 1.856609, -0.453189, 1, 1, 1, 1, 1,
0.37308, -0.3377169, 2.651433, 1, 1, 1, 1, 1,
0.3739102, 0.06390722, 3.49248, 1, 1, 1, 1, 1,
0.3828223, -0.5208212, 2.92018, 1, 1, 1, 1, 1,
0.385021, 1.056238, 0.04821296, 1, 1, 1, 1, 1,
0.3881928, -1.06999, 2.45787, 1, 1, 1, 1, 1,
0.3915453, -0.3155024, 1.256322, 0, 0, 1, 1, 1,
0.3969861, 1.644637, -1.471741, 1, 0, 0, 1, 1,
0.3982271, -0.8891879, 3.440754, 1, 0, 0, 1, 1,
0.3985296, 0.6732355, 1.894517, 1, 0, 0, 1, 1,
0.4026175, -0.7239155, 1.989667, 1, 0, 0, 1, 1,
0.403909, -1.774513, 1.730899, 1, 0, 0, 1, 1,
0.4154632, -0.4628723, 3.825967, 0, 0, 0, 1, 1,
0.4172396, 1.415903, 1.286681, 0, 0, 0, 1, 1,
0.4182276, -1.21135, 3.488698, 0, 0, 0, 1, 1,
0.4190258, 1.159529, -0.3256302, 0, 0, 0, 1, 1,
0.4204615, -0.6812842, 1.349441, 0, 0, 0, 1, 1,
0.4219793, 0.7776932, 1.065566, 0, 0, 0, 1, 1,
0.4234735, -0.1967971, 1.615688, 0, 0, 0, 1, 1,
0.4269851, 1.091112, 2.657474, 1, 1, 1, 1, 1,
0.4285294, -0.2518868, 1.991807, 1, 1, 1, 1, 1,
0.428595, -0.1002206, 2.132353, 1, 1, 1, 1, 1,
0.4332345, 0.2434409, 1.786808, 1, 1, 1, 1, 1,
0.4332401, -0.2914653, 2.467888, 1, 1, 1, 1, 1,
0.4335262, 0.2421052, 2.134297, 1, 1, 1, 1, 1,
0.433809, 1.758929, 0.2793279, 1, 1, 1, 1, 1,
0.433944, -0.04535488, 0.3926497, 1, 1, 1, 1, 1,
0.4395281, -0.1194594, 1.03222, 1, 1, 1, 1, 1,
0.443355, -1.315898, 1.314983, 1, 1, 1, 1, 1,
0.4458476, -1.596181, 3.394496, 1, 1, 1, 1, 1,
0.4479544, 0.9932954, 1.12605, 1, 1, 1, 1, 1,
0.4586056, -1.162826, 3.354985, 1, 1, 1, 1, 1,
0.4611435, -1.254919, 3.143284, 1, 1, 1, 1, 1,
0.4611634, -1.03597, 2.579461, 1, 1, 1, 1, 1,
0.4674394, 0.1301418, 2.141664, 0, 0, 1, 1, 1,
0.472411, 0.180118, 0.07981502, 1, 0, 0, 1, 1,
0.4773588, -0.09895828, 4.026643, 1, 0, 0, 1, 1,
0.4789807, -0.3199773, 4.125806, 1, 0, 0, 1, 1,
0.4862099, -0.619416, 2.363946, 1, 0, 0, 1, 1,
0.4866704, 1.302245, -0.8009408, 1, 0, 0, 1, 1,
0.4901532, -0.6034082, 3.601019, 0, 0, 0, 1, 1,
0.4945554, 0.08740271, 3.209086, 0, 0, 0, 1, 1,
0.5021489, 0.2010999, 0.5417536, 0, 0, 0, 1, 1,
0.5036529, 0.9563372, -0.02725912, 0, 0, 0, 1, 1,
0.5094202, -0.5943501, 2.255911, 0, 0, 0, 1, 1,
0.515714, -1.593969, 3.473703, 0, 0, 0, 1, 1,
0.515761, -0.2004283, 1.361164, 0, 0, 0, 1, 1,
0.5164749, -0.7906467, 3.920134, 1, 1, 1, 1, 1,
0.5214473, 0.9593603, -1.472044, 1, 1, 1, 1, 1,
0.5214894, -0.9694969, 2.64461, 1, 1, 1, 1, 1,
0.5262166, -0.2838331, 1.133631, 1, 1, 1, 1, 1,
0.5265359, -0.5816133, 3.050071, 1, 1, 1, 1, 1,
0.5272498, 0.6291008, 0.8159685, 1, 1, 1, 1, 1,
0.5292103, 0.7523295, 1.513132, 1, 1, 1, 1, 1,
0.5378315, -0.544012, 2.212655, 1, 1, 1, 1, 1,
0.539288, 0.3828872, 1.574157, 1, 1, 1, 1, 1,
0.5447693, -0.5388432, 3.212216, 1, 1, 1, 1, 1,
0.5510401, 1.090703, 0.4231617, 1, 1, 1, 1, 1,
0.5541596, -3.302468, 2.082251, 1, 1, 1, 1, 1,
0.5612851, 1.166194, 0.4657761, 1, 1, 1, 1, 1,
0.5613272, 0.09271822, 2.24471, 1, 1, 1, 1, 1,
0.563292, 0.2572193, 2.235387, 1, 1, 1, 1, 1,
0.571336, -0.01415974, 1.007886, 0, 0, 1, 1, 1,
0.572308, 0.254439, 2.618879, 1, 0, 0, 1, 1,
0.5733076, -0.3301727, 1.989534, 1, 0, 0, 1, 1,
0.5770199, -0.4034022, 2.599243, 1, 0, 0, 1, 1,
0.5795472, 0.02221513, 1.770928, 1, 0, 0, 1, 1,
0.5816138, 0.678062, -0.0609345, 1, 0, 0, 1, 1,
0.5891545, -1.392403, 2.91593, 0, 0, 0, 1, 1,
0.5892736, 0.01179383, 1.10794, 0, 0, 0, 1, 1,
0.5908937, 2.73935, 0.4908784, 0, 0, 0, 1, 1,
0.598676, -0.3500233, 1.64221, 0, 0, 0, 1, 1,
0.599063, -1.673684, 3.141759, 0, 0, 0, 1, 1,
0.6008391, -0.8614162, 3.387569, 0, 0, 0, 1, 1,
0.608789, -0.9823138, 2.806722, 0, 0, 0, 1, 1,
0.6096372, -0.9371988, 2.007637, 1, 1, 1, 1, 1,
0.6159669, 1.223124, -0.4331492, 1, 1, 1, 1, 1,
0.6177416, -0.1021735, 0.511837, 1, 1, 1, 1, 1,
0.6183339, 0.6302238, 0.9380439, 1, 1, 1, 1, 1,
0.6223423, -1.058509, 2.183175, 1, 1, 1, 1, 1,
0.6229274, -1.503494, 3.66693, 1, 1, 1, 1, 1,
0.6365002, 0.9497995, 0.02645189, 1, 1, 1, 1, 1,
0.6370561, -1.476258, 1.338853, 1, 1, 1, 1, 1,
0.6428338, 2.701204, -0.09464204, 1, 1, 1, 1, 1,
0.6456434, -0.5489731, 3.553973, 1, 1, 1, 1, 1,
0.6467571, -0.189194, 2.697589, 1, 1, 1, 1, 1,
0.6517262, -0.9062257, 1.597507, 1, 1, 1, 1, 1,
0.6557087, 0.3243334, 0.5661772, 1, 1, 1, 1, 1,
0.6564463, 0.8791193, 1.367804, 1, 1, 1, 1, 1,
0.6602474, 0.6786431, 1.911788, 1, 1, 1, 1, 1,
0.6629568, -0.6689587, 1.372601, 0, 0, 1, 1, 1,
0.6644464, -0.3254393, 2.330784, 1, 0, 0, 1, 1,
0.6658025, 0.8728555, 1.784132, 1, 0, 0, 1, 1,
0.6793637, 0.3075499, 2.393591, 1, 0, 0, 1, 1,
0.6794706, -0.09530105, -0.808319, 1, 0, 0, 1, 1,
0.6802949, -0.4505039, 1.878122, 1, 0, 0, 1, 1,
0.685168, 1.843829, -1.105076, 0, 0, 0, 1, 1,
0.6892083, -0.7799503, 1.640556, 0, 0, 0, 1, 1,
0.6923511, -1.275108, 2.34566, 0, 0, 0, 1, 1,
0.69586, -0.4424222, 1.607983, 0, 0, 0, 1, 1,
0.6967987, 0.1223076, 0.1749036, 0, 0, 0, 1, 1,
0.7012721, 0.2271985, 0.0618028, 0, 0, 0, 1, 1,
0.7078209, -0.5907101, 2.935274, 0, 0, 0, 1, 1,
0.7146685, 1.026225, 1.295321, 1, 1, 1, 1, 1,
0.7160197, -1.496765, 3.560011, 1, 1, 1, 1, 1,
0.7162027, -1.234047, 3.155447, 1, 1, 1, 1, 1,
0.7221435, -0.8131722, 2.818775, 1, 1, 1, 1, 1,
0.7236298, 0.6438141, 0.11408, 1, 1, 1, 1, 1,
0.7244266, 0.03928751, 1.956035, 1, 1, 1, 1, 1,
0.7457813, 2.2841, 1.513566, 1, 1, 1, 1, 1,
0.7480697, 0.5013073, 2.177831, 1, 1, 1, 1, 1,
0.7484049, -2.141143, 1.929646, 1, 1, 1, 1, 1,
0.7487295, -0.8141187, 2.011533, 1, 1, 1, 1, 1,
0.7554924, -0.9571283, 5.782993, 1, 1, 1, 1, 1,
0.7633246, 2.132392, 1.141005, 1, 1, 1, 1, 1,
0.7659997, 0.09439341, 0.4000729, 1, 1, 1, 1, 1,
0.7663189, 0.9971199, 1.113954, 1, 1, 1, 1, 1,
0.7684587, -1.507353, 4.061309, 1, 1, 1, 1, 1,
0.7686657, 0.977906, -0.02680636, 0, 0, 1, 1, 1,
0.7804822, -1.432017, 0.9010296, 1, 0, 0, 1, 1,
0.7938997, 0.7831565, 1.861206, 1, 0, 0, 1, 1,
0.8104912, 0.9101222, 0.3935528, 1, 0, 0, 1, 1,
0.8117241, 0.2360428, 0.8376899, 1, 0, 0, 1, 1,
0.8153483, -2.179975, 3.762053, 1, 0, 0, 1, 1,
0.8153633, 1.840793, -0.6017276, 0, 0, 0, 1, 1,
0.8290339, -1.453368, 3.925582, 0, 0, 0, 1, 1,
0.8290755, -0.6643658, 1.178266, 0, 0, 0, 1, 1,
0.8293896, 1.789909, 1.360311, 0, 0, 0, 1, 1,
0.8301489, 0.02614088, 0.7193393, 0, 0, 0, 1, 1,
0.8324184, 2.19192, 0.7903894, 0, 0, 0, 1, 1,
0.832518, -0.8120806, 4.411476, 0, 0, 0, 1, 1,
0.8353638, 0.6005699, -0.186809, 1, 1, 1, 1, 1,
0.8376295, -1.302648, 2.373249, 1, 1, 1, 1, 1,
0.8421054, -0.5497112, 1.222335, 1, 1, 1, 1, 1,
0.8427744, -0.5108953, 0.677628, 1, 1, 1, 1, 1,
0.8583019, 0.7803121, 1.576926, 1, 1, 1, 1, 1,
0.8640472, -0.07322547, 2.49734, 1, 1, 1, 1, 1,
0.8644048, -0.7606167, 0.2538131, 1, 1, 1, 1, 1,
0.8690558, -0.1142987, 1.001842, 1, 1, 1, 1, 1,
0.8729736, -0.06568397, 0.5364744, 1, 1, 1, 1, 1,
0.8750347, 1.880926, -1.276871, 1, 1, 1, 1, 1,
0.8761291, -0.3876111, 1.891195, 1, 1, 1, 1, 1,
0.8796008, 0.2267295, -0.06539142, 1, 1, 1, 1, 1,
0.884563, -0.4041123, 2.309466, 1, 1, 1, 1, 1,
0.8898481, -1.302367, 2.426261, 1, 1, 1, 1, 1,
0.8949217, 0.4415032, 1.440547, 1, 1, 1, 1, 1,
0.8992201, -0.07718068, 1.660401, 0, 0, 1, 1, 1,
0.9020494, -1.596523, 2.012398, 1, 0, 0, 1, 1,
0.9029467, 0.1825109, 1.489698, 1, 0, 0, 1, 1,
0.9032274, -2.580604, 2.723365, 1, 0, 0, 1, 1,
0.9066347, -1.712618, 2.08093, 1, 0, 0, 1, 1,
0.9094293, -1.696186, 2.670546, 1, 0, 0, 1, 1,
0.9108219, 0.6705431, 2.497114, 0, 0, 0, 1, 1,
0.9125734, 0.1241627, 1.244849, 0, 0, 0, 1, 1,
0.9353008, -1.258696, 2.676521, 0, 0, 0, 1, 1,
0.9405776, 1.025028, 1.179462, 0, 0, 0, 1, 1,
0.9457723, -1.890515, 4.722671, 0, 0, 0, 1, 1,
0.9462912, 1.228425, 1.002699, 0, 0, 0, 1, 1,
0.9696645, 0.4654132, 1.121863, 0, 0, 0, 1, 1,
0.9711031, -2.297267, 2.939629, 1, 1, 1, 1, 1,
0.9866945, -0.1298766, 2.446368, 1, 1, 1, 1, 1,
0.9934149, -0.8630921, 2.059701, 1, 1, 1, 1, 1,
0.9938487, -1.451522, 2.802293, 1, 1, 1, 1, 1,
0.9946416, 0.3112576, 2.458965, 1, 1, 1, 1, 1,
1.003101, 0.06683145, 1.153133, 1, 1, 1, 1, 1,
1.007739, -1.401559, 2.900584, 1, 1, 1, 1, 1,
1.013975, 0.6075019, 0.4314313, 1, 1, 1, 1, 1,
1.014496, 0.4258512, 0.0186521, 1, 1, 1, 1, 1,
1.023344, -0.5370883, 0.3382618, 1, 1, 1, 1, 1,
1.024565, -1.04359, 0.7134936, 1, 1, 1, 1, 1,
1.024688, -1.832901, 0.7236578, 1, 1, 1, 1, 1,
1.029114, -0.3638013, 1.605554, 1, 1, 1, 1, 1,
1.029131, -0.2608184, 3.274514, 1, 1, 1, 1, 1,
1.033444, -0.2445008, 2.026228, 1, 1, 1, 1, 1,
1.039352, 0.2348953, 1.359468, 0, 0, 1, 1, 1,
1.051375, 0.6116951, 0.95141, 1, 0, 0, 1, 1,
1.061015, 0.7723032, 1.548045, 1, 0, 0, 1, 1,
1.06279, -0.109661, 2.014365, 1, 0, 0, 1, 1,
1.07031, 1.372686, -0.452821, 1, 0, 0, 1, 1,
1.073835, 0.8219555, 1.527574, 1, 0, 0, 1, 1,
1.076005, 1.696181, 0.4295759, 0, 0, 0, 1, 1,
1.077839, -0.334139, 1.455607, 0, 0, 0, 1, 1,
1.085856, 0.07787141, 0.2057144, 0, 0, 0, 1, 1,
1.0931, 0.9685786, 1.652562, 0, 0, 0, 1, 1,
1.102838, 1.56752, -0.9827804, 0, 0, 0, 1, 1,
1.103252, 0.6454648, 1.460556, 0, 0, 0, 1, 1,
1.105334, 0.3576464, 2.132163, 0, 0, 0, 1, 1,
1.113211, 0.9137421, -0.01392258, 1, 1, 1, 1, 1,
1.119393, 0.3527747, -0.6190775, 1, 1, 1, 1, 1,
1.127198, -1.048608, 2.728677, 1, 1, 1, 1, 1,
1.127408, 0.3125153, 1.353254, 1, 1, 1, 1, 1,
1.128728, 0.9445542, 0.04148528, 1, 1, 1, 1, 1,
1.138968, 1.12191, 1.65573, 1, 1, 1, 1, 1,
1.140194, -1.952046, 1.443562, 1, 1, 1, 1, 1,
1.151243, 1.79834, 0.9877753, 1, 1, 1, 1, 1,
1.153382, -0.5117786, 1.460505, 1, 1, 1, 1, 1,
1.159513, 0.7614452, 1.956425, 1, 1, 1, 1, 1,
1.16429, 1.079971, 0.382739, 1, 1, 1, 1, 1,
1.16596, 0.06255876, 2.457293, 1, 1, 1, 1, 1,
1.16613, -0.1659198, 1.659004, 1, 1, 1, 1, 1,
1.172028, 0.3591203, 0.7915472, 1, 1, 1, 1, 1,
1.17697, 2.557881, -0.2501241, 1, 1, 1, 1, 1,
1.181888, 0.5925554, 3.03107, 0, 0, 1, 1, 1,
1.184248, -0.01567344, 1.184021, 1, 0, 0, 1, 1,
1.184904, 0.3101939, 0.8564349, 1, 0, 0, 1, 1,
1.190573, -0.8961765, 1.424894, 1, 0, 0, 1, 1,
1.196237, 0.6005828, 0.3101569, 1, 0, 0, 1, 1,
1.207426, -0.4444913, 2.998082, 1, 0, 0, 1, 1,
1.213221, -2.882021, 5.611746, 0, 0, 0, 1, 1,
1.214258, 0.1819588, 1.838455, 0, 0, 0, 1, 1,
1.22092, -1.130556, 2.042397, 0, 0, 0, 1, 1,
1.224451, 0.4750827, 3.860782, 0, 0, 0, 1, 1,
1.225345, -0.1100285, 2.405805, 0, 0, 0, 1, 1,
1.229888, -0.5622872, 2.852535, 0, 0, 0, 1, 1,
1.233357, -0.6775447, 3.047814, 0, 0, 0, 1, 1,
1.236718, 1.563856, 0.4506775, 1, 1, 1, 1, 1,
1.237543, -0.8868016, 0.9774004, 1, 1, 1, 1, 1,
1.23894, 0.395536, 1.021208, 1, 1, 1, 1, 1,
1.253193, 0.6478105, 2.359786, 1, 1, 1, 1, 1,
1.263448, 0.1937954, 0.2919955, 1, 1, 1, 1, 1,
1.266426, -1.040675, 0.4135385, 1, 1, 1, 1, 1,
1.2801, -0.5154428, 3.861067, 1, 1, 1, 1, 1,
1.284851, -0.08994911, 1.928686, 1, 1, 1, 1, 1,
1.285019, 2.006851, 0.3610461, 1, 1, 1, 1, 1,
1.291006, -0.7249599, 3.024005, 1, 1, 1, 1, 1,
1.295791, 0.1226579, 2.449113, 1, 1, 1, 1, 1,
1.305395, 1.805645, 0.9599499, 1, 1, 1, 1, 1,
1.306473, -1.100622, 1.972841, 1, 1, 1, 1, 1,
1.326463, -0.09627446, 0.5532004, 1, 1, 1, 1, 1,
1.335335, -1.459298, 2.826192, 1, 1, 1, 1, 1,
1.358752, 0.966696, 1.531518, 0, 0, 1, 1, 1,
1.361598, -2.45069, 2.086631, 1, 0, 0, 1, 1,
1.380692, 1.024501, 0.3167005, 1, 0, 0, 1, 1,
1.382767, 0.9788812, 0.2980154, 1, 0, 0, 1, 1,
1.394323, -0.05722168, 2.441586, 1, 0, 0, 1, 1,
1.398612, 0.4174781, 2.068429, 1, 0, 0, 1, 1,
1.407174, -2.97484, 3.027216, 0, 0, 0, 1, 1,
1.411666, 0.535837, 1.511439, 0, 0, 0, 1, 1,
1.41389, 0.4450827, 1.899406, 0, 0, 0, 1, 1,
1.415547, -0.3493477, 1.888835, 0, 0, 0, 1, 1,
1.416449, -0.9441555, 1.247439, 0, 0, 0, 1, 1,
1.426671, 0.7816405, 2.257559, 0, 0, 0, 1, 1,
1.428789, 1.084643, 0.1596209, 0, 0, 0, 1, 1,
1.431815, 0.4695265, 1.446405, 1, 1, 1, 1, 1,
1.441725, 1.663579, 0.364272, 1, 1, 1, 1, 1,
1.457285, -1.42665, 2.007694, 1, 1, 1, 1, 1,
1.457576, 1.082448, 1.780277, 1, 1, 1, 1, 1,
1.458385, 0.05957592, 0.6478283, 1, 1, 1, 1, 1,
1.462253, -0.901563, 1.155836, 1, 1, 1, 1, 1,
1.474105, -1.409058, 3.138733, 1, 1, 1, 1, 1,
1.483881, 0.2111783, 1.059812, 1, 1, 1, 1, 1,
1.483957, 0.7486098, -0.2394246, 1, 1, 1, 1, 1,
1.494608, -2.768853, 1.65371, 1, 1, 1, 1, 1,
1.505071, -0.6392983, 3.685613, 1, 1, 1, 1, 1,
1.510126, 2.514378, 0.271189, 1, 1, 1, 1, 1,
1.51678, -0.5686277, 2.652612, 1, 1, 1, 1, 1,
1.520936, 0.6723371, 2.391579, 1, 1, 1, 1, 1,
1.522931, 0.218226, 2.392722, 1, 1, 1, 1, 1,
1.527972, 0.8994715, 0.9345703, 0, 0, 1, 1, 1,
1.533084, 0.7074016, 1.171322, 1, 0, 0, 1, 1,
1.540148, 1.127853, 0.6769795, 1, 0, 0, 1, 1,
1.54025, 0.842399, 0.253151, 1, 0, 0, 1, 1,
1.542062, 2.388853, 0.9707427, 1, 0, 0, 1, 1,
1.547273, 0.957033, 1.594212, 1, 0, 0, 1, 1,
1.555917, -0.2185686, 2.646277, 0, 0, 0, 1, 1,
1.565489, 0.1309123, 2.20398, 0, 0, 0, 1, 1,
1.571222, -0.7767571, 1.297583, 0, 0, 0, 1, 1,
1.573349, 0.3829094, 0.7823991, 0, 0, 0, 1, 1,
1.575556, -1.444179, 1.861182, 0, 0, 0, 1, 1,
1.589625, -0.4728908, 2.250773, 0, 0, 0, 1, 1,
1.591031, 2.030356, 0.9868259, 0, 0, 0, 1, 1,
1.594268, 1.512887, 2.592352, 1, 1, 1, 1, 1,
1.598178, -1.123056, 2.258324, 1, 1, 1, 1, 1,
1.599685, 2.832929, 0.02540529, 1, 1, 1, 1, 1,
1.601865, -0.635573, 3.135981, 1, 1, 1, 1, 1,
1.609043, 0.2476853, 1.477478, 1, 1, 1, 1, 1,
1.609465, 0.4009993, 0.004289611, 1, 1, 1, 1, 1,
1.617027, -1.159644, 1.684666, 1, 1, 1, 1, 1,
1.620743, 0.8601755, 2.580362, 1, 1, 1, 1, 1,
1.633904, 0.7129224, 1.853034, 1, 1, 1, 1, 1,
1.637946, -0.5815725, 0.6832414, 1, 1, 1, 1, 1,
1.639131, 2.738416, -0.09187958, 1, 1, 1, 1, 1,
1.645393, -0.05719506, 1.418368, 1, 1, 1, 1, 1,
1.655188, 1.39108, 0.3528794, 1, 1, 1, 1, 1,
1.660646, -0.1869656, 1.911628, 1, 1, 1, 1, 1,
1.661897, 1.48608, 1.705433, 1, 1, 1, 1, 1,
1.671728, 0.6975855, 2.949387, 0, 0, 1, 1, 1,
1.673782, 0.9336798, 1.378015, 1, 0, 0, 1, 1,
1.675435, 0.855464, 0.8209988, 1, 0, 0, 1, 1,
1.676408, 0.1728546, 1.703549, 1, 0, 0, 1, 1,
1.676471, -0.2004937, 2.240686, 1, 0, 0, 1, 1,
1.688281, -0.2040107, 1.39732, 1, 0, 0, 1, 1,
1.689985, 0.6157746, 0.283035, 0, 0, 0, 1, 1,
1.694134, 2.178097, 0.5540625, 0, 0, 0, 1, 1,
1.698354, -1.504641, 1.771092, 0, 0, 0, 1, 1,
1.721047, 0.1213663, 1.979342, 0, 0, 0, 1, 1,
1.730786, 0.9507213, -0.3113367, 0, 0, 0, 1, 1,
1.738417, -0.1203599, 2.237546, 0, 0, 0, 1, 1,
1.741852, -1.973453, 1.469885, 0, 0, 0, 1, 1,
1.744099, 0.9284997, 2.314791, 1, 1, 1, 1, 1,
1.782331, -1.062486, 0.2922309, 1, 1, 1, 1, 1,
1.784282, -0.08545561, 0.4487651, 1, 1, 1, 1, 1,
1.785386, -0.2035399, 1.326157, 1, 1, 1, 1, 1,
1.793339, -0.4227483, -0.3136012, 1, 1, 1, 1, 1,
1.855091, 1.16962, 0.8676978, 1, 1, 1, 1, 1,
1.879914, 1.204634, 1.491154, 1, 1, 1, 1, 1,
1.895148, 0.1383456, 3.122496, 1, 1, 1, 1, 1,
1.901444, -0.1587863, 1.779947, 1, 1, 1, 1, 1,
1.902021, -1.247449, 1.789554, 1, 1, 1, 1, 1,
1.940681, -0.02712894, 1.478468, 1, 1, 1, 1, 1,
1.946342, -0.6998754, 1.879106, 1, 1, 1, 1, 1,
1.976639, -0.2504969, 1.408245, 1, 1, 1, 1, 1,
2.007674, -0.806042, 0.7946547, 1, 1, 1, 1, 1,
2.013472, -0.09168214, 2.268418, 1, 1, 1, 1, 1,
2.014214, -0.7892923, 2.84493, 0, 0, 1, 1, 1,
2.026925, 0.5195208, 2.09241, 1, 0, 0, 1, 1,
2.042103, 0.2169778, -0.3761352, 1, 0, 0, 1, 1,
2.051476, 0.4924393, -1.025406, 1, 0, 0, 1, 1,
2.138491, -0.5419878, 2.636597, 1, 0, 0, 1, 1,
2.160572, 0.2641115, 0.4445294, 1, 0, 0, 1, 1,
2.177145, -0.2779135, 2.125469, 0, 0, 0, 1, 1,
2.18442, -0.1020634, 0.6203418, 0, 0, 0, 1, 1,
2.206235, -0.3894003, 1.190464, 0, 0, 0, 1, 1,
2.206407, 0.4877772, 1.623682, 0, 0, 0, 1, 1,
2.238687, -1.223495, 3.710249, 0, 0, 0, 1, 1,
2.244509, -0.2431901, 2.843885, 0, 0, 0, 1, 1,
2.272613, -0.6266947, 2.263859, 0, 0, 0, 1, 1,
2.310408, 1.615014, 0.598502, 1, 1, 1, 1, 1,
2.394114, 0.9498132, -0.9618836, 1, 1, 1, 1, 1,
2.424409, 0.005452807, 1.98417, 1, 1, 1, 1, 1,
2.731189, 0.2216865, 2.581985, 1, 1, 1, 1, 1,
2.833522, -0.6556754, 2.409642, 1, 1, 1, 1, 1,
2.870008, -0.3754176, 1.617624, 1, 1, 1, 1, 1,
3.231004, 0.2440267, 1.849247, 1, 1, 1, 1, 1
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
var radius = 9.539622;
var distance = 33.50752;
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
mvMatrix.translate( 0.08662009, 0.234769, -0.4566836 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.50752);
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
