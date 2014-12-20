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
-2.824757, -0.06435684, -1.410267, 1, 0, 0, 1,
-2.680818, -0.8950999, -3.699077, 1, 0.007843138, 0, 1,
-2.433571, -3.154676, -1.972546, 1, 0.01176471, 0, 1,
-2.426351, -0.9474789, -1.119084, 1, 0.01960784, 0, 1,
-2.350849, 1.946667, 0.7794864, 1, 0.02352941, 0, 1,
-2.347494, -0.2017243, -1.951882, 1, 0.03137255, 0, 1,
-2.232288, -0.9760178, -3.349912, 1, 0.03529412, 0, 1,
-2.21557, -0.4312323, -1.464718, 1, 0.04313726, 0, 1,
-2.117134, 0.2552641, -1.220987, 1, 0.04705882, 0, 1,
-2.105179, -0.3496746, -2.023064, 1, 0.05490196, 0, 1,
-2.09464, -1.246361, -1.813518, 1, 0.05882353, 0, 1,
-2.077766, 0.3181253, -0.906986, 1, 0.06666667, 0, 1,
-2.07493, 1.014848, -1.242768, 1, 0.07058824, 0, 1,
-2.066985, 1.790963, -1.069438, 1, 0.07843138, 0, 1,
-2.035509, 0.3366435, -1.618957, 1, 0.08235294, 0, 1,
-2.030974, -0.433596, -2.631958, 1, 0.09019608, 0, 1,
-2.024473, -0.3478471, -2.679627, 1, 0.09411765, 0, 1,
-2.022464, 1.787997, -2.128562, 1, 0.1019608, 0, 1,
-1.995285, 0.4660725, -2.400901, 1, 0.1098039, 0, 1,
-1.995099, -0.4875889, -1.86379, 1, 0.1137255, 0, 1,
-1.969733, 0.886813, -1.14143, 1, 0.1215686, 0, 1,
-1.967995, 1.105075, -0.2625188, 1, 0.1254902, 0, 1,
-1.948065, 0.1713784, -0.5510178, 1, 0.1333333, 0, 1,
-1.928118, 0.2119799, -1.322583, 1, 0.1372549, 0, 1,
-1.899814, -0.6707389, -1.783011, 1, 0.145098, 0, 1,
-1.891986, 0.7733013, -2.14863, 1, 0.1490196, 0, 1,
-1.868372, -0.2178277, 0.7153776, 1, 0.1568628, 0, 1,
-1.842637, -2.04063, -3.555131, 1, 0.1607843, 0, 1,
-1.839245, -0.7332673, -0.2327614, 1, 0.1686275, 0, 1,
-1.785711, 1.182075, -0.608274, 1, 0.172549, 0, 1,
-1.782691, -0.06286826, -1.870292, 1, 0.1803922, 0, 1,
-1.777545, -0.9674389, -0.2923216, 1, 0.1843137, 0, 1,
-1.766698, 2.289999, -1.636202, 1, 0.1921569, 0, 1,
-1.765392, -0.7034208, -3.290518, 1, 0.1960784, 0, 1,
-1.763578, -0.6590175, -0.7255437, 1, 0.2039216, 0, 1,
-1.758201, 0.2147846, -2.164427, 1, 0.2117647, 0, 1,
-1.749529, -0.1985366, -3.203609, 1, 0.2156863, 0, 1,
-1.740508, 1.045765, -0.06485303, 1, 0.2235294, 0, 1,
-1.734624, -1.135076, -3.607341, 1, 0.227451, 0, 1,
-1.709669, -0.1228761, -2.555601, 1, 0.2352941, 0, 1,
-1.698243, -0.1869237, -1.116206, 1, 0.2392157, 0, 1,
-1.685627, 0.6817517, -0.3141329, 1, 0.2470588, 0, 1,
-1.68006, -1.137198, -1.881244, 1, 0.2509804, 0, 1,
-1.657105, -0.06536465, -3.264468, 1, 0.2588235, 0, 1,
-1.625022, -0.07653964, -2.498426, 1, 0.2627451, 0, 1,
-1.620916, 0.9832093, 0.05941968, 1, 0.2705882, 0, 1,
-1.592446, 1.659992, 0.2796393, 1, 0.2745098, 0, 1,
-1.565196, -0.6915246, -0.4515905, 1, 0.282353, 0, 1,
-1.561933, 0.905432, -2.004811, 1, 0.2862745, 0, 1,
-1.560754, -0.2984522, -2.143957, 1, 0.2941177, 0, 1,
-1.560229, -0.6663754, -1.218636, 1, 0.3019608, 0, 1,
-1.544522, -1.982544, -1.716445, 1, 0.3058824, 0, 1,
-1.543022, 0.5260136, -0.8153546, 1, 0.3137255, 0, 1,
-1.539436, 0.2869088, -0.2847453, 1, 0.3176471, 0, 1,
-1.530043, -0.03429933, -1.011857, 1, 0.3254902, 0, 1,
-1.518016, -1.070318, -2.196477, 1, 0.3294118, 0, 1,
-1.515869, 0.6014394, -2.57407, 1, 0.3372549, 0, 1,
-1.497625, 0.3104537, -2.108054, 1, 0.3411765, 0, 1,
-1.494069, -0.1096694, -1.289481, 1, 0.3490196, 0, 1,
-1.489517, -1.630105, -1.441505, 1, 0.3529412, 0, 1,
-1.488507, 0.6419388, -0.366593, 1, 0.3607843, 0, 1,
-1.472584, -0.244604, -2.385822, 1, 0.3647059, 0, 1,
-1.469672, -0.8410809, -3.048156, 1, 0.372549, 0, 1,
-1.466322, -0.3455818, -1.952871, 1, 0.3764706, 0, 1,
-1.457415, -0.09810367, -0.9341159, 1, 0.3843137, 0, 1,
-1.456229, -2.652202, -2.111383, 1, 0.3882353, 0, 1,
-1.434074, 0.2374867, -2.868842, 1, 0.3960784, 0, 1,
-1.431218, 0.3331859, -0.4034956, 1, 0.4039216, 0, 1,
-1.430682, 0.264214, -1.715135, 1, 0.4078431, 0, 1,
-1.40547, -0.8198285, 0.3085096, 1, 0.4156863, 0, 1,
-1.40375, 0.7711814, -2.056197, 1, 0.4196078, 0, 1,
-1.397181, -1.158073, -1.235806, 1, 0.427451, 0, 1,
-1.389917, -1.075686, -3.435739, 1, 0.4313726, 0, 1,
-1.381698, 0.8500019, -0.276904, 1, 0.4392157, 0, 1,
-1.365883, -0.6992264, -1.727104, 1, 0.4431373, 0, 1,
-1.358861, 0.03639901, -3.495565, 1, 0.4509804, 0, 1,
-1.357901, -1.235443, -3.992512, 1, 0.454902, 0, 1,
-1.353664, 0.3177424, -0.1912715, 1, 0.4627451, 0, 1,
-1.352903, -0.2901926, -1.087634, 1, 0.4666667, 0, 1,
-1.340844, 1.247181, -2.124376, 1, 0.4745098, 0, 1,
-1.339615, 0.7525861, 0.4759012, 1, 0.4784314, 0, 1,
-1.339072, 1.057978, -1.120407, 1, 0.4862745, 0, 1,
-1.335148, -0.1748635, -1.631875, 1, 0.4901961, 0, 1,
-1.3309, -0.2559576, -2.348454, 1, 0.4980392, 0, 1,
-1.328562, -0.7184886, -1.819869, 1, 0.5058824, 0, 1,
-1.32188, -0.2060012, -1.32188, 1, 0.509804, 0, 1,
-1.320498, 0.3569232, -2.962006, 1, 0.5176471, 0, 1,
-1.295578, -0.3527577, -2.554101, 1, 0.5215687, 0, 1,
-1.295382, 0.3050908, -2.752972, 1, 0.5294118, 0, 1,
-1.291819, 0.4768506, -3.275408, 1, 0.5333334, 0, 1,
-1.290424, -1.427808, -2.449605, 1, 0.5411765, 0, 1,
-1.286867, 1.049356, -1.60207, 1, 0.5450981, 0, 1,
-1.271852, -0.2051965, -2.097819, 1, 0.5529412, 0, 1,
-1.266321, -0.7811072, -1.101344, 1, 0.5568628, 0, 1,
-1.26631, -1.141901, -1.767911, 1, 0.5647059, 0, 1,
-1.265748, -0.09607756, -0.3702854, 1, 0.5686275, 0, 1,
-1.246418, -0.1497572, -1.834204, 1, 0.5764706, 0, 1,
-1.233925, 1.315779, 0.583022, 1, 0.5803922, 0, 1,
-1.23212, -2.232848, -2.523893, 1, 0.5882353, 0, 1,
-1.23073, 0.4324244, -0.9070261, 1, 0.5921569, 0, 1,
-1.229831, -1.165084, -1.844196, 1, 0.6, 0, 1,
-1.228452, -1.322496, -3.566552, 1, 0.6078432, 0, 1,
-1.225997, 2.264106, -0.1154136, 1, 0.6117647, 0, 1,
-1.220429, -0.2006633, -1.291696, 1, 0.6196079, 0, 1,
-1.213708, -0.5466738, -1.654366, 1, 0.6235294, 0, 1,
-1.212863, -0.6044531, -3.199467, 1, 0.6313726, 0, 1,
-1.208278, 1.652179, -0.7388976, 1, 0.6352941, 0, 1,
-1.204415, 1.867679, -2.172852, 1, 0.6431373, 0, 1,
-1.190639, 0.8677438, -1.875237, 1, 0.6470588, 0, 1,
-1.18846, 0.4247012, 0.3020487, 1, 0.654902, 0, 1,
-1.187036, -1.760716, -2.275643, 1, 0.6588235, 0, 1,
-1.177116, -0.934875, -1.670471, 1, 0.6666667, 0, 1,
-1.175458, -0.7494307, -3.423763, 1, 0.6705883, 0, 1,
-1.175229, -0.4562561, -1.890115, 1, 0.6784314, 0, 1,
-1.172601, -1.549825, -3.542529, 1, 0.682353, 0, 1,
-1.165423, 0.9325253, -1.4872, 1, 0.6901961, 0, 1,
-1.157619, 0.2862355, 1.314698, 1, 0.6941177, 0, 1,
-1.15181, 0.2699195, -1.837842, 1, 0.7019608, 0, 1,
-1.149434, -0.1547616, -2.564522, 1, 0.7098039, 0, 1,
-1.146213, -0.1345337, -4.220861, 1, 0.7137255, 0, 1,
-1.143845, 0.5144266, -0.9887872, 1, 0.7215686, 0, 1,
-1.135126, 1.710034, -1.091538, 1, 0.7254902, 0, 1,
-1.133237, 1.620341, -0.6082897, 1, 0.7333333, 0, 1,
-1.129781, 0.8481375, -1.859413, 1, 0.7372549, 0, 1,
-1.123145, 0.4708738, -1.602496, 1, 0.7450981, 0, 1,
-1.118488, -0.6245666, -2.322406, 1, 0.7490196, 0, 1,
-1.115549, 0.9651888, 1.584517, 1, 0.7568628, 0, 1,
-1.107762, 0.2916727, -2.595268, 1, 0.7607843, 0, 1,
-1.106657, -1.567493, -2.626991, 1, 0.7686275, 0, 1,
-1.089993, 0.9026736, -1.19296, 1, 0.772549, 0, 1,
-1.085969, -0.2736908, -4.085603, 1, 0.7803922, 0, 1,
-1.085316, -1.136233, -1.460969, 1, 0.7843137, 0, 1,
-1.084995, 1.087832, -0.73879, 1, 0.7921569, 0, 1,
-1.082555, 0.4820215, -0.4461184, 1, 0.7960784, 0, 1,
-1.078895, -0.439765, -0.4819873, 1, 0.8039216, 0, 1,
-1.078545, -0.539634, 0.246469, 1, 0.8117647, 0, 1,
-1.061488, 3.079727, -0.9685735, 1, 0.8156863, 0, 1,
-1.057351, -1.559345, -1.743487, 1, 0.8235294, 0, 1,
-1.055956, 0.9328994, -0.9138135, 1, 0.827451, 0, 1,
-1.052454, 1.277832, 0.3058441, 1, 0.8352941, 0, 1,
-1.047388, -0.3900051, -2.836223, 1, 0.8392157, 0, 1,
-1.044693, -0.7054779, -2.520901, 1, 0.8470588, 0, 1,
-1.043497, -0.9742364, -3.051239, 1, 0.8509804, 0, 1,
-1.042099, -0.08774649, 0.855881, 1, 0.8588235, 0, 1,
-1.034529, 1.653715, -0.2854372, 1, 0.8627451, 0, 1,
-1.033222, 0.11338, -1.257146, 1, 0.8705882, 0, 1,
-1.023755, -1.026368, -3.272813, 1, 0.8745098, 0, 1,
-1.018893, -0.7649978, -1.973128, 1, 0.8823529, 0, 1,
-1.017393, 0.8948334, -0.409941, 1, 0.8862745, 0, 1,
-1.016458, -1.305872, -4.02169, 1, 0.8941177, 0, 1,
-1.010828, -0.09884048, -2.032523, 1, 0.8980392, 0, 1,
-1.00706, -1.220117, -3.716707, 1, 0.9058824, 0, 1,
-1.005677, -0.3279044, -1.929481, 1, 0.9137255, 0, 1,
-1.005102, -1.189246, -3.610861, 1, 0.9176471, 0, 1,
-1.003881, 0.6296938, 0.6393102, 1, 0.9254902, 0, 1,
-1.002059, -2.277179, -3.064113, 1, 0.9294118, 0, 1,
-0.995658, 0.6806364, -1.205633, 1, 0.9372549, 0, 1,
-0.9872753, 0.8525887, -0.4898855, 1, 0.9411765, 0, 1,
-0.9872572, -0.6017188, 0.111939, 1, 0.9490196, 0, 1,
-0.9853689, 0.157144, -1.515218, 1, 0.9529412, 0, 1,
-0.981488, 2.038772, -0.808392, 1, 0.9607843, 0, 1,
-0.9772468, 2.13272, -0.2897659, 1, 0.9647059, 0, 1,
-0.97716, -0.1779061, -1.417246, 1, 0.972549, 0, 1,
-0.9742984, 0.8007425, -0.6973804, 1, 0.9764706, 0, 1,
-0.9725616, -1.728734, -0.6871208, 1, 0.9843137, 0, 1,
-0.9725036, 0.3324048, -0.6276413, 1, 0.9882353, 0, 1,
-0.9702297, -0.2570917, -1.303669, 1, 0.9960784, 0, 1,
-0.9643737, 0.3366164, -1.737578, 0.9960784, 1, 0, 1,
-0.9643452, 0.1045455, -0.9133058, 0.9921569, 1, 0, 1,
-0.9637145, -1.050018, -2.1394, 0.9843137, 1, 0, 1,
-0.9623247, -0.7109854, -2.346524, 0.9803922, 1, 0, 1,
-0.9586493, -0.005106297, -2.819, 0.972549, 1, 0, 1,
-0.9502694, 0.2839559, -1.848709, 0.9686275, 1, 0, 1,
-0.9337366, 0.1988442, -0.949477, 0.9607843, 1, 0, 1,
-0.9277793, -1.366149, -4.002951, 0.9568627, 1, 0, 1,
-0.9256762, -1.290532, -2.46762, 0.9490196, 1, 0, 1,
-0.9247134, -0.7567264, -1.065887, 0.945098, 1, 0, 1,
-0.9176577, -0.540213, -2.519819, 0.9372549, 1, 0, 1,
-0.9123702, 1.638898, 0.8769383, 0.9333333, 1, 0, 1,
-0.9105485, 0.1976926, -1.738052, 0.9254902, 1, 0, 1,
-0.9100947, 0.4071815, -0.7755107, 0.9215686, 1, 0, 1,
-0.8961607, 0.1231243, -3.086702, 0.9137255, 1, 0, 1,
-0.8912416, 2.060578, 0.347154, 0.9098039, 1, 0, 1,
-0.8901919, -0.9667803, -2.087857, 0.9019608, 1, 0, 1,
-0.889372, -0.4576018, -3.217641, 0.8941177, 1, 0, 1,
-0.885612, -0.3907124, -1.506413, 0.8901961, 1, 0, 1,
-0.8851307, 0.2260027, -2.11368, 0.8823529, 1, 0, 1,
-0.8828176, 1.14215, 0.3593088, 0.8784314, 1, 0, 1,
-0.8797963, 0.7576933, 0.1296825, 0.8705882, 1, 0, 1,
-0.8742766, 0.4442863, -1.525541, 0.8666667, 1, 0, 1,
-0.8732397, -1.239143, -2.40623, 0.8588235, 1, 0, 1,
-0.8679211, 0.681838, -0.3233202, 0.854902, 1, 0, 1,
-0.8674454, 1.881504, 0.2592816, 0.8470588, 1, 0, 1,
-0.8661323, 0.2431799, -2.558044, 0.8431373, 1, 0, 1,
-0.8642443, 0.5441442, -1.793448, 0.8352941, 1, 0, 1,
-0.8628182, -0.4755969, -2.069408, 0.8313726, 1, 0, 1,
-0.8603305, -0.4151825, -2.900574, 0.8235294, 1, 0, 1,
-0.8574598, -0.8962507, -2.898265, 0.8196079, 1, 0, 1,
-0.8502968, 0.4163584, -1.218515, 0.8117647, 1, 0, 1,
-0.8480847, -0.8993843, -1.106253, 0.8078431, 1, 0, 1,
-0.8456541, -0.5515454, -2.474121, 0.8, 1, 0, 1,
-0.8454862, -0.114182, -2.3372, 0.7921569, 1, 0, 1,
-0.8437193, 1.100171, -0.8675367, 0.7882353, 1, 0, 1,
-0.8345163, 0.6983165, -1.171961, 0.7803922, 1, 0, 1,
-0.8335751, -2.426471, -2.946322, 0.7764706, 1, 0, 1,
-0.8317262, -1.042062, -1.619739, 0.7686275, 1, 0, 1,
-0.8309008, -0.7508338, -1.494713, 0.7647059, 1, 0, 1,
-0.8285468, -1.583165, -2.356573, 0.7568628, 1, 0, 1,
-0.827185, -1.534603, -2.140427, 0.7529412, 1, 0, 1,
-0.8240333, 0.8310158, 0.151443, 0.7450981, 1, 0, 1,
-0.8178899, -0.6532243, -2.755068, 0.7411765, 1, 0, 1,
-0.8134813, -0.8871008, -0.7825327, 0.7333333, 1, 0, 1,
-0.8103121, 0.9889423, -0.595996, 0.7294118, 1, 0, 1,
-0.8085914, -0.5627608, -0.6178617, 0.7215686, 1, 0, 1,
-0.8025652, -0.7458491, -2.484781, 0.7176471, 1, 0, 1,
-0.8005452, -0.740782, -2.820004, 0.7098039, 1, 0, 1,
-0.7989945, -0.2297141, -1.844231, 0.7058824, 1, 0, 1,
-0.796394, -0.2572644, -1.273867, 0.6980392, 1, 0, 1,
-0.796277, 0.6525856, -1.390823, 0.6901961, 1, 0, 1,
-0.7946887, -1.687676, -4.061633, 0.6862745, 1, 0, 1,
-0.7883009, -0.4225581, -0.5980192, 0.6784314, 1, 0, 1,
-0.7838012, -0.0930857, -1.152197, 0.6745098, 1, 0, 1,
-0.782497, -0.8827442, -4.126999, 0.6666667, 1, 0, 1,
-0.7819216, -0.3411248, -2.689773, 0.6627451, 1, 0, 1,
-0.7810091, -0.3547762, -1.849703, 0.654902, 1, 0, 1,
-0.7767445, 0.215923, -0.9824039, 0.6509804, 1, 0, 1,
-0.7741371, -0.06147683, -1.716936, 0.6431373, 1, 0, 1,
-0.7735229, -0.3537953, -1.833783, 0.6392157, 1, 0, 1,
-0.7673414, -1.029228, -1.891365, 0.6313726, 1, 0, 1,
-0.7607843, -2.082292, -2.676621, 0.627451, 1, 0, 1,
-0.754783, -1.533485, -2.764828, 0.6196079, 1, 0, 1,
-0.7539896, -0.09573382, -2.832208, 0.6156863, 1, 0, 1,
-0.7474711, -0.6006862, -1.986745, 0.6078432, 1, 0, 1,
-0.7395974, -0.7007935, -2.498422, 0.6039216, 1, 0, 1,
-0.7359221, -0.4858583, -0.741271, 0.5960785, 1, 0, 1,
-0.7335345, -1.096533, -1.630064, 0.5882353, 1, 0, 1,
-0.7317744, 1.847164, -2.072736, 0.5843138, 1, 0, 1,
-0.730447, 0.9256217, -0.6631171, 0.5764706, 1, 0, 1,
-0.7280105, -0.2198402, -1.890794, 0.572549, 1, 0, 1,
-0.7259963, -0.5834134, -1.889496, 0.5647059, 1, 0, 1,
-0.7241966, -0.2354377, -0.7172585, 0.5607843, 1, 0, 1,
-0.7164273, 0.6015851, -2.552838, 0.5529412, 1, 0, 1,
-0.7159822, 0.62959, -2.245506, 0.5490196, 1, 0, 1,
-0.713143, 0.7121708, -0.4676986, 0.5411765, 1, 0, 1,
-0.709768, 1.008542, 1.943736, 0.5372549, 1, 0, 1,
-0.7091535, -2.529095, -4.043963, 0.5294118, 1, 0, 1,
-0.7084827, 0.5791724, -0.4051451, 0.5254902, 1, 0, 1,
-0.7052645, -1.052918, -3.796597, 0.5176471, 1, 0, 1,
-0.7004022, -0.002193404, -1.392481, 0.5137255, 1, 0, 1,
-0.6968976, -1.554372, -2.903677, 0.5058824, 1, 0, 1,
-0.6967294, 0.6809232, -0.007460356, 0.5019608, 1, 0, 1,
-0.6879424, 1.300325, -1.267078, 0.4941176, 1, 0, 1,
-0.6868228, 0.9656822, -1.399011, 0.4862745, 1, 0, 1,
-0.680736, 1.26013, 0.2272167, 0.4823529, 1, 0, 1,
-0.6768727, -1.606973, -3.28703, 0.4745098, 1, 0, 1,
-0.6763833, -1.886867, -2.934852, 0.4705882, 1, 0, 1,
-0.6755011, 0.1652738, -3.458042, 0.4627451, 1, 0, 1,
-0.67322, 1.239821, 0.01759866, 0.4588235, 1, 0, 1,
-0.6699284, 1.217323, -0.7047993, 0.4509804, 1, 0, 1,
-0.661825, -0.0492052, -1.627117, 0.4470588, 1, 0, 1,
-0.6616218, 0.3117874, -1.590385, 0.4392157, 1, 0, 1,
-0.6593354, 0.6295224, -1.178817, 0.4352941, 1, 0, 1,
-0.6573163, 0.2651936, -1.045502, 0.427451, 1, 0, 1,
-0.6527164, -1.017513, -2.374165, 0.4235294, 1, 0, 1,
-0.650131, 0.6286733, 1.381539, 0.4156863, 1, 0, 1,
-0.6457519, -0.6199821, -2.860444, 0.4117647, 1, 0, 1,
-0.6453869, -0.6051779, -2.062027, 0.4039216, 1, 0, 1,
-0.6436927, -0.7420659, -3.155647, 0.3960784, 1, 0, 1,
-0.6432029, 0.5510703, -0.7095882, 0.3921569, 1, 0, 1,
-0.6423395, 0.555509, 0.7909666, 0.3843137, 1, 0, 1,
-0.635813, 0.2670595, -0.346079, 0.3803922, 1, 0, 1,
-0.6344445, -0.06654018, -1.288787, 0.372549, 1, 0, 1,
-0.6340079, 1.018239, -2.104989, 0.3686275, 1, 0, 1,
-0.6207998, 0.6574636, -1.786542, 0.3607843, 1, 0, 1,
-0.6181878, -2.290131, -1.371256, 0.3568628, 1, 0, 1,
-0.6177515, -1.151197, -3.763876, 0.3490196, 1, 0, 1,
-0.6120764, 0.5163854, -1.295789, 0.345098, 1, 0, 1,
-0.6115429, -1.81251, -3.62387, 0.3372549, 1, 0, 1,
-0.6114026, -1.313648, -2.950234, 0.3333333, 1, 0, 1,
-0.6112211, 1.265614, -1.358729, 0.3254902, 1, 0, 1,
-0.6054558, 0.3132514, -0.654203, 0.3215686, 1, 0, 1,
-0.6016505, -0.5837752, -1.694272, 0.3137255, 1, 0, 1,
-0.5995914, 1.383484, -0.6866755, 0.3098039, 1, 0, 1,
-0.5964407, -0.5964503, -1.785218, 0.3019608, 1, 0, 1,
-0.5919039, 0.4105633, -2.248801, 0.2941177, 1, 0, 1,
-0.5901046, -0.515824, -1.217089, 0.2901961, 1, 0, 1,
-0.5772994, 0.946854, -0.2286987, 0.282353, 1, 0, 1,
-0.5762122, 0.02290617, -0.6715845, 0.2784314, 1, 0, 1,
-0.5757328, 0.8289469, -0.3560302, 0.2705882, 1, 0, 1,
-0.5748495, 0.7894213, -0.5917422, 0.2666667, 1, 0, 1,
-0.5717738, -0.5346263, -0.821578, 0.2588235, 1, 0, 1,
-0.5676132, -0.7879453, -3.32738, 0.254902, 1, 0, 1,
-0.5588037, -1.284677, -2.110754, 0.2470588, 1, 0, 1,
-0.5492471, 0.4573316, -0.03976667, 0.2431373, 1, 0, 1,
-0.5405522, 0.1927633, -2.422846, 0.2352941, 1, 0, 1,
-0.5382399, 0.7166474, -0.7385715, 0.2313726, 1, 0, 1,
-0.5338799, -2.213171, -2.66422, 0.2235294, 1, 0, 1,
-0.5327499, -0.03311542, -0.9632571, 0.2196078, 1, 0, 1,
-0.530264, 0.2366487, -1.017859, 0.2117647, 1, 0, 1,
-0.5271752, -0.2522869, -3.81172, 0.2078431, 1, 0, 1,
-0.5240422, 0.4178137, -1.152058, 0.2, 1, 0, 1,
-0.517834, -0.8943343, -4.209351, 0.1921569, 1, 0, 1,
-0.5168841, 0.2205646, -0.3077756, 0.1882353, 1, 0, 1,
-0.5101655, -0.08337703, -0.4670858, 0.1803922, 1, 0, 1,
-0.5071898, -1.460325, -3.49578, 0.1764706, 1, 0, 1,
-0.4962954, -0.5597864, -1.316466, 0.1686275, 1, 0, 1,
-0.4952416, 0.8670608, 0.9582561, 0.1647059, 1, 0, 1,
-0.4890797, -0.05843845, -1.233468, 0.1568628, 1, 0, 1,
-0.4867223, 0.9706541, -1.149442, 0.1529412, 1, 0, 1,
-0.4864538, 0.2625082, -1.592305, 0.145098, 1, 0, 1,
-0.4855508, -0.2414359, -1.513677, 0.1411765, 1, 0, 1,
-0.4834224, 1.095907, -1.840371, 0.1333333, 1, 0, 1,
-0.4802089, -0.5357683, -2.454578, 0.1294118, 1, 0, 1,
-0.4789904, 2.068482, -0.1960563, 0.1215686, 1, 0, 1,
-0.4787177, -0.2112742, -2.925919, 0.1176471, 1, 0, 1,
-0.4755899, 0.8481233, -0.4384133, 0.1098039, 1, 0, 1,
-0.473167, -0.6352276, -3.220424, 0.1058824, 1, 0, 1,
-0.4723603, 0.09782647, -2.291432, 0.09803922, 1, 0, 1,
-0.471805, -1.162356, -1.771865, 0.09019608, 1, 0, 1,
-0.4711355, -1.238308, -2.529642, 0.08627451, 1, 0, 1,
-0.4701723, -1.121483, -3.034037, 0.07843138, 1, 0, 1,
-0.4699993, -0.4915245, -2.736449, 0.07450981, 1, 0, 1,
-0.469842, -1.149746, -2.95199, 0.06666667, 1, 0, 1,
-0.4657941, 0.1369066, -0.4227878, 0.0627451, 1, 0, 1,
-0.4590073, -0.7302566, -3.917932, 0.05490196, 1, 0, 1,
-0.4589528, 0.3820595, -1.489054, 0.05098039, 1, 0, 1,
-0.4577296, 0.231936, -1.088897, 0.04313726, 1, 0, 1,
-0.4573806, 0.8137286, -2.118182, 0.03921569, 1, 0, 1,
-0.4547542, -0.03955986, -0.6130875, 0.03137255, 1, 0, 1,
-0.4536899, 1.036043, 0.1957785, 0.02745098, 1, 0, 1,
-0.4521826, -0.1890424, -3.806374, 0.01960784, 1, 0, 1,
-0.4481201, 0.2775235, -1.564333, 0.01568628, 1, 0, 1,
-0.4458856, 1.289604, -0.5396257, 0.007843138, 1, 0, 1,
-0.4429266, 0.3526737, -0.4778471, 0.003921569, 1, 0, 1,
-0.4424706, 0.1818892, -0.6230363, 0, 1, 0.003921569, 1,
-0.4418216, -0.7797801, -3.505325, 0, 1, 0.01176471, 1,
-0.4331573, 0.5118688, -0.4574527, 0, 1, 0.01568628, 1,
-0.4311261, 0.8128359, -2.064984, 0, 1, 0.02352941, 1,
-0.4299886, -0.03055278, -1.444538, 0, 1, 0.02745098, 1,
-0.429088, -2.285248, -2.588242, 0, 1, 0.03529412, 1,
-0.4280416, 0.8590336, -0.924512, 0, 1, 0.03921569, 1,
-0.4186852, 0.9498874, -1.604656, 0, 1, 0.04705882, 1,
-0.4166772, 0.8711578, -0.9315711, 0, 1, 0.05098039, 1,
-0.4124751, -0.213936, -1.649467, 0, 1, 0.05882353, 1,
-0.4122961, 0.443756, 0.7336224, 0, 1, 0.0627451, 1,
-0.4096792, -0.6300051, -2.658974, 0, 1, 0.07058824, 1,
-0.4069905, 0.07647056, -1.53386, 0, 1, 0.07450981, 1,
-0.4060967, 0.6760637, -0.2088627, 0, 1, 0.08235294, 1,
-0.4054499, 0.6059953, -0.5428197, 0, 1, 0.08627451, 1,
-0.4002641, -1.549777, -3.04123, 0, 1, 0.09411765, 1,
-0.3994808, -0.3738327, -0.5014464, 0, 1, 0.1019608, 1,
-0.3927977, -2.998216, -1.46021, 0, 1, 0.1058824, 1,
-0.3877178, -1.98412, -2.562871, 0, 1, 0.1137255, 1,
-0.3796669, 0.7120775, 0.4665148, 0, 1, 0.1176471, 1,
-0.3785663, -0.5234004, -2.216687, 0, 1, 0.1254902, 1,
-0.3782334, 0.5558195, -0.5695291, 0, 1, 0.1294118, 1,
-0.3778112, 0.825913, -0.7691321, 0, 1, 0.1372549, 1,
-0.3762856, 0.02140078, -1.566578, 0, 1, 0.1411765, 1,
-0.3760085, -1.225889, -3.828235, 0, 1, 0.1490196, 1,
-0.3720956, -0.162395, -0.5596793, 0, 1, 0.1529412, 1,
-0.3714241, 0.5282009, -1.135053, 0, 1, 0.1607843, 1,
-0.3707158, 0.6494971, -0.1551386, 0, 1, 0.1647059, 1,
-0.3696214, 2.752967, -1.017482, 0, 1, 0.172549, 1,
-0.3599127, -1.036125, -1.907286, 0, 1, 0.1764706, 1,
-0.3574628, -0.04494979, 0.3746292, 0, 1, 0.1843137, 1,
-0.3564934, 0.7599581, -0.5051303, 0, 1, 0.1882353, 1,
-0.3504829, 0.7671459, 0.8901206, 0, 1, 0.1960784, 1,
-0.3487957, -0.5376897, -3.895009, 0, 1, 0.2039216, 1,
-0.3453775, 0.2959817, -1.373067, 0, 1, 0.2078431, 1,
-0.3450578, 0.6645939, -1.188181, 0, 1, 0.2156863, 1,
-0.3444429, 2.997287, 0.8356564, 0, 1, 0.2196078, 1,
-0.3425322, 0.344972, -1.542087, 0, 1, 0.227451, 1,
-0.3414195, -1.126492, -2.739387, 0, 1, 0.2313726, 1,
-0.3406734, 0.6037882, -0.3558018, 0, 1, 0.2392157, 1,
-0.3393737, -0.7601669, -4.350702, 0, 1, 0.2431373, 1,
-0.3365604, -0.8548948, -3.989448, 0, 1, 0.2509804, 1,
-0.3343856, 0.2717122, 0.4177172, 0, 1, 0.254902, 1,
-0.3336866, -0.1220583, -3.61311, 0, 1, 0.2627451, 1,
-0.332553, -0.2759319, -2.902384, 0, 1, 0.2666667, 1,
-0.3299159, 1.252862, 0.2057601, 0, 1, 0.2745098, 1,
-0.3294736, 0.6146773, -0.5860705, 0, 1, 0.2784314, 1,
-0.3269026, -0.2461864, -0.5844532, 0, 1, 0.2862745, 1,
-0.3255638, -0.04153019, -0.8891859, 0, 1, 0.2901961, 1,
-0.3250799, -1.338113, -1.145061, 0, 1, 0.2980392, 1,
-0.3225192, 0.6796155, -0.5271284, 0, 1, 0.3058824, 1,
-0.3213322, -1.294763, -1.327205, 0, 1, 0.3098039, 1,
-0.3211007, -1.931293, -2.06182, 0, 1, 0.3176471, 1,
-0.3208281, -1.094649, -1.605115, 0, 1, 0.3215686, 1,
-0.3187519, -0.3249757, -1.829673, 0, 1, 0.3294118, 1,
-0.3156422, 0.2489886, 0.662283, 0, 1, 0.3333333, 1,
-0.3116678, -0.2085177, -3.626965, 0, 1, 0.3411765, 1,
-0.3094022, 0.5974233, 0.4246538, 0, 1, 0.345098, 1,
-0.3058828, -0.1255646, -3.043041, 0, 1, 0.3529412, 1,
-0.2982207, 0.6028972, -0.3939545, 0, 1, 0.3568628, 1,
-0.2966302, 0.7948822, 1.139876, 0, 1, 0.3647059, 1,
-0.2966055, 1.091255, -1.03233, 0, 1, 0.3686275, 1,
-0.2920563, 0.2496237, -1.83947, 0, 1, 0.3764706, 1,
-0.2900299, -0.2900956, -4.204821, 0, 1, 0.3803922, 1,
-0.2859659, -1.263629, -2.816181, 0, 1, 0.3882353, 1,
-0.2817479, 0.5724112, 1.49182, 0, 1, 0.3921569, 1,
-0.2801401, 0.3818974, -1.023803, 0, 1, 0.4, 1,
-0.2766959, -1.104332, -1.778237, 0, 1, 0.4078431, 1,
-0.268879, 0.35979, -1.130743, 0, 1, 0.4117647, 1,
-0.2684723, -0.5237629, -2.70425, 0, 1, 0.4196078, 1,
-0.2586093, -0.1248748, -0.4265485, 0, 1, 0.4235294, 1,
-0.2583884, -1.683453, -3.703867, 0, 1, 0.4313726, 1,
-0.2574487, -0.3183813, -3.085049, 0, 1, 0.4352941, 1,
-0.2560109, 0.3799051, 1.098588, 0, 1, 0.4431373, 1,
-0.2542055, 2.341852, -1.029571, 0, 1, 0.4470588, 1,
-0.2537276, -1.266887, -2.911893, 0, 1, 0.454902, 1,
-0.2512212, -0.2952006, -1.678238, 0, 1, 0.4588235, 1,
-0.2502688, 0.1126684, 0.03482662, 0, 1, 0.4666667, 1,
-0.2440755, -0.8596932, -2.425388, 0, 1, 0.4705882, 1,
-0.2367064, 0.9478941, 1.052508, 0, 1, 0.4784314, 1,
-0.2358768, -1.333573, -3.133805, 0, 1, 0.4823529, 1,
-0.2358648, 0.101451, -0.8889717, 0, 1, 0.4901961, 1,
-0.2243516, -0.3557108, -0.4969181, 0, 1, 0.4941176, 1,
-0.2196389, -0.4437284, -1.063904, 0, 1, 0.5019608, 1,
-0.204502, 0.3577448, 0.8841823, 0, 1, 0.509804, 1,
-0.2028013, -0.1305621, -2.621138, 0, 1, 0.5137255, 1,
-0.20195, 0.8167413, -2.750182, 0, 1, 0.5215687, 1,
-0.1989359, 0.2795373, -0.6594534, 0, 1, 0.5254902, 1,
-0.1984004, -0.1440386, -4.499504, 0, 1, 0.5333334, 1,
-0.1983269, -0.4491313, -2.838114, 0, 1, 0.5372549, 1,
-0.190284, -1.775881, -2.496407, 0, 1, 0.5450981, 1,
-0.190043, -1.557816, -2.851568, 0, 1, 0.5490196, 1,
-0.1899436, 0.2232816, 0.215031, 0, 1, 0.5568628, 1,
-0.1886622, -1.244677, -1.886371, 0, 1, 0.5607843, 1,
-0.1759853, -0.03577166, -2.266996, 0, 1, 0.5686275, 1,
-0.1719639, 1.377429, -0.1141839, 0, 1, 0.572549, 1,
-0.1685148, 0.5661324, 1.151945, 0, 1, 0.5803922, 1,
-0.166411, -0.2384671, -2.170482, 0, 1, 0.5843138, 1,
-0.1647417, 0.281073, -2.222414, 0, 1, 0.5921569, 1,
-0.1605749, 0.2178445, 0.4008381, 0, 1, 0.5960785, 1,
-0.1583969, 0.1741194, -0.6932038, 0, 1, 0.6039216, 1,
-0.1550694, -0.6511412, -4.189608, 0, 1, 0.6117647, 1,
-0.1547847, -0.7734081, -2.98837, 0, 1, 0.6156863, 1,
-0.1542745, 0.07510625, -0.9301285, 0, 1, 0.6235294, 1,
-0.1511501, -0.5033299, -1.934618, 0, 1, 0.627451, 1,
-0.1494753, 1.987731, 0.3635552, 0, 1, 0.6352941, 1,
-0.1491098, -0.8399072, -3.478794, 0, 1, 0.6392157, 1,
-0.1482447, -0.8117445, -1.210388, 0, 1, 0.6470588, 1,
-0.1479399, -0.04520519, -2.708317, 0, 1, 0.6509804, 1,
-0.1475137, 2.034187, -0.119041, 0, 1, 0.6588235, 1,
-0.1451496, -0.2483764, -0.6573911, 0, 1, 0.6627451, 1,
-0.1423273, -0.8077554, -1.44027, 0, 1, 0.6705883, 1,
-0.1342277, 1.192554, -1.435925, 0, 1, 0.6745098, 1,
-0.1324364, 0.4092305, -0.1406004, 0, 1, 0.682353, 1,
-0.1278877, -0.7714152, -3.564392, 0, 1, 0.6862745, 1,
-0.1200057, -1.103727, -3.466803, 0, 1, 0.6941177, 1,
-0.1190499, -1.859234, -0.38996, 0, 1, 0.7019608, 1,
-0.1178288, 1.285076, 0.1260423, 0, 1, 0.7058824, 1,
-0.1177601, -2.451987, -4.414104, 0, 1, 0.7137255, 1,
-0.116397, -0.4498668, -2.626759, 0, 1, 0.7176471, 1,
-0.1151141, 0.1239076, 1.951319, 0, 1, 0.7254902, 1,
-0.1137991, -0.0712432, -3.33122, 0, 1, 0.7294118, 1,
-0.1126946, -1.882624, -1.59413, 0, 1, 0.7372549, 1,
-0.1123893, 0.4033852, 0.6124293, 0, 1, 0.7411765, 1,
-0.1123164, -0.6301126, -1.536217, 0, 1, 0.7490196, 1,
-0.1101512, 0.09271157, -0.03709765, 0, 1, 0.7529412, 1,
-0.1070452, 1.156209, 0.1874433, 0, 1, 0.7607843, 1,
-0.105715, -1.242841, -2.728794, 0, 1, 0.7647059, 1,
-0.1044844, 0.378923, 0.4525908, 0, 1, 0.772549, 1,
-0.1031952, -1.307215, -0.9913685, 0, 1, 0.7764706, 1,
-0.1023248, -0.2853636, -3.209931, 0, 1, 0.7843137, 1,
-0.0942495, -0.8052246, -2.217938, 0, 1, 0.7882353, 1,
-0.07798426, 0.9981499, -0.5581409, 0, 1, 0.7960784, 1,
-0.07749525, -0.7599063, -2.964768, 0, 1, 0.8039216, 1,
-0.07648553, 0.2467784, 0.1979196, 0, 1, 0.8078431, 1,
-0.07220771, 0.3364077, -2.065632, 0, 1, 0.8156863, 1,
-0.07058772, -1.853905, -4.245992, 0, 1, 0.8196079, 1,
-0.07033184, -0.3975229, -3.719747, 0, 1, 0.827451, 1,
-0.06440544, -2.041023, -4.256102, 0, 1, 0.8313726, 1,
-0.06345204, 0.8999599, -0.3776316, 0, 1, 0.8392157, 1,
-0.06314298, -0.7660659, -3.376039, 0, 1, 0.8431373, 1,
-0.06090417, 0.39122, 0.3919416, 0, 1, 0.8509804, 1,
-0.05986262, -1.118161, -3.481881, 0, 1, 0.854902, 1,
-0.05928249, -1.956565, -3.74734, 0, 1, 0.8627451, 1,
-0.05554798, 0.3161823, 0.8866286, 0, 1, 0.8666667, 1,
-0.05355559, 0.8750256, 1.65152, 0, 1, 0.8745098, 1,
-0.05305563, 2.311763, 1.113946, 0, 1, 0.8784314, 1,
-0.04876066, 0.9083093, 0.4769907, 0, 1, 0.8862745, 1,
-0.04691537, 0.04342578, -0.8236807, 0, 1, 0.8901961, 1,
-0.04511493, -1.96826, -3.081541, 0, 1, 0.8980392, 1,
-0.04483271, 0.8519015, 0.4614644, 0, 1, 0.9058824, 1,
-0.04386414, 0.3588849, -1.000151, 0, 1, 0.9098039, 1,
-0.04242449, -1.692881, -1.811005, 0, 1, 0.9176471, 1,
-0.04173047, 0.8303809, 0.9499571, 0, 1, 0.9215686, 1,
-0.04154825, -1.090639, -3.084863, 0, 1, 0.9294118, 1,
-0.03896987, 0.8025967, 0.8539404, 0, 1, 0.9333333, 1,
-0.03554842, 0.4931353, -1.366774, 0, 1, 0.9411765, 1,
-0.03210408, -1.330675, -2.988376, 0, 1, 0.945098, 1,
-0.02788182, 0.6140844, -0.5920967, 0, 1, 0.9529412, 1,
-0.02719152, 1.288877, 0.7580039, 0, 1, 0.9568627, 1,
-0.01955952, -1.618828, -2.57038, 0, 1, 0.9647059, 1,
-0.01719286, 1.228787, 1.246048, 0, 1, 0.9686275, 1,
-0.01678756, 0.8723063, 0.2290542, 0, 1, 0.9764706, 1,
-0.01317928, -0.0335423, -2.123739, 0, 1, 0.9803922, 1,
-0.01254946, 1.703707, -1.500922, 0, 1, 0.9882353, 1,
-0.009912307, -0.6711618, -1.386445, 0, 1, 0.9921569, 1,
-0.008147031, -0.3595637, -2.284537, 0, 1, 1, 1,
-0.008135899, 1.13659, -0.1755076, 0, 0.9921569, 1, 1,
-0.005926316, 1.22996, -0.1883852, 0, 0.9882353, 1, 1,
0.008427587, -1.033978, 4.146399, 0, 0.9803922, 1, 1,
0.01210727, 0.1096908, -0.9692501, 0, 0.9764706, 1, 1,
0.01568632, -0.908813, 2.950886, 0, 0.9686275, 1, 1,
0.02085507, -0.5249802, 5.801366, 0, 0.9647059, 1, 1,
0.02581643, -0.05920447, 2.199753, 0, 0.9568627, 1, 1,
0.03042714, -2.087593, 2.960953, 0, 0.9529412, 1, 1,
0.03493983, 0.006735503, 1.281301, 0, 0.945098, 1, 1,
0.03512312, 0.1731355, -0.4757372, 0, 0.9411765, 1, 1,
0.03574689, -0.1736285, 2.600579, 0, 0.9333333, 1, 1,
0.03641035, -1.031809, 5.294946, 0, 0.9294118, 1, 1,
0.04165015, 1.267042, 1.388939, 0, 0.9215686, 1, 1,
0.04648793, -1.577779, 3.947673, 0, 0.9176471, 1, 1,
0.04740819, -1.105268, 3.75897, 0, 0.9098039, 1, 1,
0.05103248, 0.744147, -0.4749143, 0, 0.9058824, 1, 1,
0.05367541, -0.7027574, 2.589633, 0, 0.8980392, 1, 1,
0.05570839, -0.3162448, 3.132167, 0, 0.8901961, 1, 1,
0.06149715, 0.4696527, -0.9763678, 0, 0.8862745, 1, 1,
0.06247879, -0.07097951, 1.162923, 0, 0.8784314, 1, 1,
0.06378858, -0.7071992, 1.804327, 0, 0.8745098, 1, 1,
0.07439642, 0.01571122, 0.7500339, 0, 0.8666667, 1, 1,
0.08006743, -0.3503686, 3.613297, 0, 0.8627451, 1, 1,
0.08110935, -0.09090989, 1.732869, 0, 0.854902, 1, 1,
0.08412352, -1.094035, 2.857653, 0, 0.8509804, 1, 1,
0.08884878, 0.3959047, 1.047892, 0, 0.8431373, 1, 1,
0.08997612, -0.4135646, 1.984951, 0, 0.8392157, 1, 1,
0.09332414, -1.018114, 3.095987, 0, 0.8313726, 1, 1,
0.09351772, -0.2169753, 0.8979466, 0, 0.827451, 1, 1,
0.09598567, 0.2713085, -0.2616413, 0, 0.8196079, 1, 1,
0.09799384, 0.6582087, 0.9483465, 0, 0.8156863, 1, 1,
0.09864819, 0.02615457, 0.02483176, 0, 0.8078431, 1, 1,
0.1026861, 0.4693408, -1.032058, 0, 0.8039216, 1, 1,
0.1030848, -0.4411125, 2.517394, 0, 0.7960784, 1, 1,
0.1049863, -0.007298433, 2.153872, 0, 0.7882353, 1, 1,
0.1065054, 1.119477, 1.076025, 0, 0.7843137, 1, 1,
0.1073552, 0.8767778, -0.4880855, 0, 0.7764706, 1, 1,
0.1077411, -1.010775, 2.720747, 0, 0.772549, 1, 1,
0.1090113, -0.9990554, 1.553692, 0, 0.7647059, 1, 1,
0.1109669, 1.502999, 0.3466333, 0, 0.7607843, 1, 1,
0.1110386, -1.094819, 3.562573, 0, 0.7529412, 1, 1,
0.1132535, -0.8911312, 4.269552, 0, 0.7490196, 1, 1,
0.1178266, -2.19131, 3.924986, 0, 0.7411765, 1, 1,
0.119652, 0.5516735, -2.312911, 0, 0.7372549, 1, 1,
0.122802, -2.003179, 3.097952, 0, 0.7294118, 1, 1,
0.1290855, 1.689699, -0.1748188, 0, 0.7254902, 1, 1,
0.1299594, 0.9012375, -0.2627656, 0, 0.7176471, 1, 1,
0.1299654, -1.539306, 3.000414, 0, 0.7137255, 1, 1,
0.1326042, -0.03923664, 1.900054, 0, 0.7058824, 1, 1,
0.1378696, -0.1507521, 4.295947, 0, 0.6980392, 1, 1,
0.138357, -1.091248, 3.202746, 0, 0.6941177, 1, 1,
0.1391363, -0.3206186, 1.491866, 0, 0.6862745, 1, 1,
0.1403045, -0.8121839, 3.935407, 0, 0.682353, 1, 1,
0.1428144, 0.5799548, -1.318628, 0, 0.6745098, 1, 1,
0.1455385, 1.243398, -0.6840268, 0, 0.6705883, 1, 1,
0.1473894, -0.5294306, 3.78348, 0, 0.6627451, 1, 1,
0.1494578, 0.1089355, 0.8032106, 0, 0.6588235, 1, 1,
0.1519076, -0.8367187, 3.313124, 0, 0.6509804, 1, 1,
0.1556252, -1.276879, 3.870877, 0, 0.6470588, 1, 1,
0.1601096, -1.365394, 1.65271, 0, 0.6392157, 1, 1,
0.1636616, -0.6359658, 1.560004, 0, 0.6352941, 1, 1,
0.163753, 0.7270703, -2.046353, 0, 0.627451, 1, 1,
0.1668082, -0.2754028, 1.010428, 0, 0.6235294, 1, 1,
0.1680966, 0.002928188, 2.123872, 0, 0.6156863, 1, 1,
0.171823, 0.4585266, -0.1600231, 0, 0.6117647, 1, 1,
0.1724149, 0.8914729, -0.4816756, 0, 0.6039216, 1, 1,
0.1754833, -0.660441, 2.233047, 0, 0.5960785, 1, 1,
0.1798414, 0.3662577, 1.306027, 0, 0.5921569, 1, 1,
0.1804962, -1.005299, 4.964962, 0, 0.5843138, 1, 1,
0.1819734, -0.4187926, 1.728574, 0, 0.5803922, 1, 1,
0.18669, 0.9400797, 0.001739985, 0, 0.572549, 1, 1,
0.1867967, 0.7281809, -0.887862, 0, 0.5686275, 1, 1,
0.1879007, -0.1661164, 2.971985, 0, 0.5607843, 1, 1,
0.1963159, 1.537003, 0.1387181, 0, 0.5568628, 1, 1,
0.1993323, -0.1265353, 1.716949, 0, 0.5490196, 1, 1,
0.201295, 0.7336409, 0.1455843, 0, 0.5450981, 1, 1,
0.2020918, 0.6137633, -0.1582706, 0, 0.5372549, 1, 1,
0.2023341, 1.768435, -0.2348499, 0, 0.5333334, 1, 1,
0.2032264, 0.4610092, 0.8109751, 0, 0.5254902, 1, 1,
0.2061903, 0.4378862, 0.5712789, 0, 0.5215687, 1, 1,
0.2103862, 0.07678173, -0.189604, 0, 0.5137255, 1, 1,
0.2158905, -0.1538615, 3.262255, 0, 0.509804, 1, 1,
0.216799, 0.3328952, 2.224502, 0, 0.5019608, 1, 1,
0.2178039, -0.09116477, 0.3628208, 0, 0.4941176, 1, 1,
0.2196679, 0.375382, 1.123576, 0, 0.4901961, 1, 1,
0.2201677, 0.2422492, 2.518621, 0, 0.4823529, 1, 1,
0.2219539, 0.1179087, 1.920599, 0, 0.4784314, 1, 1,
0.2246052, 0.8003888, 0.06702998, 0, 0.4705882, 1, 1,
0.2250651, 0.9157689, 0.9520196, 0, 0.4666667, 1, 1,
0.2307246, -0.9489045, 0.5029567, 0, 0.4588235, 1, 1,
0.2322606, 1.323323, 0.5652162, 0, 0.454902, 1, 1,
0.2337222, 0.1603379, 0.5098053, 0, 0.4470588, 1, 1,
0.2349407, -2.424136, 2.073708, 0, 0.4431373, 1, 1,
0.2364784, -0.5876071, 0.5384519, 0, 0.4352941, 1, 1,
0.2394556, 1.372735, -0.2780342, 0, 0.4313726, 1, 1,
0.2453225, 0.1420682, 1.806674, 0, 0.4235294, 1, 1,
0.2485773, -0.3155996, 2.677096, 0, 0.4196078, 1, 1,
0.2488301, -0.4113565, 0.514625, 0, 0.4117647, 1, 1,
0.2489579, 0.8588653, -1.093277, 0, 0.4078431, 1, 1,
0.2508865, -0.3234042, 2.811353, 0, 0.4, 1, 1,
0.2524009, -0.8479432, 2.832355, 0, 0.3921569, 1, 1,
0.2541435, 1.025114, -0.3431579, 0, 0.3882353, 1, 1,
0.2555348, 1.613597, 0.2149246, 0, 0.3803922, 1, 1,
0.2565809, 1.136235, 0.2824481, 0, 0.3764706, 1, 1,
0.2620086, -0.335476, 2.367264, 0, 0.3686275, 1, 1,
0.2644757, -0.5048923, 2.583624, 0, 0.3647059, 1, 1,
0.2655715, -0.7895417, 2.504809, 0, 0.3568628, 1, 1,
0.2726081, -0.5225906, 2.036047, 0, 0.3529412, 1, 1,
0.2736131, 0.9714752, 1.215639, 0, 0.345098, 1, 1,
0.2741115, 0.2592797, -0.411242, 0, 0.3411765, 1, 1,
0.2797311, -0.708709, 2.004609, 0, 0.3333333, 1, 1,
0.2935033, 1.913061, 2.479653, 0, 0.3294118, 1, 1,
0.2986993, -0.9253321, 2.741652, 0, 0.3215686, 1, 1,
0.2996387, -1.873338, 3.384892, 0, 0.3176471, 1, 1,
0.3031246, 0.7582871, 0.9086463, 0, 0.3098039, 1, 1,
0.3032786, 0.2227398, 0.2211562, 0, 0.3058824, 1, 1,
0.312394, 0.1440101, 1.700156, 0, 0.2980392, 1, 1,
0.3128164, -1.460513, 3.260766, 0, 0.2901961, 1, 1,
0.3133535, 1.276159, 0.6856215, 0, 0.2862745, 1, 1,
0.3204619, 1.189041, 0.9891008, 0, 0.2784314, 1, 1,
0.3205497, -0.8298135, 2.528406, 0, 0.2745098, 1, 1,
0.3229458, -0.2649066, 1.345517, 0, 0.2666667, 1, 1,
0.3248946, 0.345715, 2.60961, 0, 0.2627451, 1, 1,
0.3251607, -0.2931903, 1.41272, 0, 0.254902, 1, 1,
0.3258428, 2.451126, 1.581887, 0, 0.2509804, 1, 1,
0.3270926, 0.1487625, 1.285931, 0, 0.2431373, 1, 1,
0.3302915, -1.487355, 1.400141, 0, 0.2392157, 1, 1,
0.3313677, -0.7455044, 3.396106, 0, 0.2313726, 1, 1,
0.3316079, -0.8708928, 3.290463, 0, 0.227451, 1, 1,
0.3362776, 0.2174941, 2.792301, 0, 0.2196078, 1, 1,
0.3381126, 0.202481, 0.3176689, 0, 0.2156863, 1, 1,
0.3437515, -0.4473257, 2.924585, 0, 0.2078431, 1, 1,
0.3444823, -0.3562813, 3.18357, 0, 0.2039216, 1, 1,
0.34755, 0.8213583, 1.160109, 0, 0.1960784, 1, 1,
0.349021, -0.3626298, 2.637579, 0, 0.1882353, 1, 1,
0.3521154, -2.312713, 2.897022, 0, 0.1843137, 1, 1,
0.3540742, -0.5741068, 1.706218, 0, 0.1764706, 1, 1,
0.3544029, -0.01522627, 1.570955, 0, 0.172549, 1, 1,
0.3549782, 1.628905, -1.966116, 0, 0.1647059, 1, 1,
0.3562399, 0.2839582, 2.153576, 0, 0.1607843, 1, 1,
0.3568357, -0.8891151, 2.942777, 0, 0.1529412, 1, 1,
0.3577636, -2.331907, 1.881144, 0, 0.1490196, 1, 1,
0.3583729, 0.1071921, 3.523583, 0, 0.1411765, 1, 1,
0.3636832, 0.2557575, 2.435527, 0, 0.1372549, 1, 1,
0.367483, -0.02233547, 1.487843, 0, 0.1294118, 1, 1,
0.3683745, 0.3312452, 3.021012, 0, 0.1254902, 1, 1,
0.3701204, 0.2720332, 1.166911, 0, 0.1176471, 1, 1,
0.3703841, -0.9505674, 3.540989, 0, 0.1137255, 1, 1,
0.3715137, 1.550423, -0.2651782, 0, 0.1058824, 1, 1,
0.3747805, 0.2556957, 3.068904, 0, 0.09803922, 1, 1,
0.3926296, 0.2969542, 1.233976, 0, 0.09411765, 1, 1,
0.3984507, -0.1040599, 0.6599981, 0, 0.08627451, 1, 1,
0.3990729, -0.4639696, 1.529398, 0, 0.08235294, 1, 1,
0.4006639, -0.4070319, 2.964345, 0, 0.07450981, 1, 1,
0.4014758, 0.06111086, 2.763758, 0, 0.07058824, 1, 1,
0.4019949, -1.503675, 3.425499, 0, 0.0627451, 1, 1,
0.4223337, 0.751262, 1.557505, 0, 0.05882353, 1, 1,
0.4227023, 0.8344331, 1.454337, 0, 0.05098039, 1, 1,
0.4238787, -1.0624, 2.376889, 0, 0.04705882, 1, 1,
0.4272808, 0.7952282, 0.489134, 0, 0.03921569, 1, 1,
0.4354634, 0.3397067, 1.33078, 0, 0.03529412, 1, 1,
0.4377935, -1.20882, 2.630718, 0, 0.02745098, 1, 1,
0.4404557, -0.0376821, -0.5235541, 0, 0.02352941, 1, 1,
0.4458187, -0.266158, 1.112398, 0, 0.01568628, 1, 1,
0.4464355, 0.6151131, -0.4599202, 0, 0.01176471, 1, 1,
0.4538815, 0.768438, 0.5312233, 0, 0.003921569, 1, 1,
0.4541293, -0.9039087, 2.665601, 0.003921569, 0, 1, 1,
0.4569008, -0.5458741, 2.259807, 0.007843138, 0, 1, 1,
0.4582979, -0.7589455, 2.132292, 0.01568628, 0, 1, 1,
0.4591449, -2.124278, 3.224384, 0.01960784, 0, 1, 1,
0.4592111, -1.034172, 4.604094, 0.02745098, 0, 1, 1,
0.4642587, 0.4497691, 0.6699072, 0.03137255, 0, 1, 1,
0.4661044, 0.8982426, 2.580133, 0.03921569, 0, 1, 1,
0.4682281, -0.2894542, 1.68489, 0.04313726, 0, 1, 1,
0.470016, 0.8846437, -1.51371, 0.05098039, 0, 1, 1,
0.4731646, -0.6708294, 3.411669, 0.05490196, 0, 1, 1,
0.4743392, 0.7382639, 0.7863746, 0.0627451, 0, 1, 1,
0.4746497, 0.1992505, 1.229103, 0.06666667, 0, 1, 1,
0.4774686, -0.6722238, 3.029454, 0.07450981, 0, 1, 1,
0.484331, 1.576264, 0.5791708, 0.07843138, 0, 1, 1,
0.4898804, -0.04758116, 1.580137, 0.08627451, 0, 1, 1,
0.4909188, -2.299181, 2.79331, 0.09019608, 0, 1, 1,
0.4937343, -0.3193689, 2.779593, 0.09803922, 0, 1, 1,
0.4957905, 0.5202084, -0.1341784, 0.1058824, 0, 1, 1,
0.4989493, -0.5865631, 2.943944, 0.1098039, 0, 1, 1,
0.4993302, 0.4815357, 0.4915863, 0.1176471, 0, 1, 1,
0.5004382, -1.675131, 2.333084, 0.1215686, 0, 1, 1,
0.5033365, 0.4079926, 1.240486, 0.1294118, 0, 1, 1,
0.5116411, -0.2434376, 0.7558016, 0.1333333, 0, 1, 1,
0.5138078, 0.1030537, 1.652598, 0.1411765, 0, 1, 1,
0.5158185, 0.3483739, 0.9690031, 0.145098, 0, 1, 1,
0.5184915, 0.7648999, 2.432193, 0.1529412, 0, 1, 1,
0.5190901, 0.120872, 1.368911, 0.1568628, 0, 1, 1,
0.5228395, 0.1708307, 0.3969699, 0.1647059, 0, 1, 1,
0.5230271, -2.170038, 2.582183, 0.1686275, 0, 1, 1,
0.5243464, -0.6131144, 1.257963, 0.1764706, 0, 1, 1,
0.5257497, -0.3044144, 1.709229, 0.1803922, 0, 1, 1,
0.5295043, 0.6761545, -0.1857543, 0.1882353, 0, 1, 1,
0.5314776, -0.8671278, 2.398868, 0.1921569, 0, 1, 1,
0.5371265, -1.643216, 3.419473, 0.2, 0, 1, 1,
0.5381582, 1.359784, 0.9720485, 0.2078431, 0, 1, 1,
0.540634, 0.7535509, -0.8402361, 0.2117647, 0, 1, 1,
0.5412316, -0.4319409, 1.18032, 0.2196078, 0, 1, 1,
0.5437708, -0.2169625, 1.150589, 0.2235294, 0, 1, 1,
0.5451824, -0.8181, 4.258947, 0.2313726, 0, 1, 1,
0.5465491, 1.059752, -0.2829238, 0.2352941, 0, 1, 1,
0.5468006, -0.2638233, 1.839709, 0.2431373, 0, 1, 1,
0.5478461, -1.268577, 2.292306, 0.2470588, 0, 1, 1,
0.5489896, -0.5795402, 2.064522, 0.254902, 0, 1, 1,
0.5495704, -0.6708924, 0.07693001, 0.2588235, 0, 1, 1,
0.5514243, -1.068977, 2.964373, 0.2666667, 0, 1, 1,
0.5536919, 0.8801959, -0.0753638, 0.2705882, 0, 1, 1,
0.5610866, -0.05152528, -1.149695, 0.2784314, 0, 1, 1,
0.5638447, 0.9260399, 0.6920236, 0.282353, 0, 1, 1,
0.5643116, -0.06095766, 1.881936, 0.2901961, 0, 1, 1,
0.5727364, -1.379096, 2.407147, 0.2941177, 0, 1, 1,
0.5777177, -0.164739, 1.258049, 0.3019608, 0, 1, 1,
0.5808606, 0.1088565, 1.685845, 0.3098039, 0, 1, 1,
0.5851603, 2.307698, -1.699099, 0.3137255, 0, 1, 1,
0.5866771, 0.04082306, 2.408019, 0.3215686, 0, 1, 1,
0.586724, -1.148171, 3.905211, 0.3254902, 0, 1, 1,
0.5897875, -0.487151, 2.7974, 0.3333333, 0, 1, 1,
0.5908728, 0.2583806, 2.42515, 0.3372549, 0, 1, 1,
0.5943891, -0.8478183, 1.906056, 0.345098, 0, 1, 1,
0.597676, -1.595802, 1.492709, 0.3490196, 0, 1, 1,
0.6094127, 0.2919585, -0.5669153, 0.3568628, 0, 1, 1,
0.6107053, -2.181755, 3.571713, 0.3607843, 0, 1, 1,
0.6126086, -0.3586676, 0.8083749, 0.3686275, 0, 1, 1,
0.6136716, 0.7645566, 0.3713613, 0.372549, 0, 1, 1,
0.6141995, -0.5455713, 2.131546, 0.3803922, 0, 1, 1,
0.6157815, -0.02685772, 2.039642, 0.3843137, 0, 1, 1,
0.6199257, 1.160483, 0.4163552, 0.3921569, 0, 1, 1,
0.6236084, -0.55762, 4.174234, 0.3960784, 0, 1, 1,
0.6283964, 0.8347376, 1.51837, 0.4039216, 0, 1, 1,
0.6325678, 1.82939, -0.7247255, 0.4117647, 0, 1, 1,
0.6397256, 1.938354, 1.018567, 0.4156863, 0, 1, 1,
0.6400366, -0.3600389, 2.275931, 0.4235294, 0, 1, 1,
0.6420379, 1.401172, 3.024984, 0.427451, 0, 1, 1,
0.6494842, -0.9336713, 2.666718, 0.4352941, 0, 1, 1,
0.6500437, 0.4928202, 0.3744034, 0.4392157, 0, 1, 1,
0.6521882, -0.7359169, 2.003084, 0.4470588, 0, 1, 1,
0.6525744, 0.6996098, 0.5395107, 0.4509804, 0, 1, 1,
0.6569836, 0.3012221, -0.3544826, 0.4588235, 0, 1, 1,
0.6584811, 0.5021163, -0.03213187, 0.4627451, 0, 1, 1,
0.6587988, -1.533932, 2.9358, 0.4705882, 0, 1, 1,
0.6587989, -0.6443871, 2.6376, 0.4745098, 0, 1, 1,
0.6634181, -0.8149833, 0.2441432, 0.4823529, 0, 1, 1,
0.665933, -0.5002937, 2.581113, 0.4862745, 0, 1, 1,
0.6697228, 0.1083923, 2.27989, 0.4941176, 0, 1, 1,
0.6704438, 0.05730782, 1.976162, 0.5019608, 0, 1, 1,
0.6727445, 0.06827805, 0.08454046, 0.5058824, 0, 1, 1,
0.6743705, -1.19792, 2.965039, 0.5137255, 0, 1, 1,
0.679183, 0.8172529, 0.6901829, 0.5176471, 0, 1, 1,
0.6811378, 0.06212765, 2.885816, 0.5254902, 0, 1, 1,
0.6825758, -2.694554, 2.324103, 0.5294118, 0, 1, 1,
0.685906, -0.6167145, 4.536005, 0.5372549, 0, 1, 1,
0.6881625, -0.187148, 0.3459995, 0.5411765, 0, 1, 1,
0.696528, -0.4981099, 0.8895806, 0.5490196, 0, 1, 1,
0.6978267, 0.4262862, 1.110367, 0.5529412, 0, 1, 1,
0.6994967, 0.5976764, 0.2328546, 0.5607843, 0, 1, 1,
0.7009298, 0.1109418, 1.429294, 0.5647059, 0, 1, 1,
0.701778, -0.4800853, 0.7815576, 0.572549, 0, 1, 1,
0.7023839, -1.757562, 1.980329, 0.5764706, 0, 1, 1,
0.7057466, 2.02313, -0.0567334, 0.5843138, 0, 1, 1,
0.7065995, -0.2445004, -0.5657192, 0.5882353, 0, 1, 1,
0.7079318, -1.323853, 2.935866, 0.5960785, 0, 1, 1,
0.7086974, -1.412325, 2.414772, 0.6039216, 0, 1, 1,
0.7105652, 0.1599612, 1.723286, 0.6078432, 0, 1, 1,
0.7180037, 0.435927, 1.71594, 0.6156863, 0, 1, 1,
0.7213569, -0.1858219, 0.7972276, 0.6196079, 0, 1, 1,
0.7249424, -0.6702453, 0.8446852, 0.627451, 0, 1, 1,
0.7258753, 0.8217142, 0.5788029, 0.6313726, 0, 1, 1,
0.7271636, 0.6529219, 1.653419, 0.6392157, 0, 1, 1,
0.7274326, 0.3831774, 1.150009, 0.6431373, 0, 1, 1,
0.7359564, 0.528057, 0.7472927, 0.6509804, 0, 1, 1,
0.7424537, 0.2720086, 2.030254, 0.654902, 0, 1, 1,
0.7522119, -0.3389378, 1.318567, 0.6627451, 0, 1, 1,
0.7572587, -0.2448193, 0.1014824, 0.6666667, 0, 1, 1,
0.7634687, 0.2129622, 1.182806, 0.6745098, 0, 1, 1,
0.7662327, -0.4173754, 2.923415, 0.6784314, 0, 1, 1,
0.7723529, -0.8908587, 0.8498278, 0.6862745, 0, 1, 1,
0.7760555, 1.625414, 0.5155924, 0.6901961, 0, 1, 1,
0.7800841, 0.2665726, -1.168291, 0.6980392, 0, 1, 1,
0.7804707, 1.071018, 0.0794649, 0.7058824, 0, 1, 1,
0.7822409, 1.321085, -0.5905902, 0.7098039, 0, 1, 1,
0.7824517, 0.7176608, 1.355477, 0.7176471, 0, 1, 1,
0.7843567, -0.100053, 1.792066, 0.7215686, 0, 1, 1,
0.7859532, -0.9815055, 0.9503837, 0.7294118, 0, 1, 1,
0.7860538, -0.4708778, 2.410697, 0.7333333, 0, 1, 1,
0.7882021, -0.001573622, -0.1371824, 0.7411765, 0, 1, 1,
0.7882638, -0.3891111, -0.684468, 0.7450981, 0, 1, 1,
0.7909395, -1.163556, 2.879267, 0.7529412, 0, 1, 1,
0.7914193, -1.156556, 1.099742, 0.7568628, 0, 1, 1,
0.7960214, -0.378372, 0.9660938, 0.7647059, 0, 1, 1,
0.7971677, 0.00565971, 1.008519, 0.7686275, 0, 1, 1,
0.7992557, 0.1516331, 1.769283, 0.7764706, 0, 1, 1,
0.7995469, 2.0972, 0.2707977, 0.7803922, 0, 1, 1,
0.8001711, 1.080923, -0.4260795, 0.7882353, 0, 1, 1,
0.8018355, 1.511659, -0.6828487, 0.7921569, 0, 1, 1,
0.8019959, -0.734108, 1.090039, 0.8, 0, 1, 1,
0.8057235, -0.978192, 2.726044, 0.8078431, 0, 1, 1,
0.8112118, -0.6894374, 1.255095, 0.8117647, 0, 1, 1,
0.8155881, 0.6591565, -1.137346, 0.8196079, 0, 1, 1,
0.8220578, -0.7456105, 2.226607, 0.8235294, 0, 1, 1,
0.8229849, -1.514737, 3.931097, 0.8313726, 0, 1, 1,
0.8282217, 0.3274338, -0.4980729, 0.8352941, 0, 1, 1,
0.8335057, 0.7123234, 1.188847, 0.8431373, 0, 1, 1,
0.8391927, 1.789996, 0.3677813, 0.8470588, 0, 1, 1,
0.8397494, 1.855752, 0.1955252, 0.854902, 0, 1, 1,
0.8398169, -0.557971, 1.724692, 0.8588235, 0, 1, 1,
0.8440108, 0.5616567, 2.630002, 0.8666667, 0, 1, 1,
0.8440963, 0.7394273, 1.723006, 0.8705882, 0, 1, 1,
0.8441384, -0.1412896, 1.243278, 0.8784314, 0, 1, 1,
0.8444952, 1.961749, -0.0278051, 0.8823529, 0, 1, 1,
0.8482515, -0.7536884, 1.108142, 0.8901961, 0, 1, 1,
0.8493146, -1.02937, 3.391657, 0.8941177, 0, 1, 1,
0.8512825, 1.596447, 1.860826, 0.9019608, 0, 1, 1,
0.8580168, -1.912974, 1.957203, 0.9098039, 0, 1, 1,
0.8581787, -0.4558331, 2.773655, 0.9137255, 0, 1, 1,
0.8589397, 0.3013915, 0.5596743, 0.9215686, 0, 1, 1,
0.8598459, -0.0374328, 1.329634, 0.9254902, 0, 1, 1,
0.8644997, 1.052715, 1.791059, 0.9333333, 0, 1, 1,
0.8650797, -0.2493694, 2.600703, 0.9372549, 0, 1, 1,
0.8761807, -0.5704081, 1.741983, 0.945098, 0, 1, 1,
0.8792314, 1.225421, 1.35586, 0.9490196, 0, 1, 1,
0.8858901, -0.4308234, 1.086412, 0.9568627, 0, 1, 1,
0.9014668, 1.102031, 0.7107368, 0.9607843, 0, 1, 1,
0.9222247, -0.980403, 3.215266, 0.9686275, 0, 1, 1,
0.9263496, 0.9007822, 1.283606, 0.972549, 0, 1, 1,
0.9286013, 0.1030491, 1.989777, 0.9803922, 0, 1, 1,
0.9344951, -0.7609197, 1.060781, 0.9843137, 0, 1, 1,
0.9373741, -0.9922411, 3.746668, 0.9921569, 0, 1, 1,
0.9394454, 0.3531795, 2.507712, 0.9960784, 0, 1, 1,
0.9398977, -0.2781494, 1.570775, 1, 0, 0.9960784, 1,
0.9407882, -1.075242, 3.108859, 1, 0, 0.9882353, 1,
0.9454829, -0.1180177, 0.9616774, 1, 0, 0.9843137, 1,
0.9465517, 1.426414, 2.201209, 1, 0, 0.9764706, 1,
0.9547142, -1.901728, 0.6204109, 1, 0, 0.972549, 1,
0.9616525, -0.08125856, 3.096141, 1, 0, 0.9647059, 1,
0.9617863, 1.762698, 1.206422, 1, 0, 0.9607843, 1,
0.9633287, -0.4035844, 0.8085344, 1, 0, 0.9529412, 1,
0.9636164, 0.2356491, -0.5507656, 1, 0, 0.9490196, 1,
0.970174, 0.39077, -0.2768527, 1, 0, 0.9411765, 1,
0.9705713, 0.2914326, -0.1416045, 1, 0, 0.9372549, 1,
0.9744002, 0.4773109, 2.112392, 1, 0, 0.9294118, 1,
0.9778007, 0.3116508, 1.768392, 1, 0, 0.9254902, 1,
0.9809343, -1.219414, 1.976627, 1, 0, 0.9176471, 1,
0.9843101, 0.05160638, -0.1058337, 1, 0, 0.9137255, 1,
0.9878657, -1.174376, 1.479214, 1, 0, 0.9058824, 1,
0.99719, 1.277092, -0.1942611, 1, 0, 0.9019608, 1,
1.001707, 0.7015641, 2.337835, 1, 0, 0.8941177, 1,
1.005547, 0.9975978, 1.036988, 1, 0, 0.8862745, 1,
1.006044, -0.1194362, 1.305829, 1, 0, 0.8823529, 1,
1.006182, -0.4182646, 2.193621, 1, 0, 0.8745098, 1,
1.007133, -1.656532, 1.917263, 1, 0, 0.8705882, 1,
1.007365, -0.6175802, 1.674123, 1, 0, 0.8627451, 1,
1.009144, 1.002162, 1.576661, 1, 0, 0.8588235, 1,
1.010331, -0.2423634, 3.979985, 1, 0, 0.8509804, 1,
1.010811, 0.1254216, 1.385565, 1, 0, 0.8470588, 1,
1.013859, 0.7928382, 0.958284, 1, 0, 0.8392157, 1,
1.01407, 0.4199077, 0.451917, 1, 0, 0.8352941, 1,
1.016668, -0.4157432, 3.181019, 1, 0, 0.827451, 1,
1.020531, -1.45314, 3.623761, 1, 0, 0.8235294, 1,
1.023413, -0.5950316, 1.237231, 1, 0, 0.8156863, 1,
1.028142, 1.156498, 1.509805, 1, 0, 0.8117647, 1,
1.036679, -0.1674557, 0.3945443, 1, 0, 0.8039216, 1,
1.044584, -1.647133, 2.802477, 1, 0, 0.7960784, 1,
1.048198, 0.930444, 1.586779, 1, 0, 0.7921569, 1,
1.04834, -0.01554616, 1.801363, 1, 0, 0.7843137, 1,
1.04903, 0.7669349, 0.486906, 1, 0, 0.7803922, 1,
1.060405, 1.208402, 0.2152377, 1, 0, 0.772549, 1,
1.072027, 0.3277243, 1.982678, 1, 0, 0.7686275, 1,
1.080705, -0.359981, 0.3990442, 1, 0, 0.7607843, 1,
1.08214, 1.159322, -0.8393608, 1, 0, 0.7568628, 1,
1.08337, 2.267079, 1.683539, 1, 0, 0.7490196, 1,
1.089729, -0.4618788, 2.401391, 1, 0, 0.7450981, 1,
1.090032, 1.180477, -0.2452649, 1, 0, 0.7372549, 1,
1.094343, 0.3210365, 3.209555, 1, 0, 0.7333333, 1,
1.099408, -1.42382, 1.308239, 1, 0, 0.7254902, 1,
1.125253, -0.9731421, 1.871668, 1, 0, 0.7215686, 1,
1.127058, 0.714819, 0.7579818, 1, 0, 0.7137255, 1,
1.130256, -1.774368, 2.449652, 1, 0, 0.7098039, 1,
1.135618, -0.9202427, 1.670383, 1, 0, 0.7019608, 1,
1.155794, -0.3801043, 0.6673896, 1, 0, 0.6941177, 1,
1.16134, -0.4495276, 2.163198, 1, 0, 0.6901961, 1,
1.161849, -0.04673771, 0.3429365, 1, 0, 0.682353, 1,
1.162314, 0.4814133, 1.832845, 1, 0, 0.6784314, 1,
1.163511, 1.551243, 2.201499, 1, 0, 0.6705883, 1,
1.164777, 0.6027156, 1.142972, 1, 0, 0.6666667, 1,
1.165975, -1.681949, 4.556715, 1, 0, 0.6588235, 1,
1.17271, 0.2346381, 3.500449, 1, 0, 0.654902, 1,
1.184924, -0.5744722, 2.613156, 1, 0, 0.6470588, 1,
1.196874, -0.265775, 0.6475294, 1, 0, 0.6431373, 1,
1.208781, 1.176654, -0.905057, 1, 0, 0.6352941, 1,
1.21356, 1.378963, 0.5254158, 1, 0, 0.6313726, 1,
1.217218, 1.047696, 0.6549755, 1, 0, 0.6235294, 1,
1.226895, -0.5621961, 2.966655, 1, 0, 0.6196079, 1,
1.229982, -1.059673, 2.065069, 1, 0, 0.6117647, 1,
1.231089, -0.9707102, 2.750645, 1, 0, 0.6078432, 1,
1.231873, -0.4152608, 2.328082, 1, 0, 0.6, 1,
1.241047, 0.49116, 0.8694137, 1, 0, 0.5921569, 1,
1.250591, 0.3901317, 0.7783733, 1, 0, 0.5882353, 1,
1.254098, -1.566769, 2.341752, 1, 0, 0.5803922, 1,
1.257798, -0.1957157, 2.156356, 1, 0, 0.5764706, 1,
1.257892, -2.261045, 4.046782, 1, 0, 0.5686275, 1,
1.2598, -0.3632772, 0.9107474, 1, 0, 0.5647059, 1,
1.2732, -0.2068434, 2.217497, 1, 0, 0.5568628, 1,
1.275285, 0.4115876, 0.5104119, 1, 0, 0.5529412, 1,
1.279328, 0.5014646, 1.996861, 1, 0, 0.5450981, 1,
1.284352, -1.269383, 1.135282, 1, 0, 0.5411765, 1,
1.292188, -0.3023959, 2.580675, 1, 0, 0.5333334, 1,
1.301053, -1.361274, 0.5913755, 1, 0, 0.5294118, 1,
1.303545, 0.7043226, 2.858386, 1, 0, 0.5215687, 1,
1.316275, -0.7520724, 4.047233, 1, 0, 0.5176471, 1,
1.319351, 0.568465, 0.4660566, 1, 0, 0.509804, 1,
1.32598, -1.043527, 3.566632, 1, 0, 0.5058824, 1,
1.344888, -0.3636907, 1.309866, 1, 0, 0.4980392, 1,
1.354602, -0.7096435, 0.7592227, 1, 0, 0.4901961, 1,
1.364548, -2.003275, 3.332931, 1, 0, 0.4862745, 1,
1.365131, -0.9090777, 2.221287, 1, 0, 0.4784314, 1,
1.372852, 1.552416, 0.8942466, 1, 0, 0.4745098, 1,
1.383478, 0.8811996, 2.27915, 1, 0, 0.4666667, 1,
1.387845, -2.519886, 1.809603, 1, 0, 0.4627451, 1,
1.390775, 1.694833, 0.7264969, 1, 0, 0.454902, 1,
1.406902, -0.6979278, 2.816352, 1, 0, 0.4509804, 1,
1.408178, -0.5234081, 1.55861, 1, 0, 0.4431373, 1,
1.428463, -0.2024178, 2.854386, 1, 0, 0.4392157, 1,
1.432266, 0.1356661, 0.03371561, 1, 0, 0.4313726, 1,
1.452971, -0.2661832, 1.631348, 1, 0, 0.427451, 1,
1.456908, -0.8774081, 1.890937, 1, 0, 0.4196078, 1,
1.471036, 0.681688, 1.336491, 1, 0, 0.4156863, 1,
1.473385, -0.8368661, 2.026672, 1, 0, 0.4078431, 1,
1.479073, -0.7480793, 1.802294, 1, 0, 0.4039216, 1,
1.485045, 0.7982816, -0.2892628, 1, 0, 0.3960784, 1,
1.493097, 0.1697943, 0.872871, 1, 0, 0.3882353, 1,
1.496343, 0.4961938, 0.6617223, 1, 0, 0.3843137, 1,
1.506443, 1.067044, 1.369877, 1, 0, 0.3764706, 1,
1.523996, -0.4837967, 2.9821, 1, 0, 0.372549, 1,
1.541834, -0.9756536, 0.8055741, 1, 0, 0.3647059, 1,
1.543844, 0.2405063, 1.639332, 1, 0, 0.3607843, 1,
1.572159, -0.1127599, 1.578792, 1, 0, 0.3529412, 1,
1.578254, 0.04375765, 1.593862, 1, 0, 0.3490196, 1,
1.588245, -0.164967, 0.6969006, 1, 0, 0.3411765, 1,
1.598989, 0.6294022, 2.388596, 1, 0, 0.3372549, 1,
1.601268, 0.896181, 0.6086959, 1, 0, 0.3294118, 1,
1.604892, 0.2513296, 1.367829, 1, 0, 0.3254902, 1,
1.615655, -0.2868228, 1.205161, 1, 0, 0.3176471, 1,
1.618174, 1.088507, 1.529657, 1, 0, 0.3137255, 1,
1.646, -0.9395475, 3.03733, 1, 0, 0.3058824, 1,
1.646624, 0.7907701, 1.313648, 1, 0, 0.2980392, 1,
1.649819, -0.00976376, 2.386423, 1, 0, 0.2941177, 1,
1.651135, -1.219131, 4.213912, 1, 0, 0.2862745, 1,
1.655251, -0.1184927, 1.792518, 1, 0, 0.282353, 1,
1.668491, -0.1795501, 2.534491, 1, 0, 0.2745098, 1,
1.668597, 1.029846, 0.1839257, 1, 0, 0.2705882, 1,
1.670133, 0.4030046, 0.8494722, 1, 0, 0.2627451, 1,
1.670178, -1.131919, 3.150963, 1, 0, 0.2588235, 1,
1.67077, 1.480363, 1.014335, 1, 0, 0.2509804, 1,
1.701778, -1.081987, 2.312984, 1, 0, 0.2470588, 1,
1.736047, 1.359378, -1.060128, 1, 0, 0.2392157, 1,
1.75615, -0.3578717, 1.282126, 1, 0, 0.2352941, 1,
1.769943, -0.01261228, 0.5211183, 1, 0, 0.227451, 1,
1.779308, 1.916758, 0.9393898, 1, 0, 0.2235294, 1,
1.788702, -0.8854735, 1.892998, 1, 0, 0.2156863, 1,
1.860496, 0.1574236, 0.008666012, 1, 0, 0.2117647, 1,
1.890761, 1.389797, 1.342904, 1, 0, 0.2039216, 1,
1.921912, -1.139937, 0.8457121, 1, 0, 0.1960784, 1,
1.982543, 0.5482461, -0.9969689, 1, 0, 0.1921569, 1,
2.005704, -1.249484, 1.171541, 1, 0, 0.1843137, 1,
2.024752, -0.4593241, 2.685915, 1, 0, 0.1803922, 1,
2.02741, 0.1963157, 1.339523, 1, 0, 0.172549, 1,
2.02998, 1.063567, -0.7757571, 1, 0, 0.1686275, 1,
2.111245, 0.8835808, -1.036038, 1, 0, 0.1607843, 1,
2.117445, -1.092929, 3.135906, 1, 0, 0.1568628, 1,
2.128157, -0.4088286, 2.317559, 1, 0, 0.1490196, 1,
2.143079, 0.6426862, 2.067521, 1, 0, 0.145098, 1,
2.152978, 0.9578642, 2.38572, 1, 0, 0.1372549, 1,
2.170421, 0.2683682, 0.1156954, 1, 0, 0.1333333, 1,
2.180045, 0.9582628, 2.912227, 1, 0, 0.1254902, 1,
2.219123, 0.3715283, 2.001086, 1, 0, 0.1215686, 1,
2.234493, -0.3792319, 1.763934, 1, 0, 0.1137255, 1,
2.263955, 0.0435546, 1.791883, 1, 0, 0.1098039, 1,
2.269669, 1.068982, 1.866733, 1, 0, 0.1019608, 1,
2.356727, 0.4619836, 0.9887903, 1, 0, 0.09411765, 1,
2.392478, -1.304938, 0.3256421, 1, 0, 0.09019608, 1,
2.41369, 2.005161, 3.841396, 1, 0, 0.08235294, 1,
2.423068, -0.6867777, 2.417688, 1, 0, 0.07843138, 1,
2.436312, 0.5300097, 1.856605, 1, 0, 0.07058824, 1,
2.53893, -1.634343, 2.170124, 1, 0, 0.06666667, 1,
2.571612, 1.036505, 0.1487295, 1, 0, 0.05882353, 1,
2.581728, 1.328819, 0.8846202, 1, 0, 0.05490196, 1,
2.586325, 0.6462476, 1.785405, 1, 0, 0.04705882, 1,
2.678781, -1.356997, 2.478476, 1, 0, 0.04313726, 1,
2.747078, 0.1625707, 1.491883, 1, 0, 0.03529412, 1,
2.845119, -0.7695078, 0.1992702, 1, 0, 0.03137255, 1,
2.88215, -0.114841, -0.4792155, 1, 0, 0.02352941, 1,
3.001633, -0.8355207, 2.696839, 1, 0, 0.01960784, 1,
3.076147, 0.5735307, 0.2764126, 1, 0, 0.01176471, 1,
3.252574, -0.3041662, 0.5884669, 1, 0, 0.007843138, 1
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
0.2139087, -4.211407, -6.245501, 0, -0.5, 0.5, 0.5,
0.2139087, -4.211407, -6.245501, 1, -0.5, 0.5, 0.5,
0.2139087, -4.211407, -6.245501, 1, 1.5, 0.5, 0.5,
0.2139087, -4.211407, -6.245501, 0, 1.5, 0.5, 0.5
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
-3.854864, -0.03747427, -6.245501, 0, -0.5, 0.5, 0.5,
-3.854864, -0.03747427, -6.245501, 1, -0.5, 0.5, 0.5,
-3.854864, -0.03747427, -6.245501, 1, 1.5, 0.5, 0.5,
-3.854864, -0.03747427, -6.245501, 0, 1.5, 0.5, 0.5
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
-3.854864, -4.211407, 0.6509314, 0, -0.5, 0.5, 0.5,
-3.854864, -4.211407, 0.6509314, 1, -0.5, 0.5, 0.5,
-3.854864, -4.211407, 0.6509314, 1, 1.5, 0.5, 0.5,
-3.854864, -4.211407, 0.6509314, 0, 1.5, 0.5, 0.5
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
-2, -3.248192, -4.654016,
3, -3.248192, -4.654016,
-2, -3.248192, -4.654016,
-2, -3.408728, -4.919264,
-1, -3.248192, -4.654016,
-1, -3.408728, -4.919264,
0, -3.248192, -4.654016,
0, -3.408728, -4.919264,
1, -3.248192, -4.654016,
1, -3.408728, -4.919264,
2, -3.248192, -4.654016,
2, -3.408728, -4.919264,
3, -3.248192, -4.654016,
3, -3.408728, -4.919264
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
-2, -3.729799, -5.449759, 0, -0.5, 0.5, 0.5,
-2, -3.729799, -5.449759, 1, -0.5, 0.5, 0.5,
-2, -3.729799, -5.449759, 1, 1.5, 0.5, 0.5,
-2, -3.729799, -5.449759, 0, 1.5, 0.5, 0.5,
-1, -3.729799, -5.449759, 0, -0.5, 0.5, 0.5,
-1, -3.729799, -5.449759, 1, -0.5, 0.5, 0.5,
-1, -3.729799, -5.449759, 1, 1.5, 0.5, 0.5,
-1, -3.729799, -5.449759, 0, 1.5, 0.5, 0.5,
0, -3.729799, -5.449759, 0, -0.5, 0.5, 0.5,
0, -3.729799, -5.449759, 1, -0.5, 0.5, 0.5,
0, -3.729799, -5.449759, 1, 1.5, 0.5, 0.5,
0, -3.729799, -5.449759, 0, 1.5, 0.5, 0.5,
1, -3.729799, -5.449759, 0, -0.5, 0.5, 0.5,
1, -3.729799, -5.449759, 1, -0.5, 0.5, 0.5,
1, -3.729799, -5.449759, 1, 1.5, 0.5, 0.5,
1, -3.729799, -5.449759, 0, 1.5, 0.5, 0.5,
2, -3.729799, -5.449759, 0, -0.5, 0.5, 0.5,
2, -3.729799, -5.449759, 1, -0.5, 0.5, 0.5,
2, -3.729799, -5.449759, 1, 1.5, 0.5, 0.5,
2, -3.729799, -5.449759, 0, 1.5, 0.5, 0.5,
3, -3.729799, -5.449759, 0, -0.5, 0.5, 0.5,
3, -3.729799, -5.449759, 1, -0.5, 0.5, 0.5,
3, -3.729799, -5.449759, 1, 1.5, 0.5, 0.5,
3, -3.729799, -5.449759, 0, 1.5, 0.5, 0.5
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
-2.915917, -3, -4.654016,
-2.915917, 3, -4.654016,
-2.915917, -3, -4.654016,
-3.072408, -3, -4.919264,
-2.915917, -2, -4.654016,
-3.072408, -2, -4.919264,
-2.915917, -1, -4.654016,
-3.072408, -1, -4.919264,
-2.915917, 0, -4.654016,
-3.072408, 0, -4.919264,
-2.915917, 1, -4.654016,
-3.072408, 1, -4.919264,
-2.915917, 2, -4.654016,
-3.072408, 2, -4.919264,
-2.915917, 3, -4.654016,
-3.072408, 3, -4.919264
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
-3.38539, -3, -5.449759, 0, -0.5, 0.5, 0.5,
-3.38539, -3, -5.449759, 1, -0.5, 0.5, 0.5,
-3.38539, -3, -5.449759, 1, 1.5, 0.5, 0.5,
-3.38539, -3, -5.449759, 0, 1.5, 0.5, 0.5,
-3.38539, -2, -5.449759, 0, -0.5, 0.5, 0.5,
-3.38539, -2, -5.449759, 1, -0.5, 0.5, 0.5,
-3.38539, -2, -5.449759, 1, 1.5, 0.5, 0.5,
-3.38539, -2, -5.449759, 0, 1.5, 0.5, 0.5,
-3.38539, -1, -5.449759, 0, -0.5, 0.5, 0.5,
-3.38539, -1, -5.449759, 1, -0.5, 0.5, 0.5,
-3.38539, -1, -5.449759, 1, 1.5, 0.5, 0.5,
-3.38539, -1, -5.449759, 0, 1.5, 0.5, 0.5,
-3.38539, 0, -5.449759, 0, -0.5, 0.5, 0.5,
-3.38539, 0, -5.449759, 1, -0.5, 0.5, 0.5,
-3.38539, 0, -5.449759, 1, 1.5, 0.5, 0.5,
-3.38539, 0, -5.449759, 0, 1.5, 0.5, 0.5,
-3.38539, 1, -5.449759, 0, -0.5, 0.5, 0.5,
-3.38539, 1, -5.449759, 1, -0.5, 0.5, 0.5,
-3.38539, 1, -5.449759, 1, 1.5, 0.5, 0.5,
-3.38539, 1, -5.449759, 0, 1.5, 0.5, 0.5,
-3.38539, 2, -5.449759, 0, -0.5, 0.5, 0.5,
-3.38539, 2, -5.449759, 1, -0.5, 0.5, 0.5,
-3.38539, 2, -5.449759, 1, 1.5, 0.5, 0.5,
-3.38539, 2, -5.449759, 0, 1.5, 0.5, 0.5,
-3.38539, 3, -5.449759, 0, -0.5, 0.5, 0.5,
-3.38539, 3, -5.449759, 1, -0.5, 0.5, 0.5,
-3.38539, 3, -5.449759, 1, 1.5, 0.5, 0.5,
-3.38539, 3, -5.449759, 0, 1.5, 0.5, 0.5
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
-2.915917, -3.248192, -4,
-2.915917, -3.248192, 4,
-2.915917, -3.248192, -4,
-3.072408, -3.408728, -4,
-2.915917, -3.248192, -2,
-3.072408, -3.408728, -2,
-2.915917, -3.248192, 0,
-3.072408, -3.408728, 0,
-2.915917, -3.248192, 2,
-3.072408, -3.408728, 2,
-2.915917, -3.248192, 4,
-3.072408, -3.408728, 4
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
-3.38539, -3.729799, -4, 0, -0.5, 0.5, 0.5,
-3.38539, -3.729799, -4, 1, -0.5, 0.5, 0.5,
-3.38539, -3.729799, -4, 1, 1.5, 0.5, 0.5,
-3.38539, -3.729799, -4, 0, 1.5, 0.5, 0.5,
-3.38539, -3.729799, -2, 0, -0.5, 0.5, 0.5,
-3.38539, -3.729799, -2, 1, -0.5, 0.5, 0.5,
-3.38539, -3.729799, -2, 1, 1.5, 0.5, 0.5,
-3.38539, -3.729799, -2, 0, 1.5, 0.5, 0.5,
-3.38539, -3.729799, 0, 0, -0.5, 0.5, 0.5,
-3.38539, -3.729799, 0, 1, -0.5, 0.5, 0.5,
-3.38539, -3.729799, 0, 1, 1.5, 0.5, 0.5,
-3.38539, -3.729799, 0, 0, 1.5, 0.5, 0.5,
-3.38539, -3.729799, 2, 0, -0.5, 0.5, 0.5,
-3.38539, -3.729799, 2, 1, -0.5, 0.5, 0.5,
-3.38539, -3.729799, 2, 1, 1.5, 0.5, 0.5,
-3.38539, -3.729799, 2, 0, 1.5, 0.5, 0.5,
-3.38539, -3.729799, 4, 0, -0.5, 0.5, 0.5,
-3.38539, -3.729799, 4, 1, -0.5, 0.5, 0.5,
-3.38539, -3.729799, 4, 1, 1.5, 0.5, 0.5,
-3.38539, -3.729799, 4, 0, 1.5, 0.5, 0.5
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
-2.915917, -3.248192, -4.654016,
-2.915917, 3.173243, -4.654016,
-2.915917, -3.248192, 5.955879,
-2.915917, 3.173243, 5.955879,
-2.915917, -3.248192, -4.654016,
-2.915917, -3.248192, 5.955879,
-2.915917, 3.173243, -4.654016,
-2.915917, 3.173243, 5.955879,
-2.915917, -3.248192, -4.654016,
3.343734, -3.248192, -4.654016,
-2.915917, -3.248192, 5.955879,
3.343734, -3.248192, 5.955879,
-2.915917, 3.173243, -4.654016,
3.343734, 3.173243, -4.654016,
-2.915917, 3.173243, 5.955879,
3.343734, 3.173243, 5.955879,
3.343734, -3.248192, -4.654016,
3.343734, 3.173243, -4.654016,
3.343734, -3.248192, 5.955879,
3.343734, 3.173243, 5.955879,
3.343734, -3.248192, -4.654016,
3.343734, -3.248192, 5.955879,
3.343734, 3.173243, -4.654016,
3.343734, 3.173243, 5.955879
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
var radius = 7.418064;
var distance = 33.0038;
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
mvMatrix.translate( -0.2139087, 0.03747427, -0.6509314 );
mvMatrix.scale( 1.28131, 1.249029, 0.7559505 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.0038);
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
polyoxin_D<-read.table("polyoxin_D.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-polyoxin_D$V2
```

```
## Error in eval(expr, envir, enclos): object 'polyoxin_D' not found
```

```r
y<-polyoxin_D$V3
```

```
## Error in eval(expr, envir, enclos): object 'polyoxin_D' not found
```

```r
z<-polyoxin_D$V4
```

```
## Error in eval(expr, envir, enclos): object 'polyoxin_D' not found
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
-2.824757, -0.06435684, -1.410267, 0, 0, 1, 1, 1,
-2.680818, -0.8950999, -3.699077, 1, 0, 0, 1, 1,
-2.433571, -3.154676, -1.972546, 1, 0, 0, 1, 1,
-2.426351, -0.9474789, -1.119084, 1, 0, 0, 1, 1,
-2.350849, 1.946667, 0.7794864, 1, 0, 0, 1, 1,
-2.347494, -0.2017243, -1.951882, 1, 0, 0, 1, 1,
-2.232288, -0.9760178, -3.349912, 0, 0, 0, 1, 1,
-2.21557, -0.4312323, -1.464718, 0, 0, 0, 1, 1,
-2.117134, 0.2552641, -1.220987, 0, 0, 0, 1, 1,
-2.105179, -0.3496746, -2.023064, 0, 0, 0, 1, 1,
-2.09464, -1.246361, -1.813518, 0, 0, 0, 1, 1,
-2.077766, 0.3181253, -0.906986, 0, 0, 0, 1, 1,
-2.07493, 1.014848, -1.242768, 0, 0, 0, 1, 1,
-2.066985, 1.790963, -1.069438, 1, 1, 1, 1, 1,
-2.035509, 0.3366435, -1.618957, 1, 1, 1, 1, 1,
-2.030974, -0.433596, -2.631958, 1, 1, 1, 1, 1,
-2.024473, -0.3478471, -2.679627, 1, 1, 1, 1, 1,
-2.022464, 1.787997, -2.128562, 1, 1, 1, 1, 1,
-1.995285, 0.4660725, -2.400901, 1, 1, 1, 1, 1,
-1.995099, -0.4875889, -1.86379, 1, 1, 1, 1, 1,
-1.969733, 0.886813, -1.14143, 1, 1, 1, 1, 1,
-1.967995, 1.105075, -0.2625188, 1, 1, 1, 1, 1,
-1.948065, 0.1713784, -0.5510178, 1, 1, 1, 1, 1,
-1.928118, 0.2119799, -1.322583, 1, 1, 1, 1, 1,
-1.899814, -0.6707389, -1.783011, 1, 1, 1, 1, 1,
-1.891986, 0.7733013, -2.14863, 1, 1, 1, 1, 1,
-1.868372, -0.2178277, 0.7153776, 1, 1, 1, 1, 1,
-1.842637, -2.04063, -3.555131, 1, 1, 1, 1, 1,
-1.839245, -0.7332673, -0.2327614, 0, 0, 1, 1, 1,
-1.785711, 1.182075, -0.608274, 1, 0, 0, 1, 1,
-1.782691, -0.06286826, -1.870292, 1, 0, 0, 1, 1,
-1.777545, -0.9674389, -0.2923216, 1, 0, 0, 1, 1,
-1.766698, 2.289999, -1.636202, 1, 0, 0, 1, 1,
-1.765392, -0.7034208, -3.290518, 1, 0, 0, 1, 1,
-1.763578, -0.6590175, -0.7255437, 0, 0, 0, 1, 1,
-1.758201, 0.2147846, -2.164427, 0, 0, 0, 1, 1,
-1.749529, -0.1985366, -3.203609, 0, 0, 0, 1, 1,
-1.740508, 1.045765, -0.06485303, 0, 0, 0, 1, 1,
-1.734624, -1.135076, -3.607341, 0, 0, 0, 1, 1,
-1.709669, -0.1228761, -2.555601, 0, 0, 0, 1, 1,
-1.698243, -0.1869237, -1.116206, 0, 0, 0, 1, 1,
-1.685627, 0.6817517, -0.3141329, 1, 1, 1, 1, 1,
-1.68006, -1.137198, -1.881244, 1, 1, 1, 1, 1,
-1.657105, -0.06536465, -3.264468, 1, 1, 1, 1, 1,
-1.625022, -0.07653964, -2.498426, 1, 1, 1, 1, 1,
-1.620916, 0.9832093, 0.05941968, 1, 1, 1, 1, 1,
-1.592446, 1.659992, 0.2796393, 1, 1, 1, 1, 1,
-1.565196, -0.6915246, -0.4515905, 1, 1, 1, 1, 1,
-1.561933, 0.905432, -2.004811, 1, 1, 1, 1, 1,
-1.560754, -0.2984522, -2.143957, 1, 1, 1, 1, 1,
-1.560229, -0.6663754, -1.218636, 1, 1, 1, 1, 1,
-1.544522, -1.982544, -1.716445, 1, 1, 1, 1, 1,
-1.543022, 0.5260136, -0.8153546, 1, 1, 1, 1, 1,
-1.539436, 0.2869088, -0.2847453, 1, 1, 1, 1, 1,
-1.530043, -0.03429933, -1.011857, 1, 1, 1, 1, 1,
-1.518016, -1.070318, -2.196477, 1, 1, 1, 1, 1,
-1.515869, 0.6014394, -2.57407, 0, 0, 1, 1, 1,
-1.497625, 0.3104537, -2.108054, 1, 0, 0, 1, 1,
-1.494069, -0.1096694, -1.289481, 1, 0, 0, 1, 1,
-1.489517, -1.630105, -1.441505, 1, 0, 0, 1, 1,
-1.488507, 0.6419388, -0.366593, 1, 0, 0, 1, 1,
-1.472584, -0.244604, -2.385822, 1, 0, 0, 1, 1,
-1.469672, -0.8410809, -3.048156, 0, 0, 0, 1, 1,
-1.466322, -0.3455818, -1.952871, 0, 0, 0, 1, 1,
-1.457415, -0.09810367, -0.9341159, 0, 0, 0, 1, 1,
-1.456229, -2.652202, -2.111383, 0, 0, 0, 1, 1,
-1.434074, 0.2374867, -2.868842, 0, 0, 0, 1, 1,
-1.431218, 0.3331859, -0.4034956, 0, 0, 0, 1, 1,
-1.430682, 0.264214, -1.715135, 0, 0, 0, 1, 1,
-1.40547, -0.8198285, 0.3085096, 1, 1, 1, 1, 1,
-1.40375, 0.7711814, -2.056197, 1, 1, 1, 1, 1,
-1.397181, -1.158073, -1.235806, 1, 1, 1, 1, 1,
-1.389917, -1.075686, -3.435739, 1, 1, 1, 1, 1,
-1.381698, 0.8500019, -0.276904, 1, 1, 1, 1, 1,
-1.365883, -0.6992264, -1.727104, 1, 1, 1, 1, 1,
-1.358861, 0.03639901, -3.495565, 1, 1, 1, 1, 1,
-1.357901, -1.235443, -3.992512, 1, 1, 1, 1, 1,
-1.353664, 0.3177424, -0.1912715, 1, 1, 1, 1, 1,
-1.352903, -0.2901926, -1.087634, 1, 1, 1, 1, 1,
-1.340844, 1.247181, -2.124376, 1, 1, 1, 1, 1,
-1.339615, 0.7525861, 0.4759012, 1, 1, 1, 1, 1,
-1.339072, 1.057978, -1.120407, 1, 1, 1, 1, 1,
-1.335148, -0.1748635, -1.631875, 1, 1, 1, 1, 1,
-1.3309, -0.2559576, -2.348454, 1, 1, 1, 1, 1,
-1.328562, -0.7184886, -1.819869, 0, 0, 1, 1, 1,
-1.32188, -0.2060012, -1.32188, 1, 0, 0, 1, 1,
-1.320498, 0.3569232, -2.962006, 1, 0, 0, 1, 1,
-1.295578, -0.3527577, -2.554101, 1, 0, 0, 1, 1,
-1.295382, 0.3050908, -2.752972, 1, 0, 0, 1, 1,
-1.291819, 0.4768506, -3.275408, 1, 0, 0, 1, 1,
-1.290424, -1.427808, -2.449605, 0, 0, 0, 1, 1,
-1.286867, 1.049356, -1.60207, 0, 0, 0, 1, 1,
-1.271852, -0.2051965, -2.097819, 0, 0, 0, 1, 1,
-1.266321, -0.7811072, -1.101344, 0, 0, 0, 1, 1,
-1.26631, -1.141901, -1.767911, 0, 0, 0, 1, 1,
-1.265748, -0.09607756, -0.3702854, 0, 0, 0, 1, 1,
-1.246418, -0.1497572, -1.834204, 0, 0, 0, 1, 1,
-1.233925, 1.315779, 0.583022, 1, 1, 1, 1, 1,
-1.23212, -2.232848, -2.523893, 1, 1, 1, 1, 1,
-1.23073, 0.4324244, -0.9070261, 1, 1, 1, 1, 1,
-1.229831, -1.165084, -1.844196, 1, 1, 1, 1, 1,
-1.228452, -1.322496, -3.566552, 1, 1, 1, 1, 1,
-1.225997, 2.264106, -0.1154136, 1, 1, 1, 1, 1,
-1.220429, -0.2006633, -1.291696, 1, 1, 1, 1, 1,
-1.213708, -0.5466738, -1.654366, 1, 1, 1, 1, 1,
-1.212863, -0.6044531, -3.199467, 1, 1, 1, 1, 1,
-1.208278, 1.652179, -0.7388976, 1, 1, 1, 1, 1,
-1.204415, 1.867679, -2.172852, 1, 1, 1, 1, 1,
-1.190639, 0.8677438, -1.875237, 1, 1, 1, 1, 1,
-1.18846, 0.4247012, 0.3020487, 1, 1, 1, 1, 1,
-1.187036, -1.760716, -2.275643, 1, 1, 1, 1, 1,
-1.177116, -0.934875, -1.670471, 1, 1, 1, 1, 1,
-1.175458, -0.7494307, -3.423763, 0, 0, 1, 1, 1,
-1.175229, -0.4562561, -1.890115, 1, 0, 0, 1, 1,
-1.172601, -1.549825, -3.542529, 1, 0, 0, 1, 1,
-1.165423, 0.9325253, -1.4872, 1, 0, 0, 1, 1,
-1.157619, 0.2862355, 1.314698, 1, 0, 0, 1, 1,
-1.15181, 0.2699195, -1.837842, 1, 0, 0, 1, 1,
-1.149434, -0.1547616, -2.564522, 0, 0, 0, 1, 1,
-1.146213, -0.1345337, -4.220861, 0, 0, 0, 1, 1,
-1.143845, 0.5144266, -0.9887872, 0, 0, 0, 1, 1,
-1.135126, 1.710034, -1.091538, 0, 0, 0, 1, 1,
-1.133237, 1.620341, -0.6082897, 0, 0, 0, 1, 1,
-1.129781, 0.8481375, -1.859413, 0, 0, 0, 1, 1,
-1.123145, 0.4708738, -1.602496, 0, 0, 0, 1, 1,
-1.118488, -0.6245666, -2.322406, 1, 1, 1, 1, 1,
-1.115549, 0.9651888, 1.584517, 1, 1, 1, 1, 1,
-1.107762, 0.2916727, -2.595268, 1, 1, 1, 1, 1,
-1.106657, -1.567493, -2.626991, 1, 1, 1, 1, 1,
-1.089993, 0.9026736, -1.19296, 1, 1, 1, 1, 1,
-1.085969, -0.2736908, -4.085603, 1, 1, 1, 1, 1,
-1.085316, -1.136233, -1.460969, 1, 1, 1, 1, 1,
-1.084995, 1.087832, -0.73879, 1, 1, 1, 1, 1,
-1.082555, 0.4820215, -0.4461184, 1, 1, 1, 1, 1,
-1.078895, -0.439765, -0.4819873, 1, 1, 1, 1, 1,
-1.078545, -0.539634, 0.246469, 1, 1, 1, 1, 1,
-1.061488, 3.079727, -0.9685735, 1, 1, 1, 1, 1,
-1.057351, -1.559345, -1.743487, 1, 1, 1, 1, 1,
-1.055956, 0.9328994, -0.9138135, 1, 1, 1, 1, 1,
-1.052454, 1.277832, 0.3058441, 1, 1, 1, 1, 1,
-1.047388, -0.3900051, -2.836223, 0, 0, 1, 1, 1,
-1.044693, -0.7054779, -2.520901, 1, 0, 0, 1, 1,
-1.043497, -0.9742364, -3.051239, 1, 0, 0, 1, 1,
-1.042099, -0.08774649, 0.855881, 1, 0, 0, 1, 1,
-1.034529, 1.653715, -0.2854372, 1, 0, 0, 1, 1,
-1.033222, 0.11338, -1.257146, 1, 0, 0, 1, 1,
-1.023755, -1.026368, -3.272813, 0, 0, 0, 1, 1,
-1.018893, -0.7649978, -1.973128, 0, 0, 0, 1, 1,
-1.017393, 0.8948334, -0.409941, 0, 0, 0, 1, 1,
-1.016458, -1.305872, -4.02169, 0, 0, 0, 1, 1,
-1.010828, -0.09884048, -2.032523, 0, 0, 0, 1, 1,
-1.00706, -1.220117, -3.716707, 0, 0, 0, 1, 1,
-1.005677, -0.3279044, -1.929481, 0, 0, 0, 1, 1,
-1.005102, -1.189246, -3.610861, 1, 1, 1, 1, 1,
-1.003881, 0.6296938, 0.6393102, 1, 1, 1, 1, 1,
-1.002059, -2.277179, -3.064113, 1, 1, 1, 1, 1,
-0.995658, 0.6806364, -1.205633, 1, 1, 1, 1, 1,
-0.9872753, 0.8525887, -0.4898855, 1, 1, 1, 1, 1,
-0.9872572, -0.6017188, 0.111939, 1, 1, 1, 1, 1,
-0.9853689, 0.157144, -1.515218, 1, 1, 1, 1, 1,
-0.981488, 2.038772, -0.808392, 1, 1, 1, 1, 1,
-0.9772468, 2.13272, -0.2897659, 1, 1, 1, 1, 1,
-0.97716, -0.1779061, -1.417246, 1, 1, 1, 1, 1,
-0.9742984, 0.8007425, -0.6973804, 1, 1, 1, 1, 1,
-0.9725616, -1.728734, -0.6871208, 1, 1, 1, 1, 1,
-0.9725036, 0.3324048, -0.6276413, 1, 1, 1, 1, 1,
-0.9702297, -0.2570917, -1.303669, 1, 1, 1, 1, 1,
-0.9643737, 0.3366164, -1.737578, 1, 1, 1, 1, 1,
-0.9643452, 0.1045455, -0.9133058, 0, 0, 1, 1, 1,
-0.9637145, -1.050018, -2.1394, 1, 0, 0, 1, 1,
-0.9623247, -0.7109854, -2.346524, 1, 0, 0, 1, 1,
-0.9586493, -0.005106297, -2.819, 1, 0, 0, 1, 1,
-0.9502694, 0.2839559, -1.848709, 1, 0, 0, 1, 1,
-0.9337366, 0.1988442, -0.949477, 1, 0, 0, 1, 1,
-0.9277793, -1.366149, -4.002951, 0, 0, 0, 1, 1,
-0.9256762, -1.290532, -2.46762, 0, 0, 0, 1, 1,
-0.9247134, -0.7567264, -1.065887, 0, 0, 0, 1, 1,
-0.9176577, -0.540213, -2.519819, 0, 0, 0, 1, 1,
-0.9123702, 1.638898, 0.8769383, 0, 0, 0, 1, 1,
-0.9105485, 0.1976926, -1.738052, 0, 0, 0, 1, 1,
-0.9100947, 0.4071815, -0.7755107, 0, 0, 0, 1, 1,
-0.8961607, 0.1231243, -3.086702, 1, 1, 1, 1, 1,
-0.8912416, 2.060578, 0.347154, 1, 1, 1, 1, 1,
-0.8901919, -0.9667803, -2.087857, 1, 1, 1, 1, 1,
-0.889372, -0.4576018, -3.217641, 1, 1, 1, 1, 1,
-0.885612, -0.3907124, -1.506413, 1, 1, 1, 1, 1,
-0.8851307, 0.2260027, -2.11368, 1, 1, 1, 1, 1,
-0.8828176, 1.14215, 0.3593088, 1, 1, 1, 1, 1,
-0.8797963, 0.7576933, 0.1296825, 1, 1, 1, 1, 1,
-0.8742766, 0.4442863, -1.525541, 1, 1, 1, 1, 1,
-0.8732397, -1.239143, -2.40623, 1, 1, 1, 1, 1,
-0.8679211, 0.681838, -0.3233202, 1, 1, 1, 1, 1,
-0.8674454, 1.881504, 0.2592816, 1, 1, 1, 1, 1,
-0.8661323, 0.2431799, -2.558044, 1, 1, 1, 1, 1,
-0.8642443, 0.5441442, -1.793448, 1, 1, 1, 1, 1,
-0.8628182, -0.4755969, -2.069408, 1, 1, 1, 1, 1,
-0.8603305, -0.4151825, -2.900574, 0, 0, 1, 1, 1,
-0.8574598, -0.8962507, -2.898265, 1, 0, 0, 1, 1,
-0.8502968, 0.4163584, -1.218515, 1, 0, 0, 1, 1,
-0.8480847, -0.8993843, -1.106253, 1, 0, 0, 1, 1,
-0.8456541, -0.5515454, -2.474121, 1, 0, 0, 1, 1,
-0.8454862, -0.114182, -2.3372, 1, 0, 0, 1, 1,
-0.8437193, 1.100171, -0.8675367, 0, 0, 0, 1, 1,
-0.8345163, 0.6983165, -1.171961, 0, 0, 0, 1, 1,
-0.8335751, -2.426471, -2.946322, 0, 0, 0, 1, 1,
-0.8317262, -1.042062, -1.619739, 0, 0, 0, 1, 1,
-0.8309008, -0.7508338, -1.494713, 0, 0, 0, 1, 1,
-0.8285468, -1.583165, -2.356573, 0, 0, 0, 1, 1,
-0.827185, -1.534603, -2.140427, 0, 0, 0, 1, 1,
-0.8240333, 0.8310158, 0.151443, 1, 1, 1, 1, 1,
-0.8178899, -0.6532243, -2.755068, 1, 1, 1, 1, 1,
-0.8134813, -0.8871008, -0.7825327, 1, 1, 1, 1, 1,
-0.8103121, 0.9889423, -0.595996, 1, 1, 1, 1, 1,
-0.8085914, -0.5627608, -0.6178617, 1, 1, 1, 1, 1,
-0.8025652, -0.7458491, -2.484781, 1, 1, 1, 1, 1,
-0.8005452, -0.740782, -2.820004, 1, 1, 1, 1, 1,
-0.7989945, -0.2297141, -1.844231, 1, 1, 1, 1, 1,
-0.796394, -0.2572644, -1.273867, 1, 1, 1, 1, 1,
-0.796277, 0.6525856, -1.390823, 1, 1, 1, 1, 1,
-0.7946887, -1.687676, -4.061633, 1, 1, 1, 1, 1,
-0.7883009, -0.4225581, -0.5980192, 1, 1, 1, 1, 1,
-0.7838012, -0.0930857, -1.152197, 1, 1, 1, 1, 1,
-0.782497, -0.8827442, -4.126999, 1, 1, 1, 1, 1,
-0.7819216, -0.3411248, -2.689773, 1, 1, 1, 1, 1,
-0.7810091, -0.3547762, -1.849703, 0, 0, 1, 1, 1,
-0.7767445, 0.215923, -0.9824039, 1, 0, 0, 1, 1,
-0.7741371, -0.06147683, -1.716936, 1, 0, 0, 1, 1,
-0.7735229, -0.3537953, -1.833783, 1, 0, 0, 1, 1,
-0.7673414, -1.029228, -1.891365, 1, 0, 0, 1, 1,
-0.7607843, -2.082292, -2.676621, 1, 0, 0, 1, 1,
-0.754783, -1.533485, -2.764828, 0, 0, 0, 1, 1,
-0.7539896, -0.09573382, -2.832208, 0, 0, 0, 1, 1,
-0.7474711, -0.6006862, -1.986745, 0, 0, 0, 1, 1,
-0.7395974, -0.7007935, -2.498422, 0, 0, 0, 1, 1,
-0.7359221, -0.4858583, -0.741271, 0, 0, 0, 1, 1,
-0.7335345, -1.096533, -1.630064, 0, 0, 0, 1, 1,
-0.7317744, 1.847164, -2.072736, 0, 0, 0, 1, 1,
-0.730447, 0.9256217, -0.6631171, 1, 1, 1, 1, 1,
-0.7280105, -0.2198402, -1.890794, 1, 1, 1, 1, 1,
-0.7259963, -0.5834134, -1.889496, 1, 1, 1, 1, 1,
-0.7241966, -0.2354377, -0.7172585, 1, 1, 1, 1, 1,
-0.7164273, 0.6015851, -2.552838, 1, 1, 1, 1, 1,
-0.7159822, 0.62959, -2.245506, 1, 1, 1, 1, 1,
-0.713143, 0.7121708, -0.4676986, 1, 1, 1, 1, 1,
-0.709768, 1.008542, 1.943736, 1, 1, 1, 1, 1,
-0.7091535, -2.529095, -4.043963, 1, 1, 1, 1, 1,
-0.7084827, 0.5791724, -0.4051451, 1, 1, 1, 1, 1,
-0.7052645, -1.052918, -3.796597, 1, 1, 1, 1, 1,
-0.7004022, -0.002193404, -1.392481, 1, 1, 1, 1, 1,
-0.6968976, -1.554372, -2.903677, 1, 1, 1, 1, 1,
-0.6967294, 0.6809232, -0.007460356, 1, 1, 1, 1, 1,
-0.6879424, 1.300325, -1.267078, 1, 1, 1, 1, 1,
-0.6868228, 0.9656822, -1.399011, 0, 0, 1, 1, 1,
-0.680736, 1.26013, 0.2272167, 1, 0, 0, 1, 1,
-0.6768727, -1.606973, -3.28703, 1, 0, 0, 1, 1,
-0.6763833, -1.886867, -2.934852, 1, 0, 0, 1, 1,
-0.6755011, 0.1652738, -3.458042, 1, 0, 0, 1, 1,
-0.67322, 1.239821, 0.01759866, 1, 0, 0, 1, 1,
-0.6699284, 1.217323, -0.7047993, 0, 0, 0, 1, 1,
-0.661825, -0.0492052, -1.627117, 0, 0, 0, 1, 1,
-0.6616218, 0.3117874, -1.590385, 0, 0, 0, 1, 1,
-0.6593354, 0.6295224, -1.178817, 0, 0, 0, 1, 1,
-0.6573163, 0.2651936, -1.045502, 0, 0, 0, 1, 1,
-0.6527164, -1.017513, -2.374165, 0, 0, 0, 1, 1,
-0.650131, 0.6286733, 1.381539, 0, 0, 0, 1, 1,
-0.6457519, -0.6199821, -2.860444, 1, 1, 1, 1, 1,
-0.6453869, -0.6051779, -2.062027, 1, 1, 1, 1, 1,
-0.6436927, -0.7420659, -3.155647, 1, 1, 1, 1, 1,
-0.6432029, 0.5510703, -0.7095882, 1, 1, 1, 1, 1,
-0.6423395, 0.555509, 0.7909666, 1, 1, 1, 1, 1,
-0.635813, 0.2670595, -0.346079, 1, 1, 1, 1, 1,
-0.6344445, -0.06654018, -1.288787, 1, 1, 1, 1, 1,
-0.6340079, 1.018239, -2.104989, 1, 1, 1, 1, 1,
-0.6207998, 0.6574636, -1.786542, 1, 1, 1, 1, 1,
-0.6181878, -2.290131, -1.371256, 1, 1, 1, 1, 1,
-0.6177515, -1.151197, -3.763876, 1, 1, 1, 1, 1,
-0.6120764, 0.5163854, -1.295789, 1, 1, 1, 1, 1,
-0.6115429, -1.81251, -3.62387, 1, 1, 1, 1, 1,
-0.6114026, -1.313648, -2.950234, 1, 1, 1, 1, 1,
-0.6112211, 1.265614, -1.358729, 1, 1, 1, 1, 1,
-0.6054558, 0.3132514, -0.654203, 0, 0, 1, 1, 1,
-0.6016505, -0.5837752, -1.694272, 1, 0, 0, 1, 1,
-0.5995914, 1.383484, -0.6866755, 1, 0, 0, 1, 1,
-0.5964407, -0.5964503, -1.785218, 1, 0, 0, 1, 1,
-0.5919039, 0.4105633, -2.248801, 1, 0, 0, 1, 1,
-0.5901046, -0.515824, -1.217089, 1, 0, 0, 1, 1,
-0.5772994, 0.946854, -0.2286987, 0, 0, 0, 1, 1,
-0.5762122, 0.02290617, -0.6715845, 0, 0, 0, 1, 1,
-0.5757328, 0.8289469, -0.3560302, 0, 0, 0, 1, 1,
-0.5748495, 0.7894213, -0.5917422, 0, 0, 0, 1, 1,
-0.5717738, -0.5346263, -0.821578, 0, 0, 0, 1, 1,
-0.5676132, -0.7879453, -3.32738, 0, 0, 0, 1, 1,
-0.5588037, -1.284677, -2.110754, 0, 0, 0, 1, 1,
-0.5492471, 0.4573316, -0.03976667, 1, 1, 1, 1, 1,
-0.5405522, 0.1927633, -2.422846, 1, 1, 1, 1, 1,
-0.5382399, 0.7166474, -0.7385715, 1, 1, 1, 1, 1,
-0.5338799, -2.213171, -2.66422, 1, 1, 1, 1, 1,
-0.5327499, -0.03311542, -0.9632571, 1, 1, 1, 1, 1,
-0.530264, 0.2366487, -1.017859, 1, 1, 1, 1, 1,
-0.5271752, -0.2522869, -3.81172, 1, 1, 1, 1, 1,
-0.5240422, 0.4178137, -1.152058, 1, 1, 1, 1, 1,
-0.517834, -0.8943343, -4.209351, 1, 1, 1, 1, 1,
-0.5168841, 0.2205646, -0.3077756, 1, 1, 1, 1, 1,
-0.5101655, -0.08337703, -0.4670858, 1, 1, 1, 1, 1,
-0.5071898, -1.460325, -3.49578, 1, 1, 1, 1, 1,
-0.4962954, -0.5597864, -1.316466, 1, 1, 1, 1, 1,
-0.4952416, 0.8670608, 0.9582561, 1, 1, 1, 1, 1,
-0.4890797, -0.05843845, -1.233468, 1, 1, 1, 1, 1,
-0.4867223, 0.9706541, -1.149442, 0, 0, 1, 1, 1,
-0.4864538, 0.2625082, -1.592305, 1, 0, 0, 1, 1,
-0.4855508, -0.2414359, -1.513677, 1, 0, 0, 1, 1,
-0.4834224, 1.095907, -1.840371, 1, 0, 0, 1, 1,
-0.4802089, -0.5357683, -2.454578, 1, 0, 0, 1, 1,
-0.4789904, 2.068482, -0.1960563, 1, 0, 0, 1, 1,
-0.4787177, -0.2112742, -2.925919, 0, 0, 0, 1, 1,
-0.4755899, 0.8481233, -0.4384133, 0, 0, 0, 1, 1,
-0.473167, -0.6352276, -3.220424, 0, 0, 0, 1, 1,
-0.4723603, 0.09782647, -2.291432, 0, 0, 0, 1, 1,
-0.471805, -1.162356, -1.771865, 0, 0, 0, 1, 1,
-0.4711355, -1.238308, -2.529642, 0, 0, 0, 1, 1,
-0.4701723, -1.121483, -3.034037, 0, 0, 0, 1, 1,
-0.4699993, -0.4915245, -2.736449, 1, 1, 1, 1, 1,
-0.469842, -1.149746, -2.95199, 1, 1, 1, 1, 1,
-0.4657941, 0.1369066, -0.4227878, 1, 1, 1, 1, 1,
-0.4590073, -0.7302566, -3.917932, 1, 1, 1, 1, 1,
-0.4589528, 0.3820595, -1.489054, 1, 1, 1, 1, 1,
-0.4577296, 0.231936, -1.088897, 1, 1, 1, 1, 1,
-0.4573806, 0.8137286, -2.118182, 1, 1, 1, 1, 1,
-0.4547542, -0.03955986, -0.6130875, 1, 1, 1, 1, 1,
-0.4536899, 1.036043, 0.1957785, 1, 1, 1, 1, 1,
-0.4521826, -0.1890424, -3.806374, 1, 1, 1, 1, 1,
-0.4481201, 0.2775235, -1.564333, 1, 1, 1, 1, 1,
-0.4458856, 1.289604, -0.5396257, 1, 1, 1, 1, 1,
-0.4429266, 0.3526737, -0.4778471, 1, 1, 1, 1, 1,
-0.4424706, 0.1818892, -0.6230363, 1, 1, 1, 1, 1,
-0.4418216, -0.7797801, -3.505325, 1, 1, 1, 1, 1,
-0.4331573, 0.5118688, -0.4574527, 0, 0, 1, 1, 1,
-0.4311261, 0.8128359, -2.064984, 1, 0, 0, 1, 1,
-0.4299886, -0.03055278, -1.444538, 1, 0, 0, 1, 1,
-0.429088, -2.285248, -2.588242, 1, 0, 0, 1, 1,
-0.4280416, 0.8590336, -0.924512, 1, 0, 0, 1, 1,
-0.4186852, 0.9498874, -1.604656, 1, 0, 0, 1, 1,
-0.4166772, 0.8711578, -0.9315711, 0, 0, 0, 1, 1,
-0.4124751, -0.213936, -1.649467, 0, 0, 0, 1, 1,
-0.4122961, 0.443756, 0.7336224, 0, 0, 0, 1, 1,
-0.4096792, -0.6300051, -2.658974, 0, 0, 0, 1, 1,
-0.4069905, 0.07647056, -1.53386, 0, 0, 0, 1, 1,
-0.4060967, 0.6760637, -0.2088627, 0, 0, 0, 1, 1,
-0.4054499, 0.6059953, -0.5428197, 0, 0, 0, 1, 1,
-0.4002641, -1.549777, -3.04123, 1, 1, 1, 1, 1,
-0.3994808, -0.3738327, -0.5014464, 1, 1, 1, 1, 1,
-0.3927977, -2.998216, -1.46021, 1, 1, 1, 1, 1,
-0.3877178, -1.98412, -2.562871, 1, 1, 1, 1, 1,
-0.3796669, 0.7120775, 0.4665148, 1, 1, 1, 1, 1,
-0.3785663, -0.5234004, -2.216687, 1, 1, 1, 1, 1,
-0.3782334, 0.5558195, -0.5695291, 1, 1, 1, 1, 1,
-0.3778112, 0.825913, -0.7691321, 1, 1, 1, 1, 1,
-0.3762856, 0.02140078, -1.566578, 1, 1, 1, 1, 1,
-0.3760085, -1.225889, -3.828235, 1, 1, 1, 1, 1,
-0.3720956, -0.162395, -0.5596793, 1, 1, 1, 1, 1,
-0.3714241, 0.5282009, -1.135053, 1, 1, 1, 1, 1,
-0.3707158, 0.6494971, -0.1551386, 1, 1, 1, 1, 1,
-0.3696214, 2.752967, -1.017482, 1, 1, 1, 1, 1,
-0.3599127, -1.036125, -1.907286, 1, 1, 1, 1, 1,
-0.3574628, -0.04494979, 0.3746292, 0, 0, 1, 1, 1,
-0.3564934, 0.7599581, -0.5051303, 1, 0, 0, 1, 1,
-0.3504829, 0.7671459, 0.8901206, 1, 0, 0, 1, 1,
-0.3487957, -0.5376897, -3.895009, 1, 0, 0, 1, 1,
-0.3453775, 0.2959817, -1.373067, 1, 0, 0, 1, 1,
-0.3450578, 0.6645939, -1.188181, 1, 0, 0, 1, 1,
-0.3444429, 2.997287, 0.8356564, 0, 0, 0, 1, 1,
-0.3425322, 0.344972, -1.542087, 0, 0, 0, 1, 1,
-0.3414195, -1.126492, -2.739387, 0, 0, 0, 1, 1,
-0.3406734, 0.6037882, -0.3558018, 0, 0, 0, 1, 1,
-0.3393737, -0.7601669, -4.350702, 0, 0, 0, 1, 1,
-0.3365604, -0.8548948, -3.989448, 0, 0, 0, 1, 1,
-0.3343856, 0.2717122, 0.4177172, 0, 0, 0, 1, 1,
-0.3336866, -0.1220583, -3.61311, 1, 1, 1, 1, 1,
-0.332553, -0.2759319, -2.902384, 1, 1, 1, 1, 1,
-0.3299159, 1.252862, 0.2057601, 1, 1, 1, 1, 1,
-0.3294736, 0.6146773, -0.5860705, 1, 1, 1, 1, 1,
-0.3269026, -0.2461864, -0.5844532, 1, 1, 1, 1, 1,
-0.3255638, -0.04153019, -0.8891859, 1, 1, 1, 1, 1,
-0.3250799, -1.338113, -1.145061, 1, 1, 1, 1, 1,
-0.3225192, 0.6796155, -0.5271284, 1, 1, 1, 1, 1,
-0.3213322, -1.294763, -1.327205, 1, 1, 1, 1, 1,
-0.3211007, -1.931293, -2.06182, 1, 1, 1, 1, 1,
-0.3208281, -1.094649, -1.605115, 1, 1, 1, 1, 1,
-0.3187519, -0.3249757, -1.829673, 1, 1, 1, 1, 1,
-0.3156422, 0.2489886, 0.662283, 1, 1, 1, 1, 1,
-0.3116678, -0.2085177, -3.626965, 1, 1, 1, 1, 1,
-0.3094022, 0.5974233, 0.4246538, 1, 1, 1, 1, 1,
-0.3058828, -0.1255646, -3.043041, 0, 0, 1, 1, 1,
-0.2982207, 0.6028972, -0.3939545, 1, 0, 0, 1, 1,
-0.2966302, 0.7948822, 1.139876, 1, 0, 0, 1, 1,
-0.2966055, 1.091255, -1.03233, 1, 0, 0, 1, 1,
-0.2920563, 0.2496237, -1.83947, 1, 0, 0, 1, 1,
-0.2900299, -0.2900956, -4.204821, 1, 0, 0, 1, 1,
-0.2859659, -1.263629, -2.816181, 0, 0, 0, 1, 1,
-0.2817479, 0.5724112, 1.49182, 0, 0, 0, 1, 1,
-0.2801401, 0.3818974, -1.023803, 0, 0, 0, 1, 1,
-0.2766959, -1.104332, -1.778237, 0, 0, 0, 1, 1,
-0.268879, 0.35979, -1.130743, 0, 0, 0, 1, 1,
-0.2684723, -0.5237629, -2.70425, 0, 0, 0, 1, 1,
-0.2586093, -0.1248748, -0.4265485, 0, 0, 0, 1, 1,
-0.2583884, -1.683453, -3.703867, 1, 1, 1, 1, 1,
-0.2574487, -0.3183813, -3.085049, 1, 1, 1, 1, 1,
-0.2560109, 0.3799051, 1.098588, 1, 1, 1, 1, 1,
-0.2542055, 2.341852, -1.029571, 1, 1, 1, 1, 1,
-0.2537276, -1.266887, -2.911893, 1, 1, 1, 1, 1,
-0.2512212, -0.2952006, -1.678238, 1, 1, 1, 1, 1,
-0.2502688, 0.1126684, 0.03482662, 1, 1, 1, 1, 1,
-0.2440755, -0.8596932, -2.425388, 1, 1, 1, 1, 1,
-0.2367064, 0.9478941, 1.052508, 1, 1, 1, 1, 1,
-0.2358768, -1.333573, -3.133805, 1, 1, 1, 1, 1,
-0.2358648, 0.101451, -0.8889717, 1, 1, 1, 1, 1,
-0.2243516, -0.3557108, -0.4969181, 1, 1, 1, 1, 1,
-0.2196389, -0.4437284, -1.063904, 1, 1, 1, 1, 1,
-0.204502, 0.3577448, 0.8841823, 1, 1, 1, 1, 1,
-0.2028013, -0.1305621, -2.621138, 1, 1, 1, 1, 1,
-0.20195, 0.8167413, -2.750182, 0, 0, 1, 1, 1,
-0.1989359, 0.2795373, -0.6594534, 1, 0, 0, 1, 1,
-0.1984004, -0.1440386, -4.499504, 1, 0, 0, 1, 1,
-0.1983269, -0.4491313, -2.838114, 1, 0, 0, 1, 1,
-0.190284, -1.775881, -2.496407, 1, 0, 0, 1, 1,
-0.190043, -1.557816, -2.851568, 1, 0, 0, 1, 1,
-0.1899436, 0.2232816, 0.215031, 0, 0, 0, 1, 1,
-0.1886622, -1.244677, -1.886371, 0, 0, 0, 1, 1,
-0.1759853, -0.03577166, -2.266996, 0, 0, 0, 1, 1,
-0.1719639, 1.377429, -0.1141839, 0, 0, 0, 1, 1,
-0.1685148, 0.5661324, 1.151945, 0, 0, 0, 1, 1,
-0.166411, -0.2384671, -2.170482, 0, 0, 0, 1, 1,
-0.1647417, 0.281073, -2.222414, 0, 0, 0, 1, 1,
-0.1605749, 0.2178445, 0.4008381, 1, 1, 1, 1, 1,
-0.1583969, 0.1741194, -0.6932038, 1, 1, 1, 1, 1,
-0.1550694, -0.6511412, -4.189608, 1, 1, 1, 1, 1,
-0.1547847, -0.7734081, -2.98837, 1, 1, 1, 1, 1,
-0.1542745, 0.07510625, -0.9301285, 1, 1, 1, 1, 1,
-0.1511501, -0.5033299, -1.934618, 1, 1, 1, 1, 1,
-0.1494753, 1.987731, 0.3635552, 1, 1, 1, 1, 1,
-0.1491098, -0.8399072, -3.478794, 1, 1, 1, 1, 1,
-0.1482447, -0.8117445, -1.210388, 1, 1, 1, 1, 1,
-0.1479399, -0.04520519, -2.708317, 1, 1, 1, 1, 1,
-0.1475137, 2.034187, -0.119041, 1, 1, 1, 1, 1,
-0.1451496, -0.2483764, -0.6573911, 1, 1, 1, 1, 1,
-0.1423273, -0.8077554, -1.44027, 1, 1, 1, 1, 1,
-0.1342277, 1.192554, -1.435925, 1, 1, 1, 1, 1,
-0.1324364, 0.4092305, -0.1406004, 1, 1, 1, 1, 1,
-0.1278877, -0.7714152, -3.564392, 0, 0, 1, 1, 1,
-0.1200057, -1.103727, -3.466803, 1, 0, 0, 1, 1,
-0.1190499, -1.859234, -0.38996, 1, 0, 0, 1, 1,
-0.1178288, 1.285076, 0.1260423, 1, 0, 0, 1, 1,
-0.1177601, -2.451987, -4.414104, 1, 0, 0, 1, 1,
-0.116397, -0.4498668, -2.626759, 1, 0, 0, 1, 1,
-0.1151141, 0.1239076, 1.951319, 0, 0, 0, 1, 1,
-0.1137991, -0.0712432, -3.33122, 0, 0, 0, 1, 1,
-0.1126946, -1.882624, -1.59413, 0, 0, 0, 1, 1,
-0.1123893, 0.4033852, 0.6124293, 0, 0, 0, 1, 1,
-0.1123164, -0.6301126, -1.536217, 0, 0, 0, 1, 1,
-0.1101512, 0.09271157, -0.03709765, 0, 0, 0, 1, 1,
-0.1070452, 1.156209, 0.1874433, 0, 0, 0, 1, 1,
-0.105715, -1.242841, -2.728794, 1, 1, 1, 1, 1,
-0.1044844, 0.378923, 0.4525908, 1, 1, 1, 1, 1,
-0.1031952, -1.307215, -0.9913685, 1, 1, 1, 1, 1,
-0.1023248, -0.2853636, -3.209931, 1, 1, 1, 1, 1,
-0.0942495, -0.8052246, -2.217938, 1, 1, 1, 1, 1,
-0.07798426, 0.9981499, -0.5581409, 1, 1, 1, 1, 1,
-0.07749525, -0.7599063, -2.964768, 1, 1, 1, 1, 1,
-0.07648553, 0.2467784, 0.1979196, 1, 1, 1, 1, 1,
-0.07220771, 0.3364077, -2.065632, 1, 1, 1, 1, 1,
-0.07058772, -1.853905, -4.245992, 1, 1, 1, 1, 1,
-0.07033184, -0.3975229, -3.719747, 1, 1, 1, 1, 1,
-0.06440544, -2.041023, -4.256102, 1, 1, 1, 1, 1,
-0.06345204, 0.8999599, -0.3776316, 1, 1, 1, 1, 1,
-0.06314298, -0.7660659, -3.376039, 1, 1, 1, 1, 1,
-0.06090417, 0.39122, 0.3919416, 1, 1, 1, 1, 1,
-0.05986262, -1.118161, -3.481881, 0, 0, 1, 1, 1,
-0.05928249, -1.956565, -3.74734, 1, 0, 0, 1, 1,
-0.05554798, 0.3161823, 0.8866286, 1, 0, 0, 1, 1,
-0.05355559, 0.8750256, 1.65152, 1, 0, 0, 1, 1,
-0.05305563, 2.311763, 1.113946, 1, 0, 0, 1, 1,
-0.04876066, 0.9083093, 0.4769907, 1, 0, 0, 1, 1,
-0.04691537, 0.04342578, -0.8236807, 0, 0, 0, 1, 1,
-0.04511493, -1.96826, -3.081541, 0, 0, 0, 1, 1,
-0.04483271, 0.8519015, 0.4614644, 0, 0, 0, 1, 1,
-0.04386414, 0.3588849, -1.000151, 0, 0, 0, 1, 1,
-0.04242449, -1.692881, -1.811005, 0, 0, 0, 1, 1,
-0.04173047, 0.8303809, 0.9499571, 0, 0, 0, 1, 1,
-0.04154825, -1.090639, -3.084863, 0, 0, 0, 1, 1,
-0.03896987, 0.8025967, 0.8539404, 1, 1, 1, 1, 1,
-0.03554842, 0.4931353, -1.366774, 1, 1, 1, 1, 1,
-0.03210408, -1.330675, -2.988376, 1, 1, 1, 1, 1,
-0.02788182, 0.6140844, -0.5920967, 1, 1, 1, 1, 1,
-0.02719152, 1.288877, 0.7580039, 1, 1, 1, 1, 1,
-0.01955952, -1.618828, -2.57038, 1, 1, 1, 1, 1,
-0.01719286, 1.228787, 1.246048, 1, 1, 1, 1, 1,
-0.01678756, 0.8723063, 0.2290542, 1, 1, 1, 1, 1,
-0.01317928, -0.0335423, -2.123739, 1, 1, 1, 1, 1,
-0.01254946, 1.703707, -1.500922, 1, 1, 1, 1, 1,
-0.009912307, -0.6711618, -1.386445, 1, 1, 1, 1, 1,
-0.008147031, -0.3595637, -2.284537, 1, 1, 1, 1, 1,
-0.008135899, 1.13659, -0.1755076, 1, 1, 1, 1, 1,
-0.005926316, 1.22996, -0.1883852, 1, 1, 1, 1, 1,
0.008427587, -1.033978, 4.146399, 1, 1, 1, 1, 1,
0.01210727, 0.1096908, -0.9692501, 0, 0, 1, 1, 1,
0.01568632, -0.908813, 2.950886, 1, 0, 0, 1, 1,
0.02085507, -0.5249802, 5.801366, 1, 0, 0, 1, 1,
0.02581643, -0.05920447, 2.199753, 1, 0, 0, 1, 1,
0.03042714, -2.087593, 2.960953, 1, 0, 0, 1, 1,
0.03493983, 0.006735503, 1.281301, 1, 0, 0, 1, 1,
0.03512312, 0.1731355, -0.4757372, 0, 0, 0, 1, 1,
0.03574689, -0.1736285, 2.600579, 0, 0, 0, 1, 1,
0.03641035, -1.031809, 5.294946, 0, 0, 0, 1, 1,
0.04165015, 1.267042, 1.388939, 0, 0, 0, 1, 1,
0.04648793, -1.577779, 3.947673, 0, 0, 0, 1, 1,
0.04740819, -1.105268, 3.75897, 0, 0, 0, 1, 1,
0.05103248, 0.744147, -0.4749143, 0, 0, 0, 1, 1,
0.05367541, -0.7027574, 2.589633, 1, 1, 1, 1, 1,
0.05570839, -0.3162448, 3.132167, 1, 1, 1, 1, 1,
0.06149715, 0.4696527, -0.9763678, 1, 1, 1, 1, 1,
0.06247879, -0.07097951, 1.162923, 1, 1, 1, 1, 1,
0.06378858, -0.7071992, 1.804327, 1, 1, 1, 1, 1,
0.07439642, 0.01571122, 0.7500339, 1, 1, 1, 1, 1,
0.08006743, -0.3503686, 3.613297, 1, 1, 1, 1, 1,
0.08110935, -0.09090989, 1.732869, 1, 1, 1, 1, 1,
0.08412352, -1.094035, 2.857653, 1, 1, 1, 1, 1,
0.08884878, 0.3959047, 1.047892, 1, 1, 1, 1, 1,
0.08997612, -0.4135646, 1.984951, 1, 1, 1, 1, 1,
0.09332414, -1.018114, 3.095987, 1, 1, 1, 1, 1,
0.09351772, -0.2169753, 0.8979466, 1, 1, 1, 1, 1,
0.09598567, 0.2713085, -0.2616413, 1, 1, 1, 1, 1,
0.09799384, 0.6582087, 0.9483465, 1, 1, 1, 1, 1,
0.09864819, 0.02615457, 0.02483176, 0, 0, 1, 1, 1,
0.1026861, 0.4693408, -1.032058, 1, 0, 0, 1, 1,
0.1030848, -0.4411125, 2.517394, 1, 0, 0, 1, 1,
0.1049863, -0.007298433, 2.153872, 1, 0, 0, 1, 1,
0.1065054, 1.119477, 1.076025, 1, 0, 0, 1, 1,
0.1073552, 0.8767778, -0.4880855, 1, 0, 0, 1, 1,
0.1077411, -1.010775, 2.720747, 0, 0, 0, 1, 1,
0.1090113, -0.9990554, 1.553692, 0, 0, 0, 1, 1,
0.1109669, 1.502999, 0.3466333, 0, 0, 0, 1, 1,
0.1110386, -1.094819, 3.562573, 0, 0, 0, 1, 1,
0.1132535, -0.8911312, 4.269552, 0, 0, 0, 1, 1,
0.1178266, -2.19131, 3.924986, 0, 0, 0, 1, 1,
0.119652, 0.5516735, -2.312911, 0, 0, 0, 1, 1,
0.122802, -2.003179, 3.097952, 1, 1, 1, 1, 1,
0.1290855, 1.689699, -0.1748188, 1, 1, 1, 1, 1,
0.1299594, 0.9012375, -0.2627656, 1, 1, 1, 1, 1,
0.1299654, -1.539306, 3.000414, 1, 1, 1, 1, 1,
0.1326042, -0.03923664, 1.900054, 1, 1, 1, 1, 1,
0.1378696, -0.1507521, 4.295947, 1, 1, 1, 1, 1,
0.138357, -1.091248, 3.202746, 1, 1, 1, 1, 1,
0.1391363, -0.3206186, 1.491866, 1, 1, 1, 1, 1,
0.1403045, -0.8121839, 3.935407, 1, 1, 1, 1, 1,
0.1428144, 0.5799548, -1.318628, 1, 1, 1, 1, 1,
0.1455385, 1.243398, -0.6840268, 1, 1, 1, 1, 1,
0.1473894, -0.5294306, 3.78348, 1, 1, 1, 1, 1,
0.1494578, 0.1089355, 0.8032106, 1, 1, 1, 1, 1,
0.1519076, -0.8367187, 3.313124, 1, 1, 1, 1, 1,
0.1556252, -1.276879, 3.870877, 1, 1, 1, 1, 1,
0.1601096, -1.365394, 1.65271, 0, 0, 1, 1, 1,
0.1636616, -0.6359658, 1.560004, 1, 0, 0, 1, 1,
0.163753, 0.7270703, -2.046353, 1, 0, 0, 1, 1,
0.1668082, -0.2754028, 1.010428, 1, 0, 0, 1, 1,
0.1680966, 0.002928188, 2.123872, 1, 0, 0, 1, 1,
0.171823, 0.4585266, -0.1600231, 1, 0, 0, 1, 1,
0.1724149, 0.8914729, -0.4816756, 0, 0, 0, 1, 1,
0.1754833, -0.660441, 2.233047, 0, 0, 0, 1, 1,
0.1798414, 0.3662577, 1.306027, 0, 0, 0, 1, 1,
0.1804962, -1.005299, 4.964962, 0, 0, 0, 1, 1,
0.1819734, -0.4187926, 1.728574, 0, 0, 0, 1, 1,
0.18669, 0.9400797, 0.001739985, 0, 0, 0, 1, 1,
0.1867967, 0.7281809, -0.887862, 0, 0, 0, 1, 1,
0.1879007, -0.1661164, 2.971985, 1, 1, 1, 1, 1,
0.1963159, 1.537003, 0.1387181, 1, 1, 1, 1, 1,
0.1993323, -0.1265353, 1.716949, 1, 1, 1, 1, 1,
0.201295, 0.7336409, 0.1455843, 1, 1, 1, 1, 1,
0.2020918, 0.6137633, -0.1582706, 1, 1, 1, 1, 1,
0.2023341, 1.768435, -0.2348499, 1, 1, 1, 1, 1,
0.2032264, 0.4610092, 0.8109751, 1, 1, 1, 1, 1,
0.2061903, 0.4378862, 0.5712789, 1, 1, 1, 1, 1,
0.2103862, 0.07678173, -0.189604, 1, 1, 1, 1, 1,
0.2158905, -0.1538615, 3.262255, 1, 1, 1, 1, 1,
0.216799, 0.3328952, 2.224502, 1, 1, 1, 1, 1,
0.2178039, -0.09116477, 0.3628208, 1, 1, 1, 1, 1,
0.2196679, 0.375382, 1.123576, 1, 1, 1, 1, 1,
0.2201677, 0.2422492, 2.518621, 1, 1, 1, 1, 1,
0.2219539, 0.1179087, 1.920599, 1, 1, 1, 1, 1,
0.2246052, 0.8003888, 0.06702998, 0, 0, 1, 1, 1,
0.2250651, 0.9157689, 0.9520196, 1, 0, 0, 1, 1,
0.2307246, -0.9489045, 0.5029567, 1, 0, 0, 1, 1,
0.2322606, 1.323323, 0.5652162, 1, 0, 0, 1, 1,
0.2337222, 0.1603379, 0.5098053, 1, 0, 0, 1, 1,
0.2349407, -2.424136, 2.073708, 1, 0, 0, 1, 1,
0.2364784, -0.5876071, 0.5384519, 0, 0, 0, 1, 1,
0.2394556, 1.372735, -0.2780342, 0, 0, 0, 1, 1,
0.2453225, 0.1420682, 1.806674, 0, 0, 0, 1, 1,
0.2485773, -0.3155996, 2.677096, 0, 0, 0, 1, 1,
0.2488301, -0.4113565, 0.514625, 0, 0, 0, 1, 1,
0.2489579, 0.8588653, -1.093277, 0, 0, 0, 1, 1,
0.2508865, -0.3234042, 2.811353, 0, 0, 0, 1, 1,
0.2524009, -0.8479432, 2.832355, 1, 1, 1, 1, 1,
0.2541435, 1.025114, -0.3431579, 1, 1, 1, 1, 1,
0.2555348, 1.613597, 0.2149246, 1, 1, 1, 1, 1,
0.2565809, 1.136235, 0.2824481, 1, 1, 1, 1, 1,
0.2620086, -0.335476, 2.367264, 1, 1, 1, 1, 1,
0.2644757, -0.5048923, 2.583624, 1, 1, 1, 1, 1,
0.2655715, -0.7895417, 2.504809, 1, 1, 1, 1, 1,
0.2726081, -0.5225906, 2.036047, 1, 1, 1, 1, 1,
0.2736131, 0.9714752, 1.215639, 1, 1, 1, 1, 1,
0.2741115, 0.2592797, -0.411242, 1, 1, 1, 1, 1,
0.2797311, -0.708709, 2.004609, 1, 1, 1, 1, 1,
0.2935033, 1.913061, 2.479653, 1, 1, 1, 1, 1,
0.2986993, -0.9253321, 2.741652, 1, 1, 1, 1, 1,
0.2996387, -1.873338, 3.384892, 1, 1, 1, 1, 1,
0.3031246, 0.7582871, 0.9086463, 1, 1, 1, 1, 1,
0.3032786, 0.2227398, 0.2211562, 0, 0, 1, 1, 1,
0.312394, 0.1440101, 1.700156, 1, 0, 0, 1, 1,
0.3128164, -1.460513, 3.260766, 1, 0, 0, 1, 1,
0.3133535, 1.276159, 0.6856215, 1, 0, 0, 1, 1,
0.3204619, 1.189041, 0.9891008, 1, 0, 0, 1, 1,
0.3205497, -0.8298135, 2.528406, 1, 0, 0, 1, 1,
0.3229458, -0.2649066, 1.345517, 0, 0, 0, 1, 1,
0.3248946, 0.345715, 2.60961, 0, 0, 0, 1, 1,
0.3251607, -0.2931903, 1.41272, 0, 0, 0, 1, 1,
0.3258428, 2.451126, 1.581887, 0, 0, 0, 1, 1,
0.3270926, 0.1487625, 1.285931, 0, 0, 0, 1, 1,
0.3302915, -1.487355, 1.400141, 0, 0, 0, 1, 1,
0.3313677, -0.7455044, 3.396106, 0, 0, 0, 1, 1,
0.3316079, -0.8708928, 3.290463, 1, 1, 1, 1, 1,
0.3362776, 0.2174941, 2.792301, 1, 1, 1, 1, 1,
0.3381126, 0.202481, 0.3176689, 1, 1, 1, 1, 1,
0.3437515, -0.4473257, 2.924585, 1, 1, 1, 1, 1,
0.3444823, -0.3562813, 3.18357, 1, 1, 1, 1, 1,
0.34755, 0.8213583, 1.160109, 1, 1, 1, 1, 1,
0.349021, -0.3626298, 2.637579, 1, 1, 1, 1, 1,
0.3521154, -2.312713, 2.897022, 1, 1, 1, 1, 1,
0.3540742, -0.5741068, 1.706218, 1, 1, 1, 1, 1,
0.3544029, -0.01522627, 1.570955, 1, 1, 1, 1, 1,
0.3549782, 1.628905, -1.966116, 1, 1, 1, 1, 1,
0.3562399, 0.2839582, 2.153576, 1, 1, 1, 1, 1,
0.3568357, -0.8891151, 2.942777, 1, 1, 1, 1, 1,
0.3577636, -2.331907, 1.881144, 1, 1, 1, 1, 1,
0.3583729, 0.1071921, 3.523583, 1, 1, 1, 1, 1,
0.3636832, 0.2557575, 2.435527, 0, 0, 1, 1, 1,
0.367483, -0.02233547, 1.487843, 1, 0, 0, 1, 1,
0.3683745, 0.3312452, 3.021012, 1, 0, 0, 1, 1,
0.3701204, 0.2720332, 1.166911, 1, 0, 0, 1, 1,
0.3703841, -0.9505674, 3.540989, 1, 0, 0, 1, 1,
0.3715137, 1.550423, -0.2651782, 1, 0, 0, 1, 1,
0.3747805, 0.2556957, 3.068904, 0, 0, 0, 1, 1,
0.3926296, 0.2969542, 1.233976, 0, 0, 0, 1, 1,
0.3984507, -0.1040599, 0.6599981, 0, 0, 0, 1, 1,
0.3990729, -0.4639696, 1.529398, 0, 0, 0, 1, 1,
0.4006639, -0.4070319, 2.964345, 0, 0, 0, 1, 1,
0.4014758, 0.06111086, 2.763758, 0, 0, 0, 1, 1,
0.4019949, -1.503675, 3.425499, 0, 0, 0, 1, 1,
0.4223337, 0.751262, 1.557505, 1, 1, 1, 1, 1,
0.4227023, 0.8344331, 1.454337, 1, 1, 1, 1, 1,
0.4238787, -1.0624, 2.376889, 1, 1, 1, 1, 1,
0.4272808, 0.7952282, 0.489134, 1, 1, 1, 1, 1,
0.4354634, 0.3397067, 1.33078, 1, 1, 1, 1, 1,
0.4377935, -1.20882, 2.630718, 1, 1, 1, 1, 1,
0.4404557, -0.0376821, -0.5235541, 1, 1, 1, 1, 1,
0.4458187, -0.266158, 1.112398, 1, 1, 1, 1, 1,
0.4464355, 0.6151131, -0.4599202, 1, 1, 1, 1, 1,
0.4538815, 0.768438, 0.5312233, 1, 1, 1, 1, 1,
0.4541293, -0.9039087, 2.665601, 1, 1, 1, 1, 1,
0.4569008, -0.5458741, 2.259807, 1, 1, 1, 1, 1,
0.4582979, -0.7589455, 2.132292, 1, 1, 1, 1, 1,
0.4591449, -2.124278, 3.224384, 1, 1, 1, 1, 1,
0.4592111, -1.034172, 4.604094, 1, 1, 1, 1, 1,
0.4642587, 0.4497691, 0.6699072, 0, 0, 1, 1, 1,
0.4661044, 0.8982426, 2.580133, 1, 0, 0, 1, 1,
0.4682281, -0.2894542, 1.68489, 1, 0, 0, 1, 1,
0.470016, 0.8846437, -1.51371, 1, 0, 0, 1, 1,
0.4731646, -0.6708294, 3.411669, 1, 0, 0, 1, 1,
0.4743392, 0.7382639, 0.7863746, 1, 0, 0, 1, 1,
0.4746497, 0.1992505, 1.229103, 0, 0, 0, 1, 1,
0.4774686, -0.6722238, 3.029454, 0, 0, 0, 1, 1,
0.484331, 1.576264, 0.5791708, 0, 0, 0, 1, 1,
0.4898804, -0.04758116, 1.580137, 0, 0, 0, 1, 1,
0.4909188, -2.299181, 2.79331, 0, 0, 0, 1, 1,
0.4937343, -0.3193689, 2.779593, 0, 0, 0, 1, 1,
0.4957905, 0.5202084, -0.1341784, 0, 0, 0, 1, 1,
0.4989493, -0.5865631, 2.943944, 1, 1, 1, 1, 1,
0.4993302, 0.4815357, 0.4915863, 1, 1, 1, 1, 1,
0.5004382, -1.675131, 2.333084, 1, 1, 1, 1, 1,
0.5033365, 0.4079926, 1.240486, 1, 1, 1, 1, 1,
0.5116411, -0.2434376, 0.7558016, 1, 1, 1, 1, 1,
0.5138078, 0.1030537, 1.652598, 1, 1, 1, 1, 1,
0.5158185, 0.3483739, 0.9690031, 1, 1, 1, 1, 1,
0.5184915, 0.7648999, 2.432193, 1, 1, 1, 1, 1,
0.5190901, 0.120872, 1.368911, 1, 1, 1, 1, 1,
0.5228395, 0.1708307, 0.3969699, 1, 1, 1, 1, 1,
0.5230271, -2.170038, 2.582183, 1, 1, 1, 1, 1,
0.5243464, -0.6131144, 1.257963, 1, 1, 1, 1, 1,
0.5257497, -0.3044144, 1.709229, 1, 1, 1, 1, 1,
0.5295043, 0.6761545, -0.1857543, 1, 1, 1, 1, 1,
0.5314776, -0.8671278, 2.398868, 1, 1, 1, 1, 1,
0.5371265, -1.643216, 3.419473, 0, 0, 1, 1, 1,
0.5381582, 1.359784, 0.9720485, 1, 0, 0, 1, 1,
0.540634, 0.7535509, -0.8402361, 1, 0, 0, 1, 1,
0.5412316, -0.4319409, 1.18032, 1, 0, 0, 1, 1,
0.5437708, -0.2169625, 1.150589, 1, 0, 0, 1, 1,
0.5451824, -0.8181, 4.258947, 1, 0, 0, 1, 1,
0.5465491, 1.059752, -0.2829238, 0, 0, 0, 1, 1,
0.5468006, -0.2638233, 1.839709, 0, 0, 0, 1, 1,
0.5478461, -1.268577, 2.292306, 0, 0, 0, 1, 1,
0.5489896, -0.5795402, 2.064522, 0, 0, 0, 1, 1,
0.5495704, -0.6708924, 0.07693001, 0, 0, 0, 1, 1,
0.5514243, -1.068977, 2.964373, 0, 0, 0, 1, 1,
0.5536919, 0.8801959, -0.0753638, 0, 0, 0, 1, 1,
0.5610866, -0.05152528, -1.149695, 1, 1, 1, 1, 1,
0.5638447, 0.9260399, 0.6920236, 1, 1, 1, 1, 1,
0.5643116, -0.06095766, 1.881936, 1, 1, 1, 1, 1,
0.5727364, -1.379096, 2.407147, 1, 1, 1, 1, 1,
0.5777177, -0.164739, 1.258049, 1, 1, 1, 1, 1,
0.5808606, 0.1088565, 1.685845, 1, 1, 1, 1, 1,
0.5851603, 2.307698, -1.699099, 1, 1, 1, 1, 1,
0.5866771, 0.04082306, 2.408019, 1, 1, 1, 1, 1,
0.586724, -1.148171, 3.905211, 1, 1, 1, 1, 1,
0.5897875, -0.487151, 2.7974, 1, 1, 1, 1, 1,
0.5908728, 0.2583806, 2.42515, 1, 1, 1, 1, 1,
0.5943891, -0.8478183, 1.906056, 1, 1, 1, 1, 1,
0.597676, -1.595802, 1.492709, 1, 1, 1, 1, 1,
0.6094127, 0.2919585, -0.5669153, 1, 1, 1, 1, 1,
0.6107053, -2.181755, 3.571713, 1, 1, 1, 1, 1,
0.6126086, -0.3586676, 0.8083749, 0, 0, 1, 1, 1,
0.6136716, 0.7645566, 0.3713613, 1, 0, 0, 1, 1,
0.6141995, -0.5455713, 2.131546, 1, 0, 0, 1, 1,
0.6157815, -0.02685772, 2.039642, 1, 0, 0, 1, 1,
0.6199257, 1.160483, 0.4163552, 1, 0, 0, 1, 1,
0.6236084, -0.55762, 4.174234, 1, 0, 0, 1, 1,
0.6283964, 0.8347376, 1.51837, 0, 0, 0, 1, 1,
0.6325678, 1.82939, -0.7247255, 0, 0, 0, 1, 1,
0.6397256, 1.938354, 1.018567, 0, 0, 0, 1, 1,
0.6400366, -0.3600389, 2.275931, 0, 0, 0, 1, 1,
0.6420379, 1.401172, 3.024984, 0, 0, 0, 1, 1,
0.6494842, -0.9336713, 2.666718, 0, 0, 0, 1, 1,
0.6500437, 0.4928202, 0.3744034, 0, 0, 0, 1, 1,
0.6521882, -0.7359169, 2.003084, 1, 1, 1, 1, 1,
0.6525744, 0.6996098, 0.5395107, 1, 1, 1, 1, 1,
0.6569836, 0.3012221, -0.3544826, 1, 1, 1, 1, 1,
0.6584811, 0.5021163, -0.03213187, 1, 1, 1, 1, 1,
0.6587988, -1.533932, 2.9358, 1, 1, 1, 1, 1,
0.6587989, -0.6443871, 2.6376, 1, 1, 1, 1, 1,
0.6634181, -0.8149833, 0.2441432, 1, 1, 1, 1, 1,
0.665933, -0.5002937, 2.581113, 1, 1, 1, 1, 1,
0.6697228, 0.1083923, 2.27989, 1, 1, 1, 1, 1,
0.6704438, 0.05730782, 1.976162, 1, 1, 1, 1, 1,
0.6727445, 0.06827805, 0.08454046, 1, 1, 1, 1, 1,
0.6743705, -1.19792, 2.965039, 1, 1, 1, 1, 1,
0.679183, 0.8172529, 0.6901829, 1, 1, 1, 1, 1,
0.6811378, 0.06212765, 2.885816, 1, 1, 1, 1, 1,
0.6825758, -2.694554, 2.324103, 1, 1, 1, 1, 1,
0.685906, -0.6167145, 4.536005, 0, 0, 1, 1, 1,
0.6881625, -0.187148, 0.3459995, 1, 0, 0, 1, 1,
0.696528, -0.4981099, 0.8895806, 1, 0, 0, 1, 1,
0.6978267, 0.4262862, 1.110367, 1, 0, 0, 1, 1,
0.6994967, 0.5976764, 0.2328546, 1, 0, 0, 1, 1,
0.7009298, 0.1109418, 1.429294, 1, 0, 0, 1, 1,
0.701778, -0.4800853, 0.7815576, 0, 0, 0, 1, 1,
0.7023839, -1.757562, 1.980329, 0, 0, 0, 1, 1,
0.7057466, 2.02313, -0.0567334, 0, 0, 0, 1, 1,
0.7065995, -0.2445004, -0.5657192, 0, 0, 0, 1, 1,
0.7079318, -1.323853, 2.935866, 0, 0, 0, 1, 1,
0.7086974, -1.412325, 2.414772, 0, 0, 0, 1, 1,
0.7105652, 0.1599612, 1.723286, 0, 0, 0, 1, 1,
0.7180037, 0.435927, 1.71594, 1, 1, 1, 1, 1,
0.7213569, -0.1858219, 0.7972276, 1, 1, 1, 1, 1,
0.7249424, -0.6702453, 0.8446852, 1, 1, 1, 1, 1,
0.7258753, 0.8217142, 0.5788029, 1, 1, 1, 1, 1,
0.7271636, 0.6529219, 1.653419, 1, 1, 1, 1, 1,
0.7274326, 0.3831774, 1.150009, 1, 1, 1, 1, 1,
0.7359564, 0.528057, 0.7472927, 1, 1, 1, 1, 1,
0.7424537, 0.2720086, 2.030254, 1, 1, 1, 1, 1,
0.7522119, -0.3389378, 1.318567, 1, 1, 1, 1, 1,
0.7572587, -0.2448193, 0.1014824, 1, 1, 1, 1, 1,
0.7634687, 0.2129622, 1.182806, 1, 1, 1, 1, 1,
0.7662327, -0.4173754, 2.923415, 1, 1, 1, 1, 1,
0.7723529, -0.8908587, 0.8498278, 1, 1, 1, 1, 1,
0.7760555, 1.625414, 0.5155924, 1, 1, 1, 1, 1,
0.7800841, 0.2665726, -1.168291, 1, 1, 1, 1, 1,
0.7804707, 1.071018, 0.0794649, 0, 0, 1, 1, 1,
0.7822409, 1.321085, -0.5905902, 1, 0, 0, 1, 1,
0.7824517, 0.7176608, 1.355477, 1, 0, 0, 1, 1,
0.7843567, -0.100053, 1.792066, 1, 0, 0, 1, 1,
0.7859532, -0.9815055, 0.9503837, 1, 0, 0, 1, 1,
0.7860538, -0.4708778, 2.410697, 1, 0, 0, 1, 1,
0.7882021, -0.001573622, -0.1371824, 0, 0, 0, 1, 1,
0.7882638, -0.3891111, -0.684468, 0, 0, 0, 1, 1,
0.7909395, -1.163556, 2.879267, 0, 0, 0, 1, 1,
0.7914193, -1.156556, 1.099742, 0, 0, 0, 1, 1,
0.7960214, -0.378372, 0.9660938, 0, 0, 0, 1, 1,
0.7971677, 0.00565971, 1.008519, 0, 0, 0, 1, 1,
0.7992557, 0.1516331, 1.769283, 0, 0, 0, 1, 1,
0.7995469, 2.0972, 0.2707977, 1, 1, 1, 1, 1,
0.8001711, 1.080923, -0.4260795, 1, 1, 1, 1, 1,
0.8018355, 1.511659, -0.6828487, 1, 1, 1, 1, 1,
0.8019959, -0.734108, 1.090039, 1, 1, 1, 1, 1,
0.8057235, -0.978192, 2.726044, 1, 1, 1, 1, 1,
0.8112118, -0.6894374, 1.255095, 1, 1, 1, 1, 1,
0.8155881, 0.6591565, -1.137346, 1, 1, 1, 1, 1,
0.8220578, -0.7456105, 2.226607, 1, 1, 1, 1, 1,
0.8229849, -1.514737, 3.931097, 1, 1, 1, 1, 1,
0.8282217, 0.3274338, -0.4980729, 1, 1, 1, 1, 1,
0.8335057, 0.7123234, 1.188847, 1, 1, 1, 1, 1,
0.8391927, 1.789996, 0.3677813, 1, 1, 1, 1, 1,
0.8397494, 1.855752, 0.1955252, 1, 1, 1, 1, 1,
0.8398169, -0.557971, 1.724692, 1, 1, 1, 1, 1,
0.8440108, 0.5616567, 2.630002, 1, 1, 1, 1, 1,
0.8440963, 0.7394273, 1.723006, 0, 0, 1, 1, 1,
0.8441384, -0.1412896, 1.243278, 1, 0, 0, 1, 1,
0.8444952, 1.961749, -0.0278051, 1, 0, 0, 1, 1,
0.8482515, -0.7536884, 1.108142, 1, 0, 0, 1, 1,
0.8493146, -1.02937, 3.391657, 1, 0, 0, 1, 1,
0.8512825, 1.596447, 1.860826, 1, 0, 0, 1, 1,
0.8580168, -1.912974, 1.957203, 0, 0, 0, 1, 1,
0.8581787, -0.4558331, 2.773655, 0, 0, 0, 1, 1,
0.8589397, 0.3013915, 0.5596743, 0, 0, 0, 1, 1,
0.8598459, -0.0374328, 1.329634, 0, 0, 0, 1, 1,
0.8644997, 1.052715, 1.791059, 0, 0, 0, 1, 1,
0.8650797, -0.2493694, 2.600703, 0, 0, 0, 1, 1,
0.8761807, -0.5704081, 1.741983, 0, 0, 0, 1, 1,
0.8792314, 1.225421, 1.35586, 1, 1, 1, 1, 1,
0.8858901, -0.4308234, 1.086412, 1, 1, 1, 1, 1,
0.9014668, 1.102031, 0.7107368, 1, 1, 1, 1, 1,
0.9222247, -0.980403, 3.215266, 1, 1, 1, 1, 1,
0.9263496, 0.9007822, 1.283606, 1, 1, 1, 1, 1,
0.9286013, 0.1030491, 1.989777, 1, 1, 1, 1, 1,
0.9344951, -0.7609197, 1.060781, 1, 1, 1, 1, 1,
0.9373741, -0.9922411, 3.746668, 1, 1, 1, 1, 1,
0.9394454, 0.3531795, 2.507712, 1, 1, 1, 1, 1,
0.9398977, -0.2781494, 1.570775, 1, 1, 1, 1, 1,
0.9407882, -1.075242, 3.108859, 1, 1, 1, 1, 1,
0.9454829, -0.1180177, 0.9616774, 1, 1, 1, 1, 1,
0.9465517, 1.426414, 2.201209, 1, 1, 1, 1, 1,
0.9547142, -1.901728, 0.6204109, 1, 1, 1, 1, 1,
0.9616525, -0.08125856, 3.096141, 1, 1, 1, 1, 1,
0.9617863, 1.762698, 1.206422, 0, 0, 1, 1, 1,
0.9633287, -0.4035844, 0.8085344, 1, 0, 0, 1, 1,
0.9636164, 0.2356491, -0.5507656, 1, 0, 0, 1, 1,
0.970174, 0.39077, -0.2768527, 1, 0, 0, 1, 1,
0.9705713, 0.2914326, -0.1416045, 1, 0, 0, 1, 1,
0.9744002, 0.4773109, 2.112392, 1, 0, 0, 1, 1,
0.9778007, 0.3116508, 1.768392, 0, 0, 0, 1, 1,
0.9809343, -1.219414, 1.976627, 0, 0, 0, 1, 1,
0.9843101, 0.05160638, -0.1058337, 0, 0, 0, 1, 1,
0.9878657, -1.174376, 1.479214, 0, 0, 0, 1, 1,
0.99719, 1.277092, -0.1942611, 0, 0, 0, 1, 1,
1.001707, 0.7015641, 2.337835, 0, 0, 0, 1, 1,
1.005547, 0.9975978, 1.036988, 0, 0, 0, 1, 1,
1.006044, -0.1194362, 1.305829, 1, 1, 1, 1, 1,
1.006182, -0.4182646, 2.193621, 1, 1, 1, 1, 1,
1.007133, -1.656532, 1.917263, 1, 1, 1, 1, 1,
1.007365, -0.6175802, 1.674123, 1, 1, 1, 1, 1,
1.009144, 1.002162, 1.576661, 1, 1, 1, 1, 1,
1.010331, -0.2423634, 3.979985, 1, 1, 1, 1, 1,
1.010811, 0.1254216, 1.385565, 1, 1, 1, 1, 1,
1.013859, 0.7928382, 0.958284, 1, 1, 1, 1, 1,
1.01407, 0.4199077, 0.451917, 1, 1, 1, 1, 1,
1.016668, -0.4157432, 3.181019, 1, 1, 1, 1, 1,
1.020531, -1.45314, 3.623761, 1, 1, 1, 1, 1,
1.023413, -0.5950316, 1.237231, 1, 1, 1, 1, 1,
1.028142, 1.156498, 1.509805, 1, 1, 1, 1, 1,
1.036679, -0.1674557, 0.3945443, 1, 1, 1, 1, 1,
1.044584, -1.647133, 2.802477, 1, 1, 1, 1, 1,
1.048198, 0.930444, 1.586779, 0, 0, 1, 1, 1,
1.04834, -0.01554616, 1.801363, 1, 0, 0, 1, 1,
1.04903, 0.7669349, 0.486906, 1, 0, 0, 1, 1,
1.060405, 1.208402, 0.2152377, 1, 0, 0, 1, 1,
1.072027, 0.3277243, 1.982678, 1, 0, 0, 1, 1,
1.080705, -0.359981, 0.3990442, 1, 0, 0, 1, 1,
1.08214, 1.159322, -0.8393608, 0, 0, 0, 1, 1,
1.08337, 2.267079, 1.683539, 0, 0, 0, 1, 1,
1.089729, -0.4618788, 2.401391, 0, 0, 0, 1, 1,
1.090032, 1.180477, -0.2452649, 0, 0, 0, 1, 1,
1.094343, 0.3210365, 3.209555, 0, 0, 0, 1, 1,
1.099408, -1.42382, 1.308239, 0, 0, 0, 1, 1,
1.125253, -0.9731421, 1.871668, 0, 0, 0, 1, 1,
1.127058, 0.714819, 0.7579818, 1, 1, 1, 1, 1,
1.130256, -1.774368, 2.449652, 1, 1, 1, 1, 1,
1.135618, -0.9202427, 1.670383, 1, 1, 1, 1, 1,
1.155794, -0.3801043, 0.6673896, 1, 1, 1, 1, 1,
1.16134, -0.4495276, 2.163198, 1, 1, 1, 1, 1,
1.161849, -0.04673771, 0.3429365, 1, 1, 1, 1, 1,
1.162314, 0.4814133, 1.832845, 1, 1, 1, 1, 1,
1.163511, 1.551243, 2.201499, 1, 1, 1, 1, 1,
1.164777, 0.6027156, 1.142972, 1, 1, 1, 1, 1,
1.165975, -1.681949, 4.556715, 1, 1, 1, 1, 1,
1.17271, 0.2346381, 3.500449, 1, 1, 1, 1, 1,
1.184924, -0.5744722, 2.613156, 1, 1, 1, 1, 1,
1.196874, -0.265775, 0.6475294, 1, 1, 1, 1, 1,
1.208781, 1.176654, -0.905057, 1, 1, 1, 1, 1,
1.21356, 1.378963, 0.5254158, 1, 1, 1, 1, 1,
1.217218, 1.047696, 0.6549755, 0, 0, 1, 1, 1,
1.226895, -0.5621961, 2.966655, 1, 0, 0, 1, 1,
1.229982, -1.059673, 2.065069, 1, 0, 0, 1, 1,
1.231089, -0.9707102, 2.750645, 1, 0, 0, 1, 1,
1.231873, -0.4152608, 2.328082, 1, 0, 0, 1, 1,
1.241047, 0.49116, 0.8694137, 1, 0, 0, 1, 1,
1.250591, 0.3901317, 0.7783733, 0, 0, 0, 1, 1,
1.254098, -1.566769, 2.341752, 0, 0, 0, 1, 1,
1.257798, -0.1957157, 2.156356, 0, 0, 0, 1, 1,
1.257892, -2.261045, 4.046782, 0, 0, 0, 1, 1,
1.2598, -0.3632772, 0.9107474, 0, 0, 0, 1, 1,
1.2732, -0.2068434, 2.217497, 0, 0, 0, 1, 1,
1.275285, 0.4115876, 0.5104119, 0, 0, 0, 1, 1,
1.279328, 0.5014646, 1.996861, 1, 1, 1, 1, 1,
1.284352, -1.269383, 1.135282, 1, 1, 1, 1, 1,
1.292188, -0.3023959, 2.580675, 1, 1, 1, 1, 1,
1.301053, -1.361274, 0.5913755, 1, 1, 1, 1, 1,
1.303545, 0.7043226, 2.858386, 1, 1, 1, 1, 1,
1.316275, -0.7520724, 4.047233, 1, 1, 1, 1, 1,
1.319351, 0.568465, 0.4660566, 1, 1, 1, 1, 1,
1.32598, -1.043527, 3.566632, 1, 1, 1, 1, 1,
1.344888, -0.3636907, 1.309866, 1, 1, 1, 1, 1,
1.354602, -0.7096435, 0.7592227, 1, 1, 1, 1, 1,
1.364548, -2.003275, 3.332931, 1, 1, 1, 1, 1,
1.365131, -0.9090777, 2.221287, 1, 1, 1, 1, 1,
1.372852, 1.552416, 0.8942466, 1, 1, 1, 1, 1,
1.383478, 0.8811996, 2.27915, 1, 1, 1, 1, 1,
1.387845, -2.519886, 1.809603, 1, 1, 1, 1, 1,
1.390775, 1.694833, 0.7264969, 0, 0, 1, 1, 1,
1.406902, -0.6979278, 2.816352, 1, 0, 0, 1, 1,
1.408178, -0.5234081, 1.55861, 1, 0, 0, 1, 1,
1.428463, -0.2024178, 2.854386, 1, 0, 0, 1, 1,
1.432266, 0.1356661, 0.03371561, 1, 0, 0, 1, 1,
1.452971, -0.2661832, 1.631348, 1, 0, 0, 1, 1,
1.456908, -0.8774081, 1.890937, 0, 0, 0, 1, 1,
1.471036, 0.681688, 1.336491, 0, 0, 0, 1, 1,
1.473385, -0.8368661, 2.026672, 0, 0, 0, 1, 1,
1.479073, -0.7480793, 1.802294, 0, 0, 0, 1, 1,
1.485045, 0.7982816, -0.2892628, 0, 0, 0, 1, 1,
1.493097, 0.1697943, 0.872871, 0, 0, 0, 1, 1,
1.496343, 0.4961938, 0.6617223, 0, 0, 0, 1, 1,
1.506443, 1.067044, 1.369877, 1, 1, 1, 1, 1,
1.523996, -0.4837967, 2.9821, 1, 1, 1, 1, 1,
1.541834, -0.9756536, 0.8055741, 1, 1, 1, 1, 1,
1.543844, 0.2405063, 1.639332, 1, 1, 1, 1, 1,
1.572159, -0.1127599, 1.578792, 1, 1, 1, 1, 1,
1.578254, 0.04375765, 1.593862, 1, 1, 1, 1, 1,
1.588245, -0.164967, 0.6969006, 1, 1, 1, 1, 1,
1.598989, 0.6294022, 2.388596, 1, 1, 1, 1, 1,
1.601268, 0.896181, 0.6086959, 1, 1, 1, 1, 1,
1.604892, 0.2513296, 1.367829, 1, 1, 1, 1, 1,
1.615655, -0.2868228, 1.205161, 1, 1, 1, 1, 1,
1.618174, 1.088507, 1.529657, 1, 1, 1, 1, 1,
1.646, -0.9395475, 3.03733, 1, 1, 1, 1, 1,
1.646624, 0.7907701, 1.313648, 1, 1, 1, 1, 1,
1.649819, -0.00976376, 2.386423, 1, 1, 1, 1, 1,
1.651135, -1.219131, 4.213912, 0, 0, 1, 1, 1,
1.655251, -0.1184927, 1.792518, 1, 0, 0, 1, 1,
1.668491, -0.1795501, 2.534491, 1, 0, 0, 1, 1,
1.668597, 1.029846, 0.1839257, 1, 0, 0, 1, 1,
1.670133, 0.4030046, 0.8494722, 1, 0, 0, 1, 1,
1.670178, -1.131919, 3.150963, 1, 0, 0, 1, 1,
1.67077, 1.480363, 1.014335, 0, 0, 0, 1, 1,
1.701778, -1.081987, 2.312984, 0, 0, 0, 1, 1,
1.736047, 1.359378, -1.060128, 0, 0, 0, 1, 1,
1.75615, -0.3578717, 1.282126, 0, 0, 0, 1, 1,
1.769943, -0.01261228, 0.5211183, 0, 0, 0, 1, 1,
1.779308, 1.916758, 0.9393898, 0, 0, 0, 1, 1,
1.788702, -0.8854735, 1.892998, 0, 0, 0, 1, 1,
1.860496, 0.1574236, 0.008666012, 1, 1, 1, 1, 1,
1.890761, 1.389797, 1.342904, 1, 1, 1, 1, 1,
1.921912, -1.139937, 0.8457121, 1, 1, 1, 1, 1,
1.982543, 0.5482461, -0.9969689, 1, 1, 1, 1, 1,
2.005704, -1.249484, 1.171541, 1, 1, 1, 1, 1,
2.024752, -0.4593241, 2.685915, 1, 1, 1, 1, 1,
2.02741, 0.1963157, 1.339523, 1, 1, 1, 1, 1,
2.02998, 1.063567, -0.7757571, 1, 1, 1, 1, 1,
2.111245, 0.8835808, -1.036038, 1, 1, 1, 1, 1,
2.117445, -1.092929, 3.135906, 1, 1, 1, 1, 1,
2.128157, -0.4088286, 2.317559, 1, 1, 1, 1, 1,
2.143079, 0.6426862, 2.067521, 1, 1, 1, 1, 1,
2.152978, 0.9578642, 2.38572, 1, 1, 1, 1, 1,
2.170421, 0.2683682, 0.1156954, 1, 1, 1, 1, 1,
2.180045, 0.9582628, 2.912227, 1, 1, 1, 1, 1,
2.219123, 0.3715283, 2.001086, 0, 0, 1, 1, 1,
2.234493, -0.3792319, 1.763934, 1, 0, 0, 1, 1,
2.263955, 0.0435546, 1.791883, 1, 0, 0, 1, 1,
2.269669, 1.068982, 1.866733, 1, 0, 0, 1, 1,
2.356727, 0.4619836, 0.9887903, 1, 0, 0, 1, 1,
2.392478, -1.304938, 0.3256421, 1, 0, 0, 1, 1,
2.41369, 2.005161, 3.841396, 0, 0, 0, 1, 1,
2.423068, -0.6867777, 2.417688, 0, 0, 0, 1, 1,
2.436312, 0.5300097, 1.856605, 0, 0, 0, 1, 1,
2.53893, -1.634343, 2.170124, 0, 0, 0, 1, 1,
2.571612, 1.036505, 0.1487295, 0, 0, 0, 1, 1,
2.581728, 1.328819, 0.8846202, 0, 0, 0, 1, 1,
2.586325, 0.6462476, 1.785405, 0, 0, 0, 1, 1,
2.678781, -1.356997, 2.478476, 1, 1, 1, 1, 1,
2.747078, 0.1625707, 1.491883, 1, 1, 1, 1, 1,
2.845119, -0.7695078, 0.1992702, 1, 1, 1, 1, 1,
2.88215, -0.114841, -0.4792155, 1, 1, 1, 1, 1,
3.001633, -0.8355207, 2.696839, 1, 1, 1, 1, 1,
3.076147, 0.5735307, 0.2764126, 1, 1, 1, 1, 1,
3.252574, -0.3041662, 0.5884669, 1, 1, 1, 1, 1
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
var radius = 9.274638;
var distance = 32.57677;
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
mvMatrix.translate( -0.2139087, 0.03747416, -0.6509314 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.57677);
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
