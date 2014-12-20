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
-2.978805, 0.7428927, -2.294285, 1, 0, 0, 1,
-2.947307, 0.3514465, -1.149926, 1, 0.007843138, 0, 1,
-2.854654, 1.452351, -1.822164, 1, 0.01176471, 0, 1,
-2.713215, 1.39821, -2.006679, 1, 0.01960784, 0, 1,
-2.703588, -1.088979, -1.541623, 1, 0.02352941, 0, 1,
-2.659224, 0.4533185, -1.458166, 1, 0.03137255, 0, 1,
-2.634008, 0.2053774, -1.938366, 1, 0.03529412, 0, 1,
-2.602506, -1.670291, -1.709774, 1, 0.04313726, 0, 1,
-2.474604, 0.9496975, -1.507779, 1, 0.04705882, 0, 1,
-2.424812, 0.8449751, -2.604452, 1, 0.05490196, 0, 1,
-2.361819, -0.8533008, -1.207125, 1, 0.05882353, 0, 1,
-2.323304, -1.133037, -1.0224, 1, 0.06666667, 0, 1,
-2.315696, -0.5685771, -2.458036, 1, 0.07058824, 0, 1,
-2.309103, -0.1153804, -2.627752, 1, 0.07843138, 0, 1,
-2.24013, 0.424141, -0.7594297, 1, 0.08235294, 0, 1,
-2.208515, 1.293165, -1.364777, 1, 0.09019608, 0, 1,
-2.203627, 0.2300268, -0.8026376, 1, 0.09411765, 0, 1,
-2.136308, -0.6076905, -1.159224, 1, 0.1019608, 0, 1,
-2.121396, 0.1481361, -1.901173, 1, 0.1098039, 0, 1,
-2.0912, 0.02323543, -1.641342, 1, 0.1137255, 0, 1,
-2.090844, -0.0103511, 1.023165, 1, 0.1215686, 0, 1,
-2.078684, -0.8763641, -1.921766, 1, 0.1254902, 0, 1,
-2.076215, -0.6317475, -1.959801, 1, 0.1333333, 0, 1,
-2.062078, 0.6201446, -1.634633, 1, 0.1372549, 0, 1,
-1.999801, 1.543436, -1.03403, 1, 0.145098, 0, 1,
-1.995933, -0.2192922, -2.936146, 1, 0.1490196, 0, 1,
-1.958262, 0.1804349, -2.859522, 1, 0.1568628, 0, 1,
-1.953908, -1.525944, -2.68242, 1, 0.1607843, 0, 1,
-1.946633, 1.085638, -0.9569274, 1, 0.1686275, 0, 1,
-1.927782, -0.5235314, -2.82554, 1, 0.172549, 0, 1,
-1.892324, 1.223766, -1.605365, 1, 0.1803922, 0, 1,
-1.892034, 0.1804196, -0.7189162, 1, 0.1843137, 0, 1,
-1.875771, -0.2077586, -2.541831, 1, 0.1921569, 0, 1,
-1.810514, 0.5534375, -2.269165, 1, 0.1960784, 0, 1,
-1.789178, -0.1845425, -0.3795254, 1, 0.2039216, 0, 1,
-1.744514, -0.1057587, -2.638356, 1, 0.2117647, 0, 1,
-1.738432, 0.01437842, -1.959158, 1, 0.2156863, 0, 1,
-1.728784, 2.293217, 0.5966045, 1, 0.2235294, 0, 1,
-1.712806, 1.329662, -2.063583, 1, 0.227451, 0, 1,
-1.709294, 0.5308372, -1.333193, 1, 0.2352941, 0, 1,
-1.702141, -1.581961, -2.070823, 1, 0.2392157, 0, 1,
-1.698619, 0.7078619, -0.4892431, 1, 0.2470588, 0, 1,
-1.685876, 0.1117505, -0.3386551, 1, 0.2509804, 0, 1,
-1.685408, 1.026048, -0.3041204, 1, 0.2588235, 0, 1,
-1.679959, 0.9331975, 0.2953921, 1, 0.2627451, 0, 1,
-1.678863, -0.0748184, -1.766154, 1, 0.2705882, 0, 1,
-1.678775, 0.2298515, -0.9683229, 1, 0.2745098, 0, 1,
-1.677859, -0.8504181, -1.948801, 1, 0.282353, 0, 1,
-1.674226, 1.033956, -1.873194, 1, 0.2862745, 0, 1,
-1.672567, -1.11746, -3.443398, 1, 0.2941177, 0, 1,
-1.669881, 0.3080048, -1.665792, 1, 0.3019608, 0, 1,
-1.661145, -0.2383369, 0.7563957, 1, 0.3058824, 0, 1,
-1.658309, 0.8442939, 0.2339643, 1, 0.3137255, 0, 1,
-1.645792, -1.488723, -2.50417, 1, 0.3176471, 0, 1,
-1.621566, -1.246604, -2.379638, 1, 0.3254902, 0, 1,
-1.619062, 0.6969664, -1.937284, 1, 0.3294118, 0, 1,
-1.616253, -1.480101, -2.595648, 1, 0.3372549, 0, 1,
-1.610812, -0.9839433, -1.253919, 1, 0.3411765, 0, 1,
-1.609387, -0.5862325, -0.04729057, 1, 0.3490196, 0, 1,
-1.606061, -1.093586, -2.345582, 1, 0.3529412, 0, 1,
-1.603713, 0.329628, 0.522055, 1, 0.3607843, 0, 1,
-1.592975, -1.061221, -1.140193, 1, 0.3647059, 0, 1,
-1.591217, 0.4952996, -2.292492, 1, 0.372549, 0, 1,
-1.565121, 0.0357113, -2.629056, 1, 0.3764706, 0, 1,
-1.560752, -1.47344, -2.802931, 1, 0.3843137, 0, 1,
-1.54034, 0.3431247, -0.6489537, 1, 0.3882353, 0, 1,
-1.539149, 0.1009882, -2.327889, 1, 0.3960784, 0, 1,
-1.538452, -1.862174, -1.538267, 1, 0.4039216, 0, 1,
-1.535251, -0.4743376, -2.106552, 1, 0.4078431, 0, 1,
-1.529485, -0.9257014, -2.495269, 1, 0.4156863, 0, 1,
-1.497394, -1.950886, -2.615603, 1, 0.4196078, 0, 1,
-1.485395, -0.01516455, -0.8471611, 1, 0.427451, 0, 1,
-1.484426, 0.03345396, -2.281258, 1, 0.4313726, 0, 1,
-1.47731, -0.0214506, -3.084254, 1, 0.4392157, 0, 1,
-1.468599, -0.4363523, -1.247412, 1, 0.4431373, 0, 1,
-1.462261, -1.430639, -3.760002, 1, 0.4509804, 0, 1,
-1.45175, -0.6366014, -1.249104, 1, 0.454902, 0, 1,
-1.449236, -0.9352199, -1.695484, 1, 0.4627451, 0, 1,
-1.401936, 1.365689, -0.6398373, 1, 0.4666667, 0, 1,
-1.39378, 1.438309, -0.1307162, 1, 0.4745098, 0, 1,
-1.381615, 0.6403499, -3.060136, 1, 0.4784314, 0, 1,
-1.380835, 0.8927985, -0.5596095, 1, 0.4862745, 0, 1,
-1.379453, 0.1760076, -0.2308462, 1, 0.4901961, 0, 1,
-1.372018, 0.3820291, -1.119698, 1, 0.4980392, 0, 1,
-1.368116, 0.08412999, -2.49559, 1, 0.5058824, 0, 1,
-1.367498, -0.5488012, -3.362313, 1, 0.509804, 0, 1,
-1.363954, -0.2415262, -1.405465, 1, 0.5176471, 0, 1,
-1.335509, -0.3220026, -2.936121, 1, 0.5215687, 0, 1,
-1.334552, 0.3869691, -1.607372, 1, 0.5294118, 0, 1,
-1.334254, 0.2523369, -1.499531, 1, 0.5333334, 0, 1,
-1.314869, 0.4750309, -0.2542115, 1, 0.5411765, 0, 1,
-1.308451, 2.462465, -2.002203, 1, 0.5450981, 0, 1,
-1.281366, 0.7839261, -2.11461, 1, 0.5529412, 0, 1,
-1.279297, 0.3603216, -1.45151, 1, 0.5568628, 0, 1,
-1.278922, -2.842772, -1.589834, 1, 0.5647059, 0, 1,
-1.264086, 0.1540216, -2.877966, 1, 0.5686275, 0, 1,
-1.262358, -1.592663, -4.904831, 1, 0.5764706, 0, 1,
-1.237675, -0.7694044, -2.007242, 1, 0.5803922, 0, 1,
-1.231862, 0.01136397, -1.53439, 1, 0.5882353, 0, 1,
-1.231325, -0.5200242, -2.089677, 1, 0.5921569, 0, 1,
-1.227071, -1.539323, -2.267141, 1, 0.6, 0, 1,
-1.222304, -0.6224787, -0.3844205, 1, 0.6078432, 0, 1,
-1.220516, -0.6686017, -2.267053, 1, 0.6117647, 0, 1,
-1.206259, 1.05794, -0.8589193, 1, 0.6196079, 0, 1,
-1.203222, -2.002365, -2.436499, 1, 0.6235294, 0, 1,
-1.195631, 0.6601231, -0.5427091, 1, 0.6313726, 0, 1,
-1.194484, -1.11497, -1.943717, 1, 0.6352941, 0, 1,
-1.188675, 0.8328551, -0.3868237, 1, 0.6431373, 0, 1,
-1.186079, 0.6876682, 0.0526628, 1, 0.6470588, 0, 1,
-1.185102, -1.147557, -1.638429, 1, 0.654902, 0, 1,
-1.173253, 0.4254582, -0.4207275, 1, 0.6588235, 0, 1,
-1.167891, -1.156523, -1.401783, 1, 0.6666667, 0, 1,
-1.166373, -0.913689, -2.395765, 1, 0.6705883, 0, 1,
-1.16465, 2.09915, 0.2863143, 1, 0.6784314, 0, 1,
-1.152999, 0.2389078, -2.099137, 1, 0.682353, 0, 1,
-1.150103, 0.7595091, -1.462601, 1, 0.6901961, 0, 1,
-1.135593, -0.1464891, -1.209571, 1, 0.6941177, 0, 1,
-1.128332, -1.291921, -1.670698, 1, 0.7019608, 0, 1,
-1.126341, 1.238985, 1.882227, 1, 0.7098039, 0, 1,
-1.124095, 0.596166, -0.7933404, 1, 0.7137255, 0, 1,
-1.11698, -0.1172016, -0.9381235, 1, 0.7215686, 0, 1,
-1.115428, 0.2989075, 0.1626703, 1, 0.7254902, 0, 1,
-1.102356, 0.3584291, -1.411701, 1, 0.7333333, 0, 1,
-1.102102, -0.2092109, -0.7520032, 1, 0.7372549, 0, 1,
-1.093485, -0.304776, -1.205361, 1, 0.7450981, 0, 1,
-1.082925, 1.152668, -2.562471, 1, 0.7490196, 0, 1,
-1.081371, 2.499617, 0.7427696, 1, 0.7568628, 0, 1,
-1.071459, -1.191166, -2.113983, 1, 0.7607843, 0, 1,
-1.071053, -1.30338, -3.956973, 1, 0.7686275, 0, 1,
-1.062843, 0.8175009, -1.786088, 1, 0.772549, 0, 1,
-1.059617, 0.6272545, 0.3988753, 1, 0.7803922, 0, 1,
-1.051984, 0.5920843, -0.2206848, 1, 0.7843137, 0, 1,
-1.05146, -1.631824, -3.415242, 1, 0.7921569, 0, 1,
-1.051113, 1.447194, -1.256255, 1, 0.7960784, 0, 1,
-1.048013, -0.441743, -3.006196, 1, 0.8039216, 0, 1,
-1.043047, 0.5025234, -0.6808078, 1, 0.8117647, 0, 1,
-1.039304, 0.00170567, -2.039795, 1, 0.8156863, 0, 1,
-1.03617, -0.2181304, -0.6897218, 1, 0.8235294, 0, 1,
-1.03572, 0.1340138, -1.259873, 1, 0.827451, 0, 1,
-1.034471, 2.911517, -0.3057816, 1, 0.8352941, 0, 1,
-1.032525, -0.4414141, -1.292666, 1, 0.8392157, 0, 1,
-1.032009, 0.1729777, -1.214598, 1, 0.8470588, 0, 1,
-1.028107, 0.9234444, -1.372937, 1, 0.8509804, 0, 1,
-1.025705, 2.227466, -0.6290607, 1, 0.8588235, 0, 1,
-1.02121, -0.2181846, -2.493317, 1, 0.8627451, 0, 1,
-1.001325, 1.229013, -0.5254731, 1, 0.8705882, 0, 1,
-0.9983094, 0.3704894, -2.42854, 1, 0.8745098, 0, 1,
-0.9932145, 0.3629, -1.750931, 1, 0.8823529, 0, 1,
-0.986823, 1.51922, -1.019224, 1, 0.8862745, 0, 1,
-0.9843054, 0.0497393, -3.291424, 1, 0.8941177, 0, 1,
-0.9841982, 1.594267, -1.063298, 1, 0.8980392, 0, 1,
-0.9747119, -1.011341, -3.714966, 1, 0.9058824, 0, 1,
-0.9684913, -0.8582178, -3.646681, 1, 0.9137255, 0, 1,
-0.9679192, -0.9663358, -1.057311, 1, 0.9176471, 0, 1,
-0.9672539, 1.053934, -1.691868, 1, 0.9254902, 0, 1,
-0.9622411, -1.261643, -2.42315, 1, 0.9294118, 0, 1,
-0.9603346, 1.446291, 0.2411894, 1, 0.9372549, 0, 1,
-0.956943, -0.6256636, -1.914273, 1, 0.9411765, 0, 1,
-0.9568202, -0.8350589, -2.893516, 1, 0.9490196, 0, 1,
-0.9557748, -0.4762752, -1.211341, 1, 0.9529412, 0, 1,
-0.9492867, -0.8774914, -1.727227, 1, 0.9607843, 0, 1,
-0.9443308, -0.6934977, -3.243898, 1, 0.9647059, 0, 1,
-0.9430991, -0.296164, -1.894501, 1, 0.972549, 0, 1,
-0.9377036, 0.2640196, 0.6114012, 1, 0.9764706, 0, 1,
-0.936958, 1.524199, -0.7840649, 1, 0.9843137, 0, 1,
-0.9280742, -1.144789, -1.503534, 1, 0.9882353, 0, 1,
-0.9269937, 1.406598, -0.6124251, 1, 0.9960784, 0, 1,
-0.9246971, 1.034339, -3.558983, 0.9960784, 1, 0, 1,
-0.9212344, -0.5769562, -1.328136, 0.9921569, 1, 0, 1,
-0.9200239, 0.2366449, -2.020946, 0.9843137, 1, 0, 1,
-0.9193633, 0.4867888, -1.356575, 0.9803922, 1, 0, 1,
-0.9116209, -0.3206486, -2.73362, 0.972549, 1, 0, 1,
-0.9061775, -0.3450431, -2.03547, 0.9686275, 1, 0, 1,
-0.9053634, -0.06427338, -3.055262, 0.9607843, 1, 0, 1,
-0.9044954, -0.4717005, -1.157704, 0.9568627, 1, 0, 1,
-0.9032238, -1.492355, -1.750165, 0.9490196, 1, 0, 1,
-0.9029744, -1.582414, -2.876644, 0.945098, 1, 0, 1,
-0.8989104, 0.4081048, -1.049693, 0.9372549, 1, 0, 1,
-0.8970324, 0.02082522, 0.3508467, 0.9333333, 1, 0, 1,
-0.8959706, -0.3245512, -0.9979577, 0.9254902, 1, 0, 1,
-0.8940687, -0.9327633, -2.576403, 0.9215686, 1, 0, 1,
-0.8927988, -0.3133793, -1.644622, 0.9137255, 1, 0, 1,
-0.8920317, 0.8564998, -2.096082, 0.9098039, 1, 0, 1,
-0.8883014, 0.7291682, -0.7478633, 0.9019608, 1, 0, 1,
-0.8871336, -0.2475337, -3.151964, 0.8941177, 1, 0, 1,
-0.8848986, 0.01137243, -1.905352, 0.8901961, 1, 0, 1,
-0.8837996, -0.1432267, -2.160271, 0.8823529, 1, 0, 1,
-0.8835456, -0.02012229, -1.880929, 0.8784314, 1, 0, 1,
-0.8831664, 0.2910397, -1.34806, 0.8705882, 1, 0, 1,
-0.8794546, 1.398846, 0.4383079, 0.8666667, 1, 0, 1,
-0.8790378, -0.1522556, -0.4141805, 0.8588235, 1, 0, 1,
-0.8744002, -0.02126114, -1.577339, 0.854902, 1, 0, 1,
-0.8630099, -0.500575, -2.743036, 0.8470588, 1, 0, 1,
-0.8625278, 1.492829, -0.9930699, 0.8431373, 1, 0, 1,
-0.8588906, -0.09044302, -0.7588635, 0.8352941, 1, 0, 1,
-0.8586898, 0.08848003, -3.634825, 0.8313726, 1, 0, 1,
-0.8552602, -0.4226653, -3.589937, 0.8235294, 1, 0, 1,
-0.8539312, 0.9247463, -1.341731, 0.8196079, 1, 0, 1,
-0.8488286, 1.401444, 0.1881102, 0.8117647, 1, 0, 1,
-0.8465245, 0.9675016, 2.478975, 0.8078431, 1, 0, 1,
-0.8449566, 0.7482638, -0.4849221, 0.8, 1, 0, 1,
-0.8380533, 2.161772, -0.02344452, 0.7921569, 1, 0, 1,
-0.8356349, -0.8936973, -1.777141, 0.7882353, 1, 0, 1,
-0.8314961, -1.359775, -3.174125, 0.7803922, 1, 0, 1,
-0.8294189, 0.6783357, -1.490864, 0.7764706, 1, 0, 1,
-0.8221803, -2.123705, -3.647216, 0.7686275, 1, 0, 1,
-0.816763, 0.290606, 1.827796, 0.7647059, 1, 0, 1,
-0.8165693, 1.439015, -0.8294215, 0.7568628, 1, 0, 1,
-0.8149911, 0.236238, -4.844635, 0.7529412, 1, 0, 1,
-0.8110866, 0.23183, -2.947391, 0.7450981, 1, 0, 1,
-0.8096213, 0.880996, -0.3198802, 0.7411765, 1, 0, 1,
-0.8084805, -1.58181, -3.779514, 0.7333333, 1, 0, 1,
-0.8046349, 0.1969822, 0.408855, 0.7294118, 1, 0, 1,
-0.7963645, -2.115057, -3.148389, 0.7215686, 1, 0, 1,
-0.7962731, 0.7656926, -0.08571727, 0.7176471, 1, 0, 1,
-0.796241, -1.192036, -1.862794, 0.7098039, 1, 0, 1,
-0.7955154, 0.3727897, -0.5920252, 0.7058824, 1, 0, 1,
-0.7951667, 0.4442062, -1.638636, 0.6980392, 1, 0, 1,
-0.7934238, 1.719164, -0.9707696, 0.6901961, 1, 0, 1,
-0.7934034, 0.7387875, -0.5082941, 0.6862745, 1, 0, 1,
-0.7892487, 0.8275813, 0.5054461, 0.6784314, 1, 0, 1,
-0.7882502, -0.2469417, -3.821162, 0.6745098, 1, 0, 1,
-0.7833574, -0.4408078, -3.456666, 0.6666667, 1, 0, 1,
-0.7747504, 0.02893623, -0.9640941, 0.6627451, 1, 0, 1,
-0.7710474, -0.6093963, -1.982831, 0.654902, 1, 0, 1,
-0.7616615, 1.647867, 0.6705073, 0.6509804, 1, 0, 1,
-0.7607422, 0.2989598, -3.011765, 0.6431373, 1, 0, 1,
-0.7601799, -0.2144115, -3.290418, 0.6392157, 1, 0, 1,
-0.7561854, -1.794415, -2.508461, 0.6313726, 1, 0, 1,
-0.7542542, 2.933194, 0.4063992, 0.627451, 1, 0, 1,
-0.7527847, 0.0897148, -1.208651, 0.6196079, 1, 0, 1,
-0.743026, -0.6512286, -2.323737, 0.6156863, 1, 0, 1,
-0.7394394, 0.270081, 0.5308375, 0.6078432, 1, 0, 1,
-0.734876, -1.343752, -3.744586, 0.6039216, 1, 0, 1,
-0.7298111, 0.8293313, -1.742317, 0.5960785, 1, 0, 1,
-0.7294015, 0.356394, -0.6400293, 0.5882353, 1, 0, 1,
-0.720008, -0.4257794, -0.7743145, 0.5843138, 1, 0, 1,
-0.7185678, 0.09921911, -1.586436, 0.5764706, 1, 0, 1,
-0.7136208, 0.41437, -1.464422, 0.572549, 1, 0, 1,
-0.7057678, 1.201233, -1.976016, 0.5647059, 1, 0, 1,
-0.6975473, -2.018675, -1.785133, 0.5607843, 1, 0, 1,
-0.6936041, -0.412363, -1.218763, 0.5529412, 1, 0, 1,
-0.6917422, 0.2548011, -1.074195, 0.5490196, 1, 0, 1,
-0.6900624, -1.843305, -3.523454, 0.5411765, 1, 0, 1,
-0.6876825, 1.157017, -0.1647306, 0.5372549, 1, 0, 1,
-0.6864607, 0.02501433, -2.501455, 0.5294118, 1, 0, 1,
-0.6846407, 0.06100653, -3.385301, 0.5254902, 1, 0, 1,
-0.6843354, 0.7581735, -1.433766, 0.5176471, 1, 0, 1,
-0.6836188, -1.035376, -2.977799, 0.5137255, 1, 0, 1,
-0.6814906, -1.422809, -2.247671, 0.5058824, 1, 0, 1,
-0.6777278, -0.5598243, -2.316507, 0.5019608, 1, 0, 1,
-0.6742038, 1.12032, 0.2080258, 0.4941176, 1, 0, 1,
-0.6714313, 1.41766, -0.880241, 0.4862745, 1, 0, 1,
-0.6711348, 0.6444089, -0.1146903, 0.4823529, 1, 0, 1,
-0.665781, -0.5599463, -1.502189, 0.4745098, 1, 0, 1,
-0.6607367, 0.6648681, 0.1231479, 0.4705882, 1, 0, 1,
-0.6604637, -0.2309108, -2.226336, 0.4627451, 1, 0, 1,
-0.6588693, 2.001623, 0.1409623, 0.4588235, 1, 0, 1,
-0.6587446, -0.6127441, -2.085603, 0.4509804, 1, 0, 1,
-0.6573599, 2.178771, 0.2140836, 0.4470588, 1, 0, 1,
-0.6537724, -2.111346, -2.356571, 0.4392157, 1, 0, 1,
-0.6519186, -0.9787629, -2.874792, 0.4352941, 1, 0, 1,
-0.6446773, -0.6708871, -3.272969, 0.427451, 1, 0, 1,
-0.6395409, -1.005115, -4.814179, 0.4235294, 1, 0, 1,
-0.638316, -0.5561589, -3.402192, 0.4156863, 1, 0, 1,
-0.6288953, -0.3292718, -1.426072, 0.4117647, 1, 0, 1,
-0.6243653, -0.4496715, -1.635948, 0.4039216, 1, 0, 1,
-0.6242252, 2.140105, 0.1930726, 0.3960784, 1, 0, 1,
-0.6226793, 1.788233, -0.3795087, 0.3921569, 1, 0, 1,
-0.6175612, -0.1793596, -3.157979, 0.3843137, 1, 0, 1,
-0.6170664, -0.23904, -1.795895, 0.3803922, 1, 0, 1,
-0.616217, 1.009089, -1.215206, 0.372549, 1, 0, 1,
-0.6142608, 1.196762, -0.1850443, 0.3686275, 1, 0, 1,
-0.6077883, -0.1823477, -1.83848, 0.3607843, 1, 0, 1,
-0.6012964, 0.1956563, -1.187392, 0.3568628, 1, 0, 1,
-0.593501, 0.2572553, -1.033081, 0.3490196, 1, 0, 1,
-0.5904785, 0.6404833, -0.06436487, 0.345098, 1, 0, 1,
-0.5901381, 0.4330882, 0.1322935, 0.3372549, 1, 0, 1,
-0.584998, 0.3300627, -1.433502, 0.3333333, 1, 0, 1,
-0.582332, -2.545635, -3.728219, 0.3254902, 1, 0, 1,
-0.5793357, -0.2855945, -2.792576, 0.3215686, 1, 0, 1,
-0.5761703, -0.4028876, -0.6028332, 0.3137255, 1, 0, 1,
-0.5761068, -0.4988874, -2.003019, 0.3098039, 1, 0, 1,
-0.5535818, -2.067808, -3.181956, 0.3019608, 1, 0, 1,
-0.5513937, 0.3616037, -0.001175861, 0.2941177, 1, 0, 1,
-0.5485775, -1.294577, -2.76544, 0.2901961, 1, 0, 1,
-0.5386138, -0.4355629, -2.526793, 0.282353, 1, 0, 1,
-0.5380523, 0.6467579, -1.94054, 0.2784314, 1, 0, 1,
-0.5379823, -0.07461643, -1.405815, 0.2705882, 1, 0, 1,
-0.5362662, -0.3366421, -3.753278, 0.2666667, 1, 0, 1,
-0.5297406, -0.1454494, -1.751274, 0.2588235, 1, 0, 1,
-0.5281817, 0.2328595, -1.563885, 0.254902, 1, 0, 1,
-0.52622, -0.9229052, -3.209429, 0.2470588, 1, 0, 1,
-0.5248271, -2.716757, -2.510175, 0.2431373, 1, 0, 1,
-0.5246581, -0.2698437, -3.130928, 0.2352941, 1, 0, 1,
-0.5216537, 1.548172, 0.0001364141, 0.2313726, 1, 0, 1,
-0.5195211, 1.698579, -0.2432265, 0.2235294, 1, 0, 1,
-0.5182981, 0.0359954, -0.3289943, 0.2196078, 1, 0, 1,
-0.5174241, -0.6316777, -3.201275, 0.2117647, 1, 0, 1,
-0.5093365, 0.5306879, -0.8584267, 0.2078431, 1, 0, 1,
-0.5081104, -1.998685, -1.533355, 0.2, 1, 0, 1,
-0.5077963, -0.7527154, -2.748998, 0.1921569, 1, 0, 1,
-0.5055134, -2.450827, -5.055923, 0.1882353, 1, 0, 1,
-0.5030167, 0.02600349, -2.276499, 0.1803922, 1, 0, 1,
-0.4986022, -1.571045, -3.953287, 0.1764706, 1, 0, 1,
-0.4935413, -1.879841, -2.383537, 0.1686275, 1, 0, 1,
-0.4924787, -0.1592741, -1.725162, 0.1647059, 1, 0, 1,
-0.4901333, -0.6804153, -3.536952, 0.1568628, 1, 0, 1,
-0.4892782, -2.190192, -3.11701, 0.1529412, 1, 0, 1,
-0.482687, -2.25401, -2.547084, 0.145098, 1, 0, 1,
-0.4767959, 1.910499, -1.427635, 0.1411765, 1, 0, 1,
-0.4757101, 0.009037184, -1.940188, 0.1333333, 1, 0, 1,
-0.4713226, -0.4693405, -2.781968, 0.1294118, 1, 0, 1,
-0.4666194, -0.1323669, -2.493576, 0.1215686, 1, 0, 1,
-0.4587984, -0.5064242, -1.813648, 0.1176471, 1, 0, 1,
-0.4585299, -0.2266287, -1.837991, 0.1098039, 1, 0, 1,
-0.4558325, 0.9302284, -1.387038, 0.1058824, 1, 0, 1,
-0.4554703, 0.4123378, 0.7684377, 0.09803922, 1, 0, 1,
-0.455007, -1.363068, -3.345548, 0.09019608, 1, 0, 1,
-0.4492587, 0.5836475, -0.2286494, 0.08627451, 1, 0, 1,
-0.4469136, -2.393011, -3.960006, 0.07843138, 1, 0, 1,
-0.4457756, 0.7993464, -1.430647, 0.07450981, 1, 0, 1,
-0.4380955, 1.965824, -2.712493, 0.06666667, 1, 0, 1,
-0.4353744, -0.3217572, -2.239566, 0.0627451, 1, 0, 1,
-0.4325847, -0.02523913, -2.059941, 0.05490196, 1, 0, 1,
-0.4319939, 0.5369945, 0.0935532, 0.05098039, 1, 0, 1,
-0.427866, 0.5901366, 1.154649, 0.04313726, 1, 0, 1,
-0.4252077, 1.53198, -0.05575383, 0.03921569, 1, 0, 1,
-0.4241099, 0.1248309, -0.2974523, 0.03137255, 1, 0, 1,
-0.4219607, -0.3595664, -3.636556, 0.02745098, 1, 0, 1,
-0.4201218, -1.264725, -3.159072, 0.01960784, 1, 0, 1,
-0.4197586, -0.6726814, -2.603097, 0.01568628, 1, 0, 1,
-0.4187356, -2.493883, -3.230428, 0.007843138, 1, 0, 1,
-0.4136328, 0.9019374, -0.5062189, 0.003921569, 1, 0, 1,
-0.411505, -0.5938339, -2.833123, 0, 1, 0.003921569, 1,
-0.4112895, -0.001154969, -2.808568, 0, 1, 0.01176471, 1,
-0.4101412, 0.1992621, -2.208153, 0, 1, 0.01568628, 1,
-0.4067152, 0.01289899, 1.065899, 0, 1, 0.02352941, 1,
-0.3985546, -0.7910655, -2.943365, 0, 1, 0.02745098, 1,
-0.3981733, -0.8212898, -3.096581, 0, 1, 0.03529412, 1,
-0.3928481, -0.1844952, -1.624746, 0, 1, 0.03921569, 1,
-0.3862903, -0.4337263, -2.951557, 0, 1, 0.04705882, 1,
-0.3837728, -0.06755123, 0.008487229, 0, 1, 0.05098039, 1,
-0.3760546, 0.2592172, -1.56088, 0, 1, 0.05882353, 1,
-0.3747212, 0.1972957, -1.268247, 0, 1, 0.0627451, 1,
-0.3736791, -1.457993, -2.916316, 0, 1, 0.07058824, 1,
-0.3709169, -2.346606, -3.38846, 0, 1, 0.07450981, 1,
-0.3642014, -2.185802, -1.606044, 0, 1, 0.08235294, 1,
-0.3614497, 1.184911, 0.06792124, 0, 1, 0.08627451, 1,
-0.3567072, -0.6019949, -2.189668, 0, 1, 0.09411765, 1,
-0.3562038, 0.8305145, 0.003154689, 0, 1, 0.1019608, 1,
-0.3526225, -0.3285447, -3.33261, 0, 1, 0.1058824, 1,
-0.3448344, -1.062358, -1.88577, 0, 1, 0.1137255, 1,
-0.3446405, 2.131502, -0.6935211, 0, 1, 0.1176471, 1,
-0.343304, -0.2348262, -2.735333, 0, 1, 0.1254902, 1,
-0.3410068, -2.507332, -2.655437, 0, 1, 0.1294118, 1,
-0.3372968, 0.5637492, -2.392196, 0, 1, 0.1372549, 1,
-0.3364401, -0.9867609, -3.047731, 0, 1, 0.1411765, 1,
-0.3355216, -0.7207556, -2.374725, 0, 1, 0.1490196, 1,
-0.3306393, -2.165675, -3.22989, 0, 1, 0.1529412, 1,
-0.3281973, 1.151893, -1.345697, 0, 1, 0.1607843, 1,
-0.3264533, 0.04349724, -0.4399347, 0, 1, 0.1647059, 1,
-0.3209435, -1.096604, -3.168265, 0, 1, 0.172549, 1,
-0.32083, -0.1868387, -1.711843, 0, 1, 0.1764706, 1,
-0.3204001, 0.2329274, -0.822919, 0, 1, 0.1843137, 1,
-0.315211, -0.4614115, -0.3646069, 0, 1, 0.1882353, 1,
-0.3116264, 0.9237486, -1.147397, 0, 1, 0.1960784, 1,
-0.2945683, -1.191738, -1.625729, 0, 1, 0.2039216, 1,
-0.2914622, 0.9985666, -0.7106614, 0, 1, 0.2078431, 1,
-0.2899924, 1.518104, -0.07011104, 0, 1, 0.2156863, 1,
-0.2761067, 1.119766, 0.3543724, 0, 1, 0.2196078, 1,
-0.2653123, -0.2118018, -0.5428141, 0, 1, 0.227451, 1,
-0.2601571, -0.3288313, -2.34913, 0, 1, 0.2313726, 1,
-0.2600086, 0.1954768, -4.098474, 0, 1, 0.2392157, 1,
-0.2589674, 1.457925, -1.770956, 0, 1, 0.2431373, 1,
-0.2552658, -0.3507368, -1.038235, 0, 1, 0.2509804, 1,
-0.2503873, 1.104349, -0.5237061, 0, 1, 0.254902, 1,
-0.2464712, 0.9274203, -0.08113942, 0, 1, 0.2627451, 1,
-0.2456457, -0.4157979, -3.153784, 0, 1, 0.2666667, 1,
-0.2370526, -0.8625389, -2.66832, 0, 1, 0.2745098, 1,
-0.2367778, 0.2875078, -0.6240668, 0, 1, 0.2784314, 1,
-0.2314404, 0.5240509, 0.9889875, 0, 1, 0.2862745, 1,
-0.231212, -1.69997, -4.112313, 0, 1, 0.2901961, 1,
-0.2306776, 0.1856045, -0.7967303, 0, 1, 0.2980392, 1,
-0.2226297, 1.234432, -0.1329307, 0, 1, 0.3058824, 1,
-0.2211896, -0.09528761, -1.559392, 0, 1, 0.3098039, 1,
-0.2195373, 0.7279545, -1.160819, 0, 1, 0.3176471, 1,
-0.2170256, 1.722138, 1.487216, 0, 1, 0.3215686, 1,
-0.2161018, -0.2214959, -1.064505, 0, 1, 0.3294118, 1,
-0.2160522, 1.021176, 2.102889, 0, 1, 0.3333333, 1,
-0.2140865, -1.336044, -1.909419, 0, 1, 0.3411765, 1,
-0.2140038, 0.6691357, 0.2437312, 0, 1, 0.345098, 1,
-0.2096158, 2.173047, -1.592136, 0, 1, 0.3529412, 1,
-0.2028378, 0.4704432, 0.007162922, 0, 1, 0.3568628, 1,
-0.1996894, 0.08348904, -1.70498, 0, 1, 0.3647059, 1,
-0.1994121, 0.6069893, -0.7289985, 0, 1, 0.3686275, 1,
-0.197009, 0.4816175, -0.3332189, 0, 1, 0.3764706, 1,
-0.1969339, 0.1761377, -0.3067012, 0, 1, 0.3803922, 1,
-0.1956687, 1.192067, -0.7209681, 0, 1, 0.3882353, 1,
-0.1942599, 0.1062395, -0.3601723, 0, 1, 0.3921569, 1,
-0.1904011, 1.017806, -0.9048021, 0, 1, 0.4, 1,
-0.1889235, -0.1334307, -3.147901, 0, 1, 0.4078431, 1,
-0.1861589, 0.2731723, -1.057572, 0, 1, 0.4117647, 1,
-0.1813779, 0.4364884, 0.002247207, 0, 1, 0.4196078, 1,
-0.1753911, -1.680904, -2.259397, 0, 1, 0.4235294, 1,
-0.1750841, -1.165416, -2.525611, 0, 1, 0.4313726, 1,
-0.174431, -0.5621137, -5.129782, 0, 1, 0.4352941, 1,
-0.168866, 0.0005859679, -0.2543891, 0, 1, 0.4431373, 1,
-0.1673474, 1.366791, -1.061955, 0, 1, 0.4470588, 1,
-0.167285, -0.6848458, -2.958973, 0, 1, 0.454902, 1,
-0.1639422, -0.8820889, -2.215033, 0, 1, 0.4588235, 1,
-0.1594665, -1.952375, -2.892967, 0, 1, 0.4666667, 1,
-0.1571351, -0.2082698, -3.3444, 0, 1, 0.4705882, 1,
-0.1553552, -0.1113656, -1.153194, 0, 1, 0.4784314, 1,
-0.1520468, 1.082563, 0.8442288, 0, 1, 0.4823529, 1,
-0.1479934, 0.1400111, 1.07609, 0, 1, 0.4901961, 1,
-0.1471049, -0.3315415, -2.867539, 0, 1, 0.4941176, 1,
-0.134127, -0.0835579, -2.957555, 0, 1, 0.5019608, 1,
-0.1282526, -0.195462, -1.282812, 0, 1, 0.509804, 1,
-0.1245471, 0.2644353, -1.641089, 0, 1, 0.5137255, 1,
-0.1188781, -1.123307, -1.599546, 0, 1, 0.5215687, 1,
-0.1184508, 0.3168394, -1.215636, 0, 1, 0.5254902, 1,
-0.1180194, -0.49167, -3.077423, 0, 1, 0.5333334, 1,
-0.1104143, 1.45172, 1.962696, 0, 1, 0.5372549, 1,
-0.1080529, -1.210559, -4.888332, 0, 1, 0.5450981, 1,
-0.1075443, -1.404965, -1.081098, 0, 1, 0.5490196, 1,
-0.1045936, 0.2313635, -1.338918, 0, 1, 0.5568628, 1,
-0.100962, 0.3133028, 0.09668913, 0, 1, 0.5607843, 1,
-0.1006981, -1.013365, -2.835077, 0, 1, 0.5686275, 1,
-0.09975927, 0.5694652, -0.6949014, 0, 1, 0.572549, 1,
-0.09952132, -0.7914138, -3.518436, 0, 1, 0.5803922, 1,
-0.09546138, 1.190935, 0.661736, 0, 1, 0.5843138, 1,
-0.09398145, -3.067883, -3.361161, 0, 1, 0.5921569, 1,
-0.09291455, 0.9536806, -0.9436359, 0, 1, 0.5960785, 1,
-0.09243416, 0.4045106, -0.7169471, 0, 1, 0.6039216, 1,
-0.08787657, -0.9688482, -3.15051, 0, 1, 0.6117647, 1,
-0.084805, -0.6684377, -2.956972, 0, 1, 0.6156863, 1,
-0.08468542, -0.4970644, -2.773167, 0, 1, 0.6235294, 1,
-0.08163959, -0.8192923, -1.993923, 0, 1, 0.627451, 1,
-0.0785423, -1.280929, -5.828526, 0, 1, 0.6352941, 1,
-0.0767234, -0.9754915, -2.225073, 0, 1, 0.6392157, 1,
-0.07627524, -0.3109511, -3.425622, 0, 1, 0.6470588, 1,
-0.07317056, -0.08679943, -2.032639, 0, 1, 0.6509804, 1,
-0.07278568, 0.4376316, -1.12927, 0, 1, 0.6588235, 1,
-0.07188576, -1.883319, -2.767866, 0, 1, 0.6627451, 1,
-0.06956407, -0.1364648, -2.018978, 0, 1, 0.6705883, 1,
-0.06949431, -0.7609174, -2.195882, 0, 1, 0.6745098, 1,
-0.06570758, 0.2431943, 1.115562, 0, 1, 0.682353, 1,
-0.06564506, -0.01117551, -1.709706, 0, 1, 0.6862745, 1,
-0.0646879, -0.07830614, -1.398461, 0, 1, 0.6941177, 1,
-0.04519969, 2.336003, -1.129996, 0, 1, 0.7019608, 1,
-0.04491342, -1.185114, -3.965199, 0, 1, 0.7058824, 1,
-0.0413524, 0.2625455, 0.6657304, 0, 1, 0.7137255, 1,
-0.03382251, -0.5823441, -2.580139, 0, 1, 0.7176471, 1,
-0.03351965, 0.266589, 1.887869, 0, 1, 0.7254902, 1,
-0.02839175, 0.4054296, -0.1570768, 0, 1, 0.7294118, 1,
-0.02009258, -0.6635424, -3.427707, 0, 1, 0.7372549, 1,
-0.01992717, 0.7065235, -0.8916066, 0, 1, 0.7411765, 1,
-0.01923304, 0.9652287, 2.173733, 0, 1, 0.7490196, 1,
-0.01646875, -0.9281338, -3.882209, 0, 1, 0.7529412, 1,
-0.01603984, 0.7416919, 0.01373754, 0, 1, 0.7607843, 1,
-0.01129494, 1.025069, 1.413157, 0, 1, 0.7647059, 1,
-0.005041635, -1.559768, -3.320391, 0, 1, 0.772549, 1,
-0.004579415, -0.9578948, -3.851809, 0, 1, 0.7764706, 1,
-0.001727533, 0.6331592, -0.788922, 0, 1, 0.7843137, 1,
-0.001711859, 0.1053255, -0.8887163, 0, 1, 0.7882353, 1,
-0.00161121, -0.6973528, -1.721529, 0, 1, 0.7960784, 1,
0.001198369, 1.243386, 0.9310394, 0, 1, 0.8039216, 1,
0.001579721, 0.756631, -0.8527063, 0, 1, 0.8078431, 1,
0.001897574, -0.0007006144, 1.999879, 0, 1, 0.8156863, 1,
0.00579049, -1.242604, 1.134727, 0, 1, 0.8196079, 1,
0.01226677, -1.1428, 4.366712, 0, 1, 0.827451, 1,
0.01309145, -1.478149, 4.83473, 0, 1, 0.8313726, 1,
0.01617981, -0.1803797, 4.590079, 0, 1, 0.8392157, 1,
0.01778188, -0.5760201, 2.069682, 0, 1, 0.8431373, 1,
0.01814925, -0.289959, 1.625873, 0, 1, 0.8509804, 1,
0.01958391, -0.4824541, 4.547675, 0, 1, 0.854902, 1,
0.03005903, 1.212007, 0.1833284, 0, 1, 0.8627451, 1,
0.03116809, -2.069578, 3.972152, 0, 1, 0.8666667, 1,
0.03185517, -0.4256001, 3.011098, 0, 1, 0.8745098, 1,
0.0351181, -0.6151634, 1.292856, 0, 1, 0.8784314, 1,
0.03682447, -0.3862672, 2.179768, 0, 1, 0.8862745, 1,
0.0373836, 0.7483951, -0.8461068, 0, 1, 0.8901961, 1,
0.03913012, -0.9673777, 4.542105, 0, 1, 0.8980392, 1,
0.03977161, 1.976666, 0.630999, 0, 1, 0.9058824, 1,
0.03995961, -0.06667428, 1.557042, 0, 1, 0.9098039, 1,
0.04512692, 1.532895, -1.74302, 0, 1, 0.9176471, 1,
0.05439148, 0.1616897, 0.1492668, 0, 1, 0.9215686, 1,
0.0562444, -0.3102719, 4.123743, 0, 1, 0.9294118, 1,
0.05773188, -0.04374113, 3.421925, 0, 1, 0.9333333, 1,
0.05902794, 0.3437203, 0.7071754, 0, 1, 0.9411765, 1,
0.05988138, -2.063038, 2.441916, 0, 1, 0.945098, 1,
0.06725474, 0.01187992, 2.138946, 0, 1, 0.9529412, 1,
0.06745911, 0.9169281, -0.632538, 0, 1, 0.9568627, 1,
0.06760284, -0.7430075, 4.05916, 0, 1, 0.9647059, 1,
0.06798112, 0.8050162, 1.784238, 0, 1, 0.9686275, 1,
0.06803311, -1.619089, 3.79841, 0, 1, 0.9764706, 1,
0.07067809, -0.2573729, 3.578567, 0, 1, 0.9803922, 1,
0.07112051, 1.066028, -0.2997448, 0, 1, 0.9882353, 1,
0.07410291, 0.937646, -0.0349407, 0, 1, 0.9921569, 1,
0.07505281, 0.3960297, 0.5130771, 0, 1, 1, 1,
0.08175418, 0.3558058, 0.002802035, 0, 0.9921569, 1, 1,
0.08539777, -0.2387609, 3.819355, 0, 0.9882353, 1, 1,
0.08628632, 1.542575, -0.569242, 0, 0.9803922, 1, 1,
0.08655284, -1.733857, 5.284376, 0, 0.9764706, 1, 1,
0.09827237, -0.09744294, 2.448458, 0, 0.9686275, 1, 1,
0.1043318, 1.38902, -1.641052, 0, 0.9647059, 1, 1,
0.1050422, 1.259838, 0.2337287, 0, 0.9568627, 1, 1,
0.1061926, 0.2396179, 0.4950123, 0, 0.9529412, 1, 1,
0.1104919, -1.508998, 2.598835, 0, 0.945098, 1, 1,
0.1129267, -1.224541, 3.033696, 0, 0.9411765, 1, 1,
0.1139376, -1.0559, 3.714633, 0, 0.9333333, 1, 1,
0.1151539, -0.2073224, 2.760016, 0, 0.9294118, 1, 1,
0.1172638, 0.2980517, 0.4192983, 0, 0.9215686, 1, 1,
0.1180051, 1.573849, -0.6144406, 0, 0.9176471, 1, 1,
0.120333, 1.703109, 1.020285, 0, 0.9098039, 1, 1,
0.1257959, 0.3137929, -0.3173529, 0, 0.9058824, 1, 1,
0.1268884, 0.1083759, 1.546586, 0, 0.8980392, 1, 1,
0.1281193, 0.587903, 0.5018534, 0, 0.8901961, 1, 1,
0.1297762, 0.5783402, -0.2413568, 0, 0.8862745, 1, 1,
0.1318928, 0.1465112, 1.787836, 0, 0.8784314, 1, 1,
0.1377821, -1.286213, 2.676295, 0, 0.8745098, 1, 1,
0.1424028, 0.2081546, 1.973592, 0, 0.8666667, 1, 1,
0.1466348, 0.4747657, 0.8393369, 0, 0.8627451, 1, 1,
0.1469814, 0.7469557, -0.1567878, 0, 0.854902, 1, 1,
0.1523388, 0.6388756, -1.465106, 0, 0.8509804, 1, 1,
0.1544558, -0.03665483, 2.113096, 0, 0.8431373, 1, 1,
0.1593946, 1.064468, 0.195763, 0, 0.8392157, 1, 1,
0.1625397, -0.3242101, 2.94312, 0, 0.8313726, 1, 1,
0.1637513, 0.2709953, 0.7739718, 0, 0.827451, 1, 1,
0.1639456, -0.9862567, 2.617127, 0, 0.8196079, 1, 1,
0.1702495, -0.4983945, 1.022774, 0, 0.8156863, 1, 1,
0.1705878, 1.247442, 2.019434, 0, 0.8078431, 1, 1,
0.1721254, -0.9685171, 2.794698, 0, 0.8039216, 1, 1,
0.173038, -1.58325, 1.890417, 0, 0.7960784, 1, 1,
0.1761726, 0.1000834, 0.6133903, 0, 0.7882353, 1, 1,
0.1804397, 0.8763585, 0.3350273, 0, 0.7843137, 1, 1,
0.1809035, -0.8949047, 5.253615, 0, 0.7764706, 1, 1,
0.1811384, -0.1947112, 3.429435, 0, 0.772549, 1, 1,
0.1842603, 0.731481, 1.038841, 0, 0.7647059, 1, 1,
0.1849298, -0.6697423, 4.034206, 0, 0.7607843, 1, 1,
0.1881595, -1.915316, 3.057712, 0, 0.7529412, 1, 1,
0.1908489, -0.3749806, 4.186758, 0, 0.7490196, 1, 1,
0.1934508, 0.2525602, 0.2004707, 0, 0.7411765, 1, 1,
0.1960047, -1.058765, 2.76679, 0, 0.7372549, 1, 1,
0.1999631, -0.2244387, 1.100026, 0, 0.7294118, 1, 1,
0.2034015, 1.816778, -2.266945, 0, 0.7254902, 1, 1,
0.2066355, -0.1874453, 3.63156, 0, 0.7176471, 1, 1,
0.2072247, -1.427344, 4.768283, 0, 0.7137255, 1, 1,
0.2108666, -0.4982978, 3.732819, 0, 0.7058824, 1, 1,
0.2127427, 1.619575, 1.733232, 0, 0.6980392, 1, 1,
0.2145866, 0.5008942, 1.152695, 0, 0.6941177, 1, 1,
0.22116, 0.3068587, 1.376265, 0, 0.6862745, 1, 1,
0.2222766, -2.107497, 2.206532, 0, 0.682353, 1, 1,
0.2228592, -0.3571411, 2.670604, 0, 0.6745098, 1, 1,
0.2239216, 0.8932518, 1.701045, 0, 0.6705883, 1, 1,
0.2251043, -0.4528172, 2.098276, 0, 0.6627451, 1, 1,
0.2317732, 1.261988, -0.9113383, 0, 0.6588235, 1, 1,
0.2319637, 0.5689157, 0.107162, 0, 0.6509804, 1, 1,
0.2356086, 0.7548526, 0.6136363, 0, 0.6470588, 1, 1,
0.2422951, -0.05153474, 1.884065, 0, 0.6392157, 1, 1,
0.2432342, 1.255143, 0.1491211, 0, 0.6352941, 1, 1,
0.2434393, -1.056593, 2.277363, 0, 0.627451, 1, 1,
0.2450328, -0.6305517, 3.812022, 0, 0.6235294, 1, 1,
0.2473799, 0.2436802, 1.040851, 0, 0.6156863, 1, 1,
0.2499871, -0.03007192, 2.267741, 0, 0.6117647, 1, 1,
0.250433, 0.5842621, 0.8881474, 0, 0.6039216, 1, 1,
0.253687, 2.065953, 0.06038222, 0, 0.5960785, 1, 1,
0.2581832, -1.760311, 3.562492, 0, 0.5921569, 1, 1,
0.259805, -0.3305977, 1.843899, 0, 0.5843138, 1, 1,
0.2621233, 1.94377, -1.136203, 0, 0.5803922, 1, 1,
0.2624301, 0.8585709, -0.5989909, 0, 0.572549, 1, 1,
0.262684, 0.492378, -1.091591, 0, 0.5686275, 1, 1,
0.263107, 1.732766, -1.511492, 0, 0.5607843, 1, 1,
0.263483, 0.02822801, 2.21299, 0, 0.5568628, 1, 1,
0.2650214, -0.500756, 2.865688, 0, 0.5490196, 1, 1,
0.2663793, 0.9513519, 1.595663, 0, 0.5450981, 1, 1,
0.2737206, 0.2323724, -0.02932746, 0, 0.5372549, 1, 1,
0.2744479, 0.7298566, 0.08477887, 0, 0.5333334, 1, 1,
0.2745294, 1.222458, 0.697331, 0, 0.5254902, 1, 1,
0.2757684, -0.2735495, 2.099248, 0, 0.5215687, 1, 1,
0.277909, 0.728303, -1.114016, 0, 0.5137255, 1, 1,
0.2779431, 0.6910025, 0.3520334, 0, 0.509804, 1, 1,
0.2802542, -0.04956554, 1.794073, 0, 0.5019608, 1, 1,
0.2805272, 1.942722, 0.7388721, 0, 0.4941176, 1, 1,
0.284938, -2.153363, 2.336261, 0, 0.4901961, 1, 1,
0.2861256, 0.4082081, 1.050174, 0, 0.4823529, 1, 1,
0.2878501, 0.7450972, 0.6256292, 0, 0.4784314, 1, 1,
0.2911152, -1.462702, 3.845554, 0, 0.4705882, 1, 1,
0.2930889, 2.316413, -0.05769898, 0, 0.4666667, 1, 1,
0.2931405, 0.2830892, 0.638023, 0, 0.4588235, 1, 1,
0.2991992, -1.769565, 2.104757, 0, 0.454902, 1, 1,
0.2992397, 0.0632963, 2.534205, 0, 0.4470588, 1, 1,
0.3004625, 2.521757, -0.2550857, 0, 0.4431373, 1, 1,
0.3025171, -1.505825, 2.616199, 0, 0.4352941, 1, 1,
0.3059402, -0.9325536, 2.574009, 0, 0.4313726, 1, 1,
0.3099625, 1.017725, 1.804992, 0, 0.4235294, 1, 1,
0.3122153, -1.685001, 2.957766, 0, 0.4196078, 1, 1,
0.312348, 0.528954, 1.605455, 0, 0.4117647, 1, 1,
0.3138542, -0.7622595, 2.649725, 0, 0.4078431, 1, 1,
0.3139598, 0.3939177, 2.244697, 0, 0.4, 1, 1,
0.3167198, -0.7286394, 1.749108, 0, 0.3921569, 1, 1,
0.3174185, -1.23409, 2.357927, 0, 0.3882353, 1, 1,
0.319275, -0.5582302, 3.565464, 0, 0.3803922, 1, 1,
0.3195518, 1.533973, 1.056724, 0, 0.3764706, 1, 1,
0.3197325, -0.5243282, 2.288736, 0, 0.3686275, 1, 1,
0.3242162, -0.1436643, 4.957469, 0, 0.3647059, 1, 1,
0.3296278, -0.6807519, 1.972903, 0, 0.3568628, 1, 1,
0.3426742, 0.4827268, 0.4366898, 0, 0.3529412, 1, 1,
0.356572, 2.237962, -0.07395897, 0, 0.345098, 1, 1,
0.3575846, 0.3812067, 1.855207, 0, 0.3411765, 1, 1,
0.3578807, 0.3941186, -0.08068512, 0, 0.3333333, 1, 1,
0.3602862, 2.498887, -0.6030029, 0, 0.3294118, 1, 1,
0.3614341, 0.5354141, -0.675077, 0, 0.3215686, 1, 1,
0.3628813, 2.093425, 0.5825118, 0, 0.3176471, 1, 1,
0.3646417, -0.762833, 1.732935, 0, 0.3098039, 1, 1,
0.365313, 1.117475, 0.7557058, 0, 0.3058824, 1, 1,
0.3713663, 1.161552, -0.5554309, 0, 0.2980392, 1, 1,
0.3721869, 1.216554, 0.463406, 0, 0.2901961, 1, 1,
0.3757667, -0.03530664, 0.7610786, 0, 0.2862745, 1, 1,
0.377118, 0.09256151, 0.8302521, 0, 0.2784314, 1, 1,
0.3779293, 2.204305, 1.61542, 0, 0.2745098, 1, 1,
0.3782725, 0.107137, 2.950273, 0, 0.2666667, 1, 1,
0.3795505, 0.1521631, 1.186883, 0, 0.2627451, 1, 1,
0.3796292, -0.06556981, 2.472178, 0, 0.254902, 1, 1,
0.3807566, -0.2986077, 2.280215, 0, 0.2509804, 1, 1,
0.3944639, -0.8889352, 3.136667, 0, 0.2431373, 1, 1,
0.3972084, 0.3769521, 0.8431951, 0, 0.2392157, 1, 1,
0.3986974, 1.00127, 0.3284707, 0, 0.2313726, 1, 1,
0.4027361, 2.913434, -1.210108, 0, 0.227451, 1, 1,
0.4048864, 0.6067581, 0.1334129, 0, 0.2196078, 1, 1,
0.4064488, 0.4950155, 0.1016239, 0, 0.2156863, 1, 1,
0.415432, 0.6151254, 3.61466, 0, 0.2078431, 1, 1,
0.4155423, -0.05459031, 0.5401244, 0, 0.2039216, 1, 1,
0.4186713, 1.093353, -0.6344303, 0, 0.1960784, 1, 1,
0.4247312, 1.193249, 0.05499507, 0, 0.1882353, 1, 1,
0.4248321, 2.062069, 1.250064, 0, 0.1843137, 1, 1,
0.4257611, 0.2962592, 1.72861, 0, 0.1764706, 1, 1,
0.4261988, -1.727278, 3.003252, 0, 0.172549, 1, 1,
0.4290007, -0.07101358, 1.615285, 0, 0.1647059, 1, 1,
0.4313241, 0.2979935, -0.07333272, 0, 0.1607843, 1, 1,
0.4371907, -0.7368281, 2.530476, 0, 0.1529412, 1, 1,
0.4395782, -1.604379, 3.684371, 0, 0.1490196, 1, 1,
0.4433171, -0.2620118, 3.368134, 0, 0.1411765, 1, 1,
0.4450887, 0.2393289, -0.2411265, 0, 0.1372549, 1, 1,
0.4451408, 0.5515885, 1.149916, 0, 0.1294118, 1, 1,
0.4500289, 1.406095, 1.057612, 0, 0.1254902, 1, 1,
0.4533247, 0.8249893, -0.8366297, 0, 0.1176471, 1, 1,
0.47626, 0.6030837, -0.4126372, 0, 0.1137255, 1, 1,
0.4772759, -0.2419846, 1.581984, 0, 0.1058824, 1, 1,
0.4797893, 0.1849421, 1.100323, 0, 0.09803922, 1, 1,
0.4808405, -0.2228413, 2.124903, 0, 0.09411765, 1, 1,
0.4929108, -0.03762164, 2.276688, 0, 0.08627451, 1, 1,
0.5010439, -0.5179227, 2.395703, 0, 0.08235294, 1, 1,
0.5014688, 1.116716, -0.1889553, 0, 0.07450981, 1, 1,
0.5059634, 3.110329, -0.1063385, 0, 0.07058824, 1, 1,
0.5087844, 0.4269173, 1.070039, 0, 0.0627451, 1, 1,
0.5118742, 1.643507, -0.637582, 0, 0.05882353, 1, 1,
0.5132357, 0.4918647, 2.324226, 0, 0.05098039, 1, 1,
0.5142502, -0.1159974, 1.452472, 0, 0.04705882, 1, 1,
0.5143445, 0.504495, 1.106802, 0, 0.03921569, 1, 1,
0.5151124, -0.2358571, 1.946363, 0, 0.03529412, 1, 1,
0.518028, 0.4984347, 1.162624, 0, 0.02745098, 1, 1,
0.5182018, -1.100156, 2.755192, 0, 0.02352941, 1, 1,
0.5215688, -0.3835429, 1.051711, 0, 0.01568628, 1, 1,
0.5228921, 0.6055009, -0.2311131, 0, 0.01176471, 1, 1,
0.5284073, -0.9849806, 2.877708, 0, 0.003921569, 1, 1,
0.5293593, -0.01422196, 0.4779884, 0.003921569, 0, 1, 1,
0.5298239, 0.5208007, 0.3435914, 0.007843138, 0, 1, 1,
0.53238, -2.250249, 2.664113, 0.01568628, 0, 1, 1,
0.5326284, 0.652983, -0.6623633, 0.01960784, 0, 1, 1,
0.5345318, 0.9748235, 0.8154138, 0.02745098, 0, 1, 1,
0.5356845, -0.5322432, 1.245307, 0.03137255, 0, 1, 1,
0.5372676, -0.8119985, 3.039002, 0.03921569, 0, 1, 1,
0.5381886, -1.808219, 2.223304, 0.04313726, 0, 1, 1,
0.5406508, 0.4035191, 1.748435, 0.05098039, 0, 1, 1,
0.541186, -0.9482962, 4.102256, 0.05490196, 0, 1, 1,
0.5424572, -0.3716291, 3.163019, 0.0627451, 0, 1, 1,
0.5425269, 0.7974718, -0.1569559, 0.06666667, 0, 1, 1,
0.5438028, -0.07990199, 0.8165075, 0.07450981, 0, 1, 1,
0.5456591, 2.113977, 0.9497303, 0.07843138, 0, 1, 1,
0.5565938, -1.12697, 2.655075, 0.08627451, 0, 1, 1,
0.5605309, -0.6678287, 3.900955, 0.09019608, 0, 1, 1,
0.5636223, -0.3100106, 2.009818, 0.09803922, 0, 1, 1,
0.5636505, 1.282015, 0.09168351, 0.1058824, 0, 1, 1,
0.5638372, 1.306563, 0.3591282, 0.1098039, 0, 1, 1,
0.5647229, -0.8496608, 2.210683, 0.1176471, 0, 1, 1,
0.56699, 1.043231, -0.1872052, 0.1215686, 0, 1, 1,
0.5688658, 1.344513, 0.683943, 0.1294118, 0, 1, 1,
0.5714868, 1.40448, 1.534234, 0.1333333, 0, 1, 1,
0.5728236, 1.660636, 0.5105481, 0.1411765, 0, 1, 1,
0.5734678, -0.5949086, 1.669037, 0.145098, 0, 1, 1,
0.5818147, -0.2206536, 2.337602, 0.1529412, 0, 1, 1,
0.5864478, -1.272217, 2.689435, 0.1568628, 0, 1, 1,
0.5879396, -1.363469, 3.109121, 0.1647059, 0, 1, 1,
0.592933, -1.018906, 3.903579, 0.1686275, 0, 1, 1,
0.6000354, -0.5964457, 2.495761, 0.1764706, 0, 1, 1,
0.6047185, 0.7771289, -0.2473331, 0.1803922, 0, 1, 1,
0.6059542, -0.7341033, 3.649302, 0.1882353, 0, 1, 1,
0.6087963, 0.9087221, 2.551708, 0.1921569, 0, 1, 1,
0.6132537, -0.4256528, 1.103044, 0.2, 0, 1, 1,
0.6136741, -0.2864013, 3.016152, 0.2078431, 0, 1, 1,
0.6137328, 2.917911, 0.9695219, 0.2117647, 0, 1, 1,
0.6159751, 1.212995, -1.261287, 0.2196078, 0, 1, 1,
0.6172466, -0.5690714, 3.050217, 0.2235294, 0, 1, 1,
0.618459, 1.993723, 0.9887309, 0.2313726, 0, 1, 1,
0.6203369, 1.964476, -0.2035158, 0.2352941, 0, 1, 1,
0.6256198, -0.3070526, 2.738793, 0.2431373, 0, 1, 1,
0.6291602, -0.6753494, 2.311074, 0.2470588, 0, 1, 1,
0.6298488, 1.394091, -0.2782803, 0.254902, 0, 1, 1,
0.6353919, 0.3322035, 1.479294, 0.2588235, 0, 1, 1,
0.6366525, -1.111917, 4.072493, 0.2666667, 0, 1, 1,
0.6375777, 0.3068004, 1.276249, 0.2705882, 0, 1, 1,
0.6438212, -1.715314, 3.999372, 0.2784314, 0, 1, 1,
0.6515578, 1.551939, 0.03037394, 0.282353, 0, 1, 1,
0.6568424, -1.894302, 3.353213, 0.2901961, 0, 1, 1,
0.6642419, -0.6226779, 3.028851, 0.2941177, 0, 1, 1,
0.6680942, -1.155647, 1.646044, 0.3019608, 0, 1, 1,
0.6683298, -0.04793124, 1.312927, 0.3098039, 0, 1, 1,
0.6702446, 0.9121958, -0.1515899, 0.3137255, 0, 1, 1,
0.6729733, -0.1341838, 2.491212, 0.3215686, 0, 1, 1,
0.6747612, -0.5329351, 2.329694, 0.3254902, 0, 1, 1,
0.677901, -1.058781, -0.1300132, 0.3333333, 0, 1, 1,
0.6830866, -0.09268482, 1.141536, 0.3372549, 0, 1, 1,
0.6840979, -0.4611615, 3.092593, 0.345098, 0, 1, 1,
0.6922241, -0.5679187, 2.026816, 0.3490196, 0, 1, 1,
0.6946255, 0.2695197, 1.441949, 0.3568628, 0, 1, 1,
0.6995689, -1.262781, 2.355324, 0.3607843, 0, 1, 1,
0.7032439, 0.4540246, 2.046036, 0.3686275, 0, 1, 1,
0.7073303, -0.03918572, 1.320882, 0.372549, 0, 1, 1,
0.7087986, 0.370871, 0.9249204, 0.3803922, 0, 1, 1,
0.716253, 0.6406379, 1.016255, 0.3843137, 0, 1, 1,
0.7192762, -0.4485568, 2.363601, 0.3921569, 0, 1, 1,
0.7243541, 0.6920036, -0.02594564, 0.3960784, 0, 1, 1,
0.7261581, -0.2443074, 2.513931, 0.4039216, 0, 1, 1,
0.7272412, 0.7513281, 2.526598, 0.4117647, 0, 1, 1,
0.7292348, -0.8957624, 1.807519, 0.4156863, 0, 1, 1,
0.730834, 0.4303457, 1.745707, 0.4235294, 0, 1, 1,
0.741107, 1.084989, 0.09398636, 0.427451, 0, 1, 1,
0.7453475, -0.2119407, 0.1228697, 0.4352941, 0, 1, 1,
0.7460366, -1.092497, 2.992553, 0.4392157, 0, 1, 1,
0.7462946, -2.809328, 2.446711, 0.4470588, 0, 1, 1,
0.751074, 0.2057365, 2.921028, 0.4509804, 0, 1, 1,
0.7537439, -0.2285896, 2.086983, 0.4588235, 0, 1, 1,
0.7545067, -0.1513356, 3.378224, 0.4627451, 0, 1, 1,
0.7572486, 0.5886786, 2.358621, 0.4705882, 0, 1, 1,
0.7600079, -1.496862, 3.101643, 0.4745098, 0, 1, 1,
0.7706819, 0.8875228, 0.7626398, 0.4823529, 0, 1, 1,
0.7711806, -1.462554, 4.548448, 0.4862745, 0, 1, 1,
0.7736286, -1.377211, 1.879325, 0.4941176, 0, 1, 1,
0.7737561, -2.247319, 3.718619, 0.5019608, 0, 1, 1,
0.7801306, -0.3560551, 2.439543, 0.5058824, 0, 1, 1,
0.7828723, -0.9552441, 3.079316, 0.5137255, 0, 1, 1,
0.7885674, -0.38016, 3.408986, 0.5176471, 0, 1, 1,
0.7893852, -0.4573465, 2.832073, 0.5254902, 0, 1, 1,
0.8060422, 0.4355793, 0.4994068, 0.5294118, 0, 1, 1,
0.8101627, -0.5346977, 2.01743, 0.5372549, 0, 1, 1,
0.814921, -0.2429955, -0.1978909, 0.5411765, 0, 1, 1,
0.8152047, -0.1572843, 3.381605, 0.5490196, 0, 1, 1,
0.8202904, -0.1020797, 0.517036, 0.5529412, 0, 1, 1,
0.8208483, 0.3771275, 3.065738, 0.5607843, 0, 1, 1,
0.8246094, -0.1678743, 1.61979, 0.5647059, 0, 1, 1,
0.8270848, 0.03508468, 2.425353, 0.572549, 0, 1, 1,
0.8284963, 0.4482145, -0.7612273, 0.5764706, 0, 1, 1,
0.8291231, -0.329165, 2.275362, 0.5843138, 0, 1, 1,
0.830478, -0.9963212, 1.4005, 0.5882353, 0, 1, 1,
0.8326675, 0.5771104, 0.7944096, 0.5960785, 0, 1, 1,
0.8348009, 0.2489775, 1.590021, 0.6039216, 0, 1, 1,
0.838164, 0.3930195, 0.8867686, 0.6078432, 0, 1, 1,
0.8426362, -0.2553452, 0.5529993, 0.6156863, 0, 1, 1,
0.8434237, 1.15106, 1.576255, 0.6196079, 0, 1, 1,
0.8464908, 0.02705843, 1.111976, 0.627451, 0, 1, 1,
0.8473374, 1.035766, -0.1434105, 0.6313726, 0, 1, 1,
0.8543252, 0.2655061, 1.110244, 0.6392157, 0, 1, 1,
0.8589984, -0.6322688, 1.7731, 0.6431373, 0, 1, 1,
0.8607412, 1.356977, -1.489534, 0.6509804, 0, 1, 1,
0.8632104, -0.3695016, 3.319451, 0.654902, 0, 1, 1,
0.864134, 0.2470947, 1.51887, 0.6627451, 0, 1, 1,
0.8645402, 0.9050841, 0.5593624, 0.6666667, 0, 1, 1,
0.8686767, 0.7674026, 1.616591, 0.6745098, 0, 1, 1,
0.870713, -0.3377722, 1.60017, 0.6784314, 0, 1, 1,
0.87629, -1.331418, 3.031759, 0.6862745, 0, 1, 1,
0.8765121, -0.02938072, 2.679603, 0.6901961, 0, 1, 1,
0.8795796, 3.335339, -1.325633, 0.6980392, 0, 1, 1,
0.883249, -0.1991437, 2.696934, 0.7058824, 0, 1, 1,
0.8920778, 0.02137112, 1.961226, 0.7098039, 0, 1, 1,
0.8923759, -1.139529, 1.747195, 0.7176471, 0, 1, 1,
0.8955576, 1.156619, 1.469399, 0.7215686, 0, 1, 1,
0.9049358, -0.557679, 2.013524, 0.7294118, 0, 1, 1,
0.906224, -1.53468, 2.847931, 0.7333333, 0, 1, 1,
0.9063532, 1.195253, 0.1439482, 0.7411765, 0, 1, 1,
0.9071983, 0.4442845, -1.296553, 0.7450981, 0, 1, 1,
0.9084245, -1.345669, 2.028122, 0.7529412, 0, 1, 1,
0.9100927, 0.5745172, -0.565666, 0.7568628, 0, 1, 1,
0.9152529, -1.38617, 2.755919, 0.7647059, 0, 1, 1,
0.9263192, 0.9758654, 0.2498529, 0.7686275, 0, 1, 1,
0.9297854, -0.1756157, 0.9394301, 0.7764706, 0, 1, 1,
0.9329187, -0.3268186, 2.255043, 0.7803922, 0, 1, 1,
0.9339215, -0.494231, 1.787046, 0.7882353, 0, 1, 1,
0.9429605, -0.2293915, 3.124959, 0.7921569, 0, 1, 1,
0.9448272, 1.090373, -1.23801, 0.8, 0, 1, 1,
0.9461315, 0.8846942, 1.090504, 0.8078431, 0, 1, 1,
0.9477347, 0.1515273, 1.645766, 0.8117647, 0, 1, 1,
0.9645718, -0.2461433, 3.510467, 0.8196079, 0, 1, 1,
0.9692787, -0.08014321, 1.201122, 0.8235294, 0, 1, 1,
0.9694297, 0.8968949, 0.6978707, 0.8313726, 0, 1, 1,
0.9701943, 1.371779, 0.2102178, 0.8352941, 0, 1, 1,
0.9727074, 0.6411036, 0.5013548, 0.8431373, 0, 1, 1,
0.974031, 0.02742933, 1.381944, 0.8470588, 0, 1, 1,
0.974396, 0.3027322, 2.225435, 0.854902, 0, 1, 1,
0.9750061, -0.07836197, 1.746759, 0.8588235, 0, 1, 1,
0.975117, 0.4151683, 0.3786283, 0.8666667, 0, 1, 1,
0.9769338, -0.7477965, 1.395756, 0.8705882, 0, 1, 1,
0.9889991, 0.1912181, 1.413276, 0.8784314, 0, 1, 1,
0.994049, 1.101813, -0.106411, 0.8823529, 0, 1, 1,
0.9951681, -0.1203307, 1.551549, 0.8901961, 0, 1, 1,
0.9973046, -0.3769426, 2.39016, 0.8941177, 0, 1, 1,
1.000511, 0.4828193, 2.117526, 0.9019608, 0, 1, 1,
1.002802, 0.9399123, 2.277761, 0.9098039, 0, 1, 1,
1.007804, 0.6131341, 0.5880272, 0.9137255, 0, 1, 1,
1.008738, 0.2451991, 2.74994, 0.9215686, 0, 1, 1,
1.00919, -0.7308368, 2.670375, 0.9254902, 0, 1, 1,
1.010664, 1.209156, 1.906804, 0.9333333, 0, 1, 1,
1.011168, -1.032571, 3.320912, 0.9372549, 0, 1, 1,
1.018137, -1.397145, 1.881995, 0.945098, 0, 1, 1,
1.030985, -0.7959816, 1.750726, 0.9490196, 0, 1, 1,
1.033394, 0.9227514, -0.4900769, 0.9568627, 0, 1, 1,
1.034223, -1.328108, 4.009329, 0.9607843, 0, 1, 1,
1.038743, -2.027668, 1.805844, 0.9686275, 0, 1, 1,
1.039585, -0.7767599, 1.159235, 0.972549, 0, 1, 1,
1.040529, 0.3045565, 3.053101, 0.9803922, 0, 1, 1,
1.04284, -2.456543, 2.48542, 0.9843137, 0, 1, 1,
1.044029, 0.2356231, 2.912074, 0.9921569, 0, 1, 1,
1.04591, -0.5018891, 2.880418, 0.9960784, 0, 1, 1,
1.047612, 0.5520777, 0.9234865, 1, 0, 0.9960784, 1,
1.061644, -0.1577748, -0.009711185, 1, 0, 0.9882353, 1,
1.063385, -1.43541, 4.061609, 1, 0, 0.9843137, 1,
1.066739, -0.9206131, 0.3380108, 1, 0, 0.9764706, 1,
1.077577, -0.01202122, 1.350674, 1, 0, 0.972549, 1,
1.088944, 0.5592777, 1.276006, 1, 0, 0.9647059, 1,
1.098541, -0.6705115, 1.815188, 1, 0, 0.9607843, 1,
1.103188, 1.46786, -0.2546747, 1, 0, 0.9529412, 1,
1.11201, -0.9848889, 1.376565, 1, 0, 0.9490196, 1,
1.113447, 0.7298185, 1.736696, 1, 0, 0.9411765, 1,
1.115517, 0.7980497, 1.137512, 1, 0, 0.9372549, 1,
1.119981, -1.071616, 3.948645, 1, 0, 0.9294118, 1,
1.120179, -0.3174323, 1.57335, 1, 0, 0.9254902, 1,
1.122735, 0.5123814, 1.120603, 1, 0, 0.9176471, 1,
1.124609, 1.946536, 0.4582734, 1, 0, 0.9137255, 1,
1.129711, 0.7447304, 1.358413, 1, 0, 0.9058824, 1,
1.13509, -0.05087182, 1.949884, 1, 0, 0.9019608, 1,
1.136737, 0.03887597, 0.2227515, 1, 0, 0.8941177, 1,
1.144606, -0.3498808, 1.322991, 1, 0, 0.8862745, 1,
1.147028, 1.953671, 0.05737169, 1, 0, 0.8823529, 1,
1.152462, 1.963318, -2.153706, 1, 0, 0.8745098, 1,
1.154803, -0.8291454, 1.284827, 1, 0, 0.8705882, 1,
1.157239, -0.1991968, -0.5329343, 1, 0, 0.8627451, 1,
1.159456, 0.5551912, 0.5002138, 1, 0, 0.8588235, 1,
1.1613, 1.551382, 1.319854, 1, 0, 0.8509804, 1,
1.169684, 1.03401, 2.71596, 1, 0, 0.8470588, 1,
1.172902, 0.7785539, 0.3153962, 1, 0, 0.8392157, 1,
1.176983, 1.867094, 0.9707859, 1, 0, 0.8352941, 1,
1.17954, 0.6407676, 1.007605, 1, 0, 0.827451, 1,
1.179754, 0.5348713, 0.8296835, 1, 0, 0.8235294, 1,
1.18108, -0.7823594, 1.818174, 1, 0, 0.8156863, 1,
1.186192, -2.099307, 3.101372, 1, 0, 0.8117647, 1,
1.187293, 0.2346797, 3.389774, 1, 0, 0.8039216, 1,
1.19807, 0.9026987, 0.6274101, 1, 0, 0.7960784, 1,
1.199883, 0.2577252, -0.3436657, 1, 0, 0.7921569, 1,
1.203997, -0.7819601, 2.916201, 1, 0, 0.7843137, 1,
1.212337, -2.580284, 4.224538, 1, 0, 0.7803922, 1,
1.221851, 1.360404, 0.4804033, 1, 0, 0.772549, 1,
1.232067, 1.277605, 0.7900345, 1, 0, 0.7686275, 1,
1.234845, 1.626511, -2.04025, 1, 0, 0.7607843, 1,
1.237841, 0.4853821, 1.087767, 1, 0, 0.7568628, 1,
1.240281, -0.490175, 1.106414, 1, 0, 0.7490196, 1,
1.241758, 0.3509265, 3.347844, 1, 0, 0.7450981, 1,
1.244783, 0.5223312, 1.496387, 1, 0, 0.7372549, 1,
1.252441, 1.254, -0.43076, 1, 0, 0.7333333, 1,
1.254449, -0.2709757, 0.9762282, 1, 0, 0.7254902, 1,
1.254954, -1.845279, 3.122393, 1, 0, 0.7215686, 1,
1.255196, 0.2687939, 1.39342, 1, 0, 0.7137255, 1,
1.258524, 0.02722656, 1.124738, 1, 0, 0.7098039, 1,
1.258716, 1.549662, 0.9560908, 1, 0, 0.7019608, 1,
1.270017, 0.05128931, 3.115559, 1, 0, 0.6941177, 1,
1.27923, -2.048892, 0.6675971, 1, 0, 0.6901961, 1,
1.285712, 0.5517037, 1.34379, 1, 0, 0.682353, 1,
1.300587, 0.2210377, 0.228333, 1, 0, 0.6784314, 1,
1.30224, -2.21352, 2.809739, 1, 0, 0.6705883, 1,
1.308182, -0.6907682, 1.90272, 1, 0, 0.6666667, 1,
1.315191, -2.464735, 3.988757, 1, 0, 0.6588235, 1,
1.319628, 0.657626, -0.05525956, 1, 0, 0.654902, 1,
1.323822, 2.262022, 1.013617, 1, 0, 0.6470588, 1,
1.329784, -0.5594988, 2.092417, 1, 0, 0.6431373, 1,
1.33062, -0.8604009, 2.652086, 1, 0, 0.6352941, 1,
1.33094, -0.4171603, 1.955258, 1, 0, 0.6313726, 1,
1.338667, -1.947826, 2.741203, 1, 0, 0.6235294, 1,
1.340439, -0.5705068, 1.544666, 1, 0, 0.6196079, 1,
1.343175, -0.4731227, 1.512638, 1, 0, 0.6117647, 1,
1.352315, 1.234507, -0.3386481, 1, 0, 0.6078432, 1,
1.35246, 0.2429685, 1.201192, 1, 0, 0.6, 1,
1.352688, -0.5961757, -0.6694863, 1, 0, 0.5921569, 1,
1.353937, 2.060101, 0.4358526, 1, 0, 0.5882353, 1,
1.354625, -0.03066277, 3.714549, 1, 0, 0.5803922, 1,
1.355555, -0.5712962, 1.439022, 1, 0, 0.5764706, 1,
1.361424, -1.490458, 1.960037, 1, 0, 0.5686275, 1,
1.361895, 0.4293765, 1.018844, 1, 0, 0.5647059, 1,
1.363524, -0.1120304, 2.532808, 1, 0, 0.5568628, 1,
1.365707, 0.5081265, -0.4472266, 1, 0, 0.5529412, 1,
1.369328, 0.7553654, 1.356436, 1, 0, 0.5450981, 1,
1.374077, 0.4179354, -0.7455845, 1, 0, 0.5411765, 1,
1.379288, 0.7771493, 3.224099, 1, 0, 0.5333334, 1,
1.393101, 0.1272447, 2.002002, 1, 0, 0.5294118, 1,
1.402317, -0.2777871, 1.605902, 1, 0, 0.5215687, 1,
1.404135, 0.3361906, 0.3524622, 1, 0, 0.5176471, 1,
1.407332, -1.392765, 0.9831899, 1, 0, 0.509804, 1,
1.42019, 0.2365163, 0.9765854, 1, 0, 0.5058824, 1,
1.420238, 0.347651, 1.759112, 1, 0, 0.4980392, 1,
1.422429, 0.2423459, 0.8863919, 1, 0, 0.4901961, 1,
1.422531, -0.4500912, 2.717385, 1, 0, 0.4862745, 1,
1.425482, -0.9458444, 1.78311, 1, 0, 0.4784314, 1,
1.427864, -0.5683568, 1.071419, 1, 0, 0.4745098, 1,
1.429778, -0.5143592, 1.293486, 1, 0, 0.4666667, 1,
1.43327, -0.2825725, 1.056508, 1, 0, 0.4627451, 1,
1.44034, -1.160814, 4.731532, 1, 0, 0.454902, 1,
1.443222, 0.1173639, 3.33442, 1, 0, 0.4509804, 1,
1.468191, -0.4481933, 0.420481, 1, 0, 0.4431373, 1,
1.470648, 1.015898, 0.5020642, 1, 0, 0.4392157, 1,
1.472261, -0.3723204, 1.325641, 1, 0, 0.4313726, 1,
1.472668, -0.6108328, -0.3685302, 1, 0, 0.427451, 1,
1.473201, 0.9832823, -0.5354543, 1, 0, 0.4196078, 1,
1.480698, 0.8296565, 0.03772587, 1, 0, 0.4156863, 1,
1.487612, -0.7860153, 1.435741, 1, 0, 0.4078431, 1,
1.4878, -1.028472, 1.52519, 1, 0, 0.4039216, 1,
1.489566, -0.06895098, 2.151255, 1, 0, 0.3960784, 1,
1.494401, -0.2943544, 1.751423, 1, 0, 0.3882353, 1,
1.496976, 0.8734142, -0.4862278, 1, 0, 0.3843137, 1,
1.513093, -1.285881, 2.329085, 1, 0, 0.3764706, 1,
1.513377, 0.4176743, 0.5528961, 1, 0, 0.372549, 1,
1.514411, -0.07925525, 2.167934, 1, 0, 0.3647059, 1,
1.529318, -0.5421466, 0.9135776, 1, 0, 0.3607843, 1,
1.53353, -0.6082015, 3.558491, 1, 0, 0.3529412, 1,
1.536112, 1.502397, 1.648133, 1, 0, 0.3490196, 1,
1.540945, -1.058004, 1.426771, 1, 0, 0.3411765, 1,
1.544341, -1.82531, 1.38138, 1, 0, 0.3372549, 1,
1.558552, -0.08351916, 2.235134, 1, 0, 0.3294118, 1,
1.566124, 1.710711, -0.05343178, 1, 0, 0.3254902, 1,
1.575004, -0.5815179, 1.194857, 1, 0, 0.3176471, 1,
1.577221, -0.6495554, 3.512092, 1, 0, 0.3137255, 1,
1.626386, 0.1430934, 0.8551272, 1, 0, 0.3058824, 1,
1.635591, -1.016631, 1.483737, 1, 0, 0.2980392, 1,
1.635865, 0.5608678, 1.812956, 1, 0, 0.2941177, 1,
1.657707, -0.1054114, 1.064652, 1, 0, 0.2862745, 1,
1.659719, 0.6223997, -0.1095277, 1, 0, 0.282353, 1,
1.668059, 1.763261, 0.2312876, 1, 0, 0.2745098, 1,
1.669167, 0.07004881, 1.688405, 1, 0, 0.2705882, 1,
1.706846, 1.207278, 0.7922357, 1, 0, 0.2627451, 1,
1.711081, -0.4946025, 0.66664, 1, 0, 0.2588235, 1,
1.711604, 0.8261927, 0.3879614, 1, 0, 0.2509804, 1,
1.753683, -0.6019613, 3.570746, 1, 0, 0.2470588, 1,
1.75653, 1.394755, 2.072423, 1, 0, 0.2392157, 1,
1.758935, 0.6462308, 0.1475873, 1, 0, 0.2352941, 1,
1.80408, -0.2454908, 1.429871, 1, 0, 0.227451, 1,
1.81438, -2.748461, 1.415301, 1, 0, 0.2235294, 1,
1.831722, 0.2701841, 2.033381, 1, 0, 0.2156863, 1,
1.83706, 0.7154883, 0.8690352, 1, 0, 0.2117647, 1,
1.838661, -1.080344, 2.251761, 1, 0, 0.2039216, 1,
1.860117, 0.5782953, 0.3677417, 1, 0, 0.1960784, 1,
1.879328, -0.5507317, 2.374875, 1, 0, 0.1921569, 1,
1.884643, 0.3739368, 0.5125023, 1, 0, 0.1843137, 1,
1.891659, -0.9742573, 1.770609, 1, 0, 0.1803922, 1,
1.897871, 0.6018636, 1.896773, 1, 0, 0.172549, 1,
1.913186, -0.2788475, 1.553889, 1, 0, 0.1686275, 1,
1.94589, 0.7561207, 0.3740518, 1, 0, 0.1607843, 1,
1.95303, 1.943172, 0.257274, 1, 0, 0.1568628, 1,
1.969127, 0.4936703, 1.998641, 1, 0, 0.1490196, 1,
1.971588, 1.372996, -0.4375128, 1, 0, 0.145098, 1,
1.995596, -0.7514, 2.739615, 1, 0, 0.1372549, 1,
1.996658, -0.2410461, 0.7112418, 1, 0, 0.1333333, 1,
1.997257, -1.530974, 2.55555, 1, 0, 0.1254902, 1,
2.02211, 1.893289, 0.1546066, 1, 0, 0.1215686, 1,
2.029592, 1.087771, 0.07717986, 1, 0, 0.1137255, 1,
2.030167, -0.2311841, -0.5819569, 1, 0, 0.1098039, 1,
2.059185, -0.4812292, 0.6505433, 1, 0, 0.1019608, 1,
2.114094, 0.2849765, 1.621441, 1, 0, 0.09411765, 1,
2.163395, -1.788977, 1.581362, 1, 0, 0.09019608, 1,
2.188515, -0.7638465, 2.969902, 1, 0, 0.08235294, 1,
2.224161, -0.5089258, 1.657323, 1, 0, 0.07843138, 1,
2.228685, -0.644317, 1.80488, 1, 0, 0.07058824, 1,
2.243782, -0.2802873, 2.916617, 1, 0, 0.06666667, 1,
2.251396, 1.123372, -0.2503687, 1, 0, 0.05882353, 1,
2.29834, -2.117253, 1.699525, 1, 0, 0.05490196, 1,
2.315467, 1.037668, 1.685404, 1, 0, 0.04705882, 1,
2.339811, -0.0206651, 3.065394, 1, 0, 0.04313726, 1,
2.430323, 0.6362641, 2.479072, 1, 0, 0.03529412, 1,
2.502724, 0.001712688, 1.407723, 1, 0, 0.03137255, 1,
2.508426, 0.7037592, 1.23881, 1, 0, 0.02352941, 1,
2.523131, -1.007875, 1.7494, 1, 0, 0.01960784, 1,
2.79293, 0.01606073, 3.133693, 1, 0, 0.01176471, 1,
3.116023, -1.2296, 1.087233, 1, 0, 0.007843138, 1
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
0.06860936, -4.153229, -7.712163, 0, -0.5, 0.5, 0.5,
0.06860936, -4.153229, -7.712163, 1, -0.5, 0.5, 0.5,
0.06860936, -4.153229, -7.712163, 1, 1.5, 0.5, 0.5,
0.06860936, -4.153229, -7.712163, 0, 1.5, 0.5, 0.5
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
-4.011878, 0.1337279, -7.712163, 0, -0.5, 0.5, 0.5,
-4.011878, 0.1337279, -7.712163, 1, -0.5, 0.5, 0.5,
-4.011878, 0.1337279, -7.712163, 1, 1.5, 0.5, 0.5,
-4.011878, 0.1337279, -7.712163, 0, 1.5, 0.5, 0.5
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
-4.011878, -4.153229, -0.2720752, 0, -0.5, 0.5, 0.5,
-4.011878, -4.153229, -0.2720752, 1, -0.5, 0.5, 0.5,
-4.011878, -4.153229, -0.2720752, 1, 1.5, 0.5, 0.5,
-4.011878, -4.153229, -0.2720752, 0, 1.5, 0.5, 0.5
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
-2, -3.163931, -5.99522,
3, -3.163931, -5.99522,
-2, -3.163931, -5.99522,
-2, -3.328814, -6.281377,
-1, -3.163931, -5.99522,
-1, -3.328814, -6.281377,
0, -3.163931, -5.99522,
0, -3.328814, -6.281377,
1, -3.163931, -5.99522,
1, -3.328814, -6.281377,
2, -3.163931, -5.99522,
2, -3.328814, -6.281377,
3, -3.163931, -5.99522,
3, -3.328814, -6.281377
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
-2, -3.65858, -6.853692, 0, -0.5, 0.5, 0.5,
-2, -3.65858, -6.853692, 1, -0.5, 0.5, 0.5,
-2, -3.65858, -6.853692, 1, 1.5, 0.5, 0.5,
-2, -3.65858, -6.853692, 0, 1.5, 0.5, 0.5,
-1, -3.65858, -6.853692, 0, -0.5, 0.5, 0.5,
-1, -3.65858, -6.853692, 1, -0.5, 0.5, 0.5,
-1, -3.65858, -6.853692, 1, 1.5, 0.5, 0.5,
-1, -3.65858, -6.853692, 0, 1.5, 0.5, 0.5,
0, -3.65858, -6.853692, 0, -0.5, 0.5, 0.5,
0, -3.65858, -6.853692, 1, -0.5, 0.5, 0.5,
0, -3.65858, -6.853692, 1, 1.5, 0.5, 0.5,
0, -3.65858, -6.853692, 0, 1.5, 0.5, 0.5,
1, -3.65858, -6.853692, 0, -0.5, 0.5, 0.5,
1, -3.65858, -6.853692, 1, -0.5, 0.5, 0.5,
1, -3.65858, -6.853692, 1, 1.5, 0.5, 0.5,
1, -3.65858, -6.853692, 0, 1.5, 0.5, 0.5,
2, -3.65858, -6.853692, 0, -0.5, 0.5, 0.5,
2, -3.65858, -6.853692, 1, -0.5, 0.5, 0.5,
2, -3.65858, -6.853692, 1, 1.5, 0.5, 0.5,
2, -3.65858, -6.853692, 0, 1.5, 0.5, 0.5,
3, -3.65858, -6.853692, 0, -0.5, 0.5, 0.5,
3, -3.65858, -6.853692, 1, -0.5, 0.5, 0.5,
3, -3.65858, -6.853692, 1, 1.5, 0.5, 0.5,
3, -3.65858, -6.853692, 0, 1.5, 0.5, 0.5
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
-3.070227, -3, -5.99522,
-3.070227, 3, -5.99522,
-3.070227, -3, -5.99522,
-3.227169, -3, -6.281377,
-3.070227, -2, -5.99522,
-3.227169, -2, -6.281377,
-3.070227, -1, -5.99522,
-3.227169, -1, -6.281377,
-3.070227, 0, -5.99522,
-3.227169, 0, -6.281377,
-3.070227, 1, -5.99522,
-3.227169, 1, -6.281377,
-3.070227, 2, -5.99522,
-3.227169, 2, -6.281377,
-3.070227, 3, -5.99522,
-3.227169, 3, -6.281377
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
-3.541053, -3, -6.853692, 0, -0.5, 0.5, 0.5,
-3.541053, -3, -6.853692, 1, -0.5, 0.5, 0.5,
-3.541053, -3, -6.853692, 1, 1.5, 0.5, 0.5,
-3.541053, -3, -6.853692, 0, 1.5, 0.5, 0.5,
-3.541053, -2, -6.853692, 0, -0.5, 0.5, 0.5,
-3.541053, -2, -6.853692, 1, -0.5, 0.5, 0.5,
-3.541053, -2, -6.853692, 1, 1.5, 0.5, 0.5,
-3.541053, -2, -6.853692, 0, 1.5, 0.5, 0.5,
-3.541053, -1, -6.853692, 0, -0.5, 0.5, 0.5,
-3.541053, -1, -6.853692, 1, -0.5, 0.5, 0.5,
-3.541053, -1, -6.853692, 1, 1.5, 0.5, 0.5,
-3.541053, -1, -6.853692, 0, 1.5, 0.5, 0.5,
-3.541053, 0, -6.853692, 0, -0.5, 0.5, 0.5,
-3.541053, 0, -6.853692, 1, -0.5, 0.5, 0.5,
-3.541053, 0, -6.853692, 1, 1.5, 0.5, 0.5,
-3.541053, 0, -6.853692, 0, 1.5, 0.5, 0.5,
-3.541053, 1, -6.853692, 0, -0.5, 0.5, 0.5,
-3.541053, 1, -6.853692, 1, -0.5, 0.5, 0.5,
-3.541053, 1, -6.853692, 1, 1.5, 0.5, 0.5,
-3.541053, 1, -6.853692, 0, 1.5, 0.5, 0.5,
-3.541053, 2, -6.853692, 0, -0.5, 0.5, 0.5,
-3.541053, 2, -6.853692, 1, -0.5, 0.5, 0.5,
-3.541053, 2, -6.853692, 1, 1.5, 0.5, 0.5,
-3.541053, 2, -6.853692, 0, 1.5, 0.5, 0.5,
-3.541053, 3, -6.853692, 0, -0.5, 0.5, 0.5,
-3.541053, 3, -6.853692, 1, -0.5, 0.5, 0.5,
-3.541053, 3, -6.853692, 1, 1.5, 0.5, 0.5,
-3.541053, 3, -6.853692, 0, 1.5, 0.5, 0.5
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
-3.070227, -3.163931, -4,
-3.070227, -3.163931, 4,
-3.070227, -3.163931, -4,
-3.227169, -3.328814, -4,
-3.070227, -3.163931, -2,
-3.227169, -3.328814, -2,
-3.070227, -3.163931, 0,
-3.227169, -3.328814, 0,
-3.070227, -3.163931, 2,
-3.227169, -3.328814, 2,
-3.070227, -3.163931, 4,
-3.227169, -3.328814, 4
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
-3.541053, -3.65858, -4, 0, -0.5, 0.5, 0.5,
-3.541053, -3.65858, -4, 1, -0.5, 0.5, 0.5,
-3.541053, -3.65858, -4, 1, 1.5, 0.5, 0.5,
-3.541053, -3.65858, -4, 0, 1.5, 0.5, 0.5,
-3.541053, -3.65858, -2, 0, -0.5, 0.5, 0.5,
-3.541053, -3.65858, -2, 1, -0.5, 0.5, 0.5,
-3.541053, -3.65858, -2, 1, 1.5, 0.5, 0.5,
-3.541053, -3.65858, -2, 0, 1.5, 0.5, 0.5,
-3.541053, -3.65858, 0, 0, -0.5, 0.5, 0.5,
-3.541053, -3.65858, 0, 1, -0.5, 0.5, 0.5,
-3.541053, -3.65858, 0, 1, 1.5, 0.5, 0.5,
-3.541053, -3.65858, 0, 0, 1.5, 0.5, 0.5,
-3.541053, -3.65858, 2, 0, -0.5, 0.5, 0.5,
-3.541053, -3.65858, 2, 1, -0.5, 0.5, 0.5,
-3.541053, -3.65858, 2, 1, 1.5, 0.5, 0.5,
-3.541053, -3.65858, 2, 0, 1.5, 0.5, 0.5,
-3.541053, -3.65858, 4, 0, -0.5, 0.5, 0.5,
-3.541053, -3.65858, 4, 1, -0.5, 0.5, 0.5,
-3.541053, -3.65858, 4, 1, 1.5, 0.5, 0.5,
-3.541053, -3.65858, 4, 0, 1.5, 0.5, 0.5
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
-3.070227, -3.163931, -5.99522,
-3.070227, 3.431387, -5.99522,
-3.070227, -3.163931, 5.45107,
-3.070227, 3.431387, 5.45107,
-3.070227, -3.163931, -5.99522,
-3.070227, -3.163931, 5.45107,
-3.070227, 3.431387, -5.99522,
-3.070227, 3.431387, 5.45107,
-3.070227, -3.163931, -5.99522,
3.207446, -3.163931, -5.99522,
-3.070227, -3.163931, 5.45107,
3.207446, -3.163931, 5.45107,
-3.070227, 3.431387, -5.99522,
3.207446, 3.431387, -5.99522,
-3.070227, 3.431387, 5.45107,
3.207446, 3.431387, 5.45107,
3.207446, -3.163931, -5.99522,
3.207446, 3.431387, -5.99522,
3.207446, -3.163931, 5.45107,
3.207446, 3.431387, 5.45107,
3.207446, -3.163931, -5.99522,
3.207446, -3.163931, 5.45107,
3.207446, 3.431387, -5.99522,
3.207446, 3.431387, 5.45107
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
var radius = 7.810093;
var distance = 34.74798;
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
mvMatrix.translate( -0.06860936, -0.1337279, 0.2720752 );
mvMatrix.scale( 1.345152, 1.280367, 0.7377434 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.74798);
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
tecloftalam<-read.table("tecloftalam.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-tecloftalam$V2
```

```
## Error in eval(expr, envir, enclos): object 'tecloftalam' not found
```

```r
y<-tecloftalam$V3
```

```
## Error in eval(expr, envir, enclos): object 'tecloftalam' not found
```

```r
z<-tecloftalam$V4
```

```
## Error in eval(expr, envir, enclos): object 'tecloftalam' not found
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
-2.978805, 0.7428927, -2.294285, 0, 0, 1, 1, 1,
-2.947307, 0.3514465, -1.149926, 1, 0, 0, 1, 1,
-2.854654, 1.452351, -1.822164, 1, 0, 0, 1, 1,
-2.713215, 1.39821, -2.006679, 1, 0, 0, 1, 1,
-2.703588, -1.088979, -1.541623, 1, 0, 0, 1, 1,
-2.659224, 0.4533185, -1.458166, 1, 0, 0, 1, 1,
-2.634008, 0.2053774, -1.938366, 0, 0, 0, 1, 1,
-2.602506, -1.670291, -1.709774, 0, 0, 0, 1, 1,
-2.474604, 0.9496975, -1.507779, 0, 0, 0, 1, 1,
-2.424812, 0.8449751, -2.604452, 0, 0, 0, 1, 1,
-2.361819, -0.8533008, -1.207125, 0, 0, 0, 1, 1,
-2.323304, -1.133037, -1.0224, 0, 0, 0, 1, 1,
-2.315696, -0.5685771, -2.458036, 0, 0, 0, 1, 1,
-2.309103, -0.1153804, -2.627752, 1, 1, 1, 1, 1,
-2.24013, 0.424141, -0.7594297, 1, 1, 1, 1, 1,
-2.208515, 1.293165, -1.364777, 1, 1, 1, 1, 1,
-2.203627, 0.2300268, -0.8026376, 1, 1, 1, 1, 1,
-2.136308, -0.6076905, -1.159224, 1, 1, 1, 1, 1,
-2.121396, 0.1481361, -1.901173, 1, 1, 1, 1, 1,
-2.0912, 0.02323543, -1.641342, 1, 1, 1, 1, 1,
-2.090844, -0.0103511, 1.023165, 1, 1, 1, 1, 1,
-2.078684, -0.8763641, -1.921766, 1, 1, 1, 1, 1,
-2.076215, -0.6317475, -1.959801, 1, 1, 1, 1, 1,
-2.062078, 0.6201446, -1.634633, 1, 1, 1, 1, 1,
-1.999801, 1.543436, -1.03403, 1, 1, 1, 1, 1,
-1.995933, -0.2192922, -2.936146, 1, 1, 1, 1, 1,
-1.958262, 0.1804349, -2.859522, 1, 1, 1, 1, 1,
-1.953908, -1.525944, -2.68242, 1, 1, 1, 1, 1,
-1.946633, 1.085638, -0.9569274, 0, 0, 1, 1, 1,
-1.927782, -0.5235314, -2.82554, 1, 0, 0, 1, 1,
-1.892324, 1.223766, -1.605365, 1, 0, 0, 1, 1,
-1.892034, 0.1804196, -0.7189162, 1, 0, 0, 1, 1,
-1.875771, -0.2077586, -2.541831, 1, 0, 0, 1, 1,
-1.810514, 0.5534375, -2.269165, 1, 0, 0, 1, 1,
-1.789178, -0.1845425, -0.3795254, 0, 0, 0, 1, 1,
-1.744514, -0.1057587, -2.638356, 0, 0, 0, 1, 1,
-1.738432, 0.01437842, -1.959158, 0, 0, 0, 1, 1,
-1.728784, 2.293217, 0.5966045, 0, 0, 0, 1, 1,
-1.712806, 1.329662, -2.063583, 0, 0, 0, 1, 1,
-1.709294, 0.5308372, -1.333193, 0, 0, 0, 1, 1,
-1.702141, -1.581961, -2.070823, 0, 0, 0, 1, 1,
-1.698619, 0.7078619, -0.4892431, 1, 1, 1, 1, 1,
-1.685876, 0.1117505, -0.3386551, 1, 1, 1, 1, 1,
-1.685408, 1.026048, -0.3041204, 1, 1, 1, 1, 1,
-1.679959, 0.9331975, 0.2953921, 1, 1, 1, 1, 1,
-1.678863, -0.0748184, -1.766154, 1, 1, 1, 1, 1,
-1.678775, 0.2298515, -0.9683229, 1, 1, 1, 1, 1,
-1.677859, -0.8504181, -1.948801, 1, 1, 1, 1, 1,
-1.674226, 1.033956, -1.873194, 1, 1, 1, 1, 1,
-1.672567, -1.11746, -3.443398, 1, 1, 1, 1, 1,
-1.669881, 0.3080048, -1.665792, 1, 1, 1, 1, 1,
-1.661145, -0.2383369, 0.7563957, 1, 1, 1, 1, 1,
-1.658309, 0.8442939, 0.2339643, 1, 1, 1, 1, 1,
-1.645792, -1.488723, -2.50417, 1, 1, 1, 1, 1,
-1.621566, -1.246604, -2.379638, 1, 1, 1, 1, 1,
-1.619062, 0.6969664, -1.937284, 1, 1, 1, 1, 1,
-1.616253, -1.480101, -2.595648, 0, 0, 1, 1, 1,
-1.610812, -0.9839433, -1.253919, 1, 0, 0, 1, 1,
-1.609387, -0.5862325, -0.04729057, 1, 0, 0, 1, 1,
-1.606061, -1.093586, -2.345582, 1, 0, 0, 1, 1,
-1.603713, 0.329628, 0.522055, 1, 0, 0, 1, 1,
-1.592975, -1.061221, -1.140193, 1, 0, 0, 1, 1,
-1.591217, 0.4952996, -2.292492, 0, 0, 0, 1, 1,
-1.565121, 0.0357113, -2.629056, 0, 0, 0, 1, 1,
-1.560752, -1.47344, -2.802931, 0, 0, 0, 1, 1,
-1.54034, 0.3431247, -0.6489537, 0, 0, 0, 1, 1,
-1.539149, 0.1009882, -2.327889, 0, 0, 0, 1, 1,
-1.538452, -1.862174, -1.538267, 0, 0, 0, 1, 1,
-1.535251, -0.4743376, -2.106552, 0, 0, 0, 1, 1,
-1.529485, -0.9257014, -2.495269, 1, 1, 1, 1, 1,
-1.497394, -1.950886, -2.615603, 1, 1, 1, 1, 1,
-1.485395, -0.01516455, -0.8471611, 1, 1, 1, 1, 1,
-1.484426, 0.03345396, -2.281258, 1, 1, 1, 1, 1,
-1.47731, -0.0214506, -3.084254, 1, 1, 1, 1, 1,
-1.468599, -0.4363523, -1.247412, 1, 1, 1, 1, 1,
-1.462261, -1.430639, -3.760002, 1, 1, 1, 1, 1,
-1.45175, -0.6366014, -1.249104, 1, 1, 1, 1, 1,
-1.449236, -0.9352199, -1.695484, 1, 1, 1, 1, 1,
-1.401936, 1.365689, -0.6398373, 1, 1, 1, 1, 1,
-1.39378, 1.438309, -0.1307162, 1, 1, 1, 1, 1,
-1.381615, 0.6403499, -3.060136, 1, 1, 1, 1, 1,
-1.380835, 0.8927985, -0.5596095, 1, 1, 1, 1, 1,
-1.379453, 0.1760076, -0.2308462, 1, 1, 1, 1, 1,
-1.372018, 0.3820291, -1.119698, 1, 1, 1, 1, 1,
-1.368116, 0.08412999, -2.49559, 0, 0, 1, 1, 1,
-1.367498, -0.5488012, -3.362313, 1, 0, 0, 1, 1,
-1.363954, -0.2415262, -1.405465, 1, 0, 0, 1, 1,
-1.335509, -0.3220026, -2.936121, 1, 0, 0, 1, 1,
-1.334552, 0.3869691, -1.607372, 1, 0, 0, 1, 1,
-1.334254, 0.2523369, -1.499531, 1, 0, 0, 1, 1,
-1.314869, 0.4750309, -0.2542115, 0, 0, 0, 1, 1,
-1.308451, 2.462465, -2.002203, 0, 0, 0, 1, 1,
-1.281366, 0.7839261, -2.11461, 0, 0, 0, 1, 1,
-1.279297, 0.3603216, -1.45151, 0, 0, 0, 1, 1,
-1.278922, -2.842772, -1.589834, 0, 0, 0, 1, 1,
-1.264086, 0.1540216, -2.877966, 0, 0, 0, 1, 1,
-1.262358, -1.592663, -4.904831, 0, 0, 0, 1, 1,
-1.237675, -0.7694044, -2.007242, 1, 1, 1, 1, 1,
-1.231862, 0.01136397, -1.53439, 1, 1, 1, 1, 1,
-1.231325, -0.5200242, -2.089677, 1, 1, 1, 1, 1,
-1.227071, -1.539323, -2.267141, 1, 1, 1, 1, 1,
-1.222304, -0.6224787, -0.3844205, 1, 1, 1, 1, 1,
-1.220516, -0.6686017, -2.267053, 1, 1, 1, 1, 1,
-1.206259, 1.05794, -0.8589193, 1, 1, 1, 1, 1,
-1.203222, -2.002365, -2.436499, 1, 1, 1, 1, 1,
-1.195631, 0.6601231, -0.5427091, 1, 1, 1, 1, 1,
-1.194484, -1.11497, -1.943717, 1, 1, 1, 1, 1,
-1.188675, 0.8328551, -0.3868237, 1, 1, 1, 1, 1,
-1.186079, 0.6876682, 0.0526628, 1, 1, 1, 1, 1,
-1.185102, -1.147557, -1.638429, 1, 1, 1, 1, 1,
-1.173253, 0.4254582, -0.4207275, 1, 1, 1, 1, 1,
-1.167891, -1.156523, -1.401783, 1, 1, 1, 1, 1,
-1.166373, -0.913689, -2.395765, 0, 0, 1, 1, 1,
-1.16465, 2.09915, 0.2863143, 1, 0, 0, 1, 1,
-1.152999, 0.2389078, -2.099137, 1, 0, 0, 1, 1,
-1.150103, 0.7595091, -1.462601, 1, 0, 0, 1, 1,
-1.135593, -0.1464891, -1.209571, 1, 0, 0, 1, 1,
-1.128332, -1.291921, -1.670698, 1, 0, 0, 1, 1,
-1.126341, 1.238985, 1.882227, 0, 0, 0, 1, 1,
-1.124095, 0.596166, -0.7933404, 0, 0, 0, 1, 1,
-1.11698, -0.1172016, -0.9381235, 0, 0, 0, 1, 1,
-1.115428, 0.2989075, 0.1626703, 0, 0, 0, 1, 1,
-1.102356, 0.3584291, -1.411701, 0, 0, 0, 1, 1,
-1.102102, -0.2092109, -0.7520032, 0, 0, 0, 1, 1,
-1.093485, -0.304776, -1.205361, 0, 0, 0, 1, 1,
-1.082925, 1.152668, -2.562471, 1, 1, 1, 1, 1,
-1.081371, 2.499617, 0.7427696, 1, 1, 1, 1, 1,
-1.071459, -1.191166, -2.113983, 1, 1, 1, 1, 1,
-1.071053, -1.30338, -3.956973, 1, 1, 1, 1, 1,
-1.062843, 0.8175009, -1.786088, 1, 1, 1, 1, 1,
-1.059617, 0.6272545, 0.3988753, 1, 1, 1, 1, 1,
-1.051984, 0.5920843, -0.2206848, 1, 1, 1, 1, 1,
-1.05146, -1.631824, -3.415242, 1, 1, 1, 1, 1,
-1.051113, 1.447194, -1.256255, 1, 1, 1, 1, 1,
-1.048013, -0.441743, -3.006196, 1, 1, 1, 1, 1,
-1.043047, 0.5025234, -0.6808078, 1, 1, 1, 1, 1,
-1.039304, 0.00170567, -2.039795, 1, 1, 1, 1, 1,
-1.03617, -0.2181304, -0.6897218, 1, 1, 1, 1, 1,
-1.03572, 0.1340138, -1.259873, 1, 1, 1, 1, 1,
-1.034471, 2.911517, -0.3057816, 1, 1, 1, 1, 1,
-1.032525, -0.4414141, -1.292666, 0, 0, 1, 1, 1,
-1.032009, 0.1729777, -1.214598, 1, 0, 0, 1, 1,
-1.028107, 0.9234444, -1.372937, 1, 0, 0, 1, 1,
-1.025705, 2.227466, -0.6290607, 1, 0, 0, 1, 1,
-1.02121, -0.2181846, -2.493317, 1, 0, 0, 1, 1,
-1.001325, 1.229013, -0.5254731, 1, 0, 0, 1, 1,
-0.9983094, 0.3704894, -2.42854, 0, 0, 0, 1, 1,
-0.9932145, 0.3629, -1.750931, 0, 0, 0, 1, 1,
-0.986823, 1.51922, -1.019224, 0, 0, 0, 1, 1,
-0.9843054, 0.0497393, -3.291424, 0, 0, 0, 1, 1,
-0.9841982, 1.594267, -1.063298, 0, 0, 0, 1, 1,
-0.9747119, -1.011341, -3.714966, 0, 0, 0, 1, 1,
-0.9684913, -0.8582178, -3.646681, 0, 0, 0, 1, 1,
-0.9679192, -0.9663358, -1.057311, 1, 1, 1, 1, 1,
-0.9672539, 1.053934, -1.691868, 1, 1, 1, 1, 1,
-0.9622411, -1.261643, -2.42315, 1, 1, 1, 1, 1,
-0.9603346, 1.446291, 0.2411894, 1, 1, 1, 1, 1,
-0.956943, -0.6256636, -1.914273, 1, 1, 1, 1, 1,
-0.9568202, -0.8350589, -2.893516, 1, 1, 1, 1, 1,
-0.9557748, -0.4762752, -1.211341, 1, 1, 1, 1, 1,
-0.9492867, -0.8774914, -1.727227, 1, 1, 1, 1, 1,
-0.9443308, -0.6934977, -3.243898, 1, 1, 1, 1, 1,
-0.9430991, -0.296164, -1.894501, 1, 1, 1, 1, 1,
-0.9377036, 0.2640196, 0.6114012, 1, 1, 1, 1, 1,
-0.936958, 1.524199, -0.7840649, 1, 1, 1, 1, 1,
-0.9280742, -1.144789, -1.503534, 1, 1, 1, 1, 1,
-0.9269937, 1.406598, -0.6124251, 1, 1, 1, 1, 1,
-0.9246971, 1.034339, -3.558983, 1, 1, 1, 1, 1,
-0.9212344, -0.5769562, -1.328136, 0, 0, 1, 1, 1,
-0.9200239, 0.2366449, -2.020946, 1, 0, 0, 1, 1,
-0.9193633, 0.4867888, -1.356575, 1, 0, 0, 1, 1,
-0.9116209, -0.3206486, -2.73362, 1, 0, 0, 1, 1,
-0.9061775, -0.3450431, -2.03547, 1, 0, 0, 1, 1,
-0.9053634, -0.06427338, -3.055262, 1, 0, 0, 1, 1,
-0.9044954, -0.4717005, -1.157704, 0, 0, 0, 1, 1,
-0.9032238, -1.492355, -1.750165, 0, 0, 0, 1, 1,
-0.9029744, -1.582414, -2.876644, 0, 0, 0, 1, 1,
-0.8989104, 0.4081048, -1.049693, 0, 0, 0, 1, 1,
-0.8970324, 0.02082522, 0.3508467, 0, 0, 0, 1, 1,
-0.8959706, -0.3245512, -0.9979577, 0, 0, 0, 1, 1,
-0.8940687, -0.9327633, -2.576403, 0, 0, 0, 1, 1,
-0.8927988, -0.3133793, -1.644622, 1, 1, 1, 1, 1,
-0.8920317, 0.8564998, -2.096082, 1, 1, 1, 1, 1,
-0.8883014, 0.7291682, -0.7478633, 1, 1, 1, 1, 1,
-0.8871336, -0.2475337, -3.151964, 1, 1, 1, 1, 1,
-0.8848986, 0.01137243, -1.905352, 1, 1, 1, 1, 1,
-0.8837996, -0.1432267, -2.160271, 1, 1, 1, 1, 1,
-0.8835456, -0.02012229, -1.880929, 1, 1, 1, 1, 1,
-0.8831664, 0.2910397, -1.34806, 1, 1, 1, 1, 1,
-0.8794546, 1.398846, 0.4383079, 1, 1, 1, 1, 1,
-0.8790378, -0.1522556, -0.4141805, 1, 1, 1, 1, 1,
-0.8744002, -0.02126114, -1.577339, 1, 1, 1, 1, 1,
-0.8630099, -0.500575, -2.743036, 1, 1, 1, 1, 1,
-0.8625278, 1.492829, -0.9930699, 1, 1, 1, 1, 1,
-0.8588906, -0.09044302, -0.7588635, 1, 1, 1, 1, 1,
-0.8586898, 0.08848003, -3.634825, 1, 1, 1, 1, 1,
-0.8552602, -0.4226653, -3.589937, 0, 0, 1, 1, 1,
-0.8539312, 0.9247463, -1.341731, 1, 0, 0, 1, 1,
-0.8488286, 1.401444, 0.1881102, 1, 0, 0, 1, 1,
-0.8465245, 0.9675016, 2.478975, 1, 0, 0, 1, 1,
-0.8449566, 0.7482638, -0.4849221, 1, 0, 0, 1, 1,
-0.8380533, 2.161772, -0.02344452, 1, 0, 0, 1, 1,
-0.8356349, -0.8936973, -1.777141, 0, 0, 0, 1, 1,
-0.8314961, -1.359775, -3.174125, 0, 0, 0, 1, 1,
-0.8294189, 0.6783357, -1.490864, 0, 0, 0, 1, 1,
-0.8221803, -2.123705, -3.647216, 0, 0, 0, 1, 1,
-0.816763, 0.290606, 1.827796, 0, 0, 0, 1, 1,
-0.8165693, 1.439015, -0.8294215, 0, 0, 0, 1, 1,
-0.8149911, 0.236238, -4.844635, 0, 0, 0, 1, 1,
-0.8110866, 0.23183, -2.947391, 1, 1, 1, 1, 1,
-0.8096213, 0.880996, -0.3198802, 1, 1, 1, 1, 1,
-0.8084805, -1.58181, -3.779514, 1, 1, 1, 1, 1,
-0.8046349, 0.1969822, 0.408855, 1, 1, 1, 1, 1,
-0.7963645, -2.115057, -3.148389, 1, 1, 1, 1, 1,
-0.7962731, 0.7656926, -0.08571727, 1, 1, 1, 1, 1,
-0.796241, -1.192036, -1.862794, 1, 1, 1, 1, 1,
-0.7955154, 0.3727897, -0.5920252, 1, 1, 1, 1, 1,
-0.7951667, 0.4442062, -1.638636, 1, 1, 1, 1, 1,
-0.7934238, 1.719164, -0.9707696, 1, 1, 1, 1, 1,
-0.7934034, 0.7387875, -0.5082941, 1, 1, 1, 1, 1,
-0.7892487, 0.8275813, 0.5054461, 1, 1, 1, 1, 1,
-0.7882502, -0.2469417, -3.821162, 1, 1, 1, 1, 1,
-0.7833574, -0.4408078, -3.456666, 1, 1, 1, 1, 1,
-0.7747504, 0.02893623, -0.9640941, 1, 1, 1, 1, 1,
-0.7710474, -0.6093963, -1.982831, 0, 0, 1, 1, 1,
-0.7616615, 1.647867, 0.6705073, 1, 0, 0, 1, 1,
-0.7607422, 0.2989598, -3.011765, 1, 0, 0, 1, 1,
-0.7601799, -0.2144115, -3.290418, 1, 0, 0, 1, 1,
-0.7561854, -1.794415, -2.508461, 1, 0, 0, 1, 1,
-0.7542542, 2.933194, 0.4063992, 1, 0, 0, 1, 1,
-0.7527847, 0.0897148, -1.208651, 0, 0, 0, 1, 1,
-0.743026, -0.6512286, -2.323737, 0, 0, 0, 1, 1,
-0.7394394, 0.270081, 0.5308375, 0, 0, 0, 1, 1,
-0.734876, -1.343752, -3.744586, 0, 0, 0, 1, 1,
-0.7298111, 0.8293313, -1.742317, 0, 0, 0, 1, 1,
-0.7294015, 0.356394, -0.6400293, 0, 0, 0, 1, 1,
-0.720008, -0.4257794, -0.7743145, 0, 0, 0, 1, 1,
-0.7185678, 0.09921911, -1.586436, 1, 1, 1, 1, 1,
-0.7136208, 0.41437, -1.464422, 1, 1, 1, 1, 1,
-0.7057678, 1.201233, -1.976016, 1, 1, 1, 1, 1,
-0.6975473, -2.018675, -1.785133, 1, 1, 1, 1, 1,
-0.6936041, -0.412363, -1.218763, 1, 1, 1, 1, 1,
-0.6917422, 0.2548011, -1.074195, 1, 1, 1, 1, 1,
-0.6900624, -1.843305, -3.523454, 1, 1, 1, 1, 1,
-0.6876825, 1.157017, -0.1647306, 1, 1, 1, 1, 1,
-0.6864607, 0.02501433, -2.501455, 1, 1, 1, 1, 1,
-0.6846407, 0.06100653, -3.385301, 1, 1, 1, 1, 1,
-0.6843354, 0.7581735, -1.433766, 1, 1, 1, 1, 1,
-0.6836188, -1.035376, -2.977799, 1, 1, 1, 1, 1,
-0.6814906, -1.422809, -2.247671, 1, 1, 1, 1, 1,
-0.6777278, -0.5598243, -2.316507, 1, 1, 1, 1, 1,
-0.6742038, 1.12032, 0.2080258, 1, 1, 1, 1, 1,
-0.6714313, 1.41766, -0.880241, 0, 0, 1, 1, 1,
-0.6711348, 0.6444089, -0.1146903, 1, 0, 0, 1, 1,
-0.665781, -0.5599463, -1.502189, 1, 0, 0, 1, 1,
-0.6607367, 0.6648681, 0.1231479, 1, 0, 0, 1, 1,
-0.6604637, -0.2309108, -2.226336, 1, 0, 0, 1, 1,
-0.6588693, 2.001623, 0.1409623, 1, 0, 0, 1, 1,
-0.6587446, -0.6127441, -2.085603, 0, 0, 0, 1, 1,
-0.6573599, 2.178771, 0.2140836, 0, 0, 0, 1, 1,
-0.6537724, -2.111346, -2.356571, 0, 0, 0, 1, 1,
-0.6519186, -0.9787629, -2.874792, 0, 0, 0, 1, 1,
-0.6446773, -0.6708871, -3.272969, 0, 0, 0, 1, 1,
-0.6395409, -1.005115, -4.814179, 0, 0, 0, 1, 1,
-0.638316, -0.5561589, -3.402192, 0, 0, 0, 1, 1,
-0.6288953, -0.3292718, -1.426072, 1, 1, 1, 1, 1,
-0.6243653, -0.4496715, -1.635948, 1, 1, 1, 1, 1,
-0.6242252, 2.140105, 0.1930726, 1, 1, 1, 1, 1,
-0.6226793, 1.788233, -0.3795087, 1, 1, 1, 1, 1,
-0.6175612, -0.1793596, -3.157979, 1, 1, 1, 1, 1,
-0.6170664, -0.23904, -1.795895, 1, 1, 1, 1, 1,
-0.616217, 1.009089, -1.215206, 1, 1, 1, 1, 1,
-0.6142608, 1.196762, -0.1850443, 1, 1, 1, 1, 1,
-0.6077883, -0.1823477, -1.83848, 1, 1, 1, 1, 1,
-0.6012964, 0.1956563, -1.187392, 1, 1, 1, 1, 1,
-0.593501, 0.2572553, -1.033081, 1, 1, 1, 1, 1,
-0.5904785, 0.6404833, -0.06436487, 1, 1, 1, 1, 1,
-0.5901381, 0.4330882, 0.1322935, 1, 1, 1, 1, 1,
-0.584998, 0.3300627, -1.433502, 1, 1, 1, 1, 1,
-0.582332, -2.545635, -3.728219, 1, 1, 1, 1, 1,
-0.5793357, -0.2855945, -2.792576, 0, 0, 1, 1, 1,
-0.5761703, -0.4028876, -0.6028332, 1, 0, 0, 1, 1,
-0.5761068, -0.4988874, -2.003019, 1, 0, 0, 1, 1,
-0.5535818, -2.067808, -3.181956, 1, 0, 0, 1, 1,
-0.5513937, 0.3616037, -0.001175861, 1, 0, 0, 1, 1,
-0.5485775, -1.294577, -2.76544, 1, 0, 0, 1, 1,
-0.5386138, -0.4355629, -2.526793, 0, 0, 0, 1, 1,
-0.5380523, 0.6467579, -1.94054, 0, 0, 0, 1, 1,
-0.5379823, -0.07461643, -1.405815, 0, 0, 0, 1, 1,
-0.5362662, -0.3366421, -3.753278, 0, 0, 0, 1, 1,
-0.5297406, -0.1454494, -1.751274, 0, 0, 0, 1, 1,
-0.5281817, 0.2328595, -1.563885, 0, 0, 0, 1, 1,
-0.52622, -0.9229052, -3.209429, 0, 0, 0, 1, 1,
-0.5248271, -2.716757, -2.510175, 1, 1, 1, 1, 1,
-0.5246581, -0.2698437, -3.130928, 1, 1, 1, 1, 1,
-0.5216537, 1.548172, 0.0001364141, 1, 1, 1, 1, 1,
-0.5195211, 1.698579, -0.2432265, 1, 1, 1, 1, 1,
-0.5182981, 0.0359954, -0.3289943, 1, 1, 1, 1, 1,
-0.5174241, -0.6316777, -3.201275, 1, 1, 1, 1, 1,
-0.5093365, 0.5306879, -0.8584267, 1, 1, 1, 1, 1,
-0.5081104, -1.998685, -1.533355, 1, 1, 1, 1, 1,
-0.5077963, -0.7527154, -2.748998, 1, 1, 1, 1, 1,
-0.5055134, -2.450827, -5.055923, 1, 1, 1, 1, 1,
-0.5030167, 0.02600349, -2.276499, 1, 1, 1, 1, 1,
-0.4986022, -1.571045, -3.953287, 1, 1, 1, 1, 1,
-0.4935413, -1.879841, -2.383537, 1, 1, 1, 1, 1,
-0.4924787, -0.1592741, -1.725162, 1, 1, 1, 1, 1,
-0.4901333, -0.6804153, -3.536952, 1, 1, 1, 1, 1,
-0.4892782, -2.190192, -3.11701, 0, 0, 1, 1, 1,
-0.482687, -2.25401, -2.547084, 1, 0, 0, 1, 1,
-0.4767959, 1.910499, -1.427635, 1, 0, 0, 1, 1,
-0.4757101, 0.009037184, -1.940188, 1, 0, 0, 1, 1,
-0.4713226, -0.4693405, -2.781968, 1, 0, 0, 1, 1,
-0.4666194, -0.1323669, -2.493576, 1, 0, 0, 1, 1,
-0.4587984, -0.5064242, -1.813648, 0, 0, 0, 1, 1,
-0.4585299, -0.2266287, -1.837991, 0, 0, 0, 1, 1,
-0.4558325, 0.9302284, -1.387038, 0, 0, 0, 1, 1,
-0.4554703, 0.4123378, 0.7684377, 0, 0, 0, 1, 1,
-0.455007, -1.363068, -3.345548, 0, 0, 0, 1, 1,
-0.4492587, 0.5836475, -0.2286494, 0, 0, 0, 1, 1,
-0.4469136, -2.393011, -3.960006, 0, 0, 0, 1, 1,
-0.4457756, 0.7993464, -1.430647, 1, 1, 1, 1, 1,
-0.4380955, 1.965824, -2.712493, 1, 1, 1, 1, 1,
-0.4353744, -0.3217572, -2.239566, 1, 1, 1, 1, 1,
-0.4325847, -0.02523913, -2.059941, 1, 1, 1, 1, 1,
-0.4319939, 0.5369945, 0.0935532, 1, 1, 1, 1, 1,
-0.427866, 0.5901366, 1.154649, 1, 1, 1, 1, 1,
-0.4252077, 1.53198, -0.05575383, 1, 1, 1, 1, 1,
-0.4241099, 0.1248309, -0.2974523, 1, 1, 1, 1, 1,
-0.4219607, -0.3595664, -3.636556, 1, 1, 1, 1, 1,
-0.4201218, -1.264725, -3.159072, 1, 1, 1, 1, 1,
-0.4197586, -0.6726814, -2.603097, 1, 1, 1, 1, 1,
-0.4187356, -2.493883, -3.230428, 1, 1, 1, 1, 1,
-0.4136328, 0.9019374, -0.5062189, 1, 1, 1, 1, 1,
-0.411505, -0.5938339, -2.833123, 1, 1, 1, 1, 1,
-0.4112895, -0.001154969, -2.808568, 1, 1, 1, 1, 1,
-0.4101412, 0.1992621, -2.208153, 0, 0, 1, 1, 1,
-0.4067152, 0.01289899, 1.065899, 1, 0, 0, 1, 1,
-0.3985546, -0.7910655, -2.943365, 1, 0, 0, 1, 1,
-0.3981733, -0.8212898, -3.096581, 1, 0, 0, 1, 1,
-0.3928481, -0.1844952, -1.624746, 1, 0, 0, 1, 1,
-0.3862903, -0.4337263, -2.951557, 1, 0, 0, 1, 1,
-0.3837728, -0.06755123, 0.008487229, 0, 0, 0, 1, 1,
-0.3760546, 0.2592172, -1.56088, 0, 0, 0, 1, 1,
-0.3747212, 0.1972957, -1.268247, 0, 0, 0, 1, 1,
-0.3736791, -1.457993, -2.916316, 0, 0, 0, 1, 1,
-0.3709169, -2.346606, -3.38846, 0, 0, 0, 1, 1,
-0.3642014, -2.185802, -1.606044, 0, 0, 0, 1, 1,
-0.3614497, 1.184911, 0.06792124, 0, 0, 0, 1, 1,
-0.3567072, -0.6019949, -2.189668, 1, 1, 1, 1, 1,
-0.3562038, 0.8305145, 0.003154689, 1, 1, 1, 1, 1,
-0.3526225, -0.3285447, -3.33261, 1, 1, 1, 1, 1,
-0.3448344, -1.062358, -1.88577, 1, 1, 1, 1, 1,
-0.3446405, 2.131502, -0.6935211, 1, 1, 1, 1, 1,
-0.343304, -0.2348262, -2.735333, 1, 1, 1, 1, 1,
-0.3410068, -2.507332, -2.655437, 1, 1, 1, 1, 1,
-0.3372968, 0.5637492, -2.392196, 1, 1, 1, 1, 1,
-0.3364401, -0.9867609, -3.047731, 1, 1, 1, 1, 1,
-0.3355216, -0.7207556, -2.374725, 1, 1, 1, 1, 1,
-0.3306393, -2.165675, -3.22989, 1, 1, 1, 1, 1,
-0.3281973, 1.151893, -1.345697, 1, 1, 1, 1, 1,
-0.3264533, 0.04349724, -0.4399347, 1, 1, 1, 1, 1,
-0.3209435, -1.096604, -3.168265, 1, 1, 1, 1, 1,
-0.32083, -0.1868387, -1.711843, 1, 1, 1, 1, 1,
-0.3204001, 0.2329274, -0.822919, 0, 0, 1, 1, 1,
-0.315211, -0.4614115, -0.3646069, 1, 0, 0, 1, 1,
-0.3116264, 0.9237486, -1.147397, 1, 0, 0, 1, 1,
-0.2945683, -1.191738, -1.625729, 1, 0, 0, 1, 1,
-0.2914622, 0.9985666, -0.7106614, 1, 0, 0, 1, 1,
-0.2899924, 1.518104, -0.07011104, 1, 0, 0, 1, 1,
-0.2761067, 1.119766, 0.3543724, 0, 0, 0, 1, 1,
-0.2653123, -0.2118018, -0.5428141, 0, 0, 0, 1, 1,
-0.2601571, -0.3288313, -2.34913, 0, 0, 0, 1, 1,
-0.2600086, 0.1954768, -4.098474, 0, 0, 0, 1, 1,
-0.2589674, 1.457925, -1.770956, 0, 0, 0, 1, 1,
-0.2552658, -0.3507368, -1.038235, 0, 0, 0, 1, 1,
-0.2503873, 1.104349, -0.5237061, 0, 0, 0, 1, 1,
-0.2464712, 0.9274203, -0.08113942, 1, 1, 1, 1, 1,
-0.2456457, -0.4157979, -3.153784, 1, 1, 1, 1, 1,
-0.2370526, -0.8625389, -2.66832, 1, 1, 1, 1, 1,
-0.2367778, 0.2875078, -0.6240668, 1, 1, 1, 1, 1,
-0.2314404, 0.5240509, 0.9889875, 1, 1, 1, 1, 1,
-0.231212, -1.69997, -4.112313, 1, 1, 1, 1, 1,
-0.2306776, 0.1856045, -0.7967303, 1, 1, 1, 1, 1,
-0.2226297, 1.234432, -0.1329307, 1, 1, 1, 1, 1,
-0.2211896, -0.09528761, -1.559392, 1, 1, 1, 1, 1,
-0.2195373, 0.7279545, -1.160819, 1, 1, 1, 1, 1,
-0.2170256, 1.722138, 1.487216, 1, 1, 1, 1, 1,
-0.2161018, -0.2214959, -1.064505, 1, 1, 1, 1, 1,
-0.2160522, 1.021176, 2.102889, 1, 1, 1, 1, 1,
-0.2140865, -1.336044, -1.909419, 1, 1, 1, 1, 1,
-0.2140038, 0.6691357, 0.2437312, 1, 1, 1, 1, 1,
-0.2096158, 2.173047, -1.592136, 0, 0, 1, 1, 1,
-0.2028378, 0.4704432, 0.007162922, 1, 0, 0, 1, 1,
-0.1996894, 0.08348904, -1.70498, 1, 0, 0, 1, 1,
-0.1994121, 0.6069893, -0.7289985, 1, 0, 0, 1, 1,
-0.197009, 0.4816175, -0.3332189, 1, 0, 0, 1, 1,
-0.1969339, 0.1761377, -0.3067012, 1, 0, 0, 1, 1,
-0.1956687, 1.192067, -0.7209681, 0, 0, 0, 1, 1,
-0.1942599, 0.1062395, -0.3601723, 0, 0, 0, 1, 1,
-0.1904011, 1.017806, -0.9048021, 0, 0, 0, 1, 1,
-0.1889235, -0.1334307, -3.147901, 0, 0, 0, 1, 1,
-0.1861589, 0.2731723, -1.057572, 0, 0, 0, 1, 1,
-0.1813779, 0.4364884, 0.002247207, 0, 0, 0, 1, 1,
-0.1753911, -1.680904, -2.259397, 0, 0, 0, 1, 1,
-0.1750841, -1.165416, -2.525611, 1, 1, 1, 1, 1,
-0.174431, -0.5621137, -5.129782, 1, 1, 1, 1, 1,
-0.168866, 0.0005859679, -0.2543891, 1, 1, 1, 1, 1,
-0.1673474, 1.366791, -1.061955, 1, 1, 1, 1, 1,
-0.167285, -0.6848458, -2.958973, 1, 1, 1, 1, 1,
-0.1639422, -0.8820889, -2.215033, 1, 1, 1, 1, 1,
-0.1594665, -1.952375, -2.892967, 1, 1, 1, 1, 1,
-0.1571351, -0.2082698, -3.3444, 1, 1, 1, 1, 1,
-0.1553552, -0.1113656, -1.153194, 1, 1, 1, 1, 1,
-0.1520468, 1.082563, 0.8442288, 1, 1, 1, 1, 1,
-0.1479934, 0.1400111, 1.07609, 1, 1, 1, 1, 1,
-0.1471049, -0.3315415, -2.867539, 1, 1, 1, 1, 1,
-0.134127, -0.0835579, -2.957555, 1, 1, 1, 1, 1,
-0.1282526, -0.195462, -1.282812, 1, 1, 1, 1, 1,
-0.1245471, 0.2644353, -1.641089, 1, 1, 1, 1, 1,
-0.1188781, -1.123307, -1.599546, 0, 0, 1, 1, 1,
-0.1184508, 0.3168394, -1.215636, 1, 0, 0, 1, 1,
-0.1180194, -0.49167, -3.077423, 1, 0, 0, 1, 1,
-0.1104143, 1.45172, 1.962696, 1, 0, 0, 1, 1,
-0.1080529, -1.210559, -4.888332, 1, 0, 0, 1, 1,
-0.1075443, -1.404965, -1.081098, 1, 0, 0, 1, 1,
-0.1045936, 0.2313635, -1.338918, 0, 0, 0, 1, 1,
-0.100962, 0.3133028, 0.09668913, 0, 0, 0, 1, 1,
-0.1006981, -1.013365, -2.835077, 0, 0, 0, 1, 1,
-0.09975927, 0.5694652, -0.6949014, 0, 0, 0, 1, 1,
-0.09952132, -0.7914138, -3.518436, 0, 0, 0, 1, 1,
-0.09546138, 1.190935, 0.661736, 0, 0, 0, 1, 1,
-0.09398145, -3.067883, -3.361161, 0, 0, 0, 1, 1,
-0.09291455, 0.9536806, -0.9436359, 1, 1, 1, 1, 1,
-0.09243416, 0.4045106, -0.7169471, 1, 1, 1, 1, 1,
-0.08787657, -0.9688482, -3.15051, 1, 1, 1, 1, 1,
-0.084805, -0.6684377, -2.956972, 1, 1, 1, 1, 1,
-0.08468542, -0.4970644, -2.773167, 1, 1, 1, 1, 1,
-0.08163959, -0.8192923, -1.993923, 1, 1, 1, 1, 1,
-0.0785423, -1.280929, -5.828526, 1, 1, 1, 1, 1,
-0.0767234, -0.9754915, -2.225073, 1, 1, 1, 1, 1,
-0.07627524, -0.3109511, -3.425622, 1, 1, 1, 1, 1,
-0.07317056, -0.08679943, -2.032639, 1, 1, 1, 1, 1,
-0.07278568, 0.4376316, -1.12927, 1, 1, 1, 1, 1,
-0.07188576, -1.883319, -2.767866, 1, 1, 1, 1, 1,
-0.06956407, -0.1364648, -2.018978, 1, 1, 1, 1, 1,
-0.06949431, -0.7609174, -2.195882, 1, 1, 1, 1, 1,
-0.06570758, 0.2431943, 1.115562, 1, 1, 1, 1, 1,
-0.06564506, -0.01117551, -1.709706, 0, 0, 1, 1, 1,
-0.0646879, -0.07830614, -1.398461, 1, 0, 0, 1, 1,
-0.04519969, 2.336003, -1.129996, 1, 0, 0, 1, 1,
-0.04491342, -1.185114, -3.965199, 1, 0, 0, 1, 1,
-0.0413524, 0.2625455, 0.6657304, 1, 0, 0, 1, 1,
-0.03382251, -0.5823441, -2.580139, 1, 0, 0, 1, 1,
-0.03351965, 0.266589, 1.887869, 0, 0, 0, 1, 1,
-0.02839175, 0.4054296, -0.1570768, 0, 0, 0, 1, 1,
-0.02009258, -0.6635424, -3.427707, 0, 0, 0, 1, 1,
-0.01992717, 0.7065235, -0.8916066, 0, 0, 0, 1, 1,
-0.01923304, 0.9652287, 2.173733, 0, 0, 0, 1, 1,
-0.01646875, -0.9281338, -3.882209, 0, 0, 0, 1, 1,
-0.01603984, 0.7416919, 0.01373754, 0, 0, 0, 1, 1,
-0.01129494, 1.025069, 1.413157, 1, 1, 1, 1, 1,
-0.005041635, -1.559768, -3.320391, 1, 1, 1, 1, 1,
-0.004579415, -0.9578948, -3.851809, 1, 1, 1, 1, 1,
-0.001727533, 0.6331592, -0.788922, 1, 1, 1, 1, 1,
-0.001711859, 0.1053255, -0.8887163, 1, 1, 1, 1, 1,
-0.00161121, -0.6973528, -1.721529, 1, 1, 1, 1, 1,
0.001198369, 1.243386, 0.9310394, 1, 1, 1, 1, 1,
0.001579721, 0.756631, -0.8527063, 1, 1, 1, 1, 1,
0.001897574, -0.0007006144, 1.999879, 1, 1, 1, 1, 1,
0.00579049, -1.242604, 1.134727, 1, 1, 1, 1, 1,
0.01226677, -1.1428, 4.366712, 1, 1, 1, 1, 1,
0.01309145, -1.478149, 4.83473, 1, 1, 1, 1, 1,
0.01617981, -0.1803797, 4.590079, 1, 1, 1, 1, 1,
0.01778188, -0.5760201, 2.069682, 1, 1, 1, 1, 1,
0.01814925, -0.289959, 1.625873, 1, 1, 1, 1, 1,
0.01958391, -0.4824541, 4.547675, 0, 0, 1, 1, 1,
0.03005903, 1.212007, 0.1833284, 1, 0, 0, 1, 1,
0.03116809, -2.069578, 3.972152, 1, 0, 0, 1, 1,
0.03185517, -0.4256001, 3.011098, 1, 0, 0, 1, 1,
0.0351181, -0.6151634, 1.292856, 1, 0, 0, 1, 1,
0.03682447, -0.3862672, 2.179768, 1, 0, 0, 1, 1,
0.0373836, 0.7483951, -0.8461068, 0, 0, 0, 1, 1,
0.03913012, -0.9673777, 4.542105, 0, 0, 0, 1, 1,
0.03977161, 1.976666, 0.630999, 0, 0, 0, 1, 1,
0.03995961, -0.06667428, 1.557042, 0, 0, 0, 1, 1,
0.04512692, 1.532895, -1.74302, 0, 0, 0, 1, 1,
0.05439148, 0.1616897, 0.1492668, 0, 0, 0, 1, 1,
0.0562444, -0.3102719, 4.123743, 0, 0, 0, 1, 1,
0.05773188, -0.04374113, 3.421925, 1, 1, 1, 1, 1,
0.05902794, 0.3437203, 0.7071754, 1, 1, 1, 1, 1,
0.05988138, -2.063038, 2.441916, 1, 1, 1, 1, 1,
0.06725474, 0.01187992, 2.138946, 1, 1, 1, 1, 1,
0.06745911, 0.9169281, -0.632538, 1, 1, 1, 1, 1,
0.06760284, -0.7430075, 4.05916, 1, 1, 1, 1, 1,
0.06798112, 0.8050162, 1.784238, 1, 1, 1, 1, 1,
0.06803311, -1.619089, 3.79841, 1, 1, 1, 1, 1,
0.07067809, -0.2573729, 3.578567, 1, 1, 1, 1, 1,
0.07112051, 1.066028, -0.2997448, 1, 1, 1, 1, 1,
0.07410291, 0.937646, -0.0349407, 1, 1, 1, 1, 1,
0.07505281, 0.3960297, 0.5130771, 1, 1, 1, 1, 1,
0.08175418, 0.3558058, 0.002802035, 1, 1, 1, 1, 1,
0.08539777, -0.2387609, 3.819355, 1, 1, 1, 1, 1,
0.08628632, 1.542575, -0.569242, 1, 1, 1, 1, 1,
0.08655284, -1.733857, 5.284376, 0, 0, 1, 1, 1,
0.09827237, -0.09744294, 2.448458, 1, 0, 0, 1, 1,
0.1043318, 1.38902, -1.641052, 1, 0, 0, 1, 1,
0.1050422, 1.259838, 0.2337287, 1, 0, 0, 1, 1,
0.1061926, 0.2396179, 0.4950123, 1, 0, 0, 1, 1,
0.1104919, -1.508998, 2.598835, 1, 0, 0, 1, 1,
0.1129267, -1.224541, 3.033696, 0, 0, 0, 1, 1,
0.1139376, -1.0559, 3.714633, 0, 0, 0, 1, 1,
0.1151539, -0.2073224, 2.760016, 0, 0, 0, 1, 1,
0.1172638, 0.2980517, 0.4192983, 0, 0, 0, 1, 1,
0.1180051, 1.573849, -0.6144406, 0, 0, 0, 1, 1,
0.120333, 1.703109, 1.020285, 0, 0, 0, 1, 1,
0.1257959, 0.3137929, -0.3173529, 0, 0, 0, 1, 1,
0.1268884, 0.1083759, 1.546586, 1, 1, 1, 1, 1,
0.1281193, 0.587903, 0.5018534, 1, 1, 1, 1, 1,
0.1297762, 0.5783402, -0.2413568, 1, 1, 1, 1, 1,
0.1318928, 0.1465112, 1.787836, 1, 1, 1, 1, 1,
0.1377821, -1.286213, 2.676295, 1, 1, 1, 1, 1,
0.1424028, 0.2081546, 1.973592, 1, 1, 1, 1, 1,
0.1466348, 0.4747657, 0.8393369, 1, 1, 1, 1, 1,
0.1469814, 0.7469557, -0.1567878, 1, 1, 1, 1, 1,
0.1523388, 0.6388756, -1.465106, 1, 1, 1, 1, 1,
0.1544558, -0.03665483, 2.113096, 1, 1, 1, 1, 1,
0.1593946, 1.064468, 0.195763, 1, 1, 1, 1, 1,
0.1625397, -0.3242101, 2.94312, 1, 1, 1, 1, 1,
0.1637513, 0.2709953, 0.7739718, 1, 1, 1, 1, 1,
0.1639456, -0.9862567, 2.617127, 1, 1, 1, 1, 1,
0.1702495, -0.4983945, 1.022774, 1, 1, 1, 1, 1,
0.1705878, 1.247442, 2.019434, 0, 0, 1, 1, 1,
0.1721254, -0.9685171, 2.794698, 1, 0, 0, 1, 1,
0.173038, -1.58325, 1.890417, 1, 0, 0, 1, 1,
0.1761726, 0.1000834, 0.6133903, 1, 0, 0, 1, 1,
0.1804397, 0.8763585, 0.3350273, 1, 0, 0, 1, 1,
0.1809035, -0.8949047, 5.253615, 1, 0, 0, 1, 1,
0.1811384, -0.1947112, 3.429435, 0, 0, 0, 1, 1,
0.1842603, 0.731481, 1.038841, 0, 0, 0, 1, 1,
0.1849298, -0.6697423, 4.034206, 0, 0, 0, 1, 1,
0.1881595, -1.915316, 3.057712, 0, 0, 0, 1, 1,
0.1908489, -0.3749806, 4.186758, 0, 0, 0, 1, 1,
0.1934508, 0.2525602, 0.2004707, 0, 0, 0, 1, 1,
0.1960047, -1.058765, 2.76679, 0, 0, 0, 1, 1,
0.1999631, -0.2244387, 1.100026, 1, 1, 1, 1, 1,
0.2034015, 1.816778, -2.266945, 1, 1, 1, 1, 1,
0.2066355, -0.1874453, 3.63156, 1, 1, 1, 1, 1,
0.2072247, -1.427344, 4.768283, 1, 1, 1, 1, 1,
0.2108666, -0.4982978, 3.732819, 1, 1, 1, 1, 1,
0.2127427, 1.619575, 1.733232, 1, 1, 1, 1, 1,
0.2145866, 0.5008942, 1.152695, 1, 1, 1, 1, 1,
0.22116, 0.3068587, 1.376265, 1, 1, 1, 1, 1,
0.2222766, -2.107497, 2.206532, 1, 1, 1, 1, 1,
0.2228592, -0.3571411, 2.670604, 1, 1, 1, 1, 1,
0.2239216, 0.8932518, 1.701045, 1, 1, 1, 1, 1,
0.2251043, -0.4528172, 2.098276, 1, 1, 1, 1, 1,
0.2317732, 1.261988, -0.9113383, 1, 1, 1, 1, 1,
0.2319637, 0.5689157, 0.107162, 1, 1, 1, 1, 1,
0.2356086, 0.7548526, 0.6136363, 1, 1, 1, 1, 1,
0.2422951, -0.05153474, 1.884065, 0, 0, 1, 1, 1,
0.2432342, 1.255143, 0.1491211, 1, 0, 0, 1, 1,
0.2434393, -1.056593, 2.277363, 1, 0, 0, 1, 1,
0.2450328, -0.6305517, 3.812022, 1, 0, 0, 1, 1,
0.2473799, 0.2436802, 1.040851, 1, 0, 0, 1, 1,
0.2499871, -0.03007192, 2.267741, 1, 0, 0, 1, 1,
0.250433, 0.5842621, 0.8881474, 0, 0, 0, 1, 1,
0.253687, 2.065953, 0.06038222, 0, 0, 0, 1, 1,
0.2581832, -1.760311, 3.562492, 0, 0, 0, 1, 1,
0.259805, -0.3305977, 1.843899, 0, 0, 0, 1, 1,
0.2621233, 1.94377, -1.136203, 0, 0, 0, 1, 1,
0.2624301, 0.8585709, -0.5989909, 0, 0, 0, 1, 1,
0.262684, 0.492378, -1.091591, 0, 0, 0, 1, 1,
0.263107, 1.732766, -1.511492, 1, 1, 1, 1, 1,
0.263483, 0.02822801, 2.21299, 1, 1, 1, 1, 1,
0.2650214, -0.500756, 2.865688, 1, 1, 1, 1, 1,
0.2663793, 0.9513519, 1.595663, 1, 1, 1, 1, 1,
0.2737206, 0.2323724, -0.02932746, 1, 1, 1, 1, 1,
0.2744479, 0.7298566, 0.08477887, 1, 1, 1, 1, 1,
0.2745294, 1.222458, 0.697331, 1, 1, 1, 1, 1,
0.2757684, -0.2735495, 2.099248, 1, 1, 1, 1, 1,
0.277909, 0.728303, -1.114016, 1, 1, 1, 1, 1,
0.2779431, 0.6910025, 0.3520334, 1, 1, 1, 1, 1,
0.2802542, -0.04956554, 1.794073, 1, 1, 1, 1, 1,
0.2805272, 1.942722, 0.7388721, 1, 1, 1, 1, 1,
0.284938, -2.153363, 2.336261, 1, 1, 1, 1, 1,
0.2861256, 0.4082081, 1.050174, 1, 1, 1, 1, 1,
0.2878501, 0.7450972, 0.6256292, 1, 1, 1, 1, 1,
0.2911152, -1.462702, 3.845554, 0, 0, 1, 1, 1,
0.2930889, 2.316413, -0.05769898, 1, 0, 0, 1, 1,
0.2931405, 0.2830892, 0.638023, 1, 0, 0, 1, 1,
0.2991992, -1.769565, 2.104757, 1, 0, 0, 1, 1,
0.2992397, 0.0632963, 2.534205, 1, 0, 0, 1, 1,
0.3004625, 2.521757, -0.2550857, 1, 0, 0, 1, 1,
0.3025171, -1.505825, 2.616199, 0, 0, 0, 1, 1,
0.3059402, -0.9325536, 2.574009, 0, 0, 0, 1, 1,
0.3099625, 1.017725, 1.804992, 0, 0, 0, 1, 1,
0.3122153, -1.685001, 2.957766, 0, 0, 0, 1, 1,
0.312348, 0.528954, 1.605455, 0, 0, 0, 1, 1,
0.3138542, -0.7622595, 2.649725, 0, 0, 0, 1, 1,
0.3139598, 0.3939177, 2.244697, 0, 0, 0, 1, 1,
0.3167198, -0.7286394, 1.749108, 1, 1, 1, 1, 1,
0.3174185, -1.23409, 2.357927, 1, 1, 1, 1, 1,
0.319275, -0.5582302, 3.565464, 1, 1, 1, 1, 1,
0.3195518, 1.533973, 1.056724, 1, 1, 1, 1, 1,
0.3197325, -0.5243282, 2.288736, 1, 1, 1, 1, 1,
0.3242162, -0.1436643, 4.957469, 1, 1, 1, 1, 1,
0.3296278, -0.6807519, 1.972903, 1, 1, 1, 1, 1,
0.3426742, 0.4827268, 0.4366898, 1, 1, 1, 1, 1,
0.356572, 2.237962, -0.07395897, 1, 1, 1, 1, 1,
0.3575846, 0.3812067, 1.855207, 1, 1, 1, 1, 1,
0.3578807, 0.3941186, -0.08068512, 1, 1, 1, 1, 1,
0.3602862, 2.498887, -0.6030029, 1, 1, 1, 1, 1,
0.3614341, 0.5354141, -0.675077, 1, 1, 1, 1, 1,
0.3628813, 2.093425, 0.5825118, 1, 1, 1, 1, 1,
0.3646417, -0.762833, 1.732935, 1, 1, 1, 1, 1,
0.365313, 1.117475, 0.7557058, 0, 0, 1, 1, 1,
0.3713663, 1.161552, -0.5554309, 1, 0, 0, 1, 1,
0.3721869, 1.216554, 0.463406, 1, 0, 0, 1, 1,
0.3757667, -0.03530664, 0.7610786, 1, 0, 0, 1, 1,
0.377118, 0.09256151, 0.8302521, 1, 0, 0, 1, 1,
0.3779293, 2.204305, 1.61542, 1, 0, 0, 1, 1,
0.3782725, 0.107137, 2.950273, 0, 0, 0, 1, 1,
0.3795505, 0.1521631, 1.186883, 0, 0, 0, 1, 1,
0.3796292, -0.06556981, 2.472178, 0, 0, 0, 1, 1,
0.3807566, -0.2986077, 2.280215, 0, 0, 0, 1, 1,
0.3944639, -0.8889352, 3.136667, 0, 0, 0, 1, 1,
0.3972084, 0.3769521, 0.8431951, 0, 0, 0, 1, 1,
0.3986974, 1.00127, 0.3284707, 0, 0, 0, 1, 1,
0.4027361, 2.913434, -1.210108, 1, 1, 1, 1, 1,
0.4048864, 0.6067581, 0.1334129, 1, 1, 1, 1, 1,
0.4064488, 0.4950155, 0.1016239, 1, 1, 1, 1, 1,
0.415432, 0.6151254, 3.61466, 1, 1, 1, 1, 1,
0.4155423, -0.05459031, 0.5401244, 1, 1, 1, 1, 1,
0.4186713, 1.093353, -0.6344303, 1, 1, 1, 1, 1,
0.4247312, 1.193249, 0.05499507, 1, 1, 1, 1, 1,
0.4248321, 2.062069, 1.250064, 1, 1, 1, 1, 1,
0.4257611, 0.2962592, 1.72861, 1, 1, 1, 1, 1,
0.4261988, -1.727278, 3.003252, 1, 1, 1, 1, 1,
0.4290007, -0.07101358, 1.615285, 1, 1, 1, 1, 1,
0.4313241, 0.2979935, -0.07333272, 1, 1, 1, 1, 1,
0.4371907, -0.7368281, 2.530476, 1, 1, 1, 1, 1,
0.4395782, -1.604379, 3.684371, 1, 1, 1, 1, 1,
0.4433171, -0.2620118, 3.368134, 1, 1, 1, 1, 1,
0.4450887, 0.2393289, -0.2411265, 0, 0, 1, 1, 1,
0.4451408, 0.5515885, 1.149916, 1, 0, 0, 1, 1,
0.4500289, 1.406095, 1.057612, 1, 0, 0, 1, 1,
0.4533247, 0.8249893, -0.8366297, 1, 0, 0, 1, 1,
0.47626, 0.6030837, -0.4126372, 1, 0, 0, 1, 1,
0.4772759, -0.2419846, 1.581984, 1, 0, 0, 1, 1,
0.4797893, 0.1849421, 1.100323, 0, 0, 0, 1, 1,
0.4808405, -0.2228413, 2.124903, 0, 0, 0, 1, 1,
0.4929108, -0.03762164, 2.276688, 0, 0, 0, 1, 1,
0.5010439, -0.5179227, 2.395703, 0, 0, 0, 1, 1,
0.5014688, 1.116716, -0.1889553, 0, 0, 0, 1, 1,
0.5059634, 3.110329, -0.1063385, 0, 0, 0, 1, 1,
0.5087844, 0.4269173, 1.070039, 0, 0, 0, 1, 1,
0.5118742, 1.643507, -0.637582, 1, 1, 1, 1, 1,
0.5132357, 0.4918647, 2.324226, 1, 1, 1, 1, 1,
0.5142502, -0.1159974, 1.452472, 1, 1, 1, 1, 1,
0.5143445, 0.504495, 1.106802, 1, 1, 1, 1, 1,
0.5151124, -0.2358571, 1.946363, 1, 1, 1, 1, 1,
0.518028, 0.4984347, 1.162624, 1, 1, 1, 1, 1,
0.5182018, -1.100156, 2.755192, 1, 1, 1, 1, 1,
0.5215688, -0.3835429, 1.051711, 1, 1, 1, 1, 1,
0.5228921, 0.6055009, -0.2311131, 1, 1, 1, 1, 1,
0.5284073, -0.9849806, 2.877708, 1, 1, 1, 1, 1,
0.5293593, -0.01422196, 0.4779884, 1, 1, 1, 1, 1,
0.5298239, 0.5208007, 0.3435914, 1, 1, 1, 1, 1,
0.53238, -2.250249, 2.664113, 1, 1, 1, 1, 1,
0.5326284, 0.652983, -0.6623633, 1, 1, 1, 1, 1,
0.5345318, 0.9748235, 0.8154138, 1, 1, 1, 1, 1,
0.5356845, -0.5322432, 1.245307, 0, 0, 1, 1, 1,
0.5372676, -0.8119985, 3.039002, 1, 0, 0, 1, 1,
0.5381886, -1.808219, 2.223304, 1, 0, 0, 1, 1,
0.5406508, 0.4035191, 1.748435, 1, 0, 0, 1, 1,
0.541186, -0.9482962, 4.102256, 1, 0, 0, 1, 1,
0.5424572, -0.3716291, 3.163019, 1, 0, 0, 1, 1,
0.5425269, 0.7974718, -0.1569559, 0, 0, 0, 1, 1,
0.5438028, -0.07990199, 0.8165075, 0, 0, 0, 1, 1,
0.5456591, 2.113977, 0.9497303, 0, 0, 0, 1, 1,
0.5565938, -1.12697, 2.655075, 0, 0, 0, 1, 1,
0.5605309, -0.6678287, 3.900955, 0, 0, 0, 1, 1,
0.5636223, -0.3100106, 2.009818, 0, 0, 0, 1, 1,
0.5636505, 1.282015, 0.09168351, 0, 0, 0, 1, 1,
0.5638372, 1.306563, 0.3591282, 1, 1, 1, 1, 1,
0.5647229, -0.8496608, 2.210683, 1, 1, 1, 1, 1,
0.56699, 1.043231, -0.1872052, 1, 1, 1, 1, 1,
0.5688658, 1.344513, 0.683943, 1, 1, 1, 1, 1,
0.5714868, 1.40448, 1.534234, 1, 1, 1, 1, 1,
0.5728236, 1.660636, 0.5105481, 1, 1, 1, 1, 1,
0.5734678, -0.5949086, 1.669037, 1, 1, 1, 1, 1,
0.5818147, -0.2206536, 2.337602, 1, 1, 1, 1, 1,
0.5864478, -1.272217, 2.689435, 1, 1, 1, 1, 1,
0.5879396, -1.363469, 3.109121, 1, 1, 1, 1, 1,
0.592933, -1.018906, 3.903579, 1, 1, 1, 1, 1,
0.6000354, -0.5964457, 2.495761, 1, 1, 1, 1, 1,
0.6047185, 0.7771289, -0.2473331, 1, 1, 1, 1, 1,
0.6059542, -0.7341033, 3.649302, 1, 1, 1, 1, 1,
0.6087963, 0.9087221, 2.551708, 1, 1, 1, 1, 1,
0.6132537, -0.4256528, 1.103044, 0, 0, 1, 1, 1,
0.6136741, -0.2864013, 3.016152, 1, 0, 0, 1, 1,
0.6137328, 2.917911, 0.9695219, 1, 0, 0, 1, 1,
0.6159751, 1.212995, -1.261287, 1, 0, 0, 1, 1,
0.6172466, -0.5690714, 3.050217, 1, 0, 0, 1, 1,
0.618459, 1.993723, 0.9887309, 1, 0, 0, 1, 1,
0.6203369, 1.964476, -0.2035158, 0, 0, 0, 1, 1,
0.6256198, -0.3070526, 2.738793, 0, 0, 0, 1, 1,
0.6291602, -0.6753494, 2.311074, 0, 0, 0, 1, 1,
0.6298488, 1.394091, -0.2782803, 0, 0, 0, 1, 1,
0.6353919, 0.3322035, 1.479294, 0, 0, 0, 1, 1,
0.6366525, -1.111917, 4.072493, 0, 0, 0, 1, 1,
0.6375777, 0.3068004, 1.276249, 0, 0, 0, 1, 1,
0.6438212, -1.715314, 3.999372, 1, 1, 1, 1, 1,
0.6515578, 1.551939, 0.03037394, 1, 1, 1, 1, 1,
0.6568424, -1.894302, 3.353213, 1, 1, 1, 1, 1,
0.6642419, -0.6226779, 3.028851, 1, 1, 1, 1, 1,
0.6680942, -1.155647, 1.646044, 1, 1, 1, 1, 1,
0.6683298, -0.04793124, 1.312927, 1, 1, 1, 1, 1,
0.6702446, 0.9121958, -0.1515899, 1, 1, 1, 1, 1,
0.6729733, -0.1341838, 2.491212, 1, 1, 1, 1, 1,
0.6747612, -0.5329351, 2.329694, 1, 1, 1, 1, 1,
0.677901, -1.058781, -0.1300132, 1, 1, 1, 1, 1,
0.6830866, -0.09268482, 1.141536, 1, 1, 1, 1, 1,
0.6840979, -0.4611615, 3.092593, 1, 1, 1, 1, 1,
0.6922241, -0.5679187, 2.026816, 1, 1, 1, 1, 1,
0.6946255, 0.2695197, 1.441949, 1, 1, 1, 1, 1,
0.6995689, -1.262781, 2.355324, 1, 1, 1, 1, 1,
0.7032439, 0.4540246, 2.046036, 0, 0, 1, 1, 1,
0.7073303, -0.03918572, 1.320882, 1, 0, 0, 1, 1,
0.7087986, 0.370871, 0.9249204, 1, 0, 0, 1, 1,
0.716253, 0.6406379, 1.016255, 1, 0, 0, 1, 1,
0.7192762, -0.4485568, 2.363601, 1, 0, 0, 1, 1,
0.7243541, 0.6920036, -0.02594564, 1, 0, 0, 1, 1,
0.7261581, -0.2443074, 2.513931, 0, 0, 0, 1, 1,
0.7272412, 0.7513281, 2.526598, 0, 0, 0, 1, 1,
0.7292348, -0.8957624, 1.807519, 0, 0, 0, 1, 1,
0.730834, 0.4303457, 1.745707, 0, 0, 0, 1, 1,
0.741107, 1.084989, 0.09398636, 0, 0, 0, 1, 1,
0.7453475, -0.2119407, 0.1228697, 0, 0, 0, 1, 1,
0.7460366, -1.092497, 2.992553, 0, 0, 0, 1, 1,
0.7462946, -2.809328, 2.446711, 1, 1, 1, 1, 1,
0.751074, 0.2057365, 2.921028, 1, 1, 1, 1, 1,
0.7537439, -0.2285896, 2.086983, 1, 1, 1, 1, 1,
0.7545067, -0.1513356, 3.378224, 1, 1, 1, 1, 1,
0.7572486, 0.5886786, 2.358621, 1, 1, 1, 1, 1,
0.7600079, -1.496862, 3.101643, 1, 1, 1, 1, 1,
0.7706819, 0.8875228, 0.7626398, 1, 1, 1, 1, 1,
0.7711806, -1.462554, 4.548448, 1, 1, 1, 1, 1,
0.7736286, -1.377211, 1.879325, 1, 1, 1, 1, 1,
0.7737561, -2.247319, 3.718619, 1, 1, 1, 1, 1,
0.7801306, -0.3560551, 2.439543, 1, 1, 1, 1, 1,
0.7828723, -0.9552441, 3.079316, 1, 1, 1, 1, 1,
0.7885674, -0.38016, 3.408986, 1, 1, 1, 1, 1,
0.7893852, -0.4573465, 2.832073, 1, 1, 1, 1, 1,
0.8060422, 0.4355793, 0.4994068, 1, 1, 1, 1, 1,
0.8101627, -0.5346977, 2.01743, 0, 0, 1, 1, 1,
0.814921, -0.2429955, -0.1978909, 1, 0, 0, 1, 1,
0.8152047, -0.1572843, 3.381605, 1, 0, 0, 1, 1,
0.8202904, -0.1020797, 0.517036, 1, 0, 0, 1, 1,
0.8208483, 0.3771275, 3.065738, 1, 0, 0, 1, 1,
0.8246094, -0.1678743, 1.61979, 1, 0, 0, 1, 1,
0.8270848, 0.03508468, 2.425353, 0, 0, 0, 1, 1,
0.8284963, 0.4482145, -0.7612273, 0, 0, 0, 1, 1,
0.8291231, -0.329165, 2.275362, 0, 0, 0, 1, 1,
0.830478, -0.9963212, 1.4005, 0, 0, 0, 1, 1,
0.8326675, 0.5771104, 0.7944096, 0, 0, 0, 1, 1,
0.8348009, 0.2489775, 1.590021, 0, 0, 0, 1, 1,
0.838164, 0.3930195, 0.8867686, 0, 0, 0, 1, 1,
0.8426362, -0.2553452, 0.5529993, 1, 1, 1, 1, 1,
0.8434237, 1.15106, 1.576255, 1, 1, 1, 1, 1,
0.8464908, 0.02705843, 1.111976, 1, 1, 1, 1, 1,
0.8473374, 1.035766, -0.1434105, 1, 1, 1, 1, 1,
0.8543252, 0.2655061, 1.110244, 1, 1, 1, 1, 1,
0.8589984, -0.6322688, 1.7731, 1, 1, 1, 1, 1,
0.8607412, 1.356977, -1.489534, 1, 1, 1, 1, 1,
0.8632104, -0.3695016, 3.319451, 1, 1, 1, 1, 1,
0.864134, 0.2470947, 1.51887, 1, 1, 1, 1, 1,
0.8645402, 0.9050841, 0.5593624, 1, 1, 1, 1, 1,
0.8686767, 0.7674026, 1.616591, 1, 1, 1, 1, 1,
0.870713, -0.3377722, 1.60017, 1, 1, 1, 1, 1,
0.87629, -1.331418, 3.031759, 1, 1, 1, 1, 1,
0.8765121, -0.02938072, 2.679603, 1, 1, 1, 1, 1,
0.8795796, 3.335339, -1.325633, 1, 1, 1, 1, 1,
0.883249, -0.1991437, 2.696934, 0, 0, 1, 1, 1,
0.8920778, 0.02137112, 1.961226, 1, 0, 0, 1, 1,
0.8923759, -1.139529, 1.747195, 1, 0, 0, 1, 1,
0.8955576, 1.156619, 1.469399, 1, 0, 0, 1, 1,
0.9049358, -0.557679, 2.013524, 1, 0, 0, 1, 1,
0.906224, -1.53468, 2.847931, 1, 0, 0, 1, 1,
0.9063532, 1.195253, 0.1439482, 0, 0, 0, 1, 1,
0.9071983, 0.4442845, -1.296553, 0, 0, 0, 1, 1,
0.9084245, -1.345669, 2.028122, 0, 0, 0, 1, 1,
0.9100927, 0.5745172, -0.565666, 0, 0, 0, 1, 1,
0.9152529, -1.38617, 2.755919, 0, 0, 0, 1, 1,
0.9263192, 0.9758654, 0.2498529, 0, 0, 0, 1, 1,
0.9297854, -0.1756157, 0.9394301, 0, 0, 0, 1, 1,
0.9329187, -0.3268186, 2.255043, 1, 1, 1, 1, 1,
0.9339215, -0.494231, 1.787046, 1, 1, 1, 1, 1,
0.9429605, -0.2293915, 3.124959, 1, 1, 1, 1, 1,
0.9448272, 1.090373, -1.23801, 1, 1, 1, 1, 1,
0.9461315, 0.8846942, 1.090504, 1, 1, 1, 1, 1,
0.9477347, 0.1515273, 1.645766, 1, 1, 1, 1, 1,
0.9645718, -0.2461433, 3.510467, 1, 1, 1, 1, 1,
0.9692787, -0.08014321, 1.201122, 1, 1, 1, 1, 1,
0.9694297, 0.8968949, 0.6978707, 1, 1, 1, 1, 1,
0.9701943, 1.371779, 0.2102178, 1, 1, 1, 1, 1,
0.9727074, 0.6411036, 0.5013548, 1, 1, 1, 1, 1,
0.974031, 0.02742933, 1.381944, 1, 1, 1, 1, 1,
0.974396, 0.3027322, 2.225435, 1, 1, 1, 1, 1,
0.9750061, -0.07836197, 1.746759, 1, 1, 1, 1, 1,
0.975117, 0.4151683, 0.3786283, 1, 1, 1, 1, 1,
0.9769338, -0.7477965, 1.395756, 0, 0, 1, 1, 1,
0.9889991, 0.1912181, 1.413276, 1, 0, 0, 1, 1,
0.994049, 1.101813, -0.106411, 1, 0, 0, 1, 1,
0.9951681, -0.1203307, 1.551549, 1, 0, 0, 1, 1,
0.9973046, -0.3769426, 2.39016, 1, 0, 0, 1, 1,
1.000511, 0.4828193, 2.117526, 1, 0, 0, 1, 1,
1.002802, 0.9399123, 2.277761, 0, 0, 0, 1, 1,
1.007804, 0.6131341, 0.5880272, 0, 0, 0, 1, 1,
1.008738, 0.2451991, 2.74994, 0, 0, 0, 1, 1,
1.00919, -0.7308368, 2.670375, 0, 0, 0, 1, 1,
1.010664, 1.209156, 1.906804, 0, 0, 0, 1, 1,
1.011168, -1.032571, 3.320912, 0, 0, 0, 1, 1,
1.018137, -1.397145, 1.881995, 0, 0, 0, 1, 1,
1.030985, -0.7959816, 1.750726, 1, 1, 1, 1, 1,
1.033394, 0.9227514, -0.4900769, 1, 1, 1, 1, 1,
1.034223, -1.328108, 4.009329, 1, 1, 1, 1, 1,
1.038743, -2.027668, 1.805844, 1, 1, 1, 1, 1,
1.039585, -0.7767599, 1.159235, 1, 1, 1, 1, 1,
1.040529, 0.3045565, 3.053101, 1, 1, 1, 1, 1,
1.04284, -2.456543, 2.48542, 1, 1, 1, 1, 1,
1.044029, 0.2356231, 2.912074, 1, 1, 1, 1, 1,
1.04591, -0.5018891, 2.880418, 1, 1, 1, 1, 1,
1.047612, 0.5520777, 0.9234865, 1, 1, 1, 1, 1,
1.061644, -0.1577748, -0.009711185, 1, 1, 1, 1, 1,
1.063385, -1.43541, 4.061609, 1, 1, 1, 1, 1,
1.066739, -0.9206131, 0.3380108, 1, 1, 1, 1, 1,
1.077577, -0.01202122, 1.350674, 1, 1, 1, 1, 1,
1.088944, 0.5592777, 1.276006, 1, 1, 1, 1, 1,
1.098541, -0.6705115, 1.815188, 0, 0, 1, 1, 1,
1.103188, 1.46786, -0.2546747, 1, 0, 0, 1, 1,
1.11201, -0.9848889, 1.376565, 1, 0, 0, 1, 1,
1.113447, 0.7298185, 1.736696, 1, 0, 0, 1, 1,
1.115517, 0.7980497, 1.137512, 1, 0, 0, 1, 1,
1.119981, -1.071616, 3.948645, 1, 0, 0, 1, 1,
1.120179, -0.3174323, 1.57335, 0, 0, 0, 1, 1,
1.122735, 0.5123814, 1.120603, 0, 0, 0, 1, 1,
1.124609, 1.946536, 0.4582734, 0, 0, 0, 1, 1,
1.129711, 0.7447304, 1.358413, 0, 0, 0, 1, 1,
1.13509, -0.05087182, 1.949884, 0, 0, 0, 1, 1,
1.136737, 0.03887597, 0.2227515, 0, 0, 0, 1, 1,
1.144606, -0.3498808, 1.322991, 0, 0, 0, 1, 1,
1.147028, 1.953671, 0.05737169, 1, 1, 1, 1, 1,
1.152462, 1.963318, -2.153706, 1, 1, 1, 1, 1,
1.154803, -0.8291454, 1.284827, 1, 1, 1, 1, 1,
1.157239, -0.1991968, -0.5329343, 1, 1, 1, 1, 1,
1.159456, 0.5551912, 0.5002138, 1, 1, 1, 1, 1,
1.1613, 1.551382, 1.319854, 1, 1, 1, 1, 1,
1.169684, 1.03401, 2.71596, 1, 1, 1, 1, 1,
1.172902, 0.7785539, 0.3153962, 1, 1, 1, 1, 1,
1.176983, 1.867094, 0.9707859, 1, 1, 1, 1, 1,
1.17954, 0.6407676, 1.007605, 1, 1, 1, 1, 1,
1.179754, 0.5348713, 0.8296835, 1, 1, 1, 1, 1,
1.18108, -0.7823594, 1.818174, 1, 1, 1, 1, 1,
1.186192, -2.099307, 3.101372, 1, 1, 1, 1, 1,
1.187293, 0.2346797, 3.389774, 1, 1, 1, 1, 1,
1.19807, 0.9026987, 0.6274101, 1, 1, 1, 1, 1,
1.199883, 0.2577252, -0.3436657, 0, 0, 1, 1, 1,
1.203997, -0.7819601, 2.916201, 1, 0, 0, 1, 1,
1.212337, -2.580284, 4.224538, 1, 0, 0, 1, 1,
1.221851, 1.360404, 0.4804033, 1, 0, 0, 1, 1,
1.232067, 1.277605, 0.7900345, 1, 0, 0, 1, 1,
1.234845, 1.626511, -2.04025, 1, 0, 0, 1, 1,
1.237841, 0.4853821, 1.087767, 0, 0, 0, 1, 1,
1.240281, -0.490175, 1.106414, 0, 0, 0, 1, 1,
1.241758, 0.3509265, 3.347844, 0, 0, 0, 1, 1,
1.244783, 0.5223312, 1.496387, 0, 0, 0, 1, 1,
1.252441, 1.254, -0.43076, 0, 0, 0, 1, 1,
1.254449, -0.2709757, 0.9762282, 0, 0, 0, 1, 1,
1.254954, -1.845279, 3.122393, 0, 0, 0, 1, 1,
1.255196, 0.2687939, 1.39342, 1, 1, 1, 1, 1,
1.258524, 0.02722656, 1.124738, 1, 1, 1, 1, 1,
1.258716, 1.549662, 0.9560908, 1, 1, 1, 1, 1,
1.270017, 0.05128931, 3.115559, 1, 1, 1, 1, 1,
1.27923, -2.048892, 0.6675971, 1, 1, 1, 1, 1,
1.285712, 0.5517037, 1.34379, 1, 1, 1, 1, 1,
1.300587, 0.2210377, 0.228333, 1, 1, 1, 1, 1,
1.30224, -2.21352, 2.809739, 1, 1, 1, 1, 1,
1.308182, -0.6907682, 1.90272, 1, 1, 1, 1, 1,
1.315191, -2.464735, 3.988757, 1, 1, 1, 1, 1,
1.319628, 0.657626, -0.05525956, 1, 1, 1, 1, 1,
1.323822, 2.262022, 1.013617, 1, 1, 1, 1, 1,
1.329784, -0.5594988, 2.092417, 1, 1, 1, 1, 1,
1.33062, -0.8604009, 2.652086, 1, 1, 1, 1, 1,
1.33094, -0.4171603, 1.955258, 1, 1, 1, 1, 1,
1.338667, -1.947826, 2.741203, 0, 0, 1, 1, 1,
1.340439, -0.5705068, 1.544666, 1, 0, 0, 1, 1,
1.343175, -0.4731227, 1.512638, 1, 0, 0, 1, 1,
1.352315, 1.234507, -0.3386481, 1, 0, 0, 1, 1,
1.35246, 0.2429685, 1.201192, 1, 0, 0, 1, 1,
1.352688, -0.5961757, -0.6694863, 1, 0, 0, 1, 1,
1.353937, 2.060101, 0.4358526, 0, 0, 0, 1, 1,
1.354625, -0.03066277, 3.714549, 0, 0, 0, 1, 1,
1.355555, -0.5712962, 1.439022, 0, 0, 0, 1, 1,
1.361424, -1.490458, 1.960037, 0, 0, 0, 1, 1,
1.361895, 0.4293765, 1.018844, 0, 0, 0, 1, 1,
1.363524, -0.1120304, 2.532808, 0, 0, 0, 1, 1,
1.365707, 0.5081265, -0.4472266, 0, 0, 0, 1, 1,
1.369328, 0.7553654, 1.356436, 1, 1, 1, 1, 1,
1.374077, 0.4179354, -0.7455845, 1, 1, 1, 1, 1,
1.379288, 0.7771493, 3.224099, 1, 1, 1, 1, 1,
1.393101, 0.1272447, 2.002002, 1, 1, 1, 1, 1,
1.402317, -0.2777871, 1.605902, 1, 1, 1, 1, 1,
1.404135, 0.3361906, 0.3524622, 1, 1, 1, 1, 1,
1.407332, -1.392765, 0.9831899, 1, 1, 1, 1, 1,
1.42019, 0.2365163, 0.9765854, 1, 1, 1, 1, 1,
1.420238, 0.347651, 1.759112, 1, 1, 1, 1, 1,
1.422429, 0.2423459, 0.8863919, 1, 1, 1, 1, 1,
1.422531, -0.4500912, 2.717385, 1, 1, 1, 1, 1,
1.425482, -0.9458444, 1.78311, 1, 1, 1, 1, 1,
1.427864, -0.5683568, 1.071419, 1, 1, 1, 1, 1,
1.429778, -0.5143592, 1.293486, 1, 1, 1, 1, 1,
1.43327, -0.2825725, 1.056508, 1, 1, 1, 1, 1,
1.44034, -1.160814, 4.731532, 0, 0, 1, 1, 1,
1.443222, 0.1173639, 3.33442, 1, 0, 0, 1, 1,
1.468191, -0.4481933, 0.420481, 1, 0, 0, 1, 1,
1.470648, 1.015898, 0.5020642, 1, 0, 0, 1, 1,
1.472261, -0.3723204, 1.325641, 1, 0, 0, 1, 1,
1.472668, -0.6108328, -0.3685302, 1, 0, 0, 1, 1,
1.473201, 0.9832823, -0.5354543, 0, 0, 0, 1, 1,
1.480698, 0.8296565, 0.03772587, 0, 0, 0, 1, 1,
1.487612, -0.7860153, 1.435741, 0, 0, 0, 1, 1,
1.4878, -1.028472, 1.52519, 0, 0, 0, 1, 1,
1.489566, -0.06895098, 2.151255, 0, 0, 0, 1, 1,
1.494401, -0.2943544, 1.751423, 0, 0, 0, 1, 1,
1.496976, 0.8734142, -0.4862278, 0, 0, 0, 1, 1,
1.513093, -1.285881, 2.329085, 1, 1, 1, 1, 1,
1.513377, 0.4176743, 0.5528961, 1, 1, 1, 1, 1,
1.514411, -0.07925525, 2.167934, 1, 1, 1, 1, 1,
1.529318, -0.5421466, 0.9135776, 1, 1, 1, 1, 1,
1.53353, -0.6082015, 3.558491, 1, 1, 1, 1, 1,
1.536112, 1.502397, 1.648133, 1, 1, 1, 1, 1,
1.540945, -1.058004, 1.426771, 1, 1, 1, 1, 1,
1.544341, -1.82531, 1.38138, 1, 1, 1, 1, 1,
1.558552, -0.08351916, 2.235134, 1, 1, 1, 1, 1,
1.566124, 1.710711, -0.05343178, 1, 1, 1, 1, 1,
1.575004, -0.5815179, 1.194857, 1, 1, 1, 1, 1,
1.577221, -0.6495554, 3.512092, 1, 1, 1, 1, 1,
1.626386, 0.1430934, 0.8551272, 1, 1, 1, 1, 1,
1.635591, -1.016631, 1.483737, 1, 1, 1, 1, 1,
1.635865, 0.5608678, 1.812956, 1, 1, 1, 1, 1,
1.657707, -0.1054114, 1.064652, 0, 0, 1, 1, 1,
1.659719, 0.6223997, -0.1095277, 1, 0, 0, 1, 1,
1.668059, 1.763261, 0.2312876, 1, 0, 0, 1, 1,
1.669167, 0.07004881, 1.688405, 1, 0, 0, 1, 1,
1.706846, 1.207278, 0.7922357, 1, 0, 0, 1, 1,
1.711081, -0.4946025, 0.66664, 1, 0, 0, 1, 1,
1.711604, 0.8261927, 0.3879614, 0, 0, 0, 1, 1,
1.753683, -0.6019613, 3.570746, 0, 0, 0, 1, 1,
1.75653, 1.394755, 2.072423, 0, 0, 0, 1, 1,
1.758935, 0.6462308, 0.1475873, 0, 0, 0, 1, 1,
1.80408, -0.2454908, 1.429871, 0, 0, 0, 1, 1,
1.81438, -2.748461, 1.415301, 0, 0, 0, 1, 1,
1.831722, 0.2701841, 2.033381, 0, 0, 0, 1, 1,
1.83706, 0.7154883, 0.8690352, 1, 1, 1, 1, 1,
1.838661, -1.080344, 2.251761, 1, 1, 1, 1, 1,
1.860117, 0.5782953, 0.3677417, 1, 1, 1, 1, 1,
1.879328, -0.5507317, 2.374875, 1, 1, 1, 1, 1,
1.884643, 0.3739368, 0.5125023, 1, 1, 1, 1, 1,
1.891659, -0.9742573, 1.770609, 1, 1, 1, 1, 1,
1.897871, 0.6018636, 1.896773, 1, 1, 1, 1, 1,
1.913186, -0.2788475, 1.553889, 1, 1, 1, 1, 1,
1.94589, 0.7561207, 0.3740518, 1, 1, 1, 1, 1,
1.95303, 1.943172, 0.257274, 1, 1, 1, 1, 1,
1.969127, 0.4936703, 1.998641, 1, 1, 1, 1, 1,
1.971588, 1.372996, -0.4375128, 1, 1, 1, 1, 1,
1.995596, -0.7514, 2.739615, 1, 1, 1, 1, 1,
1.996658, -0.2410461, 0.7112418, 1, 1, 1, 1, 1,
1.997257, -1.530974, 2.55555, 1, 1, 1, 1, 1,
2.02211, 1.893289, 0.1546066, 0, 0, 1, 1, 1,
2.029592, 1.087771, 0.07717986, 1, 0, 0, 1, 1,
2.030167, -0.2311841, -0.5819569, 1, 0, 0, 1, 1,
2.059185, -0.4812292, 0.6505433, 1, 0, 0, 1, 1,
2.114094, 0.2849765, 1.621441, 1, 0, 0, 1, 1,
2.163395, -1.788977, 1.581362, 1, 0, 0, 1, 1,
2.188515, -0.7638465, 2.969902, 0, 0, 0, 1, 1,
2.224161, -0.5089258, 1.657323, 0, 0, 0, 1, 1,
2.228685, -0.644317, 1.80488, 0, 0, 0, 1, 1,
2.243782, -0.2802873, 2.916617, 0, 0, 0, 1, 1,
2.251396, 1.123372, -0.2503687, 0, 0, 0, 1, 1,
2.29834, -2.117253, 1.699525, 0, 0, 0, 1, 1,
2.315467, 1.037668, 1.685404, 0, 0, 0, 1, 1,
2.339811, -0.0206651, 3.065394, 1, 1, 1, 1, 1,
2.430323, 0.6362641, 2.479072, 1, 1, 1, 1, 1,
2.502724, 0.001712688, 1.407723, 1, 1, 1, 1, 1,
2.508426, 0.7037592, 1.23881, 1, 1, 1, 1, 1,
2.523131, -1.007875, 1.7494, 1, 1, 1, 1, 1,
2.79293, 0.01606073, 3.133693, 1, 1, 1, 1, 1,
3.116023, -1.2296, 1.087233, 1, 1, 1, 1, 1
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
var radius = 9.653849;
var distance = 33.90873;
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
mvMatrix.translate( -0.06860924, -0.1337278, 0.2720752 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.90873);
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
