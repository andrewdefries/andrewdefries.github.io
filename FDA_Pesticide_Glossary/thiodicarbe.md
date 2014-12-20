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
-3.177405, 0.655399, -2.314119, 1, 0, 0, 1,
-3.020254, -0.06138662, -1.674872, 1, 0.007843138, 0, 1,
-2.642857, 0.06368706, -2.06613, 1, 0.01176471, 0, 1,
-2.590973, -0.693424, -3.332387, 1, 0.01960784, 0, 1,
-2.504326, 0.3338494, -0.1059683, 1, 0.02352941, 0, 1,
-2.460208, -0.9674665, -2.770101, 1, 0.03137255, 0, 1,
-2.395529, 1.096187, -2.179343, 1, 0.03529412, 0, 1,
-2.39147, 0.6829816, -1.479133, 1, 0.04313726, 0, 1,
-2.345003, 0.4701074, -2.189996, 1, 0.04705882, 0, 1,
-2.285819, -0.8120709, -1.264623, 1, 0.05490196, 0, 1,
-2.262067, -0.1113079, -2.356776, 1, 0.05882353, 0, 1,
-2.243234, 1.389366, -1.6307, 1, 0.06666667, 0, 1,
-2.242299, -1.563313, -0.6985641, 1, 0.07058824, 0, 1,
-2.237179, 1.064093, -0.7927669, 1, 0.07843138, 0, 1,
-2.222885, 0.6101204, 0.1767727, 1, 0.08235294, 0, 1,
-2.192878, -2.556097, -2.824361, 1, 0.09019608, 0, 1,
-2.159348, -1.166707, -1.314574, 1, 0.09411765, 0, 1,
-2.111473, 0.1225797, -1.439561, 1, 0.1019608, 0, 1,
-2.105582, 0.0513779, 0.4615409, 1, 0.1098039, 0, 1,
-2.06436, 1.120754, -2.186508, 1, 0.1137255, 0, 1,
-2.055336, -0.2671525, -1.313507, 1, 0.1215686, 0, 1,
-2.054196, -1.282295, -3.553644, 1, 0.1254902, 0, 1,
-2.022196, -1.054069, -2.023995, 1, 0.1333333, 0, 1,
-2.000718, -0.0968632, -1.748568, 1, 0.1372549, 0, 1,
-1.965819, -0.6401086, -1.847917, 1, 0.145098, 0, 1,
-1.941649, 1.708639, -0.4654208, 1, 0.1490196, 0, 1,
-1.941396, 0.1395759, -0.7056152, 1, 0.1568628, 0, 1,
-1.937875, -0.9106728, -3.429137, 1, 0.1607843, 0, 1,
-1.932373, 0.04590993, -1.398079, 1, 0.1686275, 0, 1,
-1.913917, -0.5760106, -1.247209, 1, 0.172549, 0, 1,
-1.887512, -1.376722, -1.005161, 1, 0.1803922, 0, 1,
-1.886871, -1.287411, -1.552532, 1, 0.1843137, 0, 1,
-1.88685, -1.060759, -1.563292, 1, 0.1921569, 0, 1,
-1.852088, -1.9109, -1.662674, 1, 0.1960784, 0, 1,
-1.832152, -0.08498784, -1.831515, 1, 0.2039216, 0, 1,
-1.813418, -0.6943837, -2.788963, 1, 0.2117647, 0, 1,
-1.798316, -0.03224075, -3.363468, 1, 0.2156863, 0, 1,
-1.791538, -0.377616, -1.865989, 1, 0.2235294, 0, 1,
-1.77938, -0.9417741, -2.393775, 1, 0.227451, 0, 1,
-1.775353, -0.2624325, -1.822822, 1, 0.2352941, 0, 1,
-1.75073, -0.4775754, -0.7902528, 1, 0.2392157, 0, 1,
-1.738581, -1.519086, -4.102037, 1, 0.2470588, 0, 1,
-1.717436, -0.1751865, -1.37391, 1, 0.2509804, 0, 1,
-1.716459, 0.9554825, -1.741174, 1, 0.2588235, 0, 1,
-1.682325, -0.625156, -2.678363, 1, 0.2627451, 0, 1,
-1.655357, -0.4743187, -3.694395, 1, 0.2705882, 0, 1,
-1.637038, 0.1103369, -2.06206, 1, 0.2745098, 0, 1,
-1.63643, -1.904412, -1.812139, 1, 0.282353, 0, 1,
-1.622174, 1.129252, -1.461318, 1, 0.2862745, 0, 1,
-1.61056, -0.04981616, -1.164357, 1, 0.2941177, 0, 1,
-1.605999, 0.5692188, -1.036333, 1, 0.3019608, 0, 1,
-1.588906, 0.4637414, -1.59953, 1, 0.3058824, 0, 1,
-1.579672, -0.9768994, -1.509708, 1, 0.3137255, 0, 1,
-1.575757, 0.09953221, -3.112493, 1, 0.3176471, 0, 1,
-1.57044, -0.1446673, -3.067045, 1, 0.3254902, 0, 1,
-1.565247, -0.2565953, -1.333126, 1, 0.3294118, 0, 1,
-1.56233, 0.4285618, -2.108442, 1, 0.3372549, 0, 1,
-1.55686, 0.8719031, -2.06768, 1, 0.3411765, 0, 1,
-1.554242, 1.837813, -0.090634, 1, 0.3490196, 0, 1,
-1.546266, 0.1367798, -1.285295, 1, 0.3529412, 0, 1,
-1.520876, 0.2517686, -1.750006, 1, 0.3607843, 0, 1,
-1.519874, -0.3196725, -2.631358, 1, 0.3647059, 0, 1,
-1.516873, 0.489305, -3.370853, 1, 0.372549, 0, 1,
-1.515401, -0.2268384, -3.864067, 1, 0.3764706, 0, 1,
-1.498634, 1.210222, -1.275253, 1, 0.3843137, 0, 1,
-1.482241, -0.3906083, -4.081771, 1, 0.3882353, 0, 1,
-1.478854, 0.392898, -3.301252, 1, 0.3960784, 0, 1,
-1.467611, 1.160607, -1.299253, 1, 0.4039216, 0, 1,
-1.461682, 0.2073565, -2.2269, 1, 0.4078431, 0, 1,
-1.442931, 0.5041127, -2.380412, 1, 0.4156863, 0, 1,
-1.431348, -0.308484, -2.90614, 1, 0.4196078, 0, 1,
-1.404302, 0.3828831, -2.011064, 1, 0.427451, 0, 1,
-1.401639, -0.4283764, -2.048878, 1, 0.4313726, 0, 1,
-1.398021, -0.403768, -0.5926393, 1, 0.4392157, 0, 1,
-1.375938, 1.339673, -0.602793, 1, 0.4431373, 0, 1,
-1.339629, 1.552785, 0.6922701, 1, 0.4509804, 0, 1,
-1.338361, 1.73997, -0.2326348, 1, 0.454902, 0, 1,
-1.328825, -0.9321649, -1.472347, 1, 0.4627451, 0, 1,
-1.322686, 1.453633, -0.1095731, 1, 0.4666667, 0, 1,
-1.320244, -0.03230369, -2.462708, 1, 0.4745098, 0, 1,
-1.315378, -1.227298, -2.47906, 1, 0.4784314, 0, 1,
-1.312972, 1.748758, -1.973123, 1, 0.4862745, 0, 1,
-1.312069, 1.380159, -1.402745, 1, 0.4901961, 0, 1,
-1.3089, -0.485575, -1.114489, 1, 0.4980392, 0, 1,
-1.30735, -0.8218941, -1.503527, 1, 0.5058824, 0, 1,
-1.304513, 0.5704817, -3.408293, 1, 0.509804, 0, 1,
-1.302165, -1.855689, -1.876769, 1, 0.5176471, 0, 1,
-1.297834, -0.780116, -1.73117, 1, 0.5215687, 0, 1,
-1.293468, -0.1740354, -2.044335, 1, 0.5294118, 0, 1,
-1.291546, 0.4455393, -0.06347001, 1, 0.5333334, 0, 1,
-1.282329, -0.57344, -1.045902, 1, 0.5411765, 0, 1,
-1.28232, -0.7172176, -1.138476, 1, 0.5450981, 0, 1,
-1.28188, 0.04505304, -2.54664, 1, 0.5529412, 0, 1,
-1.281243, -0.03266969, -3.934816, 1, 0.5568628, 0, 1,
-1.278165, 1.004875, -1.522909, 1, 0.5647059, 0, 1,
-1.272765, -0.1724203, -2.145383, 1, 0.5686275, 0, 1,
-1.272355, -0.9010396, -1.589743, 1, 0.5764706, 0, 1,
-1.267643, 0.8778227, -0.4385334, 1, 0.5803922, 0, 1,
-1.265237, 0.309364, -1.06477, 1, 0.5882353, 0, 1,
-1.262434, 0.7751762, -1.153316, 1, 0.5921569, 0, 1,
-1.243135, 0.9304166, -1.043533, 1, 0.6, 0, 1,
-1.241396, -0.5289261, -3.9325, 1, 0.6078432, 0, 1,
-1.240499, 0.1377042, -1.529476, 1, 0.6117647, 0, 1,
-1.239794, 0.1891731, -2.251513, 1, 0.6196079, 0, 1,
-1.234504, -0.9633038, -1.378899, 1, 0.6235294, 0, 1,
-1.233389, -0.4064149, -0.5876385, 1, 0.6313726, 0, 1,
-1.232781, -0.5533052, -0.987237, 1, 0.6352941, 0, 1,
-1.232316, -0.154471, -2.882406, 1, 0.6431373, 0, 1,
-1.232295, -0.8660449, -2.868999, 1, 0.6470588, 0, 1,
-1.228772, 0.01116594, -0.4616674, 1, 0.654902, 0, 1,
-1.215211, -0.03154658, -0.9465278, 1, 0.6588235, 0, 1,
-1.213728, 0.7980485, -1.100341, 1, 0.6666667, 0, 1,
-1.206624, -1.128247, -2.388642, 1, 0.6705883, 0, 1,
-1.202792, -0.2132062, -3.626788, 1, 0.6784314, 0, 1,
-1.187509, -0.5070603, -1.589567, 1, 0.682353, 0, 1,
-1.180465, -0.6462576, -2.164034, 1, 0.6901961, 0, 1,
-1.17653, -1.116524, -2.957549, 1, 0.6941177, 0, 1,
-1.168097, -0.7893139, -0.2330518, 1, 0.7019608, 0, 1,
-1.167971, 0.2407115, -2.099452, 1, 0.7098039, 0, 1,
-1.162716, -1.010122, -3.440506, 1, 0.7137255, 0, 1,
-1.161806, 2.402485, 0.2737516, 1, 0.7215686, 0, 1,
-1.160945, 0.7228294, -0.6092162, 1, 0.7254902, 0, 1,
-1.152928, -0.522942, -2.44254, 1, 0.7333333, 0, 1,
-1.147925, -1.578088, -3.436605, 1, 0.7372549, 0, 1,
-1.147799, 1.042868, -1.737594, 1, 0.7450981, 0, 1,
-1.147764, -1.140518, -1.159328, 1, 0.7490196, 0, 1,
-1.134678, -1.34166, -1.036649, 1, 0.7568628, 0, 1,
-1.134249, -2.307034, -3.769743, 1, 0.7607843, 0, 1,
-1.134148, 0.5597993, -0.5401756, 1, 0.7686275, 0, 1,
-1.133887, -1.967058, -3.382509, 1, 0.772549, 0, 1,
-1.13338, -0.5309607, -2.15298, 1, 0.7803922, 0, 1,
-1.131176, -0.2699903, -2.489275, 1, 0.7843137, 0, 1,
-1.128967, 1.846175, -0.5221912, 1, 0.7921569, 0, 1,
-1.114843, -0.6657404, -3.147198, 1, 0.7960784, 0, 1,
-1.105131, -0.9416317, -3.333521, 1, 0.8039216, 0, 1,
-1.105042, 0.879661, -1.503716, 1, 0.8117647, 0, 1,
-1.081829, 0.09233648, -1.865224, 1, 0.8156863, 0, 1,
-1.076707, 0.6473699, 1.09971, 1, 0.8235294, 0, 1,
-1.073968, -0.6378418, -1.17899, 1, 0.827451, 0, 1,
-1.06197, -1.016652, -3.352855, 1, 0.8352941, 0, 1,
-1.060731, 0.8116472, 0.07814022, 1, 0.8392157, 0, 1,
-1.055513, -0.8385745, -1.784359, 1, 0.8470588, 0, 1,
-1.049119, 0.8992553, -1.75976, 1, 0.8509804, 0, 1,
-1.044271, -0.81585, -1.671564, 1, 0.8588235, 0, 1,
-1.042907, -1.63303, -1.925351, 1, 0.8627451, 0, 1,
-1.040141, 0.07901531, -1.004327, 1, 0.8705882, 0, 1,
-1.037979, 0.4351177, -0.7194934, 1, 0.8745098, 0, 1,
-1.030118, 0.6584064, -1.617595, 1, 0.8823529, 0, 1,
-1.02997, -0.03666922, -2.730211, 1, 0.8862745, 0, 1,
-1.029038, 0.3597743, -2.58427, 1, 0.8941177, 0, 1,
-1.027651, 0.6047382, -0.01896443, 1, 0.8980392, 0, 1,
-1.023257, 1.020055, -0.698242, 1, 0.9058824, 0, 1,
-1.022849, -0.5736729, -1.708511, 1, 0.9137255, 0, 1,
-1.019977, -1.882725, -2.414467, 1, 0.9176471, 0, 1,
-1.019052, -0.4492827, -2.74851, 1, 0.9254902, 0, 1,
-1.017504, 0.5517523, -1.506823, 1, 0.9294118, 0, 1,
-1.01008, 0.4207242, -1.547716, 1, 0.9372549, 0, 1,
-1.00549, 0.1603537, -0.7493473, 1, 0.9411765, 0, 1,
-0.9996338, 0.6845189, 0.3734303, 1, 0.9490196, 0, 1,
-0.9995931, 0.2853585, -0.2651294, 1, 0.9529412, 0, 1,
-0.9984099, 1.463069, -0.523874, 1, 0.9607843, 0, 1,
-0.9944813, -0.6870061, -1.516795, 1, 0.9647059, 0, 1,
-0.99168, -1.649344, -3.71764, 1, 0.972549, 0, 1,
-0.9895502, -0.02837332, -1.989793, 1, 0.9764706, 0, 1,
-0.9888893, -1.127786, -2.138554, 1, 0.9843137, 0, 1,
-0.9862143, -0.6652512, -3.301998, 1, 0.9882353, 0, 1,
-0.9791645, 1.125981, -0.2432009, 1, 0.9960784, 0, 1,
-0.9673077, -0.1684944, 0.7712854, 0.9960784, 1, 0, 1,
-0.9664586, 2.811241, 1.00722, 0.9921569, 1, 0, 1,
-0.9659598, 0.3398608, -1.537092, 0.9843137, 1, 0, 1,
-0.9602318, 0.4713393, -0.6966059, 0.9803922, 1, 0, 1,
-0.9570585, -0.4773895, -2.226217, 0.972549, 1, 0, 1,
-0.9546789, 0.5222551, -0.6430867, 0.9686275, 1, 0, 1,
-0.9518543, 0.4311324, -0.9408472, 0.9607843, 1, 0, 1,
-0.9508231, -1.077184, -2.870876, 0.9568627, 1, 0, 1,
-0.9492103, 0.4502946, -1.541706, 0.9490196, 1, 0, 1,
-0.9458417, -0.06079513, -3.051262, 0.945098, 1, 0, 1,
-0.9393132, 2.472521, -0.5784245, 0.9372549, 1, 0, 1,
-0.9315846, 0.4140925, -0.4859673, 0.9333333, 1, 0, 1,
-0.9296606, -1.198721, -2.828418, 0.9254902, 1, 0, 1,
-0.9253676, 0.5341172, -2.403295, 0.9215686, 1, 0, 1,
-0.9198368, 0.113035, -1.931378, 0.9137255, 1, 0, 1,
-0.9114692, -1.042906, -1.225331, 0.9098039, 1, 0, 1,
-0.905396, 1.044959, -0.2011032, 0.9019608, 1, 0, 1,
-0.8992757, 0.533387, -1.569687, 0.8941177, 1, 0, 1,
-0.8990293, -1.820967, -3.971345, 0.8901961, 1, 0, 1,
-0.8982403, -1.968194, -2.726571, 0.8823529, 1, 0, 1,
-0.8979623, -1.754502, -2.45315, 0.8784314, 1, 0, 1,
-0.8949476, 1.791371, -0.217555, 0.8705882, 1, 0, 1,
-0.8926879, -0.3390425, 0.1141467, 0.8666667, 1, 0, 1,
-0.8857443, -0.1304488, -1.775697, 0.8588235, 1, 0, 1,
-0.8823622, -0.6282753, -1.59476, 0.854902, 1, 0, 1,
-0.8809373, -0.9289776, -1.898768, 0.8470588, 1, 0, 1,
-0.8770115, 1.480515, -0.811925, 0.8431373, 1, 0, 1,
-0.8663706, -0.07168663, -1.871039, 0.8352941, 1, 0, 1,
-0.865595, 0.4521464, -1.301184, 0.8313726, 1, 0, 1,
-0.8574348, 0.7760619, -1.265641, 0.8235294, 1, 0, 1,
-0.8478203, 1.274258, -3.380976, 0.8196079, 1, 0, 1,
-0.847414, 1.168528, 1.321959, 0.8117647, 1, 0, 1,
-0.8466254, 0.5886678, -2.070127, 0.8078431, 1, 0, 1,
-0.8372636, 1.112374, 0.246961, 0.8, 1, 0, 1,
-0.8369636, 1.559068, -0.8988324, 0.7921569, 1, 0, 1,
-0.834158, 0.6081099, -0.1913702, 0.7882353, 1, 0, 1,
-0.832848, -0.304388, -2.480044, 0.7803922, 1, 0, 1,
-0.8305721, 0.8282546, -1.501808, 0.7764706, 1, 0, 1,
-0.8263773, -0.6086698, -2.103333, 0.7686275, 1, 0, 1,
-0.8153861, 0.1728634, -1.156003, 0.7647059, 1, 0, 1,
-0.8135577, 0.04723291, -1.60223, 0.7568628, 1, 0, 1,
-0.8127207, -0.2682524, -0.2330619, 0.7529412, 1, 0, 1,
-0.8079224, -0.004683937, -0.06019324, 0.7450981, 1, 0, 1,
-0.8046982, 0.7194304, -2.751159, 0.7411765, 1, 0, 1,
-0.8043037, 0.1825758, -0.1816088, 0.7333333, 1, 0, 1,
-0.7992181, 0.2621328, -0.7220116, 0.7294118, 1, 0, 1,
-0.7916081, 2.084345, -0.5109287, 0.7215686, 1, 0, 1,
-0.7913871, 0.937219, -2.077152, 0.7176471, 1, 0, 1,
-0.7868388, -2.009658, -3.322118, 0.7098039, 1, 0, 1,
-0.7851391, 2.165929, -0.8498169, 0.7058824, 1, 0, 1,
-0.7813854, 0.09835014, -2.430999, 0.6980392, 1, 0, 1,
-0.7783932, 0.9161597, -0.9498191, 0.6901961, 1, 0, 1,
-0.7764564, 0.6947051, 0.9863953, 0.6862745, 1, 0, 1,
-0.7739289, -1.426371, -2.590712, 0.6784314, 1, 0, 1,
-0.7737461, 0.4916869, -1.109289, 0.6745098, 1, 0, 1,
-0.7680626, -0.651891, -1.635861, 0.6666667, 1, 0, 1,
-0.7680064, -0.2807809, -0.927752, 0.6627451, 1, 0, 1,
-0.7676412, 0.6775326, -0.8763311, 0.654902, 1, 0, 1,
-0.7635599, 1.011699, -2.083782, 0.6509804, 1, 0, 1,
-0.7536809, -0.4097109, -1.266004, 0.6431373, 1, 0, 1,
-0.7534313, 0.2373553, -1.797102, 0.6392157, 1, 0, 1,
-0.736851, -1.017483, -1.870994, 0.6313726, 1, 0, 1,
-0.7281564, -0.1262601, -3.658617, 0.627451, 1, 0, 1,
-0.7278164, -1.85206, -3.195623, 0.6196079, 1, 0, 1,
-0.727254, 1.15862, -1.989018, 0.6156863, 1, 0, 1,
-0.7264208, 0.2289326, -0.5880823, 0.6078432, 1, 0, 1,
-0.7257677, -0.7728935, -3.825604, 0.6039216, 1, 0, 1,
-0.7212338, -0.6588035, -1.477799, 0.5960785, 1, 0, 1,
-0.7190397, 0.4485479, -0.2889325, 0.5882353, 1, 0, 1,
-0.717195, -0.5032407, -3.269159, 0.5843138, 1, 0, 1,
-0.7134663, -1.642271, -2.208097, 0.5764706, 1, 0, 1,
-0.7119939, 2.277003, -1.37415, 0.572549, 1, 0, 1,
-0.7105463, -0.01789485, -1.879889, 0.5647059, 1, 0, 1,
-0.7096258, 0.4347403, -0.05511308, 0.5607843, 1, 0, 1,
-0.7076553, -0.03622585, -2.957367, 0.5529412, 1, 0, 1,
-0.7075441, -0.4298428, -2.48147, 0.5490196, 1, 0, 1,
-0.7051992, 1.31394, 0.4058523, 0.5411765, 1, 0, 1,
-0.701398, 1.685776, -0.5287852, 0.5372549, 1, 0, 1,
-0.694606, 1.012861, -1.000563, 0.5294118, 1, 0, 1,
-0.6808703, -0.4237431, -0.8701015, 0.5254902, 1, 0, 1,
-0.6732023, 1.234504, -0.003304745, 0.5176471, 1, 0, 1,
-0.672738, -1.318624, -1.76595, 0.5137255, 1, 0, 1,
-0.6653787, -0.4343818, -1.020187, 0.5058824, 1, 0, 1,
-0.6647716, 0.1607852, -0.4027247, 0.5019608, 1, 0, 1,
-0.6647159, 0.4790215, -2.517993, 0.4941176, 1, 0, 1,
-0.662389, 0.307885, -0.8375037, 0.4862745, 1, 0, 1,
-0.661339, 0.1477003, -1.046219, 0.4823529, 1, 0, 1,
-0.6579672, -0.3024364, -1.218452, 0.4745098, 1, 0, 1,
-0.6573038, -1.003414, -3.888374, 0.4705882, 1, 0, 1,
-0.6545244, -0.1998517, -4.17738, 0.4627451, 1, 0, 1,
-0.6468706, 0.1226978, -1.823494, 0.4588235, 1, 0, 1,
-0.6365988, 1.496757, -1.418007, 0.4509804, 1, 0, 1,
-0.6304218, -0.5604152, -2.086829, 0.4470588, 1, 0, 1,
-0.6302634, -1.598143, -2.123754, 0.4392157, 1, 0, 1,
-0.6222441, 0.07107633, -2.236465, 0.4352941, 1, 0, 1,
-0.6205126, -0.5736352, -1.995275, 0.427451, 1, 0, 1,
-0.6179324, 0.9991993, -1.103486, 0.4235294, 1, 0, 1,
-0.6161632, 1.725759, -0.6245078, 0.4156863, 1, 0, 1,
-0.6089789, 0.8342426, -1.713675, 0.4117647, 1, 0, 1,
-0.6060847, -0.35839, -1.198945, 0.4039216, 1, 0, 1,
-0.5942367, -0.8690103, -3.939358, 0.3960784, 1, 0, 1,
-0.5931033, 0.8316088, 0.06730074, 0.3921569, 1, 0, 1,
-0.5923227, -1.297198, -3.667737, 0.3843137, 1, 0, 1,
-0.5919995, -1.114353, -3.371466, 0.3803922, 1, 0, 1,
-0.5909121, 0.195123, -0.9856449, 0.372549, 1, 0, 1,
-0.5892926, 0.0002232548, -2.814717, 0.3686275, 1, 0, 1,
-0.5863248, -0.607636, -2.762368, 0.3607843, 1, 0, 1,
-0.5837756, 0.568686, -1.224777, 0.3568628, 1, 0, 1,
-0.5791841, 1.596678, -1.594059, 0.3490196, 1, 0, 1,
-0.5739862, 0.6504717, -1.648971, 0.345098, 1, 0, 1,
-0.570109, 1.104964, 1.365325, 0.3372549, 1, 0, 1,
-0.5666838, 1.10488, -0.8721441, 0.3333333, 1, 0, 1,
-0.5662334, -0.4460508, -1.465471, 0.3254902, 1, 0, 1,
-0.5660648, 0.9585746, 1.032775, 0.3215686, 1, 0, 1,
-0.5607231, 0.4240801, -1.409427, 0.3137255, 1, 0, 1,
-0.5591285, 1.268354, 0.09283376, 0.3098039, 1, 0, 1,
-0.5547504, 1.001599, 0.1457484, 0.3019608, 1, 0, 1,
-0.5481415, 0.1194551, -1.410492, 0.2941177, 1, 0, 1,
-0.5467253, 0.2957058, -2.421485, 0.2901961, 1, 0, 1,
-0.5449675, 2.02044, -0.2940644, 0.282353, 1, 0, 1,
-0.5395226, -0.1902221, 0.3026775, 0.2784314, 1, 0, 1,
-0.5377663, -1.201128, -2.361542, 0.2705882, 1, 0, 1,
-0.5353643, 1.289201, -1.646971, 0.2666667, 1, 0, 1,
-0.527522, 1.09032, -1.090768, 0.2588235, 1, 0, 1,
-0.5234787, 0.3581657, -0.25679, 0.254902, 1, 0, 1,
-0.5222637, -1.987144, -3.791209, 0.2470588, 1, 0, 1,
-0.5204251, 1.074947, -2.943858, 0.2431373, 1, 0, 1,
-0.5199769, -1.504172, -3.48892, 0.2352941, 1, 0, 1,
-0.5147009, -0.08272132, -2.273023, 0.2313726, 1, 0, 1,
-0.5053571, 0.119704, -3.875977, 0.2235294, 1, 0, 1,
-0.5018533, 0.07650848, -1.415351, 0.2196078, 1, 0, 1,
-0.5003484, 0.07201007, -0.6678576, 0.2117647, 1, 0, 1,
-0.4996008, 0.3947397, -0.4616403, 0.2078431, 1, 0, 1,
-0.4989197, 2.293593, 0.06518127, 0.2, 1, 0, 1,
-0.4984317, -0.3662057, -2.292975, 0.1921569, 1, 0, 1,
-0.4978832, 0.4207106, -0.7329295, 0.1882353, 1, 0, 1,
-0.4969417, 0.1950667, -0.9537185, 0.1803922, 1, 0, 1,
-0.4940246, 0.813069, 0.1532581, 0.1764706, 1, 0, 1,
-0.4921473, -0.06316788, -2.988717, 0.1686275, 1, 0, 1,
-0.4903976, -1.206792, -1.998999, 0.1647059, 1, 0, 1,
-0.489492, -1.37674, -0.7485796, 0.1568628, 1, 0, 1,
-0.4894305, -2.446214, -4.523666, 0.1529412, 1, 0, 1,
-0.4885752, 0.4829637, 0.6078949, 0.145098, 1, 0, 1,
-0.4870091, 0.7163972, 1.458594, 0.1411765, 1, 0, 1,
-0.4864049, 1.868338, 1.564142, 0.1333333, 1, 0, 1,
-0.4861079, 0.2508379, -0.9587232, 0.1294118, 1, 0, 1,
-0.4838001, -0.8452807, -2.410122, 0.1215686, 1, 0, 1,
-0.4835255, -1.254077, -4.304626, 0.1176471, 1, 0, 1,
-0.4831903, 1.043172, -2.468866, 0.1098039, 1, 0, 1,
-0.4798272, 0.7307373, -1.771783, 0.1058824, 1, 0, 1,
-0.4778154, 0.5212612, -0.06726315, 0.09803922, 1, 0, 1,
-0.4775256, 0.9540353, -0.8941199, 0.09019608, 1, 0, 1,
-0.4742847, -0.2106388, -1.086052, 0.08627451, 1, 0, 1,
-0.4718758, -1.296419, -2.43697, 0.07843138, 1, 0, 1,
-0.4712506, 0.5177609, 0.1822706, 0.07450981, 1, 0, 1,
-0.468095, 0.02795367, -0.9237287, 0.06666667, 1, 0, 1,
-0.4663676, 0.4286453, -0.3176456, 0.0627451, 1, 0, 1,
-0.4651619, 0.5206977, -3.533074, 0.05490196, 1, 0, 1,
-0.4624118, 0.2611536, -1.000836, 0.05098039, 1, 0, 1,
-0.4593444, -0.7038952, -3.790164, 0.04313726, 1, 0, 1,
-0.4586046, 2.384149, -1.018768, 0.03921569, 1, 0, 1,
-0.4582877, 1.220899, -0.001050716, 0.03137255, 1, 0, 1,
-0.458279, -0.3762079, -2.775492, 0.02745098, 1, 0, 1,
-0.4529245, -0.3545174, -0.6164379, 0.01960784, 1, 0, 1,
-0.4506373, 0.04623402, -1.846889, 0.01568628, 1, 0, 1,
-0.4473114, -0.1125083, -1.511131, 0.007843138, 1, 0, 1,
-0.4416083, -0.07676058, -0.8324823, 0.003921569, 1, 0, 1,
-0.4408764, -0.6915845, -3.190102, 0, 1, 0.003921569, 1,
-0.4332403, -0.2178099, -2.833541, 0, 1, 0.01176471, 1,
-0.4318823, -0.6306682, -3.882053, 0, 1, 0.01568628, 1,
-0.4273567, -0.8832684, -1.222957, 0, 1, 0.02352941, 1,
-0.4250243, -1.182429, -2.28684, 0, 1, 0.02745098, 1,
-0.4242229, 1.267302, 1.445, 0, 1, 0.03529412, 1,
-0.4224921, -0.4546866, -2.191778, 0, 1, 0.03921569, 1,
-0.416381, -0.8260653, -3.607097, 0, 1, 0.04705882, 1,
-0.4150449, 0.1699079, -1.235746, 0, 1, 0.05098039, 1,
-0.4149063, 0.1923108, -1.065241, 0, 1, 0.05882353, 1,
-0.4142504, -0.3248397, -1.434224, 0, 1, 0.0627451, 1,
-0.4083516, 1.258681, -1.44473, 0, 1, 0.07058824, 1,
-0.4065499, -1.370169, -1.951301, 0, 1, 0.07450981, 1,
-0.4014868, 0.4514699, 0.4230519, 0, 1, 0.08235294, 1,
-0.398327, 0.5351787, -1.157609, 0, 1, 0.08627451, 1,
-0.393651, -0.3219008, -2.188644, 0, 1, 0.09411765, 1,
-0.3934038, -0.4286085, -3.283958, 0, 1, 0.1019608, 1,
-0.392273, -0.9924208, -2.144991, 0, 1, 0.1058824, 1,
-0.3911914, -0.3366173, -2.870895, 0, 1, 0.1137255, 1,
-0.3849046, -0.4991864, -1.787157, 0, 1, 0.1176471, 1,
-0.3843739, -1.357039, -2.990826, 0, 1, 0.1254902, 1,
-0.3793673, 0.966985, 0.6800981, 0, 1, 0.1294118, 1,
-0.3780392, -0.1204958, -2.020412, 0, 1, 0.1372549, 1,
-0.3771577, 1.790488, -2.050073, 0, 1, 0.1411765, 1,
-0.3758871, 1.205723, 1.351579, 0, 1, 0.1490196, 1,
-0.3710777, -0.8759338, -1.790453, 0, 1, 0.1529412, 1,
-0.3648067, -1.223916, -3.587567, 0, 1, 0.1607843, 1,
-0.3646355, 0.8390601, 0.9587776, 0, 1, 0.1647059, 1,
-0.359808, 0.9224331, -0.8044662, 0, 1, 0.172549, 1,
-0.3590434, -0.2248147, -1.926062, 0, 1, 0.1764706, 1,
-0.354334, 0.6715054, -1.317896, 0, 1, 0.1843137, 1,
-0.3505264, 1.455294, -3.36728, 0, 1, 0.1882353, 1,
-0.3497678, 0.8262841, 0.0630254, 0, 1, 0.1960784, 1,
-0.3435452, -2.504065, -3.047241, 0, 1, 0.2039216, 1,
-0.3381498, -0.3079316, -2.157102, 0, 1, 0.2078431, 1,
-0.3379003, -0.391281, -2.047863, 0, 1, 0.2156863, 1,
-0.3347615, 1.087719, 0.7141356, 0, 1, 0.2196078, 1,
-0.3338961, -0.2140277, -3.003604, 0, 1, 0.227451, 1,
-0.3319225, -1.303808, -4.608012, 0, 1, 0.2313726, 1,
-0.3299899, 0.7375454, -2.079704, 0, 1, 0.2392157, 1,
-0.3298267, 0.5179109, 0.225942, 0, 1, 0.2431373, 1,
-0.3274828, 0.6071067, -1.058639, 0, 1, 0.2509804, 1,
-0.3198745, 1.412242, -1.728322, 0, 1, 0.254902, 1,
-0.318109, -1.61731, -2.828178, 0, 1, 0.2627451, 1,
-0.317137, 0.2588818, -2.609883, 0, 1, 0.2666667, 1,
-0.3170113, 0.1933063, -0.9058455, 0, 1, 0.2745098, 1,
-0.316574, -0.1004329, -1.38677, 0, 1, 0.2784314, 1,
-0.3087658, 1.138941, -0.6261822, 0, 1, 0.2862745, 1,
-0.3052737, -2.60544, -2.809518, 0, 1, 0.2901961, 1,
-0.3050327, -0.80489, -2.693867, 0, 1, 0.2980392, 1,
-0.3025503, 1.152028, -1.777631, 0, 1, 0.3058824, 1,
-0.3025008, -1.819154, -0.9376262, 0, 1, 0.3098039, 1,
-0.3020571, 0.1033786, -3.650745, 0, 1, 0.3176471, 1,
-0.3010914, 0.07516224, -2.355591, 0, 1, 0.3215686, 1,
-0.2996094, 1.067565, -0.0135122, 0, 1, 0.3294118, 1,
-0.2945812, 0.2315523, -0.8926073, 0, 1, 0.3333333, 1,
-0.2919155, 0.7651364, 0.07724058, 0, 1, 0.3411765, 1,
-0.2918959, 0.4237312, 0.02841047, 0, 1, 0.345098, 1,
-0.2894383, -0.7505369, -3.628469, 0, 1, 0.3529412, 1,
-0.2752551, 1.531574, -1.258785, 0, 1, 0.3568628, 1,
-0.2727395, 0.1391134, -0.6984999, 0, 1, 0.3647059, 1,
-0.2695006, 0.3273359, -2.710525, 0, 1, 0.3686275, 1,
-0.2689448, -0.9554024, -3.049188, 0, 1, 0.3764706, 1,
-0.267502, -0.2969883, -1.10759, 0, 1, 0.3803922, 1,
-0.2644656, -0.4835247, -2.15785, 0, 1, 0.3882353, 1,
-0.2640387, -0.4460622, -2.369552, 0, 1, 0.3921569, 1,
-0.2606748, -1.521322, -1.208682, 0, 1, 0.4, 1,
-0.2568873, 0.5453006, -1.784821, 0, 1, 0.4078431, 1,
-0.2556605, 1.357622, -1.531964, 0, 1, 0.4117647, 1,
-0.2543642, 1.300173, -0.1637587, 0, 1, 0.4196078, 1,
-0.2535592, 0.4660128, -1.146671, 0, 1, 0.4235294, 1,
-0.2507202, 0.3686722, 1.171156, 0, 1, 0.4313726, 1,
-0.2501493, 1.958778, 0.4179831, 0, 1, 0.4352941, 1,
-0.2496802, -1.014741, -2.224627, 0, 1, 0.4431373, 1,
-0.2491623, -1.551942, -2.887815, 0, 1, 0.4470588, 1,
-0.2476134, -0.1482262, -4.799777, 0, 1, 0.454902, 1,
-0.246452, -0.4457967, -1.48487, 0, 1, 0.4588235, 1,
-0.2402741, 0.04707064, -0.207375, 0, 1, 0.4666667, 1,
-0.2382005, 1.497172, -1.774393, 0, 1, 0.4705882, 1,
-0.2369452, 1.219965, 0.3731011, 0, 1, 0.4784314, 1,
-0.2336079, -1.228601, -3.276968, 0, 1, 0.4823529, 1,
-0.2300702, 3.014722, 0.1098917, 0, 1, 0.4901961, 1,
-0.2291505, 0.007676227, 0.09115376, 0, 1, 0.4941176, 1,
-0.2291474, 0.0180226, -1.751052, 0, 1, 0.5019608, 1,
-0.2281836, 0.4835573, -0.6693957, 0, 1, 0.509804, 1,
-0.2261207, 0.3614344, -0.6944587, 0, 1, 0.5137255, 1,
-0.2254966, 1.045313, 0.5875728, 0, 1, 0.5215687, 1,
-0.2238741, -1.480626, -2.737164, 0, 1, 0.5254902, 1,
-0.2232724, -0.05810966, -2.618149, 0, 1, 0.5333334, 1,
-0.219108, -1.323476, -2.405714, 0, 1, 0.5372549, 1,
-0.2172252, 0.1766708, -1.16936, 0, 1, 0.5450981, 1,
-0.2172184, 0.1197714, -0.2045635, 0, 1, 0.5490196, 1,
-0.2110544, 0.4517955, -0.5185403, 0, 1, 0.5568628, 1,
-0.2081419, 0.905899, -1.596451, 0, 1, 0.5607843, 1,
-0.2048633, 0.8905134, -1.336812, 0, 1, 0.5686275, 1,
-0.2038819, 0.543024, -0.107968, 0, 1, 0.572549, 1,
-0.1974922, 1.449423, 2.503076, 0, 1, 0.5803922, 1,
-0.1946661, -0.3732826, -2.520331, 0, 1, 0.5843138, 1,
-0.1933362, 0.2076818, 0.6350489, 0, 1, 0.5921569, 1,
-0.1925066, 0.4468641, -1.777257, 0, 1, 0.5960785, 1,
-0.1871589, 2.095559, -0.4156073, 0, 1, 0.6039216, 1,
-0.1857838, 1.656536, -0.2553031, 0, 1, 0.6117647, 1,
-0.1856308, -0.5757216, -2.217074, 0, 1, 0.6156863, 1,
-0.1854951, 0.6856135, -0.1679658, 0, 1, 0.6235294, 1,
-0.1782447, 0.6852417, -0.292269, 0, 1, 0.627451, 1,
-0.177001, 1.624833, 0.4676239, 0, 1, 0.6352941, 1,
-0.1718896, -0.8103881, -2.981869, 0, 1, 0.6392157, 1,
-0.1697885, -0.2752358, -1.64492, 0, 1, 0.6470588, 1,
-0.1693209, 0.4424878, -0.7309428, 0, 1, 0.6509804, 1,
-0.1667172, -0.7563501, -3.283116, 0, 1, 0.6588235, 1,
-0.1608823, -0.6475436, -1.4847, 0, 1, 0.6627451, 1,
-0.1603713, 0.4696792, -0.5788587, 0, 1, 0.6705883, 1,
-0.1592544, -1.297143, -0.5261056, 0, 1, 0.6745098, 1,
-0.1505105, -0.6102518, -3.131827, 0, 1, 0.682353, 1,
-0.1483565, 0.4219725, -1.165925, 0, 1, 0.6862745, 1,
-0.1465079, 1.239699, -1.684453, 0, 1, 0.6941177, 1,
-0.1443962, -2.798103, -3.261026, 0, 1, 0.7019608, 1,
-0.1424286, 0.1647819, 0.533891, 0, 1, 0.7058824, 1,
-0.1416653, -1.164473, -4.17186, 0, 1, 0.7137255, 1,
-0.1379353, 1.478498, 0.7029745, 0, 1, 0.7176471, 1,
-0.1370128, -0.388229, -5.23688, 0, 1, 0.7254902, 1,
-0.1322214, 0.5519158, 0.9638947, 0, 1, 0.7294118, 1,
-0.1318588, 1.540052, -0.9000177, 0, 1, 0.7372549, 1,
-0.1306063, 2.033082, -0.668597, 0, 1, 0.7411765, 1,
-0.1296804, 0.3082539, -0.4783393, 0, 1, 0.7490196, 1,
-0.1272064, -1.473305, -4.516257, 0, 1, 0.7529412, 1,
-0.1256125, -0.54772, -0.4795979, 0, 1, 0.7607843, 1,
-0.122954, 0.6125166, -0.3002748, 0, 1, 0.7647059, 1,
-0.1199489, -0.1681319, -2.790537, 0, 1, 0.772549, 1,
-0.1195461, -0.464701, -2.56404, 0, 1, 0.7764706, 1,
-0.1096713, 0.6808143, -2.17807, 0, 1, 0.7843137, 1,
-0.108626, -0.1106925, -3.155167, 0, 1, 0.7882353, 1,
-0.106815, -0.8610933, -2.941694, 0, 1, 0.7960784, 1,
-0.1052515, -0.6829312, -1.535754, 0, 1, 0.8039216, 1,
-0.09983818, 1.931633, -0.8735227, 0, 1, 0.8078431, 1,
-0.09979395, -0.09105193, 0.1624753, 0, 1, 0.8156863, 1,
-0.09862143, -0.1183932, -2.007185, 0, 1, 0.8196079, 1,
-0.09500875, -0.9064534, -3.454751, 0, 1, 0.827451, 1,
-0.09144181, 0.02621621, 0.2683789, 0, 1, 0.8313726, 1,
-0.08984222, 1.086971, -1.393645, 0, 1, 0.8392157, 1,
-0.08852716, 0.7358655, -1.092389, 0, 1, 0.8431373, 1,
-0.08255085, -0.2109003, -2.172345, 0, 1, 0.8509804, 1,
-0.08234708, 0.001649697, -1.107845, 0, 1, 0.854902, 1,
-0.07316999, -1.287781, -3.826255, 0, 1, 0.8627451, 1,
-0.07119332, -1.349707, -2.603091, 0, 1, 0.8666667, 1,
-0.06806067, -1.179891, -2.96051, 0, 1, 0.8745098, 1,
-0.06801198, -0.3698431, -3.550973, 0, 1, 0.8784314, 1,
-0.06455676, 0.05052885, -0.3487738, 0, 1, 0.8862745, 1,
-0.06246614, -1.284168, -3.77142, 0, 1, 0.8901961, 1,
-0.06100876, -0.3832568, -2.974561, 0, 1, 0.8980392, 1,
-0.0601432, 0.7654271, 1.144939, 0, 1, 0.9058824, 1,
-0.05870015, -0.1949224, -2.491782, 0, 1, 0.9098039, 1,
-0.05494421, -0.2744593, -1.99894, 0, 1, 0.9176471, 1,
-0.05307987, 0.7761936, 0.3078403, 0, 1, 0.9215686, 1,
-0.04350766, 0.1960061, -1.195623, 0, 1, 0.9294118, 1,
-0.04320422, -1.155087, -2.46003, 0, 1, 0.9333333, 1,
-0.04285067, -0.03761655, -2.063002, 0, 1, 0.9411765, 1,
-0.04139316, 1.907169, 0.8160177, 0, 1, 0.945098, 1,
-0.04065759, 0.6656396, 0.3486128, 0, 1, 0.9529412, 1,
-0.04048795, 1.787751, -2.36955, 0, 1, 0.9568627, 1,
-0.03200128, -0.9610556, -3.784327, 0, 1, 0.9647059, 1,
-0.03188111, 1.162386, 1.018378, 0, 1, 0.9686275, 1,
-0.03115887, 0.5272668, -0.7693331, 0, 1, 0.9764706, 1,
-0.02907448, 0.2788754, -0.6039286, 0, 1, 0.9803922, 1,
-0.02630137, 0.6647397, -0.0179284, 0, 1, 0.9882353, 1,
-0.02627816, -0.6803516, -1.611352, 0, 1, 0.9921569, 1,
-0.02269934, -0.511995, -1.466641, 0, 1, 1, 1,
-0.01872576, -0.3806477, -2.907461, 0, 0.9921569, 1, 1,
-0.01609378, -0.6924198, -3.051967, 0, 0.9882353, 1, 1,
-0.01561515, -1.026566, -2.239663, 0, 0.9803922, 1, 1,
-0.01481004, 0.4692412, 0.2118112, 0, 0.9764706, 1, 1,
-0.0116348, -0.4541408, -2.573187, 0, 0.9686275, 1, 1,
-0.009418301, -0.161391, -4.206223, 0, 0.9647059, 1, 1,
-0.007799896, 0.07125695, 0.966811, 0, 0.9568627, 1, 1,
-0.002451747, -1.328283, -1.675588, 0, 0.9529412, 1, 1,
-2.666446e-05, 0.3596838, 0.1801464, 0, 0.945098, 1, 1,
0.003073287, 0.8720847, -0.08184913, 0, 0.9411765, 1, 1,
0.003596068, -0.1293506, 3.995752, 0, 0.9333333, 1, 1,
0.004851286, 1.97534, -0.5791674, 0, 0.9294118, 1, 1,
0.01284907, -0.6041063, 3.631256, 0, 0.9215686, 1, 1,
0.01388287, -0.08464085, 2.202031, 0, 0.9176471, 1, 1,
0.01468042, -0.7333181, 2.856806, 0, 0.9098039, 1, 1,
0.01877847, -0.8028734, 2.009114, 0, 0.9058824, 1, 1,
0.01910976, 0.2807028, 1.617094, 0, 0.8980392, 1, 1,
0.01970189, 0.4151421, 1.393521, 0, 0.8901961, 1, 1,
0.02577617, -0.1468669, 3.280513, 0, 0.8862745, 1, 1,
0.03469099, 0.7699072, -0.7628899, 0, 0.8784314, 1, 1,
0.03469197, 0.9299411, -1.457645, 0, 0.8745098, 1, 1,
0.03588145, -0.2616245, 3.476168, 0, 0.8666667, 1, 1,
0.04485815, 0.3089058, -0.3765366, 0, 0.8627451, 1, 1,
0.04776509, 1.120374, 0.1428271, 0, 0.854902, 1, 1,
0.05158193, -0.2006572, 2.394213, 0, 0.8509804, 1, 1,
0.05332293, -1.155944, 2.12018, 0, 0.8431373, 1, 1,
0.05950428, -0.6569635, 3.112862, 0, 0.8392157, 1, 1,
0.0648772, 0.1870217, 2.20352, 0, 0.8313726, 1, 1,
0.07546683, -1.000556, 5.548723, 0, 0.827451, 1, 1,
0.08148602, 0.1490409, 1.697112, 0, 0.8196079, 1, 1,
0.0825885, -1.090369, 5.046743, 0, 0.8156863, 1, 1,
0.0852534, 0.09630028, 1.267201, 0, 0.8078431, 1, 1,
0.08626069, -1.627474, 3.104042, 0, 0.8039216, 1, 1,
0.08634773, 0.2748466, 0.02816981, 0, 0.7960784, 1, 1,
0.09847215, -0.2487482, 3.561695, 0, 0.7882353, 1, 1,
0.09897677, -0.4839405, 2.685459, 0, 0.7843137, 1, 1,
0.1043549, -0.3234012, 4.293726, 0, 0.7764706, 1, 1,
0.1047547, 0.8204529, 2.244091, 0, 0.772549, 1, 1,
0.1120212, -0.2900006, 2.267309, 0, 0.7647059, 1, 1,
0.1131679, -0.5255897, 4.612548, 0, 0.7607843, 1, 1,
0.1133662, -0.04054311, 1.332951, 0, 0.7529412, 1, 1,
0.115839, -0.06730713, 1.964953, 0, 0.7490196, 1, 1,
0.1227499, 0.9267239, -0.1481873, 0, 0.7411765, 1, 1,
0.1272161, -0.3301841, 2.922176, 0, 0.7372549, 1, 1,
0.1276857, 0.009825762, 1.272014, 0, 0.7294118, 1, 1,
0.1282039, -1.419485, 4.173196, 0, 0.7254902, 1, 1,
0.1285005, -0.335133, 2.564741, 0, 0.7176471, 1, 1,
0.1290649, -1.812685, 1.421652, 0, 0.7137255, 1, 1,
0.1310447, -0.4922071, 3.121035, 0, 0.7058824, 1, 1,
0.1323495, 1.996018, -0.2937746, 0, 0.6980392, 1, 1,
0.1340842, -0.3768188, 3.916416, 0, 0.6941177, 1, 1,
0.1351445, 0.7367684, 0.5810065, 0, 0.6862745, 1, 1,
0.1386756, -0.8281384, 2.724912, 0, 0.682353, 1, 1,
0.1399897, 0.5914699, -0.2898673, 0, 0.6745098, 1, 1,
0.1438213, -1.012558, 2.908435, 0, 0.6705883, 1, 1,
0.1441088, 3.609622, -0.6347497, 0, 0.6627451, 1, 1,
0.1450806, -0.1822243, 3.475845, 0, 0.6588235, 1, 1,
0.1464461, -0.3876738, 3.506276, 0, 0.6509804, 1, 1,
0.1546497, -0.1369941, 2.30305, 0, 0.6470588, 1, 1,
0.1587074, -1.81142, 2.754924, 0, 0.6392157, 1, 1,
0.159236, -3.368347, 3.757714, 0, 0.6352941, 1, 1,
0.1608743, 0.4892877, -0.7749131, 0, 0.627451, 1, 1,
0.1623452, 2.607987, -0.1173646, 0, 0.6235294, 1, 1,
0.1643514, 1.460877, -0.1470341, 0, 0.6156863, 1, 1,
0.1681998, 0.7524773, 0.8953317, 0, 0.6117647, 1, 1,
0.1692445, 0.7777423, 1.321828, 0, 0.6039216, 1, 1,
0.1702168, 0.5189157, -1.188814, 0, 0.5960785, 1, 1,
0.1739134, 2.300629, 0.7584854, 0, 0.5921569, 1, 1,
0.1770291, -0.09541925, 0.1627927, 0, 0.5843138, 1, 1,
0.1782826, -0.03986062, 0.9434789, 0, 0.5803922, 1, 1,
0.1841144, -0.6566405, 1.744589, 0, 0.572549, 1, 1,
0.1857911, -1.005902, 2.256199, 0, 0.5686275, 1, 1,
0.189612, 0.5503491, -0.2932193, 0, 0.5607843, 1, 1,
0.1912625, -2.146169, 4.139493, 0, 0.5568628, 1, 1,
0.1923589, -0.5680379, 4.483888, 0, 0.5490196, 1, 1,
0.1930446, -0.8681412, 3.197212, 0, 0.5450981, 1, 1,
0.1940265, 0.5694647, -0.1441722, 0, 0.5372549, 1, 1,
0.1945846, -0.9399626, 3.248184, 0, 0.5333334, 1, 1,
0.1986896, -1.746713, 3.936558, 0, 0.5254902, 1, 1,
0.2008694, 0.281505, 0.9053915, 0, 0.5215687, 1, 1,
0.2031392, 1.807129, -0.7076142, 0, 0.5137255, 1, 1,
0.2106127, 0.4942203, 1.946967, 0, 0.509804, 1, 1,
0.2133034, -0.5011016, 2.549824, 0, 0.5019608, 1, 1,
0.2148831, 0.3438967, 0.3933346, 0, 0.4941176, 1, 1,
0.2225264, 0.09254711, 0.3016072, 0, 0.4901961, 1, 1,
0.2283115, -1.565481, 3.841526, 0, 0.4823529, 1, 1,
0.2284237, 0.3115845, 1.346184, 0, 0.4784314, 1, 1,
0.2302548, -0.1103933, 0.6737794, 0, 0.4705882, 1, 1,
0.2336245, 1.519389, 0.6515641, 0, 0.4666667, 1, 1,
0.2350213, 0.09899668, 0.6797693, 0, 0.4588235, 1, 1,
0.2378829, -1.774254, 2.849673, 0, 0.454902, 1, 1,
0.2392584, 0.665969, 0.733978, 0, 0.4470588, 1, 1,
0.2401571, -0.8771955, 1.497582, 0, 0.4431373, 1, 1,
0.2424935, -0.3439564, 3.863788, 0, 0.4352941, 1, 1,
0.2524925, 0.4699052, 1.393545, 0, 0.4313726, 1, 1,
0.2609665, 1.085859, 0.3678352, 0, 0.4235294, 1, 1,
0.2615501, 0.3154602, 0.5591319, 0, 0.4196078, 1, 1,
0.2633474, 0.28571, 0.559433, 0, 0.4117647, 1, 1,
0.2636227, 1.45264, 0.7275416, 0, 0.4078431, 1, 1,
0.2637619, -0.7407456, 2.553277, 0, 0.4, 1, 1,
0.2650911, -1.486615, 2.905711, 0, 0.3921569, 1, 1,
0.2686001, 1.184902, -0.02494203, 0, 0.3882353, 1, 1,
0.2693346, 0.6797113, 1.678122, 0, 0.3803922, 1, 1,
0.2738901, -1.303462, 2.074356, 0, 0.3764706, 1, 1,
0.2787774, 0.4755781, 1.531109, 0, 0.3686275, 1, 1,
0.2861803, -0.8283108, 3.371478, 0, 0.3647059, 1, 1,
0.286261, -0.3151053, 2.874748, 0, 0.3568628, 1, 1,
0.2874826, 0.3381966, -0.1825224, 0, 0.3529412, 1, 1,
0.288278, 0.6204684, -2.096163, 0, 0.345098, 1, 1,
0.2894416, -0.9751889, 1.453927, 0, 0.3411765, 1, 1,
0.2936851, 1.837419, -0.8676673, 0, 0.3333333, 1, 1,
0.294575, 0.3135505, 0.1469046, 0, 0.3294118, 1, 1,
0.294937, -1.196862, 4.741011, 0, 0.3215686, 1, 1,
0.3001794, 2.387201, -0.1005373, 0, 0.3176471, 1, 1,
0.3013795, 0.1653876, 0.8097954, 0, 0.3098039, 1, 1,
0.3036038, -0.9231235, 2.535372, 0, 0.3058824, 1, 1,
0.3063225, 0.9016667, 1.100241, 0, 0.2980392, 1, 1,
0.3073294, 0.293615, -0.7369116, 0, 0.2901961, 1, 1,
0.3077033, -0.7276176, 1.908146, 0, 0.2862745, 1, 1,
0.3109502, 1.328475, 2.116823, 0, 0.2784314, 1, 1,
0.3121367, -0.300646, 1.327723, 0, 0.2745098, 1, 1,
0.3150758, -1.466679, 4.187219, 0, 0.2666667, 1, 1,
0.3194582, -0.3417538, 3.799585, 0, 0.2627451, 1, 1,
0.3206201, 0.2801041, -0.4957596, 0, 0.254902, 1, 1,
0.3258066, -0.3098408, 3.500823, 0, 0.2509804, 1, 1,
0.3372386, -1.345383, 5.254245, 0, 0.2431373, 1, 1,
0.3405378, -1.772753, 3.425761, 0, 0.2392157, 1, 1,
0.3406864, 1.797248, 1.456724, 0, 0.2313726, 1, 1,
0.3462653, 0.7609082, -2.081116, 0, 0.227451, 1, 1,
0.3502238, 0.1388486, 0.959085, 0, 0.2196078, 1, 1,
0.3528539, 0.7373458, 1.194275, 0, 0.2156863, 1, 1,
0.3534347, -0.9324605, 2.450448, 0, 0.2078431, 1, 1,
0.354336, -0.9051902, 1.874615, 0, 0.2039216, 1, 1,
0.3574067, 0.1114811, 1.476228, 0, 0.1960784, 1, 1,
0.3576027, -0.6002727, 0.54488, 0, 0.1882353, 1, 1,
0.3599346, 1.509815, 1.545984, 0, 0.1843137, 1, 1,
0.3624512, 0.1020565, -0.1792274, 0, 0.1764706, 1, 1,
0.3627048, -0.852806, 1.493572, 0, 0.172549, 1, 1,
0.3677408, -0.5103425, 2.62879, 0, 0.1647059, 1, 1,
0.3680988, 0.2645933, 0.2905106, 0, 0.1607843, 1, 1,
0.3714865, -2.597155, 2.702862, 0, 0.1529412, 1, 1,
0.3741512, -0.2956974, 3.834486, 0, 0.1490196, 1, 1,
0.375609, -1.36126, 2.870166, 0, 0.1411765, 1, 1,
0.3772931, 0.7497463, 2.422758, 0, 0.1372549, 1, 1,
0.378361, 0.81313, 1.312924, 0, 0.1294118, 1, 1,
0.3787312, -0.8405792, 3.617094, 0, 0.1254902, 1, 1,
0.379909, 0.8750325, 1.555979, 0, 0.1176471, 1, 1,
0.3799102, -0.8638151, 1.608818, 0, 0.1137255, 1, 1,
0.3823372, 1.035903, -0.244102, 0, 0.1058824, 1, 1,
0.3847716, 0.4482862, 2.225134, 0, 0.09803922, 1, 1,
0.3852242, 0.3836981, 1.113996, 0, 0.09411765, 1, 1,
0.38575, -0.3909107, 3.259744, 0, 0.08627451, 1, 1,
0.3906363, -0.08782607, 1.608743, 0, 0.08235294, 1, 1,
0.3935232, -0.8458099, 1.459636, 0, 0.07450981, 1, 1,
0.3939976, 1.133271, -0.4473163, 0, 0.07058824, 1, 1,
0.3939977, 0.1104273, 0.5209017, 0, 0.0627451, 1, 1,
0.3999974, 0.09754648, 2.045666, 0, 0.05882353, 1, 1,
0.4032018, -0.2270185, 3.504515, 0, 0.05098039, 1, 1,
0.4057349, -0.9009572, 3.978554, 0, 0.04705882, 1, 1,
0.4100198, -0.1515583, 1.486543, 0, 0.03921569, 1, 1,
0.4101365, 1.76376, 0.4181491, 0, 0.03529412, 1, 1,
0.4145505, 1.481339, 1.228366, 0, 0.02745098, 1, 1,
0.4163734, 0.9972499, 1.032031, 0, 0.02352941, 1, 1,
0.4188395, -0.1407264, 1.436621, 0, 0.01568628, 1, 1,
0.4221391, -0.01283287, -0.06954014, 0, 0.01176471, 1, 1,
0.4256328, -0.508778, 2.724602, 0, 0.003921569, 1, 1,
0.4259525, -0.4383707, 3.04088, 0.003921569, 0, 1, 1,
0.4272355, 0.3009366, 1.610978, 0.007843138, 0, 1, 1,
0.4305432, 1.141142, 1.604956, 0.01568628, 0, 1, 1,
0.4352461, -1.226061, 2.952262, 0.01960784, 0, 1, 1,
0.4383189, -0.8168671, 2.744311, 0.02745098, 0, 1, 1,
0.4489425, 0.2123052, 0.9969119, 0.03137255, 0, 1, 1,
0.4497359, -0.949354, 4.608127, 0.03921569, 0, 1, 1,
0.4501292, 0.655705, 1.047575, 0.04313726, 0, 1, 1,
0.4502095, 0.4820402, 2.66944, 0.05098039, 0, 1, 1,
0.4567643, 0.1242588, -0.4513429, 0.05490196, 0, 1, 1,
0.4584735, -0.3101898, 1.676974, 0.0627451, 0, 1, 1,
0.4587167, 0.586549, 0.1726466, 0.06666667, 0, 1, 1,
0.4600673, -0.2350386, 1.893212, 0.07450981, 0, 1, 1,
0.4604573, -0.3845665, 2.8797, 0.07843138, 0, 1, 1,
0.4610987, 0.7356843, 3.151056, 0.08627451, 0, 1, 1,
0.4611277, -0.4584987, 3.720097, 0.09019608, 0, 1, 1,
0.4615788, -1.843662, 3.39387, 0.09803922, 0, 1, 1,
0.4650946, -1.421052, 3.641461, 0.1058824, 0, 1, 1,
0.465508, -1.280189, 2.592512, 0.1098039, 0, 1, 1,
0.466237, 0.9833249, 1.098993, 0.1176471, 0, 1, 1,
0.468233, 1.192901, 1.308198, 0.1215686, 0, 1, 1,
0.47032, 0.7296386, 1.823379, 0.1294118, 0, 1, 1,
0.4734942, 0.760492, 0.8620843, 0.1333333, 0, 1, 1,
0.4736186, 2.281508, 0.9511965, 0.1411765, 0, 1, 1,
0.4742259, -0.5152993, 3.30953, 0.145098, 0, 1, 1,
0.4743058, 1.559644, 1.105855, 0.1529412, 0, 1, 1,
0.4751675, -1.059109, 2.04814, 0.1568628, 0, 1, 1,
0.47697, 0.7320827, -0.01282143, 0.1647059, 0, 1, 1,
0.4798265, -0.9619085, 1.948258, 0.1686275, 0, 1, 1,
0.4813263, -1.656251, 4.039219, 0.1764706, 0, 1, 1,
0.4843524, 1.416073, 1.577529, 0.1803922, 0, 1, 1,
0.4843694, -1.338477, 2.055914, 0.1882353, 0, 1, 1,
0.4853825, -0.008197389, 0.8504092, 0.1921569, 0, 1, 1,
0.4903063, -0.9686549, 2.952595, 0.2, 0, 1, 1,
0.5007728, -0.4551087, 3.256565, 0.2078431, 0, 1, 1,
0.5007852, -0.03862324, 0.6274812, 0.2117647, 0, 1, 1,
0.5030923, -1.128313, 2.444783, 0.2196078, 0, 1, 1,
0.5038972, -0.6417598, 2.829443, 0.2235294, 0, 1, 1,
0.5039787, -0.355684, 1.802674, 0.2313726, 0, 1, 1,
0.5061753, 0.007480813, 1.111534, 0.2352941, 0, 1, 1,
0.5110102, 1.428857, 1.100366, 0.2431373, 0, 1, 1,
0.5192395, -0.2451304, 0.5460624, 0.2470588, 0, 1, 1,
0.5218191, -0.7780283, 0.5552214, 0.254902, 0, 1, 1,
0.525079, 0.8266095, 0.455153, 0.2588235, 0, 1, 1,
0.5262123, 2.585729, -1.38339, 0.2666667, 0, 1, 1,
0.5262837, -0.1104422, 0.03194781, 0.2705882, 0, 1, 1,
0.5263991, 2.758969, -0.07107383, 0.2784314, 0, 1, 1,
0.5286205, -1.472535, 2.879649, 0.282353, 0, 1, 1,
0.5326075, -1.162562, 2.645349, 0.2901961, 0, 1, 1,
0.5363628, -0.2697745, 0.2526215, 0.2941177, 0, 1, 1,
0.5460262, 0.8139021, 1.421428, 0.3019608, 0, 1, 1,
0.5479573, 0.6744627, -0.626725, 0.3098039, 0, 1, 1,
0.5479721, -1.691482, 4.706594, 0.3137255, 0, 1, 1,
0.5514143, 0.2585334, 1.534567, 0.3215686, 0, 1, 1,
0.5519481, 0.02503745, 3.003434, 0.3254902, 0, 1, 1,
0.5535347, 1.70233, 0.746799, 0.3333333, 0, 1, 1,
0.5615922, 0.3885813, 2.268309, 0.3372549, 0, 1, 1,
0.5630703, -0.1371427, 2.039956, 0.345098, 0, 1, 1,
0.5682494, -0.07609779, 1.693684, 0.3490196, 0, 1, 1,
0.5695428, 0.08470405, 2.63695, 0.3568628, 0, 1, 1,
0.5785965, 1.597789, -0.3636362, 0.3607843, 0, 1, 1,
0.5791794, 1.582698, 1.176399, 0.3686275, 0, 1, 1,
0.5796759, -1.807085, 2.94276, 0.372549, 0, 1, 1,
0.5806424, 1.259748, 0.4850385, 0.3803922, 0, 1, 1,
0.5905543, 0.7648277, -0.6731296, 0.3843137, 0, 1, 1,
0.5939305, -0.2724388, 2.01372, 0.3921569, 0, 1, 1,
0.594722, 0.09572814, -0.2375048, 0.3960784, 0, 1, 1,
0.5951819, 0.4088023, 3.505915, 0.4039216, 0, 1, 1,
0.5986306, 0.8373785, 0.8791817, 0.4117647, 0, 1, 1,
0.6025602, 0.3131208, 0.8602382, 0.4156863, 0, 1, 1,
0.6090509, 0.339321, 2.345511, 0.4235294, 0, 1, 1,
0.6105483, 0.2591269, 1.196711, 0.427451, 0, 1, 1,
0.611832, -0.3237187, 1.762515, 0.4352941, 0, 1, 1,
0.6141043, -0.6710678, 1.685184, 0.4392157, 0, 1, 1,
0.6142544, -0.03245, 2.808469, 0.4470588, 0, 1, 1,
0.6172963, 0.2898574, 0.4444841, 0.4509804, 0, 1, 1,
0.6244381, -0.8311892, 0.19294, 0.4588235, 0, 1, 1,
0.6262025, 2.0463, 1.02015, 0.4627451, 0, 1, 1,
0.6281935, -0.9411443, 2.489759, 0.4705882, 0, 1, 1,
0.6287625, -0.2337526, 2.289542, 0.4745098, 0, 1, 1,
0.6302955, 0.3774297, 1.041861, 0.4823529, 0, 1, 1,
0.6324971, 1.537089, 0.1021095, 0.4862745, 0, 1, 1,
0.6411989, -0.6961138, 2.248581, 0.4941176, 0, 1, 1,
0.650746, -0.07178992, 2.166345, 0.5019608, 0, 1, 1,
0.6507603, -0.3332438, 0.3232805, 0.5058824, 0, 1, 1,
0.6510669, 0.9812188, -1.229677, 0.5137255, 0, 1, 1,
0.6572011, -1.18708, 3.647746, 0.5176471, 0, 1, 1,
0.6573688, 1.586697, 0.8475618, 0.5254902, 0, 1, 1,
0.6679154, -0.2492109, 3.280331, 0.5294118, 0, 1, 1,
0.668757, 0.7073457, 1.794425, 0.5372549, 0, 1, 1,
0.6702714, 0.1826223, 2.064398, 0.5411765, 0, 1, 1,
0.6711799, 2.07013, 0.7999685, 0.5490196, 0, 1, 1,
0.6807501, 1.364901, 0.9977509, 0.5529412, 0, 1, 1,
0.6847868, -1.024255, 3.10897, 0.5607843, 0, 1, 1,
0.6864589, -1.30781, 3.875496, 0.5647059, 0, 1, 1,
0.6940167, 0.3167766, -0.5710561, 0.572549, 0, 1, 1,
0.6986241, -1.378844, 2.138892, 0.5764706, 0, 1, 1,
0.7051942, -0.178713, 1.868357, 0.5843138, 0, 1, 1,
0.7102324, 0.3477575, 1.948108, 0.5882353, 0, 1, 1,
0.7114682, -0.108405, 1.257243, 0.5960785, 0, 1, 1,
0.7181082, -1.852343, 1.8429, 0.6039216, 0, 1, 1,
0.7225428, 0.6744676, 1.215482, 0.6078432, 0, 1, 1,
0.7270782, 0.1838466, 1.894956, 0.6156863, 0, 1, 1,
0.730867, 1.445156, 0.6241499, 0.6196079, 0, 1, 1,
0.7333449, 0.4695061, 2.583315, 0.627451, 0, 1, 1,
0.7354739, -1.690269, 1.475221, 0.6313726, 0, 1, 1,
0.7361184, 0.2613298, 0.1419588, 0.6392157, 0, 1, 1,
0.7361665, -0.3717768, 3.052872, 0.6431373, 0, 1, 1,
0.7412993, -1.44348, 2.038078, 0.6509804, 0, 1, 1,
0.7535318, 0.3461876, -1.5069, 0.654902, 0, 1, 1,
0.7569661, -1.303974, 0.9529415, 0.6627451, 0, 1, 1,
0.7572641, 1.462244, 1.374792, 0.6666667, 0, 1, 1,
0.757624, -1.079218, 1.976723, 0.6745098, 0, 1, 1,
0.7603004, 0.7922716, 1.746628, 0.6784314, 0, 1, 1,
0.7682526, 1.402397, 0.2795244, 0.6862745, 0, 1, 1,
0.7744184, 0.1718371, 2.666859, 0.6901961, 0, 1, 1,
0.7760478, 0.4481481, 2.102567, 0.6980392, 0, 1, 1,
0.7761241, -0.1893855, 1.603531, 0.7058824, 0, 1, 1,
0.7767445, -0.1952805, 3.401383, 0.7098039, 0, 1, 1,
0.7772924, -0.8313097, 0.9618493, 0.7176471, 0, 1, 1,
0.7800601, -1.009308, 1.080155, 0.7215686, 0, 1, 1,
0.7804735, -1.144332, 0.4095631, 0.7294118, 0, 1, 1,
0.7858759, -0.2163103, 1.048959, 0.7333333, 0, 1, 1,
0.7866731, -0.1537696, 0.5938343, 0.7411765, 0, 1, 1,
0.7883667, 0.03359823, 1.505988, 0.7450981, 0, 1, 1,
0.7904394, 0.9676291, -0.1506149, 0.7529412, 0, 1, 1,
0.7938047, 0.6458318, 1.338905, 0.7568628, 0, 1, 1,
0.7974879, -1.432995, 3.145688, 0.7647059, 0, 1, 1,
0.8004488, -1.657834, 1.636115, 0.7686275, 0, 1, 1,
0.8069972, -0.0814131, 1.480045, 0.7764706, 0, 1, 1,
0.8098348, 1.265596, 0.7681224, 0.7803922, 0, 1, 1,
0.8157479, 0.2495807, 1.111201, 0.7882353, 0, 1, 1,
0.8169907, 0.5378416, 1.182089, 0.7921569, 0, 1, 1,
0.8240548, -0.4395271, 3.552047, 0.8, 0, 1, 1,
0.8270727, 0.7409571, 1.960108, 0.8078431, 0, 1, 1,
0.8366814, 0.5405173, 0.5963629, 0.8117647, 0, 1, 1,
0.8381906, 0.5335951, 1.809337, 0.8196079, 0, 1, 1,
0.8398337, -0.6497363, 2.867987, 0.8235294, 0, 1, 1,
0.8442675, -1.214085, 0.4985974, 0.8313726, 0, 1, 1,
0.8515597, -1.91763, 2.898527, 0.8352941, 0, 1, 1,
0.8525965, -1.314072, 2.249724, 0.8431373, 0, 1, 1,
0.8530835, 0.4159292, 1.156337, 0.8470588, 0, 1, 1,
0.8556468, -0.7566272, 0.7839754, 0.854902, 0, 1, 1,
0.860215, -0.7083088, 2.718829, 0.8588235, 0, 1, 1,
0.8609948, 0.1964081, -0.04109807, 0.8666667, 0, 1, 1,
0.8779705, -0.3633277, 3.64117, 0.8705882, 0, 1, 1,
0.8809566, 1.719762, 0.4922323, 0.8784314, 0, 1, 1,
0.8817737, -1.592555, 2.944559, 0.8823529, 0, 1, 1,
0.891695, 0.2467868, 1.412993, 0.8901961, 0, 1, 1,
0.8917654, 0.8816501, 2.19331, 0.8941177, 0, 1, 1,
0.8928028, -1.078447, 2.927588, 0.9019608, 0, 1, 1,
0.9000224, -0.6234996, 3.405787, 0.9098039, 0, 1, 1,
0.9045781, 0.8603016, 1.163086, 0.9137255, 0, 1, 1,
0.9158327, 0.2611389, 0.4669242, 0.9215686, 0, 1, 1,
0.9191148, 1.286597, 0.4451262, 0.9254902, 0, 1, 1,
0.9191412, 0.6470431, 1.353812, 0.9333333, 0, 1, 1,
0.920594, -1.52621, 1.814465, 0.9372549, 0, 1, 1,
0.9260631, 0.05140783, 1.585783, 0.945098, 0, 1, 1,
0.929476, -0.488629, 1.813511, 0.9490196, 0, 1, 1,
0.9311299, -0.89103, -0.01705497, 0.9568627, 0, 1, 1,
0.9350172, -0.02952128, 1.11042, 0.9607843, 0, 1, 1,
0.935637, -0.5930105, 2.948128, 0.9686275, 0, 1, 1,
0.9452001, -0.5667779, 2.243642, 0.972549, 0, 1, 1,
0.9487151, 0.7461585, 0.1849969, 0.9803922, 0, 1, 1,
0.9580969, -0.2694831, 1.470484, 0.9843137, 0, 1, 1,
0.9789817, 0.4708379, 1.479254, 0.9921569, 0, 1, 1,
0.9846481, 2.03182, -0.2596637, 0.9960784, 0, 1, 1,
0.9865507, 0.3561213, 0.538076, 1, 0, 0.9960784, 1,
0.9867631, -0.4316125, 0.9643642, 1, 0, 0.9882353, 1,
0.9888467, 0.2990356, 1.728686, 1, 0, 0.9843137, 1,
0.9914531, 0.7919877, 0.4470005, 1, 0, 0.9764706, 1,
0.9940362, 0.5321722, 1.156666, 1, 0, 0.972549, 1,
0.9974197, -0.04675042, 1.778487, 1, 0, 0.9647059, 1,
0.9988413, 0.1701428, 2.923537, 1, 0, 0.9607843, 1,
1.003726, 0.4625839, 0.9977372, 1, 0, 0.9529412, 1,
1.005054, 0.378451, 1.352631, 1, 0, 0.9490196, 1,
1.01025, 1.064787, 1.265346, 1, 0, 0.9411765, 1,
1.012579, 0.2025226, 0.6162063, 1, 0, 0.9372549, 1,
1.013039, 0.1157575, 1.214949, 1, 0, 0.9294118, 1,
1.015708, -0.5900598, 2.840969, 1, 0, 0.9254902, 1,
1.016957, 1.201679, -0.7320786, 1, 0, 0.9176471, 1,
1.024548, 0.1003872, 1.106733, 1, 0, 0.9137255, 1,
1.025063, 1.678649, -0.8789515, 1, 0, 0.9058824, 1,
1.036755, -0.7070208, 1.78649, 1, 0, 0.9019608, 1,
1.043983, 0.06323946, 1.768821, 1, 0, 0.8941177, 1,
1.048102, -1.581029, 2.493148, 1, 0, 0.8862745, 1,
1.055993, 2.120081, 0.389179, 1, 0, 0.8823529, 1,
1.057455, -2.650028, 2.581187, 1, 0, 0.8745098, 1,
1.057703, -1.242181, 1.66221, 1, 0, 0.8705882, 1,
1.062437, -0.2558397, 3.877401, 1, 0, 0.8627451, 1,
1.070688, 0.849783, 2.678122, 1, 0, 0.8588235, 1,
1.079292, 2.14385, -0.1419646, 1, 0, 0.8509804, 1,
1.08058, -0.9261647, 1.496695, 1, 0, 0.8470588, 1,
1.081643, 0.9813535, 1.141994, 1, 0, 0.8392157, 1,
1.084632, -0.9769363, 1.712036, 1, 0, 0.8352941, 1,
1.085465, 0.3900157, 0.2053765, 1, 0, 0.827451, 1,
1.087234, -0.1031438, 0.09475557, 1, 0, 0.8235294, 1,
1.092008, -1.358748, 2.232203, 1, 0, 0.8156863, 1,
1.092684, 0.401102, 1.139841, 1, 0, 0.8117647, 1,
1.094756, -0.2109904, 0.3871375, 1, 0, 0.8039216, 1,
1.103233, -0.9274877, 3.522782, 1, 0, 0.7960784, 1,
1.107958, 1.058632, -1.584633, 1, 0, 0.7921569, 1,
1.11022, -1.296754, 2.213547, 1, 0, 0.7843137, 1,
1.112909, -0.4529018, 2.517995, 1, 0, 0.7803922, 1,
1.123257, -0.07890143, 0.9343109, 1, 0, 0.772549, 1,
1.124541, 0.1740151, 1.683299, 1, 0, 0.7686275, 1,
1.152935, 0.7391397, 2.173022, 1, 0, 0.7607843, 1,
1.153696, -0.5172246, 2.663726, 1, 0, 0.7568628, 1,
1.154909, -0.2465326, 2.516535, 1, 0, 0.7490196, 1,
1.161261, 0.9947478, -0.08121901, 1, 0, 0.7450981, 1,
1.166955, 2.567503, 1.893836, 1, 0, 0.7372549, 1,
1.172937, -0.2061641, -0.2426075, 1, 0, 0.7333333, 1,
1.197088, 0.2706186, 2.548321, 1, 0, 0.7254902, 1,
1.198521, 0.7717719, 0.2570731, 1, 0, 0.7215686, 1,
1.208313, -0.3023059, 0.6494266, 1, 0, 0.7137255, 1,
1.214447, 0.7124509, 2.149763, 1, 0, 0.7098039, 1,
1.219295, 0.2650104, 3.246077, 1, 0, 0.7019608, 1,
1.229058, -1.380561, 3.049942, 1, 0, 0.6941177, 1,
1.246708, -0.4427193, 3.07662, 1, 0, 0.6901961, 1,
1.25734, -0.149985, 1.430168, 1, 0, 0.682353, 1,
1.262406, -1.910469, 1.897878, 1, 0, 0.6784314, 1,
1.263717, -0.1752628, 2.68041, 1, 0, 0.6705883, 1,
1.274928, 0.2180171, 1.727251, 1, 0, 0.6666667, 1,
1.278465, -0.006555253, 0.8639833, 1, 0, 0.6588235, 1,
1.280016, 0.1456261, 1.444004, 1, 0, 0.654902, 1,
1.285329, -1.897393, 2.996513, 1, 0, 0.6470588, 1,
1.286469, -1.303108, 3.9586, 1, 0, 0.6431373, 1,
1.299002, 1.028523, 1.859232, 1, 0, 0.6352941, 1,
1.304815, -0.0986856, 1.374897, 1, 0, 0.6313726, 1,
1.304849, -1.654744, 2.402282, 1, 0, 0.6235294, 1,
1.307173, 1.167872, 0.4184211, 1, 0, 0.6196079, 1,
1.307321, -1.036721, 2.859365, 1, 0, 0.6117647, 1,
1.323437, 1.71596, 1.198405, 1, 0, 0.6078432, 1,
1.328555, 1.443391, 0.6339425, 1, 0, 0.6, 1,
1.341031, 0.6853147, 2.795931, 1, 0, 0.5921569, 1,
1.348461, -1.488461, 0.9465717, 1, 0, 0.5882353, 1,
1.351267, -0.7728642, 1.785212, 1, 0, 0.5803922, 1,
1.353098, 0.6512334, 1.778118, 1, 0, 0.5764706, 1,
1.370424, 1.365794, 0.2592245, 1, 0, 0.5686275, 1,
1.375842, 1.572725, 1.770128, 1, 0, 0.5647059, 1,
1.379366, 1.067623, 2.152532, 1, 0, 0.5568628, 1,
1.395572, 0.7095523, 1.399812, 1, 0, 0.5529412, 1,
1.3979, 0.01336213, 3.218543, 1, 0, 0.5450981, 1,
1.405437, -0.5218765, 1.377769, 1, 0, 0.5411765, 1,
1.410414, 0.7299669, 0.2780045, 1, 0, 0.5333334, 1,
1.414183, -0.8791819, 3.028463, 1, 0, 0.5294118, 1,
1.419413, -0.01558277, 1.666582, 1, 0, 0.5215687, 1,
1.425439, 0.7014696, 1.017156, 1, 0, 0.5176471, 1,
1.433282, -0.3684806, 3.291667, 1, 0, 0.509804, 1,
1.444008, -2.004883, 2.347477, 1, 0, 0.5058824, 1,
1.453422, 1.207832, -0.02892675, 1, 0, 0.4980392, 1,
1.456498, -0.3505209, 1.8095, 1, 0, 0.4901961, 1,
1.465009, 1.447727, -0.8183714, 1, 0, 0.4862745, 1,
1.47404, 0.4233928, 0.3471548, 1, 0, 0.4784314, 1,
1.474929, 0.07835903, 1.380777, 1, 0, 0.4745098, 1,
1.487569, -0.1420678, 1.363319, 1, 0, 0.4666667, 1,
1.489261, 0.3537616, 2.438579, 1, 0, 0.4627451, 1,
1.498256, 0.4913806, 2.481375, 1, 0, 0.454902, 1,
1.501678, -1.604587, 1.270922, 1, 0, 0.4509804, 1,
1.5017, -0.6705519, 2.256198, 1, 0, 0.4431373, 1,
1.502522, -0.9587637, -0.007357049, 1, 0, 0.4392157, 1,
1.508035, 1.112374, 0.250278, 1, 0, 0.4313726, 1,
1.519766, -1.180608, 1.185258, 1, 0, 0.427451, 1,
1.52862, -0.7656303, 1.116973, 1, 0, 0.4196078, 1,
1.536474, -1.292041, 4.799321, 1, 0, 0.4156863, 1,
1.537265, -0.9111428, -0.4548863, 1, 0, 0.4078431, 1,
1.542088, -0.292632, 2.96461, 1, 0, 0.4039216, 1,
1.544006, -0.03348791, -0.05791337, 1, 0, 0.3960784, 1,
1.546181, -0.5854914, 3.630271, 1, 0, 0.3882353, 1,
1.54712, 0.03671737, 2.202729, 1, 0, 0.3843137, 1,
1.555505, 0.5579439, 1.160317, 1, 0, 0.3764706, 1,
1.559577, -0.7902272, 2.427531, 1, 0, 0.372549, 1,
1.582026, -0.8538684, 2.630788, 1, 0, 0.3647059, 1,
1.599285, 1.517774, 0.6487264, 1, 0, 0.3607843, 1,
1.601389, -2.280243, 2.125891, 1, 0, 0.3529412, 1,
1.602986, 0.3793386, 1.133641, 1, 0, 0.3490196, 1,
1.610814, 0.1395786, 0.8033276, 1, 0, 0.3411765, 1,
1.612167, 0.7477056, 1.223681, 1, 0, 0.3372549, 1,
1.624062, 0.5754272, 3.260015, 1, 0, 0.3294118, 1,
1.624087, -0.03513732, 2.747538, 1, 0, 0.3254902, 1,
1.627263, -1.684474, 2.492764, 1, 0, 0.3176471, 1,
1.632313, 0.4760177, 1.304119, 1, 0, 0.3137255, 1,
1.636706, -1.750077, 2.12992, 1, 0, 0.3058824, 1,
1.645831, 1.745301, 0.1507329, 1, 0, 0.2980392, 1,
1.647573, -0.6893989, 2.79825, 1, 0, 0.2941177, 1,
1.651981, -1.447544, 1.520388, 1, 0, 0.2862745, 1,
1.669042, -0.1868368, 3.089438, 1, 0, 0.282353, 1,
1.683566, -0.26459, 1.166641, 1, 0, 0.2745098, 1,
1.685789, 1.232703, 2.659977, 1, 0, 0.2705882, 1,
1.688938, 0.04088861, 2.097508, 1, 0, 0.2627451, 1,
1.69, 0.8446634, 0.8211105, 1, 0, 0.2588235, 1,
1.722035, 1.606215, 0.1110645, 1, 0, 0.2509804, 1,
1.729117, -0.1610745, 0.940858, 1, 0, 0.2470588, 1,
1.760417, 0.5710492, 1.66395, 1, 0, 0.2392157, 1,
1.767527, -1.246863, -0.3417018, 1, 0, 0.2352941, 1,
1.770921, -0.9159053, 2.95303, 1, 0, 0.227451, 1,
1.791891, -0.3696853, 3.486337, 1, 0, 0.2235294, 1,
1.795148, -0.7143277, 0.6426138, 1, 0, 0.2156863, 1,
1.800317, -0.463083, 1.820484, 1, 0, 0.2117647, 1,
1.805557, -1.827356, 2.873384, 1, 0, 0.2039216, 1,
1.819145, 0.737589, 2.770662, 1, 0, 0.1960784, 1,
1.826438, -0.7377183, 2.521889, 1, 0, 0.1921569, 1,
1.842977, -0.8008956, -0.06104309, 1, 0, 0.1843137, 1,
1.848673, -0.8148315, 1.934547, 1, 0, 0.1803922, 1,
1.909653, 1.353376, 2.822904, 1, 0, 0.172549, 1,
1.919892, 0.2901839, 3.075381, 1, 0, 0.1686275, 1,
1.939832, 0.1321656, 2.898296, 1, 0, 0.1607843, 1,
1.942901, -1.439447, 1.243558, 1, 0, 0.1568628, 1,
1.953362, 0.02688791, 2.218342, 1, 0, 0.1490196, 1,
1.96367, -0.8521498, 2.889162, 1, 0, 0.145098, 1,
1.971124, 0.145326, 3.268447, 1, 0, 0.1372549, 1,
1.975596, 0.3408641, 0.3503898, 1, 0, 0.1333333, 1,
1.97909, 1.804254, 0.3342949, 1, 0, 0.1254902, 1,
1.980663, 0.1941919, 2.592915, 1, 0, 0.1215686, 1,
2.016377, 0.5974655, 3.597901, 1, 0, 0.1137255, 1,
2.070812, -0.08241834, 3.234477, 1, 0, 0.1098039, 1,
2.073581, -1.696555, 1.216258, 1, 0, 0.1019608, 1,
2.082888, 1.590072, 2.757131, 1, 0, 0.09411765, 1,
2.097214, -1.270855, 1.669923, 1, 0, 0.09019608, 1,
2.113056, 0.7367671, 0.2528172, 1, 0, 0.08235294, 1,
2.124271, 0.5661194, 1.743335, 1, 0, 0.07843138, 1,
2.247526, -1.621718, 4.426053, 1, 0, 0.07058824, 1,
2.257955, -0.7009011, 1.535184, 1, 0, 0.06666667, 1,
2.279906, -0.05374611, 2.329411, 1, 0, 0.05882353, 1,
2.308604, 0.2742183, 1.060751, 1, 0, 0.05490196, 1,
2.34198, -1.327315, 2.594708, 1, 0, 0.04705882, 1,
2.366329, 0.2155556, 1.898277, 1, 0, 0.04313726, 1,
2.553637, 0.9120069, 1.075841, 1, 0, 0.03529412, 1,
2.610432, 1.849146, 0.2831901, 1, 0, 0.03137255, 1,
2.652742, -0.4785655, 0.8446503, 1, 0, 0.02352941, 1,
2.725991, 0.5495095, 2.615172, 1, 0, 0.01960784, 1,
3.479443, 0.03646291, 1.840598, 1, 0, 0.01176471, 1,
3.509133, -0.4406158, 1.258191, 1, 0, 0.007843138, 1
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
0.1658639, -4.551113, -7.06504, 0, -0.5, 0.5, 0.5,
0.1658639, -4.551113, -7.06504, 1, -0.5, 0.5, 0.5,
0.1658639, -4.551113, -7.06504, 1, 1.5, 0.5, 0.5,
0.1658639, -4.551113, -7.06504, 0, 1.5, 0.5, 0.5
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
-4.310773, 0.1206372, -7.06504, 0, -0.5, 0.5, 0.5,
-4.310773, 0.1206372, -7.06504, 1, -0.5, 0.5, 0.5,
-4.310773, 0.1206372, -7.06504, 1, 1.5, 0.5, 0.5,
-4.310773, 0.1206372, -7.06504, 0, 1.5, 0.5, 0.5
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
-4.310773, -4.551113, 0.1559212, 0, -0.5, 0.5, 0.5,
-4.310773, -4.551113, 0.1559212, 1, -0.5, 0.5, 0.5,
-4.310773, -4.551113, 0.1559212, 1, 1.5, 0.5, 0.5,
-4.310773, -4.551113, 0.1559212, 0, 1.5, 0.5, 0.5
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
-3, -3.473017, -5.398664,
3, -3.473017, -5.398664,
-3, -3.473017, -5.398664,
-3, -3.652699, -5.676394,
-2, -3.473017, -5.398664,
-2, -3.652699, -5.676394,
-1, -3.473017, -5.398664,
-1, -3.652699, -5.676394,
0, -3.473017, -5.398664,
0, -3.652699, -5.676394,
1, -3.473017, -5.398664,
1, -3.652699, -5.676394,
2, -3.473017, -5.398664,
2, -3.652699, -5.676394,
3, -3.473017, -5.398664,
3, -3.652699, -5.676394
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
-3, -4.012065, -6.231852, 0, -0.5, 0.5, 0.5,
-3, -4.012065, -6.231852, 1, -0.5, 0.5, 0.5,
-3, -4.012065, -6.231852, 1, 1.5, 0.5, 0.5,
-3, -4.012065, -6.231852, 0, 1.5, 0.5, 0.5,
-2, -4.012065, -6.231852, 0, -0.5, 0.5, 0.5,
-2, -4.012065, -6.231852, 1, -0.5, 0.5, 0.5,
-2, -4.012065, -6.231852, 1, 1.5, 0.5, 0.5,
-2, -4.012065, -6.231852, 0, 1.5, 0.5, 0.5,
-1, -4.012065, -6.231852, 0, -0.5, 0.5, 0.5,
-1, -4.012065, -6.231852, 1, -0.5, 0.5, 0.5,
-1, -4.012065, -6.231852, 1, 1.5, 0.5, 0.5,
-1, -4.012065, -6.231852, 0, 1.5, 0.5, 0.5,
0, -4.012065, -6.231852, 0, -0.5, 0.5, 0.5,
0, -4.012065, -6.231852, 1, -0.5, 0.5, 0.5,
0, -4.012065, -6.231852, 1, 1.5, 0.5, 0.5,
0, -4.012065, -6.231852, 0, 1.5, 0.5, 0.5,
1, -4.012065, -6.231852, 0, -0.5, 0.5, 0.5,
1, -4.012065, -6.231852, 1, -0.5, 0.5, 0.5,
1, -4.012065, -6.231852, 1, 1.5, 0.5, 0.5,
1, -4.012065, -6.231852, 0, 1.5, 0.5, 0.5,
2, -4.012065, -6.231852, 0, -0.5, 0.5, 0.5,
2, -4.012065, -6.231852, 1, -0.5, 0.5, 0.5,
2, -4.012065, -6.231852, 1, 1.5, 0.5, 0.5,
2, -4.012065, -6.231852, 0, 1.5, 0.5, 0.5,
3, -4.012065, -6.231852, 0, -0.5, 0.5, 0.5,
3, -4.012065, -6.231852, 1, -0.5, 0.5, 0.5,
3, -4.012065, -6.231852, 1, 1.5, 0.5, 0.5,
3, -4.012065, -6.231852, 0, 1.5, 0.5, 0.5
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
-3.277703, -3, -5.398664,
-3.277703, 3, -5.398664,
-3.277703, -3, -5.398664,
-3.449881, -3, -5.676394,
-3.277703, -2, -5.398664,
-3.449881, -2, -5.676394,
-3.277703, -1, -5.398664,
-3.449881, -1, -5.676394,
-3.277703, 0, -5.398664,
-3.449881, 0, -5.676394,
-3.277703, 1, -5.398664,
-3.449881, 1, -5.676394,
-3.277703, 2, -5.398664,
-3.449881, 2, -5.676394,
-3.277703, 3, -5.398664,
-3.449881, 3, -5.676394
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
-3.794238, -3, -6.231852, 0, -0.5, 0.5, 0.5,
-3.794238, -3, -6.231852, 1, -0.5, 0.5, 0.5,
-3.794238, -3, -6.231852, 1, 1.5, 0.5, 0.5,
-3.794238, -3, -6.231852, 0, 1.5, 0.5, 0.5,
-3.794238, -2, -6.231852, 0, -0.5, 0.5, 0.5,
-3.794238, -2, -6.231852, 1, -0.5, 0.5, 0.5,
-3.794238, -2, -6.231852, 1, 1.5, 0.5, 0.5,
-3.794238, -2, -6.231852, 0, 1.5, 0.5, 0.5,
-3.794238, -1, -6.231852, 0, -0.5, 0.5, 0.5,
-3.794238, -1, -6.231852, 1, -0.5, 0.5, 0.5,
-3.794238, -1, -6.231852, 1, 1.5, 0.5, 0.5,
-3.794238, -1, -6.231852, 0, 1.5, 0.5, 0.5,
-3.794238, 0, -6.231852, 0, -0.5, 0.5, 0.5,
-3.794238, 0, -6.231852, 1, -0.5, 0.5, 0.5,
-3.794238, 0, -6.231852, 1, 1.5, 0.5, 0.5,
-3.794238, 0, -6.231852, 0, 1.5, 0.5, 0.5,
-3.794238, 1, -6.231852, 0, -0.5, 0.5, 0.5,
-3.794238, 1, -6.231852, 1, -0.5, 0.5, 0.5,
-3.794238, 1, -6.231852, 1, 1.5, 0.5, 0.5,
-3.794238, 1, -6.231852, 0, 1.5, 0.5, 0.5,
-3.794238, 2, -6.231852, 0, -0.5, 0.5, 0.5,
-3.794238, 2, -6.231852, 1, -0.5, 0.5, 0.5,
-3.794238, 2, -6.231852, 1, 1.5, 0.5, 0.5,
-3.794238, 2, -6.231852, 0, 1.5, 0.5, 0.5,
-3.794238, 3, -6.231852, 0, -0.5, 0.5, 0.5,
-3.794238, 3, -6.231852, 1, -0.5, 0.5, 0.5,
-3.794238, 3, -6.231852, 1, 1.5, 0.5, 0.5,
-3.794238, 3, -6.231852, 0, 1.5, 0.5, 0.5
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
-3.277703, -3.473017, -4,
-3.277703, -3.473017, 4,
-3.277703, -3.473017, -4,
-3.449881, -3.652699, -4,
-3.277703, -3.473017, -2,
-3.449881, -3.652699, -2,
-3.277703, -3.473017, 0,
-3.449881, -3.652699, 0,
-3.277703, -3.473017, 2,
-3.449881, -3.652699, 2,
-3.277703, -3.473017, 4,
-3.449881, -3.652699, 4
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
-3.794238, -4.012065, -4, 0, -0.5, 0.5, 0.5,
-3.794238, -4.012065, -4, 1, -0.5, 0.5, 0.5,
-3.794238, -4.012065, -4, 1, 1.5, 0.5, 0.5,
-3.794238, -4.012065, -4, 0, 1.5, 0.5, 0.5,
-3.794238, -4.012065, -2, 0, -0.5, 0.5, 0.5,
-3.794238, -4.012065, -2, 1, -0.5, 0.5, 0.5,
-3.794238, -4.012065, -2, 1, 1.5, 0.5, 0.5,
-3.794238, -4.012065, -2, 0, 1.5, 0.5, 0.5,
-3.794238, -4.012065, 0, 0, -0.5, 0.5, 0.5,
-3.794238, -4.012065, 0, 1, -0.5, 0.5, 0.5,
-3.794238, -4.012065, 0, 1, 1.5, 0.5, 0.5,
-3.794238, -4.012065, 0, 0, 1.5, 0.5, 0.5,
-3.794238, -4.012065, 2, 0, -0.5, 0.5, 0.5,
-3.794238, -4.012065, 2, 1, -0.5, 0.5, 0.5,
-3.794238, -4.012065, 2, 1, 1.5, 0.5, 0.5,
-3.794238, -4.012065, 2, 0, 1.5, 0.5, 0.5,
-3.794238, -4.012065, 4, 0, -0.5, 0.5, 0.5,
-3.794238, -4.012065, 4, 1, -0.5, 0.5, 0.5,
-3.794238, -4.012065, 4, 1, 1.5, 0.5, 0.5,
-3.794238, -4.012065, 4, 0, 1.5, 0.5, 0.5
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
-3.277703, -3.473017, -5.398664,
-3.277703, 3.714291, -5.398664,
-3.277703, -3.473017, 5.710507,
-3.277703, 3.714291, 5.710507,
-3.277703, -3.473017, -5.398664,
-3.277703, -3.473017, 5.710507,
-3.277703, 3.714291, -5.398664,
-3.277703, 3.714291, 5.710507,
-3.277703, -3.473017, -5.398664,
3.609431, -3.473017, -5.398664,
-3.277703, -3.473017, 5.710507,
3.609431, -3.473017, 5.710507,
-3.277703, 3.714291, -5.398664,
3.609431, 3.714291, -5.398664,
-3.277703, 3.714291, 5.710507,
3.609431, 3.714291, 5.710507,
3.609431, -3.473017, -5.398664,
3.609431, 3.714291, -5.398664,
3.609431, -3.473017, 5.710507,
3.609431, 3.714291, 5.710507,
3.609431, -3.473017, -5.398664,
3.609431, -3.473017, 5.710507,
3.609431, 3.714291, -5.398664,
3.609431, 3.714291, 5.710507
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
var radius = 7.965152;
var distance = 35.43786;
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
mvMatrix.translate( -0.1658639, -0.1206372, -0.1559212 );
mvMatrix.scale( 1.250459, 1.198234, 0.7752224 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.43786);
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
thiodicarbe<-read.table("thiodicarbe.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-thiodicarbe$V2
```

```
## Error in eval(expr, envir, enclos): object 'thiodicarbe' not found
```

```r
y<-thiodicarbe$V3
```

```
## Error in eval(expr, envir, enclos): object 'thiodicarbe' not found
```

```r
z<-thiodicarbe$V4
```

```
## Error in eval(expr, envir, enclos): object 'thiodicarbe' not found
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
-3.177405, 0.655399, -2.314119, 0, 0, 1, 1, 1,
-3.020254, -0.06138662, -1.674872, 1, 0, 0, 1, 1,
-2.642857, 0.06368706, -2.06613, 1, 0, 0, 1, 1,
-2.590973, -0.693424, -3.332387, 1, 0, 0, 1, 1,
-2.504326, 0.3338494, -0.1059683, 1, 0, 0, 1, 1,
-2.460208, -0.9674665, -2.770101, 1, 0, 0, 1, 1,
-2.395529, 1.096187, -2.179343, 0, 0, 0, 1, 1,
-2.39147, 0.6829816, -1.479133, 0, 0, 0, 1, 1,
-2.345003, 0.4701074, -2.189996, 0, 0, 0, 1, 1,
-2.285819, -0.8120709, -1.264623, 0, 0, 0, 1, 1,
-2.262067, -0.1113079, -2.356776, 0, 0, 0, 1, 1,
-2.243234, 1.389366, -1.6307, 0, 0, 0, 1, 1,
-2.242299, -1.563313, -0.6985641, 0, 0, 0, 1, 1,
-2.237179, 1.064093, -0.7927669, 1, 1, 1, 1, 1,
-2.222885, 0.6101204, 0.1767727, 1, 1, 1, 1, 1,
-2.192878, -2.556097, -2.824361, 1, 1, 1, 1, 1,
-2.159348, -1.166707, -1.314574, 1, 1, 1, 1, 1,
-2.111473, 0.1225797, -1.439561, 1, 1, 1, 1, 1,
-2.105582, 0.0513779, 0.4615409, 1, 1, 1, 1, 1,
-2.06436, 1.120754, -2.186508, 1, 1, 1, 1, 1,
-2.055336, -0.2671525, -1.313507, 1, 1, 1, 1, 1,
-2.054196, -1.282295, -3.553644, 1, 1, 1, 1, 1,
-2.022196, -1.054069, -2.023995, 1, 1, 1, 1, 1,
-2.000718, -0.0968632, -1.748568, 1, 1, 1, 1, 1,
-1.965819, -0.6401086, -1.847917, 1, 1, 1, 1, 1,
-1.941649, 1.708639, -0.4654208, 1, 1, 1, 1, 1,
-1.941396, 0.1395759, -0.7056152, 1, 1, 1, 1, 1,
-1.937875, -0.9106728, -3.429137, 1, 1, 1, 1, 1,
-1.932373, 0.04590993, -1.398079, 0, 0, 1, 1, 1,
-1.913917, -0.5760106, -1.247209, 1, 0, 0, 1, 1,
-1.887512, -1.376722, -1.005161, 1, 0, 0, 1, 1,
-1.886871, -1.287411, -1.552532, 1, 0, 0, 1, 1,
-1.88685, -1.060759, -1.563292, 1, 0, 0, 1, 1,
-1.852088, -1.9109, -1.662674, 1, 0, 0, 1, 1,
-1.832152, -0.08498784, -1.831515, 0, 0, 0, 1, 1,
-1.813418, -0.6943837, -2.788963, 0, 0, 0, 1, 1,
-1.798316, -0.03224075, -3.363468, 0, 0, 0, 1, 1,
-1.791538, -0.377616, -1.865989, 0, 0, 0, 1, 1,
-1.77938, -0.9417741, -2.393775, 0, 0, 0, 1, 1,
-1.775353, -0.2624325, -1.822822, 0, 0, 0, 1, 1,
-1.75073, -0.4775754, -0.7902528, 0, 0, 0, 1, 1,
-1.738581, -1.519086, -4.102037, 1, 1, 1, 1, 1,
-1.717436, -0.1751865, -1.37391, 1, 1, 1, 1, 1,
-1.716459, 0.9554825, -1.741174, 1, 1, 1, 1, 1,
-1.682325, -0.625156, -2.678363, 1, 1, 1, 1, 1,
-1.655357, -0.4743187, -3.694395, 1, 1, 1, 1, 1,
-1.637038, 0.1103369, -2.06206, 1, 1, 1, 1, 1,
-1.63643, -1.904412, -1.812139, 1, 1, 1, 1, 1,
-1.622174, 1.129252, -1.461318, 1, 1, 1, 1, 1,
-1.61056, -0.04981616, -1.164357, 1, 1, 1, 1, 1,
-1.605999, 0.5692188, -1.036333, 1, 1, 1, 1, 1,
-1.588906, 0.4637414, -1.59953, 1, 1, 1, 1, 1,
-1.579672, -0.9768994, -1.509708, 1, 1, 1, 1, 1,
-1.575757, 0.09953221, -3.112493, 1, 1, 1, 1, 1,
-1.57044, -0.1446673, -3.067045, 1, 1, 1, 1, 1,
-1.565247, -0.2565953, -1.333126, 1, 1, 1, 1, 1,
-1.56233, 0.4285618, -2.108442, 0, 0, 1, 1, 1,
-1.55686, 0.8719031, -2.06768, 1, 0, 0, 1, 1,
-1.554242, 1.837813, -0.090634, 1, 0, 0, 1, 1,
-1.546266, 0.1367798, -1.285295, 1, 0, 0, 1, 1,
-1.520876, 0.2517686, -1.750006, 1, 0, 0, 1, 1,
-1.519874, -0.3196725, -2.631358, 1, 0, 0, 1, 1,
-1.516873, 0.489305, -3.370853, 0, 0, 0, 1, 1,
-1.515401, -0.2268384, -3.864067, 0, 0, 0, 1, 1,
-1.498634, 1.210222, -1.275253, 0, 0, 0, 1, 1,
-1.482241, -0.3906083, -4.081771, 0, 0, 0, 1, 1,
-1.478854, 0.392898, -3.301252, 0, 0, 0, 1, 1,
-1.467611, 1.160607, -1.299253, 0, 0, 0, 1, 1,
-1.461682, 0.2073565, -2.2269, 0, 0, 0, 1, 1,
-1.442931, 0.5041127, -2.380412, 1, 1, 1, 1, 1,
-1.431348, -0.308484, -2.90614, 1, 1, 1, 1, 1,
-1.404302, 0.3828831, -2.011064, 1, 1, 1, 1, 1,
-1.401639, -0.4283764, -2.048878, 1, 1, 1, 1, 1,
-1.398021, -0.403768, -0.5926393, 1, 1, 1, 1, 1,
-1.375938, 1.339673, -0.602793, 1, 1, 1, 1, 1,
-1.339629, 1.552785, 0.6922701, 1, 1, 1, 1, 1,
-1.338361, 1.73997, -0.2326348, 1, 1, 1, 1, 1,
-1.328825, -0.9321649, -1.472347, 1, 1, 1, 1, 1,
-1.322686, 1.453633, -0.1095731, 1, 1, 1, 1, 1,
-1.320244, -0.03230369, -2.462708, 1, 1, 1, 1, 1,
-1.315378, -1.227298, -2.47906, 1, 1, 1, 1, 1,
-1.312972, 1.748758, -1.973123, 1, 1, 1, 1, 1,
-1.312069, 1.380159, -1.402745, 1, 1, 1, 1, 1,
-1.3089, -0.485575, -1.114489, 1, 1, 1, 1, 1,
-1.30735, -0.8218941, -1.503527, 0, 0, 1, 1, 1,
-1.304513, 0.5704817, -3.408293, 1, 0, 0, 1, 1,
-1.302165, -1.855689, -1.876769, 1, 0, 0, 1, 1,
-1.297834, -0.780116, -1.73117, 1, 0, 0, 1, 1,
-1.293468, -0.1740354, -2.044335, 1, 0, 0, 1, 1,
-1.291546, 0.4455393, -0.06347001, 1, 0, 0, 1, 1,
-1.282329, -0.57344, -1.045902, 0, 0, 0, 1, 1,
-1.28232, -0.7172176, -1.138476, 0, 0, 0, 1, 1,
-1.28188, 0.04505304, -2.54664, 0, 0, 0, 1, 1,
-1.281243, -0.03266969, -3.934816, 0, 0, 0, 1, 1,
-1.278165, 1.004875, -1.522909, 0, 0, 0, 1, 1,
-1.272765, -0.1724203, -2.145383, 0, 0, 0, 1, 1,
-1.272355, -0.9010396, -1.589743, 0, 0, 0, 1, 1,
-1.267643, 0.8778227, -0.4385334, 1, 1, 1, 1, 1,
-1.265237, 0.309364, -1.06477, 1, 1, 1, 1, 1,
-1.262434, 0.7751762, -1.153316, 1, 1, 1, 1, 1,
-1.243135, 0.9304166, -1.043533, 1, 1, 1, 1, 1,
-1.241396, -0.5289261, -3.9325, 1, 1, 1, 1, 1,
-1.240499, 0.1377042, -1.529476, 1, 1, 1, 1, 1,
-1.239794, 0.1891731, -2.251513, 1, 1, 1, 1, 1,
-1.234504, -0.9633038, -1.378899, 1, 1, 1, 1, 1,
-1.233389, -0.4064149, -0.5876385, 1, 1, 1, 1, 1,
-1.232781, -0.5533052, -0.987237, 1, 1, 1, 1, 1,
-1.232316, -0.154471, -2.882406, 1, 1, 1, 1, 1,
-1.232295, -0.8660449, -2.868999, 1, 1, 1, 1, 1,
-1.228772, 0.01116594, -0.4616674, 1, 1, 1, 1, 1,
-1.215211, -0.03154658, -0.9465278, 1, 1, 1, 1, 1,
-1.213728, 0.7980485, -1.100341, 1, 1, 1, 1, 1,
-1.206624, -1.128247, -2.388642, 0, 0, 1, 1, 1,
-1.202792, -0.2132062, -3.626788, 1, 0, 0, 1, 1,
-1.187509, -0.5070603, -1.589567, 1, 0, 0, 1, 1,
-1.180465, -0.6462576, -2.164034, 1, 0, 0, 1, 1,
-1.17653, -1.116524, -2.957549, 1, 0, 0, 1, 1,
-1.168097, -0.7893139, -0.2330518, 1, 0, 0, 1, 1,
-1.167971, 0.2407115, -2.099452, 0, 0, 0, 1, 1,
-1.162716, -1.010122, -3.440506, 0, 0, 0, 1, 1,
-1.161806, 2.402485, 0.2737516, 0, 0, 0, 1, 1,
-1.160945, 0.7228294, -0.6092162, 0, 0, 0, 1, 1,
-1.152928, -0.522942, -2.44254, 0, 0, 0, 1, 1,
-1.147925, -1.578088, -3.436605, 0, 0, 0, 1, 1,
-1.147799, 1.042868, -1.737594, 0, 0, 0, 1, 1,
-1.147764, -1.140518, -1.159328, 1, 1, 1, 1, 1,
-1.134678, -1.34166, -1.036649, 1, 1, 1, 1, 1,
-1.134249, -2.307034, -3.769743, 1, 1, 1, 1, 1,
-1.134148, 0.5597993, -0.5401756, 1, 1, 1, 1, 1,
-1.133887, -1.967058, -3.382509, 1, 1, 1, 1, 1,
-1.13338, -0.5309607, -2.15298, 1, 1, 1, 1, 1,
-1.131176, -0.2699903, -2.489275, 1, 1, 1, 1, 1,
-1.128967, 1.846175, -0.5221912, 1, 1, 1, 1, 1,
-1.114843, -0.6657404, -3.147198, 1, 1, 1, 1, 1,
-1.105131, -0.9416317, -3.333521, 1, 1, 1, 1, 1,
-1.105042, 0.879661, -1.503716, 1, 1, 1, 1, 1,
-1.081829, 0.09233648, -1.865224, 1, 1, 1, 1, 1,
-1.076707, 0.6473699, 1.09971, 1, 1, 1, 1, 1,
-1.073968, -0.6378418, -1.17899, 1, 1, 1, 1, 1,
-1.06197, -1.016652, -3.352855, 1, 1, 1, 1, 1,
-1.060731, 0.8116472, 0.07814022, 0, 0, 1, 1, 1,
-1.055513, -0.8385745, -1.784359, 1, 0, 0, 1, 1,
-1.049119, 0.8992553, -1.75976, 1, 0, 0, 1, 1,
-1.044271, -0.81585, -1.671564, 1, 0, 0, 1, 1,
-1.042907, -1.63303, -1.925351, 1, 0, 0, 1, 1,
-1.040141, 0.07901531, -1.004327, 1, 0, 0, 1, 1,
-1.037979, 0.4351177, -0.7194934, 0, 0, 0, 1, 1,
-1.030118, 0.6584064, -1.617595, 0, 0, 0, 1, 1,
-1.02997, -0.03666922, -2.730211, 0, 0, 0, 1, 1,
-1.029038, 0.3597743, -2.58427, 0, 0, 0, 1, 1,
-1.027651, 0.6047382, -0.01896443, 0, 0, 0, 1, 1,
-1.023257, 1.020055, -0.698242, 0, 0, 0, 1, 1,
-1.022849, -0.5736729, -1.708511, 0, 0, 0, 1, 1,
-1.019977, -1.882725, -2.414467, 1, 1, 1, 1, 1,
-1.019052, -0.4492827, -2.74851, 1, 1, 1, 1, 1,
-1.017504, 0.5517523, -1.506823, 1, 1, 1, 1, 1,
-1.01008, 0.4207242, -1.547716, 1, 1, 1, 1, 1,
-1.00549, 0.1603537, -0.7493473, 1, 1, 1, 1, 1,
-0.9996338, 0.6845189, 0.3734303, 1, 1, 1, 1, 1,
-0.9995931, 0.2853585, -0.2651294, 1, 1, 1, 1, 1,
-0.9984099, 1.463069, -0.523874, 1, 1, 1, 1, 1,
-0.9944813, -0.6870061, -1.516795, 1, 1, 1, 1, 1,
-0.99168, -1.649344, -3.71764, 1, 1, 1, 1, 1,
-0.9895502, -0.02837332, -1.989793, 1, 1, 1, 1, 1,
-0.9888893, -1.127786, -2.138554, 1, 1, 1, 1, 1,
-0.9862143, -0.6652512, -3.301998, 1, 1, 1, 1, 1,
-0.9791645, 1.125981, -0.2432009, 1, 1, 1, 1, 1,
-0.9673077, -0.1684944, 0.7712854, 1, 1, 1, 1, 1,
-0.9664586, 2.811241, 1.00722, 0, 0, 1, 1, 1,
-0.9659598, 0.3398608, -1.537092, 1, 0, 0, 1, 1,
-0.9602318, 0.4713393, -0.6966059, 1, 0, 0, 1, 1,
-0.9570585, -0.4773895, -2.226217, 1, 0, 0, 1, 1,
-0.9546789, 0.5222551, -0.6430867, 1, 0, 0, 1, 1,
-0.9518543, 0.4311324, -0.9408472, 1, 0, 0, 1, 1,
-0.9508231, -1.077184, -2.870876, 0, 0, 0, 1, 1,
-0.9492103, 0.4502946, -1.541706, 0, 0, 0, 1, 1,
-0.9458417, -0.06079513, -3.051262, 0, 0, 0, 1, 1,
-0.9393132, 2.472521, -0.5784245, 0, 0, 0, 1, 1,
-0.9315846, 0.4140925, -0.4859673, 0, 0, 0, 1, 1,
-0.9296606, -1.198721, -2.828418, 0, 0, 0, 1, 1,
-0.9253676, 0.5341172, -2.403295, 0, 0, 0, 1, 1,
-0.9198368, 0.113035, -1.931378, 1, 1, 1, 1, 1,
-0.9114692, -1.042906, -1.225331, 1, 1, 1, 1, 1,
-0.905396, 1.044959, -0.2011032, 1, 1, 1, 1, 1,
-0.8992757, 0.533387, -1.569687, 1, 1, 1, 1, 1,
-0.8990293, -1.820967, -3.971345, 1, 1, 1, 1, 1,
-0.8982403, -1.968194, -2.726571, 1, 1, 1, 1, 1,
-0.8979623, -1.754502, -2.45315, 1, 1, 1, 1, 1,
-0.8949476, 1.791371, -0.217555, 1, 1, 1, 1, 1,
-0.8926879, -0.3390425, 0.1141467, 1, 1, 1, 1, 1,
-0.8857443, -0.1304488, -1.775697, 1, 1, 1, 1, 1,
-0.8823622, -0.6282753, -1.59476, 1, 1, 1, 1, 1,
-0.8809373, -0.9289776, -1.898768, 1, 1, 1, 1, 1,
-0.8770115, 1.480515, -0.811925, 1, 1, 1, 1, 1,
-0.8663706, -0.07168663, -1.871039, 1, 1, 1, 1, 1,
-0.865595, 0.4521464, -1.301184, 1, 1, 1, 1, 1,
-0.8574348, 0.7760619, -1.265641, 0, 0, 1, 1, 1,
-0.8478203, 1.274258, -3.380976, 1, 0, 0, 1, 1,
-0.847414, 1.168528, 1.321959, 1, 0, 0, 1, 1,
-0.8466254, 0.5886678, -2.070127, 1, 0, 0, 1, 1,
-0.8372636, 1.112374, 0.246961, 1, 0, 0, 1, 1,
-0.8369636, 1.559068, -0.8988324, 1, 0, 0, 1, 1,
-0.834158, 0.6081099, -0.1913702, 0, 0, 0, 1, 1,
-0.832848, -0.304388, -2.480044, 0, 0, 0, 1, 1,
-0.8305721, 0.8282546, -1.501808, 0, 0, 0, 1, 1,
-0.8263773, -0.6086698, -2.103333, 0, 0, 0, 1, 1,
-0.8153861, 0.1728634, -1.156003, 0, 0, 0, 1, 1,
-0.8135577, 0.04723291, -1.60223, 0, 0, 0, 1, 1,
-0.8127207, -0.2682524, -0.2330619, 0, 0, 0, 1, 1,
-0.8079224, -0.004683937, -0.06019324, 1, 1, 1, 1, 1,
-0.8046982, 0.7194304, -2.751159, 1, 1, 1, 1, 1,
-0.8043037, 0.1825758, -0.1816088, 1, 1, 1, 1, 1,
-0.7992181, 0.2621328, -0.7220116, 1, 1, 1, 1, 1,
-0.7916081, 2.084345, -0.5109287, 1, 1, 1, 1, 1,
-0.7913871, 0.937219, -2.077152, 1, 1, 1, 1, 1,
-0.7868388, -2.009658, -3.322118, 1, 1, 1, 1, 1,
-0.7851391, 2.165929, -0.8498169, 1, 1, 1, 1, 1,
-0.7813854, 0.09835014, -2.430999, 1, 1, 1, 1, 1,
-0.7783932, 0.9161597, -0.9498191, 1, 1, 1, 1, 1,
-0.7764564, 0.6947051, 0.9863953, 1, 1, 1, 1, 1,
-0.7739289, -1.426371, -2.590712, 1, 1, 1, 1, 1,
-0.7737461, 0.4916869, -1.109289, 1, 1, 1, 1, 1,
-0.7680626, -0.651891, -1.635861, 1, 1, 1, 1, 1,
-0.7680064, -0.2807809, -0.927752, 1, 1, 1, 1, 1,
-0.7676412, 0.6775326, -0.8763311, 0, 0, 1, 1, 1,
-0.7635599, 1.011699, -2.083782, 1, 0, 0, 1, 1,
-0.7536809, -0.4097109, -1.266004, 1, 0, 0, 1, 1,
-0.7534313, 0.2373553, -1.797102, 1, 0, 0, 1, 1,
-0.736851, -1.017483, -1.870994, 1, 0, 0, 1, 1,
-0.7281564, -0.1262601, -3.658617, 1, 0, 0, 1, 1,
-0.7278164, -1.85206, -3.195623, 0, 0, 0, 1, 1,
-0.727254, 1.15862, -1.989018, 0, 0, 0, 1, 1,
-0.7264208, 0.2289326, -0.5880823, 0, 0, 0, 1, 1,
-0.7257677, -0.7728935, -3.825604, 0, 0, 0, 1, 1,
-0.7212338, -0.6588035, -1.477799, 0, 0, 0, 1, 1,
-0.7190397, 0.4485479, -0.2889325, 0, 0, 0, 1, 1,
-0.717195, -0.5032407, -3.269159, 0, 0, 0, 1, 1,
-0.7134663, -1.642271, -2.208097, 1, 1, 1, 1, 1,
-0.7119939, 2.277003, -1.37415, 1, 1, 1, 1, 1,
-0.7105463, -0.01789485, -1.879889, 1, 1, 1, 1, 1,
-0.7096258, 0.4347403, -0.05511308, 1, 1, 1, 1, 1,
-0.7076553, -0.03622585, -2.957367, 1, 1, 1, 1, 1,
-0.7075441, -0.4298428, -2.48147, 1, 1, 1, 1, 1,
-0.7051992, 1.31394, 0.4058523, 1, 1, 1, 1, 1,
-0.701398, 1.685776, -0.5287852, 1, 1, 1, 1, 1,
-0.694606, 1.012861, -1.000563, 1, 1, 1, 1, 1,
-0.6808703, -0.4237431, -0.8701015, 1, 1, 1, 1, 1,
-0.6732023, 1.234504, -0.003304745, 1, 1, 1, 1, 1,
-0.672738, -1.318624, -1.76595, 1, 1, 1, 1, 1,
-0.6653787, -0.4343818, -1.020187, 1, 1, 1, 1, 1,
-0.6647716, 0.1607852, -0.4027247, 1, 1, 1, 1, 1,
-0.6647159, 0.4790215, -2.517993, 1, 1, 1, 1, 1,
-0.662389, 0.307885, -0.8375037, 0, 0, 1, 1, 1,
-0.661339, 0.1477003, -1.046219, 1, 0, 0, 1, 1,
-0.6579672, -0.3024364, -1.218452, 1, 0, 0, 1, 1,
-0.6573038, -1.003414, -3.888374, 1, 0, 0, 1, 1,
-0.6545244, -0.1998517, -4.17738, 1, 0, 0, 1, 1,
-0.6468706, 0.1226978, -1.823494, 1, 0, 0, 1, 1,
-0.6365988, 1.496757, -1.418007, 0, 0, 0, 1, 1,
-0.6304218, -0.5604152, -2.086829, 0, 0, 0, 1, 1,
-0.6302634, -1.598143, -2.123754, 0, 0, 0, 1, 1,
-0.6222441, 0.07107633, -2.236465, 0, 0, 0, 1, 1,
-0.6205126, -0.5736352, -1.995275, 0, 0, 0, 1, 1,
-0.6179324, 0.9991993, -1.103486, 0, 0, 0, 1, 1,
-0.6161632, 1.725759, -0.6245078, 0, 0, 0, 1, 1,
-0.6089789, 0.8342426, -1.713675, 1, 1, 1, 1, 1,
-0.6060847, -0.35839, -1.198945, 1, 1, 1, 1, 1,
-0.5942367, -0.8690103, -3.939358, 1, 1, 1, 1, 1,
-0.5931033, 0.8316088, 0.06730074, 1, 1, 1, 1, 1,
-0.5923227, -1.297198, -3.667737, 1, 1, 1, 1, 1,
-0.5919995, -1.114353, -3.371466, 1, 1, 1, 1, 1,
-0.5909121, 0.195123, -0.9856449, 1, 1, 1, 1, 1,
-0.5892926, 0.0002232548, -2.814717, 1, 1, 1, 1, 1,
-0.5863248, -0.607636, -2.762368, 1, 1, 1, 1, 1,
-0.5837756, 0.568686, -1.224777, 1, 1, 1, 1, 1,
-0.5791841, 1.596678, -1.594059, 1, 1, 1, 1, 1,
-0.5739862, 0.6504717, -1.648971, 1, 1, 1, 1, 1,
-0.570109, 1.104964, 1.365325, 1, 1, 1, 1, 1,
-0.5666838, 1.10488, -0.8721441, 1, 1, 1, 1, 1,
-0.5662334, -0.4460508, -1.465471, 1, 1, 1, 1, 1,
-0.5660648, 0.9585746, 1.032775, 0, 0, 1, 1, 1,
-0.5607231, 0.4240801, -1.409427, 1, 0, 0, 1, 1,
-0.5591285, 1.268354, 0.09283376, 1, 0, 0, 1, 1,
-0.5547504, 1.001599, 0.1457484, 1, 0, 0, 1, 1,
-0.5481415, 0.1194551, -1.410492, 1, 0, 0, 1, 1,
-0.5467253, 0.2957058, -2.421485, 1, 0, 0, 1, 1,
-0.5449675, 2.02044, -0.2940644, 0, 0, 0, 1, 1,
-0.5395226, -0.1902221, 0.3026775, 0, 0, 0, 1, 1,
-0.5377663, -1.201128, -2.361542, 0, 0, 0, 1, 1,
-0.5353643, 1.289201, -1.646971, 0, 0, 0, 1, 1,
-0.527522, 1.09032, -1.090768, 0, 0, 0, 1, 1,
-0.5234787, 0.3581657, -0.25679, 0, 0, 0, 1, 1,
-0.5222637, -1.987144, -3.791209, 0, 0, 0, 1, 1,
-0.5204251, 1.074947, -2.943858, 1, 1, 1, 1, 1,
-0.5199769, -1.504172, -3.48892, 1, 1, 1, 1, 1,
-0.5147009, -0.08272132, -2.273023, 1, 1, 1, 1, 1,
-0.5053571, 0.119704, -3.875977, 1, 1, 1, 1, 1,
-0.5018533, 0.07650848, -1.415351, 1, 1, 1, 1, 1,
-0.5003484, 0.07201007, -0.6678576, 1, 1, 1, 1, 1,
-0.4996008, 0.3947397, -0.4616403, 1, 1, 1, 1, 1,
-0.4989197, 2.293593, 0.06518127, 1, 1, 1, 1, 1,
-0.4984317, -0.3662057, -2.292975, 1, 1, 1, 1, 1,
-0.4978832, 0.4207106, -0.7329295, 1, 1, 1, 1, 1,
-0.4969417, 0.1950667, -0.9537185, 1, 1, 1, 1, 1,
-0.4940246, 0.813069, 0.1532581, 1, 1, 1, 1, 1,
-0.4921473, -0.06316788, -2.988717, 1, 1, 1, 1, 1,
-0.4903976, -1.206792, -1.998999, 1, 1, 1, 1, 1,
-0.489492, -1.37674, -0.7485796, 1, 1, 1, 1, 1,
-0.4894305, -2.446214, -4.523666, 0, 0, 1, 1, 1,
-0.4885752, 0.4829637, 0.6078949, 1, 0, 0, 1, 1,
-0.4870091, 0.7163972, 1.458594, 1, 0, 0, 1, 1,
-0.4864049, 1.868338, 1.564142, 1, 0, 0, 1, 1,
-0.4861079, 0.2508379, -0.9587232, 1, 0, 0, 1, 1,
-0.4838001, -0.8452807, -2.410122, 1, 0, 0, 1, 1,
-0.4835255, -1.254077, -4.304626, 0, 0, 0, 1, 1,
-0.4831903, 1.043172, -2.468866, 0, 0, 0, 1, 1,
-0.4798272, 0.7307373, -1.771783, 0, 0, 0, 1, 1,
-0.4778154, 0.5212612, -0.06726315, 0, 0, 0, 1, 1,
-0.4775256, 0.9540353, -0.8941199, 0, 0, 0, 1, 1,
-0.4742847, -0.2106388, -1.086052, 0, 0, 0, 1, 1,
-0.4718758, -1.296419, -2.43697, 0, 0, 0, 1, 1,
-0.4712506, 0.5177609, 0.1822706, 1, 1, 1, 1, 1,
-0.468095, 0.02795367, -0.9237287, 1, 1, 1, 1, 1,
-0.4663676, 0.4286453, -0.3176456, 1, 1, 1, 1, 1,
-0.4651619, 0.5206977, -3.533074, 1, 1, 1, 1, 1,
-0.4624118, 0.2611536, -1.000836, 1, 1, 1, 1, 1,
-0.4593444, -0.7038952, -3.790164, 1, 1, 1, 1, 1,
-0.4586046, 2.384149, -1.018768, 1, 1, 1, 1, 1,
-0.4582877, 1.220899, -0.001050716, 1, 1, 1, 1, 1,
-0.458279, -0.3762079, -2.775492, 1, 1, 1, 1, 1,
-0.4529245, -0.3545174, -0.6164379, 1, 1, 1, 1, 1,
-0.4506373, 0.04623402, -1.846889, 1, 1, 1, 1, 1,
-0.4473114, -0.1125083, -1.511131, 1, 1, 1, 1, 1,
-0.4416083, -0.07676058, -0.8324823, 1, 1, 1, 1, 1,
-0.4408764, -0.6915845, -3.190102, 1, 1, 1, 1, 1,
-0.4332403, -0.2178099, -2.833541, 1, 1, 1, 1, 1,
-0.4318823, -0.6306682, -3.882053, 0, 0, 1, 1, 1,
-0.4273567, -0.8832684, -1.222957, 1, 0, 0, 1, 1,
-0.4250243, -1.182429, -2.28684, 1, 0, 0, 1, 1,
-0.4242229, 1.267302, 1.445, 1, 0, 0, 1, 1,
-0.4224921, -0.4546866, -2.191778, 1, 0, 0, 1, 1,
-0.416381, -0.8260653, -3.607097, 1, 0, 0, 1, 1,
-0.4150449, 0.1699079, -1.235746, 0, 0, 0, 1, 1,
-0.4149063, 0.1923108, -1.065241, 0, 0, 0, 1, 1,
-0.4142504, -0.3248397, -1.434224, 0, 0, 0, 1, 1,
-0.4083516, 1.258681, -1.44473, 0, 0, 0, 1, 1,
-0.4065499, -1.370169, -1.951301, 0, 0, 0, 1, 1,
-0.4014868, 0.4514699, 0.4230519, 0, 0, 0, 1, 1,
-0.398327, 0.5351787, -1.157609, 0, 0, 0, 1, 1,
-0.393651, -0.3219008, -2.188644, 1, 1, 1, 1, 1,
-0.3934038, -0.4286085, -3.283958, 1, 1, 1, 1, 1,
-0.392273, -0.9924208, -2.144991, 1, 1, 1, 1, 1,
-0.3911914, -0.3366173, -2.870895, 1, 1, 1, 1, 1,
-0.3849046, -0.4991864, -1.787157, 1, 1, 1, 1, 1,
-0.3843739, -1.357039, -2.990826, 1, 1, 1, 1, 1,
-0.3793673, 0.966985, 0.6800981, 1, 1, 1, 1, 1,
-0.3780392, -0.1204958, -2.020412, 1, 1, 1, 1, 1,
-0.3771577, 1.790488, -2.050073, 1, 1, 1, 1, 1,
-0.3758871, 1.205723, 1.351579, 1, 1, 1, 1, 1,
-0.3710777, -0.8759338, -1.790453, 1, 1, 1, 1, 1,
-0.3648067, -1.223916, -3.587567, 1, 1, 1, 1, 1,
-0.3646355, 0.8390601, 0.9587776, 1, 1, 1, 1, 1,
-0.359808, 0.9224331, -0.8044662, 1, 1, 1, 1, 1,
-0.3590434, -0.2248147, -1.926062, 1, 1, 1, 1, 1,
-0.354334, 0.6715054, -1.317896, 0, 0, 1, 1, 1,
-0.3505264, 1.455294, -3.36728, 1, 0, 0, 1, 1,
-0.3497678, 0.8262841, 0.0630254, 1, 0, 0, 1, 1,
-0.3435452, -2.504065, -3.047241, 1, 0, 0, 1, 1,
-0.3381498, -0.3079316, -2.157102, 1, 0, 0, 1, 1,
-0.3379003, -0.391281, -2.047863, 1, 0, 0, 1, 1,
-0.3347615, 1.087719, 0.7141356, 0, 0, 0, 1, 1,
-0.3338961, -0.2140277, -3.003604, 0, 0, 0, 1, 1,
-0.3319225, -1.303808, -4.608012, 0, 0, 0, 1, 1,
-0.3299899, 0.7375454, -2.079704, 0, 0, 0, 1, 1,
-0.3298267, 0.5179109, 0.225942, 0, 0, 0, 1, 1,
-0.3274828, 0.6071067, -1.058639, 0, 0, 0, 1, 1,
-0.3198745, 1.412242, -1.728322, 0, 0, 0, 1, 1,
-0.318109, -1.61731, -2.828178, 1, 1, 1, 1, 1,
-0.317137, 0.2588818, -2.609883, 1, 1, 1, 1, 1,
-0.3170113, 0.1933063, -0.9058455, 1, 1, 1, 1, 1,
-0.316574, -0.1004329, -1.38677, 1, 1, 1, 1, 1,
-0.3087658, 1.138941, -0.6261822, 1, 1, 1, 1, 1,
-0.3052737, -2.60544, -2.809518, 1, 1, 1, 1, 1,
-0.3050327, -0.80489, -2.693867, 1, 1, 1, 1, 1,
-0.3025503, 1.152028, -1.777631, 1, 1, 1, 1, 1,
-0.3025008, -1.819154, -0.9376262, 1, 1, 1, 1, 1,
-0.3020571, 0.1033786, -3.650745, 1, 1, 1, 1, 1,
-0.3010914, 0.07516224, -2.355591, 1, 1, 1, 1, 1,
-0.2996094, 1.067565, -0.0135122, 1, 1, 1, 1, 1,
-0.2945812, 0.2315523, -0.8926073, 1, 1, 1, 1, 1,
-0.2919155, 0.7651364, 0.07724058, 1, 1, 1, 1, 1,
-0.2918959, 0.4237312, 0.02841047, 1, 1, 1, 1, 1,
-0.2894383, -0.7505369, -3.628469, 0, 0, 1, 1, 1,
-0.2752551, 1.531574, -1.258785, 1, 0, 0, 1, 1,
-0.2727395, 0.1391134, -0.6984999, 1, 0, 0, 1, 1,
-0.2695006, 0.3273359, -2.710525, 1, 0, 0, 1, 1,
-0.2689448, -0.9554024, -3.049188, 1, 0, 0, 1, 1,
-0.267502, -0.2969883, -1.10759, 1, 0, 0, 1, 1,
-0.2644656, -0.4835247, -2.15785, 0, 0, 0, 1, 1,
-0.2640387, -0.4460622, -2.369552, 0, 0, 0, 1, 1,
-0.2606748, -1.521322, -1.208682, 0, 0, 0, 1, 1,
-0.2568873, 0.5453006, -1.784821, 0, 0, 0, 1, 1,
-0.2556605, 1.357622, -1.531964, 0, 0, 0, 1, 1,
-0.2543642, 1.300173, -0.1637587, 0, 0, 0, 1, 1,
-0.2535592, 0.4660128, -1.146671, 0, 0, 0, 1, 1,
-0.2507202, 0.3686722, 1.171156, 1, 1, 1, 1, 1,
-0.2501493, 1.958778, 0.4179831, 1, 1, 1, 1, 1,
-0.2496802, -1.014741, -2.224627, 1, 1, 1, 1, 1,
-0.2491623, -1.551942, -2.887815, 1, 1, 1, 1, 1,
-0.2476134, -0.1482262, -4.799777, 1, 1, 1, 1, 1,
-0.246452, -0.4457967, -1.48487, 1, 1, 1, 1, 1,
-0.2402741, 0.04707064, -0.207375, 1, 1, 1, 1, 1,
-0.2382005, 1.497172, -1.774393, 1, 1, 1, 1, 1,
-0.2369452, 1.219965, 0.3731011, 1, 1, 1, 1, 1,
-0.2336079, -1.228601, -3.276968, 1, 1, 1, 1, 1,
-0.2300702, 3.014722, 0.1098917, 1, 1, 1, 1, 1,
-0.2291505, 0.007676227, 0.09115376, 1, 1, 1, 1, 1,
-0.2291474, 0.0180226, -1.751052, 1, 1, 1, 1, 1,
-0.2281836, 0.4835573, -0.6693957, 1, 1, 1, 1, 1,
-0.2261207, 0.3614344, -0.6944587, 1, 1, 1, 1, 1,
-0.2254966, 1.045313, 0.5875728, 0, 0, 1, 1, 1,
-0.2238741, -1.480626, -2.737164, 1, 0, 0, 1, 1,
-0.2232724, -0.05810966, -2.618149, 1, 0, 0, 1, 1,
-0.219108, -1.323476, -2.405714, 1, 0, 0, 1, 1,
-0.2172252, 0.1766708, -1.16936, 1, 0, 0, 1, 1,
-0.2172184, 0.1197714, -0.2045635, 1, 0, 0, 1, 1,
-0.2110544, 0.4517955, -0.5185403, 0, 0, 0, 1, 1,
-0.2081419, 0.905899, -1.596451, 0, 0, 0, 1, 1,
-0.2048633, 0.8905134, -1.336812, 0, 0, 0, 1, 1,
-0.2038819, 0.543024, -0.107968, 0, 0, 0, 1, 1,
-0.1974922, 1.449423, 2.503076, 0, 0, 0, 1, 1,
-0.1946661, -0.3732826, -2.520331, 0, 0, 0, 1, 1,
-0.1933362, 0.2076818, 0.6350489, 0, 0, 0, 1, 1,
-0.1925066, 0.4468641, -1.777257, 1, 1, 1, 1, 1,
-0.1871589, 2.095559, -0.4156073, 1, 1, 1, 1, 1,
-0.1857838, 1.656536, -0.2553031, 1, 1, 1, 1, 1,
-0.1856308, -0.5757216, -2.217074, 1, 1, 1, 1, 1,
-0.1854951, 0.6856135, -0.1679658, 1, 1, 1, 1, 1,
-0.1782447, 0.6852417, -0.292269, 1, 1, 1, 1, 1,
-0.177001, 1.624833, 0.4676239, 1, 1, 1, 1, 1,
-0.1718896, -0.8103881, -2.981869, 1, 1, 1, 1, 1,
-0.1697885, -0.2752358, -1.64492, 1, 1, 1, 1, 1,
-0.1693209, 0.4424878, -0.7309428, 1, 1, 1, 1, 1,
-0.1667172, -0.7563501, -3.283116, 1, 1, 1, 1, 1,
-0.1608823, -0.6475436, -1.4847, 1, 1, 1, 1, 1,
-0.1603713, 0.4696792, -0.5788587, 1, 1, 1, 1, 1,
-0.1592544, -1.297143, -0.5261056, 1, 1, 1, 1, 1,
-0.1505105, -0.6102518, -3.131827, 1, 1, 1, 1, 1,
-0.1483565, 0.4219725, -1.165925, 0, 0, 1, 1, 1,
-0.1465079, 1.239699, -1.684453, 1, 0, 0, 1, 1,
-0.1443962, -2.798103, -3.261026, 1, 0, 0, 1, 1,
-0.1424286, 0.1647819, 0.533891, 1, 0, 0, 1, 1,
-0.1416653, -1.164473, -4.17186, 1, 0, 0, 1, 1,
-0.1379353, 1.478498, 0.7029745, 1, 0, 0, 1, 1,
-0.1370128, -0.388229, -5.23688, 0, 0, 0, 1, 1,
-0.1322214, 0.5519158, 0.9638947, 0, 0, 0, 1, 1,
-0.1318588, 1.540052, -0.9000177, 0, 0, 0, 1, 1,
-0.1306063, 2.033082, -0.668597, 0, 0, 0, 1, 1,
-0.1296804, 0.3082539, -0.4783393, 0, 0, 0, 1, 1,
-0.1272064, -1.473305, -4.516257, 0, 0, 0, 1, 1,
-0.1256125, -0.54772, -0.4795979, 0, 0, 0, 1, 1,
-0.122954, 0.6125166, -0.3002748, 1, 1, 1, 1, 1,
-0.1199489, -0.1681319, -2.790537, 1, 1, 1, 1, 1,
-0.1195461, -0.464701, -2.56404, 1, 1, 1, 1, 1,
-0.1096713, 0.6808143, -2.17807, 1, 1, 1, 1, 1,
-0.108626, -0.1106925, -3.155167, 1, 1, 1, 1, 1,
-0.106815, -0.8610933, -2.941694, 1, 1, 1, 1, 1,
-0.1052515, -0.6829312, -1.535754, 1, 1, 1, 1, 1,
-0.09983818, 1.931633, -0.8735227, 1, 1, 1, 1, 1,
-0.09979395, -0.09105193, 0.1624753, 1, 1, 1, 1, 1,
-0.09862143, -0.1183932, -2.007185, 1, 1, 1, 1, 1,
-0.09500875, -0.9064534, -3.454751, 1, 1, 1, 1, 1,
-0.09144181, 0.02621621, 0.2683789, 1, 1, 1, 1, 1,
-0.08984222, 1.086971, -1.393645, 1, 1, 1, 1, 1,
-0.08852716, 0.7358655, -1.092389, 1, 1, 1, 1, 1,
-0.08255085, -0.2109003, -2.172345, 1, 1, 1, 1, 1,
-0.08234708, 0.001649697, -1.107845, 0, 0, 1, 1, 1,
-0.07316999, -1.287781, -3.826255, 1, 0, 0, 1, 1,
-0.07119332, -1.349707, -2.603091, 1, 0, 0, 1, 1,
-0.06806067, -1.179891, -2.96051, 1, 0, 0, 1, 1,
-0.06801198, -0.3698431, -3.550973, 1, 0, 0, 1, 1,
-0.06455676, 0.05052885, -0.3487738, 1, 0, 0, 1, 1,
-0.06246614, -1.284168, -3.77142, 0, 0, 0, 1, 1,
-0.06100876, -0.3832568, -2.974561, 0, 0, 0, 1, 1,
-0.0601432, 0.7654271, 1.144939, 0, 0, 0, 1, 1,
-0.05870015, -0.1949224, -2.491782, 0, 0, 0, 1, 1,
-0.05494421, -0.2744593, -1.99894, 0, 0, 0, 1, 1,
-0.05307987, 0.7761936, 0.3078403, 0, 0, 0, 1, 1,
-0.04350766, 0.1960061, -1.195623, 0, 0, 0, 1, 1,
-0.04320422, -1.155087, -2.46003, 1, 1, 1, 1, 1,
-0.04285067, -0.03761655, -2.063002, 1, 1, 1, 1, 1,
-0.04139316, 1.907169, 0.8160177, 1, 1, 1, 1, 1,
-0.04065759, 0.6656396, 0.3486128, 1, 1, 1, 1, 1,
-0.04048795, 1.787751, -2.36955, 1, 1, 1, 1, 1,
-0.03200128, -0.9610556, -3.784327, 1, 1, 1, 1, 1,
-0.03188111, 1.162386, 1.018378, 1, 1, 1, 1, 1,
-0.03115887, 0.5272668, -0.7693331, 1, 1, 1, 1, 1,
-0.02907448, 0.2788754, -0.6039286, 1, 1, 1, 1, 1,
-0.02630137, 0.6647397, -0.0179284, 1, 1, 1, 1, 1,
-0.02627816, -0.6803516, -1.611352, 1, 1, 1, 1, 1,
-0.02269934, -0.511995, -1.466641, 1, 1, 1, 1, 1,
-0.01872576, -0.3806477, -2.907461, 1, 1, 1, 1, 1,
-0.01609378, -0.6924198, -3.051967, 1, 1, 1, 1, 1,
-0.01561515, -1.026566, -2.239663, 1, 1, 1, 1, 1,
-0.01481004, 0.4692412, 0.2118112, 0, 0, 1, 1, 1,
-0.0116348, -0.4541408, -2.573187, 1, 0, 0, 1, 1,
-0.009418301, -0.161391, -4.206223, 1, 0, 0, 1, 1,
-0.007799896, 0.07125695, 0.966811, 1, 0, 0, 1, 1,
-0.002451747, -1.328283, -1.675588, 1, 0, 0, 1, 1,
-2.666446e-05, 0.3596838, 0.1801464, 1, 0, 0, 1, 1,
0.003073287, 0.8720847, -0.08184913, 0, 0, 0, 1, 1,
0.003596068, -0.1293506, 3.995752, 0, 0, 0, 1, 1,
0.004851286, 1.97534, -0.5791674, 0, 0, 0, 1, 1,
0.01284907, -0.6041063, 3.631256, 0, 0, 0, 1, 1,
0.01388287, -0.08464085, 2.202031, 0, 0, 0, 1, 1,
0.01468042, -0.7333181, 2.856806, 0, 0, 0, 1, 1,
0.01877847, -0.8028734, 2.009114, 0, 0, 0, 1, 1,
0.01910976, 0.2807028, 1.617094, 1, 1, 1, 1, 1,
0.01970189, 0.4151421, 1.393521, 1, 1, 1, 1, 1,
0.02577617, -0.1468669, 3.280513, 1, 1, 1, 1, 1,
0.03469099, 0.7699072, -0.7628899, 1, 1, 1, 1, 1,
0.03469197, 0.9299411, -1.457645, 1, 1, 1, 1, 1,
0.03588145, -0.2616245, 3.476168, 1, 1, 1, 1, 1,
0.04485815, 0.3089058, -0.3765366, 1, 1, 1, 1, 1,
0.04776509, 1.120374, 0.1428271, 1, 1, 1, 1, 1,
0.05158193, -0.2006572, 2.394213, 1, 1, 1, 1, 1,
0.05332293, -1.155944, 2.12018, 1, 1, 1, 1, 1,
0.05950428, -0.6569635, 3.112862, 1, 1, 1, 1, 1,
0.0648772, 0.1870217, 2.20352, 1, 1, 1, 1, 1,
0.07546683, -1.000556, 5.548723, 1, 1, 1, 1, 1,
0.08148602, 0.1490409, 1.697112, 1, 1, 1, 1, 1,
0.0825885, -1.090369, 5.046743, 1, 1, 1, 1, 1,
0.0852534, 0.09630028, 1.267201, 0, 0, 1, 1, 1,
0.08626069, -1.627474, 3.104042, 1, 0, 0, 1, 1,
0.08634773, 0.2748466, 0.02816981, 1, 0, 0, 1, 1,
0.09847215, -0.2487482, 3.561695, 1, 0, 0, 1, 1,
0.09897677, -0.4839405, 2.685459, 1, 0, 0, 1, 1,
0.1043549, -0.3234012, 4.293726, 1, 0, 0, 1, 1,
0.1047547, 0.8204529, 2.244091, 0, 0, 0, 1, 1,
0.1120212, -0.2900006, 2.267309, 0, 0, 0, 1, 1,
0.1131679, -0.5255897, 4.612548, 0, 0, 0, 1, 1,
0.1133662, -0.04054311, 1.332951, 0, 0, 0, 1, 1,
0.115839, -0.06730713, 1.964953, 0, 0, 0, 1, 1,
0.1227499, 0.9267239, -0.1481873, 0, 0, 0, 1, 1,
0.1272161, -0.3301841, 2.922176, 0, 0, 0, 1, 1,
0.1276857, 0.009825762, 1.272014, 1, 1, 1, 1, 1,
0.1282039, -1.419485, 4.173196, 1, 1, 1, 1, 1,
0.1285005, -0.335133, 2.564741, 1, 1, 1, 1, 1,
0.1290649, -1.812685, 1.421652, 1, 1, 1, 1, 1,
0.1310447, -0.4922071, 3.121035, 1, 1, 1, 1, 1,
0.1323495, 1.996018, -0.2937746, 1, 1, 1, 1, 1,
0.1340842, -0.3768188, 3.916416, 1, 1, 1, 1, 1,
0.1351445, 0.7367684, 0.5810065, 1, 1, 1, 1, 1,
0.1386756, -0.8281384, 2.724912, 1, 1, 1, 1, 1,
0.1399897, 0.5914699, -0.2898673, 1, 1, 1, 1, 1,
0.1438213, -1.012558, 2.908435, 1, 1, 1, 1, 1,
0.1441088, 3.609622, -0.6347497, 1, 1, 1, 1, 1,
0.1450806, -0.1822243, 3.475845, 1, 1, 1, 1, 1,
0.1464461, -0.3876738, 3.506276, 1, 1, 1, 1, 1,
0.1546497, -0.1369941, 2.30305, 1, 1, 1, 1, 1,
0.1587074, -1.81142, 2.754924, 0, 0, 1, 1, 1,
0.159236, -3.368347, 3.757714, 1, 0, 0, 1, 1,
0.1608743, 0.4892877, -0.7749131, 1, 0, 0, 1, 1,
0.1623452, 2.607987, -0.1173646, 1, 0, 0, 1, 1,
0.1643514, 1.460877, -0.1470341, 1, 0, 0, 1, 1,
0.1681998, 0.7524773, 0.8953317, 1, 0, 0, 1, 1,
0.1692445, 0.7777423, 1.321828, 0, 0, 0, 1, 1,
0.1702168, 0.5189157, -1.188814, 0, 0, 0, 1, 1,
0.1739134, 2.300629, 0.7584854, 0, 0, 0, 1, 1,
0.1770291, -0.09541925, 0.1627927, 0, 0, 0, 1, 1,
0.1782826, -0.03986062, 0.9434789, 0, 0, 0, 1, 1,
0.1841144, -0.6566405, 1.744589, 0, 0, 0, 1, 1,
0.1857911, -1.005902, 2.256199, 0, 0, 0, 1, 1,
0.189612, 0.5503491, -0.2932193, 1, 1, 1, 1, 1,
0.1912625, -2.146169, 4.139493, 1, 1, 1, 1, 1,
0.1923589, -0.5680379, 4.483888, 1, 1, 1, 1, 1,
0.1930446, -0.8681412, 3.197212, 1, 1, 1, 1, 1,
0.1940265, 0.5694647, -0.1441722, 1, 1, 1, 1, 1,
0.1945846, -0.9399626, 3.248184, 1, 1, 1, 1, 1,
0.1986896, -1.746713, 3.936558, 1, 1, 1, 1, 1,
0.2008694, 0.281505, 0.9053915, 1, 1, 1, 1, 1,
0.2031392, 1.807129, -0.7076142, 1, 1, 1, 1, 1,
0.2106127, 0.4942203, 1.946967, 1, 1, 1, 1, 1,
0.2133034, -0.5011016, 2.549824, 1, 1, 1, 1, 1,
0.2148831, 0.3438967, 0.3933346, 1, 1, 1, 1, 1,
0.2225264, 0.09254711, 0.3016072, 1, 1, 1, 1, 1,
0.2283115, -1.565481, 3.841526, 1, 1, 1, 1, 1,
0.2284237, 0.3115845, 1.346184, 1, 1, 1, 1, 1,
0.2302548, -0.1103933, 0.6737794, 0, 0, 1, 1, 1,
0.2336245, 1.519389, 0.6515641, 1, 0, 0, 1, 1,
0.2350213, 0.09899668, 0.6797693, 1, 0, 0, 1, 1,
0.2378829, -1.774254, 2.849673, 1, 0, 0, 1, 1,
0.2392584, 0.665969, 0.733978, 1, 0, 0, 1, 1,
0.2401571, -0.8771955, 1.497582, 1, 0, 0, 1, 1,
0.2424935, -0.3439564, 3.863788, 0, 0, 0, 1, 1,
0.2524925, 0.4699052, 1.393545, 0, 0, 0, 1, 1,
0.2609665, 1.085859, 0.3678352, 0, 0, 0, 1, 1,
0.2615501, 0.3154602, 0.5591319, 0, 0, 0, 1, 1,
0.2633474, 0.28571, 0.559433, 0, 0, 0, 1, 1,
0.2636227, 1.45264, 0.7275416, 0, 0, 0, 1, 1,
0.2637619, -0.7407456, 2.553277, 0, 0, 0, 1, 1,
0.2650911, -1.486615, 2.905711, 1, 1, 1, 1, 1,
0.2686001, 1.184902, -0.02494203, 1, 1, 1, 1, 1,
0.2693346, 0.6797113, 1.678122, 1, 1, 1, 1, 1,
0.2738901, -1.303462, 2.074356, 1, 1, 1, 1, 1,
0.2787774, 0.4755781, 1.531109, 1, 1, 1, 1, 1,
0.2861803, -0.8283108, 3.371478, 1, 1, 1, 1, 1,
0.286261, -0.3151053, 2.874748, 1, 1, 1, 1, 1,
0.2874826, 0.3381966, -0.1825224, 1, 1, 1, 1, 1,
0.288278, 0.6204684, -2.096163, 1, 1, 1, 1, 1,
0.2894416, -0.9751889, 1.453927, 1, 1, 1, 1, 1,
0.2936851, 1.837419, -0.8676673, 1, 1, 1, 1, 1,
0.294575, 0.3135505, 0.1469046, 1, 1, 1, 1, 1,
0.294937, -1.196862, 4.741011, 1, 1, 1, 1, 1,
0.3001794, 2.387201, -0.1005373, 1, 1, 1, 1, 1,
0.3013795, 0.1653876, 0.8097954, 1, 1, 1, 1, 1,
0.3036038, -0.9231235, 2.535372, 0, 0, 1, 1, 1,
0.3063225, 0.9016667, 1.100241, 1, 0, 0, 1, 1,
0.3073294, 0.293615, -0.7369116, 1, 0, 0, 1, 1,
0.3077033, -0.7276176, 1.908146, 1, 0, 0, 1, 1,
0.3109502, 1.328475, 2.116823, 1, 0, 0, 1, 1,
0.3121367, -0.300646, 1.327723, 1, 0, 0, 1, 1,
0.3150758, -1.466679, 4.187219, 0, 0, 0, 1, 1,
0.3194582, -0.3417538, 3.799585, 0, 0, 0, 1, 1,
0.3206201, 0.2801041, -0.4957596, 0, 0, 0, 1, 1,
0.3258066, -0.3098408, 3.500823, 0, 0, 0, 1, 1,
0.3372386, -1.345383, 5.254245, 0, 0, 0, 1, 1,
0.3405378, -1.772753, 3.425761, 0, 0, 0, 1, 1,
0.3406864, 1.797248, 1.456724, 0, 0, 0, 1, 1,
0.3462653, 0.7609082, -2.081116, 1, 1, 1, 1, 1,
0.3502238, 0.1388486, 0.959085, 1, 1, 1, 1, 1,
0.3528539, 0.7373458, 1.194275, 1, 1, 1, 1, 1,
0.3534347, -0.9324605, 2.450448, 1, 1, 1, 1, 1,
0.354336, -0.9051902, 1.874615, 1, 1, 1, 1, 1,
0.3574067, 0.1114811, 1.476228, 1, 1, 1, 1, 1,
0.3576027, -0.6002727, 0.54488, 1, 1, 1, 1, 1,
0.3599346, 1.509815, 1.545984, 1, 1, 1, 1, 1,
0.3624512, 0.1020565, -0.1792274, 1, 1, 1, 1, 1,
0.3627048, -0.852806, 1.493572, 1, 1, 1, 1, 1,
0.3677408, -0.5103425, 2.62879, 1, 1, 1, 1, 1,
0.3680988, 0.2645933, 0.2905106, 1, 1, 1, 1, 1,
0.3714865, -2.597155, 2.702862, 1, 1, 1, 1, 1,
0.3741512, -0.2956974, 3.834486, 1, 1, 1, 1, 1,
0.375609, -1.36126, 2.870166, 1, 1, 1, 1, 1,
0.3772931, 0.7497463, 2.422758, 0, 0, 1, 1, 1,
0.378361, 0.81313, 1.312924, 1, 0, 0, 1, 1,
0.3787312, -0.8405792, 3.617094, 1, 0, 0, 1, 1,
0.379909, 0.8750325, 1.555979, 1, 0, 0, 1, 1,
0.3799102, -0.8638151, 1.608818, 1, 0, 0, 1, 1,
0.3823372, 1.035903, -0.244102, 1, 0, 0, 1, 1,
0.3847716, 0.4482862, 2.225134, 0, 0, 0, 1, 1,
0.3852242, 0.3836981, 1.113996, 0, 0, 0, 1, 1,
0.38575, -0.3909107, 3.259744, 0, 0, 0, 1, 1,
0.3906363, -0.08782607, 1.608743, 0, 0, 0, 1, 1,
0.3935232, -0.8458099, 1.459636, 0, 0, 0, 1, 1,
0.3939976, 1.133271, -0.4473163, 0, 0, 0, 1, 1,
0.3939977, 0.1104273, 0.5209017, 0, 0, 0, 1, 1,
0.3999974, 0.09754648, 2.045666, 1, 1, 1, 1, 1,
0.4032018, -0.2270185, 3.504515, 1, 1, 1, 1, 1,
0.4057349, -0.9009572, 3.978554, 1, 1, 1, 1, 1,
0.4100198, -0.1515583, 1.486543, 1, 1, 1, 1, 1,
0.4101365, 1.76376, 0.4181491, 1, 1, 1, 1, 1,
0.4145505, 1.481339, 1.228366, 1, 1, 1, 1, 1,
0.4163734, 0.9972499, 1.032031, 1, 1, 1, 1, 1,
0.4188395, -0.1407264, 1.436621, 1, 1, 1, 1, 1,
0.4221391, -0.01283287, -0.06954014, 1, 1, 1, 1, 1,
0.4256328, -0.508778, 2.724602, 1, 1, 1, 1, 1,
0.4259525, -0.4383707, 3.04088, 1, 1, 1, 1, 1,
0.4272355, 0.3009366, 1.610978, 1, 1, 1, 1, 1,
0.4305432, 1.141142, 1.604956, 1, 1, 1, 1, 1,
0.4352461, -1.226061, 2.952262, 1, 1, 1, 1, 1,
0.4383189, -0.8168671, 2.744311, 1, 1, 1, 1, 1,
0.4489425, 0.2123052, 0.9969119, 0, 0, 1, 1, 1,
0.4497359, -0.949354, 4.608127, 1, 0, 0, 1, 1,
0.4501292, 0.655705, 1.047575, 1, 0, 0, 1, 1,
0.4502095, 0.4820402, 2.66944, 1, 0, 0, 1, 1,
0.4567643, 0.1242588, -0.4513429, 1, 0, 0, 1, 1,
0.4584735, -0.3101898, 1.676974, 1, 0, 0, 1, 1,
0.4587167, 0.586549, 0.1726466, 0, 0, 0, 1, 1,
0.4600673, -0.2350386, 1.893212, 0, 0, 0, 1, 1,
0.4604573, -0.3845665, 2.8797, 0, 0, 0, 1, 1,
0.4610987, 0.7356843, 3.151056, 0, 0, 0, 1, 1,
0.4611277, -0.4584987, 3.720097, 0, 0, 0, 1, 1,
0.4615788, -1.843662, 3.39387, 0, 0, 0, 1, 1,
0.4650946, -1.421052, 3.641461, 0, 0, 0, 1, 1,
0.465508, -1.280189, 2.592512, 1, 1, 1, 1, 1,
0.466237, 0.9833249, 1.098993, 1, 1, 1, 1, 1,
0.468233, 1.192901, 1.308198, 1, 1, 1, 1, 1,
0.47032, 0.7296386, 1.823379, 1, 1, 1, 1, 1,
0.4734942, 0.760492, 0.8620843, 1, 1, 1, 1, 1,
0.4736186, 2.281508, 0.9511965, 1, 1, 1, 1, 1,
0.4742259, -0.5152993, 3.30953, 1, 1, 1, 1, 1,
0.4743058, 1.559644, 1.105855, 1, 1, 1, 1, 1,
0.4751675, -1.059109, 2.04814, 1, 1, 1, 1, 1,
0.47697, 0.7320827, -0.01282143, 1, 1, 1, 1, 1,
0.4798265, -0.9619085, 1.948258, 1, 1, 1, 1, 1,
0.4813263, -1.656251, 4.039219, 1, 1, 1, 1, 1,
0.4843524, 1.416073, 1.577529, 1, 1, 1, 1, 1,
0.4843694, -1.338477, 2.055914, 1, 1, 1, 1, 1,
0.4853825, -0.008197389, 0.8504092, 1, 1, 1, 1, 1,
0.4903063, -0.9686549, 2.952595, 0, 0, 1, 1, 1,
0.5007728, -0.4551087, 3.256565, 1, 0, 0, 1, 1,
0.5007852, -0.03862324, 0.6274812, 1, 0, 0, 1, 1,
0.5030923, -1.128313, 2.444783, 1, 0, 0, 1, 1,
0.5038972, -0.6417598, 2.829443, 1, 0, 0, 1, 1,
0.5039787, -0.355684, 1.802674, 1, 0, 0, 1, 1,
0.5061753, 0.007480813, 1.111534, 0, 0, 0, 1, 1,
0.5110102, 1.428857, 1.100366, 0, 0, 0, 1, 1,
0.5192395, -0.2451304, 0.5460624, 0, 0, 0, 1, 1,
0.5218191, -0.7780283, 0.5552214, 0, 0, 0, 1, 1,
0.525079, 0.8266095, 0.455153, 0, 0, 0, 1, 1,
0.5262123, 2.585729, -1.38339, 0, 0, 0, 1, 1,
0.5262837, -0.1104422, 0.03194781, 0, 0, 0, 1, 1,
0.5263991, 2.758969, -0.07107383, 1, 1, 1, 1, 1,
0.5286205, -1.472535, 2.879649, 1, 1, 1, 1, 1,
0.5326075, -1.162562, 2.645349, 1, 1, 1, 1, 1,
0.5363628, -0.2697745, 0.2526215, 1, 1, 1, 1, 1,
0.5460262, 0.8139021, 1.421428, 1, 1, 1, 1, 1,
0.5479573, 0.6744627, -0.626725, 1, 1, 1, 1, 1,
0.5479721, -1.691482, 4.706594, 1, 1, 1, 1, 1,
0.5514143, 0.2585334, 1.534567, 1, 1, 1, 1, 1,
0.5519481, 0.02503745, 3.003434, 1, 1, 1, 1, 1,
0.5535347, 1.70233, 0.746799, 1, 1, 1, 1, 1,
0.5615922, 0.3885813, 2.268309, 1, 1, 1, 1, 1,
0.5630703, -0.1371427, 2.039956, 1, 1, 1, 1, 1,
0.5682494, -0.07609779, 1.693684, 1, 1, 1, 1, 1,
0.5695428, 0.08470405, 2.63695, 1, 1, 1, 1, 1,
0.5785965, 1.597789, -0.3636362, 1, 1, 1, 1, 1,
0.5791794, 1.582698, 1.176399, 0, 0, 1, 1, 1,
0.5796759, -1.807085, 2.94276, 1, 0, 0, 1, 1,
0.5806424, 1.259748, 0.4850385, 1, 0, 0, 1, 1,
0.5905543, 0.7648277, -0.6731296, 1, 0, 0, 1, 1,
0.5939305, -0.2724388, 2.01372, 1, 0, 0, 1, 1,
0.594722, 0.09572814, -0.2375048, 1, 0, 0, 1, 1,
0.5951819, 0.4088023, 3.505915, 0, 0, 0, 1, 1,
0.5986306, 0.8373785, 0.8791817, 0, 0, 0, 1, 1,
0.6025602, 0.3131208, 0.8602382, 0, 0, 0, 1, 1,
0.6090509, 0.339321, 2.345511, 0, 0, 0, 1, 1,
0.6105483, 0.2591269, 1.196711, 0, 0, 0, 1, 1,
0.611832, -0.3237187, 1.762515, 0, 0, 0, 1, 1,
0.6141043, -0.6710678, 1.685184, 0, 0, 0, 1, 1,
0.6142544, -0.03245, 2.808469, 1, 1, 1, 1, 1,
0.6172963, 0.2898574, 0.4444841, 1, 1, 1, 1, 1,
0.6244381, -0.8311892, 0.19294, 1, 1, 1, 1, 1,
0.6262025, 2.0463, 1.02015, 1, 1, 1, 1, 1,
0.6281935, -0.9411443, 2.489759, 1, 1, 1, 1, 1,
0.6287625, -0.2337526, 2.289542, 1, 1, 1, 1, 1,
0.6302955, 0.3774297, 1.041861, 1, 1, 1, 1, 1,
0.6324971, 1.537089, 0.1021095, 1, 1, 1, 1, 1,
0.6411989, -0.6961138, 2.248581, 1, 1, 1, 1, 1,
0.650746, -0.07178992, 2.166345, 1, 1, 1, 1, 1,
0.6507603, -0.3332438, 0.3232805, 1, 1, 1, 1, 1,
0.6510669, 0.9812188, -1.229677, 1, 1, 1, 1, 1,
0.6572011, -1.18708, 3.647746, 1, 1, 1, 1, 1,
0.6573688, 1.586697, 0.8475618, 1, 1, 1, 1, 1,
0.6679154, -0.2492109, 3.280331, 1, 1, 1, 1, 1,
0.668757, 0.7073457, 1.794425, 0, 0, 1, 1, 1,
0.6702714, 0.1826223, 2.064398, 1, 0, 0, 1, 1,
0.6711799, 2.07013, 0.7999685, 1, 0, 0, 1, 1,
0.6807501, 1.364901, 0.9977509, 1, 0, 0, 1, 1,
0.6847868, -1.024255, 3.10897, 1, 0, 0, 1, 1,
0.6864589, -1.30781, 3.875496, 1, 0, 0, 1, 1,
0.6940167, 0.3167766, -0.5710561, 0, 0, 0, 1, 1,
0.6986241, -1.378844, 2.138892, 0, 0, 0, 1, 1,
0.7051942, -0.178713, 1.868357, 0, 0, 0, 1, 1,
0.7102324, 0.3477575, 1.948108, 0, 0, 0, 1, 1,
0.7114682, -0.108405, 1.257243, 0, 0, 0, 1, 1,
0.7181082, -1.852343, 1.8429, 0, 0, 0, 1, 1,
0.7225428, 0.6744676, 1.215482, 0, 0, 0, 1, 1,
0.7270782, 0.1838466, 1.894956, 1, 1, 1, 1, 1,
0.730867, 1.445156, 0.6241499, 1, 1, 1, 1, 1,
0.7333449, 0.4695061, 2.583315, 1, 1, 1, 1, 1,
0.7354739, -1.690269, 1.475221, 1, 1, 1, 1, 1,
0.7361184, 0.2613298, 0.1419588, 1, 1, 1, 1, 1,
0.7361665, -0.3717768, 3.052872, 1, 1, 1, 1, 1,
0.7412993, -1.44348, 2.038078, 1, 1, 1, 1, 1,
0.7535318, 0.3461876, -1.5069, 1, 1, 1, 1, 1,
0.7569661, -1.303974, 0.9529415, 1, 1, 1, 1, 1,
0.7572641, 1.462244, 1.374792, 1, 1, 1, 1, 1,
0.757624, -1.079218, 1.976723, 1, 1, 1, 1, 1,
0.7603004, 0.7922716, 1.746628, 1, 1, 1, 1, 1,
0.7682526, 1.402397, 0.2795244, 1, 1, 1, 1, 1,
0.7744184, 0.1718371, 2.666859, 1, 1, 1, 1, 1,
0.7760478, 0.4481481, 2.102567, 1, 1, 1, 1, 1,
0.7761241, -0.1893855, 1.603531, 0, 0, 1, 1, 1,
0.7767445, -0.1952805, 3.401383, 1, 0, 0, 1, 1,
0.7772924, -0.8313097, 0.9618493, 1, 0, 0, 1, 1,
0.7800601, -1.009308, 1.080155, 1, 0, 0, 1, 1,
0.7804735, -1.144332, 0.4095631, 1, 0, 0, 1, 1,
0.7858759, -0.2163103, 1.048959, 1, 0, 0, 1, 1,
0.7866731, -0.1537696, 0.5938343, 0, 0, 0, 1, 1,
0.7883667, 0.03359823, 1.505988, 0, 0, 0, 1, 1,
0.7904394, 0.9676291, -0.1506149, 0, 0, 0, 1, 1,
0.7938047, 0.6458318, 1.338905, 0, 0, 0, 1, 1,
0.7974879, -1.432995, 3.145688, 0, 0, 0, 1, 1,
0.8004488, -1.657834, 1.636115, 0, 0, 0, 1, 1,
0.8069972, -0.0814131, 1.480045, 0, 0, 0, 1, 1,
0.8098348, 1.265596, 0.7681224, 1, 1, 1, 1, 1,
0.8157479, 0.2495807, 1.111201, 1, 1, 1, 1, 1,
0.8169907, 0.5378416, 1.182089, 1, 1, 1, 1, 1,
0.8240548, -0.4395271, 3.552047, 1, 1, 1, 1, 1,
0.8270727, 0.7409571, 1.960108, 1, 1, 1, 1, 1,
0.8366814, 0.5405173, 0.5963629, 1, 1, 1, 1, 1,
0.8381906, 0.5335951, 1.809337, 1, 1, 1, 1, 1,
0.8398337, -0.6497363, 2.867987, 1, 1, 1, 1, 1,
0.8442675, -1.214085, 0.4985974, 1, 1, 1, 1, 1,
0.8515597, -1.91763, 2.898527, 1, 1, 1, 1, 1,
0.8525965, -1.314072, 2.249724, 1, 1, 1, 1, 1,
0.8530835, 0.4159292, 1.156337, 1, 1, 1, 1, 1,
0.8556468, -0.7566272, 0.7839754, 1, 1, 1, 1, 1,
0.860215, -0.7083088, 2.718829, 1, 1, 1, 1, 1,
0.8609948, 0.1964081, -0.04109807, 1, 1, 1, 1, 1,
0.8779705, -0.3633277, 3.64117, 0, 0, 1, 1, 1,
0.8809566, 1.719762, 0.4922323, 1, 0, 0, 1, 1,
0.8817737, -1.592555, 2.944559, 1, 0, 0, 1, 1,
0.891695, 0.2467868, 1.412993, 1, 0, 0, 1, 1,
0.8917654, 0.8816501, 2.19331, 1, 0, 0, 1, 1,
0.8928028, -1.078447, 2.927588, 1, 0, 0, 1, 1,
0.9000224, -0.6234996, 3.405787, 0, 0, 0, 1, 1,
0.9045781, 0.8603016, 1.163086, 0, 0, 0, 1, 1,
0.9158327, 0.2611389, 0.4669242, 0, 0, 0, 1, 1,
0.9191148, 1.286597, 0.4451262, 0, 0, 0, 1, 1,
0.9191412, 0.6470431, 1.353812, 0, 0, 0, 1, 1,
0.920594, -1.52621, 1.814465, 0, 0, 0, 1, 1,
0.9260631, 0.05140783, 1.585783, 0, 0, 0, 1, 1,
0.929476, -0.488629, 1.813511, 1, 1, 1, 1, 1,
0.9311299, -0.89103, -0.01705497, 1, 1, 1, 1, 1,
0.9350172, -0.02952128, 1.11042, 1, 1, 1, 1, 1,
0.935637, -0.5930105, 2.948128, 1, 1, 1, 1, 1,
0.9452001, -0.5667779, 2.243642, 1, 1, 1, 1, 1,
0.9487151, 0.7461585, 0.1849969, 1, 1, 1, 1, 1,
0.9580969, -0.2694831, 1.470484, 1, 1, 1, 1, 1,
0.9789817, 0.4708379, 1.479254, 1, 1, 1, 1, 1,
0.9846481, 2.03182, -0.2596637, 1, 1, 1, 1, 1,
0.9865507, 0.3561213, 0.538076, 1, 1, 1, 1, 1,
0.9867631, -0.4316125, 0.9643642, 1, 1, 1, 1, 1,
0.9888467, 0.2990356, 1.728686, 1, 1, 1, 1, 1,
0.9914531, 0.7919877, 0.4470005, 1, 1, 1, 1, 1,
0.9940362, 0.5321722, 1.156666, 1, 1, 1, 1, 1,
0.9974197, -0.04675042, 1.778487, 1, 1, 1, 1, 1,
0.9988413, 0.1701428, 2.923537, 0, 0, 1, 1, 1,
1.003726, 0.4625839, 0.9977372, 1, 0, 0, 1, 1,
1.005054, 0.378451, 1.352631, 1, 0, 0, 1, 1,
1.01025, 1.064787, 1.265346, 1, 0, 0, 1, 1,
1.012579, 0.2025226, 0.6162063, 1, 0, 0, 1, 1,
1.013039, 0.1157575, 1.214949, 1, 0, 0, 1, 1,
1.015708, -0.5900598, 2.840969, 0, 0, 0, 1, 1,
1.016957, 1.201679, -0.7320786, 0, 0, 0, 1, 1,
1.024548, 0.1003872, 1.106733, 0, 0, 0, 1, 1,
1.025063, 1.678649, -0.8789515, 0, 0, 0, 1, 1,
1.036755, -0.7070208, 1.78649, 0, 0, 0, 1, 1,
1.043983, 0.06323946, 1.768821, 0, 0, 0, 1, 1,
1.048102, -1.581029, 2.493148, 0, 0, 0, 1, 1,
1.055993, 2.120081, 0.389179, 1, 1, 1, 1, 1,
1.057455, -2.650028, 2.581187, 1, 1, 1, 1, 1,
1.057703, -1.242181, 1.66221, 1, 1, 1, 1, 1,
1.062437, -0.2558397, 3.877401, 1, 1, 1, 1, 1,
1.070688, 0.849783, 2.678122, 1, 1, 1, 1, 1,
1.079292, 2.14385, -0.1419646, 1, 1, 1, 1, 1,
1.08058, -0.9261647, 1.496695, 1, 1, 1, 1, 1,
1.081643, 0.9813535, 1.141994, 1, 1, 1, 1, 1,
1.084632, -0.9769363, 1.712036, 1, 1, 1, 1, 1,
1.085465, 0.3900157, 0.2053765, 1, 1, 1, 1, 1,
1.087234, -0.1031438, 0.09475557, 1, 1, 1, 1, 1,
1.092008, -1.358748, 2.232203, 1, 1, 1, 1, 1,
1.092684, 0.401102, 1.139841, 1, 1, 1, 1, 1,
1.094756, -0.2109904, 0.3871375, 1, 1, 1, 1, 1,
1.103233, -0.9274877, 3.522782, 1, 1, 1, 1, 1,
1.107958, 1.058632, -1.584633, 0, 0, 1, 1, 1,
1.11022, -1.296754, 2.213547, 1, 0, 0, 1, 1,
1.112909, -0.4529018, 2.517995, 1, 0, 0, 1, 1,
1.123257, -0.07890143, 0.9343109, 1, 0, 0, 1, 1,
1.124541, 0.1740151, 1.683299, 1, 0, 0, 1, 1,
1.152935, 0.7391397, 2.173022, 1, 0, 0, 1, 1,
1.153696, -0.5172246, 2.663726, 0, 0, 0, 1, 1,
1.154909, -0.2465326, 2.516535, 0, 0, 0, 1, 1,
1.161261, 0.9947478, -0.08121901, 0, 0, 0, 1, 1,
1.166955, 2.567503, 1.893836, 0, 0, 0, 1, 1,
1.172937, -0.2061641, -0.2426075, 0, 0, 0, 1, 1,
1.197088, 0.2706186, 2.548321, 0, 0, 0, 1, 1,
1.198521, 0.7717719, 0.2570731, 0, 0, 0, 1, 1,
1.208313, -0.3023059, 0.6494266, 1, 1, 1, 1, 1,
1.214447, 0.7124509, 2.149763, 1, 1, 1, 1, 1,
1.219295, 0.2650104, 3.246077, 1, 1, 1, 1, 1,
1.229058, -1.380561, 3.049942, 1, 1, 1, 1, 1,
1.246708, -0.4427193, 3.07662, 1, 1, 1, 1, 1,
1.25734, -0.149985, 1.430168, 1, 1, 1, 1, 1,
1.262406, -1.910469, 1.897878, 1, 1, 1, 1, 1,
1.263717, -0.1752628, 2.68041, 1, 1, 1, 1, 1,
1.274928, 0.2180171, 1.727251, 1, 1, 1, 1, 1,
1.278465, -0.006555253, 0.8639833, 1, 1, 1, 1, 1,
1.280016, 0.1456261, 1.444004, 1, 1, 1, 1, 1,
1.285329, -1.897393, 2.996513, 1, 1, 1, 1, 1,
1.286469, -1.303108, 3.9586, 1, 1, 1, 1, 1,
1.299002, 1.028523, 1.859232, 1, 1, 1, 1, 1,
1.304815, -0.0986856, 1.374897, 1, 1, 1, 1, 1,
1.304849, -1.654744, 2.402282, 0, 0, 1, 1, 1,
1.307173, 1.167872, 0.4184211, 1, 0, 0, 1, 1,
1.307321, -1.036721, 2.859365, 1, 0, 0, 1, 1,
1.323437, 1.71596, 1.198405, 1, 0, 0, 1, 1,
1.328555, 1.443391, 0.6339425, 1, 0, 0, 1, 1,
1.341031, 0.6853147, 2.795931, 1, 0, 0, 1, 1,
1.348461, -1.488461, 0.9465717, 0, 0, 0, 1, 1,
1.351267, -0.7728642, 1.785212, 0, 0, 0, 1, 1,
1.353098, 0.6512334, 1.778118, 0, 0, 0, 1, 1,
1.370424, 1.365794, 0.2592245, 0, 0, 0, 1, 1,
1.375842, 1.572725, 1.770128, 0, 0, 0, 1, 1,
1.379366, 1.067623, 2.152532, 0, 0, 0, 1, 1,
1.395572, 0.7095523, 1.399812, 0, 0, 0, 1, 1,
1.3979, 0.01336213, 3.218543, 1, 1, 1, 1, 1,
1.405437, -0.5218765, 1.377769, 1, 1, 1, 1, 1,
1.410414, 0.7299669, 0.2780045, 1, 1, 1, 1, 1,
1.414183, -0.8791819, 3.028463, 1, 1, 1, 1, 1,
1.419413, -0.01558277, 1.666582, 1, 1, 1, 1, 1,
1.425439, 0.7014696, 1.017156, 1, 1, 1, 1, 1,
1.433282, -0.3684806, 3.291667, 1, 1, 1, 1, 1,
1.444008, -2.004883, 2.347477, 1, 1, 1, 1, 1,
1.453422, 1.207832, -0.02892675, 1, 1, 1, 1, 1,
1.456498, -0.3505209, 1.8095, 1, 1, 1, 1, 1,
1.465009, 1.447727, -0.8183714, 1, 1, 1, 1, 1,
1.47404, 0.4233928, 0.3471548, 1, 1, 1, 1, 1,
1.474929, 0.07835903, 1.380777, 1, 1, 1, 1, 1,
1.487569, -0.1420678, 1.363319, 1, 1, 1, 1, 1,
1.489261, 0.3537616, 2.438579, 1, 1, 1, 1, 1,
1.498256, 0.4913806, 2.481375, 0, 0, 1, 1, 1,
1.501678, -1.604587, 1.270922, 1, 0, 0, 1, 1,
1.5017, -0.6705519, 2.256198, 1, 0, 0, 1, 1,
1.502522, -0.9587637, -0.007357049, 1, 0, 0, 1, 1,
1.508035, 1.112374, 0.250278, 1, 0, 0, 1, 1,
1.519766, -1.180608, 1.185258, 1, 0, 0, 1, 1,
1.52862, -0.7656303, 1.116973, 0, 0, 0, 1, 1,
1.536474, -1.292041, 4.799321, 0, 0, 0, 1, 1,
1.537265, -0.9111428, -0.4548863, 0, 0, 0, 1, 1,
1.542088, -0.292632, 2.96461, 0, 0, 0, 1, 1,
1.544006, -0.03348791, -0.05791337, 0, 0, 0, 1, 1,
1.546181, -0.5854914, 3.630271, 0, 0, 0, 1, 1,
1.54712, 0.03671737, 2.202729, 0, 0, 0, 1, 1,
1.555505, 0.5579439, 1.160317, 1, 1, 1, 1, 1,
1.559577, -0.7902272, 2.427531, 1, 1, 1, 1, 1,
1.582026, -0.8538684, 2.630788, 1, 1, 1, 1, 1,
1.599285, 1.517774, 0.6487264, 1, 1, 1, 1, 1,
1.601389, -2.280243, 2.125891, 1, 1, 1, 1, 1,
1.602986, 0.3793386, 1.133641, 1, 1, 1, 1, 1,
1.610814, 0.1395786, 0.8033276, 1, 1, 1, 1, 1,
1.612167, 0.7477056, 1.223681, 1, 1, 1, 1, 1,
1.624062, 0.5754272, 3.260015, 1, 1, 1, 1, 1,
1.624087, -0.03513732, 2.747538, 1, 1, 1, 1, 1,
1.627263, -1.684474, 2.492764, 1, 1, 1, 1, 1,
1.632313, 0.4760177, 1.304119, 1, 1, 1, 1, 1,
1.636706, -1.750077, 2.12992, 1, 1, 1, 1, 1,
1.645831, 1.745301, 0.1507329, 1, 1, 1, 1, 1,
1.647573, -0.6893989, 2.79825, 1, 1, 1, 1, 1,
1.651981, -1.447544, 1.520388, 0, 0, 1, 1, 1,
1.669042, -0.1868368, 3.089438, 1, 0, 0, 1, 1,
1.683566, -0.26459, 1.166641, 1, 0, 0, 1, 1,
1.685789, 1.232703, 2.659977, 1, 0, 0, 1, 1,
1.688938, 0.04088861, 2.097508, 1, 0, 0, 1, 1,
1.69, 0.8446634, 0.8211105, 1, 0, 0, 1, 1,
1.722035, 1.606215, 0.1110645, 0, 0, 0, 1, 1,
1.729117, -0.1610745, 0.940858, 0, 0, 0, 1, 1,
1.760417, 0.5710492, 1.66395, 0, 0, 0, 1, 1,
1.767527, -1.246863, -0.3417018, 0, 0, 0, 1, 1,
1.770921, -0.9159053, 2.95303, 0, 0, 0, 1, 1,
1.791891, -0.3696853, 3.486337, 0, 0, 0, 1, 1,
1.795148, -0.7143277, 0.6426138, 0, 0, 0, 1, 1,
1.800317, -0.463083, 1.820484, 1, 1, 1, 1, 1,
1.805557, -1.827356, 2.873384, 1, 1, 1, 1, 1,
1.819145, 0.737589, 2.770662, 1, 1, 1, 1, 1,
1.826438, -0.7377183, 2.521889, 1, 1, 1, 1, 1,
1.842977, -0.8008956, -0.06104309, 1, 1, 1, 1, 1,
1.848673, -0.8148315, 1.934547, 1, 1, 1, 1, 1,
1.909653, 1.353376, 2.822904, 1, 1, 1, 1, 1,
1.919892, 0.2901839, 3.075381, 1, 1, 1, 1, 1,
1.939832, 0.1321656, 2.898296, 1, 1, 1, 1, 1,
1.942901, -1.439447, 1.243558, 1, 1, 1, 1, 1,
1.953362, 0.02688791, 2.218342, 1, 1, 1, 1, 1,
1.96367, -0.8521498, 2.889162, 1, 1, 1, 1, 1,
1.971124, 0.145326, 3.268447, 1, 1, 1, 1, 1,
1.975596, 0.3408641, 0.3503898, 1, 1, 1, 1, 1,
1.97909, 1.804254, 0.3342949, 1, 1, 1, 1, 1,
1.980663, 0.1941919, 2.592915, 0, 0, 1, 1, 1,
2.016377, 0.5974655, 3.597901, 1, 0, 0, 1, 1,
2.070812, -0.08241834, 3.234477, 1, 0, 0, 1, 1,
2.073581, -1.696555, 1.216258, 1, 0, 0, 1, 1,
2.082888, 1.590072, 2.757131, 1, 0, 0, 1, 1,
2.097214, -1.270855, 1.669923, 1, 0, 0, 1, 1,
2.113056, 0.7367671, 0.2528172, 0, 0, 0, 1, 1,
2.124271, 0.5661194, 1.743335, 0, 0, 0, 1, 1,
2.247526, -1.621718, 4.426053, 0, 0, 0, 1, 1,
2.257955, -0.7009011, 1.535184, 0, 0, 0, 1, 1,
2.279906, -0.05374611, 2.329411, 0, 0, 0, 1, 1,
2.308604, 0.2742183, 1.060751, 0, 0, 0, 1, 1,
2.34198, -1.327315, 2.594708, 0, 0, 0, 1, 1,
2.366329, 0.2155556, 1.898277, 1, 1, 1, 1, 1,
2.553637, 0.9120069, 1.075841, 1, 1, 1, 1, 1,
2.610432, 1.849146, 0.2831901, 1, 1, 1, 1, 1,
2.652742, -0.4785655, 0.8446503, 1, 1, 1, 1, 1,
2.725991, 0.5495095, 2.615172, 1, 1, 1, 1, 1,
3.479443, 0.03646291, 1.840598, 1, 1, 1, 1, 1,
3.509133, -0.4406158, 1.258191, 1, 1, 1, 1, 1
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
var radius = 9.831494;
var distance = 34.53271;
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
mvMatrix.translate( -0.1658638, -0.1206372, -0.1559212 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.53271);
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
