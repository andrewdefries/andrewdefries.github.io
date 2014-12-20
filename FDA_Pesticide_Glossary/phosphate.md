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
-3.321245, -2.097025, -2.057287, 1, 0, 0, 1,
-2.942845, -0.5093341, -3.28795, 1, 0.007843138, 0, 1,
-2.666519, 0.1149436, -2.800956, 1, 0.01176471, 0, 1,
-2.619843, -0.562543, -0.0296123, 1, 0.01960784, 0, 1,
-2.555561, -0.2561209, -1.837441, 1, 0.02352941, 0, 1,
-2.493884, 0.9630373, -1.551552, 1, 0.03137255, 0, 1,
-2.450854, 0.9093673, -1.445022, 1, 0.03529412, 0, 1,
-2.409418, 0.6961544, 0.4326391, 1, 0.04313726, 0, 1,
-2.32929, -1.379767, -1.306383, 1, 0.04705882, 0, 1,
-2.26104, 0.2406593, -1.369555, 1, 0.05490196, 0, 1,
-2.256749, 1.015076, 0.1131975, 1, 0.05882353, 0, 1,
-2.250932, -0.3375789, -0.2276602, 1, 0.06666667, 0, 1,
-2.249872, 1.62075, -2.464977, 1, 0.07058824, 0, 1,
-2.156052, 1.119036, -3.065344, 1, 0.07843138, 0, 1,
-2.087881, -3.06801, -3.006935, 1, 0.08235294, 0, 1,
-2.066526, -0.0984281, -1.435401, 1, 0.09019608, 0, 1,
-2.060924, -0.2187415, -1.021562, 1, 0.09411765, 0, 1,
-2.054533, 0.9042578, -1.308031, 1, 0.1019608, 0, 1,
-2.040991, 0.06367154, -1.387613, 1, 0.1098039, 0, 1,
-2.03428, 0.1093761, -1.941424, 1, 0.1137255, 0, 1,
-2.017629, -1.314932, -2.957639, 1, 0.1215686, 0, 1,
-2.016226, 0.2422199, -1.282507, 1, 0.1254902, 0, 1,
-2.012614, -0.2589838, -1.586928, 1, 0.1333333, 0, 1,
-1.981744, -0.4693313, -3.085472, 1, 0.1372549, 0, 1,
-1.976056, -0.1539278, -1.948348, 1, 0.145098, 0, 1,
-1.966881, -0.00268566, -1.772278, 1, 0.1490196, 0, 1,
-1.947633, -0.3851229, -2.325786, 1, 0.1568628, 0, 1,
-1.929428, -0.490592, -2.374509, 1, 0.1607843, 0, 1,
-1.920702, 0.4900761, -3.01552, 1, 0.1686275, 0, 1,
-1.910002, 0.7424267, -2.99937, 1, 0.172549, 0, 1,
-1.906316, -1.14415, -0.621671, 1, 0.1803922, 0, 1,
-1.884444, -1.637942, -1.662975, 1, 0.1843137, 0, 1,
-1.875931, 0.07956903, -3.872956, 1, 0.1921569, 0, 1,
-1.857865, 0.7657521, -2.05434, 1, 0.1960784, 0, 1,
-1.82052, 0.8969274, -0.9282274, 1, 0.2039216, 0, 1,
-1.796115, -1.354932, -4.015936, 1, 0.2117647, 0, 1,
-1.785628, -0.3973215, -1.700549, 1, 0.2156863, 0, 1,
-1.765005, -0.9916091, -1.970433, 1, 0.2235294, 0, 1,
-1.742265, 0.3117591, -4.276452, 1, 0.227451, 0, 1,
-1.727245, 0.07226089, -1.285305, 1, 0.2352941, 0, 1,
-1.711558, 1.575865, -0.08237272, 1, 0.2392157, 0, 1,
-1.684329, 0.1802094, -1.045509, 1, 0.2470588, 0, 1,
-1.676745, -1.425489, -1.681855, 1, 0.2509804, 0, 1,
-1.663588, 1.445319, -0.690773, 1, 0.2588235, 0, 1,
-1.653821, 0.6951726, -3.007949, 1, 0.2627451, 0, 1,
-1.650014, 0.2464902, -3.176684, 1, 0.2705882, 0, 1,
-1.64391, 0.5257176, -2.609523, 1, 0.2745098, 0, 1,
-1.615721, 0.6438142, -1.156615, 1, 0.282353, 0, 1,
-1.60452, -1.647581, -2.340633, 1, 0.2862745, 0, 1,
-1.599451, -1.674067, -1.698725, 1, 0.2941177, 0, 1,
-1.599445, -0.1301717, -2.336475, 1, 0.3019608, 0, 1,
-1.592427, -1.189916, -1.725786, 1, 0.3058824, 0, 1,
-1.590432, -0.9169421, -0.8266308, 1, 0.3137255, 0, 1,
-1.568469, -0.6049677, -2.095771, 1, 0.3176471, 0, 1,
-1.56721, -0.5870789, -2.332875, 1, 0.3254902, 0, 1,
-1.566804, -1.221613, -1.435476, 1, 0.3294118, 0, 1,
-1.566238, 0.4665598, -2.647945, 1, 0.3372549, 0, 1,
-1.562091, -1.539512, -3.668832, 1, 0.3411765, 0, 1,
-1.54653, -0.1388596, -1.860186, 1, 0.3490196, 0, 1,
-1.537631, 0.2519741, -0.854807, 1, 0.3529412, 0, 1,
-1.536505, -1.817203, -1.760839, 1, 0.3607843, 0, 1,
-1.530772, 0.7506725, -0.7554871, 1, 0.3647059, 0, 1,
-1.52077, -0.881682, -2.943309, 1, 0.372549, 0, 1,
-1.482646, 1.864988, -2.23885, 1, 0.3764706, 0, 1,
-1.471327, 1.058611, -1.547519, 1, 0.3843137, 0, 1,
-1.465806, -2.444998, -3.778123, 1, 0.3882353, 0, 1,
-1.454112, 0.7163924, -2.227916, 1, 0.3960784, 0, 1,
-1.451857, -0.4806873, -3.373089, 1, 0.4039216, 0, 1,
-1.426178, 0.1267337, -0.3153699, 1, 0.4078431, 0, 1,
-1.420404, -0.347843, -1.857483, 1, 0.4156863, 0, 1,
-1.41581, -0.8382722, -1.457259, 1, 0.4196078, 0, 1,
-1.415198, -1.998084, -3.181922, 1, 0.427451, 0, 1,
-1.410276, -0.08637023, -0.4410186, 1, 0.4313726, 0, 1,
-1.408116, 0.7130737, -1.444248, 1, 0.4392157, 0, 1,
-1.39917, -1.605508, -3.713115, 1, 0.4431373, 0, 1,
-1.381643, -1.576555, -2.037501, 1, 0.4509804, 0, 1,
-1.371924, -1.14897, -4.517057, 1, 0.454902, 0, 1,
-1.366012, -1.934345, -3.627719, 1, 0.4627451, 0, 1,
-1.364035, 1.181133, -0.5052964, 1, 0.4666667, 0, 1,
-1.360169, 0.3674837, -0.2137019, 1, 0.4745098, 0, 1,
-1.359618, -1.87588, -4.413404, 1, 0.4784314, 0, 1,
-1.359102, -1.497017, -2.614384, 1, 0.4862745, 0, 1,
-1.354239, -0.685404, -1.723148, 1, 0.4901961, 0, 1,
-1.35357, -2.003089, -1.773922, 1, 0.4980392, 0, 1,
-1.338743, -0.6240758, -1.778234, 1, 0.5058824, 0, 1,
-1.332895, -0.708738, -3.569994, 1, 0.509804, 0, 1,
-1.332138, -1.041992, -0.7328571, 1, 0.5176471, 0, 1,
-1.331068, -0.4802321, -0.5008325, 1, 0.5215687, 0, 1,
-1.321143, -0.8856023, -1.860177, 1, 0.5294118, 0, 1,
-1.318396, -0.2025672, -1.925104, 1, 0.5333334, 0, 1,
-1.31023, 0.2522114, -2.980981, 1, 0.5411765, 0, 1,
-1.304517, 0.8358218, -4.235787, 1, 0.5450981, 0, 1,
-1.288276, -0.2794663, -0.5985423, 1, 0.5529412, 0, 1,
-1.263948, 0.6175772, -0.08663112, 1, 0.5568628, 0, 1,
-1.263676, -1.031626, -1.786744, 1, 0.5647059, 0, 1,
-1.256403, -0.6816756, -1.476796, 1, 0.5686275, 0, 1,
-1.255575, -0.1650411, -2.560547, 1, 0.5764706, 0, 1,
-1.25474, 0.5440778, -1.538737, 1, 0.5803922, 0, 1,
-1.248238, 1.418804, -0.928773, 1, 0.5882353, 0, 1,
-1.239267, -0.9789257, -1.731188, 1, 0.5921569, 0, 1,
-1.223311, -0.5639186, -3.625659, 1, 0.6, 0, 1,
-1.216601, 2.080174, -0.5934504, 1, 0.6078432, 0, 1,
-1.210726, -0.3972064, -2.41943, 1, 0.6117647, 0, 1,
-1.209682, -0.1266496, -1.280816, 1, 0.6196079, 0, 1,
-1.197298, -0.6269999, -3.304653, 1, 0.6235294, 0, 1,
-1.195084, -2.723361, -1.835068, 1, 0.6313726, 0, 1,
-1.193216, -0.8786281, -1.414216, 1, 0.6352941, 0, 1,
-1.187642, 1.077515, -1.575937, 1, 0.6431373, 0, 1,
-1.187445, -0.1135783, -1.965183, 1, 0.6470588, 0, 1,
-1.172652, -0.9487624, -2.206375, 1, 0.654902, 0, 1,
-1.16831, -0.4306684, -2.373797, 1, 0.6588235, 0, 1,
-1.16067, 2.171266, -0.1544865, 1, 0.6666667, 0, 1,
-1.152125, -1.19302, -3.022507, 1, 0.6705883, 0, 1,
-1.151168, 0.7563524, 0.5203466, 1, 0.6784314, 0, 1,
-1.149643, -0.7774643, -3.528702, 1, 0.682353, 0, 1,
-1.148527, 0.7122261, 0.2356921, 1, 0.6901961, 0, 1,
-1.14774, 0.2886236, -2.820855, 1, 0.6941177, 0, 1,
-1.141422, 1.438862, -1.143131, 1, 0.7019608, 0, 1,
-1.13984, 0.7654291, -0.8979783, 1, 0.7098039, 0, 1,
-1.135195, 1.053411, -2.477029, 1, 0.7137255, 0, 1,
-1.128492, 0.3943413, -3.229848, 1, 0.7215686, 0, 1,
-1.123107, -0.529664, -3.712285, 1, 0.7254902, 0, 1,
-1.122349, 0.8888258, -1.327893, 1, 0.7333333, 0, 1,
-1.119947, 0.8929239, 0.09519981, 1, 0.7372549, 0, 1,
-1.104797, 0.3557856, -1.412205, 1, 0.7450981, 0, 1,
-1.099705, 0.02960748, -0.08750635, 1, 0.7490196, 0, 1,
-1.096425, 2.470925, -1.060264, 1, 0.7568628, 0, 1,
-1.095672, 0.5411072, -0.587488, 1, 0.7607843, 0, 1,
-1.091729, -0.3485616, -1.173433, 1, 0.7686275, 0, 1,
-1.08053, -0.1421624, -0.4803223, 1, 0.772549, 0, 1,
-1.072553, 1.340398, -0.6331318, 1, 0.7803922, 0, 1,
-1.071648, -0.1693073, -2.174403, 1, 0.7843137, 0, 1,
-1.0705, -0.5477566, -1.700847, 1, 0.7921569, 0, 1,
-1.069613, -0.3426439, -2.097574, 1, 0.7960784, 0, 1,
-1.068182, 0.1606102, -2.44591, 1, 0.8039216, 0, 1,
-1.062247, 2.103924, -2.525611, 1, 0.8117647, 0, 1,
-1.042489, -1.674889, -2.539991, 1, 0.8156863, 0, 1,
-1.03963, 1.18983, -0.6381601, 1, 0.8235294, 0, 1,
-1.037721, -1.214896, -4.659215, 1, 0.827451, 0, 1,
-1.025853, -0.3188511, -0.3837528, 1, 0.8352941, 0, 1,
-1.01652, -0.4045053, -2.816483, 1, 0.8392157, 0, 1,
-1.004017, 0.2503153, -1.071012, 1, 0.8470588, 0, 1,
-1.003054, 1.956919, -1.510458, 1, 0.8509804, 0, 1,
-0.9970383, 0.3735517, 0.4363109, 1, 0.8588235, 0, 1,
-0.9873711, 0.5468975, -0.9652696, 1, 0.8627451, 0, 1,
-0.9797869, -0.2237731, -2.004512, 1, 0.8705882, 0, 1,
-0.9712007, 0.6318414, -0.8255045, 1, 0.8745098, 0, 1,
-0.9620664, 0.8904158, -0.2271731, 1, 0.8823529, 0, 1,
-0.9606827, -1.334363, -4.145978, 1, 0.8862745, 0, 1,
-0.9594499, 0.1117193, -0.7733507, 1, 0.8941177, 0, 1,
-0.9569166, -2.218493, -2.745573, 1, 0.8980392, 0, 1,
-0.946332, -1.450213, -2.277289, 1, 0.9058824, 0, 1,
-0.9429942, -0.2648695, -1.990749, 1, 0.9137255, 0, 1,
-0.9423217, -0.6510883, -2.221308, 1, 0.9176471, 0, 1,
-0.9404919, 0.404514, -0.6928359, 1, 0.9254902, 0, 1,
-0.9398819, 0.5380117, -0.9728031, 1, 0.9294118, 0, 1,
-0.9351489, -1.227138, -2.839873, 1, 0.9372549, 0, 1,
-0.9322209, -0.09483062, -0.6483428, 1, 0.9411765, 0, 1,
-0.9319538, 0.001323107, -1.686591, 1, 0.9490196, 0, 1,
-0.9309975, 0.445553, -0.2443047, 1, 0.9529412, 0, 1,
-0.9282995, 0.1576641, -1.519189, 1, 0.9607843, 0, 1,
-0.9168131, 0.4403503, 0.859384, 1, 0.9647059, 0, 1,
-0.9159171, 0.4661441, -0.3287202, 1, 0.972549, 0, 1,
-0.9018652, 2.611357, -3.387683, 1, 0.9764706, 0, 1,
-0.8980943, 1.848212, 1.064558, 1, 0.9843137, 0, 1,
-0.8972701, 0.1243031, -1.872392, 1, 0.9882353, 0, 1,
-0.8946259, -0.2792013, -2.563661, 1, 0.9960784, 0, 1,
-0.892723, 1.541642, -0.8224416, 0.9960784, 1, 0, 1,
-0.8881683, 0.2603419, -1.236581, 0.9921569, 1, 0, 1,
-0.884497, -0.5313694, -1.849345, 0.9843137, 1, 0, 1,
-0.8711976, -0.5117856, -1.922583, 0.9803922, 1, 0, 1,
-0.8693864, -0.3284676, -3.330754, 0.972549, 1, 0, 1,
-0.8655464, 0.232183, -0.5986592, 0.9686275, 1, 0, 1,
-0.8642864, 0.8832347, -0.02593955, 0.9607843, 1, 0, 1,
-0.8602984, -0.6963308, -2.649251, 0.9568627, 1, 0, 1,
-0.8602947, 1.090758, -0.7973914, 0.9490196, 1, 0, 1,
-0.8361164, 1.158992, 1.3902, 0.945098, 1, 0, 1,
-0.8275519, 1.160763, -3.142492, 0.9372549, 1, 0, 1,
-0.827271, 0.263757, 0.08011047, 0.9333333, 1, 0, 1,
-0.8256107, 0.653824, -2.60083, 0.9254902, 1, 0, 1,
-0.82464, -0.2148548, -0.2650459, 0.9215686, 1, 0, 1,
-0.8223752, 1.492612, 0.8393326, 0.9137255, 1, 0, 1,
-0.820493, 1.513986, -1.320645, 0.9098039, 1, 0, 1,
-0.8165526, -1.484237, -3.654475, 0.9019608, 1, 0, 1,
-0.8144581, -0.03114915, -0.7486262, 0.8941177, 1, 0, 1,
-0.8133978, -0.2642572, -3.819659, 0.8901961, 1, 0, 1,
-0.8130213, 0.3490706, -2.746159, 0.8823529, 1, 0, 1,
-0.8110911, 0.9448025, 0.1470882, 0.8784314, 1, 0, 1,
-0.8037493, 0.2986657, -1.643789, 0.8705882, 1, 0, 1,
-0.7997572, 0.365032, -0.8852431, 0.8666667, 1, 0, 1,
-0.7987447, 0.0588627, -1.460497, 0.8588235, 1, 0, 1,
-0.782716, -0.3510638, -2.815574, 0.854902, 1, 0, 1,
-0.7782893, -0.204322, -1.072075, 0.8470588, 1, 0, 1,
-0.7704353, 0.6731572, -2.252708, 0.8431373, 1, 0, 1,
-0.7629132, -1.430027, -1.570925, 0.8352941, 1, 0, 1,
-0.7612286, -1.883883, -2.296441, 0.8313726, 1, 0, 1,
-0.7570384, -0.1792735, -1.207396, 0.8235294, 1, 0, 1,
-0.7558162, 1.424356, -1.685925, 0.8196079, 1, 0, 1,
-0.7554894, -0.6655454, -2.793978, 0.8117647, 1, 0, 1,
-0.748998, -0.3161579, -0.2069596, 0.8078431, 1, 0, 1,
-0.7485757, 0.1577988, -2.538169, 0.8, 1, 0, 1,
-0.7424505, 0.4462496, -0.6626297, 0.7921569, 1, 0, 1,
-0.7353242, 2.591452, -0.6708253, 0.7882353, 1, 0, 1,
-0.7335638, -0.1308609, -2.62731, 0.7803922, 1, 0, 1,
-0.729611, -1.000954, -1.284064, 0.7764706, 1, 0, 1,
-0.7290685, 0.9687179, -1.831453, 0.7686275, 1, 0, 1,
-0.7244692, -1.483767, -2.854664, 0.7647059, 1, 0, 1,
-0.7235761, -1.708111, -2.323802, 0.7568628, 1, 0, 1,
-0.7213022, 2.008231, -2.105161, 0.7529412, 1, 0, 1,
-0.7194792, -0.7323974, -3.256429, 0.7450981, 1, 0, 1,
-0.71876, -0.1918821, -2.474348, 0.7411765, 1, 0, 1,
-0.7154413, -2.034053, -2.889109, 0.7333333, 1, 0, 1,
-0.7128646, 0.3074564, -1.156257, 0.7294118, 1, 0, 1,
-0.7094817, -0.0779708, -2.331113, 0.7215686, 1, 0, 1,
-0.7069153, -1.580766, -3.229139, 0.7176471, 1, 0, 1,
-0.7054527, 0.4941222, 0.4026194, 0.7098039, 1, 0, 1,
-0.7051536, -0.1411812, -0.9827166, 0.7058824, 1, 0, 1,
-0.7047962, 1.517725, 0.2035928, 0.6980392, 1, 0, 1,
-0.700611, -0.6601765, -2.269782, 0.6901961, 1, 0, 1,
-0.6982705, -0.2357582, -1.461422, 0.6862745, 1, 0, 1,
-0.6927621, -2.908832, -3.629749, 0.6784314, 1, 0, 1,
-0.6869483, -0.4146296, -1.203297, 0.6745098, 1, 0, 1,
-0.6839691, 0.6380554, -1.145081, 0.6666667, 1, 0, 1,
-0.6838844, 0.4051083, -0.8371717, 0.6627451, 1, 0, 1,
-0.6803488, -1.386275, -4.574123, 0.654902, 1, 0, 1,
-0.6778429, -0.3207696, -1.41334, 0.6509804, 1, 0, 1,
-0.6774246, -0.604432, -3.916263, 0.6431373, 1, 0, 1,
-0.6760747, 0.3986723, -1.757909, 0.6392157, 1, 0, 1,
-0.6753157, -1.169919, -1.377267, 0.6313726, 1, 0, 1,
-0.6675282, 2.19173, -1.15574, 0.627451, 1, 0, 1,
-0.6583901, 0.3374902, -0.7442996, 0.6196079, 1, 0, 1,
-0.6573336, 1.475978, -2.604661, 0.6156863, 1, 0, 1,
-0.6540802, -0.880877, -3.202403, 0.6078432, 1, 0, 1,
-0.6464157, -0.5631033, -1.674412, 0.6039216, 1, 0, 1,
-0.6463992, 1.708519, -0.1427293, 0.5960785, 1, 0, 1,
-0.6415976, -0.80905, -2.598564, 0.5882353, 1, 0, 1,
-0.6398034, 0.9852022, 0.5491467, 0.5843138, 1, 0, 1,
-0.6316625, 0.2422482, -0.6161377, 0.5764706, 1, 0, 1,
-0.6285172, -1.404329, -0.1351001, 0.572549, 1, 0, 1,
-0.6249233, 0.453175, -2.436134, 0.5647059, 1, 0, 1,
-0.621672, -3.247689, -3.142861, 0.5607843, 1, 0, 1,
-0.6201788, -0.87872, -2.287925, 0.5529412, 1, 0, 1,
-0.6170675, -0.6980659, -1.791411, 0.5490196, 1, 0, 1,
-0.6168574, -0.4750822, -4.17739, 0.5411765, 1, 0, 1,
-0.6141059, 0.9462819, -0.5424803, 0.5372549, 1, 0, 1,
-0.6129002, -0.2150808, -1.095737, 0.5294118, 1, 0, 1,
-0.6122517, -1.60549, -3.22011, 0.5254902, 1, 0, 1,
-0.6075895, -1.852593, -2.80295, 0.5176471, 1, 0, 1,
-0.6060578, -0.0003283433, -1.730725, 0.5137255, 1, 0, 1,
-0.6047892, -0.03273323, -0.9631175, 0.5058824, 1, 0, 1,
-0.6026328, 0.1598801, -2.215081, 0.5019608, 1, 0, 1,
-0.6024423, 1.071472, -2.273138, 0.4941176, 1, 0, 1,
-0.6012109, 0.4088286, 0.1698149, 0.4862745, 1, 0, 1,
-0.6011727, -0.292581, -1.605876, 0.4823529, 1, 0, 1,
-0.5976132, 0.980644, -1.807628, 0.4745098, 1, 0, 1,
-0.596936, 0.195668, -0.5067257, 0.4705882, 1, 0, 1,
-0.5947394, -0.3628395, -1.601154, 0.4627451, 1, 0, 1,
-0.5927766, -0.1230852, -1.206736, 0.4588235, 1, 0, 1,
-0.588634, -0.4087057, -4.049257, 0.4509804, 1, 0, 1,
-0.5848879, -1.155249, -2.481967, 0.4470588, 1, 0, 1,
-0.5823871, -1.909822, -5.200017, 0.4392157, 1, 0, 1,
-0.578882, 0.617174, -1.039558, 0.4352941, 1, 0, 1,
-0.5690942, -0.5442632, -3.672225, 0.427451, 1, 0, 1,
-0.568981, 1.488695, -0.6395634, 0.4235294, 1, 0, 1,
-0.5551318, 0.6130883, -2.139743, 0.4156863, 1, 0, 1,
-0.5514598, -0.5096328, -4.22486, 0.4117647, 1, 0, 1,
-0.5448315, -0.6796935, -2.124225, 0.4039216, 1, 0, 1,
-0.5421985, -0.7059383, -3.805315, 0.3960784, 1, 0, 1,
-0.5418037, 0.4504089, -0.4217741, 0.3921569, 1, 0, 1,
-0.5303348, 1.328634, -0.5334213, 0.3843137, 1, 0, 1,
-0.5280566, -0.824139, -2.548223, 0.3803922, 1, 0, 1,
-0.5252824, 0.07111259, -1.677641, 0.372549, 1, 0, 1,
-0.5248032, 2.082108, 0.6559662, 0.3686275, 1, 0, 1,
-0.5243884, -0.2127449, -0.6023977, 0.3607843, 1, 0, 1,
-0.5238823, 0.8359492, -1.4588, 0.3568628, 1, 0, 1,
-0.522694, -0.7069245, -2.683021, 0.3490196, 1, 0, 1,
-0.5151196, 0.5494331, -0.8044503, 0.345098, 1, 0, 1,
-0.5104567, 1.440545, -0.02163215, 0.3372549, 1, 0, 1,
-0.5103905, 0.7276891, -0.2264733, 0.3333333, 1, 0, 1,
-0.5100152, -0.3175769, -1.911582, 0.3254902, 1, 0, 1,
-0.5091499, 0.1796782, -1.318906, 0.3215686, 1, 0, 1,
-0.5033563, -0.6973152, -2.109589, 0.3137255, 1, 0, 1,
-0.5017679, -0.2655002, -3.484435, 0.3098039, 1, 0, 1,
-0.5015906, -0.9340894, -4.133388, 0.3019608, 1, 0, 1,
-0.5004031, 1.163557, 1.563109, 0.2941177, 1, 0, 1,
-0.4978398, -0.4361564, -1.887808, 0.2901961, 1, 0, 1,
-0.4934413, 0.8036108, -1.697298, 0.282353, 1, 0, 1,
-0.4933162, -0.5406134, -2.573034, 0.2784314, 1, 0, 1,
-0.4930931, -1.240725, -3.326351, 0.2705882, 1, 0, 1,
-0.4900572, -0.7781918, -2.40675, 0.2666667, 1, 0, 1,
-0.4888134, 1.469098, -0.8364246, 0.2588235, 1, 0, 1,
-0.4824811, 0.3940091, -1.814309, 0.254902, 1, 0, 1,
-0.4781356, 0.3722112, -2.570126, 0.2470588, 1, 0, 1,
-0.4754556, -0.2224991, -1.565342, 0.2431373, 1, 0, 1,
-0.4741226, -0.7375208, -3.314272, 0.2352941, 1, 0, 1,
-0.472213, -1.713434, -3.283665, 0.2313726, 1, 0, 1,
-0.4715502, -2.095773, -3.124449, 0.2235294, 1, 0, 1,
-0.4701296, -2.169231, -2.623386, 0.2196078, 1, 0, 1,
-0.4700477, 0.2421554, 0.42307, 0.2117647, 1, 0, 1,
-0.4696152, -1.362255, -2.154174, 0.2078431, 1, 0, 1,
-0.469543, 0.7968194, 1.260229, 0.2, 1, 0, 1,
-0.469164, 0.03497953, -2.151147, 0.1921569, 1, 0, 1,
-0.4688055, 0.5804478, 0.5179862, 0.1882353, 1, 0, 1,
-0.4664598, -0.4233303, -1.874802, 0.1803922, 1, 0, 1,
-0.4651372, 0.4722038, -1.236818, 0.1764706, 1, 0, 1,
-0.4649003, 1.498129, -2.034827, 0.1686275, 1, 0, 1,
-0.4626825, 0.3216434, -0.1147726, 0.1647059, 1, 0, 1,
-0.4621554, 0.8657159, 0.03047621, 0.1568628, 1, 0, 1,
-0.4584971, -1.044163, -2.620502, 0.1529412, 1, 0, 1,
-0.4578149, 0.9396459, -0.503929, 0.145098, 1, 0, 1,
-0.4551371, 1.577368, -0.9563426, 0.1411765, 1, 0, 1,
-0.4503382, 1.206567, 0.0117515, 0.1333333, 1, 0, 1,
-0.4474834, 0.8926298, -0.4357847, 0.1294118, 1, 0, 1,
-0.4445269, -1.13739, -2.690871, 0.1215686, 1, 0, 1,
-0.4431991, 0.1919495, -1.948198, 0.1176471, 1, 0, 1,
-0.4411246, -0.1435883, -1.938652, 0.1098039, 1, 0, 1,
-0.4397385, 0.7100676, 1.110095, 0.1058824, 1, 0, 1,
-0.4386337, 1.215283, -0.1668107, 0.09803922, 1, 0, 1,
-0.4385632, 1.068831, -0.6992164, 0.09019608, 1, 0, 1,
-0.4362184, 1.395023, -2.199028, 0.08627451, 1, 0, 1,
-0.4350905, 1.621498, -0.8768546, 0.07843138, 1, 0, 1,
-0.4347075, -0.6755995, -2.130915, 0.07450981, 1, 0, 1,
-0.433224, 0.915041, 1.665423, 0.06666667, 1, 0, 1,
-0.4284897, 0.3575853, -1.398649, 0.0627451, 1, 0, 1,
-0.4207405, 0.6691974, -0.1865666, 0.05490196, 1, 0, 1,
-0.4182827, 1.053879, 0.8916379, 0.05098039, 1, 0, 1,
-0.4133517, 0.8119394, 0.1450409, 0.04313726, 1, 0, 1,
-0.4119984, -0.5121811, -2.083339, 0.03921569, 1, 0, 1,
-0.4047916, -0.7931153, -3.538177, 0.03137255, 1, 0, 1,
-0.4015061, 0.7721328, -0.2689748, 0.02745098, 1, 0, 1,
-0.3976535, 0.5353671, 0.5190232, 0.01960784, 1, 0, 1,
-0.3946046, 2.614105, -0.3114296, 0.01568628, 1, 0, 1,
-0.3941987, -0.2192968, -3.05469, 0.007843138, 1, 0, 1,
-0.3937902, 1.575416, 0.4690101, 0.003921569, 1, 0, 1,
-0.39113, 0.1694158, -3.219619, 0, 1, 0.003921569, 1,
-0.3895858, 0.1947273, -2.319338, 0, 1, 0.01176471, 1,
-0.3837904, 0.3989482, -0.01339288, 0, 1, 0.01568628, 1,
-0.3792485, 0.7915357, -0.1301253, 0, 1, 0.02352941, 1,
-0.3757696, -0.2060697, -1.058995, 0, 1, 0.02745098, 1,
-0.3731094, 1.124066, 1.70075, 0, 1, 0.03529412, 1,
-0.3715773, 0.1407303, -1.206958, 0, 1, 0.03921569, 1,
-0.3714649, 0.8275703, 0.8170103, 0, 1, 0.04705882, 1,
-0.3640815, 0.1617632, -2.078256, 0, 1, 0.05098039, 1,
-0.3622661, 0.7812368, 1.14003, 0, 1, 0.05882353, 1,
-0.3610911, 0.1067089, -0.4373342, 0, 1, 0.0627451, 1,
-0.3583378, 0.4083541, -1.67148, 0, 1, 0.07058824, 1,
-0.358067, -1.990127, -3.41363, 0, 1, 0.07450981, 1,
-0.3538542, 0.737618, -2.22828, 0, 1, 0.08235294, 1,
-0.352937, -0.2591256, -1.87211, 0, 1, 0.08627451, 1,
-0.3442604, 0.8720823, -1.192424, 0, 1, 0.09411765, 1,
-0.3417135, 1.469681, 1.512308, 0, 1, 0.1019608, 1,
-0.3398814, -0.9574607, -2.001905, 0, 1, 0.1058824, 1,
-0.3389753, 1.704434, 0.8802236, 0, 1, 0.1137255, 1,
-0.3372695, -0.8589938, -1.403628, 0, 1, 0.1176471, 1,
-0.3334897, -0.879293, -1.745351, 0, 1, 0.1254902, 1,
-0.3329033, 0.09446952, 0.5073052, 0, 1, 0.1294118, 1,
-0.3287464, -0.5652481, -2.685804, 0, 1, 0.1372549, 1,
-0.3269094, -2.470352, -1.972652, 0, 1, 0.1411765, 1,
-0.3256451, 1.995049, 0.2333337, 0, 1, 0.1490196, 1,
-0.324917, 0.9563279, 0.6982027, 0, 1, 0.1529412, 1,
-0.3230343, -1.647363, -2.291613, 0, 1, 0.1607843, 1,
-0.3195907, 0.6975428, 1.008405, 0, 1, 0.1647059, 1,
-0.3177194, -1.10874, -2.914009, 0, 1, 0.172549, 1,
-0.3159361, -0.3332829, -1.447815, 0, 1, 0.1764706, 1,
-0.3073036, -0.07902014, -2.037545, 0, 1, 0.1843137, 1,
-0.3009081, 0.7357899, -0.2207287, 0, 1, 0.1882353, 1,
-0.2984828, 0.5555376, -0.6709449, 0, 1, 0.1960784, 1,
-0.2966599, 1.28662, -0.1196114, 0, 1, 0.2039216, 1,
-0.2913379, -1.732887, -2.472378, 0, 1, 0.2078431, 1,
-0.289539, -0.3685368, -1.67573, 0, 1, 0.2156863, 1,
-0.2857243, -0.07235532, -2.475883, 0, 1, 0.2196078, 1,
-0.2844542, 0.2595149, -0.9681658, 0, 1, 0.227451, 1,
-0.2834646, 0.4344765, 0.461273, 0, 1, 0.2313726, 1,
-0.2826417, -1.102862, -2.403551, 0, 1, 0.2392157, 1,
-0.2785282, 0.03642241, 1.359929, 0, 1, 0.2431373, 1,
-0.2731651, -1.94411, -2.555329, 0, 1, 0.2509804, 1,
-0.2715577, -0.5654178, -1.641702, 0, 1, 0.254902, 1,
-0.270667, -0.3668987, -3.815173, 0, 1, 0.2627451, 1,
-0.2676422, -0.8895686, -2.516759, 0, 1, 0.2666667, 1,
-0.2664017, 0.06830503, -0.1955857, 0, 1, 0.2745098, 1,
-0.2632344, 0.8625261, -0.5357315, 0, 1, 0.2784314, 1,
-0.2592394, -0.5256948, -0.3443542, 0, 1, 0.2862745, 1,
-0.2580088, -0.6606798, -2.383291, 0, 1, 0.2901961, 1,
-0.2549299, 0.6919225, -0.2946321, 0, 1, 0.2980392, 1,
-0.2489879, -0.9373322, -2.238671, 0, 1, 0.3058824, 1,
-0.2478172, -0.08207165, -1.264022, 0, 1, 0.3098039, 1,
-0.246484, -0.8929058, -0.9566947, 0, 1, 0.3176471, 1,
-0.2459722, 1.20722, -1.317912, 0, 1, 0.3215686, 1,
-0.241675, -1.178456, -2.023008, 0, 1, 0.3294118, 1,
-0.2392615, -0.4601329, -2.093036, 0, 1, 0.3333333, 1,
-0.2380366, -0.4062288, -2.332423, 0, 1, 0.3411765, 1,
-0.2377774, 0.7916375, -1.885898, 0, 1, 0.345098, 1,
-0.2374645, -0.2147245, -1.686174, 0, 1, 0.3529412, 1,
-0.2354093, -0.0319831, -2.015465, 0, 1, 0.3568628, 1,
-0.2352143, 1.357712, 1.078664, 0, 1, 0.3647059, 1,
-0.2343419, -1.422614, -3.360999, 0, 1, 0.3686275, 1,
-0.2316159, 0.6215373, 0.2434417, 0, 1, 0.3764706, 1,
-0.2296555, -1.752047, -3.040119, 0, 1, 0.3803922, 1,
-0.228888, 0.0312667, 0.4717607, 0, 1, 0.3882353, 1,
-0.227346, 0.2812673, -0.1538585, 0, 1, 0.3921569, 1,
-0.2260613, -0.08936118, -2.319686, 0, 1, 0.4, 1,
-0.2246541, 1.291609, -0.652571, 0, 1, 0.4078431, 1,
-0.2237139, -1.807723, -3.074302, 0, 1, 0.4117647, 1,
-0.2123197, 1.11717, -1.099947, 0, 1, 0.4196078, 1,
-0.2122566, 0.637574, -0.818602, 0, 1, 0.4235294, 1,
-0.2106485, 0.9780277, -0.4614778, 0, 1, 0.4313726, 1,
-0.2096858, -1.01171, -2.127108, 0, 1, 0.4352941, 1,
-0.2076257, 0.06055288, -2.397113, 0, 1, 0.4431373, 1,
-0.2042499, 1.905902, 0.977336, 0, 1, 0.4470588, 1,
-0.2037085, -1.220077, -4.625194, 0, 1, 0.454902, 1,
-0.2022424, -0.9827456, -0.5468426, 0, 1, 0.4588235, 1,
-0.1998217, 1.210176, -0.6406177, 0, 1, 0.4666667, 1,
-0.1985773, 0.3022957, -1.505719, 0, 1, 0.4705882, 1,
-0.1962145, -0.760256, -2.625644, 0, 1, 0.4784314, 1,
-0.1956202, -0.0822022, -2.013842, 0, 1, 0.4823529, 1,
-0.1949995, 2.083627, 0.06568334, 0, 1, 0.4901961, 1,
-0.1924405, -2.071276, -4.239008, 0, 1, 0.4941176, 1,
-0.1922327, 0.6462015, 1.3882, 0, 1, 0.5019608, 1,
-0.1867175, 0.09420992, 1.252924, 0, 1, 0.509804, 1,
-0.183178, -0.05762907, -1.629516, 0, 1, 0.5137255, 1,
-0.1818876, 0.9177274, -2.232502, 0, 1, 0.5215687, 1,
-0.1794026, 1.703046, 0.4290368, 0, 1, 0.5254902, 1,
-0.1787589, -0.02469506, -1.371137, 0, 1, 0.5333334, 1,
-0.176931, -1.041091, -2.903849, 0, 1, 0.5372549, 1,
-0.1734347, 0.2082396, 1.279678, 0, 1, 0.5450981, 1,
-0.1688619, -0.6982741, -0.9606541, 0, 1, 0.5490196, 1,
-0.1650017, -1.160573, -4.995362, 0, 1, 0.5568628, 1,
-0.16355, -1.330082, -2.56424, 0, 1, 0.5607843, 1,
-0.1629619, -0.140934, -1.624595, 0, 1, 0.5686275, 1,
-0.1622773, -0.6165212, -2.219774, 0, 1, 0.572549, 1,
-0.1622343, -0.7644253, -4.997756, 0, 1, 0.5803922, 1,
-0.1602444, -0.4031265, -2.323477, 0, 1, 0.5843138, 1,
-0.1584266, 0.4502727, 0.004491196, 0, 1, 0.5921569, 1,
-0.1559917, -0.211996, -4.039859, 0, 1, 0.5960785, 1,
-0.1552863, -0.02359756, -2.777054, 0, 1, 0.6039216, 1,
-0.1548373, 0.8758394, 0.9513939, 0, 1, 0.6117647, 1,
-0.1537799, 0.9752055, -0.2908298, 0, 1, 0.6156863, 1,
-0.1470953, 0.2056662, 1.467613, 0, 1, 0.6235294, 1,
-0.1441093, -0.944845, -3.387609, 0, 1, 0.627451, 1,
-0.143729, -1.163303, -3.02258, 0, 1, 0.6352941, 1,
-0.1423324, -0.5863543, -3.988167, 0, 1, 0.6392157, 1,
-0.1412964, 0.07077014, -2.126306, 0, 1, 0.6470588, 1,
-0.1389067, -0.341378, -2.268742, 0, 1, 0.6509804, 1,
-0.1360009, -0.5502431, -3.224813, 0, 1, 0.6588235, 1,
-0.1325004, 0.87501, -0.4862932, 0, 1, 0.6627451, 1,
-0.1321402, 1.8392, -0.254753, 0, 1, 0.6705883, 1,
-0.1321342, -0.3353328, -4.076858, 0, 1, 0.6745098, 1,
-0.1313182, -0.7853752, -2.036911, 0, 1, 0.682353, 1,
-0.1278839, -1.25041, -3.528266, 0, 1, 0.6862745, 1,
-0.1188734, -0.01970523, -0.4186278, 0, 1, 0.6941177, 1,
-0.118866, -0.3043677, -3.668865, 0, 1, 0.7019608, 1,
-0.1179771, 0.8012856, -0.6853719, 0, 1, 0.7058824, 1,
-0.1113629, -2.309912, -3.25635, 0, 1, 0.7137255, 1,
-0.1086663, 0.01032629, -2.7595, 0, 1, 0.7176471, 1,
-0.1077977, -0.9432322, -4.251012, 0, 1, 0.7254902, 1,
-0.1054214, 1.248181, -0.4295376, 0, 1, 0.7294118, 1,
-0.1018517, -0.6964048, -2.799097, 0, 1, 0.7372549, 1,
-0.1006466, 0.7912782, -0.179281, 0, 1, 0.7411765, 1,
-0.1004223, -0.5160815, -4.368175, 0, 1, 0.7490196, 1,
-0.09998143, -0.09254498, -1.608316, 0, 1, 0.7529412, 1,
-0.09850545, 0.596683, -0.3289984, 0, 1, 0.7607843, 1,
-0.09705923, -0.2374325, -3.448688, 0, 1, 0.7647059, 1,
-0.09506711, -1.110508, -3.794944, 0, 1, 0.772549, 1,
-0.09369829, 0.840155, -0.8263184, 0, 1, 0.7764706, 1,
-0.09120036, 1.109888, 1.490098, 0, 1, 0.7843137, 1,
-0.08587336, 0.6643506, -0.4388947, 0, 1, 0.7882353, 1,
-0.08036402, 2.690177, 1.246724, 0, 1, 0.7960784, 1,
-0.07674463, -0.04385212, -1.233478, 0, 1, 0.8039216, 1,
-0.07655995, 0.5706702, -0.4918334, 0, 1, 0.8078431, 1,
-0.07649235, 1.150384, 0.4294921, 0, 1, 0.8156863, 1,
-0.07287177, -2.668026, -2.818431, 0, 1, 0.8196079, 1,
-0.06885934, 2.616388, -0.3792935, 0, 1, 0.827451, 1,
-0.06264479, 1.55707, -0.03594873, 0, 1, 0.8313726, 1,
-0.06171572, 0.3928453, -0.52739, 0, 1, 0.8392157, 1,
-0.05784443, -1.047904, -2.942183, 0, 1, 0.8431373, 1,
-0.05776038, -1.754245, -2.939596, 0, 1, 0.8509804, 1,
-0.05717337, -0.2335255, -2.260195, 0, 1, 0.854902, 1,
-0.05651462, 0.3824764, -0.744686, 0, 1, 0.8627451, 1,
-0.05406563, -1.966417, -3.380422, 0, 1, 0.8666667, 1,
-0.0471131, 1.211955, 0.443107, 0, 1, 0.8745098, 1,
-0.0453098, -0.5326712, -1.557091, 0, 1, 0.8784314, 1,
-0.03734282, -0.3077423, -3.0528, 0, 1, 0.8862745, 1,
-0.03725421, 0.07989936, -0.5509236, 0, 1, 0.8901961, 1,
-0.03271398, 0.2859165, 0.533008, 0, 1, 0.8980392, 1,
-0.02914524, -1.144019, -1.808295, 0, 1, 0.9058824, 1,
-0.02778837, 0.4661263, 1.994816, 0, 1, 0.9098039, 1,
-0.02747155, -0.5071339, -2.588604, 0, 1, 0.9176471, 1,
-0.02007557, -1.110328, -3.303451, 0, 1, 0.9215686, 1,
-0.01312235, 1.198628, 0.2170098, 0, 1, 0.9294118, 1,
-0.01285069, -0.03233806, -2.696477, 0, 1, 0.9333333, 1,
-0.006540779, 0.4934803, 0.04367406, 0, 1, 0.9411765, 1,
-0.001446867, -1.280958, -2.902796, 0, 1, 0.945098, 1,
0.0116056, 0.003939684, 1.739021, 0, 1, 0.9529412, 1,
0.01582751, -0.320639, 3.329212, 0, 1, 0.9568627, 1,
0.01597034, -0.5216116, 4.956415, 0, 1, 0.9647059, 1,
0.01607896, -0.01477766, 4.08628, 0, 1, 0.9686275, 1,
0.01696587, 1.789992, -1.402478, 0, 1, 0.9764706, 1,
0.02251682, 0.2540151, -0.826576, 0, 1, 0.9803922, 1,
0.0225825, -1.120742, 2.717005, 0, 1, 0.9882353, 1,
0.02430817, -1.037611, 3.14777, 0, 1, 0.9921569, 1,
0.0243471, 0.2997275, -0.1859345, 0, 1, 1, 1,
0.02450415, -0.2930762, 3.016841, 0, 0.9921569, 1, 1,
0.02977189, -0.1275114, 3.192326, 0, 0.9882353, 1, 1,
0.03098455, -0.995917, 4.893887, 0, 0.9803922, 1, 1,
0.03196631, -0.3675101, 1.633769, 0, 0.9764706, 1, 1,
0.03820246, 0.005430388, 1.926686, 0, 0.9686275, 1, 1,
0.0507925, -1.315064, 2.228848, 0, 0.9647059, 1, 1,
0.051054, -0.4728698, 3.274311, 0, 0.9568627, 1, 1,
0.05109814, 0.873787, 1.034436, 0, 0.9529412, 1, 1,
0.05116224, 0.3091577, 0.9596841, 0, 0.945098, 1, 1,
0.05331454, 0.5481058, 0.4267716, 0, 0.9411765, 1, 1,
0.05413732, -0.1006925, 0.480516, 0, 0.9333333, 1, 1,
0.05509609, 0.7888373, -0.1169745, 0, 0.9294118, 1, 1,
0.06358852, 0.8906828, -0.2612714, 0, 0.9215686, 1, 1,
0.06379336, -0.2572471, 1.266829, 0, 0.9176471, 1, 1,
0.06446514, 0.4089069, 0.4784772, 0, 0.9098039, 1, 1,
0.06638058, -1.400259, 1.671494, 0, 0.9058824, 1, 1,
0.06735246, -1.22677, 4.099262, 0, 0.8980392, 1, 1,
0.06856868, 0.3221218, -0.2311281, 0, 0.8901961, 1, 1,
0.07096589, -1.33903, 5.063706, 0, 0.8862745, 1, 1,
0.07248183, 0.4850371, 1.180974, 0, 0.8784314, 1, 1,
0.07325307, -0.454262, 5.190641, 0, 0.8745098, 1, 1,
0.07640683, 2.061588, 0.5625642, 0, 0.8666667, 1, 1,
0.08003996, 0.3589613, -1.011072, 0, 0.8627451, 1, 1,
0.08253434, -1.166587, 2.6699, 0, 0.854902, 1, 1,
0.09347677, -0.2202062, 2.741678, 0, 0.8509804, 1, 1,
0.09643193, -0.4755748, 0.7256806, 0, 0.8431373, 1, 1,
0.09993359, -0.5400938, 3.014342, 0, 0.8392157, 1, 1,
0.1017142, -1.011481, 1.683133, 0, 0.8313726, 1, 1,
0.1025713, -0.2052128, 3.069706, 0, 0.827451, 1, 1,
0.1029628, -1.162737, 3.933153, 0, 0.8196079, 1, 1,
0.1030273, 0.8010568, -0.803197, 0, 0.8156863, 1, 1,
0.1036257, -0.4070977, 4.597402, 0, 0.8078431, 1, 1,
0.1046883, 0.7357283, -0.2900221, 0, 0.8039216, 1, 1,
0.1064462, -0.4027103, 3.731757, 0, 0.7960784, 1, 1,
0.1109237, -0.8929386, 2.709671, 0, 0.7882353, 1, 1,
0.1126098, -2.123635, 3.166443, 0, 0.7843137, 1, 1,
0.1141925, 0.6925598, 0.2948591, 0, 0.7764706, 1, 1,
0.1155041, -1.39694, 3.012928, 0, 0.772549, 1, 1,
0.1166447, -1.338572, 2.454394, 0, 0.7647059, 1, 1,
0.1168329, -1.130651, 3.151136, 0, 0.7607843, 1, 1,
0.1179123, 0.3977011, -0.04190687, 0, 0.7529412, 1, 1,
0.1187949, -0.04969183, 2.057844, 0, 0.7490196, 1, 1,
0.1202423, -2.542448, 2.058702, 0, 0.7411765, 1, 1,
0.1205221, 0.6515811, -0.2964753, 0, 0.7372549, 1, 1,
0.1214388, 0.0435653, 0.9244813, 0, 0.7294118, 1, 1,
0.1220634, 0.3978414, 0.08227368, 0, 0.7254902, 1, 1,
0.1261941, -1.115342, 4.030252, 0, 0.7176471, 1, 1,
0.1288974, 0.6657794, -0.2395453, 0, 0.7137255, 1, 1,
0.1328345, 0.4074712, 0.4882949, 0, 0.7058824, 1, 1,
0.1358433, -0.5990888, 1.504735, 0, 0.6980392, 1, 1,
0.1361288, -1.437278, 2.066592, 0, 0.6941177, 1, 1,
0.1361391, 0.1229586, -0.03844853, 0, 0.6862745, 1, 1,
0.1373433, -1.504262, 3.253748, 0, 0.682353, 1, 1,
0.1400076, -1.819629, 3.198155, 0, 0.6745098, 1, 1,
0.1410013, -0.5551486, 3.492427, 0, 0.6705883, 1, 1,
0.1485761, 1.011846, 0.2524688, 0, 0.6627451, 1, 1,
0.1500037, -0.5126343, 2.157702, 0, 0.6588235, 1, 1,
0.1536902, -1.099013, 4.391057, 0, 0.6509804, 1, 1,
0.1555297, -0.1922087, 3.185514, 0, 0.6470588, 1, 1,
0.1558478, 0.7860663, 0.3289081, 0, 0.6392157, 1, 1,
0.1605467, 0.6697535, 0.8348649, 0, 0.6352941, 1, 1,
0.1649364, -0.5789537, 4.328736, 0, 0.627451, 1, 1,
0.1704049, -2.248474, 6.060526, 0, 0.6235294, 1, 1,
0.1726639, -0.1300945, 1.63422, 0, 0.6156863, 1, 1,
0.1745472, 0.5544721, 0.2716891, 0, 0.6117647, 1, 1,
0.1765225, -0.6090719, 4.048142, 0, 0.6039216, 1, 1,
0.1770689, -0.394842, 2.999271, 0, 0.5960785, 1, 1,
0.1775831, -0.2052871, 1.699855, 0, 0.5921569, 1, 1,
0.1801705, 2.222132, -1.544513, 0, 0.5843138, 1, 1,
0.180174, 0.3457576, 1.065725, 0, 0.5803922, 1, 1,
0.1849828, 1.185318, -0.1418231, 0, 0.572549, 1, 1,
0.1856786, 1.204586, 0.6039669, 0, 0.5686275, 1, 1,
0.1871661, 0.4666547, -2.08252, 0, 0.5607843, 1, 1,
0.188647, 0.09319992, 1.014456, 0, 0.5568628, 1, 1,
0.1886899, -0.2852326, 3.319569, 0, 0.5490196, 1, 1,
0.1909959, -0.1710678, 0.2389116, 0, 0.5450981, 1, 1,
0.1946538, 0.1170043, 2.89983, 0, 0.5372549, 1, 1,
0.1980476, 0.4114398, 0.3269487, 0, 0.5333334, 1, 1,
0.2011478, -0.8589599, 4.68424, 0, 0.5254902, 1, 1,
0.2027268, 1.320168, 0.04008396, 0, 0.5215687, 1, 1,
0.2030563, -0.554222, 2.600214, 0, 0.5137255, 1, 1,
0.2063979, -1.411028, 1.947466, 0, 0.509804, 1, 1,
0.2155278, 1.577726, 0.1198427, 0, 0.5019608, 1, 1,
0.2215957, 1.973186, -0.08771015, 0, 0.4941176, 1, 1,
0.2237197, -1.156232, 1.946977, 0, 0.4901961, 1, 1,
0.2296247, -0.6177142, 2.762922, 0, 0.4823529, 1, 1,
0.232217, -0.9128011, 1.890437, 0, 0.4784314, 1, 1,
0.2381115, 1.147094, -0.2015327, 0, 0.4705882, 1, 1,
0.2396751, 1.105319, -1.369886, 0, 0.4666667, 1, 1,
0.2401168, 0.418006, 1.705031, 0, 0.4588235, 1, 1,
0.2427641, -0.8635265, 2.17609, 0, 0.454902, 1, 1,
0.2428613, 1.870752, 1.981393, 0, 0.4470588, 1, 1,
0.2499612, 0.6330528, 0.8522689, 0, 0.4431373, 1, 1,
0.2552491, -0.7699441, 1.491099, 0, 0.4352941, 1, 1,
0.2557549, -0.7755406, 1.861389, 0, 0.4313726, 1, 1,
0.2621789, -1.028177, 3.648497, 0, 0.4235294, 1, 1,
0.2625315, 0.3130159, 0.5617443, 0, 0.4196078, 1, 1,
0.2652077, 0.2621792, 0.9261681, 0, 0.4117647, 1, 1,
0.2669999, 0.07352883, 1.266726, 0, 0.4078431, 1, 1,
0.2676074, -0.7702524, 3.762821, 0, 0.4, 1, 1,
0.2699618, -0.6703025, 2.472508, 0, 0.3921569, 1, 1,
0.2706954, 0.8566728, -1.404971, 0, 0.3882353, 1, 1,
0.2780477, 0.1893288, 0.5023332, 0, 0.3803922, 1, 1,
0.2786605, 1.399245, -0.4932287, 0, 0.3764706, 1, 1,
0.2786608, 2.017089, -0.7478254, 0, 0.3686275, 1, 1,
0.2798246, -0.6209075, 2.278752, 0, 0.3647059, 1, 1,
0.2845679, -0.5716798, 1.296604, 0, 0.3568628, 1, 1,
0.2846898, -0.5069767, 3.100537, 0, 0.3529412, 1, 1,
0.2860517, -0.006873168, 1.642087, 0, 0.345098, 1, 1,
0.2864516, -1.365317, 3.885794, 0, 0.3411765, 1, 1,
0.2897809, 1.967436, 0.1935556, 0, 0.3333333, 1, 1,
0.2911369, -1.470821, 4.895476, 0, 0.3294118, 1, 1,
0.2935998, -0.274537, 1.526147, 0, 0.3215686, 1, 1,
0.2958341, 1.07444, 1.708174, 0, 0.3176471, 1, 1,
0.2994008, 0.8690692, -0.09038246, 0, 0.3098039, 1, 1,
0.3022057, -2.384561, 2.942386, 0, 0.3058824, 1, 1,
0.3034189, -0.6735103, 1.692274, 0, 0.2980392, 1, 1,
0.3036607, -0.4670687, 2.204796, 0, 0.2901961, 1, 1,
0.30387, 0.685734, 0.1113061, 0, 0.2862745, 1, 1,
0.3049125, 0.3491134, 0.02175181, 0, 0.2784314, 1, 1,
0.3059571, -1.999778, 1.181062, 0, 0.2745098, 1, 1,
0.3066778, -0.4234176, 3.161386, 0, 0.2666667, 1, 1,
0.306989, 0.4539827, 1.276684, 0, 0.2627451, 1, 1,
0.3129314, -0.3082105, 2.591459, 0, 0.254902, 1, 1,
0.3188046, -0.6876531, 2.822913, 0, 0.2509804, 1, 1,
0.3225332, 0.6194975, 2.5121, 0, 0.2431373, 1, 1,
0.3233086, -1.378856, 3.006219, 0, 0.2392157, 1, 1,
0.3260309, -0.5853993, 4.477367, 0, 0.2313726, 1, 1,
0.3269721, 2.034862, -0.4952669, 0, 0.227451, 1, 1,
0.3269773, 1.812641, -2.213043, 0, 0.2196078, 1, 1,
0.3288372, 0.8319898, 1.267719, 0, 0.2156863, 1, 1,
0.3324135, 0.4369385, 1.191065, 0, 0.2078431, 1, 1,
0.3336245, 1.300872, -0.6713441, 0, 0.2039216, 1, 1,
0.3360196, 1.066179, 0.740214, 0, 0.1960784, 1, 1,
0.3368953, -1.168636, 4.352211, 0, 0.1882353, 1, 1,
0.3374771, -0.2430921, 2.181223, 0, 0.1843137, 1, 1,
0.3391064, -0.7135489, 3.89302, 0, 0.1764706, 1, 1,
0.3407937, -0.5528113, 1.827812, 0, 0.172549, 1, 1,
0.3478266, -2.732591, 2.826968, 0, 0.1647059, 1, 1,
0.3485897, -0.1676812, 1.136723, 0, 0.1607843, 1, 1,
0.349329, 1.109487, 0.1454845, 0, 0.1529412, 1, 1,
0.3494044, -0.2709115, 2.592301, 0, 0.1490196, 1, 1,
0.3537771, -0.5171335, 4.141221, 0, 0.1411765, 1, 1,
0.3574286, 0.3309012, 2.036222, 0, 0.1372549, 1, 1,
0.3589293, -0.03498016, -0.03312778, 0, 0.1294118, 1, 1,
0.3641535, -0.1262641, 3.243658, 0, 0.1254902, 1, 1,
0.3667642, 1.486765, -1.325371, 0, 0.1176471, 1, 1,
0.3684399, -1.193433, 3.57281, 0, 0.1137255, 1, 1,
0.3699349, 0.268708, 1.703276, 0, 0.1058824, 1, 1,
0.3758965, -0.1091945, 0.4139656, 0, 0.09803922, 1, 1,
0.3798729, 0.57771, 0.08378772, 0, 0.09411765, 1, 1,
0.3820792, -0.4086952, 1.308909, 0, 0.08627451, 1, 1,
0.3846304, -0.3848487, 2.068556, 0, 0.08235294, 1, 1,
0.3856507, -0.3728676, 1.268918, 0, 0.07450981, 1, 1,
0.3870631, -2.437275, 3.589809, 0, 0.07058824, 1, 1,
0.3897667, -0.7265645, 3.140847, 0, 0.0627451, 1, 1,
0.3961024, -0.9714437, 2.253778, 0, 0.05882353, 1, 1,
0.4002065, -0.4581683, 0.9558266, 0, 0.05098039, 1, 1,
0.4022315, -2.116776, 2.40957, 0, 0.04705882, 1, 1,
0.4030873, -2.276285, 1.94242, 0, 0.03921569, 1, 1,
0.4061302, 0.9742689, 0.7371861, 0, 0.03529412, 1, 1,
0.4169886, 1.414381, -0.2586525, 0, 0.02745098, 1, 1,
0.4179357, 1.494977, -0.5006711, 0, 0.02352941, 1, 1,
0.4185353, 1.659867, -1.714134, 0, 0.01568628, 1, 1,
0.4215333, 0.5048639, 0.7603388, 0, 0.01176471, 1, 1,
0.422103, 1.267125, -1.689614, 0, 0.003921569, 1, 1,
0.4222687, -1.281252, 3.138606, 0.003921569, 0, 1, 1,
0.4227469, 0.7349488, -0.7005509, 0.007843138, 0, 1, 1,
0.4267544, -1.403342, 1.672707, 0.01568628, 0, 1, 1,
0.4360762, 0.02498796, 2.154509, 0.01960784, 0, 1, 1,
0.4360824, -0.9085105, 1.041434, 0.02745098, 0, 1, 1,
0.436647, -0.2996344, 1.890423, 0.03137255, 0, 1, 1,
0.4417339, -0.4256246, 3.194888, 0.03921569, 0, 1, 1,
0.4460081, -0.7019997, 1.970786, 0.04313726, 0, 1, 1,
0.4460184, 0.3394343, 0.09939268, 0.05098039, 0, 1, 1,
0.4516138, 1.359899, 0.8269402, 0.05490196, 0, 1, 1,
0.4594001, 0.06141682, 0.5645489, 0.0627451, 0, 1, 1,
0.460189, 0.3069657, 0.274696, 0.06666667, 0, 1, 1,
0.4645253, -0.1670611, 3.245942, 0.07450981, 0, 1, 1,
0.4664997, 0.01990965, 2.287701, 0.07843138, 0, 1, 1,
0.4730459, -0.7833062, 2.565427, 0.08627451, 0, 1, 1,
0.4740866, 0.4700876, -1.178714, 0.09019608, 0, 1, 1,
0.47823, -0.5438125, 0.5965616, 0.09803922, 0, 1, 1,
0.4815281, -0.984592, 2.074877, 0.1058824, 0, 1, 1,
0.4911011, -1.223186, -0.5329214, 0.1098039, 0, 1, 1,
0.4987801, -0.0477134, 2.883717, 0.1176471, 0, 1, 1,
0.5001848, -0.8843814, 3.26526, 0.1215686, 0, 1, 1,
0.5046521, -0.8277544, 2.193101, 0.1294118, 0, 1, 1,
0.5055712, -0.1048542, 0.6531492, 0.1333333, 0, 1, 1,
0.5063029, 0.4973251, 0.7112162, 0.1411765, 0, 1, 1,
0.5071061, 0.1310903, 1.151184, 0.145098, 0, 1, 1,
0.5109481, 1.255238, 1.374351, 0.1529412, 0, 1, 1,
0.5150993, 0.767563, 1.090835, 0.1568628, 0, 1, 1,
0.5185149, 1.009738, -0.2250107, 0.1647059, 0, 1, 1,
0.5222809, -0.7729763, 2.600289, 0.1686275, 0, 1, 1,
0.5244278, -0.04931652, 2.434625, 0.1764706, 0, 1, 1,
0.5263863, -0.3179142, 2.703548, 0.1803922, 0, 1, 1,
0.5270753, -0.3618545, 1.483893, 0.1882353, 0, 1, 1,
0.5318012, -0.3839286, 2.130752, 0.1921569, 0, 1, 1,
0.5409166, -0.460651, 3.157826, 0.2, 0, 1, 1,
0.5428288, -0.2569275, -1.072932, 0.2078431, 0, 1, 1,
0.5444858, -0.1983719, 1.883036, 0.2117647, 0, 1, 1,
0.5463414, -0.4299841, 1.479321, 0.2196078, 0, 1, 1,
0.5501831, -1.191799, 2.325635, 0.2235294, 0, 1, 1,
0.551428, 0.2474142, 1.515292, 0.2313726, 0, 1, 1,
0.5535788, 0.830056, 0.5080879, 0.2352941, 0, 1, 1,
0.5544115, -0.1434543, 2.338886, 0.2431373, 0, 1, 1,
0.5550879, 0.07079738, 0.791149, 0.2470588, 0, 1, 1,
0.5617775, -1.273914, 3.643339, 0.254902, 0, 1, 1,
0.5624047, -1.456253, 3.45627, 0.2588235, 0, 1, 1,
0.5627265, 0.1003037, 0.8748713, 0.2666667, 0, 1, 1,
0.5715791, -0.5706243, 2.200974, 0.2705882, 0, 1, 1,
0.573044, 0.292713, 0.6279505, 0.2784314, 0, 1, 1,
0.5815817, 1.075129, 0.9889574, 0.282353, 0, 1, 1,
0.5939105, 0.406049, 1.074019, 0.2901961, 0, 1, 1,
0.5949526, -1.031533, 0.01955283, 0.2941177, 0, 1, 1,
0.595593, 0.2841769, 1.618278, 0.3019608, 0, 1, 1,
0.5957017, -0.7894239, 2.043312, 0.3098039, 0, 1, 1,
0.5965995, -0.1504541, 2.215437, 0.3137255, 0, 1, 1,
0.5973363, 0.7381049, -0.1961771, 0.3215686, 0, 1, 1,
0.5973802, 1.944415, 0.3258244, 0.3254902, 0, 1, 1,
0.5997965, -0.209335, 1.629393, 0.3333333, 0, 1, 1,
0.6009398, -0.1932582, 0.01601616, 0.3372549, 0, 1, 1,
0.601893, 0.9133449, 0.7305108, 0.345098, 0, 1, 1,
0.6077058, 1.596325, 0.8196018, 0.3490196, 0, 1, 1,
0.6101218, -0.1533423, 2.963271, 0.3568628, 0, 1, 1,
0.6130476, -0.005786296, 2.300635, 0.3607843, 0, 1, 1,
0.6198153, 0.9957984, -0.3423373, 0.3686275, 0, 1, 1,
0.6227591, 0.3968389, 2.524395, 0.372549, 0, 1, 1,
0.6252109, -1.340948, 1.724581, 0.3803922, 0, 1, 1,
0.6266618, -1.143224, 2.913355, 0.3843137, 0, 1, 1,
0.6281165, -1.346207, 2.81875, 0.3921569, 0, 1, 1,
0.6304792, 0.2415569, 1.027653, 0.3960784, 0, 1, 1,
0.6334456, 0.5116078, 2.684932, 0.4039216, 0, 1, 1,
0.6356079, -0.4556959, 1.735845, 0.4117647, 0, 1, 1,
0.638209, 2.173539, 0.2136557, 0.4156863, 0, 1, 1,
0.6418736, -1.809358, 2.916595, 0.4235294, 0, 1, 1,
0.6451073, 1.097631, 0.1539989, 0.427451, 0, 1, 1,
0.6467344, 1.554219, 0.04382423, 0.4352941, 0, 1, 1,
0.6471008, 0.7591241, -1.698261, 0.4392157, 0, 1, 1,
0.6487758, 0.3667847, 2.16568, 0.4470588, 0, 1, 1,
0.65026, -0.7388046, 3.231868, 0.4509804, 0, 1, 1,
0.6575256, 1.014565, 0.3377227, 0.4588235, 0, 1, 1,
0.6634045, -0.8448532, 2.769058, 0.4627451, 0, 1, 1,
0.6656811, 1.358396, -0.4596552, 0.4705882, 0, 1, 1,
0.6686613, 0.6100138, 0.2406671, 0.4745098, 0, 1, 1,
0.670535, 0.9438499, 1.806461, 0.4823529, 0, 1, 1,
0.6795133, -0.9534186, 2.487671, 0.4862745, 0, 1, 1,
0.6840368, 0.9408641, 1.367961, 0.4941176, 0, 1, 1,
0.6943656, -1.305399, 2.186912, 0.5019608, 0, 1, 1,
0.6943827, 1.193209, 1.163075, 0.5058824, 0, 1, 1,
0.694999, 1.488225, -0.2695807, 0.5137255, 0, 1, 1,
0.6958859, -0.3343678, 1.86931, 0.5176471, 0, 1, 1,
0.6963975, -0.9978787, 3.898144, 0.5254902, 0, 1, 1,
0.6964515, -0.8406659, 3.503441, 0.5294118, 0, 1, 1,
0.7008981, -0.4542194, 2.241098, 0.5372549, 0, 1, 1,
0.7023463, 0.7488727, 0.9438102, 0.5411765, 0, 1, 1,
0.7097666, 1.260594, 0.7197, 0.5490196, 0, 1, 1,
0.7122195, -0.5780326, 1.879943, 0.5529412, 0, 1, 1,
0.7205637, -1.730964, 2.688025, 0.5607843, 0, 1, 1,
0.7206354, -0.07444505, 0.8290212, 0.5647059, 0, 1, 1,
0.7229186, 0.3461473, 1.997227, 0.572549, 0, 1, 1,
0.7266815, -0.5134662, 1.20797, 0.5764706, 0, 1, 1,
0.7299408, -0.08824518, 1.824043, 0.5843138, 0, 1, 1,
0.7309715, 0.03059384, 1.795082, 0.5882353, 0, 1, 1,
0.7317026, -0.01534445, 0.8549529, 0.5960785, 0, 1, 1,
0.7377529, -1.016227, 3.711066, 0.6039216, 0, 1, 1,
0.7431258, -0.6601775, 1.583387, 0.6078432, 0, 1, 1,
0.7633281, -0.3512232, 1.453471, 0.6156863, 0, 1, 1,
0.7650832, 1.122116, 1.017423, 0.6196079, 0, 1, 1,
0.7656866, -0.1307238, 0.5361108, 0.627451, 0, 1, 1,
0.7677711, 0.231632, 0.2838307, 0.6313726, 0, 1, 1,
0.780656, -0.1656359, 1.367608, 0.6392157, 0, 1, 1,
0.7823422, -1.222366, 1.483435, 0.6431373, 0, 1, 1,
0.7842791, 1.028104, 2.557319, 0.6509804, 0, 1, 1,
0.7867634, 0.1061392, 0.1206039, 0.654902, 0, 1, 1,
0.7871178, -0.4104785, 1.990656, 0.6627451, 0, 1, 1,
0.7878959, 0.5806753, 1.333069, 0.6666667, 0, 1, 1,
0.7903184, 0.6689658, -0.06854114, 0.6745098, 0, 1, 1,
0.7990684, -0.4976014, 0.2406129, 0.6784314, 0, 1, 1,
0.8007326, -0.2983911, 1.786171, 0.6862745, 0, 1, 1,
0.8008566, -0.8415059, 2.45143, 0.6901961, 0, 1, 1,
0.8016943, 1.025567, -0.1453229, 0.6980392, 0, 1, 1,
0.8021137, 0.6040453, 0.4761813, 0.7058824, 0, 1, 1,
0.8062478, 0.3221612, 1.810827, 0.7098039, 0, 1, 1,
0.8074621, -0.9026798, 1.226194, 0.7176471, 0, 1, 1,
0.809249, 0.2867363, 2.1657, 0.7215686, 0, 1, 1,
0.8139994, 0.2685045, 2.628375, 0.7294118, 0, 1, 1,
0.8154291, 1.023982, 0.7323321, 0.7333333, 0, 1, 1,
0.8167062, 0.7159107, 0.3301204, 0.7411765, 0, 1, 1,
0.8203298, 1.298515, -0.8694488, 0.7450981, 0, 1, 1,
0.8204679, 1.039108, -1.266025, 0.7529412, 0, 1, 1,
0.8231379, -1.71903, 0.8797292, 0.7568628, 0, 1, 1,
0.8248366, 0.6782085, 0.9413188, 0.7647059, 0, 1, 1,
0.8257424, -0.9328053, 3.643345, 0.7686275, 0, 1, 1,
0.8264498, -0.8152937, 2.89596, 0.7764706, 0, 1, 1,
0.8274177, 0.5097404, 2.343533, 0.7803922, 0, 1, 1,
0.8338712, -0.08309535, 1.527104, 0.7882353, 0, 1, 1,
0.8363759, 0.6955996, -0.228599, 0.7921569, 0, 1, 1,
0.8384463, 0.6415513, 2.119757, 0.8, 0, 1, 1,
0.8444537, 0.2730143, 3.10642, 0.8078431, 0, 1, 1,
0.8450198, -0.7228442, 3.239507, 0.8117647, 0, 1, 1,
0.8482251, 1.039288, -0.05524336, 0.8196079, 0, 1, 1,
0.8514361, 0.5901331, 0.5129027, 0.8235294, 0, 1, 1,
0.862385, -0.2615424, 3.523107, 0.8313726, 0, 1, 1,
0.8701095, -0.124434, 1.33511, 0.8352941, 0, 1, 1,
0.8710492, 0.9333968, -0.5446917, 0.8431373, 0, 1, 1,
0.872741, -0.8353927, 1.364196, 0.8470588, 0, 1, 1,
0.8763913, -1.832573, 2.631783, 0.854902, 0, 1, 1,
0.8777692, 1.022403, 0.4561176, 0.8588235, 0, 1, 1,
0.8811589, 0.5910475, 0.1486425, 0.8666667, 0, 1, 1,
0.8849583, -1.093776, 1.987631, 0.8705882, 0, 1, 1,
0.8865023, 0.9698079, -0.6552702, 0.8784314, 0, 1, 1,
0.8870585, 0.8032258, 2.05584, 0.8823529, 0, 1, 1,
0.8874537, -1.372684, 3.429413, 0.8901961, 0, 1, 1,
0.8954852, 0.2217197, 3.925895, 0.8941177, 0, 1, 1,
0.8960824, -1.312833, 4.40534, 0.9019608, 0, 1, 1,
0.8963693, 0.3321673, 2.433447, 0.9098039, 0, 1, 1,
0.8978704, -0.8268322, 2.713276, 0.9137255, 0, 1, 1,
0.9071334, -1.176335, 2.667123, 0.9215686, 0, 1, 1,
0.9092681, 1.356213, -2.09051, 0.9254902, 0, 1, 1,
0.9108796, -0.3122482, 2.57866, 0.9333333, 0, 1, 1,
0.9112527, 0.7251114, 0.2944063, 0.9372549, 0, 1, 1,
0.9184395, -0.03524966, 0.8125693, 0.945098, 0, 1, 1,
0.9234257, -0.88196, 1.774226, 0.9490196, 0, 1, 1,
0.9264123, -0.1229571, 1.61577, 0.9568627, 0, 1, 1,
0.9274353, -0.05240693, 1.104979, 0.9607843, 0, 1, 1,
0.9278068, 0.3139597, 0.6582792, 0.9686275, 0, 1, 1,
0.9278486, -1.137584, 1.885287, 0.972549, 0, 1, 1,
0.943085, -2.181115, 4.499247, 0.9803922, 0, 1, 1,
0.9485959, 0.144476, 1.289274, 0.9843137, 0, 1, 1,
0.948649, -0.06167963, 1.273583, 0.9921569, 0, 1, 1,
0.9491581, 0.09731618, 0.7468374, 0.9960784, 0, 1, 1,
0.9518169, 1.136535, 0.7852948, 1, 0, 0.9960784, 1,
0.9565447, 0.06532953, 2.308795, 1, 0, 0.9882353, 1,
0.9602252, 1.087883, 0.5551659, 1, 0, 0.9843137, 1,
0.9651211, 0.03200604, 1.808906, 1, 0, 0.9764706, 1,
0.96901, -1.704746, 2.495144, 1, 0, 0.972549, 1,
0.9711242, -0.6948381, 0.001757669, 1, 0, 0.9647059, 1,
0.9727176, 0.560076, -0.3290238, 1, 0, 0.9607843, 1,
0.9727426, -0.920632, 0.64371, 1, 0, 0.9529412, 1,
0.9749253, 0.3536063, 1.057333, 1, 0, 0.9490196, 1,
0.9897525, -0.7034827, 1.621852, 1, 0, 0.9411765, 1,
0.9902025, 2.320916, -2.388044, 1, 0, 0.9372549, 1,
0.9921337, -1.41439, 2.006143, 1, 0, 0.9294118, 1,
0.9947823, 0.4909498, 1.228039, 1, 0, 0.9254902, 1,
1.004047, -0.003194803, 0.3713917, 1, 0, 0.9176471, 1,
1.008949, -0.04160786, 0.3054416, 1, 0, 0.9137255, 1,
1.009594, -0.4613327, 3.154682, 1, 0, 0.9058824, 1,
1.011554, -0.3848462, 1.545129, 1, 0, 0.9019608, 1,
1.017201, -0.4489219, 1.313539, 1, 0, 0.8941177, 1,
1.028125, 1.220197, 0.2906022, 1, 0, 0.8862745, 1,
1.035807, 0.5398421, 0.4641994, 1, 0, 0.8823529, 1,
1.050768, 0.875779, 1.476187, 1, 0, 0.8745098, 1,
1.053229, -0.6212966, 3.875527, 1, 0, 0.8705882, 1,
1.054557, 0.2675478, 0.5509838, 1, 0, 0.8627451, 1,
1.055352, -0.002280584, 3.834696, 1, 0, 0.8588235, 1,
1.056765, -1.324092, 2.452612, 1, 0, 0.8509804, 1,
1.06576, -0.1372852, 2.569671, 1, 0, 0.8470588, 1,
1.068194, 0.4030504, 2.04274, 1, 0, 0.8392157, 1,
1.069408, -0.9056729, 2.246176, 1, 0, 0.8352941, 1,
1.077902, -0.4258954, 1.550061, 1, 0, 0.827451, 1,
1.084141, -2.54807, 2.579987, 1, 0, 0.8235294, 1,
1.085831, -0.05939784, 1.663523, 1, 0, 0.8156863, 1,
1.088933, -0.9907414, 2.173245, 1, 0, 0.8117647, 1,
1.089454, -0.7438916, 2.856392, 1, 0, 0.8039216, 1,
1.095055, -1.08803, 3.590333, 1, 0, 0.7960784, 1,
1.097561, -0.06263426, 1.149548, 1, 0, 0.7921569, 1,
1.10837, -0.4365987, 2.009787, 1, 0, 0.7843137, 1,
1.118024, 0.183936, 3.015826, 1, 0, 0.7803922, 1,
1.119472, 1.316337, 0.4794384, 1, 0, 0.772549, 1,
1.1201, -0.1648098, 1.36579, 1, 0, 0.7686275, 1,
1.123378, -1.352826, 3.416687, 1, 0, 0.7607843, 1,
1.123461, 0.2001327, 3.335771, 1, 0, 0.7568628, 1,
1.13019, 1.365083, 0.478765, 1, 0, 0.7490196, 1,
1.144054, -0.3161802, 1.721204, 1, 0, 0.7450981, 1,
1.147046, -1.366516, 1.262674, 1, 0, 0.7372549, 1,
1.157711, -0.9961894, 3.114302, 1, 0, 0.7333333, 1,
1.161489, -1.121661, 2.598785, 1, 0, 0.7254902, 1,
1.162322, 0.1602916, 2.005886, 1, 0, 0.7215686, 1,
1.162738, -0.3234823, 0.5376812, 1, 0, 0.7137255, 1,
1.16283, 0.08299019, 1.155595, 1, 0, 0.7098039, 1,
1.174124, 0.8762702, 2.423928, 1, 0, 0.7019608, 1,
1.174389, 0.9589923, 1.168654, 1, 0, 0.6941177, 1,
1.17452, -0.2927248, 0.6665567, 1, 0, 0.6901961, 1,
1.19035, -1.20336, 0.917921, 1, 0, 0.682353, 1,
1.206102, 0.8136039, -0.9437387, 1, 0, 0.6784314, 1,
1.210813, -0.2737531, 1.268014, 1, 0, 0.6705883, 1,
1.212085, -1.540139, 2.345495, 1, 0, 0.6666667, 1,
1.214019, -0.617569, 2.424193, 1, 0, 0.6588235, 1,
1.239688, -0.06284953, 2.164114, 1, 0, 0.654902, 1,
1.248909, -1.520543, 3.730769, 1, 0, 0.6470588, 1,
1.248935, 0.2021497, 1.136746, 1, 0, 0.6431373, 1,
1.249787, -0.31676, -0.1229376, 1, 0, 0.6352941, 1,
1.252896, -1.49069, 2.204606, 1, 0, 0.6313726, 1,
1.256659, 0.319661, 1.847259, 1, 0, 0.6235294, 1,
1.258619, 0.1587223, 1.540213, 1, 0, 0.6196079, 1,
1.2654, 0.3358493, 0.3221086, 1, 0, 0.6117647, 1,
1.265608, -1.560325, 3.045847, 1, 0, 0.6078432, 1,
1.265986, -0.9213533, 1.09584, 1, 0, 0.6, 1,
1.273163, -0.2488094, 0.9534644, 1, 0, 0.5921569, 1,
1.274201, 1.027034, 1.214748, 1, 0, 0.5882353, 1,
1.285175, -0.6213021, 3.124201, 1, 0, 0.5803922, 1,
1.290632, 0.7760822, 0.764744, 1, 0, 0.5764706, 1,
1.298676, 0.1881614, -0.2013762, 1, 0, 0.5686275, 1,
1.300569, 0.6530968, -1.163878, 1, 0, 0.5647059, 1,
1.326281, -0.5077534, 1.936442, 1, 0, 0.5568628, 1,
1.333211, -1.402399, 1.332401, 1, 0, 0.5529412, 1,
1.337491, 1.497441, 0.3027001, 1, 0, 0.5450981, 1,
1.34207, -1.065595, 1.375683, 1, 0, 0.5411765, 1,
1.343683, -0.7979323, 1.196051, 1, 0, 0.5333334, 1,
1.348768, -1.161629, 2.177621, 1, 0, 0.5294118, 1,
1.35011, -1.096849, 1.667313, 1, 0, 0.5215687, 1,
1.365557, 1.045012, 1.015611, 1, 0, 0.5176471, 1,
1.385371, -0.405974, 2.09399, 1, 0, 0.509804, 1,
1.385739, -0.9481722, 4.282275, 1, 0, 0.5058824, 1,
1.390836, -0.02055302, 2.070449, 1, 0, 0.4980392, 1,
1.404664, -0.1834185, 2.085672, 1, 0, 0.4901961, 1,
1.411996, 0.4698746, 4.104115, 1, 0, 0.4862745, 1,
1.415903, -0.3862313, 3.944159, 1, 0, 0.4784314, 1,
1.418573, -1.385516, 1.185698, 1, 0, 0.4745098, 1,
1.420626, -0.01069886, 0.331164, 1, 0, 0.4666667, 1,
1.426162, 2.415312, 1.897497, 1, 0, 0.4627451, 1,
1.43018, -0.4292479, 2.284688, 1, 0, 0.454902, 1,
1.433957, -0.3818865, 3.651362, 1, 0, 0.4509804, 1,
1.442993, -0.5847259, -0.1326686, 1, 0, 0.4431373, 1,
1.44405, 0.446212, -0.1453677, 1, 0, 0.4392157, 1,
1.448394, -1.841341, 0.7223331, 1, 0, 0.4313726, 1,
1.45411, -0.5791669, 3.377401, 1, 0, 0.427451, 1,
1.456043, -0.4829627, 0.38214, 1, 0, 0.4196078, 1,
1.460507, -0.1877802, 1.996847, 1, 0, 0.4156863, 1,
1.472651, -0.112112, 0.27133, 1, 0, 0.4078431, 1,
1.478848, 0.6427661, 0.4330285, 1, 0, 0.4039216, 1,
1.491384, 0.6638122, 0.7966861, 1, 0, 0.3960784, 1,
1.493936, -0.7767558, 0.5959819, 1, 0, 0.3882353, 1,
1.494394, 0.4546796, 1.72009, 1, 0, 0.3843137, 1,
1.519274, -0.9103447, 2.694067, 1, 0, 0.3764706, 1,
1.538625, 0.008412393, 1.964728, 1, 0, 0.372549, 1,
1.55454, -0.5433581, 2.200135, 1, 0, 0.3647059, 1,
1.567059, 0.6427454, -1.150869, 1, 0, 0.3607843, 1,
1.581749, -0.4890292, 1.404611, 1, 0, 0.3529412, 1,
1.582197, 0.7209832, 1.850839, 1, 0, 0.3490196, 1,
1.629025, 0.6269414, 0.8811629, 1, 0, 0.3411765, 1,
1.632043, -1.130976, 2.56098, 1, 0, 0.3372549, 1,
1.644485, -0.9622444, 1.510622, 1, 0, 0.3294118, 1,
1.652836, -0.8595853, 2.727055, 1, 0, 0.3254902, 1,
1.654025, 0.229166, -0.3063527, 1, 0, 0.3176471, 1,
1.655444, 0.678077, 0.07614041, 1, 0, 0.3137255, 1,
1.657194, -0.778118, 1.232961, 1, 0, 0.3058824, 1,
1.661186, 0.861084, 0.8574206, 1, 0, 0.2980392, 1,
1.677552, 0.06237167, 3.035229, 1, 0, 0.2941177, 1,
1.6848, 0.03790759, 1.942707, 1, 0, 0.2862745, 1,
1.685881, -0.4062861, 2.352686, 1, 0, 0.282353, 1,
1.687155, -0.1838072, 2.005303, 1, 0, 0.2745098, 1,
1.688432, 0.7908954, 0.3655291, 1, 0, 0.2705882, 1,
1.713582, 0.3684056, 1.310049, 1, 0, 0.2627451, 1,
1.71964, 1.912304, 2.588373, 1, 0, 0.2588235, 1,
1.722711, 0.2707403, 0.7313715, 1, 0, 0.2509804, 1,
1.724597, -0.1976402, 1.19462, 1, 0, 0.2470588, 1,
1.727593, -0.1880244, 2.252677, 1, 0, 0.2392157, 1,
1.737034, 0.2866236, -0.2356653, 1, 0, 0.2352941, 1,
1.74014, 0.8179243, 3.11147, 1, 0, 0.227451, 1,
1.746757, 1.381805, -0.02013716, 1, 0, 0.2235294, 1,
1.749679, -0.8293779, 1.456792, 1, 0, 0.2156863, 1,
1.750315, 0.7020911, -0.1865455, 1, 0, 0.2117647, 1,
1.756917, 0.5037067, -0.2022159, 1, 0, 0.2039216, 1,
1.810009, 0.2593624, 3.068948, 1, 0, 0.1960784, 1,
1.818007, 2.00957, 1.355525, 1, 0, 0.1921569, 1,
1.819151, 0.09580438, 1.4778, 1, 0, 0.1843137, 1,
1.820383, 1.684253, 2.317726, 1, 0, 0.1803922, 1,
1.820764, 0.1061285, 2.302182, 1, 0, 0.172549, 1,
1.824271, 0.3221637, -0.3572896, 1, 0, 0.1686275, 1,
1.846983, 0.7058938, 1.437685, 1, 0, 0.1607843, 1,
1.877447, 0.9770396, -0.6366571, 1, 0, 0.1568628, 1,
1.90835, 1.049629, 1.479469, 1, 0, 0.1490196, 1,
1.943055, -1.596796, 1.237963, 1, 0, 0.145098, 1,
1.958199, -0.2632504, 0.9837763, 1, 0, 0.1372549, 1,
1.960178, -1.214323, 0.7947899, 1, 0, 0.1333333, 1,
1.961393, 0.1783044, 2.350531, 1, 0, 0.1254902, 1,
1.96399, 1.702437, 1.104635, 1, 0, 0.1215686, 1,
2.00027, 0.1655236, 0.301724, 1, 0, 0.1137255, 1,
2.008921, -0.7989912, 2.047103, 1, 0, 0.1098039, 1,
2.025037, -0.4249122, 1.095833, 1, 0, 0.1019608, 1,
2.043082, 1.471683, 1.446955, 1, 0, 0.09411765, 1,
2.065255, 0.3602707, 1.964811, 1, 0, 0.09019608, 1,
2.069613, 0.2671843, 0.9981015, 1, 0, 0.08235294, 1,
2.104522, -0.03432243, 1.337238, 1, 0, 0.07843138, 1,
2.177228, -2.09799, 1.64337, 1, 0, 0.07058824, 1,
2.18065, -0.8823649, 1.625975, 1, 0, 0.06666667, 1,
2.203892, -1.501325, 1.128373, 1, 0, 0.05882353, 1,
2.333553, -0.8466317, 0.06121529, 1, 0, 0.05490196, 1,
2.37161, -0.2182271, 1.363674, 1, 0, 0.04705882, 1,
2.393415, 0.337045, 0.5258592, 1, 0, 0.04313726, 1,
2.466094, -0.7289841, 1.619753, 1, 0, 0.03529412, 1,
2.470371, 1.056659, 1.983237, 1, 0, 0.03137255, 1,
2.5243, -1.100192, 2.28327, 1, 0, 0.02352941, 1,
2.601062, -0.6033153, 1.962048, 1, 0, 0.01960784, 1,
2.704128, -0.549546, 2.357452, 1, 0, 0.01176471, 1,
2.732907, -1.330794, 0.8931482, 1, 0, 0.007843138, 1
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
-0.2941688, -4.254158, -7.108679, 0, -0.5, 0.5, 0.5,
-0.2941688, -4.254158, -7.108679, 1, -0.5, 0.5, 0.5,
-0.2941688, -4.254158, -7.108679, 1, 1.5, 0.5, 0.5,
-0.2941688, -4.254158, -7.108679, 0, 1.5, 0.5, 0.5
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
-4.347424, -0.2787561, -7.108679, 0, -0.5, 0.5, 0.5,
-4.347424, -0.2787561, -7.108679, 1, -0.5, 0.5, 0.5,
-4.347424, -0.2787561, -7.108679, 1, 1.5, 0.5, 0.5,
-4.347424, -0.2787561, -7.108679, 0, 1.5, 0.5, 0.5
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
-4.347424, -4.254158, 0.4302547, 0, -0.5, 0.5, 0.5,
-4.347424, -4.254158, 0.4302547, 1, -0.5, 0.5, 0.5,
-4.347424, -4.254158, 0.4302547, 1, 1.5, 0.5, 0.5,
-4.347424, -4.254158, 0.4302547, 0, 1.5, 0.5, 0.5
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
-3, -3.336757, -5.368925,
2, -3.336757, -5.368925,
-3, -3.336757, -5.368925,
-3, -3.489657, -5.658884,
-2, -3.336757, -5.368925,
-2, -3.489657, -5.658884,
-1, -3.336757, -5.368925,
-1, -3.489657, -5.658884,
0, -3.336757, -5.368925,
0, -3.489657, -5.658884,
1, -3.336757, -5.368925,
1, -3.489657, -5.658884,
2, -3.336757, -5.368925,
2, -3.489657, -5.658884
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
-3, -3.795457, -6.238802, 0, -0.5, 0.5, 0.5,
-3, -3.795457, -6.238802, 1, -0.5, 0.5, 0.5,
-3, -3.795457, -6.238802, 1, 1.5, 0.5, 0.5,
-3, -3.795457, -6.238802, 0, 1.5, 0.5, 0.5,
-2, -3.795457, -6.238802, 0, -0.5, 0.5, 0.5,
-2, -3.795457, -6.238802, 1, -0.5, 0.5, 0.5,
-2, -3.795457, -6.238802, 1, 1.5, 0.5, 0.5,
-2, -3.795457, -6.238802, 0, 1.5, 0.5, 0.5,
-1, -3.795457, -6.238802, 0, -0.5, 0.5, 0.5,
-1, -3.795457, -6.238802, 1, -0.5, 0.5, 0.5,
-1, -3.795457, -6.238802, 1, 1.5, 0.5, 0.5,
-1, -3.795457, -6.238802, 0, 1.5, 0.5, 0.5,
0, -3.795457, -6.238802, 0, -0.5, 0.5, 0.5,
0, -3.795457, -6.238802, 1, -0.5, 0.5, 0.5,
0, -3.795457, -6.238802, 1, 1.5, 0.5, 0.5,
0, -3.795457, -6.238802, 0, 1.5, 0.5, 0.5,
1, -3.795457, -6.238802, 0, -0.5, 0.5, 0.5,
1, -3.795457, -6.238802, 1, -0.5, 0.5, 0.5,
1, -3.795457, -6.238802, 1, 1.5, 0.5, 0.5,
1, -3.795457, -6.238802, 0, 1.5, 0.5, 0.5,
2, -3.795457, -6.238802, 0, -0.5, 0.5, 0.5,
2, -3.795457, -6.238802, 1, -0.5, 0.5, 0.5,
2, -3.795457, -6.238802, 1, 1.5, 0.5, 0.5,
2, -3.795457, -6.238802, 0, 1.5, 0.5, 0.5
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
-3.412057, -3, -5.368925,
-3.412057, 2, -5.368925,
-3.412057, -3, -5.368925,
-3.567952, -3, -5.658884,
-3.412057, -2, -5.368925,
-3.567952, -2, -5.658884,
-3.412057, -1, -5.368925,
-3.567952, -1, -5.658884,
-3.412057, 0, -5.368925,
-3.567952, 0, -5.658884,
-3.412057, 1, -5.368925,
-3.567952, 1, -5.658884,
-3.412057, 2, -5.368925,
-3.567952, 2, -5.658884
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
-3.87974, -3, -6.238802, 0, -0.5, 0.5, 0.5,
-3.87974, -3, -6.238802, 1, -0.5, 0.5, 0.5,
-3.87974, -3, -6.238802, 1, 1.5, 0.5, 0.5,
-3.87974, -3, -6.238802, 0, 1.5, 0.5, 0.5,
-3.87974, -2, -6.238802, 0, -0.5, 0.5, 0.5,
-3.87974, -2, -6.238802, 1, -0.5, 0.5, 0.5,
-3.87974, -2, -6.238802, 1, 1.5, 0.5, 0.5,
-3.87974, -2, -6.238802, 0, 1.5, 0.5, 0.5,
-3.87974, -1, -6.238802, 0, -0.5, 0.5, 0.5,
-3.87974, -1, -6.238802, 1, -0.5, 0.5, 0.5,
-3.87974, -1, -6.238802, 1, 1.5, 0.5, 0.5,
-3.87974, -1, -6.238802, 0, 1.5, 0.5, 0.5,
-3.87974, 0, -6.238802, 0, -0.5, 0.5, 0.5,
-3.87974, 0, -6.238802, 1, -0.5, 0.5, 0.5,
-3.87974, 0, -6.238802, 1, 1.5, 0.5, 0.5,
-3.87974, 0, -6.238802, 0, 1.5, 0.5, 0.5,
-3.87974, 1, -6.238802, 0, -0.5, 0.5, 0.5,
-3.87974, 1, -6.238802, 1, -0.5, 0.5, 0.5,
-3.87974, 1, -6.238802, 1, 1.5, 0.5, 0.5,
-3.87974, 1, -6.238802, 0, 1.5, 0.5, 0.5,
-3.87974, 2, -6.238802, 0, -0.5, 0.5, 0.5,
-3.87974, 2, -6.238802, 1, -0.5, 0.5, 0.5,
-3.87974, 2, -6.238802, 1, 1.5, 0.5, 0.5,
-3.87974, 2, -6.238802, 0, 1.5, 0.5, 0.5
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
-3.412057, -3.336757, -4,
-3.412057, -3.336757, 6,
-3.412057, -3.336757, -4,
-3.567952, -3.489657, -4,
-3.412057, -3.336757, -2,
-3.567952, -3.489657, -2,
-3.412057, -3.336757, 0,
-3.567952, -3.489657, 0,
-3.412057, -3.336757, 2,
-3.567952, -3.489657, 2,
-3.412057, -3.336757, 4,
-3.567952, -3.489657, 4,
-3.412057, -3.336757, 6,
-3.567952, -3.489657, 6
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
-3.87974, -3.795457, -4, 0, -0.5, 0.5, 0.5,
-3.87974, -3.795457, -4, 1, -0.5, 0.5, 0.5,
-3.87974, -3.795457, -4, 1, 1.5, 0.5, 0.5,
-3.87974, -3.795457, -4, 0, 1.5, 0.5, 0.5,
-3.87974, -3.795457, -2, 0, -0.5, 0.5, 0.5,
-3.87974, -3.795457, -2, 1, -0.5, 0.5, 0.5,
-3.87974, -3.795457, -2, 1, 1.5, 0.5, 0.5,
-3.87974, -3.795457, -2, 0, 1.5, 0.5, 0.5,
-3.87974, -3.795457, 0, 0, -0.5, 0.5, 0.5,
-3.87974, -3.795457, 0, 1, -0.5, 0.5, 0.5,
-3.87974, -3.795457, 0, 1, 1.5, 0.5, 0.5,
-3.87974, -3.795457, 0, 0, 1.5, 0.5, 0.5,
-3.87974, -3.795457, 2, 0, -0.5, 0.5, 0.5,
-3.87974, -3.795457, 2, 1, -0.5, 0.5, 0.5,
-3.87974, -3.795457, 2, 1, 1.5, 0.5, 0.5,
-3.87974, -3.795457, 2, 0, 1.5, 0.5, 0.5,
-3.87974, -3.795457, 4, 0, -0.5, 0.5, 0.5,
-3.87974, -3.795457, 4, 1, -0.5, 0.5, 0.5,
-3.87974, -3.795457, 4, 1, 1.5, 0.5, 0.5,
-3.87974, -3.795457, 4, 0, 1.5, 0.5, 0.5,
-3.87974, -3.795457, 6, 0, -0.5, 0.5, 0.5,
-3.87974, -3.795457, 6, 1, -0.5, 0.5, 0.5,
-3.87974, -3.795457, 6, 1, 1.5, 0.5, 0.5,
-3.87974, -3.795457, 6, 0, 1.5, 0.5, 0.5
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
-3.412057, -3.336757, -5.368925,
-3.412057, 2.779245, -5.368925,
-3.412057, -3.336757, 6.229434,
-3.412057, 2.779245, 6.229434,
-3.412057, -3.336757, -5.368925,
-3.412057, -3.336757, 6.229434,
-3.412057, 2.779245, -5.368925,
-3.412057, 2.779245, 6.229434,
-3.412057, -3.336757, -5.368925,
2.82372, -3.336757, -5.368925,
-3.412057, -3.336757, 6.229434,
2.82372, -3.336757, 6.229434,
-3.412057, 2.779245, -5.368925,
2.82372, 2.779245, -5.368925,
-3.412057, 2.779245, 6.229434,
2.82372, 2.779245, 6.229434,
2.82372, -3.336757, -5.368925,
2.82372, 2.779245, -5.368925,
2.82372, -3.336757, 6.229434,
2.82372, 2.779245, 6.229434,
2.82372, -3.336757, -5.368925,
2.82372, -3.336757, 6.229434,
2.82372, 2.779245, -5.368925,
2.82372, 2.779245, 6.229434
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
var radius = 7.753066;
var distance = 34.49427;
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
mvMatrix.translate( 0.2941688, 0.2787561, -0.4302547 );
mvMatrix.scale( 1.344302, 1.370628, 0.7227545 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.49427);
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
phosphate<-read.table("phosphate.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-phosphate$V2
```

```
## Error in eval(expr, envir, enclos): object 'phosphate' not found
```

```r
y<-phosphate$V3
```

```
## Error in eval(expr, envir, enclos): object 'phosphate' not found
```

```r
z<-phosphate$V4
```

```
## Error in eval(expr, envir, enclos): object 'phosphate' not found
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
-3.321245, -2.097025, -2.057287, 0, 0, 1, 1, 1,
-2.942845, -0.5093341, -3.28795, 1, 0, 0, 1, 1,
-2.666519, 0.1149436, -2.800956, 1, 0, 0, 1, 1,
-2.619843, -0.562543, -0.0296123, 1, 0, 0, 1, 1,
-2.555561, -0.2561209, -1.837441, 1, 0, 0, 1, 1,
-2.493884, 0.9630373, -1.551552, 1, 0, 0, 1, 1,
-2.450854, 0.9093673, -1.445022, 0, 0, 0, 1, 1,
-2.409418, 0.6961544, 0.4326391, 0, 0, 0, 1, 1,
-2.32929, -1.379767, -1.306383, 0, 0, 0, 1, 1,
-2.26104, 0.2406593, -1.369555, 0, 0, 0, 1, 1,
-2.256749, 1.015076, 0.1131975, 0, 0, 0, 1, 1,
-2.250932, -0.3375789, -0.2276602, 0, 0, 0, 1, 1,
-2.249872, 1.62075, -2.464977, 0, 0, 0, 1, 1,
-2.156052, 1.119036, -3.065344, 1, 1, 1, 1, 1,
-2.087881, -3.06801, -3.006935, 1, 1, 1, 1, 1,
-2.066526, -0.0984281, -1.435401, 1, 1, 1, 1, 1,
-2.060924, -0.2187415, -1.021562, 1, 1, 1, 1, 1,
-2.054533, 0.9042578, -1.308031, 1, 1, 1, 1, 1,
-2.040991, 0.06367154, -1.387613, 1, 1, 1, 1, 1,
-2.03428, 0.1093761, -1.941424, 1, 1, 1, 1, 1,
-2.017629, -1.314932, -2.957639, 1, 1, 1, 1, 1,
-2.016226, 0.2422199, -1.282507, 1, 1, 1, 1, 1,
-2.012614, -0.2589838, -1.586928, 1, 1, 1, 1, 1,
-1.981744, -0.4693313, -3.085472, 1, 1, 1, 1, 1,
-1.976056, -0.1539278, -1.948348, 1, 1, 1, 1, 1,
-1.966881, -0.00268566, -1.772278, 1, 1, 1, 1, 1,
-1.947633, -0.3851229, -2.325786, 1, 1, 1, 1, 1,
-1.929428, -0.490592, -2.374509, 1, 1, 1, 1, 1,
-1.920702, 0.4900761, -3.01552, 0, 0, 1, 1, 1,
-1.910002, 0.7424267, -2.99937, 1, 0, 0, 1, 1,
-1.906316, -1.14415, -0.621671, 1, 0, 0, 1, 1,
-1.884444, -1.637942, -1.662975, 1, 0, 0, 1, 1,
-1.875931, 0.07956903, -3.872956, 1, 0, 0, 1, 1,
-1.857865, 0.7657521, -2.05434, 1, 0, 0, 1, 1,
-1.82052, 0.8969274, -0.9282274, 0, 0, 0, 1, 1,
-1.796115, -1.354932, -4.015936, 0, 0, 0, 1, 1,
-1.785628, -0.3973215, -1.700549, 0, 0, 0, 1, 1,
-1.765005, -0.9916091, -1.970433, 0, 0, 0, 1, 1,
-1.742265, 0.3117591, -4.276452, 0, 0, 0, 1, 1,
-1.727245, 0.07226089, -1.285305, 0, 0, 0, 1, 1,
-1.711558, 1.575865, -0.08237272, 0, 0, 0, 1, 1,
-1.684329, 0.1802094, -1.045509, 1, 1, 1, 1, 1,
-1.676745, -1.425489, -1.681855, 1, 1, 1, 1, 1,
-1.663588, 1.445319, -0.690773, 1, 1, 1, 1, 1,
-1.653821, 0.6951726, -3.007949, 1, 1, 1, 1, 1,
-1.650014, 0.2464902, -3.176684, 1, 1, 1, 1, 1,
-1.64391, 0.5257176, -2.609523, 1, 1, 1, 1, 1,
-1.615721, 0.6438142, -1.156615, 1, 1, 1, 1, 1,
-1.60452, -1.647581, -2.340633, 1, 1, 1, 1, 1,
-1.599451, -1.674067, -1.698725, 1, 1, 1, 1, 1,
-1.599445, -0.1301717, -2.336475, 1, 1, 1, 1, 1,
-1.592427, -1.189916, -1.725786, 1, 1, 1, 1, 1,
-1.590432, -0.9169421, -0.8266308, 1, 1, 1, 1, 1,
-1.568469, -0.6049677, -2.095771, 1, 1, 1, 1, 1,
-1.56721, -0.5870789, -2.332875, 1, 1, 1, 1, 1,
-1.566804, -1.221613, -1.435476, 1, 1, 1, 1, 1,
-1.566238, 0.4665598, -2.647945, 0, 0, 1, 1, 1,
-1.562091, -1.539512, -3.668832, 1, 0, 0, 1, 1,
-1.54653, -0.1388596, -1.860186, 1, 0, 0, 1, 1,
-1.537631, 0.2519741, -0.854807, 1, 0, 0, 1, 1,
-1.536505, -1.817203, -1.760839, 1, 0, 0, 1, 1,
-1.530772, 0.7506725, -0.7554871, 1, 0, 0, 1, 1,
-1.52077, -0.881682, -2.943309, 0, 0, 0, 1, 1,
-1.482646, 1.864988, -2.23885, 0, 0, 0, 1, 1,
-1.471327, 1.058611, -1.547519, 0, 0, 0, 1, 1,
-1.465806, -2.444998, -3.778123, 0, 0, 0, 1, 1,
-1.454112, 0.7163924, -2.227916, 0, 0, 0, 1, 1,
-1.451857, -0.4806873, -3.373089, 0, 0, 0, 1, 1,
-1.426178, 0.1267337, -0.3153699, 0, 0, 0, 1, 1,
-1.420404, -0.347843, -1.857483, 1, 1, 1, 1, 1,
-1.41581, -0.8382722, -1.457259, 1, 1, 1, 1, 1,
-1.415198, -1.998084, -3.181922, 1, 1, 1, 1, 1,
-1.410276, -0.08637023, -0.4410186, 1, 1, 1, 1, 1,
-1.408116, 0.7130737, -1.444248, 1, 1, 1, 1, 1,
-1.39917, -1.605508, -3.713115, 1, 1, 1, 1, 1,
-1.381643, -1.576555, -2.037501, 1, 1, 1, 1, 1,
-1.371924, -1.14897, -4.517057, 1, 1, 1, 1, 1,
-1.366012, -1.934345, -3.627719, 1, 1, 1, 1, 1,
-1.364035, 1.181133, -0.5052964, 1, 1, 1, 1, 1,
-1.360169, 0.3674837, -0.2137019, 1, 1, 1, 1, 1,
-1.359618, -1.87588, -4.413404, 1, 1, 1, 1, 1,
-1.359102, -1.497017, -2.614384, 1, 1, 1, 1, 1,
-1.354239, -0.685404, -1.723148, 1, 1, 1, 1, 1,
-1.35357, -2.003089, -1.773922, 1, 1, 1, 1, 1,
-1.338743, -0.6240758, -1.778234, 0, 0, 1, 1, 1,
-1.332895, -0.708738, -3.569994, 1, 0, 0, 1, 1,
-1.332138, -1.041992, -0.7328571, 1, 0, 0, 1, 1,
-1.331068, -0.4802321, -0.5008325, 1, 0, 0, 1, 1,
-1.321143, -0.8856023, -1.860177, 1, 0, 0, 1, 1,
-1.318396, -0.2025672, -1.925104, 1, 0, 0, 1, 1,
-1.31023, 0.2522114, -2.980981, 0, 0, 0, 1, 1,
-1.304517, 0.8358218, -4.235787, 0, 0, 0, 1, 1,
-1.288276, -0.2794663, -0.5985423, 0, 0, 0, 1, 1,
-1.263948, 0.6175772, -0.08663112, 0, 0, 0, 1, 1,
-1.263676, -1.031626, -1.786744, 0, 0, 0, 1, 1,
-1.256403, -0.6816756, -1.476796, 0, 0, 0, 1, 1,
-1.255575, -0.1650411, -2.560547, 0, 0, 0, 1, 1,
-1.25474, 0.5440778, -1.538737, 1, 1, 1, 1, 1,
-1.248238, 1.418804, -0.928773, 1, 1, 1, 1, 1,
-1.239267, -0.9789257, -1.731188, 1, 1, 1, 1, 1,
-1.223311, -0.5639186, -3.625659, 1, 1, 1, 1, 1,
-1.216601, 2.080174, -0.5934504, 1, 1, 1, 1, 1,
-1.210726, -0.3972064, -2.41943, 1, 1, 1, 1, 1,
-1.209682, -0.1266496, -1.280816, 1, 1, 1, 1, 1,
-1.197298, -0.6269999, -3.304653, 1, 1, 1, 1, 1,
-1.195084, -2.723361, -1.835068, 1, 1, 1, 1, 1,
-1.193216, -0.8786281, -1.414216, 1, 1, 1, 1, 1,
-1.187642, 1.077515, -1.575937, 1, 1, 1, 1, 1,
-1.187445, -0.1135783, -1.965183, 1, 1, 1, 1, 1,
-1.172652, -0.9487624, -2.206375, 1, 1, 1, 1, 1,
-1.16831, -0.4306684, -2.373797, 1, 1, 1, 1, 1,
-1.16067, 2.171266, -0.1544865, 1, 1, 1, 1, 1,
-1.152125, -1.19302, -3.022507, 0, 0, 1, 1, 1,
-1.151168, 0.7563524, 0.5203466, 1, 0, 0, 1, 1,
-1.149643, -0.7774643, -3.528702, 1, 0, 0, 1, 1,
-1.148527, 0.7122261, 0.2356921, 1, 0, 0, 1, 1,
-1.14774, 0.2886236, -2.820855, 1, 0, 0, 1, 1,
-1.141422, 1.438862, -1.143131, 1, 0, 0, 1, 1,
-1.13984, 0.7654291, -0.8979783, 0, 0, 0, 1, 1,
-1.135195, 1.053411, -2.477029, 0, 0, 0, 1, 1,
-1.128492, 0.3943413, -3.229848, 0, 0, 0, 1, 1,
-1.123107, -0.529664, -3.712285, 0, 0, 0, 1, 1,
-1.122349, 0.8888258, -1.327893, 0, 0, 0, 1, 1,
-1.119947, 0.8929239, 0.09519981, 0, 0, 0, 1, 1,
-1.104797, 0.3557856, -1.412205, 0, 0, 0, 1, 1,
-1.099705, 0.02960748, -0.08750635, 1, 1, 1, 1, 1,
-1.096425, 2.470925, -1.060264, 1, 1, 1, 1, 1,
-1.095672, 0.5411072, -0.587488, 1, 1, 1, 1, 1,
-1.091729, -0.3485616, -1.173433, 1, 1, 1, 1, 1,
-1.08053, -0.1421624, -0.4803223, 1, 1, 1, 1, 1,
-1.072553, 1.340398, -0.6331318, 1, 1, 1, 1, 1,
-1.071648, -0.1693073, -2.174403, 1, 1, 1, 1, 1,
-1.0705, -0.5477566, -1.700847, 1, 1, 1, 1, 1,
-1.069613, -0.3426439, -2.097574, 1, 1, 1, 1, 1,
-1.068182, 0.1606102, -2.44591, 1, 1, 1, 1, 1,
-1.062247, 2.103924, -2.525611, 1, 1, 1, 1, 1,
-1.042489, -1.674889, -2.539991, 1, 1, 1, 1, 1,
-1.03963, 1.18983, -0.6381601, 1, 1, 1, 1, 1,
-1.037721, -1.214896, -4.659215, 1, 1, 1, 1, 1,
-1.025853, -0.3188511, -0.3837528, 1, 1, 1, 1, 1,
-1.01652, -0.4045053, -2.816483, 0, 0, 1, 1, 1,
-1.004017, 0.2503153, -1.071012, 1, 0, 0, 1, 1,
-1.003054, 1.956919, -1.510458, 1, 0, 0, 1, 1,
-0.9970383, 0.3735517, 0.4363109, 1, 0, 0, 1, 1,
-0.9873711, 0.5468975, -0.9652696, 1, 0, 0, 1, 1,
-0.9797869, -0.2237731, -2.004512, 1, 0, 0, 1, 1,
-0.9712007, 0.6318414, -0.8255045, 0, 0, 0, 1, 1,
-0.9620664, 0.8904158, -0.2271731, 0, 0, 0, 1, 1,
-0.9606827, -1.334363, -4.145978, 0, 0, 0, 1, 1,
-0.9594499, 0.1117193, -0.7733507, 0, 0, 0, 1, 1,
-0.9569166, -2.218493, -2.745573, 0, 0, 0, 1, 1,
-0.946332, -1.450213, -2.277289, 0, 0, 0, 1, 1,
-0.9429942, -0.2648695, -1.990749, 0, 0, 0, 1, 1,
-0.9423217, -0.6510883, -2.221308, 1, 1, 1, 1, 1,
-0.9404919, 0.404514, -0.6928359, 1, 1, 1, 1, 1,
-0.9398819, 0.5380117, -0.9728031, 1, 1, 1, 1, 1,
-0.9351489, -1.227138, -2.839873, 1, 1, 1, 1, 1,
-0.9322209, -0.09483062, -0.6483428, 1, 1, 1, 1, 1,
-0.9319538, 0.001323107, -1.686591, 1, 1, 1, 1, 1,
-0.9309975, 0.445553, -0.2443047, 1, 1, 1, 1, 1,
-0.9282995, 0.1576641, -1.519189, 1, 1, 1, 1, 1,
-0.9168131, 0.4403503, 0.859384, 1, 1, 1, 1, 1,
-0.9159171, 0.4661441, -0.3287202, 1, 1, 1, 1, 1,
-0.9018652, 2.611357, -3.387683, 1, 1, 1, 1, 1,
-0.8980943, 1.848212, 1.064558, 1, 1, 1, 1, 1,
-0.8972701, 0.1243031, -1.872392, 1, 1, 1, 1, 1,
-0.8946259, -0.2792013, -2.563661, 1, 1, 1, 1, 1,
-0.892723, 1.541642, -0.8224416, 1, 1, 1, 1, 1,
-0.8881683, 0.2603419, -1.236581, 0, 0, 1, 1, 1,
-0.884497, -0.5313694, -1.849345, 1, 0, 0, 1, 1,
-0.8711976, -0.5117856, -1.922583, 1, 0, 0, 1, 1,
-0.8693864, -0.3284676, -3.330754, 1, 0, 0, 1, 1,
-0.8655464, 0.232183, -0.5986592, 1, 0, 0, 1, 1,
-0.8642864, 0.8832347, -0.02593955, 1, 0, 0, 1, 1,
-0.8602984, -0.6963308, -2.649251, 0, 0, 0, 1, 1,
-0.8602947, 1.090758, -0.7973914, 0, 0, 0, 1, 1,
-0.8361164, 1.158992, 1.3902, 0, 0, 0, 1, 1,
-0.8275519, 1.160763, -3.142492, 0, 0, 0, 1, 1,
-0.827271, 0.263757, 0.08011047, 0, 0, 0, 1, 1,
-0.8256107, 0.653824, -2.60083, 0, 0, 0, 1, 1,
-0.82464, -0.2148548, -0.2650459, 0, 0, 0, 1, 1,
-0.8223752, 1.492612, 0.8393326, 1, 1, 1, 1, 1,
-0.820493, 1.513986, -1.320645, 1, 1, 1, 1, 1,
-0.8165526, -1.484237, -3.654475, 1, 1, 1, 1, 1,
-0.8144581, -0.03114915, -0.7486262, 1, 1, 1, 1, 1,
-0.8133978, -0.2642572, -3.819659, 1, 1, 1, 1, 1,
-0.8130213, 0.3490706, -2.746159, 1, 1, 1, 1, 1,
-0.8110911, 0.9448025, 0.1470882, 1, 1, 1, 1, 1,
-0.8037493, 0.2986657, -1.643789, 1, 1, 1, 1, 1,
-0.7997572, 0.365032, -0.8852431, 1, 1, 1, 1, 1,
-0.7987447, 0.0588627, -1.460497, 1, 1, 1, 1, 1,
-0.782716, -0.3510638, -2.815574, 1, 1, 1, 1, 1,
-0.7782893, -0.204322, -1.072075, 1, 1, 1, 1, 1,
-0.7704353, 0.6731572, -2.252708, 1, 1, 1, 1, 1,
-0.7629132, -1.430027, -1.570925, 1, 1, 1, 1, 1,
-0.7612286, -1.883883, -2.296441, 1, 1, 1, 1, 1,
-0.7570384, -0.1792735, -1.207396, 0, 0, 1, 1, 1,
-0.7558162, 1.424356, -1.685925, 1, 0, 0, 1, 1,
-0.7554894, -0.6655454, -2.793978, 1, 0, 0, 1, 1,
-0.748998, -0.3161579, -0.2069596, 1, 0, 0, 1, 1,
-0.7485757, 0.1577988, -2.538169, 1, 0, 0, 1, 1,
-0.7424505, 0.4462496, -0.6626297, 1, 0, 0, 1, 1,
-0.7353242, 2.591452, -0.6708253, 0, 0, 0, 1, 1,
-0.7335638, -0.1308609, -2.62731, 0, 0, 0, 1, 1,
-0.729611, -1.000954, -1.284064, 0, 0, 0, 1, 1,
-0.7290685, 0.9687179, -1.831453, 0, 0, 0, 1, 1,
-0.7244692, -1.483767, -2.854664, 0, 0, 0, 1, 1,
-0.7235761, -1.708111, -2.323802, 0, 0, 0, 1, 1,
-0.7213022, 2.008231, -2.105161, 0, 0, 0, 1, 1,
-0.7194792, -0.7323974, -3.256429, 1, 1, 1, 1, 1,
-0.71876, -0.1918821, -2.474348, 1, 1, 1, 1, 1,
-0.7154413, -2.034053, -2.889109, 1, 1, 1, 1, 1,
-0.7128646, 0.3074564, -1.156257, 1, 1, 1, 1, 1,
-0.7094817, -0.0779708, -2.331113, 1, 1, 1, 1, 1,
-0.7069153, -1.580766, -3.229139, 1, 1, 1, 1, 1,
-0.7054527, 0.4941222, 0.4026194, 1, 1, 1, 1, 1,
-0.7051536, -0.1411812, -0.9827166, 1, 1, 1, 1, 1,
-0.7047962, 1.517725, 0.2035928, 1, 1, 1, 1, 1,
-0.700611, -0.6601765, -2.269782, 1, 1, 1, 1, 1,
-0.6982705, -0.2357582, -1.461422, 1, 1, 1, 1, 1,
-0.6927621, -2.908832, -3.629749, 1, 1, 1, 1, 1,
-0.6869483, -0.4146296, -1.203297, 1, 1, 1, 1, 1,
-0.6839691, 0.6380554, -1.145081, 1, 1, 1, 1, 1,
-0.6838844, 0.4051083, -0.8371717, 1, 1, 1, 1, 1,
-0.6803488, -1.386275, -4.574123, 0, 0, 1, 1, 1,
-0.6778429, -0.3207696, -1.41334, 1, 0, 0, 1, 1,
-0.6774246, -0.604432, -3.916263, 1, 0, 0, 1, 1,
-0.6760747, 0.3986723, -1.757909, 1, 0, 0, 1, 1,
-0.6753157, -1.169919, -1.377267, 1, 0, 0, 1, 1,
-0.6675282, 2.19173, -1.15574, 1, 0, 0, 1, 1,
-0.6583901, 0.3374902, -0.7442996, 0, 0, 0, 1, 1,
-0.6573336, 1.475978, -2.604661, 0, 0, 0, 1, 1,
-0.6540802, -0.880877, -3.202403, 0, 0, 0, 1, 1,
-0.6464157, -0.5631033, -1.674412, 0, 0, 0, 1, 1,
-0.6463992, 1.708519, -0.1427293, 0, 0, 0, 1, 1,
-0.6415976, -0.80905, -2.598564, 0, 0, 0, 1, 1,
-0.6398034, 0.9852022, 0.5491467, 0, 0, 0, 1, 1,
-0.6316625, 0.2422482, -0.6161377, 1, 1, 1, 1, 1,
-0.6285172, -1.404329, -0.1351001, 1, 1, 1, 1, 1,
-0.6249233, 0.453175, -2.436134, 1, 1, 1, 1, 1,
-0.621672, -3.247689, -3.142861, 1, 1, 1, 1, 1,
-0.6201788, -0.87872, -2.287925, 1, 1, 1, 1, 1,
-0.6170675, -0.6980659, -1.791411, 1, 1, 1, 1, 1,
-0.6168574, -0.4750822, -4.17739, 1, 1, 1, 1, 1,
-0.6141059, 0.9462819, -0.5424803, 1, 1, 1, 1, 1,
-0.6129002, -0.2150808, -1.095737, 1, 1, 1, 1, 1,
-0.6122517, -1.60549, -3.22011, 1, 1, 1, 1, 1,
-0.6075895, -1.852593, -2.80295, 1, 1, 1, 1, 1,
-0.6060578, -0.0003283433, -1.730725, 1, 1, 1, 1, 1,
-0.6047892, -0.03273323, -0.9631175, 1, 1, 1, 1, 1,
-0.6026328, 0.1598801, -2.215081, 1, 1, 1, 1, 1,
-0.6024423, 1.071472, -2.273138, 1, 1, 1, 1, 1,
-0.6012109, 0.4088286, 0.1698149, 0, 0, 1, 1, 1,
-0.6011727, -0.292581, -1.605876, 1, 0, 0, 1, 1,
-0.5976132, 0.980644, -1.807628, 1, 0, 0, 1, 1,
-0.596936, 0.195668, -0.5067257, 1, 0, 0, 1, 1,
-0.5947394, -0.3628395, -1.601154, 1, 0, 0, 1, 1,
-0.5927766, -0.1230852, -1.206736, 1, 0, 0, 1, 1,
-0.588634, -0.4087057, -4.049257, 0, 0, 0, 1, 1,
-0.5848879, -1.155249, -2.481967, 0, 0, 0, 1, 1,
-0.5823871, -1.909822, -5.200017, 0, 0, 0, 1, 1,
-0.578882, 0.617174, -1.039558, 0, 0, 0, 1, 1,
-0.5690942, -0.5442632, -3.672225, 0, 0, 0, 1, 1,
-0.568981, 1.488695, -0.6395634, 0, 0, 0, 1, 1,
-0.5551318, 0.6130883, -2.139743, 0, 0, 0, 1, 1,
-0.5514598, -0.5096328, -4.22486, 1, 1, 1, 1, 1,
-0.5448315, -0.6796935, -2.124225, 1, 1, 1, 1, 1,
-0.5421985, -0.7059383, -3.805315, 1, 1, 1, 1, 1,
-0.5418037, 0.4504089, -0.4217741, 1, 1, 1, 1, 1,
-0.5303348, 1.328634, -0.5334213, 1, 1, 1, 1, 1,
-0.5280566, -0.824139, -2.548223, 1, 1, 1, 1, 1,
-0.5252824, 0.07111259, -1.677641, 1, 1, 1, 1, 1,
-0.5248032, 2.082108, 0.6559662, 1, 1, 1, 1, 1,
-0.5243884, -0.2127449, -0.6023977, 1, 1, 1, 1, 1,
-0.5238823, 0.8359492, -1.4588, 1, 1, 1, 1, 1,
-0.522694, -0.7069245, -2.683021, 1, 1, 1, 1, 1,
-0.5151196, 0.5494331, -0.8044503, 1, 1, 1, 1, 1,
-0.5104567, 1.440545, -0.02163215, 1, 1, 1, 1, 1,
-0.5103905, 0.7276891, -0.2264733, 1, 1, 1, 1, 1,
-0.5100152, -0.3175769, -1.911582, 1, 1, 1, 1, 1,
-0.5091499, 0.1796782, -1.318906, 0, 0, 1, 1, 1,
-0.5033563, -0.6973152, -2.109589, 1, 0, 0, 1, 1,
-0.5017679, -0.2655002, -3.484435, 1, 0, 0, 1, 1,
-0.5015906, -0.9340894, -4.133388, 1, 0, 0, 1, 1,
-0.5004031, 1.163557, 1.563109, 1, 0, 0, 1, 1,
-0.4978398, -0.4361564, -1.887808, 1, 0, 0, 1, 1,
-0.4934413, 0.8036108, -1.697298, 0, 0, 0, 1, 1,
-0.4933162, -0.5406134, -2.573034, 0, 0, 0, 1, 1,
-0.4930931, -1.240725, -3.326351, 0, 0, 0, 1, 1,
-0.4900572, -0.7781918, -2.40675, 0, 0, 0, 1, 1,
-0.4888134, 1.469098, -0.8364246, 0, 0, 0, 1, 1,
-0.4824811, 0.3940091, -1.814309, 0, 0, 0, 1, 1,
-0.4781356, 0.3722112, -2.570126, 0, 0, 0, 1, 1,
-0.4754556, -0.2224991, -1.565342, 1, 1, 1, 1, 1,
-0.4741226, -0.7375208, -3.314272, 1, 1, 1, 1, 1,
-0.472213, -1.713434, -3.283665, 1, 1, 1, 1, 1,
-0.4715502, -2.095773, -3.124449, 1, 1, 1, 1, 1,
-0.4701296, -2.169231, -2.623386, 1, 1, 1, 1, 1,
-0.4700477, 0.2421554, 0.42307, 1, 1, 1, 1, 1,
-0.4696152, -1.362255, -2.154174, 1, 1, 1, 1, 1,
-0.469543, 0.7968194, 1.260229, 1, 1, 1, 1, 1,
-0.469164, 0.03497953, -2.151147, 1, 1, 1, 1, 1,
-0.4688055, 0.5804478, 0.5179862, 1, 1, 1, 1, 1,
-0.4664598, -0.4233303, -1.874802, 1, 1, 1, 1, 1,
-0.4651372, 0.4722038, -1.236818, 1, 1, 1, 1, 1,
-0.4649003, 1.498129, -2.034827, 1, 1, 1, 1, 1,
-0.4626825, 0.3216434, -0.1147726, 1, 1, 1, 1, 1,
-0.4621554, 0.8657159, 0.03047621, 1, 1, 1, 1, 1,
-0.4584971, -1.044163, -2.620502, 0, 0, 1, 1, 1,
-0.4578149, 0.9396459, -0.503929, 1, 0, 0, 1, 1,
-0.4551371, 1.577368, -0.9563426, 1, 0, 0, 1, 1,
-0.4503382, 1.206567, 0.0117515, 1, 0, 0, 1, 1,
-0.4474834, 0.8926298, -0.4357847, 1, 0, 0, 1, 1,
-0.4445269, -1.13739, -2.690871, 1, 0, 0, 1, 1,
-0.4431991, 0.1919495, -1.948198, 0, 0, 0, 1, 1,
-0.4411246, -0.1435883, -1.938652, 0, 0, 0, 1, 1,
-0.4397385, 0.7100676, 1.110095, 0, 0, 0, 1, 1,
-0.4386337, 1.215283, -0.1668107, 0, 0, 0, 1, 1,
-0.4385632, 1.068831, -0.6992164, 0, 0, 0, 1, 1,
-0.4362184, 1.395023, -2.199028, 0, 0, 0, 1, 1,
-0.4350905, 1.621498, -0.8768546, 0, 0, 0, 1, 1,
-0.4347075, -0.6755995, -2.130915, 1, 1, 1, 1, 1,
-0.433224, 0.915041, 1.665423, 1, 1, 1, 1, 1,
-0.4284897, 0.3575853, -1.398649, 1, 1, 1, 1, 1,
-0.4207405, 0.6691974, -0.1865666, 1, 1, 1, 1, 1,
-0.4182827, 1.053879, 0.8916379, 1, 1, 1, 1, 1,
-0.4133517, 0.8119394, 0.1450409, 1, 1, 1, 1, 1,
-0.4119984, -0.5121811, -2.083339, 1, 1, 1, 1, 1,
-0.4047916, -0.7931153, -3.538177, 1, 1, 1, 1, 1,
-0.4015061, 0.7721328, -0.2689748, 1, 1, 1, 1, 1,
-0.3976535, 0.5353671, 0.5190232, 1, 1, 1, 1, 1,
-0.3946046, 2.614105, -0.3114296, 1, 1, 1, 1, 1,
-0.3941987, -0.2192968, -3.05469, 1, 1, 1, 1, 1,
-0.3937902, 1.575416, 0.4690101, 1, 1, 1, 1, 1,
-0.39113, 0.1694158, -3.219619, 1, 1, 1, 1, 1,
-0.3895858, 0.1947273, -2.319338, 1, 1, 1, 1, 1,
-0.3837904, 0.3989482, -0.01339288, 0, 0, 1, 1, 1,
-0.3792485, 0.7915357, -0.1301253, 1, 0, 0, 1, 1,
-0.3757696, -0.2060697, -1.058995, 1, 0, 0, 1, 1,
-0.3731094, 1.124066, 1.70075, 1, 0, 0, 1, 1,
-0.3715773, 0.1407303, -1.206958, 1, 0, 0, 1, 1,
-0.3714649, 0.8275703, 0.8170103, 1, 0, 0, 1, 1,
-0.3640815, 0.1617632, -2.078256, 0, 0, 0, 1, 1,
-0.3622661, 0.7812368, 1.14003, 0, 0, 0, 1, 1,
-0.3610911, 0.1067089, -0.4373342, 0, 0, 0, 1, 1,
-0.3583378, 0.4083541, -1.67148, 0, 0, 0, 1, 1,
-0.358067, -1.990127, -3.41363, 0, 0, 0, 1, 1,
-0.3538542, 0.737618, -2.22828, 0, 0, 0, 1, 1,
-0.352937, -0.2591256, -1.87211, 0, 0, 0, 1, 1,
-0.3442604, 0.8720823, -1.192424, 1, 1, 1, 1, 1,
-0.3417135, 1.469681, 1.512308, 1, 1, 1, 1, 1,
-0.3398814, -0.9574607, -2.001905, 1, 1, 1, 1, 1,
-0.3389753, 1.704434, 0.8802236, 1, 1, 1, 1, 1,
-0.3372695, -0.8589938, -1.403628, 1, 1, 1, 1, 1,
-0.3334897, -0.879293, -1.745351, 1, 1, 1, 1, 1,
-0.3329033, 0.09446952, 0.5073052, 1, 1, 1, 1, 1,
-0.3287464, -0.5652481, -2.685804, 1, 1, 1, 1, 1,
-0.3269094, -2.470352, -1.972652, 1, 1, 1, 1, 1,
-0.3256451, 1.995049, 0.2333337, 1, 1, 1, 1, 1,
-0.324917, 0.9563279, 0.6982027, 1, 1, 1, 1, 1,
-0.3230343, -1.647363, -2.291613, 1, 1, 1, 1, 1,
-0.3195907, 0.6975428, 1.008405, 1, 1, 1, 1, 1,
-0.3177194, -1.10874, -2.914009, 1, 1, 1, 1, 1,
-0.3159361, -0.3332829, -1.447815, 1, 1, 1, 1, 1,
-0.3073036, -0.07902014, -2.037545, 0, 0, 1, 1, 1,
-0.3009081, 0.7357899, -0.2207287, 1, 0, 0, 1, 1,
-0.2984828, 0.5555376, -0.6709449, 1, 0, 0, 1, 1,
-0.2966599, 1.28662, -0.1196114, 1, 0, 0, 1, 1,
-0.2913379, -1.732887, -2.472378, 1, 0, 0, 1, 1,
-0.289539, -0.3685368, -1.67573, 1, 0, 0, 1, 1,
-0.2857243, -0.07235532, -2.475883, 0, 0, 0, 1, 1,
-0.2844542, 0.2595149, -0.9681658, 0, 0, 0, 1, 1,
-0.2834646, 0.4344765, 0.461273, 0, 0, 0, 1, 1,
-0.2826417, -1.102862, -2.403551, 0, 0, 0, 1, 1,
-0.2785282, 0.03642241, 1.359929, 0, 0, 0, 1, 1,
-0.2731651, -1.94411, -2.555329, 0, 0, 0, 1, 1,
-0.2715577, -0.5654178, -1.641702, 0, 0, 0, 1, 1,
-0.270667, -0.3668987, -3.815173, 1, 1, 1, 1, 1,
-0.2676422, -0.8895686, -2.516759, 1, 1, 1, 1, 1,
-0.2664017, 0.06830503, -0.1955857, 1, 1, 1, 1, 1,
-0.2632344, 0.8625261, -0.5357315, 1, 1, 1, 1, 1,
-0.2592394, -0.5256948, -0.3443542, 1, 1, 1, 1, 1,
-0.2580088, -0.6606798, -2.383291, 1, 1, 1, 1, 1,
-0.2549299, 0.6919225, -0.2946321, 1, 1, 1, 1, 1,
-0.2489879, -0.9373322, -2.238671, 1, 1, 1, 1, 1,
-0.2478172, -0.08207165, -1.264022, 1, 1, 1, 1, 1,
-0.246484, -0.8929058, -0.9566947, 1, 1, 1, 1, 1,
-0.2459722, 1.20722, -1.317912, 1, 1, 1, 1, 1,
-0.241675, -1.178456, -2.023008, 1, 1, 1, 1, 1,
-0.2392615, -0.4601329, -2.093036, 1, 1, 1, 1, 1,
-0.2380366, -0.4062288, -2.332423, 1, 1, 1, 1, 1,
-0.2377774, 0.7916375, -1.885898, 1, 1, 1, 1, 1,
-0.2374645, -0.2147245, -1.686174, 0, 0, 1, 1, 1,
-0.2354093, -0.0319831, -2.015465, 1, 0, 0, 1, 1,
-0.2352143, 1.357712, 1.078664, 1, 0, 0, 1, 1,
-0.2343419, -1.422614, -3.360999, 1, 0, 0, 1, 1,
-0.2316159, 0.6215373, 0.2434417, 1, 0, 0, 1, 1,
-0.2296555, -1.752047, -3.040119, 1, 0, 0, 1, 1,
-0.228888, 0.0312667, 0.4717607, 0, 0, 0, 1, 1,
-0.227346, 0.2812673, -0.1538585, 0, 0, 0, 1, 1,
-0.2260613, -0.08936118, -2.319686, 0, 0, 0, 1, 1,
-0.2246541, 1.291609, -0.652571, 0, 0, 0, 1, 1,
-0.2237139, -1.807723, -3.074302, 0, 0, 0, 1, 1,
-0.2123197, 1.11717, -1.099947, 0, 0, 0, 1, 1,
-0.2122566, 0.637574, -0.818602, 0, 0, 0, 1, 1,
-0.2106485, 0.9780277, -0.4614778, 1, 1, 1, 1, 1,
-0.2096858, -1.01171, -2.127108, 1, 1, 1, 1, 1,
-0.2076257, 0.06055288, -2.397113, 1, 1, 1, 1, 1,
-0.2042499, 1.905902, 0.977336, 1, 1, 1, 1, 1,
-0.2037085, -1.220077, -4.625194, 1, 1, 1, 1, 1,
-0.2022424, -0.9827456, -0.5468426, 1, 1, 1, 1, 1,
-0.1998217, 1.210176, -0.6406177, 1, 1, 1, 1, 1,
-0.1985773, 0.3022957, -1.505719, 1, 1, 1, 1, 1,
-0.1962145, -0.760256, -2.625644, 1, 1, 1, 1, 1,
-0.1956202, -0.0822022, -2.013842, 1, 1, 1, 1, 1,
-0.1949995, 2.083627, 0.06568334, 1, 1, 1, 1, 1,
-0.1924405, -2.071276, -4.239008, 1, 1, 1, 1, 1,
-0.1922327, 0.6462015, 1.3882, 1, 1, 1, 1, 1,
-0.1867175, 0.09420992, 1.252924, 1, 1, 1, 1, 1,
-0.183178, -0.05762907, -1.629516, 1, 1, 1, 1, 1,
-0.1818876, 0.9177274, -2.232502, 0, 0, 1, 1, 1,
-0.1794026, 1.703046, 0.4290368, 1, 0, 0, 1, 1,
-0.1787589, -0.02469506, -1.371137, 1, 0, 0, 1, 1,
-0.176931, -1.041091, -2.903849, 1, 0, 0, 1, 1,
-0.1734347, 0.2082396, 1.279678, 1, 0, 0, 1, 1,
-0.1688619, -0.6982741, -0.9606541, 1, 0, 0, 1, 1,
-0.1650017, -1.160573, -4.995362, 0, 0, 0, 1, 1,
-0.16355, -1.330082, -2.56424, 0, 0, 0, 1, 1,
-0.1629619, -0.140934, -1.624595, 0, 0, 0, 1, 1,
-0.1622773, -0.6165212, -2.219774, 0, 0, 0, 1, 1,
-0.1622343, -0.7644253, -4.997756, 0, 0, 0, 1, 1,
-0.1602444, -0.4031265, -2.323477, 0, 0, 0, 1, 1,
-0.1584266, 0.4502727, 0.004491196, 0, 0, 0, 1, 1,
-0.1559917, -0.211996, -4.039859, 1, 1, 1, 1, 1,
-0.1552863, -0.02359756, -2.777054, 1, 1, 1, 1, 1,
-0.1548373, 0.8758394, 0.9513939, 1, 1, 1, 1, 1,
-0.1537799, 0.9752055, -0.2908298, 1, 1, 1, 1, 1,
-0.1470953, 0.2056662, 1.467613, 1, 1, 1, 1, 1,
-0.1441093, -0.944845, -3.387609, 1, 1, 1, 1, 1,
-0.143729, -1.163303, -3.02258, 1, 1, 1, 1, 1,
-0.1423324, -0.5863543, -3.988167, 1, 1, 1, 1, 1,
-0.1412964, 0.07077014, -2.126306, 1, 1, 1, 1, 1,
-0.1389067, -0.341378, -2.268742, 1, 1, 1, 1, 1,
-0.1360009, -0.5502431, -3.224813, 1, 1, 1, 1, 1,
-0.1325004, 0.87501, -0.4862932, 1, 1, 1, 1, 1,
-0.1321402, 1.8392, -0.254753, 1, 1, 1, 1, 1,
-0.1321342, -0.3353328, -4.076858, 1, 1, 1, 1, 1,
-0.1313182, -0.7853752, -2.036911, 1, 1, 1, 1, 1,
-0.1278839, -1.25041, -3.528266, 0, 0, 1, 1, 1,
-0.1188734, -0.01970523, -0.4186278, 1, 0, 0, 1, 1,
-0.118866, -0.3043677, -3.668865, 1, 0, 0, 1, 1,
-0.1179771, 0.8012856, -0.6853719, 1, 0, 0, 1, 1,
-0.1113629, -2.309912, -3.25635, 1, 0, 0, 1, 1,
-0.1086663, 0.01032629, -2.7595, 1, 0, 0, 1, 1,
-0.1077977, -0.9432322, -4.251012, 0, 0, 0, 1, 1,
-0.1054214, 1.248181, -0.4295376, 0, 0, 0, 1, 1,
-0.1018517, -0.6964048, -2.799097, 0, 0, 0, 1, 1,
-0.1006466, 0.7912782, -0.179281, 0, 0, 0, 1, 1,
-0.1004223, -0.5160815, -4.368175, 0, 0, 0, 1, 1,
-0.09998143, -0.09254498, -1.608316, 0, 0, 0, 1, 1,
-0.09850545, 0.596683, -0.3289984, 0, 0, 0, 1, 1,
-0.09705923, -0.2374325, -3.448688, 1, 1, 1, 1, 1,
-0.09506711, -1.110508, -3.794944, 1, 1, 1, 1, 1,
-0.09369829, 0.840155, -0.8263184, 1, 1, 1, 1, 1,
-0.09120036, 1.109888, 1.490098, 1, 1, 1, 1, 1,
-0.08587336, 0.6643506, -0.4388947, 1, 1, 1, 1, 1,
-0.08036402, 2.690177, 1.246724, 1, 1, 1, 1, 1,
-0.07674463, -0.04385212, -1.233478, 1, 1, 1, 1, 1,
-0.07655995, 0.5706702, -0.4918334, 1, 1, 1, 1, 1,
-0.07649235, 1.150384, 0.4294921, 1, 1, 1, 1, 1,
-0.07287177, -2.668026, -2.818431, 1, 1, 1, 1, 1,
-0.06885934, 2.616388, -0.3792935, 1, 1, 1, 1, 1,
-0.06264479, 1.55707, -0.03594873, 1, 1, 1, 1, 1,
-0.06171572, 0.3928453, -0.52739, 1, 1, 1, 1, 1,
-0.05784443, -1.047904, -2.942183, 1, 1, 1, 1, 1,
-0.05776038, -1.754245, -2.939596, 1, 1, 1, 1, 1,
-0.05717337, -0.2335255, -2.260195, 0, 0, 1, 1, 1,
-0.05651462, 0.3824764, -0.744686, 1, 0, 0, 1, 1,
-0.05406563, -1.966417, -3.380422, 1, 0, 0, 1, 1,
-0.0471131, 1.211955, 0.443107, 1, 0, 0, 1, 1,
-0.0453098, -0.5326712, -1.557091, 1, 0, 0, 1, 1,
-0.03734282, -0.3077423, -3.0528, 1, 0, 0, 1, 1,
-0.03725421, 0.07989936, -0.5509236, 0, 0, 0, 1, 1,
-0.03271398, 0.2859165, 0.533008, 0, 0, 0, 1, 1,
-0.02914524, -1.144019, -1.808295, 0, 0, 0, 1, 1,
-0.02778837, 0.4661263, 1.994816, 0, 0, 0, 1, 1,
-0.02747155, -0.5071339, -2.588604, 0, 0, 0, 1, 1,
-0.02007557, -1.110328, -3.303451, 0, 0, 0, 1, 1,
-0.01312235, 1.198628, 0.2170098, 0, 0, 0, 1, 1,
-0.01285069, -0.03233806, -2.696477, 1, 1, 1, 1, 1,
-0.006540779, 0.4934803, 0.04367406, 1, 1, 1, 1, 1,
-0.001446867, -1.280958, -2.902796, 1, 1, 1, 1, 1,
0.0116056, 0.003939684, 1.739021, 1, 1, 1, 1, 1,
0.01582751, -0.320639, 3.329212, 1, 1, 1, 1, 1,
0.01597034, -0.5216116, 4.956415, 1, 1, 1, 1, 1,
0.01607896, -0.01477766, 4.08628, 1, 1, 1, 1, 1,
0.01696587, 1.789992, -1.402478, 1, 1, 1, 1, 1,
0.02251682, 0.2540151, -0.826576, 1, 1, 1, 1, 1,
0.0225825, -1.120742, 2.717005, 1, 1, 1, 1, 1,
0.02430817, -1.037611, 3.14777, 1, 1, 1, 1, 1,
0.0243471, 0.2997275, -0.1859345, 1, 1, 1, 1, 1,
0.02450415, -0.2930762, 3.016841, 1, 1, 1, 1, 1,
0.02977189, -0.1275114, 3.192326, 1, 1, 1, 1, 1,
0.03098455, -0.995917, 4.893887, 1, 1, 1, 1, 1,
0.03196631, -0.3675101, 1.633769, 0, 0, 1, 1, 1,
0.03820246, 0.005430388, 1.926686, 1, 0, 0, 1, 1,
0.0507925, -1.315064, 2.228848, 1, 0, 0, 1, 1,
0.051054, -0.4728698, 3.274311, 1, 0, 0, 1, 1,
0.05109814, 0.873787, 1.034436, 1, 0, 0, 1, 1,
0.05116224, 0.3091577, 0.9596841, 1, 0, 0, 1, 1,
0.05331454, 0.5481058, 0.4267716, 0, 0, 0, 1, 1,
0.05413732, -0.1006925, 0.480516, 0, 0, 0, 1, 1,
0.05509609, 0.7888373, -0.1169745, 0, 0, 0, 1, 1,
0.06358852, 0.8906828, -0.2612714, 0, 0, 0, 1, 1,
0.06379336, -0.2572471, 1.266829, 0, 0, 0, 1, 1,
0.06446514, 0.4089069, 0.4784772, 0, 0, 0, 1, 1,
0.06638058, -1.400259, 1.671494, 0, 0, 0, 1, 1,
0.06735246, -1.22677, 4.099262, 1, 1, 1, 1, 1,
0.06856868, 0.3221218, -0.2311281, 1, 1, 1, 1, 1,
0.07096589, -1.33903, 5.063706, 1, 1, 1, 1, 1,
0.07248183, 0.4850371, 1.180974, 1, 1, 1, 1, 1,
0.07325307, -0.454262, 5.190641, 1, 1, 1, 1, 1,
0.07640683, 2.061588, 0.5625642, 1, 1, 1, 1, 1,
0.08003996, 0.3589613, -1.011072, 1, 1, 1, 1, 1,
0.08253434, -1.166587, 2.6699, 1, 1, 1, 1, 1,
0.09347677, -0.2202062, 2.741678, 1, 1, 1, 1, 1,
0.09643193, -0.4755748, 0.7256806, 1, 1, 1, 1, 1,
0.09993359, -0.5400938, 3.014342, 1, 1, 1, 1, 1,
0.1017142, -1.011481, 1.683133, 1, 1, 1, 1, 1,
0.1025713, -0.2052128, 3.069706, 1, 1, 1, 1, 1,
0.1029628, -1.162737, 3.933153, 1, 1, 1, 1, 1,
0.1030273, 0.8010568, -0.803197, 1, 1, 1, 1, 1,
0.1036257, -0.4070977, 4.597402, 0, 0, 1, 1, 1,
0.1046883, 0.7357283, -0.2900221, 1, 0, 0, 1, 1,
0.1064462, -0.4027103, 3.731757, 1, 0, 0, 1, 1,
0.1109237, -0.8929386, 2.709671, 1, 0, 0, 1, 1,
0.1126098, -2.123635, 3.166443, 1, 0, 0, 1, 1,
0.1141925, 0.6925598, 0.2948591, 1, 0, 0, 1, 1,
0.1155041, -1.39694, 3.012928, 0, 0, 0, 1, 1,
0.1166447, -1.338572, 2.454394, 0, 0, 0, 1, 1,
0.1168329, -1.130651, 3.151136, 0, 0, 0, 1, 1,
0.1179123, 0.3977011, -0.04190687, 0, 0, 0, 1, 1,
0.1187949, -0.04969183, 2.057844, 0, 0, 0, 1, 1,
0.1202423, -2.542448, 2.058702, 0, 0, 0, 1, 1,
0.1205221, 0.6515811, -0.2964753, 0, 0, 0, 1, 1,
0.1214388, 0.0435653, 0.9244813, 1, 1, 1, 1, 1,
0.1220634, 0.3978414, 0.08227368, 1, 1, 1, 1, 1,
0.1261941, -1.115342, 4.030252, 1, 1, 1, 1, 1,
0.1288974, 0.6657794, -0.2395453, 1, 1, 1, 1, 1,
0.1328345, 0.4074712, 0.4882949, 1, 1, 1, 1, 1,
0.1358433, -0.5990888, 1.504735, 1, 1, 1, 1, 1,
0.1361288, -1.437278, 2.066592, 1, 1, 1, 1, 1,
0.1361391, 0.1229586, -0.03844853, 1, 1, 1, 1, 1,
0.1373433, -1.504262, 3.253748, 1, 1, 1, 1, 1,
0.1400076, -1.819629, 3.198155, 1, 1, 1, 1, 1,
0.1410013, -0.5551486, 3.492427, 1, 1, 1, 1, 1,
0.1485761, 1.011846, 0.2524688, 1, 1, 1, 1, 1,
0.1500037, -0.5126343, 2.157702, 1, 1, 1, 1, 1,
0.1536902, -1.099013, 4.391057, 1, 1, 1, 1, 1,
0.1555297, -0.1922087, 3.185514, 1, 1, 1, 1, 1,
0.1558478, 0.7860663, 0.3289081, 0, 0, 1, 1, 1,
0.1605467, 0.6697535, 0.8348649, 1, 0, 0, 1, 1,
0.1649364, -0.5789537, 4.328736, 1, 0, 0, 1, 1,
0.1704049, -2.248474, 6.060526, 1, 0, 0, 1, 1,
0.1726639, -0.1300945, 1.63422, 1, 0, 0, 1, 1,
0.1745472, 0.5544721, 0.2716891, 1, 0, 0, 1, 1,
0.1765225, -0.6090719, 4.048142, 0, 0, 0, 1, 1,
0.1770689, -0.394842, 2.999271, 0, 0, 0, 1, 1,
0.1775831, -0.2052871, 1.699855, 0, 0, 0, 1, 1,
0.1801705, 2.222132, -1.544513, 0, 0, 0, 1, 1,
0.180174, 0.3457576, 1.065725, 0, 0, 0, 1, 1,
0.1849828, 1.185318, -0.1418231, 0, 0, 0, 1, 1,
0.1856786, 1.204586, 0.6039669, 0, 0, 0, 1, 1,
0.1871661, 0.4666547, -2.08252, 1, 1, 1, 1, 1,
0.188647, 0.09319992, 1.014456, 1, 1, 1, 1, 1,
0.1886899, -0.2852326, 3.319569, 1, 1, 1, 1, 1,
0.1909959, -0.1710678, 0.2389116, 1, 1, 1, 1, 1,
0.1946538, 0.1170043, 2.89983, 1, 1, 1, 1, 1,
0.1980476, 0.4114398, 0.3269487, 1, 1, 1, 1, 1,
0.2011478, -0.8589599, 4.68424, 1, 1, 1, 1, 1,
0.2027268, 1.320168, 0.04008396, 1, 1, 1, 1, 1,
0.2030563, -0.554222, 2.600214, 1, 1, 1, 1, 1,
0.2063979, -1.411028, 1.947466, 1, 1, 1, 1, 1,
0.2155278, 1.577726, 0.1198427, 1, 1, 1, 1, 1,
0.2215957, 1.973186, -0.08771015, 1, 1, 1, 1, 1,
0.2237197, -1.156232, 1.946977, 1, 1, 1, 1, 1,
0.2296247, -0.6177142, 2.762922, 1, 1, 1, 1, 1,
0.232217, -0.9128011, 1.890437, 1, 1, 1, 1, 1,
0.2381115, 1.147094, -0.2015327, 0, 0, 1, 1, 1,
0.2396751, 1.105319, -1.369886, 1, 0, 0, 1, 1,
0.2401168, 0.418006, 1.705031, 1, 0, 0, 1, 1,
0.2427641, -0.8635265, 2.17609, 1, 0, 0, 1, 1,
0.2428613, 1.870752, 1.981393, 1, 0, 0, 1, 1,
0.2499612, 0.6330528, 0.8522689, 1, 0, 0, 1, 1,
0.2552491, -0.7699441, 1.491099, 0, 0, 0, 1, 1,
0.2557549, -0.7755406, 1.861389, 0, 0, 0, 1, 1,
0.2621789, -1.028177, 3.648497, 0, 0, 0, 1, 1,
0.2625315, 0.3130159, 0.5617443, 0, 0, 0, 1, 1,
0.2652077, 0.2621792, 0.9261681, 0, 0, 0, 1, 1,
0.2669999, 0.07352883, 1.266726, 0, 0, 0, 1, 1,
0.2676074, -0.7702524, 3.762821, 0, 0, 0, 1, 1,
0.2699618, -0.6703025, 2.472508, 1, 1, 1, 1, 1,
0.2706954, 0.8566728, -1.404971, 1, 1, 1, 1, 1,
0.2780477, 0.1893288, 0.5023332, 1, 1, 1, 1, 1,
0.2786605, 1.399245, -0.4932287, 1, 1, 1, 1, 1,
0.2786608, 2.017089, -0.7478254, 1, 1, 1, 1, 1,
0.2798246, -0.6209075, 2.278752, 1, 1, 1, 1, 1,
0.2845679, -0.5716798, 1.296604, 1, 1, 1, 1, 1,
0.2846898, -0.5069767, 3.100537, 1, 1, 1, 1, 1,
0.2860517, -0.006873168, 1.642087, 1, 1, 1, 1, 1,
0.2864516, -1.365317, 3.885794, 1, 1, 1, 1, 1,
0.2897809, 1.967436, 0.1935556, 1, 1, 1, 1, 1,
0.2911369, -1.470821, 4.895476, 1, 1, 1, 1, 1,
0.2935998, -0.274537, 1.526147, 1, 1, 1, 1, 1,
0.2958341, 1.07444, 1.708174, 1, 1, 1, 1, 1,
0.2994008, 0.8690692, -0.09038246, 1, 1, 1, 1, 1,
0.3022057, -2.384561, 2.942386, 0, 0, 1, 1, 1,
0.3034189, -0.6735103, 1.692274, 1, 0, 0, 1, 1,
0.3036607, -0.4670687, 2.204796, 1, 0, 0, 1, 1,
0.30387, 0.685734, 0.1113061, 1, 0, 0, 1, 1,
0.3049125, 0.3491134, 0.02175181, 1, 0, 0, 1, 1,
0.3059571, -1.999778, 1.181062, 1, 0, 0, 1, 1,
0.3066778, -0.4234176, 3.161386, 0, 0, 0, 1, 1,
0.306989, 0.4539827, 1.276684, 0, 0, 0, 1, 1,
0.3129314, -0.3082105, 2.591459, 0, 0, 0, 1, 1,
0.3188046, -0.6876531, 2.822913, 0, 0, 0, 1, 1,
0.3225332, 0.6194975, 2.5121, 0, 0, 0, 1, 1,
0.3233086, -1.378856, 3.006219, 0, 0, 0, 1, 1,
0.3260309, -0.5853993, 4.477367, 0, 0, 0, 1, 1,
0.3269721, 2.034862, -0.4952669, 1, 1, 1, 1, 1,
0.3269773, 1.812641, -2.213043, 1, 1, 1, 1, 1,
0.3288372, 0.8319898, 1.267719, 1, 1, 1, 1, 1,
0.3324135, 0.4369385, 1.191065, 1, 1, 1, 1, 1,
0.3336245, 1.300872, -0.6713441, 1, 1, 1, 1, 1,
0.3360196, 1.066179, 0.740214, 1, 1, 1, 1, 1,
0.3368953, -1.168636, 4.352211, 1, 1, 1, 1, 1,
0.3374771, -0.2430921, 2.181223, 1, 1, 1, 1, 1,
0.3391064, -0.7135489, 3.89302, 1, 1, 1, 1, 1,
0.3407937, -0.5528113, 1.827812, 1, 1, 1, 1, 1,
0.3478266, -2.732591, 2.826968, 1, 1, 1, 1, 1,
0.3485897, -0.1676812, 1.136723, 1, 1, 1, 1, 1,
0.349329, 1.109487, 0.1454845, 1, 1, 1, 1, 1,
0.3494044, -0.2709115, 2.592301, 1, 1, 1, 1, 1,
0.3537771, -0.5171335, 4.141221, 1, 1, 1, 1, 1,
0.3574286, 0.3309012, 2.036222, 0, 0, 1, 1, 1,
0.3589293, -0.03498016, -0.03312778, 1, 0, 0, 1, 1,
0.3641535, -0.1262641, 3.243658, 1, 0, 0, 1, 1,
0.3667642, 1.486765, -1.325371, 1, 0, 0, 1, 1,
0.3684399, -1.193433, 3.57281, 1, 0, 0, 1, 1,
0.3699349, 0.268708, 1.703276, 1, 0, 0, 1, 1,
0.3758965, -0.1091945, 0.4139656, 0, 0, 0, 1, 1,
0.3798729, 0.57771, 0.08378772, 0, 0, 0, 1, 1,
0.3820792, -0.4086952, 1.308909, 0, 0, 0, 1, 1,
0.3846304, -0.3848487, 2.068556, 0, 0, 0, 1, 1,
0.3856507, -0.3728676, 1.268918, 0, 0, 0, 1, 1,
0.3870631, -2.437275, 3.589809, 0, 0, 0, 1, 1,
0.3897667, -0.7265645, 3.140847, 0, 0, 0, 1, 1,
0.3961024, -0.9714437, 2.253778, 1, 1, 1, 1, 1,
0.4002065, -0.4581683, 0.9558266, 1, 1, 1, 1, 1,
0.4022315, -2.116776, 2.40957, 1, 1, 1, 1, 1,
0.4030873, -2.276285, 1.94242, 1, 1, 1, 1, 1,
0.4061302, 0.9742689, 0.7371861, 1, 1, 1, 1, 1,
0.4169886, 1.414381, -0.2586525, 1, 1, 1, 1, 1,
0.4179357, 1.494977, -0.5006711, 1, 1, 1, 1, 1,
0.4185353, 1.659867, -1.714134, 1, 1, 1, 1, 1,
0.4215333, 0.5048639, 0.7603388, 1, 1, 1, 1, 1,
0.422103, 1.267125, -1.689614, 1, 1, 1, 1, 1,
0.4222687, -1.281252, 3.138606, 1, 1, 1, 1, 1,
0.4227469, 0.7349488, -0.7005509, 1, 1, 1, 1, 1,
0.4267544, -1.403342, 1.672707, 1, 1, 1, 1, 1,
0.4360762, 0.02498796, 2.154509, 1, 1, 1, 1, 1,
0.4360824, -0.9085105, 1.041434, 1, 1, 1, 1, 1,
0.436647, -0.2996344, 1.890423, 0, 0, 1, 1, 1,
0.4417339, -0.4256246, 3.194888, 1, 0, 0, 1, 1,
0.4460081, -0.7019997, 1.970786, 1, 0, 0, 1, 1,
0.4460184, 0.3394343, 0.09939268, 1, 0, 0, 1, 1,
0.4516138, 1.359899, 0.8269402, 1, 0, 0, 1, 1,
0.4594001, 0.06141682, 0.5645489, 1, 0, 0, 1, 1,
0.460189, 0.3069657, 0.274696, 0, 0, 0, 1, 1,
0.4645253, -0.1670611, 3.245942, 0, 0, 0, 1, 1,
0.4664997, 0.01990965, 2.287701, 0, 0, 0, 1, 1,
0.4730459, -0.7833062, 2.565427, 0, 0, 0, 1, 1,
0.4740866, 0.4700876, -1.178714, 0, 0, 0, 1, 1,
0.47823, -0.5438125, 0.5965616, 0, 0, 0, 1, 1,
0.4815281, -0.984592, 2.074877, 0, 0, 0, 1, 1,
0.4911011, -1.223186, -0.5329214, 1, 1, 1, 1, 1,
0.4987801, -0.0477134, 2.883717, 1, 1, 1, 1, 1,
0.5001848, -0.8843814, 3.26526, 1, 1, 1, 1, 1,
0.5046521, -0.8277544, 2.193101, 1, 1, 1, 1, 1,
0.5055712, -0.1048542, 0.6531492, 1, 1, 1, 1, 1,
0.5063029, 0.4973251, 0.7112162, 1, 1, 1, 1, 1,
0.5071061, 0.1310903, 1.151184, 1, 1, 1, 1, 1,
0.5109481, 1.255238, 1.374351, 1, 1, 1, 1, 1,
0.5150993, 0.767563, 1.090835, 1, 1, 1, 1, 1,
0.5185149, 1.009738, -0.2250107, 1, 1, 1, 1, 1,
0.5222809, -0.7729763, 2.600289, 1, 1, 1, 1, 1,
0.5244278, -0.04931652, 2.434625, 1, 1, 1, 1, 1,
0.5263863, -0.3179142, 2.703548, 1, 1, 1, 1, 1,
0.5270753, -0.3618545, 1.483893, 1, 1, 1, 1, 1,
0.5318012, -0.3839286, 2.130752, 1, 1, 1, 1, 1,
0.5409166, -0.460651, 3.157826, 0, 0, 1, 1, 1,
0.5428288, -0.2569275, -1.072932, 1, 0, 0, 1, 1,
0.5444858, -0.1983719, 1.883036, 1, 0, 0, 1, 1,
0.5463414, -0.4299841, 1.479321, 1, 0, 0, 1, 1,
0.5501831, -1.191799, 2.325635, 1, 0, 0, 1, 1,
0.551428, 0.2474142, 1.515292, 1, 0, 0, 1, 1,
0.5535788, 0.830056, 0.5080879, 0, 0, 0, 1, 1,
0.5544115, -0.1434543, 2.338886, 0, 0, 0, 1, 1,
0.5550879, 0.07079738, 0.791149, 0, 0, 0, 1, 1,
0.5617775, -1.273914, 3.643339, 0, 0, 0, 1, 1,
0.5624047, -1.456253, 3.45627, 0, 0, 0, 1, 1,
0.5627265, 0.1003037, 0.8748713, 0, 0, 0, 1, 1,
0.5715791, -0.5706243, 2.200974, 0, 0, 0, 1, 1,
0.573044, 0.292713, 0.6279505, 1, 1, 1, 1, 1,
0.5815817, 1.075129, 0.9889574, 1, 1, 1, 1, 1,
0.5939105, 0.406049, 1.074019, 1, 1, 1, 1, 1,
0.5949526, -1.031533, 0.01955283, 1, 1, 1, 1, 1,
0.595593, 0.2841769, 1.618278, 1, 1, 1, 1, 1,
0.5957017, -0.7894239, 2.043312, 1, 1, 1, 1, 1,
0.5965995, -0.1504541, 2.215437, 1, 1, 1, 1, 1,
0.5973363, 0.7381049, -0.1961771, 1, 1, 1, 1, 1,
0.5973802, 1.944415, 0.3258244, 1, 1, 1, 1, 1,
0.5997965, -0.209335, 1.629393, 1, 1, 1, 1, 1,
0.6009398, -0.1932582, 0.01601616, 1, 1, 1, 1, 1,
0.601893, 0.9133449, 0.7305108, 1, 1, 1, 1, 1,
0.6077058, 1.596325, 0.8196018, 1, 1, 1, 1, 1,
0.6101218, -0.1533423, 2.963271, 1, 1, 1, 1, 1,
0.6130476, -0.005786296, 2.300635, 1, 1, 1, 1, 1,
0.6198153, 0.9957984, -0.3423373, 0, 0, 1, 1, 1,
0.6227591, 0.3968389, 2.524395, 1, 0, 0, 1, 1,
0.6252109, -1.340948, 1.724581, 1, 0, 0, 1, 1,
0.6266618, -1.143224, 2.913355, 1, 0, 0, 1, 1,
0.6281165, -1.346207, 2.81875, 1, 0, 0, 1, 1,
0.6304792, 0.2415569, 1.027653, 1, 0, 0, 1, 1,
0.6334456, 0.5116078, 2.684932, 0, 0, 0, 1, 1,
0.6356079, -0.4556959, 1.735845, 0, 0, 0, 1, 1,
0.638209, 2.173539, 0.2136557, 0, 0, 0, 1, 1,
0.6418736, -1.809358, 2.916595, 0, 0, 0, 1, 1,
0.6451073, 1.097631, 0.1539989, 0, 0, 0, 1, 1,
0.6467344, 1.554219, 0.04382423, 0, 0, 0, 1, 1,
0.6471008, 0.7591241, -1.698261, 0, 0, 0, 1, 1,
0.6487758, 0.3667847, 2.16568, 1, 1, 1, 1, 1,
0.65026, -0.7388046, 3.231868, 1, 1, 1, 1, 1,
0.6575256, 1.014565, 0.3377227, 1, 1, 1, 1, 1,
0.6634045, -0.8448532, 2.769058, 1, 1, 1, 1, 1,
0.6656811, 1.358396, -0.4596552, 1, 1, 1, 1, 1,
0.6686613, 0.6100138, 0.2406671, 1, 1, 1, 1, 1,
0.670535, 0.9438499, 1.806461, 1, 1, 1, 1, 1,
0.6795133, -0.9534186, 2.487671, 1, 1, 1, 1, 1,
0.6840368, 0.9408641, 1.367961, 1, 1, 1, 1, 1,
0.6943656, -1.305399, 2.186912, 1, 1, 1, 1, 1,
0.6943827, 1.193209, 1.163075, 1, 1, 1, 1, 1,
0.694999, 1.488225, -0.2695807, 1, 1, 1, 1, 1,
0.6958859, -0.3343678, 1.86931, 1, 1, 1, 1, 1,
0.6963975, -0.9978787, 3.898144, 1, 1, 1, 1, 1,
0.6964515, -0.8406659, 3.503441, 1, 1, 1, 1, 1,
0.7008981, -0.4542194, 2.241098, 0, 0, 1, 1, 1,
0.7023463, 0.7488727, 0.9438102, 1, 0, 0, 1, 1,
0.7097666, 1.260594, 0.7197, 1, 0, 0, 1, 1,
0.7122195, -0.5780326, 1.879943, 1, 0, 0, 1, 1,
0.7205637, -1.730964, 2.688025, 1, 0, 0, 1, 1,
0.7206354, -0.07444505, 0.8290212, 1, 0, 0, 1, 1,
0.7229186, 0.3461473, 1.997227, 0, 0, 0, 1, 1,
0.7266815, -0.5134662, 1.20797, 0, 0, 0, 1, 1,
0.7299408, -0.08824518, 1.824043, 0, 0, 0, 1, 1,
0.7309715, 0.03059384, 1.795082, 0, 0, 0, 1, 1,
0.7317026, -0.01534445, 0.8549529, 0, 0, 0, 1, 1,
0.7377529, -1.016227, 3.711066, 0, 0, 0, 1, 1,
0.7431258, -0.6601775, 1.583387, 0, 0, 0, 1, 1,
0.7633281, -0.3512232, 1.453471, 1, 1, 1, 1, 1,
0.7650832, 1.122116, 1.017423, 1, 1, 1, 1, 1,
0.7656866, -0.1307238, 0.5361108, 1, 1, 1, 1, 1,
0.7677711, 0.231632, 0.2838307, 1, 1, 1, 1, 1,
0.780656, -0.1656359, 1.367608, 1, 1, 1, 1, 1,
0.7823422, -1.222366, 1.483435, 1, 1, 1, 1, 1,
0.7842791, 1.028104, 2.557319, 1, 1, 1, 1, 1,
0.7867634, 0.1061392, 0.1206039, 1, 1, 1, 1, 1,
0.7871178, -0.4104785, 1.990656, 1, 1, 1, 1, 1,
0.7878959, 0.5806753, 1.333069, 1, 1, 1, 1, 1,
0.7903184, 0.6689658, -0.06854114, 1, 1, 1, 1, 1,
0.7990684, -0.4976014, 0.2406129, 1, 1, 1, 1, 1,
0.8007326, -0.2983911, 1.786171, 1, 1, 1, 1, 1,
0.8008566, -0.8415059, 2.45143, 1, 1, 1, 1, 1,
0.8016943, 1.025567, -0.1453229, 1, 1, 1, 1, 1,
0.8021137, 0.6040453, 0.4761813, 0, 0, 1, 1, 1,
0.8062478, 0.3221612, 1.810827, 1, 0, 0, 1, 1,
0.8074621, -0.9026798, 1.226194, 1, 0, 0, 1, 1,
0.809249, 0.2867363, 2.1657, 1, 0, 0, 1, 1,
0.8139994, 0.2685045, 2.628375, 1, 0, 0, 1, 1,
0.8154291, 1.023982, 0.7323321, 1, 0, 0, 1, 1,
0.8167062, 0.7159107, 0.3301204, 0, 0, 0, 1, 1,
0.8203298, 1.298515, -0.8694488, 0, 0, 0, 1, 1,
0.8204679, 1.039108, -1.266025, 0, 0, 0, 1, 1,
0.8231379, -1.71903, 0.8797292, 0, 0, 0, 1, 1,
0.8248366, 0.6782085, 0.9413188, 0, 0, 0, 1, 1,
0.8257424, -0.9328053, 3.643345, 0, 0, 0, 1, 1,
0.8264498, -0.8152937, 2.89596, 0, 0, 0, 1, 1,
0.8274177, 0.5097404, 2.343533, 1, 1, 1, 1, 1,
0.8338712, -0.08309535, 1.527104, 1, 1, 1, 1, 1,
0.8363759, 0.6955996, -0.228599, 1, 1, 1, 1, 1,
0.8384463, 0.6415513, 2.119757, 1, 1, 1, 1, 1,
0.8444537, 0.2730143, 3.10642, 1, 1, 1, 1, 1,
0.8450198, -0.7228442, 3.239507, 1, 1, 1, 1, 1,
0.8482251, 1.039288, -0.05524336, 1, 1, 1, 1, 1,
0.8514361, 0.5901331, 0.5129027, 1, 1, 1, 1, 1,
0.862385, -0.2615424, 3.523107, 1, 1, 1, 1, 1,
0.8701095, -0.124434, 1.33511, 1, 1, 1, 1, 1,
0.8710492, 0.9333968, -0.5446917, 1, 1, 1, 1, 1,
0.872741, -0.8353927, 1.364196, 1, 1, 1, 1, 1,
0.8763913, -1.832573, 2.631783, 1, 1, 1, 1, 1,
0.8777692, 1.022403, 0.4561176, 1, 1, 1, 1, 1,
0.8811589, 0.5910475, 0.1486425, 1, 1, 1, 1, 1,
0.8849583, -1.093776, 1.987631, 0, 0, 1, 1, 1,
0.8865023, 0.9698079, -0.6552702, 1, 0, 0, 1, 1,
0.8870585, 0.8032258, 2.05584, 1, 0, 0, 1, 1,
0.8874537, -1.372684, 3.429413, 1, 0, 0, 1, 1,
0.8954852, 0.2217197, 3.925895, 1, 0, 0, 1, 1,
0.8960824, -1.312833, 4.40534, 1, 0, 0, 1, 1,
0.8963693, 0.3321673, 2.433447, 0, 0, 0, 1, 1,
0.8978704, -0.8268322, 2.713276, 0, 0, 0, 1, 1,
0.9071334, -1.176335, 2.667123, 0, 0, 0, 1, 1,
0.9092681, 1.356213, -2.09051, 0, 0, 0, 1, 1,
0.9108796, -0.3122482, 2.57866, 0, 0, 0, 1, 1,
0.9112527, 0.7251114, 0.2944063, 0, 0, 0, 1, 1,
0.9184395, -0.03524966, 0.8125693, 0, 0, 0, 1, 1,
0.9234257, -0.88196, 1.774226, 1, 1, 1, 1, 1,
0.9264123, -0.1229571, 1.61577, 1, 1, 1, 1, 1,
0.9274353, -0.05240693, 1.104979, 1, 1, 1, 1, 1,
0.9278068, 0.3139597, 0.6582792, 1, 1, 1, 1, 1,
0.9278486, -1.137584, 1.885287, 1, 1, 1, 1, 1,
0.943085, -2.181115, 4.499247, 1, 1, 1, 1, 1,
0.9485959, 0.144476, 1.289274, 1, 1, 1, 1, 1,
0.948649, -0.06167963, 1.273583, 1, 1, 1, 1, 1,
0.9491581, 0.09731618, 0.7468374, 1, 1, 1, 1, 1,
0.9518169, 1.136535, 0.7852948, 1, 1, 1, 1, 1,
0.9565447, 0.06532953, 2.308795, 1, 1, 1, 1, 1,
0.9602252, 1.087883, 0.5551659, 1, 1, 1, 1, 1,
0.9651211, 0.03200604, 1.808906, 1, 1, 1, 1, 1,
0.96901, -1.704746, 2.495144, 1, 1, 1, 1, 1,
0.9711242, -0.6948381, 0.001757669, 1, 1, 1, 1, 1,
0.9727176, 0.560076, -0.3290238, 0, 0, 1, 1, 1,
0.9727426, -0.920632, 0.64371, 1, 0, 0, 1, 1,
0.9749253, 0.3536063, 1.057333, 1, 0, 0, 1, 1,
0.9897525, -0.7034827, 1.621852, 1, 0, 0, 1, 1,
0.9902025, 2.320916, -2.388044, 1, 0, 0, 1, 1,
0.9921337, -1.41439, 2.006143, 1, 0, 0, 1, 1,
0.9947823, 0.4909498, 1.228039, 0, 0, 0, 1, 1,
1.004047, -0.003194803, 0.3713917, 0, 0, 0, 1, 1,
1.008949, -0.04160786, 0.3054416, 0, 0, 0, 1, 1,
1.009594, -0.4613327, 3.154682, 0, 0, 0, 1, 1,
1.011554, -0.3848462, 1.545129, 0, 0, 0, 1, 1,
1.017201, -0.4489219, 1.313539, 0, 0, 0, 1, 1,
1.028125, 1.220197, 0.2906022, 0, 0, 0, 1, 1,
1.035807, 0.5398421, 0.4641994, 1, 1, 1, 1, 1,
1.050768, 0.875779, 1.476187, 1, 1, 1, 1, 1,
1.053229, -0.6212966, 3.875527, 1, 1, 1, 1, 1,
1.054557, 0.2675478, 0.5509838, 1, 1, 1, 1, 1,
1.055352, -0.002280584, 3.834696, 1, 1, 1, 1, 1,
1.056765, -1.324092, 2.452612, 1, 1, 1, 1, 1,
1.06576, -0.1372852, 2.569671, 1, 1, 1, 1, 1,
1.068194, 0.4030504, 2.04274, 1, 1, 1, 1, 1,
1.069408, -0.9056729, 2.246176, 1, 1, 1, 1, 1,
1.077902, -0.4258954, 1.550061, 1, 1, 1, 1, 1,
1.084141, -2.54807, 2.579987, 1, 1, 1, 1, 1,
1.085831, -0.05939784, 1.663523, 1, 1, 1, 1, 1,
1.088933, -0.9907414, 2.173245, 1, 1, 1, 1, 1,
1.089454, -0.7438916, 2.856392, 1, 1, 1, 1, 1,
1.095055, -1.08803, 3.590333, 1, 1, 1, 1, 1,
1.097561, -0.06263426, 1.149548, 0, 0, 1, 1, 1,
1.10837, -0.4365987, 2.009787, 1, 0, 0, 1, 1,
1.118024, 0.183936, 3.015826, 1, 0, 0, 1, 1,
1.119472, 1.316337, 0.4794384, 1, 0, 0, 1, 1,
1.1201, -0.1648098, 1.36579, 1, 0, 0, 1, 1,
1.123378, -1.352826, 3.416687, 1, 0, 0, 1, 1,
1.123461, 0.2001327, 3.335771, 0, 0, 0, 1, 1,
1.13019, 1.365083, 0.478765, 0, 0, 0, 1, 1,
1.144054, -0.3161802, 1.721204, 0, 0, 0, 1, 1,
1.147046, -1.366516, 1.262674, 0, 0, 0, 1, 1,
1.157711, -0.9961894, 3.114302, 0, 0, 0, 1, 1,
1.161489, -1.121661, 2.598785, 0, 0, 0, 1, 1,
1.162322, 0.1602916, 2.005886, 0, 0, 0, 1, 1,
1.162738, -0.3234823, 0.5376812, 1, 1, 1, 1, 1,
1.16283, 0.08299019, 1.155595, 1, 1, 1, 1, 1,
1.174124, 0.8762702, 2.423928, 1, 1, 1, 1, 1,
1.174389, 0.9589923, 1.168654, 1, 1, 1, 1, 1,
1.17452, -0.2927248, 0.6665567, 1, 1, 1, 1, 1,
1.19035, -1.20336, 0.917921, 1, 1, 1, 1, 1,
1.206102, 0.8136039, -0.9437387, 1, 1, 1, 1, 1,
1.210813, -0.2737531, 1.268014, 1, 1, 1, 1, 1,
1.212085, -1.540139, 2.345495, 1, 1, 1, 1, 1,
1.214019, -0.617569, 2.424193, 1, 1, 1, 1, 1,
1.239688, -0.06284953, 2.164114, 1, 1, 1, 1, 1,
1.248909, -1.520543, 3.730769, 1, 1, 1, 1, 1,
1.248935, 0.2021497, 1.136746, 1, 1, 1, 1, 1,
1.249787, -0.31676, -0.1229376, 1, 1, 1, 1, 1,
1.252896, -1.49069, 2.204606, 1, 1, 1, 1, 1,
1.256659, 0.319661, 1.847259, 0, 0, 1, 1, 1,
1.258619, 0.1587223, 1.540213, 1, 0, 0, 1, 1,
1.2654, 0.3358493, 0.3221086, 1, 0, 0, 1, 1,
1.265608, -1.560325, 3.045847, 1, 0, 0, 1, 1,
1.265986, -0.9213533, 1.09584, 1, 0, 0, 1, 1,
1.273163, -0.2488094, 0.9534644, 1, 0, 0, 1, 1,
1.274201, 1.027034, 1.214748, 0, 0, 0, 1, 1,
1.285175, -0.6213021, 3.124201, 0, 0, 0, 1, 1,
1.290632, 0.7760822, 0.764744, 0, 0, 0, 1, 1,
1.298676, 0.1881614, -0.2013762, 0, 0, 0, 1, 1,
1.300569, 0.6530968, -1.163878, 0, 0, 0, 1, 1,
1.326281, -0.5077534, 1.936442, 0, 0, 0, 1, 1,
1.333211, -1.402399, 1.332401, 0, 0, 0, 1, 1,
1.337491, 1.497441, 0.3027001, 1, 1, 1, 1, 1,
1.34207, -1.065595, 1.375683, 1, 1, 1, 1, 1,
1.343683, -0.7979323, 1.196051, 1, 1, 1, 1, 1,
1.348768, -1.161629, 2.177621, 1, 1, 1, 1, 1,
1.35011, -1.096849, 1.667313, 1, 1, 1, 1, 1,
1.365557, 1.045012, 1.015611, 1, 1, 1, 1, 1,
1.385371, -0.405974, 2.09399, 1, 1, 1, 1, 1,
1.385739, -0.9481722, 4.282275, 1, 1, 1, 1, 1,
1.390836, -0.02055302, 2.070449, 1, 1, 1, 1, 1,
1.404664, -0.1834185, 2.085672, 1, 1, 1, 1, 1,
1.411996, 0.4698746, 4.104115, 1, 1, 1, 1, 1,
1.415903, -0.3862313, 3.944159, 1, 1, 1, 1, 1,
1.418573, -1.385516, 1.185698, 1, 1, 1, 1, 1,
1.420626, -0.01069886, 0.331164, 1, 1, 1, 1, 1,
1.426162, 2.415312, 1.897497, 1, 1, 1, 1, 1,
1.43018, -0.4292479, 2.284688, 0, 0, 1, 1, 1,
1.433957, -0.3818865, 3.651362, 1, 0, 0, 1, 1,
1.442993, -0.5847259, -0.1326686, 1, 0, 0, 1, 1,
1.44405, 0.446212, -0.1453677, 1, 0, 0, 1, 1,
1.448394, -1.841341, 0.7223331, 1, 0, 0, 1, 1,
1.45411, -0.5791669, 3.377401, 1, 0, 0, 1, 1,
1.456043, -0.4829627, 0.38214, 0, 0, 0, 1, 1,
1.460507, -0.1877802, 1.996847, 0, 0, 0, 1, 1,
1.472651, -0.112112, 0.27133, 0, 0, 0, 1, 1,
1.478848, 0.6427661, 0.4330285, 0, 0, 0, 1, 1,
1.491384, 0.6638122, 0.7966861, 0, 0, 0, 1, 1,
1.493936, -0.7767558, 0.5959819, 0, 0, 0, 1, 1,
1.494394, 0.4546796, 1.72009, 0, 0, 0, 1, 1,
1.519274, -0.9103447, 2.694067, 1, 1, 1, 1, 1,
1.538625, 0.008412393, 1.964728, 1, 1, 1, 1, 1,
1.55454, -0.5433581, 2.200135, 1, 1, 1, 1, 1,
1.567059, 0.6427454, -1.150869, 1, 1, 1, 1, 1,
1.581749, -0.4890292, 1.404611, 1, 1, 1, 1, 1,
1.582197, 0.7209832, 1.850839, 1, 1, 1, 1, 1,
1.629025, 0.6269414, 0.8811629, 1, 1, 1, 1, 1,
1.632043, -1.130976, 2.56098, 1, 1, 1, 1, 1,
1.644485, -0.9622444, 1.510622, 1, 1, 1, 1, 1,
1.652836, -0.8595853, 2.727055, 1, 1, 1, 1, 1,
1.654025, 0.229166, -0.3063527, 1, 1, 1, 1, 1,
1.655444, 0.678077, 0.07614041, 1, 1, 1, 1, 1,
1.657194, -0.778118, 1.232961, 1, 1, 1, 1, 1,
1.661186, 0.861084, 0.8574206, 1, 1, 1, 1, 1,
1.677552, 0.06237167, 3.035229, 1, 1, 1, 1, 1,
1.6848, 0.03790759, 1.942707, 0, 0, 1, 1, 1,
1.685881, -0.4062861, 2.352686, 1, 0, 0, 1, 1,
1.687155, -0.1838072, 2.005303, 1, 0, 0, 1, 1,
1.688432, 0.7908954, 0.3655291, 1, 0, 0, 1, 1,
1.713582, 0.3684056, 1.310049, 1, 0, 0, 1, 1,
1.71964, 1.912304, 2.588373, 1, 0, 0, 1, 1,
1.722711, 0.2707403, 0.7313715, 0, 0, 0, 1, 1,
1.724597, -0.1976402, 1.19462, 0, 0, 0, 1, 1,
1.727593, -0.1880244, 2.252677, 0, 0, 0, 1, 1,
1.737034, 0.2866236, -0.2356653, 0, 0, 0, 1, 1,
1.74014, 0.8179243, 3.11147, 0, 0, 0, 1, 1,
1.746757, 1.381805, -0.02013716, 0, 0, 0, 1, 1,
1.749679, -0.8293779, 1.456792, 0, 0, 0, 1, 1,
1.750315, 0.7020911, -0.1865455, 1, 1, 1, 1, 1,
1.756917, 0.5037067, -0.2022159, 1, 1, 1, 1, 1,
1.810009, 0.2593624, 3.068948, 1, 1, 1, 1, 1,
1.818007, 2.00957, 1.355525, 1, 1, 1, 1, 1,
1.819151, 0.09580438, 1.4778, 1, 1, 1, 1, 1,
1.820383, 1.684253, 2.317726, 1, 1, 1, 1, 1,
1.820764, 0.1061285, 2.302182, 1, 1, 1, 1, 1,
1.824271, 0.3221637, -0.3572896, 1, 1, 1, 1, 1,
1.846983, 0.7058938, 1.437685, 1, 1, 1, 1, 1,
1.877447, 0.9770396, -0.6366571, 1, 1, 1, 1, 1,
1.90835, 1.049629, 1.479469, 1, 1, 1, 1, 1,
1.943055, -1.596796, 1.237963, 1, 1, 1, 1, 1,
1.958199, -0.2632504, 0.9837763, 1, 1, 1, 1, 1,
1.960178, -1.214323, 0.7947899, 1, 1, 1, 1, 1,
1.961393, 0.1783044, 2.350531, 1, 1, 1, 1, 1,
1.96399, 1.702437, 1.104635, 0, 0, 1, 1, 1,
2.00027, 0.1655236, 0.301724, 1, 0, 0, 1, 1,
2.008921, -0.7989912, 2.047103, 1, 0, 0, 1, 1,
2.025037, -0.4249122, 1.095833, 1, 0, 0, 1, 1,
2.043082, 1.471683, 1.446955, 1, 0, 0, 1, 1,
2.065255, 0.3602707, 1.964811, 1, 0, 0, 1, 1,
2.069613, 0.2671843, 0.9981015, 0, 0, 0, 1, 1,
2.104522, -0.03432243, 1.337238, 0, 0, 0, 1, 1,
2.177228, -2.09799, 1.64337, 0, 0, 0, 1, 1,
2.18065, -0.8823649, 1.625975, 0, 0, 0, 1, 1,
2.203892, -1.501325, 1.128373, 0, 0, 0, 1, 1,
2.333553, -0.8466317, 0.06121529, 0, 0, 0, 1, 1,
2.37161, -0.2182271, 1.363674, 0, 0, 0, 1, 1,
2.393415, 0.337045, 0.5258592, 1, 1, 1, 1, 1,
2.466094, -0.7289841, 1.619753, 1, 1, 1, 1, 1,
2.470371, 1.056659, 1.983237, 1, 1, 1, 1, 1,
2.5243, -1.100192, 2.28327, 1, 1, 1, 1, 1,
2.601062, -0.6033153, 1.962048, 1, 1, 1, 1, 1,
2.704128, -0.549546, 2.357452, 1, 1, 1, 1, 1,
2.732907, -1.330794, 0.8931482, 1, 1, 1, 1, 1
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
var radius = 9.585178;
var distance = 33.66753;
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
mvMatrix.translate( 0.2941689, 0.2787561, -0.4302547 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.66753);
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
