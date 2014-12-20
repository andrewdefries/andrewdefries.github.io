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
-3.330851, 0.1009614, -2.183085, 1, 0, 0, 1,
-2.934957, 0.3061415, -1.423952, 1, 0.007843138, 0, 1,
-2.782649, 0.7414255, -0.1756685, 1, 0.01176471, 0, 1,
-2.770157, -0.3459441, -2.049253, 1, 0.01960784, 0, 1,
-2.650495, 0.1421625, -1.541811, 1, 0.02352941, 0, 1,
-2.646956, 0.3553255, -1.204049, 1, 0.03137255, 0, 1,
-2.6224, -1.154185, -2.396746, 1, 0.03529412, 0, 1,
-2.570655, -1.066529, -2.303406, 1, 0.04313726, 0, 1,
-2.418316, -0.5545869, -2.551762, 1, 0.04705882, 0, 1,
-2.393004, 0.7463991, -1.702632, 1, 0.05490196, 0, 1,
-2.372975, 0.2899072, -0.2457042, 1, 0.05882353, 0, 1,
-2.363288, 1.073543, -2.687498, 1, 0.06666667, 0, 1,
-2.35967, -0.8514568, -1.248782, 1, 0.07058824, 0, 1,
-2.261786, -1.061581, -2.033355, 1, 0.07843138, 0, 1,
-2.225947, 0.5011795, -0.9663073, 1, 0.08235294, 0, 1,
-2.18918, 1.570992, -1.359739, 1, 0.09019608, 0, 1,
-2.176906, 0.8372132, -1.592578, 1, 0.09411765, 0, 1,
-2.160725, 1.606506, -1.855482, 1, 0.1019608, 0, 1,
-2.143089, 0.4815212, -2.684968, 1, 0.1098039, 0, 1,
-2.109551, -1.470249, -1.676914, 1, 0.1137255, 0, 1,
-2.109349, -0.2261921, -2.031318, 1, 0.1215686, 0, 1,
-2.1004, 0.6751628, -1.454655, 1, 0.1254902, 0, 1,
-2.032597, 1.142243, -1.376959, 1, 0.1333333, 0, 1,
-2.025706, 0.541123, -3.459615, 1, 0.1372549, 0, 1,
-1.994687, -1.94451, -2.605709, 1, 0.145098, 0, 1,
-1.978158, -1.165181, -3.692923, 1, 0.1490196, 0, 1,
-1.96638, 0.4666631, -1.238642, 1, 0.1568628, 0, 1,
-1.900942, 0.4054061, -1.628056, 1, 0.1607843, 0, 1,
-1.872172, -0.1768405, -2.547924, 1, 0.1686275, 0, 1,
-1.862394, -2.377504, -1.102636, 1, 0.172549, 0, 1,
-1.860004, 2.312704, 1.186472, 1, 0.1803922, 0, 1,
-1.855081, 0.4675829, -1.043243, 1, 0.1843137, 0, 1,
-1.847608, -2.567557, -2.272308, 1, 0.1921569, 0, 1,
-1.846357, -1.60858, -1.249455, 1, 0.1960784, 0, 1,
-1.846232, 0.6584004, -1.233605, 1, 0.2039216, 0, 1,
-1.821487, -0.5492432, -0.4507681, 1, 0.2117647, 0, 1,
-1.817557, 0.4163656, -1.965903, 1, 0.2156863, 0, 1,
-1.7945, -0.03565203, -1.103192, 1, 0.2235294, 0, 1,
-1.789751, -0.6941432, -4.810673, 1, 0.227451, 0, 1,
-1.785115, -1.379891, -2.790304, 1, 0.2352941, 0, 1,
-1.78215, -1.684013, -1.550891, 1, 0.2392157, 0, 1,
-1.774096, -0.5732031, -0.7637928, 1, 0.2470588, 0, 1,
-1.770508, 1.381453, -2.140904, 1, 0.2509804, 0, 1,
-1.763212, 0.2662438, -0.8932406, 1, 0.2588235, 0, 1,
-1.760203, -0.8532958, -1.645726, 1, 0.2627451, 0, 1,
-1.75661, 0.3528322, -1.34104, 1, 0.2705882, 0, 1,
-1.745066, -0.4966146, -2.200695, 1, 0.2745098, 0, 1,
-1.739248, 0.1359902, -0.4010559, 1, 0.282353, 0, 1,
-1.713809, -2.041771, -1.40945, 1, 0.2862745, 0, 1,
-1.696534, -2.301244, -2.866088, 1, 0.2941177, 0, 1,
-1.69142, 1.185394, 0.2374316, 1, 0.3019608, 0, 1,
-1.687514, -0.5626517, -1.48056, 1, 0.3058824, 0, 1,
-1.682901, 0.1284854, 0.3241901, 1, 0.3137255, 0, 1,
-1.648312, 1.330596, -1.501715, 1, 0.3176471, 0, 1,
-1.647515, 1.44166, -0.8064299, 1, 0.3254902, 0, 1,
-1.621374, -0.1991258, -2.030751, 1, 0.3294118, 0, 1,
-1.587132, -1.293063, -1.744555, 1, 0.3372549, 0, 1,
-1.578886, -0.02545451, -2.790512, 1, 0.3411765, 0, 1,
-1.549579, 0.7958633, -2.053314, 1, 0.3490196, 0, 1,
-1.548545, 0.3888783, -1.910144, 1, 0.3529412, 0, 1,
-1.544819, -0.3111573, -2.775782, 1, 0.3607843, 0, 1,
-1.543911, 0.9462672, -3.776668, 1, 0.3647059, 0, 1,
-1.539885, -0.7749497, 0.3196332, 1, 0.372549, 0, 1,
-1.537115, -0.4548604, -1.801516, 1, 0.3764706, 0, 1,
-1.53261, 0.6272012, -1.968813, 1, 0.3843137, 0, 1,
-1.528162, -0.02503318, -0.929767, 1, 0.3882353, 0, 1,
-1.525305, -1.499557, -1.172464, 1, 0.3960784, 0, 1,
-1.52405, -1.365848, -1.911007, 1, 0.4039216, 0, 1,
-1.518005, -0.05462579, -4.749996, 1, 0.4078431, 0, 1,
-1.509519, 0.3742052, -1.234299, 1, 0.4156863, 0, 1,
-1.497197, 0.8759206, -0.11632, 1, 0.4196078, 0, 1,
-1.497003, -1.165768, -1.134319, 1, 0.427451, 0, 1,
-1.495516, -1.18078, -2.723666, 1, 0.4313726, 0, 1,
-1.477797, -1.182724, -3.098738, 1, 0.4392157, 0, 1,
-1.477494, -0.4283449, -2.112554, 1, 0.4431373, 0, 1,
-1.469653, 0.5868386, 0.8394823, 1, 0.4509804, 0, 1,
-1.469423, -1.632926, -1.756968, 1, 0.454902, 0, 1,
-1.456951, 0.09439506, -1.058116, 1, 0.4627451, 0, 1,
-1.447719, 0.2816361, -1.821592, 1, 0.4666667, 0, 1,
-1.445348, 0.7644994, -1.833947, 1, 0.4745098, 0, 1,
-1.441817, 0.4801881, -1.316393, 1, 0.4784314, 0, 1,
-1.439783, 0.1300208, -1.701377, 1, 0.4862745, 0, 1,
-1.428269, 0.06718083, -0.7335247, 1, 0.4901961, 0, 1,
-1.427531, -0.004484512, -1.073268, 1, 0.4980392, 0, 1,
-1.427109, -0.1110963, -1.450974, 1, 0.5058824, 0, 1,
-1.390487, 0.5087578, -1.69222, 1, 0.509804, 0, 1,
-1.385672, 1.122698, -1.689336, 1, 0.5176471, 0, 1,
-1.385197, -0.2805129, -2.551971, 1, 0.5215687, 0, 1,
-1.37681, 0.418238, -1.463593, 1, 0.5294118, 0, 1,
-1.365043, 0.5549479, -0.6267257, 1, 0.5333334, 0, 1,
-1.362628, 1.789087, -1.95043, 1, 0.5411765, 0, 1,
-1.358228, 2.049071, -1.3183, 1, 0.5450981, 0, 1,
-1.357314, 0.9812743, -2.031263, 1, 0.5529412, 0, 1,
-1.34768, 0.8092126, -1.243038, 1, 0.5568628, 0, 1,
-1.344388, 0.2809995, -0.624089, 1, 0.5647059, 0, 1,
-1.332682, -0.1870629, -1.833268, 1, 0.5686275, 0, 1,
-1.329314, -1.37197, -1.843222, 1, 0.5764706, 0, 1,
-1.327493, 0.6636956, 0.3181736, 1, 0.5803922, 0, 1,
-1.32205, 1.147858, -1.009449, 1, 0.5882353, 0, 1,
-1.320878, -1.206193, -3.091155, 1, 0.5921569, 0, 1,
-1.315015, 1.419206, -3.194429, 1, 0.6, 0, 1,
-1.310621, -1.570321, -2.492997, 1, 0.6078432, 0, 1,
-1.303969, -0.6731166, -2.840431, 1, 0.6117647, 0, 1,
-1.29923, 0.4332313, -0.8122902, 1, 0.6196079, 0, 1,
-1.288882, 0.3444603, -2.651461, 1, 0.6235294, 0, 1,
-1.284738, 0.4933434, -1.395676, 1, 0.6313726, 0, 1,
-1.274195, 1.231613, -0.7243879, 1, 0.6352941, 0, 1,
-1.273867, 2.019407, -0.8382573, 1, 0.6431373, 0, 1,
-1.271512, -1.493126, -1.669008, 1, 0.6470588, 0, 1,
-1.268643, -0.3236335, -2.767009, 1, 0.654902, 0, 1,
-1.264954, 0.3248502, -3.463759, 1, 0.6588235, 0, 1,
-1.260335, -0.8046857, -2.334409, 1, 0.6666667, 0, 1,
-1.254788, 0.1588602, -0.7542239, 1, 0.6705883, 0, 1,
-1.245779, -0.03592907, -0.8737246, 1, 0.6784314, 0, 1,
-1.23838, -0.2925843, -3.440022, 1, 0.682353, 0, 1,
-1.236102, -1.464087, -3.133948, 1, 0.6901961, 0, 1,
-1.219689, -1.278594, -4.068107, 1, 0.6941177, 0, 1,
-1.212622, -2.446331, -3.642681, 1, 0.7019608, 0, 1,
-1.209467, -1.665059, -2.72939, 1, 0.7098039, 0, 1,
-1.191795, -0.8594646, -4.179143, 1, 0.7137255, 0, 1,
-1.188178, -0.8153208, -2.60262, 1, 0.7215686, 0, 1,
-1.185059, -0.9981751, -1.97376, 1, 0.7254902, 0, 1,
-1.181401, 1.325261, -0.8896781, 1, 0.7333333, 0, 1,
-1.180599, 0.5726414, -0.09756704, 1, 0.7372549, 0, 1,
-1.177467, 0.6597863, -1.759635, 1, 0.7450981, 0, 1,
-1.174624, -1.453022, -2.573474, 1, 0.7490196, 0, 1,
-1.171114, 1.518404, -0.4870233, 1, 0.7568628, 0, 1,
-1.157153, -0.1826555, -2.785519, 1, 0.7607843, 0, 1,
-1.145675, -2.495242, -3.548986, 1, 0.7686275, 0, 1,
-1.139645, -0.9845283, -0.7940778, 1, 0.772549, 0, 1,
-1.135968, -1.155481, -2.378761, 1, 0.7803922, 0, 1,
-1.1314, 0.4560349, -2.075757, 1, 0.7843137, 0, 1,
-1.125808, 0.1935672, -1.510246, 1, 0.7921569, 0, 1,
-1.1188, -0.07759073, -2.23798, 1, 0.7960784, 0, 1,
-1.114362, 0.6514357, 0.2736212, 1, 0.8039216, 0, 1,
-1.111453, 1.514084, -0.679574, 1, 0.8117647, 0, 1,
-1.102185, 0.6438727, -1.700423, 1, 0.8156863, 0, 1,
-1.099555, 0.0593214, -2.771859, 1, 0.8235294, 0, 1,
-1.095722, 1.66558, -1.89027, 1, 0.827451, 0, 1,
-1.090434, -0.5134451, -1.394994, 1, 0.8352941, 0, 1,
-1.083372, -1.896255, -2.985336, 1, 0.8392157, 0, 1,
-1.081367, -0.5796008, -1.948989, 1, 0.8470588, 0, 1,
-1.080949, 1.537797, 0.1340133, 1, 0.8509804, 0, 1,
-1.079296, 1.410855, 0.1473087, 1, 0.8588235, 0, 1,
-1.078982, 1.429556, -2.081092, 1, 0.8627451, 0, 1,
-1.068393, -0.8000188, -3.061058, 1, 0.8705882, 0, 1,
-1.064478, -0.06986803, -0.9542406, 1, 0.8745098, 0, 1,
-1.06391, 0.7884196, -0.7691087, 1, 0.8823529, 0, 1,
-1.061347, -0.2416565, -2.453507, 1, 0.8862745, 0, 1,
-1.045535, 1.397753, -0.2618097, 1, 0.8941177, 0, 1,
-1.03441, 1.75597, -0.04006937, 1, 0.8980392, 0, 1,
-1.015534, 2.099142, -0.0269253, 1, 0.9058824, 0, 1,
-1.014495, -0.155603, -2.4789, 1, 0.9137255, 0, 1,
-1.014491, -0.4950207, -0.7436283, 1, 0.9176471, 0, 1,
-1.012913, 1.480927, -1.594816, 1, 0.9254902, 0, 1,
-1.011299, 0.01304781, -2.183552, 1, 0.9294118, 0, 1,
-1.004244, 0.3329138, -1.602859, 1, 0.9372549, 0, 1,
-1.001592, 1.507913, -1.077619, 1, 0.9411765, 0, 1,
-1.00112, -0.3636909, -2.714553, 1, 0.9490196, 0, 1,
-0.9932688, 0.03743929, -1.18736, 1, 0.9529412, 0, 1,
-0.9924026, 0.1565627, -1.57102, 1, 0.9607843, 0, 1,
-0.9907391, 0.5634466, -0.8358955, 1, 0.9647059, 0, 1,
-0.9836565, -0.2773782, -1.468306, 1, 0.972549, 0, 1,
-0.9756135, -0.2134448, -1.50474, 1, 0.9764706, 0, 1,
-0.9700782, 1.104629, -1.322959, 1, 0.9843137, 0, 1,
-0.9461958, -1.732541, -3.387662, 1, 0.9882353, 0, 1,
-0.942577, -0.3647582, -2.73242, 1, 0.9960784, 0, 1,
-0.9386562, 0.1931055, -1.954801, 0.9960784, 1, 0, 1,
-0.9386466, 0.8328934, -0.2205993, 0.9921569, 1, 0, 1,
-0.9380326, -0.449217, -3.035318, 0.9843137, 1, 0, 1,
-0.9375904, -1.630744, -1.805724, 0.9803922, 1, 0, 1,
-0.9365591, -1.692559, -2.492643, 0.972549, 1, 0, 1,
-0.9359794, 0.798691, -0.5016472, 0.9686275, 1, 0, 1,
-0.9355664, 0.3085546, -0.9161391, 0.9607843, 1, 0, 1,
-0.9347056, -1.548245, -1.391496, 0.9568627, 1, 0, 1,
-0.9344715, -0.8848787, -2.484588, 0.9490196, 1, 0, 1,
-0.9274447, 0.9067281, -2.025246, 0.945098, 1, 0, 1,
-0.9258381, 0.4946924, -1.751271, 0.9372549, 1, 0, 1,
-0.9181687, 0.2358675, -3.180787, 0.9333333, 1, 0, 1,
-0.9158382, -0.1296448, -1.625848, 0.9254902, 1, 0, 1,
-0.9134691, -1.093946, -2.509282, 0.9215686, 1, 0, 1,
-0.9124302, 0.1612651, -2.731786, 0.9137255, 1, 0, 1,
-0.9110858, 0.6085566, -1.560635, 0.9098039, 1, 0, 1,
-0.9026283, 1.522368, -0.8320379, 0.9019608, 1, 0, 1,
-0.900649, -0.2676741, -2.6391, 0.8941177, 1, 0, 1,
-0.8994488, 0.6440094, -1.578437, 0.8901961, 1, 0, 1,
-0.8989677, -1.076769, -1.59928, 0.8823529, 1, 0, 1,
-0.8968272, -2.653178, -2.556211, 0.8784314, 1, 0, 1,
-0.8897934, 0.2305952, -2.482987, 0.8705882, 1, 0, 1,
-0.8874001, 0.9816833, 0.2775106, 0.8666667, 1, 0, 1,
-0.8873968, 1.078533, -2.168846, 0.8588235, 1, 0, 1,
-0.8865733, 0.330465, -0.6275192, 0.854902, 1, 0, 1,
-0.8822402, 1.189078, 0.4635946, 0.8470588, 1, 0, 1,
-0.8776197, 1.110676, -0.5614461, 0.8431373, 1, 0, 1,
-0.873616, 0.4434288, 0.2638659, 0.8352941, 1, 0, 1,
-0.8716418, -0.006392211, -0.5710747, 0.8313726, 1, 0, 1,
-0.8709825, 0.1278957, -0.402957, 0.8235294, 1, 0, 1,
-0.8568567, -1.496592, -0.1600853, 0.8196079, 1, 0, 1,
-0.8508155, -0.7246842, -2.03553, 0.8117647, 1, 0, 1,
-0.8497956, 1.350299, 2.002191, 0.8078431, 1, 0, 1,
-0.8437501, -0.1361265, -1.025943, 0.8, 1, 0, 1,
-0.8397235, -1.337331, -4.635132, 0.7921569, 1, 0, 1,
-0.8369063, 0.9830356, -0.8474066, 0.7882353, 1, 0, 1,
-0.8327594, -1.769998, -5.003154, 0.7803922, 1, 0, 1,
-0.8301778, -0.06912752, -1.989566, 0.7764706, 1, 0, 1,
-0.8229838, 0.7895473, -1.344981, 0.7686275, 1, 0, 1,
-0.8225299, -0.2559324, -0.8188584, 0.7647059, 1, 0, 1,
-0.8124098, -0.6884823, -1.719193, 0.7568628, 1, 0, 1,
-0.8111616, -0.3760087, -1.741137, 0.7529412, 1, 0, 1,
-0.8105601, -0.2128832, -2.574438, 0.7450981, 1, 0, 1,
-0.8095365, -0.5226836, -2.775699, 0.7411765, 1, 0, 1,
-0.8076106, -0.01177593, -2.549227, 0.7333333, 1, 0, 1,
-0.7932028, 0.5626832, -1.243575, 0.7294118, 1, 0, 1,
-0.7887087, -1.04205, -3.207197, 0.7215686, 1, 0, 1,
-0.7884403, 0.6491843, 0.9523133, 0.7176471, 1, 0, 1,
-0.7876312, -0.07800686, -2.287094, 0.7098039, 1, 0, 1,
-0.7830123, -0.6265719, -1.76859, 0.7058824, 1, 0, 1,
-0.7823325, 0.6362059, -1.841843, 0.6980392, 1, 0, 1,
-0.7792817, 0.6354541, -2.128529, 0.6901961, 1, 0, 1,
-0.7703128, 0.9495816, 0.05058761, 0.6862745, 1, 0, 1,
-0.7678292, 1.033014, 0.2544098, 0.6784314, 1, 0, 1,
-0.7667038, 0.7970062, 0.3631786, 0.6745098, 1, 0, 1,
-0.7658388, 0.5153926, 0.02436735, 0.6666667, 1, 0, 1,
-0.7651104, 0.308741, -2.450676, 0.6627451, 1, 0, 1,
-0.7593695, -0.5996656, -1.374608, 0.654902, 1, 0, 1,
-0.7582785, 1.378999, 1.134143, 0.6509804, 1, 0, 1,
-0.7529548, -0.7401402, -1.216599, 0.6431373, 1, 0, 1,
-0.7450238, -1.459669, -2.829944, 0.6392157, 1, 0, 1,
-0.7384097, -0.9518278, -2.123755, 0.6313726, 1, 0, 1,
-0.7287161, -0.9990357, -2.363016, 0.627451, 1, 0, 1,
-0.7237166, 0.01453947, -2.027597, 0.6196079, 1, 0, 1,
-0.718771, 1.662132, 0.08998322, 0.6156863, 1, 0, 1,
-0.7178382, 0.3324227, -2.435768, 0.6078432, 1, 0, 1,
-0.7132838, 0.04688093, -2.756639, 0.6039216, 1, 0, 1,
-0.7081482, 0.1243106, -2.327412, 0.5960785, 1, 0, 1,
-0.7022781, -0.8158161, -2.275198, 0.5882353, 1, 0, 1,
-0.6974494, -0.8162172, -1.501284, 0.5843138, 1, 0, 1,
-0.692956, -1.202867, -1.959592, 0.5764706, 1, 0, 1,
-0.6825311, -0.06070003, -1.730647, 0.572549, 1, 0, 1,
-0.6771454, 0.2628257, -2.054841, 0.5647059, 1, 0, 1,
-0.6747329, -1.523958, -2.660474, 0.5607843, 1, 0, 1,
-0.6736236, -0.6521545, -3.467165, 0.5529412, 1, 0, 1,
-0.6715906, -0.2649846, -0.9722084, 0.5490196, 1, 0, 1,
-0.671523, 1.372074, -0.5555581, 0.5411765, 1, 0, 1,
-0.6696158, -0.5751978, -2.983349, 0.5372549, 1, 0, 1,
-0.6690888, -1.030874, -3.211031, 0.5294118, 1, 0, 1,
-0.6661977, 0.3670509, -2.226735, 0.5254902, 1, 0, 1,
-0.6653962, 1.015557, 0.6753333, 0.5176471, 1, 0, 1,
-0.665392, 0.1919491, -0.4082437, 0.5137255, 1, 0, 1,
-0.6629415, 0.4970219, -1.582932, 0.5058824, 1, 0, 1,
-0.6507339, 0.9672052, 1.065275, 0.5019608, 1, 0, 1,
-0.6504435, 0.3659193, 0.6677024, 0.4941176, 1, 0, 1,
-0.6496094, -1.406143, -2.960786, 0.4862745, 1, 0, 1,
-0.6372552, -0.5227491, -3.098351, 0.4823529, 1, 0, 1,
-0.6357583, -1.507656, -3.15933, 0.4745098, 1, 0, 1,
-0.6290883, -0.4418416, -2.486909, 0.4705882, 1, 0, 1,
-0.6254737, 0.7632255, -2.059358, 0.4627451, 1, 0, 1,
-0.6251737, 0.3133076, 0.03734981, 0.4588235, 1, 0, 1,
-0.6235605, 0.2386555, -2.239519, 0.4509804, 1, 0, 1,
-0.6232978, -2.131841, -2.231788, 0.4470588, 1, 0, 1,
-0.6190517, -0.5453402, -3.355948, 0.4392157, 1, 0, 1,
-0.6150831, 1.551068, -0.9120052, 0.4352941, 1, 0, 1,
-0.6101745, 0.8967749, -0.5268824, 0.427451, 1, 0, 1,
-0.607905, -0.448547, -3.035983, 0.4235294, 1, 0, 1,
-0.6055056, -0.9283794, -2.372398, 0.4156863, 1, 0, 1,
-0.603422, 0.2130546, -1.917107, 0.4117647, 1, 0, 1,
-0.5976205, -0.8409376, -2.706909, 0.4039216, 1, 0, 1,
-0.5973789, 0.8846695, -1.632981, 0.3960784, 1, 0, 1,
-0.5945793, -0.2494603, -2.53557, 0.3921569, 1, 0, 1,
-0.592965, 0.7121016, 1.568474, 0.3843137, 1, 0, 1,
-0.5894732, -0.5506055, -2.063808, 0.3803922, 1, 0, 1,
-0.5813366, -0.006117182, -0.6449487, 0.372549, 1, 0, 1,
-0.5770836, -0.6512807, -1.968343, 0.3686275, 1, 0, 1,
-0.5734059, 1.628383, 1.450125, 0.3607843, 1, 0, 1,
-0.5692211, -1.600976, -3.089729, 0.3568628, 1, 0, 1,
-0.5523138, -0.3960038, -2.069235, 0.3490196, 1, 0, 1,
-0.5482205, -0.6333433, -1.416972, 0.345098, 1, 0, 1,
-0.542433, -0.6909901, -3.581359, 0.3372549, 1, 0, 1,
-0.5412688, -0.4637883, -2.514782, 0.3333333, 1, 0, 1,
-0.5383475, 0.3924672, -1.777446, 0.3254902, 1, 0, 1,
-0.53508, 1.207467, 0.9541964, 0.3215686, 1, 0, 1,
-0.5331323, -0.8839191, -2.171108, 0.3137255, 1, 0, 1,
-0.5278385, -0.5757042, -2.651736, 0.3098039, 1, 0, 1,
-0.5220006, -0.2413636, -2.285862, 0.3019608, 1, 0, 1,
-0.520557, 0.1262127, -1.013925, 0.2941177, 1, 0, 1,
-0.513019, -2.0864, -3.475041, 0.2901961, 1, 0, 1,
-0.4999343, 0.7941199, 1.61167, 0.282353, 1, 0, 1,
-0.4971171, -0.1527204, -2.671281, 0.2784314, 1, 0, 1,
-0.4927853, -0.2880713, -0.9694179, 0.2705882, 1, 0, 1,
-0.4922508, -0.6300377, -3.032816, 0.2666667, 1, 0, 1,
-0.4916586, 0.6590241, -1.564912, 0.2588235, 1, 0, 1,
-0.486925, 0.9839296, -2.629359, 0.254902, 1, 0, 1,
-0.4857752, -1.277217, -2.248403, 0.2470588, 1, 0, 1,
-0.4839659, -0.683305, -2.524933, 0.2431373, 1, 0, 1,
-0.483221, 1.7294, -0.9557941, 0.2352941, 1, 0, 1,
-0.4766839, 0.2833602, -0.3127024, 0.2313726, 1, 0, 1,
-0.4595434, -0.6869718, -1.318198, 0.2235294, 1, 0, 1,
-0.4586224, 0.9538567, -0.2740555, 0.2196078, 1, 0, 1,
-0.4576142, 1.73036, -0.5644805, 0.2117647, 1, 0, 1,
-0.4574403, 1.064636, -0.4728608, 0.2078431, 1, 0, 1,
-0.4516495, 1.75301, -0.5373011, 0.2, 1, 0, 1,
-0.4510866, -0.8905274, -2.869234, 0.1921569, 1, 0, 1,
-0.4504563, 1.187215, -0.5834858, 0.1882353, 1, 0, 1,
-0.4463084, 0.3780407, -0.1462061, 0.1803922, 1, 0, 1,
-0.4416048, 0.2164739, -0.8142968, 0.1764706, 1, 0, 1,
-0.4406778, 1.789218, 0.9167336, 0.1686275, 1, 0, 1,
-0.427835, -1.000718, -2.796773, 0.1647059, 1, 0, 1,
-0.4274485, -2.238999, -1.531265, 0.1568628, 1, 0, 1,
-0.424909, 2.05685, -1.085126, 0.1529412, 1, 0, 1,
-0.4229278, 0.3123548, -2.290914, 0.145098, 1, 0, 1,
-0.4179534, -1.553848, -2.463085, 0.1411765, 1, 0, 1,
-0.4136909, 0.8040992, -0.2702439, 0.1333333, 1, 0, 1,
-0.4124357, 1.803816, -0.9843016, 0.1294118, 1, 0, 1,
-0.4105672, 0.9332333, 1.083227, 0.1215686, 1, 0, 1,
-0.4070935, -0.3562879, -1.279311, 0.1176471, 1, 0, 1,
-0.4038661, -0.462073, -1.938442, 0.1098039, 1, 0, 1,
-0.4021287, 0.1466476, -0.6181509, 0.1058824, 1, 0, 1,
-0.4018641, 1.473846, -0.1923367, 0.09803922, 1, 0, 1,
-0.4012706, -1.634118, -3.460976, 0.09019608, 1, 0, 1,
-0.4003803, -0.1076451, -1.282298, 0.08627451, 1, 0, 1,
-0.3997273, -1.883777, -2.93395, 0.07843138, 1, 0, 1,
-0.3988582, -0.6944395, -0.9539187, 0.07450981, 1, 0, 1,
-0.3936344, 0.05558348, -1.306517, 0.06666667, 1, 0, 1,
-0.3918788, 0.8642218, -0.9050729, 0.0627451, 1, 0, 1,
-0.3899203, 0.4209005, -2.412154, 0.05490196, 1, 0, 1,
-0.3896139, 0.8146997, -0.1457402, 0.05098039, 1, 0, 1,
-0.3830615, -0.2421844, -4.459143, 0.04313726, 1, 0, 1,
-0.3793689, -2.364898, -2.865915, 0.03921569, 1, 0, 1,
-0.3785, -0.4494605, -2.917118, 0.03137255, 1, 0, 1,
-0.3759344, 0.1948729, -1.293617, 0.02745098, 1, 0, 1,
-0.3754791, -2.362961, -1.988858, 0.01960784, 1, 0, 1,
-0.3641899, 0.4109789, -0.09014608, 0.01568628, 1, 0, 1,
-0.3622586, 0.2913948, -1.116107, 0.007843138, 1, 0, 1,
-0.3612818, -0.2785316, -3.437781, 0.003921569, 1, 0, 1,
-0.3606738, 0.9336486, 0.899991, 0, 1, 0.003921569, 1,
-0.3576289, -1.061719, -2.278974, 0, 1, 0.01176471, 1,
-0.3568889, -0.7270572, -1.929588, 0, 1, 0.01568628, 1,
-0.3560405, -0.458028, -3.455748, 0, 1, 0.02352941, 1,
-0.351674, 0.7909617, 0.704429, 0, 1, 0.02745098, 1,
-0.3484632, -1.863929, -2.204546, 0, 1, 0.03529412, 1,
-0.3473667, 1.589564, -0.2995774, 0, 1, 0.03921569, 1,
-0.3462456, 0.1663722, 0.591148, 0, 1, 0.04705882, 1,
-0.3460201, -0.08409836, -1.909474, 0, 1, 0.05098039, 1,
-0.3426339, 0.5579438, -0.3057074, 0, 1, 0.05882353, 1,
-0.3421776, 0.7708938, 1.278728, 0, 1, 0.0627451, 1,
-0.3417328, 0.4830211, -0.7752216, 0, 1, 0.07058824, 1,
-0.3298846, 0.1282799, -1.509261, 0, 1, 0.07450981, 1,
-0.3293884, -0.3101881, -2.521659, 0, 1, 0.08235294, 1,
-0.3258439, 0.3533755, 0.6252314, 0, 1, 0.08627451, 1,
-0.3230318, -0.6017724, -2.630267, 0, 1, 0.09411765, 1,
-0.3215653, -2.17673, -2.954396, 0, 1, 0.1019608, 1,
-0.3205059, 0.0217436, -1.067581, 0, 1, 0.1058824, 1,
-0.3203478, -0.09763706, -1.121132, 0, 1, 0.1137255, 1,
-0.3129025, 0.374349, -0.7268246, 0, 1, 0.1176471, 1,
-0.3116754, 0.4698137, -0.6553652, 0, 1, 0.1254902, 1,
-0.3079728, -0.5189613, -2.562202, 0, 1, 0.1294118, 1,
-0.3016629, -0.5259656, -1.996809, 0, 1, 0.1372549, 1,
-0.2972208, 0.2524094, -0.190984, 0, 1, 0.1411765, 1,
-0.2937144, 0.5989607, 0.3143882, 0, 1, 0.1490196, 1,
-0.2925735, 0.01197448, -1.638902, 0, 1, 0.1529412, 1,
-0.2908674, -1.226014, -4.151205, 0, 1, 0.1607843, 1,
-0.2882815, 0.07698435, -1.075393, 0, 1, 0.1647059, 1,
-0.2878138, 0.0100147, -2.302852, 0, 1, 0.172549, 1,
-0.2876257, 0.2523103, -1.026662, 0, 1, 0.1764706, 1,
-0.2872079, 1.752567, 0.1132302, 0, 1, 0.1843137, 1,
-0.2862948, 0.7900544, -1.703035, 0, 1, 0.1882353, 1,
-0.284121, -0.1198029, -1.634029, 0, 1, 0.1960784, 1,
-0.2827598, 0.8786767, -2.294454, 0, 1, 0.2039216, 1,
-0.2816085, 2.026732, -0.3521724, 0, 1, 0.2078431, 1,
-0.2792901, -0.2662326, -1.989893, 0, 1, 0.2156863, 1,
-0.2654257, -0.7460991, -3.244462, 0, 1, 0.2196078, 1,
-0.2647232, 0.2090182, -0.3127218, 0, 1, 0.227451, 1,
-0.2607717, 1.113506, -0.943511, 0, 1, 0.2313726, 1,
-0.260189, -1.628926, -2.583556, 0, 1, 0.2392157, 1,
-0.2569469, -0.9757, -3.330564, 0, 1, 0.2431373, 1,
-0.2565048, -0.2057107, -3.628643, 0, 1, 0.2509804, 1,
-0.2517221, -0.4316072, -2.334031, 0, 1, 0.254902, 1,
-0.2508739, 1.708669, -0.836457, 0, 1, 0.2627451, 1,
-0.2461494, -0.502695, -3.438933, 0, 1, 0.2666667, 1,
-0.2451133, 1.241705, 0.4197193, 0, 1, 0.2745098, 1,
-0.2395107, -0.6132899, -1.642435, 0, 1, 0.2784314, 1,
-0.2345663, 0.6811548, -0.8417795, 0, 1, 0.2862745, 1,
-0.2236661, 2.751886, 0.8702946, 0, 1, 0.2901961, 1,
-0.2202401, -0.5526912, -2.593512, 0, 1, 0.2980392, 1,
-0.2167421, 0.09756873, 0.3533128, 0, 1, 0.3058824, 1,
-0.2158324, -1.041567, -3.645112, 0, 1, 0.3098039, 1,
-0.2141249, -0.6834391, -2.804546, 0, 1, 0.3176471, 1,
-0.2131146, -0.6998124, -4.040157, 0, 1, 0.3215686, 1,
-0.2120814, 0.4630979, 0.7268688, 0, 1, 0.3294118, 1,
-0.2108357, -2.063223, -1.358418, 0, 1, 0.3333333, 1,
-0.2021401, -0.8854606, -2.32615, 0, 1, 0.3411765, 1,
-0.2002321, 0.2107573, -0.4908891, 0, 1, 0.345098, 1,
-0.1997423, 0.02241502, -0.9148738, 0, 1, 0.3529412, 1,
-0.1993903, 0.09481924, -0.8271567, 0, 1, 0.3568628, 1,
-0.1945501, 0.8877997, -0.790682, 0, 1, 0.3647059, 1,
-0.1941216, 0.8703213, -1.749741, 0, 1, 0.3686275, 1,
-0.1894239, -0.2275307, -1.876927, 0, 1, 0.3764706, 1,
-0.188638, 1.520158, 0.1830255, 0, 1, 0.3803922, 1,
-0.1879415, -0.1798841, -1.726921, 0, 1, 0.3882353, 1,
-0.1851657, -1.747593, -2.654164, 0, 1, 0.3921569, 1,
-0.1842185, -1.331378, -2.550577, 0, 1, 0.4, 1,
-0.1827076, 0.7374707, 0.1318655, 0, 1, 0.4078431, 1,
-0.1823488, 1.268684, 0.1583797, 0, 1, 0.4117647, 1,
-0.1821755, 0.09976441, -2.485443, 0, 1, 0.4196078, 1,
-0.1796278, -0.1132765, -3.036546, 0, 1, 0.4235294, 1,
-0.1780249, -0.6858935, -3.532558, 0, 1, 0.4313726, 1,
-0.1751412, -0.7764984, -1.888643, 0, 1, 0.4352941, 1,
-0.1747722, 0.5117237, 0.8872424, 0, 1, 0.4431373, 1,
-0.1729966, -0.04677286, -2.14975, 0, 1, 0.4470588, 1,
-0.1697847, 0.2480995, 0.491058, 0, 1, 0.454902, 1,
-0.1669375, 1.734993, -0.9634027, 0, 1, 0.4588235, 1,
-0.1664513, -0.2724091, -3.299459, 0, 1, 0.4666667, 1,
-0.1645103, 0.9145901, -0.991703, 0, 1, 0.4705882, 1,
-0.1629144, 0.4158862, -1.405695, 0, 1, 0.4784314, 1,
-0.1624382, 0.7086629, -0.9704657, 0, 1, 0.4823529, 1,
-0.160783, 0.3831463, 1.092712, 0, 1, 0.4901961, 1,
-0.1561665, 1.951085, 0.7512571, 0, 1, 0.4941176, 1,
-0.1539849, 0.2214214, 0.5821884, 0, 1, 0.5019608, 1,
-0.1502436, -0.9091183, -4.288627, 0, 1, 0.509804, 1,
-0.1323006, 1.249475, -1.185737, 0, 1, 0.5137255, 1,
-0.1298276, -0.7698362, -3.500602, 0, 1, 0.5215687, 1,
-0.1280224, 0.7484961, -0.3700877, 0, 1, 0.5254902, 1,
-0.1272105, -0.311691, -3.175274, 0, 1, 0.5333334, 1,
-0.1257706, 0.06162547, -1.286029, 0, 1, 0.5372549, 1,
-0.1251906, -0.4843201, -2.298071, 0, 1, 0.5450981, 1,
-0.1233946, 1.685901, -1.406744, 0, 1, 0.5490196, 1,
-0.123174, -1.234622, -1.438834, 0, 1, 0.5568628, 1,
-0.1223975, -0.5960346, -3.517315, 0, 1, 0.5607843, 1,
-0.121439, -1.80224, -1.224084, 0, 1, 0.5686275, 1,
-0.1188404, -0.8108504, -3.558002, 0, 1, 0.572549, 1,
-0.1158277, 1.312051, -0.7649658, 0, 1, 0.5803922, 1,
-0.1156022, 0.2238112, -0.1774464, 0, 1, 0.5843138, 1,
-0.1109129, 1.179386, 0.2557649, 0, 1, 0.5921569, 1,
-0.1081566, 1.801183, 0.1928359, 0, 1, 0.5960785, 1,
-0.1078772, 1.291912, 1.090799, 0, 1, 0.6039216, 1,
-0.1077537, -0.3628571, -3.245437, 0, 1, 0.6117647, 1,
-0.1070228, 0.7155768, 0.4734425, 0, 1, 0.6156863, 1,
-0.1055488, 1.040634, 0.2569933, 0, 1, 0.6235294, 1,
-0.1038322, 1.191624, -1.135556, 0, 1, 0.627451, 1,
-0.1035888, -0.5317398, -4.519071, 0, 1, 0.6352941, 1,
-0.1029126, 0.6836641, -0.9844344, 0, 1, 0.6392157, 1,
-0.1019178, 0.6141129, -0.3106544, 0, 1, 0.6470588, 1,
-0.1017374, 0.5751752, -0.6248173, 0, 1, 0.6509804, 1,
-0.09824099, 0.2119648, 0.074839, 0, 1, 0.6588235, 1,
-0.09699926, 0.312598, -1.311749, 0, 1, 0.6627451, 1,
-0.09646094, -1.171183, -1.100904, 0, 1, 0.6705883, 1,
-0.0958617, 0.07092831, -1.099351, 0, 1, 0.6745098, 1,
-0.09362318, 0.7673308, -0.3098286, 0, 1, 0.682353, 1,
-0.08943572, -0.9016522, -4.560762, 0, 1, 0.6862745, 1,
-0.08773312, 0.5131131, -1.101961, 0, 1, 0.6941177, 1,
-0.08526702, 0.1987974, 0.2788206, 0, 1, 0.7019608, 1,
-0.08526634, -0.09313981, -1.825241, 0, 1, 0.7058824, 1,
-0.08261676, 1.521762, 1.075894, 0, 1, 0.7137255, 1,
-0.07565454, 0.9047629, 0.09739884, 0, 1, 0.7176471, 1,
-0.07370792, -0.002257006, -1.73896, 0, 1, 0.7254902, 1,
-0.07289649, -0.8087102, -4.346263, 0, 1, 0.7294118, 1,
-0.07100855, 0.1866124, 1.430833, 0, 1, 0.7372549, 1,
-0.06985606, -2.055044, -3.719296, 0, 1, 0.7411765, 1,
-0.06976347, -0.6344244, -2.580589, 0, 1, 0.7490196, 1,
-0.06549507, -0.6974174, -1.2815, 0, 1, 0.7529412, 1,
-0.06547207, -0.332669, -2.263796, 0, 1, 0.7607843, 1,
-0.06487457, 0.6886972, -0.2225159, 0, 1, 0.7647059, 1,
-0.06403196, -2.468524, -3.952773, 0, 1, 0.772549, 1,
-0.0629059, -0.06897307, -4.090297, 0, 1, 0.7764706, 1,
-0.06038991, 1.82432, 1.104254, 0, 1, 0.7843137, 1,
-0.06032953, 0.2178419, 0.9846745, 0, 1, 0.7882353, 1,
-0.05991758, 2.1089, -1.153032, 0, 1, 0.7960784, 1,
-0.05774725, 1.004735, -0.5439076, 0, 1, 0.8039216, 1,
-0.05602285, 0.5019721, 1.329355, 0, 1, 0.8078431, 1,
-0.05120225, 2.027231, -0.07758605, 0, 1, 0.8156863, 1,
-0.05052919, -0.7240452, -2.565201, 0, 1, 0.8196079, 1,
-0.04835721, 0.3064593, 0.9690198, 0, 1, 0.827451, 1,
-0.04478552, -0.5369955, -5.073606, 0, 1, 0.8313726, 1,
-0.04198878, -0.6771508, -3.056349, 0, 1, 0.8392157, 1,
-0.04039805, -1.20115, -3.524804, 0, 1, 0.8431373, 1,
-0.04036778, 0.5555469, -2.194957, 0, 1, 0.8509804, 1,
-0.03985337, 0.4240051, -1.609845, 0, 1, 0.854902, 1,
-0.030194, 0.7145522, -1.641815, 0, 1, 0.8627451, 1,
-0.02736609, 0.5626073, 0.04577802, 0, 1, 0.8666667, 1,
-0.02060162, 0.0338482, -0.3163858, 0, 1, 0.8745098, 1,
-0.01960796, -0.8399465, -1.637593, 0, 1, 0.8784314, 1,
-0.01613344, -0.5369403, -3.108335, 0, 1, 0.8862745, 1,
-0.01571491, 1.074691, -0.0153436, 0, 1, 0.8901961, 1,
-0.00547105, -1.500162, -2.630284, 0, 1, 0.8980392, 1,
-0.003776529, -0.7087219, -3.405874, 0, 1, 0.9058824, 1,
-0.002945189, -0.2063066, -3.842603, 0, 1, 0.9098039, 1,
-0.002490791, 0.006055435, -0.7040597, 0, 1, 0.9176471, 1,
-0.001321496, -0.7532471, -4.467836, 0, 1, 0.9215686, 1,
-0.0004203118, -0.3546388, -4.180909, 0, 1, 0.9294118, 1,
0.00247373, -1.643115, 2.077815, 0, 1, 0.9333333, 1,
0.003772105, 0.3047191, -0.6801887, 0, 1, 0.9411765, 1,
0.006294718, -0.4222101, 3.530457, 0, 1, 0.945098, 1,
0.009033919, 1.035544, 0.345969, 0, 1, 0.9529412, 1,
0.01012295, -0.05295172, 3.945883, 0, 1, 0.9568627, 1,
0.01505349, -0.1721516, 3.980854, 0, 1, 0.9647059, 1,
0.01539899, -0.3172044, 4.177179, 0, 1, 0.9686275, 1,
0.0249468, -0.5895595, 2.594647, 0, 1, 0.9764706, 1,
0.02723995, 0.7215831, 1.767979, 0, 1, 0.9803922, 1,
0.02914288, 0.9179466, 1.827047, 0, 1, 0.9882353, 1,
0.03208599, 0.6466968, -0.9207624, 0, 1, 0.9921569, 1,
0.03306593, 1.349761, -1.114923, 0, 1, 1, 1,
0.03471588, -0.7490751, 3.54981, 0, 0.9921569, 1, 1,
0.0362256, -1.900041, 5.035649, 0, 0.9882353, 1, 1,
0.03660001, -0.2811701, 2.053597, 0, 0.9803922, 1, 1,
0.0376417, 0.7384924, -0.8171085, 0, 0.9764706, 1, 1,
0.03802442, 0.6096822, -0.4095724, 0, 0.9686275, 1, 1,
0.03861992, 1.192731, 0.8092497, 0, 0.9647059, 1, 1,
0.04118783, 1.26093, -0.7600297, 0, 0.9568627, 1, 1,
0.04449596, 2.274039, 0.4522281, 0, 0.9529412, 1, 1,
0.04477192, 0.2426248, -0.5079094, 0, 0.945098, 1, 1,
0.04627257, -0.8530307, 2.736426, 0, 0.9411765, 1, 1,
0.04801627, -0.5346302, 4.163175, 0, 0.9333333, 1, 1,
0.05133958, -1.303701, 4.533315, 0, 0.9294118, 1, 1,
0.05878743, 1.630546, -0.6148996, 0, 0.9215686, 1, 1,
0.06141751, 0.6659999, -0.2712278, 0, 0.9176471, 1, 1,
0.06252393, -0.121202, 2.80338, 0, 0.9098039, 1, 1,
0.07004026, 1.113214, 0.2662728, 0, 0.9058824, 1, 1,
0.07352331, 0.7822933, 0.1021853, 0, 0.8980392, 1, 1,
0.08699305, 0.1778031, 1.934016, 0, 0.8901961, 1, 1,
0.0889455, 0.2483233, 1.57969, 0, 0.8862745, 1, 1,
0.08924119, 0.5593278, 0.7098671, 0, 0.8784314, 1, 1,
0.09065366, -0.7498668, 3.226913, 0, 0.8745098, 1, 1,
0.09884509, -0.7035024, 1.907059, 0, 0.8666667, 1, 1,
0.1012937, -1.795296, 3.169762, 0, 0.8627451, 1, 1,
0.1017952, -0.2875431, 5.137269, 0, 0.854902, 1, 1,
0.1018236, -1.026869, 1.890973, 0, 0.8509804, 1, 1,
0.1092847, -0.7533531, 2.970938, 0, 0.8431373, 1, 1,
0.1104864, -0.2576884, 2.420321, 0, 0.8392157, 1, 1,
0.1196549, -0.1554622, 0.7868056, 0, 0.8313726, 1, 1,
0.1217302, 0.4360557, -2.479761, 0, 0.827451, 1, 1,
0.1222588, -1.403845, 3.249918, 0, 0.8196079, 1, 1,
0.1246348, 1.034057, -0.1796534, 0, 0.8156863, 1, 1,
0.1263498, -0.430445, 0.3864968, 0, 0.8078431, 1, 1,
0.1301923, 1.192653, 0.5781944, 0, 0.8039216, 1, 1,
0.1318892, 2.032031, -0.5591542, 0, 0.7960784, 1, 1,
0.1365874, 1.656122, 0.5189874, 0, 0.7882353, 1, 1,
0.1387473, -2.240055, 2.972946, 0, 0.7843137, 1, 1,
0.1439386, -0.3662365, 3.116521, 0, 0.7764706, 1, 1,
0.1483907, 1.283406, 0.4052553, 0, 0.772549, 1, 1,
0.1489839, 0.260829, -0.01996999, 0, 0.7647059, 1, 1,
0.1522027, -1.360164, 2.860499, 0, 0.7607843, 1, 1,
0.154892, 1.053959, -0.6497101, 0, 0.7529412, 1, 1,
0.1592624, 1.723149, 0.2017552, 0, 0.7490196, 1, 1,
0.1613326, 0.5082182, -0.9178106, 0, 0.7411765, 1, 1,
0.1666397, -1.787829, 2.082682, 0, 0.7372549, 1, 1,
0.1693577, 0.00554082, 1.11464, 0, 0.7294118, 1, 1,
0.1702721, -0.5795628, 3.329492, 0, 0.7254902, 1, 1,
0.172152, 1.748368, -0.4718705, 0, 0.7176471, 1, 1,
0.1723627, -0.669991, 2.95803, 0, 0.7137255, 1, 1,
0.17336, -1.252219, 2.617361, 0, 0.7058824, 1, 1,
0.1738014, -2.237703, 3.737164, 0, 0.6980392, 1, 1,
0.1747416, -1.157907, 2.93033, 0, 0.6941177, 1, 1,
0.1797076, -0.06220337, -0.5842589, 0, 0.6862745, 1, 1,
0.1806811, 0.3728579, -0.7875355, 0, 0.682353, 1, 1,
0.1823996, -1.79565, 2.076414, 0, 0.6745098, 1, 1,
0.1836745, 1.161268, -0.7756382, 0, 0.6705883, 1, 1,
0.185499, 1.469346, -1.695434, 0, 0.6627451, 1, 1,
0.1860745, 0.8597724, -1.711845, 0, 0.6588235, 1, 1,
0.1891596, -0.2998833, 2.031897, 0, 0.6509804, 1, 1,
0.1897552, -1.225775, 4.033604, 0, 0.6470588, 1, 1,
0.1902554, -0.4653954, 2.289124, 0, 0.6392157, 1, 1,
0.1957685, -0.8706626, 3.039741, 0, 0.6352941, 1, 1,
0.1994111, -0.4148023, 2.795389, 0, 0.627451, 1, 1,
0.2045899, -0.5943714, 2.128274, 0, 0.6235294, 1, 1,
0.2065451, -0.6901041, 2.776466, 0, 0.6156863, 1, 1,
0.2123224, -1.189595, 1.690736, 0, 0.6117647, 1, 1,
0.2157028, 0.1858265, 1.007563, 0, 0.6039216, 1, 1,
0.2159861, 1.193885, -0.07005267, 0, 0.5960785, 1, 1,
0.2161561, -2.176675, 1.335515, 0, 0.5921569, 1, 1,
0.2162328, -0.7602497, 1.547435, 0, 0.5843138, 1, 1,
0.2174274, -0.3616915, 3.083526, 0, 0.5803922, 1, 1,
0.2262568, 1.185317, -0.08426128, 0, 0.572549, 1, 1,
0.2309, -0.2348204, 1.560366, 0, 0.5686275, 1, 1,
0.2312705, -0.232252, 2.840477, 0, 0.5607843, 1, 1,
0.2375905, 1.467214, 1.259451, 0, 0.5568628, 1, 1,
0.2380223, -0.4934969, 2.238025, 0, 0.5490196, 1, 1,
0.2455971, -0.9517665, 4.350589, 0, 0.5450981, 1, 1,
0.2456686, 1.057124, 1.622583, 0, 0.5372549, 1, 1,
0.2467138, 0.1595431, 0.7318183, 0, 0.5333334, 1, 1,
0.2499632, 0.3169922, 0.5958151, 0, 0.5254902, 1, 1,
0.2546336, 0.03430238, 1.897706, 0, 0.5215687, 1, 1,
0.2595147, 1.151857, 0.3245199, 0, 0.5137255, 1, 1,
0.2610954, 0.3613721, 1.817967, 0, 0.509804, 1, 1,
0.262492, 0.9353147, 0.6485019, 0, 0.5019608, 1, 1,
0.267122, -1.402876, 2.333597, 0, 0.4941176, 1, 1,
0.2746366, -0.122609, 2.332342, 0, 0.4901961, 1, 1,
0.2763004, -0.2985671, -1.009298, 0, 0.4823529, 1, 1,
0.2785912, 0.1086897, 2.575193, 0, 0.4784314, 1, 1,
0.2787636, 0.1348188, 2.549126, 0, 0.4705882, 1, 1,
0.2788374, -1.312387, 3.879869, 0, 0.4666667, 1, 1,
0.2826378, -0.5202233, 3.385895, 0, 0.4588235, 1, 1,
0.2826966, -0.5713522, 1.203591, 0, 0.454902, 1, 1,
0.2841814, -0.6585714, 4.375877, 0, 0.4470588, 1, 1,
0.2854471, 1.549625, -1.098409, 0, 0.4431373, 1, 1,
0.2870056, -0.4489281, 2.655143, 0, 0.4352941, 1, 1,
0.2894018, -0.1749618, 2.584574, 0, 0.4313726, 1, 1,
0.2948327, -0.5373372, 2.038027, 0, 0.4235294, 1, 1,
0.2950621, 3.116856, -2.188387, 0, 0.4196078, 1, 1,
0.2991553, 0.05862044, 1.600976, 0, 0.4117647, 1, 1,
0.2991645, -0.4152527, 2.485139, 0, 0.4078431, 1, 1,
0.3015881, -0.6584057, 2.906912, 0, 0.4, 1, 1,
0.3049153, 0.136033, 1.52862, 0, 0.3921569, 1, 1,
0.3083434, -0.1310092, 3.460686, 0, 0.3882353, 1, 1,
0.3086775, 0.02291075, 1.16151, 0, 0.3803922, 1, 1,
0.3097411, 1.322935, 1.339392, 0, 0.3764706, 1, 1,
0.3102829, -0.5647914, 3.143897, 0, 0.3686275, 1, 1,
0.3104213, 1.371997, -0.02762775, 0, 0.3647059, 1, 1,
0.3104802, 0.5837727, -0.1898765, 0, 0.3568628, 1, 1,
0.3114708, 0.5151779, -0.6245442, 0, 0.3529412, 1, 1,
0.3119919, -0.2239862, 3.040985, 0, 0.345098, 1, 1,
0.3136347, -0.5248766, 3.503286, 0, 0.3411765, 1, 1,
0.3142533, -1.268309, 3.486159, 0, 0.3333333, 1, 1,
0.3151392, -0.5524545, 1.593855, 0, 0.3294118, 1, 1,
0.3187092, 0.3793867, 0.8426264, 0, 0.3215686, 1, 1,
0.3242024, -1.212924, 3.461447, 0, 0.3176471, 1, 1,
0.3264337, -1.742937, 3.413547, 0, 0.3098039, 1, 1,
0.3272211, -1.154587, 2.596171, 0, 0.3058824, 1, 1,
0.3283421, -0.9337081, 4.653582, 0, 0.2980392, 1, 1,
0.3285605, -0.8963219, 4.098929, 0, 0.2901961, 1, 1,
0.3295693, -1.326571, 2.072299, 0, 0.2862745, 1, 1,
0.3299514, -0.7420627, 1.476465, 0, 0.2784314, 1, 1,
0.3327576, 0.4151201, 1.068346, 0, 0.2745098, 1, 1,
0.343772, -0.3192214, 2.435083, 0, 0.2666667, 1, 1,
0.3444712, 0.03568313, 2.66327, 0, 0.2627451, 1, 1,
0.345363, 1.274737, 1.467335, 0, 0.254902, 1, 1,
0.3485738, 0.836935, -1.310828, 0, 0.2509804, 1, 1,
0.3531109, -0.3532343, 3.45393, 0, 0.2431373, 1, 1,
0.3539061, 1.046593, 1.766921, 0, 0.2392157, 1, 1,
0.3542335, 1.303079, 1.339831, 0, 0.2313726, 1, 1,
0.3595816, -0.3405943, 1.781777, 0, 0.227451, 1, 1,
0.3617059, 0.7750257, 1.441948, 0, 0.2196078, 1, 1,
0.3617188, 0.07802247, 0.8299723, 0, 0.2156863, 1, 1,
0.3643757, -0.1152248, 1.039795, 0, 0.2078431, 1, 1,
0.3674572, -0.6867975, 3.760812, 0, 0.2039216, 1, 1,
0.3682635, 0.2539863, 1.17399, 0, 0.1960784, 1, 1,
0.3707413, 1.863097, -1.694171, 0, 0.1882353, 1, 1,
0.3712534, -0.6736452, 2.471886, 0, 0.1843137, 1, 1,
0.372881, -0.7886449, 3.504568, 0, 0.1764706, 1, 1,
0.3748437, -0.2438455, 1.639767, 0, 0.172549, 1, 1,
0.3789925, -0.2108273, 2.099912, 0, 0.1647059, 1, 1,
0.3804818, 0.02975554, 3.920563, 0, 0.1607843, 1, 1,
0.3826844, 0.3577403, 2.633723, 0, 0.1529412, 1, 1,
0.3852639, -0.5922235, 3.045909, 0, 0.1490196, 1, 1,
0.3856848, -0.4376677, 2.427798, 0, 0.1411765, 1, 1,
0.3863726, 0.7491282, 1.589503, 0, 0.1372549, 1, 1,
0.3876282, -0.200615, 2.193251, 0, 0.1294118, 1, 1,
0.3891097, 0.6834663, 0.6440699, 0, 0.1254902, 1, 1,
0.3912878, 0.5018048, 2.646603, 0, 0.1176471, 1, 1,
0.3916605, 1.609844, -0.7307982, 0, 0.1137255, 1, 1,
0.397803, 0.02672609, 3.049643, 0, 0.1058824, 1, 1,
0.3989742, 0.6399163, -0.889385, 0, 0.09803922, 1, 1,
0.3996589, 0.1993224, 1.014846, 0, 0.09411765, 1, 1,
0.403254, 1.08453, 1.513638, 0, 0.08627451, 1, 1,
0.4039878, 1.729864, -0.2397843, 0, 0.08235294, 1, 1,
0.4053979, 0.05004488, 0.8073139, 0, 0.07450981, 1, 1,
0.4056268, 0.175321, 1.02788, 0, 0.07058824, 1, 1,
0.405946, 0.02602025, 1.394192, 0, 0.0627451, 1, 1,
0.4066085, 1.307564, 1.119942, 0, 0.05882353, 1, 1,
0.4068397, 0.3305545, 1.278602, 0, 0.05098039, 1, 1,
0.4074138, -0.9031996, 1.087388, 0, 0.04705882, 1, 1,
0.4078874, -0.08782138, 1.828412, 0, 0.03921569, 1, 1,
0.4103845, 1.992576, -0.1029829, 0, 0.03529412, 1, 1,
0.4128869, -0.177544, 2.809226, 0, 0.02745098, 1, 1,
0.4137241, -0.1938584, 1.254077, 0, 0.02352941, 1, 1,
0.4168602, -2.001877, 4.02883, 0, 0.01568628, 1, 1,
0.4209228, -1.461115, 2.275109, 0, 0.01176471, 1, 1,
0.4234706, 0.8462018, 1.373339, 0, 0.003921569, 1, 1,
0.4239664, 0.8456137, -1.590214, 0.003921569, 0, 1, 1,
0.4253971, 0.1642375, 3.10129, 0.007843138, 0, 1, 1,
0.4261015, -0.4944085, 1.808514, 0.01568628, 0, 1, 1,
0.4285491, 0.0848961, 1.191827, 0.01960784, 0, 1, 1,
0.4302283, 0.3403201, 1.072249, 0.02745098, 0, 1, 1,
0.4317685, 1.398803, 1.625022, 0.03137255, 0, 1, 1,
0.4325236, -0.6035277, 3.07645, 0.03921569, 0, 1, 1,
0.4355623, 1.098851, -0.3014183, 0.04313726, 0, 1, 1,
0.4382418, -0.6547012, 4.508852, 0.05098039, 0, 1, 1,
0.4402648, -0.2339092, 0.7596272, 0.05490196, 0, 1, 1,
0.4419915, -0.4441566, 2.037275, 0.0627451, 0, 1, 1,
0.4450412, 0.3941956, 1.398191, 0.06666667, 0, 1, 1,
0.4532926, -0.9436659, 2.270469, 0.07450981, 0, 1, 1,
0.4597213, -0.2648498, 0.07794417, 0.07843138, 0, 1, 1,
0.4606452, 0.01691727, 2.020888, 0.08627451, 0, 1, 1,
0.4654762, 1.535564, 0.5443662, 0.09019608, 0, 1, 1,
0.4674217, -1.01176, 3.483765, 0.09803922, 0, 1, 1,
0.4689706, -0.5613301, 1.700974, 0.1058824, 0, 1, 1,
0.4714982, -0.02888886, 2.145063, 0.1098039, 0, 1, 1,
0.4723873, -0.0265417, 1.595483, 0.1176471, 0, 1, 1,
0.4724336, -0.4137326, 3.282073, 0.1215686, 0, 1, 1,
0.4728841, -0.3452652, 3.036282, 0.1294118, 0, 1, 1,
0.4761007, 0.5787998, -0.0585159, 0.1333333, 0, 1, 1,
0.4768545, 0.1469745, 1.50851, 0.1411765, 0, 1, 1,
0.4771494, 2.55729, 0.4932302, 0.145098, 0, 1, 1,
0.4778956, 0.45717, -0.1653713, 0.1529412, 0, 1, 1,
0.4894634, -0.2552018, 2.797247, 0.1568628, 0, 1, 1,
0.4906531, 0.368248, -0.2571268, 0.1647059, 0, 1, 1,
0.4910899, -0.2401751, 1.698993, 0.1686275, 0, 1, 1,
0.4943012, 0.09000735, 2.065588, 0.1764706, 0, 1, 1,
0.495308, -0.1019293, 1.740536, 0.1803922, 0, 1, 1,
0.4996775, 0.003502232, 1.346617, 0.1882353, 0, 1, 1,
0.5009267, -0.5374134, 1.97736, 0.1921569, 0, 1, 1,
0.503248, 0.7930811, 2.269463, 0.2, 0, 1, 1,
0.5204139, -0.3365375, 5.184974, 0.2078431, 0, 1, 1,
0.5229403, 1.596349, 1.505996, 0.2117647, 0, 1, 1,
0.5294221, 0.9962319, 0.6670732, 0.2196078, 0, 1, 1,
0.5323324, 0.6898634, 0.3719074, 0.2235294, 0, 1, 1,
0.5351385, 2.396257, -1.109591, 0.2313726, 0, 1, 1,
0.541838, -0.833884, 2.457805, 0.2352941, 0, 1, 1,
0.543963, -0.3052622, 0.8821255, 0.2431373, 0, 1, 1,
0.5475633, -0.7900915, 2.886264, 0.2470588, 0, 1, 1,
0.5497715, 2.538138, -2.304956, 0.254902, 0, 1, 1,
0.5512439, -0.220871, 2.745867, 0.2588235, 0, 1, 1,
0.5564408, 1.111884, -2.010033, 0.2666667, 0, 1, 1,
0.5572895, 0.0008039891, -1.098929, 0.2705882, 0, 1, 1,
0.5592524, -0.09309869, 2.954123, 0.2784314, 0, 1, 1,
0.563702, -0.2745832, 2.992506, 0.282353, 0, 1, 1,
0.5645525, 1.100467, -0.08759645, 0.2901961, 0, 1, 1,
0.564752, -1.20711, 3.52993, 0.2941177, 0, 1, 1,
0.5656965, 0.3902365, -0.01052985, 0.3019608, 0, 1, 1,
0.5696043, -1.04115, 2.412566, 0.3098039, 0, 1, 1,
0.5709574, -1.453269, 0.9277561, 0.3137255, 0, 1, 1,
0.5742638, 2.064347, 0.1124677, 0.3215686, 0, 1, 1,
0.5754187, -0.3062943, -0.01621412, 0.3254902, 0, 1, 1,
0.5800505, -1.112603, 2.396884, 0.3333333, 0, 1, 1,
0.580465, -0.3602746, 3.486257, 0.3372549, 0, 1, 1,
0.5809962, -0.560816, 1.116831, 0.345098, 0, 1, 1,
0.5831781, 0.1993504, 0.7022133, 0.3490196, 0, 1, 1,
0.5837241, 0.9367897, 0.01312051, 0.3568628, 0, 1, 1,
0.5845737, 0.2743117, 1.87225, 0.3607843, 0, 1, 1,
0.5873562, 0.8451441, 0.4377339, 0.3686275, 0, 1, 1,
0.5880901, 0.4378172, 3.025246, 0.372549, 0, 1, 1,
0.5885481, -0.8696343, 3.737047, 0.3803922, 0, 1, 1,
0.5962023, -0.5300882, 1.35087, 0.3843137, 0, 1, 1,
0.5984628, 0.05410619, 2.146543, 0.3921569, 0, 1, 1,
0.5997763, -0.2253962, 2.865544, 0.3960784, 0, 1, 1,
0.6046458, 0.5518922, 2.122734, 0.4039216, 0, 1, 1,
0.6148093, 0.3953672, 0.7768662, 0.4117647, 0, 1, 1,
0.6178627, -0.01961965, 0.800163, 0.4156863, 0, 1, 1,
0.6214524, -0.7576713, 2.295441, 0.4235294, 0, 1, 1,
0.6227296, -0.08615294, 2.968357, 0.427451, 0, 1, 1,
0.6239734, -0.6779988, 1.416821, 0.4352941, 0, 1, 1,
0.6297693, -0.8417616, 3.665811, 0.4392157, 0, 1, 1,
0.6378291, 1.162084, -0.7862468, 0.4470588, 0, 1, 1,
0.6387798, -0.671423, 1.979244, 0.4509804, 0, 1, 1,
0.639608, 1.177406, 0.8020424, 0.4588235, 0, 1, 1,
0.6411636, -2.121073, 3.656586, 0.4627451, 0, 1, 1,
0.643365, 1.466184, -0.7026658, 0.4705882, 0, 1, 1,
0.6483201, 0.5074843, 1.347307, 0.4745098, 0, 1, 1,
0.6500365, -0.2093861, 0.8713646, 0.4823529, 0, 1, 1,
0.6583354, -0.8943421, 2.375053, 0.4862745, 0, 1, 1,
0.6585424, 0.8512495, 0.7189364, 0.4941176, 0, 1, 1,
0.6599988, 0.5137651, 2.239799, 0.5019608, 0, 1, 1,
0.6626261, 0.3578807, 1.424046, 0.5058824, 0, 1, 1,
0.6627098, -0.540705, 2.945424, 0.5137255, 0, 1, 1,
0.6633002, 0.4955298, 1.169787, 0.5176471, 0, 1, 1,
0.6654509, 1.817998, 1.87997, 0.5254902, 0, 1, 1,
0.6679582, 0.6826879, 1.075801, 0.5294118, 0, 1, 1,
0.6718838, 0.7329797, 1.42584, 0.5372549, 0, 1, 1,
0.6764972, 1.016605, 0.4265661, 0.5411765, 0, 1, 1,
0.6831489, 1.445523, 1.102005, 0.5490196, 0, 1, 1,
0.6866804, -3.191347, 3.617478, 0.5529412, 0, 1, 1,
0.6871476, 1.214618, 0.1137225, 0.5607843, 0, 1, 1,
0.6900155, -0.3899596, 2.328346, 0.5647059, 0, 1, 1,
0.6915109, 0.5864282, 0.1383929, 0.572549, 0, 1, 1,
0.6944275, 0.3969244, 0.5977626, 0.5764706, 0, 1, 1,
0.7064523, 0.7465464, 1.0117, 0.5843138, 0, 1, 1,
0.7095214, -0.3256438, 1.725121, 0.5882353, 0, 1, 1,
0.7097717, -1.664381, 2.76882, 0.5960785, 0, 1, 1,
0.7188175, 0.4369532, 2.491922, 0.6039216, 0, 1, 1,
0.7286484, -0.7185482, 2.848803, 0.6078432, 0, 1, 1,
0.7299053, -0.2855789, 1.612399, 0.6156863, 0, 1, 1,
0.7325292, 0.6393491, 1.976895, 0.6196079, 0, 1, 1,
0.7331516, 0.4184939, 1.27641, 0.627451, 0, 1, 1,
0.7380272, -1.042176, 1.989613, 0.6313726, 0, 1, 1,
0.7384937, 0.4871333, 0.3716659, 0.6392157, 0, 1, 1,
0.7386094, 1.471869, 1.137546, 0.6431373, 0, 1, 1,
0.7427787, 1.584888, 1.076185, 0.6509804, 0, 1, 1,
0.745064, -1.381359, -0.02005508, 0.654902, 0, 1, 1,
0.7477119, 0.04940317, -0.02891467, 0.6627451, 0, 1, 1,
0.7506633, -1.551609, 3.215216, 0.6666667, 0, 1, 1,
0.7512246, 0.3344733, 2.255978, 0.6745098, 0, 1, 1,
0.7545524, -1.11285, 4.184263, 0.6784314, 0, 1, 1,
0.7552161, 0.4632815, 1.527838, 0.6862745, 0, 1, 1,
0.759921, 1.250907, 2.330514, 0.6901961, 0, 1, 1,
0.7606061, -0.8579638, 2.607439, 0.6980392, 0, 1, 1,
0.7633813, -0.6536602, 1.801121, 0.7058824, 0, 1, 1,
0.7634085, -1.7124, 3.785956, 0.7098039, 0, 1, 1,
0.7640554, 0.8357562, 1.631228, 0.7176471, 0, 1, 1,
0.768325, 0.04920839, 0.3204296, 0.7215686, 0, 1, 1,
0.7807956, 0.5930024, 1.386238, 0.7294118, 0, 1, 1,
0.7858005, 0.3412883, 3.265633, 0.7333333, 0, 1, 1,
0.7877446, 1.319384, 0.2158708, 0.7411765, 0, 1, 1,
0.7897551, -1.09434, 3.991903, 0.7450981, 0, 1, 1,
0.8015645, 0.7941977, 1.059638, 0.7529412, 0, 1, 1,
0.8051248, 0.6988068, 0.5129705, 0.7568628, 0, 1, 1,
0.8055878, -0.4839059, 2.739911, 0.7647059, 0, 1, 1,
0.8069816, -0.3866861, 2.911326, 0.7686275, 0, 1, 1,
0.8122299, 0.1871691, 1.465593, 0.7764706, 0, 1, 1,
0.8125652, 0.2699907, 0.4100811, 0.7803922, 0, 1, 1,
0.8155678, -0.7116627, 3.705812, 0.7882353, 0, 1, 1,
0.8162432, -1.403873, 1.409521, 0.7921569, 0, 1, 1,
0.8168037, -0.2757249, 1.439028, 0.8, 0, 1, 1,
0.8182789, 0.6788923, -0.03678901, 0.8078431, 0, 1, 1,
0.8206926, 0.4254019, 0.2075331, 0.8117647, 0, 1, 1,
0.8235924, -1.356923, 2.195439, 0.8196079, 0, 1, 1,
0.8255292, -0.1011786, 3.063996, 0.8235294, 0, 1, 1,
0.8268232, -0.281392, 1.933295, 0.8313726, 0, 1, 1,
0.8283883, -0.6488937, 0.9563918, 0.8352941, 0, 1, 1,
0.830848, -1.425542, 2.228121, 0.8431373, 0, 1, 1,
0.8314523, -2.857804, 2.444784, 0.8470588, 0, 1, 1,
0.8336621, 0.1359602, 0.7747536, 0.854902, 0, 1, 1,
0.835098, 1.264168, 1.333067, 0.8588235, 0, 1, 1,
0.840602, 0.7304336, -0.284534, 0.8666667, 0, 1, 1,
0.8434817, -0.2188312, 3.28081, 0.8705882, 0, 1, 1,
0.8474128, -0.5173145, 2.988135, 0.8784314, 0, 1, 1,
0.8479986, -2.621979, 3.768448, 0.8823529, 0, 1, 1,
0.8543568, -1.04338, 1.49718, 0.8901961, 0, 1, 1,
0.8545945, -0.5000452, 1.966923, 0.8941177, 0, 1, 1,
0.8610359, -1.204226, 0.5999405, 0.9019608, 0, 1, 1,
0.8685878, 0.09873471, 2.809796, 0.9098039, 0, 1, 1,
0.8793508, -1.292469, 4.32887, 0.9137255, 0, 1, 1,
0.8802968, 1.267186, 0.6809384, 0.9215686, 0, 1, 1,
0.8809838, 0.3048604, 2.718592, 0.9254902, 0, 1, 1,
0.8892391, -0.1643271, 0.962617, 0.9333333, 0, 1, 1,
0.8965043, -1.36296, 1.004559, 0.9372549, 0, 1, 1,
0.9012881, 0.4577025, 0.496754, 0.945098, 0, 1, 1,
0.9030255, 1.073211, 0.9015268, 0.9490196, 0, 1, 1,
0.9030514, -0.751885, 3.482122, 0.9568627, 0, 1, 1,
0.907996, 0.6349707, 1.312186, 0.9607843, 0, 1, 1,
0.9090979, -0.9223847, 1.906758, 0.9686275, 0, 1, 1,
0.911068, -0.4277164, 2.572124, 0.972549, 0, 1, 1,
0.920497, 1.406506, -0.2181114, 0.9803922, 0, 1, 1,
0.9236023, -0.8245773, 1.268081, 0.9843137, 0, 1, 1,
0.9246337, -1.110978, 1.983129, 0.9921569, 0, 1, 1,
0.9335601, 0.5799434, 0.5082546, 0.9960784, 0, 1, 1,
0.936165, 0.6980092, 0.08089671, 1, 0, 0.9960784, 1,
0.9370506, 1.282864, 1.644228, 1, 0, 0.9882353, 1,
0.9378802, 1.398443, 1.954424, 1, 0, 0.9843137, 1,
0.9430575, -0.2323812, 2.791939, 1, 0, 0.9764706, 1,
0.9456252, 0.2028418, 2.019672, 1, 0, 0.972549, 1,
0.9489227, -0.5381048, 4.457834, 1, 0, 0.9647059, 1,
0.950361, -0.1710636, 1.811725, 1, 0, 0.9607843, 1,
0.9507476, -0.5191401, -0.4031034, 1, 0, 0.9529412, 1,
0.9514886, -1.640375, 1.581767, 1, 0, 0.9490196, 1,
0.9526203, 0.2045091, 0.8218377, 1, 0, 0.9411765, 1,
0.957274, 0.7279482, -0.3154397, 1, 0, 0.9372549, 1,
0.9679658, 0.6567567, 0.5990389, 1, 0, 0.9294118, 1,
0.9846905, 0.3618529, 0.778775, 1, 0, 0.9254902, 1,
0.989437, 1.489724, 0.02682423, 1, 0, 0.9176471, 1,
1.002543, 1.673649, 0.9871994, 1, 0, 0.9137255, 1,
1.003103, 1.324123, 0.5608814, 1, 0, 0.9058824, 1,
1.003612, -0.6797201, 1.649506, 1, 0, 0.9019608, 1,
1.006319, 1.225256, 0.9208108, 1, 0, 0.8941177, 1,
1.006735, 0.3298278, -0.8239237, 1, 0, 0.8862745, 1,
1.00917, 0.3915327, 1.473462, 1, 0, 0.8823529, 1,
1.015009, -0.7477982, 0.5604125, 1, 0, 0.8745098, 1,
1.015989, 0.6022307, 2.01065, 1, 0, 0.8705882, 1,
1.029055, 0.4025671, 3.082687, 1, 0, 0.8627451, 1,
1.032182, -1.752008, 3.39048, 1, 0, 0.8588235, 1,
1.03801, -0.1112342, 2.685908, 1, 0, 0.8509804, 1,
1.063221, -1.226037, 1.413803, 1, 0, 0.8470588, 1,
1.065745, -0.5656253, 2.682173, 1, 0, 0.8392157, 1,
1.071504, 0.6586859, 1.633669, 1, 0, 0.8352941, 1,
1.077226, 0.910543, 3.224768, 1, 0, 0.827451, 1,
1.082874, 1.57756, 1.275375, 1, 0, 0.8235294, 1,
1.083479, -1.684372, 3.504424, 1, 0, 0.8156863, 1,
1.083947, 0.515313, 1.716516, 1, 0, 0.8117647, 1,
1.086164, 0.4540787, 1.354489, 1, 0, 0.8039216, 1,
1.087674, 0.7958342, 2.196563, 1, 0, 0.7960784, 1,
1.092653, 1.424871, 1.198809, 1, 0, 0.7921569, 1,
1.098785, -1.400355, 2.168883, 1, 0, 0.7843137, 1,
1.105574, 0.2228993, 1.282468, 1, 0, 0.7803922, 1,
1.107409, -0.04332625, 2.146075, 1, 0, 0.772549, 1,
1.113962, 1.984188, 0.9838306, 1, 0, 0.7686275, 1,
1.115895, -0.3663209, 2.176811, 1, 0, 0.7607843, 1,
1.133959, 0.851454, 1.607094, 1, 0, 0.7568628, 1,
1.138124, 0.2145498, 1.618459, 1, 0, 0.7490196, 1,
1.141807, -0.766402, 1.937276, 1, 0, 0.7450981, 1,
1.14253, 1.093621, 0.852613, 1, 0, 0.7372549, 1,
1.144018, -0.7869557, 2.830317, 1, 0, 0.7333333, 1,
1.145293, 0.1168125, 1.0497, 1, 0, 0.7254902, 1,
1.151832, 0.7619627, -0.4049957, 1, 0, 0.7215686, 1,
1.153424, 0.5131792, 0.4866374, 1, 0, 0.7137255, 1,
1.169436, -0.7673842, 2.20756, 1, 0, 0.7098039, 1,
1.174079, 1.265074, 1.170987, 1, 0, 0.7019608, 1,
1.180028, -2.628142, 2.148935, 1, 0, 0.6941177, 1,
1.186924, -0.1482779, 0.867196, 1, 0, 0.6901961, 1,
1.187204, 0.1319152, -0.4587609, 1, 0, 0.682353, 1,
1.187767, -0.3861334, 1.817575, 1, 0, 0.6784314, 1,
1.225232, -0.7267916, 2.596733, 1, 0, 0.6705883, 1,
1.228282, -0.9047034, 2.550647, 1, 0, 0.6666667, 1,
1.232314, 0.688546, 1.835013, 1, 0, 0.6588235, 1,
1.232866, 0.7931963, 2.478982, 1, 0, 0.654902, 1,
1.234578, 0.3159516, 1.610696, 1, 0, 0.6470588, 1,
1.234597, -0.8169715, 2.205956, 1, 0, 0.6431373, 1,
1.262379, 0.9950338, -0.3105693, 1, 0, 0.6352941, 1,
1.262681, 1.322309, 0.4434541, 1, 0, 0.6313726, 1,
1.263092, 0.1104036, 2.105082, 1, 0, 0.6235294, 1,
1.274811, -0.9311346, 1.994556, 1, 0, 0.6196079, 1,
1.289215, 0.695837, 0.799404, 1, 0, 0.6117647, 1,
1.293102, -1.151604, 2.653664, 1, 0, 0.6078432, 1,
1.293719, -1.120231, 3.039016, 1, 0, 0.6, 1,
1.29871, 0.05432257, 2.513035, 1, 0, 0.5921569, 1,
1.308167, -0.3486481, 1.915661, 1, 0, 0.5882353, 1,
1.311954, -2.584915, 3.796078, 1, 0, 0.5803922, 1,
1.317181, -0.2822126, 0.9065387, 1, 0, 0.5764706, 1,
1.318767, 0.7542942, -0.3638918, 1, 0, 0.5686275, 1,
1.319247, 1.839582, -0.8381383, 1, 0, 0.5647059, 1,
1.323267, 0.8459546, 0.3878758, 1, 0, 0.5568628, 1,
1.328705, 0.2968283, 2.664646, 1, 0, 0.5529412, 1,
1.328854, 0.3896007, 1.203801, 1, 0, 0.5450981, 1,
1.32992, -0.4184949, 4.072033, 1, 0, 0.5411765, 1,
1.332519, 1.592884, 1.330899, 1, 0, 0.5333334, 1,
1.334627, 1.078285, 1.470737, 1, 0, 0.5294118, 1,
1.346996, 0.6364188, 0.894249, 1, 0, 0.5215687, 1,
1.350435, 1.076556, 1.360214, 1, 0, 0.5176471, 1,
1.352692, -2.043423, 2.935423, 1, 0, 0.509804, 1,
1.378053, -1.883458, 0.584709, 1, 0, 0.5058824, 1,
1.386568, -0.1597344, 1.675488, 1, 0, 0.4980392, 1,
1.430121, 2.143651, 0.3207158, 1, 0, 0.4901961, 1,
1.430496, 0.04488126, 0.7117389, 1, 0, 0.4862745, 1,
1.431827, 1.632593, 1.88026, 1, 0, 0.4784314, 1,
1.434249, -0.1277558, 2.35947, 1, 0, 0.4745098, 1,
1.440347, 3.42377, 0.7591691, 1, 0, 0.4666667, 1,
1.450174, -1.063534, 3.295404, 1, 0, 0.4627451, 1,
1.456245, -0.7012302, 4.087807, 1, 0, 0.454902, 1,
1.465783, 1.293313, 1.378301, 1, 0, 0.4509804, 1,
1.472083, -0.9920155, 2.944669, 1, 0, 0.4431373, 1,
1.483902, -1.432223, 2.625575, 1, 0, 0.4392157, 1,
1.488136, -0.2325728, 0.8756382, 1, 0, 0.4313726, 1,
1.489478, -1.480242, 3.170009, 1, 0, 0.427451, 1,
1.501291, 0.6064956, 0.8297095, 1, 0, 0.4196078, 1,
1.509533, -0.5857298, 0.4738044, 1, 0, 0.4156863, 1,
1.514824, 1.854026, 0.09025351, 1, 0, 0.4078431, 1,
1.530336, -0.1272112, 3.568945, 1, 0, 0.4039216, 1,
1.536791, -0.319179, 2.398239, 1, 0, 0.3960784, 1,
1.544771, 3.25708, 1.047908, 1, 0, 0.3882353, 1,
1.551952, 0.4322984, 2.811091, 1, 0, 0.3843137, 1,
1.552813, 0.5267086, -0.3331913, 1, 0, 0.3764706, 1,
1.554517, 1.098493, 1.617715, 1, 0, 0.372549, 1,
1.558877, -0.7066061, 1.537002, 1, 0, 0.3647059, 1,
1.56814, 1.852644, 1.704177, 1, 0, 0.3607843, 1,
1.569064, 1.465618, 0.7591947, 1, 0, 0.3529412, 1,
1.571559, 1.128964, 1.051627, 1, 0, 0.3490196, 1,
1.581903, -1.064407, 3.943866, 1, 0, 0.3411765, 1,
1.591192, -0.8986051, 2.565303, 1, 0, 0.3372549, 1,
1.598918, 0.1581116, 0.9467528, 1, 0, 0.3294118, 1,
1.599346, -0.125365, 2.406974, 1, 0, 0.3254902, 1,
1.604828, -0.7028945, 2.125914, 1, 0, 0.3176471, 1,
1.611357, -0.8638506, 3.003668, 1, 0, 0.3137255, 1,
1.621107, -0.7148588, 1.725833, 1, 0, 0.3058824, 1,
1.62146, -1.042332, 2.436369, 1, 0, 0.2980392, 1,
1.627849, -0.158998, -0.01167944, 1, 0, 0.2941177, 1,
1.646902, -0.6909689, 2.526445, 1, 0, 0.2862745, 1,
1.648177, 0.997396, -0.29504, 1, 0, 0.282353, 1,
1.653309, -2.095329, 2.152195, 1, 0, 0.2745098, 1,
1.663904, 0.730657, 2.026054, 1, 0, 0.2705882, 1,
1.665831, -0.2027273, 2.713443, 1, 0, 0.2627451, 1,
1.695035, 0.6323892, 1.93871, 1, 0, 0.2588235, 1,
1.707176, -0.06764817, 1.001113, 1, 0, 0.2509804, 1,
1.718946, -0.3101406, 1.352999, 1, 0, 0.2470588, 1,
1.727706, 0.08739575, 0.477995, 1, 0, 0.2392157, 1,
1.730245, 1.615181, 0.02298237, 1, 0, 0.2352941, 1,
1.747827, 0.5852289, 0.04788588, 1, 0, 0.227451, 1,
1.779549, 2.256693, -0.3843302, 1, 0, 0.2235294, 1,
1.78761, 0.7008118, 1.993319, 1, 0, 0.2156863, 1,
1.803156, -0.6285593, 1.573495, 1, 0, 0.2117647, 1,
1.846407, -1.6033, 0.417669, 1, 0, 0.2039216, 1,
1.862044, -0.004565797, 1.700434, 1, 0, 0.1960784, 1,
1.863597, -1.272862, 1.106291, 1, 0, 0.1921569, 1,
1.871609, -1.990051, 3.184204, 1, 0, 0.1843137, 1,
1.873078, -0.8571783, 3.570418, 1, 0, 0.1803922, 1,
1.87867, -0.7014658, 2.890732, 1, 0, 0.172549, 1,
1.906536, -0.5948762, 1.697819, 1, 0, 0.1686275, 1,
1.936084, -1.628031, 1.620134, 1, 0, 0.1607843, 1,
1.937244, 0.4823915, 1.851378, 1, 0, 0.1568628, 1,
1.964708, 1.521964, 0.02236048, 1, 0, 0.1490196, 1,
1.984654, 0.7983422, -0.06510359, 1, 0, 0.145098, 1,
1.994832, -1.540495, 3.788216, 1, 0, 0.1372549, 1,
2.019963, 0.5337952, 1.705885, 1, 0, 0.1333333, 1,
2.034868, 0.1025422, 1.441672, 1, 0, 0.1254902, 1,
2.057974, -0.3738891, 1.383682, 1, 0, 0.1215686, 1,
2.073566, -1.058244, 1.00628, 1, 0, 0.1137255, 1,
2.089131, -0.876151, 0.3850716, 1, 0, 0.1098039, 1,
2.098284, 0.2722166, 2.170239, 1, 0, 0.1019608, 1,
2.098535, 2.286956, 0.566667, 1, 0, 0.09411765, 1,
2.104632, -0.2128138, 1.016822, 1, 0, 0.09019608, 1,
2.169636, -1.838071, 3.501245, 1, 0, 0.08235294, 1,
2.19478, -1.366299, 2.200171, 1, 0, 0.07843138, 1,
2.202039, -0.1642026, -1.287677, 1, 0, 0.07058824, 1,
2.26106, -0.7042118, 2.881158, 1, 0, 0.06666667, 1,
2.506101, -0.1190651, 0.8013182, 1, 0, 0.05882353, 1,
2.517451, -0.04711277, 2.24396, 1, 0, 0.05490196, 1,
2.601801, 0.5347216, 2.339768, 1, 0, 0.04705882, 1,
2.657296, -0.1723766, 1.46141, 1, 0, 0.04313726, 1,
2.675611, 0.3617757, 3.326706, 1, 0, 0.03529412, 1,
2.707329, -1.676346, 1.672351, 1, 0, 0.03137255, 1,
2.756961, 1.125433, 1.248511, 1, 0, 0.02352941, 1,
2.781043, 0.495487, 0.4812667, 1, 0, 0.01960784, 1,
2.783855, 0.4230586, 3.02509, 1, 0, 0.01176471, 1,
2.81044, -0.3895219, 0.1550208, 1, 0, 0.007843138, 1
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
-0.2602056, -4.31261, -6.812435, 0, -0.5, 0.5, 0.5,
-0.2602056, -4.31261, -6.812435, 1, -0.5, 0.5, 0.5,
-0.2602056, -4.31261, -6.812435, 1, 1.5, 0.5, 0.5,
-0.2602056, -4.31261, -6.812435, 0, 1.5, 0.5, 0.5
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
-4.3718, 0.1162115, -6.812435, 0, -0.5, 0.5, 0.5,
-4.3718, 0.1162115, -6.812435, 1, -0.5, 0.5, 0.5,
-4.3718, 0.1162115, -6.812435, 1, 1.5, 0.5, 0.5,
-4.3718, 0.1162115, -6.812435, 0, 1.5, 0.5, 0.5
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
-4.3718, -4.31261, 0.05568385, 0, -0.5, 0.5, 0.5,
-4.3718, -4.31261, 0.05568385, 1, -0.5, 0.5, 0.5,
-4.3718, -4.31261, 0.05568385, 1, 1.5, 0.5, 0.5,
-4.3718, -4.31261, 0.05568385, 0, 1.5, 0.5, 0.5
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
-3, -3.290574, -5.227485,
2, -3.290574, -5.227485,
-3, -3.290574, -5.227485,
-3, -3.460913, -5.491643,
-2, -3.290574, -5.227485,
-2, -3.460913, -5.491643,
-1, -3.290574, -5.227485,
-1, -3.460913, -5.491643,
0, -3.290574, -5.227485,
0, -3.460913, -5.491643,
1, -3.290574, -5.227485,
1, -3.460913, -5.491643,
2, -3.290574, -5.227485,
2, -3.460913, -5.491643
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
-3, -3.801592, -6.01996, 0, -0.5, 0.5, 0.5,
-3, -3.801592, -6.01996, 1, -0.5, 0.5, 0.5,
-3, -3.801592, -6.01996, 1, 1.5, 0.5, 0.5,
-3, -3.801592, -6.01996, 0, 1.5, 0.5, 0.5,
-2, -3.801592, -6.01996, 0, -0.5, 0.5, 0.5,
-2, -3.801592, -6.01996, 1, -0.5, 0.5, 0.5,
-2, -3.801592, -6.01996, 1, 1.5, 0.5, 0.5,
-2, -3.801592, -6.01996, 0, 1.5, 0.5, 0.5,
-1, -3.801592, -6.01996, 0, -0.5, 0.5, 0.5,
-1, -3.801592, -6.01996, 1, -0.5, 0.5, 0.5,
-1, -3.801592, -6.01996, 1, 1.5, 0.5, 0.5,
-1, -3.801592, -6.01996, 0, 1.5, 0.5, 0.5,
0, -3.801592, -6.01996, 0, -0.5, 0.5, 0.5,
0, -3.801592, -6.01996, 1, -0.5, 0.5, 0.5,
0, -3.801592, -6.01996, 1, 1.5, 0.5, 0.5,
0, -3.801592, -6.01996, 0, 1.5, 0.5, 0.5,
1, -3.801592, -6.01996, 0, -0.5, 0.5, 0.5,
1, -3.801592, -6.01996, 1, -0.5, 0.5, 0.5,
1, -3.801592, -6.01996, 1, 1.5, 0.5, 0.5,
1, -3.801592, -6.01996, 0, 1.5, 0.5, 0.5,
2, -3.801592, -6.01996, 0, -0.5, 0.5, 0.5,
2, -3.801592, -6.01996, 1, -0.5, 0.5, 0.5,
2, -3.801592, -6.01996, 1, 1.5, 0.5, 0.5,
2, -3.801592, -6.01996, 0, 1.5, 0.5, 0.5
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
-3.422971, -3, -5.227485,
-3.422971, 3, -5.227485,
-3.422971, -3, -5.227485,
-3.581109, -3, -5.491643,
-3.422971, -2, -5.227485,
-3.581109, -2, -5.491643,
-3.422971, -1, -5.227485,
-3.581109, -1, -5.491643,
-3.422971, 0, -5.227485,
-3.581109, 0, -5.491643,
-3.422971, 1, -5.227485,
-3.581109, 1, -5.491643,
-3.422971, 2, -5.227485,
-3.581109, 2, -5.491643,
-3.422971, 3, -5.227485,
-3.581109, 3, -5.491643
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
-3.897385, -3, -6.01996, 0, -0.5, 0.5, 0.5,
-3.897385, -3, -6.01996, 1, -0.5, 0.5, 0.5,
-3.897385, -3, -6.01996, 1, 1.5, 0.5, 0.5,
-3.897385, -3, -6.01996, 0, 1.5, 0.5, 0.5,
-3.897385, -2, -6.01996, 0, -0.5, 0.5, 0.5,
-3.897385, -2, -6.01996, 1, -0.5, 0.5, 0.5,
-3.897385, -2, -6.01996, 1, 1.5, 0.5, 0.5,
-3.897385, -2, -6.01996, 0, 1.5, 0.5, 0.5,
-3.897385, -1, -6.01996, 0, -0.5, 0.5, 0.5,
-3.897385, -1, -6.01996, 1, -0.5, 0.5, 0.5,
-3.897385, -1, -6.01996, 1, 1.5, 0.5, 0.5,
-3.897385, -1, -6.01996, 0, 1.5, 0.5, 0.5,
-3.897385, 0, -6.01996, 0, -0.5, 0.5, 0.5,
-3.897385, 0, -6.01996, 1, -0.5, 0.5, 0.5,
-3.897385, 0, -6.01996, 1, 1.5, 0.5, 0.5,
-3.897385, 0, -6.01996, 0, 1.5, 0.5, 0.5,
-3.897385, 1, -6.01996, 0, -0.5, 0.5, 0.5,
-3.897385, 1, -6.01996, 1, -0.5, 0.5, 0.5,
-3.897385, 1, -6.01996, 1, 1.5, 0.5, 0.5,
-3.897385, 1, -6.01996, 0, 1.5, 0.5, 0.5,
-3.897385, 2, -6.01996, 0, -0.5, 0.5, 0.5,
-3.897385, 2, -6.01996, 1, -0.5, 0.5, 0.5,
-3.897385, 2, -6.01996, 1, 1.5, 0.5, 0.5,
-3.897385, 2, -6.01996, 0, 1.5, 0.5, 0.5,
-3.897385, 3, -6.01996, 0, -0.5, 0.5, 0.5,
-3.897385, 3, -6.01996, 1, -0.5, 0.5, 0.5,
-3.897385, 3, -6.01996, 1, 1.5, 0.5, 0.5,
-3.897385, 3, -6.01996, 0, 1.5, 0.5, 0.5
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
-3.422971, -3.290574, -4,
-3.422971, -3.290574, 4,
-3.422971, -3.290574, -4,
-3.581109, -3.460913, -4,
-3.422971, -3.290574, -2,
-3.581109, -3.460913, -2,
-3.422971, -3.290574, 0,
-3.581109, -3.460913, 0,
-3.422971, -3.290574, 2,
-3.581109, -3.460913, 2,
-3.422971, -3.290574, 4,
-3.581109, -3.460913, 4
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
-3.897385, -3.801592, -4, 0, -0.5, 0.5, 0.5,
-3.897385, -3.801592, -4, 1, -0.5, 0.5, 0.5,
-3.897385, -3.801592, -4, 1, 1.5, 0.5, 0.5,
-3.897385, -3.801592, -4, 0, 1.5, 0.5, 0.5,
-3.897385, -3.801592, -2, 0, -0.5, 0.5, 0.5,
-3.897385, -3.801592, -2, 1, -0.5, 0.5, 0.5,
-3.897385, -3.801592, -2, 1, 1.5, 0.5, 0.5,
-3.897385, -3.801592, -2, 0, 1.5, 0.5, 0.5,
-3.897385, -3.801592, 0, 0, -0.5, 0.5, 0.5,
-3.897385, -3.801592, 0, 1, -0.5, 0.5, 0.5,
-3.897385, -3.801592, 0, 1, 1.5, 0.5, 0.5,
-3.897385, -3.801592, 0, 0, 1.5, 0.5, 0.5,
-3.897385, -3.801592, 2, 0, -0.5, 0.5, 0.5,
-3.897385, -3.801592, 2, 1, -0.5, 0.5, 0.5,
-3.897385, -3.801592, 2, 1, 1.5, 0.5, 0.5,
-3.897385, -3.801592, 2, 0, 1.5, 0.5, 0.5,
-3.897385, -3.801592, 4, 0, -0.5, 0.5, 0.5,
-3.897385, -3.801592, 4, 1, -0.5, 0.5, 0.5,
-3.897385, -3.801592, 4, 1, 1.5, 0.5, 0.5,
-3.897385, -3.801592, 4, 0, 1.5, 0.5, 0.5
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
-3.422971, -3.290574, -5.227485,
-3.422971, 3.522997, -5.227485,
-3.422971, -3.290574, 5.338852,
-3.422971, 3.522997, 5.338852,
-3.422971, -3.290574, -5.227485,
-3.422971, -3.290574, 5.338852,
-3.422971, 3.522997, -5.227485,
-3.422971, 3.522997, 5.338852,
-3.422971, -3.290574, -5.227485,
2.90256, -3.290574, -5.227485,
-3.422971, -3.290574, 5.338852,
2.90256, -3.290574, 5.338852,
-3.422971, 3.522997, -5.227485,
2.90256, 3.522997, -5.227485,
-3.422971, 3.522997, 5.338852,
2.90256, 3.522997, 5.338852,
2.90256, -3.290574, -5.227485,
2.90256, 3.522997, -5.227485,
2.90256, -3.290574, 5.338852,
2.90256, 3.522997, 5.338852,
2.90256, -3.290574, -5.227485,
2.90256, -3.290574, 5.338852,
2.90256, 3.522997, -5.227485,
2.90256, 3.522997, 5.338852
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
var radius = 7.515377;
var distance = 33.43676;
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
mvMatrix.translate( 0.2602056, -0.1162115, -0.05568385 );
mvMatrix.scale( 1.2846, 1.192587, 0.7690246 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.43676);
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
pyridine<-read.table("pyridine.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-pyridine$V2
```

```
## Error in eval(expr, envir, enclos): object 'pyridine' not found
```

```r
y<-pyridine$V3
```

```
## Error in eval(expr, envir, enclos): object 'pyridine' not found
```

```r
z<-pyridine$V4
```

```
## Error in eval(expr, envir, enclos): object 'pyridine' not found
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
-3.330851, 0.1009614, -2.183085, 0, 0, 1, 1, 1,
-2.934957, 0.3061415, -1.423952, 1, 0, 0, 1, 1,
-2.782649, 0.7414255, -0.1756685, 1, 0, 0, 1, 1,
-2.770157, -0.3459441, -2.049253, 1, 0, 0, 1, 1,
-2.650495, 0.1421625, -1.541811, 1, 0, 0, 1, 1,
-2.646956, 0.3553255, -1.204049, 1, 0, 0, 1, 1,
-2.6224, -1.154185, -2.396746, 0, 0, 0, 1, 1,
-2.570655, -1.066529, -2.303406, 0, 0, 0, 1, 1,
-2.418316, -0.5545869, -2.551762, 0, 0, 0, 1, 1,
-2.393004, 0.7463991, -1.702632, 0, 0, 0, 1, 1,
-2.372975, 0.2899072, -0.2457042, 0, 0, 0, 1, 1,
-2.363288, 1.073543, -2.687498, 0, 0, 0, 1, 1,
-2.35967, -0.8514568, -1.248782, 0, 0, 0, 1, 1,
-2.261786, -1.061581, -2.033355, 1, 1, 1, 1, 1,
-2.225947, 0.5011795, -0.9663073, 1, 1, 1, 1, 1,
-2.18918, 1.570992, -1.359739, 1, 1, 1, 1, 1,
-2.176906, 0.8372132, -1.592578, 1, 1, 1, 1, 1,
-2.160725, 1.606506, -1.855482, 1, 1, 1, 1, 1,
-2.143089, 0.4815212, -2.684968, 1, 1, 1, 1, 1,
-2.109551, -1.470249, -1.676914, 1, 1, 1, 1, 1,
-2.109349, -0.2261921, -2.031318, 1, 1, 1, 1, 1,
-2.1004, 0.6751628, -1.454655, 1, 1, 1, 1, 1,
-2.032597, 1.142243, -1.376959, 1, 1, 1, 1, 1,
-2.025706, 0.541123, -3.459615, 1, 1, 1, 1, 1,
-1.994687, -1.94451, -2.605709, 1, 1, 1, 1, 1,
-1.978158, -1.165181, -3.692923, 1, 1, 1, 1, 1,
-1.96638, 0.4666631, -1.238642, 1, 1, 1, 1, 1,
-1.900942, 0.4054061, -1.628056, 1, 1, 1, 1, 1,
-1.872172, -0.1768405, -2.547924, 0, 0, 1, 1, 1,
-1.862394, -2.377504, -1.102636, 1, 0, 0, 1, 1,
-1.860004, 2.312704, 1.186472, 1, 0, 0, 1, 1,
-1.855081, 0.4675829, -1.043243, 1, 0, 0, 1, 1,
-1.847608, -2.567557, -2.272308, 1, 0, 0, 1, 1,
-1.846357, -1.60858, -1.249455, 1, 0, 0, 1, 1,
-1.846232, 0.6584004, -1.233605, 0, 0, 0, 1, 1,
-1.821487, -0.5492432, -0.4507681, 0, 0, 0, 1, 1,
-1.817557, 0.4163656, -1.965903, 0, 0, 0, 1, 1,
-1.7945, -0.03565203, -1.103192, 0, 0, 0, 1, 1,
-1.789751, -0.6941432, -4.810673, 0, 0, 0, 1, 1,
-1.785115, -1.379891, -2.790304, 0, 0, 0, 1, 1,
-1.78215, -1.684013, -1.550891, 0, 0, 0, 1, 1,
-1.774096, -0.5732031, -0.7637928, 1, 1, 1, 1, 1,
-1.770508, 1.381453, -2.140904, 1, 1, 1, 1, 1,
-1.763212, 0.2662438, -0.8932406, 1, 1, 1, 1, 1,
-1.760203, -0.8532958, -1.645726, 1, 1, 1, 1, 1,
-1.75661, 0.3528322, -1.34104, 1, 1, 1, 1, 1,
-1.745066, -0.4966146, -2.200695, 1, 1, 1, 1, 1,
-1.739248, 0.1359902, -0.4010559, 1, 1, 1, 1, 1,
-1.713809, -2.041771, -1.40945, 1, 1, 1, 1, 1,
-1.696534, -2.301244, -2.866088, 1, 1, 1, 1, 1,
-1.69142, 1.185394, 0.2374316, 1, 1, 1, 1, 1,
-1.687514, -0.5626517, -1.48056, 1, 1, 1, 1, 1,
-1.682901, 0.1284854, 0.3241901, 1, 1, 1, 1, 1,
-1.648312, 1.330596, -1.501715, 1, 1, 1, 1, 1,
-1.647515, 1.44166, -0.8064299, 1, 1, 1, 1, 1,
-1.621374, -0.1991258, -2.030751, 1, 1, 1, 1, 1,
-1.587132, -1.293063, -1.744555, 0, 0, 1, 1, 1,
-1.578886, -0.02545451, -2.790512, 1, 0, 0, 1, 1,
-1.549579, 0.7958633, -2.053314, 1, 0, 0, 1, 1,
-1.548545, 0.3888783, -1.910144, 1, 0, 0, 1, 1,
-1.544819, -0.3111573, -2.775782, 1, 0, 0, 1, 1,
-1.543911, 0.9462672, -3.776668, 1, 0, 0, 1, 1,
-1.539885, -0.7749497, 0.3196332, 0, 0, 0, 1, 1,
-1.537115, -0.4548604, -1.801516, 0, 0, 0, 1, 1,
-1.53261, 0.6272012, -1.968813, 0, 0, 0, 1, 1,
-1.528162, -0.02503318, -0.929767, 0, 0, 0, 1, 1,
-1.525305, -1.499557, -1.172464, 0, 0, 0, 1, 1,
-1.52405, -1.365848, -1.911007, 0, 0, 0, 1, 1,
-1.518005, -0.05462579, -4.749996, 0, 0, 0, 1, 1,
-1.509519, 0.3742052, -1.234299, 1, 1, 1, 1, 1,
-1.497197, 0.8759206, -0.11632, 1, 1, 1, 1, 1,
-1.497003, -1.165768, -1.134319, 1, 1, 1, 1, 1,
-1.495516, -1.18078, -2.723666, 1, 1, 1, 1, 1,
-1.477797, -1.182724, -3.098738, 1, 1, 1, 1, 1,
-1.477494, -0.4283449, -2.112554, 1, 1, 1, 1, 1,
-1.469653, 0.5868386, 0.8394823, 1, 1, 1, 1, 1,
-1.469423, -1.632926, -1.756968, 1, 1, 1, 1, 1,
-1.456951, 0.09439506, -1.058116, 1, 1, 1, 1, 1,
-1.447719, 0.2816361, -1.821592, 1, 1, 1, 1, 1,
-1.445348, 0.7644994, -1.833947, 1, 1, 1, 1, 1,
-1.441817, 0.4801881, -1.316393, 1, 1, 1, 1, 1,
-1.439783, 0.1300208, -1.701377, 1, 1, 1, 1, 1,
-1.428269, 0.06718083, -0.7335247, 1, 1, 1, 1, 1,
-1.427531, -0.004484512, -1.073268, 1, 1, 1, 1, 1,
-1.427109, -0.1110963, -1.450974, 0, 0, 1, 1, 1,
-1.390487, 0.5087578, -1.69222, 1, 0, 0, 1, 1,
-1.385672, 1.122698, -1.689336, 1, 0, 0, 1, 1,
-1.385197, -0.2805129, -2.551971, 1, 0, 0, 1, 1,
-1.37681, 0.418238, -1.463593, 1, 0, 0, 1, 1,
-1.365043, 0.5549479, -0.6267257, 1, 0, 0, 1, 1,
-1.362628, 1.789087, -1.95043, 0, 0, 0, 1, 1,
-1.358228, 2.049071, -1.3183, 0, 0, 0, 1, 1,
-1.357314, 0.9812743, -2.031263, 0, 0, 0, 1, 1,
-1.34768, 0.8092126, -1.243038, 0, 0, 0, 1, 1,
-1.344388, 0.2809995, -0.624089, 0, 0, 0, 1, 1,
-1.332682, -0.1870629, -1.833268, 0, 0, 0, 1, 1,
-1.329314, -1.37197, -1.843222, 0, 0, 0, 1, 1,
-1.327493, 0.6636956, 0.3181736, 1, 1, 1, 1, 1,
-1.32205, 1.147858, -1.009449, 1, 1, 1, 1, 1,
-1.320878, -1.206193, -3.091155, 1, 1, 1, 1, 1,
-1.315015, 1.419206, -3.194429, 1, 1, 1, 1, 1,
-1.310621, -1.570321, -2.492997, 1, 1, 1, 1, 1,
-1.303969, -0.6731166, -2.840431, 1, 1, 1, 1, 1,
-1.29923, 0.4332313, -0.8122902, 1, 1, 1, 1, 1,
-1.288882, 0.3444603, -2.651461, 1, 1, 1, 1, 1,
-1.284738, 0.4933434, -1.395676, 1, 1, 1, 1, 1,
-1.274195, 1.231613, -0.7243879, 1, 1, 1, 1, 1,
-1.273867, 2.019407, -0.8382573, 1, 1, 1, 1, 1,
-1.271512, -1.493126, -1.669008, 1, 1, 1, 1, 1,
-1.268643, -0.3236335, -2.767009, 1, 1, 1, 1, 1,
-1.264954, 0.3248502, -3.463759, 1, 1, 1, 1, 1,
-1.260335, -0.8046857, -2.334409, 1, 1, 1, 1, 1,
-1.254788, 0.1588602, -0.7542239, 0, 0, 1, 1, 1,
-1.245779, -0.03592907, -0.8737246, 1, 0, 0, 1, 1,
-1.23838, -0.2925843, -3.440022, 1, 0, 0, 1, 1,
-1.236102, -1.464087, -3.133948, 1, 0, 0, 1, 1,
-1.219689, -1.278594, -4.068107, 1, 0, 0, 1, 1,
-1.212622, -2.446331, -3.642681, 1, 0, 0, 1, 1,
-1.209467, -1.665059, -2.72939, 0, 0, 0, 1, 1,
-1.191795, -0.8594646, -4.179143, 0, 0, 0, 1, 1,
-1.188178, -0.8153208, -2.60262, 0, 0, 0, 1, 1,
-1.185059, -0.9981751, -1.97376, 0, 0, 0, 1, 1,
-1.181401, 1.325261, -0.8896781, 0, 0, 0, 1, 1,
-1.180599, 0.5726414, -0.09756704, 0, 0, 0, 1, 1,
-1.177467, 0.6597863, -1.759635, 0, 0, 0, 1, 1,
-1.174624, -1.453022, -2.573474, 1, 1, 1, 1, 1,
-1.171114, 1.518404, -0.4870233, 1, 1, 1, 1, 1,
-1.157153, -0.1826555, -2.785519, 1, 1, 1, 1, 1,
-1.145675, -2.495242, -3.548986, 1, 1, 1, 1, 1,
-1.139645, -0.9845283, -0.7940778, 1, 1, 1, 1, 1,
-1.135968, -1.155481, -2.378761, 1, 1, 1, 1, 1,
-1.1314, 0.4560349, -2.075757, 1, 1, 1, 1, 1,
-1.125808, 0.1935672, -1.510246, 1, 1, 1, 1, 1,
-1.1188, -0.07759073, -2.23798, 1, 1, 1, 1, 1,
-1.114362, 0.6514357, 0.2736212, 1, 1, 1, 1, 1,
-1.111453, 1.514084, -0.679574, 1, 1, 1, 1, 1,
-1.102185, 0.6438727, -1.700423, 1, 1, 1, 1, 1,
-1.099555, 0.0593214, -2.771859, 1, 1, 1, 1, 1,
-1.095722, 1.66558, -1.89027, 1, 1, 1, 1, 1,
-1.090434, -0.5134451, -1.394994, 1, 1, 1, 1, 1,
-1.083372, -1.896255, -2.985336, 0, 0, 1, 1, 1,
-1.081367, -0.5796008, -1.948989, 1, 0, 0, 1, 1,
-1.080949, 1.537797, 0.1340133, 1, 0, 0, 1, 1,
-1.079296, 1.410855, 0.1473087, 1, 0, 0, 1, 1,
-1.078982, 1.429556, -2.081092, 1, 0, 0, 1, 1,
-1.068393, -0.8000188, -3.061058, 1, 0, 0, 1, 1,
-1.064478, -0.06986803, -0.9542406, 0, 0, 0, 1, 1,
-1.06391, 0.7884196, -0.7691087, 0, 0, 0, 1, 1,
-1.061347, -0.2416565, -2.453507, 0, 0, 0, 1, 1,
-1.045535, 1.397753, -0.2618097, 0, 0, 0, 1, 1,
-1.03441, 1.75597, -0.04006937, 0, 0, 0, 1, 1,
-1.015534, 2.099142, -0.0269253, 0, 0, 0, 1, 1,
-1.014495, -0.155603, -2.4789, 0, 0, 0, 1, 1,
-1.014491, -0.4950207, -0.7436283, 1, 1, 1, 1, 1,
-1.012913, 1.480927, -1.594816, 1, 1, 1, 1, 1,
-1.011299, 0.01304781, -2.183552, 1, 1, 1, 1, 1,
-1.004244, 0.3329138, -1.602859, 1, 1, 1, 1, 1,
-1.001592, 1.507913, -1.077619, 1, 1, 1, 1, 1,
-1.00112, -0.3636909, -2.714553, 1, 1, 1, 1, 1,
-0.9932688, 0.03743929, -1.18736, 1, 1, 1, 1, 1,
-0.9924026, 0.1565627, -1.57102, 1, 1, 1, 1, 1,
-0.9907391, 0.5634466, -0.8358955, 1, 1, 1, 1, 1,
-0.9836565, -0.2773782, -1.468306, 1, 1, 1, 1, 1,
-0.9756135, -0.2134448, -1.50474, 1, 1, 1, 1, 1,
-0.9700782, 1.104629, -1.322959, 1, 1, 1, 1, 1,
-0.9461958, -1.732541, -3.387662, 1, 1, 1, 1, 1,
-0.942577, -0.3647582, -2.73242, 1, 1, 1, 1, 1,
-0.9386562, 0.1931055, -1.954801, 1, 1, 1, 1, 1,
-0.9386466, 0.8328934, -0.2205993, 0, 0, 1, 1, 1,
-0.9380326, -0.449217, -3.035318, 1, 0, 0, 1, 1,
-0.9375904, -1.630744, -1.805724, 1, 0, 0, 1, 1,
-0.9365591, -1.692559, -2.492643, 1, 0, 0, 1, 1,
-0.9359794, 0.798691, -0.5016472, 1, 0, 0, 1, 1,
-0.9355664, 0.3085546, -0.9161391, 1, 0, 0, 1, 1,
-0.9347056, -1.548245, -1.391496, 0, 0, 0, 1, 1,
-0.9344715, -0.8848787, -2.484588, 0, 0, 0, 1, 1,
-0.9274447, 0.9067281, -2.025246, 0, 0, 0, 1, 1,
-0.9258381, 0.4946924, -1.751271, 0, 0, 0, 1, 1,
-0.9181687, 0.2358675, -3.180787, 0, 0, 0, 1, 1,
-0.9158382, -0.1296448, -1.625848, 0, 0, 0, 1, 1,
-0.9134691, -1.093946, -2.509282, 0, 0, 0, 1, 1,
-0.9124302, 0.1612651, -2.731786, 1, 1, 1, 1, 1,
-0.9110858, 0.6085566, -1.560635, 1, 1, 1, 1, 1,
-0.9026283, 1.522368, -0.8320379, 1, 1, 1, 1, 1,
-0.900649, -0.2676741, -2.6391, 1, 1, 1, 1, 1,
-0.8994488, 0.6440094, -1.578437, 1, 1, 1, 1, 1,
-0.8989677, -1.076769, -1.59928, 1, 1, 1, 1, 1,
-0.8968272, -2.653178, -2.556211, 1, 1, 1, 1, 1,
-0.8897934, 0.2305952, -2.482987, 1, 1, 1, 1, 1,
-0.8874001, 0.9816833, 0.2775106, 1, 1, 1, 1, 1,
-0.8873968, 1.078533, -2.168846, 1, 1, 1, 1, 1,
-0.8865733, 0.330465, -0.6275192, 1, 1, 1, 1, 1,
-0.8822402, 1.189078, 0.4635946, 1, 1, 1, 1, 1,
-0.8776197, 1.110676, -0.5614461, 1, 1, 1, 1, 1,
-0.873616, 0.4434288, 0.2638659, 1, 1, 1, 1, 1,
-0.8716418, -0.006392211, -0.5710747, 1, 1, 1, 1, 1,
-0.8709825, 0.1278957, -0.402957, 0, 0, 1, 1, 1,
-0.8568567, -1.496592, -0.1600853, 1, 0, 0, 1, 1,
-0.8508155, -0.7246842, -2.03553, 1, 0, 0, 1, 1,
-0.8497956, 1.350299, 2.002191, 1, 0, 0, 1, 1,
-0.8437501, -0.1361265, -1.025943, 1, 0, 0, 1, 1,
-0.8397235, -1.337331, -4.635132, 1, 0, 0, 1, 1,
-0.8369063, 0.9830356, -0.8474066, 0, 0, 0, 1, 1,
-0.8327594, -1.769998, -5.003154, 0, 0, 0, 1, 1,
-0.8301778, -0.06912752, -1.989566, 0, 0, 0, 1, 1,
-0.8229838, 0.7895473, -1.344981, 0, 0, 0, 1, 1,
-0.8225299, -0.2559324, -0.8188584, 0, 0, 0, 1, 1,
-0.8124098, -0.6884823, -1.719193, 0, 0, 0, 1, 1,
-0.8111616, -0.3760087, -1.741137, 0, 0, 0, 1, 1,
-0.8105601, -0.2128832, -2.574438, 1, 1, 1, 1, 1,
-0.8095365, -0.5226836, -2.775699, 1, 1, 1, 1, 1,
-0.8076106, -0.01177593, -2.549227, 1, 1, 1, 1, 1,
-0.7932028, 0.5626832, -1.243575, 1, 1, 1, 1, 1,
-0.7887087, -1.04205, -3.207197, 1, 1, 1, 1, 1,
-0.7884403, 0.6491843, 0.9523133, 1, 1, 1, 1, 1,
-0.7876312, -0.07800686, -2.287094, 1, 1, 1, 1, 1,
-0.7830123, -0.6265719, -1.76859, 1, 1, 1, 1, 1,
-0.7823325, 0.6362059, -1.841843, 1, 1, 1, 1, 1,
-0.7792817, 0.6354541, -2.128529, 1, 1, 1, 1, 1,
-0.7703128, 0.9495816, 0.05058761, 1, 1, 1, 1, 1,
-0.7678292, 1.033014, 0.2544098, 1, 1, 1, 1, 1,
-0.7667038, 0.7970062, 0.3631786, 1, 1, 1, 1, 1,
-0.7658388, 0.5153926, 0.02436735, 1, 1, 1, 1, 1,
-0.7651104, 0.308741, -2.450676, 1, 1, 1, 1, 1,
-0.7593695, -0.5996656, -1.374608, 0, 0, 1, 1, 1,
-0.7582785, 1.378999, 1.134143, 1, 0, 0, 1, 1,
-0.7529548, -0.7401402, -1.216599, 1, 0, 0, 1, 1,
-0.7450238, -1.459669, -2.829944, 1, 0, 0, 1, 1,
-0.7384097, -0.9518278, -2.123755, 1, 0, 0, 1, 1,
-0.7287161, -0.9990357, -2.363016, 1, 0, 0, 1, 1,
-0.7237166, 0.01453947, -2.027597, 0, 0, 0, 1, 1,
-0.718771, 1.662132, 0.08998322, 0, 0, 0, 1, 1,
-0.7178382, 0.3324227, -2.435768, 0, 0, 0, 1, 1,
-0.7132838, 0.04688093, -2.756639, 0, 0, 0, 1, 1,
-0.7081482, 0.1243106, -2.327412, 0, 0, 0, 1, 1,
-0.7022781, -0.8158161, -2.275198, 0, 0, 0, 1, 1,
-0.6974494, -0.8162172, -1.501284, 0, 0, 0, 1, 1,
-0.692956, -1.202867, -1.959592, 1, 1, 1, 1, 1,
-0.6825311, -0.06070003, -1.730647, 1, 1, 1, 1, 1,
-0.6771454, 0.2628257, -2.054841, 1, 1, 1, 1, 1,
-0.6747329, -1.523958, -2.660474, 1, 1, 1, 1, 1,
-0.6736236, -0.6521545, -3.467165, 1, 1, 1, 1, 1,
-0.6715906, -0.2649846, -0.9722084, 1, 1, 1, 1, 1,
-0.671523, 1.372074, -0.5555581, 1, 1, 1, 1, 1,
-0.6696158, -0.5751978, -2.983349, 1, 1, 1, 1, 1,
-0.6690888, -1.030874, -3.211031, 1, 1, 1, 1, 1,
-0.6661977, 0.3670509, -2.226735, 1, 1, 1, 1, 1,
-0.6653962, 1.015557, 0.6753333, 1, 1, 1, 1, 1,
-0.665392, 0.1919491, -0.4082437, 1, 1, 1, 1, 1,
-0.6629415, 0.4970219, -1.582932, 1, 1, 1, 1, 1,
-0.6507339, 0.9672052, 1.065275, 1, 1, 1, 1, 1,
-0.6504435, 0.3659193, 0.6677024, 1, 1, 1, 1, 1,
-0.6496094, -1.406143, -2.960786, 0, 0, 1, 1, 1,
-0.6372552, -0.5227491, -3.098351, 1, 0, 0, 1, 1,
-0.6357583, -1.507656, -3.15933, 1, 0, 0, 1, 1,
-0.6290883, -0.4418416, -2.486909, 1, 0, 0, 1, 1,
-0.6254737, 0.7632255, -2.059358, 1, 0, 0, 1, 1,
-0.6251737, 0.3133076, 0.03734981, 1, 0, 0, 1, 1,
-0.6235605, 0.2386555, -2.239519, 0, 0, 0, 1, 1,
-0.6232978, -2.131841, -2.231788, 0, 0, 0, 1, 1,
-0.6190517, -0.5453402, -3.355948, 0, 0, 0, 1, 1,
-0.6150831, 1.551068, -0.9120052, 0, 0, 0, 1, 1,
-0.6101745, 0.8967749, -0.5268824, 0, 0, 0, 1, 1,
-0.607905, -0.448547, -3.035983, 0, 0, 0, 1, 1,
-0.6055056, -0.9283794, -2.372398, 0, 0, 0, 1, 1,
-0.603422, 0.2130546, -1.917107, 1, 1, 1, 1, 1,
-0.5976205, -0.8409376, -2.706909, 1, 1, 1, 1, 1,
-0.5973789, 0.8846695, -1.632981, 1, 1, 1, 1, 1,
-0.5945793, -0.2494603, -2.53557, 1, 1, 1, 1, 1,
-0.592965, 0.7121016, 1.568474, 1, 1, 1, 1, 1,
-0.5894732, -0.5506055, -2.063808, 1, 1, 1, 1, 1,
-0.5813366, -0.006117182, -0.6449487, 1, 1, 1, 1, 1,
-0.5770836, -0.6512807, -1.968343, 1, 1, 1, 1, 1,
-0.5734059, 1.628383, 1.450125, 1, 1, 1, 1, 1,
-0.5692211, -1.600976, -3.089729, 1, 1, 1, 1, 1,
-0.5523138, -0.3960038, -2.069235, 1, 1, 1, 1, 1,
-0.5482205, -0.6333433, -1.416972, 1, 1, 1, 1, 1,
-0.542433, -0.6909901, -3.581359, 1, 1, 1, 1, 1,
-0.5412688, -0.4637883, -2.514782, 1, 1, 1, 1, 1,
-0.5383475, 0.3924672, -1.777446, 1, 1, 1, 1, 1,
-0.53508, 1.207467, 0.9541964, 0, 0, 1, 1, 1,
-0.5331323, -0.8839191, -2.171108, 1, 0, 0, 1, 1,
-0.5278385, -0.5757042, -2.651736, 1, 0, 0, 1, 1,
-0.5220006, -0.2413636, -2.285862, 1, 0, 0, 1, 1,
-0.520557, 0.1262127, -1.013925, 1, 0, 0, 1, 1,
-0.513019, -2.0864, -3.475041, 1, 0, 0, 1, 1,
-0.4999343, 0.7941199, 1.61167, 0, 0, 0, 1, 1,
-0.4971171, -0.1527204, -2.671281, 0, 0, 0, 1, 1,
-0.4927853, -0.2880713, -0.9694179, 0, 0, 0, 1, 1,
-0.4922508, -0.6300377, -3.032816, 0, 0, 0, 1, 1,
-0.4916586, 0.6590241, -1.564912, 0, 0, 0, 1, 1,
-0.486925, 0.9839296, -2.629359, 0, 0, 0, 1, 1,
-0.4857752, -1.277217, -2.248403, 0, 0, 0, 1, 1,
-0.4839659, -0.683305, -2.524933, 1, 1, 1, 1, 1,
-0.483221, 1.7294, -0.9557941, 1, 1, 1, 1, 1,
-0.4766839, 0.2833602, -0.3127024, 1, 1, 1, 1, 1,
-0.4595434, -0.6869718, -1.318198, 1, 1, 1, 1, 1,
-0.4586224, 0.9538567, -0.2740555, 1, 1, 1, 1, 1,
-0.4576142, 1.73036, -0.5644805, 1, 1, 1, 1, 1,
-0.4574403, 1.064636, -0.4728608, 1, 1, 1, 1, 1,
-0.4516495, 1.75301, -0.5373011, 1, 1, 1, 1, 1,
-0.4510866, -0.8905274, -2.869234, 1, 1, 1, 1, 1,
-0.4504563, 1.187215, -0.5834858, 1, 1, 1, 1, 1,
-0.4463084, 0.3780407, -0.1462061, 1, 1, 1, 1, 1,
-0.4416048, 0.2164739, -0.8142968, 1, 1, 1, 1, 1,
-0.4406778, 1.789218, 0.9167336, 1, 1, 1, 1, 1,
-0.427835, -1.000718, -2.796773, 1, 1, 1, 1, 1,
-0.4274485, -2.238999, -1.531265, 1, 1, 1, 1, 1,
-0.424909, 2.05685, -1.085126, 0, 0, 1, 1, 1,
-0.4229278, 0.3123548, -2.290914, 1, 0, 0, 1, 1,
-0.4179534, -1.553848, -2.463085, 1, 0, 0, 1, 1,
-0.4136909, 0.8040992, -0.2702439, 1, 0, 0, 1, 1,
-0.4124357, 1.803816, -0.9843016, 1, 0, 0, 1, 1,
-0.4105672, 0.9332333, 1.083227, 1, 0, 0, 1, 1,
-0.4070935, -0.3562879, -1.279311, 0, 0, 0, 1, 1,
-0.4038661, -0.462073, -1.938442, 0, 0, 0, 1, 1,
-0.4021287, 0.1466476, -0.6181509, 0, 0, 0, 1, 1,
-0.4018641, 1.473846, -0.1923367, 0, 0, 0, 1, 1,
-0.4012706, -1.634118, -3.460976, 0, 0, 0, 1, 1,
-0.4003803, -0.1076451, -1.282298, 0, 0, 0, 1, 1,
-0.3997273, -1.883777, -2.93395, 0, 0, 0, 1, 1,
-0.3988582, -0.6944395, -0.9539187, 1, 1, 1, 1, 1,
-0.3936344, 0.05558348, -1.306517, 1, 1, 1, 1, 1,
-0.3918788, 0.8642218, -0.9050729, 1, 1, 1, 1, 1,
-0.3899203, 0.4209005, -2.412154, 1, 1, 1, 1, 1,
-0.3896139, 0.8146997, -0.1457402, 1, 1, 1, 1, 1,
-0.3830615, -0.2421844, -4.459143, 1, 1, 1, 1, 1,
-0.3793689, -2.364898, -2.865915, 1, 1, 1, 1, 1,
-0.3785, -0.4494605, -2.917118, 1, 1, 1, 1, 1,
-0.3759344, 0.1948729, -1.293617, 1, 1, 1, 1, 1,
-0.3754791, -2.362961, -1.988858, 1, 1, 1, 1, 1,
-0.3641899, 0.4109789, -0.09014608, 1, 1, 1, 1, 1,
-0.3622586, 0.2913948, -1.116107, 1, 1, 1, 1, 1,
-0.3612818, -0.2785316, -3.437781, 1, 1, 1, 1, 1,
-0.3606738, 0.9336486, 0.899991, 1, 1, 1, 1, 1,
-0.3576289, -1.061719, -2.278974, 1, 1, 1, 1, 1,
-0.3568889, -0.7270572, -1.929588, 0, 0, 1, 1, 1,
-0.3560405, -0.458028, -3.455748, 1, 0, 0, 1, 1,
-0.351674, 0.7909617, 0.704429, 1, 0, 0, 1, 1,
-0.3484632, -1.863929, -2.204546, 1, 0, 0, 1, 1,
-0.3473667, 1.589564, -0.2995774, 1, 0, 0, 1, 1,
-0.3462456, 0.1663722, 0.591148, 1, 0, 0, 1, 1,
-0.3460201, -0.08409836, -1.909474, 0, 0, 0, 1, 1,
-0.3426339, 0.5579438, -0.3057074, 0, 0, 0, 1, 1,
-0.3421776, 0.7708938, 1.278728, 0, 0, 0, 1, 1,
-0.3417328, 0.4830211, -0.7752216, 0, 0, 0, 1, 1,
-0.3298846, 0.1282799, -1.509261, 0, 0, 0, 1, 1,
-0.3293884, -0.3101881, -2.521659, 0, 0, 0, 1, 1,
-0.3258439, 0.3533755, 0.6252314, 0, 0, 0, 1, 1,
-0.3230318, -0.6017724, -2.630267, 1, 1, 1, 1, 1,
-0.3215653, -2.17673, -2.954396, 1, 1, 1, 1, 1,
-0.3205059, 0.0217436, -1.067581, 1, 1, 1, 1, 1,
-0.3203478, -0.09763706, -1.121132, 1, 1, 1, 1, 1,
-0.3129025, 0.374349, -0.7268246, 1, 1, 1, 1, 1,
-0.3116754, 0.4698137, -0.6553652, 1, 1, 1, 1, 1,
-0.3079728, -0.5189613, -2.562202, 1, 1, 1, 1, 1,
-0.3016629, -0.5259656, -1.996809, 1, 1, 1, 1, 1,
-0.2972208, 0.2524094, -0.190984, 1, 1, 1, 1, 1,
-0.2937144, 0.5989607, 0.3143882, 1, 1, 1, 1, 1,
-0.2925735, 0.01197448, -1.638902, 1, 1, 1, 1, 1,
-0.2908674, -1.226014, -4.151205, 1, 1, 1, 1, 1,
-0.2882815, 0.07698435, -1.075393, 1, 1, 1, 1, 1,
-0.2878138, 0.0100147, -2.302852, 1, 1, 1, 1, 1,
-0.2876257, 0.2523103, -1.026662, 1, 1, 1, 1, 1,
-0.2872079, 1.752567, 0.1132302, 0, 0, 1, 1, 1,
-0.2862948, 0.7900544, -1.703035, 1, 0, 0, 1, 1,
-0.284121, -0.1198029, -1.634029, 1, 0, 0, 1, 1,
-0.2827598, 0.8786767, -2.294454, 1, 0, 0, 1, 1,
-0.2816085, 2.026732, -0.3521724, 1, 0, 0, 1, 1,
-0.2792901, -0.2662326, -1.989893, 1, 0, 0, 1, 1,
-0.2654257, -0.7460991, -3.244462, 0, 0, 0, 1, 1,
-0.2647232, 0.2090182, -0.3127218, 0, 0, 0, 1, 1,
-0.2607717, 1.113506, -0.943511, 0, 0, 0, 1, 1,
-0.260189, -1.628926, -2.583556, 0, 0, 0, 1, 1,
-0.2569469, -0.9757, -3.330564, 0, 0, 0, 1, 1,
-0.2565048, -0.2057107, -3.628643, 0, 0, 0, 1, 1,
-0.2517221, -0.4316072, -2.334031, 0, 0, 0, 1, 1,
-0.2508739, 1.708669, -0.836457, 1, 1, 1, 1, 1,
-0.2461494, -0.502695, -3.438933, 1, 1, 1, 1, 1,
-0.2451133, 1.241705, 0.4197193, 1, 1, 1, 1, 1,
-0.2395107, -0.6132899, -1.642435, 1, 1, 1, 1, 1,
-0.2345663, 0.6811548, -0.8417795, 1, 1, 1, 1, 1,
-0.2236661, 2.751886, 0.8702946, 1, 1, 1, 1, 1,
-0.2202401, -0.5526912, -2.593512, 1, 1, 1, 1, 1,
-0.2167421, 0.09756873, 0.3533128, 1, 1, 1, 1, 1,
-0.2158324, -1.041567, -3.645112, 1, 1, 1, 1, 1,
-0.2141249, -0.6834391, -2.804546, 1, 1, 1, 1, 1,
-0.2131146, -0.6998124, -4.040157, 1, 1, 1, 1, 1,
-0.2120814, 0.4630979, 0.7268688, 1, 1, 1, 1, 1,
-0.2108357, -2.063223, -1.358418, 1, 1, 1, 1, 1,
-0.2021401, -0.8854606, -2.32615, 1, 1, 1, 1, 1,
-0.2002321, 0.2107573, -0.4908891, 1, 1, 1, 1, 1,
-0.1997423, 0.02241502, -0.9148738, 0, 0, 1, 1, 1,
-0.1993903, 0.09481924, -0.8271567, 1, 0, 0, 1, 1,
-0.1945501, 0.8877997, -0.790682, 1, 0, 0, 1, 1,
-0.1941216, 0.8703213, -1.749741, 1, 0, 0, 1, 1,
-0.1894239, -0.2275307, -1.876927, 1, 0, 0, 1, 1,
-0.188638, 1.520158, 0.1830255, 1, 0, 0, 1, 1,
-0.1879415, -0.1798841, -1.726921, 0, 0, 0, 1, 1,
-0.1851657, -1.747593, -2.654164, 0, 0, 0, 1, 1,
-0.1842185, -1.331378, -2.550577, 0, 0, 0, 1, 1,
-0.1827076, 0.7374707, 0.1318655, 0, 0, 0, 1, 1,
-0.1823488, 1.268684, 0.1583797, 0, 0, 0, 1, 1,
-0.1821755, 0.09976441, -2.485443, 0, 0, 0, 1, 1,
-0.1796278, -0.1132765, -3.036546, 0, 0, 0, 1, 1,
-0.1780249, -0.6858935, -3.532558, 1, 1, 1, 1, 1,
-0.1751412, -0.7764984, -1.888643, 1, 1, 1, 1, 1,
-0.1747722, 0.5117237, 0.8872424, 1, 1, 1, 1, 1,
-0.1729966, -0.04677286, -2.14975, 1, 1, 1, 1, 1,
-0.1697847, 0.2480995, 0.491058, 1, 1, 1, 1, 1,
-0.1669375, 1.734993, -0.9634027, 1, 1, 1, 1, 1,
-0.1664513, -0.2724091, -3.299459, 1, 1, 1, 1, 1,
-0.1645103, 0.9145901, -0.991703, 1, 1, 1, 1, 1,
-0.1629144, 0.4158862, -1.405695, 1, 1, 1, 1, 1,
-0.1624382, 0.7086629, -0.9704657, 1, 1, 1, 1, 1,
-0.160783, 0.3831463, 1.092712, 1, 1, 1, 1, 1,
-0.1561665, 1.951085, 0.7512571, 1, 1, 1, 1, 1,
-0.1539849, 0.2214214, 0.5821884, 1, 1, 1, 1, 1,
-0.1502436, -0.9091183, -4.288627, 1, 1, 1, 1, 1,
-0.1323006, 1.249475, -1.185737, 1, 1, 1, 1, 1,
-0.1298276, -0.7698362, -3.500602, 0, 0, 1, 1, 1,
-0.1280224, 0.7484961, -0.3700877, 1, 0, 0, 1, 1,
-0.1272105, -0.311691, -3.175274, 1, 0, 0, 1, 1,
-0.1257706, 0.06162547, -1.286029, 1, 0, 0, 1, 1,
-0.1251906, -0.4843201, -2.298071, 1, 0, 0, 1, 1,
-0.1233946, 1.685901, -1.406744, 1, 0, 0, 1, 1,
-0.123174, -1.234622, -1.438834, 0, 0, 0, 1, 1,
-0.1223975, -0.5960346, -3.517315, 0, 0, 0, 1, 1,
-0.121439, -1.80224, -1.224084, 0, 0, 0, 1, 1,
-0.1188404, -0.8108504, -3.558002, 0, 0, 0, 1, 1,
-0.1158277, 1.312051, -0.7649658, 0, 0, 0, 1, 1,
-0.1156022, 0.2238112, -0.1774464, 0, 0, 0, 1, 1,
-0.1109129, 1.179386, 0.2557649, 0, 0, 0, 1, 1,
-0.1081566, 1.801183, 0.1928359, 1, 1, 1, 1, 1,
-0.1078772, 1.291912, 1.090799, 1, 1, 1, 1, 1,
-0.1077537, -0.3628571, -3.245437, 1, 1, 1, 1, 1,
-0.1070228, 0.7155768, 0.4734425, 1, 1, 1, 1, 1,
-0.1055488, 1.040634, 0.2569933, 1, 1, 1, 1, 1,
-0.1038322, 1.191624, -1.135556, 1, 1, 1, 1, 1,
-0.1035888, -0.5317398, -4.519071, 1, 1, 1, 1, 1,
-0.1029126, 0.6836641, -0.9844344, 1, 1, 1, 1, 1,
-0.1019178, 0.6141129, -0.3106544, 1, 1, 1, 1, 1,
-0.1017374, 0.5751752, -0.6248173, 1, 1, 1, 1, 1,
-0.09824099, 0.2119648, 0.074839, 1, 1, 1, 1, 1,
-0.09699926, 0.312598, -1.311749, 1, 1, 1, 1, 1,
-0.09646094, -1.171183, -1.100904, 1, 1, 1, 1, 1,
-0.0958617, 0.07092831, -1.099351, 1, 1, 1, 1, 1,
-0.09362318, 0.7673308, -0.3098286, 1, 1, 1, 1, 1,
-0.08943572, -0.9016522, -4.560762, 0, 0, 1, 1, 1,
-0.08773312, 0.5131131, -1.101961, 1, 0, 0, 1, 1,
-0.08526702, 0.1987974, 0.2788206, 1, 0, 0, 1, 1,
-0.08526634, -0.09313981, -1.825241, 1, 0, 0, 1, 1,
-0.08261676, 1.521762, 1.075894, 1, 0, 0, 1, 1,
-0.07565454, 0.9047629, 0.09739884, 1, 0, 0, 1, 1,
-0.07370792, -0.002257006, -1.73896, 0, 0, 0, 1, 1,
-0.07289649, -0.8087102, -4.346263, 0, 0, 0, 1, 1,
-0.07100855, 0.1866124, 1.430833, 0, 0, 0, 1, 1,
-0.06985606, -2.055044, -3.719296, 0, 0, 0, 1, 1,
-0.06976347, -0.6344244, -2.580589, 0, 0, 0, 1, 1,
-0.06549507, -0.6974174, -1.2815, 0, 0, 0, 1, 1,
-0.06547207, -0.332669, -2.263796, 0, 0, 0, 1, 1,
-0.06487457, 0.6886972, -0.2225159, 1, 1, 1, 1, 1,
-0.06403196, -2.468524, -3.952773, 1, 1, 1, 1, 1,
-0.0629059, -0.06897307, -4.090297, 1, 1, 1, 1, 1,
-0.06038991, 1.82432, 1.104254, 1, 1, 1, 1, 1,
-0.06032953, 0.2178419, 0.9846745, 1, 1, 1, 1, 1,
-0.05991758, 2.1089, -1.153032, 1, 1, 1, 1, 1,
-0.05774725, 1.004735, -0.5439076, 1, 1, 1, 1, 1,
-0.05602285, 0.5019721, 1.329355, 1, 1, 1, 1, 1,
-0.05120225, 2.027231, -0.07758605, 1, 1, 1, 1, 1,
-0.05052919, -0.7240452, -2.565201, 1, 1, 1, 1, 1,
-0.04835721, 0.3064593, 0.9690198, 1, 1, 1, 1, 1,
-0.04478552, -0.5369955, -5.073606, 1, 1, 1, 1, 1,
-0.04198878, -0.6771508, -3.056349, 1, 1, 1, 1, 1,
-0.04039805, -1.20115, -3.524804, 1, 1, 1, 1, 1,
-0.04036778, 0.5555469, -2.194957, 1, 1, 1, 1, 1,
-0.03985337, 0.4240051, -1.609845, 0, 0, 1, 1, 1,
-0.030194, 0.7145522, -1.641815, 1, 0, 0, 1, 1,
-0.02736609, 0.5626073, 0.04577802, 1, 0, 0, 1, 1,
-0.02060162, 0.0338482, -0.3163858, 1, 0, 0, 1, 1,
-0.01960796, -0.8399465, -1.637593, 1, 0, 0, 1, 1,
-0.01613344, -0.5369403, -3.108335, 1, 0, 0, 1, 1,
-0.01571491, 1.074691, -0.0153436, 0, 0, 0, 1, 1,
-0.00547105, -1.500162, -2.630284, 0, 0, 0, 1, 1,
-0.003776529, -0.7087219, -3.405874, 0, 0, 0, 1, 1,
-0.002945189, -0.2063066, -3.842603, 0, 0, 0, 1, 1,
-0.002490791, 0.006055435, -0.7040597, 0, 0, 0, 1, 1,
-0.001321496, -0.7532471, -4.467836, 0, 0, 0, 1, 1,
-0.0004203118, -0.3546388, -4.180909, 0, 0, 0, 1, 1,
0.00247373, -1.643115, 2.077815, 1, 1, 1, 1, 1,
0.003772105, 0.3047191, -0.6801887, 1, 1, 1, 1, 1,
0.006294718, -0.4222101, 3.530457, 1, 1, 1, 1, 1,
0.009033919, 1.035544, 0.345969, 1, 1, 1, 1, 1,
0.01012295, -0.05295172, 3.945883, 1, 1, 1, 1, 1,
0.01505349, -0.1721516, 3.980854, 1, 1, 1, 1, 1,
0.01539899, -0.3172044, 4.177179, 1, 1, 1, 1, 1,
0.0249468, -0.5895595, 2.594647, 1, 1, 1, 1, 1,
0.02723995, 0.7215831, 1.767979, 1, 1, 1, 1, 1,
0.02914288, 0.9179466, 1.827047, 1, 1, 1, 1, 1,
0.03208599, 0.6466968, -0.9207624, 1, 1, 1, 1, 1,
0.03306593, 1.349761, -1.114923, 1, 1, 1, 1, 1,
0.03471588, -0.7490751, 3.54981, 1, 1, 1, 1, 1,
0.0362256, -1.900041, 5.035649, 1, 1, 1, 1, 1,
0.03660001, -0.2811701, 2.053597, 1, 1, 1, 1, 1,
0.0376417, 0.7384924, -0.8171085, 0, 0, 1, 1, 1,
0.03802442, 0.6096822, -0.4095724, 1, 0, 0, 1, 1,
0.03861992, 1.192731, 0.8092497, 1, 0, 0, 1, 1,
0.04118783, 1.26093, -0.7600297, 1, 0, 0, 1, 1,
0.04449596, 2.274039, 0.4522281, 1, 0, 0, 1, 1,
0.04477192, 0.2426248, -0.5079094, 1, 0, 0, 1, 1,
0.04627257, -0.8530307, 2.736426, 0, 0, 0, 1, 1,
0.04801627, -0.5346302, 4.163175, 0, 0, 0, 1, 1,
0.05133958, -1.303701, 4.533315, 0, 0, 0, 1, 1,
0.05878743, 1.630546, -0.6148996, 0, 0, 0, 1, 1,
0.06141751, 0.6659999, -0.2712278, 0, 0, 0, 1, 1,
0.06252393, -0.121202, 2.80338, 0, 0, 0, 1, 1,
0.07004026, 1.113214, 0.2662728, 0, 0, 0, 1, 1,
0.07352331, 0.7822933, 0.1021853, 1, 1, 1, 1, 1,
0.08699305, 0.1778031, 1.934016, 1, 1, 1, 1, 1,
0.0889455, 0.2483233, 1.57969, 1, 1, 1, 1, 1,
0.08924119, 0.5593278, 0.7098671, 1, 1, 1, 1, 1,
0.09065366, -0.7498668, 3.226913, 1, 1, 1, 1, 1,
0.09884509, -0.7035024, 1.907059, 1, 1, 1, 1, 1,
0.1012937, -1.795296, 3.169762, 1, 1, 1, 1, 1,
0.1017952, -0.2875431, 5.137269, 1, 1, 1, 1, 1,
0.1018236, -1.026869, 1.890973, 1, 1, 1, 1, 1,
0.1092847, -0.7533531, 2.970938, 1, 1, 1, 1, 1,
0.1104864, -0.2576884, 2.420321, 1, 1, 1, 1, 1,
0.1196549, -0.1554622, 0.7868056, 1, 1, 1, 1, 1,
0.1217302, 0.4360557, -2.479761, 1, 1, 1, 1, 1,
0.1222588, -1.403845, 3.249918, 1, 1, 1, 1, 1,
0.1246348, 1.034057, -0.1796534, 1, 1, 1, 1, 1,
0.1263498, -0.430445, 0.3864968, 0, 0, 1, 1, 1,
0.1301923, 1.192653, 0.5781944, 1, 0, 0, 1, 1,
0.1318892, 2.032031, -0.5591542, 1, 0, 0, 1, 1,
0.1365874, 1.656122, 0.5189874, 1, 0, 0, 1, 1,
0.1387473, -2.240055, 2.972946, 1, 0, 0, 1, 1,
0.1439386, -0.3662365, 3.116521, 1, 0, 0, 1, 1,
0.1483907, 1.283406, 0.4052553, 0, 0, 0, 1, 1,
0.1489839, 0.260829, -0.01996999, 0, 0, 0, 1, 1,
0.1522027, -1.360164, 2.860499, 0, 0, 0, 1, 1,
0.154892, 1.053959, -0.6497101, 0, 0, 0, 1, 1,
0.1592624, 1.723149, 0.2017552, 0, 0, 0, 1, 1,
0.1613326, 0.5082182, -0.9178106, 0, 0, 0, 1, 1,
0.1666397, -1.787829, 2.082682, 0, 0, 0, 1, 1,
0.1693577, 0.00554082, 1.11464, 1, 1, 1, 1, 1,
0.1702721, -0.5795628, 3.329492, 1, 1, 1, 1, 1,
0.172152, 1.748368, -0.4718705, 1, 1, 1, 1, 1,
0.1723627, -0.669991, 2.95803, 1, 1, 1, 1, 1,
0.17336, -1.252219, 2.617361, 1, 1, 1, 1, 1,
0.1738014, -2.237703, 3.737164, 1, 1, 1, 1, 1,
0.1747416, -1.157907, 2.93033, 1, 1, 1, 1, 1,
0.1797076, -0.06220337, -0.5842589, 1, 1, 1, 1, 1,
0.1806811, 0.3728579, -0.7875355, 1, 1, 1, 1, 1,
0.1823996, -1.79565, 2.076414, 1, 1, 1, 1, 1,
0.1836745, 1.161268, -0.7756382, 1, 1, 1, 1, 1,
0.185499, 1.469346, -1.695434, 1, 1, 1, 1, 1,
0.1860745, 0.8597724, -1.711845, 1, 1, 1, 1, 1,
0.1891596, -0.2998833, 2.031897, 1, 1, 1, 1, 1,
0.1897552, -1.225775, 4.033604, 1, 1, 1, 1, 1,
0.1902554, -0.4653954, 2.289124, 0, 0, 1, 1, 1,
0.1957685, -0.8706626, 3.039741, 1, 0, 0, 1, 1,
0.1994111, -0.4148023, 2.795389, 1, 0, 0, 1, 1,
0.2045899, -0.5943714, 2.128274, 1, 0, 0, 1, 1,
0.2065451, -0.6901041, 2.776466, 1, 0, 0, 1, 1,
0.2123224, -1.189595, 1.690736, 1, 0, 0, 1, 1,
0.2157028, 0.1858265, 1.007563, 0, 0, 0, 1, 1,
0.2159861, 1.193885, -0.07005267, 0, 0, 0, 1, 1,
0.2161561, -2.176675, 1.335515, 0, 0, 0, 1, 1,
0.2162328, -0.7602497, 1.547435, 0, 0, 0, 1, 1,
0.2174274, -0.3616915, 3.083526, 0, 0, 0, 1, 1,
0.2262568, 1.185317, -0.08426128, 0, 0, 0, 1, 1,
0.2309, -0.2348204, 1.560366, 0, 0, 0, 1, 1,
0.2312705, -0.232252, 2.840477, 1, 1, 1, 1, 1,
0.2375905, 1.467214, 1.259451, 1, 1, 1, 1, 1,
0.2380223, -0.4934969, 2.238025, 1, 1, 1, 1, 1,
0.2455971, -0.9517665, 4.350589, 1, 1, 1, 1, 1,
0.2456686, 1.057124, 1.622583, 1, 1, 1, 1, 1,
0.2467138, 0.1595431, 0.7318183, 1, 1, 1, 1, 1,
0.2499632, 0.3169922, 0.5958151, 1, 1, 1, 1, 1,
0.2546336, 0.03430238, 1.897706, 1, 1, 1, 1, 1,
0.2595147, 1.151857, 0.3245199, 1, 1, 1, 1, 1,
0.2610954, 0.3613721, 1.817967, 1, 1, 1, 1, 1,
0.262492, 0.9353147, 0.6485019, 1, 1, 1, 1, 1,
0.267122, -1.402876, 2.333597, 1, 1, 1, 1, 1,
0.2746366, -0.122609, 2.332342, 1, 1, 1, 1, 1,
0.2763004, -0.2985671, -1.009298, 1, 1, 1, 1, 1,
0.2785912, 0.1086897, 2.575193, 1, 1, 1, 1, 1,
0.2787636, 0.1348188, 2.549126, 0, 0, 1, 1, 1,
0.2788374, -1.312387, 3.879869, 1, 0, 0, 1, 1,
0.2826378, -0.5202233, 3.385895, 1, 0, 0, 1, 1,
0.2826966, -0.5713522, 1.203591, 1, 0, 0, 1, 1,
0.2841814, -0.6585714, 4.375877, 1, 0, 0, 1, 1,
0.2854471, 1.549625, -1.098409, 1, 0, 0, 1, 1,
0.2870056, -0.4489281, 2.655143, 0, 0, 0, 1, 1,
0.2894018, -0.1749618, 2.584574, 0, 0, 0, 1, 1,
0.2948327, -0.5373372, 2.038027, 0, 0, 0, 1, 1,
0.2950621, 3.116856, -2.188387, 0, 0, 0, 1, 1,
0.2991553, 0.05862044, 1.600976, 0, 0, 0, 1, 1,
0.2991645, -0.4152527, 2.485139, 0, 0, 0, 1, 1,
0.3015881, -0.6584057, 2.906912, 0, 0, 0, 1, 1,
0.3049153, 0.136033, 1.52862, 1, 1, 1, 1, 1,
0.3083434, -0.1310092, 3.460686, 1, 1, 1, 1, 1,
0.3086775, 0.02291075, 1.16151, 1, 1, 1, 1, 1,
0.3097411, 1.322935, 1.339392, 1, 1, 1, 1, 1,
0.3102829, -0.5647914, 3.143897, 1, 1, 1, 1, 1,
0.3104213, 1.371997, -0.02762775, 1, 1, 1, 1, 1,
0.3104802, 0.5837727, -0.1898765, 1, 1, 1, 1, 1,
0.3114708, 0.5151779, -0.6245442, 1, 1, 1, 1, 1,
0.3119919, -0.2239862, 3.040985, 1, 1, 1, 1, 1,
0.3136347, -0.5248766, 3.503286, 1, 1, 1, 1, 1,
0.3142533, -1.268309, 3.486159, 1, 1, 1, 1, 1,
0.3151392, -0.5524545, 1.593855, 1, 1, 1, 1, 1,
0.3187092, 0.3793867, 0.8426264, 1, 1, 1, 1, 1,
0.3242024, -1.212924, 3.461447, 1, 1, 1, 1, 1,
0.3264337, -1.742937, 3.413547, 1, 1, 1, 1, 1,
0.3272211, -1.154587, 2.596171, 0, 0, 1, 1, 1,
0.3283421, -0.9337081, 4.653582, 1, 0, 0, 1, 1,
0.3285605, -0.8963219, 4.098929, 1, 0, 0, 1, 1,
0.3295693, -1.326571, 2.072299, 1, 0, 0, 1, 1,
0.3299514, -0.7420627, 1.476465, 1, 0, 0, 1, 1,
0.3327576, 0.4151201, 1.068346, 1, 0, 0, 1, 1,
0.343772, -0.3192214, 2.435083, 0, 0, 0, 1, 1,
0.3444712, 0.03568313, 2.66327, 0, 0, 0, 1, 1,
0.345363, 1.274737, 1.467335, 0, 0, 0, 1, 1,
0.3485738, 0.836935, -1.310828, 0, 0, 0, 1, 1,
0.3531109, -0.3532343, 3.45393, 0, 0, 0, 1, 1,
0.3539061, 1.046593, 1.766921, 0, 0, 0, 1, 1,
0.3542335, 1.303079, 1.339831, 0, 0, 0, 1, 1,
0.3595816, -0.3405943, 1.781777, 1, 1, 1, 1, 1,
0.3617059, 0.7750257, 1.441948, 1, 1, 1, 1, 1,
0.3617188, 0.07802247, 0.8299723, 1, 1, 1, 1, 1,
0.3643757, -0.1152248, 1.039795, 1, 1, 1, 1, 1,
0.3674572, -0.6867975, 3.760812, 1, 1, 1, 1, 1,
0.3682635, 0.2539863, 1.17399, 1, 1, 1, 1, 1,
0.3707413, 1.863097, -1.694171, 1, 1, 1, 1, 1,
0.3712534, -0.6736452, 2.471886, 1, 1, 1, 1, 1,
0.372881, -0.7886449, 3.504568, 1, 1, 1, 1, 1,
0.3748437, -0.2438455, 1.639767, 1, 1, 1, 1, 1,
0.3789925, -0.2108273, 2.099912, 1, 1, 1, 1, 1,
0.3804818, 0.02975554, 3.920563, 1, 1, 1, 1, 1,
0.3826844, 0.3577403, 2.633723, 1, 1, 1, 1, 1,
0.3852639, -0.5922235, 3.045909, 1, 1, 1, 1, 1,
0.3856848, -0.4376677, 2.427798, 1, 1, 1, 1, 1,
0.3863726, 0.7491282, 1.589503, 0, 0, 1, 1, 1,
0.3876282, -0.200615, 2.193251, 1, 0, 0, 1, 1,
0.3891097, 0.6834663, 0.6440699, 1, 0, 0, 1, 1,
0.3912878, 0.5018048, 2.646603, 1, 0, 0, 1, 1,
0.3916605, 1.609844, -0.7307982, 1, 0, 0, 1, 1,
0.397803, 0.02672609, 3.049643, 1, 0, 0, 1, 1,
0.3989742, 0.6399163, -0.889385, 0, 0, 0, 1, 1,
0.3996589, 0.1993224, 1.014846, 0, 0, 0, 1, 1,
0.403254, 1.08453, 1.513638, 0, 0, 0, 1, 1,
0.4039878, 1.729864, -0.2397843, 0, 0, 0, 1, 1,
0.4053979, 0.05004488, 0.8073139, 0, 0, 0, 1, 1,
0.4056268, 0.175321, 1.02788, 0, 0, 0, 1, 1,
0.405946, 0.02602025, 1.394192, 0, 0, 0, 1, 1,
0.4066085, 1.307564, 1.119942, 1, 1, 1, 1, 1,
0.4068397, 0.3305545, 1.278602, 1, 1, 1, 1, 1,
0.4074138, -0.9031996, 1.087388, 1, 1, 1, 1, 1,
0.4078874, -0.08782138, 1.828412, 1, 1, 1, 1, 1,
0.4103845, 1.992576, -0.1029829, 1, 1, 1, 1, 1,
0.4128869, -0.177544, 2.809226, 1, 1, 1, 1, 1,
0.4137241, -0.1938584, 1.254077, 1, 1, 1, 1, 1,
0.4168602, -2.001877, 4.02883, 1, 1, 1, 1, 1,
0.4209228, -1.461115, 2.275109, 1, 1, 1, 1, 1,
0.4234706, 0.8462018, 1.373339, 1, 1, 1, 1, 1,
0.4239664, 0.8456137, -1.590214, 1, 1, 1, 1, 1,
0.4253971, 0.1642375, 3.10129, 1, 1, 1, 1, 1,
0.4261015, -0.4944085, 1.808514, 1, 1, 1, 1, 1,
0.4285491, 0.0848961, 1.191827, 1, 1, 1, 1, 1,
0.4302283, 0.3403201, 1.072249, 1, 1, 1, 1, 1,
0.4317685, 1.398803, 1.625022, 0, 0, 1, 1, 1,
0.4325236, -0.6035277, 3.07645, 1, 0, 0, 1, 1,
0.4355623, 1.098851, -0.3014183, 1, 0, 0, 1, 1,
0.4382418, -0.6547012, 4.508852, 1, 0, 0, 1, 1,
0.4402648, -0.2339092, 0.7596272, 1, 0, 0, 1, 1,
0.4419915, -0.4441566, 2.037275, 1, 0, 0, 1, 1,
0.4450412, 0.3941956, 1.398191, 0, 0, 0, 1, 1,
0.4532926, -0.9436659, 2.270469, 0, 0, 0, 1, 1,
0.4597213, -0.2648498, 0.07794417, 0, 0, 0, 1, 1,
0.4606452, 0.01691727, 2.020888, 0, 0, 0, 1, 1,
0.4654762, 1.535564, 0.5443662, 0, 0, 0, 1, 1,
0.4674217, -1.01176, 3.483765, 0, 0, 0, 1, 1,
0.4689706, -0.5613301, 1.700974, 0, 0, 0, 1, 1,
0.4714982, -0.02888886, 2.145063, 1, 1, 1, 1, 1,
0.4723873, -0.0265417, 1.595483, 1, 1, 1, 1, 1,
0.4724336, -0.4137326, 3.282073, 1, 1, 1, 1, 1,
0.4728841, -0.3452652, 3.036282, 1, 1, 1, 1, 1,
0.4761007, 0.5787998, -0.0585159, 1, 1, 1, 1, 1,
0.4768545, 0.1469745, 1.50851, 1, 1, 1, 1, 1,
0.4771494, 2.55729, 0.4932302, 1, 1, 1, 1, 1,
0.4778956, 0.45717, -0.1653713, 1, 1, 1, 1, 1,
0.4894634, -0.2552018, 2.797247, 1, 1, 1, 1, 1,
0.4906531, 0.368248, -0.2571268, 1, 1, 1, 1, 1,
0.4910899, -0.2401751, 1.698993, 1, 1, 1, 1, 1,
0.4943012, 0.09000735, 2.065588, 1, 1, 1, 1, 1,
0.495308, -0.1019293, 1.740536, 1, 1, 1, 1, 1,
0.4996775, 0.003502232, 1.346617, 1, 1, 1, 1, 1,
0.5009267, -0.5374134, 1.97736, 1, 1, 1, 1, 1,
0.503248, 0.7930811, 2.269463, 0, 0, 1, 1, 1,
0.5204139, -0.3365375, 5.184974, 1, 0, 0, 1, 1,
0.5229403, 1.596349, 1.505996, 1, 0, 0, 1, 1,
0.5294221, 0.9962319, 0.6670732, 1, 0, 0, 1, 1,
0.5323324, 0.6898634, 0.3719074, 1, 0, 0, 1, 1,
0.5351385, 2.396257, -1.109591, 1, 0, 0, 1, 1,
0.541838, -0.833884, 2.457805, 0, 0, 0, 1, 1,
0.543963, -0.3052622, 0.8821255, 0, 0, 0, 1, 1,
0.5475633, -0.7900915, 2.886264, 0, 0, 0, 1, 1,
0.5497715, 2.538138, -2.304956, 0, 0, 0, 1, 1,
0.5512439, -0.220871, 2.745867, 0, 0, 0, 1, 1,
0.5564408, 1.111884, -2.010033, 0, 0, 0, 1, 1,
0.5572895, 0.0008039891, -1.098929, 0, 0, 0, 1, 1,
0.5592524, -0.09309869, 2.954123, 1, 1, 1, 1, 1,
0.563702, -0.2745832, 2.992506, 1, 1, 1, 1, 1,
0.5645525, 1.100467, -0.08759645, 1, 1, 1, 1, 1,
0.564752, -1.20711, 3.52993, 1, 1, 1, 1, 1,
0.5656965, 0.3902365, -0.01052985, 1, 1, 1, 1, 1,
0.5696043, -1.04115, 2.412566, 1, 1, 1, 1, 1,
0.5709574, -1.453269, 0.9277561, 1, 1, 1, 1, 1,
0.5742638, 2.064347, 0.1124677, 1, 1, 1, 1, 1,
0.5754187, -0.3062943, -0.01621412, 1, 1, 1, 1, 1,
0.5800505, -1.112603, 2.396884, 1, 1, 1, 1, 1,
0.580465, -0.3602746, 3.486257, 1, 1, 1, 1, 1,
0.5809962, -0.560816, 1.116831, 1, 1, 1, 1, 1,
0.5831781, 0.1993504, 0.7022133, 1, 1, 1, 1, 1,
0.5837241, 0.9367897, 0.01312051, 1, 1, 1, 1, 1,
0.5845737, 0.2743117, 1.87225, 1, 1, 1, 1, 1,
0.5873562, 0.8451441, 0.4377339, 0, 0, 1, 1, 1,
0.5880901, 0.4378172, 3.025246, 1, 0, 0, 1, 1,
0.5885481, -0.8696343, 3.737047, 1, 0, 0, 1, 1,
0.5962023, -0.5300882, 1.35087, 1, 0, 0, 1, 1,
0.5984628, 0.05410619, 2.146543, 1, 0, 0, 1, 1,
0.5997763, -0.2253962, 2.865544, 1, 0, 0, 1, 1,
0.6046458, 0.5518922, 2.122734, 0, 0, 0, 1, 1,
0.6148093, 0.3953672, 0.7768662, 0, 0, 0, 1, 1,
0.6178627, -0.01961965, 0.800163, 0, 0, 0, 1, 1,
0.6214524, -0.7576713, 2.295441, 0, 0, 0, 1, 1,
0.6227296, -0.08615294, 2.968357, 0, 0, 0, 1, 1,
0.6239734, -0.6779988, 1.416821, 0, 0, 0, 1, 1,
0.6297693, -0.8417616, 3.665811, 0, 0, 0, 1, 1,
0.6378291, 1.162084, -0.7862468, 1, 1, 1, 1, 1,
0.6387798, -0.671423, 1.979244, 1, 1, 1, 1, 1,
0.639608, 1.177406, 0.8020424, 1, 1, 1, 1, 1,
0.6411636, -2.121073, 3.656586, 1, 1, 1, 1, 1,
0.643365, 1.466184, -0.7026658, 1, 1, 1, 1, 1,
0.6483201, 0.5074843, 1.347307, 1, 1, 1, 1, 1,
0.6500365, -0.2093861, 0.8713646, 1, 1, 1, 1, 1,
0.6583354, -0.8943421, 2.375053, 1, 1, 1, 1, 1,
0.6585424, 0.8512495, 0.7189364, 1, 1, 1, 1, 1,
0.6599988, 0.5137651, 2.239799, 1, 1, 1, 1, 1,
0.6626261, 0.3578807, 1.424046, 1, 1, 1, 1, 1,
0.6627098, -0.540705, 2.945424, 1, 1, 1, 1, 1,
0.6633002, 0.4955298, 1.169787, 1, 1, 1, 1, 1,
0.6654509, 1.817998, 1.87997, 1, 1, 1, 1, 1,
0.6679582, 0.6826879, 1.075801, 1, 1, 1, 1, 1,
0.6718838, 0.7329797, 1.42584, 0, 0, 1, 1, 1,
0.6764972, 1.016605, 0.4265661, 1, 0, 0, 1, 1,
0.6831489, 1.445523, 1.102005, 1, 0, 0, 1, 1,
0.6866804, -3.191347, 3.617478, 1, 0, 0, 1, 1,
0.6871476, 1.214618, 0.1137225, 1, 0, 0, 1, 1,
0.6900155, -0.3899596, 2.328346, 1, 0, 0, 1, 1,
0.6915109, 0.5864282, 0.1383929, 0, 0, 0, 1, 1,
0.6944275, 0.3969244, 0.5977626, 0, 0, 0, 1, 1,
0.7064523, 0.7465464, 1.0117, 0, 0, 0, 1, 1,
0.7095214, -0.3256438, 1.725121, 0, 0, 0, 1, 1,
0.7097717, -1.664381, 2.76882, 0, 0, 0, 1, 1,
0.7188175, 0.4369532, 2.491922, 0, 0, 0, 1, 1,
0.7286484, -0.7185482, 2.848803, 0, 0, 0, 1, 1,
0.7299053, -0.2855789, 1.612399, 1, 1, 1, 1, 1,
0.7325292, 0.6393491, 1.976895, 1, 1, 1, 1, 1,
0.7331516, 0.4184939, 1.27641, 1, 1, 1, 1, 1,
0.7380272, -1.042176, 1.989613, 1, 1, 1, 1, 1,
0.7384937, 0.4871333, 0.3716659, 1, 1, 1, 1, 1,
0.7386094, 1.471869, 1.137546, 1, 1, 1, 1, 1,
0.7427787, 1.584888, 1.076185, 1, 1, 1, 1, 1,
0.745064, -1.381359, -0.02005508, 1, 1, 1, 1, 1,
0.7477119, 0.04940317, -0.02891467, 1, 1, 1, 1, 1,
0.7506633, -1.551609, 3.215216, 1, 1, 1, 1, 1,
0.7512246, 0.3344733, 2.255978, 1, 1, 1, 1, 1,
0.7545524, -1.11285, 4.184263, 1, 1, 1, 1, 1,
0.7552161, 0.4632815, 1.527838, 1, 1, 1, 1, 1,
0.759921, 1.250907, 2.330514, 1, 1, 1, 1, 1,
0.7606061, -0.8579638, 2.607439, 1, 1, 1, 1, 1,
0.7633813, -0.6536602, 1.801121, 0, 0, 1, 1, 1,
0.7634085, -1.7124, 3.785956, 1, 0, 0, 1, 1,
0.7640554, 0.8357562, 1.631228, 1, 0, 0, 1, 1,
0.768325, 0.04920839, 0.3204296, 1, 0, 0, 1, 1,
0.7807956, 0.5930024, 1.386238, 1, 0, 0, 1, 1,
0.7858005, 0.3412883, 3.265633, 1, 0, 0, 1, 1,
0.7877446, 1.319384, 0.2158708, 0, 0, 0, 1, 1,
0.7897551, -1.09434, 3.991903, 0, 0, 0, 1, 1,
0.8015645, 0.7941977, 1.059638, 0, 0, 0, 1, 1,
0.8051248, 0.6988068, 0.5129705, 0, 0, 0, 1, 1,
0.8055878, -0.4839059, 2.739911, 0, 0, 0, 1, 1,
0.8069816, -0.3866861, 2.911326, 0, 0, 0, 1, 1,
0.8122299, 0.1871691, 1.465593, 0, 0, 0, 1, 1,
0.8125652, 0.2699907, 0.4100811, 1, 1, 1, 1, 1,
0.8155678, -0.7116627, 3.705812, 1, 1, 1, 1, 1,
0.8162432, -1.403873, 1.409521, 1, 1, 1, 1, 1,
0.8168037, -0.2757249, 1.439028, 1, 1, 1, 1, 1,
0.8182789, 0.6788923, -0.03678901, 1, 1, 1, 1, 1,
0.8206926, 0.4254019, 0.2075331, 1, 1, 1, 1, 1,
0.8235924, -1.356923, 2.195439, 1, 1, 1, 1, 1,
0.8255292, -0.1011786, 3.063996, 1, 1, 1, 1, 1,
0.8268232, -0.281392, 1.933295, 1, 1, 1, 1, 1,
0.8283883, -0.6488937, 0.9563918, 1, 1, 1, 1, 1,
0.830848, -1.425542, 2.228121, 1, 1, 1, 1, 1,
0.8314523, -2.857804, 2.444784, 1, 1, 1, 1, 1,
0.8336621, 0.1359602, 0.7747536, 1, 1, 1, 1, 1,
0.835098, 1.264168, 1.333067, 1, 1, 1, 1, 1,
0.840602, 0.7304336, -0.284534, 1, 1, 1, 1, 1,
0.8434817, -0.2188312, 3.28081, 0, 0, 1, 1, 1,
0.8474128, -0.5173145, 2.988135, 1, 0, 0, 1, 1,
0.8479986, -2.621979, 3.768448, 1, 0, 0, 1, 1,
0.8543568, -1.04338, 1.49718, 1, 0, 0, 1, 1,
0.8545945, -0.5000452, 1.966923, 1, 0, 0, 1, 1,
0.8610359, -1.204226, 0.5999405, 1, 0, 0, 1, 1,
0.8685878, 0.09873471, 2.809796, 0, 0, 0, 1, 1,
0.8793508, -1.292469, 4.32887, 0, 0, 0, 1, 1,
0.8802968, 1.267186, 0.6809384, 0, 0, 0, 1, 1,
0.8809838, 0.3048604, 2.718592, 0, 0, 0, 1, 1,
0.8892391, -0.1643271, 0.962617, 0, 0, 0, 1, 1,
0.8965043, -1.36296, 1.004559, 0, 0, 0, 1, 1,
0.9012881, 0.4577025, 0.496754, 0, 0, 0, 1, 1,
0.9030255, 1.073211, 0.9015268, 1, 1, 1, 1, 1,
0.9030514, -0.751885, 3.482122, 1, 1, 1, 1, 1,
0.907996, 0.6349707, 1.312186, 1, 1, 1, 1, 1,
0.9090979, -0.9223847, 1.906758, 1, 1, 1, 1, 1,
0.911068, -0.4277164, 2.572124, 1, 1, 1, 1, 1,
0.920497, 1.406506, -0.2181114, 1, 1, 1, 1, 1,
0.9236023, -0.8245773, 1.268081, 1, 1, 1, 1, 1,
0.9246337, -1.110978, 1.983129, 1, 1, 1, 1, 1,
0.9335601, 0.5799434, 0.5082546, 1, 1, 1, 1, 1,
0.936165, 0.6980092, 0.08089671, 1, 1, 1, 1, 1,
0.9370506, 1.282864, 1.644228, 1, 1, 1, 1, 1,
0.9378802, 1.398443, 1.954424, 1, 1, 1, 1, 1,
0.9430575, -0.2323812, 2.791939, 1, 1, 1, 1, 1,
0.9456252, 0.2028418, 2.019672, 1, 1, 1, 1, 1,
0.9489227, -0.5381048, 4.457834, 1, 1, 1, 1, 1,
0.950361, -0.1710636, 1.811725, 0, 0, 1, 1, 1,
0.9507476, -0.5191401, -0.4031034, 1, 0, 0, 1, 1,
0.9514886, -1.640375, 1.581767, 1, 0, 0, 1, 1,
0.9526203, 0.2045091, 0.8218377, 1, 0, 0, 1, 1,
0.957274, 0.7279482, -0.3154397, 1, 0, 0, 1, 1,
0.9679658, 0.6567567, 0.5990389, 1, 0, 0, 1, 1,
0.9846905, 0.3618529, 0.778775, 0, 0, 0, 1, 1,
0.989437, 1.489724, 0.02682423, 0, 0, 0, 1, 1,
1.002543, 1.673649, 0.9871994, 0, 0, 0, 1, 1,
1.003103, 1.324123, 0.5608814, 0, 0, 0, 1, 1,
1.003612, -0.6797201, 1.649506, 0, 0, 0, 1, 1,
1.006319, 1.225256, 0.9208108, 0, 0, 0, 1, 1,
1.006735, 0.3298278, -0.8239237, 0, 0, 0, 1, 1,
1.00917, 0.3915327, 1.473462, 1, 1, 1, 1, 1,
1.015009, -0.7477982, 0.5604125, 1, 1, 1, 1, 1,
1.015989, 0.6022307, 2.01065, 1, 1, 1, 1, 1,
1.029055, 0.4025671, 3.082687, 1, 1, 1, 1, 1,
1.032182, -1.752008, 3.39048, 1, 1, 1, 1, 1,
1.03801, -0.1112342, 2.685908, 1, 1, 1, 1, 1,
1.063221, -1.226037, 1.413803, 1, 1, 1, 1, 1,
1.065745, -0.5656253, 2.682173, 1, 1, 1, 1, 1,
1.071504, 0.6586859, 1.633669, 1, 1, 1, 1, 1,
1.077226, 0.910543, 3.224768, 1, 1, 1, 1, 1,
1.082874, 1.57756, 1.275375, 1, 1, 1, 1, 1,
1.083479, -1.684372, 3.504424, 1, 1, 1, 1, 1,
1.083947, 0.515313, 1.716516, 1, 1, 1, 1, 1,
1.086164, 0.4540787, 1.354489, 1, 1, 1, 1, 1,
1.087674, 0.7958342, 2.196563, 1, 1, 1, 1, 1,
1.092653, 1.424871, 1.198809, 0, 0, 1, 1, 1,
1.098785, -1.400355, 2.168883, 1, 0, 0, 1, 1,
1.105574, 0.2228993, 1.282468, 1, 0, 0, 1, 1,
1.107409, -0.04332625, 2.146075, 1, 0, 0, 1, 1,
1.113962, 1.984188, 0.9838306, 1, 0, 0, 1, 1,
1.115895, -0.3663209, 2.176811, 1, 0, 0, 1, 1,
1.133959, 0.851454, 1.607094, 0, 0, 0, 1, 1,
1.138124, 0.2145498, 1.618459, 0, 0, 0, 1, 1,
1.141807, -0.766402, 1.937276, 0, 0, 0, 1, 1,
1.14253, 1.093621, 0.852613, 0, 0, 0, 1, 1,
1.144018, -0.7869557, 2.830317, 0, 0, 0, 1, 1,
1.145293, 0.1168125, 1.0497, 0, 0, 0, 1, 1,
1.151832, 0.7619627, -0.4049957, 0, 0, 0, 1, 1,
1.153424, 0.5131792, 0.4866374, 1, 1, 1, 1, 1,
1.169436, -0.7673842, 2.20756, 1, 1, 1, 1, 1,
1.174079, 1.265074, 1.170987, 1, 1, 1, 1, 1,
1.180028, -2.628142, 2.148935, 1, 1, 1, 1, 1,
1.186924, -0.1482779, 0.867196, 1, 1, 1, 1, 1,
1.187204, 0.1319152, -0.4587609, 1, 1, 1, 1, 1,
1.187767, -0.3861334, 1.817575, 1, 1, 1, 1, 1,
1.225232, -0.7267916, 2.596733, 1, 1, 1, 1, 1,
1.228282, -0.9047034, 2.550647, 1, 1, 1, 1, 1,
1.232314, 0.688546, 1.835013, 1, 1, 1, 1, 1,
1.232866, 0.7931963, 2.478982, 1, 1, 1, 1, 1,
1.234578, 0.3159516, 1.610696, 1, 1, 1, 1, 1,
1.234597, -0.8169715, 2.205956, 1, 1, 1, 1, 1,
1.262379, 0.9950338, -0.3105693, 1, 1, 1, 1, 1,
1.262681, 1.322309, 0.4434541, 1, 1, 1, 1, 1,
1.263092, 0.1104036, 2.105082, 0, 0, 1, 1, 1,
1.274811, -0.9311346, 1.994556, 1, 0, 0, 1, 1,
1.289215, 0.695837, 0.799404, 1, 0, 0, 1, 1,
1.293102, -1.151604, 2.653664, 1, 0, 0, 1, 1,
1.293719, -1.120231, 3.039016, 1, 0, 0, 1, 1,
1.29871, 0.05432257, 2.513035, 1, 0, 0, 1, 1,
1.308167, -0.3486481, 1.915661, 0, 0, 0, 1, 1,
1.311954, -2.584915, 3.796078, 0, 0, 0, 1, 1,
1.317181, -0.2822126, 0.9065387, 0, 0, 0, 1, 1,
1.318767, 0.7542942, -0.3638918, 0, 0, 0, 1, 1,
1.319247, 1.839582, -0.8381383, 0, 0, 0, 1, 1,
1.323267, 0.8459546, 0.3878758, 0, 0, 0, 1, 1,
1.328705, 0.2968283, 2.664646, 0, 0, 0, 1, 1,
1.328854, 0.3896007, 1.203801, 1, 1, 1, 1, 1,
1.32992, -0.4184949, 4.072033, 1, 1, 1, 1, 1,
1.332519, 1.592884, 1.330899, 1, 1, 1, 1, 1,
1.334627, 1.078285, 1.470737, 1, 1, 1, 1, 1,
1.346996, 0.6364188, 0.894249, 1, 1, 1, 1, 1,
1.350435, 1.076556, 1.360214, 1, 1, 1, 1, 1,
1.352692, -2.043423, 2.935423, 1, 1, 1, 1, 1,
1.378053, -1.883458, 0.584709, 1, 1, 1, 1, 1,
1.386568, -0.1597344, 1.675488, 1, 1, 1, 1, 1,
1.430121, 2.143651, 0.3207158, 1, 1, 1, 1, 1,
1.430496, 0.04488126, 0.7117389, 1, 1, 1, 1, 1,
1.431827, 1.632593, 1.88026, 1, 1, 1, 1, 1,
1.434249, -0.1277558, 2.35947, 1, 1, 1, 1, 1,
1.440347, 3.42377, 0.7591691, 1, 1, 1, 1, 1,
1.450174, -1.063534, 3.295404, 1, 1, 1, 1, 1,
1.456245, -0.7012302, 4.087807, 0, 0, 1, 1, 1,
1.465783, 1.293313, 1.378301, 1, 0, 0, 1, 1,
1.472083, -0.9920155, 2.944669, 1, 0, 0, 1, 1,
1.483902, -1.432223, 2.625575, 1, 0, 0, 1, 1,
1.488136, -0.2325728, 0.8756382, 1, 0, 0, 1, 1,
1.489478, -1.480242, 3.170009, 1, 0, 0, 1, 1,
1.501291, 0.6064956, 0.8297095, 0, 0, 0, 1, 1,
1.509533, -0.5857298, 0.4738044, 0, 0, 0, 1, 1,
1.514824, 1.854026, 0.09025351, 0, 0, 0, 1, 1,
1.530336, -0.1272112, 3.568945, 0, 0, 0, 1, 1,
1.536791, -0.319179, 2.398239, 0, 0, 0, 1, 1,
1.544771, 3.25708, 1.047908, 0, 0, 0, 1, 1,
1.551952, 0.4322984, 2.811091, 0, 0, 0, 1, 1,
1.552813, 0.5267086, -0.3331913, 1, 1, 1, 1, 1,
1.554517, 1.098493, 1.617715, 1, 1, 1, 1, 1,
1.558877, -0.7066061, 1.537002, 1, 1, 1, 1, 1,
1.56814, 1.852644, 1.704177, 1, 1, 1, 1, 1,
1.569064, 1.465618, 0.7591947, 1, 1, 1, 1, 1,
1.571559, 1.128964, 1.051627, 1, 1, 1, 1, 1,
1.581903, -1.064407, 3.943866, 1, 1, 1, 1, 1,
1.591192, -0.8986051, 2.565303, 1, 1, 1, 1, 1,
1.598918, 0.1581116, 0.9467528, 1, 1, 1, 1, 1,
1.599346, -0.125365, 2.406974, 1, 1, 1, 1, 1,
1.604828, -0.7028945, 2.125914, 1, 1, 1, 1, 1,
1.611357, -0.8638506, 3.003668, 1, 1, 1, 1, 1,
1.621107, -0.7148588, 1.725833, 1, 1, 1, 1, 1,
1.62146, -1.042332, 2.436369, 1, 1, 1, 1, 1,
1.627849, -0.158998, -0.01167944, 1, 1, 1, 1, 1,
1.646902, -0.6909689, 2.526445, 0, 0, 1, 1, 1,
1.648177, 0.997396, -0.29504, 1, 0, 0, 1, 1,
1.653309, -2.095329, 2.152195, 1, 0, 0, 1, 1,
1.663904, 0.730657, 2.026054, 1, 0, 0, 1, 1,
1.665831, -0.2027273, 2.713443, 1, 0, 0, 1, 1,
1.695035, 0.6323892, 1.93871, 1, 0, 0, 1, 1,
1.707176, -0.06764817, 1.001113, 0, 0, 0, 1, 1,
1.718946, -0.3101406, 1.352999, 0, 0, 0, 1, 1,
1.727706, 0.08739575, 0.477995, 0, 0, 0, 1, 1,
1.730245, 1.615181, 0.02298237, 0, 0, 0, 1, 1,
1.747827, 0.5852289, 0.04788588, 0, 0, 0, 1, 1,
1.779549, 2.256693, -0.3843302, 0, 0, 0, 1, 1,
1.78761, 0.7008118, 1.993319, 0, 0, 0, 1, 1,
1.803156, -0.6285593, 1.573495, 1, 1, 1, 1, 1,
1.846407, -1.6033, 0.417669, 1, 1, 1, 1, 1,
1.862044, -0.004565797, 1.700434, 1, 1, 1, 1, 1,
1.863597, -1.272862, 1.106291, 1, 1, 1, 1, 1,
1.871609, -1.990051, 3.184204, 1, 1, 1, 1, 1,
1.873078, -0.8571783, 3.570418, 1, 1, 1, 1, 1,
1.87867, -0.7014658, 2.890732, 1, 1, 1, 1, 1,
1.906536, -0.5948762, 1.697819, 1, 1, 1, 1, 1,
1.936084, -1.628031, 1.620134, 1, 1, 1, 1, 1,
1.937244, 0.4823915, 1.851378, 1, 1, 1, 1, 1,
1.964708, 1.521964, 0.02236048, 1, 1, 1, 1, 1,
1.984654, 0.7983422, -0.06510359, 1, 1, 1, 1, 1,
1.994832, -1.540495, 3.788216, 1, 1, 1, 1, 1,
2.019963, 0.5337952, 1.705885, 1, 1, 1, 1, 1,
2.034868, 0.1025422, 1.441672, 1, 1, 1, 1, 1,
2.057974, -0.3738891, 1.383682, 0, 0, 1, 1, 1,
2.073566, -1.058244, 1.00628, 1, 0, 0, 1, 1,
2.089131, -0.876151, 0.3850716, 1, 0, 0, 1, 1,
2.098284, 0.2722166, 2.170239, 1, 0, 0, 1, 1,
2.098535, 2.286956, 0.566667, 1, 0, 0, 1, 1,
2.104632, -0.2128138, 1.016822, 1, 0, 0, 1, 1,
2.169636, -1.838071, 3.501245, 0, 0, 0, 1, 1,
2.19478, -1.366299, 2.200171, 0, 0, 0, 1, 1,
2.202039, -0.1642026, -1.287677, 0, 0, 0, 1, 1,
2.26106, -0.7042118, 2.881158, 0, 0, 0, 1, 1,
2.506101, -0.1190651, 0.8013182, 0, 0, 0, 1, 1,
2.517451, -0.04711277, 2.24396, 0, 0, 0, 1, 1,
2.601801, 0.5347216, 2.339768, 0, 0, 0, 1, 1,
2.657296, -0.1723766, 1.46141, 1, 1, 1, 1, 1,
2.675611, 0.3617757, 3.326706, 1, 1, 1, 1, 1,
2.707329, -1.676346, 1.672351, 1, 1, 1, 1, 1,
2.756961, 1.125433, 1.248511, 1, 1, 1, 1, 1,
2.781043, 0.495487, 0.4812667, 1, 1, 1, 1, 1,
2.783855, 0.4230586, 3.02509, 1, 1, 1, 1, 1,
2.81044, -0.3895219, 0.1550208, 1, 1, 1, 1, 1
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
var radius = 9.378647;
var distance = 32.9421;
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
mvMatrix.translate( 0.2602057, -0.1162114, -0.05568385 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.9421);
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
