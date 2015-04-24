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
-3.321652, -0.4956262, -2.786762, 1, 0, 0, 1,
-3.166513, -0.07914878, -1.971268, 1, 0.007843138, 0, 1,
-3.032997, -1.472912, -1.575158, 1, 0.01176471, 0, 1,
-2.765825, -0.5067346, -3.118289, 1, 0.01960784, 0, 1,
-2.760954, -0.2111745, -1.28864, 1, 0.02352941, 0, 1,
-2.746184, -0.8317949, -2.963061, 1, 0.03137255, 0, 1,
-2.706481, -1.119447, -3.210376, 1, 0.03529412, 0, 1,
-2.549252, 0.3082563, -1.226921, 1, 0.04313726, 0, 1,
-2.482201, 0.7864625, -1.514145, 1, 0.04705882, 0, 1,
-2.454379, -0.5051529, -1.610369, 1, 0.05490196, 0, 1,
-2.337981, -0.5043674, -1.188405, 1, 0.05882353, 0, 1,
-2.277057, -1.819518, -3.516999, 1, 0.06666667, 0, 1,
-2.260378, -1.697218, -3.10977, 1, 0.07058824, 0, 1,
-2.183009, 1.45457, -1.275123, 1, 0.07843138, 0, 1,
-2.162173, 0.7352095, -2.031357, 1, 0.08235294, 0, 1,
-2.147094, -0.169655, -1.14582, 1, 0.09019608, 0, 1,
-2.131821, -1.188435, -3.043159, 1, 0.09411765, 0, 1,
-2.106507, -1.395602, -1.140167, 1, 0.1019608, 0, 1,
-2.088062, 0.2881834, 0.3153197, 1, 0.1098039, 0, 1,
-2.079003, -0.5356846, -1.185973, 1, 0.1137255, 0, 1,
-2.076706, 0.1736264, -1.727799, 1, 0.1215686, 0, 1,
-2.033405, 0.9873456, -1.05128, 1, 0.1254902, 0, 1,
-2.025954, 2.13506, -0.1005282, 1, 0.1333333, 0, 1,
-2.00641, -0.4662974, -3.631171, 1, 0.1372549, 0, 1,
-2.000262, -0.2792273, -0.9181148, 1, 0.145098, 0, 1,
-1.970923, -0.4555965, -3.071264, 1, 0.1490196, 0, 1,
-1.949307, -2.116507, -2.669164, 1, 0.1568628, 0, 1,
-1.948603, 0.04112916, -0.8554076, 1, 0.1607843, 0, 1,
-1.939065, -0.4947725, -2.380589, 1, 0.1686275, 0, 1,
-1.935971, -1.019147, -2.127402, 1, 0.172549, 0, 1,
-1.910306, 0.8772394, 1.332862, 1, 0.1803922, 0, 1,
-1.907592, 0.2200594, -2.495706, 1, 0.1843137, 0, 1,
-1.894324, -0.4258327, -1.395631, 1, 0.1921569, 0, 1,
-1.876127, 1.110797, -1.921074, 1, 0.1960784, 0, 1,
-1.855487, -0.8247115, -0.6942182, 1, 0.2039216, 0, 1,
-1.844615, 0.8015303, 0.5078911, 1, 0.2117647, 0, 1,
-1.827478, 0.2177854, -1.742505, 1, 0.2156863, 0, 1,
-1.823109, 0.4828173, -2.221719, 1, 0.2235294, 0, 1,
-1.822778, 0.4991834, -0.4488829, 1, 0.227451, 0, 1,
-1.820276, 0.01777639, -0.6819463, 1, 0.2352941, 0, 1,
-1.812835, 0.9399422, -1.12292, 1, 0.2392157, 0, 1,
-1.800987, -0.9411829, -0.9653367, 1, 0.2470588, 0, 1,
-1.799558, 0.6039067, -1.946288, 1, 0.2509804, 0, 1,
-1.79695, -0.2026023, -0.9426134, 1, 0.2588235, 0, 1,
-1.79452, 0.9586617, -1.207519, 1, 0.2627451, 0, 1,
-1.787548, 0.3281932, -2.935887, 1, 0.2705882, 0, 1,
-1.778025, 0.2665362, -1.63344, 1, 0.2745098, 0, 1,
-1.770204, 1.137056, 0.03589333, 1, 0.282353, 0, 1,
-1.754844, 0.9324612, -2.079351, 1, 0.2862745, 0, 1,
-1.742173, 0.2736716, -1.03005, 1, 0.2941177, 0, 1,
-1.741684, -0.04512557, -1.754788, 1, 0.3019608, 0, 1,
-1.736401, -1.088927, -3.587202, 1, 0.3058824, 0, 1,
-1.720176, -0.5269721, -0.784168, 1, 0.3137255, 0, 1,
-1.67906, -1.482259, -0.8205739, 1, 0.3176471, 0, 1,
-1.66748, -0.0627342, -1.271781, 1, 0.3254902, 0, 1,
-1.651945, -0.558618, -2.83967, 1, 0.3294118, 0, 1,
-1.629233, -0.8664825, -0.4769892, 1, 0.3372549, 0, 1,
-1.624595, -0.4351991, -2.029849, 1, 0.3411765, 0, 1,
-1.613921, -2.040049, -0.7334618, 1, 0.3490196, 0, 1,
-1.610233, 0.5390383, -1.085315, 1, 0.3529412, 0, 1,
-1.576353, -1.124774, -0.1009149, 1, 0.3607843, 0, 1,
-1.563732, 0.5206698, -2.908119, 1, 0.3647059, 0, 1,
-1.550971, -1.110916, -1.742889, 1, 0.372549, 0, 1,
-1.550041, 0.406168, -2.130687, 1, 0.3764706, 0, 1,
-1.533162, 0.2460799, -0.818931, 1, 0.3843137, 0, 1,
-1.526676, 0.2250858, -2.986232, 1, 0.3882353, 0, 1,
-1.525394, 1.6185, -1.605165, 1, 0.3960784, 0, 1,
-1.5187, -0.7162949, -2.041775, 1, 0.4039216, 0, 1,
-1.518602, 0.359137, -1.288625, 1, 0.4078431, 0, 1,
-1.517152, -0.2042689, -2.258645, 1, 0.4156863, 0, 1,
-1.512677, -1.440914, -3.796241, 1, 0.4196078, 0, 1,
-1.495829, 0.3279839, 0.4310327, 1, 0.427451, 0, 1,
-1.487417, -0.7528985, -2.410281, 1, 0.4313726, 0, 1,
-1.484843, 1.585252, 0.3988223, 1, 0.4392157, 0, 1,
-1.484783, 1.743558, -0.9575732, 1, 0.4431373, 0, 1,
-1.478611, 2.768322, -0.04009071, 1, 0.4509804, 0, 1,
-1.476603, -0.8343729, -2.274523, 1, 0.454902, 0, 1,
-1.473721, -1.150176, -1.044798, 1, 0.4627451, 0, 1,
-1.473595, 0.4837186, -1.857041, 1, 0.4666667, 0, 1,
-1.466552, 0.1571208, -2.788004, 1, 0.4745098, 0, 1,
-1.462434, -0.6848963, -1.419052, 1, 0.4784314, 0, 1,
-1.460396, -0.9282342, -1.01916, 1, 0.4862745, 0, 1,
-1.448609, 0.8597731, 0.3279664, 1, 0.4901961, 0, 1,
-1.424118, 0.1022734, -4.403414, 1, 0.4980392, 0, 1,
-1.41685, 1.633661, -0.3137487, 1, 0.5058824, 0, 1,
-1.395574, -0.565572, -0.3178473, 1, 0.509804, 0, 1,
-1.390677, 0.3862469, -2.624858, 1, 0.5176471, 0, 1,
-1.387996, 0.5232037, -0.9375947, 1, 0.5215687, 0, 1,
-1.38335, -1.07828, -2.43399, 1, 0.5294118, 0, 1,
-1.380392, 0.121714, -2.478059, 1, 0.5333334, 0, 1,
-1.379278, 0.1039232, -2.603805, 1, 0.5411765, 0, 1,
-1.378581, -0.7968611, -2.047098, 1, 0.5450981, 0, 1,
-1.347332, -0.06716917, -1.3451, 1, 0.5529412, 0, 1,
-1.343868, 1.730538, -0.1278889, 1, 0.5568628, 0, 1,
-1.341913, -1.071888, -3.753361, 1, 0.5647059, 0, 1,
-1.335962, 0.5776236, -0.999754, 1, 0.5686275, 0, 1,
-1.33505, -0.1944106, -1.937323, 1, 0.5764706, 0, 1,
-1.332952, -0.2689575, -0.8519278, 1, 0.5803922, 0, 1,
-1.320043, 0.4362478, -2.363962, 1, 0.5882353, 0, 1,
-1.315096, -2.234174, -5.002908, 1, 0.5921569, 0, 1,
-1.312486, 0.04994014, -1.738813, 1, 0.6, 0, 1,
-1.307871, 0.1887942, -0.2770434, 1, 0.6078432, 0, 1,
-1.290297, 0.5722999, -1.021501, 1, 0.6117647, 0, 1,
-1.284433, 0.463524, -1.696803, 1, 0.6196079, 0, 1,
-1.281536, -0.5931146, -4.076889, 1, 0.6235294, 0, 1,
-1.273645, 1.610811, -0.0149245, 1, 0.6313726, 0, 1,
-1.268168, -0.9033205, -1.8595, 1, 0.6352941, 0, 1,
-1.265075, -2.980977, -3.566933, 1, 0.6431373, 0, 1,
-1.259856, -0.3110971, -2.669899, 1, 0.6470588, 0, 1,
-1.25644, -0.3174364, -2.070218, 1, 0.654902, 0, 1,
-1.253487, -0.9966502, -2.092712, 1, 0.6588235, 0, 1,
-1.251739, -0.5623986, -3.216176, 1, 0.6666667, 0, 1,
-1.239922, -0.1426312, -0.7856243, 1, 0.6705883, 0, 1,
-1.238674, 1.341456, -0.2761547, 1, 0.6784314, 0, 1,
-1.229105, -1.562137, -1.175597, 1, 0.682353, 0, 1,
-1.226026, -1.744276, -2.418339, 1, 0.6901961, 0, 1,
-1.22464, -0.936744, -0.2249246, 1, 0.6941177, 0, 1,
-1.222449, 2.198636, -0.4204378, 1, 0.7019608, 0, 1,
-1.222042, -0.6175047, -2.595639, 1, 0.7098039, 0, 1,
-1.214787, -0.8175612, -1.446128, 1, 0.7137255, 0, 1,
-1.210507, -0.5477083, -0.018877, 1, 0.7215686, 0, 1,
-1.202526, 0.4837227, -2.314902, 1, 0.7254902, 0, 1,
-1.201193, 0.7648103, 0.4090919, 1, 0.7333333, 0, 1,
-1.197642, -0.2992285, -1.935328, 1, 0.7372549, 0, 1,
-1.188051, -0.7613849, -2.549688, 1, 0.7450981, 0, 1,
-1.177396, -0.2883427, -2.051801, 1, 0.7490196, 0, 1,
-1.176403, 0.6548987, -0.5054166, 1, 0.7568628, 0, 1,
-1.175727, -1.676973, -0.9990186, 1, 0.7607843, 0, 1,
-1.165765, -0.09629726, -2.673044, 1, 0.7686275, 0, 1,
-1.162521, 0.3392912, -0.5512322, 1, 0.772549, 0, 1,
-1.160073, 0.4592583, 1.725551, 1, 0.7803922, 0, 1,
-1.147496, -1.16302, -2.490465, 1, 0.7843137, 0, 1,
-1.14584, 1.494897, -1.471653, 1, 0.7921569, 0, 1,
-1.137541, 0.04265531, -1.868663, 1, 0.7960784, 0, 1,
-1.13581, 0.7554668, -0.7355983, 1, 0.8039216, 0, 1,
-1.129104, -1.774163, -3.953188, 1, 0.8117647, 0, 1,
-1.128698, -0.1092449, -2.8567, 1, 0.8156863, 0, 1,
-1.125999, -0.4030655, -1.422313, 1, 0.8235294, 0, 1,
-1.121137, -0.5780653, -2.859637, 1, 0.827451, 0, 1,
-1.114054, -0.4233257, -1.256127, 1, 0.8352941, 0, 1,
-1.11297, -0.08727051, -0.7062055, 1, 0.8392157, 0, 1,
-1.112954, 0.5075614, -0.2590854, 1, 0.8470588, 0, 1,
-1.111186, -0.1980084, -1.467282, 1, 0.8509804, 0, 1,
-1.099633, 0.5156034, -0.5636479, 1, 0.8588235, 0, 1,
-1.098396, 0.8903308, -0.3822429, 1, 0.8627451, 0, 1,
-1.095164, -0.3472593, -3.953121, 1, 0.8705882, 0, 1,
-1.094331, 0.1350522, -1.333832, 1, 0.8745098, 0, 1,
-1.087236, 0.210805, -3.425755, 1, 0.8823529, 0, 1,
-1.080785, -1.143383, -2.845783, 1, 0.8862745, 0, 1,
-1.07656, 1.302387, -0.7368289, 1, 0.8941177, 0, 1,
-1.071871, 0.6175007, -2.578181, 1, 0.8980392, 0, 1,
-1.057384, 0.02247952, -2.141037, 1, 0.9058824, 0, 1,
-1.055906, 0.3180346, -0.3037775, 1, 0.9137255, 0, 1,
-1.041876, 0.08840054, -1.664692, 1, 0.9176471, 0, 1,
-1.031072, -1.458044, -1.919556, 1, 0.9254902, 0, 1,
-1.03028, 0.3177319, -0.9039316, 1, 0.9294118, 0, 1,
-1.024554, -1.331438, -2.587415, 1, 0.9372549, 0, 1,
-1.020834, 0.4002449, -0.1445953, 1, 0.9411765, 0, 1,
-1.018142, -0.008847536, -1.183683, 1, 0.9490196, 0, 1,
-1.013333, 0.3984959, -1.422999, 1, 0.9529412, 0, 1,
-1.009196, 1.596028, -0.9601129, 1, 0.9607843, 0, 1,
-1.003135, 0.1064813, -2.170895, 1, 0.9647059, 0, 1,
-1.000777, 0.849708, 1.225363, 1, 0.972549, 0, 1,
-0.994859, -0.7064528, -2.016633, 1, 0.9764706, 0, 1,
-0.9838749, -0.9388374, -3.82256, 1, 0.9843137, 0, 1,
-0.9826351, -0.5003076, -2.35544, 1, 0.9882353, 0, 1,
-0.971355, -1.220666, -2.71032, 1, 0.9960784, 0, 1,
-0.9646326, 0.4311021, -0.6802812, 0.9960784, 1, 0, 1,
-0.9616447, 0.221792, -0.9931026, 0.9921569, 1, 0, 1,
-0.9548978, 0.1914113, -0.3887593, 0.9843137, 1, 0, 1,
-0.9517469, -1.676422, -3.796184, 0.9803922, 1, 0, 1,
-0.9485958, -0.4937221, -2.353497, 0.972549, 1, 0, 1,
-0.946616, -0.0650427, -3.038206, 0.9686275, 1, 0, 1,
-0.9427349, -1.351425, -3.101519, 0.9607843, 1, 0, 1,
-0.9422513, 0.9532948, -0.312366, 0.9568627, 1, 0, 1,
-0.9405528, -0.6145457, -3.519823, 0.9490196, 1, 0, 1,
-0.9190118, -0.2176174, -1.04824, 0.945098, 1, 0, 1,
-0.9102877, 2.083327, -1.82888, 0.9372549, 1, 0, 1,
-0.9088364, 0.03023876, -2.647859, 0.9333333, 1, 0, 1,
-0.9085139, -0.5312167, -3.876128, 0.9254902, 1, 0, 1,
-0.904227, 0.05289265, -1.560161, 0.9215686, 1, 0, 1,
-0.8968977, -0.8761855, -4.162437, 0.9137255, 1, 0, 1,
-0.8922878, 2.015763, -0.5307553, 0.9098039, 1, 0, 1,
-0.8911804, 2.417841, -0.4957947, 0.9019608, 1, 0, 1,
-0.8879025, -0.2167955, -0.4800447, 0.8941177, 1, 0, 1,
-0.8841717, -1.077769, -3.311152, 0.8901961, 1, 0, 1,
-0.8835578, 0.1136782, -0.5676261, 0.8823529, 1, 0, 1,
-0.8778503, -1.509639, -4.007558, 0.8784314, 1, 0, 1,
-0.8766722, -0.4105988, -2.757251, 0.8705882, 1, 0, 1,
-0.8686271, -0.04144705, -1.495752, 0.8666667, 1, 0, 1,
-0.8677962, -0.1384585, -1.205428, 0.8588235, 1, 0, 1,
-0.8586949, 0.3045994, -1.290839, 0.854902, 1, 0, 1,
-0.8579645, -0.3398017, 0.9443877, 0.8470588, 1, 0, 1,
-0.8569502, 0.3464601, -1.322137, 0.8431373, 1, 0, 1,
-0.8561731, 1.091836, 0.1080155, 0.8352941, 1, 0, 1,
-0.8541359, 0.2544614, -1.554369, 0.8313726, 1, 0, 1,
-0.8505994, -0.429682, -1.034402, 0.8235294, 1, 0, 1,
-0.8495467, 0.1648178, -1.964743, 0.8196079, 1, 0, 1,
-0.8430693, -0.3729886, -0.3585993, 0.8117647, 1, 0, 1,
-0.8428656, -0.5406737, -2.74885, 0.8078431, 1, 0, 1,
-0.8412295, -0.9420547, -0.2420512, 0.8, 1, 0, 1,
-0.8387645, 0.5873048, 0.6663834, 0.7921569, 1, 0, 1,
-0.8384387, 0.3273654, 0.1558848, 0.7882353, 1, 0, 1,
-0.8366201, 0.8283417, -0.4809285, 0.7803922, 1, 0, 1,
-0.8340417, 1.205989, -0.08540086, 0.7764706, 1, 0, 1,
-0.8335609, 0.212515, -0.2551166, 0.7686275, 1, 0, 1,
-0.8326371, 0.3876683, -0.9184666, 0.7647059, 1, 0, 1,
-0.8324817, 0.2430196, 0.138199, 0.7568628, 1, 0, 1,
-0.8319371, -0.8362391, -2.60351, 0.7529412, 1, 0, 1,
-0.8217074, 0.6843574, -3.397461, 0.7450981, 1, 0, 1,
-0.8181644, -1.709242, -2.638496, 0.7411765, 1, 0, 1,
-0.801963, -1.231442, -3.125449, 0.7333333, 1, 0, 1,
-0.8005205, 1.200925, -0.8189332, 0.7294118, 1, 0, 1,
-0.8003478, -1.621021, -2.986287, 0.7215686, 1, 0, 1,
-0.7945627, -0.7907136, -3.454277, 0.7176471, 1, 0, 1,
-0.7919965, -0.2412687, -1.940855, 0.7098039, 1, 0, 1,
-0.7897487, -0.009711215, -0.9018419, 0.7058824, 1, 0, 1,
-0.787017, -2.038895, -1.862067, 0.6980392, 1, 0, 1,
-0.7868382, -0.6756096, -0.9432573, 0.6901961, 1, 0, 1,
-0.7856486, -0.01258159, -2.494653, 0.6862745, 1, 0, 1,
-0.7813026, -0.7800245, -1.718011, 0.6784314, 1, 0, 1,
-0.7769809, -1.565425, -0.5873308, 0.6745098, 1, 0, 1,
-0.7740976, 0.5356704, -3.045168, 0.6666667, 1, 0, 1,
-0.7686393, -0.332946, -2.866432, 0.6627451, 1, 0, 1,
-0.7605655, -1.975032, -2.589816, 0.654902, 1, 0, 1,
-0.744266, 0.2095242, -0.3379877, 0.6509804, 1, 0, 1,
-0.7411802, 0.3743242, -2.861286, 0.6431373, 1, 0, 1,
-0.7338977, 0.08239847, -2.480249, 0.6392157, 1, 0, 1,
-0.7320665, 0.8646276, 0.2574249, 0.6313726, 1, 0, 1,
-0.7304647, 0.7074592, -0.9437563, 0.627451, 1, 0, 1,
-0.7270517, 0.2344611, -1.20505, 0.6196079, 1, 0, 1,
-0.7266417, -0.4076892, -2.294894, 0.6156863, 1, 0, 1,
-0.7129895, 0.9771035, 0.2062022, 0.6078432, 1, 0, 1,
-0.7100578, -0.8755125, -2.655474, 0.6039216, 1, 0, 1,
-0.7070913, -0.7378669, -2.569839, 0.5960785, 1, 0, 1,
-0.7063013, 0.3752517, 1.762087, 0.5882353, 1, 0, 1,
-0.7041218, -0.2306185, -3.168746, 0.5843138, 1, 0, 1,
-0.6971618, 0.1178237, -1.513807, 0.5764706, 1, 0, 1,
-0.6961471, 0.6239588, -1.548794, 0.572549, 1, 0, 1,
-0.6951735, -0.1725556, -2.526863, 0.5647059, 1, 0, 1,
-0.6932688, 0.3351838, -0.3328448, 0.5607843, 1, 0, 1,
-0.6883551, 0.1318869, -3.723657, 0.5529412, 1, 0, 1,
-0.6872982, -0.1696205, -1.917277, 0.5490196, 1, 0, 1,
-0.6806397, -2.040824, -2.78799, 0.5411765, 1, 0, 1,
-0.6801879, -0.7001027, -2.699556, 0.5372549, 1, 0, 1,
-0.6782119, 0.09968551, -2.078459, 0.5294118, 1, 0, 1,
-0.6753438, 1.910251, -1.972586, 0.5254902, 1, 0, 1,
-0.6726263, -0.1419891, -2.701042, 0.5176471, 1, 0, 1,
-0.6690782, -0.4571898, -1.514586, 0.5137255, 1, 0, 1,
-0.6642334, -0.6076185, -1.758711, 0.5058824, 1, 0, 1,
-0.6615479, 0.6764438, -0.3800415, 0.5019608, 1, 0, 1,
-0.6523113, 0.7207928, -1.435361, 0.4941176, 1, 0, 1,
-0.6511742, -0.9399618, -2.501671, 0.4862745, 1, 0, 1,
-0.649752, 0.5493746, -1.234194, 0.4823529, 1, 0, 1,
-0.6458651, 0.0479521, -3.557256, 0.4745098, 1, 0, 1,
-0.6414091, 0.8283581, -1.573673, 0.4705882, 1, 0, 1,
-0.6413775, -0.810782, -3.568124, 0.4627451, 1, 0, 1,
-0.6404142, -0.300624, -1.239277, 0.4588235, 1, 0, 1,
-0.6345258, -0.9606438, -3.230067, 0.4509804, 1, 0, 1,
-0.6308466, 1.144928, 0.04021677, 0.4470588, 1, 0, 1,
-0.627808, -1.163957, -2.031023, 0.4392157, 1, 0, 1,
-0.62563, -0.1756311, -1.719363, 0.4352941, 1, 0, 1,
-0.6241871, -0.6706126, -1.537523, 0.427451, 1, 0, 1,
-0.6226581, 0.01709473, -0.6430853, 0.4235294, 1, 0, 1,
-0.6214886, -1.297342, -3.232057, 0.4156863, 1, 0, 1,
-0.6208969, -0.446861, -3.532154, 0.4117647, 1, 0, 1,
-0.6194137, 1.065822, -1.616961, 0.4039216, 1, 0, 1,
-0.618259, -0.304722, -0.9236386, 0.3960784, 1, 0, 1,
-0.6173918, 1.435755, -0.3890873, 0.3921569, 1, 0, 1,
-0.6162592, 0.1511485, -0.2032968, 0.3843137, 1, 0, 1,
-0.6148359, 0.5138971, -1.688775, 0.3803922, 1, 0, 1,
-0.610909, 0.4832265, -0.8641145, 0.372549, 1, 0, 1,
-0.61059, 0.4773818, -0.3803349, 0.3686275, 1, 0, 1,
-0.6090257, 0.06207372, -2.449467, 0.3607843, 1, 0, 1,
-0.6057633, -1.035792, -2.870302, 0.3568628, 1, 0, 1,
-0.6049719, 0.849858, -1.920966, 0.3490196, 1, 0, 1,
-0.5986971, -0.1426557, -2.702866, 0.345098, 1, 0, 1,
-0.5970655, 1.433079, 0.2379612, 0.3372549, 1, 0, 1,
-0.5947237, 0.9385146, 1.780771, 0.3333333, 1, 0, 1,
-0.5945953, -1.503809, -1.680522, 0.3254902, 1, 0, 1,
-0.5921515, 0.3037274, -2.165661, 0.3215686, 1, 0, 1,
-0.5872678, 0.461984, -1.156085, 0.3137255, 1, 0, 1,
-0.5862325, 0.5450327, -0.4159971, 0.3098039, 1, 0, 1,
-0.5858368, -0.3431087, -2.783211, 0.3019608, 1, 0, 1,
-0.5827442, -0.8052279, -2.38653, 0.2941177, 1, 0, 1,
-0.5723355, -1.877882, -2.194439, 0.2901961, 1, 0, 1,
-0.5647434, -0.1320009, -2.825283, 0.282353, 1, 0, 1,
-0.5605113, 1.370643, -1.889206, 0.2784314, 1, 0, 1,
-0.5577834, 0.5651369, -1.511229, 0.2705882, 1, 0, 1,
-0.5566754, -0.4978679, -0.955512, 0.2666667, 1, 0, 1,
-0.5503104, -2.001142, -3.37052, 0.2588235, 1, 0, 1,
-0.5483153, -1.439193, -3.598722, 0.254902, 1, 0, 1,
-0.5475518, 1.36749, 1.113851, 0.2470588, 1, 0, 1,
-0.5436674, -0.808651, -2.589821, 0.2431373, 1, 0, 1,
-0.5411192, -0.8943891, -4.294131, 0.2352941, 1, 0, 1,
-0.5355167, -0.727478, -3.103587, 0.2313726, 1, 0, 1,
-0.5276152, -1.116658, -1.819061, 0.2235294, 1, 0, 1,
-0.5190405, 0.6518047, -1.403763, 0.2196078, 1, 0, 1,
-0.5029709, -0.09864094, 0.4163403, 0.2117647, 1, 0, 1,
-0.4984826, -0.05878577, -1.026782, 0.2078431, 1, 0, 1,
-0.495244, 1.547818, -0.4626002, 0.2, 1, 0, 1,
-0.4941288, -1.839854, -0.8846627, 0.1921569, 1, 0, 1,
-0.4936488, -0.6822688, -1.508721, 0.1882353, 1, 0, 1,
-0.4869356, 0.6771765, -2.117431, 0.1803922, 1, 0, 1,
-0.4746904, -0.07357581, -0.9983624, 0.1764706, 1, 0, 1,
-0.4746608, -0.1968135, -1.404792, 0.1686275, 1, 0, 1,
-0.4745297, 0.5773394, 0.3435963, 0.1647059, 1, 0, 1,
-0.4715322, 2.430092, -1.605754, 0.1568628, 1, 0, 1,
-0.4702601, 1.321572, -1.366724, 0.1529412, 1, 0, 1,
-0.4694944, 1.069315, -1.629063, 0.145098, 1, 0, 1,
-0.4671556, -0.3971322, -2.063231, 0.1411765, 1, 0, 1,
-0.4624533, 0.149708, -1.237844, 0.1333333, 1, 0, 1,
-0.4619784, 0.4165252, -0.2272359, 0.1294118, 1, 0, 1,
-0.4596432, 1.581199, -1.629219, 0.1215686, 1, 0, 1,
-0.4592629, -0.4343237, -3.749487, 0.1176471, 1, 0, 1,
-0.4589709, 0.599183, 0.3024438, 0.1098039, 1, 0, 1,
-0.4568215, 0.7151464, 0.6449496, 0.1058824, 1, 0, 1,
-0.4525586, -0.3874156, -3.661213, 0.09803922, 1, 0, 1,
-0.4475106, 0.6621739, -1.766287, 0.09019608, 1, 0, 1,
-0.4425537, -0.1004346, -3.668164, 0.08627451, 1, 0, 1,
-0.4424357, -0.2348986, -2.218714, 0.07843138, 1, 0, 1,
-0.4394743, -0.5452473, -2.397851, 0.07450981, 1, 0, 1,
-0.4333601, -0.6579235, -3.135169, 0.06666667, 1, 0, 1,
-0.4230843, -0.7887563, -1.465011, 0.0627451, 1, 0, 1,
-0.4212512, -0.8809133, -2.078044, 0.05490196, 1, 0, 1,
-0.4175755, 0.3886666, -0.6958418, 0.05098039, 1, 0, 1,
-0.4149111, 0.09771961, -0.6944042, 0.04313726, 1, 0, 1,
-0.4127379, 1.179707, 2.217271, 0.03921569, 1, 0, 1,
-0.4122198, -0.4429553, -3.364756, 0.03137255, 1, 0, 1,
-0.4105874, -0.1387065, -0.6239589, 0.02745098, 1, 0, 1,
-0.4036849, -1.370762, -3.52231, 0.01960784, 1, 0, 1,
-0.4029549, -0.7540628, -1.919585, 0.01568628, 1, 0, 1,
-0.3983945, 1.000212, -1.738993, 0.007843138, 1, 0, 1,
-0.3937723, -2.039544, -2.207369, 0.003921569, 1, 0, 1,
-0.3898413, 0.08728904, -2.398365, 0, 1, 0.003921569, 1,
-0.3883353, -1.125985, -2.951856, 0, 1, 0.01176471, 1,
-0.387238, 0.4683126, -0.1803363, 0, 1, 0.01568628, 1,
-0.3864872, -1.698671, -2.968038, 0, 1, 0.02352941, 1,
-0.3828397, -0.2427423, -4.298048, 0, 1, 0.02745098, 1,
-0.3806992, -1.019161, -3.518523, 0, 1, 0.03529412, 1,
-0.3805895, -2.132451, -2.736119, 0, 1, 0.03921569, 1,
-0.3773923, -0.5128554, -3.364257, 0, 1, 0.04705882, 1,
-0.3744642, 0.4056317, -1.196777, 0, 1, 0.05098039, 1,
-0.3714038, -0.530544, -2.915264, 0, 1, 0.05882353, 1,
-0.368108, 0.453324, 0.2902239, 0, 1, 0.0627451, 1,
-0.3656502, 0.5253832, -0.389753, 0, 1, 0.07058824, 1,
-0.3605741, 0.1217624, -2.557967, 0, 1, 0.07450981, 1,
-0.3605689, 1.012446, -1.084107, 0, 1, 0.08235294, 1,
-0.3594172, -1.349298, -3.379361, 0, 1, 0.08627451, 1,
-0.3575539, -0.5223905, -3.814773, 0, 1, 0.09411765, 1,
-0.3425118, 0.3080818, -0.6617945, 0, 1, 0.1019608, 1,
-0.3415149, -0.4956869, -2.787536, 0, 1, 0.1058824, 1,
-0.3391818, 0.06290568, -2.66788, 0, 1, 0.1137255, 1,
-0.3359716, 0.1124018, -0.7188649, 0, 1, 0.1176471, 1,
-0.3358572, 0.915745, 0.4830107, 0, 1, 0.1254902, 1,
-0.3351998, -1.931661, -2.975068, 0, 1, 0.1294118, 1,
-0.3335622, -0.7583762, -3.944343, 0, 1, 0.1372549, 1,
-0.3335034, 0.2777307, -0.9683011, 0, 1, 0.1411765, 1,
-0.3329706, -0.1285754, -2.150046, 0, 1, 0.1490196, 1,
-0.3303919, -0.8143038, -2.730519, 0, 1, 0.1529412, 1,
-0.3297395, -0.5469843, -2.521804, 0, 1, 0.1607843, 1,
-0.3193609, -0.5493152, -4.46911, 0, 1, 0.1647059, 1,
-0.3186001, -0.1249106, 0.02579405, 0, 1, 0.172549, 1,
-0.313849, 1.118858, 0.2362181, 0, 1, 0.1764706, 1,
-0.3102153, -2.418572, -1.914374, 0, 1, 0.1843137, 1,
-0.3083626, -0.7775249, -2.443505, 0, 1, 0.1882353, 1,
-0.3063274, 2.004809, 0.9654996, 0, 1, 0.1960784, 1,
-0.3047349, -0.1815853, -3.519396, 0, 1, 0.2039216, 1,
-0.3016256, -1.381329, -6.07075, 0, 1, 0.2078431, 1,
-0.3006293, 0.314871, -0.6108571, 0, 1, 0.2156863, 1,
-0.2952447, -1.670382, -2.889388, 0, 1, 0.2196078, 1,
-0.2952299, -0.8229902, -2.158325, 0, 1, 0.227451, 1,
-0.2945449, -0.02681996, -2.771747, 0, 1, 0.2313726, 1,
-0.2935047, 0.2407981, -0.01301266, 0, 1, 0.2392157, 1,
-0.2919489, -0.09896376, -0.2855265, 0, 1, 0.2431373, 1,
-0.2906749, 0.628456, -1.620506, 0, 1, 0.2509804, 1,
-0.2906297, 0.9393368, -1.463119, 0, 1, 0.254902, 1,
-0.2894256, 0.4036249, -2.835278, 0, 1, 0.2627451, 1,
-0.2791975, 1.399521, -0.03852104, 0, 1, 0.2666667, 1,
-0.2781263, -0.1161639, -1.534449, 0, 1, 0.2745098, 1,
-0.2740005, 0.1788501, -1.494386, 0, 1, 0.2784314, 1,
-0.2678829, -0.8405941, -5.222015, 0, 1, 0.2862745, 1,
-0.2658137, -0.08580592, -0.6360564, 0, 1, 0.2901961, 1,
-0.2623138, 1.85327, 0.3451876, 0, 1, 0.2980392, 1,
-0.2615108, -0.5757594, -3.551747, 0, 1, 0.3058824, 1,
-0.2607981, -0.01788136, 0.20916, 0, 1, 0.3098039, 1,
-0.2582047, -0.3878413, -1.492, 0, 1, 0.3176471, 1,
-0.2559611, -0.6049092, -4.147933, 0, 1, 0.3215686, 1,
-0.250693, -0.7300772, -4.372496, 0, 1, 0.3294118, 1,
-0.2502175, 0.06547717, -1.4345, 0, 1, 0.3333333, 1,
-0.2486512, 2.310307, -0.8829125, 0, 1, 0.3411765, 1,
-0.2432911, -0.1983036, -1.665544, 0, 1, 0.345098, 1,
-0.2430855, 0.2671732, 0.7148983, 0, 1, 0.3529412, 1,
-0.2389066, 1.460139, 0.7929248, 0, 1, 0.3568628, 1,
-0.2362499, -0.04509611, -1.174502, 0, 1, 0.3647059, 1,
-0.2310547, 1.569865, -0.3622656, 0, 1, 0.3686275, 1,
-0.2284751, -0.7660693, -3.144206, 0, 1, 0.3764706, 1,
-0.2237037, 1.614645, -0.6798689, 0, 1, 0.3803922, 1,
-0.2233277, 1.517056, -0.3637793, 0, 1, 0.3882353, 1,
-0.2198464, -0.6767725, -3.492908, 0, 1, 0.3921569, 1,
-0.2152393, -1.031827, -3.009541, 0, 1, 0.4, 1,
-0.2104779, 1.381559, 0.05193869, 0, 1, 0.4078431, 1,
-0.2100614, -0.7372904, -3.940297, 0, 1, 0.4117647, 1,
-0.2076823, 0.9602113, 0.1669124, 0, 1, 0.4196078, 1,
-0.206105, -0.7084988, -3.335257, 0, 1, 0.4235294, 1,
-0.2058105, -1.815221, -3.774076, 0, 1, 0.4313726, 1,
-0.2050162, -0.4029938, -4.102743, 0, 1, 0.4352941, 1,
-0.2045321, -0.6226564, -3.788388, 0, 1, 0.4431373, 1,
-0.1962211, 0.3280977, -0.9950971, 0, 1, 0.4470588, 1,
-0.191704, 2.013088, -1.724434, 0, 1, 0.454902, 1,
-0.1898684, 0.739737, -1.82988, 0, 1, 0.4588235, 1,
-0.1863218, -0.008035453, -0.48182, 0, 1, 0.4666667, 1,
-0.1856471, 0.510507, -1.339512, 0, 1, 0.4705882, 1,
-0.1806333, -1.51127, -2.29592, 0, 1, 0.4784314, 1,
-0.1806051, -1.430601, -2.903135, 0, 1, 0.4823529, 1,
-0.1798204, 0.615404, -1.536113, 0, 1, 0.4901961, 1,
-0.1766317, 1.596362, -0.399757, 0, 1, 0.4941176, 1,
-0.172109, -0.341856, -2.041519, 0, 1, 0.5019608, 1,
-0.1719834, -0.5881504, -3.501644, 0, 1, 0.509804, 1,
-0.1668883, 1.548437, 1.265702, 0, 1, 0.5137255, 1,
-0.1666625, 0.6121166, 0.7270968, 0, 1, 0.5215687, 1,
-0.1634292, 0.6857629, -0.1606707, 0, 1, 0.5254902, 1,
-0.1623847, 0.4925798, 0.3014626, 0, 1, 0.5333334, 1,
-0.157579, 0.07096072, -0.5262541, 0, 1, 0.5372549, 1,
-0.1534885, 0.005369562, -0.4527149, 0, 1, 0.5450981, 1,
-0.151543, 1.897897, -1.257484, 0, 1, 0.5490196, 1,
-0.147938, 1.860882, 0.2728469, 0, 1, 0.5568628, 1,
-0.1425063, -0.07589259, -3.333282, 0, 1, 0.5607843, 1,
-0.1387327, 0.8018064, -0.5223988, 0, 1, 0.5686275, 1,
-0.1358279, 1.473974, -1.796601, 0, 1, 0.572549, 1,
-0.1350359, 0.02287657, -1.462581, 0, 1, 0.5803922, 1,
-0.1302921, -0.8639985, -3.742979, 0, 1, 0.5843138, 1,
-0.1283147, -0.3048013, -0.5748935, 0, 1, 0.5921569, 1,
-0.1282599, 0.4945363, 0.6405036, 0, 1, 0.5960785, 1,
-0.1252007, 0.8502631, -0.1290893, 0, 1, 0.6039216, 1,
-0.118929, 0.02023537, -1.985882, 0, 1, 0.6117647, 1,
-0.1149261, 1.350685, -0.4120134, 0, 1, 0.6156863, 1,
-0.1092193, 1.612374, -0.5768785, 0, 1, 0.6235294, 1,
-0.1070339, 1.957428, -0.03983701, 0, 1, 0.627451, 1,
-0.1057506, -0.448125, -1.925454, 0, 1, 0.6352941, 1,
-0.1017025, 0.4593997, 0.08335344, 0, 1, 0.6392157, 1,
-0.09983042, 1.319031, -0.4608733, 0, 1, 0.6470588, 1,
-0.09830566, -0.1315854, -1.17818, 0, 1, 0.6509804, 1,
-0.09801196, -1.76256, -4.113592, 0, 1, 0.6588235, 1,
-0.09266421, 0.98937, 1.30486, 0, 1, 0.6627451, 1,
-0.09082109, -2.213364, -1.076, 0, 1, 0.6705883, 1,
-0.08893991, 0.07536823, 1.004856, 0, 1, 0.6745098, 1,
-0.08764181, -0.4680446, -0.8563974, 0, 1, 0.682353, 1,
-0.08648381, 0.8781172, -1.068817, 0, 1, 0.6862745, 1,
-0.08073547, 1.065568, -0.8252975, 0, 1, 0.6941177, 1,
-0.07561775, 0.003363473, -0.7977049, 0, 1, 0.7019608, 1,
-0.07515314, 0.1194867, -0.9074079, 0, 1, 0.7058824, 1,
-0.07195742, 1.85802, -0.6944822, 0, 1, 0.7137255, 1,
-0.0700023, 0.233678, -0.6301917, 0, 1, 0.7176471, 1,
-0.06871893, -1.290433, -3.796024, 0, 1, 0.7254902, 1,
-0.06846608, -0.9549924, -3.222286, 0, 1, 0.7294118, 1,
-0.06434406, 0.5455192, -0.1582466, 0, 1, 0.7372549, 1,
-0.06043569, -0.2168039, -3.296372, 0, 1, 0.7411765, 1,
-0.06007731, -0.4761882, -2.912257, 0, 1, 0.7490196, 1,
-0.05542627, 0.2567908, -0.1834784, 0, 1, 0.7529412, 1,
-0.05452454, -1.413733, -2.228766, 0, 1, 0.7607843, 1,
-0.05245706, -0.009462591, -2.32654, 0, 1, 0.7647059, 1,
-0.05085735, -0.4899803, -2.101974, 0, 1, 0.772549, 1,
-0.0495549, -1.051498, -2.568016, 0, 1, 0.7764706, 1,
-0.04699472, 0.5812388, -2.350587, 0, 1, 0.7843137, 1,
-0.03846531, -0.05493518, -1.821714, 0, 1, 0.7882353, 1,
-0.03776043, 0.2347753, 0.2309274, 0, 1, 0.7960784, 1,
-0.03122615, -1.461446, -3.625615, 0, 1, 0.8039216, 1,
-0.02624141, 1.381045, 0.2574645, 0, 1, 0.8078431, 1,
-0.02074263, -0.5417762, -5.180636, 0, 1, 0.8156863, 1,
-0.0204784, 1.753664, 0.215768, 0, 1, 0.8196079, 1,
-0.01845764, 1.158977, -1.75195, 0, 1, 0.827451, 1,
-0.01108556, 2.229829, 0.7234452, 0, 1, 0.8313726, 1,
-0.007659127, 1.096344, -1.344461, 0, 1, 0.8392157, 1,
-0.006035836, 0.4020445, -1.817574, 0, 1, 0.8431373, 1,
-0.005937354, -0.1019447, -3.856339, 0, 1, 0.8509804, 1,
-0.005040684, 0.005676647, -2.567191, 0, 1, 0.854902, 1,
-0.001302767, -1.078942, -2.719656, 0, 1, 0.8627451, 1,
0.003609226, 0.3775997, 0.03738075, 0, 1, 0.8666667, 1,
0.006088871, 0.1139834, 0.4058672, 0, 1, 0.8745098, 1,
0.006633585, 0.4212545, 0.9346215, 0, 1, 0.8784314, 1,
0.007969611, 1.435646, 1.862817, 0, 1, 0.8862745, 1,
0.00857184, -0.44867, 1.58667, 0, 1, 0.8901961, 1,
0.01158617, 1.255624, -0.6645104, 0, 1, 0.8980392, 1,
0.01764401, 0.2882599, -0.3400632, 0, 1, 0.9058824, 1,
0.02009876, -0.786029, 3.272551, 0, 1, 0.9098039, 1,
0.02076806, -0.2353198, 1.608576, 0, 1, 0.9176471, 1,
0.02288439, -0.8622686, 2.242307, 0, 1, 0.9215686, 1,
0.0240126, -0.9688431, 1.276282, 0, 1, 0.9294118, 1,
0.02724974, -1.155294, 3.030747, 0, 1, 0.9333333, 1,
0.03589654, -0.005639253, 2.471398, 0, 1, 0.9411765, 1,
0.05218847, -1.44283, 2.300735, 0, 1, 0.945098, 1,
0.05245868, 1.463432, -1.106371, 0, 1, 0.9529412, 1,
0.05344515, -0.3293273, 2.836541, 0, 1, 0.9568627, 1,
0.05566595, -0.1500938, 3.190436, 0, 1, 0.9647059, 1,
0.05838127, -0.627345, 1.922603, 0, 1, 0.9686275, 1,
0.06850947, -1.848461, 1.158914, 0, 1, 0.9764706, 1,
0.07002632, 0.4741387, -1.553299, 0, 1, 0.9803922, 1,
0.07197021, 1.337338, 1.076793, 0, 1, 0.9882353, 1,
0.0732797, 0.5208101, -2.027571, 0, 1, 0.9921569, 1,
0.08875439, 0.5617498, -0.2190869, 0, 1, 1, 1,
0.09288188, -0.6368729, 3.775062, 0, 0.9921569, 1, 1,
0.09629429, -0.2117461, 1.347827, 0, 0.9882353, 1, 1,
0.1061528, -0.972487, 5.876226, 0, 0.9803922, 1, 1,
0.1121744, -0.6141636, 2.602553, 0, 0.9764706, 1, 1,
0.1138672, 0.3849665, 0.1086915, 0, 0.9686275, 1, 1,
0.1153623, 0.1569149, 1.442809, 0, 0.9647059, 1, 1,
0.1162102, 1.939095, -0.295976, 0, 0.9568627, 1, 1,
0.1166545, -0.6890128, 2.556549, 0, 0.9529412, 1, 1,
0.1192417, 0.1351826, 3.555675, 0, 0.945098, 1, 1,
0.1231826, 0.1499205, -1.455592, 0, 0.9411765, 1, 1,
0.1233674, -0.1452529, 2.842679, 0, 0.9333333, 1, 1,
0.1269103, 0.1151386, -0.2689937, 0, 0.9294118, 1, 1,
0.1288091, 0.09300546, -0.6983091, 0, 0.9215686, 1, 1,
0.1294293, -1.768254, 0.9183792, 0, 0.9176471, 1, 1,
0.1298137, -0.3122787, 3.533497, 0, 0.9098039, 1, 1,
0.1309835, -1.148786, 3.279773, 0, 0.9058824, 1, 1,
0.1433592, 0.02876475, -0.6755595, 0, 0.8980392, 1, 1,
0.144114, 0.6334161, 2.023414, 0, 0.8901961, 1, 1,
0.1480483, 0.1331298, 2.0431, 0, 0.8862745, 1, 1,
0.1480628, -2.143011, 3.00962, 0, 0.8784314, 1, 1,
0.1529643, 0.895846, 1.984589, 0, 0.8745098, 1, 1,
0.1534725, -2.600821, 2.950259, 0, 0.8666667, 1, 1,
0.159352, 0.1162609, 0.5850677, 0, 0.8627451, 1, 1,
0.161065, -0.5063677, 1.473583, 0, 0.854902, 1, 1,
0.1614246, 0.4988495, 0.0833342, 0, 0.8509804, 1, 1,
0.1616857, 0.6042551, -0.7177709, 0, 0.8431373, 1, 1,
0.1649051, 2.352599, -0.3401909, 0, 0.8392157, 1, 1,
0.1651176, -0.4676302, 2.769025, 0, 0.8313726, 1, 1,
0.1653254, -0.09752062, 1.740005, 0, 0.827451, 1, 1,
0.1662814, 0.3488418, -1.436592, 0, 0.8196079, 1, 1,
0.1670405, 0.809113, 1.176333, 0, 0.8156863, 1, 1,
0.173379, -1.537384, 3.310431, 0, 0.8078431, 1, 1,
0.1783223, -1.206134, 3.692473, 0, 0.8039216, 1, 1,
0.1826812, 0.2226799, -0.2763646, 0, 0.7960784, 1, 1,
0.1872185, 0.7296358, -0.02702429, 0, 0.7882353, 1, 1,
0.1873487, 0.4618392, 0.3383342, 0, 0.7843137, 1, 1,
0.1895973, 0.9642476, -0.6558638, 0, 0.7764706, 1, 1,
0.1897496, 0.01195135, 0.4593619, 0, 0.772549, 1, 1,
0.1943915, -1.625027, 5.453564, 0, 0.7647059, 1, 1,
0.1975165, 1.951893, 1.317745, 0, 0.7607843, 1, 1,
0.1990953, -1.027088, 3.23227, 0, 0.7529412, 1, 1,
0.1999655, -1.238578, 1.367332, 0, 0.7490196, 1, 1,
0.2032074, 0.7635156, -0.3083461, 0, 0.7411765, 1, 1,
0.203214, -0.5932129, 1.546625, 0, 0.7372549, 1, 1,
0.2065023, 1.280837, 0.6614953, 0, 0.7294118, 1, 1,
0.2078646, 0.1711695, 0.4655697, 0, 0.7254902, 1, 1,
0.2117766, 1.805044, 1.935505, 0, 0.7176471, 1, 1,
0.2123417, -1.565218, 3.614034, 0, 0.7137255, 1, 1,
0.2129316, -1.054693, 4.183063, 0, 0.7058824, 1, 1,
0.216582, 1.202891, -0.453476, 0, 0.6980392, 1, 1,
0.2245465, -0.2101121, 2.736228, 0, 0.6941177, 1, 1,
0.2271591, 0.8320355, 0.2632793, 0, 0.6862745, 1, 1,
0.2301129, -0.1303698, 1.812031, 0, 0.682353, 1, 1,
0.2309035, 0.1454094, 0.2500235, 0, 0.6745098, 1, 1,
0.2311274, 0.4300276, 0.6938387, 0, 0.6705883, 1, 1,
0.2361708, -1.263172, 4.153935, 0, 0.6627451, 1, 1,
0.2401916, 0.4137986, -0.2690901, 0, 0.6588235, 1, 1,
0.2430221, 0.792924, 0.5716378, 0, 0.6509804, 1, 1,
0.2431703, -1.213209, 4.387159, 0, 0.6470588, 1, 1,
0.2450019, 0.6015847, 0.3485462, 0, 0.6392157, 1, 1,
0.2457133, -0.009646798, 1.437879, 0, 0.6352941, 1, 1,
0.2481448, -0.4125245, 4.256512, 0, 0.627451, 1, 1,
0.2497467, -1.461383, 2.167428, 0, 0.6235294, 1, 1,
0.2538797, 0.161413, 1.373257, 0, 0.6156863, 1, 1,
0.2551334, 1.717579, 0.1551226, 0, 0.6117647, 1, 1,
0.2608292, 2.253759, -0.1194985, 0, 0.6039216, 1, 1,
0.2660494, -1.726854, 1.975241, 0, 0.5960785, 1, 1,
0.2677067, -0.5001904, 2.3095, 0, 0.5921569, 1, 1,
0.2702193, 0.4385781, -0.1035521, 0, 0.5843138, 1, 1,
0.2723046, -2.12337, 3.441793, 0, 0.5803922, 1, 1,
0.2731145, 0.5289999, -0.8602062, 0, 0.572549, 1, 1,
0.2734326, -0.4127086, 2.967641, 0, 0.5686275, 1, 1,
0.2753721, -1.399363, 3.457262, 0, 0.5607843, 1, 1,
0.2761691, 0.1083122, 0.8113885, 0, 0.5568628, 1, 1,
0.2822436, 1.40826, 0.1555655, 0, 0.5490196, 1, 1,
0.2823502, 0.880259, -1.063496, 0, 0.5450981, 1, 1,
0.2842727, -0.05455909, 1.857322, 0, 0.5372549, 1, 1,
0.2847708, -0.08071058, 2.809058, 0, 0.5333334, 1, 1,
0.2867045, 0.4343757, 1.823338, 0, 0.5254902, 1, 1,
0.2869932, 0.2281584, 1.03171, 0, 0.5215687, 1, 1,
0.2900428, 0.6832974, -0.2203656, 0, 0.5137255, 1, 1,
0.2902603, 0.08794174, 1.466062, 0, 0.509804, 1, 1,
0.2904671, 0.6525227, -0.4809928, 0, 0.5019608, 1, 1,
0.2925038, 1.234455, -0.6901616, 0, 0.4941176, 1, 1,
0.3033142, -0.0172982, 1.69468, 0, 0.4901961, 1, 1,
0.3035556, 1.465655, 0.6178885, 0, 0.4823529, 1, 1,
0.3037278, -0.4794666, 1.695061, 0, 0.4784314, 1, 1,
0.3055465, -1.447586, 2.638261, 0, 0.4705882, 1, 1,
0.3083763, 0.4215567, -0.257585, 0, 0.4666667, 1, 1,
0.3090059, -0.7009249, 2.835939, 0, 0.4588235, 1, 1,
0.3101571, -0.4641415, 2.197692, 0, 0.454902, 1, 1,
0.3111319, 0.9841995, -0.4530576, 0, 0.4470588, 1, 1,
0.3120745, -1.010962, 2.282567, 0, 0.4431373, 1, 1,
0.3124054, -1.008229, 2.522094, 0, 0.4352941, 1, 1,
0.3171373, -1.436844, 4.033408, 0, 0.4313726, 1, 1,
0.3205834, 0.1190772, 1.345325, 0, 0.4235294, 1, 1,
0.3216392, 1.462351, -0.9057376, 0, 0.4196078, 1, 1,
0.3244807, 1.576603, 1.187338, 0, 0.4117647, 1, 1,
0.32547, 0.7027153, 1.497604, 0, 0.4078431, 1, 1,
0.326662, 0.8069867, -0.2430025, 0, 0.4, 1, 1,
0.326812, -0.5251462, 3.507258, 0, 0.3921569, 1, 1,
0.3275203, -0.4121873, 2.295419, 0, 0.3882353, 1, 1,
0.3322322, 0.1936207, 1.063917, 0, 0.3803922, 1, 1,
0.3341277, 2.518617, 1.4926, 0, 0.3764706, 1, 1,
0.3416593, -1.641634, 3.990557, 0, 0.3686275, 1, 1,
0.3418809, -0.3841499, 1.464889, 0, 0.3647059, 1, 1,
0.3422228, 0.01364558, 1.388315, 0, 0.3568628, 1, 1,
0.344732, 0.7000093, 0.9898846, 0, 0.3529412, 1, 1,
0.3456099, -0.1954869, 1.986233, 0, 0.345098, 1, 1,
0.3483112, -0.3700509, 4.173223, 0, 0.3411765, 1, 1,
0.3485286, 0.9315194, -0.4200667, 0, 0.3333333, 1, 1,
0.3490123, 0.1754061, 2.832747, 0, 0.3294118, 1, 1,
0.3536901, 0.3236281, -0.2186271, 0, 0.3215686, 1, 1,
0.3562013, -0.3132022, 1.758633, 0, 0.3176471, 1, 1,
0.358898, 1.498365, 0.1146813, 0, 0.3098039, 1, 1,
0.3603908, 0.4800461, 1.089482, 0, 0.3058824, 1, 1,
0.3605756, 0.3564449, -0.9398476, 0, 0.2980392, 1, 1,
0.3608687, 0.1353438, 1.854217, 0, 0.2901961, 1, 1,
0.3716213, 0.2684691, 3.268838, 0, 0.2862745, 1, 1,
0.3748899, 1.149468, 0.2278102, 0, 0.2784314, 1, 1,
0.382109, 0.4956008, 0.2833751, 0, 0.2745098, 1, 1,
0.3851092, -0.4285333, 0.8015289, 0, 0.2666667, 1, 1,
0.3863605, 0.4020322, 1.709894, 0, 0.2627451, 1, 1,
0.3865593, 0.7885025, -0.4269894, 0, 0.254902, 1, 1,
0.3886349, 0.9823361, 1.536212, 0, 0.2509804, 1, 1,
0.3890897, 1.707168, 0.1940008, 0, 0.2431373, 1, 1,
0.3901249, -0.1845353, 0.817202, 0, 0.2392157, 1, 1,
0.3935571, 0.1583364, 1.859589, 0, 0.2313726, 1, 1,
0.3939303, 0.4070643, 0.3423761, 0, 0.227451, 1, 1,
0.4048066, -0.3755338, 1.829745, 0, 0.2196078, 1, 1,
0.4052122, -0.2779724, 3.569735, 0, 0.2156863, 1, 1,
0.4076947, 0.5588297, 0.5422621, 0, 0.2078431, 1, 1,
0.4079273, -1.454485, 2.053336, 0, 0.2039216, 1, 1,
0.4102236, -0.8096061, 1.052928, 0, 0.1960784, 1, 1,
0.4110796, 0.4813148, 1.467453, 0, 0.1882353, 1, 1,
0.4226054, 0.3128194, 0.5472128, 0, 0.1843137, 1, 1,
0.425231, -0.975045, 1.902245, 0, 0.1764706, 1, 1,
0.4255904, 1.197654, 0.1812475, 0, 0.172549, 1, 1,
0.4297442, 0.4053186, 1.847324, 0, 0.1647059, 1, 1,
0.4308522, -0.4024763, 0.9307201, 0, 0.1607843, 1, 1,
0.4337818, -0.2483434, 1.133756, 0, 0.1529412, 1, 1,
0.4395911, 0.8026704, 0.9225315, 0, 0.1490196, 1, 1,
0.4428856, -0.6535373, 3.67462, 0, 0.1411765, 1, 1,
0.4444097, 0.3165988, 0.3987963, 0, 0.1372549, 1, 1,
0.4478964, -1.281379, 4.377843, 0, 0.1294118, 1, 1,
0.4488853, -1.578277, 4.234972, 0, 0.1254902, 1, 1,
0.4490746, -1.314731, 2.104324, 0, 0.1176471, 1, 1,
0.4556498, -0.03610699, 1.813145, 0, 0.1137255, 1, 1,
0.4571859, -0.3389415, 2.057372, 0, 0.1058824, 1, 1,
0.4607179, 0.1218976, 2.466026, 0, 0.09803922, 1, 1,
0.4607288, -0.5236427, 3.269576, 0, 0.09411765, 1, 1,
0.4673956, -0.5928503, 2.092003, 0, 0.08627451, 1, 1,
0.4716247, 0.5430248, 1.458056, 0, 0.08235294, 1, 1,
0.4727254, -0.3726389, 2.127684, 0, 0.07450981, 1, 1,
0.4782626, -0.1170992, 0.6275065, 0, 0.07058824, 1, 1,
0.4803433, 3.03015, 0.1662105, 0, 0.0627451, 1, 1,
0.4845261, -2.091214, 3.405553, 0, 0.05882353, 1, 1,
0.4876773, -1.115889, 1.814483, 0, 0.05098039, 1, 1,
0.4886156, -0.08749025, 1.245212, 0, 0.04705882, 1, 1,
0.4927943, -1.010519, 3.606703, 0, 0.03921569, 1, 1,
0.4955942, 1.013305, 1.436557, 0, 0.03529412, 1, 1,
0.5010912, -0.8664553, 1.929544, 0, 0.02745098, 1, 1,
0.5066623, -0.7200447, 1.251812, 0, 0.02352941, 1, 1,
0.5111075, 0.0529264, 0.7190306, 0, 0.01568628, 1, 1,
0.5149093, -1.217979, 3.056472, 0, 0.01176471, 1, 1,
0.5201499, 0.002737964, 1.478991, 0, 0.003921569, 1, 1,
0.5204244, 0.09883152, 1.744849, 0.003921569, 0, 1, 1,
0.5221095, 0.5422472, 2.326718, 0.007843138, 0, 1, 1,
0.5254759, -1.069677, 4.874224, 0.01568628, 0, 1, 1,
0.526818, 0.5721341, 0.8091524, 0.01960784, 0, 1, 1,
0.526904, 0.5909176, 0.398975, 0.02745098, 0, 1, 1,
0.5280226, -0.8693616, 1.871054, 0.03137255, 0, 1, 1,
0.5305683, 2.070272, -1.115239, 0.03921569, 0, 1, 1,
0.5348091, 1.271438, 1.594076, 0.04313726, 0, 1, 1,
0.5348518, 0.346476, 2.004535, 0.05098039, 0, 1, 1,
0.5354611, 0.4126368, -0.2877311, 0.05490196, 0, 1, 1,
0.5375734, -0.2521199, 2.042817, 0.0627451, 0, 1, 1,
0.5443584, -0.5928625, 0.9828217, 0.06666667, 0, 1, 1,
0.5447618, -0.5712507, 2.645278, 0.07450981, 0, 1, 1,
0.5453981, 0.458132, 2.347634, 0.07843138, 0, 1, 1,
0.5469478, -1.015839, 0.8696209, 0.08627451, 0, 1, 1,
0.5489257, -0.6190006, 3.838978, 0.09019608, 0, 1, 1,
0.5503348, 1.017548, 2.160799, 0.09803922, 0, 1, 1,
0.5515189, 0.3381815, -0.3974458, 0.1058824, 0, 1, 1,
0.5525767, -0.5176814, 1.984624, 0.1098039, 0, 1, 1,
0.5616281, 1.953858, 0.2576557, 0.1176471, 0, 1, 1,
0.5631388, 0.5071204, 1.155293, 0.1215686, 0, 1, 1,
0.5653286, -0.2240967, 2.177409, 0.1294118, 0, 1, 1,
0.5667558, 0.6108395, 1.112966, 0.1333333, 0, 1, 1,
0.5695485, 2.904248, -2.125541, 0.1411765, 0, 1, 1,
0.5699077, -2.217139, 2.1097, 0.145098, 0, 1, 1,
0.5702778, 3.222332, 1.362543, 0.1529412, 0, 1, 1,
0.5703944, -1.352861, 2.481483, 0.1568628, 0, 1, 1,
0.572768, 0.3468518, -0.6859457, 0.1647059, 0, 1, 1,
0.5849252, 0.7680004, 1.824321, 0.1686275, 0, 1, 1,
0.5873608, 0.5929428, -0.6427615, 0.1764706, 0, 1, 1,
0.5874993, 1.077503, 2.082527, 0.1803922, 0, 1, 1,
0.5884605, -0.9227192, 3.067854, 0.1882353, 0, 1, 1,
0.5892762, -1.269146, 1.834163, 0.1921569, 0, 1, 1,
0.5905528, -0.1539011, 1.680247, 0.2, 0, 1, 1,
0.5918334, -0.5311948, 0.1570136, 0.2078431, 0, 1, 1,
0.5953507, 2.289227, -0.5490703, 0.2117647, 0, 1, 1,
0.605042, -1.528653, 1.726339, 0.2196078, 0, 1, 1,
0.6053175, -0.1253041, 1.521878, 0.2235294, 0, 1, 1,
0.6062078, 0.06797832, 2.020999, 0.2313726, 0, 1, 1,
0.607563, 0.06909869, 1.55542, 0.2352941, 0, 1, 1,
0.6098986, -1.436867, 1.72137, 0.2431373, 0, 1, 1,
0.6099706, 1.125722, 0.9581157, 0.2470588, 0, 1, 1,
0.6131904, 0.170489, 2.710425, 0.254902, 0, 1, 1,
0.6161319, 0.1038686, 2.238863, 0.2588235, 0, 1, 1,
0.6195722, -0.2521894, 2.249205, 0.2666667, 0, 1, 1,
0.6257232, 0.4260711, 0.7211928, 0.2705882, 0, 1, 1,
0.62744, -0.716206, 2.734778, 0.2784314, 0, 1, 1,
0.6281807, -0.01502975, 2.068504, 0.282353, 0, 1, 1,
0.6297295, -0.3651795, 1.26205, 0.2901961, 0, 1, 1,
0.6326093, 0.555752, 2.393211, 0.2941177, 0, 1, 1,
0.6341482, -0.5168189, 2.742251, 0.3019608, 0, 1, 1,
0.6350909, 0.1209156, -0.39953, 0.3098039, 0, 1, 1,
0.6366907, 1.734499, 0.7092955, 0.3137255, 0, 1, 1,
0.6378272, 0.08947946, 2.759532, 0.3215686, 0, 1, 1,
0.6443419, -0.615298, 2.28146, 0.3254902, 0, 1, 1,
0.6453758, -0.4845848, 1.306838, 0.3333333, 0, 1, 1,
0.6473073, -1.39601, 4.702024, 0.3372549, 0, 1, 1,
0.6527669, -0.1621966, 3.261733, 0.345098, 0, 1, 1,
0.6553047, 0.3297009, -0.4559218, 0.3490196, 0, 1, 1,
0.6567059, 0.7747497, 0.6084632, 0.3568628, 0, 1, 1,
0.6569936, 0.1703865, 2.105803, 0.3607843, 0, 1, 1,
0.6603741, -0.8144968, 2.932412, 0.3686275, 0, 1, 1,
0.6615493, 1.156108, 1.101182, 0.372549, 0, 1, 1,
0.6624096, -1.757599, 2.92479, 0.3803922, 0, 1, 1,
0.6724497, -0.3415275, 1.336726, 0.3843137, 0, 1, 1,
0.6763239, -1.616034, 1.745516, 0.3921569, 0, 1, 1,
0.6764883, 0.3651716, 0.183746, 0.3960784, 0, 1, 1,
0.6806946, -0.8691844, 0.9691291, 0.4039216, 0, 1, 1,
0.6814268, 0.6309364, 0.9664333, 0.4117647, 0, 1, 1,
0.6829704, 1.254543, 0.07550781, 0.4156863, 0, 1, 1,
0.6841836, 1.665366, -1.961295, 0.4235294, 0, 1, 1,
0.6844724, 0.5952141, -0.4564572, 0.427451, 0, 1, 1,
0.6904897, -0.2384759, 2.015958, 0.4352941, 0, 1, 1,
0.6936018, 0.2538885, 0.8803254, 0.4392157, 0, 1, 1,
0.695287, 0.2443626, 1.906625, 0.4470588, 0, 1, 1,
0.7004743, 0.01470983, 1.269872, 0.4509804, 0, 1, 1,
0.7042497, -0.4134951, 2.953743, 0.4588235, 0, 1, 1,
0.7042722, -1.411377, 3.806345, 0.4627451, 0, 1, 1,
0.707317, -0.3711081, 2.25222, 0.4705882, 0, 1, 1,
0.7091938, -0.03948392, 0.7346132, 0.4745098, 0, 1, 1,
0.7101501, -0.0842397, 0.9920687, 0.4823529, 0, 1, 1,
0.7142698, 1.142589, -0.4692814, 0.4862745, 0, 1, 1,
0.7142787, -0.03326609, 1.65512, 0.4941176, 0, 1, 1,
0.7146041, -0.1697639, 1.764921, 0.5019608, 0, 1, 1,
0.7157055, -0.9451079, 0.8310785, 0.5058824, 0, 1, 1,
0.7196274, 1.797102, 0.7561681, 0.5137255, 0, 1, 1,
0.7258617, -0.09276424, 1.733939, 0.5176471, 0, 1, 1,
0.7290114, 0.3446768, 2.209444, 0.5254902, 0, 1, 1,
0.7349581, -0.7549555, 3.915694, 0.5294118, 0, 1, 1,
0.7376646, -0.09285653, 2.320886, 0.5372549, 0, 1, 1,
0.7378476, 0.1173664, 0.397429, 0.5411765, 0, 1, 1,
0.7424776, -0.4774418, 2.506406, 0.5490196, 0, 1, 1,
0.7464032, 3.079017, 1.511826, 0.5529412, 0, 1, 1,
0.7506646, 0.0228667, 1.454974, 0.5607843, 0, 1, 1,
0.7543259, 0.2134114, 2.361612, 0.5647059, 0, 1, 1,
0.7543381, 0.6451131, 1.50602, 0.572549, 0, 1, 1,
0.7544871, 0.3843152, 0.5967426, 0.5764706, 0, 1, 1,
0.7559726, 0.1166711, -0.7781498, 0.5843138, 0, 1, 1,
0.7604818, 1.494461, 1.055619, 0.5882353, 0, 1, 1,
0.7620522, 0.0786702, 2.141173, 0.5960785, 0, 1, 1,
0.7630389, 0.07281815, 2.79596, 0.6039216, 0, 1, 1,
0.7638086, -0.133955, 1.277737, 0.6078432, 0, 1, 1,
0.7674035, 0.3039813, 1.92554, 0.6156863, 0, 1, 1,
0.7708341, -0.3386435, 4.646839, 0.6196079, 0, 1, 1,
0.7750215, 0.5332497, 0.3261177, 0.627451, 0, 1, 1,
0.7768888, 0.1910586, -0.2009147, 0.6313726, 0, 1, 1,
0.7844947, 0.7195165, 1.611186, 0.6392157, 0, 1, 1,
0.7856753, -0.3018104, 1.984469, 0.6431373, 0, 1, 1,
0.7876258, -1.245555, 2.639804, 0.6509804, 0, 1, 1,
0.7882342, 0.008162334, 1.337217, 0.654902, 0, 1, 1,
0.7897521, -1.419753, 3.205822, 0.6627451, 0, 1, 1,
0.7902044, 0.779121, -0.266867, 0.6666667, 0, 1, 1,
0.7914687, -1.539379, 2.250326, 0.6745098, 0, 1, 1,
0.7958179, 0.3646987, 1.053949, 0.6784314, 0, 1, 1,
0.7962044, -0.1777375, 1.224619, 0.6862745, 0, 1, 1,
0.7995488, 0.1338334, 2.504074, 0.6901961, 0, 1, 1,
0.8038, 0.4784856, 1.902615, 0.6980392, 0, 1, 1,
0.8089948, 0.9074231, 0.3033372, 0.7058824, 0, 1, 1,
0.8138506, -0.2761652, 1.300164, 0.7098039, 0, 1, 1,
0.8160203, 0.6843379, 2.691634, 0.7176471, 0, 1, 1,
0.8184055, 0.7232326, 1.764537, 0.7215686, 0, 1, 1,
0.8206134, 0.8883032, 0.9269544, 0.7294118, 0, 1, 1,
0.8271178, 1.142225, 3.519915, 0.7333333, 0, 1, 1,
0.8282954, 0.3692618, 1.376619, 0.7411765, 0, 1, 1,
0.8289182, -0.4421666, 2.167348, 0.7450981, 0, 1, 1,
0.8321605, 0.60048, 1.127949, 0.7529412, 0, 1, 1,
0.8333152, -1.16625, 3.557748, 0.7568628, 0, 1, 1,
0.8431169, -0.899395, 1.862684, 0.7647059, 0, 1, 1,
0.843271, -2.377725, 2.102447, 0.7686275, 0, 1, 1,
0.8453172, -1.15749, 2.929914, 0.7764706, 0, 1, 1,
0.8487943, 0.9052052, 1.355222, 0.7803922, 0, 1, 1,
0.8491503, 0.1069895, -0.6091688, 0.7882353, 0, 1, 1,
0.8639071, 1.363341, 0.6751837, 0.7921569, 0, 1, 1,
0.8664384, -1.304334, 4.140161, 0.8, 0, 1, 1,
0.8681794, -0.8749429, 2.629241, 0.8078431, 0, 1, 1,
0.8687878, -0.4914283, 1.795741, 0.8117647, 0, 1, 1,
0.8701608, 0.3286618, 0.6149566, 0.8196079, 0, 1, 1,
0.8705066, -0.0952173, 0.5500581, 0.8235294, 0, 1, 1,
0.8740653, 0.5117965, 1.30827, 0.8313726, 0, 1, 1,
0.8753958, -1.558975, 3.478948, 0.8352941, 0, 1, 1,
0.8771625, -0.8966667, 2.90835, 0.8431373, 0, 1, 1,
0.8799278, -0.2338574, 3.823186, 0.8470588, 0, 1, 1,
0.8846492, 0.454152, 0.8900343, 0.854902, 0, 1, 1,
0.889069, 1.042988, 0.7628675, 0.8588235, 0, 1, 1,
0.889559, 0.06733991, 1.017113, 0.8666667, 0, 1, 1,
0.8957124, 0.3624572, -1.242709, 0.8705882, 0, 1, 1,
0.9056189, -2.595942, 3.163209, 0.8784314, 0, 1, 1,
0.9062573, -0.9277378, 2.269878, 0.8823529, 0, 1, 1,
0.9084868, 0.8932828, 1.551845, 0.8901961, 0, 1, 1,
0.9088407, -0.3186874, 1.730209, 0.8941177, 0, 1, 1,
0.9118721, 0.911281, 0.02087525, 0.9019608, 0, 1, 1,
0.9191326, -1.018255, 2.237384, 0.9098039, 0, 1, 1,
0.9216353, 0.7588003, 0.2863635, 0.9137255, 0, 1, 1,
0.9238179, -0.6429676, 0.5896621, 0.9215686, 0, 1, 1,
0.9264959, -0.8877126, 2.293437, 0.9254902, 0, 1, 1,
0.9269247, -0.3373226, 1.904151, 0.9333333, 0, 1, 1,
0.9293553, 1.925788, 1.386908, 0.9372549, 0, 1, 1,
0.9353251, -0.09689477, 1.725058, 0.945098, 0, 1, 1,
0.9382211, -1.422182, 0.7701014, 0.9490196, 0, 1, 1,
0.9419343, 2.163934, 1.917024, 0.9568627, 0, 1, 1,
0.9431567, -0.9821254, 1.612959, 0.9607843, 0, 1, 1,
0.9444481, 1.951717, 1.02141, 0.9686275, 0, 1, 1,
0.9467026, 0.8352806, 1.336632, 0.972549, 0, 1, 1,
0.9469408, -0.8442208, 3.01124, 0.9803922, 0, 1, 1,
0.9517914, -0.8341874, 2.819796, 0.9843137, 0, 1, 1,
0.9523102, 0.5894681, 0.3094876, 0.9921569, 0, 1, 1,
0.9538199, 0.9588989, 2.988498, 0.9960784, 0, 1, 1,
0.964151, -0.3202075, 0.8397616, 1, 0, 0.9960784, 1,
0.9694306, -1.13917, 1.428884, 1, 0, 0.9882353, 1,
0.9717993, 0.5471261, 0.8769549, 1, 0, 0.9843137, 1,
0.9802646, -0.02353235, 1.117712, 1, 0, 0.9764706, 1,
0.9817504, 1.424014, 0.375107, 1, 0, 0.972549, 1,
0.9829881, 0.4462099, 1.375181, 1, 0, 0.9647059, 1,
0.9849811, 0.9730871, -0.7246242, 1, 0, 0.9607843, 1,
0.9955231, -2.238302, 1.549333, 1, 0, 0.9529412, 1,
0.9957659, 0.7116217, -0.449864, 1, 0, 0.9490196, 1,
0.9993262, 1.460629, 0.1297667, 1, 0, 0.9411765, 1,
1.005273, -0.7749009, 2.758651, 1, 0, 0.9372549, 1,
1.007136, 1.128236, 0.6101151, 1, 0, 0.9294118, 1,
1.012774, 0.6947582, 0.582947, 1, 0, 0.9254902, 1,
1.012788, -0.9228008, 2.497872, 1, 0, 0.9176471, 1,
1.015468, 0.5598054, 1.902504, 1, 0, 0.9137255, 1,
1.01638, 0.3441251, 1.967168, 1, 0, 0.9058824, 1,
1.029083, 0.1828278, 3.427798, 1, 0, 0.9019608, 1,
1.040561, 1.800669, 3.224612, 1, 0, 0.8941177, 1,
1.049272, 1.691748, -0.6370881, 1, 0, 0.8862745, 1,
1.049936, -0.5340298, 1.077325, 1, 0, 0.8823529, 1,
1.050014, -0.1183689, 1.539965, 1, 0, 0.8745098, 1,
1.077806, 1.456427, -0.4989027, 1, 0, 0.8705882, 1,
1.086506, 0.5732272, 1.097848, 1, 0, 0.8627451, 1,
1.089265, -0.1176853, 1.795324, 1, 0, 0.8588235, 1,
1.091679, 1.098581, -0.2782843, 1, 0, 0.8509804, 1,
1.098432, 0.2700306, 1.447235, 1, 0, 0.8470588, 1,
1.099067, -1.083729, 2.838834, 1, 0, 0.8392157, 1,
1.101357, -1.4488, 3.504528, 1, 0, 0.8352941, 1,
1.105757, -0.2399054, -0.1725242, 1, 0, 0.827451, 1,
1.112007, -0.3435946, 0.8334505, 1, 0, 0.8235294, 1,
1.112923, -0.6538142, 1.483303, 1, 0, 0.8156863, 1,
1.119666, -0.2539518, 2.065418, 1, 0, 0.8117647, 1,
1.122574, -0.9695832, 2.170166, 1, 0, 0.8039216, 1,
1.130914, 0.500219, 0.663913, 1, 0, 0.7960784, 1,
1.132856, 1.182058, 0.9053417, 1, 0, 0.7921569, 1,
1.146296, 0.9196648, 1.212626, 1, 0, 0.7843137, 1,
1.146498, -0.9959363, 5.129657, 1, 0, 0.7803922, 1,
1.176155, 0.3007428, 1.806336, 1, 0, 0.772549, 1,
1.178319, 1.547145, -0.2780704, 1, 0, 0.7686275, 1,
1.18041, 0.239959, 0.5523516, 1, 0, 0.7607843, 1,
1.182324, 0.2539329, 1.044595, 1, 0, 0.7568628, 1,
1.186389, 0.7292609, 2.052391, 1, 0, 0.7490196, 1,
1.19591, -1.067904, 2.184381, 1, 0, 0.7450981, 1,
1.197426, 1.741916, -0.4658042, 1, 0, 0.7372549, 1,
1.206676, -1.233451, 4.367139, 1, 0, 0.7333333, 1,
1.217366, 0.2619731, 2.489506, 1, 0, 0.7254902, 1,
1.218235, 1.264664, 1.815686, 1, 0, 0.7215686, 1,
1.220696, -1.436677, 2.123656, 1, 0, 0.7137255, 1,
1.234182, -1.457312, 2.328786, 1, 0, 0.7098039, 1,
1.234407, -0.5996696, 3.209549, 1, 0, 0.7019608, 1,
1.238281, 0.5346242, 1.621362, 1, 0, 0.6941177, 1,
1.24067, 0.3221311, 1.206411, 1, 0, 0.6901961, 1,
1.244577, 0.4456772, 1.045992, 1, 0, 0.682353, 1,
1.252484, -0.1511828, 0.1468562, 1, 0, 0.6784314, 1,
1.279115, 1.240656, 1.228638, 1, 0, 0.6705883, 1,
1.279912, 1.156879, -0.1629056, 1, 0, 0.6666667, 1,
1.286164, -0.02561456, 3.088312, 1, 0, 0.6588235, 1,
1.293629, -0.2448469, 1.356223, 1, 0, 0.654902, 1,
1.306152, -0.8213316, 3.014162, 1, 0, 0.6470588, 1,
1.306361, 0.4008528, 2.338472, 1, 0, 0.6431373, 1,
1.309385, 0.1418312, 2.742272, 1, 0, 0.6352941, 1,
1.310124, -0.4796321, 2.653504, 1, 0, 0.6313726, 1,
1.310722, 1.065522, 1.567094, 1, 0, 0.6235294, 1,
1.325191, 1.452351, 2.121782, 1, 0, 0.6196079, 1,
1.328015, 2.497332, 0.9243785, 1, 0, 0.6117647, 1,
1.32975, -1.347259, 4.159164, 1, 0, 0.6078432, 1,
1.337932, 1.012568, 2.016057, 1, 0, 0.6, 1,
1.342116, -0.9213556, 2.450783, 1, 0, 0.5921569, 1,
1.350515, -1.842267, 1.832565, 1, 0, 0.5882353, 1,
1.352451, 0.08785814, 2.726984, 1, 0, 0.5803922, 1,
1.356293, 0.4025753, 1.428987, 1, 0, 0.5764706, 1,
1.370233, 0.8009378, 0.01012946, 1, 0, 0.5686275, 1,
1.373512, 1.259005, -0.1932016, 1, 0, 0.5647059, 1,
1.379336, -0.5444894, 2.974293, 1, 0, 0.5568628, 1,
1.382099, 1.125791, 0.8293259, 1, 0, 0.5529412, 1,
1.389748, -1.378404, 2.24779, 1, 0, 0.5450981, 1,
1.393213, -1.253131, 3.068016, 1, 0, 0.5411765, 1,
1.39415, 1.261203, 0.8587628, 1, 0, 0.5333334, 1,
1.394771, -0.3989718, 1.766355, 1, 0, 0.5294118, 1,
1.396151, -1.743592, 1.637883, 1, 0, 0.5215687, 1,
1.399668, 1.264976, 0.8084398, 1, 0, 0.5176471, 1,
1.406662, 0.9148855, 1.176709, 1, 0, 0.509804, 1,
1.422201, 0.4104813, 0.478686, 1, 0, 0.5058824, 1,
1.430875, -0.1074234, 1.535233, 1, 0, 0.4980392, 1,
1.433416, 1.18612, 0.6664816, 1, 0, 0.4901961, 1,
1.438349, -0.6628564, 1.900058, 1, 0, 0.4862745, 1,
1.448039, -0.6116438, 1.389286, 1, 0, 0.4784314, 1,
1.457954, -0.2734832, 2.088438, 1, 0, 0.4745098, 1,
1.480312, -2.330289, 1.614484, 1, 0, 0.4666667, 1,
1.483406, 0.03279776, 1.513734, 1, 0, 0.4627451, 1,
1.507963, 1.042558, 0.1497851, 1, 0, 0.454902, 1,
1.515037, -0.1343511, 1.857402, 1, 0, 0.4509804, 1,
1.530638, -1.071348, 2.338003, 1, 0, 0.4431373, 1,
1.537414, -0.5129123, 3.458357, 1, 0, 0.4392157, 1,
1.537889, -1.5313, -0.377058, 1, 0, 0.4313726, 1,
1.541511, 0.1712727, 1.339545, 1, 0, 0.427451, 1,
1.550044, -0.8710879, 2.563148, 1, 0, 0.4196078, 1,
1.558172, -0.7374373, 2.134706, 1, 0, 0.4156863, 1,
1.563369, -0.07475811, -0.1740988, 1, 0, 0.4078431, 1,
1.570444, 0.3841848, 1.902, 1, 0, 0.4039216, 1,
1.577623, 1.140288, 0.5496602, 1, 0, 0.3960784, 1,
1.586145, 0.5636775, 1.230793, 1, 0, 0.3882353, 1,
1.59337, 0.7776022, 1.415581, 1, 0, 0.3843137, 1,
1.593607, 0.3999987, 0.4174316, 1, 0, 0.3764706, 1,
1.602705, 0.2578454, 3.019054, 1, 0, 0.372549, 1,
1.609311, 0.04100144, 1.376079, 1, 0, 0.3647059, 1,
1.610213, 1.10255, 1.067457, 1, 0, 0.3607843, 1,
1.61306, -1.203356, 1.751597, 1, 0, 0.3529412, 1,
1.62422, 0.8065505, 0.8757749, 1, 0, 0.3490196, 1,
1.632991, -0.3471324, 2.803195, 1, 0, 0.3411765, 1,
1.635753, -1.65637, 3.902654, 1, 0, 0.3372549, 1,
1.640052, 0.5058758, 2.18089, 1, 0, 0.3294118, 1,
1.657222, -1.412269, 0.4893472, 1, 0, 0.3254902, 1,
1.659045, -0.5363342, 1.366613, 1, 0, 0.3176471, 1,
1.668032, -0.687717, 2.126942, 1, 0, 0.3137255, 1,
1.683883, -0.7473339, 1.512067, 1, 0, 0.3058824, 1,
1.695745, 0.682947, -0.7848079, 1, 0, 0.2980392, 1,
1.720367, -1.121147, 2.387388, 1, 0, 0.2941177, 1,
1.729926, 0.6615778, 0.5987839, 1, 0, 0.2862745, 1,
1.733552, 3.450598, 0.9466947, 1, 0, 0.282353, 1,
1.7471, 1.295889, -0.2963836, 1, 0, 0.2745098, 1,
1.771668, -0.9883172, 2.740143, 1, 0, 0.2705882, 1,
1.779549, -0.4168153, 2.777547, 1, 0, 0.2627451, 1,
1.785537, 1.038398, 0.2264903, 1, 0, 0.2588235, 1,
1.800293, -0.4735961, 0.3898257, 1, 0, 0.2509804, 1,
1.802613, -1.071223, 3.020734, 1, 0, 0.2470588, 1,
1.835651, -0.2387605, 2.372444, 1, 0, 0.2392157, 1,
1.83816, 0.2021016, 1.431209, 1, 0, 0.2352941, 1,
1.847048, 1.079395, 1.880365, 1, 0, 0.227451, 1,
1.851462, -0.7425221, 1.025742, 1, 0, 0.2235294, 1,
1.857988, -1.080263, 1.841049, 1, 0, 0.2156863, 1,
1.873883, -0.2097289, 2.736627, 1, 0, 0.2117647, 1,
1.911901, -0.1746413, -0.2497191, 1, 0, 0.2039216, 1,
1.945726, 0.3693689, 2.562586, 1, 0, 0.1960784, 1,
1.977927, 1.117913, 1.253988, 1, 0, 0.1921569, 1,
1.979023, 0.5185528, 0.02150512, 1, 0, 0.1843137, 1,
1.97955, 0.8785434, 0.08697896, 1, 0, 0.1803922, 1,
1.988373, 0.5062096, -0.03044986, 1, 0, 0.172549, 1,
1.997171, -0.4082852, 1.755452, 1, 0, 0.1686275, 1,
2.041199, 0.9926111, -0.7833782, 1, 0, 0.1607843, 1,
2.044888, 1.029588, 0.9884788, 1, 0, 0.1568628, 1,
2.047019, -0.4763041, 2.20676, 1, 0, 0.1490196, 1,
2.052633, -1.518093, 3.126565, 1, 0, 0.145098, 1,
2.102134, 0.4734704, 2.352394, 1, 0, 0.1372549, 1,
2.104372, -0.431506, 1.064881, 1, 0, 0.1333333, 1,
2.118601, 0.01762997, -1.109594, 1, 0, 0.1254902, 1,
2.119183, -0.879567, 1.180909, 1, 0, 0.1215686, 1,
2.119695, -2.034698, 2.308556, 1, 0, 0.1137255, 1,
2.124142, -1.340804, 2.261588, 1, 0, 0.1098039, 1,
2.146889, -1.09517, 0.9147137, 1, 0, 0.1019608, 1,
2.234506, -0.8981349, 1.575433, 1, 0, 0.09411765, 1,
2.278603, 0.8729457, 2.334336, 1, 0, 0.09019608, 1,
2.361323, -0.7806102, 1.026004, 1, 0, 0.08235294, 1,
2.393758, -1.395674, 1.958718, 1, 0, 0.07843138, 1,
2.405765, -1.32182, 1.509064, 1, 0, 0.07058824, 1,
2.512137, 0.09492435, 1.887451, 1, 0, 0.06666667, 1,
2.530507, 2.358619, 1.129785, 1, 0, 0.05882353, 1,
2.568742, 0.06607376, 2.721172, 1, 0, 0.05490196, 1,
2.620916, 0.7201759, 0.9697598, 1, 0, 0.04705882, 1,
2.63487, -0.2090388, 0.7564117, 1, 0, 0.04313726, 1,
2.733829, 1.014816, -0.6719011, 1, 0, 0.03529412, 1,
2.734128, -1.304701, 1.158535, 1, 0, 0.03137255, 1,
2.813944, -2.367953, 1.488474, 1, 0, 0.02352941, 1,
2.904924, -0.9751506, 0.7955126, 1, 0, 0.01960784, 1,
2.944606, -1.244236, 0.3039751, 1, 0, 0.01176471, 1,
3.144667, -0.1678279, 0.9161385, 1, 0, 0.007843138, 1
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
-0.08849263, -4.071128, -8.095762, 0, -0.5, 0.5, 0.5,
-0.08849263, -4.071128, -8.095762, 1, -0.5, 0.5, 0.5,
-0.08849263, -4.071128, -8.095762, 1, 1.5, 0.5, 0.5,
-0.08849263, -4.071128, -8.095762, 0, 1.5, 0.5, 0.5
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
-4.417694, 0.2348105, -8.095762, 0, -0.5, 0.5, 0.5,
-4.417694, 0.2348105, -8.095762, 1, -0.5, 0.5, 0.5,
-4.417694, 0.2348105, -8.095762, 1, 1.5, 0.5, 0.5,
-4.417694, 0.2348105, -8.095762, 0, 1.5, 0.5, 0.5
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
-4.417694, -4.071128, -0.09726191, 0, -0.5, 0.5, 0.5,
-4.417694, -4.071128, -0.09726191, 1, -0.5, 0.5, 0.5,
-4.417694, -4.071128, -0.09726191, 1, 1.5, 0.5, 0.5,
-4.417694, -4.071128, -0.09726191, 0, 1.5, 0.5, 0.5
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
-3, -3.07745, -6.249954,
3, -3.07745, -6.249954,
-3, -3.07745, -6.249954,
-3, -3.243063, -6.557589,
-2, -3.07745, -6.249954,
-2, -3.243063, -6.557589,
-1, -3.07745, -6.249954,
-1, -3.243063, -6.557589,
0, -3.07745, -6.249954,
0, -3.243063, -6.557589,
1, -3.07745, -6.249954,
1, -3.243063, -6.557589,
2, -3.07745, -6.249954,
2, -3.243063, -6.557589,
3, -3.07745, -6.249954,
3, -3.243063, -6.557589
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
-3, -3.574289, -7.172858, 0, -0.5, 0.5, 0.5,
-3, -3.574289, -7.172858, 1, -0.5, 0.5, 0.5,
-3, -3.574289, -7.172858, 1, 1.5, 0.5, 0.5,
-3, -3.574289, -7.172858, 0, 1.5, 0.5, 0.5,
-2, -3.574289, -7.172858, 0, -0.5, 0.5, 0.5,
-2, -3.574289, -7.172858, 1, -0.5, 0.5, 0.5,
-2, -3.574289, -7.172858, 1, 1.5, 0.5, 0.5,
-2, -3.574289, -7.172858, 0, 1.5, 0.5, 0.5,
-1, -3.574289, -7.172858, 0, -0.5, 0.5, 0.5,
-1, -3.574289, -7.172858, 1, -0.5, 0.5, 0.5,
-1, -3.574289, -7.172858, 1, 1.5, 0.5, 0.5,
-1, -3.574289, -7.172858, 0, 1.5, 0.5, 0.5,
0, -3.574289, -7.172858, 0, -0.5, 0.5, 0.5,
0, -3.574289, -7.172858, 1, -0.5, 0.5, 0.5,
0, -3.574289, -7.172858, 1, 1.5, 0.5, 0.5,
0, -3.574289, -7.172858, 0, 1.5, 0.5, 0.5,
1, -3.574289, -7.172858, 0, -0.5, 0.5, 0.5,
1, -3.574289, -7.172858, 1, -0.5, 0.5, 0.5,
1, -3.574289, -7.172858, 1, 1.5, 0.5, 0.5,
1, -3.574289, -7.172858, 0, 1.5, 0.5, 0.5,
2, -3.574289, -7.172858, 0, -0.5, 0.5, 0.5,
2, -3.574289, -7.172858, 1, -0.5, 0.5, 0.5,
2, -3.574289, -7.172858, 1, 1.5, 0.5, 0.5,
2, -3.574289, -7.172858, 0, 1.5, 0.5, 0.5,
3, -3.574289, -7.172858, 0, -0.5, 0.5, 0.5,
3, -3.574289, -7.172858, 1, -0.5, 0.5, 0.5,
3, -3.574289, -7.172858, 1, 1.5, 0.5, 0.5,
3, -3.574289, -7.172858, 0, 1.5, 0.5, 0.5
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
-3.418647, -2, -6.249954,
-3.418647, 3, -6.249954,
-3.418647, -2, -6.249954,
-3.585155, -2, -6.557589,
-3.418647, -1, -6.249954,
-3.585155, -1, -6.557589,
-3.418647, 0, -6.249954,
-3.585155, 0, -6.557589,
-3.418647, 1, -6.249954,
-3.585155, 1, -6.557589,
-3.418647, 2, -6.249954,
-3.585155, 2, -6.557589,
-3.418647, 3, -6.249954,
-3.585155, 3, -6.557589
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
-3.91817, -2, -7.172858, 0, -0.5, 0.5, 0.5,
-3.91817, -2, -7.172858, 1, -0.5, 0.5, 0.5,
-3.91817, -2, -7.172858, 1, 1.5, 0.5, 0.5,
-3.91817, -2, -7.172858, 0, 1.5, 0.5, 0.5,
-3.91817, -1, -7.172858, 0, -0.5, 0.5, 0.5,
-3.91817, -1, -7.172858, 1, -0.5, 0.5, 0.5,
-3.91817, -1, -7.172858, 1, 1.5, 0.5, 0.5,
-3.91817, -1, -7.172858, 0, 1.5, 0.5, 0.5,
-3.91817, 0, -7.172858, 0, -0.5, 0.5, 0.5,
-3.91817, 0, -7.172858, 1, -0.5, 0.5, 0.5,
-3.91817, 0, -7.172858, 1, 1.5, 0.5, 0.5,
-3.91817, 0, -7.172858, 0, 1.5, 0.5, 0.5,
-3.91817, 1, -7.172858, 0, -0.5, 0.5, 0.5,
-3.91817, 1, -7.172858, 1, -0.5, 0.5, 0.5,
-3.91817, 1, -7.172858, 1, 1.5, 0.5, 0.5,
-3.91817, 1, -7.172858, 0, 1.5, 0.5, 0.5,
-3.91817, 2, -7.172858, 0, -0.5, 0.5, 0.5,
-3.91817, 2, -7.172858, 1, -0.5, 0.5, 0.5,
-3.91817, 2, -7.172858, 1, 1.5, 0.5, 0.5,
-3.91817, 2, -7.172858, 0, 1.5, 0.5, 0.5,
-3.91817, 3, -7.172858, 0, -0.5, 0.5, 0.5,
-3.91817, 3, -7.172858, 1, -0.5, 0.5, 0.5,
-3.91817, 3, -7.172858, 1, 1.5, 0.5, 0.5,
-3.91817, 3, -7.172858, 0, 1.5, 0.5, 0.5
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
-3.418647, -3.07745, -6,
-3.418647, -3.07745, 4,
-3.418647, -3.07745, -6,
-3.585155, -3.243063, -6,
-3.418647, -3.07745, -4,
-3.585155, -3.243063, -4,
-3.418647, -3.07745, -2,
-3.585155, -3.243063, -2,
-3.418647, -3.07745, 0,
-3.585155, -3.243063, 0,
-3.418647, -3.07745, 2,
-3.585155, -3.243063, 2,
-3.418647, -3.07745, 4,
-3.585155, -3.243063, 4
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
"-6",
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
-3.91817, -3.574289, -6, 0, -0.5, 0.5, 0.5,
-3.91817, -3.574289, -6, 1, -0.5, 0.5, 0.5,
-3.91817, -3.574289, -6, 1, 1.5, 0.5, 0.5,
-3.91817, -3.574289, -6, 0, 1.5, 0.5, 0.5,
-3.91817, -3.574289, -4, 0, -0.5, 0.5, 0.5,
-3.91817, -3.574289, -4, 1, -0.5, 0.5, 0.5,
-3.91817, -3.574289, -4, 1, 1.5, 0.5, 0.5,
-3.91817, -3.574289, -4, 0, 1.5, 0.5, 0.5,
-3.91817, -3.574289, -2, 0, -0.5, 0.5, 0.5,
-3.91817, -3.574289, -2, 1, -0.5, 0.5, 0.5,
-3.91817, -3.574289, -2, 1, 1.5, 0.5, 0.5,
-3.91817, -3.574289, -2, 0, 1.5, 0.5, 0.5,
-3.91817, -3.574289, 0, 0, -0.5, 0.5, 0.5,
-3.91817, -3.574289, 0, 1, -0.5, 0.5, 0.5,
-3.91817, -3.574289, 0, 1, 1.5, 0.5, 0.5,
-3.91817, -3.574289, 0, 0, 1.5, 0.5, 0.5,
-3.91817, -3.574289, 2, 0, -0.5, 0.5, 0.5,
-3.91817, -3.574289, 2, 1, -0.5, 0.5, 0.5,
-3.91817, -3.574289, 2, 1, 1.5, 0.5, 0.5,
-3.91817, -3.574289, 2, 0, 1.5, 0.5, 0.5,
-3.91817, -3.574289, 4, 0, -0.5, 0.5, 0.5,
-3.91817, -3.574289, 4, 1, -0.5, 0.5, 0.5,
-3.91817, -3.574289, 4, 1, 1.5, 0.5, 0.5,
-3.91817, -3.574289, 4, 0, 1.5, 0.5, 0.5
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
-3.418647, -3.07745, -6.249954,
-3.418647, 3.547071, -6.249954,
-3.418647, -3.07745, 6.05543,
-3.418647, 3.547071, 6.05543,
-3.418647, -3.07745, -6.249954,
-3.418647, -3.07745, 6.05543,
-3.418647, 3.547071, -6.249954,
-3.418647, 3.547071, 6.05543,
-3.418647, -3.07745, -6.249954,
3.241662, -3.07745, -6.249954,
-3.418647, -3.07745, 6.05543,
3.241662, -3.07745, 6.05543,
-3.418647, 3.547071, -6.249954,
3.241662, 3.547071, -6.249954,
-3.418647, 3.547071, 6.05543,
3.241662, 3.547071, 6.05543,
3.241662, -3.07745, -6.249954,
3.241662, 3.547071, -6.249954,
3.241662, -3.07745, 6.05543,
3.241662, 3.547071, 6.05543,
3.241662, -3.07745, -6.249954,
3.241662, -3.07745, 6.05543,
3.241662, 3.547071, -6.249954,
3.241662, 3.547071, 6.05543
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
var radius = 8.266642;
var distance = 36.77922;
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
mvMatrix.translate( 0.08849263, -0.2348105, 0.09726191 );
mvMatrix.scale( 1.341988, 1.349238, 0.7263532 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.77922);
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
sprinkle<-read.table("sprinkle.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-sprinkle$V2
```

```
## Error in eval(expr, envir, enclos): object 'sprinkle' not found
```

```r
y<-sprinkle$V3
```

```
## Error in eval(expr, envir, enclos): object 'sprinkle' not found
```

```r
z<-sprinkle$V4
```

```
## Error in eval(expr, envir, enclos): object 'sprinkle' not found
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
-3.321652, -0.4956262, -2.786762, 0, 0, 1, 1, 1,
-3.166513, -0.07914878, -1.971268, 1, 0, 0, 1, 1,
-3.032997, -1.472912, -1.575158, 1, 0, 0, 1, 1,
-2.765825, -0.5067346, -3.118289, 1, 0, 0, 1, 1,
-2.760954, -0.2111745, -1.28864, 1, 0, 0, 1, 1,
-2.746184, -0.8317949, -2.963061, 1, 0, 0, 1, 1,
-2.706481, -1.119447, -3.210376, 0, 0, 0, 1, 1,
-2.549252, 0.3082563, -1.226921, 0, 0, 0, 1, 1,
-2.482201, 0.7864625, -1.514145, 0, 0, 0, 1, 1,
-2.454379, -0.5051529, -1.610369, 0, 0, 0, 1, 1,
-2.337981, -0.5043674, -1.188405, 0, 0, 0, 1, 1,
-2.277057, -1.819518, -3.516999, 0, 0, 0, 1, 1,
-2.260378, -1.697218, -3.10977, 0, 0, 0, 1, 1,
-2.183009, 1.45457, -1.275123, 1, 1, 1, 1, 1,
-2.162173, 0.7352095, -2.031357, 1, 1, 1, 1, 1,
-2.147094, -0.169655, -1.14582, 1, 1, 1, 1, 1,
-2.131821, -1.188435, -3.043159, 1, 1, 1, 1, 1,
-2.106507, -1.395602, -1.140167, 1, 1, 1, 1, 1,
-2.088062, 0.2881834, 0.3153197, 1, 1, 1, 1, 1,
-2.079003, -0.5356846, -1.185973, 1, 1, 1, 1, 1,
-2.076706, 0.1736264, -1.727799, 1, 1, 1, 1, 1,
-2.033405, 0.9873456, -1.05128, 1, 1, 1, 1, 1,
-2.025954, 2.13506, -0.1005282, 1, 1, 1, 1, 1,
-2.00641, -0.4662974, -3.631171, 1, 1, 1, 1, 1,
-2.000262, -0.2792273, -0.9181148, 1, 1, 1, 1, 1,
-1.970923, -0.4555965, -3.071264, 1, 1, 1, 1, 1,
-1.949307, -2.116507, -2.669164, 1, 1, 1, 1, 1,
-1.948603, 0.04112916, -0.8554076, 1, 1, 1, 1, 1,
-1.939065, -0.4947725, -2.380589, 0, 0, 1, 1, 1,
-1.935971, -1.019147, -2.127402, 1, 0, 0, 1, 1,
-1.910306, 0.8772394, 1.332862, 1, 0, 0, 1, 1,
-1.907592, 0.2200594, -2.495706, 1, 0, 0, 1, 1,
-1.894324, -0.4258327, -1.395631, 1, 0, 0, 1, 1,
-1.876127, 1.110797, -1.921074, 1, 0, 0, 1, 1,
-1.855487, -0.8247115, -0.6942182, 0, 0, 0, 1, 1,
-1.844615, 0.8015303, 0.5078911, 0, 0, 0, 1, 1,
-1.827478, 0.2177854, -1.742505, 0, 0, 0, 1, 1,
-1.823109, 0.4828173, -2.221719, 0, 0, 0, 1, 1,
-1.822778, 0.4991834, -0.4488829, 0, 0, 0, 1, 1,
-1.820276, 0.01777639, -0.6819463, 0, 0, 0, 1, 1,
-1.812835, 0.9399422, -1.12292, 0, 0, 0, 1, 1,
-1.800987, -0.9411829, -0.9653367, 1, 1, 1, 1, 1,
-1.799558, 0.6039067, -1.946288, 1, 1, 1, 1, 1,
-1.79695, -0.2026023, -0.9426134, 1, 1, 1, 1, 1,
-1.79452, 0.9586617, -1.207519, 1, 1, 1, 1, 1,
-1.787548, 0.3281932, -2.935887, 1, 1, 1, 1, 1,
-1.778025, 0.2665362, -1.63344, 1, 1, 1, 1, 1,
-1.770204, 1.137056, 0.03589333, 1, 1, 1, 1, 1,
-1.754844, 0.9324612, -2.079351, 1, 1, 1, 1, 1,
-1.742173, 0.2736716, -1.03005, 1, 1, 1, 1, 1,
-1.741684, -0.04512557, -1.754788, 1, 1, 1, 1, 1,
-1.736401, -1.088927, -3.587202, 1, 1, 1, 1, 1,
-1.720176, -0.5269721, -0.784168, 1, 1, 1, 1, 1,
-1.67906, -1.482259, -0.8205739, 1, 1, 1, 1, 1,
-1.66748, -0.0627342, -1.271781, 1, 1, 1, 1, 1,
-1.651945, -0.558618, -2.83967, 1, 1, 1, 1, 1,
-1.629233, -0.8664825, -0.4769892, 0, 0, 1, 1, 1,
-1.624595, -0.4351991, -2.029849, 1, 0, 0, 1, 1,
-1.613921, -2.040049, -0.7334618, 1, 0, 0, 1, 1,
-1.610233, 0.5390383, -1.085315, 1, 0, 0, 1, 1,
-1.576353, -1.124774, -0.1009149, 1, 0, 0, 1, 1,
-1.563732, 0.5206698, -2.908119, 1, 0, 0, 1, 1,
-1.550971, -1.110916, -1.742889, 0, 0, 0, 1, 1,
-1.550041, 0.406168, -2.130687, 0, 0, 0, 1, 1,
-1.533162, 0.2460799, -0.818931, 0, 0, 0, 1, 1,
-1.526676, 0.2250858, -2.986232, 0, 0, 0, 1, 1,
-1.525394, 1.6185, -1.605165, 0, 0, 0, 1, 1,
-1.5187, -0.7162949, -2.041775, 0, 0, 0, 1, 1,
-1.518602, 0.359137, -1.288625, 0, 0, 0, 1, 1,
-1.517152, -0.2042689, -2.258645, 1, 1, 1, 1, 1,
-1.512677, -1.440914, -3.796241, 1, 1, 1, 1, 1,
-1.495829, 0.3279839, 0.4310327, 1, 1, 1, 1, 1,
-1.487417, -0.7528985, -2.410281, 1, 1, 1, 1, 1,
-1.484843, 1.585252, 0.3988223, 1, 1, 1, 1, 1,
-1.484783, 1.743558, -0.9575732, 1, 1, 1, 1, 1,
-1.478611, 2.768322, -0.04009071, 1, 1, 1, 1, 1,
-1.476603, -0.8343729, -2.274523, 1, 1, 1, 1, 1,
-1.473721, -1.150176, -1.044798, 1, 1, 1, 1, 1,
-1.473595, 0.4837186, -1.857041, 1, 1, 1, 1, 1,
-1.466552, 0.1571208, -2.788004, 1, 1, 1, 1, 1,
-1.462434, -0.6848963, -1.419052, 1, 1, 1, 1, 1,
-1.460396, -0.9282342, -1.01916, 1, 1, 1, 1, 1,
-1.448609, 0.8597731, 0.3279664, 1, 1, 1, 1, 1,
-1.424118, 0.1022734, -4.403414, 1, 1, 1, 1, 1,
-1.41685, 1.633661, -0.3137487, 0, 0, 1, 1, 1,
-1.395574, -0.565572, -0.3178473, 1, 0, 0, 1, 1,
-1.390677, 0.3862469, -2.624858, 1, 0, 0, 1, 1,
-1.387996, 0.5232037, -0.9375947, 1, 0, 0, 1, 1,
-1.38335, -1.07828, -2.43399, 1, 0, 0, 1, 1,
-1.380392, 0.121714, -2.478059, 1, 0, 0, 1, 1,
-1.379278, 0.1039232, -2.603805, 0, 0, 0, 1, 1,
-1.378581, -0.7968611, -2.047098, 0, 0, 0, 1, 1,
-1.347332, -0.06716917, -1.3451, 0, 0, 0, 1, 1,
-1.343868, 1.730538, -0.1278889, 0, 0, 0, 1, 1,
-1.341913, -1.071888, -3.753361, 0, 0, 0, 1, 1,
-1.335962, 0.5776236, -0.999754, 0, 0, 0, 1, 1,
-1.33505, -0.1944106, -1.937323, 0, 0, 0, 1, 1,
-1.332952, -0.2689575, -0.8519278, 1, 1, 1, 1, 1,
-1.320043, 0.4362478, -2.363962, 1, 1, 1, 1, 1,
-1.315096, -2.234174, -5.002908, 1, 1, 1, 1, 1,
-1.312486, 0.04994014, -1.738813, 1, 1, 1, 1, 1,
-1.307871, 0.1887942, -0.2770434, 1, 1, 1, 1, 1,
-1.290297, 0.5722999, -1.021501, 1, 1, 1, 1, 1,
-1.284433, 0.463524, -1.696803, 1, 1, 1, 1, 1,
-1.281536, -0.5931146, -4.076889, 1, 1, 1, 1, 1,
-1.273645, 1.610811, -0.0149245, 1, 1, 1, 1, 1,
-1.268168, -0.9033205, -1.8595, 1, 1, 1, 1, 1,
-1.265075, -2.980977, -3.566933, 1, 1, 1, 1, 1,
-1.259856, -0.3110971, -2.669899, 1, 1, 1, 1, 1,
-1.25644, -0.3174364, -2.070218, 1, 1, 1, 1, 1,
-1.253487, -0.9966502, -2.092712, 1, 1, 1, 1, 1,
-1.251739, -0.5623986, -3.216176, 1, 1, 1, 1, 1,
-1.239922, -0.1426312, -0.7856243, 0, 0, 1, 1, 1,
-1.238674, 1.341456, -0.2761547, 1, 0, 0, 1, 1,
-1.229105, -1.562137, -1.175597, 1, 0, 0, 1, 1,
-1.226026, -1.744276, -2.418339, 1, 0, 0, 1, 1,
-1.22464, -0.936744, -0.2249246, 1, 0, 0, 1, 1,
-1.222449, 2.198636, -0.4204378, 1, 0, 0, 1, 1,
-1.222042, -0.6175047, -2.595639, 0, 0, 0, 1, 1,
-1.214787, -0.8175612, -1.446128, 0, 0, 0, 1, 1,
-1.210507, -0.5477083, -0.018877, 0, 0, 0, 1, 1,
-1.202526, 0.4837227, -2.314902, 0, 0, 0, 1, 1,
-1.201193, 0.7648103, 0.4090919, 0, 0, 0, 1, 1,
-1.197642, -0.2992285, -1.935328, 0, 0, 0, 1, 1,
-1.188051, -0.7613849, -2.549688, 0, 0, 0, 1, 1,
-1.177396, -0.2883427, -2.051801, 1, 1, 1, 1, 1,
-1.176403, 0.6548987, -0.5054166, 1, 1, 1, 1, 1,
-1.175727, -1.676973, -0.9990186, 1, 1, 1, 1, 1,
-1.165765, -0.09629726, -2.673044, 1, 1, 1, 1, 1,
-1.162521, 0.3392912, -0.5512322, 1, 1, 1, 1, 1,
-1.160073, 0.4592583, 1.725551, 1, 1, 1, 1, 1,
-1.147496, -1.16302, -2.490465, 1, 1, 1, 1, 1,
-1.14584, 1.494897, -1.471653, 1, 1, 1, 1, 1,
-1.137541, 0.04265531, -1.868663, 1, 1, 1, 1, 1,
-1.13581, 0.7554668, -0.7355983, 1, 1, 1, 1, 1,
-1.129104, -1.774163, -3.953188, 1, 1, 1, 1, 1,
-1.128698, -0.1092449, -2.8567, 1, 1, 1, 1, 1,
-1.125999, -0.4030655, -1.422313, 1, 1, 1, 1, 1,
-1.121137, -0.5780653, -2.859637, 1, 1, 1, 1, 1,
-1.114054, -0.4233257, -1.256127, 1, 1, 1, 1, 1,
-1.11297, -0.08727051, -0.7062055, 0, 0, 1, 1, 1,
-1.112954, 0.5075614, -0.2590854, 1, 0, 0, 1, 1,
-1.111186, -0.1980084, -1.467282, 1, 0, 0, 1, 1,
-1.099633, 0.5156034, -0.5636479, 1, 0, 0, 1, 1,
-1.098396, 0.8903308, -0.3822429, 1, 0, 0, 1, 1,
-1.095164, -0.3472593, -3.953121, 1, 0, 0, 1, 1,
-1.094331, 0.1350522, -1.333832, 0, 0, 0, 1, 1,
-1.087236, 0.210805, -3.425755, 0, 0, 0, 1, 1,
-1.080785, -1.143383, -2.845783, 0, 0, 0, 1, 1,
-1.07656, 1.302387, -0.7368289, 0, 0, 0, 1, 1,
-1.071871, 0.6175007, -2.578181, 0, 0, 0, 1, 1,
-1.057384, 0.02247952, -2.141037, 0, 0, 0, 1, 1,
-1.055906, 0.3180346, -0.3037775, 0, 0, 0, 1, 1,
-1.041876, 0.08840054, -1.664692, 1, 1, 1, 1, 1,
-1.031072, -1.458044, -1.919556, 1, 1, 1, 1, 1,
-1.03028, 0.3177319, -0.9039316, 1, 1, 1, 1, 1,
-1.024554, -1.331438, -2.587415, 1, 1, 1, 1, 1,
-1.020834, 0.4002449, -0.1445953, 1, 1, 1, 1, 1,
-1.018142, -0.008847536, -1.183683, 1, 1, 1, 1, 1,
-1.013333, 0.3984959, -1.422999, 1, 1, 1, 1, 1,
-1.009196, 1.596028, -0.9601129, 1, 1, 1, 1, 1,
-1.003135, 0.1064813, -2.170895, 1, 1, 1, 1, 1,
-1.000777, 0.849708, 1.225363, 1, 1, 1, 1, 1,
-0.994859, -0.7064528, -2.016633, 1, 1, 1, 1, 1,
-0.9838749, -0.9388374, -3.82256, 1, 1, 1, 1, 1,
-0.9826351, -0.5003076, -2.35544, 1, 1, 1, 1, 1,
-0.971355, -1.220666, -2.71032, 1, 1, 1, 1, 1,
-0.9646326, 0.4311021, -0.6802812, 1, 1, 1, 1, 1,
-0.9616447, 0.221792, -0.9931026, 0, 0, 1, 1, 1,
-0.9548978, 0.1914113, -0.3887593, 1, 0, 0, 1, 1,
-0.9517469, -1.676422, -3.796184, 1, 0, 0, 1, 1,
-0.9485958, -0.4937221, -2.353497, 1, 0, 0, 1, 1,
-0.946616, -0.0650427, -3.038206, 1, 0, 0, 1, 1,
-0.9427349, -1.351425, -3.101519, 1, 0, 0, 1, 1,
-0.9422513, 0.9532948, -0.312366, 0, 0, 0, 1, 1,
-0.9405528, -0.6145457, -3.519823, 0, 0, 0, 1, 1,
-0.9190118, -0.2176174, -1.04824, 0, 0, 0, 1, 1,
-0.9102877, 2.083327, -1.82888, 0, 0, 0, 1, 1,
-0.9088364, 0.03023876, -2.647859, 0, 0, 0, 1, 1,
-0.9085139, -0.5312167, -3.876128, 0, 0, 0, 1, 1,
-0.904227, 0.05289265, -1.560161, 0, 0, 0, 1, 1,
-0.8968977, -0.8761855, -4.162437, 1, 1, 1, 1, 1,
-0.8922878, 2.015763, -0.5307553, 1, 1, 1, 1, 1,
-0.8911804, 2.417841, -0.4957947, 1, 1, 1, 1, 1,
-0.8879025, -0.2167955, -0.4800447, 1, 1, 1, 1, 1,
-0.8841717, -1.077769, -3.311152, 1, 1, 1, 1, 1,
-0.8835578, 0.1136782, -0.5676261, 1, 1, 1, 1, 1,
-0.8778503, -1.509639, -4.007558, 1, 1, 1, 1, 1,
-0.8766722, -0.4105988, -2.757251, 1, 1, 1, 1, 1,
-0.8686271, -0.04144705, -1.495752, 1, 1, 1, 1, 1,
-0.8677962, -0.1384585, -1.205428, 1, 1, 1, 1, 1,
-0.8586949, 0.3045994, -1.290839, 1, 1, 1, 1, 1,
-0.8579645, -0.3398017, 0.9443877, 1, 1, 1, 1, 1,
-0.8569502, 0.3464601, -1.322137, 1, 1, 1, 1, 1,
-0.8561731, 1.091836, 0.1080155, 1, 1, 1, 1, 1,
-0.8541359, 0.2544614, -1.554369, 1, 1, 1, 1, 1,
-0.8505994, -0.429682, -1.034402, 0, 0, 1, 1, 1,
-0.8495467, 0.1648178, -1.964743, 1, 0, 0, 1, 1,
-0.8430693, -0.3729886, -0.3585993, 1, 0, 0, 1, 1,
-0.8428656, -0.5406737, -2.74885, 1, 0, 0, 1, 1,
-0.8412295, -0.9420547, -0.2420512, 1, 0, 0, 1, 1,
-0.8387645, 0.5873048, 0.6663834, 1, 0, 0, 1, 1,
-0.8384387, 0.3273654, 0.1558848, 0, 0, 0, 1, 1,
-0.8366201, 0.8283417, -0.4809285, 0, 0, 0, 1, 1,
-0.8340417, 1.205989, -0.08540086, 0, 0, 0, 1, 1,
-0.8335609, 0.212515, -0.2551166, 0, 0, 0, 1, 1,
-0.8326371, 0.3876683, -0.9184666, 0, 0, 0, 1, 1,
-0.8324817, 0.2430196, 0.138199, 0, 0, 0, 1, 1,
-0.8319371, -0.8362391, -2.60351, 0, 0, 0, 1, 1,
-0.8217074, 0.6843574, -3.397461, 1, 1, 1, 1, 1,
-0.8181644, -1.709242, -2.638496, 1, 1, 1, 1, 1,
-0.801963, -1.231442, -3.125449, 1, 1, 1, 1, 1,
-0.8005205, 1.200925, -0.8189332, 1, 1, 1, 1, 1,
-0.8003478, -1.621021, -2.986287, 1, 1, 1, 1, 1,
-0.7945627, -0.7907136, -3.454277, 1, 1, 1, 1, 1,
-0.7919965, -0.2412687, -1.940855, 1, 1, 1, 1, 1,
-0.7897487, -0.009711215, -0.9018419, 1, 1, 1, 1, 1,
-0.787017, -2.038895, -1.862067, 1, 1, 1, 1, 1,
-0.7868382, -0.6756096, -0.9432573, 1, 1, 1, 1, 1,
-0.7856486, -0.01258159, -2.494653, 1, 1, 1, 1, 1,
-0.7813026, -0.7800245, -1.718011, 1, 1, 1, 1, 1,
-0.7769809, -1.565425, -0.5873308, 1, 1, 1, 1, 1,
-0.7740976, 0.5356704, -3.045168, 1, 1, 1, 1, 1,
-0.7686393, -0.332946, -2.866432, 1, 1, 1, 1, 1,
-0.7605655, -1.975032, -2.589816, 0, 0, 1, 1, 1,
-0.744266, 0.2095242, -0.3379877, 1, 0, 0, 1, 1,
-0.7411802, 0.3743242, -2.861286, 1, 0, 0, 1, 1,
-0.7338977, 0.08239847, -2.480249, 1, 0, 0, 1, 1,
-0.7320665, 0.8646276, 0.2574249, 1, 0, 0, 1, 1,
-0.7304647, 0.7074592, -0.9437563, 1, 0, 0, 1, 1,
-0.7270517, 0.2344611, -1.20505, 0, 0, 0, 1, 1,
-0.7266417, -0.4076892, -2.294894, 0, 0, 0, 1, 1,
-0.7129895, 0.9771035, 0.2062022, 0, 0, 0, 1, 1,
-0.7100578, -0.8755125, -2.655474, 0, 0, 0, 1, 1,
-0.7070913, -0.7378669, -2.569839, 0, 0, 0, 1, 1,
-0.7063013, 0.3752517, 1.762087, 0, 0, 0, 1, 1,
-0.7041218, -0.2306185, -3.168746, 0, 0, 0, 1, 1,
-0.6971618, 0.1178237, -1.513807, 1, 1, 1, 1, 1,
-0.6961471, 0.6239588, -1.548794, 1, 1, 1, 1, 1,
-0.6951735, -0.1725556, -2.526863, 1, 1, 1, 1, 1,
-0.6932688, 0.3351838, -0.3328448, 1, 1, 1, 1, 1,
-0.6883551, 0.1318869, -3.723657, 1, 1, 1, 1, 1,
-0.6872982, -0.1696205, -1.917277, 1, 1, 1, 1, 1,
-0.6806397, -2.040824, -2.78799, 1, 1, 1, 1, 1,
-0.6801879, -0.7001027, -2.699556, 1, 1, 1, 1, 1,
-0.6782119, 0.09968551, -2.078459, 1, 1, 1, 1, 1,
-0.6753438, 1.910251, -1.972586, 1, 1, 1, 1, 1,
-0.6726263, -0.1419891, -2.701042, 1, 1, 1, 1, 1,
-0.6690782, -0.4571898, -1.514586, 1, 1, 1, 1, 1,
-0.6642334, -0.6076185, -1.758711, 1, 1, 1, 1, 1,
-0.6615479, 0.6764438, -0.3800415, 1, 1, 1, 1, 1,
-0.6523113, 0.7207928, -1.435361, 1, 1, 1, 1, 1,
-0.6511742, -0.9399618, -2.501671, 0, 0, 1, 1, 1,
-0.649752, 0.5493746, -1.234194, 1, 0, 0, 1, 1,
-0.6458651, 0.0479521, -3.557256, 1, 0, 0, 1, 1,
-0.6414091, 0.8283581, -1.573673, 1, 0, 0, 1, 1,
-0.6413775, -0.810782, -3.568124, 1, 0, 0, 1, 1,
-0.6404142, -0.300624, -1.239277, 1, 0, 0, 1, 1,
-0.6345258, -0.9606438, -3.230067, 0, 0, 0, 1, 1,
-0.6308466, 1.144928, 0.04021677, 0, 0, 0, 1, 1,
-0.627808, -1.163957, -2.031023, 0, 0, 0, 1, 1,
-0.62563, -0.1756311, -1.719363, 0, 0, 0, 1, 1,
-0.6241871, -0.6706126, -1.537523, 0, 0, 0, 1, 1,
-0.6226581, 0.01709473, -0.6430853, 0, 0, 0, 1, 1,
-0.6214886, -1.297342, -3.232057, 0, 0, 0, 1, 1,
-0.6208969, -0.446861, -3.532154, 1, 1, 1, 1, 1,
-0.6194137, 1.065822, -1.616961, 1, 1, 1, 1, 1,
-0.618259, -0.304722, -0.9236386, 1, 1, 1, 1, 1,
-0.6173918, 1.435755, -0.3890873, 1, 1, 1, 1, 1,
-0.6162592, 0.1511485, -0.2032968, 1, 1, 1, 1, 1,
-0.6148359, 0.5138971, -1.688775, 1, 1, 1, 1, 1,
-0.610909, 0.4832265, -0.8641145, 1, 1, 1, 1, 1,
-0.61059, 0.4773818, -0.3803349, 1, 1, 1, 1, 1,
-0.6090257, 0.06207372, -2.449467, 1, 1, 1, 1, 1,
-0.6057633, -1.035792, -2.870302, 1, 1, 1, 1, 1,
-0.6049719, 0.849858, -1.920966, 1, 1, 1, 1, 1,
-0.5986971, -0.1426557, -2.702866, 1, 1, 1, 1, 1,
-0.5970655, 1.433079, 0.2379612, 1, 1, 1, 1, 1,
-0.5947237, 0.9385146, 1.780771, 1, 1, 1, 1, 1,
-0.5945953, -1.503809, -1.680522, 1, 1, 1, 1, 1,
-0.5921515, 0.3037274, -2.165661, 0, 0, 1, 1, 1,
-0.5872678, 0.461984, -1.156085, 1, 0, 0, 1, 1,
-0.5862325, 0.5450327, -0.4159971, 1, 0, 0, 1, 1,
-0.5858368, -0.3431087, -2.783211, 1, 0, 0, 1, 1,
-0.5827442, -0.8052279, -2.38653, 1, 0, 0, 1, 1,
-0.5723355, -1.877882, -2.194439, 1, 0, 0, 1, 1,
-0.5647434, -0.1320009, -2.825283, 0, 0, 0, 1, 1,
-0.5605113, 1.370643, -1.889206, 0, 0, 0, 1, 1,
-0.5577834, 0.5651369, -1.511229, 0, 0, 0, 1, 1,
-0.5566754, -0.4978679, -0.955512, 0, 0, 0, 1, 1,
-0.5503104, -2.001142, -3.37052, 0, 0, 0, 1, 1,
-0.5483153, -1.439193, -3.598722, 0, 0, 0, 1, 1,
-0.5475518, 1.36749, 1.113851, 0, 0, 0, 1, 1,
-0.5436674, -0.808651, -2.589821, 1, 1, 1, 1, 1,
-0.5411192, -0.8943891, -4.294131, 1, 1, 1, 1, 1,
-0.5355167, -0.727478, -3.103587, 1, 1, 1, 1, 1,
-0.5276152, -1.116658, -1.819061, 1, 1, 1, 1, 1,
-0.5190405, 0.6518047, -1.403763, 1, 1, 1, 1, 1,
-0.5029709, -0.09864094, 0.4163403, 1, 1, 1, 1, 1,
-0.4984826, -0.05878577, -1.026782, 1, 1, 1, 1, 1,
-0.495244, 1.547818, -0.4626002, 1, 1, 1, 1, 1,
-0.4941288, -1.839854, -0.8846627, 1, 1, 1, 1, 1,
-0.4936488, -0.6822688, -1.508721, 1, 1, 1, 1, 1,
-0.4869356, 0.6771765, -2.117431, 1, 1, 1, 1, 1,
-0.4746904, -0.07357581, -0.9983624, 1, 1, 1, 1, 1,
-0.4746608, -0.1968135, -1.404792, 1, 1, 1, 1, 1,
-0.4745297, 0.5773394, 0.3435963, 1, 1, 1, 1, 1,
-0.4715322, 2.430092, -1.605754, 1, 1, 1, 1, 1,
-0.4702601, 1.321572, -1.366724, 0, 0, 1, 1, 1,
-0.4694944, 1.069315, -1.629063, 1, 0, 0, 1, 1,
-0.4671556, -0.3971322, -2.063231, 1, 0, 0, 1, 1,
-0.4624533, 0.149708, -1.237844, 1, 0, 0, 1, 1,
-0.4619784, 0.4165252, -0.2272359, 1, 0, 0, 1, 1,
-0.4596432, 1.581199, -1.629219, 1, 0, 0, 1, 1,
-0.4592629, -0.4343237, -3.749487, 0, 0, 0, 1, 1,
-0.4589709, 0.599183, 0.3024438, 0, 0, 0, 1, 1,
-0.4568215, 0.7151464, 0.6449496, 0, 0, 0, 1, 1,
-0.4525586, -0.3874156, -3.661213, 0, 0, 0, 1, 1,
-0.4475106, 0.6621739, -1.766287, 0, 0, 0, 1, 1,
-0.4425537, -0.1004346, -3.668164, 0, 0, 0, 1, 1,
-0.4424357, -0.2348986, -2.218714, 0, 0, 0, 1, 1,
-0.4394743, -0.5452473, -2.397851, 1, 1, 1, 1, 1,
-0.4333601, -0.6579235, -3.135169, 1, 1, 1, 1, 1,
-0.4230843, -0.7887563, -1.465011, 1, 1, 1, 1, 1,
-0.4212512, -0.8809133, -2.078044, 1, 1, 1, 1, 1,
-0.4175755, 0.3886666, -0.6958418, 1, 1, 1, 1, 1,
-0.4149111, 0.09771961, -0.6944042, 1, 1, 1, 1, 1,
-0.4127379, 1.179707, 2.217271, 1, 1, 1, 1, 1,
-0.4122198, -0.4429553, -3.364756, 1, 1, 1, 1, 1,
-0.4105874, -0.1387065, -0.6239589, 1, 1, 1, 1, 1,
-0.4036849, -1.370762, -3.52231, 1, 1, 1, 1, 1,
-0.4029549, -0.7540628, -1.919585, 1, 1, 1, 1, 1,
-0.3983945, 1.000212, -1.738993, 1, 1, 1, 1, 1,
-0.3937723, -2.039544, -2.207369, 1, 1, 1, 1, 1,
-0.3898413, 0.08728904, -2.398365, 1, 1, 1, 1, 1,
-0.3883353, -1.125985, -2.951856, 1, 1, 1, 1, 1,
-0.387238, 0.4683126, -0.1803363, 0, 0, 1, 1, 1,
-0.3864872, -1.698671, -2.968038, 1, 0, 0, 1, 1,
-0.3828397, -0.2427423, -4.298048, 1, 0, 0, 1, 1,
-0.3806992, -1.019161, -3.518523, 1, 0, 0, 1, 1,
-0.3805895, -2.132451, -2.736119, 1, 0, 0, 1, 1,
-0.3773923, -0.5128554, -3.364257, 1, 0, 0, 1, 1,
-0.3744642, 0.4056317, -1.196777, 0, 0, 0, 1, 1,
-0.3714038, -0.530544, -2.915264, 0, 0, 0, 1, 1,
-0.368108, 0.453324, 0.2902239, 0, 0, 0, 1, 1,
-0.3656502, 0.5253832, -0.389753, 0, 0, 0, 1, 1,
-0.3605741, 0.1217624, -2.557967, 0, 0, 0, 1, 1,
-0.3605689, 1.012446, -1.084107, 0, 0, 0, 1, 1,
-0.3594172, -1.349298, -3.379361, 0, 0, 0, 1, 1,
-0.3575539, -0.5223905, -3.814773, 1, 1, 1, 1, 1,
-0.3425118, 0.3080818, -0.6617945, 1, 1, 1, 1, 1,
-0.3415149, -0.4956869, -2.787536, 1, 1, 1, 1, 1,
-0.3391818, 0.06290568, -2.66788, 1, 1, 1, 1, 1,
-0.3359716, 0.1124018, -0.7188649, 1, 1, 1, 1, 1,
-0.3358572, 0.915745, 0.4830107, 1, 1, 1, 1, 1,
-0.3351998, -1.931661, -2.975068, 1, 1, 1, 1, 1,
-0.3335622, -0.7583762, -3.944343, 1, 1, 1, 1, 1,
-0.3335034, 0.2777307, -0.9683011, 1, 1, 1, 1, 1,
-0.3329706, -0.1285754, -2.150046, 1, 1, 1, 1, 1,
-0.3303919, -0.8143038, -2.730519, 1, 1, 1, 1, 1,
-0.3297395, -0.5469843, -2.521804, 1, 1, 1, 1, 1,
-0.3193609, -0.5493152, -4.46911, 1, 1, 1, 1, 1,
-0.3186001, -0.1249106, 0.02579405, 1, 1, 1, 1, 1,
-0.313849, 1.118858, 0.2362181, 1, 1, 1, 1, 1,
-0.3102153, -2.418572, -1.914374, 0, 0, 1, 1, 1,
-0.3083626, -0.7775249, -2.443505, 1, 0, 0, 1, 1,
-0.3063274, 2.004809, 0.9654996, 1, 0, 0, 1, 1,
-0.3047349, -0.1815853, -3.519396, 1, 0, 0, 1, 1,
-0.3016256, -1.381329, -6.07075, 1, 0, 0, 1, 1,
-0.3006293, 0.314871, -0.6108571, 1, 0, 0, 1, 1,
-0.2952447, -1.670382, -2.889388, 0, 0, 0, 1, 1,
-0.2952299, -0.8229902, -2.158325, 0, 0, 0, 1, 1,
-0.2945449, -0.02681996, -2.771747, 0, 0, 0, 1, 1,
-0.2935047, 0.2407981, -0.01301266, 0, 0, 0, 1, 1,
-0.2919489, -0.09896376, -0.2855265, 0, 0, 0, 1, 1,
-0.2906749, 0.628456, -1.620506, 0, 0, 0, 1, 1,
-0.2906297, 0.9393368, -1.463119, 0, 0, 0, 1, 1,
-0.2894256, 0.4036249, -2.835278, 1, 1, 1, 1, 1,
-0.2791975, 1.399521, -0.03852104, 1, 1, 1, 1, 1,
-0.2781263, -0.1161639, -1.534449, 1, 1, 1, 1, 1,
-0.2740005, 0.1788501, -1.494386, 1, 1, 1, 1, 1,
-0.2678829, -0.8405941, -5.222015, 1, 1, 1, 1, 1,
-0.2658137, -0.08580592, -0.6360564, 1, 1, 1, 1, 1,
-0.2623138, 1.85327, 0.3451876, 1, 1, 1, 1, 1,
-0.2615108, -0.5757594, -3.551747, 1, 1, 1, 1, 1,
-0.2607981, -0.01788136, 0.20916, 1, 1, 1, 1, 1,
-0.2582047, -0.3878413, -1.492, 1, 1, 1, 1, 1,
-0.2559611, -0.6049092, -4.147933, 1, 1, 1, 1, 1,
-0.250693, -0.7300772, -4.372496, 1, 1, 1, 1, 1,
-0.2502175, 0.06547717, -1.4345, 1, 1, 1, 1, 1,
-0.2486512, 2.310307, -0.8829125, 1, 1, 1, 1, 1,
-0.2432911, -0.1983036, -1.665544, 1, 1, 1, 1, 1,
-0.2430855, 0.2671732, 0.7148983, 0, 0, 1, 1, 1,
-0.2389066, 1.460139, 0.7929248, 1, 0, 0, 1, 1,
-0.2362499, -0.04509611, -1.174502, 1, 0, 0, 1, 1,
-0.2310547, 1.569865, -0.3622656, 1, 0, 0, 1, 1,
-0.2284751, -0.7660693, -3.144206, 1, 0, 0, 1, 1,
-0.2237037, 1.614645, -0.6798689, 1, 0, 0, 1, 1,
-0.2233277, 1.517056, -0.3637793, 0, 0, 0, 1, 1,
-0.2198464, -0.6767725, -3.492908, 0, 0, 0, 1, 1,
-0.2152393, -1.031827, -3.009541, 0, 0, 0, 1, 1,
-0.2104779, 1.381559, 0.05193869, 0, 0, 0, 1, 1,
-0.2100614, -0.7372904, -3.940297, 0, 0, 0, 1, 1,
-0.2076823, 0.9602113, 0.1669124, 0, 0, 0, 1, 1,
-0.206105, -0.7084988, -3.335257, 0, 0, 0, 1, 1,
-0.2058105, -1.815221, -3.774076, 1, 1, 1, 1, 1,
-0.2050162, -0.4029938, -4.102743, 1, 1, 1, 1, 1,
-0.2045321, -0.6226564, -3.788388, 1, 1, 1, 1, 1,
-0.1962211, 0.3280977, -0.9950971, 1, 1, 1, 1, 1,
-0.191704, 2.013088, -1.724434, 1, 1, 1, 1, 1,
-0.1898684, 0.739737, -1.82988, 1, 1, 1, 1, 1,
-0.1863218, -0.008035453, -0.48182, 1, 1, 1, 1, 1,
-0.1856471, 0.510507, -1.339512, 1, 1, 1, 1, 1,
-0.1806333, -1.51127, -2.29592, 1, 1, 1, 1, 1,
-0.1806051, -1.430601, -2.903135, 1, 1, 1, 1, 1,
-0.1798204, 0.615404, -1.536113, 1, 1, 1, 1, 1,
-0.1766317, 1.596362, -0.399757, 1, 1, 1, 1, 1,
-0.172109, -0.341856, -2.041519, 1, 1, 1, 1, 1,
-0.1719834, -0.5881504, -3.501644, 1, 1, 1, 1, 1,
-0.1668883, 1.548437, 1.265702, 1, 1, 1, 1, 1,
-0.1666625, 0.6121166, 0.7270968, 0, 0, 1, 1, 1,
-0.1634292, 0.6857629, -0.1606707, 1, 0, 0, 1, 1,
-0.1623847, 0.4925798, 0.3014626, 1, 0, 0, 1, 1,
-0.157579, 0.07096072, -0.5262541, 1, 0, 0, 1, 1,
-0.1534885, 0.005369562, -0.4527149, 1, 0, 0, 1, 1,
-0.151543, 1.897897, -1.257484, 1, 0, 0, 1, 1,
-0.147938, 1.860882, 0.2728469, 0, 0, 0, 1, 1,
-0.1425063, -0.07589259, -3.333282, 0, 0, 0, 1, 1,
-0.1387327, 0.8018064, -0.5223988, 0, 0, 0, 1, 1,
-0.1358279, 1.473974, -1.796601, 0, 0, 0, 1, 1,
-0.1350359, 0.02287657, -1.462581, 0, 0, 0, 1, 1,
-0.1302921, -0.8639985, -3.742979, 0, 0, 0, 1, 1,
-0.1283147, -0.3048013, -0.5748935, 0, 0, 0, 1, 1,
-0.1282599, 0.4945363, 0.6405036, 1, 1, 1, 1, 1,
-0.1252007, 0.8502631, -0.1290893, 1, 1, 1, 1, 1,
-0.118929, 0.02023537, -1.985882, 1, 1, 1, 1, 1,
-0.1149261, 1.350685, -0.4120134, 1, 1, 1, 1, 1,
-0.1092193, 1.612374, -0.5768785, 1, 1, 1, 1, 1,
-0.1070339, 1.957428, -0.03983701, 1, 1, 1, 1, 1,
-0.1057506, -0.448125, -1.925454, 1, 1, 1, 1, 1,
-0.1017025, 0.4593997, 0.08335344, 1, 1, 1, 1, 1,
-0.09983042, 1.319031, -0.4608733, 1, 1, 1, 1, 1,
-0.09830566, -0.1315854, -1.17818, 1, 1, 1, 1, 1,
-0.09801196, -1.76256, -4.113592, 1, 1, 1, 1, 1,
-0.09266421, 0.98937, 1.30486, 1, 1, 1, 1, 1,
-0.09082109, -2.213364, -1.076, 1, 1, 1, 1, 1,
-0.08893991, 0.07536823, 1.004856, 1, 1, 1, 1, 1,
-0.08764181, -0.4680446, -0.8563974, 1, 1, 1, 1, 1,
-0.08648381, 0.8781172, -1.068817, 0, 0, 1, 1, 1,
-0.08073547, 1.065568, -0.8252975, 1, 0, 0, 1, 1,
-0.07561775, 0.003363473, -0.7977049, 1, 0, 0, 1, 1,
-0.07515314, 0.1194867, -0.9074079, 1, 0, 0, 1, 1,
-0.07195742, 1.85802, -0.6944822, 1, 0, 0, 1, 1,
-0.0700023, 0.233678, -0.6301917, 1, 0, 0, 1, 1,
-0.06871893, -1.290433, -3.796024, 0, 0, 0, 1, 1,
-0.06846608, -0.9549924, -3.222286, 0, 0, 0, 1, 1,
-0.06434406, 0.5455192, -0.1582466, 0, 0, 0, 1, 1,
-0.06043569, -0.2168039, -3.296372, 0, 0, 0, 1, 1,
-0.06007731, -0.4761882, -2.912257, 0, 0, 0, 1, 1,
-0.05542627, 0.2567908, -0.1834784, 0, 0, 0, 1, 1,
-0.05452454, -1.413733, -2.228766, 0, 0, 0, 1, 1,
-0.05245706, -0.009462591, -2.32654, 1, 1, 1, 1, 1,
-0.05085735, -0.4899803, -2.101974, 1, 1, 1, 1, 1,
-0.0495549, -1.051498, -2.568016, 1, 1, 1, 1, 1,
-0.04699472, 0.5812388, -2.350587, 1, 1, 1, 1, 1,
-0.03846531, -0.05493518, -1.821714, 1, 1, 1, 1, 1,
-0.03776043, 0.2347753, 0.2309274, 1, 1, 1, 1, 1,
-0.03122615, -1.461446, -3.625615, 1, 1, 1, 1, 1,
-0.02624141, 1.381045, 0.2574645, 1, 1, 1, 1, 1,
-0.02074263, -0.5417762, -5.180636, 1, 1, 1, 1, 1,
-0.0204784, 1.753664, 0.215768, 1, 1, 1, 1, 1,
-0.01845764, 1.158977, -1.75195, 1, 1, 1, 1, 1,
-0.01108556, 2.229829, 0.7234452, 1, 1, 1, 1, 1,
-0.007659127, 1.096344, -1.344461, 1, 1, 1, 1, 1,
-0.006035836, 0.4020445, -1.817574, 1, 1, 1, 1, 1,
-0.005937354, -0.1019447, -3.856339, 1, 1, 1, 1, 1,
-0.005040684, 0.005676647, -2.567191, 0, 0, 1, 1, 1,
-0.001302767, -1.078942, -2.719656, 1, 0, 0, 1, 1,
0.003609226, 0.3775997, 0.03738075, 1, 0, 0, 1, 1,
0.006088871, 0.1139834, 0.4058672, 1, 0, 0, 1, 1,
0.006633585, 0.4212545, 0.9346215, 1, 0, 0, 1, 1,
0.007969611, 1.435646, 1.862817, 1, 0, 0, 1, 1,
0.00857184, -0.44867, 1.58667, 0, 0, 0, 1, 1,
0.01158617, 1.255624, -0.6645104, 0, 0, 0, 1, 1,
0.01764401, 0.2882599, -0.3400632, 0, 0, 0, 1, 1,
0.02009876, -0.786029, 3.272551, 0, 0, 0, 1, 1,
0.02076806, -0.2353198, 1.608576, 0, 0, 0, 1, 1,
0.02288439, -0.8622686, 2.242307, 0, 0, 0, 1, 1,
0.0240126, -0.9688431, 1.276282, 0, 0, 0, 1, 1,
0.02724974, -1.155294, 3.030747, 1, 1, 1, 1, 1,
0.03589654, -0.005639253, 2.471398, 1, 1, 1, 1, 1,
0.05218847, -1.44283, 2.300735, 1, 1, 1, 1, 1,
0.05245868, 1.463432, -1.106371, 1, 1, 1, 1, 1,
0.05344515, -0.3293273, 2.836541, 1, 1, 1, 1, 1,
0.05566595, -0.1500938, 3.190436, 1, 1, 1, 1, 1,
0.05838127, -0.627345, 1.922603, 1, 1, 1, 1, 1,
0.06850947, -1.848461, 1.158914, 1, 1, 1, 1, 1,
0.07002632, 0.4741387, -1.553299, 1, 1, 1, 1, 1,
0.07197021, 1.337338, 1.076793, 1, 1, 1, 1, 1,
0.0732797, 0.5208101, -2.027571, 1, 1, 1, 1, 1,
0.08875439, 0.5617498, -0.2190869, 1, 1, 1, 1, 1,
0.09288188, -0.6368729, 3.775062, 1, 1, 1, 1, 1,
0.09629429, -0.2117461, 1.347827, 1, 1, 1, 1, 1,
0.1061528, -0.972487, 5.876226, 1, 1, 1, 1, 1,
0.1121744, -0.6141636, 2.602553, 0, 0, 1, 1, 1,
0.1138672, 0.3849665, 0.1086915, 1, 0, 0, 1, 1,
0.1153623, 0.1569149, 1.442809, 1, 0, 0, 1, 1,
0.1162102, 1.939095, -0.295976, 1, 0, 0, 1, 1,
0.1166545, -0.6890128, 2.556549, 1, 0, 0, 1, 1,
0.1192417, 0.1351826, 3.555675, 1, 0, 0, 1, 1,
0.1231826, 0.1499205, -1.455592, 0, 0, 0, 1, 1,
0.1233674, -0.1452529, 2.842679, 0, 0, 0, 1, 1,
0.1269103, 0.1151386, -0.2689937, 0, 0, 0, 1, 1,
0.1288091, 0.09300546, -0.6983091, 0, 0, 0, 1, 1,
0.1294293, -1.768254, 0.9183792, 0, 0, 0, 1, 1,
0.1298137, -0.3122787, 3.533497, 0, 0, 0, 1, 1,
0.1309835, -1.148786, 3.279773, 0, 0, 0, 1, 1,
0.1433592, 0.02876475, -0.6755595, 1, 1, 1, 1, 1,
0.144114, 0.6334161, 2.023414, 1, 1, 1, 1, 1,
0.1480483, 0.1331298, 2.0431, 1, 1, 1, 1, 1,
0.1480628, -2.143011, 3.00962, 1, 1, 1, 1, 1,
0.1529643, 0.895846, 1.984589, 1, 1, 1, 1, 1,
0.1534725, -2.600821, 2.950259, 1, 1, 1, 1, 1,
0.159352, 0.1162609, 0.5850677, 1, 1, 1, 1, 1,
0.161065, -0.5063677, 1.473583, 1, 1, 1, 1, 1,
0.1614246, 0.4988495, 0.0833342, 1, 1, 1, 1, 1,
0.1616857, 0.6042551, -0.7177709, 1, 1, 1, 1, 1,
0.1649051, 2.352599, -0.3401909, 1, 1, 1, 1, 1,
0.1651176, -0.4676302, 2.769025, 1, 1, 1, 1, 1,
0.1653254, -0.09752062, 1.740005, 1, 1, 1, 1, 1,
0.1662814, 0.3488418, -1.436592, 1, 1, 1, 1, 1,
0.1670405, 0.809113, 1.176333, 1, 1, 1, 1, 1,
0.173379, -1.537384, 3.310431, 0, 0, 1, 1, 1,
0.1783223, -1.206134, 3.692473, 1, 0, 0, 1, 1,
0.1826812, 0.2226799, -0.2763646, 1, 0, 0, 1, 1,
0.1872185, 0.7296358, -0.02702429, 1, 0, 0, 1, 1,
0.1873487, 0.4618392, 0.3383342, 1, 0, 0, 1, 1,
0.1895973, 0.9642476, -0.6558638, 1, 0, 0, 1, 1,
0.1897496, 0.01195135, 0.4593619, 0, 0, 0, 1, 1,
0.1943915, -1.625027, 5.453564, 0, 0, 0, 1, 1,
0.1975165, 1.951893, 1.317745, 0, 0, 0, 1, 1,
0.1990953, -1.027088, 3.23227, 0, 0, 0, 1, 1,
0.1999655, -1.238578, 1.367332, 0, 0, 0, 1, 1,
0.2032074, 0.7635156, -0.3083461, 0, 0, 0, 1, 1,
0.203214, -0.5932129, 1.546625, 0, 0, 0, 1, 1,
0.2065023, 1.280837, 0.6614953, 1, 1, 1, 1, 1,
0.2078646, 0.1711695, 0.4655697, 1, 1, 1, 1, 1,
0.2117766, 1.805044, 1.935505, 1, 1, 1, 1, 1,
0.2123417, -1.565218, 3.614034, 1, 1, 1, 1, 1,
0.2129316, -1.054693, 4.183063, 1, 1, 1, 1, 1,
0.216582, 1.202891, -0.453476, 1, 1, 1, 1, 1,
0.2245465, -0.2101121, 2.736228, 1, 1, 1, 1, 1,
0.2271591, 0.8320355, 0.2632793, 1, 1, 1, 1, 1,
0.2301129, -0.1303698, 1.812031, 1, 1, 1, 1, 1,
0.2309035, 0.1454094, 0.2500235, 1, 1, 1, 1, 1,
0.2311274, 0.4300276, 0.6938387, 1, 1, 1, 1, 1,
0.2361708, -1.263172, 4.153935, 1, 1, 1, 1, 1,
0.2401916, 0.4137986, -0.2690901, 1, 1, 1, 1, 1,
0.2430221, 0.792924, 0.5716378, 1, 1, 1, 1, 1,
0.2431703, -1.213209, 4.387159, 1, 1, 1, 1, 1,
0.2450019, 0.6015847, 0.3485462, 0, 0, 1, 1, 1,
0.2457133, -0.009646798, 1.437879, 1, 0, 0, 1, 1,
0.2481448, -0.4125245, 4.256512, 1, 0, 0, 1, 1,
0.2497467, -1.461383, 2.167428, 1, 0, 0, 1, 1,
0.2538797, 0.161413, 1.373257, 1, 0, 0, 1, 1,
0.2551334, 1.717579, 0.1551226, 1, 0, 0, 1, 1,
0.2608292, 2.253759, -0.1194985, 0, 0, 0, 1, 1,
0.2660494, -1.726854, 1.975241, 0, 0, 0, 1, 1,
0.2677067, -0.5001904, 2.3095, 0, 0, 0, 1, 1,
0.2702193, 0.4385781, -0.1035521, 0, 0, 0, 1, 1,
0.2723046, -2.12337, 3.441793, 0, 0, 0, 1, 1,
0.2731145, 0.5289999, -0.8602062, 0, 0, 0, 1, 1,
0.2734326, -0.4127086, 2.967641, 0, 0, 0, 1, 1,
0.2753721, -1.399363, 3.457262, 1, 1, 1, 1, 1,
0.2761691, 0.1083122, 0.8113885, 1, 1, 1, 1, 1,
0.2822436, 1.40826, 0.1555655, 1, 1, 1, 1, 1,
0.2823502, 0.880259, -1.063496, 1, 1, 1, 1, 1,
0.2842727, -0.05455909, 1.857322, 1, 1, 1, 1, 1,
0.2847708, -0.08071058, 2.809058, 1, 1, 1, 1, 1,
0.2867045, 0.4343757, 1.823338, 1, 1, 1, 1, 1,
0.2869932, 0.2281584, 1.03171, 1, 1, 1, 1, 1,
0.2900428, 0.6832974, -0.2203656, 1, 1, 1, 1, 1,
0.2902603, 0.08794174, 1.466062, 1, 1, 1, 1, 1,
0.2904671, 0.6525227, -0.4809928, 1, 1, 1, 1, 1,
0.2925038, 1.234455, -0.6901616, 1, 1, 1, 1, 1,
0.3033142, -0.0172982, 1.69468, 1, 1, 1, 1, 1,
0.3035556, 1.465655, 0.6178885, 1, 1, 1, 1, 1,
0.3037278, -0.4794666, 1.695061, 1, 1, 1, 1, 1,
0.3055465, -1.447586, 2.638261, 0, 0, 1, 1, 1,
0.3083763, 0.4215567, -0.257585, 1, 0, 0, 1, 1,
0.3090059, -0.7009249, 2.835939, 1, 0, 0, 1, 1,
0.3101571, -0.4641415, 2.197692, 1, 0, 0, 1, 1,
0.3111319, 0.9841995, -0.4530576, 1, 0, 0, 1, 1,
0.3120745, -1.010962, 2.282567, 1, 0, 0, 1, 1,
0.3124054, -1.008229, 2.522094, 0, 0, 0, 1, 1,
0.3171373, -1.436844, 4.033408, 0, 0, 0, 1, 1,
0.3205834, 0.1190772, 1.345325, 0, 0, 0, 1, 1,
0.3216392, 1.462351, -0.9057376, 0, 0, 0, 1, 1,
0.3244807, 1.576603, 1.187338, 0, 0, 0, 1, 1,
0.32547, 0.7027153, 1.497604, 0, 0, 0, 1, 1,
0.326662, 0.8069867, -0.2430025, 0, 0, 0, 1, 1,
0.326812, -0.5251462, 3.507258, 1, 1, 1, 1, 1,
0.3275203, -0.4121873, 2.295419, 1, 1, 1, 1, 1,
0.3322322, 0.1936207, 1.063917, 1, 1, 1, 1, 1,
0.3341277, 2.518617, 1.4926, 1, 1, 1, 1, 1,
0.3416593, -1.641634, 3.990557, 1, 1, 1, 1, 1,
0.3418809, -0.3841499, 1.464889, 1, 1, 1, 1, 1,
0.3422228, 0.01364558, 1.388315, 1, 1, 1, 1, 1,
0.344732, 0.7000093, 0.9898846, 1, 1, 1, 1, 1,
0.3456099, -0.1954869, 1.986233, 1, 1, 1, 1, 1,
0.3483112, -0.3700509, 4.173223, 1, 1, 1, 1, 1,
0.3485286, 0.9315194, -0.4200667, 1, 1, 1, 1, 1,
0.3490123, 0.1754061, 2.832747, 1, 1, 1, 1, 1,
0.3536901, 0.3236281, -0.2186271, 1, 1, 1, 1, 1,
0.3562013, -0.3132022, 1.758633, 1, 1, 1, 1, 1,
0.358898, 1.498365, 0.1146813, 1, 1, 1, 1, 1,
0.3603908, 0.4800461, 1.089482, 0, 0, 1, 1, 1,
0.3605756, 0.3564449, -0.9398476, 1, 0, 0, 1, 1,
0.3608687, 0.1353438, 1.854217, 1, 0, 0, 1, 1,
0.3716213, 0.2684691, 3.268838, 1, 0, 0, 1, 1,
0.3748899, 1.149468, 0.2278102, 1, 0, 0, 1, 1,
0.382109, 0.4956008, 0.2833751, 1, 0, 0, 1, 1,
0.3851092, -0.4285333, 0.8015289, 0, 0, 0, 1, 1,
0.3863605, 0.4020322, 1.709894, 0, 0, 0, 1, 1,
0.3865593, 0.7885025, -0.4269894, 0, 0, 0, 1, 1,
0.3886349, 0.9823361, 1.536212, 0, 0, 0, 1, 1,
0.3890897, 1.707168, 0.1940008, 0, 0, 0, 1, 1,
0.3901249, -0.1845353, 0.817202, 0, 0, 0, 1, 1,
0.3935571, 0.1583364, 1.859589, 0, 0, 0, 1, 1,
0.3939303, 0.4070643, 0.3423761, 1, 1, 1, 1, 1,
0.4048066, -0.3755338, 1.829745, 1, 1, 1, 1, 1,
0.4052122, -0.2779724, 3.569735, 1, 1, 1, 1, 1,
0.4076947, 0.5588297, 0.5422621, 1, 1, 1, 1, 1,
0.4079273, -1.454485, 2.053336, 1, 1, 1, 1, 1,
0.4102236, -0.8096061, 1.052928, 1, 1, 1, 1, 1,
0.4110796, 0.4813148, 1.467453, 1, 1, 1, 1, 1,
0.4226054, 0.3128194, 0.5472128, 1, 1, 1, 1, 1,
0.425231, -0.975045, 1.902245, 1, 1, 1, 1, 1,
0.4255904, 1.197654, 0.1812475, 1, 1, 1, 1, 1,
0.4297442, 0.4053186, 1.847324, 1, 1, 1, 1, 1,
0.4308522, -0.4024763, 0.9307201, 1, 1, 1, 1, 1,
0.4337818, -0.2483434, 1.133756, 1, 1, 1, 1, 1,
0.4395911, 0.8026704, 0.9225315, 1, 1, 1, 1, 1,
0.4428856, -0.6535373, 3.67462, 1, 1, 1, 1, 1,
0.4444097, 0.3165988, 0.3987963, 0, 0, 1, 1, 1,
0.4478964, -1.281379, 4.377843, 1, 0, 0, 1, 1,
0.4488853, -1.578277, 4.234972, 1, 0, 0, 1, 1,
0.4490746, -1.314731, 2.104324, 1, 0, 0, 1, 1,
0.4556498, -0.03610699, 1.813145, 1, 0, 0, 1, 1,
0.4571859, -0.3389415, 2.057372, 1, 0, 0, 1, 1,
0.4607179, 0.1218976, 2.466026, 0, 0, 0, 1, 1,
0.4607288, -0.5236427, 3.269576, 0, 0, 0, 1, 1,
0.4673956, -0.5928503, 2.092003, 0, 0, 0, 1, 1,
0.4716247, 0.5430248, 1.458056, 0, 0, 0, 1, 1,
0.4727254, -0.3726389, 2.127684, 0, 0, 0, 1, 1,
0.4782626, -0.1170992, 0.6275065, 0, 0, 0, 1, 1,
0.4803433, 3.03015, 0.1662105, 0, 0, 0, 1, 1,
0.4845261, -2.091214, 3.405553, 1, 1, 1, 1, 1,
0.4876773, -1.115889, 1.814483, 1, 1, 1, 1, 1,
0.4886156, -0.08749025, 1.245212, 1, 1, 1, 1, 1,
0.4927943, -1.010519, 3.606703, 1, 1, 1, 1, 1,
0.4955942, 1.013305, 1.436557, 1, 1, 1, 1, 1,
0.5010912, -0.8664553, 1.929544, 1, 1, 1, 1, 1,
0.5066623, -0.7200447, 1.251812, 1, 1, 1, 1, 1,
0.5111075, 0.0529264, 0.7190306, 1, 1, 1, 1, 1,
0.5149093, -1.217979, 3.056472, 1, 1, 1, 1, 1,
0.5201499, 0.002737964, 1.478991, 1, 1, 1, 1, 1,
0.5204244, 0.09883152, 1.744849, 1, 1, 1, 1, 1,
0.5221095, 0.5422472, 2.326718, 1, 1, 1, 1, 1,
0.5254759, -1.069677, 4.874224, 1, 1, 1, 1, 1,
0.526818, 0.5721341, 0.8091524, 1, 1, 1, 1, 1,
0.526904, 0.5909176, 0.398975, 1, 1, 1, 1, 1,
0.5280226, -0.8693616, 1.871054, 0, 0, 1, 1, 1,
0.5305683, 2.070272, -1.115239, 1, 0, 0, 1, 1,
0.5348091, 1.271438, 1.594076, 1, 0, 0, 1, 1,
0.5348518, 0.346476, 2.004535, 1, 0, 0, 1, 1,
0.5354611, 0.4126368, -0.2877311, 1, 0, 0, 1, 1,
0.5375734, -0.2521199, 2.042817, 1, 0, 0, 1, 1,
0.5443584, -0.5928625, 0.9828217, 0, 0, 0, 1, 1,
0.5447618, -0.5712507, 2.645278, 0, 0, 0, 1, 1,
0.5453981, 0.458132, 2.347634, 0, 0, 0, 1, 1,
0.5469478, -1.015839, 0.8696209, 0, 0, 0, 1, 1,
0.5489257, -0.6190006, 3.838978, 0, 0, 0, 1, 1,
0.5503348, 1.017548, 2.160799, 0, 0, 0, 1, 1,
0.5515189, 0.3381815, -0.3974458, 0, 0, 0, 1, 1,
0.5525767, -0.5176814, 1.984624, 1, 1, 1, 1, 1,
0.5616281, 1.953858, 0.2576557, 1, 1, 1, 1, 1,
0.5631388, 0.5071204, 1.155293, 1, 1, 1, 1, 1,
0.5653286, -0.2240967, 2.177409, 1, 1, 1, 1, 1,
0.5667558, 0.6108395, 1.112966, 1, 1, 1, 1, 1,
0.5695485, 2.904248, -2.125541, 1, 1, 1, 1, 1,
0.5699077, -2.217139, 2.1097, 1, 1, 1, 1, 1,
0.5702778, 3.222332, 1.362543, 1, 1, 1, 1, 1,
0.5703944, -1.352861, 2.481483, 1, 1, 1, 1, 1,
0.572768, 0.3468518, -0.6859457, 1, 1, 1, 1, 1,
0.5849252, 0.7680004, 1.824321, 1, 1, 1, 1, 1,
0.5873608, 0.5929428, -0.6427615, 1, 1, 1, 1, 1,
0.5874993, 1.077503, 2.082527, 1, 1, 1, 1, 1,
0.5884605, -0.9227192, 3.067854, 1, 1, 1, 1, 1,
0.5892762, -1.269146, 1.834163, 1, 1, 1, 1, 1,
0.5905528, -0.1539011, 1.680247, 0, 0, 1, 1, 1,
0.5918334, -0.5311948, 0.1570136, 1, 0, 0, 1, 1,
0.5953507, 2.289227, -0.5490703, 1, 0, 0, 1, 1,
0.605042, -1.528653, 1.726339, 1, 0, 0, 1, 1,
0.6053175, -0.1253041, 1.521878, 1, 0, 0, 1, 1,
0.6062078, 0.06797832, 2.020999, 1, 0, 0, 1, 1,
0.607563, 0.06909869, 1.55542, 0, 0, 0, 1, 1,
0.6098986, -1.436867, 1.72137, 0, 0, 0, 1, 1,
0.6099706, 1.125722, 0.9581157, 0, 0, 0, 1, 1,
0.6131904, 0.170489, 2.710425, 0, 0, 0, 1, 1,
0.6161319, 0.1038686, 2.238863, 0, 0, 0, 1, 1,
0.6195722, -0.2521894, 2.249205, 0, 0, 0, 1, 1,
0.6257232, 0.4260711, 0.7211928, 0, 0, 0, 1, 1,
0.62744, -0.716206, 2.734778, 1, 1, 1, 1, 1,
0.6281807, -0.01502975, 2.068504, 1, 1, 1, 1, 1,
0.6297295, -0.3651795, 1.26205, 1, 1, 1, 1, 1,
0.6326093, 0.555752, 2.393211, 1, 1, 1, 1, 1,
0.6341482, -0.5168189, 2.742251, 1, 1, 1, 1, 1,
0.6350909, 0.1209156, -0.39953, 1, 1, 1, 1, 1,
0.6366907, 1.734499, 0.7092955, 1, 1, 1, 1, 1,
0.6378272, 0.08947946, 2.759532, 1, 1, 1, 1, 1,
0.6443419, -0.615298, 2.28146, 1, 1, 1, 1, 1,
0.6453758, -0.4845848, 1.306838, 1, 1, 1, 1, 1,
0.6473073, -1.39601, 4.702024, 1, 1, 1, 1, 1,
0.6527669, -0.1621966, 3.261733, 1, 1, 1, 1, 1,
0.6553047, 0.3297009, -0.4559218, 1, 1, 1, 1, 1,
0.6567059, 0.7747497, 0.6084632, 1, 1, 1, 1, 1,
0.6569936, 0.1703865, 2.105803, 1, 1, 1, 1, 1,
0.6603741, -0.8144968, 2.932412, 0, 0, 1, 1, 1,
0.6615493, 1.156108, 1.101182, 1, 0, 0, 1, 1,
0.6624096, -1.757599, 2.92479, 1, 0, 0, 1, 1,
0.6724497, -0.3415275, 1.336726, 1, 0, 0, 1, 1,
0.6763239, -1.616034, 1.745516, 1, 0, 0, 1, 1,
0.6764883, 0.3651716, 0.183746, 1, 0, 0, 1, 1,
0.6806946, -0.8691844, 0.9691291, 0, 0, 0, 1, 1,
0.6814268, 0.6309364, 0.9664333, 0, 0, 0, 1, 1,
0.6829704, 1.254543, 0.07550781, 0, 0, 0, 1, 1,
0.6841836, 1.665366, -1.961295, 0, 0, 0, 1, 1,
0.6844724, 0.5952141, -0.4564572, 0, 0, 0, 1, 1,
0.6904897, -0.2384759, 2.015958, 0, 0, 0, 1, 1,
0.6936018, 0.2538885, 0.8803254, 0, 0, 0, 1, 1,
0.695287, 0.2443626, 1.906625, 1, 1, 1, 1, 1,
0.7004743, 0.01470983, 1.269872, 1, 1, 1, 1, 1,
0.7042497, -0.4134951, 2.953743, 1, 1, 1, 1, 1,
0.7042722, -1.411377, 3.806345, 1, 1, 1, 1, 1,
0.707317, -0.3711081, 2.25222, 1, 1, 1, 1, 1,
0.7091938, -0.03948392, 0.7346132, 1, 1, 1, 1, 1,
0.7101501, -0.0842397, 0.9920687, 1, 1, 1, 1, 1,
0.7142698, 1.142589, -0.4692814, 1, 1, 1, 1, 1,
0.7142787, -0.03326609, 1.65512, 1, 1, 1, 1, 1,
0.7146041, -0.1697639, 1.764921, 1, 1, 1, 1, 1,
0.7157055, -0.9451079, 0.8310785, 1, 1, 1, 1, 1,
0.7196274, 1.797102, 0.7561681, 1, 1, 1, 1, 1,
0.7258617, -0.09276424, 1.733939, 1, 1, 1, 1, 1,
0.7290114, 0.3446768, 2.209444, 1, 1, 1, 1, 1,
0.7349581, -0.7549555, 3.915694, 1, 1, 1, 1, 1,
0.7376646, -0.09285653, 2.320886, 0, 0, 1, 1, 1,
0.7378476, 0.1173664, 0.397429, 1, 0, 0, 1, 1,
0.7424776, -0.4774418, 2.506406, 1, 0, 0, 1, 1,
0.7464032, 3.079017, 1.511826, 1, 0, 0, 1, 1,
0.7506646, 0.0228667, 1.454974, 1, 0, 0, 1, 1,
0.7543259, 0.2134114, 2.361612, 1, 0, 0, 1, 1,
0.7543381, 0.6451131, 1.50602, 0, 0, 0, 1, 1,
0.7544871, 0.3843152, 0.5967426, 0, 0, 0, 1, 1,
0.7559726, 0.1166711, -0.7781498, 0, 0, 0, 1, 1,
0.7604818, 1.494461, 1.055619, 0, 0, 0, 1, 1,
0.7620522, 0.0786702, 2.141173, 0, 0, 0, 1, 1,
0.7630389, 0.07281815, 2.79596, 0, 0, 0, 1, 1,
0.7638086, -0.133955, 1.277737, 0, 0, 0, 1, 1,
0.7674035, 0.3039813, 1.92554, 1, 1, 1, 1, 1,
0.7708341, -0.3386435, 4.646839, 1, 1, 1, 1, 1,
0.7750215, 0.5332497, 0.3261177, 1, 1, 1, 1, 1,
0.7768888, 0.1910586, -0.2009147, 1, 1, 1, 1, 1,
0.7844947, 0.7195165, 1.611186, 1, 1, 1, 1, 1,
0.7856753, -0.3018104, 1.984469, 1, 1, 1, 1, 1,
0.7876258, -1.245555, 2.639804, 1, 1, 1, 1, 1,
0.7882342, 0.008162334, 1.337217, 1, 1, 1, 1, 1,
0.7897521, -1.419753, 3.205822, 1, 1, 1, 1, 1,
0.7902044, 0.779121, -0.266867, 1, 1, 1, 1, 1,
0.7914687, -1.539379, 2.250326, 1, 1, 1, 1, 1,
0.7958179, 0.3646987, 1.053949, 1, 1, 1, 1, 1,
0.7962044, -0.1777375, 1.224619, 1, 1, 1, 1, 1,
0.7995488, 0.1338334, 2.504074, 1, 1, 1, 1, 1,
0.8038, 0.4784856, 1.902615, 1, 1, 1, 1, 1,
0.8089948, 0.9074231, 0.3033372, 0, 0, 1, 1, 1,
0.8138506, -0.2761652, 1.300164, 1, 0, 0, 1, 1,
0.8160203, 0.6843379, 2.691634, 1, 0, 0, 1, 1,
0.8184055, 0.7232326, 1.764537, 1, 0, 0, 1, 1,
0.8206134, 0.8883032, 0.9269544, 1, 0, 0, 1, 1,
0.8271178, 1.142225, 3.519915, 1, 0, 0, 1, 1,
0.8282954, 0.3692618, 1.376619, 0, 0, 0, 1, 1,
0.8289182, -0.4421666, 2.167348, 0, 0, 0, 1, 1,
0.8321605, 0.60048, 1.127949, 0, 0, 0, 1, 1,
0.8333152, -1.16625, 3.557748, 0, 0, 0, 1, 1,
0.8431169, -0.899395, 1.862684, 0, 0, 0, 1, 1,
0.843271, -2.377725, 2.102447, 0, 0, 0, 1, 1,
0.8453172, -1.15749, 2.929914, 0, 0, 0, 1, 1,
0.8487943, 0.9052052, 1.355222, 1, 1, 1, 1, 1,
0.8491503, 0.1069895, -0.6091688, 1, 1, 1, 1, 1,
0.8639071, 1.363341, 0.6751837, 1, 1, 1, 1, 1,
0.8664384, -1.304334, 4.140161, 1, 1, 1, 1, 1,
0.8681794, -0.8749429, 2.629241, 1, 1, 1, 1, 1,
0.8687878, -0.4914283, 1.795741, 1, 1, 1, 1, 1,
0.8701608, 0.3286618, 0.6149566, 1, 1, 1, 1, 1,
0.8705066, -0.0952173, 0.5500581, 1, 1, 1, 1, 1,
0.8740653, 0.5117965, 1.30827, 1, 1, 1, 1, 1,
0.8753958, -1.558975, 3.478948, 1, 1, 1, 1, 1,
0.8771625, -0.8966667, 2.90835, 1, 1, 1, 1, 1,
0.8799278, -0.2338574, 3.823186, 1, 1, 1, 1, 1,
0.8846492, 0.454152, 0.8900343, 1, 1, 1, 1, 1,
0.889069, 1.042988, 0.7628675, 1, 1, 1, 1, 1,
0.889559, 0.06733991, 1.017113, 1, 1, 1, 1, 1,
0.8957124, 0.3624572, -1.242709, 0, 0, 1, 1, 1,
0.9056189, -2.595942, 3.163209, 1, 0, 0, 1, 1,
0.9062573, -0.9277378, 2.269878, 1, 0, 0, 1, 1,
0.9084868, 0.8932828, 1.551845, 1, 0, 0, 1, 1,
0.9088407, -0.3186874, 1.730209, 1, 0, 0, 1, 1,
0.9118721, 0.911281, 0.02087525, 1, 0, 0, 1, 1,
0.9191326, -1.018255, 2.237384, 0, 0, 0, 1, 1,
0.9216353, 0.7588003, 0.2863635, 0, 0, 0, 1, 1,
0.9238179, -0.6429676, 0.5896621, 0, 0, 0, 1, 1,
0.9264959, -0.8877126, 2.293437, 0, 0, 0, 1, 1,
0.9269247, -0.3373226, 1.904151, 0, 0, 0, 1, 1,
0.9293553, 1.925788, 1.386908, 0, 0, 0, 1, 1,
0.9353251, -0.09689477, 1.725058, 0, 0, 0, 1, 1,
0.9382211, -1.422182, 0.7701014, 1, 1, 1, 1, 1,
0.9419343, 2.163934, 1.917024, 1, 1, 1, 1, 1,
0.9431567, -0.9821254, 1.612959, 1, 1, 1, 1, 1,
0.9444481, 1.951717, 1.02141, 1, 1, 1, 1, 1,
0.9467026, 0.8352806, 1.336632, 1, 1, 1, 1, 1,
0.9469408, -0.8442208, 3.01124, 1, 1, 1, 1, 1,
0.9517914, -0.8341874, 2.819796, 1, 1, 1, 1, 1,
0.9523102, 0.5894681, 0.3094876, 1, 1, 1, 1, 1,
0.9538199, 0.9588989, 2.988498, 1, 1, 1, 1, 1,
0.964151, -0.3202075, 0.8397616, 1, 1, 1, 1, 1,
0.9694306, -1.13917, 1.428884, 1, 1, 1, 1, 1,
0.9717993, 0.5471261, 0.8769549, 1, 1, 1, 1, 1,
0.9802646, -0.02353235, 1.117712, 1, 1, 1, 1, 1,
0.9817504, 1.424014, 0.375107, 1, 1, 1, 1, 1,
0.9829881, 0.4462099, 1.375181, 1, 1, 1, 1, 1,
0.9849811, 0.9730871, -0.7246242, 0, 0, 1, 1, 1,
0.9955231, -2.238302, 1.549333, 1, 0, 0, 1, 1,
0.9957659, 0.7116217, -0.449864, 1, 0, 0, 1, 1,
0.9993262, 1.460629, 0.1297667, 1, 0, 0, 1, 1,
1.005273, -0.7749009, 2.758651, 1, 0, 0, 1, 1,
1.007136, 1.128236, 0.6101151, 1, 0, 0, 1, 1,
1.012774, 0.6947582, 0.582947, 0, 0, 0, 1, 1,
1.012788, -0.9228008, 2.497872, 0, 0, 0, 1, 1,
1.015468, 0.5598054, 1.902504, 0, 0, 0, 1, 1,
1.01638, 0.3441251, 1.967168, 0, 0, 0, 1, 1,
1.029083, 0.1828278, 3.427798, 0, 0, 0, 1, 1,
1.040561, 1.800669, 3.224612, 0, 0, 0, 1, 1,
1.049272, 1.691748, -0.6370881, 0, 0, 0, 1, 1,
1.049936, -0.5340298, 1.077325, 1, 1, 1, 1, 1,
1.050014, -0.1183689, 1.539965, 1, 1, 1, 1, 1,
1.077806, 1.456427, -0.4989027, 1, 1, 1, 1, 1,
1.086506, 0.5732272, 1.097848, 1, 1, 1, 1, 1,
1.089265, -0.1176853, 1.795324, 1, 1, 1, 1, 1,
1.091679, 1.098581, -0.2782843, 1, 1, 1, 1, 1,
1.098432, 0.2700306, 1.447235, 1, 1, 1, 1, 1,
1.099067, -1.083729, 2.838834, 1, 1, 1, 1, 1,
1.101357, -1.4488, 3.504528, 1, 1, 1, 1, 1,
1.105757, -0.2399054, -0.1725242, 1, 1, 1, 1, 1,
1.112007, -0.3435946, 0.8334505, 1, 1, 1, 1, 1,
1.112923, -0.6538142, 1.483303, 1, 1, 1, 1, 1,
1.119666, -0.2539518, 2.065418, 1, 1, 1, 1, 1,
1.122574, -0.9695832, 2.170166, 1, 1, 1, 1, 1,
1.130914, 0.500219, 0.663913, 1, 1, 1, 1, 1,
1.132856, 1.182058, 0.9053417, 0, 0, 1, 1, 1,
1.146296, 0.9196648, 1.212626, 1, 0, 0, 1, 1,
1.146498, -0.9959363, 5.129657, 1, 0, 0, 1, 1,
1.176155, 0.3007428, 1.806336, 1, 0, 0, 1, 1,
1.178319, 1.547145, -0.2780704, 1, 0, 0, 1, 1,
1.18041, 0.239959, 0.5523516, 1, 0, 0, 1, 1,
1.182324, 0.2539329, 1.044595, 0, 0, 0, 1, 1,
1.186389, 0.7292609, 2.052391, 0, 0, 0, 1, 1,
1.19591, -1.067904, 2.184381, 0, 0, 0, 1, 1,
1.197426, 1.741916, -0.4658042, 0, 0, 0, 1, 1,
1.206676, -1.233451, 4.367139, 0, 0, 0, 1, 1,
1.217366, 0.2619731, 2.489506, 0, 0, 0, 1, 1,
1.218235, 1.264664, 1.815686, 0, 0, 0, 1, 1,
1.220696, -1.436677, 2.123656, 1, 1, 1, 1, 1,
1.234182, -1.457312, 2.328786, 1, 1, 1, 1, 1,
1.234407, -0.5996696, 3.209549, 1, 1, 1, 1, 1,
1.238281, 0.5346242, 1.621362, 1, 1, 1, 1, 1,
1.24067, 0.3221311, 1.206411, 1, 1, 1, 1, 1,
1.244577, 0.4456772, 1.045992, 1, 1, 1, 1, 1,
1.252484, -0.1511828, 0.1468562, 1, 1, 1, 1, 1,
1.279115, 1.240656, 1.228638, 1, 1, 1, 1, 1,
1.279912, 1.156879, -0.1629056, 1, 1, 1, 1, 1,
1.286164, -0.02561456, 3.088312, 1, 1, 1, 1, 1,
1.293629, -0.2448469, 1.356223, 1, 1, 1, 1, 1,
1.306152, -0.8213316, 3.014162, 1, 1, 1, 1, 1,
1.306361, 0.4008528, 2.338472, 1, 1, 1, 1, 1,
1.309385, 0.1418312, 2.742272, 1, 1, 1, 1, 1,
1.310124, -0.4796321, 2.653504, 1, 1, 1, 1, 1,
1.310722, 1.065522, 1.567094, 0, 0, 1, 1, 1,
1.325191, 1.452351, 2.121782, 1, 0, 0, 1, 1,
1.328015, 2.497332, 0.9243785, 1, 0, 0, 1, 1,
1.32975, -1.347259, 4.159164, 1, 0, 0, 1, 1,
1.337932, 1.012568, 2.016057, 1, 0, 0, 1, 1,
1.342116, -0.9213556, 2.450783, 1, 0, 0, 1, 1,
1.350515, -1.842267, 1.832565, 0, 0, 0, 1, 1,
1.352451, 0.08785814, 2.726984, 0, 0, 0, 1, 1,
1.356293, 0.4025753, 1.428987, 0, 0, 0, 1, 1,
1.370233, 0.8009378, 0.01012946, 0, 0, 0, 1, 1,
1.373512, 1.259005, -0.1932016, 0, 0, 0, 1, 1,
1.379336, -0.5444894, 2.974293, 0, 0, 0, 1, 1,
1.382099, 1.125791, 0.8293259, 0, 0, 0, 1, 1,
1.389748, -1.378404, 2.24779, 1, 1, 1, 1, 1,
1.393213, -1.253131, 3.068016, 1, 1, 1, 1, 1,
1.39415, 1.261203, 0.8587628, 1, 1, 1, 1, 1,
1.394771, -0.3989718, 1.766355, 1, 1, 1, 1, 1,
1.396151, -1.743592, 1.637883, 1, 1, 1, 1, 1,
1.399668, 1.264976, 0.8084398, 1, 1, 1, 1, 1,
1.406662, 0.9148855, 1.176709, 1, 1, 1, 1, 1,
1.422201, 0.4104813, 0.478686, 1, 1, 1, 1, 1,
1.430875, -0.1074234, 1.535233, 1, 1, 1, 1, 1,
1.433416, 1.18612, 0.6664816, 1, 1, 1, 1, 1,
1.438349, -0.6628564, 1.900058, 1, 1, 1, 1, 1,
1.448039, -0.6116438, 1.389286, 1, 1, 1, 1, 1,
1.457954, -0.2734832, 2.088438, 1, 1, 1, 1, 1,
1.480312, -2.330289, 1.614484, 1, 1, 1, 1, 1,
1.483406, 0.03279776, 1.513734, 1, 1, 1, 1, 1,
1.507963, 1.042558, 0.1497851, 0, 0, 1, 1, 1,
1.515037, -0.1343511, 1.857402, 1, 0, 0, 1, 1,
1.530638, -1.071348, 2.338003, 1, 0, 0, 1, 1,
1.537414, -0.5129123, 3.458357, 1, 0, 0, 1, 1,
1.537889, -1.5313, -0.377058, 1, 0, 0, 1, 1,
1.541511, 0.1712727, 1.339545, 1, 0, 0, 1, 1,
1.550044, -0.8710879, 2.563148, 0, 0, 0, 1, 1,
1.558172, -0.7374373, 2.134706, 0, 0, 0, 1, 1,
1.563369, -0.07475811, -0.1740988, 0, 0, 0, 1, 1,
1.570444, 0.3841848, 1.902, 0, 0, 0, 1, 1,
1.577623, 1.140288, 0.5496602, 0, 0, 0, 1, 1,
1.586145, 0.5636775, 1.230793, 0, 0, 0, 1, 1,
1.59337, 0.7776022, 1.415581, 0, 0, 0, 1, 1,
1.593607, 0.3999987, 0.4174316, 1, 1, 1, 1, 1,
1.602705, 0.2578454, 3.019054, 1, 1, 1, 1, 1,
1.609311, 0.04100144, 1.376079, 1, 1, 1, 1, 1,
1.610213, 1.10255, 1.067457, 1, 1, 1, 1, 1,
1.61306, -1.203356, 1.751597, 1, 1, 1, 1, 1,
1.62422, 0.8065505, 0.8757749, 1, 1, 1, 1, 1,
1.632991, -0.3471324, 2.803195, 1, 1, 1, 1, 1,
1.635753, -1.65637, 3.902654, 1, 1, 1, 1, 1,
1.640052, 0.5058758, 2.18089, 1, 1, 1, 1, 1,
1.657222, -1.412269, 0.4893472, 1, 1, 1, 1, 1,
1.659045, -0.5363342, 1.366613, 1, 1, 1, 1, 1,
1.668032, -0.687717, 2.126942, 1, 1, 1, 1, 1,
1.683883, -0.7473339, 1.512067, 1, 1, 1, 1, 1,
1.695745, 0.682947, -0.7848079, 1, 1, 1, 1, 1,
1.720367, -1.121147, 2.387388, 1, 1, 1, 1, 1,
1.729926, 0.6615778, 0.5987839, 0, 0, 1, 1, 1,
1.733552, 3.450598, 0.9466947, 1, 0, 0, 1, 1,
1.7471, 1.295889, -0.2963836, 1, 0, 0, 1, 1,
1.771668, -0.9883172, 2.740143, 1, 0, 0, 1, 1,
1.779549, -0.4168153, 2.777547, 1, 0, 0, 1, 1,
1.785537, 1.038398, 0.2264903, 1, 0, 0, 1, 1,
1.800293, -0.4735961, 0.3898257, 0, 0, 0, 1, 1,
1.802613, -1.071223, 3.020734, 0, 0, 0, 1, 1,
1.835651, -0.2387605, 2.372444, 0, 0, 0, 1, 1,
1.83816, 0.2021016, 1.431209, 0, 0, 0, 1, 1,
1.847048, 1.079395, 1.880365, 0, 0, 0, 1, 1,
1.851462, -0.7425221, 1.025742, 0, 0, 0, 1, 1,
1.857988, -1.080263, 1.841049, 0, 0, 0, 1, 1,
1.873883, -0.2097289, 2.736627, 1, 1, 1, 1, 1,
1.911901, -0.1746413, -0.2497191, 1, 1, 1, 1, 1,
1.945726, 0.3693689, 2.562586, 1, 1, 1, 1, 1,
1.977927, 1.117913, 1.253988, 1, 1, 1, 1, 1,
1.979023, 0.5185528, 0.02150512, 1, 1, 1, 1, 1,
1.97955, 0.8785434, 0.08697896, 1, 1, 1, 1, 1,
1.988373, 0.5062096, -0.03044986, 1, 1, 1, 1, 1,
1.997171, -0.4082852, 1.755452, 1, 1, 1, 1, 1,
2.041199, 0.9926111, -0.7833782, 1, 1, 1, 1, 1,
2.044888, 1.029588, 0.9884788, 1, 1, 1, 1, 1,
2.047019, -0.4763041, 2.20676, 1, 1, 1, 1, 1,
2.052633, -1.518093, 3.126565, 1, 1, 1, 1, 1,
2.102134, 0.4734704, 2.352394, 1, 1, 1, 1, 1,
2.104372, -0.431506, 1.064881, 1, 1, 1, 1, 1,
2.118601, 0.01762997, -1.109594, 1, 1, 1, 1, 1,
2.119183, -0.879567, 1.180909, 0, 0, 1, 1, 1,
2.119695, -2.034698, 2.308556, 1, 0, 0, 1, 1,
2.124142, -1.340804, 2.261588, 1, 0, 0, 1, 1,
2.146889, -1.09517, 0.9147137, 1, 0, 0, 1, 1,
2.234506, -0.8981349, 1.575433, 1, 0, 0, 1, 1,
2.278603, 0.8729457, 2.334336, 1, 0, 0, 1, 1,
2.361323, -0.7806102, 1.026004, 0, 0, 0, 1, 1,
2.393758, -1.395674, 1.958718, 0, 0, 0, 1, 1,
2.405765, -1.32182, 1.509064, 0, 0, 0, 1, 1,
2.512137, 0.09492435, 1.887451, 0, 0, 0, 1, 1,
2.530507, 2.358619, 1.129785, 0, 0, 0, 1, 1,
2.568742, 0.06607376, 2.721172, 0, 0, 0, 1, 1,
2.620916, 0.7201759, 0.9697598, 0, 0, 0, 1, 1,
2.63487, -0.2090388, 0.7564117, 1, 1, 1, 1, 1,
2.733829, 1.014816, -0.6719011, 1, 1, 1, 1, 1,
2.734128, -1.304701, 1.158535, 1, 1, 1, 1, 1,
2.813944, -2.367953, 1.488474, 1, 1, 1, 1, 1,
2.904924, -0.9751506, 0.7955126, 1, 1, 1, 1, 1,
2.944606, -1.244236, 0.3039751, 1, 1, 1, 1, 1,
3.144667, -0.1678279, 0.9161385, 1, 1, 1, 1, 1
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
var radius = 10.10097;
var distance = 35.47924;
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
mvMatrix.translate( 0.08849263, -0.2348106, 0.09726191 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.47924);
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