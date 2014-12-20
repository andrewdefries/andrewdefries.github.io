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
-3.096504, 1.254031, 0.5061266, 1, 0, 0, 1,
-3.019016, -2.289384, -2.30713, 1, 0.007843138, 0, 1,
-2.685858, 0.2268376, 1.131249, 1, 0.01176471, 0, 1,
-2.640437, -0.1125397, -0.5937957, 1, 0.01960784, 0, 1,
-2.606018, -1.307453, -2.769396, 1, 0.02352941, 0, 1,
-2.564492, 0.3429061, -1.481833, 1, 0.03137255, 0, 1,
-2.4783, 0.3118476, -2.990189, 1, 0.03529412, 0, 1,
-2.417749, 0.6427287, -1.606802, 1, 0.04313726, 0, 1,
-2.408616, 0.4428241, -1.355591, 1, 0.04705882, 0, 1,
-2.373875, -0.4304478, -0.105191, 1, 0.05490196, 0, 1,
-2.327067, 0.8305013, -3.461039, 1, 0.05882353, 0, 1,
-2.228613, -1.271345, -0.08712145, 1, 0.06666667, 0, 1,
-2.223479, 0.4704602, -2.736702, 1, 0.07058824, 0, 1,
-2.1826, -1.546624, -3.274379, 1, 0.07843138, 0, 1,
-2.172028, 0.1166918, -1.400864, 1, 0.08235294, 0, 1,
-2.16145, 1.378272, 0.09793617, 1, 0.09019608, 0, 1,
-2.155757, -0.02346202, -0.4123323, 1, 0.09411765, 0, 1,
-2.145859, -1.684231, -3.291371, 1, 0.1019608, 0, 1,
-2.143597, -1.482165, -2.866894, 1, 0.1098039, 0, 1,
-2.108269, 0.04407918, 0.1629351, 1, 0.1137255, 0, 1,
-2.074283, -1.309716, -2.299965, 1, 0.1215686, 0, 1,
-2.042511, -0.6904466, -0.2291123, 1, 0.1254902, 0, 1,
-1.982845, -0.3688509, -1.128271, 1, 0.1333333, 0, 1,
-1.957972, 0.6027586, -0.6056141, 1, 0.1372549, 0, 1,
-1.956786, -0.5616132, -1.29342, 1, 0.145098, 0, 1,
-1.938658, 0.8681207, -0.1835271, 1, 0.1490196, 0, 1,
-1.933535, -0.1718337, -3.398081, 1, 0.1568628, 0, 1,
-1.93352, -0.4698433, -1.938385, 1, 0.1607843, 0, 1,
-1.917689, -1.19146, -2.180599, 1, 0.1686275, 0, 1,
-1.911947, 0.3931643, -1.993127, 1, 0.172549, 0, 1,
-1.906203, 0.4568885, -3.222866, 1, 0.1803922, 0, 1,
-1.873793, -1.256728, -2.735744, 1, 0.1843137, 0, 1,
-1.867719, -0.8033878, -1.495236, 1, 0.1921569, 0, 1,
-1.837427, 0.5210764, -2.607071, 1, 0.1960784, 0, 1,
-1.834794, -1.03558, -4.167197, 1, 0.2039216, 0, 1,
-1.833295, -0.142965, -0.1314832, 1, 0.2117647, 0, 1,
-1.824076, -0.7059879, -1.81951, 1, 0.2156863, 0, 1,
-1.817595, -0.1807358, -2.48988, 1, 0.2235294, 0, 1,
-1.812283, 1.937858, -1.669352, 1, 0.227451, 0, 1,
-1.800625, 0.4633178, -1.869423, 1, 0.2352941, 0, 1,
-1.78324, -0.7340611, -2.449116, 1, 0.2392157, 0, 1,
-1.76541, 0.7146437, -1.402533, 1, 0.2470588, 0, 1,
-1.756114, -0.952998, -0.2497803, 1, 0.2509804, 0, 1,
-1.735284, -0.5557601, -3.296172, 1, 0.2588235, 0, 1,
-1.726154, 0.6358666, -0.4481576, 1, 0.2627451, 0, 1,
-1.712719, 0.071684, -1.636721, 1, 0.2705882, 0, 1,
-1.712257, -1.039506, -0.7972841, 1, 0.2745098, 0, 1,
-1.704005, -0.008634488, -1.999032, 1, 0.282353, 0, 1,
-1.686441, -1.323455, -2.467121, 1, 0.2862745, 0, 1,
-1.683012, -1.893259, -3.304073, 1, 0.2941177, 0, 1,
-1.677759, -0.5165073, -3.153855, 1, 0.3019608, 0, 1,
-1.65752, 1.196404, -2.359136, 1, 0.3058824, 0, 1,
-1.656065, -1.29618, -2.182027, 1, 0.3137255, 0, 1,
-1.644167, -0.2621612, -1.856749, 1, 0.3176471, 0, 1,
-1.591702, 0.9053182, -1.397256, 1, 0.3254902, 0, 1,
-1.58467, 0.5558609, -2.498697, 1, 0.3294118, 0, 1,
-1.584456, 1.080863, -1.187551, 1, 0.3372549, 0, 1,
-1.581314, -0.2417549, -1.256607, 1, 0.3411765, 0, 1,
-1.575418, -1.322508, -2.993418, 1, 0.3490196, 0, 1,
-1.566917, -0.4032627, -1.470737, 1, 0.3529412, 0, 1,
-1.566303, -2.237335, -3.287246, 1, 0.3607843, 0, 1,
-1.551911, -0.3053167, -0.6518325, 1, 0.3647059, 0, 1,
-1.539417, -1.920186, -4.433469, 1, 0.372549, 0, 1,
-1.539344, 0.7068266, -1.514593, 1, 0.3764706, 0, 1,
-1.514892, -1.140745, -3.178517, 1, 0.3843137, 0, 1,
-1.50903, -0.7459401, -2.641698, 1, 0.3882353, 0, 1,
-1.48938, 0.9534348, -1.620279, 1, 0.3960784, 0, 1,
-1.488769, 1.847346, -0.1043078, 1, 0.4039216, 0, 1,
-1.472115, 0.836314, -0.1635835, 1, 0.4078431, 0, 1,
-1.467707, -0.04206654, -2.344309, 1, 0.4156863, 0, 1,
-1.467096, -0.04834734, -1.29383, 1, 0.4196078, 0, 1,
-1.460707, 0.3241658, -2.302823, 1, 0.427451, 0, 1,
-1.408305, 0.3168148, -1.49839, 1, 0.4313726, 0, 1,
-1.398787, -0.296069, -0.9038705, 1, 0.4392157, 0, 1,
-1.396076, -0.1664742, -3.19333, 1, 0.4431373, 0, 1,
-1.372925, 0.589912, -1.711061, 1, 0.4509804, 0, 1,
-1.363183, -1.057226, -3.426693, 1, 0.454902, 0, 1,
-1.352235, -0.4624989, -2.602242, 1, 0.4627451, 0, 1,
-1.343488, 1.665307, -0.7830285, 1, 0.4666667, 0, 1,
-1.340601, -0.358226, -3.048884, 1, 0.4745098, 0, 1,
-1.339629, 0.09673284, -1.872102, 1, 0.4784314, 0, 1,
-1.3265, -0.3979632, -0.5194519, 1, 0.4862745, 0, 1,
-1.32292, 0.001540047, -2.050913, 1, 0.4901961, 0, 1,
-1.311979, 2.508366, -0.304785, 1, 0.4980392, 0, 1,
-1.311099, -0.4417557, -3.24979, 1, 0.5058824, 0, 1,
-1.296941, -0.2796684, -1.851855, 1, 0.509804, 0, 1,
-1.292919, -0.5554327, -3.727031, 1, 0.5176471, 0, 1,
-1.291993, 0.06912247, -1.970397, 1, 0.5215687, 0, 1,
-1.282395, 0.1374686, -1.625457, 1, 0.5294118, 0, 1,
-1.277228, 1.049436, -0.1382488, 1, 0.5333334, 0, 1,
-1.270893, -1.04619, -1.025164, 1, 0.5411765, 0, 1,
-1.264531, -0.8681973, -0.6408864, 1, 0.5450981, 0, 1,
-1.257655, -1.921122, -2.858746, 1, 0.5529412, 0, 1,
-1.246211, -2.607651, -3.99842, 1, 0.5568628, 0, 1,
-1.245135, 0.09276159, -0.8251782, 1, 0.5647059, 0, 1,
-1.218957, -0.5970522, -2.293111, 1, 0.5686275, 0, 1,
-1.210494, 0.8531721, -0.6108339, 1, 0.5764706, 0, 1,
-1.208878, -0.08144494, 0.5688664, 1, 0.5803922, 0, 1,
-1.201052, 1.68714, 0.4498657, 1, 0.5882353, 0, 1,
-1.200605, 0.6005828, -0.2567049, 1, 0.5921569, 0, 1,
-1.195013, 0.569975, -0.6257394, 1, 0.6, 0, 1,
-1.194401, 0.139492, -0.1540971, 1, 0.6078432, 0, 1,
-1.19231, -0.9008325, -1.495127, 1, 0.6117647, 0, 1,
-1.187727, -0.2972522, -2.714736, 1, 0.6196079, 0, 1,
-1.18476, -0.1522159, -0.5286834, 1, 0.6235294, 0, 1,
-1.182027, -2.266239, -3.059497, 1, 0.6313726, 0, 1,
-1.161268, 0.02643319, -0.8623008, 1, 0.6352941, 0, 1,
-1.160898, -0.3204038, -2.892406, 1, 0.6431373, 0, 1,
-1.157968, -1.500443, -2.748384, 1, 0.6470588, 0, 1,
-1.156926, -1.853105, -1.321752, 1, 0.654902, 0, 1,
-1.151988, 0.3205622, -0.6211535, 1, 0.6588235, 0, 1,
-1.149456, -1.581816, -2.894399, 1, 0.6666667, 0, 1,
-1.144081, -0.03911198, -2.142252, 1, 0.6705883, 0, 1,
-1.141825, -1.420465, -3.997968, 1, 0.6784314, 0, 1,
-1.140588, -0.6538495, -3.069998, 1, 0.682353, 0, 1,
-1.117883, -0.006742699, -0.5869632, 1, 0.6901961, 0, 1,
-1.114759, -0.198451, -3.780356, 1, 0.6941177, 0, 1,
-1.102164, -0.1633545, -2.20339, 1, 0.7019608, 0, 1,
-1.098835, -0.3793292, -2.105959, 1, 0.7098039, 0, 1,
-1.092742, 0.3451463, -2.292346, 1, 0.7137255, 0, 1,
-1.091953, -0.1230994, -1.519571, 1, 0.7215686, 0, 1,
-1.090364, 0.7261294, -1.115028, 1, 0.7254902, 0, 1,
-1.082585, 0.08658434, -2.803491, 1, 0.7333333, 0, 1,
-1.082512, 0.8858419, 0.04357595, 1, 0.7372549, 0, 1,
-1.075681, -0.5517381, -2.390808, 1, 0.7450981, 0, 1,
-1.059161, -0.06653518, -1.663935, 1, 0.7490196, 0, 1,
-1.057488, -2.651195, -1.21949, 1, 0.7568628, 0, 1,
-1.056798, -1.176619, -0.529484, 1, 0.7607843, 0, 1,
-1.053931, -0.4513217, -0.9929577, 1, 0.7686275, 0, 1,
-1.046167, -0.02399041, -1.693831, 1, 0.772549, 0, 1,
-1.044217, 1.72074, 0.336471, 1, 0.7803922, 0, 1,
-1.04373, -0.9311709, -2.185951, 1, 0.7843137, 0, 1,
-1.042877, 0.2765462, -0.9968894, 1, 0.7921569, 0, 1,
-1.042085, -0.493072, -1.191101, 1, 0.7960784, 0, 1,
-1.032598, -0.6480324, -2.094729, 1, 0.8039216, 0, 1,
-1.025485, 1.149719, -1.963392, 1, 0.8117647, 0, 1,
-1.024448, 0.4107367, 0.1407696, 1, 0.8156863, 0, 1,
-1.022877, -1.579015, -2.060534, 1, 0.8235294, 0, 1,
-1.005736, 1.215253, -1.6936, 1, 0.827451, 0, 1,
-0.9966123, 0.4394873, -0.005624891, 1, 0.8352941, 0, 1,
-0.9895558, 1.068761, -2.337363, 1, 0.8392157, 0, 1,
-0.9819115, -1.804932, -1.125334, 1, 0.8470588, 0, 1,
-0.9756249, 0.6591954, 0.3745368, 1, 0.8509804, 0, 1,
-0.9696478, -0.3098407, -3.147323, 1, 0.8588235, 0, 1,
-0.9669048, -0.5120407, -2.228946, 1, 0.8627451, 0, 1,
-0.9602154, 0.3647817, -0.7981668, 1, 0.8705882, 0, 1,
-0.9542307, -1.450056, -4.257679, 1, 0.8745098, 0, 1,
-0.9505944, 0.7098014, -1.574531, 1, 0.8823529, 0, 1,
-0.9449822, 0.7723669, -1.764399, 1, 0.8862745, 0, 1,
-0.9425554, 0.1808928, -0.8415766, 1, 0.8941177, 0, 1,
-0.9418078, 1.545861, -0.9602403, 1, 0.8980392, 0, 1,
-0.9411277, -2.950758, -3.977389, 1, 0.9058824, 0, 1,
-0.9372612, 0.8324592, -0.3900684, 1, 0.9137255, 0, 1,
-0.9368057, 0.09563049, -2.158173, 1, 0.9176471, 0, 1,
-0.9301758, -0.5930593, -1.038245, 1, 0.9254902, 0, 1,
-0.9265593, -0.0217558, -0.4559219, 1, 0.9294118, 0, 1,
-0.9215787, -0.5696454, -1.213094, 1, 0.9372549, 0, 1,
-0.9199048, 0.6204067, 0.04760191, 1, 0.9411765, 0, 1,
-0.9170433, -0.1385915, -2.542664, 1, 0.9490196, 0, 1,
-0.912313, 0.5621444, -1.149323, 1, 0.9529412, 0, 1,
-0.9113873, 0.562742, -0.3858749, 1, 0.9607843, 0, 1,
-0.9049482, 1.724138, 2.188619, 1, 0.9647059, 0, 1,
-0.9041347, 0.7812413, -0.2319519, 1, 0.972549, 0, 1,
-0.9018102, 0.913922, -2.224191, 1, 0.9764706, 0, 1,
-0.9018005, 0.1717588, 0.05930002, 1, 0.9843137, 0, 1,
-0.8984562, -1.069156, -1.649607, 1, 0.9882353, 0, 1,
-0.8938433, 1.670301, -0.1341332, 1, 0.9960784, 0, 1,
-0.888278, -0.2138259, -3.618149, 0.9960784, 1, 0, 1,
-0.8857367, 0.2907687, -0.6201161, 0.9921569, 1, 0, 1,
-0.8767545, 0.9305347, -0.4696579, 0.9843137, 1, 0, 1,
-0.8738527, -0.6860587, -2.56818, 0.9803922, 1, 0, 1,
-0.8734362, 1.304746, 0.2473251, 0.972549, 1, 0, 1,
-0.8724794, 0.2375529, -2.637818, 0.9686275, 1, 0, 1,
-0.8633926, -1.242978, -2.131082, 0.9607843, 1, 0, 1,
-0.8609284, 1.030158, -0.4174757, 0.9568627, 1, 0, 1,
-0.8596647, -0.4589511, -0.3634202, 0.9490196, 1, 0, 1,
-0.8521476, 0.1145731, -2.379963, 0.945098, 1, 0, 1,
-0.8429061, -0.6360116, -2.847704, 0.9372549, 1, 0, 1,
-0.8326658, 1.161484, -1.295531, 0.9333333, 1, 0, 1,
-0.8320013, -0.2115221, -2.588807, 0.9254902, 1, 0, 1,
-0.8318215, 0.5819418, -1.35903, 0.9215686, 1, 0, 1,
-0.8260242, 0.1527869, -2.672039, 0.9137255, 1, 0, 1,
-0.8236645, 1.019449, -0.05300488, 0.9098039, 1, 0, 1,
-0.8146515, -0.08411512, -1.32867, 0.9019608, 1, 0, 1,
-0.8116189, -1.049371, -1.036184, 0.8941177, 1, 0, 1,
-0.7970226, -0.117869, -2.099176, 0.8901961, 1, 0, 1,
-0.7948014, 1.308017, 0.8475561, 0.8823529, 1, 0, 1,
-0.794662, 0.5472552, -0.8002287, 0.8784314, 1, 0, 1,
-0.7917657, 1.200419, -1.20335, 0.8705882, 1, 0, 1,
-0.7866163, -2.129357, -3.135705, 0.8666667, 1, 0, 1,
-0.7828135, 1.756052, -0.9114518, 0.8588235, 1, 0, 1,
-0.7821717, -0.5481363, -1.618491, 0.854902, 1, 0, 1,
-0.7777661, 0.2525102, 0.9374539, 0.8470588, 1, 0, 1,
-0.767223, -0.2091517, -1.64079, 0.8431373, 1, 0, 1,
-0.7665272, -0.673147, -3.131433, 0.8352941, 1, 0, 1,
-0.7627743, 0.9453404, -1.185769, 0.8313726, 1, 0, 1,
-0.7561064, 0.230685, -1.216687, 0.8235294, 1, 0, 1,
-0.7513114, 1.240048, -0.2842172, 0.8196079, 1, 0, 1,
-0.7512524, -0.04437083, -3.233659, 0.8117647, 1, 0, 1,
-0.7458995, -0.08163901, -1.405139, 0.8078431, 1, 0, 1,
-0.7418351, 0.5773892, -1.271123, 0.8, 1, 0, 1,
-0.7383566, 0.6794989, -0.4372827, 0.7921569, 1, 0, 1,
-0.7288332, 0.3959956, -1.419531, 0.7882353, 1, 0, 1,
-0.7283179, -0.08043468, -3.509186, 0.7803922, 1, 0, 1,
-0.7094957, 0.7551165, -0.0250632, 0.7764706, 1, 0, 1,
-0.708069, 0.6377075, 0.3886615, 0.7686275, 1, 0, 1,
-0.7017937, 1.086168, 0.1794023, 0.7647059, 1, 0, 1,
-0.7015638, -0.4336035, -1.855858, 0.7568628, 1, 0, 1,
-0.6988762, -1.421211, -1.639339, 0.7529412, 1, 0, 1,
-0.6986997, -0.1458932, -2.216634, 0.7450981, 1, 0, 1,
-0.6974943, 1.503767, -1.532419, 0.7411765, 1, 0, 1,
-0.6932276, -0.1603324, -2.499752, 0.7333333, 1, 0, 1,
-0.6912214, -0.4941403, -2.221658, 0.7294118, 1, 0, 1,
-0.6898533, -1.2286, -3.555506, 0.7215686, 1, 0, 1,
-0.6871816, -0.4903949, -1.735654, 0.7176471, 1, 0, 1,
-0.6802126, 0.4785201, 0.1179802, 0.7098039, 1, 0, 1,
-0.6741626, 0.2431749, -1.957762, 0.7058824, 1, 0, 1,
-0.666851, -1.248199, -4.259671, 0.6980392, 1, 0, 1,
-0.6556274, -0.6506541, -2.137362, 0.6901961, 1, 0, 1,
-0.6422683, -0.7268887, -3.367708, 0.6862745, 1, 0, 1,
-0.6363888, 0.4559208, -1.33349, 0.6784314, 1, 0, 1,
-0.6346236, -0.9121029, -3.549624, 0.6745098, 1, 0, 1,
-0.629676, -0.4908975, -1.485892, 0.6666667, 1, 0, 1,
-0.6245306, -0.3009946, -2.777615, 0.6627451, 1, 0, 1,
-0.6203428, -0.7580304, -2.923259, 0.654902, 1, 0, 1,
-0.6140679, -1.313609, -2.521042, 0.6509804, 1, 0, 1,
-0.6122074, 0.9776858, -2.23787, 0.6431373, 1, 0, 1,
-0.6091221, 1.671595, 0.1240362, 0.6392157, 1, 0, 1,
-0.6084645, -1.157236, -3.031861, 0.6313726, 1, 0, 1,
-0.6071005, 0.1838842, -0.5467837, 0.627451, 1, 0, 1,
-0.6054783, 1.562717, 1.725336, 0.6196079, 1, 0, 1,
-0.6021403, -0.0309016, -1.076042, 0.6156863, 1, 0, 1,
-0.5900532, 0.7840738, -2.152206, 0.6078432, 1, 0, 1,
-0.5869914, 0.1168984, -2.061356, 0.6039216, 1, 0, 1,
-0.5866302, 0.1772081, -1.278253, 0.5960785, 1, 0, 1,
-0.5846354, -0.008130204, 0.3737372, 0.5882353, 1, 0, 1,
-0.5822349, 1.477668, 0.227383, 0.5843138, 1, 0, 1,
-0.5814302, 2.057327, 0.1768975, 0.5764706, 1, 0, 1,
-0.5745628, 1.082624, -0.3565995, 0.572549, 1, 0, 1,
-0.5740819, 1.262364, -0.6043128, 0.5647059, 1, 0, 1,
-0.5705993, -0.313911, -3.140894, 0.5607843, 1, 0, 1,
-0.5705107, -1.278757, -1.295247, 0.5529412, 1, 0, 1,
-0.5676664, 1.078412, 0.7450678, 0.5490196, 1, 0, 1,
-0.563623, -1.216657, -2.579735, 0.5411765, 1, 0, 1,
-0.5631607, 1.669846, -0.3015801, 0.5372549, 1, 0, 1,
-0.5612283, -0.7877955, -1.551772, 0.5294118, 1, 0, 1,
-0.5610004, -0.9216465, -1.197378, 0.5254902, 1, 0, 1,
-0.5599429, -0.4970209, -1.891227, 0.5176471, 1, 0, 1,
-0.5570552, 0.9493431, -0.8110864, 0.5137255, 1, 0, 1,
-0.5534021, -0.3689567, -1.769, 0.5058824, 1, 0, 1,
-0.5514465, -0.7043276, -0.1626603, 0.5019608, 1, 0, 1,
-0.545654, 0.4559601, 1.091057, 0.4941176, 1, 0, 1,
-0.5454182, -0.04797995, -1.945269, 0.4862745, 1, 0, 1,
-0.5443997, -0.3815085, -2.045885, 0.4823529, 1, 0, 1,
-0.535549, 1.075391, -0.3421739, 0.4745098, 1, 0, 1,
-0.5311586, -1.49355, -2.667714, 0.4705882, 1, 0, 1,
-0.5270638, 0.163185, -0.6852037, 0.4627451, 1, 0, 1,
-0.5250353, -1.451312, -2.800697, 0.4588235, 1, 0, 1,
-0.5240494, -0.4645062, -0.2498691, 0.4509804, 1, 0, 1,
-0.520417, 1.445654, -1.061572, 0.4470588, 1, 0, 1,
-0.5177254, 2.882332, -0.4181195, 0.4392157, 1, 0, 1,
-0.5167021, -0.4427883, -2.557834, 0.4352941, 1, 0, 1,
-0.5116943, 0.3181359, -0.1597557, 0.427451, 1, 0, 1,
-0.5098973, 0.4193032, -1.487479, 0.4235294, 1, 0, 1,
-0.4996933, 1.741381, -1.499613, 0.4156863, 1, 0, 1,
-0.49683, 0.5966708, -3.879266, 0.4117647, 1, 0, 1,
-0.4964808, -0.3273365, -1.024093, 0.4039216, 1, 0, 1,
-0.4962077, -0.2077441, -2.641663, 0.3960784, 1, 0, 1,
-0.4928247, 0.7688602, -0.216047, 0.3921569, 1, 0, 1,
-0.4919452, -0.6810703, -4.025235, 0.3843137, 1, 0, 1,
-0.4881161, -0.750927, -2.916358, 0.3803922, 1, 0, 1,
-0.487109, 0.2278402, -1.787563, 0.372549, 1, 0, 1,
-0.4859765, 1.30752, 0.1802691, 0.3686275, 1, 0, 1,
-0.485899, 0.745983, -1.740416, 0.3607843, 1, 0, 1,
-0.4853547, -0.143571, -0.3145182, 0.3568628, 1, 0, 1,
-0.4848585, -0.2450026, -1.501691, 0.3490196, 1, 0, 1,
-0.479752, -0.2081899, 0.5833297, 0.345098, 1, 0, 1,
-0.4740726, 1.464076, 1.023125, 0.3372549, 1, 0, 1,
-0.4732453, 0.4548799, -0.5125621, 0.3333333, 1, 0, 1,
-0.4721198, -0.3418493, -1.016006, 0.3254902, 1, 0, 1,
-0.4666573, -1.29499, -2.618329, 0.3215686, 1, 0, 1,
-0.4651254, -0.2158798, -2.159449, 0.3137255, 1, 0, 1,
-0.4642717, -0.2411393, -2.400821, 0.3098039, 1, 0, 1,
-0.4633754, 0.6645095, -0.6951315, 0.3019608, 1, 0, 1,
-0.4624492, -0.5393434, -2.700999, 0.2941177, 1, 0, 1,
-0.4598852, -0.6421805, -2.21419, 0.2901961, 1, 0, 1,
-0.4514168, 1.889264, -2.070915, 0.282353, 1, 0, 1,
-0.4398524, -0.4924948, -4.502967, 0.2784314, 1, 0, 1,
-0.4384297, -1.978148, -3.879187, 0.2705882, 1, 0, 1,
-0.4375879, -0.6598561, -2.772544, 0.2666667, 1, 0, 1,
-0.4341379, 0.7262344, -0.7190729, 0.2588235, 1, 0, 1,
-0.426015, 0.8719566, 0.8737863, 0.254902, 1, 0, 1,
-0.4235591, -0.7281734, -2.097877, 0.2470588, 1, 0, 1,
-0.4228653, 1.308236, 0.758015, 0.2431373, 1, 0, 1,
-0.4226438, 0.2860198, -2.198289, 0.2352941, 1, 0, 1,
-0.4199127, -1.713515, -3.954506, 0.2313726, 1, 0, 1,
-0.4188191, -0.1719628, -0.08724373, 0.2235294, 1, 0, 1,
-0.4158601, -0.6936094, -2.340691, 0.2196078, 1, 0, 1,
-0.4109631, 0.2094599, 0.8868599, 0.2117647, 1, 0, 1,
-0.4103891, 2.45943, 1.494425, 0.2078431, 1, 0, 1,
-0.4095332, -0.8321729, -2.000123, 0.2, 1, 0, 1,
-0.4095297, -0.1868617, -2.467833, 0.1921569, 1, 0, 1,
-0.4088973, -0.4468974, -1.731707, 0.1882353, 1, 0, 1,
-0.4072004, -0.4970991, -2.103213, 0.1803922, 1, 0, 1,
-0.4068044, -0.2034615, -2.897062, 0.1764706, 1, 0, 1,
-0.3980808, 0.4782056, -0.5514523, 0.1686275, 1, 0, 1,
-0.3975284, 0.3888047, 0.5951873, 0.1647059, 1, 0, 1,
-0.3932263, -0.4125811, -2.094013, 0.1568628, 1, 0, 1,
-0.389971, -0.4364401, -1.542819, 0.1529412, 1, 0, 1,
-0.389016, -1.29206, -3.369471, 0.145098, 1, 0, 1,
-0.3837048, -0.04605099, -2.744316, 0.1411765, 1, 0, 1,
-0.381924, -0.9071472, -3.39397, 0.1333333, 1, 0, 1,
-0.3812144, -0.3310421, -1.624558, 0.1294118, 1, 0, 1,
-0.3783492, 1.136051, -0.8887089, 0.1215686, 1, 0, 1,
-0.375437, -0.4751919, -2.685086, 0.1176471, 1, 0, 1,
-0.3752196, 0.1829468, -2.728811, 0.1098039, 1, 0, 1,
-0.3751831, -2.023376, -2.613064, 0.1058824, 1, 0, 1,
-0.3720373, -0.6245518, -2.052407, 0.09803922, 1, 0, 1,
-0.371238, -1.356573, -3.043537, 0.09019608, 1, 0, 1,
-0.365048, 0.00543765, -1.566865, 0.08627451, 1, 0, 1,
-0.3613699, -0.8691061, -2.666673, 0.07843138, 1, 0, 1,
-0.3597015, 2.642005, 0.447681, 0.07450981, 1, 0, 1,
-0.3550595, 0.04774111, -1.641991, 0.06666667, 1, 0, 1,
-0.3493887, 1.160786, 1.02798, 0.0627451, 1, 0, 1,
-0.3469253, -1.739291, -1.540251, 0.05490196, 1, 0, 1,
-0.3467666, 0.4357868, 0.5561237, 0.05098039, 1, 0, 1,
-0.3406586, 0.2834108, 0.1158771, 0.04313726, 1, 0, 1,
-0.3405575, -0.9484679, -2.150148, 0.03921569, 1, 0, 1,
-0.3402556, 2.485337, -0.9570656, 0.03137255, 1, 0, 1,
-0.3396522, -1.081267, -3.028495, 0.02745098, 1, 0, 1,
-0.3363186, 0.5345645, -1.634852, 0.01960784, 1, 0, 1,
-0.3358963, -1.97563, -2.297803, 0.01568628, 1, 0, 1,
-0.3350068, -2.986563, -1.68604, 0.007843138, 1, 0, 1,
-0.3347031, 0.4132135, 0.4995282, 0.003921569, 1, 0, 1,
-0.330961, -0.7663966, -2.779998, 0, 1, 0.003921569, 1,
-0.3294907, 0.629746, 1.008159, 0, 1, 0.01176471, 1,
-0.3293674, -1.149163, -3.792391, 0, 1, 0.01568628, 1,
-0.3287804, 1.444092, -1.699311, 0, 1, 0.02352941, 1,
-0.3274592, -0.4952171, -2.12641, 0, 1, 0.02745098, 1,
-0.3262662, 0.6573728, 1.644245, 0, 1, 0.03529412, 1,
-0.322784, 1.143784, 0.3771353, 0, 1, 0.03921569, 1,
-0.3216444, 0.06729871, -2.621465, 0, 1, 0.04705882, 1,
-0.3210895, 1.051769, 0.7995653, 0, 1, 0.05098039, 1,
-0.315719, -1.139141, -2.758821, 0, 1, 0.05882353, 1,
-0.3133829, -0.005867626, -2.345787, 0, 1, 0.0627451, 1,
-0.3111843, 1.059268, -1.46208, 0, 1, 0.07058824, 1,
-0.3094575, 0.2888036, -0.1729287, 0, 1, 0.07450981, 1,
-0.3060419, -0.4746666, -3.466725, 0, 1, 0.08235294, 1,
-0.3024196, 0.3037286, -1.404374, 0, 1, 0.08627451, 1,
-0.3013196, 0.8782123, -0.9062541, 0, 1, 0.09411765, 1,
-0.294145, 0.3423328, -1.598457, 0, 1, 0.1019608, 1,
-0.2940184, 0.04557448, -2.09643, 0, 1, 0.1058824, 1,
-0.2910608, 0.1195215, 0.1309679, 0, 1, 0.1137255, 1,
-0.2898348, 0.7166925, 0.8866406, 0, 1, 0.1176471, 1,
-0.2889363, 0.1559399, -0.3681155, 0, 1, 0.1254902, 1,
-0.2869934, -1.407855, -1.161574, 0, 1, 0.1294118, 1,
-0.2860186, 1.231649, -1.255468, 0, 1, 0.1372549, 1,
-0.2762879, -0.2112571, -2.181772, 0, 1, 0.1411765, 1,
-0.2753674, -0.4029211, -2.559157, 0, 1, 0.1490196, 1,
-0.2747785, 0.0233769, -1.362556, 0, 1, 0.1529412, 1,
-0.274342, -0.6477041, -1.108803, 0, 1, 0.1607843, 1,
-0.273084, 0.1329013, 0.7632694, 0, 1, 0.1647059, 1,
-0.2686059, 2.237335, -0.9483368, 0, 1, 0.172549, 1,
-0.2664005, -1.416109, -1.596709, 0, 1, 0.1764706, 1,
-0.2653812, 0.5603319, -0.3476295, 0, 1, 0.1843137, 1,
-0.2647346, 0.9366228, -0.7819772, 0, 1, 0.1882353, 1,
-0.2638659, -0.4112582, -3.09913, 0, 1, 0.1960784, 1,
-0.2625616, 0.5034423, 0.1649279, 0, 1, 0.2039216, 1,
-0.2598002, 1.427011, 1.612426, 0, 1, 0.2078431, 1,
-0.2590243, 0.03131403, -1.79146, 0, 1, 0.2156863, 1,
-0.2387618, -1.195434, -2.71436, 0, 1, 0.2196078, 1,
-0.2371351, -0.4698575, -2.75332, 0, 1, 0.227451, 1,
-0.2366256, -2.204897, -2.515659, 0, 1, 0.2313726, 1,
-0.2358474, 1.015397, -1.617433, 0, 1, 0.2392157, 1,
-0.2279045, -0.05916224, -2.445332, 0, 1, 0.2431373, 1,
-0.2276541, -0.3781174, -1.748345, 0, 1, 0.2509804, 1,
-0.2254691, 1.285343, -0.6429476, 0, 1, 0.254902, 1,
-0.225424, 1.046393, 0.9230252, 0, 1, 0.2627451, 1,
-0.2241938, 0.6922237, 0.5417325, 0, 1, 0.2666667, 1,
-0.2218486, -1.520411, -1.022338, 0, 1, 0.2745098, 1,
-0.2178414, -0.1930118, -2.775857, 0, 1, 0.2784314, 1,
-0.2142657, 0.9201554, 0.6146054, 0, 1, 0.2862745, 1,
-0.2102277, -0.5129816, -1.966731, 0, 1, 0.2901961, 1,
-0.2071457, -0.4971294, -1.364837, 0, 1, 0.2980392, 1,
-0.2067365, 0.2340963, -0.8254306, 0, 1, 0.3058824, 1,
-0.2026755, 1.062375, 0.288093, 0, 1, 0.3098039, 1,
-0.2024019, 0.02001162, -2.795521, 0, 1, 0.3176471, 1,
-0.2022528, 1.00414, -0.1923875, 0, 1, 0.3215686, 1,
-0.1988951, 0.9835306, -1.952623, 0, 1, 0.3294118, 1,
-0.1979131, -1.929109, -3.611639, 0, 1, 0.3333333, 1,
-0.1960953, 0.5985681, -0.5835766, 0, 1, 0.3411765, 1,
-0.190585, -1.240436, -1.482047, 0, 1, 0.345098, 1,
-0.1896602, -1.585539, -3.368632, 0, 1, 0.3529412, 1,
-0.1871526, -0.5262157, -3.187163, 0, 1, 0.3568628, 1,
-0.1869875, -0.4560207, -1.73846, 0, 1, 0.3647059, 1,
-0.1855541, -1.383881, -4.877722, 0, 1, 0.3686275, 1,
-0.1848529, -0.6315401, -1.444976, 0, 1, 0.3764706, 1,
-0.182839, 0.9652362, -0.8945695, 0, 1, 0.3803922, 1,
-0.1818324, -1.41536, -2.464032, 0, 1, 0.3882353, 1,
-0.179669, -0.2196577, -1.921462, 0, 1, 0.3921569, 1,
-0.1740385, -0.1864774, -0.8156986, 0, 1, 0.4, 1,
-0.1735936, 0.01696067, -1.262684, 0, 1, 0.4078431, 1,
-0.1720275, -0.6203458, -2.383759, 0, 1, 0.4117647, 1,
-0.1703401, -0.0995812, -2.311063, 0, 1, 0.4196078, 1,
-0.1673602, -1.168426, -3.522863, 0, 1, 0.4235294, 1,
-0.1634261, 0.4210812, -1.045667, 0, 1, 0.4313726, 1,
-0.1618717, 1.502669, 0.2743265, 0, 1, 0.4352941, 1,
-0.160667, 1.49273, 0.5843112, 0, 1, 0.4431373, 1,
-0.1605735, 0.9492366, -0.06021416, 0, 1, 0.4470588, 1,
-0.153921, 0.9123268, -0.5943316, 0, 1, 0.454902, 1,
-0.1523637, 0.7758247, -0.4255557, 0, 1, 0.4588235, 1,
-0.1460802, -0.6020316, -3.716856, 0, 1, 0.4666667, 1,
-0.1446299, -1.224405, -3.221921, 0, 1, 0.4705882, 1,
-0.1409269, -2.235538, -2.473956, 0, 1, 0.4784314, 1,
-0.1394081, -0.7750645, -0.6240532, 0, 1, 0.4823529, 1,
-0.1380413, 1.148158, -1.026511, 0, 1, 0.4901961, 1,
-0.1373018, -0.596464, -3.989149, 0, 1, 0.4941176, 1,
-0.1320511, -0.2281835, -2.611737, 0, 1, 0.5019608, 1,
-0.1244244, -0.2608667, -3.418688, 0, 1, 0.509804, 1,
-0.1235823, 0.2772706, -0.5835446, 0, 1, 0.5137255, 1,
-0.1170599, 1.025004, 0.4614616, 0, 1, 0.5215687, 1,
-0.09990349, 0.03872848, -0.2233477, 0, 1, 0.5254902, 1,
-0.09757836, 0.8508443, -0.1349787, 0, 1, 0.5333334, 1,
-0.09509233, 0.03089513, -1.729427, 0, 1, 0.5372549, 1,
-0.09449971, -0.2275522, -3.438869, 0, 1, 0.5450981, 1,
-0.09317876, -1.477735, -2.756238, 0, 1, 0.5490196, 1,
-0.09249201, -1.896796, -3.507899, 0, 1, 0.5568628, 1,
-0.09013283, -0.5969765, -2.582898, 0, 1, 0.5607843, 1,
-0.08964396, -1.01711, -3.059878, 0, 1, 0.5686275, 1,
-0.08952658, 0.1823135, -0.1365489, 0, 1, 0.572549, 1,
-0.0879776, -0.2901846, -2.467275, 0, 1, 0.5803922, 1,
-0.08786536, 0.4373098, 0.3027858, 0, 1, 0.5843138, 1,
-0.08521621, -0.5260311, -2.487002, 0, 1, 0.5921569, 1,
-0.08486834, -0.4969397, -1.335954, 0, 1, 0.5960785, 1,
-0.07954087, 0.7083212, -0.8407049, 0, 1, 0.6039216, 1,
-0.0767765, -0.7635284, -1.036102, 0, 1, 0.6117647, 1,
-0.07083789, -1.440578, -2.164551, 0, 1, 0.6156863, 1,
-0.07066379, -1.312053, -3.203306, 0, 1, 0.6235294, 1,
-0.07004515, 0.6699401, 0.6999867, 0, 1, 0.627451, 1,
-0.06255594, 3.400109, 0.2154292, 0, 1, 0.6352941, 1,
-0.06218021, -1.411811, -2.512048, 0, 1, 0.6392157, 1,
-0.05912218, -1.523798, -2.401956, 0, 1, 0.6470588, 1,
-0.05188801, 0.4805632, -0.6217191, 0, 1, 0.6509804, 1,
-0.05021657, -0.8201327, -2.732198, 0, 1, 0.6588235, 1,
-0.04246037, -1.865313, -2.91558, 0, 1, 0.6627451, 1,
-0.0406776, -0.8798608, -3.470405, 0, 1, 0.6705883, 1,
-0.04046881, 0.2501573, -0.7496091, 0, 1, 0.6745098, 1,
-0.03445855, 2.148853, -0.3245153, 0, 1, 0.682353, 1,
-0.03164246, 2.289781, 1.258319, 0, 1, 0.6862745, 1,
-0.03102666, 0.1576086, 0.4710636, 0, 1, 0.6941177, 1,
-0.0291499, -0.1468902, -3.598669, 0, 1, 0.7019608, 1,
-0.02798077, 0.3123306, -0.04552898, 0, 1, 0.7058824, 1,
-0.02553607, 1.080997, -0.03749503, 0, 1, 0.7137255, 1,
-0.0219657, -0.5034924, -2.67183, 0, 1, 0.7176471, 1,
-0.02134594, -1.062476, -3.23999, 0, 1, 0.7254902, 1,
-0.02126156, 0.4291652, -0.8235089, 0, 1, 0.7294118, 1,
-0.02048992, -0.2280239, -0.7328702, 0, 1, 0.7372549, 1,
-0.01920423, 0.9575272, 0.02444107, 0, 1, 0.7411765, 1,
-0.01227812, -0.3703713, -3.65804, 0, 1, 0.7490196, 1,
-0.0116121, -1.216553, -3.719049, 0, 1, 0.7529412, 1,
-0.009713843, 0.9598967, -0.09627753, 0, 1, 0.7607843, 1,
-0.002634914, -1.031797, -3.257646, 0, 1, 0.7647059, 1,
-0.002126555, -0.8644503, -2.691899, 0, 1, 0.772549, 1,
0.001086673, -1.206503, 3.363983, 0, 1, 0.7764706, 1,
0.006001726, 0.4752903, 0.4286143, 0, 1, 0.7843137, 1,
0.00620504, -1.099868, 4.76739, 0, 1, 0.7882353, 1,
0.007517506, 0.4969471, 0.4508243, 0, 1, 0.7960784, 1,
0.01192962, 1.272368, 0.5117731, 0, 1, 0.8039216, 1,
0.01664805, -0.3349419, 3.955959, 0, 1, 0.8078431, 1,
0.01993301, -0.9358487, 4.192128, 0, 1, 0.8156863, 1,
0.02170471, -0.7330782, 1.892585, 0, 1, 0.8196079, 1,
0.02247597, 0.2355337, 0.5067964, 0, 1, 0.827451, 1,
0.02624558, 0.6896817, -1.2669, 0, 1, 0.8313726, 1,
0.03080637, 0.2828104, 0.471627, 0, 1, 0.8392157, 1,
0.03245207, -0.1612387, 1.905588, 0, 1, 0.8431373, 1,
0.03328068, -1.389531, 3.706411, 0, 1, 0.8509804, 1,
0.0361529, 0.3827591, 0.715134, 0, 1, 0.854902, 1,
0.03958391, 0.03845382, 1.363064, 0, 1, 0.8627451, 1,
0.03999558, -0.2792587, 2.883764, 0, 1, 0.8666667, 1,
0.04140148, 2.787517, 0.1897032, 0, 1, 0.8745098, 1,
0.0466537, -0.2572832, 2.998583, 0, 1, 0.8784314, 1,
0.0469217, 1.05043, 1.600192, 0, 1, 0.8862745, 1,
0.04769104, -0.3366884, 4.40904, 0, 1, 0.8901961, 1,
0.04947186, 0.9105378, 1.654415, 0, 1, 0.8980392, 1,
0.05112525, -1.2033, 3.428147, 0, 1, 0.9058824, 1,
0.05949184, -1.387362, 6.152506, 0, 1, 0.9098039, 1,
0.05949931, 0.7103681, -0.1637228, 0, 1, 0.9176471, 1,
0.06295604, -2.097952, 2.539382, 0, 1, 0.9215686, 1,
0.0647879, -1.003946, 3.988138, 0, 1, 0.9294118, 1,
0.06687883, 2.245419, 0.8803473, 0, 1, 0.9333333, 1,
0.07095437, -0.9750785, 3.731029, 0, 1, 0.9411765, 1,
0.0738489, 1.31521, -0.09409952, 0, 1, 0.945098, 1,
0.07429022, 2.906381, -0.7043189, 0, 1, 0.9529412, 1,
0.07484379, -0.9837126, 3.820216, 0, 1, 0.9568627, 1,
0.08102369, -1.201768, 4.162567, 0, 1, 0.9647059, 1,
0.08121086, -1.572529, 2.371715, 0, 1, 0.9686275, 1,
0.08161794, -0.07870173, 2.461127, 0, 1, 0.9764706, 1,
0.09026031, -1.044933, 4.420465, 0, 1, 0.9803922, 1,
0.09154327, 2.522491, 0.7420247, 0, 1, 0.9882353, 1,
0.09332463, -1.777749, 3.013541, 0, 1, 0.9921569, 1,
0.0933473, 0.2611744, 0.6952514, 0, 1, 1, 1,
0.09546166, 1.098425, -1.179892, 0, 0.9921569, 1, 1,
0.09702447, 0.3190914, 0.511672, 0, 0.9882353, 1, 1,
0.09754587, -0.7099004, 1.472875, 0, 0.9803922, 1, 1,
0.1001552, 0.6382383, -0.7811261, 0, 0.9764706, 1, 1,
0.1021567, 0.7026609, 0.920208, 0, 0.9686275, 1, 1,
0.1026415, 0.548994, -0.5736862, 0, 0.9647059, 1, 1,
0.1030641, 0.9354035, -0.369252, 0, 0.9568627, 1, 1,
0.1050956, 0.9709416, 0.05781299, 0, 0.9529412, 1, 1,
0.1060204, -0.125629, 1.928475, 0, 0.945098, 1, 1,
0.1082491, -0.1743861, 1.871132, 0, 0.9411765, 1, 1,
0.1094467, 0.3629591, -1.559868, 0, 0.9333333, 1, 1,
0.1119959, 0.01317705, 0.4953362, 0, 0.9294118, 1, 1,
0.1122909, -0.8066853, 3.966082, 0, 0.9215686, 1, 1,
0.1144758, 1.013918, -1.602359, 0, 0.9176471, 1, 1,
0.1186991, 0.2945689, 0.697633, 0, 0.9098039, 1, 1,
0.1193326, 1.187062, -0.6657114, 0, 0.9058824, 1, 1,
0.1212031, 0.2291397, 0.9113621, 0, 0.8980392, 1, 1,
0.121669, -1.774243, 3.531795, 0, 0.8901961, 1, 1,
0.1243323, 1.885808, -0.2795153, 0, 0.8862745, 1, 1,
0.1247811, -0.5883844, 3.374199, 0, 0.8784314, 1, 1,
0.1295198, -0.5110355, 3.654041, 0, 0.8745098, 1, 1,
0.1315774, -0.3119969, 2.627583, 0, 0.8666667, 1, 1,
0.1348812, -1.052035, 3.627879, 0, 0.8627451, 1, 1,
0.1350866, -1.101335, 3.034083, 0, 0.854902, 1, 1,
0.1360205, -0.05485089, 3.87012, 0, 0.8509804, 1, 1,
0.1361795, 0.7553777, -0.02788279, 0, 0.8431373, 1, 1,
0.143661, -0.1015608, 1.328953, 0, 0.8392157, 1, 1,
0.1442574, -1.443441, 3.060597, 0, 0.8313726, 1, 1,
0.1446529, -1.304619, 3.61251, 0, 0.827451, 1, 1,
0.145683, -0.5857707, 2.741683, 0, 0.8196079, 1, 1,
0.1459728, -0.9780929, 2.793447, 0, 0.8156863, 1, 1,
0.1460446, -0.4305843, 2.508584, 0, 0.8078431, 1, 1,
0.1464636, 1.022781, -1.231733, 0, 0.8039216, 1, 1,
0.1467025, -0.8437197, 3.658959, 0, 0.7960784, 1, 1,
0.1475997, 0.7468455, 2.619756, 0, 0.7882353, 1, 1,
0.1479726, 1.430312, 1.488685, 0, 0.7843137, 1, 1,
0.1526963, 0.8326405, -0.6732394, 0, 0.7764706, 1, 1,
0.155542, -0.530309, 2.691289, 0, 0.772549, 1, 1,
0.1580754, -0.1218135, 2.060597, 0, 0.7647059, 1, 1,
0.1587158, 0.7580692, 0.701965, 0, 0.7607843, 1, 1,
0.1605474, -3.110454, 2.579034, 0, 0.7529412, 1, 1,
0.1624206, -0.5471179, 2.762714, 0, 0.7490196, 1, 1,
0.1627521, -0.7337652, 2.561967, 0, 0.7411765, 1, 1,
0.163583, 0.5363246, 0.1262602, 0, 0.7372549, 1, 1,
0.1662567, 0.7700394, -0.1766524, 0, 0.7294118, 1, 1,
0.1662801, -1.294935, 3.393385, 0, 0.7254902, 1, 1,
0.1667375, -0.7740312, 2.597508, 0, 0.7176471, 1, 1,
0.1668143, 0.9282197, 1.068422, 0, 0.7137255, 1, 1,
0.1691414, -0.314818, 2.599344, 0, 0.7058824, 1, 1,
0.1691544, 0.7868601, -0.7013593, 0, 0.6980392, 1, 1,
0.176196, 0.03726029, 0.9922561, 0, 0.6941177, 1, 1,
0.1766228, -1.709456, 2.427948, 0, 0.6862745, 1, 1,
0.1802837, 0.2347292, 1.046633, 0, 0.682353, 1, 1,
0.1860109, 1.60832, 0.8784578, 0, 0.6745098, 1, 1,
0.1869316, 0.2559091, 1.47634, 0, 0.6705883, 1, 1,
0.1939203, 0.1141771, 0.6493986, 0, 0.6627451, 1, 1,
0.1983436, 1.1891, -0.6119484, 0, 0.6588235, 1, 1,
0.1992801, -0.1624123, 1.304252, 0, 0.6509804, 1, 1,
0.2035889, -0.5959787, 2.219047, 0, 0.6470588, 1, 1,
0.2064804, -1.059775, 1.092671, 0, 0.6392157, 1, 1,
0.2073154, -0.3612998, 1.304218, 0, 0.6352941, 1, 1,
0.207439, -0.4255871, 1.852423, 0, 0.627451, 1, 1,
0.2084467, -0.09609988, 1.110451, 0, 0.6235294, 1, 1,
0.2109307, -0.27522, 2.248817, 0, 0.6156863, 1, 1,
0.210947, -0.9508566, 3.119798, 0, 0.6117647, 1, 1,
0.2136437, -0.881231, 1.545089, 0, 0.6039216, 1, 1,
0.2148067, -0.9598281, 3.269456, 0, 0.5960785, 1, 1,
0.2159161, -1.019456, 3.765136, 0, 0.5921569, 1, 1,
0.2163789, 0.936513, 1.101469, 0, 0.5843138, 1, 1,
0.2175944, 0.3417187, 0.9853132, 0, 0.5803922, 1, 1,
0.2194867, -1.46195, 1.073738, 0, 0.572549, 1, 1,
0.2217786, 1.066428, -0.3945827, 0, 0.5686275, 1, 1,
0.2221889, -1.178721, 2.651122, 0, 0.5607843, 1, 1,
0.2226202, -0.6563762, 2.454667, 0, 0.5568628, 1, 1,
0.2238702, 0.01702782, 2.919017, 0, 0.5490196, 1, 1,
0.2301672, 0.7287431, 3.669551, 0, 0.5450981, 1, 1,
0.2321422, -1.855762, 2.358665, 0, 0.5372549, 1, 1,
0.241133, 1.653484, -0.01880449, 0, 0.5333334, 1, 1,
0.2432731, 0.598088, 1.796018, 0, 0.5254902, 1, 1,
0.2458326, 0.5836317, 0.6684455, 0, 0.5215687, 1, 1,
0.2499441, -0.4333878, 0.3430477, 0, 0.5137255, 1, 1,
0.2534973, -0.1358616, 1.401293, 0, 0.509804, 1, 1,
0.2597416, 0.2050636, 1.308493, 0, 0.5019608, 1, 1,
0.2686264, -1.286356, 3.367341, 0, 0.4941176, 1, 1,
0.2697844, -0.09027858, 2.799088, 0, 0.4901961, 1, 1,
0.2720288, 2.095865, -0.2085947, 0, 0.4823529, 1, 1,
0.2789647, -1.135048, 4.110192, 0, 0.4784314, 1, 1,
0.2804732, 1.206797, -0.7716946, 0, 0.4705882, 1, 1,
0.2810763, 0.7960901, -1.371578, 0, 0.4666667, 1, 1,
0.2813898, -0.1278397, 2.267455, 0, 0.4588235, 1, 1,
0.282498, -0.8964094, 2.016901, 0, 0.454902, 1, 1,
0.2865377, -1.250046, 3.926984, 0, 0.4470588, 1, 1,
0.2922605, -0.3188474, 3.716683, 0, 0.4431373, 1, 1,
0.292406, 0.1729183, 1.330354, 0, 0.4352941, 1, 1,
0.2952005, -2.067931, 1.976247, 0, 0.4313726, 1, 1,
0.295821, -0.9218715, 3.366616, 0, 0.4235294, 1, 1,
0.300437, -0.6114787, 3.863824, 0, 0.4196078, 1, 1,
0.3021843, 1.37075, -0.1921511, 0, 0.4117647, 1, 1,
0.3026524, 0.7084782, 0.3292277, 0, 0.4078431, 1, 1,
0.3104077, -2.210479, 3.866061, 0, 0.4, 1, 1,
0.3111483, -0.959924, 2.527276, 0, 0.3921569, 1, 1,
0.3123604, 0.5330362, 1.07642, 0, 0.3882353, 1, 1,
0.3162404, -0.967361, 2.33896, 0, 0.3803922, 1, 1,
0.3171228, 1.011122, 0.3617563, 0, 0.3764706, 1, 1,
0.3230079, 0.9114366, 1.365323, 0, 0.3686275, 1, 1,
0.3300649, 0.2623487, 2.098931, 0, 0.3647059, 1, 1,
0.3376568, -1.311939, 2.494278, 0, 0.3568628, 1, 1,
0.3388748, -0.5160968, 2.94288, 0, 0.3529412, 1, 1,
0.3390443, -0.5837214, 2.912521, 0, 0.345098, 1, 1,
0.340178, -0.01738955, 2.085975, 0, 0.3411765, 1, 1,
0.3411261, -1.449791, 4.098035, 0, 0.3333333, 1, 1,
0.3433724, -0.5320629, 3.302602, 0, 0.3294118, 1, 1,
0.3449728, -2.141152, 2.330193, 0, 0.3215686, 1, 1,
0.3449846, -0.9920343, 2.789475, 0, 0.3176471, 1, 1,
0.3463344, 0.2380438, 0.7434652, 0, 0.3098039, 1, 1,
0.3538944, -1.345687, 3.343466, 0, 0.3058824, 1, 1,
0.3591732, -0.6568677, 3.878966, 0, 0.2980392, 1, 1,
0.3784906, 0.005887279, 1.31849, 0, 0.2901961, 1, 1,
0.379388, -0.3107947, 1.11666, 0, 0.2862745, 1, 1,
0.3809251, -1.284049, 5.057923, 0, 0.2784314, 1, 1,
0.3819071, -0.5344986, 2.132985, 0, 0.2745098, 1, 1,
0.3906929, -0.00328013, 2.911458, 0, 0.2666667, 1, 1,
0.3916771, -3.00563, 2.961541, 0, 0.2627451, 1, 1,
0.3917963, -0.4998055, 1.59458, 0, 0.254902, 1, 1,
0.3937307, -0.8256418, 2.423275, 0, 0.2509804, 1, 1,
0.3944, -1.466817, 1.680548, 0, 0.2431373, 1, 1,
0.3946028, 0.1847787, 1.408767, 0, 0.2392157, 1, 1,
0.3955237, -1.624113, 2.606196, 0, 0.2313726, 1, 1,
0.4035113, -0.2715888, 3.271818, 0, 0.227451, 1, 1,
0.4035467, -0.2885463, 2.821327, 0, 0.2196078, 1, 1,
0.403983, 0.6484279, 0.2806001, 0, 0.2156863, 1, 1,
0.4043395, -0.217995, 0.5560334, 0, 0.2078431, 1, 1,
0.4075849, 0.3108202, 1.288579, 0, 0.2039216, 1, 1,
0.4101003, 2.590082, 1.41862, 0, 0.1960784, 1, 1,
0.4130433, 0.2168025, 2.672945, 0, 0.1882353, 1, 1,
0.4137442, 1.342656, 1.292017, 0, 0.1843137, 1, 1,
0.4162191, 0.99969, 2.356706, 0, 0.1764706, 1, 1,
0.4175591, -0.3193408, 2.612865, 0, 0.172549, 1, 1,
0.4184569, 0.9262443, 0.5712303, 0, 0.1647059, 1, 1,
0.4214181, -0.1180227, 1.012695, 0, 0.1607843, 1, 1,
0.4255229, -0.5366009, 1.864443, 0, 0.1529412, 1, 1,
0.4285321, 0.1265044, 0.5934436, 0, 0.1490196, 1, 1,
0.4291598, -0.7912368, 2.742297, 0, 0.1411765, 1, 1,
0.4315887, -0.8865411, 0.416094, 0, 0.1372549, 1, 1,
0.4318585, 0.1698963, 2.634062, 0, 0.1294118, 1, 1,
0.43332, -0.4668573, 3.131059, 0, 0.1254902, 1, 1,
0.4337201, -0.8591176, 4.378775, 0, 0.1176471, 1, 1,
0.4349581, 0.4483687, 0.6853951, 0, 0.1137255, 1, 1,
0.4367046, -1.035072, 2.72318, 0, 0.1058824, 1, 1,
0.4367756, 1.698672, 0.7165892, 0, 0.09803922, 1, 1,
0.4414293, 0.208818, 0.5935046, 0, 0.09411765, 1, 1,
0.441577, -0.9572458, 2.286871, 0, 0.08627451, 1, 1,
0.4434306, -0.2104634, 2.540652, 0, 0.08235294, 1, 1,
0.4448034, 1.659659, -2.198705, 0, 0.07450981, 1, 1,
0.4464651, -0.3815689, 2.462163, 0, 0.07058824, 1, 1,
0.450699, 1.644988, 0.8234602, 0, 0.0627451, 1, 1,
0.4580947, -0.0533273, 1.204805, 0, 0.05882353, 1, 1,
0.459523, 1.152833, 1.959844, 0, 0.05098039, 1, 1,
0.4599031, 1.676776, -0.6073729, 0, 0.04705882, 1, 1,
0.4616529, -1.233398, 4.641431, 0, 0.03921569, 1, 1,
0.4642959, -0.8563667, 1.965525, 0, 0.03529412, 1, 1,
0.4658753, -0.411818, 3.189691, 0, 0.02745098, 1, 1,
0.4686736, -0.7177867, 1.072347, 0, 0.02352941, 1, 1,
0.4694082, 1.737251, 0.9166828, 0, 0.01568628, 1, 1,
0.4780656, -0.6424271, 3.86019, 0, 0.01176471, 1, 1,
0.4806681, 0.395546, 0.4471591, 0, 0.003921569, 1, 1,
0.4836287, -0.7704247, 1.815148, 0.003921569, 0, 1, 1,
0.4862823, -0.9442587, 1.336098, 0.007843138, 0, 1, 1,
0.4956239, 1.490347, 1.320402, 0.01568628, 0, 1, 1,
0.4988662, 0.357474, 1.034849, 0.01960784, 0, 1, 1,
0.4992861, -2.223082, 3.901421, 0.02745098, 0, 1, 1,
0.500044, -1.036085, 3.334715, 0.03137255, 0, 1, 1,
0.5024219, 0.7466254, 1.759516, 0.03921569, 0, 1, 1,
0.5024554, 2.100522, -1.154589, 0.04313726, 0, 1, 1,
0.5078411, 2.096316, 1.682761, 0.05098039, 0, 1, 1,
0.5082161, 0.182997, 2.082968, 0.05490196, 0, 1, 1,
0.5083502, 0.096441, 0.2150373, 0.0627451, 0, 1, 1,
0.5091321, -0.2964652, 0.9050662, 0.06666667, 0, 1, 1,
0.5197865, -1.349942, 3.169308, 0.07450981, 0, 1, 1,
0.5344728, 0.1124453, 0.556797, 0.07843138, 0, 1, 1,
0.5346505, -0.6516578, 3.2789, 0.08627451, 0, 1, 1,
0.5368339, -0.8856507, 3.411499, 0.09019608, 0, 1, 1,
0.5420646, -0.7181078, 2.651958, 0.09803922, 0, 1, 1,
0.5431792, -1.509071, 2.55319, 0.1058824, 0, 1, 1,
0.5432658, -1.456883, 2.41245, 0.1098039, 0, 1, 1,
0.5451334, -0.275644, 1.029836, 0.1176471, 0, 1, 1,
0.5568925, -1.912582, 2.648477, 0.1215686, 0, 1, 1,
0.5596856, -0.2436199, 2.542306, 0.1294118, 0, 1, 1,
0.5605421, 0.5972065, 0.5562161, 0.1333333, 0, 1, 1,
0.5626123, -0.1300334, 0.4031675, 0.1411765, 0, 1, 1,
0.5658365, 0.1513318, 1.704596, 0.145098, 0, 1, 1,
0.5697966, 0.272271, 3.704677, 0.1529412, 0, 1, 1,
0.5729331, -1.165145, 1.676704, 0.1568628, 0, 1, 1,
0.5729403, 0.5157976, 0.4602574, 0.1647059, 0, 1, 1,
0.5780334, -1.067115, 3.384654, 0.1686275, 0, 1, 1,
0.5787976, -0.8991308, 3.389861, 0.1764706, 0, 1, 1,
0.5819142, 0.8393377, 1.64409, 0.1803922, 0, 1, 1,
0.5860714, -0.4283801, 2.667526, 0.1882353, 0, 1, 1,
0.5873086, 0.3397079, -0.06862888, 0.1921569, 0, 1, 1,
0.5873627, 0.9734503, 1.118846, 0.2, 0, 1, 1,
0.5930189, -0.2566198, 3.244659, 0.2078431, 0, 1, 1,
0.5937679, -1.744012, 2.397144, 0.2117647, 0, 1, 1,
0.597032, -1.062026, 3.194211, 0.2196078, 0, 1, 1,
0.5989724, -1.633282, 4.362574, 0.2235294, 0, 1, 1,
0.6020097, 0.2603874, 3.722836, 0.2313726, 0, 1, 1,
0.6041419, -1.11338, 2.801394, 0.2352941, 0, 1, 1,
0.608932, 1.950993, 0.2054764, 0.2431373, 0, 1, 1,
0.6126182, 1.200403, -0.7261117, 0.2470588, 0, 1, 1,
0.6160049, -1.419131, 3.742173, 0.254902, 0, 1, 1,
0.6165523, 0.7212427, 0.008527566, 0.2588235, 0, 1, 1,
0.6192768, 0.7948882, 0.4274915, 0.2666667, 0, 1, 1,
0.6215317, -0.06379443, 0.5101472, 0.2705882, 0, 1, 1,
0.6217902, 1.78344, 0.6868697, 0.2784314, 0, 1, 1,
0.6231639, -0.6210263, 1.16092, 0.282353, 0, 1, 1,
0.6236634, -0.2911695, 2.88233, 0.2901961, 0, 1, 1,
0.6262284, 1.529193, -0.9244134, 0.2941177, 0, 1, 1,
0.6279253, -0.2553714, 0.5684262, 0.3019608, 0, 1, 1,
0.6294601, 0.8617014, 0.03884912, 0.3098039, 0, 1, 1,
0.6327413, -0.1401594, 2.348839, 0.3137255, 0, 1, 1,
0.6327512, 1.006319, -0.4166014, 0.3215686, 0, 1, 1,
0.634869, 1.40481, -0.940913, 0.3254902, 0, 1, 1,
0.6398997, 0.754302, 1.913481, 0.3333333, 0, 1, 1,
0.6441598, -0.6467813, 1.193434, 0.3372549, 0, 1, 1,
0.646512, 0.1724281, 1.518428, 0.345098, 0, 1, 1,
0.6537032, -0.9944544, 0.7682498, 0.3490196, 0, 1, 1,
0.6627648, 1.881325, 0.09399593, 0.3568628, 0, 1, 1,
0.6631359, -1.1097, 2.273529, 0.3607843, 0, 1, 1,
0.6647318, 0.2452458, 0.4849807, 0.3686275, 0, 1, 1,
0.6680675, -1.184965, 2.030019, 0.372549, 0, 1, 1,
0.671178, -0.4320161, 0.919274, 0.3803922, 0, 1, 1,
0.6722544, -1.065448, 0.680315, 0.3843137, 0, 1, 1,
0.6727273, -0.1712625, 1.819915, 0.3921569, 0, 1, 1,
0.6727911, 0.3489804, 2.973468, 0.3960784, 0, 1, 1,
0.673115, -1.097044, 4.653756, 0.4039216, 0, 1, 1,
0.6771337, 0.2854488, 0.9026876, 0.4117647, 0, 1, 1,
0.6826528, 0.07449228, 3.386027, 0.4156863, 0, 1, 1,
0.6938521, -0.8427176, 2.216456, 0.4235294, 0, 1, 1,
0.6938838, 0.4469104, 0.6939017, 0.427451, 0, 1, 1,
0.6946102, -1.169785, 2.445354, 0.4352941, 0, 1, 1,
0.6960263, 0.5239719, 1.927753, 0.4392157, 0, 1, 1,
0.6961723, 0.7486743, 0.2705677, 0.4470588, 0, 1, 1,
0.6964335, -0.2121455, 1.742031, 0.4509804, 0, 1, 1,
0.6986906, -2.284536, 4.490638, 0.4588235, 0, 1, 1,
0.6990876, -0.6432387, 2.290267, 0.4627451, 0, 1, 1,
0.7004146, -0.6019479, 4.094051, 0.4705882, 0, 1, 1,
0.7040265, 1.731827, 1.63689, 0.4745098, 0, 1, 1,
0.70977, -2.417974, 4.604854, 0.4823529, 0, 1, 1,
0.7179172, 0.8822236, -0.2613432, 0.4862745, 0, 1, 1,
0.719901, -1.112389, 4.582966, 0.4941176, 0, 1, 1,
0.7218816, 2.087503, 0.4199809, 0.5019608, 0, 1, 1,
0.7257714, -0.749137, 2.786417, 0.5058824, 0, 1, 1,
0.7259212, -0.1114629, 2.068265, 0.5137255, 0, 1, 1,
0.7279463, -0.6674653, 1.505059, 0.5176471, 0, 1, 1,
0.7306062, 2.014738, -0.6335572, 0.5254902, 0, 1, 1,
0.7381772, 0.7720565, -0.2773561, 0.5294118, 0, 1, 1,
0.7408924, -0.8493322, 3.394761, 0.5372549, 0, 1, 1,
0.7417628, 1.026115, 1.354925, 0.5411765, 0, 1, 1,
0.7433805, 0.02829325, 1.317548, 0.5490196, 0, 1, 1,
0.7578278, 1.117138, 0.9580852, 0.5529412, 0, 1, 1,
0.758152, 1.68875, -0.08120069, 0.5607843, 0, 1, 1,
0.7628711, 0.09688546, 2.724021, 0.5647059, 0, 1, 1,
0.7701721, 0.6097761, -0.4787087, 0.572549, 0, 1, 1,
0.7711796, -0.5350052, 2.273344, 0.5764706, 0, 1, 1,
0.7718745, -0.6146799, 2.29076, 0.5843138, 0, 1, 1,
0.7871175, -1.399848, 2.886035, 0.5882353, 0, 1, 1,
0.7929109, 0.5875706, 1.8778, 0.5960785, 0, 1, 1,
0.7930128, -1.134217, 2.183736, 0.6039216, 0, 1, 1,
0.7931379, 1.048906, -0.9792647, 0.6078432, 0, 1, 1,
0.7935579, -1.02287, 4.63564, 0.6156863, 0, 1, 1,
0.794094, 0.979488, 0.8729938, 0.6196079, 0, 1, 1,
0.8118057, 0.7489136, 0.3010471, 0.627451, 0, 1, 1,
0.8119949, 0.1639429, 0.104649, 0.6313726, 0, 1, 1,
0.8184845, 1.374246, 1.159384, 0.6392157, 0, 1, 1,
0.8229901, -1.223639, 4.494785, 0.6431373, 0, 1, 1,
0.8252599, 2.854055, 1.42893, 0.6509804, 0, 1, 1,
0.8274709, 0.0550536, 1.512729, 0.654902, 0, 1, 1,
0.8290054, 1.324791, -1.083116, 0.6627451, 0, 1, 1,
0.8438786, 1.879297, -0.4017833, 0.6666667, 0, 1, 1,
0.8449794, 1.098145, 0.369753, 0.6745098, 0, 1, 1,
0.8502998, -0.289218, 0.9100521, 0.6784314, 0, 1, 1,
0.8520299, -0.05299345, 2.685165, 0.6862745, 0, 1, 1,
0.8525167, 0.7082679, 0.7727888, 0.6901961, 0, 1, 1,
0.8588824, 0.6181508, 1.054133, 0.6980392, 0, 1, 1,
0.8656904, 0.1066531, 0.522161, 0.7058824, 0, 1, 1,
0.8659326, 0.2749741, 1.012578, 0.7098039, 0, 1, 1,
0.8665438, -0.2674667, 2.362016, 0.7176471, 0, 1, 1,
0.8777562, -0.04664597, 1.910759, 0.7215686, 0, 1, 1,
0.8808569, -0.3985149, 2.252796, 0.7294118, 0, 1, 1,
0.8926565, 0.4333536, 1.707198, 0.7333333, 0, 1, 1,
0.8930183, 0.2347973, 2.031467, 0.7411765, 0, 1, 1,
0.8947523, -0.7986171, 1.610986, 0.7450981, 0, 1, 1,
0.8967919, -1.346725, 3.011582, 0.7529412, 0, 1, 1,
0.9046665, 0.1280479, 0.9664491, 0.7568628, 0, 1, 1,
0.911244, -0.4001262, 2.338071, 0.7647059, 0, 1, 1,
0.9174902, -0.7233354, 5.156647, 0.7686275, 0, 1, 1,
0.919235, 0.06313743, 2.019754, 0.7764706, 0, 1, 1,
0.9281645, 0.2355591, 1.16285, 0.7803922, 0, 1, 1,
0.9295753, -0.5437704, 1.625935, 0.7882353, 0, 1, 1,
0.9312249, -0.3133791, 1.195801, 0.7921569, 0, 1, 1,
0.9331785, -0.9366336, 3.43717, 0.8, 0, 1, 1,
0.942577, -0.5763488, 3.524856, 0.8078431, 0, 1, 1,
0.9431689, -1.284177, 1.960895, 0.8117647, 0, 1, 1,
0.9440639, -1.214757, 4.085287, 0.8196079, 0, 1, 1,
0.9441805, 0.8343993, -1.403208, 0.8235294, 0, 1, 1,
0.9460471, 0.2647397, -0.4925827, 0.8313726, 0, 1, 1,
0.9519596, 1.281786, 0.4779284, 0.8352941, 0, 1, 1,
0.9578765, 1.185106, 0.3344462, 0.8431373, 0, 1, 1,
0.9616713, -0.5719686, 2.77681, 0.8470588, 0, 1, 1,
0.966812, -1.481508, 3.807749, 0.854902, 0, 1, 1,
0.9678533, -1.159509, 2.979811, 0.8588235, 0, 1, 1,
0.9726613, 0.4760035, -0.8602688, 0.8666667, 0, 1, 1,
0.9736973, 0.8304314, 1.616348, 0.8705882, 0, 1, 1,
0.9752134, 1.786817, 0.8951633, 0.8784314, 0, 1, 1,
0.9752833, -0.596607, 1.151924, 0.8823529, 0, 1, 1,
0.9849923, 0.401545, -0.8439171, 0.8901961, 0, 1, 1,
0.9882309, -0.04479021, 1.987705, 0.8941177, 0, 1, 1,
0.9911133, -0.5066867, 0.2331276, 0.9019608, 0, 1, 1,
0.9944391, 1.387506, 0.5826125, 0.9098039, 0, 1, 1,
0.9958808, 0.5908817, 0.2591789, 0.9137255, 0, 1, 1,
0.997767, 0.3246179, 1.368044, 0.9215686, 0, 1, 1,
0.9994719, -2.386791, 1.174449, 0.9254902, 0, 1, 1,
1.001729, -1.49176, 4.468066, 0.9333333, 0, 1, 1,
1.004452, -0.146787, 2.927666, 0.9372549, 0, 1, 1,
1.006571, 1.595805, 1.108122, 0.945098, 0, 1, 1,
1.009016, -0.191233, 1.182357, 0.9490196, 0, 1, 1,
1.010668, 0.4919414, 1.783397, 0.9568627, 0, 1, 1,
1.012287, 0.5716892, 1.174684, 0.9607843, 0, 1, 1,
1.012297, 0.1214168, 1.033371, 0.9686275, 0, 1, 1,
1.01662, 1.627758, 1.256278, 0.972549, 0, 1, 1,
1.017683, -0.499631, 2.23623, 0.9803922, 0, 1, 1,
1.022135, -1.588605, 1.583437, 0.9843137, 0, 1, 1,
1.026662, -0.642622, 2.087272, 0.9921569, 0, 1, 1,
1.039532, -0.3177118, 2.341276, 0.9960784, 0, 1, 1,
1.040257, -0.5479228, 0.5827691, 1, 0, 0.9960784, 1,
1.042103, 1.58184, 0.5455974, 1, 0, 0.9882353, 1,
1.045908, -0.632218, 1.559214, 1, 0, 0.9843137, 1,
1.047104, 0.3850651, 2.031754, 1, 0, 0.9764706, 1,
1.050208, 2.292612, 0.2119396, 1, 0, 0.972549, 1,
1.053567, 0.9186692, 0.4650759, 1, 0, 0.9647059, 1,
1.067956, 0.9357078, 2.030068, 1, 0, 0.9607843, 1,
1.069751, -0.4355868, 0.9852294, 1, 0, 0.9529412, 1,
1.076999, 2.35679, 1.135415, 1, 0, 0.9490196, 1,
1.080895, -0.8890837, 1.820716, 1, 0, 0.9411765, 1,
1.090975, 0.2661878, 1.581671, 1, 0, 0.9372549, 1,
1.092202, -1.086397, 1.482481, 1, 0, 0.9294118, 1,
1.093896, 1.086718, 2.357934, 1, 0, 0.9254902, 1,
1.095949, 0.8823262, 0.9421806, 1, 0, 0.9176471, 1,
1.103261, 1.376525, -0.1512325, 1, 0, 0.9137255, 1,
1.110537, -0.365234, 0.5407984, 1, 0, 0.9058824, 1,
1.119457, 0.3030501, 0.6873866, 1, 0, 0.9019608, 1,
1.122065, 0.883533, 1.31679, 1, 0, 0.8941177, 1,
1.124229, 1.999142, 1.177289, 1, 0, 0.8862745, 1,
1.124686, -0.273505, 3.495977, 1, 0, 0.8823529, 1,
1.124889, 0.6458929, 1.359612, 1, 0, 0.8745098, 1,
1.12754, -1.4655, 1.798601, 1, 0, 0.8705882, 1,
1.133242, 0.3466616, 1.744131, 1, 0, 0.8627451, 1,
1.137248, 1.313378, 2.079803, 1, 0, 0.8588235, 1,
1.137871, -0.5812492, 0.7553907, 1, 0, 0.8509804, 1,
1.145938, -0.2712793, 1.624086, 1, 0, 0.8470588, 1,
1.147609, 0.8239276, 0.5145463, 1, 0, 0.8392157, 1,
1.156525, -0.5612979, -0.230086, 1, 0, 0.8352941, 1,
1.168431, -0.1371025, 2.657101, 1, 0, 0.827451, 1,
1.168617, 0.1284494, 1.456123, 1, 0, 0.8235294, 1,
1.171001, -1.432271, 2.828558, 1, 0, 0.8156863, 1,
1.179574, 0.1537773, 0.5964567, 1, 0, 0.8117647, 1,
1.18501, 0.7958276, 1.486258, 1, 0, 0.8039216, 1,
1.185747, -0.371987, 2.911764, 1, 0, 0.7960784, 1,
1.187686, 0.6105145, 0.1809747, 1, 0, 0.7921569, 1,
1.187974, -2.218791, 4.114153, 1, 0, 0.7843137, 1,
1.19786, -0.6438898, 0.6450511, 1, 0, 0.7803922, 1,
1.201246, 0.1483797, 1.371478, 1, 0, 0.772549, 1,
1.20274, 0.01273276, 1.181974, 1, 0, 0.7686275, 1,
1.205128, 1.750399, 0.6505226, 1, 0, 0.7607843, 1,
1.209163, -0.3854499, 2.985667, 1, 0, 0.7568628, 1,
1.21272, 0.8691345, -0.2358667, 1, 0, 0.7490196, 1,
1.21906, -1.327815, 3.38602, 1, 0, 0.7450981, 1,
1.238617, 1.509985, 0.5266346, 1, 0, 0.7372549, 1,
1.240348, 0.3580957, 0.4936346, 1, 0, 0.7333333, 1,
1.240606, 0.1597896, 2.792515, 1, 0, 0.7254902, 1,
1.25288, -0.8487031, 2.841566, 1, 0, 0.7215686, 1,
1.254475, 0.8715114, 1.632478, 1, 0, 0.7137255, 1,
1.254489, -0.2502061, 1.288979, 1, 0, 0.7098039, 1,
1.254546, 0.5045213, 0.421237, 1, 0, 0.7019608, 1,
1.256471, -0.4754974, 2.09721, 1, 0, 0.6941177, 1,
1.258391, 0.1027594, 2.107862, 1, 0, 0.6901961, 1,
1.258749, 0.1882322, 3.299805, 1, 0, 0.682353, 1,
1.262836, 0.06235223, 2.880648, 1, 0, 0.6784314, 1,
1.264282, -0.04360093, 1.334072, 1, 0, 0.6705883, 1,
1.269389, -0.01533058, 1.407858, 1, 0, 0.6666667, 1,
1.27422, 0.01391025, 2.32481, 1, 0, 0.6588235, 1,
1.275545, -0.9389874, 3.184402, 1, 0, 0.654902, 1,
1.282894, -1.047916, 2.107903, 1, 0, 0.6470588, 1,
1.288247, -1.681778, 2.770376, 1, 0, 0.6431373, 1,
1.28875, -1.169788, 1.531676, 1, 0, 0.6352941, 1,
1.292999, -0.6123077, 2.133927, 1, 0, 0.6313726, 1,
1.295969, 0.4665676, 1.077713, 1, 0, 0.6235294, 1,
1.301532, 0.4622544, 2.601887, 1, 0, 0.6196079, 1,
1.301719, 0.08179365, 1.849813, 1, 0, 0.6117647, 1,
1.302428, -1.21604, 4.109513, 1, 0, 0.6078432, 1,
1.308483, 0.339595, -0.7600923, 1, 0, 0.6, 1,
1.310959, -0.7540551, 2.844078, 1, 0, 0.5921569, 1,
1.316775, -0.2390257, 0.408706, 1, 0, 0.5882353, 1,
1.317411, -0.02925313, 1.6702, 1, 0, 0.5803922, 1,
1.322452, -0.8447295, 2.895744, 1, 0, 0.5764706, 1,
1.327561, 0.8487195, 1.726166, 1, 0, 0.5686275, 1,
1.328225, 0.5640214, 0.5316665, 1, 0, 0.5647059, 1,
1.332376, 0.1386275, 1.150113, 1, 0, 0.5568628, 1,
1.334097, 0.5094874, 0.1102126, 1, 0, 0.5529412, 1,
1.340712, -0.6617495, 3.627585, 1, 0, 0.5450981, 1,
1.341376, 1.073643, 1.666334, 1, 0, 0.5411765, 1,
1.341986, -0.9039866, 1.409277, 1, 0, 0.5333334, 1,
1.356533, -1.376492, 1.989554, 1, 0, 0.5294118, 1,
1.367384, 1.13924, 0.0287572, 1, 0, 0.5215687, 1,
1.387771, -0.9168764, 1.676614, 1, 0, 0.5176471, 1,
1.389279, -2.151812, 2.283805, 1, 0, 0.509804, 1,
1.39007, 0.9155462, 0.5950001, 1, 0, 0.5058824, 1,
1.395223, 0.1309226, 0.912052, 1, 0, 0.4980392, 1,
1.398613, 0.2343518, 0.6359768, 1, 0, 0.4901961, 1,
1.398939, -1.704971, 2.930124, 1, 0, 0.4862745, 1,
1.406333, 0.702187, 1.29108, 1, 0, 0.4784314, 1,
1.408991, -1.502423, 2.60891, 1, 0, 0.4745098, 1,
1.410424, -0.364557, 1.613084, 1, 0, 0.4666667, 1,
1.412546, 0.868331, 2.073924, 1, 0, 0.4627451, 1,
1.417828, -1.059525, 0.8872926, 1, 0, 0.454902, 1,
1.422127, 0.4314819, 2.670667, 1, 0, 0.4509804, 1,
1.439737, -0.4501919, 1.849791, 1, 0, 0.4431373, 1,
1.443385, 0.1262733, 1.561216, 1, 0, 0.4392157, 1,
1.446092, -1.094571, 2.674263, 1, 0, 0.4313726, 1,
1.452537, -2.092706, 3.265552, 1, 0, 0.427451, 1,
1.480025, -1.593154, 2.458333, 1, 0, 0.4196078, 1,
1.48979, -2.510713, 1.119186, 1, 0, 0.4156863, 1,
1.504891, -0.9464887, 1.00433, 1, 0, 0.4078431, 1,
1.507675, -1.750909, 3.10825, 1, 0, 0.4039216, 1,
1.508151, 0.1367876, 2.490599, 1, 0, 0.3960784, 1,
1.526947, 0.194756, 1.087595, 1, 0, 0.3882353, 1,
1.540321, 1.073807, -0.233637, 1, 0, 0.3843137, 1,
1.545762, -1.622312, 2.355834, 1, 0, 0.3764706, 1,
1.546941, -0.7021988, 0.4512162, 1, 0, 0.372549, 1,
1.558462, -0.6284997, 0.5650907, 1, 0, 0.3647059, 1,
1.559515, -0.01043332, 0.9376917, 1, 0, 0.3607843, 1,
1.559993, 1.248502, 1.961913, 1, 0, 0.3529412, 1,
1.599915, 0.3040936, 2.436158, 1, 0, 0.3490196, 1,
1.601427, -1.766494, 2.781659, 1, 0, 0.3411765, 1,
1.605518, 0.7840952, -1.979853, 1, 0, 0.3372549, 1,
1.61658, 0.6484929, 0.6688204, 1, 0, 0.3294118, 1,
1.617726, -0.1673085, 1.653923, 1, 0, 0.3254902, 1,
1.622738, -0.1712797, 1.652071, 1, 0, 0.3176471, 1,
1.629182, -0.2682421, 0.09750168, 1, 0, 0.3137255, 1,
1.633133, -2.552177, 2.504841, 1, 0, 0.3058824, 1,
1.634412, -1.253649, 2.274056, 1, 0, 0.2980392, 1,
1.639292, -1.90721, 1.826773, 1, 0, 0.2941177, 1,
1.640592, -0.512127, 1.908567, 1, 0, 0.2862745, 1,
1.649254, -1.198113, 3.285677, 1, 0, 0.282353, 1,
1.659046, 0.5249275, 0.8409649, 1, 0, 0.2745098, 1,
1.664452, 0.6975187, 1.348894, 1, 0, 0.2705882, 1,
1.6726, -0.1204213, 0.7969446, 1, 0, 0.2627451, 1,
1.673877, 1.02585, 0.6686251, 1, 0, 0.2588235, 1,
1.674904, 0.1976084, 1.871814, 1, 0, 0.2509804, 1,
1.695968, 1.245254, 1.743004, 1, 0, 0.2470588, 1,
1.711857, -0.9892029, 0.6469693, 1, 0, 0.2392157, 1,
1.740238, -0.521182, 1.332813, 1, 0, 0.2352941, 1,
1.747062, 0.2556534, 1.554006, 1, 0, 0.227451, 1,
1.748013, -0.1427288, 1.484929, 1, 0, 0.2235294, 1,
1.748612, 0.5131423, -0.1247796, 1, 0, 0.2156863, 1,
1.768862, 0.9125016, 0.3299015, 1, 0, 0.2117647, 1,
1.783264, -0.5290506, -0.5492688, 1, 0, 0.2039216, 1,
1.790983, -1.082502, 2.767623, 1, 0, 0.1960784, 1,
1.837481, 0.4662502, 1.955805, 1, 0, 0.1921569, 1,
1.846169, 0.7894518, 1.093915, 1, 0, 0.1843137, 1,
1.867141, 1.435753, 3.191749, 1, 0, 0.1803922, 1,
1.869208, -3.022022, 2.229445, 1, 0, 0.172549, 1,
1.898061, 0.6978517, 1.36725, 1, 0, 0.1686275, 1,
1.906438, 1.843236, -0.1473498, 1, 0, 0.1607843, 1,
1.966534, 1.627807, 1.961065, 1, 0, 0.1568628, 1,
1.968884, 0.6718459, -0.1235437, 1, 0, 0.1490196, 1,
1.991159, -0.3654381, 1.355307, 1, 0, 0.145098, 1,
2.035313, 0.7730411, 0.001679367, 1, 0, 0.1372549, 1,
2.068006, 0.2022233, 0.5357867, 1, 0, 0.1333333, 1,
2.074093, 0.2374514, 2.028155, 1, 0, 0.1254902, 1,
2.098243, 1.158638, 0.3237185, 1, 0, 0.1215686, 1,
2.139549, 0.05343121, 0.6983323, 1, 0, 0.1137255, 1,
2.143105, 1.746473, 1.211015, 1, 0, 0.1098039, 1,
2.163504, -0.2623273, 3.290444, 1, 0, 0.1019608, 1,
2.216486, -0.05560966, 0.9028121, 1, 0, 0.09411765, 1,
2.266233, 0.06718202, 2.015004, 1, 0, 0.09019608, 1,
2.295089, -0.2138888, 1.562716, 1, 0, 0.08235294, 1,
2.331583, -2.091953, 0.991886, 1, 0, 0.07843138, 1,
2.350089, -0.04527999, 1.553208, 1, 0, 0.07058824, 1,
2.392532, -0.8547843, 2.567431, 1, 0, 0.06666667, 1,
2.395898, 0.472856, 0.5356316, 1, 0, 0.05882353, 1,
2.424112, -1.601089, -0.1618322, 1, 0, 0.05490196, 1,
2.424163, 0.590484, 1.8354, 1, 0, 0.04705882, 1,
2.493768, 0.388262, 1.799569, 1, 0, 0.04313726, 1,
2.525949, 0.08878362, 2.09262, 1, 0, 0.03529412, 1,
2.656984, -0.5780264, 2.59295, 1, 0, 0.03137255, 1,
2.674967, 0.0671971, 2.598474, 1, 0, 0.02352941, 1,
2.699617, -0.8704494, 1.612611, 1, 0, 0.01960784, 1,
3.109503, -1.787789, 0.9359958, 1, 0, 0.01176471, 1,
3.411248, 0.6864102, 1.30508, 1, 0, 0.007843138, 1
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
0.157372, -4.213995, -6.747345, 0, -0.5, 0.5, 0.5,
0.157372, -4.213995, -6.747345, 1, -0.5, 0.5, 0.5,
0.157372, -4.213995, -6.747345, 1, 1.5, 0.5, 0.5,
0.157372, -4.213995, -6.747345, 0, 1.5, 0.5, 0.5
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
-4.199569, 0.1448271, -6.747345, 0, -0.5, 0.5, 0.5,
-4.199569, 0.1448271, -6.747345, 1, -0.5, 0.5, 0.5,
-4.199569, 0.1448271, -6.747345, 1, 1.5, 0.5, 0.5,
-4.199569, 0.1448271, -6.747345, 0, 1.5, 0.5, 0.5
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
-4.199569, -4.213995, 0.637392, 0, -0.5, 0.5, 0.5,
-4.199569, -4.213995, 0.637392, 1, -0.5, 0.5, 0.5,
-4.199569, -4.213995, 0.637392, 1, 1.5, 0.5, 0.5,
-4.199569, -4.213995, 0.637392, 0, 1.5, 0.5, 0.5
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
-3, -3.208113, -5.043175,
3, -3.208113, -5.043175,
-3, -3.208113, -5.043175,
-3, -3.37576, -5.327204,
-2, -3.208113, -5.043175,
-2, -3.37576, -5.327204,
-1, -3.208113, -5.043175,
-1, -3.37576, -5.327204,
0, -3.208113, -5.043175,
0, -3.37576, -5.327204,
1, -3.208113, -5.043175,
1, -3.37576, -5.327204,
2, -3.208113, -5.043175,
2, -3.37576, -5.327204,
3, -3.208113, -5.043175,
3, -3.37576, -5.327204
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
-3, -3.711054, -5.89526, 0, -0.5, 0.5, 0.5,
-3, -3.711054, -5.89526, 1, -0.5, 0.5, 0.5,
-3, -3.711054, -5.89526, 1, 1.5, 0.5, 0.5,
-3, -3.711054, -5.89526, 0, 1.5, 0.5, 0.5,
-2, -3.711054, -5.89526, 0, -0.5, 0.5, 0.5,
-2, -3.711054, -5.89526, 1, -0.5, 0.5, 0.5,
-2, -3.711054, -5.89526, 1, 1.5, 0.5, 0.5,
-2, -3.711054, -5.89526, 0, 1.5, 0.5, 0.5,
-1, -3.711054, -5.89526, 0, -0.5, 0.5, 0.5,
-1, -3.711054, -5.89526, 1, -0.5, 0.5, 0.5,
-1, -3.711054, -5.89526, 1, 1.5, 0.5, 0.5,
-1, -3.711054, -5.89526, 0, 1.5, 0.5, 0.5,
0, -3.711054, -5.89526, 0, -0.5, 0.5, 0.5,
0, -3.711054, -5.89526, 1, -0.5, 0.5, 0.5,
0, -3.711054, -5.89526, 1, 1.5, 0.5, 0.5,
0, -3.711054, -5.89526, 0, 1.5, 0.5, 0.5,
1, -3.711054, -5.89526, 0, -0.5, 0.5, 0.5,
1, -3.711054, -5.89526, 1, -0.5, 0.5, 0.5,
1, -3.711054, -5.89526, 1, 1.5, 0.5, 0.5,
1, -3.711054, -5.89526, 0, 1.5, 0.5, 0.5,
2, -3.711054, -5.89526, 0, -0.5, 0.5, 0.5,
2, -3.711054, -5.89526, 1, -0.5, 0.5, 0.5,
2, -3.711054, -5.89526, 1, 1.5, 0.5, 0.5,
2, -3.711054, -5.89526, 0, 1.5, 0.5, 0.5,
3, -3.711054, -5.89526, 0, -0.5, 0.5, 0.5,
3, -3.711054, -5.89526, 1, -0.5, 0.5, 0.5,
3, -3.711054, -5.89526, 1, 1.5, 0.5, 0.5,
3, -3.711054, -5.89526, 0, 1.5, 0.5, 0.5
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
-3.194121, -3, -5.043175,
-3.194121, 3, -5.043175,
-3.194121, -3, -5.043175,
-3.361695, -3, -5.327204,
-3.194121, -2, -5.043175,
-3.361695, -2, -5.327204,
-3.194121, -1, -5.043175,
-3.361695, -1, -5.327204,
-3.194121, 0, -5.043175,
-3.361695, 0, -5.327204,
-3.194121, 1, -5.043175,
-3.361695, 1, -5.327204,
-3.194121, 2, -5.043175,
-3.361695, 2, -5.327204,
-3.194121, 3, -5.043175,
-3.361695, 3, -5.327204
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
-3.696845, -3, -5.89526, 0, -0.5, 0.5, 0.5,
-3.696845, -3, -5.89526, 1, -0.5, 0.5, 0.5,
-3.696845, -3, -5.89526, 1, 1.5, 0.5, 0.5,
-3.696845, -3, -5.89526, 0, 1.5, 0.5, 0.5,
-3.696845, -2, -5.89526, 0, -0.5, 0.5, 0.5,
-3.696845, -2, -5.89526, 1, -0.5, 0.5, 0.5,
-3.696845, -2, -5.89526, 1, 1.5, 0.5, 0.5,
-3.696845, -2, -5.89526, 0, 1.5, 0.5, 0.5,
-3.696845, -1, -5.89526, 0, -0.5, 0.5, 0.5,
-3.696845, -1, -5.89526, 1, -0.5, 0.5, 0.5,
-3.696845, -1, -5.89526, 1, 1.5, 0.5, 0.5,
-3.696845, -1, -5.89526, 0, 1.5, 0.5, 0.5,
-3.696845, 0, -5.89526, 0, -0.5, 0.5, 0.5,
-3.696845, 0, -5.89526, 1, -0.5, 0.5, 0.5,
-3.696845, 0, -5.89526, 1, 1.5, 0.5, 0.5,
-3.696845, 0, -5.89526, 0, 1.5, 0.5, 0.5,
-3.696845, 1, -5.89526, 0, -0.5, 0.5, 0.5,
-3.696845, 1, -5.89526, 1, -0.5, 0.5, 0.5,
-3.696845, 1, -5.89526, 1, 1.5, 0.5, 0.5,
-3.696845, 1, -5.89526, 0, 1.5, 0.5, 0.5,
-3.696845, 2, -5.89526, 0, -0.5, 0.5, 0.5,
-3.696845, 2, -5.89526, 1, -0.5, 0.5, 0.5,
-3.696845, 2, -5.89526, 1, 1.5, 0.5, 0.5,
-3.696845, 2, -5.89526, 0, 1.5, 0.5, 0.5,
-3.696845, 3, -5.89526, 0, -0.5, 0.5, 0.5,
-3.696845, 3, -5.89526, 1, -0.5, 0.5, 0.5,
-3.696845, 3, -5.89526, 1, 1.5, 0.5, 0.5,
-3.696845, 3, -5.89526, 0, 1.5, 0.5, 0.5
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
-3.194121, -3.208113, -4,
-3.194121, -3.208113, 6,
-3.194121, -3.208113, -4,
-3.361695, -3.37576, -4,
-3.194121, -3.208113, -2,
-3.361695, -3.37576, -2,
-3.194121, -3.208113, 0,
-3.361695, -3.37576, 0,
-3.194121, -3.208113, 2,
-3.361695, -3.37576, 2,
-3.194121, -3.208113, 4,
-3.361695, -3.37576, 4,
-3.194121, -3.208113, 6,
-3.361695, -3.37576, 6
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
"4",
"6"
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
-3.696845, -3.711054, -4, 0, -0.5, 0.5, 0.5,
-3.696845, -3.711054, -4, 1, -0.5, 0.5, 0.5,
-3.696845, -3.711054, -4, 1, 1.5, 0.5, 0.5,
-3.696845, -3.711054, -4, 0, 1.5, 0.5, 0.5,
-3.696845, -3.711054, -2, 0, -0.5, 0.5, 0.5,
-3.696845, -3.711054, -2, 1, -0.5, 0.5, 0.5,
-3.696845, -3.711054, -2, 1, 1.5, 0.5, 0.5,
-3.696845, -3.711054, -2, 0, 1.5, 0.5, 0.5,
-3.696845, -3.711054, 0, 0, -0.5, 0.5, 0.5,
-3.696845, -3.711054, 0, 1, -0.5, 0.5, 0.5,
-3.696845, -3.711054, 0, 1, 1.5, 0.5, 0.5,
-3.696845, -3.711054, 0, 0, 1.5, 0.5, 0.5,
-3.696845, -3.711054, 2, 0, -0.5, 0.5, 0.5,
-3.696845, -3.711054, 2, 1, -0.5, 0.5, 0.5,
-3.696845, -3.711054, 2, 1, 1.5, 0.5, 0.5,
-3.696845, -3.711054, 2, 0, 1.5, 0.5, 0.5,
-3.696845, -3.711054, 4, 0, -0.5, 0.5, 0.5,
-3.696845, -3.711054, 4, 1, -0.5, 0.5, 0.5,
-3.696845, -3.711054, 4, 1, 1.5, 0.5, 0.5,
-3.696845, -3.711054, 4, 0, 1.5, 0.5, 0.5,
-3.696845, -3.711054, 6, 0, -0.5, 0.5, 0.5,
-3.696845, -3.711054, 6, 1, -0.5, 0.5, 0.5,
-3.696845, -3.711054, 6, 1, 1.5, 0.5, 0.5,
-3.696845, -3.711054, 6, 0, 1.5, 0.5, 0.5
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
-3.194121, -3.208113, -5.043175,
-3.194121, 3.497767, -5.043175,
-3.194121, -3.208113, 6.317959,
-3.194121, 3.497767, 6.317959,
-3.194121, -3.208113, -5.043175,
-3.194121, -3.208113, 6.317959,
-3.194121, 3.497767, -5.043175,
-3.194121, 3.497767, 6.317959,
-3.194121, -3.208113, -5.043175,
3.508865, -3.208113, -5.043175,
-3.194121, -3.208113, 6.317959,
3.508865, -3.208113, 6.317959,
-3.194121, 3.497767, -5.043175,
3.508865, 3.497767, -5.043175,
-3.194121, 3.497767, 6.317959,
3.508865, 3.497767, 6.317959,
3.508865, -3.208113, -5.043175,
3.508865, 3.497767, -5.043175,
3.508865, -3.208113, 6.317959,
3.508865, 3.497767, 6.317959,
3.508865, -3.208113, -5.043175,
3.508865, -3.208113, 6.317959,
3.508865, 3.497767, -5.043175,
3.508865, 3.497767, 6.317959
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
var radius = 7.901726;
var distance = 35.15567;
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
mvMatrix.translate( -0.157372, -0.1448271, -0.637392 );
mvMatrix.scale( 1.274581, 1.274031, 0.7519937 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.15567);
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
triallate<-read.table("triallate.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-triallate$V2
```

```
## Error in eval(expr, envir, enclos): object 'triallate' not found
```

```r
y<-triallate$V3
```

```
## Error in eval(expr, envir, enclos): object 'triallate' not found
```

```r
z<-triallate$V4
```

```
## Error in eval(expr, envir, enclos): object 'triallate' not found
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
-3.096504, 1.254031, 0.5061266, 0, 0, 1, 1, 1,
-3.019016, -2.289384, -2.30713, 1, 0, 0, 1, 1,
-2.685858, 0.2268376, 1.131249, 1, 0, 0, 1, 1,
-2.640437, -0.1125397, -0.5937957, 1, 0, 0, 1, 1,
-2.606018, -1.307453, -2.769396, 1, 0, 0, 1, 1,
-2.564492, 0.3429061, -1.481833, 1, 0, 0, 1, 1,
-2.4783, 0.3118476, -2.990189, 0, 0, 0, 1, 1,
-2.417749, 0.6427287, -1.606802, 0, 0, 0, 1, 1,
-2.408616, 0.4428241, -1.355591, 0, 0, 0, 1, 1,
-2.373875, -0.4304478, -0.105191, 0, 0, 0, 1, 1,
-2.327067, 0.8305013, -3.461039, 0, 0, 0, 1, 1,
-2.228613, -1.271345, -0.08712145, 0, 0, 0, 1, 1,
-2.223479, 0.4704602, -2.736702, 0, 0, 0, 1, 1,
-2.1826, -1.546624, -3.274379, 1, 1, 1, 1, 1,
-2.172028, 0.1166918, -1.400864, 1, 1, 1, 1, 1,
-2.16145, 1.378272, 0.09793617, 1, 1, 1, 1, 1,
-2.155757, -0.02346202, -0.4123323, 1, 1, 1, 1, 1,
-2.145859, -1.684231, -3.291371, 1, 1, 1, 1, 1,
-2.143597, -1.482165, -2.866894, 1, 1, 1, 1, 1,
-2.108269, 0.04407918, 0.1629351, 1, 1, 1, 1, 1,
-2.074283, -1.309716, -2.299965, 1, 1, 1, 1, 1,
-2.042511, -0.6904466, -0.2291123, 1, 1, 1, 1, 1,
-1.982845, -0.3688509, -1.128271, 1, 1, 1, 1, 1,
-1.957972, 0.6027586, -0.6056141, 1, 1, 1, 1, 1,
-1.956786, -0.5616132, -1.29342, 1, 1, 1, 1, 1,
-1.938658, 0.8681207, -0.1835271, 1, 1, 1, 1, 1,
-1.933535, -0.1718337, -3.398081, 1, 1, 1, 1, 1,
-1.93352, -0.4698433, -1.938385, 1, 1, 1, 1, 1,
-1.917689, -1.19146, -2.180599, 0, 0, 1, 1, 1,
-1.911947, 0.3931643, -1.993127, 1, 0, 0, 1, 1,
-1.906203, 0.4568885, -3.222866, 1, 0, 0, 1, 1,
-1.873793, -1.256728, -2.735744, 1, 0, 0, 1, 1,
-1.867719, -0.8033878, -1.495236, 1, 0, 0, 1, 1,
-1.837427, 0.5210764, -2.607071, 1, 0, 0, 1, 1,
-1.834794, -1.03558, -4.167197, 0, 0, 0, 1, 1,
-1.833295, -0.142965, -0.1314832, 0, 0, 0, 1, 1,
-1.824076, -0.7059879, -1.81951, 0, 0, 0, 1, 1,
-1.817595, -0.1807358, -2.48988, 0, 0, 0, 1, 1,
-1.812283, 1.937858, -1.669352, 0, 0, 0, 1, 1,
-1.800625, 0.4633178, -1.869423, 0, 0, 0, 1, 1,
-1.78324, -0.7340611, -2.449116, 0, 0, 0, 1, 1,
-1.76541, 0.7146437, -1.402533, 1, 1, 1, 1, 1,
-1.756114, -0.952998, -0.2497803, 1, 1, 1, 1, 1,
-1.735284, -0.5557601, -3.296172, 1, 1, 1, 1, 1,
-1.726154, 0.6358666, -0.4481576, 1, 1, 1, 1, 1,
-1.712719, 0.071684, -1.636721, 1, 1, 1, 1, 1,
-1.712257, -1.039506, -0.7972841, 1, 1, 1, 1, 1,
-1.704005, -0.008634488, -1.999032, 1, 1, 1, 1, 1,
-1.686441, -1.323455, -2.467121, 1, 1, 1, 1, 1,
-1.683012, -1.893259, -3.304073, 1, 1, 1, 1, 1,
-1.677759, -0.5165073, -3.153855, 1, 1, 1, 1, 1,
-1.65752, 1.196404, -2.359136, 1, 1, 1, 1, 1,
-1.656065, -1.29618, -2.182027, 1, 1, 1, 1, 1,
-1.644167, -0.2621612, -1.856749, 1, 1, 1, 1, 1,
-1.591702, 0.9053182, -1.397256, 1, 1, 1, 1, 1,
-1.58467, 0.5558609, -2.498697, 1, 1, 1, 1, 1,
-1.584456, 1.080863, -1.187551, 0, 0, 1, 1, 1,
-1.581314, -0.2417549, -1.256607, 1, 0, 0, 1, 1,
-1.575418, -1.322508, -2.993418, 1, 0, 0, 1, 1,
-1.566917, -0.4032627, -1.470737, 1, 0, 0, 1, 1,
-1.566303, -2.237335, -3.287246, 1, 0, 0, 1, 1,
-1.551911, -0.3053167, -0.6518325, 1, 0, 0, 1, 1,
-1.539417, -1.920186, -4.433469, 0, 0, 0, 1, 1,
-1.539344, 0.7068266, -1.514593, 0, 0, 0, 1, 1,
-1.514892, -1.140745, -3.178517, 0, 0, 0, 1, 1,
-1.50903, -0.7459401, -2.641698, 0, 0, 0, 1, 1,
-1.48938, 0.9534348, -1.620279, 0, 0, 0, 1, 1,
-1.488769, 1.847346, -0.1043078, 0, 0, 0, 1, 1,
-1.472115, 0.836314, -0.1635835, 0, 0, 0, 1, 1,
-1.467707, -0.04206654, -2.344309, 1, 1, 1, 1, 1,
-1.467096, -0.04834734, -1.29383, 1, 1, 1, 1, 1,
-1.460707, 0.3241658, -2.302823, 1, 1, 1, 1, 1,
-1.408305, 0.3168148, -1.49839, 1, 1, 1, 1, 1,
-1.398787, -0.296069, -0.9038705, 1, 1, 1, 1, 1,
-1.396076, -0.1664742, -3.19333, 1, 1, 1, 1, 1,
-1.372925, 0.589912, -1.711061, 1, 1, 1, 1, 1,
-1.363183, -1.057226, -3.426693, 1, 1, 1, 1, 1,
-1.352235, -0.4624989, -2.602242, 1, 1, 1, 1, 1,
-1.343488, 1.665307, -0.7830285, 1, 1, 1, 1, 1,
-1.340601, -0.358226, -3.048884, 1, 1, 1, 1, 1,
-1.339629, 0.09673284, -1.872102, 1, 1, 1, 1, 1,
-1.3265, -0.3979632, -0.5194519, 1, 1, 1, 1, 1,
-1.32292, 0.001540047, -2.050913, 1, 1, 1, 1, 1,
-1.311979, 2.508366, -0.304785, 1, 1, 1, 1, 1,
-1.311099, -0.4417557, -3.24979, 0, 0, 1, 1, 1,
-1.296941, -0.2796684, -1.851855, 1, 0, 0, 1, 1,
-1.292919, -0.5554327, -3.727031, 1, 0, 0, 1, 1,
-1.291993, 0.06912247, -1.970397, 1, 0, 0, 1, 1,
-1.282395, 0.1374686, -1.625457, 1, 0, 0, 1, 1,
-1.277228, 1.049436, -0.1382488, 1, 0, 0, 1, 1,
-1.270893, -1.04619, -1.025164, 0, 0, 0, 1, 1,
-1.264531, -0.8681973, -0.6408864, 0, 0, 0, 1, 1,
-1.257655, -1.921122, -2.858746, 0, 0, 0, 1, 1,
-1.246211, -2.607651, -3.99842, 0, 0, 0, 1, 1,
-1.245135, 0.09276159, -0.8251782, 0, 0, 0, 1, 1,
-1.218957, -0.5970522, -2.293111, 0, 0, 0, 1, 1,
-1.210494, 0.8531721, -0.6108339, 0, 0, 0, 1, 1,
-1.208878, -0.08144494, 0.5688664, 1, 1, 1, 1, 1,
-1.201052, 1.68714, 0.4498657, 1, 1, 1, 1, 1,
-1.200605, 0.6005828, -0.2567049, 1, 1, 1, 1, 1,
-1.195013, 0.569975, -0.6257394, 1, 1, 1, 1, 1,
-1.194401, 0.139492, -0.1540971, 1, 1, 1, 1, 1,
-1.19231, -0.9008325, -1.495127, 1, 1, 1, 1, 1,
-1.187727, -0.2972522, -2.714736, 1, 1, 1, 1, 1,
-1.18476, -0.1522159, -0.5286834, 1, 1, 1, 1, 1,
-1.182027, -2.266239, -3.059497, 1, 1, 1, 1, 1,
-1.161268, 0.02643319, -0.8623008, 1, 1, 1, 1, 1,
-1.160898, -0.3204038, -2.892406, 1, 1, 1, 1, 1,
-1.157968, -1.500443, -2.748384, 1, 1, 1, 1, 1,
-1.156926, -1.853105, -1.321752, 1, 1, 1, 1, 1,
-1.151988, 0.3205622, -0.6211535, 1, 1, 1, 1, 1,
-1.149456, -1.581816, -2.894399, 1, 1, 1, 1, 1,
-1.144081, -0.03911198, -2.142252, 0, 0, 1, 1, 1,
-1.141825, -1.420465, -3.997968, 1, 0, 0, 1, 1,
-1.140588, -0.6538495, -3.069998, 1, 0, 0, 1, 1,
-1.117883, -0.006742699, -0.5869632, 1, 0, 0, 1, 1,
-1.114759, -0.198451, -3.780356, 1, 0, 0, 1, 1,
-1.102164, -0.1633545, -2.20339, 1, 0, 0, 1, 1,
-1.098835, -0.3793292, -2.105959, 0, 0, 0, 1, 1,
-1.092742, 0.3451463, -2.292346, 0, 0, 0, 1, 1,
-1.091953, -0.1230994, -1.519571, 0, 0, 0, 1, 1,
-1.090364, 0.7261294, -1.115028, 0, 0, 0, 1, 1,
-1.082585, 0.08658434, -2.803491, 0, 0, 0, 1, 1,
-1.082512, 0.8858419, 0.04357595, 0, 0, 0, 1, 1,
-1.075681, -0.5517381, -2.390808, 0, 0, 0, 1, 1,
-1.059161, -0.06653518, -1.663935, 1, 1, 1, 1, 1,
-1.057488, -2.651195, -1.21949, 1, 1, 1, 1, 1,
-1.056798, -1.176619, -0.529484, 1, 1, 1, 1, 1,
-1.053931, -0.4513217, -0.9929577, 1, 1, 1, 1, 1,
-1.046167, -0.02399041, -1.693831, 1, 1, 1, 1, 1,
-1.044217, 1.72074, 0.336471, 1, 1, 1, 1, 1,
-1.04373, -0.9311709, -2.185951, 1, 1, 1, 1, 1,
-1.042877, 0.2765462, -0.9968894, 1, 1, 1, 1, 1,
-1.042085, -0.493072, -1.191101, 1, 1, 1, 1, 1,
-1.032598, -0.6480324, -2.094729, 1, 1, 1, 1, 1,
-1.025485, 1.149719, -1.963392, 1, 1, 1, 1, 1,
-1.024448, 0.4107367, 0.1407696, 1, 1, 1, 1, 1,
-1.022877, -1.579015, -2.060534, 1, 1, 1, 1, 1,
-1.005736, 1.215253, -1.6936, 1, 1, 1, 1, 1,
-0.9966123, 0.4394873, -0.005624891, 1, 1, 1, 1, 1,
-0.9895558, 1.068761, -2.337363, 0, 0, 1, 1, 1,
-0.9819115, -1.804932, -1.125334, 1, 0, 0, 1, 1,
-0.9756249, 0.6591954, 0.3745368, 1, 0, 0, 1, 1,
-0.9696478, -0.3098407, -3.147323, 1, 0, 0, 1, 1,
-0.9669048, -0.5120407, -2.228946, 1, 0, 0, 1, 1,
-0.9602154, 0.3647817, -0.7981668, 1, 0, 0, 1, 1,
-0.9542307, -1.450056, -4.257679, 0, 0, 0, 1, 1,
-0.9505944, 0.7098014, -1.574531, 0, 0, 0, 1, 1,
-0.9449822, 0.7723669, -1.764399, 0, 0, 0, 1, 1,
-0.9425554, 0.1808928, -0.8415766, 0, 0, 0, 1, 1,
-0.9418078, 1.545861, -0.9602403, 0, 0, 0, 1, 1,
-0.9411277, -2.950758, -3.977389, 0, 0, 0, 1, 1,
-0.9372612, 0.8324592, -0.3900684, 0, 0, 0, 1, 1,
-0.9368057, 0.09563049, -2.158173, 1, 1, 1, 1, 1,
-0.9301758, -0.5930593, -1.038245, 1, 1, 1, 1, 1,
-0.9265593, -0.0217558, -0.4559219, 1, 1, 1, 1, 1,
-0.9215787, -0.5696454, -1.213094, 1, 1, 1, 1, 1,
-0.9199048, 0.6204067, 0.04760191, 1, 1, 1, 1, 1,
-0.9170433, -0.1385915, -2.542664, 1, 1, 1, 1, 1,
-0.912313, 0.5621444, -1.149323, 1, 1, 1, 1, 1,
-0.9113873, 0.562742, -0.3858749, 1, 1, 1, 1, 1,
-0.9049482, 1.724138, 2.188619, 1, 1, 1, 1, 1,
-0.9041347, 0.7812413, -0.2319519, 1, 1, 1, 1, 1,
-0.9018102, 0.913922, -2.224191, 1, 1, 1, 1, 1,
-0.9018005, 0.1717588, 0.05930002, 1, 1, 1, 1, 1,
-0.8984562, -1.069156, -1.649607, 1, 1, 1, 1, 1,
-0.8938433, 1.670301, -0.1341332, 1, 1, 1, 1, 1,
-0.888278, -0.2138259, -3.618149, 1, 1, 1, 1, 1,
-0.8857367, 0.2907687, -0.6201161, 0, 0, 1, 1, 1,
-0.8767545, 0.9305347, -0.4696579, 1, 0, 0, 1, 1,
-0.8738527, -0.6860587, -2.56818, 1, 0, 0, 1, 1,
-0.8734362, 1.304746, 0.2473251, 1, 0, 0, 1, 1,
-0.8724794, 0.2375529, -2.637818, 1, 0, 0, 1, 1,
-0.8633926, -1.242978, -2.131082, 1, 0, 0, 1, 1,
-0.8609284, 1.030158, -0.4174757, 0, 0, 0, 1, 1,
-0.8596647, -0.4589511, -0.3634202, 0, 0, 0, 1, 1,
-0.8521476, 0.1145731, -2.379963, 0, 0, 0, 1, 1,
-0.8429061, -0.6360116, -2.847704, 0, 0, 0, 1, 1,
-0.8326658, 1.161484, -1.295531, 0, 0, 0, 1, 1,
-0.8320013, -0.2115221, -2.588807, 0, 0, 0, 1, 1,
-0.8318215, 0.5819418, -1.35903, 0, 0, 0, 1, 1,
-0.8260242, 0.1527869, -2.672039, 1, 1, 1, 1, 1,
-0.8236645, 1.019449, -0.05300488, 1, 1, 1, 1, 1,
-0.8146515, -0.08411512, -1.32867, 1, 1, 1, 1, 1,
-0.8116189, -1.049371, -1.036184, 1, 1, 1, 1, 1,
-0.7970226, -0.117869, -2.099176, 1, 1, 1, 1, 1,
-0.7948014, 1.308017, 0.8475561, 1, 1, 1, 1, 1,
-0.794662, 0.5472552, -0.8002287, 1, 1, 1, 1, 1,
-0.7917657, 1.200419, -1.20335, 1, 1, 1, 1, 1,
-0.7866163, -2.129357, -3.135705, 1, 1, 1, 1, 1,
-0.7828135, 1.756052, -0.9114518, 1, 1, 1, 1, 1,
-0.7821717, -0.5481363, -1.618491, 1, 1, 1, 1, 1,
-0.7777661, 0.2525102, 0.9374539, 1, 1, 1, 1, 1,
-0.767223, -0.2091517, -1.64079, 1, 1, 1, 1, 1,
-0.7665272, -0.673147, -3.131433, 1, 1, 1, 1, 1,
-0.7627743, 0.9453404, -1.185769, 1, 1, 1, 1, 1,
-0.7561064, 0.230685, -1.216687, 0, 0, 1, 1, 1,
-0.7513114, 1.240048, -0.2842172, 1, 0, 0, 1, 1,
-0.7512524, -0.04437083, -3.233659, 1, 0, 0, 1, 1,
-0.7458995, -0.08163901, -1.405139, 1, 0, 0, 1, 1,
-0.7418351, 0.5773892, -1.271123, 1, 0, 0, 1, 1,
-0.7383566, 0.6794989, -0.4372827, 1, 0, 0, 1, 1,
-0.7288332, 0.3959956, -1.419531, 0, 0, 0, 1, 1,
-0.7283179, -0.08043468, -3.509186, 0, 0, 0, 1, 1,
-0.7094957, 0.7551165, -0.0250632, 0, 0, 0, 1, 1,
-0.708069, 0.6377075, 0.3886615, 0, 0, 0, 1, 1,
-0.7017937, 1.086168, 0.1794023, 0, 0, 0, 1, 1,
-0.7015638, -0.4336035, -1.855858, 0, 0, 0, 1, 1,
-0.6988762, -1.421211, -1.639339, 0, 0, 0, 1, 1,
-0.6986997, -0.1458932, -2.216634, 1, 1, 1, 1, 1,
-0.6974943, 1.503767, -1.532419, 1, 1, 1, 1, 1,
-0.6932276, -0.1603324, -2.499752, 1, 1, 1, 1, 1,
-0.6912214, -0.4941403, -2.221658, 1, 1, 1, 1, 1,
-0.6898533, -1.2286, -3.555506, 1, 1, 1, 1, 1,
-0.6871816, -0.4903949, -1.735654, 1, 1, 1, 1, 1,
-0.6802126, 0.4785201, 0.1179802, 1, 1, 1, 1, 1,
-0.6741626, 0.2431749, -1.957762, 1, 1, 1, 1, 1,
-0.666851, -1.248199, -4.259671, 1, 1, 1, 1, 1,
-0.6556274, -0.6506541, -2.137362, 1, 1, 1, 1, 1,
-0.6422683, -0.7268887, -3.367708, 1, 1, 1, 1, 1,
-0.6363888, 0.4559208, -1.33349, 1, 1, 1, 1, 1,
-0.6346236, -0.9121029, -3.549624, 1, 1, 1, 1, 1,
-0.629676, -0.4908975, -1.485892, 1, 1, 1, 1, 1,
-0.6245306, -0.3009946, -2.777615, 1, 1, 1, 1, 1,
-0.6203428, -0.7580304, -2.923259, 0, 0, 1, 1, 1,
-0.6140679, -1.313609, -2.521042, 1, 0, 0, 1, 1,
-0.6122074, 0.9776858, -2.23787, 1, 0, 0, 1, 1,
-0.6091221, 1.671595, 0.1240362, 1, 0, 0, 1, 1,
-0.6084645, -1.157236, -3.031861, 1, 0, 0, 1, 1,
-0.6071005, 0.1838842, -0.5467837, 1, 0, 0, 1, 1,
-0.6054783, 1.562717, 1.725336, 0, 0, 0, 1, 1,
-0.6021403, -0.0309016, -1.076042, 0, 0, 0, 1, 1,
-0.5900532, 0.7840738, -2.152206, 0, 0, 0, 1, 1,
-0.5869914, 0.1168984, -2.061356, 0, 0, 0, 1, 1,
-0.5866302, 0.1772081, -1.278253, 0, 0, 0, 1, 1,
-0.5846354, -0.008130204, 0.3737372, 0, 0, 0, 1, 1,
-0.5822349, 1.477668, 0.227383, 0, 0, 0, 1, 1,
-0.5814302, 2.057327, 0.1768975, 1, 1, 1, 1, 1,
-0.5745628, 1.082624, -0.3565995, 1, 1, 1, 1, 1,
-0.5740819, 1.262364, -0.6043128, 1, 1, 1, 1, 1,
-0.5705993, -0.313911, -3.140894, 1, 1, 1, 1, 1,
-0.5705107, -1.278757, -1.295247, 1, 1, 1, 1, 1,
-0.5676664, 1.078412, 0.7450678, 1, 1, 1, 1, 1,
-0.563623, -1.216657, -2.579735, 1, 1, 1, 1, 1,
-0.5631607, 1.669846, -0.3015801, 1, 1, 1, 1, 1,
-0.5612283, -0.7877955, -1.551772, 1, 1, 1, 1, 1,
-0.5610004, -0.9216465, -1.197378, 1, 1, 1, 1, 1,
-0.5599429, -0.4970209, -1.891227, 1, 1, 1, 1, 1,
-0.5570552, 0.9493431, -0.8110864, 1, 1, 1, 1, 1,
-0.5534021, -0.3689567, -1.769, 1, 1, 1, 1, 1,
-0.5514465, -0.7043276, -0.1626603, 1, 1, 1, 1, 1,
-0.545654, 0.4559601, 1.091057, 1, 1, 1, 1, 1,
-0.5454182, -0.04797995, -1.945269, 0, 0, 1, 1, 1,
-0.5443997, -0.3815085, -2.045885, 1, 0, 0, 1, 1,
-0.535549, 1.075391, -0.3421739, 1, 0, 0, 1, 1,
-0.5311586, -1.49355, -2.667714, 1, 0, 0, 1, 1,
-0.5270638, 0.163185, -0.6852037, 1, 0, 0, 1, 1,
-0.5250353, -1.451312, -2.800697, 1, 0, 0, 1, 1,
-0.5240494, -0.4645062, -0.2498691, 0, 0, 0, 1, 1,
-0.520417, 1.445654, -1.061572, 0, 0, 0, 1, 1,
-0.5177254, 2.882332, -0.4181195, 0, 0, 0, 1, 1,
-0.5167021, -0.4427883, -2.557834, 0, 0, 0, 1, 1,
-0.5116943, 0.3181359, -0.1597557, 0, 0, 0, 1, 1,
-0.5098973, 0.4193032, -1.487479, 0, 0, 0, 1, 1,
-0.4996933, 1.741381, -1.499613, 0, 0, 0, 1, 1,
-0.49683, 0.5966708, -3.879266, 1, 1, 1, 1, 1,
-0.4964808, -0.3273365, -1.024093, 1, 1, 1, 1, 1,
-0.4962077, -0.2077441, -2.641663, 1, 1, 1, 1, 1,
-0.4928247, 0.7688602, -0.216047, 1, 1, 1, 1, 1,
-0.4919452, -0.6810703, -4.025235, 1, 1, 1, 1, 1,
-0.4881161, -0.750927, -2.916358, 1, 1, 1, 1, 1,
-0.487109, 0.2278402, -1.787563, 1, 1, 1, 1, 1,
-0.4859765, 1.30752, 0.1802691, 1, 1, 1, 1, 1,
-0.485899, 0.745983, -1.740416, 1, 1, 1, 1, 1,
-0.4853547, -0.143571, -0.3145182, 1, 1, 1, 1, 1,
-0.4848585, -0.2450026, -1.501691, 1, 1, 1, 1, 1,
-0.479752, -0.2081899, 0.5833297, 1, 1, 1, 1, 1,
-0.4740726, 1.464076, 1.023125, 1, 1, 1, 1, 1,
-0.4732453, 0.4548799, -0.5125621, 1, 1, 1, 1, 1,
-0.4721198, -0.3418493, -1.016006, 1, 1, 1, 1, 1,
-0.4666573, -1.29499, -2.618329, 0, 0, 1, 1, 1,
-0.4651254, -0.2158798, -2.159449, 1, 0, 0, 1, 1,
-0.4642717, -0.2411393, -2.400821, 1, 0, 0, 1, 1,
-0.4633754, 0.6645095, -0.6951315, 1, 0, 0, 1, 1,
-0.4624492, -0.5393434, -2.700999, 1, 0, 0, 1, 1,
-0.4598852, -0.6421805, -2.21419, 1, 0, 0, 1, 1,
-0.4514168, 1.889264, -2.070915, 0, 0, 0, 1, 1,
-0.4398524, -0.4924948, -4.502967, 0, 0, 0, 1, 1,
-0.4384297, -1.978148, -3.879187, 0, 0, 0, 1, 1,
-0.4375879, -0.6598561, -2.772544, 0, 0, 0, 1, 1,
-0.4341379, 0.7262344, -0.7190729, 0, 0, 0, 1, 1,
-0.426015, 0.8719566, 0.8737863, 0, 0, 0, 1, 1,
-0.4235591, -0.7281734, -2.097877, 0, 0, 0, 1, 1,
-0.4228653, 1.308236, 0.758015, 1, 1, 1, 1, 1,
-0.4226438, 0.2860198, -2.198289, 1, 1, 1, 1, 1,
-0.4199127, -1.713515, -3.954506, 1, 1, 1, 1, 1,
-0.4188191, -0.1719628, -0.08724373, 1, 1, 1, 1, 1,
-0.4158601, -0.6936094, -2.340691, 1, 1, 1, 1, 1,
-0.4109631, 0.2094599, 0.8868599, 1, 1, 1, 1, 1,
-0.4103891, 2.45943, 1.494425, 1, 1, 1, 1, 1,
-0.4095332, -0.8321729, -2.000123, 1, 1, 1, 1, 1,
-0.4095297, -0.1868617, -2.467833, 1, 1, 1, 1, 1,
-0.4088973, -0.4468974, -1.731707, 1, 1, 1, 1, 1,
-0.4072004, -0.4970991, -2.103213, 1, 1, 1, 1, 1,
-0.4068044, -0.2034615, -2.897062, 1, 1, 1, 1, 1,
-0.3980808, 0.4782056, -0.5514523, 1, 1, 1, 1, 1,
-0.3975284, 0.3888047, 0.5951873, 1, 1, 1, 1, 1,
-0.3932263, -0.4125811, -2.094013, 1, 1, 1, 1, 1,
-0.389971, -0.4364401, -1.542819, 0, 0, 1, 1, 1,
-0.389016, -1.29206, -3.369471, 1, 0, 0, 1, 1,
-0.3837048, -0.04605099, -2.744316, 1, 0, 0, 1, 1,
-0.381924, -0.9071472, -3.39397, 1, 0, 0, 1, 1,
-0.3812144, -0.3310421, -1.624558, 1, 0, 0, 1, 1,
-0.3783492, 1.136051, -0.8887089, 1, 0, 0, 1, 1,
-0.375437, -0.4751919, -2.685086, 0, 0, 0, 1, 1,
-0.3752196, 0.1829468, -2.728811, 0, 0, 0, 1, 1,
-0.3751831, -2.023376, -2.613064, 0, 0, 0, 1, 1,
-0.3720373, -0.6245518, -2.052407, 0, 0, 0, 1, 1,
-0.371238, -1.356573, -3.043537, 0, 0, 0, 1, 1,
-0.365048, 0.00543765, -1.566865, 0, 0, 0, 1, 1,
-0.3613699, -0.8691061, -2.666673, 0, 0, 0, 1, 1,
-0.3597015, 2.642005, 0.447681, 1, 1, 1, 1, 1,
-0.3550595, 0.04774111, -1.641991, 1, 1, 1, 1, 1,
-0.3493887, 1.160786, 1.02798, 1, 1, 1, 1, 1,
-0.3469253, -1.739291, -1.540251, 1, 1, 1, 1, 1,
-0.3467666, 0.4357868, 0.5561237, 1, 1, 1, 1, 1,
-0.3406586, 0.2834108, 0.1158771, 1, 1, 1, 1, 1,
-0.3405575, -0.9484679, -2.150148, 1, 1, 1, 1, 1,
-0.3402556, 2.485337, -0.9570656, 1, 1, 1, 1, 1,
-0.3396522, -1.081267, -3.028495, 1, 1, 1, 1, 1,
-0.3363186, 0.5345645, -1.634852, 1, 1, 1, 1, 1,
-0.3358963, -1.97563, -2.297803, 1, 1, 1, 1, 1,
-0.3350068, -2.986563, -1.68604, 1, 1, 1, 1, 1,
-0.3347031, 0.4132135, 0.4995282, 1, 1, 1, 1, 1,
-0.330961, -0.7663966, -2.779998, 1, 1, 1, 1, 1,
-0.3294907, 0.629746, 1.008159, 1, 1, 1, 1, 1,
-0.3293674, -1.149163, -3.792391, 0, 0, 1, 1, 1,
-0.3287804, 1.444092, -1.699311, 1, 0, 0, 1, 1,
-0.3274592, -0.4952171, -2.12641, 1, 0, 0, 1, 1,
-0.3262662, 0.6573728, 1.644245, 1, 0, 0, 1, 1,
-0.322784, 1.143784, 0.3771353, 1, 0, 0, 1, 1,
-0.3216444, 0.06729871, -2.621465, 1, 0, 0, 1, 1,
-0.3210895, 1.051769, 0.7995653, 0, 0, 0, 1, 1,
-0.315719, -1.139141, -2.758821, 0, 0, 0, 1, 1,
-0.3133829, -0.005867626, -2.345787, 0, 0, 0, 1, 1,
-0.3111843, 1.059268, -1.46208, 0, 0, 0, 1, 1,
-0.3094575, 0.2888036, -0.1729287, 0, 0, 0, 1, 1,
-0.3060419, -0.4746666, -3.466725, 0, 0, 0, 1, 1,
-0.3024196, 0.3037286, -1.404374, 0, 0, 0, 1, 1,
-0.3013196, 0.8782123, -0.9062541, 1, 1, 1, 1, 1,
-0.294145, 0.3423328, -1.598457, 1, 1, 1, 1, 1,
-0.2940184, 0.04557448, -2.09643, 1, 1, 1, 1, 1,
-0.2910608, 0.1195215, 0.1309679, 1, 1, 1, 1, 1,
-0.2898348, 0.7166925, 0.8866406, 1, 1, 1, 1, 1,
-0.2889363, 0.1559399, -0.3681155, 1, 1, 1, 1, 1,
-0.2869934, -1.407855, -1.161574, 1, 1, 1, 1, 1,
-0.2860186, 1.231649, -1.255468, 1, 1, 1, 1, 1,
-0.2762879, -0.2112571, -2.181772, 1, 1, 1, 1, 1,
-0.2753674, -0.4029211, -2.559157, 1, 1, 1, 1, 1,
-0.2747785, 0.0233769, -1.362556, 1, 1, 1, 1, 1,
-0.274342, -0.6477041, -1.108803, 1, 1, 1, 1, 1,
-0.273084, 0.1329013, 0.7632694, 1, 1, 1, 1, 1,
-0.2686059, 2.237335, -0.9483368, 1, 1, 1, 1, 1,
-0.2664005, -1.416109, -1.596709, 1, 1, 1, 1, 1,
-0.2653812, 0.5603319, -0.3476295, 0, 0, 1, 1, 1,
-0.2647346, 0.9366228, -0.7819772, 1, 0, 0, 1, 1,
-0.2638659, -0.4112582, -3.09913, 1, 0, 0, 1, 1,
-0.2625616, 0.5034423, 0.1649279, 1, 0, 0, 1, 1,
-0.2598002, 1.427011, 1.612426, 1, 0, 0, 1, 1,
-0.2590243, 0.03131403, -1.79146, 1, 0, 0, 1, 1,
-0.2387618, -1.195434, -2.71436, 0, 0, 0, 1, 1,
-0.2371351, -0.4698575, -2.75332, 0, 0, 0, 1, 1,
-0.2366256, -2.204897, -2.515659, 0, 0, 0, 1, 1,
-0.2358474, 1.015397, -1.617433, 0, 0, 0, 1, 1,
-0.2279045, -0.05916224, -2.445332, 0, 0, 0, 1, 1,
-0.2276541, -0.3781174, -1.748345, 0, 0, 0, 1, 1,
-0.2254691, 1.285343, -0.6429476, 0, 0, 0, 1, 1,
-0.225424, 1.046393, 0.9230252, 1, 1, 1, 1, 1,
-0.2241938, 0.6922237, 0.5417325, 1, 1, 1, 1, 1,
-0.2218486, -1.520411, -1.022338, 1, 1, 1, 1, 1,
-0.2178414, -0.1930118, -2.775857, 1, 1, 1, 1, 1,
-0.2142657, 0.9201554, 0.6146054, 1, 1, 1, 1, 1,
-0.2102277, -0.5129816, -1.966731, 1, 1, 1, 1, 1,
-0.2071457, -0.4971294, -1.364837, 1, 1, 1, 1, 1,
-0.2067365, 0.2340963, -0.8254306, 1, 1, 1, 1, 1,
-0.2026755, 1.062375, 0.288093, 1, 1, 1, 1, 1,
-0.2024019, 0.02001162, -2.795521, 1, 1, 1, 1, 1,
-0.2022528, 1.00414, -0.1923875, 1, 1, 1, 1, 1,
-0.1988951, 0.9835306, -1.952623, 1, 1, 1, 1, 1,
-0.1979131, -1.929109, -3.611639, 1, 1, 1, 1, 1,
-0.1960953, 0.5985681, -0.5835766, 1, 1, 1, 1, 1,
-0.190585, -1.240436, -1.482047, 1, 1, 1, 1, 1,
-0.1896602, -1.585539, -3.368632, 0, 0, 1, 1, 1,
-0.1871526, -0.5262157, -3.187163, 1, 0, 0, 1, 1,
-0.1869875, -0.4560207, -1.73846, 1, 0, 0, 1, 1,
-0.1855541, -1.383881, -4.877722, 1, 0, 0, 1, 1,
-0.1848529, -0.6315401, -1.444976, 1, 0, 0, 1, 1,
-0.182839, 0.9652362, -0.8945695, 1, 0, 0, 1, 1,
-0.1818324, -1.41536, -2.464032, 0, 0, 0, 1, 1,
-0.179669, -0.2196577, -1.921462, 0, 0, 0, 1, 1,
-0.1740385, -0.1864774, -0.8156986, 0, 0, 0, 1, 1,
-0.1735936, 0.01696067, -1.262684, 0, 0, 0, 1, 1,
-0.1720275, -0.6203458, -2.383759, 0, 0, 0, 1, 1,
-0.1703401, -0.0995812, -2.311063, 0, 0, 0, 1, 1,
-0.1673602, -1.168426, -3.522863, 0, 0, 0, 1, 1,
-0.1634261, 0.4210812, -1.045667, 1, 1, 1, 1, 1,
-0.1618717, 1.502669, 0.2743265, 1, 1, 1, 1, 1,
-0.160667, 1.49273, 0.5843112, 1, 1, 1, 1, 1,
-0.1605735, 0.9492366, -0.06021416, 1, 1, 1, 1, 1,
-0.153921, 0.9123268, -0.5943316, 1, 1, 1, 1, 1,
-0.1523637, 0.7758247, -0.4255557, 1, 1, 1, 1, 1,
-0.1460802, -0.6020316, -3.716856, 1, 1, 1, 1, 1,
-0.1446299, -1.224405, -3.221921, 1, 1, 1, 1, 1,
-0.1409269, -2.235538, -2.473956, 1, 1, 1, 1, 1,
-0.1394081, -0.7750645, -0.6240532, 1, 1, 1, 1, 1,
-0.1380413, 1.148158, -1.026511, 1, 1, 1, 1, 1,
-0.1373018, -0.596464, -3.989149, 1, 1, 1, 1, 1,
-0.1320511, -0.2281835, -2.611737, 1, 1, 1, 1, 1,
-0.1244244, -0.2608667, -3.418688, 1, 1, 1, 1, 1,
-0.1235823, 0.2772706, -0.5835446, 1, 1, 1, 1, 1,
-0.1170599, 1.025004, 0.4614616, 0, 0, 1, 1, 1,
-0.09990349, 0.03872848, -0.2233477, 1, 0, 0, 1, 1,
-0.09757836, 0.8508443, -0.1349787, 1, 0, 0, 1, 1,
-0.09509233, 0.03089513, -1.729427, 1, 0, 0, 1, 1,
-0.09449971, -0.2275522, -3.438869, 1, 0, 0, 1, 1,
-0.09317876, -1.477735, -2.756238, 1, 0, 0, 1, 1,
-0.09249201, -1.896796, -3.507899, 0, 0, 0, 1, 1,
-0.09013283, -0.5969765, -2.582898, 0, 0, 0, 1, 1,
-0.08964396, -1.01711, -3.059878, 0, 0, 0, 1, 1,
-0.08952658, 0.1823135, -0.1365489, 0, 0, 0, 1, 1,
-0.0879776, -0.2901846, -2.467275, 0, 0, 0, 1, 1,
-0.08786536, 0.4373098, 0.3027858, 0, 0, 0, 1, 1,
-0.08521621, -0.5260311, -2.487002, 0, 0, 0, 1, 1,
-0.08486834, -0.4969397, -1.335954, 1, 1, 1, 1, 1,
-0.07954087, 0.7083212, -0.8407049, 1, 1, 1, 1, 1,
-0.0767765, -0.7635284, -1.036102, 1, 1, 1, 1, 1,
-0.07083789, -1.440578, -2.164551, 1, 1, 1, 1, 1,
-0.07066379, -1.312053, -3.203306, 1, 1, 1, 1, 1,
-0.07004515, 0.6699401, 0.6999867, 1, 1, 1, 1, 1,
-0.06255594, 3.400109, 0.2154292, 1, 1, 1, 1, 1,
-0.06218021, -1.411811, -2.512048, 1, 1, 1, 1, 1,
-0.05912218, -1.523798, -2.401956, 1, 1, 1, 1, 1,
-0.05188801, 0.4805632, -0.6217191, 1, 1, 1, 1, 1,
-0.05021657, -0.8201327, -2.732198, 1, 1, 1, 1, 1,
-0.04246037, -1.865313, -2.91558, 1, 1, 1, 1, 1,
-0.0406776, -0.8798608, -3.470405, 1, 1, 1, 1, 1,
-0.04046881, 0.2501573, -0.7496091, 1, 1, 1, 1, 1,
-0.03445855, 2.148853, -0.3245153, 1, 1, 1, 1, 1,
-0.03164246, 2.289781, 1.258319, 0, 0, 1, 1, 1,
-0.03102666, 0.1576086, 0.4710636, 1, 0, 0, 1, 1,
-0.0291499, -0.1468902, -3.598669, 1, 0, 0, 1, 1,
-0.02798077, 0.3123306, -0.04552898, 1, 0, 0, 1, 1,
-0.02553607, 1.080997, -0.03749503, 1, 0, 0, 1, 1,
-0.0219657, -0.5034924, -2.67183, 1, 0, 0, 1, 1,
-0.02134594, -1.062476, -3.23999, 0, 0, 0, 1, 1,
-0.02126156, 0.4291652, -0.8235089, 0, 0, 0, 1, 1,
-0.02048992, -0.2280239, -0.7328702, 0, 0, 0, 1, 1,
-0.01920423, 0.9575272, 0.02444107, 0, 0, 0, 1, 1,
-0.01227812, -0.3703713, -3.65804, 0, 0, 0, 1, 1,
-0.0116121, -1.216553, -3.719049, 0, 0, 0, 1, 1,
-0.009713843, 0.9598967, -0.09627753, 0, 0, 0, 1, 1,
-0.002634914, -1.031797, -3.257646, 1, 1, 1, 1, 1,
-0.002126555, -0.8644503, -2.691899, 1, 1, 1, 1, 1,
0.001086673, -1.206503, 3.363983, 1, 1, 1, 1, 1,
0.006001726, 0.4752903, 0.4286143, 1, 1, 1, 1, 1,
0.00620504, -1.099868, 4.76739, 1, 1, 1, 1, 1,
0.007517506, 0.4969471, 0.4508243, 1, 1, 1, 1, 1,
0.01192962, 1.272368, 0.5117731, 1, 1, 1, 1, 1,
0.01664805, -0.3349419, 3.955959, 1, 1, 1, 1, 1,
0.01993301, -0.9358487, 4.192128, 1, 1, 1, 1, 1,
0.02170471, -0.7330782, 1.892585, 1, 1, 1, 1, 1,
0.02247597, 0.2355337, 0.5067964, 1, 1, 1, 1, 1,
0.02624558, 0.6896817, -1.2669, 1, 1, 1, 1, 1,
0.03080637, 0.2828104, 0.471627, 1, 1, 1, 1, 1,
0.03245207, -0.1612387, 1.905588, 1, 1, 1, 1, 1,
0.03328068, -1.389531, 3.706411, 1, 1, 1, 1, 1,
0.0361529, 0.3827591, 0.715134, 0, 0, 1, 1, 1,
0.03958391, 0.03845382, 1.363064, 1, 0, 0, 1, 1,
0.03999558, -0.2792587, 2.883764, 1, 0, 0, 1, 1,
0.04140148, 2.787517, 0.1897032, 1, 0, 0, 1, 1,
0.0466537, -0.2572832, 2.998583, 1, 0, 0, 1, 1,
0.0469217, 1.05043, 1.600192, 1, 0, 0, 1, 1,
0.04769104, -0.3366884, 4.40904, 0, 0, 0, 1, 1,
0.04947186, 0.9105378, 1.654415, 0, 0, 0, 1, 1,
0.05112525, -1.2033, 3.428147, 0, 0, 0, 1, 1,
0.05949184, -1.387362, 6.152506, 0, 0, 0, 1, 1,
0.05949931, 0.7103681, -0.1637228, 0, 0, 0, 1, 1,
0.06295604, -2.097952, 2.539382, 0, 0, 0, 1, 1,
0.0647879, -1.003946, 3.988138, 0, 0, 0, 1, 1,
0.06687883, 2.245419, 0.8803473, 1, 1, 1, 1, 1,
0.07095437, -0.9750785, 3.731029, 1, 1, 1, 1, 1,
0.0738489, 1.31521, -0.09409952, 1, 1, 1, 1, 1,
0.07429022, 2.906381, -0.7043189, 1, 1, 1, 1, 1,
0.07484379, -0.9837126, 3.820216, 1, 1, 1, 1, 1,
0.08102369, -1.201768, 4.162567, 1, 1, 1, 1, 1,
0.08121086, -1.572529, 2.371715, 1, 1, 1, 1, 1,
0.08161794, -0.07870173, 2.461127, 1, 1, 1, 1, 1,
0.09026031, -1.044933, 4.420465, 1, 1, 1, 1, 1,
0.09154327, 2.522491, 0.7420247, 1, 1, 1, 1, 1,
0.09332463, -1.777749, 3.013541, 1, 1, 1, 1, 1,
0.0933473, 0.2611744, 0.6952514, 1, 1, 1, 1, 1,
0.09546166, 1.098425, -1.179892, 1, 1, 1, 1, 1,
0.09702447, 0.3190914, 0.511672, 1, 1, 1, 1, 1,
0.09754587, -0.7099004, 1.472875, 1, 1, 1, 1, 1,
0.1001552, 0.6382383, -0.7811261, 0, 0, 1, 1, 1,
0.1021567, 0.7026609, 0.920208, 1, 0, 0, 1, 1,
0.1026415, 0.548994, -0.5736862, 1, 0, 0, 1, 1,
0.1030641, 0.9354035, -0.369252, 1, 0, 0, 1, 1,
0.1050956, 0.9709416, 0.05781299, 1, 0, 0, 1, 1,
0.1060204, -0.125629, 1.928475, 1, 0, 0, 1, 1,
0.1082491, -0.1743861, 1.871132, 0, 0, 0, 1, 1,
0.1094467, 0.3629591, -1.559868, 0, 0, 0, 1, 1,
0.1119959, 0.01317705, 0.4953362, 0, 0, 0, 1, 1,
0.1122909, -0.8066853, 3.966082, 0, 0, 0, 1, 1,
0.1144758, 1.013918, -1.602359, 0, 0, 0, 1, 1,
0.1186991, 0.2945689, 0.697633, 0, 0, 0, 1, 1,
0.1193326, 1.187062, -0.6657114, 0, 0, 0, 1, 1,
0.1212031, 0.2291397, 0.9113621, 1, 1, 1, 1, 1,
0.121669, -1.774243, 3.531795, 1, 1, 1, 1, 1,
0.1243323, 1.885808, -0.2795153, 1, 1, 1, 1, 1,
0.1247811, -0.5883844, 3.374199, 1, 1, 1, 1, 1,
0.1295198, -0.5110355, 3.654041, 1, 1, 1, 1, 1,
0.1315774, -0.3119969, 2.627583, 1, 1, 1, 1, 1,
0.1348812, -1.052035, 3.627879, 1, 1, 1, 1, 1,
0.1350866, -1.101335, 3.034083, 1, 1, 1, 1, 1,
0.1360205, -0.05485089, 3.87012, 1, 1, 1, 1, 1,
0.1361795, 0.7553777, -0.02788279, 1, 1, 1, 1, 1,
0.143661, -0.1015608, 1.328953, 1, 1, 1, 1, 1,
0.1442574, -1.443441, 3.060597, 1, 1, 1, 1, 1,
0.1446529, -1.304619, 3.61251, 1, 1, 1, 1, 1,
0.145683, -0.5857707, 2.741683, 1, 1, 1, 1, 1,
0.1459728, -0.9780929, 2.793447, 1, 1, 1, 1, 1,
0.1460446, -0.4305843, 2.508584, 0, 0, 1, 1, 1,
0.1464636, 1.022781, -1.231733, 1, 0, 0, 1, 1,
0.1467025, -0.8437197, 3.658959, 1, 0, 0, 1, 1,
0.1475997, 0.7468455, 2.619756, 1, 0, 0, 1, 1,
0.1479726, 1.430312, 1.488685, 1, 0, 0, 1, 1,
0.1526963, 0.8326405, -0.6732394, 1, 0, 0, 1, 1,
0.155542, -0.530309, 2.691289, 0, 0, 0, 1, 1,
0.1580754, -0.1218135, 2.060597, 0, 0, 0, 1, 1,
0.1587158, 0.7580692, 0.701965, 0, 0, 0, 1, 1,
0.1605474, -3.110454, 2.579034, 0, 0, 0, 1, 1,
0.1624206, -0.5471179, 2.762714, 0, 0, 0, 1, 1,
0.1627521, -0.7337652, 2.561967, 0, 0, 0, 1, 1,
0.163583, 0.5363246, 0.1262602, 0, 0, 0, 1, 1,
0.1662567, 0.7700394, -0.1766524, 1, 1, 1, 1, 1,
0.1662801, -1.294935, 3.393385, 1, 1, 1, 1, 1,
0.1667375, -0.7740312, 2.597508, 1, 1, 1, 1, 1,
0.1668143, 0.9282197, 1.068422, 1, 1, 1, 1, 1,
0.1691414, -0.314818, 2.599344, 1, 1, 1, 1, 1,
0.1691544, 0.7868601, -0.7013593, 1, 1, 1, 1, 1,
0.176196, 0.03726029, 0.9922561, 1, 1, 1, 1, 1,
0.1766228, -1.709456, 2.427948, 1, 1, 1, 1, 1,
0.1802837, 0.2347292, 1.046633, 1, 1, 1, 1, 1,
0.1860109, 1.60832, 0.8784578, 1, 1, 1, 1, 1,
0.1869316, 0.2559091, 1.47634, 1, 1, 1, 1, 1,
0.1939203, 0.1141771, 0.6493986, 1, 1, 1, 1, 1,
0.1983436, 1.1891, -0.6119484, 1, 1, 1, 1, 1,
0.1992801, -0.1624123, 1.304252, 1, 1, 1, 1, 1,
0.2035889, -0.5959787, 2.219047, 1, 1, 1, 1, 1,
0.2064804, -1.059775, 1.092671, 0, 0, 1, 1, 1,
0.2073154, -0.3612998, 1.304218, 1, 0, 0, 1, 1,
0.207439, -0.4255871, 1.852423, 1, 0, 0, 1, 1,
0.2084467, -0.09609988, 1.110451, 1, 0, 0, 1, 1,
0.2109307, -0.27522, 2.248817, 1, 0, 0, 1, 1,
0.210947, -0.9508566, 3.119798, 1, 0, 0, 1, 1,
0.2136437, -0.881231, 1.545089, 0, 0, 0, 1, 1,
0.2148067, -0.9598281, 3.269456, 0, 0, 0, 1, 1,
0.2159161, -1.019456, 3.765136, 0, 0, 0, 1, 1,
0.2163789, 0.936513, 1.101469, 0, 0, 0, 1, 1,
0.2175944, 0.3417187, 0.9853132, 0, 0, 0, 1, 1,
0.2194867, -1.46195, 1.073738, 0, 0, 0, 1, 1,
0.2217786, 1.066428, -0.3945827, 0, 0, 0, 1, 1,
0.2221889, -1.178721, 2.651122, 1, 1, 1, 1, 1,
0.2226202, -0.6563762, 2.454667, 1, 1, 1, 1, 1,
0.2238702, 0.01702782, 2.919017, 1, 1, 1, 1, 1,
0.2301672, 0.7287431, 3.669551, 1, 1, 1, 1, 1,
0.2321422, -1.855762, 2.358665, 1, 1, 1, 1, 1,
0.241133, 1.653484, -0.01880449, 1, 1, 1, 1, 1,
0.2432731, 0.598088, 1.796018, 1, 1, 1, 1, 1,
0.2458326, 0.5836317, 0.6684455, 1, 1, 1, 1, 1,
0.2499441, -0.4333878, 0.3430477, 1, 1, 1, 1, 1,
0.2534973, -0.1358616, 1.401293, 1, 1, 1, 1, 1,
0.2597416, 0.2050636, 1.308493, 1, 1, 1, 1, 1,
0.2686264, -1.286356, 3.367341, 1, 1, 1, 1, 1,
0.2697844, -0.09027858, 2.799088, 1, 1, 1, 1, 1,
0.2720288, 2.095865, -0.2085947, 1, 1, 1, 1, 1,
0.2789647, -1.135048, 4.110192, 1, 1, 1, 1, 1,
0.2804732, 1.206797, -0.7716946, 0, 0, 1, 1, 1,
0.2810763, 0.7960901, -1.371578, 1, 0, 0, 1, 1,
0.2813898, -0.1278397, 2.267455, 1, 0, 0, 1, 1,
0.282498, -0.8964094, 2.016901, 1, 0, 0, 1, 1,
0.2865377, -1.250046, 3.926984, 1, 0, 0, 1, 1,
0.2922605, -0.3188474, 3.716683, 1, 0, 0, 1, 1,
0.292406, 0.1729183, 1.330354, 0, 0, 0, 1, 1,
0.2952005, -2.067931, 1.976247, 0, 0, 0, 1, 1,
0.295821, -0.9218715, 3.366616, 0, 0, 0, 1, 1,
0.300437, -0.6114787, 3.863824, 0, 0, 0, 1, 1,
0.3021843, 1.37075, -0.1921511, 0, 0, 0, 1, 1,
0.3026524, 0.7084782, 0.3292277, 0, 0, 0, 1, 1,
0.3104077, -2.210479, 3.866061, 0, 0, 0, 1, 1,
0.3111483, -0.959924, 2.527276, 1, 1, 1, 1, 1,
0.3123604, 0.5330362, 1.07642, 1, 1, 1, 1, 1,
0.3162404, -0.967361, 2.33896, 1, 1, 1, 1, 1,
0.3171228, 1.011122, 0.3617563, 1, 1, 1, 1, 1,
0.3230079, 0.9114366, 1.365323, 1, 1, 1, 1, 1,
0.3300649, 0.2623487, 2.098931, 1, 1, 1, 1, 1,
0.3376568, -1.311939, 2.494278, 1, 1, 1, 1, 1,
0.3388748, -0.5160968, 2.94288, 1, 1, 1, 1, 1,
0.3390443, -0.5837214, 2.912521, 1, 1, 1, 1, 1,
0.340178, -0.01738955, 2.085975, 1, 1, 1, 1, 1,
0.3411261, -1.449791, 4.098035, 1, 1, 1, 1, 1,
0.3433724, -0.5320629, 3.302602, 1, 1, 1, 1, 1,
0.3449728, -2.141152, 2.330193, 1, 1, 1, 1, 1,
0.3449846, -0.9920343, 2.789475, 1, 1, 1, 1, 1,
0.3463344, 0.2380438, 0.7434652, 1, 1, 1, 1, 1,
0.3538944, -1.345687, 3.343466, 0, 0, 1, 1, 1,
0.3591732, -0.6568677, 3.878966, 1, 0, 0, 1, 1,
0.3784906, 0.005887279, 1.31849, 1, 0, 0, 1, 1,
0.379388, -0.3107947, 1.11666, 1, 0, 0, 1, 1,
0.3809251, -1.284049, 5.057923, 1, 0, 0, 1, 1,
0.3819071, -0.5344986, 2.132985, 1, 0, 0, 1, 1,
0.3906929, -0.00328013, 2.911458, 0, 0, 0, 1, 1,
0.3916771, -3.00563, 2.961541, 0, 0, 0, 1, 1,
0.3917963, -0.4998055, 1.59458, 0, 0, 0, 1, 1,
0.3937307, -0.8256418, 2.423275, 0, 0, 0, 1, 1,
0.3944, -1.466817, 1.680548, 0, 0, 0, 1, 1,
0.3946028, 0.1847787, 1.408767, 0, 0, 0, 1, 1,
0.3955237, -1.624113, 2.606196, 0, 0, 0, 1, 1,
0.4035113, -0.2715888, 3.271818, 1, 1, 1, 1, 1,
0.4035467, -0.2885463, 2.821327, 1, 1, 1, 1, 1,
0.403983, 0.6484279, 0.2806001, 1, 1, 1, 1, 1,
0.4043395, -0.217995, 0.5560334, 1, 1, 1, 1, 1,
0.4075849, 0.3108202, 1.288579, 1, 1, 1, 1, 1,
0.4101003, 2.590082, 1.41862, 1, 1, 1, 1, 1,
0.4130433, 0.2168025, 2.672945, 1, 1, 1, 1, 1,
0.4137442, 1.342656, 1.292017, 1, 1, 1, 1, 1,
0.4162191, 0.99969, 2.356706, 1, 1, 1, 1, 1,
0.4175591, -0.3193408, 2.612865, 1, 1, 1, 1, 1,
0.4184569, 0.9262443, 0.5712303, 1, 1, 1, 1, 1,
0.4214181, -0.1180227, 1.012695, 1, 1, 1, 1, 1,
0.4255229, -0.5366009, 1.864443, 1, 1, 1, 1, 1,
0.4285321, 0.1265044, 0.5934436, 1, 1, 1, 1, 1,
0.4291598, -0.7912368, 2.742297, 1, 1, 1, 1, 1,
0.4315887, -0.8865411, 0.416094, 0, 0, 1, 1, 1,
0.4318585, 0.1698963, 2.634062, 1, 0, 0, 1, 1,
0.43332, -0.4668573, 3.131059, 1, 0, 0, 1, 1,
0.4337201, -0.8591176, 4.378775, 1, 0, 0, 1, 1,
0.4349581, 0.4483687, 0.6853951, 1, 0, 0, 1, 1,
0.4367046, -1.035072, 2.72318, 1, 0, 0, 1, 1,
0.4367756, 1.698672, 0.7165892, 0, 0, 0, 1, 1,
0.4414293, 0.208818, 0.5935046, 0, 0, 0, 1, 1,
0.441577, -0.9572458, 2.286871, 0, 0, 0, 1, 1,
0.4434306, -0.2104634, 2.540652, 0, 0, 0, 1, 1,
0.4448034, 1.659659, -2.198705, 0, 0, 0, 1, 1,
0.4464651, -0.3815689, 2.462163, 0, 0, 0, 1, 1,
0.450699, 1.644988, 0.8234602, 0, 0, 0, 1, 1,
0.4580947, -0.0533273, 1.204805, 1, 1, 1, 1, 1,
0.459523, 1.152833, 1.959844, 1, 1, 1, 1, 1,
0.4599031, 1.676776, -0.6073729, 1, 1, 1, 1, 1,
0.4616529, -1.233398, 4.641431, 1, 1, 1, 1, 1,
0.4642959, -0.8563667, 1.965525, 1, 1, 1, 1, 1,
0.4658753, -0.411818, 3.189691, 1, 1, 1, 1, 1,
0.4686736, -0.7177867, 1.072347, 1, 1, 1, 1, 1,
0.4694082, 1.737251, 0.9166828, 1, 1, 1, 1, 1,
0.4780656, -0.6424271, 3.86019, 1, 1, 1, 1, 1,
0.4806681, 0.395546, 0.4471591, 1, 1, 1, 1, 1,
0.4836287, -0.7704247, 1.815148, 1, 1, 1, 1, 1,
0.4862823, -0.9442587, 1.336098, 1, 1, 1, 1, 1,
0.4956239, 1.490347, 1.320402, 1, 1, 1, 1, 1,
0.4988662, 0.357474, 1.034849, 1, 1, 1, 1, 1,
0.4992861, -2.223082, 3.901421, 1, 1, 1, 1, 1,
0.500044, -1.036085, 3.334715, 0, 0, 1, 1, 1,
0.5024219, 0.7466254, 1.759516, 1, 0, 0, 1, 1,
0.5024554, 2.100522, -1.154589, 1, 0, 0, 1, 1,
0.5078411, 2.096316, 1.682761, 1, 0, 0, 1, 1,
0.5082161, 0.182997, 2.082968, 1, 0, 0, 1, 1,
0.5083502, 0.096441, 0.2150373, 1, 0, 0, 1, 1,
0.5091321, -0.2964652, 0.9050662, 0, 0, 0, 1, 1,
0.5197865, -1.349942, 3.169308, 0, 0, 0, 1, 1,
0.5344728, 0.1124453, 0.556797, 0, 0, 0, 1, 1,
0.5346505, -0.6516578, 3.2789, 0, 0, 0, 1, 1,
0.5368339, -0.8856507, 3.411499, 0, 0, 0, 1, 1,
0.5420646, -0.7181078, 2.651958, 0, 0, 0, 1, 1,
0.5431792, -1.509071, 2.55319, 0, 0, 0, 1, 1,
0.5432658, -1.456883, 2.41245, 1, 1, 1, 1, 1,
0.5451334, -0.275644, 1.029836, 1, 1, 1, 1, 1,
0.5568925, -1.912582, 2.648477, 1, 1, 1, 1, 1,
0.5596856, -0.2436199, 2.542306, 1, 1, 1, 1, 1,
0.5605421, 0.5972065, 0.5562161, 1, 1, 1, 1, 1,
0.5626123, -0.1300334, 0.4031675, 1, 1, 1, 1, 1,
0.5658365, 0.1513318, 1.704596, 1, 1, 1, 1, 1,
0.5697966, 0.272271, 3.704677, 1, 1, 1, 1, 1,
0.5729331, -1.165145, 1.676704, 1, 1, 1, 1, 1,
0.5729403, 0.5157976, 0.4602574, 1, 1, 1, 1, 1,
0.5780334, -1.067115, 3.384654, 1, 1, 1, 1, 1,
0.5787976, -0.8991308, 3.389861, 1, 1, 1, 1, 1,
0.5819142, 0.8393377, 1.64409, 1, 1, 1, 1, 1,
0.5860714, -0.4283801, 2.667526, 1, 1, 1, 1, 1,
0.5873086, 0.3397079, -0.06862888, 1, 1, 1, 1, 1,
0.5873627, 0.9734503, 1.118846, 0, 0, 1, 1, 1,
0.5930189, -0.2566198, 3.244659, 1, 0, 0, 1, 1,
0.5937679, -1.744012, 2.397144, 1, 0, 0, 1, 1,
0.597032, -1.062026, 3.194211, 1, 0, 0, 1, 1,
0.5989724, -1.633282, 4.362574, 1, 0, 0, 1, 1,
0.6020097, 0.2603874, 3.722836, 1, 0, 0, 1, 1,
0.6041419, -1.11338, 2.801394, 0, 0, 0, 1, 1,
0.608932, 1.950993, 0.2054764, 0, 0, 0, 1, 1,
0.6126182, 1.200403, -0.7261117, 0, 0, 0, 1, 1,
0.6160049, -1.419131, 3.742173, 0, 0, 0, 1, 1,
0.6165523, 0.7212427, 0.008527566, 0, 0, 0, 1, 1,
0.6192768, 0.7948882, 0.4274915, 0, 0, 0, 1, 1,
0.6215317, -0.06379443, 0.5101472, 0, 0, 0, 1, 1,
0.6217902, 1.78344, 0.6868697, 1, 1, 1, 1, 1,
0.6231639, -0.6210263, 1.16092, 1, 1, 1, 1, 1,
0.6236634, -0.2911695, 2.88233, 1, 1, 1, 1, 1,
0.6262284, 1.529193, -0.9244134, 1, 1, 1, 1, 1,
0.6279253, -0.2553714, 0.5684262, 1, 1, 1, 1, 1,
0.6294601, 0.8617014, 0.03884912, 1, 1, 1, 1, 1,
0.6327413, -0.1401594, 2.348839, 1, 1, 1, 1, 1,
0.6327512, 1.006319, -0.4166014, 1, 1, 1, 1, 1,
0.634869, 1.40481, -0.940913, 1, 1, 1, 1, 1,
0.6398997, 0.754302, 1.913481, 1, 1, 1, 1, 1,
0.6441598, -0.6467813, 1.193434, 1, 1, 1, 1, 1,
0.646512, 0.1724281, 1.518428, 1, 1, 1, 1, 1,
0.6537032, -0.9944544, 0.7682498, 1, 1, 1, 1, 1,
0.6627648, 1.881325, 0.09399593, 1, 1, 1, 1, 1,
0.6631359, -1.1097, 2.273529, 1, 1, 1, 1, 1,
0.6647318, 0.2452458, 0.4849807, 0, 0, 1, 1, 1,
0.6680675, -1.184965, 2.030019, 1, 0, 0, 1, 1,
0.671178, -0.4320161, 0.919274, 1, 0, 0, 1, 1,
0.6722544, -1.065448, 0.680315, 1, 0, 0, 1, 1,
0.6727273, -0.1712625, 1.819915, 1, 0, 0, 1, 1,
0.6727911, 0.3489804, 2.973468, 1, 0, 0, 1, 1,
0.673115, -1.097044, 4.653756, 0, 0, 0, 1, 1,
0.6771337, 0.2854488, 0.9026876, 0, 0, 0, 1, 1,
0.6826528, 0.07449228, 3.386027, 0, 0, 0, 1, 1,
0.6938521, -0.8427176, 2.216456, 0, 0, 0, 1, 1,
0.6938838, 0.4469104, 0.6939017, 0, 0, 0, 1, 1,
0.6946102, -1.169785, 2.445354, 0, 0, 0, 1, 1,
0.6960263, 0.5239719, 1.927753, 0, 0, 0, 1, 1,
0.6961723, 0.7486743, 0.2705677, 1, 1, 1, 1, 1,
0.6964335, -0.2121455, 1.742031, 1, 1, 1, 1, 1,
0.6986906, -2.284536, 4.490638, 1, 1, 1, 1, 1,
0.6990876, -0.6432387, 2.290267, 1, 1, 1, 1, 1,
0.7004146, -0.6019479, 4.094051, 1, 1, 1, 1, 1,
0.7040265, 1.731827, 1.63689, 1, 1, 1, 1, 1,
0.70977, -2.417974, 4.604854, 1, 1, 1, 1, 1,
0.7179172, 0.8822236, -0.2613432, 1, 1, 1, 1, 1,
0.719901, -1.112389, 4.582966, 1, 1, 1, 1, 1,
0.7218816, 2.087503, 0.4199809, 1, 1, 1, 1, 1,
0.7257714, -0.749137, 2.786417, 1, 1, 1, 1, 1,
0.7259212, -0.1114629, 2.068265, 1, 1, 1, 1, 1,
0.7279463, -0.6674653, 1.505059, 1, 1, 1, 1, 1,
0.7306062, 2.014738, -0.6335572, 1, 1, 1, 1, 1,
0.7381772, 0.7720565, -0.2773561, 1, 1, 1, 1, 1,
0.7408924, -0.8493322, 3.394761, 0, 0, 1, 1, 1,
0.7417628, 1.026115, 1.354925, 1, 0, 0, 1, 1,
0.7433805, 0.02829325, 1.317548, 1, 0, 0, 1, 1,
0.7578278, 1.117138, 0.9580852, 1, 0, 0, 1, 1,
0.758152, 1.68875, -0.08120069, 1, 0, 0, 1, 1,
0.7628711, 0.09688546, 2.724021, 1, 0, 0, 1, 1,
0.7701721, 0.6097761, -0.4787087, 0, 0, 0, 1, 1,
0.7711796, -0.5350052, 2.273344, 0, 0, 0, 1, 1,
0.7718745, -0.6146799, 2.29076, 0, 0, 0, 1, 1,
0.7871175, -1.399848, 2.886035, 0, 0, 0, 1, 1,
0.7929109, 0.5875706, 1.8778, 0, 0, 0, 1, 1,
0.7930128, -1.134217, 2.183736, 0, 0, 0, 1, 1,
0.7931379, 1.048906, -0.9792647, 0, 0, 0, 1, 1,
0.7935579, -1.02287, 4.63564, 1, 1, 1, 1, 1,
0.794094, 0.979488, 0.8729938, 1, 1, 1, 1, 1,
0.8118057, 0.7489136, 0.3010471, 1, 1, 1, 1, 1,
0.8119949, 0.1639429, 0.104649, 1, 1, 1, 1, 1,
0.8184845, 1.374246, 1.159384, 1, 1, 1, 1, 1,
0.8229901, -1.223639, 4.494785, 1, 1, 1, 1, 1,
0.8252599, 2.854055, 1.42893, 1, 1, 1, 1, 1,
0.8274709, 0.0550536, 1.512729, 1, 1, 1, 1, 1,
0.8290054, 1.324791, -1.083116, 1, 1, 1, 1, 1,
0.8438786, 1.879297, -0.4017833, 1, 1, 1, 1, 1,
0.8449794, 1.098145, 0.369753, 1, 1, 1, 1, 1,
0.8502998, -0.289218, 0.9100521, 1, 1, 1, 1, 1,
0.8520299, -0.05299345, 2.685165, 1, 1, 1, 1, 1,
0.8525167, 0.7082679, 0.7727888, 1, 1, 1, 1, 1,
0.8588824, 0.6181508, 1.054133, 1, 1, 1, 1, 1,
0.8656904, 0.1066531, 0.522161, 0, 0, 1, 1, 1,
0.8659326, 0.2749741, 1.012578, 1, 0, 0, 1, 1,
0.8665438, -0.2674667, 2.362016, 1, 0, 0, 1, 1,
0.8777562, -0.04664597, 1.910759, 1, 0, 0, 1, 1,
0.8808569, -0.3985149, 2.252796, 1, 0, 0, 1, 1,
0.8926565, 0.4333536, 1.707198, 1, 0, 0, 1, 1,
0.8930183, 0.2347973, 2.031467, 0, 0, 0, 1, 1,
0.8947523, -0.7986171, 1.610986, 0, 0, 0, 1, 1,
0.8967919, -1.346725, 3.011582, 0, 0, 0, 1, 1,
0.9046665, 0.1280479, 0.9664491, 0, 0, 0, 1, 1,
0.911244, -0.4001262, 2.338071, 0, 0, 0, 1, 1,
0.9174902, -0.7233354, 5.156647, 0, 0, 0, 1, 1,
0.919235, 0.06313743, 2.019754, 0, 0, 0, 1, 1,
0.9281645, 0.2355591, 1.16285, 1, 1, 1, 1, 1,
0.9295753, -0.5437704, 1.625935, 1, 1, 1, 1, 1,
0.9312249, -0.3133791, 1.195801, 1, 1, 1, 1, 1,
0.9331785, -0.9366336, 3.43717, 1, 1, 1, 1, 1,
0.942577, -0.5763488, 3.524856, 1, 1, 1, 1, 1,
0.9431689, -1.284177, 1.960895, 1, 1, 1, 1, 1,
0.9440639, -1.214757, 4.085287, 1, 1, 1, 1, 1,
0.9441805, 0.8343993, -1.403208, 1, 1, 1, 1, 1,
0.9460471, 0.2647397, -0.4925827, 1, 1, 1, 1, 1,
0.9519596, 1.281786, 0.4779284, 1, 1, 1, 1, 1,
0.9578765, 1.185106, 0.3344462, 1, 1, 1, 1, 1,
0.9616713, -0.5719686, 2.77681, 1, 1, 1, 1, 1,
0.966812, -1.481508, 3.807749, 1, 1, 1, 1, 1,
0.9678533, -1.159509, 2.979811, 1, 1, 1, 1, 1,
0.9726613, 0.4760035, -0.8602688, 1, 1, 1, 1, 1,
0.9736973, 0.8304314, 1.616348, 0, 0, 1, 1, 1,
0.9752134, 1.786817, 0.8951633, 1, 0, 0, 1, 1,
0.9752833, -0.596607, 1.151924, 1, 0, 0, 1, 1,
0.9849923, 0.401545, -0.8439171, 1, 0, 0, 1, 1,
0.9882309, -0.04479021, 1.987705, 1, 0, 0, 1, 1,
0.9911133, -0.5066867, 0.2331276, 1, 0, 0, 1, 1,
0.9944391, 1.387506, 0.5826125, 0, 0, 0, 1, 1,
0.9958808, 0.5908817, 0.2591789, 0, 0, 0, 1, 1,
0.997767, 0.3246179, 1.368044, 0, 0, 0, 1, 1,
0.9994719, -2.386791, 1.174449, 0, 0, 0, 1, 1,
1.001729, -1.49176, 4.468066, 0, 0, 0, 1, 1,
1.004452, -0.146787, 2.927666, 0, 0, 0, 1, 1,
1.006571, 1.595805, 1.108122, 0, 0, 0, 1, 1,
1.009016, -0.191233, 1.182357, 1, 1, 1, 1, 1,
1.010668, 0.4919414, 1.783397, 1, 1, 1, 1, 1,
1.012287, 0.5716892, 1.174684, 1, 1, 1, 1, 1,
1.012297, 0.1214168, 1.033371, 1, 1, 1, 1, 1,
1.01662, 1.627758, 1.256278, 1, 1, 1, 1, 1,
1.017683, -0.499631, 2.23623, 1, 1, 1, 1, 1,
1.022135, -1.588605, 1.583437, 1, 1, 1, 1, 1,
1.026662, -0.642622, 2.087272, 1, 1, 1, 1, 1,
1.039532, -0.3177118, 2.341276, 1, 1, 1, 1, 1,
1.040257, -0.5479228, 0.5827691, 1, 1, 1, 1, 1,
1.042103, 1.58184, 0.5455974, 1, 1, 1, 1, 1,
1.045908, -0.632218, 1.559214, 1, 1, 1, 1, 1,
1.047104, 0.3850651, 2.031754, 1, 1, 1, 1, 1,
1.050208, 2.292612, 0.2119396, 1, 1, 1, 1, 1,
1.053567, 0.9186692, 0.4650759, 1, 1, 1, 1, 1,
1.067956, 0.9357078, 2.030068, 0, 0, 1, 1, 1,
1.069751, -0.4355868, 0.9852294, 1, 0, 0, 1, 1,
1.076999, 2.35679, 1.135415, 1, 0, 0, 1, 1,
1.080895, -0.8890837, 1.820716, 1, 0, 0, 1, 1,
1.090975, 0.2661878, 1.581671, 1, 0, 0, 1, 1,
1.092202, -1.086397, 1.482481, 1, 0, 0, 1, 1,
1.093896, 1.086718, 2.357934, 0, 0, 0, 1, 1,
1.095949, 0.8823262, 0.9421806, 0, 0, 0, 1, 1,
1.103261, 1.376525, -0.1512325, 0, 0, 0, 1, 1,
1.110537, -0.365234, 0.5407984, 0, 0, 0, 1, 1,
1.119457, 0.3030501, 0.6873866, 0, 0, 0, 1, 1,
1.122065, 0.883533, 1.31679, 0, 0, 0, 1, 1,
1.124229, 1.999142, 1.177289, 0, 0, 0, 1, 1,
1.124686, -0.273505, 3.495977, 1, 1, 1, 1, 1,
1.124889, 0.6458929, 1.359612, 1, 1, 1, 1, 1,
1.12754, -1.4655, 1.798601, 1, 1, 1, 1, 1,
1.133242, 0.3466616, 1.744131, 1, 1, 1, 1, 1,
1.137248, 1.313378, 2.079803, 1, 1, 1, 1, 1,
1.137871, -0.5812492, 0.7553907, 1, 1, 1, 1, 1,
1.145938, -0.2712793, 1.624086, 1, 1, 1, 1, 1,
1.147609, 0.8239276, 0.5145463, 1, 1, 1, 1, 1,
1.156525, -0.5612979, -0.230086, 1, 1, 1, 1, 1,
1.168431, -0.1371025, 2.657101, 1, 1, 1, 1, 1,
1.168617, 0.1284494, 1.456123, 1, 1, 1, 1, 1,
1.171001, -1.432271, 2.828558, 1, 1, 1, 1, 1,
1.179574, 0.1537773, 0.5964567, 1, 1, 1, 1, 1,
1.18501, 0.7958276, 1.486258, 1, 1, 1, 1, 1,
1.185747, -0.371987, 2.911764, 1, 1, 1, 1, 1,
1.187686, 0.6105145, 0.1809747, 0, 0, 1, 1, 1,
1.187974, -2.218791, 4.114153, 1, 0, 0, 1, 1,
1.19786, -0.6438898, 0.6450511, 1, 0, 0, 1, 1,
1.201246, 0.1483797, 1.371478, 1, 0, 0, 1, 1,
1.20274, 0.01273276, 1.181974, 1, 0, 0, 1, 1,
1.205128, 1.750399, 0.6505226, 1, 0, 0, 1, 1,
1.209163, -0.3854499, 2.985667, 0, 0, 0, 1, 1,
1.21272, 0.8691345, -0.2358667, 0, 0, 0, 1, 1,
1.21906, -1.327815, 3.38602, 0, 0, 0, 1, 1,
1.238617, 1.509985, 0.5266346, 0, 0, 0, 1, 1,
1.240348, 0.3580957, 0.4936346, 0, 0, 0, 1, 1,
1.240606, 0.1597896, 2.792515, 0, 0, 0, 1, 1,
1.25288, -0.8487031, 2.841566, 0, 0, 0, 1, 1,
1.254475, 0.8715114, 1.632478, 1, 1, 1, 1, 1,
1.254489, -0.2502061, 1.288979, 1, 1, 1, 1, 1,
1.254546, 0.5045213, 0.421237, 1, 1, 1, 1, 1,
1.256471, -0.4754974, 2.09721, 1, 1, 1, 1, 1,
1.258391, 0.1027594, 2.107862, 1, 1, 1, 1, 1,
1.258749, 0.1882322, 3.299805, 1, 1, 1, 1, 1,
1.262836, 0.06235223, 2.880648, 1, 1, 1, 1, 1,
1.264282, -0.04360093, 1.334072, 1, 1, 1, 1, 1,
1.269389, -0.01533058, 1.407858, 1, 1, 1, 1, 1,
1.27422, 0.01391025, 2.32481, 1, 1, 1, 1, 1,
1.275545, -0.9389874, 3.184402, 1, 1, 1, 1, 1,
1.282894, -1.047916, 2.107903, 1, 1, 1, 1, 1,
1.288247, -1.681778, 2.770376, 1, 1, 1, 1, 1,
1.28875, -1.169788, 1.531676, 1, 1, 1, 1, 1,
1.292999, -0.6123077, 2.133927, 1, 1, 1, 1, 1,
1.295969, 0.4665676, 1.077713, 0, 0, 1, 1, 1,
1.301532, 0.4622544, 2.601887, 1, 0, 0, 1, 1,
1.301719, 0.08179365, 1.849813, 1, 0, 0, 1, 1,
1.302428, -1.21604, 4.109513, 1, 0, 0, 1, 1,
1.308483, 0.339595, -0.7600923, 1, 0, 0, 1, 1,
1.310959, -0.7540551, 2.844078, 1, 0, 0, 1, 1,
1.316775, -0.2390257, 0.408706, 0, 0, 0, 1, 1,
1.317411, -0.02925313, 1.6702, 0, 0, 0, 1, 1,
1.322452, -0.8447295, 2.895744, 0, 0, 0, 1, 1,
1.327561, 0.8487195, 1.726166, 0, 0, 0, 1, 1,
1.328225, 0.5640214, 0.5316665, 0, 0, 0, 1, 1,
1.332376, 0.1386275, 1.150113, 0, 0, 0, 1, 1,
1.334097, 0.5094874, 0.1102126, 0, 0, 0, 1, 1,
1.340712, -0.6617495, 3.627585, 1, 1, 1, 1, 1,
1.341376, 1.073643, 1.666334, 1, 1, 1, 1, 1,
1.341986, -0.9039866, 1.409277, 1, 1, 1, 1, 1,
1.356533, -1.376492, 1.989554, 1, 1, 1, 1, 1,
1.367384, 1.13924, 0.0287572, 1, 1, 1, 1, 1,
1.387771, -0.9168764, 1.676614, 1, 1, 1, 1, 1,
1.389279, -2.151812, 2.283805, 1, 1, 1, 1, 1,
1.39007, 0.9155462, 0.5950001, 1, 1, 1, 1, 1,
1.395223, 0.1309226, 0.912052, 1, 1, 1, 1, 1,
1.398613, 0.2343518, 0.6359768, 1, 1, 1, 1, 1,
1.398939, -1.704971, 2.930124, 1, 1, 1, 1, 1,
1.406333, 0.702187, 1.29108, 1, 1, 1, 1, 1,
1.408991, -1.502423, 2.60891, 1, 1, 1, 1, 1,
1.410424, -0.364557, 1.613084, 1, 1, 1, 1, 1,
1.412546, 0.868331, 2.073924, 1, 1, 1, 1, 1,
1.417828, -1.059525, 0.8872926, 0, 0, 1, 1, 1,
1.422127, 0.4314819, 2.670667, 1, 0, 0, 1, 1,
1.439737, -0.4501919, 1.849791, 1, 0, 0, 1, 1,
1.443385, 0.1262733, 1.561216, 1, 0, 0, 1, 1,
1.446092, -1.094571, 2.674263, 1, 0, 0, 1, 1,
1.452537, -2.092706, 3.265552, 1, 0, 0, 1, 1,
1.480025, -1.593154, 2.458333, 0, 0, 0, 1, 1,
1.48979, -2.510713, 1.119186, 0, 0, 0, 1, 1,
1.504891, -0.9464887, 1.00433, 0, 0, 0, 1, 1,
1.507675, -1.750909, 3.10825, 0, 0, 0, 1, 1,
1.508151, 0.1367876, 2.490599, 0, 0, 0, 1, 1,
1.526947, 0.194756, 1.087595, 0, 0, 0, 1, 1,
1.540321, 1.073807, -0.233637, 0, 0, 0, 1, 1,
1.545762, -1.622312, 2.355834, 1, 1, 1, 1, 1,
1.546941, -0.7021988, 0.4512162, 1, 1, 1, 1, 1,
1.558462, -0.6284997, 0.5650907, 1, 1, 1, 1, 1,
1.559515, -0.01043332, 0.9376917, 1, 1, 1, 1, 1,
1.559993, 1.248502, 1.961913, 1, 1, 1, 1, 1,
1.599915, 0.3040936, 2.436158, 1, 1, 1, 1, 1,
1.601427, -1.766494, 2.781659, 1, 1, 1, 1, 1,
1.605518, 0.7840952, -1.979853, 1, 1, 1, 1, 1,
1.61658, 0.6484929, 0.6688204, 1, 1, 1, 1, 1,
1.617726, -0.1673085, 1.653923, 1, 1, 1, 1, 1,
1.622738, -0.1712797, 1.652071, 1, 1, 1, 1, 1,
1.629182, -0.2682421, 0.09750168, 1, 1, 1, 1, 1,
1.633133, -2.552177, 2.504841, 1, 1, 1, 1, 1,
1.634412, -1.253649, 2.274056, 1, 1, 1, 1, 1,
1.639292, -1.90721, 1.826773, 1, 1, 1, 1, 1,
1.640592, -0.512127, 1.908567, 0, 0, 1, 1, 1,
1.649254, -1.198113, 3.285677, 1, 0, 0, 1, 1,
1.659046, 0.5249275, 0.8409649, 1, 0, 0, 1, 1,
1.664452, 0.6975187, 1.348894, 1, 0, 0, 1, 1,
1.6726, -0.1204213, 0.7969446, 1, 0, 0, 1, 1,
1.673877, 1.02585, 0.6686251, 1, 0, 0, 1, 1,
1.674904, 0.1976084, 1.871814, 0, 0, 0, 1, 1,
1.695968, 1.245254, 1.743004, 0, 0, 0, 1, 1,
1.711857, -0.9892029, 0.6469693, 0, 0, 0, 1, 1,
1.740238, -0.521182, 1.332813, 0, 0, 0, 1, 1,
1.747062, 0.2556534, 1.554006, 0, 0, 0, 1, 1,
1.748013, -0.1427288, 1.484929, 0, 0, 0, 1, 1,
1.748612, 0.5131423, -0.1247796, 0, 0, 0, 1, 1,
1.768862, 0.9125016, 0.3299015, 1, 1, 1, 1, 1,
1.783264, -0.5290506, -0.5492688, 1, 1, 1, 1, 1,
1.790983, -1.082502, 2.767623, 1, 1, 1, 1, 1,
1.837481, 0.4662502, 1.955805, 1, 1, 1, 1, 1,
1.846169, 0.7894518, 1.093915, 1, 1, 1, 1, 1,
1.867141, 1.435753, 3.191749, 1, 1, 1, 1, 1,
1.869208, -3.022022, 2.229445, 1, 1, 1, 1, 1,
1.898061, 0.6978517, 1.36725, 1, 1, 1, 1, 1,
1.906438, 1.843236, -0.1473498, 1, 1, 1, 1, 1,
1.966534, 1.627807, 1.961065, 1, 1, 1, 1, 1,
1.968884, 0.6718459, -0.1235437, 1, 1, 1, 1, 1,
1.991159, -0.3654381, 1.355307, 1, 1, 1, 1, 1,
2.035313, 0.7730411, 0.001679367, 1, 1, 1, 1, 1,
2.068006, 0.2022233, 0.5357867, 1, 1, 1, 1, 1,
2.074093, 0.2374514, 2.028155, 1, 1, 1, 1, 1,
2.098243, 1.158638, 0.3237185, 0, 0, 1, 1, 1,
2.139549, 0.05343121, 0.6983323, 1, 0, 0, 1, 1,
2.143105, 1.746473, 1.211015, 1, 0, 0, 1, 1,
2.163504, -0.2623273, 3.290444, 1, 0, 0, 1, 1,
2.216486, -0.05560966, 0.9028121, 1, 0, 0, 1, 1,
2.266233, 0.06718202, 2.015004, 1, 0, 0, 1, 1,
2.295089, -0.2138888, 1.562716, 0, 0, 0, 1, 1,
2.331583, -2.091953, 0.991886, 0, 0, 0, 1, 1,
2.350089, -0.04527999, 1.553208, 0, 0, 0, 1, 1,
2.392532, -0.8547843, 2.567431, 0, 0, 0, 1, 1,
2.395898, 0.472856, 0.5356316, 0, 0, 0, 1, 1,
2.424112, -1.601089, -0.1618322, 0, 0, 0, 1, 1,
2.424163, 0.590484, 1.8354, 0, 0, 0, 1, 1,
2.493768, 0.388262, 1.799569, 1, 1, 1, 1, 1,
2.525949, 0.08878362, 2.09262, 1, 1, 1, 1, 1,
2.656984, -0.5780264, 2.59295, 1, 1, 1, 1, 1,
2.674967, 0.0671971, 2.598474, 1, 1, 1, 1, 1,
2.699617, -0.8704494, 1.612611, 1, 1, 1, 1, 1,
3.109503, -1.787789, 0.9359958, 1, 1, 1, 1, 1,
3.411248, 0.6864102, 1.30508, 1, 1, 1, 1, 1
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
var radius = 9.755307;
var distance = 34.2651;
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
mvMatrix.translate( -0.157372, -0.1448269, -0.637392 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.2651);
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
