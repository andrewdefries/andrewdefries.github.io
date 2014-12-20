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
-3.644749, -1.338564, -2.316556, 1, 0, 0, 1,
-2.820335, -0.3272466, -1.836306, 1, 0.007843138, 0, 1,
-2.727796, 0.5230455, -0.4779692, 1, 0.01176471, 0, 1,
-2.685854, 0.5499701, -1.130117, 1, 0.01960784, 0, 1,
-2.565689, 1.906075, -1.140454, 1, 0.02352941, 0, 1,
-2.503413, 0.7912906, -1.814254, 1, 0.03137255, 0, 1,
-2.363507, 0.1497449, -0.8089194, 1, 0.03529412, 0, 1,
-2.336313, 1.460944, -0.9468603, 1, 0.04313726, 0, 1,
-2.310231, 0.8248203, -2.954345, 1, 0.04705882, 0, 1,
-2.307322, 0.4251252, -3.220177, 1, 0.05490196, 0, 1,
-2.297867, 1.4719, -1.714613, 1, 0.05882353, 0, 1,
-2.286134, 1.066818, -2.691245, 1, 0.06666667, 0, 1,
-2.25527, -0.1469899, -0.4583571, 1, 0.07058824, 0, 1,
-2.194787, 2.713267, -0.6868235, 1, 0.07843138, 0, 1,
-2.18106, 0.04951947, -1.753896, 1, 0.08235294, 0, 1,
-2.161669, 0.5876834, -0.970704, 1, 0.09019608, 0, 1,
-2.091285, 0.9326411, -1.280286, 1, 0.09411765, 0, 1,
-2.077349, -0.7287018, -4.155547, 1, 0.1019608, 0, 1,
-2.073505, -1.030163, -1.215872, 1, 0.1098039, 0, 1,
-2.029485, 0.07832606, -2.295174, 1, 0.1137255, 0, 1,
-2.017641, 1.226177, -0.581436, 1, 0.1215686, 0, 1,
-1.973682, -0.7372994, -3.728213, 1, 0.1254902, 0, 1,
-1.97133, -0.9441814, -1.242787, 1, 0.1333333, 0, 1,
-1.967972, -0.05038457, -1.165751, 1, 0.1372549, 0, 1,
-1.96141, 0.6739885, -2.720984, 1, 0.145098, 0, 1,
-1.958977, -0.1342031, -3.35818, 1, 0.1490196, 0, 1,
-1.953935, 0.2124328, -2.485134, 1, 0.1568628, 0, 1,
-1.952254, 1.205932, -2.021753, 1, 0.1607843, 0, 1,
-1.930369, 0.9637001, -2.878998, 1, 0.1686275, 0, 1,
-1.92439, -0.4430479, -1.654997, 1, 0.172549, 0, 1,
-1.918961, 0.4320026, -2.509604, 1, 0.1803922, 0, 1,
-1.893894, -0.6260046, -2.900657, 1, 0.1843137, 0, 1,
-1.878414, 0.2994373, -2.207487, 1, 0.1921569, 0, 1,
-1.877334, 4.060455, 0.09175023, 1, 0.1960784, 0, 1,
-1.875572, 0.518271, 0.7385111, 1, 0.2039216, 0, 1,
-1.860298, 1.328119, -2.986324, 1, 0.2117647, 0, 1,
-1.855724, 1.000159, -1.381354, 1, 0.2156863, 0, 1,
-1.82313, -0.1850243, -1.410621, 1, 0.2235294, 0, 1,
-1.809275, 0.8695858, -0.7278835, 1, 0.227451, 0, 1,
-1.78779, 0.3635284, -2.259347, 1, 0.2352941, 0, 1,
-1.779583, 0.5318815, -0.8730757, 1, 0.2392157, 0, 1,
-1.756802, 0.1991812, -0.06712827, 1, 0.2470588, 0, 1,
-1.743256, -1.192017, -2.5885, 1, 0.2509804, 0, 1,
-1.741366, -1.430999, -2.913006, 1, 0.2588235, 0, 1,
-1.716021, -1.210991, -2.282578, 1, 0.2627451, 0, 1,
-1.715509, -0.504843, -1.359208, 1, 0.2705882, 0, 1,
-1.709315, -1.390329, -1.327403, 1, 0.2745098, 0, 1,
-1.701447, 0.4608376, 0.1397073, 1, 0.282353, 0, 1,
-1.668354, 0.04770904, -2.237786, 1, 0.2862745, 0, 1,
-1.662483, 1.010315, -1.554837, 1, 0.2941177, 0, 1,
-1.658142, 0.1875444, -0.4903202, 1, 0.3019608, 0, 1,
-1.63481, 0.5668464, -1.338639, 1, 0.3058824, 0, 1,
-1.621705, -0.458015, -0.7362211, 1, 0.3137255, 0, 1,
-1.616663, -0.2731923, -2.232606, 1, 0.3176471, 0, 1,
-1.616142, -0.1414469, -3.432316, 1, 0.3254902, 0, 1,
-1.601045, 0.7359591, -0.2498186, 1, 0.3294118, 0, 1,
-1.591883, -1.519479, -4.068139, 1, 0.3372549, 0, 1,
-1.585422, 0.04062188, -1.099693, 1, 0.3411765, 0, 1,
-1.579619, -0.5707499, -1.986852, 1, 0.3490196, 0, 1,
-1.576744, -0.2227654, -0.4991863, 1, 0.3529412, 0, 1,
-1.564578, 1.403355, -0.08972594, 1, 0.3607843, 0, 1,
-1.56057, 0.3336214, -1.670217, 1, 0.3647059, 0, 1,
-1.5452, 0.6915802, -0.9102294, 1, 0.372549, 0, 1,
-1.533126, -1.777588, -0.7659346, 1, 0.3764706, 0, 1,
-1.524176, 1.432014, -0.0766686, 1, 0.3843137, 0, 1,
-1.521649, 1.161832, -1.049553, 1, 0.3882353, 0, 1,
-1.521353, -0.5731251, -0.7746971, 1, 0.3960784, 0, 1,
-1.518828, 0.4759156, -1.093896, 1, 0.4039216, 0, 1,
-1.514513, -0.07793856, -3.232378, 1, 0.4078431, 0, 1,
-1.477387, -0.479701, -1.916453, 1, 0.4156863, 0, 1,
-1.47521, 0.3058366, -0.7208876, 1, 0.4196078, 0, 1,
-1.468261, -1.245664, -2.033329, 1, 0.427451, 0, 1,
-1.463588, 1.054519, -1.190346, 1, 0.4313726, 0, 1,
-1.446852, -1.424231, -1.382723, 1, 0.4392157, 0, 1,
-1.443734, -0.2662533, -1.670487, 1, 0.4431373, 0, 1,
-1.439795, -1.25364, -1.136637, 1, 0.4509804, 0, 1,
-1.426791, 1.611113, 0.1914353, 1, 0.454902, 0, 1,
-1.421646, 0.6636509, -0.6937412, 1, 0.4627451, 0, 1,
-1.415718, -1.642287, -2.206025, 1, 0.4666667, 0, 1,
-1.406468, 0.8353954, -2.202412, 1, 0.4745098, 0, 1,
-1.404096, 1.795525, 0.2308719, 1, 0.4784314, 0, 1,
-1.402763, -1.227468, -2.392844, 1, 0.4862745, 0, 1,
-1.392894, -2.207168, -1.203512, 1, 0.4901961, 0, 1,
-1.384419, -0.3185576, -2.730545, 1, 0.4980392, 0, 1,
-1.381582, -1.679137, -1.125952, 1, 0.5058824, 0, 1,
-1.376697, -0.4149877, -1.80022, 1, 0.509804, 0, 1,
-1.37603, -0.156762, -1.482032, 1, 0.5176471, 0, 1,
-1.373657, 1.077628, -0.6040174, 1, 0.5215687, 0, 1,
-1.347454, -0.7212803, -3.094823, 1, 0.5294118, 0, 1,
-1.343971, -0.8319566, 0.227901, 1, 0.5333334, 0, 1,
-1.337509, -1.373998, -3.675825, 1, 0.5411765, 0, 1,
-1.336585, 0.6676889, -2.669814, 1, 0.5450981, 0, 1,
-1.335466, 0.1227233, -2.406031, 1, 0.5529412, 0, 1,
-1.309856, -0.7641577, -2.472319, 1, 0.5568628, 0, 1,
-1.298559, 1.242381, -1.266779, 1, 0.5647059, 0, 1,
-1.298248, 0.2738026, -0.7416255, 1, 0.5686275, 0, 1,
-1.295352, -0.1175503, -0.05682943, 1, 0.5764706, 0, 1,
-1.286019, -0.5207099, -1.248404, 1, 0.5803922, 0, 1,
-1.282287, -0.2623134, -1.814412, 1, 0.5882353, 0, 1,
-1.273044, 0.3193578, -0.6524464, 1, 0.5921569, 0, 1,
-1.27199, -0.2437713, -2.600886, 1, 0.6, 0, 1,
-1.268806, -0.684914, -3.13747, 1, 0.6078432, 0, 1,
-1.261215, -1.309153, -0.6159722, 1, 0.6117647, 0, 1,
-1.254118, 0.8406724, -1.406189, 1, 0.6196079, 0, 1,
-1.253552, -0.1858819, -3.201822, 1, 0.6235294, 0, 1,
-1.252007, 0.3852776, -1.106194, 1, 0.6313726, 0, 1,
-1.250798, -1.013429, -1.960002, 1, 0.6352941, 0, 1,
-1.239414, 1.412151, 0.281419, 1, 0.6431373, 0, 1,
-1.217631, 1.242972, -1.687759, 1, 0.6470588, 0, 1,
-1.214102, -0.06046221, -1.312002, 1, 0.654902, 0, 1,
-1.206286, -1.873811, -3.09977, 1, 0.6588235, 0, 1,
-1.197327, 2.00527, -0.1019432, 1, 0.6666667, 0, 1,
-1.196583, 0.1852594, -1.469538, 1, 0.6705883, 0, 1,
-1.196475, 0.5630349, 0.02506126, 1, 0.6784314, 0, 1,
-1.188741, -1.360079, -1.565028, 1, 0.682353, 0, 1,
-1.188599, -1.671504, -3.352656, 1, 0.6901961, 0, 1,
-1.175618, 0.423734, -1.258691, 1, 0.6941177, 0, 1,
-1.175266, -0.6833785, -1.293976, 1, 0.7019608, 0, 1,
-1.171979, 0.0809125, -3.234375, 1, 0.7098039, 0, 1,
-1.166179, 0.7541865, -0.4363054, 1, 0.7137255, 0, 1,
-1.162276, -0.9391135, -0.9124382, 1, 0.7215686, 0, 1,
-1.160064, -0.06872716, -1.449908, 1, 0.7254902, 0, 1,
-1.15798, -0.5524595, -0.4140853, 1, 0.7333333, 0, 1,
-1.156575, 0.999234, 2.037614, 1, 0.7372549, 0, 1,
-1.155113, 0.04830311, -0.6294667, 1, 0.7450981, 0, 1,
-1.150101, 0.01882933, -1.256754, 1, 0.7490196, 0, 1,
-1.121533, -1.108704, -2.931171, 1, 0.7568628, 0, 1,
-1.116616, -0.866792, -2.032848, 1, 0.7607843, 0, 1,
-1.096291, -0.7859162, -2.239307, 1, 0.7686275, 0, 1,
-1.085361, -0.09738527, -0.9326934, 1, 0.772549, 0, 1,
-1.083948, -0.3351629, -2.397978, 1, 0.7803922, 0, 1,
-1.075798, 1.22515, 0.8259526, 1, 0.7843137, 0, 1,
-1.07047, -0.0804424, 0.0118869, 1, 0.7921569, 0, 1,
-1.069487, 0.7057236, -1.48534, 1, 0.7960784, 0, 1,
-1.061927, -0.07250483, -0.8353528, 1, 0.8039216, 0, 1,
-1.061408, 1.388802, 0.2438982, 1, 0.8117647, 0, 1,
-1.059315, -0.1733343, -2.457686, 1, 0.8156863, 0, 1,
-1.055816, -0.5934597, -2.976108, 1, 0.8235294, 0, 1,
-1.054665, -1.474926, -2.038731, 1, 0.827451, 0, 1,
-1.048847, -1.287686, -3.797509, 1, 0.8352941, 0, 1,
-1.043907, 0.9313885, -0.3173249, 1, 0.8392157, 0, 1,
-1.042586, -1.429628, -2.74898, 1, 0.8470588, 0, 1,
-1.040006, 0.0337112, -2.313468, 1, 0.8509804, 0, 1,
-1.039657, 0.6481686, -2.806714, 1, 0.8588235, 0, 1,
-1.039444, 0.3037082, -2.193897, 1, 0.8627451, 0, 1,
-1.037266, -0.5635154, -2.753429, 1, 0.8705882, 0, 1,
-1.034946, -0.3505623, -1.85186, 1, 0.8745098, 0, 1,
-1.021129, -0.2204039, -3.375529, 1, 0.8823529, 0, 1,
-1.018447, -0.3147019, -3.861067, 1, 0.8862745, 0, 1,
-1.003111, 1.048737, -1.407148, 1, 0.8941177, 0, 1,
-1.002731, 1.147377, -1.536935, 1, 0.8980392, 0, 1,
-0.9978342, 0.9075404, 1.715668, 1, 0.9058824, 0, 1,
-0.9949126, -0.3362111, -2.448563, 1, 0.9137255, 0, 1,
-0.9849404, -0.9560556, -1.03762, 1, 0.9176471, 0, 1,
-0.9831844, 0.8464705, -0.7094243, 1, 0.9254902, 0, 1,
-0.9750739, 0.9746115, 0.1810698, 1, 0.9294118, 0, 1,
-0.9703974, -0.3646369, -2.288067, 1, 0.9372549, 0, 1,
-0.9696547, 0.2463113, -1.188595, 1, 0.9411765, 0, 1,
-0.9645171, 0.1091209, -1.723792, 1, 0.9490196, 0, 1,
-0.9638087, 0.7349209, -1.884567, 1, 0.9529412, 0, 1,
-0.9561038, 1.291009, 0.7232091, 1, 0.9607843, 0, 1,
-0.9534901, 1.3923, -0.2718208, 1, 0.9647059, 0, 1,
-0.9528653, 1.469309, -1.468993, 1, 0.972549, 0, 1,
-0.9521054, -1.18186, -3.171844, 1, 0.9764706, 0, 1,
-0.9483443, -1.819261, -1.93885, 1, 0.9843137, 0, 1,
-0.9477019, -1.42921, -2.444889, 1, 0.9882353, 0, 1,
-0.9476779, 0.8523384, 0.2701183, 1, 0.9960784, 0, 1,
-0.9475484, 1.747441, -0.2863997, 0.9960784, 1, 0, 1,
-0.9329653, 0.1505416, -3.108202, 0.9921569, 1, 0, 1,
-0.9260924, -0.5246114, -4.620674, 0.9843137, 1, 0, 1,
-0.9242547, -0.03165026, -1.102726, 0.9803922, 1, 0, 1,
-0.9218999, -0.1054136, -1.472033, 0.972549, 1, 0, 1,
-0.9163477, 1.078497, -0.9516504, 0.9686275, 1, 0, 1,
-0.9137318, -2.069017, -1.929775, 0.9607843, 1, 0, 1,
-0.9135522, -0.9626992, -3.407767, 0.9568627, 1, 0, 1,
-0.9106511, -2.07236, -2.464351, 0.9490196, 1, 0, 1,
-0.9097725, -0.1364743, -0.4334261, 0.945098, 1, 0, 1,
-0.9041886, 0.3231065, -0.5593952, 0.9372549, 1, 0, 1,
-0.8995729, -0.07301623, -1.609796, 0.9333333, 1, 0, 1,
-0.8943463, -0.8576723, -3.196985, 0.9254902, 1, 0, 1,
-0.8923677, -1.187173, -0.91762, 0.9215686, 1, 0, 1,
-0.8885477, -1.193048, -1.908196, 0.9137255, 1, 0, 1,
-0.8874518, 0.5389202, -1.86115, 0.9098039, 1, 0, 1,
-0.8843378, 1.52, -0.5115594, 0.9019608, 1, 0, 1,
-0.8796694, -0.7755286, -2.380169, 0.8941177, 1, 0, 1,
-0.8789914, -0.2945025, -3.320898, 0.8901961, 1, 0, 1,
-0.8672194, -0.5785452, -1.246684, 0.8823529, 1, 0, 1,
-0.8670626, 0.8373338, -1.69873, 0.8784314, 1, 0, 1,
-0.8667317, -0.8958876, -2.018628, 0.8705882, 1, 0, 1,
-0.8603828, -0.2494768, -3.1137, 0.8666667, 1, 0, 1,
-0.8603679, 1.247803, -1.388354, 0.8588235, 1, 0, 1,
-0.8602663, -0.6105943, -4.228566, 0.854902, 1, 0, 1,
-0.8587816, -0.03516386, -0.5980031, 0.8470588, 1, 0, 1,
-0.8541118, -0.08852692, -1.378752, 0.8431373, 1, 0, 1,
-0.8470222, -0.224833, -2.86108, 0.8352941, 1, 0, 1,
-0.8450766, 0.9389595, -0.4536242, 0.8313726, 1, 0, 1,
-0.8397394, 0.6554548, -1.978657, 0.8235294, 1, 0, 1,
-0.8302253, 0.6127062, -0.5958073, 0.8196079, 1, 0, 1,
-0.8294397, 0.9173002, -1.317992, 0.8117647, 1, 0, 1,
-0.8222722, -1.405714, -2.787653, 0.8078431, 1, 0, 1,
-0.8212447, 0.7910903, -0.9581826, 0.8, 1, 0, 1,
-0.8207815, -1.185583, -4.167587, 0.7921569, 1, 0, 1,
-0.8194948, -0.5550339, -2.771083, 0.7882353, 1, 0, 1,
-0.8168558, -1.01734, -3.941339, 0.7803922, 1, 0, 1,
-0.816676, 1.05196, -1.606555, 0.7764706, 1, 0, 1,
-0.8158794, 1.271736, -0.2612968, 0.7686275, 1, 0, 1,
-0.8141084, -0.1264469, -1.469469, 0.7647059, 1, 0, 1,
-0.8100966, -0.5416707, -2.047266, 0.7568628, 1, 0, 1,
-0.8057169, -0.7375898, -3.634586, 0.7529412, 1, 0, 1,
-0.8018654, -0.3632735, -3.108279, 0.7450981, 1, 0, 1,
-0.7979656, 1.045614, -0.7229868, 0.7411765, 1, 0, 1,
-0.7972212, 0.8989588, -2.037947, 0.7333333, 1, 0, 1,
-0.7862422, -0.06957923, -4.08079, 0.7294118, 1, 0, 1,
-0.7765797, 1.110706, -1.244386, 0.7215686, 1, 0, 1,
-0.7735171, 0.6813935, -0.1935575, 0.7176471, 1, 0, 1,
-0.7670196, -1.108863, -2.341434, 0.7098039, 1, 0, 1,
-0.764174, 0.2964855, -2.143747, 0.7058824, 1, 0, 1,
-0.7622104, -0.9103684, -1.973275, 0.6980392, 1, 0, 1,
-0.7593476, -1.205427, -3.640141, 0.6901961, 1, 0, 1,
-0.7567466, -1.00966, -1.669663, 0.6862745, 1, 0, 1,
-0.753476, 0.8159478, -0.2341808, 0.6784314, 1, 0, 1,
-0.7438229, -0.01993783, 0.4347391, 0.6745098, 1, 0, 1,
-0.7376496, -0.6523916, -0.5023674, 0.6666667, 1, 0, 1,
-0.7372684, -0.02098785, -0.9074581, 0.6627451, 1, 0, 1,
-0.7359826, -0.0940366, -0.005699907, 0.654902, 1, 0, 1,
-0.734517, 0.6706611, -0.7861712, 0.6509804, 1, 0, 1,
-0.7315875, -0.3767656, -2.603747, 0.6431373, 1, 0, 1,
-0.7308417, 1.102327, -0.4884728, 0.6392157, 1, 0, 1,
-0.721167, 0.05506865, -2.814578, 0.6313726, 1, 0, 1,
-0.7112972, 0.9074582, -1.147352, 0.627451, 1, 0, 1,
-0.710654, 0.1080103, -0.5005363, 0.6196079, 1, 0, 1,
-0.7058921, 0.424541, 0.7784091, 0.6156863, 1, 0, 1,
-0.7012396, 1.731098, 1.217635, 0.6078432, 1, 0, 1,
-0.6965652, -0.357227, -0.8961971, 0.6039216, 1, 0, 1,
-0.6932057, -0.9045693, -2.774728, 0.5960785, 1, 0, 1,
-0.6925312, -0.7103553, -3.104485, 0.5882353, 1, 0, 1,
-0.6921759, -0.8753728, -2.578336, 0.5843138, 1, 0, 1,
-0.6908207, -0.2148567, -0.7522084, 0.5764706, 1, 0, 1,
-0.6873461, 1.198778, 0.6757001, 0.572549, 1, 0, 1,
-0.684957, 0.009246177, 0.7732414, 0.5647059, 1, 0, 1,
-0.6655578, 0.5702944, -2.947465, 0.5607843, 1, 0, 1,
-0.6645526, 1.303663, -1.138279, 0.5529412, 1, 0, 1,
-0.6635198, 0.9491266, 0.02443815, 0.5490196, 1, 0, 1,
-0.6634536, -0.2535702, -2.990145, 0.5411765, 1, 0, 1,
-0.6598829, -0.5265782, -3.371494, 0.5372549, 1, 0, 1,
-0.6553057, -0.3820654, -1.615289, 0.5294118, 1, 0, 1,
-0.6528219, -0.2457122, -1.245524, 0.5254902, 1, 0, 1,
-0.6524144, -0.3952518, -2.113471, 0.5176471, 1, 0, 1,
-0.646764, 0.801984, -2.601756, 0.5137255, 1, 0, 1,
-0.6450521, -0.8183261, -1.243692, 0.5058824, 1, 0, 1,
-0.6431147, -0.07819297, 0.1785876, 0.5019608, 1, 0, 1,
-0.6370727, -1.243655, -0.9772426, 0.4941176, 1, 0, 1,
-0.6310368, 0.08127536, -1.318732, 0.4862745, 1, 0, 1,
-0.6299046, 0.1058724, -1.022862, 0.4823529, 1, 0, 1,
-0.629073, 0.5256397, -0.4297541, 0.4745098, 1, 0, 1,
-0.6281899, 0.8168449, -0.9088675, 0.4705882, 1, 0, 1,
-0.6262019, -0.2850103, -2.345195, 0.4627451, 1, 0, 1,
-0.6260496, 0.3909139, -1.245035, 0.4588235, 1, 0, 1,
-0.6250157, 0.07829332, -1.270939, 0.4509804, 1, 0, 1,
-0.6234909, -0.3694271, -3.720786, 0.4470588, 1, 0, 1,
-0.6222871, -0.8672991, -3.368225, 0.4392157, 1, 0, 1,
-0.6195362, -1.176018, -0.3667054, 0.4352941, 1, 0, 1,
-0.6172789, -0.3073091, -2.474983, 0.427451, 1, 0, 1,
-0.6169035, -1.091416, -0.9106633, 0.4235294, 1, 0, 1,
-0.6139103, -1.155974, -3.836878, 0.4156863, 1, 0, 1,
-0.6089286, 0.983602, -0.2214875, 0.4117647, 1, 0, 1,
-0.6085047, 0.4473403, -1.131549, 0.4039216, 1, 0, 1,
-0.606395, 0.03999936, -0.86339, 0.3960784, 1, 0, 1,
-0.6060091, 1.06408, -0.436309, 0.3921569, 1, 0, 1,
-0.6057933, 1.48506, -1.614014, 0.3843137, 1, 0, 1,
-0.6052998, -1.708587, -2.968359, 0.3803922, 1, 0, 1,
-0.6045037, 0.8314512, -1.059317, 0.372549, 1, 0, 1,
-0.6039014, 0.03943843, -1.996501, 0.3686275, 1, 0, 1,
-0.602136, 0.6782439, -2.990457, 0.3607843, 1, 0, 1,
-0.6013292, -0.9245779, -3.339219, 0.3568628, 1, 0, 1,
-0.6001018, -1.04652, -2.072951, 0.3490196, 1, 0, 1,
-0.5955359, 0.8874993, -1.005336, 0.345098, 1, 0, 1,
-0.5940602, 0.1304674, -2.453415, 0.3372549, 1, 0, 1,
-0.5939182, -1.830714, -3.046871, 0.3333333, 1, 0, 1,
-0.5928988, 0.6604665, -1.282198, 0.3254902, 1, 0, 1,
-0.5926646, -1.484584, -4.072805, 0.3215686, 1, 0, 1,
-0.5921782, -0.1693935, -1.237951, 0.3137255, 1, 0, 1,
-0.5920126, 0.7979479, -1.420913, 0.3098039, 1, 0, 1,
-0.5907054, 0.6800947, -0.636307, 0.3019608, 1, 0, 1,
-0.5871388, -0.8863042, -1.814812, 0.2941177, 1, 0, 1,
-0.5783677, -0.6253855, -2.951918, 0.2901961, 1, 0, 1,
-0.5776035, 1.928985, -0.9687913, 0.282353, 1, 0, 1,
-0.5774533, 0.1569605, -1.933232, 0.2784314, 1, 0, 1,
-0.5767719, 2.174116, -1.452308, 0.2705882, 1, 0, 1,
-0.5756611, -0.5157037, -1.97815, 0.2666667, 1, 0, 1,
-0.575415, -0.4440236, -1.724164, 0.2588235, 1, 0, 1,
-0.5698223, 0.4337966, -1.238194, 0.254902, 1, 0, 1,
-0.5653598, -3.059742, -4.628813, 0.2470588, 1, 0, 1,
-0.5614404, 0.5584531, 0.859562, 0.2431373, 1, 0, 1,
-0.5579693, 0.4644465, 0.2837104, 0.2352941, 1, 0, 1,
-0.556474, -0.2896345, -2.80757, 0.2313726, 1, 0, 1,
-0.5506423, -0.8706182, 0.1316799, 0.2235294, 1, 0, 1,
-0.550625, 0.7725926, -2.799386, 0.2196078, 1, 0, 1,
-0.5432746, -1.4363, -1.779033, 0.2117647, 1, 0, 1,
-0.542208, 1.710391, -1.313488, 0.2078431, 1, 0, 1,
-0.5412284, -1.01726, -2.405484, 0.2, 1, 0, 1,
-0.5396695, -0.8299579, -3.051266, 0.1921569, 1, 0, 1,
-0.5383211, 0.8327613, -1.417453, 0.1882353, 1, 0, 1,
-0.5382874, 0.5199735, -0.8147945, 0.1803922, 1, 0, 1,
-0.5365952, -0.1799152, -0.9009761, 0.1764706, 1, 0, 1,
-0.5360566, 0.7274939, -1.284241, 0.1686275, 1, 0, 1,
-0.535085, 1.647898, 0.1376746, 0.1647059, 1, 0, 1,
-0.5345985, 0.8971657, -1.896703, 0.1568628, 1, 0, 1,
-0.530906, -0.6572021, -3.265382, 0.1529412, 1, 0, 1,
-0.5302701, 1.3059, -1.040475, 0.145098, 1, 0, 1,
-0.52243, -1.190155, -2.321981, 0.1411765, 1, 0, 1,
-0.5213059, -3.574031, -1.471578, 0.1333333, 1, 0, 1,
-0.5207142, 0.1564418, -0.3922108, 0.1294118, 1, 0, 1,
-0.5168957, 0.07288456, -2.093662, 0.1215686, 1, 0, 1,
-0.5126848, 0.145548, -0.8713517, 0.1176471, 1, 0, 1,
-0.5122682, 0.03984449, -2.208257, 0.1098039, 1, 0, 1,
-0.5104542, 0.468655, -1.698257, 0.1058824, 1, 0, 1,
-0.4992178, -0.4424881, -2.474969, 0.09803922, 1, 0, 1,
-0.494606, 2.769262, 2.054818, 0.09019608, 1, 0, 1,
-0.493772, 0.08916527, -2.27182, 0.08627451, 1, 0, 1,
-0.4912575, 0.9407761, 1.015929, 0.07843138, 1, 0, 1,
-0.4797477, 0.1965969, -1.207828, 0.07450981, 1, 0, 1,
-0.4780293, -0.6190246, -1.209315, 0.06666667, 1, 0, 1,
-0.477615, -0.2816418, -1.224212, 0.0627451, 1, 0, 1,
-0.4741932, 0.1636767, -1.085785, 0.05490196, 1, 0, 1,
-0.4701384, 0.3095771, 0.784654, 0.05098039, 1, 0, 1,
-0.4700277, 0.3969336, -0.6524014, 0.04313726, 1, 0, 1,
-0.4667856, -1.338972, -1.661903, 0.03921569, 1, 0, 1,
-0.4613959, 0.2411362, -1.908273, 0.03137255, 1, 0, 1,
-0.458807, -0.6183695, -1.960868, 0.02745098, 1, 0, 1,
-0.4539186, 1.361919, -1.899626, 0.01960784, 1, 0, 1,
-0.4480156, -0.3320137, -0.5422909, 0.01568628, 1, 0, 1,
-0.4471751, 0.9431878, -0.938313, 0.007843138, 1, 0, 1,
-0.4469125, -1.88758, -1.671229, 0.003921569, 1, 0, 1,
-0.4467808, -2.376667, -3.988296, 0, 1, 0.003921569, 1,
-0.4467806, -0.4351941, -2.178639, 0, 1, 0.01176471, 1,
-0.4441252, 0.3949749, 0.4675279, 0, 1, 0.01568628, 1,
-0.443832, -0.07030527, -3.602745, 0, 1, 0.02352941, 1,
-0.4416322, -1.595517, -3.541991, 0, 1, 0.02745098, 1,
-0.4298819, 0.8746274, -0.5009723, 0, 1, 0.03529412, 1,
-0.4270799, -0.2680419, -3.208603, 0, 1, 0.03921569, 1,
-0.4267036, -0.1244645, -2.329135, 0, 1, 0.04705882, 1,
-0.4248118, -0.2669232, -0.7945985, 0, 1, 0.05098039, 1,
-0.4212366, 2.427029, 0.7409961, 0, 1, 0.05882353, 1,
-0.4172261, -1.617368, -2.102858, 0, 1, 0.0627451, 1,
-0.4139494, 0.4738538, -1.461154, 0, 1, 0.07058824, 1,
-0.4091302, -0.8674281, -4.081901, 0, 1, 0.07450981, 1,
-0.4080602, 0.116398, -0.3192828, 0, 1, 0.08235294, 1,
-0.4061307, -0.3264341, -2.594596, 0, 1, 0.08627451, 1,
-0.4058089, -0.4433563, -3.028404, 0, 1, 0.09411765, 1,
-0.4031346, -1.528039, -2.176434, 0, 1, 0.1019608, 1,
-0.4029818, 0.5281007, -0.4096795, 0, 1, 0.1058824, 1,
-0.3999259, -0.8240231, -1.663974, 0, 1, 0.1137255, 1,
-0.3979323, 0.5186981, 0.009989431, 0, 1, 0.1176471, 1,
-0.3971796, 1.371681, -0.8533441, 0, 1, 0.1254902, 1,
-0.3952144, -1.355433, -3.22725, 0, 1, 0.1294118, 1,
-0.3892567, -0.8085042, -2.940162, 0, 1, 0.1372549, 1,
-0.3885767, -0.8135589, -1.852082, 0, 1, 0.1411765, 1,
-0.3868765, -0.6496826, -3.796658, 0, 1, 0.1490196, 1,
-0.3798768, 1.566343, 0.5627176, 0, 1, 0.1529412, 1,
-0.3793316, -0.4739675, -2.686113, 0, 1, 0.1607843, 1,
-0.3788669, -2.08792, -1.419865, 0, 1, 0.1647059, 1,
-0.3770623, -0.5445538, -4.001695, 0, 1, 0.172549, 1,
-0.3760595, 1.820148, -1.033509, 0, 1, 0.1764706, 1,
-0.3734658, -1.759715, -3.271052, 0, 1, 0.1843137, 1,
-0.3719335, -0.1291496, -1.002907, 0, 1, 0.1882353, 1,
-0.3714825, -0.200775, -1.503782, 0, 1, 0.1960784, 1,
-0.3683052, 1.351446, -2.555128, 0, 1, 0.2039216, 1,
-0.3682249, -0.3227134, -3.349439, 0, 1, 0.2078431, 1,
-0.367123, 0.8152052, -0.9940423, 0, 1, 0.2156863, 1,
-0.3663887, 0.02020316, -1.609098, 0, 1, 0.2196078, 1,
-0.3598206, -0.7991974, -2.410253, 0, 1, 0.227451, 1,
-0.35813, -0.9881692, -4.673155, 0, 1, 0.2313726, 1,
-0.3561915, 1.163785, 0.5252332, 0, 1, 0.2392157, 1,
-0.3530692, -0.557962, -2.680007, 0, 1, 0.2431373, 1,
-0.3522229, -0.1875155, -2.980202, 0, 1, 0.2509804, 1,
-0.3494412, 1.96836, -2.640984, 0, 1, 0.254902, 1,
-0.3490618, -0.9112889, -5.423611, 0, 1, 0.2627451, 1,
-0.3470204, 1.002418, -0.2620454, 0, 1, 0.2666667, 1,
-0.3462013, 0.9135357, 2.732146, 0, 1, 0.2745098, 1,
-0.3426134, 0.2108847, -2.511618, 0, 1, 0.2784314, 1,
-0.338392, 1.053864, -0.3360283, 0, 1, 0.2862745, 1,
-0.3380209, 0.3737689, -1.43895, 0, 1, 0.2901961, 1,
-0.3368169, 0.8200026, 0.2503357, 0, 1, 0.2980392, 1,
-0.3354318, -0.4274905, -2.489048, 0, 1, 0.3058824, 1,
-0.335315, 0.1431902, -1.851771, 0, 1, 0.3098039, 1,
-0.3316169, 0.1692657, 1.121496, 0, 1, 0.3176471, 1,
-0.3308797, 0.02256336, -1.444307, 0, 1, 0.3215686, 1,
-0.3293425, -0.6223421, -0.5001669, 0, 1, 0.3294118, 1,
-0.3283585, 0.5985339, -0.8440428, 0, 1, 0.3333333, 1,
-0.3268501, -0.2908464, -4.297571, 0, 1, 0.3411765, 1,
-0.3257759, -0.002326043, -1.197057, 0, 1, 0.345098, 1,
-0.3224983, 0.8555595, -1.229191, 0, 1, 0.3529412, 1,
-0.3223539, 2.24963, -0.05059686, 0, 1, 0.3568628, 1,
-0.3190366, 0.7327929, -0.101312, 0, 1, 0.3647059, 1,
-0.3163367, -0.2409426, -1.240308, 0, 1, 0.3686275, 1,
-0.3142764, -0.5818132, -2.964751, 0, 1, 0.3764706, 1,
-0.3119718, -0.9730089, -2.622032, 0, 1, 0.3803922, 1,
-0.306045, 0.4221355, 0.5491414, 0, 1, 0.3882353, 1,
-0.3049279, -0.7926121, -3.363356, 0, 1, 0.3921569, 1,
-0.3042602, 0.8022924, 0.6916282, 0, 1, 0.4, 1,
-0.3006531, -0.8400658, -4.42323, 0, 1, 0.4078431, 1,
-0.2977057, -1.254917, -3.84198, 0, 1, 0.4117647, 1,
-0.2974004, -1.234641, -3.100052, 0, 1, 0.4196078, 1,
-0.2927707, -0.5458795, -2.651194, 0, 1, 0.4235294, 1,
-0.2893151, -1.747336, -3.093132, 0, 1, 0.4313726, 1,
-0.2890497, 2.702523, 0.09459056, 0, 1, 0.4352941, 1,
-0.2880924, -0.07467486, -2.771912, 0, 1, 0.4431373, 1,
-0.2849576, -0.8651727, -2.285229, 0, 1, 0.4470588, 1,
-0.2835022, 0.7340987, 0.6779991, 0, 1, 0.454902, 1,
-0.2833023, -1.06437, -1.977091, 0, 1, 0.4588235, 1,
-0.2830239, -0.3133935, -2.893013, 0, 1, 0.4666667, 1,
-0.277193, 0.8910261, 0.008320587, 0, 1, 0.4705882, 1,
-0.2680697, 0.8394001, -0.8205932, 0, 1, 0.4784314, 1,
-0.2671034, -0.8729789, -2.128692, 0, 1, 0.4823529, 1,
-0.2626174, 0.03943677, -1.411488, 0, 1, 0.4901961, 1,
-0.2590804, -0.8154092, -4.148207, 0, 1, 0.4941176, 1,
-0.2567014, 1.615925, 0.6066746, 0, 1, 0.5019608, 1,
-0.2453188, -0.8030632, -2.733511, 0, 1, 0.509804, 1,
-0.2441236, -0.1650388, -1.905585, 0, 1, 0.5137255, 1,
-0.2437248, 1.187768, -1.263815, 0, 1, 0.5215687, 1,
-0.2403034, -0.04247566, -0.5455732, 0, 1, 0.5254902, 1,
-0.2367129, 1.920219, 0.7972127, 0, 1, 0.5333334, 1,
-0.2357506, -0.4382118, -1.443753, 0, 1, 0.5372549, 1,
-0.2352102, -1.115718, -2.751312, 0, 1, 0.5450981, 1,
-0.2338264, -1.046168, -3.915313, 0, 1, 0.5490196, 1,
-0.2333331, 0.0557298, -0.8867977, 0, 1, 0.5568628, 1,
-0.2320061, 0.4530725, -1.969427, 0, 1, 0.5607843, 1,
-0.2307267, -0.5599657, -2.131308, 0, 1, 0.5686275, 1,
-0.2189723, 0.3573385, 1.072828, 0, 1, 0.572549, 1,
-0.2174649, 0.00305351, -1.650499, 0, 1, 0.5803922, 1,
-0.2102345, 0.5231215, -0.582196, 0, 1, 0.5843138, 1,
-0.205122, 0.8170043, -0.1467555, 0, 1, 0.5921569, 1,
-0.2040748, -0.05712561, 0.1528989, 0, 1, 0.5960785, 1,
-0.2003519, 1.071528, -1.273877, 0, 1, 0.6039216, 1,
-0.1998933, -0.9214488, -2.371073, 0, 1, 0.6117647, 1,
-0.1974849, 0.5211087, -1.04473, 0, 1, 0.6156863, 1,
-0.1911016, -0.995111, -0.439762, 0, 1, 0.6235294, 1,
-0.18928, 1.081448, 0.6567531, 0, 1, 0.627451, 1,
-0.1866004, 0.6505995, -1.562411, 0, 1, 0.6352941, 1,
-0.1858103, 0.7657661, -0.3312656, 0, 1, 0.6392157, 1,
-0.1848981, 0.1783954, -1.397242, 0, 1, 0.6470588, 1,
-0.1836784, -0.9529353, 0.01617823, 0, 1, 0.6509804, 1,
-0.1813092, -1.212269, -3.873881, 0, 1, 0.6588235, 1,
-0.1770885, 0.5782552, 0.9507961, 0, 1, 0.6627451, 1,
-0.1699063, -0.3905055, -2.713045, 0, 1, 0.6705883, 1,
-0.1686811, -0.4464492, -3.155023, 0, 1, 0.6745098, 1,
-0.1686639, -0.2043479, -3.510002, 0, 1, 0.682353, 1,
-0.1645457, -1.389055, -2.384677, 0, 1, 0.6862745, 1,
-0.1632047, 0.5906547, 0.1663824, 0, 1, 0.6941177, 1,
-0.1628843, -0.04866731, -2.607473, 0, 1, 0.7019608, 1,
-0.1624107, 0.8172222, -0.7376394, 0, 1, 0.7058824, 1,
-0.1596881, -0.03963668, -0.8709436, 0, 1, 0.7137255, 1,
-0.1553372, 0.6280361, 0.8620089, 0, 1, 0.7176471, 1,
-0.1533191, 0.3333592, -0.9542709, 0, 1, 0.7254902, 1,
-0.1478198, 0.8589886, 0.8500919, 0, 1, 0.7294118, 1,
-0.1445602, 0.6434302, 0.1122449, 0, 1, 0.7372549, 1,
-0.144205, 1.310894, -0.8874254, 0, 1, 0.7411765, 1,
-0.14093, -1.789374, -4.28336, 0, 1, 0.7490196, 1,
-0.134265, -0.05520017, -2.71283, 0, 1, 0.7529412, 1,
-0.1336055, 0.7012894, -0.1682309, 0, 1, 0.7607843, 1,
-0.132122, -0.3464597, -3.770692, 0, 1, 0.7647059, 1,
-0.1307826, -0.747236, -3.637208, 0, 1, 0.772549, 1,
-0.1302496, 1.066064, -0.006961319, 0, 1, 0.7764706, 1,
-0.1233312, 1.015693, 0.00558948, 0, 1, 0.7843137, 1,
-0.1199816, -2.10627, -3.054941, 0, 1, 0.7882353, 1,
-0.119383, -0.07833508, -3.555741, 0, 1, 0.7960784, 1,
-0.1191358, 0.574219, -0.9744817, 0, 1, 0.8039216, 1,
-0.1177128, -2.277107, -2.088646, 0, 1, 0.8078431, 1,
-0.116895, -0.520182, -3.660626, 0, 1, 0.8156863, 1,
-0.1167357, -0.3158803, -0.806501, 0, 1, 0.8196079, 1,
-0.1167284, 0.5696729, 0.4700426, 0, 1, 0.827451, 1,
-0.1163294, 0.06749189, -1.400501, 0, 1, 0.8313726, 1,
-0.1140438, -1.171659, -3.963472, 0, 1, 0.8392157, 1,
-0.1133114, -0.1411152, -4.116843, 0, 1, 0.8431373, 1,
-0.1132872, -1.087601, -2.099234, 0, 1, 0.8509804, 1,
-0.1129578, 0.04365914, -0.4301331, 0, 1, 0.854902, 1,
-0.1126567, 0.7651474, 0.4544426, 0, 1, 0.8627451, 1,
-0.1082041, -0.4051182, -2.091573, 0, 1, 0.8666667, 1,
-0.1075997, 1.195485, -1.62434, 0, 1, 0.8745098, 1,
-0.1075073, -1.340514, -2.498894, 0, 1, 0.8784314, 1,
-0.1070056, 0.0582944, -2.217162, 0, 1, 0.8862745, 1,
-0.106261, 1.2098, -0.8911172, 0, 1, 0.8901961, 1,
-0.1051105, 0.5478146, -0.672332, 0, 1, 0.8980392, 1,
-0.1010021, -1.511264, -2.112618, 0, 1, 0.9058824, 1,
-0.09905836, -0.2333763, -3.043616, 0, 1, 0.9098039, 1,
-0.09590426, 1.011753, 0.6755308, 0, 1, 0.9176471, 1,
-0.09374154, -0.4318629, -2.400983, 0, 1, 0.9215686, 1,
-0.08905838, -0.9113383, -3.825659, 0, 1, 0.9294118, 1,
-0.08465362, -1.64979, -3.918409, 0, 1, 0.9333333, 1,
-0.0813489, -2.24671, -1.95318, 0, 1, 0.9411765, 1,
-0.08099134, -0.4279793, -2.359021, 0, 1, 0.945098, 1,
-0.07775322, -2.894953, -2.406284, 0, 1, 0.9529412, 1,
-0.07642184, -1.425805, -3.262802, 0, 1, 0.9568627, 1,
-0.07401132, 0.184772, 0.5278749, 0, 1, 0.9647059, 1,
-0.07394844, 0.2123105, -0.5016242, 0, 1, 0.9686275, 1,
-0.07297409, -0.1137591, -1.03212, 0, 1, 0.9764706, 1,
-0.06957304, 2.347663, 0.3076916, 0, 1, 0.9803922, 1,
-0.06951835, 0.6050892, -0.9397351, 0, 1, 0.9882353, 1,
-0.06508376, 0.6314885, 1.054544, 0, 1, 0.9921569, 1,
-0.05610247, 0.6675708, 0.5289186, 0, 1, 1, 1,
-0.05606139, 0.3522602, -1.211382, 0, 0.9921569, 1, 1,
-0.05474042, 1.290027, -0.5864816, 0, 0.9882353, 1, 1,
-0.04749916, 1.865478, 0.300282, 0, 0.9803922, 1, 1,
-0.04742774, 0.9588051, 0.2937494, 0, 0.9764706, 1, 1,
-0.04726921, 0.1091621, -0.2354918, 0, 0.9686275, 1, 1,
-0.04293445, -0.6871567, -2.482063, 0, 0.9647059, 1, 1,
-0.03866794, 0.0223698, -0.3994245, 0, 0.9568627, 1, 1,
-0.03303932, -0.6911543, -2.788469, 0, 0.9529412, 1, 1,
-0.03019948, -1.02443, -4.070364, 0, 0.945098, 1, 1,
-0.0284474, -0.0635779, -4.022988, 0, 0.9411765, 1, 1,
-0.02145552, -1.048431, -2.821609, 0, 0.9333333, 1, 1,
-0.02016684, 0.1497947, 0.5465816, 0, 0.9294118, 1, 1,
-0.01830595, -0.762632, -2.027842, 0, 0.9215686, 1, 1,
-0.01830251, 1.858821, -0.1707276, 0, 0.9176471, 1, 1,
-0.01242146, -0.5716043, -3.357957, 0, 0.9098039, 1, 1,
-0.008872894, 0.1054138, 0.7175573, 0, 0.9058824, 1, 1,
-0.0002511018, -1.293916, -3.166342, 0, 0.8980392, 1, 1,
0.002404242, -1.062448, 2.923015, 0, 0.8901961, 1, 1,
0.002652532, 0.9293463, 1.608875, 0, 0.8862745, 1, 1,
0.006146664, 1.388552, -1.089376, 0, 0.8784314, 1, 1,
0.006487857, 0.00979372, -0.125127, 0, 0.8745098, 1, 1,
0.007193585, 0.6539481, 1.419847, 0, 0.8666667, 1, 1,
0.008853238, 0.571031, -0.7470167, 0, 0.8627451, 1, 1,
0.01153424, -0.3222205, 3.455444, 0, 0.854902, 1, 1,
0.01175791, -2.446424, 1.863166, 0, 0.8509804, 1, 1,
0.01321846, 2.086645, 1.011112, 0, 0.8431373, 1, 1,
0.01530243, 1.519622, 0.2719709, 0, 0.8392157, 1, 1,
0.01702425, 0.8091135, 0.01189364, 0, 0.8313726, 1, 1,
0.01812945, -1.381315, 2.621937, 0, 0.827451, 1, 1,
0.01965633, -0.5120655, 4.910551, 0, 0.8196079, 1, 1,
0.02269628, -0.05202986, 2.424028, 0, 0.8156863, 1, 1,
0.02746554, -1.259515, 4.279519, 0, 0.8078431, 1, 1,
0.03285595, 0.5095773, 1.045372, 0, 0.8039216, 1, 1,
0.03331412, -0.3632517, 2.131352, 0, 0.7960784, 1, 1,
0.04157545, -0.52859, 3.306514, 0, 0.7882353, 1, 1,
0.04381483, -1.069001, 4.197256, 0, 0.7843137, 1, 1,
0.04608111, 0.3762122, 0.4470594, 0, 0.7764706, 1, 1,
0.05161586, -0.05598227, 2.690083, 0, 0.772549, 1, 1,
0.05336358, -0.4364015, 2.308471, 0, 0.7647059, 1, 1,
0.05526509, -0.5406153, 2.858104, 0, 0.7607843, 1, 1,
0.0660558, -1.129433, 1.917884, 0, 0.7529412, 1, 1,
0.06863359, -0.5472933, 2.489859, 0, 0.7490196, 1, 1,
0.07140247, 0.4375282, 0.7107649, 0, 0.7411765, 1, 1,
0.07658032, -0.01335341, 1.690388, 0, 0.7372549, 1, 1,
0.07866865, -0.1403807, 5.255836, 0, 0.7294118, 1, 1,
0.07927394, 0.6095557, -0.9892277, 0, 0.7254902, 1, 1,
0.08026322, -0.844677, 3.444872, 0, 0.7176471, 1, 1,
0.08072783, 0.3393087, -0.1073226, 0, 0.7137255, 1, 1,
0.08405194, 0.8526136, -0.1827053, 0, 0.7058824, 1, 1,
0.08606982, 0.4154696, -0.7132838, 0, 0.6980392, 1, 1,
0.08682054, 0.836033, 1.238544, 0, 0.6941177, 1, 1,
0.09163393, 1.738862, -1.894478, 0, 0.6862745, 1, 1,
0.09617345, 0.4985922, -0.5073949, 0, 0.682353, 1, 1,
0.1081153, -1.080751, 3.883983, 0, 0.6745098, 1, 1,
0.1091768, -0.07040624, 0.5354862, 0, 0.6705883, 1, 1,
0.1173802, 0.002353398, 2.920102, 0, 0.6627451, 1, 1,
0.1187071, 0.4043203, -0.4866229, 0, 0.6588235, 1, 1,
0.1216883, 0.2533144, 1.46766, 0, 0.6509804, 1, 1,
0.1221905, 0.6282011, 1.596008, 0, 0.6470588, 1, 1,
0.1325218, -0.6713526, 4.106824, 0, 0.6392157, 1, 1,
0.1339432, 0.2568403, 0.4765937, 0, 0.6352941, 1, 1,
0.141059, 0.4541556, 0.8448786, 0, 0.627451, 1, 1,
0.1420068, -2.254905, 2.469126, 0, 0.6235294, 1, 1,
0.1437315, -1.354683, 2.139963, 0, 0.6156863, 1, 1,
0.1466662, -0.1978542, 2.782452, 0, 0.6117647, 1, 1,
0.1514819, 0.8008683, -0.7251211, 0, 0.6039216, 1, 1,
0.1544117, -1.07024, 3.418804, 0, 0.5960785, 1, 1,
0.1576711, -1.238841, 3.463037, 0, 0.5921569, 1, 1,
0.1578238, -0.4438576, 2.983821, 0, 0.5843138, 1, 1,
0.1612351, 0.750015, 1.195739, 0, 0.5803922, 1, 1,
0.1633903, 2.11544, -1.553549, 0, 0.572549, 1, 1,
0.1654541, 0.8160991, 0.4171342, 0, 0.5686275, 1, 1,
0.1825224, -0.4683117, 0.278953, 0, 0.5607843, 1, 1,
0.1849611, -1.857327, 0.985337, 0, 0.5568628, 1, 1,
0.1864138, -0.6481922, 3.441488, 0, 0.5490196, 1, 1,
0.1893118, -0.4468865, 2.07937, 0, 0.5450981, 1, 1,
0.195715, -1.216989, 2.3835, 0, 0.5372549, 1, 1,
0.1977024, 0.5874263, -1.244776, 0, 0.5333334, 1, 1,
0.2018286, -1.009708, 3.817895, 0, 0.5254902, 1, 1,
0.2023555, -0.471837, 3.047663, 0, 0.5215687, 1, 1,
0.2062202, -0.863038, 3.517004, 0, 0.5137255, 1, 1,
0.2126359, 0.03151456, 1.945881, 0, 0.509804, 1, 1,
0.2148859, 0.2889826, 0.7916352, 0, 0.5019608, 1, 1,
0.2179337, -0.7466553, 3.055351, 0, 0.4941176, 1, 1,
0.2182887, -0.3918099, 2.95239, 0, 0.4901961, 1, 1,
0.2189289, 0.2900448, 1.630036, 0, 0.4823529, 1, 1,
0.2239541, 1.014863, -0.2683029, 0, 0.4784314, 1, 1,
0.2243605, -0.412742, 3.143721, 0, 0.4705882, 1, 1,
0.2254552, -2.191906, 1.049884, 0, 0.4666667, 1, 1,
0.2265242, 1.333452, -0.4034663, 0, 0.4588235, 1, 1,
0.2267299, 0.3226978, 0.1834527, 0, 0.454902, 1, 1,
0.2289521, 0.5177281, 0.6166322, 0, 0.4470588, 1, 1,
0.2295996, -1.369984, 3.109191, 0, 0.4431373, 1, 1,
0.2357915, 0.6543972, 0.4250893, 0, 0.4352941, 1, 1,
0.2361074, -1.122735, 3.795804, 0, 0.4313726, 1, 1,
0.2365585, 0.6729243, -0.02301864, 0, 0.4235294, 1, 1,
0.2367618, 0.5537362, 1.240742, 0, 0.4196078, 1, 1,
0.2372159, -0.1194976, 1.231142, 0, 0.4117647, 1, 1,
0.2437893, -1.25509, 2.646009, 0, 0.4078431, 1, 1,
0.2456711, 0.06679138, 2.445301, 0, 0.4, 1, 1,
0.2465908, 0.9939746, 1.464737, 0, 0.3921569, 1, 1,
0.2476232, -0.8687596, 3.453503, 0, 0.3882353, 1, 1,
0.248217, 1.664364, 0.9115674, 0, 0.3803922, 1, 1,
0.2505272, 0.2995685, 2.172264, 0, 0.3764706, 1, 1,
0.2532942, 0.3571582, 0.06060532, 0, 0.3686275, 1, 1,
0.2538013, 0.1309359, 2.49413, 0, 0.3647059, 1, 1,
0.2553615, -2.675653, 3.089526, 0, 0.3568628, 1, 1,
0.2595132, -0.9559953, 4.849781, 0, 0.3529412, 1, 1,
0.2631647, -1.749867, 2.990914, 0, 0.345098, 1, 1,
0.2672393, 0.09440108, 0.9547515, 0, 0.3411765, 1, 1,
0.2712525, -1.013823, 1.770617, 0, 0.3333333, 1, 1,
0.2727317, -0.3955403, 3.377527, 0, 0.3294118, 1, 1,
0.2768584, 0.5755799, 1.917228, 0, 0.3215686, 1, 1,
0.2792617, 1.48755, -0.2808431, 0, 0.3176471, 1, 1,
0.279335, -2.228742, 3.125268, 0, 0.3098039, 1, 1,
0.2846437, -1.330839, 4.284478, 0, 0.3058824, 1, 1,
0.2860748, -0.03963378, 1.998522, 0, 0.2980392, 1, 1,
0.289891, -1.155788, 3.34136, 0, 0.2901961, 1, 1,
0.2923888, -0.6645126, 1.614854, 0, 0.2862745, 1, 1,
0.292878, 0.8474676, 1.664211, 0, 0.2784314, 1, 1,
0.2932168, -0.2838306, 1.169984, 0, 0.2745098, 1, 1,
0.2956432, -1.048543, 2.161768, 0, 0.2666667, 1, 1,
0.2997975, -0.3552098, 1.337377, 0, 0.2627451, 1, 1,
0.2998237, -0.7081658, 1.257767, 0, 0.254902, 1, 1,
0.3039423, 0.5376257, 0.3561983, 0, 0.2509804, 1, 1,
0.3061485, 0.6672001, 0.9653065, 0, 0.2431373, 1, 1,
0.3063565, -2.069685, 2.315439, 0, 0.2392157, 1, 1,
0.3116617, -0.3868749, 2.572044, 0, 0.2313726, 1, 1,
0.3130153, 1.245778, 0.3719282, 0, 0.227451, 1, 1,
0.3143179, 0.4352049, 1.209728, 0, 0.2196078, 1, 1,
0.3160395, 0.07292069, 2.535199, 0, 0.2156863, 1, 1,
0.3172137, -0.8959315, 2.862052, 0, 0.2078431, 1, 1,
0.3181017, 0.224254, 1.168519, 0, 0.2039216, 1, 1,
0.3199561, 0.1908203, 1.670831, 0, 0.1960784, 1, 1,
0.3310033, 1.269365, -0.6196072, 0, 0.1882353, 1, 1,
0.3332494, -0.9975129, 2.492847, 0, 0.1843137, 1, 1,
0.3400475, 0.3774696, 3.000127, 0, 0.1764706, 1, 1,
0.340942, -0.8799355, 3.418156, 0, 0.172549, 1, 1,
0.341574, -0.1041783, 2.09163, 0, 0.1647059, 1, 1,
0.3521764, -0.5605485, 2.219008, 0, 0.1607843, 1, 1,
0.3556037, -1.251932, 4.141869, 0, 0.1529412, 1, 1,
0.3618277, -0.5339164, 2.637962, 0, 0.1490196, 1, 1,
0.3661518, -0.3489954, 3.111712, 0, 0.1411765, 1, 1,
0.3667441, -0.2997383, 1.66604, 0, 0.1372549, 1, 1,
0.3682138, -1.01246, 2.576666, 0, 0.1294118, 1, 1,
0.3683906, 0.6040972, -0.4043321, 0, 0.1254902, 1, 1,
0.3684661, 0.1486424, -0.6356841, 0, 0.1176471, 1, 1,
0.3728729, -1.969104, 3.24436, 0, 0.1137255, 1, 1,
0.376418, -0.6663815, 2.503781, 0, 0.1058824, 1, 1,
0.376594, 0.7432971, 1.610625, 0, 0.09803922, 1, 1,
0.3770413, 0.3174781, 0.4787779, 0, 0.09411765, 1, 1,
0.377048, 0.5331188, 0.7486899, 0, 0.08627451, 1, 1,
0.3781178, 0.01035758, 0.8537278, 0, 0.08235294, 1, 1,
0.3785159, -0.2381998, 0.8421196, 0, 0.07450981, 1, 1,
0.3786969, -0.6642827, 3.794595, 0, 0.07058824, 1, 1,
0.3862035, -0.4269693, 2.231132, 0, 0.0627451, 1, 1,
0.3863783, 0.536194, 1.971755, 0, 0.05882353, 1, 1,
0.3887712, -0.144355, 1.736599, 0, 0.05098039, 1, 1,
0.389978, -0.2808028, 2.260741, 0, 0.04705882, 1, 1,
0.3933516, 0.5889197, 0.6686267, 0, 0.03921569, 1, 1,
0.3981948, 0.07862035, 2.26081, 0, 0.03529412, 1, 1,
0.399979, -0.163512, 1.760459, 0, 0.02745098, 1, 1,
0.4006901, 0.08004067, 1.685942, 0, 0.02352941, 1, 1,
0.4063721, -1.358141, 1.14955, 0, 0.01568628, 1, 1,
0.4067104, 0.945102, 1.308339, 0, 0.01176471, 1, 1,
0.4079679, 0.01307315, 0.1998346, 0, 0.003921569, 1, 1,
0.409321, 0.7130147, 2.752312, 0.003921569, 0, 1, 1,
0.412227, -1.056176, 2.917826, 0.007843138, 0, 1, 1,
0.4128426, 1.377345, 1.584773, 0.01568628, 0, 1, 1,
0.422688, 1.470615, 1.246618, 0.01960784, 0, 1, 1,
0.4236757, -0.8576679, 2.010514, 0.02745098, 0, 1, 1,
0.4271941, -1.812544, 3.155132, 0.03137255, 0, 1, 1,
0.4296352, -0.6367656, 3.075859, 0.03921569, 0, 1, 1,
0.432405, -0.8999983, 3.731736, 0.04313726, 0, 1, 1,
0.4325157, 0.009415901, 3.212199, 0.05098039, 0, 1, 1,
0.437828, -1.082101, 2.844305, 0.05490196, 0, 1, 1,
0.4382485, 2.058638, -1.402625, 0.0627451, 0, 1, 1,
0.4391789, 1.09299, -1.250122, 0.06666667, 0, 1, 1,
0.4398715, -0.5059547, 1.910415, 0.07450981, 0, 1, 1,
0.4400421, -0.5646228, 1.418237, 0.07843138, 0, 1, 1,
0.4406025, -0.4298224, 0.7227569, 0.08627451, 0, 1, 1,
0.4407482, 0.2326863, 0.8343758, 0.09019608, 0, 1, 1,
0.4449925, 0.8068949, -0.3170736, 0.09803922, 0, 1, 1,
0.4481999, 0.1951898, 1.17909, 0.1058824, 0, 1, 1,
0.450855, 0.0974187, 1.977639, 0.1098039, 0, 1, 1,
0.4529807, 1.182364, -0.1870531, 0.1176471, 0, 1, 1,
0.4551759, -0.5135024, 1.952546, 0.1215686, 0, 1, 1,
0.4589445, 0.3987317, 0.7295715, 0.1294118, 0, 1, 1,
0.464318, 0.3307604, 0.9270439, 0.1333333, 0, 1, 1,
0.4659692, -0.0464692, 3.392243, 0.1411765, 0, 1, 1,
0.4679484, 2.064984, 0.5852984, 0.145098, 0, 1, 1,
0.4702809, 0.7509115, 1.889465, 0.1529412, 0, 1, 1,
0.4704856, 0.08359126, 0.7863429, 0.1568628, 0, 1, 1,
0.4708133, 2.267781, -0.09461612, 0.1647059, 0, 1, 1,
0.473035, -0.8143256, 2.550281, 0.1686275, 0, 1, 1,
0.4780422, -0.2220466, 1.329931, 0.1764706, 0, 1, 1,
0.48146, 0.524708, 0.9365052, 0.1803922, 0, 1, 1,
0.4841545, 0.443086, 1.318785, 0.1882353, 0, 1, 1,
0.4873558, -0.3073442, 1.317309, 0.1921569, 0, 1, 1,
0.4919536, -0.3104674, 2.827879, 0.2, 0, 1, 1,
0.492729, 0.3068649, 0.448649, 0.2078431, 0, 1, 1,
0.4974497, -0.9999493, 4.458991, 0.2117647, 0, 1, 1,
0.4987788, -1.958977, 2.764923, 0.2196078, 0, 1, 1,
0.5169626, 0.4867295, 0.37117, 0.2235294, 0, 1, 1,
0.5180874, 0.8397493, -0.6974203, 0.2313726, 0, 1, 1,
0.5235176, -0.7140329, 2.90433, 0.2352941, 0, 1, 1,
0.5291485, -0.03854591, 3.112655, 0.2431373, 0, 1, 1,
0.5294985, -0.6502236, 2.869167, 0.2470588, 0, 1, 1,
0.5313708, 0.541454, 1.805313, 0.254902, 0, 1, 1,
0.5331749, 1.335563, 0.406898, 0.2588235, 0, 1, 1,
0.5383985, -0.2443297, 3.050635, 0.2666667, 0, 1, 1,
0.5387901, -0.5070035, 1.766642, 0.2705882, 0, 1, 1,
0.5411716, -0.4872897, 3.057434, 0.2784314, 0, 1, 1,
0.5423912, -0.2864832, 0.2396719, 0.282353, 0, 1, 1,
0.5440859, 0.4843315, 2.193108, 0.2901961, 0, 1, 1,
0.5470077, 0.4595322, 0.3012747, 0.2941177, 0, 1, 1,
0.5488781, -0.3249562, 4.262619, 0.3019608, 0, 1, 1,
0.5498534, -1.303533, 1.885976, 0.3098039, 0, 1, 1,
0.5511771, -2.73338, 3.213568, 0.3137255, 0, 1, 1,
0.5536199, -0.2840905, 3.570141, 0.3215686, 0, 1, 1,
0.5547584, 2.068673, 0.6460804, 0.3254902, 0, 1, 1,
0.5630003, 0.8997507, 0.5325453, 0.3333333, 0, 1, 1,
0.5681217, -0.4133198, 0.06790533, 0.3372549, 0, 1, 1,
0.5709889, 2.03542, 1.010671, 0.345098, 0, 1, 1,
0.5795833, 1.724454, 1.304897, 0.3490196, 0, 1, 1,
0.5842298, 0.60511, 1.762795, 0.3568628, 0, 1, 1,
0.5843109, 0.3956823, 0.9389886, 0.3607843, 0, 1, 1,
0.5861649, 2.042043, -0.498346, 0.3686275, 0, 1, 1,
0.587661, -1.531679, 2.607291, 0.372549, 0, 1, 1,
0.5895163, -0.6063532, 1.414779, 0.3803922, 0, 1, 1,
0.5942186, -1.766169, 3.65917, 0.3843137, 0, 1, 1,
0.5964032, -1.597191, 3.18633, 0.3921569, 0, 1, 1,
0.5970392, -0.9412211, 1.626016, 0.3960784, 0, 1, 1,
0.5995408, -0.8729851, 3.480444, 0.4039216, 0, 1, 1,
0.6002792, 0.8551896, 1.478085, 0.4117647, 0, 1, 1,
0.6007854, 0.8404609, 1.347353, 0.4156863, 0, 1, 1,
0.6016621, 0.7069108, -1.57644, 0.4235294, 0, 1, 1,
0.6026474, -0.1145884, 0.5205758, 0.427451, 0, 1, 1,
0.6029034, 1.097953, 0.002135363, 0.4352941, 0, 1, 1,
0.6036621, 0.1126507, 1.485602, 0.4392157, 0, 1, 1,
0.6050568, -1.296392, 2.051725, 0.4470588, 0, 1, 1,
0.6129407, -0.7955386, 3.027926, 0.4509804, 0, 1, 1,
0.6132441, -0.8240767, 2.452727, 0.4588235, 0, 1, 1,
0.61485, -0.7718193, 1.279645, 0.4627451, 0, 1, 1,
0.6150591, 0.9854907, 0.4138511, 0.4705882, 0, 1, 1,
0.6160222, -1.608407, 1.7568, 0.4745098, 0, 1, 1,
0.6211539, -0.3036767, 2.077883, 0.4823529, 0, 1, 1,
0.626967, -0.6635699, 3.060366, 0.4862745, 0, 1, 1,
0.6291119, -0.33801, 1.41022, 0.4941176, 0, 1, 1,
0.6318655, -0.918231, 1.315109, 0.5019608, 0, 1, 1,
0.6336758, 0.5017106, 2.540102, 0.5058824, 0, 1, 1,
0.638363, -0.3594493, 2.074826, 0.5137255, 0, 1, 1,
0.6389318, -1.367171, 1.102773, 0.5176471, 0, 1, 1,
0.6412756, -0.03684474, -0.02575531, 0.5254902, 0, 1, 1,
0.6418338, 0.1693555, 1.821705, 0.5294118, 0, 1, 1,
0.6484857, 0.1699656, 1.433735, 0.5372549, 0, 1, 1,
0.6550844, 0.3463565, 0.1092386, 0.5411765, 0, 1, 1,
0.6622625, -0.7547765, 2.408159, 0.5490196, 0, 1, 1,
0.6629295, -0.0448562, 2.912034, 0.5529412, 0, 1, 1,
0.6661853, 1.153081, 0.2543923, 0.5607843, 0, 1, 1,
0.676976, -1.346686, 1.084636, 0.5647059, 0, 1, 1,
0.68111, -0.7593749, 2.642802, 0.572549, 0, 1, 1,
0.6828437, 1.156658, 0.4845725, 0.5764706, 0, 1, 1,
0.6877286, 0.8216915, -0.5043333, 0.5843138, 0, 1, 1,
0.6901254, 0.925552, -0.06062588, 0.5882353, 0, 1, 1,
0.693215, 0.4414955, 2.753222, 0.5960785, 0, 1, 1,
0.6976568, -1.896243, 1.025985, 0.6039216, 0, 1, 1,
0.6983116, -0.6028675, 2.134233, 0.6078432, 0, 1, 1,
0.6992775, 0.8882592, 0.3740715, 0.6156863, 0, 1, 1,
0.700506, 1.108236, 1.702383, 0.6196079, 0, 1, 1,
0.7065035, -0.8916606, 1.060465, 0.627451, 0, 1, 1,
0.710962, 0.603984, 0.2192914, 0.6313726, 0, 1, 1,
0.7227815, -1.087849, 1.760552, 0.6392157, 0, 1, 1,
0.7258581, 0.7020383, 1.165251, 0.6431373, 0, 1, 1,
0.7261599, -0.8711091, 2.215282, 0.6509804, 0, 1, 1,
0.7316621, -0.9812944, 3.301449, 0.654902, 0, 1, 1,
0.7326064, 1.724094, 0.07157835, 0.6627451, 0, 1, 1,
0.7393386, 1.557035, 0.5682598, 0.6666667, 0, 1, 1,
0.7414652, 2.344374, 0.4853586, 0.6745098, 0, 1, 1,
0.7443171, 1.95778, 1.295691, 0.6784314, 0, 1, 1,
0.744761, 0.6010087, 0.7725757, 0.6862745, 0, 1, 1,
0.7473227, -0.9530745, 4.315415, 0.6901961, 0, 1, 1,
0.7475304, -0.3802167, 1.712277, 0.6980392, 0, 1, 1,
0.7527124, -1.570092, 1.216367, 0.7058824, 0, 1, 1,
0.754373, 0.09610742, 0.1965951, 0.7098039, 0, 1, 1,
0.7583784, -0.2754865, 0.4835109, 0.7176471, 0, 1, 1,
0.7623506, -0.2606419, 3.170945, 0.7215686, 0, 1, 1,
0.7695806, 1.098668, -1.163245, 0.7294118, 0, 1, 1,
0.776446, -0.8179486, 0.8356366, 0.7333333, 0, 1, 1,
0.7820784, 1.403937, 0.5902364, 0.7411765, 0, 1, 1,
0.7837304, -0.4576758, 1.909765, 0.7450981, 0, 1, 1,
0.7842745, -0.6552953, 2.132132, 0.7529412, 0, 1, 1,
0.7867121, 0.2319107, 0.6644544, 0.7568628, 0, 1, 1,
0.7915722, 2.084856, -0.3990797, 0.7647059, 0, 1, 1,
0.7932746, 1.051181, 0.3209289, 0.7686275, 0, 1, 1,
0.8062885, 0.03001517, 1.637808, 0.7764706, 0, 1, 1,
0.8073955, -1.502279, 2.38976, 0.7803922, 0, 1, 1,
0.8121071, 0.3484713, 1.806896, 0.7882353, 0, 1, 1,
0.8140254, 0.09860978, 1.275877, 0.7921569, 0, 1, 1,
0.8150721, 0.0792536, 2.0888, 0.8, 0, 1, 1,
0.8188273, -0.9675114, 1.870289, 0.8078431, 0, 1, 1,
0.8223149, -0.1405038, 2.846881, 0.8117647, 0, 1, 1,
0.8328601, -1.151646, 2.766876, 0.8196079, 0, 1, 1,
0.8335623, 0.9611046, 2.089252, 0.8235294, 0, 1, 1,
0.8390011, 0.329686, 1.453324, 0.8313726, 0, 1, 1,
0.845672, 2.40957, -1.042375, 0.8352941, 0, 1, 1,
0.8604755, -0.2792433, 2.583938, 0.8431373, 0, 1, 1,
0.8741542, -0.1190363, 1.974964, 0.8470588, 0, 1, 1,
0.8749366, 0.185515, 0.3835835, 0.854902, 0, 1, 1,
0.8799061, -1.241554, 1.81951, 0.8588235, 0, 1, 1,
0.8799558, 0.1347874, 1.356275, 0.8666667, 0, 1, 1,
0.8823594, 0.4779205, 1.016431, 0.8705882, 0, 1, 1,
0.8836986, -0.6058475, 2.375245, 0.8784314, 0, 1, 1,
0.885486, 0.7286849, 1.661932, 0.8823529, 0, 1, 1,
0.8909284, 0.2841289, 0.9376428, 0.8901961, 0, 1, 1,
0.8924661, -0.3285968, 1.471455, 0.8941177, 0, 1, 1,
0.8955165, -1.959434, 3.065546, 0.9019608, 0, 1, 1,
0.8975785, -1.724407, 2.091918, 0.9098039, 0, 1, 1,
0.9012338, -1.21262, 4.005536, 0.9137255, 0, 1, 1,
0.905835, -0.8320895, 0.5865455, 0.9215686, 0, 1, 1,
0.9063829, 0.6781576, 1.083265, 0.9254902, 0, 1, 1,
0.9107892, -0.4807749, 1.251506, 0.9333333, 0, 1, 1,
0.9136854, 0.769986, 0.5463427, 0.9372549, 0, 1, 1,
0.9154191, 0.5407641, 2.402968, 0.945098, 0, 1, 1,
0.9156865, -1.69954, 2.179399, 0.9490196, 0, 1, 1,
0.9156947, 1.400952, 0.02749019, 0.9568627, 0, 1, 1,
0.9205294, -0.8307602, 0.5018628, 0.9607843, 0, 1, 1,
0.9278384, 2.448486, -1.053187, 0.9686275, 0, 1, 1,
0.9326019, 1.012359, 0.9734517, 0.972549, 0, 1, 1,
0.9326144, -1.932548, 3.11394, 0.9803922, 0, 1, 1,
0.9348817, -0.3419755, -0.8640031, 0.9843137, 0, 1, 1,
0.9378816, -0.2191132, -1.017585, 0.9921569, 0, 1, 1,
0.9409479, 0.5901275, 1.732306, 0.9960784, 0, 1, 1,
0.9422145, 1.294297, -0.5205042, 1, 0, 0.9960784, 1,
0.950605, -0.8951519, 2.975358, 1, 0, 0.9882353, 1,
0.9536383, -1.228886, 2.614137, 1, 0, 0.9843137, 1,
0.9541773, -0.6898866, 1.91194, 1, 0, 0.9764706, 1,
0.9552565, -0.433084, 2.223124, 1, 0, 0.972549, 1,
0.9598227, -1.317657, 1.687215, 1, 0, 0.9647059, 1,
0.9613834, -1.214486, 1.593097, 1, 0, 0.9607843, 1,
0.9669811, 0.007777188, 2.645714, 1, 0, 0.9529412, 1,
0.972324, -0.06965291, 2.061138, 1, 0, 0.9490196, 1,
0.9770907, 0.7598766, 1.118133, 1, 0, 0.9411765, 1,
0.9774705, -0.01422322, 0.4511066, 1, 0, 0.9372549, 1,
0.9834468, -0.5349558, 1.839096, 1, 0, 0.9294118, 1,
0.9835231, 1.362374, -0.001750366, 1, 0, 0.9254902, 1,
0.9874134, -0.3362488, 3.563364, 1, 0, 0.9176471, 1,
0.9982199, 0.2587596, 1.099941, 1, 0, 0.9137255, 1,
1.000448, -0.884688, 4.360551, 1, 0, 0.9058824, 1,
1.000914, 0.4179187, 2.015747, 1, 0, 0.9019608, 1,
1.021059, 1.16604, 0.3809281, 1, 0, 0.8941177, 1,
1.024749, -1.460572, 3.024866, 1, 0, 0.8862745, 1,
1.028296, 1.018789, 0.8246863, 1, 0, 0.8823529, 1,
1.028562, 1.621863, 0.7516989, 1, 0, 0.8745098, 1,
1.032889, -0.7798551, 1.959867, 1, 0, 0.8705882, 1,
1.03648, 1.179847, -0.250291, 1, 0, 0.8627451, 1,
1.045825, -1.04575, 4.153515, 1, 0, 0.8588235, 1,
1.049387, 0.3041803, 2.106491, 1, 0, 0.8509804, 1,
1.05792, -1.126903, 2.626882, 1, 0, 0.8470588, 1,
1.065942, -0.6652399, 3.184744, 1, 0, 0.8392157, 1,
1.066311, -0.6682587, 0.5902162, 1, 0, 0.8352941, 1,
1.06992, -0.2739585, 2.296473, 1, 0, 0.827451, 1,
1.075466, -1.35665, 2.499412, 1, 0, 0.8235294, 1,
1.079848, 0.7867807, 0.9785414, 1, 0, 0.8156863, 1,
1.083176, 0.8900512, 0.69704, 1, 0, 0.8117647, 1,
1.087216, -1.848818, 2.825649, 1, 0, 0.8039216, 1,
1.09558, -0.4285561, 0.8046673, 1, 0, 0.7960784, 1,
1.105262, -0.3279012, 3.810226, 1, 0, 0.7921569, 1,
1.11763, -0.204496, 3.355572, 1, 0, 0.7843137, 1,
1.119904, -1.714492, 2.695313, 1, 0, 0.7803922, 1,
1.131526, 1.148028, 2.238556, 1, 0, 0.772549, 1,
1.132923, -0.2543703, 2.460225, 1, 0, 0.7686275, 1,
1.135953, -0.1651193, -0.2548468, 1, 0, 0.7607843, 1,
1.142876, 1.045585, -0.1779245, 1, 0, 0.7568628, 1,
1.144117, 0.917191, 0.3170498, 1, 0, 0.7490196, 1,
1.149268, -0.6209208, 1.203522, 1, 0, 0.7450981, 1,
1.152837, -0.07165708, 3.470978, 1, 0, 0.7372549, 1,
1.155144, 0.5039459, 0.3695826, 1, 0, 0.7333333, 1,
1.155788, 0.4868374, 1.255794, 1, 0, 0.7254902, 1,
1.156658, 0.8644587, 2.209989, 1, 0, 0.7215686, 1,
1.160097, -0.277071, 2.4237, 1, 0, 0.7137255, 1,
1.167819, 1.364054, 0.7276094, 1, 0, 0.7098039, 1,
1.170127, 1.358111, -1.419404, 1, 0, 0.7019608, 1,
1.170781, 0.5245762, 0.3475202, 1, 0, 0.6941177, 1,
1.17415, -0.955475, 1.466367, 1, 0, 0.6901961, 1,
1.174482, 1.182238, 3.063293, 1, 0, 0.682353, 1,
1.174883, 0.4785013, 0.4294004, 1, 0, 0.6784314, 1,
1.175251, -0.5730457, 1.829118, 1, 0, 0.6705883, 1,
1.178837, -0.05607338, 0.4795514, 1, 0, 0.6666667, 1,
1.181217, -1.432832, 2.17489, 1, 0, 0.6588235, 1,
1.186015, 0.1643823, 0.7963737, 1, 0, 0.654902, 1,
1.203238, 0.4344236, 1.452779, 1, 0, 0.6470588, 1,
1.208447, 0.703236, 0.6756608, 1, 0, 0.6431373, 1,
1.211609, 2.253261, 1.828233, 1, 0, 0.6352941, 1,
1.222988, 0.844622, 2.855381, 1, 0, 0.6313726, 1,
1.224972, -0.9724308, 1.874555, 1, 0, 0.6235294, 1,
1.228399, 1.755996, 0.8821948, 1, 0, 0.6196079, 1,
1.250465, -0.2917372, 0.1582454, 1, 0, 0.6117647, 1,
1.25404, 1.377488, -0.07701365, 1, 0, 0.6078432, 1,
1.255398, -2.404393, 3.358025, 1, 0, 0.6, 1,
1.264467, 0.7378135, 3.708922, 1, 0, 0.5921569, 1,
1.266358, -1.024282, 2.928534, 1, 0, 0.5882353, 1,
1.28652, -0.3808917, 1.963302, 1, 0, 0.5803922, 1,
1.288142, -0.6232142, 2.446291, 1, 0, 0.5764706, 1,
1.302991, 0.4156976, 0.9464859, 1, 0, 0.5686275, 1,
1.310163, 1.919773, 0.8124996, 1, 0, 0.5647059, 1,
1.31647, 0.3041883, 0.8948998, 1, 0, 0.5568628, 1,
1.317908, 0.7667952, 0.2324803, 1, 0, 0.5529412, 1,
1.319736, 0.07835433, 1.336183, 1, 0, 0.5450981, 1,
1.320328, -0.9385674, 2.075212, 1, 0, 0.5411765, 1,
1.32187, -0.4685528, 1.806951, 1, 0, 0.5333334, 1,
1.325254, 1.318616, 1.568022, 1, 0, 0.5294118, 1,
1.334746, 1.606541, 1.235152, 1, 0, 0.5215687, 1,
1.338833, 0.7089384, 0.2142255, 1, 0, 0.5176471, 1,
1.342597, 0.5406539, 2.2476, 1, 0, 0.509804, 1,
1.344354, -0.9775992, 0.6342292, 1, 0, 0.5058824, 1,
1.345858, 0.1849872, -0.4026786, 1, 0, 0.4980392, 1,
1.349289, -0.09047668, 1.95701, 1, 0, 0.4901961, 1,
1.364316, -1.169273, 1.080081, 1, 0, 0.4862745, 1,
1.364622, -0.2399385, 2.507859, 1, 0, 0.4784314, 1,
1.365531, -0.4186765, 2.455965, 1, 0, 0.4745098, 1,
1.370698, -0.1131552, 1.143722, 1, 0, 0.4666667, 1,
1.386039, 0.3804404, 1.601155, 1, 0, 0.4627451, 1,
1.392389, 0.9151273, 1.109895, 1, 0, 0.454902, 1,
1.405596, -1.842458, 4.647515, 1, 0, 0.4509804, 1,
1.43099, -0.08310735, 0.7252731, 1, 0, 0.4431373, 1,
1.445817, -0.1363232, 3.396948, 1, 0, 0.4392157, 1,
1.471343, 0.457056, 0.6180851, 1, 0, 0.4313726, 1,
1.47205, 0.3008899, 2.197881, 1, 0, 0.427451, 1,
1.475074, 0.7860993, 0.8788951, 1, 0, 0.4196078, 1,
1.479596, -1.051529, 1.489039, 1, 0, 0.4156863, 1,
1.486447, 0.9063417, 0.6124192, 1, 0, 0.4078431, 1,
1.492717, -0.8832266, 1.118674, 1, 0, 0.4039216, 1,
1.501532, 1.158593, 1.315683, 1, 0, 0.3960784, 1,
1.503056, -1.394839, 1.656772, 1, 0, 0.3882353, 1,
1.510337, -0.6960852, 2.799816, 1, 0, 0.3843137, 1,
1.514261, -0.6666541, 2.433575, 1, 0, 0.3764706, 1,
1.518803, -0.4722427, 2.920775, 1, 0, 0.372549, 1,
1.52716, 0.5160975, 1.254418, 1, 0, 0.3647059, 1,
1.52756, -0.835396, 2.601625, 1, 0, 0.3607843, 1,
1.544743, 0.3725967, 3.389055, 1, 0, 0.3529412, 1,
1.548417, -0.7789584, 1.17982, 1, 0, 0.3490196, 1,
1.556354, -0.2940153, 1.222817, 1, 0, 0.3411765, 1,
1.560988, 0.02680975, -0.08531881, 1, 0, 0.3372549, 1,
1.563119, 0.5458823, 1.410505, 1, 0, 0.3294118, 1,
1.576636, -0.2537634, 0.7283303, 1, 0, 0.3254902, 1,
1.583654, -1.931035, 2.997033, 1, 0, 0.3176471, 1,
1.596673, -0.1693461, 1.931328, 1, 0, 0.3137255, 1,
1.599384, 2.002581, 0.7549122, 1, 0, 0.3058824, 1,
1.60233, 0.2065566, 2.428077, 1, 0, 0.2980392, 1,
1.610379, -1.392289, 2.397686, 1, 0, 0.2941177, 1,
1.611039, -0.3092318, 0.8648848, 1, 0, 0.2862745, 1,
1.611445, 0.4080974, 0.9899467, 1, 0, 0.282353, 1,
1.619016, -0.3170962, 2.217346, 1, 0, 0.2745098, 1,
1.650579, 1.728548, 1.428903, 1, 0, 0.2705882, 1,
1.672435, -0.08962318, 0.5735056, 1, 0, 0.2627451, 1,
1.678524, 0.1234816, 2.117063, 1, 0, 0.2588235, 1,
1.716327, -1.415729, 2.053242, 1, 0, 0.2509804, 1,
1.718103, 0.6880521, 1.948437, 1, 0, 0.2470588, 1,
1.731723, 0.08338823, 2.463567, 1, 0, 0.2392157, 1,
1.751228, -0.3109885, 0.7597061, 1, 0, 0.2352941, 1,
1.767106, 0.00610606, 2.309988, 1, 0, 0.227451, 1,
1.771316, -0.1193426, 3.817625, 1, 0, 0.2235294, 1,
1.805686, 0.5278134, 2.554568, 1, 0, 0.2156863, 1,
1.829432, 0.04673453, 1.489042, 1, 0, 0.2117647, 1,
1.844944, 0.3386113, 1.549246, 1, 0, 0.2039216, 1,
1.863518, -1.00035, 2.555159, 1, 0, 0.1960784, 1,
1.903513, 1.418087, 1.313125, 1, 0, 0.1921569, 1,
1.90742, -0.09897909, 1.220462, 1, 0, 0.1843137, 1,
1.925448, -0.4198493, 2.568218, 1, 0, 0.1803922, 1,
1.969257, -0.1573369, 1.78919, 1, 0, 0.172549, 1,
1.974837, -0.2726385, 2.561764, 1, 0, 0.1686275, 1,
1.979948, 1.350819, -0.5482323, 1, 0, 0.1607843, 1,
1.987557, -0.768296, 1.323635, 1, 0, 0.1568628, 1,
1.988336, -1.343185, 1.64188, 1, 0, 0.1490196, 1,
2.000776, 0.9131591, -0.02465734, 1, 0, 0.145098, 1,
2.004429, -0.03607504, 1.415937, 1, 0, 0.1372549, 1,
2.010133, 1.238114, -0.1705856, 1, 0, 0.1333333, 1,
2.090979, -2.768125, 1.467367, 1, 0, 0.1254902, 1,
2.093988, 0.7736679, 1.119349, 1, 0, 0.1215686, 1,
2.098025, -1.37801, 1.779231, 1, 0, 0.1137255, 1,
2.099832, 0.9707733, 0.6284291, 1, 0, 0.1098039, 1,
2.111155, -0.7150133, 0.2916692, 1, 0, 0.1019608, 1,
2.170331, 1.505168, 1.408858, 1, 0, 0.09411765, 1,
2.273751, -0.3703523, 3.503772, 1, 0, 0.09019608, 1,
2.276026, -0.7685528, 1.686114, 1, 0, 0.08235294, 1,
2.288827, -0.3945742, 0.8480531, 1, 0, 0.07843138, 1,
2.297232, 1.187946, 0.311909, 1, 0, 0.07058824, 1,
2.320366, -1.220637, 3.523026, 1, 0, 0.06666667, 1,
2.342345, 0.06988592, 2.616504, 1, 0, 0.05882353, 1,
2.342566, -0.2788504, 2.34187, 1, 0, 0.05490196, 1,
2.346588, -1.173572, 3.402301, 1, 0, 0.04705882, 1,
2.402006, -0.4335721, 2.348255, 1, 0, 0.04313726, 1,
2.457526, 2.356364, 1.581463, 1, 0, 0.03529412, 1,
2.469541, -0.59465, 1.430363, 1, 0, 0.03137255, 1,
2.605751, -1.528273, 1.900184, 1, 0, 0.02352941, 1,
2.744609, -0.573621, 0.8524382, 1, 0, 0.01960784, 1,
2.883413, -0.5941263, 2.018063, 1, 0, 0.01176471, 1,
2.970298, -1.212536, 3.805141, 1, 0, 0.007843138, 1
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
-0.3372256, -4.868077, -7.233778, 0, -0.5, 0.5, 0.5,
-0.3372256, -4.868077, -7.233778, 1, -0.5, 0.5, 0.5,
-0.3372256, -4.868077, -7.233778, 1, 1.5, 0.5, 0.5,
-0.3372256, -4.868077, -7.233778, 0, 1.5, 0.5, 0.5
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
-4.765999, 0.243212, -7.233778, 0, -0.5, 0.5, 0.5,
-4.765999, 0.243212, -7.233778, 1, -0.5, 0.5, 0.5,
-4.765999, 0.243212, -7.233778, 1, 1.5, 0.5, 0.5,
-4.765999, 0.243212, -7.233778, 0, 1.5, 0.5, 0.5
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
-4.765999, -4.868077, -0.08388782, 0, -0.5, 0.5, 0.5,
-4.765999, -4.868077, -0.08388782, 1, -0.5, 0.5, 0.5,
-4.765999, -4.868077, -0.08388782, 1, 1.5, 0.5, 0.5,
-4.765999, -4.868077, -0.08388782, 0, 1.5, 0.5, 0.5
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
-3, -3.688549, -5.583803,
2, -3.688549, -5.583803,
-3, -3.688549, -5.583803,
-3, -3.885137, -5.858799,
-2, -3.688549, -5.583803,
-2, -3.885137, -5.858799,
-1, -3.688549, -5.583803,
-1, -3.885137, -5.858799,
0, -3.688549, -5.583803,
0, -3.885137, -5.858799,
1, -3.688549, -5.583803,
1, -3.885137, -5.858799,
2, -3.688549, -5.583803,
2, -3.885137, -5.858799
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
-3, -4.278313, -6.40879, 0, -0.5, 0.5, 0.5,
-3, -4.278313, -6.40879, 1, -0.5, 0.5, 0.5,
-3, -4.278313, -6.40879, 1, 1.5, 0.5, 0.5,
-3, -4.278313, -6.40879, 0, 1.5, 0.5, 0.5,
-2, -4.278313, -6.40879, 0, -0.5, 0.5, 0.5,
-2, -4.278313, -6.40879, 1, -0.5, 0.5, 0.5,
-2, -4.278313, -6.40879, 1, 1.5, 0.5, 0.5,
-2, -4.278313, -6.40879, 0, 1.5, 0.5, 0.5,
-1, -4.278313, -6.40879, 0, -0.5, 0.5, 0.5,
-1, -4.278313, -6.40879, 1, -0.5, 0.5, 0.5,
-1, -4.278313, -6.40879, 1, 1.5, 0.5, 0.5,
-1, -4.278313, -6.40879, 0, 1.5, 0.5, 0.5,
0, -4.278313, -6.40879, 0, -0.5, 0.5, 0.5,
0, -4.278313, -6.40879, 1, -0.5, 0.5, 0.5,
0, -4.278313, -6.40879, 1, 1.5, 0.5, 0.5,
0, -4.278313, -6.40879, 0, 1.5, 0.5, 0.5,
1, -4.278313, -6.40879, 0, -0.5, 0.5, 0.5,
1, -4.278313, -6.40879, 1, -0.5, 0.5, 0.5,
1, -4.278313, -6.40879, 1, 1.5, 0.5, 0.5,
1, -4.278313, -6.40879, 0, 1.5, 0.5, 0.5,
2, -4.278313, -6.40879, 0, -0.5, 0.5, 0.5,
2, -4.278313, -6.40879, 1, -0.5, 0.5, 0.5,
2, -4.278313, -6.40879, 1, 1.5, 0.5, 0.5,
2, -4.278313, -6.40879, 0, 1.5, 0.5, 0.5
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
-3.743975, -2, -5.583803,
-3.743975, 4, -5.583803,
-3.743975, -2, -5.583803,
-3.914312, -2, -5.858799,
-3.743975, 0, -5.583803,
-3.914312, 0, -5.858799,
-3.743975, 2, -5.583803,
-3.914312, 2, -5.858799,
-3.743975, 4, -5.583803,
-3.914312, 4, -5.858799
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
"0",
"2",
"4"
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
-4.254987, -2, -6.40879, 0, -0.5, 0.5, 0.5,
-4.254987, -2, -6.40879, 1, -0.5, 0.5, 0.5,
-4.254987, -2, -6.40879, 1, 1.5, 0.5, 0.5,
-4.254987, -2, -6.40879, 0, 1.5, 0.5, 0.5,
-4.254987, 0, -6.40879, 0, -0.5, 0.5, 0.5,
-4.254987, 0, -6.40879, 1, -0.5, 0.5, 0.5,
-4.254987, 0, -6.40879, 1, 1.5, 0.5, 0.5,
-4.254987, 0, -6.40879, 0, 1.5, 0.5, 0.5,
-4.254987, 2, -6.40879, 0, -0.5, 0.5, 0.5,
-4.254987, 2, -6.40879, 1, -0.5, 0.5, 0.5,
-4.254987, 2, -6.40879, 1, 1.5, 0.5, 0.5,
-4.254987, 2, -6.40879, 0, 1.5, 0.5, 0.5,
-4.254987, 4, -6.40879, 0, -0.5, 0.5, 0.5,
-4.254987, 4, -6.40879, 1, -0.5, 0.5, 0.5,
-4.254987, 4, -6.40879, 1, 1.5, 0.5, 0.5,
-4.254987, 4, -6.40879, 0, 1.5, 0.5, 0.5
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
-3.743975, -3.688549, -4,
-3.743975, -3.688549, 4,
-3.743975, -3.688549, -4,
-3.914312, -3.885137, -4,
-3.743975, -3.688549, -2,
-3.914312, -3.885137, -2,
-3.743975, -3.688549, 0,
-3.914312, -3.885137, 0,
-3.743975, -3.688549, 2,
-3.914312, -3.885137, 2,
-3.743975, -3.688549, 4,
-3.914312, -3.885137, 4
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
-4.254987, -4.278313, -4, 0, -0.5, 0.5, 0.5,
-4.254987, -4.278313, -4, 1, -0.5, 0.5, 0.5,
-4.254987, -4.278313, -4, 1, 1.5, 0.5, 0.5,
-4.254987, -4.278313, -4, 0, 1.5, 0.5, 0.5,
-4.254987, -4.278313, -2, 0, -0.5, 0.5, 0.5,
-4.254987, -4.278313, -2, 1, -0.5, 0.5, 0.5,
-4.254987, -4.278313, -2, 1, 1.5, 0.5, 0.5,
-4.254987, -4.278313, -2, 0, 1.5, 0.5, 0.5,
-4.254987, -4.278313, 0, 0, -0.5, 0.5, 0.5,
-4.254987, -4.278313, 0, 1, -0.5, 0.5, 0.5,
-4.254987, -4.278313, 0, 1, 1.5, 0.5, 0.5,
-4.254987, -4.278313, 0, 0, 1.5, 0.5, 0.5,
-4.254987, -4.278313, 2, 0, -0.5, 0.5, 0.5,
-4.254987, -4.278313, 2, 1, -0.5, 0.5, 0.5,
-4.254987, -4.278313, 2, 1, 1.5, 0.5, 0.5,
-4.254987, -4.278313, 2, 0, 1.5, 0.5, 0.5,
-4.254987, -4.278313, 4, 0, -0.5, 0.5, 0.5,
-4.254987, -4.278313, 4, 1, -0.5, 0.5, 0.5,
-4.254987, -4.278313, 4, 1, 1.5, 0.5, 0.5,
-4.254987, -4.278313, 4, 0, 1.5, 0.5, 0.5
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
-3.743975, -3.688549, -5.583803,
-3.743975, 4.174973, -5.583803,
-3.743975, -3.688549, 5.416027,
-3.743975, 4.174973, 5.416027,
-3.743975, -3.688549, -5.583803,
-3.743975, -3.688549, 5.416027,
-3.743975, 4.174973, -5.583803,
-3.743975, 4.174973, 5.416027,
-3.743975, -3.688549, -5.583803,
3.069524, -3.688549, -5.583803,
-3.743975, -3.688549, 5.416027,
3.069524, -3.688549, 5.416027,
-3.743975, 4.174973, -5.583803,
3.069524, 4.174973, -5.583803,
-3.743975, 4.174973, 5.416027,
3.069524, 4.174973, 5.416027,
3.069524, -3.688549, -5.583803,
3.069524, 4.174973, -5.583803,
3.069524, -3.688549, 5.416027,
3.069524, 4.174973, 5.416027,
3.069524, -3.688549, -5.583803,
3.069524, -3.688549, 5.416027,
3.069524, 4.174973, -5.583803,
3.069524, 4.174973, 5.416027
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
var radius = 8.08509;
var distance = 35.97148;
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
mvMatrix.translate( 0.3372256, -0.243212, 0.08388782 );
mvMatrix.scale( 1.283006, 1.111685, 0.7947176 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.97148);
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
triflumuron<-read.table("triflumuron.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-triflumuron$V2
```

```
## Error in eval(expr, envir, enclos): object 'triflumuron' not found
```

```r
y<-triflumuron$V3
```

```
## Error in eval(expr, envir, enclos): object 'triflumuron' not found
```

```r
z<-triflumuron$V4
```

```
## Error in eval(expr, envir, enclos): object 'triflumuron' not found
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
-3.644749, -1.338564, -2.316556, 0, 0, 1, 1, 1,
-2.820335, -0.3272466, -1.836306, 1, 0, 0, 1, 1,
-2.727796, 0.5230455, -0.4779692, 1, 0, 0, 1, 1,
-2.685854, 0.5499701, -1.130117, 1, 0, 0, 1, 1,
-2.565689, 1.906075, -1.140454, 1, 0, 0, 1, 1,
-2.503413, 0.7912906, -1.814254, 1, 0, 0, 1, 1,
-2.363507, 0.1497449, -0.8089194, 0, 0, 0, 1, 1,
-2.336313, 1.460944, -0.9468603, 0, 0, 0, 1, 1,
-2.310231, 0.8248203, -2.954345, 0, 0, 0, 1, 1,
-2.307322, 0.4251252, -3.220177, 0, 0, 0, 1, 1,
-2.297867, 1.4719, -1.714613, 0, 0, 0, 1, 1,
-2.286134, 1.066818, -2.691245, 0, 0, 0, 1, 1,
-2.25527, -0.1469899, -0.4583571, 0, 0, 0, 1, 1,
-2.194787, 2.713267, -0.6868235, 1, 1, 1, 1, 1,
-2.18106, 0.04951947, -1.753896, 1, 1, 1, 1, 1,
-2.161669, 0.5876834, -0.970704, 1, 1, 1, 1, 1,
-2.091285, 0.9326411, -1.280286, 1, 1, 1, 1, 1,
-2.077349, -0.7287018, -4.155547, 1, 1, 1, 1, 1,
-2.073505, -1.030163, -1.215872, 1, 1, 1, 1, 1,
-2.029485, 0.07832606, -2.295174, 1, 1, 1, 1, 1,
-2.017641, 1.226177, -0.581436, 1, 1, 1, 1, 1,
-1.973682, -0.7372994, -3.728213, 1, 1, 1, 1, 1,
-1.97133, -0.9441814, -1.242787, 1, 1, 1, 1, 1,
-1.967972, -0.05038457, -1.165751, 1, 1, 1, 1, 1,
-1.96141, 0.6739885, -2.720984, 1, 1, 1, 1, 1,
-1.958977, -0.1342031, -3.35818, 1, 1, 1, 1, 1,
-1.953935, 0.2124328, -2.485134, 1, 1, 1, 1, 1,
-1.952254, 1.205932, -2.021753, 1, 1, 1, 1, 1,
-1.930369, 0.9637001, -2.878998, 0, 0, 1, 1, 1,
-1.92439, -0.4430479, -1.654997, 1, 0, 0, 1, 1,
-1.918961, 0.4320026, -2.509604, 1, 0, 0, 1, 1,
-1.893894, -0.6260046, -2.900657, 1, 0, 0, 1, 1,
-1.878414, 0.2994373, -2.207487, 1, 0, 0, 1, 1,
-1.877334, 4.060455, 0.09175023, 1, 0, 0, 1, 1,
-1.875572, 0.518271, 0.7385111, 0, 0, 0, 1, 1,
-1.860298, 1.328119, -2.986324, 0, 0, 0, 1, 1,
-1.855724, 1.000159, -1.381354, 0, 0, 0, 1, 1,
-1.82313, -0.1850243, -1.410621, 0, 0, 0, 1, 1,
-1.809275, 0.8695858, -0.7278835, 0, 0, 0, 1, 1,
-1.78779, 0.3635284, -2.259347, 0, 0, 0, 1, 1,
-1.779583, 0.5318815, -0.8730757, 0, 0, 0, 1, 1,
-1.756802, 0.1991812, -0.06712827, 1, 1, 1, 1, 1,
-1.743256, -1.192017, -2.5885, 1, 1, 1, 1, 1,
-1.741366, -1.430999, -2.913006, 1, 1, 1, 1, 1,
-1.716021, -1.210991, -2.282578, 1, 1, 1, 1, 1,
-1.715509, -0.504843, -1.359208, 1, 1, 1, 1, 1,
-1.709315, -1.390329, -1.327403, 1, 1, 1, 1, 1,
-1.701447, 0.4608376, 0.1397073, 1, 1, 1, 1, 1,
-1.668354, 0.04770904, -2.237786, 1, 1, 1, 1, 1,
-1.662483, 1.010315, -1.554837, 1, 1, 1, 1, 1,
-1.658142, 0.1875444, -0.4903202, 1, 1, 1, 1, 1,
-1.63481, 0.5668464, -1.338639, 1, 1, 1, 1, 1,
-1.621705, -0.458015, -0.7362211, 1, 1, 1, 1, 1,
-1.616663, -0.2731923, -2.232606, 1, 1, 1, 1, 1,
-1.616142, -0.1414469, -3.432316, 1, 1, 1, 1, 1,
-1.601045, 0.7359591, -0.2498186, 1, 1, 1, 1, 1,
-1.591883, -1.519479, -4.068139, 0, 0, 1, 1, 1,
-1.585422, 0.04062188, -1.099693, 1, 0, 0, 1, 1,
-1.579619, -0.5707499, -1.986852, 1, 0, 0, 1, 1,
-1.576744, -0.2227654, -0.4991863, 1, 0, 0, 1, 1,
-1.564578, 1.403355, -0.08972594, 1, 0, 0, 1, 1,
-1.56057, 0.3336214, -1.670217, 1, 0, 0, 1, 1,
-1.5452, 0.6915802, -0.9102294, 0, 0, 0, 1, 1,
-1.533126, -1.777588, -0.7659346, 0, 0, 0, 1, 1,
-1.524176, 1.432014, -0.0766686, 0, 0, 0, 1, 1,
-1.521649, 1.161832, -1.049553, 0, 0, 0, 1, 1,
-1.521353, -0.5731251, -0.7746971, 0, 0, 0, 1, 1,
-1.518828, 0.4759156, -1.093896, 0, 0, 0, 1, 1,
-1.514513, -0.07793856, -3.232378, 0, 0, 0, 1, 1,
-1.477387, -0.479701, -1.916453, 1, 1, 1, 1, 1,
-1.47521, 0.3058366, -0.7208876, 1, 1, 1, 1, 1,
-1.468261, -1.245664, -2.033329, 1, 1, 1, 1, 1,
-1.463588, 1.054519, -1.190346, 1, 1, 1, 1, 1,
-1.446852, -1.424231, -1.382723, 1, 1, 1, 1, 1,
-1.443734, -0.2662533, -1.670487, 1, 1, 1, 1, 1,
-1.439795, -1.25364, -1.136637, 1, 1, 1, 1, 1,
-1.426791, 1.611113, 0.1914353, 1, 1, 1, 1, 1,
-1.421646, 0.6636509, -0.6937412, 1, 1, 1, 1, 1,
-1.415718, -1.642287, -2.206025, 1, 1, 1, 1, 1,
-1.406468, 0.8353954, -2.202412, 1, 1, 1, 1, 1,
-1.404096, 1.795525, 0.2308719, 1, 1, 1, 1, 1,
-1.402763, -1.227468, -2.392844, 1, 1, 1, 1, 1,
-1.392894, -2.207168, -1.203512, 1, 1, 1, 1, 1,
-1.384419, -0.3185576, -2.730545, 1, 1, 1, 1, 1,
-1.381582, -1.679137, -1.125952, 0, 0, 1, 1, 1,
-1.376697, -0.4149877, -1.80022, 1, 0, 0, 1, 1,
-1.37603, -0.156762, -1.482032, 1, 0, 0, 1, 1,
-1.373657, 1.077628, -0.6040174, 1, 0, 0, 1, 1,
-1.347454, -0.7212803, -3.094823, 1, 0, 0, 1, 1,
-1.343971, -0.8319566, 0.227901, 1, 0, 0, 1, 1,
-1.337509, -1.373998, -3.675825, 0, 0, 0, 1, 1,
-1.336585, 0.6676889, -2.669814, 0, 0, 0, 1, 1,
-1.335466, 0.1227233, -2.406031, 0, 0, 0, 1, 1,
-1.309856, -0.7641577, -2.472319, 0, 0, 0, 1, 1,
-1.298559, 1.242381, -1.266779, 0, 0, 0, 1, 1,
-1.298248, 0.2738026, -0.7416255, 0, 0, 0, 1, 1,
-1.295352, -0.1175503, -0.05682943, 0, 0, 0, 1, 1,
-1.286019, -0.5207099, -1.248404, 1, 1, 1, 1, 1,
-1.282287, -0.2623134, -1.814412, 1, 1, 1, 1, 1,
-1.273044, 0.3193578, -0.6524464, 1, 1, 1, 1, 1,
-1.27199, -0.2437713, -2.600886, 1, 1, 1, 1, 1,
-1.268806, -0.684914, -3.13747, 1, 1, 1, 1, 1,
-1.261215, -1.309153, -0.6159722, 1, 1, 1, 1, 1,
-1.254118, 0.8406724, -1.406189, 1, 1, 1, 1, 1,
-1.253552, -0.1858819, -3.201822, 1, 1, 1, 1, 1,
-1.252007, 0.3852776, -1.106194, 1, 1, 1, 1, 1,
-1.250798, -1.013429, -1.960002, 1, 1, 1, 1, 1,
-1.239414, 1.412151, 0.281419, 1, 1, 1, 1, 1,
-1.217631, 1.242972, -1.687759, 1, 1, 1, 1, 1,
-1.214102, -0.06046221, -1.312002, 1, 1, 1, 1, 1,
-1.206286, -1.873811, -3.09977, 1, 1, 1, 1, 1,
-1.197327, 2.00527, -0.1019432, 1, 1, 1, 1, 1,
-1.196583, 0.1852594, -1.469538, 0, 0, 1, 1, 1,
-1.196475, 0.5630349, 0.02506126, 1, 0, 0, 1, 1,
-1.188741, -1.360079, -1.565028, 1, 0, 0, 1, 1,
-1.188599, -1.671504, -3.352656, 1, 0, 0, 1, 1,
-1.175618, 0.423734, -1.258691, 1, 0, 0, 1, 1,
-1.175266, -0.6833785, -1.293976, 1, 0, 0, 1, 1,
-1.171979, 0.0809125, -3.234375, 0, 0, 0, 1, 1,
-1.166179, 0.7541865, -0.4363054, 0, 0, 0, 1, 1,
-1.162276, -0.9391135, -0.9124382, 0, 0, 0, 1, 1,
-1.160064, -0.06872716, -1.449908, 0, 0, 0, 1, 1,
-1.15798, -0.5524595, -0.4140853, 0, 0, 0, 1, 1,
-1.156575, 0.999234, 2.037614, 0, 0, 0, 1, 1,
-1.155113, 0.04830311, -0.6294667, 0, 0, 0, 1, 1,
-1.150101, 0.01882933, -1.256754, 1, 1, 1, 1, 1,
-1.121533, -1.108704, -2.931171, 1, 1, 1, 1, 1,
-1.116616, -0.866792, -2.032848, 1, 1, 1, 1, 1,
-1.096291, -0.7859162, -2.239307, 1, 1, 1, 1, 1,
-1.085361, -0.09738527, -0.9326934, 1, 1, 1, 1, 1,
-1.083948, -0.3351629, -2.397978, 1, 1, 1, 1, 1,
-1.075798, 1.22515, 0.8259526, 1, 1, 1, 1, 1,
-1.07047, -0.0804424, 0.0118869, 1, 1, 1, 1, 1,
-1.069487, 0.7057236, -1.48534, 1, 1, 1, 1, 1,
-1.061927, -0.07250483, -0.8353528, 1, 1, 1, 1, 1,
-1.061408, 1.388802, 0.2438982, 1, 1, 1, 1, 1,
-1.059315, -0.1733343, -2.457686, 1, 1, 1, 1, 1,
-1.055816, -0.5934597, -2.976108, 1, 1, 1, 1, 1,
-1.054665, -1.474926, -2.038731, 1, 1, 1, 1, 1,
-1.048847, -1.287686, -3.797509, 1, 1, 1, 1, 1,
-1.043907, 0.9313885, -0.3173249, 0, 0, 1, 1, 1,
-1.042586, -1.429628, -2.74898, 1, 0, 0, 1, 1,
-1.040006, 0.0337112, -2.313468, 1, 0, 0, 1, 1,
-1.039657, 0.6481686, -2.806714, 1, 0, 0, 1, 1,
-1.039444, 0.3037082, -2.193897, 1, 0, 0, 1, 1,
-1.037266, -0.5635154, -2.753429, 1, 0, 0, 1, 1,
-1.034946, -0.3505623, -1.85186, 0, 0, 0, 1, 1,
-1.021129, -0.2204039, -3.375529, 0, 0, 0, 1, 1,
-1.018447, -0.3147019, -3.861067, 0, 0, 0, 1, 1,
-1.003111, 1.048737, -1.407148, 0, 0, 0, 1, 1,
-1.002731, 1.147377, -1.536935, 0, 0, 0, 1, 1,
-0.9978342, 0.9075404, 1.715668, 0, 0, 0, 1, 1,
-0.9949126, -0.3362111, -2.448563, 0, 0, 0, 1, 1,
-0.9849404, -0.9560556, -1.03762, 1, 1, 1, 1, 1,
-0.9831844, 0.8464705, -0.7094243, 1, 1, 1, 1, 1,
-0.9750739, 0.9746115, 0.1810698, 1, 1, 1, 1, 1,
-0.9703974, -0.3646369, -2.288067, 1, 1, 1, 1, 1,
-0.9696547, 0.2463113, -1.188595, 1, 1, 1, 1, 1,
-0.9645171, 0.1091209, -1.723792, 1, 1, 1, 1, 1,
-0.9638087, 0.7349209, -1.884567, 1, 1, 1, 1, 1,
-0.9561038, 1.291009, 0.7232091, 1, 1, 1, 1, 1,
-0.9534901, 1.3923, -0.2718208, 1, 1, 1, 1, 1,
-0.9528653, 1.469309, -1.468993, 1, 1, 1, 1, 1,
-0.9521054, -1.18186, -3.171844, 1, 1, 1, 1, 1,
-0.9483443, -1.819261, -1.93885, 1, 1, 1, 1, 1,
-0.9477019, -1.42921, -2.444889, 1, 1, 1, 1, 1,
-0.9476779, 0.8523384, 0.2701183, 1, 1, 1, 1, 1,
-0.9475484, 1.747441, -0.2863997, 1, 1, 1, 1, 1,
-0.9329653, 0.1505416, -3.108202, 0, 0, 1, 1, 1,
-0.9260924, -0.5246114, -4.620674, 1, 0, 0, 1, 1,
-0.9242547, -0.03165026, -1.102726, 1, 0, 0, 1, 1,
-0.9218999, -0.1054136, -1.472033, 1, 0, 0, 1, 1,
-0.9163477, 1.078497, -0.9516504, 1, 0, 0, 1, 1,
-0.9137318, -2.069017, -1.929775, 1, 0, 0, 1, 1,
-0.9135522, -0.9626992, -3.407767, 0, 0, 0, 1, 1,
-0.9106511, -2.07236, -2.464351, 0, 0, 0, 1, 1,
-0.9097725, -0.1364743, -0.4334261, 0, 0, 0, 1, 1,
-0.9041886, 0.3231065, -0.5593952, 0, 0, 0, 1, 1,
-0.8995729, -0.07301623, -1.609796, 0, 0, 0, 1, 1,
-0.8943463, -0.8576723, -3.196985, 0, 0, 0, 1, 1,
-0.8923677, -1.187173, -0.91762, 0, 0, 0, 1, 1,
-0.8885477, -1.193048, -1.908196, 1, 1, 1, 1, 1,
-0.8874518, 0.5389202, -1.86115, 1, 1, 1, 1, 1,
-0.8843378, 1.52, -0.5115594, 1, 1, 1, 1, 1,
-0.8796694, -0.7755286, -2.380169, 1, 1, 1, 1, 1,
-0.8789914, -0.2945025, -3.320898, 1, 1, 1, 1, 1,
-0.8672194, -0.5785452, -1.246684, 1, 1, 1, 1, 1,
-0.8670626, 0.8373338, -1.69873, 1, 1, 1, 1, 1,
-0.8667317, -0.8958876, -2.018628, 1, 1, 1, 1, 1,
-0.8603828, -0.2494768, -3.1137, 1, 1, 1, 1, 1,
-0.8603679, 1.247803, -1.388354, 1, 1, 1, 1, 1,
-0.8602663, -0.6105943, -4.228566, 1, 1, 1, 1, 1,
-0.8587816, -0.03516386, -0.5980031, 1, 1, 1, 1, 1,
-0.8541118, -0.08852692, -1.378752, 1, 1, 1, 1, 1,
-0.8470222, -0.224833, -2.86108, 1, 1, 1, 1, 1,
-0.8450766, 0.9389595, -0.4536242, 1, 1, 1, 1, 1,
-0.8397394, 0.6554548, -1.978657, 0, 0, 1, 1, 1,
-0.8302253, 0.6127062, -0.5958073, 1, 0, 0, 1, 1,
-0.8294397, 0.9173002, -1.317992, 1, 0, 0, 1, 1,
-0.8222722, -1.405714, -2.787653, 1, 0, 0, 1, 1,
-0.8212447, 0.7910903, -0.9581826, 1, 0, 0, 1, 1,
-0.8207815, -1.185583, -4.167587, 1, 0, 0, 1, 1,
-0.8194948, -0.5550339, -2.771083, 0, 0, 0, 1, 1,
-0.8168558, -1.01734, -3.941339, 0, 0, 0, 1, 1,
-0.816676, 1.05196, -1.606555, 0, 0, 0, 1, 1,
-0.8158794, 1.271736, -0.2612968, 0, 0, 0, 1, 1,
-0.8141084, -0.1264469, -1.469469, 0, 0, 0, 1, 1,
-0.8100966, -0.5416707, -2.047266, 0, 0, 0, 1, 1,
-0.8057169, -0.7375898, -3.634586, 0, 0, 0, 1, 1,
-0.8018654, -0.3632735, -3.108279, 1, 1, 1, 1, 1,
-0.7979656, 1.045614, -0.7229868, 1, 1, 1, 1, 1,
-0.7972212, 0.8989588, -2.037947, 1, 1, 1, 1, 1,
-0.7862422, -0.06957923, -4.08079, 1, 1, 1, 1, 1,
-0.7765797, 1.110706, -1.244386, 1, 1, 1, 1, 1,
-0.7735171, 0.6813935, -0.1935575, 1, 1, 1, 1, 1,
-0.7670196, -1.108863, -2.341434, 1, 1, 1, 1, 1,
-0.764174, 0.2964855, -2.143747, 1, 1, 1, 1, 1,
-0.7622104, -0.9103684, -1.973275, 1, 1, 1, 1, 1,
-0.7593476, -1.205427, -3.640141, 1, 1, 1, 1, 1,
-0.7567466, -1.00966, -1.669663, 1, 1, 1, 1, 1,
-0.753476, 0.8159478, -0.2341808, 1, 1, 1, 1, 1,
-0.7438229, -0.01993783, 0.4347391, 1, 1, 1, 1, 1,
-0.7376496, -0.6523916, -0.5023674, 1, 1, 1, 1, 1,
-0.7372684, -0.02098785, -0.9074581, 1, 1, 1, 1, 1,
-0.7359826, -0.0940366, -0.005699907, 0, 0, 1, 1, 1,
-0.734517, 0.6706611, -0.7861712, 1, 0, 0, 1, 1,
-0.7315875, -0.3767656, -2.603747, 1, 0, 0, 1, 1,
-0.7308417, 1.102327, -0.4884728, 1, 0, 0, 1, 1,
-0.721167, 0.05506865, -2.814578, 1, 0, 0, 1, 1,
-0.7112972, 0.9074582, -1.147352, 1, 0, 0, 1, 1,
-0.710654, 0.1080103, -0.5005363, 0, 0, 0, 1, 1,
-0.7058921, 0.424541, 0.7784091, 0, 0, 0, 1, 1,
-0.7012396, 1.731098, 1.217635, 0, 0, 0, 1, 1,
-0.6965652, -0.357227, -0.8961971, 0, 0, 0, 1, 1,
-0.6932057, -0.9045693, -2.774728, 0, 0, 0, 1, 1,
-0.6925312, -0.7103553, -3.104485, 0, 0, 0, 1, 1,
-0.6921759, -0.8753728, -2.578336, 0, 0, 0, 1, 1,
-0.6908207, -0.2148567, -0.7522084, 1, 1, 1, 1, 1,
-0.6873461, 1.198778, 0.6757001, 1, 1, 1, 1, 1,
-0.684957, 0.009246177, 0.7732414, 1, 1, 1, 1, 1,
-0.6655578, 0.5702944, -2.947465, 1, 1, 1, 1, 1,
-0.6645526, 1.303663, -1.138279, 1, 1, 1, 1, 1,
-0.6635198, 0.9491266, 0.02443815, 1, 1, 1, 1, 1,
-0.6634536, -0.2535702, -2.990145, 1, 1, 1, 1, 1,
-0.6598829, -0.5265782, -3.371494, 1, 1, 1, 1, 1,
-0.6553057, -0.3820654, -1.615289, 1, 1, 1, 1, 1,
-0.6528219, -0.2457122, -1.245524, 1, 1, 1, 1, 1,
-0.6524144, -0.3952518, -2.113471, 1, 1, 1, 1, 1,
-0.646764, 0.801984, -2.601756, 1, 1, 1, 1, 1,
-0.6450521, -0.8183261, -1.243692, 1, 1, 1, 1, 1,
-0.6431147, -0.07819297, 0.1785876, 1, 1, 1, 1, 1,
-0.6370727, -1.243655, -0.9772426, 1, 1, 1, 1, 1,
-0.6310368, 0.08127536, -1.318732, 0, 0, 1, 1, 1,
-0.6299046, 0.1058724, -1.022862, 1, 0, 0, 1, 1,
-0.629073, 0.5256397, -0.4297541, 1, 0, 0, 1, 1,
-0.6281899, 0.8168449, -0.9088675, 1, 0, 0, 1, 1,
-0.6262019, -0.2850103, -2.345195, 1, 0, 0, 1, 1,
-0.6260496, 0.3909139, -1.245035, 1, 0, 0, 1, 1,
-0.6250157, 0.07829332, -1.270939, 0, 0, 0, 1, 1,
-0.6234909, -0.3694271, -3.720786, 0, 0, 0, 1, 1,
-0.6222871, -0.8672991, -3.368225, 0, 0, 0, 1, 1,
-0.6195362, -1.176018, -0.3667054, 0, 0, 0, 1, 1,
-0.6172789, -0.3073091, -2.474983, 0, 0, 0, 1, 1,
-0.6169035, -1.091416, -0.9106633, 0, 0, 0, 1, 1,
-0.6139103, -1.155974, -3.836878, 0, 0, 0, 1, 1,
-0.6089286, 0.983602, -0.2214875, 1, 1, 1, 1, 1,
-0.6085047, 0.4473403, -1.131549, 1, 1, 1, 1, 1,
-0.606395, 0.03999936, -0.86339, 1, 1, 1, 1, 1,
-0.6060091, 1.06408, -0.436309, 1, 1, 1, 1, 1,
-0.6057933, 1.48506, -1.614014, 1, 1, 1, 1, 1,
-0.6052998, -1.708587, -2.968359, 1, 1, 1, 1, 1,
-0.6045037, 0.8314512, -1.059317, 1, 1, 1, 1, 1,
-0.6039014, 0.03943843, -1.996501, 1, 1, 1, 1, 1,
-0.602136, 0.6782439, -2.990457, 1, 1, 1, 1, 1,
-0.6013292, -0.9245779, -3.339219, 1, 1, 1, 1, 1,
-0.6001018, -1.04652, -2.072951, 1, 1, 1, 1, 1,
-0.5955359, 0.8874993, -1.005336, 1, 1, 1, 1, 1,
-0.5940602, 0.1304674, -2.453415, 1, 1, 1, 1, 1,
-0.5939182, -1.830714, -3.046871, 1, 1, 1, 1, 1,
-0.5928988, 0.6604665, -1.282198, 1, 1, 1, 1, 1,
-0.5926646, -1.484584, -4.072805, 0, 0, 1, 1, 1,
-0.5921782, -0.1693935, -1.237951, 1, 0, 0, 1, 1,
-0.5920126, 0.7979479, -1.420913, 1, 0, 0, 1, 1,
-0.5907054, 0.6800947, -0.636307, 1, 0, 0, 1, 1,
-0.5871388, -0.8863042, -1.814812, 1, 0, 0, 1, 1,
-0.5783677, -0.6253855, -2.951918, 1, 0, 0, 1, 1,
-0.5776035, 1.928985, -0.9687913, 0, 0, 0, 1, 1,
-0.5774533, 0.1569605, -1.933232, 0, 0, 0, 1, 1,
-0.5767719, 2.174116, -1.452308, 0, 0, 0, 1, 1,
-0.5756611, -0.5157037, -1.97815, 0, 0, 0, 1, 1,
-0.575415, -0.4440236, -1.724164, 0, 0, 0, 1, 1,
-0.5698223, 0.4337966, -1.238194, 0, 0, 0, 1, 1,
-0.5653598, -3.059742, -4.628813, 0, 0, 0, 1, 1,
-0.5614404, 0.5584531, 0.859562, 1, 1, 1, 1, 1,
-0.5579693, 0.4644465, 0.2837104, 1, 1, 1, 1, 1,
-0.556474, -0.2896345, -2.80757, 1, 1, 1, 1, 1,
-0.5506423, -0.8706182, 0.1316799, 1, 1, 1, 1, 1,
-0.550625, 0.7725926, -2.799386, 1, 1, 1, 1, 1,
-0.5432746, -1.4363, -1.779033, 1, 1, 1, 1, 1,
-0.542208, 1.710391, -1.313488, 1, 1, 1, 1, 1,
-0.5412284, -1.01726, -2.405484, 1, 1, 1, 1, 1,
-0.5396695, -0.8299579, -3.051266, 1, 1, 1, 1, 1,
-0.5383211, 0.8327613, -1.417453, 1, 1, 1, 1, 1,
-0.5382874, 0.5199735, -0.8147945, 1, 1, 1, 1, 1,
-0.5365952, -0.1799152, -0.9009761, 1, 1, 1, 1, 1,
-0.5360566, 0.7274939, -1.284241, 1, 1, 1, 1, 1,
-0.535085, 1.647898, 0.1376746, 1, 1, 1, 1, 1,
-0.5345985, 0.8971657, -1.896703, 1, 1, 1, 1, 1,
-0.530906, -0.6572021, -3.265382, 0, 0, 1, 1, 1,
-0.5302701, 1.3059, -1.040475, 1, 0, 0, 1, 1,
-0.52243, -1.190155, -2.321981, 1, 0, 0, 1, 1,
-0.5213059, -3.574031, -1.471578, 1, 0, 0, 1, 1,
-0.5207142, 0.1564418, -0.3922108, 1, 0, 0, 1, 1,
-0.5168957, 0.07288456, -2.093662, 1, 0, 0, 1, 1,
-0.5126848, 0.145548, -0.8713517, 0, 0, 0, 1, 1,
-0.5122682, 0.03984449, -2.208257, 0, 0, 0, 1, 1,
-0.5104542, 0.468655, -1.698257, 0, 0, 0, 1, 1,
-0.4992178, -0.4424881, -2.474969, 0, 0, 0, 1, 1,
-0.494606, 2.769262, 2.054818, 0, 0, 0, 1, 1,
-0.493772, 0.08916527, -2.27182, 0, 0, 0, 1, 1,
-0.4912575, 0.9407761, 1.015929, 0, 0, 0, 1, 1,
-0.4797477, 0.1965969, -1.207828, 1, 1, 1, 1, 1,
-0.4780293, -0.6190246, -1.209315, 1, 1, 1, 1, 1,
-0.477615, -0.2816418, -1.224212, 1, 1, 1, 1, 1,
-0.4741932, 0.1636767, -1.085785, 1, 1, 1, 1, 1,
-0.4701384, 0.3095771, 0.784654, 1, 1, 1, 1, 1,
-0.4700277, 0.3969336, -0.6524014, 1, 1, 1, 1, 1,
-0.4667856, -1.338972, -1.661903, 1, 1, 1, 1, 1,
-0.4613959, 0.2411362, -1.908273, 1, 1, 1, 1, 1,
-0.458807, -0.6183695, -1.960868, 1, 1, 1, 1, 1,
-0.4539186, 1.361919, -1.899626, 1, 1, 1, 1, 1,
-0.4480156, -0.3320137, -0.5422909, 1, 1, 1, 1, 1,
-0.4471751, 0.9431878, -0.938313, 1, 1, 1, 1, 1,
-0.4469125, -1.88758, -1.671229, 1, 1, 1, 1, 1,
-0.4467808, -2.376667, -3.988296, 1, 1, 1, 1, 1,
-0.4467806, -0.4351941, -2.178639, 1, 1, 1, 1, 1,
-0.4441252, 0.3949749, 0.4675279, 0, 0, 1, 1, 1,
-0.443832, -0.07030527, -3.602745, 1, 0, 0, 1, 1,
-0.4416322, -1.595517, -3.541991, 1, 0, 0, 1, 1,
-0.4298819, 0.8746274, -0.5009723, 1, 0, 0, 1, 1,
-0.4270799, -0.2680419, -3.208603, 1, 0, 0, 1, 1,
-0.4267036, -0.1244645, -2.329135, 1, 0, 0, 1, 1,
-0.4248118, -0.2669232, -0.7945985, 0, 0, 0, 1, 1,
-0.4212366, 2.427029, 0.7409961, 0, 0, 0, 1, 1,
-0.4172261, -1.617368, -2.102858, 0, 0, 0, 1, 1,
-0.4139494, 0.4738538, -1.461154, 0, 0, 0, 1, 1,
-0.4091302, -0.8674281, -4.081901, 0, 0, 0, 1, 1,
-0.4080602, 0.116398, -0.3192828, 0, 0, 0, 1, 1,
-0.4061307, -0.3264341, -2.594596, 0, 0, 0, 1, 1,
-0.4058089, -0.4433563, -3.028404, 1, 1, 1, 1, 1,
-0.4031346, -1.528039, -2.176434, 1, 1, 1, 1, 1,
-0.4029818, 0.5281007, -0.4096795, 1, 1, 1, 1, 1,
-0.3999259, -0.8240231, -1.663974, 1, 1, 1, 1, 1,
-0.3979323, 0.5186981, 0.009989431, 1, 1, 1, 1, 1,
-0.3971796, 1.371681, -0.8533441, 1, 1, 1, 1, 1,
-0.3952144, -1.355433, -3.22725, 1, 1, 1, 1, 1,
-0.3892567, -0.8085042, -2.940162, 1, 1, 1, 1, 1,
-0.3885767, -0.8135589, -1.852082, 1, 1, 1, 1, 1,
-0.3868765, -0.6496826, -3.796658, 1, 1, 1, 1, 1,
-0.3798768, 1.566343, 0.5627176, 1, 1, 1, 1, 1,
-0.3793316, -0.4739675, -2.686113, 1, 1, 1, 1, 1,
-0.3788669, -2.08792, -1.419865, 1, 1, 1, 1, 1,
-0.3770623, -0.5445538, -4.001695, 1, 1, 1, 1, 1,
-0.3760595, 1.820148, -1.033509, 1, 1, 1, 1, 1,
-0.3734658, -1.759715, -3.271052, 0, 0, 1, 1, 1,
-0.3719335, -0.1291496, -1.002907, 1, 0, 0, 1, 1,
-0.3714825, -0.200775, -1.503782, 1, 0, 0, 1, 1,
-0.3683052, 1.351446, -2.555128, 1, 0, 0, 1, 1,
-0.3682249, -0.3227134, -3.349439, 1, 0, 0, 1, 1,
-0.367123, 0.8152052, -0.9940423, 1, 0, 0, 1, 1,
-0.3663887, 0.02020316, -1.609098, 0, 0, 0, 1, 1,
-0.3598206, -0.7991974, -2.410253, 0, 0, 0, 1, 1,
-0.35813, -0.9881692, -4.673155, 0, 0, 0, 1, 1,
-0.3561915, 1.163785, 0.5252332, 0, 0, 0, 1, 1,
-0.3530692, -0.557962, -2.680007, 0, 0, 0, 1, 1,
-0.3522229, -0.1875155, -2.980202, 0, 0, 0, 1, 1,
-0.3494412, 1.96836, -2.640984, 0, 0, 0, 1, 1,
-0.3490618, -0.9112889, -5.423611, 1, 1, 1, 1, 1,
-0.3470204, 1.002418, -0.2620454, 1, 1, 1, 1, 1,
-0.3462013, 0.9135357, 2.732146, 1, 1, 1, 1, 1,
-0.3426134, 0.2108847, -2.511618, 1, 1, 1, 1, 1,
-0.338392, 1.053864, -0.3360283, 1, 1, 1, 1, 1,
-0.3380209, 0.3737689, -1.43895, 1, 1, 1, 1, 1,
-0.3368169, 0.8200026, 0.2503357, 1, 1, 1, 1, 1,
-0.3354318, -0.4274905, -2.489048, 1, 1, 1, 1, 1,
-0.335315, 0.1431902, -1.851771, 1, 1, 1, 1, 1,
-0.3316169, 0.1692657, 1.121496, 1, 1, 1, 1, 1,
-0.3308797, 0.02256336, -1.444307, 1, 1, 1, 1, 1,
-0.3293425, -0.6223421, -0.5001669, 1, 1, 1, 1, 1,
-0.3283585, 0.5985339, -0.8440428, 1, 1, 1, 1, 1,
-0.3268501, -0.2908464, -4.297571, 1, 1, 1, 1, 1,
-0.3257759, -0.002326043, -1.197057, 1, 1, 1, 1, 1,
-0.3224983, 0.8555595, -1.229191, 0, 0, 1, 1, 1,
-0.3223539, 2.24963, -0.05059686, 1, 0, 0, 1, 1,
-0.3190366, 0.7327929, -0.101312, 1, 0, 0, 1, 1,
-0.3163367, -0.2409426, -1.240308, 1, 0, 0, 1, 1,
-0.3142764, -0.5818132, -2.964751, 1, 0, 0, 1, 1,
-0.3119718, -0.9730089, -2.622032, 1, 0, 0, 1, 1,
-0.306045, 0.4221355, 0.5491414, 0, 0, 0, 1, 1,
-0.3049279, -0.7926121, -3.363356, 0, 0, 0, 1, 1,
-0.3042602, 0.8022924, 0.6916282, 0, 0, 0, 1, 1,
-0.3006531, -0.8400658, -4.42323, 0, 0, 0, 1, 1,
-0.2977057, -1.254917, -3.84198, 0, 0, 0, 1, 1,
-0.2974004, -1.234641, -3.100052, 0, 0, 0, 1, 1,
-0.2927707, -0.5458795, -2.651194, 0, 0, 0, 1, 1,
-0.2893151, -1.747336, -3.093132, 1, 1, 1, 1, 1,
-0.2890497, 2.702523, 0.09459056, 1, 1, 1, 1, 1,
-0.2880924, -0.07467486, -2.771912, 1, 1, 1, 1, 1,
-0.2849576, -0.8651727, -2.285229, 1, 1, 1, 1, 1,
-0.2835022, 0.7340987, 0.6779991, 1, 1, 1, 1, 1,
-0.2833023, -1.06437, -1.977091, 1, 1, 1, 1, 1,
-0.2830239, -0.3133935, -2.893013, 1, 1, 1, 1, 1,
-0.277193, 0.8910261, 0.008320587, 1, 1, 1, 1, 1,
-0.2680697, 0.8394001, -0.8205932, 1, 1, 1, 1, 1,
-0.2671034, -0.8729789, -2.128692, 1, 1, 1, 1, 1,
-0.2626174, 0.03943677, -1.411488, 1, 1, 1, 1, 1,
-0.2590804, -0.8154092, -4.148207, 1, 1, 1, 1, 1,
-0.2567014, 1.615925, 0.6066746, 1, 1, 1, 1, 1,
-0.2453188, -0.8030632, -2.733511, 1, 1, 1, 1, 1,
-0.2441236, -0.1650388, -1.905585, 1, 1, 1, 1, 1,
-0.2437248, 1.187768, -1.263815, 0, 0, 1, 1, 1,
-0.2403034, -0.04247566, -0.5455732, 1, 0, 0, 1, 1,
-0.2367129, 1.920219, 0.7972127, 1, 0, 0, 1, 1,
-0.2357506, -0.4382118, -1.443753, 1, 0, 0, 1, 1,
-0.2352102, -1.115718, -2.751312, 1, 0, 0, 1, 1,
-0.2338264, -1.046168, -3.915313, 1, 0, 0, 1, 1,
-0.2333331, 0.0557298, -0.8867977, 0, 0, 0, 1, 1,
-0.2320061, 0.4530725, -1.969427, 0, 0, 0, 1, 1,
-0.2307267, -0.5599657, -2.131308, 0, 0, 0, 1, 1,
-0.2189723, 0.3573385, 1.072828, 0, 0, 0, 1, 1,
-0.2174649, 0.00305351, -1.650499, 0, 0, 0, 1, 1,
-0.2102345, 0.5231215, -0.582196, 0, 0, 0, 1, 1,
-0.205122, 0.8170043, -0.1467555, 0, 0, 0, 1, 1,
-0.2040748, -0.05712561, 0.1528989, 1, 1, 1, 1, 1,
-0.2003519, 1.071528, -1.273877, 1, 1, 1, 1, 1,
-0.1998933, -0.9214488, -2.371073, 1, 1, 1, 1, 1,
-0.1974849, 0.5211087, -1.04473, 1, 1, 1, 1, 1,
-0.1911016, -0.995111, -0.439762, 1, 1, 1, 1, 1,
-0.18928, 1.081448, 0.6567531, 1, 1, 1, 1, 1,
-0.1866004, 0.6505995, -1.562411, 1, 1, 1, 1, 1,
-0.1858103, 0.7657661, -0.3312656, 1, 1, 1, 1, 1,
-0.1848981, 0.1783954, -1.397242, 1, 1, 1, 1, 1,
-0.1836784, -0.9529353, 0.01617823, 1, 1, 1, 1, 1,
-0.1813092, -1.212269, -3.873881, 1, 1, 1, 1, 1,
-0.1770885, 0.5782552, 0.9507961, 1, 1, 1, 1, 1,
-0.1699063, -0.3905055, -2.713045, 1, 1, 1, 1, 1,
-0.1686811, -0.4464492, -3.155023, 1, 1, 1, 1, 1,
-0.1686639, -0.2043479, -3.510002, 1, 1, 1, 1, 1,
-0.1645457, -1.389055, -2.384677, 0, 0, 1, 1, 1,
-0.1632047, 0.5906547, 0.1663824, 1, 0, 0, 1, 1,
-0.1628843, -0.04866731, -2.607473, 1, 0, 0, 1, 1,
-0.1624107, 0.8172222, -0.7376394, 1, 0, 0, 1, 1,
-0.1596881, -0.03963668, -0.8709436, 1, 0, 0, 1, 1,
-0.1553372, 0.6280361, 0.8620089, 1, 0, 0, 1, 1,
-0.1533191, 0.3333592, -0.9542709, 0, 0, 0, 1, 1,
-0.1478198, 0.8589886, 0.8500919, 0, 0, 0, 1, 1,
-0.1445602, 0.6434302, 0.1122449, 0, 0, 0, 1, 1,
-0.144205, 1.310894, -0.8874254, 0, 0, 0, 1, 1,
-0.14093, -1.789374, -4.28336, 0, 0, 0, 1, 1,
-0.134265, -0.05520017, -2.71283, 0, 0, 0, 1, 1,
-0.1336055, 0.7012894, -0.1682309, 0, 0, 0, 1, 1,
-0.132122, -0.3464597, -3.770692, 1, 1, 1, 1, 1,
-0.1307826, -0.747236, -3.637208, 1, 1, 1, 1, 1,
-0.1302496, 1.066064, -0.006961319, 1, 1, 1, 1, 1,
-0.1233312, 1.015693, 0.00558948, 1, 1, 1, 1, 1,
-0.1199816, -2.10627, -3.054941, 1, 1, 1, 1, 1,
-0.119383, -0.07833508, -3.555741, 1, 1, 1, 1, 1,
-0.1191358, 0.574219, -0.9744817, 1, 1, 1, 1, 1,
-0.1177128, -2.277107, -2.088646, 1, 1, 1, 1, 1,
-0.116895, -0.520182, -3.660626, 1, 1, 1, 1, 1,
-0.1167357, -0.3158803, -0.806501, 1, 1, 1, 1, 1,
-0.1167284, 0.5696729, 0.4700426, 1, 1, 1, 1, 1,
-0.1163294, 0.06749189, -1.400501, 1, 1, 1, 1, 1,
-0.1140438, -1.171659, -3.963472, 1, 1, 1, 1, 1,
-0.1133114, -0.1411152, -4.116843, 1, 1, 1, 1, 1,
-0.1132872, -1.087601, -2.099234, 1, 1, 1, 1, 1,
-0.1129578, 0.04365914, -0.4301331, 0, 0, 1, 1, 1,
-0.1126567, 0.7651474, 0.4544426, 1, 0, 0, 1, 1,
-0.1082041, -0.4051182, -2.091573, 1, 0, 0, 1, 1,
-0.1075997, 1.195485, -1.62434, 1, 0, 0, 1, 1,
-0.1075073, -1.340514, -2.498894, 1, 0, 0, 1, 1,
-0.1070056, 0.0582944, -2.217162, 1, 0, 0, 1, 1,
-0.106261, 1.2098, -0.8911172, 0, 0, 0, 1, 1,
-0.1051105, 0.5478146, -0.672332, 0, 0, 0, 1, 1,
-0.1010021, -1.511264, -2.112618, 0, 0, 0, 1, 1,
-0.09905836, -0.2333763, -3.043616, 0, 0, 0, 1, 1,
-0.09590426, 1.011753, 0.6755308, 0, 0, 0, 1, 1,
-0.09374154, -0.4318629, -2.400983, 0, 0, 0, 1, 1,
-0.08905838, -0.9113383, -3.825659, 0, 0, 0, 1, 1,
-0.08465362, -1.64979, -3.918409, 1, 1, 1, 1, 1,
-0.0813489, -2.24671, -1.95318, 1, 1, 1, 1, 1,
-0.08099134, -0.4279793, -2.359021, 1, 1, 1, 1, 1,
-0.07775322, -2.894953, -2.406284, 1, 1, 1, 1, 1,
-0.07642184, -1.425805, -3.262802, 1, 1, 1, 1, 1,
-0.07401132, 0.184772, 0.5278749, 1, 1, 1, 1, 1,
-0.07394844, 0.2123105, -0.5016242, 1, 1, 1, 1, 1,
-0.07297409, -0.1137591, -1.03212, 1, 1, 1, 1, 1,
-0.06957304, 2.347663, 0.3076916, 1, 1, 1, 1, 1,
-0.06951835, 0.6050892, -0.9397351, 1, 1, 1, 1, 1,
-0.06508376, 0.6314885, 1.054544, 1, 1, 1, 1, 1,
-0.05610247, 0.6675708, 0.5289186, 1, 1, 1, 1, 1,
-0.05606139, 0.3522602, -1.211382, 1, 1, 1, 1, 1,
-0.05474042, 1.290027, -0.5864816, 1, 1, 1, 1, 1,
-0.04749916, 1.865478, 0.300282, 1, 1, 1, 1, 1,
-0.04742774, 0.9588051, 0.2937494, 0, 0, 1, 1, 1,
-0.04726921, 0.1091621, -0.2354918, 1, 0, 0, 1, 1,
-0.04293445, -0.6871567, -2.482063, 1, 0, 0, 1, 1,
-0.03866794, 0.0223698, -0.3994245, 1, 0, 0, 1, 1,
-0.03303932, -0.6911543, -2.788469, 1, 0, 0, 1, 1,
-0.03019948, -1.02443, -4.070364, 1, 0, 0, 1, 1,
-0.0284474, -0.0635779, -4.022988, 0, 0, 0, 1, 1,
-0.02145552, -1.048431, -2.821609, 0, 0, 0, 1, 1,
-0.02016684, 0.1497947, 0.5465816, 0, 0, 0, 1, 1,
-0.01830595, -0.762632, -2.027842, 0, 0, 0, 1, 1,
-0.01830251, 1.858821, -0.1707276, 0, 0, 0, 1, 1,
-0.01242146, -0.5716043, -3.357957, 0, 0, 0, 1, 1,
-0.008872894, 0.1054138, 0.7175573, 0, 0, 0, 1, 1,
-0.0002511018, -1.293916, -3.166342, 1, 1, 1, 1, 1,
0.002404242, -1.062448, 2.923015, 1, 1, 1, 1, 1,
0.002652532, 0.9293463, 1.608875, 1, 1, 1, 1, 1,
0.006146664, 1.388552, -1.089376, 1, 1, 1, 1, 1,
0.006487857, 0.00979372, -0.125127, 1, 1, 1, 1, 1,
0.007193585, 0.6539481, 1.419847, 1, 1, 1, 1, 1,
0.008853238, 0.571031, -0.7470167, 1, 1, 1, 1, 1,
0.01153424, -0.3222205, 3.455444, 1, 1, 1, 1, 1,
0.01175791, -2.446424, 1.863166, 1, 1, 1, 1, 1,
0.01321846, 2.086645, 1.011112, 1, 1, 1, 1, 1,
0.01530243, 1.519622, 0.2719709, 1, 1, 1, 1, 1,
0.01702425, 0.8091135, 0.01189364, 1, 1, 1, 1, 1,
0.01812945, -1.381315, 2.621937, 1, 1, 1, 1, 1,
0.01965633, -0.5120655, 4.910551, 1, 1, 1, 1, 1,
0.02269628, -0.05202986, 2.424028, 1, 1, 1, 1, 1,
0.02746554, -1.259515, 4.279519, 0, 0, 1, 1, 1,
0.03285595, 0.5095773, 1.045372, 1, 0, 0, 1, 1,
0.03331412, -0.3632517, 2.131352, 1, 0, 0, 1, 1,
0.04157545, -0.52859, 3.306514, 1, 0, 0, 1, 1,
0.04381483, -1.069001, 4.197256, 1, 0, 0, 1, 1,
0.04608111, 0.3762122, 0.4470594, 1, 0, 0, 1, 1,
0.05161586, -0.05598227, 2.690083, 0, 0, 0, 1, 1,
0.05336358, -0.4364015, 2.308471, 0, 0, 0, 1, 1,
0.05526509, -0.5406153, 2.858104, 0, 0, 0, 1, 1,
0.0660558, -1.129433, 1.917884, 0, 0, 0, 1, 1,
0.06863359, -0.5472933, 2.489859, 0, 0, 0, 1, 1,
0.07140247, 0.4375282, 0.7107649, 0, 0, 0, 1, 1,
0.07658032, -0.01335341, 1.690388, 0, 0, 0, 1, 1,
0.07866865, -0.1403807, 5.255836, 1, 1, 1, 1, 1,
0.07927394, 0.6095557, -0.9892277, 1, 1, 1, 1, 1,
0.08026322, -0.844677, 3.444872, 1, 1, 1, 1, 1,
0.08072783, 0.3393087, -0.1073226, 1, 1, 1, 1, 1,
0.08405194, 0.8526136, -0.1827053, 1, 1, 1, 1, 1,
0.08606982, 0.4154696, -0.7132838, 1, 1, 1, 1, 1,
0.08682054, 0.836033, 1.238544, 1, 1, 1, 1, 1,
0.09163393, 1.738862, -1.894478, 1, 1, 1, 1, 1,
0.09617345, 0.4985922, -0.5073949, 1, 1, 1, 1, 1,
0.1081153, -1.080751, 3.883983, 1, 1, 1, 1, 1,
0.1091768, -0.07040624, 0.5354862, 1, 1, 1, 1, 1,
0.1173802, 0.002353398, 2.920102, 1, 1, 1, 1, 1,
0.1187071, 0.4043203, -0.4866229, 1, 1, 1, 1, 1,
0.1216883, 0.2533144, 1.46766, 1, 1, 1, 1, 1,
0.1221905, 0.6282011, 1.596008, 1, 1, 1, 1, 1,
0.1325218, -0.6713526, 4.106824, 0, 0, 1, 1, 1,
0.1339432, 0.2568403, 0.4765937, 1, 0, 0, 1, 1,
0.141059, 0.4541556, 0.8448786, 1, 0, 0, 1, 1,
0.1420068, -2.254905, 2.469126, 1, 0, 0, 1, 1,
0.1437315, -1.354683, 2.139963, 1, 0, 0, 1, 1,
0.1466662, -0.1978542, 2.782452, 1, 0, 0, 1, 1,
0.1514819, 0.8008683, -0.7251211, 0, 0, 0, 1, 1,
0.1544117, -1.07024, 3.418804, 0, 0, 0, 1, 1,
0.1576711, -1.238841, 3.463037, 0, 0, 0, 1, 1,
0.1578238, -0.4438576, 2.983821, 0, 0, 0, 1, 1,
0.1612351, 0.750015, 1.195739, 0, 0, 0, 1, 1,
0.1633903, 2.11544, -1.553549, 0, 0, 0, 1, 1,
0.1654541, 0.8160991, 0.4171342, 0, 0, 0, 1, 1,
0.1825224, -0.4683117, 0.278953, 1, 1, 1, 1, 1,
0.1849611, -1.857327, 0.985337, 1, 1, 1, 1, 1,
0.1864138, -0.6481922, 3.441488, 1, 1, 1, 1, 1,
0.1893118, -0.4468865, 2.07937, 1, 1, 1, 1, 1,
0.195715, -1.216989, 2.3835, 1, 1, 1, 1, 1,
0.1977024, 0.5874263, -1.244776, 1, 1, 1, 1, 1,
0.2018286, -1.009708, 3.817895, 1, 1, 1, 1, 1,
0.2023555, -0.471837, 3.047663, 1, 1, 1, 1, 1,
0.2062202, -0.863038, 3.517004, 1, 1, 1, 1, 1,
0.2126359, 0.03151456, 1.945881, 1, 1, 1, 1, 1,
0.2148859, 0.2889826, 0.7916352, 1, 1, 1, 1, 1,
0.2179337, -0.7466553, 3.055351, 1, 1, 1, 1, 1,
0.2182887, -0.3918099, 2.95239, 1, 1, 1, 1, 1,
0.2189289, 0.2900448, 1.630036, 1, 1, 1, 1, 1,
0.2239541, 1.014863, -0.2683029, 1, 1, 1, 1, 1,
0.2243605, -0.412742, 3.143721, 0, 0, 1, 1, 1,
0.2254552, -2.191906, 1.049884, 1, 0, 0, 1, 1,
0.2265242, 1.333452, -0.4034663, 1, 0, 0, 1, 1,
0.2267299, 0.3226978, 0.1834527, 1, 0, 0, 1, 1,
0.2289521, 0.5177281, 0.6166322, 1, 0, 0, 1, 1,
0.2295996, -1.369984, 3.109191, 1, 0, 0, 1, 1,
0.2357915, 0.6543972, 0.4250893, 0, 0, 0, 1, 1,
0.2361074, -1.122735, 3.795804, 0, 0, 0, 1, 1,
0.2365585, 0.6729243, -0.02301864, 0, 0, 0, 1, 1,
0.2367618, 0.5537362, 1.240742, 0, 0, 0, 1, 1,
0.2372159, -0.1194976, 1.231142, 0, 0, 0, 1, 1,
0.2437893, -1.25509, 2.646009, 0, 0, 0, 1, 1,
0.2456711, 0.06679138, 2.445301, 0, 0, 0, 1, 1,
0.2465908, 0.9939746, 1.464737, 1, 1, 1, 1, 1,
0.2476232, -0.8687596, 3.453503, 1, 1, 1, 1, 1,
0.248217, 1.664364, 0.9115674, 1, 1, 1, 1, 1,
0.2505272, 0.2995685, 2.172264, 1, 1, 1, 1, 1,
0.2532942, 0.3571582, 0.06060532, 1, 1, 1, 1, 1,
0.2538013, 0.1309359, 2.49413, 1, 1, 1, 1, 1,
0.2553615, -2.675653, 3.089526, 1, 1, 1, 1, 1,
0.2595132, -0.9559953, 4.849781, 1, 1, 1, 1, 1,
0.2631647, -1.749867, 2.990914, 1, 1, 1, 1, 1,
0.2672393, 0.09440108, 0.9547515, 1, 1, 1, 1, 1,
0.2712525, -1.013823, 1.770617, 1, 1, 1, 1, 1,
0.2727317, -0.3955403, 3.377527, 1, 1, 1, 1, 1,
0.2768584, 0.5755799, 1.917228, 1, 1, 1, 1, 1,
0.2792617, 1.48755, -0.2808431, 1, 1, 1, 1, 1,
0.279335, -2.228742, 3.125268, 1, 1, 1, 1, 1,
0.2846437, -1.330839, 4.284478, 0, 0, 1, 1, 1,
0.2860748, -0.03963378, 1.998522, 1, 0, 0, 1, 1,
0.289891, -1.155788, 3.34136, 1, 0, 0, 1, 1,
0.2923888, -0.6645126, 1.614854, 1, 0, 0, 1, 1,
0.292878, 0.8474676, 1.664211, 1, 0, 0, 1, 1,
0.2932168, -0.2838306, 1.169984, 1, 0, 0, 1, 1,
0.2956432, -1.048543, 2.161768, 0, 0, 0, 1, 1,
0.2997975, -0.3552098, 1.337377, 0, 0, 0, 1, 1,
0.2998237, -0.7081658, 1.257767, 0, 0, 0, 1, 1,
0.3039423, 0.5376257, 0.3561983, 0, 0, 0, 1, 1,
0.3061485, 0.6672001, 0.9653065, 0, 0, 0, 1, 1,
0.3063565, -2.069685, 2.315439, 0, 0, 0, 1, 1,
0.3116617, -0.3868749, 2.572044, 0, 0, 0, 1, 1,
0.3130153, 1.245778, 0.3719282, 1, 1, 1, 1, 1,
0.3143179, 0.4352049, 1.209728, 1, 1, 1, 1, 1,
0.3160395, 0.07292069, 2.535199, 1, 1, 1, 1, 1,
0.3172137, -0.8959315, 2.862052, 1, 1, 1, 1, 1,
0.3181017, 0.224254, 1.168519, 1, 1, 1, 1, 1,
0.3199561, 0.1908203, 1.670831, 1, 1, 1, 1, 1,
0.3310033, 1.269365, -0.6196072, 1, 1, 1, 1, 1,
0.3332494, -0.9975129, 2.492847, 1, 1, 1, 1, 1,
0.3400475, 0.3774696, 3.000127, 1, 1, 1, 1, 1,
0.340942, -0.8799355, 3.418156, 1, 1, 1, 1, 1,
0.341574, -0.1041783, 2.09163, 1, 1, 1, 1, 1,
0.3521764, -0.5605485, 2.219008, 1, 1, 1, 1, 1,
0.3556037, -1.251932, 4.141869, 1, 1, 1, 1, 1,
0.3618277, -0.5339164, 2.637962, 1, 1, 1, 1, 1,
0.3661518, -0.3489954, 3.111712, 1, 1, 1, 1, 1,
0.3667441, -0.2997383, 1.66604, 0, 0, 1, 1, 1,
0.3682138, -1.01246, 2.576666, 1, 0, 0, 1, 1,
0.3683906, 0.6040972, -0.4043321, 1, 0, 0, 1, 1,
0.3684661, 0.1486424, -0.6356841, 1, 0, 0, 1, 1,
0.3728729, -1.969104, 3.24436, 1, 0, 0, 1, 1,
0.376418, -0.6663815, 2.503781, 1, 0, 0, 1, 1,
0.376594, 0.7432971, 1.610625, 0, 0, 0, 1, 1,
0.3770413, 0.3174781, 0.4787779, 0, 0, 0, 1, 1,
0.377048, 0.5331188, 0.7486899, 0, 0, 0, 1, 1,
0.3781178, 0.01035758, 0.8537278, 0, 0, 0, 1, 1,
0.3785159, -0.2381998, 0.8421196, 0, 0, 0, 1, 1,
0.3786969, -0.6642827, 3.794595, 0, 0, 0, 1, 1,
0.3862035, -0.4269693, 2.231132, 0, 0, 0, 1, 1,
0.3863783, 0.536194, 1.971755, 1, 1, 1, 1, 1,
0.3887712, -0.144355, 1.736599, 1, 1, 1, 1, 1,
0.389978, -0.2808028, 2.260741, 1, 1, 1, 1, 1,
0.3933516, 0.5889197, 0.6686267, 1, 1, 1, 1, 1,
0.3981948, 0.07862035, 2.26081, 1, 1, 1, 1, 1,
0.399979, -0.163512, 1.760459, 1, 1, 1, 1, 1,
0.4006901, 0.08004067, 1.685942, 1, 1, 1, 1, 1,
0.4063721, -1.358141, 1.14955, 1, 1, 1, 1, 1,
0.4067104, 0.945102, 1.308339, 1, 1, 1, 1, 1,
0.4079679, 0.01307315, 0.1998346, 1, 1, 1, 1, 1,
0.409321, 0.7130147, 2.752312, 1, 1, 1, 1, 1,
0.412227, -1.056176, 2.917826, 1, 1, 1, 1, 1,
0.4128426, 1.377345, 1.584773, 1, 1, 1, 1, 1,
0.422688, 1.470615, 1.246618, 1, 1, 1, 1, 1,
0.4236757, -0.8576679, 2.010514, 1, 1, 1, 1, 1,
0.4271941, -1.812544, 3.155132, 0, 0, 1, 1, 1,
0.4296352, -0.6367656, 3.075859, 1, 0, 0, 1, 1,
0.432405, -0.8999983, 3.731736, 1, 0, 0, 1, 1,
0.4325157, 0.009415901, 3.212199, 1, 0, 0, 1, 1,
0.437828, -1.082101, 2.844305, 1, 0, 0, 1, 1,
0.4382485, 2.058638, -1.402625, 1, 0, 0, 1, 1,
0.4391789, 1.09299, -1.250122, 0, 0, 0, 1, 1,
0.4398715, -0.5059547, 1.910415, 0, 0, 0, 1, 1,
0.4400421, -0.5646228, 1.418237, 0, 0, 0, 1, 1,
0.4406025, -0.4298224, 0.7227569, 0, 0, 0, 1, 1,
0.4407482, 0.2326863, 0.8343758, 0, 0, 0, 1, 1,
0.4449925, 0.8068949, -0.3170736, 0, 0, 0, 1, 1,
0.4481999, 0.1951898, 1.17909, 0, 0, 0, 1, 1,
0.450855, 0.0974187, 1.977639, 1, 1, 1, 1, 1,
0.4529807, 1.182364, -0.1870531, 1, 1, 1, 1, 1,
0.4551759, -0.5135024, 1.952546, 1, 1, 1, 1, 1,
0.4589445, 0.3987317, 0.7295715, 1, 1, 1, 1, 1,
0.464318, 0.3307604, 0.9270439, 1, 1, 1, 1, 1,
0.4659692, -0.0464692, 3.392243, 1, 1, 1, 1, 1,
0.4679484, 2.064984, 0.5852984, 1, 1, 1, 1, 1,
0.4702809, 0.7509115, 1.889465, 1, 1, 1, 1, 1,
0.4704856, 0.08359126, 0.7863429, 1, 1, 1, 1, 1,
0.4708133, 2.267781, -0.09461612, 1, 1, 1, 1, 1,
0.473035, -0.8143256, 2.550281, 1, 1, 1, 1, 1,
0.4780422, -0.2220466, 1.329931, 1, 1, 1, 1, 1,
0.48146, 0.524708, 0.9365052, 1, 1, 1, 1, 1,
0.4841545, 0.443086, 1.318785, 1, 1, 1, 1, 1,
0.4873558, -0.3073442, 1.317309, 1, 1, 1, 1, 1,
0.4919536, -0.3104674, 2.827879, 0, 0, 1, 1, 1,
0.492729, 0.3068649, 0.448649, 1, 0, 0, 1, 1,
0.4974497, -0.9999493, 4.458991, 1, 0, 0, 1, 1,
0.4987788, -1.958977, 2.764923, 1, 0, 0, 1, 1,
0.5169626, 0.4867295, 0.37117, 1, 0, 0, 1, 1,
0.5180874, 0.8397493, -0.6974203, 1, 0, 0, 1, 1,
0.5235176, -0.7140329, 2.90433, 0, 0, 0, 1, 1,
0.5291485, -0.03854591, 3.112655, 0, 0, 0, 1, 1,
0.5294985, -0.6502236, 2.869167, 0, 0, 0, 1, 1,
0.5313708, 0.541454, 1.805313, 0, 0, 0, 1, 1,
0.5331749, 1.335563, 0.406898, 0, 0, 0, 1, 1,
0.5383985, -0.2443297, 3.050635, 0, 0, 0, 1, 1,
0.5387901, -0.5070035, 1.766642, 0, 0, 0, 1, 1,
0.5411716, -0.4872897, 3.057434, 1, 1, 1, 1, 1,
0.5423912, -0.2864832, 0.2396719, 1, 1, 1, 1, 1,
0.5440859, 0.4843315, 2.193108, 1, 1, 1, 1, 1,
0.5470077, 0.4595322, 0.3012747, 1, 1, 1, 1, 1,
0.5488781, -0.3249562, 4.262619, 1, 1, 1, 1, 1,
0.5498534, -1.303533, 1.885976, 1, 1, 1, 1, 1,
0.5511771, -2.73338, 3.213568, 1, 1, 1, 1, 1,
0.5536199, -0.2840905, 3.570141, 1, 1, 1, 1, 1,
0.5547584, 2.068673, 0.6460804, 1, 1, 1, 1, 1,
0.5630003, 0.8997507, 0.5325453, 1, 1, 1, 1, 1,
0.5681217, -0.4133198, 0.06790533, 1, 1, 1, 1, 1,
0.5709889, 2.03542, 1.010671, 1, 1, 1, 1, 1,
0.5795833, 1.724454, 1.304897, 1, 1, 1, 1, 1,
0.5842298, 0.60511, 1.762795, 1, 1, 1, 1, 1,
0.5843109, 0.3956823, 0.9389886, 1, 1, 1, 1, 1,
0.5861649, 2.042043, -0.498346, 0, 0, 1, 1, 1,
0.587661, -1.531679, 2.607291, 1, 0, 0, 1, 1,
0.5895163, -0.6063532, 1.414779, 1, 0, 0, 1, 1,
0.5942186, -1.766169, 3.65917, 1, 0, 0, 1, 1,
0.5964032, -1.597191, 3.18633, 1, 0, 0, 1, 1,
0.5970392, -0.9412211, 1.626016, 1, 0, 0, 1, 1,
0.5995408, -0.8729851, 3.480444, 0, 0, 0, 1, 1,
0.6002792, 0.8551896, 1.478085, 0, 0, 0, 1, 1,
0.6007854, 0.8404609, 1.347353, 0, 0, 0, 1, 1,
0.6016621, 0.7069108, -1.57644, 0, 0, 0, 1, 1,
0.6026474, -0.1145884, 0.5205758, 0, 0, 0, 1, 1,
0.6029034, 1.097953, 0.002135363, 0, 0, 0, 1, 1,
0.6036621, 0.1126507, 1.485602, 0, 0, 0, 1, 1,
0.6050568, -1.296392, 2.051725, 1, 1, 1, 1, 1,
0.6129407, -0.7955386, 3.027926, 1, 1, 1, 1, 1,
0.6132441, -0.8240767, 2.452727, 1, 1, 1, 1, 1,
0.61485, -0.7718193, 1.279645, 1, 1, 1, 1, 1,
0.6150591, 0.9854907, 0.4138511, 1, 1, 1, 1, 1,
0.6160222, -1.608407, 1.7568, 1, 1, 1, 1, 1,
0.6211539, -0.3036767, 2.077883, 1, 1, 1, 1, 1,
0.626967, -0.6635699, 3.060366, 1, 1, 1, 1, 1,
0.6291119, -0.33801, 1.41022, 1, 1, 1, 1, 1,
0.6318655, -0.918231, 1.315109, 1, 1, 1, 1, 1,
0.6336758, 0.5017106, 2.540102, 1, 1, 1, 1, 1,
0.638363, -0.3594493, 2.074826, 1, 1, 1, 1, 1,
0.6389318, -1.367171, 1.102773, 1, 1, 1, 1, 1,
0.6412756, -0.03684474, -0.02575531, 1, 1, 1, 1, 1,
0.6418338, 0.1693555, 1.821705, 1, 1, 1, 1, 1,
0.6484857, 0.1699656, 1.433735, 0, 0, 1, 1, 1,
0.6550844, 0.3463565, 0.1092386, 1, 0, 0, 1, 1,
0.6622625, -0.7547765, 2.408159, 1, 0, 0, 1, 1,
0.6629295, -0.0448562, 2.912034, 1, 0, 0, 1, 1,
0.6661853, 1.153081, 0.2543923, 1, 0, 0, 1, 1,
0.676976, -1.346686, 1.084636, 1, 0, 0, 1, 1,
0.68111, -0.7593749, 2.642802, 0, 0, 0, 1, 1,
0.6828437, 1.156658, 0.4845725, 0, 0, 0, 1, 1,
0.6877286, 0.8216915, -0.5043333, 0, 0, 0, 1, 1,
0.6901254, 0.925552, -0.06062588, 0, 0, 0, 1, 1,
0.693215, 0.4414955, 2.753222, 0, 0, 0, 1, 1,
0.6976568, -1.896243, 1.025985, 0, 0, 0, 1, 1,
0.6983116, -0.6028675, 2.134233, 0, 0, 0, 1, 1,
0.6992775, 0.8882592, 0.3740715, 1, 1, 1, 1, 1,
0.700506, 1.108236, 1.702383, 1, 1, 1, 1, 1,
0.7065035, -0.8916606, 1.060465, 1, 1, 1, 1, 1,
0.710962, 0.603984, 0.2192914, 1, 1, 1, 1, 1,
0.7227815, -1.087849, 1.760552, 1, 1, 1, 1, 1,
0.7258581, 0.7020383, 1.165251, 1, 1, 1, 1, 1,
0.7261599, -0.8711091, 2.215282, 1, 1, 1, 1, 1,
0.7316621, -0.9812944, 3.301449, 1, 1, 1, 1, 1,
0.7326064, 1.724094, 0.07157835, 1, 1, 1, 1, 1,
0.7393386, 1.557035, 0.5682598, 1, 1, 1, 1, 1,
0.7414652, 2.344374, 0.4853586, 1, 1, 1, 1, 1,
0.7443171, 1.95778, 1.295691, 1, 1, 1, 1, 1,
0.744761, 0.6010087, 0.7725757, 1, 1, 1, 1, 1,
0.7473227, -0.9530745, 4.315415, 1, 1, 1, 1, 1,
0.7475304, -0.3802167, 1.712277, 1, 1, 1, 1, 1,
0.7527124, -1.570092, 1.216367, 0, 0, 1, 1, 1,
0.754373, 0.09610742, 0.1965951, 1, 0, 0, 1, 1,
0.7583784, -0.2754865, 0.4835109, 1, 0, 0, 1, 1,
0.7623506, -0.2606419, 3.170945, 1, 0, 0, 1, 1,
0.7695806, 1.098668, -1.163245, 1, 0, 0, 1, 1,
0.776446, -0.8179486, 0.8356366, 1, 0, 0, 1, 1,
0.7820784, 1.403937, 0.5902364, 0, 0, 0, 1, 1,
0.7837304, -0.4576758, 1.909765, 0, 0, 0, 1, 1,
0.7842745, -0.6552953, 2.132132, 0, 0, 0, 1, 1,
0.7867121, 0.2319107, 0.6644544, 0, 0, 0, 1, 1,
0.7915722, 2.084856, -0.3990797, 0, 0, 0, 1, 1,
0.7932746, 1.051181, 0.3209289, 0, 0, 0, 1, 1,
0.8062885, 0.03001517, 1.637808, 0, 0, 0, 1, 1,
0.8073955, -1.502279, 2.38976, 1, 1, 1, 1, 1,
0.8121071, 0.3484713, 1.806896, 1, 1, 1, 1, 1,
0.8140254, 0.09860978, 1.275877, 1, 1, 1, 1, 1,
0.8150721, 0.0792536, 2.0888, 1, 1, 1, 1, 1,
0.8188273, -0.9675114, 1.870289, 1, 1, 1, 1, 1,
0.8223149, -0.1405038, 2.846881, 1, 1, 1, 1, 1,
0.8328601, -1.151646, 2.766876, 1, 1, 1, 1, 1,
0.8335623, 0.9611046, 2.089252, 1, 1, 1, 1, 1,
0.8390011, 0.329686, 1.453324, 1, 1, 1, 1, 1,
0.845672, 2.40957, -1.042375, 1, 1, 1, 1, 1,
0.8604755, -0.2792433, 2.583938, 1, 1, 1, 1, 1,
0.8741542, -0.1190363, 1.974964, 1, 1, 1, 1, 1,
0.8749366, 0.185515, 0.3835835, 1, 1, 1, 1, 1,
0.8799061, -1.241554, 1.81951, 1, 1, 1, 1, 1,
0.8799558, 0.1347874, 1.356275, 1, 1, 1, 1, 1,
0.8823594, 0.4779205, 1.016431, 0, 0, 1, 1, 1,
0.8836986, -0.6058475, 2.375245, 1, 0, 0, 1, 1,
0.885486, 0.7286849, 1.661932, 1, 0, 0, 1, 1,
0.8909284, 0.2841289, 0.9376428, 1, 0, 0, 1, 1,
0.8924661, -0.3285968, 1.471455, 1, 0, 0, 1, 1,
0.8955165, -1.959434, 3.065546, 1, 0, 0, 1, 1,
0.8975785, -1.724407, 2.091918, 0, 0, 0, 1, 1,
0.9012338, -1.21262, 4.005536, 0, 0, 0, 1, 1,
0.905835, -0.8320895, 0.5865455, 0, 0, 0, 1, 1,
0.9063829, 0.6781576, 1.083265, 0, 0, 0, 1, 1,
0.9107892, -0.4807749, 1.251506, 0, 0, 0, 1, 1,
0.9136854, 0.769986, 0.5463427, 0, 0, 0, 1, 1,
0.9154191, 0.5407641, 2.402968, 0, 0, 0, 1, 1,
0.9156865, -1.69954, 2.179399, 1, 1, 1, 1, 1,
0.9156947, 1.400952, 0.02749019, 1, 1, 1, 1, 1,
0.9205294, -0.8307602, 0.5018628, 1, 1, 1, 1, 1,
0.9278384, 2.448486, -1.053187, 1, 1, 1, 1, 1,
0.9326019, 1.012359, 0.9734517, 1, 1, 1, 1, 1,
0.9326144, -1.932548, 3.11394, 1, 1, 1, 1, 1,
0.9348817, -0.3419755, -0.8640031, 1, 1, 1, 1, 1,
0.9378816, -0.2191132, -1.017585, 1, 1, 1, 1, 1,
0.9409479, 0.5901275, 1.732306, 1, 1, 1, 1, 1,
0.9422145, 1.294297, -0.5205042, 1, 1, 1, 1, 1,
0.950605, -0.8951519, 2.975358, 1, 1, 1, 1, 1,
0.9536383, -1.228886, 2.614137, 1, 1, 1, 1, 1,
0.9541773, -0.6898866, 1.91194, 1, 1, 1, 1, 1,
0.9552565, -0.433084, 2.223124, 1, 1, 1, 1, 1,
0.9598227, -1.317657, 1.687215, 1, 1, 1, 1, 1,
0.9613834, -1.214486, 1.593097, 0, 0, 1, 1, 1,
0.9669811, 0.007777188, 2.645714, 1, 0, 0, 1, 1,
0.972324, -0.06965291, 2.061138, 1, 0, 0, 1, 1,
0.9770907, 0.7598766, 1.118133, 1, 0, 0, 1, 1,
0.9774705, -0.01422322, 0.4511066, 1, 0, 0, 1, 1,
0.9834468, -0.5349558, 1.839096, 1, 0, 0, 1, 1,
0.9835231, 1.362374, -0.001750366, 0, 0, 0, 1, 1,
0.9874134, -0.3362488, 3.563364, 0, 0, 0, 1, 1,
0.9982199, 0.2587596, 1.099941, 0, 0, 0, 1, 1,
1.000448, -0.884688, 4.360551, 0, 0, 0, 1, 1,
1.000914, 0.4179187, 2.015747, 0, 0, 0, 1, 1,
1.021059, 1.16604, 0.3809281, 0, 0, 0, 1, 1,
1.024749, -1.460572, 3.024866, 0, 0, 0, 1, 1,
1.028296, 1.018789, 0.8246863, 1, 1, 1, 1, 1,
1.028562, 1.621863, 0.7516989, 1, 1, 1, 1, 1,
1.032889, -0.7798551, 1.959867, 1, 1, 1, 1, 1,
1.03648, 1.179847, -0.250291, 1, 1, 1, 1, 1,
1.045825, -1.04575, 4.153515, 1, 1, 1, 1, 1,
1.049387, 0.3041803, 2.106491, 1, 1, 1, 1, 1,
1.05792, -1.126903, 2.626882, 1, 1, 1, 1, 1,
1.065942, -0.6652399, 3.184744, 1, 1, 1, 1, 1,
1.066311, -0.6682587, 0.5902162, 1, 1, 1, 1, 1,
1.06992, -0.2739585, 2.296473, 1, 1, 1, 1, 1,
1.075466, -1.35665, 2.499412, 1, 1, 1, 1, 1,
1.079848, 0.7867807, 0.9785414, 1, 1, 1, 1, 1,
1.083176, 0.8900512, 0.69704, 1, 1, 1, 1, 1,
1.087216, -1.848818, 2.825649, 1, 1, 1, 1, 1,
1.09558, -0.4285561, 0.8046673, 1, 1, 1, 1, 1,
1.105262, -0.3279012, 3.810226, 0, 0, 1, 1, 1,
1.11763, -0.204496, 3.355572, 1, 0, 0, 1, 1,
1.119904, -1.714492, 2.695313, 1, 0, 0, 1, 1,
1.131526, 1.148028, 2.238556, 1, 0, 0, 1, 1,
1.132923, -0.2543703, 2.460225, 1, 0, 0, 1, 1,
1.135953, -0.1651193, -0.2548468, 1, 0, 0, 1, 1,
1.142876, 1.045585, -0.1779245, 0, 0, 0, 1, 1,
1.144117, 0.917191, 0.3170498, 0, 0, 0, 1, 1,
1.149268, -0.6209208, 1.203522, 0, 0, 0, 1, 1,
1.152837, -0.07165708, 3.470978, 0, 0, 0, 1, 1,
1.155144, 0.5039459, 0.3695826, 0, 0, 0, 1, 1,
1.155788, 0.4868374, 1.255794, 0, 0, 0, 1, 1,
1.156658, 0.8644587, 2.209989, 0, 0, 0, 1, 1,
1.160097, -0.277071, 2.4237, 1, 1, 1, 1, 1,
1.167819, 1.364054, 0.7276094, 1, 1, 1, 1, 1,
1.170127, 1.358111, -1.419404, 1, 1, 1, 1, 1,
1.170781, 0.5245762, 0.3475202, 1, 1, 1, 1, 1,
1.17415, -0.955475, 1.466367, 1, 1, 1, 1, 1,
1.174482, 1.182238, 3.063293, 1, 1, 1, 1, 1,
1.174883, 0.4785013, 0.4294004, 1, 1, 1, 1, 1,
1.175251, -0.5730457, 1.829118, 1, 1, 1, 1, 1,
1.178837, -0.05607338, 0.4795514, 1, 1, 1, 1, 1,
1.181217, -1.432832, 2.17489, 1, 1, 1, 1, 1,
1.186015, 0.1643823, 0.7963737, 1, 1, 1, 1, 1,
1.203238, 0.4344236, 1.452779, 1, 1, 1, 1, 1,
1.208447, 0.703236, 0.6756608, 1, 1, 1, 1, 1,
1.211609, 2.253261, 1.828233, 1, 1, 1, 1, 1,
1.222988, 0.844622, 2.855381, 1, 1, 1, 1, 1,
1.224972, -0.9724308, 1.874555, 0, 0, 1, 1, 1,
1.228399, 1.755996, 0.8821948, 1, 0, 0, 1, 1,
1.250465, -0.2917372, 0.1582454, 1, 0, 0, 1, 1,
1.25404, 1.377488, -0.07701365, 1, 0, 0, 1, 1,
1.255398, -2.404393, 3.358025, 1, 0, 0, 1, 1,
1.264467, 0.7378135, 3.708922, 1, 0, 0, 1, 1,
1.266358, -1.024282, 2.928534, 0, 0, 0, 1, 1,
1.28652, -0.3808917, 1.963302, 0, 0, 0, 1, 1,
1.288142, -0.6232142, 2.446291, 0, 0, 0, 1, 1,
1.302991, 0.4156976, 0.9464859, 0, 0, 0, 1, 1,
1.310163, 1.919773, 0.8124996, 0, 0, 0, 1, 1,
1.31647, 0.3041883, 0.8948998, 0, 0, 0, 1, 1,
1.317908, 0.7667952, 0.2324803, 0, 0, 0, 1, 1,
1.319736, 0.07835433, 1.336183, 1, 1, 1, 1, 1,
1.320328, -0.9385674, 2.075212, 1, 1, 1, 1, 1,
1.32187, -0.4685528, 1.806951, 1, 1, 1, 1, 1,
1.325254, 1.318616, 1.568022, 1, 1, 1, 1, 1,
1.334746, 1.606541, 1.235152, 1, 1, 1, 1, 1,
1.338833, 0.7089384, 0.2142255, 1, 1, 1, 1, 1,
1.342597, 0.5406539, 2.2476, 1, 1, 1, 1, 1,
1.344354, -0.9775992, 0.6342292, 1, 1, 1, 1, 1,
1.345858, 0.1849872, -0.4026786, 1, 1, 1, 1, 1,
1.349289, -0.09047668, 1.95701, 1, 1, 1, 1, 1,
1.364316, -1.169273, 1.080081, 1, 1, 1, 1, 1,
1.364622, -0.2399385, 2.507859, 1, 1, 1, 1, 1,
1.365531, -0.4186765, 2.455965, 1, 1, 1, 1, 1,
1.370698, -0.1131552, 1.143722, 1, 1, 1, 1, 1,
1.386039, 0.3804404, 1.601155, 1, 1, 1, 1, 1,
1.392389, 0.9151273, 1.109895, 0, 0, 1, 1, 1,
1.405596, -1.842458, 4.647515, 1, 0, 0, 1, 1,
1.43099, -0.08310735, 0.7252731, 1, 0, 0, 1, 1,
1.445817, -0.1363232, 3.396948, 1, 0, 0, 1, 1,
1.471343, 0.457056, 0.6180851, 1, 0, 0, 1, 1,
1.47205, 0.3008899, 2.197881, 1, 0, 0, 1, 1,
1.475074, 0.7860993, 0.8788951, 0, 0, 0, 1, 1,
1.479596, -1.051529, 1.489039, 0, 0, 0, 1, 1,
1.486447, 0.9063417, 0.6124192, 0, 0, 0, 1, 1,
1.492717, -0.8832266, 1.118674, 0, 0, 0, 1, 1,
1.501532, 1.158593, 1.315683, 0, 0, 0, 1, 1,
1.503056, -1.394839, 1.656772, 0, 0, 0, 1, 1,
1.510337, -0.6960852, 2.799816, 0, 0, 0, 1, 1,
1.514261, -0.6666541, 2.433575, 1, 1, 1, 1, 1,
1.518803, -0.4722427, 2.920775, 1, 1, 1, 1, 1,
1.52716, 0.5160975, 1.254418, 1, 1, 1, 1, 1,
1.52756, -0.835396, 2.601625, 1, 1, 1, 1, 1,
1.544743, 0.3725967, 3.389055, 1, 1, 1, 1, 1,
1.548417, -0.7789584, 1.17982, 1, 1, 1, 1, 1,
1.556354, -0.2940153, 1.222817, 1, 1, 1, 1, 1,
1.560988, 0.02680975, -0.08531881, 1, 1, 1, 1, 1,
1.563119, 0.5458823, 1.410505, 1, 1, 1, 1, 1,
1.576636, -0.2537634, 0.7283303, 1, 1, 1, 1, 1,
1.583654, -1.931035, 2.997033, 1, 1, 1, 1, 1,
1.596673, -0.1693461, 1.931328, 1, 1, 1, 1, 1,
1.599384, 2.002581, 0.7549122, 1, 1, 1, 1, 1,
1.60233, 0.2065566, 2.428077, 1, 1, 1, 1, 1,
1.610379, -1.392289, 2.397686, 1, 1, 1, 1, 1,
1.611039, -0.3092318, 0.8648848, 0, 0, 1, 1, 1,
1.611445, 0.4080974, 0.9899467, 1, 0, 0, 1, 1,
1.619016, -0.3170962, 2.217346, 1, 0, 0, 1, 1,
1.650579, 1.728548, 1.428903, 1, 0, 0, 1, 1,
1.672435, -0.08962318, 0.5735056, 1, 0, 0, 1, 1,
1.678524, 0.1234816, 2.117063, 1, 0, 0, 1, 1,
1.716327, -1.415729, 2.053242, 0, 0, 0, 1, 1,
1.718103, 0.6880521, 1.948437, 0, 0, 0, 1, 1,
1.731723, 0.08338823, 2.463567, 0, 0, 0, 1, 1,
1.751228, -0.3109885, 0.7597061, 0, 0, 0, 1, 1,
1.767106, 0.00610606, 2.309988, 0, 0, 0, 1, 1,
1.771316, -0.1193426, 3.817625, 0, 0, 0, 1, 1,
1.805686, 0.5278134, 2.554568, 0, 0, 0, 1, 1,
1.829432, 0.04673453, 1.489042, 1, 1, 1, 1, 1,
1.844944, 0.3386113, 1.549246, 1, 1, 1, 1, 1,
1.863518, -1.00035, 2.555159, 1, 1, 1, 1, 1,
1.903513, 1.418087, 1.313125, 1, 1, 1, 1, 1,
1.90742, -0.09897909, 1.220462, 1, 1, 1, 1, 1,
1.925448, -0.4198493, 2.568218, 1, 1, 1, 1, 1,
1.969257, -0.1573369, 1.78919, 1, 1, 1, 1, 1,
1.974837, -0.2726385, 2.561764, 1, 1, 1, 1, 1,
1.979948, 1.350819, -0.5482323, 1, 1, 1, 1, 1,
1.987557, -0.768296, 1.323635, 1, 1, 1, 1, 1,
1.988336, -1.343185, 1.64188, 1, 1, 1, 1, 1,
2.000776, 0.9131591, -0.02465734, 1, 1, 1, 1, 1,
2.004429, -0.03607504, 1.415937, 1, 1, 1, 1, 1,
2.010133, 1.238114, -0.1705856, 1, 1, 1, 1, 1,
2.090979, -2.768125, 1.467367, 1, 1, 1, 1, 1,
2.093988, 0.7736679, 1.119349, 0, 0, 1, 1, 1,
2.098025, -1.37801, 1.779231, 1, 0, 0, 1, 1,
2.099832, 0.9707733, 0.6284291, 1, 0, 0, 1, 1,
2.111155, -0.7150133, 0.2916692, 1, 0, 0, 1, 1,
2.170331, 1.505168, 1.408858, 1, 0, 0, 1, 1,
2.273751, -0.3703523, 3.503772, 1, 0, 0, 1, 1,
2.276026, -0.7685528, 1.686114, 0, 0, 0, 1, 1,
2.288827, -0.3945742, 0.8480531, 0, 0, 0, 1, 1,
2.297232, 1.187946, 0.311909, 0, 0, 0, 1, 1,
2.320366, -1.220637, 3.523026, 0, 0, 0, 1, 1,
2.342345, 0.06988592, 2.616504, 0, 0, 0, 1, 1,
2.342566, -0.2788504, 2.34187, 0, 0, 0, 1, 1,
2.346588, -1.173572, 3.402301, 0, 0, 0, 1, 1,
2.402006, -0.4335721, 2.348255, 1, 1, 1, 1, 1,
2.457526, 2.356364, 1.581463, 1, 1, 1, 1, 1,
2.469541, -0.59465, 1.430363, 1, 1, 1, 1, 1,
2.605751, -1.528273, 1.900184, 1, 1, 1, 1, 1,
2.744609, -0.573621, 0.8524382, 1, 1, 1, 1, 1,
2.883413, -0.5941263, 2.018063, 1, 1, 1, 1, 1,
2.970298, -1.212536, 3.805141, 1, 1, 1, 1, 1
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
var radius = 9.958049;
var distance = 34.97723;
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
mvMatrix.translate( 0.3372254, -0.243212, 0.08388782 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.97723);
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
