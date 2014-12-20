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
-3.01882, -0.5178174, -1.754461, 1, 0, 0, 1,
-2.90794, -0.409636, -1.945405, 1, 0.007843138, 0, 1,
-2.79318, -0.6766462, -2.546986, 1, 0.01176471, 0, 1,
-2.694319, -3.498739, -2.841639, 1, 0.01960784, 0, 1,
-2.62168, 1.153286, -0.3639951, 1, 0.02352941, 0, 1,
-2.616668, 0.2847733, -0.3332266, 1, 0.03137255, 0, 1,
-2.616613, -0.9383903, -1.447156, 1, 0.03529412, 0, 1,
-2.572596, 0.03503242, -1.881808, 1, 0.04313726, 0, 1,
-2.571039, -1.121637, -1.832434, 1, 0.04705882, 0, 1,
-2.464873, -0.3789723, -1.670803, 1, 0.05490196, 0, 1,
-2.34888, 0.3034824, -0.8152319, 1, 0.05882353, 0, 1,
-2.294323, 0.5224621, -2.483708, 1, 0.06666667, 0, 1,
-2.24499, 1.948949, -0.6329477, 1, 0.07058824, 0, 1,
-2.244561, -0.5129601, -0.4725108, 1, 0.07843138, 0, 1,
-2.235553, -2.225053, -1.37714, 1, 0.08235294, 0, 1,
-2.219104, -0.7982922, -1.595878, 1, 0.09019608, 0, 1,
-2.203347, -0.08474801, -3.100489, 1, 0.09411765, 0, 1,
-2.201735, -0.9126214, -1.413943, 1, 0.1019608, 0, 1,
-2.19104, 0.3986934, -1.901337, 1, 0.1098039, 0, 1,
-2.130595, 0.01907028, -0.3936196, 1, 0.1137255, 0, 1,
-2.103367, -0.05789192, -1.940077, 1, 0.1215686, 0, 1,
-2.100765, -0.2470811, -0.6826006, 1, 0.1254902, 0, 1,
-2.024665, 0.7250655, -2.304743, 1, 0.1333333, 0, 1,
-1.993174, -0.3793263, -0.7715316, 1, 0.1372549, 0, 1,
-1.9814, 0.9807118, -0.817011, 1, 0.145098, 0, 1,
-1.953645, -0.2858113, -1.496519, 1, 0.1490196, 0, 1,
-1.946565, 1.32072, 0.2895435, 1, 0.1568628, 0, 1,
-1.946517, -1.183071, -0.03620869, 1, 0.1607843, 0, 1,
-1.917198, 0.3389294, -0.7023323, 1, 0.1686275, 0, 1,
-1.884137, -0.5651162, -2.566858, 1, 0.172549, 0, 1,
-1.825437, -0.511699, -0.4864067, 1, 0.1803922, 0, 1,
-1.825218, -1.384141, -2.167945, 1, 0.1843137, 0, 1,
-1.818855, 0.2194342, -1.458778, 1, 0.1921569, 0, 1,
-1.815488, -0.8765087, -1.083945, 1, 0.1960784, 0, 1,
-1.809946, 0.1265304, -2.956894, 1, 0.2039216, 0, 1,
-1.790373, 0.2858564, -2.480506, 1, 0.2117647, 0, 1,
-1.790267, 1.246179, 0.1488753, 1, 0.2156863, 0, 1,
-1.761952, -1.492782, -1.348313, 1, 0.2235294, 0, 1,
-1.757646, 0.0186871, -3.091541, 1, 0.227451, 0, 1,
-1.751474, 2.324411, 0.06557557, 1, 0.2352941, 0, 1,
-1.748095, -0.2551733, -2.776834, 1, 0.2392157, 0, 1,
-1.743192, 0.858954, -0.2398336, 1, 0.2470588, 0, 1,
-1.736219, 0.8436224, -1.608049, 1, 0.2509804, 0, 1,
-1.718697, -0.7429434, -1.82621, 1, 0.2588235, 0, 1,
-1.71771, 1.39028, -1.496636, 1, 0.2627451, 0, 1,
-1.707046, 0.379539, -1.340365, 1, 0.2705882, 0, 1,
-1.700105, 0.1429368, -1.250397, 1, 0.2745098, 0, 1,
-1.696169, -0.2529094, -2.838567, 1, 0.282353, 0, 1,
-1.690068, 0.2294641, -2.709914, 1, 0.2862745, 0, 1,
-1.683902, 0.7164473, -2.448078, 1, 0.2941177, 0, 1,
-1.677649, 0.6592739, -2.962803, 1, 0.3019608, 0, 1,
-1.673934, 0.7543069, -1.21953, 1, 0.3058824, 0, 1,
-1.660481, -0.5578079, -0.8747122, 1, 0.3137255, 0, 1,
-1.657723, 0.622637, 0.002768955, 1, 0.3176471, 0, 1,
-1.654649, -2.049928, -1.286463, 1, 0.3254902, 0, 1,
-1.651406, -0.3325147, -0.4601491, 1, 0.3294118, 0, 1,
-1.639504, 0.7050514, -1.575426, 1, 0.3372549, 0, 1,
-1.631238, -1.027339, -1.794535, 1, 0.3411765, 0, 1,
-1.626407, 0.4982026, -1.451603, 1, 0.3490196, 0, 1,
-1.613352, -0.5006526, -0.7724833, 1, 0.3529412, 0, 1,
-1.604843, 0.722845, -4.478089, 1, 0.3607843, 0, 1,
-1.601628, 1.177165, -0.3725732, 1, 0.3647059, 0, 1,
-1.59823, 1.714192, -1.156242, 1, 0.372549, 0, 1,
-1.589312, -0.4671394, -2.374816, 1, 0.3764706, 0, 1,
-1.585322, 0.4597876, -2.136485, 1, 0.3843137, 0, 1,
-1.579439, 1.60586, -1.710859, 1, 0.3882353, 0, 1,
-1.540211, 1.054901, -0.5532548, 1, 0.3960784, 0, 1,
-1.536923, -1.979051, -1.159185, 1, 0.4039216, 0, 1,
-1.533751, 0.3109914, -1.604756, 1, 0.4078431, 0, 1,
-1.530843, 1.480334, 0.06673993, 1, 0.4156863, 0, 1,
-1.505042, 1.050286, 1.173478, 1, 0.4196078, 0, 1,
-1.499371, 0.3537578, -2.316048, 1, 0.427451, 0, 1,
-1.484711, -2.86634, -2.443267, 1, 0.4313726, 0, 1,
-1.477812, -0.06335793, 0.4039865, 1, 0.4392157, 0, 1,
-1.47521, -0.5106807, -1.039469, 1, 0.4431373, 0, 1,
-1.452038, -0.2166221, -0.2632543, 1, 0.4509804, 0, 1,
-1.448799, 0.3383643, -0.1098936, 1, 0.454902, 0, 1,
-1.429634, -2.973701, -1.944045, 1, 0.4627451, 0, 1,
-1.427051, -0.1584188, -3.077269, 1, 0.4666667, 0, 1,
-1.389028, -1.247317, -2.709918, 1, 0.4745098, 0, 1,
-1.38642, -1.043609, -3.222533, 1, 0.4784314, 0, 1,
-1.384932, -0.7442682, -1.337541, 1, 0.4862745, 0, 1,
-1.381822, -0.8533309, -1.161496, 1, 0.4901961, 0, 1,
-1.379427, -0.8435478, -0.5763488, 1, 0.4980392, 0, 1,
-1.37576, 0.4034652, -1.556513, 1, 0.5058824, 0, 1,
-1.368387, -1.520975, -2.751837, 1, 0.509804, 0, 1,
-1.362858, -0.3551157, -1.569055, 1, 0.5176471, 0, 1,
-1.361444, 0.9519634, -1.44754, 1, 0.5215687, 0, 1,
-1.358704, 0.4435474, -1.155535, 1, 0.5294118, 0, 1,
-1.356809, 0.379763, -1.353093, 1, 0.5333334, 0, 1,
-1.344712, 1.109963, -2.04335, 1, 0.5411765, 0, 1,
-1.342135, 0.4858683, -1.246894, 1, 0.5450981, 0, 1,
-1.339413, 0.2478465, -2.117007, 1, 0.5529412, 0, 1,
-1.336651, -0.1924134, -0.3242441, 1, 0.5568628, 0, 1,
-1.335022, -0.3189952, -0.2675467, 1, 0.5647059, 0, 1,
-1.315974, -0.9377979, -3.176194, 1, 0.5686275, 0, 1,
-1.311721, 0.3737771, 0.6165279, 1, 0.5764706, 0, 1,
-1.311297, 0.9566439, 0.6415223, 1, 0.5803922, 0, 1,
-1.307798, 0.003858813, -2.693767, 1, 0.5882353, 0, 1,
-1.29815, -0.5934221, -1.532278, 1, 0.5921569, 0, 1,
-1.296774, -0.272004, -1.716173, 1, 0.6, 0, 1,
-1.291637, -0.3286815, -3.216477, 1, 0.6078432, 0, 1,
-1.284085, 1.081091, -1.085318, 1, 0.6117647, 0, 1,
-1.275217, -0.5910527, -4.095045, 1, 0.6196079, 0, 1,
-1.274934, -0.3452248, -1.795645, 1, 0.6235294, 0, 1,
-1.253535, 1.720659, 0.2410566, 1, 0.6313726, 0, 1,
-1.250834, 0.6961218, -0.8520509, 1, 0.6352941, 0, 1,
-1.250201, 0.04962073, -0.8779254, 1, 0.6431373, 0, 1,
-1.250103, -0.7596082, -4.001492, 1, 0.6470588, 0, 1,
-1.247276, -1.785331, -3.112379, 1, 0.654902, 0, 1,
-1.245124, -1.249435, -3.250034, 1, 0.6588235, 0, 1,
-1.243731, -0.1066979, -1.99196, 1, 0.6666667, 0, 1,
-1.24216, -1.362541, -2.427971, 1, 0.6705883, 0, 1,
-1.230671, 1.141464, -0.865751, 1, 0.6784314, 0, 1,
-1.224251, -0.5283048, -0.8812007, 1, 0.682353, 0, 1,
-1.210937, -0.9787565, -1.670203, 1, 0.6901961, 0, 1,
-1.200776, 1.320793, 1.185796, 1, 0.6941177, 0, 1,
-1.191509, 1.063286, -3.066604, 1, 0.7019608, 0, 1,
-1.190457, 0.5588718, -0.7178618, 1, 0.7098039, 0, 1,
-1.188883, -1.230988, -1.92975, 1, 0.7137255, 0, 1,
-1.188558, 1.163281, 1.546863, 1, 0.7215686, 0, 1,
-1.186613, -0.9643905, -1.309616, 1, 0.7254902, 0, 1,
-1.184484, -0.1967481, 0.7326093, 1, 0.7333333, 0, 1,
-1.18379, 0.07146796, -2.830286, 1, 0.7372549, 0, 1,
-1.182969, 0.483196, -2.675493, 1, 0.7450981, 0, 1,
-1.176558, -0.9798889, -1.924934, 1, 0.7490196, 0, 1,
-1.175093, 0.09064607, -1.972172, 1, 0.7568628, 0, 1,
-1.175043, -1.443207, -1.750075, 1, 0.7607843, 0, 1,
-1.169831, 0.4058404, -0.2002599, 1, 0.7686275, 0, 1,
-1.1697, 1.977065, -1.24435, 1, 0.772549, 0, 1,
-1.167507, -0.1344705, -3.000812, 1, 0.7803922, 0, 1,
-1.160688, 1.705516, -0.1304227, 1, 0.7843137, 0, 1,
-1.14796, 1.268076, -4.220542, 1, 0.7921569, 0, 1,
-1.145648, -0.8345843, -3.416004, 1, 0.7960784, 0, 1,
-1.145456, 0.3175522, 0.1018457, 1, 0.8039216, 0, 1,
-1.141129, -0.02061154, -0.5688094, 1, 0.8117647, 0, 1,
-1.137138, -1.622611, -0.2633396, 1, 0.8156863, 0, 1,
-1.133767, 0.7594592, -1.111238, 1, 0.8235294, 0, 1,
-1.129252, -1.103112, -2.65936, 1, 0.827451, 0, 1,
-1.120991, -0.3059917, -1.842418, 1, 0.8352941, 0, 1,
-1.118874, 1.069576, -0.4825259, 1, 0.8392157, 0, 1,
-1.117234, 0.3161844, -1.367705, 1, 0.8470588, 0, 1,
-1.116069, -0.07531049, -1.092555, 1, 0.8509804, 0, 1,
-1.105849, 1.570196, -1.839712, 1, 0.8588235, 0, 1,
-1.090017, 0.2524332, -2.442812, 1, 0.8627451, 0, 1,
-1.081948, 0.3010117, -2.879893, 1, 0.8705882, 0, 1,
-1.078531, -0.2158054, -1.927754, 1, 0.8745098, 0, 1,
-1.070904, 1.07769, -2.223361, 1, 0.8823529, 0, 1,
-1.066665, 0.5317333, -0.7342755, 1, 0.8862745, 0, 1,
-1.052792, -0.1724459, -2.79814, 1, 0.8941177, 0, 1,
-1.050499, -0.05737106, -1.995255, 1, 0.8980392, 0, 1,
-1.044561, 1.811595, 0.1123153, 1, 0.9058824, 0, 1,
-1.043227, 0.9089184, -1.615285, 1, 0.9137255, 0, 1,
-1.035631, 0.8418173, 0.772139, 1, 0.9176471, 0, 1,
-1.034466, 0.06572372, -1.809154, 1, 0.9254902, 0, 1,
-1.031074, -0.4437906, -1.536341, 1, 0.9294118, 0, 1,
-1.025774, 0.02409589, -2.438177, 1, 0.9372549, 0, 1,
-1.012537, -0.02406433, -1.678342, 1, 0.9411765, 0, 1,
-1.011556, 0.08047824, -1.582802, 1, 0.9490196, 0, 1,
-1.011134, -0.4977368, -1.155385, 1, 0.9529412, 0, 1,
-0.9926252, -1.248645, -1.100803, 1, 0.9607843, 0, 1,
-0.98177, 1.536557, -2.638929, 1, 0.9647059, 0, 1,
-0.9775296, -0.4707053, -1.828722, 1, 0.972549, 0, 1,
-0.9746749, -0.6420833, -2.757777, 1, 0.9764706, 0, 1,
-0.971203, -1.102401, -4.789914, 1, 0.9843137, 0, 1,
-0.9666475, 1.303954, -0.4437239, 1, 0.9882353, 0, 1,
-0.9588359, -0.4060802, -1.243091, 1, 0.9960784, 0, 1,
-0.9501157, 0.416214, -1.747155, 0.9960784, 1, 0, 1,
-0.9475308, -1.159538, -2.585491, 0.9921569, 1, 0, 1,
-0.9458422, -0.5553397, -2.150078, 0.9843137, 1, 0, 1,
-0.9392028, 0.1443086, -2.785498, 0.9803922, 1, 0, 1,
-0.9353366, 1.059763, -0.3502074, 0.972549, 1, 0, 1,
-0.9338987, 1.226316, -2.362965, 0.9686275, 1, 0, 1,
-0.9320813, 0.4703006, 0.09312674, 0.9607843, 1, 0, 1,
-0.9314081, 0.6545502, -0.003825218, 0.9568627, 1, 0, 1,
-0.9287122, -0.886281, -0.896194, 0.9490196, 1, 0, 1,
-0.9160826, 0.7767448, -0.68353, 0.945098, 1, 0, 1,
-0.909638, 0.246661, -1.556179, 0.9372549, 1, 0, 1,
-0.9076119, 0.4833142, -0.4298991, 0.9333333, 1, 0, 1,
-0.9060547, -1.620028, -2.436088, 0.9254902, 1, 0, 1,
-0.8989124, 0.3594545, -2.804052, 0.9215686, 1, 0, 1,
-0.8983261, 0.3009608, -1.270612, 0.9137255, 1, 0, 1,
-0.8927951, 0.1326332, -1.561075, 0.9098039, 1, 0, 1,
-0.8897515, -0.7087532, -1.001852, 0.9019608, 1, 0, 1,
-0.8771925, 0.1648196, -2.988264, 0.8941177, 1, 0, 1,
-0.8735821, 0.1979329, -2.222471, 0.8901961, 1, 0, 1,
-0.872604, 1.234473, -1.54474, 0.8823529, 1, 0, 1,
-0.8625932, 2.971455, -0.8698804, 0.8784314, 1, 0, 1,
-0.8557647, -0.1168555, -0.8542659, 0.8705882, 1, 0, 1,
-0.8486391, -1.624379, -2.996422, 0.8666667, 1, 0, 1,
-0.8473862, 0.133844, -1.971323, 0.8588235, 1, 0, 1,
-0.845795, 1.249546, -0.637952, 0.854902, 1, 0, 1,
-0.8444592, 1.78986, 0.5715052, 0.8470588, 1, 0, 1,
-0.8425463, -0.01320575, -2.737262, 0.8431373, 1, 0, 1,
-0.8409092, 1.881024, -1.007557, 0.8352941, 1, 0, 1,
-0.8329683, 0.06666958, -2.452506, 0.8313726, 1, 0, 1,
-0.8276476, -0.9683089, -1.884303, 0.8235294, 1, 0, 1,
-0.8251308, 0.3607659, -1.351562, 0.8196079, 1, 0, 1,
-0.823698, 1.507088, -0.7643416, 0.8117647, 1, 0, 1,
-0.8208628, -1.738482, -3.046869, 0.8078431, 1, 0, 1,
-0.8201248, 2.817899, 1.849844, 0.8, 1, 0, 1,
-0.8175603, 0.1498234, 0.03651711, 0.7921569, 1, 0, 1,
-0.8138217, -0.6128495, -3.823345, 0.7882353, 1, 0, 1,
-0.8112696, 2.351515, -0.2324846, 0.7803922, 1, 0, 1,
-0.806513, 0.9072208, -1.133451, 0.7764706, 1, 0, 1,
-0.8024176, 0.5943623, -0.8024613, 0.7686275, 1, 0, 1,
-0.7924316, -0.4326091, 0.1321574, 0.7647059, 1, 0, 1,
-0.7911302, -0.746223, -0.5928154, 0.7568628, 1, 0, 1,
-0.7899845, -2.272966, -4.343978, 0.7529412, 1, 0, 1,
-0.7896684, 0.4346676, -1.486506, 0.7450981, 1, 0, 1,
-0.7855559, -0.8283638, -1.992426, 0.7411765, 1, 0, 1,
-0.7825269, -0.06415176, -0.9387498, 0.7333333, 1, 0, 1,
-0.7802319, 0.3985788, -2.328614, 0.7294118, 1, 0, 1,
-0.768128, -0.06130561, -1.210891, 0.7215686, 1, 0, 1,
-0.7636678, -0.8290139, -2.400905, 0.7176471, 1, 0, 1,
-0.7628484, 0.4178801, -0.3965967, 0.7098039, 1, 0, 1,
-0.7621292, -0.4629933, -0.4648454, 0.7058824, 1, 0, 1,
-0.7583681, 0.8433537, -0.9946513, 0.6980392, 1, 0, 1,
-0.7557387, 0.1052707, -1.618468, 0.6901961, 1, 0, 1,
-0.7502971, -0.520133, -0.8801245, 0.6862745, 1, 0, 1,
-0.7490069, -1.485047, -2.225538, 0.6784314, 1, 0, 1,
-0.748735, -1.946649, -3.320123, 0.6745098, 1, 0, 1,
-0.7466146, 1.17502, 0.08400288, 0.6666667, 1, 0, 1,
-0.7447148, 0.8016446, -1.659663, 0.6627451, 1, 0, 1,
-0.7445071, -1.529335, -2.841215, 0.654902, 1, 0, 1,
-0.7393759, -1.760167, -2.504541, 0.6509804, 1, 0, 1,
-0.7387327, 0.9275119, 0.09290976, 0.6431373, 1, 0, 1,
-0.7359423, 0.197856, -2.26071, 0.6392157, 1, 0, 1,
-0.7320384, -0.9953431, -2.490879, 0.6313726, 1, 0, 1,
-0.7185661, 2.027287, 0.04414855, 0.627451, 1, 0, 1,
-0.7163522, -0.3679897, -2.430862, 0.6196079, 1, 0, 1,
-0.7162777, 1.511987, -0.3796908, 0.6156863, 1, 0, 1,
-0.7138255, 1.53779, -1.123624, 0.6078432, 1, 0, 1,
-0.7121885, 0.5869817, -2.305954, 0.6039216, 1, 0, 1,
-0.7118657, 1.087035, 1.169183, 0.5960785, 1, 0, 1,
-0.7114941, 0.6719013, -0.6490366, 0.5882353, 1, 0, 1,
-0.7100594, 1.361606, 0.302956, 0.5843138, 1, 0, 1,
-0.7030311, -0.2711485, -1.821405, 0.5764706, 1, 0, 1,
-0.700237, -0.3483921, -1.258681, 0.572549, 1, 0, 1,
-0.6808821, 1.552287, 0.6431631, 0.5647059, 1, 0, 1,
-0.6778498, 0.07679572, -1.021561, 0.5607843, 1, 0, 1,
-0.6736888, 0.1011163, -2.761464, 0.5529412, 1, 0, 1,
-0.6669579, -1.164658, -3.7351, 0.5490196, 1, 0, 1,
-0.6610572, -0.8229151, -3.20004, 0.5411765, 1, 0, 1,
-0.6576399, -0.3583622, -3.708184, 0.5372549, 1, 0, 1,
-0.6561509, -0.4118018, -1.577941, 0.5294118, 1, 0, 1,
-0.6559184, 0.8736053, -0.5475405, 0.5254902, 1, 0, 1,
-0.65473, -0.5351374, -2.280444, 0.5176471, 1, 0, 1,
-0.6441768, 1.092228, -0.9647305, 0.5137255, 1, 0, 1,
-0.6425597, -0.2186067, -2.240932, 0.5058824, 1, 0, 1,
-0.6421242, 1.162906, -1.435304, 0.5019608, 1, 0, 1,
-0.6369885, -0.6615843, -1.874929, 0.4941176, 1, 0, 1,
-0.6332477, -0.6962492, -3.968769, 0.4862745, 1, 0, 1,
-0.6269221, 1.327057, -1.382569, 0.4823529, 1, 0, 1,
-0.6231818, -0.4098413, -4.168234, 0.4745098, 1, 0, 1,
-0.6193361, 0.07484823, -2.823919, 0.4705882, 1, 0, 1,
-0.6180304, 1.113724, 0.08279549, 0.4627451, 1, 0, 1,
-0.6147068, 0.03489076, -1.375352, 0.4588235, 1, 0, 1,
-0.6118631, -0.2966596, -4.031408, 0.4509804, 1, 0, 1,
-0.6106845, 0.5140603, -1.333247, 0.4470588, 1, 0, 1,
-0.6091202, 0.574921, 0.3847461, 0.4392157, 1, 0, 1,
-0.6088288, -0.7589785, -2.892635, 0.4352941, 1, 0, 1,
-0.6043842, 1.079076, 0.9983082, 0.427451, 1, 0, 1,
-0.5983295, -0.7941716, -2.873687, 0.4235294, 1, 0, 1,
-0.5964212, -0.4776887, -2.419029, 0.4156863, 1, 0, 1,
-0.5937002, 0.0538157, -1.02834, 0.4117647, 1, 0, 1,
-0.5930808, -0.09146666, -3.653822, 0.4039216, 1, 0, 1,
-0.5877315, -0.1296235, -1.712893, 0.3960784, 1, 0, 1,
-0.5861094, -0.1438583, -1.803982, 0.3921569, 1, 0, 1,
-0.5839025, -0.5687701, -2.745319, 0.3843137, 1, 0, 1,
-0.5786883, 0.0214647, -2.336705, 0.3803922, 1, 0, 1,
-0.5720272, -0.02736079, -3.201424, 0.372549, 1, 0, 1,
-0.5698935, 1.522904, 2.55485, 0.3686275, 1, 0, 1,
-0.5697753, -0.1376335, -2.652978, 0.3607843, 1, 0, 1,
-0.5693676, -1.023646, -1.718034, 0.3568628, 1, 0, 1,
-0.5675052, 0.2568539, -1.373046, 0.3490196, 1, 0, 1,
-0.5616482, -1.918846, -3.139594, 0.345098, 1, 0, 1,
-0.5524608, 1.004893, -1.320775, 0.3372549, 1, 0, 1,
-0.5507511, 0.812501, 0.2927421, 0.3333333, 1, 0, 1,
-0.5408923, -0.637321, -2.027822, 0.3254902, 1, 0, 1,
-0.5395541, 1.13511, 0.00939025, 0.3215686, 1, 0, 1,
-0.5346497, -1.127274, -0.9195839, 0.3137255, 1, 0, 1,
-0.534386, -0.4467014, -2.40247, 0.3098039, 1, 0, 1,
-0.5334016, 1.086961, -0.4249308, 0.3019608, 1, 0, 1,
-0.5312088, -1.806275, -3.109252, 0.2941177, 1, 0, 1,
-0.5287026, -0.4325522, -2.208434, 0.2901961, 1, 0, 1,
-0.5259323, 1.740918, -0.03834619, 0.282353, 1, 0, 1,
-0.5248088, -0.1169188, -2.03598, 0.2784314, 1, 0, 1,
-0.5238773, 0.8004106, -0.9637843, 0.2705882, 1, 0, 1,
-0.5238291, -0.1358084, -2.397819, 0.2666667, 1, 0, 1,
-0.5221808, 0.1366687, -1.694766, 0.2588235, 1, 0, 1,
-0.5203507, -0.7617701, 0.1487563, 0.254902, 1, 0, 1,
-0.5176008, -0.03110092, -0.8179621, 0.2470588, 1, 0, 1,
-0.5170335, 1.258366, 1.209703, 0.2431373, 1, 0, 1,
-0.5130052, 0.02836967, -3.302837, 0.2352941, 1, 0, 1,
-0.5110943, -0.9109572, -2.514955, 0.2313726, 1, 0, 1,
-0.5098425, 0.6205798, -0.6767127, 0.2235294, 1, 0, 1,
-0.5006095, 0.7971321, -1.214103, 0.2196078, 1, 0, 1,
-0.5002031, -0.2574307, -1.886972, 0.2117647, 1, 0, 1,
-0.4995624, 2.736126, 1.339302, 0.2078431, 1, 0, 1,
-0.4976382, -0.3897609, -0.4680458, 0.2, 1, 0, 1,
-0.4948694, 1.355326, -0.02719224, 0.1921569, 1, 0, 1,
-0.4938973, 0.5345623, -0.2813272, 0.1882353, 1, 0, 1,
-0.4934203, 1.613075, -0.3808705, 0.1803922, 1, 0, 1,
-0.483779, 0.7152967, -1.754306, 0.1764706, 1, 0, 1,
-0.4809227, 0.6591195, -1.0662, 0.1686275, 1, 0, 1,
-0.4776539, -0.3058536, -2.096936, 0.1647059, 1, 0, 1,
-0.4753939, 2.059829, 0.4704308, 0.1568628, 1, 0, 1,
-0.474994, 0.1061337, -2.267655, 0.1529412, 1, 0, 1,
-0.4672132, 0.1985426, -2.368403, 0.145098, 1, 0, 1,
-0.4644995, -0.3525438, -0.4702345, 0.1411765, 1, 0, 1,
-0.4591721, 1.057186, -1.040296, 0.1333333, 1, 0, 1,
-0.4591529, 0.5123267, -1.111672, 0.1294118, 1, 0, 1,
-0.4589827, -0.6177008, -3.526034, 0.1215686, 1, 0, 1,
-0.4548908, -0.7089495, -4.776554, 0.1176471, 1, 0, 1,
-0.4536669, -0.04267063, -2.834016, 0.1098039, 1, 0, 1,
-0.4534709, -1.037542, -3.028645, 0.1058824, 1, 0, 1,
-0.4508335, 0.8275335, -1.664062, 0.09803922, 1, 0, 1,
-0.4426636, 2.294125, -1.107754, 0.09019608, 1, 0, 1,
-0.4408441, 0.2543627, -1.809297, 0.08627451, 1, 0, 1,
-0.4367041, -0.6826127, -1.814049, 0.07843138, 1, 0, 1,
-0.4316707, -0.1520965, -1.266914, 0.07450981, 1, 0, 1,
-0.4310097, -1.356919, -2.660205, 0.06666667, 1, 0, 1,
-0.4303872, 0.1101081, -2.122669, 0.0627451, 1, 0, 1,
-0.4284609, -1.471778, -2.841727, 0.05490196, 1, 0, 1,
-0.4190834, 1.210656, -1.83656, 0.05098039, 1, 0, 1,
-0.4168882, -0.2550465, -1.707222, 0.04313726, 1, 0, 1,
-0.4130586, 0.7116085, -2.21998, 0.03921569, 1, 0, 1,
-0.4108371, 0.5227724, -1.406448, 0.03137255, 1, 0, 1,
-0.4076142, -0.1496611, -0.7782959, 0.02745098, 1, 0, 1,
-0.4056933, -0.1483954, -2.366924, 0.01960784, 1, 0, 1,
-0.3923659, 0.05941705, -2.141117, 0.01568628, 1, 0, 1,
-0.3886132, -0.5660021, -1.19239, 0.007843138, 1, 0, 1,
-0.3885615, 0.5310807, -0.1337666, 0.003921569, 1, 0, 1,
-0.3864354, -0.397658, -1.239199, 0, 1, 0.003921569, 1,
-0.3836898, 0.3479343, -0.8425823, 0, 1, 0.01176471, 1,
-0.3827811, -0.234095, -2.104774, 0, 1, 0.01568628, 1,
-0.3704767, 1.498357, -0.3078014, 0, 1, 0.02352941, 1,
-0.3697302, -1.387502, -0.3778847, 0, 1, 0.02745098, 1,
-0.3628117, -1.277201, -3.564449, 0, 1, 0.03529412, 1,
-0.3608627, -0.6265971, -4.56242, 0, 1, 0.03921569, 1,
-0.3604361, -3.880572, -4.295615, 0, 1, 0.04705882, 1,
-0.356951, -0.4397137, -1.696892, 0, 1, 0.05098039, 1,
-0.3549933, -1.66869, -1.664816, 0, 1, 0.05882353, 1,
-0.3542632, 0.8911718, 0.6593378, 0, 1, 0.0627451, 1,
-0.3532265, 0.4267064, -1.239022, 0, 1, 0.07058824, 1,
-0.3517585, 0.5510817, -0.5253078, 0, 1, 0.07450981, 1,
-0.3504498, -0.5667822, -3.204646, 0, 1, 0.08235294, 1,
-0.3491156, -0.02418614, -2.628598, 0, 1, 0.08627451, 1,
-0.3487689, -1.890972, -4.640485, 0, 1, 0.09411765, 1,
-0.3472512, 0.5465016, -0.4291616, 0, 1, 0.1019608, 1,
-0.3415957, -0.6539677, -3.230401, 0, 1, 0.1058824, 1,
-0.3327041, -1.621793, -5.402782, 0, 1, 0.1137255, 1,
-0.331385, -2.061589, -2.141473, 0, 1, 0.1176471, 1,
-0.3306782, -2.100241, -4.779561, 0, 1, 0.1254902, 1,
-0.3282284, 0.5308927, 1.542079, 0, 1, 0.1294118, 1,
-0.3252706, -0.225898, -2.371571, 0, 1, 0.1372549, 1,
-0.3225304, -0.07653282, -1.09724, 0, 1, 0.1411765, 1,
-0.3217357, 0.7319176, -1.209778, 0, 1, 0.1490196, 1,
-0.3208878, 0.2242146, -1.903044, 0, 1, 0.1529412, 1,
-0.3186713, -0.5668056, -3.416347, 0, 1, 0.1607843, 1,
-0.3156503, 0.7693548, 1.967177, 0, 1, 0.1647059, 1,
-0.3076248, 0.657152, -0.5795909, 0, 1, 0.172549, 1,
-0.3055876, -0.01285573, 0.6285663, 0, 1, 0.1764706, 1,
-0.3051707, 0.4581777, 1.497095, 0, 1, 0.1843137, 1,
-0.3006537, 0.1617366, -1.339665, 0, 1, 0.1882353, 1,
-0.3004782, -0.5348595, -4.125819, 0, 1, 0.1960784, 1,
-0.2980198, 1.326154, 0.09633335, 0, 1, 0.2039216, 1,
-0.295733, 0.4376651, -1.741769, 0, 1, 0.2078431, 1,
-0.2956461, 0.9807792, 0.3678056, 0, 1, 0.2156863, 1,
-0.2950043, 0.7686309, -0.06246043, 0, 1, 0.2196078, 1,
-0.2922463, 1.459345, -0.5760056, 0, 1, 0.227451, 1,
-0.2883955, -1.195667, -2.879285, 0, 1, 0.2313726, 1,
-0.2788662, 1.182855, 0.4216478, 0, 1, 0.2392157, 1,
-0.2771666, -1.108822, -1.744659, 0, 1, 0.2431373, 1,
-0.2763302, 0.6950341, -2.198561, 0, 1, 0.2509804, 1,
-0.275648, -1.107295, -2.469563, 0, 1, 0.254902, 1,
-0.2751568, -2.125844, -2.876635, 0, 1, 0.2627451, 1,
-0.2693237, -0.9318115, -2.804494, 0, 1, 0.2666667, 1,
-0.2686314, -1.991101, -1.117836, 0, 1, 0.2745098, 1,
-0.2667868, -1.497685, -4.556317, 0, 1, 0.2784314, 1,
-0.2658408, -1.228056, -4.258057, 0, 1, 0.2862745, 1,
-0.2622406, 0.8648065, -0.2439649, 0, 1, 0.2901961, 1,
-0.2564419, 0.7746338, -1.887279, 0, 1, 0.2980392, 1,
-0.250688, -0.3660848, -1.187969, 0, 1, 0.3058824, 1,
-0.2485186, 0.3490929, -1.780849, 0, 1, 0.3098039, 1,
-0.2479766, -0.2445292, -0.8009192, 0, 1, 0.3176471, 1,
-0.2467805, -0.1839576, -3.16786, 0, 1, 0.3215686, 1,
-0.2437642, -0.2158414, -2.853443, 0, 1, 0.3294118, 1,
-0.2429767, 0.5083805, -2.907124, 0, 1, 0.3333333, 1,
-0.2428723, -1.346248, -1.815871, 0, 1, 0.3411765, 1,
-0.242608, 0.1607713, -0.4769136, 0, 1, 0.345098, 1,
-0.2406638, -0.1300791, -2.137861, 0, 1, 0.3529412, 1,
-0.2333023, 1.281983, 0.1031039, 0, 1, 0.3568628, 1,
-0.2327835, -0.6144465, -3.074074, 0, 1, 0.3647059, 1,
-0.2310694, -1.078374, -2.45486, 0, 1, 0.3686275, 1,
-0.2287431, -0.630228, -2.254666, 0, 1, 0.3764706, 1,
-0.2205208, 0.2988871, -1.647496, 0, 1, 0.3803922, 1,
-0.2119292, -0.9484925, -3.016602, 0, 1, 0.3882353, 1,
-0.2088511, -1.052403, -2.611516, 0, 1, 0.3921569, 1,
-0.2083758, 0.8307743, -0.1819045, 0, 1, 0.4, 1,
-0.2062213, -0.5397001, -4.264453, 0, 1, 0.4078431, 1,
-0.2045673, 1.674083, 1.106127, 0, 1, 0.4117647, 1,
-0.2011729, 0.7886232, -0.1820532, 0, 1, 0.4196078, 1,
-0.2007575, 0.8597978, 1.051076, 0, 1, 0.4235294, 1,
-0.1996862, 0.7249711, 0.6020613, 0, 1, 0.4313726, 1,
-0.1991386, -1.001485, -2.42242, 0, 1, 0.4352941, 1,
-0.1990211, 1.993445, 0.01927094, 0, 1, 0.4431373, 1,
-0.1942459, 0.1025208, -0.3873348, 0, 1, 0.4470588, 1,
-0.1902167, 0.2512687, -1.243129, 0, 1, 0.454902, 1,
-0.1893854, 2.133313, -0.1228904, 0, 1, 0.4588235, 1,
-0.1800795, 0.4285314, -0.1661888, 0, 1, 0.4666667, 1,
-0.1778175, 0.7366883, 0.9272519, 0, 1, 0.4705882, 1,
-0.1724841, 0.454385, -0.6681123, 0, 1, 0.4784314, 1,
-0.1704847, 0.1969218, 0.1237239, 0, 1, 0.4823529, 1,
-0.1664761, 0.6231585, 0.1318054, 0, 1, 0.4901961, 1,
-0.1631626, 1.062473, 1.212556, 0, 1, 0.4941176, 1,
-0.162411, 0.1351305, -2.06732, 0, 1, 0.5019608, 1,
-0.1613661, 1.877435, 0.1979182, 0, 1, 0.509804, 1,
-0.1597201, 1.850782, -0.8140337, 0, 1, 0.5137255, 1,
-0.1539739, 0.1942664, -0.6477559, 0, 1, 0.5215687, 1,
-0.15108, 0.2586859, -1.418993, 0, 1, 0.5254902, 1,
-0.1451062, 1.099396, 0.05771238, 0, 1, 0.5333334, 1,
-0.1366377, -0.6629821, -4.282276, 0, 1, 0.5372549, 1,
-0.135195, 0.1937088, -0.4454664, 0, 1, 0.5450981, 1,
-0.1337738, 0.05156486, -0.7070047, 0, 1, 0.5490196, 1,
-0.1323563, 0.6512582, 0.8747628, 0, 1, 0.5568628, 1,
-0.1297919, 1.317053, 0.2616339, 0, 1, 0.5607843, 1,
-0.1260588, -0.6182769, -4.503705, 0, 1, 0.5686275, 1,
-0.1235798, 0.4160144, -0.3611844, 0, 1, 0.572549, 1,
-0.1158309, -1.155702, -3.375156, 0, 1, 0.5803922, 1,
-0.1158067, -1.34764, -1.145201, 0, 1, 0.5843138, 1,
-0.1148357, 0.4642595, -0.8341604, 0, 1, 0.5921569, 1,
-0.1140212, -0.06745848, -3.270551, 0, 1, 0.5960785, 1,
-0.1117573, 0.04679681, 0.712345, 0, 1, 0.6039216, 1,
-0.1101264, 0.6073229, 0.8468465, 0, 1, 0.6117647, 1,
-0.1089543, 0.445481, 1.11544, 0, 1, 0.6156863, 1,
-0.1070124, -0.1516233, -3.459114, 0, 1, 0.6235294, 1,
-0.1069115, 0.6945004, -1.052994, 0, 1, 0.627451, 1,
-0.100816, 1.214295, -0.403259, 0, 1, 0.6352941, 1,
-0.09955843, 1.346926, 0.1164628, 0, 1, 0.6392157, 1,
-0.09894092, -1.332375, -1.847368, 0, 1, 0.6470588, 1,
-0.09863584, -0.119716, -3.207658, 0, 1, 0.6509804, 1,
-0.09763674, -0.8781969, -2.67321, 0, 1, 0.6588235, 1,
-0.09711196, -0.278338, -4.964362, 0, 1, 0.6627451, 1,
-0.09706204, 0.395324, 0.1103186, 0, 1, 0.6705883, 1,
-0.0966843, -0.2298483, -1.037729, 0, 1, 0.6745098, 1,
-0.0937907, -0.9429834, -2.294654, 0, 1, 0.682353, 1,
-0.09367397, 0.07594982, 0.6678207, 0, 1, 0.6862745, 1,
-0.0900231, 0.8370234, -1.546664, 0, 1, 0.6941177, 1,
-0.08813459, -1.304842, -3.576143, 0, 1, 0.7019608, 1,
-0.08642461, -0.7056926, -3.516468, 0, 1, 0.7058824, 1,
-0.08550793, -0.8979421, -3.220421, 0, 1, 0.7137255, 1,
-0.08472587, -0.06770384, -2.619751, 0, 1, 0.7176471, 1,
-0.0812819, -0.152969, -2.316288, 0, 1, 0.7254902, 1,
-0.08096657, -0.3975357, -2.43699, 0, 1, 0.7294118, 1,
-0.07797527, 2.055443, -1.277075, 0, 1, 0.7372549, 1,
-0.07700874, -0.6938187, -3.744277, 0, 1, 0.7411765, 1,
-0.07546596, -0.04558949, -1.954285, 0, 1, 0.7490196, 1,
-0.0719812, 0.5865986, 0.9229147, 0, 1, 0.7529412, 1,
-0.07068053, -0.01690005, -1.65591, 0, 1, 0.7607843, 1,
-0.0701388, -0.6921893, -2.834634, 0, 1, 0.7647059, 1,
-0.06949563, -0.1886309, -2.377185, 0, 1, 0.772549, 1,
-0.06551911, -1.855807, -2.635328, 0, 1, 0.7764706, 1,
-0.06491297, 0.1796147, -2.036947, 0, 1, 0.7843137, 1,
-0.0610664, 0.2952981, -2.221135, 0, 1, 0.7882353, 1,
-0.05938789, 1.044384, 1.413242, 0, 1, 0.7960784, 1,
-0.05661558, -0.7100437, -4.173551, 0, 1, 0.8039216, 1,
-0.05641155, -0.7865314, -3.314175, 0, 1, 0.8078431, 1,
-0.05281354, 1.060978, 0.4960863, 0, 1, 0.8156863, 1,
-0.05217434, 0.2521336, 0.3955584, 0, 1, 0.8196079, 1,
-0.0518181, -0.4022827, -2.081968, 0, 1, 0.827451, 1,
-0.05109662, 0.03877978, -1.098818, 0, 1, 0.8313726, 1,
-0.05108753, 0.6942757, 0.059554, 0, 1, 0.8392157, 1,
-0.05056761, 1.2367, -0.7408825, 0, 1, 0.8431373, 1,
-0.0480902, -1.79945, -2.245088, 0, 1, 0.8509804, 1,
-0.04775104, -0.3051681, -4.497526, 0, 1, 0.854902, 1,
-0.04752196, 1.383575, 0.01118558, 0, 1, 0.8627451, 1,
-0.04501942, 0.5667422, -0.4661214, 0, 1, 0.8666667, 1,
-0.044631, 0.9236712, -1.463942, 0, 1, 0.8745098, 1,
-0.04164382, 0.3144172, 1.204093, 0, 1, 0.8784314, 1,
-0.04124365, 0.5250956, 0.09490736, 0, 1, 0.8862745, 1,
-0.0313923, 0.6460463, 1.57633, 0, 1, 0.8901961, 1,
-0.03105216, 0.2619552, -0.3179489, 0, 1, 0.8980392, 1,
-0.03079341, 0.392167, 0.02506562, 0, 1, 0.9058824, 1,
-0.03059545, -1.009807, -4.550695, 0, 1, 0.9098039, 1,
-0.02736515, 1.054737, -0.8922616, 0, 1, 0.9176471, 1,
-0.02302448, 1.023737, 0.2007413, 0, 1, 0.9215686, 1,
-0.01961854, -0.1563527, -0.9804311, 0, 1, 0.9294118, 1,
-0.01641628, -0.1612052, -2.983703, 0, 1, 0.9333333, 1,
-0.01438212, 1.058085, -0.1468887, 0, 1, 0.9411765, 1,
-0.008076997, -1.29309, -3.192985, 0, 1, 0.945098, 1,
-0.007948352, 0.03703654, -0.7316268, 0, 1, 0.9529412, 1,
-0.006957811, 0.7526201, -0.1169732, 0, 1, 0.9568627, 1,
-0.002883309, 0.1075731, -2.018782, 0, 1, 0.9647059, 1,
-0.002782836, 0.1968939, 1.383997, 0, 1, 0.9686275, 1,
-0.002029882, -1.852203, -2.845375, 0, 1, 0.9764706, 1,
-0.0004840146, -0.9712727, -4.980983, 0, 1, 0.9803922, 1,
-0.0003408673, 0.1840511, -0.2698197, 0, 1, 0.9882353, 1,
0.0003530964, 1.558521, -0.6314314, 0, 1, 0.9921569, 1,
0.002567894, 2.39765, -0.4112001, 0, 1, 1, 1,
0.003667583, -1.336592, 2.80745, 0, 0.9921569, 1, 1,
0.009308223, -0.1877152, 3.265951, 0, 0.9882353, 1, 1,
0.01165072, 0.1023042, -0.784132, 0, 0.9803922, 1, 1,
0.01249754, 0.006653918, 2.204097, 0, 0.9764706, 1, 1,
0.01554712, 0.06580674, -0.2959233, 0, 0.9686275, 1, 1,
0.01634408, -1.203544, 1.650584, 0, 0.9647059, 1, 1,
0.01638359, 0.4306377, -1.256081, 0, 0.9568627, 1, 1,
0.01643652, -1.263361, 4.326273, 0, 0.9529412, 1, 1,
0.01892601, -0.857632, 2.252951, 0, 0.945098, 1, 1,
0.02130447, -0.2276476, 1.425566, 0, 0.9411765, 1, 1,
0.02172924, -0.4254721, 2.970275, 0, 0.9333333, 1, 1,
0.02272102, -1.590418, 3.309969, 0, 0.9294118, 1, 1,
0.02386753, 1.084738, 0.9914094, 0, 0.9215686, 1, 1,
0.02552126, -0.0161848, 3.121534, 0, 0.9176471, 1, 1,
0.02652868, -1.248835, 4.777119, 0, 0.9098039, 1, 1,
0.02902323, -1.31016, 2.168025, 0, 0.9058824, 1, 1,
0.0310404, -0.9238072, 3.917346, 0, 0.8980392, 1, 1,
0.03414804, -0.1995983, 1.99319, 0, 0.8901961, 1, 1,
0.03710141, 1.663129, -1.097761, 0, 0.8862745, 1, 1,
0.04200242, 0.006546548, 1.213129, 0, 0.8784314, 1, 1,
0.04433083, 1.176506, 0.1435553, 0, 0.8745098, 1, 1,
0.0467145, 0.2256557, -0.215857, 0, 0.8666667, 1, 1,
0.05106056, -0.005349095, 1.828937, 0, 0.8627451, 1, 1,
0.05308916, -0.4079852, 2.281605, 0, 0.854902, 1, 1,
0.05579791, 0.1906334, 0.3203844, 0, 0.8509804, 1, 1,
0.05923865, -0.07090286, 3.007892, 0, 0.8431373, 1, 1,
0.06014858, 0.1816857, -0.963484, 0, 0.8392157, 1, 1,
0.06524261, -0.6134462, 3.607307, 0, 0.8313726, 1, 1,
0.06903304, 0.001486018, 2.613048, 0, 0.827451, 1, 1,
0.06999454, -1.440048, 4.980661, 0, 0.8196079, 1, 1,
0.07006481, 0.626398, -0.653654, 0, 0.8156863, 1, 1,
0.07313456, -1.120648, 2.166636, 0, 0.8078431, 1, 1,
0.07752166, 1.194495, -2.903795, 0, 0.8039216, 1, 1,
0.08093325, -0.7418459, 3.123996, 0, 0.7960784, 1, 1,
0.08700516, -0.8709069, 2.946806, 0, 0.7882353, 1, 1,
0.08780806, 1.090611, 0.8268014, 0, 0.7843137, 1, 1,
0.08784298, 0.899617, -0.3294855, 0, 0.7764706, 1, 1,
0.0880056, 0.6261126, 1.347493, 0, 0.772549, 1, 1,
0.09032269, 0.9258447, -1.469178, 0, 0.7647059, 1, 1,
0.09323612, -1.541791, 4.267935, 0, 0.7607843, 1, 1,
0.09611578, -0.880845, 2.681087, 0, 0.7529412, 1, 1,
0.09851302, -0.8490561, 4.064456, 0, 0.7490196, 1, 1,
0.1041263, 1.936505, 0.5374135, 0, 0.7411765, 1, 1,
0.1052427, -0.7114505, 2.592306, 0, 0.7372549, 1, 1,
0.1059978, -0.767816, 2.096323, 0, 0.7294118, 1, 1,
0.1105364, 0.9125815, 0.1630203, 0, 0.7254902, 1, 1,
0.1132654, 0.5445213, 0.2663715, 0, 0.7176471, 1, 1,
0.1147357, -0.2998168, 2.03379, 0, 0.7137255, 1, 1,
0.1163551, -0.1249751, 2.168353, 0, 0.7058824, 1, 1,
0.1181775, -1.497903, 2.831292, 0, 0.6980392, 1, 1,
0.1225813, -0.9184964, 4.450399, 0, 0.6941177, 1, 1,
0.1242114, -0.265781, 3.613218, 0, 0.6862745, 1, 1,
0.1306607, -0.5535545, 3.494354, 0, 0.682353, 1, 1,
0.132582, 0.2190505, -0.08312096, 0, 0.6745098, 1, 1,
0.1358557, 0.09750138, -1.162958, 0, 0.6705883, 1, 1,
0.1413403, -0.1895643, 1.81432, 0, 0.6627451, 1, 1,
0.1508449, 1.098048, -1.59699, 0, 0.6588235, 1, 1,
0.1529786, -1.667903, 4.909521, 0, 0.6509804, 1, 1,
0.1531553, -0.9741597, 2.538307, 0, 0.6470588, 1, 1,
0.1532934, -0.8322757, 2.643248, 0, 0.6392157, 1, 1,
0.1554422, -0.9381161, 2.365069, 0, 0.6352941, 1, 1,
0.1680791, -1.764797, 2.337196, 0, 0.627451, 1, 1,
0.1705624, 2.149693, 0.4099594, 0, 0.6235294, 1, 1,
0.1709366, -0.3852121, 3.609522, 0, 0.6156863, 1, 1,
0.1765219, -0.03834546, 2.172557, 0, 0.6117647, 1, 1,
0.1770621, 1.100126, -0.7553725, 0, 0.6039216, 1, 1,
0.186332, 0.4758947, -0.06251863, 0, 0.5960785, 1, 1,
0.1869217, -0.658216, 1.821069, 0, 0.5921569, 1, 1,
0.187159, 1.174539, -0.3445859, 0, 0.5843138, 1, 1,
0.1907609, 0.7485858, 0.8501402, 0, 0.5803922, 1, 1,
0.1908495, -0.93081, 2.420358, 0, 0.572549, 1, 1,
0.1917355, -0.01201907, 2.035082, 0, 0.5686275, 1, 1,
0.1926491, 0.7312552, -0.482992, 0, 0.5607843, 1, 1,
0.1929692, 0.7853122, 0.4205871, 0, 0.5568628, 1, 1,
0.1987598, -0.6283339, 1.834756, 0, 0.5490196, 1, 1,
0.2063618, -0.04224036, 1.477876, 0, 0.5450981, 1, 1,
0.2094806, -1.299142, 3.392646, 0, 0.5372549, 1, 1,
0.211467, 0.8521585, 2.495306, 0, 0.5333334, 1, 1,
0.2124323, 0.2153256, -0.1747371, 0, 0.5254902, 1, 1,
0.2144058, -0.3893929, 4.876254, 0, 0.5215687, 1, 1,
0.2162087, 2.730733, 3.205111, 0, 0.5137255, 1, 1,
0.2185075, 0.3428951, 0.4216952, 0, 0.509804, 1, 1,
0.2198317, -0.8008863, 0.7059731, 0, 0.5019608, 1, 1,
0.2201782, -0.9182223, 2.987925, 0, 0.4941176, 1, 1,
0.2251691, -0.05221653, 0.1315609, 0, 0.4901961, 1, 1,
0.2300507, 1.271513, 0.4805157, 0, 0.4823529, 1, 1,
0.2320172, -0.6223345, 2.102672, 0, 0.4784314, 1, 1,
0.2364914, -1.260974, 5.109812, 0, 0.4705882, 1, 1,
0.2378326, 0.3956835, 0.8194471, 0, 0.4666667, 1, 1,
0.238514, 0.9447089, -0.1366308, 0, 0.4588235, 1, 1,
0.2420803, -0.02886555, 3.320115, 0, 0.454902, 1, 1,
0.2465203, -1.134486, 5.096882, 0, 0.4470588, 1, 1,
0.2556992, -0.1659369, 1.99918, 0, 0.4431373, 1, 1,
0.2560662, 1.201569, 0.5871887, 0, 0.4352941, 1, 1,
0.2605059, 0.123291, 0.4239254, 0, 0.4313726, 1, 1,
0.2656141, -0.9213395, 2.399934, 0, 0.4235294, 1, 1,
0.2693916, -0.3639758, -0.414457, 0, 0.4196078, 1, 1,
0.2733051, -0.009765714, 2.130384, 0, 0.4117647, 1, 1,
0.2778282, 0.7876314, -0.9982247, 0, 0.4078431, 1, 1,
0.2779697, -1.680702, 3.367834, 0, 0.4, 1, 1,
0.2833157, 0.8285596, -1.289009, 0, 0.3921569, 1, 1,
0.2838742, -1.671955, 3.795772, 0, 0.3882353, 1, 1,
0.2842796, -1.001634, 2.706017, 0, 0.3803922, 1, 1,
0.2935613, -0.3959556, 4.498435, 0, 0.3764706, 1, 1,
0.2937706, -0.5467258, 2.015204, 0, 0.3686275, 1, 1,
0.2940224, 0.04502536, 0.0410926, 0, 0.3647059, 1, 1,
0.29614, -1.365236, 4.352691, 0, 0.3568628, 1, 1,
0.2983004, -0.3758537, 3.524957, 0, 0.3529412, 1, 1,
0.299172, -1.416436, 3.597881, 0, 0.345098, 1, 1,
0.3041853, -0.403349, 0.6589568, 0, 0.3411765, 1, 1,
0.30539, 0.03576511, 1.381038, 0, 0.3333333, 1, 1,
0.3101094, -0.3204997, 2.126659, 0, 0.3294118, 1, 1,
0.311262, -2.48579, 1.944336, 0, 0.3215686, 1, 1,
0.3127971, 0.0581714, 1.711417, 0, 0.3176471, 1, 1,
0.3164248, 1.178826, -0.3256819, 0, 0.3098039, 1, 1,
0.3165873, -2.060865, 3.369019, 0, 0.3058824, 1, 1,
0.3171245, 0.7053054, -0.2067246, 0, 0.2980392, 1, 1,
0.3242879, -0.7570328, 2.131222, 0, 0.2901961, 1, 1,
0.3319116, 1.797198, 0.4806137, 0, 0.2862745, 1, 1,
0.3355907, -0.04315198, 2.356636, 0, 0.2784314, 1, 1,
0.3400139, -0.2911693, 0.2539594, 0, 0.2745098, 1, 1,
0.342969, 3.058944, 1.188589, 0, 0.2666667, 1, 1,
0.3435899, -1.662626, 1.70451, 0, 0.2627451, 1, 1,
0.3464277, -1.568265, 4.598633, 0, 0.254902, 1, 1,
0.3484912, 1.045208, 0.3272445, 0, 0.2509804, 1, 1,
0.3652964, -0.970016, 3.397056, 0, 0.2431373, 1, 1,
0.366287, -1.273375, 2.7965, 0, 0.2392157, 1, 1,
0.3745418, -1.535791, 0.5482163, 0, 0.2313726, 1, 1,
0.375158, 0.02719444, 1.564019, 0, 0.227451, 1, 1,
0.375778, 1.499819, -1.151629, 0, 0.2196078, 1, 1,
0.3832731, 1.173398, -0.2970807, 0, 0.2156863, 1, 1,
0.3836141, 2.05062, 0.8388909, 0, 0.2078431, 1, 1,
0.3836923, -0.7032686, 1.486357, 0, 0.2039216, 1, 1,
0.3854774, -1.072046, 3.464923, 0, 0.1960784, 1, 1,
0.3863514, 0.6461695, -0.1454464, 0, 0.1882353, 1, 1,
0.3871393, 1.473968, 0.04965346, 0, 0.1843137, 1, 1,
0.3892706, -0.4361022, 4.182166, 0, 0.1764706, 1, 1,
0.3893678, -0.7085919, 1.930106, 0, 0.172549, 1, 1,
0.3897552, -1.191651, 2.943812, 0, 0.1647059, 1, 1,
0.3933273, -0.2104258, 0.9028647, 0, 0.1607843, 1, 1,
0.3940343, 0.6783083, -0.1514483, 0, 0.1529412, 1, 1,
0.3968998, 0.8122938, 0.4077068, 0, 0.1490196, 1, 1,
0.397108, -1.440602, 3.29079, 0, 0.1411765, 1, 1,
0.3982267, 0.3684987, 1.0961, 0, 0.1372549, 1, 1,
0.3993414, 1.2235, 0.1161526, 0, 0.1294118, 1, 1,
0.4001413, -0.4858375, 2.900226, 0, 0.1254902, 1, 1,
0.4004129, -0.2703623, 1.60789, 0, 0.1176471, 1, 1,
0.4028128, -0.8437085, 3.638554, 0, 0.1137255, 1, 1,
0.4032001, -1.591559, 4.061936, 0, 0.1058824, 1, 1,
0.4055851, 1.42613, 0.6820766, 0, 0.09803922, 1, 1,
0.4107227, -0.004319427, 1.475241, 0, 0.09411765, 1, 1,
0.4110471, -0.4034567, 2.919971, 0, 0.08627451, 1, 1,
0.4127323, -0.6604103, 3.24078, 0, 0.08235294, 1, 1,
0.4139952, 1.63997, -1.088883, 0, 0.07450981, 1, 1,
0.4258436, 0.7540449, 2.354768, 0, 0.07058824, 1, 1,
0.4260927, -1.584964, 1.939707, 0, 0.0627451, 1, 1,
0.4311963, -0.3108183, 2.125397, 0, 0.05882353, 1, 1,
0.4377164, 0.154232, -0.9278183, 0, 0.05098039, 1, 1,
0.4418488, -0.2923911, 3.193729, 0, 0.04705882, 1, 1,
0.4421519, -2.09525, 2.646049, 0, 0.03921569, 1, 1,
0.4423337, 0.5767096, 2.027684, 0, 0.03529412, 1, 1,
0.4456286, 0.3667492, 1.039988, 0, 0.02745098, 1, 1,
0.4459937, 0.4720705, 0.1872572, 0, 0.02352941, 1, 1,
0.4483156, 0.4983069, 0.8424311, 0, 0.01568628, 1, 1,
0.4501473, -0.02520476, 2.023684, 0, 0.01176471, 1, 1,
0.4513809, 1.150963, 1.689444, 0, 0.003921569, 1, 1,
0.454591, 0.135607, 0.5420091, 0.003921569, 0, 1, 1,
0.4576804, 1.333644, 2.032064, 0.007843138, 0, 1, 1,
0.4593915, -2.332823, 3.371574, 0.01568628, 0, 1, 1,
0.4604801, 0.02874891, 2.324352, 0.01960784, 0, 1, 1,
0.4627885, -0.05639036, 2.319857, 0.02745098, 0, 1, 1,
0.465753, -0.2501066, 1.810036, 0.03137255, 0, 1, 1,
0.470041, -2.816987, 2.916658, 0.03921569, 0, 1, 1,
0.4718402, -1.279412, 4.267647, 0.04313726, 0, 1, 1,
0.4790616, -0.8956295, 4.451509, 0.05098039, 0, 1, 1,
0.4793446, 0.2116132, 0.5204686, 0.05490196, 0, 1, 1,
0.4801445, 0.970606, -0.1845498, 0.0627451, 0, 1, 1,
0.4814678, -0.03821113, -0.9952559, 0.06666667, 0, 1, 1,
0.4845871, -0.4347308, 0.8582548, 0.07450981, 0, 1, 1,
0.4846986, 0.5698985, -0.05774152, 0.07843138, 0, 1, 1,
0.4857547, 0.2234002, 0.9726766, 0.08627451, 0, 1, 1,
0.4860608, 0.07234998, 1.856154, 0.09019608, 0, 1, 1,
0.4916724, 0.1705753, 1.579807, 0.09803922, 0, 1, 1,
0.4938014, -1.039057, 2.812689, 0.1058824, 0, 1, 1,
0.4968476, -0.3270283, 2.979582, 0.1098039, 0, 1, 1,
0.4978236, 0.7435085, 1.340245, 0.1176471, 0, 1, 1,
0.5100051, 0.5227748, 1.162963, 0.1215686, 0, 1, 1,
0.5113472, 0.2791288, 0.1346545, 0.1294118, 0, 1, 1,
0.5215179, -1.767978, 1.568222, 0.1333333, 0, 1, 1,
0.5236186, 0.5262349, 0.3907323, 0.1411765, 0, 1, 1,
0.5244597, 0.9658369, 1.014088, 0.145098, 0, 1, 1,
0.5290833, -1.591439, 1.568083, 0.1529412, 0, 1, 1,
0.5336419, 0.3183142, 0.7024289, 0.1568628, 0, 1, 1,
0.5360411, -1.585327, 3.321014, 0.1647059, 0, 1, 1,
0.5557103, 0.09722742, 0.9594622, 0.1686275, 0, 1, 1,
0.5649643, 0.6332858, -0.7780241, 0.1764706, 0, 1, 1,
0.5663795, 0.4273323, 4.052249, 0.1803922, 0, 1, 1,
0.5692996, 0.2534658, 1.185473, 0.1882353, 0, 1, 1,
0.5730956, 0.843626, 0.06635301, 0.1921569, 0, 1, 1,
0.5790365, -0.2093517, 2.796368, 0.2, 0, 1, 1,
0.5790675, 0.7925173, 1.440853, 0.2078431, 0, 1, 1,
0.579469, 0.47078, 1.171779, 0.2117647, 0, 1, 1,
0.5859115, 2.019158, 0.5123219, 0.2196078, 0, 1, 1,
0.5899841, -1.045897, 2.445542, 0.2235294, 0, 1, 1,
0.5960072, -0.2078066, 0.1123887, 0.2313726, 0, 1, 1,
0.5973281, 0.04459103, 0.4956429, 0.2352941, 0, 1, 1,
0.5977123, 2.339099, -0.07758565, 0.2431373, 0, 1, 1,
0.5978835, -0.8372828, 0.8707389, 0.2470588, 0, 1, 1,
0.6053807, -1.971489, 3.276139, 0.254902, 0, 1, 1,
0.6077496, 1.427484, -0.3577246, 0.2588235, 0, 1, 1,
0.6123285, 1.258533, -0.1380636, 0.2666667, 0, 1, 1,
0.6160828, -0.4636766, 1.315202, 0.2705882, 0, 1, 1,
0.6235549, 0.3713336, 1.246631, 0.2784314, 0, 1, 1,
0.6237258, 1.441879, 0.6567462, 0.282353, 0, 1, 1,
0.625438, 0.6336482, 1.167071, 0.2901961, 0, 1, 1,
0.6287251, 0.6173651, -0.1811356, 0.2941177, 0, 1, 1,
0.6311391, 0.5473251, -0.2130671, 0.3019608, 0, 1, 1,
0.6355263, 0.8858904, 1.204513, 0.3098039, 0, 1, 1,
0.6378592, 1.694516, -0.523332, 0.3137255, 0, 1, 1,
0.6407133, 0.7057625, 2.123542, 0.3215686, 0, 1, 1,
0.6455184, -0.470833, 1.599728, 0.3254902, 0, 1, 1,
0.6459324, 1.741922, 0.6709248, 0.3333333, 0, 1, 1,
0.647472, 0.01812049, 1.700362, 0.3372549, 0, 1, 1,
0.6500975, 1.222027, 0.2144233, 0.345098, 0, 1, 1,
0.657092, -2.047605, 0.8444849, 0.3490196, 0, 1, 1,
0.6581531, 1.558599, -0.6729993, 0.3568628, 0, 1, 1,
0.6586207, -0.1292979, 0.5989627, 0.3607843, 0, 1, 1,
0.6705546, 0.05907195, 1.165005, 0.3686275, 0, 1, 1,
0.675497, 2.019927, 1.523042, 0.372549, 0, 1, 1,
0.6782205, 1.660052, -0.9738184, 0.3803922, 0, 1, 1,
0.6840675, -1.03721, 1.219832, 0.3843137, 0, 1, 1,
0.6846057, 0.3338028, 0.7552539, 0.3921569, 0, 1, 1,
0.6863264, 1.852468, 0.6294882, 0.3960784, 0, 1, 1,
0.6905891, -0.2063566, 0.9305044, 0.4039216, 0, 1, 1,
0.6928377, 0.4659954, 1.685713, 0.4117647, 0, 1, 1,
0.6931498, 0.08679537, 1.612887, 0.4156863, 0, 1, 1,
0.696846, 1.431209, -0.2050582, 0.4235294, 0, 1, 1,
0.6974218, 0.1505216, 0.5227255, 0.427451, 0, 1, 1,
0.6981713, 0.5279601, 1.393139, 0.4352941, 0, 1, 1,
0.7044566, 0.7367164, 2.294441, 0.4392157, 0, 1, 1,
0.7067861, -1.864903, 1.077769, 0.4470588, 0, 1, 1,
0.7073779, -1.144881, 3.250422, 0.4509804, 0, 1, 1,
0.7117571, 1.538002, 2.772797, 0.4588235, 0, 1, 1,
0.7147919, -1.068416, 4.085879, 0.4627451, 0, 1, 1,
0.715082, -0.4228929, 1.315263, 0.4705882, 0, 1, 1,
0.7200904, 1.648659, 1.17652, 0.4745098, 0, 1, 1,
0.7214274, -1.069477, 2.415237, 0.4823529, 0, 1, 1,
0.7221789, 2.258386, -0.7501619, 0.4862745, 0, 1, 1,
0.7254545, -0.220561, 2.784251, 0.4941176, 0, 1, 1,
0.7262217, -1.42762, 1.606059, 0.5019608, 0, 1, 1,
0.7267, 1.580846, 1.904768, 0.5058824, 0, 1, 1,
0.728719, 0.2916012, 1.763077, 0.5137255, 0, 1, 1,
0.7290921, -1.177098, 3.248748, 0.5176471, 0, 1, 1,
0.729558, 0.05788023, -0.1963428, 0.5254902, 0, 1, 1,
0.7409745, -0.5639971, 1.078034, 0.5294118, 0, 1, 1,
0.745908, 0.4524956, 0.9760265, 0.5372549, 0, 1, 1,
0.7459529, -1.181764, 4.152402, 0.5411765, 0, 1, 1,
0.7543138, -0.4055803, 2.212754, 0.5490196, 0, 1, 1,
0.7650426, -0.5686036, 2.537312, 0.5529412, 0, 1, 1,
0.7854989, 0.7973474, 1.391282, 0.5607843, 0, 1, 1,
0.7882417, -0.716875, 2.915334, 0.5647059, 0, 1, 1,
0.7893344, -0.2982034, 1.153136, 0.572549, 0, 1, 1,
0.792559, -0.660134, 0.3892956, 0.5764706, 0, 1, 1,
0.7935673, 0.2727645, 0.5552462, 0.5843138, 0, 1, 1,
0.7944549, -0.6405392, 0.223244, 0.5882353, 0, 1, 1,
0.7991333, 1.155849, 1.036892, 0.5960785, 0, 1, 1,
0.7999895, 1.84612, 0.7108658, 0.6039216, 0, 1, 1,
0.807248, 0.8144441, 0.880443, 0.6078432, 0, 1, 1,
0.8093814, 0.6000906, -0.946711, 0.6156863, 0, 1, 1,
0.8141602, -0.2811115, 3.410563, 0.6196079, 0, 1, 1,
0.8145204, 0.5948271, 1.433606, 0.627451, 0, 1, 1,
0.8153589, -1.362643, 3.628892, 0.6313726, 0, 1, 1,
0.8189412, -0.5349535, 2.902435, 0.6392157, 0, 1, 1,
0.8202142, 2.059453, 0.3427536, 0.6431373, 0, 1, 1,
0.8284513, 0.09073736, 1.865812, 0.6509804, 0, 1, 1,
0.8284815, -0.4056271, 0.7755017, 0.654902, 0, 1, 1,
0.831856, -0.7152689, -0.1776304, 0.6627451, 0, 1, 1,
0.8336855, -0.01245496, 2.871384, 0.6666667, 0, 1, 1,
0.8345346, 0.9550032, -0.1681698, 0.6745098, 0, 1, 1,
0.8395672, 0.2540424, 0.4109792, 0.6784314, 0, 1, 1,
0.842499, -0.4559731, 1.218881, 0.6862745, 0, 1, 1,
0.8464928, -0.539716, 1.795484, 0.6901961, 0, 1, 1,
0.8476281, 0.9852965, 2.386784, 0.6980392, 0, 1, 1,
0.8506485, -0.1950765, -0.3649562, 0.7058824, 0, 1, 1,
0.8533739, -0.9000364, 1.691671, 0.7098039, 0, 1, 1,
0.8591662, -0.4207644, 2.685378, 0.7176471, 0, 1, 1,
0.8593553, 0.8654473, 0.412804, 0.7215686, 0, 1, 1,
0.8646514, -1.071037, 2.155434, 0.7294118, 0, 1, 1,
0.8685606, 0.4307491, 1.2893, 0.7333333, 0, 1, 1,
0.8705087, -0.0451333, 1.05167, 0.7411765, 0, 1, 1,
0.873383, -0.5030153, 2.67669, 0.7450981, 0, 1, 1,
0.8735335, 0.2631004, 1.317357, 0.7529412, 0, 1, 1,
0.8762056, 0.376829, 2.092813, 0.7568628, 0, 1, 1,
0.877683, -0.4987601, 1.006013, 0.7647059, 0, 1, 1,
0.8796155, 0.08311947, 1.281109, 0.7686275, 0, 1, 1,
0.8813757, -0.08613849, 2.129517, 0.7764706, 0, 1, 1,
0.8820103, -0.6334994, 2.26899, 0.7803922, 0, 1, 1,
0.8878764, -0.7492982, 3.289928, 0.7882353, 0, 1, 1,
0.8905668, -0.8090449, 1.450749, 0.7921569, 0, 1, 1,
0.8937409, -0.3130078, 1.388419, 0.8, 0, 1, 1,
0.8985904, -1.003902, 1.862136, 0.8078431, 0, 1, 1,
0.899677, -1.016807, 1.550694, 0.8117647, 0, 1, 1,
0.9003136, 0.8600932, 2.243868, 0.8196079, 0, 1, 1,
0.9038722, -1.514133, 1.88914, 0.8235294, 0, 1, 1,
0.9080269, 0.4482658, 0.3110806, 0.8313726, 0, 1, 1,
0.9095994, 0.3032241, 1.105028, 0.8352941, 0, 1, 1,
0.9136255, 0.4853315, 1.087312, 0.8431373, 0, 1, 1,
0.9201525, -0.02459494, 0.2262622, 0.8470588, 0, 1, 1,
0.9202391, 0.2038068, 2.764327, 0.854902, 0, 1, 1,
0.9210203, 0.3033778, 2.221952, 0.8588235, 0, 1, 1,
0.924399, -0.09677156, 3.792404, 0.8666667, 0, 1, 1,
0.9261792, -1.108815, 2.373418, 0.8705882, 0, 1, 1,
0.9295283, -0.5878747, 1.541412, 0.8784314, 0, 1, 1,
0.9362496, -0.0004161118, -0.9777725, 0.8823529, 0, 1, 1,
0.9365585, 0.7215973, 0.3135217, 0.8901961, 0, 1, 1,
0.9410809, 0.7931454, 1.803874, 0.8941177, 0, 1, 1,
0.9433681, -0.1876489, 0.5024502, 0.9019608, 0, 1, 1,
0.9449728, -1.255772, 1.846835, 0.9098039, 0, 1, 1,
0.9456193, 2.229992, 2.058182, 0.9137255, 0, 1, 1,
0.9466861, -0.4191513, 3.014519, 0.9215686, 0, 1, 1,
0.9475135, 1.729014, 1.570367, 0.9254902, 0, 1, 1,
0.9486251, 0.260184, 1.142095, 0.9333333, 0, 1, 1,
0.9580191, -0.4178965, 2.299985, 0.9372549, 0, 1, 1,
0.961476, -0.08456436, 2.811846, 0.945098, 0, 1, 1,
0.9639736, -1.621909, 0.8642509, 0.9490196, 0, 1, 1,
0.9643236, -0.01691641, 1.164975, 0.9568627, 0, 1, 1,
0.9728932, 0.3823809, 0.556195, 0.9607843, 0, 1, 1,
0.9779733, 0.6785784, 1.245931, 0.9686275, 0, 1, 1,
0.98179, -0.4905733, 2.427293, 0.972549, 0, 1, 1,
0.9828421, -1.867894, 3.93694, 0.9803922, 0, 1, 1,
0.9841518, -0.5609385, 3.076782, 0.9843137, 0, 1, 1,
1.000243, -1.886546, 2.356378, 0.9921569, 0, 1, 1,
1.006784, 0.08027849, 0.8740264, 0.9960784, 0, 1, 1,
1.008657, -0.8768864, 0.8839042, 1, 0, 0.9960784, 1,
1.01434, 0.1340575, 0.5983421, 1, 0, 0.9882353, 1,
1.014887, -0.6565295, 0.5209109, 1, 0, 0.9843137, 1,
1.017951, 0.1866218, 0.8363433, 1, 0, 0.9764706, 1,
1.02591, -1.086742, 5.34613, 1, 0, 0.972549, 1,
1.026392, -0.37356, 1.937968, 1, 0, 0.9647059, 1,
1.027106, -1.580057, 1.624683, 1, 0, 0.9607843, 1,
1.030709, 0.3470323, 0.8840482, 1, 0, 0.9529412, 1,
1.032239, 0.6476335, -0.4912291, 1, 0, 0.9490196, 1,
1.033035, 0.7246144, 2.628076, 1, 0, 0.9411765, 1,
1.035677, 0.6307603, 1.356133, 1, 0, 0.9372549, 1,
1.038637, 1.573997, 1.114123, 1, 0, 0.9294118, 1,
1.056479, 0.04256986, 0.5711002, 1, 0, 0.9254902, 1,
1.057793, 0.03209343, 0.3950891, 1, 0, 0.9176471, 1,
1.060606, -0.1455547, 1.444513, 1, 0, 0.9137255, 1,
1.067153, -0.4943742, 1.915354, 1, 0, 0.9058824, 1,
1.067237, 1.775794, 1.569817, 1, 0, 0.9019608, 1,
1.07287, 0.4122203, 0.4812444, 1, 0, 0.8941177, 1,
1.072989, 0.2504237, 1.125766, 1, 0, 0.8862745, 1,
1.076889, -0.2968791, 3.450533, 1, 0, 0.8823529, 1,
1.0799, 1.366636, 1.200824, 1, 0, 0.8745098, 1,
1.083595, -1.82192, 2.606994, 1, 0, 0.8705882, 1,
1.090915, 0.8396292, 2.108117, 1, 0, 0.8627451, 1,
1.095491, -0.2019598, 1.731553, 1, 0, 0.8588235, 1,
1.096311, -1.735824, 4.210572, 1, 0, 0.8509804, 1,
1.096969, -0.8696026, 2.508526, 1, 0, 0.8470588, 1,
1.097579, 0.5127645, 2.46031, 1, 0, 0.8392157, 1,
1.102649, 2.636981, 1.108717, 1, 0, 0.8352941, 1,
1.115384, -1.729061, 3.017678, 1, 0, 0.827451, 1,
1.121809, 1.166082, -1.112465, 1, 0, 0.8235294, 1,
1.122043, 0.8364962, 1.183465, 1, 0, 0.8156863, 1,
1.129097, 1.982854, 2.288924, 1, 0, 0.8117647, 1,
1.129194, 1.127676, 1.635183, 1, 0, 0.8039216, 1,
1.133802, 0.8751388, 1.571352, 1, 0, 0.7960784, 1,
1.133981, -0.2273768, -0.6580576, 1, 0, 0.7921569, 1,
1.134722, 0.9574181, 0.5212646, 1, 0, 0.7843137, 1,
1.140352, -0.7230026, 1.371558, 1, 0, 0.7803922, 1,
1.144899, 0.01470678, 1.988607, 1, 0, 0.772549, 1,
1.158377, -0.01973163, 2.553054, 1, 0, 0.7686275, 1,
1.15845, -0.1329303, 1.555569, 1, 0, 0.7607843, 1,
1.165997, -0.9256763, 2.13476, 1, 0, 0.7568628, 1,
1.166748, 0.7952126, 0.3756474, 1, 0, 0.7490196, 1,
1.185508, -1.038492, 3.175475, 1, 0, 0.7450981, 1,
1.187765, -0.1055535, 2.147215, 1, 0, 0.7372549, 1,
1.197361, 0.2255831, 0.897382, 1, 0, 0.7333333, 1,
1.201035, 0.1325567, -1.729591, 1, 0, 0.7254902, 1,
1.210244, 1.512987, 0.4642953, 1, 0, 0.7215686, 1,
1.214125, 1.80491, 1.330351, 1, 0, 0.7137255, 1,
1.214929, -0.7903979, 4.418243, 1, 0, 0.7098039, 1,
1.218752, 1.778561, -0.9647799, 1, 0, 0.7019608, 1,
1.250367, -0.04364049, 1.308095, 1, 0, 0.6941177, 1,
1.25457, -0.2110357, 3.102875, 1, 0, 0.6901961, 1,
1.280713, 1.46068, 2.359123, 1, 0, 0.682353, 1,
1.283632, 0.2809319, 1.970272, 1, 0, 0.6784314, 1,
1.294832, -1.335524, 1.265407, 1, 0, 0.6705883, 1,
1.309369, 0.1703613, 0.7540135, 1, 0, 0.6666667, 1,
1.315779, -1.409129, 1.958882, 1, 0, 0.6588235, 1,
1.318942, -0.7687914, 1.38467, 1, 0, 0.654902, 1,
1.328326, 0.2399108, 1.565728, 1, 0, 0.6470588, 1,
1.329728, -0.3129829, 1.844486, 1, 0, 0.6431373, 1,
1.329861, -2.542832, 4.843169, 1, 0, 0.6352941, 1,
1.332059, -0.9723806, 3.003456, 1, 0, 0.6313726, 1,
1.343149, -0.8015223, 3.302474, 1, 0, 0.6235294, 1,
1.343579, -1.261521, 3.760053, 1, 0, 0.6196079, 1,
1.347254, -0.2659631, 1.25011, 1, 0, 0.6117647, 1,
1.36059, -1.415763, 1.908589, 1, 0, 0.6078432, 1,
1.370058, -0.8378102, 1.819002, 1, 0, 0.6, 1,
1.375979, -0.4221532, 1.37909, 1, 0, 0.5921569, 1,
1.381873, -0.5941005, 0.9450147, 1, 0, 0.5882353, 1,
1.393801, -0.02034177, 3.602272, 1, 0, 0.5803922, 1,
1.398565, -0.3818938, 2.456709, 1, 0, 0.5764706, 1,
1.400527, 1.667476, 0.909072, 1, 0, 0.5686275, 1,
1.40131, 1.617553, -1.238393, 1, 0, 0.5647059, 1,
1.403563, -1.435845, 1.480804, 1, 0, 0.5568628, 1,
1.40381, -0.187229, 2.034637, 1, 0, 0.5529412, 1,
1.409153, -0.1427016, 2.60889, 1, 0, 0.5450981, 1,
1.410393, -1.356802, 3.442478, 1, 0, 0.5411765, 1,
1.410411, 0.08485164, 0.9323568, 1, 0, 0.5333334, 1,
1.41565, 0.1777896, 1.072274, 1, 0, 0.5294118, 1,
1.416535, 1.213251, 0.8827022, 1, 0, 0.5215687, 1,
1.427698, -1.790248, 3.235321, 1, 0, 0.5176471, 1,
1.446292, 0.8705482, 1.794946, 1, 0, 0.509804, 1,
1.446349, -1.255881, 2.719514, 1, 0, 0.5058824, 1,
1.451555, -1.234624, 3.643749, 1, 0, 0.4980392, 1,
1.455699, 0.3601638, 1.181054, 1, 0, 0.4901961, 1,
1.457642, -0.3045006, 1.867439, 1, 0, 0.4862745, 1,
1.459329, -0.2657218, 1.428157, 1, 0, 0.4784314, 1,
1.468009, 1.171061, 1.426672, 1, 0, 0.4745098, 1,
1.469963, -0.4114894, 0.404491, 1, 0, 0.4666667, 1,
1.475713, 1.490638, 0.5226222, 1, 0, 0.4627451, 1,
1.483664, -0.5287828, 3.226285, 1, 0, 0.454902, 1,
1.491248, 1.603322, 1.631643, 1, 0, 0.4509804, 1,
1.495875, -1.586219, 3.50536, 1, 0, 0.4431373, 1,
1.497266, 0.4646243, 2.279588, 1, 0, 0.4392157, 1,
1.497846, 0.5702245, 1.220607, 1, 0, 0.4313726, 1,
1.505137, -2.179738, 1.730155, 1, 0, 0.427451, 1,
1.507628, -0.4960775, 2.47197, 1, 0, 0.4196078, 1,
1.509314, 1.4318, 0.6564664, 1, 0, 0.4156863, 1,
1.509462, 0.006073084, 0.9318797, 1, 0, 0.4078431, 1,
1.519371, -0.3305217, 2.363996, 1, 0, 0.4039216, 1,
1.524138, 0.4147073, 1.717495, 1, 0, 0.3960784, 1,
1.530314, 0.03981138, 1.917792, 1, 0, 0.3882353, 1,
1.531076, 0.1680703, 1.0702, 1, 0, 0.3843137, 1,
1.536765, -2.283356, 3.017365, 1, 0, 0.3764706, 1,
1.541772, -0.5322549, 2.806352, 1, 0, 0.372549, 1,
1.554042, 1.808006, 1.513945, 1, 0, 0.3647059, 1,
1.563565, 0.2828169, 0.9839982, 1, 0, 0.3607843, 1,
1.584932, -0.7265718, 2.052839, 1, 0, 0.3529412, 1,
1.592603, -0.07572857, 1.336704, 1, 0, 0.3490196, 1,
1.59476, -0.5934668, 2.540154, 1, 0, 0.3411765, 1,
1.607157, -0.8989584, 3.155632, 1, 0, 0.3372549, 1,
1.636748, -0.1331168, 0.2204342, 1, 0, 0.3294118, 1,
1.652444, -0.6127934, 2.328726, 1, 0, 0.3254902, 1,
1.662068, 0.4801944, 1.947326, 1, 0, 0.3176471, 1,
1.663656, -0.5868191, 1.883564, 1, 0, 0.3137255, 1,
1.671111, 0.1443387, 1.076727, 1, 0, 0.3058824, 1,
1.67609, -0.04113692, 1.834627, 1, 0, 0.2980392, 1,
1.676576, -0.7424054, 1.78516, 1, 0, 0.2941177, 1,
1.713407, -1.7409, 3.027743, 1, 0, 0.2862745, 1,
1.734715, -1.007291, 1.673665, 1, 0, 0.282353, 1,
1.736687, 0.4384835, 1.862374, 1, 0, 0.2745098, 1,
1.747482, 0.2522403, 2.597158, 1, 0, 0.2705882, 1,
1.747577, -0.3928401, 2.582461, 1, 0, 0.2627451, 1,
1.750718, 0.4712999, 1.650264, 1, 0, 0.2588235, 1,
1.750916, 1.60154, 0.8074731, 1, 0, 0.2509804, 1,
1.752196, 2.002941, 0.9113072, 1, 0, 0.2470588, 1,
1.759478, -0.2184526, 0.4624609, 1, 0, 0.2392157, 1,
1.770222, 1.167297, 2.398384, 1, 0, 0.2352941, 1,
1.770622, -2.395557, 1.819376, 1, 0, 0.227451, 1,
1.78029, -0.143296, 1.54283, 1, 0, 0.2235294, 1,
1.807425, -0.5211658, 1.242475, 1, 0, 0.2156863, 1,
1.811876, 2.799243, 0.4202102, 1, 0, 0.2117647, 1,
1.81798, -0.3330839, 1.872075, 1, 0, 0.2039216, 1,
1.829967, 0.524796, 1.793877, 1, 0, 0.1960784, 1,
1.832723, -0.5596697, 2.849955, 1, 0, 0.1921569, 1,
1.83436, -0.1107553, 1.908826, 1, 0, 0.1843137, 1,
1.844745, -0.1819676, 2.955429, 1, 0, 0.1803922, 1,
1.847635, -0.2931101, 0.6946278, 1, 0, 0.172549, 1,
1.8601, 0.6025292, 0.01920591, 1, 0, 0.1686275, 1,
1.911418, 0.1669471, -0.06968053, 1, 0, 0.1607843, 1,
1.933636, 0.3233092, 2.101083, 1, 0, 0.1568628, 1,
1.951291, -0.6982393, 0.4418204, 1, 0, 0.1490196, 1,
1.952064, -0.9616874, 3.759746, 1, 0, 0.145098, 1,
1.985233, 0.7940748, 0.6528277, 1, 0, 0.1372549, 1,
1.986912, 0.8309664, 0.4657972, 1, 0, 0.1333333, 1,
2.017334, -0.5418037, 2.201599, 1, 0, 0.1254902, 1,
2.018288, 0.6685832, 1.869494, 1, 0, 0.1215686, 1,
2.056888, -0.4218262, 2.404003, 1, 0, 0.1137255, 1,
2.155605, -0.7670323, 1.5402, 1, 0, 0.1098039, 1,
2.185137, 0.2612764, 0.6484839, 1, 0, 0.1019608, 1,
2.224711, 0.008960375, 2.59847, 1, 0, 0.09411765, 1,
2.254679, -0.2229163, 1.869929, 1, 0, 0.09019608, 1,
2.260123, -1.072773, 2.512495, 1, 0, 0.08235294, 1,
2.300659, 0.7832929, 0.4434827, 1, 0, 0.07843138, 1,
2.320322, -0.7375649, 3.725415, 1, 0, 0.07058824, 1,
2.378096, 1.885436, -0.3548302, 1, 0, 0.06666667, 1,
2.427491, -0.7001219, 1.885045, 1, 0, 0.05882353, 1,
2.427919, 0.5028139, 1.356108, 1, 0, 0.05490196, 1,
2.446157, 1.220772, -0.1141763, 1, 0, 0.04705882, 1,
2.5268, -0.5097716, 1.951762, 1, 0, 0.04313726, 1,
2.554878, 1.172695, 0.6324712, 1, 0, 0.03529412, 1,
2.668859, -0.8756121, 2.474555, 1, 0, 0.03137255, 1,
2.697612, 0.1701825, 1.184743, 1, 0, 0.02352941, 1,
2.716411, -1.282948, 3.204755, 1, 0, 0.01960784, 1,
2.887907, -1.295055, 3.738194, 1, 0, 0.01176471, 1,
2.896847, 1.541327, 0.01774465, 1, 0, 0.007843138, 1
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
-0.06098616, -5.05682, -7.224723, 0, -0.5, 0.5, 0.5,
-0.06098616, -5.05682, -7.224723, 1, -0.5, 0.5, 0.5,
-0.06098616, -5.05682, -7.224723, 1, 1.5, 0.5, 0.5,
-0.06098616, -5.05682, -7.224723, 0, 1.5, 0.5, 0.5
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
-4.021525, -0.4108143, -7.224723, 0, -0.5, 0.5, 0.5,
-4.021525, -0.4108143, -7.224723, 1, -0.5, 0.5, 0.5,
-4.021525, -0.4108143, -7.224723, 1, 1.5, 0.5, 0.5,
-4.021525, -0.4108143, -7.224723, 0, 1.5, 0.5, 0.5
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
-4.021525, -5.05682, -0.02832603, 0, -0.5, 0.5, 0.5,
-4.021525, -5.05682, -0.02832603, 1, -0.5, 0.5, 0.5,
-4.021525, -5.05682, -0.02832603, 1, 1.5, 0.5, 0.5,
-4.021525, -5.05682, -0.02832603, 0, 1.5, 0.5, 0.5
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
-3, -3.984665, -5.564016,
2, -3.984665, -5.564016,
-3, -3.984665, -5.564016,
-3, -4.163357, -5.840801,
-2, -3.984665, -5.564016,
-2, -4.163357, -5.840801,
-1, -3.984665, -5.564016,
-1, -4.163357, -5.840801,
0, -3.984665, -5.564016,
0, -4.163357, -5.840801,
1, -3.984665, -5.564016,
1, -4.163357, -5.840801,
2, -3.984665, -5.564016,
2, -4.163357, -5.840801
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
-3, -4.520742, -6.39437, 0, -0.5, 0.5, 0.5,
-3, -4.520742, -6.39437, 1, -0.5, 0.5, 0.5,
-3, -4.520742, -6.39437, 1, 1.5, 0.5, 0.5,
-3, -4.520742, -6.39437, 0, 1.5, 0.5, 0.5,
-2, -4.520742, -6.39437, 0, -0.5, 0.5, 0.5,
-2, -4.520742, -6.39437, 1, -0.5, 0.5, 0.5,
-2, -4.520742, -6.39437, 1, 1.5, 0.5, 0.5,
-2, -4.520742, -6.39437, 0, 1.5, 0.5, 0.5,
-1, -4.520742, -6.39437, 0, -0.5, 0.5, 0.5,
-1, -4.520742, -6.39437, 1, -0.5, 0.5, 0.5,
-1, -4.520742, -6.39437, 1, 1.5, 0.5, 0.5,
-1, -4.520742, -6.39437, 0, 1.5, 0.5, 0.5,
0, -4.520742, -6.39437, 0, -0.5, 0.5, 0.5,
0, -4.520742, -6.39437, 1, -0.5, 0.5, 0.5,
0, -4.520742, -6.39437, 1, 1.5, 0.5, 0.5,
0, -4.520742, -6.39437, 0, 1.5, 0.5, 0.5,
1, -4.520742, -6.39437, 0, -0.5, 0.5, 0.5,
1, -4.520742, -6.39437, 1, -0.5, 0.5, 0.5,
1, -4.520742, -6.39437, 1, 1.5, 0.5, 0.5,
1, -4.520742, -6.39437, 0, 1.5, 0.5, 0.5,
2, -4.520742, -6.39437, 0, -0.5, 0.5, 0.5,
2, -4.520742, -6.39437, 1, -0.5, 0.5, 0.5,
2, -4.520742, -6.39437, 1, 1.5, 0.5, 0.5,
2, -4.520742, -6.39437, 0, 1.5, 0.5, 0.5
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
-3.107555, -3, -5.564016,
-3.107555, 3, -5.564016,
-3.107555, -3, -5.564016,
-3.259883, -3, -5.840801,
-3.107555, -2, -5.564016,
-3.259883, -2, -5.840801,
-3.107555, -1, -5.564016,
-3.259883, -1, -5.840801,
-3.107555, 0, -5.564016,
-3.259883, 0, -5.840801,
-3.107555, 1, -5.564016,
-3.259883, 1, -5.840801,
-3.107555, 2, -5.564016,
-3.259883, 2, -5.840801,
-3.107555, 3, -5.564016,
-3.259883, 3, -5.840801
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
-3.56454, -3, -6.39437, 0, -0.5, 0.5, 0.5,
-3.56454, -3, -6.39437, 1, -0.5, 0.5, 0.5,
-3.56454, -3, -6.39437, 1, 1.5, 0.5, 0.5,
-3.56454, -3, -6.39437, 0, 1.5, 0.5, 0.5,
-3.56454, -2, -6.39437, 0, -0.5, 0.5, 0.5,
-3.56454, -2, -6.39437, 1, -0.5, 0.5, 0.5,
-3.56454, -2, -6.39437, 1, 1.5, 0.5, 0.5,
-3.56454, -2, -6.39437, 0, 1.5, 0.5, 0.5,
-3.56454, -1, -6.39437, 0, -0.5, 0.5, 0.5,
-3.56454, -1, -6.39437, 1, -0.5, 0.5, 0.5,
-3.56454, -1, -6.39437, 1, 1.5, 0.5, 0.5,
-3.56454, -1, -6.39437, 0, 1.5, 0.5, 0.5,
-3.56454, 0, -6.39437, 0, -0.5, 0.5, 0.5,
-3.56454, 0, -6.39437, 1, -0.5, 0.5, 0.5,
-3.56454, 0, -6.39437, 1, 1.5, 0.5, 0.5,
-3.56454, 0, -6.39437, 0, 1.5, 0.5, 0.5,
-3.56454, 1, -6.39437, 0, -0.5, 0.5, 0.5,
-3.56454, 1, -6.39437, 1, -0.5, 0.5, 0.5,
-3.56454, 1, -6.39437, 1, 1.5, 0.5, 0.5,
-3.56454, 1, -6.39437, 0, 1.5, 0.5, 0.5,
-3.56454, 2, -6.39437, 0, -0.5, 0.5, 0.5,
-3.56454, 2, -6.39437, 1, -0.5, 0.5, 0.5,
-3.56454, 2, -6.39437, 1, 1.5, 0.5, 0.5,
-3.56454, 2, -6.39437, 0, 1.5, 0.5, 0.5,
-3.56454, 3, -6.39437, 0, -0.5, 0.5, 0.5,
-3.56454, 3, -6.39437, 1, -0.5, 0.5, 0.5,
-3.56454, 3, -6.39437, 1, 1.5, 0.5, 0.5,
-3.56454, 3, -6.39437, 0, 1.5, 0.5, 0.5
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
-3.107555, -3.984665, -4,
-3.107555, -3.984665, 4,
-3.107555, -3.984665, -4,
-3.259883, -4.163357, -4,
-3.107555, -3.984665, -2,
-3.259883, -4.163357, -2,
-3.107555, -3.984665, 0,
-3.259883, -4.163357, 0,
-3.107555, -3.984665, 2,
-3.259883, -4.163357, 2,
-3.107555, -3.984665, 4,
-3.259883, -4.163357, 4
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
-3.56454, -4.520742, -4, 0, -0.5, 0.5, 0.5,
-3.56454, -4.520742, -4, 1, -0.5, 0.5, 0.5,
-3.56454, -4.520742, -4, 1, 1.5, 0.5, 0.5,
-3.56454, -4.520742, -4, 0, 1.5, 0.5, 0.5,
-3.56454, -4.520742, -2, 0, -0.5, 0.5, 0.5,
-3.56454, -4.520742, -2, 1, -0.5, 0.5, 0.5,
-3.56454, -4.520742, -2, 1, 1.5, 0.5, 0.5,
-3.56454, -4.520742, -2, 0, 1.5, 0.5, 0.5,
-3.56454, -4.520742, 0, 0, -0.5, 0.5, 0.5,
-3.56454, -4.520742, 0, 1, -0.5, 0.5, 0.5,
-3.56454, -4.520742, 0, 1, 1.5, 0.5, 0.5,
-3.56454, -4.520742, 0, 0, 1.5, 0.5, 0.5,
-3.56454, -4.520742, 2, 0, -0.5, 0.5, 0.5,
-3.56454, -4.520742, 2, 1, -0.5, 0.5, 0.5,
-3.56454, -4.520742, 2, 1, 1.5, 0.5, 0.5,
-3.56454, -4.520742, 2, 0, 1.5, 0.5, 0.5,
-3.56454, -4.520742, 4, 0, -0.5, 0.5, 0.5,
-3.56454, -4.520742, 4, 1, -0.5, 0.5, 0.5,
-3.56454, -4.520742, 4, 1, 1.5, 0.5, 0.5,
-3.56454, -4.520742, 4, 0, 1.5, 0.5, 0.5
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
-3.107555, -3.984665, -5.564016,
-3.107555, 3.163036, -5.564016,
-3.107555, -3.984665, 5.507364,
-3.107555, 3.163036, 5.507364,
-3.107555, -3.984665, -5.564016,
-3.107555, -3.984665, 5.507364,
-3.107555, 3.163036, -5.564016,
-3.107555, 3.163036, 5.507364,
-3.107555, -3.984665, -5.564016,
2.985583, -3.984665, -5.564016,
-3.107555, -3.984665, 5.507364,
2.985583, -3.984665, 5.507364,
-3.107555, 3.163036, -5.564016,
2.985583, 3.163036, -5.564016,
-3.107555, 3.163036, 5.507364,
2.985583, 3.163036, 5.507364,
2.985583, -3.984665, -5.564016,
2.985583, 3.163036, -5.564016,
2.985583, -3.984665, 5.507364,
2.985583, 3.163036, 5.507364,
2.985583, -3.984665, -5.564016,
2.985583, -3.984665, 5.507364,
2.985583, 3.163036, -5.564016,
2.985583, 3.163036, 5.507364
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
var radius = 7.752681;
var distance = 34.49255;
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
mvMatrix.translate( 0.06098616, 0.4108143, 0.02832603 );
mvMatrix.scale( 1.375704, 1.172734, 0.7571189 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.49255);
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
molinate<-read.table("molinate.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-molinate$V2
```

```
## Error in eval(expr, envir, enclos): object 'molinate' not found
```

```r
y<-molinate$V3
```

```
## Error in eval(expr, envir, enclos): object 'molinate' not found
```

```r
z<-molinate$V4
```

```
## Error in eval(expr, envir, enclos): object 'molinate' not found
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
-3.01882, -0.5178174, -1.754461, 0, 0, 1, 1, 1,
-2.90794, -0.409636, -1.945405, 1, 0, 0, 1, 1,
-2.79318, -0.6766462, -2.546986, 1, 0, 0, 1, 1,
-2.694319, -3.498739, -2.841639, 1, 0, 0, 1, 1,
-2.62168, 1.153286, -0.3639951, 1, 0, 0, 1, 1,
-2.616668, 0.2847733, -0.3332266, 1, 0, 0, 1, 1,
-2.616613, -0.9383903, -1.447156, 0, 0, 0, 1, 1,
-2.572596, 0.03503242, -1.881808, 0, 0, 0, 1, 1,
-2.571039, -1.121637, -1.832434, 0, 0, 0, 1, 1,
-2.464873, -0.3789723, -1.670803, 0, 0, 0, 1, 1,
-2.34888, 0.3034824, -0.8152319, 0, 0, 0, 1, 1,
-2.294323, 0.5224621, -2.483708, 0, 0, 0, 1, 1,
-2.24499, 1.948949, -0.6329477, 0, 0, 0, 1, 1,
-2.244561, -0.5129601, -0.4725108, 1, 1, 1, 1, 1,
-2.235553, -2.225053, -1.37714, 1, 1, 1, 1, 1,
-2.219104, -0.7982922, -1.595878, 1, 1, 1, 1, 1,
-2.203347, -0.08474801, -3.100489, 1, 1, 1, 1, 1,
-2.201735, -0.9126214, -1.413943, 1, 1, 1, 1, 1,
-2.19104, 0.3986934, -1.901337, 1, 1, 1, 1, 1,
-2.130595, 0.01907028, -0.3936196, 1, 1, 1, 1, 1,
-2.103367, -0.05789192, -1.940077, 1, 1, 1, 1, 1,
-2.100765, -0.2470811, -0.6826006, 1, 1, 1, 1, 1,
-2.024665, 0.7250655, -2.304743, 1, 1, 1, 1, 1,
-1.993174, -0.3793263, -0.7715316, 1, 1, 1, 1, 1,
-1.9814, 0.9807118, -0.817011, 1, 1, 1, 1, 1,
-1.953645, -0.2858113, -1.496519, 1, 1, 1, 1, 1,
-1.946565, 1.32072, 0.2895435, 1, 1, 1, 1, 1,
-1.946517, -1.183071, -0.03620869, 1, 1, 1, 1, 1,
-1.917198, 0.3389294, -0.7023323, 0, 0, 1, 1, 1,
-1.884137, -0.5651162, -2.566858, 1, 0, 0, 1, 1,
-1.825437, -0.511699, -0.4864067, 1, 0, 0, 1, 1,
-1.825218, -1.384141, -2.167945, 1, 0, 0, 1, 1,
-1.818855, 0.2194342, -1.458778, 1, 0, 0, 1, 1,
-1.815488, -0.8765087, -1.083945, 1, 0, 0, 1, 1,
-1.809946, 0.1265304, -2.956894, 0, 0, 0, 1, 1,
-1.790373, 0.2858564, -2.480506, 0, 0, 0, 1, 1,
-1.790267, 1.246179, 0.1488753, 0, 0, 0, 1, 1,
-1.761952, -1.492782, -1.348313, 0, 0, 0, 1, 1,
-1.757646, 0.0186871, -3.091541, 0, 0, 0, 1, 1,
-1.751474, 2.324411, 0.06557557, 0, 0, 0, 1, 1,
-1.748095, -0.2551733, -2.776834, 0, 0, 0, 1, 1,
-1.743192, 0.858954, -0.2398336, 1, 1, 1, 1, 1,
-1.736219, 0.8436224, -1.608049, 1, 1, 1, 1, 1,
-1.718697, -0.7429434, -1.82621, 1, 1, 1, 1, 1,
-1.71771, 1.39028, -1.496636, 1, 1, 1, 1, 1,
-1.707046, 0.379539, -1.340365, 1, 1, 1, 1, 1,
-1.700105, 0.1429368, -1.250397, 1, 1, 1, 1, 1,
-1.696169, -0.2529094, -2.838567, 1, 1, 1, 1, 1,
-1.690068, 0.2294641, -2.709914, 1, 1, 1, 1, 1,
-1.683902, 0.7164473, -2.448078, 1, 1, 1, 1, 1,
-1.677649, 0.6592739, -2.962803, 1, 1, 1, 1, 1,
-1.673934, 0.7543069, -1.21953, 1, 1, 1, 1, 1,
-1.660481, -0.5578079, -0.8747122, 1, 1, 1, 1, 1,
-1.657723, 0.622637, 0.002768955, 1, 1, 1, 1, 1,
-1.654649, -2.049928, -1.286463, 1, 1, 1, 1, 1,
-1.651406, -0.3325147, -0.4601491, 1, 1, 1, 1, 1,
-1.639504, 0.7050514, -1.575426, 0, 0, 1, 1, 1,
-1.631238, -1.027339, -1.794535, 1, 0, 0, 1, 1,
-1.626407, 0.4982026, -1.451603, 1, 0, 0, 1, 1,
-1.613352, -0.5006526, -0.7724833, 1, 0, 0, 1, 1,
-1.604843, 0.722845, -4.478089, 1, 0, 0, 1, 1,
-1.601628, 1.177165, -0.3725732, 1, 0, 0, 1, 1,
-1.59823, 1.714192, -1.156242, 0, 0, 0, 1, 1,
-1.589312, -0.4671394, -2.374816, 0, 0, 0, 1, 1,
-1.585322, 0.4597876, -2.136485, 0, 0, 0, 1, 1,
-1.579439, 1.60586, -1.710859, 0, 0, 0, 1, 1,
-1.540211, 1.054901, -0.5532548, 0, 0, 0, 1, 1,
-1.536923, -1.979051, -1.159185, 0, 0, 0, 1, 1,
-1.533751, 0.3109914, -1.604756, 0, 0, 0, 1, 1,
-1.530843, 1.480334, 0.06673993, 1, 1, 1, 1, 1,
-1.505042, 1.050286, 1.173478, 1, 1, 1, 1, 1,
-1.499371, 0.3537578, -2.316048, 1, 1, 1, 1, 1,
-1.484711, -2.86634, -2.443267, 1, 1, 1, 1, 1,
-1.477812, -0.06335793, 0.4039865, 1, 1, 1, 1, 1,
-1.47521, -0.5106807, -1.039469, 1, 1, 1, 1, 1,
-1.452038, -0.2166221, -0.2632543, 1, 1, 1, 1, 1,
-1.448799, 0.3383643, -0.1098936, 1, 1, 1, 1, 1,
-1.429634, -2.973701, -1.944045, 1, 1, 1, 1, 1,
-1.427051, -0.1584188, -3.077269, 1, 1, 1, 1, 1,
-1.389028, -1.247317, -2.709918, 1, 1, 1, 1, 1,
-1.38642, -1.043609, -3.222533, 1, 1, 1, 1, 1,
-1.384932, -0.7442682, -1.337541, 1, 1, 1, 1, 1,
-1.381822, -0.8533309, -1.161496, 1, 1, 1, 1, 1,
-1.379427, -0.8435478, -0.5763488, 1, 1, 1, 1, 1,
-1.37576, 0.4034652, -1.556513, 0, 0, 1, 1, 1,
-1.368387, -1.520975, -2.751837, 1, 0, 0, 1, 1,
-1.362858, -0.3551157, -1.569055, 1, 0, 0, 1, 1,
-1.361444, 0.9519634, -1.44754, 1, 0, 0, 1, 1,
-1.358704, 0.4435474, -1.155535, 1, 0, 0, 1, 1,
-1.356809, 0.379763, -1.353093, 1, 0, 0, 1, 1,
-1.344712, 1.109963, -2.04335, 0, 0, 0, 1, 1,
-1.342135, 0.4858683, -1.246894, 0, 0, 0, 1, 1,
-1.339413, 0.2478465, -2.117007, 0, 0, 0, 1, 1,
-1.336651, -0.1924134, -0.3242441, 0, 0, 0, 1, 1,
-1.335022, -0.3189952, -0.2675467, 0, 0, 0, 1, 1,
-1.315974, -0.9377979, -3.176194, 0, 0, 0, 1, 1,
-1.311721, 0.3737771, 0.6165279, 0, 0, 0, 1, 1,
-1.311297, 0.9566439, 0.6415223, 1, 1, 1, 1, 1,
-1.307798, 0.003858813, -2.693767, 1, 1, 1, 1, 1,
-1.29815, -0.5934221, -1.532278, 1, 1, 1, 1, 1,
-1.296774, -0.272004, -1.716173, 1, 1, 1, 1, 1,
-1.291637, -0.3286815, -3.216477, 1, 1, 1, 1, 1,
-1.284085, 1.081091, -1.085318, 1, 1, 1, 1, 1,
-1.275217, -0.5910527, -4.095045, 1, 1, 1, 1, 1,
-1.274934, -0.3452248, -1.795645, 1, 1, 1, 1, 1,
-1.253535, 1.720659, 0.2410566, 1, 1, 1, 1, 1,
-1.250834, 0.6961218, -0.8520509, 1, 1, 1, 1, 1,
-1.250201, 0.04962073, -0.8779254, 1, 1, 1, 1, 1,
-1.250103, -0.7596082, -4.001492, 1, 1, 1, 1, 1,
-1.247276, -1.785331, -3.112379, 1, 1, 1, 1, 1,
-1.245124, -1.249435, -3.250034, 1, 1, 1, 1, 1,
-1.243731, -0.1066979, -1.99196, 1, 1, 1, 1, 1,
-1.24216, -1.362541, -2.427971, 0, 0, 1, 1, 1,
-1.230671, 1.141464, -0.865751, 1, 0, 0, 1, 1,
-1.224251, -0.5283048, -0.8812007, 1, 0, 0, 1, 1,
-1.210937, -0.9787565, -1.670203, 1, 0, 0, 1, 1,
-1.200776, 1.320793, 1.185796, 1, 0, 0, 1, 1,
-1.191509, 1.063286, -3.066604, 1, 0, 0, 1, 1,
-1.190457, 0.5588718, -0.7178618, 0, 0, 0, 1, 1,
-1.188883, -1.230988, -1.92975, 0, 0, 0, 1, 1,
-1.188558, 1.163281, 1.546863, 0, 0, 0, 1, 1,
-1.186613, -0.9643905, -1.309616, 0, 0, 0, 1, 1,
-1.184484, -0.1967481, 0.7326093, 0, 0, 0, 1, 1,
-1.18379, 0.07146796, -2.830286, 0, 0, 0, 1, 1,
-1.182969, 0.483196, -2.675493, 0, 0, 0, 1, 1,
-1.176558, -0.9798889, -1.924934, 1, 1, 1, 1, 1,
-1.175093, 0.09064607, -1.972172, 1, 1, 1, 1, 1,
-1.175043, -1.443207, -1.750075, 1, 1, 1, 1, 1,
-1.169831, 0.4058404, -0.2002599, 1, 1, 1, 1, 1,
-1.1697, 1.977065, -1.24435, 1, 1, 1, 1, 1,
-1.167507, -0.1344705, -3.000812, 1, 1, 1, 1, 1,
-1.160688, 1.705516, -0.1304227, 1, 1, 1, 1, 1,
-1.14796, 1.268076, -4.220542, 1, 1, 1, 1, 1,
-1.145648, -0.8345843, -3.416004, 1, 1, 1, 1, 1,
-1.145456, 0.3175522, 0.1018457, 1, 1, 1, 1, 1,
-1.141129, -0.02061154, -0.5688094, 1, 1, 1, 1, 1,
-1.137138, -1.622611, -0.2633396, 1, 1, 1, 1, 1,
-1.133767, 0.7594592, -1.111238, 1, 1, 1, 1, 1,
-1.129252, -1.103112, -2.65936, 1, 1, 1, 1, 1,
-1.120991, -0.3059917, -1.842418, 1, 1, 1, 1, 1,
-1.118874, 1.069576, -0.4825259, 0, 0, 1, 1, 1,
-1.117234, 0.3161844, -1.367705, 1, 0, 0, 1, 1,
-1.116069, -0.07531049, -1.092555, 1, 0, 0, 1, 1,
-1.105849, 1.570196, -1.839712, 1, 0, 0, 1, 1,
-1.090017, 0.2524332, -2.442812, 1, 0, 0, 1, 1,
-1.081948, 0.3010117, -2.879893, 1, 0, 0, 1, 1,
-1.078531, -0.2158054, -1.927754, 0, 0, 0, 1, 1,
-1.070904, 1.07769, -2.223361, 0, 0, 0, 1, 1,
-1.066665, 0.5317333, -0.7342755, 0, 0, 0, 1, 1,
-1.052792, -0.1724459, -2.79814, 0, 0, 0, 1, 1,
-1.050499, -0.05737106, -1.995255, 0, 0, 0, 1, 1,
-1.044561, 1.811595, 0.1123153, 0, 0, 0, 1, 1,
-1.043227, 0.9089184, -1.615285, 0, 0, 0, 1, 1,
-1.035631, 0.8418173, 0.772139, 1, 1, 1, 1, 1,
-1.034466, 0.06572372, -1.809154, 1, 1, 1, 1, 1,
-1.031074, -0.4437906, -1.536341, 1, 1, 1, 1, 1,
-1.025774, 0.02409589, -2.438177, 1, 1, 1, 1, 1,
-1.012537, -0.02406433, -1.678342, 1, 1, 1, 1, 1,
-1.011556, 0.08047824, -1.582802, 1, 1, 1, 1, 1,
-1.011134, -0.4977368, -1.155385, 1, 1, 1, 1, 1,
-0.9926252, -1.248645, -1.100803, 1, 1, 1, 1, 1,
-0.98177, 1.536557, -2.638929, 1, 1, 1, 1, 1,
-0.9775296, -0.4707053, -1.828722, 1, 1, 1, 1, 1,
-0.9746749, -0.6420833, -2.757777, 1, 1, 1, 1, 1,
-0.971203, -1.102401, -4.789914, 1, 1, 1, 1, 1,
-0.9666475, 1.303954, -0.4437239, 1, 1, 1, 1, 1,
-0.9588359, -0.4060802, -1.243091, 1, 1, 1, 1, 1,
-0.9501157, 0.416214, -1.747155, 1, 1, 1, 1, 1,
-0.9475308, -1.159538, -2.585491, 0, 0, 1, 1, 1,
-0.9458422, -0.5553397, -2.150078, 1, 0, 0, 1, 1,
-0.9392028, 0.1443086, -2.785498, 1, 0, 0, 1, 1,
-0.9353366, 1.059763, -0.3502074, 1, 0, 0, 1, 1,
-0.9338987, 1.226316, -2.362965, 1, 0, 0, 1, 1,
-0.9320813, 0.4703006, 0.09312674, 1, 0, 0, 1, 1,
-0.9314081, 0.6545502, -0.003825218, 0, 0, 0, 1, 1,
-0.9287122, -0.886281, -0.896194, 0, 0, 0, 1, 1,
-0.9160826, 0.7767448, -0.68353, 0, 0, 0, 1, 1,
-0.909638, 0.246661, -1.556179, 0, 0, 0, 1, 1,
-0.9076119, 0.4833142, -0.4298991, 0, 0, 0, 1, 1,
-0.9060547, -1.620028, -2.436088, 0, 0, 0, 1, 1,
-0.8989124, 0.3594545, -2.804052, 0, 0, 0, 1, 1,
-0.8983261, 0.3009608, -1.270612, 1, 1, 1, 1, 1,
-0.8927951, 0.1326332, -1.561075, 1, 1, 1, 1, 1,
-0.8897515, -0.7087532, -1.001852, 1, 1, 1, 1, 1,
-0.8771925, 0.1648196, -2.988264, 1, 1, 1, 1, 1,
-0.8735821, 0.1979329, -2.222471, 1, 1, 1, 1, 1,
-0.872604, 1.234473, -1.54474, 1, 1, 1, 1, 1,
-0.8625932, 2.971455, -0.8698804, 1, 1, 1, 1, 1,
-0.8557647, -0.1168555, -0.8542659, 1, 1, 1, 1, 1,
-0.8486391, -1.624379, -2.996422, 1, 1, 1, 1, 1,
-0.8473862, 0.133844, -1.971323, 1, 1, 1, 1, 1,
-0.845795, 1.249546, -0.637952, 1, 1, 1, 1, 1,
-0.8444592, 1.78986, 0.5715052, 1, 1, 1, 1, 1,
-0.8425463, -0.01320575, -2.737262, 1, 1, 1, 1, 1,
-0.8409092, 1.881024, -1.007557, 1, 1, 1, 1, 1,
-0.8329683, 0.06666958, -2.452506, 1, 1, 1, 1, 1,
-0.8276476, -0.9683089, -1.884303, 0, 0, 1, 1, 1,
-0.8251308, 0.3607659, -1.351562, 1, 0, 0, 1, 1,
-0.823698, 1.507088, -0.7643416, 1, 0, 0, 1, 1,
-0.8208628, -1.738482, -3.046869, 1, 0, 0, 1, 1,
-0.8201248, 2.817899, 1.849844, 1, 0, 0, 1, 1,
-0.8175603, 0.1498234, 0.03651711, 1, 0, 0, 1, 1,
-0.8138217, -0.6128495, -3.823345, 0, 0, 0, 1, 1,
-0.8112696, 2.351515, -0.2324846, 0, 0, 0, 1, 1,
-0.806513, 0.9072208, -1.133451, 0, 0, 0, 1, 1,
-0.8024176, 0.5943623, -0.8024613, 0, 0, 0, 1, 1,
-0.7924316, -0.4326091, 0.1321574, 0, 0, 0, 1, 1,
-0.7911302, -0.746223, -0.5928154, 0, 0, 0, 1, 1,
-0.7899845, -2.272966, -4.343978, 0, 0, 0, 1, 1,
-0.7896684, 0.4346676, -1.486506, 1, 1, 1, 1, 1,
-0.7855559, -0.8283638, -1.992426, 1, 1, 1, 1, 1,
-0.7825269, -0.06415176, -0.9387498, 1, 1, 1, 1, 1,
-0.7802319, 0.3985788, -2.328614, 1, 1, 1, 1, 1,
-0.768128, -0.06130561, -1.210891, 1, 1, 1, 1, 1,
-0.7636678, -0.8290139, -2.400905, 1, 1, 1, 1, 1,
-0.7628484, 0.4178801, -0.3965967, 1, 1, 1, 1, 1,
-0.7621292, -0.4629933, -0.4648454, 1, 1, 1, 1, 1,
-0.7583681, 0.8433537, -0.9946513, 1, 1, 1, 1, 1,
-0.7557387, 0.1052707, -1.618468, 1, 1, 1, 1, 1,
-0.7502971, -0.520133, -0.8801245, 1, 1, 1, 1, 1,
-0.7490069, -1.485047, -2.225538, 1, 1, 1, 1, 1,
-0.748735, -1.946649, -3.320123, 1, 1, 1, 1, 1,
-0.7466146, 1.17502, 0.08400288, 1, 1, 1, 1, 1,
-0.7447148, 0.8016446, -1.659663, 1, 1, 1, 1, 1,
-0.7445071, -1.529335, -2.841215, 0, 0, 1, 1, 1,
-0.7393759, -1.760167, -2.504541, 1, 0, 0, 1, 1,
-0.7387327, 0.9275119, 0.09290976, 1, 0, 0, 1, 1,
-0.7359423, 0.197856, -2.26071, 1, 0, 0, 1, 1,
-0.7320384, -0.9953431, -2.490879, 1, 0, 0, 1, 1,
-0.7185661, 2.027287, 0.04414855, 1, 0, 0, 1, 1,
-0.7163522, -0.3679897, -2.430862, 0, 0, 0, 1, 1,
-0.7162777, 1.511987, -0.3796908, 0, 0, 0, 1, 1,
-0.7138255, 1.53779, -1.123624, 0, 0, 0, 1, 1,
-0.7121885, 0.5869817, -2.305954, 0, 0, 0, 1, 1,
-0.7118657, 1.087035, 1.169183, 0, 0, 0, 1, 1,
-0.7114941, 0.6719013, -0.6490366, 0, 0, 0, 1, 1,
-0.7100594, 1.361606, 0.302956, 0, 0, 0, 1, 1,
-0.7030311, -0.2711485, -1.821405, 1, 1, 1, 1, 1,
-0.700237, -0.3483921, -1.258681, 1, 1, 1, 1, 1,
-0.6808821, 1.552287, 0.6431631, 1, 1, 1, 1, 1,
-0.6778498, 0.07679572, -1.021561, 1, 1, 1, 1, 1,
-0.6736888, 0.1011163, -2.761464, 1, 1, 1, 1, 1,
-0.6669579, -1.164658, -3.7351, 1, 1, 1, 1, 1,
-0.6610572, -0.8229151, -3.20004, 1, 1, 1, 1, 1,
-0.6576399, -0.3583622, -3.708184, 1, 1, 1, 1, 1,
-0.6561509, -0.4118018, -1.577941, 1, 1, 1, 1, 1,
-0.6559184, 0.8736053, -0.5475405, 1, 1, 1, 1, 1,
-0.65473, -0.5351374, -2.280444, 1, 1, 1, 1, 1,
-0.6441768, 1.092228, -0.9647305, 1, 1, 1, 1, 1,
-0.6425597, -0.2186067, -2.240932, 1, 1, 1, 1, 1,
-0.6421242, 1.162906, -1.435304, 1, 1, 1, 1, 1,
-0.6369885, -0.6615843, -1.874929, 1, 1, 1, 1, 1,
-0.6332477, -0.6962492, -3.968769, 0, 0, 1, 1, 1,
-0.6269221, 1.327057, -1.382569, 1, 0, 0, 1, 1,
-0.6231818, -0.4098413, -4.168234, 1, 0, 0, 1, 1,
-0.6193361, 0.07484823, -2.823919, 1, 0, 0, 1, 1,
-0.6180304, 1.113724, 0.08279549, 1, 0, 0, 1, 1,
-0.6147068, 0.03489076, -1.375352, 1, 0, 0, 1, 1,
-0.6118631, -0.2966596, -4.031408, 0, 0, 0, 1, 1,
-0.6106845, 0.5140603, -1.333247, 0, 0, 0, 1, 1,
-0.6091202, 0.574921, 0.3847461, 0, 0, 0, 1, 1,
-0.6088288, -0.7589785, -2.892635, 0, 0, 0, 1, 1,
-0.6043842, 1.079076, 0.9983082, 0, 0, 0, 1, 1,
-0.5983295, -0.7941716, -2.873687, 0, 0, 0, 1, 1,
-0.5964212, -0.4776887, -2.419029, 0, 0, 0, 1, 1,
-0.5937002, 0.0538157, -1.02834, 1, 1, 1, 1, 1,
-0.5930808, -0.09146666, -3.653822, 1, 1, 1, 1, 1,
-0.5877315, -0.1296235, -1.712893, 1, 1, 1, 1, 1,
-0.5861094, -0.1438583, -1.803982, 1, 1, 1, 1, 1,
-0.5839025, -0.5687701, -2.745319, 1, 1, 1, 1, 1,
-0.5786883, 0.0214647, -2.336705, 1, 1, 1, 1, 1,
-0.5720272, -0.02736079, -3.201424, 1, 1, 1, 1, 1,
-0.5698935, 1.522904, 2.55485, 1, 1, 1, 1, 1,
-0.5697753, -0.1376335, -2.652978, 1, 1, 1, 1, 1,
-0.5693676, -1.023646, -1.718034, 1, 1, 1, 1, 1,
-0.5675052, 0.2568539, -1.373046, 1, 1, 1, 1, 1,
-0.5616482, -1.918846, -3.139594, 1, 1, 1, 1, 1,
-0.5524608, 1.004893, -1.320775, 1, 1, 1, 1, 1,
-0.5507511, 0.812501, 0.2927421, 1, 1, 1, 1, 1,
-0.5408923, -0.637321, -2.027822, 1, 1, 1, 1, 1,
-0.5395541, 1.13511, 0.00939025, 0, 0, 1, 1, 1,
-0.5346497, -1.127274, -0.9195839, 1, 0, 0, 1, 1,
-0.534386, -0.4467014, -2.40247, 1, 0, 0, 1, 1,
-0.5334016, 1.086961, -0.4249308, 1, 0, 0, 1, 1,
-0.5312088, -1.806275, -3.109252, 1, 0, 0, 1, 1,
-0.5287026, -0.4325522, -2.208434, 1, 0, 0, 1, 1,
-0.5259323, 1.740918, -0.03834619, 0, 0, 0, 1, 1,
-0.5248088, -0.1169188, -2.03598, 0, 0, 0, 1, 1,
-0.5238773, 0.8004106, -0.9637843, 0, 0, 0, 1, 1,
-0.5238291, -0.1358084, -2.397819, 0, 0, 0, 1, 1,
-0.5221808, 0.1366687, -1.694766, 0, 0, 0, 1, 1,
-0.5203507, -0.7617701, 0.1487563, 0, 0, 0, 1, 1,
-0.5176008, -0.03110092, -0.8179621, 0, 0, 0, 1, 1,
-0.5170335, 1.258366, 1.209703, 1, 1, 1, 1, 1,
-0.5130052, 0.02836967, -3.302837, 1, 1, 1, 1, 1,
-0.5110943, -0.9109572, -2.514955, 1, 1, 1, 1, 1,
-0.5098425, 0.6205798, -0.6767127, 1, 1, 1, 1, 1,
-0.5006095, 0.7971321, -1.214103, 1, 1, 1, 1, 1,
-0.5002031, -0.2574307, -1.886972, 1, 1, 1, 1, 1,
-0.4995624, 2.736126, 1.339302, 1, 1, 1, 1, 1,
-0.4976382, -0.3897609, -0.4680458, 1, 1, 1, 1, 1,
-0.4948694, 1.355326, -0.02719224, 1, 1, 1, 1, 1,
-0.4938973, 0.5345623, -0.2813272, 1, 1, 1, 1, 1,
-0.4934203, 1.613075, -0.3808705, 1, 1, 1, 1, 1,
-0.483779, 0.7152967, -1.754306, 1, 1, 1, 1, 1,
-0.4809227, 0.6591195, -1.0662, 1, 1, 1, 1, 1,
-0.4776539, -0.3058536, -2.096936, 1, 1, 1, 1, 1,
-0.4753939, 2.059829, 0.4704308, 1, 1, 1, 1, 1,
-0.474994, 0.1061337, -2.267655, 0, 0, 1, 1, 1,
-0.4672132, 0.1985426, -2.368403, 1, 0, 0, 1, 1,
-0.4644995, -0.3525438, -0.4702345, 1, 0, 0, 1, 1,
-0.4591721, 1.057186, -1.040296, 1, 0, 0, 1, 1,
-0.4591529, 0.5123267, -1.111672, 1, 0, 0, 1, 1,
-0.4589827, -0.6177008, -3.526034, 1, 0, 0, 1, 1,
-0.4548908, -0.7089495, -4.776554, 0, 0, 0, 1, 1,
-0.4536669, -0.04267063, -2.834016, 0, 0, 0, 1, 1,
-0.4534709, -1.037542, -3.028645, 0, 0, 0, 1, 1,
-0.4508335, 0.8275335, -1.664062, 0, 0, 0, 1, 1,
-0.4426636, 2.294125, -1.107754, 0, 0, 0, 1, 1,
-0.4408441, 0.2543627, -1.809297, 0, 0, 0, 1, 1,
-0.4367041, -0.6826127, -1.814049, 0, 0, 0, 1, 1,
-0.4316707, -0.1520965, -1.266914, 1, 1, 1, 1, 1,
-0.4310097, -1.356919, -2.660205, 1, 1, 1, 1, 1,
-0.4303872, 0.1101081, -2.122669, 1, 1, 1, 1, 1,
-0.4284609, -1.471778, -2.841727, 1, 1, 1, 1, 1,
-0.4190834, 1.210656, -1.83656, 1, 1, 1, 1, 1,
-0.4168882, -0.2550465, -1.707222, 1, 1, 1, 1, 1,
-0.4130586, 0.7116085, -2.21998, 1, 1, 1, 1, 1,
-0.4108371, 0.5227724, -1.406448, 1, 1, 1, 1, 1,
-0.4076142, -0.1496611, -0.7782959, 1, 1, 1, 1, 1,
-0.4056933, -0.1483954, -2.366924, 1, 1, 1, 1, 1,
-0.3923659, 0.05941705, -2.141117, 1, 1, 1, 1, 1,
-0.3886132, -0.5660021, -1.19239, 1, 1, 1, 1, 1,
-0.3885615, 0.5310807, -0.1337666, 1, 1, 1, 1, 1,
-0.3864354, -0.397658, -1.239199, 1, 1, 1, 1, 1,
-0.3836898, 0.3479343, -0.8425823, 1, 1, 1, 1, 1,
-0.3827811, -0.234095, -2.104774, 0, 0, 1, 1, 1,
-0.3704767, 1.498357, -0.3078014, 1, 0, 0, 1, 1,
-0.3697302, -1.387502, -0.3778847, 1, 0, 0, 1, 1,
-0.3628117, -1.277201, -3.564449, 1, 0, 0, 1, 1,
-0.3608627, -0.6265971, -4.56242, 1, 0, 0, 1, 1,
-0.3604361, -3.880572, -4.295615, 1, 0, 0, 1, 1,
-0.356951, -0.4397137, -1.696892, 0, 0, 0, 1, 1,
-0.3549933, -1.66869, -1.664816, 0, 0, 0, 1, 1,
-0.3542632, 0.8911718, 0.6593378, 0, 0, 0, 1, 1,
-0.3532265, 0.4267064, -1.239022, 0, 0, 0, 1, 1,
-0.3517585, 0.5510817, -0.5253078, 0, 0, 0, 1, 1,
-0.3504498, -0.5667822, -3.204646, 0, 0, 0, 1, 1,
-0.3491156, -0.02418614, -2.628598, 0, 0, 0, 1, 1,
-0.3487689, -1.890972, -4.640485, 1, 1, 1, 1, 1,
-0.3472512, 0.5465016, -0.4291616, 1, 1, 1, 1, 1,
-0.3415957, -0.6539677, -3.230401, 1, 1, 1, 1, 1,
-0.3327041, -1.621793, -5.402782, 1, 1, 1, 1, 1,
-0.331385, -2.061589, -2.141473, 1, 1, 1, 1, 1,
-0.3306782, -2.100241, -4.779561, 1, 1, 1, 1, 1,
-0.3282284, 0.5308927, 1.542079, 1, 1, 1, 1, 1,
-0.3252706, -0.225898, -2.371571, 1, 1, 1, 1, 1,
-0.3225304, -0.07653282, -1.09724, 1, 1, 1, 1, 1,
-0.3217357, 0.7319176, -1.209778, 1, 1, 1, 1, 1,
-0.3208878, 0.2242146, -1.903044, 1, 1, 1, 1, 1,
-0.3186713, -0.5668056, -3.416347, 1, 1, 1, 1, 1,
-0.3156503, 0.7693548, 1.967177, 1, 1, 1, 1, 1,
-0.3076248, 0.657152, -0.5795909, 1, 1, 1, 1, 1,
-0.3055876, -0.01285573, 0.6285663, 1, 1, 1, 1, 1,
-0.3051707, 0.4581777, 1.497095, 0, 0, 1, 1, 1,
-0.3006537, 0.1617366, -1.339665, 1, 0, 0, 1, 1,
-0.3004782, -0.5348595, -4.125819, 1, 0, 0, 1, 1,
-0.2980198, 1.326154, 0.09633335, 1, 0, 0, 1, 1,
-0.295733, 0.4376651, -1.741769, 1, 0, 0, 1, 1,
-0.2956461, 0.9807792, 0.3678056, 1, 0, 0, 1, 1,
-0.2950043, 0.7686309, -0.06246043, 0, 0, 0, 1, 1,
-0.2922463, 1.459345, -0.5760056, 0, 0, 0, 1, 1,
-0.2883955, -1.195667, -2.879285, 0, 0, 0, 1, 1,
-0.2788662, 1.182855, 0.4216478, 0, 0, 0, 1, 1,
-0.2771666, -1.108822, -1.744659, 0, 0, 0, 1, 1,
-0.2763302, 0.6950341, -2.198561, 0, 0, 0, 1, 1,
-0.275648, -1.107295, -2.469563, 0, 0, 0, 1, 1,
-0.2751568, -2.125844, -2.876635, 1, 1, 1, 1, 1,
-0.2693237, -0.9318115, -2.804494, 1, 1, 1, 1, 1,
-0.2686314, -1.991101, -1.117836, 1, 1, 1, 1, 1,
-0.2667868, -1.497685, -4.556317, 1, 1, 1, 1, 1,
-0.2658408, -1.228056, -4.258057, 1, 1, 1, 1, 1,
-0.2622406, 0.8648065, -0.2439649, 1, 1, 1, 1, 1,
-0.2564419, 0.7746338, -1.887279, 1, 1, 1, 1, 1,
-0.250688, -0.3660848, -1.187969, 1, 1, 1, 1, 1,
-0.2485186, 0.3490929, -1.780849, 1, 1, 1, 1, 1,
-0.2479766, -0.2445292, -0.8009192, 1, 1, 1, 1, 1,
-0.2467805, -0.1839576, -3.16786, 1, 1, 1, 1, 1,
-0.2437642, -0.2158414, -2.853443, 1, 1, 1, 1, 1,
-0.2429767, 0.5083805, -2.907124, 1, 1, 1, 1, 1,
-0.2428723, -1.346248, -1.815871, 1, 1, 1, 1, 1,
-0.242608, 0.1607713, -0.4769136, 1, 1, 1, 1, 1,
-0.2406638, -0.1300791, -2.137861, 0, 0, 1, 1, 1,
-0.2333023, 1.281983, 0.1031039, 1, 0, 0, 1, 1,
-0.2327835, -0.6144465, -3.074074, 1, 0, 0, 1, 1,
-0.2310694, -1.078374, -2.45486, 1, 0, 0, 1, 1,
-0.2287431, -0.630228, -2.254666, 1, 0, 0, 1, 1,
-0.2205208, 0.2988871, -1.647496, 1, 0, 0, 1, 1,
-0.2119292, -0.9484925, -3.016602, 0, 0, 0, 1, 1,
-0.2088511, -1.052403, -2.611516, 0, 0, 0, 1, 1,
-0.2083758, 0.8307743, -0.1819045, 0, 0, 0, 1, 1,
-0.2062213, -0.5397001, -4.264453, 0, 0, 0, 1, 1,
-0.2045673, 1.674083, 1.106127, 0, 0, 0, 1, 1,
-0.2011729, 0.7886232, -0.1820532, 0, 0, 0, 1, 1,
-0.2007575, 0.8597978, 1.051076, 0, 0, 0, 1, 1,
-0.1996862, 0.7249711, 0.6020613, 1, 1, 1, 1, 1,
-0.1991386, -1.001485, -2.42242, 1, 1, 1, 1, 1,
-0.1990211, 1.993445, 0.01927094, 1, 1, 1, 1, 1,
-0.1942459, 0.1025208, -0.3873348, 1, 1, 1, 1, 1,
-0.1902167, 0.2512687, -1.243129, 1, 1, 1, 1, 1,
-0.1893854, 2.133313, -0.1228904, 1, 1, 1, 1, 1,
-0.1800795, 0.4285314, -0.1661888, 1, 1, 1, 1, 1,
-0.1778175, 0.7366883, 0.9272519, 1, 1, 1, 1, 1,
-0.1724841, 0.454385, -0.6681123, 1, 1, 1, 1, 1,
-0.1704847, 0.1969218, 0.1237239, 1, 1, 1, 1, 1,
-0.1664761, 0.6231585, 0.1318054, 1, 1, 1, 1, 1,
-0.1631626, 1.062473, 1.212556, 1, 1, 1, 1, 1,
-0.162411, 0.1351305, -2.06732, 1, 1, 1, 1, 1,
-0.1613661, 1.877435, 0.1979182, 1, 1, 1, 1, 1,
-0.1597201, 1.850782, -0.8140337, 1, 1, 1, 1, 1,
-0.1539739, 0.1942664, -0.6477559, 0, 0, 1, 1, 1,
-0.15108, 0.2586859, -1.418993, 1, 0, 0, 1, 1,
-0.1451062, 1.099396, 0.05771238, 1, 0, 0, 1, 1,
-0.1366377, -0.6629821, -4.282276, 1, 0, 0, 1, 1,
-0.135195, 0.1937088, -0.4454664, 1, 0, 0, 1, 1,
-0.1337738, 0.05156486, -0.7070047, 1, 0, 0, 1, 1,
-0.1323563, 0.6512582, 0.8747628, 0, 0, 0, 1, 1,
-0.1297919, 1.317053, 0.2616339, 0, 0, 0, 1, 1,
-0.1260588, -0.6182769, -4.503705, 0, 0, 0, 1, 1,
-0.1235798, 0.4160144, -0.3611844, 0, 0, 0, 1, 1,
-0.1158309, -1.155702, -3.375156, 0, 0, 0, 1, 1,
-0.1158067, -1.34764, -1.145201, 0, 0, 0, 1, 1,
-0.1148357, 0.4642595, -0.8341604, 0, 0, 0, 1, 1,
-0.1140212, -0.06745848, -3.270551, 1, 1, 1, 1, 1,
-0.1117573, 0.04679681, 0.712345, 1, 1, 1, 1, 1,
-0.1101264, 0.6073229, 0.8468465, 1, 1, 1, 1, 1,
-0.1089543, 0.445481, 1.11544, 1, 1, 1, 1, 1,
-0.1070124, -0.1516233, -3.459114, 1, 1, 1, 1, 1,
-0.1069115, 0.6945004, -1.052994, 1, 1, 1, 1, 1,
-0.100816, 1.214295, -0.403259, 1, 1, 1, 1, 1,
-0.09955843, 1.346926, 0.1164628, 1, 1, 1, 1, 1,
-0.09894092, -1.332375, -1.847368, 1, 1, 1, 1, 1,
-0.09863584, -0.119716, -3.207658, 1, 1, 1, 1, 1,
-0.09763674, -0.8781969, -2.67321, 1, 1, 1, 1, 1,
-0.09711196, -0.278338, -4.964362, 1, 1, 1, 1, 1,
-0.09706204, 0.395324, 0.1103186, 1, 1, 1, 1, 1,
-0.0966843, -0.2298483, -1.037729, 1, 1, 1, 1, 1,
-0.0937907, -0.9429834, -2.294654, 1, 1, 1, 1, 1,
-0.09367397, 0.07594982, 0.6678207, 0, 0, 1, 1, 1,
-0.0900231, 0.8370234, -1.546664, 1, 0, 0, 1, 1,
-0.08813459, -1.304842, -3.576143, 1, 0, 0, 1, 1,
-0.08642461, -0.7056926, -3.516468, 1, 0, 0, 1, 1,
-0.08550793, -0.8979421, -3.220421, 1, 0, 0, 1, 1,
-0.08472587, -0.06770384, -2.619751, 1, 0, 0, 1, 1,
-0.0812819, -0.152969, -2.316288, 0, 0, 0, 1, 1,
-0.08096657, -0.3975357, -2.43699, 0, 0, 0, 1, 1,
-0.07797527, 2.055443, -1.277075, 0, 0, 0, 1, 1,
-0.07700874, -0.6938187, -3.744277, 0, 0, 0, 1, 1,
-0.07546596, -0.04558949, -1.954285, 0, 0, 0, 1, 1,
-0.0719812, 0.5865986, 0.9229147, 0, 0, 0, 1, 1,
-0.07068053, -0.01690005, -1.65591, 0, 0, 0, 1, 1,
-0.0701388, -0.6921893, -2.834634, 1, 1, 1, 1, 1,
-0.06949563, -0.1886309, -2.377185, 1, 1, 1, 1, 1,
-0.06551911, -1.855807, -2.635328, 1, 1, 1, 1, 1,
-0.06491297, 0.1796147, -2.036947, 1, 1, 1, 1, 1,
-0.0610664, 0.2952981, -2.221135, 1, 1, 1, 1, 1,
-0.05938789, 1.044384, 1.413242, 1, 1, 1, 1, 1,
-0.05661558, -0.7100437, -4.173551, 1, 1, 1, 1, 1,
-0.05641155, -0.7865314, -3.314175, 1, 1, 1, 1, 1,
-0.05281354, 1.060978, 0.4960863, 1, 1, 1, 1, 1,
-0.05217434, 0.2521336, 0.3955584, 1, 1, 1, 1, 1,
-0.0518181, -0.4022827, -2.081968, 1, 1, 1, 1, 1,
-0.05109662, 0.03877978, -1.098818, 1, 1, 1, 1, 1,
-0.05108753, 0.6942757, 0.059554, 1, 1, 1, 1, 1,
-0.05056761, 1.2367, -0.7408825, 1, 1, 1, 1, 1,
-0.0480902, -1.79945, -2.245088, 1, 1, 1, 1, 1,
-0.04775104, -0.3051681, -4.497526, 0, 0, 1, 1, 1,
-0.04752196, 1.383575, 0.01118558, 1, 0, 0, 1, 1,
-0.04501942, 0.5667422, -0.4661214, 1, 0, 0, 1, 1,
-0.044631, 0.9236712, -1.463942, 1, 0, 0, 1, 1,
-0.04164382, 0.3144172, 1.204093, 1, 0, 0, 1, 1,
-0.04124365, 0.5250956, 0.09490736, 1, 0, 0, 1, 1,
-0.0313923, 0.6460463, 1.57633, 0, 0, 0, 1, 1,
-0.03105216, 0.2619552, -0.3179489, 0, 0, 0, 1, 1,
-0.03079341, 0.392167, 0.02506562, 0, 0, 0, 1, 1,
-0.03059545, -1.009807, -4.550695, 0, 0, 0, 1, 1,
-0.02736515, 1.054737, -0.8922616, 0, 0, 0, 1, 1,
-0.02302448, 1.023737, 0.2007413, 0, 0, 0, 1, 1,
-0.01961854, -0.1563527, -0.9804311, 0, 0, 0, 1, 1,
-0.01641628, -0.1612052, -2.983703, 1, 1, 1, 1, 1,
-0.01438212, 1.058085, -0.1468887, 1, 1, 1, 1, 1,
-0.008076997, -1.29309, -3.192985, 1, 1, 1, 1, 1,
-0.007948352, 0.03703654, -0.7316268, 1, 1, 1, 1, 1,
-0.006957811, 0.7526201, -0.1169732, 1, 1, 1, 1, 1,
-0.002883309, 0.1075731, -2.018782, 1, 1, 1, 1, 1,
-0.002782836, 0.1968939, 1.383997, 1, 1, 1, 1, 1,
-0.002029882, -1.852203, -2.845375, 1, 1, 1, 1, 1,
-0.0004840146, -0.9712727, -4.980983, 1, 1, 1, 1, 1,
-0.0003408673, 0.1840511, -0.2698197, 1, 1, 1, 1, 1,
0.0003530964, 1.558521, -0.6314314, 1, 1, 1, 1, 1,
0.002567894, 2.39765, -0.4112001, 1, 1, 1, 1, 1,
0.003667583, -1.336592, 2.80745, 1, 1, 1, 1, 1,
0.009308223, -0.1877152, 3.265951, 1, 1, 1, 1, 1,
0.01165072, 0.1023042, -0.784132, 1, 1, 1, 1, 1,
0.01249754, 0.006653918, 2.204097, 0, 0, 1, 1, 1,
0.01554712, 0.06580674, -0.2959233, 1, 0, 0, 1, 1,
0.01634408, -1.203544, 1.650584, 1, 0, 0, 1, 1,
0.01638359, 0.4306377, -1.256081, 1, 0, 0, 1, 1,
0.01643652, -1.263361, 4.326273, 1, 0, 0, 1, 1,
0.01892601, -0.857632, 2.252951, 1, 0, 0, 1, 1,
0.02130447, -0.2276476, 1.425566, 0, 0, 0, 1, 1,
0.02172924, -0.4254721, 2.970275, 0, 0, 0, 1, 1,
0.02272102, -1.590418, 3.309969, 0, 0, 0, 1, 1,
0.02386753, 1.084738, 0.9914094, 0, 0, 0, 1, 1,
0.02552126, -0.0161848, 3.121534, 0, 0, 0, 1, 1,
0.02652868, -1.248835, 4.777119, 0, 0, 0, 1, 1,
0.02902323, -1.31016, 2.168025, 0, 0, 0, 1, 1,
0.0310404, -0.9238072, 3.917346, 1, 1, 1, 1, 1,
0.03414804, -0.1995983, 1.99319, 1, 1, 1, 1, 1,
0.03710141, 1.663129, -1.097761, 1, 1, 1, 1, 1,
0.04200242, 0.006546548, 1.213129, 1, 1, 1, 1, 1,
0.04433083, 1.176506, 0.1435553, 1, 1, 1, 1, 1,
0.0467145, 0.2256557, -0.215857, 1, 1, 1, 1, 1,
0.05106056, -0.005349095, 1.828937, 1, 1, 1, 1, 1,
0.05308916, -0.4079852, 2.281605, 1, 1, 1, 1, 1,
0.05579791, 0.1906334, 0.3203844, 1, 1, 1, 1, 1,
0.05923865, -0.07090286, 3.007892, 1, 1, 1, 1, 1,
0.06014858, 0.1816857, -0.963484, 1, 1, 1, 1, 1,
0.06524261, -0.6134462, 3.607307, 1, 1, 1, 1, 1,
0.06903304, 0.001486018, 2.613048, 1, 1, 1, 1, 1,
0.06999454, -1.440048, 4.980661, 1, 1, 1, 1, 1,
0.07006481, 0.626398, -0.653654, 1, 1, 1, 1, 1,
0.07313456, -1.120648, 2.166636, 0, 0, 1, 1, 1,
0.07752166, 1.194495, -2.903795, 1, 0, 0, 1, 1,
0.08093325, -0.7418459, 3.123996, 1, 0, 0, 1, 1,
0.08700516, -0.8709069, 2.946806, 1, 0, 0, 1, 1,
0.08780806, 1.090611, 0.8268014, 1, 0, 0, 1, 1,
0.08784298, 0.899617, -0.3294855, 1, 0, 0, 1, 1,
0.0880056, 0.6261126, 1.347493, 0, 0, 0, 1, 1,
0.09032269, 0.9258447, -1.469178, 0, 0, 0, 1, 1,
0.09323612, -1.541791, 4.267935, 0, 0, 0, 1, 1,
0.09611578, -0.880845, 2.681087, 0, 0, 0, 1, 1,
0.09851302, -0.8490561, 4.064456, 0, 0, 0, 1, 1,
0.1041263, 1.936505, 0.5374135, 0, 0, 0, 1, 1,
0.1052427, -0.7114505, 2.592306, 0, 0, 0, 1, 1,
0.1059978, -0.767816, 2.096323, 1, 1, 1, 1, 1,
0.1105364, 0.9125815, 0.1630203, 1, 1, 1, 1, 1,
0.1132654, 0.5445213, 0.2663715, 1, 1, 1, 1, 1,
0.1147357, -0.2998168, 2.03379, 1, 1, 1, 1, 1,
0.1163551, -0.1249751, 2.168353, 1, 1, 1, 1, 1,
0.1181775, -1.497903, 2.831292, 1, 1, 1, 1, 1,
0.1225813, -0.9184964, 4.450399, 1, 1, 1, 1, 1,
0.1242114, -0.265781, 3.613218, 1, 1, 1, 1, 1,
0.1306607, -0.5535545, 3.494354, 1, 1, 1, 1, 1,
0.132582, 0.2190505, -0.08312096, 1, 1, 1, 1, 1,
0.1358557, 0.09750138, -1.162958, 1, 1, 1, 1, 1,
0.1413403, -0.1895643, 1.81432, 1, 1, 1, 1, 1,
0.1508449, 1.098048, -1.59699, 1, 1, 1, 1, 1,
0.1529786, -1.667903, 4.909521, 1, 1, 1, 1, 1,
0.1531553, -0.9741597, 2.538307, 1, 1, 1, 1, 1,
0.1532934, -0.8322757, 2.643248, 0, 0, 1, 1, 1,
0.1554422, -0.9381161, 2.365069, 1, 0, 0, 1, 1,
0.1680791, -1.764797, 2.337196, 1, 0, 0, 1, 1,
0.1705624, 2.149693, 0.4099594, 1, 0, 0, 1, 1,
0.1709366, -0.3852121, 3.609522, 1, 0, 0, 1, 1,
0.1765219, -0.03834546, 2.172557, 1, 0, 0, 1, 1,
0.1770621, 1.100126, -0.7553725, 0, 0, 0, 1, 1,
0.186332, 0.4758947, -0.06251863, 0, 0, 0, 1, 1,
0.1869217, -0.658216, 1.821069, 0, 0, 0, 1, 1,
0.187159, 1.174539, -0.3445859, 0, 0, 0, 1, 1,
0.1907609, 0.7485858, 0.8501402, 0, 0, 0, 1, 1,
0.1908495, -0.93081, 2.420358, 0, 0, 0, 1, 1,
0.1917355, -0.01201907, 2.035082, 0, 0, 0, 1, 1,
0.1926491, 0.7312552, -0.482992, 1, 1, 1, 1, 1,
0.1929692, 0.7853122, 0.4205871, 1, 1, 1, 1, 1,
0.1987598, -0.6283339, 1.834756, 1, 1, 1, 1, 1,
0.2063618, -0.04224036, 1.477876, 1, 1, 1, 1, 1,
0.2094806, -1.299142, 3.392646, 1, 1, 1, 1, 1,
0.211467, 0.8521585, 2.495306, 1, 1, 1, 1, 1,
0.2124323, 0.2153256, -0.1747371, 1, 1, 1, 1, 1,
0.2144058, -0.3893929, 4.876254, 1, 1, 1, 1, 1,
0.2162087, 2.730733, 3.205111, 1, 1, 1, 1, 1,
0.2185075, 0.3428951, 0.4216952, 1, 1, 1, 1, 1,
0.2198317, -0.8008863, 0.7059731, 1, 1, 1, 1, 1,
0.2201782, -0.9182223, 2.987925, 1, 1, 1, 1, 1,
0.2251691, -0.05221653, 0.1315609, 1, 1, 1, 1, 1,
0.2300507, 1.271513, 0.4805157, 1, 1, 1, 1, 1,
0.2320172, -0.6223345, 2.102672, 1, 1, 1, 1, 1,
0.2364914, -1.260974, 5.109812, 0, 0, 1, 1, 1,
0.2378326, 0.3956835, 0.8194471, 1, 0, 0, 1, 1,
0.238514, 0.9447089, -0.1366308, 1, 0, 0, 1, 1,
0.2420803, -0.02886555, 3.320115, 1, 0, 0, 1, 1,
0.2465203, -1.134486, 5.096882, 1, 0, 0, 1, 1,
0.2556992, -0.1659369, 1.99918, 1, 0, 0, 1, 1,
0.2560662, 1.201569, 0.5871887, 0, 0, 0, 1, 1,
0.2605059, 0.123291, 0.4239254, 0, 0, 0, 1, 1,
0.2656141, -0.9213395, 2.399934, 0, 0, 0, 1, 1,
0.2693916, -0.3639758, -0.414457, 0, 0, 0, 1, 1,
0.2733051, -0.009765714, 2.130384, 0, 0, 0, 1, 1,
0.2778282, 0.7876314, -0.9982247, 0, 0, 0, 1, 1,
0.2779697, -1.680702, 3.367834, 0, 0, 0, 1, 1,
0.2833157, 0.8285596, -1.289009, 1, 1, 1, 1, 1,
0.2838742, -1.671955, 3.795772, 1, 1, 1, 1, 1,
0.2842796, -1.001634, 2.706017, 1, 1, 1, 1, 1,
0.2935613, -0.3959556, 4.498435, 1, 1, 1, 1, 1,
0.2937706, -0.5467258, 2.015204, 1, 1, 1, 1, 1,
0.2940224, 0.04502536, 0.0410926, 1, 1, 1, 1, 1,
0.29614, -1.365236, 4.352691, 1, 1, 1, 1, 1,
0.2983004, -0.3758537, 3.524957, 1, 1, 1, 1, 1,
0.299172, -1.416436, 3.597881, 1, 1, 1, 1, 1,
0.3041853, -0.403349, 0.6589568, 1, 1, 1, 1, 1,
0.30539, 0.03576511, 1.381038, 1, 1, 1, 1, 1,
0.3101094, -0.3204997, 2.126659, 1, 1, 1, 1, 1,
0.311262, -2.48579, 1.944336, 1, 1, 1, 1, 1,
0.3127971, 0.0581714, 1.711417, 1, 1, 1, 1, 1,
0.3164248, 1.178826, -0.3256819, 1, 1, 1, 1, 1,
0.3165873, -2.060865, 3.369019, 0, 0, 1, 1, 1,
0.3171245, 0.7053054, -0.2067246, 1, 0, 0, 1, 1,
0.3242879, -0.7570328, 2.131222, 1, 0, 0, 1, 1,
0.3319116, 1.797198, 0.4806137, 1, 0, 0, 1, 1,
0.3355907, -0.04315198, 2.356636, 1, 0, 0, 1, 1,
0.3400139, -0.2911693, 0.2539594, 1, 0, 0, 1, 1,
0.342969, 3.058944, 1.188589, 0, 0, 0, 1, 1,
0.3435899, -1.662626, 1.70451, 0, 0, 0, 1, 1,
0.3464277, -1.568265, 4.598633, 0, 0, 0, 1, 1,
0.3484912, 1.045208, 0.3272445, 0, 0, 0, 1, 1,
0.3652964, -0.970016, 3.397056, 0, 0, 0, 1, 1,
0.366287, -1.273375, 2.7965, 0, 0, 0, 1, 1,
0.3745418, -1.535791, 0.5482163, 0, 0, 0, 1, 1,
0.375158, 0.02719444, 1.564019, 1, 1, 1, 1, 1,
0.375778, 1.499819, -1.151629, 1, 1, 1, 1, 1,
0.3832731, 1.173398, -0.2970807, 1, 1, 1, 1, 1,
0.3836141, 2.05062, 0.8388909, 1, 1, 1, 1, 1,
0.3836923, -0.7032686, 1.486357, 1, 1, 1, 1, 1,
0.3854774, -1.072046, 3.464923, 1, 1, 1, 1, 1,
0.3863514, 0.6461695, -0.1454464, 1, 1, 1, 1, 1,
0.3871393, 1.473968, 0.04965346, 1, 1, 1, 1, 1,
0.3892706, -0.4361022, 4.182166, 1, 1, 1, 1, 1,
0.3893678, -0.7085919, 1.930106, 1, 1, 1, 1, 1,
0.3897552, -1.191651, 2.943812, 1, 1, 1, 1, 1,
0.3933273, -0.2104258, 0.9028647, 1, 1, 1, 1, 1,
0.3940343, 0.6783083, -0.1514483, 1, 1, 1, 1, 1,
0.3968998, 0.8122938, 0.4077068, 1, 1, 1, 1, 1,
0.397108, -1.440602, 3.29079, 1, 1, 1, 1, 1,
0.3982267, 0.3684987, 1.0961, 0, 0, 1, 1, 1,
0.3993414, 1.2235, 0.1161526, 1, 0, 0, 1, 1,
0.4001413, -0.4858375, 2.900226, 1, 0, 0, 1, 1,
0.4004129, -0.2703623, 1.60789, 1, 0, 0, 1, 1,
0.4028128, -0.8437085, 3.638554, 1, 0, 0, 1, 1,
0.4032001, -1.591559, 4.061936, 1, 0, 0, 1, 1,
0.4055851, 1.42613, 0.6820766, 0, 0, 0, 1, 1,
0.4107227, -0.004319427, 1.475241, 0, 0, 0, 1, 1,
0.4110471, -0.4034567, 2.919971, 0, 0, 0, 1, 1,
0.4127323, -0.6604103, 3.24078, 0, 0, 0, 1, 1,
0.4139952, 1.63997, -1.088883, 0, 0, 0, 1, 1,
0.4258436, 0.7540449, 2.354768, 0, 0, 0, 1, 1,
0.4260927, -1.584964, 1.939707, 0, 0, 0, 1, 1,
0.4311963, -0.3108183, 2.125397, 1, 1, 1, 1, 1,
0.4377164, 0.154232, -0.9278183, 1, 1, 1, 1, 1,
0.4418488, -0.2923911, 3.193729, 1, 1, 1, 1, 1,
0.4421519, -2.09525, 2.646049, 1, 1, 1, 1, 1,
0.4423337, 0.5767096, 2.027684, 1, 1, 1, 1, 1,
0.4456286, 0.3667492, 1.039988, 1, 1, 1, 1, 1,
0.4459937, 0.4720705, 0.1872572, 1, 1, 1, 1, 1,
0.4483156, 0.4983069, 0.8424311, 1, 1, 1, 1, 1,
0.4501473, -0.02520476, 2.023684, 1, 1, 1, 1, 1,
0.4513809, 1.150963, 1.689444, 1, 1, 1, 1, 1,
0.454591, 0.135607, 0.5420091, 1, 1, 1, 1, 1,
0.4576804, 1.333644, 2.032064, 1, 1, 1, 1, 1,
0.4593915, -2.332823, 3.371574, 1, 1, 1, 1, 1,
0.4604801, 0.02874891, 2.324352, 1, 1, 1, 1, 1,
0.4627885, -0.05639036, 2.319857, 1, 1, 1, 1, 1,
0.465753, -0.2501066, 1.810036, 0, 0, 1, 1, 1,
0.470041, -2.816987, 2.916658, 1, 0, 0, 1, 1,
0.4718402, -1.279412, 4.267647, 1, 0, 0, 1, 1,
0.4790616, -0.8956295, 4.451509, 1, 0, 0, 1, 1,
0.4793446, 0.2116132, 0.5204686, 1, 0, 0, 1, 1,
0.4801445, 0.970606, -0.1845498, 1, 0, 0, 1, 1,
0.4814678, -0.03821113, -0.9952559, 0, 0, 0, 1, 1,
0.4845871, -0.4347308, 0.8582548, 0, 0, 0, 1, 1,
0.4846986, 0.5698985, -0.05774152, 0, 0, 0, 1, 1,
0.4857547, 0.2234002, 0.9726766, 0, 0, 0, 1, 1,
0.4860608, 0.07234998, 1.856154, 0, 0, 0, 1, 1,
0.4916724, 0.1705753, 1.579807, 0, 0, 0, 1, 1,
0.4938014, -1.039057, 2.812689, 0, 0, 0, 1, 1,
0.4968476, -0.3270283, 2.979582, 1, 1, 1, 1, 1,
0.4978236, 0.7435085, 1.340245, 1, 1, 1, 1, 1,
0.5100051, 0.5227748, 1.162963, 1, 1, 1, 1, 1,
0.5113472, 0.2791288, 0.1346545, 1, 1, 1, 1, 1,
0.5215179, -1.767978, 1.568222, 1, 1, 1, 1, 1,
0.5236186, 0.5262349, 0.3907323, 1, 1, 1, 1, 1,
0.5244597, 0.9658369, 1.014088, 1, 1, 1, 1, 1,
0.5290833, -1.591439, 1.568083, 1, 1, 1, 1, 1,
0.5336419, 0.3183142, 0.7024289, 1, 1, 1, 1, 1,
0.5360411, -1.585327, 3.321014, 1, 1, 1, 1, 1,
0.5557103, 0.09722742, 0.9594622, 1, 1, 1, 1, 1,
0.5649643, 0.6332858, -0.7780241, 1, 1, 1, 1, 1,
0.5663795, 0.4273323, 4.052249, 1, 1, 1, 1, 1,
0.5692996, 0.2534658, 1.185473, 1, 1, 1, 1, 1,
0.5730956, 0.843626, 0.06635301, 1, 1, 1, 1, 1,
0.5790365, -0.2093517, 2.796368, 0, 0, 1, 1, 1,
0.5790675, 0.7925173, 1.440853, 1, 0, 0, 1, 1,
0.579469, 0.47078, 1.171779, 1, 0, 0, 1, 1,
0.5859115, 2.019158, 0.5123219, 1, 0, 0, 1, 1,
0.5899841, -1.045897, 2.445542, 1, 0, 0, 1, 1,
0.5960072, -0.2078066, 0.1123887, 1, 0, 0, 1, 1,
0.5973281, 0.04459103, 0.4956429, 0, 0, 0, 1, 1,
0.5977123, 2.339099, -0.07758565, 0, 0, 0, 1, 1,
0.5978835, -0.8372828, 0.8707389, 0, 0, 0, 1, 1,
0.6053807, -1.971489, 3.276139, 0, 0, 0, 1, 1,
0.6077496, 1.427484, -0.3577246, 0, 0, 0, 1, 1,
0.6123285, 1.258533, -0.1380636, 0, 0, 0, 1, 1,
0.6160828, -0.4636766, 1.315202, 0, 0, 0, 1, 1,
0.6235549, 0.3713336, 1.246631, 1, 1, 1, 1, 1,
0.6237258, 1.441879, 0.6567462, 1, 1, 1, 1, 1,
0.625438, 0.6336482, 1.167071, 1, 1, 1, 1, 1,
0.6287251, 0.6173651, -0.1811356, 1, 1, 1, 1, 1,
0.6311391, 0.5473251, -0.2130671, 1, 1, 1, 1, 1,
0.6355263, 0.8858904, 1.204513, 1, 1, 1, 1, 1,
0.6378592, 1.694516, -0.523332, 1, 1, 1, 1, 1,
0.6407133, 0.7057625, 2.123542, 1, 1, 1, 1, 1,
0.6455184, -0.470833, 1.599728, 1, 1, 1, 1, 1,
0.6459324, 1.741922, 0.6709248, 1, 1, 1, 1, 1,
0.647472, 0.01812049, 1.700362, 1, 1, 1, 1, 1,
0.6500975, 1.222027, 0.2144233, 1, 1, 1, 1, 1,
0.657092, -2.047605, 0.8444849, 1, 1, 1, 1, 1,
0.6581531, 1.558599, -0.6729993, 1, 1, 1, 1, 1,
0.6586207, -0.1292979, 0.5989627, 1, 1, 1, 1, 1,
0.6705546, 0.05907195, 1.165005, 0, 0, 1, 1, 1,
0.675497, 2.019927, 1.523042, 1, 0, 0, 1, 1,
0.6782205, 1.660052, -0.9738184, 1, 0, 0, 1, 1,
0.6840675, -1.03721, 1.219832, 1, 0, 0, 1, 1,
0.6846057, 0.3338028, 0.7552539, 1, 0, 0, 1, 1,
0.6863264, 1.852468, 0.6294882, 1, 0, 0, 1, 1,
0.6905891, -0.2063566, 0.9305044, 0, 0, 0, 1, 1,
0.6928377, 0.4659954, 1.685713, 0, 0, 0, 1, 1,
0.6931498, 0.08679537, 1.612887, 0, 0, 0, 1, 1,
0.696846, 1.431209, -0.2050582, 0, 0, 0, 1, 1,
0.6974218, 0.1505216, 0.5227255, 0, 0, 0, 1, 1,
0.6981713, 0.5279601, 1.393139, 0, 0, 0, 1, 1,
0.7044566, 0.7367164, 2.294441, 0, 0, 0, 1, 1,
0.7067861, -1.864903, 1.077769, 1, 1, 1, 1, 1,
0.7073779, -1.144881, 3.250422, 1, 1, 1, 1, 1,
0.7117571, 1.538002, 2.772797, 1, 1, 1, 1, 1,
0.7147919, -1.068416, 4.085879, 1, 1, 1, 1, 1,
0.715082, -0.4228929, 1.315263, 1, 1, 1, 1, 1,
0.7200904, 1.648659, 1.17652, 1, 1, 1, 1, 1,
0.7214274, -1.069477, 2.415237, 1, 1, 1, 1, 1,
0.7221789, 2.258386, -0.7501619, 1, 1, 1, 1, 1,
0.7254545, -0.220561, 2.784251, 1, 1, 1, 1, 1,
0.7262217, -1.42762, 1.606059, 1, 1, 1, 1, 1,
0.7267, 1.580846, 1.904768, 1, 1, 1, 1, 1,
0.728719, 0.2916012, 1.763077, 1, 1, 1, 1, 1,
0.7290921, -1.177098, 3.248748, 1, 1, 1, 1, 1,
0.729558, 0.05788023, -0.1963428, 1, 1, 1, 1, 1,
0.7409745, -0.5639971, 1.078034, 1, 1, 1, 1, 1,
0.745908, 0.4524956, 0.9760265, 0, 0, 1, 1, 1,
0.7459529, -1.181764, 4.152402, 1, 0, 0, 1, 1,
0.7543138, -0.4055803, 2.212754, 1, 0, 0, 1, 1,
0.7650426, -0.5686036, 2.537312, 1, 0, 0, 1, 1,
0.7854989, 0.7973474, 1.391282, 1, 0, 0, 1, 1,
0.7882417, -0.716875, 2.915334, 1, 0, 0, 1, 1,
0.7893344, -0.2982034, 1.153136, 0, 0, 0, 1, 1,
0.792559, -0.660134, 0.3892956, 0, 0, 0, 1, 1,
0.7935673, 0.2727645, 0.5552462, 0, 0, 0, 1, 1,
0.7944549, -0.6405392, 0.223244, 0, 0, 0, 1, 1,
0.7991333, 1.155849, 1.036892, 0, 0, 0, 1, 1,
0.7999895, 1.84612, 0.7108658, 0, 0, 0, 1, 1,
0.807248, 0.8144441, 0.880443, 0, 0, 0, 1, 1,
0.8093814, 0.6000906, -0.946711, 1, 1, 1, 1, 1,
0.8141602, -0.2811115, 3.410563, 1, 1, 1, 1, 1,
0.8145204, 0.5948271, 1.433606, 1, 1, 1, 1, 1,
0.8153589, -1.362643, 3.628892, 1, 1, 1, 1, 1,
0.8189412, -0.5349535, 2.902435, 1, 1, 1, 1, 1,
0.8202142, 2.059453, 0.3427536, 1, 1, 1, 1, 1,
0.8284513, 0.09073736, 1.865812, 1, 1, 1, 1, 1,
0.8284815, -0.4056271, 0.7755017, 1, 1, 1, 1, 1,
0.831856, -0.7152689, -0.1776304, 1, 1, 1, 1, 1,
0.8336855, -0.01245496, 2.871384, 1, 1, 1, 1, 1,
0.8345346, 0.9550032, -0.1681698, 1, 1, 1, 1, 1,
0.8395672, 0.2540424, 0.4109792, 1, 1, 1, 1, 1,
0.842499, -0.4559731, 1.218881, 1, 1, 1, 1, 1,
0.8464928, -0.539716, 1.795484, 1, 1, 1, 1, 1,
0.8476281, 0.9852965, 2.386784, 1, 1, 1, 1, 1,
0.8506485, -0.1950765, -0.3649562, 0, 0, 1, 1, 1,
0.8533739, -0.9000364, 1.691671, 1, 0, 0, 1, 1,
0.8591662, -0.4207644, 2.685378, 1, 0, 0, 1, 1,
0.8593553, 0.8654473, 0.412804, 1, 0, 0, 1, 1,
0.8646514, -1.071037, 2.155434, 1, 0, 0, 1, 1,
0.8685606, 0.4307491, 1.2893, 1, 0, 0, 1, 1,
0.8705087, -0.0451333, 1.05167, 0, 0, 0, 1, 1,
0.873383, -0.5030153, 2.67669, 0, 0, 0, 1, 1,
0.8735335, 0.2631004, 1.317357, 0, 0, 0, 1, 1,
0.8762056, 0.376829, 2.092813, 0, 0, 0, 1, 1,
0.877683, -0.4987601, 1.006013, 0, 0, 0, 1, 1,
0.8796155, 0.08311947, 1.281109, 0, 0, 0, 1, 1,
0.8813757, -0.08613849, 2.129517, 0, 0, 0, 1, 1,
0.8820103, -0.6334994, 2.26899, 1, 1, 1, 1, 1,
0.8878764, -0.7492982, 3.289928, 1, 1, 1, 1, 1,
0.8905668, -0.8090449, 1.450749, 1, 1, 1, 1, 1,
0.8937409, -0.3130078, 1.388419, 1, 1, 1, 1, 1,
0.8985904, -1.003902, 1.862136, 1, 1, 1, 1, 1,
0.899677, -1.016807, 1.550694, 1, 1, 1, 1, 1,
0.9003136, 0.8600932, 2.243868, 1, 1, 1, 1, 1,
0.9038722, -1.514133, 1.88914, 1, 1, 1, 1, 1,
0.9080269, 0.4482658, 0.3110806, 1, 1, 1, 1, 1,
0.9095994, 0.3032241, 1.105028, 1, 1, 1, 1, 1,
0.9136255, 0.4853315, 1.087312, 1, 1, 1, 1, 1,
0.9201525, -0.02459494, 0.2262622, 1, 1, 1, 1, 1,
0.9202391, 0.2038068, 2.764327, 1, 1, 1, 1, 1,
0.9210203, 0.3033778, 2.221952, 1, 1, 1, 1, 1,
0.924399, -0.09677156, 3.792404, 1, 1, 1, 1, 1,
0.9261792, -1.108815, 2.373418, 0, 0, 1, 1, 1,
0.9295283, -0.5878747, 1.541412, 1, 0, 0, 1, 1,
0.9362496, -0.0004161118, -0.9777725, 1, 0, 0, 1, 1,
0.9365585, 0.7215973, 0.3135217, 1, 0, 0, 1, 1,
0.9410809, 0.7931454, 1.803874, 1, 0, 0, 1, 1,
0.9433681, -0.1876489, 0.5024502, 1, 0, 0, 1, 1,
0.9449728, -1.255772, 1.846835, 0, 0, 0, 1, 1,
0.9456193, 2.229992, 2.058182, 0, 0, 0, 1, 1,
0.9466861, -0.4191513, 3.014519, 0, 0, 0, 1, 1,
0.9475135, 1.729014, 1.570367, 0, 0, 0, 1, 1,
0.9486251, 0.260184, 1.142095, 0, 0, 0, 1, 1,
0.9580191, -0.4178965, 2.299985, 0, 0, 0, 1, 1,
0.961476, -0.08456436, 2.811846, 0, 0, 0, 1, 1,
0.9639736, -1.621909, 0.8642509, 1, 1, 1, 1, 1,
0.9643236, -0.01691641, 1.164975, 1, 1, 1, 1, 1,
0.9728932, 0.3823809, 0.556195, 1, 1, 1, 1, 1,
0.9779733, 0.6785784, 1.245931, 1, 1, 1, 1, 1,
0.98179, -0.4905733, 2.427293, 1, 1, 1, 1, 1,
0.9828421, -1.867894, 3.93694, 1, 1, 1, 1, 1,
0.9841518, -0.5609385, 3.076782, 1, 1, 1, 1, 1,
1.000243, -1.886546, 2.356378, 1, 1, 1, 1, 1,
1.006784, 0.08027849, 0.8740264, 1, 1, 1, 1, 1,
1.008657, -0.8768864, 0.8839042, 1, 1, 1, 1, 1,
1.01434, 0.1340575, 0.5983421, 1, 1, 1, 1, 1,
1.014887, -0.6565295, 0.5209109, 1, 1, 1, 1, 1,
1.017951, 0.1866218, 0.8363433, 1, 1, 1, 1, 1,
1.02591, -1.086742, 5.34613, 1, 1, 1, 1, 1,
1.026392, -0.37356, 1.937968, 1, 1, 1, 1, 1,
1.027106, -1.580057, 1.624683, 0, 0, 1, 1, 1,
1.030709, 0.3470323, 0.8840482, 1, 0, 0, 1, 1,
1.032239, 0.6476335, -0.4912291, 1, 0, 0, 1, 1,
1.033035, 0.7246144, 2.628076, 1, 0, 0, 1, 1,
1.035677, 0.6307603, 1.356133, 1, 0, 0, 1, 1,
1.038637, 1.573997, 1.114123, 1, 0, 0, 1, 1,
1.056479, 0.04256986, 0.5711002, 0, 0, 0, 1, 1,
1.057793, 0.03209343, 0.3950891, 0, 0, 0, 1, 1,
1.060606, -0.1455547, 1.444513, 0, 0, 0, 1, 1,
1.067153, -0.4943742, 1.915354, 0, 0, 0, 1, 1,
1.067237, 1.775794, 1.569817, 0, 0, 0, 1, 1,
1.07287, 0.4122203, 0.4812444, 0, 0, 0, 1, 1,
1.072989, 0.2504237, 1.125766, 0, 0, 0, 1, 1,
1.076889, -0.2968791, 3.450533, 1, 1, 1, 1, 1,
1.0799, 1.366636, 1.200824, 1, 1, 1, 1, 1,
1.083595, -1.82192, 2.606994, 1, 1, 1, 1, 1,
1.090915, 0.8396292, 2.108117, 1, 1, 1, 1, 1,
1.095491, -0.2019598, 1.731553, 1, 1, 1, 1, 1,
1.096311, -1.735824, 4.210572, 1, 1, 1, 1, 1,
1.096969, -0.8696026, 2.508526, 1, 1, 1, 1, 1,
1.097579, 0.5127645, 2.46031, 1, 1, 1, 1, 1,
1.102649, 2.636981, 1.108717, 1, 1, 1, 1, 1,
1.115384, -1.729061, 3.017678, 1, 1, 1, 1, 1,
1.121809, 1.166082, -1.112465, 1, 1, 1, 1, 1,
1.122043, 0.8364962, 1.183465, 1, 1, 1, 1, 1,
1.129097, 1.982854, 2.288924, 1, 1, 1, 1, 1,
1.129194, 1.127676, 1.635183, 1, 1, 1, 1, 1,
1.133802, 0.8751388, 1.571352, 1, 1, 1, 1, 1,
1.133981, -0.2273768, -0.6580576, 0, 0, 1, 1, 1,
1.134722, 0.9574181, 0.5212646, 1, 0, 0, 1, 1,
1.140352, -0.7230026, 1.371558, 1, 0, 0, 1, 1,
1.144899, 0.01470678, 1.988607, 1, 0, 0, 1, 1,
1.158377, -0.01973163, 2.553054, 1, 0, 0, 1, 1,
1.15845, -0.1329303, 1.555569, 1, 0, 0, 1, 1,
1.165997, -0.9256763, 2.13476, 0, 0, 0, 1, 1,
1.166748, 0.7952126, 0.3756474, 0, 0, 0, 1, 1,
1.185508, -1.038492, 3.175475, 0, 0, 0, 1, 1,
1.187765, -0.1055535, 2.147215, 0, 0, 0, 1, 1,
1.197361, 0.2255831, 0.897382, 0, 0, 0, 1, 1,
1.201035, 0.1325567, -1.729591, 0, 0, 0, 1, 1,
1.210244, 1.512987, 0.4642953, 0, 0, 0, 1, 1,
1.214125, 1.80491, 1.330351, 1, 1, 1, 1, 1,
1.214929, -0.7903979, 4.418243, 1, 1, 1, 1, 1,
1.218752, 1.778561, -0.9647799, 1, 1, 1, 1, 1,
1.250367, -0.04364049, 1.308095, 1, 1, 1, 1, 1,
1.25457, -0.2110357, 3.102875, 1, 1, 1, 1, 1,
1.280713, 1.46068, 2.359123, 1, 1, 1, 1, 1,
1.283632, 0.2809319, 1.970272, 1, 1, 1, 1, 1,
1.294832, -1.335524, 1.265407, 1, 1, 1, 1, 1,
1.309369, 0.1703613, 0.7540135, 1, 1, 1, 1, 1,
1.315779, -1.409129, 1.958882, 1, 1, 1, 1, 1,
1.318942, -0.7687914, 1.38467, 1, 1, 1, 1, 1,
1.328326, 0.2399108, 1.565728, 1, 1, 1, 1, 1,
1.329728, -0.3129829, 1.844486, 1, 1, 1, 1, 1,
1.329861, -2.542832, 4.843169, 1, 1, 1, 1, 1,
1.332059, -0.9723806, 3.003456, 1, 1, 1, 1, 1,
1.343149, -0.8015223, 3.302474, 0, 0, 1, 1, 1,
1.343579, -1.261521, 3.760053, 1, 0, 0, 1, 1,
1.347254, -0.2659631, 1.25011, 1, 0, 0, 1, 1,
1.36059, -1.415763, 1.908589, 1, 0, 0, 1, 1,
1.370058, -0.8378102, 1.819002, 1, 0, 0, 1, 1,
1.375979, -0.4221532, 1.37909, 1, 0, 0, 1, 1,
1.381873, -0.5941005, 0.9450147, 0, 0, 0, 1, 1,
1.393801, -0.02034177, 3.602272, 0, 0, 0, 1, 1,
1.398565, -0.3818938, 2.456709, 0, 0, 0, 1, 1,
1.400527, 1.667476, 0.909072, 0, 0, 0, 1, 1,
1.40131, 1.617553, -1.238393, 0, 0, 0, 1, 1,
1.403563, -1.435845, 1.480804, 0, 0, 0, 1, 1,
1.40381, -0.187229, 2.034637, 0, 0, 0, 1, 1,
1.409153, -0.1427016, 2.60889, 1, 1, 1, 1, 1,
1.410393, -1.356802, 3.442478, 1, 1, 1, 1, 1,
1.410411, 0.08485164, 0.9323568, 1, 1, 1, 1, 1,
1.41565, 0.1777896, 1.072274, 1, 1, 1, 1, 1,
1.416535, 1.213251, 0.8827022, 1, 1, 1, 1, 1,
1.427698, -1.790248, 3.235321, 1, 1, 1, 1, 1,
1.446292, 0.8705482, 1.794946, 1, 1, 1, 1, 1,
1.446349, -1.255881, 2.719514, 1, 1, 1, 1, 1,
1.451555, -1.234624, 3.643749, 1, 1, 1, 1, 1,
1.455699, 0.3601638, 1.181054, 1, 1, 1, 1, 1,
1.457642, -0.3045006, 1.867439, 1, 1, 1, 1, 1,
1.459329, -0.2657218, 1.428157, 1, 1, 1, 1, 1,
1.468009, 1.171061, 1.426672, 1, 1, 1, 1, 1,
1.469963, -0.4114894, 0.404491, 1, 1, 1, 1, 1,
1.475713, 1.490638, 0.5226222, 1, 1, 1, 1, 1,
1.483664, -0.5287828, 3.226285, 0, 0, 1, 1, 1,
1.491248, 1.603322, 1.631643, 1, 0, 0, 1, 1,
1.495875, -1.586219, 3.50536, 1, 0, 0, 1, 1,
1.497266, 0.4646243, 2.279588, 1, 0, 0, 1, 1,
1.497846, 0.5702245, 1.220607, 1, 0, 0, 1, 1,
1.505137, -2.179738, 1.730155, 1, 0, 0, 1, 1,
1.507628, -0.4960775, 2.47197, 0, 0, 0, 1, 1,
1.509314, 1.4318, 0.6564664, 0, 0, 0, 1, 1,
1.509462, 0.006073084, 0.9318797, 0, 0, 0, 1, 1,
1.519371, -0.3305217, 2.363996, 0, 0, 0, 1, 1,
1.524138, 0.4147073, 1.717495, 0, 0, 0, 1, 1,
1.530314, 0.03981138, 1.917792, 0, 0, 0, 1, 1,
1.531076, 0.1680703, 1.0702, 0, 0, 0, 1, 1,
1.536765, -2.283356, 3.017365, 1, 1, 1, 1, 1,
1.541772, -0.5322549, 2.806352, 1, 1, 1, 1, 1,
1.554042, 1.808006, 1.513945, 1, 1, 1, 1, 1,
1.563565, 0.2828169, 0.9839982, 1, 1, 1, 1, 1,
1.584932, -0.7265718, 2.052839, 1, 1, 1, 1, 1,
1.592603, -0.07572857, 1.336704, 1, 1, 1, 1, 1,
1.59476, -0.5934668, 2.540154, 1, 1, 1, 1, 1,
1.607157, -0.8989584, 3.155632, 1, 1, 1, 1, 1,
1.636748, -0.1331168, 0.2204342, 1, 1, 1, 1, 1,
1.652444, -0.6127934, 2.328726, 1, 1, 1, 1, 1,
1.662068, 0.4801944, 1.947326, 1, 1, 1, 1, 1,
1.663656, -0.5868191, 1.883564, 1, 1, 1, 1, 1,
1.671111, 0.1443387, 1.076727, 1, 1, 1, 1, 1,
1.67609, -0.04113692, 1.834627, 1, 1, 1, 1, 1,
1.676576, -0.7424054, 1.78516, 1, 1, 1, 1, 1,
1.713407, -1.7409, 3.027743, 0, 0, 1, 1, 1,
1.734715, -1.007291, 1.673665, 1, 0, 0, 1, 1,
1.736687, 0.4384835, 1.862374, 1, 0, 0, 1, 1,
1.747482, 0.2522403, 2.597158, 1, 0, 0, 1, 1,
1.747577, -0.3928401, 2.582461, 1, 0, 0, 1, 1,
1.750718, 0.4712999, 1.650264, 1, 0, 0, 1, 1,
1.750916, 1.60154, 0.8074731, 0, 0, 0, 1, 1,
1.752196, 2.002941, 0.9113072, 0, 0, 0, 1, 1,
1.759478, -0.2184526, 0.4624609, 0, 0, 0, 1, 1,
1.770222, 1.167297, 2.398384, 0, 0, 0, 1, 1,
1.770622, -2.395557, 1.819376, 0, 0, 0, 1, 1,
1.78029, -0.143296, 1.54283, 0, 0, 0, 1, 1,
1.807425, -0.5211658, 1.242475, 0, 0, 0, 1, 1,
1.811876, 2.799243, 0.4202102, 1, 1, 1, 1, 1,
1.81798, -0.3330839, 1.872075, 1, 1, 1, 1, 1,
1.829967, 0.524796, 1.793877, 1, 1, 1, 1, 1,
1.832723, -0.5596697, 2.849955, 1, 1, 1, 1, 1,
1.83436, -0.1107553, 1.908826, 1, 1, 1, 1, 1,
1.844745, -0.1819676, 2.955429, 1, 1, 1, 1, 1,
1.847635, -0.2931101, 0.6946278, 1, 1, 1, 1, 1,
1.8601, 0.6025292, 0.01920591, 1, 1, 1, 1, 1,
1.911418, 0.1669471, -0.06968053, 1, 1, 1, 1, 1,
1.933636, 0.3233092, 2.101083, 1, 1, 1, 1, 1,
1.951291, -0.6982393, 0.4418204, 1, 1, 1, 1, 1,
1.952064, -0.9616874, 3.759746, 1, 1, 1, 1, 1,
1.985233, 0.7940748, 0.6528277, 1, 1, 1, 1, 1,
1.986912, 0.8309664, 0.4657972, 1, 1, 1, 1, 1,
2.017334, -0.5418037, 2.201599, 1, 1, 1, 1, 1,
2.018288, 0.6685832, 1.869494, 0, 0, 1, 1, 1,
2.056888, -0.4218262, 2.404003, 1, 0, 0, 1, 1,
2.155605, -0.7670323, 1.5402, 1, 0, 0, 1, 1,
2.185137, 0.2612764, 0.6484839, 1, 0, 0, 1, 1,
2.224711, 0.008960375, 2.59847, 1, 0, 0, 1, 1,
2.254679, -0.2229163, 1.869929, 1, 0, 0, 1, 1,
2.260123, -1.072773, 2.512495, 0, 0, 0, 1, 1,
2.300659, 0.7832929, 0.4434827, 0, 0, 0, 1, 1,
2.320322, -0.7375649, 3.725415, 0, 0, 0, 1, 1,
2.378096, 1.885436, -0.3548302, 0, 0, 0, 1, 1,
2.427491, -0.7001219, 1.885045, 0, 0, 0, 1, 1,
2.427919, 0.5028139, 1.356108, 0, 0, 0, 1, 1,
2.446157, 1.220772, -0.1141763, 0, 0, 0, 1, 1,
2.5268, -0.5097716, 1.951762, 1, 1, 1, 1, 1,
2.554878, 1.172695, 0.6324712, 1, 1, 1, 1, 1,
2.668859, -0.8756121, 2.474555, 1, 1, 1, 1, 1,
2.697612, 0.1701825, 1.184743, 1, 1, 1, 1, 1,
2.716411, -1.282948, 3.204755, 1, 1, 1, 1, 1,
2.887907, -1.295055, 3.738194, 1, 1, 1, 1, 1,
2.896847, 1.541327, 0.01774465, 1, 1, 1, 1, 1
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
var radius = 9.60703;
var distance = 33.74429;
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
mvMatrix.translate( 0.06098616, 0.4108143, 0.02832603 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.74429);
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
