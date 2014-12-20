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
-3.017409, 0.255704, -1.020769, 1, 0, 0, 1,
-2.829812, 1.643717, 0.4595405, 1, 0.007843138, 0, 1,
-2.796913, -1.253899, -2.410135, 1, 0.01176471, 0, 1,
-2.772021, -0.4882765, -0.6794178, 1, 0.01960784, 0, 1,
-2.603284, -0.9794988, -0.2820721, 1, 0.02352941, 0, 1,
-2.539375, -0.8525427, -1.423755, 1, 0.03137255, 0, 1,
-2.525008, -1.61785, -2.841239, 1, 0.03529412, 0, 1,
-2.445509, -0.2970952, -2.490758, 1, 0.04313726, 0, 1,
-2.445148, -0.6227517, -0.7561488, 1, 0.04705882, 0, 1,
-2.417769, 0.6522014, -1.189597, 1, 0.05490196, 0, 1,
-2.344109, 0.1109232, -1.4144, 1, 0.05882353, 0, 1,
-2.336128, -0.1548811, -0.897152, 1, 0.06666667, 0, 1,
-2.324047, 0.3990804, -1.003776, 1, 0.07058824, 0, 1,
-2.29373, -0.3984615, 0.3289059, 1, 0.07843138, 0, 1,
-2.280764, 0.03022605, -3.281476, 1, 0.08235294, 0, 1,
-2.214375, -0.7210253, -1.651066, 1, 0.09019608, 0, 1,
-2.185248, 0.3717943, -1.943779, 1, 0.09411765, 0, 1,
-2.176123, 0.4417655, -2.253437, 1, 0.1019608, 0, 1,
-2.15889, -0.6210079, -1.860064, 1, 0.1098039, 0, 1,
-2.149999, 0.990017, -1.331581, 1, 0.1137255, 0, 1,
-2.147537, -0.5606632, -2.14299, 1, 0.1215686, 0, 1,
-2.144415, -0.7365402, -1.105052, 1, 0.1254902, 0, 1,
-2.129847, -0.07668447, -2.150379, 1, 0.1333333, 0, 1,
-2.120652, -0.3016902, -1.500693, 1, 0.1372549, 0, 1,
-2.105758, 0.9227513, -2.138647, 1, 0.145098, 0, 1,
-2.09158, -1.526964, -2.518432, 1, 0.1490196, 0, 1,
-2.030843, 0.7253612, -0.958788, 1, 0.1568628, 0, 1,
-2.014586, -1.23517, -2.608914, 1, 0.1607843, 0, 1,
-2.008199, 0.01749386, 0.06762914, 1, 0.1686275, 0, 1,
-1.986039, 2.05133, -1.169563, 1, 0.172549, 0, 1,
-1.975669, -0.6871457, -0.5598835, 1, 0.1803922, 0, 1,
-1.970831, -0.7924405, -2.019671, 1, 0.1843137, 0, 1,
-1.929452, -0.7313277, -1.497505, 1, 0.1921569, 0, 1,
-1.925095, 0.9290509, -2.606862, 1, 0.1960784, 0, 1,
-1.909847, 1.095338, -0.9139357, 1, 0.2039216, 0, 1,
-1.893165, -0.01144225, -0.806927, 1, 0.2117647, 0, 1,
-1.880659, 0.1692857, -1.743537, 1, 0.2156863, 0, 1,
-1.869209, -0.0188417, -2.676578, 1, 0.2235294, 0, 1,
-1.866052, 0.6016018, 0.2605203, 1, 0.227451, 0, 1,
-1.864157, 0.7631259, 0.2443631, 1, 0.2352941, 0, 1,
-1.857832, 0.6876725, -2.097414, 1, 0.2392157, 0, 1,
-1.837265, -0.6423953, -4.225257, 1, 0.2470588, 0, 1,
-1.836922, 0.8212244, -1.092298, 1, 0.2509804, 0, 1,
-1.820865, -0.3151325, -1.148307, 1, 0.2588235, 0, 1,
-1.816103, -0.2172585, -2.042893, 1, 0.2627451, 0, 1,
-1.804497, 0.2869121, -3.72385, 1, 0.2705882, 0, 1,
-1.800191, 2.028287, -1.168341, 1, 0.2745098, 0, 1,
-1.791949, -1.951344, -3.1233, 1, 0.282353, 0, 1,
-1.791944, 1.500997, -0.1181637, 1, 0.2862745, 0, 1,
-1.79072, -0.1038799, -1.769785, 1, 0.2941177, 0, 1,
-1.78098, -0.3128766, -1.562406, 1, 0.3019608, 0, 1,
-1.776277, -0.2494772, -0.844283, 1, 0.3058824, 0, 1,
-1.771705, 0.1028842, -1.375538, 1, 0.3137255, 0, 1,
-1.770732, -1.417085, -3.475288, 1, 0.3176471, 0, 1,
-1.758168, -0.3377682, -1.579393, 1, 0.3254902, 0, 1,
-1.748188, -0.7890053, -4.39537, 1, 0.3294118, 0, 1,
-1.747339, -1.15889, -1.370867, 1, 0.3372549, 0, 1,
-1.740116, -0.5516706, -2.199009, 1, 0.3411765, 0, 1,
-1.713982, -1.112239, -1.40881, 1, 0.3490196, 0, 1,
-1.707387, 0.8821759, -1.286271, 1, 0.3529412, 0, 1,
-1.69905, -0.7528455, -3.088627, 1, 0.3607843, 0, 1,
-1.691774, 0.9145562, -2.622409, 1, 0.3647059, 0, 1,
-1.684554, 0.6690243, 0.5835471, 1, 0.372549, 0, 1,
-1.67029, -1.775685, -2.230019, 1, 0.3764706, 0, 1,
-1.658108, 0.1546606, -2.855267, 1, 0.3843137, 0, 1,
-1.653322, -1.111795, -2.534174, 1, 0.3882353, 0, 1,
-1.651114, 0.8610089, -0.5903719, 1, 0.3960784, 0, 1,
-1.647902, 0.1876722, -2.498302, 1, 0.4039216, 0, 1,
-1.622661, -0.6018999, 0.5979092, 1, 0.4078431, 0, 1,
-1.587656, -0.5766391, -1.36574, 1, 0.4156863, 0, 1,
-1.580491, -1.159707, -1.878621, 1, 0.4196078, 0, 1,
-1.580137, -0.1973677, -2.502329, 1, 0.427451, 0, 1,
-1.575262, -0.4453912, -1.776967, 1, 0.4313726, 0, 1,
-1.574229, 0.5496168, -1.097024, 1, 0.4392157, 0, 1,
-1.561944, 0.05182986, -1.013865, 1, 0.4431373, 0, 1,
-1.535715, 0.9766604, -0.5371015, 1, 0.4509804, 0, 1,
-1.529319, -0.9891065, -1.488699, 1, 0.454902, 0, 1,
-1.514332, -0.1115337, -1.825741, 1, 0.4627451, 0, 1,
-1.503738, 1.360158, -1.096022, 1, 0.4666667, 0, 1,
-1.485134, 0.3133632, 0.3219191, 1, 0.4745098, 0, 1,
-1.484372, 2.127325, -2.024704, 1, 0.4784314, 0, 1,
-1.480466, 0.5526481, -0.434428, 1, 0.4862745, 0, 1,
-1.46225, -0.2994609, -0.9389499, 1, 0.4901961, 0, 1,
-1.460128, 0.3686927, -1.122345, 1, 0.4980392, 0, 1,
-1.45399, -0.9720387, -2.073369, 1, 0.5058824, 0, 1,
-1.447275, -0.5845417, -3.003523, 1, 0.509804, 0, 1,
-1.445056, 8.568115e-05, -2.366668, 1, 0.5176471, 0, 1,
-1.44364, 1.213536, -0.08083636, 1, 0.5215687, 0, 1,
-1.442107, 2.282348, 0.7195734, 1, 0.5294118, 0, 1,
-1.435941, 1.157826, -3.618016, 1, 0.5333334, 0, 1,
-1.432992, -0.9142519, -2.344241, 1, 0.5411765, 0, 1,
-1.426613, 0.3205378, -3.447245, 1, 0.5450981, 0, 1,
-1.403973, -0.1463219, -2.741167, 1, 0.5529412, 0, 1,
-1.393894, 0.2767255, 0.1418708, 1, 0.5568628, 0, 1,
-1.387329, -0.2858907, -1.947463, 1, 0.5647059, 0, 1,
-1.387225, 0.6648734, -1.078748, 1, 0.5686275, 0, 1,
-1.377451, 1.331884, -0.3654051, 1, 0.5764706, 0, 1,
-1.35187, -0.1560141, -2.936113, 1, 0.5803922, 0, 1,
-1.347684, -0.1263485, -0.01735018, 1, 0.5882353, 0, 1,
-1.344516, -2.154461, -2.717485, 1, 0.5921569, 0, 1,
-1.343389, -0.3448375, -2.68895, 1, 0.6, 0, 1,
-1.338178, 1.409847, -1.465477, 1, 0.6078432, 0, 1,
-1.328175, -1.248515, -1.218483, 1, 0.6117647, 0, 1,
-1.318968, -1.6509, -1.458563, 1, 0.6196079, 0, 1,
-1.310825, -0.545134, -1.154394, 1, 0.6235294, 0, 1,
-1.310554, 0.2706622, -3.439485, 1, 0.6313726, 0, 1,
-1.306599, 1.299378, 0.8576694, 1, 0.6352941, 0, 1,
-1.303852, -1.344679, -0.7754835, 1, 0.6431373, 0, 1,
-1.300403, 1.007707, -0.252116, 1, 0.6470588, 0, 1,
-1.29847, 0.9299238, -1.014254, 1, 0.654902, 0, 1,
-1.294236, -1.242005, -2.443062, 1, 0.6588235, 0, 1,
-1.293954, -1.792138, -2.90264, 1, 0.6666667, 0, 1,
-1.290373, 0.0003099147, -1.959836, 1, 0.6705883, 0, 1,
-1.284877, -0.1260776, -1.121742, 1, 0.6784314, 0, 1,
-1.278839, 0.06240981, -1.473887, 1, 0.682353, 0, 1,
-1.26696, -0.1157142, -2.569542, 1, 0.6901961, 0, 1,
-1.260103, -1.2576, -3.349547, 1, 0.6941177, 0, 1,
-1.256211, 0.4127639, -1.106514, 1, 0.7019608, 0, 1,
-1.254919, 0.05514821, -1.757424, 1, 0.7098039, 0, 1,
-1.253728, 0.992765, 0.440666, 1, 0.7137255, 0, 1,
-1.245803, -0.771136, -3.443386, 1, 0.7215686, 0, 1,
-1.22916, 0.009795259, -0.4952713, 1, 0.7254902, 0, 1,
-1.227737, -0.1789059, -0.4952613, 1, 0.7333333, 0, 1,
-1.227137, -0.1374623, -0.916876, 1, 0.7372549, 0, 1,
-1.209918, -1.638708, -2.928961, 1, 0.7450981, 0, 1,
-1.20362, -0.8700779, -1.984155, 1, 0.7490196, 0, 1,
-1.197293, 1.736811, -0.9032239, 1, 0.7568628, 0, 1,
-1.193911, -1.26143, -2.830219, 1, 0.7607843, 0, 1,
-1.184723, 0.1890457, -2.049258, 1, 0.7686275, 0, 1,
-1.175589, -1.809574, -0.9888197, 1, 0.772549, 0, 1,
-1.173864, -0.4295012, -1.246323, 1, 0.7803922, 0, 1,
-1.152612, -0.2331671, -2.225632, 1, 0.7843137, 0, 1,
-1.151262, 1.069068, 0.5242841, 1, 0.7921569, 0, 1,
-1.150555, 0.7201635, -1.982211, 1, 0.7960784, 0, 1,
-1.140064, 2.142736, 0.1431147, 1, 0.8039216, 0, 1,
-1.136733, 0.07442476, -1.791151, 1, 0.8117647, 0, 1,
-1.135827, 0.9117267, -1.758461, 1, 0.8156863, 0, 1,
-1.134032, -1.151067, -1.463105, 1, 0.8235294, 0, 1,
-1.127682, 0.3494699, -3.251423, 1, 0.827451, 0, 1,
-1.115672, 2.215427, -1.506054, 1, 0.8352941, 0, 1,
-1.115416, 1.548269, 0.3275216, 1, 0.8392157, 0, 1,
-1.102123, -1.648967, -2.366069, 1, 0.8470588, 0, 1,
-1.101709, 0.3521596, -1.428862, 1, 0.8509804, 0, 1,
-1.098314, 0.6515082, -0.8818068, 1, 0.8588235, 0, 1,
-1.096928, -1.615578, -2.250389, 1, 0.8627451, 0, 1,
-1.090918, -0.6830241, -2.006648, 1, 0.8705882, 0, 1,
-1.088387, 2.505088, 0.3987164, 1, 0.8745098, 0, 1,
-1.087769, -0.2548315, -2.623075, 1, 0.8823529, 0, 1,
-1.075137, -0.8437831, -2.057974, 1, 0.8862745, 0, 1,
-1.070025, -0.3773507, -0.8213186, 1, 0.8941177, 0, 1,
-1.068603, -0.1261235, 0.4151567, 1, 0.8980392, 0, 1,
-1.058937, -0.7756803, -3.096618, 1, 0.9058824, 0, 1,
-1.052636, 0.5903263, -0.5327442, 1, 0.9137255, 0, 1,
-1.043769, 0.2818018, -1.496725, 1, 0.9176471, 0, 1,
-1.036926, 0.06249059, -1.248943, 1, 0.9254902, 0, 1,
-1.036877, -1.629752, -1.694901, 1, 0.9294118, 0, 1,
-1.032531, 0.4056526, -2.120538, 1, 0.9372549, 0, 1,
-1.03246, 2.05991, 2.235283, 1, 0.9411765, 0, 1,
-1.029359, -0.7608067, -3.312518, 1, 0.9490196, 0, 1,
-1.021967, 0.2677941, -1.223285, 1, 0.9529412, 0, 1,
-1.016201, 0.9510548, -0.3324924, 1, 0.9607843, 0, 1,
-1.012581, 1.117416, -0.08047431, 1, 0.9647059, 0, 1,
-1.009982, -0.07533155, -0.7740025, 1, 0.972549, 0, 1,
-1.00119, -1.113995, -1.359318, 1, 0.9764706, 0, 1,
-0.9860529, 0.6340588, -0.4845852, 1, 0.9843137, 0, 1,
-0.978487, 1.632027, -0.3095636, 1, 0.9882353, 0, 1,
-0.9781455, 1.474081, -0.8060282, 1, 0.9960784, 0, 1,
-0.9731017, -1.455403, -2.040377, 0.9960784, 1, 0, 1,
-0.9691985, 1.733316, 0.9693494, 0.9921569, 1, 0, 1,
-0.9649808, -0.3936661, -1.98033, 0.9843137, 1, 0, 1,
-0.9644393, -0.4335474, -2.25699, 0.9803922, 1, 0, 1,
-0.9631342, -0.3927266, -2.059299, 0.972549, 1, 0, 1,
-0.9621843, -0.4655264, -3.15071, 0.9686275, 1, 0, 1,
-0.9605612, 0.0357688, -1.53481, 0.9607843, 1, 0, 1,
-0.9579142, 1.955554, -2.051636, 0.9568627, 1, 0, 1,
-0.9470431, -1.007685, -1.976051, 0.9490196, 1, 0, 1,
-0.9462287, -1.966793, -3.012958, 0.945098, 1, 0, 1,
-0.943383, 0.1246088, -2.221307, 0.9372549, 1, 0, 1,
-0.9423847, 0.7938926, -1.637177, 0.9333333, 1, 0, 1,
-0.9394526, -1.162362, -2.309443, 0.9254902, 1, 0, 1,
-0.9364538, 0.1492313, -1.04521, 0.9215686, 1, 0, 1,
-0.9355364, 0.3164864, -3.393111, 0.9137255, 1, 0, 1,
-0.9325693, 1.363592, -1.895705, 0.9098039, 1, 0, 1,
-0.9311765, 0.09605128, -1.023604, 0.9019608, 1, 0, 1,
-0.9307802, 0.4779386, -0.5988457, 0.8941177, 1, 0, 1,
-0.9272225, -1.59894, -1.16374, 0.8901961, 1, 0, 1,
-0.927008, -1.313204, -2.094728, 0.8823529, 1, 0, 1,
-0.9256428, -0.6249841, -4.524726, 0.8784314, 1, 0, 1,
-0.9213049, -0.6433935, -1.427505, 0.8705882, 1, 0, 1,
-0.9196091, -0.349211, -3.306899, 0.8666667, 1, 0, 1,
-0.9183719, 0.6665035, -0.9191657, 0.8588235, 1, 0, 1,
-0.9182426, 1.217137, -0.2785444, 0.854902, 1, 0, 1,
-0.9169874, 0.7462613, -0.927975, 0.8470588, 1, 0, 1,
-0.911911, -0.6057688, -0.8480839, 0.8431373, 1, 0, 1,
-0.9091768, 0.2890565, -0.1115453, 0.8352941, 1, 0, 1,
-0.908073, -0.6681643, -2.090602, 0.8313726, 1, 0, 1,
-0.9068006, 0.2842166, -1.173998, 0.8235294, 1, 0, 1,
-0.9064772, 1.897971, -0.5422189, 0.8196079, 1, 0, 1,
-0.9016123, 0.9627008, 0.1598624, 0.8117647, 1, 0, 1,
-0.9009853, -1.766569, -3.453825, 0.8078431, 1, 0, 1,
-0.8977091, 0.3312172, -0.902586, 0.8, 1, 0, 1,
-0.8902764, 0.1687549, -0.3742376, 0.7921569, 1, 0, 1,
-0.886187, 0.6361692, 0.1469356, 0.7882353, 1, 0, 1,
-0.8806989, -0.1296906, -2.050811, 0.7803922, 1, 0, 1,
-0.8775285, 0.6182799, -0.5546123, 0.7764706, 1, 0, 1,
-0.8771439, 0.9570639, 0.05569934, 0.7686275, 1, 0, 1,
-0.8757039, -0.1560481, -0.4232158, 0.7647059, 1, 0, 1,
-0.8756058, -0.2597154, -1.975053, 0.7568628, 1, 0, 1,
-0.8722589, 0.7646637, -2.699784, 0.7529412, 1, 0, 1,
-0.8687055, 0.5695661, -0.9696973, 0.7450981, 1, 0, 1,
-0.8663846, 0.06003127, 0.1357507, 0.7411765, 1, 0, 1,
-0.8507315, -1.667127, -2.059761, 0.7333333, 1, 0, 1,
-0.8462108, 0.2495903, -1.406147, 0.7294118, 1, 0, 1,
-0.8425863, -0.6731377, -2.275275, 0.7215686, 1, 0, 1,
-0.8383157, -1.246888, -1.429502, 0.7176471, 1, 0, 1,
-0.8367153, 1.345973, -0.3018264, 0.7098039, 1, 0, 1,
-0.8273702, -0.6822679, -0.7736236, 0.7058824, 1, 0, 1,
-0.815339, 0.6094629, -2.061407, 0.6980392, 1, 0, 1,
-0.8099871, 0.08663941, -3.75308, 0.6901961, 1, 0, 1,
-0.809168, 0.5849937, -0.7190586, 0.6862745, 1, 0, 1,
-0.8054562, -0.1712479, -2.434571, 0.6784314, 1, 0, 1,
-0.8038647, 0.07226489, -0.2500797, 0.6745098, 1, 0, 1,
-0.8012679, 1.399735, -1.69802, 0.6666667, 1, 0, 1,
-0.7998046, 1.705111, -0.1384978, 0.6627451, 1, 0, 1,
-0.7989717, -0.3343906, -1.916473, 0.654902, 1, 0, 1,
-0.7984946, -0.03997668, -0.8822833, 0.6509804, 1, 0, 1,
-0.795783, -3.05465, -2.426598, 0.6431373, 1, 0, 1,
-0.7919567, 1.119641, -1.860585, 0.6392157, 1, 0, 1,
-0.7859709, 0.9396536, 1.086079, 0.6313726, 1, 0, 1,
-0.7837881, 0.7405474, -1.997889, 0.627451, 1, 0, 1,
-0.7821923, -1.746464, -2.686084, 0.6196079, 1, 0, 1,
-0.7806435, -1.569619, -1.805406, 0.6156863, 1, 0, 1,
-0.7654487, 1.805272, -0.5432494, 0.6078432, 1, 0, 1,
-0.7641996, -0.1783779, -0.7377489, 0.6039216, 1, 0, 1,
-0.7630112, 1.185359, 0.01019316, 0.5960785, 1, 0, 1,
-0.76167, -1.300208, -4.201456, 0.5882353, 1, 0, 1,
-0.7601273, 0.4475189, -2.198098, 0.5843138, 1, 0, 1,
-0.7507131, 0.3119013, -0.5271676, 0.5764706, 1, 0, 1,
-0.729665, -1.126797, -3.33652, 0.572549, 1, 0, 1,
-0.723143, -0.4836697, -1.576349, 0.5647059, 1, 0, 1,
-0.722131, 0.3475194, -2.764413, 0.5607843, 1, 0, 1,
-0.7216118, -0.4815013, -2.186545, 0.5529412, 1, 0, 1,
-0.7149818, -2.558453, -2.561358, 0.5490196, 1, 0, 1,
-0.7118646, -2.223533, -1.85807, 0.5411765, 1, 0, 1,
-0.7057799, -0.7487802, -3.996687, 0.5372549, 1, 0, 1,
-0.700954, 0.7257726, -0.9796864, 0.5294118, 1, 0, 1,
-0.6947629, 1.341673, -0.2503312, 0.5254902, 1, 0, 1,
-0.6943965, -2.753393, -2.893713, 0.5176471, 1, 0, 1,
-0.6910492, -1.910443, -3.806678, 0.5137255, 1, 0, 1,
-0.6909901, 1.253738, -0.7069229, 0.5058824, 1, 0, 1,
-0.6868584, 0.7523149, 0.1596812, 0.5019608, 1, 0, 1,
-0.682358, -0.1527316, -0.9004811, 0.4941176, 1, 0, 1,
-0.6794369, 0.3776598, -2.260715, 0.4862745, 1, 0, 1,
-0.6791198, -0.4875853, -0.9998274, 0.4823529, 1, 0, 1,
-0.6760262, -0.6016571, -1.538487, 0.4745098, 1, 0, 1,
-0.6753894, -1.097871, -2.979205, 0.4705882, 1, 0, 1,
-0.6703166, -1.098179, -1.383311, 0.4627451, 1, 0, 1,
-0.6696267, 0.02666286, -1.805795, 0.4588235, 1, 0, 1,
-0.6687191, 1.04224, -2.50222, 0.4509804, 1, 0, 1,
-0.6660991, 0.8388997, -0.43884, 0.4470588, 1, 0, 1,
-0.6646047, 0.493784, -1.289712, 0.4392157, 1, 0, 1,
-0.6641899, -2.175656, -2.891883, 0.4352941, 1, 0, 1,
-0.663266, -2.205485, -2.289062, 0.427451, 1, 0, 1,
-0.657155, 1.84917, -0.02913309, 0.4235294, 1, 0, 1,
-0.6564695, 0.5830467, -1.483236, 0.4156863, 1, 0, 1,
-0.6411434, -0.8582884, -3.304706, 0.4117647, 1, 0, 1,
-0.6402435, 0.524646, -1.500685, 0.4039216, 1, 0, 1,
-0.6394808, 0.5223661, -0.9697148, 0.3960784, 1, 0, 1,
-0.6345175, -0.8930644, -2.384365, 0.3921569, 1, 0, 1,
-0.6326102, 1.048573, 1.247814, 0.3843137, 1, 0, 1,
-0.6275762, -0.48985, -1.786431, 0.3803922, 1, 0, 1,
-0.6252505, 0.8215175, -0.4569934, 0.372549, 1, 0, 1,
-0.6213289, -0.8446644, -2.815957, 0.3686275, 1, 0, 1,
-0.6191267, -0.379581, -2.841274, 0.3607843, 1, 0, 1,
-0.6113055, -0.1507815, -2.011889, 0.3568628, 1, 0, 1,
-0.6082857, -0.1568715, -2.973481, 0.3490196, 1, 0, 1,
-0.6042795, 0.6748167, -1.114649, 0.345098, 1, 0, 1,
-0.6038734, -2.42382, -2.060499, 0.3372549, 1, 0, 1,
-0.6007418, -0.5454807, -3.836062, 0.3333333, 1, 0, 1,
-0.6006281, 1.376607, -1.410002, 0.3254902, 1, 0, 1,
-0.5906501, 0.7950073, -1.456202, 0.3215686, 1, 0, 1,
-0.5897822, -1.571341, -2.108054, 0.3137255, 1, 0, 1,
-0.5846955, -0.1703661, -0.1781019, 0.3098039, 1, 0, 1,
-0.580044, -2.217875, -3.400676, 0.3019608, 1, 0, 1,
-0.5747198, 2.247747, -0.3494001, 0.2941177, 1, 0, 1,
-0.5746415, -0.1419034, -1.160764, 0.2901961, 1, 0, 1,
-0.5596389, -0.5802116, -3.368694, 0.282353, 1, 0, 1,
-0.5579382, -1.129584, -2.527487, 0.2784314, 1, 0, 1,
-0.5564463, -1.287143, -2.553596, 0.2705882, 1, 0, 1,
-0.5554541, 0.1782874, -2.029553, 0.2666667, 1, 0, 1,
-0.5509783, 0.03375841, -0.7639703, 0.2588235, 1, 0, 1,
-0.5505068, -0.8807349, -3.626338, 0.254902, 1, 0, 1,
-0.5489025, -1.445529, -3.098197, 0.2470588, 1, 0, 1,
-0.5481342, 1.038482, -2.536113, 0.2431373, 1, 0, 1,
-0.5476158, 0.8636782, -2.415766, 0.2352941, 1, 0, 1,
-0.5413415, -0.2532445, -2.838901, 0.2313726, 1, 0, 1,
-0.5363852, 0.4836226, -1.232769, 0.2235294, 1, 0, 1,
-0.5349696, 0.9463575, 1.58424, 0.2196078, 1, 0, 1,
-0.5347829, -0.1103831, -2.149689, 0.2117647, 1, 0, 1,
-0.5333136, 0.01923009, -2.815963, 0.2078431, 1, 0, 1,
-0.5320868, 0.9617818, 0.636359, 0.2, 1, 0, 1,
-0.527531, 0.8932103, -1.402895, 0.1921569, 1, 0, 1,
-0.5250861, -1.273714, -3.029399, 0.1882353, 1, 0, 1,
-0.5210039, -1.460844, -1.784783, 0.1803922, 1, 0, 1,
-0.5203142, 1.602382, -1.021212, 0.1764706, 1, 0, 1,
-0.51842, 0.2879156, -1.738804, 0.1686275, 1, 0, 1,
-0.5174955, -0.8685136, -3.347559, 0.1647059, 1, 0, 1,
-0.514369, 0.7303877, -1.347519, 0.1568628, 1, 0, 1,
-0.5127243, -0.1235499, -1.878132, 0.1529412, 1, 0, 1,
-0.5114791, -0.2644752, -2.221881, 0.145098, 1, 0, 1,
-0.5109423, 1.004947, -0.156604, 0.1411765, 1, 0, 1,
-0.5108135, 0.5381281, -1.535839, 0.1333333, 1, 0, 1,
-0.5095737, 1.806282, -0.7298462, 0.1294118, 1, 0, 1,
-0.50881, -2.077673, -2.451281, 0.1215686, 1, 0, 1,
-0.5079996, -0.9951422, -2.040213, 0.1176471, 1, 0, 1,
-0.5069605, -0.3467837, -2.149588, 0.1098039, 1, 0, 1,
-0.5040118, 1.414836, -0.7174856, 0.1058824, 1, 0, 1,
-0.5019929, 0.8593516, -1.332637, 0.09803922, 1, 0, 1,
-0.5011312, 2.103294, 1.348238, 0.09019608, 1, 0, 1,
-0.5006751, -2.179753, -3.210807, 0.08627451, 1, 0, 1,
-0.494346, -1.306404, -2.090362, 0.07843138, 1, 0, 1,
-0.4940323, -1.568654, -2.824612, 0.07450981, 1, 0, 1,
-0.4915327, -0.4895459, -2.755509, 0.06666667, 1, 0, 1,
-0.4891084, 0.002754381, -2.383225, 0.0627451, 1, 0, 1,
-0.4868827, -1.370929, -2.915306, 0.05490196, 1, 0, 1,
-0.4848434, -0.5717319, -1.706531, 0.05098039, 1, 0, 1,
-0.4806126, 0.6465101, 0.9864866, 0.04313726, 1, 0, 1,
-0.4794079, 0.5898771, 0.3791782, 0.03921569, 1, 0, 1,
-0.4738187, 0.832229, -0.7865899, 0.03137255, 1, 0, 1,
-0.4723415, -1.138098, -2.665657, 0.02745098, 1, 0, 1,
-0.4712693, -0.2864769, -2.165642, 0.01960784, 1, 0, 1,
-0.4630746, 0.01187127, -2.127359, 0.01568628, 1, 0, 1,
-0.4616114, 1.078783, 0.3275429, 0.007843138, 1, 0, 1,
-0.4574484, -1.059943, -3.744528, 0.003921569, 1, 0, 1,
-0.4513125, -0.9768037, -4.276412, 0, 1, 0.003921569, 1,
-0.4369585, -0.6748269, -1.625512, 0, 1, 0.01176471, 1,
-0.4347256, -0.2201184, -2.258775, 0, 1, 0.01568628, 1,
-0.4310462, 1.561891, -0.1861532, 0, 1, 0.02352941, 1,
-0.4289201, -0.7900012, -3.531593, 0, 1, 0.02745098, 1,
-0.4257018, -0.5467153, -2.243381, 0, 1, 0.03529412, 1,
-0.4231941, -0.1543311, -2.398022, 0, 1, 0.03921569, 1,
-0.422627, 3.082152, 2.761896, 0, 1, 0.04705882, 1,
-0.4213589, 2.84031, 0.04608528, 0, 1, 0.05098039, 1,
-0.4060812, 0.5329341, -1.566363, 0, 1, 0.05882353, 1,
-0.3997059, -0.07334312, -0.2387239, 0, 1, 0.0627451, 1,
-0.3990656, -1.358425, -4.69463, 0, 1, 0.07058824, 1,
-0.3980658, 0.4176339, -1.107549, 0, 1, 0.07450981, 1,
-0.3938205, 2.28735, -1.751073, 0, 1, 0.08235294, 1,
-0.3930685, -0.8794584, -1.107295, 0, 1, 0.08627451, 1,
-0.3926925, -0.4408387, -2.163679, 0, 1, 0.09411765, 1,
-0.3905931, 1.831278, -0.2000629, 0, 1, 0.1019608, 1,
-0.389749, -1.875699, -3.210761, 0, 1, 0.1058824, 1,
-0.3870364, 0.7723072, -0.6613932, 0, 1, 0.1137255, 1,
-0.3869635, -0.4113262, -2.863195, 0, 1, 0.1176471, 1,
-0.3863869, 1.087443, 0.7000477, 0, 1, 0.1254902, 1,
-0.3842682, 0.2089518, -1.404437, 0, 1, 0.1294118, 1,
-0.3829343, -0.2426628, -0.906426, 0, 1, 0.1372549, 1,
-0.3823753, -1.200139, -4.117708, 0, 1, 0.1411765, 1,
-0.3787634, 0.7337755, -1.262679, 0, 1, 0.1490196, 1,
-0.3744034, 0.9901771, 0.08670462, 0, 1, 0.1529412, 1,
-0.3728769, -1.056165, -3.077854, 0, 1, 0.1607843, 1,
-0.3723149, -1.090881, -2.90346, 0, 1, 0.1647059, 1,
-0.3682459, 0.07881762, -1.79004, 0, 1, 0.172549, 1,
-0.3654475, 0.1512551, -1.900046, 0, 1, 0.1764706, 1,
-0.360838, 0.7182466, -1.13304, 0, 1, 0.1843137, 1,
-0.3602793, 0.2692448, -0.5763033, 0, 1, 0.1882353, 1,
-0.3578919, 1.608191, -1.088969, 0, 1, 0.1960784, 1,
-0.3566861, -1.010786, -5.166484, 0, 1, 0.2039216, 1,
-0.354904, -0.8062433, -2.467913, 0, 1, 0.2078431, 1,
-0.3511976, -0.1201859, -0.5622142, 0, 1, 0.2156863, 1,
-0.34956, 1.098979, 0.3943378, 0, 1, 0.2196078, 1,
-0.3488487, 0.5794958, -1.155461, 0, 1, 0.227451, 1,
-0.3416729, -0.4137573, -2.919743, 0, 1, 0.2313726, 1,
-0.3373621, -0.1008376, -3.065883, 0, 1, 0.2392157, 1,
-0.3318712, 0.6485109, -0.01182981, 0, 1, 0.2431373, 1,
-0.3287689, -2.360099, -2.274652, 0, 1, 0.2509804, 1,
-0.3287099, 0.1541693, -0.1292388, 0, 1, 0.254902, 1,
-0.3252922, 1.961377, 0.2481072, 0, 1, 0.2627451, 1,
-0.3245532, -1.264576, -3.392303, 0, 1, 0.2666667, 1,
-0.3193791, 0.7657636, 2.101783, 0, 1, 0.2745098, 1,
-0.3145818, 0.8391242, -0.09142459, 0, 1, 0.2784314, 1,
-0.3138762, -0.4295197, -3.130483, 0, 1, 0.2862745, 1,
-0.3129932, -0.7346519, -2.205184, 0, 1, 0.2901961, 1,
-0.3081226, -1.040835, -4.383214, 0, 1, 0.2980392, 1,
-0.3041348, 1.219695, 0.9947519, 0, 1, 0.3058824, 1,
-0.301766, 1.477989, 0.2364206, 0, 1, 0.3098039, 1,
-0.2955139, -1.735707, -2.890633, 0, 1, 0.3176471, 1,
-0.2953936, 0.6295428, -2.465082, 0, 1, 0.3215686, 1,
-0.2931627, -0.3909447, -1.702092, 0, 1, 0.3294118, 1,
-0.2844686, -0.2762025, -0.6281023, 0, 1, 0.3333333, 1,
-0.2825973, -0.552196, -2.088976, 0, 1, 0.3411765, 1,
-0.2788717, -2.050161, -3.235024, 0, 1, 0.345098, 1,
-0.2758816, -1.476054, -2.392562, 0, 1, 0.3529412, 1,
-0.2724714, -1.183013, -1.480993, 0, 1, 0.3568628, 1,
-0.26745, 0.2670965, -0.1830433, 0, 1, 0.3647059, 1,
-0.2671197, -0.4258865, -2.039341, 0, 1, 0.3686275, 1,
-0.2656549, 0.4019787, -1.980568, 0, 1, 0.3764706, 1,
-0.2612947, -1.352104, -4.877089, 0, 1, 0.3803922, 1,
-0.2520204, -0.8880479, -0.7451305, 0, 1, 0.3882353, 1,
-0.251789, -2.265967, -2.094341, 0, 1, 0.3921569, 1,
-0.2512268, 0.03170358, -1.982396, 0, 1, 0.4, 1,
-0.2458373, 0.3502527, -0.7920121, 0, 1, 0.4078431, 1,
-0.2426531, 0.7462867, 0.07722298, 0, 1, 0.4117647, 1,
-0.2395119, 0.2499926, -2.831218, 0, 1, 0.4196078, 1,
-0.2390819, 0.2940147, 0.7394418, 0, 1, 0.4235294, 1,
-0.2369919, -1.004675, -2.001135, 0, 1, 0.4313726, 1,
-0.2361071, -0.03481103, -2.324844, 0, 1, 0.4352941, 1,
-0.2359398, -0.4281187, -3.119933, 0, 1, 0.4431373, 1,
-0.235271, -0.4943214, -3.728867, 0, 1, 0.4470588, 1,
-0.2290104, 0.6273454, -0.7009341, 0, 1, 0.454902, 1,
-0.2288336, -0.7044756, -3.574963, 0, 1, 0.4588235, 1,
-0.224455, -1.369599, -2.241241, 0, 1, 0.4666667, 1,
-0.2230024, 0.05991575, -1.049198, 0, 1, 0.4705882, 1,
-0.220693, 0.852993, 0.7932972, 0, 1, 0.4784314, 1,
-0.2200787, 0.9879258, 0.8353935, 0, 1, 0.4823529, 1,
-0.2162727, -1.086174, -4.277839, 0, 1, 0.4901961, 1,
-0.2045967, -1.853796, -3.619018, 0, 1, 0.4941176, 1,
-0.2044232, 1.157162, -2.158986, 0, 1, 0.5019608, 1,
-0.2035343, 0.6680008, 0.3587296, 0, 1, 0.509804, 1,
-0.2020901, 0.01804916, -0.06692811, 0, 1, 0.5137255, 1,
-0.2015726, -0.4023652, -5.023327, 0, 1, 0.5215687, 1,
-0.2011007, -0.4984488, -2.867014, 0, 1, 0.5254902, 1,
-0.1983439, 1.67153, 0.8061918, 0, 1, 0.5333334, 1,
-0.1971352, 0.285421, -1.539775, 0, 1, 0.5372549, 1,
-0.1955054, -0.6295712, -2.976805, 0, 1, 0.5450981, 1,
-0.192782, -0.8178539, -2.125397, 0, 1, 0.5490196, 1,
-0.1920507, 0.2097699, -0.1233341, 0, 1, 0.5568628, 1,
-0.1897724, -0.2818369, -1.723946, 0, 1, 0.5607843, 1,
-0.1893312, -0.03457318, -3.12037, 0, 1, 0.5686275, 1,
-0.1861211, -1.073781, -0.9334726, 0, 1, 0.572549, 1,
-0.1810257, 0.9551933, -0.7373891, 0, 1, 0.5803922, 1,
-0.1793762, -0.124191, -2.71044, 0, 1, 0.5843138, 1,
-0.1766812, -1.768261, -3.327617, 0, 1, 0.5921569, 1,
-0.1680956, 0.3818648, -2.026578, 0, 1, 0.5960785, 1,
-0.1663926, -0.3283084, -4.396531, 0, 1, 0.6039216, 1,
-0.1654205, -0.109809, -0.4822043, 0, 1, 0.6117647, 1,
-0.1634187, 1.51351, -1.113395, 0, 1, 0.6156863, 1,
-0.1572473, -1.261621, -3.383367, 0, 1, 0.6235294, 1,
-0.1556691, -1.688402, -2.500149, 0, 1, 0.627451, 1,
-0.155612, -0.4507825, -4.248948, 0, 1, 0.6352941, 1,
-0.1516646, -0.1448094, -3.023012, 0, 1, 0.6392157, 1,
-0.1512024, -0.9957668, -4.287659, 0, 1, 0.6470588, 1,
-0.1464491, -1.019421, -4.014017, 0, 1, 0.6509804, 1,
-0.145023, -0.3269011, -2.008697, 0, 1, 0.6588235, 1,
-0.1431221, 0.3795901, 0.8537974, 0, 1, 0.6627451, 1,
-0.1412533, -1.344977, -4.389163, 0, 1, 0.6705883, 1,
-0.1398539, -0.2868434, -3.44511, 0, 1, 0.6745098, 1,
-0.1392952, -0.3523083, -2.853771, 0, 1, 0.682353, 1,
-0.1343945, 0.6316407, -0.4136835, 0, 1, 0.6862745, 1,
-0.1332675, -0.2897674, -3.334699, 0, 1, 0.6941177, 1,
-0.1319161, 0.4066269, 0.2346692, 0, 1, 0.7019608, 1,
-0.1314522, -0.937138, -1.796916, 0, 1, 0.7058824, 1,
-0.1305135, -1.258761, -1.501366, 0, 1, 0.7137255, 1,
-0.1262679, -0.4848576, -3.439534, 0, 1, 0.7176471, 1,
-0.1230496, -0.8249899, -1.742778, 0, 1, 0.7254902, 1,
-0.1230151, -0.9479025, -2.987531, 0, 1, 0.7294118, 1,
-0.1228303, 1.75091, 1.941207, 0, 1, 0.7372549, 1,
-0.1227235, -0.9021943, -3.276128, 0, 1, 0.7411765, 1,
-0.1204535, 1.119711, -0.7014927, 0, 1, 0.7490196, 1,
-0.1175237, 0.1685932, -0.7195932, 0, 1, 0.7529412, 1,
-0.1152799, -1.891631, -3.567491, 0, 1, 0.7607843, 1,
-0.1116624, 0.4221537, -1.721706, 0, 1, 0.7647059, 1,
-0.110939, -1.255029, -4.284907, 0, 1, 0.772549, 1,
-0.1079381, 0.9115524, 1.010366, 0, 1, 0.7764706, 1,
-0.1075134, 0.7904399, 0.4450592, 0, 1, 0.7843137, 1,
-0.1022585, 1.125603, 0.5209045, 0, 1, 0.7882353, 1,
-0.09639972, 0.7230994, 1.739246, 0, 1, 0.7960784, 1,
-0.08974427, -0.6156871, -1.915921, 0, 1, 0.8039216, 1,
-0.08681889, -0.2383048, -1.038084, 0, 1, 0.8078431, 1,
-0.08415803, -0.40202, -1.397886, 0, 1, 0.8156863, 1,
-0.08362425, 0.2736279, -0.542329, 0, 1, 0.8196079, 1,
-0.08253081, 0.3898569, -0.5195323, 0, 1, 0.827451, 1,
-0.07394299, 1.729585, 0.8574787, 0, 1, 0.8313726, 1,
-0.0735411, -0.7056273, -1.473044, 0, 1, 0.8392157, 1,
-0.06908926, -0.4572004, -2.3959, 0, 1, 0.8431373, 1,
-0.06306369, -0.5257952, -2.118254, 0, 1, 0.8509804, 1,
-0.06018205, 1.41583, 1.613839, 0, 1, 0.854902, 1,
-0.04910264, -1.826926, -3.53423, 0, 1, 0.8627451, 1,
-0.04664096, 0.04155654, -0.6690907, 0, 1, 0.8666667, 1,
-0.04643259, 1.665537, 0.02227369, 0, 1, 0.8745098, 1,
-0.04577773, 0.09661233, -0.3349975, 0, 1, 0.8784314, 1,
-0.04443675, -0.343529, -3.396389, 0, 1, 0.8862745, 1,
-0.04166, 1.01081, -1.019097, 0, 1, 0.8901961, 1,
-0.03978378, -0.2905054, -3.519957, 0, 1, 0.8980392, 1,
-0.03595033, -1.794246, -1.331256, 0, 1, 0.9058824, 1,
-0.03527714, 1.186222, 1.78548, 0, 1, 0.9098039, 1,
-0.03526273, -0.7115927, -4.119584, 0, 1, 0.9176471, 1,
-0.03433665, -0.5948884, -4.23585, 0, 1, 0.9215686, 1,
-0.032877, -2.479628, -2.797772, 0, 1, 0.9294118, 1,
-0.02879252, -0.3577091, -1.011607, 0, 1, 0.9333333, 1,
-0.02727985, 0.920013, -0.9770555, 0, 1, 0.9411765, 1,
-0.02718532, -0.8527637, -4.034076, 0, 1, 0.945098, 1,
-0.02595243, 0.3052059, -0.8981713, 0, 1, 0.9529412, 1,
-0.02417089, 0.3321596, 1.964499, 0, 1, 0.9568627, 1,
-0.02205747, -1.024865, -3.736441, 0, 1, 0.9647059, 1,
-0.02046976, 1.301098, -0.2948475, 0, 1, 0.9686275, 1,
-0.01973529, 0.8183504, 0.7316826, 0, 1, 0.9764706, 1,
-0.01666549, 0.3195739, -0.4828945, 0, 1, 0.9803922, 1,
-0.01617672, -0.6564992, -0.785041, 0, 1, 0.9882353, 1,
-0.01476459, -0.5425472, -4.709895, 0, 1, 0.9921569, 1,
-0.01385706, -0.1949004, -5.729572, 0, 1, 1, 1,
-0.01378394, -0.2567253, -5.572554, 0, 0.9921569, 1, 1,
-0.007770029, 1.803197, -0.6479523, 0, 0.9882353, 1, 1,
-0.007363128, 0.4155303, -0.2567306, 0, 0.9803922, 1, 1,
-0.006770919, -0.1129808, -4.534638, 0, 0.9764706, 1, 1,
-0.0055358, -0.5598226, -1.570113, 0, 0.9686275, 1, 1,
-0.004438651, 1.215169, 1.001277, 0, 0.9647059, 1, 1,
-0.0005927554, -0.003036462, -3.342983, 0, 0.9568627, 1, 1,
0.003016908, -1.220949, 3.804027, 0, 0.9529412, 1, 1,
0.004398135, -1.072933, 4.226705, 0, 0.945098, 1, 1,
0.01153392, 1.262931, 1.700849, 0, 0.9411765, 1, 1,
0.01327721, 0.5378311, 0.9446702, 0, 0.9333333, 1, 1,
0.01752606, -0.7721286, 3.356971, 0, 0.9294118, 1, 1,
0.01939211, 0.05859238, 0.2263453, 0, 0.9215686, 1, 1,
0.02478278, -0.4108175, 4.750651, 0, 0.9176471, 1, 1,
0.02482809, 1.336344, 1.326646, 0, 0.9098039, 1, 1,
0.0285056, 0.2635567, -0.5784263, 0, 0.9058824, 1, 1,
0.03152369, 0.6157137, -0.9129947, 0, 0.8980392, 1, 1,
0.03186815, -0.6032007, 3.118777, 0, 0.8901961, 1, 1,
0.03693406, 1.712207, 0.1457392, 0, 0.8862745, 1, 1,
0.0373507, -0.02091312, 1.718469, 0, 0.8784314, 1, 1,
0.03848906, -0.1455704, 3.527202, 0, 0.8745098, 1, 1,
0.04204149, -0.6663843, 3.536186, 0, 0.8666667, 1, 1,
0.04244333, 0.3274381, -0.8850582, 0, 0.8627451, 1, 1,
0.04610771, -1.094923, 1.820417, 0, 0.854902, 1, 1,
0.04730614, -0.1845884, 3.06014, 0, 0.8509804, 1, 1,
0.04741487, -1.096169, 4.692635, 0, 0.8431373, 1, 1,
0.04753787, -1.150512, 2.064688, 0, 0.8392157, 1, 1,
0.04950394, 1.510802, 1.021494, 0, 0.8313726, 1, 1,
0.05119012, -0.118095, 3.181033, 0, 0.827451, 1, 1,
0.05982552, -0.7243571, 4.465203, 0, 0.8196079, 1, 1,
0.05998465, 1.995771, 0.7187366, 0, 0.8156863, 1, 1,
0.05999809, -0.5767838, 2.32443, 0, 0.8078431, 1, 1,
0.06109697, 0.230114, -0.08343389, 0, 0.8039216, 1, 1,
0.06262207, -1.152493, 2.732247, 0, 0.7960784, 1, 1,
0.06745569, -1.165135, 2.232339, 0, 0.7882353, 1, 1,
0.07357204, -0.4709836, 3.202915, 0, 0.7843137, 1, 1,
0.07872188, -2.0982, 4.82368, 0, 0.7764706, 1, 1,
0.08093522, -1.494036, 5.356248, 0, 0.772549, 1, 1,
0.08444884, -0.3260992, 3.869206, 0, 0.7647059, 1, 1,
0.08477367, 0.1875415, 0.8334457, 0, 0.7607843, 1, 1,
0.101284, -1.246535, 1.50519, 0, 0.7529412, 1, 1,
0.1034089, -1.880409, 3.075697, 0, 0.7490196, 1, 1,
0.1036905, 1.218046, 0.2056567, 0, 0.7411765, 1, 1,
0.113486, -1.046185, 2.179127, 0, 0.7372549, 1, 1,
0.1138941, -0.5213156, 3.031338, 0, 0.7294118, 1, 1,
0.1140828, -0.06117133, 1.155775, 0, 0.7254902, 1, 1,
0.1170949, 2.113339, -1.344026, 0, 0.7176471, 1, 1,
0.1183658, 0.00803989, 0.5099894, 0, 0.7137255, 1, 1,
0.1189307, 1.034686, 0.3479567, 0, 0.7058824, 1, 1,
0.1189435, -0.009814528, 1.577449, 0, 0.6980392, 1, 1,
0.1191705, -0.3200129, 2.276648, 0, 0.6941177, 1, 1,
0.1201782, -0.6506872, 3.250331, 0, 0.6862745, 1, 1,
0.1219171, 0.7042278, -1.930536, 0, 0.682353, 1, 1,
0.1336558, 0.2112214, -0.1925009, 0, 0.6745098, 1, 1,
0.1353998, 1.232844, 1.31769, 0, 0.6705883, 1, 1,
0.1396575, 0.4134473, 0.05970014, 0, 0.6627451, 1, 1,
0.1399287, 0.933382, 1.246318, 0, 0.6588235, 1, 1,
0.1415941, -1.888398, 3.258327, 0, 0.6509804, 1, 1,
0.1472483, -0.2007197, 2.197575, 0, 0.6470588, 1, 1,
0.1497471, 0.8134236, 1.65535, 0, 0.6392157, 1, 1,
0.1529563, -1.112862, 2.798115, 0, 0.6352941, 1, 1,
0.1529632, -0.07109785, 1.747615, 0, 0.627451, 1, 1,
0.1560404, 1.457884, -0.2656926, 0, 0.6235294, 1, 1,
0.1563343, 0.03492286, 1.473346, 0, 0.6156863, 1, 1,
0.1574315, -0.4825502, 1.732056, 0, 0.6117647, 1, 1,
0.1604142, -2.642121, 1.549391, 0, 0.6039216, 1, 1,
0.1607356, -0.5072321, 2.324041, 0, 0.5960785, 1, 1,
0.1614529, 0.7962574, 0.5014668, 0, 0.5921569, 1, 1,
0.1630007, 0.3762947, 0.4239782, 0, 0.5843138, 1, 1,
0.166877, 0.197266, 0.9722389, 0, 0.5803922, 1, 1,
0.1720546, -0.9992231, 1.487457, 0, 0.572549, 1, 1,
0.175151, -0.5081424, 2.12671, 0, 0.5686275, 1, 1,
0.1780151, -1.494128, 3.110281, 0, 0.5607843, 1, 1,
0.1782318, 1.009597, 1.820833, 0, 0.5568628, 1, 1,
0.1798774, 0.6364666, -0.7228224, 0, 0.5490196, 1, 1,
0.1812338, 0.9557469, 1.470552, 0, 0.5450981, 1, 1,
0.1815346, -1.856213, 4.925471, 0, 0.5372549, 1, 1,
0.1876548, 1.326696, 0.4631814, 0, 0.5333334, 1, 1,
0.1887545, 1.374436, 0.8492977, 0, 0.5254902, 1, 1,
0.1919058, 1.096265, 0.07515332, 0, 0.5215687, 1, 1,
0.1929193, -0.4957991, 3.593147, 0, 0.5137255, 1, 1,
0.2032562, 0.8137557, 0.2476949, 0, 0.509804, 1, 1,
0.203713, -0.7237512, 3.74972, 0, 0.5019608, 1, 1,
0.205341, 0.2634309, -1.400316, 0, 0.4941176, 1, 1,
0.2059766, 1.052987, 1.282189, 0, 0.4901961, 1, 1,
0.207261, 0.9705783, -0.2944355, 0, 0.4823529, 1, 1,
0.2164821, -2.777723, 2.604286, 0, 0.4784314, 1, 1,
0.2247771, -1.639278, 3.538797, 0, 0.4705882, 1, 1,
0.2268969, -1.380298, 1.577731, 0, 0.4666667, 1, 1,
0.2319415, -0.1795678, 2.763306, 0, 0.4588235, 1, 1,
0.2323148, 0.5761938, 1.404561, 0, 0.454902, 1, 1,
0.235016, -1.408923, 2.127147, 0, 0.4470588, 1, 1,
0.2388634, -1.336301, 2.771153, 0, 0.4431373, 1, 1,
0.2412691, -1.742866, 3.041942, 0, 0.4352941, 1, 1,
0.2421142, -0.1411379, 2.063293, 0, 0.4313726, 1, 1,
0.243383, -0.07400258, 2.598102, 0, 0.4235294, 1, 1,
0.2508586, 0.7171477, 2.141274, 0, 0.4196078, 1, 1,
0.2582248, -0.283562, 2.674422, 0, 0.4117647, 1, 1,
0.2582339, 0.04704481, -0.658532, 0, 0.4078431, 1, 1,
0.2589281, 1.098757, -0.3426912, 0, 0.4, 1, 1,
0.2593907, -2.668579, 1.931863, 0, 0.3921569, 1, 1,
0.259462, 2.09967, 0.6198971, 0, 0.3882353, 1, 1,
0.261656, 1.521674, 0.3157918, 0, 0.3803922, 1, 1,
0.2623682, -0.518997, 3.394664, 0, 0.3764706, 1, 1,
0.2723729, -0.5043762, 3.370567, 0, 0.3686275, 1, 1,
0.2764323, -0.1920857, 2.339099, 0, 0.3647059, 1, 1,
0.2779132, 0.2135739, -0.7360119, 0, 0.3568628, 1, 1,
0.2803034, 0.583016, 0.2963949, 0, 0.3529412, 1, 1,
0.2820395, -0.2346282, 2.00075, 0, 0.345098, 1, 1,
0.288479, 0.2983095, 0.6232736, 0, 0.3411765, 1, 1,
0.289977, -0.1071988, 1.253855, 0, 0.3333333, 1, 1,
0.2903029, -0.6620564, 4.146539, 0, 0.3294118, 1, 1,
0.3001214, -0.2456898, 1.233499, 0, 0.3215686, 1, 1,
0.3067387, 0.8711551, 2.377024, 0, 0.3176471, 1, 1,
0.308752, 0.1026844, 0.04430986, 0, 0.3098039, 1, 1,
0.3090115, 1.173682, 0.6625106, 0, 0.3058824, 1, 1,
0.3118974, -1.461733, 3.705047, 0, 0.2980392, 1, 1,
0.3132908, -0.5384403, 1.542812, 0, 0.2901961, 1, 1,
0.3169772, -0.02390742, 2.049498, 0, 0.2862745, 1, 1,
0.3212331, 0.04988186, 2.689279, 0, 0.2784314, 1, 1,
0.321811, 0.1359337, 0.5752682, 0, 0.2745098, 1, 1,
0.321837, 1.765509, -0.9403038, 0, 0.2666667, 1, 1,
0.322379, -0.3403604, 2.656177, 0, 0.2627451, 1, 1,
0.3243223, 0.3359998, -0.7727398, 0, 0.254902, 1, 1,
0.3259725, 0.2408602, -0.4043971, 0, 0.2509804, 1, 1,
0.3304102, -0.6781945, 2.546923, 0, 0.2431373, 1, 1,
0.332537, 0.628722, 0.173652, 0, 0.2392157, 1, 1,
0.3331796, -0.2095428, 2.201447, 0, 0.2313726, 1, 1,
0.3380073, -0.6116841, 2.139082, 0, 0.227451, 1, 1,
0.3391998, -0.606234, 2.159271, 0, 0.2196078, 1, 1,
0.343526, -0.1371997, 1.809288, 0, 0.2156863, 1, 1,
0.3463944, -0.6204678, 2.781248, 0, 0.2078431, 1, 1,
0.3469431, 1.340235, 1.388958, 0, 0.2039216, 1, 1,
0.3501669, 2.64619, 0.2425549, 0, 0.1960784, 1, 1,
0.3506366, 0.4049497, 0.9658931, 0, 0.1882353, 1, 1,
0.3526338, 0.08283803, 0.4175738, 0, 0.1843137, 1, 1,
0.3533481, 0.5662374, 0.6095789, 0, 0.1764706, 1, 1,
0.353734, -0.5533183, 2.025966, 0, 0.172549, 1, 1,
0.356206, -0.9606653, 1.986335, 0, 0.1647059, 1, 1,
0.358831, -0.3993759, 4.637556, 0, 0.1607843, 1, 1,
0.3589562, 0.7311092, -1.173634, 0, 0.1529412, 1, 1,
0.3644057, 0.6360309, -0.9551368, 0, 0.1490196, 1, 1,
0.3688637, -0.8717183, 2.968425, 0, 0.1411765, 1, 1,
0.3710746, -0.1589966, 0.9827955, 0, 0.1372549, 1, 1,
0.3736246, -0.9461114, 2.059573, 0, 0.1294118, 1, 1,
0.3797694, 1.793804, -0.02045967, 0, 0.1254902, 1, 1,
0.3809836, 0.6503305, 0.5858613, 0, 0.1176471, 1, 1,
0.3859548, -0.9388413, 2.369649, 0, 0.1137255, 1, 1,
0.3984202, -0.1138915, 1.528001, 0, 0.1058824, 1, 1,
0.3990757, 0.4601747, 1.528117, 0, 0.09803922, 1, 1,
0.3995674, -0.120364, 2.43266, 0, 0.09411765, 1, 1,
0.4013146, -1.663813, 2.122505, 0, 0.08627451, 1, 1,
0.4056323, 0.241503, 1.227947, 0, 0.08235294, 1, 1,
0.4094815, 0.6963504, -0.3658057, 0, 0.07450981, 1, 1,
0.415877, -1.822063, 3.466154, 0, 0.07058824, 1, 1,
0.4197704, -1.405681, 2.19977, 0, 0.0627451, 1, 1,
0.4204525, -0.4959948, 2.34159, 0, 0.05882353, 1, 1,
0.4230286, -1.592256, 0.9769376, 0, 0.05098039, 1, 1,
0.4242112, -0.2684471, 2.543234, 0, 0.04705882, 1, 1,
0.4258358, -1.633312, 3.319824, 0, 0.03921569, 1, 1,
0.4286831, 1.357269, -1.454292, 0, 0.03529412, 1, 1,
0.433593, -0.7857657, 3.01068, 0, 0.02745098, 1, 1,
0.4367585, -0.4035763, 4.346464, 0, 0.02352941, 1, 1,
0.4389018, -1.314426, 1.353195, 0, 0.01568628, 1, 1,
0.4403847, 0.1724668, 1.547835, 0, 0.01176471, 1, 1,
0.4412538, -0.9226233, 3.66764, 0, 0.003921569, 1, 1,
0.4433728, 0.2629524, 1.622758, 0.003921569, 0, 1, 1,
0.4469779, -0.7916739, 1.786044, 0.007843138, 0, 1, 1,
0.4510102, -1.164519, 3.071328, 0.01568628, 0, 1, 1,
0.4512038, 1.281881, -0.931223, 0.01960784, 0, 1, 1,
0.4534016, 0.1372776, 0.9873345, 0.02745098, 0, 1, 1,
0.4585131, -1.26187, 4.325495, 0.03137255, 0, 1, 1,
0.4651253, -0.4002252, 1.645263, 0.03921569, 0, 1, 1,
0.4655297, 0.4161859, 2.223972, 0.04313726, 0, 1, 1,
0.4674446, -0.6634461, 0.5705807, 0.05098039, 0, 1, 1,
0.4702512, -1.025007, 3.074257, 0.05490196, 0, 1, 1,
0.4723968, -1.537197, 1.54046, 0.0627451, 0, 1, 1,
0.4735882, -0.0726904, 1.959423, 0.06666667, 0, 1, 1,
0.4748893, 1.352113, -1.140546, 0.07450981, 0, 1, 1,
0.4803275, 0.8624362, 0.6823965, 0.07843138, 0, 1, 1,
0.4941817, -0.4410783, 3.113259, 0.08627451, 0, 1, 1,
0.4947106, -0.2566991, 1.448115, 0.09019608, 0, 1, 1,
0.4968166, 0.9892849, 1.515226, 0.09803922, 0, 1, 1,
0.4979981, -0.6298868, 2.178657, 0.1058824, 0, 1, 1,
0.5019042, -0.8991951, 1.765739, 0.1098039, 0, 1, 1,
0.5021204, -0.4261528, 2.07126, 0.1176471, 0, 1, 1,
0.5036665, 0.4345694, 1.15129, 0.1215686, 0, 1, 1,
0.508971, 0.5789325, 0.8427783, 0.1294118, 0, 1, 1,
0.5147018, 2.014984, 1.278, 0.1333333, 0, 1, 1,
0.522703, -1.16233, 3.202643, 0.1411765, 0, 1, 1,
0.5231369, -0.8120024, 2.161473, 0.145098, 0, 1, 1,
0.5237333, -1.01644, 1.798703, 0.1529412, 0, 1, 1,
0.5255516, -1.416241, 0.5579987, 0.1568628, 0, 1, 1,
0.5271035, -1.247258, 3.885388, 0.1647059, 0, 1, 1,
0.5331531, -1.974592, 3.017875, 0.1686275, 0, 1, 1,
0.53351, 0.7061641, -0.8724433, 0.1764706, 0, 1, 1,
0.5343476, 1.427385, 0.4182128, 0.1803922, 0, 1, 1,
0.5423203, 1.005121, 2.078371, 0.1882353, 0, 1, 1,
0.5466218, -0.1754605, 0.3450527, 0.1921569, 0, 1, 1,
0.5560144, 0.866221, 0.03295886, 0.2, 0, 1, 1,
0.5621821, -0.2845201, 0.9884158, 0.2078431, 0, 1, 1,
0.5630131, -0.981163, 2.539621, 0.2117647, 0, 1, 1,
0.567354, -0.5777309, 3.273982, 0.2196078, 0, 1, 1,
0.5711535, 0.2783907, 0.3939121, 0.2235294, 0, 1, 1,
0.5716975, 1.310474, -0.3181145, 0.2313726, 0, 1, 1,
0.5719616, -0.560483, 1.394215, 0.2352941, 0, 1, 1,
0.5746559, 1.299935, -2.154081, 0.2431373, 0, 1, 1,
0.5770373, 0.7424208, 0.983595, 0.2470588, 0, 1, 1,
0.5775149, -0.9809719, 1.18485, 0.254902, 0, 1, 1,
0.578003, 0.9779847, -0.02476104, 0.2588235, 0, 1, 1,
0.5795642, -0.7814837, 4.631677, 0.2666667, 0, 1, 1,
0.582454, -0.1799568, 0.5709365, 0.2705882, 0, 1, 1,
0.5829996, 0.6362325, 1.297883, 0.2784314, 0, 1, 1,
0.5879573, 0.9306569, 0.5854288, 0.282353, 0, 1, 1,
0.5882151, -0.4157902, 2.385625, 0.2901961, 0, 1, 1,
0.5885539, 0.555034, 1.205025, 0.2941177, 0, 1, 1,
0.5891933, 3.255985, 0.5013671, 0.3019608, 0, 1, 1,
0.5958828, -0.2664891, 2.448613, 0.3098039, 0, 1, 1,
0.5963151, 0.9654996, 2.483748, 0.3137255, 0, 1, 1,
0.59654, -1.916651, 3.709019, 0.3215686, 0, 1, 1,
0.6042758, 0.006401076, 2.236422, 0.3254902, 0, 1, 1,
0.607731, -0.8097324, 3.386877, 0.3333333, 0, 1, 1,
0.6083992, -1.752459, 1.913916, 0.3372549, 0, 1, 1,
0.6086718, -0.2049712, 3.712311, 0.345098, 0, 1, 1,
0.6096539, -0.5772097, 0.3277771, 0.3490196, 0, 1, 1,
0.6149968, -1.036715, 3.170757, 0.3568628, 0, 1, 1,
0.6216843, -0.4555684, 0.01075447, 0.3607843, 0, 1, 1,
0.6233237, -1.076122, 4.566366, 0.3686275, 0, 1, 1,
0.6241524, 0.3659621, 0.2710059, 0.372549, 0, 1, 1,
0.6244106, -1.918964, 3.507795, 0.3803922, 0, 1, 1,
0.6258991, -1.354466, 3.874222, 0.3843137, 0, 1, 1,
0.6290938, -0.8763499, 1.792368, 0.3921569, 0, 1, 1,
0.6304691, -0.2453971, 0.2747618, 0.3960784, 0, 1, 1,
0.6312008, -2.042945, 3.825427, 0.4039216, 0, 1, 1,
0.6347778, -1.1051, 4.222462, 0.4117647, 0, 1, 1,
0.6446043, 1.151759, 0.2367564, 0.4156863, 0, 1, 1,
0.6446918, -0.2075054, -0.2011643, 0.4235294, 0, 1, 1,
0.6470488, 0.8996721, 1.607668, 0.427451, 0, 1, 1,
0.6480824, 1.403993, 1.29337, 0.4352941, 0, 1, 1,
0.6546128, 1.416439, 1.781834, 0.4392157, 0, 1, 1,
0.6574207, -0.1989861, 3.755079, 0.4470588, 0, 1, 1,
0.6686417, 1.428851, 0.6052529, 0.4509804, 0, 1, 1,
0.6734721, 0.269354, 2.448956, 0.4588235, 0, 1, 1,
0.674302, 1.080532, -0.2203495, 0.4627451, 0, 1, 1,
0.6752911, -0.7205756, 2.396683, 0.4705882, 0, 1, 1,
0.6776679, -1.438722, 2.224804, 0.4745098, 0, 1, 1,
0.6784356, -0.8531337, 2.0371, 0.4823529, 0, 1, 1,
0.6789151, -1.041552, 3.151006, 0.4862745, 0, 1, 1,
0.6946273, -0.7663496, 2.356946, 0.4941176, 0, 1, 1,
0.6990994, 0.5065274, 1.560906, 0.5019608, 0, 1, 1,
0.7002018, -0.02111544, 2.775592, 0.5058824, 0, 1, 1,
0.7036461, 1.089465, -1.161277, 0.5137255, 0, 1, 1,
0.7087477, 0.1119784, 3.778414, 0.5176471, 0, 1, 1,
0.7092689, 1.031614, 0.476593, 0.5254902, 0, 1, 1,
0.7158239, -1.898831, 3.020049, 0.5294118, 0, 1, 1,
0.7166042, 2.267342, -0.4748612, 0.5372549, 0, 1, 1,
0.7237765, -1.431203, 2.509623, 0.5411765, 0, 1, 1,
0.7257738, 1.857467, 2.32948, 0.5490196, 0, 1, 1,
0.7320163, 1.510681, -0.0632825, 0.5529412, 0, 1, 1,
0.7413412, -0.5041541, 1.709013, 0.5607843, 0, 1, 1,
0.7426711, 1.302107, -0.2505964, 0.5647059, 0, 1, 1,
0.7428479, 1.303436, 0.5615414, 0.572549, 0, 1, 1,
0.7451668, -1.682492, 2.244755, 0.5764706, 0, 1, 1,
0.7456417, 1.383029, -1.060323, 0.5843138, 0, 1, 1,
0.7481646, -1.760394, 3.330421, 0.5882353, 0, 1, 1,
0.7553254, 0.5110983, 0.8909771, 0.5960785, 0, 1, 1,
0.7578159, -1.38511, 3.183914, 0.6039216, 0, 1, 1,
0.7584894, 1.188632, 1.111826, 0.6078432, 0, 1, 1,
0.7592595, 0.3153822, 0.3949726, 0.6156863, 0, 1, 1,
0.7600002, 0.1206692, 0.4716374, 0.6196079, 0, 1, 1,
0.760341, -0.4695243, 1.499901, 0.627451, 0, 1, 1,
0.7610516, 0.6930493, -1.064284, 0.6313726, 0, 1, 1,
0.7620476, 0.9166306, 1.45272, 0.6392157, 0, 1, 1,
0.7681381, 1.504749, 0.968008, 0.6431373, 0, 1, 1,
0.7683573, -1.072326, 1.764512, 0.6509804, 0, 1, 1,
0.7687335, -0.6020711, 1.95315, 0.654902, 0, 1, 1,
0.7792723, 2.092431, -0.8646225, 0.6627451, 0, 1, 1,
0.7865791, -0.1101255, 2.071879, 0.6666667, 0, 1, 1,
0.7875463, -1.128949, 2.914457, 0.6745098, 0, 1, 1,
0.7901735, 0.1669867, 0.329797, 0.6784314, 0, 1, 1,
0.7909894, 0.09478559, 1.555706, 0.6862745, 0, 1, 1,
0.7956468, 0.9282554, 3.065433, 0.6901961, 0, 1, 1,
0.7975245, 1.991754, -1.249806, 0.6980392, 0, 1, 1,
0.8085291, -2.171124, 1.841256, 0.7058824, 0, 1, 1,
0.8238415, 0.4402899, 1.786512, 0.7098039, 0, 1, 1,
0.8240994, 1.639548, 0.356295, 0.7176471, 0, 1, 1,
0.8267383, 0.4395244, 0.6175799, 0.7215686, 0, 1, 1,
0.8269957, -2.638545, 2.601277, 0.7294118, 0, 1, 1,
0.8300471, 0.940726, -1.903618, 0.7333333, 0, 1, 1,
0.8304521, 2.39055, 0.1880371, 0.7411765, 0, 1, 1,
0.8326603, -0.4840449, 3.476551, 0.7450981, 0, 1, 1,
0.8353876, -0.4439907, 1.920235, 0.7529412, 0, 1, 1,
0.8357267, 0.5844914, 0.1493844, 0.7568628, 0, 1, 1,
0.8426533, 0.7040869, 1.054471, 0.7647059, 0, 1, 1,
0.8446985, 1.508856, 0.7985536, 0.7686275, 0, 1, 1,
0.8476673, 0.05785668, 1.25, 0.7764706, 0, 1, 1,
0.8479751, 0.4838238, -0.6571605, 0.7803922, 0, 1, 1,
0.8495113, -0.4832489, 1.206158, 0.7882353, 0, 1, 1,
0.8525679, -0.1525471, 1.570553, 0.7921569, 0, 1, 1,
0.852606, -0.2446212, 1.996302, 0.8, 0, 1, 1,
0.8545743, 1.531889, -0.9752696, 0.8078431, 0, 1, 1,
0.8667669, -0.2987531, 1.349309, 0.8117647, 0, 1, 1,
0.8694397, -0.0438987, 1.112667, 0.8196079, 0, 1, 1,
0.8702611, 0.1423964, 0.7434277, 0.8235294, 0, 1, 1,
0.8797461, 0.4808349, -0.1494409, 0.8313726, 0, 1, 1,
0.8798391, 0.5269597, 1.986073, 0.8352941, 0, 1, 1,
0.8834116, -1.349845, 2.387144, 0.8431373, 0, 1, 1,
0.8873329, 2.78522, 1.905453, 0.8470588, 0, 1, 1,
0.8903708, -0.8427204, 3.300195, 0.854902, 0, 1, 1,
0.8937695, 0.4255481, 0.9174512, 0.8588235, 0, 1, 1,
0.896374, -0.1199214, 0.9365261, 0.8666667, 0, 1, 1,
0.8996015, 0.02213898, 1.500142, 0.8705882, 0, 1, 1,
0.908385, 0.8923129, 0.6251078, 0.8784314, 0, 1, 1,
0.9096609, -1.263058, 1.414455, 0.8823529, 0, 1, 1,
0.913628, -0.06534152, 1.11448, 0.8901961, 0, 1, 1,
0.9147589, -0.0545756, 2.073087, 0.8941177, 0, 1, 1,
0.9158936, -0.7049459, 2.012522, 0.9019608, 0, 1, 1,
0.9287828, -1.285657, 3.271662, 0.9098039, 0, 1, 1,
0.9288238, 0.1878493, -0.669134, 0.9137255, 0, 1, 1,
0.9393137, 0.2993391, 0.6508421, 0.9215686, 0, 1, 1,
0.9401869, 0.02673458, 0.7306873, 0.9254902, 0, 1, 1,
0.9410803, 0.7796038, 0.8516651, 0.9333333, 0, 1, 1,
0.9415222, 2.625402, 1.182001, 0.9372549, 0, 1, 1,
0.9473306, -0.06627326, 0.6420249, 0.945098, 0, 1, 1,
0.9480239, 1.203318, -1.314681, 0.9490196, 0, 1, 1,
0.950612, -0.6880324, 3.052121, 0.9568627, 0, 1, 1,
0.9514204, 0.5513356, -0.6316136, 0.9607843, 0, 1, 1,
0.9609228, 0.7255101, -0.1791485, 0.9686275, 0, 1, 1,
0.9629201, -1.919696, 1.146961, 0.972549, 0, 1, 1,
0.9656361, 1.062491, 0.1165965, 0.9803922, 0, 1, 1,
0.966446, -0.4134035, 2.83751, 0.9843137, 0, 1, 1,
0.9713728, -0.2402387, 2.814162, 0.9921569, 0, 1, 1,
0.9774851, 0.4227082, 2.599499, 0.9960784, 0, 1, 1,
0.9789196, 0.2545716, 2.270543, 1, 0, 0.9960784, 1,
0.9884712, -1.450315, 2.567708, 1, 0, 0.9882353, 1,
0.9926957, 1.75567, 1.576898, 1, 0, 0.9843137, 1,
0.9951539, -0.7371746, 2.354887, 1, 0, 0.9764706, 1,
0.9967, -0.5138919, -1.624577, 1, 0, 0.972549, 1,
1.004478, -0.2027268, -0.3939398, 1, 0, 0.9647059, 1,
1.015368, -0.9027556, 1.870257, 1, 0, 0.9607843, 1,
1.016554, -2.321788, 1.488139, 1, 0, 0.9529412, 1,
1.019325, -0.5812093, 2.377862, 1, 0, 0.9490196, 1,
1.023981, -1.602635, 1.599626, 1, 0, 0.9411765, 1,
1.025092, -0.4840746, 1.715877, 1, 0, 0.9372549, 1,
1.031341, -0.2071137, 1.765403, 1, 0, 0.9294118, 1,
1.03507, 0.486005, -0.401662, 1, 0, 0.9254902, 1,
1.037597, -0.1390096, 1.958068, 1, 0, 0.9176471, 1,
1.041627, 0.3175761, 1.438854, 1, 0, 0.9137255, 1,
1.051194, 0.3244603, 2.371006, 1, 0, 0.9058824, 1,
1.054274, -1.084168, 3.124629, 1, 0, 0.9019608, 1,
1.057693, 0.2338207, 1.432773, 1, 0, 0.8941177, 1,
1.062296, 1.246496, 0.4351213, 1, 0, 0.8862745, 1,
1.066617, 0.2801697, 0.638517, 1, 0, 0.8823529, 1,
1.074275, 0.562048, 0.9311338, 1, 0, 0.8745098, 1,
1.091851, 1.179922, 0.9947448, 1, 0, 0.8705882, 1,
1.104778, -0.9763066, 2.876498, 1, 0, 0.8627451, 1,
1.107084, -0.2179049, 3.29648, 1, 0, 0.8588235, 1,
1.10744, -0.4921959, 2.636758, 1, 0, 0.8509804, 1,
1.114036, 0.9550541, 0.6553327, 1, 0, 0.8470588, 1,
1.115784, -0.2417041, 1.852458, 1, 0, 0.8392157, 1,
1.117704, 0.5232088, 0.5422642, 1, 0, 0.8352941, 1,
1.12192, -0.4480706, 2.156381, 1, 0, 0.827451, 1,
1.123276, -1.429026, 1.447516, 1, 0, 0.8235294, 1,
1.12575, -0.07753044, 1.145879, 1, 0, 0.8156863, 1,
1.130339, 0.2874024, 1.614587, 1, 0, 0.8117647, 1,
1.133294, -0.09927195, 2.631542, 1, 0, 0.8039216, 1,
1.133326, 1.182973, -0.3609047, 1, 0, 0.7960784, 1,
1.137384, -1.025759, 3.772031, 1, 0, 0.7921569, 1,
1.141285, -0.3208923, 4.390038, 1, 0, 0.7843137, 1,
1.141429, 0.3175619, -0.7093312, 1, 0, 0.7803922, 1,
1.142257, 0.006539067, 0.9826228, 1, 0, 0.772549, 1,
1.144567, 0.4163147, 1.057472, 1, 0, 0.7686275, 1,
1.145697, -0.8058969, 2.323009, 1, 0, 0.7607843, 1,
1.148274, 0.5652018, 2.873483, 1, 0, 0.7568628, 1,
1.148685, 0.9477384, 1.752458, 1, 0, 0.7490196, 1,
1.149716, 1.046998, -1.794468, 1, 0, 0.7450981, 1,
1.151309, 0.7659866, 2.086642, 1, 0, 0.7372549, 1,
1.152372, -0.2238024, 3.480719, 1, 0, 0.7333333, 1,
1.153448, 0.7524506, -1.729505, 1, 0, 0.7254902, 1,
1.163501, -0.8479304, 0.7933528, 1, 0, 0.7215686, 1,
1.166265, -0.8757483, 2.270651, 1, 0, 0.7137255, 1,
1.167319, -1.892954, 3.212554, 1, 0, 0.7098039, 1,
1.171976, -0.9820622, 1.922724, 1, 0, 0.7019608, 1,
1.188561, -1.372102, 3.012114, 1, 0, 0.6941177, 1,
1.192334, -0.5888361, 1.628718, 1, 0, 0.6901961, 1,
1.203295, -0.7657954, 2.457944, 1, 0, 0.682353, 1,
1.204034, -0.9912159, 2.887462, 1, 0, 0.6784314, 1,
1.208988, -0.3091542, 3.18052, 1, 0, 0.6705883, 1,
1.215816, -0.1592549, 2.202327, 1, 0, 0.6666667, 1,
1.21724, -0.05598839, 2.37646, 1, 0, 0.6588235, 1,
1.22023, -1.235983, 2.849893, 1, 0, 0.654902, 1,
1.225565, -0.2361134, 0.6586211, 1, 0, 0.6470588, 1,
1.232026, 0.1637886, 0.6676326, 1, 0, 0.6431373, 1,
1.236766, -0.160447, 2.545867, 1, 0, 0.6352941, 1,
1.238168, -0.1066735, 2.853862, 1, 0, 0.6313726, 1,
1.255845, -1.548267, 3.656489, 1, 0, 0.6235294, 1,
1.256551, -0.5189152, 1.753533, 1, 0, 0.6196079, 1,
1.257209, -0.01663804, 3.465021, 1, 0, 0.6117647, 1,
1.262631, 0.1590349, 1.685865, 1, 0, 0.6078432, 1,
1.265163, 0.01123338, 2.852241, 1, 0, 0.6, 1,
1.26922, -0.9271035, 1.277992, 1, 0, 0.5921569, 1,
1.278932, -1.997445, 2.448334, 1, 0, 0.5882353, 1,
1.283283, -0.4185347, 1.199407, 1, 0, 0.5803922, 1,
1.287073, 0.02777759, 1.248596, 1, 0, 0.5764706, 1,
1.297604, -0.9200464, 0.9504555, 1, 0, 0.5686275, 1,
1.30362, -0.8104653, 3.086408, 1, 0, 0.5647059, 1,
1.311954, 0.8333798, 1.35863, 1, 0, 0.5568628, 1,
1.319543, 0.8128666, -0.9835675, 1, 0, 0.5529412, 1,
1.319637, 0.1269089, 2.226787, 1, 0, 0.5450981, 1,
1.332286, -0.6136581, 2.380785, 1, 0, 0.5411765, 1,
1.334663, 1.238333, 3.554499, 1, 0, 0.5333334, 1,
1.352404, -0.3011563, 1.642207, 1, 0, 0.5294118, 1,
1.354423, 0.7328839, 1.271677, 1, 0, 0.5215687, 1,
1.356211, -0.8252034, 2.02405, 1, 0, 0.5176471, 1,
1.35831, -0.5010952, 0.9839429, 1, 0, 0.509804, 1,
1.363729, 1.082613, -0.2852565, 1, 0, 0.5058824, 1,
1.367652, 1.812451, 0.1994748, 1, 0, 0.4980392, 1,
1.368394, -0.06285292, 2.456749, 1, 0, 0.4901961, 1,
1.372502, -0.2211088, -0.2131023, 1, 0, 0.4862745, 1,
1.386909, 0.7406327, 1.069686, 1, 0, 0.4784314, 1,
1.4108, -0.8263982, 2.92266, 1, 0, 0.4745098, 1,
1.421581, 0.5004464, 2.146847, 1, 0, 0.4666667, 1,
1.431393, 0.5180928, -0.3893029, 1, 0, 0.4627451, 1,
1.468541, 1.059897, 3.047809, 1, 0, 0.454902, 1,
1.469169, 0.01952985, 1.564002, 1, 0, 0.4509804, 1,
1.472886, -0.4739781, 2.572965, 1, 0, 0.4431373, 1,
1.476297, 1.257551, -0.05654234, 1, 0, 0.4392157, 1,
1.478954, -0.4715039, 1.10642, 1, 0, 0.4313726, 1,
1.48378, 0.5421872, 0.6883236, 1, 0, 0.427451, 1,
1.483819, -0.102559, 0.6786703, 1, 0, 0.4196078, 1,
1.489787, 0.4964385, 1.356202, 1, 0, 0.4156863, 1,
1.492551, 0.7480482, 2.274988, 1, 0, 0.4078431, 1,
1.503542, 1.243545, 0.8712931, 1, 0, 0.4039216, 1,
1.513999, 1.015835, 0.4100221, 1, 0, 0.3960784, 1,
1.515122, 0.1009951, 2.86397, 1, 0, 0.3882353, 1,
1.521248, -0.3939065, 3.240535, 1, 0, 0.3843137, 1,
1.525702, 1.477532, 0.4080933, 1, 0, 0.3764706, 1,
1.528847, 0.5272382, 0.6191526, 1, 0, 0.372549, 1,
1.533978, 0.7397342, 2.327488, 1, 0, 0.3647059, 1,
1.541317, -0.04441092, -0.09393518, 1, 0, 0.3607843, 1,
1.551764, -0.4746472, 1.563642, 1, 0, 0.3529412, 1,
1.556747, 1.082044, -0.2669986, 1, 0, 0.3490196, 1,
1.564312, 0.09777466, 1.379261, 1, 0, 0.3411765, 1,
1.569597, -0.7791169, 2.108672, 1, 0, 0.3372549, 1,
1.581034, 1.459268, 1.636827, 1, 0, 0.3294118, 1,
1.637748, 0.8484296, 0.2078825, 1, 0, 0.3254902, 1,
1.652729, -0.9389449, 1.896116, 1, 0, 0.3176471, 1,
1.656992, -2.177929, 2.318703, 1, 0, 0.3137255, 1,
1.658094, -0.6642426, 1.857058, 1, 0, 0.3058824, 1,
1.662935, 0.5245974, 0.8883367, 1, 0, 0.2980392, 1,
1.668054, 0.4945415, 0.89529, 1, 0, 0.2941177, 1,
1.675808, 1.479895, 0.8446332, 1, 0, 0.2862745, 1,
1.677379, 0.3163445, 0.8079016, 1, 0, 0.282353, 1,
1.728935, 0.2083498, 1.039555, 1, 0, 0.2745098, 1,
1.742775, -0.9067848, 1.357471, 1, 0, 0.2705882, 1,
1.74695, 1.122673, 0.5425133, 1, 0, 0.2627451, 1,
1.753666, -1.894345, 0.7419868, 1, 0, 0.2588235, 1,
1.775216, 0.6997219, 0.4009023, 1, 0, 0.2509804, 1,
1.790602, 0.741144, 2.786157, 1, 0, 0.2470588, 1,
1.827823, 0.1845569, 1.943639, 1, 0, 0.2392157, 1,
1.828757, -0.669957, 1.682836, 1, 0, 0.2352941, 1,
1.851304, -0.1783096, 1.868209, 1, 0, 0.227451, 1,
1.854573, 0.3090647, 1.167706, 1, 0, 0.2235294, 1,
1.880423, 0.5812553, -0.7028928, 1, 0, 0.2156863, 1,
1.881554, -0.9304202, 2.027438, 1, 0, 0.2117647, 1,
1.902702, -1.405842, 1.238557, 1, 0, 0.2039216, 1,
1.917516, 0.7575698, 1.911826, 1, 0, 0.1960784, 1,
1.917821, 1.493198, 0.5568422, 1, 0, 0.1921569, 1,
1.920652, -1.811971, 0.7938732, 1, 0, 0.1843137, 1,
1.945907, -0.04294704, 1.864526, 1, 0, 0.1803922, 1,
1.962543, 0.05388365, 2.132461, 1, 0, 0.172549, 1,
1.967866, -1.370481, 3.459093, 1, 0, 0.1686275, 1,
1.971376, -0.6856207, 1.483159, 1, 0, 0.1607843, 1,
1.979777, 0.6645827, 2.168784, 1, 0, 0.1568628, 1,
1.983402, 1.92203, 2.321734, 1, 0, 0.1490196, 1,
1.994446, -0.6867789, 3.771948, 1, 0, 0.145098, 1,
2.001204, 1.660807, 0.1938187, 1, 0, 0.1372549, 1,
2.010433, 0.1053922, 3.151955, 1, 0, 0.1333333, 1,
2.0552, -1.412812, 2.002506, 1, 0, 0.1254902, 1,
2.063233, 0.2575349, 1.201115, 1, 0, 0.1215686, 1,
2.071535, -0.121502, 1.368423, 1, 0, 0.1137255, 1,
2.113398, -1.170762, 2.169597, 1, 0, 0.1098039, 1,
2.152371, 0.3079948, 1.643906, 1, 0, 0.1019608, 1,
2.195792, 0.7082436, 1.712432, 1, 0, 0.09411765, 1,
2.231104, 0.2827704, 0.7284339, 1, 0, 0.09019608, 1,
2.313722, 0.3291717, 2.683721, 1, 0, 0.08235294, 1,
2.360365, 1.487616, 0.9328323, 1, 0, 0.07843138, 1,
2.389262, 0.3798918, 3.535944, 1, 0, 0.07058824, 1,
2.399023, 0.5639861, -0.7860579, 1, 0, 0.06666667, 1,
2.498695, 0.8154007, -1.317364, 1, 0, 0.05882353, 1,
2.530041, 0.6363057, 1.221488, 1, 0, 0.05490196, 1,
2.621, 0.9301589, 1.078512, 1, 0, 0.04705882, 1,
2.636765, -0.7751215, 1.210545, 1, 0, 0.04313726, 1,
2.67412, 0.5849866, 1.583767, 1, 0, 0.03529412, 1,
2.697777, -0.2334155, 1.276824, 1, 0, 0.03137255, 1,
2.792307, 1.200334, 0.7840431, 1, 0, 0.02352941, 1,
3.271502, 0.502943, 2.734936, 1, 0, 0.01960784, 1,
3.330579, 1.393986, 1.293368, 1, 0, 0.01176471, 1,
3.660705, 1.199464, 0.697747, 1, 0, 0.007843138, 1
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
0.3216484, -4.124303, -7.608618, 0, -0.5, 0.5, 0.5,
0.3216484, -4.124303, -7.608618, 1, -0.5, 0.5, 0.5,
0.3216484, -4.124303, -7.608618, 1, 1.5, 0.5, 0.5,
0.3216484, -4.124303, -7.608618, 0, 1.5, 0.5, 0.5
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
-4.149349, 0.1006675, -7.608618, 0, -0.5, 0.5, 0.5,
-4.149349, 0.1006675, -7.608618, 1, -0.5, 0.5, 0.5,
-4.149349, 0.1006675, -7.608618, 1, 1.5, 0.5, 0.5,
-4.149349, 0.1006675, -7.608618, 0, 1.5, 0.5, 0.5
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
-4.149349, -4.124303, -0.1866617, 0, -0.5, 0.5, 0.5,
-4.149349, -4.124303, -0.1866617, 1, -0.5, 0.5, 0.5,
-4.149349, -4.124303, -0.1866617, 1, 1.5, 0.5, 0.5,
-4.149349, -4.124303, -0.1866617, 0, 1.5, 0.5, 0.5
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
-3, -3.14931, -5.895859,
3, -3.14931, -5.895859,
-3, -3.14931, -5.895859,
-3, -3.311809, -6.181319,
-2, -3.14931, -5.895859,
-2, -3.311809, -6.181319,
-1, -3.14931, -5.895859,
-1, -3.311809, -6.181319,
0, -3.14931, -5.895859,
0, -3.311809, -6.181319,
1, -3.14931, -5.895859,
1, -3.311809, -6.181319,
2, -3.14931, -5.895859,
2, -3.311809, -6.181319,
3, -3.14931, -5.895859,
3, -3.311809, -6.181319
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
-3, -3.636806, -6.752239, 0, -0.5, 0.5, 0.5,
-3, -3.636806, -6.752239, 1, -0.5, 0.5, 0.5,
-3, -3.636806, -6.752239, 1, 1.5, 0.5, 0.5,
-3, -3.636806, -6.752239, 0, 1.5, 0.5, 0.5,
-2, -3.636806, -6.752239, 0, -0.5, 0.5, 0.5,
-2, -3.636806, -6.752239, 1, -0.5, 0.5, 0.5,
-2, -3.636806, -6.752239, 1, 1.5, 0.5, 0.5,
-2, -3.636806, -6.752239, 0, 1.5, 0.5, 0.5,
-1, -3.636806, -6.752239, 0, -0.5, 0.5, 0.5,
-1, -3.636806, -6.752239, 1, -0.5, 0.5, 0.5,
-1, -3.636806, -6.752239, 1, 1.5, 0.5, 0.5,
-1, -3.636806, -6.752239, 0, 1.5, 0.5, 0.5,
0, -3.636806, -6.752239, 0, -0.5, 0.5, 0.5,
0, -3.636806, -6.752239, 1, -0.5, 0.5, 0.5,
0, -3.636806, -6.752239, 1, 1.5, 0.5, 0.5,
0, -3.636806, -6.752239, 0, 1.5, 0.5, 0.5,
1, -3.636806, -6.752239, 0, -0.5, 0.5, 0.5,
1, -3.636806, -6.752239, 1, -0.5, 0.5, 0.5,
1, -3.636806, -6.752239, 1, 1.5, 0.5, 0.5,
1, -3.636806, -6.752239, 0, 1.5, 0.5, 0.5,
2, -3.636806, -6.752239, 0, -0.5, 0.5, 0.5,
2, -3.636806, -6.752239, 1, -0.5, 0.5, 0.5,
2, -3.636806, -6.752239, 1, 1.5, 0.5, 0.5,
2, -3.636806, -6.752239, 0, 1.5, 0.5, 0.5,
3, -3.636806, -6.752239, 0, -0.5, 0.5, 0.5,
3, -3.636806, -6.752239, 1, -0.5, 0.5, 0.5,
3, -3.636806, -6.752239, 1, 1.5, 0.5, 0.5,
3, -3.636806, -6.752239, 0, 1.5, 0.5, 0.5
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
-3.11758, -3, -5.895859,
-3.11758, 3, -5.895859,
-3.11758, -3, -5.895859,
-3.289542, -3, -6.181319,
-3.11758, -2, -5.895859,
-3.289542, -2, -6.181319,
-3.11758, -1, -5.895859,
-3.289542, -1, -6.181319,
-3.11758, 0, -5.895859,
-3.289542, 0, -6.181319,
-3.11758, 1, -5.895859,
-3.289542, 1, -6.181319,
-3.11758, 2, -5.895859,
-3.289542, 2, -6.181319,
-3.11758, 3, -5.895859,
-3.289542, 3, -6.181319
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
-3.633465, -3, -6.752239, 0, -0.5, 0.5, 0.5,
-3.633465, -3, -6.752239, 1, -0.5, 0.5, 0.5,
-3.633465, -3, -6.752239, 1, 1.5, 0.5, 0.5,
-3.633465, -3, -6.752239, 0, 1.5, 0.5, 0.5,
-3.633465, -2, -6.752239, 0, -0.5, 0.5, 0.5,
-3.633465, -2, -6.752239, 1, -0.5, 0.5, 0.5,
-3.633465, -2, -6.752239, 1, 1.5, 0.5, 0.5,
-3.633465, -2, -6.752239, 0, 1.5, 0.5, 0.5,
-3.633465, -1, -6.752239, 0, -0.5, 0.5, 0.5,
-3.633465, -1, -6.752239, 1, -0.5, 0.5, 0.5,
-3.633465, -1, -6.752239, 1, 1.5, 0.5, 0.5,
-3.633465, -1, -6.752239, 0, 1.5, 0.5, 0.5,
-3.633465, 0, -6.752239, 0, -0.5, 0.5, 0.5,
-3.633465, 0, -6.752239, 1, -0.5, 0.5, 0.5,
-3.633465, 0, -6.752239, 1, 1.5, 0.5, 0.5,
-3.633465, 0, -6.752239, 0, 1.5, 0.5, 0.5,
-3.633465, 1, -6.752239, 0, -0.5, 0.5, 0.5,
-3.633465, 1, -6.752239, 1, -0.5, 0.5, 0.5,
-3.633465, 1, -6.752239, 1, 1.5, 0.5, 0.5,
-3.633465, 1, -6.752239, 0, 1.5, 0.5, 0.5,
-3.633465, 2, -6.752239, 0, -0.5, 0.5, 0.5,
-3.633465, 2, -6.752239, 1, -0.5, 0.5, 0.5,
-3.633465, 2, -6.752239, 1, 1.5, 0.5, 0.5,
-3.633465, 2, -6.752239, 0, 1.5, 0.5, 0.5,
-3.633465, 3, -6.752239, 0, -0.5, 0.5, 0.5,
-3.633465, 3, -6.752239, 1, -0.5, 0.5, 0.5,
-3.633465, 3, -6.752239, 1, 1.5, 0.5, 0.5,
-3.633465, 3, -6.752239, 0, 1.5, 0.5, 0.5
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
-3.11758, -3.14931, -4,
-3.11758, -3.14931, 4,
-3.11758, -3.14931, -4,
-3.289542, -3.311809, -4,
-3.11758, -3.14931, -2,
-3.289542, -3.311809, -2,
-3.11758, -3.14931, 0,
-3.289542, -3.311809, 0,
-3.11758, -3.14931, 2,
-3.289542, -3.311809, 2,
-3.11758, -3.14931, 4,
-3.289542, -3.311809, 4
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
-3.633465, -3.636806, -4, 0, -0.5, 0.5, 0.5,
-3.633465, -3.636806, -4, 1, -0.5, 0.5, 0.5,
-3.633465, -3.636806, -4, 1, 1.5, 0.5, 0.5,
-3.633465, -3.636806, -4, 0, 1.5, 0.5, 0.5,
-3.633465, -3.636806, -2, 0, -0.5, 0.5, 0.5,
-3.633465, -3.636806, -2, 1, -0.5, 0.5, 0.5,
-3.633465, -3.636806, -2, 1, 1.5, 0.5, 0.5,
-3.633465, -3.636806, -2, 0, 1.5, 0.5, 0.5,
-3.633465, -3.636806, 0, 0, -0.5, 0.5, 0.5,
-3.633465, -3.636806, 0, 1, -0.5, 0.5, 0.5,
-3.633465, -3.636806, 0, 1, 1.5, 0.5, 0.5,
-3.633465, -3.636806, 0, 0, 1.5, 0.5, 0.5,
-3.633465, -3.636806, 2, 0, -0.5, 0.5, 0.5,
-3.633465, -3.636806, 2, 1, -0.5, 0.5, 0.5,
-3.633465, -3.636806, 2, 1, 1.5, 0.5, 0.5,
-3.633465, -3.636806, 2, 0, 1.5, 0.5, 0.5,
-3.633465, -3.636806, 4, 0, -0.5, 0.5, 0.5,
-3.633465, -3.636806, 4, 1, -0.5, 0.5, 0.5,
-3.633465, -3.636806, 4, 1, 1.5, 0.5, 0.5,
-3.633465, -3.636806, 4, 0, 1.5, 0.5, 0.5
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
-3.11758, -3.14931, -5.895859,
-3.11758, 3.350645, -5.895859,
-3.11758, -3.14931, 5.522536,
-3.11758, 3.350645, 5.522536,
-3.11758, -3.14931, -5.895859,
-3.11758, -3.14931, 5.522536,
-3.11758, 3.350645, -5.895859,
-3.11758, 3.350645, 5.522536,
-3.11758, -3.14931, -5.895859,
3.760877, -3.14931, -5.895859,
-3.11758, -3.14931, 5.522536,
3.760877, -3.14931, 5.522536,
-3.11758, 3.350645, -5.895859,
3.760877, 3.350645, -5.895859,
-3.11758, 3.350645, 5.522536,
3.760877, 3.350645, 5.522536,
3.760877, -3.14931, -5.895859,
3.760877, 3.350645, -5.895859,
3.760877, -3.14931, 5.522536,
3.760877, 3.350645, 5.522536,
3.760877, -3.14931, -5.895859,
3.760877, -3.14931, 5.522536,
3.760877, 3.350645, -5.895859,
3.760877, 3.350645, 5.522536
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
var radius = 7.919174;
var distance = 35.2333;
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
mvMatrix.translate( -0.3216484, -0.1006675, 0.1866617 );
mvMatrix.scale( 1.244809, 1.317296, 0.7498747 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.2333);
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
tetroxocane<-read.table("tetroxocane.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-tetroxocane$V2
```

```
## Error in eval(expr, envir, enclos): object 'tetroxocane' not found
```

```r
y<-tetroxocane$V3
```

```
## Error in eval(expr, envir, enclos): object 'tetroxocane' not found
```

```r
z<-tetroxocane$V4
```

```
## Error in eval(expr, envir, enclos): object 'tetroxocane' not found
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
-3.017409, 0.255704, -1.020769, 0, 0, 1, 1, 1,
-2.829812, 1.643717, 0.4595405, 1, 0, 0, 1, 1,
-2.796913, -1.253899, -2.410135, 1, 0, 0, 1, 1,
-2.772021, -0.4882765, -0.6794178, 1, 0, 0, 1, 1,
-2.603284, -0.9794988, -0.2820721, 1, 0, 0, 1, 1,
-2.539375, -0.8525427, -1.423755, 1, 0, 0, 1, 1,
-2.525008, -1.61785, -2.841239, 0, 0, 0, 1, 1,
-2.445509, -0.2970952, -2.490758, 0, 0, 0, 1, 1,
-2.445148, -0.6227517, -0.7561488, 0, 0, 0, 1, 1,
-2.417769, 0.6522014, -1.189597, 0, 0, 0, 1, 1,
-2.344109, 0.1109232, -1.4144, 0, 0, 0, 1, 1,
-2.336128, -0.1548811, -0.897152, 0, 0, 0, 1, 1,
-2.324047, 0.3990804, -1.003776, 0, 0, 0, 1, 1,
-2.29373, -0.3984615, 0.3289059, 1, 1, 1, 1, 1,
-2.280764, 0.03022605, -3.281476, 1, 1, 1, 1, 1,
-2.214375, -0.7210253, -1.651066, 1, 1, 1, 1, 1,
-2.185248, 0.3717943, -1.943779, 1, 1, 1, 1, 1,
-2.176123, 0.4417655, -2.253437, 1, 1, 1, 1, 1,
-2.15889, -0.6210079, -1.860064, 1, 1, 1, 1, 1,
-2.149999, 0.990017, -1.331581, 1, 1, 1, 1, 1,
-2.147537, -0.5606632, -2.14299, 1, 1, 1, 1, 1,
-2.144415, -0.7365402, -1.105052, 1, 1, 1, 1, 1,
-2.129847, -0.07668447, -2.150379, 1, 1, 1, 1, 1,
-2.120652, -0.3016902, -1.500693, 1, 1, 1, 1, 1,
-2.105758, 0.9227513, -2.138647, 1, 1, 1, 1, 1,
-2.09158, -1.526964, -2.518432, 1, 1, 1, 1, 1,
-2.030843, 0.7253612, -0.958788, 1, 1, 1, 1, 1,
-2.014586, -1.23517, -2.608914, 1, 1, 1, 1, 1,
-2.008199, 0.01749386, 0.06762914, 0, 0, 1, 1, 1,
-1.986039, 2.05133, -1.169563, 1, 0, 0, 1, 1,
-1.975669, -0.6871457, -0.5598835, 1, 0, 0, 1, 1,
-1.970831, -0.7924405, -2.019671, 1, 0, 0, 1, 1,
-1.929452, -0.7313277, -1.497505, 1, 0, 0, 1, 1,
-1.925095, 0.9290509, -2.606862, 1, 0, 0, 1, 1,
-1.909847, 1.095338, -0.9139357, 0, 0, 0, 1, 1,
-1.893165, -0.01144225, -0.806927, 0, 0, 0, 1, 1,
-1.880659, 0.1692857, -1.743537, 0, 0, 0, 1, 1,
-1.869209, -0.0188417, -2.676578, 0, 0, 0, 1, 1,
-1.866052, 0.6016018, 0.2605203, 0, 0, 0, 1, 1,
-1.864157, 0.7631259, 0.2443631, 0, 0, 0, 1, 1,
-1.857832, 0.6876725, -2.097414, 0, 0, 0, 1, 1,
-1.837265, -0.6423953, -4.225257, 1, 1, 1, 1, 1,
-1.836922, 0.8212244, -1.092298, 1, 1, 1, 1, 1,
-1.820865, -0.3151325, -1.148307, 1, 1, 1, 1, 1,
-1.816103, -0.2172585, -2.042893, 1, 1, 1, 1, 1,
-1.804497, 0.2869121, -3.72385, 1, 1, 1, 1, 1,
-1.800191, 2.028287, -1.168341, 1, 1, 1, 1, 1,
-1.791949, -1.951344, -3.1233, 1, 1, 1, 1, 1,
-1.791944, 1.500997, -0.1181637, 1, 1, 1, 1, 1,
-1.79072, -0.1038799, -1.769785, 1, 1, 1, 1, 1,
-1.78098, -0.3128766, -1.562406, 1, 1, 1, 1, 1,
-1.776277, -0.2494772, -0.844283, 1, 1, 1, 1, 1,
-1.771705, 0.1028842, -1.375538, 1, 1, 1, 1, 1,
-1.770732, -1.417085, -3.475288, 1, 1, 1, 1, 1,
-1.758168, -0.3377682, -1.579393, 1, 1, 1, 1, 1,
-1.748188, -0.7890053, -4.39537, 1, 1, 1, 1, 1,
-1.747339, -1.15889, -1.370867, 0, 0, 1, 1, 1,
-1.740116, -0.5516706, -2.199009, 1, 0, 0, 1, 1,
-1.713982, -1.112239, -1.40881, 1, 0, 0, 1, 1,
-1.707387, 0.8821759, -1.286271, 1, 0, 0, 1, 1,
-1.69905, -0.7528455, -3.088627, 1, 0, 0, 1, 1,
-1.691774, 0.9145562, -2.622409, 1, 0, 0, 1, 1,
-1.684554, 0.6690243, 0.5835471, 0, 0, 0, 1, 1,
-1.67029, -1.775685, -2.230019, 0, 0, 0, 1, 1,
-1.658108, 0.1546606, -2.855267, 0, 0, 0, 1, 1,
-1.653322, -1.111795, -2.534174, 0, 0, 0, 1, 1,
-1.651114, 0.8610089, -0.5903719, 0, 0, 0, 1, 1,
-1.647902, 0.1876722, -2.498302, 0, 0, 0, 1, 1,
-1.622661, -0.6018999, 0.5979092, 0, 0, 0, 1, 1,
-1.587656, -0.5766391, -1.36574, 1, 1, 1, 1, 1,
-1.580491, -1.159707, -1.878621, 1, 1, 1, 1, 1,
-1.580137, -0.1973677, -2.502329, 1, 1, 1, 1, 1,
-1.575262, -0.4453912, -1.776967, 1, 1, 1, 1, 1,
-1.574229, 0.5496168, -1.097024, 1, 1, 1, 1, 1,
-1.561944, 0.05182986, -1.013865, 1, 1, 1, 1, 1,
-1.535715, 0.9766604, -0.5371015, 1, 1, 1, 1, 1,
-1.529319, -0.9891065, -1.488699, 1, 1, 1, 1, 1,
-1.514332, -0.1115337, -1.825741, 1, 1, 1, 1, 1,
-1.503738, 1.360158, -1.096022, 1, 1, 1, 1, 1,
-1.485134, 0.3133632, 0.3219191, 1, 1, 1, 1, 1,
-1.484372, 2.127325, -2.024704, 1, 1, 1, 1, 1,
-1.480466, 0.5526481, -0.434428, 1, 1, 1, 1, 1,
-1.46225, -0.2994609, -0.9389499, 1, 1, 1, 1, 1,
-1.460128, 0.3686927, -1.122345, 1, 1, 1, 1, 1,
-1.45399, -0.9720387, -2.073369, 0, 0, 1, 1, 1,
-1.447275, -0.5845417, -3.003523, 1, 0, 0, 1, 1,
-1.445056, 8.568115e-05, -2.366668, 1, 0, 0, 1, 1,
-1.44364, 1.213536, -0.08083636, 1, 0, 0, 1, 1,
-1.442107, 2.282348, 0.7195734, 1, 0, 0, 1, 1,
-1.435941, 1.157826, -3.618016, 1, 0, 0, 1, 1,
-1.432992, -0.9142519, -2.344241, 0, 0, 0, 1, 1,
-1.426613, 0.3205378, -3.447245, 0, 0, 0, 1, 1,
-1.403973, -0.1463219, -2.741167, 0, 0, 0, 1, 1,
-1.393894, 0.2767255, 0.1418708, 0, 0, 0, 1, 1,
-1.387329, -0.2858907, -1.947463, 0, 0, 0, 1, 1,
-1.387225, 0.6648734, -1.078748, 0, 0, 0, 1, 1,
-1.377451, 1.331884, -0.3654051, 0, 0, 0, 1, 1,
-1.35187, -0.1560141, -2.936113, 1, 1, 1, 1, 1,
-1.347684, -0.1263485, -0.01735018, 1, 1, 1, 1, 1,
-1.344516, -2.154461, -2.717485, 1, 1, 1, 1, 1,
-1.343389, -0.3448375, -2.68895, 1, 1, 1, 1, 1,
-1.338178, 1.409847, -1.465477, 1, 1, 1, 1, 1,
-1.328175, -1.248515, -1.218483, 1, 1, 1, 1, 1,
-1.318968, -1.6509, -1.458563, 1, 1, 1, 1, 1,
-1.310825, -0.545134, -1.154394, 1, 1, 1, 1, 1,
-1.310554, 0.2706622, -3.439485, 1, 1, 1, 1, 1,
-1.306599, 1.299378, 0.8576694, 1, 1, 1, 1, 1,
-1.303852, -1.344679, -0.7754835, 1, 1, 1, 1, 1,
-1.300403, 1.007707, -0.252116, 1, 1, 1, 1, 1,
-1.29847, 0.9299238, -1.014254, 1, 1, 1, 1, 1,
-1.294236, -1.242005, -2.443062, 1, 1, 1, 1, 1,
-1.293954, -1.792138, -2.90264, 1, 1, 1, 1, 1,
-1.290373, 0.0003099147, -1.959836, 0, 0, 1, 1, 1,
-1.284877, -0.1260776, -1.121742, 1, 0, 0, 1, 1,
-1.278839, 0.06240981, -1.473887, 1, 0, 0, 1, 1,
-1.26696, -0.1157142, -2.569542, 1, 0, 0, 1, 1,
-1.260103, -1.2576, -3.349547, 1, 0, 0, 1, 1,
-1.256211, 0.4127639, -1.106514, 1, 0, 0, 1, 1,
-1.254919, 0.05514821, -1.757424, 0, 0, 0, 1, 1,
-1.253728, 0.992765, 0.440666, 0, 0, 0, 1, 1,
-1.245803, -0.771136, -3.443386, 0, 0, 0, 1, 1,
-1.22916, 0.009795259, -0.4952713, 0, 0, 0, 1, 1,
-1.227737, -0.1789059, -0.4952613, 0, 0, 0, 1, 1,
-1.227137, -0.1374623, -0.916876, 0, 0, 0, 1, 1,
-1.209918, -1.638708, -2.928961, 0, 0, 0, 1, 1,
-1.20362, -0.8700779, -1.984155, 1, 1, 1, 1, 1,
-1.197293, 1.736811, -0.9032239, 1, 1, 1, 1, 1,
-1.193911, -1.26143, -2.830219, 1, 1, 1, 1, 1,
-1.184723, 0.1890457, -2.049258, 1, 1, 1, 1, 1,
-1.175589, -1.809574, -0.9888197, 1, 1, 1, 1, 1,
-1.173864, -0.4295012, -1.246323, 1, 1, 1, 1, 1,
-1.152612, -0.2331671, -2.225632, 1, 1, 1, 1, 1,
-1.151262, 1.069068, 0.5242841, 1, 1, 1, 1, 1,
-1.150555, 0.7201635, -1.982211, 1, 1, 1, 1, 1,
-1.140064, 2.142736, 0.1431147, 1, 1, 1, 1, 1,
-1.136733, 0.07442476, -1.791151, 1, 1, 1, 1, 1,
-1.135827, 0.9117267, -1.758461, 1, 1, 1, 1, 1,
-1.134032, -1.151067, -1.463105, 1, 1, 1, 1, 1,
-1.127682, 0.3494699, -3.251423, 1, 1, 1, 1, 1,
-1.115672, 2.215427, -1.506054, 1, 1, 1, 1, 1,
-1.115416, 1.548269, 0.3275216, 0, 0, 1, 1, 1,
-1.102123, -1.648967, -2.366069, 1, 0, 0, 1, 1,
-1.101709, 0.3521596, -1.428862, 1, 0, 0, 1, 1,
-1.098314, 0.6515082, -0.8818068, 1, 0, 0, 1, 1,
-1.096928, -1.615578, -2.250389, 1, 0, 0, 1, 1,
-1.090918, -0.6830241, -2.006648, 1, 0, 0, 1, 1,
-1.088387, 2.505088, 0.3987164, 0, 0, 0, 1, 1,
-1.087769, -0.2548315, -2.623075, 0, 0, 0, 1, 1,
-1.075137, -0.8437831, -2.057974, 0, 0, 0, 1, 1,
-1.070025, -0.3773507, -0.8213186, 0, 0, 0, 1, 1,
-1.068603, -0.1261235, 0.4151567, 0, 0, 0, 1, 1,
-1.058937, -0.7756803, -3.096618, 0, 0, 0, 1, 1,
-1.052636, 0.5903263, -0.5327442, 0, 0, 0, 1, 1,
-1.043769, 0.2818018, -1.496725, 1, 1, 1, 1, 1,
-1.036926, 0.06249059, -1.248943, 1, 1, 1, 1, 1,
-1.036877, -1.629752, -1.694901, 1, 1, 1, 1, 1,
-1.032531, 0.4056526, -2.120538, 1, 1, 1, 1, 1,
-1.03246, 2.05991, 2.235283, 1, 1, 1, 1, 1,
-1.029359, -0.7608067, -3.312518, 1, 1, 1, 1, 1,
-1.021967, 0.2677941, -1.223285, 1, 1, 1, 1, 1,
-1.016201, 0.9510548, -0.3324924, 1, 1, 1, 1, 1,
-1.012581, 1.117416, -0.08047431, 1, 1, 1, 1, 1,
-1.009982, -0.07533155, -0.7740025, 1, 1, 1, 1, 1,
-1.00119, -1.113995, -1.359318, 1, 1, 1, 1, 1,
-0.9860529, 0.6340588, -0.4845852, 1, 1, 1, 1, 1,
-0.978487, 1.632027, -0.3095636, 1, 1, 1, 1, 1,
-0.9781455, 1.474081, -0.8060282, 1, 1, 1, 1, 1,
-0.9731017, -1.455403, -2.040377, 1, 1, 1, 1, 1,
-0.9691985, 1.733316, 0.9693494, 0, 0, 1, 1, 1,
-0.9649808, -0.3936661, -1.98033, 1, 0, 0, 1, 1,
-0.9644393, -0.4335474, -2.25699, 1, 0, 0, 1, 1,
-0.9631342, -0.3927266, -2.059299, 1, 0, 0, 1, 1,
-0.9621843, -0.4655264, -3.15071, 1, 0, 0, 1, 1,
-0.9605612, 0.0357688, -1.53481, 1, 0, 0, 1, 1,
-0.9579142, 1.955554, -2.051636, 0, 0, 0, 1, 1,
-0.9470431, -1.007685, -1.976051, 0, 0, 0, 1, 1,
-0.9462287, -1.966793, -3.012958, 0, 0, 0, 1, 1,
-0.943383, 0.1246088, -2.221307, 0, 0, 0, 1, 1,
-0.9423847, 0.7938926, -1.637177, 0, 0, 0, 1, 1,
-0.9394526, -1.162362, -2.309443, 0, 0, 0, 1, 1,
-0.9364538, 0.1492313, -1.04521, 0, 0, 0, 1, 1,
-0.9355364, 0.3164864, -3.393111, 1, 1, 1, 1, 1,
-0.9325693, 1.363592, -1.895705, 1, 1, 1, 1, 1,
-0.9311765, 0.09605128, -1.023604, 1, 1, 1, 1, 1,
-0.9307802, 0.4779386, -0.5988457, 1, 1, 1, 1, 1,
-0.9272225, -1.59894, -1.16374, 1, 1, 1, 1, 1,
-0.927008, -1.313204, -2.094728, 1, 1, 1, 1, 1,
-0.9256428, -0.6249841, -4.524726, 1, 1, 1, 1, 1,
-0.9213049, -0.6433935, -1.427505, 1, 1, 1, 1, 1,
-0.9196091, -0.349211, -3.306899, 1, 1, 1, 1, 1,
-0.9183719, 0.6665035, -0.9191657, 1, 1, 1, 1, 1,
-0.9182426, 1.217137, -0.2785444, 1, 1, 1, 1, 1,
-0.9169874, 0.7462613, -0.927975, 1, 1, 1, 1, 1,
-0.911911, -0.6057688, -0.8480839, 1, 1, 1, 1, 1,
-0.9091768, 0.2890565, -0.1115453, 1, 1, 1, 1, 1,
-0.908073, -0.6681643, -2.090602, 1, 1, 1, 1, 1,
-0.9068006, 0.2842166, -1.173998, 0, 0, 1, 1, 1,
-0.9064772, 1.897971, -0.5422189, 1, 0, 0, 1, 1,
-0.9016123, 0.9627008, 0.1598624, 1, 0, 0, 1, 1,
-0.9009853, -1.766569, -3.453825, 1, 0, 0, 1, 1,
-0.8977091, 0.3312172, -0.902586, 1, 0, 0, 1, 1,
-0.8902764, 0.1687549, -0.3742376, 1, 0, 0, 1, 1,
-0.886187, 0.6361692, 0.1469356, 0, 0, 0, 1, 1,
-0.8806989, -0.1296906, -2.050811, 0, 0, 0, 1, 1,
-0.8775285, 0.6182799, -0.5546123, 0, 0, 0, 1, 1,
-0.8771439, 0.9570639, 0.05569934, 0, 0, 0, 1, 1,
-0.8757039, -0.1560481, -0.4232158, 0, 0, 0, 1, 1,
-0.8756058, -0.2597154, -1.975053, 0, 0, 0, 1, 1,
-0.8722589, 0.7646637, -2.699784, 0, 0, 0, 1, 1,
-0.8687055, 0.5695661, -0.9696973, 1, 1, 1, 1, 1,
-0.8663846, 0.06003127, 0.1357507, 1, 1, 1, 1, 1,
-0.8507315, -1.667127, -2.059761, 1, 1, 1, 1, 1,
-0.8462108, 0.2495903, -1.406147, 1, 1, 1, 1, 1,
-0.8425863, -0.6731377, -2.275275, 1, 1, 1, 1, 1,
-0.8383157, -1.246888, -1.429502, 1, 1, 1, 1, 1,
-0.8367153, 1.345973, -0.3018264, 1, 1, 1, 1, 1,
-0.8273702, -0.6822679, -0.7736236, 1, 1, 1, 1, 1,
-0.815339, 0.6094629, -2.061407, 1, 1, 1, 1, 1,
-0.8099871, 0.08663941, -3.75308, 1, 1, 1, 1, 1,
-0.809168, 0.5849937, -0.7190586, 1, 1, 1, 1, 1,
-0.8054562, -0.1712479, -2.434571, 1, 1, 1, 1, 1,
-0.8038647, 0.07226489, -0.2500797, 1, 1, 1, 1, 1,
-0.8012679, 1.399735, -1.69802, 1, 1, 1, 1, 1,
-0.7998046, 1.705111, -0.1384978, 1, 1, 1, 1, 1,
-0.7989717, -0.3343906, -1.916473, 0, 0, 1, 1, 1,
-0.7984946, -0.03997668, -0.8822833, 1, 0, 0, 1, 1,
-0.795783, -3.05465, -2.426598, 1, 0, 0, 1, 1,
-0.7919567, 1.119641, -1.860585, 1, 0, 0, 1, 1,
-0.7859709, 0.9396536, 1.086079, 1, 0, 0, 1, 1,
-0.7837881, 0.7405474, -1.997889, 1, 0, 0, 1, 1,
-0.7821923, -1.746464, -2.686084, 0, 0, 0, 1, 1,
-0.7806435, -1.569619, -1.805406, 0, 0, 0, 1, 1,
-0.7654487, 1.805272, -0.5432494, 0, 0, 0, 1, 1,
-0.7641996, -0.1783779, -0.7377489, 0, 0, 0, 1, 1,
-0.7630112, 1.185359, 0.01019316, 0, 0, 0, 1, 1,
-0.76167, -1.300208, -4.201456, 0, 0, 0, 1, 1,
-0.7601273, 0.4475189, -2.198098, 0, 0, 0, 1, 1,
-0.7507131, 0.3119013, -0.5271676, 1, 1, 1, 1, 1,
-0.729665, -1.126797, -3.33652, 1, 1, 1, 1, 1,
-0.723143, -0.4836697, -1.576349, 1, 1, 1, 1, 1,
-0.722131, 0.3475194, -2.764413, 1, 1, 1, 1, 1,
-0.7216118, -0.4815013, -2.186545, 1, 1, 1, 1, 1,
-0.7149818, -2.558453, -2.561358, 1, 1, 1, 1, 1,
-0.7118646, -2.223533, -1.85807, 1, 1, 1, 1, 1,
-0.7057799, -0.7487802, -3.996687, 1, 1, 1, 1, 1,
-0.700954, 0.7257726, -0.9796864, 1, 1, 1, 1, 1,
-0.6947629, 1.341673, -0.2503312, 1, 1, 1, 1, 1,
-0.6943965, -2.753393, -2.893713, 1, 1, 1, 1, 1,
-0.6910492, -1.910443, -3.806678, 1, 1, 1, 1, 1,
-0.6909901, 1.253738, -0.7069229, 1, 1, 1, 1, 1,
-0.6868584, 0.7523149, 0.1596812, 1, 1, 1, 1, 1,
-0.682358, -0.1527316, -0.9004811, 1, 1, 1, 1, 1,
-0.6794369, 0.3776598, -2.260715, 0, 0, 1, 1, 1,
-0.6791198, -0.4875853, -0.9998274, 1, 0, 0, 1, 1,
-0.6760262, -0.6016571, -1.538487, 1, 0, 0, 1, 1,
-0.6753894, -1.097871, -2.979205, 1, 0, 0, 1, 1,
-0.6703166, -1.098179, -1.383311, 1, 0, 0, 1, 1,
-0.6696267, 0.02666286, -1.805795, 1, 0, 0, 1, 1,
-0.6687191, 1.04224, -2.50222, 0, 0, 0, 1, 1,
-0.6660991, 0.8388997, -0.43884, 0, 0, 0, 1, 1,
-0.6646047, 0.493784, -1.289712, 0, 0, 0, 1, 1,
-0.6641899, -2.175656, -2.891883, 0, 0, 0, 1, 1,
-0.663266, -2.205485, -2.289062, 0, 0, 0, 1, 1,
-0.657155, 1.84917, -0.02913309, 0, 0, 0, 1, 1,
-0.6564695, 0.5830467, -1.483236, 0, 0, 0, 1, 1,
-0.6411434, -0.8582884, -3.304706, 1, 1, 1, 1, 1,
-0.6402435, 0.524646, -1.500685, 1, 1, 1, 1, 1,
-0.6394808, 0.5223661, -0.9697148, 1, 1, 1, 1, 1,
-0.6345175, -0.8930644, -2.384365, 1, 1, 1, 1, 1,
-0.6326102, 1.048573, 1.247814, 1, 1, 1, 1, 1,
-0.6275762, -0.48985, -1.786431, 1, 1, 1, 1, 1,
-0.6252505, 0.8215175, -0.4569934, 1, 1, 1, 1, 1,
-0.6213289, -0.8446644, -2.815957, 1, 1, 1, 1, 1,
-0.6191267, -0.379581, -2.841274, 1, 1, 1, 1, 1,
-0.6113055, -0.1507815, -2.011889, 1, 1, 1, 1, 1,
-0.6082857, -0.1568715, -2.973481, 1, 1, 1, 1, 1,
-0.6042795, 0.6748167, -1.114649, 1, 1, 1, 1, 1,
-0.6038734, -2.42382, -2.060499, 1, 1, 1, 1, 1,
-0.6007418, -0.5454807, -3.836062, 1, 1, 1, 1, 1,
-0.6006281, 1.376607, -1.410002, 1, 1, 1, 1, 1,
-0.5906501, 0.7950073, -1.456202, 0, 0, 1, 1, 1,
-0.5897822, -1.571341, -2.108054, 1, 0, 0, 1, 1,
-0.5846955, -0.1703661, -0.1781019, 1, 0, 0, 1, 1,
-0.580044, -2.217875, -3.400676, 1, 0, 0, 1, 1,
-0.5747198, 2.247747, -0.3494001, 1, 0, 0, 1, 1,
-0.5746415, -0.1419034, -1.160764, 1, 0, 0, 1, 1,
-0.5596389, -0.5802116, -3.368694, 0, 0, 0, 1, 1,
-0.5579382, -1.129584, -2.527487, 0, 0, 0, 1, 1,
-0.5564463, -1.287143, -2.553596, 0, 0, 0, 1, 1,
-0.5554541, 0.1782874, -2.029553, 0, 0, 0, 1, 1,
-0.5509783, 0.03375841, -0.7639703, 0, 0, 0, 1, 1,
-0.5505068, -0.8807349, -3.626338, 0, 0, 0, 1, 1,
-0.5489025, -1.445529, -3.098197, 0, 0, 0, 1, 1,
-0.5481342, 1.038482, -2.536113, 1, 1, 1, 1, 1,
-0.5476158, 0.8636782, -2.415766, 1, 1, 1, 1, 1,
-0.5413415, -0.2532445, -2.838901, 1, 1, 1, 1, 1,
-0.5363852, 0.4836226, -1.232769, 1, 1, 1, 1, 1,
-0.5349696, 0.9463575, 1.58424, 1, 1, 1, 1, 1,
-0.5347829, -0.1103831, -2.149689, 1, 1, 1, 1, 1,
-0.5333136, 0.01923009, -2.815963, 1, 1, 1, 1, 1,
-0.5320868, 0.9617818, 0.636359, 1, 1, 1, 1, 1,
-0.527531, 0.8932103, -1.402895, 1, 1, 1, 1, 1,
-0.5250861, -1.273714, -3.029399, 1, 1, 1, 1, 1,
-0.5210039, -1.460844, -1.784783, 1, 1, 1, 1, 1,
-0.5203142, 1.602382, -1.021212, 1, 1, 1, 1, 1,
-0.51842, 0.2879156, -1.738804, 1, 1, 1, 1, 1,
-0.5174955, -0.8685136, -3.347559, 1, 1, 1, 1, 1,
-0.514369, 0.7303877, -1.347519, 1, 1, 1, 1, 1,
-0.5127243, -0.1235499, -1.878132, 0, 0, 1, 1, 1,
-0.5114791, -0.2644752, -2.221881, 1, 0, 0, 1, 1,
-0.5109423, 1.004947, -0.156604, 1, 0, 0, 1, 1,
-0.5108135, 0.5381281, -1.535839, 1, 0, 0, 1, 1,
-0.5095737, 1.806282, -0.7298462, 1, 0, 0, 1, 1,
-0.50881, -2.077673, -2.451281, 1, 0, 0, 1, 1,
-0.5079996, -0.9951422, -2.040213, 0, 0, 0, 1, 1,
-0.5069605, -0.3467837, -2.149588, 0, 0, 0, 1, 1,
-0.5040118, 1.414836, -0.7174856, 0, 0, 0, 1, 1,
-0.5019929, 0.8593516, -1.332637, 0, 0, 0, 1, 1,
-0.5011312, 2.103294, 1.348238, 0, 0, 0, 1, 1,
-0.5006751, -2.179753, -3.210807, 0, 0, 0, 1, 1,
-0.494346, -1.306404, -2.090362, 0, 0, 0, 1, 1,
-0.4940323, -1.568654, -2.824612, 1, 1, 1, 1, 1,
-0.4915327, -0.4895459, -2.755509, 1, 1, 1, 1, 1,
-0.4891084, 0.002754381, -2.383225, 1, 1, 1, 1, 1,
-0.4868827, -1.370929, -2.915306, 1, 1, 1, 1, 1,
-0.4848434, -0.5717319, -1.706531, 1, 1, 1, 1, 1,
-0.4806126, 0.6465101, 0.9864866, 1, 1, 1, 1, 1,
-0.4794079, 0.5898771, 0.3791782, 1, 1, 1, 1, 1,
-0.4738187, 0.832229, -0.7865899, 1, 1, 1, 1, 1,
-0.4723415, -1.138098, -2.665657, 1, 1, 1, 1, 1,
-0.4712693, -0.2864769, -2.165642, 1, 1, 1, 1, 1,
-0.4630746, 0.01187127, -2.127359, 1, 1, 1, 1, 1,
-0.4616114, 1.078783, 0.3275429, 1, 1, 1, 1, 1,
-0.4574484, -1.059943, -3.744528, 1, 1, 1, 1, 1,
-0.4513125, -0.9768037, -4.276412, 1, 1, 1, 1, 1,
-0.4369585, -0.6748269, -1.625512, 1, 1, 1, 1, 1,
-0.4347256, -0.2201184, -2.258775, 0, 0, 1, 1, 1,
-0.4310462, 1.561891, -0.1861532, 1, 0, 0, 1, 1,
-0.4289201, -0.7900012, -3.531593, 1, 0, 0, 1, 1,
-0.4257018, -0.5467153, -2.243381, 1, 0, 0, 1, 1,
-0.4231941, -0.1543311, -2.398022, 1, 0, 0, 1, 1,
-0.422627, 3.082152, 2.761896, 1, 0, 0, 1, 1,
-0.4213589, 2.84031, 0.04608528, 0, 0, 0, 1, 1,
-0.4060812, 0.5329341, -1.566363, 0, 0, 0, 1, 1,
-0.3997059, -0.07334312, -0.2387239, 0, 0, 0, 1, 1,
-0.3990656, -1.358425, -4.69463, 0, 0, 0, 1, 1,
-0.3980658, 0.4176339, -1.107549, 0, 0, 0, 1, 1,
-0.3938205, 2.28735, -1.751073, 0, 0, 0, 1, 1,
-0.3930685, -0.8794584, -1.107295, 0, 0, 0, 1, 1,
-0.3926925, -0.4408387, -2.163679, 1, 1, 1, 1, 1,
-0.3905931, 1.831278, -0.2000629, 1, 1, 1, 1, 1,
-0.389749, -1.875699, -3.210761, 1, 1, 1, 1, 1,
-0.3870364, 0.7723072, -0.6613932, 1, 1, 1, 1, 1,
-0.3869635, -0.4113262, -2.863195, 1, 1, 1, 1, 1,
-0.3863869, 1.087443, 0.7000477, 1, 1, 1, 1, 1,
-0.3842682, 0.2089518, -1.404437, 1, 1, 1, 1, 1,
-0.3829343, -0.2426628, -0.906426, 1, 1, 1, 1, 1,
-0.3823753, -1.200139, -4.117708, 1, 1, 1, 1, 1,
-0.3787634, 0.7337755, -1.262679, 1, 1, 1, 1, 1,
-0.3744034, 0.9901771, 0.08670462, 1, 1, 1, 1, 1,
-0.3728769, -1.056165, -3.077854, 1, 1, 1, 1, 1,
-0.3723149, -1.090881, -2.90346, 1, 1, 1, 1, 1,
-0.3682459, 0.07881762, -1.79004, 1, 1, 1, 1, 1,
-0.3654475, 0.1512551, -1.900046, 1, 1, 1, 1, 1,
-0.360838, 0.7182466, -1.13304, 0, 0, 1, 1, 1,
-0.3602793, 0.2692448, -0.5763033, 1, 0, 0, 1, 1,
-0.3578919, 1.608191, -1.088969, 1, 0, 0, 1, 1,
-0.3566861, -1.010786, -5.166484, 1, 0, 0, 1, 1,
-0.354904, -0.8062433, -2.467913, 1, 0, 0, 1, 1,
-0.3511976, -0.1201859, -0.5622142, 1, 0, 0, 1, 1,
-0.34956, 1.098979, 0.3943378, 0, 0, 0, 1, 1,
-0.3488487, 0.5794958, -1.155461, 0, 0, 0, 1, 1,
-0.3416729, -0.4137573, -2.919743, 0, 0, 0, 1, 1,
-0.3373621, -0.1008376, -3.065883, 0, 0, 0, 1, 1,
-0.3318712, 0.6485109, -0.01182981, 0, 0, 0, 1, 1,
-0.3287689, -2.360099, -2.274652, 0, 0, 0, 1, 1,
-0.3287099, 0.1541693, -0.1292388, 0, 0, 0, 1, 1,
-0.3252922, 1.961377, 0.2481072, 1, 1, 1, 1, 1,
-0.3245532, -1.264576, -3.392303, 1, 1, 1, 1, 1,
-0.3193791, 0.7657636, 2.101783, 1, 1, 1, 1, 1,
-0.3145818, 0.8391242, -0.09142459, 1, 1, 1, 1, 1,
-0.3138762, -0.4295197, -3.130483, 1, 1, 1, 1, 1,
-0.3129932, -0.7346519, -2.205184, 1, 1, 1, 1, 1,
-0.3081226, -1.040835, -4.383214, 1, 1, 1, 1, 1,
-0.3041348, 1.219695, 0.9947519, 1, 1, 1, 1, 1,
-0.301766, 1.477989, 0.2364206, 1, 1, 1, 1, 1,
-0.2955139, -1.735707, -2.890633, 1, 1, 1, 1, 1,
-0.2953936, 0.6295428, -2.465082, 1, 1, 1, 1, 1,
-0.2931627, -0.3909447, -1.702092, 1, 1, 1, 1, 1,
-0.2844686, -0.2762025, -0.6281023, 1, 1, 1, 1, 1,
-0.2825973, -0.552196, -2.088976, 1, 1, 1, 1, 1,
-0.2788717, -2.050161, -3.235024, 1, 1, 1, 1, 1,
-0.2758816, -1.476054, -2.392562, 0, 0, 1, 1, 1,
-0.2724714, -1.183013, -1.480993, 1, 0, 0, 1, 1,
-0.26745, 0.2670965, -0.1830433, 1, 0, 0, 1, 1,
-0.2671197, -0.4258865, -2.039341, 1, 0, 0, 1, 1,
-0.2656549, 0.4019787, -1.980568, 1, 0, 0, 1, 1,
-0.2612947, -1.352104, -4.877089, 1, 0, 0, 1, 1,
-0.2520204, -0.8880479, -0.7451305, 0, 0, 0, 1, 1,
-0.251789, -2.265967, -2.094341, 0, 0, 0, 1, 1,
-0.2512268, 0.03170358, -1.982396, 0, 0, 0, 1, 1,
-0.2458373, 0.3502527, -0.7920121, 0, 0, 0, 1, 1,
-0.2426531, 0.7462867, 0.07722298, 0, 0, 0, 1, 1,
-0.2395119, 0.2499926, -2.831218, 0, 0, 0, 1, 1,
-0.2390819, 0.2940147, 0.7394418, 0, 0, 0, 1, 1,
-0.2369919, -1.004675, -2.001135, 1, 1, 1, 1, 1,
-0.2361071, -0.03481103, -2.324844, 1, 1, 1, 1, 1,
-0.2359398, -0.4281187, -3.119933, 1, 1, 1, 1, 1,
-0.235271, -0.4943214, -3.728867, 1, 1, 1, 1, 1,
-0.2290104, 0.6273454, -0.7009341, 1, 1, 1, 1, 1,
-0.2288336, -0.7044756, -3.574963, 1, 1, 1, 1, 1,
-0.224455, -1.369599, -2.241241, 1, 1, 1, 1, 1,
-0.2230024, 0.05991575, -1.049198, 1, 1, 1, 1, 1,
-0.220693, 0.852993, 0.7932972, 1, 1, 1, 1, 1,
-0.2200787, 0.9879258, 0.8353935, 1, 1, 1, 1, 1,
-0.2162727, -1.086174, -4.277839, 1, 1, 1, 1, 1,
-0.2045967, -1.853796, -3.619018, 1, 1, 1, 1, 1,
-0.2044232, 1.157162, -2.158986, 1, 1, 1, 1, 1,
-0.2035343, 0.6680008, 0.3587296, 1, 1, 1, 1, 1,
-0.2020901, 0.01804916, -0.06692811, 1, 1, 1, 1, 1,
-0.2015726, -0.4023652, -5.023327, 0, 0, 1, 1, 1,
-0.2011007, -0.4984488, -2.867014, 1, 0, 0, 1, 1,
-0.1983439, 1.67153, 0.8061918, 1, 0, 0, 1, 1,
-0.1971352, 0.285421, -1.539775, 1, 0, 0, 1, 1,
-0.1955054, -0.6295712, -2.976805, 1, 0, 0, 1, 1,
-0.192782, -0.8178539, -2.125397, 1, 0, 0, 1, 1,
-0.1920507, 0.2097699, -0.1233341, 0, 0, 0, 1, 1,
-0.1897724, -0.2818369, -1.723946, 0, 0, 0, 1, 1,
-0.1893312, -0.03457318, -3.12037, 0, 0, 0, 1, 1,
-0.1861211, -1.073781, -0.9334726, 0, 0, 0, 1, 1,
-0.1810257, 0.9551933, -0.7373891, 0, 0, 0, 1, 1,
-0.1793762, -0.124191, -2.71044, 0, 0, 0, 1, 1,
-0.1766812, -1.768261, -3.327617, 0, 0, 0, 1, 1,
-0.1680956, 0.3818648, -2.026578, 1, 1, 1, 1, 1,
-0.1663926, -0.3283084, -4.396531, 1, 1, 1, 1, 1,
-0.1654205, -0.109809, -0.4822043, 1, 1, 1, 1, 1,
-0.1634187, 1.51351, -1.113395, 1, 1, 1, 1, 1,
-0.1572473, -1.261621, -3.383367, 1, 1, 1, 1, 1,
-0.1556691, -1.688402, -2.500149, 1, 1, 1, 1, 1,
-0.155612, -0.4507825, -4.248948, 1, 1, 1, 1, 1,
-0.1516646, -0.1448094, -3.023012, 1, 1, 1, 1, 1,
-0.1512024, -0.9957668, -4.287659, 1, 1, 1, 1, 1,
-0.1464491, -1.019421, -4.014017, 1, 1, 1, 1, 1,
-0.145023, -0.3269011, -2.008697, 1, 1, 1, 1, 1,
-0.1431221, 0.3795901, 0.8537974, 1, 1, 1, 1, 1,
-0.1412533, -1.344977, -4.389163, 1, 1, 1, 1, 1,
-0.1398539, -0.2868434, -3.44511, 1, 1, 1, 1, 1,
-0.1392952, -0.3523083, -2.853771, 1, 1, 1, 1, 1,
-0.1343945, 0.6316407, -0.4136835, 0, 0, 1, 1, 1,
-0.1332675, -0.2897674, -3.334699, 1, 0, 0, 1, 1,
-0.1319161, 0.4066269, 0.2346692, 1, 0, 0, 1, 1,
-0.1314522, -0.937138, -1.796916, 1, 0, 0, 1, 1,
-0.1305135, -1.258761, -1.501366, 1, 0, 0, 1, 1,
-0.1262679, -0.4848576, -3.439534, 1, 0, 0, 1, 1,
-0.1230496, -0.8249899, -1.742778, 0, 0, 0, 1, 1,
-0.1230151, -0.9479025, -2.987531, 0, 0, 0, 1, 1,
-0.1228303, 1.75091, 1.941207, 0, 0, 0, 1, 1,
-0.1227235, -0.9021943, -3.276128, 0, 0, 0, 1, 1,
-0.1204535, 1.119711, -0.7014927, 0, 0, 0, 1, 1,
-0.1175237, 0.1685932, -0.7195932, 0, 0, 0, 1, 1,
-0.1152799, -1.891631, -3.567491, 0, 0, 0, 1, 1,
-0.1116624, 0.4221537, -1.721706, 1, 1, 1, 1, 1,
-0.110939, -1.255029, -4.284907, 1, 1, 1, 1, 1,
-0.1079381, 0.9115524, 1.010366, 1, 1, 1, 1, 1,
-0.1075134, 0.7904399, 0.4450592, 1, 1, 1, 1, 1,
-0.1022585, 1.125603, 0.5209045, 1, 1, 1, 1, 1,
-0.09639972, 0.7230994, 1.739246, 1, 1, 1, 1, 1,
-0.08974427, -0.6156871, -1.915921, 1, 1, 1, 1, 1,
-0.08681889, -0.2383048, -1.038084, 1, 1, 1, 1, 1,
-0.08415803, -0.40202, -1.397886, 1, 1, 1, 1, 1,
-0.08362425, 0.2736279, -0.542329, 1, 1, 1, 1, 1,
-0.08253081, 0.3898569, -0.5195323, 1, 1, 1, 1, 1,
-0.07394299, 1.729585, 0.8574787, 1, 1, 1, 1, 1,
-0.0735411, -0.7056273, -1.473044, 1, 1, 1, 1, 1,
-0.06908926, -0.4572004, -2.3959, 1, 1, 1, 1, 1,
-0.06306369, -0.5257952, -2.118254, 1, 1, 1, 1, 1,
-0.06018205, 1.41583, 1.613839, 0, 0, 1, 1, 1,
-0.04910264, -1.826926, -3.53423, 1, 0, 0, 1, 1,
-0.04664096, 0.04155654, -0.6690907, 1, 0, 0, 1, 1,
-0.04643259, 1.665537, 0.02227369, 1, 0, 0, 1, 1,
-0.04577773, 0.09661233, -0.3349975, 1, 0, 0, 1, 1,
-0.04443675, -0.343529, -3.396389, 1, 0, 0, 1, 1,
-0.04166, 1.01081, -1.019097, 0, 0, 0, 1, 1,
-0.03978378, -0.2905054, -3.519957, 0, 0, 0, 1, 1,
-0.03595033, -1.794246, -1.331256, 0, 0, 0, 1, 1,
-0.03527714, 1.186222, 1.78548, 0, 0, 0, 1, 1,
-0.03526273, -0.7115927, -4.119584, 0, 0, 0, 1, 1,
-0.03433665, -0.5948884, -4.23585, 0, 0, 0, 1, 1,
-0.032877, -2.479628, -2.797772, 0, 0, 0, 1, 1,
-0.02879252, -0.3577091, -1.011607, 1, 1, 1, 1, 1,
-0.02727985, 0.920013, -0.9770555, 1, 1, 1, 1, 1,
-0.02718532, -0.8527637, -4.034076, 1, 1, 1, 1, 1,
-0.02595243, 0.3052059, -0.8981713, 1, 1, 1, 1, 1,
-0.02417089, 0.3321596, 1.964499, 1, 1, 1, 1, 1,
-0.02205747, -1.024865, -3.736441, 1, 1, 1, 1, 1,
-0.02046976, 1.301098, -0.2948475, 1, 1, 1, 1, 1,
-0.01973529, 0.8183504, 0.7316826, 1, 1, 1, 1, 1,
-0.01666549, 0.3195739, -0.4828945, 1, 1, 1, 1, 1,
-0.01617672, -0.6564992, -0.785041, 1, 1, 1, 1, 1,
-0.01476459, -0.5425472, -4.709895, 1, 1, 1, 1, 1,
-0.01385706, -0.1949004, -5.729572, 1, 1, 1, 1, 1,
-0.01378394, -0.2567253, -5.572554, 1, 1, 1, 1, 1,
-0.007770029, 1.803197, -0.6479523, 1, 1, 1, 1, 1,
-0.007363128, 0.4155303, -0.2567306, 1, 1, 1, 1, 1,
-0.006770919, -0.1129808, -4.534638, 0, 0, 1, 1, 1,
-0.0055358, -0.5598226, -1.570113, 1, 0, 0, 1, 1,
-0.004438651, 1.215169, 1.001277, 1, 0, 0, 1, 1,
-0.0005927554, -0.003036462, -3.342983, 1, 0, 0, 1, 1,
0.003016908, -1.220949, 3.804027, 1, 0, 0, 1, 1,
0.004398135, -1.072933, 4.226705, 1, 0, 0, 1, 1,
0.01153392, 1.262931, 1.700849, 0, 0, 0, 1, 1,
0.01327721, 0.5378311, 0.9446702, 0, 0, 0, 1, 1,
0.01752606, -0.7721286, 3.356971, 0, 0, 0, 1, 1,
0.01939211, 0.05859238, 0.2263453, 0, 0, 0, 1, 1,
0.02478278, -0.4108175, 4.750651, 0, 0, 0, 1, 1,
0.02482809, 1.336344, 1.326646, 0, 0, 0, 1, 1,
0.0285056, 0.2635567, -0.5784263, 0, 0, 0, 1, 1,
0.03152369, 0.6157137, -0.9129947, 1, 1, 1, 1, 1,
0.03186815, -0.6032007, 3.118777, 1, 1, 1, 1, 1,
0.03693406, 1.712207, 0.1457392, 1, 1, 1, 1, 1,
0.0373507, -0.02091312, 1.718469, 1, 1, 1, 1, 1,
0.03848906, -0.1455704, 3.527202, 1, 1, 1, 1, 1,
0.04204149, -0.6663843, 3.536186, 1, 1, 1, 1, 1,
0.04244333, 0.3274381, -0.8850582, 1, 1, 1, 1, 1,
0.04610771, -1.094923, 1.820417, 1, 1, 1, 1, 1,
0.04730614, -0.1845884, 3.06014, 1, 1, 1, 1, 1,
0.04741487, -1.096169, 4.692635, 1, 1, 1, 1, 1,
0.04753787, -1.150512, 2.064688, 1, 1, 1, 1, 1,
0.04950394, 1.510802, 1.021494, 1, 1, 1, 1, 1,
0.05119012, -0.118095, 3.181033, 1, 1, 1, 1, 1,
0.05982552, -0.7243571, 4.465203, 1, 1, 1, 1, 1,
0.05998465, 1.995771, 0.7187366, 1, 1, 1, 1, 1,
0.05999809, -0.5767838, 2.32443, 0, 0, 1, 1, 1,
0.06109697, 0.230114, -0.08343389, 1, 0, 0, 1, 1,
0.06262207, -1.152493, 2.732247, 1, 0, 0, 1, 1,
0.06745569, -1.165135, 2.232339, 1, 0, 0, 1, 1,
0.07357204, -0.4709836, 3.202915, 1, 0, 0, 1, 1,
0.07872188, -2.0982, 4.82368, 1, 0, 0, 1, 1,
0.08093522, -1.494036, 5.356248, 0, 0, 0, 1, 1,
0.08444884, -0.3260992, 3.869206, 0, 0, 0, 1, 1,
0.08477367, 0.1875415, 0.8334457, 0, 0, 0, 1, 1,
0.101284, -1.246535, 1.50519, 0, 0, 0, 1, 1,
0.1034089, -1.880409, 3.075697, 0, 0, 0, 1, 1,
0.1036905, 1.218046, 0.2056567, 0, 0, 0, 1, 1,
0.113486, -1.046185, 2.179127, 0, 0, 0, 1, 1,
0.1138941, -0.5213156, 3.031338, 1, 1, 1, 1, 1,
0.1140828, -0.06117133, 1.155775, 1, 1, 1, 1, 1,
0.1170949, 2.113339, -1.344026, 1, 1, 1, 1, 1,
0.1183658, 0.00803989, 0.5099894, 1, 1, 1, 1, 1,
0.1189307, 1.034686, 0.3479567, 1, 1, 1, 1, 1,
0.1189435, -0.009814528, 1.577449, 1, 1, 1, 1, 1,
0.1191705, -0.3200129, 2.276648, 1, 1, 1, 1, 1,
0.1201782, -0.6506872, 3.250331, 1, 1, 1, 1, 1,
0.1219171, 0.7042278, -1.930536, 1, 1, 1, 1, 1,
0.1336558, 0.2112214, -0.1925009, 1, 1, 1, 1, 1,
0.1353998, 1.232844, 1.31769, 1, 1, 1, 1, 1,
0.1396575, 0.4134473, 0.05970014, 1, 1, 1, 1, 1,
0.1399287, 0.933382, 1.246318, 1, 1, 1, 1, 1,
0.1415941, -1.888398, 3.258327, 1, 1, 1, 1, 1,
0.1472483, -0.2007197, 2.197575, 1, 1, 1, 1, 1,
0.1497471, 0.8134236, 1.65535, 0, 0, 1, 1, 1,
0.1529563, -1.112862, 2.798115, 1, 0, 0, 1, 1,
0.1529632, -0.07109785, 1.747615, 1, 0, 0, 1, 1,
0.1560404, 1.457884, -0.2656926, 1, 0, 0, 1, 1,
0.1563343, 0.03492286, 1.473346, 1, 0, 0, 1, 1,
0.1574315, -0.4825502, 1.732056, 1, 0, 0, 1, 1,
0.1604142, -2.642121, 1.549391, 0, 0, 0, 1, 1,
0.1607356, -0.5072321, 2.324041, 0, 0, 0, 1, 1,
0.1614529, 0.7962574, 0.5014668, 0, 0, 0, 1, 1,
0.1630007, 0.3762947, 0.4239782, 0, 0, 0, 1, 1,
0.166877, 0.197266, 0.9722389, 0, 0, 0, 1, 1,
0.1720546, -0.9992231, 1.487457, 0, 0, 0, 1, 1,
0.175151, -0.5081424, 2.12671, 0, 0, 0, 1, 1,
0.1780151, -1.494128, 3.110281, 1, 1, 1, 1, 1,
0.1782318, 1.009597, 1.820833, 1, 1, 1, 1, 1,
0.1798774, 0.6364666, -0.7228224, 1, 1, 1, 1, 1,
0.1812338, 0.9557469, 1.470552, 1, 1, 1, 1, 1,
0.1815346, -1.856213, 4.925471, 1, 1, 1, 1, 1,
0.1876548, 1.326696, 0.4631814, 1, 1, 1, 1, 1,
0.1887545, 1.374436, 0.8492977, 1, 1, 1, 1, 1,
0.1919058, 1.096265, 0.07515332, 1, 1, 1, 1, 1,
0.1929193, -0.4957991, 3.593147, 1, 1, 1, 1, 1,
0.2032562, 0.8137557, 0.2476949, 1, 1, 1, 1, 1,
0.203713, -0.7237512, 3.74972, 1, 1, 1, 1, 1,
0.205341, 0.2634309, -1.400316, 1, 1, 1, 1, 1,
0.2059766, 1.052987, 1.282189, 1, 1, 1, 1, 1,
0.207261, 0.9705783, -0.2944355, 1, 1, 1, 1, 1,
0.2164821, -2.777723, 2.604286, 1, 1, 1, 1, 1,
0.2247771, -1.639278, 3.538797, 0, 0, 1, 1, 1,
0.2268969, -1.380298, 1.577731, 1, 0, 0, 1, 1,
0.2319415, -0.1795678, 2.763306, 1, 0, 0, 1, 1,
0.2323148, 0.5761938, 1.404561, 1, 0, 0, 1, 1,
0.235016, -1.408923, 2.127147, 1, 0, 0, 1, 1,
0.2388634, -1.336301, 2.771153, 1, 0, 0, 1, 1,
0.2412691, -1.742866, 3.041942, 0, 0, 0, 1, 1,
0.2421142, -0.1411379, 2.063293, 0, 0, 0, 1, 1,
0.243383, -0.07400258, 2.598102, 0, 0, 0, 1, 1,
0.2508586, 0.7171477, 2.141274, 0, 0, 0, 1, 1,
0.2582248, -0.283562, 2.674422, 0, 0, 0, 1, 1,
0.2582339, 0.04704481, -0.658532, 0, 0, 0, 1, 1,
0.2589281, 1.098757, -0.3426912, 0, 0, 0, 1, 1,
0.2593907, -2.668579, 1.931863, 1, 1, 1, 1, 1,
0.259462, 2.09967, 0.6198971, 1, 1, 1, 1, 1,
0.261656, 1.521674, 0.3157918, 1, 1, 1, 1, 1,
0.2623682, -0.518997, 3.394664, 1, 1, 1, 1, 1,
0.2723729, -0.5043762, 3.370567, 1, 1, 1, 1, 1,
0.2764323, -0.1920857, 2.339099, 1, 1, 1, 1, 1,
0.2779132, 0.2135739, -0.7360119, 1, 1, 1, 1, 1,
0.2803034, 0.583016, 0.2963949, 1, 1, 1, 1, 1,
0.2820395, -0.2346282, 2.00075, 1, 1, 1, 1, 1,
0.288479, 0.2983095, 0.6232736, 1, 1, 1, 1, 1,
0.289977, -0.1071988, 1.253855, 1, 1, 1, 1, 1,
0.2903029, -0.6620564, 4.146539, 1, 1, 1, 1, 1,
0.3001214, -0.2456898, 1.233499, 1, 1, 1, 1, 1,
0.3067387, 0.8711551, 2.377024, 1, 1, 1, 1, 1,
0.308752, 0.1026844, 0.04430986, 1, 1, 1, 1, 1,
0.3090115, 1.173682, 0.6625106, 0, 0, 1, 1, 1,
0.3118974, -1.461733, 3.705047, 1, 0, 0, 1, 1,
0.3132908, -0.5384403, 1.542812, 1, 0, 0, 1, 1,
0.3169772, -0.02390742, 2.049498, 1, 0, 0, 1, 1,
0.3212331, 0.04988186, 2.689279, 1, 0, 0, 1, 1,
0.321811, 0.1359337, 0.5752682, 1, 0, 0, 1, 1,
0.321837, 1.765509, -0.9403038, 0, 0, 0, 1, 1,
0.322379, -0.3403604, 2.656177, 0, 0, 0, 1, 1,
0.3243223, 0.3359998, -0.7727398, 0, 0, 0, 1, 1,
0.3259725, 0.2408602, -0.4043971, 0, 0, 0, 1, 1,
0.3304102, -0.6781945, 2.546923, 0, 0, 0, 1, 1,
0.332537, 0.628722, 0.173652, 0, 0, 0, 1, 1,
0.3331796, -0.2095428, 2.201447, 0, 0, 0, 1, 1,
0.3380073, -0.6116841, 2.139082, 1, 1, 1, 1, 1,
0.3391998, -0.606234, 2.159271, 1, 1, 1, 1, 1,
0.343526, -0.1371997, 1.809288, 1, 1, 1, 1, 1,
0.3463944, -0.6204678, 2.781248, 1, 1, 1, 1, 1,
0.3469431, 1.340235, 1.388958, 1, 1, 1, 1, 1,
0.3501669, 2.64619, 0.2425549, 1, 1, 1, 1, 1,
0.3506366, 0.4049497, 0.9658931, 1, 1, 1, 1, 1,
0.3526338, 0.08283803, 0.4175738, 1, 1, 1, 1, 1,
0.3533481, 0.5662374, 0.6095789, 1, 1, 1, 1, 1,
0.353734, -0.5533183, 2.025966, 1, 1, 1, 1, 1,
0.356206, -0.9606653, 1.986335, 1, 1, 1, 1, 1,
0.358831, -0.3993759, 4.637556, 1, 1, 1, 1, 1,
0.3589562, 0.7311092, -1.173634, 1, 1, 1, 1, 1,
0.3644057, 0.6360309, -0.9551368, 1, 1, 1, 1, 1,
0.3688637, -0.8717183, 2.968425, 1, 1, 1, 1, 1,
0.3710746, -0.1589966, 0.9827955, 0, 0, 1, 1, 1,
0.3736246, -0.9461114, 2.059573, 1, 0, 0, 1, 1,
0.3797694, 1.793804, -0.02045967, 1, 0, 0, 1, 1,
0.3809836, 0.6503305, 0.5858613, 1, 0, 0, 1, 1,
0.3859548, -0.9388413, 2.369649, 1, 0, 0, 1, 1,
0.3984202, -0.1138915, 1.528001, 1, 0, 0, 1, 1,
0.3990757, 0.4601747, 1.528117, 0, 0, 0, 1, 1,
0.3995674, -0.120364, 2.43266, 0, 0, 0, 1, 1,
0.4013146, -1.663813, 2.122505, 0, 0, 0, 1, 1,
0.4056323, 0.241503, 1.227947, 0, 0, 0, 1, 1,
0.4094815, 0.6963504, -0.3658057, 0, 0, 0, 1, 1,
0.415877, -1.822063, 3.466154, 0, 0, 0, 1, 1,
0.4197704, -1.405681, 2.19977, 0, 0, 0, 1, 1,
0.4204525, -0.4959948, 2.34159, 1, 1, 1, 1, 1,
0.4230286, -1.592256, 0.9769376, 1, 1, 1, 1, 1,
0.4242112, -0.2684471, 2.543234, 1, 1, 1, 1, 1,
0.4258358, -1.633312, 3.319824, 1, 1, 1, 1, 1,
0.4286831, 1.357269, -1.454292, 1, 1, 1, 1, 1,
0.433593, -0.7857657, 3.01068, 1, 1, 1, 1, 1,
0.4367585, -0.4035763, 4.346464, 1, 1, 1, 1, 1,
0.4389018, -1.314426, 1.353195, 1, 1, 1, 1, 1,
0.4403847, 0.1724668, 1.547835, 1, 1, 1, 1, 1,
0.4412538, -0.9226233, 3.66764, 1, 1, 1, 1, 1,
0.4433728, 0.2629524, 1.622758, 1, 1, 1, 1, 1,
0.4469779, -0.7916739, 1.786044, 1, 1, 1, 1, 1,
0.4510102, -1.164519, 3.071328, 1, 1, 1, 1, 1,
0.4512038, 1.281881, -0.931223, 1, 1, 1, 1, 1,
0.4534016, 0.1372776, 0.9873345, 1, 1, 1, 1, 1,
0.4585131, -1.26187, 4.325495, 0, 0, 1, 1, 1,
0.4651253, -0.4002252, 1.645263, 1, 0, 0, 1, 1,
0.4655297, 0.4161859, 2.223972, 1, 0, 0, 1, 1,
0.4674446, -0.6634461, 0.5705807, 1, 0, 0, 1, 1,
0.4702512, -1.025007, 3.074257, 1, 0, 0, 1, 1,
0.4723968, -1.537197, 1.54046, 1, 0, 0, 1, 1,
0.4735882, -0.0726904, 1.959423, 0, 0, 0, 1, 1,
0.4748893, 1.352113, -1.140546, 0, 0, 0, 1, 1,
0.4803275, 0.8624362, 0.6823965, 0, 0, 0, 1, 1,
0.4941817, -0.4410783, 3.113259, 0, 0, 0, 1, 1,
0.4947106, -0.2566991, 1.448115, 0, 0, 0, 1, 1,
0.4968166, 0.9892849, 1.515226, 0, 0, 0, 1, 1,
0.4979981, -0.6298868, 2.178657, 0, 0, 0, 1, 1,
0.5019042, -0.8991951, 1.765739, 1, 1, 1, 1, 1,
0.5021204, -0.4261528, 2.07126, 1, 1, 1, 1, 1,
0.5036665, 0.4345694, 1.15129, 1, 1, 1, 1, 1,
0.508971, 0.5789325, 0.8427783, 1, 1, 1, 1, 1,
0.5147018, 2.014984, 1.278, 1, 1, 1, 1, 1,
0.522703, -1.16233, 3.202643, 1, 1, 1, 1, 1,
0.5231369, -0.8120024, 2.161473, 1, 1, 1, 1, 1,
0.5237333, -1.01644, 1.798703, 1, 1, 1, 1, 1,
0.5255516, -1.416241, 0.5579987, 1, 1, 1, 1, 1,
0.5271035, -1.247258, 3.885388, 1, 1, 1, 1, 1,
0.5331531, -1.974592, 3.017875, 1, 1, 1, 1, 1,
0.53351, 0.7061641, -0.8724433, 1, 1, 1, 1, 1,
0.5343476, 1.427385, 0.4182128, 1, 1, 1, 1, 1,
0.5423203, 1.005121, 2.078371, 1, 1, 1, 1, 1,
0.5466218, -0.1754605, 0.3450527, 1, 1, 1, 1, 1,
0.5560144, 0.866221, 0.03295886, 0, 0, 1, 1, 1,
0.5621821, -0.2845201, 0.9884158, 1, 0, 0, 1, 1,
0.5630131, -0.981163, 2.539621, 1, 0, 0, 1, 1,
0.567354, -0.5777309, 3.273982, 1, 0, 0, 1, 1,
0.5711535, 0.2783907, 0.3939121, 1, 0, 0, 1, 1,
0.5716975, 1.310474, -0.3181145, 1, 0, 0, 1, 1,
0.5719616, -0.560483, 1.394215, 0, 0, 0, 1, 1,
0.5746559, 1.299935, -2.154081, 0, 0, 0, 1, 1,
0.5770373, 0.7424208, 0.983595, 0, 0, 0, 1, 1,
0.5775149, -0.9809719, 1.18485, 0, 0, 0, 1, 1,
0.578003, 0.9779847, -0.02476104, 0, 0, 0, 1, 1,
0.5795642, -0.7814837, 4.631677, 0, 0, 0, 1, 1,
0.582454, -0.1799568, 0.5709365, 0, 0, 0, 1, 1,
0.5829996, 0.6362325, 1.297883, 1, 1, 1, 1, 1,
0.5879573, 0.9306569, 0.5854288, 1, 1, 1, 1, 1,
0.5882151, -0.4157902, 2.385625, 1, 1, 1, 1, 1,
0.5885539, 0.555034, 1.205025, 1, 1, 1, 1, 1,
0.5891933, 3.255985, 0.5013671, 1, 1, 1, 1, 1,
0.5958828, -0.2664891, 2.448613, 1, 1, 1, 1, 1,
0.5963151, 0.9654996, 2.483748, 1, 1, 1, 1, 1,
0.59654, -1.916651, 3.709019, 1, 1, 1, 1, 1,
0.6042758, 0.006401076, 2.236422, 1, 1, 1, 1, 1,
0.607731, -0.8097324, 3.386877, 1, 1, 1, 1, 1,
0.6083992, -1.752459, 1.913916, 1, 1, 1, 1, 1,
0.6086718, -0.2049712, 3.712311, 1, 1, 1, 1, 1,
0.6096539, -0.5772097, 0.3277771, 1, 1, 1, 1, 1,
0.6149968, -1.036715, 3.170757, 1, 1, 1, 1, 1,
0.6216843, -0.4555684, 0.01075447, 1, 1, 1, 1, 1,
0.6233237, -1.076122, 4.566366, 0, 0, 1, 1, 1,
0.6241524, 0.3659621, 0.2710059, 1, 0, 0, 1, 1,
0.6244106, -1.918964, 3.507795, 1, 0, 0, 1, 1,
0.6258991, -1.354466, 3.874222, 1, 0, 0, 1, 1,
0.6290938, -0.8763499, 1.792368, 1, 0, 0, 1, 1,
0.6304691, -0.2453971, 0.2747618, 1, 0, 0, 1, 1,
0.6312008, -2.042945, 3.825427, 0, 0, 0, 1, 1,
0.6347778, -1.1051, 4.222462, 0, 0, 0, 1, 1,
0.6446043, 1.151759, 0.2367564, 0, 0, 0, 1, 1,
0.6446918, -0.2075054, -0.2011643, 0, 0, 0, 1, 1,
0.6470488, 0.8996721, 1.607668, 0, 0, 0, 1, 1,
0.6480824, 1.403993, 1.29337, 0, 0, 0, 1, 1,
0.6546128, 1.416439, 1.781834, 0, 0, 0, 1, 1,
0.6574207, -0.1989861, 3.755079, 1, 1, 1, 1, 1,
0.6686417, 1.428851, 0.6052529, 1, 1, 1, 1, 1,
0.6734721, 0.269354, 2.448956, 1, 1, 1, 1, 1,
0.674302, 1.080532, -0.2203495, 1, 1, 1, 1, 1,
0.6752911, -0.7205756, 2.396683, 1, 1, 1, 1, 1,
0.6776679, -1.438722, 2.224804, 1, 1, 1, 1, 1,
0.6784356, -0.8531337, 2.0371, 1, 1, 1, 1, 1,
0.6789151, -1.041552, 3.151006, 1, 1, 1, 1, 1,
0.6946273, -0.7663496, 2.356946, 1, 1, 1, 1, 1,
0.6990994, 0.5065274, 1.560906, 1, 1, 1, 1, 1,
0.7002018, -0.02111544, 2.775592, 1, 1, 1, 1, 1,
0.7036461, 1.089465, -1.161277, 1, 1, 1, 1, 1,
0.7087477, 0.1119784, 3.778414, 1, 1, 1, 1, 1,
0.7092689, 1.031614, 0.476593, 1, 1, 1, 1, 1,
0.7158239, -1.898831, 3.020049, 1, 1, 1, 1, 1,
0.7166042, 2.267342, -0.4748612, 0, 0, 1, 1, 1,
0.7237765, -1.431203, 2.509623, 1, 0, 0, 1, 1,
0.7257738, 1.857467, 2.32948, 1, 0, 0, 1, 1,
0.7320163, 1.510681, -0.0632825, 1, 0, 0, 1, 1,
0.7413412, -0.5041541, 1.709013, 1, 0, 0, 1, 1,
0.7426711, 1.302107, -0.2505964, 1, 0, 0, 1, 1,
0.7428479, 1.303436, 0.5615414, 0, 0, 0, 1, 1,
0.7451668, -1.682492, 2.244755, 0, 0, 0, 1, 1,
0.7456417, 1.383029, -1.060323, 0, 0, 0, 1, 1,
0.7481646, -1.760394, 3.330421, 0, 0, 0, 1, 1,
0.7553254, 0.5110983, 0.8909771, 0, 0, 0, 1, 1,
0.7578159, -1.38511, 3.183914, 0, 0, 0, 1, 1,
0.7584894, 1.188632, 1.111826, 0, 0, 0, 1, 1,
0.7592595, 0.3153822, 0.3949726, 1, 1, 1, 1, 1,
0.7600002, 0.1206692, 0.4716374, 1, 1, 1, 1, 1,
0.760341, -0.4695243, 1.499901, 1, 1, 1, 1, 1,
0.7610516, 0.6930493, -1.064284, 1, 1, 1, 1, 1,
0.7620476, 0.9166306, 1.45272, 1, 1, 1, 1, 1,
0.7681381, 1.504749, 0.968008, 1, 1, 1, 1, 1,
0.7683573, -1.072326, 1.764512, 1, 1, 1, 1, 1,
0.7687335, -0.6020711, 1.95315, 1, 1, 1, 1, 1,
0.7792723, 2.092431, -0.8646225, 1, 1, 1, 1, 1,
0.7865791, -0.1101255, 2.071879, 1, 1, 1, 1, 1,
0.7875463, -1.128949, 2.914457, 1, 1, 1, 1, 1,
0.7901735, 0.1669867, 0.329797, 1, 1, 1, 1, 1,
0.7909894, 0.09478559, 1.555706, 1, 1, 1, 1, 1,
0.7956468, 0.9282554, 3.065433, 1, 1, 1, 1, 1,
0.7975245, 1.991754, -1.249806, 1, 1, 1, 1, 1,
0.8085291, -2.171124, 1.841256, 0, 0, 1, 1, 1,
0.8238415, 0.4402899, 1.786512, 1, 0, 0, 1, 1,
0.8240994, 1.639548, 0.356295, 1, 0, 0, 1, 1,
0.8267383, 0.4395244, 0.6175799, 1, 0, 0, 1, 1,
0.8269957, -2.638545, 2.601277, 1, 0, 0, 1, 1,
0.8300471, 0.940726, -1.903618, 1, 0, 0, 1, 1,
0.8304521, 2.39055, 0.1880371, 0, 0, 0, 1, 1,
0.8326603, -0.4840449, 3.476551, 0, 0, 0, 1, 1,
0.8353876, -0.4439907, 1.920235, 0, 0, 0, 1, 1,
0.8357267, 0.5844914, 0.1493844, 0, 0, 0, 1, 1,
0.8426533, 0.7040869, 1.054471, 0, 0, 0, 1, 1,
0.8446985, 1.508856, 0.7985536, 0, 0, 0, 1, 1,
0.8476673, 0.05785668, 1.25, 0, 0, 0, 1, 1,
0.8479751, 0.4838238, -0.6571605, 1, 1, 1, 1, 1,
0.8495113, -0.4832489, 1.206158, 1, 1, 1, 1, 1,
0.8525679, -0.1525471, 1.570553, 1, 1, 1, 1, 1,
0.852606, -0.2446212, 1.996302, 1, 1, 1, 1, 1,
0.8545743, 1.531889, -0.9752696, 1, 1, 1, 1, 1,
0.8667669, -0.2987531, 1.349309, 1, 1, 1, 1, 1,
0.8694397, -0.0438987, 1.112667, 1, 1, 1, 1, 1,
0.8702611, 0.1423964, 0.7434277, 1, 1, 1, 1, 1,
0.8797461, 0.4808349, -0.1494409, 1, 1, 1, 1, 1,
0.8798391, 0.5269597, 1.986073, 1, 1, 1, 1, 1,
0.8834116, -1.349845, 2.387144, 1, 1, 1, 1, 1,
0.8873329, 2.78522, 1.905453, 1, 1, 1, 1, 1,
0.8903708, -0.8427204, 3.300195, 1, 1, 1, 1, 1,
0.8937695, 0.4255481, 0.9174512, 1, 1, 1, 1, 1,
0.896374, -0.1199214, 0.9365261, 1, 1, 1, 1, 1,
0.8996015, 0.02213898, 1.500142, 0, 0, 1, 1, 1,
0.908385, 0.8923129, 0.6251078, 1, 0, 0, 1, 1,
0.9096609, -1.263058, 1.414455, 1, 0, 0, 1, 1,
0.913628, -0.06534152, 1.11448, 1, 0, 0, 1, 1,
0.9147589, -0.0545756, 2.073087, 1, 0, 0, 1, 1,
0.9158936, -0.7049459, 2.012522, 1, 0, 0, 1, 1,
0.9287828, -1.285657, 3.271662, 0, 0, 0, 1, 1,
0.9288238, 0.1878493, -0.669134, 0, 0, 0, 1, 1,
0.9393137, 0.2993391, 0.6508421, 0, 0, 0, 1, 1,
0.9401869, 0.02673458, 0.7306873, 0, 0, 0, 1, 1,
0.9410803, 0.7796038, 0.8516651, 0, 0, 0, 1, 1,
0.9415222, 2.625402, 1.182001, 0, 0, 0, 1, 1,
0.9473306, -0.06627326, 0.6420249, 0, 0, 0, 1, 1,
0.9480239, 1.203318, -1.314681, 1, 1, 1, 1, 1,
0.950612, -0.6880324, 3.052121, 1, 1, 1, 1, 1,
0.9514204, 0.5513356, -0.6316136, 1, 1, 1, 1, 1,
0.9609228, 0.7255101, -0.1791485, 1, 1, 1, 1, 1,
0.9629201, -1.919696, 1.146961, 1, 1, 1, 1, 1,
0.9656361, 1.062491, 0.1165965, 1, 1, 1, 1, 1,
0.966446, -0.4134035, 2.83751, 1, 1, 1, 1, 1,
0.9713728, -0.2402387, 2.814162, 1, 1, 1, 1, 1,
0.9774851, 0.4227082, 2.599499, 1, 1, 1, 1, 1,
0.9789196, 0.2545716, 2.270543, 1, 1, 1, 1, 1,
0.9884712, -1.450315, 2.567708, 1, 1, 1, 1, 1,
0.9926957, 1.75567, 1.576898, 1, 1, 1, 1, 1,
0.9951539, -0.7371746, 2.354887, 1, 1, 1, 1, 1,
0.9967, -0.5138919, -1.624577, 1, 1, 1, 1, 1,
1.004478, -0.2027268, -0.3939398, 1, 1, 1, 1, 1,
1.015368, -0.9027556, 1.870257, 0, 0, 1, 1, 1,
1.016554, -2.321788, 1.488139, 1, 0, 0, 1, 1,
1.019325, -0.5812093, 2.377862, 1, 0, 0, 1, 1,
1.023981, -1.602635, 1.599626, 1, 0, 0, 1, 1,
1.025092, -0.4840746, 1.715877, 1, 0, 0, 1, 1,
1.031341, -0.2071137, 1.765403, 1, 0, 0, 1, 1,
1.03507, 0.486005, -0.401662, 0, 0, 0, 1, 1,
1.037597, -0.1390096, 1.958068, 0, 0, 0, 1, 1,
1.041627, 0.3175761, 1.438854, 0, 0, 0, 1, 1,
1.051194, 0.3244603, 2.371006, 0, 0, 0, 1, 1,
1.054274, -1.084168, 3.124629, 0, 0, 0, 1, 1,
1.057693, 0.2338207, 1.432773, 0, 0, 0, 1, 1,
1.062296, 1.246496, 0.4351213, 0, 0, 0, 1, 1,
1.066617, 0.2801697, 0.638517, 1, 1, 1, 1, 1,
1.074275, 0.562048, 0.9311338, 1, 1, 1, 1, 1,
1.091851, 1.179922, 0.9947448, 1, 1, 1, 1, 1,
1.104778, -0.9763066, 2.876498, 1, 1, 1, 1, 1,
1.107084, -0.2179049, 3.29648, 1, 1, 1, 1, 1,
1.10744, -0.4921959, 2.636758, 1, 1, 1, 1, 1,
1.114036, 0.9550541, 0.6553327, 1, 1, 1, 1, 1,
1.115784, -0.2417041, 1.852458, 1, 1, 1, 1, 1,
1.117704, 0.5232088, 0.5422642, 1, 1, 1, 1, 1,
1.12192, -0.4480706, 2.156381, 1, 1, 1, 1, 1,
1.123276, -1.429026, 1.447516, 1, 1, 1, 1, 1,
1.12575, -0.07753044, 1.145879, 1, 1, 1, 1, 1,
1.130339, 0.2874024, 1.614587, 1, 1, 1, 1, 1,
1.133294, -0.09927195, 2.631542, 1, 1, 1, 1, 1,
1.133326, 1.182973, -0.3609047, 1, 1, 1, 1, 1,
1.137384, -1.025759, 3.772031, 0, 0, 1, 1, 1,
1.141285, -0.3208923, 4.390038, 1, 0, 0, 1, 1,
1.141429, 0.3175619, -0.7093312, 1, 0, 0, 1, 1,
1.142257, 0.006539067, 0.9826228, 1, 0, 0, 1, 1,
1.144567, 0.4163147, 1.057472, 1, 0, 0, 1, 1,
1.145697, -0.8058969, 2.323009, 1, 0, 0, 1, 1,
1.148274, 0.5652018, 2.873483, 0, 0, 0, 1, 1,
1.148685, 0.9477384, 1.752458, 0, 0, 0, 1, 1,
1.149716, 1.046998, -1.794468, 0, 0, 0, 1, 1,
1.151309, 0.7659866, 2.086642, 0, 0, 0, 1, 1,
1.152372, -0.2238024, 3.480719, 0, 0, 0, 1, 1,
1.153448, 0.7524506, -1.729505, 0, 0, 0, 1, 1,
1.163501, -0.8479304, 0.7933528, 0, 0, 0, 1, 1,
1.166265, -0.8757483, 2.270651, 1, 1, 1, 1, 1,
1.167319, -1.892954, 3.212554, 1, 1, 1, 1, 1,
1.171976, -0.9820622, 1.922724, 1, 1, 1, 1, 1,
1.188561, -1.372102, 3.012114, 1, 1, 1, 1, 1,
1.192334, -0.5888361, 1.628718, 1, 1, 1, 1, 1,
1.203295, -0.7657954, 2.457944, 1, 1, 1, 1, 1,
1.204034, -0.9912159, 2.887462, 1, 1, 1, 1, 1,
1.208988, -0.3091542, 3.18052, 1, 1, 1, 1, 1,
1.215816, -0.1592549, 2.202327, 1, 1, 1, 1, 1,
1.21724, -0.05598839, 2.37646, 1, 1, 1, 1, 1,
1.22023, -1.235983, 2.849893, 1, 1, 1, 1, 1,
1.225565, -0.2361134, 0.6586211, 1, 1, 1, 1, 1,
1.232026, 0.1637886, 0.6676326, 1, 1, 1, 1, 1,
1.236766, -0.160447, 2.545867, 1, 1, 1, 1, 1,
1.238168, -0.1066735, 2.853862, 1, 1, 1, 1, 1,
1.255845, -1.548267, 3.656489, 0, 0, 1, 1, 1,
1.256551, -0.5189152, 1.753533, 1, 0, 0, 1, 1,
1.257209, -0.01663804, 3.465021, 1, 0, 0, 1, 1,
1.262631, 0.1590349, 1.685865, 1, 0, 0, 1, 1,
1.265163, 0.01123338, 2.852241, 1, 0, 0, 1, 1,
1.26922, -0.9271035, 1.277992, 1, 0, 0, 1, 1,
1.278932, -1.997445, 2.448334, 0, 0, 0, 1, 1,
1.283283, -0.4185347, 1.199407, 0, 0, 0, 1, 1,
1.287073, 0.02777759, 1.248596, 0, 0, 0, 1, 1,
1.297604, -0.9200464, 0.9504555, 0, 0, 0, 1, 1,
1.30362, -0.8104653, 3.086408, 0, 0, 0, 1, 1,
1.311954, 0.8333798, 1.35863, 0, 0, 0, 1, 1,
1.319543, 0.8128666, -0.9835675, 0, 0, 0, 1, 1,
1.319637, 0.1269089, 2.226787, 1, 1, 1, 1, 1,
1.332286, -0.6136581, 2.380785, 1, 1, 1, 1, 1,
1.334663, 1.238333, 3.554499, 1, 1, 1, 1, 1,
1.352404, -0.3011563, 1.642207, 1, 1, 1, 1, 1,
1.354423, 0.7328839, 1.271677, 1, 1, 1, 1, 1,
1.356211, -0.8252034, 2.02405, 1, 1, 1, 1, 1,
1.35831, -0.5010952, 0.9839429, 1, 1, 1, 1, 1,
1.363729, 1.082613, -0.2852565, 1, 1, 1, 1, 1,
1.367652, 1.812451, 0.1994748, 1, 1, 1, 1, 1,
1.368394, -0.06285292, 2.456749, 1, 1, 1, 1, 1,
1.372502, -0.2211088, -0.2131023, 1, 1, 1, 1, 1,
1.386909, 0.7406327, 1.069686, 1, 1, 1, 1, 1,
1.4108, -0.8263982, 2.92266, 1, 1, 1, 1, 1,
1.421581, 0.5004464, 2.146847, 1, 1, 1, 1, 1,
1.431393, 0.5180928, -0.3893029, 1, 1, 1, 1, 1,
1.468541, 1.059897, 3.047809, 0, 0, 1, 1, 1,
1.469169, 0.01952985, 1.564002, 1, 0, 0, 1, 1,
1.472886, -0.4739781, 2.572965, 1, 0, 0, 1, 1,
1.476297, 1.257551, -0.05654234, 1, 0, 0, 1, 1,
1.478954, -0.4715039, 1.10642, 1, 0, 0, 1, 1,
1.48378, 0.5421872, 0.6883236, 1, 0, 0, 1, 1,
1.483819, -0.102559, 0.6786703, 0, 0, 0, 1, 1,
1.489787, 0.4964385, 1.356202, 0, 0, 0, 1, 1,
1.492551, 0.7480482, 2.274988, 0, 0, 0, 1, 1,
1.503542, 1.243545, 0.8712931, 0, 0, 0, 1, 1,
1.513999, 1.015835, 0.4100221, 0, 0, 0, 1, 1,
1.515122, 0.1009951, 2.86397, 0, 0, 0, 1, 1,
1.521248, -0.3939065, 3.240535, 0, 0, 0, 1, 1,
1.525702, 1.477532, 0.4080933, 1, 1, 1, 1, 1,
1.528847, 0.5272382, 0.6191526, 1, 1, 1, 1, 1,
1.533978, 0.7397342, 2.327488, 1, 1, 1, 1, 1,
1.541317, -0.04441092, -0.09393518, 1, 1, 1, 1, 1,
1.551764, -0.4746472, 1.563642, 1, 1, 1, 1, 1,
1.556747, 1.082044, -0.2669986, 1, 1, 1, 1, 1,
1.564312, 0.09777466, 1.379261, 1, 1, 1, 1, 1,
1.569597, -0.7791169, 2.108672, 1, 1, 1, 1, 1,
1.581034, 1.459268, 1.636827, 1, 1, 1, 1, 1,
1.637748, 0.8484296, 0.2078825, 1, 1, 1, 1, 1,
1.652729, -0.9389449, 1.896116, 1, 1, 1, 1, 1,
1.656992, -2.177929, 2.318703, 1, 1, 1, 1, 1,
1.658094, -0.6642426, 1.857058, 1, 1, 1, 1, 1,
1.662935, 0.5245974, 0.8883367, 1, 1, 1, 1, 1,
1.668054, 0.4945415, 0.89529, 1, 1, 1, 1, 1,
1.675808, 1.479895, 0.8446332, 0, 0, 1, 1, 1,
1.677379, 0.3163445, 0.8079016, 1, 0, 0, 1, 1,
1.728935, 0.2083498, 1.039555, 1, 0, 0, 1, 1,
1.742775, -0.9067848, 1.357471, 1, 0, 0, 1, 1,
1.74695, 1.122673, 0.5425133, 1, 0, 0, 1, 1,
1.753666, -1.894345, 0.7419868, 1, 0, 0, 1, 1,
1.775216, 0.6997219, 0.4009023, 0, 0, 0, 1, 1,
1.790602, 0.741144, 2.786157, 0, 0, 0, 1, 1,
1.827823, 0.1845569, 1.943639, 0, 0, 0, 1, 1,
1.828757, -0.669957, 1.682836, 0, 0, 0, 1, 1,
1.851304, -0.1783096, 1.868209, 0, 0, 0, 1, 1,
1.854573, 0.3090647, 1.167706, 0, 0, 0, 1, 1,
1.880423, 0.5812553, -0.7028928, 0, 0, 0, 1, 1,
1.881554, -0.9304202, 2.027438, 1, 1, 1, 1, 1,
1.902702, -1.405842, 1.238557, 1, 1, 1, 1, 1,
1.917516, 0.7575698, 1.911826, 1, 1, 1, 1, 1,
1.917821, 1.493198, 0.5568422, 1, 1, 1, 1, 1,
1.920652, -1.811971, 0.7938732, 1, 1, 1, 1, 1,
1.945907, -0.04294704, 1.864526, 1, 1, 1, 1, 1,
1.962543, 0.05388365, 2.132461, 1, 1, 1, 1, 1,
1.967866, -1.370481, 3.459093, 1, 1, 1, 1, 1,
1.971376, -0.6856207, 1.483159, 1, 1, 1, 1, 1,
1.979777, 0.6645827, 2.168784, 1, 1, 1, 1, 1,
1.983402, 1.92203, 2.321734, 1, 1, 1, 1, 1,
1.994446, -0.6867789, 3.771948, 1, 1, 1, 1, 1,
2.001204, 1.660807, 0.1938187, 1, 1, 1, 1, 1,
2.010433, 0.1053922, 3.151955, 1, 1, 1, 1, 1,
2.0552, -1.412812, 2.002506, 1, 1, 1, 1, 1,
2.063233, 0.2575349, 1.201115, 0, 0, 1, 1, 1,
2.071535, -0.121502, 1.368423, 1, 0, 0, 1, 1,
2.113398, -1.170762, 2.169597, 1, 0, 0, 1, 1,
2.152371, 0.3079948, 1.643906, 1, 0, 0, 1, 1,
2.195792, 0.7082436, 1.712432, 1, 0, 0, 1, 1,
2.231104, 0.2827704, 0.7284339, 1, 0, 0, 1, 1,
2.313722, 0.3291717, 2.683721, 0, 0, 0, 1, 1,
2.360365, 1.487616, 0.9328323, 0, 0, 0, 1, 1,
2.389262, 0.3798918, 3.535944, 0, 0, 0, 1, 1,
2.399023, 0.5639861, -0.7860579, 0, 0, 0, 1, 1,
2.498695, 0.8154007, -1.317364, 0, 0, 0, 1, 1,
2.530041, 0.6363057, 1.221488, 0, 0, 0, 1, 1,
2.621, 0.9301589, 1.078512, 0, 0, 0, 1, 1,
2.636765, -0.7751215, 1.210545, 1, 1, 1, 1, 1,
2.67412, 0.5849866, 1.583767, 1, 1, 1, 1, 1,
2.697777, -0.2334155, 1.276824, 1, 1, 1, 1, 1,
2.792307, 1.200334, 0.7840431, 1, 1, 1, 1, 1,
3.271502, 0.502943, 2.734936, 1, 1, 1, 1, 1,
3.330579, 1.393986, 1.293368, 1, 1, 1, 1, 1,
3.660705, 1.199464, 0.697747, 1, 1, 1, 1, 1
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
var radius = 9.771056;
var distance = 34.32042;
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
mvMatrix.translate( -0.3216486, -0.1006675, 0.1866617 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.32042);
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
