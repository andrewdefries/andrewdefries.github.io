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
-3.254324, -0.2814762, -2.886603, 1, 0, 0, 1,
-3.232237, -0.2158716, -1.628416, 1, 0.007843138, 0, 1,
-3.188614, -0.6004691, -1.436838, 1, 0.01176471, 0, 1,
-3.10458, -0.3172214, -1.748408, 1, 0.01960784, 0, 1,
-3.057763, -0.1836838, -3.128792, 1, 0.02352941, 0, 1,
-2.914704, 0.4781657, -1.468784, 1, 0.03137255, 0, 1,
-2.614797, -0.530853, -2.942123, 1, 0.03529412, 0, 1,
-2.536297, -1.277243, -2.963558, 1, 0.04313726, 0, 1,
-2.517586, -0.5113387, -2.419217, 1, 0.04705882, 0, 1,
-2.476609, -0.9036657, -3.237165, 1, 0.05490196, 0, 1,
-2.428953, -0.8727272, -1.150515, 1, 0.05882353, 0, 1,
-2.419731, -0.857603, -1.444325, 1, 0.06666667, 0, 1,
-2.366047, 1.654568, -1.144101, 1, 0.07058824, 0, 1,
-2.357898, 1.103788, -1.79642, 1, 0.07843138, 0, 1,
-2.332538, 0.1759604, -1.57422, 1, 0.08235294, 0, 1,
-2.332187, -0.320143, -2.588328, 1, 0.09019608, 0, 1,
-2.307792, 1.203046, -0.7113371, 1, 0.09411765, 0, 1,
-2.263842, -0.8093501, -1.645684, 1, 0.1019608, 0, 1,
-2.246279, -0.1100928, -2.844427, 1, 0.1098039, 0, 1,
-2.22775, -2.704355, -3.416785, 1, 0.1137255, 0, 1,
-2.217603, 1.153019, -0.9768791, 1, 0.1215686, 0, 1,
-2.205534, 0.4289136, -0.468267, 1, 0.1254902, 0, 1,
-2.195688, -0.8055867, -1.775278, 1, 0.1333333, 0, 1,
-2.183513, 0.8013218, -0.5402463, 1, 0.1372549, 0, 1,
-2.008541, 0.2999521, -1.734299, 1, 0.145098, 0, 1,
-1.99062, 0.5036559, -1.274569, 1, 0.1490196, 0, 1,
-1.986356, 0.7583475, -0.7036399, 1, 0.1568628, 0, 1,
-1.957398, 1.558939, -0.9236953, 1, 0.1607843, 0, 1,
-1.952025, -1.467377, -2.313683, 1, 0.1686275, 0, 1,
-1.94527, -0.3494399, -1.012498, 1, 0.172549, 0, 1,
-1.936466, -0.5461956, -2.671676, 1, 0.1803922, 0, 1,
-1.927582, -0.1526936, -2.849069, 1, 0.1843137, 0, 1,
-1.918508, 0.8034791, -1.832087, 1, 0.1921569, 0, 1,
-1.88169, -0.581679, -0.3216486, 1, 0.1960784, 0, 1,
-1.876862, -1.546255, -3.554366, 1, 0.2039216, 0, 1,
-1.872165, 0.3814645, -1.723117, 1, 0.2117647, 0, 1,
-1.85462, 0.5927746, -1.025427, 1, 0.2156863, 0, 1,
-1.853029, 0.8937708, -3.169183, 1, 0.2235294, 0, 1,
-1.842131, -0.6685913, -0.6736658, 1, 0.227451, 0, 1,
-1.836161, 1.38721, 0.4088504, 1, 0.2352941, 0, 1,
-1.832255, -0.09976593, -2.369793, 1, 0.2392157, 0, 1,
-1.820363, 0.0401024, -0.8820186, 1, 0.2470588, 0, 1,
-1.819596, 0.7573074, -1.025268, 1, 0.2509804, 0, 1,
-1.819562, -0.5385367, -3.353475, 1, 0.2588235, 0, 1,
-1.810091, 0.008781418, -1.304205, 1, 0.2627451, 0, 1,
-1.77106, 1.571711, -3.565053, 1, 0.2705882, 0, 1,
-1.770443, 0.8116554, -1.942018, 1, 0.2745098, 0, 1,
-1.765901, -0.2823017, -2.242458, 1, 0.282353, 0, 1,
-1.759373, 0.6631952, 0.5430105, 1, 0.2862745, 0, 1,
-1.755593, 0.7307165, -2.250726, 1, 0.2941177, 0, 1,
-1.744774, -0.7310555, -2.735857, 1, 0.3019608, 0, 1,
-1.744375, -1.025451, -2.884759, 1, 0.3058824, 0, 1,
-1.735384, -1.387019, -1.166668, 1, 0.3137255, 0, 1,
-1.729803, 1.310056, -2.586248, 1, 0.3176471, 0, 1,
-1.723921, -1.056161, -0.5200615, 1, 0.3254902, 0, 1,
-1.722125, 3.066422, -1.4591, 1, 0.3294118, 0, 1,
-1.711267, -0.2736382, -1.317358, 1, 0.3372549, 0, 1,
-1.705603, -1.163911, -1.912682, 1, 0.3411765, 0, 1,
-1.703038, 0.7986463, -1.288032, 1, 0.3490196, 0, 1,
-1.689733, -0.7225199, -2.338622, 1, 0.3529412, 0, 1,
-1.688779, -1.721202, -2.683262, 1, 0.3607843, 0, 1,
-1.680875, -0.8873785, -1.208359, 1, 0.3647059, 0, 1,
-1.663037, -0.6111196, -0.7192482, 1, 0.372549, 0, 1,
-1.619594, 0.3231867, -1.502624, 1, 0.3764706, 0, 1,
-1.616939, 0.07605254, -2.630523, 1, 0.3843137, 0, 1,
-1.615895, -0.9139022, -1.601326, 1, 0.3882353, 0, 1,
-1.609394, 0.4347372, 0.1663313, 1, 0.3960784, 0, 1,
-1.609096, -1.591474, -1.169289, 1, 0.4039216, 0, 1,
-1.563033, -0.08287802, -1.883203, 1, 0.4078431, 0, 1,
-1.562784, 0.2734893, -1.13052, 1, 0.4156863, 0, 1,
-1.555031, -0.539434, -0.1468003, 1, 0.4196078, 0, 1,
-1.554649, -0.2933385, -2.105518, 1, 0.427451, 0, 1,
-1.533888, 1.831369, -1.377499, 1, 0.4313726, 0, 1,
-1.532805, -0.557299, -2.817797, 1, 0.4392157, 0, 1,
-1.528143, -0.8827443, -3.325752, 1, 0.4431373, 0, 1,
-1.527548, 0.5303393, -0.661958, 1, 0.4509804, 0, 1,
-1.515749, -0.3025166, -1.86817, 1, 0.454902, 0, 1,
-1.511353, -1.855817, -3.476077, 1, 0.4627451, 0, 1,
-1.505654, 0.5395843, -0.9352866, 1, 0.4666667, 0, 1,
-1.498663, -0.9317129, -2.98435, 1, 0.4745098, 0, 1,
-1.494683, 1.390265, -1.139375, 1, 0.4784314, 0, 1,
-1.488946, -1.536294, -2.789174, 1, 0.4862745, 0, 1,
-1.488811, 1.725717, -1.276568, 1, 0.4901961, 0, 1,
-1.487024, -0.2090886, -1.995379, 1, 0.4980392, 0, 1,
-1.472394, 0.05332758, -0.8023053, 1, 0.5058824, 0, 1,
-1.460358, -0.3222162, -1.356387, 1, 0.509804, 0, 1,
-1.459706, -0.6616878, -0.7822344, 1, 0.5176471, 0, 1,
-1.453296, -0.8758437, -2.399184, 1, 0.5215687, 0, 1,
-1.452432, 0.8298304, -1.076814, 1, 0.5294118, 0, 1,
-1.449586, -0.03805032, -0.9615633, 1, 0.5333334, 0, 1,
-1.446252, -1.717449, -3.496295, 1, 0.5411765, 0, 1,
-1.442123, -3.446332, -2.636108, 1, 0.5450981, 0, 1,
-1.436421, 0.1683875, -3.73452, 1, 0.5529412, 0, 1,
-1.435267, -0.3661013, -1.325775, 1, 0.5568628, 0, 1,
-1.433936, 0.2392834, -3.224131, 1, 0.5647059, 0, 1,
-1.428734, 0.07427342, -1.563323, 1, 0.5686275, 0, 1,
-1.428159, -2.368642, -3.577333, 1, 0.5764706, 0, 1,
-1.426, 0.8281838, -0.1104772, 1, 0.5803922, 0, 1,
-1.406617, 1.062234, -1.159053, 1, 0.5882353, 0, 1,
-1.401054, -0.1942219, -2.045666, 1, 0.5921569, 0, 1,
-1.39196, 0.1678203, -0.6896386, 1, 0.6, 0, 1,
-1.382407, -0.5872518, -0.2694805, 1, 0.6078432, 0, 1,
-1.370311, -0.03145129, -1.052544, 1, 0.6117647, 0, 1,
-1.37015, 1.65962, -3.303216, 1, 0.6196079, 0, 1,
-1.358004, 0.3912823, -1.228323, 1, 0.6235294, 0, 1,
-1.356139, 0.06878906, -0.6571076, 1, 0.6313726, 0, 1,
-1.355533, -0.7909897, -3.846628, 1, 0.6352941, 0, 1,
-1.351611, -0.5526329, -1.06763, 1, 0.6431373, 0, 1,
-1.348462, 0.128279, -1.784264, 1, 0.6470588, 0, 1,
-1.338831, -1.086962, -1.058066, 1, 0.654902, 0, 1,
-1.337171, -0.4016382, -2.343061, 1, 0.6588235, 0, 1,
-1.332664, -1.17252, -0.9010465, 1, 0.6666667, 0, 1,
-1.330811, -0.5751834, -2.662988, 1, 0.6705883, 0, 1,
-1.322681, -1.58234, -4.513223, 1, 0.6784314, 0, 1,
-1.315233, 0.01187231, -0.2627492, 1, 0.682353, 0, 1,
-1.313936, 0.3882553, -0.6653413, 1, 0.6901961, 0, 1,
-1.311529, -1.053541, -3.597341, 1, 0.6941177, 0, 1,
-1.301383, 0.9770272, -0.0333598, 1, 0.7019608, 0, 1,
-1.293475, -0.550776, -2.890541, 1, 0.7098039, 0, 1,
-1.291018, -1.276956, -2.594815, 1, 0.7137255, 0, 1,
-1.289976, -0.8131071, -1.856951, 1, 0.7215686, 0, 1,
-1.287286, 1.320711, -1.274842, 1, 0.7254902, 0, 1,
-1.283337, -0.255284, -1.678873, 1, 0.7333333, 0, 1,
-1.276972, 0.2850069, -1.976922, 1, 0.7372549, 0, 1,
-1.273745, -1.094786, -2.204388, 1, 0.7450981, 0, 1,
-1.264347, 0.6987798, -1.302754, 1, 0.7490196, 0, 1,
-1.261333, -2.631024, -1.591514, 1, 0.7568628, 0, 1,
-1.25536, 1.420297, 0.121636, 1, 0.7607843, 0, 1,
-1.243755, 0.3963916, -2.358982, 1, 0.7686275, 0, 1,
-1.227476, -1.362215, -4.181, 1, 0.772549, 0, 1,
-1.219736, -0.2784723, -3.425135, 1, 0.7803922, 0, 1,
-1.216972, 0.8436383, -1.832641, 1, 0.7843137, 0, 1,
-1.216845, -0.3874669, -1.647967, 1, 0.7921569, 0, 1,
-1.193097, 0.424785, -1.630271, 1, 0.7960784, 0, 1,
-1.19158, -0.9407023, -3.383767, 1, 0.8039216, 0, 1,
-1.191106, -0.05584804, -1.620965, 1, 0.8117647, 0, 1,
-1.191028, -0.3576857, -1.729069, 1, 0.8156863, 0, 1,
-1.187711, 0.726646, -1.739044, 1, 0.8235294, 0, 1,
-1.185496, 0.1097552, -1.056596, 1, 0.827451, 0, 1,
-1.183126, 0.5402457, -1.188775, 1, 0.8352941, 0, 1,
-1.180442, 0.3950021, -1.674147, 1, 0.8392157, 0, 1,
-1.176715, -0.04131067, -2.669795, 1, 0.8470588, 0, 1,
-1.166723, -0.4174001, -2.440085, 1, 0.8509804, 0, 1,
-1.163235, 0.07008767, -1.556673, 1, 0.8588235, 0, 1,
-1.15874, 0.1163772, -0.9565687, 1, 0.8627451, 0, 1,
-1.156923, -1.10096, -1.953873, 1, 0.8705882, 0, 1,
-1.153912, -0.2568693, -1.391873, 1, 0.8745098, 0, 1,
-1.152285, -0.5731182, -1.249459, 1, 0.8823529, 0, 1,
-1.151457, 1.055448, -1.771917, 1, 0.8862745, 0, 1,
-1.149447, 1.099666, 0.7981623, 1, 0.8941177, 0, 1,
-1.139396, -1.159863, -3.56139, 1, 0.8980392, 0, 1,
-1.136772, 0.319483, -0.09380437, 1, 0.9058824, 0, 1,
-1.13399, -0.7874537, -2.179616, 1, 0.9137255, 0, 1,
-1.120325, -0.8605923, -2.944216, 1, 0.9176471, 0, 1,
-1.117919, 0.8600367, -1.724936, 1, 0.9254902, 0, 1,
-1.117465, -0.005786527, -1.250449, 1, 0.9294118, 0, 1,
-1.112832, 1.125453, -0.7060383, 1, 0.9372549, 0, 1,
-1.108949, 0.8108518, 0.3096671, 1, 0.9411765, 0, 1,
-1.1021, 0.31681, -2.635417, 1, 0.9490196, 0, 1,
-1.098122, -0.6356432, -2.590511, 1, 0.9529412, 0, 1,
-1.09722, -1.107138, -3.570992, 1, 0.9607843, 0, 1,
-1.094433, 0.9150735, -1.542053, 1, 0.9647059, 0, 1,
-1.093517, -0.8123385, 0.1581342, 1, 0.972549, 0, 1,
-1.093371, 0.3178967, -1.275184, 1, 0.9764706, 0, 1,
-1.089188, 0.5526272, -0.9376485, 1, 0.9843137, 0, 1,
-1.079237, 0.9287834, -1.837048, 1, 0.9882353, 0, 1,
-1.074843, -0.4437999, -2.162663, 1, 0.9960784, 0, 1,
-1.071366, -1.081928, -2.645029, 0.9960784, 1, 0, 1,
-1.065813, 0.2759347, -0.389555, 0.9921569, 1, 0, 1,
-1.063964, 0.2498113, -0.817531, 0.9843137, 1, 0, 1,
-1.059678, 0.5292633, -0.4153149, 0.9803922, 1, 0, 1,
-1.059188, -0.3990393, -2.564343, 0.972549, 1, 0, 1,
-1.052143, -0.4287858, -1.739834, 0.9686275, 1, 0, 1,
-1.051364, 1.086739, 1.143474, 0.9607843, 1, 0, 1,
-1.049132, -0.6606715, -2.797646, 0.9568627, 1, 0, 1,
-1.036147, 1.493916, -1.136585, 0.9490196, 1, 0, 1,
-1.033373, 1.755213, -1.302672, 0.945098, 1, 0, 1,
-1.019008, 0.8229433, -2.794358, 0.9372549, 1, 0, 1,
-1.017892, 0.4180716, -2.411029, 0.9333333, 1, 0, 1,
-1.01752, -0.2797208, -2.156556, 0.9254902, 1, 0, 1,
-1.013789, 1.030212, 1.64089, 0.9215686, 1, 0, 1,
-1.013074, -1.496013, -2.111862, 0.9137255, 1, 0, 1,
-1.012908, -0.9855072, -5.040173, 0.9098039, 1, 0, 1,
-0.9992537, 0.3587194, -1.79589, 0.9019608, 1, 0, 1,
-0.9989467, 0.6835085, -1.095455, 0.8941177, 1, 0, 1,
-0.9987133, 0.00293679, -1.296679, 0.8901961, 1, 0, 1,
-0.9975115, 0.1873061, -1.795972, 0.8823529, 1, 0, 1,
-0.9965094, -1.012386, -1.812475, 0.8784314, 1, 0, 1,
-0.9942483, 0.8588316, -2.242081, 0.8705882, 1, 0, 1,
-0.9939713, -0.1715006, -1.175497, 0.8666667, 1, 0, 1,
-0.9939299, 0.02827486, -1.892274, 0.8588235, 1, 0, 1,
-0.9899126, -0.5250493, -3.22103, 0.854902, 1, 0, 1,
-0.9843538, -0.3053122, -1.524398, 0.8470588, 1, 0, 1,
-0.9841818, -0.3227719, 0.3057111, 0.8431373, 1, 0, 1,
-0.9779365, -1.483735, -2.226377, 0.8352941, 1, 0, 1,
-0.9773877, 1.251358, -1.238734, 0.8313726, 1, 0, 1,
-0.9672866, 1.154599, -0.4474916, 0.8235294, 1, 0, 1,
-0.9664994, 0.1163674, -3.210362, 0.8196079, 1, 0, 1,
-0.9633803, -0.1434045, -2.848163, 0.8117647, 1, 0, 1,
-0.9632582, 0.1585835, -1.636146, 0.8078431, 1, 0, 1,
-0.961403, -2.394859, -1.955867, 0.8, 1, 0, 1,
-0.9610206, 0.3254877, -0.5206714, 0.7921569, 1, 0, 1,
-0.9586216, -0.8527418, -2.128693, 0.7882353, 1, 0, 1,
-0.9481382, 1.050739, -1.732812, 0.7803922, 1, 0, 1,
-0.9424624, 1.711933, -1.997093, 0.7764706, 1, 0, 1,
-0.9399228, -0.8247326, -1.860988, 0.7686275, 1, 0, 1,
-0.9398299, -0.03091573, -0.3102029, 0.7647059, 1, 0, 1,
-0.9373172, 1.516859, -0.05906362, 0.7568628, 1, 0, 1,
-0.9268532, 0.9057539, -1.442114, 0.7529412, 1, 0, 1,
-0.9228444, 1.131801, -3.128512, 0.7450981, 1, 0, 1,
-0.9214209, 0.107323, -3.493286, 0.7411765, 1, 0, 1,
-0.9172919, 0.1189519, -0.9774685, 0.7333333, 1, 0, 1,
-0.915516, 0.394687, -0.5083491, 0.7294118, 1, 0, 1,
-0.9109466, 0.1254787, -0.3212352, 0.7215686, 1, 0, 1,
-0.9100278, 0.3596869, 0.9834133, 0.7176471, 1, 0, 1,
-0.9072374, -0.9808423, -4.984382, 0.7098039, 1, 0, 1,
-0.8939302, -1.644611, -1.396103, 0.7058824, 1, 0, 1,
-0.8938904, 0.613996, -0.8795986, 0.6980392, 1, 0, 1,
-0.8875762, -0.9014726, -2.92334, 0.6901961, 1, 0, 1,
-0.8875384, 0.9842119, 0.3497057, 0.6862745, 1, 0, 1,
-0.8837073, -0.2824733, -2.486689, 0.6784314, 1, 0, 1,
-0.8775773, 1.510776, -0.5864268, 0.6745098, 1, 0, 1,
-0.8774566, -0.1500532, -0.9311035, 0.6666667, 1, 0, 1,
-0.8766167, -0.3132166, -2.271709, 0.6627451, 1, 0, 1,
-0.873974, 2.139118, -1.762055, 0.654902, 1, 0, 1,
-0.8658814, -1.336515, -1.075548, 0.6509804, 1, 0, 1,
-0.8634193, 1.729081, -0.8243779, 0.6431373, 1, 0, 1,
-0.8588669, 0.1918012, -2.966057, 0.6392157, 1, 0, 1,
-0.8584303, -0.7048949, -3.392206, 0.6313726, 1, 0, 1,
-0.8566496, -0.6538557, -3.241102, 0.627451, 1, 0, 1,
-0.8556403, 0.6835055, -2.577477, 0.6196079, 1, 0, 1,
-0.8556192, -0.5678992, -0.6007499, 0.6156863, 1, 0, 1,
-0.8520812, 0.3527385, -1.688319, 0.6078432, 1, 0, 1,
-0.8510214, 1.30029, 0.1228214, 0.6039216, 1, 0, 1,
-0.8509881, 0.05060565, -2.359172, 0.5960785, 1, 0, 1,
-0.8472643, 0.7805506, -0.3922659, 0.5882353, 1, 0, 1,
-0.8427369, 1.486139, -0.168916, 0.5843138, 1, 0, 1,
-0.8418818, -1.52168, -1.788937, 0.5764706, 1, 0, 1,
-0.836593, -0.4938117, -2.417057, 0.572549, 1, 0, 1,
-0.8364178, 0.9312606, -0.7052401, 0.5647059, 1, 0, 1,
-0.8288766, 0.7754899, -0.3967533, 0.5607843, 1, 0, 1,
-0.8113894, 1.89377, 0.8731139, 0.5529412, 1, 0, 1,
-0.8099717, -1.845225, -0.9603037, 0.5490196, 1, 0, 1,
-0.8045015, 0.3981045, -1.558325, 0.5411765, 1, 0, 1,
-0.800457, 0.3483288, -2.195038, 0.5372549, 1, 0, 1,
-0.7954706, -0.5987367, -0.4565701, 0.5294118, 1, 0, 1,
-0.7897491, 0.6453968, -0.7148123, 0.5254902, 1, 0, 1,
-0.7890645, 0.2523318, -1.256924, 0.5176471, 1, 0, 1,
-0.7777871, 0.3824351, -1.549351, 0.5137255, 1, 0, 1,
-0.7671738, -1.016128, -3.620922, 0.5058824, 1, 0, 1,
-0.7657086, 0.2420103, -2.822673, 0.5019608, 1, 0, 1,
-0.7576091, 1.314903, -0.8342355, 0.4941176, 1, 0, 1,
-0.7564802, -1.519702, -3.10861, 0.4862745, 1, 0, 1,
-0.7516164, 0.656865, -0.5385507, 0.4823529, 1, 0, 1,
-0.7476243, 0.6226667, -2.580466, 0.4745098, 1, 0, 1,
-0.7438977, -0.7209523, -1.441743, 0.4705882, 1, 0, 1,
-0.7435176, 0.9879826, 0.3250244, 0.4627451, 1, 0, 1,
-0.7422747, -1.443946, -2.420252, 0.4588235, 1, 0, 1,
-0.7339311, -1.648123, -3.562864, 0.4509804, 1, 0, 1,
-0.7319325, 0.02328849, -1.669589, 0.4470588, 1, 0, 1,
-0.7318627, 0.3284526, -2.904727, 0.4392157, 1, 0, 1,
-0.7292061, -2.47488, -3.080226, 0.4352941, 1, 0, 1,
-0.7262908, -0.3808324, -2.046464, 0.427451, 1, 0, 1,
-0.7239352, -0.2772205, -2.333347, 0.4235294, 1, 0, 1,
-0.7231112, 1.362723, 1.282238, 0.4156863, 1, 0, 1,
-0.7219245, 2.033821, 1.38982, 0.4117647, 1, 0, 1,
-0.7188631, -0.09375196, -3.27446, 0.4039216, 1, 0, 1,
-0.7186272, 0.4911445, 0.4279374, 0.3960784, 1, 0, 1,
-0.7159374, 0.2309825, -3.099754, 0.3921569, 1, 0, 1,
-0.7148492, -0.4723324, -2.297741, 0.3843137, 1, 0, 1,
-0.7119333, -0.2098025, -2.983133, 0.3803922, 1, 0, 1,
-0.71138, -0.7170672, -2.518651, 0.372549, 1, 0, 1,
-0.7103029, -0.271652, -1.532172, 0.3686275, 1, 0, 1,
-0.7088569, 0.8313059, -2.033627, 0.3607843, 1, 0, 1,
-0.7079701, -0.0001003357, -1.85068, 0.3568628, 1, 0, 1,
-0.7050226, 0.225826, 0.1696469, 0.3490196, 1, 0, 1,
-0.7043037, -1.598643, -2.44478, 0.345098, 1, 0, 1,
-0.7038904, -0.2113402, -2.31032, 0.3372549, 1, 0, 1,
-0.7030218, 0.4773294, -2.773775, 0.3333333, 1, 0, 1,
-0.7026495, -0.6823683, -3.894182, 0.3254902, 1, 0, 1,
-0.7016051, -1.100728, -3.348516, 0.3215686, 1, 0, 1,
-0.6986502, 1.107049, -0.4398193, 0.3137255, 1, 0, 1,
-0.6965622, 0.6797509, -0.5387388, 0.3098039, 1, 0, 1,
-0.6935253, -0.6146396, -2.788124, 0.3019608, 1, 0, 1,
-0.6929175, -0.9987766, -2.765175, 0.2941177, 1, 0, 1,
-0.6879231, -0.1518182, -1.120385, 0.2901961, 1, 0, 1,
-0.6847258, -0.01498069, -0.4831122, 0.282353, 1, 0, 1,
-0.6845855, 0.7366908, -0.2096539, 0.2784314, 1, 0, 1,
-0.6789842, -0.4614244, -1.754373, 0.2705882, 1, 0, 1,
-0.678898, -2.468241, -3.044369, 0.2666667, 1, 0, 1,
-0.6773508, 0.2359397, -1.80073, 0.2588235, 1, 0, 1,
-0.6734572, 2.822737, -0.9760605, 0.254902, 1, 0, 1,
-0.6708889, 1.750926, 0.4001264, 0.2470588, 1, 0, 1,
-0.6706086, 0.5431224, 0.6916627, 0.2431373, 1, 0, 1,
-0.6679378, 0.08863913, 1.819125, 0.2352941, 1, 0, 1,
-0.6671133, -0.2102675, -3.415276, 0.2313726, 1, 0, 1,
-0.6668463, -1.959586, -3.145828, 0.2235294, 1, 0, 1,
-0.6638112, -0.6891534, -2.702552, 0.2196078, 1, 0, 1,
-0.6625397, -0.1712895, -1.251342, 0.2117647, 1, 0, 1,
-0.6615693, 0.7414486, 0.5514733, 0.2078431, 1, 0, 1,
-0.6556927, -0.98651, -4.549458, 0.2, 1, 0, 1,
-0.6552078, 0.3871207, -1.549675, 0.1921569, 1, 0, 1,
-0.6488317, 0.09266601, -2.623521, 0.1882353, 1, 0, 1,
-0.6480547, 1.367503, 1.196104, 0.1803922, 1, 0, 1,
-0.6407757, 1.481649, -2.182691, 0.1764706, 1, 0, 1,
-0.6406724, 0.172539, -1.702812, 0.1686275, 1, 0, 1,
-0.6400793, -0.5851192, -2.421602, 0.1647059, 1, 0, 1,
-0.6345419, -0.2699928, -0.4924461, 0.1568628, 1, 0, 1,
-0.6295592, -0.4033901, -3.539673, 0.1529412, 1, 0, 1,
-0.6269922, 0.09242346, -0.1273783, 0.145098, 1, 0, 1,
-0.6257582, 0.6012589, 1.892415, 0.1411765, 1, 0, 1,
-0.622777, 0.9793171, -0.7006274, 0.1333333, 1, 0, 1,
-0.6215129, 0.4121501, -1.531069, 0.1294118, 1, 0, 1,
-0.6046308, 0.9564769, -0.4929427, 0.1215686, 1, 0, 1,
-0.601126, -0.4931692, -1.650954, 0.1176471, 1, 0, 1,
-0.6007231, 0.6684992, -0.4009247, 0.1098039, 1, 0, 1,
-0.5915996, -0.04368375, -1.726444, 0.1058824, 1, 0, 1,
-0.5878637, -0.7195556, -1.949374, 0.09803922, 1, 0, 1,
-0.5859156, -0.5591114, -1.658425, 0.09019608, 1, 0, 1,
-0.5846484, -1.436387, -2.335743, 0.08627451, 1, 0, 1,
-0.5832555, 1.544448, -0.6075222, 0.07843138, 1, 0, 1,
-0.5799705, -0.1487812, -2.06875, 0.07450981, 1, 0, 1,
-0.5793098, -1.544984, -1.795657, 0.06666667, 1, 0, 1,
-0.5764064, -0.2381559, -1.293482, 0.0627451, 1, 0, 1,
-0.5759243, 0.8398514, 0.25292, 0.05490196, 1, 0, 1,
-0.5739471, 1.981884, -0.5866767, 0.05098039, 1, 0, 1,
-0.572842, 0.4696325, 0.04667797, 0.04313726, 1, 0, 1,
-0.5727338, 0.6563402, -1.385928, 0.03921569, 1, 0, 1,
-0.5627884, 0.0533845, -1.572764, 0.03137255, 1, 0, 1,
-0.5594559, 0.1190739, -1.976253, 0.02745098, 1, 0, 1,
-0.550461, -2.293778, -2.669348, 0.01960784, 1, 0, 1,
-0.5488034, 1.015377, 0.8050553, 0.01568628, 1, 0, 1,
-0.5406033, 0.6222559, -1.286522, 0.007843138, 1, 0, 1,
-0.539938, 1.039429, -1.662671, 0.003921569, 1, 0, 1,
-0.5303178, 0.9751876, -0.3175042, 0, 1, 0.003921569, 1,
-0.5253196, 0.5968421, -0.645291, 0, 1, 0.01176471, 1,
-0.5243984, 0.5547455, 0.4727265, 0, 1, 0.01568628, 1,
-0.5217031, 0.1637258, -2.499236, 0, 1, 0.02352941, 1,
-0.5195458, 0.2944769, -0.6670225, 0, 1, 0.02745098, 1,
-0.5157267, 0.3868959, -0.7396798, 0, 1, 0.03529412, 1,
-0.5136821, -0.6034324, -3.616594, 0, 1, 0.03921569, 1,
-0.513027, 1.051202, -0.9713184, 0, 1, 0.04705882, 1,
-0.5065219, -2.009534, -3.327168, 0, 1, 0.05098039, 1,
-0.5039587, -0.3929471, -2.378275, 0, 1, 0.05882353, 1,
-0.499945, 1.643456, -0.6350256, 0, 1, 0.0627451, 1,
-0.4925787, -0.8796153, -2.849324, 0, 1, 0.07058824, 1,
-0.4869058, 0.4890316, -0.3560728, 0, 1, 0.07450981, 1,
-0.477336, 0.4659658, -2.754511, 0, 1, 0.08235294, 1,
-0.4762077, -2.377753, -0.352176, 0, 1, 0.08627451, 1,
-0.4740354, 0.6662598, -1.888887, 0, 1, 0.09411765, 1,
-0.4730636, 0.07493383, -0.8462951, 0, 1, 0.1019608, 1,
-0.4689076, -0.3946245, -3.634753, 0, 1, 0.1058824, 1,
-0.468349, -0.7385004, -1.067839, 0, 1, 0.1137255, 1,
-0.4667673, -0.04060923, -1.816296, 0, 1, 0.1176471, 1,
-0.4665937, 1.733192, -2.044845, 0, 1, 0.1254902, 1,
-0.4653533, 0.8982649, -0.5341981, 0, 1, 0.1294118, 1,
-0.4628917, -0.8216274, -4.014132, 0, 1, 0.1372549, 1,
-0.4539115, 2.502613, -0.7280949, 0, 1, 0.1411765, 1,
-0.4480214, -0.8499098, -1.773977, 0, 1, 0.1490196, 1,
-0.4445206, -1.116004, -2.085873, 0, 1, 0.1529412, 1,
-0.4424079, -0.1775745, -1.625913, 0, 1, 0.1607843, 1,
-0.4419016, 0.02455517, -0.8502035, 0, 1, 0.1647059, 1,
-0.4379097, 0.1132124, -1.363467, 0, 1, 0.172549, 1,
-0.4325905, 0.2154839, -2.106858, 0, 1, 0.1764706, 1,
-0.4317772, -0.7274147, -3.875075, 0, 1, 0.1843137, 1,
-0.4312418, 0.8916402, -0.9170813, 0, 1, 0.1882353, 1,
-0.4232717, 0.03402202, -0.3135153, 0, 1, 0.1960784, 1,
-0.4224277, 1.299044, -2.115302, 0, 1, 0.2039216, 1,
-0.4215036, 0.6542218, -1.133265, 0, 1, 0.2078431, 1,
-0.4208123, -0.87361, -2.886031, 0, 1, 0.2156863, 1,
-0.4205376, -0.2787203, -1.075354, 0, 1, 0.2196078, 1,
-0.4202808, -1.346733, -4.630572, 0, 1, 0.227451, 1,
-0.4177807, -0.9054087, -3.37619, 0, 1, 0.2313726, 1,
-0.4161335, -0.2555833, -1.288299, 0, 1, 0.2392157, 1,
-0.4085202, 0.7356021, -1.148782, 0, 1, 0.2431373, 1,
-0.4062459, 0.8240962, -0.192972, 0, 1, 0.2509804, 1,
-0.4032622, -0.3376887, -3.360503, 0, 1, 0.254902, 1,
-0.4007775, -0.3498028, -2.57925, 0, 1, 0.2627451, 1,
-0.3950782, -1.11767, -1.654584, 0, 1, 0.2666667, 1,
-0.3946313, -0.6133009, -3.983748, 0, 1, 0.2745098, 1,
-0.3888733, 1.239124, 0.404922, 0, 1, 0.2784314, 1,
-0.3873263, 1.92895, -1.193152, 0, 1, 0.2862745, 1,
-0.3872245, 1.269332, -0.6925272, 0, 1, 0.2901961, 1,
-0.3836546, -1.038436, -2.312493, 0, 1, 0.2980392, 1,
-0.3796601, -0.1883661, -1.416502, 0, 1, 0.3058824, 1,
-0.3734351, -1.080509, -2.52913, 0, 1, 0.3098039, 1,
-0.3734273, 1.313315, -2.880167, 0, 1, 0.3176471, 1,
-0.3724346, -0.01060945, -0.5996438, 0, 1, 0.3215686, 1,
-0.3676658, 0.1076244, -0.9121743, 0, 1, 0.3294118, 1,
-0.3648615, 2.241186, 0.01384156, 0, 1, 0.3333333, 1,
-0.3641009, 0.5278842, -2.245657, 0, 1, 0.3411765, 1,
-0.363328, 0.9525279, 0.6230136, 0, 1, 0.345098, 1,
-0.3608374, -0.8149204, -1.623568, 0, 1, 0.3529412, 1,
-0.3555999, 0.863701, -0.1055092, 0, 1, 0.3568628, 1,
-0.3509513, -0.02952813, -2.870044, 0, 1, 0.3647059, 1,
-0.3509039, 0.9468442, 0.7235802, 0, 1, 0.3686275, 1,
-0.3488936, -0.3620052, -2.347563, 0, 1, 0.3764706, 1,
-0.3443815, 2.533551, -0.3822755, 0, 1, 0.3803922, 1,
-0.3397665, -0.2494535, -3.564208, 0, 1, 0.3882353, 1,
-0.3240796, 1.275808, -0.5113177, 0, 1, 0.3921569, 1,
-0.3036115, -0.03820455, -2.935971, 0, 1, 0.4, 1,
-0.298799, 2.124, 2.269382, 0, 1, 0.4078431, 1,
-0.2978804, 1.311838, 0.1879638, 0, 1, 0.4117647, 1,
-0.2957393, 1.978111, -0.6634612, 0, 1, 0.4196078, 1,
-0.2953077, 0.2851819, -1.13746, 0, 1, 0.4235294, 1,
-0.2938574, 1.801157, 1.075837, 0, 1, 0.4313726, 1,
-0.2917033, 0.4751512, -0.4535138, 0, 1, 0.4352941, 1,
-0.2839099, -0.7881563, -2.695625, 0, 1, 0.4431373, 1,
-0.2757618, 1.167686, -1.797449, 0, 1, 0.4470588, 1,
-0.2689049, -1.601673, -2.613755, 0, 1, 0.454902, 1,
-0.2686798, -0.5465609, -1.909794, 0, 1, 0.4588235, 1,
-0.2668051, 0.6637629, 0.1850526, 0, 1, 0.4666667, 1,
-0.2660234, -0.8418424, -1.966308, 0, 1, 0.4705882, 1,
-0.2632589, -0.08945689, -1.663742, 0, 1, 0.4784314, 1,
-0.262307, -0.5222932, -3.710815, 0, 1, 0.4823529, 1,
-0.2608797, 0.3910313, -1.615271, 0, 1, 0.4901961, 1,
-0.2553268, 0.71242, -0.6839514, 0, 1, 0.4941176, 1,
-0.2539501, -2.033788, -2.787945, 0, 1, 0.5019608, 1,
-0.2524163, 0.3817014, 1.361763, 0, 1, 0.509804, 1,
-0.2488222, -0.2744271, -1.95031, 0, 1, 0.5137255, 1,
-0.2473435, 0.2858582, -0.542611, 0, 1, 0.5215687, 1,
-0.2446689, -0.8167183, -3.898606, 0, 1, 0.5254902, 1,
-0.2399201, 0.6529367, 0.3881724, 0, 1, 0.5333334, 1,
-0.2394131, 1.200054, -0.6439257, 0, 1, 0.5372549, 1,
-0.2387633, 0.303112, 0.3302402, 0, 1, 0.5450981, 1,
-0.2386379, 0.4958771, -0.4613624, 0, 1, 0.5490196, 1,
-0.2340657, 0.853069, -1.361495, 0, 1, 0.5568628, 1,
-0.2307241, 0.6655977, -1.814992, 0, 1, 0.5607843, 1,
-0.2268793, 0.5569876, -0.5364773, 0, 1, 0.5686275, 1,
-0.2255692, 0.2052654, 0.2672169, 0, 1, 0.572549, 1,
-0.2201212, -1.542757, -3.449021, 0, 1, 0.5803922, 1,
-0.2152175, -1.009925, -2.938301, 0, 1, 0.5843138, 1,
-0.2131947, -0.01989173, -1.548032, 0, 1, 0.5921569, 1,
-0.211078, -0.8072969, -2.391297, 0, 1, 0.5960785, 1,
-0.2098914, -0.9829067, -2.706847, 0, 1, 0.6039216, 1,
-0.2084329, -1.258439, -1.559686, 0, 1, 0.6117647, 1,
-0.2007419, -1.299368, -2.036934, 0, 1, 0.6156863, 1,
-0.1962822, 0.2101843, -2.317524, 0, 1, 0.6235294, 1,
-0.1933522, 0.897633, 0.01996443, 0, 1, 0.627451, 1,
-0.1906968, -0.6980441, -3.474752, 0, 1, 0.6352941, 1,
-0.1894235, 1.024744, -0.3247229, 0, 1, 0.6392157, 1,
-0.1890527, 0.4405541, -0.6153004, 0, 1, 0.6470588, 1,
-0.1872034, 0.7215694, -0.09987514, 0, 1, 0.6509804, 1,
-0.1854813, 1.253776, -0.19614, 0, 1, 0.6588235, 1,
-0.1846192, -0.6232384, -1.102974, 0, 1, 0.6627451, 1,
-0.1839089, 0.3517277, -0.5213067, 0, 1, 0.6705883, 1,
-0.179122, 0.517472, -1.338044, 0, 1, 0.6745098, 1,
-0.1774164, -0.4622738, -3.700666, 0, 1, 0.682353, 1,
-0.1765799, -0.1423591, -0.4653941, 0, 1, 0.6862745, 1,
-0.1722597, 0.9295844, 0.3743189, 0, 1, 0.6941177, 1,
-0.1712555, -1.165126, -4.729727, 0, 1, 0.7019608, 1,
-0.1699419, 1.326914, -0.989173, 0, 1, 0.7058824, 1,
-0.1688348, -0.4393393, -1.629208, 0, 1, 0.7137255, 1,
-0.1648662, -2.348295, -4.122525, 0, 1, 0.7176471, 1,
-0.1627701, 0.6150758, -0.3034575, 0, 1, 0.7254902, 1,
-0.1614515, 0.3909108, -1.874309, 0, 1, 0.7294118, 1,
-0.1601718, -0.09157941, -1.334872, 0, 1, 0.7372549, 1,
-0.1594806, -1.186203, -4.088089, 0, 1, 0.7411765, 1,
-0.1511609, 0.8148487, -2.751146, 0, 1, 0.7490196, 1,
-0.1452106, 0.8825976, -1.14567, 0, 1, 0.7529412, 1,
-0.1415408, 0.1900736, -1.291226, 0, 1, 0.7607843, 1,
-0.1407834, -0.1227852, -3.224577, 0, 1, 0.7647059, 1,
-0.1382492, 0.1277094, -2.236377, 0, 1, 0.772549, 1,
-0.1359206, 0.863299, 0.1429283, 0, 1, 0.7764706, 1,
-0.1268388, 0.7246304, -1.074611, 0, 1, 0.7843137, 1,
-0.1265303, -1.051159, -1.05254, 0, 1, 0.7882353, 1,
-0.1263297, 0.7319139, -0.7771723, 0, 1, 0.7960784, 1,
-0.1251572, -0.825564, -2.185073, 0, 1, 0.8039216, 1,
-0.1221042, -0.6139181, -2.09471, 0, 1, 0.8078431, 1,
-0.1192181, 0.1836988, -0.01465215, 0, 1, 0.8156863, 1,
-0.1179983, 0.2965655, -0.7491305, 0, 1, 0.8196079, 1,
-0.1106657, -0.616842, -3.448457, 0, 1, 0.827451, 1,
-0.1025953, -0.6935308, -4.513563, 0, 1, 0.8313726, 1,
-0.09766164, -1.853117, -3.665022, 0, 1, 0.8392157, 1,
-0.09645279, -0.1201185, -2.838041, 0, 1, 0.8431373, 1,
-0.09543711, 0.6637807, -1.545253, 0, 1, 0.8509804, 1,
-0.09104192, -1.478844, -2.736123, 0, 1, 0.854902, 1,
-0.0870332, -0.3788874, -1.656338, 0, 1, 0.8627451, 1,
-0.08688398, 0.8576487, -1.973762, 0, 1, 0.8666667, 1,
-0.08429366, 0.2130367, 1.823161, 0, 1, 0.8745098, 1,
-0.08196265, 1.629509, 0.8817527, 0, 1, 0.8784314, 1,
-0.08180867, 1.243086, 0.2762523, 0, 1, 0.8862745, 1,
-0.07998407, -0.2719482, -3.377937, 0, 1, 0.8901961, 1,
-0.07914646, -0.7195722, -1.513085, 0, 1, 0.8980392, 1,
-0.07791352, -0.4088373, -4.364837, 0, 1, 0.9058824, 1,
-0.07588421, -0.4864402, -3.72379, 0, 1, 0.9098039, 1,
-0.07434494, -0.7606638, -3.361118, 0, 1, 0.9176471, 1,
-0.07426951, 0.7570073, 0.1645885, 0, 1, 0.9215686, 1,
-0.07294396, -1.388739, -3.079913, 0, 1, 0.9294118, 1,
-0.06531855, -1.94086, -5.138906, 0, 1, 0.9333333, 1,
-0.06074468, 0.4430469, 1.980982, 0, 1, 0.9411765, 1,
-0.05916499, 0.8478654, -0.7548777, 0, 1, 0.945098, 1,
-0.05774417, 0.07109715, -1.015559, 0, 1, 0.9529412, 1,
-0.05697129, -0.7701637, -1.479238, 0, 1, 0.9568627, 1,
-0.05299119, 1.981814, -1.344559, 0, 1, 0.9647059, 1,
-0.05264706, -0.6408737, -4.014481, 0, 1, 0.9686275, 1,
-0.04893023, -0.4399576, -3.193085, 0, 1, 0.9764706, 1,
-0.04481972, 0.6498608, -0.8104501, 0, 1, 0.9803922, 1,
-0.04269444, 1.174256, -0.5975975, 0, 1, 0.9882353, 1,
-0.04075667, 0.6498618, -0.3878591, 0, 1, 0.9921569, 1,
-0.04017215, -1.420395, -1.279336, 0, 1, 1, 1,
-0.03973676, 0.09441648, 0.1854487, 0, 0.9921569, 1, 1,
-0.03583411, 2.133678, -0.5772724, 0, 0.9882353, 1, 1,
-0.03416328, -0.1283913, -1.943544, 0, 0.9803922, 1, 1,
-0.03230612, -0.02437346, -2.340776, 0, 0.9764706, 1, 1,
-0.0312366, 0.07346117, -1.555095, 0, 0.9686275, 1, 1,
-0.02958139, -0.5633634, -2.132469, 0, 0.9647059, 1, 1,
-0.02603723, 0.5337057, 0.3664205, 0, 0.9568627, 1, 1,
-0.02419009, 0.3030231, 0.3160699, 0, 0.9529412, 1, 1,
-0.02221269, 0.7438849, 0.5618476, 0, 0.945098, 1, 1,
-0.02206376, -0.1477897, -2.441816, 0, 0.9411765, 1, 1,
-0.02201965, 1.452024, 0.4305515, 0, 0.9333333, 1, 1,
-0.01450683, -1.488881, -4.000944, 0, 0.9294118, 1, 1,
-0.01148107, -1.557595, -3.564162, 0, 0.9215686, 1, 1,
-0.01008055, -1.362622, -4.181107, 0, 0.9176471, 1, 1,
-0.009243741, 0.1258141, 0.007779884, 0, 0.9098039, 1, 1,
-0.005484679, 1.195775, -0.691369, 0, 0.9058824, 1, 1,
0.0007435294, -0.1950767, 4.063828, 0, 0.8980392, 1, 1,
0.006108983, 0.4719339, 0.09430937, 0, 0.8901961, 1, 1,
0.006748314, -1.200725, 1.733088, 0, 0.8862745, 1, 1,
0.008849838, -1.372957, 1.890016, 0, 0.8784314, 1, 1,
0.009007041, -0.4528795, 3.984472, 0, 0.8745098, 1, 1,
0.01559438, 0.1587186, 0.6248029, 0, 0.8666667, 1, 1,
0.01901049, 1.629624, 0.3559469, 0, 0.8627451, 1, 1,
0.0199747, -1.696421, 3.772096, 0, 0.854902, 1, 1,
0.02097109, 1.174055, -2.315315, 0, 0.8509804, 1, 1,
0.02178275, -0.2760337, 2.378461, 0, 0.8431373, 1, 1,
0.02214415, 0.7562893, -0.641112, 0, 0.8392157, 1, 1,
0.02216775, -0.02980696, 3.12048, 0, 0.8313726, 1, 1,
0.0244162, -0.5213282, 3.582021, 0, 0.827451, 1, 1,
0.02704022, -0.5792398, 3.298798, 0, 0.8196079, 1, 1,
0.02888562, 1.053783, -0.3103303, 0, 0.8156863, 1, 1,
0.03978103, 1.223867, -0.2792783, 0, 0.8078431, 1, 1,
0.04589909, 0.730378, -1.010801, 0, 0.8039216, 1, 1,
0.05278061, -0.08330636, 2.241147, 0, 0.7960784, 1, 1,
0.05633346, 1.078324, 0.6619784, 0, 0.7882353, 1, 1,
0.05841813, 1.120932, 0.4835763, 0, 0.7843137, 1, 1,
0.06797303, 1.534079, 1.348632, 0, 0.7764706, 1, 1,
0.07235394, 0.2336287, -0.1810773, 0, 0.772549, 1, 1,
0.07995837, -0.7287537, 2.787159, 0, 0.7647059, 1, 1,
0.0804612, 0.3638997, -1.405087, 0, 0.7607843, 1, 1,
0.08911001, 0.2552847, 0.6586565, 0, 0.7529412, 1, 1,
0.09528706, -0.3083732, 2.520357, 0, 0.7490196, 1, 1,
0.09807374, 0.2364986, 0.09068295, 0, 0.7411765, 1, 1,
0.1002274, 0.3375391, -0.7865093, 0, 0.7372549, 1, 1,
0.1077681, -0.3242454, 3.652009, 0, 0.7294118, 1, 1,
0.1116301, -0.04039512, 1.784541, 0, 0.7254902, 1, 1,
0.1140716, -0.6900635, 2.673748, 0, 0.7176471, 1, 1,
0.1181713, -1.62655, 1.821672, 0, 0.7137255, 1, 1,
0.1188357, 1.885482, -0.1721955, 0, 0.7058824, 1, 1,
0.1214325, -0.1833857, 2.401164, 0, 0.6980392, 1, 1,
0.1221955, 0.06376379, 0.6399458, 0, 0.6941177, 1, 1,
0.1226132, 1.194189, -0.4938009, 0, 0.6862745, 1, 1,
0.1248402, -1.322101, 2.041065, 0, 0.682353, 1, 1,
0.1265104, -0.3703875, 3.06669, 0, 0.6745098, 1, 1,
0.1275358, 0.8016405, -0.1018859, 0, 0.6705883, 1, 1,
0.1310417, -0.7039887, 1.832015, 0, 0.6627451, 1, 1,
0.1332367, -2.03407, 3.355249, 0, 0.6588235, 1, 1,
0.1370394, 0.1024774, -0.2419245, 0, 0.6509804, 1, 1,
0.1388776, 0.9390675, 0.3028518, 0, 0.6470588, 1, 1,
0.1398353, -0.6778548, 2.511585, 0, 0.6392157, 1, 1,
0.1480582, -1.286053, 3.225138, 0, 0.6352941, 1, 1,
0.1509821, 0.02946219, 2.201895, 0, 0.627451, 1, 1,
0.1583258, -0.6511623, 3.352221, 0, 0.6235294, 1, 1,
0.1586662, -0.1592764, 2.411169, 0, 0.6156863, 1, 1,
0.1640737, 0.1722071, 0.8455943, 0, 0.6117647, 1, 1,
0.1654807, -0.94629, 2.627729, 0, 0.6039216, 1, 1,
0.1659531, -0.3200338, 1.949972, 0, 0.5960785, 1, 1,
0.167617, -0.1516933, 1.512693, 0, 0.5921569, 1, 1,
0.1693456, -0.7056131, 2.407574, 0, 0.5843138, 1, 1,
0.1705688, -0.993732, 1.601219, 0, 0.5803922, 1, 1,
0.1734752, 0.4993277, -1.523405, 0, 0.572549, 1, 1,
0.1746354, -1.656052, 3.490242, 0, 0.5686275, 1, 1,
0.1784206, -2.305398, 3.998643, 0, 0.5607843, 1, 1,
0.1798133, 0.791899, -0.1679128, 0, 0.5568628, 1, 1,
0.1802883, 0.8081465, 1.965655e-05, 0, 0.5490196, 1, 1,
0.1827789, 0.1884076, 1.037589, 0, 0.5450981, 1, 1,
0.1872139, -1.250032, 3.873999, 0, 0.5372549, 1, 1,
0.1926047, -0.3642672, 4.716189, 0, 0.5333334, 1, 1,
0.1943626, -0.5283257, 0.8258644, 0, 0.5254902, 1, 1,
0.1944765, -0.8440463, 3.665474, 0, 0.5215687, 1, 1,
0.1976771, -0.556143, 3.114979, 0, 0.5137255, 1, 1,
0.1989288, 0.5357155, 0.4070203, 0, 0.509804, 1, 1,
0.1993409, 0.05571778, 0.5097755, 0, 0.5019608, 1, 1,
0.2003774, -2.606763, 2.262411, 0, 0.4941176, 1, 1,
0.2058124, 0.1071925, 0.7494154, 0, 0.4901961, 1, 1,
0.206206, -0.3726007, 1.633242, 0, 0.4823529, 1, 1,
0.2067838, 0.6548006, 0.9780094, 0, 0.4784314, 1, 1,
0.2165173, 0.563069, 1.492008, 0, 0.4705882, 1, 1,
0.2177315, -0.4786933, 2.333325, 0, 0.4666667, 1, 1,
0.2245564, -0.2176421, 1.829723, 0, 0.4588235, 1, 1,
0.224907, 0.04737986, -0.3629404, 0, 0.454902, 1, 1,
0.225385, 0.3778007, 1.246863, 0, 0.4470588, 1, 1,
0.2276976, 1.234302, 0.3448444, 0, 0.4431373, 1, 1,
0.2287759, 1.367341, -0.4310131, 0, 0.4352941, 1, 1,
0.233491, 0.7125771, 1.619874, 0, 0.4313726, 1, 1,
0.2344457, -0.04872862, 1.119088, 0, 0.4235294, 1, 1,
0.2381667, 0.1897128, -0.5506176, 0, 0.4196078, 1, 1,
0.2392627, 1.983083, 0.02539321, 0, 0.4117647, 1, 1,
0.2436291, 0.7781111, 0.6704068, 0, 0.4078431, 1, 1,
0.2485575, 1.258646, 0.169257, 0, 0.4, 1, 1,
0.2543397, -2.292883, 2.689669, 0, 0.3921569, 1, 1,
0.2549476, -0.2032462, 2.710727, 0, 0.3882353, 1, 1,
0.2555815, 1.404475, 0.2493029, 0, 0.3803922, 1, 1,
0.2573346, -0.1612563, 3.376485, 0, 0.3764706, 1, 1,
0.2614751, -0.2306339, 2.814851, 0, 0.3686275, 1, 1,
0.2656839, -1.086965, 0.8624623, 0, 0.3647059, 1, 1,
0.2669395, 0.2128332, 2.629979, 0, 0.3568628, 1, 1,
0.2749885, 0.6821362, 1.424127, 0, 0.3529412, 1, 1,
0.2795916, 0.9476224, -1.164433, 0, 0.345098, 1, 1,
0.2805241, -0.51643, 1.814928, 0, 0.3411765, 1, 1,
0.2819739, 0.2081038, 1.290678, 0, 0.3333333, 1, 1,
0.2839677, 0.1815275, 0.4723584, 0, 0.3294118, 1, 1,
0.2864946, -0.1433824, 1.709735, 0, 0.3215686, 1, 1,
0.2904245, 0.8852519, -1.627496, 0, 0.3176471, 1, 1,
0.2908839, 1.24759, -0.5944905, 0, 0.3098039, 1, 1,
0.2931618, 0.3884296, -0.4215533, 0, 0.3058824, 1, 1,
0.2944152, 0.9197168, 0.05650269, 0, 0.2980392, 1, 1,
0.2979708, 0.9317887, -0.9382294, 0, 0.2901961, 1, 1,
0.299508, 0.1678746, 1.049321, 0, 0.2862745, 1, 1,
0.3001148, 0.3946435, 0.6497599, 0, 0.2784314, 1, 1,
0.3001572, 0.2045392, 1.197488, 0, 0.2745098, 1, 1,
0.3095348, -1.40791, 2.461345, 0, 0.2666667, 1, 1,
0.3143373, 1.552559, 0.1860548, 0, 0.2627451, 1, 1,
0.3148615, -1.804442, 2.809761, 0, 0.254902, 1, 1,
0.3224925, -0.0408462, 2.088681, 0, 0.2509804, 1, 1,
0.3243618, -0.5025324, 3.777806, 0, 0.2431373, 1, 1,
0.3255461, 0.1632617, 0.9572212, 0, 0.2392157, 1, 1,
0.3293895, -0.7003779, 4.228637, 0, 0.2313726, 1, 1,
0.3296879, 1.794758, 1.854436, 0, 0.227451, 1, 1,
0.3348033, 0.08920299, 0.27184, 0, 0.2196078, 1, 1,
0.3384576, -1.890899, 2.153477, 0, 0.2156863, 1, 1,
0.3384787, -0.05562866, 3.369064, 0, 0.2078431, 1, 1,
0.3405984, 0.1787598, 1.761005, 0, 0.2039216, 1, 1,
0.3413202, 0.1246592, 0.9416517, 0, 0.1960784, 1, 1,
0.3414671, -1.275032, 1.685305, 0, 0.1882353, 1, 1,
0.3476677, 1.090677, 1.69364, 0, 0.1843137, 1, 1,
0.3487152, 0.7732736, 0.3190056, 0, 0.1764706, 1, 1,
0.3542531, 2.021252, 0.6736653, 0, 0.172549, 1, 1,
0.354788, 0.9313862, 1.699173, 0, 0.1647059, 1, 1,
0.3552234, 1.470583, -1.661796, 0, 0.1607843, 1, 1,
0.3640892, -0.9213778, 3.736131, 0, 0.1529412, 1, 1,
0.3650129, -1.586047, 5.350991, 0, 0.1490196, 1, 1,
0.3681881, -0.9083405, 4.526611, 0, 0.1411765, 1, 1,
0.3704318, -1.607646, 5.165821, 0, 0.1372549, 1, 1,
0.3704792, -0.7643638, 3.451233, 0, 0.1294118, 1, 1,
0.3717707, -0.503591, 4.14596, 0, 0.1254902, 1, 1,
0.37229, -0.1930531, 1.533551, 0, 0.1176471, 1, 1,
0.3729116, -1.338889, 1.96682, 0, 0.1137255, 1, 1,
0.3793392, -1.158433, 2.710412, 0, 0.1058824, 1, 1,
0.3802001, -0.704771, 2.965787, 0, 0.09803922, 1, 1,
0.3808297, -0.2595173, 0.5348555, 0, 0.09411765, 1, 1,
0.3816265, 1.192019, -0.1774501, 0, 0.08627451, 1, 1,
0.382387, 1.276084, 0.4145, 0, 0.08235294, 1, 1,
0.3842033, 1.380676, 0.9688971, 0, 0.07450981, 1, 1,
0.3865653, 0.7709338, -1.091023, 0, 0.07058824, 1, 1,
0.3876026, 0.205551, 0.4696377, 0, 0.0627451, 1, 1,
0.3887431, -0.6647613, 2.290589, 0, 0.05882353, 1, 1,
0.3937025, -1.160904, 3.542859, 0, 0.05098039, 1, 1,
0.3947428, 2.824903, 2.632925, 0, 0.04705882, 1, 1,
0.3951925, 0.5039233, 1.18162, 0, 0.03921569, 1, 1,
0.4008606, 0.7112502, 1.062605, 0, 0.03529412, 1, 1,
0.4075949, -0.3724468, 3.701075, 0, 0.02745098, 1, 1,
0.4080852, 0.7942275, -0.01904762, 0, 0.02352941, 1, 1,
0.4108449, -0.8582785, 2.124573, 0, 0.01568628, 1, 1,
0.4123007, -2.601653, 2.049979, 0, 0.01176471, 1, 1,
0.4158232, -0.7650445, 1.701512, 0, 0.003921569, 1, 1,
0.4211056, -1.198337, 3.515577, 0.003921569, 0, 1, 1,
0.4279306, -1.578956, 3.91492, 0.007843138, 0, 1, 1,
0.4286021, 2.204364, 1.514746, 0.01568628, 0, 1, 1,
0.4340298, 0.4228733, -0.3937024, 0.01960784, 0, 1, 1,
0.4348194, 1.676771, -0.04694159, 0.02745098, 0, 1, 1,
0.4358972, -1.201337, 0.8610771, 0.03137255, 0, 1, 1,
0.4373735, -0.8566278, 2.207657, 0.03921569, 0, 1, 1,
0.4392901, -0.1343357, 2.381442, 0.04313726, 0, 1, 1,
0.4427709, -0.02452754, 1.606967, 0.05098039, 0, 1, 1,
0.4445055, 0.2543087, 0.7884017, 0.05490196, 0, 1, 1,
0.4471495, 0.7730383, -0.2352904, 0.0627451, 0, 1, 1,
0.4471759, 0.8491114, -0.06839375, 0.06666667, 0, 1, 1,
0.4479711, -0.8532594, 0.9026723, 0.07450981, 0, 1, 1,
0.4484983, -1.607208, 3.193885, 0.07843138, 0, 1, 1,
0.4501206, -0.4543131, 3.262775, 0.08627451, 0, 1, 1,
0.451057, -0.09081607, 1.795575, 0.09019608, 0, 1, 1,
0.4558342, -1.006057, 3.846327, 0.09803922, 0, 1, 1,
0.4571129, -0.8916446, 2.067985, 0.1058824, 0, 1, 1,
0.4663994, -0.5099012, 2.15942, 0.1098039, 0, 1, 1,
0.4680926, -0.7751398, 3.367672, 0.1176471, 0, 1, 1,
0.4700209, -1.430364, 1.502415, 0.1215686, 0, 1, 1,
0.4702412, -0.3789271, 2.35323, 0.1294118, 0, 1, 1,
0.4744463, 0.385138, 2.257816, 0.1333333, 0, 1, 1,
0.4748792, -0.5154852, 3.413679, 0.1411765, 0, 1, 1,
0.4756564, 3.480947, 0.2743034, 0.145098, 0, 1, 1,
0.4779514, 0.8212962, 0.741762, 0.1529412, 0, 1, 1,
0.4790489, 0.6580296, 0.540943, 0.1568628, 0, 1, 1,
0.4827727, 0.6650833, 1.068582, 0.1647059, 0, 1, 1,
0.485062, -0.7113835, 2.974841, 0.1686275, 0, 1, 1,
0.4872638, -0.5030658, 2.925374, 0.1764706, 0, 1, 1,
0.4875426, 1.424936, 0.8157674, 0.1803922, 0, 1, 1,
0.4908081, 0.1792269, 2.914833, 0.1882353, 0, 1, 1,
0.4915017, -1.082319, 1.476475, 0.1921569, 0, 1, 1,
0.4996964, 0.1316311, 1.961427, 0.2, 0, 1, 1,
0.5004833, -0.8037022, 1.495134, 0.2078431, 0, 1, 1,
0.502156, -0.1799075, 1.46735, 0.2117647, 0, 1, 1,
0.5023865, 0.4410284, 2.414728, 0.2196078, 0, 1, 1,
0.5025333, 0.7655054, -0.183149, 0.2235294, 0, 1, 1,
0.5121805, 0.04159535, 1.617558, 0.2313726, 0, 1, 1,
0.5146683, -1.028194, 2.913194, 0.2352941, 0, 1, 1,
0.5162689, 1.254261, 1.537474, 0.2431373, 0, 1, 1,
0.5163293, -2.233933, 2.690263, 0.2470588, 0, 1, 1,
0.5169283, 0.6506531, -0.1783289, 0.254902, 0, 1, 1,
0.5183849, -0.5619923, 1.837197, 0.2588235, 0, 1, 1,
0.5192411, -0.712563, 3.689206, 0.2666667, 0, 1, 1,
0.5271353, -1.844414, 2.856831, 0.2705882, 0, 1, 1,
0.5284647, -1.652286, 3.435001, 0.2784314, 0, 1, 1,
0.5290874, 0.2484534, 0.8262109, 0.282353, 0, 1, 1,
0.5304987, -1.239825, 4.100865, 0.2901961, 0, 1, 1,
0.5339867, 0.9252445, 2.430356, 0.2941177, 0, 1, 1,
0.5360616, 2.046495, 1.532883, 0.3019608, 0, 1, 1,
0.536647, 1.24143, 1.071335, 0.3098039, 0, 1, 1,
0.5388765, 1.042599, 1.127747, 0.3137255, 0, 1, 1,
0.540552, 1.895196, -0.04240476, 0.3215686, 0, 1, 1,
0.5416104, -0.5176736, 3.232248, 0.3254902, 0, 1, 1,
0.5454263, -1.037505, 1.015341, 0.3333333, 0, 1, 1,
0.5458146, 0.3873841, 0.1001128, 0.3372549, 0, 1, 1,
0.5461623, 1.185388, -0.2163751, 0.345098, 0, 1, 1,
0.5531088, 0.8690498, 0.3019729, 0.3490196, 0, 1, 1,
0.555591, -0.7529137, 4.069429, 0.3568628, 0, 1, 1,
0.5593805, -0.9160323, 1.329178, 0.3607843, 0, 1, 1,
0.5789176, 1.64989, -0.6106637, 0.3686275, 0, 1, 1,
0.5807081, -1.666862, 2.518865, 0.372549, 0, 1, 1,
0.5839102, 0.9787825, -1.063336, 0.3803922, 0, 1, 1,
0.5841649, -0.5376176, 3.045117, 0.3843137, 0, 1, 1,
0.5888738, 0.6600437, -0.1818785, 0.3921569, 0, 1, 1,
0.5955051, 0.842051, 1.088815, 0.3960784, 0, 1, 1,
0.5966319, 0.4857636, 3.604374, 0.4039216, 0, 1, 1,
0.6013032, -1.697254, 2.674123, 0.4117647, 0, 1, 1,
0.6016385, -0.5567676, 1.526253, 0.4156863, 0, 1, 1,
0.6033196, 1.100519, 1.063647, 0.4235294, 0, 1, 1,
0.603658, 0.3045068, 1.958507, 0.427451, 0, 1, 1,
0.6092634, 1.910469, -0.6231603, 0.4352941, 0, 1, 1,
0.6140761, -0.5404661, 1.68719, 0.4392157, 0, 1, 1,
0.6146111, 0.551948, 1.943369, 0.4470588, 0, 1, 1,
0.6178499, -0.6395525, 3.252816, 0.4509804, 0, 1, 1,
0.6192552, 0.4138593, 0.8236958, 0.4588235, 0, 1, 1,
0.6207052, 0.9521856, -0.2213584, 0.4627451, 0, 1, 1,
0.6208671, 0.3060368, 1.755801, 0.4705882, 0, 1, 1,
0.6209974, -1.221467, 3.287352, 0.4745098, 0, 1, 1,
0.6212092, 0.6749454, 0.463701, 0.4823529, 0, 1, 1,
0.625895, -0.4140494, 1.654996, 0.4862745, 0, 1, 1,
0.6276267, 0.4717533, 0.8246595, 0.4941176, 0, 1, 1,
0.6297864, 1.206131, 0.5422388, 0.5019608, 0, 1, 1,
0.6300409, 0.02396918, 1.440791, 0.5058824, 0, 1, 1,
0.6336457, 1.963534, 0.2119961, 0.5137255, 0, 1, 1,
0.6368178, 0.7546875, 2.054587, 0.5176471, 0, 1, 1,
0.6386647, 0.7528258, 0.2787056, 0.5254902, 0, 1, 1,
0.6416017, 0.6524926, 0.5659128, 0.5294118, 0, 1, 1,
0.6437961, 0.3740942, 0.936772, 0.5372549, 0, 1, 1,
0.6458096, 0.9185871, -0.5288328, 0.5411765, 0, 1, 1,
0.6471103, -0.6809856, 2.90415, 0.5490196, 0, 1, 1,
0.647195, -0.3177286, 1.123286, 0.5529412, 0, 1, 1,
0.6548462, 0.3198194, 0.442074, 0.5607843, 0, 1, 1,
0.6566393, 2.579171, -0.3091036, 0.5647059, 0, 1, 1,
0.6613871, 0.05558238, 0.4996811, 0.572549, 0, 1, 1,
0.6619778, -1.147579, 2.077296, 0.5764706, 0, 1, 1,
0.6652092, -0.7495561, 3.451332, 0.5843138, 0, 1, 1,
0.6660743, 0.9454243, 0.08874574, 0.5882353, 0, 1, 1,
0.6711065, 0.2984718, 0.9987285, 0.5960785, 0, 1, 1,
0.6727902, -1.118038, 2.745992, 0.6039216, 0, 1, 1,
0.6776679, 1.566746, 0.1929455, 0.6078432, 0, 1, 1,
0.6846801, 1.059268, 0.3843006, 0.6156863, 0, 1, 1,
0.6849452, -1.124036, 2.392289, 0.6196079, 0, 1, 1,
0.6869279, 0.07565984, -0.5836095, 0.627451, 0, 1, 1,
0.6957837, 0.5510417, 2.52915, 0.6313726, 0, 1, 1,
0.6984179, 0.2105156, 2.237052, 0.6392157, 0, 1, 1,
0.6993651, 1.999929, 0.758843, 0.6431373, 0, 1, 1,
0.6999951, -0.2848802, 0.3649626, 0.6509804, 0, 1, 1,
0.7028247, -1.524402, 2.251976, 0.654902, 0, 1, 1,
0.7053521, -0.009675981, 0.8312796, 0.6627451, 0, 1, 1,
0.7060523, 1.041432, -0.2698864, 0.6666667, 0, 1, 1,
0.7064456, -0.3053612, 1.963844, 0.6745098, 0, 1, 1,
0.7079937, -0.2553015, 1.045433, 0.6784314, 0, 1, 1,
0.7080151, -1.586809, 1.395721, 0.6862745, 0, 1, 1,
0.7094867, -0.6832854, 1.799546, 0.6901961, 0, 1, 1,
0.7177986, 0.01460457, 1.181219, 0.6980392, 0, 1, 1,
0.7191635, -0.1206752, 1.105934, 0.7058824, 0, 1, 1,
0.7296712, 0.8627914, 0.069721, 0.7098039, 0, 1, 1,
0.730103, 1.118026, 1.238469, 0.7176471, 0, 1, 1,
0.7321674, -0.2706265, 2.327558, 0.7215686, 0, 1, 1,
0.7336059, -0.2316757, 1.387225, 0.7294118, 0, 1, 1,
0.7357029, 1.416966, 0.3750913, 0.7333333, 0, 1, 1,
0.7441429, -1.198592, 4.673557, 0.7411765, 0, 1, 1,
0.7548028, -0.1437301, 2.779039, 0.7450981, 0, 1, 1,
0.757009, 1.383887, 0.8384936, 0.7529412, 0, 1, 1,
0.7689049, 0.6981199, 1.170676, 0.7568628, 0, 1, 1,
0.7736204, 0.5255315, 0.4466609, 0.7647059, 0, 1, 1,
0.7774091, 1.469883, 1.545464, 0.7686275, 0, 1, 1,
0.7844498, -0.9670864, 1.456688, 0.7764706, 0, 1, 1,
0.7895463, 0.7566656, -0.6781668, 0.7803922, 0, 1, 1,
0.7895646, -1.454433, 2.813182, 0.7882353, 0, 1, 1,
0.7912406, -0.6695946, 3.996298, 0.7921569, 0, 1, 1,
0.7951931, 0.05020183, 0.8338371, 0.8, 0, 1, 1,
0.7975956, 0.9526539, 2.440714, 0.8078431, 0, 1, 1,
0.7991574, 0.5299801, 0.8823736, 0.8117647, 0, 1, 1,
0.7993031, 0.523608, 0.8889527, 0.8196079, 0, 1, 1,
0.8054683, 0.04150452, 2.697851, 0.8235294, 0, 1, 1,
0.8079731, -0.4156513, 1.149507, 0.8313726, 0, 1, 1,
0.8122067, -1.753886, 3.011735, 0.8352941, 0, 1, 1,
0.8172697, -0.5422359, 3.162367, 0.8431373, 0, 1, 1,
0.8216012, -0.4905372, 2.865378, 0.8470588, 0, 1, 1,
0.8221621, -0.882493, 3.960027, 0.854902, 0, 1, 1,
0.8274206, 0.1281637, 1.304613, 0.8588235, 0, 1, 1,
0.8314981, -1.079411, 1.016089, 0.8666667, 0, 1, 1,
0.8382951, -0.4840538, -0.07301705, 0.8705882, 0, 1, 1,
0.8442549, 1.48936, 0.713786, 0.8784314, 0, 1, 1,
0.84741, -1.18096, 3.130463, 0.8823529, 0, 1, 1,
0.8482467, 0.2454163, 1.554838, 0.8901961, 0, 1, 1,
0.8525463, 0.3253552, 1.335695, 0.8941177, 0, 1, 1,
0.855787, -1.729085, 3.77027, 0.9019608, 0, 1, 1,
0.8576117, 0.7569135, 0.01488529, 0.9098039, 0, 1, 1,
0.8588372, -0.3399716, 1.030254, 0.9137255, 0, 1, 1,
0.8604943, -0.9032084, 4.712059, 0.9215686, 0, 1, 1,
0.8613121, -1.692479, 4.433644, 0.9254902, 0, 1, 1,
0.8613355, -0.344831, 2.422018, 0.9333333, 0, 1, 1,
0.866855, -1.654125, 2.680563, 0.9372549, 0, 1, 1,
0.8736849, 0.6280717, -0.04808915, 0.945098, 0, 1, 1,
0.8833141, 0.3991593, 1.405104, 0.9490196, 0, 1, 1,
0.8858773, -0.3417268, 1.588504, 0.9568627, 0, 1, 1,
0.8909201, -1.457971, 2.081722, 0.9607843, 0, 1, 1,
0.8925331, 1.080413, 0.6025649, 0.9686275, 0, 1, 1,
0.8953398, 0.123838, 0.1197134, 0.972549, 0, 1, 1,
0.9001175, 0.3860281, 1.533677, 0.9803922, 0, 1, 1,
0.9110466, -0.2261968, 1.280298, 0.9843137, 0, 1, 1,
0.9114078, 0.6027206, 1.695211, 0.9921569, 0, 1, 1,
0.9120733, -0.8556352, 1.476374, 0.9960784, 0, 1, 1,
0.9126063, -1.432596, 2.647092, 1, 0, 0.9960784, 1,
0.9143022, 0.8944869, -0.07145023, 1, 0, 0.9882353, 1,
0.914399, 0.05061871, 0.5292173, 1, 0, 0.9843137, 1,
0.9153149, -0.05321838, 2.717025, 1, 0, 0.9764706, 1,
0.9272991, -0.2237424, 1.503831, 1, 0, 0.972549, 1,
0.9276066, 0.4863861, 2.217353, 1, 0, 0.9647059, 1,
0.9294857, -0.04395373, 1.510226, 1, 0, 0.9607843, 1,
0.9361827, -0.05731519, 1.161267, 1, 0, 0.9529412, 1,
0.9387804, 0.9028456, 0.8692029, 1, 0, 0.9490196, 1,
0.9393641, 1.941955, 1.222759, 1, 0, 0.9411765, 1,
0.9437144, -1.381133, -0.05647104, 1, 0, 0.9372549, 1,
0.9541013, 0.3757823, 2.562642, 1, 0, 0.9294118, 1,
0.9724727, 0.119654, 1.374902, 1, 0, 0.9254902, 1,
0.9844609, 0.8070217, 3.835032, 1, 0, 0.9176471, 1,
0.9872158, 0.131655, 0.8531815, 1, 0, 0.9137255, 1,
0.9884141, 0.09886508, -0.4269409, 1, 0, 0.9058824, 1,
0.994738, -0.6690177, 1.582824, 1, 0, 0.9019608, 1,
0.9966354, -0.4565893, 3.363791, 1, 0, 0.8941177, 1,
0.9976848, 0.5424503, 0.7348909, 1, 0, 0.8862745, 1,
1.001784, 0.4373862, 0.02850202, 1, 0, 0.8823529, 1,
1.004341, -0.7338475, 3.251079, 1, 0, 0.8745098, 1,
1.00707, 0.2075154, 0.5387564, 1, 0, 0.8705882, 1,
1.009884, -0.5310445, 1.699418, 1, 0, 0.8627451, 1,
1.014719, -0.9247879, 3.762363, 1, 0, 0.8588235, 1,
1.022509, -0.6855355, 2.795557, 1, 0, 0.8509804, 1,
1.026271, -0.5067135, 2.32072, 1, 0, 0.8470588, 1,
1.029291, -0.8440431, 2.539139, 1, 0, 0.8392157, 1,
1.032821, -1.406351, 1.772309, 1, 0, 0.8352941, 1,
1.035877, -1.120486, 3.327477, 1, 0, 0.827451, 1,
1.045252, -0.7650721, 1.595608, 1, 0, 0.8235294, 1,
1.045847, 0.6001591, 2.075547, 1, 0, 0.8156863, 1,
1.048885, -1.00024, 1.572817, 1, 0, 0.8117647, 1,
1.051569, 1.443729, 0.1848752, 1, 0, 0.8039216, 1,
1.079659, -0.2977217, 1.733452, 1, 0, 0.7960784, 1,
1.082596, -0.7386333, 2.804609, 1, 0, 0.7921569, 1,
1.089463, 2.295234, -1.543465, 1, 0, 0.7843137, 1,
1.091055, 0.4372434, 0.6228624, 1, 0, 0.7803922, 1,
1.09373, 0.7019929, 0.2102871, 1, 0, 0.772549, 1,
1.09579, 2.612945, -0.706248, 1, 0, 0.7686275, 1,
1.098649, -1.839691, 2.984028, 1, 0, 0.7607843, 1,
1.104782, -1.391314, 0.8609031, 1, 0, 0.7568628, 1,
1.116331, -0.4226607, 1.025838, 1, 0, 0.7490196, 1,
1.116768, 1.302979, 2.883117, 1, 0, 0.7450981, 1,
1.13204, -0.3395195, 3.218768, 1, 0, 0.7372549, 1,
1.1325, -0.2367918, 2.905678, 1, 0, 0.7333333, 1,
1.138203, 0.1787184, 0.6326392, 1, 0, 0.7254902, 1,
1.148416, -0.01837088, 2.049167, 1, 0, 0.7215686, 1,
1.152257, -0.1099046, 1.477199, 1, 0, 0.7137255, 1,
1.155799, 0.07560436, 2.136524, 1, 0, 0.7098039, 1,
1.160268, -0.9168973, 2.006825, 1, 0, 0.7019608, 1,
1.162821, 0.3567584, 1.314283, 1, 0, 0.6941177, 1,
1.174939, 1.793487, -0.4099151, 1, 0, 0.6901961, 1,
1.176052, -0.2963204, 2.575527, 1, 0, 0.682353, 1,
1.182362, -0.1748887, 2.063326, 1, 0, 0.6784314, 1,
1.187202, 0.3540577, 2.96636, 1, 0, 0.6705883, 1,
1.189404, 1.077804, -1.045133, 1, 0, 0.6666667, 1,
1.191596, -1.096137, 1.379057, 1, 0, 0.6588235, 1,
1.192467, -1.185348, 1.615396, 1, 0, 0.654902, 1,
1.198923, 0.1351079, 2.03674, 1, 0, 0.6470588, 1,
1.200624, 1.421975, -0.09000676, 1, 0, 0.6431373, 1,
1.202265, -1.793805, 3.528782, 1, 0, 0.6352941, 1,
1.202497, 0.9099728, 1.365839, 1, 0, 0.6313726, 1,
1.214503, -0.4490539, 2.769348, 1, 0, 0.6235294, 1,
1.235492, 0.2002156, 1.746691, 1, 0, 0.6196079, 1,
1.240286, 1.551955, 0.1715509, 1, 0, 0.6117647, 1,
1.251556, 0.08113714, 0.337184, 1, 0, 0.6078432, 1,
1.260929, 0.2269619, 0.3573902, 1, 0, 0.6, 1,
1.263749, -0.01871629, 2.227879, 1, 0, 0.5921569, 1,
1.275198, 0.7302029, 1.416018, 1, 0, 0.5882353, 1,
1.280994, -0.7746048, 2.53907, 1, 0, 0.5803922, 1,
1.294564, -0.7614825, 3.753253, 1, 0, 0.5764706, 1,
1.29613, 0.796407, 1.551638, 1, 0, 0.5686275, 1,
1.297268, -0.3885753, 3.007654, 1, 0, 0.5647059, 1,
1.297976, -0.3325342, 0.2896902, 1, 0, 0.5568628, 1,
1.317483, -0.2691415, 1.66527, 1, 0, 0.5529412, 1,
1.318943, 1.936895, 2.548395, 1, 0, 0.5450981, 1,
1.323379, 3.221338, 2.503378, 1, 0, 0.5411765, 1,
1.327638, 0.6857386, 4.311859, 1, 0, 0.5333334, 1,
1.329517, -1.092241, 2.117864, 1, 0, 0.5294118, 1,
1.332467, -0.09774808, -0.3546464, 1, 0, 0.5215687, 1,
1.344888, -1.291448, 3.40447, 1, 0, 0.5176471, 1,
1.35741, 0.6119095, -1.499936, 1, 0, 0.509804, 1,
1.363959, -1.266491, 1.784791, 1, 0, 0.5058824, 1,
1.366281, -1.391413, 1.552079, 1, 0, 0.4980392, 1,
1.368783, -0.8458821, 2.680513, 1, 0, 0.4901961, 1,
1.383129, -0.2408147, 1.056104, 1, 0, 0.4862745, 1,
1.38612, -0.8689148, 0.5945976, 1, 0, 0.4784314, 1,
1.411627, 0.6988026, 1.856025, 1, 0, 0.4745098, 1,
1.416451, 1.336926, 0.2690168, 1, 0, 0.4666667, 1,
1.429228, -1.319422, 1.167949, 1, 0, 0.4627451, 1,
1.434891, 0.5766448, 0.6345507, 1, 0, 0.454902, 1,
1.438121, 3.00233, 0.4200755, 1, 0, 0.4509804, 1,
1.443517, -0.782669, 2.600472, 1, 0, 0.4431373, 1,
1.459656, 0.7623643, -0.5496841, 1, 0, 0.4392157, 1,
1.466733, 0.611459, 1.984782, 1, 0, 0.4313726, 1,
1.477129, -0.2433084, 1.366312, 1, 0, 0.427451, 1,
1.481513, 0.3652225, 2.405432, 1, 0, 0.4196078, 1,
1.486835, 1.251118, -0.2164529, 1, 0, 0.4156863, 1,
1.510246, -0.3441716, 0.661967, 1, 0, 0.4078431, 1,
1.517006, 0.367843, 1.75489, 1, 0, 0.4039216, 1,
1.517404, 0.2605945, 2.77986, 1, 0, 0.3960784, 1,
1.523047, 1.408173, -0.6750748, 1, 0, 0.3882353, 1,
1.523564, -1.028547, 2.752612, 1, 0, 0.3843137, 1,
1.527798, -0.6008416, 0.2443438, 1, 0, 0.3764706, 1,
1.529598, 0.2576803, 1.742616, 1, 0, 0.372549, 1,
1.536988, 0.6219076, 0.4412986, 1, 0, 0.3647059, 1,
1.559372, 0.1655192, 1.628674, 1, 0, 0.3607843, 1,
1.576771, -0.4123925, 1.687531, 1, 0, 0.3529412, 1,
1.578743, -0.5301725, 5.453681, 1, 0, 0.3490196, 1,
1.591195, 1.036316, 2.239671, 1, 0, 0.3411765, 1,
1.613529, 1.307622, 2.915818, 1, 0, 0.3372549, 1,
1.629029, -0.4972036, 2.614084, 1, 0, 0.3294118, 1,
1.632607, -0.4536743, 2.922982, 1, 0, 0.3254902, 1,
1.641256, -1.430931, 2.441137, 1, 0, 0.3176471, 1,
1.643807, 0.2976376, 0.7455814, 1, 0, 0.3137255, 1,
1.650858, -0.488735, 1.067447, 1, 0, 0.3058824, 1,
1.653992, 0.1087084, 0.9195981, 1, 0, 0.2980392, 1,
1.656873, -0.6121727, 2.818501, 1, 0, 0.2941177, 1,
1.657205, 0.06011832, 2.63629, 1, 0, 0.2862745, 1,
1.67287, -1.306152, 1.441393, 1, 0, 0.282353, 1,
1.674831, -0.8070973, 2.359312, 1, 0, 0.2745098, 1,
1.681255, 1.153849, 2.711851, 1, 0, 0.2705882, 1,
1.688975, 0.09536406, 1.13053, 1, 0, 0.2627451, 1,
1.692809, -2.147816, 3.980888, 1, 0, 0.2588235, 1,
1.695068, 1.361643, -1.235721, 1, 0, 0.2509804, 1,
1.697222, -0.1680829, 0.9169329, 1, 0, 0.2470588, 1,
1.699415, -2.228827, 1.288114, 1, 0, 0.2392157, 1,
1.702924, 0.5652904, 1.654677, 1, 0, 0.2352941, 1,
1.735653, -0.2970476, 0.9336762, 1, 0, 0.227451, 1,
1.740444, -0.05306568, 2.495764, 1, 0, 0.2235294, 1,
1.742444, -0.08459235, 1.176921, 1, 0, 0.2156863, 1,
1.748914, 0.5389921, 1.920219, 1, 0, 0.2117647, 1,
1.759898, -2.866828, 1.882422, 1, 0, 0.2039216, 1,
1.764987, -0.7668941, 2.267123, 1, 0, 0.1960784, 1,
1.766283, 0.04272992, 1.622842, 1, 0, 0.1921569, 1,
1.774527, 1.111904, -1.369276, 1, 0, 0.1843137, 1,
1.798807, -0.4683259, 1.221081, 1, 0, 0.1803922, 1,
1.804438, 1.018459, 0.7039015, 1, 0, 0.172549, 1,
1.827642, -0.1251472, 0.949542, 1, 0, 0.1686275, 1,
1.831498, -1.467934, 1.869021, 1, 0, 0.1607843, 1,
1.831869, 0.01234383, 1.924965, 1, 0, 0.1568628, 1,
1.83662, 2.496301, 0.2147397, 1, 0, 0.1490196, 1,
1.845513, -1.020447, 2.297665, 1, 0, 0.145098, 1,
1.867231, -0.5322322, 0.9457784, 1, 0, 0.1372549, 1,
1.873914, -0.9270777, 0.8280003, 1, 0, 0.1333333, 1,
1.893578, 0.9939395, -0.4525204, 1, 0, 0.1254902, 1,
1.924356, -1.13556, 2.719002, 1, 0, 0.1215686, 1,
1.927045, 0.5862936, -0.155771, 1, 0, 0.1137255, 1,
1.930738, -0.5741699, -1.889871, 1, 0, 0.1098039, 1,
1.932587, 0.2839919, 1.840615, 1, 0, 0.1019608, 1,
1.937508, 1.472104, 1.758469, 1, 0, 0.09411765, 1,
1.977839, -0.268166, 1.257352, 1, 0, 0.09019608, 1,
1.983598, -1.136408, 2.577351, 1, 0, 0.08235294, 1,
1.98616, -1.29583, 2.425139, 1, 0, 0.07843138, 1,
2.025456, 0.2683387, 1.457075, 1, 0, 0.07058824, 1,
2.029298, 0.02227829, 2.075126, 1, 0, 0.06666667, 1,
2.055938, 1.143565, 1.47605, 1, 0, 0.05882353, 1,
2.100352, -0.1197438, 3.89601, 1, 0, 0.05490196, 1,
2.112983, -0.6231409, 1.107797, 1, 0, 0.04705882, 1,
2.113379, 0.229779, 0.6667207, 1, 0, 0.04313726, 1,
2.162662, -0.2131744, 3.505243, 1, 0, 0.03529412, 1,
2.270489, -0.644268, 1.569402, 1, 0, 0.03137255, 1,
2.313117, 0.5444162, 3.082558, 1, 0, 0.02352941, 1,
2.327243, -0.423161, 1.490386, 1, 0, 0.01960784, 1,
2.935246, 0.02172726, 1.288101, 1, 0, 0.01176471, 1,
2.980134, -0.2504864, -1.446069, 1, 0, 0.007843138, 1
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
-0.1370951, -4.620505, -6.934349, 0, -0.5, 0.5, 0.5,
-0.1370951, -4.620505, -6.934349, 1, -0.5, 0.5, 0.5,
-0.1370951, -4.620505, -6.934349, 1, 1.5, 0.5, 0.5,
-0.1370951, -4.620505, -6.934349, 0, 1.5, 0.5, 0.5
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
-4.311065, 0.01730788, -6.934349, 0, -0.5, 0.5, 0.5,
-4.311065, 0.01730788, -6.934349, 1, -0.5, 0.5, 0.5,
-4.311065, 0.01730788, -6.934349, 1, 1.5, 0.5, 0.5,
-4.311065, 0.01730788, -6.934349, 0, 1.5, 0.5, 0.5
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
-4.311065, -4.620505, 0.1573877, 0, -0.5, 0.5, 0.5,
-4.311065, -4.620505, 0.1573877, 1, -0.5, 0.5, 0.5,
-4.311065, -4.620505, 0.1573877, 1, 1.5, 0.5, 0.5,
-4.311065, -4.620505, 0.1573877, 0, 1.5, 0.5, 0.5
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
-3, -3.550241, -5.297794,
2, -3.550241, -5.297794,
-3, -3.550241, -5.297794,
-3, -3.728618, -5.570553,
-2, -3.550241, -5.297794,
-2, -3.728618, -5.570553,
-1, -3.550241, -5.297794,
-1, -3.728618, -5.570553,
0, -3.550241, -5.297794,
0, -3.728618, -5.570553,
1, -3.550241, -5.297794,
1, -3.728618, -5.570553,
2, -3.550241, -5.297794,
2, -3.728618, -5.570553
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
-3, -4.085373, -6.116072, 0, -0.5, 0.5, 0.5,
-3, -4.085373, -6.116072, 1, -0.5, 0.5, 0.5,
-3, -4.085373, -6.116072, 1, 1.5, 0.5, 0.5,
-3, -4.085373, -6.116072, 0, 1.5, 0.5, 0.5,
-2, -4.085373, -6.116072, 0, -0.5, 0.5, 0.5,
-2, -4.085373, -6.116072, 1, -0.5, 0.5, 0.5,
-2, -4.085373, -6.116072, 1, 1.5, 0.5, 0.5,
-2, -4.085373, -6.116072, 0, 1.5, 0.5, 0.5,
-1, -4.085373, -6.116072, 0, -0.5, 0.5, 0.5,
-1, -4.085373, -6.116072, 1, -0.5, 0.5, 0.5,
-1, -4.085373, -6.116072, 1, 1.5, 0.5, 0.5,
-1, -4.085373, -6.116072, 0, 1.5, 0.5, 0.5,
0, -4.085373, -6.116072, 0, -0.5, 0.5, 0.5,
0, -4.085373, -6.116072, 1, -0.5, 0.5, 0.5,
0, -4.085373, -6.116072, 1, 1.5, 0.5, 0.5,
0, -4.085373, -6.116072, 0, 1.5, 0.5, 0.5,
1, -4.085373, -6.116072, 0, -0.5, 0.5, 0.5,
1, -4.085373, -6.116072, 1, -0.5, 0.5, 0.5,
1, -4.085373, -6.116072, 1, 1.5, 0.5, 0.5,
1, -4.085373, -6.116072, 0, 1.5, 0.5, 0.5,
2, -4.085373, -6.116072, 0, -0.5, 0.5, 0.5,
2, -4.085373, -6.116072, 1, -0.5, 0.5, 0.5,
2, -4.085373, -6.116072, 1, 1.5, 0.5, 0.5,
2, -4.085373, -6.116072, 0, 1.5, 0.5, 0.5
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
-3.347841, -3, -5.297794,
-3.347841, 3, -5.297794,
-3.347841, -3, -5.297794,
-3.508378, -3, -5.570553,
-3.347841, -2, -5.297794,
-3.508378, -2, -5.570553,
-3.347841, -1, -5.297794,
-3.508378, -1, -5.570553,
-3.347841, 0, -5.297794,
-3.508378, 0, -5.570553,
-3.347841, 1, -5.297794,
-3.508378, 1, -5.570553,
-3.347841, 2, -5.297794,
-3.508378, 2, -5.570553,
-3.347841, 3, -5.297794,
-3.508378, 3, -5.570553
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
-3.829453, -3, -6.116072, 0, -0.5, 0.5, 0.5,
-3.829453, -3, -6.116072, 1, -0.5, 0.5, 0.5,
-3.829453, -3, -6.116072, 1, 1.5, 0.5, 0.5,
-3.829453, -3, -6.116072, 0, 1.5, 0.5, 0.5,
-3.829453, -2, -6.116072, 0, -0.5, 0.5, 0.5,
-3.829453, -2, -6.116072, 1, -0.5, 0.5, 0.5,
-3.829453, -2, -6.116072, 1, 1.5, 0.5, 0.5,
-3.829453, -2, -6.116072, 0, 1.5, 0.5, 0.5,
-3.829453, -1, -6.116072, 0, -0.5, 0.5, 0.5,
-3.829453, -1, -6.116072, 1, -0.5, 0.5, 0.5,
-3.829453, -1, -6.116072, 1, 1.5, 0.5, 0.5,
-3.829453, -1, -6.116072, 0, 1.5, 0.5, 0.5,
-3.829453, 0, -6.116072, 0, -0.5, 0.5, 0.5,
-3.829453, 0, -6.116072, 1, -0.5, 0.5, 0.5,
-3.829453, 0, -6.116072, 1, 1.5, 0.5, 0.5,
-3.829453, 0, -6.116072, 0, 1.5, 0.5, 0.5,
-3.829453, 1, -6.116072, 0, -0.5, 0.5, 0.5,
-3.829453, 1, -6.116072, 1, -0.5, 0.5, 0.5,
-3.829453, 1, -6.116072, 1, 1.5, 0.5, 0.5,
-3.829453, 1, -6.116072, 0, 1.5, 0.5, 0.5,
-3.829453, 2, -6.116072, 0, -0.5, 0.5, 0.5,
-3.829453, 2, -6.116072, 1, -0.5, 0.5, 0.5,
-3.829453, 2, -6.116072, 1, 1.5, 0.5, 0.5,
-3.829453, 2, -6.116072, 0, 1.5, 0.5, 0.5,
-3.829453, 3, -6.116072, 0, -0.5, 0.5, 0.5,
-3.829453, 3, -6.116072, 1, -0.5, 0.5, 0.5,
-3.829453, 3, -6.116072, 1, 1.5, 0.5, 0.5,
-3.829453, 3, -6.116072, 0, 1.5, 0.5, 0.5
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
-3.347841, -3.550241, -4,
-3.347841, -3.550241, 4,
-3.347841, -3.550241, -4,
-3.508378, -3.728618, -4,
-3.347841, -3.550241, -2,
-3.508378, -3.728618, -2,
-3.347841, -3.550241, 0,
-3.508378, -3.728618, 0,
-3.347841, -3.550241, 2,
-3.508378, -3.728618, 2,
-3.347841, -3.550241, 4,
-3.508378, -3.728618, 4
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
-3.829453, -4.085373, -4, 0, -0.5, 0.5, 0.5,
-3.829453, -4.085373, -4, 1, -0.5, 0.5, 0.5,
-3.829453, -4.085373, -4, 1, 1.5, 0.5, 0.5,
-3.829453, -4.085373, -4, 0, 1.5, 0.5, 0.5,
-3.829453, -4.085373, -2, 0, -0.5, 0.5, 0.5,
-3.829453, -4.085373, -2, 1, -0.5, 0.5, 0.5,
-3.829453, -4.085373, -2, 1, 1.5, 0.5, 0.5,
-3.829453, -4.085373, -2, 0, 1.5, 0.5, 0.5,
-3.829453, -4.085373, 0, 0, -0.5, 0.5, 0.5,
-3.829453, -4.085373, 0, 1, -0.5, 0.5, 0.5,
-3.829453, -4.085373, 0, 1, 1.5, 0.5, 0.5,
-3.829453, -4.085373, 0, 0, 1.5, 0.5, 0.5,
-3.829453, -4.085373, 2, 0, -0.5, 0.5, 0.5,
-3.829453, -4.085373, 2, 1, -0.5, 0.5, 0.5,
-3.829453, -4.085373, 2, 1, 1.5, 0.5, 0.5,
-3.829453, -4.085373, 2, 0, 1.5, 0.5, 0.5,
-3.829453, -4.085373, 4, 0, -0.5, 0.5, 0.5,
-3.829453, -4.085373, 4, 1, -0.5, 0.5, 0.5,
-3.829453, -4.085373, 4, 1, 1.5, 0.5, 0.5,
-3.829453, -4.085373, 4, 0, 1.5, 0.5, 0.5
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
-3.347841, -3.550241, -5.297794,
-3.347841, 3.584857, -5.297794,
-3.347841, -3.550241, 5.61257,
-3.347841, 3.584857, 5.61257,
-3.347841, -3.550241, -5.297794,
-3.347841, -3.550241, 5.61257,
-3.347841, 3.584857, -5.297794,
-3.347841, 3.584857, 5.61257,
-3.347841, -3.550241, -5.297794,
3.073651, -3.550241, -5.297794,
-3.347841, -3.550241, 5.61257,
3.073651, -3.550241, 5.61257,
-3.347841, 3.584857, -5.297794,
3.073651, 3.584857, -5.297794,
-3.347841, 3.584857, 5.61257,
3.073651, 3.584857, 5.61257,
3.073651, -3.550241, -5.297794,
3.073651, 3.584857, -5.297794,
3.073651, -3.550241, 5.61257,
3.073651, 3.584857, 5.61257,
3.073651, -3.550241, -5.297794,
3.073651, -3.550241, 5.61257,
3.073651, 3.584857, -5.297794,
3.073651, 3.584857, 5.61257
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
var radius = 7.759846;
var distance = 34.52443;
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
mvMatrix.translate( 0.1370951, -0.01730788, -0.1573877 );
mvMatrix.scale( 1.306565, 1.175891, 0.7690026 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.52443);
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
quinoline<-read.table("quinoline.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-quinoline$V2
```

```
## Error in eval(expr, envir, enclos): object 'quinoline' not found
```

```r
y<-quinoline$V3
```

```
## Error in eval(expr, envir, enclos): object 'quinoline' not found
```

```r
z<-quinoline$V4
```

```
## Error in eval(expr, envir, enclos): object 'quinoline' not found
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
-3.254324, -0.2814762, -2.886603, 0, 0, 1, 1, 1,
-3.232237, -0.2158716, -1.628416, 1, 0, 0, 1, 1,
-3.188614, -0.6004691, -1.436838, 1, 0, 0, 1, 1,
-3.10458, -0.3172214, -1.748408, 1, 0, 0, 1, 1,
-3.057763, -0.1836838, -3.128792, 1, 0, 0, 1, 1,
-2.914704, 0.4781657, -1.468784, 1, 0, 0, 1, 1,
-2.614797, -0.530853, -2.942123, 0, 0, 0, 1, 1,
-2.536297, -1.277243, -2.963558, 0, 0, 0, 1, 1,
-2.517586, -0.5113387, -2.419217, 0, 0, 0, 1, 1,
-2.476609, -0.9036657, -3.237165, 0, 0, 0, 1, 1,
-2.428953, -0.8727272, -1.150515, 0, 0, 0, 1, 1,
-2.419731, -0.857603, -1.444325, 0, 0, 0, 1, 1,
-2.366047, 1.654568, -1.144101, 0, 0, 0, 1, 1,
-2.357898, 1.103788, -1.79642, 1, 1, 1, 1, 1,
-2.332538, 0.1759604, -1.57422, 1, 1, 1, 1, 1,
-2.332187, -0.320143, -2.588328, 1, 1, 1, 1, 1,
-2.307792, 1.203046, -0.7113371, 1, 1, 1, 1, 1,
-2.263842, -0.8093501, -1.645684, 1, 1, 1, 1, 1,
-2.246279, -0.1100928, -2.844427, 1, 1, 1, 1, 1,
-2.22775, -2.704355, -3.416785, 1, 1, 1, 1, 1,
-2.217603, 1.153019, -0.9768791, 1, 1, 1, 1, 1,
-2.205534, 0.4289136, -0.468267, 1, 1, 1, 1, 1,
-2.195688, -0.8055867, -1.775278, 1, 1, 1, 1, 1,
-2.183513, 0.8013218, -0.5402463, 1, 1, 1, 1, 1,
-2.008541, 0.2999521, -1.734299, 1, 1, 1, 1, 1,
-1.99062, 0.5036559, -1.274569, 1, 1, 1, 1, 1,
-1.986356, 0.7583475, -0.7036399, 1, 1, 1, 1, 1,
-1.957398, 1.558939, -0.9236953, 1, 1, 1, 1, 1,
-1.952025, -1.467377, -2.313683, 0, 0, 1, 1, 1,
-1.94527, -0.3494399, -1.012498, 1, 0, 0, 1, 1,
-1.936466, -0.5461956, -2.671676, 1, 0, 0, 1, 1,
-1.927582, -0.1526936, -2.849069, 1, 0, 0, 1, 1,
-1.918508, 0.8034791, -1.832087, 1, 0, 0, 1, 1,
-1.88169, -0.581679, -0.3216486, 1, 0, 0, 1, 1,
-1.876862, -1.546255, -3.554366, 0, 0, 0, 1, 1,
-1.872165, 0.3814645, -1.723117, 0, 0, 0, 1, 1,
-1.85462, 0.5927746, -1.025427, 0, 0, 0, 1, 1,
-1.853029, 0.8937708, -3.169183, 0, 0, 0, 1, 1,
-1.842131, -0.6685913, -0.6736658, 0, 0, 0, 1, 1,
-1.836161, 1.38721, 0.4088504, 0, 0, 0, 1, 1,
-1.832255, -0.09976593, -2.369793, 0, 0, 0, 1, 1,
-1.820363, 0.0401024, -0.8820186, 1, 1, 1, 1, 1,
-1.819596, 0.7573074, -1.025268, 1, 1, 1, 1, 1,
-1.819562, -0.5385367, -3.353475, 1, 1, 1, 1, 1,
-1.810091, 0.008781418, -1.304205, 1, 1, 1, 1, 1,
-1.77106, 1.571711, -3.565053, 1, 1, 1, 1, 1,
-1.770443, 0.8116554, -1.942018, 1, 1, 1, 1, 1,
-1.765901, -0.2823017, -2.242458, 1, 1, 1, 1, 1,
-1.759373, 0.6631952, 0.5430105, 1, 1, 1, 1, 1,
-1.755593, 0.7307165, -2.250726, 1, 1, 1, 1, 1,
-1.744774, -0.7310555, -2.735857, 1, 1, 1, 1, 1,
-1.744375, -1.025451, -2.884759, 1, 1, 1, 1, 1,
-1.735384, -1.387019, -1.166668, 1, 1, 1, 1, 1,
-1.729803, 1.310056, -2.586248, 1, 1, 1, 1, 1,
-1.723921, -1.056161, -0.5200615, 1, 1, 1, 1, 1,
-1.722125, 3.066422, -1.4591, 1, 1, 1, 1, 1,
-1.711267, -0.2736382, -1.317358, 0, 0, 1, 1, 1,
-1.705603, -1.163911, -1.912682, 1, 0, 0, 1, 1,
-1.703038, 0.7986463, -1.288032, 1, 0, 0, 1, 1,
-1.689733, -0.7225199, -2.338622, 1, 0, 0, 1, 1,
-1.688779, -1.721202, -2.683262, 1, 0, 0, 1, 1,
-1.680875, -0.8873785, -1.208359, 1, 0, 0, 1, 1,
-1.663037, -0.6111196, -0.7192482, 0, 0, 0, 1, 1,
-1.619594, 0.3231867, -1.502624, 0, 0, 0, 1, 1,
-1.616939, 0.07605254, -2.630523, 0, 0, 0, 1, 1,
-1.615895, -0.9139022, -1.601326, 0, 0, 0, 1, 1,
-1.609394, 0.4347372, 0.1663313, 0, 0, 0, 1, 1,
-1.609096, -1.591474, -1.169289, 0, 0, 0, 1, 1,
-1.563033, -0.08287802, -1.883203, 0, 0, 0, 1, 1,
-1.562784, 0.2734893, -1.13052, 1, 1, 1, 1, 1,
-1.555031, -0.539434, -0.1468003, 1, 1, 1, 1, 1,
-1.554649, -0.2933385, -2.105518, 1, 1, 1, 1, 1,
-1.533888, 1.831369, -1.377499, 1, 1, 1, 1, 1,
-1.532805, -0.557299, -2.817797, 1, 1, 1, 1, 1,
-1.528143, -0.8827443, -3.325752, 1, 1, 1, 1, 1,
-1.527548, 0.5303393, -0.661958, 1, 1, 1, 1, 1,
-1.515749, -0.3025166, -1.86817, 1, 1, 1, 1, 1,
-1.511353, -1.855817, -3.476077, 1, 1, 1, 1, 1,
-1.505654, 0.5395843, -0.9352866, 1, 1, 1, 1, 1,
-1.498663, -0.9317129, -2.98435, 1, 1, 1, 1, 1,
-1.494683, 1.390265, -1.139375, 1, 1, 1, 1, 1,
-1.488946, -1.536294, -2.789174, 1, 1, 1, 1, 1,
-1.488811, 1.725717, -1.276568, 1, 1, 1, 1, 1,
-1.487024, -0.2090886, -1.995379, 1, 1, 1, 1, 1,
-1.472394, 0.05332758, -0.8023053, 0, 0, 1, 1, 1,
-1.460358, -0.3222162, -1.356387, 1, 0, 0, 1, 1,
-1.459706, -0.6616878, -0.7822344, 1, 0, 0, 1, 1,
-1.453296, -0.8758437, -2.399184, 1, 0, 0, 1, 1,
-1.452432, 0.8298304, -1.076814, 1, 0, 0, 1, 1,
-1.449586, -0.03805032, -0.9615633, 1, 0, 0, 1, 1,
-1.446252, -1.717449, -3.496295, 0, 0, 0, 1, 1,
-1.442123, -3.446332, -2.636108, 0, 0, 0, 1, 1,
-1.436421, 0.1683875, -3.73452, 0, 0, 0, 1, 1,
-1.435267, -0.3661013, -1.325775, 0, 0, 0, 1, 1,
-1.433936, 0.2392834, -3.224131, 0, 0, 0, 1, 1,
-1.428734, 0.07427342, -1.563323, 0, 0, 0, 1, 1,
-1.428159, -2.368642, -3.577333, 0, 0, 0, 1, 1,
-1.426, 0.8281838, -0.1104772, 1, 1, 1, 1, 1,
-1.406617, 1.062234, -1.159053, 1, 1, 1, 1, 1,
-1.401054, -0.1942219, -2.045666, 1, 1, 1, 1, 1,
-1.39196, 0.1678203, -0.6896386, 1, 1, 1, 1, 1,
-1.382407, -0.5872518, -0.2694805, 1, 1, 1, 1, 1,
-1.370311, -0.03145129, -1.052544, 1, 1, 1, 1, 1,
-1.37015, 1.65962, -3.303216, 1, 1, 1, 1, 1,
-1.358004, 0.3912823, -1.228323, 1, 1, 1, 1, 1,
-1.356139, 0.06878906, -0.6571076, 1, 1, 1, 1, 1,
-1.355533, -0.7909897, -3.846628, 1, 1, 1, 1, 1,
-1.351611, -0.5526329, -1.06763, 1, 1, 1, 1, 1,
-1.348462, 0.128279, -1.784264, 1, 1, 1, 1, 1,
-1.338831, -1.086962, -1.058066, 1, 1, 1, 1, 1,
-1.337171, -0.4016382, -2.343061, 1, 1, 1, 1, 1,
-1.332664, -1.17252, -0.9010465, 1, 1, 1, 1, 1,
-1.330811, -0.5751834, -2.662988, 0, 0, 1, 1, 1,
-1.322681, -1.58234, -4.513223, 1, 0, 0, 1, 1,
-1.315233, 0.01187231, -0.2627492, 1, 0, 0, 1, 1,
-1.313936, 0.3882553, -0.6653413, 1, 0, 0, 1, 1,
-1.311529, -1.053541, -3.597341, 1, 0, 0, 1, 1,
-1.301383, 0.9770272, -0.0333598, 1, 0, 0, 1, 1,
-1.293475, -0.550776, -2.890541, 0, 0, 0, 1, 1,
-1.291018, -1.276956, -2.594815, 0, 0, 0, 1, 1,
-1.289976, -0.8131071, -1.856951, 0, 0, 0, 1, 1,
-1.287286, 1.320711, -1.274842, 0, 0, 0, 1, 1,
-1.283337, -0.255284, -1.678873, 0, 0, 0, 1, 1,
-1.276972, 0.2850069, -1.976922, 0, 0, 0, 1, 1,
-1.273745, -1.094786, -2.204388, 0, 0, 0, 1, 1,
-1.264347, 0.6987798, -1.302754, 1, 1, 1, 1, 1,
-1.261333, -2.631024, -1.591514, 1, 1, 1, 1, 1,
-1.25536, 1.420297, 0.121636, 1, 1, 1, 1, 1,
-1.243755, 0.3963916, -2.358982, 1, 1, 1, 1, 1,
-1.227476, -1.362215, -4.181, 1, 1, 1, 1, 1,
-1.219736, -0.2784723, -3.425135, 1, 1, 1, 1, 1,
-1.216972, 0.8436383, -1.832641, 1, 1, 1, 1, 1,
-1.216845, -0.3874669, -1.647967, 1, 1, 1, 1, 1,
-1.193097, 0.424785, -1.630271, 1, 1, 1, 1, 1,
-1.19158, -0.9407023, -3.383767, 1, 1, 1, 1, 1,
-1.191106, -0.05584804, -1.620965, 1, 1, 1, 1, 1,
-1.191028, -0.3576857, -1.729069, 1, 1, 1, 1, 1,
-1.187711, 0.726646, -1.739044, 1, 1, 1, 1, 1,
-1.185496, 0.1097552, -1.056596, 1, 1, 1, 1, 1,
-1.183126, 0.5402457, -1.188775, 1, 1, 1, 1, 1,
-1.180442, 0.3950021, -1.674147, 0, 0, 1, 1, 1,
-1.176715, -0.04131067, -2.669795, 1, 0, 0, 1, 1,
-1.166723, -0.4174001, -2.440085, 1, 0, 0, 1, 1,
-1.163235, 0.07008767, -1.556673, 1, 0, 0, 1, 1,
-1.15874, 0.1163772, -0.9565687, 1, 0, 0, 1, 1,
-1.156923, -1.10096, -1.953873, 1, 0, 0, 1, 1,
-1.153912, -0.2568693, -1.391873, 0, 0, 0, 1, 1,
-1.152285, -0.5731182, -1.249459, 0, 0, 0, 1, 1,
-1.151457, 1.055448, -1.771917, 0, 0, 0, 1, 1,
-1.149447, 1.099666, 0.7981623, 0, 0, 0, 1, 1,
-1.139396, -1.159863, -3.56139, 0, 0, 0, 1, 1,
-1.136772, 0.319483, -0.09380437, 0, 0, 0, 1, 1,
-1.13399, -0.7874537, -2.179616, 0, 0, 0, 1, 1,
-1.120325, -0.8605923, -2.944216, 1, 1, 1, 1, 1,
-1.117919, 0.8600367, -1.724936, 1, 1, 1, 1, 1,
-1.117465, -0.005786527, -1.250449, 1, 1, 1, 1, 1,
-1.112832, 1.125453, -0.7060383, 1, 1, 1, 1, 1,
-1.108949, 0.8108518, 0.3096671, 1, 1, 1, 1, 1,
-1.1021, 0.31681, -2.635417, 1, 1, 1, 1, 1,
-1.098122, -0.6356432, -2.590511, 1, 1, 1, 1, 1,
-1.09722, -1.107138, -3.570992, 1, 1, 1, 1, 1,
-1.094433, 0.9150735, -1.542053, 1, 1, 1, 1, 1,
-1.093517, -0.8123385, 0.1581342, 1, 1, 1, 1, 1,
-1.093371, 0.3178967, -1.275184, 1, 1, 1, 1, 1,
-1.089188, 0.5526272, -0.9376485, 1, 1, 1, 1, 1,
-1.079237, 0.9287834, -1.837048, 1, 1, 1, 1, 1,
-1.074843, -0.4437999, -2.162663, 1, 1, 1, 1, 1,
-1.071366, -1.081928, -2.645029, 1, 1, 1, 1, 1,
-1.065813, 0.2759347, -0.389555, 0, 0, 1, 1, 1,
-1.063964, 0.2498113, -0.817531, 1, 0, 0, 1, 1,
-1.059678, 0.5292633, -0.4153149, 1, 0, 0, 1, 1,
-1.059188, -0.3990393, -2.564343, 1, 0, 0, 1, 1,
-1.052143, -0.4287858, -1.739834, 1, 0, 0, 1, 1,
-1.051364, 1.086739, 1.143474, 1, 0, 0, 1, 1,
-1.049132, -0.6606715, -2.797646, 0, 0, 0, 1, 1,
-1.036147, 1.493916, -1.136585, 0, 0, 0, 1, 1,
-1.033373, 1.755213, -1.302672, 0, 0, 0, 1, 1,
-1.019008, 0.8229433, -2.794358, 0, 0, 0, 1, 1,
-1.017892, 0.4180716, -2.411029, 0, 0, 0, 1, 1,
-1.01752, -0.2797208, -2.156556, 0, 0, 0, 1, 1,
-1.013789, 1.030212, 1.64089, 0, 0, 0, 1, 1,
-1.013074, -1.496013, -2.111862, 1, 1, 1, 1, 1,
-1.012908, -0.9855072, -5.040173, 1, 1, 1, 1, 1,
-0.9992537, 0.3587194, -1.79589, 1, 1, 1, 1, 1,
-0.9989467, 0.6835085, -1.095455, 1, 1, 1, 1, 1,
-0.9987133, 0.00293679, -1.296679, 1, 1, 1, 1, 1,
-0.9975115, 0.1873061, -1.795972, 1, 1, 1, 1, 1,
-0.9965094, -1.012386, -1.812475, 1, 1, 1, 1, 1,
-0.9942483, 0.8588316, -2.242081, 1, 1, 1, 1, 1,
-0.9939713, -0.1715006, -1.175497, 1, 1, 1, 1, 1,
-0.9939299, 0.02827486, -1.892274, 1, 1, 1, 1, 1,
-0.9899126, -0.5250493, -3.22103, 1, 1, 1, 1, 1,
-0.9843538, -0.3053122, -1.524398, 1, 1, 1, 1, 1,
-0.9841818, -0.3227719, 0.3057111, 1, 1, 1, 1, 1,
-0.9779365, -1.483735, -2.226377, 1, 1, 1, 1, 1,
-0.9773877, 1.251358, -1.238734, 1, 1, 1, 1, 1,
-0.9672866, 1.154599, -0.4474916, 0, 0, 1, 1, 1,
-0.9664994, 0.1163674, -3.210362, 1, 0, 0, 1, 1,
-0.9633803, -0.1434045, -2.848163, 1, 0, 0, 1, 1,
-0.9632582, 0.1585835, -1.636146, 1, 0, 0, 1, 1,
-0.961403, -2.394859, -1.955867, 1, 0, 0, 1, 1,
-0.9610206, 0.3254877, -0.5206714, 1, 0, 0, 1, 1,
-0.9586216, -0.8527418, -2.128693, 0, 0, 0, 1, 1,
-0.9481382, 1.050739, -1.732812, 0, 0, 0, 1, 1,
-0.9424624, 1.711933, -1.997093, 0, 0, 0, 1, 1,
-0.9399228, -0.8247326, -1.860988, 0, 0, 0, 1, 1,
-0.9398299, -0.03091573, -0.3102029, 0, 0, 0, 1, 1,
-0.9373172, 1.516859, -0.05906362, 0, 0, 0, 1, 1,
-0.9268532, 0.9057539, -1.442114, 0, 0, 0, 1, 1,
-0.9228444, 1.131801, -3.128512, 1, 1, 1, 1, 1,
-0.9214209, 0.107323, -3.493286, 1, 1, 1, 1, 1,
-0.9172919, 0.1189519, -0.9774685, 1, 1, 1, 1, 1,
-0.915516, 0.394687, -0.5083491, 1, 1, 1, 1, 1,
-0.9109466, 0.1254787, -0.3212352, 1, 1, 1, 1, 1,
-0.9100278, 0.3596869, 0.9834133, 1, 1, 1, 1, 1,
-0.9072374, -0.9808423, -4.984382, 1, 1, 1, 1, 1,
-0.8939302, -1.644611, -1.396103, 1, 1, 1, 1, 1,
-0.8938904, 0.613996, -0.8795986, 1, 1, 1, 1, 1,
-0.8875762, -0.9014726, -2.92334, 1, 1, 1, 1, 1,
-0.8875384, 0.9842119, 0.3497057, 1, 1, 1, 1, 1,
-0.8837073, -0.2824733, -2.486689, 1, 1, 1, 1, 1,
-0.8775773, 1.510776, -0.5864268, 1, 1, 1, 1, 1,
-0.8774566, -0.1500532, -0.9311035, 1, 1, 1, 1, 1,
-0.8766167, -0.3132166, -2.271709, 1, 1, 1, 1, 1,
-0.873974, 2.139118, -1.762055, 0, 0, 1, 1, 1,
-0.8658814, -1.336515, -1.075548, 1, 0, 0, 1, 1,
-0.8634193, 1.729081, -0.8243779, 1, 0, 0, 1, 1,
-0.8588669, 0.1918012, -2.966057, 1, 0, 0, 1, 1,
-0.8584303, -0.7048949, -3.392206, 1, 0, 0, 1, 1,
-0.8566496, -0.6538557, -3.241102, 1, 0, 0, 1, 1,
-0.8556403, 0.6835055, -2.577477, 0, 0, 0, 1, 1,
-0.8556192, -0.5678992, -0.6007499, 0, 0, 0, 1, 1,
-0.8520812, 0.3527385, -1.688319, 0, 0, 0, 1, 1,
-0.8510214, 1.30029, 0.1228214, 0, 0, 0, 1, 1,
-0.8509881, 0.05060565, -2.359172, 0, 0, 0, 1, 1,
-0.8472643, 0.7805506, -0.3922659, 0, 0, 0, 1, 1,
-0.8427369, 1.486139, -0.168916, 0, 0, 0, 1, 1,
-0.8418818, -1.52168, -1.788937, 1, 1, 1, 1, 1,
-0.836593, -0.4938117, -2.417057, 1, 1, 1, 1, 1,
-0.8364178, 0.9312606, -0.7052401, 1, 1, 1, 1, 1,
-0.8288766, 0.7754899, -0.3967533, 1, 1, 1, 1, 1,
-0.8113894, 1.89377, 0.8731139, 1, 1, 1, 1, 1,
-0.8099717, -1.845225, -0.9603037, 1, 1, 1, 1, 1,
-0.8045015, 0.3981045, -1.558325, 1, 1, 1, 1, 1,
-0.800457, 0.3483288, -2.195038, 1, 1, 1, 1, 1,
-0.7954706, -0.5987367, -0.4565701, 1, 1, 1, 1, 1,
-0.7897491, 0.6453968, -0.7148123, 1, 1, 1, 1, 1,
-0.7890645, 0.2523318, -1.256924, 1, 1, 1, 1, 1,
-0.7777871, 0.3824351, -1.549351, 1, 1, 1, 1, 1,
-0.7671738, -1.016128, -3.620922, 1, 1, 1, 1, 1,
-0.7657086, 0.2420103, -2.822673, 1, 1, 1, 1, 1,
-0.7576091, 1.314903, -0.8342355, 1, 1, 1, 1, 1,
-0.7564802, -1.519702, -3.10861, 0, 0, 1, 1, 1,
-0.7516164, 0.656865, -0.5385507, 1, 0, 0, 1, 1,
-0.7476243, 0.6226667, -2.580466, 1, 0, 0, 1, 1,
-0.7438977, -0.7209523, -1.441743, 1, 0, 0, 1, 1,
-0.7435176, 0.9879826, 0.3250244, 1, 0, 0, 1, 1,
-0.7422747, -1.443946, -2.420252, 1, 0, 0, 1, 1,
-0.7339311, -1.648123, -3.562864, 0, 0, 0, 1, 1,
-0.7319325, 0.02328849, -1.669589, 0, 0, 0, 1, 1,
-0.7318627, 0.3284526, -2.904727, 0, 0, 0, 1, 1,
-0.7292061, -2.47488, -3.080226, 0, 0, 0, 1, 1,
-0.7262908, -0.3808324, -2.046464, 0, 0, 0, 1, 1,
-0.7239352, -0.2772205, -2.333347, 0, 0, 0, 1, 1,
-0.7231112, 1.362723, 1.282238, 0, 0, 0, 1, 1,
-0.7219245, 2.033821, 1.38982, 1, 1, 1, 1, 1,
-0.7188631, -0.09375196, -3.27446, 1, 1, 1, 1, 1,
-0.7186272, 0.4911445, 0.4279374, 1, 1, 1, 1, 1,
-0.7159374, 0.2309825, -3.099754, 1, 1, 1, 1, 1,
-0.7148492, -0.4723324, -2.297741, 1, 1, 1, 1, 1,
-0.7119333, -0.2098025, -2.983133, 1, 1, 1, 1, 1,
-0.71138, -0.7170672, -2.518651, 1, 1, 1, 1, 1,
-0.7103029, -0.271652, -1.532172, 1, 1, 1, 1, 1,
-0.7088569, 0.8313059, -2.033627, 1, 1, 1, 1, 1,
-0.7079701, -0.0001003357, -1.85068, 1, 1, 1, 1, 1,
-0.7050226, 0.225826, 0.1696469, 1, 1, 1, 1, 1,
-0.7043037, -1.598643, -2.44478, 1, 1, 1, 1, 1,
-0.7038904, -0.2113402, -2.31032, 1, 1, 1, 1, 1,
-0.7030218, 0.4773294, -2.773775, 1, 1, 1, 1, 1,
-0.7026495, -0.6823683, -3.894182, 1, 1, 1, 1, 1,
-0.7016051, -1.100728, -3.348516, 0, 0, 1, 1, 1,
-0.6986502, 1.107049, -0.4398193, 1, 0, 0, 1, 1,
-0.6965622, 0.6797509, -0.5387388, 1, 0, 0, 1, 1,
-0.6935253, -0.6146396, -2.788124, 1, 0, 0, 1, 1,
-0.6929175, -0.9987766, -2.765175, 1, 0, 0, 1, 1,
-0.6879231, -0.1518182, -1.120385, 1, 0, 0, 1, 1,
-0.6847258, -0.01498069, -0.4831122, 0, 0, 0, 1, 1,
-0.6845855, 0.7366908, -0.2096539, 0, 0, 0, 1, 1,
-0.6789842, -0.4614244, -1.754373, 0, 0, 0, 1, 1,
-0.678898, -2.468241, -3.044369, 0, 0, 0, 1, 1,
-0.6773508, 0.2359397, -1.80073, 0, 0, 0, 1, 1,
-0.6734572, 2.822737, -0.9760605, 0, 0, 0, 1, 1,
-0.6708889, 1.750926, 0.4001264, 0, 0, 0, 1, 1,
-0.6706086, 0.5431224, 0.6916627, 1, 1, 1, 1, 1,
-0.6679378, 0.08863913, 1.819125, 1, 1, 1, 1, 1,
-0.6671133, -0.2102675, -3.415276, 1, 1, 1, 1, 1,
-0.6668463, -1.959586, -3.145828, 1, 1, 1, 1, 1,
-0.6638112, -0.6891534, -2.702552, 1, 1, 1, 1, 1,
-0.6625397, -0.1712895, -1.251342, 1, 1, 1, 1, 1,
-0.6615693, 0.7414486, 0.5514733, 1, 1, 1, 1, 1,
-0.6556927, -0.98651, -4.549458, 1, 1, 1, 1, 1,
-0.6552078, 0.3871207, -1.549675, 1, 1, 1, 1, 1,
-0.6488317, 0.09266601, -2.623521, 1, 1, 1, 1, 1,
-0.6480547, 1.367503, 1.196104, 1, 1, 1, 1, 1,
-0.6407757, 1.481649, -2.182691, 1, 1, 1, 1, 1,
-0.6406724, 0.172539, -1.702812, 1, 1, 1, 1, 1,
-0.6400793, -0.5851192, -2.421602, 1, 1, 1, 1, 1,
-0.6345419, -0.2699928, -0.4924461, 1, 1, 1, 1, 1,
-0.6295592, -0.4033901, -3.539673, 0, 0, 1, 1, 1,
-0.6269922, 0.09242346, -0.1273783, 1, 0, 0, 1, 1,
-0.6257582, 0.6012589, 1.892415, 1, 0, 0, 1, 1,
-0.622777, 0.9793171, -0.7006274, 1, 0, 0, 1, 1,
-0.6215129, 0.4121501, -1.531069, 1, 0, 0, 1, 1,
-0.6046308, 0.9564769, -0.4929427, 1, 0, 0, 1, 1,
-0.601126, -0.4931692, -1.650954, 0, 0, 0, 1, 1,
-0.6007231, 0.6684992, -0.4009247, 0, 0, 0, 1, 1,
-0.5915996, -0.04368375, -1.726444, 0, 0, 0, 1, 1,
-0.5878637, -0.7195556, -1.949374, 0, 0, 0, 1, 1,
-0.5859156, -0.5591114, -1.658425, 0, 0, 0, 1, 1,
-0.5846484, -1.436387, -2.335743, 0, 0, 0, 1, 1,
-0.5832555, 1.544448, -0.6075222, 0, 0, 0, 1, 1,
-0.5799705, -0.1487812, -2.06875, 1, 1, 1, 1, 1,
-0.5793098, -1.544984, -1.795657, 1, 1, 1, 1, 1,
-0.5764064, -0.2381559, -1.293482, 1, 1, 1, 1, 1,
-0.5759243, 0.8398514, 0.25292, 1, 1, 1, 1, 1,
-0.5739471, 1.981884, -0.5866767, 1, 1, 1, 1, 1,
-0.572842, 0.4696325, 0.04667797, 1, 1, 1, 1, 1,
-0.5727338, 0.6563402, -1.385928, 1, 1, 1, 1, 1,
-0.5627884, 0.0533845, -1.572764, 1, 1, 1, 1, 1,
-0.5594559, 0.1190739, -1.976253, 1, 1, 1, 1, 1,
-0.550461, -2.293778, -2.669348, 1, 1, 1, 1, 1,
-0.5488034, 1.015377, 0.8050553, 1, 1, 1, 1, 1,
-0.5406033, 0.6222559, -1.286522, 1, 1, 1, 1, 1,
-0.539938, 1.039429, -1.662671, 1, 1, 1, 1, 1,
-0.5303178, 0.9751876, -0.3175042, 1, 1, 1, 1, 1,
-0.5253196, 0.5968421, -0.645291, 1, 1, 1, 1, 1,
-0.5243984, 0.5547455, 0.4727265, 0, 0, 1, 1, 1,
-0.5217031, 0.1637258, -2.499236, 1, 0, 0, 1, 1,
-0.5195458, 0.2944769, -0.6670225, 1, 0, 0, 1, 1,
-0.5157267, 0.3868959, -0.7396798, 1, 0, 0, 1, 1,
-0.5136821, -0.6034324, -3.616594, 1, 0, 0, 1, 1,
-0.513027, 1.051202, -0.9713184, 1, 0, 0, 1, 1,
-0.5065219, -2.009534, -3.327168, 0, 0, 0, 1, 1,
-0.5039587, -0.3929471, -2.378275, 0, 0, 0, 1, 1,
-0.499945, 1.643456, -0.6350256, 0, 0, 0, 1, 1,
-0.4925787, -0.8796153, -2.849324, 0, 0, 0, 1, 1,
-0.4869058, 0.4890316, -0.3560728, 0, 0, 0, 1, 1,
-0.477336, 0.4659658, -2.754511, 0, 0, 0, 1, 1,
-0.4762077, -2.377753, -0.352176, 0, 0, 0, 1, 1,
-0.4740354, 0.6662598, -1.888887, 1, 1, 1, 1, 1,
-0.4730636, 0.07493383, -0.8462951, 1, 1, 1, 1, 1,
-0.4689076, -0.3946245, -3.634753, 1, 1, 1, 1, 1,
-0.468349, -0.7385004, -1.067839, 1, 1, 1, 1, 1,
-0.4667673, -0.04060923, -1.816296, 1, 1, 1, 1, 1,
-0.4665937, 1.733192, -2.044845, 1, 1, 1, 1, 1,
-0.4653533, 0.8982649, -0.5341981, 1, 1, 1, 1, 1,
-0.4628917, -0.8216274, -4.014132, 1, 1, 1, 1, 1,
-0.4539115, 2.502613, -0.7280949, 1, 1, 1, 1, 1,
-0.4480214, -0.8499098, -1.773977, 1, 1, 1, 1, 1,
-0.4445206, -1.116004, -2.085873, 1, 1, 1, 1, 1,
-0.4424079, -0.1775745, -1.625913, 1, 1, 1, 1, 1,
-0.4419016, 0.02455517, -0.8502035, 1, 1, 1, 1, 1,
-0.4379097, 0.1132124, -1.363467, 1, 1, 1, 1, 1,
-0.4325905, 0.2154839, -2.106858, 1, 1, 1, 1, 1,
-0.4317772, -0.7274147, -3.875075, 0, 0, 1, 1, 1,
-0.4312418, 0.8916402, -0.9170813, 1, 0, 0, 1, 1,
-0.4232717, 0.03402202, -0.3135153, 1, 0, 0, 1, 1,
-0.4224277, 1.299044, -2.115302, 1, 0, 0, 1, 1,
-0.4215036, 0.6542218, -1.133265, 1, 0, 0, 1, 1,
-0.4208123, -0.87361, -2.886031, 1, 0, 0, 1, 1,
-0.4205376, -0.2787203, -1.075354, 0, 0, 0, 1, 1,
-0.4202808, -1.346733, -4.630572, 0, 0, 0, 1, 1,
-0.4177807, -0.9054087, -3.37619, 0, 0, 0, 1, 1,
-0.4161335, -0.2555833, -1.288299, 0, 0, 0, 1, 1,
-0.4085202, 0.7356021, -1.148782, 0, 0, 0, 1, 1,
-0.4062459, 0.8240962, -0.192972, 0, 0, 0, 1, 1,
-0.4032622, -0.3376887, -3.360503, 0, 0, 0, 1, 1,
-0.4007775, -0.3498028, -2.57925, 1, 1, 1, 1, 1,
-0.3950782, -1.11767, -1.654584, 1, 1, 1, 1, 1,
-0.3946313, -0.6133009, -3.983748, 1, 1, 1, 1, 1,
-0.3888733, 1.239124, 0.404922, 1, 1, 1, 1, 1,
-0.3873263, 1.92895, -1.193152, 1, 1, 1, 1, 1,
-0.3872245, 1.269332, -0.6925272, 1, 1, 1, 1, 1,
-0.3836546, -1.038436, -2.312493, 1, 1, 1, 1, 1,
-0.3796601, -0.1883661, -1.416502, 1, 1, 1, 1, 1,
-0.3734351, -1.080509, -2.52913, 1, 1, 1, 1, 1,
-0.3734273, 1.313315, -2.880167, 1, 1, 1, 1, 1,
-0.3724346, -0.01060945, -0.5996438, 1, 1, 1, 1, 1,
-0.3676658, 0.1076244, -0.9121743, 1, 1, 1, 1, 1,
-0.3648615, 2.241186, 0.01384156, 1, 1, 1, 1, 1,
-0.3641009, 0.5278842, -2.245657, 1, 1, 1, 1, 1,
-0.363328, 0.9525279, 0.6230136, 1, 1, 1, 1, 1,
-0.3608374, -0.8149204, -1.623568, 0, 0, 1, 1, 1,
-0.3555999, 0.863701, -0.1055092, 1, 0, 0, 1, 1,
-0.3509513, -0.02952813, -2.870044, 1, 0, 0, 1, 1,
-0.3509039, 0.9468442, 0.7235802, 1, 0, 0, 1, 1,
-0.3488936, -0.3620052, -2.347563, 1, 0, 0, 1, 1,
-0.3443815, 2.533551, -0.3822755, 1, 0, 0, 1, 1,
-0.3397665, -0.2494535, -3.564208, 0, 0, 0, 1, 1,
-0.3240796, 1.275808, -0.5113177, 0, 0, 0, 1, 1,
-0.3036115, -0.03820455, -2.935971, 0, 0, 0, 1, 1,
-0.298799, 2.124, 2.269382, 0, 0, 0, 1, 1,
-0.2978804, 1.311838, 0.1879638, 0, 0, 0, 1, 1,
-0.2957393, 1.978111, -0.6634612, 0, 0, 0, 1, 1,
-0.2953077, 0.2851819, -1.13746, 0, 0, 0, 1, 1,
-0.2938574, 1.801157, 1.075837, 1, 1, 1, 1, 1,
-0.2917033, 0.4751512, -0.4535138, 1, 1, 1, 1, 1,
-0.2839099, -0.7881563, -2.695625, 1, 1, 1, 1, 1,
-0.2757618, 1.167686, -1.797449, 1, 1, 1, 1, 1,
-0.2689049, -1.601673, -2.613755, 1, 1, 1, 1, 1,
-0.2686798, -0.5465609, -1.909794, 1, 1, 1, 1, 1,
-0.2668051, 0.6637629, 0.1850526, 1, 1, 1, 1, 1,
-0.2660234, -0.8418424, -1.966308, 1, 1, 1, 1, 1,
-0.2632589, -0.08945689, -1.663742, 1, 1, 1, 1, 1,
-0.262307, -0.5222932, -3.710815, 1, 1, 1, 1, 1,
-0.2608797, 0.3910313, -1.615271, 1, 1, 1, 1, 1,
-0.2553268, 0.71242, -0.6839514, 1, 1, 1, 1, 1,
-0.2539501, -2.033788, -2.787945, 1, 1, 1, 1, 1,
-0.2524163, 0.3817014, 1.361763, 1, 1, 1, 1, 1,
-0.2488222, -0.2744271, -1.95031, 1, 1, 1, 1, 1,
-0.2473435, 0.2858582, -0.542611, 0, 0, 1, 1, 1,
-0.2446689, -0.8167183, -3.898606, 1, 0, 0, 1, 1,
-0.2399201, 0.6529367, 0.3881724, 1, 0, 0, 1, 1,
-0.2394131, 1.200054, -0.6439257, 1, 0, 0, 1, 1,
-0.2387633, 0.303112, 0.3302402, 1, 0, 0, 1, 1,
-0.2386379, 0.4958771, -0.4613624, 1, 0, 0, 1, 1,
-0.2340657, 0.853069, -1.361495, 0, 0, 0, 1, 1,
-0.2307241, 0.6655977, -1.814992, 0, 0, 0, 1, 1,
-0.2268793, 0.5569876, -0.5364773, 0, 0, 0, 1, 1,
-0.2255692, 0.2052654, 0.2672169, 0, 0, 0, 1, 1,
-0.2201212, -1.542757, -3.449021, 0, 0, 0, 1, 1,
-0.2152175, -1.009925, -2.938301, 0, 0, 0, 1, 1,
-0.2131947, -0.01989173, -1.548032, 0, 0, 0, 1, 1,
-0.211078, -0.8072969, -2.391297, 1, 1, 1, 1, 1,
-0.2098914, -0.9829067, -2.706847, 1, 1, 1, 1, 1,
-0.2084329, -1.258439, -1.559686, 1, 1, 1, 1, 1,
-0.2007419, -1.299368, -2.036934, 1, 1, 1, 1, 1,
-0.1962822, 0.2101843, -2.317524, 1, 1, 1, 1, 1,
-0.1933522, 0.897633, 0.01996443, 1, 1, 1, 1, 1,
-0.1906968, -0.6980441, -3.474752, 1, 1, 1, 1, 1,
-0.1894235, 1.024744, -0.3247229, 1, 1, 1, 1, 1,
-0.1890527, 0.4405541, -0.6153004, 1, 1, 1, 1, 1,
-0.1872034, 0.7215694, -0.09987514, 1, 1, 1, 1, 1,
-0.1854813, 1.253776, -0.19614, 1, 1, 1, 1, 1,
-0.1846192, -0.6232384, -1.102974, 1, 1, 1, 1, 1,
-0.1839089, 0.3517277, -0.5213067, 1, 1, 1, 1, 1,
-0.179122, 0.517472, -1.338044, 1, 1, 1, 1, 1,
-0.1774164, -0.4622738, -3.700666, 1, 1, 1, 1, 1,
-0.1765799, -0.1423591, -0.4653941, 0, 0, 1, 1, 1,
-0.1722597, 0.9295844, 0.3743189, 1, 0, 0, 1, 1,
-0.1712555, -1.165126, -4.729727, 1, 0, 0, 1, 1,
-0.1699419, 1.326914, -0.989173, 1, 0, 0, 1, 1,
-0.1688348, -0.4393393, -1.629208, 1, 0, 0, 1, 1,
-0.1648662, -2.348295, -4.122525, 1, 0, 0, 1, 1,
-0.1627701, 0.6150758, -0.3034575, 0, 0, 0, 1, 1,
-0.1614515, 0.3909108, -1.874309, 0, 0, 0, 1, 1,
-0.1601718, -0.09157941, -1.334872, 0, 0, 0, 1, 1,
-0.1594806, -1.186203, -4.088089, 0, 0, 0, 1, 1,
-0.1511609, 0.8148487, -2.751146, 0, 0, 0, 1, 1,
-0.1452106, 0.8825976, -1.14567, 0, 0, 0, 1, 1,
-0.1415408, 0.1900736, -1.291226, 0, 0, 0, 1, 1,
-0.1407834, -0.1227852, -3.224577, 1, 1, 1, 1, 1,
-0.1382492, 0.1277094, -2.236377, 1, 1, 1, 1, 1,
-0.1359206, 0.863299, 0.1429283, 1, 1, 1, 1, 1,
-0.1268388, 0.7246304, -1.074611, 1, 1, 1, 1, 1,
-0.1265303, -1.051159, -1.05254, 1, 1, 1, 1, 1,
-0.1263297, 0.7319139, -0.7771723, 1, 1, 1, 1, 1,
-0.1251572, -0.825564, -2.185073, 1, 1, 1, 1, 1,
-0.1221042, -0.6139181, -2.09471, 1, 1, 1, 1, 1,
-0.1192181, 0.1836988, -0.01465215, 1, 1, 1, 1, 1,
-0.1179983, 0.2965655, -0.7491305, 1, 1, 1, 1, 1,
-0.1106657, -0.616842, -3.448457, 1, 1, 1, 1, 1,
-0.1025953, -0.6935308, -4.513563, 1, 1, 1, 1, 1,
-0.09766164, -1.853117, -3.665022, 1, 1, 1, 1, 1,
-0.09645279, -0.1201185, -2.838041, 1, 1, 1, 1, 1,
-0.09543711, 0.6637807, -1.545253, 1, 1, 1, 1, 1,
-0.09104192, -1.478844, -2.736123, 0, 0, 1, 1, 1,
-0.0870332, -0.3788874, -1.656338, 1, 0, 0, 1, 1,
-0.08688398, 0.8576487, -1.973762, 1, 0, 0, 1, 1,
-0.08429366, 0.2130367, 1.823161, 1, 0, 0, 1, 1,
-0.08196265, 1.629509, 0.8817527, 1, 0, 0, 1, 1,
-0.08180867, 1.243086, 0.2762523, 1, 0, 0, 1, 1,
-0.07998407, -0.2719482, -3.377937, 0, 0, 0, 1, 1,
-0.07914646, -0.7195722, -1.513085, 0, 0, 0, 1, 1,
-0.07791352, -0.4088373, -4.364837, 0, 0, 0, 1, 1,
-0.07588421, -0.4864402, -3.72379, 0, 0, 0, 1, 1,
-0.07434494, -0.7606638, -3.361118, 0, 0, 0, 1, 1,
-0.07426951, 0.7570073, 0.1645885, 0, 0, 0, 1, 1,
-0.07294396, -1.388739, -3.079913, 0, 0, 0, 1, 1,
-0.06531855, -1.94086, -5.138906, 1, 1, 1, 1, 1,
-0.06074468, 0.4430469, 1.980982, 1, 1, 1, 1, 1,
-0.05916499, 0.8478654, -0.7548777, 1, 1, 1, 1, 1,
-0.05774417, 0.07109715, -1.015559, 1, 1, 1, 1, 1,
-0.05697129, -0.7701637, -1.479238, 1, 1, 1, 1, 1,
-0.05299119, 1.981814, -1.344559, 1, 1, 1, 1, 1,
-0.05264706, -0.6408737, -4.014481, 1, 1, 1, 1, 1,
-0.04893023, -0.4399576, -3.193085, 1, 1, 1, 1, 1,
-0.04481972, 0.6498608, -0.8104501, 1, 1, 1, 1, 1,
-0.04269444, 1.174256, -0.5975975, 1, 1, 1, 1, 1,
-0.04075667, 0.6498618, -0.3878591, 1, 1, 1, 1, 1,
-0.04017215, -1.420395, -1.279336, 1, 1, 1, 1, 1,
-0.03973676, 0.09441648, 0.1854487, 1, 1, 1, 1, 1,
-0.03583411, 2.133678, -0.5772724, 1, 1, 1, 1, 1,
-0.03416328, -0.1283913, -1.943544, 1, 1, 1, 1, 1,
-0.03230612, -0.02437346, -2.340776, 0, 0, 1, 1, 1,
-0.0312366, 0.07346117, -1.555095, 1, 0, 0, 1, 1,
-0.02958139, -0.5633634, -2.132469, 1, 0, 0, 1, 1,
-0.02603723, 0.5337057, 0.3664205, 1, 0, 0, 1, 1,
-0.02419009, 0.3030231, 0.3160699, 1, 0, 0, 1, 1,
-0.02221269, 0.7438849, 0.5618476, 1, 0, 0, 1, 1,
-0.02206376, -0.1477897, -2.441816, 0, 0, 0, 1, 1,
-0.02201965, 1.452024, 0.4305515, 0, 0, 0, 1, 1,
-0.01450683, -1.488881, -4.000944, 0, 0, 0, 1, 1,
-0.01148107, -1.557595, -3.564162, 0, 0, 0, 1, 1,
-0.01008055, -1.362622, -4.181107, 0, 0, 0, 1, 1,
-0.009243741, 0.1258141, 0.007779884, 0, 0, 0, 1, 1,
-0.005484679, 1.195775, -0.691369, 0, 0, 0, 1, 1,
0.0007435294, -0.1950767, 4.063828, 1, 1, 1, 1, 1,
0.006108983, 0.4719339, 0.09430937, 1, 1, 1, 1, 1,
0.006748314, -1.200725, 1.733088, 1, 1, 1, 1, 1,
0.008849838, -1.372957, 1.890016, 1, 1, 1, 1, 1,
0.009007041, -0.4528795, 3.984472, 1, 1, 1, 1, 1,
0.01559438, 0.1587186, 0.6248029, 1, 1, 1, 1, 1,
0.01901049, 1.629624, 0.3559469, 1, 1, 1, 1, 1,
0.0199747, -1.696421, 3.772096, 1, 1, 1, 1, 1,
0.02097109, 1.174055, -2.315315, 1, 1, 1, 1, 1,
0.02178275, -0.2760337, 2.378461, 1, 1, 1, 1, 1,
0.02214415, 0.7562893, -0.641112, 1, 1, 1, 1, 1,
0.02216775, -0.02980696, 3.12048, 1, 1, 1, 1, 1,
0.0244162, -0.5213282, 3.582021, 1, 1, 1, 1, 1,
0.02704022, -0.5792398, 3.298798, 1, 1, 1, 1, 1,
0.02888562, 1.053783, -0.3103303, 1, 1, 1, 1, 1,
0.03978103, 1.223867, -0.2792783, 0, 0, 1, 1, 1,
0.04589909, 0.730378, -1.010801, 1, 0, 0, 1, 1,
0.05278061, -0.08330636, 2.241147, 1, 0, 0, 1, 1,
0.05633346, 1.078324, 0.6619784, 1, 0, 0, 1, 1,
0.05841813, 1.120932, 0.4835763, 1, 0, 0, 1, 1,
0.06797303, 1.534079, 1.348632, 1, 0, 0, 1, 1,
0.07235394, 0.2336287, -0.1810773, 0, 0, 0, 1, 1,
0.07995837, -0.7287537, 2.787159, 0, 0, 0, 1, 1,
0.0804612, 0.3638997, -1.405087, 0, 0, 0, 1, 1,
0.08911001, 0.2552847, 0.6586565, 0, 0, 0, 1, 1,
0.09528706, -0.3083732, 2.520357, 0, 0, 0, 1, 1,
0.09807374, 0.2364986, 0.09068295, 0, 0, 0, 1, 1,
0.1002274, 0.3375391, -0.7865093, 0, 0, 0, 1, 1,
0.1077681, -0.3242454, 3.652009, 1, 1, 1, 1, 1,
0.1116301, -0.04039512, 1.784541, 1, 1, 1, 1, 1,
0.1140716, -0.6900635, 2.673748, 1, 1, 1, 1, 1,
0.1181713, -1.62655, 1.821672, 1, 1, 1, 1, 1,
0.1188357, 1.885482, -0.1721955, 1, 1, 1, 1, 1,
0.1214325, -0.1833857, 2.401164, 1, 1, 1, 1, 1,
0.1221955, 0.06376379, 0.6399458, 1, 1, 1, 1, 1,
0.1226132, 1.194189, -0.4938009, 1, 1, 1, 1, 1,
0.1248402, -1.322101, 2.041065, 1, 1, 1, 1, 1,
0.1265104, -0.3703875, 3.06669, 1, 1, 1, 1, 1,
0.1275358, 0.8016405, -0.1018859, 1, 1, 1, 1, 1,
0.1310417, -0.7039887, 1.832015, 1, 1, 1, 1, 1,
0.1332367, -2.03407, 3.355249, 1, 1, 1, 1, 1,
0.1370394, 0.1024774, -0.2419245, 1, 1, 1, 1, 1,
0.1388776, 0.9390675, 0.3028518, 1, 1, 1, 1, 1,
0.1398353, -0.6778548, 2.511585, 0, 0, 1, 1, 1,
0.1480582, -1.286053, 3.225138, 1, 0, 0, 1, 1,
0.1509821, 0.02946219, 2.201895, 1, 0, 0, 1, 1,
0.1583258, -0.6511623, 3.352221, 1, 0, 0, 1, 1,
0.1586662, -0.1592764, 2.411169, 1, 0, 0, 1, 1,
0.1640737, 0.1722071, 0.8455943, 1, 0, 0, 1, 1,
0.1654807, -0.94629, 2.627729, 0, 0, 0, 1, 1,
0.1659531, -0.3200338, 1.949972, 0, 0, 0, 1, 1,
0.167617, -0.1516933, 1.512693, 0, 0, 0, 1, 1,
0.1693456, -0.7056131, 2.407574, 0, 0, 0, 1, 1,
0.1705688, -0.993732, 1.601219, 0, 0, 0, 1, 1,
0.1734752, 0.4993277, -1.523405, 0, 0, 0, 1, 1,
0.1746354, -1.656052, 3.490242, 0, 0, 0, 1, 1,
0.1784206, -2.305398, 3.998643, 1, 1, 1, 1, 1,
0.1798133, 0.791899, -0.1679128, 1, 1, 1, 1, 1,
0.1802883, 0.8081465, 1.965655e-05, 1, 1, 1, 1, 1,
0.1827789, 0.1884076, 1.037589, 1, 1, 1, 1, 1,
0.1872139, -1.250032, 3.873999, 1, 1, 1, 1, 1,
0.1926047, -0.3642672, 4.716189, 1, 1, 1, 1, 1,
0.1943626, -0.5283257, 0.8258644, 1, 1, 1, 1, 1,
0.1944765, -0.8440463, 3.665474, 1, 1, 1, 1, 1,
0.1976771, -0.556143, 3.114979, 1, 1, 1, 1, 1,
0.1989288, 0.5357155, 0.4070203, 1, 1, 1, 1, 1,
0.1993409, 0.05571778, 0.5097755, 1, 1, 1, 1, 1,
0.2003774, -2.606763, 2.262411, 1, 1, 1, 1, 1,
0.2058124, 0.1071925, 0.7494154, 1, 1, 1, 1, 1,
0.206206, -0.3726007, 1.633242, 1, 1, 1, 1, 1,
0.2067838, 0.6548006, 0.9780094, 1, 1, 1, 1, 1,
0.2165173, 0.563069, 1.492008, 0, 0, 1, 1, 1,
0.2177315, -0.4786933, 2.333325, 1, 0, 0, 1, 1,
0.2245564, -0.2176421, 1.829723, 1, 0, 0, 1, 1,
0.224907, 0.04737986, -0.3629404, 1, 0, 0, 1, 1,
0.225385, 0.3778007, 1.246863, 1, 0, 0, 1, 1,
0.2276976, 1.234302, 0.3448444, 1, 0, 0, 1, 1,
0.2287759, 1.367341, -0.4310131, 0, 0, 0, 1, 1,
0.233491, 0.7125771, 1.619874, 0, 0, 0, 1, 1,
0.2344457, -0.04872862, 1.119088, 0, 0, 0, 1, 1,
0.2381667, 0.1897128, -0.5506176, 0, 0, 0, 1, 1,
0.2392627, 1.983083, 0.02539321, 0, 0, 0, 1, 1,
0.2436291, 0.7781111, 0.6704068, 0, 0, 0, 1, 1,
0.2485575, 1.258646, 0.169257, 0, 0, 0, 1, 1,
0.2543397, -2.292883, 2.689669, 1, 1, 1, 1, 1,
0.2549476, -0.2032462, 2.710727, 1, 1, 1, 1, 1,
0.2555815, 1.404475, 0.2493029, 1, 1, 1, 1, 1,
0.2573346, -0.1612563, 3.376485, 1, 1, 1, 1, 1,
0.2614751, -0.2306339, 2.814851, 1, 1, 1, 1, 1,
0.2656839, -1.086965, 0.8624623, 1, 1, 1, 1, 1,
0.2669395, 0.2128332, 2.629979, 1, 1, 1, 1, 1,
0.2749885, 0.6821362, 1.424127, 1, 1, 1, 1, 1,
0.2795916, 0.9476224, -1.164433, 1, 1, 1, 1, 1,
0.2805241, -0.51643, 1.814928, 1, 1, 1, 1, 1,
0.2819739, 0.2081038, 1.290678, 1, 1, 1, 1, 1,
0.2839677, 0.1815275, 0.4723584, 1, 1, 1, 1, 1,
0.2864946, -0.1433824, 1.709735, 1, 1, 1, 1, 1,
0.2904245, 0.8852519, -1.627496, 1, 1, 1, 1, 1,
0.2908839, 1.24759, -0.5944905, 1, 1, 1, 1, 1,
0.2931618, 0.3884296, -0.4215533, 0, 0, 1, 1, 1,
0.2944152, 0.9197168, 0.05650269, 1, 0, 0, 1, 1,
0.2979708, 0.9317887, -0.9382294, 1, 0, 0, 1, 1,
0.299508, 0.1678746, 1.049321, 1, 0, 0, 1, 1,
0.3001148, 0.3946435, 0.6497599, 1, 0, 0, 1, 1,
0.3001572, 0.2045392, 1.197488, 1, 0, 0, 1, 1,
0.3095348, -1.40791, 2.461345, 0, 0, 0, 1, 1,
0.3143373, 1.552559, 0.1860548, 0, 0, 0, 1, 1,
0.3148615, -1.804442, 2.809761, 0, 0, 0, 1, 1,
0.3224925, -0.0408462, 2.088681, 0, 0, 0, 1, 1,
0.3243618, -0.5025324, 3.777806, 0, 0, 0, 1, 1,
0.3255461, 0.1632617, 0.9572212, 0, 0, 0, 1, 1,
0.3293895, -0.7003779, 4.228637, 0, 0, 0, 1, 1,
0.3296879, 1.794758, 1.854436, 1, 1, 1, 1, 1,
0.3348033, 0.08920299, 0.27184, 1, 1, 1, 1, 1,
0.3384576, -1.890899, 2.153477, 1, 1, 1, 1, 1,
0.3384787, -0.05562866, 3.369064, 1, 1, 1, 1, 1,
0.3405984, 0.1787598, 1.761005, 1, 1, 1, 1, 1,
0.3413202, 0.1246592, 0.9416517, 1, 1, 1, 1, 1,
0.3414671, -1.275032, 1.685305, 1, 1, 1, 1, 1,
0.3476677, 1.090677, 1.69364, 1, 1, 1, 1, 1,
0.3487152, 0.7732736, 0.3190056, 1, 1, 1, 1, 1,
0.3542531, 2.021252, 0.6736653, 1, 1, 1, 1, 1,
0.354788, 0.9313862, 1.699173, 1, 1, 1, 1, 1,
0.3552234, 1.470583, -1.661796, 1, 1, 1, 1, 1,
0.3640892, -0.9213778, 3.736131, 1, 1, 1, 1, 1,
0.3650129, -1.586047, 5.350991, 1, 1, 1, 1, 1,
0.3681881, -0.9083405, 4.526611, 1, 1, 1, 1, 1,
0.3704318, -1.607646, 5.165821, 0, 0, 1, 1, 1,
0.3704792, -0.7643638, 3.451233, 1, 0, 0, 1, 1,
0.3717707, -0.503591, 4.14596, 1, 0, 0, 1, 1,
0.37229, -0.1930531, 1.533551, 1, 0, 0, 1, 1,
0.3729116, -1.338889, 1.96682, 1, 0, 0, 1, 1,
0.3793392, -1.158433, 2.710412, 1, 0, 0, 1, 1,
0.3802001, -0.704771, 2.965787, 0, 0, 0, 1, 1,
0.3808297, -0.2595173, 0.5348555, 0, 0, 0, 1, 1,
0.3816265, 1.192019, -0.1774501, 0, 0, 0, 1, 1,
0.382387, 1.276084, 0.4145, 0, 0, 0, 1, 1,
0.3842033, 1.380676, 0.9688971, 0, 0, 0, 1, 1,
0.3865653, 0.7709338, -1.091023, 0, 0, 0, 1, 1,
0.3876026, 0.205551, 0.4696377, 0, 0, 0, 1, 1,
0.3887431, -0.6647613, 2.290589, 1, 1, 1, 1, 1,
0.3937025, -1.160904, 3.542859, 1, 1, 1, 1, 1,
0.3947428, 2.824903, 2.632925, 1, 1, 1, 1, 1,
0.3951925, 0.5039233, 1.18162, 1, 1, 1, 1, 1,
0.4008606, 0.7112502, 1.062605, 1, 1, 1, 1, 1,
0.4075949, -0.3724468, 3.701075, 1, 1, 1, 1, 1,
0.4080852, 0.7942275, -0.01904762, 1, 1, 1, 1, 1,
0.4108449, -0.8582785, 2.124573, 1, 1, 1, 1, 1,
0.4123007, -2.601653, 2.049979, 1, 1, 1, 1, 1,
0.4158232, -0.7650445, 1.701512, 1, 1, 1, 1, 1,
0.4211056, -1.198337, 3.515577, 1, 1, 1, 1, 1,
0.4279306, -1.578956, 3.91492, 1, 1, 1, 1, 1,
0.4286021, 2.204364, 1.514746, 1, 1, 1, 1, 1,
0.4340298, 0.4228733, -0.3937024, 1, 1, 1, 1, 1,
0.4348194, 1.676771, -0.04694159, 1, 1, 1, 1, 1,
0.4358972, -1.201337, 0.8610771, 0, 0, 1, 1, 1,
0.4373735, -0.8566278, 2.207657, 1, 0, 0, 1, 1,
0.4392901, -0.1343357, 2.381442, 1, 0, 0, 1, 1,
0.4427709, -0.02452754, 1.606967, 1, 0, 0, 1, 1,
0.4445055, 0.2543087, 0.7884017, 1, 0, 0, 1, 1,
0.4471495, 0.7730383, -0.2352904, 1, 0, 0, 1, 1,
0.4471759, 0.8491114, -0.06839375, 0, 0, 0, 1, 1,
0.4479711, -0.8532594, 0.9026723, 0, 0, 0, 1, 1,
0.4484983, -1.607208, 3.193885, 0, 0, 0, 1, 1,
0.4501206, -0.4543131, 3.262775, 0, 0, 0, 1, 1,
0.451057, -0.09081607, 1.795575, 0, 0, 0, 1, 1,
0.4558342, -1.006057, 3.846327, 0, 0, 0, 1, 1,
0.4571129, -0.8916446, 2.067985, 0, 0, 0, 1, 1,
0.4663994, -0.5099012, 2.15942, 1, 1, 1, 1, 1,
0.4680926, -0.7751398, 3.367672, 1, 1, 1, 1, 1,
0.4700209, -1.430364, 1.502415, 1, 1, 1, 1, 1,
0.4702412, -0.3789271, 2.35323, 1, 1, 1, 1, 1,
0.4744463, 0.385138, 2.257816, 1, 1, 1, 1, 1,
0.4748792, -0.5154852, 3.413679, 1, 1, 1, 1, 1,
0.4756564, 3.480947, 0.2743034, 1, 1, 1, 1, 1,
0.4779514, 0.8212962, 0.741762, 1, 1, 1, 1, 1,
0.4790489, 0.6580296, 0.540943, 1, 1, 1, 1, 1,
0.4827727, 0.6650833, 1.068582, 1, 1, 1, 1, 1,
0.485062, -0.7113835, 2.974841, 1, 1, 1, 1, 1,
0.4872638, -0.5030658, 2.925374, 1, 1, 1, 1, 1,
0.4875426, 1.424936, 0.8157674, 1, 1, 1, 1, 1,
0.4908081, 0.1792269, 2.914833, 1, 1, 1, 1, 1,
0.4915017, -1.082319, 1.476475, 1, 1, 1, 1, 1,
0.4996964, 0.1316311, 1.961427, 0, 0, 1, 1, 1,
0.5004833, -0.8037022, 1.495134, 1, 0, 0, 1, 1,
0.502156, -0.1799075, 1.46735, 1, 0, 0, 1, 1,
0.5023865, 0.4410284, 2.414728, 1, 0, 0, 1, 1,
0.5025333, 0.7655054, -0.183149, 1, 0, 0, 1, 1,
0.5121805, 0.04159535, 1.617558, 1, 0, 0, 1, 1,
0.5146683, -1.028194, 2.913194, 0, 0, 0, 1, 1,
0.5162689, 1.254261, 1.537474, 0, 0, 0, 1, 1,
0.5163293, -2.233933, 2.690263, 0, 0, 0, 1, 1,
0.5169283, 0.6506531, -0.1783289, 0, 0, 0, 1, 1,
0.5183849, -0.5619923, 1.837197, 0, 0, 0, 1, 1,
0.5192411, -0.712563, 3.689206, 0, 0, 0, 1, 1,
0.5271353, -1.844414, 2.856831, 0, 0, 0, 1, 1,
0.5284647, -1.652286, 3.435001, 1, 1, 1, 1, 1,
0.5290874, 0.2484534, 0.8262109, 1, 1, 1, 1, 1,
0.5304987, -1.239825, 4.100865, 1, 1, 1, 1, 1,
0.5339867, 0.9252445, 2.430356, 1, 1, 1, 1, 1,
0.5360616, 2.046495, 1.532883, 1, 1, 1, 1, 1,
0.536647, 1.24143, 1.071335, 1, 1, 1, 1, 1,
0.5388765, 1.042599, 1.127747, 1, 1, 1, 1, 1,
0.540552, 1.895196, -0.04240476, 1, 1, 1, 1, 1,
0.5416104, -0.5176736, 3.232248, 1, 1, 1, 1, 1,
0.5454263, -1.037505, 1.015341, 1, 1, 1, 1, 1,
0.5458146, 0.3873841, 0.1001128, 1, 1, 1, 1, 1,
0.5461623, 1.185388, -0.2163751, 1, 1, 1, 1, 1,
0.5531088, 0.8690498, 0.3019729, 1, 1, 1, 1, 1,
0.555591, -0.7529137, 4.069429, 1, 1, 1, 1, 1,
0.5593805, -0.9160323, 1.329178, 1, 1, 1, 1, 1,
0.5789176, 1.64989, -0.6106637, 0, 0, 1, 1, 1,
0.5807081, -1.666862, 2.518865, 1, 0, 0, 1, 1,
0.5839102, 0.9787825, -1.063336, 1, 0, 0, 1, 1,
0.5841649, -0.5376176, 3.045117, 1, 0, 0, 1, 1,
0.5888738, 0.6600437, -0.1818785, 1, 0, 0, 1, 1,
0.5955051, 0.842051, 1.088815, 1, 0, 0, 1, 1,
0.5966319, 0.4857636, 3.604374, 0, 0, 0, 1, 1,
0.6013032, -1.697254, 2.674123, 0, 0, 0, 1, 1,
0.6016385, -0.5567676, 1.526253, 0, 0, 0, 1, 1,
0.6033196, 1.100519, 1.063647, 0, 0, 0, 1, 1,
0.603658, 0.3045068, 1.958507, 0, 0, 0, 1, 1,
0.6092634, 1.910469, -0.6231603, 0, 0, 0, 1, 1,
0.6140761, -0.5404661, 1.68719, 0, 0, 0, 1, 1,
0.6146111, 0.551948, 1.943369, 1, 1, 1, 1, 1,
0.6178499, -0.6395525, 3.252816, 1, 1, 1, 1, 1,
0.6192552, 0.4138593, 0.8236958, 1, 1, 1, 1, 1,
0.6207052, 0.9521856, -0.2213584, 1, 1, 1, 1, 1,
0.6208671, 0.3060368, 1.755801, 1, 1, 1, 1, 1,
0.6209974, -1.221467, 3.287352, 1, 1, 1, 1, 1,
0.6212092, 0.6749454, 0.463701, 1, 1, 1, 1, 1,
0.625895, -0.4140494, 1.654996, 1, 1, 1, 1, 1,
0.6276267, 0.4717533, 0.8246595, 1, 1, 1, 1, 1,
0.6297864, 1.206131, 0.5422388, 1, 1, 1, 1, 1,
0.6300409, 0.02396918, 1.440791, 1, 1, 1, 1, 1,
0.6336457, 1.963534, 0.2119961, 1, 1, 1, 1, 1,
0.6368178, 0.7546875, 2.054587, 1, 1, 1, 1, 1,
0.6386647, 0.7528258, 0.2787056, 1, 1, 1, 1, 1,
0.6416017, 0.6524926, 0.5659128, 1, 1, 1, 1, 1,
0.6437961, 0.3740942, 0.936772, 0, 0, 1, 1, 1,
0.6458096, 0.9185871, -0.5288328, 1, 0, 0, 1, 1,
0.6471103, -0.6809856, 2.90415, 1, 0, 0, 1, 1,
0.647195, -0.3177286, 1.123286, 1, 0, 0, 1, 1,
0.6548462, 0.3198194, 0.442074, 1, 0, 0, 1, 1,
0.6566393, 2.579171, -0.3091036, 1, 0, 0, 1, 1,
0.6613871, 0.05558238, 0.4996811, 0, 0, 0, 1, 1,
0.6619778, -1.147579, 2.077296, 0, 0, 0, 1, 1,
0.6652092, -0.7495561, 3.451332, 0, 0, 0, 1, 1,
0.6660743, 0.9454243, 0.08874574, 0, 0, 0, 1, 1,
0.6711065, 0.2984718, 0.9987285, 0, 0, 0, 1, 1,
0.6727902, -1.118038, 2.745992, 0, 0, 0, 1, 1,
0.6776679, 1.566746, 0.1929455, 0, 0, 0, 1, 1,
0.6846801, 1.059268, 0.3843006, 1, 1, 1, 1, 1,
0.6849452, -1.124036, 2.392289, 1, 1, 1, 1, 1,
0.6869279, 0.07565984, -0.5836095, 1, 1, 1, 1, 1,
0.6957837, 0.5510417, 2.52915, 1, 1, 1, 1, 1,
0.6984179, 0.2105156, 2.237052, 1, 1, 1, 1, 1,
0.6993651, 1.999929, 0.758843, 1, 1, 1, 1, 1,
0.6999951, -0.2848802, 0.3649626, 1, 1, 1, 1, 1,
0.7028247, -1.524402, 2.251976, 1, 1, 1, 1, 1,
0.7053521, -0.009675981, 0.8312796, 1, 1, 1, 1, 1,
0.7060523, 1.041432, -0.2698864, 1, 1, 1, 1, 1,
0.7064456, -0.3053612, 1.963844, 1, 1, 1, 1, 1,
0.7079937, -0.2553015, 1.045433, 1, 1, 1, 1, 1,
0.7080151, -1.586809, 1.395721, 1, 1, 1, 1, 1,
0.7094867, -0.6832854, 1.799546, 1, 1, 1, 1, 1,
0.7177986, 0.01460457, 1.181219, 1, 1, 1, 1, 1,
0.7191635, -0.1206752, 1.105934, 0, 0, 1, 1, 1,
0.7296712, 0.8627914, 0.069721, 1, 0, 0, 1, 1,
0.730103, 1.118026, 1.238469, 1, 0, 0, 1, 1,
0.7321674, -0.2706265, 2.327558, 1, 0, 0, 1, 1,
0.7336059, -0.2316757, 1.387225, 1, 0, 0, 1, 1,
0.7357029, 1.416966, 0.3750913, 1, 0, 0, 1, 1,
0.7441429, -1.198592, 4.673557, 0, 0, 0, 1, 1,
0.7548028, -0.1437301, 2.779039, 0, 0, 0, 1, 1,
0.757009, 1.383887, 0.8384936, 0, 0, 0, 1, 1,
0.7689049, 0.6981199, 1.170676, 0, 0, 0, 1, 1,
0.7736204, 0.5255315, 0.4466609, 0, 0, 0, 1, 1,
0.7774091, 1.469883, 1.545464, 0, 0, 0, 1, 1,
0.7844498, -0.9670864, 1.456688, 0, 0, 0, 1, 1,
0.7895463, 0.7566656, -0.6781668, 1, 1, 1, 1, 1,
0.7895646, -1.454433, 2.813182, 1, 1, 1, 1, 1,
0.7912406, -0.6695946, 3.996298, 1, 1, 1, 1, 1,
0.7951931, 0.05020183, 0.8338371, 1, 1, 1, 1, 1,
0.7975956, 0.9526539, 2.440714, 1, 1, 1, 1, 1,
0.7991574, 0.5299801, 0.8823736, 1, 1, 1, 1, 1,
0.7993031, 0.523608, 0.8889527, 1, 1, 1, 1, 1,
0.8054683, 0.04150452, 2.697851, 1, 1, 1, 1, 1,
0.8079731, -0.4156513, 1.149507, 1, 1, 1, 1, 1,
0.8122067, -1.753886, 3.011735, 1, 1, 1, 1, 1,
0.8172697, -0.5422359, 3.162367, 1, 1, 1, 1, 1,
0.8216012, -0.4905372, 2.865378, 1, 1, 1, 1, 1,
0.8221621, -0.882493, 3.960027, 1, 1, 1, 1, 1,
0.8274206, 0.1281637, 1.304613, 1, 1, 1, 1, 1,
0.8314981, -1.079411, 1.016089, 1, 1, 1, 1, 1,
0.8382951, -0.4840538, -0.07301705, 0, 0, 1, 1, 1,
0.8442549, 1.48936, 0.713786, 1, 0, 0, 1, 1,
0.84741, -1.18096, 3.130463, 1, 0, 0, 1, 1,
0.8482467, 0.2454163, 1.554838, 1, 0, 0, 1, 1,
0.8525463, 0.3253552, 1.335695, 1, 0, 0, 1, 1,
0.855787, -1.729085, 3.77027, 1, 0, 0, 1, 1,
0.8576117, 0.7569135, 0.01488529, 0, 0, 0, 1, 1,
0.8588372, -0.3399716, 1.030254, 0, 0, 0, 1, 1,
0.8604943, -0.9032084, 4.712059, 0, 0, 0, 1, 1,
0.8613121, -1.692479, 4.433644, 0, 0, 0, 1, 1,
0.8613355, -0.344831, 2.422018, 0, 0, 0, 1, 1,
0.866855, -1.654125, 2.680563, 0, 0, 0, 1, 1,
0.8736849, 0.6280717, -0.04808915, 0, 0, 0, 1, 1,
0.8833141, 0.3991593, 1.405104, 1, 1, 1, 1, 1,
0.8858773, -0.3417268, 1.588504, 1, 1, 1, 1, 1,
0.8909201, -1.457971, 2.081722, 1, 1, 1, 1, 1,
0.8925331, 1.080413, 0.6025649, 1, 1, 1, 1, 1,
0.8953398, 0.123838, 0.1197134, 1, 1, 1, 1, 1,
0.9001175, 0.3860281, 1.533677, 1, 1, 1, 1, 1,
0.9110466, -0.2261968, 1.280298, 1, 1, 1, 1, 1,
0.9114078, 0.6027206, 1.695211, 1, 1, 1, 1, 1,
0.9120733, -0.8556352, 1.476374, 1, 1, 1, 1, 1,
0.9126063, -1.432596, 2.647092, 1, 1, 1, 1, 1,
0.9143022, 0.8944869, -0.07145023, 1, 1, 1, 1, 1,
0.914399, 0.05061871, 0.5292173, 1, 1, 1, 1, 1,
0.9153149, -0.05321838, 2.717025, 1, 1, 1, 1, 1,
0.9272991, -0.2237424, 1.503831, 1, 1, 1, 1, 1,
0.9276066, 0.4863861, 2.217353, 1, 1, 1, 1, 1,
0.9294857, -0.04395373, 1.510226, 0, 0, 1, 1, 1,
0.9361827, -0.05731519, 1.161267, 1, 0, 0, 1, 1,
0.9387804, 0.9028456, 0.8692029, 1, 0, 0, 1, 1,
0.9393641, 1.941955, 1.222759, 1, 0, 0, 1, 1,
0.9437144, -1.381133, -0.05647104, 1, 0, 0, 1, 1,
0.9541013, 0.3757823, 2.562642, 1, 0, 0, 1, 1,
0.9724727, 0.119654, 1.374902, 0, 0, 0, 1, 1,
0.9844609, 0.8070217, 3.835032, 0, 0, 0, 1, 1,
0.9872158, 0.131655, 0.8531815, 0, 0, 0, 1, 1,
0.9884141, 0.09886508, -0.4269409, 0, 0, 0, 1, 1,
0.994738, -0.6690177, 1.582824, 0, 0, 0, 1, 1,
0.9966354, -0.4565893, 3.363791, 0, 0, 0, 1, 1,
0.9976848, 0.5424503, 0.7348909, 0, 0, 0, 1, 1,
1.001784, 0.4373862, 0.02850202, 1, 1, 1, 1, 1,
1.004341, -0.7338475, 3.251079, 1, 1, 1, 1, 1,
1.00707, 0.2075154, 0.5387564, 1, 1, 1, 1, 1,
1.009884, -0.5310445, 1.699418, 1, 1, 1, 1, 1,
1.014719, -0.9247879, 3.762363, 1, 1, 1, 1, 1,
1.022509, -0.6855355, 2.795557, 1, 1, 1, 1, 1,
1.026271, -0.5067135, 2.32072, 1, 1, 1, 1, 1,
1.029291, -0.8440431, 2.539139, 1, 1, 1, 1, 1,
1.032821, -1.406351, 1.772309, 1, 1, 1, 1, 1,
1.035877, -1.120486, 3.327477, 1, 1, 1, 1, 1,
1.045252, -0.7650721, 1.595608, 1, 1, 1, 1, 1,
1.045847, 0.6001591, 2.075547, 1, 1, 1, 1, 1,
1.048885, -1.00024, 1.572817, 1, 1, 1, 1, 1,
1.051569, 1.443729, 0.1848752, 1, 1, 1, 1, 1,
1.079659, -0.2977217, 1.733452, 1, 1, 1, 1, 1,
1.082596, -0.7386333, 2.804609, 0, 0, 1, 1, 1,
1.089463, 2.295234, -1.543465, 1, 0, 0, 1, 1,
1.091055, 0.4372434, 0.6228624, 1, 0, 0, 1, 1,
1.09373, 0.7019929, 0.2102871, 1, 0, 0, 1, 1,
1.09579, 2.612945, -0.706248, 1, 0, 0, 1, 1,
1.098649, -1.839691, 2.984028, 1, 0, 0, 1, 1,
1.104782, -1.391314, 0.8609031, 0, 0, 0, 1, 1,
1.116331, -0.4226607, 1.025838, 0, 0, 0, 1, 1,
1.116768, 1.302979, 2.883117, 0, 0, 0, 1, 1,
1.13204, -0.3395195, 3.218768, 0, 0, 0, 1, 1,
1.1325, -0.2367918, 2.905678, 0, 0, 0, 1, 1,
1.138203, 0.1787184, 0.6326392, 0, 0, 0, 1, 1,
1.148416, -0.01837088, 2.049167, 0, 0, 0, 1, 1,
1.152257, -0.1099046, 1.477199, 1, 1, 1, 1, 1,
1.155799, 0.07560436, 2.136524, 1, 1, 1, 1, 1,
1.160268, -0.9168973, 2.006825, 1, 1, 1, 1, 1,
1.162821, 0.3567584, 1.314283, 1, 1, 1, 1, 1,
1.174939, 1.793487, -0.4099151, 1, 1, 1, 1, 1,
1.176052, -0.2963204, 2.575527, 1, 1, 1, 1, 1,
1.182362, -0.1748887, 2.063326, 1, 1, 1, 1, 1,
1.187202, 0.3540577, 2.96636, 1, 1, 1, 1, 1,
1.189404, 1.077804, -1.045133, 1, 1, 1, 1, 1,
1.191596, -1.096137, 1.379057, 1, 1, 1, 1, 1,
1.192467, -1.185348, 1.615396, 1, 1, 1, 1, 1,
1.198923, 0.1351079, 2.03674, 1, 1, 1, 1, 1,
1.200624, 1.421975, -0.09000676, 1, 1, 1, 1, 1,
1.202265, -1.793805, 3.528782, 1, 1, 1, 1, 1,
1.202497, 0.9099728, 1.365839, 1, 1, 1, 1, 1,
1.214503, -0.4490539, 2.769348, 0, 0, 1, 1, 1,
1.235492, 0.2002156, 1.746691, 1, 0, 0, 1, 1,
1.240286, 1.551955, 0.1715509, 1, 0, 0, 1, 1,
1.251556, 0.08113714, 0.337184, 1, 0, 0, 1, 1,
1.260929, 0.2269619, 0.3573902, 1, 0, 0, 1, 1,
1.263749, -0.01871629, 2.227879, 1, 0, 0, 1, 1,
1.275198, 0.7302029, 1.416018, 0, 0, 0, 1, 1,
1.280994, -0.7746048, 2.53907, 0, 0, 0, 1, 1,
1.294564, -0.7614825, 3.753253, 0, 0, 0, 1, 1,
1.29613, 0.796407, 1.551638, 0, 0, 0, 1, 1,
1.297268, -0.3885753, 3.007654, 0, 0, 0, 1, 1,
1.297976, -0.3325342, 0.2896902, 0, 0, 0, 1, 1,
1.317483, -0.2691415, 1.66527, 0, 0, 0, 1, 1,
1.318943, 1.936895, 2.548395, 1, 1, 1, 1, 1,
1.323379, 3.221338, 2.503378, 1, 1, 1, 1, 1,
1.327638, 0.6857386, 4.311859, 1, 1, 1, 1, 1,
1.329517, -1.092241, 2.117864, 1, 1, 1, 1, 1,
1.332467, -0.09774808, -0.3546464, 1, 1, 1, 1, 1,
1.344888, -1.291448, 3.40447, 1, 1, 1, 1, 1,
1.35741, 0.6119095, -1.499936, 1, 1, 1, 1, 1,
1.363959, -1.266491, 1.784791, 1, 1, 1, 1, 1,
1.366281, -1.391413, 1.552079, 1, 1, 1, 1, 1,
1.368783, -0.8458821, 2.680513, 1, 1, 1, 1, 1,
1.383129, -0.2408147, 1.056104, 1, 1, 1, 1, 1,
1.38612, -0.8689148, 0.5945976, 1, 1, 1, 1, 1,
1.411627, 0.6988026, 1.856025, 1, 1, 1, 1, 1,
1.416451, 1.336926, 0.2690168, 1, 1, 1, 1, 1,
1.429228, -1.319422, 1.167949, 1, 1, 1, 1, 1,
1.434891, 0.5766448, 0.6345507, 0, 0, 1, 1, 1,
1.438121, 3.00233, 0.4200755, 1, 0, 0, 1, 1,
1.443517, -0.782669, 2.600472, 1, 0, 0, 1, 1,
1.459656, 0.7623643, -0.5496841, 1, 0, 0, 1, 1,
1.466733, 0.611459, 1.984782, 1, 0, 0, 1, 1,
1.477129, -0.2433084, 1.366312, 1, 0, 0, 1, 1,
1.481513, 0.3652225, 2.405432, 0, 0, 0, 1, 1,
1.486835, 1.251118, -0.2164529, 0, 0, 0, 1, 1,
1.510246, -0.3441716, 0.661967, 0, 0, 0, 1, 1,
1.517006, 0.367843, 1.75489, 0, 0, 0, 1, 1,
1.517404, 0.2605945, 2.77986, 0, 0, 0, 1, 1,
1.523047, 1.408173, -0.6750748, 0, 0, 0, 1, 1,
1.523564, -1.028547, 2.752612, 0, 0, 0, 1, 1,
1.527798, -0.6008416, 0.2443438, 1, 1, 1, 1, 1,
1.529598, 0.2576803, 1.742616, 1, 1, 1, 1, 1,
1.536988, 0.6219076, 0.4412986, 1, 1, 1, 1, 1,
1.559372, 0.1655192, 1.628674, 1, 1, 1, 1, 1,
1.576771, -0.4123925, 1.687531, 1, 1, 1, 1, 1,
1.578743, -0.5301725, 5.453681, 1, 1, 1, 1, 1,
1.591195, 1.036316, 2.239671, 1, 1, 1, 1, 1,
1.613529, 1.307622, 2.915818, 1, 1, 1, 1, 1,
1.629029, -0.4972036, 2.614084, 1, 1, 1, 1, 1,
1.632607, -0.4536743, 2.922982, 1, 1, 1, 1, 1,
1.641256, -1.430931, 2.441137, 1, 1, 1, 1, 1,
1.643807, 0.2976376, 0.7455814, 1, 1, 1, 1, 1,
1.650858, -0.488735, 1.067447, 1, 1, 1, 1, 1,
1.653992, 0.1087084, 0.9195981, 1, 1, 1, 1, 1,
1.656873, -0.6121727, 2.818501, 1, 1, 1, 1, 1,
1.657205, 0.06011832, 2.63629, 0, 0, 1, 1, 1,
1.67287, -1.306152, 1.441393, 1, 0, 0, 1, 1,
1.674831, -0.8070973, 2.359312, 1, 0, 0, 1, 1,
1.681255, 1.153849, 2.711851, 1, 0, 0, 1, 1,
1.688975, 0.09536406, 1.13053, 1, 0, 0, 1, 1,
1.692809, -2.147816, 3.980888, 1, 0, 0, 1, 1,
1.695068, 1.361643, -1.235721, 0, 0, 0, 1, 1,
1.697222, -0.1680829, 0.9169329, 0, 0, 0, 1, 1,
1.699415, -2.228827, 1.288114, 0, 0, 0, 1, 1,
1.702924, 0.5652904, 1.654677, 0, 0, 0, 1, 1,
1.735653, -0.2970476, 0.9336762, 0, 0, 0, 1, 1,
1.740444, -0.05306568, 2.495764, 0, 0, 0, 1, 1,
1.742444, -0.08459235, 1.176921, 0, 0, 0, 1, 1,
1.748914, 0.5389921, 1.920219, 1, 1, 1, 1, 1,
1.759898, -2.866828, 1.882422, 1, 1, 1, 1, 1,
1.764987, -0.7668941, 2.267123, 1, 1, 1, 1, 1,
1.766283, 0.04272992, 1.622842, 1, 1, 1, 1, 1,
1.774527, 1.111904, -1.369276, 1, 1, 1, 1, 1,
1.798807, -0.4683259, 1.221081, 1, 1, 1, 1, 1,
1.804438, 1.018459, 0.7039015, 1, 1, 1, 1, 1,
1.827642, -0.1251472, 0.949542, 1, 1, 1, 1, 1,
1.831498, -1.467934, 1.869021, 1, 1, 1, 1, 1,
1.831869, 0.01234383, 1.924965, 1, 1, 1, 1, 1,
1.83662, 2.496301, 0.2147397, 1, 1, 1, 1, 1,
1.845513, -1.020447, 2.297665, 1, 1, 1, 1, 1,
1.867231, -0.5322322, 0.9457784, 1, 1, 1, 1, 1,
1.873914, -0.9270777, 0.8280003, 1, 1, 1, 1, 1,
1.893578, 0.9939395, -0.4525204, 1, 1, 1, 1, 1,
1.924356, -1.13556, 2.719002, 0, 0, 1, 1, 1,
1.927045, 0.5862936, -0.155771, 1, 0, 0, 1, 1,
1.930738, -0.5741699, -1.889871, 1, 0, 0, 1, 1,
1.932587, 0.2839919, 1.840615, 1, 0, 0, 1, 1,
1.937508, 1.472104, 1.758469, 1, 0, 0, 1, 1,
1.977839, -0.268166, 1.257352, 1, 0, 0, 1, 1,
1.983598, -1.136408, 2.577351, 0, 0, 0, 1, 1,
1.98616, -1.29583, 2.425139, 0, 0, 0, 1, 1,
2.025456, 0.2683387, 1.457075, 0, 0, 0, 1, 1,
2.029298, 0.02227829, 2.075126, 0, 0, 0, 1, 1,
2.055938, 1.143565, 1.47605, 0, 0, 0, 1, 1,
2.100352, -0.1197438, 3.89601, 0, 0, 0, 1, 1,
2.112983, -0.6231409, 1.107797, 0, 0, 0, 1, 1,
2.113379, 0.229779, 0.6667207, 1, 1, 1, 1, 1,
2.162662, -0.2131744, 3.505243, 1, 1, 1, 1, 1,
2.270489, -0.644268, 1.569402, 1, 1, 1, 1, 1,
2.313117, 0.5444162, 3.082558, 1, 1, 1, 1, 1,
2.327243, -0.423161, 1.490386, 1, 1, 1, 1, 1,
2.935246, 0.02172726, 1.288101, 1, 1, 1, 1, 1,
2.980134, -0.2504864, -1.446069, 1, 1, 1, 1, 1
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
var radius = 9.622263;
var distance = 33.79779;
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
mvMatrix.translate( 0.1370951, -0.01730776, -0.1573877 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.79779);
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