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
-3.702108, 0.5502423, -1.182939, 1, 0, 0, 1,
-3.272753, 0.5060214, -0.4151812, 1, 0.007843138, 0, 1,
-3.102964, -0.2639291, -1.339008, 1, 0.01176471, 0, 1,
-3.016176, 0.1901034, 0.4033757, 1, 0.01960784, 0, 1,
-2.619116, -0.2552709, -1.81863, 1, 0.02352941, 0, 1,
-2.565234, 0.776448, -1.501634, 1, 0.03137255, 0, 1,
-2.557916, 1.641254, -1.406247, 1, 0.03529412, 0, 1,
-2.542543, -0.05949475, -2.823931, 1, 0.04313726, 0, 1,
-2.522734, 0.3805864, -3.666573, 1, 0.04705882, 0, 1,
-2.503097, 0.09661305, -0.4900482, 1, 0.05490196, 0, 1,
-2.493741, 1.408835, 0.7257697, 1, 0.05882353, 0, 1,
-2.401118, -0.07890493, -2.234581, 1, 0.06666667, 0, 1,
-2.398586, -0.2501392, -1.592676, 1, 0.07058824, 0, 1,
-2.369854, -0.07400295, -0.8369354, 1, 0.07843138, 0, 1,
-2.328627, -0.01994382, -0.7964581, 1, 0.08235294, 0, 1,
-2.289993, -0.5607515, -1.280797, 1, 0.09019608, 0, 1,
-2.265802, 0.6116481, -0.6871239, 1, 0.09411765, 0, 1,
-2.181418, 0.1699947, -1.18626, 1, 0.1019608, 0, 1,
-2.177627, 1.456318, -1.676897, 1, 0.1098039, 0, 1,
-2.118121, -0.5464101, -0.9750007, 1, 0.1137255, 0, 1,
-2.109213, -0.2076878, -2.536758, 1, 0.1215686, 0, 1,
-2.107754, -0.6964003, -1.076033, 1, 0.1254902, 0, 1,
-2.091548, -0.6740829, -1.808802, 1, 0.1333333, 0, 1,
-2.069002, 1.445068, -1.485605, 1, 0.1372549, 0, 1,
-2.065075, -0.05076014, -1.572324, 1, 0.145098, 0, 1,
-2.063386, -0.0444229, -2.030421, 1, 0.1490196, 0, 1,
-2.022178, -0.3994409, -0.9020361, 1, 0.1568628, 0, 1,
-2.011868, 1.480317, -2.561301, 1, 0.1607843, 0, 1,
-2.010516, -0.1274638, -1.237769, 1, 0.1686275, 0, 1,
-2.001635, 0.7756433, -2.328843, 1, 0.172549, 0, 1,
-1.982525, -2.454753, -1.919801, 1, 0.1803922, 0, 1,
-1.962607, 0.2881896, -0.6965256, 1, 0.1843137, 0, 1,
-1.940434, 2.044582, -0.1598244, 1, 0.1921569, 0, 1,
-1.922687, 0.931904, -2.458167, 1, 0.1960784, 0, 1,
-1.871045, 1.528176, -0.1468779, 1, 0.2039216, 0, 1,
-1.849754, -0.2819928, -0.9789988, 1, 0.2117647, 0, 1,
-1.846691, 0.2754316, -0.1689447, 1, 0.2156863, 0, 1,
-1.807255, -0.3130768, -0.8205768, 1, 0.2235294, 0, 1,
-1.785477, -0.8588836, -1.522081, 1, 0.227451, 0, 1,
-1.783135, 1.748326, -0.9042185, 1, 0.2352941, 0, 1,
-1.782946, -0.7226548, -1.152768, 1, 0.2392157, 0, 1,
-1.772152, 1.115201, -1.458374, 1, 0.2470588, 0, 1,
-1.771737, 1.664665, -1.185436, 1, 0.2509804, 0, 1,
-1.769, -0.4951777, -2.798363, 1, 0.2588235, 0, 1,
-1.766543, -1.375854, -2.757062, 1, 0.2627451, 0, 1,
-1.746273, 0.1639727, -1.402212, 1, 0.2705882, 0, 1,
-1.729848, -0.5259762, -2.423018, 1, 0.2745098, 0, 1,
-1.727905, 0.2868266, -1.705983, 1, 0.282353, 0, 1,
-1.722443, -0.3160306, -0.7848558, 1, 0.2862745, 0, 1,
-1.719998, 1.251034, -0.2941617, 1, 0.2941177, 0, 1,
-1.708243, 0.02237774, -1.287633, 1, 0.3019608, 0, 1,
-1.707566, -0.5341891, -1.347486, 1, 0.3058824, 0, 1,
-1.701019, -1.340954, -1.265704, 1, 0.3137255, 0, 1,
-1.668815, -0.5095589, -1.838962, 1, 0.3176471, 0, 1,
-1.66734, -0.930399, -1.603444, 1, 0.3254902, 0, 1,
-1.660903, 0.4528027, -0.3822985, 1, 0.3294118, 0, 1,
-1.659524, 1.081785, -2.071175, 1, 0.3372549, 0, 1,
-1.654469, -0.2993396, 0.7723309, 1, 0.3411765, 0, 1,
-1.628496, 1.152959, -0.8445285, 1, 0.3490196, 0, 1,
-1.621465, 1.57362, -0.5197396, 1, 0.3529412, 0, 1,
-1.610897, 1.15828, -0.8719376, 1, 0.3607843, 0, 1,
-1.604023, 0.5980493, -1.529397, 1, 0.3647059, 0, 1,
-1.591876, -0.3992156, -1.541259, 1, 0.372549, 0, 1,
-1.581051, -0.9219814, -1.359177, 1, 0.3764706, 0, 1,
-1.561298, -0.4185574, -1.831184, 1, 0.3843137, 0, 1,
-1.558647, -0.7514485, -0.6889964, 1, 0.3882353, 0, 1,
-1.558472, -0.354324, -2.341475, 1, 0.3960784, 0, 1,
-1.54139, -1.382716, -2.381415, 1, 0.4039216, 0, 1,
-1.540999, 0.2866008, -0.774538, 1, 0.4078431, 0, 1,
-1.539693, -0.04654126, -1.180246, 1, 0.4156863, 0, 1,
-1.532363, 1.480042, -2.916813, 1, 0.4196078, 0, 1,
-1.517507, -0.4033585, -1.428366, 1, 0.427451, 0, 1,
-1.49808, -0.1333965, -1.473127, 1, 0.4313726, 0, 1,
-1.497614, 0.712929, -0.7446172, 1, 0.4392157, 0, 1,
-1.495968, -0.5350457, -0.527405, 1, 0.4431373, 0, 1,
-1.495212, -0.3983577, 0.1899906, 1, 0.4509804, 0, 1,
-1.49408, 1.733368, -0.6094004, 1, 0.454902, 0, 1,
-1.49213, -1.938642, -3.083852, 1, 0.4627451, 0, 1,
-1.48125, -1.01576, -1.663775, 1, 0.4666667, 0, 1,
-1.463896, 0.5829218, -1.020278, 1, 0.4745098, 0, 1,
-1.461638, 1.016076, -1.581601, 1, 0.4784314, 0, 1,
-1.454549, 0.8339477, -0.9323814, 1, 0.4862745, 0, 1,
-1.446374, 0.2668933, -0.5981948, 1, 0.4901961, 0, 1,
-1.43866, 0.21139, -1.007506, 1, 0.4980392, 0, 1,
-1.435391, -0.4420401, -3.398672, 1, 0.5058824, 0, 1,
-1.429782, -0.5727404, -0.7481181, 1, 0.509804, 0, 1,
-1.423964, -0.3745613, -3.355702, 1, 0.5176471, 0, 1,
-1.420123, 0.2923799, -1.193008, 1, 0.5215687, 0, 1,
-1.409995, 0.4094937, -1.137951, 1, 0.5294118, 0, 1,
-1.40793, 0.8363932, -1.73317, 1, 0.5333334, 0, 1,
-1.40564, -0.2903729, -0.1624906, 1, 0.5411765, 0, 1,
-1.39028, 1.233789, -2.616667, 1, 0.5450981, 0, 1,
-1.387447, -0.1775918, -2.514586, 1, 0.5529412, 0, 1,
-1.38616, 0.1165213, -1.510806, 1, 0.5568628, 0, 1,
-1.386004, 0.1567526, -1.955098, 1, 0.5647059, 0, 1,
-1.378165, 1.564876, -1.521167, 1, 0.5686275, 0, 1,
-1.374131, -0.1848329, -1.913407, 1, 0.5764706, 0, 1,
-1.373158, 0.7725996, 0.1513537, 1, 0.5803922, 0, 1,
-1.371502, 1.100091, -1.919739, 1, 0.5882353, 0, 1,
-1.370793, 0.3953713, 0.3006745, 1, 0.5921569, 0, 1,
-1.369853, 1.11909, -0.5879933, 1, 0.6, 0, 1,
-1.335534, -1.269691, -1.61595, 1, 0.6078432, 0, 1,
-1.329451, 0.7948722, -0.5014148, 1, 0.6117647, 0, 1,
-1.316101, 0.4200432, 0.1869625, 1, 0.6196079, 0, 1,
-1.313877, -0.6034518, -3.021664, 1, 0.6235294, 0, 1,
-1.307687, -0.01577169, -0.9286099, 1, 0.6313726, 0, 1,
-1.299595, -0.4749541, -2.819773, 1, 0.6352941, 0, 1,
-1.289697, 0.521899, 0.7450721, 1, 0.6431373, 0, 1,
-1.284143, -1.33154, -3.330372, 1, 0.6470588, 0, 1,
-1.271474, -1.116437, -1.660784, 1, 0.654902, 0, 1,
-1.271274, 0.4395396, -0.6122857, 1, 0.6588235, 0, 1,
-1.267096, 0.9518092, -0.5276789, 1, 0.6666667, 0, 1,
-1.26341, -0.4497128, -2.368564, 1, 0.6705883, 0, 1,
-1.262711, -1.332013, -2.305151, 1, 0.6784314, 0, 1,
-1.251394, -1.972567, -3.312915, 1, 0.682353, 0, 1,
-1.250257, 0.03658495, -0.07701225, 1, 0.6901961, 0, 1,
-1.246899, 0.7800366, -1.269452, 1, 0.6941177, 0, 1,
-1.246354, 1.055746, 0.6308606, 1, 0.7019608, 0, 1,
-1.238938, 0.841556, -0.6133159, 1, 0.7098039, 0, 1,
-1.235392, 2.877928, -1.016784, 1, 0.7137255, 0, 1,
-1.234012, 0.5752642, 0.6310701, 1, 0.7215686, 0, 1,
-1.224966, 0.6092821, -0.4547591, 1, 0.7254902, 0, 1,
-1.218406, -0.5036418, -1.799698, 1, 0.7333333, 0, 1,
-1.204474, 1.140718, -2.862546, 1, 0.7372549, 0, 1,
-1.201704, 1.019961, -2.624682, 1, 0.7450981, 0, 1,
-1.201258, -1.2048, -1.923019, 1, 0.7490196, 0, 1,
-1.200815, 0.3029692, -1.074962, 1, 0.7568628, 0, 1,
-1.200527, 3.125409, -1.189843, 1, 0.7607843, 0, 1,
-1.192025, -0.6243346, -2.81524, 1, 0.7686275, 0, 1,
-1.189793, -0.5075171, -2.103003, 1, 0.772549, 0, 1,
-1.184054, 0.5994642, -0.769303, 1, 0.7803922, 0, 1,
-1.183029, -0.2678126, -2.524217, 1, 0.7843137, 0, 1,
-1.175132, 1.316332, -0.2925837, 1, 0.7921569, 0, 1,
-1.174278, 1.446476, -0.7625458, 1, 0.7960784, 0, 1,
-1.168578, 1.208783, -0.613515, 1, 0.8039216, 0, 1,
-1.166706, -1.065482, -1.562224, 1, 0.8117647, 0, 1,
-1.162854, -0.6205503, -3.93951, 1, 0.8156863, 0, 1,
-1.158844, -0.7281215, -3.162508, 1, 0.8235294, 0, 1,
-1.156407, -1.083137, -1.849252, 1, 0.827451, 0, 1,
-1.154112, 0.7452064, -2.403877, 1, 0.8352941, 0, 1,
-1.150952, -1.627468, -1.30996, 1, 0.8392157, 0, 1,
-1.150343, -2.035899, -1.941776, 1, 0.8470588, 0, 1,
-1.149595, 0.777257, 0.6822543, 1, 0.8509804, 0, 1,
-1.138272, 0.3228199, -0.3607548, 1, 0.8588235, 0, 1,
-1.137103, 0.428986, -0.4411755, 1, 0.8627451, 0, 1,
-1.131171, -0.6779428, -2.544031, 1, 0.8705882, 0, 1,
-1.122534, -0.03337762, -0.6538103, 1, 0.8745098, 0, 1,
-1.118812, -0.3313596, -1.996563, 1, 0.8823529, 0, 1,
-1.100061, 0.2986796, -2.473411, 1, 0.8862745, 0, 1,
-1.099647, 1.217646, -1.660188, 1, 0.8941177, 0, 1,
-1.099249, 1.070193, -1.324018, 1, 0.8980392, 0, 1,
-1.094489, -0.1470303, -1.803831, 1, 0.9058824, 0, 1,
-1.093975, 0.9792273, -1.503144, 1, 0.9137255, 0, 1,
-1.091254, 1.000352, -0.497081, 1, 0.9176471, 0, 1,
-1.089095, -0.7629993, -1.154926, 1, 0.9254902, 0, 1,
-1.087537, -0.9169195, -3.759043, 1, 0.9294118, 0, 1,
-1.079967, 0.8188366, -1.500088, 1, 0.9372549, 0, 1,
-1.072322, -1.234654, -2.870702, 1, 0.9411765, 0, 1,
-1.069749, 0.6924613, 0.8631703, 1, 0.9490196, 0, 1,
-1.063352, -0.1551676, -0.1973669, 1, 0.9529412, 0, 1,
-1.055735, 2.323706, 0.9970308, 1, 0.9607843, 0, 1,
-1.050323, 0.4060385, -2.621556, 1, 0.9647059, 0, 1,
-1.047889, -0.4020756, -2.786965, 1, 0.972549, 0, 1,
-1.045354, -2.090652, -4.070273, 1, 0.9764706, 0, 1,
-1.045192, -0.03394884, -1.896233, 1, 0.9843137, 0, 1,
-1.030779, -2.068545, -3.061492, 1, 0.9882353, 0, 1,
-1.022356, -0.06685717, -1.65473, 1, 0.9960784, 0, 1,
-1.015202, 0.9504735, -1.127877, 0.9960784, 1, 0, 1,
-1.008124, 1.588335, -0.5345775, 0.9921569, 1, 0, 1,
-1.004474, -0.1844222, -3.372557, 0.9843137, 1, 0, 1,
-1.003101, -1.634701, -1.396909, 0.9803922, 1, 0, 1,
-0.9989713, 1.306494, -0.2722243, 0.972549, 1, 0, 1,
-0.9968763, -2.295095, -3.789944, 0.9686275, 1, 0, 1,
-0.9944515, 0.5666232, -2.675671, 0.9607843, 1, 0, 1,
-0.986946, 0.3875824, -0.4220315, 0.9568627, 1, 0, 1,
-0.9840965, -1.541915, -3.64165, 0.9490196, 1, 0, 1,
-0.9830158, -1.268769, -1.807309, 0.945098, 1, 0, 1,
-0.9798751, 0.9719534, -0.9058293, 0.9372549, 1, 0, 1,
-0.9745521, -0.2859702, -1.336835, 0.9333333, 1, 0, 1,
-0.9745156, -0.7876903, -1.347744, 0.9254902, 1, 0, 1,
-0.9727305, -1.093551, -3.675036, 0.9215686, 1, 0, 1,
-0.9692863, 0.2210669, -1.683071, 0.9137255, 1, 0, 1,
-0.9603519, 0.5584671, -0.5387962, 0.9098039, 1, 0, 1,
-0.9575108, -1.574141, -3.219193, 0.9019608, 1, 0, 1,
-0.9560933, 0.2678571, -0.6463376, 0.8941177, 1, 0, 1,
-0.9557512, -0.282957, 0.348994, 0.8901961, 1, 0, 1,
-0.9483349, -0.3817143, -2.250639, 0.8823529, 1, 0, 1,
-0.9355974, 0.1447347, -2.22504, 0.8784314, 1, 0, 1,
-0.933983, -0.2727, -2.093068, 0.8705882, 1, 0, 1,
-0.9322782, -0.2879724, -2.712678, 0.8666667, 1, 0, 1,
-0.9234138, 1.188117, 0.07231338, 0.8588235, 1, 0, 1,
-0.9223685, 0.5333956, -1.043161, 0.854902, 1, 0, 1,
-0.9146685, -0.7859725, -3.007591, 0.8470588, 1, 0, 1,
-0.9055236, -1.156726, -1.951573, 0.8431373, 1, 0, 1,
-0.9016192, 1.576985, 0.2936421, 0.8352941, 1, 0, 1,
-0.8967925, 1.258854, -0.5839239, 0.8313726, 1, 0, 1,
-0.8967081, -2.123231, -5.343558, 0.8235294, 1, 0, 1,
-0.8952039, -1.190998, -2.958508, 0.8196079, 1, 0, 1,
-0.8937687, -0.1885569, -1.996103, 0.8117647, 1, 0, 1,
-0.8906057, 0.3775321, -0.1311519, 0.8078431, 1, 0, 1,
-0.8892924, 0.6756474, -0.90575, 0.8, 1, 0, 1,
-0.8844275, -0.3306681, -2.467623, 0.7921569, 1, 0, 1,
-0.8832444, 0.9680542, -1.740519, 0.7882353, 1, 0, 1,
-0.8830248, -3.041707, -2.978039, 0.7803922, 1, 0, 1,
-0.8829716, -1.818772, -2.305977, 0.7764706, 1, 0, 1,
-0.8815858, -0.3263303, -0.2472376, 0.7686275, 1, 0, 1,
-0.8671941, -1.650121, -1.272056, 0.7647059, 1, 0, 1,
-0.8605564, -0.4385748, 0.1974663, 0.7568628, 1, 0, 1,
-0.8580377, -1.661323, -3.614301, 0.7529412, 1, 0, 1,
-0.8560226, -1.629314, -1.626027, 0.7450981, 1, 0, 1,
-0.8452175, -0.1995759, -2.166047, 0.7411765, 1, 0, 1,
-0.8431456, -1.699399, -4.430006, 0.7333333, 1, 0, 1,
-0.8413251, -0.5778534, -1.87082, 0.7294118, 1, 0, 1,
-0.8410379, -1.148473, -1.13554, 0.7215686, 1, 0, 1,
-0.8399061, -0.3112734, -1.751437, 0.7176471, 1, 0, 1,
-0.836124, -0.7926646, -0.7172937, 0.7098039, 1, 0, 1,
-0.8297729, -0.5087512, -1.474517, 0.7058824, 1, 0, 1,
-0.8255824, -0.07210803, -0.8867881, 0.6980392, 1, 0, 1,
-0.8237839, 1.335314, -0.3060341, 0.6901961, 1, 0, 1,
-0.8230809, -0.1476258, -2.263644, 0.6862745, 1, 0, 1,
-0.8188595, 0.2445444, -1.187233, 0.6784314, 1, 0, 1,
-0.8117777, 0.3661627, -1.46574, 0.6745098, 1, 0, 1,
-0.8002985, -1.334602, -1.379794, 0.6666667, 1, 0, 1,
-0.7987802, 1.012303, -2.053028, 0.6627451, 1, 0, 1,
-0.7949939, 1.780467, -1.431897, 0.654902, 1, 0, 1,
-0.7839423, -0.971896, -5.114175, 0.6509804, 1, 0, 1,
-0.7809675, -0.630862, -0.8609646, 0.6431373, 1, 0, 1,
-0.7776008, 0.7111655, -0.8442511, 0.6392157, 1, 0, 1,
-0.7739983, -0.9341986, -2.706855, 0.6313726, 1, 0, 1,
-0.7699914, 1.746678, 0.4633915, 0.627451, 1, 0, 1,
-0.7674817, -0.2456863, -2.980838, 0.6196079, 1, 0, 1,
-0.7646156, -0.4216217, -1.361303, 0.6156863, 1, 0, 1,
-0.7645377, 0.3587773, -1.854457, 0.6078432, 1, 0, 1,
-0.75762, 0.08847588, -1.468398, 0.6039216, 1, 0, 1,
-0.7559099, -0.4134122, -0.6571496, 0.5960785, 1, 0, 1,
-0.7555229, -0.1636692, -1.722642, 0.5882353, 1, 0, 1,
-0.7531633, 0.8289174, -1.160727, 0.5843138, 1, 0, 1,
-0.7501692, 2.230287, 0.4396645, 0.5764706, 1, 0, 1,
-0.7440012, -0.1173385, -2.40509, 0.572549, 1, 0, 1,
-0.7417897, 0.05345332, -0.3501806, 0.5647059, 1, 0, 1,
-0.7389892, -0.2598617, -2.615023, 0.5607843, 1, 0, 1,
-0.7367686, 0.5011388, -0.3540815, 0.5529412, 1, 0, 1,
-0.7325243, 1.745795, 0.1432175, 0.5490196, 1, 0, 1,
-0.7306789, 2.971114, -2.169313, 0.5411765, 1, 0, 1,
-0.7301981, -0.1816934, -0.8273801, 0.5372549, 1, 0, 1,
-0.7273216, -0.9699463, -2.677307, 0.5294118, 1, 0, 1,
-0.7246844, 0.6933762, -1.480207, 0.5254902, 1, 0, 1,
-0.7205844, 0.4854027, -1.389563, 0.5176471, 1, 0, 1,
-0.7182733, 0.4223094, -1.337153, 0.5137255, 1, 0, 1,
-0.7171738, 1.08448, -0.02746112, 0.5058824, 1, 0, 1,
-0.7148387, 1.448193, -0.6176382, 0.5019608, 1, 0, 1,
-0.7126406, -0.1518128, -2.282302, 0.4941176, 1, 0, 1,
-0.7098108, -0.3743808, -2.092227, 0.4862745, 1, 0, 1,
-0.7085354, 0.542464, -2.299537, 0.4823529, 1, 0, 1,
-0.7048831, 0.1000471, -1.42493, 0.4745098, 1, 0, 1,
-0.6971395, 0.483522, -1.820574, 0.4705882, 1, 0, 1,
-0.6962759, -1.834253, -0.619819, 0.4627451, 1, 0, 1,
-0.6936692, 2.441556, 0.522682, 0.4588235, 1, 0, 1,
-0.6867837, -1.002933, -3.987401, 0.4509804, 1, 0, 1,
-0.6862921, -1.355187, -4.133395, 0.4470588, 1, 0, 1,
-0.6739638, 0.9545941, -0.323566, 0.4392157, 1, 0, 1,
-0.670077, -0.6276715, -0.09277342, 0.4352941, 1, 0, 1,
-0.6682938, -1.830274, -1.95828, 0.427451, 1, 0, 1,
-0.6648514, -0.7495995, -1.872895, 0.4235294, 1, 0, 1,
-0.6647348, -0.2013282, -1.576166, 0.4156863, 1, 0, 1,
-0.6634732, 0.3374219, -0.1882745, 0.4117647, 1, 0, 1,
-0.6576049, 0.1483296, -2.749472, 0.4039216, 1, 0, 1,
-0.6397932, -0.6299301, -2.011499, 0.3960784, 1, 0, 1,
-0.6353086, 0.11512, -1.079493, 0.3921569, 1, 0, 1,
-0.6343551, 0.4117885, -1.545624, 0.3843137, 1, 0, 1,
-0.6327489, 0.3089795, -1.753547, 0.3803922, 1, 0, 1,
-0.6324514, 0.8330618, -1.495223, 0.372549, 1, 0, 1,
-0.6239255, 0.5866276, 0.187368, 0.3686275, 1, 0, 1,
-0.6234197, 0.6245978, -1.298717, 0.3607843, 1, 0, 1,
-0.616521, 1.119192, -0.7195806, 0.3568628, 1, 0, 1,
-0.6128604, 0.1860949, -1.040464, 0.3490196, 1, 0, 1,
-0.5932449, -1.392081, -4.217387, 0.345098, 1, 0, 1,
-0.5920744, -0.1750971, -1.294633, 0.3372549, 1, 0, 1,
-0.5852811, 0.8240808, -1.471261, 0.3333333, 1, 0, 1,
-0.5839624, -0.2072917, -1.643358, 0.3254902, 1, 0, 1,
-0.5768952, 0.7531589, -1.940473, 0.3215686, 1, 0, 1,
-0.575582, -1.201223, -2.887969, 0.3137255, 1, 0, 1,
-0.5747887, -0.08610733, -0.877399, 0.3098039, 1, 0, 1,
-0.5673621, 1.93936, 0.04179415, 0.3019608, 1, 0, 1,
-0.5668454, -1.343926, -2.688988, 0.2941177, 1, 0, 1,
-0.5660139, -0.4144009, -2.059176, 0.2901961, 1, 0, 1,
-0.5630911, 0.1681463, -2.132079, 0.282353, 1, 0, 1,
-0.5591335, 0.6232758, -1.16061, 0.2784314, 1, 0, 1,
-0.5551078, -0.7494905, -2.241943, 0.2705882, 1, 0, 1,
-0.5513798, 0.7466355, -0.1568532, 0.2666667, 1, 0, 1,
-0.5508887, -0.8219329, -1.606255, 0.2588235, 1, 0, 1,
-0.5492672, 0.5933415, -1.695095, 0.254902, 1, 0, 1,
-0.547653, -0.3168434, -2.117744, 0.2470588, 1, 0, 1,
-0.5455816, -1.441738, -4.559159, 0.2431373, 1, 0, 1,
-0.5443509, -0.1183646, -1.942194, 0.2352941, 1, 0, 1,
-0.5420656, 2.512729, -1.660648, 0.2313726, 1, 0, 1,
-0.541959, 0.1808454, -1.123133, 0.2235294, 1, 0, 1,
-0.539483, -1.767146, -4.167428, 0.2196078, 1, 0, 1,
-0.5386547, -0.1616352, -0.687825, 0.2117647, 1, 0, 1,
-0.5381172, -1.181702, -3.097086, 0.2078431, 1, 0, 1,
-0.5373054, -0.06100986, -0.338501, 0.2, 1, 0, 1,
-0.5369289, 0.2711429, -0.2766007, 0.1921569, 1, 0, 1,
-0.535854, -0.8482492, -2.788048, 0.1882353, 1, 0, 1,
-0.5301726, -1.267902, -3.37718, 0.1803922, 1, 0, 1,
-0.526619, -2.48787, -2.873892, 0.1764706, 1, 0, 1,
-0.5207765, 1.332189, 0.02743467, 0.1686275, 1, 0, 1,
-0.520016, 1.684826, -1.333951, 0.1647059, 1, 0, 1,
-0.5194797, -0.5064553, -2.926253, 0.1568628, 1, 0, 1,
-0.5149554, 0.8946559, 1.309646, 0.1529412, 1, 0, 1,
-0.5133321, -0.8549946, -3.479492, 0.145098, 1, 0, 1,
-0.5132166, 0.2354982, -0.4193694, 0.1411765, 1, 0, 1,
-0.5098863, 1.286505, -2.26924, 0.1333333, 1, 0, 1,
-0.5045133, 1.321319, 0.4031378, 0.1294118, 1, 0, 1,
-0.50214, -1.342211, -4.737333, 0.1215686, 1, 0, 1,
-0.4941808, -0.0951963, -1.270764, 0.1176471, 1, 0, 1,
-0.4907272, 0.4948038, -0.8639053, 0.1098039, 1, 0, 1,
-0.4857043, 1.469783, -1.388127, 0.1058824, 1, 0, 1,
-0.4827729, 1.73275, 1.290818, 0.09803922, 1, 0, 1,
-0.4809762, 0.4502544, -2.142363, 0.09019608, 1, 0, 1,
-0.480688, -0.3915337, -2.115781, 0.08627451, 1, 0, 1,
-0.47872, -0.4342757, -3.601215, 0.07843138, 1, 0, 1,
-0.4716167, 0.4288292, 0.4043398, 0.07450981, 1, 0, 1,
-0.471161, -0.2253763, -1.502128, 0.06666667, 1, 0, 1,
-0.4673658, 0.5914114, 0.1558949, 0.0627451, 1, 0, 1,
-0.4657519, -0.9782302, -2.210169, 0.05490196, 1, 0, 1,
-0.4619447, 0.8952312, -0.06896091, 0.05098039, 1, 0, 1,
-0.4606178, -0.5064305, -2.687249, 0.04313726, 1, 0, 1,
-0.4602991, -0.6220506, -3.894904, 0.03921569, 1, 0, 1,
-0.4591463, 0.4286438, -0.02625155, 0.03137255, 1, 0, 1,
-0.4591197, 0.08107555, -3.097827, 0.02745098, 1, 0, 1,
-0.4507406, -0.1526009, -2.467362, 0.01960784, 1, 0, 1,
-0.4500789, -0.2490345, -1.230738, 0.01568628, 1, 0, 1,
-0.4491009, 0.2180957, 0.2729068, 0.007843138, 1, 0, 1,
-0.4483174, -1.278572, -3.018537, 0.003921569, 1, 0, 1,
-0.4431725, -1.328975, -3.723266, 0, 1, 0.003921569, 1,
-0.4390932, 0.9841576, 0.2831385, 0, 1, 0.01176471, 1,
-0.4378626, 0.1618364, -0.866721, 0, 1, 0.01568628, 1,
-0.427127, 0.6166682, 0.006259255, 0, 1, 0.02352941, 1,
-0.4255862, -0.6567549, -3.681922, 0, 1, 0.02745098, 1,
-0.4223186, 0.6609598, -0.826798, 0, 1, 0.03529412, 1,
-0.4218778, -0.5428112, -3.184897, 0, 1, 0.03921569, 1,
-0.4166595, -1.214709, -2.80013, 0, 1, 0.04705882, 1,
-0.4151106, 0.5869967, -0.4698451, 0, 1, 0.05098039, 1,
-0.4142732, 0.4574189, -0.9035406, 0, 1, 0.05882353, 1,
-0.4141852, -0.3101084, -2.252464, 0, 1, 0.0627451, 1,
-0.4098251, -1.453682, -2.87861, 0, 1, 0.07058824, 1,
-0.4076256, 1.267936, -0.8538119, 0, 1, 0.07450981, 1,
-0.4072676, 0.4155532, -1.324548, 0, 1, 0.08235294, 1,
-0.403264, 0.239565, -0.169252, 0, 1, 0.08627451, 1,
-0.4031198, 1.420063, 0.0842953, 0, 1, 0.09411765, 1,
-0.3951747, 1.234368, -0.8370788, 0, 1, 0.1019608, 1,
-0.3891138, 0.3117678, -0.05303432, 0, 1, 0.1058824, 1,
-0.3866784, 0.4516767, -0.8826962, 0, 1, 0.1137255, 1,
-0.3863995, -1.737448, -4.356716, 0, 1, 0.1176471, 1,
-0.3855028, -0.7076514, -2.659632, 0, 1, 0.1254902, 1,
-0.3839797, 0.2241317, -1.71058, 0, 1, 0.1294118, 1,
-0.3817686, -0.8938281, -1.536443, 0, 1, 0.1372549, 1,
-0.3756311, -0.1991564, -3.304919, 0, 1, 0.1411765, 1,
-0.3727261, 1.764063, -0.7018042, 0, 1, 0.1490196, 1,
-0.3723799, 0.106735, -1.361115, 0, 1, 0.1529412, 1,
-0.3697158, 0.1627617, -0.3050534, 0, 1, 0.1607843, 1,
-0.3633764, -0.3282813, -1.23194, 0, 1, 0.1647059, 1,
-0.355029, -0.6910953, -4.316004, 0, 1, 0.172549, 1,
-0.3436651, 0.4564717, -1.636317, 0, 1, 0.1764706, 1,
-0.3399425, -0.5828175, -2.223424, 0, 1, 0.1843137, 1,
-0.3388854, -0.4164416, -2.040585, 0, 1, 0.1882353, 1,
-0.3379794, 0.1625533, -0.2588674, 0, 1, 0.1960784, 1,
-0.3323378, -0.08555113, -2.5371, 0, 1, 0.2039216, 1,
-0.328963, -0.1740019, -1.83946, 0, 1, 0.2078431, 1,
-0.3284179, 0.4179889, -1.665764, 0, 1, 0.2156863, 1,
-0.3283663, 0.9493007, 0.1441423, 0, 1, 0.2196078, 1,
-0.3255175, 0.05753312, -2.244589, 0, 1, 0.227451, 1,
-0.3254703, -0.01068368, -1.28758, 0, 1, 0.2313726, 1,
-0.3233972, 0.7534333, 0.1151132, 0, 1, 0.2392157, 1,
-0.3213218, -0.2924166, -2.668524, 0, 1, 0.2431373, 1,
-0.3110879, 0.04303142, -0.4991854, 0, 1, 0.2509804, 1,
-0.3086101, -0.9755388, -4.716081, 0, 1, 0.254902, 1,
-0.2969885, 0.4318451, -2.238221, 0, 1, 0.2627451, 1,
-0.296795, 1.099911, -0.1870703, 0, 1, 0.2666667, 1,
-0.2941782, -0.4378625, -2.612716, 0, 1, 0.2745098, 1,
-0.2940792, -0.5937626, -3.839455, 0, 1, 0.2784314, 1,
-0.2940329, -0.5101963, -2.361948, 0, 1, 0.2862745, 1,
-0.2878727, -0.1931899, -1.819921, 0, 1, 0.2901961, 1,
-0.2845092, 1.808873, -0.3149658, 0, 1, 0.2980392, 1,
-0.2824558, 1.320549, 0.2321988, 0, 1, 0.3058824, 1,
-0.2821336, -0.1249849, -2.544365, 0, 1, 0.3098039, 1,
-0.2810164, -0.4535442, -3.36128, 0, 1, 0.3176471, 1,
-0.2784034, -2.762552, -3.552945, 0, 1, 0.3215686, 1,
-0.2772695, -2.420221, -1.517811, 0, 1, 0.3294118, 1,
-0.2731485, 0.3022032, -2.039979, 0, 1, 0.3333333, 1,
-0.2725469, 0.2768933, 1.309952, 0, 1, 0.3411765, 1,
-0.2693077, 0.1968942, -1.864162, 0, 1, 0.345098, 1,
-0.2692864, 0.5018879, -0.4866035, 0, 1, 0.3529412, 1,
-0.2691445, -0.10523, -2.475174, 0, 1, 0.3568628, 1,
-0.2688456, -0.5376779, -1.839595, 0, 1, 0.3647059, 1,
-0.2679135, 1.28671, -0.6663243, 0, 1, 0.3686275, 1,
-0.2675169, -1.410577, -3.078848, 0, 1, 0.3764706, 1,
-0.2665039, 0.4760906, 0.2232326, 0, 1, 0.3803922, 1,
-0.2610797, 1.377824, -0.1100036, 0, 1, 0.3882353, 1,
-0.2579212, -0.08525524, -2.881653, 0, 1, 0.3921569, 1,
-0.2554729, 0.5233764, -1.206195, 0, 1, 0.4, 1,
-0.2539824, -0.8031515, -3.290176, 0, 1, 0.4078431, 1,
-0.2533201, -0.2550669, -3.206957, 0, 1, 0.4117647, 1,
-0.2523212, 0.6887336, 0.5854703, 0, 1, 0.4196078, 1,
-0.2500989, 0.598048, -0.3918105, 0, 1, 0.4235294, 1,
-0.2494801, -2.199903, -4.599242, 0, 1, 0.4313726, 1,
-0.2444329, -0.5472246, -2.577699, 0, 1, 0.4352941, 1,
-0.2441768, 0.09390631, -1.329754, 0, 1, 0.4431373, 1,
-0.2419961, -0.7012474, -2.854873, 0, 1, 0.4470588, 1,
-0.2413529, -1.547127, -3.125552, 0, 1, 0.454902, 1,
-0.2405968, 0.2419562, -0.7668031, 0, 1, 0.4588235, 1,
-0.2405774, 1.000932, -1.84185, 0, 1, 0.4666667, 1,
-0.2399549, 0.2027142, -0.2920297, 0, 1, 0.4705882, 1,
-0.2394286, -0.4856503, -4.136636, 0, 1, 0.4784314, 1,
-0.2356886, 0.3632659, -1.300212, 0, 1, 0.4823529, 1,
-0.2345929, 1.681748, 1.915809, 0, 1, 0.4901961, 1,
-0.2323446, -0.266144, -2.871749, 0, 1, 0.4941176, 1,
-0.2303564, 0.8080748, -0.2896086, 0, 1, 0.5019608, 1,
-0.2299946, 0.09778663, -1.840039, 0, 1, 0.509804, 1,
-0.2284222, 0.4320172, 0.2807007, 0, 1, 0.5137255, 1,
-0.2218135, -0.7767796, -2.500025, 0, 1, 0.5215687, 1,
-0.2166563, 0.1518524, -2.416729, 0, 1, 0.5254902, 1,
-0.2161559, -1.132259, -2.33119, 0, 1, 0.5333334, 1,
-0.2134707, 0.9492702, 1.227812, 0, 1, 0.5372549, 1,
-0.2133261, -0.3658683, -2.761781, 0, 1, 0.5450981, 1,
-0.212748, -0.1782833, -2.961705, 0, 1, 0.5490196, 1,
-0.2088714, -0.7584952, -3.280376, 0, 1, 0.5568628, 1,
-0.2064189, -0.3212651, -1.595175, 0, 1, 0.5607843, 1,
-0.2047125, -0.2384469, -1.15847, 0, 1, 0.5686275, 1,
-0.1959005, 1.043166, -2.097974, 0, 1, 0.572549, 1,
-0.1945083, -0.2656606, -1.816986, 0, 1, 0.5803922, 1,
-0.1942966, 0.04966882, -0.1081663, 0, 1, 0.5843138, 1,
-0.1916238, -0.01956333, -3.078754, 0, 1, 0.5921569, 1,
-0.1875952, 0.8588567, -0.961509, 0, 1, 0.5960785, 1,
-0.1851096, -1.256534, -2.70555, 0, 1, 0.6039216, 1,
-0.1833879, -0.6032543, -0.9923101, 0, 1, 0.6117647, 1,
-0.1833231, 1.245564, -0.6681589, 0, 1, 0.6156863, 1,
-0.1829218, 0.06395348, -0.8786398, 0, 1, 0.6235294, 1,
-0.1795826, -1.346778, -0.8548501, 0, 1, 0.627451, 1,
-0.1781425, 0.575565, 1.482596, 0, 1, 0.6352941, 1,
-0.1751076, 0.3419562, -1.423763, 0, 1, 0.6392157, 1,
-0.1657865, -0.03734095, -2.520767, 0, 1, 0.6470588, 1,
-0.1634965, -0.2861673, -2.613162, 0, 1, 0.6509804, 1,
-0.1617043, -0.2859469, -0.425539, 0, 1, 0.6588235, 1,
-0.1558745, -0.3040777, -1.722225, 0, 1, 0.6627451, 1,
-0.1552057, 0.6973826, -1.784276, 0, 1, 0.6705883, 1,
-0.1549499, 0.09967236, -1.36218, 0, 1, 0.6745098, 1,
-0.1487097, 0.7053475, -0.7028967, 0, 1, 0.682353, 1,
-0.1460167, 0.5902494, 0.7092277, 0, 1, 0.6862745, 1,
-0.1404062, -1.087336, -1.800465, 0, 1, 0.6941177, 1,
-0.1393519, 0.9936392, 0.2073131, 0, 1, 0.7019608, 1,
-0.1377871, -0.7902638, -2.076653, 0, 1, 0.7058824, 1,
-0.1371995, 0.952379, 0.2982628, 0, 1, 0.7137255, 1,
-0.1268105, 0.3526992, 0.3691774, 0, 1, 0.7176471, 1,
-0.1250217, -2.745495, -1.160235, 0, 1, 0.7254902, 1,
-0.1247203, -0.8289445, -3.980645, 0, 1, 0.7294118, 1,
-0.1155771, 1.001732, -0.7138557, 0, 1, 0.7372549, 1,
-0.1122191, -0.1557427, -3.655578, 0, 1, 0.7411765, 1,
-0.10989, 0.4386896, 1.119195, 0, 1, 0.7490196, 1,
-0.1096099, 0.991044, 0.7299984, 0, 1, 0.7529412, 1,
-0.1021772, -1.112011, -2.864123, 0, 1, 0.7607843, 1,
-0.10193, -0.8295317, -3.368664, 0, 1, 0.7647059, 1,
-0.09560297, 1.368778, 0.02475002, 0, 1, 0.772549, 1,
-0.09545068, -1.008422, -2.769726, 0, 1, 0.7764706, 1,
-0.0946456, -0.9239552, -3.716261, 0, 1, 0.7843137, 1,
-0.09183098, -0.8550861, -2.353015, 0, 1, 0.7882353, 1,
-0.09136936, 0.4404766, 0.4133386, 0, 1, 0.7960784, 1,
-0.08843177, 0.8909988, -1.214087, 0, 1, 0.8039216, 1,
-0.0872433, -0.7571099, -2.554435, 0, 1, 0.8078431, 1,
-0.08640753, -1.168451, -2.008741, 0, 1, 0.8156863, 1,
-0.08546496, 1.691458, -0.3967108, 0, 1, 0.8196079, 1,
-0.0812923, 0.2272285, 2.24958, 0, 1, 0.827451, 1,
-0.07911318, 0.03156253, -0.7547998, 0, 1, 0.8313726, 1,
-0.0725294, -1.291959, -3.445934, 0, 1, 0.8392157, 1,
-0.07141193, 0.7280972, -1.702873, 0, 1, 0.8431373, 1,
-0.07040597, -1.131187, -1.883718, 0, 1, 0.8509804, 1,
-0.06925045, 1.765104, -1.42394, 0, 1, 0.854902, 1,
-0.068095, -0.312306, -1.630944, 0, 1, 0.8627451, 1,
-0.06681465, 0.7311426, 1.976467, 0, 1, 0.8666667, 1,
-0.06639861, 0.831772, -0.495642, 0, 1, 0.8745098, 1,
-0.06344078, -0.1838086, 0.3028692, 0, 1, 0.8784314, 1,
-0.06265545, 0.267322, -1.303795, 0, 1, 0.8862745, 1,
-0.06211908, -1.35489, -2.114091, 0, 1, 0.8901961, 1,
-0.06070764, -1.041888, -4.432853, 0, 1, 0.8980392, 1,
-0.05961873, 0.0855953, -0.7728119, 0, 1, 0.9058824, 1,
-0.05563485, -0.5086898, -0.9626019, 0, 1, 0.9098039, 1,
-0.055077, 1.082192, 0.3418229, 0, 1, 0.9176471, 1,
-0.05130123, 2.156555, 1.418686, 0, 1, 0.9215686, 1,
-0.05084564, 0.4305324, 0.4796968, 0, 1, 0.9294118, 1,
-0.04843865, 1.080185, -2.255374, 0, 1, 0.9333333, 1,
-0.04674964, 0.06139696, -0.7557373, 0, 1, 0.9411765, 1,
-0.04472192, 0.7669164, 0.09485374, 0, 1, 0.945098, 1,
-0.04397184, -0.3269477, -3.382128, 0, 1, 0.9529412, 1,
-0.04390015, -0.3381874, -3.414375, 0, 1, 0.9568627, 1,
-0.04168638, -1.1858, -3.413257, 0, 1, 0.9647059, 1,
-0.04111815, 1.352265, 0.03923276, 0, 1, 0.9686275, 1,
-0.03479261, -0.9787275, -3.562077, 0, 1, 0.9764706, 1,
-0.03181612, -1.775422, -2.314896, 0, 1, 0.9803922, 1,
-0.02228983, 0.9089375, 0.04393696, 0, 1, 0.9882353, 1,
-0.01662464, -0.9222703, -3.629437, 0, 1, 0.9921569, 1,
-0.01498063, -0.9017869, -3.241839, 0, 1, 1, 1,
-0.0141287, 0.5561166, 1.094571, 0, 0.9921569, 1, 1,
-0.01023789, 0.0506658, -0.005439975, 0, 0.9882353, 1, 1,
-0.009439711, 1.441313, -0.4663903, 0, 0.9803922, 1, 1,
-0.006017647, -0.5716683, -2.106185, 0, 0.9764706, 1, 1,
-0.004386431, 1.671256, 0.1323591, 0, 0.9686275, 1, 1,
-0.004343727, -0.3640782, -4.879994, 0, 0.9647059, 1, 1,
0.003278306, 1.078978, -0.5688863, 0, 0.9568627, 1, 1,
0.006530987, 0.4775251, 0.4163815, 0, 0.9529412, 1, 1,
0.008764684, -1.651381, 3.567629, 0, 0.945098, 1, 1,
0.009515684, 0.09495749, -0.7110354, 0, 0.9411765, 1, 1,
0.01213693, -0.4890535, 3.747177, 0, 0.9333333, 1, 1,
0.0135918, 1.859797, -1.34707, 0, 0.9294118, 1, 1,
0.01366364, -0.05244534, 2.584738, 0, 0.9215686, 1, 1,
0.01466397, 1.101769, -0.8086789, 0, 0.9176471, 1, 1,
0.0194273, 0.4881477, -1.041677, 0, 0.9098039, 1, 1,
0.02150723, -1.051275, 1.653831, 0, 0.9058824, 1, 1,
0.02369932, -0.4424825, 2.810568, 0, 0.8980392, 1, 1,
0.02667952, 0.2093182, 1.036557, 0, 0.8901961, 1, 1,
0.02718485, -0.9939555, 3.111991, 0, 0.8862745, 1, 1,
0.02919824, -1.720357, 2.766838, 0, 0.8784314, 1, 1,
0.03202871, 1.333427, -1.372371, 0, 0.8745098, 1, 1,
0.03578834, 1.609586, 0.274961, 0, 0.8666667, 1, 1,
0.04305467, -0.294272, 3.356885, 0, 0.8627451, 1, 1,
0.04597471, 0.9181647, -0.6567986, 0, 0.854902, 1, 1,
0.04679849, 1.369289, -1.471668, 0, 0.8509804, 1, 1,
0.04780565, 0.6803491, 0.8018934, 0, 0.8431373, 1, 1,
0.05482074, 0.2634108, 1.008583, 0, 0.8392157, 1, 1,
0.05571891, -0.006403721, 2.756639, 0, 0.8313726, 1, 1,
0.06059531, 0.9633095, -1.676832, 0, 0.827451, 1, 1,
0.06195321, -0.4639928, 1.769652, 0, 0.8196079, 1, 1,
0.06226831, -3.063035, 1.742698, 0, 0.8156863, 1, 1,
0.06322265, 0.8509262, -0.07243206, 0, 0.8078431, 1, 1,
0.06631838, -1.899956, 3.4031, 0, 0.8039216, 1, 1,
0.0724693, 0.2646298, 1.303851, 0, 0.7960784, 1, 1,
0.0738254, -1.23405, 2.856196, 0, 0.7882353, 1, 1,
0.07563626, -0.8465498, 1.166913, 0, 0.7843137, 1, 1,
0.07788707, 0.2998137, 1.303117, 0, 0.7764706, 1, 1,
0.0812133, -0.9686941, 5.381495, 0, 0.772549, 1, 1,
0.08161826, -1.210604, 2.589043, 0, 0.7647059, 1, 1,
0.08299234, 0.9406469, 0.1363047, 0, 0.7607843, 1, 1,
0.08645852, -0.6115949, 2.390381, 0, 0.7529412, 1, 1,
0.08719435, 0.4080052, -0.9578201, 0, 0.7490196, 1, 1,
0.09302747, -1.084077, 2.557272, 0, 0.7411765, 1, 1,
0.09570046, -0.2174061, 2.867711, 0, 0.7372549, 1, 1,
0.1029996, 2.030476, 0.9044258, 0, 0.7294118, 1, 1,
0.1037859, 1.015145, -1.161114, 0, 0.7254902, 1, 1,
0.1076883, -0.210278, 3.078061, 0, 0.7176471, 1, 1,
0.1085936, 0.2793912, 1.483887, 0, 0.7137255, 1, 1,
0.1121508, -0.9709363, 3.540941, 0, 0.7058824, 1, 1,
0.1156351, -0.90821, 2.135551, 0, 0.6980392, 1, 1,
0.1163964, -0.4233517, 3.309496, 0, 0.6941177, 1, 1,
0.1169914, -0.2292635, 2.456793, 0, 0.6862745, 1, 1,
0.1177388, -1.806498, 1.743099, 0, 0.682353, 1, 1,
0.1183767, -0.5527468, 3.315836, 0, 0.6745098, 1, 1,
0.1202709, -0.2319915, 3.206475, 0, 0.6705883, 1, 1,
0.1203085, -0.3802297, 3.758216, 0, 0.6627451, 1, 1,
0.122486, 0.3591412, 1.055817, 0, 0.6588235, 1, 1,
0.1233407, -0.3580496, 3.659824, 0, 0.6509804, 1, 1,
0.1287563, 0.4846255, -0.7019047, 0, 0.6470588, 1, 1,
0.1295762, -0.6367135, 3.536701, 0, 0.6392157, 1, 1,
0.1304829, -0.7392583, 2.912906, 0, 0.6352941, 1, 1,
0.134325, 0.1532033, 0.03913225, 0, 0.627451, 1, 1,
0.1382713, 0.09671286, 0.7445704, 0, 0.6235294, 1, 1,
0.1396212, 1.131808, 1.164751, 0, 0.6156863, 1, 1,
0.1462736, 0.924152, -0.6132573, 0, 0.6117647, 1, 1,
0.1467501, 0.5988581, -2.033657, 0, 0.6039216, 1, 1,
0.1477096, 2.288851, -0.6771814, 0, 0.5960785, 1, 1,
0.1505819, 0.2829049, -1.80445, 0, 0.5921569, 1, 1,
0.1516487, -2.272639, 4.646183, 0, 0.5843138, 1, 1,
0.1549614, -0.1658751, 2.843311, 0, 0.5803922, 1, 1,
0.1602473, 0.798119, 0.4482032, 0, 0.572549, 1, 1,
0.163096, 0.3707157, 1.181189, 0, 0.5686275, 1, 1,
0.1674225, 0.6163442, 1.762923, 0, 0.5607843, 1, 1,
0.1714019, 2.743348, 1.670347, 0, 0.5568628, 1, 1,
0.174212, -1.278525, 4.007737, 0, 0.5490196, 1, 1,
0.1758158, 1.106954, -0.5173171, 0, 0.5450981, 1, 1,
0.1768858, 0.2411992, 1.959696, 0, 0.5372549, 1, 1,
0.1772668, -1.389721, 3.899942, 0, 0.5333334, 1, 1,
0.1791765, -0.8356647, 0.7764714, 0, 0.5254902, 1, 1,
0.1793537, 1.17285, 0.2236761, 0, 0.5215687, 1, 1,
0.1827438, 0.7078969, -0.5792271, 0, 0.5137255, 1, 1,
0.1829356, 0.4242924, 1.589186, 0, 0.509804, 1, 1,
0.1840572, -0.3497126, 1.797205, 0, 0.5019608, 1, 1,
0.1846361, -0.3421014, 1.488275, 0, 0.4941176, 1, 1,
0.188637, 0.7571198, 1.169863, 0, 0.4901961, 1, 1,
0.1898658, 0.344145, 2.187624, 0, 0.4823529, 1, 1,
0.1913415, 0.1161417, 1.457183, 0, 0.4784314, 1, 1,
0.1917302, -0.6280054, 2.486176, 0, 0.4705882, 1, 1,
0.1956266, 0.2994483, 0.115051, 0, 0.4666667, 1, 1,
0.2005581, -0.5423227, 5.128429, 0, 0.4588235, 1, 1,
0.2017891, 1.192881, 0.7144303, 0, 0.454902, 1, 1,
0.2040899, 1.00925, 1.346013, 0, 0.4470588, 1, 1,
0.2055034, -0.329912, 1.73203, 0, 0.4431373, 1, 1,
0.2056505, 1.892634, 0.6931817, 0, 0.4352941, 1, 1,
0.2071827, -0.5556868, 1.969799, 0, 0.4313726, 1, 1,
0.2082675, 1.714529, -0.09298199, 0, 0.4235294, 1, 1,
0.2098206, 0.6608049, 0.29003, 0, 0.4196078, 1, 1,
0.2132314, 0.7454935, -1.342036, 0, 0.4117647, 1, 1,
0.2189074, -1.689061, 3.364855, 0, 0.4078431, 1, 1,
0.2244063, -1.204727, 3.62906, 0, 0.4, 1, 1,
0.2302617, -0.2385565, 0.5600935, 0, 0.3921569, 1, 1,
0.2452542, -1.523771, 2.498095, 0, 0.3882353, 1, 1,
0.2469483, -0.8552155, 1.499498, 0, 0.3803922, 1, 1,
0.2510778, -1.767925, 2.708665, 0, 0.3764706, 1, 1,
0.2548248, -0.418023, 1.906942, 0, 0.3686275, 1, 1,
0.2570677, -1.692961, 2.190488, 0, 0.3647059, 1, 1,
0.2579952, 1.487474, 0.9866824, 0, 0.3568628, 1, 1,
0.2601733, -1.368927, 1.56843, 0, 0.3529412, 1, 1,
0.2699408, -0.2185989, 0.3601539, 0, 0.345098, 1, 1,
0.2783162, 0.8229762, 0.01936514, 0, 0.3411765, 1, 1,
0.2797328, -0.2729376, 0.6410748, 0, 0.3333333, 1, 1,
0.2816782, -0.4543844, 3.489497, 0, 0.3294118, 1, 1,
0.2821908, 0.006548312, 2.035878, 0, 0.3215686, 1, 1,
0.2932812, -1.463059, 4.21607, 0, 0.3176471, 1, 1,
0.2953781, -1.134553, 4.499343, 0, 0.3098039, 1, 1,
0.2985368, 0.3541291, 1.53669, 0, 0.3058824, 1, 1,
0.3010204, -0.673553, 2.825812, 0, 0.2980392, 1, 1,
0.3055232, -0.1416978, 1.86645, 0, 0.2901961, 1, 1,
0.3096895, 0.5024583, 0.7134445, 0, 0.2862745, 1, 1,
0.315761, 0.7120334, -2.443696, 0, 0.2784314, 1, 1,
0.3157706, -0.8141373, 2.200837, 0, 0.2745098, 1, 1,
0.3165702, -1.416323, 3.077161, 0, 0.2666667, 1, 1,
0.3183669, 1.345661, 0.4272889, 0, 0.2627451, 1, 1,
0.3273207, -0.4464816, 2.164849, 0, 0.254902, 1, 1,
0.3278477, 1.998902, 0.447421, 0, 0.2509804, 1, 1,
0.3283165, -1.633512, 3.110729, 0, 0.2431373, 1, 1,
0.3307014, 0.3867659, -1.083538, 0, 0.2392157, 1, 1,
0.3309442, -0.8419665, 4.884902, 0, 0.2313726, 1, 1,
0.3339119, 0.06006951, 1.713072, 0, 0.227451, 1, 1,
0.3358712, -0.7679188, 2.290691, 0, 0.2196078, 1, 1,
0.3365714, -0.9561924, 1.961262, 0, 0.2156863, 1, 1,
0.3507012, 2.050219, -0.107056, 0, 0.2078431, 1, 1,
0.3510341, -1.254374, 3.067539, 0, 0.2039216, 1, 1,
0.3517685, -1.478878, 4.42615, 0, 0.1960784, 1, 1,
0.3539883, 0.540325, 1.355559, 0, 0.1882353, 1, 1,
0.356801, 1.776839, -0.6654779, 0, 0.1843137, 1, 1,
0.3606005, -0.4005263, 3.280347, 0, 0.1764706, 1, 1,
0.3619569, -0.4995206, 1.157284, 0, 0.172549, 1, 1,
0.3667469, 0.3778762, -0.8450627, 0, 0.1647059, 1, 1,
0.3680099, -0.7294782, 3.949612, 0, 0.1607843, 1, 1,
0.370038, 0.6577266, -1.646416, 0, 0.1529412, 1, 1,
0.3730009, 1.410893, 0.4649464, 0, 0.1490196, 1, 1,
0.3740987, -0.4066872, 2.259528, 0, 0.1411765, 1, 1,
0.3762462, 0.2617818, 0.1827398, 0, 0.1372549, 1, 1,
0.379256, 0.5719122, 0.949803, 0, 0.1294118, 1, 1,
0.3812406, -0.06758105, 2.6043, 0, 0.1254902, 1, 1,
0.3826766, 1.576806, -0.3766093, 0, 0.1176471, 1, 1,
0.3877072, -0.8468122, 2.123803, 0, 0.1137255, 1, 1,
0.393628, -0.255451, 2.042103, 0, 0.1058824, 1, 1,
0.3945654, -0.1476964, 3.866672, 0, 0.09803922, 1, 1,
0.3973026, 1.466921, -0.09528906, 0, 0.09411765, 1, 1,
0.3980614, -0.6386803, 0.3116257, 0, 0.08627451, 1, 1,
0.3984976, 0.09652179, 3.003843, 0, 0.08235294, 1, 1,
0.4012156, -1.36884, 4.521054, 0, 0.07450981, 1, 1,
0.4032591, 0.4967061, 1.008217, 0, 0.07058824, 1, 1,
0.4037772, 0.02661129, -0.01180738, 0, 0.0627451, 1, 1,
0.4079453, -2.252487, 0.4361297, 0, 0.05882353, 1, 1,
0.4105717, -0.8177388, 1.228819, 0, 0.05098039, 1, 1,
0.4134885, -0.5202556, 1.983796, 0, 0.04705882, 1, 1,
0.41363, -0.8436183, 4.422855, 0, 0.03921569, 1, 1,
0.4165579, 0.7097333, 0.1714201, 0, 0.03529412, 1, 1,
0.4180483, -0.3418147, 3.854535, 0, 0.02745098, 1, 1,
0.4299138, -0.3575961, 1.682433, 0, 0.02352941, 1, 1,
0.4302679, -1.281689, 4.384031, 0, 0.01568628, 1, 1,
0.4334015, -1.466398, 3.094458, 0, 0.01176471, 1, 1,
0.4340095, 0.2345365, 1.305501, 0, 0.003921569, 1, 1,
0.4362157, -0.4338343, 3.9544, 0.003921569, 0, 1, 1,
0.4368056, 1.173465, 2.933853, 0.007843138, 0, 1, 1,
0.439403, 0.5058857, 1.684661, 0.01568628, 0, 1, 1,
0.4418244, -0.8539054, 1.833111, 0.01960784, 0, 1, 1,
0.4420525, -0.508939, 5.000989, 0.02745098, 0, 1, 1,
0.4427646, -1.73442, 2.068246, 0.03137255, 0, 1, 1,
0.4430799, -0.7036228, 2.107471, 0.03921569, 0, 1, 1,
0.4437962, -1.06485, 3.005302, 0.04313726, 0, 1, 1,
0.4441646, 0.5738224, 0.1425506, 0.05098039, 0, 1, 1,
0.4478177, 0.07101902, 3.062336, 0.05490196, 0, 1, 1,
0.4525918, -0.6034036, 2.487739, 0.0627451, 0, 1, 1,
0.4584868, -0.3879635, 1.688887, 0.06666667, 0, 1, 1,
0.4597827, -1.914586, 4.212391, 0.07450981, 0, 1, 1,
0.460985, -0.1060561, 1.278754, 0.07843138, 0, 1, 1,
0.461785, -0.08830819, 1.538602, 0.08627451, 0, 1, 1,
0.4619798, 2.051478, -0.100141, 0.09019608, 0, 1, 1,
0.4638244, -1.584041, 3.147826, 0.09803922, 0, 1, 1,
0.4695843, 0.5940053, 2.440689, 0.1058824, 0, 1, 1,
0.4708634, -1.124773, 2.817343, 0.1098039, 0, 1, 1,
0.472832, 0.0149035, 0.2049918, 0.1176471, 0, 1, 1,
0.4778516, -1.523365, 3.288145, 0.1215686, 0, 1, 1,
0.4808984, -0.2087335, 1.739698, 0.1294118, 0, 1, 1,
0.4840677, -0.6154506, 1.719023, 0.1333333, 0, 1, 1,
0.4897792, 0.9842464, -0.1442588, 0.1411765, 0, 1, 1,
0.4902378, -2.364137, 1.866058, 0.145098, 0, 1, 1,
0.4916666, 0.244243, 0.09405519, 0.1529412, 0, 1, 1,
0.4967999, 1.862041, 1.727252, 0.1568628, 0, 1, 1,
0.4975912, -1.707702, 2.529398, 0.1647059, 0, 1, 1,
0.5001671, 0.0130166, 2.129928, 0.1686275, 0, 1, 1,
0.501231, 1.109095, 0.4615007, 0.1764706, 0, 1, 1,
0.5083715, -1.233042, 2.397505, 0.1803922, 0, 1, 1,
0.5089877, 0.2838881, 0.6413502, 0.1882353, 0, 1, 1,
0.509061, -0.2493902, 1.95632, 0.1921569, 0, 1, 1,
0.5132984, 0.8016756, 0.1070785, 0.2, 0, 1, 1,
0.5153883, -0.4698568, 0.7306013, 0.2078431, 0, 1, 1,
0.5174897, 1.894747, 0.8636157, 0.2117647, 0, 1, 1,
0.5178312, 1.560539, -0.1989888, 0.2196078, 0, 1, 1,
0.5215276, 0.7802706, -0.4363216, 0.2235294, 0, 1, 1,
0.5218647, -1.83755, 2.58158, 0.2313726, 0, 1, 1,
0.5273129, 0.4000508, 1.345002, 0.2352941, 0, 1, 1,
0.530179, 1.131131, 0.7442648, 0.2431373, 0, 1, 1,
0.5331141, -1.135368, 2.638908, 0.2470588, 0, 1, 1,
0.5357651, -0.9719629, 4.536649, 0.254902, 0, 1, 1,
0.5361856, 1.725485, 1.143935, 0.2588235, 0, 1, 1,
0.5411837, -1.899641, 4.060404, 0.2666667, 0, 1, 1,
0.5436566, 0.3851423, -2.45987, 0.2705882, 0, 1, 1,
0.5474071, -0.9706087, 2.871195, 0.2784314, 0, 1, 1,
0.5550251, 0.8790271, 3.03129, 0.282353, 0, 1, 1,
0.5576582, 0.2873458, 1.961785, 0.2901961, 0, 1, 1,
0.5618697, 1.02267, -1.159633, 0.2941177, 0, 1, 1,
0.5703847, -0.619741, 1.897414, 0.3019608, 0, 1, 1,
0.5786914, -0.6806002, -0.3847936, 0.3098039, 0, 1, 1,
0.5804665, -0.462781, -0.08362383, 0.3137255, 0, 1, 1,
0.5828549, -1.123652, 4.340073, 0.3215686, 0, 1, 1,
0.5848569, -0.2515416, 1.928427, 0.3254902, 0, 1, 1,
0.5888541, 0.9687697, -0.08880322, 0.3333333, 0, 1, 1,
0.5900246, 0.1874187, 0.9825661, 0.3372549, 0, 1, 1,
0.5910847, -0.8338415, 2.959295, 0.345098, 0, 1, 1,
0.5916209, 0.7244248, 0.699783, 0.3490196, 0, 1, 1,
0.5923494, -1.784496, 3.964495, 0.3568628, 0, 1, 1,
0.59648, 1.837957, 0.3546296, 0.3607843, 0, 1, 1,
0.6017334, -1.551497, 2.508539, 0.3686275, 0, 1, 1,
0.6042956, 0.7672997, 0.3850314, 0.372549, 0, 1, 1,
0.60518, 0.4768408, 1.76456, 0.3803922, 0, 1, 1,
0.6052686, 1.63565, 2.007983, 0.3843137, 0, 1, 1,
0.6055431, 0.680509, 1.615265, 0.3921569, 0, 1, 1,
0.6079967, 0.7211834, 2.84714, 0.3960784, 0, 1, 1,
0.6111886, -0.7795929, 1.562696, 0.4039216, 0, 1, 1,
0.6155953, 1.185353, 1.02029, 0.4117647, 0, 1, 1,
0.6156779, -2.289634, 2.560843, 0.4156863, 0, 1, 1,
0.6164662, 0.2461749, 1.759703, 0.4235294, 0, 1, 1,
0.6185627, 0.8374113, 0.5181432, 0.427451, 0, 1, 1,
0.6203178, -1.4671, 2.898412, 0.4352941, 0, 1, 1,
0.6204844, -1.300073, 1.394572, 0.4392157, 0, 1, 1,
0.6234619, -1.825416, 3.364345, 0.4470588, 0, 1, 1,
0.6234755, 1.997836, 0.8558767, 0.4509804, 0, 1, 1,
0.6240385, -0.4003185, 0.7659427, 0.4588235, 0, 1, 1,
0.6240954, -1.648705, 2.858537, 0.4627451, 0, 1, 1,
0.6250831, -0.0582236, 0.744615, 0.4705882, 0, 1, 1,
0.6369601, 1.50553, 1.798777, 0.4745098, 0, 1, 1,
0.6378742, 0.2356307, 1.077026, 0.4823529, 0, 1, 1,
0.6411933, -0.7177417, 2.714395, 0.4862745, 0, 1, 1,
0.6461036, -1.086923, 3.004546, 0.4941176, 0, 1, 1,
0.6469249, 0.7621028, -1.079638, 0.5019608, 0, 1, 1,
0.6606658, -0.1428233, 2.706725, 0.5058824, 0, 1, 1,
0.6606928, -1.734854, 2.910743, 0.5137255, 0, 1, 1,
0.6650113, 0.4217014, -0.4112059, 0.5176471, 0, 1, 1,
0.667359, -1.051993, 2.598349, 0.5254902, 0, 1, 1,
0.6719902, -0.1728433, 2.897187, 0.5294118, 0, 1, 1,
0.6725985, 1.51357, 1.407052, 0.5372549, 0, 1, 1,
0.6760675, 0.8374915, -0.5632533, 0.5411765, 0, 1, 1,
0.6807451, 1.3366, 2.688375, 0.5490196, 0, 1, 1,
0.6851932, 0.2309737, 0.6266699, 0.5529412, 0, 1, 1,
0.6871806, 0.1727413, 2.828908, 0.5607843, 0, 1, 1,
0.6881687, 0.02435794, 0.8189119, 0.5647059, 0, 1, 1,
0.688856, 1.255332, -0.3782831, 0.572549, 0, 1, 1,
0.6894929, 2.086847, 0.9269058, 0.5764706, 0, 1, 1,
0.6926273, 0.367497, 1.156955, 0.5843138, 0, 1, 1,
0.6940861, -1.257245, 2.05703, 0.5882353, 0, 1, 1,
0.6951271, 0.8493609, -0.2207917, 0.5960785, 0, 1, 1,
0.7063614, 0.08673757, 0.8554523, 0.6039216, 0, 1, 1,
0.7067606, -0.3851424, 1.186321, 0.6078432, 0, 1, 1,
0.7114868, 0.6822354, 0.9809895, 0.6156863, 0, 1, 1,
0.7162124, 1.868405, 0.5513935, 0.6196079, 0, 1, 1,
0.7223035, 0.2759098, 0.7017685, 0.627451, 0, 1, 1,
0.7241122, -0.3439867, 1.505871, 0.6313726, 0, 1, 1,
0.7319276, -1.202927, 3.789403, 0.6392157, 0, 1, 1,
0.7367837, 0.6094352, 1.506072, 0.6431373, 0, 1, 1,
0.7395244, -0.0474538, 2.367502, 0.6509804, 0, 1, 1,
0.7434139, 0.7738902, 0.6460112, 0.654902, 0, 1, 1,
0.7450498, -0.6872568, 3.465352, 0.6627451, 0, 1, 1,
0.7454242, 0.720916, 1.417854, 0.6666667, 0, 1, 1,
0.7474993, 0.06825458, 0.9637583, 0.6745098, 0, 1, 1,
0.7522206, 0.5381727, 1.157625, 0.6784314, 0, 1, 1,
0.7525486, -0.3688617, 2.717747, 0.6862745, 0, 1, 1,
0.7618036, 1.353375, 1.141394, 0.6901961, 0, 1, 1,
0.7640263, 0.7885902, 0.8120842, 0.6980392, 0, 1, 1,
0.7678331, -0.02387871, 1.742419, 0.7058824, 0, 1, 1,
0.7712461, 0.6154119, 0.4754616, 0.7098039, 0, 1, 1,
0.771354, -0.2786722, 1.218974, 0.7176471, 0, 1, 1,
0.7794141, 0.3412336, 1.73249, 0.7215686, 0, 1, 1,
0.7829082, -0.4449458, 2.404922, 0.7294118, 0, 1, 1,
0.783015, 0.289325, 0.5992911, 0.7333333, 0, 1, 1,
0.7840729, 1.070034, 1.956558, 0.7411765, 0, 1, 1,
0.79175, 0.7538897, 0.05972658, 0.7450981, 0, 1, 1,
0.7970557, -0.9641127, 1.620784, 0.7529412, 0, 1, 1,
0.8065515, -0.1174885, 3.056362, 0.7568628, 0, 1, 1,
0.8101398, 1.856607, -0.6063337, 0.7647059, 0, 1, 1,
0.8104122, -0.951791, 2.08804, 0.7686275, 0, 1, 1,
0.8134053, -0.2799403, 2.083264, 0.7764706, 0, 1, 1,
0.8138441, -1.646765, 2.797457, 0.7803922, 0, 1, 1,
0.8148339, -0.9932464, 3.317666, 0.7882353, 0, 1, 1,
0.8171455, -0.3536284, 0.8616977, 0.7921569, 0, 1, 1,
0.8190832, 0.9467348, 1.485723, 0.8, 0, 1, 1,
0.8264068, 1.631009, 0.8923147, 0.8078431, 0, 1, 1,
0.8291492, 0.8806654, 0.9796729, 0.8117647, 0, 1, 1,
0.8301966, -1.473008, 4.873501, 0.8196079, 0, 1, 1,
0.8394221, 0.974975, 1.584204, 0.8235294, 0, 1, 1,
0.8430003, 1.2154, 0.4831615, 0.8313726, 0, 1, 1,
0.8435798, 1.619921, 0.2485307, 0.8352941, 0, 1, 1,
0.8440603, -0.1197489, 1.409074, 0.8431373, 0, 1, 1,
0.8456171, 2.665256, 0.1027301, 0.8470588, 0, 1, 1,
0.8501438, -0.5419858, 2.93146, 0.854902, 0, 1, 1,
0.8547119, -0.6539342, 2.951002, 0.8588235, 0, 1, 1,
0.8547155, -1.743796, 3.186939, 0.8666667, 0, 1, 1,
0.8691522, -0.3071624, 1.053834, 0.8705882, 0, 1, 1,
0.8697414, 2.135711, 0.1777376, 0.8784314, 0, 1, 1,
0.8773308, -0.3177189, 1.111307, 0.8823529, 0, 1, 1,
0.8782812, 0.9743411, 2.455923, 0.8901961, 0, 1, 1,
0.8786584, 1.452271, -0.7640022, 0.8941177, 0, 1, 1,
0.8798417, -1.269711, 1.474843, 0.9019608, 0, 1, 1,
0.8804532, -0.2542291, 2.994677, 0.9098039, 0, 1, 1,
0.8888848, -0.4782323, 2.763637, 0.9137255, 0, 1, 1,
0.8893757, -0.9427417, 1.376911, 0.9215686, 0, 1, 1,
0.8948666, -0.3143141, 1.203888, 0.9254902, 0, 1, 1,
0.8995061, -0.1222359, 0.6718819, 0.9333333, 0, 1, 1,
0.9039838, -1.237864, 2.465029, 0.9372549, 0, 1, 1,
0.9105391, -1.193249, 3.434856, 0.945098, 0, 1, 1,
0.9114203, 1.187563, 1.669075, 0.9490196, 0, 1, 1,
0.9115099, 1.618339, -0.9014955, 0.9568627, 0, 1, 1,
0.9173414, 0.3746498, 1.522838, 0.9607843, 0, 1, 1,
0.9190971, 0.3608088, 1.389189, 0.9686275, 0, 1, 1,
0.9226579, 1.425568, 0.5739914, 0.972549, 0, 1, 1,
0.9242163, 0.05219257, 1.312159, 0.9803922, 0, 1, 1,
0.9250992, -0.7794521, 3.046453, 0.9843137, 0, 1, 1,
0.9287675, -0.3615713, 1.81091, 0.9921569, 0, 1, 1,
0.9352307, -1.058444, 1.479438, 0.9960784, 0, 1, 1,
0.9393463, -0.008812287, 2.340541, 1, 0, 0.9960784, 1,
0.9463155, 1.214439, -0.01869519, 1, 0, 0.9882353, 1,
0.9496951, 1.199142, 2.281564, 1, 0, 0.9843137, 1,
0.9609125, 1.982224, 0.490917, 1, 0, 0.9764706, 1,
0.9637235, -0.0443056, 3.271379, 1, 0, 0.972549, 1,
0.9667206, 0.5339543, 0.4847535, 1, 0, 0.9647059, 1,
0.9730633, -0.5812779, 1.136546, 1, 0, 0.9607843, 1,
0.9770491, 1.259324, 1.478508, 1, 0, 0.9529412, 1,
0.9881231, -0.1200316, 2.19785, 1, 0, 0.9490196, 1,
0.9925979, -1.624399, 3.540981, 1, 0, 0.9411765, 1,
0.998215, -0.6676664, 0.8323785, 1, 0, 0.9372549, 1,
0.9996367, 0.1881618, 0.04208584, 1, 0, 0.9294118, 1,
1.009599, 0.4303649, 3.169266, 1, 0, 0.9254902, 1,
1.012487, -1.783699, 0.4167844, 1, 0, 0.9176471, 1,
1.016436, 0.002917038, 2.18208, 1, 0, 0.9137255, 1,
1.018858, 0.5549455, 2.557604, 1, 0, 0.9058824, 1,
1.022324, 0.9390319, 1.363717, 1, 0, 0.9019608, 1,
1.022885, 0.07041594, 2.054081, 1, 0, 0.8941177, 1,
1.027973, 1.341399, -0.1775341, 1, 0, 0.8862745, 1,
1.031836, 0.1314713, 0.6640932, 1, 0, 0.8823529, 1,
1.034373, -0.5492449, 1.656718, 1, 0, 0.8745098, 1,
1.035073, 1.518855, 0.01022699, 1, 0, 0.8705882, 1,
1.037557, 2.290885, -0.5525711, 1, 0, 0.8627451, 1,
1.04827, 0.08975988, 2.172451, 1, 0, 0.8588235, 1,
1.048791, -1.400205, 0.8824766, 1, 0, 0.8509804, 1,
1.054588, 0.3524379, 0.7051815, 1, 0, 0.8470588, 1,
1.054777, -0.7966543, 2.193975, 1, 0, 0.8392157, 1,
1.055848, -0.7390295, 1.377904, 1, 0, 0.8352941, 1,
1.060695, -1.146759, 1.974337, 1, 0, 0.827451, 1,
1.073275, 0.7234393, 3.265076, 1, 0, 0.8235294, 1,
1.088036, -0.0002041257, 3.642869, 1, 0, 0.8156863, 1,
1.093485, -0.8319141, 2.77776, 1, 0, 0.8117647, 1,
1.096602, -0.1394287, 0.4669074, 1, 0, 0.8039216, 1,
1.100235, 0.3823021, 1.382769, 1, 0, 0.7960784, 1,
1.113673, -0.5305987, 1.013346, 1, 0, 0.7921569, 1,
1.114406, 0.966495, 3.197112, 1, 0, 0.7843137, 1,
1.114467, 0.55674, 2.258247, 1, 0, 0.7803922, 1,
1.117787, 0.3013673, 1.764614, 1, 0, 0.772549, 1,
1.11914, 0.5872473, 0.07733663, 1, 0, 0.7686275, 1,
1.120065, 0.3209238, 1.111166, 1, 0, 0.7607843, 1,
1.132887, -1.565663, 4.230418, 1, 0, 0.7568628, 1,
1.13335, -0.8992111, 2.970829, 1, 0, 0.7490196, 1,
1.140962, -0.1173931, -0.081772, 1, 0, 0.7450981, 1,
1.167811, -0.7128685, 3.56896, 1, 0, 0.7372549, 1,
1.168343, 0.1637047, 1.684915, 1, 0, 0.7333333, 1,
1.168414, -0.08462693, 1.645593, 1, 0, 0.7254902, 1,
1.173171, -0.3012638, 1.204691, 1, 0, 0.7215686, 1,
1.183493, 1.760647, 0.1611506, 1, 0, 0.7137255, 1,
1.191109, -0.6960911, 1.590792, 1, 0, 0.7098039, 1,
1.193132, -0.6042557, 1.524406, 1, 0, 0.7019608, 1,
1.195287, 0.7931197, 0.8188786, 1, 0, 0.6941177, 1,
1.211021, -1.905289, 3.710807, 1, 0, 0.6901961, 1,
1.228019, 0.7963393, 0.8765479, 1, 0, 0.682353, 1,
1.233194, 1.037033, 1.783755, 1, 0, 0.6784314, 1,
1.242336, -0.2322532, 1.435672, 1, 0, 0.6705883, 1,
1.260786, -0.1654264, 2.78473, 1, 0, 0.6666667, 1,
1.265411, -0.5439239, 1.174169, 1, 0, 0.6588235, 1,
1.273997, -0.5920821, 2.914501, 1, 0, 0.654902, 1,
1.277783, 1.021819, 2.69336, 1, 0, 0.6470588, 1,
1.28546, -2.77541, 2.336597, 1, 0, 0.6431373, 1,
1.290373, -0.6651542, 1.981524, 1, 0, 0.6352941, 1,
1.297527, -1.068175, 1.20213, 1, 0, 0.6313726, 1,
1.316927, -0.1155929, 1.85638, 1, 0, 0.6235294, 1,
1.334456, 1.082114, 0.3990136, 1, 0, 0.6196079, 1,
1.336206, 0.6656002, 0.8594552, 1, 0, 0.6117647, 1,
1.3395, -1.040116, 2.595569, 1, 0, 0.6078432, 1,
1.339954, -0.01528967, 1.085725, 1, 0, 0.6, 1,
1.340861, -0.4654868, 0.3813596, 1, 0, 0.5921569, 1,
1.351556, 0.8324302, 2.116334, 1, 0, 0.5882353, 1,
1.357262, 0.3193827, 0.4150991, 1, 0, 0.5803922, 1,
1.361581, -0.6390007, 2.414637, 1, 0, 0.5764706, 1,
1.362224, -0.8521083, 2.592633, 1, 0, 0.5686275, 1,
1.364574, 0.08420467, 3.280427, 1, 0, 0.5647059, 1,
1.372905, 1.379008, 1.923656, 1, 0, 0.5568628, 1,
1.383469, -1.38856, 1.997888, 1, 0, 0.5529412, 1,
1.388827, 1.800369, -1.867379, 1, 0, 0.5450981, 1,
1.396875, 1.129399, 1.593774, 1, 0, 0.5411765, 1,
1.404367, 0.4151188, 0.1100247, 1, 0, 0.5333334, 1,
1.405668, 0.5571082, 0.8593031, 1, 0, 0.5294118, 1,
1.40659, -2.497318, 2.928839, 1, 0, 0.5215687, 1,
1.411684, -1.019523, 0.7350592, 1, 0, 0.5176471, 1,
1.412514, 0.9031952, 2.088497, 1, 0, 0.509804, 1,
1.413484, 0.1959042, 1.957928, 1, 0, 0.5058824, 1,
1.414777, 1.291905, 1.513085, 1, 0, 0.4980392, 1,
1.419279, 0.7328495, 0.8633182, 1, 0, 0.4901961, 1,
1.419285, -0.4177032, 1.399043, 1, 0, 0.4862745, 1,
1.426389, 3.012876, -0.4222007, 1, 0, 0.4784314, 1,
1.42841, 0.7900574, -0.1290338, 1, 0, 0.4745098, 1,
1.429726, 0.8765069, 1.172468, 1, 0, 0.4666667, 1,
1.431041, -1.602087, 3.167231, 1, 0, 0.4627451, 1,
1.431815, -0.7108636, 2.784495, 1, 0, 0.454902, 1,
1.439751, -0.7884818, 2.816966, 1, 0, 0.4509804, 1,
1.441778, 1.235783, 1.032323, 1, 0, 0.4431373, 1,
1.442847, 1.091234, 1.824048, 1, 0, 0.4392157, 1,
1.444923, 1.26311, 1.415349, 1, 0, 0.4313726, 1,
1.455382, 1.259419, 0.4485987, 1, 0, 0.427451, 1,
1.456342, 1.351386, 0.1606712, 1, 0, 0.4196078, 1,
1.456925, 1.097677, 2.341048, 1, 0, 0.4156863, 1,
1.471436, 0.7133875, 1.767787, 1, 0, 0.4078431, 1,
1.4746, -0.5310777, -0.1141765, 1, 0, 0.4039216, 1,
1.495452, 0.9599019, 1.013219, 1, 0, 0.3960784, 1,
1.499799, -0.7659519, 1.731019, 1, 0, 0.3882353, 1,
1.517987, -1.467038, 0.7525537, 1, 0, 0.3843137, 1,
1.526573, -0.05642484, 1.973096, 1, 0, 0.3764706, 1,
1.527582, -0.2861925, -1.29808, 1, 0, 0.372549, 1,
1.534713, 0.1156841, 0.1304997, 1, 0, 0.3647059, 1,
1.536268, 1.149154, 0.7551311, 1, 0, 0.3607843, 1,
1.537275, 1.224013, 1.289504, 1, 0, 0.3529412, 1,
1.554437, 0.9686818, 1.50784, 1, 0, 0.3490196, 1,
1.555251, 1.336508, 0.559539, 1, 0, 0.3411765, 1,
1.562584, -0.02792715, 0.1147956, 1, 0, 0.3372549, 1,
1.601547, -0.6076048, 0.1769255, 1, 0, 0.3294118, 1,
1.622392, 0.8778125, 0.1816572, 1, 0, 0.3254902, 1,
1.631596, 0.02678375, 1.575139, 1, 0, 0.3176471, 1,
1.637826, 0.188267, 3.049437, 1, 0, 0.3137255, 1,
1.646801, -0.02857292, 2.045881, 1, 0, 0.3058824, 1,
1.655307, -0.2993637, 2.062462, 1, 0, 0.2980392, 1,
1.661739, 2.325346, 1.977968, 1, 0, 0.2941177, 1,
1.672979, 0.4546771, 0.1425901, 1, 0, 0.2862745, 1,
1.687348, -0.275796, 1.452505, 1, 0, 0.282353, 1,
1.699179, -0.5488364, 3.206562, 1, 0, 0.2745098, 1,
1.704843, 1.070767, 1.785579, 1, 0, 0.2705882, 1,
1.714644, 0.6980443, 0.4013957, 1, 0, 0.2627451, 1,
1.719591, -0.2999275, 0.3621213, 1, 0, 0.2588235, 1,
1.723606, -0.7658972, 2.231074, 1, 0, 0.2509804, 1,
1.734778, -0.3626878, 0.675971, 1, 0, 0.2470588, 1,
1.735675, 1.358713, 0.7391622, 1, 0, 0.2392157, 1,
1.742741, 0.1127213, 2.52355, 1, 0, 0.2352941, 1,
1.747972, -0.7465329, 1.103825, 1, 0, 0.227451, 1,
1.758232, 0.7532086, 2.325578, 1, 0, 0.2235294, 1,
1.764028, 1.575017, 0.1033147, 1, 0, 0.2156863, 1,
1.769985, 1.337003, -0.1453684, 1, 0, 0.2117647, 1,
1.788783, 0.1350393, 0.9482089, 1, 0, 0.2039216, 1,
1.810034, 1.028064, 0.6101449, 1, 0, 0.1960784, 1,
1.873025, 1.857955, 1.085047, 1, 0, 0.1921569, 1,
1.889652, -0.2659775, -0.09595811, 1, 0, 0.1843137, 1,
1.895663, 0.01492965, 0.5904262, 1, 0, 0.1803922, 1,
1.903828, -1.433488, 3.346246, 1, 0, 0.172549, 1,
1.906808, -0.6969076, 2.316204, 1, 0, 0.1686275, 1,
1.911882, -0.8341604, 2.334353, 1, 0, 0.1607843, 1,
1.91548, 0.1490427, 1.190284, 1, 0, 0.1568628, 1,
1.931396, -1.01116, 2.633912, 1, 0, 0.1490196, 1,
1.942895, -0.9231201, 2.730881, 1, 0, 0.145098, 1,
1.953844, 0.787052, 0.4389375, 1, 0, 0.1372549, 1,
1.973653, -0.8293985, 1.064375, 1, 0, 0.1333333, 1,
1.978172, 1.219086, 0.3584111, 1, 0, 0.1254902, 1,
1.986524, -0.1182493, 0.8553541, 1, 0, 0.1215686, 1,
1.987309, -0.5298501, 2.315633, 1, 0, 0.1137255, 1,
2.041068, -0.4424822, 1.690529, 1, 0, 0.1098039, 1,
2.105291, 0.5180095, 0.5766237, 1, 0, 0.1019608, 1,
2.131413, 0.02183499, 1.430053, 1, 0, 0.09411765, 1,
2.16576, 0.6468098, 1.86252, 1, 0, 0.09019608, 1,
2.213022, -0.2204144, 2.7629, 1, 0, 0.08235294, 1,
2.255152, -1.214992, 0.8426899, 1, 0, 0.07843138, 1,
2.263047, -0.7615887, 2.684458, 1, 0, 0.07058824, 1,
2.265661, 1.179024, 1.124831, 1, 0, 0.06666667, 1,
2.275083, -0.0001886509, 1.79797, 1, 0, 0.05882353, 1,
2.292693, -0.4489185, 2.853802, 1, 0, 0.05490196, 1,
2.364011, 0.6736117, 2.22022, 1, 0, 0.04705882, 1,
2.422037, -0.6678959, 2.531783, 1, 0, 0.04313726, 1,
2.458047, 0.809534, 1.455474, 1, 0, 0.03529412, 1,
2.519618, -1.67516, 3.015931, 1, 0, 0.03137255, 1,
2.627544, -0.09056687, 1.204059, 1, 0, 0.02352941, 1,
2.647638, -0.2068583, 1.144828, 1, 0, 0.01960784, 1,
2.742035, -2.694996, 1.980336, 1, 0, 0.01176471, 1,
3.505248, 0.7316471, 2.473094, 1, 0, 0.007843138, 1
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
-0.09843004, -4.111977, -7.161455, 0, -0.5, 0.5, 0.5,
-0.09843004, -4.111977, -7.161455, 1, -0.5, 0.5, 0.5,
-0.09843004, -4.111977, -7.161455, 1, 1.5, 0.5, 0.5,
-0.09843004, -4.111977, -7.161455, 0, 1.5, 0.5, 0.5
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
-4.923755, 0.03118694, -7.161455, 0, -0.5, 0.5, 0.5,
-4.923755, 0.03118694, -7.161455, 1, -0.5, 0.5, 0.5,
-4.923755, 0.03118694, -7.161455, 1, 1.5, 0.5, 0.5,
-4.923755, 0.03118694, -7.161455, 0, 1.5, 0.5, 0.5
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
-4.923755, -4.111977, 0.01896811, 0, -0.5, 0.5, 0.5,
-4.923755, -4.111977, 0.01896811, 1, -0.5, 0.5, 0.5,
-4.923755, -4.111977, 0.01896811, 1, 1.5, 0.5, 0.5,
-4.923755, -4.111977, 0.01896811, 0, 1.5, 0.5, 0.5
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
-2, -3.155862, -5.504434,
2, -3.155862, -5.504434,
-2, -3.155862, -5.504434,
-2, -3.315214, -5.780604,
0, -3.155862, -5.504434,
0, -3.315214, -5.780604,
2, -3.155862, -5.504434,
2, -3.315214, -5.780604
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
"0",
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
-2, -3.633919, -6.332944, 0, -0.5, 0.5, 0.5,
-2, -3.633919, -6.332944, 1, -0.5, 0.5, 0.5,
-2, -3.633919, -6.332944, 1, 1.5, 0.5, 0.5,
-2, -3.633919, -6.332944, 0, 1.5, 0.5, 0.5,
0, -3.633919, -6.332944, 0, -0.5, 0.5, 0.5,
0, -3.633919, -6.332944, 1, -0.5, 0.5, 0.5,
0, -3.633919, -6.332944, 1, 1.5, 0.5, 0.5,
0, -3.633919, -6.332944, 0, 1.5, 0.5, 0.5,
2, -3.633919, -6.332944, 0, -0.5, 0.5, 0.5,
2, -3.633919, -6.332944, 1, -0.5, 0.5, 0.5,
2, -3.633919, -6.332944, 1, 1.5, 0.5, 0.5,
2, -3.633919, -6.332944, 0, 1.5, 0.5, 0.5
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
-3.810219, -3, -5.504434,
-3.810219, 3, -5.504434,
-3.810219, -3, -5.504434,
-3.995808, -3, -5.780604,
-3.810219, -2, -5.504434,
-3.995808, -2, -5.780604,
-3.810219, -1, -5.504434,
-3.995808, -1, -5.780604,
-3.810219, 0, -5.504434,
-3.995808, 0, -5.780604,
-3.810219, 1, -5.504434,
-3.995808, 1, -5.780604,
-3.810219, 2, -5.504434,
-3.995808, 2, -5.780604,
-3.810219, 3, -5.504434,
-3.995808, 3, -5.780604
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
-4.366987, -3, -6.332944, 0, -0.5, 0.5, 0.5,
-4.366987, -3, -6.332944, 1, -0.5, 0.5, 0.5,
-4.366987, -3, -6.332944, 1, 1.5, 0.5, 0.5,
-4.366987, -3, -6.332944, 0, 1.5, 0.5, 0.5,
-4.366987, -2, -6.332944, 0, -0.5, 0.5, 0.5,
-4.366987, -2, -6.332944, 1, -0.5, 0.5, 0.5,
-4.366987, -2, -6.332944, 1, 1.5, 0.5, 0.5,
-4.366987, -2, -6.332944, 0, 1.5, 0.5, 0.5,
-4.366987, -1, -6.332944, 0, -0.5, 0.5, 0.5,
-4.366987, -1, -6.332944, 1, -0.5, 0.5, 0.5,
-4.366987, -1, -6.332944, 1, 1.5, 0.5, 0.5,
-4.366987, -1, -6.332944, 0, 1.5, 0.5, 0.5,
-4.366987, 0, -6.332944, 0, -0.5, 0.5, 0.5,
-4.366987, 0, -6.332944, 1, -0.5, 0.5, 0.5,
-4.366987, 0, -6.332944, 1, 1.5, 0.5, 0.5,
-4.366987, 0, -6.332944, 0, 1.5, 0.5, 0.5,
-4.366987, 1, -6.332944, 0, -0.5, 0.5, 0.5,
-4.366987, 1, -6.332944, 1, -0.5, 0.5, 0.5,
-4.366987, 1, -6.332944, 1, 1.5, 0.5, 0.5,
-4.366987, 1, -6.332944, 0, 1.5, 0.5, 0.5,
-4.366987, 2, -6.332944, 0, -0.5, 0.5, 0.5,
-4.366987, 2, -6.332944, 1, -0.5, 0.5, 0.5,
-4.366987, 2, -6.332944, 1, 1.5, 0.5, 0.5,
-4.366987, 2, -6.332944, 0, 1.5, 0.5, 0.5,
-4.366987, 3, -6.332944, 0, -0.5, 0.5, 0.5,
-4.366987, 3, -6.332944, 1, -0.5, 0.5, 0.5,
-4.366987, 3, -6.332944, 1, 1.5, 0.5, 0.5,
-4.366987, 3, -6.332944, 0, 1.5, 0.5, 0.5
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
-3.810219, -3.155862, -4,
-3.810219, -3.155862, 4,
-3.810219, -3.155862, -4,
-3.995808, -3.315214, -4,
-3.810219, -3.155862, -2,
-3.995808, -3.315214, -2,
-3.810219, -3.155862, 0,
-3.995808, -3.315214, 0,
-3.810219, -3.155862, 2,
-3.995808, -3.315214, 2,
-3.810219, -3.155862, 4,
-3.995808, -3.315214, 4
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
-4.366987, -3.633919, -4, 0, -0.5, 0.5, 0.5,
-4.366987, -3.633919, -4, 1, -0.5, 0.5, 0.5,
-4.366987, -3.633919, -4, 1, 1.5, 0.5, 0.5,
-4.366987, -3.633919, -4, 0, 1.5, 0.5, 0.5,
-4.366987, -3.633919, -2, 0, -0.5, 0.5, 0.5,
-4.366987, -3.633919, -2, 1, -0.5, 0.5, 0.5,
-4.366987, -3.633919, -2, 1, 1.5, 0.5, 0.5,
-4.366987, -3.633919, -2, 0, 1.5, 0.5, 0.5,
-4.366987, -3.633919, 0, 0, -0.5, 0.5, 0.5,
-4.366987, -3.633919, 0, 1, -0.5, 0.5, 0.5,
-4.366987, -3.633919, 0, 1, 1.5, 0.5, 0.5,
-4.366987, -3.633919, 0, 0, 1.5, 0.5, 0.5,
-4.366987, -3.633919, 2, 0, -0.5, 0.5, 0.5,
-4.366987, -3.633919, 2, 1, -0.5, 0.5, 0.5,
-4.366987, -3.633919, 2, 1, 1.5, 0.5, 0.5,
-4.366987, -3.633919, 2, 0, 1.5, 0.5, 0.5,
-4.366987, -3.633919, 4, 0, -0.5, 0.5, 0.5,
-4.366987, -3.633919, 4, 1, -0.5, 0.5, 0.5,
-4.366987, -3.633919, 4, 1, 1.5, 0.5, 0.5,
-4.366987, -3.633919, 4, 0, 1.5, 0.5, 0.5
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
-3.810219, -3.155862, -5.504434,
-3.810219, 3.218236, -5.504434,
-3.810219, -3.155862, 5.54237,
-3.810219, 3.218236, 5.54237,
-3.810219, -3.155862, -5.504434,
-3.810219, -3.155862, 5.54237,
-3.810219, 3.218236, -5.504434,
-3.810219, 3.218236, 5.54237,
-3.810219, -3.155862, -5.504434,
3.613358, -3.155862, -5.504434,
-3.810219, -3.155862, 5.54237,
3.613358, -3.155862, 5.54237,
-3.810219, 3.218236, -5.504434,
3.613358, 3.218236, -5.504434,
-3.810219, 3.218236, 5.54237,
3.613358, 3.218236, 5.54237,
3.613358, -3.155862, -5.504434,
3.613358, 3.218236, -5.504434,
3.613358, -3.155862, 5.54237,
3.613358, 3.218236, 5.54237,
3.613358, -3.155862, -5.504434,
3.613358, -3.155862, 5.54237,
3.613358, 3.218236, -5.504434,
3.613358, 3.218236, 5.54237
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
var radius = 7.879978;
var distance = 35.05891;
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
mvMatrix.translate( 0.09843004, -0.03118694, -0.01896811 );
mvMatrix.scale( 1.147693, 1.336658, 0.7712625 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.05891);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
propanecarboxylate_2<-read.table("propanecarboxylate_2.xyz")
```

```
## Error in read.table("propanecarboxylate_2.xyz"): no lines available in input
```

```r
x<-propanecarboxylate_2$V2
```

```
## Error in eval(expr, envir, enclos): object 'propanecarboxylate_2' not found
```

```r
y<-propanecarboxylate_2$V3
```

```
## Error in eval(expr, envir, enclos): object 'propanecarboxylate_2' not found
```

```r
z<-propanecarboxylate_2$V4
```

```
## Error in eval(expr, envir, enclos): object 'propanecarboxylate_2' not found
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
-3.702108, 0.5502423, -1.182939, 0, 0, 1, 1, 1,
-3.272753, 0.5060214, -0.4151812, 1, 0, 0, 1, 1,
-3.102964, -0.2639291, -1.339008, 1, 0, 0, 1, 1,
-3.016176, 0.1901034, 0.4033757, 1, 0, 0, 1, 1,
-2.619116, -0.2552709, -1.81863, 1, 0, 0, 1, 1,
-2.565234, 0.776448, -1.501634, 1, 0, 0, 1, 1,
-2.557916, 1.641254, -1.406247, 0, 0, 0, 1, 1,
-2.542543, -0.05949475, -2.823931, 0, 0, 0, 1, 1,
-2.522734, 0.3805864, -3.666573, 0, 0, 0, 1, 1,
-2.503097, 0.09661305, -0.4900482, 0, 0, 0, 1, 1,
-2.493741, 1.408835, 0.7257697, 0, 0, 0, 1, 1,
-2.401118, -0.07890493, -2.234581, 0, 0, 0, 1, 1,
-2.398586, -0.2501392, -1.592676, 0, 0, 0, 1, 1,
-2.369854, -0.07400295, -0.8369354, 1, 1, 1, 1, 1,
-2.328627, -0.01994382, -0.7964581, 1, 1, 1, 1, 1,
-2.289993, -0.5607515, -1.280797, 1, 1, 1, 1, 1,
-2.265802, 0.6116481, -0.6871239, 1, 1, 1, 1, 1,
-2.181418, 0.1699947, -1.18626, 1, 1, 1, 1, 1,
-2.177627, 1.456318, -1.676897, 1, 1, 1, 1, 1,
-2.118121, -0.5464101, -0.9750007, 1, 1, 1, 1, 1,
-2.109213, -0.2076878, -2.536758, 1, 1, 1, 1, 1,
-2.107754, -0.6964003, -1.076033, 1, 1, 1, 1, 1,
-2.091548, -0.6740829, -1.808802, 1, 1, 1, 1, 1,
-2.069002, 1.445068, -1.485605, 1, 1, 1, 1, 1,
-2.065075, -0.05076014, -1.572324, 1, 1, 1, 1, 1,
-2.063386, -0.0444229, -2.030421, 1, 1, 1, 1, 1,
-2.022178, -0.3994409, -0.9020361, 1, 1, 1, 1, 1,
-2.011868, 1.480317, -2.561301, 1, 1, 1, 1, 1,
-2.010516, -0.1274638, -1.237769, 0, 0, 1, 1, 1,
-2.001635, 0.7756433, -2.328843, 1, 0, 0, 1, 1,
-1.982525, -2.454753, -1.919801, 1, 0, 0, 1, 1,
-1.962607, 0.2881896, -0.6965256, 1, 0, 0, 1, 1,
-1.940434, 2.044582, -0.1598244, 1, 0, 0, 1, 1,
-1.922687, 0.931904, -2.458167, 1, 0, 0, 1, 1,
-1.871045, 1.528176, -0.1468779, 0, 0, 0, 1, 1,
-1.849754, -0.2819928, -0.9789988, 0, 0, 0, 1, 1,
-1.846691, 0.2754316, -0.1689447, 0, 0, 0, 1, 1,
-1.807255, -0.3130768, -0.8205768, 0, 0, 0, 1, 1,
-1.785477, -0.8588836, -1.522081, 0, 0, 0, 1, 1,
-1.783135, 1.748326, -0.9042185, 0, 0, 0, 1, 1,
-1.782946, -0.7226548, -1.152768, 0, 0, 0, 1, 1,
-1.772152, 1.115201, -1.458374, 1, 1, 1, 1, 1,
-1.771737, 1.664665, -1.185436, 1, 1, 1, 1, 1,
-1.769, -0.4951777, -2.798363, 1, 1, 1, 1, 1,
-1.766543, -1.375854, -2.757062, 1, 1, 1, 1, 1,
-1.746273, 0.1639727, -1.402212, 1, 1, 1, 1, 1,
-1.729848, -0.5259762, -2.423018, 1, 1, 1, 1, 1,
-1.727905, 0.2868266, -1.705983, 1, 1, 1, 1, 1,
-1.722443, -0.3160306, -0.7848558, 1, 1, 1, 1, 1,
-1.719998, 1.251034, -0.2941617, 1, 1, 1, 1, 1,
-1.708243, 0.02237774, -1.287633, 1, 1, 1, 1, 1,
-1.707566, -0.5341891, -1.347486, 1, 1, 1, 1, 1,
-1.701019, -1.340954, -1.265704, 1, 1, 1, 1, 1,
-1.668815, -0.5095589, -1.838962, 1, 1, 1, 1, 1,
-1.66734, -0.930399, -1.603444, 1, 1, 1, 1, 1,
-1.660903, 0.4528027, -0.3822985, 1, 1, 1, 1, 1,
-1.659524, 1.081785, -2.071175, 0, 0, 1, 1, 1,
-1.654469, -0.2993396, 0.7723309, 1, 0, 0, 1, 1,
-1.628496, 1.152959, -0.8445285, 1, 0, 0, 1, 1,
-1.621465, 1.57362, -0.5197396, 1, 0, 0, 1, 1,
-1.610897, 1.15828, -0.8719376, 1, 0, 0, 1, 1,
-1.604023, 0.5980493, -1.529397, 1, 0, 0, 1, 1,
-1.591876, -0.3992156, -1.541259, 0, 0, 0, 1, 1,
-1.581051, -0.9219814, -1.359177, 0, 0, 0, 1, 1,
-1.561298, -0.4185574, -1.831184, 0, 0, 0, 1, 1,
-1.558647, -0.7514485, -0.6889964, 0, 0, 0, 1, 1,
-1.558472, -0.354324, -2.341475, 0, 0, 0, 1, 1,
-1.54139, -1.382716, -2.381415, 0, 0, 0, 1, 1,
-1.540999, 0.2866008, -0.774538, 0, 0, 0, 1, 1,
-1.539693, -0.04654126, -1.180246, 1, 1, 1, 1, 1,
-1.532363, 1.480042, -2.916813, 1, 1, 1, 1, 1,
-1.517507, -0.4033585, -1.428366, 1, 1, 1, 1, 1,
-1.49808, -0.1333965, -1.473127, 1, 1, 1, 1, 1,
-1.497614, 0.712929, -0.7446172, 1, 1, 1, 1, 1,
-1.495968, -0.5350457, -0.527405, 1, 1, 1, 1, 1,
-1.495212, -0.3983577, 0.1899906, 1, 1, 1, 1, 1,
-1.49408, 1.733368, -0.6094004, 1, 1, 1, 1, 1,
-1.49213, -1.938642, -3.083852, 1, 1, 1, 1, 1,
-1.48125, -1.01576, -1.663775, 1, 1, 1, 1, 1,
-1.463896, 0.5829218, -1.020278, 1, 1, 1, 1, 1,
-1.461638, 1.016076, -1.581601, 1, 1, 1, 1, 1,
-1.454549, 0.8339477, -0.9323814, 1, 1, 1, 1, 1,
-1.446374, 0.2668933, -0.5981948, 1, 1, 1, 1, 1,
-1.43866, 0.21139, -1.007506, 1, 1, 1, 1, 1,
-1.435391, -0.4420401, -3.398672, 0, 0, 1, 1, 1,
-1.429782, -0.5727404, -0.7481181, 1, 0, 0, 1, 1,
-1.423964, -0.3745613, -3.355702, 1, 0, 0, 1, 1,
-1.420123, 0.2923799, -1.193008, 1, 0, 0, 1, 1,
-1.409995, 0.4094937, -1.137951, 1, 0, 0, 1, 1,
-1.40793, 0.8363932, -1.73317, 1, 0, 0, 1, 1,
-1.40564, -0.2903729, -0.1624906, 0, 0, 0, 1, 1,
-1.39028, 1.233789, -2.616667, 0, 0, 0, 1, 1,
-1.387447, -0.1775918, -2.514586, 0, 0, 0, 1, 1,
-1.38616, 0.1165213, -1.510806, 0, 0, 0, 1, 1,
-1.386004, 0.1567526, -1.955098, 0, 0, 0, 1, 1,
-1.378165, 1.564876, -1.521167, 0, 0, 0, 1, 1,
-1.374131, -0.1848329, -1.913407, 0, 0, 0, 1, 1,
-1.373158, 0.7725996, 0.1513537, 1, 1, 1, 1, 1,
-1.371502, 1.100091, -1.919739, 1, 1, 1, 1, 1,
-1.370793, 0.3953713, 0.3006745, 1, 1, 1, 1, 1,
-1.369853, 1.11909, -0.5879933, 1, 1, 1, 1, 1,
-1.335534, -1.269691, -1.61595, 1, 1, 1, 1, 1,
-1.329451, 0.7948722, -0.5014148, 1, 1, 1, 1, 1,
-1.316101, 0.4200432, 0.1869625, 1, 1, 1, 1, 1,
-1.313877, -0.6034518, -3.021664, 1, 1, 1, 1, 1,
-1.307687, -0.01577169, -0.9286099, 1, 1, 1, 1, 1,
-1.299595, -0.4749541, -2.819773, 1, 1, 1, 1, 1,
-1.289697, 0.521899, 0.7450721, 1, 1, 1, 1, 1,
-1.284143, -1.33154, -3.330372, 1, 1, 1, 1, 1,
-1.271474, -1.116437, -1.660784, 1, 1, 1, 1, 1,
-1.271274, 0.4395396, -0.6122857, 1, 1, 1, 1, 1,
-1.267096, 0.9518092, -0.5276789, 1, 1, 1, 1, 1,
-1.26341, -0.4497128, -2.368564, 0, 0, 1, 1, 1,
-1.262711, -1.332013, -2.305151, 1, 0, 0, 1, 1,
-1.251394, -1.972567, -3.312915, 1, 0, 0, 1, 1,
-1.250257, 0.03658495, -0.07701225, 1, 0, 0, 1, 1,
-1.246899, 0.7800366, -1.269452, 1, 0, 0, 1, 1,
-1.246354, 1.055746, 0.6308606, 1, 0, 0, 1, 1,
-1.238938, 0.841556, -0.6133159, 0, 0, 0, 1, 1,
-1.235392, 2.877928, -1.016784, 0, 0, 0, 1, 1,
-1.234012, 0.5752642, 0.6310701, 0, 0, 0, 1, 1,
-1.224966, 0.6092821, -0.4547591, 0, 0, 0, 1, 1,
-1.218406, -0.5036418, -1.799698, 0, 0, 0, 1, 1,
-1.204474, 1.140718, -2.862546, 0, 0, 0, 1, 1,
-1.201704, 1.019961, -2.624682, 0, 0, 0, 1, 1,
-1.201258, -1.2048, -1.923019, 1, 1, 1, 1, 1,
-1.200815, 0.3029692, -1.074962, 1, 1, 1, 1, 1,
-1.200527, 3.125409, -1.189843, 1, 1, 1, 1, 1,
-1.192025, -0.6243346, -2.81524, 1, 1, 1, 1, 1,
-1.189793, -0.5075171, -2.103003, 1, 1, 1, 1, 1,
-1.184054, 0.5994642, -0.769303, 1, 1, 1, 1, 1,
-1.183029, -0.2678126, -2.524217, 1, 1, 1, 1, 1,
-1.175132, 1.316332, -0.2925837, 1, 1, 1, 1, 1,
-1.174278, 1.446476, -0.7625458, 1, 1, 1, 1, 1,
-1.168578, 1.208783, -0.613515, 1, 1, 1, 1, 1,
-1.166706, -1.065482, -1.562224, 1, 1, 1, 1, 1,
-1.162854, -0.6205503, -3.93951, 1, 1, 1, 1, 1,
-1.158844, -0.7281215, -3.162508, 1, 1, 1, 1, 1,
-1.156407, -1.083137, -1.849252, 1, 1, 1, 1, 1,
-1.154112, 0.7452064, -2.403877, 1, 1, 1, 1, 1,
-1.150952, -1.627468, -1.30996, 0, 0, 1, 1, 1,
-1.150343, -2.035899, -1.941776, 1, 0, 0, 1, 1,
-1.149595, 0.777257, 0.6822543, 1, 0, 0, 1, 1,
-1.138272, 0.3228199, -0.3607548, 1, 0, 0, 1, 1,
-1.137103, 0.428986, -0.4411755, 1, 0, 0, 1, 1,
-1.131171, -0.6779428, -2.544031, 1, 0, 0, 1, 1,
-1.122534, -0.03337762, -0.6538103, 0, 0, 0, 1, 1,
-1.118812, -0.3313596, -1.996563, 0, 0, 0, 1, 1,
-1.100061, 0.2986796, -2.473411, 0, 0, 0, 1, 1,
-1.099647, 1.217646, -1.660188, 0, 0, 0, 1, 1,
-1.099249, 1.070193, -1.324018, 0, 0, 0, 1, 1,
-1.094489, -0.1470303, -1.803831, 0, 0, 0, 1, 1,
-1.093975, 0.9792273, -1.503144, 0, 0, 0, 1, 1,
-1.091254, 1.000352, -0.497081, 1, 1, 1, 1, 1,
-1.089095, -0.7629993, -1.154926, 1, 1, 1, 1, 1,
-1.087537, -0.9169195, -3.759043, 1, 1, 1, 1, 1,
-1.079967, 0.8188366, -1.500088, 1, 1, 1, 1, 1,
-1.072322, -1.234654, -2.870702, 1, 1, 1, 1, 1,
-1.069749, 0.6924613, 0.8631703, 1, 1, 1, 1, 1,
-1.063352, -0.1551676, -0.1973669, 1, 1, 1, 1, 1,
-1.055735, 2.323706, 0.9970308, 1, 1, 1, 1, 1,
-1.050323, 0.4060385, -2.621556, 1, 1, 1, 1, 1,
-1.047889, -0.4020756, -2.786965, 1, 1, 1, 1, 1,
-1.045354, -2.090652, -4.070273, 1, 1, 1, 1, 1,
-1.045192, -0.03394884, -1.896233, 1, 1, 1, 1, 1,
-1.030779, -2.068545, -3.061492, 1, 1, 1, 1, 1,
-1.022356, -0.06685717, -1.65473, 1, 1, 1, 1, 1,
-1.015202, 0.9504735, -1.127877, 1, 1, 1, 1, 1,
-1.008124, 1.588335, -0.5345775, 0, 0, 1, 1, 1,
-1.004474, -0.1844222, -3.372557, 1, 0, 0, 1, 1,
-1.003101, -1.634701, -1.396909, 1, 0, 0, 1, 1,
-0.9989713, 1.306494, -0.2722243, 1, 0, 0, 1, 1,
-0.9968763, -2.295095, -3.789944, 1, 0, 0, 1, 1,
-0.9944515, 0.5666232, -2.675671, 1, 0, 0, 1, 1,
-0.986946, 0.3875824, -0.4220315, 0, 0, 0, 1, 1,
-0.9840965, -1.541915, -3.64165, 0, 0, 0, 1, 1,
-0.9830158, -1.268769, -1.807309, 0, 0, 0, 1, 1,
-0.9798751, 0.9719534, -0.9058293, 0, 0, 0, 1, 1,
-0.9745521, -0.2859702, -1.336835, 0, 0, 0, 1, 1,
-0.9745156, -0.7876903, -1.347744, 0, 0, 0, 1, 1,
-0.9727305, -1.093551, -3.675036, 0, 0, 0, 1, 1,
-0.9692863, 0.2210669, -1.683071, 1, 1, 1, 1, 1,
-0.9603519, 0.5584671, -0.5387962, 1, 1, 1, 1, 1,
-0.9575108, -1.574141, -3.219193, 1, 1, 1, 1, 1,
-0.9560933, 0.2678571, -0.6463376, 1, 1, 1, 1, 1,
-0.9557512, -0.282957, 0.348994, 1, 1, 1, 1, 1,
-0.9483349, -0.3817143, -2.250639, 1, 1, 1, 1, 1,
-0.9355974, 0.1447347, -2.22504, 1, 1, 1, 1, 1,
-0.933983, -0.2727, -2.093068, 1, 1, 1, 1, 1,
-0.9322782, -0.2879724, -2.712678, 1, 1, 1, 1, 1,
-0.9234138, 1.188117, 0.07231338, 1, 1, 1, 1, 1,
-0.9223685, 0.5333956, -1.043161, 1, 1, 1, 1, 1,
-0.9146685, -0.7859725, -3.007591, 1, 1, 1, 1, 1,
-0.9055236, -1.156726, -1.951573, 1, 1, 1, 1, 1,
-0.9016192, 1.576985, 0.2936421, 1, 1, 1, 1, 1,
-0.8967925, 1.258854, -0.5839239, 1, 1, 1, 1, 1,
-0.8967081, -2.123231, -5.343558, 0, 0, 1, 1, 1,
-0.8952039, -1.190998, -2.958508, 1, 0, 0, 1, 1,
-0.8937687, -0.1885569, -1.996103, 1, 0, 0, 1, 1,
-0.8906057, 0.3775321, -0.1311519, 1, 0, 0, 1, 1,
-0.8892924, 0.6756474, -0.90575, 1, 0, 0, 1, 1,
-0.8844275, -0.3306681, -2.467623, 1, 0, 0, 1, 1,
-0.8832444, 0.9680542, -1.740519, 0, 0, 0, 1, 1,
-0.8830248, -3.041707, -2.978039, 0, 0, 0, 1, 1,
-0.8829716, -1.818772, -2.305977, 0, 0, 0, 1, 1,
-0.8815858, -0.3263303, -0.2472376, 0, 0, 0, 1, 1,
-0.8671941, -1.650121, -1.272056, 0, 0, 0, 1, 1,
-0.8605564, -0.4385748, 0.1974663, 0, 0, 0, 1, 1,
-0.8580377, -1.661323, -3.614301, 0, 0, 0, 1, 1,
-0.8560226, -1.629314, -1.626027, 1, 1, 1, 1, 1,
-0.8452175, -0.1995759, -2.166047, 1, 1, 1, 1, 1,
-0.8431456, -1.699399, -4.430006, 1, 1, 1, 1, 1,
-0.8413251, -0.5778534, -1.87082, 1, 1, 1, 1, 1,
-0.8410379, -1.148473, -1.13554, 1, 1, 1, 1, 1,
-0.8399061, -0.3112734, -1.751437, 1, 1, 1, 1, 1,
-0.836124, -0.7926646, -0.7172937, 1, 1, 1, 1, 1,
-0.8297729, -0.5087512, -1.474517, 1, 1, 1, 1, 1,
-0.8255824, -0.07210803, -0.8867881, 1, 1, 1, 1, 1,
-0.8237839, 1.335314, -0.3060341, 1, 1, 1, 1, 1,
-0.8230809, -0.1476258, -2.263644, 1, 1, 1, 1, 1,
-0.8188595, 0.2445444, -1.187233, 1, 1, 1, 1, 1,
-0.8117777, 0.3661627, -1.46574, 1, 1, 1, 1, 1,
-0.8002985, -1.334602, -1.379794, 1, 1, 1, 1, 1,
-0.7987802, 1.012303, -2.053028, 1, 1, 1, 1, 1,
-0.7949939, 1.780467, -1.431897, 0, 0, 1, 1, 1,
-0.7839423, -0.971896, -5.114175, 1, 0, 0, 1, 1,
-0.7809675, -0.630862, -0.8609646, 1, 0, 0, 1, 1,
-0.7776008, 0.7111655, -0.8442511, 1, 0, 0, 1, 1,
-0.7739983, -0.9341986, -2.706855, 1, 0, 0, 1, 1,
-0.7699914, 1.746678, 0.4633915, 1, 0, 0, 1, 1,
-0.7674817, -0.2456863, -2.980838, 0, 0, 0, 1, 1,
-0.7646156, -0.4216217, -1.361303, 0, 0, 0, 1, 1,
-0.7645377, 0.3587773, -1.854457, 0, 0, 0, 1, 1,
-0.75762, 0.08847588, -1.468398, 0, 0, 0, 1, 1,
-0.7559099, -0.4134122, -0.6571496, 0, 0, 0, 1, 1,
-0.7555229, -0.1636692, -1.722642, 0, 0, 0, 1, 1,
-0.7531633, 0.8289174, -1.160727, 0, 0, 0, 1, 1,
-0.7501692, 2.230287, 0.4396645, 1, 1, 1, 1, 1,
-0.7440012, -0.1173385, -2.40509, 1, 1, 1, 1, 1,
-0.7417897, 0.05345332, -0.3501806, 1, 1, 1, 1, 1,
-0.7389892, -0.2598617, -2.615023, 1, 1, 1, 1, 1,
-0.7367686, 0.5011388, -0.3540815, 1, 1, 1, 1, 1,
-0.7325243, 1.745795, 0.1432175, 1, 1, 1, 1, 1,
-0.7306789, 2.971114, -2.169313, 1, 1, 1, 1, 1,
-0.7301981, -0.1816934, -0.8273801, 1, 1, 1, 1, 1,
-0.7273216, -0.9699463, -2.677307, 1, 1, 1, 1, 1,
-0.7246844, 0.6933762, -1.480207, 1, 1, 1, 1, 1,
-0.7205844, 0.4854027, -1.389563, 1, 1, 1, 1, 1,
-0.7182733, 0.4223094, -1.337153, 1, 1, 1, 1, 1,
-0.7171738, 1.08448, -0.02746112, 1, 1, 1, 1, 1,
-0.7148387, 1.448193, -0.6176382, 1, 1, 1, 1, 1,
-0.7126406, -0.1518128, -2.282302, 1, 1, 1, 1, 1,
-0.7098108, -0.3743808, -2.092227, 0, 0, 1, 1, 1,
-0.7085354, 0.542464, -2.299537, 1, 0, 0, 1, 1,
-0.7048831, 0.1000471, -1.42493, 1, 0, 0, 1, 1,
-0.6971395, 0.483522, -1.820574, 1, 0, 0, 1, 1,
-0.6962759, -1.834253, -0.619819, 1, 0, 0, 1, 1,
-0.6936692, 2.441556, 0.522682, 1, 0, 0, 1, 1,
-0.6867837, -1.002933, -3.987401, 0, 0, 0, 1, 1,
-0.6862921, -1.355187, -4.133395, 0, 0, 0, 1, 1,
-0.6739638, 0.9545941, -0.323566, 0, 0, 0, 1, 1,
-0.670077, -0.6276715, -0.09277342, 0, 0, 0, 1, 1,
-0.6682938, -1.830274, -1.95828, 0, 0, 0, 1, 1,
-0.6648514, -0.7495995, -1.872895, 0, 0, 0, 1, 1,
-0.6647348, -0.2013282, -1.576166, 0, 0, 0, 1, 1,
-0.6634732, 0.3374219, -0.1882745, 1, 1, 1, 1, 1,
-0.6576049, 0.1483296, -2.749472, 1, 1, 1, 1, 1,
-0.6397932, -0.6299301, -2.011499, 1, 1, 1, 1, 1,
-0.6353086, 0.11512, -1.079493, 1, 1, 1, 1, 1,
-0.6343551, 0.4117885, -1.545624, 1, 1, 1, 1, 1,
-0.6327489, 0.3089795, -1.753547, 1, 1, 1, 1, 1,
-0.6324514, 0.8330618, -1.495223, 1, 1, 1, 1, 1,
-0.6239255, 0.5866276, 0.187368, 1, 1, 1, 1, 1,
-0.6234197, 0.6245978, -1.298717, 1, 1, 1, 1, 1,
-0.616521, 1.119192, -0.7195806, 1, 1, 1, 1, 1,
-0.6128604, 0.1860949, -1.040464, 1, 1, 1, 1, 1,
-0.5932449, -1.392081, -4.217387, 1, 1, 1, 1, 1,
-0.5920744, -0.1750971, -1.294633, 1, 1, 1, 1, 1,
-0.5852811, 0.8240808, -1.471261, 1, 1, 1, 1, 1,
-0.5839624, -0.2072917, -1.643358, 1, 1, 1, 1, 1,
-0.5768952, 0.7531589, -1.940473, 0, 0, 1, 1, 1,
-0.575582, -1.201223, -2.887969, 1, 0, 0, 1, 1,
-0.5747887, -0.08610733, -0.877399, 1, 0, 0, 1, 1,
-0.5673621, 1.93936, 0.04179415, 1, 0, 0, 1, 1,
-0.5668454, -1.343926, -2.688988, 1, 0, 0, 1, 1,
-0.5660139, -0.4144009, -2.059176, 1, 0, 0, 1, 1,
-0.5630911, 0.1681463, -2.132079, 0, 0, 0, 1, 1,
-0.5591335, 0.6232758, -1.16061, 0, 0, 0, 1, 1,
-0.5551078, -0.7494905, -2.241943, 0, 0, 0, 1, 1,
-0.5513798, 0.7466355, -0.1568532, 0, 0, 0, 1, 1,
-0.5508887, -0.8219329, -1.606255, 0, 0, 0, 1, 1,
-0.5492672, 0.5933415, -1.695095, 0, 0, 0, 1, 1,
-0.547653, -0.3168434, -2.117744, 0, 0, 0, 1, 1,
-0.5455816, -1.441738, -4.559159, 1, 1, 1, 1, 1,
-0.5443509, -0.1183646, -1.942194, 1, 1, 1, 1, 1,
-0.5420656, 2.512729, -1.660648, 1, 1, 1, 1, 1,
-0.541959, 0.1808454, -1.123133, 1, 1, 1, 1, 1,
-0.539483, -1.767146, -4.167428, 1, 1, 1, 1, 1,
-0.5386547, -0.1616352, -0.687825, 1, 1, 1, 1, 1,
-0.5381172, -1.181702, -3.097086, 1, 1, 1, 1, 1,
-0.5373054, -0.06100986, -0.338501, 1, 1, 1, 1, 1,
-0.5369289, 0.2711429, -0.2766007, 1, 1, 1, 1, 1,
-0.535854, -0.8482492, -2.788048, 1, 1, 1, 1, 1,
-0.5301726, -1.267902, -3.37718, 1, 1, 1, 1, 1,
-0.526619, -2.48787, -2.873892, 1, 1, 1, 1, 1,
-0.5207765, 1.332189, 0.02743467, 1, 1, 1, 1, 1,
-0.520016, 1.684826, -1.333951, 1, 1, 1, 1, 1,
-0.5194797, -0.5064553, -2.926253, 1, 1, 1, 1, 1,
-0.5149554, 0.8946559, 1.309646, 0, 0, 1, 1, 1,
-0.5133321, -0.8549946, -3.479492, 1, 0, 0, 1, 1,
-0.5132166, 0.2354982, -0.4193694, 1, 0, 0, 1, 1,
-0.5098863, 1.286505, -2.26924, 1, 0, 0, 1, 1,
-0.5045133, 1.321319, 0.4031378, 1, 0, 0, 1, 1,
-0.50214, -1.342211, -4.737333, 1, 0, 0, 1, 1,
-0.4941808, -0.0951963, -1.270764, 0, 0, 0, 1, 1,
-0.4907272, 0.4948038, -0.8639053, 0, 0, 0, 1, 1,
-0.4857043, 1.469783, -1.388127, 0, 0, 0, 1, 1,
-0.4827729, 1.73275, 1.290818, 0, 0, 0, 1, 1,
-0.4809762, 0.4502544, -2.142363, 0, 0, 0, 1, 1,
-0.480688, -0.3915337, -2.115781, 0, 0, 0, 1, 1,
-0.47872, -0.4342757, -3.601215, 0, 0, 0, 1, 1,
-0.4716167, 0.4288292, 0.4043398, 1, 1, 1, 1, 1,
-0.471161, -0.2253763, -1.502128, 1, 1, 1, 1, 1,
-0.4673658, 0.5914114, 0.1558949, 1, 1, 1, 1, 1,
-0.4657519, -0.9782302, -2.210169, 1, 1, 1, 1, 1,
-0.4619447, 0.8952312, -0.06896091, 1, 1, 1, 1, 1,
-0.4606178, -0.5064305, -2.687249, 1, 1, 1, 1, 1,
-0.4602991, -0.6220506, -3.894904, 1, 1, 1, 1, 1,
-0.4591463, 0.4286438, -0.02625155, 1, 1, 1, 1, 1,
-0.4591197, 0.08107555, -3.097827, 1, 1, 1, 1, 1,
-0.4507406, -0.1526009, -2.467362, 1, 1, 1, 1, 1,
-0.4500789, -0.2490345, -1.230738, 1, 1, 1, 1, 1,
-0.4491009, 0.2180957, 0.2729068, 1, 1, 1, 1, 1,
-0.4483174, -1.278572, -3.018537, 1, 1, 1, 1, 1,
-0.4431725, -1.328975, -3.723266, 1, 1, 1, 1, 1,
-0.4390932, 0.9841576, 0.2831385, 1, 1, 1, 1, 1,
-0.4378626, 0.1618364, -0.866721, 0, 0, 1, 1, 1,
-0.427127, 0.6166682, 0.006259255, 1, 0, 0, 1, 1,
-0.4255862, -0.6567549, -3.681922, 1, 0, 0, 1, 1,
-0.4223186, 0.6609598, -0.826798, 1, 0, 0, 1, 1,
-0.4218778, -0.5428112, -3.184897, 1, 0, 0, 1, 1,
-0.4166595, -1.214709, -2.80013, 1, 0, 0, 1, 1,
-0.4151106, 0.5869967, -0.4698451, 0, 0, 0, 1, 1,
-0.4142732, 0.4574189, -0.9035406, 0, 0, 0, 1, 1,
-0.4141852, -0.3101084, -2.252464, 0, 0, 0, 1, 1,
-0.4098251, -1.453682, -2.87861, 0, 0, 0, 1, 1,
-0.4076256, 1.267936, -0.8538119, 0, 0, 0, 1, 1,
-0.4072676, 0.4155532, -1.324548, 0, 0, 0, 1, 1,
-0.403264, 0.239565, -0.169252, 0, 0, 0, 1, 1,
-0.4031198, 1.420063, 0.0842953, 1, 1, 1, 1, 1,
-0.3951747, 1.234368, -0.8370788, 1, 1, 1, 1, 1,
-0.3891138, 0.3117678, -0.05303432, 1, 1, 1, 1, 1,
-0.3866784, 0.4516767, -0.8826962, 1, 1, 1, 1, 1,
-0.3863995, -1.737448, -4.356716, 1, 1, 1, 1, 1,
-0.3855028, -0.7076514, -2.659632, 1, 1, 1, 1, 1,
-0.3839797, 0.2241317, -1.71058, 1, 1, 1, 1, 1,
-0.3817686, -0.8938281, -1.536443, 1, 1, 1, 1, 1,
-0.3756311, -0.1991564, -3.304919, 1, 1, 1, 1, 1,
-0.3727261, 1.764063, -0.7018042, 1, 1, 1, 1, 1,
-0.3723799, 0.106735, -1.361115, 1, 1, 1, 1, 1,
-0.3697158, 0.1627617, -0.3050534, 1, 1, 1, 1, 1,
-0.3633764, -0.3282813, -1.23194, 1, 1, 1, 1, 1,
-0.355029, -0.6910953, -4.316004, 1, 1, 1, 1, 1,
-0.3436651, 0.4564717, -1.636317, 1, 1, 1, 1, 1,
-0.3399425, -0.5828175, -2.223424, 0, 0, 1, 1, 1,
-0.3388854, -0.4164416, -2.040585, 1, 0, 0, 1, 1,
-0.3379794, 0.1625533, -0.2588674, 1, 0, 0, 1, 1,
-0.3323378, -0.08555113, -2.5371, 1, 0, 0, 1, 1,
-0.328963, -0.1740019, -1.83946, 1, 0, 0, 1, 1,
-0.3284179, 0.4179889, -1.665764, 1, 0, 0, 1, 1,
-0.3283663, 0.9493007, 0.1441423, 0, 0, 0, 1, 1,
-0.3255175, 0.05753312, -2.244589, 0, 0, 0, 1, 1,
-0.3254703, -0.01068368, -1.28758, 0, 0, 0, 1, 1,
-0.3233972, 0.7534333, 0.1151132, 0, 0, 0, 1, 1,
-0.3213218, -0.2924166, -2.668524, 0, 0, 0, 1, 1,
-0.3110879, 0.04303142, -0.4991854, 0, 0, 0, 1, 1,
-0.3086101, -0.9755388, -4.716081, 0, 0, 0, 1, 1,
-0.2969885, 0.4318451, -2.238221, 1, 1, 1, 1, 1,
-0.296795, 1.099911, -0.1870703, 1, 1, 1, 1, 1,
-0.2941782, -0.4378625, -2.612716, 1, 1, 1, 1, 1,
-0.2940792, -0.5937626, -3.839455, 1, 1, 1, 1, 1,
-0.2940329, -0.5101963, -2.361948, 1, 1, 1, 1, 1,
-0.2878727, -0.1931899, -1.819921, 1, 1, 1, 1, 1,
-0.2845092, 1.808873, -0.3149658, 1, 1, 1, 1, 1,
-0.2824558, 1.320549, 0.2321988, 1, 1, 1, 1, 1,
-0.2821336, -0.1249849, -2.544365, 1, 1, 1, 1, 1,
-0.2810164, -0.4535442, -3.36128, 1, 1, 1, 1, 1,
-0.2784034, -2.762552, -3.552945, 1, 1, 1, 1, 1,
-0.2772695, -2.420221, -1.517811, 1, 1, 1, 1, 1,
-0.2731485, 0.3022032, -2.039979, 1, 1, 1, 1, 1,
-0.2725469, 0.2768933, 1.309952, 1, 1, 1, 1, 1,
-0.2693077, 0.1968942, -1.864162, 1, 1, 1, 1, 1,
-0.2692864, 0.5018879, -0.4866035, 0, 0, 1, 1, 1,
-0.2691445, -0.10523, -2.475174, 1, 0, 0, 1, 1,
-0.2688456, -0.5376779, -1.839595, 1, 0, 0, 1, 1,
-0.2679135, 1.28671, -0.6663243, 1, 0, 0, 1, 1,
-0.2675169, -1.410577, -3.078848, 1, 0, 0, 1, 1,
-0.2665039, 0.4760906, 0.2232326, 1, 0, 0, 1, 1,
-0.2610797, 1.377824, -0.1100036, 0, 0, 0, 1, 1,
-0.2579212, -0.08525524, -2.881653, 0, 0, 0, 1, 1,
-0.2554729, 0.5233764, -1.206195, 0, 0, 0, 1, 1,
-0.2539824, -0.8031515, -3.290176, 0, 0, 0, 1, 1,
-0.2533201, -0.2550669, -3.206957, 0, 0, 0, 1, 1,
-0.2523212, 0.6887336, 0.5854703, 0, 0, 0, 1, 1,
-0.2500989, 0.598048, -0.3918105, 0, 0, 0, 1, 1,
-0.2494801, -2.199903, -4.599242, 1, 1, 1, 1, 1,
-0.2444329, -0.5472246, -2.577699, 1, 1, 1, 1, 1,
-0.2441768, 0.09390631, -1.329754, 1, 1, 1, 1, 1,
-0.2419961, -0.7012474, -2.854873, 1, 1, 1, 1, 1,
-0.2413529, -1.547127, -3.125552, 1, 1, 1, 1, 1,
-0.2405968, 0.2419562, -0.7668031, 1, 1, 1, 1, 1,
-0.2405774, 1.000932, -1.84185, 1, 1, 1, 1, 1,
-0.2399549, 0.2027142, -0.2920297, 1, 1, 1, 1, 1,
-0.2394286, -0.4856503, -4.136636, 1, 1, 1, 1, 1,
-0.2356886, 0.3632659, -1.300212, 1, 1, 1, 1, 1,
-0.2345929, 1.681748, 1.915809, 1, 1, 1, 1, 1,
-0.2323446, -0.266144, -2.871749, 1, 1, 1, 1, 1,
-0.2303564, 0.8080748, -0.2896086, 1, 1, 1, 1, 1,
-0.2299946, 0.09778663, -1.840039, 1, 1, 1, 1, 1,
-0.2284222, 0.4320172, 0.2807007, 1, 1, 1, 1, 1,
-0.2218135, -0.7767796, -2.500025, 0, 0, 1, 1, 1,
-0.2166563, 0.1518524, -2.416729, 1, 0, 0, 1, 1,
-0.2161559, -1.132259, -2.33119, 1, 0, 0, 1, 1,
-0.2134707, 0.9492702, 1.227812, 1, 0, 0, 1, 1,
-0.2133261, -0.3658683, -2.761781, 1, 0, 0, 1, 1,
-0.212748, -0.1782833, -2.961705, 1, 0, 0, 1, 1,
-0.2088714, -0.7584952, -3.280376, 0, 0, 0, 1, 1,
-0.2064189, -0.3212651, -1.595175, 0, 0, 0, 1, 1,
-0.2047125, -0.2384469, -1.15847, 0, 0, 0, 1, 1,
-0.1959005, 1.043166, -2.097974, 0, 0, 0, 1, 1,
-0.1945083, -0.2656606, -1.816986, 0, 0, 0, 1, 1,
-0.1942966, 0.04966882, -0.1081663, 0, 0, 0, 1, 1,
-0.1916238, -0.01956333, -3.078754, 0, 0, 0, 1, 1,
-0.1875952, 0.8588567, -0.961509, 1, 1, 1, 1, 1,
-0.1851096, -1.256534, -2.70555, 1, 1, 1, 1, 1,
-0.1833879, -0.6032543, -0.9923101, 1, 1, 1, 1, 1,
-0.1833231, 1.245564, -0.6681589, 1, 1, 1, 1, 1,
-0.1829218, 0.06395348, -0.8786398, 1, 1, 1, 1, 1,
-0.1795826, -1.346778, -0.8548501, 1, 1, 1, 1, 1,
-0.1781425, 0.575565, 1.482596, 1, 1, 1, 1, 1,
-0.1751076, 0.3419562, -1.423763, 1, 1, 1, 1, 1,
-0.1657865, -0.03734095, -2.520767, 1, 1, 1, 1, 1,
-0.1634965, -0.2861673, -2.613162, 1, 1, 1, 1, 1,
-0.1617043, -0.2859469, -0.425539, 1, 1, 1, 1, 1,
-0.1558745, -0.3040777, -1.722225, 1, 1, 1, 1, 1,
-0.1552057, 0.6973826, -1.784276, 1, 1, 1, 1, 1,
-0.1549499, 0.09967236, -1.36218, 1, 1, 1, 1, 1,
-0.1487097, 0.7053475, -0.7028967, 1, 1, 1, 1, 1,
-0.1460167, 0.5902494, 0.7092277, 0, 0, 1, 1, 1,
-0.1404062, -1.087336, -1.800465, 1, 0, 0, 1, 1,
-0.1393519, 0.9936392, 0.2073131, 1, 0, 0, 1, 1,
-0.1377871, -0.7902638, -2.076653, 1, 0, 0, 1, 1,
-0.1371995, 0.952379, 0.2982628, 1, 0, 0, 1, 1,
-0.1268105, 0.3526992, 0.3691774, 1, 0, 0, 1, 1,
-0.1250217, -2.745495, -1.160235, 0, 0, 0, 1, 1,
-0.1247203, -0.8289445, -3.980645, 0, 0, 0, 1, 1,
-0.1155771, 1.001732, -0.7138557, 0, 0, 0, 1, 1,
-0.1122191, -0.1557427, -3.655578, 0, 0, 0, 1, 1,
-0.10989, 0.4386896, 1.119195, 0, 0, 0, 1, 1,
-0.1096099, 0.991044, 0.7299984, 0, 0, 0, 1, 1,
-0.1021772, -1.112011, -2.864123, 0, 0, 0, 1, 1,
-0.10193, -0.8295317, -3.368664, 1, 1, 1, 1, 1,
-0.09560297, 1.368778, 0.02475002, 1, 1, 1, 1, 1,
-0.09545068, -1.008422, -2.769726, 1, 1, 1, 1, 1,
-0.0946456, -0.9239552, -3.716261, 1, 1, 1, 1, 1,
-0.09183098, -0.8550861, -2.353015, 1, 1, 1, 1, 1,
-0.09136936, 0.4404766, 0.4133386, 1, 1, 1, 1, 1,
-0.08843177, 0.8909988, -1.214087, 1, 1, 1, 1, 1,
-0.0872433, -0.7571099, -2.554435, 1, 1, 1, 1, 1,
-0.08640753, -1.168451, -2.008741, 1, 1, 1, 1, 1,
-0.08546496, 1.691458, -0.3967108, 1, 1, 1, 1, 1,
-0.0812923, 0.2272285, 2.24958, 1, 1, 1, 1, 1,
-0.07911318, 0.03156253, -0.7547998, 1, 1, 1, 1, 1,
-0.0725294, -1.291959, -3.445934, 1, 1, 1, 1, 1,
-0.07141193, 0.7280972, -1.702873, 1, 1, 1, 1, 1,
-0.07040597, -1.131187, -1.883718, 1, 1, 1, 1, 1,
-0.06925045, 1.765104, -1.42394, 0, 0, 1, 1, 1,
-0.068095, -0.312306, -1.630944, 1, 0, 0, 1, 1,
-0.06681465, 0.7311426, 1.976467, 1, 0, 0, 1, 1,
-0.06639861, 0.831772, -0.495642, 1, 0, 0, 1, 1,
-0.06344078, -0.1838086, 0.3028692, 1, 0, 0, 1, 1,
-0.06265545, 0.267322, -1.303795, 1, 0, 0, 1, 1,
-0.06211908, -1.35489, -2.114091, 0, 0, 0, 1, 1,
-0.06070764, -1.041888, -4.432853, 0, 0, 0, 1, 1,
-0.05961873, 0.0855953, -0.7728119, 0, 0, 0, 1, 1,
-0.05563485, -0.5086898, -0.9626019, 0, 0, 0, 1, 1,
-0.055077, 1.082192, 0.3418229, 0, 0, 0, 1, 1,
-0.05130123, 2.156555, 1.418686, 0, 0, 0, 1, 1,
-0.05084564, 0.4305324, 0.4796968, 0, 0, 0, 1, 1,
-0.04843865, 1.080185, -2.255374, 1, 1, 1, 1, 1,
-0.04674964, 0.06139696, -0.7557373, 1, 1, 1, 1, 1,
-0.04472192, 0.7669164, 0.09485374, 1, 1, 1, 1, 1,
-0.04397184, -0.3269477, -3.382128, 1, 1, 1, 1, 1,
-0.04390015, -0.3381874, -3.414375, 1, 1, 1, 1, 1,
-0.04168638, -1.1858, -3.413257, 1, 1, 1, 1, 1,
-0.04111815, 1.352265, 0.03923276, 1, 1, 1, 1, 1,
-0.03479261, -0.9787275, -3.562077, 1, 1, 1, 1, 1,
-0.03181612, -1.775422, -2.314896, 1, 1, 1, 1, 1,
-0.02228983, 0.9089375, 0.04393696, 1, 1, 1, 1, 1,
-0.01662464, -0.9222703, -3.629437, 1, 1, 1, 1, 1,
-0.01498063, -0.9017869, -3.241839, 1, 1, 1, 1, 1,
-0.0141287, 0.5561166, 1.094571, 1, 1, 1, 1, 1,
-0.01023789, 0.0506658, -0.005439975, 1, 1, 1, 1, 1,
-0.009439711, 1.441313, -0.4663903, 1, 1, 1, 1, 1,
-0.006017647, -0.5716683, -2.106185, 0, 0, 1, 1, 1,
-0.004386431, 1.671256, 0.1323591, 1, 0, 0, 1, 1,
-0.004343727, -0.3640782, -4.879994, 1, 0, 0, 1, 1,
0.003278306, 1.078978, -0.5688863, 1, 0, 0, 1, 1,
0.006530987, 0.4775251, 0.4163815, 1, 0, 0, 1, 1,
0.008764684, -1.651381, 3.567629, 1, 0, 0, 1, 1,
0.009515684, 0.09495749, -0.7110354, 0, 0, 0, 1, 1,
0.01213693, -0.4890535, 3.747177, 0, 0, 0, 1, 1,
0.0135918, 1.859797, -1.34707, 0, 0, 0, 1, 1,
0.01366364, -0.05244534, 2.584738, 0, 0, 0, 1, 1,
0.01466397, 1.101769, -0.8086789, 0, 0, 0, 1, 1,
0.0194273, 0.4881477, -1.041677, 0, 0, 0, 1, 1,
0.02150723, -1.051275, 1.653831, 0, 0, 0, 1, 1,
0.02369932, -0.4424825, 2.810568, 1, 1, 1, 1, 1,
0.02667952, 0.2093182, 1.036557, 1, 1, 1, 1, 1,
0.02718485, -0.9939555, 3.111991, 1, 1, 1, 1, 1,
0.02919824, -1.720357, 2.766838, 1, 1, 1, 1, 1,
0.03202871, 1.333427, -1.372371, 1, 1, 1, 1, 1,
0.03578834, 1.609586, 0.274961, 1, 1, 1, 1, 1,
0.04305467, -0.294272, 3.356885, 1, 1, 1, 1, 1,
0.04597471, 0.9181647, -0.6567986, 1, 1, 1, 1, 1,
0.04679849, 1.369289, -1.471668, 1, 1, 1, 1, 1,
0.04780565, 0.6803491, 0.8018934, 1, 1, 1, 1, 1,
0.05482074, 0.2634108, 1.008583, 1, 1, 1, 1, 1,
0.05571891, -0.006403721, 2.756639, 1, 1, 1, 1, 1,
0.06059531, 0.9633095, -1.676832, 1, 1, 1, 1, 1,
0.06195321, -0.4639928, 1.769652, 1, 1, 1, 1, 1,
0.06226831, -3.063035, 1.742698, 1, 1, 1, 1, 1,
0.06322265, 0.8509262, -0.07243206, 0, 0, 1, 1, 1,
0.06631838, -1.899956, 3.4031, 1, 0, 0, 1, 1,
0.0724693, 0.2646298, 1.303851, 1, 0, 0, 1, 1,
0.0738254, -1.23405, 2.856196, 1, 0, 0, 1, 1,
0.07563626, -0.8465498, 1.166913, 1, 0, 0, 1, 1,
0.07788707, 0.2998137, 1.303117, 1, 0, 0, 1, 1,
0.0812133, -0.9686941, 5.381495, 0, 0, 0, 1, 1,
0.08161826, -1.210604, 2.589043, 0, 0, 0, 1, 1,
0.08299234, 0.9406469, 0.1363047, 0, 0, 0, 1, 1,
0.08645852, -0.6115949, 2.390381, 0, 0, 0, 1, 1,
0.08719435, 0.4080052, -0.9578201, 0, 0, 0, 1, 1,
0.09302747, -1.084077, 2.557272, 0, 0, 0, 1, 1,
0.09570046, -0.2174061, 2.867711, 0, 0, 0, 1, 1,
0.1029996, 2.030476, 0.9044258, 1, 1, 1, 1, 1,
0.1037859, 1.015145, -1.161114, 1, 1, 1, 1, 1,
0.1076883, -0.210278, 3.078061, 1, 1, 1, 1, 1,
0.1085936, 0.2793912, 1.483887, 1, 1, 1, 1, 1,
0.1121508, -0.9709363, 3.540941, 1, 1, 1, 1, 1,
0.1156351, -0.90821, 2.135551, 1, 1, 1, 1, 1,
0.1163964, -0.4233517, 3.309496, 1, 1, 1, 1, 1,
0.1169914, -0.2292635, 2.456793, 1, 1, 1, 1, 1,
0.1177388, -1.806498, 1.743099, 1, 1, 1, 1, 1,
0.1183767, -0.5527468, 3.315836, 1, 1, 1, 1, 1,
0.1202709, -0.2319915, 3.206475, 1, 1, 1, 1, 1,
0.1203085, -0.3802297, 3.758216, 1, 1, 1, 1, 1,
0.122486, 0.3591412, 1.055817, 1, 1, 1, 1, 1,
0.1233407, -0.3580496, 3.659824, 1, 1, 1, 1, 1,
0.1287563, 0.4846255, -0.7019047, 1, 1, 1, 1, 1,
0.1295762, -0.6367135, 3.536701, 0, 0, 1, 1, 1,
0.1304829, -0.7392583, 2.912906, 1, 0, 0, 1, 1,
0.134325, 0.1532033, 0.03913225, 1, 0, 0, 1, 1,
0.1382713, 0.09671286, 0.7445704, 1, 0, 0, 1, 1,
0.1396212, 1.131808, 1.164751, 1, 0, 0, 1, 1,
0.1462736, 0.924152, -0.6132573, 1, 0, 0, 1, 1,
0.1467501, 0.5988581, -2.033657, 0, 0, 0, 1, 1,
0.1477096, 2.288851, -0.6771814, 0, 0, 0, 1, 1,
0.1505819, 0.2829049, -1.80445, 0, 0, 0, 1, 1,
0.1516487, -2.272639, 4.646183, 0, 0, 0, 1, 1,
0.1549614, -0.1658751, 2.843311, 0, 0, 0, 1, 1,
0.1602473, 0.798119, 0.4482032, 0, 0, 0, 1, 1,
0.163096, 0.3707157, 1.181189, 0, 0, 0, 1, 1,
0.1674225, 0.6163442, 1.762923, 1, 1, 1, 1, 1,
0.1714019, 2.743348, 1.670347, 1, 1, 1, 1, 1,
0.174212, -1.278525, 4.007737, 1, 1, 1, 1, 1,
0.1758158, 1.106954, -0.5173171, 1, 1, 1, 1, 1,
0.1768858, 0.2411992, 1.959696, 1, 1, 1, 1, 1,
0.1772668, -1.389721, 3.899942, 1, 1, 1, 1, 1,
0.1791765, -0.8356647, 0.7764714, 1, 1, 1, 1, 1,
0.1793537, 1.17285, 0.2236761, 1, 1, 1, 1, 1,
0.1827438, 0.7078969, -0.5792271, 1, 1, 1, 1, 1,
0.1829356, 0.4242924, 1.589186, 1, 1, 1, 1, 1,
0.1840572, -0.3497126, 1.797205, 1, 1, 1, 1, 1,
0.1846361, -0.3421014, 1.488275, 1, 1, 1, 1, 1,
0.188637, 0.7571198, 1.169863, 1, 1, 1, 1, 1,
0.1898658, 0.344145, 2.187624, 1, 1, 1, 1, 1,
0.1913415, 0.1161417, 1.457183, 1, 1, 1, 1, 1,
0.1917302, -0.6280054, 2.486176, 0, 0, 1, 1, 1,
0.1956266, 0.2994483, 0.115051, 1, 0, 0, 1, 1,
0.2005581, -0.5423227, 5.128429, 1, 0, 0, 1, 1,
0.2017891, 1.192881, 0.7144303, 1, 0, 0, 1, 1,
0.2040899, 1.00925, 1.346013, 1, 0, 0, 1, 1,
0.2055034, -0.329912, 1.73203, 1, 0, 0, 1, 1,
0.2056505, 1.892634, 0.6931817, 0, 0, 0, 1, 1,
0.2071827, -0.5556868, 1.969799, 0, 0, 0, 1, 1,
0.2082675, 1.714529, -0.09298199, 0, 0, 0, 1, 1,
0.2098206, 0.6608049, 0.29003, 0, 0, 0, 1, 1,
0.2132314, 0.7454935, -1.342036, 0, 0, 0, 1, 1,
0.2189074, -1.689061, 3.364855, 0, 0, 0, 1, 1,
0.2244063, -1.204727, 3.62906, 0, 0, 0, 1, 1,
0.2302617, -0.2385565, 0.5600935, 1, 1, 1, 1, 1,
0.2452542, -1.523771, 2.498095, 1, 1, 1, 1, 1,
0.2469483, -0.8552155, 1.499498, 1, 1, 1, 1, 1,
0.2510778, -1.767925, 2.708665, 1, 1, 1, 1, 1,
0.2548248, -0.418023, 1.906942, 1, 1, 1, 1, 1,
0.2570677, -1.692961, 2.190488, 1, 1, 1, 1, 1,
0.2579952, 1.487474, 0.9866824, 1, 1, 1, 1, 1,
0.2601733, -1.368927, 1.56843, 1, 1, 1, 1, 1,
0.2699408, -0.2185989, 0.3601539, 1, 1, 1, 1, 1,
0.2783162, 0.8229762, 0.01936514, 1, 1, 1, 1, 1,
0.2797328, -0.2729376, 0.6410748, 1, 1, 1, 1, 1,
0.2816782, -0.4543844, 3.489497, 1, 1, 1, 1, 1,
0.2821908, 0.006548312, 2.035878, 1, 1, 1, 1, 1,
0.2932812, -1.463059, 4.21607, 1, 1, 1, 1, 1,
0.2953781, -1.134553, 4.499343, 1, 1, 1, 1, 1,
0.2985368, 0.3541291, 1.53669, 0, 0, 1, 1, 1,
0.3010204, -0.673553, 2.825812, 1, 0, 0, 1, 1,
0.3055232, -0.1416978, 1.86645, 1, 0, 0, 1, 1,
0.3096895, 0.5024583, 0.7134445, 1, 0, 0, 1, 1,
0.315761, 0.7120334, -2.443696, 1, 0, 0, 1, 1,
0.3157706, -0.8141373, 2.200837, 1, 0, 0, 1, 1,
0.3165702, -1.416323, 3.077161, 0, 0, 0, 1, 1,
0.3183669, 1.345661, 0.4272889, 0, 0, 0, 1, 1,
0.3273207, -0.4464816, 2.164849, 0, 0, 0, 1, 1,
0.3278477, 1.998902, 0.447421, 0, 0, 0, 1, 1,
0.3283165, -1.633512, 3.110729, 0, 0, 0, 1, 1,
0.3307014, 0.3867659, -1.083538, 0, 0, 0, 1, 1,
0.3309442, -0.8419665, 4.884902, 0, 0, 0, 1, 1,
0.3339119, 0.06006951, 1.713072, 1, 1, 1, 1, 1,
0.3358712, -0.7679188, 2.290691, 1, 1, 1, 1, 1,
0.3365714, -0.9561924, 1.961262, 1, 1, 1, 1, 1,
0.3507012, 2.050219, -0.107056, 1, 1, 1, 1, 1,
0.3510341, -1.254374, 3.067539, 1, 1, 1, 1, 1,
0.3517685, -1.478878, 4.42615, 1, 1, 1, 1, 1,
0.3539883, 0.540325, 1.355559, 1, 1, 1, 1, 1,
0.356801, 1.776839, -0.6654779, 1, 1, 1, 1, 1,
0.3606005, -0.4005263, 3.280347, 1, 1, 1, 1, 1,
0.3619569, -0.4995206, 1.157284, 1, 1, 1, 1, 1,
0.3667469, 0.3778762, -0.8450627, 1, 1, 1, 1, 1,
0.3680099, -0.7294782, 3.949612, 1, 1, 1, 1, 1,
0.370038, 0.6577266, -1.646416, 1, 1, 1, 1, 1,
0.3730009, 1.410893, 0.4649464, 1, 1, 1, 1, 1,
0.3740987, -0.4066872, 2.259528, 1, 1, 1, 1, 1,
0.3762462, 0.2617818, 0.1827398, 0, 0, 1, 1, 1,
0.379256, 0.5719122, 0.949803, 1, 0, 0, 1, 1,
0.3812406, -0.06758105, 2.6043, 1, 0, 0, 1, 1,
0.3826766, 1.576806, -0.3766093, 1, 0, 0, 1, 1,
0.3877072, -0.8468122, 2.123803, 1, 0, 0, 1, 1,
0.393628, -0.255451, 2.042103, 1, 0, 0, 1, 1,
0.3945654, -0.1476964, 3.866672, 0, 0, 0, 1, 1,
0.3973026, 1.466921, -0.09528906, 0, 0, 0, 1, 1,
0.3980614, -0.6386803, 0.3116257, 0, 0, 0, 1, 1,
0.3984976, 0.09652179, 3.003843, 0, 0, 0, 1, 1,
0.4012156, -1.36884, 4.521054, 0, 0, 0, 1, 1,
0.4032591, 0.4967061, 1.008217, 0, 0, 0, 1, 1,
0.4037772, 0.02661129, -0.01180738, 0, 0, 0, 1, 1,
0.4079453, -2.252487, 0.4361297, 1, 1, 1, 1, 1,
0.4105717, -0.8177388, 1.228819, 1, 1, 1, 1, 1,
0.4134885, -0.5202556, 1.983796, 1, 1, 1, 1, 1,
0.41363, -0.8436183, 4.422855, 1, 1, 1, 1, 1,
0.4165579, 0.7097333, 0.1714201, 1, 1, 1, 1, 1,
0.4180483, -0.3418147, 3.854535, 1, 1, 1, 1, 1,
0.4299138, -0.3575961, 1.682433, 1, 1, 1, 1, 1,
0.4302679, -1.281689, 4.384031, 1, 1, 1, 1, 1,
0.4334015, -1.466398, 3.094458, 1, 1, 1, 1, 1,
0.4340095, 0.2345365, 1.305501, 1, 1, 1, 1, 1,
0.4362157, -0.4338343, 3.9544, 1, 1, 1, 1, 1,
0.4368056, 1.173465, 2.933853, 1, 1, 1, 1, 1,
0.439403, 0.5058857, 1.684661, 1, 1, 1, 1, 1,
0.4418244, -0.8539054, 1.833111, 1, 1, 1, 1, 1,
0.4420525, -0.508939, 5.000989, 1, 1, 1, 1, 1,
0.4427646, -1.73442, 2.068246, 0, 0, 1, 1, 1,
0.4430799, -0.7036228, 2.107471, 1, 0, 0, 1, 1,
0.4437962, -1.06485, 3.005302, 1, 0, 0, 1, 1,
0.4441646, 0.5738224, 0.1425506, 1, 0, 0, 1, 1,
0.4478177, 0.07101902, 3.062336, 1, 0, 0, 1, 1,
0.4525918, -0.6034036, 2.487739, 1, 0, 0, 1, 1,
0.4584868, -0.3879635, 1.688887, 0, 0, 0, 1, 1,
0.4597827, -1.914586, 4.212391, 0, 0, 0, 1, 1,
0.460985, -0.1060561, 1.278754, 0, 0, 0, 1, 1,
0.461785, -0.08830819, 1.538602, 0, 0, 0, 1, 1,
0.4619798, 2.051478, -0.100141, 0, 0, 0, 1, 1,
0.4638244, -1.584041, 3.147826, 0, 0, 0, 1, 1,
0.4695843, 0.5940053, 2.440689, 0, 0, 0, 1, 1,
0.4708634, -1.124773, 2.817343, 1, 1, 1, 1, 1,
0.472832, 0.0149035, 0.2049918, 1, 1, 1, 1, 1,
0.4778516, -1.523365, 3.288145, 1, 1, 1, 1, 1,
0.4808984, -0.2087335, 1.739698, 1, 1, 1, 1, 1,
0.4840677, -0.6154506, 1.719023, 1, 1, 1, 1, 1,
0.4897792, 0.9842464, -0.1442588, 1, 1, 1, 1, 1,
0.4902378, -2.364137, 1.866058, 1, 1, 1, 1, 1,
0.4916666, 0.244243, 0.09405519, 1, 1, 1, 1, 1,
0.4967999, 1.862041, 1.727252, 1, 1, 1, 1, 1,
0.4975912, -1.707702, 2.529398, 1, 1, 1, 1, 1,
0.5001671, 0.0130166, 2.129928, 1, 1, 1, 1, 1,
0.501231, 1.109095, 0.4615007, 1, 1, 1, 1, 1,
0.5083715, -1.233042, 2.397505, 1, 1, 1, 1, 1,
0.5089877, 0.2838881, 0.6413502, 1, 1, 1, 1, 1,
0.509061, -0.2493902, 1.95632, 1, 1, 1, 1, 1,
0.5132984, 0.8016756, 0.1070785, 0, 0, 1, 1, 1,
0.5153883, -0.4698568, 0.7306013, 1, 0, 0, 1, 1,
0.5174897, 1.894747, 0.8636157, 1, 0, 0, 1, 1,
0.5178312, 1.560539, -0.1989888, 1, 0, 0, 1, 1,
0.5215276, 0.7802706, -0.4363216, 1, 0, 0, 1, 1,
0.5218647, -1.83755, 2.58158, 1, 0, 0, 1, 1,
0.5273129, 0.4000508, 1.345002, 0, 0, 0, 1, 1,
0.530179, 1.131131, 0.7442648, 0, 0, 0, 1, 1,
0.5331141, -1.135368, 2.638908, 0, 0, 0, 1, 1,
0.5357651, -0.9719629, 4.536649, 0, 0, 0, 1, 1,
0.5361856, 1.725485, 1.143935, 0, 0, 0, 1, 1,
0.5411837, -1.899641, 4.060404, 0, 0, 0, 1, 1,
0.5436566, 0.3851423, -2.45987, 0, 0, 0, 1, 1,
0.5474071, -0.9706087, 2.871195, 1, 1, 1, 1, 1,
0.5550251, 0.8790271, 3.03129, 1, 1, 1, 1, 1,
0.5576582, 0.2873458, 1.961785, 1, 1, 1, 1, 1,
0.5618697, 1.02267, -1.159633, 1, 1, 1, 1, 1,
0.5703847, -0.619741, 1.897414, 1, 1, 1, 1, 1,
0.5786914, -0.6806002, -0.3847936, 1, 1, 1, 1, 1,
0.5804665, -0.462781, -0.08362383, 1, 1, 1, 1, 1,
0.5828549, -1.123652, 4.340073, 1, 1, 1, 1, 1,
0.5848569, -0.2515416, 1.928427, 1, 1, 1, 1, 1,
0.5888541, 0.9687697, -0.08880322, 1, 1, 1, 1, 1,
0.5900246, 0.1874187, 0.9825661, 1, 1, 1, 1, 1,
0.5910847, -0.8338415, 2.959295, 1, 1, 1, 1, 1,
0.5916209, 0.7244248, 0.699783, 1, 1, 1, 1, 1,
0.5923494, -1.784496, 3.964495, 1, 1, 1, 1, 1,
0.59648, 1.837957, 0.3546296, 1, 1, 1, 1, 1,
0.6017334, -1.551497, 2.508539, 0, 0, 1, 1, 1,
0.6042956, 0.7672997, 0.3850314, 1, 0, 0, 1, 1,
0.60518, 0.4768408, 1.76456, 1, 0, 0, 1, 1,
0.6052686, 1.63565, 2.007983, 1, 0, 0, 1, 1,
0.6055431, 0.680509, 1.615265, 1, 0, 0, 1, 1,
0.6079967, 0.7211834, 2.84714, 1, 0, 0, 1, 1,
0.6111886, -0.7795929, 1.562696, 0, 0, 0, 1, 1,
0.6155953, 1.185353, 1.02029, 0, 0, 0, 1, 1,
0.6156779, -2.289634, 2.560843, 0, 0, 0, 1, 1,
0.6164662, 0.2461749, 1.759703, 0, 0, 0, 1, 1,
0.6185627, 0.8374113, 0.5181432, 0, 0, 0, 1, 1,
0.6203178, -1.4671, 2.898412, 0, 0, 0, 1, 1,
0.6204844, -1.300073, 1.394572, 0, 0, 0, 1, 1,
0.6234619, -1.825416, 3.364345, 1, 1, 1, 1, 1,
0.6234755, 1.997836, 0.8558767, 1, 1, 1, 1, 1,
0.6240385, -0.4003185, 0.7659427, 1, 1, 1, 1, 1,
0.6240954, -1.648705, 2.858537, 1, 1, 1, 1, 1,
0.6250831, -0.0582236, 0.744615, 1, 1, 1, 1, 1,
0.6369601, 1.50553, 1.798777, 1, 1, 1, 1, 1,
0.6378742, 0.2356307, 1.077026, 1, 1, 1, 1, 1,
0.6411933, -0.7177417, 2.714395, 1, 1, 1, 1, 1,
0.6461036, -1.086923, 3.004546, 1, 1, 1, 1, 1,
0.6469249, 0.7621028, -1.079638, 1, 1, 1, 1, 1,
0.6606658, -0.1428233, 2.706725, 1, 1, 1, 1, 1,
0.6606928, -1.734854, 2.910743, 1, 1, 1, 1, 1,
0.6650113, 0.4217014, -0.4112059, 1, 1, 1, 1, 1,
0.667359, -1.051993, 2.598349, 1, 1, 1, 1, 1,
0.6719902, -0.1728433, 2.897187, 1, 1, 1, 1, 1,
0.6725985, 1.51357, 1.407052, 0, 0, 1, 1, 1,
0.6760675, 0.8374915, -0.5632533, 1, 0, 0, 1, 1,
0.6807451, 1.3366, 2.688375, 1, 0, 0, 1, 1,
0.6851932, 0.2309737, 0.6266699, 1, 0, 0, 1, 1,
0.6871806, 0.1727413, 2.828908, 1, 0, 0, 1, 1,
0.6881687, 0.02435794, 0.8189119, 1, 0, 0, 1, 1,
0.688856, 1.255332, -0.3782831, 0, 0, 0, 1, 1,
0.6894929, 2.086847, 0.9269058, 0, 0, 0, 1, 1,
0.6926273, 0.367497, 1.156955, 0, 0, 0, 1, 1,
0.6940861, -1.257245, 2.05703, 0, 0, 0, 1, 1,
0.6951271, 0.8493609, -0.2207917, 0, 0, 0, 1, 1,
0.7063614, 0.08673757, 0.8554523, 0, 0, 0, 1, 1,
0.7067606, -0.3851424, 1.186321, 0, 0, 0, 1, 1,
0.7114868, 0.6822354, 0.9809895, 1, 1, 1, 1, 1,
0.7162124, 1.868405, 0.5513935, 1, 1, 1, 1, 1,
0.7223035, 0.2759098, 0.7017685, 1, 1, 1, 1, 1,
0.7241122, -0.3439867, 1.505871, 1, 1, 1, 1, 1,
0.7319276, -1.202927, 3.789403, 1, 1, 1, 1, 1,
0.7367837, 0.6094352, 1.506072, 1, 1, 1, 1, 1,
0.7395244, -0.0474538, 2.367502, 1, 1, 1, 1, 1,
0.7434139, 0.7738902, 0.6460112, 1, 1, 1, 1, 1,
0.7450498, -0.6872568, 3.465352, 1, 1, 1, 1, 1,
0.7454242, 0.720916, 1.417854, 1, 1, 1, 1, 1,
0.7474993, 0.06825458, 0.9637583, 1, 1, 1, 1, 1,
0.7522206, 0.5381727, 1.157625, 1, 1, 1, 1, 1,
0.7525486, -0.3688617, 2.717747, 1, 1, 1, 1, 1,
0.7618036, 1.353375, 1.141394, 1, 1, 1, 1, 1,
0.7640263, 0.7885902, 0.8120842, 1, 1, 1, 1, 1,
0.7678331, -0.02387871, 1.742419, 0, 0, 1, 1, 1,
0.7712461, 0.6154119, 0.4754616, 1, 0, 0, 1, 1,
0.771354, -0.2786722, 1.218974, 1, 0, 0, 1, 1,
0.7794141, 0.3412336, 1.73249, 1, 0, 0, 1, 1,
0.7829082, -0.4449458, 2.404922, 1, 0, 0, 1, 1,
0.783015, 0.289325, 0.5992911, 1, 0, 0, 1, 1,
0.7840729, 1.070034, 1.956558, 0, 0, 0, 1, 1,
0.79175, 0.7538897, 0.05972658, 0, 0, 0, 1, 1,
0.7970557, -0.9641127, 1.620784, 0, 0, 0, 1, 1,
0.8065515, -0.1174885, 3.056362, 0, 0, 0, 1, 1,
0.8101398, 1.856607, -0.6063337, 0, 0, 0, 1, 1,
0.8104122, -0.951791, 2.08804, 0, 0, 0, 1, 1,
0.8134053, -0.2799403, 2.083264, 0, 0, 0, 1, 1,
0.8138441, -1.646765, 2.797457, 1, 1, 1, 1, 1,
0.8148339, -0.9932464, 3.317666, 1, 1, 1, 1, 1,
0.8171455, -0.3536284, 0.8616977, 1, 1, 1, 1, 1,
0.8190832, 0.9467348, 1.485723, 1, 1, 1, 1, 1,
0.8264068, 1.631009, 0.8923147, 1, 1, 1, 1, 1,
0.8291492, 0.8806654, 0.9796729, 1, 1, 1, 1, 1,
0.8301966, -1.473008, 4.873501, 1, 1, 1, 1, 1,
0.8394221, 0.974975, 1.584204, 1, 1, 1, 1, 1,
0.8430003, 1.2154, 0.4831615, 1, 1, 1, 1, 1,
0.8435798, 1.619921, 0.2485307, 1, 1, 1, 1, 1,
0.8440603, -0.1197489, 1.409074, 1, 1, 1, 1, 1,
0.8456171, 2.665256, 0.1027301, 1, 1, 1, 1, 1,
0.8501438, -0.5419858, 2.93146, 1, 1, 1, 1, 1,
0.8547119, -0.6539342, 2.951002, 1, 1, 1, 1, 1,
0.8547155, -1.743796, 3.186939, 1, 1, 1, 1, 1,
0.8691522, -0.3071624, 1.053834, 0, 0, 1, 1, 1,
0.8697414, 2.135711, 0.1777376, 1, 0, 0, 1, 1,
0.8773308, -0.3177189, 1.111307, 1, 0, 0, 1, 1,
0.8782812, 0.9743411, 2.455923, 1, 0, 0, 1, 1,
0.8786584, 1.452271, -0.7640022, 1, 0, 0, 1, 1,
0.8798417, -1.269711, 1.474843, 1, 0, 0, 1, 1,
0.8804532, -0.2542291, 2.994677, 0, 0, 0, 1, 1,
0.8888848, -0.4782323, 2.763637, 0, 0, 0, 1, 1,
0.8893757, -0.9427417, 1.376911, 0, 0, 0, 1, 1,
0.8948666, -0.3143141, 1.203888, 0, 0, 0, 1, 1,
0.8995061, -0.1222359, 0.6718819, 0, 0, 0, 1, 1,
0.9039838, -1.237864, 2.465029, 0, 0, 0, 1, 1,
0.9105391, -1.193249, 3.434856, 0, 0, 0, 1, 1,
0.9114203, 1.187563, 1.669075, 1, 1, 1, 1, 1,
0.9115099, 1.618339, -0.9014955, 1, 1, 1, 1, 1,
0.9173414, 0.3746498, 1.522838, 1, 1, 1, 1, 1,
0.9190971, 0.3608088, 1.389189, 1, 1, 1, 1, 1,
0.9226579, 1.425568, 0.5739914, 1, 1, 1, 1, 1,
0.9242163, 0.05219257, 1.312159, 1, 1, 1, 1, 1,
0.9250992, -0.7794521, 3.046453, 1, 1, 1, 1, 1,
0.9287675, -0.3615713, 1.81091, 1, 1, 1, 1, 1,
0.9352307, -1.058444, 1.479438, 1, 1, 1, 1, 1,
0.9393463, -0.008812287, 2.340541, 1, 1, 1, 1, 1,
0.9463155, 1.214439, -0.01869519, 1, 1, 1, 1, 1,
0.9496951, 1.199142, 2.281564, 1, 1, 1, 1, 1,
0.9609125, 1.982224, 0.490917, 1, 1, 1, 1, 1,
0.9637235, -0.0443056, 3.271379, 1, 1, 1, 1, 1,
0.9667206, 0.5339543, 0.4847535, 1, 1, 1, 1, 1,
0.9730633, -0.5812779, 1.136546, 0, 0, 1, 1, 1,
0.9770491, 1.259324, 1.478508, 1, 0, 0, 1, 1,
0.9881231, -0.1200316, 2.19785, 1, 0, 0, 1, 1,
0.9925979, -1.624399, 3.540981, 1, 0, 0, 1, 1,
0.998215, -0.6676664, 0.8323785, 1, 0, 0, 1, 1,
0.9996367, 0.1881618, 0.04208584, 1, 0, 0, 1, 1,
1.009599, 0.4303649, 3.169266, 0, 0, 0, 1, 1,
1.012487, -1.783699, 0.4167844, 0, 0, 0, 1, 1,
1.016436, 0.002917038, 2.18208, 0, 0, 0, 1, 1,
1.018858, 0.5549455, 2.557604, 0, 0, 0, 1, 1,
1.022324, 0.9390319, 1.363717, 0, 0, 0, 1, 1,
1.022885, 0.07041594, 2.054081, 0, 0, 0, 1, 1,
1.027973, 1.341399, -0.1775341, 0, 0, 0, 1, 1,
1.031836, 0.1314713, 0.6640932, 1, 1, 1, 1, 1,
1.034373, -0.5492449, 1.656718, 1, 1, 1, 1, 1,
1.035073, 1.518855, 0.01022699, 1, 1, 1, 1, 1,
1.037557, 2.290885, -0.5525711, 1, 1, 1, 1, 1,
1.04827, 0.08975988, 2.172451, 1, 1, 1, 1, 1,
1.048791, -1.400205, 0.8824766, 1, 1, 1, 1, 1,
1.054588, 0.3524379, 0.7051815, 1, 1, 1, 1, 1,
1.054777, -0.7966543, 2.193975, 1, 1, 1, 1, 1,
1.055848, -0.7390295, 1.377904, 1, 1, 1, 1, 1,
1.060695, -1.146759, 1.974337, 1, 1, 1, 1, 1,
1.073275, 0.7234393, 3.265076, 1, 1, 1, 1, 1,
1.088036, -0.0002041257, 3.642869, 1, 1, 1, 1, 1,
1.093485, -0.8319141, 2.77776, 1, 1, 1, 1, 1,
1.096602, -0.1394287, 0.4669074, 1, 1, 1, 1, 1,
1.100235, 0.3823021, 1.382769, 1, 1, 1, 1, 1,
1.113673, -0.5305987, 1.013346, 0, 0, 1, 1, 1,
1.114406, 0.966495, 3.197112, 1, 0, 0, 1, 1,
1.114467, 0.55674, 2.258247, 1, 0, 0, 1, 1,
1.117787, 0.3013673, 1.764614, 1, 0, 0, 1, 1,
1.11914, 0.5872473, 0.07733663, 1, 0, 0, 1, 1,
1.120065, 0.3209238, 1.111166, 1, 0, 0, 1, 1,
1.132887, -1.565663, 4.230418, 0, 0, 0, 1, 1,
1.13335, -0.8992111, 2.970829, 0, 0, 0, 1, 1,
1.140962, -0.1173931, -0.081772, 0, 0, 0, 1, 1,
1.167811, -0.7128685, 3.56896, 0, 0, 0, 1, 1,
1.168343, 0.1637047, 1.684915, 0, 0, 0, 1, 1,
1.168414, -0.08462693, 1.645593, 0, 0, 0, 1, 1,
1.173171, -0.3012638, 1.204691, 0, 0, 0, 1, 1,
1.183493, 1.760647, 0.1611506, 1, 1, 1, 1, 1,
1.191109, -0.6960911, 1.590792, 1, 1, 1, 1, 1,
1.193132, -0.6042557, 1.524406, 1, 1, 1, 1, 1,
1.195287, 0.7931197, 0.8188786, 1, 1, 1, 1, 1,
1.211021, -1.905289, 3.710807, 1, 1, 1, 1, 1,
1.228019, 0.7963393, 0.8765479, 1, 1, 1, 1, 1,
1.233194, 1.037033, 1.783755, 1, 1, 1, 1, 1,
1.242336, -0.2322532, 1.435672, 1, 1, 1, 1, 1,
1.260786, -0.1654264, 2.78473, 1, 1, 1, 1, 1,
1.265411, -0.5439239, 1.174169, 1, 1, 1, 1, 1,
1.273997, -0.5920821, 2.914501, 1, 1, 1, 1, 1,
1.277783, 1.021819, 2.69336, 1, 1, 1, 1, 1,
1.28546, -2.77541, 2.336597, 1, 1, 1, 1, 1,
1.290373, -0.6651542, 1.981524, 1, 1, 1, 1, 1,
1.297527, -1.068175, 1.20213, 1, 1, 1, 1, 1,
1.316927, -0.1155929, 1.85638, 0, 0, 1, 1, 1,
1.334456, 1.082114, 0.3990136, 1, 0, 0, 1, 1,
1.336206, 0.6656002, 0.8594552, 1, 0, 0, 1, 1,
1.3395, -1.040116, 2.595569, 1, 0, 0, 1, 1,
1.339954, -0.01528967, 1.085725, 1, 0, 0, 1, 1,
1.340861, -0.4654868, 0.3813596, 1, 0, 0, 1, 1,
1.351556, 0.8324302, 2.116334, 0, 0, 0, 1, 1,
1.357262, 0.3193827, 0.4150991, 0, 0, 0, 1, 1,
1.361581, -0.6390007, 2.414637, 0, 0, 0, 1, 1,
1.362224, -0.8521083, 2.592633, 0, 0, 0, 1, 1,
1.364574, 0.08420467, 3.280427, 0, 0, 0, 1, 1,
1.372905, 1.379008, 1.923656, 0, 0, 0, 1, 1,
1.383469, -1.38856, 1.997888, 0, 0, 0, 1, 1,
1.388827, 1.800369, -1.867379, 1, 1, 1, 1, 1,
1.396875, 1.129399, 1.593774, 1, 1, 1, 1, 1,
1.404367, 0.4151188, 0.1100247, 1, 1, 1, 1, 1,
1.405668, 0.5571082, 0.8593031, 1, 1, 1, 1, 1,
1.40659, -2.497318, 2.928839, 1, 1, 1, 1, 1,
1.411684, -1.019523, 0.7350592, 1, 1, 1, 1, 1,
1.412514, 0.9031952, 2.088497, 1, 1, 1, 1, 1,
1.413484, 0.1959042, 1.957928, 1, 1, 1, 1, 1,
1.414777, 1.291905, 1.513085, 1, 1, 1, 1, 1,
1.419279, 0.7328495, 0.8633182, 1, 1, 1, 1, 1,
1.419285, -0.4177032, 1.399043, 1, 1, 1, 1, 1,
1.426389, 3.012876, -0.4222007, 1, 1, 1, 1, 1,
1.42841, 0.7900574, -0.1290338, 1, 1, 1, 1, 1,
1.429726, 0.8765069, 1.172468, 1, 1, 1, 1, 1,
1.431041, -1.602087, 3.167231, 1, 1, 1, 1, 1,
1.431815, -0.7108636, 2.784495, 0, 0, 1, 1, 1,
1.439751, -0.7884818, 2.816966, 1, 0, 0, 1, 1,
1.441778, 1.235783, 1.032323, 1, 0, 0, 1, 1,
1.442847, 1.091234, 1.824048, 1, 0, 0, 1, 1,
1.444923, 1.26311, 1.415349, 1, 0, 0, 1, 1,
1.455382, 1.259419, 0.4485987, 1, 0, 0, 1, 1,
1.456342, 1.351386, 0.1606712, 0, 0, 0, 1, 1,
1.456925, 1.097677, 2.341048, 0, 0, 0, 1, 1,
1.471436, 0.7133875, 1.767787, 0, 0, 0, 1, 1,
1.4746, -0.5310777, -0.1141765, 0, 0, 0, 1, 1,
1.495452, 0.9599019, 1.013219, 0, 0, 0, 1, 1,
1.499799, -0.7659519, 1.731019, 0, 0, 0, 1, 1,
1.517987, -1.467038, 0.7525537, 0, 0, 0, 1, 1,
1.526573, -0.05642484, 1.973096, 1, 1, 1, 1, 1,
1.527582, -0.2861925, -1.29808, 1, 1, 1, 1, 1,
1.534713, 0.1156841, 0.1304997, 1, 1, 1, 1, 1,
1.536268, 1.149154, 0.7551311, 1, 1, 1, 1, 1,
1.537275, 1.224013, 1.289504, 1, 1, 1, 1, 1,
1.554437, 0.9686818, 1.50784, 1, 1, 1, 1, 1,
1.555251, 1.336508, 0.559539, 1, 1, 1, 1, 1,
1.562584, -0.02792715, 0.1147956, 1, 1, 1, 1, 1,
1.601547, -0.6076048, 0.1769255, 1, 1, 1, 1, 1,
1.622392, 0.8778125, 0.1816572, 1, 1, 1, 1, 1,
1.631596, 0.02678375, 1.575139, 1, 1, 1, 1, 1,
1.637826, 0.188267, 3.049437, 1, 1, 1, 1, 1,
1.646801, -0.02857292, 2.045881, 1, 1, 1, 1, 1,
1.655307, -0.2993637, 2.062462, 1, 1, 1, 1, 1,
1.661739, 2.325346, 1.977968, 1, 1, 1, 1, 1,
1.672979, 0.4546771, 0.1425901, 0, 0, 1, 1, 1,
1.687348, -0.275796, 1.452505, 1, 0, 0, 1, 1,
1.699179, -0.5488364, 3.206562, 1, 0, 0, 1, 1,
1.704843, 1.070767, 1.785579, 1, 0, 0, 1, 1,
1.714644, 0.6980443, 0.4013957, 1, 0, 0, 1, 1,
1.719591, -0.2999275, 0.3621213, 1, 0, 0, 1, 1,
1.723606, -0.7658972, 2.231074, 0, 0, 0, 1, 1,
1.734778, -0.3626878, 0.675971, 0, 0, 0, 1, 1,
1.735675, 1.358713, 0.7391622, 0, 0, 0, 1, 1,
1.742741, 0.1127213, 2.52355, 0, 0, 0, 1, 1,
1.747972, -0.7465329, 1.103825, 0, 0, 0, 1, 1,
1.758232, 0.7532086, 2.325578, 0, 0, 0, 1, 1,
1.764028, 1.575017, 0.1033147, 0, 0, 0, 1, 1,
1.769985, 1.337003, -0.1453684, 1, 1, 1, 1, 1,
1.788783, 0.1350393, 0.9482089, 1, 1, 1, 1, 1,
1.810034, 1.028064, 0.6101449, 1, 1, 1, 1, 1,
1.873025, 1.857955, 1.085047, 1, 1, 1, 1, 1,
1.889652, -0.2659775, -0.09595811, 1, 1, 1, 1, 1,
1.895663, 0.01492965, 0.5904262, 1, 1, 1, 1, 1,
1.903828, -1.433488, 3.346246, 1, 1, 1, 1, 1,
1.906808, -0.6969076, 2.316204, 1, 1, 1, 1, 1,
1.911882, -0.8341604, 2.334353, 1, 1, 1, 1, 1,
1.91548, 0.1490427, 1.190284, 1, 1, 1, 1, 1,
1.931396, -1.01116, 2.633912, 1, 1, 1, 1, 1,
1.942895, -0.9231201, 2.730881, 1, 1, 1, 1, 1,
1.953844, 0.787052, 0.4389375, 1, 1, 1, 1, 1,
1.973653, -0.8293985, 1.064375, 1, 1, 1, 1, 1,
1.978172, 1.219086, 0.3584111, 1, 1, 1, 1, 1,
1.986524, -0.1182493, 0.8553541, 0, 0, 1, 1, 1,
1.987309, -0.5298501, 2.315633, 1, 0, 0, 1, 1,
2.041068, -0.4424822, 1.690529, 1, 0, 0, 1, 1,
2.105291, 0.5180095, 0.5766237, 1, 0, 0, 1, 1,
2.131413, 0.02183499, 1.430053, 1, 0, 0, 1, 1,
2.16576, 0.6468098, 1.86252, 1, 0, 0, 1, 1,
2.213022, -0.2204144, 2.7629, 0, 0, 0, 1, 1,
2.255152, -1.214992, 0.8426899, 0, 0, 0, 1, 1,
2.263047, -0.7615887, 2.684458, 0, 0, 0, 1, 1,
2.265661, 1.179024, 1.124831, 0, 0, 0, 1, 1,
2.275083, -0.0001886509, 1.79797, 0, 0, 0, 1, 1,
2.292693, -0.4489185, 2.853802, 0, 0, 0, 1, 1,
2.364011, 0.6736117, 2.22022, 0, 0, 0, 1, 1,
2.422037, -0.6678959, 2.531783, 1, 1, 1, 1, 1,
2.458047, 0.809534, 1.455474, 1, 1, 1, 1, 1,
2.519618, -1.67516, 3.015931, 1, 1, 1, 1, 1,
2.627544, -0.09056687, 1.204059, 1, 1, 1, 1, 1,
2.647638, -0.2068583, 1.144828, 1, 1, 1, 1, 1,
2.742035, -2.694996, 1.980336, 1, 1, 1, 1, 1,
3.505248, 0.7316471, 2.473094, 1, 1, 1, 1, 1
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
var radius = 9.742191;
var distance = 34.21903;
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
mvMatrix.translate( 0.09843016, -0.03118706, -0.01896811 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.21903);
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
