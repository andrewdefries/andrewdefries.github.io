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
-3.293301, -1.086315, -1.552034, 1, 0, 0, 1,
-3.067878, 0.5915098, 0.2343812, 1, 0.007843138, 0, 1,
-2.985365, 0.028199, -1.166036, 1, 0.01176471, 0, 1,
-2.711726, 1.215638, -1.563256, 1, 0.01960784, 0, 1,
-2.685061, 0.1265665, -4.516418, 1, 0.02352941, 0, 1,
-2.562658, -0.06348602, -2.312586, 1, 0.03137255, 0, 1,
-2.552468, -0.6813148, -1.562933, 1, 0.03529412, 0, 1,
-2.547399, 0.7016351, -1.217853, 1, 0.04313726, 0, 1,
-2.419163, -1.472057, -1.62282, 1, 0.04705882, 0, 1,
-2.410486, -1.420266, -2.309704, 1, 0.05490196, 0, 1,
-2.393049, -0.1812985, -0.2518237, 1, 0.05882353, 0, 1,
-2.308062, 0.7265872, -0.5008947, 1, 0.06666667, 0, 1,
-2.285829, -1.220818, -1.910886, 1, 0.07058824, 0, 1,
-2.229466, 1.324807, -1.155177, 1, 0.07843138, 0, 1,
-2.222676, 1.222588, -0.9640426, 1, 0.08235294, 0, 1,
-2.210415, 0.205237, -2.718204, 1, 0.09019608, 0, 1,
-2.201928, 0.2598442, -1.951012, 1, 0.09411765, 0, 1,
-2.171576, 1.684025, -0.4436705, 1, 0.1019608, 0, 1,
-2.135163, -0.1631591, -1.19742, 1, 0.1098039, 0, 1,
-2.134512, -0.4759779, -2.096437, 1, 0.1137255, 0, 1,
-2.128419, 0.2437579, -0.7536947, 1, 0.1215686, 0, 1,
-2.120603, -0.02511129, 0.8885372, 1, 0.1254902, 0, 1,
-2.012876, 1.22178, -1.297325, 1, 0.1333333, 0, 1,
-1.964948, 0.3154255, -1.830898, 1, 0.1372549, 0, 1,
-1.964045, 1.636196, -1.643146, 1, 0.145098, 0, 1,
-1.959675, -1.624146, -4.035845, 1, 0.1490196, 0, 1,
-1.959658, 0.611408, -2.593362, 1, 0.1568628, 0, 1,
-1.949643, 1.014314, -2.579489, 1, 0.1607843, 0, 1,
-1.943989, 1.508136, -3.102357, 1, 0.1686275, 0, 1,
-1.940687, 2.066647, -1.662767, 1, 0.172549, 0, 1,
-1.919747, -0.2379121, -1.380749, 1, 0.1803922, 0, 1,
-1.893609, -0.6985079, -3.84123, 1, 0.1843137, 0, 1,
-1.883626, 0.2239806, -2.555452, 1, 0.1921569, 0, 1,
-1.860718, -0.2081471, -0.9193875, 1, 0.1960784, 0, 1,
-1.83048, -0.0823542, -0.754517, 1, 0.2039216, 0, 1,
-1.822523, -0.3342968, -0.8207884, 1, 0.2117647, 0, 1,
-1.821499, -1.17263, -0.4269442, 1, 0.2156863, 0, 1,
-1.803949, -1.309028, -3.726763, 1, 0.2235294, 0, 1,
-1.758187, 0.8695347, -1.757, 1, 0.227451, 0, 1,
-1.75186, -1.015965, -1.301172, 1, 0.2352941, 0, 1,
-1.734886, -1.109525, 0.1411463, 1, 0.2392157, 0, 1,
-1.723703, 0.3609841, -1.73856, 1, 0.2470588, 0, 1,
-1.72357, 0.0007362771, -2.373538, 1, 0.2509804, 0, 1,
-1.72333, -0.1523183, -1.275123, 1, 0.2588235, 0, 1,
-1.704757, -0.7341695, -3.908962, 1, 0.2627451, 0, 1,
-1.688642, -1.333052, -1.339617, 1, 0.2705882, 0, 1,
-1.669669, -0.4523416, -1.740789, 1, 0.2745098, 0, 1,
-1.668359, 1.438237, -2.150862, 1, 0.282353, 0, 1,
-1.663475, 0.9942216, -1.346009, 1, 0.2862745, 0, 1,
-1.65551, -1.109771, -1.524362, 1, 0.2941177, 0, 1,
-1.62459, -0.2234653, 0.06637279, 1, 0.3019608, 0, 1,
-1.622031, 0.06660805, -0.1485833, 1, 0.3058824, 0, 1,
-1.621106, 1.128175, -1.777987, 1, 0.3137255, 0, 1,
-1.604916, -0.5842171, -2.911459, 1, 0.3176471, 0, 1,
-1.601681, -0.6679475, -2.868657, 1, 0.3254902, 0, 1,
-1.584812, 0.1834275, -1.075077, 1, 0.3294118, 0, 1,
-1.584526, 1.331187, -1.101115, 1, 0.3372549, 0, 1,
-1.573933, 0.5523998, -1.058152, 1, 0.3411765, 0, 1,
-1.572312, -0.7533962, -2.324656, 1, 0.3490196, 0, 1,
-1.571902, -1.679669, -2.278711, 1, 0.3529412, 0, 1,
-1.529432, -0.4684614, -2.36266, 1, 0.3607843, 0, 1,
-1.499207, -0.2196917, -0.0664226, 1, 0.3647059, 0, 1,
-1.490734, 0.3188017, -1.43377, 1, 0.372549, 0, 1,
-1.476239, -0.2402361, -0.5388972, 1, 0.3764706, 0, 1,
-1.472687, 1.649829, -0.1932643, 1, 0.3843137, 0, 1,
-1.460092, -0.361009, -2.00739, 1, 0.3882353, 0, 1,
-1.440434, -0.07413947, -2.580981, 1, 0.3960784, 0, 1,
-1.431244, -0.5768787, -2.257224, 1, 0.4039216, 0, 1,
-1.429156, 0.4890575, -0.0225921, 1, 0.4078431, 0, 1,
-1.427454, -1.592139, -2.66771, 1, 0.4156863, 0, 1,
-1.424143, 0.1571084, -0.5915958, 1, 0.4196078, 0, 1,
-1.422276, -0.7156674, -1.229171, 1, 0.427451, 0, 1,
-1.422255, -1.017931, -3.112346, 1, 0.4313726, 0, 1,
-1.421019, 0.5162636, -1.82416, 1, 0.4392157, 0, 1,
-1.419547, 1.187932, -0.2129839, 1, 0.4431373, 0, 1,
-1.418553, 1.323399, -1.68784, 1, 0.4509804, 0, 1,
-1.415668, -0.3518678, -1.329643, 1, 0.454902, 0, 1,
-1.408753, -1.481798, -1.633787, 1, 0.4627451, 0, 1,
-1.401929, 1.762878, -2.108367, 1, 0.4666667, 0, 1,
-1.401288, -0.713206, -3.741118, 1, 0.4745098, 0, 1,
-1.400725, 0.01402197, -0.9203644, 1, 0.4784314, 0, 1,
-1.393255, 0.7374245, -1.783617, 1, 0.4862745, 0, 1,
-1.390046, 0.3710567, -1.510561, 1, 0.4901961, 0, 1,
-1.382531, 0.7742649, 0.2771497, 1, 0.4980392, 0, 1,
-1.381245, -1.769063, -3.19941, 1, 0.5058824, 0, 1,
-1.379769, 0.5827751, -1.742309, 1, 0.509804, 0, 1,
-1.367714, -0.5752962, -1.753045, 1, 0.5176471, 0, 1,
-1.36624, 0.1143292, 0.2340117, 1, 0.5215687, 0, 1,
-1.361321, 0.1852548, -0.308597, 1, 0.5294118, 0, 1,
-1.349959, 0.7217486, -0.5734537, 1, 0.5333334, 0, 1,
-1.347433, 0.5194005, -0.1468183, 1, 0.5411765, 0, 1,
-1.333287, -0.7890632, -3.850349, 1, 0.5450981, 0, 1,
-1.331603, -0.2596811, -0.490938, 1, 0.5529412, 0, 1,
-1.322849, 0.4018179, -0.2327043, 1, 0.5568628, 0, 1,
-1.315943, -1.097481, -0.07084468, 1, 0.5647059, 0, 1,
-1.312498, 2.09307, -1.863124, 1, 0.5686275, 0, 1,
-1.307482, -0.384777, -1.821592, 1, 0.5764706, 0, 1,
-1.306892, -0.2029479, -1.313367, 1, 0.5803922, 0, 1,
-1.300127, 1.89902, -0.9681597, 1, 0.5882353, 0, 1,
-1.299213, -0.2152639, 0.2734202, 1, 0.5921569, 0, 1,
-1.291618, -0.7761087, -2.468964, 1, 0.6, 0, 1,
-1.287446, 0.6662419, -0.2731144, 1, 0.6078432, 0, 1,
-1.285527, -1.095016, -1.806838, 1, 0.6117647, 0, 1,
-1.279484, -0.8522028, -3.924114, 1, 0.6196079, 0, 1,
-1.264586, 0.4124492, -0.9975777, 1, 0.6235294, 0, 1,
-1.254529, -0.3714296, -0.5167428, 1, 0.6313726, 0, 1,
-1.240732, 0.1314453, -0.5137699, 1, 0.6352941, 0, 1,
-1.237894, -0.4150336, -1.119505, 1, 0.6431373, 0, 1,
-1.221638, -0.658228, -1.634242, 1, 0.6470588, 0, 1,
-1.213592, -0.1882405, -1.170752, 1, 0.654902, 0, 1,
-1.199813, 2.220462, -0.1385808, 1, 0.6588235, 0, 1,
-1.197325, 0.8402274, 0.05194348, 1, 0.6666667, 0, 1,
-1.184331, -0.4423289, -0.7996504, 1, 0.6705883, 0, 1,
-1.184071, -0.1745475, -0.6957768, 1, 0.6784314, 0, 1,
-1.182212, -0.8978812, -1.751822, 1, 0.682353, 0, 1,
-1.18074, 0.8809512, -0.04557528, 1, 0.6901961, 0, 1,
-1.171398, 0.5874546, -0.6307157, 1, 0.6941177, 0, 1,
-1.164491, -0.4123731, -4.062757, 1, 0.7019608, 0, 1,
-1.162829, -1.081366, -3.581617, 1, 0.7098039, 0, 1,
-1.162748, 0.8758547, -0.6106061, 1, 0.7137255, 0, 1,
-1.162425, 2.103772, -1.193595, 1, 0.7215686, 0, 1,
-1.153823, -0.7772484, -2.581404, 1, 0.7254902, 0, 1,
-1.150733, -0.7705666, -3.055498, 1, 0.7333333, 0, 1,
-1.137156, 0.9656131, -0.905657, 1, 0.7372549, 0, 1,
-1.134326, 0.2385225, -0.2350873, 1, 0.7450981, 0, 1,
-1.131762, 0.4347913, -2.718293, 1, 0.7490196, 0, 1,
-1.131127, -1.125088, -2.263856, 1, 0.7568628, 0, 1,
-1.12907, 2.134776, 0.5449468, 1, 0.7607843, 0, 1,
-1.127298, -0.09176159, 0.487706, 1, 0.7686275, 0, 1,
-1.123488, 0.7419345, -0.7102733, 1, 0.772549, 0, 1,
-1.104913, 2.692728, 2.184828, 1, 0.7803922, 0, 1,
-1.103424, 1.082105, 0.05809062, 1, 0.7843137, 0, 1,
-1.103245, -0.8216687, -1.158166, 1, 0.7921569, 0, 1,
-1.093158, -0.332698, -2.461799, 1, 0.7960784, 0, 1,
-1.086519, -0.5309669, -1.440242, 1, 0.8039216, 0, 1,
-1.084798, -0.6262746, -1.711211, 1, 0.8117647, 0, 1,
-1.08329, 0.838298, -0.1987561, 1, 0.8156863, 0, 1,
-1.081374, 2.236596, 0.02059262, 1, 0.8235294, 0, 1,
-1.070282, 0.4913496, 0.8347092, 1, 0.827451, 0, 1,
-1.063179, -0.4954166, -1.213725, 1, 0.8352941, 0, 1,
-1.060562, -0.2195537, -1.382972, 1, 0.8392157, 0, 1,
-1.057411, 1.826198, 1.043993, 1, 0.8470588, 0, 1,
-1.053743, 0.7807888, -0.3346462, 1, 0.8509804, 0, 1,
-1.049913, -0.4495192, -1.824424, 1, 0.8588235, 0, 1,
-1.044683, 0.5480191, -2.335127, 1, 0.8627451, 0, 1,
-1.042261, 1.213539, -0.843002, 1, 0.8705882, 0, 1,
-1.039004, -0.3859515, -2.316202, 1, 0.8745098, 0, 1,
-1.02929, 0.1691993, -3.322815, 1, 0.8823529, 0, 1,
-1.023649, -0.8741908, -2.852658, 1, 0.8862745, 0, 1,
-1.019372, -1.800889, -2.453564, 1, 0.8941177, 0, 1,
-1.017009, -0.6123617, -0.08071409, 1, 0.8980392, 0, 1,
-1.015854, 0.02570714, -2.355475, 1, 0.9058824, 0, 1,
-1.012394, 0.008246711, -1.792919, 1, 0.9137255, 0, 1,
-1.003604, 1.091938, -1.126237, 1, 0.9176471, 0, 1,
-0.9994169, -2.268666, -3.204711, 1, 0.9254902, 0, 1,
-0.9896889, 1.502095, -0.5335308, 1, 0.9294118, 0, 1,
-0.9810453, 0.06494068, -2.267581, 1, 0.9372549, 0, 1,
-0.9783249, -3.592933, -2.75004, 1, 0.9411765, 0, 1,
-0.9622644, 0.7827777, -3.329792, 1, 0.9490196, 0, 1,
-0.958645, -1.111508, -1.869316, 1, 0.9529412, 0, 1,
-0.9567553, 0.2652362, -1.963115, 1, 0.9607843, 0, 1,
-0.9478846, 0.7157458, -0.6252295, 1, 0.9647059, 0, 1,
-0.9460932, 1.011436, -2.891138, 1, 0.972549, 0, 1,
-0.9227872, 0.9281601, -0.0491514, 1, 0.9764706, 0, 1,
-0.9226621, 0.778064, -0.2034908, 1, 0.9843137, 0, 1,
-0.9205959, 1.889384, -0.8212627, 1, 0.9882353, 0, 1,
-0.9195307, -0.5784609, -3.286067, 1, 0.9960784, 0, 1,
-0.9010742, -0.1539164, -1.24712, 0.9960784, 1, 0, 1,
-0.8975523, -0.7050889, -2.371505, 0.9921569, 1, 0, 1,
-0.8882057, 0.6246204, -2.69969, 0.9843137, 1, 0, 1,
-0.8828393, 0.6515318, -1.709822, 0.9803922, 1, 0, 1,
-0.8785274, -0.05617243, -1.894769, 0.972549, 1, 0, 1,
-0.8678579, 2.507689, -1.096227, 0.9686275, 1, 0, 1,
-0.8668076, 0.08151188, -2.366268, 0.9607843, 1, 0, 1,
-0.8668072, 0.1181105, -0.8421049, 0.9568627, 1, 0, 1,
-0.8665246, -1.419317, -3.182654, 0.9490196, 1, 0, 1,
-0.8648232, 0.7310895, -0.905663, 0.945098, 1, 0, 1,
-0.8619516, 1.351774, -0.01548454, 0.9372549, 1, 0, 1,
-0.8617021, 0.3662887, -2.043821, 0.9333333, 1, 0, 1,
-0.8564182, -0.3225063, -1.69982, 0.9254902, 1, 0, 1,
-0.8559368, 0.9369106, 0.3168104, 0.9215686, 1, 0, 1,
-0.8546562, -0.7618729, -2.839626, 0.9137255, 1, 0, 1,
-0.854123, -1.297702, -1.713417, 0.9098039, 1, 0, 1,
-0.8459463, 1.362871, 0.5430787, 0.9019608, 1, 0, 1,
-0.8426937, 1.488948, -1.095772, 0.8941177, 1, 0, 1,
-0.8346891, 0.5913475, -1.213116, 0.8901961, 1, 0, 1,
-0.8325813, 0.8680056, -0.2324185, 0.8823529, 1, 0, 1,
-0.8281314, -1.415063, -1.757183, 0.8784314, 1, 0, 1,
-0.8221487, -0.5236972, -3.264253, 0.8705882, 1, 0, 1,
-0.8185266, 0.8828492, -0.7475925, 0.8666667, 1, 0, 1,
-0.8130599, -0.7796409, -2.379875, 0.8588235, 1, 0, 1,
-0.8109214, -0.1928548, -1.117762, 0.854902, 1, 0, 1,
-0.8104713, -0.2366389, -1.355196, 0.8470588, 1, 0, 1,
-0.8100584, 1.162827, -0.5749838, 0.8431373, 1, 0, 1,
-0.8070778, 0.03791982, -1.344907, 0.8352941, 1, 0, 1,
-0.8060635, 0.01868836, -2.238476, 0.8313726, 1, 0, 1,
-0.8059795, -1.998789, -2.284211, 0.8235294, 1, 0, 1,
-0.8011213, 0.4975148, -1.411184, 0.8196079, 1, 0, 1,
-0.7917456, -1.539481, -4.396658, 0.8117647, 1, 0, 1,
-0.7909441, 0.9753789, -2.396099, 0.8078431, 1, 0, 1,
-0.7899649, 0.4520013, -0.8477306, 0.8, 1, 0, 1,
-0.7893388, -0.1692093, -1.987417, 0.7921569, 1, 0, 1,
-0.7892168, -0.8178127, -2.565294, 0.7882353, 1, 0, 1,
-0.7889377, -0.6372452, -1.798754, 0.7803922, 1, 0, 1,
-0.7846837, -0.2827061, -2.098035, 0.7764706, 1, 0, 1,
-0.7819996, 0.02949922, -2.839554, 0.7686275, 1, 0, 1,
-0.7799677, -0.6119485, -2.619256, 0.7647059, 1, 0, 1,
-0.7767475, 1.227001, -1.682653, 0.7568628, 1, 0, 1,
-0.7763963, -0.7062849, -1.691474, 0.7529412, 1, 0, 1,
-0.7706721, -0.3727244, -1.285092, 0.7450981, 1, 0, 1,
-0.7691519, -0.4743108, -1.222639, 0.7411765, 1, 0, 1,
-0.7679072, 0.6204927, -0.9906726, 0.7333333, 1, 0, 1,
-0.7678613, -1.033366, -1.326098, 0.7294118, 1, 0, 1,
-0.7649574, -0.02254963, -2.096299, 0.7215686, 1, 0, 1,
-0.7633867, 0.9533018, -1.039558, 0.7176471, 1, 0, 1,
-0.7559858, -0.137614, -1.664393, 0.7098039, 1, 0, 1,
-0.7551484, -0.2980264, -2.633016, 0.7058824, 1, 0, 1,
-0.7525442, 0.1774718, -1.188211, 0.6980392, 1, 0, 1,
-0.7476533, 0.292328, -1.047571, 0.6901961, 1, 0, 1,
-0.7382091, 0.5311025, -0.926328, 0.6862745, 1, 0, 1,
-0.7374237, -0.7640355, -2.652726, 0.6784314, 1, 0, 1,
-0.7362338, -1.124009, -3.296575, 0.6745098, 1, 0, 1,
-0.7326756, 0.3864784, 0.3434407, 0.6666667, 1, 0, 1,
-0.7323939, -0.06393725, -1.596266, 0.6627451, 1, 0, 1,
-0.7309938, -1.320143, -3.070845, 0.654902, 1, 0, 1,
-0.7288211, -1.36688, -3.176723, 0.6509804, 1, 0, 1,
-0.7285737, 2.256781, -0.03685865, 0.6431373, 1, 0, 1,
-0.7217975, -0.2147681, -2.270313, 0.6392157, 1, 0, 1,
-0.7197342, 0.8228096, 0.4214407, 0.6313726, 1, 0, 1,
-0.7192699, 0.05160032, -1.466983, 0.627451, 1, 0, 1,
-0.7173133, -0.3756998, -2.745319, 0.6196079, 1, 0, 1,
-0.7141016, -0.9117381, -3.40057, 0.6156863, 1, 0, 1,
-0.7133421, 0.05654695, -3.116745, 0.6078432, 1, 0, 1,
-0.7118035, 1.326735, -1.566773, 0.6039216, 1, 0, 1,
-0.7098598, 1.837735, -0.4153248, 0.5960785, 1, 0, 1,
-0.7095841, -0.5947411, -3.243053, 0.5882353, 1, 0, 1,
-0.6990817, -0.5353068, 2.110516, 0.5843138, 1, 0, 1,
-0.6963343, -1.51124, -2.861816, 0.5764706, 1, 0, 1,
-0.6931496, -0.6330519, -1.225696, 0.572549, 1, 0, 1,
-0.6924299, 1.08371, -1.715871, 0.5647059, 1, 0, 1,
-0.691147, -0.5135016, -1.652644, 0.5607843, 1, 0, 1,
-0.6851107, 0.9383764, -1.080851, 0.5529412, 1, 0, 1,
-0.6731339, 0.5927419, -0.9050851, 0.5490196, 1, 0, 1,
-0.6726037, 1.219457, -2.224448, 0.5411765, 1, 0, 1,
-0.6713995, -0.7963193, -2.643651, 0.5372549, 1, 0, 1,
-0.6701737, -0.8860908, -2.315769, 0.5294118, 1, 0, 1,
-0.6684029, 1.461687, -0.8763326, 0.5254902, 1, 0, 1,
-0.6666579, -0.5216673, -2.387205, 0.5176471, 1, 0, 1,
-0.6659555, -0.4004582, -2.290916, 0.5137255, 1, 0, 1,
-0.6633242, -0.2450221, -0.8438786, 0.5058824, 1, 0, 1,
-0.6564594, -1.042985, -2.749811, 0.5019608, 1, 0, 1,
-0.6559122, 0.5563419, 0.8013492, 0.4941176, 1, 0, 1,
-0.6547166, -0.12506, -2.112485, 0.4862745, 1, 0, 1,
-0.6545066, 1.704623, 0.4980263, 0.4823529, 1, 0, 1,
-0.6500279, -0.7334545, -4.137228, 0.4745098, 1, 0, 1,
-0.6366179, 0.3146492, -1.01939, 0.4705882, 1, 0, 1,
-0.6320794, 0.255389, -1.349015, 0.4627451, 1, 0, 1,
-0.6317245, 0.02211427, -1.614903, 0.4588235, 1, 0, 1,
-0.6311044, 1.307376, 0.5600271, 0.4509804, 1, 0, 1,
-0.6297749, -1.002258, -2.994091, 0.4470588, 1, 0, 1,
-0.6258608, 0.4577823, -0.5719118, 0.4392157, 1, 0, 1,
-0.6247221, 0.6491313, 0.6676869, 0.4352941, 1, 0, 1,
-0.6171946, -0.4553823, -3.756105, 0.427451, 1, 0, 1,
-0.6150066, -0.4763355, -0.9308428, 0.4235294, 1, 0, 1,
-0.6100324, 0.1219648, -2.444437, 0.4156863, 1, 0, 1,
-0.609953, -1.091388, -2.693485, 0.4117647, 1, 0, 1,
-0.6050324, -1.555303, -2.248004, 0.4039216, 1, 0, 1,
-0.5978011, 0.921615, -1.940802, 0.3960784, 1, 0, 1,
-0.5967785, -1.166475, -1.480128, 0.3921569, 1, 0, 1,
-0.5919808, -0.4225598, -4.079389, 0.3843137, 1, 0, 1,
-0.5861986, -0.03555948, -1.92808, 0.3803922, 1, 0, 1,
-0.5841886, 0.9609257, 0.4934611, 0.372549, 1, 0, 1,
-0.5833908, 0.2393412, 0.2964613, 0.3686275, 1, 0, 1,
-0.5831062, -0.3747766, -2.797567, 0.3607843, 1, 0, 1,
-0.5809718, -0.03545177, -2.101435, 0.3568628, 1, 0, 1,
-0.5752439, -1.934229, -1.930091, 0.3490196, 1, 0, 1,
-0.5685039, -0.6233369, -2.424479, 0.345098, 1, 0, 1,
-0.5652584, -1.621252, -3.221595, 0.3372549, 1, 0, 1,
-0.5622136, -0.3513479, -4.032057, 0.3333333, 1, 0, 1,
-0.5548279, -0.3991401, -2.804273, 0.3254902, 1, 0, 1,
-0.5495908, 1.520778, 0.02295333, 0.3215686, 1, 0, 1,
-0.5446013, -0.1674583, -2.035135, 0.3137255, 1, 0, 1,
-0.5445697, 0.01609178, -1.901517, 0.3098039, 1, 0, 1,
-0.541737, 0.6221431, -1.022046, 0.3019608, 1, 0, 1,
-0.5410489, -0.3055663, -3.041673, 0.2941177, 1, 0, 1,
-0.5409294, -0.5913796, -2.777075, 0.2901961, 1, 0, 1,
-0.5395918, 0.5325097, -1.794956, 0.282353, 1, 0, 1,
-0.5394329, -1.101912, -1.717734, 0.2784314, 1, 0, 1,
-0.5337283, -0.6213995, -3.810883, 0.2705882, 1, 0, 1,
-0.5333631, -0.09024685, -0.6312425, 0.2666667, 1, 0, 1,
-0.5299484, 1.528851, -0.7275537, 0.2588235, 1, 0, 1,
-0.5269693, -0.4244421, -2.657563, 0.254902, 1, 0, 1,
-0.5268502, -1.629354, -3.154486, 0.2470588, 1, 0, 1,
-0.5264643, -1.391765, -1.067157, 0.2431373, 1, 0, 1,
-0.5233138, -1.573807, -1.927744, 0.2352941, 1, 0, 1,
-0.5214072, 0.9845721, -1.404091, 0.2313726, 1, 0, 1,
-0.5185106, -0.3739409, -2.777982, 0.2235294, 1, 0, 1,
-0.5089765, -1.775101, -1.86403, 0.2196078, 1, 0, 1,
-0.5049443, 1.13264, -0.7385151, 0.2117647, 1, 0, 1,
-0.5043517, 1.416199, -2.957069, 0.2078431, 1, 0, 1,
-0.5036594, -0.5510506, -3.147616, 0.2, 1, 0, 1,
-0.4965748, -0.07631722, -1.163635, 0.1921569, 1, 0, 1,
-0.4958211, 1.180128, -0.5834432, 0.1882353, 1, 0, 1,
-0.4951162, 0.4823814, -0.7991706, 0.1803922, 1, 0, 1,
-0.4947403, 0.3055282, -0.6339656, 0.1764706, 1, 0, 1,
-0.4937601, -0.1731899, -0.6543661, 0.1686275, 1, 0, 1,
-0.491842, -0.7248515, -2.637448, 0.1647059, 1, 0, 1,
-0.4896756, 0.2925093, -1.285252, 0.1568628, 1, 0, 1,
-0.4879541, -0.7537263, -0.7473354, 0.1529412, 1, 0, 1,
-0.4866873, 0.9577149, 0.4239345, 0.145098, 1, 0, 1,
-0.4862972, 1.497359, -1.104878, 0.1411765, 1, 0, 1,
-0.4838062, 0.1617925, -0.9446874, 0.1333333, 1, 0, 1,
-0.4817006, 2.043626, -0.6022651, 0.1294118, 1, 0, 1,
-0.4751276, -0.2307087, -2.964388, 0.1215686, 1, 0, 1,
-0.4749477, -0.3310005, -0.8386006, 0.1176471, 1, 0, 1,
-0.4710928, -1.526722, -4.445435, 0.1098039, 1, 0, 1,
-0.4611852, 0.3137126, -1.856539, 0.1058824, 1, 0, 1,
-0.4585883, -0.9707739, -1.062277, 0.09803922, 1, 0, 1,
-0.4506933, 0.8244473, 0.2700183, 0.09019608, 1, 0, 1,
-0.4499757, 1.75478, -1.72455, 0.08627451, 1, 0, 1,
-0.447358, -0.3129438, -1.391698, 0.07843138, 1, 0, 1,
-0.4467301, 0.3815725, -1.12718, 0.07450981, 1, 0, 1,
-0.4456617, 0.6920353, -0.2697237, 0.06666667, 1, 0, 1,
-0.4438961, 1.628044, 1.100769, 0.0627451, 1, 0, 1,
-0.4436222, -0.4243715, -2.539411, 0.05490196, 1, 0, 1,
-0.4357234, 0.4000363, -1.161822, 0.05098039, 1, 0, 1,
-0.4342409, 1.299112, 0.7361346, 0.04313726, 1, 0, 1,
-0.433643, -0.6263586, -3.981727, 0.03921569, 1, 0, 1,
-0.4327177, -0.4185627, -4.495812, 0.03137255, 1, 0, 1,
-0.4281282, -0.827305, -4.072073, 0.02745098, 1, 0, 1,
-0.4205986, 0.06751533, 0.4327877, 0.01960784, 1, 0, 1,
-0.4199984, 0.6467592, -0.8083205, 0.01568628, 1, 0, 1,
-0.4172192, 0.1120197, -2.062524, 0.007843138, 1, 0, 1,
-0.4162175, 0.4547269, 0.5925002, 0.003921569, 1, 0, 1,
-0.4141209, -0.855611, -2.336726, 0, 1, 0.003921569, 1,
-0.407177, 1.151933, 0.4223748, 0, 1, 0.01176471, 1,
-0.4047299, 0.2421418, -1.919631, 0, 1, 0.01568628, 1,
-0.4014199, -0.02669736, -3.789233, 0, 1, 0.02352941, 1,
-0.3991441, -0.5836913, -3.460104, 0, 1, 0.02745098, 1,
-0.3981643, -0.569132, -4.904985, 0, 1, 0.03529412, 1,
-0.3961333, -0.1665726, -2.736867, 0, 1, 0.03921569, 1,
-0.3956896, 1.099313, 0.03723169, 0, 1, 0.04705882, 1,
-0.3898941, -1.579525, -3.573215, 0, 1, 0.05098039, 1,
-0.3892531, -0.9068167, -5.206536, 0, 1, 0.05882353, 1,
-0.3847669, 0.9253253, -2.272367, 0, 1, 0.0627451, 1,
-0.3828724, -0.1233383, -3.09676, 0, 1, 0.07058824, 1,
-0.3799124, 0.9965978, -1.001444, 0, 1, 0.07450981, 1,
-0.3793906, 1.845545, 0.329085, 0, 1, 0.08235294, 1,
-0.374798, 0.8664574, -0.1856422, 0, 1, 0.08627451, 1,
-0.3746127, -1.96649, -2.495845, 0, 1, 0.09411765, 1,
-0.3741624, 1.524734, 0.01332487, 0, 1, 0.1019608, 1,
-0.3659292, 0.6478663, -0.06500755, 0, 1, 0.1058824, 1,
-0.3649814, 0.09316008, -1.036738, 0, 1, 0.1137255, 1,
-0.3644566, 0.6164385, -0.1087044, 0, 1, 0.1176471, 1,
-0.3642826, -2.311643, -0.9466089, 0, 1, 0.1254902, 1,
-0.3551421, 1.606615, -0.363947, 0, 1, 0.1294118, 1,
-0.3516295, -0.3720172, -3.399544, 0, 1, 0.1372549, 1,
-0.3507659, -0.99125, -1.237932, 0, 1, 0.1411765, 1,
-0.3506249, 1.16932, 0.5286536, 0, 1, 0.1490196, 1,
-0.3481002, 0.094791, -1.103242, 0, 1, 0.1529412, 1,
-0.3454042, -0.07458957, -1.717937, 0, 1, 0.1607843, 1,
-0.3437324, 0.188945, -2.843806, 0, 1, 0.1647059, 1,
-0.3388372, 2.405339, -1.414615, 0, 1, 0.172549, 1,
-0.3362978, -0.4677956, -4.167982, 0, 1, 0.1764706, 1,
-0.3348311, 1.051929, -1.544602, 0, 1, 0.1843137, 1,
-0.3340385, 0.2895417, -2.567673, 0, 1, 0.1882353, 1,
-0.3313045, 0.4426357, -1.122635, 0, 1, 0.1960784, 1,
-0.3268064, 0.9430383, -1.754198, 0, 1, 0.2039216, 1,
-0.3256038, 0.3791879, 0.2762648, 0, 1, 0.2078431, 1,
-0.3247714, 0.2209226, -0.9748116, 0, 1, 0.2156863, 1,
-0.3193979, -0.5416542, -3.453303, 0, 1, 0.2196078, 1,
-0.3187256, 1.044106, 0.444258, 0, 1, 0.227451, 1,
-0.3140108, -0.5283617, 0.7815953, 0, 1, 0.2313726, 1,
-0.3126603, 1.310143, -1.93175, 0, 1, 0.2392157, 1,
-0.3124944, -0.3035206, -3.98858, 0, 1, 0.2431373, 1,
-0.3119271, 0.9852417, -1.41104, 0, 1, 0.2509804, 1,
-0.309396, 0.8050222, 0.07591572, 0, 1, 0.254902, 1,
-0.3092456, -1.028025, -3.92333, 0, 1, 0.2627451, 1,
-0.3084709, -0.4132175, -3.74435, 0, 1, 0.2666667, 1,
-0.308231, -0.1935969, -4.460707, 0, 1, 0.2745098, 1,
-0.3078265, -0.5634972, -2.694868, 0, 1, 0.2784314, 1,
-0.3015623, 0.7617835, -0.7778525, 0, 1, 0.2862745, 1,
-0.301027, 0.3974825, -0.2759075, 0, 1, 0.2901961, 1,
-0.2951239, 0.254872, -0.6142499, 0, 1, 0.2980392, 1,
-0.2946517, 1.272882, -0.8353416, 0, 1, 0.3058824, 1,
-0.2925532, 0.6737632, -1.057769, 0, 1, 0.3098039, 1,
-0.2914493, -2.22141, -4.427521, 0, 1, 0.3176471, 1,
-0.2893796, -0.2693439, -2.481784, 0, 1, 0.3215686, 1,
-0.278666, 0.178478, 0.3658259, 0, 1, 0.3294118, 1,
-0.2700534, 3.06218, -0.121353, 0, 1, 0.3333333, 1,
-0.2630025, 0.54536, -1.558363, 0, 1, 0.3411765, 1,
-0.2625021, -0.924094, -3.408012, 0, 1, 0.345098, 1,
-0.2610238, -1.168844, -4.621157, 0, 1, 0.3529412, 1,
-0.2607827, -0.08028767, 1.025888, 0, 1, 0.3568628, 1,
-0.2579457, -0.9803611, -2.766921, 0, 1, 0.3647059, 1,
-0.256738, -1.521525, -3.76335, 0, 1, 0.3686275, 1,
-0.254198, 0.1923826, -0.08710025, 0, 1, 0.3764706, 1,
-0.2539433, 0.769026, 1.46023, 0, 1, 0.3803922, 1,
-0.2488064, 0.5286866, -1.194999, 0, 1, 0.3882353, 1,
-0.2443654, 0.7362043, 0.1294068, 0, 1, 0.3921569, 1,
-0.2360917, 0.5937256, 0.1839114, 0, 1, 0.4, 1,
-0.2326566, -0.5997434, -0.8245536, 0, 1, 0.4078431, 1,
-0.2299877, -0.4380522, -4.270573, 0, 1, 0.4117647, 1,
-0.2270579, 1.485353, 1.50148, 0, 1, 0.4196078, 1,
-0.2240447, -1.399155, -3.626968, 0, 1, 0.4235294, 1,
-0.2211459, 0.7829133, -1.121421, 0, 1, 0.4313726, 1,
-0.2204153, -0.1287819, -3.852352, 0, 1, 0.4352941, 1,
-0.2123687, -1.142144, -2.351552, 0, 1, 0.4431373, 1,
-0.2103719, 1.215086, -0.2336061, 0, 1, 0.4470588, 1,
-0.2099479, -0.7041342, -2.467198, 0, 1, 0.454902, 1,
-0.2075381, 0.4576724, -1.101173, 0, 1, 0.4588235, 1,
-0.2059959, 0.1670659, -1.452847, 0, 1, 0.4666667, 1,
-0.2055187, -1.083602, -4.430395, 0, 1, 0.4705882, 1,
-0.203824, -0.6247658, -0.583904, 0, 1, 0.4784314, 1,
-0.2030961, 1.301464, -0.8274119, 0, 1, 0.4823529, 1,
-0.2005835, 0.8382145, -1.629768, 0, 1, 0.4901961, 1,
-0.1954834, 0.09159781, -1.735611, 0, 1, 0.4941176, 1,
-0.1906172, 0.1404474, -0.6107638, 0, 1, 0.5019608, 1,
-0.1892837, 1.290416, -0.5194065, 0, 1, 0.509804, 1,
-0.1861044, -0.9771994, -4.677528, 0, 1, 0.5137255, 1,
-0.1815483, -0.8456022, -2.719876, 0, 1, 0.5215687, 1,
-0.1784614, 0.1374044, -0.2558015, 0, 1, 0.5254902, 1,
-0.1754448, 0.960831, -0.3576592, 0, 1, 0.5333334, 1,
-0.1754368, 0.6838951, -0.884226, 0, 1, 0.5372549, 1,
-0.1731515, -0.1315771, -4.151834, 0, 1, 0.5450981, 1,
-0.170874, -0.711957, -1.215734, 0, 1, 0.5490196, 1,
-0.1693833, -1.963152, -3.600547, 0, 1, 0.5568628, 1,
-0.1686904, -1.460281, -2.943558, 0, 1, 0.5607843, 1,
-0.1660315, -2.444302, -1.75694, 0, 1, 0.5686275, 1,
-0.1589473, -0.2478554, -2.545839, 0, 1, 0.572549, 1,
-0.1567581, 0.3751526, 0.484052, 0, 1, 0.5803922, 1,
-0.1554065, -1.258612, -2.252628, 0, 1, 0.5843138, 1,
-0.1539328, 0.3878033, 0.1719942, 0, 1, 0.5921569, 1,
-0.1538853, 0.8186205, 1.670547, 0, 1, 0.5960785, 1,
-0.1462103, 1.360847, -0.4433231, 0, 1, 0.6039216, 1,
-0.1450455, -3.609224, -4.546, 0, 1, 0.6117647, 1,
-0.144057, 0.3229221, 0.52758, 0, 1, 0.6156863, 1,
-0.1419232, -1.866831, -0.6333553, 0, 1, 0.6235294, 1,
-0.1403527, 0.05584287, 0.3489254, 0, 1, 0.627451, 1,
-0.1381942, -0.4620218, -3.231097, 0, 1, 0.6352941, 1,
-0.1358513, 0.1931238, -1.389032, 0, 1, 0.6392157, 1,
-0.1351745, 0.1641572, -0.2792186, 0, 1, 0.6470588, 1,
-0.1338199, 0.4301971, -1.911336, 0, 1, 0.6509804, 1,
-0.1314483, 1.508178, 0.3178419, 0, 1, 0.6588235, 1,
-0.1302873, 0.7081332, -0.4761509, 0, 1, 0.6627451, 1,
-0.1298465, 1.674294, -0.5172122, 0, 1, 0.6705883, 1,
-0.1286721, -1.279434, -3.679372, 0, 1, 0.6745098, 1,
-0.1268988, 0.1367677, -2.158009, 0, 1, 0.682353, 1,
-0.1268036, -0.6524534, -3.559588, 0, 1, 0.6862745, 1,
-0.1218491, -1.681539, -2.900815, 0, 1, 0.6941177, 1,
-0.1201161, -0.6413718, -2.110578, 0, 1, 0.7019608, 1,
-0.1194363, -0.8342327, -2.098457, 0, 1, 0.7058824, 1,
-0.1163182, 1.346004, 0.1328889, 0, 1, 0.7137255, 1,
-0.108897, 0.9460714, -0.6037246, 0, 1, 0.7176471, 1,
-0.1070035, -1.668594, -4.95231, 0, 1, 0.7254902, 1,
-0.10581, -1.357931, -2.515477, 0, 1, 0.7294118, 1,
-0.1020222, -0.6223902, -1.572433, 0, 1, 0.7372549, 1,
-0.09587339, 0.3971444, -1.033003, 0, 1, 0.7411765, 1,
-0.09362362, 1.118091, -1.546225, 0, 1, 0.7490196, 1,
-0.09142082, 1.90992, -0.4787707, 0, 1, 0.7529412, 1,
-0.09103812, 0.8407517, -1.709862, 0, 1, 0.7607843, 1,
-0.09093544, 0.4435472, -1.107962, 0, 1, 0.7647059, 1,
-0.08946414, 0.3188438, 0.3587529, 0, 1, 0.772549, 1,
-0.08839493, 0.2168915, 0.7662781, 0, 1, 0.7764706, 1,
-0.08435971, 0.1703481, -1.147154, 0, 1, 0.7843137, 1,
-0.0840127, 0.5543501, -0.5563867, 0, 1, 0.7882353, 1,
-0.08145011, -0.2676892, -2.475788, 0, 1, 0.7960784, 1,
-0.07547526, 0.8892358, 0.8329452, 0, 1, 0.8039216, 1,
-0.07481217, -0.5152922, -3.303034, 0, 1, 0.8078431, 1,
-0.07396299, -0.1829047, -1.323881, 0, 1, 0.8156863, 1,
-0.07177118, 0.07596686, -0.5457197, 0, 1, 0.8196079, 1,
-0.06776588, 0.07732711, 0.6238572, 0, 1, 0.827451, 1,
-0.0645337, -1.048552, -1.948182, 0, 1, 0.8313726, 1,
-0.05827304, -0.8692174, -4.534756, 0, 1, 0.8392157, 1,
-0.05504706, -1.961846, -5.099732, 0, 1, 0.8431373, 1,
-0.0539758, 0.5979245, -0.4534739, 0, 1, 0.8509804, 1,
-0.05250478, -0.760942, -2.967257, 0, 1, 0.854902, 1,
-0.04725088, 1.418901, -0.8509707, 0, 1, 0.8627451, 1,
-0.04597041, -2.868699, -3.666602, 0, 1, 0.8666667, 1,
-0.04501575, 1.51672, -0.1847577, 0, 1, 0.8745098, 1,
-0.04484608, -0.06657367, -1.585193, 0, 1, 0.8784314, 1,
-0.04195939, 0.7499343, 0.3235292, 0, 1, 0.8862745, 1,
-0.04029203, -0.7172928, -3.70246, 0, 1, 0.8901961, 1,
-0.03869778, 0.4220955, -0.3898199, 0, 1, 0.8980392, 1,
-0.03535619, -1.97305, -2.06014, 0, 1, 0.9058824, 1,
-0.03453526, -0.5262404, -1.646336, 0, 1, 0.9098039, 1,
-0.03257147, -1.212051, -1.954616, 0, 1, 0.9176471, 1,
-0.03207367, -0.8328799, -3.950848, 0, 1, 0.9215686, 1,
-0.03143274, 0.6355791, 1.318219, 0, 1, 0.9294118, 1,
-0.03113101, 1.435941, -0.9464372, 0, 1, 0.9333333, 1,
-0.03019543, -0.5357336, -3.194647, 0, 1, 0.9411765, 1,
-0.02645401, -0.4383483, -1.595859, 0, 1, 0.945098, 1,
-0.026219, 1.355928, -0.496985, 0, 1, 0.9529412, 1,
-0.02498642, 0.1960365, 0.773751, 0, 1, 0.9568627, 1,
-0.02334339, -0.000703717, -2.212089, 0, 1, 0.9647059, 1,
-0.02310183, 0.745673, -0.6142203, 0, 1, 0.9686275, 1,
-0.02284084, 0.4185093, -0.3819042, 0, 1, 0.9764706, 1,
-0.01751339, -0.04826442, -3.06526, 0, 1, 0.9803922, 1,
-0.01592134, 0.8793219, -2.041149, 0, 1, 0.9882353, 1,
-0.01443871, 1.198019, 0.1865279, 0, 1, 0.9921569, 1,
-0.01156467, -0.7277829, -4.041295, 0, 1, 1, 1,
-0.009961208, -0.01197041, -2.585684, 0, 0.9921569, 1, 1,
-0.007684418, -0.8253828, -3.092088, 0, 0.9882353, 1, 1,
-0.007299554, -0.0297794, -4.718739, 0, 0.9803922, 1, 1,
-0.006705615, -0.5438586, -2.932407, 0, 0.9764706, 1, 1,
-0.006156663, 1.15601, -0.002357063, 0, 0.9686275, 1, 1,
-0.002755421, 1.496797, 0.830915, 0, 0.9647059, 1, 1,
-0.0005499542, 3.383919, 0.8193048, 0, 0.9568627, 1, 1,
-1.12104e-05, 1.300246, 0.03650533, 0, 0.9529412, 1, 1,
0.002197247, 1.156935, 2.321833, 0, 0.945098, 1, 1,
0.008695254, -1.153986, 2.355296, 0, 0.9411765, 1, 1,
0.009242064, 0.19338, -0.482116, 0, 0.9333333, 1, 1,
0.01254538, 0.6278651, 0.2648288, 0, 0.9294118, 1, 1,
0.01273614, -0.6451253, 1.407813, 0, 0.9215686, 1, 1,
0.01662015, -1.499952, 4.318201, 0, 0.9176471, 1, 1,
0.01912794, 1.77104, 0.7546647, 0, 0.9098039, 1, 1,
0.02145017, -2.159284, 2.963185, 0, 0.9058824, 1, 1,
0.02185412, -0.3937795, 3.162328, 0, 0.8980392, 1, 1,
0.0234781, -1.945717, 2.536374, 0, 0.8901961, 1, 1,
0.03261596, -0.08586709, 3.620264, 0, 0.8862745, 1, 1,
0.03596843, -0.8572201, 3.743462, 0, 0.8784314, 1, 1,
0.03640452, 0.9154479, -0.7152776, 0, 0.8745098, 1, 1,
0.04210326, 0.1411196, 0.8021538, 0, 0.8666667, 1, 1,
0.04549048, -0.5635806, 3.287717, 0, 0.8627451, 1, 1,
0.04753076, 0.9264582, -0.4930048, 0, 0.854902, 1, 1,
0.04802381, 1.929724, 0.7003413, 0, 0.8509804, 1, 1,
0.04925425, -0.01210867, 1.191695, 0, 0.8431373, 1, 1,
0.05129352, 0.1141694, -1.462278, 0, 0.8392157, 1, 1,
0.05498604, -0.01826075, 2.856961, 0, 0.8313726, 1, 1,
0.05520438, 0.1119493, -0.3384412, 0, 0.827451, 1, 1,
0.05591132, 0.5454057, 0.1873009, 0, 0.8196079, 1, 1,
0.05781026, -0.5013089, 3.101117, 0, 0.8156863, 1, 1,
0.06086703, -0.08271246, 2.373032, 0, 0.8078431, 1, 1,
0.06567287, -0.2833435, 0.2860269, 0, 0.8039216, 1, 1,
0.06907675, 0.06776067, 1.448275, 0, 0.7960784, 1, 1,
0.07029077, -1.021547, 3.448081, 0, 0.7882353, 1, 1,
0.07394847, 2.34855, -1.712227, 0, 0.7843137, 1, 1,
0.07744419, 0.274811, 0.3127074, 0, 0.7764706, 1, 1,
0.07898427, -0.3752559, 4.174757, 0, 0.772549, 1, 1,
0.07917943, -0.113087, 2.388237, 0, 0.7647059, 1, 1,
0.08742584, 0.291186, 0.6419148, 0, 0.7607843, 1, 1,
0.08920704, -0.6563108, 3.24009, 0, 0.7529412, 1, 1,
0.09107511, -0.5868956, 1.845043, 0, 0.7490196, 1, 1,
0.0913344, 1.840779, -0.4124697, 0, 0.7411765, 1, 1,
0.09260684, -0.7476054, 2.191988, 0, 0.7372549, 1, 1,
0.09528631, 0.08866771, 2.271476, 0, 0.7294118, 1, 1,
0.09697112, 0.469499, 1.75169, 0, 0.7254902, 1, 1,
0.09768021, 1.279412, 0.718958, 0, 0.7176471, 1, 1,
0.09888258, 1.036593, -0.2336755, 0, 0.7137255, 1, 1,
0.1000666, 0.05310404, 1.215815, 0, 0.7058824, 1, 1,
0.1038454, 2.156875, 0.6473168, 0, 0.6980392, 1, 1,
0.1044548, -0.170124, 3.420034, 0, 0.6941177, 1, 1,
0.1117878, -0.2555753, 3.626199, 0, 0.6862745, 1, 1,
0.1236556, 0.5760942, 0.5734855, 0, 0.682353, 1, 1,
0.1266027, 0.7625858, 0.1635573, 0, 0.6745098, 1, 1,
0.1292555, -0.3569683, 3.725825, 0, 0.6705883, 1, 1,
0.1294816, 0.933113, 0.8060312, 0, 0.6627451, 1, 1,
0.1341858, 0.1333022, 1.132714, 0, 0.6588235, 1, 1,
0.1364694, -1.243474, 2.353792, 0, 0.6509804, 1, 1,
0.1372547, 0.3541198, -1.013234, 0, 0.6470588, 1, 1,
0.1381244, -0.6687191, 3.578901, 0, 0.6392157, 1, 1,
0.1389133, 0.9075841, 0.3539335, 0, 0.6352941, 1, 1,
0.1400054, -1.446772, 4.374963, 0, 0.627451, 1, 1,
0.140136, 1.433088, -0.05794845, 0, 0.6235294, 1, 1,
0.1404534, -1.083908, 3.323126, 0, 0.6156863, 1, 1,
0.140589, -0.04946302, 0.9415157, 0, 0.6117647, 1, 1,
0.1425442, 0.3336791, -0.6222346, 0, 0.6039216, 1, 1,
0.1440924, -0.1759014, 0.5225435, 0, 0.5960785, 1, 1,
0.1453616, 0.6173525, 1.181439, 0, 0.5921569, 1, 1,
0.1481106, -0.8941006, 2.365826, 0, 0.5843138, 1, 1,
0.1489085, 0.4271007, 1.872747, 0, 0.5803922, 1, 1,
0.1568971, -0.3740594, 2.186478, 0, 0.572549, 1, 1,
0.157366, 0.9642033, -1.377891, 0, 0.5686275, 1, 1,
0.1613986, 0.04457987, 0.5465247, 0, 0.5607843, 1, 1,
0.1665868, -0.0511845, 1.644708, 0, 0.5568628, 1, 1,
0.1675647, -1.165735, 3.007985, 0, 0.5490196, 1, 1,
0.1702673, 1.675336, 0.015048, 0, 0.5450981, 1, 1,
0.1739991, 0.7886726, -1.69957, 0, 0.5372549, 1, 1,
0.1789857, 1.851923, -0.6797721, 0, 0.5333334, 1, 1,
0.18478, 0.5643278, -1.801428, 0, 0.5254902, 1, 1,
0.188751, -1.226604, 3.470711, 0, 0.5215687, 1, 1,
0.1938567, -0.1894253, 1.207835, 0, 0.5137255, 1, 1,
0.1963112, -0.3387884, 0.7344955, 0, 0.509804, 1, 1,
0.1970674, -0.6384873, 2.545303, 0, 0.5019608, 1, 1,
0.1972949, 0.1041728, 0.03272686, 0, 0.4941176, 1, 1,
0.2005292, 0.607229, 0.1385678, 0, 0.4901961, 1, 1,
0.2045768, 0.06195292, 0.7016367, 0, 0.4823529, 1, 1,
0.2050176, -0.51324, 1.326399, 0, 0.4784314, 1, 1,
0.2058795, 0.3916634, 0.9880639, 0, 0.4705882, 1, 1,
0.2059311, -0.5949682, 3.497248, 0, 0.4666667, 1, 1,
0.2065858, -1.964532, 1.769807, 0, 0.4588235, 1, 1,
0.2074574, 0.3025378, 2.003921, 0, 0.454902, 1, 1,
0.212184, 1.336412, -0.4376701, 0, 0.4470588, 1, 1,
0.2137774, 0.3084622, -1.988505, 0, 0.4431373, 1, 1,
0.2146683, -0.3144622, 1.845514, 0, 0.4352941, 1, 1,
0.2147303, -0.5854196, 1.866626, 0, 0.4313726, 1, 1,
0.2159757, -0.2179193, 1.752318, 0, 0.4235294, 1, 1,
0.2193103, -0.2933052, 1.69149, 0, 0.4196078, 1, 1,
0.2286577, -0.04393062, 3.458805, 0, 0.4117647, 1, 1,
0.233601, -0.05325522, 0.5789922, 0, 0.4078431, 1, 1,
0.2339865, 1.063743, -2.093976, 0, 0.4, 1, 1,
0.2361514, -1.105744, 3.174009, 0, 0.3921569, 1, 1,
0.2466301, -0.9146376, 2.330941, 0, 0.3882353, 1, 1,
0.247217, 1.049253, -0.6481404, 0, 0.3803922, 1, 1,
0.2479738, -0.5996448, 2.872465, 0, 0.3764706, 1, 1,
0.2492914, 0.7844502, -1.455879, 0, 0.3686275, 1, 1,
0.2512019, 0.5890753, -0.513835, 0, 0.3647059, 1, 1,
0.2518575, 0.8578631, -1.604522, 0, 0.3568628, 1, 1,
0.2521129, -1.3059, 4.567227, 0, 0.3529412, 1, 1,
0.2565108, -1.252308, 3.612723, 0, 0.345098, 1, 1,
0.2576391, 0.1273986, -1.639057, 0, 0.3411765, 1, 1,
0.2593884, -1.655422, 4.394617, 0, 0.3333333, 1, 1,
0.2609014, -0.4475999, 2.802117, 0, 0.3294118, 1, 1,
0.2709619, -0.5835726, 0.5415279, 0, 0.3215686, 1, 1,
0.275704, 0.8013279, -1.083324, 0, 0.3176471, 1, 1,
0.2758506, 0.7788432, 0.9641397, 0, 0.3098039, 1, 1,
0.2827519, 0.501624, 1.210569, 0, 0.3058824, 1, 1,
0.2902416, -0.4318011, 1.051069, 0, 0.2980392, 1, 1,
0.2914863, 1.087231, 0.2955249, 0, 0.2901961, 1, 1,
0.296995, -1.566406, 2.836187, 0, 0.2862745, 1, 1,
0.2978113, 1.43655, -1.285756, 0, 0.2784314, 1, 1,
0.3041868, -1.535297, 1.585143, 0, 0.2745098, 1, 1,
0.3048059, 0.2834808, 0.477374, 0, 0.2666667, 1, 1,
0.3073016, -0.9869387, 2.872994, 0, 0.2627451, 1, 1,
0.308999, -0.8339144, 3.529371, 0, 0.254902, 1, 1,
0.3126032, 0.486279, 1.494853, 0, 0.2509804, 1, 1,
0.3128284, 1.326879, -1.162303, 0, 0.2431373, 1, 1,
0.3184109, -0.5997624, 1.0429, 0, 0.2392157, 1, 1,
0.3194302, -0.9999383, 1.886913, 0, 0.2313726, 1, 1,
0.3223207, -0.30768, 3.582748, 0, 0.227451, 1, 1,
0.3225574, 0.956018, -1.188655, 0, 0.2196078, 1, 1,
0.3241081, 0.9771835, 0.3437484, 0, 0.2156863, 1, 1,
0.3266539, 1.513058, 0.4866556, 0, 0.2078431, 1, 1,
0.3312739, -1.242531, 3.699594, 0, 0.2039216, 1, 1,
0.3319328, -1.296079, 3.137946, 0, 0.1960784, 1, 1,
0.3357805, 0.06542756, 1.637056, 0, 0.1882353, 1, 1,
0.3370517, -0.4647572, 1.783007, 0, 0.1843137, 1, 1,
0.3394268, 0.864938, -0.1283898, 0, 0.1764706, 1, 1,
0.339932, 1.085089, -0.5437173, 0, 0.172549, 1, 1,
0.3467327, 0.9928097, -0.5272503, 0, 0.1647059, 1, 1,
0.3498285, -0.2671971, 3.642783, 0, 0.1607843, 1, 1,
0.3583253, -2.4965, 1.737375, 0, 0.1529412, 1, 1,
0.3586736, -0.5107719, 4.462745, 0, 0.1490196, 1, 1,
0.3602797, 0.5621113, 0.9322861, 0, 0.1411765, 1, 1,
0.3622881, 0.06133243, -0.2088689, 0, 0.1372549, 1, 1,
0.3626004, 0.9327483, -0.5778033, 0, 0.1294118, 1, 1,
0.3673304, -1.232036, 2.574289, 0, 0.1254902, 1, 1,
0.368899, -0.4132704, 3.236472, 0, 0.1176471, 1, 1,
0.3694341, 0.1871921, 0.7441273, 0, 0.1137255, 1, 1,
0.369498, -0.6206751, 3.100204, 0, 0.1058824, 1, 1,
0.3698664, 1.643722, -0.6548519, 0, 0.09803922, 1, 1,
0.370481, 1.083251, 0.6491215, 0, 0.09411765, 1, 1,
0.3735787, 0.5982459, 0.04796969, 0, 0.08627451, 1, 1,
0.3769565, -0.2136718, 2.40453, 0, 0.08235294, 1, 1,
0.3806576, -0.3747818, 3.65548, 0, 0.07450981, 1, 1,
0.3822049, 0.2587653, 0.1278967, 0, 0.07058824, 1, 1,
0.3862659, 1.139847, 0.9455909, 0, 0.0627451, 1, 1,
0.3867016, -0.9194577, 0.8695501, 0, 0.05882353, 1, 1,
0.387643, 0.491087, 2.514326, 0, 0.05098039, 1, 1,
0.388063, 0.3641993, 0.8919831, 0, 0.04705882, 1, 1,
0.3884211, -1.102014, 2.242, 0, 0.03921569, 1, 1,
0.3951263, -0.6507898, 3.585325, 0, 0.03529412, 1, 1,
0.3956908, 0.2588624, 1.837271, 0, 0.02745098, 1, 1,
0.3964426, -0.3441661, 1.428876, 0, 0.02352941, 1, 1,
0.4007755, 1.033139, 1.145239, 0, 0.01568628, 1, 1,
0.4053674, 1.023029, -0.858793, 0, 0.01176471, 1, 1,
0.4055193, -0.9666683, 4.732371, 0, 0.003921569, 1, 1,
0.407642, 0.9571, 1.623999, 0.003921569, 0, 1, 1,
0.4084187, 0.8980045, 0.3849642, 0.007843138, 0, 1, 1,
0.4087624, -0.7807051, 3.17946, 0.01568628, 0, 1, 1,
0.4088157, -3.049311, 4.267995, 0.01960784, 0, 1, 1,
0.4112177, -0.6788633, 2.877266, 0.02745098, 0, 1, 1,
0.4126003, -0.1962953, 1.330719, 0.03137255, 0, 1, 1,
0.4134587, -0.1196183, 2.19018, 0.03921569, 0, 1, 1,
0.4158802, 1.477412, 0.0305769, 0.04313726, 0, 1, 1,
0.4204752, -0.5142145, 2.343325, 0.05098039, 0, 1, 1,
0.4258754, 0.824866, -0.20107, 0.05490196, 0, 1, 1,
0.4332937, 0.4471151, 1.871919, 0.0627451, 0, 1, 1,
0.4336397, 2.122089, 0.3588495, 0.06666667, 0, 1, 1,
0.4353022, 1.017802, 0.2266437, 0.07450981, 0, 1, 1,
0.4370706, -1.372251, 3.793584, 0.07843138, 0, 1, 1,
0.4371665, -0.113546, 1.819086, 0.08627451, 0, 1, 1,
0.4372976, -0.5416068, 3.966937, 0.09019608, 0, 1, 1,
0.4425266, -0.5690765, 1.808458, 0.09803922, 0, 1, 1,
0.4431754, 0.4656332, 0.7105683, 0.1058824, 0, 1, 1,
0.4438755, 3.071378, -1.250383, 0.1098039, 0, 1, 1,
0.4486032, 0.2853361, 2.239919, 0.1176471, 0, 1, 1,
0.4499052, 0.7576062, 2.26176, 0.1215686, 0, 1, 1,
0.4558321, 1.066459, 2.612479, 0.1294118, 0, 1, 1,
0.4568329, -0.4107472, 3.508082, 0.1333333, 0, 1, 1,
0.4599863, -1.221714, 2.760902, 0.1411765, 0, 1, 1,
0.4632547, 0.3474958, 1.826679, 0.145098, 0, 1, 1,
0.4653617, -0.8431604, 2.088429, 0.1529412, 0, 1, 1,
0.4664179, 1.409331, 0.7290402, 0.1568628, 0, 1, 1,
0.467566, -0.8141675, 4.767522, 0.1647059, 0, 1, 1,
0.4696588, 0.3137544, 0.6925784, 0.1686275, 0, 1, 1,
0.4710109, 0.9807876, 0.8927649, 0.1764706, 0, 1, 1,
0.4719506, -0.05959025, 2.594047, 0.1803922, 0, 1, 1,
0.47741, -0.9522801, 3.176109, 0.1882353, 0, 1, 1,
0.4806514, -1.810821, 3.294501, 0.1921569, 0, 1, 1,
0.4834689, -1.277509, 2.885629, 0.2, 0, 1, 1,
0.4869382, -0.7589715, 1.428781, 0.2078431, 0, 1, 1,
0.4873375, -0.3700193, 2.15558, 0.2117647, 0, 1, 1,
0.4888854, 0.711432, 0.1805984, 0.2196078, 0, 1, 1,
0.4910798, 0.26152, 2.202427, 0.2235294, 0, 1, 1,
0.4913298, -0.02171373, 0.4661913, 0.2313726, 0, 1, 1,
0.4930443, -0.185156, 2.763955, 0.2352941, 0, 1, 1,
0.4937307, -0.009115538, 0.1135151, 0.2431373, 0, 1, 1,
0.4945386, -0.932088, 0.9650988, 0.2470588, 0, 1, 1,
0.4966217, -0.2558424, 2.07346, 0.254902, 0, 1, 1,
0.4976425, 0.6209306, 1.100016, 0.2588235, 0, 1, 1,
0.5113871, 0.8608602, -0.09393594, 0.2666667, 0, 1, 1,
0.5147625, 1.971634, -0.0682053, 0.2705882, 0, 1, 1,
0.5165673, 0.05739802, 0.2799417, 0.2784314, 0, 1, 1,
0.5168771, 0.7231171, 0.8942417, 0.282353, 0, 1, 1,
0.5173938, 0.1307842, 1.965581, 0.2901961, 0, 1, 1,
0.5222616, -1.528514, 4.480515, 0.2941177, 0, 1, 1,
0.5227307, 0.4002074, -0.3474892, 0.3019608, 0, 1, 1,
0.5285612, -0.8088086, 1.423269, 0.3098039, 0, 1, 1,
0.5296337, 0.1750388, 2.267546, 0.3137255, 0, 1, 1,
0.5305232, -1.457192, 2.189711, 0.3215686, 0, 1, 1,
0.5360252, 2.029621, 1.524006, 0.3254902, 0, 1, 1,
0.5393081, -1.250489, 2.39562, 0.3333333, 0, 1, 1,
0.54106, -0.2810348, 2.785386, 0.3372549, 0, 1, 1,
0.5433908, -0.7545869, 5.195519, 0.345098, 0, 1, 1,
0.5439346, -0.3780409, 2.761718, 0.3490196, 0, 1, 1,
0.5471374, 1.262041, -0.5101924, 0.3568628, 0, 1, 1,
0.5474445, -1.201642, 2.595681, 0.3607843, 0, 1, 1,
0.5501626, -0.549735, 2.298692, 0.3686275, 0, 1, 1,
0.5570128, 0.418685, 0.03183308, 0.372549, 0, 1, 1,
0.559453, 1.081715, -1.953485, 0.3803922, 0, 1, 1,
0.5619668, 0.4353468, 1.279686, 0.3843137, 0, 1, 1,
0.5622654, -0.06572933, 2.476945, 0.3921569, 0, 1, 1,
0.5650312, 0.5680375, 1.480744, 0.3960784, 0, 1, 1,
0.5676901, 0.8837844, 1.624406, 0.4039216, 0, 1, 1,
0.5742909, 0.4833491, 0.9172345, 0.4117647, 0, 1, 1,
0.5747409, -1.046641, 3.665976, 0.4156863, 0, 1, 1,
0.5772368, 0.1395895, 0.2275165, 0.4235294, 0, 1, 1,
0.5778309, -0.723537, 3.234941, 0.427451, 0, 1, 1,
0.5811464, -0.6621178, 1.997986, 0.4352941, 0, 1, 1,
0.5868381, -1.096413, 3.00141, 0.4392157, 0, 1, 1,
0.587239, 0.976092, 1.673029, 0.4470588, 0, 1, 1,
0.5922221, 2.008541, -0.8351101, 0.4509804, 0, 1, 1,
0.5951343, -0.2035091, 1.362646, 0.4588235, 0, 1, 1,
0.59531, -1.487397, 3.086278, 0.4627451, 0, 1, 1,
0.5971755, -0.3620046, 0.7462463, 0.4705882, 0, 1, 1,
0.6021851, 2.708585, 0.08548962, 0.4745098, 0, 1, 1,
0.6037732, 0.538408, 0.9430678, 0.4823529, 0, 1, 1,
0.6081937, 1.341951, -1.670136, 0.4862745, 0, 1, 1,
0.6137103, -0.9577183, 2.278367, 0.4941176, 0, 1, 1,
0.6163508, -0.1605979, 2.721822, 0.5019608, 0, 1, 1,
0.616964, 2.599203, 0.06292327, 0.5058824, 0, 1, 1,
0.618711, -0.1215593, 1.304272, 0.5137255, 0, 1, 1,
0.6210538, -0.5208589, -0.1641121, 0.5176471, 0, 1, 1,
0.6212233, -0.8994206, 3.64403, 0.5254902, 0, 1, 1,
0.6304178, -0.0115478, 1.16528, 0.5294118, 0, 1, 1,
0.64568, -0.4534348, 1.282053, 0.5372549, 0, 1, 1,
0.6499755, 0.01615017, 2.146861, 0.5411765, 0, 1, 1,
0.6697064, 0.2334879, 1.053116, 0.5490196, 0, 1, 1,
0.6757965, 1.001961, 1.355863, 0.5529412, 0, 1, 1,
0.6761509, -0.8636783, 1.11137, 0.5607843, 0, 1, 1,
0.679253, 2.111573, 2.063868, 0.5647059, 0, 1, 1,
0.6793858, 1.768442, -0.07092708, 0.572549, 0, 1, 1,
0.6827628, 1.063239, -0.1445291, 0.5764706, 0, 1, 1,
0.6830497, 1.328101, 0.180515, 0.5843138, 0, 1, 1,
0.6901614, -0.2449128, 0.9803646, 0.5882353, 0, 1, 1,
0.6994291, 1.114328, 1.318136, 0.5960785, 0, 1, 1,
0.7001754, -1.229212, 3.312332, 0.6039216, 0, 1, 1,
0.7012678, 1.34411, 0.5876274, 0.6078432, 0, 1, 1,
0.7025893, 0.8362095, 0.2457985, 0.6156863, 0, 1, 1,
0.7027358, 0.3297389, 1.604446, 0.6196079, 0, 1, 1,
0.707449, -0.98927, 2.661588, 0.627451, 0, 1, 1,
0.7185367, 0.131914, -0.1648829, 0.6313726, 0, 1, 1,
0.7198798, 0.6600355, 2.032427, 0.6392157, 0, 1, 1,
0.7208591, -0.1902111, 2.670876, 0.6431373, 0, 1, 1,
0.7218161, -0.1697811, 4.218887, 0.6509804, 0, 1, 1,
0.7236783, 0.5848298, 0.9198889, 0.654902, 0, 1, 1,
0.7270672, 0.1315691, 0.8954647, 0.6627451, 0, 1, 1,
0.7289707, -0.713067, 1.275877, 0.6666667, 0, 1, 1,
0.7370142, 1.889393, 1.72026, 0.6745098, 0, 1, 1,
0.7375366, -0.8906482, 3.820981, 0.6784314, 0, 1, 1,
0.7381611, 1.294567, -0.2756916, 0.6862745, 0, 1, 1,
0.738367, -0.09801846, -0.7224655, 0.6901961, 0, 1, 1,
0.7425188, -1.152698, 1.626203, 0.6980392, 0, 1, 1,
0.7427292, 0.2621467, 1.15029, 0.7058824, 0, 1, 1,
0.745276, -0.1899587, 2.226882, 0.7098039, 0, 1, 1,
0.7510781, -0.8228813, 3.968158, 0.7176471, 0, 1, 1,
0.7515973, -1.100279, 3.328884, 0.7215686, 0, 1, 1,
0.7562415, -0.06733967, 2.320478, 0.7294118, 0, 1, 1,
0.7582628, -0.7820668, 2.705732, 0.7333333, 0, 1, 1,
0.7615902, -0.3035852, 2.835018, 0.7411765, 0, 1, 1,
0.7623281, -1.255098, 2.998471, 0.7450981, 0, 1, 1,
0.7662482, 0.538752, 2.87432, 0.7529412, 0, 1, 1,
0.7716784, 1.338044, 0.7461265, 0.7568628, 0, 1, 1,
0.7791016, -0.7991832, 3.021584, 0.7647059, 0, 1, 1,
0.7840891, -0.8934515, 1.515685, 0.7686275, 0, 1, 1,
0.7844656, -0.6830477, 3.494421, 0.7764706, 0, 1, 1,
0.7919148, 0.5294569, 2.365623, 0.7803922, 0, 1, 1,
0.7945876, -0.4941054, 3.851891, 0.7882353, 0, 1, 1,
0.7998973, 0.07767902, 0.6166235, 0.7921569, 0, 1, 1,
0.8012862, 0.3797052, 2.10123, 0.8, 0, 1, 1,
0.8018484, 0.4044425, 2.336804, 0.8078431, 0, 1, 1,
0.8114774, 1.816395, -0.7667278, 0.8117647, 0, 1, 1,
0.812205, 1.955966, 0.5054197, 0.8196079, 0, 1, 1,
0.8279482, -1.241443, 2.185938, 0.8235294, 0, 1, 1,
0.8283606, 0.03108207, 2.449669, 0.8313726, 0, 1, 1,
0.8335715, -0.2509696, 2.787919, 0.8352941, 0, 1, 1,
0.8343854, 0.02695499, 0.2461989, 0.8431373, 0, 1, 1,
0.841499, 0.6319039, 0.9602196, 0.8470588, 0, 1, 1,
0.8519176, -1.102794, 0.5684175, 0.854902, 0, 1, 1,
0.8547764, -0.7680594, 2.669214, 0.8588235, 0, 1, 1,
0.8652245, 0.7109202, -0.98618, 0.8666667, 0, 1, 1,
0.8653724, -0.07891245, -0.3364116, 0.8705882, 0, 1, 1,
0.8706433, -1.643844, 3.021151, 0.8784314, 0, 1, 1,
0.8734249, 0.929764, 1.56664, 0.8823529, 0, 1, 1,
0.8747303, 0.1190103, 1.913595, 0.8901961, 0, 1, 1,
0.8758443, 0.6059942, 1.468547, 0.8941177, 0, 1, 1,
0.8790982, -0.9951833, 2.552404, 0.9019608, 0, 1, 1,
0.8815129, 0.7464412, -1.171391, 0.9098039, 0, 1, 1,
0.892489, -1.09335, 1.758233, 0.9137255, 0, 1, 1,
0.8946334, 0.5900977, 1.182066, 0.9215686, 0, 1, 1,
0.8960185, -0.4638957, 1.164782, 0.9254902, 0, 1, 1,
0.8963918, -0.2165236, 0.344543, 0.9333333, 0, 1, 1,
0.8970423, 0.0151159, -0.211137, 0.9372549, 0, 1, 1,
0.9054319, -0.3279471, 2.013026, 0.945098, 0, 1, 1,
0.9073879, 1.77375, -0.1286472, 0.9490196, 0, 1, 1,
0.9081063, -1.172818, 2.9953, 0.9568627, 0, 1, 1,
0.9084026, -0.5659782, 0.5111486, 0.9607843, 0, 1, 1,
0.9124665, -1.458115, 2.784464, 0.9686275, 0, 1, 1,
0.9127418, -0.02559399, 2.345038, 0.972549, 0, 1, 1,
0.9138907, -0.8886702, 4.264226, 0.9803922, 0, 1, 1,
0.9152741, 0.3659514, 0.9196955, 0.9843137, 0, 1, 1,
0.9226742, -1.063969, 0.5843105, 0.9921569, 0, 1, 1,
0.927476, 0.09181374, 0.5035373, 0.9960784, 0, 1, 1,
0.9377733, -0.521488, 3.049535, 1, 0, 0.9960784, 1,
0.9542018, 0.2199291, 1.215243, 1, 0, 0.9882353, 1,
0.9545837, -0.1166233, 1.158989, 1, 0, 0.9843137, 1,
0.9551435, -1.469766, 2.654272, 1, 0, 0.9764706, 1,
0.9589496, 0.7638841, 1.616059, 1, 0, 0.972549, 1,
0.9602339, -0.3179255, 3.102682, 1, 0, 0.9647059, 1,
0.9609006, 0.7582436, 1.494642, 1, 0, 0.9607843, 1,
0.9804662, 0.2929526, 0.3961588, 1, 0, 0.9529412, 1,
0.9822637, 0.9171758, 0.9991429, 1, 0, 0.9490196, 1,
0.988135, -0.8570127, 3.617829, 1, 0, 0.9411765, 1,
0.9895256, 0.8779998, 0.04812243, 1, 0, 0.9372549, 1,
0.9906723, 0.835098, 0.7421594, 1, 0, 0.9294118, 1,
0.9985045, -0.01847644, 0.5073965, 1, 0, 0.9254902, 1,
1.000329, 1.179677, 0.6638404, 1, 0, 0.9176471, 1,
1.001935, -0.3930898, 1.300494, 1, 0, 0.9137255, 1,
1.017426, 0.835918, 0.3805903, 1, 0, 0.9058824, 1,
1.022444, 0.5936491, 0.9158819, 1, 0, 0.9019608, 1,
1.027853, -0.2773434, 2.881559, 1, 0, 0.8941177, 1,
1.03007, 2.036716, -1.139933, 1, 0, 0.8862745, 1,
1.032024, 0.3375409, 0.5938582, 1, 0, 0.8823529, 1,
1.035717, -0.3461032, 1.999209, 1, 0, 0.8745098, 1,
1.050219, -0.6980792, 4.451481, 1, 0, 0.8705882, 1,
1.050547, 2.205895, 1.021341, 1, 0, 0.8627451, 1,
1.063798, -0.4383485, 1.507933, 1, 0, 0.8588235, 1,
1.065831, -1.609841, 3.604312, 1, 0, 0.8509804, 1,
1.065976, 0.4704826, 2.539911, 1, 0, 0.8470588, 1,
1.074801, 0.9692142, 1.712433, 1, 0, 0.8392157, 1,
1.076837, -1.264959, 1.519078, 1, 0, 0.8352941, 1,
1.076863, 1.661685, 1.123172, 1, 0, 0.827451, 1,
1.08042, 1.914493, 2.95491, 1, 0, 0.8235294, 1,
1.080738, 1.272845, 1.106275, 1, 0, 0.8156863, 1,
1.081751, 1.344734, 1.946473, 1, 0, 0.8117647, 1,
1.090058, -0.2678383, 2.403856, 1, 0, 0.8039216, 1,
1.094489, -0.8844133, 1.59512, 1, 0, 0.7960784, 1,
1.099059, 2.177209, 0.2841573, 1, 0, 0.7921569, 1,
1.101093, 0.7640009, 1.478133, 1, 0, 0.7843137, 1,
1.101496, 0.1786374, 0.9463366, 1, 0, 0.7803922, 1,
1.103934, -2.488401, 2.429457, 1, 0, 0.772549, 1,
1.107163, 2.004835, -0.5629094, 1, 0, 0.7686275, 1,
1.110164, -0.2085975, -0.03266878, 1, 0, 0.7607843, 1,
1.111835, 0.5676416, -0.3258536, 1, 0, 0.7568628, 1,
1.11984, 0.4536055, 0.4447023, 1, 0, 0.7490196, 1,
1.137506, 0.3840219, 1.786895, 1, 0, 0.7450981, 1,
1.150959, -1.157133, 2.17861, 1, 0, 0.7372549, 1,
1.153634, -0.1028034, 1.381406, 1, 0, 0.7333333, 1,
1.163424, -0.980936, 1.462572, 1, 0, 0.7254902, 1,
1.167022, 0.2200411, 0.8443325, 1, 0, 0.7215686, 1,
1.17999, -0.06309319, 1.610491, 1, 0, 0.7137255, 1,
1.184715, -1.728069, 3.568799, 1, 0, 0.7098039, 1,
1.204607, -0.6671023, 2.086359, 1, 0, 0.7019608, 1,
1.214795, -0.5267236, 1.402531, 1, 0, 0.6941177, 1,
1.215845, 2.815573, 0.6167918, 1, 0, 0.6901961, 1,
1.216204, 1.433524, -0.348775, 1, 0, 0.682353, 1,
1.223528, -0.9937919, 3.464663, 1, 0, 0.6784314, 1,
1.22472, 0.9669846, 0.6444197, 1, 0, 0.6705883, 1,
1.229903, 0.4372306, 2.269049, 1, 0, 0.6666667, 1,
1.238881, 1.439673, 2.499422, 1, 0, 0.6588235, 1,
1.240211, 0.6939074, 2.734677, 1, 0, 0.654902, 1,
1.262553, -0.8018566, 0.7023612, 1, 0, 0.6470588, 1,
1.263945, 1.459417, -0.1655661, 1, 0, 0.6431373, 1,
1.273272, 0.634837, 0.1442091, 1, 0, 0.6352941, 1,
1.287143, -1.908573, 2.314071, 1, 0, 0.6313726, 1,
1.295534, -0.2900544, 0.4819498, 1, 0, 0.6235294, 1,
1.300718, -1.15463, 1.11142, 1, 0, 0.6196079, 1,
1.304954, -0.1958302, 0.6971665, 1, 0, 0.6117647, 1,
1.310187, -0.8688279, 1.496613, 1, 0, 0.6078432, 1,
1.31295, 0.9467501, 0.6683455, 1, 0, 0.6, 1,
1.315167, 0.4995269, 1.08952, 1, 0, 0.5921569, 1,
1.317031, 1.498437, -0.1584036, 1, 0, 0.5882353, 1,
1.322039, 0.4225277, 2.260553, 1, 0, 0.5803922, 1,
1.330138, -0.6284277, 2.200662, 1, 0, 0.5764706, 1,
1.335678, -0.06925073, 2.124465, 1, 0, 0.5686275, 1,
1.338756, -0.4616007, 2.950285, 1, 0, 0.5647059, 1,
1.348874, 0.1180037, 0.3352429, 1, 0, 0.5568628, 1,
1.353482, -1.394443, 0.9629928, 1, 0, 0.5529412, 1,
1.369208, -0.6981644, 1.055519, 1, 0, 0.5450981, 1,
1.371532, -0.4711463, 1.469112, 1, 0, 0.5411765, 1,
1.374782, 0.7288109, 2.044751, 1, 0, 0.5333334, 1,
1.37703, -0.9928198, 2.564928, 1, 0, 0.5294118, 1,
1.389034, -1.623488, 1.544715, 1, 0, 0.5215687, 1,
1.390069, 0.23726, 1.548408, 1, 0, 0.5176471, 1,
1.394071, -0.07518993, 0.6508085, 1, 0, 0.509804, 1,
1.395369, 0.5305424, 1.1402, 1, 0, 0.5058824, 1,
1.395842, -2.835228, 2.19749, 1, 0, 0.4980392, 1,
1.397368, 0.1897552, 1.410031, 1, 0, 0.4901961, 1,
1.402787, -1.645799, 4.081358, 1, 0, 0.4862745, 1,
1.403052, 1.302421, -0.8787401, 1, 0, 0.4784314, 1,
1.404709, -1.771674, 0.09601576, 1, 0, 0.4745098, 1,
1.419199, 1.944498, -0.5433128, 1, 0, 0.4666667, 1,
1.422532, 0.4813529, 1.352918, 1, 0, 0.4627451, 1,
1.43274, -0.0842355, 2.982385, 1, 0, 0.454902, 1,
1.434856, 2.656721, 1.919543, 1, 0, 0.4509804, 1,
1.438393, -0.6281578, 3.907235, 1, 0, 0.4431373, 1,
1.447543, -0.9794338, 1.801441, 1, 0, 0.4392157, 1,
1.448962, -0.3716302, 4.014709, 1, 0, 0.4313726, 1,
1.452975, 0.5820025, 2.5646, 1, 0, 0.427451, 1,
1.464255, -0.2574427, 0.9652283, 1, 0, 0.4196078, 1,
1.466129, -0.408819, 0.2589676, 1, 0, 0.4156863, 1,
1.475572, 1.228662, 1.531225, 1, 0, 0.4078431, 1,
1.476553, 0.6013787, 2.629754, 1, 0, 0.4039216, 1,
1.484392, 2.520498, -0.2039577, 1, 0, 0.3960784, 1,
1.484446, -0.6758589, 1.377862, 1, 0, 0.3882353, 1,
1.486083, 1.516266, 1.198212, 1, 0, 0.3843137, 1,
1.498425, -0.02843877, 0.6960073, 1, 0, 0.3764706, 1,
1.50602, -0.2513818, 1.503979, 1, 0, 0.372549, 1,
1.512418, -0.09251431, 1.550041, 1, 0, 0.3647059, 1,
1.51335, 0.4194126, 0.3046443, 1, 0, 0.3607843, 1,
1.520525, -0.3409193, 2.106997, 1, 0, 0.3529412, 1,
1.524884, -2.006988, 1.150759, 1, 0, 0.3490196, 1,
1.544871, 1.037189, 1.380836, 1, 0, 0.3411765, 1,
1.552824, -0.6413824, 2.852561, 1, 0, 0.3372549, 1,
1.558002, -0.09731823, 0.7583956, 1, 0, 0.3294118, 1,
1.559742, 0.1491922, 0.9608504, 1, 0, 0.3254902, 1,
1.562969, -0.6535429, 1.538412, 1, 0, 0.3176471, 1,
1.583654, -0.1080291, 1.974813, 1, 0, 0.3137255, 1,
1.584186, 1.494832, 0.2345948, 1, 0, 0.3058824, 1,
1.584599, 1.112615, 2.973462, 1, 0, 0.2980392, 1,
1.600682, -0.3771458, 1.62522, 1, 0, 0.2941177, 1,
1.604039, -0.445926, 1.544665, 1, 0, 0.2862745, 1,
1.60944, -0.6498699, 1.865988, 1, 0, 0.282353, 1,
1.609953, 0.03576943, 2.860168, 1, 0, 0.2745098, 1,
1.612173, 0.3910241, 0.6831303, 1, 0, 0.2705882, 1,
1.617839, 1.849479, 2.981823, 1, 0, 0.2627451, 1,
1.630804, 0.5215662, 2.634859, 1, 0, 0.2588235, 1,
1.639654, -1.056113, 2.147997, 1, 0, 0.2509804, 1,
1.64334, -0.1501441, 2.430313, 1, 0, 0.2470588, 1,
1.648465, 0.5052182, 0.02492035, 1, 0, 0.2392157, 1,
1.648861, 0.4954052, 0.6161156, 1, 0, 0.2352941, 1,
1.65501, -0.171591, 1.745136, 1, 0, 0.227451, 1,
1.668907, -1.142023, 2.908516, 1, 0, 0.2235294, 1,
1.674587, -0.3358012, 2.252133, 1, 0, 0.2156863, 1,
1.687195, -0.3554678, 3.342728, 1, 0, 0.2117647, 1,
1.702695, -0.1554045, 1.229035, 1, 0, 0.2039216, 1,
1.706951, -0.5975116, 1.301277, 1, 0, 0.1960784, 1,
1.717398, -1.485635, 3.917675, 1, 0, 0.1921569, 1,
1.729162, -0.2424023, 2.542128, 1, 0, 0.1843137, 1,
1.752225, 1.449662, 1.404691, 1, 0, 0.1803922, 1,
1.766885, -0.149487, 1.259316, 1, 0, 0.172549, 1,
1.773617, 0.7438591, 1.207055, 1, 0, 0.1686275, 1,
1.787896, -1.006457, 2.731689, 1, 0, 0.1607843, 1,
1.8152, 0.3320082, 2.294966, 1, 0, 0.1568628, 1,
1.911673, -0.4210741, 0.8584283, 1, 0, 0.1490196, 1,
1.923963, -1.781469, 2.28329, 1, 0, 0.145098, 1,
1.950271, 0.2715144, 1.518053, 1, 0, 0.1372549, 1,
1.953014, -0.7653399, 1.42409, 1, 0, 0.1333333, 1,
1.977852, 0.2477198, 2.311724, 1, 0, 0.1254902, 1,
1.983487, -0.7764782, 0.6530778, 1, 0, 0.1215686, 1,
2.064906, -1.911651, 2.772332, 1, 0, 0.1137255, 1,
2.094207, -0.4812391, 2.42591, 1, 0, 0.1098039, 1,
2.102786, -1.581307, 2.327431, 1, 0, 0.1019608, 1,
2.167946, 0.1838308, 0.3213374, 1, 0, 0.09411765, 1,
2.20323, -0.7433107, 1.586749, 1, 0, 0.09019608, 1,
2.216073, 1.184514, 1.99803, 1, 0, 0.08235294, 1,
2.230639, 0.8492456, 1.449259, 1, 0, 0.07843138, 1,
2.258275, 1.730976, 1.206654, 1, 0, 0.07058824, 1,
2.301749, 0.5885388, 1.051977, 1, 0, 0.06666667, 1,
2.328016, -1.603705, 2.279032, 1, 0, 0.05882353, 1,
2.466147, -0.9611534, 1.065344, 1, 0, 0.05490196, 1,
2.485589, -0.6354706, 1.509034, 1, 0, 0.04705882, 1,
2.525085, 0.4236547, 0.5537977, 1, 0, 0.04313726, 1,
2.537135, 0.3792357, 1.364474, 1, 0, 0.03529412, 1,
2.563083, 0.435302, 2.437211, 1, 0, 0.03137255, 1,
2.827531, 0.710415, 2.254341, 1, 0, 0.02352941, 1,
2.895054, 0.4585296, -0.7679547, 1, 0, 0.01960784, 1,
3.009814, 1.292079, 1.778419, 1, 0, 0.01176471, 1,
3.061695, 1.23219, 1.517307, 1, 0, 0.007843138, 1
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
-0.1158026, -4.794561, -6.969684, 0, -0.5, 0.5, 0.5,
-0.1158026, -4.794561, -6.969684, 1, -0.5, 0.5, 0.5,
-0.1158026, -4.794561, -6.969684, 1, 1.5, 0.5, 0.5,
-0.1158026, -4.794561, -6.969684, 0, 1.5, 0.5, 0.5
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
-4.370472, -0.1126524, -6.969684, 0, -0.5, 0.5, 0.5,
-4.370472, -0.1126524, -6.969684, 1, -0.5, 0.5, 0.5,
-4.370472, -0.1126524, -6.969684, 1, 1.5, 0.5, 0.5,
-4.370472, -0.1126524, -6.969684, 0, 1.5, 0.5, 0.5
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
-4.370472, -4.794561, -0.005508423, 0, -0.5, 0.5, 0.5,
-4.370472, -4.794561, -0.005508423, 1, -0.5, 0.5, 0.5,
-4.370472, -4.794561, -0.005508423, 1, 1.5, 0.5, 0.5,
-4.370472, -4.794561, -0.005508423, 0, 1.5, 0.5, 0.5
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
-3, -3.714121, -5.362566,
3, -3.714121, -5.362566,
-3, -3.714121, -5.362566,
-3, -3.894194, -5.63042,
-2, -3.714121, -5.362566,
-2, -3.894194, -5.63042,
-1, -3.714121, -5.362566,
-1, -3.894194, -5.63042,
0, -3.714121, -5.362566,
0, -3.894194, -5.63042,
1, -3.714121, -5.362566,
1, -3.894194, -5.63042,
2, -3.714121, -5.362566,
2, -3.894194, -5.63042,
3, -3.714121, -5.362566,
3, -3.894194, -5.63042
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
-3, -4.254341, -6.166125, 0, -0.5, 0.5, 0.5,
-3, -4.254341, -6.166125, 1, -0.5, 0.5, 0.5,
-3, -4.254341, -6.166125, 1, 1.5, 0.5, 0.5,
-3, -4.254341, -6.166125, 0, 1.5, 0.5, 0.5,
-2, -4.254341, -6.166125, 0, -0.5, 0.5, 0.5,
-2, -4.254341, -6.166125, 1, -0.5, 0.5, 0.5,
-2, -4.254341, -6.166125, 1, 1.5, 0.5, 0.5,
-2, -4.254341, -6.166125, 0, 1.5, 0.5, 0.5,
-1, -4.254341, -6.166125, 0, -0.5, 0.5, 0.5,
-1, -4.254341, -6.166125, 1, -0.5, 0.5, 0.5,
-1, -4.254341, -6.166125, 1, 1.5, 0.5, 0.5,
-1, -4.254341, -6.166125, 0, 1.5, 0.5, 0.5,
0, -4.254341, -6.166125, 0, -0.5, 0.5, 0.5,
0, -4.254341, -6.166125, 1, -0.5, 0.5, 0.5,
0, -4.254341, -6.166125, 1, 1.5, 0.5, 0.5,
0, -4.254341, -6.166125, 0, 1.5, 0.5, 0.5,
1, -4.254341, -6.166125, 0, -0.5, 0.5, 0.5,
1, -4.254341, -6.166125, 1, -0.5, 0.5, 0.5,
1, -4.254341, -6.166125, 1, 1.5, 0.5, 0.5,
1, -4.254341, -6.166125, 0, 1.5, 0.5, 0.5,
2, -4.254341, -6.166125, 0, -0.5, 0.5, 0.5,
2, -4.254341, -6.166125, 1, -0.5, 0.5, 0.5,
2, -4.254341, -6.166125, 1, 1.5, 0.5, 0.5,
2, -4.254341, -6.166125, 0, 1.5, 0.5, 0.5,
3, -4.254341, -6.166125, 0, -0.5, 0.5, 0.5,
3, -4.254341, -6.166125, 1, -0.5, 0.5, 0.5,
3, -4.254341, -6.166125, 1, 1.5, 0.5, 0.5,
3, -4.254341, -6.166125, 0, 1.5, 0.5, 0.5
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
-3.388626, -3, -5.362566,
-3.388626, 3, -5.362566,
-3.388626, -3, -5.362566,
-3.552267, -3, -5.63042,
-3.388626, -2, -5.362566,
-3.552267, -2, -5.63042,
-3.388626, -1, -5.362566,
-3.552267, -1, -5.63042,
-3.388626, 0, -5.362566,
-3.552267, 0, -5.63042,
-3.388626, 1, -5.362566,
-3.552267, 1, -5.63042,
-3.388626, 2, -5.362566,
-3.552267, 2, -5.63042,
-3.388626, 3, -5.362566,
-3.552267, 3, -5.63042
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
-3.879549, -3, -6.166125, 0, -0.5, 0.5, 0.5,
-3.879549, -3, -6.166125, 1, -0.5, 0.5, 0.5,
-3.879549, -3, -6.166125, 1, 1.5, 0.5, 0.5,
-3.879549, -3, -6.166125, 0, 1.5, 0.5, 0.5,
-3.879549, -2, -6.166125, 0, -0.5, 0.5, 0.5,
-3.879549, -2, -6.166125, 1, -0.5, 0.5, 0.5,
-3.879549, -2, -6.166125, 1, 1.5, 0.5, 0.5,
-3.879549, -2, -6.166125, 0, 1.5, 0.5, 0.5,
-3.879549, -1, -6.166125, 0, -0.5, 0.5, 0.5,
-3.879549, -1, -6.166125, 1, -0.5, 0.5, 0.5,
-3.879549, -1, -6.166125, 1, 1.5, 0.5, 0.5,
-3.879549, -1, -6.166125, 0, 1.5, 0.5, 0.5,
-3.879549, 0, -6.166125, 0, -0.5, 0.5, 0.5,
-3.879549, 0, -6.166125, 1, -0.5, 0.5, 0.5,
-3.879549, 0, -6.166125, 1, 1.5, 0.5, 0.5,
-3.879549, 0, -6.166125, 0, 1.5, 0.5, 0.5,
-3.879549, 1, -6.166125, 0, -0.5, 0.5, 0.5,
-3.879549, 1, -6.166125, 1, -0.5, 0.5, 0.5,
-3.879549, 1, -6.166125, 1, 1.5, 0.5, 0.5,
-3.879549, 1, -6.166125, 0, 1.5, 0.5, 0.5,
-3.879549, 2, -6.166125, 0, -0.5, 0.5, 0.5,
-3.879549, 2, -6.166125, 1, -0.5, 0.5, 0.5,
-3.879549, 2, -6.166125, 1, 1.5, 0.5, 0.5,
-3.879549, 2, -6.166125, 0, 1.5, 0.5, 0.5,
-3.879549, 3, -6.166125, 0, -0.5, 0.5, 0.5,
-3.879549, 3, -6.166125, 1, -0.5, 0.5, 0.5,
-3.879549, 3, -6.166125, 1, 1.5, 0.5, 0.5,
-3.879549, 3, -6.166125, 0, 1.5, 0.5, 0.5
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
-3.388626, -3.714121, -4,
-3.388626, -3.714121, 4,
-3.388626, -3.714121, -4,
-3.552267, -3.894194, -4,
-3.388626, -3.714121, -2,
-3.552267, -3.894194, -2,
-3.388626, -3.714121, 0,
-3.552267, -3.894194, 0,
-3.388626, -3.714121, 2,
-3.552267, -3.894194, 2,
-3.388626, -3.714121, 4,
-3.552267, -3.894194, 4
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
-3.879549, -4.254341, -4, 0, -0.5, 0.5, 0.5,
-3.879549, -4.254341, -4, 1, -0.5, 0.5, 0.5,
-3.879549, -4.254341, -4, 1, 1.5, 0.5, 0.5,
-3.879549, -4.254341, -4, 0, 1.5, 0.5, 0.5,
-3.879549, -4.254341, -2, 0, -0.5, 0.5, 0.5,
-3.879549, -4.254341, -2, 1, -0.5, 0.5, 0.5,
-3.879549, -4.254341, -2, 1, 1.5, 0.5, 0.5,
-3.879549, -4.254341, -2, 0, 1.5, 0.5, 0.5,
-3.879549, -4.254341, 0, 0, -0.5, 0.5, 0.5,
-3.879549, -4.254341, 0, 1, -0.5, 0.5, 0.5,
-3.879549, -4.254341, 0, 1, 1.5, 0.5, 0.5,
-3.879549, -4.254341, 0, 0, 1.5, 0.5, 0.5,
-3.879549, -4.254341, 2, 0, -0.5, 0.5, 0.5,
-3.879549, -4.254341, 2, 1, -0.5, 0.5, 0.5,
-3.879549, -4.254341, 2, 1, 1.5, 0.5, 0.5,
-3.879549, -4.254341, 2, 0, 1.5, 0.5, 0.5,
-3.879549, -4.254341, 4, 0, -0.5, 0.5, 0.5,
-3.879549, -4.254341, 4, 1, -0.5, 0.5, 0.5,
-3.879549, -4.254341, 4, 1, 1.5, 0.5, 0.5,
-3.879549, -4.254341, 4, 0, 1.5, 0.5, 0.5
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
-3.388626, -3.714121, -5.362566,
-3.388626, 3.488816, -5.362566,
-3.388626, -3.714121, 5.35155,
-3.388626, 3.488816, 5.35155,
-3.388626, -3.714121, -5.362566,
-3.388626, -3.714121, 5.35155,
-3.388626, 3.488816, -5.362566,
-3.388626, 3.488816, 5.35155,
-3.388626, -3.714121, -5.362566,
3.15702, -3.714121, -5.362566,
-3.388626, -3.714121, 5.35155,
3.15702, -3.714121, 5.35155,
-3.388626, 3.488816, -5.362566,
3.15702, 3.488816, -5.362566,
-3.388626, 3.488816, 5.35155,
3.15702, 3.488816, 5.35155,
3.15702, -3.714121, -5.362566,
3.15702, 3.488816, -5.362566,
3.15702, -3.714121, 5.35155,
3.15702, 3.488816, 5.35155,
3.15702, -3.714121, -5.362566,
3.15702, -3.714121, 5.35155,
3.15702, 3.488816, -5.362566,
3.15702, 3.488816, 5.35155
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
var radius = 7.729267;
var distance = 34.38838;
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
mvMatrix.translate( 0.1158026, 0.1126524, 0.005508423 );
mvMatrix.scale( 1.276732, 1.160226, 0.7800022 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.38838);
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
nitralin<-read.table("nitralin.xyz")
```

```
## Error in read.table("nitralin.xyz"): no lines available in input
```

```r
x<-nitralin$V2
```

```
## Error in eval(expr, envir, enclos): object 'nitralin' not found
```

```r
y<-nitralin$V3
```

```
## Error in eval(expr, envir, enclos): object 'nitralin' not found
```

```r
z<-nitralin$V4
```

```
## Error in eval(expr, envir, enclos): object 'nitralin' not found
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
-3.293301, -1.086315, -1.552034, 0, 0, 1, 1, 1,
-3.067878, 0.5915098, 0.2343812, 1, 0, 0, 1, 1,
-2.985365, 0.028199, -1.166036, 1, 0, 0, 1, 1,
-2.711726, 1.215638, -1.563256, 1, 0, 0, 1, 1,
-2.685061, 0.1265665, -4.516418, 1, 0, 0, 1, 1,
-2.562658, -0.06348602, -2.312586, 1, 0, 0, 1, 1,
-2.552468, -0.6813148, -1.562933, 0, 0, 0, 1, 1,
-2.547399, 0.7016351, -1.217853, 0, 0, 0, 1, 1,
-2.419163, -1.472057, -1.62282, 0, 0, 0, 1, 1,
-2.410486, -1.420266, -2.309704, 0, 0, 0, 1, 1,
-2.393049, -0.1812985, -0.2518237, 0, 0, 0, 1, 1,
-2.308062, 0.7265872, -0.5008947, 0, 0, 0, 1, 1,
-2.285829, -1.220818, -1.910886, 0, 0, 0, 1, 1,
-2.229466, 1.324807, -1.155177, 1, 1, 1, 1, 1,
-2.222676, 1.222588, -0.9640426, 1, 1, 1, 1, 1,
-2.210415, 0.205237, -2.718204, 1, 1, 1, 1, 1,
-2.201928, 0.2598442, -1.951012, 1, 1, 1, 1, 1,
-2.171576, 1.684025, -0.4436705, 1, 1, 1, 1, 1,
-2.135163, -0.1631591, -1.19742, 1, 1, 1, 1, 1,
-2.134512, -0.4759779, -2.096437, 1, 1, 1, 1, 1,
-2.128419, 0.2437579, -0.7536947, 1, 1, 1, 1, 1,
-2.120603, -0.02511129, 0.8885372, 1, 1, 1, 1, 1,
-2.012876, 1.22178, -1.297325, 1, 1, 1, 1, 1,
-1.964948, 0.3154255, -1.830898, 1, 1, 1, 1, 1,
-1.964045, 1.636196, -1.643146, 1, 1, 1, 1, 1,
-1.959675, -1.624146, -4.035845, 1, 1, 1, 1, 1,
-1.959658, 0.611408, -2.593362, 1, 1, 1, 1, 1,
-1.949643, 1.014314, -2.579489, 1, 1, 1, 1, 1,
-1.943989, 1.508136, -3.102357, 0, 0, 1, 1, 1,
-1.940687, 2.066647, -1.662767, 1, 0, 0, 1, 1,
-1.919747, -0.2379121, -1.380749, 1, 0, 0, 1, 1,
-1.893609, -0.6985079, -3.84123, 1, 0, 0, 1, 1,
-1.883626, 0.2239806, -2.555452, 1, 0, 0, 1, 1,
-1.860718, -0.2081471, -0.9193875, 1, 0, 0, 1, 1,
-1.83048, -0.0823542, -0.754517, 0, 0, 0, 1, 1,
-1.822523, -0.3342968, -0.8207884, 0, 0, 0, 1, 1,
-1.821499, -1.17263, -0.4269442, 0, 0, 0, 1, 1,
-1.803949, -1.309028, -3.726763, 0, 0, 0, 1, 1,
-1.758187, 0.8695347, -1.757, 0, 0, 0, 1, 1,
-1.75186, -1.015965, -1.301172, 0, 0, 0, 1, 1,
-1.734886, -1.109525, 0.1411463, 0, 0, 0, 1, 1,
-1.723703, 0.3609841, -1.73856, 1, 1, 1, 1, 1,
-1.72357, 0.0007362771, -2.373538, 1, 1, 1, 1, 1,
-1.72333, -0.1523183, -1.275123, 1, 1, 1, 1, 1,
-1.704757, -0.7341695, -3.908962, 1, 1, 1, 1, 1,
-1.688642, -1.333052, -1.339617, 1, 1, 1, 1, 1,
-1.669669, -0.4523416, -1.740789, 1, 1, 1, 1, 1,
-1.668359, 1.438237, -2.150862, 1, 1, 1, 1, 1,
-1.663475, 0.9942216, -1.346009, 1, 1, 1, 1, 1,
-1.65551, -1.109771, -1.524362, 1, 1, 1, 1, 1,
-1.62459, -0.2234653, 0.06637279, 1, 1, 1, 1, 1,
-1.622031, 0.06660805, -0.1485833, 1, 1, 1, 1, 1,
-1.621106, 1.128175, -1.777987, 1, 1, 1, 1, 1,
-1.604916, -0.5842171, -2.911459, 1, 1, 1, 1, 1,
-1.601681, -0.6679475, -2.868657, 1, 1, 1, 1, 1,
-1.584812, 0.1834275, -1.075077, 1, 1, 1, 1, 1,
-1.584526, 1.331187, -1.101115, 0, 0, 1, 1, 1,
-1.573933, 0.5523998, -1.058152, 1, 0, 0, 1, 1,
-1.572312, -0.7533962, -2.324656, 1, 0, 0, 1, 1,
-1.571902, -1.679669, -2.278711, 1, 0, 0, 1, 1,
-1.529432, -0.4684614, -2.36266, 1, 0, 0, 1, 1,
-1.499207, -0.2196917, -0.0664226, 1, 0, 0, 1, 1,
-1.490734, 0.3188017, -1.43377, 0, 0, 0, 1, 1,
-1.476239, -0.2402361, -0.5388972, 0, 0, 0, 1, 1,
-1.472687, 1.649829, -0.1932643, 0, 0, 0, 1, 1,
-1.460092, -0.361009, -2.00739, 0, 0, 0, 1, 1,
-1.440434, -0.07413947, -2.580981, 0, 0, 0, 1, 1,
-1.431244, -0.5768787, -2.257224, 0, 0, 0, 1, 1,
-1.429156, 0.4890575, -0.0225921, 0, 0, 0, 1, 1,
-1.427454, -1.592139, -2.66771, 1, 1, 1, 1, 1,
-1.424143, 0.1571084, -0.5915958, 1, 1, 1, 1, 1,
-1.422276, -0.7156674, -1.229171, 1, 1, 1, 1, 1,
-1.422255, -1.017931, -3.112346, 1, 1, 1, 1, 1,
-1.421019, 0.5162636, -1.82416, 1, 1, 1, 1, 1,
-1.419547, 1.187932, -0.2129839, 1, 1, 1, 1, 1,
-1.418553, 1.323399, -1.68784, 1, 1, 1, 1, 1,
-1.415668, -0.3518678, -1.329643, 1, 1, 1, 1, 1,
-1.408753, -1.481798, -1.633787, 1, 1, 1, 1, 1,
-1.401929, 1.762878, -2.108367, 1, 1, 1, 1, 1,
-1.401288, -0.713206, -3.741118, 1, 1, 1, 1, 1,
-1.400725, 0.01402197, -0.9203644, 1, 1, 1, 1, 1,
-1.393255, 0.7374245, -1.783617, 1, 1, 1, 1, 1,
-1.390046, 0.3710567, -1.510561, 1, 1, 1, 1, 1,
-1.382531, 0.7742649, 0.2771497, 1, 1, 1, 1, 1,
-1.381245, -1.769063, -3.19941, 0, 0, 1, 1, 1,
-1.379769, 0.5827751, -1.742309, 1, 0, 0, 1, 1,
-1.367714, -0.5752962, -1.753045, 1, 0, 0, 1, 1,
-1.36624, 0.1143292, 0.2340117, 1, 0, 0, 1, 1,
-1.361321, 0.1852548, -0.308597, 1, 0, 0, 1, 1,
-1.349959, 0.7217486, -0.5734537, 1, 0, 0, 1, 1,
-1.347433, 0.5194005, -0.1468183, 0, 0, 0, 1, 1,
-1.333287, -0.7890632, -3.850349, 0, 0, 0, 1, 1,
-1.331603, -0.2596811, -0.490938, 0, 0, 0, 1, 1,
-1.322849, 0.4018179, -0.2327043, 0, 0, 0, 1, 1,
-1.315943, -1.097481, -0.07084468, 0, 0, 0, 1, 1,
-1.312498, 2.09307, -1.863124, 0, 0, 0, 1, 1,
-1.307482, -0.384777, -1.821592, 0, 0, 0, 1, 1,
-1.306892, -0.2029479, -1.313367, 1, 1, 1, 1, 1,
-1.300127, 1.89902, -0.9681597, 1, 1, 1, 1, 1,
-1.299213, -0.2152639, 0.2734202, 1, 1, 1, 1, 1,
-1.291618, -0.7761087, -2.468964, 1, 1, 1, 1, 1,
-1.287446, 0.6662419, -0.2731144, 1, 1, 1, 1, 1,
-1.285527, -1.095016, -1.806838, 1, 1, 1, 1, 1,
-1.279484, -0.8522028, -3.924114, 1, 1, 1, 1, 1,
-1.264586, 0.4124492, -0.9975777, 1, 1, 1, 1, 1,
-1.254529, -0.3714296, -0.5167428, 1, 1, 1, 1, 1,
-1.240732, 0.1314453, -0.5137699, 1, 1, 1, 1, 1,
-1.237894, -0.4150336, -1.119505, 1, 1, 1, 1, 1,
-1.221638, -0.658228, -1.634242, 1, 1, 1, 1, 1,
-1.213592, -0.1882405, -1.170752, 1, 1, 1, 1, 1,
-1.199813, 2.220462, -0.1385808, 1, 1, 1, 1, 1,
-1.197325, 0.8402274, 0.05194348, 1, 1, 1, 1, 1,
-1.184331, -0.4423289, -0.7996504, 0, 0, 1, 1, 1,
-1.184071, -0.1745475, -0.6957768, 1, 0, 0, 1, 1,
-1.182212, -0.8978812, -1.751822, 1, 0, 0, 1, 1,
-1.18074, 0.8809512, -0.04557528, 1, 0, 0, 1, 1,
-1.171398, 0.5874546, -0.6307157, 1, 0, 0, 1, 1,
-1.164491, -0.4123731, -4.062757, 1, 0, 0, 1, 1,
-1.162829, -1.081366, -3.581617, 0, 0, 0, 1, 1,
-1.162748, 0.8758547, -0.6106061, 0, 0, 0, 1, 1,
-1.162425, 2.103772, -1.193595, 0, 0, 0, 1, 1,
-1.153823, -0.7772484, -2.581404, 0, 0, 0, 1, 1,
-1.150733, -0.7705666, -3.055498, 0, 0, 0, 1, 1,
-1.137156, 0.9656131, -0.905657, 0, 0, 0, 1, 1,
-1.134326, 0.2385225, -0.2350873, 0, 0, 0, 1, 1,
-1.131762, 0.4347913, -2.718293, 1, 1, 1, 1, 1,
-1.131127, -1.125088, -2.263856, 1, 1, 1, 1, 1,
-1.12907, 2.134776, 0.5449468, 1, 1, 1, 1, 1,
-1.127298, -0.09176159, 0.487706, 1, 1, 1, 1, 1,
-1.123488, 0.7419345, -0.7102733, 1, 1, 1, 1, 1,
-1.104913, 2.692728, 2.184828, 1, 1, 1, 1, 1,
-1.103424, 1.082105, 0.05809062, 1, 1, 1, 1, 1,
-1.103245, -0.8216687, -1.158166, 1, 1, 1, 1, 1,
-1.093158, -0.332698, -2.461799, 1, 1, 1, 1, 1,
-1.086519, -0.5309669, -1.440242, 1, 1, 1, 1, 1,
-1.084798, -0.6262746, -1.711211, 1, 1, 1, 1, 1,
-1.08329, 0.838298, -0.1987561, 1, 1, 1, 1, 1,
-1.081374, 2.236596, 0.02059262, 1, 1, 1, 1, 1,
-1.070282, 0.4913496, 0.8347092, 1, 1, 1, 1, 1,
-1.063179, -0.4954166, -1.213725, 1, 1, 1, 1, 1,
-1.060562, -0.2195537, -1.382972, 0, 0, 1, 1, 1,
-1.057411, 1.826198, 1.043993, 1, 0, 0, 1, 1,
-1.053743, 0.7807888, -0.3346462, 1, 0, 0, 1, 1,
-1.049913, -0.4495192, -1.824424, 1, 0, 0, 1, 1,
-1.044683, 0.5480191, -2.335127, 1, 0, 0, 1, 1,
-1.042261, 1.213539, -0.843002, 1, 0, 0, 1, 1,
-1.039004, -0.3859515, -2.316202, 0, 0, 0, 1, 1,
-1.02929, 0.1691993, -3.322815, 0, 0, 0, 1, 1,
-1.023649, -0.8741908, -2.852658, 0, 0, 0, 1, 1,
-1.019372, -1.800889, -2.453564, 0, 0, 0, 1, 1,
-1.017009, -0.6123617, -0.08071409, 0, 0, 0, 1, 1,
-1.015854, 0.02570714, -2.355475, 0, 0, 0, 1, 1,
-1.012394, 0.008246711, -1.792919, 0, 0, 0, 1, 1,
-1.003604, 1.091938, -1.126237, 1, 1, 1, 1, 1,
-0.9994169, -2.268666, -3.204711, 1, 1, 1, 1, 1,
-0.9896889, 1.502095, -0.5335308, 1, 1, 1, 1, 1,
-0.9810453, 0.06494068, -2.267581, 1, 1, 1, 1, 1,
-0.9783249, -3.592933, -2.75004, 1, 1, 1, 1, 1,
-0.9622644, 0.7827777, -3.329792, 1, 1, 1, 1, 1,
-0.958645, -1.111508, -1.869316, 1, 1, 1, 1, 1,
-0.9567553, 0.2652362, -1.963115, 1, 1, 1, 1, 1,
-0.9478846, 0.7157458, -0.6252295, 1, 1, 1, 1, 1,
-0.9460932, 1.011436, -2.891138, 1, 1, 1, 1, 1,
-0.9227872, 0.9281601, -0.0491514, 1, 1, 1, 1, 1,
-0.9226621, 0.778064, -0.2034908, 1, 1, 1, 1, 1,
-0.9205959, 1.889384, -0.8212627, 1, 1, 1, 1, 1,
-0.9195307, -0.5784609, -3.286067, 1, 1, 1, 1, 1,
-0.9010742, -0.1539164, -1.24712, 1, 1, 1, 1, 1,
-0.8975523, -0.7050889, -2.371505, 0, 0, 1, 1, 1,
-0.8882057, 0.6246204, -2.69969, 1, 0, 0, 1, 1,
-0.8828393, 0.6515318, -1.709822, 1, 0, 0, 1, 1,
-0.8785274, -0.05617243, -1.894769, 1, 0, 0, 1, 1,
-0.8678579, 2.507689, -1.096227, 1, 0, 0, 1, 1,
-0.8668076, 0.08151188, -2.366268, 1, 0, 0, 1, 1,
-0.8668072, 0.1181105, -0.8421049, 0, 0, 0, 1, 1,
-0.8665246, -1.419317, -3.182654, 0, 0, 0, 1, 1,
-0.8648232, 0.7310895, -0.905663, 0, 0, 0, 1, 1,
-0.8619516, 1.351774, -0.01548454, 0, 0, 0, 1, 1,
-0.8617021, 0.3662887, -2.043821, 0, 0, 0, 1, 1,
-0.8564182, -0.3225063, -1.69982, 0, 0, 0, 1, 1,
-0.8559368, 0.9369106, 0.3168104, 0, 0, 0, 1, 1,
-0.8546562, -0.7618729, -2.839626, 1, 1, 1, 1, 1,
-0.854123, -1.297702, -1.713417, 1, 1, 1, 1, 1,
-0.8459463, 1.362871, 0.5430787, 1, 1, 1, 1, 1,
-0.8426937, 1.488948, -1.095772, 1, 1, 1, 1, 1,
-0.8346891, 0.5913475, -1.213116, 1, 1, 1, 1, 1,
-0.8325813, 0.8680056, -0.2324185, 1, 1, 1, 1, 1,
-0.8281314, -1.415063, -1.757183, 1, 1, 1, 1, 1,
-0.8221487, -0.5236972, -3.264253, 1, 1, 1, 1, 1,
-0.8185266, 0.8828492, -0.7475925, 1, 1, 1, 1, 1,
-0.8130599, -0.7796409, -2.379875, 1, 1, 1, 1, 1,
-0.8109214, -0.1928548, -1.117762, 1, 1, 1, 1, 1,
-0.8104713, -0.2366389, -1.355196, 1, 1, 1, 1, 1,
-0.8100584, 1.162827, -0.5749838, 1, 1, 1, 1, 1,
-0.8070778, 0.03791982, -1.344907, 1, 1, 1, 1, 1,
-0.8060635, 0.01868836, -2.238476, 1, 1, 1, 1, 1,
-0.8059795, -1.998789, -2.284211, 0, 0, 1, 1, 1,
-0.8011213, 0.4975148, -1.411184, 1, 0, 0, 1, 1,
-0.7917456, -1.539481, -4.396658, 1, 0, 0, 1, 1,
-0.7909441, 0.9753789, -2.396099, 1, 0, 0, 1, 1,
-0.7899649, 0.4520013, -0.8477306, 1, 0, 0, 1, 1,
-0.7893388, -0.1692093, -1.987417, 1, 0, 0, 1, 1,
-0.7892168, -0.8178127, -2.565294, 0, 0, 0, 1, 1,
-0.7889377, -0.6372452, -1.798754, 0, 0, 0, 1, 1,
-0.7846837, -0.2827061, -2.098035, 0, 0, 0, 1, 1,
-0.7819996, 0.02949922, -2.839554, 0, 0, 0, 1, 1,
-0.7799677, -0.6119485, -2.619256, 0, 0, 0, 1, 1,
-0.7767475, 1.227001, -1.682653, 0, 0, 0, 1, 1,
-0.7763963, -0.7062849, -1.691474, 0, 0, 0, 1, 1,
-0.7706721, -0.3727244, -1.285092, 1, 1, 1, 1, 1,
-0.7691519, -0.4743108, -1.222639, 1, 1, 1, 1, 1,
-0.7679072, 0.6204927, -0.9906726, 1, 1, 1, 1, 1,
-0.7678613, -1.033366, -1.326098, 1, 1, 1, 1, 1,
-0.7649574, -0.02254963, -2.096299, 1, 1, 1, 1, 1,
-0.7633867, 0.9533018, -1.039558, 1, 1, 1, 1, 1,
-0.7559858, -0.137614, -1.664393, 1, 1, 1, 1, 1,
-0.7551484, -0.2980264, -2.633016, 1, 1, 1, 1, 1,
-0.7525442, 0.1774718, -1.188211, 1, 1, 1, 1, 1,
-0.7476533, 0.292328, -1.047571, 1, 1, 1, 1, 1,
-0.7382091, 0.5311025, -0.926328, 1, 1, 1, 1, 1,
-0.7374237, -0.7640355, -2.652726, 1, 1, 1, 1, 1,
-0.7362338, -1.124009, -3.296575, 1, 1, 1, 1, 1,
-0.7326756, 0.3864784, 0.3434407, 1, 1, 1, 1, 1,
-0.7323939, -0.06393725, -1.596266, 1, 1, 1, 1, 1,
-0.7309938, -1.320143, -3.070845, 0, 0, 1, 1, 1,
-0.7288211, -1.36688, -3.176723, 1, 0, 0, 1, 1,
-0.7285737, 2.256781, -0.03685865, 1, 0, 0, 1, 1,
-0.7217975, -0.2147681, -2.270313, 1, 0, 0, 1, 1,
-0.7197342, 0.8228096, 0.4214407, 1, 0, 0, 1, 1,
-0.7192699, 0.05160032, -1.466983, 1, 0, 0, 1, 1,
-0.7173133, -0.3756998, -2.745319, 0, 0, 0, 1, 1,
-0.7141016, -0.9117381, -3.40057, 0, 0, 0, 1, 1,
-0.7133421, 0.05654695, -3.116745, 0, 0, 0, 1, 1,
-0.7118035, 1.326735, -1.566773, 0, 0, 0, 1, 1,
-0.7098598, 1.837735, -0.4153248, 0, 0, 0, 1, 1,
-0.7095841, -0.5947411, -3.243053, 0, 0, 0, 1, 1,
-0.6990817, -0.5353068, 2.110516, 0, 0, 0, 1, 1,
-0.6963343, -1.51124, -2.861816, 1, 1, 1, 1, 1,
-0.6931496, -0.6330519, -1.225696, 1, 1, 1, 1, 1,
-0.6924299, 1.08371, -1.715871, 1, 1, 1, 1, 1,
-0.691147, -0.5135016, -1.652644, 1, 1, 1, 1, 1,
-0.6851107, 0.9383764, -1.080851, 1, 1, 1, 1, 1,
-0.6731339, 0.5927419, -0.9050851, 1, 1, 1, 1, 1,
-0.6726037, 1.219457, -2.224448, 1, 1, 1, 1, 1,
-0.6713995, -0.7963193, -2.643651, 1, 1, 1, 1, 1,
-0.6701737, -0.8860908, -2.315769, 1, 1, 1, 1, 1,
-0.6684029, 1.461687, -0.8763326, 1, 1, 1, 1, 1,
-0.6666579, -0.5216673, -2.387205, 1, 1, 1, 1, 1,
-0.6659555, -0.4004582, -2.290916, 1, 1, 1, 1, 1,
-0.6633242, -0.2450221, -0.8438786, 1, 1, 1, 1, 1,
-0.6564594, -1.042985, -2.749811, 1, 1, 1, 1, 1,
-0.6559122, 0.5563419, 0.8013492, 1, 1, 1, 1, 1,
-0.6547166, -0.12506, -2.112485, 0, 0, 1, 1, 1,
-0.6545066, 1.704623, 0.4980263, 1, 0, 0, 1, 1,
-0.6500279, -0.7334545, -4.137228, 1, 0, 0, 1, 1,
-0.6366179, 0.3146492, -1.01939, 1, 0, 0, 1, 1,
-0.6320794, 0.255389, -1.349015, 1, 0, 0, 1, 1,
-0.6317245, 0.02211427, -1.614903, 1, 0, 0, 1, 1,
-0.6311044, 1.307376, 0.5600271, 0, 0, 0, 1, 1,
-0.6297749, -1.002258, -2.994091, 0, 0, 0, 1, 1,
-0.6258608, 0.4577823, -0.5719118, 0, 0, 0, 1, 1,
-0.6247221, 0.6491313, 0.6676869, 0, 0, 0, 1, 1,
-0.6171946, -0.4553823, -3.756105, 0, 0, 0, 1, 1,
-0.6150066, -0.4763355, -0.9308428, 0, 0, 0, 1, 1,
-0.6100324, 0.1219648, -2.444437, 0, 0, 0, 1, 1,
-0.609953, -1.091388, -2.693485, 1, 1, 1, 1, 1,
-0.6050324, -1.555303, -2.248004, 1, 1, 1, 1, 1,
-0.5978011, 0.921615, -1.940802, 1, 1, 1, 1, 1,
-0.5967785, -1.166475, -1.480128, 1, 1, 1, 1, 1,
-0.5919808, -0.4225598, -4.079389, 1, 1, 1, 1, 1,
-0.5861986, -0.03555948, -1.92808, 1, 1, 1, 1, 1,
-0.5841886, 0.9609257, 0.4934611, 1, 1, 1, 1, 1,
-0.5833908, 0.2393412, 0.2964613, 1, 1, 1, 1, 1,
-0.5831062, -0.3747766, -2.797567, 1, 1, 1, 1, 1,
-0.5809718, -0.03545177, -2.101435, 1, 1, 1, 1, 1,
-0.5752439, -1.934229, -1.930091, 1, 1, 1, 1, 1,
-0.5685039, -0.6233369, -2.424479, 1, 1, 1, 1, 1,
-0.5652584, -1.621252, -3.221595, 1, 1, 1, 1, 1,
-0.5622136, -0.3513479, -4.032057, 1, 1, 1, 1, 1,
-0.5548279, -0.3991401, -2.804273, 1, 1, 1, 1, 1,
-0.5495908, 1.520778, 0.02295333, 0, 0, 1, 1, 1,
-0.5446013, -0.1674583, -2.035135, 1, 0, 0, 1, 1,
-0.5445697, 0.01609178, -1.901517, 1, 0, 0, 1, 1,
-0.541737, 0.6221431, -1.022046, 1, 0, 0, 1, 1,
-0.5410489, -0.3055663, -3.041673, 1, 0, 0, 1, 1,
-0.5409294, -0.5913796, -2.777075, 1, 0, 0, 1, 1,
-0.5395918, 0.5325097, -1.794956, 0, 0, 0, 1, 1,
-0.5394329, -1.101912, -1.717734, 0, 0, 0, 1, 1,
-0.5337283, -0.6213995, -3.810883, 0, 0, 0, 1, 1,
-0.5333631, -0.09024685, -0.6312425, 0, 0, 0, 1, 1,
-0.5299484, 1.528851, -0.7275537, 0, 0, 0, 1, 1,
-0.5269693, -0.4244421, -2.657563, 0, 0, 0, 1, 1,
-0.5268502, -1.629354, -3.154486, 0, 0, 0, 1, 1,
-0.5264643, -1.391765, -1.067157, 1, 1, 1, 1, 1,
-0.5233138, -1.573807, -1.927744, 1, 1, 1, 1, 1,
-0.5214072, 0.9845721, -1.404091, 1, 1, 1, 1, 1,
-0.5185106, -0.3739409, -2.777982, 1, 1, 1, 1, 1,
-0.5089765, -1.775101, -1.86403, 1, 1, 1, 1, 1,
-0.5049443, 1.13264, -0.7385151, 1, 1, 1, 1, 1,
-0.5043517, 1.416199, -2.957069, 1, 1, 1, 1, 1,
-0.5036594, -0.5510506, -3.147616, 1, 1, 1, 1, 1,
-0.4965748, -0.07631722, -1.163635, 1, 1, 1, 1, 1,
-0.4958211, 1.180128, -0.5834432, 1, 1, 1, 1, 1,
-0.4951162, 0.4823814, -0.7991706, 1, 1, 1, 1, 1,
-0.4947403, 0.3055282, -0.6339656, 1, 1, 1, 1, 1,
-0.4937601, -0.1731899, -0.6543661, 1, 1, 1, 1, 1,
-0.491842, -0.7248515, -2.637448, 1, 1, 1, 1, 1,
-0.4896756, 0.2925093, -1.285252, 1, 1, 1, 1, 1,
-0.4879541, -0.7537263, -0.7473354, 0, 0, 1, 1, 1,
-0.4866873, 0.9577149, 0.4239345, 1, 0, 0, 1, 1,
-0.4862972, 1.497359, -1.104878, 1, 0, 0, 1, 1,
-0.4838062, 0.1617925, -0.9446874, 1, 0, 0, 1, 1,
-0.4817006, 2.043626, -0.6022651, 1, 0, 0, 1, 1,
-0.4751276, -0.2307087, -2.964388, 1, 0, 0, 1, 1,
-0.4749477, -0.3310005, -0.8386006, 0, 0, 0, 1, 1,
-0.4710928, -1.526722, -4.445435, 0, 0, 0, 1, 1,
-0.4611852, 0.3137126, -1.856539, 0, 0, 0, 1, 1,
-0.4585883, -0.9707739, -1.062277, 0, 0, 0, 1, 1,
-0.4506933, 0.8244473, 0.2700183, 0, 0, 0, 1, 1,
-0.4499757, 1.75478, -1.72455, 0, 0, 0, 1, 1,
-0.447358, -0.3129438, -1.391698, 0, 0, 0, 1, 1,
-0.4467301, 0.3815725, -1.12718, 1, 1, 1, 1, 1,
-0.4456617, 0.6920353, -0.2697237, 1, 1, 1, 1, 1,
-0.4438961, 1.628044, 1.100769, 1, 1, 1, 1, 1,
-0.4436222, -0.4243715, -2.539411, 1, 1, 1, 1, 1,
-0.4357234, 0.4000363, -1.161822, 1, 1, 1, 1, 1,
-0.4342409, 1.299112, 0.7361346, 1, 1, 1, 1, 1,
-0.433643, -0.6263586, -3.981727, 1, 1, 1, 1, 1,
-0.4327177, -0.4185627, -4.495812, 1, 1, 1, 1, 1,
-0.4281282, -0.827305, -4.072073, 1, 1, 1, 1, 1,
-0.4205986, 0.06751533, 0.4327877, 1, 1, 1, 1, 1,
-0.4199984, 0.6467592, -0.8083205, 1, 1, 1, 1, 1,
-0.4172192, 0.1120197, -2.062524, 1, 1, 1, 1, 1,
-0.4162175, 0.4547269, 0.5925002, 1, 1, 1, 1, 1,
-0.4141209, -0.855611, -2.336726, 1, 1, 1, 1, 1,
-0.407177, 1.151933, 0.4223748, 1, 1, 1, 1, 1,
-0.4047299, 0.2421418, -1.919631, 0, 0, 1, 1, 1,
-0.4014199, -0.02669736, -3.789233, 1, 0, 0, 1, 1,
-0.3991441, -0.5836913, -3.460104, 1, 0, 0, 1, 1,
-0.3981643, -0.569132, -4.904985, 1, 0, 0, 1, 1,
-0.3961333, -0.1665726, -2.736867, 1, 0, 0, 1, 1,
-0.3956896, 1.099313, 0.03723169, 1, 0, 0, 1, 1,
-0.3898941, -1.579525, -3.573215, 0, 0, 0, 1, 1,
-0.3892531, -0.9068167, -5.206536, 0, 0, 0, 1, 1,
-0.3847669, 0.9253253, -2.272367, 0, 0, 0, 1, 1,
-0.3828724, -0.1233383, -3.09676, 0, 0, 0, 1, 1,
-0.3799124, 0.9965978, -1.001444, 0, 0, 0, 1, 1,
-0.3793906, 1.845545, 0.329085, 0, 0, 0, 1, 1,
-0.374798, 0.8664574, -0.1856422, 0, 0, 0, 1, 1,
-0.3746127, -1.96649, -2.495845, 1, 1, 1, 1, 1,
-0.3741624, 1.524734, 0.01332487, 1, 1, 1, 1, 1,
-0.3659292, 0.6478663, -0.06500755, 1, 1, 1, 1, 1,
-0.3649814, 0.09316008, -1.036738, 1, 1, 1, 1, 1,
-0.3644566, 0.6164385, -0.1087044, 1, 1, 1, 1, 1,
-0.3642826, -2.311643, -0.9466089, 1, 1, 1, 1, 1,
-0.3551421, 1.606615, -0.363947, 1, 1, 1, 1, 1,
-0.3516295, -0.3720172, -3.399544, 1, 1, 1, 1, 1,
-0.3507659, -0.99125, -1.237932, 1, 1, 1, 1, 1,
-0.3506249, 1.16932, 0.5286536, 1, 1, 1, 1, 1,
-0.3481002, 0.094791, -1.103242, 1, 1, 1, 1, 1,
-0.3454042, -0.07458957, -1.717937, 1, 1, 1, 1, 1,
-0.3437324, 0.188945, -2.843806, 1, 1, 1, 1, 1,
-0.3388372, 2.405339, -1.414615, 1, 1, 1, 1, 1,
-0.3362978, -0.4677956, -4.167982, 1, 1, 1, 1, 1,
-0.3348311, 1.051929, -1.544602, 0, 0, 1, 1, 1,
-0.3340385, 0.2895417, -2.567673, 1, 0, 0, 1, 1,
-0.3313045, 0.4426357, -1.122635, 1, 0, 0, 1, 1,
-0.3268064, 0.9430383, -1.754198, 1, 0, 0, 1, 1,
-0.3256038, 0.3791879, 0.2762648, 1, 0, 0, 1, 1,
-0.3247714, 0.2209226, -0.9748116, 1, 0, 0, 1, 1,
-0.3193979, -0.5416542, -3.453303, 0, 0, 0, 1, 1,
-0.3187256, 1.044106, 0.444258, 0, 0, 0, 1, 1,
-0.3140108, -0.5283617, 0.7815953, 0, 0, 0, 1, 1,
-0.3126603, 1.310143, -1.93175, 0, 0, 0, 1, 1,
-0.3124944, -0.3035206, -3.98858, 0, 0, 0, 1, 1,
-0.3119271, 0.9852417, -1.41104, 0, 0, 0, 1, 1,
-0.309396, 0.8050222, 0.07591572, 0, 0, 0, 1, 1,
-0.3092456, -1.028025, -3.92333, 1, 1, 1, 1, 1,
-0.3084709, -0.4132175, -3.74435, 1, 1, 1, 1, 1,
-0.308231, -0.1935969, -4.460707, 1, 1, 1, 1, 1,
-0.3078265, -0.5634972, -2.694868, 1, 1, 1, 1, 1,
-0.3015623, 0.7617835, -0.7778525, 1, 1, 1, 1, 1,
-0.301027, 0.3974825, -0.2759075, 1, 1, 1, 1, 1,
-0.2951239, 0.254872, -0.6142499, 1, 1, 1, 1, 1,
-0.2946517, 1.272882, -0.8353416, 1, 1, 1, 1, 1,
-0.2925532, 0.6737632, -1.057769, 1, 1, 1, 1, 1,
-0.2914493, -2.22141, -4.427521, 1, 1, 1, 1, 1,
-0.2893796, -0.2693439, -2.481784, 1, 1, 1, 1, 1,
-0.278666, 0.178478, 0.3658259, 1, 1, 1, 1, 1,
-0.2700534, 3.06218, -0.121353, 1, 1, 1, 1, 1,
-0.2630025, 0.54536, -1.558363, 1, 1, 1, 1, 1,
-0.2625021, -0.924094, -3.408012, 1, 1, 1, 1, 1,
-0.2610238, -1.168844, -4.621157, 0, 0, 1, 1, 1,
-0.2607827, -0.08028767, 1.025888, 1, 0, 0, 1, 1,
-0.2579457, -0.9803611, -2.766921, 1, 0, 0, 1, 1,
-0.256738, -1.521525, -3.76335, 1, 0, 0, 1, 1,
-0.254198, 0.1923826, -0.08710025, 1, 0, 0, 1, 1,
-0.2539433, 0.769026, 1.46023, 1, 0, 0, 1, 1,
-0.2488064, 0.5286866, -1.194999, 0, 0, 0, 1, 1,
-0.2443654, 0.7362043, 0.1294068, 0, 0, 0, 1, 1,
-0.2360917, 0.5937256, 0.1839114, 0, 0, 0, 1, 1,
-0.2326566, -0.5997434, -0.8245536, 0, 0, 0, 1, 1,
-0.2299877, -0.4380522, -4.270573, 0, 0, 0, 1, 1,
-0.2270579, 1.485353, 1.50148, 0, 0, 0, 1, 1,
-0.2240447, -1.399155, -3.626968, 0, 0, 0, 1, 1,
-0.2211459, 0.7829133, -1.121421, 1, 1, 1, 1, 1,
-0.2204153, -0.1287819, -3.852352, 1, 1, 1, 1, 1,
-0.2123687, -1.142144, -2.351552, 1, 1, 1, 1, 1,
-0.2103719, 1.215086, -0.2336061, 1, 1, 1, 1, 1,
-0.2099479, -0.7041342, -2.467198, 1, 1, 1, 1, 1,
-0.2075381, 0.4576724, -1.101173, 1, 1, 1, 1, 1,
-0.2059959, 0.1670659, -1.452847, 1, 1, 1, 1, 1,
-0.2055187, -1.083602, -4.430395, 1, 1, 1, 1, 1,
-0.203824, -0.6247658, -0.583904, 1, 1, 1, 1, 1,
-0.2030961, 1.301464, -0.8274119, 1, 1, 1, 1, 1,
-0.2005835, 0.8382145, -1.629768, 1, 1, 1, 1, 1,
-0.1954834, 0.09159781, -1.735611, 1, 1, 1, 1, 1,
-0.1906172, 0.1404474, -0.6107638, 1, 1, 1, 1, 1,
-0.1892837, 1.290416, -0.5194065, 1, 1, 1, 1, 1,
-0.1861044, -0.9771994, -4.677528, 1, 1, 1, 1, 1,
-0.1815483, -0.8456022, -2.719876, 0, 0, 1, 1, 1,
-0.1784614, 0.1374044, -0.2558015, 1, 0, 0, 1, 1,
-0.1754448, 0.960831, -0.3576592, 1, 0, 0, 1, 1,
-0.1754368, 0.6838951, -0.884226, 1, 0, 0, 1, 1,
-0.1731515, -0.1315771, -4.151834, 1, 0, 0, 1, 1,
-0.170874, -0.711957, -1.215734, 1, 0, 0, 1, 1,
-0.1693833, -1.963152, -3.600547, 0, 0, 0, 1, 1,
-0.1686904, -1.460281, -2.943558, 0, 0, 0, 1, 1,
-0.1660315, -2.444302, -1.75694, 0, 0, 0, 1, 1,
-0.1589473, -0.2478554, -2.545839, 0, 0, 0, 1, 1,
-0.1567581, 0.3751526, 0.484052, 0, 0, 0, 1, 1,
-0.1554065, -1.258612, -2.252628, 0, 0, 0, 1, 1,
-0.1539328, 0.3878033, 0.1719942, 0, 0, 0, 1, 1,
-0.1538853, 0.8186205, 1.670547, 1, 1, 1, 1, 1,
-0.1462103, 1.360847, -0.4433231, 1, 1, 1, 1, 1,
-0.1450455, -3.609224, -4.546, 1, 1, 1, 1, 1,
-0.144057, 0.3229221, 0.52758, 1, 1, 1, 1, 1,
-0.1419232, -1.866831, -0.6333553, 1, 1, 1, 1, 1,
-0.1403527, 0.05584287, 0.3489254, 1, 1, 1, 1, 1,
-0.1381942, -0.4620218, -3.231097, 1, 1, 1, 1, 1,
-0.1358513, 0.1931238, -1.389032, 1, 1, 1, 1, 1,
-0.1351745, 0.1641572, -0.2792186, 1, 1, 1, 1, 1,
-0.1338199, 0.4301971, -1.911336, 1, 1, 1, 1, 1,
-0.1314483, 1.508178, 0.3178419, 1, 1, 1, 1, 1,
-0.1302873, 0.7081332, -0.4761509, 1, 1, 1, 1, 1,
-0.1298465, 1.674294, -0.5172122, 1, 1, 1, 1, 1,
-0.1286721, -1.279434, -3.679372, 1, 1, 1, 1, 1,
-0.1268988, 0.1367677, -2.158009, 1, 1, 1, 1, 1,
-0.1268036, -0.6524534, -3.559588, 0, 0, 1, 1, 1,
-0.1218491, -1.681539, -2.900815, 1, 0, 0, 1, 1,
-0.1201161, -0.6413718, -2.110578, 1, 0, 0, 1, 1,
-0.1194363, -0.8342327, -2.098457, 1, 0, 0, 1, 1,
-0.1163182, 1.346004, 0.1328889, 1, 0, 0, 1, 1,
-0.108897, 0.9460714, -0.6037246, 1, 0, 0, 1, 1,
-0.1070035, -1.668594, -4.95231, 0, 0, 0, 1, 1,
-0.10581, -1.357931, -2.515477, 0, 0, 0, 1, 1,
-0.1020222, -0.6223902, -1.572433, 0, 0, 0, 1, 1,
-0.09587339, 0.3971444, -1.033003, 0, 0, 0, 1, 1,
-0.09362362, 1.118091, -1.546225, 0, 0, 0, 1, 1,
-0.09142082, 1.90992, -0.4787707, 0, 0, 0, 1, 1,
-0.09103812, 0.8407517, -1.709862, 0, 0, 0, 1, 1,
-0.09093544, 0.4435472, -1.107962, 1, 1, 1, 1, 1,
-0.08946414, 0.3188438, 0.3587529, 1, 1, 1, 1, 1,
-0.08839493, 0.2168915, 0.7662781, 1, 1, 1, 1, 1,
-0.08435971, 0.1703481, -1.147154, 1, 1, 1, 1, 1,
-0.0840127, 0.5543501, -0.5563867, 1, 1, 1, 1, 1,
-0.08145011, -0.2676892, -2.475788, 1, 1, 1, 1, 1,
-0.07547526, 0.8892358, 0.8329452, 1, 1, 1, 1, 1,
-0.07481217, -0.5152922, -3.303034, 1, 1, 1, 1, 1,
-0.07396299, -0.1829047, -1.323881, 1, 1, 1, 1, 1,
-0.07177118, 0.07596686, -0.5457197, 1, 1, 1, 1, 1,
-0.06776588, 0.07732711, 0.6238572, 1, 1, 1, 1, 1,
-0.0645337, -1.048552, -1.948182, 1, 1, 1, 1, 1,
-0.05827304, -0.8692174, -4.534756, 1, 1, 1, 1, 1,
-0.05504706, -1.961846, -5.099732, 1, 1, 1, 1, 1,
-0.0539758, 0.5979245, -0.4534739, 1, 1, 1, 1, 1,
-0.05250478, -0.760942, -2.967257, 0, 0, 1, 1, 1,
-0.04725088, 1.418901, -0.8509707, 1, 0, 0, 1, 1,
-0.04597041, -2.868699, -3.666602, 1, 0, 0, 1, 1,
-0.04501575, 1.51672, -0.1847577, 1, 0, 0, 1, 1,
-0.04484608, -0.06657367, -1.585193, 1, 0, 0, 1, 1,
-0.04195939, 0.7499343, 0.3235292, 1, 0, 0, 1, 1,
-0.04029203, -0.7172928, -3.70246, 0, 0, 0, 1, 1,
-0.03869778, 0.4220955, -0.3898199, 0, 0, 0, 1, 1,
-0.03535619, -1.97305, -2.06014, 0, 0, 0, 1, 1,
-0.03453526, -0.5262404, -1.646336, 0, 0, 0, 1, 1,
-0.03257147, -1.212051, -1.954616, 0, 0, 0, 1, 1,
-0.03207367, -0.8328799, -3.950848, 0, 0, 0, 1, 1,
-0.03143274, 0.6355791, 1.318219, 0, 0, 0, 1, 1,
-0.03113101, 1.435941, -0.9464372, 1, 1, 1, 1, 1,
-0.03019543, -0.5357336, -3.194647, 1, 1, 1, 1, 1,
-0.02645401, -0.4383483, -1.595859, 1, 1, 1, 1, 1,
-0.026219, 1.355928, -0.496985, 1, 1, 1, 1, 1,
-0.02498642, 0.1960365, 0.773751, 1, 1, 1, 1, 1,
-0.02334339, -0.000703717, -2.212089, 1, 1, 1, 1, 1,
-0.02310183, 0.745673, -0.6142203, 1, 1, 1, 1, 1,
-0.02284084, 0.4185093, -0.3819042, 1, 1, 1, 1, 1,
-0.01751339, -0.04826442, -3.06526, 1, 1, 1, 1, 1,
-0.01592134, 0.8793219, -2.041149, 1, 1, 1, 1, 1,
-0.01443871, 1.198019, 0.1865279, 1, 1, 1, 1, 1,
-0.01156467, -0.7277829, -4.041295, 1, 1, 1, 1, 1,
-0.009961208, -0.01197041, -2.585684, 1, 1, 1, 1, 1,
-0.007684418, -0.8253828, -3.092088, 1, 1, 1, 1, 1,
-0.007299554, -0.0297794, -4.718739, 1, 1, 1, 1, 1,
-0.006705615, -0.5438586, -2.932407, 0, 0, 1, 1, 1,
-0.006156663, 1.15601, -0.002357063, 1, 0, 0, 1, 1,
-0.002755421, 1.496797, 0.830915, 1, 0, 0, 1, 1,
-0.0005499542, 3.383919, 0.8193048, 1, 0, 0, 1, 1,
-1.12104e-05, 1.300246, 0.03650533, 1, 0, 0, 1, 1,
0.002197247, 1.156935, 2.321833, 1, 0, 0, 1, 1,
0.008695254, -1.153986, 2.355296, 0, 0, 0, 1, 1,
0.009242064, 0.19338, -0.482116, 0, 0, 0, 1, 1,
0.01254538, 0.6278651, 0.2648288, 0, 0, 0, 1, 1,
0.01273614, -0.6451253, 1.407813, 0, 0, 0, 1, 1,
0.01662015, -1.499952, 4.318201, 0, 0, 0, 1, 1,
0.01912794, 1.77104, 0.7546647, 0, 0, 0, 1, 1,
0.02145017, -2.159284, 2.963185, 0, 0, 0, 1, 1,
0.02185412, -0.3937795, 3.162328, 1, 1, 1, 1, 1,
0.0234781, -1.945717, 2.536374, 1, 1, 1, 1, 1,
0.03261596, -0.08586709, 3.620264, 1, 1, 1, 1, 1,
0.03596843, -0.8572201, 3.743462, 1, 1, 1, 1, 1,
0.03640452, 0.9154479, -0.7152776, 1, 1, 1, 1, 1,
0.04210326, 0.1411196, 0.8021538, 1, 1, 1, 1, 1,
0.04549048, -0.5635806, 3.287717, 1, 1, 1, 1, 1,
0.04753076, 0.9264582, -0.4930048, 1, 1, 1, 1, 1,
0.04802381, 1.929724, 0.7003413, 1, 1, 1, 1, 1,
0.04925425, -0.01210867, 1.191695, 1, 1, 1, 1, 1,
0.05129352, 0.1141694, -1.462278, 1, 1, 1, 1, 1,
0.05498604, -0.01826075, 2.856961, 1, 1, 1, 1, 1,
0.05520438, 0.1119493, -0.3384412, 1, 1, 1, 1, 1,
0.05591132, 0.5454057, 0.1873009, 1, 1, 1, 1, 1,
0.05781026, -0.5013089, 3.101117, 1, 1, 1, 1, 1,
0.06086703, -0.08271246, 2.373032, 0, 0, 1, 1, 1,
0.06567287, -0.2833435, 0.2860269, 1, 0, 0, 1, 1,
0.06907675, 0.06776067, 1.448275, 1, 0, 0, 1, 1,
0.07029077, -1.021547, 3.448081, 1, 0, 0, 1, 1,
0.07394847, 2.34855, -1.712227, 1, 0, 0, 1, 1,
0.07744419, 0.274811, 0.3127074, 1, 0, 0, 1, 1,
0.07898427, -0.3752559, 4.174757, 0, 0, 0, 1, 1,
0.07917943, -0.113087, 2.388237, 0, 0, 0, 1, 1,
0.08742584, 0.291186, 0.6419148, 0, 0, 0, 1, 1,
0.08920704, -0.6563108, 3.24009, 0, 0, 0, 1, 1,
0.09107511, -0.5868956, 1.845043, 0, 0, 0, 1, 1,
0.0913344, 1.840779, -0.4124697, 0, 0, 0, 1, 1,
0.09260684, -0.7476054, 2.191988, 0, 0, 0, 1, 1,
0.09528631, 0.08866771, 2.271476, 1, 1, 1, 1, 1,
0.09697112, 0.469499, 1.75169, 1, 1, 1, 1, 1,
0.09768021, 1.279412, 0.718958, 1, 1, 1, 1, 1,
0.09888258, 1.036593, -0.2336755, 1, 1, 1, 1, 1,
0.1000666, 0.05310404, 1.215815, 1, 1, 1, 1, 1,
0.1038454, 2.156875, 0.6473168, 1, 1, 1, 1, 1,
0.1044548, -0.170124, 3.420034, 1, 1, 1, 1, 1,
0.1117878, -0.2555753, 3.626199, 1, 1, 1, 1, 1,
0.1236556, 0.5760942, 0.5734855, 1, 1, 1, 1, 1,
0.1266027, 0.7625858, 0.1635573, 1, 1, 1, 1, 1,
0.1292555, -0.3569683, 3.725825, 1, 1, 1, 1, 1,
0.1294816, 0.933113, 0.8060312, 1, 1, 1, 1, 1,
0.1341858, 0.1333022, 1.132714, 1, 1, 1, 1, 1,
0.1364694, -1.243474, 2.353792, 1, 1, 1, 1, 1,
0.1372547, 0.3541198, -1.013234, 1, 1, 1, 1, 1,
0.1381244, -0.6687191, 3.578901, 0, 0, 1, 1, 1,
0.1389133, 0.9075841, 0.3539335, 1, 0, 0, 1, 1,
0.1400054, -1.446772, 4.374963, 1, 0, 0, 1, 1,
0.140136, 1.433088, -0.05794845, 1, 0, 0, 1, 1,
0.1404534, -1.083908, 3.323126, 1, 0, 0, 1, 1,
0.140589, -0.04946302, 0.9415157, 1, 0, 0, 1, 1,
0.1425442, 0.3336791, -0.6222346, 0, 0, 0, 1, 1,
0.1440924, -0.1759014, 0.5225435, 0, 0, 0, 1, 1,
0.1453616, 0.6173525, 1.181439, 0, 0, 0, 1, 1,
0.1481106, -0.8941006, 2.365826, 0, 0, 0, 1, 1,
0.1489085, 0.4271007, 1.872747, 0, 0, 0, 1, 1,
0.1568971, -0.3740594, 2.186478, 0, 0, 0, 1, 1,
0.157366, 0.9642033, -1.377891, 0, 0, 0, 1, 1,
0.1613986, 0.04457987, 0.5465247, 1, 1, 1, 1, 1,
0.1665868, -0.0511845, 1.644708, 1, 1, 1, 1, 1,
0.1675647, -1.165735, 3.007985, 1, 1, 1, 1, 1,
0.1702673, 1.675336, 0.015048, 1, 1, 1, 1, 1,
0.1739991, 0.7886726, -1.69957, 1, 1, 1, 1, 1,
0.1789857, 1.851923, -0.6797721, 1, 1, 1, 1, 1,
0.18478, 0.5643278, -1.801428, 1, 1, 1, 1, 1,
0.188751, -1.226604, 3.470711, 1, 1, 1, 1, 1,
0.1938567, -0.1894253, 1.207835, 1, 1, 1, 1, 1,
0.1963112, -0.3387884, 0.7344955, 1, 1, 1, 1, 1,
0.1970674, -0.6384873, 2.545303, 1, 1, 1, 1, 1,
0.1972949, 0.1041728, 0.03272686, 1, 1, 1, 1, 1,
0.2005292, 0.607229, 0.1385678, 1, 1, 1, 1, 1,
0.2045768, 0.06195292, 0.7016367, 1, 1, 1, 1, 1,
0.2050176, -0.51324, 1.326399, 1, 1, 1, 1, 1,
0.2058795, 0.3916634, 0.9880639, 0, 0, 1, 1, 1,
0.2059311, -0.5949682, 3.497248, 1, 0, 0, 1, 1,
0.2065858, -1.964532, 1.769807, 1, 0, 0, 1, 1,
0.2074574, 0.3025378, 2.003921, 1, 0, 0, 1, 1,
0.212184, 1.336412, -0.4376701, 1, 0, 0, 1, 1,
0.2137774, 0.3084622, -1.988505, 1, 0, 0, 1, 1,
0.2146683, -0.3144622, 1.845514, 0, 0, 0, 1, 1,
0.2147303, -0.5854196, 1.866626, 0, 0, 0, 1, 1,
0.2159757, -0.2179193, 1.752318, 0, 0, 0, 1, 1,
0.2193103, -0.2933052, 1.69149, 0, 0, 0, 1, 1,
0.2286577, -0.04393062, 3.458805, 0, 0, 0, 1, 1,
0.233601, -0.05325522, 0.5789922, 0, 0, 0, 1, 1,
0.2339865, 1.063743, -2.093976, 0, 0, 0, 1, 1,
0.2361514, -1.105744, 3.174009, 1, 1, 1, 1, 1,
0.2466301, -0.9146376, 2.330941, 1, 1, 1, 1, 1,
0.247217, 1.049253, -0.6481404, 1, 1, 1, 1, 1,
0.2479738, -0.5996448, 2.872465, 1, 1, 1, 1, 1,
0.2492914, 0.7844502, -1.455879, 1, 1, 1, 1, 1,
0.2512019, 0.5890753, -0.513835, 1, 1, 1, 1, 1,
0.2518575, 0.8578631, -1.604522, 1, 1, 1, 1, 1,
0.2521129, -1.3059, 4.567227, 1, 1, 1, 1, 1,
0.2565108, -1.252308, 3.612723, 1, 1, 1, 1, 1,
0.2576391, 0.1273986, -1.639057, 1, 1, 1, 1, 1,
0.2593884, -1.655422, 4.394617, 1, 1, 1, 1, 1,
0.2609014, -0.4475999, 2.802117, 1, 1, 1, 1, 1,
0.2709619, -0.5835726, 0.5415279, 1, 1, 1, 1, 1,
0.275704, 0.8013279, -1.083324, 1, 1, 1, 1, 1,
0.2758506, 0.7788432, 0.9641397, 1, 1, 1, 1, 1,
0.2827519, 0.501624, 1.210569, 0, 0, 1, 1, 1,
0.2902416, -0.4318011, 1.051069, 1, 0, 0, 1, 1,
0.2914863, 1.087231, 0.2955249, 1, 0, 0, 1, 1,
0.296995, -1.566406, 2.836187, 1, 0, 0, 1, 1,
0.2978113, 1.43655, -1.285756, 1, 0, 0, 1, 1,
0.3041868, -1.535297, 1.585143, 1, 0, 0, 1, 1,
0.3048059, 0.2834808, 0.477374, 0, 0, 0, 1, 1,
0.3073016, -0.9869387, 2.872994, 0, 0, 0, 1, 1,
0.308999, -0.8339144, 3.529371, 0, 0, 0, 1, 1,
0.3126032, 0.486279, 1.494853, 0, 0, 0, 1, 1,
0.3128284, 1.326879, -1.162303, 0, 0, 0, 1, 1,
0.3184109, -0.5997624, 1.0429, 0, 0, 0, 1, 1,
0.3194302, -0.9999383, 1.886913, 0, 0, 0, 1, 1,
0.3223207, -0.30768, 3.582748, 1, 1, 1, 1, 1,
0.3225574, 0.956018, -1.188655, 1, 1, 1, 1, 1,
0.3241081, 0.9771835, 0.3437484, 1, 1, 1, 1, 1,
0.3266539, 1.513058, 0.4866556, 1, 1, 1, 1, 1,
0.3312739, -1.242531, 3.699594, 1, 1, 1, 1, 1,
0.3319328, -1.296079, 3.137946, 1, 1, 1, 1, 1,
0.3357805, 0.06542756, 1.637056, 1, 1, 1, 1, 1,
0.3370517, -0.4647572, 1.783007, 1, 1, 1, 1, 1,
0.3394268, 0.864938, -0.1283898, 1, 1, 1, 1, 1,
0.339932, 1.085089, -0.5437173, 1, 1, 1, 1, 1,
0.3467327, 0.9928097, -0.5272503, 1, 1, 1, 1, 1,
0.3498285, -0.2671971, 3.642783, 1, 1, 1, 1, 1,
0.3583253, -2.4965, 1.737375, 1, 1, 1, 1, 1,
0.3586736, -0.5107719, 4.462745, 1, 1, 1, 1, 1,
0.3602797, 0.5621113, 0.9322861, 1, 1, 1, 1, 1,
0.3622881, 0.06133243, -0.2088689, 0, 0, 1, 1, 1,
0.3626004, 0.9327483, -0.5778033, 1, 0, 0, 1, 1,
0.3673304, -1.232036, 2.574289, 1, 0, 0, 1, 1,
0.368899, -0.4132704, 3.236472, 1, 0, 0, 1, 1,
0.3694341, 0.1871921, 0.7441273, 1, 0, 0, 1, 1,
0.369498, -0.6206751, 3.100204, 1, 0, 0, 1, 1,
0.3698664, 1.643722, -0.6548519, 0, 0, 0, 1, 1,
0.370481, 1.083251, 0.6491215, 0, 0, 0, 1, 1,
0.3735787, 0.5982459, 0.04796969, 0, 0, 0, 1, 1,
0.3769565, -0.2136718, 2.40453, 0, 0, 0, 1, 1,
0.3806576, -0.3747818, 3.65548, 0, 0, 0, 1, 1,
0.3822049, 0.2587653, 0.1278967, 0, 0, 0, 1, 1,
0.3862659, 1.139847, 0.9455909, 0, 0, 0, 1, 1,
0.3867016, -0.9194577, 0.8695501, 1, 1, 1, 1, 1,
0.387643, 0.491087, 2.514326, 1, 1, 1, 1, 1,
0.388063, 0.3641993, 0.8919831, 1, 1, 1, 1, 1,
0.3884211, -1.102014, 2.242, 1, 1, 1, 1, 1,
0.3951263, -0.6507898, 3.585325, 1, 1, 1, 1, 1,
0.3956908, 0.2588624, 1.837271, 1, 1, 1, 1, 1,
0.3964426, -0.3441661, 1.428876, 1, 1, 1, 1, 1,
0.4007755, 1.033139, 1.145239, 1, 1, 1, 1, 1,
0.4053674, 1.023029, -0.858793, 1, 1, 1, 1, 1,
0.4055193, -0.9666683, 4.732371, 1, 1, 1, 1, 1,
0.407642, 0.9571, 1.623999, 1, 1, 1, 1, 1,
0.4084187, 0.8980045, 0.3849642, 1, 1, 1, 1, 1,
0.4087624, -0.7807051, 3.17946, 1, 1, 1, 1, 1,
0.4088157, -3.049311, 4.267995, 1, 1, 1, 1, 1,
0.4112177, -0.6788633, 2.877266, 1, 1, 1, 1, 1,
0.4126003, -0.1962953, 1.330719, 0, 0, 1, 1, 1,
0.4134587, -0.1196183, 2.19018, 1, 0, 0, 1, 1,
0.4158802, 1.477412, 0.0305769, 1, 0, 0, 1, 1,
0.4204752, -0.5142145, 2.343325, 1, 0, 0, 1, 1,
0.4258754, 0.824866, -0.20107, 1, 0, 0, 1, 1,
0.4332937, 0.4471151, 1.871919, 1, 0, 0, 1, 1,
0.4336397, 2.122089, 0.3588495, 0, 0, 0, 1, 1,
0.4353022, 1.017802, 0.2266437, 0, 0, 0, 1, 1,
0.4370706, -1.372251, 3.793584, 0, 0, 0, 1, 1,
0.4371665, -0.113546, 1.819086, 0, 0, 0, 1, 1,
0.4372976, -0.5416068, 3.966937, 0, 0, 0, 1, 1,
0.4425266, -0.5690765, 1.808458, 0, 0, 0, 1, 1,
0.4431754, 0.4656332, 0.7105683, 0, 0, 0, 1, 1,
0.4438755, 3.071378, -1.250383, 1, 1, 1, 1, 1,
0.4486032, 0.2853361, 2.239919, 1, 1, 1, 1, 1,
0.4499052, 0.7576062, 2.26176, 1, 1, 1, 1, 1,
0.4558321, 1.066459, 2.612479, 1, 1, 1, 1, 1,
0.4568329, -0.4107472, 3.508082, 1, 1, 1, 1, 1,
0.4599863, -1.221714, 2.760902, 1, 1, 1, 1, 1,
0.4632547, 0.3474958, 1.826679, 1, 1, 1, 1, 1,
0.4653617, -0.8431604, 2.088429, 1, 1, 1, 1, 1,
0.4664179, 1.409331, 0.7290402, 1, 1, 1, 1, 1,
0.467566, -0.8141675, 4.767522, 1, 1, 1, 1, 1,
0.4696588, 0.3137544, 0.6925784, 1, 1, 1, 1, 1,
0.4710109, 0.9807876, 0.8927649, 1, 1, 1, 1, 1,
0.4719506, -0.05959025, 2.594047, 1, 1, 1, 1, 1,
0.47741, -0.9522801, 3.176109, 1, 1, 1, 1, 1,
0.4806514, -1.810821, 3.294501, 1, 1, 1, 1, 1,
0.4834689, -1.277509, 2.885629, 0, 0, 1, 1, 1,
0.4869382, -0.7589715, 1.428781, 1, 0, 0, 1, 1,
0.4873375, -0.3700193, 2.15558, 1, 0, 0, 1, 1,
0.4888854, 0.711432, 0.1805984, 1, 0, 0, 1, 1,
0.4910798, 0.26152, 2.202427, 1, 0, 0, 1, 1,
0.4913298, -0.02171373, 0.4661913, 1, 0, 0, 1, 1,
0.4930443, -0.185156, 2.763955, 0, 0, 0, 1, 1,
0.4937307, -0.009115538, 0.1135151, 0, 0, 0, 1, 1,
0.4945386, -0.932088, 0.9650988, 0, 0, 0, 1, 1,
0.4966217, -0.2558424, 2.07346, 0, 0, 0, 1, 1,
0.4976425, 0.6209306, 1.100016, 0, 0, 0, 1, 1,
0.5113871, 0.8608602, -0.09393594, 0, 0, 0, 1, 1,
0.5147625, 1.971634, -0.0682053, 0, 0, 0, 1, 1,
0.5165673, 0.05739802, 0.2799417, 1, 1, 1, 1, 1,
0.5168771, 0.7231171, 0.8942417, 1, 1, 1, 1, 1,
0.5173938, 0.1307842, 1.965581, 1, 1, 1, 1, 1,
0.5222616, -1.528514, 4.480515, 1, 1, 1, 1, 1,
0.5227307, 0.4002074, -0.3474892, 1, 1, 1, 1, 1,
0.5285612, -0.8088086, 1.423269, 1, 1, 1, 1, 1,
0.5296337, 0.1750388, 2.267546, 1, 1, 1, 1, 1,
0.5305232, -1.457192, 2.189711, 1, 1, 1, 1, 1,
0.5360252, 2.029621, 1.524006, 1, 1, 1, 1, 1,
0.5393081, -1.250489, 2.39562, 1, 1, 1, 1, 1,
0.54106, -0.2810348, 2.785386, 1, 1, 1, 1, 1,
0.5433908, -0.7545869, 5.195519, 1, 1, 1, 1, 1,
0.5439346, -0.3780409, 2.761718, 1, 1, 1, 1, 1,
0.5471374, 1.262041, -0.5101924, 1, 1, 1, 1, 1,
0.5474445, -1.201642, 2.595681, 1, 1, 1, 1, 1,
0.5501626, -0.549735, 2.298692, 0, 0, 1, 1, 1,
0.5570128, 0.418685, 0.03183308, 1, 0, 0, 1, 1,
0.559453, 1.081715, -1.953485, 1, 0, 0, 1, 1,
0.5619668, 0.4353468, 1.279686, 1, 0, 0, 1, 1,
0.5622654, -0.06572933, 2.476945, 1, 0, 0, 1, 1,
0.5650312, 0.5680375, 1.480744, 1, 0, 0, 1, 1,
0.5676901, 0.8837844, 1.624406, 0, 0, 0, 1, 1,
0.5742909, 0.4833491, 0.9172345, 0, 0, 0, 1, 1,
0.5747409, -1.046641, 3.665976, 0, 0, 0, 1, 1,
0.5772368, 0.1395895, 0.2275165, 0, 0, 0, 1, 1,
0.5778309, -0.723537, 3.234941, 0, 0, 0, 1, 1,
0.5811464, -0.6621178, 1.997986, 0, 0, 0, 1, 1,
0.5868381, -1.096413, 3.00141, 0, 0, 0, 1, 1,
0.587239, 0.976092, 1.673029, 1, 1, 1, 1, 1,
0.5922221, 2.008541, -0.8351101, 1, 1, 1, 1, 1,
0.5951343, -0.2035091, 1.362646, 1, 1, 1, 1, 1,
0.59531, -1.487397, 3.086278, 1, 1, 1, 1, 1,
0.5971755, -0.3620046, 0.7462463, 1, 1, 1, 1, 1,
0.6021851, 2.708585, 0.08548962, 1, 1, 1, 1, 1,
0.6037732, 0.538408, 0.9430678, 1, 1, 1, 1, 1,
0.6081937, 1.341951, -1.670136, 1, 1, 1, 1, 1,
0.6137103, -0.9577183, 2.278367, 1, 1, 1, 1, 1,
0.6163508, -0.1605979, 2.721822, 1, 1, 1, 1, 1,
0.616964, 2.599203, 0.06292327, 1, 1, 1, 1, 1,
0.618711, -0.1215593, 1.304272, 1, 1, 1, 1, 1,
0.6210538, -0.5208589, -0.1641121, 1, 1, 1, 1, 1,
0.6212233, -0.8994206, 3.64403, 1, 1, 1, 1, 1,
0.6304178, -0.0115478, 1.16528, 1, 1, 1, 1, 1,
0.64568, -0.4534348, 1.282053, 0, 0, 1, 1, 1,
0.6499755, 0.01615017, 2.146861, 1, 0, 0, 1, 1,
0.6697064, 0.2334879, 1.053116, 1, 0, 0, 1, 1,
0.6757965, 1.001961, 1.355863, 1, 0, 0, 1, 1,
0.6761509, -0.8636783, 1.11137, 1, 0, 0, 1, 1,
0.679253, 2.111573, 2.063868, 1, 0, 0, 1, 1,
0.6793858, 1.768442, -0.07092708, 0, 0, 0, 1, 1,
0.6827628, 1.063239, -0.1445291, 0, 0, 0, 1, 1,
0.6830497, 1.328101, 0.180515, 0, 0, 0, 1, 1,
0.6901614, -0.2449128, 0.9803646, 0, 0, 0, 1, 1,
0.6994291, 1.114328, 1.318136, 0, 0, 0, 1, 1,
0.7001754, -1.229212, 3.312332, 0, 0, 0, 1, 1,
0.7012678, 1.34411, 0.5876274, 0, 0, 0, 1, 1,
0.7025893, 0.8362095, 0.2457985, 1, 1, 1, 1, 1,
0.7027358, 0.3297389, 1.604446, 1, 1, 1, 1, 1,
0.707449, -0.98927, 2.661588, 1, 1, 1, 1, 1,
0.7185367, 0.131914, -0.1648829, 1, 1, 1, 1, 1,
0.7198798, 0.6600355, 2.032427, 1, 1, 1, 1, 1,
0.7208591, -0.1902111, 2.670876, 1, 1, 1, 1, 1,
0.7218161, -0.1697811, 4.218887, 1, 1, 1, 1, 1,
0.7236783, 0.5848298, 0.9198889, 1, 1, 1, 1, 1,
0.7270672, 0.1315691, 0.8954647, 1, 1, 1, 1, 1,
0.7289707, -0.713067, 1.275877, 1, 1, 1, 1, 1,
0.7370142, 1.889393, 1.72026, 1, 1, 1, 1, 1,
0.7375366, -0.8906482, 3.820981, 1, 1, 1, 1, 1,
0.7381611, 1.294567, -0.2756916, 1, 1, 1, 1, 1,
0.738367, -0.09801846, -0.7224655, 1, 1, 1, 1, 1,
0.7425188, -1.152698, 1.626203, 1, 1, 1, 1, 1,
0.7427292, 0.2621467, 1.15029, 0, 0, 1, 1, 1,
0.745276, -0.1899587, 2.226882, 1, 0, 0, 1, 1,
0.7510781, -0.8228813, 3.968158, 1, 0, 0, 1, 1,
0.7515973, -1.100279, 3.328884, 1, 0, 0, 1, 1,
0.7562415, -0.06733967, 2.320478, 1, 0, 0, 1, 1,
0.7582628, -0.7820668, 2.705732, 1, 0, 0, 1, 1,
0.7615902, -0.3035852, 2.835018, 0, 0, 0, 1, 1,
0.7623281, -1.255098, 2.998471, 0, 0, 0, 1, 1,
0.7662482, 0.538752, 2.87432, 0, 0, 0, 1, 1,
0.7716784, 1.338044, 0.7461265, 0, 0, 0, 1, 1,
0.7791016, -0.7991832, 3.021584, 0, 0, 0, 1, 1,
0.7840891, -0.8934515, 1.515685, 0, 0, 0, 1, 1,
0.7844656, -0.6830477, 3.494421, 0, 0, 0, 1, 1,
0.7919148, 0.5294569, 2.365623, 1, 1, 1, 1, 1,
0.7945876, -0.4941054, 3.851891, 1, 1, 1, 1, 1,
0.7998973, 0.07767902, 0.6166235, 1, 1, 1, 1, 1,
0.8012862, 0.3797052, 2.10123, 1, 1, 1, 1, 1,
0.8018484, 0.4044425, 2.336804, 1, 1, 1, 1, 1,
0.8114774, 1.816395, -0.7667278, 1, 1, 1, 1, 1,
0.812205, 1.955966, 0.5054197, 1, 1, 1, 1, 1,
0.8279482, -1.241443, 2.185938, 1, 1, 1, 1, 1,
0.8283606, 0.03108207, 2.449669, 1, 1, 1, 1, 1,
0.8335715, -0.2509696, 2.787919, 1, 1, 1, 1, 1,
0.8343854, 0.02695499, 0.2461989, 1, 1, 1, 1, 1,
0.841499, 0.6319039, 0.9602196, 1, 1, 1, 1, 1,
0.8519176, -1.102794, 0.5684175, 1, 1, 1, 1, 1,
0.8547764, -0.7680594, 2.669214, 1, 1, 1, 1, 1,
0.8652245, 0.7109202, -0.98618, 1, 1, 1, 1, 1,
0.8653724, -0.07891245, -0.3364116, 0, 0, 1, 1, 1,
0.8706433, -1.643844, 3.021151, 1, 0, 0, 1, 1,
0.8734249, 0.929764, 1.56664, 1, 0, 0, 1, 1,
0.8747303, 0.1190103, 1.913595, 1, 0, 0, 1, 1,
0.8758443, 0.6059942, 1.468547, 1, 0, 0, 1, 1,
0.8790982, -0.9951833, 2.552404, 1, 0, 0, 1, 1,
0.8815129, 0.7464412, -1.171391, 0, 0, 0, 1, 1,
0.892489, -1.09335, 1.758233, 0, 0, 0, 1, 1,
0.8946334, 0.5900977, 1.182066, 0, 0, 0, 1, 1,
0.8960185, -0.4638957, 1.164782, 0, 0, 0, 1, 1,
0.8963918, -0.2165236, 0.344543, 0, 0, 0, 1, 1,
0.8970423, 0.0151159, -0.211137, 0, 0, 0, 1, 1,
0.9054319, -0.3279471, 2.013026, 0, 0, 0, 1, 1,
0.9073879, 1.77375, -0.1286472, 1, 1, 1, 1, 1,
0.9081063, -1.172818, 2.9953, 1, 1, 1, 1, 1,
0.9084026, -0.5659782, 0.5111486, 1, 1, 1, 1, 1,
0.9124665, -1.458115, 2.784464, 1, 1, 1, 1, 1,
0.9127418, -0.02559399, 2.345038, 1, 1, 1, 1, 1,
0.9138907, -0.8886702, 4.264226, 1, 1, 1, 1, 1,
0.9152741, 0.3659514, 0.9196955, 1, 1, 1, 1, 1,
0.9226742, -1.063969, 0.5843105, 1, 1, 1, 1, 1,
0.927476, 0.09181374, 0.5035373, 1, 1, 1, 1, 1,
0.9377733, -0.521488, 3.049535, 1, 1, 1, 1, 1,
0.9542018, 0.2199291, 1.215243, 1, 1, 1, 1, 1,
0.9545837, -0.1166233, 1.158989, 1, 1, 1, 1, 1,
0.9551435, -1.469766, 2.654272, 1, 1, 1, 1, 1,
0.9589496, 0.7638841, 1.616059, 1, 1, 1, 1, 1,
0.9602339, -0.3179255, 3.102682, 1, 1, 1, 1, 1,
0.9609006, 0.7582436, 1.494642, 0, 0, 1, 1, 1,
0.9804662, 0.2929526, 0.3961588, 1, 0, 0, 1, 1,
0.9822637, 0.9171758, 0.9991429, 1, 0, 0, 1, 1,
0.988135, -0.8570127, 3.617829, 1, 0, 0, 1, 1,
0.9895256, 0.8779998, 0.04812243, 1, 0, 0, 1, 1,
0.9906723, 0.835098, 0.7421594, 1, 0, 0, 1, 1,
0.9985045, -0.01847644, 0.5073965, 0, 0, 0, 1, 1,
1.000329, 1.179677, 0.6638404, 0, 0, 0, 1, 1,
1.001935, -0.3930898, 1.300494, 0, 0, 0, 1, 1,
1.017426, 0.835918, 0.3805903, 0, 0, 0, 1, 1,
1.022444, 0.5936491, 0.9158819, 0, 0, 0, 1, 1,
1.027853, -0.2773434, 2.881559, 0, 0, 0, 1, 1,
1.03007, 2.036716, -1.139933, 0, 0, 0, 1, 1,
1.032024, 0.3375409, 0.5938582, 1, 1, 1, 1, 1,
1.035717, -0.3461032, 1.999209, 1, 1, 1, 1, 1,
1.050219, -0.6980792, 4.451481, 1, 1, 1, 1, 1,
1.050547, 2.205895, 1.021341, 1, 1, 1, 1, 1,
1.063798, -0.4383485, 1.507933, 1, 1, 1, 1, 1,
1.065831, -1.609841, 3.604312, 1, 1, 1, 1, 1,
1.065976, 0.4704826, 2.539911, 1, 1, 1, 1, 1,
1.074801, 0.9692142, 1.712433, 1, 1, 1, 1, 1,
1.076837, -1.264959, 1.519078, 1, 1, 1, 1, 1,
1.076863, 1.661685, 1.123172, 1, 1, 1, 1, 1,
1.08042, 1.914493, 2.95491, 1, 1, 1, 1, 1,
1.080738, 1.272845, 1.106275, 1, 1, 1, 1, 1,
1.081751, 1.344734, 1.946473, 1, 1, 1, 1, 1,
1.090058, -0.2678383, 2.403856, 1, 1, 1, 1, 1,
1.094489, -0.8844133, 1.59512, 1, 1, 1, 1, 1,
1.099059, 2.177209, 0.2841573, 0, 0, 1, 1, 1,
1.101093, 0.7640009, 1.478133, 1, 0, 0, 1, 1,
1.101496, 0.1786374, 0.9463366, 1, 0, 0, 1, 1,
1.103934, -2.488401, 2.429457, 1, 0, 0, 1, 1,
1.107163, 2.004835, -0.5629094, 1, 0, 0, 1, 1,
1.110164, -0.2085975, -0.03266878, 1, 0, 0, 1, 1,
1.111835, 0.5676416, -0.3258536, 0, 0, 0, 1, 1,
1.11984, 0.4536055, 0.4447023, 0, 0, 0, 1, 1,
1.137506, 0.3840219, 1.786895, 0, 0, 0, 1, 1,
1.150959, -1.157133, 2.17861, 0, 0, 0, 1, 1,
1.153634, -0.1028034, 1.381406, 0, 0, 0, 1, 1,
1.163424, -0.980936, 1.462572, 0, 0, 0, 1, 1,
1.167022, 0.2200411, 0.8443325, 0, 0, 0, 1, 1,
1.17999, -0.06309319, 1.610491, 1, 1, 1, 1, 1,
1.184715, -1.728069, 3.568799, 1, 1, 1, 1, 1,
1.204607, -0.6671023, 2.086359, 1, 1, 1, 1, 1,
1.214795, -0.5267236, 1.402531, 1, 1, 1, 1, 1,
1.215845, 2.815573, 0.6167918, 1, 1, 1, 1, 1,
1.216204, 1.433524, -0.348775, 1, 1, 1, 1, 1,
1.223528, -0.9937919, 3.464663, 1, 1, 1, 1, 1,
1.22472, 0.9669846, 0.6444197, 1, 1, 1, 1, 1,
1.229903, 0.4372306, 2.269049, 1, 1, 1, 1, 1,
1.238881, 1.439673, 2.499422, 1, 1, 1, 1, 1,
1.240211, 0.6939074, 2.734677, 1, 1, 1, 1, 1,
1.262553, -0.8018566, 0.7023612, 1, 1, 1, 1, 1,
1.263945, 1.459417, -0.1655661, 1, 1, 1, 1, 1,
1.273272, 0.634837, 0.1442091, 1, 1, 1, 1, 1,
1.287143, -1.908573, 2.314071, 1, 1, 1, 1, 1,
1.295534, -0.2900544, 0.4819498, 0, 0, 1, 1, 1,
1.300718, -1.15463, 1.11142, 1, 0, 0, 1, 1,
1.304954, -0.1958302, 0.6971665, 1, 0, 0, 1, 1,
1.310187, -0.8688279, 1.496613, 1, 0, 0, 1, 1,
1.31295, 0.9467501, 0.6683455, 1, 0, 0, 1, 1,
1.315167, 0.4995269, 1.08952, 1, 0, 0, 1, 1,
1.317031, 1.498437, -0.1584036, 0, 0, 0, 1, 1,
1.322039, 0.4225277, 2.260553, 0, 0, 0, 1, 1,
1.330138, -0.6284277, 2.200662, 0, 0, 0, 1, 1,
1.335678, -0.06925073, 2.124465, 0, 0, 0, 1, 1,
1.338756, -0.4616007, 2.950285, 0, 0, 0, 1, 1,
1.348874, 0.1180037, 0.3352429, 0, 0, 0, 1, 1,
1.353482, -1.394443, 0.9629928, 0, 0, 0, 1, 1,
1.369208, -0.6981644, 1.055519, 1, 1, 1, 1, 1,
1.371532, -0.4711463, 1.469112, 1, 1, 1, 1, 1,
1.374782, 0.7288109, 2.044751, 1, 1, 1, 1, 1,
1.37703, -0.9928198, 2.564928, 1, 1, 1, 1, 1,
1.389034, -1.623488, 1.544715, 1, 1, 1, 1, 1,
1.390069, 0.23726, 1.548408, 1, 1, 1, 1, 1,
1.394071, -0.07518993, 0.6508085, 1, 1, 1, 1, 1,
1.395369, 0.5305424, 1.1402, 1, 1, 1, 1, 1,
1.395842, -2.835228, 2.19749, 1, 1, 1, 1, 1,
1.397368, 0.1897552, 1.410031, 1, 1, 1, 1, 1,
1.402787, -1.645799, 4.081358, 1, 1, 1, 1, 1,
1.403052, 1.302421, -0.8787401, 1, 1, 1, 1, 1,
1.404709, -1.771674, 0.09601576, 1, 1, 1, 1, 1,
1.419199, 1.944498, -0.5433128, 1, 1, 1, 1, 1,
1.422532, 0.4813529, 1.352918, 1, 1, 1, 1, 1,
1.43274, -0.0842355, 2.982385, 0, 0, 1, 1, 1,
1.434856, 2.656721, 1.919543, 1, 0, 0, 1, 1,
1.438393, -0.6281578, 3.907235, 1, 0, 0, 1, 1,
1.447543, -0.9794338, 1.801441, 1, 0, 0, 1, 1,
1.448962, -0.3716302, 4.014709, 1, 0, 0, 1, 1,
1.452975, 0.5820025, 2.5646, 1, 0, 0, 1, 1,
1.464255, -0.2574427, 0.9652283, 0, 0, 0, 1, 1,
1.466129, -0.408819, 0.2589676, 0, 0, 0, 1, 1,
1.475572, 1.228662, 1.531225, 0, 0, 0, 1, 1,
1.476553, 0.6013787, 2.629754, 0, 0, 0, 1, 1,
1.484392, 2.520498, -0.2039577, 0, 0, 0, 1, 1,
1.484446, -0.6758589, 1.377862, 0, 0, 0, 1, 1,
1.486083, 1.516266, 1.198212, 0, 0, 0, 1, 1,
1.498425, -0.02843877, 0.6960073, 1, 1, 1, 1, 1,
1.50602, -0.2513818, 1.503979, 1, 1, 1, 1, 1,
1.512418, -0.09251431, 1.550041, 1, 1, 1, 1, 1,
1.51335, 0.4194126, 0.3046443, 1, 1, 1, 1, 1,
1.520525, -0.3409193, 2.106997, 1, 1, 1, 1, 1,
1.524884, -2.006988, 1.150759, 1, 1, 1, 1, 1,
1.544871, 1.037189, 1.380836, 1, 1, 1, 1, 1,
1.552824, -0.6413824, 2.852561, 1, 1, 1, 1, 1,
1.558002, -0.09731823, 0.7583956, 1, 1, 1, 1, 1,
1.559742, 0.1491922, 0.9608504, 1, 1, 1, 1, 1,
1.562969, -0.6535429, 1.538412, 1, 1, 1, 1, 1,
1.583654, -0.1080291, 1.974813, 1, 1, 1, 1, 1,
1.584186, 1.494832, 0.2345948, 1, 1, 1, 1, 1,
1.584599, 1.112615, 2.973462, 1, 1, 1, 1, 1,
1.600682, -0.3771458, 1.62522, 1, 1, 1, 1, 1,
1.604039, -0.445926, 1.544665, 0, 0, 1, 1, 1,
1.60944, -0.6498699, 1.865988, 1, 0, 0, 1, 1,
1.609953, 0.03576943, 2.860168, 1, 0, 0, 1, 1,
1.612173, 0.3910241, 0.6831303, 1, 0, 0, 1, 1,
1.617839, 1.849479, 2.981823, 1, 0, 0, 1, 1,
1.630804, 0.5215662, 2.634859, 1, 0, 0, 1, 1,
1.639654, -1.056113, 2.147997, 0, 0, 0, 1, 1,
1.64334, -0.1501441, 2.430313, 0, 0, 0, 1, 1,
1.648465, 0.5052182, 0.02492035, 0, 0, 0, 1, 1,
1.648861, 0.4954052, 0.6161156, 0, 0, 0, 1, 1,
1.65501, -0.171591, 1.745136, 0, 0, 0, 1, 1,
1.668907, -1.142023, 2.908516, 0, 0, 0, 1, 1,
1.674587, -0.3358012, 2.252133, 0, 0, 0, 1, 1,
1.687195, -0.3554678, 3.342728, 1, 1, 1, 1, 1,
1.702695, -0.1554045, 1.229035, 1, 1, 1, 1, 1,
1.706951, -0.5975116, 1.301277, 1, 1, 1, 1, 1,
1.717398, -1.485635, 3.917675, 1, 1, 1, 1, 1,
1.729162, -0.2424023, 2.542128, 1, 1, 1, 1, 1,
1.752225, 1.449662, 1.404691, 1, 1, 1, 1, 1,
1.766885, -0.149487, 1.259316, 1, 1, 1, 1, 1,
1.773617, 0.7438591, 1.207055, 1, 1, 1, 1, 1,
1.787896, -1.006457, 2.731689, 1, 1, 1, 1, 1,
1.8152, 0.3320082, 2.294966, 1, 1, 1, 1, 1,
1.911673, -0.4210741, 0.8584283, 1, 1, 1, 1, 1,
1.923963, -1.781469, 2.28329, 1, 1, 1, 1, 1,
1.950271, 0.2715144, 1.518053, 1, 1, 1, 1, 1,
1.953014, -0.7653399, 1.42409, 1, 1, 1, 1, 1,
1.977852, 0.2477198, 2.311724, 1, 1, 1, 1, 1,
1.983487, -0.7764782, 0.6530778, 0, 0, 1, 1, 1,
2.064906, -1.911651, 2.772332, 1, 0, 0, 1, 1,
2.094207, -0.4812391, 2.42591, 1, 0, 0, 1, 1,
2.102786, -1.581307, 2.327431, 1, 0, 0, 1, 1,
2.167946, 0.1838308, 0.3213374, 1, 0, 0, 1, 1,
2.20323, -0.7433107, 1.586749, 1, 0, 0, 1, 1,
2.216073, 1.184514, 1.99803, 0, 0, 0, 1, 1,
2.230639, 0.8492456, 1.449259, 0, 0, 0, 1, 1,
2.258275, 1.730976, 1.206654, 0, 0, 0, 1, 1,
2.301749, 0.5885388, 1.051977, 0, 0, 0, 1, 1,
2.328016, -1.603705, 2.279032, 0, 0, 0, 1, 1,
2.466147, -0.9611534, 1.065344, 0, 0, 0, 1, 1,
2.485589, -0.6354706, 1.509034, 0, 0, 0, 1, 1,
2.525085, 0.4236547, 0.5537977, 1, 1, 1, 1, 1,
2.537135, 0.3792357, 1.364474, 1, 1, 1, 1, 1,
2.563083, 0.435302, 2.437211, 1, 1, 1, 1, 1,
2.827531, 0.710415, 2.254341, 1, 1, 1, 1, 1,
2.895054, 0.4585296, -0.7679547, 1, 1, 1, 1, 1,
3.009814, 1.292079, 1.778419, 1, 1, 1, 1, 1,
3.061695, 1.23219, 1.517307, 1, 1, 1, 1, 1
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
var radius = 9.597359;
var distance = 33.71032;
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
mvMatrix.translate( 0.1158028, 0.1126525, 0.005508423 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.71032);
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
