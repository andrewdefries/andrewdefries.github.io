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
-3.470736, -0.9612849, -4.506685, 1, 0, 0, 1,
-3.005767, -0.7628933, -1.133014, 1, 0.007843138, 0, 1,
-2.983261, 0.250396, -0.9512122, 1, 0.01176471, 0, 1,
-2.831422, 1.245776, -0.5455472, 1, 0.01960784, 0, 1,
-2.824555, -2.232826, -3.058773, 1, 0.02352941, 0, 1,
-2.814413, -0.507882, -1.961989, 1, 0.03137255, 0, 1,
-2.601749, -0.7206296, -2.008795, 1, 0.03529412, 0, 1,
-2.578868, 0.8767952, -2.720437, 1, 0.04313726, 0, 1,
-2.544708, -0.7594178, -1.383496, 1, 0.04705882, 0, 1,
-2.392596, -1.923829, -1.505365, 1, 0.05490196, 0, 1,
-2.350357, -0.09041171, 0.3689871, 1, 0.05882353, 0, 1,
-2.308653, 0.09148487, -2.860245, 1, 0.06666667, 0, 1,
-2.294879, 1.866986, -2.46876, 1, 0.07058824, 0, 1,
-2.28621, 0.1239854, -3.493141, 1, 0.07843138, 0, 1,
-2.252301, -0.4070897, -2.700668, 1, 0.08235294, 0, 1,
-2.249033, -1.2908, -2.923807, 1, 0.09019608, 0, 1,
-2.242627, -0.7155064, -1.590428, 1, 0.09411765, 0, 1,
-2.236635, -0.5450228, -2.307559, 1, 0.1019608, 0, 1,
-2.223441, -0.4803501, -1.743338, 1, 0.1098039, 0, 1,
-2.194892, -1.892042, -3.017935, 1, 0.1137255, 0, 1,
-2.16096, -1.348746, -2.427298, 1, 0.1215686, 0, 1,
-2.113277, -0.7167269, -2.446663, 1, 0.1254902, 0, 1,
-2.094164, -0.8917293, -0.6688169, 1, 0.1333333, 0, 1,
-2.089471, -1.621594, -0.9974338, 1, 0.1372549, 0, 1,
-2.080095, -0.7233245, -0.5274763, 1, 0.145098, 0, 1,
-2.068573, -1.770017, -3.092558, 1, 0.1490196, 0, 1,
-2.017072, -0.7136745, -1.485148, 1, 0.1568628, 0, 1,
-2.016203, 0.3369419, -0.3246062, 1, 0.1607843, 0, 1,
-2.015061, 0.02460489, -0.8888382, 1, 0.1686275, 0, 1,
-2.010564, 0.5423496, -0.8006778, 1, 0.172549, 0, 1,
-1.997992, 0.5338107, -1.233386, 1, 0.1803922, 0, 1,
-1.933355, -0.6232652, -1.523093, 1, 0.1843137, 0, 1,
-1.929875, -1.412453, -1.358316, 1, 0.1921569, 0, 1,
-1.914927, 0.4928853, -0.6279942, 1, 0.1960784, 0, 1,
-1.886579, -0.2851492, -1.884583, 1, 0.2039216, 0, 1,
-1.874955, -0.250469, -0.0253668, 1, 0.2117647, 0, 1,
-1.866973, 1.535298, -0.4166014, 1, 0.2156863, 0, 1,
-1.86628, 1.18553, -0.9437796, 1, 0.2235294, 0, 1,
-1.864718, 1.525664, -2.149755, 1, 0.227451, 0, 1,
-1.845757, 0.04562648, -1.533802, 1, 0.2352941, 0, 1,
-1.843061, 0.2912994, -2.319216, 1, 0.2392157, 0, 1,
-1.837226, -0.1115625, -2.039449, 1, 0.2470588, 0, 1,
-1.835878, -0.4215419, -2.4293, 1, 0.2509804, 0, 1,
-1.817649, 0.07840177, 0.4812292, 1, 0.2588235, 0, 1,
-1.811975, 0.4703555, -2.399074, 1, 0.2627451, 0, 1,
-1.786822, -2.046602, -3.754233, 1, 0.2705882, 0, 1,
-1.775572, 0.1148324, -1.758965, 1, 0.2745098, 0, 1,
-1.771215, 1.736068, -0.4728348, 1, 0.282353, 0, 1,
-1.724822, 1.784776, 0.6350074, 1, 0.2862745, 0, 1,
-1.724696, 0.1611839, -1.328637, 1, 0.2941177, 0, 1,
-1.712204, -1.331248, -2.085311, 1, 0.3019608, 0, 1,
-1.70545, -0.5069391, -1.588626, 1, 0.3058824, 0, 1,
-1.686041, 0.9376633, -2.160641, 1, 0.3137255, 0, 1,
-1.679915, -0.8650635, -2.09564, 1, 0.3176471, 0, 1,
-1.658719, 0.7517765, -1.136677, 1, 0.3254902, 0, 1,
-1.658602, 0.986185, -0.494496, 1, 0.3294118, 0, 1,
-1.642232, -1.182192, -2.671132, 1, 0.3372549, 0, 1,
-1.61425, 0.288354, -0.631223, 1, 0.3411765, 0, 1,
-1.606513, 0.9591935, 0.141629, 1, 0.3490196, 0, 1,
-1.603115, -1.43373, -2.413226, 1, 0.3529412, 0, 1,
-1.59517, -0.6658121, -0.3844031, 1, 0.3607843, 0, 1,
-1.584101, 0.6093377, -2.147672, 1, 0.3647059, 0, 1,
-1.577186, 1.138433, -0.5137789, 1, 0.372549, 0, 1,
-1.568686, -0.03743235, -1.358331, 1, 0.3764706, 0, 1,
-1.554296, -0.04735181, -1.292977, 1, 0.3843137, 0, 1,
-1.539209, 0.608634, -2.216317, 1, 0.3882353, 0, 1,
-1.539112, -0.5457705, -1.661461, 1, 0.3960784, 0, 1,
-1.518083, 2.535918, -0.1901813, 1, 0.4039216, 0, 1,
-1.51654, 0.1372824, -2.033741, 1, 0.4078431, 0, 1,
-1.50977, -1.369753, -3.028635, 1, 0.4156863, 0, 1,
-1.507772, -1.520826, -2.280257, 1, 0.4196078, 0, 1,
-1.503149, 0.585629, -1.593402, 1, 0.427451, 0, 1,
-1.501278, -1.168012, -0.955465, 1, 0.4313726, 0, 1,
-1.498768, -0.3351502, -2.019914, 1, 0.4392157, 0, 1,
-1.497216, -0.4695177, -0.7908238, 1, 0.4431373, 0, 1,
-1.496622, -1.830642, -3.403975, 1, 0.4509804, 0, 1,
-1.492107, 0.5813002, -0.7735512, 1, 0.454902, 0, 1,
-1.480631, 0.2257849, -0.8434043, 1, 0.4627451, 0, 1,
-1.471621, 0.8917653, -1.186269, 1, 0.4666667, 0, 1,
-1.462789, -1.349886, -2.748687, 1, 0.4745098, 0, 1,
-1.445734, 0.7789572, -2.024118, 1, 0.4784314, 0, 1,
-1.444017, -0.4011425, 0.5544754, 1, 0.4862745, 0, 1,
-1.442002, 1.891932, -0.09484265, 1, 0.4901961, 0, 1,
-1.419026, -1.522971, -3.917233, 1, 0.4980392, 0, 1,
-1.4171, -2.198502, -3.024176, 1, 0.5058824, 0, 1,
-1.410167, 0.0412542, -1.875902, 1, 0.509804, 0, 1,
-1.404386, -1.094639, -1.79049, 1, 0.5176471, 0, 1,
-1.400722, -0.7326257, -2.566597, 1, 0.5215687, 0, 1,
-1.382655, 0.6915185, -1.893072, 1, 0.5294118, 0, 1,
-1.382054, -0.0495297, -2.534793, 1, 0.5333334, 0, 1,
-1.379156, 1.128051, -0.4154413, 1, 0.5411765, 0, 1,
-1.37595, -0.2706723, -0.9208076, 1, 0.5450981, 0, 1,
-1.37406, 0.7385837, -1.583397, 1, 0.5529412, 0, 1,
-1.36078, -0.4365259, -1.731044, 1, 0.5568628, 0, 1,
-1.354387, -0.353857, -2.144112, 1, 0.5647059, 0, 1,
-1.353624, -2.628875, -2.168631, 1, 0.5686275, 0, 1,
-1.34515, -1.933646, -3.338811, 1, 0.5764706, 0, 1,
-1.344994, 1.831958, -1.4826, 1, 0.5803922, 0, 1,
-1.340297, 1.391828, -0.2564654, 1, 0.5882353, 0, 1,
-1.338774, -0.4313717, -2.508609, 1, 0.5921569, 0, 1,
-1.337472, -0.9057658, -3.265268, 1, 0.6, 0, 1,
-1.333451, -0.5985036, -1.971979, 1, 0.6078432, 0, 1,
-1.333293, 0.1074239, -1.632972, 1, 0.6117647, 0, 1,
-1.332857, -1.614696, -2.592602, 1, 0.6196079, 0, 1,
-1.332345, -1.012533, -1.972578, 1, 0.6235294, 0, 1,
-1.329049, 0.3323043, -2.326582, 1, 0.6313726, 0, 1,
-1.320262, 0.5424564, -0.6342884, 1, 0.6352941, 0, 1,
-1.318074, -0.2445755, -0.948541, 1, 0.6431373, 0, 1,
-1.316795, -0.9168857, -1.999588, 1, 0.6470588, 0, 1,
-1.31062, 0.8119715, 1.398957, 1, 0.654902, 0, 1,
-1.308358, 1.354572, -1.391778, 1, 0.6588235, 0, 1,
-1.305625, -0.04030294, -1.357226, 1, 0.6666667, 0, 1,
-1.294249, -0.4052244, 0.4544451, 1, 0.6705883, 0, 1,
-1.288036, 1.641153, 0.1426343, 1, 0.6784314, 0, 1,
-1.266838, -0.7966813, -4.374608, 1, 0.682353, 0, 1,
-1.250989, 0.02101737, -0.3502078, 1, 0.6901961, 0, 1,
-1.250383, -0.7627106, -1.760444, 1, 0.6941177, 0, 1,
-1.249084, 1.15139, 0.4077605, 1, 0.7019608, 0, 1,
-1.246335, 0.2375722, -1.374045, 1, 0.7098039, 0, 1,
-1.244225, 1.088356, -0.1910736, 1, 0.7137255, 0, 1,
-1.240578, -0.4615484, -0.08747116, 1, 0.7215686, 0, 1,
-1.240179, 0.2415835, -0.7555988, 1, 0.7254902, 0, 1,
-1.239115, 1.191545, -2.289734, 1, 0.7333333, 0, 1,
-1.23082, 0.9145279, -3.036088, 1, 0.7372549, 0, 1,
-1.224538, -0.345672, -3.635249, 1, 0.7450981, 0, 1,
-1.204877, -0.1037126, -2.805939, 1, 0.7490196, 0, 1,
-1.187876, -0.2373501, -1.396662, 1, 0.7568628, 0, 1,
-1.18076, -0.463507, -0.7299571, 1, 0.7607843, 0, 1,
-1.179319, -0.4471533, -2.579107, 1, 0.7686275, 0, 1,
-1.167642, -1.114397, -3.014407, 1, 0.772549, 0, 1,
-1.163175, 0.760588, -1.181145, 1, 0.7803922, 0, 1,
-1.158475, 1.374669, -1.205936, 1, 0.7843137, 0, 1,
-1.154677, 0.7050965, -1.722419, 1, 0.7921569, 0, 1,
-1.154272, 0.1402745, -1.508154, 1, 0.7960784, 0, 1,
-1.150486, -0.9868563, -1.654732, 1, 0.8039216, 0, 1,
-1.149573, -0.5669037, -1.782637, 1, 0.8117647, 0, 1,
-1.146547, 0.6233895, -1.122267, 1, 0.8156863, 0, 1,
-1.142578, -1.0562, -1.200629, 1, 0.8235294, 0, 1,
-1.121439, -1.423581, -1.323065, 1, 0.827451, 0, 1,
-1.118683, -2.305042, -3.876684, 1, 0.8352941, 0, 1,
-1.109858, -0.2604816, -1.196148, 1, 0.8392157, 0, 1,
-1.10542, 0.2306924, -0.5572473, 1, 0.8470588, 0, 1,
-1.102293, -0.001825153, -0.5666853, 1, 0.8509804, 0, 1,
-1.089817, 0.3918775, -0.8137309, 1, 0.8588235, 0, 1,
-1.08911, 0.04747705, -1.313493, 1, 0.8627451, 0, 1,
-1.084605, 0.280477, -0.3668144, 1, 0.8705882, 0, 1,
-1.083772, 0.985444, -1.379826, 1, 0.8745098, 0, 1,
-1.083472, -0.3545371, -1.941815, 1, 0.8823529, 0, 1,
-1.081706, -1.400022, -2.643926, 1, 0.8862745, 0, 1,
-1.078793, 0.9748346, 0.135722, 1, 0.8941177, 0, 1,
-1.07305, 0.8679348, -1.305845, 1, 0.8980392, 0, 1,
-1.071327, -1.107103, -1.77549, 1, 0.9058824, 0, 1,
-1.065063, 1.501684, 1.175496, 1, 0.9137255, 0, 1,
-1.06326, 0.3480187, -2.89015, 1, 0.9176471, 0, 1,
-1.06007, -0.66131, -1.039202, 1, 0.9254902, 0, 1,
-1.059051, 0.8260321, 0.5164345, 1, 0.9294118, 0, 1,
-1.056314, 0.9918755, -0.513397, 1, 0.9372549, 0, 1,
-1.045497, -0.4062163, -1.709908, 1, 0.9411765, 0, 1,
-1.038426, 0.2419671, -0.8197651, 1, 0.9490196, 0, 1,
-1.035048, -0.7955822, -1.670811, 1, 0.9529412, 0, 1,
-1.03469, -1.81193, -2.080892, 1, 0.9607843, 0, 1,
-1.033292, 1.26637, 0.7494419, 1, 0.9647059, 0, 1,
-1.032337, 1.729366, 1.239683, 1, 0.972549, 0, 1,
-1.025492, 0.6462829, -1.15927, 1, 0.9764706, 0, 1,
-1.025365, -2.151893, -2.667465, 1, 0.9843137, 0, 1,
-1.024763, -0.0819932, -0.6597521, 1, 0.9882353, 0, 1,
-1.022672, -0.1679641, -3.347031, 1, 0.9960784, 0, 1,
-1.022216, 0.6047326, -0.9665658, 0.9960784, 1, 0, 1,
-1.015606, 0.2438958, -1.534398, 0.9921569, 1, 0, 1,
-1.01297, 1.222754, -0.8841657, 0.9843137, 1, 0, 1,
-1.008813, 0.6384083, 0.966074, 0.9803922, 1, 0, 1,
-1.007789, 0.6529499, 0.9011608, 0.972549, 1, 0, 1,
-0.9976951, -0.2649828, -2.160174, 0.9686275, 1, 0, 1,
-0.997237, -0.4176441, -3.276637, 0.9607843, 1, 0, 1,
-0.9941919, -2.095425, -3.875937, 0.9568627, 1, 0, 1,
-0.9913189, 1.704296, -0.1439531, 0.9490196, 1, 0, 1,
-0.9894639, 0.03424847, -2.319568, 0.945098, 1, 0, 1,
-0.9724323, -0.01717612, -1.087704, 0.9372549, 1, 0, 1,
-0.9714636, 1.705176, -0.6103452, 0.9333333, 1, 0, 1,
-0.970449, 1.341099, -0.7067412, 0.9254902, 1, 0, 1,
-0.9686392, -1.303156, -1.090763, 0.9215686, 1, 0, 1,
-0.9612898, 0.9914375, -3.160526, 0.9137255, 1, 0, 1,
-0.9568747, -0.4456381, -2.407238, 0.9098039, 1, 0, 1,
-0.9481522, -0.1205586, -2.2803, 0.9019608, 1, 0, 1,
-0.9459431, 1.034183, 0.6616352, 0.8941177, 1, 0, 1,
-0.9457795, -0.2449922, -4.297401, 0.8901961, 1, 0, 1,
-0.9428422, 1.750196, -0.7451541, 0.8823529, 1, 0, 1,
-0.9427259, 1.317664, 0.9608976, 0.8784314, 1, 0, 1,
-0.9407668, -1.346725, -4.069554, 0.8705882, 1, 0, 1,
-0.935453, -1.512234, -3.638325, 0.8666667, 1, 0, 1,
-0.928722, -0.9345019, -1.491121, 0.8588235, 1, 0, 1,
-0.9245008, -0.3395399, -2.820974, 0.854902, 1, 0, 1,
-0.9231459, 0.664268, -0.7969359, 0.8470588, 1, 0, 1,
-0.9216268, 1.029305, -0.4775184, 0.8431373, 1, 0, 1,
-0.9214559, -0.4085452, -1.020239, 0.8352941, 1, 0, 1,
-0.9068404, 1.513364, 0.372863, 0.8313726, 1, 0, 1,
-0.9067691, -2.028087, -2.926715, 0.8235294, 1, 0, 1,
-0.8836266, 0.05886578, -2.9646, 0.8196079, 1, 0, 1,
-0.8785946, -0.1450743, -1.91104, 0.8117647, 1, 0, 1,
-0.8776481, -1.025971, -4.054181, 0.8078431, 1, 0, 1,
-0.8706543, -0.0515239, -0.8366659, 0.8, 1, 0, 1,
-0.8689322, 0.4869491, -1.933933, 0.7921569, 1, 0, 1,
-0.8608024, -2.323233, -3.641008, 0.7882353, 1, 0, 1,
-0.8576304, -2.006618, -2.679255, 0.7803922, 1, 0, 1,
-0.8540722, 0.6854384, -0.6838912, 0.7764706, 1, 0, 1,
-0.8504604, -1.420402, -2.233461, 0.7686275, 1, 0, 1,
-0.8484928, 0.1369864, -0.6820121, 0.7647059, 1, 0, 1,
-0.8452581, 0.6586279, -0.9471737, 0.7568628, 1, 0, 1,
-0.844834, -0.3853576, -2.895672, 0.7529412, 1, 0, 1,
-0.8446472, -1.137572, -2.144038, 0.7450981, 1, 0, 1,
-0.8408225, 0.613511, -1.091575, 0.7411765, 1, 0, 1,
-0.8361425, -0.06696315, -1.198228, 0.7333333, 1, 0, 1,
-0.8244339, -0.38241, -2.861784, 0.7294118, 1, 0, 1,
-0.824383, 0.3148913, -2.655187, 0.7215686, 1, 0, 1,
-0.8218363, 0.797931, -1.717847, 0.7176471, 1, 0, 1,
-0.820277, -0.05518392, -2.945992, 0.7098039, 1, 0, 1,
-0.8155835, -0.9933713, -4.640551, 0.7058824, 1, 0, 1,
-0.7950607, 0.7291119, -1.2408, 0.6980392, 1, 0, 1,
-0.7939927, -0.3476397, -1.529389, 0.6901961, 1, 0, 1,
-0.7930589, -1.019788, -1.206362, 0.6862745, 1, 0, 1,
-0.7896662, -0.2064233, -1.108685, 0.6784314, 1, 0, 1,
-0.7889233, -0.3618043, -1.468005, 0.6745098, 1, 0, 1,
-0.7866286, 0.2309261, -1.511828, 0.6666667, 1, 0, 1,
-0.786104, 0.2335506, -1.095161, 0.6627451, 1, 0, 1,
-0.7845246, 1.020035, -0.9769539, 0.654902, 1, 0, 1,
-0.7827004, 0.06796861, -0.3640752, 0.6509804, 1, 0, 1,
-0.7816892, -0.03524701, -2.174013, 0.6431373, 1, 0, 1,
-0.7810456, -0.1166487, -0.9022773, 0.6392157, 1, 0, 1,
-0.7755351, 0.2776309, -2.042996, 0.6313726, 1, 0, 1,
-0.7735237, 1.294837, -0.4080779, 0.627451, 1, 0, 1,
-0.7668974, -0.3859214, -2.057334, 0.6196079, 1, 0, 1,
-0.7656587, -0.7343416, -0.5512988, 0.6156863, 1, 0, 1,
-0.7641687, 0.4499443, -0.3213979, 0.6078432, 1, 0, 1,
-0.7599749, -0.615021, -0.01929825, 0.6039216, 1, 0, 1,
-0.7549004, -0.6842727, -1.247483, 0.5960785, 1, 0, 1,
-0.7480599, 0.3436652, -1.037843, 0.5882353, 1, 0, 1,
-0.7476232, 2.509404, 0.06252611, 0.5843138, 1, 0, 1,
-0.7426686, 1.093887, -0.07056117, 0.5764706, 1, 0, 1,
-0.7345693, 0.4657001, -0.8840142, 0.572549, 1, 0, 1,
-0.7313898, -0.8646135, -2.085461, 0.5647059, 1, 0, 1,
-0.7313328, -1.117424, -2.325549, 0.5607843, 1, 0, 1,
-0.7297183, -2.482735, -2.598925, 0.5529412, 1, 0, 1,
-0.7290559, 0.8446409, 1.082397, 0.5490196, 1, 0, 1,
-0.7262254, -0.2870896, -0.2991499, 0.5411765, 1, 0, 1,
-0.7219228, -0.9104553, -1.139313, 0.5372549, 1, 0, 1,
-0.7203417, 0.5823682, -0.2834596, 0.5294118, 1, 0, 1,
-0.7138309, -0.5609575, -3.138607, 0.5254902, 1, 0, 1,
-0.711451, 0.4833671, -1.469209, 0.5176471, 1, 0, 1,
-0.7105407, -0.5838137, -2.301417, 0.5137255, 1, 0, 1,
-0.7088557, 1.79125, -0.3540151, 0.5058824, 1, 0, 1,
-0.7063055, 0.08804376, 0.261665, 0.5019608, 1, 0, 1,
-0.7032902, 0.9028836, -0.7027357, 0.4941176, 1, 0, 1,
-0.7023852, -0.7901962, -1.774975, 0.4862745, 1, 0, 1,
-0.6985399, 0.7515857, -2.04101, 0.4823529, 1, 0, 1,
-0.694429, 1.870583, -0.5395457, 0.4745098, 1, 0, 1,
-0.6907094, 0.4076338, -1.599362, 0.4705882, 1, 0, 1,
-0.6906499, 1.253319, 0.2143476, 0.4627451, 1, 0, 1,
-0.6869283, -0.8341156, -3.471081, 0.4588235, 1, 0, 1,
-0.6853562, -0.4475595, -1.724044, 0.4509804, 1, 0, 1,
-0.6850898, -0.3329175, -2.75776, 0.4470588, 1, 0, 1,
-0.6823087, -1.691116, -2.283309, 0.4392157, 1, 0, 1,
-0.6795555, 0.3490594, -0.4729568, 0.4352941, 1, 0, 1,
-0.6793889, 0.3236073, -0.7077631, 0.427451, 1, 0, 1,
-0.6741289, 1.565864, 0.2936651, 0.4235294, 1, 0, 1,
-0.674077, 0.6957148, 1.701086, 0.4156863, 1, 0, 1,
-0.6729041, -1.723503, -4.38518, 0.4117647, 1, 0, 1,
-0.6691646, -0.2107455, -3.785595, 0.4039216, 1, 0, 1,
-0.6550099, 1.740914, -0.7803832, 0.3960784, 1, 0, 1,
-0.6533602, -0.8319709, -2.906084, 0.3921569, 1, 0, 1,
-0.6476451, 0.1566744, -0.9359325, 0.3843137, 1, 0, 1,
-0.6436635, -1.540201, -4.526552, 0.3803922, 1, 0, 1,
-0.6417188, 0.4880213, -0.5033712, 0.372549, 1, 0, 1,
-0.6382793, -0.2166697, -1.180888, 0.3686275, 1, 0, 1,
-0.6353135, -1.342855, -2.064997, 0.3607843, 1, 0, 1,
-0.6343791, -0.09155577, -1.093773, 0.3568628, 1, 0, 1,
-0.6253335, 0.4612618, -0.6627312, 0.3490196, 1, 0, 1,
-0.6209042, 0.3765643, -1.156996, 0.345098, 1, 0, 1,
-0.619263, -0.7568859, -3.993549, 0.3372549, 1, 0, 1,
-0.6111733, -0.4686914, -3.634441, 0.3333333, 1, 0, 1,
-0.6030932, 0.5416611, -2.532183, 0.3254902, 1, 0, 1,
-0.6017126, 1.399208, 0.03959631, 0.3215686, 1, 0, 1,
-0.5999458, 0.4951699, -1.81764, 0.3137255, 1, 0, 1,
-0.590599, -0.3106136, -1.250511, 0.3098039, 1, 0, 1,
-0.5745944, -0.3478422, 0.2813153, 0.3019608, 1, 0, 1,
-0.574481, -0.5749393, -3.46513, 0.2941177, 1, 0, 1,
-0.5709231, 1.319537, -0.8309214, 0.2901961, 1, 0, 1,
-0.5703379, -0.9520109, -2.422742, 0.282353, 1, 0, 1,
-0.5679231, -0.2686884, -1.383462, 0.2784314, 1, 0, 1,
-0.5666786, 0.7226048, -0.553461, 0.2705882, 1, 0, 1,
-0.5587223, 1.789541, -1.032225, 0.2666667, 1, 0, 1,
-0.5558231, -0.3336754, -0.7615826, 0.2588235, 1, 0, 1,
-0.5553812, -0.2239707, -1.729725, 0.254902, 1, 0, 1,
-0.5553082, 1.188218, 0.263737, 0.2470588, 1, 0, 1,
-0.5547839, -0.8287429, -2.313397, 0.2431373, 1, 0, 1,
-0.5480049, -0.1783611, -0.888936, 0.2352941, 1, 0, 1,
-0.5473322, 0.7656567, 0.6331012, 0.2313726, 1, 0, 1,
-0.5440611, -0.4645295, -1.69457, 0.2235294, 1, 0, 1,
-0.5416728, 0.8753538, -1.843107, 0.2196078, 1, 0, 1,
-0.5414292, 0.8638422, -2.394942, 0.2117647, 1, 0, 1,
-0.5357003, -0.627897, -2.936707, 0.2078431, 1, 0, 1,
-0.5287911, 1.366462, 0.302307, 0.2, 1, 0, 1,
-0.5260062, 0.5423275, 0.04222224, 0.1921569, 1, 0, 1,
-0.5246298, -1.097249, -2.348417, 0.1882353, 1, 0, 1,
-0.5210591, 1.002424, -0.3887691, 0.1803922, 1, 0, 1,
-0.520159, 0.5407105, -1.858034, 0.1764706, 1, 0, 1,
-0.5154465, 0.4141986, -1.364205, 0.1686275, 1, 0, 1,
-0.5041559, 0.6977867, 0.08231791, 0.1647059, 1, 0, 1,
-0.5019039, 0.8849645, -0.7894291, 0.1568628, 1, 0, 1,
-0.5005765, 0.2395605, -0.5898524, 0.1529412, 1, 0, 1,
-0.4962471, -1.146285, -3.157708, 0.145098, 1, 0, 1,
-0.4924351, 1.276007, -2.133351, 0.1411765, 1, 0, 1,
-0.4920015, 0.1382301, -1.504061, 0.1333333, 1, 0, 1,
-0.4901095, -0.707028, -2.388902, 0.1294118, 1, 0, 1,
-0.4877283, 1.157817, -0.08077818, 0.1215686, 1, 0, 1,
-0.4877235, 0.7985268, 1.276758, 0.1176471, 1, 0, 1,
-0.4834729, -0.05256508, -1.166178, 0.1098039, 1, 0, 1,
-0.480237, 0.8407867, -0.8153192, 0.1058824, 1, 0, 1,
-0.4712479, 0.2540503, -0.9190943, 0.09803922, 1, 0, 1,
-0.4694642, -1.261377, -3.596512, 0.09019608, 1, 0, 1,
-0.4671473, 0.6722611, -0.5338857, 0.08627451, 1, 0, 1,
-0.464253, -0.2216001, -2.591298, 0.07843138, 1, 0, 1,
-0.4633447, 1.222486, -1.568354, 0.07450981, 1, 0, 1,
-0.4602621, 0.09040799, -0.9453153, 0.06666667, 1, 0, 1,
-0.4560937, 0.09993978, -2.222234, 0.0627451, 1, 0, 1,
-0.4559837, 0.8331969, -0.001727143, 0.05490196, 1, 0, 1,
-0.4556614, -0.08084559, -3.933401, 0.05098039, 1, 0, 1,
-0.4507841, -0.9739336, -2.650667, 0.04313726, 1, 0, 1,
-0.4488039, -1.223924, -3.914529, 0.03921569, 1, 0, 1,
-0.4485706, 1.46093, 0.4260945, 0.03137255, 1, 0, 1,
-0.4424634, 0.1343171, -1.463449, 0.02745098, 1, 0, 1,
-0.4368199, 0.6273454, -0.956512, 0.01960784, 1, 0, 1,
-0.4345173, 0.7134291, -1.147554, 0.01568628, 1, 0, 1,
-0.4336084, -0.9499524, -3.144583, 0.007843138, 1, 0, 1,
-0.4313581, 0.563219, -1.277007, 0.003921569, 1, 0, 1,
-0.4301506, 0.8815968, 0.3979958, 0, 1, 0.003921569, 1,
-0.4241443, 1.267256, -1.197967, 0, 1, 0.01176471, 1,
-0.420995, 0.6636486, -0.9660032, 0, 1, 0.01568628, 1,
-0.4192702, 0.3048727, -0.7078266, 0, 1, 0.02352941, 1,
-0.4190639, -1.841639, -2.671687, 0, 1, 0.02745098, 1,
-0.4182824, -0.5561007, -2.130835, 0, 1, 0.03529412, 1,
-0.4175742, -1.227245, -1.127002, 0, 1, 0.03921569, 1,
-0.4138146, 0.6928385, -1.586988, 0, 1, 0.04705882, 1,
-0.4125707, -1.925384, -3.546864, 0, 1, 0.05098039, 1,
-0.4098158, 1.088006, 1.227307, 0, 1, 0.05882353, 1,
-0.4072475, 2.46131, -1.71487, 0, 1, 0.0627451, 1,
-0.4067226, 0.5935242, -1.022905, 0, 1, 0.07058824, 1,
-0.406578, 0.4509774, -2.155562, 0, 1, 0.07450981, 1,
-0.4028391, -0.734327, -1.309657, 0, 1, 0.08235294, 1,
-0.4008766, 0.7855881, -0.8722865, 0, 1, 0.08627451, 1,
-0.3998448, 1.38036, 1.002429, 0, 1, 0.09411765, 1,
-0.3990231, -1.666007, -2.936069, 0, 1, 0.1019608, 1,
-0.3987209, -0.234394, -1.349925, 0, 1, 0.1058824, 1,
-0.3944966, 0.2408366, -0.852605, 0, 1, 0.1137255, 1,
-0.3891731, 2.233783, -0.5309756, 0, 1, 0.1176471, 1,
-0.3864886, 0.5558466, -1.204364, 0, 1, 0.1254902, 1,
-0.3850836, -0.2838193, -2.203301, 0, 1, 0.1294118, 1,
-0.3830199, 2.172853, -0.02451919, 0, 1, 0.1372549, 1,
-0.3824345, -1.361687, -3.293138, 0, 1, 0.1411765, 1,
-0.3820525, -0.8181679, -0.5243691, 0, 1, 0.1490196, 1,
-0.3817553, -0.4331352, -2.59633, 0, 1, 0.1529412, 1,
-0.3816162, 0.491901, -0.9429646, 0, 1, 0.1607843, 1,
-0.377477, -2.199529, -3.283196, 0, 1, 0.1647059, 1,
-0.3703956, -0.3797519, -0.7205104, 0, 1, 0.172549, 1,
-0.3669288, -0.3825623, -2.122842, 0, 1, 0.1764706, 1,
-0.3665408, 1.271847, -0.08862437, 0, 1, 0.1843137, 1,
-0.3634251, 0.05971756, -0.346265, 0, 1, 0.1882353, 1,
-0.3620043, -1.132617, -2.154843, 0, 1, 0.1960784, 1,
-0.3605475, -1.966696, -1.77998, 0, 1, 0.2039216, 1,
-0.3593136, -0.5858046, -2.465329, 0, 1, 0.2078431, 1,
-0.354499, 1.695709, -0.8696193, 0, 1, 0.2156863, 1,
-0.3501675, 0.2903787, -2.619778, 0, 1, 0.2196078, 1,
-0.3483981, -0.13043, -2.35852, 0, 1, 0.227451, 1,
-0.3481925, -0.2709214, -1.570674, 0, 1, 0.2313726, 1,
-0.3442832, -1.131817, -5.191472, 0, 1, 0.2392157, 1,
-0.3439533, -0.3793303, -1.806646, 0, 1, 0.2431373, 1,
-0.3378268, -1.298751, -2.310463, 0, 1, 0.2509804, 1,
-0.3296444, -1.905793, -2.52647, 0, 1, 0.254902, 1,
-0.3237608, -0.3095248, -2.824373, 0, 1, 0.2627451, 1,
-0.3171797, -2.02956, -3.162748, 0, 1, 0.2666667, 1,
-0.3168662, -0.1570814, -1.295884, 0, 1, 0.2745098, 1,
-0.3137013, 2.321968, 1.170596, 0, 1, 0.2784314, 1,
-0.3107368, 0.5519618, -1.044349, 0, 1, 0.2862745, 1,
-0.3103262, 1.382067, 1.14429, 0, 1, 0.2901961, 1,
-0.3086084, 0.4290417, 0.1165478, 0, 1, 0.2980392, 1,
-0.3076722, 0.2988479, -1.353301, 0, 1, 0.3058824, 1,
-0.3049309, -0.7834591, -0.8526341, 0, 1, 0.3098039, 1,
-0.3036221, -0.05324483, -0.9672638, 0, 1, 0.3176471, 1,
-0.299006, -1.314395, -2.1019, 0, 1, 0.3215686, 1,
-0.2978365, -1.425004, -2.954304, 0, 1, 0.3294118, 1,
-0.2972361, 0.5957512, 0.2697936, 0, 1, 0.3333333, 1,
-0.2933078, -0.9587251, -4.149975, 0, 1, 0.3411765, 1,
-0.2915724, 0.3078388, -0.6648638, 0, 1, 0.345098, 1,
-0.2894696, -0.1833268, -1.165249, 0, 1, 0.3529412, 1,
-0.2877393, -1.287313, -2.977087, 0, 1, 0.3568628, 1,
-0.2877125, 0.8748713, -0.4163853, 0, 1, 0.3647059, 1,
-0.2824999, -1.613325, -4.427654, 0, 1, 0.3686275, 1,
-0.2776978, -1.199081, -2.523175, 0, 1, 0.3764706, 1,
-0.27691, -0.261929, -3.153342, 0, 1, 0.3803922, 1,
-0.2738366, 1.148345, 0.6310222, 0, 1, 0.3882353, 1,
-0.2700382, 0.6014973, -0.2675986, 0, 1, 0.3921569, 1,
-0.2644273, -1.291932, -2.529489, 0, 1, 0.4, 1,
-0.2635379, 1.676128, -0.01162848, 0, 1, 0.4078431, 1,
-0.2623185, -0.3769529, -3.059606, 0, 1, 0.4117647, 1,
-0.261159, -0.5774676, -3.437413, 0, 1, 0.4196078, 1,
-0.2569813, -1.16343, -3.32426, 0, 1, 0.4235294, 1,
-0.25673, 0.1832807, 0.5547428, 0, 1, 0.4313726, 1,
-0.2561533, -1.442207, -4.010027, 0, 1, 0.4352941, 1,
-0.2560483, -0.6300505, -2.974511, 0, 1, 0.4431373, 1,
-0.2550832, 1.404082, 0.0391086, 0, 1, 0.4470588, 1,
-0.2545671, 1.188225, 0.2755557, 0, 1, 0.454902, 1,
-0.254246, -1.432662, -2.529386, 0, 1, 0.4588235, 1,
-0.248714, 0.4635672, -0.6598396, 0, 1, 0.4666667, 1,
-0.2408724, -0.7458412, -2.388855, 0, 1, 0.4705882, 1,
-0.2397841, -0.563095, -3.078806, 0, 1, 0.4784314, 1,
-0.2383311, 0.7559448, 0.3411167, 0, 1, 0.4823529, 1,
-0.2380691, -1.3484, -3.523205, 0, 1, 0.4901961, 1,
-0.2334148, -0.228001, -3.180532, 0, 1, 0.4941176, 1,
-0.2328414, 0.02551962, -0.8357062, 0, 1, 0.5019608, 1,
-0.2322696, -0.6993545, -1.887745, 0, 1, 0.509804, 1,
-0.2307715, 0.2722741, 0.7381737, 0, 1, 0.5137255, 1,
-0.2295378, -0.9908983, -2.377907, 0, 1, 0.5215687, 1,
-0.2287284, -1.671446, -2.118036, 0, 1, 0.5254902, 1,
-0.2269373, 1.615687, -1.070011, 0, 1, 0.5333334, 1,
-0.2268039, 1.604066, -0.3450452, 0, 1, 0.5372549, 1,
-0.2257028, -0.1195256, -2.008127, 0, 1, 0.5450981, 1,
-0.2254209, -0.314984, -2.803427, 0, 1, 0.5490196, 1,
-0.2242733, 0.7943316, 0.9483549, 0, 1, 0.5568628, 1,
-0.2231162, 0.2066587, -0.3868689, 0, 1, 0.5607843, 1,
-0.2225103, 0.4217404, 1.250774, 0, 1, 0.5686275, 1,
-0.2198889, 1.260122, 0.1125135, 0, 1, 0.572549, 1,
-0.2196454, -2.023185, -3.115584, 0, 1, 0.5803922, 1,
-0.2195981, -1.023511, -2.57794, 0, 1, 0.5843138, 1,
-0.2172738, 1.10695, 0.8848245, 0, 1, 0.5921569, 1,
-0.21538, 0.1372627, -0.272015, 0, 1, 0.5960785, 1,
-0.2109163, 0.455978, -0.9332425, 0, 1, 0.6039216, 1,
-0.2108025, 0.4686245, 1.223562, 0, 1, 0.6117647, 1,
-0.2083658, -0.8285996, -4.605935, 0, 1, 0.6156863, 1,
-0.2053582, 1.838704, 0.5314771, 0, 1, 0.6235294, 1,
-0.2019425, -2.081181, -2.169044, 0, 1, 0.627451, 1,
-0.1965278, -0.6702805, -3.932959, 0, 1, 0.6352941, 1,
-0.1899663, -0.1241216, -3.760055, 0, 1, 0.6392157, 1,
-0.1821352, 3.430905, 0.5277889, 0, 1, 0.6470588, 1,
-0.1819746, -1.38462, -0.6675235, 0, 1, 0.6509804, 1,
-0.1808509, -0.4703061, -3.96208, 0, 1, 0.6588235, 1,
-0.1783386, 0.7821666, 0.5400827, 0, 1, 0.6627451, 1,
-0.1774141, -2.297385, -3.597046, 0, 1, 0.6705883, 1,
-0.1760088, 2.024187, -1.249638, 0, 1, 0.6745098, 1,
-0.1757032, -0.7956906, -3.418792, 0, 1, 0.682353, 1,
-0.1674284, -1.607444, -4.622311, 0, 1, 0.6862745, 1,
-0.1654783, 0.3688142, 1.074973, 0, 1, 0.6941177, 1,
-0.1554203, 1.279211, -1.044563, 0, 1, 0.7019608, 1,
-0.1499428, 0.6315786, 0.7321518, 0, 1, 0.7058824, 1,
-0.1480013, -0.1622588, -2.480025, 0, 1, 0.7137255, 1,
-0.1467903, -0.161439, -1.752483, 0, 1, 0.7176471, 1,
-0.1403146, 0.2681862, -0.9063293, 0, 1, 0.7254902, 1,
-0.1370622, 1.483975, 0.9815394, 0, 1, 0.7294118, 1,
-0.1361509, -1.336864, -0.7362908, 0, 1, 0.7372549, 1,
-0.1352702, 1.027189, 0.1040828, 0, 1, 0.7411765, 1,
-0.1296271, 1.401297, -1.019293, 0, 1, 0.7490196, 1,
-0.1272427, -0.1792284, -2.855523, 0, 1, 0.7529412, 1,
-0.1266869, 0.2079218, -2.479523, 0, 1, 0.7607843, 1,
-0.1260944, 1.581787, -0.1550736, 0, 1, 0.7647059, 1,
-0.1183756, 0.04285217, -1.937649, 0, 1, 0.772549, 1,
-0.1155274, -1.927206, -3.907661, 0, 1, 0.7764706, 1,
-0.1127433, -1.393067, -2.185232, 0, 1, 0.7843137, 1,
-0.1095855, 1.279763, -0.2569691, 0, 1, 0.7882353, 1,
-0.1095299, -2.531516, -3.378593, 0, 1, 0.7960784, 1,
-0.109256, -0.1162005, -2.025447, 0, 1, 0.8039216, 1,
-0.1073966, -0.2339694, -2.994083, 0, 1, 0.8078431, 1,
-0.1073202, 0.7994679, 0.3155902, 0, 1, 0.8156863, 1,
-0.1072933, 0.547762, -1.189232, 0, 1, 0.8196079, 1,
-0.1038606, -0.2658263, -3.142846, 0, 1, 0.827451, 1,
-0.1013433, 1.120882, 0.6189932, 0, 1, 0.8313726, 1,
-0.0961985, 0.1175245, 0.1061641, 0, 1, 0.8392157, 1,
-0.09610465, -0.4939446, -2.697737, 0, 1, 0.8431373, 1,
-0.09443548, 0.2385525, -1.396054, 0, 1, 0.8509804, 1,
-0.08632395, 1.732361, -1.432116, 0, 1, 0.854902, 1,
-0.07731679, 0.9455325, 0.6202935, 0, 1, 0.8627451, 1,
-0.07701223, -0.8281934, -3.13553, 0, 1, 0.8666667, 1,
-0.07604072, -0.4620701, -5.104547, 0, 1, 0.8745098, 1,
-0.0741571, 1.687249, -0.4587367, 0, 1, 0.8784314, 1,
-0.06727384, -0.05949286, -0.6052073, 0, 1, 0.8862745, 1,
-0.06496055, 0.7112589, 0.5179138, 0, 1, 0.8901961, 1,
-0.0632536, -0.03272369, 0.761958, 0, 1, 0.8980392, 1,
-0.06012863, -1.494406, -2.991325, 0, 1, 0.9058824, 1,
-0.05986714, -1.297976, -1.951701, 0, 1, 0.9098039, 1,
-0.05937763, 0.7605218, -0.1223505, 0, 1, 0.9176471, 1,
-0.05699151, -0.3792225, -2.478947, 0, 1, 0.9215686, 1,
-0.05586926, 0.8619419, -1.272094, 0, 1, 0.9294118, 1,
-0.05544718, 0.6766405, 0.5009648, 0, 1, 0.9333333, 1,
-0.05280218, 1.248711, 1.270918, 0, 1, 0.9411765, 1,
-0.05189672, -0.6446649, -3.784954, 0, 1, 0.945098, 1,
-0.04751035, -1.059952, -2.909825, 0, 1, 0.9529412, 1,
-0.0453706, 0.2845254, 0.4688575, 0, 1, 0.9568627, 1,
-0.04497227, 1.040975, -0.2828114, 0, 1, 0.9647059, 1,
-0.0433245, -0.154409, -2.484379, 0, 1, 0.9686275, 1,
-0.04193757, 0.3638035, -1.438889, 0, 1, 0.9764706, 1,
-0.03938117, -1.583696, -3.071292, 0, 1, 0.9803922, 1,
-0.03695556, -1.106647, -4.910577, 0, 1, 0.9882353, 1,
-0.03648777, -0.1863829, -1.988671, 0, 1, 0.9921569, 1,
-0.03217295, 0.9251935, 0.7239299, 0, 1, 1, 1,
-0.02321651, -0.2515074, -1.044889, 0, 0.9921569, 1, 1,
-0.02192895, 0.3243763, -0.1091412, 0, 0.9882353, 1, 1,
-0.01746132, -1.383548, -3.19294, 0, 0.9803922, 1, 1,
-0.01641424, -1.627364, -3.776086, 0, 0.9764706, 1, 1,
-0.01378104, 0.5548749, 0.03668634, 0, 0.9686275, 1, 1,
-0.01097172, -0.3188473, -3.447896, 0, 0.9647059, 1, 1,
-0.008815723, 0.2955089, -1.261276, 0, 0.9568627, 1, 1,
-0.005254212, 1.310297, 0.392574, 0, 0.9529412, 1, 1,
-0.004997248, 0.6688587, 0.9731101, 0, 0.945098, 1, 1,
0.003134468, -0.6305313, 2.150028, 0, 0.9411765, 1, 1,
0.005894592, -0.05688674, 3.789994, 0, 0.9333333, 1, 1,
0.007642841, 0.7930464, 1.413935, 0, 0.9294118, 1, 1,
0.01431678, -0.09130279, 3.323914, 0, 0.9215686, 1, 1,
0.01569199, 1.343387, 1.202872, 0, 0.9176471, 1, 1,
0.01571049, -0.4149608, 4.303719, 0, 0.9098039, 1, 1,
0.01994233, -0.5850228, 3.084536, 0, 0.9058824, 1, 1,
0.0247092, -2.326943, 4.16654, 0, 0.8980392, 1, 1,
0.02711292, 0.4798163, -1.907925, 0, 0.8901961, 1, 1,
0.0272555, 1.107187, -0.02871742, 0, 0.8862745, 1, 1,
0.03191806, 1.122127, 0.5841944, 0, 0.8784314, 1, 1,
0.03247668, 0.07169981, 0.7303141, 0, 0.8745098, 1, 1,
0.03345103, -0.6924993, 2.963698, 0, 0.8666667, 1, 1,
0.03408044, -0.6535026, 1.3554, 0, 0.8627451, 1, 1,
0.03656263, -1.318704, 0.7674437, 0, 0.854902, 1, 1,
0.03720082, 0.4823001, 0.2255772, 0, 0.8509804, 1, 1,
0.03777266, -0.140501, 2.172436, 0, 0.8431373, 1, 1,
0.04000424, 0.3610208, 0.5119997, 0, 0.8392157, 1, 1,
0.04113863, -0.6347303, 1.547394, 0, 0.8313726, 1, 1,
0.04244453, 0.3224835, 0.04660997, 0, 0.827451, 1, 1,
0.04246556, -1.064527, 3.247279, 0, 0.8196079, 1, 1,
0.04762606, -0.3290375, 2.967303, 0, 0.8156863, 1, 1,
0.05636567, -0.8789158, 1.910767, 0, 0.8078431, 1, 1,
0.05719352, 0.2364272, -0.5842196, 0, 0.8039216, 1, 1,
0.05888308, -0.1022487, 3.982574, 0, 0.7960784, 1, 1,
0.0601986, -0.3137325, 4.03389, 0, 0.7882353, 1, 1,
0.06134789, -1.921386, 2.194493, 0, 0.7843137, 1, 1,
0.06185534, 0.1748142, 0.8784983, 0, 0.7764706, 1, 1,
0.06740476, 0.2888972, 0.4439764, 0, 0.772549, 1, 1,
0.06765765, 1.731167, 0.9418319, 0, 0.7647059, 1, 1,
0.06866863, -0.2750388, 2.063108, 0, 0.7607843, 1, 1,
0.06995304, 0.2073941, 0.5287451, 0, 0.7529412, 1, 1,
0.07547429, 0.1486497, 1.366629, 0, 0.7490196, 1, 1,
0.07607061, -0.3557533, 1.401916, 0, 0.7411765, 1, 1,
0.07611308, -1.888574, 4.294584, 0, 0.7372549, 1, 1,
0.07731929, -0.2877328, 2.791268, 0, 0.7294118, 1, 1,
0.08005987, 1.752022, -0.401106, 0, 0.7254902, 1, 1,
0.08577067, -2.464552, 3.554838, 0, 0.7176471, 1, 1,
0.08730504, 0.4914199, -1.275476, 0, 0.7137255, 1, 1,
0.09177064, -1.262058, 3.19594, 0, 0.7058824, 1, 1,
0.09260407, 1.156268, 0.168732, 0, 0.6980392, 1, 1,
0.09472013, -0.574757, 1.042524, 0, 0.6941177, 1, 1,
0.09624352, -2.909784, 2.739202, 0, 0.6862745, 1, 1,
0.1035047, 0.1067822, 0.4085694, 0, 0.682353, 1, 1,
0.1040339, 1.477958, 0.004214445, 0, 0.6745098, 1, 1,
0.1154128, 0.8530875, -0.5767071, 0, 0.6705883, 1, 1,
0.1195094, -0.7008617, 1.937829, 0, 0.6627451, 1, 1,
0.1200636, 0.0782602, -0.2907524, 0, 0.6588235, 1, 1,
0.1221947, -0.4817138, 1.596399, 0, 0.6509804, 1, 1,
0.1233938, 0.1775655, -0.5584574, 0, 0.6470588, 1, 1,
0.1309965, 0.1747565, 0.107612, 0, 0.6392157, 1, 1,
0.1318207, 0.9171886, -2.039384, 0, 0.6352941, 1, 1,
0.1369437, -1.200132, 3.423743, 0, 0.627451, 1, 1,
0.1425707, 1.884691, 1.049527, 0, 0.6235294, 1, 1,
0.1449782, 0.279032, -0.6921765, 0, 0.6156863, 1, 1,
0.1479072, 0.179629, 2.095366, 0, 0.6117647, 1, 1,
0.1523663, -1.332767, 1.776229, 0, 0.6039216, 1, 1,
0.1543759, 1.184464, -0.2482699, 0, 0.5960785, 1, 1,
0.1555424, 1.728472, -1.994758, 0, 0.5921569, 1, 1,
0.1562004, 0.5468609, -0.9630907, 0, 0.5843138, 1, 1,
0.1595622, -0.4480172, 6.032251, 0, 0.5803922, 1, 1,
0.1609287, -0.6303475, 2.704228, 0, 0.572549, 1, 1,
0.1617764, 1.088332, 0.6549318, 0, 0.5686275, 1, 1,
0.1650095, -0.4433795, 2.694709, 0, 0.5607843, 1, 1,
0.1686124, -0.6878652, 0.6394705, 0, 0.5568628, 1, 1,
0.1688706, -0.1936954, 1.326676, 0, 0.5490196, 1, 1,
0.1742328, -0.182454, 1.637222, 0, 0.5450981, 1, 1,
0.1755723, -0.6452363, 4.199958, 0, 0.5372549, 1, 1,
0.1790109, 1.695231, -1.064109, 0, 0.5333334, 1, 1,
0.1812266, 0.9988149, -0.4565748, 0, 0.5254902, 1, 1,
0.1850864, -1.463875, 3.316364, 0, 0.5215687, 1, 1,
0.1868292, -0.1113187, 2.372714, 0, 0.5137255, 1, 1,
0.1886368, -0.001507124, 1.344999, 0, 0.509804, 1, 1,
0.1898406, 0.2622618, 2.967031, 0, 0.5019608, 1, 1,
0.1904374, 0.4048314, 0.1789542, 0, 0.4941176, 1, 1,
0.1934045, 1.766033, 2.261945, 0, 0.4901961, 1, 1,
0.1952356, -0.5907459, 2.356256, 0, 0.4823529, 1, 1,
0.1959816, -0.9884686, 2.884524, 0, 0.4784314, 1, 1,
0.2005666, -0.2669396, 3.514473, 0, 0.4705882, 1, 1,
0.2044703, -0.4338885, 2.429958, 0, 0.4666667, 1, 1,
0.2068337, 0.3912778, -1.001671, 0, 0.4588235, 1, 1,
0.2075202, 0.4880654, 0.5617464, 0, 0.454902, 1, 1,
0.2090166, 0.7665614, 1.280233, 0, 0.4470588, 1, 1,
0.2090453, 0.7463386, 0.1827914, 0, 0.4431373, 1, 1,
0.2122705, 2.084052, 0.8774769, 0, 0.4352941, 1, 1,
0.2149892, -1.734042, 2.533594, 0, 0.4313726, 1, 1,
0.2164664, 0.6407931, -1.299705, 0, 0.4235294, 1, 1,
0.2178335, 0.4476486, 0.7960658, 0, 0.4196078, 1, 1,
0.2198687, 0.2230542, 0.8272287, 0, 0.4117647, 1, 1,
0.2205698, 0.01860405, 2.045391, 0, 0.4078431, 1, 1,
0.2244102, -0.2438047, 1.488444, 0, 0.4, 1, 1,
0.2262178, -0.1230226, 1.903696, 0, 0.3921569, 1, 1,
0.2263365, -0.781152, 3.855146, 0, 0.3882353, 1, 1,
0.2266948, 0.2729906, -0.3878599, 0, 0.3803922, 1, 1,
0.2317784, -2.24984, 3.380571, 0, 0.3764706, 1, 1,
0.2326905, 1.850375, 1.050669, 0, 0.3686275, 1, 1,
0.2329464, 0.1241375, 3.77992, 0, 0.3647059, 1, 1,
0.2352283, 0.326971, -0.02343417, 0, 0.3568628, 1, 1,
0.2390324, 0.2828608, 1.249466, 0, 0.3529412, 1, 1,
0.2401085, -1.621425, 2.876087, 0, 0.345098, 1, 1,
0.2408236, 0.8884311, -0.6739048, 0, 0.3411765, 1, 1,
0.2416472, 1.297787, 0.4663894, 0, 0.3333333, 1, 1,
0.2418553, -0.8282956, 4.094959, 0, 0.3294118, 1, 1,
0.2451536, -1.067169, 2.260243, 0, 0.3215686, 1, 1,
0.2522148, -0.1808323, 1.916345, 0, 0.3176471, 1, 1,
0.2531532, 0.3910717, 0.8705446, 0, 0.3098039, 1, 1,
0.2545641, 0.01330187, 2.143831, 0, 0.3058824, 1, 1,
0.2546267, -2.376022, 0.9893271, 0, 0.2980392, 1, 1,
0.2559847, 0.003521503, 0.3353349, 0, 0.2901961, 1, 1,
0.2609218, -0.1433296, 2.835677, 0, 0.2862745, 1, 1,
0.2621323, 0.4863533, 0.4121446, 0, 0.2784314, 1, 1,
0.2665927, -0.6120135, 3.280404, 0, 0.2745098, 1, 1,
0.2669339, -0.3332026, 2.189075, 0, 0.2666667, 1, 1,
0.2696343, 0.01749411, 1.797121, 0, 0.2627451, 1, 1,
0.27148, -1.342743, 2.930555, 0, 0.254902, 1, 1,
0.2786035, -1.302247, 2.146012, 0, 0.2509804, 1, 1,
0.2798052, 0.5100251, 1.259462, 0, 0.2431373, 1, 1,
0.2805333, 0.09699224, 0.9926796, 0, 0.2392157, 1, 1,
0.2832792, -0.3920593, 2.330469, 0, 0.2313726, 1, 1,
0.2835372, 0.02120631, 0.09834042, 0, 0.227451, 1, 1,
0.2875434, -0.1514671, 2.256224, 0, 0.2196078, 1, 1,
0.2883109, -0.4628688, 1.988894, 0, 0.2156863, 1, 1,
0.2889474, 1.507803, 0.1992274, 0, 0.2078431, 1, 1,
0.289361, -1.256517, 3.19079, 0, 0.2039216, 1, 1,
0.2899163, -0.7313762, 3.915107, 0, 0.1960784, 1, 1,
0.2899298, -0.5689098, 3.064753, 0, 0.1882353, 1, 1,
0.2906698, 0.8167902, -1.629415, 0, 0.1843137, 1, 1,
0.2911692, -0.1438703, 2.283948, 0, 0.1764706, 1, 1,
0.2928444, 1.427291, 0.4881164, 0, 0.172549, 1, 1,
0.296984, 0.5317562, 0.1084335, 0, 0.1647059, 1, 1,
0.3019717, -0.5914501, 2.855607, 0, 0.1607843, 1, 1,
0.3033562, -0.5023745, 5.014604, 0, 0.1529412, 1, 1,
0.3061829, -0.4079572, 3.207705, 0, 0.1490196, 1, 1,
0.3104412, -1.035209, 6.05552, 0, 0.1411765, 1, 1,
0.3143357, -0.2635229, 4.361012, 0, 0.1372549, 1, 1,
0.3148042, -0.02044108, 1.819075, 0, 0.1294118, 1, 1,
0.3232825, 2.582319, -0.5664676, 0, 0.1254902, 1, 1,
0.3235153, 0.3359812, -0.5684986, 0, 0.1176471, 1, 1,
0.3281055, -1.33223, 3.269115, 0, 0.1137255, 1, 1,
0.3283597, 1.3193, -1.167774, 0, 0.1058824, 1, 1,
0.3302794, -0.9766949, 4.233572, 0, 0.09803922, 1, 1,
0.3311692, 0.3209363, 1.728953, 0, 0.09411765, 1, 1,
0.3328986, -0.5525029, 4.415588, 0, 0.08627451, 1, 1,
0.3345222, 0.8382804, 1.056834, 0, 0.08235294, 1, 1,
0.3367085, -1.44529, 2.55395, 0, 0.07450981, 1, 1,
0.347749, 0.36289, 0.6008483, 0, 0.07058824, 1, 1,
0.3501394, 0.2170332, 2.326422, 0, 0.0627451, 1, 1,
0.3519583, 0.403924, 0.2191078, 0, 0.05882353, 1, 1,
0.3532766, 0.3389198, 0.1444822, 0, 0.05098039, 1, 1,
0.3574163, -1.117381, 4.155938, 0, 0.04705882, 1, 1,
0.3594109, 0.4414579, 1.663352, 0, 0.03921569, 1, 1,
0.3607847, 0.4653056, 2.173527, 0, 0.03529412, 1, 1,
0.3608777, 1.012396, 0.9658587, 0, 0.02745098, 1, 1,
0.3608981, -0.1936541, 1.822409, 0, 0.02352941, 1, 1,
0.3640987, -0.431901, 3.615352, 0, 0.01568628, 1, 1,
0.3646284, -0.01871419, 1.842234, 0, 0.01176471, 1, 1,
0.3651207, 2.759566, 1.617609, 0, 0.003921569, 1, 1,
0.3655437, -0.6240017, 3.092431, 0.003921569, 0, 1, 1,
0.3675382, 1.67945, 0.3907804, 0.007843138, 0, 1, 1,
0.3702492, -1.671518, 2.330316, 0.01568628, 0, 1, 1,
0.3787985, 0.4940945, 0.2396276, 0.01960784, 0, 1, 1,
0.381458, -0.006630634, 1.470751, 0.02745098, 0, 1, 1,
0.3827652, 0.6495478, 0.7339533, 0.03137255, 0, 1, 1,
0.384644, -1.132619, 2.986496, 0.03921569, 0, 1, 1,
0.3886604, -0.5336853, 4.604528, 0.04313726, 0, 1, 1,
0.3897409, 0.1431689, 2.955323, 0.05098039, 0, 1, 1,
0.3911137, 0.7634545, -0.2265108, 0.05490196, 0, 1, 1,
0.3938718, -1.17939, 4.013388, 0.0627451, 0, 1, 1,
0.3973683, -0.2335899, 1.970987, 0.06666667, 0, 1, 1,
0.4097562, 0.8048711, 1.751259, 0.07450981, 0, 1, 1,
0.4128862, -1.652935, 3.654326, 0.07843138, 0, 1, 1,
0.4131593, 0.6168131, 2.334311, 0.08627451, 0, 1, 1,
0.413358, 0.9455749, -0.7632148, 0.09019608, 0, 1, 1,
0.413828, 0.3302462, -0.19996, 0.09803922, 0, 1, 1,
0.4141156, -1.35647, 0.2199166, 0.1058824, 0, 1, 1,
0.4180487, 0.1146614, 1.559957, 0.1098039, 0, 1, 1,
0.4212789, -0.6080309, 1.993066, 0.1176471, 0, 1, 1,
0.4217629, -1.027722, 2.782181, 0.1215686, 0, 1, 1,
0.4219709, 0.4892245, -0.3516976, 0.1294118, 0, 1, 1,
0.4221297, 2.577487, 0.2625585, 0.1333333, 0, 1, 1,
0.4241755, 0.6262791, 0.4519911, 0.1411765, 0, 1, 1,
0.4258001, -0.3586693, 2.174586, 0.145098, 0, 1, 1,
0.4262619, 0.1389865, 0.8504641, 0.1529412, 0, 1, 1,
0.4296261, -1.466353, 2.991863, 0.1568628, 0, 1, 1,
0.4307117, 1.166561, 0.3810052, 0.1647059, 0, 1, 1,
0.4367366, -1.158545, 1.808922, 0.1686275, 0, 1, 1,
0.4409257, -0.9761763, 3.957521, 0.1764706, 0, 1, 1,
0.4517885, -0.3064624, 1.851944, 0.1803922, 0, 1, 1,
0.4548641, 0.2698336, 2.089297, 0.1882353, 0, 1, 1,
0.4579104, -1.42695, 2.294997, 0.1921569, 0, 1, 1,
0.4583437, -1.021904, 3.253947, 0.2, 0, 1, 1,
0.4583959, 0.1035934, 0.8525424, 0.2078431, 0, 1, 1,
0.4689566, 0.03515512, -0.8634739, 0.2117647, 0, 1, 1,
0.4705169, -0.4129764, 2.119645, 0.2196078, 0, 1, 1,
0.4716364, 1.002119, 1.689154, 0.2235294, 0, 1, 1,
0.4771724, 0.8499918, -1.772016, 0.2313726, 0, 1, 1,
0.481155, 0.4540176, 0.6232826, 0.2352941, 0, 1, 1,
0.4838249, 2.411077, 1.024037, 0.2431373, 0, 1, 1,
0.4856634, 0.1291794, 1.10634, 0.2470588, 0, 1, 1,
0.4894254, -1.233641, 1.462433, 0.254902, 0, 1, 1,
0.4910316, 0.6559457, 0.9557046, 0.2588235, 0, 1, 1,
0.4920585, -0.3013628, 4.293128, 0.2666667, 0, 1, 1,
0.4934191, -0.6564716, 3.846986, 0.2705882, 0, 1, 1,
0.4991151, 1.77377, 0.1034004, 0.2784314, 0, 1, 1,
0.4997708, 0.7572429, 0.9551996, 0.282353, 0, 1, 1,
0.5015144, 1.394717, 0.6469967, 0.2901961, 0, 1, 1,
0.5023907, 0.8926195, 0.1175785, 0.2941177, 0, 1, 1,
0.5027295, 0.7058819, 0.8182055, 0.3019608, 0, 1, 1,
0.5055317, -1.14595, 2.430187, 0.3098039, 0, 1, 1,
0.5057443, -0.5225684, 2.825707, 0.3137255, 0, 1, 1,
0.5123016, -0.7327772, 3.962807, 0.3215686, 0, 1, 1,
0.5126681, 0.5517763, -0.1394635, 0.3254902, 0, 1, 1,
0.5178873, -0.7170008, 3.312849, 0.3333333, 0, 1, 1,
0.5181603, -0.3579533, 1.929391, 0.3372549, 0, 1, 1,
0.5210941, -2.35314, 2.148764, 0.345098, 0, 1, 1,
0.5227402, 2.782548, -0.8764282, 0.3490196, 0, 1, 1,
0.5228998, -0.7978032, 2.052848, 0.3568628, 0, 1, 1,
0.5302637, 0.06916185, 1.71239, 0.3607843, 0, 1, 1,
0.5325981, -0.1984606, 2.832341, 0.3686275, 0, 1, 1,
0.5333248, -1.417858, 3.621314, 0.372549, 0, 1, 1,
0.5336078, 1.064995, 0.8169211, 0.3803922, 0, 1, 1,
0.5390632, 0.3826822, 1.073901, 0.3843137, 0, 1, 1,
0.5400205, 1.513327, -1.88455, 0.3921569, 0, 1, 1,
0.54072, 0.7866153, 3.562169, 0.3960784, 0, 1, 1,
0.5409592, -2.089189, 4.388785, 0.4039216, 0, 1, 1,
0.5421696, -0.2899937, 1.766759, 0.4117647, 0, 1, 1,
0.5423127, 0.3343349, 2.149181, 0.4156863, 0, 1, 1,
0.5456337, 0.06588351, 2.627537, 0.4235294, 0, 1, 1,
0.5477121, 0.8791121, 1.84224, 0.427451, 0, 1, 1,
0.5478597, 1.481826, -0.6433972, 0.4352941, 0, 1, 1,
0.5500191, -0.0358767, 1.723885, 0.4392157, 0, 1, 1,
0.5501566, 0.8983086, 2.574649, 0.4470588, 0, 1, 1,
0.5549408, -0.4390874, 1.325584, 0.4509804, 0, 1, 1,
0.5590235, -0.009731168, 2.033095, 0.4588235, 0, 1, 1,
0.5698869, 0.01595687, 1.256204, 0.4627451, 0, 1, 1,
0.5701032, 1.045161, 1.239672, 0.4705882, 0, 1, 1,
0.5702785, 1.424804, -0.1722443, 0.4745098, 0, 1, 1,
0.5706841, -0.9610881, 1.388917, 0.4823529, 0, 1, 1,
0.572179, 0.4558476, 1.28741, 0.4862745, 0, 1, 1,
0.5723171, -0.0805623, 1.008943, 0.4941176, 0, 1, 1,
0.5725299, -0.8960193, 3.639908, 0.5019608, 0, 1, 1,
0.5756666, 0.1581435, 1.840761, 0.5058824, 0, 1, 1,
0.5777847, 0.773342, 0.5782158, 0.5137255, 0, 1, 1,
0.5795061, -1.885912, 2.606991, 0.5176471, 0, 1, 1,
0.5822641, -1.751472, 2.225461, 0.5254902, 0, 1, 1,
0.5836887, 0.5396202, -0.05235411, 0.5294118, 0, 1, 1,
0.5853579, 0.3534538, 1.857079, 0.5372549, 0, 1, 1,
0.5859066, 0.5948411, -0.2098659, 0.5411765, 0, 1, 1,
0.5876843, 1.144937, -0.132825, 0.5490196, 0, 1, 1,
0.5991225, -1.020116, 3.128872, 0.5529412, 0, 1, 1,
0.6033639, -0.5687761, 3.435332, 0.5607843, 0, 1, 1,
0.6084695, -1.743958, 0.8445835, 0.5647059, 0, 1, 1,
0.6087144, 1.600989, -0.08000913, 0.572549, 0, 1, 1,
0.6122062, 0.6679149, 0.104929, 0.5764706, 0, 1, 1,
0.6138862, -1.076836, 1.343752, 0.5843138, 0, 1, 1,
0.6142298, -2.36315, 4.785357, 0.5882353, 0, 1, 1,
0.6274363, -1.017821, 4.408539, 0.5960785, 0, 1, 1,
0.6409673, 0.5365206, 1.086213, 0.6039216, 0, 1, 1,
0.6428815, -1.040733, 2.192558, 0.6078432, 0, 1, 1,
0.6488453, 0.5742348, 1.456935, 0.6156863, 0, 1, 1,
0.6669266, -0.8276909, 0.7207969, 0.6196079, 0, 1, 1,
0.6699876, 1.262112, -0.682656, 0.627451, 0, 1, 1,
0.6706923, 1.135891, -1.393422, 0.6313726, 0, 1, 1,
0.6747562, 0.2568721, 1.30171, 0.6392157, 0, 1, 1,
0.6747721, 1.915401, -0.1183835, 0.6431373, 0, 1, 1,
0.679251, 0.04921915, 1.369229, 0.6509804, 0, 1, 1,
0.6803715, -0.1658114, 1.631689, 0.654902, 0, 1, 1,
0.683579, -1.044822, 3.802418, 0.6627451, 0, 1, 1,
0.6838636, 0.1488305, 3.372258, 0.6666667, 0, 1, 1,
0.6945516, 1.715378, 1.589791, 0.6745098, 0, 1, 1,
0.6973903, 0.1579701, 1.561244, 0.6784314, 0, 1, 1,
0.6981275, -1.111988, 2.102066, 0.6862745, 0, 1, 1,
0.6982296, 0.3699903, 1.242687, 0.6901961, 0, 1, 1,
0.6987542, -1.787794, 3.558313, 0.6980392, 0, 1, 1,
0.702278, 1.22566, 1.133307, 0.7058824, 0, 1, 1,
0.7040409, -1.52314, 3.453981, 0.7098039, 0, 1, 1,
0.7061007, 0.1605837, 1.976853, 0.7176471, 0, 1, 1,
0.7084133, 0.9249641, 1.058651, 0.7215686, 0, 1, 1,
0.7087862, 0.5673534, 1.665029, 0.7294118, 0, 1, 1,
0.7094408, 0.8121367, 2.268253, 0.7333333, 0, 1, 1,
0.7152877, 0.08435518, 1.746177, 0.7411765, 0, 1, 1,
0.7175549, 0.4942982, 0.9035137, 0.7450981, 0, 1, 1,
0.7190756, 0.6286275, 2.501829, 0.7529412, 0, 1, 1,
0.7215704, -0.05659623, -0.1179706, 0.7568628, 0, 1, 1,
0.728112, 1.221525, 0.7012219, 0.7647059, 0, 1, 1,
0.7319828, -0.685173, 2.230439, 0.7686275, 0, 1, 1,
0.7392112, 1.501751, -0.1050934, 0.7764706, 0, 1, 1,
0.7398943, -1.971173, 2.955312, 0.7803922, 0, 1, 1,
0.7437789, 0.4592055, 1.124658, 0.7882353, 0, 1, 1,
0.7446606, 1.543692, -0.06274747, 0.7921569, 0, 1, 1,
0.75132, 0.1583849, 1.503597, 0.8, 0, 1, 1,
0.7713378, 0.05761607, -0.4668991, 0.8078431, 0, 1, 1,
0.8030154, -0.530091, 2.400176, 0.8117647, 0, 1, 1,
0.8055952, -0.1077427, 2.574007, 0.8196079, 0, 1, 1,
0.8141001, 0.6601335, 1.694882, 0.8235294, 0, 1, 1,
0.8147398, -0.1526758, 0.02331563, 0.8313726, 0, 1, 1,
0.8172227, 1.060795, 0.3867612, 0.8352941, 0, 1, 1,
0.8183178, 0.009644166, 2.321658, 0.8431373, 0, 1, 1,
0.8219473, 1.039375, 1.982729, 0.8470588, 0, 1, 1,
0.8281081, -0.7742025, 2.16214, 0.854902, 0, 1, 1,
0.8320456, -0.8428363, 2.02667, 0.8588235, 0, 1, 1,
0.8353341, 1.065649, 0.2792096, 0.8666667, 0, 1, 1,
0.8409488, -0.1060632, 1.086325, 0.8705882, 0, 1, 1,
0.8428181, -0.1341814, 2.809544, 0.8784314, 0, 1, 1,
0.8462035, -0.5666545, 1.093379, 0.8823529, 0, 1, 1,
0.8500634, 0.3312573, 0.9344956, 0.8901961, 0, 1, 1,
0.8578095, 0.09275798, 1.496451, 0.8941177, 0, 1, 1,
0.8582805, 1.171536, 0.02600367, 0.9019608, 0, 1, 1,
0.8585032, 0.2197352, 0.8947051, 0.9098039, 0, 1, 1,
0.8597878, -1.572207, 3.143739, 0.9137255, 0, 1, 1,
0.8601384, 0.7462251, -1.031512, 0.9215686, 0, 1, 1,
0.8641942, 0.1952663, 0.8452673, 0.9254902, 0, 1, 1,
0.866051, 0.2477959, -1.329713, 0.9333333, 0, 1, 1,
0.8663729, 0.3327873, 1.370077, 0.9372549, 0, 1, 1,
0.871, -0.7883101, 1.754388, 0.945098, 0, 1, 1,
0.8764542, 0.6322477, 1.020365, 0.9490196, 0, 1, 1,
0.880609, -0.3356785, 1.792392, 0.9568627, 0, 1, 1,
0.8817626, 0.7292798, 1.160845, 0.9607843, 0, 1, 1,
0.8830165, 1.504592, 0.7265232, 0.9686275, 0, 1, 1,
0.8842407, -1.681301, 4.503872, 0.972549, 0, 1, 1,
0.9017751, 1.147339, 0.9544452, 0.9803922, 0, 1, 1,
0.9023409, 1.927476, 0.7942935, 0.9843137, 0, 1, 1,
0.9035166, -0.09112649, 2.035598, 0.9921569, 0, 1, 1,
0.9134212, 0.006553046, 0.700745, 0.9960784, 0, 1, 1,
0.9168471, -0.2817145, 0.6345362, 1, 0, 0.9960784, 1,
0.916972, -0.5385164, 3.787765, 1, 0, 0.9882353, 1,
0.9185112, 1.214233, 0.4124583, 1, 0, 0.9843137, 1,
0.9230089, 0.392875, 1.61723, 1, 0, 0.9764706, 1,
0.9237266, 0.459334, -0.9015858, 1, 0, 0.972549, 1,
0.924956, 0.3740704, 1.217907, 1, 0, 0.9647059, 1,
0.9372258, 0.7178606, 0.9262195, 1, 0, 0.9607843, 1,
0.9394084, 2.068624, 1.866255, 1, 0, 0.9529412, 1,
0.9445644, -0.6765384, 4.095257, 1, 0, 0.9490196, 1,
0.9477918, 1.359094, 0.8867567, 1, 0, 0.9411765, 1,
0.9516212, -0.4954195, 3.105745, 1, 0, 0.9372549, 1,
0.9589362, -1.102339, 2.773366, 1, 0, 0.9294118, 1,
0.9590874, -0.2611445, 1.822424, 1, 0, 0.9254902, 1,
0.9616088, 1.237007, 0.5874932, 1, 0, 0.9176471, 1,
0.964653, 1.056449, 2.047141, 1, 0, 0.9137255, 1,
0.9661759, 0.5430651, 1.002273, 1, 0, 0.9058824, 1,
0.968399, 0.6219545, 2.220111, 1, 0, 0.9019608, 1,
0.9728379, 0.3049595, 2.425976, 1, 0, 0.8941177, 1,
0.9738998, 0.1773222, 0.8174396, 1, 0, 0.8862745, 1,
0.9749324, -1.882138, 2.936247, 1, 0, 0.8823529, 1,
0.9758083, 1.281228, 1.943874, 1, 0, 0.8745098, 1,
0.9769676, -0.5743731, 1.354226, 1, 0, 0.8705882, 1,
0.9858062, 1.44421, -0.8678318, 1, 0, 0.8627451, 1,
0.9892426, 0.1359303, 0.2674895, 1, 0, 0.8588235, 1,
0.9983584, 0.04293389, 0.8863148, 1, 0, 0.8509804, 1,
1.000987, 0.99189, 0.9791299, 1, 0, 0.8470588, 1,
1.004775, -0.1938385, 0.7182177, 1, 0, 0.8392157, 1,
1.006346, -0.2390836, 1.647994, 1, 0, 0.8352941, 1,
1.014278, -0.3750394, 3.532782, 1, 0, 0.827451, 1,
1.018118, -1.763501, 2.006459, 1, 0, 0.8235294, 1,
1.02572, 0.4249364, 0.536694, 1, 0, 0.8156863, 1,
1.028214, 0.5072637, 1.313809, 1, 0, 0.8117647, 1,
1.032307, 0.7245309, 0.3032114, 1, 0, 0.8039216, 1,
1.033433, 1.270965, 0.581857, 1, 0, 0.7960784, 1,
1.034054, 0.522679, 1.190052, 1, 0, 0.7921569, 1,
1.035139, 1.8647, 0.4090453, 1, 0, 0.7843137, 1,
1.03536, 0.3202948, 2.073343, 1, 0, 0.7803922, 1,
1.040112, -1.448122, 2.580639, 1, 0, 0.772549, 1,
1.043508, -1.0446, 0.6274632, 1, 0, 0.7686275, 1,
1.07771, 0.3304835, 1.020214, 1, 0, 0.7607843, 1,
1.077807, 1.057493, 1.390129, 1, 0, 0.7568628, 1,
1.078972, -1.477188, 3.145582, 1, 0, 0.7490196, 1,
1.080565, 1.55009, 1.032913, 1, 0, 0.7450981, 1,
1.086766, 0.9348943, 1.317407, 1, 0, 0.7372549, 1,
1.094205, 0.6037871, 0.3353318, 1, 0, 0.7333333, 1,
1.095886, 0.192811, -0.3057539, 1, 0, 0.7254902, 1,
1.101566, 1.264785, 1.043509, 1, 0, 0.7215686, 1,
1.114821, 1.067606, 1.467469, 1, 0, 0.7137255, 1,
1.118473, -0.1699527, 0.6706357, 1, 0, 0.7098039, 1,
1.123278, 0.03764984, 2.234481, 1, 0, 0.7019608, 1,
1.125929, -0.6334256, 2.988536, 1, 0, 0.6941177, 1,
1.12599, 0.3133733, 3.526646, 1, 0, 0.6901961, 1,
1.126601, -0.5416245, -0.7402508, 1, 0, 0.682353, 1,
1.127228, -0.1059899, 2.645913, 1, 0, 0.6784314, 1,
1.128368, 2.202331, 1.92071, 1, 0, 0.6705883, 1,
1.131319, -0.2434065, 0.7929745, 1, 0, 0.6666667, 1,
1.132915, 0.7770036, 1.658758, 1, 0, 0.6588235, 1,
1.13526, -0.5014468, 2.626547, 1, 0, 0.654902, 1,
1.142981, 0.2109507, 1.468168, 1, 0, 0.6470588, 1,
1.150858, 0.3546295, 0.1871276, 1, 0, 0.6431373, 1,
1.159065, 0.5640301, 4.631676, 1, 0, 0.6352941, 1,
1.170728, 0.2786417, 0.8457593, 1, 0, 0.6313726, 1,
1.18813, -0.7263144, 2.4843, 1, 0, 0.6235294, 1,
1.188281, 2.01186, 0.5363415, 1, 0, 0.6196079, 1,
1.188945, -0.06449375, 2.460235, 1, 0, 0.6117647, 1,
1.202134, 0.8415855, 1.671164, 1, 0, 0.6078432, 1,
1.203319, -1.220782, 1.404148, 1, 0, 0.6, 1,
1.210431, 1.4761, 1.023878, 1, 0, 0.5921569, 1,
1.210662, -0.9029518, 2.210463, 1, 0, 0.5882353, 1,
1.215028, 0.3416533, -0.3622834, 1, 0, 0.5803922, 1,
1.221069, 0.108516, 0.1190651, 1, 0, 0.5764706, 1,
1.225815, 0.5757246, 3.133872, 1, 0, 0.5686275, 1,
1.232889, 0.7209399, 1.709711, 1, 0, 0.5647059, 1,
1.237585, -0.4813477, 2.414274, 1, 0, 0.5568628, 1,
1.239669, -0.2241705, -0.3275156, 1, 0, 0.5529412, 1,
1.253862, 0.4756253, 0.7634306, 1, 0, 0.5450981, 1,
1.254993, 0.5139151, 0.8195252, 1, 0, 0.5411765, 1,
1.260608, 0.3788085, 1.274087, 1, 0, 0.5333334, 1,
1.264792, 0.5843738, 0.5363532, 1, 0, 0.5294118, 1,
1.266554, -0.3525904, 1.596493, 1, 0, 0.5215687, 1,
1.269314, 0.3152759, 1.62992, 1, 0, 0.5176471, 1,
1.289304, 0.2628452, 1.434783, 1, 0, 0.509804, 1,
1.291961, -0.4496208, 2.673884, 1, 0, 0.5058824, 1,
1.293354, -0.2274094, 0.5377374, 1, 0, 0.4980392, 1,
1.307006, -0.4969628, 2.596507, 1, 0, 0.4901961, 1,
1.338767, 0.6866703, -0.6267956, 1, 0, 0.4862745, 1,
1.341004, 1.120307, 1.735804, 1, 0, 0.4784314, 1,
1.34393, 1.33647, -0.1305102, 1, 0, 0.4745098, 1,
1.344303, 0.9266481, 0.145981, 1, 0, 0.4666667, 1,
1.347225, 0.2319607, 0.6629029, 1, 0, 0.4627451, 1,
1.355497, 0.327581, 2.495322, 1, 0, 0.454902, 1,
1.358242, -0.2896941, 1.12809, 1, 0, 0.4509804, 1,
1.368227, 0.4517743, 2.409129, 1, 0, 0.4431373, 1,
1.3712, -0.7160859, 2.127528, 1, 0, 0.4392157, 1,
1.374287, 0.2336658, 1.331191, 1, 0, 0.4313726, 1,
1.389672, -1.471507, 2.21069, 1, 0, 0.427451, 1,
1.390456, -0.4792331, 1.36949, 1, 0, 0.4196078, 1,
1.400858, 0.4341431, 1.078713, 1, 0, 0.4156863, 1,
1.406462, -1.535766, 1.838594, 1, 0, 0.4078431, 1,
1.439145, 0.4255348, 0.6260771, 1, 0, 0.4039216, 1,
1.442352, -0.09662812, 2.009827, 1, 0, 0.3960784, 1,
1.446544, -0.131199, 2.417515, 1, 0, 0.3882353, 1,
1.448154, 0.9308266, 0.9405769, 1, 0, 0.3843137, 1,
1.458058, -1.533195, 1.264999, 1, 0, 0.3764706, 1,
1.458382, -0.3491617, 0.5806363, 1, 0, 0.372549, 1,
1.469266, 1.450004, 2.53059, 1, 0, 0.3647059, 1,
1.469385, 0.4377643, 0.4760316, 1, 0, 0.3607843, 1,
1.477799, -0.3575456, 0.683561, 1, 0, 0.3529412, 1,
1.480345, -0.7143224, 1.745323, 1, 0, 0.3490196, 1,
1.56811, -1.296693, 3.113817, 1, 0, 0.3411765, 1,
1.588787, 0.3675082, 1.515562, 1, 0, 0.3372549, 1,
1.594322, -1.511128, 2.556672, 1, 0, 0.3294118, 1,
1.597387, -0.05570285, 2.62633, 1, 0, 0.3254902, 1,
1.611828, 0.4219285, -0.7147537, 1, 0, 0.3176471, 1,
1.61833, -0.3238056, 2.220662, 1, 0, 0.3137255, 1,
1.628385, 0.02808307, 4.084416, 1, 0, 0.3058824, 1,
1.6324, -0.1261679, 1.417497, 1, 0, 0.2980392, 1,
1.632531, 1.33045, 1.494705, 1, 0, 0.2941177, 1,
1.634117, -1.183122, 1.248988, 1, 0, 0.2862745, 1,
1.640402, -1.001772, 2.261451, 1, 0, 0.282353, 1,
1.649601, 1.741429, 0.583064, 1, 0, 0.2745098, 1,
1.662246, -0.06975363, 0.2977307, 1, 0, 0.2705882, 1,
1.677122, -0.6722072, 1.522761, 1, 0, 0.2627451, 1,
1.691758, -1.012839, 2.837022, 1, 0, 0.2588235, 1,
1.695216, 2.146958, 0.7744445, 1, 0, 0.2509804, 1,
1.706442, 0.9913835, 1.571877, 1, 0, 0.2470588, 1,
1.709874, 0.1190888, 2.621087, 1, 0, 0.2392157, 1,
1.716705, -0.2841018, 1.896774, 1, 0, 0.2352941, 1,
1.72202, -0.699907, 2.231053, 1, 0, 0.227451, 1,
1.753448, -0.8163393, 3.270121, 1, 0, 0.2235294, 1,
1.776337, 1.604946, 0.1869519, 1, 0, 0.2156863, 1,
1.781294, -0.9022141, 0.2932186, 1, 0, 0.2117647, 1,
1.792448, 0.1719126, 0.08809205, 1, 0, 0.2039216, 1,
1.820453, 2.531017, 0.948926, 1, 0, 0.1960784, 1,
1.822936, -0.4550373, 2.398919, 1, 0, 0.1921569, 1,
1.856702, 1.054383, 0.6670378, 1, 0, 0.1843137, 1,
1.896877, 1.160688, 1.325227, 1, 0, 0.1803922, 1,
1.901444, 0.4961216, 1.430821, 1, 0, 0.172549, 1,
1.931216, -0.7222942, 1.447178, 1, 0, 0.1686275, 1,
1.965251, 0.0595281, 2.060037, 1, 0, 0.1607843, 1,
1.967182, 0.5883079, 1.535369, 1, 0, 0.1568628, 1,
2.003541, -0.1386036, 2.564593, 1, 0, 0.1490196, 1,
2.00817, 0.6898866, 1.712838, 1, 0, 0.145098, 1,
2.00975, 1.037902, 1.083123, 1, 0, 0.1372549, 1,
2.07486, 1.244265, 0.812878, 1, 0, 0.1333333, 1,
2.080982, 1.321178, 0.6385799, 1, 0, 0.1254902, 1,
2.091658, -0.1117671, 1.624646, 1, 0, 0.1215686, 1,
2.124223, -0.2561907, 0.727739, 1, 0, 0.1137255, 1,
2.136763, -0.0383142, 2.352596, 1, 0, 0.1098039, 1,
2.144207, 2.173533, 0.2711409, 1, 0, 0.1019608, 1,
2.147966, 0.01497426, 2.422256, 1, 0, 0.09411765, 1,
2.153873, 0.6555871, 1.855839, 1, 0, 0.09019608, 1,
2.17753, 0.7961429, 1.183233, 1, 0, 0.08235294, 1,
2.17813, -0.4109468, 1.362334, 1, 0, 0.07843138, 1,
2.20469, 0.06065409, 1.044812, 1, 0, 0.07058824, 1,
2.228632, -0.9490883, 3.204496, 1, 0, 0.06666667, 1,
2.286768, 0.5295525, 0.4762681, 1, 0, 0.05882353, 1,
2.309169, -0.8131611, 3.578651, 1, 0, 0.05490196, 1,
2.314035, 1.535281, 2.221209, 1, 0, 0.04705882, 1,
2.32812, 0.3448009, 3.374744, 1, 0, 0.04313726, 1,
2.345349, -0.5972989, 2.050336, 1, 0, 0.03529412, 1,
2.432013, -0.5108968, 1.979805, 1, 0, 0.03137255, 1,
2.484343, 0.6543935, 2.32215, 1, 0, 0.02352941, 1,
2.779144, 0.3479089, 3.099216, 1, 0, 0.01960784, 1,
2.992481, -0.8874091, 0.8302113, 1, 0, 0.01176471, 1,
3.006336, -0.04536954, 1.953244, 1, 0, 0.007843138, 1
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
-0.2322, -3.984531, -7.097837, 0, -0.5, 0.5, 0.5,
-0.2322, -3.984531, -7.097837, 1, -0.5, 0.5, 0.5,
-0.2322, -3.984531, -7.097837, 1, 1.5, 0.5, 0.5,
-0.2322, -3.984531, -7.097837, 0, 1.5, 0.5, 0.5
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
-4.5686, 0.2605603, -7.097837, 0, -0.5, 0.5, 0.5,
-4.5686, 0.2605603, -7.097837, 1, -0.5, 0.5, 0.5,
-4.5686, 0.2605603, -7.097837, 1, 1.5, 0.5, 0.5,
-4.5686, 0.2605603, -7.097837, 0, 1.5, 0.5, 0.5
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
-4.5686, -3.984531, 0.432024, 0, -0.5, 0.5, 0.5,
-4.5686, -3.984531, 0.432024, 1, -0.5, 0.5, 0.5,
-4.5686, -3.984531, 0.432024, 1, 1.5, 0.5, 0.5,
-4.5686, -3.984531, 0.432024, 0, 1.5, 0.5, 0.5
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
-3, -3.004894, -5.360177,
3, -3.004894, -5.360177,
-3, -3.004894, -5.360177,
-3, -3.168167, -5.649787,
-2, -3.004894, -5.360177,
-2, -3.168167, -5.649787,
-1, -3.004894, -5.360177,
-1, -3.168167, -5.649787,
0, -3.004894, -5.360177,
0, -3.168167, -5.649787,
1, -3.004894, -5.360177,
1, -3.168167, -5.649787,
2, -3.004894, -5.360177,
2, -3.168167, -5.649787,
3, -3.004894, -5.360177,
3, -3.168167, -5.649787
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
-3, -3.494713, -6.229007, 0, -0.5, 0.5, 0.5,
-3, -3.494713, -6.229007, 1, -0.5, 0.5, 0.5,
-3, -3.494713, -6.229007, 1, 1.5, 0.5, 0.5,
-3, -3.494713, -6.229007, 0, 1.5, 0.5, 0.5,
-2, -3.494713, -6.229007, 0, -0.5, 0.5, 0.5,
-2, -3.494713, -6.229007, 1, -0.5, 0.5, 0.5,
-2, -3.494713, -6.229007, 1, 1.5, 0.5, 0.5,
-2, -3.494713, -6.229007, 0, 1.5, 0.5, 0.5,
-1, -3.494713, -6.229007, 0, -0.5, 0.5, 0.5,
-1, -3.494713, -6.229007, 1, -0.5, 0.5, 0.5,
-1, -3.494713, -6.229007, 1, 1.5, 0.5, 0.5,
-1, -3.494713, -6.229007, 0, 1.5, 0.5, 0.5,
0, -3.494713, -6.229007, 0, -0.5, 0.5, 0.5,
0, -3.494713, -6.229007, 1, -0.5, 0.5, 0.5,
0, -3.494713, -6.229007, 1, 1.5, 0.5, 0.5,
0, -3.494713, -6.229007, 0, 1.5, 0.5, 0.5,
1, -3.494713, -6.229007, 0, -0.5, 0.5, 0.5,
1, -3.494713, -6.229007, 1, -0.5, 0.5, 0.5,
1, -3.494713, -6.229007, 1, 1.5, 0.5, 0.5,
1, -3.494713, -6.229007, 0, 1.5, 0.5, 0.5,
2, -3.494713, -6.229007, 0, -0.5, 0.5, 0.5,
2, -3.494713, -6.229007, 1, -0.5, 0.5, 0.5,
2, -3.494713, -6.229007, 1, 1.5, 0.5, 0.5,
2, -3.494713, -6.229007, 0, 1.5, 0.5, 0.5,
3, -3.494713, -6.229007, 0, -0.5, 0.5, 0.5,
3, -3.494713, -6.229007, 1, -0.5, 0.5, 0.5,
3, -3.494713, -6.229007, 1, 1.5, 0.5, 0.5,
3, -3.494713, -6.229007, 0, 1.5, 0.5, 0.5
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
-3.567892, -2, -5.360177,
-3.567892, 3, -5.360177,
-3.567892, -2, -5.360177,
-3.734677, -2, -5.649787,
-3.567892, -1, -5.360177,
-3.734677, -1, -5.649787,
-3.567892, 0, -5.360177,
-3.734677, 0, -5.649787,
-3.567892, 1, -5.360177,
-3.734677, 1, -5.649787,
-3.567892, 2, -5.360177,
-3.734677, 2, -5.649787,
-3.567892, 3, -5.360177,
-3.734677, 3, -5.649787
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
-4.068246, -2, -6.229007, 0, -0.5, 0.5, 0.5,
-4.068246, -2, -6.229007, 1, -0.5, 0.5, 0.5,
-4.068246, -2, -6.229007, 1, 1.5, 0.5, 0.5,
-4.068246, -2, -6.229007, 0, 1.5, 0.5, 0.5,
-4.068246, -1, -6.229007, 0, -0.5, 0.5, 0.5,
-4.068246, -1, -6.229007, 1, -0.5, 0.5, 0.5,
-4.068246, -1, -6.229007, 1, 1.5, 0.5, 0.5,
-4.068246, -1, -6.229007, 0, 1.5, 0.5, 0.5,
-4.068246, 0, -6.229007, 0, -0.5, 0.5, 0.5,
-4.068246, 0, -6.229007, 1, -0.5, 0.5, 0.5,
-4.068246, 0, -6.229007, 1, 1.5, 0.5, 0.5,
-4.068246, 0, -6.229007, 0, 1.5, 0.5, 0.5,
-4.068246, 1, -6.229007, 0, -0.5, 0.5, 0.5,
-4.068246, 1, -6.229007, 1, -0.5, 0.5, 0.5,
-4.068246, 1, -6.229007, 1, 1.5, 0.5, 0.5,
-4.068246, 1, -6.229007, 0, 1.5, 0.5, 0.5,
-4.068246, 2, -6.229007, 0, -0.5, 0.5, 0.5,
-4.068246, 2, -6.229007, 1, -0.5, 0.5, 0.5,
-4.068246, 2, -6.229007, 1, 1.5, 0.5, 0.5,
-4.068246, 2, -6.229007, 0, 1.5, 0.5, 0.5,
-4.068246, 3, -6.229007, 0, -0.5, 0.5, 0.5,
-4.068246, 3, -6.229007, 1, -0.5, 0.5, 0.5,
-4.068246, 3, -6.229007, 1, 1.5, 0.5, 0.5,
-4.068246, 3, -6.229007, 0, 1.5, 0.5, 0.5
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
-3.567892, -3.004894, -4,
-3.567892, -3.004894, 6,
-3.567892, -3.004894, -4,
-3.734677, -3.168167, -4,
-3.567892, -3.004894, -2,
-3.734677, -3.168167, -2,
-3.567892, -3.004894, 0,
-3.734677, -3.168167, 0,
-3.567892, -3.004894, 2,
-3.734677, -3.168167, 2,
-3.567892, -3.004894, 4,
-3.734677, -3.168167, 4,
-3.567892, -3.004894, 6,
-3.734677, -3.168167, 6
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
"4",
"6"
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
-4.068246, -3.494713, -4, 0, -0.5, 0.5, 0.5,
-4.068246, -3.494713, -4, 1, -0.5, 0.5, 0.5,
-4.068246, -3.494713, -4, 1, 1.5, 0.5, 0.5,
-4.068246, -3.494713, -4, 0, 1.5, 0.5, 0.5,
-4.068246, -3.494713, -2, 0, -0.5, 0.5, 0.5,
-4.068246, -3.494713, -2, 1, -0.5, 0.5, 0.5,
-4.068246, -3.494713, -2, 1, 1.5, 0.5, 0.5,
-4.068246, -3.494713, -2, 0, 1.5, 0.5, 0.5,
-4.068246, -3.494713, 0, 0, -0.5, 0.5, 0.5,
-4.068246, -3.494713, 0, 1, -0.5, 0.5, 0.5,
-4.068246, -3.494713, 0, 1, 1.5, 0.5, 0.5,
-4.068246, -3.494713, 0, 0, 1.5, 0.5, 0.5,
-4.068246, -3.494713, 2, 0, -0.5, 0.5, 0.5,
-4.068246, -3.494713, 2, 1, -0.5, 0.5, 0.5,
-4.068246, -3.494713, 2, 1, 1.5, 0.5, 0.5,
-4.068246, -3.494713, 2, 0, 1.5, 0.5, 0.5,
-4.068246, -3.494713, 4, 0, -0.5, 0.5, 0.5,
-4.068246, -3.494713, 4, 1, -0.5, 0.5, 0.5,
-4.068246, -3.494713, 4, 1, 1.5, 0.5, 0.5,
-4.068246, -3.494713, 4, 0, 1.5, 0.5, 0.5,
-4.068246, -3.494713, 6, 0, -0.5, 0.5, 0.5,
-4.068246, -3.494713, 6, 1, -0.5, 0.5, 0.5,
-4.068246, -3.494713, 6, 1, 1.5, 0.5, 0.5,
-4.068246, -3.494713, 6, 0, 1.5, 0.5, 0.5
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
-3.567892, -3.004894, -5.360177,
-3.567892, 3.526015, -5.360177,
-3.567892, -3.004894, 6.224225,
-3.567892, 3.526015, 6.224225,
-3.567892, -3.004894, -5.360177,
-3.567892, -3.004894, 6.224225,
-3.567892, 3.526015, -5.360177,
-3.567892, 3.526015, 6.224225,
-3.567892, -3.004894, -5.360177,
3.103492, -3.004894, -5.360177,
-3.567892, -3.004894, 6.224225,
3.103492, -3.004894, 6.224225,
-3.567892, 3.526015, -5.360177,
3.103492, 3.526015, -5.360177,
-3.567892, 3.526015, 6.224225,
3.103492, 3.526015, 6.224225,
3.103492, -3.004894, -5.360177,
3.103492, 3.526015, -5.360177,
3.103492, -3.004894, 6.224225,
3.103492, 3.526015, 6.224225,
3.103492, -3.004894, -5.360177,
3.103492, -3.004894, 6.224225,
3.103492, 3.526015, -5.360177,
3.103492, 3.526015, 6.224225
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
var radius = 7.944628;
var distance = 35.34655;
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
mvMatrix.translate( 0.2322, -0.2605603, -0.432024 );
mvMatrix.scale( 1.287572, 1.315267, 0.7415047 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.34655);
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
pefurazoate<-read.table("pefurazoate.xyz")
```

```
## Error in read.table("pefurazoate.xyz"): no lines available in input
```

```r
x<-pefurazoate$V2
```

```
## Error in eval(expr, envir, enclos): object 'pefurazoate' not found
```

```r
y<-pefurazoate$V3
```

```
## Error in eval(expr, envir, enclos): object 'pefurazoate' not found
```

```r
z<-pefurazoate$V4
```

```
## Error in eval(expr, envir, enclos): object 'pefurazoate' not found
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
-3.470736, -0.9612849, -4.506685, 0, 0, 1, 1, 1,
-3.005767, -0.7628933, -1.133014, 1, 0, 0, 1, 1,
-2.983261, 0.250396, -0.9512122, 1, 0, 0, 1, 1,
-2.831422, 1.245776, -0.5455472, 1, 0, 0, 1, 1,
-2.824555, -2.232826, -3.058773, 1, 0, 0, 1, 1,
-2.814413, -0.507882, -1.961989, 1, 0, 0, 1, 1,
-2.601749, -0.7206296, -2.008795, 0, 0, 0, 1, 1,
-2.578868, 0.8767952, -2.720437, 0, 0, 0, 1, 1,
-2.544708, -0.7594178, -1.383496, 0, 0, 0, 1, 1,
-2.392596, -1.923829, -1.505365, 0, 0, 0, 1, 1,
-2.350357, -0.09041171, 0.3689871, 0, 0, 0, 1, 1,
-2.308653, 0.09148487, -2.860245, 0, 0, 0, 1, 1,
-2.294879, 1.866986, -2.46876, 0, 0, 0, 1, 1,
-2.28621, 0.1239854, -3.493141, 1, 1, 1, 1, 1,
-2.252301, -0.4070897, -2.700668, 1, 1, 1, 1, 1,
-2.249033, -1.2908, -2.923807, 1, 1, 1, 1, 1,
-2.242627, -0.7155064, -1.590428, 1, 1, 1, 1, 1,
-2.236635, -0.5450228, -2.307559, 1, 1, 1, 1, 1,
-2.223441, -0.4803501, -1.743338, 1, 1, 1, 1, 1,
-2.194892, -1.892042, -3.017935, 1, 1, 1, 1, 1,
-2.16096, -1.348746, -2.427298, 1, 1, 1, 1, 1,
-2.113277, -0.7167269, -2.446663, 1, 1, 1, 1, 1,
-2.094164, -0.8917293, -0.6688169, 1, 1, 1, 1, 1,
-2.089471, -1.621594, -0.9974338, 1, 1, 1, 1, 1,
-2.080095, -0.7233245, -0.5274763, 1, 1, 1, 1, 1,
-2.068573, -1.770017, -3.092558, 1, 1, 1, 1, 1,
-2.017072, -0.7136745, -1.485148, 1, 1, 1, 1, 1,
-2.016203, 0.3369419, -0.3246062, 1, 1, 1, 1, 1,
-2.015061, 0.02460489, -0.8888382, 0, 0, 1, 1, 1,
-2.010564, 0.5423496, -0.8006778, 1, 0, 0, 1, 1,
-1.997992, 0.5338107, -1.233386, 1, 0, 0, 1, 1,
-1.933355, -0.6232652, -1.523093, 1, 0, 0, 1, 1,
-1.929875, -1.412453, -1.358316, 1, 0, 0, 1, 1,
-1.914927, 0.4928853, -0.6279942, 1, 0, 0, 1, 1,
-1.886579, -0.2851492, -1.884583, 0, 0, 0, 1, 1,
-1.874955, -0.250469, -0.0253668, 0, 0, 0, 1, 1,
-1.866973, 1.535298, -0.4166014, 0, 0, 0, 1, 1,
-1.86628, 1.18553, -0.9437796, 0, 0, 0, 1, 1,
-1.864718, 1.525664, -2.149755, 0, 0, 0, 1, 1,
-1.845757, 0.04562648, -1.533802, 0, 0, 0, 1, 1,
-1.843061, 0.2912994, -2.319216, 0, 0, 0, 1, 1,
-1.837226, -0.1115625, -2.039449, 1, 1, 1, 1, 1,
-1.835878, -0.4215419, -2.4293, 1, 1, 1, 1, 1,
-1.817649, 0.07840177, 0.4812292, 1, 1, 1, 1, 1,
-1.811975, 0.4703555, -2.399074, 1, 1, 1, 1, 1,
-1.786822, -2.046602, -3.754233, 1, 1, 1, 1, 1,
-1.775572, 0.1148324, -1.758965, 1, 1, 1, 1, 1,
-1.771215, 1.736068, -0.4728348, 1, 1, 1, 1, 1,
-1.724822, 1.784776, 0.6350074, 1, 1, 1, 1, 1,
-1.724696, 0.1611839, -1.328637, 1, 1, 1, 1, 1,
-1.712204, -1.331248, -2.085311, 1, 1, 1, 1, 1,
-1.70545, -0.5069391, -1.588626, 1, 1, 1, 1, 1,
-1.686041, 0.9376633, -2.160641, 1, 1, 1, 1, 1,
-1.679915, -0.8650635, -2.09564, 1, 1, 1, 1, 1,
-1.658719, 0.7517765, -1.136677, 1, 1, 1, 1, 1,
-1.658602, 0.986185, -0.494496, 1, 1, 1, 1, 1,
-1.642232, -1.182192, -2.671132, 0, 0, 1, 1, 1,
-1.61425, 0.288354, -0.631223, 1, 0, 0, 1, 1,
-1.606513, 0.9591935, 0.141629, 1, 0, 0, 1, 1,
-1.603115, -1.43373, -2.413226, 1, 0, 0, 1, 1,
-1.59517, -0.6658121, -0.3844031, 1, 0, 0, 1, 1,
-1.584101, 0.6093377, -2.147672, 1, 0, 0, 1, 1,
-1.577186, 1.138433, -0.5137789, 0, 0, 0, 1, 1,
-1.568686, -0.03743235, -1.358331, 0, 0, 0, 1, 1,
-1.554296, -0.04735181, -1.292977, 0, 0, 0, 1, 1,
-1.539209, 0.608634, -2.216317, 0, 0, 0, 1, 1,
-1.539112, -0.5457705, -1.661461, 0, 0, 0, 1, 1,
-1.518083, 2.535918, -0.1901813, 0, 0, 0, 1, 1,
-1.51654, 0.1372824, -2.033741, 0, 0, 0, 1, 1,
-1.50977, -1.369753, -3.028635, 1, 1, 1, 1, 1,
-1.507772, -1.520826, -2.280257, 1, 1, 1, 1, 1,
-1.503149, 0.585629, -1.593402, 1, 1, 1, 1, 1,
-1.501278, -1.168012, -0.955465, 1, 1, 1, 1, 1,
-1.498768, -0.3351502, -2.019914, 1, 1, 1, 1, 1,
-1.497216, -0.4695177, -0.7908238, 1, 1, 1, 1, 1,
-1.496622, -1.830642, -3.403975, 1, 1, 1, 1, 1,
-1.492107, 0.5813002, -0.7735512, 1, 1, 1, 1, 1,
-1.480631, 0.2257849, -0.8434043, 1, 1, 1, 1, 1,
-1.471621, 0.8917653, -1.186269, 1, 1, 1, 1, 1,
-1.462789, -1.349886, -2.748687, 1, 1, 1, 1, 1,
-1.445734, 0.7789572, -2.024118, 1, 1, 1, 1, 1,
-1.444017, -0.4011425, 0.5544754, 1, 1, 1, 1, 1,
-1.442002, 1.891932, -0.09484265, 1, 1, 1, 1, 1,
-1.419026, -1.522971, -3.917233, 1, 1, 1, 1, 1,
-1.4171, -2.198502, -3.024176, 0, 0, 1, 1, 1,
-1.410167, 0.0412542, -1.875902, 1, 0, 0, 1, 1,
-1.404386, -1.094639, -1.79049, 1, 0, 0, 1, 1,
-1.400722, -0.7326257, -2.566597, 1, 0, 0, 1, 1,
-1.382655, 0.6915185, -1.893072, 1, 0, 0, 1, 1,
-1.382054, -0.0495297, -2.534793, 1, 0, 0, 1, 1,
-1.379156, 1.128051, -0.4154413, 0, 0, 0, 1, 1,
-1.37595, -0.2706723, -0.9208076, 0, 0, 0, 1, 1,
-1.37406, 0.7385837, -1.583397, 0, 0, 0, 1, 1,
-1.36078, -0.4365259, -1.731044, 0, 0, 0, 1, 1,
-1.354387, -0.353857, -2.144112, 0, 0, 0, 1, 1,
-1.353624, -2.628875, -2.168631, 0, 0, 0, 1, 1,
-1.34515, -1.933646, -3.338811, 0, 0, 0, 1, 1,
-1.344994, 1.831958, -1.4826, 1, 1, 1, 1, 1,
-1.340297, 1.391828, -0.2564654, 1, 1, 1, 1, 1,
-1.338774, -0.4313717, -2.508609, 1, 1, 1, 1, 1,
-1.337472, -0.9057658, -3.265268, 1, 1, 1, 1, 1,
-1.333451, -0.5985036, -1.971979, 1, 1, 1, 1, 1,
-1.333293, 0.1074239, -1.632972, 1, 1, 1, 1, 1,
-1.332857, -1.614696, -2.592602, 1, 1, 1, 1, 1,
-1.332345, -1.012533, -1.972578, 1, 1, 1, 1, 1,
-1.329049, 0.3323043, -2.326582, 1, 1, 1, 1, 1,
-1.320262, 0.5424564, -0.6342884, 1, 1, 1, 1, 1,
-1.318074, -0.2445755, -0.948541, 1, 1, 1, 1, 1,
-1.316795, -0.9168857, -1.999588, 1, 1, 1, 1, 1,
-1.31062, 0.8119715, 1.398957, 1, 1, 1, 1, 1,
-1.308358, 1.354572, -1.391778, 1, 1, 1, 1, 1,
-1.305625, -0.04030294, -1.357226, 1, 1, 1, 1, 1,
-1.294249, -0.4052244, 0.4544451, 0, 0, 1, 1, 1,
-1.288036, 1.641153, 0.1426343, 1, 0, 0, 1, 1,
-1.266838, -0.7966813, -4.374608, 1, 0, 0, 1, 1,
-1.250989, 0.02101737, -0.3502078, 1, 0, 0, 1, 1,
-1.250383, -0.7627106, -1.760444, 1, 0, 0, 1, 1,
-1.249084, 1.15139, 0.4077605, 1, 0, 0, 1, 1,
-1.246335, 0.2375722, -1.374045, 0, 0, 0, 1, 1,
-1.244225, 1.088356, -0.1910736, 0, 0, 0, 1, 1,
-1.240578, -0.4615484, -0.08747116, 0, 0, 0, 1, 1,
-1.240179, 0.2415835, -0.7555988, 0, 0, 0, 1, 1,
-1.239115, 1.191545, -2.289734, 0, 0, 0, 1, 1,
-1.23082, 0.9145279, -3.036088, 0, 0, 0, 1, 1,
-1.224538, -0.345672, -3.635249, 0, 0, 0, 1, 1,
-1.204877, -0.1037126, -2.805939, 1, 1, 1, 1, 1,
-1.187876, -0.2373501, -1.396662, 1, 1, 1, 1, 1,
-1.18076, -0.463507, -0.7299571, 1, 1, 1, 1, 1,
-1.179319, -0.4471533, -2.579107, 1, 1, 1, 1, 1,
-1.167642, -1.114397, -3.014407, 1, 1, 1, 1, 1,
-1.163175, 0.760588, -1.181145, 1, 1, 1, 1, 1,
-1.158475, 1.374669, -1.205936, 1, 1, 1, 1, 1,
-1.154677, 0.7050965, -1.722419, 1, 1, 1, 1, 1,
-1.154272, 0.1402745, -1.508154, 1, 1, 1, 1, 1,
-1.150486, -0.9868563, -1.654732, 1, 1, 1, 1, 1,
-1.149573, -0.5669037, -1.782637, 1, 1, 1, 1, 1,
-1.146547, 0.6233895, -1.122267, 1, 1, 1, 1, 1,
-1.142578, -1.0562, -1.200629, 1, 1, 1, 1, 1,
-1.121439, -1.423581, -1.323065, 1, 1, 1, 1, 1,
-1.118683, -2.305042, -3.876684, 1, 1, 1, 1, 1,
-1.109858, -0.2604816, -1.196148, 0, 0, 1, 1, 1,
-1.10542, 0.2306924, -0.5572473, 1, 0, 0, 1, 1,
-1.102293, -0.001825153, -0.5666853, 1, 0, 0, 1, 1,
-1.089817, 0.3918775, -0.8137309, 1, 0, 0, 1, 1,
-1.08911, 0.04747705, -1.313493, 1, 0, 0, 1, 1,
-1.084605, 0.280477, -0.3668144, 1, 0, 0, 1, 1,
-1.083772, 0.985444, -1.379826, 0, 0, 0, 1, 1,
-1.083472, -0.3545371, -1.941815, 0, 0, 0, 1, 1,
-1.081706, -1.400022, -2.643926, 0, 0, 0, 1, 1,
-1.078793, 0.9748346, 0.135722, 0, 0, 0, 1, 1,
-1.07305, 0.8679348, -1.305845, 0, 0, 0, 1, 1,
-1.071327, -1.107103, -1.77549, 0, 0, 0, 1, 1,
-1.065063, 1.501684, 1.175496, 0, 0, 0, 1, 1,
-1.06326, 0.3480187, -2.89015, 1, 1, 1, 1, 1,
-1.06007, -0.66131, -1.039202, 1, 1, 1, 1, 1,
-1.059051, 0.8260321, 0.5164345, 1, 1, 1, 1, 1,
-1.056314, 0.9918755, -0.513397, 1, 1, 1, 1, 1,
-1.045497, -0.4062163, -1.709908, 1, 1, 1, 1, 1,
-1.038426, 0.2419671, -0.8197651, 1, 1, 1, 1, 1,
-1.035048, -0.7955822, -1.670811, 1, 1, 1, 1, 1,
-1.03469, -1.81193, -2.080892, 1, 1, 1, 1, 1,
-1.033292, 1.26637, 0.7494419, 1, 1, 1, 1, 1,
-1.032337, 1.729366, 1.239683, 1, 1, 1, 1, 1,
-1.025492, 0.6462829, -1.15927, 1, 1, 1, 1, 1,
-1.025365, -2.151893, -2.667465, 1, 1, 1, 1, 1,
-1.024763, -0.0819932, -0.6597521, 1, 1, 1, 1, 1,
-1.022672, -0.1679641, -3.347031, 1, 1, 1, 1, 1,
-1.022216, 0.6047326, -0.9665658, 1, 1, 1, 1, 1,
-1.015606, 0.2438958, -1.534398, 0, 0, 1, 1, 1,
-1.01297, 1.222754, -0.8841657, 1, 0, 0, 1, 1,
-1.008813, 0.6384083, 0.966074, 1, 0, 0, 1, 1,
-1.007789, 0.6529499, 0.9011608, 1, 0, 0, 1, 1,
-0.9976951, -0.2649828, -2.160174, 1, 0, 0, 1, 1,
-0.997237, -0.4176441, -3.276637, 1, 0, 0, 1, 1,
-0.9941919, -2.095425, -3.875937, 0, 0, 0, 1, 1,
-0.9913189, 1.704296, -0.1439531, 0, 0, 0, 1, 1,
-0.9894639, 0.03424847, -2.319568, 0, 0, 0, 1, 1,
-0.9724323, -0.01717612, -1.087704, 0, 0, 0, 1, 1,
-0.9714636, 1.705176, -0.6103452, 0, 0, 0, 1, 1,
-0.970449, 1.341099, -0.7067412, 0, 0, 0, 1, 1,
-0.9686392, -1.303156, -1.090763, 0, 0, 0, 1, 1,
-0.9612898, 0.9914375, -3.160526, 1, 1, 1, 1, 1,
-0.9568747, -0.4456381, -2.407238, 1, 1, 1, 1, 1,
-0.9481522, -0.1205586, -2.2803, 1, 1, 1, 1, 1,
-0.9459431, 1.034183, 0.6616352, 1, 1, 1, 1, 1,
-0.9457795, -0.2449922, -4.297401, 1, 1, 1, 1, 1,
-0.9428422, 1.750196, -0.7451541, 1, 1, 1, 1, 1,
-0.9427259, 1.317664, 0.9608976, 1, 1, 1, 1, 1,
-0.9407668, -1.346725, -4.069554, 1, 1, 1, 1, 1,
-0.935453, -1.512234, -3.638325, 1, 1, 1, 1, 1,
-0.928722, -0.9345019, -1.491121, 1, 1, 1, 1, 1,
-0.9245008, -0.3395399, -2.820974, 1, 1, 1, 1, 1,
-0.9231459, 0.664268, -0.7969359, 1, 1, 1, 1, 1,
-0.9216268, 1.029305, -0.4775184, 1, 1, 1, 1, 1,
-0.9214559, -0.4085452, -1.020239, 1, 1, 1, 1, 1,
-0.9068404, 1.513364, 0.372863, 1, 1, 1, 1, 1,
-0.9067691, -2.028087, -2.926715, 0, 0, 1, 1, 1,
-0.8836266, 0.05886578, -2.9646, 1, 0, 0, 1, 1,
-0.8785946, -0.1450743, -1.91104, 1, 0, 0, 1, 1,
-0.8776481, -1.025971, -4.054181, 1, 0, 0, 1, 1,
-0.8706543, -0.0515239, -0.8366659, 1, 0, 0, 1, 1,
-0.8689322, 0.4869491, -1.933933, 1, 0, 0, 1, 1,
-0.8608024, -2.323233, -3.641008, 0, 0, 0, 1, 1,
-0.8576304, -2.006618, -2.679255, 0, 0, 0, 1, 1,
-0.8540722, 0.6854384, -0.6838912, 0, 0, 0, 1, 1,
-0.8504604, -1.420402, -2.233461, 0, 0, 0, 1, 1,
-0.8484928, 0.1369864, -0.6820121, 0, 0, 0, 1, 1,
-0.8452581, 0.6586279, -0.9471737, 0, 0, 0, 1, 1,
-0.844834, -0.3853576, -2.895672, 0, 0, 0, 1, 1,
-0.8446472, -1.137572, -2.144038, 1, 1, 1, 1, 1,
-0.8408225, 0.613511, -1.091575, 1, 1, 1, 1, 1,
-0.8361425, -0.06696315, -1.198228, 1, 1, 1, 1, 1,
-0.8244339, -0.38241, -2.861784, 1, 1, 1, 1, 1,
-0.824383, 0.3148913, -2.655187, 1, 1, 1, 1, 1,
-0.8218363, 0.797931, -1.717847, 1, 1, 1, 1, 1,
-0.820277, -0.05518392, -2.945992, 1, 1, 1, 1, 1,
-0.8155835, -0.9933713, -4.640551, 1, 1, 1, 1, 1,
-0.7950607, 0.7291119, -1.2408, 1, 1, 1, 1, 1,
-0.7939927, -0.3476397, -1.529389, 1, 1, 1, 1, 1,
-0.7930589, -1.019788, -1.206362, 1, 1, 1, 1, 1,
-0.7896662, -0.2064233, -1.108685, 1, 1, 1, 1, 1,
-0.7889233, -0.3618043, -1.468005, 1, 1, 1, 1, 1,
-0.7866286, 0.2309261, -1.511828, 1, 1, 1, 1, 1,
-0.786104, 0.2335506, -1.095161, 1, 1, 1, 1, 1,
-0.7845246, 1.020035, -0.9769539, 0, 0, 1, 1, 1,
-0.7827004, 0.06796861, -0.3640752, 1, 0, 0, 1, 1,
-0.7816892, -0.03524701, -2.174013, 1, 0, 0, 1, 1,
-0.7810456, -0.1166487, -0.9022773, 1, 0, 0, 1, 1,
-0.7755351, 0.2776309, -2.042996, 1, 0, 0, 1, 1,
-0.7735237, 1.294837, -0.4080779, 1, 0, 0, 1, 1,
-0.7668974, -0.3859214, -2.057334, 0, 0, 0, 1, 1,
-0.7656587, -0.7343416, -0.5512988, 0, 0, 0, 1, 1,
-0.7641687, 0.4499443, -0.3213979, 0, 0, 0, 1, 1,
-0.7599749, -0.615021, -0.01929825, 0, 0, 0, 1, 1,
-0.7549004, -0.6842727, -1.247483, 0, 0, 0, 1, 1,
-0.7480599, 0.3436652, -1.037843, 0, 0, 0, 1, 1,
-0.7476232, 2.509404, 0.06252611, 0, 0, 0, 1, 1,
-0.7426686, 1.093887, -0.07056117, 1, 1, 1, 1, 1,
-0.7345693, 0.4657001, -0.8840142, 1, 1, 1, 1, 1,
-0.7313898, -0.8646135, -2.085461, 1, 1, 1, 1, 1,
-0.7313328, -1.117424, -2.325549, 1, 1, 1, 1, 1,
-0.7297183, -2.482735, -2.598925, 1, 1, 1, 1, 1,
-0.7290559, 0.8446409, 1.082397, 1, 1, 1, 1, 1,
-0.7262254, -0.2870896, -0.2991499, 1, 1, 1, 1, 1,
-0.7219228, -0.9104553, -1.139313, 1, 1, 1, 1, 1,
-0.7203417, 0.5823682, -0.2834596, 1, 1, 1, 1, 1,
-0.7138309, -0.5609575, -3.138607, 1, 1, 1, 1, 1,
-0.711451, 0.4833671, -1.469209, 1, 1, 1, 1, 1,
-0.7105407, -0.5838137, -2.301417, 1, 1, 1, 1, 1,
-0.7088557, 1.79125, -0.3540151, 1, 1, 1, 1, 1,
-0.7063055, 0.08804376, 0.261665, 1, 1, 1, 1, 1,
-0.7032902, 0.9028836, -0.7027357, 1, 1, 1, 1, 1,
-0.7023852, -0.7901962, -1.774975, 0, 0, 1, 1, 1,
-0.6985399, 0.7515857, -2.04101, 1, 0, 0, 1, 1,
-0.694429, 1.870583, -0.5395457, 1, 0, 0, 1, 1,
-0.6907094, 0.4076338, -1.599362, 1, 0, 0, 1, 1,
-0.6906499, 1.253319, 0.2143476, 1, 0, 0, 1, 1,
-0.6869283, -0.8341156, -3.471081, 1, 0, 0, 1, 1,
-0.6853562, -0.4475595, -1.724044, 0, 0, 0, 1, 1,
-0.6850898, -0.3329175, -2.75776, 0, 0, 0, 1, 1,
-0.6823087, -1.691116, -2.283309, 0, 0, 0, 1, 1,
-0.6795555, 0.3490594, -0.4729568, 0, 0, 0, 1, 1,
-0.6793889, 0.3236073, -0.7077631, 0, 0, 0, 1, 1,
-0.6741289, 1.565864, 0.2936651, 0, 0, 0, 1, 1,
-0.674077, 0.6957148, 1.701086, 0, 0, 0, 1, 1,
-0.6729041, -1.723503, -4.38518, 1, 1, 1, 1, 1,
-0.6691646, -0.2107455, -3.785595, 1, 1, 1, 1, 1,
-0.6550099, 1.740914, -0.7803832, 1, 1, 1, 1, 1,
-0.6533602, -0.8319709, -2.906084, 1, 1, 1, 1, 1,
-0.6476451, 0.1566744, -0.9359325, 1, 1, 1, 1, 1,
-0.6436635, -1.540201, -4.526552, 1, 1, 1, 1, 1,
-0.6417188, 0.4880213, -0.5033712, 1, 1, 1, 1, 1,
-0.6382793, -0.2166697, -1.180888, 1, 1, 1, 1, 1,
-0.6353135, -1.342855, -2.064997, 1, 1, 1, 1, 1,
-0.6343791, -0.09155577, -1.093773, 1, 1, 1, 1, 1,
-0.6253335, 0.4612618, -0.6627312, 1, 1, 1, 1, 1,
-0.6209042, 0.3765643, -1.156996, 1, 1, 1, 1, 1,
-0.619263, -0.7568859, -3.993549, 1, 1, 1, 1, 1,
-0.6111733, -0.4686914, -3.634441, 1, 1, 1, 1, 1,
-0.6030932, 0.5416611, -2.532183, 1, 1, 1, 1, 1,
-0.6017126, 1.399208, 0.03959631, 0, 0, 1, 1, 1,
-0.5999458, 0.4951699, -1.81764, 1, 0, 0, 1, 1,
-0.590599, -0.3106136, -1.250511, 1, 0, 0, 1, 1,
-0.5745944, -0.3478422, 0.2813153, 1, 0, 0, 1, 1,
-0.574481, -0.5749393, -3.46513, 1, 0, 0, 1, 1,
-0.5709231, 1.319537, -0.8309214, 1, 0, 0, 1, 1,
-0.5703379, -0.9520109, -2.422742, 0, 0, 0, 1, 1,
-0.5679231, -0.2686884, -1.383462, 0, 0, 0, 1, 1,
-0.5666786, 0.7226048, -0.553461, 0, 0, 0, 1, 1,
-0.5587223, 1.789541, -1.032225, 0, 0, 0, 1, 1,
-0.5558231, -0.3336754, -0.7615826, 0, 0, 0, 1, 1,
-0.5553812, -0.2239707, -1.729725, 0, 0, 0, 1, 1,
-0.5553082, 1.188218, 0.263737, 0, 0, 0, 1, 1,
-0.5547839, -0.8287429, -2.313397, 1, 1, 1, 1, 1,
-0.5480049, -0.1783611, -0.888936, 1, 1, 1, 1, 1,
-0.5473322, 0.7656567, 0.6331012, 1, 1, 1, 1, 1,
-0.5440611, -0.4645295, -1.69457, 1, 1, 1, 1, 1,
-0.5416728, 0.8753538, -1.843107, 1, 1, 1, 1, 1,
-0.5414292, 0.8638422, -2.394942, 1, 1, 1, 1, 1,
-0.5357003, -0.627897, -2.936707, 1, 1, 1, 1, 1,
-0.5287911, 1.366462, 0.302307, 1, 1, 1, 1, 1,
-0.5260062, 0.5423275, 0.04222224, 1, 1, 1, 1, 1,
-0.5246298, -1.097249, -2.348417, 1, 1, 1, 1, 1,
-0.5210591, 1.002424, -0.3887691, 1, 1, 1, 1, 1,
-0.520159, 0.5407105, -1.858034, 1, 1, 1, 1, 1,
-0.5154465, 0.4141986, -1.364205, 1, 1, 1, 1, 1,
-0.5041559, 0.6977867, 0.08231791, 1, 1, 1, 1, 1,
-0.5019039, 0.8849645, -0.7894291, 1, 1, 1, 1, 1,
-0.5005765, 0.2395605, -0.5898524, 0, 0, 1, 1, 1,
-0.4962471, -1.146285, -3.157708, 1, 0, 0, 1, 1,
-0.4924351, 1.276007, -2.133351, 1, 0, 0, 1, 1,
-0.4920015, 0.1382301, -1.504061, 1, 0, 0, 1, 1,
-0.4901095, -0.707028, -2.388902, 1, 0, 0, 1, 1,
-0.4877283, 1.157817, -0.08077818, 1, 0, 0, 1, 1,
-0.4877235, 0.7985268, 1.276758, 0, 0, 0, 1, 1,
-0.4834729, -0.05256508, -1.166178, 0, 0, 0, 1, 1,
-0.480237, 0.8407867, -0.8153192, 0, 0, 0, 1, 1,
-0.4712479, 0.2540503, -0.9190943, 0, 0, 0, 1, 1,
-0.4694642, -1.261377, -3.596512, 0, 0, 0, 1, 1,
-0.4671473, 0.6722611, -0.5338857, 0, 0, 0, 1, 1,
-0.464253, -0.2216001, -2.591298, 0, 0, 0, 1, 1,
-0.4633447, 1.222486, -1.568354, 1, 1, 1, 1, 1,
-0.4602621, 0.09040799, -0.9453153, 1, 1, 1, 1, 1,
-0.4560937, 0.09993978, -2.222234, 1, 1, 1, 1, 1,
-0.4559837, 0.8331969, -0.001727143, 1, 1, 1, 1, 1,
-0.4556614, -0.08084559, -3.933401, 1, 1, 1, 1, 1,
-0.4507841, -0.9739336, -2.650667, 1, 1, 1, 1, 1,
-0.4488039, -1.223924, -3.914529, 1, 1, 1, 1, 1,
-0.4485706, 1.46093, 0.4260945, 1, 1, 1, 1, 1,
-0.4424634, 0.1343171, -1.463449, 1, 1, 1, 1, 1,
-0.4368199, 0.6273454, -0.956512, 1, 1, 1, 1, 1,
-0.4345173, 0.7134291, -1.147554, 1, 1, 1, 1, 1,
-0.4336084, -0.9499524, -3.144583, 1, 1, 1, 1, 1,
-0.4313581, 0.563219, -1.277007, 1, 1, 1, 1, 1,
-0.4301506, 0.8815968, 0.3979958, 1, 1, 1, 1, 1,
-0.4241443, 1.267256, -1.197967, 1, 1, 1, 1, 1,
-0.420995, 0.6636486, -0.9660032, 0, 0, 1, 1, 1,
-0.4192702, 0.3048727, -0.7078266, 1, 0, 0, 1, 1,
-0.4190639, -1.841639, -2.671687, 1, 0, 0, 1, 1,
-0.4182824, -0.5561007, -2.130835, 1, 0, 0, 1, 1,
-0.4175742, -1.227245, -1.127002, 1, 0, 0, 1, 1,
-0.4138146, 0.6928385, -1.586988, 1, 0, 0, 1, 1,
-0.4125707, -1.925384, -3.546864, 0, 0, 0, 1, 1,
-0.4098158, 1.088006, 1.227307, 0, 0, 0, 1, 1,
-0.4072475, 2.46131, -1.71487, 0, 0, 0, 1, 1,
-0.4067226, 0.5935242, -1.022905, 0, 0, 0, 1, 1,
-0.406578, 0.4509774, -2.155562, 0, 0, 0, 1, 1,
-0.4028391, -0.734327, -1.309657, 0, 0, 0, 1, 1,
-0.4008766, 0.7855881, -0.8722865, 0, 0, 0, 1, 1,
-0.3998448, 1.38036, 1.002429, 1, 1, 1, 1, 1,
-0.3990231, -1.666007, -2.936069, 1, 1, 1, 1, 1,
-0.3987209, -0.234394, -1.349925, 1, 1, 1, 1, 1,
-0.3944966, 0.2408366, -0.852605, 1, 1, 1, 1, 1,
-0.3891731, 2.233783, -0.5309756, 1, 1, 1, 1, 1,
-0.3864886, 0.5558466, -1.204364, 1, 1, 1, 1, 1,
-0.3850836, -0.2838193, -2.203301, 1, 1, 1, 1, 1,
-0.3830199, 2.172853, -0.02451919, 1, 1, 1, 1, 1,
-0.3824345, -1.361687, -3.293138, 1, 1, 1, 1, 1,
-0.3820525, -0.8181679, -0.5243691, 1, 1, 1, 1, 1,
-0.3817553, -0.4331352, -2.59633, 1, 1, 1, 1, 1,
-0.3816162, 0.491901, -0.9429646, 1, 1, 1, 1, 1,
-0.377477, -2.199529, -3.283196, 1, 1, 1, 1, 1,
-0.3703956, -0.3797519, -0.7205104, 1, 1, 1, 1, 1,
-0.3669288, -0.3825623, -2.122842, 1, 1, 1, 1, 1,
-0.3665408, 1.271847, -0.08862437, 0, 0, 1, 1, 1,
-0.3634251, 0.05971756, -0.346265, 1, 0, 0, 1, 1,
-0.3620043, -1.132617, -2.154843, 1, 0, 0, 1, 1,
-0.3605475, -1.966696, -1.77998, 1, 0, 0, 1, 1,
-0.3593136, -0.5858046, -2.465329, 1, 0, 0, 1, 1,
-0.354499, 1.695709, -0.8696193, 1, 0, 0, 1, 1,
-0.3501675, 0.2903787, -2.619778, 0, 0, 0, 1, 1,
-0.3483981, -0.13043, -2.35852, 0, 0, 0, 1, 1,
-0.3481925, -0.2709214, -1.570674, 0, 0, 0, 1, 1,
-0.3442832, -1.131817, -5.191472, 0, 0, 0, 1, 1,
-0.3439533, -0.3793303, -1.806646, 0, 0, 0, 1, 1,
-0.3378268, -1.298751, -2.310463, 0, 0, 0, 1, 1,
-0.3296444, -1.905793, -2.52647, 0, 0, 0, 1, 1,
-0.3237608, -0.3095248, -2.824373, 1, 1, 1, 1, 1,
-0.3171797, -2.02956, -3.162748, 1, 1, 1, 1, 1,
-0.3168662, -0.1570814, -1.295884, 1, 1, 1, 1, 1,
-0.3137013, 2.321968, 1.170596, 1, 1, 1, 1, 1,
-0.3107368, 0.5519618, -1.044349, 1, 1, 1, 1, 1,
-0.3103262, 1.382067, 1.14429, 1, 1, 1, 1, 1,
-0.3086084, 0.4290417, 0.1165478, 1, 1, 1, 1, 1,
-0.3076722, 0.2988479, -1.353301, 1, 1, 1, 1, 1,
-0.3049309, -0.7834591, -0.8526341, 1, 1, 1, 1, 1,
-0.3036221, -0.05324483, -0.9672638, 1, 1, 1, 1, 1,
-0.299006, -1.314395, -2.1019, 1, 1, 1, 1, 1,
-0.2978365, -1.425004, -2.954304, 1, 1, 1, 1, 1,
-0.2972361, 0.5957512, 0.2697936, 1, 1, 1, 1, 1,
-0.2933078, -0.9587251, -4.149975, 1, 1, 1, 1, 1,
-0.2915724, 0.3078388, -0.6648638, 1, 1, 1, 1, 1,
-0.2894696, -0.1833268, -1.165249, 0, 0, 1, 1, 1,
-0.2877393, -1.287313, -2.977087, 1, 0, 0, 1, 1,
-0.2877125, 0.8748713, -0.4163853, 1, 0, 0, 1, 1,
-0.2824999, -1.613325, -4.427654, 1, 0, 0, 1, 1,
-0.2776978, -1.199081, -2.523175, 1, 0, 0, 1, 1,
-0.27691, -0.261929, -3.153342, 1, 0, 0, 1, 1,
-0.2738366, 1.148345, 0.6310222, 0, 0, 0, 1, 1,
-0.2700382, 0.6014973, -0.2675986, 0, 0, 0, 1, 1,
-0.2644273, -1.291932, -2.529489, 0, 0, 0, 1, 1,
-0.2635379, 1.676128, -0.01162848, 0, 0, 0, 1, 1,
-0.2623185, -0.3769529, -3.059606, 0, 0, 0, 1, 1,
-0.261159, -0.5774676, -3.437413, 0, 0, 0, 1, 1,
-0.2569813, -1.16343, -3.32426, 0, 0, 0, 1, 1,
-0.25673, 0.1832807, 0.5547428, 1, 1, 1, 1, 1,
-0.2561533, -1.442207, -4.010027, 1, 1, 1, 1, 1,
-0.2560483, -0.6300505, -2.974511, 1, 1, 1, 1, 1,
-0.2550832, 1.404082, 0.0391086, 1, 1, 1, 1, 1,
-0.2545671, 1.188225, 0.2755557, 1, 1, 1, 1, 1,
-0.254246, -1.432662, -2.529386, 1, 1, 1, 1, 1,
-0.248714, 0.4635672, -0.6598396, 1, 1, 1, 1, 1,
-0.2408724, -0.7458412, -2.388855, 1, 1, 1, 1, 1,
-0.2397841, -0.563095, -3.078806, 1, 1, 1, 1, 1,
-0.2383311, 0.7559448, 0.3411167, 1, 1, 1, 1, 1,
-0.2380691, -1.3484, -3.523205, 1, 1, 1, 1, 1,
-0.2334148, -0.228001, -3.180532, 1, 1, 1, 1, 1,
-0.2328414, 0.02551962, -0.8357062, 1, 1, 1, 1, 1,
-0.2322696, -0.6993545, -1.887745, 1, 1, 1, 1, 1,
-0.2307715, 0.2722741, 0.7381737, 1, 1, 1, 1, 1,
-0.2295378, -0.9908983, -2.377907, 0, 0, 1, 1, 1,
-0.2287284, -1.671446, -2.118036, 1, 0, 0, 1, 1,
-0.2269373, 1.615687, -1.070011, 1, 0, 0, 1, 1,
-0.2268039, 1.604066, -0.3450452, 1, 0, 0, 1, 1,
-0.2257028, -0.1195256, -2.008127, 1, 0, 0, 1, 1,
-0.2254209, -0.314984, -2.803427, 1, 0, 0, 1, 1,
-0.2242733, 0.7943316, 0.9483549, 0, 0, 0, 1, 1,
-0.2231162, 0.2066587, -0.3868689, 0, 0, 0, 1, 1,
-0.2225103, 0.4217404, 1.250774, 0, 0, 0, 1, 1,
-0.2198889, 1.260122, 0.1125135, 0, 0, 0, 1, 1,
-0.2196454, -2.023185, -3.115584, 0, 0, 0, 1, 1,
-0.2195981, -1.023511, -2.57794, 0, 0, 0, 1, 1,
-0.2172738, 1.10695, 0.8848245, 0, 0, 0, 1, 1,
-0.21538, 0.1372627, -0.272015, 1, 1, 1, 1, 1,
-0.2109163, 0.455978, -0.9332425, 1, 1, 1, 1, 1,
-0.2108025, 0.4686245, 1.223562, 1, 1, 1, 1, 1,
-0.2083658, -0.8285996, -4.605935, 1, 1, 1, 1, 1,
-0.2053582, 1.838704, 0.5314771, 1, 1, 1, 1, 1,
-0.2019425, -2.081181, -2.169044, 1, 1, 1, 1, 1,
-0.1965278, -0.6702805, -3.932959, 1, 1, 1, 1, 1,
-0.1899663, -0.1241216, -3.760055, 1, 1, 1, 1, 1,
-0.1821352, 3.430905, 0.5277889, 1, 1, 1, 1, 1,
-0.1819746, -1.38462, -0.6675235, 1, 1, 1, 1, 1,
-0.1808509, -0.4703061, -3.96208, 1, 1, 1, 1, 1,
-0.1783386, 0.7821666, 0.5400827, 1, 1, 1, 1, 1,
-0.1774141, -2.297385, -3.597046, 1, 1, 1, 1, 1,
-0.1760088, 2.024187, -1.249638, 1, 1, 1, 1, 1,
-0.1757032, -0.7956906, -3.418792, 1, 1, 1, 1, 1,
-0.1674284, -1.607444, -4.622311, 0, 0, 1, 1, 1,
-0.1654783, 0.3688142, 1.074973, 1, 0, 0, 1, 1,
-0.1554203, 1.279211, -1.044563, 1, 0, 0, 1, 1,
-0.1499428, 0.6315786, 0.7321518, 1, 0, 0, 1, 1,
-0.1480013, -0.1622588, -2.480025, 1, 0, 0, 1, 1,
-0.1467903, -0.161439, -1.752483, 1, 0, 0, 1, 1,
-0.1403146, 0.2681862, -0.9063293, 0, 0, 0, 1, 1,
-0.1370622, 1.483975, 0.9815394, 0, 0, 0, 1, 1,
-0.1361509, -1.336864, -0.7362908, 0, 0, 0, 1, 1,
-0.1352702, 1.027189, 0.1040828, 0, 0, 0, 1, 1,
-0.1296271, 1.401297, -1.019293, 0, 0, 0, 1, 1,
-0.1272427, -0.1792284, -2.855523, 0, 0, 0, 1, 1,
-0.1266869, 0.2079218, -2.479523, 0, 0, 0, 1, 1,
-0.1260944, 1.581787, -0.1550736, 1, 1, 1, 1, 1,
-0.1183756, 0.04285217, -1.937649, 1, 1, 1, 1, 1,
-0.1155274, -1.927206, -3.907661, 1, 1, 1, 1, 1,
-0.1127433, -1.393067, -2.185232, 1, 1, 1, 1, 1,
-0.1095855, 1.279763, -0.2569691, 1, 1, 1, 1, 1,
-0.1095299, -2.531516, -3.378593, 1, 1, 1, 1, 1,
-0.109256, -0.1162005, -2.025447, 1, 1, 1, 1, 1,
-0.1073966, -0.2339694, -2.994083, 1, 1, 1, 1, 1,
-0.1073202, 0.7994679, 0.3155902, 1, 1, 1, 1, 1,
-0.1072933, 0.547762, -1.189232, 1, 1, 1, 1, 1,
-0.1038606, -0.2658263, -3.142846, 1, 1, 1, 1, 1,
-0.1013433, 1.120882, 0.6189932, 1, 1, 1, 1, 1,
-0.0961985, 0.1175245, 0.1061641, 1, 1, 1, 1, 1,
-0.09610465, -0.4939446, -2.697737, 1, 1, 1, 1, 1,
-0.09443548, 0.2385525, -1.396054, 1, 1, 1, 1, 1,
-0.08632395, 1.732361, -1.432116, 0, 0, 1, 1, 1,
-0.07731679, 0.9455325, 0.6202935, 1, 0, 0, 1, 1,
-0.07701223, -0.8281934, -3.13553, 1, 0, 0, 1, 1,
-0.07604072, -0.4620701, -5.104547, 1, 0, 0, 1, 1,
-0.0741571, 1.687249, -0.4587367, 1, 0, 0, 1, 1,
-0.06727384, -0.05949286, -0.6052073, 1, 0, 0, 1, 1,
-0.06496055, 0.7112589, 0.5179138, 0, 0, 0, 1, 1,
-0.0632536, -0.03272369, 0.761958, 0, 0, 0, 1, 1,
-0.06012863, -1.494406, -2.991325, 0, 0, 0, 1, 1,
-0.05986714, -1.297976, -1.951701, 0, 0, 0, 1, 1,
-0.05937763, 0.7605218, -0.1223505, 0, 0, 0, 1, 1,
-0.05699151, -0.3792225, -2.478947, 0, 0, 0, 1, 1,
-0.05586926, 0.8619419, -1.272094, 0, 0, 0, 1, 1,
-0.05544718, 0.6766405, 0.5009648, 1, 1, 1, 1, 1,
-0.05280218, 1.248711, 1.270918, 1, 1, 1, 1, 1,
-0.05189672, -0.6446649, -3.784954, 1, 1, 1, 1, 1,
-0.04751035, -1.059952, -2.909825, 1, 1, 1, 1, 1,
-0.0453706, 0.2845254, 0.4688575, 1, 1, 1, 1, 1,
-0.04497227, 1.040975, -0.2828114, 1, 1, 1, 1, 1,
-0.0433245, -0.154409, -2.484379, 1, 1, 1, 1, 1,
-0.04193757, 0.3638035, -1.438889, 1, 1, 1, 1, 1,
-0.03938117, -1.583696, -3.071292, 1, 1, 1, 1, 1,
-0.03695556, -1.106647, -4.910577, 1, 1, 1, 1, 1,
-0.03648777, -0.1863829, -1.988671, 1, 1, 1, 1, 1,
-0.03217295, 0.9251935, 0.7239299, 1, 1, 1, 1, 1,
-0.02321651, -0.2515074, -1.044889, 1, 1, 1, 1, 1,
-0.02192895, 0.3243763, -0.1091412, 1, 1, 1, 1, 1,
-0.01746132, -1.383548, -3.19294, 1, 1, 1, 1, 1,
-0.01641424, -1.627364, -3.776086, 0, 0, 1, 1, 1,
-0.01378104, 0.5548749, 0.03668634, 1, 0, 0, 1, 1,
-0.01097172, -0.3188473, -3.447896, 1, 0, 0, 1, 1,
-0.008815723, 0.2955089, -1.261276, 1, 0, 0, 1, 1,
-0.005254212, 1.310297, 0.392574, 1, 0, 0, 1, 1,
-0.004997248, 0.6688587, 0.9731101, 1, 0, 0, 1, 1,
0.003134468, -0.6305313, 2.150028, 0, 0, 0, 1, 1,
0.005894592, -0.05688674, 3.789994, 0, 0, 0, 1, 1,
0.007642841, 0.7930464, 1.413935, 0, 0, 0, 1, 1,
0.01431678, -0.09130279, 3.323914, 0, 0, 0, 1, 1,
0.01569199, 1.343387, 1.202872, 0, 0, 0, 1, 1,
0.01571049, -0.4149608, 4.303719, 0, 0, 0, 1, 1,
0.01994233, -0.5850228, 3.084536, 0, 0, 0, 1, 1,
0.0247092, -2.326943, 4.16654, 1, 1, 1, 1, 1,
0.02711292, 0.4798163, -1.907925, 1, 1, 1, 1, 1,
0.0272555, 1.107187, -0.02871742, 1, 1, 1, 1, 1,
0.03191806, 1.122127, 0.5841944, 1, 1, 1, 1, 1,
0.03247668, 0.07169981, 0.7303141, 1, 1, 1, 1, 1,
0.03345103, -0.6924993, 2.963698, 1, 1, 1, 1, 1,
0.03408044, -0.6535026, 1.3554, 1, 1, 1, 1, 1,
0.03656263, -1.318704, 0.7674437, 1, 1, 1, 1, 1,
0.03720082, 0.4823001, 0.2255772, 1, 1, 1, 1, 1,
0.03777266, -0.140501, 2.172436, 1, 1, 1, 1, 1,
0.04000424, 0.3610208, 0.5119997, 1, 1, 1, 1, 1,
0.04113863, -0.6347303, 1.547394, 1, 1, 1, 1, 1,
0.04244453, 0.3224835, 0.04660997, 1, 1, 1, 1, 1,
0.04246556, -1.064527, 3.247279, 1, 1, 1, 1, 1,
0.04762606, -0.3290375, 2.967303, 1, 1, 1, 1, 1,
0.05636567, -0.8789158, 1.910767, 0, 0, 1, 1, 1,
0.05719352, 0.2364272, -0.5842196, 1, 0, 0, 1, 1,
0.05888308, -0.1022487, 3.982574, 1, 0, 0, 1, 1,
0.0601986, -0.3137325, 4.03389, 1, 0, 0, 1, 1,
0.06134789, -1.921386, 2.194493, 1, 0, 0, 1, 1,
0.06185534, 0.1748142, 0.8784983, 1, 0, 0, 1, 1,
0.06740476, 0.2888972, 0.4439764, 0, 0, 0, 1, 1,
0.06765765, 1.731167, 0.9418319, 0, 0, 0, 1, 1,
0.06866863, -0.2750388, 2.063108, 0, 0, 0, 1, 1,
0.06995304, 0.2073941, 0.5287451, 0, 0, 0, 1, 1,
0.07547429, 0.1486497, 1.366629, 0, 0, 0, 1, 1,
0.07607061, -0.3557533, 1.401916, 0, 0, 0, 1, 1,
0.07611308, -1.888574, 4.294584, 0, 0, 0, 1, 1,
0.07731929, -0.2877328, 2.791268, 1, 1, 1, 1, 1,
0.08005987, 1.752022, -0.401106, 1, 1, 1, 1, 1,
0.08577067, -2.464552, 3.554838, 1, 1, 1, 1, 1,
0.08730504, 0.4914199, -1.275476, 1, 1, 1, 1, 1,
0.09177064, -1.262058, 3.19594, 1, 1, 1, 1, 1,
0.09260407, 1.156268, 0.168732, 1, 1, 1, 1, 1,
0.09472013, -0.574757, 1.042524, 1, 1, 1, 1, 1,
0.09624352, -2.909784, 2.739202, 1, 1, 1, 1, 1,
0.1035047, 0.1067822, 0.4085694, 1, 1, 1, 1, 1,
0.1040339, 1.477958, 0.004214445, 1, 1, 1, 1, 1,
0.1154128, 0.8530875, -0.5767071, 1, 1, 1, 1, 1,
0.1195094, -0.7008617, 1.937829, 1, 1, 1, 1, 1,
0.1200636, 0.0782602, -0.2907524, 1, 1, 1, 1, 1,
0.1221947, -0.4817138, 1.596399, 1, 1, 1, 1, 1,
0.1233938, 0.1775655, -0.5584574, 1, 1, 1, 1, 1,
0.1309965, 0.1747565, 0.107612, 0, 0, 1, 1, 1,
0.1318207, 0.9171886, -2.039384, 1, 0, 0, 1, 1,
0.1369437, -1.200132, 3.423743, 1, 0, 0, 1, 1,
0.1425707, 1.884691, 1.049527, 1, 0, 0, 1, 1,
0.1449782, 0.279032, -0.6921765, 1, 0, 0, 1, 1,
0.1479072, 0.179629, 2.095366, 1, 0, 0, 1, 1,
0.1523663, -1.332767, 1.776229, 0, 0, 0, 1, 1,
0.1543759, 1.184464, -0.2482699, 0, 0, 0, 1, 1,
0.1555424, 1.728472, -1.994758, 0, 0, 0, 1, 1,
0.1562004, 0.5468609, -0.9630907, 0, 0, 0, 1, 1,
0.1595622, -0.4480172, 6.032251, 0, 0, 0, 1, 1,
0.1609287, -0.6303475, 2.704228, 0, 0, 0, 1, 1,
0.1617764, 1.088332, 0.6549318, 0, 0, 0, 1, 1,
0.1650095, -0.4433795, 2.694709, 1, 1, 1, 1, 1,
0.1686124, -0.6878652, 0.6394705, 1, 1, 1, 1, 1,
0.1688706, -0.1936954, 1.326676, 1, 1, 1, 1, 1,
0.1742328, -0.182454, 1.637222, 1, 1, 1, 1, 1,
0.1755723, -0.6452363, 4.199958, 1, 1, 1, 1, 1,
0.1790109, 1.695231, -1.064109, 1, 1, 1, 1, 1,
0.1812266, 0.9988149, -0.4565748, 1, 1, 1, 1, 1,
0.1850864, -1.463875, 3.316364, 1, 1, 1, 1, 1,
0.1868292, -0.1113187, 2.372714, 1, 1, 1, 1, 1,
0.1886368, -0.001507124, 1.344999, 1, 1, 1, 1, 1,
0.1898406, 0.2622618, 2.967031, 1, 1, 1, 1, 1,
0.1904374, 0.4048314, 0.1789542, 1, 1, 1, 1, 1,
0.1934045, 1.766033, 2.261945, 1, 1, 1, 1, 1,
0.1952356, -0.5907459, 2.356256, 1, 1, 1, 1, 1,
0.1959816, -0.9884686, 2.884524, 1, 1, 1, 1, 1,
0.2005666, -0.2669396, 3.514473, 0, 0, 1, 1, 1,
0.2044703, -0.4338885, 2.429958, 1, 0, 0, 1, 1,
0.2068337, 0.3912778, -1.001671, 1, 0, 0, 1, 1,
0.2075202, 0.4880654, 0.5617464, 1, 0, 0, 1, 1,
0.2090166, 0.7665614, 1.280233, 1, 0, 0, 1, 1,
0.2090453, 0.7463386, 0.1827914, 1, 0, 0, 1, 1,
0.2122705, 2.084052, 0.8774769, 0, 0, 0, 1, 1,
0.2149892, -1.734042, 2.533594, 0, 0, 0, 1, 1,
0.2164664, 0.6407931, -1.299705, 0, 0, 0, 1, 1,
0.2178335, 0.4476486, 0.7960658, 0, 0, 0, 1, 1,
0.2198687, 0.2230542, 0.8272287, 0, 0, 0, 1, 1,
0.2205698, 0.01860405, 2.045391, 0, 0, 0, 1, 1,
0.2244102, -0.2438047, 1.488444, 0, 0, 0, 1, 1,
0.2262178, -0.1230226, 1.903696, 1, 1, 1, 1, 1,
0.2263365, -0.781152, 3.855146, 1, 1, 1, 1, 1,
0.2266948, 0.2729906, -0.3878599, 1, 1, 1, 1, 1,
0.2317784, -2.24984, 3.380571, 1, 1, 1, 1, 1,
0.2326905, 1.850375, 1.050669, 1, 1, 1, 1, 1,
0.2329464, 0.1241375, 3.77992, 1, 1, 1, 1, 1,
0.2352283, 0.326971, -0.02343417, 1, 1, 1, 1, 1,
0.2390324, 0.2828608, 1.249466, 1, 1, 1, 1, 1,
0.2401085, -1.621425, 2.876087, 1, 1, 1, 1, 1,
0.2408236, 0.8884311, -0.6739048, 1, 1, 1, 1, 1,
0.2416472, 1.297787, 0.4663894, 1, 1, 1, 1, 1,
0.2418553, -0.8282956, 4.094959, 1, 1, 1, 1, 1,
0.2451536, -1.067169, 2.260243, 1, 1, 1, 1, 1,
0.2522148, -0.1808323, 1.916345, 1, 1, 1, 1, 1,
0.2531532, 0.3910717, 0.8705446, 1, 1, 1, 1, 1,
0.2545641, 0.01330187, 2.143831, 0, 0, 1, 1, 1,
0.2546267, -2.376022, 0.9893271, 1, 0, 0, 1, 1,
0.2559847, 0.003521503, 0.3353349, 1, 0, 0, 1, 1,
0.2609218, -0.1433296, 2.835677, 1, 0, 0, 1, 1,
0.2621323, 0.4863533, 0.4121446, 1, 0, 0, 1, 1,
0.2665927, -0.6120135, 3.280404, 1, 0, 0, 1, 1,
0.2669339, -0.3332026, 2.189075, 0, 0, 0, 1, 1,
0.2696343, 0.01749411, 1.797121, 0, 0, 0, 1, 1,
0.27148, -1.342743, 2.930555, 0, 0, 0, 1, 1,
0.2786035, -1.302247, 2.146012, 0, 0, 0, 1, 1,
0.2798052, 0.5100251, 1.259462, 0, 0, 0, 1, 1,
0.2805333, 0.09699224, 0.9926796, 0, 0, 0, 1, 1,
0.2832792, -0.3920593, 2.330469, 0, 0, 0, 1, 1,
0.2835372, 0.02120631, 0.09834042, 1, 1, 1, 1, 1,
0.2875434, -0.1514671, 2.256224, 1, 1, 1, 1, 1,
0.2883109, -0.4628688, 1.988894, 1, 1, 1, 1, 1,
0.2889474, 1.507803, 0.1992274, 1, 1, 1, 1, 1,
0.289361, -1.256517, 3.19079, 1, 1, 1, 1, 1,
0.2899163, -0.7313762, 3.915107, 1, 1, 1, 1, 1,
0.2899298, -0.5689098, 3.064753, 1, 1, 1, 1, 1,
0.2906698, 0.8167902, -1.629415, 1, 1, 1, 1, 1,
0.2911692, -0.1438703, 2.283948, 1, 1, 1, 1, 1,
0.2928444, 1.427291, 0.4881164, 1, 1, 1, 1, 1,
0.296984, 0.5317562, 0.1084335, 1, 1, 1, 1, 1,
0.3019717, -0.5914501, 2.855607, 1, 1, 1, 1, 1,
0.3033562, -0.5023745, 5.014604, 1, 1, 1, 1, 1,
0.3061829, -0.4079572, 3.207705, 1, 1, 1, 1, 1,
0.3104412, -1.035209, 6.05552, 1, 1, 1, 1, 1,
0.3143357, -0.2635229, 4.361012, 0, 0, 1, 1, 1,
0.3148042, -0.02044108, 1.819075, 1, 0, 0, 1, 1,
0.3232825, 2.582319, -0.5664676, 1, 0, 0, 1, 1,
0.3235153, 0.3359812, -0.5684986, 1, 0, 0, 1, 1,
0.3281055, -1.33223, 3.269115, 1, 0, 0, 1, 1,
0.3283597, 1.3193, -1.167774, 1, 0, 0, 1, 1,
0.3302794, -0.9766949, 4.233572, 0, 0, 0, 1, 1,
0.3311692, 0.3209363, 1.728953, 0, 0, 0, 1, 1,
0.3328986, -0.5525029, 4.415588, 0, 0, 0, 1, 1,
0.3345222, 0.8382804, 1.056834, 0, 0, 0, 1, 1,
0.3367085, -1.44529, 2.55395, 0, 0, 0, 1, 1,
0.347749, 0.36289, 0.6008483, 0, 0, 0, 1, 1,
0.3501394, 0.2170332, 2.326422, 0, 0, 0, 1, 1,
0.3519583, 0.403924, 0.2191078, 1, 1, 1, 1, 1,
0.3532766, 0.3389198, 0.1444822, 1, 1, 1, 1, 1,
0.3574163, -1.117381, 4.155938, 1, 1, 1, 1, 1,
0.3594109, 0.4414579, 1.663352, 1, 1, 1, 1, 1,
0.3607847, 0.4653056, 2.173527, 1, 1, 1, 1, 1,
0.3608777, 1.012396, 0.9658587, 1, 1, 1, 1, 1,
0.3608981, -0.1936541, 1.822409, 1, 1, 1, 1, 1,
0.3640987, -0.431901, 3.615352, 1, 1, 1, 1, 1,
0.3646284, -0.01871419, 1.842234, 1, 1, 1, 1, 1,
0.3651207, 2.759566, 1.617609, 1, 1, 1, 1, 1,
0.3655437, -0.6240017, 3.092431, 1, 1, 1, 1, 1,
0.3675382, 1.67945, 0.3907804, 1, 1, 1, 1, 1,
0.3702492, -1.671518, 2.330316, 1, 1, 1, 1, 1,
0.3787985, 0.4940945, 0.2396276, 1, 1, 1, 1, 1,
0.381458, -0.006630634, 1.470751, 1, 1, 1, 1, 1,
0.3827652, 0.6495478, 0.7339533, 0, 0, 1, 1, 1,
0.384644, -1.132619, 2.986496, 1, 0, 0, 1, 1,
0.3886604, -0.5336853, 4.604528, 1, 0, 0, 1, 1,
0.3897409, 0.1431689, 2.955323, 1, 0, 0, 1, 1,
0.3911137, 0.7634545, -0.2265108, 1, 0, 0, 1, 1,
0.3938718, -1.17939, 4.013388, 1, 0, 0, 1, 1,
0.3973683, -0.2335899, 1.970987, 0, 0, 0, 1, 1,
0.4097562, 0.8048711, 1.751259, 0, 0, 0, 1, 1,
0.4128862, -1.652935, 3.654326, 0, 0, 0, 1, 1,
0.4131593, 0.6168131, 2.334311, 0, 0, 0, 1, 1,
0.413358, 0.9455749, -0.7632148, 0, 0, 0, 1, 1,
0.413828, 0.3302462, -0.19996, 0, 0, 0, 1, 1,
0.4141156, -1.35647, 0.2199166, 0, 0, 0, 1, 1,
0.4180487, 0.1146614, 1.559957, 1, 1, 1, 1, 1,
0.4212789, -0.6080309, 1.993066, 1, 1, 1, 1, 1,
0.4217629, -1.027722, 2.782181, 1, 1, 1, 1, 1,
0.4219709, 0.4892245, -0.3516976, 1, 1, 1, 1, 1,
0.4221297, 2.577487, 0.2625585, 1, 1, 1, 1, 1,
0.4241755, 0.6262791, 0.4519911, 1, 1, 1, 1, 1,
0.4258001, -0.3586693, 2.174586, 1, 1, 1, 1, 1,
0.4262619, 0.1389865, 0.8504641, 1, 1, 1, 1, 1,
0.4296261, -1.466353, 2.991863, 1, 1, 1, 1, 1,
0.4307117, 1.166561, 0.3810052, 1, 1, 1, 1, 1,
0.4367366, -1.158545, 1.808922, 1, 1, 1, 1, 1,
0.4409257, -0.9761763, 3.957521, 1, 1, 1, 1, 1,
0.4517885, -0.3064624, 1.851944, 1, 1, 1, 1, 1,
0.4548641, 0.2698336, 2.089297, 1, 1, 1, 1, 1,
0.4579104, -1.42695, 2.294997, 1, 1, 1, 1, 1,
0.4583437, -1.021904, 3.253947, 0, 0, 1, 1, 1,
0.4583959, 0.1035934, 0.8525424, 1, 0, 0, 1, 1,
0.4689566, 0.03515512, -0.8634739, 1, 0, 0, 1, 1,
0.4705169, -0.4129764, 2.119645, 1, 0, 0, 1, 1,
0.4716364, 1.002119, 1.689154, 1, 0, 0, 1, 1,
0.4771724, 0.8499918, -1.772016, 1, 0, 0, 1, 1,
0.481155, 0.4540176, 0.6232826, 0, 0, 0, 1, 1,
0.4838249, 2.411077, 1.024037, 0, 0, 0, 1, 1,
0.4856634, 0.1291794, 1.10634, 0, 0, 0, 1, 1,
0.4894254, -1.233641, 1.462433, 0, 0, 0, 1, 1,
0.4910316, 0.6559457, 0.9557046, 0, 0, 0, 1, 1,
0.4920585, -0.3013628, 4.293128, 0, 0, 0, 1, 1,
0.4934191, -0.6564716, 3.846986, 0, 0, 0, 1, 1,
0.4991151, 1.77377, 0.1034004, 1, 1, 1, 1, 1,
0.4997708, 0.7572429, 0.9551996, 1, 1, 1, 1, 1,
0.5015144, 1.394717, 0.6469967, 1, 1, 1, 1, 1,
0.5023907, 0.8926195, 0.1175785, 1, 1, 1, 1, 1,
0.5027295, 0.7058819, 0.8182055, 1, 1, 1, 1, 1,
0.5055317, -1.14595, 2.430187, 1, 1, 1, 1, 1,
0.5057443, -0.5225684, 2.825707, 1, 1, 1, 1, 1,
0.5123016, -0.7327772, 3.962807, 1, 1, 1, 1, 1,
0.5126681, 0.5517763, -0.1394635, 1, 1, 1, 1, 1,
0.5178873, -0.7170008, 3.312849, 1, 1, 1, 1, 1,
0.5181603, -0.3579533, 1.929391, 1, 1, 1, 1, 1,
0.5210941, -2.35314, 2.148764, 1, 1, 1, 1, 1,
0.5227402, 2.782548, -0.8764282, 1, 1, 1, 1, 1,
0.5228998, -0.7978032, 2.052848, 1, 1, 1, 1, 1,
0.5302637, 0.06916185, 1.71239, 1, 1, 1, 1, 1,
0.5325981, -0.1984606, 2.832341, 0, 0, 1, 1, 1,
0.5333248, -1.417858, 3.621314, 1, 0, 0, 1, 1,
0.5336078, 1.064995, 0.8169211, 1, 0, 0, 1, 1,
0.5390632, 0.3826822, 1.073901, 1, 0, 0, 1, 1,
0.5400205, 1.513327, -1.88455, 1, 0, 0, 1, 1,
0.54072, 0.7866153, 3.562169, 1, 0, 0, 1, 1,
0.5409592, -2.089189, 4.388785, 0, 0, 0, 1, 1,
0.5421696, -0.2899937, 1.766759, 0, 0, 0, 1, 1,
0.5423127, 0.3343349, 2.149181, 0, 0, 0, 1, 1,
0.5456337, 0.06588351, 2.627537, 0, 0, 0, 1, 1,
0.5477121, 0.8791121, 1.84224, 0, 0, 0, 1, 1,
0.5478597, 1.481826, -0.6433972, 0, 0, 0, 1, 1,
0.5500191, -0.0358767, 1.723885, 0, 0, 0, 1, 1,
0.5501566, 0.8983086, 2.574649, 1, 1, 1, 1, 1,
0.5549408, -0.4390874, 1.325584, 1, 1, 1, 1, 1,
0.5590235, -0.009731168, 2.033095, 1, 1, 1, 1, 1,
0.5698869, 0.01595687, 1.256204, 1, 1, 1, 1, 1,
0.5701032, 1.045161, 1.239672, 1, 1, 1, 1, 1,
0.5702785, 1.424804, -0.1722443, 1, 1, 1, 1, 1,
0.5706841, -0.9610881, 1.388917, 1, 1, 1, 1, 1,
0.572179, 0.4558476, 1.28741, 1, 1, 1, 1, 1,
0.5723171, -0.0805623, 1.008943, 1, 1, 1, 1, 1,
0.5725299, -0.8960193, 3.639908, 1, 1, 1, 1, 1,
0.5756666, 0.1581435, 1.840761, 1, 1, 1, 1, 1,
0.5777847, 0.773342, 0.5782158, 1, 1, 1, 1, 1,
0.5795061, -1.885912, 2.606991, 1, 1, 1, 1, 1,
0.5822641, -1.751472, 2.225461, 1, 1, 1, 1, 1,
0.5836887, 0.5396202, -0.05235411, 1, 1, 1, 1, 1,
0.5853579, 0.3534538, 1.857079, 0, 0, 1, 1, 1,
0.5859066, 0.5948411, -0.2098659, 1, 0, 0, 1, 1,
0.5876843, 1.144937, -0.132825, 1, 0, 0, 1, 1,
0.5991225, -1.020116, 3.128872, 1, 0, 0, 1, 1,
0.6033639, -0.5687761, 3.435332, 1, 0, 0, 1, 1,
0.6084695, -1.743958, 0.8445835, 1, 0, 0, 1, 1,
0.6087144, 1.600989, -0.08000913, 0, 0, 0, 1, 1,
0.6122062, 0.6679149, 0.104929, 0, 0, 0, 1, 1,
0.6138862, -1.076836, 1.343752, 0, 0, 0, 1, 1,
0.6142298, -2.36315, 4.785357, 0, 0, 0, 1, 1,
0.6274363, -1.017821, 4.408539, 0, 0, 0, 1, 1,
0.6409673, 0.5365206, 1.086213, 0, 0, 0, 1, 1,
0.6428815, -1.040733, 2.192558, 0, 0, 0, 1, 1,
0.6488453, 0.5742348, 1.456935, 1, 1, 1, 1, 1,
0.6669266, -0.8276909, 0.7207969, 1, 1, 1, 1, 1,
0.6699876, 1.262112, -0.682656, 1, 1, 1, 1, 1,
0.6706923, 1.135891, -1.393422, 1, 1, 1, 1, 1,
0.6747562, 0.2568721, 1.30171, 1, 1, 1, 1, 1,
0.6747721, 1.915401, -0.1183835, 1, 1, 1, 1, 1,
0.679251, 0.04921915, 1.369229, 1, 1, 1, 1, 1,
0.6803715, -0.1658114, 1.631689, 1, 1, 1, 1, 1,
0.683579, -1.044822, 3.802418, 1, 1, 1, 1, 1,
0.6838636, 0.1488305, 3.372258, 1, 1, 1, 1, 1,
0.6945516, 1.715378, 1.589791, 1, 1, 1, 1, 1,
0.6973903, 0.1579701, 1.561244, 1, 1, 1, 1, 1,
0.6981275, -1.111988, 2.102066, 1, 1, 1, 1, 1,
0.6982296, 0.3699903, 1.242687, 1, 1, 1, 1, 1,
0.6987542, -1.787794, 3.558313, 1, 1, 1, 1, 1,
0.702278, 1.22566, 1.133307, 0, 0, 1, 1, 1,
0.7040409, -1.52314, 3.453981, 1, 0, 0, 1, 1,
0.7061007, 0.1605837, 1.976853, 1, 0, 0, 1, 1,
0.7084133, 0.9249641, 1.058651, 1, 0, 0, 1, 1,
0.7087862, 0.5673534, 1.665029, 1, 0, 0, 1, 1,
0.7094408, 0.8121367, 2.268253, 1, 0, 0, 1, 1,
0.7152877, 0.08435518, 1.746177, 0, 0, 0, 1, 1,
0.7175549, 0.4942982, 0.9035137, 0, 0, 0, 1, 1,
0.7190756, 0.6286275, 2.501829, 0, 0, 0, 1, 1,
0.7215704, -0.05659623, -0.1179706, 0, 0, 0, 1, 1,
0.728112, 1.221525, 0.7012219, 0, 0, 0, 1, 1,
0.7319828, -0.685173, 2.230439, 0, 0, 0, 1, 1,
0.7392112, 1.501751, -0.1050934, 0, 0, 0, 1, 1,
0.7398943, -1.971173, 2.955312, 1, 1, 1, 1, 1,
0.7437789, 0.4592055, 1.124658, 1, 1, 1, 1, 1,
0.7446606, 1.543692, -0.06274747, 1, 1, 1, 1, 1,
0.75132, 0.1583849, 1.503597, 1, 1, 1, 1, 1,
0.7713378, 0.05761607, -0.4668991, 1, 1, 1, 1, 1,
0.8030154, -0.530091, 2.400176, 1, 1, 1, 1, 1,
0.8055952, -0.1077427, 2.574007, 1, 1, 1, 1, 1,
0.8141001, 0.6601335, 1.694882, 1, 1, 1, 1, 1,
0.8147398, -0.1526758, 0.02331563, 1, 1, 1, 1, 1,
0.8172227, 1.060795, 0.3867612, 1, 1, 1, 1, 1,
0.8183178, 0.009644166, 2.321658, 1, 1, 1, 1, 1,
0.8219473, 1.039375, 1.982729, 1, 1, 1, 1, 1,
0.8281081, -0.7742025, 2.16214, 1, 1, 1, 1, 1,
0.8320456, -0.8428363, 2.02667, 1, 1, 1, 1, 1,
0.8353341, 1.065649, 0.2792096, 1, 1, 1, 1, 1,
0.8409488, -0.1060632, 1.086325, 0, 0, 1, 1, 1,
0.8428181, -0.1341814, 2.809544, 1, 0, 0, 1, 1,
0.8462035, -0.5666545, 1.093379, 1, 0, 0, 1, 1,
0.8500634, 0.3312573, 0.9344956, 1, 0, 0, 1, 1,
0.8578095, 0.09275798, 1.496451, 1, 0, 0, 1, 1,
0.8582805, 1.171536, 0.02600367, 1, 0, 0, 1, 1,
0.8585032, 0.2197352, 0.8947051, 0, 0, 0, 1, 1,
0.8597878, -1.572207, 3.143739, 0, 0, 0, 1, 1,
0.8601384, 0.7462251, -1.031512, 0, 0, 0, 1, 1,
0.8641942, 0.1952663, 0.8452673, 0, 0, 0, 1, 1,
0.866051, 0.2477959, -1.329713, 0, 0, 0, 1, 1,
0.8663729, 0.3327873, 1.370077, 0, 0, 0, 1, 1,
0.871, -0.7883101, 1.754388, 0, 0, 0, 1, 1,
0.8764542, 0.6322477, 1.020365, 1, 1, 1, 1, 1,
0.880609, -0.3356785, 1.792392, 1, 1, 1, 1, 1,
0.8817626, 0.7292798, 1.160845, 1, 1, 1, 1, 1,
0.8830165, 1.504592, 0.7265232, 1, 1, 1, 1, 1,
0.8842407, -1.681301, 4.503872, 1, 1, 1, 1, 1,
0.9017751, 1.147339, 0.9544452, 1, 1, 1, 1, 1,
0.9023409, 1.927476, 0.7942935, 1, 1, 1, 1, 1,
0.9035166, -0.09112649, 2.035598, 1, 1, 1, 1, 1,
0.9134212, 0.006553046, 0.700745, 1, 1, 1, 1, 1,
0.9168471, -0.2817145, 0.6345362, 1, 1, 1, 1, 1,
0.916972, -0.5385164, 3.787765, 1, 1, 1, 1, 1,
0.9185112, 1.214233, 0.4124583, 1, 1, 1, 1, 1,
0.9230089, 0.392875, 1.61723, 1, 1, 1, 1, 1,
0.9237266, 0.459334, -0.9015858, 1, 1, 1, 1, 1,
0.924956, 0.3740704, 1.217907, 1, 1, 1, 1, 1,
0.9372258, 0.7178606, 0.9262195, 0, 0, 1, 1, 1,
0.9394084, 2.068624, 1.866255, 1, 0, 0, 1, 1,
0.9445644, -0.6765384, 4.095257, 1, 0, 0, 1, 1,
0.9477918, 1.359094, 0.8867567, 1, 0, 0, 1, 1,
0.9516212, -0.4954195, 3.105745, 1, 0, 0, 1, 1,
0.9589362, -1.102339, 2.773366, 1, 0, 0, 1, 1,
0.9590874, -0.2611445, 1.822424, 0, 0, 0, 1, 1,
0.9616088, 1.237007, 0.5874932, 0, 0, 0, 1, 1,
0.964653, 1.056449, 2.047141, 0, 0, 0, 1, 1,
0.9661759, 0.5430651, 1.002273, 0, 0, 0, 1, 1,
0.968399, 0.6219545, 2.220111, 0, 0, 0, 1, 1,
0.9728379, 0.3049595, 2.425976, 0, 0, 0, 1, 1,
0.9738998, 0.1773222, 0.8174396, 0, 0, 0, 1, 1,
0.9749324, -1.882138, 2.936247, 1, 1, 1, 1, 1,
0.9758083, 1.281228, 1.943874, 1, 1, 1, 1, 1,
0.9769676, -0.5743731, 1.354226, 1, 1, 1, 1, 1,
0.9858062, 1.44421, -0.8678318, 1, 1, 1, 1, 1,
0.9892426, 0.1359303, 0.2674895, 1, 1, 1, 1, 1,
0.9983584, 0.04293389, 0.8863148, 1, 1, 1, 1, 1,
1.000987, 0.99189, 0.9791299, 1, 1, 1, 1, 1,
1.004775, -0.1938385, 0.7182177, 1, 1, 1, 1, 1,
1.006346, -0.2390836, 1.647994, 1, 1, 1, 1, 1,
1.014278, -0.3750394, 3.532782, 1, 1, 1, 1, 1,
1.018118, -1.763501, 2.006459, 1, 1, 1, 1, 1,
1.02572, 0.4249364, 0.536694, 1, 1, 1, 1, 1,
1.028214, 0.5072637, 1.313809, 1, 1, 1, 1, 1,
1.032307, 0.7245309, 0.3032114, 1, 1, 1, 1, 1,
1.033433, 1.270965, 0.581857, 1, 1, 1, 1, 1,
1.034054, 0.522679, 1.190052, 0, 0, 1, 1, 1,
1.035139, 1.8647, 0.4090453, 1, 0, 0, 1, 1,
1.03536, 0.3202948, 2.073343, 1, 0, 0, 1, 1,
1.040112, -1.448122, 2.580639, 1, 0, 0, 1, 1,
1.043508, -1.0446, 0.6274632, 1, 0, 0, 1, 1,
1.07771, 0.3304835, 1.020214, 1, 0, 0, 1, 1,
1.077807, 1.057493, 1.390129, 0, 0, 0, 1, 1,
1.078972, -1.477188, 3.145582, 0, 0, 0, 1, 1,
1.080565, 1.55009, 1.032913, 0, 0, 0, 1, 1,
1.086766, 0.9348943, 1.317407, 0, 0, 0, 1, 1,
1.094205, 0.6037871, 0.3353318, 0, 0, 0, 1, 1,
1.095886, 0.192811, -0.3057539, 0, 0, 0, 1, 1,
1.101566, 1.264785, 1.043509, 0, 0, 0, 1, 1,
1.114821, 1.067606, 1.467469, 1, 1, 1, 1, 1,
1.118473, -0.1699527, 0.6706357, 1, 1, 1, 1, 1,
1.123278, 0.03764984, 2.234481, 1, 1, 1, 1, 1,
1.125929, -0.6334256, 2.988536, 1, 1, 1, 1, 1,
1.12599, 0.3133733, 3.526646, 1, 1, 1, 1, 1,
1.126601, -0.5416245, -0.7402508, 1, 1, 1, 1, 1,
1.127228, -0.1059899, 2.645913, 1, 1, 1, 1, 1,
1.128368, 2.202331, 1.92071, 1, 1, 1, 1, 1,
1.131319, -0.2434065, 0.7929745, 1, 1, 1, 1, 1,
1.132915, 0.7770036, 1.658758, 1, 1, 1, 1, 1,
1.13526, -0.5014468, 2.626547, 1, 1, 1, 1, 1,
1.142981, 0.2109507, 1.468168, 1, 1, 1, 1, 1,
1.150858, 0.3546295, 0.1871276, 1, 1, 1, 1, 1,
1.159065, 0.5640301, 4.631676, 1, 1, 1, 1, 1,
1.170728, 0.2786417, 0.8457593, 1, 1, 1, 1, 1,
1.18813, -0.7263144, 2.4843, 0, 0, 1, 1, 1,
1.188281, 2.01186, 0.5363415, 1, 0, 0, 1, 1,
1.188945, -0.06449375, 2.460235, 1, 0, 0, 1, 1,
1.202134, 0.8415855, 1.671164, 1, 0, 0, 1, 1,
1.203319, -1.220782, 1.404148, 1, 0, 0, 1, 1,
1.210431, 1.4761, 1.023878, 1, 0, 0, 1, 1,
1.210662, -0.9029518, 2.210463, 0, 0, 0, 1, 1,
1.215028, 0.3416533, -0.3622834, 0, 0, 0, 1, 1,
1.221069, 0.108516, 0.1190651, 0, 0, 0, 1, 1,
1.225815, 0.5757246, 3.133872, 0, 0, 0, 1, 1,
1.232889, 0.7209399, 1.709711, 0, 0, 0, 1, 1,
1.237585, -0.4813477, 2.414274, 0, 0, 0, 1, 1,
1.239669, -0.2241705, -0.3275156, 0, 0, 0, 1, 1,
1.253862, 0.4756253, 0.7634306, 1, 1, 1, 1, 1,
1.254993, 0.5139151, 0.8195252, 1, 1, 1, 1, 1,
1.260608, 0.3788085, 1.274087, 1, 1, 1, 1, 1,
1.264792, 0.5843738, 0.5363532, 1, 1, 1, 1, 1,
1.266554, -0.3525904, 1.596493, 1, 1, 1, 1, 1,
1.269314, 0.3152759, 1.62992, 1, 1, 1, 1, 1,
1.289304, 0.2628452, 1.434783, 1, 1, 1, 1, 1,
1.291961, -0.4496208, 2.673884, 1, 1, 1, 1, 1,
1.293354, -0.2274094, 0.5377374, 1, 1, 1, 1, 1,
1.307006, -0.4969628, 2.596507, 1, 1, 1, 1, 1,
1.338767, 0.6866703, -0.6267956, 1, 1, 1, 1, 1,
1.341004, 1.120307, 1.735804, 1, 1, 1, 1, 1,
1.34393, 1.33647, -0.1305102, 1, 1, 1, 1, 1,
1.344303, 0.9266481, 0.145981, 1, 1, 1, 1, 1,
1.347225, 0.2319607, 0.6629029, 1, 1, 1, 1, 1,
1.355497, 0.327581, 2.495322, 0, 0, 1, 1, 1,
1.358242, -0.2896941, 1.12809, 1, 0, 0, 1, 1,
1.368227, 0.4517743, 2.409129, 1, 0, 0, 1, 1,
1.3712, -0.7160859, 2.127528, 1, 0, 0, 1, 1,
1.374287, 0.2336658, 1.331191, 1, 0, 0, 1, 1,
1.389672, -1.471507, 2.21069, 1, 0, 0, 1, 1,
1.390456, -0.4792331, 1.36949, 0, 0, 0, 1, 1,
1.400858, 0.4341431, 1.078713, 0, 0, 0, 1, 1,
1.406462, -1.535766, 1.838594, 0, 0, 0, 1, 1,
1.439145, 0.4255348, 0.6260771, 0, 0, 0, 1, 1,
1.442352, -0.09662812, 2.009827, 0, 0, 0, 1, 1,
1.446544, -0.131199, 2.417515, 0, 0, 0, 1, 1,
1.448154, 0.9308266, 0.9405769, 0, 0, 0, 1, 1,
1.458058, -1.533195, 1.264999, 1, 1, 1, 1, 1,
1.458382, -0.3491617, 0.5806363, 1, 1, 1, 1, 1,
1.469266, 1.450004, 2.53059, 1, 1, 1, 1, 1,
1.469385, 0.4377643, 0.4760316, 1, 1, 1, 1, 1,
1.477799, -0.3575456, 0.683561, 1, 1, 1, 1, 1,
1.480345, -0.7143224, 1.745323, 1, 1, 1, 1, 1,
1.56811, -1.296693, 3.113817, 1, 1, 1, 1, 1,
1.588787, 0.3675082, 1.515562, 1, 1, 1, 1, 1,
1.594322, -1.511128, 2.556672, 1, 1, 1, 1, 1,
1.597387, -0.05570285, 2.62633, 1, 1, 1, 1, 1,
1.611828, 0.4219285, -0.7147537, 1, 1, 1, 1, 1,
1.61833, -0.3238056, 2.220662, 1, 1, 1, 1, 1,
1.628385, 0.02808307, 4.084416, 1, 1, 1, 1, 1,
1.6324, -0.1261679, 1.417497, 1, 1, 1, 1, 1,
1.632531, 1.33045, 1.494705, 1, 1, 1, 1, 1,
1.634117, -1.183122, 1.248988, 0, 0, 1, 1, 1,
1.640402, -1.001772, 2.261451, 1, 0, 0, 1, 1,
1.649601, 1.741429, 0.583064, 1, 0, 0, 1, 1,
1.662246, -0.06975363, 0.2977307, 1, 0, 0, 1, 1,
1.677122, -0.6722072, 1.522761, 1, 0, 0, 1, 1,
1.691758, -1.012839, 2.837022, 1, 0, 0, 1, 1,
1.695216, 2.146958, 0.7744445, 0, 0, 0, 1, 1,
1.706442, 0.9913835, 1.571877, 0, 0, 0, 1, 1,
1.709874, 0.1190888, 2.621087, 0, 0, 0, 1, 1,
1.716705, -0.2841018, 1.896774, 0, 0, 0, 1, 1,
1.72202, -0.699907, 2.231053, 0, 0, 0, 1, 1,
1.753448, -0.8163393, 3.270121, 0, 0, 0, 1, 1,
1.776337, 1.604946, 0.1869519, 0, 0, 0, 1, 1,
1.781294, -0.9022141, 0.2932186, 1, 1, 1, 1, 1,
1.792448, 0.1719126, 0.08809205, 1, 1, 1, 1, 1,
1.820453, 2.531017, 0.948926, 1, 1, 1, 1, 1,
1.822936, -0.4550373, 2.398919, 1, 1, 1, 1, 1,
1.856702, 1.054383, 0.6670378, 1, 1, 1, 1, 1,
1.896877, 1.160688, 1.325227, 1, 1, 1, 1, 1,
1.901444, 0.4961216, 1.430821, 1, 1, 1, 1, 1,
1.931216, -0.7222942, 1.447178, 1, 1, 1, 1, 1,
1.965251, 0.0595281, 2.060037, 1, 1, 1, 1, 1,
1.967182, 0.5883079, 1.535369, 1, 1, 1, 1, 1,
2.003541, -0.1386036, 2.564593, 1, 1, 1, 1, 1,
2.00817, 0.6898866, 1.712838, 1, 1, 1, 1, 1,
2.00975, 1.037902, 1.083123, 1, 1, 1, 1, 1,
2.07486, 1.244265, 0.812878, 1, 1, 1, 1, 1,
2.080982, 1.321178, 0.6385799, 1, 1, 1, 1, 1,
2.091658, -0.1117671, 1.624646, 0, 0, 1, 1, 1,
2.124223, -0.2561907, 0.727739, 1, 0, 0, 1, 1,
2.136763, -0.0383142, 2.352596, 1, 0, 0, 1, 1,
2.144207, 2.173533, 0.2711409, 1, 0, 0, 1, 1,
2.147966, 0.01497426, 2.422256, 1, 0, 0, 1, 1,
2.153873, 0.6555871, 1.855839, 1, 0, 0, 1, 1,
2.17753, 0.7961429, 1.183233, 0, 0, 0, 1, 1,
2.17813, -0.4109468, 1.362334, 0, 0, 0, 1, 1,
2.20469, 0.06065409, 1.044812, 0, 0, 0, 1, 1,
2.228632, -0.9490883, 3.204496, 0, 0, 0, 1, 1,
2.286768, 0.5295525, 0.4762681, 0, 0, 0, 1, 1,
2.309169, -0.8131611, 3.578651, 0, 0, 0, 1, 1,
2.314035, 1.535281, 2.221209, 0, 0, 0, 1, 1,
2.32812, 0.3448009, 3.374744, 1, 1, 1, 1, 1,
2.345349, -0.5972989, 2.050336, 1, 1, 1, 1, 1,
2.432013, -0.5108968, 1.979805, 1, 1, 1, 1, 1,
2.484343, 0.6543935, 2.32215, 1, 1, 1, 1, 1,
2.779144, 0.3479089, 3.099216, 1, 1, 1, 1, 1,
2.992481, -0.8874091, 0.8302113, 1, 1, 1, 1, 1,
3.006336, -0.04536954, 1.953244, 1, 1, 1, 1, 1
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
var radius = 9.791091;
var distance = 34.39079;
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
mvMatrix.translate( 0.2322001, -0.2605602, -0.432024 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.39079);
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
