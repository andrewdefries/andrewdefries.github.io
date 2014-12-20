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
-2.984704, -0.2756493, -0.05902785, 1, 0, 0, 1,
-2.844089, 0.3285478, -1.670539, 1, 0.007843138, 0, 1,
-2.737849, 0.5095461, 0.7611153, 1, 0.01176471, 0, 1,
-2.622802, -0.1255513, -0.4242172, 1, 0.01960784, 0, 1,
-2.603875, 1.204246, 0.1988863, 1, 0.02352941, 0, 1,
-2.589714, -1.07383, -0.6040632, 1, 0.03137255, 0, 1,
-2.363322, 1.310452, 0.6133318, 1, 0.03529412, 0, 1,
-2.355911, -0.2195263, -1.436754, 1, 0.04313726, 0, 1,
-2.321858, 0.03529241, -2.911984, 1, 0.04705882, 0, 1,
-2.316702, -0.8400013, -1.610597, 1, 0.05490196, 0, 1,
-2.297524, -0.5217527, -1.365537, 1, 0.05882353, 0, 1,
-2.287594, -0.5215023, -0.8496826, 1, 0.06666667, 0, 1,
-2.255522, 0.07085523, 0.5522385, 1, 0.07058824, 0, 1,
-2.24863, 0.5596164, -1.170604, 1, 0.07843138, 0, 1,
-2.217996, -0.8228045, -1.902556, 1, 0.08235294, 0, 1,
-2.206715, 0.04783844, -1.770045, 1, 0.09019608, 0, 1,
-2.18279, 0.7454777, 0.7410232, 1, 0.09411765, 0, 1,
-2.13101, 0.2712392, -0.4036355, 1, 0.1019608, 0, 1,
-2.05371, -0.1688712, -2.097019, 1, 0.1098039, 0, 1,
-1.986289, -0.762996, -2.89148, 1, 0.1137255, 0, 1,
-1.975908, -0.6216556, -1.385346, 1, 0.1215686, 0, 1,
-1.97422, 0.2155046, -0.58736, 1, 0.1254902, 0, 1,
-1.947417, 0.6691884, -0.6969243, 1, 0.1333333, 0, 1,
-1.919836, 0.5753615, -1.080298, 1, 0.1372549, 0, 1,
-1.912688, 0.7779507, -1.880149, 1, 0.145098, 0, 1,
-1.911522, -0.9345897, -3.37204, 1, 0.1490196, 0, 1,
-1.883394, -0.3030769, -1.49303, 1, 0.1568628, 0, 1,
-1.874932, -0.9744042, -1.507853, 1, 0.1607843, 0, 1,
-1.850782, -0.2813842, -1.967331, 1, 0.1686275, 0, 1,
-1.82898, 0.7586153, -1.75831, 1, 0.172549, 0, 1,
-1.798633, 0.1761048, -0.6133552, 1, 0.1803922, 0, 1,
-1.792452, -2.789758, -2.716667, 1, 0.1843137, 0, 1,
-1.778085, -0.3552493, -2.443368, 1, 0.1921569, 0, 1,
-1.768377, -0.5825603, -0.9760611, 1, 0.1960784, 0, 1,
-1.768271, 2.450444, -1.354419, 1, 0.2039216, 0, 1,
-1.719067, -1.99161, -3.995344, 1, 0.2117647, 0, 1,
-1.716086, -0.3370321, -1.670819, 1, 0.2156863, 0, 1,
-1.709543, -1.149736, -1.948806, 1, 0.2235294, 0, 1,
-1.707557, -0.6596947, -3.066243, 1, 0.227451, 0, 1,
-1.700066, -0.710959, -2.207152, 1, 0.2352941, 0, 1,
-1.684428, -0.2280395, -1.975781, 1, 0.2392157, 0, 1,
-1.680541, -0.5716133, -0.1002985, 1, 0.2470588, 0, 1,
-1.676725, 0.8275368, -1.289147, 1, 0.2509804, 0, 1,
-1.669805, -0.2335858, -2.629713, 1, 0.2588235, 0, 1,
-1.667436, -0.2282859, -1.45904, 1, 0.2627451, 0, 1,
-1.64887, 0.07470661, -1.483781, 1, 0.2705882, 0, 1,
-1.617383, 0.2233672, -1.205896, 1, 0.2745098, 0, 1,
-1.613424, 0.7510846, -2.895673, 1, 0.282353, 0, 1,
-1.613154, -1.004108, -1.784089, 1, 0.2862745, 0, 1,
-1.610468, 0.9817045, -0.4974574, 1, 0.2941177, 0, 1,
-1.604262, -1.382133, -0.3746748, 1, 0.3019608, 0, 1,
-1.593345, 0.5496982, -1.901511, 1, 0.3058824, 0, 1,
-1.593057, -0.1904749, -0.862845, 1, 0.3137255, 0, 1,
-1.589417, 0.3393221, 0.5613543, 1, 0.3176471, 0, 1,
-1.588682, 1.351775, -1.171804, 1, 0.3254902, 0, 1,
-1.585321, -0.3441064, -1.399462, 1, 0.3294118, 0, 1,
-1.559998, 1.802374, -0.8640394, 1, 0.3372549, 0, 1,
-1.54918, -1.099509, -3.027312, 1, 0.3411765, 0, 1,
-1.545823, 1.695457, -0.893123, 1, 0.3490196, 0, 1,
-1.545402, 0.1549875, -2.028989, 1, 0.3529412, 0, 1,
-1.536891, -0.9537914, -1.4928, 1, 0.3607843, 0, 1,
-1.514114, 1.73868, -0.3952383, 1, 0.3647059, 0, 1,
-1.508643, -1.012755, -1.395016, 1, 0.372549, 0, 1,
-1.497968, -0.5810226, -2.667049, 1, 0.3764706, 0, 1,
-1.49755, 0.7319242, -1.71328, 1, 0.3843137, 0, 1,
-1.497234, -0.5863995, -2.362016, 1, 0.3882353, 0, 1,
-1.495965, -1.036538, -2.794231, 1, 0.3960784, 0, 1,
-1.490679, -1.26229, -2.367564, 1, 0.4039216, 0, 1,
-1.487307, 1.423147, -0.2714525, 1, 0.4078431, 0, 1,
-1.474201, 0.191404, -2.159771, 1, 0.4156863, 0, 1,
-1.473321, -0.6021524, -1.417518, 1, 0.4196078, 0, 1,
-1.456316, -0.7553203, -2.718905, 1, 0.427451, 0, 1,
-1.447125, -2.24437, -2.75089, 1, 0.4313726, 0, 1,
-1.446044, -0.1500099, -2.891108, 1, 0.4392157, 0, 1,
-1.43909, 0.7160285, 0.0423322, 1, 0.4431373, 0, 1,
-1.437501, 1.467016, -1.267462, 1, 0.4509804, 0, 1,
-1.431103, 0.1662641, -1.21065, 1, 0.454902, 0, 1,
-1.425633, -1.018345, -1.963501, 1, 0.4627451, 0, 1,
-1.424039, -1.759617, -3.610119, 1, 0.4666667, 0, 1,
-1.423537, 0.08462106, -0.8862147, 1, 0.4745098, 0, 1,
-1.422252, 0.9548355, -1.091257, 1, 0.4784314, 0, 1,
-1.410827, -0.5536058, -1.713837, 1, 0.4862745, 0, 1,
-1.41069, 2.322553, -1.306827, 1, 0.4901961, 0, 1,
-1.408979, -0.4110341, -1.081652, 1, 0.4980392, 0, 1,
-1.391863, 0.3882775, -2.547418, 1, 0.5058824, 0, 1,
-1.391558, -0.1877545, -2.026465, 1, 0.509804, 0, 1,
-1.389654, -0.9827327, -1.771006, 1, 0.5176471, 0, 1,
-1.375321, -0.2304106, -0.6229039, 1, 0.5215687, 0, 1,
-1.375271, 0.2164435, 0.1347942, 1, 0.5294118, 0, 1,
-1.372275, -1.038228, -3.756653, 1, 0.5333334, 0, 1,
-1.37049, -0.7452739, -1.028332, 1, 0.5411765, 0, 1,
-1.362908, 1.988819, 0.1827291, 1, 0.5450981, 0, 1,
-1.355824, 0.8501849, 0.06383233, 1, 0.5529412, 0, 1,
-1.350714, -2.21279, -3.806548, 1, 0.5568628, 0, 1,
-1.346006, 1.483896, -0.4102602, 1, 0.5647059, 0, 1,
-1.342343, -0.9936745, -1.213259, 1, 0.5686275, 0, 1,
-1.322052, -2.525904, -1.76805, 1, 0.5764706, 0, 1,
-1.318094, 1.208109, -1.158807, 1, 0.5803922, 0, 1,
-1.312841, -1.160834, -2.660353, 1, 0.5882353, 0, 1,
-1.310738, 0.8358999, -1.659164, 1, 0.5921569, 0, 1,
-1.299515, -1.085475, -3.544255, 1, 0.6, 0, 1,
-1.294074, 0.9749753, 0.1132682, 1, 0.6078432, 0, 1,
-1.28778, 0.3985201, -1.481974, 1, 0.6117647, 0, 1,
-1.282743, -0.4122338, -2.059703, 1, 0.6196079, 0, 1,
-1.278729, 0.2034814, -1.018995, 1, 0.6235294, 0, 1,
-1.278629, -1.01705, -2.051568, 1, 0.6313726, 0, 1,
-1.278206, -0.9928049, -2.524513, 1, 0.6352941, 0, 1,
-1.277709, 0.4355983, 0.4081067, 1, 0.6431373, 0, 1,
-1.272326, -0.2858642, -2.395546, 1, 0.6470588, 0, 1,
-1.271518, 0.2758733, -1.259902, 1, 0.654902, 0, 1,
-1.268951, -0.06405291, -1.401647, 1, 0.6588235, 0, 1,
-1.265762, -0.1527056, -2.074361, 1, 0.6666667, 0, 1,
-1.263339, 0.1310733, -1.152006, 1, 0.6705883, 0, 1,
-1.251607, 1.229898, 0.05359454, 1, 0.6784314, 0, 1,
-1.243324, 0.3477327, 0.1261624, 1, 0.682353, 0, 1,
-1.232703, 1.650143, -2.432348, 1, 0.6901961, 0, 1,
-1.228346, 0.7707402, -1.390323, 1, 0.6941177, 0, 1,
-1.22289, -2.160258, -1.76735, 1, 0.7019608, 0, 1,
-1.221738, 2.002958, -1.71368, 1, 0.7098039, 0, 1,
-1.216929, -0.508349, -1.279958, 1, 0.7137255, 0, 1,
-1.214842, -0.1561799, -1.549445, 1, 0.7215686, 0, 1,
-1.209057, 0.3298495, -0.5603058, 1, 0.7254902, 0, 1,
-1.208534, 0.6522639, -2.126791, 1, 0.7333333, 0, 1,
-1.201974, -0.08696186, -3.973971, 1, 0.7372549, 0, 1,
-1.196314, 0.0868689, -1.094583, 1, 0.7450981, 0, 1,
-1.194569, 0.8163821, -1.453132, 1, 0.7490196, 0, 1,
-1.194429, 0.699047, -1.591489, 1, 0.7568628, 0, 1,
-1.19414, 1.300035, -2.970577, 1, 0.7607843, 0, 1,
-1.19227, -2.012241, -1.183977, 1, 0.7686275, 0, 1,
-1.188034, 0.3666241, -3.199861, 1, 0.772549, 0, 1,
-1.186434, -0.1396829, -0.9389793, 1, 0.7803922, 0, 1,
-1.182528, 0.4000566, -1.431704, 1, 0.7843137, 0, 1,
-1.181272, 0.6162147, -1.38489, 1, 0.7921569, 0, 1,
-1.179548, -1.301258, -1.664759, 1, 0.7960784, 0, 1,
-1.175222, 0.2960906, -2.809041, 1, 0.8039216, 0, 1,
-1.172464, -1.417406, -1.319975, 1, 0.8117647, 0, 1,
-1.168255, -0.3832244, -1.824021, 1, 0.8156863, 0, 1,
-1.167319, 0.368571, -0.1753048, 1, 0.8235294, 0, 1,
-1.167144, -1.35732, -2.968444, 1, 0.827451, 0, 1,
-1.163236, -0.8858277, -1.893995, 1, 0.8352941, 0, 1,
-1.163135, 1.101255, -0.7689875, 1, 0.8392157, 0, 1,
-1.161633, -1.404389, -1.635713, 1, 0.8470588, 0, 1,
-1.157838, -0.5457489, -1.592043, 1, 0.8509804, 0, 1,
-1.154323, 1.06441, -2.633934, 1, 0.8588235, 0, 1,
-1.152361, 0.6759415, -1.673614, 1, 0.8627451, 0, 1,
-1.148836, -1.245081, -1.833482, 1, 0.8705882, 0, 1,
-1.133977, -1.050533, -3.042568, 1, 0.8745098, 0, 1,
-1.13168, -0.9058582, -0.8065043, 1, 0.8823529, 0, 1,
-1.111465, -0.6702929, -2.304465, 1, 0.8862745, 0, 1,
-1.104729, 0.7980875, -1.288086, 1, 0.8941177, 0, 1,
-1.09499, -1.039747, -4.836205, 1, 0.8980392, 0, 1,
-1.091516, 1.273315, -1.734549, 1, 0.9058824, 0, 1,
-1.090463, 0.0679093, -1.293279, 1, 0.9137255, 0, 1,
-1.0836, 0.05950239, 0.09409031, 1, 0.9176471, 0, 1,
-1.079575, 1.463057, -0.7631323, 1, 0.9254902, 0, 1,
-1.069736, 0.2642525, 0.7411937, 1, 0.9294118, 0, 1,
-1.067212, -0.3609942, -3.201431, 1, 0.9372549, 0, 1,
-1.064343, -0.3327652, -2.763519, 1, 0.9411765, 0, 1,
-1.06312, -1.292776, -3.041256, 1, 0.9490196, 0, 1,
-1.062194, 0.07077402, -1.979049, 1, 0.9529412, 0, 1,
-1.062012, -0.001578445, -2.068645, 1, 0.9607843, 0, 1,
-1.056186, 0.1156934, -2.336703, 1, 0.9647059, 0, 1,
-1.056041, 1.035841, -0.1342831, 1, 0.972549, 0, 1,
-1.054201, 1.435712, 0.08249778, 1, 0.9764706, 0, 1,
-1.051296, 0.06090094, -1.494151, 1, 0.9843137, 0, 1,
-1.045392, -2.19909, -2.303906, 1, 0.9882353, 0, 1,
-1.044875, -0.5811102, -5.565159, 1, 0.9960784, 0, 1,
-1.039127, -0.05531748, -1.662545, 0.9960784, 1, 0, 1,
-1.038332, 0.6413431, 1.626173, 0.9921569, 1, 0, 1,
-1.033969, -1.544442, -3.797655, 0.9843137, 1, 0, 1,
-1.029743, -1.19919, -1.752533, 0.9803922, 1, 0, 1,
-1.026986, -0.4194093, -0.6395962, 0.972549, 1, 0, 1,
-1.022278, 0.3595624, -0.4312032, 0.9686275, 1, 0, 1,
-1.016835, 1.186436, -0.8571734, 0.9607843, 1, 0, 1,
-1.012295, 1.410453, -0.3546789, 0.9568627, 1, 0, 1,
-1.010497, 0.3225653, -0.02648351, 0.9490196, 1, 0, 1,
-1.002917, -0.8949689, -2.885, 0.945098, 1, 0, 1,
-0.9909811, 1.526734, -1.728573, 0.9372549, 1, 0, 1,
-0.9906793, -0.10128, -1.027746, 0.9333333, 1, 0, 1,
-0.9874836, -0.7985095, -2.814155, 0.9254902, 1, 0, 1,
-0.9754416, -0.6236899, -1.854305, 0.9215686, 1, 0, 1,
-0.974688, 0.7021155, 0.7067283, 0.9137255, 1, 0, 1,
-0.974181, 0.5654197, -0.8619035, 0.9098039, 1, 0, 1,
-0.9709612, -0.005621079, -1.675257, 0.9019608, 1, 0, 1,
-0.9701714, -0.4023803, -2.618757, 0.8941177, 1, 0, 1,
-0.9678025, -0.8823959, -1.823055, 0.8901961, 1, 0, 1,
-0.9674344, -0.2469503, -3.479525, 0.8823529, 1, 0, 1,
-0.9669051, -2.412696, -3.625063, 0.8784314, 1, 0, 1,
-0.966726, 0.1117279, -2.110337, 0.8705882, 1, 0, 1,
-0.9623773, 0.948853, -1.460848, 0.8666667, 1, 0, 1,
-0.962154, 1.660005, -0.8705021, 0.8588235, 1, 0, 1,
-0.9581167, -0.9755193, -2.996211, 0.854902, 1, 0, 1,
-0.9453138, 0.5337738, -1.648753, 0.8470588, 1, 0, 1,
-0.9438915, -0.1172807, -2.37143, 0.8431373, 1, 0, 1,
-0.9434534, -1.374914, -4.158858, 0.8352941, 1, 0, 1,
-0.9401955, 0.5158271, 0.5538116, 0.8313726, 1, 0, 1,
-0.937301, -2.52216, -4.088414, 0.8235294, 1, 0, 1,
-0.9329876, 1.247207, 0.8128244, 0.8196079, 1, 0, 1,
-0.9310346, -1.02067, -2.293797, 0.8117647, 1, 0, 1,
-0.9277777, -0.4441262, -3.113506, 0.8078431, 1, 0, 1,
-0.9244912, 0.3957532, -0.718459, 0.8, 1, 0, 1,
-0.9203959, 1.547737, 0.3796467, 0.7921569, 1, 0, 1,
-0.9181781, 0.5947943, -1.131851, 0.7882353, 1, 0, 1,
-0.9144909, -0.9964608, -2.200757, 0.7803922, 1, 0, 1,
-0.9113514, 0.2906412, -1.508593, 0.7764706, 1, 0, 1,
-0.9106258, -2.031259, -2.231946, 0.7686275, 1, 0, 1,
-0.9016127, -1.116533, -1.66956, 0.7647059, 1, 0, 1,
-0.9010193, -0.5407495, -2.312986, 0.7568628, 1, 0, 1,
-0.8975961, -0.8857145, -2.313508, 0.7529412, 1, 0, 1,
-0.8972942, -0.3904943, -1.2876, 0.7450981, 1, 0, 1,
-0.8968078, 0.4831309, -2.218597, 0.7411765, 1, 0, 1,
-0.8951428, 0.7084649, -1.667622, 0.7333333, 1, 0, 1,
-0.8939722, -0.04956183, 0.5614963, 0.7294118, 1, 0, 1,
-0.8930648, 0.09321843, -0.7097886, 0.7215686, 1, 0, 1,
-0.8916071, 0.06571163, 0.1188581, 0.7176471, 1, 0, 1,
-0.8849208, 1.162801, -2.254156, 0.7098039, 1, 0, 1,
-0.8837761, -0.3568647, -2.005094, 0.7058824, 1, 0, 1,
-0.8757297, -1.501717, -3.067213, 0.6980392, 1, 0, 1,
-0.8700153, -1.459756, -2.410888, 0.6901961, 1, 0, 1,
-0.8662391, 0.04645581, -1.669232, 0.6862745, 1, 0, 1,
-0.8577594, -0.1950987, -2.096846, 0.6784314, 1, 0, 1,
-0.8568509, 0.3292237, 0.05856168, 0.6745098, 1, 0, 1,
-0.8556835, 0.5771376, 0.8202578, 0.6666667, 1, 0, 1,
-0.8545347, 0.0928231, -2.682161, 0.6627451, 1, 0, 1,
-0.8439106, -0.8226983, -2.097279, 0.654902, 1, 0, 1,
-0.8241532, 0.8256781, 1.123962, 0.6509804, 1, 0, 1,
-0.8237572, -0.6353459, -0.8918055, 0.6431373, 1, 0, 1,
-0.8220062, 1.058354, -2.667069, 0.6392157, 1, 0, 1,
-0.8202943, 0.2961398, -2.137246, 0.6313726, 1, 0, 1,
-0.8165408, 0.3952211, -2.226976, 0.627451, 1, 0, 1,
-0.8133228, -1.496531, -4.148109, 0.6196079, 1, 0, 1,
-0.8126115, 1.415189, 0.7985739, 0.6156863, 1, 0, 1,
-0.8125668, 2.115454, -0.2365392, 0.6078432, 1, 0, 1,
-0.8123349, -1.592762, -3.735771, 0.6039216, 1, 0, 1,
-0.8100718, -0.5097919, -2.331896, 0.5960785, 1, 0, 1,
-0.8089824, -0.01491366, -0.9112783, 0.5882353, 1, 0, 1,
-0.8031151, 1.212908, 0.6850775, 0.5843138, 1, 0, 1,
-0.8014365, -1.030356, -3.595909, 0.5764706, 1, 0, 1,
-0.8005235, 0.4777942, 0.544518, 0.572549, 1, 0, 1,
-0.8004981, 0.7165912, -0.4922599, 0.5647059, 1, 0, 1,
-0.7969574, 0.839529, -1.453185, 0.5607843, 1, 0, 1,
-0.7946774, -0.694096, -2.571776, 0.5529412, 1, 0, 1,
-0.7913554, 0.246574, -2.132927, 0.5490196, 1, 0, 1,
-0.7880887, 0.01201433, -1.029574, 0.5411765, 1, 0, 1,
-0.7869478, 0.2091857, -0.03715401, 0.5372549, 1, 0, 1,
-0.7852911, 1.345633, -1.596658, 0.5294118, 1, 0, 1,
-0.7817676, -1.197632, -2.586996, 0.5254902, 1, 0, 1,
-0.7781622, -1.125068, -2.485867, 0.5176471, 1, 0, 1,
-0.7762539, 0.8945606, -0.2131434, 0.5137255, 1, 0, 1,
-0.7761632, -0.3255597, -1.06721, 0.5058824, 1, 0, 1,
-0.7710195, 1.914482, -0.1445297, 0.5019608, 1, 0, 1,
-0.7696015, -1.165549, -2.364054, 0.4941176, 1, 0, 1,
-0.7683777, -0.2359513, -1.537743, 0.4862745, 1, 0, 1,
-0.7682244, -1.75219, -3.611017, 0.4823529, 1, 0, 1,
-0.7677162, 0.489985, -0.6038588, 0.4745098, 1, 0, 1,
-0.7607078, 0.02943157, -1.992356, 0.4705882, 1, 0, 1,
-0.7538953, -1.053537, -2.190599, 0.4627451, 1, 0, 1,
-0.7505414, 1.531, -1.491814, 0.4588235, 1, 0, 1,
-0.7491974, -0.07117548, -1.83647, 0.4509804, 1, 0, 1,
-0.7443101, 0.6509454, -1.52985, 0.4470588, 1, 0, 1,
-0.7392411, 1.537835, 0.6395009, 0.4392157, 1, 0, 1,
-0.7385892, 0.4894235, -1.456546, 0.4352941, 1, 0, 1,
-0.7337361, 1.030914, -0.05304994, 0.427451, 1, 0, 1,
-0.7226289, 0.6932997, -1.249068, 0.4235294, 1, 0, 1,
-0.7199129, -1.775045, -1.91223, 0.4156863, 1, 0, 1,
-0.7162135, 1.055675, 1.081871, 0.4117647, 1, 0, 1,
-0.713909, -0.3659624, -1.64193, 0.4039216, 1, 0, 1,
-0.710883, 1.26225, -1.638565, 0.3960784, 1, 0, 1,
-0.7100703, -0.217822, -2.64468, 0.3921569, 1, 0, 1,
-0.7071995, 0.2345812, 0.6347232, 0.3843137, 1, 0, 1,
-0.6844925, -0.7028562, -3.246611, 0.3803922, 1, 0, 1,
-0.6774397, -0.8975269, -2.810551, 0.372549, 1, 0, 1,
-0.6760194, 1.415837, -0.06491795, 0.3686275, 1, 0, 1,
-0.6755885, -1.03314, -1.19672, 0.3607843, 1, 0, 1,
-0.6743472, 0.3081481, -0.5939509, 0.3568628, 1, 0, 1,
-0.6736487, -0.2997339, -3.136842, 0.3490196, 1, 0, 1,
-0.669263, 0.02603502, -2.233811, 0.345098, 1, 0, 1,
-0.6635079, 2.10135, -0.04668718, 0.3372549, 1, 0, 1,
-0.6567967, -1.488539, -2.42015, 0.3333333, 1, 0, 1,
-0.6566997, -1.001945, -3.239114, 0.3254902, 1, 0, 1,
-0.65446, 1.827854, -0.9015445, 0.3215686, 1, 0, 1,
-0.6523916, 0.0228504, -1.510232, 0.3137255, 1, 0, 1,
-0.6462939, 2.155398, -2.056345, 0.3098039, 1, 0, 1,
-0.6440061, -0.3342274, -2.752169, 0.3019608, 1, 0, 1,
-0.6435001, 2.789103, -0.9385799, 0.2941177, 1, 0, 1,
-0.6431649, -1.693259, -2.774791, 0.2901961, 1, 0, 1,
-0.6431357, 0.001711965, -2.199515, 0.282353, 1, 0, 1,
-0.6403208, -0.07722435, 0.2979739, 0.2784314, 1, 0, 1,
-0.6381099, -0.6162819, -1.363885, 0.2705882, 1, 0, 1,
-0.6340864, -0.5781323, -1.758052, 0.2666667, 1, 0, 1,
-0.6332639, 0.02282675, -0.1694946, 0.2588235, 1, 0, 1,
-0.6320568, 1.231909, -0.5863655, 0.254902, 1, 0, 1,
-0.6278835, 1.58212, 0.4706803, 0.2470588, 1, 0, 1,
-0.6278764, 0.7989876, -1.122103, 0.2431373, 1, 0, 1,
-0.6261294, -0.3806953, -0.8525233, 0.2352941, 1, 0, 1,
-0.6235813, 0.03723259, -0.9071332, 0.2313726, 1, 0, 1,
-0.6215022, 1.298013, -0.8972201, 0.2235294, 1, 0, 1,
-0.6150531, 1.429211, -0.1191404, 0.2196078, 1, 0, 1,
-0.6147414, -1.019098, -2.749031, 0.2117647, 1, 0, 1,
-0.6134611, -0.6660477, -2.9927, 0.2078431, 1, 0, 1,
-0.6121677, -0.4522074, -2.451639, 0.2, 1, 0, 1,
-0.6119236, -1.249344, -3.539091, 0.1921569, 1, 0, 1,
-0.6112444, -0.6216173, -1.75898, 0.1882353, 1, 0, 1,
-0.610611, -1.810308, -3.381936, 0.1803922, 1, 0, 1,
-0.6075458, -1.173863, -2.085727, 0.1764706, 1, 0, 1,
-0.6003563, -0.159345, -2.949957, 0.1686275, 1, 0, 1,
-0.5986254, 0.6199356, -1.234957, 0.1647059, 1, 0, 1,
-0.5975209, -1.046179, -2.711461, 0.1568628, 1, 0, 1,
-0.5961197, -1.038446, -3.050558, 0.1529412, 1, 0, 1,
-0.5837548, -0.7796023, -2.887019, 0.145098, 1, 0, 1,
-0.5803489, -0.9218042, -2.063564, 0.1411765, 1, 0, 1,
-0.5718802, -0.04431556, -2.759627, 0.1333333, 1, 0, 1,
-0.5702139, 0.3853225, -2.183668, 0.1294118, 1, 0, 1,
-0.5633836, 1.730456, -0.6108505, 0.1215686, 1, 0, 1,
-0.5628014, 0.1223343, -0.4255001, 0.1176471, 1, 0, 1,
-0.5622665, -0.1206775, -0.004638717, 0.1098039, 1, 0, 1,
-0.5596074, 0.1913818, -1.222213, 0.1058824, 1, 0, 1,
-0.55942, 0.5484579, -1.808954, 0.09803922, 1, 0, 1,
-0.5573159, 0.9444963, 0.4934586, 0.09019608, 1, 0, 1,
-0.5377908, 0.3230371, -0.368656, 0.08627451, 1, 0, 1,
-0.5340365, 0.3466197, -1.13535, 0.07843138, 1, 0, 1,
-0.5236473, 0.2474987, -1.502213, 0.07450981, 1, 0, 1,
-0.5209862, 0.9766189, -0.4098749, 0.06666667, 1, 0, 1,
-0.5189267, 1.378248, -1.458147, 0.0627451, 1, 0, 1,
-0.5181534, -0.1470753, -2.132909, 0.05490196, 1, 0, 1,
-0.5181026, -0.8142279, -3.92766, 0.05098039, 1, 0, 1,
-0.5149569, 0.3154223, -0.81826, 0.04313726, 1, 0, 1,
-0.5142431, -1.329491, -2.969009, 0.03921569, 1, 0, 1,
-0.5107536, 1.161681, -1.732545, 0.03137255, 1, 0, 1,
-0.5105401, -0.7959996, -1.108404, 0.02745098, 1, 0, 1,
-0.505941, 0.006287477, -2.898722, 0.01960784, 1, 0, 1,
-0.504792, -2.150138, -2.417707, 0.01568628, 1, 0, 1,
-0.5041086, 0.9287678, -1.381171, 0.007843138, 1, 0, 1,
-0.4904408, -0.1696355, -0.3465903, 0.003921569, 1, 0, 1,
-0.4887217, 0.5930541, -1.05867, 0, 1, 0.003921569, 1,
-0.4835522, -1.119297, -3.017597, 0, 1, 0.01176471, 1,
-0.4777601, 0.1235, -0.4871566, 0, 1, 0.01568628, 1,
-0.4753821, -0.37473, -3.336535, 0, 1, 0.02352941, 1,
-0.4664805, 1.098908, 1.510054, 0, 1, 0.02745098, 1,
-0.4663608, -0.3291177, -3.052948, 0, 1, 0.03529412, 1,
-0.4638066, 0.009005234, 0.3154705, 0, 1, 0.03921569, 1,
-0.4584658, -0.5665707, -1.96363, 0, 1, 0.04705882, 1,
-0.45744, -0.3020295, -1.458689, 0, 1, 0.05098039, 1,
-0.450533, 0.02384454, -2.781315, 0, 1, 0.05882353, 1,
-0.4500208, 0.2805122, -0.3868111, 0, 1, 0.0627451, 1,
-0.4474075, -0.7128008, -2.880408, 0, 1, 0.07058824, 1,
-0.446943, 1.845904, -1.241576, 0, 1, 0.07450981, 1,
-0.4450309, -0.453551, -4.195786, 0, 1, 0.08235294, 1,
-0.4423823, -0.03768103, -2.709568, 0, 1, 0.08627451, 1,
-0.4411815, -1.087422, -2.001868, 0, 1, 0.09411765, 1,
-0.4408507, 0.8536588, 1.118839, 0, 1, 0.1019608, 1,
-0.437629, -0.5059312, -3.362821, 0, 1, 0.1058824, 1,
-0.4375024, 1.244998, 0.5488985, 0, 1, 0.1137255, 1,
-0.4323495, -0.8540525, -3.089529, 0, 1, 0.1176471, 1,
-0.4322319, -0.6364672, -2.519928, 0, 1, 0.1254902, 1,
-0.4300483, 0.6181433, -0.6983899, 0, 1, 0.1294118, 1,
-0.4268427, 2.061454, -0.1003509, 0, 1, 0.1372549, 1,
-0.4255655, 0.4201579, -1.43826, 0, 1, 0.1411765, 1,
-0.4230627, 0.6838201, -0.2242733, 0, 1, 0.1490196, 1,
-0.4226639, -0.5970181, -2.263515, 0, 1, 0.1529412, 1,
-0.4225455, -0.2344715, -0.6719941, 0, 1, 0.1607843, 1,
-0.417642, -0.8150056, -4.206305, 0, 1, 0.1647059, 1,
-0.4152024, 0.4502993, -1.615391, 0, 1, 0.172549, 1,
-0.4145256, -0.4317415, -2.920378, 0, 1, 0.1764706, 1,
-0.4120864, -0.08904438, -3.00815, 0, 1, 0.1843137, 1,
-0.4119121, 1.866959, -1.351189, 0, 1, 0.1882353, 1,
-0.4117924, -1.075377, -4.226745, 0, 1, 0.1960784, 1,
-0.4112156, 0.4706208, -2.686052, 0, 1, 0.2039216, 1,
-0.4106984, 1.801466, 0.7351124, 0, 1, 0.2078431, 1,
-0.4097553, -1.847426, -2.915326, 0, 1, 0.2156863, 1,
-0.409096, -0.0004102558, -1.428783, 0, 1, 0.2196078, 1,
-0.3989097, -0.796802, -2.913757, 0, 1, 0.227451, 1,
-0.3974974, 0.990501, 0.05823137, 0, 1, 0.2313726, 1,
-0.3943307, -0.7034007, -3.357878, 0, 1, 0.2392157, 1,
-0.3921768, -1.402859, -3.041758, 0, 1, 0.2431373, 1,
-0.3892128, -0.9261106, -4.298193, 0, 1, 0.2509804, 1,
-0.3888621, -0.5141652, -2.504198, 0, 1, 0.254902, 1,
-0.3876025, -0.7267523, -2.987897, 0, 1, 0.2627451, 1,
-0.3866626, 0.931526, -1.360253, 0, 1, 0.2666667, 1,
-0.3834468, -0.1960356, -0.8432353, 0, 1, 0.2745098, 1,
-0.3797993, 0.3680253, 0.02164473, 0, 1, 0.2784314, 1,
-0.374207, 1.265973, 1.122706, 0, 1, 0.2862745, 1,
-0.3722788, 0.9357014, -0.5806018, 0, 1, 0.2901961, 1,
-0.3702252, 0.1979799, -1.681645, 0, 1, 0.2980392, 1,
-0.367192, 0.276243, -0.7171124, 0, 1, 0.3058824, 1,
-0.3671852, -1.241237, -3.623981, 0, 1, 0.3098039, 1,
-0.3667285, 0.1027427, -1.100776, 0, 1, 0.3176471, 1,
-0.3638806, 0.3151899, -2.221684, 0, 1, 0.3215686, 1,
-0.3540306, -0.8997032, -2.953287, 0, 1, 0.3294118, 1,
-0.3421551, -0.3828354, -3.349635, 0, 1, 0.3333333, 1,
-0.3416533, 0.5472122, -0.260715, 0, 1, 0.3411765, 1,
-0.3404658, 2.579194, -0.9808055, 0, 1, 0.345098, 1,
-0.3361288, -0.9048781, -1.513687, 0, 1, 0.3529412, 1,
-0.3343213, 0.01521042, -0.7337392, 0, 1, 0.3568628, 1,
-0.333952, 0.2681155, -1.830718, 0, 1, 0.3647059, 1,
-0.3265134, 0.4485401, -1.399842, 0, 1, 0.3686275, 1,
-0.3255514, -1.033152, -2.233789, 0, 1, 0.3764706, 1,
-0.3254145, -0.9336945, -0.918679, 0, 1, 0.3803922, 1,
-0.3182596, 1.55261, -1.564962, 0, 1, 0.3882353, 1,
-0.3166606, 0.4148141, 0.2302265, 0, 1, 0.3921569, 1,
-0.2994241, 0.7317011, -2.168544, 0, 1, 0.4, 1,
-0.292816, -1.074188, -2.94132, 0, 1, 0.4078431, 1,
-0.2919348, -0.3098687, -2.917212, 0, 1, 0.4117647, 1,
-0.290016, 1.134229, 0.6970251, 0, 1, 0.4196078, 1,
-0.2895437, -0.9796492, -0.2120654, 0, 1, 0.4235294, 1,
-0.2883817, -1.203574, -2.848394, 0, 1, 0.4313726, 1,
-0.2848013, -0.7441346, -1.679961, 0, 1, 0.4352941, 1,
-0.2846399, -0.8129763, -3.653656, 0, 1, 0.4431373, 1,
-0.2778871, -0.2822875, -1.593877, 0, 1, 0.4470588, 1,
-0.2752773, 1.53602, -0.9612175, 0, 1, 0.454902, 1,
-0.2738026, 0.1809736, -1.367515, 0, 1, 0.4588235, 1,
-0.2701793, 0.9299846, -0.8999333, 0, 1, 0.4666667, 1,
-0.2665948, 0.03407192, -2.306286, 0, 1, 0.4705882, 1,
-0.2651373, -0.8806357, -2.057915, 0, 1, 0.4784314, 1,
-0.2609158, -0.3647996, -3.301125, 0, 1, 0.4823529, 1,
-0.2565628, -0.7877888, -1.431685, 0, 1, 0.4901961, 1,
-0.2539237, -0.2898855, -1.12355, 0, 1, 0.4941176, 1,
-0.2498324, 1.023966, -0.2722991, 0, 1, 0.5019608, 1,
-0.2474149, 1.474824, 0.6503505, 0, 1, 0.509804, 1,
-0.2446445, -0.1291074, -1.24926, 0, 1, 0.5137255, 1,
-0.243496, 1.905793, -0.7929595, 0, 1, 0.5215687, 1,
-0.2427349, 0.06739794, -0.8741677, 0, 1, 0.5254902, 1,
-0.2414824, 0.6442706, -0.2841303, 0, 1, 0.5333334, 1,
-0.2314821, 1.376628, 1.479214, 0, 1, 0.5372549, 1,
-0.2280854, -0.7033542, -3.340626, 0, 1, 0.5450981, 1,
-0.227601, -0.3546436, -3.272485, 0, 1, 0.5490196, 1,
-0.2264914, 0.361769, 0.1741309, 0, 1, 0.5568628, 1,
-0.2254794, -1.609827, -0.4198943, 0, 1, 0.5607843, 1,
-0.224593, 0.5830883, -0.4467495, 0, 1, 0.5686275, 1,
-0.2195661, -0.9176761, -1.265071, 0, 1, 0.572549, 1,
-0.2161094, -0.06984675, -1.067425, 0, 1, 0.5803922, 1,
-0.2095905, 0.4417806, -0.8967579, 0, 1, 0.5843138, 1,
-0.2068141, 2.536645, 1.056408, 0, 1, 0.5921569, 1,
-0.2030669, -1.375908, -2.062583, 0, 1, 0.5960785, 1,
-0.2002479, 1.520232, -0.04956893, 0, 1, 0.6039216, 1,
-0.1977044, 0.1507877, -2.041463, 0, 1, 0.6117647, 1,
-0.1962867, 0.7833636, -0.1043879, 0, 1, 0.6156863, 1,
-0.1955885, 1.094611, 0.2305461, 0, 1, 0.6235294, 1,
-0.1930854, -1.937591, -3.469788, 0, 1, 0.627451, 1,
-0.1915255, 0.6349882, -1.486859, 0, 1, 0.6352941, 1,
-0.189903, -1.272965, -3.625379, 0, 1, 0.6392157, 1,
-0.1841999, 1.129963, 0.02388685, 0, 1, 0.6470588, 1,
-0.1731273, -1.914135, -2.512617, 0, 1, 0.6509804, 1,
-0.1704228, -1.127619, -3.950038, 0, 1, 0.6588235, 1,
-0.1684004, -0.3483329, -3.471189, 0, 1, 0.6627451, 1,
-0.1660637, -0.7133968, -2.403454, 0, 1, 0.6705883, 1,
-0.1659286, -1.646057, -2.598938, 0, 1, 0.6745098, 1,
-0.1637886, 0.4416511, 1.931989, 0, 1, 0.682353, 1,
-0.1635863, 0.8593186, -1.607725, 0, 1, 0.6862745, 1,
-0.1600791, -1.220374, -4.450515, 0, 1, 0.6941177, 1,
-0.1540831, -1.41987, -3.738899, 0, 1, 0.7019608, 1,
-0.1508066, -1.849174, -2.301409, 0, 1, 0.7058824, 1,
-0.1502681, -2.009314, -3.440736, 0, 1, 0.7137255, 1,
-0.1485376, 0.9306611, -2.38106, 0, 1, 0.7176471, 1,
-0.1477294, 0.2554326, -0.4289075, 0, 1, 0.7254902, 1,
-0.141202, 0.7720463, -0.1275181, 0, 1, 0.7294118, 1,
-0.1348946, 0.1407921, -1.735323, 0, 1, 0.7372549, 1,
-0.1347281, -0.7263645, -1.114678, 0, 1, 0.7411765, 1,
-0.1339172, -0.6107812, -3.972851, 0, 1, 0.7490196, 1,
-0.1319643, -1.476093, -2.343723, 0, 1, 0.7529412, 1,
-0.1291045, -0.2808267, -3.025998, 0, 1, 0.7607843, 1,
-0.1287536, 0.09893052, -0.4425188, 0, 1, 0.7647059, 1,
-0.1276839, -0.4423322, -3.107383, 0, 1, 0.772549, 1,
-0.1270496, 2.17117, 0.3528718, 0, 1, 0.7764706, 1,
-0.1249518, 1.044804, 1.055735, 0, 1, 0.7843137, 1,
-0.1246803, -2.033831, -2.609616, 0, 1, 0.7882353, 1,
-0.1202324, 1.047416, -0.3942937, 0, 1, 0.7960784, 1,
-0.1191674, -1.040415, -0.466491, 0, 1, 0.8039216, 1,
-0.1185799, -0.293035, -2.002528, 0, 1, 0.8078431, 1,
-0.1157763, -0.4898453, -1.607302, 0, 1, 0.8156863, 1,
-0.1141008, 1.319227, 0.9255487, 0, 1, 0.8196079, 1,
-0.1140756, 1.953698, -0.2850888, 0, 1, 0.827451, 1,
-0.1126788, -1.080941, -4.80409, 0, 1, 0.8313726, 1,
-0.1094134, 0.3426246, -2.428895, 0, 1, 0.8392157, 1,
-0.1076841, -0.3642278, -2.04186, 0, 1, 0.8431373, 1,
-0.1062536, 0.01040006, -3.228487, 0, 1, 0.8509804, 1,
-0.1045759, 0.850593, -0.8404199, 0, 1, 0.854902, 1,
-0.1034563, 0.7036653, -0.08999842, 0, 1, 0.8627451, 1,
-0.1031161, -0.5476931, -4.899954, 0, 1, 0.8666667, 1,
-0.1030218, 0.9970706, -1.195794, 0, 1, 0.8745098, 1,
-0.102793, 0.6422135, -0.2928718, 0, 1, 0.8784314, 1,
-0.09898809, -0.4323564, -1.393639, 0, 1, 0.8862745, 1,
-0.09097185, -2.296026, -3.926388, 0, 1, 0.8901961, 1,
-0.08828754, -0.8184048, -3.79101, 0, 1, 0.8980392, 1,
-0.08773603, 0.102183, -0.442922, 0, 1, 0.9058824, 1,
-0.08666733, 0.9178768, 0.7119767, 0, 1, 0.9098039, 1,
-0.08579264, -1.203733, -1.397876, 0, 1, 0.9176471, 1,
-0.08491688, -0.8901184, -1.112051, 0, 1, 0.9215686, 1,
-0.08330225, -0.1675754, -4.400645, 0, 1, 0.9294118, 1,
-0.08068995, -0.2812317, -3.763687, 0, 1, 0.9333333, 1,
-0.07865187, 0.1666116, 0.7921027, 0, 1, 0.9411765, 1,
-0.07529915, -0.3499397, -1.721997, 0, 1, 0.945098, 1,
-0.07426016, -0.4251621, -1.616731, 0, 1, 0.9529412, 1,
-0.07338738, -0.1259304, -3.668163, 0, 1, 0.9568627, 1,
-0.07220927, 0.2507384, 0.2377962, 0, 1, 0.9647059, 1,
-0.06898809, 0.1095325, -0.724201, 0, 1, 0.9686275, 1,
-0.06558074, 1.104846, -0.477733, 0, 1, 0.9764706, 1,
-0.06515398, -0.3058329, -1.292024, 0, 1, 0.9803922, 1,
-0.05891993, -1.880877, -3.351433, 0, 1, 0.9882353, 1,
-0.05305993, 0.1824078, 0.1075082, 0, 1, 0.9921569, 1,
-0.05283074, 0.8590821, 0.4535109, 0, 1, 1, 1,
-0.04518355, -2.085961, -1.883316, 0, 0.9921569, 1, 1,
-0.04489886, -0.2904535, -3.967579, 0, 0.9882353, 1, 1,
-0.04389508, -2.170456, -3.376081, 0, 0.9803922, 1, 1,
-0.04383764, -0.1873229, -3.193027, 0, 0.9764706, 1, 1,
-0.0414044, 1.567929, -0.272676, 0, 0.9686275, 1, 1,
-0.04010123, -0.7526932, -3.233758, 0, 0.9647059, 1, 1,
-0.03957177, 0.0108887, -3.538453, 0, 0.9568627, 1, 1,
-0.03889782, 0.4739705, -0.6381602, 0, 0.9529412, 1, 1,
-0.03666178, 1.753642, 0.3829945, 0, 0.945098, 1, 1,
-0.03586726, -0.8756735, -3.250697, 0, 0.9411765, 1, 1,
-0.03493095, -0.4823739, -3.627885, 0, 0.9333333, 1, 1,
-0.03436768, -1.9222, -2.954381, 0, 0.9294118, 1, 1,
-0.0343676, 0.9291997, 0.2005798, 0, 0.9215686, 1, 1,
-0.03110408, 0.7731655, -1.046971, 0, 0.9176471, 1, 1,
-0.02579117, -1.252941, -1.434348, 0, 0.9098039, 1, 1,
-0.02199754, 0.7322307, -0.282631, 0, 0.9058824, 1, 1,
-0.02195766, 1.602674, -0.3276513, 0, 0.8980392, 1, 1,
-0.02137462, -0.5200303, -2.227567, 0, 0.8901961, 1, 1,
-0.021097, -0.2465738, -3.355361, 0, 0.8862745, 1, 1,
-0.01961973, -1.556682, -3.561503, 0, 0.8784314, 1, 1,
-0.01874973, 0.6486265, -0.1797013, 0, 0.8745098, 1, 1,
-0.01808168, -2.332414, -2.763484, 0, 0.8666667, 1, 1,
-0.01714518, 0.0568692, -2.754963, 0, 0.8627451, 1, 1,
-0.01430793, -0.2581042, -3.550562, 0, 0.854902, 1, 1,
-0.008330278, 0.261142, 0.6316755, 0, 0.8509804, 1, 1,
-0.007754921, -0.6347682, -1.589517, 0, 0.8431373, 1, 1,
0.0006476931, 0.3920423, -0.3389227, 0, 0.8392157, 1, 1,
0.002345286, -0.809541, 2.996464, 0, 0.8313726, 1, 1,
0.005705197, 0.6028083, 1.03327, 0, 0.827451, 1, 1,
0.007328132, -0.3192211, 3.214418, 0, 0.8196079, 1, 1,
0.01327112, 0.1569583, 0.4311325, 0, 0.8156863, 1, 1,
0.01705482, 1.41152, -0.9982085, 0, 0.8078431, 1, 1,
0.03035742, 1.380221, -0.8995253, 0, 0.8039216, 1, 1,
0.0336339, 0.4859231, -0.6496179, 0, 0.7960784, 1, 1,
0.03602453, -0.928044, 1.439353, 0, 0.7882353, 1, 1,
0.03966738, 0.2209755, 1.141484, 0, 0.7843137, 1, 1,
0.04128096, -0.6303663, 3.602311, 0, 0.7764706, 1, 1,
0.04261115, 0.5425935, -1.32288, 0, 0.772549, 1, 1,
0.04759018, -0.8893093, 3.746107, 0, 0.7647059, 1, 1,
0.04819357, 0.3445669, 0.1233812, 0, 0.7607843, 1, 1,
0.04823193, 0.5095741, 1.071489, 0, 0.7529412, 1, 1,
0.04853653, 0.4268044, 0.4345748, 0, 0.7490196, 1, 1,
0.05037025, 0.5934138, -0.6426447, 0, 0.7411765, 1, 1,
0.05393206, -2.387505, 4.202587, 0, 0.7372549, 1, 1,
0.05715461, -0.4137653, 1.891042, 0, 0.7294118, 1, 1,
0.05852583, 2.40483, -0.9356863, 0, 0.7254902, 1, 1,
0.06033752, 0.5673815, 0.4272076, 0, 0.7176471, 1, 1,
0.06110267, 1.219055, 1.220566, 0, 0.7137255, 1, 1,
0.06125503, 1.24985, 0.7389359, 0, 0.7058824, 1, 1,
0.06465799, -0.4900423, 4.083257, 0, 0.6980392, 1, 1,
0.06674349, 2.116514, -0.5147108, 0, 0.6941177, 1, 1,
0.06909765, -0.1159666, 2.608924, 0, 0.6862745, 1, 1,
0.07038676, 0.7177905, -0.4232256, 0, 0.682353, 1, 1,
0.07138214, -1.681287, 3.969388, 0, 0.6745098, 1, 1,
0.07252045, -1.927085, 3.486057, 0, 0.6705883, 1, 1,
0.07674028, -1.516388, 3.09561, 0, 0.6627451, 1, 1,
0.07937545, 2.902039, -1.313783, 0, 0.6588235, 1, 1,
0.08909867, -0.1849944, 4.486395, 0, 0.6509804, 1, 1,
0.09023041, 0.453523, -1.129495, 0, 0.6470588, 1, 1,
0.09392548, -1.363978, 4.406601, 0, 0.6392157, 1, 1,
0.09502986, -1.654302, 2.794752, 0, 0.6352941, 1, 1,
0.09872209, -3.17802, 2.876602, 0, 0.627451, 1, 1,
0.09880068, -0.2115172, 4.123254, 0, 0.6235294, 1, 1,
0.09907144, -0.2639461, 2.048257, 0, 0.6156863, 1, 1,
0.1024264, 1.052857, 0.9862808, 0, 0.6117647, 1, 1,
0.102475, 0.7747011, 0.303997, 0, 0.6039216, 1, 1,
0.1029768, -0.2429803, 4.721349, 0, 0.5960785, 1, 1,
0.1115698, -3.021544, 2.54878, 0, 0.5921569, 1, 1,
0.1135737, 0.5962777, 0.04161347, 0, 0.5843138, 1, 1,
0.1188401, -0.4456044, 2.872919, 0, 0.5803922, 1, 1,
0.1223903, 0.7840923, 0.9595252, 0, 0.572549, 1, 1,
0.125804, -0.9806166, 2.047485, 0, 0.5686275, 1, 1,
0.127997, 0.6651137, -0.09658396, 0, 0.5607843, 1, 1,
0.1308206, 0.08387764, 1.727584, 0, 0.5568628, 1, 1,
0.1317603, 0.5075899, -0.4352684, 0, 0.5490196, 1, 1,
0.1342524, 0.6593673, 0.424379, 0, 0.5450981, 1, 1,
0.1343826, -0.2729741, 1.98864, 0, 0.5372549, 1, 1,
0.1346226, 0.1538016, -1.204685, 0, 0.5333334, 1, 1,
0.1407327, -0.5202328, 3.067599, 0, 0.5254902, 1, 1,
0.1458277, 0.2408285, 1.232548, 0, 0.5215687, 1, 1,
0.1461431, -1.469029, 2.80108, 0, 0.5137255, 1, 1,
0.1511041, 0.5803774, 0.4519289, 0, 0.509804, 1, 1,
0.1517446, 0.7921208, -0.8414126, 0, 0.5019608, 1, 1,
0.1547243, -0.201977, 3.490887, 0, 0.4941176, 1, 1,
0.1598853, -0.906044, 2.980467, 0, 0.4901961, 1, 1,
0.1607343, -0.8092895, 2.860001, 0, 0.4823529, 1, 1,
0.1686665, -0.1406944, 2.394029, 0, 0.4784314, 1, 1,
0.1691676, 0.9105921, 0.1859996, 0, 0.4705882, 1, 1,
0.1725894, -0.09728578, 1.59798, 0, 0.4666667, 1, 1,
0.1728166, 0.4090735, -0.5202354, 0, 0.4588235, 1, 1,
0.173939, -0.8871308, 4.380041, 0, 0.454902, 1, 1,
0.1769009, -0.465728, 1.404803, 0, 0.4470588, 1, 1,
0.178601, -0.5836162, 1.40513, 0, 0.4431373, 1, 1,
0.1860102, -0.6563256, 1.940039, 0, 0.4352941, 1, 1,
0.1867189, -0.5055563, 3.282007, 0, 0.4313726, 1, 1,
0.1872594, 1.028012, 0.7588232, 0, 0.4235294, 1, 1,
0.1926448, -0.4522817, 3.659547, 0, 0.4196078, 1, 1,
0.1927145, 1.819059, -0.1300245, 0, 0.4117647, 1, 1,
0.1935009, -1.660528, 3.677514, 0, 0.4078431, 1, 1,
0.197286, 1.297861, -0.4555875, 0, 0.4, 1, 1,
0.2037973, -0.627593, 1.887143, 0, 0.3921569, 1, 1,
0.2043092, -0.5246701, 2.295371, 0, 0.3882353, 1, 1,
0.2077134, 1.22595, -0.7214121, 0, 0.3803922, 1, 1,
0.2092177, -0.3578589, 2.894162, 0, 0.3764706, 1, 1,
0.2100758, 1.069943, 0.6772174, 0, 0.3686275, 1, 1,
0.2109901, -0.9447062, 1.602848, 0, 0.3647059, 1, 1,
0.2128601, 0.3394848, 0.1078305, 0, 0.3568628, 1, 1,
0.2142945, 1.160681, 1.147981, 0, 0.3529412, 1, 1,
0.2211988, -0.8213733, 2.095321, 0, 0.345098, 1, 1,
0.2267417, -0.5173055, 2.662775, 0, 0.3411765, 1, 1,
0.2279369, -1.459492, 4.701414, 0, 0.3333333, 1, 1,
0.2317301, -2.049453, 1.640731, 0, 0.3294118, 1, 1,
0.2359107, -0.8228878, 2.375302, 0, 0.3215686, 1, 1,
0.2468735, 0.2682305, -0.8566242, 0, 0.3176471, 1, 1,
0.2615001, 0.87325, 0.2070811, 0, 0.3098039, 1, 1,
0.2624415, 0.568866, 0.9648337, 0, 0.3058824, 1, 1,
0.2705541, 1.382703, 0.7084947, 0, 0.2980392, 1, 1,
0.2726232, -1.06861, 4.062066, 0, 0.2901961, 1, 1,
0.2741795, 0.4435337, 1.517427, 0, 0.2862745, 1, 1,
0.2748043, 0.7497927, -0.3673557, 0, 0.2784314, 1, 1,
0.2763636, 1.000418, -0.9653988, 0, 0.2745098, 1, 1,
0.2764513, -0.1074574, 1.574824, 0, 0.2666667, 1, 1,
0.2818717, 1.468082, 1.262076, 0, 0.2627451, 1, 1,
0.2826791, -0.3808456, 2.673129, 0, 0.254902, 1, 1,
0.2886161, 0.3213923, 1.274661, 0, 0.2509804, 1, 1,
0.2924853, -0.252115, 2.685652, 0, 0.2431373, 1, 1,
0.295675, 1.671944, 1.212596, 0, 0.2392157, 1, 1,
0.2983112, -0.1275747, 1.187619, 0, 0.2313726, 1, 1,
0.2986815, -0.8211412, 1.506538, 0, 0.227451, 1, 1,
0.3059226, 0.6439168, 0.4089041, 0, 0.2196078, 1, 1,
0.3065184, 1.091834, 0.02769147, 0, 0.2156863, 1, 1,
0.3084233, 1.829743, -2.180307, 0, 0.2078431, 1, 1,
0.3085145, 0.1801796, -0.2501589, 0, 0.2039216, 1, 1,
0.3104228, -0.6124317, 3.96755, 0, 0.1960784, 1, 1,
0.3138537, -1.094459, 2.266965, 0, 0.1882353, 1, 1,
0.3157318, 0.4264655, 1.114268, 0, 0.1843137, 1, 1,
0.3166045, 0.1491186, 0.1979617, 0, 0.1764706, 1, 1,
0.3168028, 0.4858315, 1.511813, 0, 0.172549, 1, 1,
0.317687, -0.3517005, 3.453843, 0, 0.1647059, 1, 1,
0.3184268, 1.655946, -1.44858, 0, 0.1607843, 1, 1,
0.3211573, -0.6824701, 2.915822, 0, 0.1529412, 1, 1,
0.321746, -1.178961, 2.712651, 0, 0.1490196, 1, 1,
0.3222849, -1.491389, 2.559772, 0, 0.1411765, 1, 1,
0.3234529, -1.986427, 2.356805, 0, 0.1372549, 1, 1,
0.324005, -0.1283837, 2.18379, 0, 0.1294118, 1, 1,
0.3243711, -2.23349, 3.393744, 0, 0.1254902, 1, 1,
0.3257856, 0.06268932, 1.769836, 0, 0.1176471, 1, 1,
0.325826, -1.035281, 2.383469, 0, 0.1137255, 1, 1,
0.3284675, 1.934087, -1.079513, 0, 0.1058824, 1, 1,
0.3358739, -0.5921543, 2.078817, 0, 0.09803922, 1, 1,
0.3374193, -0.06777915, 3.024411, 0, 0.09411765, 1, 1,
0.3412121, 0.1549083, 1.289188, 0, 0.08627451, 1, 1,
0.3416676, -1.483405, 3.758463, 0, 0.08235294, 1, 1,
0.3437101, -1.587847, 3.530881, 0, 0.07450981, 1, 1,
0.346981, -1.241445, 2.386524, 0, 0.07058824, 1, 1,
0.3480961, -2.726752, 5.719682, 0, 0.0627451, 1, 1,
0.3518303, -0.1597793, 1.796283, 0, 0.05882353, 1, 1,
0.3529997, -0.3218038, 2.590824, 0, 0.05098039, 1, 1,
0.356374, 1.933259, 0.8696741, 0, 0.04705882, 1, 1,
0.3567344, 0.3054389, 0.7876288, 0, 0.03921569, 1, 1,
0.356868, -1.31937, 2.575794, 0, 0.03529412, 1, 1,
0.3632248, -0.002336956, 0.6799054, 0, 0.02745098, 1, 1,
0.3650942, -0.3765007, 2.450382, 0, 0.02352941, 1, 1,
0.368943, 0.4526567, 0.6630958, 0, 0.01568628, 1, 1,
0.370595, -0.6147932, 2.041644, 0, 0.01176471, 1, 1,
0.37165, -1.383494, 3.668615, 0, 0.003921569, 1, 1,
0.3716528, -0.4797719, 2.540572, 0.003921569, 0, 1, 1,
0.3818582, 2.007938, -0.6658111, 0.007843138, 0, 1, 1,
0.382011, 1.457285, 0.8638812, 0.01568628, 0, 1, 1,
0.3826566, -2.000562, 4.272291, 0.01960784, 0, 1, 1,
0.3883784, -0.6033667, 3.178816, 0.02745098, 0, 1, 1,
0.3889059, 0.894181, 2.432023, 0.03137255, 0, 1, 1,
0.3895039, 0.2667437, -0.1688238, 0.03921569, 0, 1, 1,
0.3923566, 1.555324, -1.587488, 0.04313726, 0, 1, 1,
0.3955175, 0.634738, 1.674762, 0.05098039, 0, 1, 1,
0.3974658, 1.034818, 0.4523239, 0.05490196, 0, 1, 1,
0.3992926, 0.08828746, 1.95989, 0.0627451, 0, 1, 1,
0.4027986, -1.628307, 3.552291, 0.06666667, 0, 1, 1,
0.4037592, -0.7572715, 3.445259, 0.07450981, 0, 1, 1,
0.4092955, 2.174437, -1.704653, 0.07843138, 0, 1, 1,
0.4101577, 0.8217638, 0.401975, 0.08627451, 0, 1, 1,
0.4137566, 0.588888, 0.7688155, 0.09019608, 0, 1, 1,
0.4151286, -1.263934, 2.848099, 0.09803922, 0, 1, 1,
0.4155652, 1.122873, -0.8199247, 0.1058824, 0, 1, 1,
0.4173875, -0.2321521, 2.188482, 0.1098039, 0, 1, 1,
0.4194183, -1.106108, 2.311796, 0.1176471, 0, 1, 1,
0.419826, -0.3939064, 3.255861, 0.1215686, 0, 1, 1,
0.4231941, 0.4049031, -0.1004772, 0.1294118, 0, 1, 1,
0.4232912, 0.2177791, 0.920698, 0.1333333, 0, 1, 1,
0.4239389, 0.4026051, 1.522299, 0.1411765, 0, 1, 1,
0.4260127, 0.1256592, 2.053669, 0.145098, 0, 1, 1,
0.4262648, -1.541323, 2.112343, 0.1529412, 0, 1, 1,
0.4299814, -0.9893218, 3.46355, 0.1568628, 0, 1, 1,
0.4309598, -0.3782704, 2.708545, 0.1647059, 0, 1, 1,
0.4339148, 0.07301532, 1.11517, 0.1686275, 0, 1, 1,
0.4372246, -1.004902, 2.560733, 0.1764706, 0, 1, 1,
0.440044, 1.395574, -1.460558, 0.1803922, 0, 1, 1,
0.4409047, 2.416036, -0.7080455, 0.1882353, 0, 1, 1,
0.4457439, 0.4393002, 1.813615, 0.1921569, 0, 1, 1,
0.4581651, 0.6289275, -0.2753355, 0.2, 0, 1, 1,
0.458281, 0.8009611, 0.1581624, 0.2078431, 0, 1, 1,
0.4729758, -0.4032803, 3.269478, 0.2117647, 0, 1, 1,
0.4870339, 1.593058, -0.6448323, 0.2196078, 0, 1, 1,
0.4888778, -0.5024876, 1.535573, 0.2235294, 0, 1, 1,
0.4902615, 1.427935, -0.06870873, 0.2313726, 0, 1, 1,
0.4924226, -0.0709706, 0.582441, 0.2352941, 0, 1, 1,
0.4943893, -1.126984, 2.879506, 0.2431373, 0, 1, 1,
0.4954127, -0.2466293, 0.4786327, 0.2470588, 0, 1, 1,
0.499168, 2.15892, 0.1085157, 0.254902, 0, 1, 1,
0.5044802, 0.02654067, 1.621853, 0.2588235, 0, 1, 1,
0.5066401, -0.8955659, 2.983604, 0.2666667, 0, 1, 1,
0.5084778, 0.9603803, -2.374966, 0.2705882, 0, 1, 1,
0.5115831, 1.074757, -0.4139205, 0.2784314, 0, 1, 1,
0.5117841, -0.3588881, 3.553877, 0.282353, 0, 1, 1,
0.5193574, 1.551772, 0.2521998, 0.2901961, 0, 1, 1,
0.5206323, -0.6258516, 1.327423, 0.2941177, 0, 1, 1,
0.5209646, 0.8720874, 0.9851081, 0.3019608, 0, 1, 1,
0.5260337, 0.8681054, 0.9494928, 0.3098039, 0, 1, 1,
0.5285038, 0.8645663, -0.7935002, 0.3137255, 0, 1, 1,
0.5294654, 0.3324164, 0.08288524, 0.3215686, 0, 1, 1,
0.5412959, 0.7572795, 2.722824, 0.3254902, 0, 1, 1,
0.5424048, -0.3073889, 2.015769, 0.3333333, 0, 1, 1,
0.5442568, 2.646041, -0.8196049, 0.3372549, 0, 1, 1,
0.5454319, -1.043203, 3.492894, 0.345098, 0, 1, 1,
0.5461811, 1.389725, 1.824816, 0.3490196, 0, 1, 1,
0.5481801, 0.3269059, 0.6682206, 0.3568628, 0, 1, 1,
0.5510841, 0.5008454, -0.5636426, 0.3607843, 0, 1, 1,
0.5542535, -0.8966025, 4.481142, 0.3686275, 0, 1, 1,
0.555537, -0.6214964, 0.5687442, 0.372549, 0, 1, 1,
0.5565619, 2.192609, 1.405938, 0.3803922, 0, 1, 1,
0.5585911, -0.6115517, 2.821846, 0.3843137, 0, 1, 1,
0.5587945, 0.5124536, 1.416952, 0.3921569, 0, 1, 1,
0.560429, -0.4433593, 1.794647, 0.3960784, 0, 1, 1,
0.5717959, -0.348951, 2.876271, 0.4039216, 0, 1, 1,
0.5739023, 0.512225, 1.18833, 0.4117647, 0, 1, 1,
0.5761509, -0.6038684, 0.9841668, 0.4156863, 0, 1, 1,
0.5776002, -2.598781, 1.9681, 0.4235294, 0, 1, 1,
0.580341, -0.6887413, 1.257623, 0.427451, 0, 1, 1,
0.5814658, -1.622903, 2.574209, 0.4352941, 0, 1, 1,
0.5816167, -1.456691, 4.125391, 0.4392157, 0, 1, 1,
0.5821801, 1.389394, 1.482754, 0.4470588, 0, 1, 1,
0.5867168, 0.1119129, 0.3120096, 0.4509804, 0, 1, 1,
0.5899875, -0.02378075, 2.364367, 0.4588235, 0, 1, 1,
0.6087674, 2.197081, 1.755379, 0.4627451, 0, 1, 1,
0.6130374, 0.1605022, 1.244732, 0.4705882, 0, 1, 1,
0.6148354, -0.8811613, 2.63148, 0.4745098, 0, 1, 1,
0.6172242, 1.082499, 1.231061, 0.4823529, 0, 1, 1,
0.6214405, 0.9751587, -1.113967, 0.4862745, 0, 1, 1,
0.6271321, -0.4883299, 2.163894, 0.4941176, 0, 1, 1,
0.6275197, -1.07971, 2.726661, 0.5019608, 0, 1, 1,
0.6288874, 2.858425, 0.4827439, 0.5058824, 0, 1, 1,
0.6340415, 0.9126865, 0.3836475, 0.5137255, 0, 1, 1,
0.6349173, 0.4806304, 0.2093259, 0.5176471, 0, 1, 1,
0.6435827, 0.2328221, 2.730326, 0.5254902, 0, 1, 1,
0.643857, -2.208516, 2.826533, 0.5294118, 0, 1, 1,
0.6468937, -0.7385421, 1.019111, 0.5372549, 0, 1, 1,
0.6480846, -0.39605, 0.9963805, 0.5411765, 0, 1, 1,
0.6496312, -0.4180915, 1.48902, 0.5490196, 0, 1, 1,
0.6529732, 0.4914439, 0.04338771, 0.5529412, 0, 1, 1,
0.6716209, 0.9808328, 0.5592834, 0.5607843, 0, 1, 1,
0.6741636, 0.8776605, 0.6690373, 0.5647059, 0, 1, 1,
0.6775029, 1.324199, 2.607138, 0.572549, 0, 1, 1,
0.6775323, 0.6151367, 1.645563, 0.5764706, 0, 1, 1,
0.6791283, -0.3667159, 2.803206, 0.5843138, 0, 1, 1,
0.6796367, 0.6793144, 1.265046, 0.5882353, 0, 1, 1,
0.6824734, 1.633412, 1.432687, 0.5960785, 0, 1, 1,
0.6828701, -1.51388, 3.870386, 0.6039216, 0, 1, 1,
0.6837951, 0.3081904, -0.4289594, 0.6078432, 0, 1, 1,
0.684081, -1.235952, 1.490253, 0.6156863, 0, 1, 1,
0.6852433, 0.02777591, -0.1661924, 0.6196079, 0, 1, 1,
0.6853419, 1.142774, 0.4744985, 0.627451, 0, 1, 1,
0.6913211, -0.6166567, 2.044217, 0.6313726, 0, 1, 1,
0.692152, 0.5508155, 0.1565931, 0.6392157, 0, 1, 1,
0.7062979, 1.628527, -1.24999, 0.6431373, 0, 1, 1,
0.7065514, -0.2179912, 1.843937, 0.6509804, 0, 1, 1,
0.7110178, 0.6413724, 0.8030859, 0.654902, 0, 1, 1,
0.7116995, 0.6934713, 0.1855186, 0.6627451, 0, 1, 1,
0.7121049, 0.856321, -0.2586318, 0.6666667, 0, 1, 1,
0.714731, 0.970068, 1.344877, 0.6745098, 0, 1, 1,
0.7309982, 0.6249162, 1.117595, 0.6784314, 0, 1, 1,
0.7332479, 0.2429553, 1.67412, 0.6862745, 0, 1, 1,
0.7352897, 0.07240937, 1.066004, 0.6901961, 0, 1, 1,
0.7415245, -1.002406, 3.147725, 0.6980392, 0, 1, 1,
0.7467566, -0.9253986, 2.940821, 0.7058824, 0, 1, 1,
0.751353, -0.630448, 3.768869, 0.7098039, 0, 1, 1,
0.7521426, 0.9018252, -0.2428402, 0.7176471, 0, 1, 1,
0.7547846, -2.591734, 3.887701, 0.7215686, 0, 1, 1,
0.7612911, 0.2957775, -0.06785069, 0.7294118, 0, 1, 1,
0.7658854, -0.3112115, 0.8463685, 0.7333333, 0, 1, 1,
0.7727404, -1.015942, 3.581407, 0.7411765, 0, 1, 1,
0.7736231, -1.334424, 2.515341, 0.7450981, 0, 1, 1,
0.7739147, -0.06792317, -0.9184876, 0.7529412, 0, 1, 1,
0.7739272, 0.5841377, 3.015392, 0.7568628, 0, 1, 1,
0.7754592, 0.8583001, -1.22368, 0.7647059, 0, 1, 1,
0.7808895, 0.6406257, 1.129977, 0.7686275, 0, 1, 1,
0.7813157, -0.1945577, 1.086758, 0.7764706, 0, 1, 1,
0.7818997, -1.246346, 1.973999, 0.7803922, 0, 1, 1,
0.7833477, -0.2893606, 2.840884, 0.7882353, 0, 1, 1,
0.7838733, -0.6353188, 2.250308, 0.7921569, 0, 1, 1,
0.7956309, 0.9637743, -1.1814, 0.8, 0, 1, 1,
0.8015332, 1.087514, 0.4089827, 0.8078431, 0, 1, 1,
0.8107473, 1.593801, 0.1720397, 0.8117647, 0, 1, 1,
0.812045, -2.074778, 2.963392, 0.8196079, 0, 1, 1,
0.8139116, -0.2355168, 2.900995, 0.8235294, 0, 1, 1,
0.8221861, -0.8181536, 1.66697, 0.8313726, 0, 1, 1,
0.8309405, -0.7284802, 1.985462, 0.8352941, 0, 1, 1,
0.8311515, -0.6782206, 0.5335701, 0.8431373, 0, 1, 1,
0.8337561, 1.104989, -0.05342203, 0.8470588, 0, 1, 1,
0.8345143, -0.4317843, 0.2560064, 0.854902, 0, 1, 1,
0.8364822, 0.2366088, 1.431234, 0.8588235, 0, 1, 1,
0.8366492, -0.4880662, 1.879449, 0.8666667, 0, 1, 1,
0.8387964, 0.8418205, 1.50684, 0.8705882, 0, 1, 1,
0.8396999, 1.075609, 0.8853468, 0.8784314, 0, 1, 1,
0.8466922, 1.425145, 1.965373, 0.8823529, 0, 1, 1,
0.8501229, 1.935852, 1.079128, 0.8901961, 0, 1, 1,
0.8597625, -0.0918757, 0.4942745, 0.8941177, 0, 1, 1,
0.8617977, 1.129883, 0.7512041, 0.9019608, 0, 1, 1,
0.8626912, 2.038054, 0.7672116, 0.9098039, 0, 1, 1,
0.8663362, -0.3795891, 3.610517, 0.9137255, 0, 1, 1,
0.8667541, 0.6792212, 0.4248146, 0.9215686, 0, 1, 1,
0.8705765, 0.1258964, 1.783341, 0.9254902, 0, 1, 1,
0.8732325, -0.6165813, 0.7551874, 0.9333333, 0, 1, 1,
0.8781637, 0.9067192, 2.206228, 0.9372549, 0, 1, 1,
0.8806059, -0.4379131, 1.561803, 0.945098, 0, 1, 1,
0.8834568, 0.2744161, 0.1164171, 0.9490196, 0, 1, 1,
0.8888903, 2.011117, 0.5008358, 0.9568627, 0, 1, 1,
0.8905445, -0.9681803, 2.362626, 0.9607843, 0, 1, 1,
0.8947293, -0.2194665, 2.615459, 0.9686275, 0, 1, 1,
0.8980442, -0.2326446, 1.61789, 0.972549, 0, 1, 1,
0.8985478, -0.3202714, 0.473339, 0.9803922, 0, 1, 1,
0.8985875, -1.074229, 3.516582, 0.9843137, 0, 1, 1,
0.8997736, -0.8844978, 0.5332391, 0.9921569, 0, 1, 1,
0.9113224, -0.6677666, 1.446365, 0.9960784, 0, 1, 1,
0.9164457, 1.287503, 0.6925961, 1, 0, 0.9960784, 1,
0.9187058, -0.5131763, 2.711709, 1, 0, 0.9882353, 1,
0.9191164, -0.9589836, 1.43919, 1, 0, 0.9843137, 1,
0.9200715, -1.06311, 2.113608, 1, 0, 0.9764706, 1,
0.9279261, 0.4945137, 1.448888, 1, 0, 0.972549, 1,
0.9293715, -0.521388, 2.48264, 1, 0, 0.9647059, 1,
0.9448192, 1.462249, 2.27138, 1, 0, 0.9607843, 1,
0.9461671, -0.4960511, -0.3277294, 1, 0, 0.9529412, 1,
0.9493266, 1.089025, 0.5919927, 1, 0, 0.9490196, 1,
0.9501194, 0.3864298, 1.26348, 1, 0, 0.9411765, 1,
0.9505654, -0.07631285, 0.2578423, 1, 0, 0.9372549, 1,
0.9551525, -1.464072, 3.806526, 1, 0, 0.9294118, 1,
0.9586158, -1.602449, 2.988783, 1, 0, 0.9254902, 1,
0.9644684, 0.5268065, 0.5286697, 1, 0, 0.9176471, 1,
0.9663441, 2.205797, -1.817626, 1, 0, 0.9137255, 1,
0.9767006, 1.657551, 0.0276128, 1, 0, 0.9058824, 1,
0.9890998, 0.5447876, 1.091032, 1, 0, 0.9019608, 1,
0.994704, 1.714567, 0.6178355, 1, 0, 0.8941177, 1,
0.995195, 1.367485, -0.3235907, 1, 0, 0.8862745, 1,
1.00901, 1.24309, -1.020508, 1, 0, 0.8823529, 1,
1.01486, -0.1579969, 0.9103847, 1, 0, 0.8745098, 1,
1.016419, 0.03126875, 2.680898, 1, 0, 0.8705882, 1,
1.019282, -0.1160686, 0.908616, 1, 0, 0.8627451, 1,
1.025017, -1.0905, 0.6161164, 1, 0, 0.8588235, 1,
1.030523, 1.558996, 0.3602597, 1, 0, 0.8509804, 1,
1.047972, -0.6042812, 1.576348, 1, 0, 0.8470588, 1,
1.057589, 0.3625827, 1.339833, 1, 0, 0.8392157, 1,
1.058328, -0.7148339, 2.223258, 1, 0, 0.8352941, 1,
1.058473, -0.2246611, 1.539119, 1, 0, 0.827451, 1,
1.061537, 0.1904959, 1.416646, 1, 0, 0.8235294, 1,
1.067003, 0.1908769, 1.857747, 1, 0, 0.8156863, 1,
1.081748, 1.051357, 0.3377279, 1, 0, 0.8117647, 1,
1.08458, -0.6354867, 0.4162304, 1, 0, 0.8039216, 1,
1.089147, -0.6991886, 1.393234, 1, 0, 0.7960784, 1,
1.100742, 0.8657424, 0.8476085, 1, 0, 0.7921569, 1,
1.107268, -0.1379443, 3.307114, 1, 0, 0.7843137, 1,
1.109137, -1.660632, 2.11945, 1, 0, 0.7803922, 1,
1.113076, 0.4515682, 1.240771, 1, 0, 0.772549, 1,
1.133827, 0.3104388, 0.4514514, 1, 0, 0.7686275, 1,
1.139862, 0.6799305, 0.8475467, 1, 0, 0.7607843, 1,
1.145215, 0.7059191, 1.569117, 1, 0, 0.7568628, 1,
1.147483, -0.0700245, -1.765424, 1, 0, 0.7490196, 1,
1.15641, 1.505637, -0.4072009, 1, 0, 0.7450981, 1,
1.163352, 0.6689439, 1.557065, 1, 0, 0.7372549, 1,
1.167147, -0.01889487, 3.340668, 1, 0, 0.7333333, 1,
1.168109, -0.8828027, 2.098617, 1, 0, 0.7254902, 1,
1.176742, -0.7918817, 3.32627, 1, 0, 0.7215686, 1,
1.180972, 0.4487883, -0.5442006, 1, 0, 0.7137255, 1,
1.186262, -0.4874867, 2.921665, 1, 0, 0.7098039, 1,
1.186285, 1.313539, 0.9037775, 1, 0, 0.7019608, 1,
1.188859, -0.1727017, 1.207249, 1, 0, 0.6941177, 1,
1.190811, 1.468534, 0.7244694, 1, 0, 0.6901961, 1,
1.193304, 0.02499937, 1.169536, 1, 0, 0.682353, 1,
1.200317, 0.5005099, 0.5894512, 1, 0, 0.6784314, 1,
1.206353, 0.04014613, 0.9463068, 1, 0, 0.6705883, 1,
1.207393, -0.9120609, 1.116785, 1, 0, 0.6666667, 1,
1.215864, -1.030769, 2.663553, 1, 0, 0.6588235, 1,
1.222149, -1.095186, 0.5720519, 1, 0, 0.654902, 1,
1.226723, -0.6701013, -0.07048929, 1, 0, 0.6470588, 1,
1.227892, 0.4177618, -0.2318292, 1, 0, 0.6431373, 1,
1.233937, 1.364656, 2.292614, 1, 0, 0.6352941, 1,
1.238584, -0.8385533, 0.5679779, 1, 0, 0.6313726, 1,
1.24045, 2.385768, 1.799484, 1, 0, 0.6235294, 1,
1.240778, 1.327362, -0.09121968, 1, 0, 0.6196079, 1,
1.242758, -0.3315104, 0.2998462, 1, 0, 0.6117647, 1,
1.243985, -0.6356212, 1.13059, 1, 0, 0.6078432, 1,
1.24419, 1.794258, -0.7337961, 1, 0, 0.6, 1,
1.24698, -0.8581212, 0.9900725, 1, 0, 0.5921569, 1,
1.25498, 0.3392146, 0.7197714, 1, 0, 0.5882353, 1,
1.257192, 1.812467, -1.041519, 1, 0, 0.5803922, 1,
1.264298, 0.5571239, 1.963678, 1, 0, 0.5764706, 1,
1.266939, 0.04255218, 0.6114525, 1, 0, 0.5686275, 1,
1.267287, -0.2459308, 3.705823, 1, 0, 0.5647059, 1,
1.278473, -1.350816, 2.423825, 1, 0, 0.5568628, 1,
1.291283, 1.494885, -0.3591582, 1, 0, 0.5529412, 1,
1.295299, -0.1898202, 3.016369, 1, 0, 0.5450981, 1,
1.296533, 0.213411, -0.7001321, 1, 0, 0.5411765, 1,
1.302938, -0.7821371, 1.044639, 1, 0, 0.5333334, 1,
1.30395, 0.8107233, -0.1614376, 1, 0, 0.5294118, 1,
1.312591, 2.43796, 0.7544613, 1, 0, 0.5215687, 1,
1.313334, 1.031982, 0.9207087, 1, 0, 0.5176471, 1,
1.314269, 2.317506, 1.448222, 1, 0, 0.509804, 1,
1.334267, 1.171076, 1.372914, 1, 0, 0.5058824, 1,
1.338142, -1.485917, 2.527339, 1, 0, 0.4980392, 1,
1.34703, 0.796836, 1.719536, 1, 0, 0.4901961, 1,
1.347818, 2.48783, -0.9783428, 1, 0, 0.4862745, 1,
1.364903, -0.6452046, 2.821319, 1, 0, 0.4784314, 1,
1.365669, -2.514532, 0.9411933, 1, 0, 0.4745098, 1,
1.366532, 1.078101, 1.354183, 1, 0, 0.4666667, 1,
1.366591, -1.171991, 4.40597, 1, 0, 0.4627451, 1,
1.371659, -0.1981138, 1.589295, 1, 0, 0.454902, 1,
1.387767, 1.479216, 2.528081, 1, 0, 0.4509804, 1,
1.39151, 1.480667, 0.8588363, 1, 0, 0.4431373, 1,
1.404052, 1.975144, 0.08277778, 1, 0, 0.4392157, 1,
1.411267, -0.1379313, 1.960441, 1, 0, 0.4313726, 1,
1.419657, 1.263174, 1.81859, 1, 0, 0.427451, 1,
1.422, 1.548511, 0.2550795, 1, 0, 0.4196078, 1,
1.438531, -0.9265406, 2.594872, 1, 0, 0.4156863, 1,
1.444082, -0.6092615, 0.9140459, 1, 0, 0.4078431, 1,
1.444864, 0.6949375, -0.3807159, 1, 0, 0.4039216, 1,
1.447583, -1.167869, 3.569362, 1, 0, 0.3960784, 1,
1.457581, -1.372382, 0.2044796, 1, 0, 0.3882353, 1,
1.458959, 0.4217228, -0.2473113, 1, 0, 0.3843137, 1,
1.465666, 0.1368877, 0.8487779, 1, 0, 0.3764706, 1,
1.470342, 0.4719177, 1.216723, 1, 0, 0.372549, 1,
1.478578, 1.096922, 0.583906, 1, 0, 0.3647059, 1,
1.486024, 0.1744774, 2.534241, 1, 0, 0.3607843, 1,
1.499075, 1.410303, 0.2345366, 1, 0, 0.3529412, 1,
1.501231, 0.1057638, 0.8868832, 1, 0, 0.3490196, 1,
1.502497, 0.4865327, 1.469923, 1, 0, 0.3411765, 1,
1.516845, 1.501755, 0.9683516, 1, 0, 0.3372549, 1,
1.519522, 0.5835193, 2.12143, 1, 0, 0.3294118, 1,
1.536246, 0.9546266, -0.6427228, 1, 0, 0.3254902, 1,
1.556087, -0.4946214, 1.904488, 1, 0, 0.3176471, 1,
1.562019, -0.004519702, 2.416088, 1, 0, 0.3137255, 1,
1.580103, 0.006912906, 1.58103, 1, 0, 0.3058824, 1,
1.596196, 1.153611, 1.045128, 1, 0, 0.2980392, 1,
1.612309, 0.4949639, 1.459923, 1, 0, 0.2941177, 1,
1.632534, -1.153707, 1.452221, 1, 0, 0.2862745, 1,
1.662776, 0.5960183, 0.7459545, 1, 0, 0.282353, 1,
1.664756, 0.7190825, 3.317521, 1, 0, 0.2745098, 1,
1.681619, -1.100939, 1.843716, 1, 0, 0.2705882, 1,
1.69703, 0.9119751, 0.2499015, 1, 0, 0.2627451, 1,
1.70032, 1.289273, -0.1830179, 1, 0, 0.2588235, 1,
1.708293, 0.1052682, 1.244157, 1, 0, 0.2509804, 1,
1.726587, -0.6289102, 1.336417, 1, 0, 0.2470588, 1,
1.73817, 1.648544, 1.195692, 1, 0, 0.2392157, 1,
1.756083, -0.1542364, 0.02898917, 1, 0, 0.2352941, 1,
1.772201, 1.408729, 1.464708, 1, 0, 0.227451, 1,
1.777372, -0.5921258, 1.561899, 1, 0, 0.2235294, 1,
1.786215, 0.8005251, -0.4731146, 1, 0, 0.2156863, 1,
1.788842, 1.660743, 1.71825, 1, 0, 0.2117647, 1,
1.794376, 1.392239, 0.8111752, 1, 0, 0.2039216, 1,
1.800045, 1.68971, 0.3447796, 1, 0, 0.1960784, 1,
1.803425, 0.01394471, 2.93325, 1, 0, 0.1921569, 1,
1.81944, -0.6033596, 0.4687354, 1, 0, 0.1843137, 1,
1.84566, -0.8236177, 3.219412, 1, 0, 0.1803922, 1,
1.852469, -0.03234701, 2.877897, 1, 0, 0.172549, 1,
1.872025, 1.362575, 2.133314, 1, 0, 0.1686275, 1,
1.873604, -1.436606, 1.555892, 1, 0, 0.1607843, 1,
1.903693, -0.02274261, 1.231152, 1, 0, 0.1568628, 1,
1.921689, 1.63391, 0.2613758, 1, 0, 0.1490196, 1,
1.923981, 1.025024, 3.012723, 1, 0, 0.145098, 1,
1.930345, 0.4630853, 1.605217, 1, 0, 0.1372549, 1,
1.930925, -0.2565862, 2.776223, 1, 0, 0.1333333, 1,
1.936354, -1.224892, 2.654752, 1, 0, 0.1254902, 1,
1.944565, 0.7925454, 2.604808, 1, 0, 0.1215686, 1,
1.951743, -0.5797614, 0.5224752, 1, 0, 0.1137255, 1,
1.962409, -0.7372168, 2.038456, 1, 0, 0.1098039, 1,
1.963001, -0.06889787, 0.8328778, 1, 0, 0.1019608, 1,
1.970079, 1.435521, 1.160453, 1, 0, 0.09411765, 1,
1.994113, 1.24791, 1.254897, 1, 0, 0.09019608, 1,
2.03813, 0.2092647, 0.2653529, 1, 0, 0.08235294, 1,
2.039433, 0.4836365, 1.493108, 1, 0, 0.07843138, 1,
2.192677, -0.2095637, 1.162532, 1, 0, 0.07058824, 1,
2.261386, 0.1998735, 1.440001, 1, 0, 0.06666667, 1,
2.265913, 0.4715416, 2.531624, 1, 0, 0.05882353, 1,
2.362093, -0.1656533, 1.852516, 1, 0, 0.05490196, 1,
2.43085, 1.117373, 0.7601668, 1, 0, 0.04705882, 1,
2.466662, 0.8086703, 0.5552931, 1, 0, 0.04313726, 1,
2.500183, -0.01818535, 1.276499, 1, 0, 0.03529412, 1,
2.558282, 1.050832, 2.696363, 1, 0, 0.03137255, 1,
2.662438, -1.15256, 0.41215, 1, 0, 0.02352941, 1,
2.991911, 1.485213, 2.211985, 1, 0, 0.01960784, 1,
3.68593, 0.3152074, 0.3462115, 1, 0, 0.01176471, 1,
3.803683, -0.6666027, 1.360471, 1, 0, 0.007843138, 1
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
0.4094895, -4.20859, -7.47794, 0, -0.5, 0.5, 0.5,
0.4094895, -4.20859, -7.47794, 1, -0.5, 0.5, 0.5,
0.4094895, -4.20859, -7.47794, 1, 1.5, 0.5, 0.5,
0.4094895, -4.20859, -7.47794, 0, 1.5, 0.5, 0.5
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
-4.135335, -0.1379908, -7.47794, 0, -0.5, 0.5, 0.5,
-4.135335, -0.1379908, -7.47794, 1, -0.5, 0.5, 0.5,
-4.135335, -0.1379908, -7.47794, 1, 1.5, 0.5, 0.5,
-4.135335, -0.1379908, -7.47794, 0, 1.5, 0.5, 0.5
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
-4.135335, -4.20859, 0.07726145, 0, -0.5, 0.5, 0.5,
-4.135335, -4.20859, 0.07726145, 1, -0.5, 0.5, 0.5,
-4.135335, -4.20859, 0.07726145, 1, 1.5, 0.5, 0.5,
-4.135335, -4.20859, 0.07726145, 0, 1.5, 0.5, 0.5
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
-2, -3.269221, -5.734432,
3, -3.269221, -5.734432,
-2, -3.269221, -5.734432,
-2, -3.425783, -6.025017,
-1, -3.269221, -5.734432,
-1, -3.425783, -6.025017,
0, -3.269221, -5.734432,
0, -3.425783, -6.025017,
1, -3.269221, -5.734432,
1, -3.425783, -6.025017,
2, -3.269221, -5.734432,
2, -3.425783, -6.025017,
3, -3.269221, -5.734432,
3, -3.425783, -6.025017
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
-2, -3.738906, -6.606186, 0, -0.5, 0.5, 0.5,
-2, -3.738906, -6.606186, 1, -0.5, 0.5, 0.5,
-2, -3.738906, -6.606186, 1, 1.5, 0.5, 0.5,
-2, -3.738906, -6.606186, 0, 1.5, 0.5, 0.5,
-1, -3.738906, -6.606186, 0, -0.5, 0.5, 0.5,
-1, -3.738906, -6.606186, 1, -0.5, 0.5, 0.5,
-1, -3.738906, -6.606186, 1, 1.5, 0.5, 0.5,
-1, -3.738906, -6.606186, 0, 1.5, 0.5, 0.5,
0, -3.738906, -6.606186, 0, -0.5, 0.5, 0.5,
0, -3.738906, -6.606186, 1, -0.5, 0.5, 0.5,
0, -3.738906, -6.606186, 1, 1.5, 0.5, 0.5,
0, -3.738906, -6.606186, 0, 1.5, 0.5, 0.5,
1, -3.738906, -6.606186, 0, -0.5, 0.5, 0.5,
1, -3.738906, -6.606186, 1, -0.5, 0.5, 0.5,
1, -3.738906, -6.606186, 1, 1.5, 0.5, 0.5,
1, -3.738906, -6.606186, 0, 1.5, 0.5, 0.5,
2, -3.738906, -6.606186, 0, -0.5, 0.5, 0.5,
2, -3.738906, -6.606186, 1, -0.5, 0.5, 0.5,
2, -3.738906, -6.606186, 1, 1.5, 0.5, 0.5,
2, -3.738906, -6.606186, 0, 1.5, 0.5, 0.5,
3, -3.738906, -6.606186, 0, -0.5, 0.5, 0.5,
3, -3.738906, -6.606186, 1, -0.5, 0.5, 0.5,
3, -3.738906, -6.606186, 1, 1.5, 0.5, 0.5,
3, -3.738906, -6.606186, 0, 1.5, 0.5, 0.5
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
-3.086529, -3, -5.734432,
-3.086529, 2, -5.734432,
-3.086529, -3, -5.734432,
-3.261331, -3, -6.025017,
-3.086529, -2, -5.734432,
-3.261331, -2, -6.025017,
-3.086529, -1, -5.734432,
-3.261331, -1, -6.025017,
-3.086529, 0, -5.734432,
-3.261331, 0, -6.025017,
-3.086529, 1, -5.734432,
-3.261331, 1, -6.025017,
-3.086529, 2, -5.734432,
-3.261331, 2, -6.025017
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
-3.610932, -3, -6.606186, 0, -0.5, 0.5, 0.5,
-3.610932, -3, -6.606186, 1, -0.5, 0.5, 0.5,
-3.610932, -3, -6.606186, 1, 1.5, 0.5, 0.5,
-3.610932, -3, -6.606186, 0, 1.5, 0.5, 0.5,
-3.610932, -2, -6.606186, 0, -0.5, 0.5, 0.5,
-3.610932, -2, -6.606186, 1, -0.5, 0.5, 0.5,
-3.610932, -2, -6.606186, 1, 1.5, 0.5, 0.5,
-3.610932, -2, -6.606186, 0, 1.5, 0.5, 0.5,
-3.610932, -1, -6.606186, 0, -0.5, 0.5, 0.5,
-3.610932, -1, -6.606186, 1, -0.5, 0.5, 0.5,
-3.610932, -1, -6.606186, 1, 1.5, 0.5, 0.5,
-3.610932, -1, -6.606186, 0, 1.5, 0.5, 0.5,
-3.610932, 0, -6.606186, 0, -0.5, 0.5, 0.5,
-3.610932, 0, -6.606186, 1, -0.5, 0.5, 0.5,
-3.610932, 0, -6.606186, 1, 1.5, 0.5, 0.5,
-3.610932, 0, -6.606186, 0, 1.5, 0.5, 0.5,
-3.610932, 1, -6.606186, 0, -0.5, 0.5, 0.5,
-3.610932, 1, -6.606186, 1, -0.5, 0.5, 0.5,
-3.610932, 1, -6.606186, 1, 1.5, 0.5, 0.5,
-3.610932, 1, -6.606186, 0, 1.5, 0.5, 0.5,
-3.610932, 2, -6.606186, 0, -0.5, 0.5, 0.5,
-3.610932, 2, -6.606186, 1, -0.5, 0.5, 0.5,
-3.610932, 2, -6.606186, 1, 1.5, 0.5, 0.5,
-3.610932, 2, -6.606186, 0, 1.5, 0.5, 0.5
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
-3.086529, -3.269221, -4,
-3.086529, -3.269221, 4,
-3.086529, -3.269221, -4,
-3.261331, -3.425783, -4,
-3.086529, -3.269221, -2,
-3.261331, -3.425783, -2,
-3.086529, -3.269221, 0,
-3.261331, -3.425783, 0,
-3.086529, -3.269221, 2,
-3.261331, -3.425783, 2,
-3.086529, -3.269221, 4,
-3.261331, -3.425783, 4
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
-3.610932, -3.738906, -4, 0, -0.5, 0.5, 0.5,
-3.610932, -3.738906, -4, 1, -0.5, 0.5, 0.5,
-3.610932, -3.738906, -4, 1, 1.5, 0.5, 0.5,
-3.610932, -3.738906, -4, 0, 1.5, 0.5, 0.5,
-3.610932, -3.738906, -2, 0, -0.5, 0.5, 0.5,
-3.610932, -3.738906, -2, 1, -0.5, 0.5, 0.5,
-3.610932, -3.738906, -2, 1, 1.5, 0.5, 0.5,
-3.610932, -3.738906, -2, 0, 1.5, 0.5, 0.5,
-3.610932, -3.738906, 0, 0, -0.5, 0.5, 0.5,
-3.610932, -3.738906, 0, 1, -0.5, 0.5, 0.5,
-3.610932, -3.738906, 0, 1, 1.5, 0.5, 0.5,
-3.610932, -3.738906, 0, 0, 1.5, 0.5, 0.5,
-3.610932, -3.738906, 2, 0, -0.5, 0.5, 0.5,
-3.610932, -3.738906, 2, 1, -0.5, 0.5, 0.5,
-3.610932, -3.738906, 2, 1, 1.5, 0.5, 0.5,
-3.610932, -3.738906, 2, 0, 1.5, 0.5, 0.5,
-3.610932, -3.738906, 4, 0, -0.5, 0.5, 0.5,
-3.610932, -3.738906, 4, 1, -0.5, 0.5, 0.5,
-3.610932, -3.738906, 4, 1, 1.5, 0.5, 0.5,
-3.610932, -3.738906, 4, 0, 1.5, 0.5, 0.5
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
-3.086529, -3.269221, -5.734432,
-3.086529, 2.993239, -5.734432,
-3.086529, -3.269221, 5.888955,
-3.086529, 2.993239, 5.888955,
-3.086529, -3.269221, -5.734432,
-3.086529, -3.269221, 5.888955,
-3.086529, 2.993239, -5.734432,
-3.086529, 2.993239, 5.888955,
-3.086529, -3.269221, -5.734432,
3.905509, -3.269221, -5.734432,
-3.086529, -3.269221, 5.888955,
3.905509, -3.269221, 5.888955,
-3.086529, 2.993239, -5.734432,
3.905509, 2.993239, -5.734432,
-3.086529, 2.993239, 5.888955,
3.905509, 2.993239, 5.888955,
3.905509, -3.269221, -5.734432,
3.905509, 2.993239, -5.734432,
3.905509, -3.269221, 5.888955,
3.905509, 2.993239, 5.888955,
3.905509, -3.269221, -5.734432,
3.905509, -3.269221, 5.888955,
3.905509, 2.993239, -5.734432,
3.905509, 2.993239, 5.888955
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
var radius = 7.977787;
var distance = 35.49408;
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
mvMatrix.translate( -0.4094895, 0.1379908, -0.07726145 );
mvMatrix.scale( 1.233652, 1.377372, 0.742102 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.49408);
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
oxamyl<-read.table("oxamyl.xyz")
```

```
## Error in read.table("oxamyl.xyz"): no lines available in input
```

```r
x<-oxamyl$V2
```

```
## Error in eval(expr, envir, enclos): object 'oxamyl' not found
```

```r
y<-oxamyl$V3
```

```
## Error in eval(expr, envir, enclos): object 'oxamyl' not found
```

```r
z<-oxamyl$V4
```

```
## Error in eval(expr, envir, enclos): object 'oxamyl' not found
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
-2.984704, -0.2756493, -0.05902785, 0, 0, 1, 1, 1,
-2.844089, 0.3285478, -1.670539, 1, 0, 0, 1, 1,
-2.737849, 0.5095461, 0.7611153, 1, 0, 0, 1, 1,
-2.622802, -0.1255513, -0.4242172, 1, 0, 0, 1, 1,
-2.603875, 1.204246, 0.1988863, 1, 0, 0, 1, 1,
-2.589714, -1.07383, -0.6040632, 1, 0, 0, 1, 1,
-2.363322, 1.310452, 0.6133318, 0, 0, 0, 1, 1,
-2.355911, -0.2195263, -1.436754, 0, 0, 0, 1, 1,
-2.321858, 0.03529241, -2.911984, 0, 0, 0, 1, 1,
-2.316702, -0.8400013, -1.610597, 0, 0, 0, 1, 1,
-2.297524, -0.5217527, -1.365537, 0, 0, 0, 1, 1,
-2.287594, -0.5215023, -0.8496826, 0, 0, 0, 1, 1,
-2.255522, 0.07085523, 0.5522385, 0, 0, 0, 1, 1,
-2.24863, 0.5596164, -1.170604, 1, 1, 1, 1, 1,
-2.217996, -0.8228045, -1.902556, 1, 1, 1, 1, 1,
-2.206715, 0.04783844, -1.770045, 1, 1, 1, 1, 1,
-2.18279, 0.7454777, 0.7410232, 1, 1, 1, 1, 1,
-2.13101, 0.2712392, -0.4036355, 1, 1, 1, 1, 1,
-2.05371, -0.1688712, -2.097019, 1, 1, 1, 1, 1,
-1.986289, -0.762996, -2.89148, 1, 1, 1, 1, 1,
-1.975908, -0.6216556, -1.385346, 1, 1, 1, 1, 1,
-1.97422, 0.2155046, -0.58736, 1, 1, 1, 1, 1,
-1.947417, 0.6691884, -0.6969243, 1, 1, 1, 1, 1,
-1.919836, 0.5753615, -1.080298, 1, 1, 1, 1, 1,
-1.912688, 0.7779507, -1.880149, 1, 1, 1, 1, 1,
-1.911522, -0.9345897, -3.37204, 1, 1, 1, 1, 1,
-1.883394, -0.3030769, -1.49303, 1, 1, 1, 1, 1,
-1.874932, -0.9744042, -1.507853, 1, 1, 1, 1, 1,
-1.850782, -0.2813842, -1.967331, 0, 0, 1, 1, 1,
-1.82898, 0.7586153, -1.75831, 1, 0, 0, 1, 1,
-1.798633, 0.1761048, -0.6133552, 1, 0, 0, 1, 1,
-1.792452, -2.789758, -2.716667, 1, 0, 0, 1, 1,
-1.778085, -0.3552493, -2.443368, 1, 0, 0, 1, 1,
-1.768377, -0.5825603, -0.9760611, 1, 0, 0, 1, 1,
-1.768271, 2.450444, -1.354419, 0, 0, 0, 1, 1,
-1.719067, -1.99161, -3.995344, 0, 0, 0, 1, 1,
-1.716086, -0.3370321, -1.670819, 0, 0, 0, 1, 1,
-1.709543, -1.149736, -1.948806, 0, 0, 0, 1, 1,
-1.707557, -0.6596947, -3.066243, 0, 0, 0, 1, 1,
-1.700066, -0.710959, -2.207152, 0, 0, 0, 1, 1,
-1.684428, -0.2280395, -1.975781, 0, 0, 0, 1, 1,
-1.680541, -0.5716133, -0.1002985, 1, 1, 1, 1, 1,
-1.676725, 0.8275368, -1.289147, 1, 1, 1, 1, 1,
-1.669805, -0.2335858, -2.629713, 1, 1, 1, 1, 1,
-1.667436, -0.2282859, -1.45904, 1, 1, 1, 1, 1,
-1.64887, 0.07470661, -1.483781, 1, 1, 1, 1, 1,
-1.617383, 0.2233672, -1.205896, 1, 1, 1, 1, 1,
-1.613424, 0.7510846, -2.895673, 1, 1, 1, 1, 1,
-1.613154, -1.004108, -1.784089, 1, 1, 1, 1, 1,
-1.610468, 0.9817045, -0.4974574, 1, 1, 1, 1, 1,
-1.604262, -1.382133, -0.3746748, 1, 1, 1, 1, 1,
-1.593345, 0.5496982, -1.901511, 1, 1, 1, 1, 1,
-1.593057, -0.1904749, -0.862845, 1, 1, 1, 1, 1,
-1.589417, 0.3393221, 0.5613543, 1, 1, 1, 1, 1,
-1.588682, 1.351775, -1.171804, 1, 1, 1, 1, 1,
-1.585321, -0.3441064, -1.399462, 1, 1, 1, 1, 1,
-1.559998, 1.802374, -0.8640394, 0, 0, 1, 1, 1,
-1.54918, -1.099509, -3.027312, 1, 0, 0, 1, 1,
-1.545823, 1.695457, -0.893123, 1, 0, 0, 1, 1,
-1.545402, 0.1549875, -2.028989, 1, 0, 0, 1, 1,
-1.536891, -0.9537914, -1.4928, 1, 0, 0, 1, 1,
-1.514114, 1.73868, -0.3952383, 1, 0, 0, 1, 1,
-1.508643, -1.012755, -1.395016, 0, 0, 0, 1, 1,
-1.497968, -0.5810226, -2.667049, 0, 0, 0, 1, 1,
-1.49755, 0.7319242, -1.71328, 0, 0, 0, 1, 1,
-1.497234, -0.5863995, -2.362016, 0, 0, 0, 1, 1,
-1.495965, -1.036538, -2.794231, 0, 0, 0, 1, 1,
-1.490679, -1.26229, -2.367564, 0, 0, 0, 1, 1,
-1.487307, 1.423147, -0.2714525, 0, 0, 0, 1, 1,
-1.474201, 0.191404, -2.159771, 1, 1, 1, 1, 1,
-1.473321, -0.6021524, -1.417518, 1, 1, 1, 1, 1,
-1.456316, -0.7553203, -2.718905, 1, 1, 1, 1, 1,
-1.447125, -2.24437, -2.75089, 1, 1, 1, 1, 1,
-1.446044, -0.1500099, -2.891108, 1, 1, 1, 1, 1,
-1.43909, 0.7160285, 0.0423322, 1, 1, 1, 1, 1,
-1.437501, 1.467016, -1.267462, 1, 1, 1, 1, 1,
-1.431103, 0.1662641, -1.21065, 1, 1, 1, 1, 1,
-1.425633, -1.018345, -1.963501, 1, 1, 1, 1, 1,
-1.424039, -1.759617, -3.610119, 1, 1, 1, 1, 1,
-1.423537, 0.08462106, -0.8862147, 1, 1, 1, 1, 1,
-1.422252, 0.9548355, -1.091257, 1, 1, 1, 1, 1,
-1.410827, -0.5536058, -1.713837, 1, 1, 1, 1, 1,
-1.41069, 2.322553, -1.306827, 1, 1, 1, 1, 1,
-1.408979, -0.4110341, -1.081652, 1, 1, 1, 1, 1,
-1.391863, 0.3882775, -2.547418, 0, 0, 1, 1, 1,
-1.391558, -0.1877545, -2.026465, 1, 0, 0, 1, 1,
-1.389654, -0.9827327, -1.771006, 1, 0, 0, 1, 1,
-1.375321, -0.2304106, -0.6229039, 1, 0, 0, 1, 1,
-1.375271, 0.2164435, 0.1347942, 1, 0, 0, 1, 1,
-1.372275, -1.038228, -3.756653, 1, 0, 0, 1, 1,
-1.37049, -0.7452739, -1.028332, 0, 0, 0, 1, 1,
-1.362908, 1.988819, 0.1827291, 0, 0, 0, 1, 1,
-1.355824, 0.8501849, 0.06383233, 0, 0, 0, 1, 1,
-1.350714, -2.21279, -3.806548, 0, 0, 0, 1, 1,
-1.346006, 1.483896, -0.4102602, 0, 0, 0, 1, 1,
-1.342343, -0.9936745, -1.213259, 0, 0, 0, 1, 1,
-1.322052, -2.525904, -1.76805, 0, 0, 0, 1, 1,
-1.318094, 1.208109, -1.158807, 1, 1, 1, 1, 1,
-1.312841, -1.160834, -2.660353, 1, 1, 1, 1, 1,
-1.310738, 0.8358999, -1.659164, 1, 1, 1, 1, 1,
-1.299515, -1.085475, -3.544255, 1, 1, 1, 1, 1,
-1.294074, 0.9749753, 0.1132682, 1, 1, 1, 1, 1,
-1.28778, 0.3985201, -1.481974, 1, 1, 1, 1, 1,
-1.282743, -0.4122338, -2.059703, 1, 1, 1, 1, 1,
-1.278729, 0.2034814, -1.018995, 1, 1, 1, 1, 1,
-1.278629, -1.01705, -2.051568, 1, 1, 1, 1, 1,
-1.278206, -0.9928049, -2.524513, 1, 1, 1, 1, 1,
-1.277709, 0.4355983, 0.4081067, 1, 1, 1, 1, 1,
-1.272326, -0.2858642, -2.395546, 1, 1, 1, 1, 1,
-1.271518, 0.2758733, -1.259902, 1, 1, 1, 1, 1,
-1.268951, -0.06405291, -1.401647, 1, 1, 1, 1, 1,
-1.265762, -0.1527056, -2.074361, 1, 1, 1, 1, 1,
-1.263339, 0.1310733, -1.152006, 0, 0, 1, 1, 1,
-1.251607, 1.229898, 0.05359454, 1, 0, 0, 1, 1,
-1.243324, 0.3477327, 0.1261624, 1, 0, 0, 1, 1,
-1.232703, 1.650143, -2.432348, 1, 0, 0, 1, 1,
-1.228346, 0.7707402, -1.390323, 1, 0, 0, 1, 1,
-1.22289, -2.160258, -1.76735, 1, 0, 0, 1, 1,
-1.221738, 2.002958, -1.71368, 0, 0, 0, 1, 1,
-1.216929, -0.508349, -1.279958, 0, 0, 0, 1, 1,
-1.214842, -0.1561799, -1.549445, 0, 0, 0, 1, 1,
-1.209057, 0.3298495, -0.5603058, 0, 0, 0, 1, 1,
-1.208534, 0.6522639, -2.126791, 0, 0, 0, 1, 1,
-1.201974, -0.08696186, -3.973971, 0, 0, 0, 1, 1,
-1.196314, 0.0868689, -1.094583, 0, 0, 0, 1, 1,
-1.194569, 0.8163821, -1.453132, 1, 1, 1, 1, 1,
-1.194429, 0.699047, -1.591489, 1, 1, 1, 1, 1,
-1.19414, 1.300035, -2.970577, 1, 1, 1, 1, 1,
-1.19227, -2.012241, -1.183977, 1, 1, 1, 1, 1,
-1.188034, 0.3666241, -3.199861, 1, 1, 1, 1, 1,
-1.186434, -0.1396829, -0.9389793, 1, 1, 1, 1, 1,
-1.182528, 0.4000566, -1.431704, 1, 1, 1, 1, 1,
-1.181272, 0.6162147, -1.38489, 1, 1, 1, 1, 1,
-1.179548, -1.301258, -1.664759, 1, 1, 1, 1, 1,
-1.175222, 0.2960906, -2.809041, 1, 1, 1, 1, 1,
-1.172464, -1.417406, -1.319975, 1, 1, 1, 1, 1,
-1.168255, -0.3832244, -1.824021, 1, 1, 1, 1, 1,
-1.167319, 0.368571, -0.1753048, 1, 1, 1, 1, 1,
-1.167144, -1.35732, -2.968444, 1, 1, 1, 1, 1,
-1.163236, -0.8858277, -1.893995, 1, 1, 1, 1, 1,
-1.163135, 1.101255, -0.7689875, 0, 0, 1, 1, 1,
-1.161633, -1.404389, -1.635713, 1, 0, 0, 1, 1,
-1.157838, -0.5457489, -1.592043, 1, 0, 0, 1, 1,
-1.154323, 1.06441, -2.633934, 1, 0, 0, 1, 1,
-1.152361, 0.6759415, -1.673614, 1, 0, 0, 1, 1,
-1.148836, -1.245081, -1.833482, 1, 0, 0, 1, 1,
-1.133977, -1.050533, -3.042568, 0, 0, 0, 1, 1,
-1.13168, -0.9058582, -0.8065043, 0, 0, 0, 1, 1,
-1.111465, -0.6702929, -2.304465, 0, 0, 0, 1, 1,
-1.104729, 0.7980875, -1.288086, 0, 0, 0, 1, 1,
-1.09499, -1.039747, -4.836205, 0, 0, 0, 1, 1,
-1.091516, 1.273315, -1.734549, 0, 0, 0, 1, 1,
-1.090463, 0.0679093, -1.293279, 0, 0, 0, 1, 1,
-1.0836, 0.05950239, 0.09409031, 1, 1, 1, 1, 1,
-1.079575, 1.463057, -0.7631323, 1, 1, 1, 1, 1,
-1.069736, 0.2642525, 0.7411937, 1, 1, 1, 1, 1,
-1.067212, -0.3609942, -3.201431, 1, 1, 1, 1, 1,
-1.064343, -0.3327652, -2.763519, 1, 1, 1, 1, 1,
-1.06312, -1.292776, -3.041256, 1, 1, 1, 1, 1,
-1.062194, 0.07077402, -1.979049, 1, 1, 1, 1, 1,
-1.062012, -0.001578445, -2.068645, 1, 1, 1, 1, 1,
-1.056186, 0.1156934, -2.336703, 1, 1, 1, 1, 1,
-1.056041, 1.035841, -0.1342831, 1, 1, 1, 1, 1,
-1.054201, 1.435712, 0.08249778, 1, 1, 1, 1, 1,
-1.051296, 0.06090094, -1.494151, 1, 1, 1, 1, 1,
-1.045392, -2.19909, -2.303906, 1, 1, 1, 1, 1,
-1.044875, -0.5811102, -5.565159, 1, 1, 1, 1, 1,
-1.039127, -0.05531748, -1.662545, 1, 1, 1, 1, 1,
-1.038332, 0.6413431, 1.626173, 0, 0, 1, 1, 1,
-1.033969, -1.544442, -3.797655, 1, 0, 0, 1, 1,
-1.029743, -1.19919, -1.752533, 1, 0, 0, 1, 1,
-1.026986, -0.4194093, -0.6395962, 1, 0, 0, 1, 1,
-1.022278, 0.3595624, -0.4312032, 1, 0, 0, 1, 1,
-1.016835, 1.186436, -0.8571734, 1, 0, 0, 1, 1,
-1.012295, 1.410453, -0.3546789, 0, 0, 0, 1, 1,
-1.010497, 0.3225653, -0.02648351, 0, 0, 0, 1, 1,
-1.002917, -0.8949689, -2.885, 0, 0, 0, 1, 1,
-0.9909811, 1.526734, -1.728573, 0, 0, 0, 1, 1,
-0.9906793, -0.10128, -1.027746, 0, 0, 0, 1, 1,
-0.9874836, -0.7985095, -2.814155, 0, 0, 0, 1, 1,
-0.9754416, -0.6236899, -1.854305, 0, 0, 0, 1, 1,
-0.974688, 0.7021155, 0.7067283, 1, 1, 1, 1, 1,
-0.974181, 0.5654197, -0.8619035, 1, 1, 1, 1, 1,
-0.9709612, -0.005621079, -1.675257, 1, 1, 1, 1, 1,
-0.9701714, -0.4023803, -2.618757, 1, 1, 1, 1, 1,
-0.9678025, -0.8823959, -1.823055, 1, 1, 1, 1, 1,
-0.9674344, -0.2469503, -3.479525, 1, 1, 1, 1, 1,
-0.9669051, -2.412696, -3.625063, 1, 1, 1, 1, 1,
-0.966726, 0.1117279, -2.110337, 1, 1, 1, 1, 1,
-0.9623773, 0.948853, -1.460848, 1, 1, 1, 1, 1,
-0.962154, 1.660005, -0.8705021, 1, 1, 1, 1, 1,
-0.9581167, -0.9755193, -2.996211, 1, 1, 1, 1, 1,
-0.9453138, 0.5337738, -1.648753, 1, 1, 1, 1, 1,
-0.9438915, -0.1172807, -2.37143, 1, 1, 1, 1, 1,
-0.9434534, -1.374914, -4.158858, 1, 1, 1, 1, 1,
-0.9401955, 0.5158271, 0.5538116, 1, 1, 1, 1, 1,
-0.937301, -2.52216, -4.088414, 0, 0, 1, 1, 1,
-0.9329876, 1.247207, 0.8128244, 1, 0, 0, 1, 1,
-0.9310346, -1.02067, -2.293797, 1, 0, 0, 1, 1,
-0.9277777, -0.4441262, -3.113506, 1, 0, 0, 1, 1,
-0.9244912, 0.3957532, -0.718459, 1, 0, 0, 1, 1,
-0.9203959, 1.547737, 0.3796467, 1, 0, 0, 1, 1,
-0.9181781, 0.5947943, -1.131851, 0, 0, 0, 1, 1,
-0.9144909, -0.9964608, -2.200757, 0, 0, 0, 1, 1,
-0.9113514, 0.2906412, -1.508593, 0, 0, 0, 1, 1,
-0.9106258, -2.031259, -2.231946, 0, 0, 0, 1, 1,
-0.9016127, -1.116533, -1.66956, 0, 0, 0, 1, 1,
-0.9010193, -0.5407495, -2.312986, 0, 0, 0, 1, 1,
-0.8975961, -0.8857145, -2.313508, 0, 0, 0, 1, 1,
-0.8972942, -0.3904943, -1.2876, 1, 1, 1, 1, 1,
-0.8968078, 0.4831309, -2.218597, 1, 1, 1, 1, 1,
-0.8951428, 0.7084649, -1.667622, 1, 1, 1, 1, 1,
-0.8939722, -0.04956183, 0.5614963, 1, 1, 1, 1, 1,
-0.8930648, 0.09321843, -0.7097886, 1, 1, 1, 1, 1,
-0.8916071, 0.06571163, 0.1188581, 1, 1, 1, 1, 1,
-0.8849208, 1.162801, -2.254156, 1, 1, 1, 1, 1,
-0.8837761, -0.3568647, -2.005094, 1, 1, 1, 1, 1,
-0.8757297, -1.501717, -3.067213, 1, 1, 1, 1, 1,
-0.8700153, -1.459756, -2.410888, 1, 1, 1, 1, 1,
-0.8662391, 0.04645581, -1.669232, 1, 1, 1, 1, 1,
-0.8577594, -0.1950987, -2.096846, 1, 1, 1, 1, 1,
-0.8568509, 0.3292237, 0.05856168, 1, 1, 1, 1, 1,
-0.8556835, 0.5771376, 0.8202578, 1, 1, 1, 1, 1,
-0.8545347, 0.0928231, -2.682161, 1, 1, 1, 1, 1,
-0.8439106, -0.8226983, -2.097279, 0, 0, 1, 1, 1,
-0.8241532, 0.8256781, 1.123962, 1, 0, 0, 1, 1,
-0.8237572, -0.6353459, -0.8918055, 1, 0, 0, 1, 1,
-0.8220062, 1.058354, -2.667069, 1, 0, 0, 1, 1,
-0.8202943, 0.2961398, -2.137246, 1, 0, 0, 1, 1,
-0.8165408, 0.3952211, -2.226976, 1, 0, 0, 1, 1,
-0.8133228, -1.496531, -4.148109, 0, 0, 0, 1, 1,
-0.8126115, 1.415189, 0.7985739, 0, 0, 0, 1, 1,
-0.8125668, 2.115454, -0.2365392, 0, 0, 0, 1, 1,
-0.8123349, -1.592762, -3.735771, 0, 0, 0, 1, 1,
-0.8100718, -0.5097919, -2.331896, 0, 0, 0, 1, 1,
-0.8089824, -0.01491366, -0.9112783, 0, 0, 0, 1, 1,
-0.8031151, 1.212908, 0.6850775, 0, 0, 0, 1, 1,
-0.8014365, -1.030356, -3.595909, 1, 1, 1, 1, 1,
-0.8005235, 0.4777942, 0.544518, 1, 1, 1, 1, 1,
-0.8004981, 0.7165912, -0.4922599, 1, 1, 1, 1, 1,
-0.7969574, 0.839529, -1.453185, 1, 1, 1, 1, 1,
-0.7946774, -0.694096, -2.571776, 1, 1, 1, 1, 1,
-0.7913554, 0.246574, -2.132927, 1, 1, 1, 1, 1,
-0.7880887, 0.01201433, -1.029574, 1, 1, 1, 1, 1,
-0.7869478, 0.2091857, -0.03715401, 1, 1, 1, 1, 1,
-0.7852911, 1.345633, -1.596658, 1, 1, 1, 1, 1,
-0.7817676, -1.197632, -2.586996, 1, 1, 1, 1, 1,
-0.7781622, -1.125068, -2.485867, 1, 1, 1, 1, 1,
-0.7762539, 0.8945606, -0.2131434, 1, 1, 1, 1, 1,
-0.7761632, -0.3255597, -1.06721, 1, 1, 1, 1, 1,
-0.7710195, 1.914482, -0.1445297, 1, 1, 1, 1, 1,
-0.7696015, -1.165549, -2.364054, 1, 1, 1, 1, 1,
-0.7683777, -0.2359513, -1.537743, 0, 0, 1, 1, 1,
-0.7682244, -1.75219, -3.611017, 1, 0, 0, 1, 1,
-0.7677162, 0.489985, -0.6038588, 1, 0, 0, 1, 1,
-0.7607078, 0.02943157, -1.992356, 1, 0, 0, 1, 1,
-0.7538953, -1.053537, -2.190599, 1, 0, 0, 1, 1,
-0.7505414, 1.531, -1.491814, 1, 0, 0, 1, 1,
-0.7491974, -0.07117548, -1.83647, 0, 0, 0, 1, 1,
-0.7443101, 0.6509454, -1.52985, 0, 0, 0, 1, 1,
-0.7392411, 1.537835, 0.6395009, 0, 0, 0, 1, 1,
-0.7385892, 0.4894235, -1.456546, 0, 0, 0, 1, 1,
-0.7337361, 1.030914, -0.05304994, 0, 0, 0, 1, 1,
-0.7226289, 0.6932997, -1.249068, 0, 0, 0, 1, 1,
-0.7199129, -1.775045, -1.91223, 0, 0, 0, 1, 1,
-0.7162135, 1.055675, 1.081871, 1, 1, 1, 1, 1,
-0.713909, -0.3659624, -1.64193, 1, 1, 1, 1, 1,
-0.710883, 1.26225, -1.638565, 1, 1, 1, 1, 1,
-0.7100703, -0.217822, -2.64468, 1, 1, 1, 1, 1,
-0.7071995, 0.2345812, 0.6347232, 1, 1, 1, 1, 1,
-0.6844925, -0.7028562, -3.246611, 1, 1, 1, 1, 1,
-0.6774397, -0.8975269, -2.810551, 1, 1, 1, 1, 1,
-0.6760194, 1.415837, -0.06491795, 1, 1, 1, 1, 1,
-0.6755885, -1.03314, -1.19672, 1, 1, 1, 1, 1,
-0.6743472, 0.3081481, -0.5939509, 1, 1, 1, 1, 1,
-0.6736487, -0.2997339, -3.136842, 1, 1, 1, 1, 1,
-0.669263, 0.02603502, -2.233811, 1, 1, 1, 1, 1,
-0.6635079, 2.10135, -0.04668718, 1, 1, 1, 1, 1,
-0.6567967, -1.488539, -2.42015, 1, 1, 1, 1, 1,
-0.6566997, -1.001945, -3.239114, 1, 1, 1, 1, 1,
-0.65446, 1.827854, -0.9015445, 0, 0, 1, 1, 1,
-0.6523916, 0.0228504, -1.510232, 1, 0, 0, 1, 1,
-0.6462939, 2.155398, -2.056345, 1, 0, 0, 1, 1,
-0.6440061, -0.3342274, -2.752169, 1, 0, 0, 1, 1,
-0.6435001, 2.789103, -0.9385799, 1, 0, 0, 1, 1,
-0.6431649, -1.693259, -2.774791, 1, 0, 0, 1, 1,
-0.6431357, 0.001711965, -2.199515, 0, 0, 0, 1, 1,
-0.6403208, -0.07722435, 0.2979739, 0, 0, 0, 1, 1,
-0.6381099, -0.6162819, -1.363885, 0, 0, 0, 1, 1,
-0.6340864, -0.5781323, -1.758052, 0, 0, 0, 1, 1,
-0.6332639, 0.02282675, -0.1694946, 0, 0, 0, 1, 1,
-0.6320568, 1.231909, -0.5863655, 0, 0, 0, 1, 1,
-0.6278835, 1.58212, 0.4706803, 0, 0, 0, 1, 1,
-0.6278764, 0.7989876, -1.122103, 1, 1, 1, 1, 1,
-0.6261294, -0.3806953, -0.8525233, 1, 1, 1, 1, 1,
-0.6235813, 0.03723259, -0.9071332, 1, 1, 1, 1, 1,
-0.6215022, 1.298013, -0.8972201, 1, 1, 1, 1, 1,
-0.6150531, 1.429211, -0.1191404, 1, 1, 1, 1, 1,
-0.6147414, -1.019098, -2.749031, 1, 1, 1, 1, 1,
-0.6134611, -0.6660477, -2.9927, 1, 1, 1, 1, 1,
-0.6121677, -0.4522074, -2.451639, 1, 1, 1, 1, 1,
-0.6119236, -1.249344, -3.539091, 1, 1, 1, 1, 1,
-0.6112444, -0.6216173, -1.75898, 1, 1, 1, 1, 1,
-0.610611, -1.810308, -3.381936, 1, 1, 1, 1, 1,
-0.6075458, -1.173863, -2.085727, 1, 1, 1, 1, 1,
-0.6003563, -0.159345, -2.949957, 1, 1, 1, 1, 1,
-0.5986254, 0.6199356, -1.234957, 1, 1, 1, 1, 1,
-0.5975209, -1.046179, -2.711461, 1, 1, 1, 1, 1,
-0.5961197, -1.038446, -3.050558, 0, 0, 1, 1, 1,
-0.5837548, -0.7796023, -2.887019, 1, 0, 0, 1, 1,
-0.5803489, -0.9218042, -2.063564, 1, 0, 0, 1, 1,
-0.5718802, -0.04431556, -2.759627, 1, 0, 0, 1, 1,
-0.5702139, 0.3853225, -2.183668, 1, 0, 0, 1, 1,
-0.5633836, 1.730456, -0.6108505, 1, 0, 0, 1, 1,
-0.5628014, 0.1223343, -0.4255001, 0, 0, 0, 1, 1,
-0.5622665, -0.1206775, -0.004638717, 0, 0, 0, 1, 1,
-0.5596074, 0.1913818, -1.222213, 0, 0, 0, 1, 1,
-0.55942, 0.5484579, -1.808954, 0, 0, 0, 1, 1,
-0.5573159, 0.9444963, 0.4934586, 0, 0, 0, 1, 1,
-0.5377908, 0.3230371, -0.368656, 0, 0, 0, 1, 1,
-0.5340365, 0.3466197, -1.13535, 0, 0, 0, 1, 1,
-0.5236473, 0.2474987, -1.502213, 1, 1, 1, 1, 1,
-0.5209862, 0.9766189, -0.4098749, 1, 1, 1, 1, 1,
-0.5189267, 1.378248, -1.458147, 1, 1, 1, 1, 1,
-0.5181534, -0.1470753, -2.132909, 1, 1, 1, 1, 1,
-0.5181026, -0.8142279, -3.92766, 1, 1, 1, 1, 1,
-0.5149569, 0.3154223, -0.81826, 1, 1, 1, 1, 1,
-0.5142431, -1.329491, -2.969009, 1, 1, 1, 1, 1,
-0.5107536, 1.161681, -1.732545, 1, 1, 1, 1, 1,
-0.5105401, -0.7959996, -1.108404, 1, 1, 1, 1, 1,
-0.505941, 0.006287477, -2.898722, 1, 1, 1, 1, 1,
-0.504792, -2.150138, -2.417707, 1, 1, 1, 1, 1,
-0.5041086, 0.9287678, -1.381171, 1, 1, 1, 1, 1,
-0.4904408, -0.1696355, -0.3465903, 1, 1, 1, 1, 1,
-0.4887217, 0.5930541, -1.05867, 1, 1, 1, 1, 1,
-0.4835522, -1.119297, -3.017597, 1, 1, 1, 1, 1,
-0.4777601, 0.1235, -0.4871566, 0, 0, 1, 1, 1,
-0.4753821, -0.37473, -3.336535, 1, 0, 0, 1, 1,
-0.4664805, 1.098908, 1.510054, 1, 0, 0, 1, 1,
-0.4663608, -0.3291177, -3.052948, 1, 0, 0, 1, 1,
-0.4638066, 0.009005234, 0.3154705, 1, 0, 0, 1, 1,
-0.4584658, -0.5665707, -1.96363, 1, 0, 0, 1, 1,
-0.45744, -0.3020295, -1.458689, 0, 0, 0, 1, 1,
-0.450533, 0.02384454, -2.781315, 0, 0, 0, 1, 1,
-0.4500208, 0.2805122, -0.3868111, 0, 0, 0, 1, 1,
-0.4474075, -0.7128008, -2.880408, 0, 0, 0, 1, 1,
-0.446943, 1.845904, -1.241576, 0, 0, 0, 1, 1,
-0.4450309, -0.453551, -4.195786, 0, 0, 0, 1, 1,
-0.4423823, -0.03768103, -2.709568, 0, 0, 0, 1, 1,
-0.4411815, -1.087422, -2.001868, 1, 1, 1, 1, 1,
-0.4408507, 0.8536588, 1.118839, 1, 1, 1, 1, 1,
-0.437629, -0.5059312, -3.362821, 1, 1, 1, 1, 1,
-0.4375024, 1.244998, 0.5488985, 1, 1, 1, 1, 1,
-0.4323495, -0.8540525, -3.089529, 1, 1, 1, 1, 1,
-0.4322319, -0.6364672, -2.519928, 1, 1, 1, 1, 1,
-0.4300483, 0.6181433, -0.6983899, 1, 1, 1, 1, 1,
-0.4268427, 2.061454, -0.1003509, 1, 1, 1, 1, 1,
-0.4255655, 0.4201579, -1.43826, 1, 1, 1, 1, 1,
-0.4230627, 0.6838201, -0.2242733, 1, 1, 1, 1, 1,
-0.4226639, -0.5970181, -2.263515, 1, 1, 1, 1, 1,
-0.4225455, -0.2344715, -0.6719941, 1, 1, 1, 1, 1,
-0.417642, -0.8150056, -4.206305, 1, 1, 1, 1, 1,
-0.4152024, 0.4502993, -1.615391, 1, 1, 1, 1, 1,
-0.4145256, -0.4317415, -2.920378, 1, 1, 1, 1, 1,
-0.4120864, -0.08904438, -3.00815, 0, 0, 1, 1, 1,
-0.4119121, 1.866959, -1.351189, 1, 0, 0, 1, 1,
-0.4117924, -1.075377, -4.226745, 1, 0, 0, 1, 1,
-0.4112156, 0.4706208, -2.686052, 1, 0, 0, 1, 1,
-0.4106984, 1.801466, 0.7351124, 1, 0, 0, 1, 1,
-0.4097553, -1.847426, -2.915326, 1, 0, 0, 1, 1,
-0.409096, -0.0004102558, -1.428783, 0, 0, 0, 1, 1,
-0.3989097, -0.796802, -2.913757, 0, 0, 0, 1, 1,
-0.3974974, 0.990501, 0.05823137, 0, 0, 0, 1, 1,
-0.3943307, -0.7034007, -3.357878, 0, 0, 0, 1, 1,
-0.3921768, -1.402859, -3.041758, 0, 0, 0, 1, 1,
-0.3892128, -0.9261106, -4.298193, 0, 0, 0, 1, 1,
-0.3888621, -0.5141652, -2.504198, 0, 0, 0, 1, 1,
-0.3876025, -0.7267523, -2.987897, 1, 1, 1, 1, 1,
-0.3866626, 0.931526, -1.360253, 1, 1, 1, 1, 1,
-0.3834468, -0.1960356, -0.8432353, 1, 1, 1, 1, 1,
-0.3797993, 0.3680253, 0.02164473, 1, 1, 1, 1, 1,
-0.374207, 1.265973, 1.122706, 1, 1, 1, 1, 1,
-0.3722788, 0.9357014, -0.5806018, 1, 1, 1, 1, 1,
-0.3702252, 0.1979799, -1.681645, 1, 1, 1, 1, 1,
-0.367192, 0.276243, -0.7171124, 1, 1, 1, 1, 1,
-0.3671852, -1.241237, -3.623981, 1, 1, 1, 1, 1,
-0.3667285, 0.1027427, -1.100776, 1, 1, 1, 1, 1,
-0.3638806, 0.3151899, -2.221684, 1, 1, 1, 1, 1,
-0.3540306, -0.8997032, -2.953287, 1, 1, 1, 1, 1,
-0.3421551, -0.3828354, -3.349635, 1, 1, 1, 1, 1,
-0.3416533, 0.5472122, -0.260715, 1, 1, 1, 1, 1,
-0.3404658, 2.579194, -0.9808055, 1, 1, 1, 1, 1,
-0.3361288, -0.9048781, -1.513687, 0, 0, 1, 1, 1,
-0.3343213, 0.01521042, -0.7337392, 1, 0, 0, 1, 1,
-0.333952, 0.2681155, -1.830718, 1, 0, 0, 1, 1,
-0.3265134, 0.4485401, -1.399842, 1, 0, 0, 1, 1,
-0.3255514, -1.033152, -2.233789, 1, 0, 0, 1, 1,
-0.3254145, -0.9336945, -0.918679, 1, 0, 0, 1, 1,
-0.3182596, 1.55261, -1.564962, 0, 0, 0, 1, 1,
-0.3166606, 0.4148141, 0.2302265, 0, 0, 0, 1, 1,
-0.2994241, 0.7317011, -2.168544, 0, 0, 0, 1, 1,
-0.292816, -1.074188, -2.94132, 0, 0, 0, 1, 1,
-0.2919348, -0.3098687, -2.917212, 0, 0, 0, 1, 1,
-0.290016, 1.134229, 0.6970251, 0, 0, 0, 1, 1,
-0.2895437, -0.9796492, -0.2120654, 0, 0, 0, 1, 1,
-0.2883817, -1.203574, -2.848394, 1, 1, 1, 1, 1,
-0.2848013, -0.7441346, -1.679961, 1, 1, 1, 1, 1,
-0.2846399, -0.8129763, -3.653656, 1, 1, 1, 1, 1,
-0.2778871, -0.2822875, -1.593877, 1, 1, 1, 1, 1,
-0.2752773, 1.53602, -0.9612175, 1, 1, 1, 1, 1,
-0.2738026, 0.1809736, -1.367515, 1, 1, 1, 1, 1,
-0.2701793, 0.9299846, -0.8999333, 1, 1, 1, 1, 1,
-0.2665948, 0.03407192, -2.306286, 1, 1, 1, 1, 1,
-0.2651373, -0.8806357, -2.057915, 1, 1, 1, 1, 1,
-0.2609158, -0.3647996, -3.301125, 1, 1, 1, 1, 1,
-0.2565628, -0.7877888, -1.431685, 1, 1, 1, 1, 1,
-0.2539237, -0.2898855, -1.12355, 1, 1, 1, 1, 1,
-0.2498324, 1.023966, -0.2722991, 1, 1, 1, 1, 1,
-0.2474149, 1.474824, 0.6503505, 1, 1, 1, 1, 1,
-0.2446445, -0.1291074, -1.24926, 1, 1, 1, 1, 1,
-0.243496, 1.905793, -0.7929595, 0, 0, 1, 1, 1,
-0.2427349, 0.06739794, -0.8741677, 1, 0, 0, 1, 1,
-0.2414824, 0.6442706, -0.2841303, 1, 0, 0, 1, 1,
-0.2314821, 1.376628, 1.479214, 1, 0, 0, 1, 1,
-0.2280854, -0.7033542, -3.340626, 1, 0, 0, 1, 1,
-0.227601, -0.3546436, -3.272485, 1, 0, 0, 1, 1,
-0.2264914, 0.361769, 0.1741309, 0, 0, 0, 1, 1,
-0.2254794, -1.609827, -0.4198943, 0, 0, 0, 1, 1,
-0.224593, 0.5830883, -0.4467495, 0, 0, 0, 1, 1,
-0.2195661, -0.9176761, -1.265071, 0, 0, 0, 1, 1,
-0.2161094, -0.06984675, -1.067425, 0, 0, 0, 1, 1,
-0.2095905, 0.4417806, -0.8967579, 0, 0, 0, 1, 1,
-0.2068141, 2.536645, 1.056408, 0, 0, 0, 1, 1,
-0.2030669, -1.375908, -2.062583, 1, 1, 1, 1, 1,
-0.2002479, 1.520232, -0.04956893, 1, 1, 1, 1, 1,
-0.1977044, 0.1507877, -2.041463, 1, 1, 1, 1, 1,
-0.1962867, 0.7833636, -0.1043879, 1, 1, 1, 1, 1,
-0.1955885, 1.094611, 0.2305461, 1, 1, 1, 1, 1,
-0.1930854, -1.937591, -3.469788, 1, 1, 1, 1, 1,
-0.1915255, 0.6349882, -1.486859, 1, 1, 1, 1, 1,
-0.189903, -1.272965, -3.625379, 1, 1, 1, 1, 1,
-0.1841999, 1.129963, 0.02388685, 1, 1, 1, 1, 1,
-0.1731273, -1.914135, -2.512617, 1, 1, 1, 1, 1,
-0.1704228, -1.127619, -3.950038, 1, 1, 1, 1, 1,
-0.1684004, -0.3483329, -3.471189, 1, 1, 1, 1, 1,
-0.1660637, -0.7133968, -2.403454, 1, 1, 1, 1, 1,
-0.1659286, -1.646057, -2.598938, 1, 1, 1, 1, 1,
-0.1637886, 0.4416511, 1.931989, 1, 1, 1, 1, 1,
-0.1635863, 0.8593186, -1.607725, 0, 0, 1, 1, 1,
-0.1600791, -1.220374, -4.450515, 1, 0, 0, 1, 1,
-0.1540831, -1.41987, -3.738899, 1, 0, 0, 1, 1,
-0.1508066, -1.849174, -2.301409, 1, 0, 0, 1, 1,
-0.1502681, -2.009314, -3.440736, 1, 0, 0, 1, 1,
-0.1485376, 0.9306611, -2.38106, 1, 0, 0, 1, 1,
-0.1477294, 0.2554326, -0.4289075, 0, 0, 0, 1, 1,
-0.141202, 0.7720463, -0.1275181, 0, 0, 0, 1, 1,
-0.1348946, 0.1407921, -1.735323, 0, 0, 0, 1, 1,
-0.1347281, -0.7263645, -1.114678, 0, 0, 0, 1, 1,
-0.1339172, -0.6107812, -3.972851, 0, 0, 0, 1, 1,
-0.1319643, -1.476093, -2.343723, 0, 0, 0, 1, 1,
-0.1291045, -0.2808267, -3.025998, 0, 0, 0, 1, 1,
-0.1287536, 0.09893052, -0.4425188, 1, 1, 1, 1, 1,
-0.1276839, -0.4423322, -3.107383, 1, 1, 1, 1, 1,
-0.1270496, 2.17117, 0.3528718, 1, 1, 1, 1, 1,
-0.1249518, 1.044804, 1.055735, 1, 1, 1, 1, 1,
-0.1246803, -2.033831, -2.609616, 1, 1, 1, 1, 1,
-0.1202324, 1.047416, -0.3942937, 1, 1, 1, 1, 1,
-0.1191674, -1.040415, -0.466491, 1, 1, 1, 1, 1,
-0.1185799, -0.293035, -2.002528, 1, 1, 1, 1, 1,
-0.1157763, -0.4898453, -1.607302, 1, 1, 1, 1, 1,
-0.1141008, 1.319227, 0.9255487, 1, 1, 1, 1, 1,
-0.1140756, 1.953698, -0.2850888, 1, 1, 1, 1, 1,
-0.1126788, -1.080941, -4.80409, 1, 1, 1, 1, 1,
-0.1094134, 0.3426246, -2.428895, 1, 1, 1, 1, 1,
-0.1076841, -0.3642278, -2.04186, 1, 1, 1, 1, 1,
-0.1062536, 0.01040006, -3.228487, 1, 1, 1, 1, 1,
-0.1045759, 0.850593, -0.8404199, 0, 0, 1, 1, 1,
-0.1034563, 0.7036653, -0.08999842, 1, 0, 0, 1, 1,
-0.1031161, -0.5476931, -4.899954, 1, 0, 0, 1, 1,
-0.1030218, 0.9970706, -1.195794, 1, 0, 0, 1, 1,
-0.102793, 0.6422135, -0.2928718, 1, 0, 0, 1, 1,
-0.09898809, -0.4323564, -1.393639, 1, 0, 0, 1, 1,
-0.09097185, -2.296026, -3.926388, 0, 0, 0, 1, 1,
-0.08828754, -0.8184048, -3.79101, 0, 0, 0, 1, 1,
-0.08773603, 0.102183, -0.442922, 0, 0, 0, 1, 1,
-0.08666733, 0.9178768, 0.7119767, 0, 0, 0, 1, 1,
-0.08579264, -1.203733, -1.397876, 0, 0, 0, 1, 1,
-0.08491688, -0.8901184, -1.112051, 0, 0, 0, 1, 1,
-0.08330225, -0.1675754, -4.400645, 0, 0, 0, 1, 1,
-0.08068995, -0.2812317, -3.763687, 1, 1, 1, 1, 1,
-0.07865187, 0.1666116, 0.7921027, 1, 1, 1, 1, 1,
-0.07529915, -0.3499397, -1.721997, 1, 1, 1, 1, 1,
-0.07426016, -0.4251621, -1.616731, 1, 1, 1, 1, 1,
-0.07338738, -0.1259304, -3.668163, 1, 1, 1, 1, 1,
-0.07220927, 0.2507384, 0.2377962, 1, 1, 1, 1, 1,
-0.06898809, 0.1095325, -0.724201, 1, 1, 1, 1, 1,
-0.06558074, 1.104846, -0.477733, 1, 1, 1, 1, 1,
-0.06515398, -0.3058329, -1.292024, 1, 1, 1, 1, 1,
-0.05891993, -1.880877, -3.351433, 1, 1, 1, 1, 1,
-0.05305993, 0.1824078, 0.1075082, 1, 1, 1, 1, 1,
-0.05283074, 0.8590821, 0.4535109, 1, 1, 1, 1, 1,
-0.04518355, -2.085961, -1.883316, 1, 1, 1, 1, 1,
-0.04489886, -0.2904535, -3.967579, 1, 1, 1, 1, 1,
-0.04389508, -2.170456, -3.376081, 1, 1, 1, 1, 1,
-0.04383764, -0.1873229, -3.193027, 0, 0, 1, 1, 1,
-0.0414044, 1.567929, -0.272676, 1, 0, 0, 1, 1,
-0.04010123, -0.7526932, -3.233758, 1, 0, 0, 1, 1,
-0.03957177, 0.0108887, -3.538453, 1, 0, 0, 1, 1,
-0.03889782, 0.4739705, -0.6381602, 1, 0, 0, 1, 1,
-0.03666178, 1.753642, 0.3829945, 1, 0, 0, 1, 1,
-0.03586726, -0.8756735, -3.250697, 0, 0, 0, 1, 1,
-0.03493095, -0.4823739, -3.627885, 0, 0, 0, 1, 1,
-0.03436768, -1.9222, -2.954381, 0, 0, 0, 1, 1,
-0.0343676, 0.9291997, 0.2005798, 0, 0, 0, 1, 1,
-0.03110408, 0.7731655, -1.046971, 0, 0, 0, 1, 1,
-0.02579117, -1.252941, -1.434348, 0, 0, 0, 1, 1,
-0.02199754, 0.7322307, -0.282631, 0, 0, 0, 1, 1,
-0.02195766, 1.602674, -0.3276513, 1, 1, 1, 1, 1,
-0.02137462, -0.5200303, -2.227567, 1, 1, 1, 1, 1,
-0.021097, -0.2465738, -3.355361, 1, 1, 1, 1, 1,
-0.01961973, -1.556682, -3.561503, 1, 1, 1, 1, 1,
-0.01874973, 0.6486265, -0.1797013, 1, 1, 1, 1, 1,
-0.01808168, -2.332414, -2.763484, 1, 1, 1, 1, 1,
-0.01714518, 0.0568692, -2.754963, 1, 1, 1, 1, 1,
-0.01430793, -0.2581042, -3.550562, 1, 1, 1, 1, 1,
-0.008330278, 0.261142, 0.6316755, 1, 1, 1, 1, 1,
-0.007754921, -0.6347682, -1.589517, 1, 1, 1, 1, 1,
0.0006476931, 0.3920423, -0.3389227, 1, 1, 1, 1, 1,
0.002345286, -0.809541, 2.996464, 1, 1, 1, 1, 1,
0.005705197, 0.6028083, 1.03327, 1, 1, 1, 1, 1,
0.007328132, -0.3192211, 3.214418, 1, 1, 1, 1, 1,
0.01327112, 0.1569583, 0.4311325, 1, 1, 1, 1, 1,
0.01705482, 1.41152, -0.9982085, 0, 0, 1, 1, 1,
0.03035742, 1.380221, -0.8995253, 1, 0, 0, 1, 1,
0.0336339, 0.4859231, -0.6496179, 1, 0, 0, 1, 1,
0.03602453, -0.928044, 1.439353, 1, 0, 0, 1, 1,
0.03966738, 0.2209755, 1.141484, 1, 0, 0, 1, 1,
0.04128096, -0.6303663, 3.602311, 1, 0, 0, 1, 1,
0.04261115, 0.5425935, -1.32288, 0, 0, 0, 1, 1,
0.04759018, -0.8893093, 3.746107, 0, 0, 0, 1, 1,
0.04819357, 0.3445669, 0.1233812, 0, 0, 0, 1, 1,
0.04823193, 0.5095741, 1.071489, 0, 0, 0, 1, 1,
0.04853653, 0.4268044, 0.4345748, 0, 0, 0, 1, 1,
0.05037025, 0.5934138, -0.6426447, 0, 0, 0, 1, 1,
0.05393206, -2.387505, 4.202587, 0, 0, 0, 1, 1,
0.05715461, -0.4137653, 1.891042, 1, 1, 1, 1, 1,
0.05852583, 2.40483, -0.9356863, 1, 1, 1, 1, 1,
0.06033752, 0.5673815, 0.4272076, 1, 1, 1, 1, 1,
0.06110267, 1.219055, 1.220566, 1, 1, 1, 1, 1,
0.06125503, 1.24985, 0.7389359, 1, 1, 1, 1, 1,
0.06465799, -0.4900423, 4.083257, 1, 1, 1, 1, 1,
0.06674349, 2.116514, -0.5147108, 1, 1, 1, 1, 1,
0.06909765, -0.1159666, 2.608924, 1, 1, 1, 1, 1,
0.07038676, 0.7177905, -0.4232256, 1, 1, 1, 1, 1,
0.07138214, -1.681287, 3.969388, 1, 1, 1, 1, 1,
0.07252045, -1.927085, 3.486057, 1, 1, 1, 1, 1,
0.07674028, -1.516388, 3.09561, 1, 1, 1, 1, 1,
0.07937545, 2.902039, -1.313783, 1, 1, 1, 1, 1,
0.08909867, -0.1849944, 4.486395, 1, 1, 1, 1, 1,
0.09023041, 0.453523, -1.129495, 1, 1, 1, 1, 1,
0.09392548, -1.363978, 4.406601, 0, 0, 1, 1, 1,
0.09502986, -1.654302, 2.794752, 1, 0, 0, 1, 1,
0.09872209, -3.17802, 2.876602, 1, 0, 0, 1, 1,
0.09880068, -0.2115172, 4.123254, 1, 0, 0, 1, 1,
0.09907144, -0.2639461, 2.048257, 1, 0, 0, 1, 1,
0.1024264, 1.052857, 0.9862808, 1, 0, 0, 1, 1,
0.102475, 0.7747011, 0.303997, 0, 0, 0, 1, 1,
0.1029768, -0.2429803, 4.721349, 0, 0, 0, 1, 1,
0.1115698, -3.021544, 2.54878, 0, 0, 0, 1, 1,
0.1135737, 0.5962777, 0.04161347, 0, 0, 0, 1, 1,
0.1188401, -0.4456044, 2.872919, 0, 0, 0, 1, 1,
0.1223903, 0.7840923, 0.9595252, 0, 0, 0, 1, 1,
0.125804, -0.9806166, 2.047485, 0, 0, 0, 1, 1,
0.127997, 0.6651137, -0.09658396, 1, 1, 1, 1, 1,
0.1308206, 0.08387764, 1.727584, 1, 1, 1, 1, 1,
0.1317603, 0.5075899, -0.4352684, 1, 1, 1, 1, 1,
0.1342524, 0.6593673, 0.424379, 1, 1, 1, 1, 1,
0.1343826, -0.2729741, 1.98864, 1, 1, 1, 1, 1,
0.1346226, 0.1538016, -1.204685, 1, 1, 1, 1, 1,
0.1407327, -0.5202328, 3.067599, 1, 1, 1, 1, 1,
0.1458277, 0.2408285, 1.232548, 1, 1, 1, 1, 1,
0.1461431, -1.469029, 2.80108, 1, 1, 1, 1, 1,
0.1511041, 0.5803774, 0.4519289, 1, 1, 1, 1, 1,
0.1517446, 0.7921208, -0.8414126, 1, 1, 1, 1, 1,
0.1547243, -0.201977, 3.490887, 1, 1, 1, 1, 1,
0.1598853, -0.906044, 2.980467, 1, 1, 1, 1, 1,
0.1607343, -0.8092895, 2.860001, 1, 1, 1, 1, 1,
0.1686665, -0.1406944, 2.394029, 1, 1, 1, 1, 1,
0.1691676, 0.9105921, 0.1859996, 0, 0, 1, 1, 1,
0.1725894, -0.09728578, 1.59798, 1, 0, 0, 1, 1,
0.1728166, 0.4090735, -0.5202354, 1, 0, 0, 1, 1,
0.173939, -0.8871308, 4.380041, 1, 0, 0, 1, 1,
0.1769009, -0.465728, 1.404803, 1, 0, 0, 1, 1,
0.178601, -0.5836162, 1.40513, 1, 0, 0, 1, 1,
0.1860102, -0.6563256, 1.940039, 0, 0, 0, 1, 1,
0.1867189, -0.5055563, 3.282007, 0, 0, 0, 1, 1,
0.1872594, 1.028012, 0.7588232, 0, 0, 0, 1, 1,
0.1926448, -0.4522817, 3.659547, 0, 0, 0, 1, 1,
0.1927145, 1.819059, -0.1300245, 0, 0, 0, 1, 1,
0.1935009, -1.660528, 3.677514, 0, 0, 0, 1, 1,
0.197286, 1.297861, -0.4555875, 0, 0, 0, 1, 1,
0.2037973, -0.627593, 1.887143, 1, 1, 1, 1, 1,
0.2043092, -0.5246701, 2.295371, 1, 1, 1, 1, 1,
0.2077134, 1.22595, -0.7214121, 1, 1, 1, 1, 1,
0.2092177, -0.3578589, 2.894162, 1, 1, 1, 1, 1,
0.2100758, 1.069943, 0.6772174, 1, 1, 1, 1, 1,
0.2109901, -0.9447062, 1.602848, 1, 1, 1, 1, 1,
0.2128601, 0.3394848, 0.1078305, 1, 1, 1, 1, 1,
0.2142945, 1.160681, 1.147981, 1, 1, 1, 1, 1,
0.2211988, -0.8213733, 2.095321, 1, 1, 1, 1, 1,
0.2267417, -0.5173055, 2.662775, 1, 1, 1, 1, 1,
0.2279369, -1.459492, 4.701414, 1, 1, 1, 1, 1,
0.2317301, -2.049453, 1.640731, 1, 1, 1, 1, 1,
0.2359107, -0.8228878, 2.375302, 1, 1, 1, 1, 1,
0.2468735, 0.2682305, -0.8566242, 1, 1, 1, 1, 1,
0.2615001, 0.87325, 0.2070811, 1, 1, 1, 1, 1,
0.2624415, 0.568866, 0.9648337, 0, 0, 1, 1, 1,
0.2705541, 1.382703, 0.7084947, 1, 0, 0, 1, 1,
0.2726232, -1.06861, 4.062066, 1, 0, 0, 1, 1,
0.2741795, 0.4435337, 1.517427, 1, 0, 0, 1, 1,
0.2748043, 0.7497927, -0.3673557, 1, 0, 0, 1, 1,
0.2763636, 1.000418, -0.9653988, 1, 0, 0, 1, 1,
0.2764513, -0.1074574, 1.574824, 0, 0, 0, 1, 1,
0.2818717, 1.468082, 1.262076, 0, 0, 0, 1, 1,
0.2826791, -0.3808456, 2.673129, 0, 0, 0, 1, 1,
0.2886161, 0.3213923, 1.274661, 0, 0, 0, 1, 1,
0.2924853, -0.252115, 2.685652, 0, 0, 0, 1, 1,
0.295675, 1.671944, 1.212596, 0, 0, 0, 1, 1,
0.2983112, -0.1275747, 1.187619, 0, 0, 0, 1, 1,
0.2986815, -0.8211412, 1.506538, 1, 1, 1, 1, 1,
0.3059226, 0.6439168, 0.4089041, 1, 1, 1, 1, 1,
0.3065184, 1.091834, 0.02769147, 1, 1, 1, 1, 1,
0.3084233, 1.829743, -2.180307, 1, 1, 1, 1, 1,
0.3085145, 0.1801796, -0.2501589, 1, 1, 1, 1, 1,
0.3104228, -0.6124317, 3.96755, 1, 1, 1, 1, 1,
0.3138537, -1.094459, 2.266965, 1, 1, 1, 1, 1,
0.3157318, 0.4264655, 1.114268, 1, 1, 1, 1, 1,
0.3166045, 0.1491186, 0.1979617, 1, 1, 1, 1, 1,
0.3168028, 0.4858315, 1.511813, 1, 1, 1, 1, 1,
0.317687, -0.3517005, 3.453843, 1, 1, 1, 1, 1,
0.3184268, 1.655946, -1.44858, 1, 1, 1, 1, 1,
0.3211573, -0.6824701, 2.915822, 1, 1, 1, 1, 1,
0.321746, -1.178961, 2.712651, 1, 1, 1, 1, 1,
0.3222849, -1.491389, 2.559772, 1, 1, 1, 1, 1,
0.3234529, -1.986427, 2.356805, 0, 0, 1, 1, 1,
0.324005, -0.1283837, 2.18379, 1, 0, 0, 1, 1,
0.3243711, -2.23349, 3.393744, 1, 0, 0, 1, 1,
0.3257856, 0.06268932, 1.769836, 1, 0, 0, 1, 1,
0.325826, -1.035281, 2.383469, 1, 0, 0, 1, 1,
0.3284675, 1.934087, -1.079513, 1, 0, 0, 1, 1,
0.3358739, -0.5921543, 2.078817, 0, 0, 0, 1, 1,
0.3374193, -0.06777915, 3.024411, 0, 0, 0, 1, 1,
0.3412121, 0.1549083, 1.289188, 0, 0, 0, 1, 1,
0.3416676, -1.483405, 3.758463, 0, 0, 0, 1, 1,
0.3437101, -1.587847, 3.530881, 0, 0, 0, 1, 1,
0.346981, -1.241445, 2.386524, 0, 0, 0, 1, 1,
0.3480961, -2.726752, 5.719682, 0, 0, 0, 1, 1,
0.3518303, -0.1597793, 1.796283, 1, 1, 1, 1, 1,
0.3529997, -0.3218038, 2.590824, 1, 1, 1, 1, 1,
0.356374, 1.933259, 0.8696741, 1, 1, 1, 1, 1,
0.3567344, 0.3054389, 0.7876288, 1, 1, 1, 1, 1,
0.356868, -1.31937, 2.575794, 1, 1, 1, 1, 1,
0.3632248, -0.002336956, 0.6799054, 1, 1, 1, 1, 1,
0.3650942, -0.3765007, 2.450382, 1, 1, 1, 1, 1,
0.368943, 0.4526567, 0.6630958, 1, 1, 1, 1, 1,
0.370595, -0.6147932, 2.041644, 1, 1, 1, 1, 1,
0.37165, -1.383494, 3.668615, 1, 1, 1, 1, 1,
0.3716528, -0.4797719, 2.540572, 1, 1, 1, 1, 1,
0.3818582, 2.007938, -0.6658111, 1, 1, 1, 1, 1,
0.382011, 1.457285, 0.8638812, 1, 1, 1, 1, 1,
0.3826566, -2.000562, 4.272291, 1, 1, 1, 1, 1,
0.3883784, -0.6033667, 3.178816, 1, 1, 1, 1, 1,
0.3889059, 0.894181, 2.432023, 0, 0, 1, 1, 1,
0.3895039, 0.2667437, -0.1688238, 1, 0, 0, 1, 1,
0.3923566, 1.555324, -1.587488, 1, 0, 0, 1, 1,
0.3955175, 0.634738, 1.674762, 1, 0, 0, 1, 1,
0.3974658, 1.034818, 0.4523239, 1, 0, 0, 1, 1,
0.3992926, 0.08828746, 1.95989, 1, 0, 0, 1, 1,
0.4027986, -1.628307, 3.552291, 0, 0, 0, 1, 1,
0.4037592, -0.7572715, 3.445259, 0, 0, 0, 1, 1,
0.4092955, 2.174437, -1.704653, 0, 0, 0, 1, 1,
0.4101577, 0.8217638, 0.401975, 0, 0, 0, 1, 1,
0.4137566, 0.588888, 0.7688155, 0, 0, 0, 1, 1,
0.4151286, -1.263934, 2.848099, 0, 0, 0, 1, 1,
0.4155652, 1.122873, -0.8199247, 0, 0, 0, 1, 1,
0.4173875, -0.2321521, 2.188482, 1, 1, 1, 1, 1,
0.4194183, -1.106108, 2.311796, 1, 1, 1, 1, 1,
0.419826, -0.3939064, 3.255861, 1, 1, 1, 1, 1,
0.4231941, 0.4049031, -0.1004772, 1, 1, 1, 1, 1,
0.4232912, 0.2177791, 0.920698, 1, 1, 1, 1, 1,
0.4239389, 0.4026051, 1.522299, 1, 1, 1, 1, 1,
0.4260127, 0.1256592, 2.053669, 1, 1, 1, 1, 1,
0.4262648, -1.541323, 2.112343, 1, 1, 1, 1, 1,
0.4299814, -0.9893218, 3.46355, 1, 1, 1, 1, 1,
0.4309598, -0.3782704, 2.708545, 1, 1, 1, 1, 1,
0.4339148, 0.07301532, 1.11517, 1, 1, 1, 1, 1,
0.4372246, -1.004902, 2.560733, 1, 1, 1, 1, 1,
0.440044, 1.395574, -1.460558, 1, 1, 1, 1, 1,
0.4409047, 2.416036, -0.7080455, 1, 1, 1, 1, 1,
0.4457439, 0.4393002, 1.813615, 1, 1, 1, 1, 1,
0.4581651, 0.6289275, -0.2753355, 0, 0, 1, 1, 1,
0.458281, 0.8009611, 0.1581624, 1, 0, 0, 1, 1,
0.4729758, -0.4032803, 3.269478, 1, 0, 0, 1, 1,
0.4870339, 1.593058, -0.6448323, 1, 0, 0, 1, 1,
0.4888778, -0.5024876, 1.535573, 1, 0, 0, 1, 1,
0.4902615, 1.427935, -0.06870873, 1, 0, 0, 1, 1,
0.4924226, -0.0709706, 0.582441, 0, 0, 0, 1, 1,
0.4943893, -1.126984, 2.879506, 0, 0, 0, 1, 1,
0.4954127, -0.2466293, 0.4786327, 0, 0, 0, 1, 1,
0.499168, 2.15892, 0.1085157, 0, 0, 0, 1, 1,
0.5044802, 0.02654067, 1.621853, 0, 0, 0, 1, 1,
0.5066401, -0.8955659, 2.983604, 0, 0, 0, 1, 1,
0.5084778, 0.9603803, -2.374966, 0, 0, 0, 1, 1,
0.5115831, 1.074757, -0.4139205, 1, 1, 1, 1, 1,
0.5117841, -0.3588881, 3.553877, 1, 1, 1, 1, 1,
0.5193574, 1.551772, 0.2521998, 1, 1, 1, 1, 1,
0.5206323, -0.6258516, 1.327423, 1, 1, 1, 1, 1,
0.5209646, 0.8720874, 0.9851081, 1, 1, 1, 1, 1,
0.5260337, 0.8681054, 0.9494928, 1, 1, 1, 1, 1,
0.5285038, 0.8645663, -0.7935002, 1, 1, 1, 1, 1,
0.5294654, 0.3324164, 0.08288524, 1, 1, 1, 1, 1,
0.5412959, 0.7572795, 2.722824, 1, 1, 1, 1, 1,
0.5424048, -0.3073889, 2.015769, 1, 1, 1, 1, 1,
0.5442568, 2.646041, -0.8196049, 1, 1, 1, 1, 1,
0.5454319, -1.043203, 3.492894, 1, 1, 1, 1, 1,
0.5461811, 1.389725, 1.824816, 1, 1, 1, 1, 1,
0.5481801, 0.3269059, 0.6682206, 1, 1, 1, 1, 1,
0.5510841, 0.5008454, -0.5636426, 1, 1, 1, 1, 1,
0.5542535, -0.8966025, 4.481142, 0, 0, 1, 1, 1,
0.555537, -0.6214964, 0.5687442, 1, 0, 0, 1, 1,
0.5565619, 2.192609, 1.405938, 1, 0, 0, 1, 1,
0.5585911, -0.6115517, 2.821846, 1, 0, 0, 1, 1,
0.5587945, 0.5124536, 1.416952, 1, 0, 0, 1, 1,
0.560429, -0.4433593, 1.794647, 1, 0, 0, 1, 1,
0.5717959, -0.348951, 2.876271, 0, 0, 0, 1, 1,
0.5739023, 0.512225, 1.18833, 0, 0, 0, 1, 1,
0.5761509, -0.6038684, 0.9841668, 0, 0, 0, 1, 1,
0.5776002, -2.598781, 1.9681, 0, 0, 0, 1, 1,
0.580341, -0.6887413, 1.257623, 0, 0, 0, 1, 1,
0.5814658, -1.622903, 2.574209, 0, 0, 0, 1, 1,
0.5816167, -1.456691, 4.125391, 0, 0, 0, 1, 1,
0.5821801, 1.389394, 1.482754, 1, 1, 1, 1, 1,
0.5867168, 0.1119129, 0.3120096, 1, 1, 1, 1, 1,
0.5899875, -0.02378075, 2.364367, 1, 1, 1, 1, 1,
0.6087674, 2.197081, 1.755379, 1, 1, 1, 1, 1,
0.6130374, 0.1605022, 1.244732, 1, 1, 1, 1, 1,
0.6148354, -0.8811613, 2.63148, 1, 1, 1, 1, 1,
0.6172242, 1.082499, 1.231061, 1, 1, 1, 1, 1,
0.6214405, 0.9751587, -1.113967, 1, 1, 1, 1, 1,
0.6271321, -0.4883299, 2.163894, 1, 1, 1, 1, 1,
0.6275197, -1.07971, 2.726661, 1, 1, 1, 1, 1,
0.6288874, 2.858425, 0.4827439, 1, 1, 1, 1, 1,
0.6340415, 0.9126865, 0.3836475, 1, 1, 1, 1, 1,
0.6349173, 0.4806304, 0.2093259, 1, 1, 1, 1, 1,
0.6435827, 0.2328221, 2.730326, 1, 1, 1, 1, 1,
0.643857, -2.208516, 2.826533, 1, 1, 1, 1, 1,
0.6468937, -0.7385421, 1.019111, 0, 0, 1, 1, 1,
0.6480846, -0.39605, 0.9963805, 1, 0, 0, 1, 1,
0.6496312, -0.4180915, 1.48902, 1, 0, 0, 1, 1,
0.6529732, 0.4914439, 0.04338771, 1, 0, 0, 1, 1,
0.6716209, 0.9808328, 0.5592834, 1, 0, 0, 1, 1,
0.6741636, 0.8776605, 0.6690373, 1, 0, 0, 1, 1,
0.6775029, 1.324199, 2.607138, 0, 0, 0, 1, 1,
0.6775323, 0.6151367, 1.645563, 0, 0, 0, 1, 1,
0.6791283, -0.3667159, 2.803206, 0, 0, 0, 1, 1,
0.6796367, 0.6793144, 1.265046, 0, 0, 0, 1, 1,
0.6824734, 1.633412, 1.432687, 0, 0, 0, 1, 1,
0.6828701, -1.51388, 3.870386, 0, 0, 0, 1, 1,
0.6837951, 0.3081904, -0.4289594, 0, 0, 0, 1, 1,
0.684081, -1.235952, 1.490253, 1, 1, 1, 1, 1,
0.6852433, 0.02777591, -0.1661924, 1, 1, 1, 1, 1,
0.6853419, 1.142774, 0.4744985, 1, 1, 1, 1, 1,
0.6913211, -0.6166567, 2.044217, 1, 1, 1, 1, 1,
0.692152, 0.5508155, 0.1565931, 1, 1, 1, 1, 1,
0.7062979, 1.628527, -1.24999, 1, 1, 1, 1, 1,
0.7065514, -0.2179912, 1.843937, 1, 1, 1, 1, 1,
0.7110178, 0.6413724, 0.8030859, 1, 1, 1, 1, 1,
0.7116995, 0.6934713, 0.1855186, 1, 1, 1, 1, 1,
0.7121049, 0.856321, -0.2586318, 1, 1, 1, 1, 1,
0.714731, 0.970068, 1.344877, 1, 1, 1, 1, 1,
0.7309982, 0.6249162, 1.117595, 1, 1, 1, 1, 1,
0.7332479, 0.2429553, 1.67412, 1, 1, 1, 1, 1,
0.7352897, 0.07240937, 1.066004, 1, 1, 1, 1, 1,
0.7415245, -1.002406, 3.147725, 1, 1, 1, 1, 1,
0.7467566, -0.9253986, 2.940821, 0, 0, 1, 1, 1,
0.751353, -0.630448, 3.768869, 1, 0, 0, 1, 1,
0.7521426, 0.9018252, -0.2428402, 1, 0, 0, 1, 1,
0.7547846, -2.591734, 3.887701, 1, 0, 0, 1, 1,
0.7612911, 0.2957775, -0.06785069, 1, 0, 0, 1, 1,
0.7658854, -0.3112115, 0.8463685, 1, 0, 0, 1, 1,
0.7727404, -1.015942, 3.581407, 0, 0, 0, 1, 1,
0.7736231, -1.334424, 2.515341, 0, 0, 0, 1, 1,
0.7739147, -0.06792317, -0.9184876, 0, 0, 0, 1, 1,
0.7739272, 0.5841377, 3.015392, 0, 0, 0, 1, 1,
0.7754592, 0.8583001, -1.22368, 0, 0, 0, 1, 1,
0.7808895, 0.6406257, 1.129977, 0, 0, 0, 1, 1,
0.7813157, -0.1945577, 1.086758, 0, 0, 0, 1, 1,
0.7818997, -1.246346, 1.973999, 1, 1, 1, 1, 1,
0.7833477, -0.2893606, 2.840884, 1, 1, 1, 1, 1,
0.7838733, -0.6353188, 2.250308, 1, 1, 1, 1, 1,
0.7956309, 0.9637743, -1.1814, 1, 1, 1, 1, 1,
0.8015332, 1.087514, 0.4089827, 1, 1, 1, 1, 1,
0.8107473, 1.593801, 0.1720397, 1, 1, 1, 1, 1,
0.812045, -2.074778, 2.963392, 1, 1, 1, 1, 1,
0.8139116, -0.2355168, 2.900995, 1, 1, 1, 1, 1,
0.8221861, -0.8181536, 1.66697, 1, 1, 1, 1, 1,
0.8309405, -0.7284802, 1.985462, 1, 1, 1, 1, 1,
0.8311515, -0.6782206, 0.5335701, 1, 1, 1, 1, 1,
0.8337561, 1.104989, -0.05342203, 1, 1, 1, 1, 1,
0.8345143, -0.4317843, 0.2560064, 1, 1, 1, 1, 1,
0.8364822, 0.2366088, 1.431234, 1, 1, 1, 1, 1,
0.8366492, -0.4880662, 1.879449, 1, 1, 1, 1, 1,
0.8387964, 0.8418205, 1.50684, 0, 0, 1, 1, 1,
0.8396999, 1.075609, 0.8853468, 1, 0, 0, 1, 1,
0.8466922, 1.425145, 1.965373, 1, 0, 0, 1, 1,
0.8501229, 1.935852, 1.079128, 1, 0, 0, 1, 1,
0.8597625, -0.0918757, 0.4942745, 1, 0, 0, 1, 1,
0.8617977, 1.129883, 0.7512041, 1, 0, 0, 1, 1,
0.8626912, 2.038054, 0.7672116, 0, 0, 0, 1, 1,
0.8663362, -0.3795891, 3.610517, 0, 0, 0, 1, 1,
0.8667541, 0.6792212, 0.4248146, 0, 0, 0, 1, 1,
0.8705765, 0.1258964, 1.783341, 0, 0, 0, 1, 1,
0.8732325, -0.6165813, 0.7551874, 0, 0, 0, 1, 1,
0.8781637, 0.9067192, 2.206228, 0, 0, 0, 1, 1,
0.8806059, -0.4379131, 1.561803, 0, 0, 0, 1, 1,
0.8834568, 0.2744161, 0.1164171, 1, 1, 1, 1, 1,
0.8888903, 2.011117, 0.5008358, 1, 1, 1, 1, 1,
0.8905445, -0.9681803, 2.362626, 1, 1, 1, 1, 1,
0.8947293, -0.2194665, 2.615459, 1, 1, 1, 1, 1,
0.8980442, -0.2326446, 1.61789, 1, 1, 1, 1, 1,
0.8985478, -0.3202714, 0.473339, 1, 1, 1, 1, 1,
0.8985875, -1.074229, 3.516582, 1, 1, 1, 1, 1,
0.8997736, -0.8844978, 0.5332391, 1, 1, 1, 1, 1,
0.9113224, -0.6677666, 1.446365, 1, 1, 1, 1, 1,
0.9164457, 1.287503, 0.6925961, 1, 1, 1, 1, 1,
0.9187058, -0.5131763, 2.711709, 1, 1, 1, 1, 1,
0.9191164, -0.9589836, 1.43919, 1, 1, 1, 1, 1,
0.9200715, -1.06311, 2.113608, 1, 1, 1, 1, 1,
0.9279261, 0.4945137, 1.448888, 1, 1, 1, 1, 1,
0.9293715, -0.521388, 2.48264, 1, 1, 1, 1, 1,
0.9448192, 1.462249, 2.27138, 0, 0, 1, 1, 1,
0.9461671, -0.4960511, -0.3277294, 1, 0, 0, 1, 1,
0.9493266, 1.089025, 0.5919927, 1, 0, 0, 1, 1,
0.9501194, 0.3864298, 1.26348, 1, 0, 0, 1, 1,
0.9505654, -0.07631285, 0.2578423, 1, 0, 0, 1, 1,
0.9551525, -1.464072, 3.806526, 1, 0, 0, 1, 1,
0.9586158, -1.602449, 2.988783, 0, 0, 0, 1, 1,
0.9644684, 0.5268065, 0.5286697, 0, 0, 0, 1, 1,
0.9663441, 2.205797, -1.817626, 0, 0, 0, 1, 1,
0.9767006, 1.657551, 0.0276128, 0, 0, 0, 1, 1,
0.9890998, 0.5447876, 1.091032, 0, 0, 0, 1, 1,
0.994704, 1.714567, 0.6178355, 0, 0, 0, 1, 1,
0.995195, 1.367485, -0.3235907, 0, 0, 0, 1, 1,
1.00901, 1.24309, -1.020508, 1, 1, 1, 1, 1,
1.01486, -0.1579969, 0.9103847, 1, 1, 1, 1, 1,
1.016419, 0.03126875, 2.680898, 1, 1, 1, 1, 1,
1.019282, -0.1160686, 0.908616, 1, 1, 1, 1, 1,
1.025017, -1.0905, 0.6161164, 1, 1, 1, 1, 1,
1.030523, 1.558996, 0.3602597, 1, 1, 1, 1, 1,
1.047972, -0.6042812, 1.576348, 1, 1, 1, 1, 1,
1.057589, 0.3625827, 1.339833, 1, 1, 1, 1, 1,
1.058328, -0.7148339, 2.223258, 1, 1, 1, 1, 1,
1.058473, -0.2246611, 1.539119, 1, 1, 1, 1, 1,
1.061537, 0.1904959, 1.416646, 1, 1, 1, 1, 1,
1.067003, 0.1908769, 1.857747, 1, 1, 1, 1, 1,
1.081748, 1.051357, 0.3377279, 1, 1, 1, 1, 1,
1.08458, -0.6354867, 0.4162304, 1, 1, 1, 1, 1,
1.089147, -0.6991886, 1.393234, 1, 1, 1, 1, 1,
1.100742, 0.8657424, 0.8476085, 0, 0, 1, 1, 1,
1.107268, -0.1379443, 3.307114, 1, 0, 0, 1, 1,
1.109137, -1.660632, 2.11945, 1, 0, 0, 1, 1,
1.113076, 0.4515682, 1.240771, 1, 0, 0, 1, 1,
1.133827, 0.3104388, 0.4514514, 1, 0, 0, 1, 1,
1.139862, 0.6799305, 0.8475467, 1, 0, 0, 1, 1,
1.145215, 0.7059191, 1.569117, 0, 0, 0, 1, 1,
1.147483, -0.0700245, -1.765424, 0, 0, 0, 1, 1,
1.15641, 1.505637, -0.4072009, 0, 0, 0, 1, 1,
1.163352, 0.6689439, 1.557065, 0, 0, 0, 1, 1,
1.167147, -0.01889487, 3.340668, 0, 0, 0, 1, 1,
1.168109, -0.8828027, 2.098617, 0, 0, 0, 1, 1,
1.176742, -0.7918817, 3.32627, 0, 0, 0, 1, 1,
1.180972, 0.4487883, -0.5442006, 1, 1, 1, 1, 1,
1.186262, -0.4874867, 2.921665, 1, 1, 1, 1, 1,
1.186285, 1.313539, 0.9037775, 1, 1, 1, 1, 1,
1.188859, -0.1727017, 1.207249, 1, 1, 1, 1, 1,
1.190811, 1.468534, 0.7244694, 1, 1, 1, 1, 1,
1.193304, 0.02499937, 1.169536, 1, 1, 1, 1, 1,
1.200317, 0.5005099, 0.5894512, 1, 1, 1, 1, 1,
1.206353, 0.04014613, 0.9463068, 1, 1, 1, 1, 1,
1.207393, -0.9120609, 1.116785, 1, 1, 1, 1, 1,
1.215864, -1.030769, 2.663553, 1, 1, 1, 1, 1,
1.222149, -1.095186, 0.5720519, 1, 1, 1, 1, 1,
1.226723, -0.6701013, -0.07048929, 1, 1, 1, 1, 1,
1.227892, 0.4177618, -0.2318292, 1, 1, 1, 1, 1,
1.233937, 1.364656, 2.292614, 1, 1, 1, 1, 1,
1.238584, -0.8385533, 0.5679779, 1, 1, 1, 1, 1,
1.24045, 2.385768, 1.799484, 0, 0, 1, 1, 1,
1.240778, 1.327362, -0.09121968, 1, 0, 0, 1, 1,
1.242758, -0.3315104, 0.2998462, 1, 0, 0, 1, 1,
1.243985, -0.6356212, 1.13059, 1, 0, 0, 1, 1,
1.24419, 1.794258, -0.7337961, 1, 0, 0, 1, 1,
1.24698, -0.8581212, 0.9900725, 1, 0, 0, 1, 1,
1.25498, 0.3392146, 0.7197714, 0, 0, 0, 1, 1,
1.257192, 1.812467, -1.041519, 0, 0, 0, 1, 1,
1.264298, 0.5571239, 1.963678, 0, 0, 0, 1, 1,
1.266939, 0.04255218, 0.6114525, 0, 0, 0, 1, 1,
1.267287, -0.2459308, 3.705823, 0, 0, 0, 1, 1,
1.278473, -1.350816, 2.423825, 0, 0, 0, 1, 1,
1.291283, 1.494885, -0.3591582, 0, 0, 0, 1, 1,
1.295299, -0.1898202, 3.016369, 1, 1, 1, 1, 1,
1.296533, 0.213411, -0.7001321, 1, 1, 1, 1, 1,
1.302938, -0.7821371, 1.044639, 1, 1, 1, 1, 1,
1.30395, 0.8107233, -0.1614376, 1, 1, 1, 1, 1,
1.312591, 2.43796, 0.7544613, 1, 1, 1, 1, 1,
1.313334, 1.031982, 0.9207087, 1, 1, 1, 1, 1,
1.314269, 2.317506, 1.448222, 1, 1, 1, 1, 1,
1.334267, 1.171076, 1.372914, 1, 1, 1, 1, 1,
1.338142, -1.485917, 2.527339, 1, 1, 1, 1, 1,
1.34703, 0.796836, 1.719536, 1, 1, 1, 1, 1,
1.347818, 2.48783, -0.9783428, 1, 1, 1, 1, 1,
1.364903, -0.6452046, 2.821319, 1, 1, 1, 1, 1,
1.365669, -2.514532, 0.9411933, 1, 1, 1, 1, 1,
1.366532, 1.078101, 1.354183, 1, 1, 1, 1, 1,
1.366591, -1.171991, 4.40597, 1, 1, 1, 1, 1,
1.371659, -0.1981138, 1.589295, 0, 0, 1, 1, 1,
1.387767, 1.479216, 2.528081, 1, 0, 0, 1, 1,
1.39151, 1.480667, 0.8588363, 1, 0, 0, 1, 1,
1.404052, 1.975144, 0.08277778, 1, 0, 0, 1, 1,
1.411267, -0.1379313, 1.960441, 1, 0, 0, 1, 1,
1.419657, 1.263174, 1.81859, 1, 0, 0, 1, 1,
1.422, 1.548511, 0.2550795, 0, 0, 0, 1, 1,
1.438531, -0.9265406, 2.594872, 0, 0, 0, 1, 1,
1.444082, -0.6092615, 0.9140459, 0, 0, 0, 1, 1,
1.444864, 0.6949375, -0.3807159, 0, 0, 0, 1, 1,
1.447583, -1.167869, 3.569362, 0, 0, 0, 1, 1,
1.457581, -1.372382, 0.2044796, 0, 0, 0, 1, 1,
1.458959, 0.4217228, -0.2473113, 0, 0, 0, 1, 1,
1.465666, 0.1368877, 0.8487779, 1, 1, 1, 1, 1,
1.470342, 0.4719177, 1.216723, 1, 1, 1, 1, 1,
1.478578, 1.096922, 0.583906, 1, 1, 1, 1, 1,
1.486024, 0.1744774, 2.534241, 1, 1, 1, 1, 1,
1.499075, 1.410303, 0.2345366, 1, 1, 1, 1, 1,
1.501231, 0.1057638, 0.8868832, 1, 1, 1, 1, 1,
1.502497, 0.4865327, 1.469923, 1, 1, 1, 1, 1,
1.516845, 1.501755, 0.9683516, 1, 1, 1, 1, 1,
1.519522, 0.5835193, 2.12143, 1, 1, 1, 1, 1,
1.536246, 0.9546266, -0.6427228, 1, 1, 1, 1, 1,
1.556087, -0.4946214, 1.904488, 1, 1, 1, 1, 1,
1.562019, -0.004519702, 2.416088, 1, 1, 1, 1, 1,
1.580103, 0.006912906, 1.58103, 1, 1, 1, 1, 1,
1.596196, 1.153611, 1.045128, 1, 1, 1, 1, 1,
1.612309, 0.4949639, 1.459923, 1, 1, 1, 1, 1,
1.632534, -1.153707, 1.452221, 0, 0, 1, 1, 1,
1.662776, 0.5960183, 0.7459545, 1, 0, 0, 1, 1,
1.664756, 0.7190825, 3.317521, 1, 0, 0, 1, 1,
1.681619, -1.100939, 1.843716, 1, 0, 0, 1, 1,
1.69703, 0.9119751, 0.2499015, 1, 0, 0, 1, 1,
1.70032, 1.289273, -0.1830179, 1, 0, 0, 1, 1,
1.708293, 0.1052682, 1.244157, 0, 0, 0, 1, 1,
1.726587, -0.6289102, 1.336417, 0, 0, 0, 1, 1,
1.73817, 1.648544, 1.195692, 0, 0, 0, 1, 1,
1.756083, -0.1542364, 0.02898917, 0, 0, 0, 1, 1,
1.772201, 1.408729, 1.464708, 0, 0, 0, 1, 1,
1.777372, -0.5921258, 1.561899, 0, 0, 0, 1, 1,
1.786215, 0.8005251, -0.4731146, 0, 0, 0, 1, 1,
1.788842, 1.660743, 1.71825, 1, 1, 1, 1, 1,
1.794376, 1.392239, 0.8111752, 1, 1, 1, 1, 1,
1.800045, 1.68971, 0.3447796, 1, 1, 1, 1, 1,
1.803425, 0.01394471, 2.93325, 1, 1, 1, 1, 1,
1.81944, -0.6033596, 0.4687354, 1, 1, 1, 1, 1,
1.84566, -0.8236177, 3.219412, 1, 1, 1, 1, 1,
1.852469, -0.03234701, 2.877897, 1, 1, 1, 1, 1,
1.872025, 1.362575, 2.133314, 1, 1, 1, 1, 1,
1.873604, -1.436606, 1.555892, 1, 1, 1, 1, 1,
1.903693, -0.02274261, 1.231152, 1, 1, 1, 1, 1,
1.921689, 1.63391, 0.2613758, 1, 1, 1, 1, 1,
1.923981, 1.025024, 3.012723, 1, 1, 1, 1, 1,
1.930345, 0.4630853, 1.605217, 1, 1, 1, 1, 1,
1.930925, -0.2565862, 2.776223, 1, 1, 1, 1, 1,
1.936354, -1.224892, 2.654752, 1, 1, 1, 1, 1,
1.944565, 0.7925454, 2.604808, 0, 0, 1, 1, 1,
1.951743, -0.5797614, 0.5224752, 1, 0, 0, 1, 1,
1.962409, -0.7372168, 2.038456, 1, 0, 0, 1, 1,
1.963001, -0.06889787, 0.8328778, 1, 0, 0, 1, 1,
1.970079, 1.435521, 1.160453, 1, 0, 0, 1, 1,
1.994113, 1.24791, 1.254897, 1, 0, 0, 1, 1,
2.03813, 0.2092647, 0.2653529, 0, 0, 0, 1, 1,
2.039433, 0.4836365, 1.493108, 0, 0, 0, 1, 1,
2.192677, -0.2095637, 1.162532, 0, 0, 0, 1, 1,
2.261386, 0.1998735, 1.440001, 0, 0, 0, 1, 1,
2.265913, 0.4715416, 2.531624, 0, 0, 0, 1, 1,
2.362093, -0.1656533, 1.852516, 0, 0, 0, 1, 1,
2.43085, 1.117373, 0.7601668, 0, 0, 0, 1, 1,
2.466662, 0.8086703, 0.5552931, 1, 1, 1, 1, 1,
2.500183, -0.01818535, 1.276499, 1, 1, 1, 1, 1,
2.558282, 1.050832, 2.696363, 1, 1, 1, 1, 1,
2.662438, -1.15256, 0.41215, 1, 1, 1, 1, 1,
2.991911, 1.485213, 2.211985, 1, 1, 1, 1, 1,
3.68593, 0.3152074, 0.3462115, 1, 1, 1, 1, 1,
3.803683, -0.6666027, 1.360471, 1, 1, 1, 1, 1
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
var radius = 9.82347;
var distance = 34.50452;
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
mvMatrix.translate( -0.4094895, 0.137991, -0.07726145 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.50452);
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
