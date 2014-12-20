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
-3.703692, -0.544728, -0.7821149, 1, 0, 0, 1,
-3.266716, -0.8478858, -1.957706, 1, 0.007843138, 0, 1,
-2.84152, 0.4517892, -1.286687, 1, 0.01176471, 0, 1,
-2.768514, 0.1812258, -1.993092, 1, 0.01960784, 0, 1,
-2.76696, 0.4135188, -3.300548, 1, 0.02352941, 0, 1,
-2.478478, 0.3527435, -2.329087, 1, 0.03137255, 0, 1,
-2.397095, -2.526477, -2.929895, 1, 0.03529412, 0, 1,
-2.335265, -0.8225175, -1.863765, 1, 0.04313726, 0, 1,
-2.222132, -1.116984, -0.4567095, 1, 0.04705882, 0, 1,
-2.22071, -0.03099308, -0.4766315, 1, 0.05490196, 0, 1,
-2.220273, 0.579714, -3.814046, 1, 0.05882353, 0, 1,
-2.161092, 0.4038641, 0.1147133, 1, 0.06666667, 0, 1,
-2.126208, 0.7647406, -1.304032, 1, 0.07058824, 0, 1,
-2.076206, -0.4682776, -2.302406, 1, 0.07843138, 0, 1,
-2.028768, -1.510722, -2.405928, 1, 0.08235294, 0, 1,
-1.960442, 0.2234869, -1.88122, 1, 0.09019608, 0, 1,
-1.94105, -0.3738392, -1.711158, 1, 0.09411765, 0, 1,
-1.937424, -0.3401701, -1.814696, 1, 0.1019608, 0, 1,
-1.937308, -0.8955307, -1.312683, 1, 0.1098039, 0, 1,
-1.935722, -2.156824, -2.374066, 1, 0.1137255, 0, 1,
-1.912941, -0.7090725, -1.547426, 1, 0.1215686, 0, 1,
-1.909761, -1.082904, -2.301525, 1, 0.1254902, 0, 1,
-1.90347, 0.4067391, -2.513002, 1, 0.1333333, 0, 1,
-1.879142, 0.9705942, 0.2047424, 1, 0.1372549, 0, 1,
-1.876648, 0.7861391, -0.7165571, 1, 0.145098, 0, 1,
-1.843501, -1.966785, -2.61411, 1, 0.1490196, 0, 1,
-1.842281, -0.6745213, -1.852469, 1, 0.1568628, 0, 1,
-1.804567, -0.2871406, -0.6857713, 1, 0.1607843, 0, 1,
-1.800181, -1.345364, -3.681787, 1, 0.1686275, 0, 1,
-1.792022, 0.4541539, -1.492473, 1, 0.172549, 0, 1,
-1.789593, -1.136453, -2.4415, 1, 0.1803922, 0, 1,
-1.781347, 0.8939478, -1.775639, 1, 0.1843137, 0, 1,
-1.764041, -0.5374013, -1.500726, 1, 0.1921569, 0, 1,
-1.75773, 0.6008785, -2.441437, 1, 0.1960784, 0, 1,
-1.720473, 1.411691, 0.02209277, 1, 0.2039216, 0, 1,
-1.71922, -0.0688649, -1.244785, 1, 0.2117647, 0, 1,
-1.713867, -2.082037, -1.543473, 1, 0.2156863, 0, 1,
-1.693927, -1.279182, -1.116707, 1, 0.2235294, 0, 1,
-1.669145, 0.5313542, -2.408549, 1, 0.227451, 0, 1,
-1.661165, 0.6207781, -1.10378, 1, 0.2352941, 0, 1,
-1.655681, 0.240753, 0.7735124, 1, 0.2392157, 0, 1,
-1.620673, 2.168238, -1.832029, 1, 0.2470588, 0, 1,
-1.619662, -0.3647901, -3.089721, 1, 0.2509804, 0, 1,
-1.617104, 0.4993419, -0.4624009, 1, 0.2588235, 0, 1,
-1.597792, 2.480672, -0.7788985, 1, 0.2627451, 0, 1,
-1.589716, -0.3471586, -2.698379, 1, 0.2705882, 0, 1,
-1.560339, -0.7579172, -2.286342, 1, 0.2745098, 0, 1,
-1.556089, 0.7496713, -2.587397, 1, 0.282353, 0, 1,
-1.555094, -1.530479, -2.973996, 1, 0.2862745, 0, 1,
-1.542839, 1.639306, -1.891886, 1, 0.2941177, 0, 1,
-1.535866, 1.150405, -0.009243637, 1, 0.3019608, 0, 1,
-1.521909, 0.8799984, -2.336924, 1, 0.3058824, 0, 1,
-1.517081, 0.9261855, -0.002462742, 1, 0.3137255, 0, 1,
-1.50512, -0.1053185, -2.133095, 1, 0.3176471, 0, 1,
-1.496117, -0.6566738, -1.370543, 1, 0.3254902, 0, 1,
-1.491277, 0.689797, -1.478494, 1, 0.3294118, 0, 1,
-1.491263, -0.4308051, -0.7284607, 1, 0.3372549, 0, 1,
-1.485292, -0.1523828, -1.466466, 1, 0.3411765, 0, 1,
-1.474044, -0.3493544, -2.098433, 1, 0.3490196, 0, 1,
-1.473918, 0.6843105, -0.2072191, 1, 0.3529412, 0, 1,
-1.46961, 2.240439, -1.873198, 1, 0.3607843, 0, 1,
-1.465926, 0.7476562, 0.5824392, 1, 0.3647059, 0, 1,
-1.457358, 0.3885987, -2.475374, 1, 0.372549, 0, 1,
-1.453139, 0.6579427, -0.8254844, 1, 0.3764706, 0, 1,
-1.452269, -0.07793687, -1.310364, 1, 0.3843137, 0, 1,
-1.450076, -1.922627, -2.337857, 1, 0.3882353, 0, 1,
-1.443103, -0.03406266, -2.425477, 1, 0.3960784, 0, 1,
-1.428884, -1.119224, -0.5088214, 1, 0.4039216, 0, 1,
-1.423701, -0.3270361, -2.262908, 1, 0.4078431, 0, 1,
-1.423613, 0.410464, -1.538595, 1, 0.4156863, 0, 1,
-1.414366, -1.17471, -3.561933, 1, 0.4196078, 0, 1,
-1.412821, 1.08373, -1.060581, 1, 0.427451, 0, 1,
-1.410919, -0.03152361, -0.9167239, 1, 0.4313726, 0, 1,
-1.409869, -0.2872313, -1.228736, 1, 0.4392157, 0, 1,
-1.404246, 0.8058503, -3.583919, 1, 0.4431373, 0, 1,
-1.395948, 0.3774878, -1.548602, 1, 0.4509804, 0, 1,
-1.387074, -0.7138897, -1.535181, 1, 0.454902, 0, 1,
-1.384274, 0.03111757, -0.2761025, 1, 0.4627451, 0, 1,
-1.3827, -0.3500796, -2.200781, 1, 0.4666667, 0, 1,
-1.381595, -0.3637959, -2.163345, 1, 0.4745098, 0, 1,
-1.376454, 0.8866194, -0.9214386, 1, 0.4784314, 0, 1,
-1.376195, -1.494877, 0.1970686, 1, 0.4862745, 0, 1,
-1.362859, 0.7267683, -0.6954116, 1, 0.4901961, 0, 1,
-1.362318, -1.375612, -3.155505, 1, 0.4980392, 0, 1,
-1.360296, 1.263299, -1.229809, 1, 0.5058824, 0, 1,
-1.341534, 1.050147, 0.6937222, 1, 0.509804, 0, 1,
-1.326164, 1.532616, -0.05223911, 1, 0.5176471, 0, 1,
-1.312658, 0.577177, -1.878468, 1, 0.5215687, 0, 1,
-1.311595, -0.3161359, -1.726555, 1, 0.5294118, 0, 1,
-1.300748, -1.035048, -2.132215, 1, 0.5333334, 0, 1,
-1.295019, -0.1217197, -1.228396, 1, 0.5411765, 0, 1,
-1.289027, -0.04504994, -3.311644, 1, 0.5450981, 0, 1,
-1.288483, -1.157668, -0.6646057, 1, 0.5529412, 0, 1,
-1.277268, -0.7381529, -2.651497, 1, 0.5568628, 0, 1,
-1.272602, 0.1727774, -0.856271, 1, 0.5647059, 0, 1,
-1.268133, -0.7067017, -3.083196, 1, 0.5686275, 0, 1,
-1.267315, -1.723545, -1.092085, 1, 0.5764706, 0, 1,
-1.266708, -1.917999, -3.40531, 1, 0.5803922, 0, 1,
-1.259431, -1.937092, -2.386937, 1, 0.5882353, 0, 1,
-1.251909, 0.5540628, -2.16577, 1, 0.5921569, 0, 1,
-1.249773, -0.4102918, -2.155753, 1, 0.6, 0, 1,
-1.245099, -1.226129, -2.987269, 1, 0.6078432, 0, 1,
-1.239321, -0.2151098, -4.027336, 1, 0.6117647, 0, 1,
-1.239236, -1.16655, -2.044501, 1, 0.6196079, 0, 1,
-1.237907, 0.2644728, -2.559165, 1, 0.6235294, 0, 1,
-1.234476, 0.0560314, -2.380991, 1, 0.6313726, 0, 1,
-1.232104, -0.3976301, 0.1287311, 1, 0.6352941, 0, 1,
-1.225977, -0.9110462, -1.821168, 1, 0.6431373, 0, 1,
-1.221133, -0.6588582, -4.244818, 1, 0.6470588, 0, 1,
-1.212557, 1.10244, -0.9675925, 1, 0.654902, 0, 1,
-1.210824, 0.3652161, -1.557388, 1, 0.6588235, 0, 1,
-1.210812, 0.9448875, -0.3016515, 1, 0.6666667, 0, 1,
-1.209636, -0.1654412, -2.502322, 1, 0.6705883, 0, 1,
-1.209345, -0.4374106, -2.478589, 1, 0.6784314, 0, 1,
-1.205598, 0.1754975, -2.492548, 1, 0.682353, 0, 1,
-1.203927, -0.6367895, -2.445872, 1, 0.6901961, 0, 1,
-1.202479, -0.08288395, -2.283286, 1, 0.6941177, 0, 1,
-1.201037, -1.636991, -2.846494, 1, 0.7019608, 0, 1,
-1.20062, -1.095118, -3.30623, 1, 0.7098039, 0, 1,
-1.190745, 1.355789, -1.069213, 1, 0.7137255, 0, 1,
-1.179985, 0.0903028, 0.1111056, 1, 0.7215686, 0, 1,
-1.175397, 1.063099, -0.08840325, 1, 0.7254902, 0, 1,
-1.174362, 1.148179, -1.730668, 1, 0.7333333, 0, 1,
-1.173834, -1.139337, -1.944422, 1, 0.7372549, 0, 1,
-1.16753, -0.4466301, -2.630136, 1, 0.7450981, 0, 1,
-1.166681, 0.7643083, -1.819723, 1, 0.7490196, 0, 1,
-1.163488, 0.9699218, -1.771387, 1, 0.7568628, 0, 1,
-1.162673, 0.04699696, -0.6839834, 1, 0.7607843, 0, 1,
-1.160016, -0.4238088, -3.940964, 1, 0.7686275, 0, 1,
-1.157355, -1.265587, -0.961722, 1, 0.772549, 0, 1,
-1.155996, 0.5002002, -2.435205, 1, 0.7803922, 0, 1,
-1.155393, 1.121892, -0.3388276, 1, 0.7843137, 0, 1,
-1.154167, -0.1341806, -2.011339, 1, 0.7921569, 0, 1,
-1.153148, -0.1522812, -2.136057, 1, 0.7960784, 0, 1,
-1.152087, -0.6235895, -1.742082, 1, 0.8039216, 0, 1,
-1.147632, 1.300706, 0.8531073, 1, 0.8117647, 0, 1,
-1.147143, 0.6113489, 0.2012278, 1, 0.8156863, 0, 1,
-1.139344, -0.2011915, -1.139286, 1, 0.8235294, 0, 1,
-1.139266, -1.488827, -3.400205, 1, 0.827451, 0, 1,
-1.133533, -1.180493, -3.151674, 1, 0.8352941, 0, 1,
-1.12614, -0.3846988, -1.719633, 1, 0.8392157, 0, 1,
-1.125322, 1.022375, -1.720752, 1, 0.8470588, 0, 1,
-1.123509, 0.04794212, -0.6144719, 1, 0.8509804, 0, 1,
-1.12171, 0.5538886, 0.8680801, 1, 0.8588235, 0, 1,
-1.116208, -1.094735, -0.6394622, 1, 0.8627451, 0, 1,
-1.114122, 0.6969746, -0.7306665, 1, 0.8705882, 0, 1,
-1.107805, 1.969031, -1.498433, 1, 0.8745098, 0, 1,
-1.105671, -1.987715, -2.288769, 1, 0.8823529, 0, 1,
-1.099071, -0.8008165, -3.792261, 1, 0.8862745, 0, 1,
-1.09401, -0.004473088, -0.5520625, 1, 0.8941177, 0, 1,
-1.093432, 0.7621897, -1.907731, 1, 0.8980392, 0, 1,
-1.084195, 0.2923419, -2.001126, 1, 0.9058824, 0, 1,
-1.075861, -0.9481488, -1.916942, 1, 0.9137255, 0, 1,
-1.068734, 1.517919, 0.4520111, 1, 0.9176471, 0, 1,
-1.061299, -1.418059, -2.487645, 1, 0.9254902, 0, 1,
-1.048143, 0.5239857, -3.812572, 1, 0.9294118, 0, 1,
-1.046643, -1.069266, -2.592451, 1, 0.9372549, 0, 1,
-1.044573, 0.6417952, -1.432516, 1, 0.9411765, 0, 1,
-1.043214, 0.09895184, -0.1624893, 1, 0.9490196, 0, 1,
-1.042846, 1.996078, -0.3511962, 1, 0.9529412, 0, 1,
-1.042578, 0.8794978, 0.7525273, 1, 0.9607843, 0, 1,
-1.037109, -1.081818, -3.402649, 1, 0.9647059, 0, 1,
-1.035996, -1.490062, -2.06653, 1, 0.972549, 0, 1,
-1.033662, 0.3566881, -1.082629, 1, 0.9764706, 0, 1,
-1.032251, 0.06766663, -1.787298, 1, 0.9843137, 0, 1,
-1.029104, 0.471466, -2.290355, 1, 0.9882353, 0, 1,
-1.028006, -0.4701142, -3.149231, 1, 0.9960784, 0, 1,
-1.024394, -0.19947, -1.958379, 0.9960784, 1, 0, 1,
-1.023502, -0.06110739, 0.2340578, 0.9921569, 1, 0, 1,
-1.01983, -0.7971932, -3.935287, 0.9843137, 1, 0, 1,
-1.010948, -0.2322991, -1.077591, 0.9803922, 1, 0, 1,
-1.008125, -1.065461, -0.9081743, 0.972549, 1, 0, 1,
-0.9997792, 0.4289891, -2.184668, 0.9686275, 1, 0, 1,
-0.9924709, -0.5161186, -1.347616, 0.9607843, 1, 0, 1,
-0.9910709, 0.5875702, -0.6239395, 0.9568627, 1, 0, 1,
-0.9900345, 0.9763407, -2.6596, 0.9490196, 1, 0, 1,
-0.9883862, -1.015762, -1.411275, 0.945098, 1, 0, 1,
-0.9828003, -0.6583039, 0.1186477, 0.9372549, 1, 0, 1,
-0.9795178, -0.6386716, -1.338328, 0.9333333, 1, 0, 1,
-0.9730046, 0.4993482, -0.3794737, 0.9254902, 1, 0, 1,
-0.9668316, -0.443568, -2.019556, 0.9215686, 1, 0, 1,
-0.9664782, -1.265127, -2.520029, 0.9137255, 1, 0, 1,
-0.9608153, -0.1777288, -1.629983, 0.9098039, 1, 0, 1,
-0.958775, 1.357852, -0.4298938, 0.9019608, 1, 0, 1,
-0.958727, 0.2754978, -1.080993, 0.8941177, 1, 0, 1,
-0.957567, -0.3370097, -1.513292, 0.8901961, 1, 0, 1,
-0.9566275, 0.6846722, -1.039085, 0.8823529, 1, 0, 1,
-0.9521945, -1.041245, -1.772263, 0.8784314, 1, 0, 1,
-0.9514741, 0.03109974, -1.485132, 0.8705882, 1, 0, 1,
-0.940414, 0.6409526, -1.157215, 0.8666667, 1, 0, 1,
-0.9400246, 0.7628704, -1.006296, 0.8588235, 1, 0, 1,
-0.937089, -0.4082309, -2.616868, 0.854902, 1, 0, 1,
-0.9339069, -0.2632282, -1.00755, 0.8470588, 1, 0, 1,
-0.9263111, 0.1229826, -1.201178, 0.8431373, 1, 0, 1,
-0.9211019, -1.162703, -1.283581, 0.8352941, 1, 0, 1,
-0.9167038, 1.461463, 0.6587533, 0.8313726, 1, 0, 1,
-0.9162714, 1.121827, -0.776782, 0.8235294, 1, 0, 1,
-0.9117122, 0.6129779, -1.224301, 0.8196079, 1, 0, 1,
-0.907876, -0.5403693, -1.521707, 0.8117647, 1, 0, 1,
-0.9036793, -0.5888611, -2.57918, 0.8078431, 1, 0, 1,
-0.8983824, 1.043918, 0.3581184, 0.8, 1, 0, 1,
-0.8961968, 0.5997397, -0.4959614, 0.7921569, 1, 0, 1,
-0.89615, 0.6190755, -1.527442, 0.7882353, 1, 0, 1,
-0.8955586, 0.2855825, -1.350297, 0.7803922, 1, 0, 1,
-0.8862807, 0.03798601, -1.055088, 0.7764706, 1, 0, 1,
-0.8834811, -0.6527907, -2.632874, 0.7686275, 1, 0, 1,
-0.8743898, -0.7280879, -3.848566, 0.7647059, 1, 0, 1,
-0.8628446, 0.1781789, -1.641907, 0.7568628, 1, 0, 1,
-0.8602101, -0.4380566, -3.060266, 0.7529412, 1, 0, 1,
-0.858981, 1.15783, -1.235977, 0.7450981, 1, 0, 1,
-0.8465986, -0.2948008, -2.973869, 0.7411765, 1, 0, 1,
-0.8460598, 1.425128, -2.398849, 0.7333333, 1, 0, 1,
-0.843666, -1.285282, -4.061606, 0.7294118, 1, 0, 1,
-0.8428007, -0.4741632, -0.9763815, 0.7215686, 1, 0, 1,
-0.8322046, -0.8679256, -3.221584, 0.7176471, 1, 0, 1,
-0.8291262, 0.4580587, -0.09582648, 0.7098039, 1, 0, 1,
-0.8200401, 0.2424758, -2.032435, 0.7058824, 1, 0, 1,
-0.8182145, 1.041991, -0.7725909, 0.6980392, 1, 0, 1,
-0.8074377, -0.008250928, -0.7183105, 0.6901961, 1, 0, 1,
-0.8053493, 0.5415575, -2.276826, 0.6862745, 1, 0, 1,
-0.8050273, -0.7343467, -3.409084, 0.6784314, 1, 0, 1,
-0.804777, -0.3339735, -2.861548, 0.6745098, 1, 0, 1,
-0.8045532, 0.6952103, -0.5058265, 0.6666667, 1, 0, 1,
-0.8009463, 0.224352, -1.9698, 0.6627451, 1, 0, 1,
-0.7959591, 0.08570576, -1.646276, 0.654902, 1, 0, 1,
-0.7930872, -0.3401978, -0.4072247, 0.6509804, 1, 0, 1,
-0.7930569, 1.108684, 1.211725, 0.6431373, 1, 0, 1,
-0.7924178, -2.319444, -1.026731, 0.6392157, 1, 0, 1,
-0.7893038, 0.5101517, -0.6534038, 0.6313726, 1, 0, 1,
-0.785153, -2.025094, -5.160419, 0.627451, 1, 0, 1,
-0.7688945, -1.314668, -4.159821, 0.6196079, 1, 0, 1,
-0.7669884, 1.278904, -1.027678, 0.6156863, 1, 0, 1,
-0.7641317, -0.7644162, -2.695589, 0.6078432, 1, 0, 1,
-0.7635391, 1.109443, -0.9942823, 0.6039216, 1, 0, 1,
-0.7609712, -0.477093, -3.115309, 0.5960785, 1, 0, 1,
-0.758638, 0.01692721, -1.950351, 0.5882353, 1, 0, 1,
-0.7551343, -0.768974, -2.989418, 0.5843138, 1, 0, 1,
-0.7544953, -1.547312, -2.7354, 0.5764706, 1, 0, 1,
-0.7541341, -1.85848, -3.21783, 0.572549, 1, 0, 1,
-0.7466353, -0.2934286, -3.090042, 0.5647059, 1, 0, 1,
-0.7447818, 0.9157715, -1.959673, 0.5607843, 1, 0, 1,
-0.73715, -0.188914, -0.1051264, 0.5529412, 1, 0, 1,
-0.73671, 0.8478398, 0.2175376, 0.5490196, 1, 0, 1,
-0.7347263, 0.7845843, -0.04179141, 0.5411765, 1, 0, 1,
-0.7276499, 1.659588, -3.070328, 0.5372549, 1, 0, 1,
-0.7260816, 1.380531, -0.5319849, 0.5294118, 1, 0, 1,
-0.7260476, 0.06106924, -1.368313, 0.5254902, 1, 0, 1,
-0.723042, 0.7919376, -1.284819, 0.5176471, 1, 0, 1,
-0.7182093, 2.671374, -1.191014, 0.5137255, 1, 0, 1,
-0.7181443, 1.305751, -0.1659307, 0.5058824, 1, 0, 1,
-0.7180139, -0.2302317, -2.74473, 0.5019608, 1, 0, 1,
-0.7147856, 0.9578293, -2.202349, 0.4941176, 1, 0, 1,
-0.6970895, 0.4353519, -2.20832, 0.4862745, 1, 0, 1,
-0.6961303, -1.441231, -2.387687, 0.4823529, 1, 0, 1,
-0.6745739, 0.1291505, -1.487463, 0.4745098, 1, 0, 1,
-0.6733056, 0.1009501, -2.487182, 0.4705882, 1, 0, 1,
-0.6711964, -1.730497, -2.042214, 0.4627451, 1, 0, 1,
-0.6681896, -0.5754257, -2.225566, 0.4588235, 1, 0, 1,
-0.665064, 0.8863882, 0.6516122, 0.4509804, 1, 0, 1,
-0.6619585, 0.8275764, -1.793501, 0.4470588, 1, 0, 1,
-0.652236, -0.7661505, -3.415469, 0.4392157, 1, 0, 1,
-0.6512342, -0.9287602, -2.695337, 0.4352941, 1, 0, 1,
-0.6465957, 1.574974, -2.117531, 0.427451, 1, 0, 1,
-0.6463483, -1.113996, -2.438282, 0.4235294, 1, 0, 1,
-0.6452796, 0.02632179, -2.071265, 0.4156863, 1, 0, 1,
-0.6409102, 0.03719434, -1.744311, 0.4117647, 1, 0, 1,
-0.6317354, -0.04809958, -1.682416, 0.4039216, 1, 0, 1,
-0.630622, 0.7116684, 0.1064989, 0.3960784, 1, 0, 1,
-0.6228832, -0.1879373, 0.6823841, 0.3921569, 1, 0, 1,
-0.6114126, 0.5817546, -0.9328904, 0.3843137, 1, 0, 1,
-0.6107175, 1.258146, -1.112003, 0.3803922, 1, 0, 1,
-0.6099154, 1.211015, 0.6384374, 0.372549, 1, 0, 1,
-0.6064298, 0.8108379, -0.79311, 0.3686275, 1, 0, 1,
-0.6016675, -0.6542422, -1.846681, 0.3607843, 1, 0, 1,
-0.6009291, 1.264613, -0.904768, 0.3568628, 1, 0, 1,
-0.5972688, -0.6025246, -2.306276, 0.3490196, 1, 0, 1,
-0.5951234, 0.823616, -0.3826688, 0.345098, 1, 0, 1,
-0.5882092, 0.9404735, -1.325133, 0.3372549, 1, 0, 1,
-0.58808, -1.119787, -2.768381, 0.3333333, 1, 0, 1,
-0.5861434, 2.108698, 0.3036003, 0.3254902, 1, 0, 1,
-0.5840361, -0.4629456, -1.540557, 0.3215686, 1, 0, 1,
-0.5784277, 1.078431, 1.683083, 0.3137255, 1, 0, 1,
-0.5777439, 0.5672675, -1.618556, 0.3098039, 1, 0, 1,
-0.5762402, 0.7489195, -1.464015, 0.3019608, 1, 0, 1,
-0.5731391, -0.4692994, -1.533447, 0.2941177, 1, 0, 1,
-0.5701309, 1.282832, -0.2129497, 0.2901961, 1, 0, 1,
-0.568338, 0.1708802, -0.4885994, 0.282353, 1, 0, 1,
-0.5677283, 0.2483598, -1.056616, 0.2784314, 1, 0, 1,
-0.5666203, 0.06108942, -2.179519, 0.2705882, 1, 0, 1,
-0.5657687, 0.6110023, -0.03757567, 0.2666667, 1, 0, 1,
-0.5653393, -0.2153927, -2.964078, 0.2588235, 1, 0, 1,
-0.5646248, -1.432648, -3.834991, 0.254902, 1, 0, 1,
-0.5636715, 0.555228, -1.415241, 0.2470588, 1, 0, 1,
-0.5611925, -1.273004, -2.034672, 0.2431373, 1, 0, 1,
-0.5570851, -0.00507798, -1.134806, 0.2352941, 1, 0, 1,
-0.5544291, 0.276174, -2.293605, 0.2313726, 1, 0, 1,
-0.5518579, 0.1758053, -1.263105, 0.2235294, 1, 0, 1,
-0.5498199, 1.79277, 0.580936, 0.2196078, 1, 0, 1,
-0.546306, 1.138048, -1.033394, 0.2117647, 1, 0, 1,
-0.5454994, -0.773798, -4.101734, 0.2078431, 1, 0, 1,
-0.543868, 0.8864686, -0.1153671, 0.2, 1, 0, 1,
-0.5428181, -0.285731, -2.710243, 0.1921569, 1, 0, 1,
-0.540625, -0.1028896, -0.8209065, 0.1882353, 1, 0, 1,
-0.53812, -1.449911, -0.9360715, 0.1803922, 1, 0, 1,
-0.5303278, -0.1222179, -1.805586, 0.1764706, 1, 0, 1,
-0.5260287, -0.4026955, -3.562827, 0.1686275, 1, 0, 1,
-0.5154889, -0.8497406, -2.014491, 0.1647059, 1, 0, 1,
-0.5149918, -0.9737822, -0.55576, 0.1568628, 1, 0, 1,
-0.5114755, -0.7975836, -0.8122624, 0.1529412, 1, 0, 1,
-0.5028936, 1.574055, 1.805274, 0.145098, 1, 0, 1,
-0.4989854, -0.4189657, -2.547723, 0.1411765, 1, 0, 1,
-0.4941034, -1.140059, -2.966857, 0.1333333, 1, 0, 1,
-0.4781699, -1.760939, -2.025069, 0.1294118, 1, 0, 1,
-0.4759344, 0.1128853, -1.649658, 0.1215686, 1, 0, 1,
-0.472738, -2.441377, -4.129026, 0.1176471, 1, 0, 1,
-0.4723745, -2.268385, -3.028628, 0.1098039, 1, 0, 1,
-0.4684182, -1.169175, -1.566647, 0.1058824, 1, 0, 1,
-0.4682392, -1.055986, -3.361027, 0.09803922, 1, 0, 1,
-0.4679385, 0.4962263, -1.405183, 0.09019608, 1, 0, 1,
-0.4677377, -2.279965, -3.353362, 0.08627451, 1, 0, 1,
-0.4677095, 0.01182792, -2.542574, 0.07843138, 1, 0, 1,
-0.4635417, 1.46011, -0.7761929, 0.07450981, 1, 0, 1,
-0.462429, 0.8661588, -1.348833, 0.06666667, 1, 0, 1,
-0.452657, -1.734135, -2.888642, 0.0627451, 1, 0, 1,
-0.4473354, -2.214534, -2.495937, 0.05490196, 1, 0, 1,
-0.4370168, -0.5572565, -1.497119, 0.05098039, 1, 0, 1,
-0.4349371, 0.6647261, -1.129715, 0.04313726, 1, 0, 1,
-0.4296944, 0.9785966, -2.090991, 0.03921569, 1, 0, 1,
-0.4250697, -0.4322524, -0.4487553, 0.03137255, 1, 0, 1,
-0.4250395, 0.7226734, -0.5452048, 0.02745098, 1, 0, 1,
-0.4231851, 1.78707, -1.928502, 0.01960784, 1, 0, 1,
-0.4228552, -2.482355, -2.951709, 0.01568628, 1, 0, 1,
-0.4225757, -0.1823458, -0.5404133, 0.007843138, 1, 0, 1,
-0.4053058, 0.5130329, -2.454629, 0.003921569, 1, 0, 1,
-0.4044556, 0.1868542, 2.431787, 0, 1, 0.003921569, 1,
-0.4034379, 0.3800725, -1.449472, 0, 1, 0.01176471, 1,
-0.4009969, -0.5502984, -3.055207, 0, 1, 0.01568628, 1,
-0.3985117, 0.3640526, -0.02374522, 0, 1, 0.02352941, 1,
-0.3983967, 0.9109997, -0.1285713, 0, 1, 0.02745098, 1,
-0.3976121, -0.8812653, -3.57547, 0, 1, 0.03529412, 1,
-0.3957412, 2.783196, -0.7917436, 0, 1, 0.03921569, 1,
-0.3955092, -1.187795, -1.444943, 0, 1, 0.04705882, 1,
-0.3950273, 0.6199518, -0.1077311, 0, 1, 0.05098039, 1,
-0.3894003, 2.01019, 2.037311, 0, 1, 0.05882353, 1,
-0.3805456, 0.809724, -0.9434801, 0, 1, 0.0627451, 1,
-0.3789431, -0.4789641, -2.783376, 0, 1, 0.07058824, 1,
-0.3785727, -0.5113989, -1.972417, 0, 1, 0.07450981, 1,
-0.3721269, -1.372405, -3.174444, 0, 1, 0.08235294, 1,
-0.3718198, 1.04064, -1.234187, 0, 1, 0.08627451, 1,
-0.3687626, 1.026628, -0.1748638, 0, 1, 0.09411765, 1,
-0.3676981, -0.5652121, -1.237326, 0, 1, 0.1019608, 1,
-0.365366, -1.544268, -3.086419, 0, 1, 0.1058824, 1,
-0.3648176, 0.7185004, -0.3334226, 0, 1, 0.1137255, 1,
-0.3612817, 0.5325146, -1.343303, 0, 1, 0.1176471, 1,
-0.3587933, 0.3233868, -0.5551547, 0, 1, 0.1254902, 1,
-0.3571272, -0.1097656, -2.368044, 0, 1, 0.1294118, 1,
-0.3528391, 0.5186497, -0.3767962, 0, 1, 0.1372549, 1,
-0.346308, 0.1763456, 0.2795712, 0, 1, 0.1411765, 1,
-0.3448902, -0.1745837, -4.965842, 0, 1, 0.1490196, 1,
-0.3405249, 0.1337529, -1.611421, 0, 1, 0.1529412, 1,
-0.3396324, 1.056618, -0.6250001, 0, 1, 0.1607843, 1,
-0.3275956, -1.706773, -2.160021, 0, 1, 0.1647059, 1,
-0.3273155, -0.3557973, -3.231039, 0, 1, 0.172549, 1,
-0.3201482, 1.200285, -0.4234981, 0, 1, 0.1764706, 1,
-0.3195479, -0.1961741, -1.423774, 0, 1, 0.1843137, 1,
-0.3191283, -0.9415127, -1.978569, 0, 1, 0.1882353, 1,
-0.318205, -1.239385, -2.788407, 0, 1, 0.1960784, 1,
-0.3168356, -0.4107637, -2.217489, 0, 1, 0.2039216, 1,
-0.3157043, 0.7129708, 2.247343, 0, 1, 0.2078431, 1,
-0.3155646, -0.2140492, -2.453188, 0, 1, 0.2156863, 1,
-0.3139578, -1.612321, -1.396033, 0, 1, 0.2196078, 1,
-0.3118436, 1.37484, -1.136072, 0, 1, 0.227451, 1,
-0.3068017, -0.4269245, -1.405678, 0, 1, 0.2313726, 1,
-0.3053602, 0.8734117, 0.02796268, 0, 1, 0.2392157, 1,
-0.3049704, 0.1528115, -1.664675, 0, 1, 0.2431373, 1,
-0.3016529, -0.3052629, -3.027847, 0, 1, 0.2509804, 1,
-0.3015875, 0.5656842, -0.3502041, 0, 1, 0.254902, 1,
-0.2975649, -0.1146576, -1.705097, 0, 1, 0.2627451, 1,
-0.2975406, 0.0806805, -0.9372458, 0, 1, 0.2666667, 1,
-0.2960368, 0.5098634, 1.921525, 0, 1, 0.2745098, 1,
-0.295195, -0.5103006, -3.551613, 0, 1, 0.2784314, 1,
-0.2934076, -0.4768156, -0.05989156, 0, 1, 0.2862745, 1,
-0.2921069, -0.06886801, -0.71161, 0, 1, 0.2901961, 1,
-0.2898384, -0.2617038, -2.328167, 0, 1, 0.2980392, 1,
-0.2814276, 0.7059758, 0.2140368, 0, 1, 0.3058824, 1,
-0.2811792, -1.209458, -3.680779, 0, 1, 0.3098039, 1,
-0.2788989, -1.196319, -2.506317, 0, 1, 0.3176471, 1,
-0.2771589, 0.5805783, 0.4708171, 0, 1, 0.3215686, 1,
-0.276329, 1.713119, -0.1891489, 0, 1, 0.3294118, 1,
-0.2702111, 1.589151, 0.3908184, 0, 1, 0.3333333, 1,
-0.2701718, -1.525907, -3.750771, 0, 1, 0.3411765, 1,
-0.2691986, 0.1436015, -0.5052518, 0, 1, 0.345098, 1,
-0.2690705, 0.1404463, -0.9328989, 0, 1, 0.3529412, 1,
-0.2651885, -0.9131786, -4.056472, 0, 1, 0.3568628, 1,
-0.2637663, 0.6100517, -1.499934, 0, 1, 0.3647059, 1,
-0.2616205, 0.5351736, -1.064853, 0, 1, 0.3686275, 1,
-0.2546177, -1.031002, -3.303335, 0, 1, 0.3764706, 1,
-0.2518065, -1.62407, -2.305721, 0, 1, 0.3803922, 1,
-0.2514107, -0.8034159, -4.043499, 0, 1, 0.3882353, 1,
-0.2498211, -0.3057002, -3.453346, 0, 1, 0.3921569, 1,
-0.2400606, -0.9706925, -2.932804, 0, 1, 0.4, 1,
-0.2389535, -2.115849, -3.839167, 0, 1, 0.4078431, 1,
-0.2371832, -0.1150515, -1.427485, 0, 1, 0.4117647, 1,
-0.2365532, -1.292012, -3.400708, 0, 1, 0.4196078, 1,
-0.2360355, 0.2019981, -0.7581912, 0, 1, 0.4235294, 1,
-0.2280008, 0.1881754, -0.9036193, 0, 1, 0.4313726, 1,
-0.2185601, -0.1104899, -0.7430259, 0, 1, 0.4352941, 1,
-0.2159301, 0.8032486, -0.4398053, 0, 1, 0.4431373, 1,
-0.2126054, -0.3943288, -4.057102, 0, 1, 0.4470588, 1,
-0.2098483, 0.5611919, 1.745578, 0, 1, 0.454902, 1,
-0.2089754, 0.6279548, 0.4758811, 0, 1, 0.4588235, 1,
-0.2085121, 0.07100178, -1.120382, 0, 1, 0.4666667, 1,
-0.2061198, -2.481314, -2.992999, 0, 1, 0.4705882, 1,
-0.204919, -1.449276, -3.693269, 0, 1, 0.4784314, 1,
-0.2034715, 0.0425779, -2.190408, 0, 1, 0.4823529, 1,
-0.2030424, -0.6553567, -3.825932, 0, 1, 0.4901961, 1,
-0.2026662, -0.9931334, -2.713917, 0, 1, 0.4941176, 1,
-0.1966021, -0.2117635, -2.879819, 0, 1, 0.5019608, 1,
-0.1962626, 0.2848789, -0.09306479, 0, 1, 0.509804, 1,
-0.1930358, 1.204057, -1.095233, 0, 1, 0.5137255, 1,
-0.1918907, -3.10238, -2.354032, 0, 1, 0.5215687, 1,
-0.1853891, 0.03182521, -2.001985, 0, 1, 0.5254902, 1,
-0.1834621, -1.269414, -3.734142, 0, 1, 0.5333334, 1,
-0.1834352, -0.7845169, -2.083425, 0, 1, 0.5372549, 1,
-0.1833779, -0.1220876, -3.505667, 0, 1, 0.5450981, 1,
-0.1811485, 0.8455039, -1.210904, 0, 1, 0.5490196, 1,
-0.1807618, 0.4639546, 1.430664, 0, 1, 0.5568628, 1,
-0.177398, -1.441103, -5.119403, 0, 1, 0.5607843, 1,
-0.1709596, 1.199951, 0.2046944, 0, 1, 0.5686275, 1,
-0.1690322, -1.609874, -3.044256, 0, 1, 0.572549, 1,
-0.165657, 1.200712, 0.4123743, 0, 1, 0.5803922, 1,
-0.1641656, 0.5878188, 0.661006, 0, 1, 0.5843138, 1,
-0.1607953, 0.06566893, -2.431742, 0, 1, 0.5921569, 1,
-0.1582935, -1.362648, -1.44045, 0, 1, 0.5960785, 1,
-0.1534542, -0.4569423, -3.317124, 0, 1, 0.6039216, 1,
-0.1533034, -0.6679315, -3.438797, 0, 1, 0.6117647, 1,
-0.1490197, -0.6279358, -2.634005, 0, 1, 0.6156863, 1,
-0.1479008, -0.931917, -2.92698, 0, 1, 0.6235294, 1,
-0.145956, -1.158726, -3.198184, 0, 1, 0.627451, 1,
-0.1456155, 2.413262, 0.5765975, 0, 1, 0.6352941, 1,
-0.1429552, -0.6014249, -2.259986, 0, 1, 0.6392157, 1,
-0.1416447, -1.127501, -3.679064, 0, 1, 0.6470588, 1,
-0.1373939, -0.7454787, -1.817023, 0, 1, 0.6509804, 1,
-0.1352046, -0.662465, -2.054899, 0, 1, 0.6588235, 1,
-0.1317348, -0.06232647, -1.955371, 0, 1, 0.6627451, 1,
-0.1250861, 0.8763514, -0.8295448, 0, 1, 0.6705883, 1,
-0.122456, 0.5559148, -1.145152, 0, 1, 0.6745098, 1,
-0.1205977, 0.3423443, 0.6259128, 0, 1, 0.682353, 1,
-0.1199221, 0.3435532, 0.8066534, 0, 1, 0.6862745, 1,
-0.1193235, -1.429769, -2.404223, 0, 1, 0.6941177, 1,
-0.1176833, -0.8829334, -2.124965, 0, 1, 0.7019608, 1,
-0.1108706, 0.4292787, -0.4276704, 0, 1, 0.7058824, 1,
-0.1107581, 0.5826123, 2.52295, 0, 1, 0.7137255, 1,
-0.1100263, -2.49754, -3.927371, 0, 1, 0.7176471, 1,
-0.1090793, 0.7448149, 1.896315, 0, 1, 0.7254902, 1,
-0.1083846, -0.1771005, -2.026096, 0, 1, 0.7294118, 1,
-0.09734909, 0.4412889, -0.8664619, 0, 1, 0.7372549, 1,
-0.09149637, -0.8122464, -2.95913, 0, 1, 0.7411765, 1,
-0.09062928, -0.06935484, -0.9914507, 0, 1, 0.7490196, 1,
-0.08636633, -0.5150427, -1.840383, 0, 1, 0.7529412, 1,
-0.08579138, -0.4549979, -2.738863, 0, 1, 0.7607843, 1,
-0.08455566, -1.466002, -2.011048, 0, 1, 0.7647059, 1,
-0.08223937, 1.847557, 0.03533633, 0, 1, 0.772549, 1,
-0.07922098, 0.007937253, -0.7018227, 0, 1, 0.7764706, 1,
-0.07902978, -2.080401, -3.491935, 0, 1, 0.7843137, 1,
-0.07852042, -0.4050573, -2.271893, 0, 1, 0.7882353, 1,
-0.07706361, -0.6631567, -2.536355, 0, 1, 0.7960784, 1,
-0.06413005, -0.4729536, -2.865031, 0, 1, 0.8039216, 1,
-0.06373873, -0.8486099, -3.032247, 0, 1, 0.8078431, 1,
-0.06294902, 0.6595602, 0.8890809, 0, 1, 0.8156863, 1,
-0.05874374, 0.9339424, 1.14825, 0, 1, 0.8196079, 1,
-0.05555163, -0.0829092, -3.989002, 0, 1, 0.827451, 1,
-0.05502141, -1.091043, -2.694281, 0, 1, 0.8313726, 1,
-0.05434464, 1.091941, -1.489744, 0, 1, 0.8392157, 1,
-0.04998597, -0.3484423, -4.36273, 0, 1, 0.8431373, 1,
-0.04828614, 0.688335, -0.5024034, 0, 1, 0.8509804, 1,
-0.04453412, 0.829244, -0.8895899, 0, 1, 0.854902, 1,
-0.04215636, -1.083793, -3.178191, 0, 1, 0.8627451, 1,
-0.0406526, -0.3244973, -3.189986, 0, 1, 0.8666667, 1,
-0.03742411, -0.7854708, -2.383599, 0, 1, 0.8745098, 1,
-0.03318843, -2.402261, -2.094157, 0, 1, 0.8784314, 1,
-0.03005251, 0.2260489, -0.7310895, 0, 1, 0.8862745, 1,
-0.02483569, -0.2552827, -3.244335, 0, 1, 0.8901961, 1,
-0.0240784, 0.4744061, -0.1871057, 0, 1, 0.8980392, 1,
-0.02208781, -0.3498831, -2.210016, 0, 1, 0.9058824, 1,
-0.01875139, -2.519945, -3.032166, 0, 1, 0.9098039, 1,
-0.01818505, -1.635363, -3.363716, 0, 1, 0.9176471, 1,
-0.01424063, 0.8203265, -1.35746, 0, 1, 0.9215686, 1,
-0.01076327, 1.205638, 0.09436067, 0, 1, 0.9294118, 1,
-0.009160775, -0.4262422, -3.003145, 0, 1, 0.9333333, 1,
-0.003125121, -0.672182, -4.583183, 0, 1, 0.9411765, 1,
-0.002053058, 0.9605993, 0.236242, 0, 1, 0.945098, 1,
-0.0008075343, 0.1974633, 0.1300351, 0, 1, 0.9529412, 1,
0.0006815451, -1.171902, 2.815788, 0, 1, 0.9568627, 1,
0.006582126, 0.7651713, -2.0054, 0, 1, 0.9647059, 1,
0.009052034, -0.5334458, 1.948918, 0, 1, 0.9686275, 1,
0.009070024, -1.35197, 4.500025, 0, 1, 0.9764706, 1,
0.01159319, -1.848796, 2.837407, 0, 1, 0.9803922, 1,
0.012188, 1.169504, 0.6667439, 0, 1, 0.9882353, 1,
0.01371662, 0.4803188, -0.02406278, 0, 1, 0.9921569, 1,
0.01568458, -0.5981699, 3.688758, 0, 1, 1, 1,
0.01889814, -0.3179792, 4.220383, 0, 0.9921569, 1, 1,
0.02063343, -0.5522836, 3.501203, 0, 0.9882353, 1, 1,
0.02225646, 0.3223149, 0.4036311, 0, 0.9803922, 1, 1,
0.02896948, -0.983301, 3.438179, 0, 0.9764706, 1, 1,
0.03706896, 0.3356022, -0.4944869, 0, 0.9686275, 1, 1,
0.04625854, 0.008347483, 0.1888648, 0, 0.9647059, 1, 1,
0.05770484, -0.1764305, 3.306, 0, 0.9568627, 1, 1,
0.06091493, -1.212572, 2.474473, 0, 0.9529412, 1, 1,
0.06097567, -0.8671836, 2.737957, 0, 0.945098, 1, 1,
0.06198573, -0.9511864, 1.933301, 0, 0.9411765, 1, 1,
0.06508347, -0.7545059, 2.313265, 0, 0.9333333, 1, 1,
0.06553703, 1.051595, 1.878568, 0, 0.9294118, 1, 1,
0.06822255, 0.349398, 0.8319712, 0, 0.9215686, 1, 1,
0.06827478, -0.3434373, 1.997725, 0, 0.9176471, 1, 1,
0.07208361, 0.3955149, -2.246837, 0, 0.9098039, 1, 1,
0.07475785, -1.0358, 1.241112, 0, 0.9058824, 1, 1,
0.07534264, 1.085865, 0.7731254, 0, 0.8980392, 1, 1,
0.08023686, -0.4600952, 1.742866, 0, 0.8901961, 1, 1,
0.08284202, 1.225014, 0.1674049, 0, 0.8862745, 1, 1,
0.08481324, 1.29457, 0.7211905, 0, 0.8784314, 1, 1,
0.09093661, 1.016776, 0.3704735, 0, 0.8745098, 1, 1,
0.09402912, -2.178529, 3.63291, 0, 0.8666667, 1, 1,
0.09457111, -0.3237248, 2.602354, 0, 0.8627451, 1, 1,
0.09475473, -0.4917448, 2.72887, 0, 0.854902, 1, 1,
0.0977929, 0.9982647, 1.45953, 0, 0.8509804, 1, 1,
0.09827675, 1.099372, 0.1415996, 0, 0.8431373, 1, 1,
0.09968309, 0.1503738, 1.133744, 0, 0.8392157, 1, 1,
0.1070864, 2.683576, -0.3969052, 0, 0.8313726, 1, 1,
0.1094334, -0.3881916, 2.62359, 0, 0.827451, 1, 1,
0.1102016, -0.1631152, 2.598769, 0, 0.8196079, 1, 1,
0.1111882, -0.2996647, 4.373719, 0, 0.8156863, 1, 1,
0.1125504, 0.6282977, 2.309143, 0, 0.8078431, 1, 1,
0.1127274, 1.308003, -0.2993926, 0, 0.8039216, 1, 1,
0.1150951, -2.344762, 3.066472, 0, 0.7960784, 1, 1,
0.1158579, 0.1370977, -0.2079721, 0, 0.7882353, 1, 1,
0.1166641, 1.583758, -2.263058, 0, 0.7843137, 1, 1,
0.11701, -0.4614873, 1.79698, 0, 0.7764706, 1, 1,
0.1188614, -0.5519201, 3.094316, 0, 0.772549, 1, 1,
0.1190777, -1.375376, 3.790908, 0, 0.7647059, 1, 1,
0.1202391, 0.7952207, -2.192358, 0, 0.7607843, 1, 1,
0.1224553, 1.002386, -0.2464087, 0, 0.7529412, 1, 1,
0.1264971, 0.174677, 2.170953, 0, 0.7490196, 1, 1,
0.1293191, -0.7973413, 4.283838, 0, 0.7411765, 1, 1,
0.1326724, 0.04651683, 1.878244, 0, 0.7372549, 1, 1,
0.1343329, 0.9290356, 0.4668623, 0, 0.7294118, 1, 1,
0.1356784, 0.8215389, 0.2046343, 0, 0.7254902, 1, 1,
0.1398724, -0.5331093, 2.39487, 0, 0.7176471, 1, 1,
0.1399281, -0.3673817, 3.351577, 0, 0.7137255, 1, 1,
0.1403736, -1.416472, 3.196142, 0, 0.7058824, 1, 1,
0.140828, -0.3625481, 2.355433, 0, 0.6980392, 1, 1,
0.1428048, 0.9447492, 1.259815, 0, 0.6941177, 1, 1,
0.1434985, -0.4938967, 2.7482, 0, 0.6862745, 1, 1,
0.1475719, -1.263394, 4.012267, 0, 0.682353, 1, 1,
0.1511347, -0.9453256, 1.938894, 0, 0.6745098, 1, 1,
0.153107, -1.49314, 2.97953, 0, 0.6705883, 1, 1,
0.1550795, -1.628724, 2.836476, 0, 0.6627451, 1, 1,
0.155709, -0.781598, 3.66708, 0, 0.6588235, 1, 1,
0.1568962, 0.5551485, -1.015999, 0, 0.6509804, 1, 1,
0.1674395, -1.489338, 3.003299, 0, 0.6470588, 1, 1,
0.1746451, 1.723968, -1.505018, 0, 0.6392157, 1, 1,
0.1758461, -1.310707, 3.212187, 0, 0.6352941, 1, 1,
0.1807592, 0.0004322692, 2.968984, 0, 0.627451, 1, 1,
0.1843611, -0.2109437, 3.436438, 0, 0.6235294, 1, 1,
0.1844728, 0.3781281, 1.239674, 0, 0.6156863, 1, 1,
0.185223, -0.3868482, 3.252891, 0, 0.6117647, 1, 1,
0.1903838, -1.874511, 2.928452, 0, 0.6039216, 1, 1,
0.1920128, -0.1396869, 1.972917, 0, 0.5960785, 1, 1,
0.1927425, -0.09105634, 2.651545, 0, 0.5921569, 1, 1,
0.1936892, 1.3058, 0.7771518, 0, 0.5843138, 1, 1,
0.198168, 0.4515245, -0.2875558, 0, 0.5803922, 1, 1,
0.201245, -0.3420874, 3.507986, 0, 0.572549, 1, 1,
0.2037677, 0.7755619, -0.3841977, 0, 0.5686275, 1, 1,
0.20432, 0.08454795, 0.4654554, 0, 0.5607843, 1, 1,
0.2046427, 0.3308867, -1.327832, 0, 0.5568628, 1, 1,
0.2088142, 0.1589132, 1.081016, 0, 0.5490196, 1, 1,
0.2095379, 0.2526027, 1.620705, 0, 0.5450981, 1, 1,
0.2096714, -0.2333087, 1.824209, 0, 0.5372549, 1, 1,
0.2113063, 0.8620117, 0.9770433, 0, 0.5333334, 1, 1,
0.2124335, 0.9040999, -0.6394508, 0, 0.5254902, 1, 1,
0.214767, 0.4339857, 0.3971471, 0, 0.5215687, 1, 1,
0.2162672, 0.4967704, 1.750646, 0, 0.5137255, 1, 1,
0.2174004, 0.3785686, -0.02377155, 0, 0.509804, 1, 1,
0.2179082, 0.9972527, 0.05724759, 0, 0.5019608, 1, 1,
0.2184622, 1.974325, 0.4868149, 0, 0.4941176, 1, 1,
0.2197022, 1.198221, -0.1173688, 0, 0.4901961, 1, 1,
0.2210795, 0.4601755, -0.4062696, 0, 0.4823529, 1, 1,
0.224399, 0.6677468, -0.05868535, 0, 0.4784314, 1, 1,
0.2319864, 1.102696, 1.382488, 0, 0.4705882, 1, 1,
0.2320003, -0.7420859, 2.208047, 0, 0.4666667, 1, 1,
0.2359535, 0.2117362, 1.872524, 0, 0.4588235, 1, 1,
0.2402388, -0.1098788, 2.213672, 0, 0.454902, 1, 1,
0.240588, 1.236429, 1.121816, 0, 0.4470588, 1, 1,
0.2409661, 0.2061446, 0.05620966, 0, 0.4431373, 1, 1,
0.2470987, -0.1559865, 2.559937, 0, 0.4352941, 1, 1,
0.2504667, 0.1358881, 0.5700284, 0, 0.4313726, 1, 1,
0.2547363, -0.9110039, 3.114878, 0, 0.4235294, 1, 1,
0.2614914, -0.03487835, 1.895595, 0, 0.4196078, 1, 1,
0.2639733, -0.338732, 2.90847, 0, 0.4117647, 1, 1,
0.2679323, -1.763574, 3.796005, 0, 0.4078431, 1, 1,
0.2751879, 0.4548214, 1.069263, 0, 0.4, 1, 1,
0.2763665, 0.9038294, -1.214253, 0, 0.3921569, 1, 1,
0.2780105, -0.497011, 3.415686, 0, 0.3882353, 1, 1,
0.2785217, -0.4601392, 2.301051, 0, 0.3803922, 1, 1,
0.2841418, 0.4326836, -1.314259, 0, 0.3764706, 1, 1,
0.2842213, 0.612036, 2.169537, 0, 0.3686275, 1, 1,
0.2845435, -0.1610403, 2.122127, 0, 0.3647059, 1, 1,
0.2847306, 1.292187, 0.6701483, 0, 0.3568628, 1, 1,
0.2884671, 0.7133766, 0.7830335, 0, 0.3529412, 1, 1,
0.2940083, -0.5376662, 3.485339, 0, 0.345098, 1, 1,
0.294332, 0.1821248, 2.180012, 0, 0.3411765, 1, 1,
0.2951773, 0.9628478, 0.07029537, 0, 0.3333333, 1, 1,
0.2995071, 1.341739, -0.6367856, 0, 0.3294118, 1, 1,
0.3030975, 0.2404405, 0.8185548, 0, 0.3215686, 1, 1,
0.3043183, -1.574369, 2.104041, 0, 0.3176471, 1, 1,
0.3085654, 0.2685801, -0.02112227, 0, 0.3098039, 1, 1,
0.3108972, 1.776207, -0.3800421, 0, 0.3058824, 1, 1,
0.3133643, -1.074991, 3.605545, 0, 0.2980392, 1, 1,
0.3152805, 1.552062, 0.2587043, 0, 0.2901961, 1, 1,
0.3162939, -1.332591, 1.633784, 0, 0.2862745, 1, 1,
0.3172443, -0.02863453, 1.762317, 0, 0.2784314, 1, 1,
0.317985, 0.9695829, -0.335219, 0, 0.2745098, 1, 1,
0.3185635, -1.069248, 4.7827, 0, 0.2666667, 1, 1,
0.3223387, 0.7593464, -1.00468, 0, 0.2627451, 1, 1,
0.3225625, 1.260727, -0.1590969, 0, 0.254902, 1, 1,
0.3250614, 0.7444819, -1.014942, 0, 0.2509804, 1, 1,
0.3308086, -0.8440647, 2.288634, 0, 0.2431373, 1, 1,
0.334541, -0.5599022, 2.980175, 0, 0.2392157, 1, 1,
0.3367446, 0.9582568, 0.51066, 0, 0.2313726, 1, 1,
0.3422249, -0.3762509, 4.176917, 0, 0.227451, 1, 1,
0.3444005, 1.410419, -0.8994582, 0, 0.2196078, 1, 1,
0.3464714, -0.24955, 2.029701, 0, 0.2156863, 1, 1,
0.3487426, -0.9941952, 2.676395, 0, 0.2078431, 1, 1,
0.3532559, 0.8095014, -0.1319517, 0, 0.2039216, 1, 1,
0.3539395, 0.9663955, 0.5179043, 0, 0.1960784, 1, 1,
0.357703, -0.2298085, 1.815504, 0, 0.1882353, 1, 1,
0.3593003, -0.07810159, 1.188748, 0, 0.1843137, 1, 1,
0.3619204, -0.008514673, 0.4545109, 0, 0.1764706, 1, 1,
0.3647254, -0.3261179, 1.811363, 0, 0.172549, 1, 1,
0.3674043, 1.068652, -0.4299458, 0, 0.1647059, 1, 1,
0.3725857, -2.159712, 3.546573, 0, 0.1607843, 1, 1,
0.3774626, -0.9592726, 3.194731, 0, 0.1529412, 1, 1,
0.3799137, 1.694891, 1.342577, 0, 0.1490196, 1, 1,
0.3818853, 2.754788, 0.7820609, 0, 0.1411765, 1, 1,
0.3934887, 0.1533213, 1.389095, 0, 0.1372549, 1, 1,
0.3972069, 0.9751174, 0.8209552, 0, 0.1294118, 1, 1,
0.4005723, 0.4983172, 0.7047217, 0, 0.1254902, 1, 1,
0.4015313, 0.5714497, 1.46689, 0, 0.1176471, 1, 1,
0.4097872, 0.2650892, 0.164462, 0, 0.1137255, 1, 1,
0.4161985, -0.1532238, 3.509111, 0, 0.1058824, 1, 1,
0.4162227, 1.319264, -1.422731, 0, 0.09803922, 1, 1,
0.4212786, 0.8981444, -0.06549216, 0, 0.09411765, 1, 1,
0.4247868, -1.56612, 2.930995, 0, 0.08627451, 1, 1,
0.4256735, 0.3363985, 1.553354, 0, 0.08235294, 1, 1,
0.428197, 1.158258, -1.13038, 0, 0.07450981, 1, 1,
0.437906, -1.661904, 4.144487, 0, 0.07058824, 1, 1,
0.4430248, 0.6541848, 1.294391, 0, 0.0627451, 1, 1,
0.4449661, 1.000687, -1.12898, 0, 0.05882353, 1, 1,
0.4473045, 0.8993678, 1.734467, 0, 0.05098039, 1, 1,
0.4509151, -0.1044638, 2.220323, 0, 0.04705882, 1, 1,
0.451479, -1.867338, 1.69402, 0, 0.03921569, 1, 1,
0.4526077, 0.5201872, 1.946731, 0, 0.03529412, 1, 1,
0.4555241, 2.597008, 0.1790023, 0, 0.02745098, 1, 1,
0.4558998, -1.253033, 0.9368363, 0, 0.02352941, 1, 1,
0.4572066, -0.07577097, 0.8261662, 0, 0.01568628, 1, 1,
0.4600767, 1.744133, 1.346687, 0, 0.01176471, 1, 1,
0.4631538, 0.01579386, -0.3864084, 0, 0.003921569, 1, 1,
0.4635239, 0.5239697, 0.5249888, 0.003921569, 0, 1, 1,
0.4642004, 0.3165697, 0.0285243, 0.007843138, 0, 1, 1,
0.4656706, 1.327026, -1.118689, 0.01568628, 0, 1, 1,
0.4682197, 1.577354, 1.530295, 0.01960784, 0, 1, 1,
0.4692053, -1.402392, 1.214692, 0.02745098, 0, 1, 1,
0.4734544, -2.030589, 3.833179, 0.03137255, 0, 1, 1,
0.4736714, 0.618101, 0.1257643, 0.03921569, 0, 1, 1,
0.4757292, 0.3672707, -0.2131247, 0.04313726, 0, 1, 1,
0.4772274, -0.2993815, 2.325039, 0.05098039, 0, 1, 1,
0.4809817, -1.118229, 1.740783, 0.05490196, 0, 1, 1,
0.4833391, 0.9248122, 0.2267474, 0.0627451, 0, 1, 1,
0.4848025, -2.142137, 3.94476, 0.06666667, 0, 1, 1,
0.486166, 0.05858257, 2.539988, 0.07450981, 0, 1, 1,
0.4917322, -0.08558479, 1.044636, 0.07843138, 0, 1, 1,
0.4938312, -0.3431847, 2.420725, 0.08627451, 0, 1, 1,
0.4941014, 0.6689193, 1.179575, 0.09019608, 0, 1, 1,
0.4955024, 0.3500744, 0.9342904, 0.09803922, 0, 1, 1,
0.4985832, 0.1966562, 0.6860239, 0.1058824, 0, 1, 1,
0.5000584, 1.13621, -1.166236, 0.1098039, 0, 1, 1,
0.5017205, 0.03240807, 2.333669, 0.1176471, 0, 1, 1,
0.502112, 1.095159, 1.590726, 0.1215686, 0, 1, 1,
0.5030091, 2.570593, -0.9891003, 0.1294118, 0, 1, 1,
0.5116522, 0.6121304, 0.6283442, 0.1333333, 0, 1, 1,
0.5163867, 0.4121532, -0.2195846, 0.1411765, 0, 1, 1,
0.5204763, -0.2076464, 2.111868, 0.145098, 0, 1, 1,
0.5209513, 0.4868402, -0.1543307, 0.1529412, 0, 1, 1,
0.5211029, 1.108598, 0.02736979, 0.1568628, 0, 1, 1,
0.524522, -1.152394, 2.525831, 0.1647059, 0, 1, 1,
0.5257769, 0.2380001, 1.21691, 0.1686275, 0, 1, 1,
0.5266733, -0.5813668, 0.9895658, 0.1764706, 0, 1, 1,
0.5280608, -0.2050087, 1.639895, 0.1803922, 0, 1, 1,
0.5340101, -0.6353192, 1.5818, 0.1882353, 0, 1, 1,
0.5493814, 0.2825786, 2.530178, 0.1921569, 0, 1, 1,
0.5535366, -1.209277, 2.204234, 0.2, 0, 1, 1,
0.5539675, 0.193443, 3.143393, 0.2078431, 0, 1, 1,
0.5568504, 0.2541809, 1.750205, 0.2117647, 0, 1, 1,
0.5609615, 0.5897006, 1.247956, 0.2196078, 0, 1, 1,
0.5622502, -0.3118029, 0.3367099, 0.2235294, 0, 1, 1,
0.5625196, 0.02143959, 1.66639, 0.2313726, 0, 1, 1,
0.5650941, 0.3493576, 0.2409425, 0.2352941, 0, 1, 1,
0.5677957, 0.481639, 0.748111, 0.2431373, 0, 1, 1,
0.5679278, -0.1374632, 3.006207, 0.2470588, 0, 1, 1,
0.5690708, -0.08820874, 0.5415182, 0.254902, 0, 1, 1,
0.5703018, 0.2292744, 0.7898505, 0.2588235, 0, 1, 1,
0.5738514, -0.8624274, 2.355582, 0.2666667, 0, 1, 1,
0.583388, -1.149074, 1.328659, 0.2705882, 0, 1, 1,
0.5873874, -0.502632, 2.654861, 0.2784314, 0, 1, 1,
0.5874618, -3.683214, 2.369034, 0.282353, 0, 1, 1,
0.5920349, -1.477436, 1.392047, 0.2901961, 0, 1, 1,
0.5956562, 0.7934355, 1.410134, 0.2941177, 0, 1, 1,
0.6033146, -1.030708, 0.006884047, 0.3019608, 0, 1, 1,
0.6044664, -2.565851, 3.654977, 0.3098039, 0, 1, 1,
0.6085658, 0.3564513, 0.2242531, 0.3137255, 0, 1, 1,
0.6167318, -0.5939925, 0.9423654, 0.3215686, 0, 1, 1,
0.6172836, -0.9230272, 3.408711, 0.3254902, 0, 1, 1,
0.6189284, -0.1047772, 0.06607379, 0.3333333, 0, 1, 1,
0.6194649, -0.8500121, 3.044742, 0.3372549, 0, 1, 1,
0.6234857, -2.424773, 3.653385, 0.345098, 0, 1, 1,
0.6256548, -0.359131, 1.506833, 0.3490196, 0, 1, 1,
0.6346715, -1.934127, 1.916208, 0.3568628, 0, 1, 1,
0.6398364, -1.280192, 2.218585, 0.3607843, 0, 1, 1,
0.6406706, -0.3392307, 0.1919131, 0.3686275, 0, 1, 1,
0.6444126, -0.4893449, 1.826425, 0.372549, 0, 1, 1,
0.6461691, -0.1701395, 1.411181, 0.3803922, 0, 1, 1,
0.6501744, -0.4630116, 1.957578, 0.3843137, 0, 1, 1,
0.6522256, -1.944146, 0.8151914, 0.3921569, 0, 1, 1,
0.652261, -0.3216597, 2.42234, 0.3960784, 0, 1, 1,
0.6551746, -0.2310288, 1.807774, 0.4039216, 0, 1, 1,
0.6567175, -0.2893676, 1.573765, 0.4117647, 0, 1, 1,
0.6648638, 0.4500002, 2.825078, 0.4156863, 0, 1, 1,
0.6655865, -0.2455153, 3.267259, 0.4235294, 0, 1, 1,
0.6709968, 0.059686, 1.575161, 0.427451, 0, 1, 1,
0.6722291, -1.878795, 4.118857, 0.4352941, 0, 1, 1,
0.6766923, -0.3335987, 2.733571, 0.4392157, 0, 1, 1,
0.6775493, -0.7437299, 2.239749, 0.4470588, 0, 1, 1,
0.6799895, -0.08913903, 0.2929046, 0.4509804, 0, 1, 1,
0.6808908, -0.04120598, 2.912433, 0.4588235, 0, 1, 1,
0.6811994, 0.6331406, 0.2817292, 0.4627451, 0, 1, 1,
0.6821454, -1.056585, 2.367284, 0.4705882, 0, 1, 1,
0.6829672, 0.2008139, 1.778023, 0.4745098, 0, 1, 1,
0.6837916, 0.7510292, 1.224634, 0.4823529, 0, 1, 1,
0.6862261, -1.181005, 2.161873, 0.4862745, 0, 1, 1,
0.6921237, 1.019221, -0.8347534, 0.4941176, 0, 1, 1,
0.6935909, -0.5020412, 0.5032597, 0.5019608, 0, 1, 1,
0.7007477, -1.524485, 0.9984124, 0.5058824, 0, 1, 1,
0.7031628, 0.02104214, 2.893094, 0.5137255, 0, 1, 1,
0.7070646, 0.5319034, 1.200065, 0.5176471, 0, 1, 1,
0.7075858, 0.3175789, 1.274792, 0.5254902, 0, 1, 1,
0.7129105, -0.7663448, 1.488343, 0.5294118, 0, 1, 1,
0.7173157, -0.747805, 3.879763, 0.5372549, 0, 1, 1,
0.7177655, 0.6864051, -0.1784847, 0.5411765, 0, 1, 1,
0.7216709, -0.7929224, 1.86228, 0.5490196, 0, 1, 1,
0.7265898, -0.07919398, 2.466939, 0.5529412, 0, 1, 1,
0.7433726, -1.509814, 2.586779, 0.5607843, 0, 1, 1,
0.7438641, -0.3280692, 1.280809, 0.5647059, 0, 1, 1,
0.7453051, 0.2659386, 1.940911, 0.572549, 0, 1, 1,
0.7456096, -1.619639, 4.647924, 0.5764706, 0, 1, 1,
0.7543933, -1.309209, 4.248876, 0.5843138, 0, 1, 1,
0.7551585, -3.513599, 2.77293, 0.5882353, 0, 1, 1,
0.7592221, -0.4511589, 1.723994, 0.5960785, 0, 1, 1,
0.7604194, 1.097269, 0.008498414, 0.6039216, 0, 1, 1,
0.7662839, 0.6333193, 0.0695775, 0.6078432, 0, 1, 1,
0.7720951, -0.9865286, 1.710555, 0.6156863, 0, 1, 1,
0.7799636, 0.1137714, -0.6561015, 0.6196079, 0, 1, 1,
0.7818034, -1.462571, 2.194558, 0.627451, 0, 1, 1,
0.7883468, -0.428842, 3.529186, 0.6313726, 0, 1, 1,
0.7902011, 0.838378, 1.717882, 0.6392157, 0, 1, 1,
0.7946743, -0.3742387, 1.380718, 0.6431373, 0, 1, 1,
0.7948075, -0.5619669, 2.962056, 0.6509804, 0, 1, 1,
0.8025666, 0.7194865, -0.1424845, 0.654902, 0, 1, 1,
0.8032211, -1.389243, 2.031763, 0.6627451, 0, 1, 1,
0.8049446, -1.356682, 3.127267, 0.6666667, 0, 1, 1,
0.8111522, 0.8184018, 3.485228, 0.6745098, 0, 1, 1,
0.8183605, 1.66276, 0.8600485, 0.6784314, 0, 1, 1,
0.823055, 2.033482, 3.891622, 0.6862745, 0, 1, 1,
0.8307915, -0.4419487, 1.293871, 0.6901961, 0, 1, 1,
0.8346367, -0.4595682, 3.109112, 0.6980392, 0, 1, 1,
0.836625, -0.4661598, 3.489654, 0.7058824, 0, 1, 1,
0.8372895, 0.2685115, 1.777121, 0.7098039, 0, 1, 1,
0.8397987, 0.2518744, 3.24428, 0.7176471, 0, 1, 1,
0.8405744, 1.331639, 1.149811, 0.7215686, 0, 1, 1,
0.8427183, -0.6488855, 2.802917, 0.7294118, 0, 1, 1,
0.8447471, 0.4431649, 1.258442, 0.7333333, 0, 1, 1,
0.8489461, 0.5823061, 0.808942, 0.7411765, 0, 1, 1,
0.8535857, -1.097229, 2.311189, 0.7450981, 0, 1, 1,
0.8570669, -1.264408, 3.055823, 0.7529412, 0, 1, 1,
0.8601896, 0.8861413, -0.5968219, 0.7568628, 0, 1, 1,
0.8605453, 0.4605719, 0.5225672, 0.7647059, 0, 1, 1,
0.8637819, -0.9746783, 3.327186, 0.7686275, 0, 1, 1,
0.8651145, 0.6175495, 1.866264, 0.7764706, 0, 1, 1,
0.8662603, 0.9120211, 0.5924666, 0.7803922, 0, 1, 1,
0.8664802, 0.05190971, 1.102658, 0.7882353, 0, 1, 1,
0.8684908, 1.154655, 0.3006855, 0.7921569, 0, 1, 1,
0.8690459, 1.016068, 1.416287, 0.8, 0, 1, 1,
0.8713421, -0.6244704, 1.433835, 0.8078431, 0, 1, 1,
0.8830211, 1.999423, 1.851558, 0.8117647, 0, 1, 1,
0.8834262, -1.808137, 1.886584, 0.8196079, 0, 1, 1,
0.8860083, 1.730773, 0.8117481, 0.8235294, 0, 1, 1,
0.8873597, 0.6444732, -0.2966111, 0.8313726, 0, 1, 1,
0.8897471, 0.2741196, 0.7536511, 0.8352941, 0, 1, 1,
0.8973317, -1.20005, 2.643809, 0.8431373, 0, 1, 1,
0.8999522, -0.6672052, 2.596638, 0.8470588, 0, 1, 1,
0.9028882, 0.1247844, -0.1629387, 0.854902, 0, 1, 1,
0.9048595, 1.593538, -1.123274, 0.8588235, 0, 1, 1,
0.9109873, -0.1093643, 0.05796563, 0.8666667, 0, 1, 1,
0.9145131, -0.7015079, 1.285647, 0.8705882, 0, 1, 1,
0.9158986, 0.9849984, -0.5451654, 0.8784314, 0, 1, 1,
0.9205872, 1.315887, 0.9308829, 0.8823529, 0, 1, 1,
0.9209667, 0.2632313, 1.305217, 0.8901961, 0, 1, 1,
0.9251551, 1.128014, 0.1600024, 0.8941177, 0, 1, 1,
0.9270532, -0.2942839, 1.584063, 0.9019608, 0, 1, 1,
0.9272256, 0.3582051, 0.7446976, 0.9098039, 0, 1, 1,
0.9340613, 0.8068549, 1.991721, 0.9137255, 0, 1, 1,
0.9448743, -0.0463458, 1.915347, 0.9215686, 0, 1, 1,
0.9461513, 0.09299468, 0.6327843, 0.9254902, 0, 1, 1,
0.9554587, 0.1902221, 1.197222, 0.9333333, 0, 1, 1,
0.956665, 0.6838315, 0.5043837, 0.9372549, 0, 1, 1,
0.9608521, -1.659742, 4.00322, 0.945098, 0, 1, 1,
0.9663833, 0.566451, 1.128536, 0.9490196, 0, 1, 1,
0.9867303, -1.375161, 3.271468, 0.9568627, 0, 1, 1,
0.9867725, -0.3248211, 2.730185, 0.9607843, 0, 1, 1,
0.9887114, 0.003981601, 0.8709644, 0.9686275, 0, 1, 1,
0.9979628, 0.1135886, 1.509249, 0.972549, 0, 1, 1,
1.000802, 1.504027, 1.447875, 0.9803922, 0, 1, 1,
1.002163, 0.8247272, 1.5921, 0.9843137, 0, 1, 1,
1.00301, -1.255579, 3.841863, 0.9921569, 0, 1, 1,
1.003081, 1.227009, 1.434593, 0.9960784, 0, 1, 1,
1.00638, 0.03445194, 0.9636624, 1, 0, 0.9960784, 1,
1.009125, 0.3780927, 1.99175, 1, 0, 0.9882353, 1,
1.011411, -0.7283069, 2.664231, 1, 0, 0.9843137, 1,
1.011523, 0.3407137, 0.6257302, 1, 0, 0.9764706, 1,
1.013489, 0.2538183, 0.4385503, 1, 0, 0.972549, 1,
1.019853, -2.375399, 3.648044, 1, 0, 0.9647059, 1,
1.02535, 0.4716718, -0.1788984, 1, 0, 0.9607843, 1,
1.02586, -0.7773428, 2.770833, 1, 0, 0.9529412, 1,
1.027315, 0.561437, 1.480352, 1, 0, 0.9490196, 1,
1.036178, -0.1865675, 3.158201, 1, 0, 0.9411765, 1,
1.037984, 0.9532649, 0.7097877, 1, 0, 0.9372549, 1,
1.040666, 2.54182, -0.5084465, 1, 0, 0.9294118, 1,
1.041383, 0.5816253, 0.07958969, 1, 0, 0.9254902, 1,
1.049454, -0.0663946, 0.261281, 1, 0, 0.9176471, 1,
1.053674, 1.058921, 0.9065334, 1, 0, 0.9137255, 1,
1.057412, 2.667061, -0.2511806, 1, 0, 0.9058824, 1,
1.057941, -0.4210934, 1.165427, 1, 0, 0.9019608, 1,
1.062714, 1.228304, 3.069804, 1, 0, 0.8941177, 1,
1.064818, 0.0816007, 0.2154713, 1, 0, 0.8862745, 1,
1.07988, 0.3550709, 0.1442923, 1, 0, 0.8823529, 1,
1.08407, 0.5951253, 0.9074434, 1, 0, 0.8745098, 1,
1.084424, -0.4888439, 2.456418, 1, 0, 0.8705882, 1,
1.086139, -0.9723913, 1.988799, 1, 0, 0.8627451, 1,
1.089646, 1.994064, 1.626034, 1, 0, 0.8588235, 1,
1.097008, -0.2296656, 2.930453, 1, 0, 0.8509804, 1,
1.10347, -1.113271, 1.647256, 1, 0, 0.8470588, 1,
1.103981, 1.494368, 0.3504333, 1, 0, 0.8392157, 1,
1.113727, -1.131119, 2.077138, 1, 0, 0.8352941, 1,
1.119748, 2.888783, 0.1346582, 1, 0, 0.827451, 1,
1.125328, -0.3717793, 3.062076, 1, 0, 0.8235294, 1,
1.128094, 0.7634104, 0.2309567, 1, 0, 0.8156863, 1,
1.134285, 0.3548512, 2.177303, 1, 0, 0.8117647, 1,
1.144597, -1.286659, 1.13132, 1, 0, 0.8039216, 1,
1.152728, -0.6994323, 1.325763, 1, 0, 0.7960784, 1,
1.154322, -0.2602637, 0.6685151, 1, 0, 0.7921569, 1,
1.163323, 0.4424295, -0.7949226, 1, 0, 0.7843137, 1,
1.168573, 0.6900706, 0.4618531, 1, 0, 0.7803922, 1,
1.175419, -1.219333, 3.43731, 1, 0, 0.772549, 1,
1.176454, 1.307327, 2.293535, 1, 0, 0.7686275, 1,
1.177219, 0.1709797, 3.879757, 1, 0, 0.7607843, 1,
1.179454, 0.2354012, -0.2056554, 1, 0, 0.7568628, 1,
1.179788, 0.3142295, 0.5890038, 1, 0, 0.7490196, 1,
1.184698, -0.8689055, 1.815275, 1, 0, 0.7450981, 1,
1.187807, -1.097514, 3.2048, 1, 0, 0.7372549, 1,
1.194752, -0.529496, 3.313096, 1, 0, 0.7333333, 1,
1.197633, 0.2960704, 3.232746, 1, 0, 0.7254902, 1,
1.198744, 0.285475, 1.323281, 1, 0, 0.7215686, 1,
1.199655, 0.04803988, 1.142685, 1, 0, 0.7137255, 1,
1.200327, 0.4248396, 0.4730936, 1, 0, 0.7098039, 1,
1.210417, -1.282741, 3.266055, 1, 0, 0.7019608, 1,
1.213668, -0.1375315, 2.908206, 1, 0, 0.6941177, 1,
1.215019, 0.2233933, 1.73871, 1, 0, 0.6901961, 1,
1.222803, 1.572225, 2.228052, 1, 0, 0.682353, 1,
1.223804, 0.1248775, 0.9927392, 1, 0, 0.6784314, 1,
1.235325, 0.7382006, 0.4533922, 1, 0, 0.6705883, 1,
1.237442, -0.08288199, 0.6544645, 1, 0, 0.6666667, 1,
1.242146, -0.9158827, 3.995754, 1, 0, 0.6588235, 1,
1.243389, -0.683962, 1.784675, 1, 0, 0.654902, 1,
1.247208, -1.986106, 1.264339, 1, 0, 0.6470588, 1,
1.256465, 1.369246, 2.153827, 1, 0, 0.6431373, 1,
1.256881, 1.002911, 0.4020828, 1, 0, 0.6352941, 1,
1.257598, 1.014856, 1.281925, 1, 0, 0.6313726, 1,
1.261464, -1.360052, 2.98686, 1, 0, 0.6235294, 1,
1.26174, -2.536511, 0.4577871, 1, 0, 0.6196079, 1,
1.262602, 1.88598, 2.626224, 1, 0, 0.6117647, 1,
1.263101, 0.4286005, 1.722243, 1, 0, 0.6078432, 1,
1.264103, 0.07621447, 1.515266, 1, 0, 0.6, 1,
1.266658, -0.1072932, 2.293817, 1, 0, 0.5921569, 1,
1.272284, -1.637238, 2.180159, 1, 0, 0.5882353, 1,
1.274332, 0.3087638, 2.589506, 1, 0, 0.5803922, 1,
1.278196, 0.2442146, 2.883066, 1, 0, 0.5764706, 1,
1.279313, 0.4637704, 0.1774618, 1, 0, 0.5686275, 1,
1.2823, 1.001715, -0.6609659, 1, 0, 0.5647059, 1,
1.284604, 0.5462808, 0.5520124, 1, 0, 0.5568628, 1,
1.288064, 0.9037993, 1.490592, 1, 0, 0.5529412, 1,
1.289177, -0.04593525, 1.630041, 1, 0, 0.5450981, 1,
1.289918, 0.8523705, -0.3706786, 1, 0, 0.5411765, 1,
1.292493, -0.8275291, 2.449527, 1, 0, 0.5333334, 1,
1.297933, 1.636806, 0.01005922, 1, 0, 0.5294118, 1,
1.29863, -0.2256263, 0.5308225, 1, 0, 0.5215687, 1,
1.314824, -0.07725135, 0.110316, 1, 0, 0.5176471, 1,
1.327062, 0.5611862, 1.526183, 1, 0, 0.509804, 1,
1.330493, 0.5551195, 4.398111, 1, 0, 0.5058824, 1,
1.339933, 0.559178, 1.299806, 1, 0, 0.4980392, 1,
1.367489, -1.724725, 1.910154, 1, 0, 0.4901961, 1,
1.369234, -0.6195809, 1.339669, 1, 0, 0.4862745, 1,
1.369733, 0.7662651, 1.564316, 1, 0, 0.4784314, 1,
1.372232, -0.5914439, 1.424421, 1, 0, 0.4745098, 1,
1.373853, 1.001121, 1.442768, 1, 0, 0.4666667, 1,
1.382788, 0.2785784, 1.96122, 1, 0, 0.4627451, 1,
1.392565, 1.018666, 0.7199692, 1, 0, 0.454902, 1,
1.40076, -0.7687368, 3.926752, 1, 0, 0.4509804, 1,
1.41283, -0.3487292, 3.121486, 1, 0, 0.4431373, 1,
1.414654, -1.641546, 1.186588, 1, 0, 0.4392157, 1,
1.423612, 0.2299681, 1.550972, 1, 0, 0.4313726, 1,
1.425839, 0.1587458, 0.4498486, 1, 0, 0.427451, 1,
1.425963, 0.06376679, 0.2659444, 1, 0, 0.4196078, 1,
1.428931, -0.1343722, 1.040998, 1, 0, 0.4156863, 1,
1.432219, -1.810423, 2.154725, 1, 0, 0.4078431, 1,
1.436175, 1.075383, 1.146948, 1, 0, 0.4039216, 1,
1.44201, 0.04145044, 0.4970533, 1, 0, 0.3960784, 1,
1.445553, -1.13333, 1.401109, 1, 0, 0.3882353, 1,
1.445787, 1.529689, 1.720281, 1, 0, 0.3843137, 1,
1.46426, 1.069623, -0.1710185, 1, 0, 0.3764706, 1,
1.470556, -0.3351218, 2.659536, 1, 0, 0.372549, 1,
1.470625, -0.02779866, 1.605618, 1, 0, 0.3647059, 1,
1.473843, 0.9141119, -0.381692, 1, 0, 0.3607843, 1,
1.475391, 1.421842, 0.04236695, 1, 0, 0.3529412, 1,
1.487849, -0.4924343, 4.257601, 1, 0, 0.3490196, 1,
1.492927, 0.4671194, 1.245487, 1, 0, 0.3411765, 1,
1.523554, 0.9781522, 1.151006, 1, 0, 0.3372549, 1,
1.524075, 0.3058085, -0.5224608, 1, 0, 0.3294118, 1,
1.528934, 0.09055581, 2.301962, 1, 0, 0.3254902, 1,
1.530263, 0.8375339, 2.256955, 1, 0, 0.3176471, 1,
1.535986, 0.2888476, 0.6291297, 1, 0, 0.3137255, 1,
1.548221, -1.262905, 3.624328, 1, 0, 0.3058824, 1,
1.565856, -2.237449, 2.675102, 1, 0, 0.2980392, 1,
1.569959, -1.632635, 3.491573, 1, 0, 0.2941177, 1,
1.573018, -0.2360486, 2.756293, 1, 0, 0.2862745, 1,
1.577067, 0.03023807, 1.632839, 1, 0, 0.282353, 1,
1.582491, -2.110363, 2.403152, 1, 0, 0.2745098, 1,
1.585606, -1.611593, 2.352722, 1, 0, 0.2705882, 1,
1.58707, -0.7853011, 4.434427, 1, 0, 0.2627451, 1,
1.594447, 0.3735777, 0.9672354, 1, 0, 0.2588235, 1,
1.594623, 0.189759, 0.1696361, 1, 0, 0.2509804, 1,
1.636743, -0.6466705, 1.849555, 1, 0, 0.2470588, 1,
1.637408, 0.3284268, 2.010278, 1, 0, 0.2392157, 1,
1.640013, -0.6652855, 1.345708, 1, 0, 0.2352941, 1,
1.646224, -0.369351, 2.045738, 1, 0, 0.227451, 1,
1.663611, -2.155277, 3.305834, 1, 0, 0.2235294, 1,
1.686625, -0.7284103, 2.842013, 1, 0, 0.2156863, 1,
1.703321, 0.6524442, 2.042442, 1, 0, 0.2117647, 1,
1.724164, -0.5845609, 0.9280039, 1, 0, 0.2039216, 1,
1.724408, -0.128876, 2.617981, 1, 0, 0.1960784, 1,
1.741623, -0.284103, 1.811539, 1, 0, 0.1921569, 1,
1.754651, -0.4431406, 2.293964, 1, 0, 0.1843137, 1,
1.770768, -2.323399, 1.938624, 1, 0, 0.1803922, 1,
1.772654, 0.1494727, -0.5177007, 1, 0, 0.172549, 1,
1.777103, -0.4212669, 1.436654, 1, 0, 0.1686275, 1,
1.779976, 0.8276127, 2.541427, 1, 0, 0.1607843, 1,
1.786103, -1.125406, 3.971281, 1, 0, 0.1568628, 1,
1.793156, -0.3224395, 1.452764, 1, 0, 0.1490196, 1,
1.795956, 0.4170175, 1.158139, 1, 0, 0.145098, 1,
1.813122, 0.01771897, 1.771696, 1, 0, 0.1372549, 1,
1.815195, 0.2332876, 3.309474, 1, 0, 0.1333333, 1,
1.852881, 0.5094054, 2.718614, 1, 0, 0.1254902, 1,
1.864224, 0.08007922, 1.388319, 1, 0, 0.1215686, 1,
1.86642, 0.814385, 1.648578, 1, 0, 0.1137255, 1,
1.885188, -1.113329, 0.6531571, 1, 0, 0.1098039, 1,
1.895134, -0.4373818, 0.6333472, 1, 0, 0.1019608, 1,
1.930812, -0.6459399, 2.482277, 1, 0, 0.09411765, 1,
1.957676, -0.08318365, 0.7402332, 1, 0, 0.09019608, 1,
2.077509, 0.1720569, 3.198308, 1, 0, 0.08235294, 1,
2.082167, -0.270523, 1.292206, 1, 0, 0.07843138, 1,
2.0832, -0.5713463, 1.921969, 1, 0, 0.07058824, 1,
2.09309, 1.533194, 1.254787, 1, 0, 0.06666667, 1,
2.162679, 0.3513241, 0.1205162, 1, 0, 0.05882353, 1,
2.260283, -0.3663512, 2.325654, 1, 0, 0.05490196, 1,
2.326649, 1.274451, 0.9518519, 1, 0, 0.04705882, 1,
2.332969, -0.3779914, 3.451804, 1, 0, 0.04313726, 1,
2.367964, 0.1338321, 1.307574, 1, 0, 0.03529412, 1,
2.391239, -0.1419669, 1.245151, 1, 0, 0.03137255, 1,
2.402366, 2.137108, 0.9143768, 1, 0, 0.02352941, 1,
2.711177, 0.7939268, 0.7546605, 1, 0, 0.01960784, 1,
2.718347, 0.05842133, 1.47756, 1, 0, 0.01176471, 1,
2.867965, -1.404837, 3.033385, 1, 0, 0.007843138, 1
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
-0.4178636, -4.797168, -6.845777, 0, -0.5, 0.5, 0.5,
-0.4178636, -4.797168, -6.845777, 1, -0.5, 0.5, 0.5,
-0.4178636, -4.797168, -6.845777, 1, 1.5, 0.5, 0.5,
-0.4178636, -4.797168, -6.845777, 0, 1.5, 0.5, 0.5
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
-4.817588, -0.3972156, -6.845777, 0, -0.5, 0.5, 0.5,
-4.817588, -0.3972156, -6.845777, 1, -0.5, 0.5, 0.5,
-4.817588, -0.3972156, -6.845777, 1, 1.5, 0.5, 0.5,
-4.817588, -0.3972156, -6.845777, 0, 1.5, 0.5, 0.5
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
-4.817588, -4.797168, -0.1888595, 0, -0.5, 0.5, 0.5,
-4.817588, -4.797168, -0.1888595, 1, -0.5, 0.5, 0.5,
-4.817588, -4.797168, -0.1888595, 1, 1.5, 0.5, 0.5,
-4.817588, -4.797168, -0.1888595, 0, 1.5, 0.5, 0.5
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
-3, -3.781794, -5.309565,
2, -3.781794, -5.309565,
-3, -3.781794, -5.309565,
-3, -3.951023, -5.5656,
-2, -3.781794, -5.309565,
-2, -3.951023, -5.5656,
-1, -3.781794, -5.309565,
-1, -3.951023, -5.5656,
0, -3.781794, -5.309565,
0, -3.951023, -5.5656,
1, -3.781794, -5.309565,
1, -3.951023, -5.5656,
2, -3.781794, -5.309565,
2, -3.951023, -5.5656
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
-3, -4.289481, -6.077671, 0, -0.5, 0.5, 0.5,
-3, -4.289481, -6.077671, 1, -0.5, 0.5, 0.5,
-3, -4.289481, -6.077671, 1, 1.5, 0.5, 0.5,
-3, -4.289481, -6.077671, 0, 1.5, 0.5, 0.5,
-2, -4.289481, -6.077671, 0, -0.5, 0.5, 0.5,
-2, -4.289481, -6.077671, 1, -0.5, 0.5, 0.5,
-2, -4.289481, -6.077671, 1, 1.5, 0.5, 0.5,
-2, -4.289481, -6.077671, 0, 1.5, 0.5, 0.5,
-1, -4.289481, -6.077671, 0, -0.5, 0.5, 0.5,
-1, -4.289481, -6.077671, 1, -0.5, 0.5, 0.5,
-1, -4.289481, -6.077671, 1, 1.5, 0.5, 0.5,
-1, -4.289481, -6.077671, 0, 1.5, 0.5, 0.5,
0, -4.289481, -6.077671, 0, -0.5, 0.5, 0.5,
0, -4.289481, -6.077671, 1, -0.5, 0.5, 0.5,
0, -4.289481, -6.077671, 1, 1.5, 0.5, 0.5,
0, -4.289481, -6.077671, 0, 1.5, 0.5, 0.5,
1, -4.289481, -6.077671, 0, -0.5, 0.5, 0.5,
1, -4.289481, -6.077671, 1, -0.5, 0.5, 0.5,
1, -4.289481, -6.077671, 1, 1.5, 0.5, 0.5,
1, -4.289481, -6.077671, 0, 1.5, 0.5, 0.5,
2, -4.289481, -6.077671, 0, -0.5, 0.5, 0.5,
2, -4.289481, -6.077671, 1, -0.5, 0.5, 0.5,
2, -4.289481, -6.077671, 1, 1.5, 0.5, 0.5,
2, -4.289481, -6.077671, 0, 1.5, 0.5, 0.5
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
-3.802267, -3, -5.309565,
-3.802267, 2, -5.309565,
-3.802267, -3, -5.309565,
-3.971488, -3, -5.5656,
-3.802267, -2, -5.309565,
-3.971488, -2, -5.5656,
-3.802267, -1, -5.309565,
-3.971488, -1, -5.5656,
-3.802267, 0, -5.309565,
-3.971488, 0, -5.5656,
-3.802267, 1, -5.309565,
-3.971488, 1, -5.5656,
-3.802267, 2, -5.309565,
-3.971488, 2, -5.5656
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
-4.309928, -3, -6.077671, 0, -0.5, 0.5, 0.5,
-4.309928, -3, -6.077671, 1, -0.5, 0.5, 0.5,
-4.309928, -3, -6.077671, 1, 1.5, 0.5, 0.5,
-4.309928, -3, -6.077671, 0, 1.5, 0.5, 0.5,
-4.309928, -2, -6.077671, 0, -0.5, 0.5, 0.5,
-4.309928, -2, -6.077671, 1, -0.5, 0.5, 0.5,
-4.309928, -2, -6.077671, 1, 1.5, 0.5, 0.5,
-4.309928, -2, -6.077671, 0, 1.5, 0.5, 0.5,
-4.309928, -1, -6.077671, 0, -0.5, 0.5, 0.5,
-4.309928, -1, -6.077671, 1, -0.5, 0.5, 0.5,
-4.309928, -1, -6.077671, 1, 1.5, 0.5, 0.5,
-4.309928, -1, -6.077671, 0, 1.5, 0.5, 0.5,
-4.309928, 0, -6.077671, 0, -0.5, 0.5, 0.5,
-4.309928, 0, -6.077671, 1, -0.5, 0.5, 0.5,
-4.309928, 0, -6.077671, 1, 1.5, 0.5, 0.5,
-4.309928, 0, -6.077671, 0, 1.5, 0.5, 0.5,
-4.309928, 1, -6.077671, 0, -0.5, 0.5, 0.5,
-4.309928, 1, -6.077671, 1, -0.5, 0.5, 0.5,
-4.309928, 1, -6.077671, 1, 1.5, 0.5, 0.5,
-4.309928, 1, -6.077671, 0, 1.5, 0.5, 0.5,
-4.309928, 2, -6.077671, 0, -0.5, 0.5, 0.5,
-4.309928, 2, -6.077671, 1, -0.5, 0.5, 0.5,
-4.309928, 2, -6.077671, 1, 1.5, 0.5, 0.5,
-4.309928, 2, -6.077671, 0, 1.5, 0.5, 0.5
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
-3.802267, -3.781794, -4,
-3.802267, -3.781794, 4,
-3.802267, -3.781794, -4,
-3.971488, -3.951023, -4,
-3.802267, -3.781794, -2,
-3.971488, -3.951023, -2,
-3.802267, -3.781794, 0,
-3.971488, -3.951023, 0,
-3.802267, -3.781794, 2,
-3.971488, -3.951023, 2,
-3.802267, -3.781794, 4,
-3.971488, -3.951023, 4
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
-4.309928, -4.289481, -4, 0, -0.5, 0.5, 0.5,
-4.309928, -4.289481, -4, 1, -0.5, 0.5, 0.5,
-4.309928, -4.289481, -4, 1, 1.5, 0.5, 0.5,
-4.309928, -4.289481, -4, 0, 1.5, 0.5, 0.5,
-4.309928, -4.289481, -2, 0, -0.5, 0.5, 0.5,
-4.309928, -4.289481, -2, 1, -0.5, 0.5, 0.5,
-4.309928, -4.289481, -2, 1, 1.5, 0.5, 0.5,
-4.309928, -4.289481, -2, 0, 1.5, 0.5, 0.5,
-4.309928, -4.289481, 0, 0, -0.5, 0.5, 0.5,
-4.309928, -4.289481, 0, 1, -0.5, 0.5, 0.5,
-4.309928, -4.289481, 0, 1, 1.5, 0.5, 0.5,
-4.309928, -4.289481, 0, 0, 1.5, 0.5, 0.5,
-4.309928, -4.289481, 2, 0, -0.5, 0.5, 0.5,
-4.309928, -4.289481, 2, 1, -0.5, 0.5, 0.5,
-4.309928, -4.289481, 2, 1, 1.5, 0.5, 0.5,
-4.309928, -4.289481, 2, 0, 1.5, 0.5, 0.5,
-4.309928, -4.289481, 4, 0, -0.5, 0.5, 0.5,
-4.309928, -4.289481, 4, 1, -0.5, 0.5, 0.5,
-4.309928, -4.289481, 4, 1, 1.5, 0.5, 0.5,
-4.309928, -4.289481, 4, 0, 1.5, 0.5, 0.5
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
-3.802267, -3.781794, -5.309565,
-3.802267, 2.987363, -5.309565,
-3.802267, -3.781794, 4.931846,
-3.802267, 2.987363, 4.931846,
-3.802267, -3.781794, -5.309565,
-3.802267, -3.781794, 4.931846,
-3.802267, 2.987363, -5.309565,
-3.802267, 2.987363, 4.931846,
-3.802267, -3.781794, -5.309565,
2.96654, -3.781794, -5.309565,
-3.802267, -3.781794, 4.931846,
2.96654, -3.781794, 4.931846,
-3.802267, 2.987363, -5.309565,
2.96654, 2.987363, -5.309565,
-3.802267, 2.987363, 4.931846,
2.96654, 2.987363, 4.931846,
2.96654, -3.781794, -5.309565,
2.96654, 2.987363, -5.309565,
2.96654, -3.781794, 4.931846,
2.96654, 2.987363, 4.931846,
2.96654, -3.781794, -5.309565,
2.96654, -3.781794, 4.931846,
2.96654, 2.987363, -5.309565,
2.96654, 2.987363, 4.931846
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
var radius = 7.485729;
var distance = 33.30486;
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
mvMatrix.translate( 0.4178636, 0.3972156, 0.1888595 );
mvMatrix.scale( 1.195737, 1.195676, 0.7902931 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.30486);
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
sethoxydim<-read.table("sethoxydim.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-sethoxydim$V2
```

```
## Error in eval(expr, envir, enclos): object 'sethoxydim' not found
```

```r
y<-sethoxydim$V3
```

```
## Error in eval(expr, envir, enclos): object 'sethoxydim' not found
```

```r
z<-sethoxydim$V4
```

```
## Error in eval(expr, envir, enclos): object 'sethoxydim' not found
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
-3.703692, -0.544728, -0.7821149, 0, 0, 1, 1, 1,
-3.266716, -0.8478858, -1.957706, 1, 0, 0, 1, 1,
-2.84152, 0.4517892, -1.286687, 1, 0, 0, 1, 1,
-2.768514, 0.1812258, -1.993092, 1, 0, 0, 1, 1,
-2.76696, 0.4135188, -3.300548, 1, 0, 0, 1, 1,
-2.478478, 0.3527435, -2.329087, 1, 0, 0, 1, 1,
-2.397095, -2.526477, -2.929895, 0, 0, 0, 1, 1,
-2.335265, -0.8225175, -1.863765, 0, 0, 0, 1, 1,
-2.222132, -1.116984, -0.4567095, 0, 0, 0, 1, 1,
-2.22071, -0.03099308, -0.4766315, 0, 0, 0, 1, 1,
-2.220273, 0.579714, -3.814046, 0, 0, 0, 1, 1,
-2.161092, 0.4038641, 0.1147133, 0, 0, 0, 1, 1,
-2.126208, 0.7647406, -1.304032, 0, 0, 0, 1, 1,
-2.076206, -0.4682776, -2.302406, 1, 1, 1, 1, 1,
-2.028768, -1.510722, -2.405928, 1, 1, 1, 1, 1,
-1.960442, 0.2234869, -1.88122, 1, 1, 1, 1, 1,
-1.94105, -0.3738392, -1.711158, 1, 1, 1, 1, 1,
-1.937424, -0.3401701, -1.814696, 1, 1, 1, 1, 1,
-1.937308, -0.8955307, -1.312683, 1, 1, 1, 1, 1,
-1.935722, -2.156824, -2.374066, 1, 1, 1, 1, 1,
-1.912941, -0.7090725, -1.547426, 1, 1, 1, 1, 1,
-1.909761, -1.082904, -2.301525, 1, 1, 1, 1, 1,
-1.90347, 0.4067391, -2.513002, 1, 1, 1, 1, 1,
-1.879142, 0.9705942, 0.2047424, 1, 1, 1, 1, 1,
-1.876648, 0.7861391, -0.7165571, 1, 1, 1, 1, 1,
-1.843501, -1.966785, -2.61411, 1, 1, 1, 1, 1,
-1.842281, -0.6745213, -1.852469, 1, 1, 1, 1, 1,
-1.804567, -0.2871406, -0.6857713, 1, 1, 1, 1, 1,
-1.800181, -1.345364, -3.681787, 0, 0, 1, 1, 1,
-1.792022, 0.4541539, -1.492473, 1, 0, 0, 1, 1,
-1.789593, -1.136453, -2.4415, 1, 0, 0, 1, 1,
-1.781347, 0.8939478, -1.775639, 1, 0, 0, 1, 1,
-1.764041, -0.5374013, -1.500726, 1, 0, 0, 1, 1,
-1.75773, 0.6008785, -2.441437, 1, 0, 0, 1, 1,
-1.720473, 1.411691, 0.02209277, 0, 0, 0, 1, 1,
-1.71922, -0.0688649, -1.244785, 0, 0, 0, 1, 1,
-1.713867, -2.082037, -1.543473, 0, 0, 0, 1, 1,
-1.693927, -1.279182, -1.116707, 0, 0, 0, 1, 1,
-1.669145, 0.5313542, -2.408549, 0, 0, 0, 1, 1,
-1.661165, 0.6207781, -1.10378, 0, 0, 0, 1, 1,
-1.655681, 0.240753, 0.7735124, 0, 0, 0, 1, 1,
-1.620673, 2.168238, -1.832029, 1, 1, 1, 1, 1,
-1.619662, -0.3647901, -3.089721, 1, 1, 1, 1, 1,
-1.617104, 0.4993419, -0.4624009, 1, 1, 1, 1, 1,
-1.597792, 2.480672, -0.7788985, 1, 1, 1, 1, 1,
-1.589716, -0.3471586, -2.698379, 1, 1, 1, 1, 1,
-1.560339, -0.7579172, -2.286342, 1, 1, 1, 1, 1,
-1.556089, 0.7496713, -2.587397, 1, 1, 1, 1, 1,
-1.555094, -1.530479, -2.973996, 1, 1, 1, 1, 1,
-1.542839, 1.639306, -1.891886, 1, 1, 1, 1, 1,
-1.535866, 1.150405, -0.009243637, 1, 1, 1, 1, 1,
-1.521909, 0.8799984, -2.336924, 1, 1, 1, 1, 1,
-1.517081, 0.9261855, -0.002462742, 1, 1, 1, 1, 1,
-1.50512, -0.1053185, -2.133095, 1, 1, 1, 1, 1,
-1.496117, -0.6566738, -1.370543, 1, 1, 1, 1, 1,
-1.491277, 0.689797, -1.478494, 1, 1, 1, 1, 1,
-1.491263, -0.4308051, -0.7284607, 0, 0, 1, 1, 1,
-1.485292, -0.1523828, -1.466466, 1, 0, 0, 1, 1,
-1.474044, -0.3493544, -2.098433, 1, 0, 0, 1, 1,
-1.473918, 0.6843105, -0.2072191, 1, 0, 0, 1, 1,
-1.46961, 2.240439, -1.873198, 1, 0, 0, 1, 1,
-1.465926, 0.7476562, 0.5824392, 1, 0, 0, 1, 1,
-1.457358, 0.3885987, -2.475374, 0, 0, 0, 1, 1,
-1.453139, 0.6579427, -0.8254844, 0, 0, 0, 1, 1,
-1.452269, -0.07793687, -1.310364, 0, 0, 0, 1, 1,
-1.450076, -1.922627, -2.337857, 0, 0, 0, 1, 1,
-1.443103, -0.03406266, -2.425477, 0, 0, 0, 1, 1,
-1.428884, -1.119224, -0.5088214, 0, 0, 0, 1, 1,
-1.423701, -0.3270361, -2.262908, 0, 0, 0, 1, 1,
-1.423613, 0.410464, -1.538595, 1, 1, 1, 1, 1,
-1.414366, -1.17471, -3.561933, 1, 1, 1, 1, 1,
-1.412821, 1.08373, -1.060581, 1, 1, 1, 1, 1,
-1.410919, -0.03152361, -0.9167239, 1, 1, 1, 1, 1,
-1.409869, -0.2872313, -1.228736, 1, 1, 1, 1, 1,
-1.404246, 0.8058503, -3.583919, 1, 1, 1, 1, 1,
-1.395948, 0.3774878, -1.548602, 1, 1, 1, 1, 1,
-1.387074, -0.7138897, -1.535181, 1, 1, 1, 1, 1,
-1.384274, 0.03111757, -0.2761025, 1, 1, 1, 1, 1,
-1.3827, -0.3500796, -2.200781, 1, 1, 1, 1, 1,
-1.381595, -0.3637959, -2.163345, 1, 1, 1, 1, 1,
-1.376454, 0.8866194, -0.9214386, 1, 1, 1, 1, 1,
-1.376195, -1.494877, 0.1970686, 1, 1, 1, 1, 1,
-1.362859, 0.7267683, -0.6954116, 1, 1, 1, 1, 1,
-1.362318, -1.375612, -3.155505, 1, 1, 1, 1, 1,
-1.360296, 1.263299, -1.229809, 0, 0, 1, 1, 1,
-1.341534, 1.050147, 0.6937222, 1, 0, 0, 1, 1,
-1.326164, 1.532616, -0.05223911, 1, 0, 0, 1, 1,
-1.312658, 0.577177, -1.878468, 1, 0, 0, 1, 1,
-1.311595, -0.3161359, -1.726555, 1, 0, 0, 1, 1,
-1.300748, -1.035048, -2.132215, 1, 0, 0, 1, 1,
-1.295019, -0.1217197, -1.228396, 0, 0, 0, 1, 1,
-1.289027, -0.04504994, -3.311644, 0, 0, 0, 1, 1,
-1.288483, -1.157668, -0.6646057, 0, 0, 0, 1, 1,
-1.277268, -0.7381529, -2.651497, 0, 0, 0, 1, 1,
-1.272602, 0.1727774, -0.856271, 0, 0, 0, 1, 1,
-1.268133, -0.7067017, -3.083196, 0, 0, 0, 1, 1,
-1.267315, -1.723545, -1.092085, 0, 0, 0, 1, 1,
-1.266708, -1.917999, -3.40531, 1, 1, 1, 1, 1,
-1.259431, -1.937092, -2.386937, 1, 1, 1, 1, 1,
-1.251909, 0.5540628, -2.16577, 1, 1, 1, 1, 1,
-1.249773, -0.4102918, -2.155753, 1, 1, 1, 1, 1,
-1.245099, -1.226129, -2.987269, 1, 1, 1, 1, 1,
-1.239321, -0.2151098, -4.027336, 1, 1, 1, 1, 1,
-1.239236, -1.16655, -2.044501, 1, 1, 1, 1, 1,
-1.237907, 0.2644728, -2.559165, 1, 1, 1, 1, 1,
-1.234476, 0.0560314, -2.380991, 1, 1, 1, 1, 1,
-1.232104, -0.3976301, 0.1287311, 1, 1, 1, 1, 1,
-1.225977, -0.9110462, -1.821168, 1, 1, 1, 1, 1,
-1.221133, -0.6588582, -4.244818, 1, 1, 1, 1, 1,
-1.212557, 1.10244, -0.9675925, 1, 1, 1, 1, 1,
-1.210824, 0.3652161, -1.557388, 1, 1, 1, 1, 1,
-1.210812, 0.9448875, -0.3016515, 1, 1, 1, 1, 1,
-1.209636, -0.1654412, -2.502322, 0, 0, 1, 1, 1,
-1.209345, -0.4374106, -2.478589, 1, 0, 0, 1, 1,
-1.205598, 0.1754975, -2.492548, 1, 0, 0, 1, 1,
-1.203927, -0.6367895, -2.445872, 1, 0, 0, 1, 1,
-1.202479, -0.08288395, -2.283286, 1, 0, 0, 1, 1,
-1.201037, -1.636991, -2.846494, 1, 0, 0, 1, 1,
-1.20062, -1.095118, -3.30623, 0, 0, 0, 1, 1,
-1.190745, 1.355789, -1.069213, 0, 0, 0, 1, 1,
-1.179985, 0.0903028, 0.1111056, 0, 0, 0, 1, 1,
-1.175397, 1.063099, -0.08840325, 0, 0, 0, 1, 1,
-1.174362, 1.148179, -1.730668, 0, 0, 0, 1, 1,
-1.173834, -1.139337, -1.944422, 0, 0, 0, 1, 1,
-1.16753, -0.4466301, -2.630136, 0, 0, 0, 1, 1,
-1.166681, 0.7643083, -1.819723, 1, 1, 1, 1, 1,
-1.163488, 0.9699218, -1.771387, 1, 1, 1, 1, 1,
-1.162673, 0.04699696, -0.6839834, 1, 1, 1, 1, 1,
-1.160016, -0.4238088, -3.940964, 1, 1, 1, 1, 1,
-1.157355, -1.265587, -0.961722, 1, 1, 1, 1, 1,
-1.155996, 0.5002002, -2.435205, 1, 1, 1, 1, 1,
-1.155393, 1.121892, -0.3388276, 1, 1, 1, 1, 1,
-1.154167, -0.1341806, -2.011339, 1, 1, 1, 1, 1,
-1.153148, -0.1522812, -2.136057, 1, 1, 1, 1, 1,
-1.152087, -0.6235895, -1.742082, 1, 1, 1, 1, 1,
-1.147632, 1.300706, 0.8531073, 1, 1, 1, 1, 1,
-1.147143, 0.6113489, 0.2012278, 1, 1, 1, 1, 1,
-1.139344, -0.2011915, -1.139286, 1, 1, 1, 1, 1,
-1.139266, -1.488827, -3.400205, 1, 1, 1, 1, 1,
-1.133533, -1.180493, -3.151674, 1, 1, 1, 1, 1,
-1.12614, -0.3846988, -1.719633, 0, 0, 1, 1, 1,
-1.125322, 1.022375, -1.720752, 1, 0, 0, 1, 1,
-1.123509, 0.04794212, -0.6144719, 1, 0, 0, 1, 1,
-1.12171, 0.5538886, 0.8680801, 1, 0, 0, 1, 1,
-1.116208, -1.094735, -0.6394622, 1, 0, 0, 1, 1,
-1.114122, 0.6969746, -0.7306665, 1, 0, 0, 1, 1,
-1.107805, 1.969031, -1.498433, 0, 0, 0, 1, 1,
-1.105671, -1.987715, -2.288769, 0, 0, 0, 1, 1,
-1.099071, -0.8008165, -3.792261, 0, 0, 0, 1, 1,
-1.09401, -0.004473088, -0.5520625, 0, 0, 0, 1, 1,
-1.093432, 0.7621897, -1.907731, 0, 0, 0, 1, 1,
-1.084195, 0.2923419, -2.001126, 0, 0, 0, 1, 1,
-1.075861, -0.9481488, -1.916942, 0, 0, 0, 1, 1,
-1.068734, 1.517919, 0.4520111, 1, 1, 1, 1, 1,
-1.061299, -1.418059, -2.487645, 1, 1, 1, 1, 1,
-1.048143, 0.5239857, -3.812572, 1, 1, 1, 1, 1,
-1.046643, -1.069266, -2.592451, 1, 1, 1, 1, 1,
-1.044573, 0.6417952, -1.432516, 1, 1, 1, 1, 1,
-1.043214, 0.09895184, -0.1624893, 1, 1, 1, 1, 1,
-1.042846, 1.996078, -0.3511962, 1, 1, 1, 1, 1,
-1.042578, 0.8794978, 0.7525273, 1, 1, 1, 1, 1,
-1.037109, -1.081818, -3.402649, 1, 1, 1, 1, 1,
-1.035996, -1.490062, -2.06653, 1, 1, 1, 1, 1,
-1.033662, 0.3566881, -1.082629, 1, 1, 1, 1, 1,
-1.032251, 0.06766663, -1.787298, 1, 1, 1, 1, 1,
-1.029104, 0.471466, -2.290355, 1, 1, 1, 1, 1,
-1.028006, -0.4701142, -3.149231, 1, 1, 1, 1, 1,
-1.024394, -0.19947, -1.958379, 1, 1, 1, 1, 1,
-1.023502, -0.06110739, 0.2340578, 0, 0, 1, 1, 1,
-1.01983, -0.7971932, -3.935287, 1, 0, 0, 1, 1,
-1.010948, -0.2322991, -1.077591, 1, 0, 0, 1, 1,
-1.008125, -1.065461, -0.9081743, 1, 0, 0, 1, 1,
-0.9997792, 0.4289891, -2.184668, 1, 0, 0, 1, 1,
-0.9924709, -0.5161186, -1.347616, 1, 0, 0, 1, 1,
-0.9910709, 0.5875702, -0.6239395, 0, 0, 0, 1, 1,
-0.9900345, 0.9763407, -2.6596, 0, 0, 0, 1, 1,
-0.9883862, -1.015762, -1.411275, 0, 0, 0, 1, 1,
-0.9828003, -0.6583039, 0.1186477, 0, 0, 0, 1, 1,
-0.9795178, -0.6386716, -1.338328, 0, 0, 0, 1, 1,
-0.9730046, 0.4993482, -0.3794737, 0, 0, 0, 1, 1,
-0.9668316, -0.443568, -2.019556, 0, 0, 0, 1, 1,
-0.9664782, -1.265127, -2.520029, 1, 1, 1, 1, 1,
-0.9608153, -0.1777288, -1.629983, 1, 1, 1, 1, 1,
-0.958775, 1.357852, -0.4298938, 1, 1, 1, 1, 1,
-0.958727, 0.2754978, -1.080993, 1, 1, 1, 1, 1,
-0.957567, -0.3370097, -1.513292, 1, 1, 1, 1, 1,
-0.9566275, 0.6846722, -1.039085, 1, 1, 1, 1, 1,
-0.9521945, -1.041245, -1.772263, 1, 1, 1, 1, 1,
-0.9514741, 0.03109974, -1.485132, 1, 1, 1, 1, 1,
-0.940414, 0.6409526, -1.157215, 1, 1, 1, 1, 1,
-0.9400246, 0.7628704, -1.006296, 1, 1, 1, 1, 1,
-0.937089, -0.4082309, -2.616868, 1, 1, 1, 1, 1,
-0.9339069, -0.2632282, -1.00755, 1, 1, 1, 1, 1,
-0.9263111, 0.1229826, -1.201178, 1, 1, 1, 1, 1,
-0.9211019, -1.162703, -1.283581, 1, 1, 1, 1, 1,
-0.9167038, 1.461463, 0.6587533, 1, 1, 1, 1, 1,
-0.9162714, 1.121827, -0.776782, 0, 0, 1, 1, 1,
-0.9117122, 0.6129779, -1.224301, 1, 0, 0, 1, 1,
-0.907876, -0.5403693, -1.521707, 1, 0, 0, 1, 1,
-0.9036793, -0.5888611, -2.57918, 1, 0, 0, 1, 1,
-0.8983824, 1.043918, 0.3581184, 1, 0, 0, 1, 1,
-0.8961968, 0.5997397, -0.4959614, 1, 0, 0, 1, 1,
-0.89615, 0.6190755, -1.527442, 0, 0, 0, 1, 1,
-0.8955586, 0.2855825, -1.350297, 0, 0, 0, 1, 1,
-0.8862807, 0.03798601, -1.055088, 0, 0, 0, 1, 1,
-0.8834811, -0.6527907, -2.632874, 0, 0, 0, 1, 1,
-0.8743898, -0.7280879, -3.848566, 0, 0, 0, 1, 1,
-0.8628446, 0.1781789, -1.641907, 0, 0, 0, 1, 1,
-0.8602101, -0.4380566, -3.060266, 0, 0, 0, 1, 1,
-0.858981, 1.15783, -1.235977, 1, 1, 1, 1, 1,
-0.8465986, -0.2948008, -2.973869, 1, 1, 1, 1, 1,
-0.8460598, 1.425128, -2.398849, 1, 1, 1, 1, 1,
-0.843666, -1.285282, -4.061606, 1, 1, 1, 1, 1,
-0.8428007, -0.4741632, -0.9763815, 1, 1, 1, 1, 1,
-0.8322046, -0.8679256, -3.221584, 1, 1, 1, 1, 1,
-0.8291262, 0.4580587, -0.09582648, 1, 1, 1, 1, 1,
-0.8200401, 0.2424758, -2.032435, 1, 1, 1, 1, 1,
-0.8182145, 1.041991, -0.7725909, 1, 1, 1, 1, 1,
-0.8074377, -0.008250928, -0.7183105, 1, 1, 1, 1, 1,
-0.8053493, 0.5415575, -2.276826, 1, 1, 1, 1, 1,
-0.8050273, -0.7343467, -3.409084, 1, 1, 1, 1, 1,
-0.804777, -0.3339735, -2.861548, 1, 1, 1, 1, 1,
-0.8045532, 0.6952103, -0.5058265, 1, 1, 1, 1, 1,
-0.8009463, 0.224352, -1.9698, 1, 1, 1, 1, 1,
-0.7959591, 0.08570576, -1.646276, 0, 0, 1, 1, 1,
-0.7930872, -0.3401978, -0.4072247, 1, 0, 0, 1, 1,
-0.7930569, 1.108684, 1.211725, 1, 0, 0, 1, 1,
-0.7924178, -2.319444, -1.026731, 1, 0, 0, 1, 1,
-0.7893038, 0.5101517, -0.6534038, 1, 0, 0, 1, 1,
-0.785153, -2.025094, -5.160419, 1, 0, 0, 1, 1,
-0.7688945, -1.314668, -4.159821, 0, 0, 0, 1, 1,
-0.7669884, 1.278904, -1.027678, 0, 0, 0, 1, 1,
-0.7641317, -0.7644162, -2.695589, 0, 0, 0, 1, 1,
-0.7635391, 1.109443, -0.9942823, 0, 0, 0, 1, 1,
-0.7609712, -0.477093, -3.115309, 0, 0, 0, 1, 1,
-0.758638, 0.01692721, -1.950351, 0, 0, 0, 1, 1,
-0.7551343, -0.768974, -2.989418, 0, 0, 0, 1, 1,
-0.7544953, -1.547312, -2.7354, 1, 1, 1, 1, 1,
-0.7541341, -1.85848, -3.21783, 1, 1, 1, 1, 1,
-0.7466353, -0.2934286, -3.090042, 1, 1, 1, 1, 1,
-0.7447818, 0.9157715, -1.959673, 1, 1, 1, 1, 1,
-0.73715, -0.188914, -0.1051264, 1, 1, 1, 1, 1,
-0.73671, 0.8478398, 0.2175376, 1, 1, 1, 1, 1,
-0.7347263, 0.7845843, -0.04179141, 1, 1, 1, 1, 1,
-0.7276499, 1.659588, -3.070328, 1, 1, 1, 1, 1,
-0.7260816, 1.380531, -0.5319849, 1, 1, 1, 1, 1,
-0.7260476, 0.06106924, -1.368313, 1, 1, 1, 1, 1,
-0.723042, 0.7919376, -1.284819, 1, 1, 1, 1, 1,
-0.7182093, 2.671374, -1.191014, 1, 1, 1, 1, 1,
-0.7181443, 1.305751, -0.1659307, 1, 1, 1, 1, 1,
-0.7180139, -0.2302317, -2.74473, 1, 1, 1, 1, 1,
-0.7147856, 0.9578293, -2.202349, 1, 1, 1, 1, 1,
-0.6970895, 0.4353519, -2.20832, 0, 0, 1, 1, 1,
-0.6961303, -1.441231, -2.387687, 1, 0, 0, 1, 1,
-0.6745739, 0.1291505, -1.487463, 1, 0, 0, 1, 1,
-0.6733056, 0.1009501, -2.487182, 1, 0, 0, 1, 1,
-0.6711964, -1.730497, -2.042214, 1, 0, 0, 1, 1,
-0.6681896, -0.5754257, -2.225566, 1, 0, 0, 1, 1,
-0.665064, 0.8863882, 0.6516122, 0, 0, 0, 1, 1,
-0.6619585, 0.8275764, -1.793501, 0, 0, 0, 1, 1,
-0.652236, -0.7661505, -3.415469, 0, 0, 0, 1, 1,
-0.6512342, -0.9287602, -2.695337, 0, 0, 0, 1, 1,
-0.6465957, 1.574974, -2.117531, 0, 0, 0, 1, 1,
-0.6463483, -1.113996, -2.438282, 0, 0, 0, 1, 1,
-0.6452796, 0.02632179, -2.071265, 0, 0, 0, 1, 1,
-0.6409102, 0.03719434, -1.744311, 1, 1, 1, 1, 1,
-0.6317354, -0.04809958, -1.682416, 1, 1, 1, 1, 1,
-0.630622, 0.7116684, 0.1064989, 1, 1, 1, 1, 1,
-0.6228832, -0.1879373, 0.6823841, 1, 1, 1, 1, 1,
-0.6114126, 0.5817546, -0.9328904, 1, 1, 1, 1, 1,
-0.6107175, 1.258146, -1.112003, 1, 1, 1, 1, 1,
-0.6099154, 1.211015, 0.6384374, 1, 1, 1, 1, 1,
-0.6064298, 0.8108379, -0.79311, 1, 1, 1, 1, 1,
-0.6016675, -0.6542422, -1.846681, 1, 1, 1, 1, 1,
-0.6009291, 1.264613, -0.904768, 1, 1, 1, 1, 1,
-0.5972688, -0.6025246, -2.306276, 1, 1, 1, 1, 1,
-0.5951234, 0.823616, -0.3826688, 1, 1, 1, 1, 1,
-0.5882092, 0.9404735, -1.325133, 1, 1, 1, 1, 1,
-0.58808, -1.119787, -2.768381, 1, 1, 1, 1, 1,
-0.5861434, 2.108698, 0.3036003, 1, 1, 1, 1, 1,
-0.5840361, -0.4629456, -1.540557, 0, 0, 1, 1, 1,
-0.5784277, 1.078431, 1.683083, 1, 0, 0, 1, 1,
-0.5777439, 0.5672675, -1.618556, 1, 0, 0, 1, 1,
-0.5762402, 0.7489195, -1.464015, 1, 0, 0, 1, 1,
-0.5731391, -0.4692994, -1.533447, 1, 0, 0, 1, 1,
-0.5701309, 1.282832, -0.2129497, 1, 0, 0, 1, 1,
-0.568338, 0.1708802, -0.4885994, 0, 0, 0, 1, 1,
-0.5677283, 0.2483598, -1.056616, 0, 0, 0, 1, 1,
-0.5666203, 0.06108942, -2.179519, 0, 0, 0, 1, 1,
-0.5657687, 0.6110023, -0.03757567, 0, 0, 0, 1, 1,
-0.5653393, -0.2153927, -2.964078, 0, 0, 0, 1, 1,
-0.5646248, -1.432648, -3.834991, 0, 0, 0, 1, 1,
-0.5636715, 0.555228, -1.415241, 0, 0, 0, 1, 1,
-0.5611925, -1.273004, -2.034672, 1, 1, 1, 1, 1,
-0.5570851, -0.00507798, -1.134806, 1, 1, 1, 1, 1,
-0.5544291, 0.276174, -2.293605, 1, 1, 1, 1, 1,
-0.5518579, 0.1758053, -1.263105, 1, 1, 1, 1, 1,
-0.5498199, 1.79277, 0.580936, 1, 1, 1, 1, 1,
-0.546306, 1.138048, -1.033394, 1, 1, 1, 1, 1,
-0.5454994, -0.773798, -4.101734, 1, 1, 1, 1, 1,
-0.543868, 0.8864686, -0.1153671, 1, 1, 1, 1, 1,
-0.5428181, -0.285731, -2.710243, 1, 1, 1, 1, 1,
-0.540625, -0.1028896, -0.8209065, 1, 1, 1, 1, 1,
-0.53812, -1.449911, -0.9360715, 1, 1, 1, 1, 1,
-0.5303278, -0.1222179, -1.805586, 1, 1, 1, 1, 1,
-0.5260287, -0.4026955, -3.562827, 1, 1, 1, 1, 1,
-0.5154889, -0.8497406, -2.014491, 1, 1, 1, 1, 1,
-0.5149918, -0.9737822, -0.55576, 1, 1, 1, 1, 1,
-0.5114755, -0.7975836, -0.8122624, 0, 0, 1, 1, 1,
-0.5028936, 1.574055, 1.805274, 1, 0, 0, 1, 1,
-0.4989854, -0.4189657, -2.547723, 1, 0, 0, 1, 1,
-0.4941034, -1.140059, -2.966857, 1, 0, 0, 1, 1,
-0.4781699, -1.760939, -2.025069, 1, 0, 0, 1, 1,
-0.4759344, 0.1128853, -1.649658, 1, 0, 0, 1, 1,
-0.472738, -2.441377, -4.129026, 0, 0, 0, 1, 1,
-0.4723745, -2.268385, -3.028628, 0, 0, 0, 1, 1,
-0.4684182, -1.169175, -1.566647, 0, 0, 0, 1, 1,
-0.4682392, -1.055986, -3.361027, 0, 0, 0, 1, 1,
-0.4679385, 0.4962263, -1.405183, 0, 0, 0, 1, 1,
-0.4677377, -2.279965, -3.353362, 0, 0, 0, 1, 1,
-0.4677095, 0.01182792, -2.542574, 0, 0, 0, 1, 1,
-0.4635417, 1.46011, -0.7761929, 1, 1, 1, 1, 1,
-0.462429, 0.8661588, -1.348833, 1, 1, 1, 1, 1,
-0.452657, -1.734135, -2.888642, 1, 1, 1, 1, 1,
-0.4473354, -2.214534, -2.495937, 1, 1, 1, 1, 1,
-0.4370168, -0.5572565, -1.497119, 1, 1, 1, 1, 1,
-0.4349371, 0.6647261, -1.129715, 1, 1, 1, 1, 1,
-0.4296944, 0.9785966, -2.090991, 1, 1, 1, 1, 1,
-0.4250697, -0.4322524, -0.4487553, 1, 1, 1, 1, 1,
-0.4250395, 0.7226734, -0.5452048, 1, 1, 1, 1, 1,
-0.4231851, 1.78707, -1.928502, 1, 1, 1, 1, 1,
-0.4228552, -2.482355, -2.951709, 1, 1, 1, 1, 1,
-0.4225757, -0.1823458, -0.5404133, 1, 1, 1, 1, 1,
-0.4053058, 0.5130329, -2.454629, 1, 1, 1, 1, 1,
-0.4044556, 0.1868542, 2.431787, 1, 1, 1, 1, 1,
-0.4034379, 0.3800725, -1.449472, 1, 1, 1, 1, 1,
-0.4009969, -0.5502984, -3.055207, 0, 0, 1, 1, 1,
-0.3985117, 0.3640526, -0.02374522, 1, 0, 0, 1, 1,
-0.3983967, 0.9109997, -0.1285713, 1, 0, 0, 1, 1,
-0.3976121, -0.8812653, -3.57547, 1, 0, 0, 1, 1,
-0.3957412, 2.783196, -0.7917436, 1, 0, 0, 1, 1,
-0.3955092, -1.187795, -1.444943, 1, 0, 0, 1, 1,
-0.3950273, 0.6199518, -0.1077311, 0, 0, 0, 1, 1,
-0.3894003, 2.01019, 2.037311, 0, 0, 0, 1, 1,
-0.3805456, 0.809724, -0.9434801, 0, 0, 0, 1, 1,
-0.3789431, -0.4789641, -2.783376, 0, 0, 0, 1, 1,
-0.3785727, -0.5113989, -1.972417, 0, 0, 0, 1, 1,
-0.3721269, -1.372405, -3.174444, 0, 0, 0, 1, 1,
-0.3718198, 1.04064, -1.234187, 0, 0, 0, 1, 1,
-0.3687626, 1.026628, -0.1748638, 1, 1, 1, 1, 1,
-0.3676981, -0.5652121, -1.237326, 1, 1, 1, 1, 1,
-0.365366, -1.544268, -3.086419, 1, 1, 1, 1, 1,
-0.3648176, 0.7185004, -0.3334226, 1, 1, 1, 1, 1,
-0.3612817, 0.5325146, -1.343303, 1, 1, 1, 1, 1,
-0.3587933, 0.3233868, -0.5551547, 1, 1, 1, 1, 1,
-0.3571272, -0.1097656, -2.368044, 1, 1, 1, 1, 1,
-0.3528391, 0.5186497, -0.3767962, 1, 1, 1, 1, 1,
-0.346308, 0.1763456, 0.2795712, 1, 1, 1, 1, 1,
-0.3448902, -0.1745837, -4.965842, 1, 1, 1, 1, 1,
-0.3405249, 0.1337529, -1.611421, 1, 1, 1, 1, 1,
-0.3396324, 1.056618, -0.6250001, 1, 1, 1, 1, 1,
-0.3275956, -1.706773, -2.160021, 1, 1, 1, 1, 1,
-0.3273155, -0.3557973, -3.231039, 1, 1, 1, 1, 1,
-0.3201482, 1.200285, -0.4234981, 1, 1, 1, 1, 1,
-0.3195479, -0.1961741, -1.423774, 0, 0, 1, 1, 1,
-0.3191283, -0.9415127, -1.978569, 1, 0, 0, 1, 1,
-0.318205, -1.239385, -2.788407, 1, 0, 0, 1, 1,
-0.3168356, -0.4107637, -2.217489, 1, 0, 0, 1, 1,
-0.3157043, 0.7129708, 2.247343, 1, 0, 0, 1, 1,
-0.3155646, -0.2140492, -2.453188, 1, 0, 0, 1, 1,
-0.3139578, -1.612321, -1.396033, 0, 0, 0, 1, 1,
-0.3118436, 1.37484, -1.136072, 0, 0, 0, 1, 1,
-0.3068017, -0.4269245, -1.405678, 0, 0, 0, 1, 1,
-0.3053602, 0.8734117, 0.02796268, 0, 0, 0, 1, 1,
-0.3049704, 0.1528115, -1.664675, 0, 0, 0, 1, 1,
-0.3016529, -0.3052629, -3.027847, 0, 0, 0, 1, 1,
-0.3015875, 0.5656842, -0.3502041, 0, 0, 0, 1, 1,
-0.2975649, -0.1146576, -1.705097, 1, 1, 1, 1, 1,
-0.2975406, 0.0806805, -0.9372458, 1, 1, 1, 1, 1,
-0.2960368, 0.5098634, 1.921525, 1, 1, 1, 1, 1,
-0.295195, -0.5103006, -3.551613, 1, 1, 1, 1, 1,
-0.2934076, -0.4768156, -0.05989156, 1, 1, 1, 1, 1,
-0.2921069, -0.06886801, -0.71161, 1, 1, 1, 1, 1,
-0.2898384, -0.2617038, -2.328167, 1, 1, 1, 1, 1,
-0.2814276, 0.7059758, 0.2140368, 1, 1, 1, 1, 1,
-0.2811792, -1.209458, -3.680779, 1, 1, 1, 1, 1,
-0.2788989, -1.196319, -2.506317, 1, 1, 1, 1, 1,
-0.2771589, 0.5805783, 0.4708171, 1, 1, 1, 1, 1,
-0.276329, 1.713119, -0.1891489, 1, 1, 1, 1, 1,
-0.2702111, 1.589151, 0.3908184, 1, 1, 1, 1, 1,
-0.2701718, -1.525907, -3.750771, 1, 1, 1, 1, 1,
-0.2691986, 0.1436015, -0.5052518, 1, 1, 1, 1, 1,
-0.2690705, 0.1404463, -0.9328989, 0, 0, 1, 1, 1,
-0.2651885, -0.9131786, -4.056472, 1, 0, 0, 1, 1,
-0.2637663, 0.6100517, -1.499934, 1, 0, 0, 1, 1,
-0.2616205, 0.5351736, -1.064853, 1, 0, 0, 1, 1,
-0.2546177, -1.031002, -3.303335, 1, 0, 0, 1, 1,
-0.2518065, -1.62407, -2.305721, 1, 0, 0, 1, 1,
-0.2514107, -0.8034159, -4.043499, 0, 0, 0, 1, 1,
-0.2498211, -0.3057002, -3.453346, 0, 0, 0, 1, 1,
-0.2400606, -0.9706925, -2.932804, 0, 0, 0, 1, 1,
-0.2389535, -2.115849, -3.839167, 0, 0, 0, 1, 1,
-0.2371832, -0.1150515, -1.427485, 0, 0, 0, 1, 1,
-0.2365532, -1.292012, -3.400708, 0, 0, 0, 1, 1,
-0.2360355, 0.2019981, -0.7581912, 0, 0, 0, 1, 1,
-0.2280008, 0.1881754, -0.9036193, 1, 1, 1, 1, 1,
-0.2185601, -0.1104899, -0.7430259, 1, 1, 1, 1, 1,
-0.2159301, 0.8032486, -0.4398053, 1, 1, 1, 1, 1,
-0.2126054, -0.3943288, -4.057102, 1, 1, 1, 1, 1,
-0.2098483, 0.5611919, 1.745578, 1, 1, 1, 1, 1,
-0.2089754, 0.6279548, 0.4758811, 1, 1, 1, 1, 1,
-0.2085121, 0.07100178, -1.120382, 1, 1, 1, 1, 1,
-0.2061198, -2.481314, -2.992999, 1, 1, 1, 1, 1,
-0.204919, -1.449276, -3.693269, 1, 1, 1, 1, 1,
-0.2034715, 0.0425779, -2.190408, 1, 1, 1, 1, 1,
-0.2030424, -0.6553567, -3.825932, 1, 1, 1, 1, 1,
-0.2026662, -0.9931334, -2.713917, 1, 1, 1, 1, 1,
-0.1966021, -0.2117635, -2.879819, 1, 1, 1, 1, 1,
-0.1962626, 0.2848789, -0.09306479, 1, 1, 1, 1, 1,
-0.1930358, 1.204057, -1.095233, 1, 1, 1, 1, 1,
-0.1918907, -3.10238, -2.354032, 0, 0, 1, 1, 1,
-0.1853891, 0.03182521, -2.001985, 1, 0, 0, 1, 1,
-0.1834621, -1.269414, -3.734142, 1, 0, 0, 1, 1,
-0.1834352, -0.7845169, -2.083425, 1, 0, 0, 1, 1,
-0.1833779, -0.1220876, -3.505667, 1, 0, 0, 1, 1,
-0.1811485, 0.8455039, -1.210904, 1, 0, 0, 1, 1,
-0.1807618, 0.4639546, 1.430664, 0, 0, 0, 1, 1,
-0.177398, -1.441103, -5.119403, 0, 0, 0, 1, 1,
-0.1709596, 1.199951, 0.2046944, 0, 0, 0, 1, 1,
-0.1690322, -1.609874, -3.044256, 0, 0, 0, 1, 1,
-0.165657, 1.200712, 0.4123743, 0, 0, 0, 1, 1,
-0.1641656, 0.5878188, 0.661006, 0, 0, 0, 1, 1,
-0.1607953, 0.06566893, -2.431742, 0, 0, 0, 1, 1,
-0.1582935, -1.362648, -1.44045, 1, 1, 1, 1, 1,
-0.1534542, -0.4569423, -3.317124, 1, 1, 1, 1, 1,
-0.1533034, -0.6679315, -3.438797, 1, 1, 1, 1, 1,
-0.1490197, -0.6279358, -2.634005, 1, 1, 1, 1, 1,
-0.1479008, -0.931917, -2.92698, 1, 1, 1, 1, 1,
-0.145956, -1.158726, -3.198184, 1, 1, 1, 1, 1,
-0.1456155, 2.413262, 0.5765975, 1, 1, 1, 1, 1,
-0.1429552, -0.6014249, -2.259986, 1, 1, 1, 1, 1,
-0.1416447, -1.127501, -3.679064, 1, 1, 1, 1, 1,
-0.1373939, -0.7454787, -1.817023, 1, 1, 1, 1, 1,
-0.1352046, -0.662465, -2.054899, 1, 1, 1, 1, 1,
-0.1317348, -0.06232647, -1.955371, 1, 1, 1, 1, 1,
-0.1250861, 0.8763514, -0.8295448, 1, 1, 1, 1, 1,
-0.122456, 0.5559148, -1.145152, 1, 1, 1, 1, 1,
-0.1205977, 0.3423443, 0.6259128, 1, 1, 1, 1, 1,
-0.1199221, 0.3435532, 0.8066534, 0, 0, 1, 1, 1,
-0.1193235, -1.429769, -2.404223, 1, 0, 0, 1, 1,
-0.1176833, -0.8829334, -2.124965, 1, 0, 0, 1, 1,
-0.1108706, 0.4292787, -0.4276704, 1, 0, 0, 1, 1,
-0.1107581, 0.5826123, 2.52295, 1, 0, 0, 1, 1,
-0.1100263, -2.49754, -3.927371, 1, 0, 0, 1, 1,
-0.1090793, 0.7448149, 1.896315, 0, 0, 0, 1, 1,
-0.1083846, -0.1771005, -2.026096, 0, 0, 0, 1, 1,
-0.09734909, 0.4412889, -0.8664619, 0, 0, 0, 1, 1,
-0.09149637, -0.8122464, -2.95913, 0, 0, 0, 1, 1,
-0.09062928, -0.06935484, -0.9914507, 0, 0, 0, 1, 1,
-0.08636633, -0.5150427, -1.840383, 0, 0, 0, 1, 1,
-0.08579138, -0.4549979, -2.738863, 0, 0, 0, 1, 1,
-0.08455566, -1.466002, -2.011048, 1, 1, 1, 1, 1,
-0.08223937, 1.847557, 0.03533633, 1, 1, 1, 1, 1,
-0.07922098, 0.007937253, -0.7018227, 1, 1, 1, 1, 1,
-0.07902978, -2.080401, -3.491935, 1, 1, 1, 1, 1,
-0.07852042, -0.4050573, -2.271893, 1, 1, 1, 1, 1,
-0.07706361, -0.6631567, -2.536355, 1, 1, 1, 1, 1,
-0.06413005, -0.4729536, -2.865031, 1, 1, 1, 1, 1,
-0.06373873, -0.8486099, -3.032247, 1, 1, 1, 1, 1,
-0.06294902, 0.6595602, 0.8890809, 1, 1, 1, 1, 1,
-0.05874374, 0.9339424, 1.14825, 1, 1, 1, 1, 1,
-0.05555163, -0.0829092, -3.989002, 1, 1, 1, 1, 1,
-0.05502141, -1.091043, -2.694281, 1, 1, 1, 1, 1,
-0.05434464, 1.091941, -1.489744, 1, 1, 1, 1, 1,
-0.04998597, -0.3484423, -4.36273, 1, 1, 1, 1, 1,
-0.04828614, 0.688335, -0.5024034, 1, 1, 1, 1, 1,
-0.04453412, 0.829244, -0.8895899, 0, 0, 1, 1, 1,
-0.04215636, -1.083793, -3.178191, 1, 0, 0, 1, 1,
-0.0406526, -0.3244973, -3.189986, 1, 0, 0, 1, 1,
-0.03742411, -0.7854708, -2.383599, 1, 0, 0, 1, 1,
-0.03318843, -2.402261, -2.094157, 1, 0, 0, 1, 1,
-0.03005251, 0.2260489, -0.7310895, 1, 0, 0, 1, 1,
-0.02483569, -0.2552827, -3.244335, 0, 0, 0, 1, 1,
-0.0240784, 0.4744061, -0.1871057, 0, 0, 0, 1, 1,
-0.02208781, -0.3498831, -2.210016, 0, 0, 0, 1, 1,
-0.01875139, -2.519945, -3.032166, 0, 0, 0, 1, 1,
-0.01818505, -1.635363, -3.363716, 0, 0, 0, 1, 1,
-0.01424063, 0.8203265, -1.35746, 0, 0, 0, 1, 1,
-0.01076327, 1.205638, 0.09436067, 0, 0, 0, 1, 1,
-0.009160775, -0.4262422, -3.003145, 1, 1, 1, 1, 1,
-0.003125121, -0.672182, -4.583183, 1, 1, 1, 1, 1,
-0.002053058, 0.9605993, 0.236242, 1, 1, 1, 1, 1,
-0.0008075343, 0.1974633, 0.1300351, 1, 1, 1, 1, 1,
0.0006815451, -1.171902, 2.815788, 1, 1, 1, 1, 1,
0.006582126, 0.7651713, -2.0054, 1, 1, 1, 1, 1,
0.009052034, -0.5334458, 1.948918, 1, 1, 1, 1, 1,
0.009070024, -1.35197, 4.500025, 1, 1, 1, 1, 1,
0.01159319, -1.848796, 2.837407, 1, 1, 1, 1, 1,
0.012188, 1.169504, 0.6667439, 1, 1, 1, 1, 1,
0.01371662, 0.4803188, -0.02406278, 1, 1, 1, 1, 1,
0.01568458, -0.5981699, 3.688758, 1, 1, 1, 1, 1,
0.01889814, -0.3179792, 4.220383, 1, 1, 1, 1, 1,
0.02063343, -0.5522836, 3.501203, 1, 1, 1, 1, 1,
0.02225646, 0.3223149, 0.4036311, 1, 1, 1, 1, 1,
0.02896948, -0.983301, 3.438179, 0, 0, 1, 1, 1,
0.03706896, 0.3356022, -0.4944869, 1, 0, 0, 1, 1,
0.04625854, 0.008347483, 0.1888648, 1, 0, 0, 1, 1,
0.05770484, -0.1764305, 3.306, 1, 0, 0, 1, 1,
0.06091493, -1.212572, 2.474473, 1, 0, 0, 1, 1,
0.06097567, -0.8671836, 2.737957, 1, 0, 0, 1, 1,
0.06198573, -0.9511864, 1.933301, 0, 0, 0, 1, 1,
0.06508347, -0.7545059, 2.313265, 0, 0, 0, 1, 1,
0.06553703, 1.051595, 1.878568, 0, 0, 0, 1, 1,
0.06822255, 0.349398, 0.8319712, 0, 0, 0, 1, 1,
0.06827478, -0.3434373, 1.997725, 0, 0, 0, 1, 1,
0.07208361, 0.3955149, -2.246837, 0, 0, 0, 1, 1,
0.07475785, -1.0358, 1.241112, 0, 0, 0, 1, 1,
0.07534264, 1.085865, 0.7731254, 1, 1, 1, 1, 1,
0.08023686, -0.4600952, 1.742866, 1, 1, 1, 1, 1,
0.08284202, 1.225014, 0.1674049, 1, 1, 1, 1, 1,
0.08481324, 1.29457, 0.7211905, 1, 1, 1, 1, 1,
0.09093661, 1.016776, 0.3704735, 1, 1, 1, 1, 1,
0.09402912, -2.178529, 3.63291, 1, 1, 1, 1, 1,
0.09457111, -0.3237248, 2.602354, 1, 1, 1, 1, 1,
0.09475473, -0.4917448, 2.72887, 1, 1, 1, 1, 1,
0.0977929, 0.9982647, 1.45953, 1, 1, 1, 1, 1,
0.09827675, 1.099372, 0.1415996, 1, 1, 1, 1, 1,
0.09968309, 0.1503738, 1.133744, 1, 1, 1, 1, 1,
0.1070864, 2.683576, -0.3969052, 1, 1, 1, 1, 1,
0.1094334, -0.3881916, 2.62359, 1, 1, 1, 1, 1,
0.1102016, -0.1631152, 2.598769, 1, 1, 1, 1, 1,
0.1111882, -0.2996647, 4.373719, 1, 1, 1, 1, 1,
0.1125504, 0.6282977, 2.309143, 0, 0, 1, 1, 1,
0.1127274, 1.308003, -0.2993926, 1, 0, 0, 1, 1,
0.1150951, -2.344762, 3.066472, 1, 0, 0, 1, 1,
0.1158579, 0.1370977, -0.2079721, 1, 0, 0, 1, 1,
0.1166641, 1.583758, -2.263058, 1, 0, 0, 1, 1,
0.11701, -0.4614873, 1.79698, 1, 0, 0, 1, 1,
0.1188614, -0.5519201, 3.094316, 0, 0, 0, 1, 1,
0.1190777, -1.375376, 3.790908, 0, 0, 0, 1, 1,
0.1202391, 0.7952207, -2.192358, 0, 0, 0, 1, 1,
0.1224553, 1.002386, -0.2464087, 0, 0, 0, 1, 1,
0.1264971, 0.174677, 2.170953, 0, 0, 0, 1, 1,
0.1293191, -0.7973413, 4.283838, 0, 0, 0, 1, 1,
0.1326724, 0.04651683, 1.878244, 0, 0, 0, 1, 1,
0.1343329, 0.9290356, 0.4668623, 1, 1, 1, 1, 1,
0.1356784, 0.8215389, 0.2046343, 1, 1, 1, 1, 1,
0.1398724, -0.5331093, 2.39487, 1, 1, 1, 1, 1,
0.1399281, -0.3673817, 3.351577, 1, 1, 1, 1, 1,
0.1403736, -1.416472, 3.196142, 1, 1, 1, 1, 1,
0.140828, -0.3625481, 2.355433, 1, 1, 1, 1, 1,
0.1428048, 0.9447492, 1.259815, 1, 1, 1, 1, 1,
0.1434985, -0.4938967, 2.7482, 1, 1, 1, 1, 1,
0.1475719, -1.263394, 4.012267, 1, 1, 1, 1, 1,
0.1511347, -0.9453256, 1.938894, 1, 1, 1, 1, 1,
0.153107, -1.49314, 2.97953, 1, 1, 1, 1, 1,
0.1550795, -1.628724, 2.836476, 1, 1, 1, 1, 1,
0.155709, -0.781598, 3.66708, 1, 1, 1, 1, 1,
0.1568962, 0.5551485, -1.015999, 1, 1, 1, 1, 1,
0.1674395, -1.489338, 3.003299, 1, 1, 1, 1, 1,
0.1746451, 1.723968, -1.505018, 0, 0, 1, 1, 1,
0.1758461, -1.310707, 3.212187, 1, 0, 0, 1, 1,
0.1807592, 0.0004322692, 2.968984, 1, 0, 0, 1, 1,
0.1843611, -0.2109437, 3.436438, 1, 0, 0, 1, 1,
0.1844728, 0.3781281, 1.239674, 1, 0, 0, 1, 1,
0.185223, -0.3868482, 3.252891, 1, 0, 0, 1, 1,
0.1903838, -1.874511, 2.928452, 0, 0, 0, 1, 1,
0.1920128, -0.1396869, 1.972917, 0, 0, 0, 1, 1,
0.1927425, -0.09105634, 2.651545, 0, 0, 0, 1, 1,
0.1936892, 1.3058, 0.7771518, 0, 0, 0, 1, 1,
0.198168, 0.4515245, -0.2875558, 0, 0, 0, 1, 1,
0.201245, -0.3420874, 3.507986, 0, 0, 0, 1, 1,
0.2037677, 0.7755619, -0.3841977, 0, 0, 0, 1, 1,
0.20432, 0.08454795, 0.4654554, 1, 1, 1, 1, 1,
0.2046427, 0.3308867, -1.327832, 1, 1, 1, 1, 1,
0.2088142, 0.1589132, 1.081016, 1, 1, 1, 1, 1,
0.2095379, 0.2526027, 1.620705, 1, 1, 1, 1, 1,
0.2096714, -0.2333087, 1.824209, 1, 1, 1, 1, 1,
0.2113063, 0.8620117, 0.9770433, 1, 1, 1, 1, 1,
0.2124335, 0.9040999, -0.6394508, 1, 1, 1, 1, 1,
0.214767, 0.4339857, 0.3971471, 1, 1, 1, 1, 1,
0.2162672, 0.4967704, 1.750646, 1, 1, 1, 1, 1,
0.2174004, 0.3785686, -0.02377155, 1, 1, 1, 1, 1,
0.2179082, 0.9972527, 0.05724759, 1, 1, 1, 1, 1,
0.2184622, 1.974325, 0.4868149, 1, 1, 1, 1, 1,
0.2197022, 1.198221, -0.1173688, 1, 1, 1, 1, 1,
0.2210795, 0.4601755, -0.4062696, 1, 1, 1, 1, 1,
0.224399, 0.6677468, -0.05868535, 1, 1, 1, 1, 1,
0.2319864, 1.102696, 1.382488, 0, 0, 1, 1, 1,
0.2320003, -0.7420859, 2.208047, 1, 0, 0, 1, 1,
0.2359535, 0.2117362, 1.872524, 1, 0, 0, 1, 1,
0.2402388, -0.1098788, 2.213672, 1, 0, 0, 1, 1,
0.240588, 1.236429, 1.121816, 1, 0, 0, 1, 1,
0.2409661, 0.2061446, 0.05620966, 1, 0, 0, 1, 1,
0.2470987, -0.1559865, 2.559937, 0, 0, 0, 1, 1,
0.2504667, 0.1358881, 0.5700284, 0, 0, 0, 1, 1,
0.2547363, -0.9110039, 3.114878, 0, 0, 0, 1, 1,
0.2614914, -0.03487835, 1.895595, 0, 0, 0, 1, 1,
0.2639733, -0.338732, 2.90847, 0, 0, 0, 1, 1,
0.2679323, -1.763574, 3.796005, 0, 0, 0, 1, 1,
0.2751879, 0.4548214, 1.069263, 0, 0, 0, 1, 1,
0.2763665, 0.9038294, -1.214253, 1, 1, 1, 1, 1,
0.2780105, -0.497011, 3.415686, 1, 1, 1, 1, 1,
0.2785217, -0.4601392, 2.301051, 1, 1, 1, 1, 1,
0.2841418, 0.4326836, -1.314259, 1, 1, 1, 1, 1,
0.2842213, 0.612036, 2.169537, 1, 1, 1, 1, 1,
0.2845435, -0.1610403, 2.122127, 1, 1, 1, 1, 1,
0.2847306, 1.292187, 0.6701483, 1, 1, 1, 1, 1,
0.2884671, 0.7133766, 0.7830335, 1, 1, 1, 1, 1,
0.2940083, -0.5376662, 3.485339, 1, 1, 1, 1, 1,
0.294332, 0.1821248, 2.180012, 1, 1, 1, 1, 1,
0.2951773, 0.9628478, 0.07029537, 1, 1, 1, 1, 1,
0.2995071, 1.341739, -0.6367856, 1, 1, 1, 1, 1,
0.3030975, 0.2404405, 0.8185548, 1, 1, 1, 1, 1,
0.3043183, -1.574369, 2.104041, 1, 1, 1, 1, 1,
0.3085654, 0.2685801, -0.02112227, 1, 1, 1, 1, 1,
0.3108972, 1.776207, -0.3800421, 0, 0, 1, 1, 1,
0.3133643, -1.074991, 3.605545, 1, 0, 0, 1, 1,
0.3152805, 1.552062, 0.2587043, 1, 0, 0, 1, 1,
0.3162939, -1.332591, 1.633784, 1, 0, 0, 1, 1,
0.3172443, -0.02863453, 1.762317, 1, 0, 0, 1, 1,
0.317985, 0.9695829, -0.335219, 1, 0, 0, 1, 1,
0.3185635, -1.069248, 4.7827, 0, 0, 0, 1, 1,
0.3223387, 0.7593464, -1.00468, 0, 0, 0, 1, 1,
0.3225625, 1.260727, -0.1590969, 0, 0, 0, 1, 1,
0.3250614, 0.7444819, -1.014942, 0, 0, 0, 1, 1,
0.3308086, -0.8440647, 2.288634, 0, 0, 0, 1, 1,
0.334541, -0.5599022, 2.980175, 0, 0, 0, 1, 1,
0.3367446, 0.9582568, 0.51066, 0, 0, 0, 1, 1,
0.3422249, -0.3762509, 4.176917, 1, 1, 1, 1, 1,
0.3444005, 1.410419, -0.8994582, 1, 1, 1, 1, 1,
0.3464714, -0.24955, 2.029701, 1, 1, 1, 1, 1,
0.3487426, -0.9941952, 2.676395, 1, 1, 1, 1, 1,
0.3532559, 0.8095014, -0.1319517, 1, 1, 1, 1, 1,
0.3539395, 0.9663955, 0.5179043, 1, 1, 1, 1, 1,
0.357703, -0.2298085, 1.815504, 1, 1, 1, 1, 1,
0.3593003, -0.07810159, 1.188748, 1, 1, 1, 1, 1,
0.3619204, -0.008514673, 0.4545109, 1, 1, 1, 1, 1,
0.3647254, -0.3261179, 1.811363, 1, 1, 1, 1, 1,
0.3674043, 1.068652, -0.4299458, 1, 1, 1, 1, 1,
0.3725857, -2.159712, 3.546573, 1, 1, 1, 1, 1,
0.3774626, -0.9592726, 3.194731, 1, 1, 1, 1, 1,
0.3799137, 1.694891, 1.342577, 1, 1, 1, 1, 1,
0.3818853, 2.754788, 0.7820609, 1, 1, 1, 1, 1,
0.3934887, 0.1533213, 1.389095, 0, 0, 1, 1, 1,
0.3972069, 0.9751174, 0.8209552, 1, 0, 0, 1, 1,
0.4005723, 0.4983172, 0.7047217, 1, 0, 0, 1, 1,
0.4015313, 0.5714497, 1.46689, 1, 0, 0, 1, 1,
0.4097872, 0.2650892, 0.164462, 1, 0, 0, 1, 1,
0.4161985, -0.1532238, 3.509111, 1, 0, 0, 1, 1,
0.4162227, 1.319264, -1.422731, 0, 0, 0, 1, 1,
0.4212786, 0.8981444, -0.06549216, 0, 0, 0, 1, 1,
0.4247868, -1.56612, 2.930995, 0, 0, 0, 1, 1,
0.4256735, 0.3363985, 1.553354, 0, 0, 0, 1, 1,
0.428197, 1.158258, -1.13038, 0, 0, 0, 1, 1,
0.437906, -1.661904, 4.144487, 0, 0, 0, 1, 1,
0.4430248, 0.6541848, 1.294391, 0, 0, 0, 1, 1,
0.4449661, 1.000687, -1.12898, 1, 1, 1, 1, 1,
0.4473045, 0.8993678, 1.734467, 1, 1, 1, 1, 1,
0.4509151, -0.1044638, 2.220323, 1, 1, 1, 1, 1,
0.451479, -1.867338, 1.69402, 1, 1, 1, 1, 1,
0.4526077, 0.5201872, 1.946731, 1, 1, 1, 1, 1,
0.4555241, 2.597008, 0.1790023, 1, 1, 1, 1, 1,
0.4558998, -1.253033, 0.9368363, 1, 1, 1, 1, 1,
0.4572066, -0.07577097, 0.8261662, 1, 1, 1, 1, 1,
0.4600767, 1.744133, 1.346687, 1, 1, 1, 1, 1,
0.4631538, 0.01579386, -0.3864084, 1, 1, 1, 1, 1,
0.4635239, 0.5239697, 0.5249888, 1, 1, 1, 1, 1,
0.4642004, 0.3165697, 0.0285243, 1, 1, 1, 1, 1,
0.4656706, 1.327026, -1.118689, 1, 1, 1, 1, 1,
0.4682197, 1.577354, 1.530295, 1, 1, 1, 1, 1,
0.4692053, -1.402392, 1.214692, 1, 1, 1, 1, 1,
0.4734544, -2.030589, 3.833179, 0, 0, 1, 1, 1,
0.4736714, 0.618101, 0.1257643, 1, 0, 0, 1, 1,
0.4757292, 0.3672707, -0.2131247, 1, 0, 0, 1, 1,
0.4772274, -0.2993815, 2.325039, 1, 0, 0, 1, 1,
0.4809817, -1.118229, 1.740783, 1, 0, 0, 1, 1,
0.4833391, 0.9248122, 0.2267474, 1, 0, 0, 1, 1,
0.4848025, -2.142137, 3.94476, 0, 0, 0, 1, 1,
0.486166, 0.05858257, 2.539988, 0, 0, 0, 1, 1,
0.4917322, -0.08558479, 1.044636, 0, 0, 0, 1, 1,
0.4938312, -0.3431847, 2.420725, 0, 0, 0, 1, 1,
0.4941014, 0.6689193, 1.179575, 0, 0, 0, 1, 1,
0.4955024, 0.3500744, 0.9342904, 0, 0, 0, 1, 1,
0.4985832, 0.1966562, 0.6860239, 0, 0, 0, 1, 1,
0.5000584, 1.13621, -1.166236, 1, 1, 1, 1, 1,
0.5017205, 0.03240807, 2.333669, 1, 1, 1, 1, 1,
0.502112, 1.095159, 1.590726, 1, 1, 1, 1, 1,
0.5030091, 2.570593, -0.9891003, 1, 1, 1, 1, 1,
0.5116522, 0.6121304, 0.6283442, 1, 1, 1, 1, 1,
0.5163867, 0.4121532, -0.2195846, 1, 1, 1, 1, 1,
0.5204763, -0.2076464, 2.111868, 1, 1, 1, 1, 1,
0.5209513, 0.4868402, -0.1543307, 1, 1, 1, 1, 1,
0.5211029, 1.108598, 0.02736979, 1, 1, 1, 1, 1,
0.524522, -1.152394, 2.525831, 1, 1, 1, 1, 1,
0.5257769, 0.2380001, 1.21691, 1, 1, 1, 1, 1,
0.5266733, -0.5813668, 0.9895658, 1, 1, 1, 1, 1,
0.5280608, -0.2050087, 1.639895, 1, 1, 1, 1, 1,
0.5340101, -0.6353192, 1.5818, 1, 1, 1, 1, 1,
0.5493814, 0.2825786, 2.530178, 1, 1, 1, 1, 1,
0.5535366, -1.209277, 2.204234, 0, 0, 1, 1, 1,
0.5539675, 0.193443, 3.143393, 1, 0, 0, 1, 1,
0.5568504, 0.2541809, 1.750205, 1, 0, 0, 1, 1,
0.5609615, 0.5897006, 1.247956, 1, 0, 0, 1, 1,
0.5622502, -0.3118029, 0.3367099, 1, 0, 0, 1, 1,
0.5625196, 0.02143959, 1.66639, 1, 0, 0, 1, 1,
0.5650941, 0.3493576, 0.2409425, 0, 0, 0, 1, 1,
0.5677957, 0.481639, 0.748111, 0, 0, 0, 1, 1,
0.5679278, -0.1374632, 3.006207, 0, 0, 0, 1, 1,
0.5690708, -0.08820874, 0.5415182, 0, 0, 0, 1, 1,
0.5703018, 0.2292744, 0.7898505, 0, 0, 0, 1, 1,
0.5738514, -0.8624274, 2.355582, 0, 0, 0, 1, 1,
0.583388, -1.149074, 1.328659, 0, 0, 0, 1, 1,
0.5873874, -0.502632, 2.654861, 1, 1, 1, 1, 1,
0.5874618, -3.683214, 2.369034, 1, 1, 1, 1, 1,
0.5920349, -1.477436, 1.392047, 1, 1, 1, 1, 1,
0.5956562, 0.7934355, 1.410134, 1, 1, 1, 1, 1,
0.6033146, -1.030708, 0.006884047, 1, 1, 1, 1, 1,
0.6044664, -2.565851, 3.654977, 1, 1, 1, 1, 1,
0.6085658, 0.3564513, 0.2242531, 1, 1, 1, 1, 1,
0.6167318, -0.5939925, 0.9423654, 1, 1, 1, 1, 1,
0.6172836, -0.9230272, 3.408711, 1, 1, 1, 1, 1,
0.6189284, -0.1047772, 0.06607379, 1, 1, 1, 1, 1,
0.6194649, -0.8500121, 3.044742, 1, 1, 1, 1, 1,
0.6234857, -2.424773, 3.653385, 1, 1, 1, 1, 1,
0.6256548, -0.359131, 1.506833, 1, 1, 1, 1, 1,
0.6346715, -1.934127, 1.916208, 1, 1, 1, 1, 1,
0.6398364, -1.280192, 2.218585, 1, 1, 1, 1, 1,
0.6406706, -0.3392307, 0.1919131, 0, 0, 1, 1, 1,
0.6444126, -0.4893449, 1.826425, 1, 0, 0, 1, 1,
0.6461691, -0.1701395, 1.411181, 1, 0, 0, 1, 1,
0.6501744, -0.4630116, 1.957578, 1, 0, 0, 1, 1,
0.6522256, -1.944146, 0.8151914, 1, 0, 0, 1, 1,
0.652261, -0.3216597, 2.42234, 1, 0, 0, 1, 1,
0.6551746, -0.2310288, 1.807774, 0, 0, 0, 1, 1,
0.6567175, -0.2893676, 1.573765, 0, 0, 0, 1, 1,
0.6648638, 0.4500002, 2.825078, 0, 0, 0, 1, 1,
0.6655865, -0.2455153, 3.267259, 0, 0, 0, 1, 1,
0.6709968, 0.059686, 1.575161, 0, 0, 0, 1, 1,
0.6722291, -1.878795, 4.118857, 0, 0, 0, 1, 1,
0.6766923, -0.3335987, 2.733571, 0, 0, 0, 1, 1,
0.6775493, -0.7437299, 2.239749, 1, 1, 1, 1, 1,
0.6799895, -0.08913903, 0.2929046, 1, 1, 1, 1, 1,
0.6808908, -0.04120598, 2.912433, 1, 1, 1, 1, 1,
0.6811994, 0.6331406, 0.2817292, 1, 1, 1, 1, 1,
0.6821454, -1.056585, 2.367284, 1, 1, 1, 1, 1,
0.6829672, 0.2008139, 1.778023, 1, 1, 1, 1, 1,
0.6837916, 0.7510292, 1.224634, 1, 1, 1, 1, 1,
0.6862261, -1.181005, 2.161873, 1, 1, 1, 1, 1,
0.6921237, 1.019221, -0.8347534, 1, 1, 1, 1, 1,
0.6935909, -0.5020412, 0.5032597, 1, 1, 1, 1, 1,
0.7007477, -1.524485, 0.9984124, 1, 1, 1, 1, 1,
0.7031628, 0.02104214, 2.893094, 1, 1, 1, 1, 1,
0.7070646, 0.5319034, 1.200065, 1, 1, 1, 1, 1,
0.7075858, 0.3175789, 1.274792, 1, 1, 1, 1, 1,
0.7129105, -0.7663448, 1.488343, 1, 1, 1, 1, 1,
0.7173157, -0.747805, 3.879763, 0, 0, 1, 1, 1,
0.7177655, 0.6864051, -0.1784847, 1, 0, 0, 1, 1,
0.7216709, -0.7929224, 1.86228, 1, 0, 0, 1, 1,
0.7265898, -0.07919398, 2.466939, 1, 0, 0, 1, 1,
0.7433726, -1.509814, 2.586779, 1, 0, 0, 1, 1,
0.7438641, -0.3280692, 1.280809, 1, 0, 0, 1, 1,
0.7453051, 0.2659386, 1.940911, 0, 0, 0, 1, 1,
0.7456096, -1.619639, 4.647924, 0, 0, 0, 1, 1,
0.7543933, -1.309209, 4.248876, 0, 0, 0, 1, 1,
0.7551585, -3.513599, 2.77293, 0, 0, 0, 1, 1,
0.7592221, -0.4511589, 1.723994, 0, 0, 0, 1, 1,
0.7604194, 1.097269, 0.008498414, 0, 0, 0, 1, 1,
0.7662839, 0.6333193, 0.0695775, 0, 0, 0, 1, 1,
0.7720951, -0.9865286, 1.710555, 1, 1, 1, 1, 1,
0.7799636, 0.1137714, -0.6561015, 1, 1, 1, 1, 1,
0.7818034, -1.462571, 2.194558, 1, 1, 1, 1, 1,
0.7883468, -0.428842, 3.529186, 1, 1, 1, 1, 1,
0.7902011, 0.838378, 1.717882, 1, 1, 1, 1, 1,
0.7946743, -0.3742387, 1.380718, 1, 1, 1, 1, 1,
0.7948075, -0.5619669, 2.962056, 1, 1, 1, 1, 1,
0.8025666, 0.7194865, -0.1424845, 1, 1, 1, 1, 1,
0.8032211, -1.389243, 2.031763, 1, 1, 1, 1, 1,
0.8049446, -1.356682, 3.127267, 1, 1, 1, 1, 1,
0.8111522, 0.8184018, 3.485228, 1, 1, 1, 1, 1,
0.8183605, 1.66276, 0.8600485, 1, 1, 1, 1, 1,
0.823055, 2.033482, 3.891622, 1, 1, 1, 1, 1,
0.8307915, -0.4419487, 1.293871, 1, 1, 1, 1, 1,
0.8346367, -0.4595682, 3.109112, 1, 1, 1, 1, 1,
0.836625, -0.4661598, 3.489654, 0, 0, 1, 1, 1,
0.8372895, 0.2685115, 1.777121, 1, 0, 0, 1, 1,
0.8397987, 0.2518744, 3.24428, 1, 0, 0, 1, 1,
0.8405744, 1.331639, 1.149811, 1, 0, 0, 1, 1,
0.8427183, -0.6488855, 2.802917, 1, 0, 0, 1, 1,
0.8447471, 0.4431649, 1.258442, 1, 0, 0, 1, 1,
0.8489461, 0.5823061, 0.808942, 0, 0, 0, 1, 1,
0.8535857, -1.097229, 2.311189, 0, 0, 0, 1, 1,
0.8570669, -1.264408, 3.055823, 0, 0, 0, 1, 1,
0.8601896, 0.8861413, -0.5968219, 0, 0, 0, 1, 1,
0.8605453, 0.4605719, 0.5225672, 0, 0, 0, 1, 1,
0.8637819, -0.9746783, 3.327186, 0, 0, 0, 1, 1,
0.8651145, 0.6175495, 1.866264, 0, 0, 0, 1, 1,
0.8662603, 0.9120211, 0.5924666, 1, 1, 1, 1, 1,
0.8664802, 0.05190971, 1.102658, 1, 1, 1, 1, 1,
0.8684908, 1.154655, 0.3006855, 1, 1, 1, 1, 1,
0.8690459, 1.016068, 1.416287, 1, 1, 1, 1, 1,
0.8713421, -0.6244704, 1.433835, 1, 1, 1, 1, 1,
0.8830211, 1.999423, 1.851558, 1, 1, 1, 1, 1,
0.8834262, -1.808137, 1.886584, 1, 1, 1, 1, 1,
0.8860083, 1.730773, 0.8117481, 1, 1, 1, 1, 1,
0.8873597, 0.6444732, -0.2966111, 1, 1, 1, 1, 1,
0.8897471, 0.2741196, 0.7536511, 1, 1, 1, 1, 1,
0.8973317, -1.20005, 2.643809, 1, 1, 1, 1, 1,
0.8999522, -0.6672052, 2.596638, 1, 1, 1, 1, 1,
0.9028882, 0.1247844, -0.1629387, 1, 1, 1, 1, 1,
0.9048595, 1.593538, -1.123274, 1, 1, 1, 1, 1,
0.9109873, -0.1093643, 0.05796563, 1, 1, 1, 1, 1,
0.9145131, -0.7015079, 1.285647, 0, 0, 1, 1, 1,
0.9158986, 0.9849984, -0.5451654, 1, 0, 0, 1, 1,
0.9205872, 1.315887, 0.9308829, 1, 0, 0, 1, 1,
0.9209667, 0.2632313, 1.305217, 1, 0, 0, 1, 1,
0.9251551, 1.128014, 0.1600024, 1, 0, 0, 1, 1,
0.9270532, -0.2942839, 1.584063, 1, 0, 0, 1, 1,
0.9272256, 0.3582051, 0.7446976, 0, 0, 0, 1, 1,
0.9340613, 0.8068549, 1.991721, 0, 0, 0, 1, 1,
0.9448743, -0.0463458, 1.915347, 0, 0, 0, 1, 1,
0.9461513, 0.09299468, 0.6327843, 0, 0, 0, 1, 1,
0.9554587, 0.1902221, 1.197222, 0, 0, 0, 1, 1,
0.956665, 0.6838315, 0.5043837, 0, 0, 0, 1, 1,
0.9608521, -1.659742, 4.00322, 0, 0, 0, 1, 1,
0.9663833, 0.566451, 1.128536, 1, 1, 1, 1, 1,
0.9867303, -1.375161, 3.271468, 1, 1, 1, 1, 1,
0.9867725, -0.3248211, 2.730185, 1, 1, 1, 1, 1,
0.9887114, 0.003981601, 0.8709644, 1, 1, 1, 1, 1,
0.9979628, 0.1135886, 1.509249, 1, 1, 1, 1, 1,
1.000802, 1.504027, 1.447875, 1, 1, 1, 1, 1,
1.002163, 0.8247272, 1.5921, 1, 1, 1, 1, 1,
1.00301, -1.255579, 3.841863, 1, 1, 1, 1, 1,
1.003081, 1.227009, 1.434593, 1, 1, 1, 1, 1,
1.00638, 0.03445194, 0.9636624, 1, 1, 1, 1, 1,
1.009125, 0.3780927, 1.99175, 1, 1, 1, 1, 1,
1.011411, -0.7283069, 2.664231, 1, 1, 1, 1, 1,
1.011523, 0.3407137, 0.6257302, 1, 1, 1, 1, 1,
1.013489, 0.2538183, 0.4385503, 1, 1, 1, 1, 1,
1.019853, -2.375399, 3.648044, 1, 1, 1, 1, 1,
1.02535, 0.4716718, -0.1788984, 0, 0, 1, 1, 1,
1.02586, -0.7773428, 2.770833, 1, 0, 0, 1, 1,
1.027315, 0.561437, 1.480352, 1, 0, 0, 1, 1,
1.036178, -0.1865675, 3.158201, 1, 0, 0, 1, 1,
1.037984, 0.9532649, 0.7097877, 1, 0, 0, 1, 1,
1.040666, 2.54182, -0.5084465, 1, 0, 0, 1, 1,
1.041383, 0.5816253, 0.07958969, 0, 0, 0, 1, 1,
1.049454, -0.0663946, 0.261281, 0, 0, 0, 1, 1,
1.053674, 1.058921, 0.9065334, 0, 0, 0, 1, 1,
1.057412, 2.667061, -0.2511806, 0, 0, 0, 1, 1,
1.057941, -0.4210934, 1.165427, 0, 0, 0, 1, 1,
1.062714, 1.228304, 3.069804, 0, 0, 0, 1, 1,
1.064818, 0.0816007, 0.2154713, 0, 0, 0, 1, 1,
1.07988, 0.3550709, 0.1442923, 1, 1, 1, 1, 1,
1.08407, 0.5951253, 0.9074434, 1, 1, 1, 1, 1,
1.084424, -0.4888439, 2.456418, 1, 1, 1, 1, 1,
1.086139, -0.9723913, 1.988799, 1, 1, 1, 1, 1,
1.089646, 1.994064, 1.626034, 1, 1, 1, 1, 1,
1.097008, -0.2296656, 2.930453, 1, 1, 1, 1, 1,
1.10347, -1.113271, 1.647256, 1, 1, 1, 1, 1,
1.103981, 1.494368, 0.3504333, 1, 1, 1, 1, 1,
1.113727, -1.131119, 2.077138, 1, 1, 1, 1, 1,
1.119748, 2.888783, 0.1346582, 1, 1, 1, 1, 1,
1.125328, -0.3717793, 3.062076, 1, 1, 1, 1, 1,
1.128094, 0.7634104, 0.2309567, 1, 1, 1, 1, 1,
1.134285, 0.3548512, 2.177303, 1, 1, 1, 1, 1,
1.144597, -1.286659, 1.13132, 1, 1, 1, 1, 1,
1.152728, -0.6994323, 1.325763, 1, 1, 1, 1, 1,
1.154322, -0.2602637, 0.6685151, 0, 0, 1, 1, 1,
1.163323, 0.4424295, -0.7949226, 1, 0, 0, 1, 1,
1.168573, 0.6900706, 0.4618531, 1, 0, 0, 1, 1,
1.175419, -1.219333, 3.43731, 1, 0, 0, 1, 1,
1.176454, 1.307327, 2.293535, 1, 0, 0, 1, 1,
1.177219, 0.1709797, 3.879757, 1, 0, 0, 1, 1,
1.179454, 0.2354012, -0.2056554, 0, 0, 0, 1, 1,
1.179788, 0.3142295, 0.5890038, 0, 0, 0, 1, 1,
1.184698, -0.8689055, 1.815275, 0, 0, 0, 1, 1,
1.187807, -1.097514, 3.2048, 0, 0, 0, 1, 1,
1.194752, -0.529496, 3.313096, 0, 0, 0, 1, 1,
1.197633, 0.2960704, 3.232746, 0, 0, 0, 1, 1,
1.198744, 0.285475, 1.323281, 0, 0, 0, 1, 1,
1.199655, 0.04803988, 1.142685, 1, 1, 1, 1, 1,
1.200327, 0.4248396, 0.4730936, 1, 1, 1, 1, 1,
1.210417, -1.282741, 3.266055, 1, 1, 1, 1, 1,
1.213668, -0.1375315, 2.908206, 1, 1, 1, 1, 1,
1.215019, 0.2233933, 1.73871, 1, 1, 1, 1, 1,
1.222803, 1.572225, 2.228052, 1, 1, 1, 1, 1,
1.223804, 0.1248775, 0.9927392, 1, 1, 1, 1, 1,
1.235325, 0.7382006, 0.4533922, 1, 1, 1, 1, 1,
1.237442, -0.08288199, 0.6544645, 1, 1, 1, 1, 1,
1.242146, -0.9158827, 3.995754, 1, 1, 1, 1, 1,
1.243389, -0.683962, 1.784675, 1, 1, 1, 1, 1,
1.247208, -1.986106, 1.264339, 1, 1, 1, 1, 1,
1.256465, 1.369246, 2.153827, 1, 1, 1, 1, 1,
1.256881, 1.002911, 0.4020828, 1, 1, 1, 1, 1,
1.257598, 1.014856, 1.281925, 1, 1, 1, 1, 1,
1.261464, -1.360052, 2.98686, 0, 0, 1, 1, 1,
1.26174, -2.536511, 0.4577871, 1, 0, 0, 1, 1,
1.262602, 1.88598, 2.626224, 1, 0, 0, 1, 1,
1.263101, 0.4286005, 1.722243, 1, 0, 0, 1, 1,
1.264103, 0.07621447, 1.515266, 1, 0, 0, 1, 1,
1.266658, -0.1072932, 2.293817, 1, 0, 0, 1, 1,
1.272284, -1.637238, 2.180159, 0, 0, 0, 1, 1,
1.274332, 0.3087638, 2.589506, 0, 0, 0, 1, 1,
1.278196, 0.2442146, 2.883066, 0, 0, 0, 1, 1,
1.279313, 0.4637704, 0.1774618, 0, 0, 0, 1, 1,
1.2823, 1.001715, -0.6609659, 0, 0, 0, 1, 1,
1.284604, 0.5462808, 0.5520124, 0, 0, 0, 1, 1,
1.288064, 0.9037993, 1.490592, 0, 0, 0, 1, 1,
1.289177, -0.04593525, 1.630041, 1, 1, 1, 1, 1,
1.289918, 0.8523705, -0.3706786, 1, 1, 1, 1, 1,
1.292493, -0.8275291, 2.449527, 1, 1, 1, 1, 1,
1.297933, 1.636806, 0.01005922, 1, 1, 1, 1, 1,
1.29863, -0.2256263, 0.5308225, 1, 1, 1, 1, 1,
1.314824, -0.07725135, 0.110316, 1, 1, 1, 1, 1,
1.327062, 0.5611862, 1.526183, 1, 1, 1, 1, 1,
1.330493, 0.5551195, 4.398111, 1, 1, 1, 1, 1,
1.339933, 0.559178, 1.299806, 1, 1, 1, 1, 1,
1.367489, -1.724725, 1.910154, 1, 1, 1, 1, 1,
1.369234, -0.6195809, 1.339669, 1, 1, 1, 1, 1,
1.369733, 0.7662651, 1.564316, 1, 1, 1, 1, 1,
1.372232, -0.5914439, 1.424421, 1, 1, 1, 1, 1,
1.373853, 1.001121, 1.442768, 1, 1, 1, 1, 1,
1.382788, 0.2785784, 1.96122, 1, 1, 1, 1, 1,
1.392565, 1.018666, 0.7199692, 0, 0, 1, 1, 1,
1.40076, -0.7687368, 3.926752, 1, 0, 0, 1, 1,
1.41283, -0.3487292, 3.121486, 1, 0, 0, 1, 1,
1.414654, -1.641546, 1.186588, 1, 0, 0, 1, 1,
1.423612, 0.2299681, 1.550972, 1, 0, 0, 1, 1,
1.425839, 0.1587458, 0.4498486, 1, 0, 0, 1, 1,
1.425963, 0.06376679, 0.2659444, 0, 0, 0, 1, 1,
1.428931, -0.1343722, 1.040998, 0, 0, 0, 1, 1,
1.432219, -1.810423, 2.154725, 0, 0, 0, 1, 1,
1.436175, 1.075383, 1.146948, 0, 0, 0, 1, 1,
1.44201, 0.04145044, 0.4970533, 0, 0, 0, 1, 1,
1.445553, -1.13333, 1.401109, 0, 0, 0, 1, 1,
1.445787, 1.529689, 1.720281, 0, 0, 0, 1, 1,
1.46426, 1.069623, -0.1710185, 1, 1, 1, 1, 1,
1.470556, -0.3351218, 2.659536, 1, 1, 1, 1, 1,
1.470625, -0.02779866, 1.605618, 1, 1, 1, 1, 1,
1.473843, 0.9141119, -0.381692, 1, 1, 1, 1, 1,
1.475391, 1.421842, 0.04236695, 1, 1, 1, 1, 1,
1.487849, -0.4924343, 4.257601, 1, 1, 1, 1, 1,
1.492927, 0.4671194, 1.245487, 1, 1, 1, 1, 1,
1.523554, 0.9781522, 1.151006, 1, 1, 1, 1, 1,
1.524075, 0.3058085, -0.5224608, 1, 1, 1, 1, 1,
1.528934, 0.09055581, 2.301962, 1, 1, 1, 1, 1,
1.530263, 0.8375339, 2.256955, 1, 1, 1, 1, 1,
1.535986, 0.2888476, 0.6291297, 1, 1, 1, 1, 1,
1.548221, -1.262905, 3.624328, 1, 1, 1, 1, 1,
1.565856, -2.237449, 2.675102, 1, 1, 1, 1, 1,
1.569959, -1.632635, 3.491573, 1, 1, 1, 1, 1,
1.573018, -0.2360486, 2.756293, 0, 0, 1, 1, 1,
1.577067, 0.03023807, 1.632839, 1, 0, 0, 1, 1,
1.582491, -2.110363, 2.403152, 1, 0, 0, 1, 1,
1.585606, -1.611593, 2.352722, 1, 0, 0, 1, 1,
1.58707, -0.7853011, 4.434427, 1, 0, 0, 1, 1,
1.594447, 0.3735777, 0.9672354, 1, 0, 0, 1, 1,
1.594623, 0.189759, 0.1696361, 0, 0, 0, 1, 1,
1.636743, -0.6466705, 1.849555, 0, 0, 0, 1, 1,
1.637408, 0.3284268, 2.010278, 0, 0, 0, 1, 1,
1.640013, -0.6652855, 1.345708, 0, 0, 0, 1, 1,
1.646224, -0.369351, 2.045738, 0, 0, 0, 1, 1,
1.663611, -2.155277, 3.305834, 0, 0, 0, 1, 1,
1.686625, -0.7284103, 2.842013, 0, 0, 0, 1, 1,
1.703321, 0.6524442, 2.042442, 1, 1, 1, 1, 1,
1.724164, -0.5845609, 0.9280039, 1, 1, 1, 1, 1,
1.724408, -0.128876, 2.617981, 1, 1, 1, 1, 1,
1.741623, -0.284103, 1.811539, 1, 1, 1, 1, 1,
1.754651, -0.4431406, 2.293964, 1, 1, 1, 1, 1,
1.770768, -2.323399, 1.938624, 1, 1, 1, 1, 1,
1.772654, 0.1494727, -0.5177007, 1, 1, 1, 1, 1,
1.777103, -0.4212669, 1.436654, 1, 1, 1, 1, 1,
1.779976, 0.8276127, 2.541427, 1, 1, 1, 1, 1,
1.786103, -1.125406, 3.971281, 1, 1, 1, 1, 1,
1.793156, -0.3224395, 1.452764, 1, 1, 1, 1, 1,
1.795956, 0.4170175, 1.158139, 1, 1, 1, 1, 1,
1.813122, 0.01771897, 1.771696, 1, 1, 1, 1, 1,
1.815195, 0.2332876, 3.309474, 1, 1, 1, 1, 1,
1.852881, 0.5094054, 2.718614, 1, 1, 1, 1, 1,
1.864224, 0.08007922, 1.388319, 0, 0, 1, 1, 1,
1.86642, 0.814385, 1.648578, 1, 0, 0, 1, 1,
1.885188, -1.113329, 0.6531571, 1, 0, 0, 1, 1,
1.895134, -0.4373818, 0.6333472, 1, 0, 0, 1, 1,
1.930812, -0.6459399, 2.482277, 1, 0, 0, 1, 1,
1.957676, -0.08318365, 0.7402332, 1, 0, 0, 1, 1,
2.077509, 0.1720569, 3.198308, 0, 0, 0, 1, 1,
2.082167, -0.270523, 1.292206, 0, 0, 0, 1, 1,
2.0832, -0.5713463, 1.921969, 0, 0, 0, 1, 1,
2.09309, 1.533194, 1.254787, 0, 0, 0, 1, 1,
2.162679, 0.3513241, 0.1205162, 0, 0, 0, 1, 1,
2.260283, -0.3663512, 2.325654, 0, 0, 0, 1, 1,
2.326649, 1.274451, 0.9518519, 0, 0, 0, 1, 1,
2.332969, -0.3779914, 3.451804, 1, 1, 1, 1, 1,
2.367964, 0.1338321, 1.307574, 1, 1, 1, 1, 1,
2.391239, -0.1419669, 1.245151, 1, 1, 1, 1, 1,
2.402366, 2.137108, 0.9143768, 1, 1, 1, 1, 1,
2.711177, 0.7939268, 0.7546605, 1, 1, 1, 1, 1,
2.718347, 0.05842133, 1.47756, 1, 1, 1, 1, 1,
2.867965, -1.404837, 3.033385, 1, 1, 1, 1, 1
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
var radius = 9.359548;
var distance = 32.87501;
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
mvMatrix.translate( 0.4178636, 0.3972155, 0.1888595 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.87501);
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
