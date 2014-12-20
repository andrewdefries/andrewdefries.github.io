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
-2.540057, -0.724812, -1.763046, 1, 0, 0, 1,
-2.515603, 0.2701915, -1.847285, 1, 0.007843138, 0, 1,
-2.409534, -1.966821, -1.644202, 1, 0.01176471, 0, 1,
-2.379467, 1.893463, -1.835716, 1, 0.01960784, 0, 1,
-2.357634, -0.7717586, -1.218442, 1, 0.02352941, 0, 1,
-2.305186, -0.6328655, -2.530194, 1, 0.03137255, 0, 1,
-2.30364, 0.5257805, -2.073129, 1, 0.03529412, 0, 1,
-2.263012, 1.13852, -0.4661007, 1, 0.04313726, 0, 1,
-2.24315, -0.9591673, -2.171799, 1, 0.04705882, 0, 1,
-2.219648, 1.158837, -2.024549, 1, 0.05490196, 0, 1,
-2.216378, -0.8738709, -0.4487764, 1, 0.05882353, 0, 1,
-2.162481, 0.7965862, -0.8020149, 1, 0.06666667, 0, 1,
-2.144388, -0.9517728, -2.247463, 1, 0.07058824, 0, 1,
-2.129265, 0.2630881, -1.602063, 1, 0.07843138, 0, 1,
-2.121889, -2.491753, -2.310417, 1, 0.08235294, 0, 1,
-2.078217, -1.859137, -3.849626, 1, 0.09019608, 0, 1,
-2.04951, 0.6010148, -2.9805, 1, 0.09411765, 0, 1,
-2.023021, 1.755781, -0.4683956, 1, 0.1019608, 0, 1,
-2.004986, -0.2401646, -2.420755, 1, 0.1098039, 0, 1,
-1.994424, -0.3331347, -2.177295, 1, 0.1137255, 0, 1,
-1.966564, 0.27417, -0.8899117, 1, 0.1215686, 0, 1,
-1.96343, -0.9094182, -2.691782, 1, 0.1254902, 0, 1,
-1.955325, 0.6000935, -0.6087968, 1, 0.1333333, 0, 1,
-1.941881, -0.272205, -1.051952, 1, 0.1372549, 0, 1,
-1.939384, -1.408885, -1.616174, 1, 0.145098, 0, 1,
-1.938156, -1.351448, -2.442492, 1, 0.1490196, 0, 1,
-1.919655, -0.4130548, -2.2528, 1, 0.1568628, 0, 1,
-1.919464, -1.129741, -1.889197, 1, 0.1607843, 0, 1,
-1.904498, -0.3061408, -0.5783935, 1, 0.1686275, 0, 1,
-1.885486, -1.05903, -2.81501, 1, 0.172549, 0, 1,
-1.880797, 1.591062, -0.5103766, 1, 0.1803922, 0, 1,
-1.869354, 2.206888, -0.1227018, 1, 0.1843137, 0, 1,
-1.856225, -0.4317485, -1.666809, 1, 0.1921569, 0, 1,
-1.848817, 1.287354, -2.003247, 1, 0.1960784, 0, 1,
-1.833487, -1.027736, -2.428505, 1, 0.2039216, 0, 1,
-1.808947, 0.5960063, -2.516009, 1, 0.2117647, 0, 1,
-1.775406, 0.3455202, -2.270225, 1, 0.2156863, 0, 1,
-1.757579, 1.499446, -0.5070759, 1, 0.2235294, 0, 1,
-1.740742, 1.995516, -0.4549891, 1, 0.227451, 0, 1,
-1.70961, -0.3262179, -1.394143, 1, 0.2352941, 0, 1,
-1.706601, -0.8038904, -3.147782, 1, 0.2392157, 0, 1,
-1.699638, -0.6825883, -1.680693, 1, 0.2470588, 0, 1,
-1.697117, -1.345116, -1.815312, 1, 0.2509804, 0, 1,
-1.687707, -0.1672786, -2.166648, 1, 0.2588235, 0, 1,
-1.67779, 0.1994979, -1.844865, 1, 0.2627451, 0, 1,
-1.675281, 0.4786452, -0.8819715, 1, 0.2705882, 0, 1,
-1.658981, 0.2730473, -1.070532, 1, 0.2745098, 0, 1,
-1.649749, -1.09051, -1.784809, 1, 0.282353, 0, 1,
-1.643115, 1.329861, 0.5831184, 1, 0.2862745, 0, 1,
-1.635508, 0.2549855, -1.612115, 1, 0.2941177, 0, 1,
-1.626758, -0.1732992, -2.135305, 1, 0.3019608, 0, 1,
-1.623399, -0.8032207, -1.796386, 1, 0.3058824, 0, 1,
-1.617269, 0.6100118, -1.006392, 1, 0.3137255, 0, 1,
-1.61708, 0.803494, -0.438372, 1, 0.3176471, 0, 1,
-1.616016, 0.977015, -1.853164, 1, 0.3254902, 0, 1,
-1.60713, 0.6912495, -2.308988, 1, 0.3294118, 0, 1,
-1.6032, -0.1339967, -3.937873, 1, 0.3372549, 0, 1,
-1.593963, -0.7482726, -3.158117, 1, 0.3411765, 0, 1,
-1.586342, 2.052086, -2.019866, 1, 0.3490196, 0, 1,
-1.581216, 1.096856, -0.1925929, 1, 0.3529412, 0, 1,
-1.579237, -0.920374, -0.2726081, 1, 0.3607843, 0, 1,
-1.564071, 0.7014772, -0.1624845, 1, 0.3647059, 0, 1,
-1.555966, 1.224527, -1.004051, 1, 0.372549, 0, 1,
-1.54842, 0.2644548, -1.393079, 1, 0.3764706, 0, 1,
-1.544919, -1.876165, -2.24101, 1, 0.3843137, 0, 1,
-1.537671, -0.05761351, -2.236154, 1, 0.3882353, 0, 1,
-1.530046, 1.293285, -2.006078, 1, 0.3960784, 0, 1,
-1.512202, -0.4701993, -2.202302, 1, 0.4039216, 0, 1,
-1.511995, 1.143687, -1.306513, 1, 0.4078431, 0, 1,
-1.484298, 1.068823, -0.9160678, 1, 0.4156863, 0, 1,
-1.471464, 0.540093, -0.2449985, 1, 0.4196078, 0, 1,
-1.470236, 0.3564805, -3.088546, 1, 0.427451, 0, 1,
-1.468413, -0.6766747, -1.897685, 1, 0.4313726, 0, 1,
-1.468293, 0.9135792, -1.398244, 1, 0.4392157, 0, 1,
-1.454983, 0.6690263, 0.02273548, 1, 0.4431373, 0, 1,
-1.422408, 1.332464, 0.3916422, 1, 0.4509804, 0, 1,
-1.421558, 0.9605385, 0.5169995, 1, 0.454902, 0, 1,
-1.416391, -0.9230285, -2.390319, 1, 0.4627451, 0, 1,
-1.412681, -2.270602, -1.751049, 1, 0.4666667, 0, 1,
-1.406383, -1.572793, -1.35635, 1, 0.4745098, 0, 1,
-1.397822, -0.5883992, -3.363307, 1, 0.4784314, 0, 1,
-1.395721, -0.6262317, -2.020925, 1, 0.4862745, 0, 1,
-1.385068, 1.246499, -0.9853982, 1, 0.4901961, 0, 1,
-1.380858, -0.7683783, -0.8579967, 1, 0.4980392, 0, 1,
-1.369106, -0.6115242, -0.757362, 1, 0.5058824, 0, 1,
-1.367494, -1.140638, -1.344866, 1, 0.509804, 0, 1,
-1.363364, -0.5312146, -2.166479, 1, 0.5176471, 0, 1,
-1.361523, -1.095974, -1.058915, 1, 0.5215687, 0, 1,
-1.3547, -0.1758407, -2.159069, 1, 0.5294118, 0, 1,
-1.354002, -2.06216, -2.670348, 1, 0.5333334, 0, 1,
-1.342042, 0.1504609, -0.54013, 1, 0.5411765, 0, 1,
-1.333908, -0.5921327, -3.074293, 1, 0.5450981, 0, 1,
-1.331855, -0.6368568, -1.006124, 1, 0.5529412, 0, 1,
-1.329603, -2.686404, -2.435717, 1, 0.5568628, 0, 1,
-1.321959, -0.9575503, -3.940401, 1, 0.5647059, 0, 1,
-1.31673, 0.5576685, -0.8216043, 1, 0.5686275, 0, 1,
-1.306598, -0.1490916, -1.438318, 1, 0.5764706, 0, 1,
-1.303947, -0.5934652, -0.825273, 1, 0.5803922, 0, 1,
-1.301439, -0.9020913, -0.794565, 1, 0.5882353, 0, 1,
-1.301008, 1.274309, -2.220925, 1, 0.5921569, 0, 1,
-1.300216, -0.4809708, -1.186937, 1, 0.6, 0, 1,
-1.299551, 0.3685743, -2.361672, 1, 0.6078432, 0, 1,
-1.29496, -0.609796, -3.39089, 1, 0.6117647, 0, 1,
-1.280021, 0.8938821, -2.007112, 1, 0.6196079, 0, 1,
-1.271122, -0.9476025, -2.988681, 1, 0.6235294, 0, 1,
-1.2411, -2.236351, -1.91544, 1, 0.6313726, 0, 1,
-1.240505, -0.731203, -1.795099, 1, 0.6352941, 0, 1,
-1.240036, -1.671656, -2.560035, 1, 0.6431373, 0, 1,
-1.230016, 0.113176, -0.373863, 1, 0.6470588, 0, 1,
-1.225737, 0.5521619, -2.658247, 1, 0.654902, 0, 1,
-1.219652, 0.1787315, -2.28613, 1, 0.6588235, 0, 1,
-1.216975, -0.4728223, -3.25403, 1, 0.6666667, 0, 1,
-1.215984, -0.4198619, -2.719656, 1, 0.6705883, 0, 1,
-1.202781, 1.090769, -0.9069923, 1, 0.6784314, 0, 1,
-1.19595, 1.344694, -1.34464, 1, 0.682353, 0, 1,
-1.189371, -0.7891063, -2.306681, 1, 0.6901961, 0, 1,
-1.189347, 1.478227, -0.0254664, 1, 0.6941177, 0, 1,
-1.172598, 0.6586932, -1.495018, 1, 0.7019608, 0, 1,
-1.171309, -1.345201, -3.155528, 1, 0.7098039, 0, 1,
-1.168665, 0.6653385, -1.257692, 1, 0.7137255, 0, 1,
-1.162691, -0.7399929, -2.397009, 1, 0.7215686, 0, 1,
-1.153008, 0.2223145, -1.572739, 1, 0.7254902, 0, 1,
-1.152557, -0.05999329, -1.356271, 1, 0.7333333, 0, 1,
-1.127531, -0.003538883, -1.877286, 1, 0.7372549, 0, 1,
-1.124717, -0.5339144, -0.9483666, 1, 0.7450981, 0, 1,
-1.122471, 0.4183335, -1.143475, 1, 0.7490196, 0, 1,
-1.119108, 0.0320932, -2.407417, 1, 0.7568628, 0, 1,
-1.118141, -0.1151603, -2.567993, 1, 0.7607843, 0, 1,
-1.114249, 0.9577939, -2.20331, 1, 0.7686275, 0, 1,
-1.11376, 1.442723, -1.609765, 1, 0.772549, 0, 1,
-1.109799, 0.7900273, -1.427814, 1, 0.7803922, 0, 1,
-1.103267, 1.405068, 0.139159, 1, 0.7843137, 0, 1,
-1.086225, 0.3060791, -2.587736, 1, 0.7921569, 0, 1,
-1.075949, -0.307791, -0.6036986, 1, 0.7960784, 0, 1,
-1.072182, 0.5818313, 0.1596674, 1, 0.8039216, 0, 1,
-1.066912, -0.01924129, -1.658078, 1, 0.8117647, 0, 1,
-1.065217, 0.6306295, -0.7308695, 1, 0.8156863, 0, 1,
-1.065108, -1.196474, -1.54556, 1, 0.8235294, 0, 1,
-1.056461, -1.983579, -2.703395, 1, 0.827451, 0, 1,
-1.056012, 0.6690632, -1.023677, 1, 0.8352941, 0, 1,
-1.052647, -1.285761, -2.193599, 1, 0.8392157, 0, 1,
-1.04836, 0.07628948, -1.570839, 1, 0.8470588, 0, 1,
-1.043065, 1.479236, -0.5744004, 1, 0.8509804, 0, 1,
-1.039229, 0.2050714, -1.020307, 1, 0.8588235, 0, 1,
-1.031084, 0.6486491, -1.318507, 1, 0.8627451, 0, 1,
-1.026382, -1.105389, -1.91798, 1, 0.8705882, 0, 1,
-1.020629, -1.136544, -0.9558751, 1, 0.8745098, 0, 1,
-1.014522, 1.17212, -2.746724, 1, 0.8823529, 0, 1,
-1.011239, -0.6601901, -1.918495, 1, 0.8862745, 0, 1,
-1.006783, -0.2121157, -1.207274, 1, 0.8941177, 0, 1,
-1.000226, -0.7431771, -2.228739, 1, 0.8980392, 0, 1,
-0.9973444, 1.797816, -1.886203, 1, 0.9058824, 0, 1,
-0.9939811, 0.716333, -2.391378, 1, 0.9137255, 0, 1,
-0.988894, 0.8576799, -1.617685, 1, 0.9176471, 0, 1,
-0.9797142, 0.3581843, 0.3600159, 1, 0.9254902, 0, 1,
-0.9759584, -1.62891, -1.017667, 1, 0.9294118, 0, 1,
-0.9752594, 0.1022221, -2.379491, 1, 0.9372549, 0, 1,
-0.9721807, -0.3654661, -3.254729, 1, 0.9411765, 0, 1,
-0.971242, -0.9624897, -3.352186, 1, 0.9490196, 0, 1,
-0.966913, 0.9687528, -0.4807042, 1, 0.9529412, 0, 1,
-0.9616883, 0.55609, -0.2002345, 1, 0.9607843, 0, 1,
-0.9478384, -1.156095, -1.008208, 1, 0.9647059, 0, 1,
-0.9447911, -0.9596509, -2.679964, 1, 0.972549, 0, 1,
-0.9379609, -0.1511385, -1.63946, 1, 0.9764706, 0, 1,
-0.92625, 2.365986, -0.7501665, 1, 0.9843137, 0, 1,
-0.9227258, -0.2212279, -0.7489427, 1, 0.9882353, 0, 1,
-0.9155546, -0.3979329, -1.482149, 1, 0.9960784, 0, 1,
-0.9115202, 1.385238, 0.531922, 0.9960784, 1, 0, 1,
-0.9105166, -1.607095, -1.655759, 0.9921569, 1, 0, 1,
-0.905968, 0.3105947, -1.27311, 0.9843137, 1, 0, 1,
-0.9057947, 2.044648, 0.02905038, 0.9803922, 1, 0, 1,
-0.9012639, 1.5747, -0.2499621, 0.972549, 1, 0, 1,
-0.8994243, 1.122258, -2.448319, 0.9686275, 1, 0, 1,
-0.8934873, 0.5141491, -0.2749841, 0.9607843, 1, 0, 1,
-0.8874875, -0.326983, -2.924844, 0.9568627, 1, 0, 1,
-0.8859643, -0.5703968, -1.702219, 0.9490196, 1, 0, 1,
-0.8853943, 1.446525, 0.4416263, 0.945098, 1, 0, 1,
-0.8768945, 2.238396, 0.9889863, 0.9372549, 1, 0, 1,
-0.8753983, -0.7914885, -2.097666, 0.9333333, 1, 0, 1,
-0.8748597, -1.347723, -0.8863613, 0.9254902, 1, 0, 1,
-0.8699738, 0.8928195, -2.083074, 0.9215686, 1, 0, 1,
-0.8677339, 1.836717, -1.493008, 0.9137255, 1, 0, 1,
-0.866672, -2.033633, -3.449883, 0.9098039, 1, 0, 1,
-0.8649652, -0.7833179, -3.812154, 0.9019608, 1, 0, 1,
-0.8645201, -1.71333, -2.402451, 0.8941177, 1, 0, 1,
-0.8613529, 0.7096941, -0.2532493, 0.8901961, 1, 0, 1,
-0.8596469, 0.727356, -0.520049, 0.8823529, 1, 0, 1,
-0.8574377, -0.7413751, -2.629976, 0.8784314, 1, 0, 1,
-0.8536512, 0.7544954, -0.9489968, 0.8705882, 1, 0, 1,
-0.8536512, -0.2053479, -3.371713, 0.8666667, 1, 0, 1,
-0.8534282, 0.7769396, -0.3653013, 0.8588235, 1, 0, 1,
-0.8446645, 0.05245898, -1.498841, 0.854902, 1, 0, 1,
-0.8407086, 0.8510779, -1.485316, 0.8470588, 1, 0, 1,
-0.8376423, -0.6138459, -3.772979, 0.8431373, 1, 0, 1,
-0.8237859, -1.749687, -3.837454, 0.8352941, 1, 0, 1,
-0.8210651, -0.9202781, -1.487885, 0.8313726, 1, 0, 1,
-0.8162764, -0.3301713, -2.403413, 0.8235294, 1, 0, 1,
-0.8126825, 0.3119778, 0.8406481, 0.8196079, 1, 0, 1,
-0.8112075, 2.50492, 0.7657866, 0.8117647, 1, 0, 1,
-0.8041461, -1.743428, -2.056745, 0.8078431, 1, 0, 1,
-0.801572, -1.301447, -2.991981, 0.8, 1, 0, 1,
-0.7957976, -0.6990899, -3.117916, 0.7921569, 1, 0, 1,
-0.7935064, 1.557502, 0.07607993, 0.7882353, 1, 0, 1,
-0.7920048, 0.3497716, 0.2718425, 0.7803922, 1, 0, 1,
-0.7907218, 0.522374, -1.560768, 0.7764706, 1, 0, 1,
-0.7901133, 0.2705058, 0.1325915, 0.7686275, 1, 0, 1,
-0.7830307, -0.4993398, -2.096024, 0.7647059, 1, 0, 1,
-0.7815487, -0.8047859, -3.074338, 0.7568628, 1, 0, 1,
-0.7790762, 0.3221434, -2.182199, 0.7529412, 1, 0, 1,
-0.7781979, -0.8721566, -3.03432, 0.7450981, 1, 0, 1,
-0.7775242, -0.537011, -1.707823, 0.7411765, 1, 0, 1,
-0.7751534, -0.8997346, -2.685896, 0.7333333, 1, 0, 1,
-0.7750436, 0.9493731, -0.9389025, 0.7294118, 1, 0, 1,
-0.7725647, -0.1487613, -2.039477, 0.7215686, 1, 0, 1,
-0.7712158, 2.48193, -0.3348519, 0.7176471, 1, 0, 1,
-0.76069, 1.018578, 2.032753, 0.7098039, 1, 0, 1,
-0.7603672, -0.8854048, -1.312881, 0.7058824, 1, 0, 1,
-0.7565246, -0.2234509, -2.557626, 0.6980392, 1, 0, 1,
-0.755885, 1.19362, 0.550064, 0.6901961, 1, 0, 1,
-0.7361234, 0.4568632, 0.05464063, 0.6862745, 1, 0, 1,
-0.7347882, 0.6271638, 0.764003, 0.6784314, 1, 0, 1,
-0.7277594, 1.400223, -1.99566, 0.6745098, 1, 0, 1,
-0.7246878, 0.5455963, -0.384192, 0.6666667, 1, 0, 1,
-0.7242596, -0.6643691, -1.827208, 0.6627451, 1, 0, 1,
-0.7185443, 1.219015, -1.35882, 0.654902, 1, 0, 1,
-0.7184862, -0.4873692, -0.609664, 0.6509804, 1, 0, 1,
-0.7130764, 0.5693749, -2.45005, 0.6431373, 1, 0, 1,
-0.7121341, 0.8273523, -1.146916, 0.6392157, 1, 0, 1,
-0.7110302, -0.9281868, -2.033083, 0.6313726, 1, 0, 1,
-0.7077883, 1.21844, -0.520047, 0.627451, 1, 0, 1,
-0.6992828, 1.556708, 0.5408301, 0.6196079, 1, 0, 1,
-0.698272, -1.463381, -3.585331, 0.6156863, 1, 0, 1,
-0.6943321, -0.01841021, -2.542616, 0.6078432, 1, 0, 1,
-0.6879177, -0.5855228, -3.267087, 0.6039216, 1, 0, 1,
-0.6846099, 0.5939113, -0.5217381, 0.5960785, 1, 0, 1,
-0.6831892, 0.5539895, -0.2620657, 0.5882353, 1, 0, 1,
-0.6797916, -0.8319995, -3.291329, 0.5843138, 1, 0, 1,
-0.6786024, 0.6438559, -0.1312325, 0.5764706, 1, 0, 1,
-0.6780038, -0.7548302, -1.123918, 0.572549, 1, 0, 1,
-0.6696062, -1.148656, -2.62934, 0.5647059, 1, 0, 1,
-0.6683508, 0.2287278, -2.667136, 0.5607843, 1, 0, 1,
-0.6659079, 1.447888, -1.043105, 0.5529412, 1, 0, 1,
-0.662704, 1.280409, -0.08984843, 0.5490196, 1, 0, 1,
-0.660972, 1.61746, 0.1253871, 0.5411765, 1, 0, 1,
-0.6602644, -0.5950114, -0.9046304, 0.5372549, 1, 0, 1,
-0.6600729, 0.1041111, -2.58197, 0.5294118, 1, 0, 1,
-0.6578367, 1.239242, -1.86867, 0.5254902, 1, 0, 1,
-0.6523232, 0.05231242, -0.7101059, 0.5176471, 1, 0, 1,
-0.6520811, 1.147397, 0.08195987, 0.5137255, 1, 0, 1,
-0.6494446, -0.4590777, -4.42025, 0.5058824, 1, 0, 1,
-0.6482557, 2.144272, 0.01373263, 0.5019608, 1, 0, 1,
-0.6477746, -1.071516, -1.622334, 0.4941176, 1, 0, 1,
-0.6474296, -1.531304, -3.087727, 0.4862745, 1, 0, 1,
-0.6362599, 0.4886017, 0.1917222, 0.4823529, 1, 0, 1,
-0.6356624, -0.659148, -1.779296, 0.4745098, 1, 0, 1,
-0.6348385, -0.3034071, -2.891631, 0.4705882, 1, 0, 1,
-0.6347458, 0.2622691, -0.6231012, 0.4627451, 1, 0, 1,
-0.6339957, 0.2027935, -0.9990202, 0.4588235, 1, 0, 1,
-0.6305578, 0.9023442, -1.07844, 0.4509804, 1, 0, 1,
-0.6295661, -0.2243898, -1.518639, 0.4470588, 1, 0, 1,
-0.625431, -1.056409, -4.201716, 0.4392157, 1, 0, 1,
-0.6202431, -0.7714725, -2.424094, 0.4352941, 1, 0, 1,
-0.6184164, 0.7466719, -2.348659, 0.427451, 1, 0, 1,
-0.6169285, -1.4599, -2.767417, 0.4235294, 1, 0, 1,
-0.6167878, -1.254499, -1.629387, 0.4156863, 1, 0, 1,
-0.6143596, -1.121353, -3.079038, 0.4117647, 1, 0, 1,
-0.6140715, -0.3684114, -1.525766, 0.4039216, 1, 0, 1,
-0.6102564, -0.03799996, -1.431171, 0.3960784, 1, 0, 1,
-0.6062288, -0.6253845, -2.518242, 0.3921569, 1, 0, 1,
-0.6040909, 0.04694821, -1.155163, 0.3843137, 1, 0, 1,
-0.6017777, 0.5786245, -0.06513303, 0.3803922, 1, 0, 1,
-0.6011774, 0.384579, -1.582354, 0.372549, 1, 0, 1,
-0.6006842, -0.8469234, -3.542003, 0.3686275, 1, 0, 1,
-0.598886, -1.414293, -3.150964, 0.3607843, 1, 0, 1,
-0.5934627, -0.9694504, -3.429993, 0.3568628, 1, 0, 1,
-0.5925428, -0.3795401, -3.218862, 0.3490196, 1, 0, 1,
-0.588066, 0.04360483, -1.219255, 0.345098, 1, 0, 1,
-0.5874472, 0.3004591, -1.991068, 0.3372549, 1, 0, 1,
-0.5843669, 0.1215478, -0.5892363, 0.3333333, 1, 0, 1,
-0.5835849, -0.3261212, -1.962343, 0.3254902, 1, 0, 1,
-0.5794783, 1.283423, 0.2313842, 0.3215686, 1, 0, 1,
-0.5786459, 0.5649068, -0.315965, 0.3137255, 1, 0, 1,
-0.5784757, -0.5748851, -2.051834, 0.3098039, 1, 0, 1,
-0.5766504, 0.3517425, -1.535072, 0.3019608, 1, 0, 1,
-0.5617108, -0.184083, -2.616638, 0.2941177, 1, 0, 1,
-0.5614359, -0.9197762, -3.095592, 0.2901961, 1, 0, 1,
-0.5553616, -0.8618564, -3.208938, 0.282353, 1, 0, 1,
-0.5529425, 2.29365, -0.250747, 0.2784314, 1, 0, 1,
-0.550489, -1.039601, -1.918005, 0.2705882, 1, 0, 1,
-0.5428124, 0.07025494, -0.800084, 0.2666667, 1, 0, 1,
-0.5422605, -0.1119534, -1.293028, 0.2588235, 1, 0, 1,
-0.5401779, -0.07753323, -2.206827, 0.254902, 1, 0, 1,
-0.5361167, 0.3921082, -0.4170371, 0.2470588, 1, 0, 1,
-0.5316995, 0.1447244, -0.02270404, 0.2431373, 1, 0, 1,
-0.5310503, 0.2684676, -0.02409179, 0.2352941, 1, 0, 1,
-0.5204146, -1.349694, -1.369206, 0.2313726, 1, 0, 1,
-0.5195027, 2.06842, 0.7820253, 0.2235294, 1, 0, 1,
-0.5172671, -0.3258867, -1.328416, 0.2196078, 1, 0, 1,
-0.5160637, 1.394057, 0.02339149, 0.2117647, 1, 0, 1,
-0.5095856, -0.3547932, -1.414353, 0.2078431, 1, 0, 1,
-0.5095187, 2.12801, 1.483981, 0.2, 1, 0, 1,
-0.5084974, 0.4134974, -0.1978224, 0.1921569, 1, 0, 1,
-0.5064528, 0.9179254, 1.118144, 0.1882353, 1, 0, 1,
-0.5045837, -0.8342708, -1.719742, 0.1803922, 1, 0, 1,
-0.5023844, -0.3980643, -1.94365, 0.1764706, 1, 0, 1,
-0.5000136, 1.399596, -1.630616, 0.1686275, 1, 0, 1,
-0.4972196, 1.493468, 0.2369194, 0.1647059, 1, 0, 1,
-0.4907854, 0.6158085, -0.338855, 0.1568628, 1, 0, 1,
-0.4870807, -1.119248, -1.578433, 0.1529412, 1, 0, 1,
-0.4850614, 0.07637067, -1.11755, 0.145098, 1, 0, 1,
-0.4799443, -0.8480195, -3.802744, 0.1411765, 1, 0, 1,
-0.4790453, 2.15031, -0.2032487, 0.1333333, 1, 0, 1,
-0.4780001, -0.2029831, 0.002232522, 0.1294118, 1, 0, 1,
-0.4754073, -0.2788481, -2.28496, 0.1215686, 1, 0, 1,
-0.4752105, -1.030627, -3.380789, 0.1176471, 1, 0, 1,
-0.4728053, -0.4908715, -0.9531928, 0.1098039, 1, 0, 1,
-0.4727496, -0.3822702, -1.859425, 0.1058824, 1, 0, 1,
-0.4716653, 0.2026245, -1.299963, 0.09803922, 1, 0, 1,
-0.4642927, 2.742826, -0.3169623, 0.09019608, 1, 0, 1,
-0.4626057, 0.848464, -0.8068562, 0.08627451, 1, 0, 1,
-0.4611872, 0.5797869, -1.42185, 0.07843138, 1, 0, 1,
-0.459629, -1.50864, -2.428798, 0.07450981, 1, 0, 1,
-0.4564221, 0.454041, -0.1023011, 0.06666667, 1, 0, 1,
-0.4551798, 1.81668, -0.6907533, 0.0627451, 1, 0, 1,
-0.453653, -0.4961568, -2.870291, 0.05490196, 1, 0, 1,
-0.4532775, -1.534088, -3.304684, 0.05098039, 1, 0, 1,
-0.4439989, -0.8044238, -1.744536, 0.04313726, 1, 0, 1,
-0.4412287, 0.8318626, -0.3933017, 0.03921569, 1, 0, 1,
-0.4304981, -1.040189, -1.887176, 0.03137255, 1, 0, 1,
-0.4295453, -0.2532064, -2.795735, 0.02745098, 1, 0, 1,
-0.4256336, -0.8217901, -1.802431, 0.01960784, 1, 0, 1,
-0.424915, -1.62996, -2.750487, 0.01568628, 1, 0, 1,
-0.4247194, -1.435799, -3.097691, 0.007843138, 1, 0, 1,
-0.4200921, -0.02161414, -1.901319, 0.003921569, 1, 0, 1,
-0.418952, 0.1387417, -0.8392019, 0, 1, 0.003921569, 1,
-0.418362, 0.03180771, -2.152318, 0, 1, 0.01176471, 1,
-0.4178276, 0.664431, -0.8583412, 0, 1, 0.01568628, 1,
-0.4162879, 2.338722, -0.3494214, 0, 1, 0.02352941, 1,
-0.4143551, 0.6238021, 0.1582153, 0, 1, 0.02745098, 1,
-0.4138517, -0.3711889, -2.451451, 0, 1, 0.03529412, 1,
-0.4067426, 1.436899, 0.373502, 0, 1, 0.03921569, 1,
-0.4045152, 1.224248, 0.6393554, 0, 1, 0.04705882, 1,
-0.4006872, -0.1135012, -1.829644, 0, 1, 0.05098039, 1,
-0.4000173, 0.88123, -0.3733887, 0, 1, 0.05882353, 1,
-0.3976445, -1.026002, -4.204093, 0, 1, 0.0627451, 1,
-0.3951238, 0.2199012, -2.759424, 0, 1, 0.07058824, 1,
-0.3936493, -1.133009, -0.9728234, 0, 1, 0.07450981, 1,
-0.393454, -1.646951, -2.201632, 0, 1, 0.08235294, 1,
-0.3927176, -2.106348, -2.93894, 0, 1, 0.08627451, 1,
-0.3873939, 0.07766404, -3.683638, 0, 1, 0.09411765, 1,
-0.3851104, -0.1665902, -2.781667, 0, 1, 0.1019608, 1,
-0.3850704, -2.53208, -2.726133, 0, 1, 0.1058824, 1,
-0.3844468, -1.078082, -1.970767, 0, 1, 0.1137255, 1,
-0.3804312, 0.2422542, -2.070456, 0, 1, 0.1176471, 1,
-0.3786415, -0.1425171, -2.499051, 0, 1, 0.1254902, 1,
-0.3781729, -0.2184469, -1.410571, 0, 1, 0.1294118, 1,
-0.3772403, 0.3399214, 0.8882173, 0, 1, 0.1372549, 1,
-0.3751416, 0.7556193, -0.06039446, 0, 1, 0.1411765, 1,
-0.3730103, -0.2501903, -3.008142, 0, 1, 0.1490196, 1,
-0.3727611, 0.8721523, 0.02962332, 0, 1, 0.1529412, 1,
-0.3681408, 1.019704, 0.8092517, 0, 1, 0.1607843, 1,
-0.3660763, 1.17127, 0.3381362, 0, 1, 0.1647059, 1,
-0.363808, -0.4669563, -2.868842, 0, 1, 0.172549, 1,
-0.3634083, -0.22484, -2.256355, 0, 1, 0.1764706, 1,
-0.3625047, 0.5267614, -0.9183258, 0, 1, 0.1843137, 1,
-0.3594418, 1.248753, -0.3122485, 0, 1, 0.1882353, 1,
-0.359407, -1.003276, -2.379023, 0, 1, 0.1960784, 1,
-0.356006, 0.1347322, -0.7359154, 0, 1, 0.2039216, 1,
-0.3550762, -0.08571646, -2.458735, 0, 1, 0.2078431, 1,
-0.354954, -0.8390616, -2.937561, 0, 1, 0.2156863, 1,
-0.3455679, -0.5496353, -2.893464, 0, 1, 0.2196078, 1,
-0.3426331, 1.516125, 0.09022228, 0, 1, 0.227451, 1,
-0.3353265, -0.1728696, -1.25156, 0, 1, 0.2313726, 1,
-0.3325877, -1.010859, -1.422762, 0, 1, 0.2392157, 1,
-0.3275469, -0.3159179, -1.130639, 0, 1, 0.2431373, 1,
-0.3219891, 2.165869, -1.154129, 0, 1, 0.2509804, 1,
-0.320791, 1.029511, -0.1067978, 0, 1, 0.254902, 1,
-0.3142859, 1.249167, -1.274375, 0, 1, 0.2627451, 1,
-0.3112507, 0.005860877, -1.381279, 0, 1, 0.2666667, 1,
-0.3099051, -1.636386, -3.382434, 0, 1, 0.2745098, 1,
-0.3095918, -0.2889918, -2.864169, 0, 1, 0.2784314, 1,
-0.3078008, -0.6439318, -2.882779, 0, 1, 0.2862745, 1,
-0.3068544, -1.593026, -1.96494, 0, 1, 0.2901961, 1,
-0.300041, 0.7632695, -0.9195155, 0, 1, 0.2980392, 1,
-0.2996175, 0.5329351, -1.578094, 0, 1, 0.3058824, 1,
-0.2976329, -0.02265585, -1.173158, 0, 1, 0.3098039, 1,
-0.2933692, 1.337965, -1.318787, 0, 1, 0.3176471, 1,
-0.2925039, 1.500779, -0.7626162, 0, 1, 0.3215686, 1,
-0.283627, 1.533641, -1.460197, 0, 1, 0.3294118, 1,
-0.273577, -1.776617, -4.246868, 0, 1, 0.3333333, 1,
-0.2696129, 0.1653655, -1.75736, 0, 1, 0.3411765, 1,
-0.2678521, -1.319499, -1.648123, 0, 1, 0.345098, 1,
-0.2637789, -4.076245, -2.963226, 0, 1, 0.3529412, 1,
-0.2628969, 0.8468472, -0.0927071, 0, 1, 0.3568628, 1,
-0.258007, 0.6556335, -0.06999766, 0, 1, 0.3647059, 1,
-0.2565019, -0.1812155, -2.29168, 0, 1, 0.3686275, 1,
-0.2543174, 0.3281253, -0.95686, 0, 1, 0.3764706, 1,
-0.2500719, 0.735778, 0.1765295, 0, 1, 0.3803922, 1,
-0.2493824, -0.1111484, 0.2106467, 0, 1, 0.3882353, 1,
-0.2443542, -1.414138, -2.036889, 0, 1, 0.3921569, 1,
-0.2421261, 0.5136579, -0.2295762, 0, 1, 0.4, 1,
-0.2401096, -0.3534892, -2.800658, 0, 1, 0.4078431, 1,
-0.2364142, -1.610508, -2.590443, 0, 1, 0.4117647, 1,
-0.2362847, -0.5885784, -4.348122, 0, 1, 0.4196078, 1,
-0.2336662, 0.2021367, -1.125436, 0, 1, 0.4235294, 1,
-0.2331164, 0.01838412, -3.589392, 0, 1, 0.4313726, 1,
-0.2298202, -0.3741207, -1.172879, 0, 1, 0.4352941, 1,
-0.2253609, 0.1171834, -1.925444, 0, 1, 0.4431373, 1,
-0.2252878, -0.7688406, -3.759033, 0, 1, 0.4470588, 1,
-0.2245236, -0.146487, -3.931467, 0, 1, 0.454902, 1,
-0.2244863, -0.8137822, -3.585257, 0, 1, 0.4588235, 1,
-0.2217434, -3.109417, -3.25987, 0, 1, 0.4666667, 1,
-0.2167295, -0.2509115, -5.909657, 0, 1, 0.4705882, 1,
-0.2149509, -0.3379675, -2.817283, 0, 1, 0.4784314, 1,
-0.213205, -0.1379201, 0.06500621, 0, 1, 0.4823529, 1,
-0.2120557, -0.6582928, -0.7136966, 0, 1, 0.4901961, 1,
-0.2077912, -0.5554008, -2.301087, 0, 1, 0.4941176, 1,
-0.2014517, -1.080488, -4.843619, 0, 1, 0.5019608, 1,
-0.20106, -0.07547826, -2.340429, 0, 1, 0.509804, 1,
-0.2009207, -0.9907522, -2.54376, 0, 1, 0.5137255, 1,
-0.19912, 0.045589, -0.6076549, 0, 1, 0.5215687, 1,
-0.1910318, -0.6777032, -2.039712, 0, 1, 0.5254902, 1,
-0.1804198, 0.2782625, -0.9874693, 0, 1, 0.5333334, 1,
-0.1804105, 1.307376, -0.6483423, 0, 1, 0.5372549, 1,
-0.1803832, 0.1764516, -1.336735, 0, 1, 0.5450981, 1,
-0.1781739, -0.3305859, -4.025826, 0, 1, 0.5490196, 1,
-0.1768847, -0.263379, -1.558774, 0, 1, 0.5568628, 1,
-0.1757015, 2.304077, 1.044209, 0, 1, 0.5607843, 1,
-0.1755471, -0.2749357, -3.491556, 0, 1, 0.5686275, 1,
-0.1737166, 1.102203, 0.3697862, 0, 1, 0.572549, 1,
-0.1717995, 2.371935, -0.2016862, 0, 1, 0.5803922, 1,
-0.1702158, 2.084462, -1.565709, 0, 1, 0.5843138, 1,
-0.1690398, -1.258111, -3.595269, 0, 1, 0.5921569, 1,
-0.1561816, 0.2485072, -1.621031, 0, 1, 0.5960785, 1,
-0.1561197, 1.981419, 0.03522915, 0, 1, 0.6039216, 1,
-0.1541011, -1.201914, -1.906092, 0, 1, 0.6117647, 1,
-0.1510921, -0.6601407, -4.601773, 0, 1, 0.6156863, 1,
-0.150748, 0.007382344, -2.563962, 0, 1, 0.6235294, 1,
-0.1484751, -1.347695, -4.132885, 0, 1, 0.627451, 1,
-0.1406966, 1.009342, 1.858845, 0, 1, 0.6352941, 1,
-0.140329, -1.579697, -3.713249, 0, 1, 0.6392157, 1,
-0.1370932, 1.178949, 0.9911451, 0, 1, 0.6470588, 1,
-0.1347973, 1.251687, 0.7875344, 0, 1, 0.6509804, 1,
-0.1312164, -1.089616, -2.659258, 0, 1, 0.6588235, 1,
-0.1256503, 0.7980502, -0.3748217, 0, 1, 0.6627451, 1,
-0.1239106, 1.961857, 0.4748333, 0, 1, 0.6705883, 1,
-0.1236768, 0.09808053, -1.670462, 0, 1, 0.6745098, 1,
-0.1202025, -0.1762284, -0.8856097, 0, 1, 0.682353, 1,
-0.1182646, 1.935727, -0.6657178, 0, 1, 0.6862745, 1,
-0.1173719, 0.09792102, -0.1648016, 0, 1, 0.6941177, 1,
-0.1166256, -1.211729, -5.611887, 0, 1, 0.7019608, 1,
-0.1119316, 0.3008815, 0.4644948, 0, 1, 0.7058824, 1,
-0.1111374, -0.3132626, -2.330496, 0, 1, 0.7137255, 1,
-0.1102096, 0.1044139, 0.1799448, 0, 1, 0.7176471, 1,
-0.1099425, -0.2409912, -1.260424, 0, 1, 0.7254902, 1,
-0.1097116, -0.4039846, -3.01749, 0, 1, 0.7294118, 1,
-0.1080009, 2.267761, 0.7463287, 0, 1, 0.7372549, 1,
-0.1049383, -1.704499, -1.781493, 0, 1, 0.7411765, 1,
-0.1040016, -1.470437, -2.0012, 0, 1, 0.7490196, 1,
-0.1037923, -0.4364332, -4.618146, 0, 1, 0.7529412, 1,
-0.1000332, -1.065829, -4.330349, 0, 1, 0.7607843, 1,
-0.09933415, 1.194506, 0.09464652, 0, 1, 0.7647059, 1,
-0.09745614, -0.374026, -2.532489, 0, 1, 0.772549, 1,
-0.09485023, -0.02003161, -1.146983, 0, 1, 0.7764706, 1,
-0.09430809, 1.169521, -2.086905, 0, 1, 0.7843137, 1,
-0.09287456, 0.7856719, -1.856102, 0, 1, 0.7882353, 1,
-0.09086972, -0.8582418, -4.214554, 0, 1, 0.7960784, 1,
-0.09067441, 1.178875, -0.8982924, 0, 1, 0.8039216, 1,
-0.09015277, 0.2262124, -0.798583, 0, 1, 0.8078431, 1,
-0.08705061, -1.003112, -3.516109, 0, 1, 0.8156863, 1,
-0.08621911, -0.04104264, -2.695507, 0, 1, 0.8196079, 1,
-0.08492123, 0.3866132, -0.1608056, 0, 1, 0.827451, 1,
-0.08183461, -0.4069676, -2.72352, 0, 1, 0.8313726, 1,
-0.08176531, 0.6700187, -1.629252, 0, 1, 0.8392157, 1,
-0.07421644, -1.802378, -2.438732, 0, 1, 0.8431373, 1,
-0.0732643, -0.876482, -4.053108, 0, 1, 0.8509804, 1,
-0.06856938, -0.8286049, -3.772651, 0, 1, 0.854902, 1,
-0.06659278, -0.7226853, -3.807164, 0, 1, 0.8627451, 1,
-0.06550936, 0.099632, 0.4680079, 0, 1, 0.8666667, 1,
-0.0626744, -0.2292943, -2.912432, 0, 1, 0.8745098, 1,
-0.06189542, 0.6134768, -0.04670072, 0, 1, 0.8784314, 1,
-0.06033751, -1.013158, -4.166726, 0, 1, 0.8862745, 1,
-0.06025239, 1.585382, 0.7814664, 0, 1, 0.8901961, 1,
-0.05889298, -0.1662951, -2.742865, 0, 1, 0.8980392, 1,
-0.05501026, 1.1834, -1.234082, 0, 1, 0.9058824, 1,
-0.04937523, 1.52941, 0.6054912, 0, 1, 0.9098039, 1,
-0.04720546, -0.6768661, -4.616956, 0, 1, 0.9176471, 1,
-0.0445779, -0.6418817, -3.160568, 0, 1, 0.9215686, 1,
-0.04435109, 0.9375719, 0.863448, 0, 1, 0.9294118, 1,
-0.03945617, 0.5553043, -0.3831846, 0, 1, 0.9333333, 1,
-0.0352819, 0.8646255, -1.063557, 0, 1, 0.9411765, 1,
-0.03394658, 0.03111758, -0.4240547, 0, 1, 0.945098, 1,
-0.0243952, -1.193326, -4.107088, 0, 1, 0.9529412, 1,
-0.02362829, -0.188794, -4.144151, 0, 1, 0.9568627, 1,
-0.02335222, 0.3456692, -0.4564111, 0, 1, 0.9647059, 1,
-0.01868855, 0.2951886, -1.16752, 0, 1, 0.9686275, 1,
-0.01703464, 1.338767, -0.005871785, 0, 1, 0.9764706, 1,
-0.011458, 1.548473, -0.8741316, 0, 1, 0.9803922, 1,
-0.01144323, 0.5833523, -0.2633683, 0, 1, 0.9882353, 1,
-0.008926523, 0.07386443, 0.2128857, 0, 1, 0.9921569, 1,
-0.002616214, 0.4783296, -0.7973738, 0, 1, 1, 1,
-0.002304778, -0.1033353, -3.624843, 0, 0.9921569, 1, 1,
0.0001997792, -1.319611, 3.518045, 0, 0.9882353, 1, 1,
0.001951096, -0.05436895, 3.24689, 0, 0.9803922, 1, 1,
0.003214734, 0.1981146, 0.6742748, 0, 0.9764706, 1, 1,
0.005304893, -1.199142, 2.959494, 0, 0.9686275, 1, 1,
0.007960275, 0.7864302, -0.9026074, 0, 0.9647059, 1, 1,
0.009938932, 0.3154466, 0.807511, 0, 0.9568627, 1, 1,
0.01466259, 0.9132851, -0.4861569, 0, 0.9529412, 1, 1,
0.01498527, 0.03814437, -1.480238, 0, 0.945098, 1, 1,
0.01715981, -0.387363, 3.541054, 0, 0.9411765, 1, 1,
0.02091036, -0.6937814, 3.80281, 0, 0.9333333, 1, 1,
0.02147588, 0.2404703, 0.1806615, 0, 0.9294118, 1, 1,
0.0221808, 0.07740059, 0.2242112, 0, 0.9215686, 1, 1,
0.02387792, 0.5222614, -0.1561198, 0, 0.9176471, 1, 1,
0.02608015, -0.271756, 5.066336, 0, 0.9098039, 1, 1,
0.02903423, -1.29164, 2.943443, 0, 0.9058824, 1, 1,
0.02946869, 2.277287, 0.2367197, 0, 0.8980392, 1, 1,
0.03232643, 1.778055, 0.7449411, 0, 0.8901961, 1, 1,
0.03391814, -0.6533525, 2.567244, 0, 0.8862745, 1, 1,
0.0339798, 0.5196365, 1.487495, 0, 0.8784314, 1, 1,
0.03554999, -0.6536565, 3.041193, 0, 0.8745098, 1, 1,
0.03849359, -0.381919, 3.949298, 0, 0.8666667, 1, 1,
0.04684656, -0.7319171, 2.020311, 0, 0.8627451, 1, 1,
0.04781656, 1.394224, 0.0985484, 0, 0.854902, 1, 1,
0.05692055, -2.472996, 5.289999, 0, 0.8509804, 1, 1,
0.05862951, -0.3038997, 2.043568, 0, 0.8431373, 1, 1,
0.06137106, -0.6503794, 2.570557, 0, 0.8392157, 1, 1,
0.06729782, -2.650935, 3.280188, 0, 0.8313726, 1, 1,
0.06777506, -0.0834698, 3.316135, 0, 0.827451, 1, 1,
0.06851613, -0.6560913, 2.396891, 0, 0.8196079, 1, 1,
0.07004811, 0.7961614, 1.103506, 0, 0.8156863, 1, 1,
0.07244196, -1.439565, 2.368268, 0, 0.8078431, 1, 1,
0.07849155, -0.6050741, 4.509981, 0, 0.8039216, 1, 1,
0.08046837, -0.6550191, 0.8207898, 0, 0.7960784, 1, 1,
0.08106304, 1.028827, -0.01836755, 0, 0.7882353, 1, 1,
0.08440988, -1.126296, 3.056767, 0, 0.7843137, 1, 1,
0.08638594, 0.7090605, 0.2910238, 0, 0.7764706, 1, 1,
0.09094556, 0.5414878, -0.1479055, 0, 0.772549, 1, 1,
0.09289852, 0.74896, 1.378319, 0, 0.7647059, 1, 1,
0.09544509, -0.4599073, 2.644195, 0, 0.7607843, 1, 1,
0.1008959, 1.169348, 1.726857, 0, 0.7529412, 1, 1,
0.1026338, -1.325382, 2.643385, 0, 0.7490196, 1, 1,
0.109464, 0.2825558, 0.3704759, 0, 0.7411765, 1, 1,
0.113269, -0.356352, 4.85111, 0, 0.7372549, 1, 1,
0.1149615, -0.2856431, 4.794201, 0, 0.7294118, 1, 1,
0.1151828, -0.2852257, 2.511596, 0, 0.7254902, 1, 1,
0.1174586, -1.057482, 1.729817, 0, 0.7176471, 1, 1,
0.1178375, -1.391128, 2.606235, 0, 0.7137255, 1, 1,
0.1264157, -0.0356125, 1.05065, 0, 0.7058824, 1, 1,
0.1279307, 0.5477705, 0.1395656, 0, 0.6980392, 1, 1,
0.1335538, -0.3019501, 1.993759, 0, 0.6941177, 1, 1,
0.134825, -1.629052, 3.741153, 0, 0.6862745, 1, 1,
0.13842, -0.05807464, 3.043059, 0, 0.682353, 1, 1,
0.1389861, -0.2627148, 2.889858, 0, 0.6745098, 1, 1,
0.1439701, -0.3811918, 2.154891, 0, 0.6705883, 1, 1,
0.1468709, -0.411344, 2.411938, 0, 0.6627451, 1, 1,
0.1478858, 0.5325447, 1.005846, 0, 0.6588235, 1, 1,
0.1481002, -0.06385963, 2.629772, 0, 0.6509804, 1, 1,
0.1483417, -1.319729, 1.754078, 0, 0.6470588, 1, 1,
0.1537481, 0.8338303, 1.377341, 0, 0.6392157, 1, 1,
0.1566034, 0.4447711, 0.2009084, 0, 0.6352941, 1, 1,
0.1566035, 0.3715242, -0.1533951, 0, 0.627451, 1, 1,
0.1608223, -0.710039, 3.191682, 0, 0.6235294, 1, 1,
0.1634388, -2.465588, 2.7981, 0, 0.6156863, 1, 1,
0.1636118, 0.2328338, 0.4272448, 0, 0.6117647, 1, 1,
0.1659613, 0.3507677, 0.6530375, 0, 0.6039216, 1, 1,
0.1678012, -1.1973, 1.003449, 0, 0.5960785, 1, 1,
0.1752965, -0.3175678, 3.003562, 0, 0.5921569, 1, 1,
0.1754742, -0.3195874, 1.048572, 0, 0.5843138, 1, 1,
0.1772362, -1.23848, 3.199214, 0, 0.5803922, 1, 1,
0.1783343, 0.8221404, 0.7524127, 0, 0.572549, 1, 1,
0.1810577, -0.8386619, 4.244941, 0, 0.5686275, 1, 1,
0.1826497, 0.04846795, -0.7801507, 0, 0.5607843, 1, 1,
0.184152, -0.136053, 2.171003, 0, 0.5568628, 1, 1,
0.1865997, 0.2870725, 0.8173296, 0, 0.5490196, 1, 1,
0.187901, -1.579127, 2.661504, 0, 0.5450981, 1, 1,
0.1880483, 0.1209173, 0.01611567, 0, 0.5372549, 1, 1,
0.1881133, -1.232029, 4.809309, 0, 0.5333334, 1, 1,
0.210328, -1.563803, 1.722919, 0, 0.5254902, 1, 1,
0.2106328, -0.1009251, 1.390576, 0, 0.5215687, 1, 1,
0.2121231, -0.879446, -0.1703355, 0, 0.5137255, 1, 1,
0.2333912, 0.193535, 2.516267, 0, 0.509804, 1, 1,
0.235205, 0.1780962, 0.5993237, 0, 0.5019608, 1, 1,
0.2407991, 2.062068, -0.2380198, 0, 0.4941176, 1, 1,
0.2416503, 0.9764993, 1.604689, 0, 0.4901961, 1, 1,
0.2420896, 0.1052089, 0.05513604, 0, 0.4823529, 1, 1,
0.2461138, 0.4955614, 1.724864, 0, 0.4784314, 1, 1,
0.2480919, 0.4866787, -0.1211328, 0, 0.4705882, 1, 1,
0.2482704, 0.3483158, -2.163772, 0, 0.4666667, 1, 1,
0.2512237, -0.9303636, 2.164403, 0, 0.4588235, 1, 1,
0.2550104, -0.2224468, 3.401304, 0, 0.454902, 1, 1,
0.2570486, 0.5034083, -0.9729232, 0, 0.4470588, 1, 1,
0.2580494, -0.1669887, 1.598462, 0, 0.4431373, 1, 1,
0.260601, 1.121913, 1.666937, 0, 0.4352941, 1, 1,
0.2620467, -0.3060694, 1.194273, 0, 0.4313726, 1, 1,
0.2625799, 1.323943, 0.4642694, 0, 0.4235294, 1, 1,
0.2631427, -0.3458604, 3.54986, 0, 0.4196078, 1, 1,
0.2741018, 0.3490715, 1.121817, 0, 0.4117647, 1, 1,
0.2769814, -3.530385, 2.258424, 0, 0.4078431, 1, 1,
0.2846633, -0.4627598, 3.808486, 0, 0.4, 1, 1,
0.2847925, -0.916416, 2.450337, 0, 0.3921569, 1, 1,
0.2873136, 0.7884642, 1.052449, 0, 0.3882353, 1, 1,
0.2881663, 1.296637, 2.837905, 0, 0.3803922, 1, 1,
0.2886775, 1.581724, 0.8096012, 0, 0.3764706, 1, 1,
0.2888626, -1.590416, 3.773502, 0, 0.3686275, 1, 1,
0.2893828, 0.0933966, 1.85217, 0, 0.3647059, 1, 1,
0.2911436, -0.8429315, 2.508922, 0, 0.3568628, 1, 1,
0.2918944, -1.232764, 1.463079, 0, 0.3529412, 1, 1,
0.2924353, -0.807691, 1.928315, 0, 0.345098, 1, 1,
0.2959802, -0.7613785, 2.596961, 0, 0.3411765, 1, 1,
0.2976741, 0.5044626, 0.5527099, 0, 0.3333333, 1, 1,
0.2992572, 0.3884104, 1.473562, 0, 0.3294118, 1, 1,
0.3007181, -0.5618652, 2.901834, 0, 0.3215686, 1, 1,
0.3019196, -1.093105, 2.360605, 0, 0.3176471, 1, 1,
0.3040469, 0.2894975, 0.7530205, 0, 0.3098039, 1, 1,
0.304673, -1.43777, 2.476174, 0, 0.3058824, 1, 1,
0.306476, -2.601423, 2.441548, 0, 0.2980392, 1, 1,
0.308364, 1.617346, 2.859562, 0, 0.2901961, 1, 1,
0.3094325, 1.400409, -0.02291991, 0, 0.2862745, 1, 1,
0.3094814, -0.442988, 0.6950871, 0, 0.2784314, 1, 1,
0.3117822, -1.353896, 3.344045, 0, 0.2745098, 1, 1,
0.3140606, 0.5377195, 1.249862, 0, 0.2666667, 1, 1,
0.3148338, -1.937597, 1.886343, 0, 0.2627451, 1, 1,
0.3180038, 0.1651317, 2.132648, 0, 0.254902, 1, 1,
0.3236399, 1.215305, 1.656151, 0, 0.2509804, 1, 1,
0.3243116, -0.1618722, 0.7257704, 0, 0.2431373, 1, 1,
0.3278896, 0.6952907, 0.361646, 0, 0.2392157, 1, 1,
0.3307254, -0.2130733, 1.670606, 0, 0.2313726, 1, 1,
0.3317455, 0.461961, 0.1808569, 0, 0.227451, 1, 1,
0.3398836, 0.6465548, 0.544631, 0, 0.2196078, 1, 1,
0.3417648, 1.124931, -0.01802869, 0, 0.2156863, 1, 1,
0.3447528, -0.3793723, 1.032373, 0, 0.2078431, 1, 1,
0.3473691, 0.06632697, 0.6616546, 0, 0.2039216, 1, 1,
0.3516319, -0.0454728, 0.9998522, 0, 0.1960784, 1, 1,
0.3523867, 0.4389089, 0.7042988, 0, 0.1882353, 1, 1,
0.3533473, -0.6382899, 3.19255, 0, 0.1843137, 1, 1,
0.3554263, -0.00341973, 2.419941, 0, 0.1764706, 1, 1,
0.3561415, -0.5788906, 2.768346, 0, 0.172549, 1, 1,
0.3573374, -1.03707, 1.780682, 0, 0.1647059, 1, 1,
0.3581315, -0.04902815, 2.083995, 0, 0.1607843, 1, 1,
0.3610276, -0.01350131, 2.29419, 0, 0.1529412, 1, 1,
0.3618142, 0.3339443, -0.3901515, 0, 0.1490196, 1, 1,
0.362828, -1.261883, 4.34163, 0, 0.1411765, 1, 1,
0.3640151, -0.3641201, 3.861385, 0, 0.1372549, 1, 1,
0.3692766, 1.48638, -0.4907257, 0, 0.1294118, 1, 1,
0.371443, 0.06804021, -0.02365537, 0, 0.1254902, 1, 1,
0.3751623, -1.458838, 2.197552, 0, 0.1176471, 1, 1,
0.3949441, -2.315272, 1.623117, 0, 0.1137255, 1, 1,
0.3989325, -0.7609133, 2.616536, 0, 0.1058824, 1, 1,
0.4013451, -0.4655161, 2.697379, 0, 0.09803922, 1, 1,
0.4043052, -1.375675, 1.361531, 0, 0.09411765, 1, 1,
0.4049101, -1.973435, 0.3751886, 0, 0.08627451, 1, 1,
0.4056615, -1.285728, 3.239126, 0, 0.08235294, 1, 1,
0.4079108, 0.2965038, 1.074257, 0, 0.07450981, 1, 1,
0.4079206, 0.5451303, -0.1410137, 0, 0.07058824, 1, 1,
0.4080617, -0.2009535, 2.266504, 0, 0.0627451, 1, 1,
0.4081194, 1.035152, 1.835177, 0, 0.05882353, 1, 1,
0.4093311, -0.9385168, 1.435165, 0, 0.05098039, 1, 1,
0.4093858, 0.05560916, 0.7319448, 0, 0.04705882, 1, 1,
0.4166253, -1.328122, 2.491062, 0, 0.03921569, 1, 1,
0.4173898, 1.114975, 0.6369052, 0, 0.03529412, 1, 1,
0.4190077, -0.03103621, -0.1566014, 0, 0.02745098, 1, 1,
0.4249623, 1.578377, -0.05304306, 0, 0.02352941, 1, 1,
0.4309624, -0.4863527, 2.812047, 0, 0.01568628, 1, 1,
0.4413092, 1.920781, 0.4550768, 0, 0.01176471, 1, 1,
0.4415371, -1.629951, 3.69583, 0, 0.003921569, 1, 1,
0.4418598, 1.365401, 2.053395, 0.003921569, 0, 1, 1,
0.4480008, -0.7181911, 4.119956, 0.007843138, 0, 1, 1,
0.4489163, 1.539894, -0.3073387, 0.01568628, 0, 1, 1,
0.449661, -0.1370397, 2.674241, 0.01960784, 0, 1, 1,
0.4508996, -0.2588625, -0.5752313, 0.02745098, 0, 1, 1,
0.4526551, -0.1488566, 1.307484, 0.03137255, 0, 1, 1,
0.4574748, 0.779219, 0.7294681, 0.03921569, 0, 1, 1,
0.4598138, -1.271995, 3.702035, 0.04313726, 0, 1, 1,
0.4605187, -0.4416457, 1.90817, 0.05098039, 0, 1, 1,
0.46351, 1.628924, -1.187201, 0.05490196, 0, 1, 1,
0.473361, -0.5589578, 2.799372, 0.0627451, 0, 1, 1,
0.4738679, 0.2578176, 0.07792185, 0.06666667, 0, 1, 1,
0.4748355, 0.3573079, 1.278818, 0.07450981, 0, 1, 1,
0.4754061, 0.6139991, 1.554237, 0.07843138, 0, 1, 1,
0.4814502, 1.246882, 0.3273513, 0.08627451, 0, 1, 1,
0.4825202, 0.6593392, 0.3555911, 0.09019608, 0, 1, 1,
0.4899945, 1.829723, 1.762848, 0.09803922, 0, 1, 1,
0.4930554, 2.39999, 0.1863184, 0.1058824, 0, 1, 1,
0.4947843, 0.3565287, -0.7789025, 0.1098039, 0, 1, 1,
0.5050669, 1.785822, 0.7678865, 0.1176471, 0, 1, 1,
0.5054067, 0.4190099, 1.446459, 0.1215686, 0, 1, 1,
0.5103198, 1.120155, 0.5792871, 0.1294118, 0, 1, 1,
0.5109293, -2.327529, 3.286869, 0.1333333, 0, 1, 1,
0.5119577, -0.1914577, 0.9905959, 0.1411765, 0, 1, 1,
0.5121302, -1.518821, 2.76021, 0.145098, 0, 1, 1,
0.513818, 0.1077642, 1.269294, 0.1529412, 0, 1, 1,
0.5149519, 0.8656136, 0.09372666, 0.1568628, 0, 1, 1,
0.5161431, 0.7964028, -0.1201873, 0.1647059, 0, 1, 1,
0.5178183, 0.8311545, 2.047923, 0.1686275, 0, 1, 1,
0.5187075, -1.409211, 3.898973, 0.1764706, 0, 1, 1,
0.5199689, -0.4758371, 1.973309, 0.1803922, 0, 1, 1,
0.5212327, -1.99916, 3.85264, 0.1882353, 0, 1, 1,
0.5220929, -1.313027, 1.235312, 0.1921569, 0, 1, 1,
0.5283304, -1.448256, 2.882461, 0.2, 0, 1, 1,
0.5292759, 0.914071, 0.621227, 0.2078431, 0, 1, 1,
0.5295154, 0.4469231, 0.4812142, 0.2117647, 0, 1, 1,
0.5307539, 1.358876, 0.469998, 0.2196078, 0, 1, 1,
0.5317193, -1.104645, 4.134862, 0.2235294, 0, 1, 1,
0.5358415, 1.244006, -0.8610585, 0.2313726, 0, 1, 1,
0.5362085, 1.036232, 0.8994545, 0.2352941, 0, 1, 1,
0.5384506, 0.3728758, 2.758571, 0.2431373, 0, 1, 1,
0.5416607, -1.300088, 2.219623, 0.2470588, 0, 1, 1,
0.5427136, -1.506824, 1.872199, 0.254902, 0, 1, 1,
0.546888, -0.06458616, 1.517168, 0.2588235, 0, 1, 1,
0.549209, -0.02372258, 0.1158751, 0.2666667, 0, 1, 1,
0.5605887, -0.1189902, 1.587196, 0.2705882, 0, 1, 1,
0.5631958, -0.7021008, 3.602055, 0.2784314, 0, 1, 1,
0.5673142, -1.189472, 3.371381, 0.282353, 0, 1, 1,
0.5675635, -0.5980273, 1.74365, 0.2901961, 0, 1, 1,
0.568173, -0.4141764, 1.630579, 0.2941177, 0, 1, 1,
0.570398, 0.2310635, 1.555035, 0.3019608, 0, 1, 1,
0.573285, -0.04527669, 0.8723703, 0.3098039, 0, 1, 1,
0.5734612, -1.094926, 4.921201, 0.3137255, 0, 1, 1,
0.574505, -0.02842253, 0.7849151, 0.3215686, 0, 1, 1,
0.5751833, 0.01368701, 0.8414041, 0.3254902, 0, 1, 1,
0.5791004, 0.6120003, 0.03701385, 0.3333333, 0, 1, 1,
0.5862161, -0.4508158, 1.344281, 0.3372549, 0, 1, 1,
0.589568, -0.2532175, 1.570061, 0.345098, 0, 1, 1,
0.5980833, -1.002131, 2.272086, 0.3490196, 0, 1, 1,
0.5996079, 1.611208, 0.1592542, 0.3568628, 0, 1, 1,
0.6022792, -1.138047, 4.312134, 0.3607843, 0, 1, 1,
0.6030545, 0.05502264, 1.518996, 0.3686275, 0, 1, 1,
0.6030985, -0.8484488, 2.158752, 0.372549, 0, 1, 1,
0.604861, 1.633756, -1.068184, 0.3803922, 0, 1, 1,
0.6067824, -0.4455034, 2.254165, 0.3843137, 0, 1, 1,
0.6070572, 1.417748, 0.3796269, 0.3921569, 0, 1, 1,
0.620286, 0.05012701, 0.5102463, 0.3960784, 0, 1, 1,
0.6214918, -1.562552, 2.232876, 0.4039216, 0, 1, 1,
0.6244338, 0.3592162, 1.348872, 0.4117647, 0, 1, 1,
0.6267275, 0.1337208, -0.2636624, 0.4156863, 0, 1, 1,
0.6272858, -1.383631, 4.336771, 0.4235294, 0, 1, 1,
0.6343678, 1.218774, -0.8305729, 0.427451, 0, 1, 1,
0.6351498, 0.3312364, 1.422392, 0.4352941, 0, 1, 1,
0.6359953, -0.1957799, 1.227977, 0.4392157, 0, 1, 1,
0.638364, -0.5916499, 1.537569, 0.4470588, 0, 1, 1,
0.6429282, 0.6394825, 0.7418098, 0.4509804, 0, 1, 1,
0.6434795, -0.06494285, 1.607606, 0.4588235, 0, 1, 1,
0.6439707, 0.2468242, 1.73255, 0.4627451, 0, 1, 1,
0.6495838, 1.057247, 1.648136, 0.4705882, 0, 1, 1,
0.6495927, 0.1148039, 0.917442, 0.4745098, 0, 1, 1,
0.6512628, -0.7406399, 1.953175, 0.4823529, 0, 1, 1,
0.6523132, -0.8688548, 2.650038, 0.4862745, 0, 1, 1,
0.6591463, 0.02781643, 1.299074, 0.4941176, 0, 1, 1,
0.663034, -0.5525138, 0.9235172, 0.5019608, 0, 1, 1,
0.6635349, -1.823727, 2.548444, 0.5058824, 0, 1, 1,
0.664512, 0.388112, -0.7818254, 0.5137255, 0, 1, 1,
0.665396, 1.615082, -2.088277, 0.5176471, 0, 1, 1,
0.6688303, 0.7375461, 1.005643, 0.5254902, 0, 1, 1,
0.6729076, 0.3053676, 1.228777, 0.5294118, 0, 1, 1,
0.6829883, -0.917129, 2.88066, 0.5372549, 0, 1, 1,
0.6850658, 0.4254611, 1.37504, 0.5411765, 0, 1, 1,
0.687021, -0.1771577, 0.731712, 0.5490196, 0, 1, 1,
0.6910012, 0.9340597, 0.7631823, 0.5529412, 0, 1, 1,
0.6976616, -0.5562341, 1.784937, 0.5607843, 0, 1, 1,
0.6981028, -0.03649858, 2.851505, 0.5647059, 0, 1, 1,
0.6996076, -1.643723, 3.127418, 0.572549, 0, 1, 1,
0.7039285, -2.231, 2.647384, 0.5764706, 0, 1, 1,
0.7064978, -0.3943963, 2.03365, 0.5843138, 0, 1, 1,
0.7076508, -0.4831466, 2.756099, 0.5882353, 0, 1, 1,
0.7088835, -0.7030591, 0.6668581, 0.5960785, 0, 1, 1,
0.7156725, -0.3465141, 2.324046, 0.6039216, 0, 1, 1,
0.7183422, -0.9986282, 0.5135519, 0.6078432, 0, 1, 1,
0.720093, 0.9501908, -0.1339413, 0.6156863, 0, 1, 1,
0.7240647, 0.6311237, 2.134529, 0.6196079, 0, 1, 1,
0.727334, 0.0600599, 2.542348, 0.627451, 0, 1, 1,
0.7349744, 1.734422, -0.7812101, 0.6313726, 0, 1, 1,
0.735963, -0.02286629, 1.031, 0.6392157, 0, 1, 1,
0.7363534, -0.3729975, 2.534038, 0.6431373, 0, 1, 1,
0.7425209, -0.6022238, 2.567527, 0.6509804, 0, 1, 1,
0.7453101, 1.480026, -0.2638267, 0.654902, 0, 1, 1,
0.7469914, -0.6118539, 1.973107, 0.6627451, 0, 1, 1,
0.7508669, -0.07674638, 1.799092, 0.6666667, 0, 1, 1,
0.7559697, 0.4215987, 0.7408211, 0.6745098, 0, 1, 1,
0.7601455, 1.290639, -0.9739758, 0.6784314, 0, 1, 1,
0.7609089, 0.6403214, 1.06787, 0.6862745, 0, 1, 1,
0.766893, 0.8581706, -0.1622725, 0.6901961, 0, 1, 1,
0.7695656, 1.003655, 1.492645, 0.6980392, 0, 1, 1,
0.7772868, 0.5921977, 0.9134672, 0.7058824, 0, 1, 1,
0.7814271, 2.897265, 1.001033, 0.7098039, 0, 1, 1,
0.7842595, -1.369796, 0.1023009, 0.7176471, 0, 1, 1,
0.7867516, 0.5457427, 0.7992579, 0.7215686, 0, 1, 1,
0.789959, -1.835563, 3.121489, 0.7294118, 0, 1, 1,
0.7902831, -0.7273421, 0.7228862, 0.7333333, 0, 1, 1,
0.7943268, -0.5166476, 2.020458, 0.7411765, 0, 1, 1,
0.7964999, -1.100849, 3.479552, 0.7450981, 0, 1, 1,
0.7972349, 0.3849562, 1.802253, 0.7529412, 0, 1, 1,
0.7981227, 0.8845695, 1.445473, 0.7568628, 0, 1, 1,
0.7981309, -0.3323758, 0.9942981, 0.7647059, 0, 1, 1,
0.7997802, -0.7290322, 3.446192, 0.7686275, 0, 1, 1,
0.8011635, -1.129089, 3.448277, 0.7764706, 0, 1, 1,
0.8028321, 0.6349996, 2.424349, 0.7803922, 0, 1, 1,
0.8041157, -0.06122974, 0.8065419, 0.7882353, 0, 1, 1,
0.8045746, 0.5823218, 2.487903, 0.7921569, 0, 1, 1,
0.8069824, 1.282357, 1.666596, 0.8, 0, 1, 1,
0.8131588, -0.3285901, 0.9899908, 0.8078431, 0, 1, 1,
0.8140048, -1.183725, 3.179319, 0.8117647, 0, 1, 1,
0.8209231, 1.777786, 0.4608981, 0.8196079, 0, 1, 1,
0.8225981, -0.3845712, 3.383492, 0.8235294, 0, 1, 1,
0.8289521, -0.1035396, 2.643187, 0.8313726, 0, 1, 1,
0.8302561, 0.2960417, 0.3545088, 0.8352941, 0, 1, 1,
0.8340069, -0.2029879, 1.281692, 0.8431373, 0, 1, 1,
0.8352047, 0.1384486, 1.681674, 0.8470588, 0, 1, 1,
0.8354903, -0.07961434, 2.494946, 0.854902, 0, 1, 1,
0.8360102, -0.7588388, 3.107724, 0.8588235, 0, 1, 1,
0.8477706, 2.041367, 1.276437, 0.8666667, 0, 1, 1,
0.855258, 0.5217995, 1.125401, 0.8705882, 0, 1, 1,
0.8578742, -0.1273263, 2.859547, 0.8784314, 0, 1, 1,
0.8595209, 1.11828, 1.556777, 0.8823529, 0, 1, 1,
0.8600606, 2.268219, 0.4650619, 0.8901961, 0, 1, 1,
0.862113, -0.02902266, 1.789735, 0.8941177, 0, 1, 1,
0.866213, 0.240398, 0.8103013, 0.9019608, 0, 1, 1,
0.8694484, -1.093234, 2.653967, 0.9098039, 0, 1, 1,
0.8702483, -0.8273112, 0.8831814, 0.9137255, 0, 1, 1,
0.8733119, -0.168463, 1.18049, 0.9215686, 0, 1, 1,
0.8767119, 0.8657769, 0.1244962, 0.9254902, 0, 1, 1,
0.8820139, 0.2742703, 3.444199, 0.9333333, 0, 1, 1,
0.8833498, 0.06841053, 1.227816, 0.9372549, 0, 1, 1,
0.8864225, 0.8697931, 0.347667, 0.945098, 0, 1, 1,
0.8917723, 1.468333, 0.915404, 0.9490196, 0, 1, 1,
0.8939241, 2.779026, -0.7206236, 0.9568627, 0, 1, 1,
0.8952074, -1.006059, 3.277299, 0.9607843, 0, 1, 1,
0.8961192, -0.6265319, 2.966712, 0.9686275, 0, 1, 1,
0.8968033, -0.5808817, 2.367822, 0.972549, 0, 1, 1,
0.8985237, -1.05971, 2.369885, 0.9803922, 0, 1, 1,
0.8994911, -1.68174, 3.308928, 0.9843137, 0, 1, 1,
0.901573, -0.2430578, 3.458568, 0.9921569, 0, 1, 1,
0.9084791, 1.088745, 1.510873, 0.9960784, 0, 1, 1,
0.9094816, 0.0294171, 2.940406, 1, 0, 0.9960784, 1,
0.9120967, 0.1722386, 0.8178381, 1, 0, 0.9882353, 1,
0.9122832, -0.710259, 0.5902843, 1, 0, 0.9843137, 1,
0.9125687, -1.028196, 3.242945, 1, 0, 0.9764706, 1,
0.913985, -1.210417, 2.535051, 1, 0, 0.972549, 1,
0.9156191, 0.7277835, 1.9302, 1, 0, 0.9647059, 1,
0.9180049, -0.8818229, 1.501048, 1, 0, 0.9607843, 1,
0.9214662, 1.119822, -0.5423795, 1, 0, 0.9529412, 1,
0.9282196, -0.4283036, 1.559443, 1, 0, 0.9490196, 1,
0.9369417, -0.6127585, 3.465365, 1, 0, 0.9411765, 1,
0.9412118, -0.8212262, 2.571945, 1, 0, 0.9372549, 1,
0.944889, 0.2534931, 1.713519, 1, 0, 0.9294118, 1,
0.945278, -0.4409307, 2.978408, 1, 0, 0.9254902, 1,
0.9535232, 1.108288, 2.234382, 1, 0, 0.9176471, 1,
0.954448, 0.3845877, 0.409582, 1, 0, 0.9137255, 1,
0.9621359, -1.370281, 2.908943, 1, 0, 0.9058824, 1,
0.968917, -1.035713, 0.240624, 1, 0, 0.9019608, 1,
0.977643, 0.2641717, 2.413662, 1, 0, 0.8941177, 1,
0.9870108, -1.553154, 3.061583, 1, 0, 0.8862745, 1,
1.003766, -1.76338, 0.4018236, 1, 0, 0.8823529, 1,
1.004449, 0.6631686, 1.852589, 1, 0, 0.8745098, 1,
1.016773, 1.004753, 0.229305, 1, 0, 0.8705882, 1,
1.019907, 2.179639, 1.500147, 1, 0, 0.8627451, 1,
1.021522, 1.450287, 1.978975, 1, 0, 0.8588235, 1,
1.027864, -0.7315955, 2.45219, 1, 0, 0.8509804, 1,
1.030869, -0.8848143, 1.010722, 1, 0, 0.8470588, 1,
1.033875, 0.151323, 1.873104, 1, 0, 0.8392157, 1,
1.033963, 0.2357737, 2.198443, 1, 0, 0.8352941, 1,
1.034366, 1.825192, 1.427246, 1, 0, 0.827451, 1,
1.03579, -0.1593322, 0.6911039, 1, 0, 0.8235294, 1,
1.042482, -1.688187, 1.890981, 1, 0, 0.8156863, 1,
1.043674, 0.08798613, 1.867953, 1, 0, 0.8117647, 1,
1.048233, 1.254104, 1.37883, 1, 0, 0.8039216, 1,
1.057483, -2.335047, 2.378218, 1, 0, 0.7960784, 1,
1.059124, 0.8495844, 0.9602515, 1, 0, 0.7921569, 1,
1.063718, 0.6513171, 0.5655258, 1, 0, 0.7843137, 1,
1.0784, -0.5650787, 2.339494, 1, 0, 0.7803922, 1,
1.083268, -0.4271746, 2.063564, 1, 0, 0.772549, 1,
1.083706, 1.128123, 1.82716, 1, 0, 0.7686275, 1,
1.085323, 0.6004006, 1.27294, 1, 0, 0.7607843, 1,
1.091496, 1.544522, 1.226816, 1, 0, 0.7568628, 1,
1.094752, 0.9115443, 2.187154, 1, 0, 0.7490196, 1,
1.09666, -2.579756, 2.503486, 1, 0, 0.7450981, 1,
1.102375, 1.760094, -0.5653013, 1, 0, 0.7372549, 1,
1.109416, -0.930428, 2.887838, 1, 0, 0.7333333, 1,
1.110866, 0.01069342, 1.627387, 1, 0, 0.7254902, 1,
1.129222, 0.01590838, 3.02147, 1, 0, 0.7215686, 1,
1.137093, 0.3917329, -0.06519686, 1, 0, 0.7137255, 1,
1.139624, -0.297021, 1.634864, 1, 0, 0.7098039, 1,
1.143224, -0.5747295, 2.94408, 1, 0, 0.7019608, 1,
1.155518, 1.315756, -2.442189, 1, 0, 0.6941177, 1,
1.155933, 0.425502, 0.2259267, 1, 0, 0.6901961, 1,
1.160831, 0.7587638, 2.859793, 1, 0, 0.682353, 1,
1.173828, 3.127081, -0.7749914, 1, 0, 0.6784314, 1,
1.176431, -0.6002131, 1.467303, 1, 0, 0.6705883, 1,
1.176908, -0.218745, 1.445154, 1, 0, 0.6666667, 1,
1.1809, -1.454814, 3.288502, 1, 0, 0.6588235, 1,
1.182989, 0.09249031, 0.1208824, 1, 0, 0.654902, 1,
1.184575, 0.5156853, 0.3870427, 1, 0, 0.6470588, 1,
1.19638, -0.2177946, 3.449701, 1, 0, 0.6431373, 1,
1.197703, -0.5361958, 0.2407671, 1, 0, 0.6352941, 1,
1.197981, -1.405779, 2.973116, 1, 0, 0.6313726, 1,
1.207483, 0.286166, 2.051381, 1, 0, 0.6235294, 1,
1.213606, 0.5612848, 0.5886483, 1, 0, 0.6196079, 1,
1.223039, 0.3637027, 1.7659, 1, 0, 0.6117647, 1,
1.22703, 0.1203015, 1.941358, 1, 0, 0.6078432, 1,
1.237279, 0.2298315, 0.3373418, 1, 0, 0.6, 1,
1.23842, -1.402586, 1.856131, 1, 0, 0.5921569, 1,
1.255915, -1.308336, 2.412436, 1, 0, 0.5882353, 1,
1.268652, -0.9602176, 1.503391, 1, 0, 0.5803922, 1,
1.27518, -0.1587391, 2.910798, 1, 0, 0.5764706, 1,
1.277797, 0.8588118, 0.661029, 1, 0, 0.5686275, 1,
1.281242, 1.315763, 0.5169743, 1, 0, 0.5647059, 1,
1.295771, -1.252516, 1.470865, 1, 0, 0.5568628, 1,
1.296773, 2.426566, -0.8179935, 1, 0, 0.5529412, 1,
1.299814, 0.8296531, 1.389417, 1, 0, 0.5450981, 1,
1.300545, 0.1404287, 0.2856798, 1, 0, 0.5411765, 1,
1.310438, 0.8655178, -0.1323081, 1, 0, 0.5333334, 1,
1.312576, 0.03447361, 2.594224, 1, 0, 0.5294118, 1,
1.31691, 0.4631891, 2.516562, 1, 0, 0.5215687, 1,
1.326519, 1.655254, 1.245012, 1, 0, 0.5176471, 1,
1.345842, 0.06274614, 0.7239169, 1, 0, 0.509804, 1,
1.346247, -0.5828682, 1.467755, 1, 0, 0.5058824, 1,
1.34698, -0.5737337, 3.196001, 1, 0, 0.4980392, 1,
1.347895, -0.141717, 2.598157, 1, 0, 0.4901961, 1,
1.359054, -0.5188861, 2.037297, 1, 0, 0.4862745, 1,
1.363478, -0.3544453, 0.3356082, 1, 0, 0.4784314, 1,
1.373986, 1.407993, 0.5474919, 1, 0, 0.4745098, 1,
1.37765, 1.373153, 0.6385303, 1, 0, 0.4666667, 1,
1.378357, 0.1149005, 3.755552, 1, 0, 0.4627451, 1,
1.39219, 2.377559, 2.734267, 1, 0, 0.454902, 1,
1.3931, 0.9673018, 0.1389081, 1, 0, 0.4509804, 1,
1.396605, 0.2411935, 2.817652, 1, 0, 0.4431373, 1,
1.397255, -1.805968, 3.067985, 1, 0, 0.4392157, 1,
1.403413, -1.259378, 3.708665, 1, 0, 0.4313726, 1,
1.415897, -0.6747987, 2.323713, 1, 0, 0.427451, 1,
1.421448, -0.4129648, 2.672109, 1, 0, 0.4196078, 1,
1.426803, 0.1473049, 1.264101, 1, 0, 0.4156863, 1,
1.447485, 0.04286603, 2.282423, 1, 0, 0.4078431, 1,
1.448142, 0.3700573, 2.600109, 1, 0, 0.4039216, 1,
1.453129, -0.2606238, 2.099417, 1, 0, 0.3960784, 1,
1.460999, -0.3117878, 0.7322285, 1, 0, 0.3882353, 1,
1.461527, -1.003574, 2.979919, 1, 0, 0.3843137, 1,
1.473915, -0.04663878, 1.165774, 1, 0, 0.3764706, 1,
1.481324, 0.1626081, 1.538536, 1, 0, 0.372549, 1,
1.494054, 0.878015, 0.9806939, 1, 0, 0.3647059, 1,
1.500337, 0.7598802, -0.3488905, 1, 0, 0.3607843, 1,
1.511005, 0.6355712, 0.5547478, 1, 0, 0.3529412, 1,
1.56255, 1.416598, 1.393719, 1, 0, 0.3490196, 1,
1.57738, 0.9640294, 0.7296259, 1, 0, 0.3411765, 1,
1.593131, -0.2662501, 1.192962, 1, 0, 0.3372549, 1,
1.599737, -0.3001762, 0.4810478, 1, 0, 0.3294118, 1,
1.611961, 2.384148, -0.7129149, 1, 0, 0.3254902, 1,
1.612184, -0.5109788, 1.241345, 1, 0, 0.3176471, 1,
1.612483, -0.3266315, 2.479641, 1, 0, 0.3137255, 1,
1.623555, 0.1699469, 2.182568, 1, 0, 0.3058824, 1,
1.632257, -0.05854824, 0.8827317, 1, 0, 0.2980392, 1,
1.646136, 0.5287979, 0.9437534, 1, 0, 0.2941177, 1,
1.648216, -0.1668546, 1.292666, 1, 0, 0.2862745, 1,
1.66435, 0.9026985, 0.5293593, 1, 0, 0.282353, 1,
1.677072, -0.9926385, 2.588202, 1, 0, 0.2745098, 1,
1.686093, 0.04838204, 0.5884548, 1, 0, 0.2705882, 1,
1.687308, -0.6496252, 4.039415, 1, 0, 0.2627451, 1,
1.694397, 0.5311202, 1.380947, 1, 0, 0.2588235, 1,
1.694595, -0.3755274, 1.556042, 1, 0, 0.2509804, 1,
1.717507, -0.496863, 3.800063, 1, 0, 0.2470588, 1,
1.722739, 0.7840551, 1.877597, 1, 0, 0.2392157, 1,
1.732857, -1.901107, 1.733454, 1, 0, 0.2352941, 1,
1.761066, 0.543999, 2.632358, 1, 0, 0.227451, 1,
1.770698, -0.2332657, 0.2737612, 1, 0, 0.2235294, 1,
1.771744, -0.169666, 2.170612, 1, 0, 0.2156863, 1,
1.773444, 0.6873379, 0.8455763, 1, 0, 0.2117647, 1,
1.793631, 1.296723, -0.8882562, 1, 0, 0.2039216, 1,
1.833201, -0.06043525, 0.8119467, 1, 0, 0.1960784, 1,
1.834528, -1.097125, 2.989601, 1, 0, 0.1921569, 1,
1.844069, 0.912793, 1.060758, 1, 0, 0.1843137, 1,
1.863438, -0.7715641, 2.292879, 1, 0, 0.1803922, 1,
1.876348, 1.752083, 2.140889, 1, 0, 0.172549, 1,
1.891623, -0.6857516, 2.439722, 1, 0, 0.1686275, 1,
1.899074, -1.263903, 1.401223, 1, 0, 0.1607843, 1,
1.903735, 1.663415, 0.5825375, 1, 0, 0.1568628, 1,
1.914445, -0.6417418, 1.977832, 1, 0, 0.1490196, 1,
1.934043, 0.8624677, 1.716563, 1, 0, 0.145098, 1,
1.945645, 1.40856, 2.790684, 1, 0, 0.1372549, 1,
1.950668, -0.2729642, 0.1339257, 1, 0, 0.1333333, 1,
1.951013, 0.9637976, 3.488269, 1, 0, 0.1254902, 1,
1.97064, -0.8349873, 2.231935, 1, 0, 0.1215686, 1,
2.004941, -0.1158354, 1.879278, 1, 0, 0.1137255, 1,
2.008374, 1.220006, -0.5705662, 1, 0, 0.1098039, 1,
2.062742, -0.02243409, -0.1112438, 1, 0, 0.1019608, 1,
2.064141, 0.8810539, 1.463724, 1, 0, 0.09411765, 1,
2.064166, -0.4755164, 1.713426, 1, 0, 0.09019608, 1,
2.115278, -0.03142267, 1.069292, 1, 0, 0.08235294, 1,
2.213707, 0.8590534, 1.73459, 1, 0, 0.07843138, 1,
2.291774, 1.073069, 0.2444197, 1, 0, 0.07058824, 1,
2.422179, 1.234286, 3.986562, 1, 0, 0.06666667, 1,
2.450755, 0.9943566, 0.3230729, 1, 0, 0.05882353, 1,
2.52451, 1.504996, 1.073376, 1, 0, 0.05490196, 1,
2.557779, 1.375934, -1.064991, 1, 0, 0.04705882, 1,
2.623703, -0.4788376, 2.300766, 1, 0, 0.04313726, 1,
2.736485, 0.6213703, 1.532949, 1, 0, 0.03529412, 1,
2.75079, -0.8016793, 1.340477, 1, 0, 0.03137255, 1,
2.793824, 0.2610245, 0.6025763, 1, 0, 0.02352941, 1,
2.902482, -0.8684872, -0.5299882, 1, 0, 0.01960784, 1,
3.092852, -0.1856886, 0.7195539, 1, 0, 0.01176471, 1,
3.393949, 0.9246875, 0.3047042, 1, 0, 0.007843138, 1
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
0.426946, -5.297208, -7.807998, 0, -0.5, 0.5, 0.5,
0.426946, -5.297208, -7.807998, 1, -0.5, 0.5, 0.5,
0.426946, -5.297208, -7.807998, 1, 1.5, 0.5, 0.5,
0.426946, -5.297208, -7.807998, 0, 1.5, 0.5, 0.5
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
-3.545871, -0.474582, -7.807998, 0, -0.5, 0.5, 0.5,
-3.545871, -0.474582, -7.807998, 1, -0.5, 0.5, 0.5,
-3.545871, -0.474582, -7.807998, 1, 1.5, 0.5, 0.5,
-3.545871, -0.474582, -7.807998, 0, 1.5, 0.5, 0.5
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
-3.545871, -5.297208, -0.3098285, 0, -0.5, 0.5, 0.5,
-3.545871, -5.297208, -0.3098285, 1, -0.5, 0.5, 0.5,
-3.545871, -5.297208, -0.3098285, 1, 1.5, 0.5, 0.5,
-3.545871, -5.297208, -0.3098285, 0, 1.5, 0.5, 0.5
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
-2, -4.184295, -6.077652,
3, -4.184295, -6.077652,
-2, -4.184295, -6.077652,
-2, -4.369781, -6.366043,
-1, -4.184295, -6.077652,
-1, -4.369781, -6.366043,
0, -4.184295, -6.077652,
0, -4.369781, -6.366043,
1, -4.184295, -6.077652,
1, -4.369781, -6.366043,
2, -4.184295, -6.077652,
2, -4.369781, -6.366043,
3, -4.184295, -6.077652,
3, -4.369781, -6.366043
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
-2, -4.740752, -6.942825, 0, -0.5, 0.5, 0.5,
-2, -4.740752, -6.942825, 1, -0.5, 0.5, 0.5,
-2, -4.740752, -6.942825, 1, 1.5, 0.5, 0.5,
-2, -4.740752, -6.942825, 0, 1.5, 0.5, 0.5,
-1, -4.740752, -6.942825, 0, -0.5, 0.5, 0.5,
-1, -4.740752, -6.942825, 1, -0.5, 0.5, 0.5,
-1, -4.740752, -6.942825, 1, 1.5, 0.5, 0.5,
-1, -4.740752, -6.942825, 0, 1.5, 0.5, 0.5,
0, -4.740752, -6.942825, 0, -0.5, 0.5, 0.5,
0, -4.740752, -6.942825, 1, -0.5, 0.5, 0.5,
0, -4.740752, -6.942825, 1, 1.5, 0.5, 0.5,
0, -4.740752, -6.942825, 0, 1.5, 0.5, 0.5,
1, -4.740752, -6.942825, 0, -0.5, 0.5, 0.5,
1, -4.740752, -6.942825, 1, -0.5, 0.5, 0.5,
1, -4.740752, -6.942825, 1, 1.5, 0.5, 0.5,
1, -4.740752, -6.942825, 0, 1.5, 0.5, 0.5,
2, -4.740752, -6.942825, 0, -0.5, 0.5, 0.5,
2, -4.740752, -6.942825, 1, -0.5, 0.5, 0.5,
2, -4.740752, -6.942825, 1, 1.5, 0.5, 0.5,
2, -4.740752, -6.942825, 0, 1.5, 0.5, 0.5,
3, -4.740752, -6.942825, 0, -0.5, 0.5, 0.5,
3, -4.740752, -6.942825, 1, -0.5, 0.5, 0.5,
3, -4.740752, -6.942825, 1, 1.5, 0.5, 0.5,
3, -4.740752, -6.942825, 0, 1.5, 0.5, 0.5
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
-2.629067, -4, -6.077652,
-2.629067, 2, -6.077652,
-2.629067, -4, -6.077652,
-2.781868, -4, -6.366043,
-2.629067, -2, -6.077652,
-2.781868, -2, -6.366043,
-2.629067, 0, -6.077652,
-2.781868, 0, -6.366043,
-2.629067, 2, -6.077652,
-2.781868, 2, -6.366043
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
"-4",
"-2",
"0",
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
-3.087469, -4, -6.942825, 0, -0.5, 0.5, 0.5,
-3.087469, -4, -6.942825, 1, -0.5, 0.5, 0.5,
-3.087469, -4, -6.942825, 1, 1.5, 0.5, 0.5,
-3.087469, -4, -6.942825, 0, 1.5, 0.5, 0.5,
-3.087469, -2, -6.942825, 0, -0.5, 0.5, 0.5,
-3.087469, -2, -6.942825, 1, -0.5, 0.5, 0.5,
-3.087469, -2, -6.942825, 1, 1.5, 0.5, 0.5,
-3.087469, -2, -6.942825, 0, 1.5, 0.5, 0.5,
-3.087469, 0, -6.942825, 0, -0.5, 0.5, 0.5,
-3.087469, 0, -6.942825, 1, -0.5, 0.5, 0.5,
-3.087469, 0, -6.942825, 1, 1.5, 0.5, 0.5,
-3.087469, 0, -6.942825, 0, 1.5, 0.5, 0.5,
-3.087469, 2, -6.942825, 0, -0.5, 0.5, 0.5,
-3.087469, 2, -6.942825, 1, -0.5, 0.5, 0.5,
-3.087469, 2, -6.942825, 1, 1.5, 0.5, 0.5,
-3.087469, 2, -6.942825, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<4; i++) 
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
12, 13, 14, 12, 14, 15
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
-2.629067, -4.184295, -4,
-2.629067, -4.184295, 4,
-2.629067, -4.184295, -4,
-2.781868, -4.369781, -4,
-2.629067, -4.184295, -2,
-2.781868, -4.369781, -2,
-2.629067, -4.184295, 0,
-2.781868, -4.369781, 0,
-2.629067, -4.184295, 2,
-2.781868, -4.369781, 2,
-2.629067, -4.184295, 4,
-2.781868, -4.369781, 4
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
-3.087469, -4.740752, -4, 0, -0.5, 0.5, 0.5,
-3.087469, -4.740752, -4, 1, -0.5, 0.5, 0.5,
-3.087469, -4.740752, -4, 1, 1.5, 0.5, 0.5,
-3.087469, -4.740752, -4, 0, 1.5, 0.5, 0.5,
-3.087469, -4.740752, -2, 0, -0.5, 0.5, 0.5,
-3.087469, -4.740752, -2, 1, -0.5, 0.5, 0.5,
-3.087469, -4.740752, -2, 1, 1.5, 0.5, 0.5,
-3.087469, -4.740752, -2, 0, 1.5, 0.5, 0.5,
-3.087469, -4.740752, 0, 0, -0.5, 0.5, 0.5,
-3.087469, -4.740752, 0, 1, -0.5, 0.5, 0.5,
-3.087469, -4.740752, 0, 1, 1.5, 0.5, 0.5,
-3.087469, -4.740752, 0, 0, 1.5, 0.5, 0.5,
-3.087469, -4.740752, 2, 0, -0.5, 0.5, 0.5,
-3.087469, -4.740752, 2, 1, -0.5, 0.5, 0.5,
-3.087469, -4.740752, 2, 1, 1.5, 0.5, 0.5,
-3.087469, -4.740752, 2, 0, 1.5, 0.5, 0.5,
-3.087469, -4.740752, 4, 0, -0.5, 0.5, 0.5,
-3.087469, -4.740752, 4, 1, -0.5, 0.5, 0.5,
-3.087469, -4.740752, 4, 1, 1.5, 0.5, 0.5,
-3.087469, -4.740752, 4, 0, 1.5, 0.5, 0.5
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
-2.629067, -4.184295, -6.077652,
-2.629067, 3.235131, -6.077652,
-2.629067, -4.184295, 5.457994,
-2.629067, 3.235131, 5.457994,
-2.629067, -4.184295, -6.077652,
-2.629067, -4.184295, 5.457994,
-2.629067, 3.235131, -6.077652,
-2.629067, 3.235131, 5.457994,
-2.629067, -4.184295, -6.077652,
3.482959, -4.184295, -6.077652,
-2.629067, -4.184295, 5.457994,
3.482959, -4.184295, 5.457994,
-2.629067, 3.235131, -6.077652,
3.482959, 3.235131, -6.077652,
-2.629067, 3.235131, 5.457994,
3.482959, 3.235131, 5.457994,
3.482959, -4.184295, -6.077652,
3.482959, 3.235131, -6.077652,
3.482959, -4.184295, 5.457994,
3.482959, 3.235131, 5.457994,
3.482959, -4.184295, -6.077652,
3.482959, -4.184295, 5.457994,
3.482959, 3.235131, -6.077652,
3.482959, 3.235131, 5.457994
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
var radius = 8.018174;
var distance = 35.67376;
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
mvMatrix.translate( -0.426946, 0.474582, 0.3098285 );
mvMatrix.scale( 1.418418, 1.168474, 0.751532 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.67376);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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
pyraclofos<-read.table("pyraclofos.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-pyraclofos$V2
```

```
## Error in eval(expr, envir, enclos): object 'pyraclofos' not found
```

```r
y<-pyraclofos$V3
```

```
## Error in eval(expr, envir, enclos): object 'pyraclofos' not found
```

```r
z<-pyraclofos$V4
```

```
## Error in eval(expr, envir, enclos): object 'pyraclofos' not found
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
-2.540057, -0.724812, -1.763046, 0, 0, 1, 1, 1,
-2.515603, 0.2701915, -1.847285, 1, 0, 0, 1, 1,
-2.409534, -1.966821, -1.644202, 1, 0, 0, 1, 1,
-2.379467, 1.893463, -1.835716, 1, 0, 0, 1, 1,
-2.357634, -0.7717586, -1.218442, 1, 0, 0, 1, 1,
-2.305186, -0.6328655, -2.530194, 1, 0, 0, 1, 1,
-2.30364, 0.5257805, -2.073129, 0, 0, 0, 1, 1,
-2.263012, 1.13852, -0.4661007, 0, 0, 0, 1, 1,
-2.24315, -0.9591673, -2.171799, 0, 0, 0, 1, 1,
-2.219648, 1.158837, -2.024549, 0, 0, 0, 1, 1,
-2.216378, -0.8738709, -0.4487764, 0, 0, 0, 1, 1,
-2.162481, 0.7965862, -0.8020149, 0, 0, 0, 1, 1,
-2.144388, -0.9517728, -2.247463, 0, 0, 0, 1, 1,
-2.129265, 0.2630881, -1.602063, 1, 1, 1, 1, 1,
-2.121889, -2.491753, -2.310417, 1, 1, 1, 1, 1,
-2.078217, -1.859137, -3.849626, 1, 1, 1, 1, 1,
-2.04951, 0.6010148, -2.9805, 1, 1, 1, 1, 1,
-2.023021, 1.755781, -0.4683956, 1, 1, 1, 1, 1,
-2.004986, -0.2401646, -2.420755, 1, 1, 1, 1, 1,
-1.994424, -0.3331347, -2.177295, 1, 1, 1, 1, 1,
-1.966564, 0.27417, -0.8899117, 1, 1, 1, 1, 1,
-1.96343, -0.9094182, -2.691782, 1, 1, 1, 1, 1,
-1.955325, 0.6000935, -0.6087968, 1, 1, 1, 1, 1,
-1.941881, -0.272205, -1.051952, 1, 1, 1, 1, 1,
-1.939384, -1.408885, -1.616174, 1, 1, 1, 1, 1,
-1.938156, -1.351448, -2.442492, 1, 1, 1, 1, 1,
-1.919655, -0.4130548, -2.2528, 1, 1, 1, 1, 1,
-1.919464, -1.129741, -1.889197, 1, 1, 1, 1, 1,
-1.904498, -0.3061408, -0.5783935, 0, 0, 1, 1, 1,
-1.885486, -1.05903, -2.81501, 1, 0, 0, 1, 1,
-1.880797, 1.591062, -0.5103766, 1, 0, 0, 1, 1,
-1.869354, 2.206888, -0.1227018, 1, 0, 0, 1, 1,
-1.856225, -0.4317485, -1.666809, 1, 0, 0, 1, 1,
-1.848817, 1.287354, -2.003247, 1, 0, 0, 1, 1,
-1.833487, -1.027736, -2.428505, 0, 0, 0, 1, 1,
-1.808947, 0.5960063, -2.516009, 0, 0, 0, 1, 1,
-1.775406, 0.3455202, -2.270225, 0, 0, 0, 1, 1,
-1.757579, 1.499446, -0.5070759, 0, 0, 0, 1, 1,
-1.740742, 1.995516, -0.4549891, 0, 0, 0, 1, 1,
-1.70961, -0.3262179, -1.394143, 0, 0, 0, 1, 1,
-1.706601, -0.8038904, -3.147782, 0, 0, 0, 1, 1,
-1.699638, -0.6825883, -1.680693, 1, 1, 1, 1, 1,
-1.697117, -1.345116, -1.815312, 1, 1, 1, 1, 1,
-1.687707, -0.1672786, -2.166648, 1, 1, 1, 1, 1,
-1.67779, 0.1994979, -1.844865, 1, 1, 1, 1, 1,
-1.675281, 0.4786452, -0.8819715, 1, 1, 1, 1, 1,
-1.658981, 0.2730473, -1.070532, 1, 1, 1, 1, 1,
-1.649749, -1.09051, -1.784809, 1, 1, 1, 1, 1,
-1.643115, 1.329861, 0.5831184, 1, 1, 1, 1, 1,
-1.635508, 0.2549855, -1.612115, 1, 1, 1, 1, 1,
-1.626758, -0.1732992, -2.135305, 1, 1, 1, 1, 1,
-1.623399, -0.8032207, -1.796386, 1, 1, 1, 1, 1,
-1.617269, 0.6100118, -1.006392, 1, 1, 1, 1, 1,
-1.61708, 0.803494, -0.438372, 1, 1, 1, 1, 1,
-1.616016, 0.977015, -1.853164, 1, 1, 1, 1, 1,
-1.60713, 0.6912495, -2.308988, 1, 1, 1, 1, 1,
-1.6032, -0.1339967, -3.937873, 0, 0, 1, 1, 1,
-1.593963, -0.7482726, -3.158117, 1, 0, 0, 1, 1,
-1.586342, 2.052086, -2.019866, 1, 0, 0, 1, 1,
-1.581216, 1.096856, -0.1925929, 1, 0, 0, 1, 1,
-1.579237, -0.920374, -0.2726081, 1, 0, 0, 1, 1,
-1.564071, 0.7014772, -0.1624845, 1, 0, 0, 1, 1,
-1.555966, 1.224527, -1.004051, 0, 0, 0, 1, 1,
-1.54842, 0.2644548, -1.393079, 0, 0, 0, 1, 1,
-1.544919, -1.876165, -2.24101, 0, 0, 0, 1, 1,
-1.537671, -0.05761351, -2.236154, 0, 0, 0, 1, 1,
-1.530046, 1.293285, -2.006078, 0, 0, 0, 1, 1,
-1.512202, -0.4701993, -2.202302, 0, 0, 0, 1, 1,
-1.511995, 1.143687, -1.306513, 0, 0, 0, 1, 1,
-1.484298, 1.068823, -0.9160678, 1, 1, 1, 1, 1,
-1.471464, 0.540093, -0.2449985, 1, 1, 1, 1, 1,
-1.470236, 0.3564805, -3.088546, 1, 1, 1, 1, 1,
-1.468413, -0.6766747, -1.897685, 1, 1, 1, 1, 1,
-1.468293, 0.9135792, -1.398244, 1, 1, 1, 1, 1,
-1.454983, 0.6690263, 0.02273548, 1, 1, 1, 1, 1,
-1.422408, 1.332464, 0.3916422, 1, 1, 1, 1, 1,
-1.421558, 0.9605385, 0.5169995, 1, 1, 1, 1, 1,
-1.416391, -0.9230285, -2.390319, 1, 1, 1, 1, 1,
-1.412681, -2.270602, -1.751049, 1, 1, 1, 1, 1,
-1.406383, -1.572793, -1.35635, 1, 1, 1, 1, 1,
-1.397822, -0.5883992, -3.363307, 1, 1, 1, 1, 1,
-1.395721, -0.6262317, -2.020925, 1, 1, 1, 1, 1,
-1.385068, 1.246499, -0.9853982, 1, 1, 1, 1, 1,
-1.380858, -0.7683783, -0.8579967, 1, 1, 1, 1, 1,
-1.369106, -0.6115242, -0.757362, 0, 0, 1, 1, 1,
-1.367494, -1.140638, -1.344866, 1, 0, 0, 1, 1,
-1.363364, -0.5312146, -2.166479, 1, 0, 0, 1, 1,
-1.361523, -1.095974, -1.058915, 1, 0, 0, 1, 1,
-1.3547, -0.1758407, -2.159069, 1, 0, 0, 1, 1,
-1.354002, -2.06216, -2.670348, 1, 0, 0, 1, 1,
-1.342042, 0.1504609, -0.54013, 0, 0, 0, 1, 1,
-1.333908, -0.5921327, -3.074293, 0, 0, 0, 1, 1,
-1.331855, -0.6368568, -1.006124, 0, 0, 0, 1, 1,
-1.329603, -2.686404, -2.435717, 0, 0, 0, 1, 1,
-1.321959, -0.9575503, -3.940401, 0, 0, 0, 1, 1,
-1.31673, 0.5576685, -0.8216043, 0, 0, 0, 1, 1,
-1.306598, -0.1490916, -1.438318, 0, 0, 0, 1, 1,
-1.303947, -0.5934652, -0.825273, 1, 1, 1, 1, 1,
-1.301439, -0.9020913, -0.794565, 1, 1, 1, 1, 1,
-1.301008, 1.274309, -2.220925, 1, 1, 1, 1, 1,
-1.300216, -0.4809708, -1.186937, 1, 1, 1, 1, 1,
-1.299551, 0.3685743, -2.361672, 1, 1, 1, 1, 1,
-1.29496, -0.609796, -3.39089, 1, 1, 1, 1, 1,
-1.280021, 0.8938821, -2.007112, 1, 1, 1, 1, 1,
-1.271122, -0.9476025, -2.988681, 1, 1, 1, 1, 1,
-1.2411, -2.236351, -1.91544, 1, 1, 1, 1, 1,
-1.240505, -0.731203, -1.795099, 1, 1, 1, 1, 1,
-1.240036, -1.671656, -2.560035, 1, 1, 1, 1, 1,
-1.230016, 0.113176, -0.373863, 1, 1, 1, 1, 1,
-1.225737, 0.5521619, -2.658247, 1, 1, 1, 1, 1,
-1.219652, 0.1787315, -2.28613, 1, 1, 1, 1, 1,
-1.216975, -0.4728223, -3.25403, 1, 1, 1, 1, 1,
-1.215984, -0.4198619, -2.719656, 0, 0, 1, 1, 1,
-1.202781, 1.090769, -0.9069923, 1, 0, 0, 1, 1,
-1.19595, 1.344694, -1.34464, 1, 0, 0, 1, 1,
-1.189371, -0.7891063, -2.306681, 1, 0, 0, 1, 1,
-1.189347, 1.478227, -0.0254664, 1, 0, 0, 1, 1,
-1.172598, 0.6586932, -1.495018, 1, 0, 0, 1, 1,
-1.171309, -1.345201, -3.155528, 0, 0, 0, 1, 1,
-1.168665, 0.6653385, -1.257692, 0, 0, 0, 1, 1,
-1.162691, -0.7399929, -2.397009, 0, 0, 0, 1, 1,
-1.153008, 0.2223145, -1.572739, 0, 0, 0, 1, 1,
-1.152557, -0.05999329, -1.356271, 0, 0, 0, 1, 1,
-1.127531, -0.003538883, -1.877286, 0, 0, 0, 1, 1,
-1.124717, -0.5339144, -0.9483666, 0, 0, 0, 1, 1,
-1.122471, 0.4183335, -1.143475, 1, 1, 1, 1, 1,
-1.119108, 0.0320932, -2.407417, 1, 1, 1, 1, 1,
-1.118141, -0.1151603, -2.567993, 1, 1, 1, 1, 1,
-1.114249, 0.9577939, -2.20331, 1, 1, 1, 1, 1,
-1.11376, 1.442723, -1.609765, 1, 1, 1, 1, 1,
-1.109799, 0.7900273, -1.427814, 1, 1, 1, 1, 1,
-1.103267, 1.405068, 0.139159, 1, 1, 1, 1, 1,
-1.086225, 0.3060791, -2.587736, 1, 1, 1, 1, 1,
-1.075949, -0.307791, -0.6036986, 1, 1, 1, 1, 1,
-1.072182, 0.5818313, 0.1596674, 1, 1, 1, 1, 1,
-1.066912, -0.01924129, -1.658078, 1, 1, 1, 1, 1,
-1.065217, 0.6306295, -0.7308695, 1, 1, 1, 1, 1,
-1.065108, -1.196474, -1.54556, 1, 1, 1, 1, 1,
-1.056461, -1.983579, -2.703395, 1, 1, 1, 1, 1,
-1.056012, 0.6690632, -1.023677, 1, 1, 1, 1, 1,
-1.052647, -1.285761, -2.193599, 0, 0, 1, 1, 1,
-1.04836, 0.07628948, -1.570839, 1, 0, 0, 1, 1,
-1.043065, 1.479236, -0.5744004, 1, 0, 0, 1, 1,
-1.039229, 0.2050714, -1.020307, 1, 0, 0, 1, 1,
-1.031084, 0.6486491, -1.318507, 1, 0, 0, 1, 1,
-1.026382, -1.105389, -1.91798, 1, 0, 0, 1, 1,
-1.020629, -1.136544, -0.9558751, 0, 0, 0, 1, 1,
-1.014522, 1.17212, -2.746724, 0, 0, 0, 1, 1,
-1.011239, -0.6601901, -1.918495, 0, 0, 0, 1, 1,
-1.006783, -0.2121157, -1.207274, 0, 0, 0, 1, 1,
-1.000226, -0.7431771, -2.228739, 0, 0, 0, 1, 1,
-0.9973444, 1.797816, -1.886203, 0, 0, 0, 1, 1,
-0.9939811, 0.716333, -2.391378, 0, 0, 0, 1, 1,
-0.988894, 0.8576799, -1.617685, 1, 1, 1, 1, 1,
-0.9797142, 0.3581843, 0.3600159, 1, 1, 1, 1, 1,
-0.9759584, -1.62891, -1.017667, 1, 1, 1, 1, 1,
-0.9752594, 0.1022221, -2.379491, 1, 1, 1, 1, 1,
-0.9721807, -0.3654661, -3.254729, 1, 1, 1, 1, 1,
-0.971242, -0.9624897, -3.352186, 1, 1, 1, 1, 1,
-0.966913, 0.9687528, -0.4807042, 1, 1, 1, 1, 1,
-0.9616883, 0.55609, -0.2002345, 1, 1, 1, 1, 1,
-0.9478384, -1.156095, -1.008208, 1, 1, 1, 1, 1,
-0.9447911, -0.9596509, -2.679964, 1, 1, 1, 1, 1,
-0.9379609, -0.1511385, -1.63946, 1, 1, 1, 1, 1,
-0.92625, 2.365986, -0.7501665, 1, 1, 1, 1, 1,
-0.9227258, -0.2212279, -0.7489427, 1, 1, 1, 1, 1,
-0.9155546, -0.3979329, -1.482149, 1, 1, 1, 1, 1,
-0.9115202, 1.385238, 0.531922, 1, 1, 1, 1, 1,
-0.9105166, -1.607095, -1.655759, 0, 0, 1, 1, 1,
-0.905968, 0.3105947, -1.27311, 1, 0, 0, 1, 1,
-0.9057947, 2.044648, 0.02905038, 1, 0, 0, 1, 1,
-0.9012639, 1.5747, -0.2499621, 1, 0, 0, 1, 1,
-0.8994243, 1.122258, -2.448319, 1, 0, 0, 1, 1,
-0.8934873, 0.5141491, -0.2749841, 1, 0, 0, 1, 1,
-0.8874875, -0.326983, -2.924844, 0, 0, 0, 1, 1,
-0.8859643, -0.5703968, -1.702219, 0, 0, 0, 1, 1,
-0.8853943, 1.446525, 0.4416263, 0, 0, 0, 1, 1,
-0.8768945, 2.238396, 0.9889863, 0, 0, 0, 1, 1,
-0.8753983, -0.7914885, -2.097666, 0, 0, 0, 1, 1,
-0.8748597, -1.347723, -0.8863613, 0, 0, 0, 1, 1,
-0.8699738, 0.8928195, -2.083074, 0, 0, 0, 1, 1,
-0.8677339, 1.836717, -1.493008, 1, 1, 1, 1, 1,
-0.866672, -2.033633, -3.449883, 1, 1, 1, 1, 1,
-0.8649652, -0.7833179, -3.812154, 1, 1, 1, 1, 1,
-0.8645201, -1.71333, -2.402451, 1, 1, 1, 1, 1,
-0.8613529, 0.7096941, -0.2532493, 1, 1, 1, 1, 1,
-0.8596469, 0.727356, -0.520049, 1, 1, 1, 1, 1,
-0.8574377, -0.7413751, -2.629976, 1, 1, 1, 1, 1,
-0.8536512, 0.7544954, -0.9489968, 1, 1, 1, 1, 1,
-0.8536512, -0.2053479, -3.371713, 1, 1, 1, 1, 1,
-0.8534282, 0.7769396, -0.3653013, 1, 1, 1, 1, 1,
-0.8446645, 0.05245898, -1.498841, 1, 1, 1, 1, 1,
-0.8407086, 0.8510779, -1.485316, 1, 1, 1, 1, 1,
-0.8376423, -0.6138459, -3.772979, 1, 1, 1, 1, 1,
-0.8237859, -1.749687, -3.837454, 1, 1, 1, 1, 1,
-0.8210651, -0.9202781, -1.487885, 1, 1, 1, 1, 1,
-0.8162764, -0.3301713, -2.403413, 0, 0, 1, 1, 1,
-0.8126825, 0.3119778, 0.8406481, 1, 0, 0, 1, 1,
-0.8112075, 2.50492, 0.7657866, 1, 0, 0, 1, 1,
-0.8041461, -1.743428, -2.056745, 1, 0, 0, 1, 1,
-0.801572, -1.301447, -2.991981, 1, 0, 0, 1, 1,
-0.7957976, -0.6990899, -3.117916, 1, 0, 0, 1, 1,
-0.7935064, 1.557502, 0.07607993, 0, 0, 0, 1, 1,
-0.7920048, 0.3497716, 0.2718425, 0, 0, 0, 1, 1,
-0.7907218, 0.522374, -1.560768, 0, 0, 0, 1, 1,
-0.7901133, 0.2705058, 0.1325915, 0, 0, 0, 1, 1,
-0.7830307, -0.4993398, -2.096024, 0, 0, 0, 1, 1,
-0.7815487, -0.8047859, -3.074338, 0, 0, 0, 1, 1,
-0.7790762, 0.3221434, -2.182199, 0, 0, 0, 1, 1,
-0.7781979, -0.8721566, -3.03432, 1, 1, 1, 1, 1,
-0.7775242, -0.537011, -1.707823, 1, 1, 1, 1, 1,
-0.7751534, -0.8997346, -2.685896, 1, 1, 1, 1, 1,
-0.7750436, 0.9493731, -0.9389025, 1, 1, 1, 1, 1,
-0.7725647, -0.1487613, -2.039477, 1, 1, 1, 1, 1,
-0.7712158, 2.48193, -0.3348519, 1, 1, 1, 1, 1,
-0.76069, 1.018578, 2.032753, 1, 1, 1, 1, 1,
-0.7603672, -0.8854048, -1.312881, 1, 1, 1, 1, 1,
-0.7565246, -0.2234509, -2.557626, 1, 1, 1, 1, 1,
-0.755885, 1.19362, 0.550064, 1, 1, 1, 1, 1,
-0.7361234, 0.4568632, 0.05464063, 1, 1, 1, 1, 1,
-0.7347882, 0.6271638, 0.764003, 1, 1, 1, 1, 1,
-0.7277594, 1.400223, -1.99566, 1, 1, 1, 1, 1,
-0.7246878, 0.5455963, -0.384192, 1, 1, 1, 1, 1,
-0.7242596, -0.6643691, -1.827208, 1, 1, 1, 1, 1,
-0.7185443, 1.219015, -1.35882, 0, 0, 1, 1, 1,
-0.7184862, -0.4873692, -0.609664, 1, 0, 0, 1, 1,
-0.7130764, 0.5693749, -2.45005, 1, 0, 0, 1, 1,
-0.7121341, 0.8273523, -1.146916, 1, 0, 0, 1, 1,
-0.7110302, -0.9281868, -2.033083, 1, 0, 0, 1, 1,
-0.7077883, 1.21844, -0.520047, 1, 0, 0, 1, 1,
-0.6992828, 1.556708, 0.5408301, 0, 0, 0, 1, 1,
-0.698272, -1.463381, -3.585331, 0, 0, 0, 1, 1,
-0.6943321, -0.01841021, -2.542616, 0, 0, 0, 1, 1,
-0.6879177, -0.5855228, -3.267087, 0, 0, 0, 1, 1,
-0.6846099, 0.5939113, -0.5217381, 0, 0, 0, 1, 1,
-0.6831892, 0.5539895, -0.2620657, 0, 0, 0, 1, 1,
-0.6797916, -0.8319995, -3.291329, 0, 0, 0, 1, 1,
-0.6786024, 0.6438559, -0.1312325, 1, 1, 1, 1, 1,
-0.6780038, -0.7548302, -1.123918, 1, 1, 1, 1, 1,
-0.6696062, -1.148656, -2.62934, 1, 1, 1, 1, 1,
-0.6683508, 0.2287278, -2.667136, 1, 1, 1, 1, 1,
-0.6659079, 1.447888, -1.043105, 1, 1, 1, 1, 1,
-0.662704, 1.280409, -0.08984843, 1, 1, 1, 1, 1,
-0.660972, 1.61746, 0.1253871, 1, 1, 1, 1, 1,
-0.6602644, -0.5950114, -0.9046304, 1, 1, 1, 1, 1,
-0.6600729, 0.1041111, -2.58197, 1, 1, 1, 1, 1,
-0.6578367, 1.239242, -1.86867, 1, 1, 1, 1, 1,
-0.6523232, 0.05231242, -0.7101059, 1, 1, 1, 1, 1,
-0.6520811, 1.147397, 0.08195987, 1, 1, 1, 1, 1,
-0.6494446, -0.4590777, -4.42025, 1, 1, 1, 1, 1,
-0.6482557, 2.144272, 0.01373263, 1, 1, 1, 1, 1,
-0.6477746, -1.071516, -1.622334, 1, 1, 1, 1, 1,
-0.6474296, -1.531304, -3.087727, 0, 0, 1, 1, 1,
-0.6362599, 0.4886017, 0.1917222, 1, 0, 0, 1, 1,
-0.6356624, -0.659148, -1.779296, 1, 0, 0, 1, 1,
-0.6348385, -0.3034071, -2.891631, 1, 0, 0, 1, 1,
-0.6347458, 0.2622691, -0.6231012, 1, 0, 0, 1, 1,
-0.6339957, 0.2027935, -0.9990202, 1, 0, 0, 1, 1,
-0.6305578, 0.9023442, -1.07844, 0, 0, 0, 1, 1,
-0.6295661, -0.2243898, -1.518639, 0, 0, 0, 1, 1,
-0.625431, -1.056409, -4.201716, 0, 0, 0, 1, 1,
-0.6202431, -0.7714725, -2.424094, 0, 0, 0, 1, 1,
-0.6184164, 0.7466719, -2.348659, 0, 0, 0, 1, 1,
-0.6169285, -1.4599, -2.767417, 0, 0, 0, 1, 1,
-0.6167878, -1.254499, -1.629387, 0, 0, 0, 1, 1,
-0.6143596, -1.121353, -3.079038, 1, 1, 1, 1, 1,
-0.6140715, -0.3684114, -1.525766, 1, 1, 1, 1, 1,
-0.6102564, -0.03799996, -1.431171, 1, 1, 1, 1, 1,
-0.6062288, -0.6253845, -2.518242, 1, 1, 1, 1, 1,
-0.6040909, 0.04694821, -1.155163, 1, 1, 1, 1, 1,
-0.6017777, 0.5786245, -0.06513303, 1, 1, 1, 1, 1,
-0.6011774, 0.384579, -1.582354, 1, 1, 1, 1, 1,
-0.6006842, -0.8469234, -3.542003, 1, 1, 1, 1, 1,
-0.598886, -1.414293, -3.150964, 1, 1, 1, 1, 1,
-0.5934627, -0.9694504, -3.429993, 1, 1, 1, 1, 1,
-0.5925428, -0.3795401, -3.218862, 1, 1, 1, 1, 1,
-0.588066, 0.04360483, -1.219255, 1, 1, 1, 1, 1,
-0.5874472, 0.3004591, -1.991068, 1, 1, 1, 1, 1,
-0.5843669, 0.1215478, -0.5892363, 1, 1, 1, 1, 1,
-0.5835849, -0.3261212, -1.962343, 1, 1, 1, 1, 1,
-0.5794783, 1.283423, 0.2313842, 0, 0, 1, 1, 1,
-0.5786459, 0.5649068, -0.315965, 1, 0, 0, 1, 1,
-0.5784757, -0.5748851, -2.051834, 1, 0, 0, 1, 1,
-0.5766504, 0.3517425, -1.535072, 1, 0, 0, 1, 1,
-0.5617108, -0.184083, -2.616638, 1, 0, 0, 1, 1,
-0.5614359, -0.9197762, -3.095592, 1, 0, 0, 1, 1,
-0.5553616, -0.8618564, -3.208938, 0, 0, 0, 1, 1,
-0.5529425, 2.29365, -0.250747, 0, 0, 0, 1, 1,
-0.550489, -1.039601, -1.918005, 0, 0, 0, 1, 1,
-0.5428124, 0.07025494, -0.800084, 0, 0, 0, 1, 1,
-0.5422605, -0.1119534, -1.293028, 0, 0, 0, 1, 1,
-0.5401779, -0.07753323, -2.206827, 0, 0, 0, 1, 1,
-0.5361167, 0.3921082, -0.4170371, 0, 0, 0, 1, 1,
-0.5316995, 0.1447244, -0.02270404, 1, 1, 1, 1, 1,
-0.5310503, 0.2684676, -0.02409179, 1, 1, 1, 1, 1,
-0.5204146, -1.349694, -1.369206, 1, 1, 1, 1, 1,
-0.5195027, 2.06842, 0.7820253, 1, 1, 1, 1, 1,
-0.5172671, -0.3258867, -1.328416, 1, 1, 1, 1, 1,
-0.5160637, 1.394057, 0.02339149, 1, 1, 1, 1, 1,
-0.5095856, -0.3547932, -1.414353, 1, 1, 1, 1, 1,
-0.5095187, 2.12801, 1.483981, 1, 1, 1, 1, 1,
-0.5084974, 0.4134974, -0.1978224, 1, 1, 1, 1, 1,
-0.5064528, 0.9179254, 1.118144, 1, 1, 1, 1, 1,
-0.5045837, -0.8342708, -1.719742, 1, 1, 1, 1, 1,
-0.5023844, -0.3980643, -1.94365, 1, 1, 1, 1, 1,
-0.5000136, 1.399596, -1.630616, 1, 1, 1, 1, 1,
-0.4972196, 1.493468, 0.2369194, 1, 1, 1, 1, 1,
-0.4907854, 0.6158085, -0.338855, 1, 1, 1, 1, 1,
-0.4870807, -1.119248, -1.578433, 0, 0, 1, 1, 1,
-0.4850614, 0.07637067, -1.11755, 1, 0, 0, 1, 1,
-0.4799443, -0.8480195, -3.802744, 1, 0, 0, 1, 1,
-0.4790453, 2.15031, -0.2032487, 1, 0, 0, 1, 1,
-0.4780001, -0.2029831, 0.002232522, 1, 0, 0, 1, 1,
-0.4754073, -0.2788481, -2.28496, 1, 0, 0, 1, 1,
-0.4752105, -1.030627, -3.380789, 0, 0, 0, 1, 1,
-0.4728053, -0.4908715, -0.9531928, 0, 0, 0, 1, 1,
-0.4727496, -0.3822702, -1.859425, 0, 0, 0, 1, 1,
-0.4716653, 0.2026245, -1.299963, 0, 0, 0, 1, 1,
-0.4642927, 2.742826, -0.3169623, 0, 0, 0, 1, 1,
-0.4626057, 0.848464, -0.8068562, 0, 0, 0, 1, 1,
-0.4611872, 0.5797869, -1.42185, 0, 0, 0, 1, 1,
-0.459629, -1.50864, -2.428798, 1, 1, 1, 1, 1,
-0.4564221, 0.454041, -0.1023011, 1, 1, 1, 1, 1,
-0.4551798, 1.81668, -0.6907533, 1, 1, 1, 1, 1,
-0.453653, -0.4961568, -2.870291, 1, 1, 1, 1, 1,
-0.4532775, -1.534088, -3.304684, 1, 1, 1, 1, 1,
-0.4439989, -0.8044238, -1.744536, 1, 1, 1, 1, 1,
-0.4412287, 0.8318626, -0.3933017, 1, 1, 1, 1, 1,
-0.4304981, -1.040189, -1.887176, 1, 1, 1, 1, 1,
-0.4295453, -0.2532064, -2.795735, 1, 1, 1, 1, 1,
-0.4256336, -0.8217901, -1.802431, 1, 1, 1, 1, 1,
-0.424915, -1.62996, -2.750487, 1, 1, 1, 1, 1,
-0.4247194, -1.435799, -3.097691, 1, 1, 1, 1, 1,
-0.4200921, -0.02161414, -1.901319, 1, 1, 1, 1, 1,
-0.418952, 0.1387417, -0.8392019, 1, 1, 1, 1, 1,
-0.418362, 0.03180771, -2.152318, 1, 1, 1, 1, 1,
-0.4178276, 0.664431, -0.8583412, 0, 0, 1, 1, 1,
-0.4162879, 2.338722, -0.3494214, 1, 0, 0, 1, 1,
-0.4143551, 0.6238021, 0.1582153, 1, 0, 0, 1, 1,
-0.4138517, -0.3711889, -2.451451, 1, 0, 0, 1, 1,
-0.4067426, 1.436899, 0.373502, 1, 0, 0, 1, 1,
-0.4045152, 1.224248, 0.6393554, 1, 0, 0, 1, 1,
-0.4006872, -0.1135012, -1.829644, 0, 0, 0, 1, 1,
-0.4000173, 0.88123, -0.3733887, 0, 0, 0, 1, 1,
-0.3976445, -1.026002, -4.204093, 0, 0, 0, 1, 1,
-0.3951238, 0.2199012, -2.759424, 0, 0, 0, 1, 1,
-0.3936493, -1.133009, -0.9728234, 0, 0, 0, 1, 1,
-0.393454, -1.646951, -2.201632, 0, 0, 0, 1, 1,
-0.3927176, -2.106348, -2.93894, 0, 0, 0, 1, 1,
-0.3873939, 0.07766404, -3.683638, 1, 1, 1, 1, 1,
-0.3851104, -0.1665902, -2.781667, 1, 1, 1, 1, 1,
-0.3850704, -2.53208, -2.726133, 1, 1, 1, 1, 1,
-0.3844468, -1.078082, -1.970767, 1, 1, 1, 1, 1,
-0.3804312, 0.2422542, -2.070456, 1, 1, 1, 1, 1,
-0.3786415, -0.1425171, -2.499051, 1, 1, 1, 1, 1,
-0.3781729, -0.2184469, -1.410571, 1, 1, 1, 1, 1,
-0.3772403, 0.3399214, 0.8882173, 1, 1, 1, 1, 1,
-0.3751416, 0.7556193, -0.06039446, 1, 1, 1, 1, 1,
-0.3730103, -0.2501903, -3.008142, 1, 1, 1, 1, 1,
-0.3727611, 0.8721523, 0.02962332, 1, 1, 1, 1, 1,
-0.3681408, 1.019704, 0.8092517, 1, 1, 1, 1, 1,
-0.3660763, 1.17127, 0.3381362, 1, 1, 1, 1, 1,
-0.363808, -0.4669563, -2.868842, 1, 1, 1, 1, 1,
-0.3634083, -0.22484, -2.256355, 1, 1, 1, 1, 1,
-0.3625047, 0.5267614, -0.9183258, 0, 0, 1, 1, 1,
-0.3594418, 1.248753, -0.3122485, 1, 0, 0, 1, 1,
-0.359407, -1.003276, -2.379023, 1, 0, 0, 1, 1,
-0.356006, 0.1347322, -0.7359154, 1, 0, 0, 1, 1,
-0.3550762, -0.08571646, -2.458735, 1, 0, 0, 1, 1,
-0.354954, -0.8390616, -2.937561, 1, 0, 0, 1, 1,
-0.3455679, -0.5496353, -2.893464, 0, 0, 0, 1, 1,
-0.3426331, 1.516125, 0.09022228, 0, 0, 0, 1, 1,
-0.3353265, -0.1728696, -1.25156, 0, 0, 0, 1, 1,
-0.3325877, -1.010859, -1.422762, 0, 0, 0, 1, 1,
-0.3275469, -0.3159179, -1.130639, 0, 0, 0, 1, 1,
-0.3219891, 2.165869, -1.154129, 0, 0, 0, 1, 1,
-0.320791, 1.029511, -0.1067978, 0, 0, 0, 1, 1,
-0.3142859, 1.249167, -1.274375, 1, 1, 1, 1, 1,
-0.3112507, 0.005860877, -1.381279, 1, 1, 1, 1, 1,
-0.3099051, -1.636386, -3.382434, 1, 1, 1, 1, 1,
-0.3095918, -0.2889918, -2.864169, 1, 1, 1, 1, 1,
-0.3078008, -0.6439318, -2.882779, 1, 1, 1, 1, 1,
-0.3068544, -1.593026, -1.96494, 1, 1, 1, 1, 1,
-0.300041, 0.7632695, -0.9195155, 1, 1, 1, 1, 1,
-0.2996175, 0.5329351, -1.578094, 1, 1, 1, 1, 1,
-0.2976329, -0.02265585, -1.173158, 1, 1, 1, 1, 1,
-0.2933692, 1.337965, -1.318787, 1, 1, 1, 1, 1,
-0.2925039, 1.500779, -0.7626162, 1, 1, 1, 1, 1,
-0.283627, 1.533641, -1.460197, 1, 1, 1, 1, 1,
-0.273577, -1.776617, -4.246868, 1, 1, 1, 1, 1,
-0.2696129, 0.1653655, -1.75736, 1, 1, 1, 1, 1,
-0.2678521, -1.319499, -1.648123, 1, 1, 1, 1, 1,
-0.2637789, -4.076245, -2.963226, 0, 0, 1, 1, 1,
-0.2628969, 0.8468472, -0.0927071, 1, 0, 0, 1, 1,
-0.258007, 0.6556335, -0.06999766, 1, 0, 0, 1, 1,
-0.2565019, -0.1812155, -2.29168, 1, 0, 0, 1, 1,
-0.2543174, 0.3281253, -0.95686, 1, 0, 0, 1, 1,
-0.2500719, 0.735778, 0.1765295, 1, 0, 0, 1, 1,
-0.2493824, -0.1111484, 0.2106467, 0, 0, 0, 1, 1,
-0.2443542, -1.414138, -2.036889, 0, 0, 0, 1, 1,
-0.2421261, 0.5136579, -0.2295762, 0, 0, 0, 1, 1,
-0.2401096, -0.3534892, -2.800658, 0, 0, 0, 1, 1,
-0.2364142, -1.610508, -2.590443, 0, 0, 0, 1, 1,
-0.2362847, -0.5885784, -4.348122, 0, 0, 0, 1, 1,
-0.2336662, 0.2021367, -1.125436, 0, 0, 0, 1, 1,
-0.2331164, 0.01838412, -3.589392, 1, 1, 1, 1, 1,
-0.2298202, -0.3741207, -1.172879, 1, 1, 1, 1, 1,
-0.2253609, 0.1171834, -1.925444, 1, 1, 1, 1, 1,
-0.2252878, -0.7688406, -3.759033, 1, 1, 1, 1, 1,
-0.2245236, -0.146487, -3.931467, 1, 1, 1, 1, 1,
-0.2244863, -0.8137822, -3.585257, 1, 1, 1, 1, 1,
-0.2217434, -3.109417, -3.25987, 1, 1, 1, 1, 1,
-0.2167295, -0.2509115, -5.909657, 1, 1, 1, 1, 1,
-0.2149509, -0.3379675, -2.817283, 1, 1, 1, 1, 1,
-0.213205, -0.1379201, 0.06500621, 1, 1, 1, 1, 1,
-0.2120557, -0.6582928, -0.7136966, 1, 1, 1, 1, 1,
-0.2077912, -0.5554008, -2.301087, 1, 1, 1, 1, 1,
-0.2014517, -1.080488, -4.843619, 1, 1, 1, 1, 1,
-0.20106, -0.07547826, -2.340429, 1, 1, 1, 1, 1,
-0.2009207, -0.9907522, -2.54376, 1, 1, 1, 1, 1,
-0.19912, 0.045589, -0.6076549, 0, 0, 1, 1, 1,
-0.1910318, -0.6777032, -2.039712, 1, 0, 0, 1, 1,
-0.1804198, 0.2782625, -0.9874693, 1, 0, 0, 1, 1,
-0.1804105, 1.307376, -0.6483423, 1, 0, 0, 1, 1,
-0.1803832, 0.1764516, -1.336735, 1, 0, 0, 1, 1,
-0.1781739, -0.3305859, -4.025826, 1, 0, 0, 1, 1,
-0.1768847, -0.263379, -1.558774, 0, 0, 0, 1, 1,
-0.1757015, 2.304077, 1.044209, 0, 0, 0, 1, 1,
-0.1755471, -0.2749357, -3.491556, 0, 0, 0, 1, 1,
-0.1737166, 1.102203, 0.3697862, 0, 0, 0, 1, 1,
-0.1717995, 2.371935, -0.2016862, 0, 0, 0, 1, 1,
-0.1702158, 2.084462, -1.565709, 0, 0, 0, 1, 1,
-0.1690398, -1.258111, -3.595269, 0, 0, 0, 1, 1,
-0.1561816, 0.2485072, -1.621031, 1, 1, 1, 1, 1,
-0.1561197, 1.981419, 0.03522915, 1, 1, 1, 1, 1,
-0.1541011, -1.201914, -1.906092, 1, 1, 1, 1, 1,
-0.1510921, -0.6601407, -4.601773, 1, 1, 1, 1, 1,
-0.150748, 0.007382344, -2.563962, 1, 1, 1, 1, 1,
-0.1484751, -1.347695, -4.132885, 1, 1, 1, 1, 1,
-0.1406966, 1.009342, 1.858845, 1, 1, 1, 1, 1,
-0.140329, -1.579697, -3.713249, 1, 1, 1, 1, 1,
-0.1370932, 1.178949, 0.9911451, 1, 1, 1, 1, 1,
-0.1347973, 1.251687, 0.7875344, 1, 1, 1, 1, 1,
-0.1312164, -1.089616, -2.659258, 1, 1, 1, 1, 1,
-0.1256503, 0.7980502, -0.3748217, 1, 1, 1, 1, 1,
-0.1239106, 1.961857, 0.4748333, 1, 1, 1, 1, 1,
-0.1236768, 0.09808053, -1.670462, 1, 1, 1, 1, 1,
-0.1202025, -0.1762284, -0.8856097, 1, 1, 1, 1, 1,
-0.1182646, 1.935727, -0.6657178, 0, 0, 1, 1, 1,
-0.1173719, 0.09792102, -0.1648016, 1, 0, 0, 1, 1,
-0.1166256, -1.211729, -5.611887, 1, 0, 0, 1, 1,
-0.1119316, 0.3008815, 0.4644948, 1, 0, 0, 1, 1,
-0.1111374, -0.3132626, -2.330496, 1, 0, 0, 1, 1,
-0.1102096, 0.1044139, 0.1799448, 1, 0, 0, 1, 1,
-0.1099425, -0.2409912, -1.260424, 0, 0, 0, 1, 1,
-0.1097116, -0.4039846, -3.01749, 0, 0, 0, 1, 1,
-0.1080009, 2.267761, 0.7463287, 0, 0, 0, 1, 1,
-0.1049383, -1.704499, -1.781493, 0, 0, 0, 1, 1,
-0.1040016, -1.470437, -2.0012, 0, 0, 0, 1, 1,
-0.1037923, -0.4364332, -4.618146, 0, 0, 0, 1, 1,
-0.1000332, -1.065829, -4.330349, 0, 0, 0, 1, 1,
-0.09933415, 1.194506, 0.09464652, 1, 1, 1, 1, 1,
-0.09745614, -0.374026, -2.532489, 1, 1, 1, 1, 1,
-0.09485023, -0.02003161, -1.146983, 1, 1, 1, 1, 1,
-0.09430809, 1.169521, -2.086905, 1, 1, 1, 1, 1,
-0.09287456, 0.7856719, -1.856102, 1, 1, 1, 1, 1,
-0.09086972, -0.8582418, -4.214554, 1, 1, 1, 1, 1,
-0.09067441, 1.178875, -0.8982924, 1, 1, 1, 1, 1,
-0.09015277, 0.2262124, -0.798583, 1, 1, 1, 1, 1,
-0.08705061, -1.003112, -3.516109, 1, 1, 1, 1, 1,
-0.08621911, -0.04104264, -2.695507, 1, 1, 1, 1, 1,
-0.08492123, 0.3866132, -0.1608056, 1, 1, 1, 1, 1,
-0.08183461, -0.4069676, -2.72352, 1, 1, 1, 1, 1,
-0.08176531, 0.6700187, -1.629252, 1, 1, 1, 1, 1,
-0.07421644, -1.802378, -2.438732, 1, 1, 1, 1, 1,
-0.0732643, -0.876482, -4.053108, 1, 1, 1, 1, 1,
-0.06856938, -0.8286049, -3.772651, 0, 0, 1, 1, 1,
-0.06659278, -0.7226853, -3.807164, 1, 0, 0, 1, 1,
-0.06550936, 0.099632, 0.4680079, 1, 0, 0, 1, 1,
-0.0626744, -0.2292943, -2.912432, 1, 0, 0, 1, 1,
-0.06189542, 0.6134768, -0.04670072, 1, 0, 0, 1, 1,
-0.06033751, -1.013158, -4.166726, 1, 0, 0, 1, 1,
-0.06025239, 1.585382, 0.7814664, 0, 0, 0, 1, 1,
-0.05889298, -0.1662951, -2.742865, 0, 0, 0, 1, 1,
-0.05501026, 1.1834, -1.234082, 0, 0, 0, 1, 1,
-0.04937523, 1.52941, 0.6054912, 0, 0, 0, 1, 1,
-0.04720546, -0.6768661, -4.616956, 0, 0, 0, 1, 1,
-0.0445779, -0.6418817, -3.160568, 0, 0, 0, 1, 1,
-0.04435109, 0.9375719, 0.863448, 0, 0, 0, 1, 1,
-0.03945617, 0.5553043, -0.3831846, 1, 1, 1, 1, 1,
-0.0352819, 0.8646255, -1.063557, 1, 1, 1, 1, 1,
-0.03394658, 0.03111758, -0.4240547, 1, 1, 1, 1, 1,
-0.0243952, -1.193326, -4.107088, 1, 1, 1, 1, 1,
-0.02362829, -0.188794, -4.144151, 1, 1, 1, 1, 1,
-0.02335222, 0.3456692, -0.4564111, 1, 1, 1, 1, 1,
-0.01868855, 0.2951886, -1.16752, 1, 1, 1, 1, 1,
-0.01703464, 1.338767, -0.005871785, 1, 1, 1, 1, 1,
-0.011458, 1.548473, -0.8741316, 1, 1, 1, 1, 1,
-0.01144323, 0.5833523, -0.2633683, 1, 1, 1, 1, 1,
-0.008926523, 0.07386443, 0.2128857, 1, 1, 1, 1, 1,
-0.002616214, 0.4783296, -0.7973738, 1, 1, 1, 1, 1,
-0.002304778, -0.1033353, -3.624843, 1, 1, 1, 1, 1,
0.0001997792, -1.319611, 3.518045, 1, 1, 1, 1, 1,
0.001951096, -0.05436895, 3.24689, 1, 1, 1, 1, 1,
0.003214734, 0.1981146, 0.6742748, 0, 0, 1, 1, 1,
0.005304893, -1.199142, 2.959494, 1, 0, 0, 1, 1,
0.007960275, 0.7864302, -0.9026074, 1, 0, 0, 1, 1,
0.009938932, 0.3154466, 0.807511, 1, 0, 0, 1, 1,
0.01466259, 0.9132851, -0.4861569, 1, 0, 0, 1, 1,
0.01498527, 0.03814437, -1.480238, 1, 0, 0, 1, 1,
0.01715981, -0.387363, 3.541054, 0, 0, 0, 1, 1,
0.02091036, -0.6937814, 3.80281, 0, 0, 0, 1, 1,
0.02147588, 0.2404703, 0.1806615, 0, 0, 0, 1, 1,
0.0221808, 0.07740059, 0.2242112, 0, 0, 0, 1, 1,
0.02387792, 0.5222614, -0.1561198, 0, 0, 0, 1, 1,
0.02608015, -0.271756, 5.066336, 0, 0, 0, 1, 1,
0.02903423, -1.29164, 2.943443, 0, 0, 0, 1, 1,
0.02946869, 2.277287, 0.2367197, 1, 1, 1, 1, 1,
0.03232643, 1.778055, 0.7449411, 1, 1, 1, 1, 1,
0.03391814, -0.6533525, 2.567244, 1, 1, 1, 1, 1,
0.0339798, 0.5196365, 1.487495, 1, 1, 1, 1, 1,
0.03554999, -0.6536565, 3.041193, 1, 1, 1, 1, 1,
0.03849359, -0.381919, 3.949298, 1, 1, 1, 1, 1,
0.04684656, -0.7319171, 2.020311, 1, 1, 1, 1, 1,
0.04781656, 1.394224, 0.0985484, 1, 1, 1, 1, 1,
0.05692055, -2.472996, 5.289999, 1, 1, 1, 1, 1,
0.05862951, -0.3038997, 2.043568, 1, 1, 1, 1, 1,
0.06137106, -0.6503794, 2.570557, 1, 1, 1, 1, 1,
0.06729782, -2.650935, 3.280188, 1, 1, 1, 1, 1,
0.06777506, -0.0834698, 3.316135, 1, 1, 1, 1, 1,
0.06851613, -0.6560913, 2.396891, 1, 1, 1, 1, 1,
0.07004811, 0.7961614, 1.103506, 1, 1, 1, 1, 1,
0.07244196, -1.439565, 2.368268, 0, 0, 1, 1, 1,
0.07849155, -0.6050741, 4.509981, 1, 0, 0, 1, 1,
0.08046837, -0.6550191, 0.8207898, 1, 0, 0, 1, 1,
0.08106304, 1.028827, -0.01836755, 1, 0, 0, 1, 1,
0.08440988, -1.126296, 3.056767, 1, 0, 0, 1, 1,
0.08638594, 0.7090605, 0.2910238, 1, 0, 0, 1, 1,
0.09094556, 0.5414878, -0.1479055, 0, 0, 0, 1, 1,
0.09289852, 0.74896, 1.378319, 0, 0, 0, 1, 1,
0.09544509, -0.4599073, 2.644195, 0, 0, 0, 1, 1,
0.1008959, 1.169348, 1.726857, 0, 0, 0, 1, 1,
0.1026338, -1.325382, 2.643385, 0, 0, 0, 1, 1,
0.109464, 0.2825558, 0.3704759, 0, 0, 0, 1, 1,
0.113269, -0.356352, 4.85111, 0, 0, 0, 1, 1,
0.1149615, -0.2856431, 4.794201, 1, 1, 1, 1, 1,
0.1151828, -0.2852257, 2.511596, 1, 1, 1, 1, 1,
0.1174586, -1.057482, 1.729817, 1, 1, 1, 1, 1,
0.1178375, -1.391128, 2.606235, 1, 1, 1, 1, 1,
0.1264157, -0.0356125, 1.05065, 1, 1, 1, 1, 1,
0.1279307, 0.5477705, 0.1395656, 1, 1, 1, 1, 1,
0.1335538, -0.3019501, 1.993759, 1, 1, 1, 1, 1,
0.134825, -1.629052, 3.741153, 1, 1, 1, 1, 1,
0.13842, -0.05807464, 3.043059, 1, 1, 1, 1, 1,
0.1389861, -0.2627148, 2.889858, 1, 1, 1, 1, 1,
0.1439701, -0.3811918, 2.154891, 1, 1, 1, 1, 1,
0.1468709, -0.411344, 2.411938, 1, 1, 1, 1, 1,
0.1478858, 0.5325447, 1.005846, 1, 1, 1, 1, 1,
0.1481002, -0.06385963, 2.629772, 1, 1, 1, 1, 1,
0.1483417, -1.319729, 1.754078, 1, 1, 1, 1, 1,
0.1537481, 0.8338303, 1.377341, 0, 0, 1, 1, 1,
0.1566034, 0.4447711, 0.2009084, 1, 0, 0, 1, 1,
0.1566035, 0.3715242, -0.1533951, 1, 0, 0, 1, 1,
0.1608223, -0.710039, 3.191682, 1, 0, 0, 1, 1,
0.1634388, -2.465588, 2.7981, 1, 0, 0, 1, 1,
0.1636118, 0.2328338, 0.4272448, 1, 0, 0, 1, 1,
0.1659613, 0.3507677, 0.6530375, 0, 0, 0, 1, 1,
0.1678012, -1.1973, 1.003449, 0, 0, 0, 1, 1,
0.1752965, -0.3175678, 3.003562, 0, 0, 0, 1, 1,
0.1754742, -0.3195874, 1.048572, 0, 0, 0, 1, 1,
0.1772362, -1.23848, 3.199214, 0, 0, 0, 1, 1,
0.1783343, 0.8221404, 0.7524127, 0, 0, 0, 1, 1,
0.1810577, -0.8386619, 4.244941, 0, 0, 0, 1, 1,
0.1826497, 0.04846795, -0.7801507, 1, 1, 1, 1, 1,
0.184152, -0.136053, 2.171003, 1, 1, 1, 1, 1,
0.1865997, 0.2870725, 0.8173296, 1, 1, 1, 1, 1,
0.187901, -1.579127, 2.661504, 1, 1, 1, 1, 1,
0.1880483, 0.1209173, 0.01611567, 1, 1, 1, 1, 1,
0.1881133, -1.232029, 4.809309, 1, 1, 1, 1, 1,
0.210328, -1.563803, 1.722919, 1, 1, 1, 1, 1,
0.2106328, -0.1009251, 1.390576, 1, 1, 1, 1, 1,
0.2121231, -0.879446, -0.1703355, 1, 1, 1, 1, 1,
0.2333912, 0.193535, 2.516267, 1, 1, 1, 1, 1,
0.235205, 0.1780962, 0.5993237, 1, 1, 1, 1, 1,
0.2407991, 2.062068, -0.2380198, 1, 1, 1, 1, 1,
0.2416503, 0.9764993, 1.604689, 1, 1, 1, 1, 1,
0.2420896, 0.1052089, 0.05513604, 1, 1, 1, 1, 1,
0.2461138, 0.4955614, 1.724864, 1, 1, 1, 1, 1,
0.2480919, 0.4866787, -0.1211328, 0, 0, 1, 1, 1,
0.2482704, 0.3483158, -2.163772, 1, 0, 0, 1, 1,
0.2512237, -0.9303636, 2.164403, 1, 0, 0, 1, 1,
0.2550104, -0.2224468, 3.401304, 1, 0, 0, 1, 1,
0.2570486, 0.5034083, -0.9729232, 1, 0, 0, 1, 1,
0.2580494, -0.1669887, 1.598462, 1, 0, 0, 1, 1,
0.260601, 1.121913, 1.666937, 0, 0, 0, 1, 1,
0.2620467, -0.3060694, 1.194273, 0, 0, 0, 1, 1,
0.2625799, 1.323943, 0.4642694, 0, 0, 0, 1, 1,
0.2631427, -0.3458604, 3.54986, 0, 0, 0, 1, 1,
0.2741018, 0.3490715, 1.121817, 0, 0, 0, 1, 1,
0.2769814, -3.530385, 2.258424, 0, 0, 0, 1, 1,
0.2846633, -0.4627598, 3.808486, 0, 0, 0, 1, 1,
0.2847925, -0.916416, 2.450337, 1, 1, 1, 1, 1,
0.2873136, 0.7884642, 1.052449, 1, 1, 1, 1, 1,
0.2881663, 1.296637, 2.837905, 1, 1, 1, 1, 1,
0.2886775, 1.581724, 0.8096012, 1, 1, 1, 1, 1,
0.2888626, -1.590416, 3.773502, 1, 1, 1, 1, 1,
0.2893828, 0.0933966, 1.85217, 1, 1, 1, 1, 1,
0.2911436, -0.8429315, 2.508922, 1, 1, 1, 1, 1,
0.2918944, -1.232764, 1.463079, 1, 1, 1, 1, 1,
0.2924353, -0.807691, 1.928315, 1, 1, 1, 1, 1,
0.2959802, -0.7613785, 2.596961, 1, 1, 1, 1, 1,
0.2976741, 0.5044626, 0.5527099, 1, 1, 1, 1, 1,
0.2992572, 0.3884104, 1.473562, 1, 1, 1, 1, 1,
0.3007181, -0.5618652, 2.901834, 1, 1, 1, 1, 1,
0.3019196, -1.093105, 2.360605, 1, 1, 1, 1, 1,
0.3040469, 0.2894975, 0.7530205, 1, 1, 1, 1, 1,
0.304673, -1.43777, 2.476174, 0, 0, 1, 1, 1,
0.306476, -2.601423, 2.441548, 1, 0, 0, 1, 1,
0.308364, 1.617346, 2.859562, 1, 0, 0, 1, 1,
0.3094325, 1.400409, -0.02291991, 1, 0, 0, 1, 1,
0.3094814, -0.442988, 0.6950871, 1, 0, 0, 1, 1,
0.3117822, -1.353896, 3.344045, 1, 0, 0, 1, 1,
0.3140606, 0.5377195, 1.249862, 0, 0, 0, 1, 1,
0.3148338, -1.937597, 1.886343, 0, 0, 0, 1, 1,
0.3180038, 0.1651317, 2.132648, 0, 0, 0, 1, 1,
0.3236399, 1.215305, 1.656151, 0, 0, 0, 1, 1,
0.3243116, -0.1618722, 0.7257704, 0, 0, 0, 1, 1,
0.3278896, 0.6952907, 0.361646, 0, 0, 0, 1, 1,
0.3307254, -0.2130733, 1.670606, 0, 0, 0, 1, 1,
0.3317455, 0.461961, 0.1808569, 1, 1, 1, 1, 1,
0.3398836, 0.6465548, 0.544631, 1, 1, 1, 1, 1,
0.3417648, 1.124931, -0.01802869, 1, 1, 1, 1, 1,
0.3447528, -0.3793723, 1.032373, 1, 1, 1, 1, 1,
0.3473691, 0.06632697, 0.6616546, 1, 1, 1, 1, 1,
0.3516319, -0.0454728, 0.9998522, 1, 1, 1, 1, 1,
0.3523867, 0.4389089, 0.7042988, 1, 1, 1, 1, 1,
0.3533473, -0.6382899, 3.19255, 1, 1, 1, 1, 1,
0.3554263, -0.00341973, 2.419941, 1, 1, 1, 1, 1,
0.3561415, -0.5788906, 2.768346, 1, 1, 1, 1, 1,
0.3573374, -1.03707, 1.780682, 1, 1, 1, 1, 1,
0.3581315, -0.04902815, 2.083995, 1, 1, 1, 1, 1,
0.3610276, -0.01350131, 2.29419, 1, 1, 1, 1, 1,
0.3618142, 0.3339443, -0.3901515, 1, 1, 1, 1, 1,
0.362828, -1.261883, 4.34163, 1, 1, 1, 1, 1,
0.3640151, -0.3641201, 3.861385, 0, 0, 1, 1, 1,
0.3692766, 1.48638, -0.4907257, 1, 0, 0, 1, 1,
0.371443, 0.06804021, -0.02365537, 1, 0, 0, 1, 1,
0.3751623, -1.458838, 2.197552, 1, 0, 0, 1, 1,
0.3949441, -2.315272, 1.623117, 1, 0, 0, 1, 1,
0.3989325, -0.7609133, 2.616536, 1, 0, 0, 1, 1,
0.4013451, -0.4655161, 2.697379, 0, 0, 0, 1, 1,
0.4043052, -1.375675, 1.361531, 0, 0, 0, 1, 1,
0.4049101, -1.973435, 0.3751886, 0, 0, 0, 1, 1,
0.4056615, -1.285728, 3.239126, 0, 0, 0, 1, 1,
0.4079108, 0.2965038, 1.074257, 0, 0, 0, 1, 1,
0.4079206, 0.5451303, -0.1410137, 0, 0, 0, 1, 1,
0.4080617, -0.2009535, 2.266504, 0, 0, 0, 1, 1,
0.4081194, 1.035152, 1.835177, 1, 1, 1, 1, 1,
0.4093311, -0.9385168, 1.435165, 1, 1, 1, 1, 1,
0.4093858, 0.05560916, 0.7319448, 1, 1, 1, 1, 1,
0.4166253, -1.328122, 2.491062, 1, 1, 1, 1, 1,
0.4173898, 1.114975, 0.6369052, 1, 1, 1, 1, 1,
0.4190077, -0.03103621, -0.1566014, 1, 1, 1, 1, 1,
0.4249623, 1.578377, -0.05304306, 1, 1, 1, 1, 1,
0.4309624, -0.4863527, 2.812047, 1, 1, 1, 1, 1,
0.4413092, 1.920781, 0.4550768, 1, 1, 1, 1, 1,
0.4415371, -1.629951, 3.69583, 1, 1, 1, 1, 1,
0.4418598, 1.365401, 2.053395, 1, 1, 1, 1, 1,
0.4480008, -0.7181911, 4.119956, 1, 1, 1, 1, 1,
0.4489163, 1.539894, -0.3073387, 1, 1, 1, 1, 1,
0.449661, -0.1370397, 2.674241, 1, 1, 1, 1, 1,
0.4508996, -0.2588625, -0.5752313, 1, 1, 1, 1, 1,
0.4526551, -0.1488566, 1.307484, 0, 0, 1, 1, 1,
0.4574748, 0.779219, 0.7294681, 1, 0, 0, 1, 1,
0.4598138, -1.271995, 3.702035, 1, 0, 0, 1, 1,
0.4605187, -0.4416457, 1.90817, 1, 0, 0, 1, 1,
0.46351, 1.628924, -1.187201, 1, 0, 0, 1, 1,
0.473361, -0.5589578, 2.799372, 1, 0, 0, 1, 1,
0.4738679, 0.2578176, 0.07792185, 0, 0, 0, 1, 1,
0.4748355, 0.3573079, 1.278818, 0, 0, 0, 1, 1,
0.4754061, 0.6139991, 1.554237, 0, 0, 0, 1, 1,
0.4814502, 1.246882, 0.3273513, 0, 0, 0, 1, 1,
0.4825202, 0.6593392, 0.3555911, 0, 0, 0, 1, 1,
0.4899945, 1.829723, 1.762848, 0, 0, 0, 1, 1,
0.4930554, 2.39999, 0.1863184, 0, 0, 0, 1, 1,
0.4947843, 0.3565287, -0.7789025, 1, 1, 1, 1, 1,
0.5050669, 1.785822, 0.7678865, 1, 1, 1, 1, 1,
0.5054067, 0.4190099, 1.446459, 1, 1, 1, 1, 1,
0.5103198, 1.120155, 0.5792871, 1, 1, 1, 1, 1,
0.5109293, -2.327529, 3.286869, 1, 1, 1, 1, 1,
0.5119577, -0.1914577, 0.9905959, 1, 1, 1, 1, 1,
0.5121302, -1.518821, 2.76021, 1, 1, 1, 1, 1,
0.513818, 0.1077642, 1.269294, 1, 1, 1, 1, 1,
0.5149519, 0.8656136, 0.09372666, 1, 1, 1, 1, 1,
0.5161431, 0.7964028, -0.1201873, 1, 1, 1, 1, 1,
0.5178183, 0.8311545, 2.047923, 1, 1, 1, 1, 1,
0.5187075, -1.409211, 3.898973, 1, 1, 1, 1, 1,
0.5199689, -0.4758371, 1.973309, 1, 1, 1, 1, 1,
0.5212327, -1.99916, 3.85264, 1, 1, 1, 1, 1,
0.5220929, -1.313027, 1.235312, 1, 1, 1, 1, 1,
0.5283304, -1.448256, 2.882461, 0, 0, 1, 1, 1,
0.5292759, 0.914071, 0.621227, 1, 0, 0, 1, 1,
0.5295154, 0.4469231, 0.4812142, 1, 0, 0, 1, 1,
0.5307539, 1.358876, 0.469998, 1, 0, 0, 1, 1,
0.5317193, -1.104645, 4.134862, 1, 0, 0, 1, 1,
0.5358415, 1.244006, -0.8610585, 1, 0, 0, 1, 1,
0.5362085, 1.036232, 0.8994545, 0, 0, 0, 1, 1,
0.5384506, 0.3728758, 2.758571, 0, 0, 0, 1, 1,
0.5416607, -1.300088, 2.219623, 0, 0, 0, 1, 1,
0.5427136, -1.506824, 1.872199, 0, 0, 0, 1, 1,
0.546888, -0.06458616, 1.517168, 0, 0, 0, 1, 1,
0.549209, -0.02372258, 0.1158751, 0, 0, 0, 1, 1,
0.5605887, -0.1189902, 1.587196, 0, 0, 0, 1, 1,
0.5631958, -0.7021008, 3.602055, 1, 1, 1, 1, 1,
0.5673142, -1.189472, 3.371381, 1, 1, 1, 1, 1,
0.5675635, -0.5980273, 1.74365, 1, 1, 1, 1, 1,
0.568173, -0.4141764, 1.630579, 1, 1, 1, 1, 1,
0.570398, 0.2310635, 1.555035, 1, 1, 1, 1, 1,
0.573285, -0.04527669, 0.8723703, 1, 1, 1, 1, 1,
0.5734612, -1.094926, 4.921201, 1, 1, 1, 1, 1,
0.574505, -0.02842253, 0.7849151, 1, 1, 1, 1, 1,
0.5751833, 0.01368701, 0.8414041, 1, 1, 1, 1, 1,
0.5791004, 0.6120003, 0.03701385, 1, 1, 1, 1, 1,
0.5862161, -0.4508158, 1.344281, 1, 1, 1, 1, 1,
0.589568, -0.2532175, 1.570061, 1, 1, 1, 1, 1,
0.5980833, -1.002131, 2.272086, 1, 1, 1, 1, 1,
0.5996079, 1.611208, 0.1592542, 1, 1, 1, 1, 1,
0.6022792, -1.138047, 4.312134, 1, 1, 1, 1, 1,
0.6030545, 0.05502264, 1.518996, 0, 0, 1, 1, 1,
0.6030985, -0.8484488, 2.158752, 1, 0, 0, 1, 1,
0.604861, 1.633756, -1.068184, 1, 0, 0, 1, 1,
0.6067824, -0.4455034, 2.254165, 1, 0, 0, 1, 1,
0.6070572, 1.417748, 0.3796269, 1, 0, 0, 1, 1,
0.620286, 0.05012701, 0.5102463, 1, 0, 0, 1, 1,
0.6214918, -1.562552, 2.232876, 0, 0, 0, 1, 1,
0.6244338, 0.3592162, 1.348872, 0, 0, 0, 1, 1,
0.6267275, 0.1337208, -0.2636624, 0, 0, 0, 1, 1,
0.6272858, -1.383631, 4.336771, 0, 0, 0, 1, 1,
0.6343678, 1.218774, -0.8305729, 0, 0, 0, 1, 1,
0.6351498, 0.3312364, 1.422392, 0, 0, 0, 1, 1,
0.6359953, -0.1957799, 1.227977, 0, 0, 0, 1, 1,
0.638364, -0.5916499, 1.537569, 1, 1, 1, 1, 1,
0.6429282, 0.6394825, 0.7418098, 1, 1, 1, 1, 1,
0.6434795, -0.06494285, 1.607606, 1, 1, 1, 1, 1,
0.6439707, 0.2468242, 1.73255, 1, 1, 1, 1, 1,
0.6495838, 1.057247, 1.648136, 1, 1, 1, 1, 1,
0.6495927, 0.1148039, 0.917442, 1, 1, 1, 1, 1,
0.6512628, -0.7406399, 1.953175, 1, 1, 1, 1, 1,
0.6523132, -0.8688548, 2.650038, 1, 1, 1, 1, 1,
0.6591463, 0.02781643, 1.299074, 1, 1, 1, 1, 1,
0.663034, -0.5525138, 0.9235172, 1, 1, 1, 1, 1,
0.6635349, -1.823727, 2.548444, 1, 1, 1, 1, 1,
0.664512, 0.388112, -0.7818254, 1, 1, 1, 1, 1,
0.665396, 1.615082, -2.088277, 1, 1, 1, 1, 1,
0.6688303, 0.7375461, 1.005643, 1, 1, 1, 1, 1,
0.6729076, 0.3053676, 1.228777, 1, 1, 1, 1, 1,
0.6829883, -0.917129, 2.88066, 0, 0, 1, 1, 1,
0.6850658, 0.4254611, 1.37504, 1, 0, 0, 1, 1,
0.687021, -0.1771577, 0.731712, 1, 0, 0, 1, 1,
0.6910012, 0.9340597, 0.7631823, 1, 0, 0, 1, 1,
0.6976616, -0.5562341, 1.784937, 1, 0, 0, 1, 1,
0.6981028, -0.03649858, 2.851505, 1, 0, 0, 1, 1,
0.6996076, -1.643723, 3.127418, 0, 0, 0, 1, 1,
0.7039285, -2.231, 2.647384, 0, 0, 0, 1, 1,
0.7064978, -0.3943963, 2.03365, 0, 0, 0, 1, 1,
0.7076508, -0.4831466, 2.756099, 0, 0, 0, 1, 1,
0.7088835, -0.7030591, 0.6668581, 0, 0, 0, 1, 1,
0.7156725, -0.3465141, 2.324046, 0, 0, 0, 1, 1,
0.7183422, -0.9986282, 0.5135519, 0, 0, 0, 1, 1,
0.720093, 0.9501908, -0.1339413, 1, 1, 1, 1, 1,
0.7240647, 0.6311237, 2.134529, 1, 1, 1, 1, 1,
0.727334, 0.0600599, 2.542348, 1, 1, 1, 1, 1,
0.7349744, 1.734422, -0.7812101, 1, 1, 1, 1, 1,
0.735963, -0.02286629, 1.031, 1, 1, 1, 1, 1,
0.7363534, -0.3729975, 2.534038, 1, 1, 1, 1, 1,
0.7425209, -0.6022238, 2.567527, 1, 1, 1, 1, 1,
0.7453101, 1.480026, -0.2638267, 1, 1, 1, 1, 1,
0.7469914, -0.6118539, 1.973107, 1, 1, 1, 1, 1,
0.7508669, -0.07674638, 1.799092, 1, 1, 1, 1, 1,
0.7559697, 0.4215987, 0.7408211, 1, 1, 1, 1, 1,
0.7601455, 1.290639, -0.9739758, 1, 1, 1, 1, 1,
0.7609089, 0.6403214, 1.06787, 1, 1, 1, 1, 1,
0.766893, 0.8581706, -0.1622725, 1, 1, 1, 1, 1,
0.7695656, 1.003655, 1.492645, 1, 1, 1, 1, 1,
0.7772868, 0.5921977, 0.9134672, 0, 0, 1, 1, 1,
0.7814271, 2.897265, 1.001033, 1, 0, 0, 1, 1,
0.7842595, -1.369796, 0.1023009, 1, 0, 0, 1, 1,
0.7867516, 0.5457427, 0.7992579, 1, 0, 0, 1, 1,
0.789959, -1.835563, 3.121489, 1, 0, 0, 1, 1,
0.7902831, -0.7273421, 0.7228862, 1, 0, 0, 1, 1,
0.7943268, -0.5166476, 2.020458, 0, 0, 0, 1, 1,
0.7964999, -1.100849, 3.479552, 0, 0, 0, 1, 1,
0.7972349, 0.3849562, 1.802253, 0, 0, 0, 1, 1,
0.7981227, 0.8845695, 1.445473, 0, 0, 0, 1, 1,
0.7981309, -0.3323758, 0.9942981, 0, 0, 0, 1, 1,
0.7997802, -0.7290322, 3.446192, 0, 0, 0, 1, 1,
0.8011635, -1.129089, 3.448277, 0, 0, 0, 1, 1,
0.8028321, 0.6349996, 2.424349, 1, 1, 1, 1, 1,
0.8041157, -0.06122974, 0.8065419, 1, 1, 1, 1, 1,
0.8045746, 0.5823218, 2.487903, 1, 1, 1, 1, 1,
0.8069824, 1.282357, 1.666596, 1, 1, 1, 1, 1,
0.8131588, -0.3285901, 0.9899908, 1, 1, 1, 1, 1,
0.8140048, -1.183725, 3.179319, 1, 1, 1, 1, 1,
0.8209231, 1.777786, 0.4608981, 1, 1, 1, 1, 1,
0.8225981, -0.3845712, 3.383492, 1, 1, 1, 1, 1,
0.8289521, -0.1035396, 2.643187, 1, 1, 1, 1, 1,
0.8302561, 0.2960417, 0.3545088, 1, 1, 1, 1, 1,
0.8340069, -0.2029879, 1.281692, 1, 1, 1, 1, 1,
0.8352047, 0.1384486, 1.681674, 1, 1, 1, 1, 1,
0.8354903, -0.07961434, 2.494946, 1, 1, 1, 1, 1,
0.8360102, -0.7588388, 3.107724, 1, 1, 1, 1, 1,
0.8477706, 2.041367, 1.276437, 1, 1, 1, 1, 1,
0.855258, 0.5217995, 1.125401, 0, 0, 1, 1, 1,
0.8578742, -0.1273263, 2.859547, 1, 0, 0, 1, 1,
0.8595209, 1.11828, 1.556777, 1, 0, 0, 1, 1,
0.8600606, 2.268219, 0.4650619, 1, 0, 0, 1, 1,
0.862113, -0.02902266, 1.789735, 1, 0, 0, 1, 1,
0.866213, 0.240398, 0.8103013, 1, 0, 0, 1, 1,
0.8694484, -1.093234, 2.653967, 0, 0, 0, 1, 1,
0.8702483, -0.8273112, 0.8831814, 0, 0, 0, 1, 1,
0.8733119, -0.168463, 1.18049, 0, 0, 0, 1, 1,
0.8767119, 0.8657769, 0.1244962, 0, 0, 0, 1, 1,
0.8820139, 0.2742703, 3.444199, 0, 0, 0, 1, 1,
0.8833498, 0.06841053, 1.227816, 0, 0, 0, 1, 1,
0.8864225, 0.8697931, 0.347667, 0, 0, 0, 1, 1,
0.8917723, 1.468333, 0.915404, 1, 1, 1, 1, 1,
0.8939241, 2.779026, -0.7206236, 1, 1, 1, 1, 1,
0.8952074, -1.006059, 3.277299, 1, 1, 1, 1, 1,
0.8961192, -0.6265319, 2.966712, 1, 1, 1, 1, 1,
0.8968033, -0.5808817, 2.367822, 1, 1, 1, 1, 1,
0.8985237, -1.05971, 2.369885, 1, 1, 1, 1, 1,
0.8994911, -1.68174, 3.308928, 1, 1, 1, 1, 1,
0.901573, -0.2430578, 3.458568, 1, 1, 1, 1, 1,
0.9084791, 1.088745, 1.510873, 1, 1, 1, 1, 1,
0.9094816, 0.0294171, 2.940406, 1, 1, 1, 1, 1,
0.9120967, 0.1722386, 0.8178381, 1, 1, 1, 1, 1,
0.9122832, -0.710259, 0.5902843, 1, 1, 1, 1, 1,
0.9125687, -1.028196, 3.242945, 1, 1, 1, 1, 1,
0.913985, -1.210417, 2.535051, 1, 1, 1, 1, 1,
0.9156191, 0.7277835, 1.9302, 1, 1, 1, 1, 1,
0.9180049, -0.8818229, 1.501048, 0, 0, 1, 1, 1,
0.9214662, 1.119822, -0.5423795, 1, 0, 0, 1, 1,
0.9282196, -0.4283036, 1.559443, 1, 0, 0, 1, 1,
0.9369417, -0.6127585, 3.465365, 1, 0, 0, 1, 1,
0.9412118, -0.8212262, 2.571945, 1, 0, 0, 1, 1,
0.944889, 0.2534931, 1.713519, 1, 0, 0, 1, 1,
0.945278, -0.4409307, 2.978408, 0, 0, 0, 1, 1,
0.9535232, 1.108288, 2.234382, 0, 0, 0, 1, 1,
0.954448, 0.3845877, 0.409582, 0, 0, 0, 1, 1,
0.9621359, -1.370281, 2.908943, 0, 0, 0, 1, 1,
0.968917, -1.035713, 0.240624, 0, 0, 0, 1, 1,
0.977643, 0.2641717, 2.413662, 0, 0, 0, 1, 1,
0.9870108, -1.553154, 3.061583, 0, 0, 0, 1, 1,
1.003766, -1.76338, 0.4018236, 1, 1, 1, 1, 1,
1.004449, 0.6631686, 1.852589, 1, 1, 1, 1, 1,
1.016773, 1.004753, 0.229305, 1, 1, 1, 1, 1,
1.019907, 2.179639, 1.500147, 1, 1, 1, 1, 1,
1.021522, 1.450287, 1.978975, 1, 1, 1, 1, 1,
1.027864, -0.7315955, 2.45219, 1, 1, 1, 1, 1,
1.030869, -0.8848143, 1.010722, 1, 1, 1, 1, 1,
1.033875, 0.151323, 1.873104, 1, 1, 1, 1, 1,
1.033963, 0.2357737, 2.198443, 1, 1, 1, 1, 1,
1.034366, 1.825192, 1.427246, 1, 1, 1, 1, 1,
1.03579, -0.1593322, 0.6911039, 1, 1, 1, 1, 1,
1.042482, -1.688187, 1.890981, 1, 1, 1, 1, 1,
1.043674, 0.08798613, 1.867953, 1, 1, 1, 1, 1,
1.048233, 1.254104, 1.37883, 1, 1, 1, 1, 1,
1.057483, -2.335047, 2.378218, 1, 1, 1, 1, 1,
1.059124, 0.8495844, 0.9602515, 0, 0, 1, 1, 1,
1.063718, 0.6513171, 0.5655258, 1, 0, 0, 1, 1,
1.0784, -0.5650787, 2.339494, 1, 0, 0, 1, 1,
1.083268, -0.4271746, 2.063564, 1, 0, 0, 1, 1,
1.083706, 1.128123, 1.82716, 1, 0, 0, 1, 1,
1.085323, 0.6004006, 1.27294, 1, 0, 0, 1, 1,
1.091496, 1.544522, 1.226816, 0, 0, 0, 1, 1,
1.094752, 0.9115443, 2.187154, 0, 0, 0, 1, 1,
1.09666, -2.579756, 2.503486, 0, 0, 0, 1, 1,
1.102375, 1.760094, -0.5653013, 0, 0, 0, 1, 1,
1.109416, -0.930428, 2.887838, 0, 0, 0, 1, 1,
1.110866, 0.01069342, 1.627387, 0, 0, 0, 1, 1,
1.129222, 0.01590838, 3.02147, 0, 0, 0, 1, 1,
1.137093, 0.3917329, -0.06519686, 1, 1, 1, 1, 1,
1.139624, -0.297021, 1.634864, 1, 1, 1, 1, 1,
1.143224, -0.5747295, 2.94408, 1, 1, 1, 1, 1,
1.155518, 1.315756, -2.442189, 1, 1, 1, 1, 1,
1.155933, 0.425502, 0.2259267, 1, 1, 1, 1, 1,
1.160831, 0.7587638, 2.859793, 1, 1, 1, 1, 1,
1.173828, 3.127081, -0.7749914, 1, 1, 1, 1, 1,
1.176431, -0.6002131, 1.467303, 1, 1, 1, 1, 1,
1.176908, -0.218745, 1.445154, 1, 1, 1, 1, 1,
1.1809, -1.454814, 3.288502, 1, 1, 1, 1, 1,
1.182989, 0.09249031, 0.1208824, 1, 1, 1, 1, 1,
1.184575, 0.5156853, 0.3870427, 1, 1, 1, 1, 1,
1.19638, -0.2177946, 3.449701, 1, 1, 1, 1, 1,
1.197703, -0.5361958, 0.2407671, 1, 1, 1, 1, 1,
1.197981, -1.405779, 2.973116, 1, 1, 1, 1, 1,
1.207483, 0.286166, 2.051381, 0, 0, 1, 1, 1,
1.213606, 0.5612848, 0.5886483, 1, 0, 0, 1, 1,
1.223039, 0.3637027, 1.7659, 1, 0, 0, 1, 1,
1.22703, 0.1203015, 1.941358, 1, 0, 0, 1, 1,
1.237279, 0.2298315, 0.3373418, 1, 0, 0, 1, 1,
1.23842, -1.402586, 1.856131, 1, 0, 0, 1, 1,
1.255915, -1.308336, 2.412436, 0, 0, 0, 1, 1,
1.268652, -0.9602176, 1.503391, 0, 0, 0, 1, 1,
1.27518, -0.1587391, 2.910798, 0, 0, 0, 1, 1,
1.277797, 0.8588118, 0.661029, 0, 0, 0, 1, 1,
1.281242, 1.315763, 0.5169743, 0, 0, 0, 1, 1,
1.295771, -1.252516, 1.470865, 0, 0, 0, 1, 1,
1.296773, 2.426566, -0.8179935, 0, 0, 0, 1, 1,
1.299814, 0.8296531, 1.389417, 1, 1, 1, 1, 1,
1.300545, 0.1404287, 0.2856798, 1, 1, 1, 1, 1,
1.310438, 0.8655178, -0.1323081, 1, 1, 1, 1, 1,
1.312576, 0.03447361, 2.594224, 1, 1, 1, 1, 1,
1.31691, 0.4631891, 2.516562, 1, 1, 1, 1, 1,
1.326519, 1.655254, 1.245012, 1, 1, 1, 1, 1,
1.345842, 0.06274614, 0.7239169, 1, 1, 1, 1, 1,
1.346247, -0.5828682, 1.467755, 1, 1, 1, 1, 1,
1.34698, -0.5737337, 3.196001, 1, 1, 1, 1, 1,
1.347895, -0.141717, 2.598157, 1, 1, 1, 1, 1,
1.359054, -0.5188861, 2.037297, 1, 1, 1, 1, 1,
1.363478, -0.3544453, 0.3356082, 1, 1, 1, 1, 1,
1.373986, 1.407993, 0.5474919, 1, 1, 1, 1, 1,
1.37765, 1.373153, 0.6385303, 1, 1, 1, 1, 1,
1.378357, 0.1149005, 3.755552, 1, 1, 1, 1, 1,
1.39219, 2.377559, 2.734267, 0, 0, 1, 1, 1,
1.3931, 0.9673018, 0.1389081, 1, 0, 0, 1, 1,
1.396605, 0.2411935, 2.817652, 1, 0, 0, 1, 1,
1.397255, -1.805968, 3.067985, 1, 0, 0, 1, 1,
1.403413, -1.259378, 3.708665, 1, 0, 0, 1, 1,
1.415897, -0.6747987, 2.323713, 1, 0, 0, 1, 1,
1.421448, -0.4129648, 2.672109, 0, 0, 0, 1, 1,
1.426803, 0.1473049, 1.264101, 0, 0, 0, 1, 1,
1.447485, 0.04286603, 2.282423, 0, 0, 0, 1, 1,
1.448142, 0.3700573, 2.600109, 0, 0, 0, 1, 1,
1.453129, -0.2606238, 2.099417, 0, 0, 0, 1, 1,
1.460999, -0.3117878, 0.7322285, 0, 0, 0, 1, 1,
1.461527, -1.003574, 2.979919, 0, 0, 0, 1, 1,
1.473915, -0.04663878, 1.165774, 1, 1, 1, 1, 1,
1.481324, 0.1626081, 1.538536, 1, 1, 1, 1, 1,
1.494054, 0.878015, 0.9806939, 1, 1, 1, 1, 1,
1.500337, 0.7598802, -0.3488905, 1, 1, 1, 1, 1,
1.511005, 0.6355712, 0.5547478, 1, 1, 1, 1, 1,
1.56255, 1.416598, 1.393719, 1, 1, 1, 1, 1,
1.57738, 0.9640294, 0.7296259, 1, 1, 1, 1, 1,
1.593131, -0.2662501, 1.192962, 1, 1, 1, 1, 1,
1.599737, -0.3001762, 0.4810478, 1, 1, 1, 1, 1,
1.611961, 2.384148, -0.7129149, 1, 1, 1, 1, 1,
1.612184, -0.5109788, 1.241345, 1, 1, 1, 1, 1,
1.612483, -0.3266315, 2.479641, 1, 1, 1, 1, 1,
1.623555, 0.1699469, 2.182568, 1, 1, 1, 1, 1,
1.632257, -0.05854824, 0.8827317, 1, 1, 1, 1, 1,
1.646136, 0.5287979, 0.9437534, 1, 1, 1, 1, 1,
1.648216, -0.1668546, 1.292666, 0, 0, 1, 1, 1,
1.66435, 0.9026985, 0.5293593, 1, 0, 0, 1, 1,
1.677072, -0.9926385, 2.588202, 1, 0, 0, 1, 1,
1.686093, 0.04838204, 0.5884548, 1, 0, 0, 1, 1,
1.687308, -0.6496252, 4.039415, 1, 0, 0, 1, 1,
1.694397, 0.5311202, 1.380947, 1, 0, 0, 1, 1,
1.694595, -0.3755274, 1.556042, 0, 0, 0, 1, 1,
1.717507, -0.496863, 3.800063, 0, 0, 0, 1, 1,
1.722739, 0.7840551, 1.877597, 0, 0, 0, 1, 1,
1.732857, -1.901107, 1.733454, 0, 0, 0, 1, 1,
1.761066, 0.543999, 2.632358, 0, 0, 0, 1, 1,
1.770698, -0.2332657, 0.2737612, 0, 0, 0, 1, 1,
1.771744, -0.169666, 2.170612, 0, 0, 0, 1, 1,
1.773444, 0.6873379, 0.8455763, 1, 1, 1, 1, 1,
1.793631, 1.296723, -0.8882562, 1, 1, 1, 1, 1,
1.833201, -0.06043525, 0.8119467, 1, 1, 1, 1, 1,
1.834528, -1.097125, 2.989601, 1, 1, 1, 1, 1,
1.844069, 0.912793, 1.060758, 1, 1, 1, 1, 1,
1.863438, -0.7715641, 2.292879, 1, 1, 1, 1, 1,
1.876348, 1.752083, 2.140889, 1, 1, 1, 1, 1,
1.891623, -0.6857516, 2.439722, 1, 1, 1, 1, 1,
1.899074, -1.263903, 1.401223, 1, 1, 1, 1, 1,
1.903735, 1.663415, 0.5825375, 1, 1, 1, 1, 1,
1.914445, -0.6417418, 1.977832, 1, 1, 1, 1, 1,
1.934043, 0.8624677, 1.716563, 1, 1, 1, 1, 1,
1.945645, 1.40856, 2.790684, 1, 1, 1, 1, 1,
1.950668, -0.2729642, 0.1339257, 1, 1, 1, 1, 1,
1.951013, 0.9637976, 3.488269, 1, 1, 1, 1, 1,
1.97064, -0.8349873, 2.231935, 0, 0, 1, 1, 1,
2.004941, -0.1158354, 1.879278, 1, 0, 0, 1, 1,
2.008374, 1.220006, -0.5705662, 1, 0, 0, 1, 1,
2.062742, -0.02243409, -0.1112438, 1, 0, 0, 1, 1,
2.064141, 0.8810539, 1.463724, 1, 0, 0, 1, 1,
2.064166, -0.4755164, 1.713426, 1, 0, 0, 1, 1,
2.115278, -0.03142267, 1.069292, 0, 0, 0, 1, 1,
2.213707, 0.8590534, 1.73459, 0, 0, 0, 1, 1,
2.291774, 1.073069, 0.2444197, 0, 0, 0, 1, 1,
2.422179, 1.234286, 3.986562, 0, 0, 0, 1, 1,
2.450755, 0.9943566, 0.3230729, 0, 0, 0, 1, 1,
2.52451, 1.504996, 1.073376, 0, 0, 0, 1, 1,
2.557779, 1.375934, -1.064991, 0, 0, 0, 1, 1,
2.623703, -0.4788376, 2.300766, 1, 1, 1, 1, 1,
2.736485, 0.6213703, 1.532949, 1, 1, 1, 1, 1,
2.75079, -0.8016793, 1.340477, 1, 1, 1, 1, 1,
2.793824, 0.2610245, 0.6025763, 1, 1, 1, 1, 1,
2.902482, -0.8684872, -0.5299882, 1, 1, 1, 1, 1,
3.092852, -0.1856886, 0.7195539, 1, 1, 1, 1, 1,
3.393949, 0.9246875, 0.3047042, 1, 1, 1, 1, 1
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
var radius = 9.867567;
var distance = 34.65941;
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
mvMatrix.translate( -0.426946, 0.474582, 0.3098285 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.65941);
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
