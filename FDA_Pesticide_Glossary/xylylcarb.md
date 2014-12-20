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
-3.082551, 0.8107374, -1.102451, 1, 0, 0, 1,
-3.052314, -1.919053, -0.9985683, 1, 0.007843138, 0, 1,
-2.979907, 0.972939, -0.6144355, 1, 0.01176471, 0, 1,
-2.898459, -0.1503903, -1.704105, 1, 0.01960784, 0, 1,
-2.705699, 0.2646631, -0.7742144, 1, 0.02352941, 0, 1,
-2.651416, 0.2002292, 1.081244, 1, 0.03137255, 0, 1,
-2.579058, 2.084265, 0.6569693, 1, 0.03529412, 0, 1,
-2.476503, -1.133117, -2.916803, 1, 0.04313726, 0, 1,
-2.451408, -0.1158952, -2.987964, 1, 0.04705882, 0, 1,
-2.412084, -1.286815, -1.965509, 1, 0.05490196, 0, 1,
-2.411248, -0.4200974, -1.430282, 1, 0.05882353, 0, 1,
-2.371584, -0.4053836, -2.130229, 1, 0.06666667, 0, 1,
-2.328472, -0.3894062, -1.186541, 1, 0.07058824, 0, 1,
-2.327374, -0.4085637, -0.8715185, 1, 0.07843138, 0, 1,
-2.297492, 0.2597153, -2.284445, 1, 0.08235294, 0, 1,
-2.255884, -0.7546915, -1.726823, 1, 0.09019608, 0, 1,
-2.221865, -0.1619798, -1.108283, 1, 0.09411765, 0, 1,
-2.196585, 0.853837, -0.9320254, 1, 0.1019608, 0, 1,
-2.129862, -0.3864245, -2.165281, 1, 0.1098039, 0, 1,
-2.120833, 0.3786491, -0.6628237, 1, 0.1137255, 0, 1,
-2.10429, -0.26004, -0.03276547, 1, 0.1215686, 0, 1,
-2.09155, -0.8705279, -1.607137, 1, 0.1254902, 0, 1,
-2.089825, -0.07696398, -1.595691, 1, 0.1333333, 0, 1,
-2.086254, -0.2766062, -1.536891, 1, 0.1372549, 0, 1,
-2.058026, 0.2296067, -0.242414, 1, 0.145098, 0, 1,
-2.022308, 0.704363, -1.145274, 1, 0.1490196, 0, 1,
-2.011856, 0.7331229, -0.1145223, 1, 0.1568628, 0, 1,
-2.003611, 1.288558, -0.9222617, 1, 0.1607843, 0, 1,
-1.981721, 1.845029, -1.604377, 1, 0.1686275, 0, 1,
-1.961764, -0.6791803, -3.462063, 1, 0.172549, 0, 1,
-1.933618, 1.142099, -2.40644, 1, 0.1803922, 0, 1,
-1.933439, -0.7557316, -1.692308, 1, 0.1843137, 0, 1,
-1.922116, -1.161474, -2.040146, 1, 0.1921569, 0, 1,
-1.883909, -0.7665026, -1.761288, 1, 0.1960784, 0, 1,
-1.873621, 0.3218637, -2.503352, 1, 0.2039216, 0, 1,
-1.856327, -0.5202722, -2.908144, 1, 0.2117647, 0, 1,
-1.852265, -0.3356003, -1.154704, 1, 0.2156863, 0, 1,
-1.841629, -0.1553178, -1.694546, 1, 0.2235294, 0, 1,
-1.839432, 1.061894, -1.156802, 1, 0.227451, 0, 1,
-1.801248, 0.4006259, -1.271596, 1, 0.2352941, 0, 1,
-1.79732, 0.1805837, -1.563463, 1, 0.2392157, 0, 1,
-1.794973, 0.1300578, -1.330292, 1, 0.2470588, 0, 1,
-1.764018, -0.06089652, -1.336414, 1, 0.2509804, 0, 1,
-1.755184, 0.1809796, -0.8033018, 1, 0.2588235, 0, 1,
-1.752656, -0.8805164, -3.415384, 1, 0.2627451, 0, 1,
-1.733047, -1.008105, -2.710514, 1, 0.2705882, 0, 1,
-1.715494, 1.924162, -0.6757098, 1, 0.2745098, 0, 1,
-1.709075, 0.3961627, -1.562265, 1, 0.282353, 0, 1,
-1.697989, 1.315038, -1.761825, 1, 0.2862745, 0, 1,
-1.694723, 0.80752, -0.954837, 1, 0.2941177, 0, 1,
-1.694, -1.477206, -2.008145, 1, 0.3019608, 0, 1,
-1.692565, -0.23054, -0.1729349, 1, 0.3058824, 0, 1,
-1.657308, 1.639572, -0.8882764, 1, 0.3137255, 0, 1,
-1.626656, -0.3302251, -3.005495, 1, 0.3176471, 0, 1,
-1.620944, -1.147118, -2.211989, 1, 0.3254902, 0, 1,
-1.615112, -2.451115, -0.501202, 1, 0.3294118, 0, 1,
-1.611701, -1.29671, -3.414507, 1, 0.3372549, 0, 1,
-1.609203, -0.3164544, -1.927316, 1, 0.3411765, 0, 1,
-1.599468, 0.3134555, -2.210656, 1, 0.3490196, 0, 1,
-1.578673, 0.8676363, -2.927154, 1, 0.3529412, 0, 1,
-1.571633, 1.60544, -0.670222, 1, 0.3607843, 0, 1,
-1.570625, -0.4061402, -2.275152, 1, 0.3647059, 0, 1,
-1.568324, -0.6690622, -1.084917, 1, 0.372549, 0, 1,
-1.554664, -0.52044, -0.5641858, 1, 0.3764706, 0, 1,
-1.544393, 2.239439, 1.053414, 1, 0.3843137, 0, 1,
-1.54222, 1.267539, 0.1729601, 1, 0.3882353, 0, 1,
-1.533201, 0.8888956, -2.876211, 1, 0.3960784, 0, 1,
-1.531498, 0.3698106, -3.11475, 1, 0.4039216, 0, 1,
-1.519168, -0.6615938, -1.345502, 1, 0.4078431, 0, 1,
-1.510941, -1.109315, -1.686267, 1, 0.4156863, 0, 1,
-1.504684, -1.066604, -2.483978, 1, 0.4196078, 0, 1,
-1.502721, 0.281113, -1.567459, 1, 0.427451, 0, 1,
-1.483409, 1.071674, -0.1476221, 1, 0.4313726, 0, 1,
-1.463911, -0.06316599, -1.938125, 1, 0.4392157, 0, 1,
-1.463376, 0.2578698, -1.358749, 1, 0.4431373, 0, 1,
-1.450732, 0.6647344, -1.01045, 1, 0.4509804, 0, 1,
-1.447882, 1.661269, 0.2484211, 1, 0.454902, 0, 1,
-1.440688, 1.271646, -2.243087, 1, 0.4627451, 0, 1,
-1.437436, 1.812012, -1.146717, 1, 0.4666667, 0, 1,
-1.435543, -0.3125013, -3.806976, 1, 0.4745098, 0, 1,
-1.431043, -2.002998, -0.8816383, 1, 0.4784314, 0, 1,
-1.430844, 1.207124, -0.5626716, 1, 0.4862745, 0, 1,
-1.430328, -0.05596856, -2.882826, 1, 0.4901961, 0, 1,
-1.42406, 1.040289, -1.391706, 1, 0.4980392, 0, 1,
-1.420248, 0.1743822, -1.055443, 1, 0.5058824, 0, 1,
-1.415837, -0.09872039, -0.9109296, 1, 0.509804, 0, 1,
-1.39728, -0.473459, -1.995309, 1, 0.5176471, 0, 1,
-1.386119, 0.5530644, -0.2226203, 1, 0.5215687, 0, 1,
-1.38197, -0.9458171, -2.753845, 1, 0.5294118, 0, 1,
-1.381224, -0.1641825, -2.249681, 1, 0.5333334, 0, 1,
-1.378512, 0.3462727, -1.649062, 1, 0.5411765, 0, 1,
-1.373172, 0.6013448, -0.5659854, 1, 0.5450981, 0, 1,
-1.367731, -0.7552643, -1.145551, 1, 0.5529412, 0, 1,
-1.364417, -1.231814, -1.64037, 1, 0.5568628, 0, 1,
-1.359168, 1.076626, -0.8210068, 1, 0.5647059, 0, 1,
-1.358878, 0.1294006, -0.7949775, 1, 0.5686275, 0, 1,
-1.351583, -1.556723, -2.877486, 1, 0.5764706, 0, 1,
-1.335719, 1.143549, -0.4372357, 1, 0.5803922, 0, 1,
-1.333114, -0.9109523, -2.028037, 1, 0.5882353, 0, 1,
-1.323163, -0.3366609, -1.703859, 1, 0.5921569, 0, 1,
-1.320999, -0.6074594, -2.104355, 1, 0.6, 0, 1,
-1.319195, -0.5479909, -2.366093, 1, 0.6078432, 0, 1,
-1.296619, -0.1590203, -1.530602, 1, 0.6117647, 0, 1,
-1.294066, 0.4382796, -2.80455, 1, 0.6196079, 0, 1,
-1.287673, -0.9132633, -2.382683, 1, 0.6235294, 0, 1,
-1.284561, -0.9797881, -2.585219, 1, 0.6313726, 0, 1,
-1.274629, -0.04927269, -1.657489, 1, 0.6352941, 0, 1,
-1.273093, 0.9505374, 0.03136522, 1, 0.6431373, 0, 1,
-1.269199, 1.343172, -0.6120716, 1, 0.6470588, 0, 1,
-1.25769, 1.227955, -1.950443, 1, 0.654902, 0, 1,
-1.25665, 0.4060745, -2.216197, 1, 0.6588235, 0, 1,
-1.255869, -1.115725, -1.15468, 1, 0.6666667, 0, 1,
-1.246636, -1.228045, -2.224328, 1, 0.6705883, 0, 1,
-1.24288, -0.6371413, -2.871854, 1, 0.6784314, 0, 1,
-1.237681, -1.13367, -1.799447, 1, 0.682353, 0, 1,
-1.223555, 0.5145001, -1.927385, 1, 0.6901961, 0, 1,
-1.22102, -2.548916, -3.961802, 1, 0.6941177, 0, 1,
-1.214814, -0.4241376, -0.8429266, 1, 0.7019608, 0, 1,
-1.196423, -0.5688722, -1.435301, 1, 0.7098039, 0, 1,
-1.182393, -0.2975106, -1.660782, 1, 0.7137255, 0, 1,
-1.165149, -1.467322, -2.23647, 1, 0.7215686, 0, 1,
-1.161508, -0.4210424, -2.311426, 1, 0.7254902, 0, 1,
-1.161233, -0.6834371, -0.8350328, 1, 0.7333333, 0, 1,
-1.152306, -0.8842109, -3.028493, 1, 0.7372549, 0, 1,
-1.149128, 0.9440328, -2.816716, 1, 0.7450981, 0, 1,
-1.14013, 1.373015, 0.2931311, 1, 0.7490196, 0, 1,
-1.139779, 0.534472, -0.105507, 1, 0.7568628, 0, 1,
-1.138945, -1.770567, -4.33386, 1, 0.7607843, 0, 1,
-1.135905, 1.139527, -1.461537, 1, 0.7686275, 0, 1,
-1.135086, 0.4711503, -1.087523, 1, 0.772549, 0, 1,
-1.131558, -2.026368, -2.671024, 1, 0.7803922, 0, 1,
-1.124977, -0.121963, -2.751371, 1, 0.7843137, 0, 1,
-1.123765, -0.7594095, -1.422906, 1, 0.7921569, 0, 1,
-1.121646, 0.2769727, -2.008897, 1, 0.7960784, 0, 1,
-1.11982, 0.6470629, -0.4795893, 1, 0.8039216, 0, 1,
-1.110279, 2.089314, -0.6268301, 1, 0.8117647, 0, 1,
-1.084017, -1.036783, -4.21957, 1, 0.8156863, 0, 1,
-1.076668, -0.2948692, -3.863894, 1, 0.8235294, 0, 1,
-1.071225, -1.462776, -2.993835, 1, 0.827451, 0, 1,
-1.071051, 0.4473864, -1.190599, 1, 0.8352941, 0, 1,
-1.070189, -0.6266878, -1.251152, 1, 0.8392157, 0, 1,
-1.066885, 0.3828846, -1.962536, 1, 0.8470588, 0, 1,
-1.062204, -0.2013682, -1.094708, 1, 0.8509804, 0, 1,
-1.051946, -0.01068232, -2.01553, 1, 0.8588235, 0, 1,
-1.050761, 2.027187, -1.773805, 1, 0.8627451, 0, 1,
-1.048005, 0.06068206, -2.167297, 1, 0.8705882, 0, 1,
-1.037781, -1.190485, -4.406844, 1, 0.8745098, 0, 1,
-1.029364, 1.288059, -2.267762, 1, 0.8823529, 0, 1,
-1.022171, 0.4883046, -1.401266, 1, 0.8862745, 0, 1,
-1.010572, -0.01213637, -1.733329, 1, 0.8941177, 0, 1,
-1.007531, -0.4153699, -1.526655, 1, 0.8980392, 0, 1,
-1.006294, 0.6140007, -3.55478, 1, 0.9058824, 0, 1,
-1.004844, 2.038062, -1.518316, 1, 0.9137255, 0, 1,
-1.003174, -0.325069, -1.871, 1, 0.9176471, 0, 1,
-0.9997337, -0.09722366, -1.005335, 1, 0.9254902, 0, 1,
-0.9980006, -0.4708443, -1.876127, 1, 0.9294118, 0, 1,
-0.9952812, 1.575305, -1.260532, 1, 0.9372549, 0, 1,
-0.994603, 0.5120348, -0.8422298, 1, 0.9411765, 0, 1,
-0.9846122, 0.3467012, 0.3674059, 1, 0.9490196, 0, 1,
-0.9827734, 2.544114, 0.9572443, 1, 0.9529412, 0, 1,
-0.9811049, 2.638478, -1.390043, 1, 0.9607843, 0, 1,
-0.9802786, -0.5490903, -2.116104, 1, 0.9647059, 0, 1,
-0.9759141, 1.917347, -0.2561324, 1, 0.972549, 0, 1,
-0.9755927, 1.301241, -2.062936, 1, 0.9764706, 0, 1,
-0.9712548, 0.2821359, -1.466351, 1, 0.9843137, 0, 1,
-0.9705838, 0.5258797, -1.546368, 1, 0.9882353, 0, 1,
-0.9641595, -0.2714352, -2.989014, 1, 0.9960784, 0, 1,
-0.9620807, -0.3503152, -1.711626, 0.9960784, 1, 0, 1,
-0.9591205, -0.01559687, -1.904471, 0.9921569, 1, 0, 1,
-0.9583127, -1.515452, -1.753261, 0.9843137, 1, 0, 1,
-0.9559198, -0.2628032, -2.651135, 0.9803922, 1, 0, 1,
-0.9509714, 0.3507847, -1.112216, 0.972549, 1, 0, 1,
-0.9427887, -0.6079324, -1.244524, 0.9686275, 1, 0, 1,
-0.9364485, 0.8676003, -0.8106616, 0.9607843, 1, 0, 1,
-0.934819, -0.1136689, -3.218459, 0.9568627, 1, 0, 1,
-0.9347866, -0.5799859, -2.428961, 0.9490196, 1, 0, 1,
-0.9303628, 0.5318031, 0.7708245, 0.945098, 1, 0, 1,
-0.9294942, 0.005765826, -2.85073, 0.9372549, 1, 0, 1,
-0.9255561, 0.6759728, 0.8395472, 0.9333333, 1, 0, 1,
-0.9208468, 2.02944, 0.3604715, 0.9254902, 1, 0, 1,
-0.9197907, -0.3752103, -1.541929, 0.9215686, 1, 0, 1,
-0.9190972, -0.1509699, -2.065499, 0.9137255, 1, 0, 1,
-0.9190843, 0.08846819, -2.616341, 0.9098039, 1, 0, 1,
-0.917437, 0.2074744, -0.7336249, 0.9019608, 1, 0, 1,
-0.9129249, -1.100996, -3.410231, 0.8941177, 1, 0, 1,
-0.9078696, -1.332927, -2.594069, 0.8901961, 1, 0, 1,
-0.9027228, 2.217402, -0.6089035, 0.8823529, 1, 0, 1,
-0.8969709, -0.03015918, -3.289763, 0.8784314, 1, 0, 1,
-0.8956933, 0.6054121, -2.327307, 0.8705882, 1, 0, 1,
-0.8863177, 2.283341, -0.1963281, 0.8666667, 1, 0, 1,
-0.8813774, 1.615023, 1.381196, 0.8588235, 1, 0, 1,
-0.8764259, 0.8671775, -0.5803919, 0.854902, 1, 0, 1,
-0.8740571, -0.6261385, -0.9144571, 0.8470588, 1, 0, 1,
-0.8732501, 2.808918, -0.7977481, 0.8431373, 1, 0, 1,
-0.8727777, 0.05589006, -2.646034, 0.8352941, 1, 0, 1,
-0.8698119, -0.5211108, -0.315213, 0.8313726, 1, 0, 1,
-0.8628057, -0.7681434, -1.443856, 0.8235294, 1, 0, 1,
-0.8587042, -0.3216671, -0.5469311, 0.8196079, 1, 0, 1,
-0.8580966, 0.4753148, -2.479084, 0.8117647, 1, 0, 1,
-0.8578303, 0.9336121, -1.732911, 0.8078431, 1, 0, 1,
-0.8528326, -1.450888, -2.005941, 0.8, 1, 0, 1,
-0.8518788, -0.8755029, -1.891798, 0.7921569, 1, 0, 1,
-0.8505614, -0.2685796, -2.888227, 0.7882353, 1, 0, 1,
-0.8462769, 0.6365964, -0.4152064, 0.7803922, 1, 0, 1,
-0.8457909, -0.460622, -2.643242, 0.7764706, 1, 0, 1,
-0.8450409, -0.4799851, -2.067506, 0.7686275, 1, 0, 1,
-0.843067, 0.2970217, -0.6856918, 0.7647059, 1, 0, 1,
-0.836855, 0.311974, -0.9947885, 0.7568628, 1, 0, 1,
-0.8357771, 0.9477597, -2.620622, 0.7529412, 1, 0, 1,
-0.8318729, -0.9957061, -1.726661, 0.7450981, 1, 0, 1,
-0.8296801, -0.2897746, -2.21523, 0.7411765, 1, 0, 1,
-0.8237948, -0.9848983, -2.860137, 0.7333333, 1, 0, 1,
-0.8213977, -0.6684682, -2.027215, 0.7294118, 1, 0, 1,
-0.8165646, -0.6497314, -1.746004, 0.7215686, 1, 0, 1,
-0.8133451, 1.085511, -2.152246, 0.7176471, 1, 0, 1,
-0.8093883, 0.5252258, -0.5211598, 0.7098039, 1, 0, 1,
-0.8021066, 0.4190884, -1.275272, 0.7058824, 1, 0, 1,
-0.7931405, 0.2547903, -0.7383715, 0.6980392, 1, 0, 1,
-0.789959, -1.173106, -1.782764, 0.6901961, 1, 0, 1,
-0.7892472, 1.295231, 0.34441, 0.6862745, 1, 0, 1,
-0.784541, -0.3046517, -3.971247, 0.6784314, 1, 0, 1,
-0.7817068, 1.547783, 0.5394475, 0.6745098, 1, 0, 1,
-0.7816361, 1.323884, -0.6306598, 0.6666667, 1, 0, 1,
-0.7814541, -1.342431, -6.64636, 0.6627451, 1, 0, 1,
-0.7798191, 0.2608047, -1.995723, 0.654902, 1, 0, 1,
-0.7767119, -0.56337, -2.044052, 0.6509804, 1, 0, 1,
-0.7755643, 1.304629, -0.09600643, 0.6431373, 1, 0, 1,
-0.7752724, 0.1808202, -2.409087, 0.6392157, 1, 0, 1,
-0.7735031, -0.9574837, -3.992965, 0.6313726, 1, 0, 1,
-0.7731594, -0.01908355, 0.455952, 0.627451, 1, 0, 1,
-0.7692038, -0.4731422, -2.135497, 0.6196079, 1, 0, 1,
-0.767566, 1.410957, 0.7382877, 0.6156863, 1, 0, 1,
-0.7656688, -0.7431723, -2.144222, 0.6078432, 1, 0, 1,
-0.7512255, 0.7836131, 0.3254165, 0.6039216, 1, 0, 1,
-0.7511445, 0.7091888, -2.269122, 0.5960785, 1, 0, 1,
-0.750213, 0.9041411, -0.4503419, 0.5882353, 1, 0, 1,
-0.7487463, 0.6047634, -0.8951561, 0.5843138, 1, 0, 1,
-0.7478946, -0.799944, -3.906065, 0.5764706, 1, 0, 1,
-0.7459568, -1.108388, -1.177416, 0.572549, 1, 0, 1,
-0.7386252, 1.140316, -3.599257, 0.5647059, 1, 0, 1,
-0.7349545, -0.9009802, -1.773593, 0.5607843, 1, 0, 1,
-0.7348932, 0.2052031, 1.571043, 0.5529412, 1, 0, 1,
-0.7291896, -0.06920733, -2.623848, 0.5490196, 1, 0, 1,
-0.725206, -0.4958336, -2.066325, 0.5411765, 1, 0, 1,
-0.7248875, 1.43948, -0.2948667, 0.5372549, 1, 0, 1,
-0.7203154, -0.5729635, -0.4777839, 0.5294118, 1, 0, 1,
-0.7178822, -0.03424806, 0.5653217, 0.5254902, 1, 0, 1,
-0.7160081, -0.08936714, -2.013384, 0.5176471, 1, 0, 1,
-0.711611, -1.385163, -2.417321, 0.5137255, 1, 0, 1,
-0.7092618, 0.8322068, -2.037012, 0.5058824, 1, 0, 1,
-0.7064403, -1.304471, -1.268851, 0.5019608, 1, 0, 1,
-0.7057487, 0.8551546, -0.5879595, 0.4941176, 1, 0, 1,
-0.7012565, 1.04375, -0.691852, 0.4862745, 1, 0, 1,
-0.6998017, 0.9510486, -0.9733259, 0.4823529, 1, 0, 1,
-0.6942939, 0.9676172, -1.803199, 0.4745098, 1, 0, 1,
-0.6938754, -1.671348, -1.992758, 0.4705882, 1, 0, 1,
-0.6936678, 0.6147187, -1.040151, 0.4627451, 1, 0, 1,
-0.6918297, 0.2425532, -2.034611, 0.4588235, 1, 0, 1,
-0.6907128, -0.2558826, -2.007543, 0.4509804, 1, 0, 1,
-0.6897464, 0.224113, -1.934737, 0.4470588, 1, 0, 1,
-0.6885092, 0.2660624, -1.375816, 0.4392157, 1, 0, 1,
-0.688078, 0.05883008, -0.3493922, 0.4352941, 1, 0, 1,
-0.6837643, 0.3319643, -0.3391568, 0.427451, 1, 0, 1,
-0.677958, -0.4482866, -2.702568, 0.4235294, 1, 0, 1,
-0.6727865, 0.9275327, 1.346121, 0.4156863, 1, 0, 1,
-0.670225, -1.46279, -3.318604, 0.4117647, 1, 0, 1,
-0.6701527, -0.6052334, -1.486738, 0.4039216, 1, 0, 1,
-0.6690726, -1.453886, -2.582994, 0.3960784, 1, 0, 1,
-0.6656206, -0.1999501, -3.274689, 0.3921569, 1, 0, 1,
-0.6653204, 0.07987472, -2.084407, 0.3843137, 1, 0, 1,
-0.6637731, -0.4549928, -2.113569, 0.3803922, 1, 0, 1,
-0.6619333, 0.9605358, 0.3620523, 0.372549, 1, 0, 1,
-0.6550282, -0.2266385, -3.200035, 0.3686275, 1, 0, 1,
-0.6529456, -0.8387016, -3.397305, 0.3607843, 1, 0, 1,
-0.6483883, -0.1132177, -2.094102, 0.3568628, 1, 0, 1,
-0.6432212, 0.5216422, 1.024582, 0.3490196, 1, 0, 1,
-0.6391651, 0.2816835, -1.246876, 0.345098, 1, 0, 1,
-0.6351014, -0.004634258, -1.944441, 0.3372549, 1, 0, 1,
-0.6324804, -0.5202251, -3.144452, 0.3333333, 1, 0, 1,
-0.6277698, -0.7180627, -1.095724, 0.3254902, 1, 0, 1,
-0.6246798, 0.05523274, -0.5679103, 0.3215686, 1, 0, 1,
-0.624204, 1.444138, -0.07356373, 0.3137255, 1, 0, 1,
-0.6200994, -1.362326, -2.79239, 0.3098039, 1, 0, 1,
-0.6143451, 1.223077, -0.7400429, 0.3019608, 1, 0, 1,
-0.6070587, -0.9382464, -3.059465, 0.2941177, 1, 0, 1,
-0.60655, 0.6680121, -0.8457271, 0.2901961, 1, 0, 1,
-0.6053363, 0.5299198, -0.488155, 0.282353, 1, 0, 1,
-0.6047801, 2.321485, -0.3309326, 0.2784314, 1, 0, 1,
-0.602459, -0.9884214, -2.634259, 0.2705882, 1, 0, 1,
-0.5996421, 0.8745567, 0.1846612, 0.2666667, 1, 0, 1,
-0.5994314, -1.167851, -1.079548, 0.2588235, 1, 0, 1,
-0.5978751, -0.6439499, -3.073965, 0.254902, 1, 0, 1,
-0.5970009, -1.264861, -2.114482, 0.2470588, 1, 0, 1,
-0.5865745, -1.184661, -0.7656925, 0.2431373, 1, 0, 1,
-0.5842156, -2.022419, -1.546618, 0.2352941, 1, 0, 1,
-0.5832337, -1.013638, -3.925985, 0.2313726, 1, 0, 1,
-0.5828888, 0.3448675, -1.084932, 0.2235294, 1, 0, 1,
-0.5808696, 0.2172453, -1.853086, 0.2196078, 1, 0, 1,
-0.5807233, 0.7310296, -2.1031, 0.2117647, 1, 0, 1,
-0.5799605, -0.2056337, -1.556298, 0.2078431, 1, 0, 1,
-0.5760765, 0.5263326, -1.069303, 0.2, 1, 0, 1,
-0.5718879, 0.3974451, 0.4867165, 0.1921569, 1, 0, 1,
-0.5712627, 0.3365318, -0.7949476, 0.1882353, 1, 0, 1,
-0.5669622, 0.3023809, -2.560139, 0.1803922, 1, 0, 1,
-0.564073, 0.9101415, 0.2035801, 0.1764706, 1, 0, 1,
-0.5621226, 2.008713, 1.268102, 0.1686275, 1, 0, 1,
-0.5607418, 0.9492284, -0.5540631, 0.1647059, 1, 0, 1,
-0.5606027, 0.1398479, -0.7360235, 0.1568628, 1, 0, 1,
-0.5582838, -0.2105257, -1.861418, 0.1529412, 1, 0, 1,
-0.5540651, -1.05883, -4.224904, 0.145098, 1, 0, 1,
-0.5524351, 1.485217, -0.07327133, 0.1411765, 1, 0, 1,
-0.5515216, -0.2071, -2.113331, 0.1333333, 1, 0, 1,
-0.5511198, 0.3518718, 0.279359, 0.1294118, 1, 0, 1,
-0.5505252, -1.411869, -2.61642, 0.1215686, 1, 0, 1,
-0.5497149, 0.3339979, 0.1493139, 0.1176471, 1, 0, 1,
-0.5385857, -0.432409, -1.530589, 0.1098039, 1, 0, 1,
-0.5378727, -1.267167, -2.877473, 0.1058824, 1, 0, 1,
-0.5314049, -0.06800018, -1.947466, 0.09803922, 1, 0, 1,
-0.5302159, -1.457641, -0.102983, 0.09019608, 1, 0, 1,
-0.5302112, -1.035646, -3.757199, 0.08627451, 1, 0, 1,
-0.5260078, 0.172139, -1.753749, 0.07843138, 1, 0, 1,
-0.5259129, 0.1710068, -0.002190522, 0.07450981, 1, 0, 1,
-0.5187861, 0.1279086, -1.824273, 0.06666667, 1, 0, 1,
-0.5162981, -0.04554017, -1.796021, 0.0627451, 1, 0, 1,
-0.5061061, 0.48709, -0.8506306, 0.05490196, 1, 0, 1,
-0.5036578, 0.02963154, -2.697797, 0.05098039, 1, 0, 1,
-0.5030233, 0.8027157, -1.369476, 0.04313726, 1, 0, 1,
-0.4966073, 0.1194759, -3.245161, 0.03921569, 1, 0, 1,
-0.4951077, 0.2516752, -2.375536, 0.03137255, 1, 0, 1,
-0.4926076, 1.731459, -0.95164, 0.02745098, 1, 0, 1,
-0.4880701, -0.2621635, -4.375661, 0.01960784, 1, 0, 1,
-0.4877401, 0.007277483, -1.163154, 0.01568628, 1, 0, 1,
-0.4873456, -0.02868385, -1.996265, 0.007843138, 1, 0, 1,
-0.4864329, 0.3445523, -1.815354, 0.003921569, 1, 0, 1,
-0.4856613, 0.5177076, -1.528756, 0, 1, 0.003921569, 1,
-0.4854405, 0.7833579, -0.7983939, 0, 1, 0.01176471, 1,
-0.4822901, -1.389204, -1.88291, 0, 1, 0.01568628, 1,
-0.4799321, 2.015595, -1.651195, 0, 1, 0.02352941, 1,
-0.4767388, 0.7316605, -0.3770642, 0, 1, 0.02745098, 1,
-0.4762289, 0.4723073, -0.7163764, 0, 1, 0.03529412, 1,
-0.4739559, -0.9470028, -3.593284, 0, 1, 0.03921569, 1,
-0.4718465, -0.2605724, -1.200329, 0, 1, 0.04705882, 1,
-0.4653012, -0.05961786, -2.20494, 0, 1, 0.05098039, 1,
-0.4621246, -1.786851, -2.743627, 0, 1, 0.05882353, 1,
-0.4561329, -1.120738, -4.124466, 0, 1, 0.0627451, 1,
-0.4529454, 0.5585232, -2.229937, 0, 1, 0.07058824, 1,
-0.4503397, 0.8161557, 0.2395585, 0, 1, 0.07450981, 1,
-0.4500361, 0.38635, -1.392582, 0, 1, 0.08235294, 1,
-0.4429432, -1.391351, -4.239063, 0, 1, 0.08627451, 1,
-0.4422331, -0.3130353, -0.4335833, 0, 1, 0.09411765, 1,
-0.4420883, -0.06755619, -2.016911, 0, 1, 0.1019608, 1,
-0.4411957, 1.076625, -0.6234489, 0, 1, 0.1058824, 1,
-0.4403399, 0.6784642, 0.226696, 0, 1, 0.1137255, 1,
-0.4335872, -0.3163483, -1.495938, 0, 1, 0.1176471, 1,
-0.4286552, -0.3183259, -3.090379, 0, 1, 0.1254902, 1,
-0.422976, 1.824263, -0.9726747, 0, 1, 0.1294118, 1,
-0.4146657, -0.1918838, -0.9863787, 0, 1, 0.1372549, 1,
-0.4136287, -0.8903057, -1.956757, 0, 1, 0.1411765, 1,
-0.409996, -0.7062925, -1.969506, 0, 1, 0.1490196, 1,
-0.4088414, -0.07233766, -1.131687, 0, 1, 0.1529412, 1,
-0.4088059, -0.7185026, -1.729802, 0, 1, 0.1607843, 1,
-0.4068713, 0.9873487, 1.230465, 0, 1, 0.1647059, 1,
-0.4063144, -1.038787, -2.401744, 0, 1, 0.172549, 1,
-0.4040684, 1.281955, 0.7769142, 0, 1, 0.1764706, 1,
-0.3909948, -0.5620404, -1.304053, 0, 1, 0.1843137, 1,
-0.3784218, 1.741046, -0.1643555, 0, 1, 0.1882353, 1,
-0.3758848, -0.1927342, -1.663654, 0, 1, 0.1960784, 1,
-0.3695942, -0.9741753, -3.480751, 0, 1, 0.2039216, 1,
-0.3678956, -0.9998019, -2.171334, 0, 1, 0.2078431, 1,
-0.3641858, 0.7030119, 1.000691, 0, 1, 0.2156863, 1,
-0.36103, 0.5123089, 1.313509, 0, 1, 0.2196078, 1,
-0.3584784, 2.232573, 0.3090679, 0, 1, 0.227451, 1,
-0.3575391, -0.1456598, -2.326723, 0, 1, 0.2313726, 1,
-0.3514885, 0.50261, -0.7562742, 0, 1, 0.2392157, 1,
-0.3497092, -0.6372581, -3.410856, 0, 1, 0.2431373, 1,
-0.3483853, -0.7523873, -5.288465, 0, 1, 0.2509804, 1,
-0.3469526, 0.4170471, -0.7598817, 0, 1, 0.254902, 1,
-0.3450811, -1.500309, -3.958493, 0, 1, 0.2627451, 1,
-0.3441315, 0.1522834, -1.727364, 0, 1, 0.2666667, 1,
-0.3404186, -0.1766203, -1.770909, 0, 1, 0.2745098, 1,
-0.3393176, -1.231328, -2.396592, 0, 1, 0.2784314, 1,
-0.3376978, 0.6305246, -0.5213408, 0, 1, 0.2862745, 1,
-0.3341943, 0.7179002, -1.435845, 0, 1, 0.2901961, 1,
-0.3308451, -1.678123, -3.764734, 0, 1, 0.2980392, 1,
-0.3306281, 1.219603, 0.6446984, 0, 1, 0.3058824, 1,
-0.3282976, -0.7371834, -3.451918, 0, 1, 0.3098039, 1,
-0.3280285, 0.6665953, -2.142739, 0, 1, 0.3176471, 1,
-0.3272803, 0.07071247, -1.759867, 0, 1, 0.3215686, 1,
-0.3247508, 0.9982303, -0.5345793, 0, 1, 0.3294118, 1,
-0.3241551, -0.1524718, -2.121412, 0, 1, 0.3333333, 1,
-0.3234665, -1.13036, -4.794132, 0, 1, 0.3411765, 1,
-0.3224067, -0.5457942, -4.619322, 0, 1, 0.345098, 1,
-0.3211603, -0.2646284, -2.731587, 0, 1, 0.3529412, 1,
-0.3161444, 0.5473835, 0.1385928, 0, 1, 0.3568628, 1,
-0.3151949, 1.225905, 1.644634, 0, 1, 0.3647059, 1,
-0.3134819, -0.3194288, -2.621452, 0, 1, 0.3686275, 1,
-0.3128825, -1.031653, -5.210322, 0, 1, 0.3764706, 1,
-0.3121348, -0.3202947, -1.965611, 0, 1, 0.3803922, 1,
-0.3119482, -0.9978942, -2.537181, 0, 1, 0.3882353, 1,
-0.3101317, -0.6442453, -3.908912, 0, 1, 0.3921569, 1,
-0.3062971, 0.7630674, 0.9991933, 0, 1, 0.4, 1,
-0.3047084, 0.6193255, -0.07215338, 0, 1, 0.4078431, 1,
-0.3045404, -0.1925164, -3.192804, 0, 1, 0.4117647, 1,
-0.3006396, -0.5410228, -3.248493, 0, 1, 0.4196078, 1,
-0.2922463, -0.5997343, -1.327057, 0, 1, 0.4235294, 1,
-0.2909866, -1.361706, -3.516566, 0, 1, 0.4313726, 1,
-0.2898546, -1.754809, -2.764385, 0, 1, 0.4352941, 1,
-0.2877375, -0.8536553, -2.609121, 0, 1, 0.4431373, 1,
-0.2806536, 0.007701739, -2.22103, 0, 1, 0.4470588, 1,
-0.270373, 1.579845, 0.4237103, 0, 1, 0.454902, 1,
-0.2629912, 0.6930825, 0.1994614, 0, 1, 0.4588235, 1,
-0.2622561, -0.0196751, -0.2938683, 0, 1, 0.4666667, 1,
-0.2619973, -0.6947644, -1.956516, 0, 1, 0.4705882, 1,
-0.2565724, -0.09756714, -1.903465, 0, 1, 0.4784314, 1,
-0.2521689, 0.3124447, -1.232187, 0, 1, 0.4823529, 1,
-0.2500692, 0.1211133, -1.263425, 0, 1, 0.4901961, 1,
-0.2487752, -0.9499443, -1.701721, 0, 1, 0.4941176, 1,
-0.2457097, -0.4338221, -2.593325, 0, 1, 0.5019608, 1,
-0.2411202, -0.8723727, -2.210024, 0, 1, 0.509804, 1,
-0.2385366, 0.7597669, 0.9395974, 0, 1, 0.5137255, 1,
-0.2369196, -0.1413451, -2.817319, 0, 1, 0.5215687, 1,
-0.2334301, 0.7002446, -1.645817, 0, 1, 0.5254902, 1,
-0.2326068, 1.148311, -1.683313, 0, 1, 0.5333334, 1,
-0.2188111, -0.6119794, -3.159503, 0, 1, 0.5372549, 1,
-0.211303, 2.252752, 0.5509229, 0, 1, 0.5450981, 1,
-0.21053, 0.3163043, -0.8508619, 0, 1, 0.5490196, 1,
-0.2057629, 0.889644, -2.262055, 0, 1, 0.5568628, 1,
-0.2052949, -0.9106754, -4.064643, 0, 1, 0.5607843, 1,
-0.1996201, 0.5775483, -0.3797189, 0, 1, 0.5686275, 1,
-0.1953767, 1.798673, 1.59475, 0, 1, 0.572549, 1,
-0.1942342, -2.033544, -2.49046, 0, 1, 0.5803922, 1,
-0.1938822, -0.3896426, -3.229916, 0, 1, 0.5843138, 1,
-0.1913532, -0.9619455, -2.274954, 0, 1, 0.5921569, 1,
-0.180642, -0.7949224, -4.617904, 0, 1, 0.5960785, 1,
-0.1804538, -0.05055426, -1.733753, 0, 1, 0.6039216, 1,
-0.1793518, -0.9893485, -1.333186, 0, 1, 0.6117647, 1,
-0.1744682, -0.8508836, -2.206179, 0, 1, 0.6156863, 1,
-0.1735287, -1.39013, -5.16131, 0, 1, 0.6235294, 1,
-0.17241, 1.064441, -1.694205, 0, 1, 0.627451, 1,
-0.1698622, 1.377992, 0.4311848, 0, 1, 0.6352941, 1,
-0.1669258, -1.53536, -2.011512, 0, 1, 0.6392157, 1,
-0.1666515, 0.8503599, -1.461989, 0, 1, 0.6470588, 1,
-0.1644777, 0.8024482, -2.637812, 0, 1, 0.6509804, 1,
-0.1632969, -0.7540329, -3.528148, 0, 1, 0.6588235, 1,
-0.1555736, -0.7855444, -3.577104, 0, 1, 0.6627451, 1,
-0.1519553, 0.5981009, -1.43537, 0, 1, 0.6705883, 1,
-0.1508816, 0.06135628, -2.484708, 0, 1, 0.6745098, 1,
-0.1498241, -1.404875, -4.993026, 0, 1, 0.682353, 1,
-0.1461483, -0.8656623, -3.869708, 0, 1, 0.6862745, 1,
-0.1456947, -1.858964, -3.11501, 0, 1, 0.6941177, 1,
-0.1418751, 0.5116829, 0.4341657, 0, 1, 0.7019608, 1,
-0.1305784, 2.495357, -1.543354, 0, 1, 0.7058824, 1,
-0.1301374, 1.559899, 0.4372701, 0, 1, 0.7137255, 1,
-0.1277997, 1.005014, -1.760692, 0, 1, 0.7176471, 1,
-0.1269946, 1.223257, 0.3812887, 0, 1, 0.7254902, 1,
-0.1219621, 1.281416, 0.3310181, 0, 1, 0.7294118, 1,
-0.1205604, -0.3051412, -2.206269, 0, 1, 0.7372549, 1,
-0.1197693, 0.1945547, -1.448321, 0, 1, 0.7411765, 1,
-0.1172213, 1.809906, -1.677226, 0, 1, 0.7490196, 1,
-0.1157141, 0.7123973, -0.6378606, 0, 1, 0.7529412, 1,
-0.112711, -0.168996, -1.983186, 0, 1, 0.7607843, 1,
-0.1097926, -0.9692759, -1.366895, 0, 1, 0.7647059, 1,
-0.103328, 0.2777808, 0.1358965, 0, 1, 0.772549, 1,
-0.09897447, 0.3980136, 0.2623542, 0, 1, 0.7764706, 1,
-0.09114388, 0.2478617, -0.8638466, 0, 1, 0.7843137, 1,
-0.09105902, -0.5839141, -3.049076, 0, 1, 0.7882353, 1,
-0.08783, 0.0350927, -1.494442, 0, 1, 0.7960784, 1,
-0.08682781, -0.1747499, 0.4655855, 0, 1, 0.8039216, 1,
-0.08671957, 0.1285089, -3.948051, 0, 1, 0.8078431, 1,
-0.08087324, -0.5483166, -3.948331, 0, 1, 0.8156863, 1,
-0.0776158, -0.8719804, -3.681588, 0, 1, 0.8196079, 1,
-0.07664879, -0.3735956, -4.019511, 0, 1, 0.827451, 1,
-0.07415934, -0.1464019, -1.687683, 0, 1, 0.8313726, 1,
-0.07386097, -0.9890855, -1.802025, 0, 1, 0.8392157, 1,
-0.07348341, -0.4690904, -3.065454, 0, 1, 0.8431373, 1,
-0.07262316, -0.9996118, -2.845857, 0, 1, 0.8509804, 1,
-0.07220137, 1.857641, -0.8218868, 0, 1, 0.854902, 1,
-0.06942009, 0.07920878, -1.140987, 0, 1, 0.8627451, 1,
-0.06912571, 1.029153, -0.6931235, 0, 1, 0.8666667, 1,
-0.06135024, 0.7594922, -0.01678762, 0, 1, 0.8745098, 1,
-0.06068592, 1.248031, 1.047773, 0, 1, 0.8784314, 1,
-0.05972825, 0.2989969, -1.091105, 0, 1, 0.8862745, 1,
-0.05742935, -0.48992, -2.043478, 0, 1, 0.8901961, 1,
-0.05538454, -1.091946, -4.571758, 0, 1, 0.8980392, 1,
-0.05501451, 1.033117, -1.306575, 0, 1, 0.9058824, 1,
-0.04831855, -1.235678, -3.776875, 0, 1, 0.9098039, 1,
-0.0433473, 0.3280094, -0.8131713, 0, 1, 0.9176471, 1,
-0.04119602, -0.3531448, -2.627142, 0, 1, 0.9215686, 1,
-0.03866832, 1.540567, 0.004641179, 0, 1, 0.9294118, 1,
-0.038392, -0.6303925, -3.875119, 0, 1, 0.9333333, 1,
-0.03826595, 0.7258577, -0.1111159, 0, 1, 0.9411765, 1,
-0.0345934, 0.8426584, -0.3974924, 0, 1, 0.945098, 1,
-0.03421184, 0.389364, 0.2608867, 0, 1, 0.9529412, 1,
-0.03185335, 1.733076, -1.659213, 0, 1, 0.9568627, 1,
-0.02974004, -0.56964, -3.133683, 0, 1, 0.9647059, 1,
-0.02934724, 0.8182428, -0.4143695, 0, 1, 0.9686275, 1,
-0.02928073, -1.397057, -2.14484, 0, 1, 0.9764706, 1,
-0.02628146, 0.8164932, -0.3994075, 0, 1, 0.9803922, 1,
-0.02292793, 0.03188711, -0.9425591, 0, 1, 0.9882353, 1,
-0.01832329, 1.223633, 1.328247, 0, 1, 0.9921569, 1,
-0.01774082, 0.516692, -0.01202607, 0, 1, 1, 1,
-0.01711171, -1.196309, -3.703748, 0, 0.9921569, 1, 1,
-0.01580321, -0.1528527, -1.32014, 0, 0.9882353, 1, 1,
-0.01560905, -0.6293945, -2.428063, 0, 0.9803922, 1, 1,
-0.01560291, -0.9182314, -1.54962, 0, 0.9764706, 1, 1,
-0.009611481, -0.6218151, -2.714194, 0, 0.9686275, 1, 1,
-0.009568257, -1.664683, -3.256751, 0, 0.9647059, 1, 1,
-0.007637226, -0.941394, -2.983334, 0, 0.9568627, 1, 1,
-0.007333237, 0.3941752, 0.5573816, 0, 0.9529412, 1, 1,
-0.002896752, 0.4767751, 1.606773, 0, 0.945098, 1, 1,
-0.001876753, 0.03454858, -3.086362, 0, 0.9411765, 1, 1,
0.004966914, -1.16364, 3.064986, 0, 0.9333333, 1, 1,
0.00590334, 2.343548, -0.1459669, 0, 0.9294118, 1, 1,
0.00719963, -0.4686269, 0.8131713, 0, 0.9215686, 1, 1,
0.007590009, 1.023761, -2.667326, 0, 0.9176471, 1, 1,
0.008737169, -0.3807131, 3.965098, 0, 0.9098039, 1, 1,
0.009268251, -0.9292482, 2.772271, 0, 0.9058824, 1, 1,
0.009550121, -0.446445, 3.231025, 0, 0.8980392, 1, 1,
0.01248694, -0.1876758, 2.410135, 0, 0.8901961, 1, 1,
0.01588616, -0.4502273, 1.564568, 0, 0.8862745, 1, 1,
0.02477728, 1.019132, 0.6612052, 0, 0.8784314, 1, 1,
0.0313219, -1.785632, 3.386075, 0, 0.8745098, 1, 1,
0.03293867, 0.05463595, 0.2315988, 0, 0.8666667, 1, 1,
0.03362502, 0.9425911, -0.5124598, 0, 0.8627451, 1, 1,
0.03449439, -2.179133, 3.100667, 0, 0.854902, 1, 1,
0.03655203, 0.1840442, 0.4239078, 0, 0.8509804, 1, 1,
0.0370142, 2.103543, 0.1157957, 0, 0.8431373, 1, 1,
0.03862652, 0.3800008, -0.465883, 0, 0.8392157, 1, 1,
0.04101872, 0.005214147, 2.199005, 0, 0.8313726, 1, 1,
0.04188064, 1.496597, -1.045293, 0, 0.827451, 1, 1,
0.0418812, -0.2994914, 5.420537, 0, 0.8196079, 1, 1,
0.04792487, -0.05898556, 3.099886, 0, 0.8156863, 1, 1,
0.05303402, -0.678964, 1.901075, 0, 0.8078431, 1, 1,
0.05850556, -1.120206, 2.408213, 0, 0.8039216, 1, 1,
0.06083142, 1.112452, 0.1736971, 0, 0.7960784, 1, 1,
0.06115706, 1.777601, -0.09627146, 0, 0.7882353, 1, 1,
0.06126959, 1.470951, 0.2481869, 0, 0.7843137, 1, 1,
0.06575456, 0.8035551, 1.507536, 0, 0.7764706, 1, 1,
0.06953076, 0.05579715, 2.845422, 0, 0.772549, 1, 1,
0.07079241, 0.9136041, 0.7637323, 0, 0.7647059, 1, 1,
0.07518682, -0.01049539, 1.091062, 0, 0.7607843, 1, 1,
0.07693455, -0.8583015, 3.566742, 0, 0.7529412, 1, 1,
0.07710641, -1.267206, 2.995579, 0, 0.7490196, 1, 1,
0.0781196, 1.077863, 0.0805347, 0, 0.7411765, 1, 1,
0.08159561, 1.047789, 0.06957531, 0, 0.7372549, 1, 1,
0.08409991, 1.281197, 0.8270445, 0, 0.7294118, 1, 1,
0.08455115, 0.7121964, 0.5605972, 0, 0.7254902, 1, 1,
0.0862588, -0.2385767, 2.705801, 0, 0.7176471, 1, 1,
0.08835531, -0.7031593, 3.284439, 0, 0.7137255, 1, 1,
0.09006415, 0.2692372, -0.5829343, 0, 0.7058824, 1, 1,
0.09340428, 0.8379653, -0.1784643, 0, 0.6980392, 1, 1,
0.09661441, 3.757416, -0.7035078, 0, 0.6941177, 1, 1,
0.09740383, 0.5121511, -0.5610958, 0, 0.6862745, 1, 1,
0.09810751, 0.6616234, 2.313905, 0, 0.682353, 1, 1,
0.1071953, 0.4052579, -0.04044179, 0, 0.6745098, 1, 1,
0.1100004, 0.7634879, 0.1818619, 0, 0.6705883, 1, 1,
0.1104422, 2.819537, 1.431085, 0, 0.6627451, 1, 1,
0.1179681, 0.7193328, 1.181223, 0, 0.6588235, 1, 1,
0.1182658, 0.561547, -0.3720657, 0, 0.6509804, 1, 1,
0.1204636, -0.4201243, 2.70372, 0, 0.6470588, 1, 1,
0.1211207, 0.01007561, -0.06256355, 0, 0.6392157, 1, 1,
0.1259189, -0.6030478, 1.222621, 0, 0.6352941, 1, 1,
0.1317165, 0.2975314, -0.1534743, 0, 0.627451, 1, 1,
0.1343621, -1.66127, 2.487958, 0, 0.6235294, 1, 1,
0.1346266, -0.5460346, 2.974128, 0, 0.6156863, 1, 1,
0.13739, -0.6045035, 1.699448, 0, 0.6117647, 1, 1,
0.1419042, -0.338338, 3.189175, 0, 0.6039216, 1, 1,
0.1432924, -1.567988, 2.710403, 0, 0.5960785, 1, 1,
0.1514223, 1.536481, 0.03376843, 0, 0.5921569, 1, 1,
0.1525513, -2.107807, 2.178272, 0, 0.5843138, 1, 1,
0.1529656, -0.1662428, 1.128639, 0, 0.5803922, 1, 1,
0.1625139, -0.2945979, 2.093003, 0, 0.572549, 1, 1,
0.1634787, -1.195159, 2.936747, 0, 0.5686275, 1, 1,
0.1639139, -1.496798, 5.111753, 0, 0.5607843, 1, 1,
0.1646768, -0.8394327, 0.8980458, 0, 0.5568628, 1, 1,
0.1658183, 0.9554111, 0.5460518, 0, 0.5490196, 1, 1,
0.1660412, 1.151695, -0.5460977, 0, 0.5450981, 1, 1,
0.1667926, 0.6403141, 2.482376, 0, 0.5372549, 1, 1,
0.1684872, 1.013131, -0.9967151, 0, 0.5333334, 1, 1,
0.1689737, -0.8707736, 2.217983, 0, 0.5254902, 1, 1,
0.1720194, -0.6533754, 3.414093, 0, 0.5215687, 1, 1,
0.173754, 0.7543349, -0.1959323, 0, 0.5137255, 1, 1,
0.1761544, 1.738374, 0.1696952, 0, 0.509804, 1, 1,
0.1773741, -0.2304006, 1.636612, 0, 0.5019608, 1, 1,
0.1784194, -1.638653, 3.288256, 0, 0.4941176, 1, 1,
0.1802542, 1.006368, 0.2345903, 0, 0.4901961, 1, 1,
0.1835708, 0.01785075, 1.717803, 0, 0.4823529, 1, 1,
0.1857529, 1.703194, 0.04202131, 0, 0.4784314, 1, 1,
0.1915237, -0.6312358, 3.522369, 0, 0.4705882, 1, 1,
0.19439, -0.8559455, 3.188921, 0, 0.4666667, 1, 1,
0.1958386, 0.04985961, 0.7024215, 0, 0.4588235, 1, 1,
0.2027734, -0.4183746, 1.392508, 0, 0.454902, 1, 1,
0.2066239, -1.763771, 4.279157, 0, 0.4470588, 1, 1,
0.208608, 1.450506, 0.6203673, 0, 0.4431373, 1, 1,
0.2086255, -0.06865459, 2.375547, 0, 0.4352941, 1, 1,
0.2095599, -1.433259, 4.008992, 0, 0.4313726, 1, 1,
0.2189154, 0.756676, -0.7730324, 0, 0.4235294, 1, 1,
0.2197628, 0.1763698, 2.350769, 0, 0.4196078, 1, 1,
0.2201314, -0.520922, 2.61867, 0, 0.4117647, 1, 1,
0.2225851, -1.769311, 3.004333, 0, 0.4078431, 1, 1,
0.2233166, 0.1019935, 0.2511185, 0, 0.4, 1, 1,
0.2264123, -0.6676925, 1.892206, 0, 0.3921569, 1, 1,
0.2293698, 1.400873, 1.957041, 0, 0.3882353, 1, 1,
0.2302988, -0.2780584, 2.538812, 0, 0.3803922, 1, 1,
0.2312976, -0.1679224, 3.417176, 0, 0.3764706, 1, 1,
0.2330715, 1.816764, 2.165001, 0, 0.3686275, 1, 1,
0.2347038, -0.6213964, 5.032096, 0, 0.3647059, 1, 1,
0.2361701, 0.009558814, 2.052742, 0, 0.3568628, 1, 1,
0.2391178, 0.02080317, 1.369422, 0, 0.3529412, 1, 1,
0.2411599, -0.7000079, 4.752881, 0, 0.345098, 1, 1,
0.2418201, 0.1323529, 1.62479, 0, 0.3411765, 1, 1,
0.2463382, 0.9082449, 0.4739532, 0, 0.3333333, 1, 1,
0.248017, 1.103613, 0.8577057, 0, 0.3294118, 1, 1,
0.2502509, 0.2554738, -0.8438486, 0, 0.3215686, 1, 1,
0.2506459, -0.9197258, 1.738092, 0, 0.3176471, 1, 1,
0.2524815, 1.91331, 1.238945, 0, 0.3098039, 1, 1,
0.2552206, 0.1527301, 0.54421, 0, 0.3058824, 1, 1,
0.2592245, 2.638414, -1.023357, 0, 0.2980392, 1, 1,
0.2594127, -0.4998379, 3.77067, 0, 0.2901961, 1, 1,
0.2595845, 2.526268, -1.725253, 0, 0.2862745, 1, 1,
0.2619103, 0.2936989, -0.1811933, 0, 0.2784314, 1, 1,
0.2642367, 0.7327566, -0.802405, 0, 0.2745098, 1, 1,
0.2672326, 1.35988, -0.9998995, 0, 0.2666667, 1, 1,
0.2697518, 1.262106, -0.4414848, 0, 0.2627451, 1, 1,
0.278661, -0.2409135, 0.2436498, 0, 0.254902, 1, 1,
0.2817101, 1.115341, -0.7880123, 0, 0.2509804, 1, 1,
0.284627, 0.03943935, 0.3247297, 0, 0.2431373, 1, 1,
0.2973932, -0.3976288, 2.758779, 0, 0.2392157, 1, 1,
0.3041484, -0.1228689, 0.6002051, 0, 0.2313726, 1, 1,
0.3099882, 0.2641381, 1.818055, 0, 0.227451, 1, 1,
0.3183452, 0.2958731, 1.139818, 0, 0.2196078, 1, 1,
0.3234767, -0.5829073, 1.65734, 0, 0.2156863, 1, 1,
0.3246919, 0.3606727, 0.9084151, 0, 0.2078431, 1, 1,
0.324804, -1.75383, 3.493598, 0, 0.2039216, 1, 1,
0.3250855, -1.86327, 3.10725, 0, 0.1960784, 1, 1,
0.3254832, -0.2326809, 1.748501, 0, 0.1882353, 1, 1,
0.3277396, -0.06143516, -1.487011, 0, 0.1843137, 1, 1,
0.3296464, 0.2687367, 0.529744, 0, 0.1764706, 1, 1,
0.3312644, 1.203238, -1.059251, 0, 0.172549, 1, 1,
0.3341945, -0.6253216, 2.102835, 0, 0.1647059, 1, 1,
0.3410708, 1.07941, -0.4577153, 0, 0.1607843, 1, 1,
0.3410781, 1.185975, 0.3434748, 0, 0.1529412, 1, 1,
0.3503675, 1.591243, 1.021087, 0, 0.1490196, 1, 1,
0.3530074, -0.2226497, 2.88556, 0, 0.1411765, 1, 1,
0.3549933, 0.01049088, 1.223059, 0, 0.1372549, 1, 1,
0.3580851, -0.4752471, 3.179768, 0, 0.1294118, 1, 1,
0.3601995, 0.3997036, 0.6357692, 0, 0.1254902, 1, 1,
0.3607825, -0.5047656, 1.78651, 0, 0.1176471, 1, 1,
0.3633099, -0.520699, 2.752756, 0, 0.1137255, 1, 1,
0.3659042, 0.5305797, 1.751437, 0, 0.1058824, 1, 1,
0.3707212, -0.721724, 1.097336, 0, 0.09803922, 1, 1,
0.374698, 0.1545391, 1.344782, 0, 0.09411765, 1, 1,
0.3761656, -0.3189908, 1.999037, 0, 0.08627451, 1, 1,
0.3779172, 0.5525475, -0.4655954, 0, 0.08235294, 1, 1,
0.3797369, -0.7439045, 1.520267, 0, 0.07450981, 1, 1,
0.3800547, -0.7513722, 1.965962, 0, 0.07058824, 1, 1,
0.3801372, -0.1490586, 1.670702, 0, 0.0627451, 1, 1,
0.3827709, 1.190543, 0.04870497, 0, 0.05882353, 1, 1,
0.3840759, 1.201848, -0.4155281, 0, 0.05098039, 1, 1,
0.388265, -0.5516598, 1.929152, 0, 0.04705882, 1, 1,
0.3933259, 2.802127, -0.2515129, 0, 0.03921569, 1, 1,
0.4014796, 0.1386237, 1.804458, 0, 0.03529412, 1, 1,
0.403342, -0.1922139, 1.474901, 0, 0.02745098, 1, 1,
0.4095967, -0.9749334, 2.25765, 0, 0.02352941, 1, 1,
0.4097742, 2.604391, -0.9923107, 0, 0.01568628, 1, 1,
0.4121905, -0.3114906, 2.523095, 0, 0.01176471, 1, 1,
0.4175924, -0.5525014, 0.6393107, 0, 0.003921569, 1, 1,
0.4186307, 0.4630707, 0.03666935, 0.003921569, 0, 1, 1,
0.4202201, -0.4986886, 4.029523, 0.007843138, 0, 1, 1,
0.423934, -1.771307, 2.501894, 0.01568628, 0, 1, 1,
0.4260401, -0.8629111, 1.612305, 0.01960784, 0, 1, 1,
0.4282866, -0.1946276, 1.902001, 0.02745098, 0, 1, 1,
0.4348037, 0.7512551, 0.4574611, 0.03137255, 0, 1, 1,
0.4362078, 1.059991, 0.9417347, 0.03921569, 0, 1, 1,
0.4389038, 2.20143, 0.9368548, 0.04313726, 0, 1, 1,
0.4410921, -0.3919, 2.424472, 0.05098039, 0, 1, 1,
0.4448594, 0.245723, 0.5885503, 0.05490196, 0, 1, 1,
0.4510018, 1.270231, -0.3306921, 0.0627451, 0, 1, 1,
0.4526922, -1.814787, 2.476129, 0.06666667, 0, 1, 1,
0.4548099, 0.3784779, 1.107045, 0.07450981, 0, 1, 1,
0.4560492, 2.178928, -2.113867, 0.07843138, 0, 1, 1,
0.4588804, 0.4762709, -0.07510094, 0.08627451, 0, 1, 1,
0.4608009, -0.05899079, 3.718365, 0.09019608, 0, 1, 1,
0.4622034, -0.896601, 1.440129, 0.09803922, 0, 1, 1,
0.4636921, -0.623469, 3.071169, 0.1058824, 0, 1, 1,
0.4641026, 0.6451174, 1.43951, 0.1098039, 0, 1, 1,
0.4663658, -0.9472828, 3.519113, 0.1176471, 0, 1, 1,
0.4680372, 1.655464, 0.4187082, 0.1215686, 0, 1, 1,
0.4707943, -0.7906951, 2.142084, 0.1294118, 0, 1, 1,
0.4744665, 0.762775, 0.4524375, 0.1333333, 0, 1, 1,
0.4811744, -0.6334092, 2.830309, 0.1411765, 0, 1, 1,
0.4832443, 1.234614, 1.433549, 0.145098, 0, 1, 1,
0.483634, 0.1715267, 0.3890801, 0.1529412, 0, 1, 1,
0.4839574, 0.1406676, -0.01989439, 0.1568628, 0, 1, 1,
0.4861523, 0.3171906, 0.5025401, 0.1647059, 0, 1, 1,
0.4872689, -0.6691563, 1.343374, 0.1686275, 0, 1, 1,
0.4926877, 0.5468563, -0.02176695, 0.1764706, 0, 1, 1,
0.4955064, 1.697822, -1.001191, 0.1803922, 0, 1, 1,
0.4978079, -0.1896034, 4.107041, 0.1882353, 0, 1, 1,
0.4980839, 0.3485405, 0.9533612, 0.1921569, 0, 1, 1,
0.4992321, -0.128791, 2.851443, 0.2, 0, 1, 1,
0.5008419, -1.670125, 3.896724, 0.2078431, 0, 1, 1,
0.5068814, 1.925759, 0.4932981, 0.2117647, 0, 1, 1,
0.5101761, -0.4540108, 0.5200645, 0.2196078, 0, 1, 1,
0.5166197, -0.4493164, 3.029595, 0.2235294, 0, 1, 1,
0.5200732, -0.385536, 3.053118, 0.2313726, 0, 1, 1,
0.521948, 1.27502, 0.7323356, 0.2352941, 0, 1, 1,
0.5258451, -1.845878, 3.186242, 0.2431373, 0, 1, 1,
0.5299408, 0.5499218, 0.3861496, 0.2470588, 0, 1, 1,
0.5320323, 0.03628186, 1.134454, 0.254902, 0, 1, 1,
0.5329976, -0.1465417, 1.869174, 0.2588235, 0, 1, 1,
0.5330867, -1.163027, 3.318814, 0.2666667, 0, 1, 1,
0.5356582, -0.5314503, 1.981335, 0.2705882, 0, 1, 1,
0.5357294, -0.4780385, 2.68956, 0.2784314, 0, 1, 1,
0.5372861, -0.1177526, 2.849195, 0.282353, 0, 1, 1,
0.5377274, -0.7155675, 1.819104, 0.2901961, 0, 1, 1,
0.5478554, -1.214435, 1.677827, 0.2941177, 0, 1, 1,
0.5480624, 0.2168092, 1.093202, 0.3019608, 0, 1, 1,
0.548245, -0.6854998, 3.517982, 0.3098039, 0, 1, 1,
0.5490296, -1.967108, 4.633228, 0.3137255, 0, 1, 1,
0.5517722, 0.5456372, 1.956061, 0.3215686, 0, 1, 1,
0.5533649, 0.486038, -0.7478188, 0.3254902, 0, 1, 1,
0.557511, 0.7487543, -0.1918523, 0.3333333, 0, 1, 1,
0.5581281, -0.3160119, 0.8638518, 0.3372549, 0, 1, 1,
0.5587541, -2.117861, 2.578024, 0.345098, 0, 1, 1,
0.5622176, -0.3666647, 2.037181, 0.3490196, 0, 1, 1,
0.5634238, 1.620687, 0.4443339, 0.3568628, 0, 1, 1,
0.5720328, -0.4590603, 0.6161069, 0.3607843, 0, 1, 1,
0.5720542, -1.105542, 2.711164, 0.3686275, 0, 1, 1,
0.5734384, -1.912658, 2.292769, 0.372549, 0, 1, 1,
0.5752235, 0.1605886, 2.047172, 0.3803922, 0, 1, 1,
0.5792279, 0.02868939, 0.67811, 0.3843137, 0, 1, 1,
0.5821481, 1.162754, 0.03054604, 0.3921569, 0, 1, 1,
0.5835212, 1.542215, 0.3699785, 0.3960784, 0, 1, 1,
0.5841863, 0.7037258, 0.6895778, 0.4039216, 0, 1, 1,
0.5848528, 0.331074, 1.101775, 0.4117647, 0, 1, 1,
0.58786, 1.0103, -0.7606144, 0.4156863, 0, 1, 1,
0.588559, 0.6507712, 0.3765089, 0.4235294, 0, 1, 1,
0.5894471, -0.558122, 2.039234, 0.427451, 0, 1, 1,
0.5931818, -0.4037867, 2.204067, 0.4352941, 0, 1, 1,
0.5962291, -1.354608, 2.093724, 0.4392157, 0, 1, 1,
0.5986922, -0.5193562, 1.474161, 0.4470588, 0, 1, 1,
0.6049765, 1.587921, 1.971932, 0.4509804, 0, 1, 1,
0.6085886, 0.1931262, 1.707086, 0.4588235, 0, 1, 1,
0.6112506, 0.42867, -0.1207337, 0.4627451, 0, 1, 1,
0.6131924, -0.1867258, 2.354158, 0.4705882, 0, 1, 1,
0.6168627, 1.700547, -1.262201, 0.4745098, 0, 1, 1,
0.6213191, 1.876799, 0.8800534, 0.4823529, 0, 1, 1,
0.6235659, 0.5881376, 0.2764148, 0.4862745, 0, 1, 1,
0.6255146, 0.3526722, 1.315283, 0.4941176, 0, 1, 1,
0.6278676, 1.361121, -0.285074, 0.5019608, 0, 1, 1,
0.6305346, -0.2725065, 2.098768, 0.5058824, 0, 1, 1,
0.6313898, -0.448713, 2.764808, 0.5137255, 0, 1, 1,
0.631519, 1.359639, 0.4668563, 0.5176471, 0, 1, 1,
0.6335638, 0.6939026, 1.635228, 0.5254902, 0, 1, 1,
0.6403003, -0.4134129, 0.7329474, 0.5294118, 0, 1, 1,
0.6461421, -0.2639191, 2.901659, 0.5372549, 0, 1, 1,
0.6482109, -0.06781946, 1.595952, 0.5411765, 0, 1, 1,
0.6487262, -1.016656, 3.455532, 0.5490196, 0, 1, 1,
0.6488627, 1.806189, 0.2400084, 0.5529412, 0, 1, 1,
0.6493892, -0.847637, 2.696668, 0.5607843, 0, 1, 1,
0.6503672, -1.647385, 1.951995, 0.5647059, 0, 1, 1,
0.6522617, -0.9473534, 2.59676, 0.572549, 0, 1, 1,
0.6573744, -0.01316457, 3.689454, 0.5764706, 0, 1, 1,
0.6582739, -1.145299, 2.826097, 0.5843138, 0, 1, 1,
0.6682199, 0.9946417, 0.3326075, 0.5882353, 0, 1, 1,
0.6723659, 0.544192, 1.117019, 0.5960785, 0, 1, 1,
0.6763307, -0.2077009, 1.340403, 0.6039216, 0, 1, 1,
0.6768155, -0.07655492, 2.274269, 0.6078432, 0, 1, 1,
0.6770685, -0.2846061, 2.403707, 0.6156863, 0, 1, 1,
0.6821291, -1.334363, 2.607079, 0.6196079, 0, 1, 1,
0.686272, -1.87459, 2.070581, 0.627451, 0, 1, 1,
0.6909512, 0.4427326, 0.002769435, 0.6313726, 0, 1, 1,
0.6951997, 0.2559379, 2.282441, 0.6392157, 0, 1, 1,
0.6970908, 2.392691, 0.3981855, 0.6431373, 0, 1, 1,
0.699492, 0.1270051, 1.883313, 0.6509804, 0, 1, 1,
0.7030806, 1.154109, 0.9533325, 0.654902, 0, 1, 1,
0.7033097, -0.1086508, 0.67485, 0.6627451, 0, 1, 1,
0.7128731, -0.2531048, 0.1644223, 0.6666667, 0, 1, 1,
0.7138032, -0.7637673, 2.792759, 0.6745098, 0, 1, 1,
0.7189912, -0.1524473, 2.658689, 0.6784314, 0, 1, 1,
0.7213826, 0.2836241, 0.7871464, 0.6862745, 0, 1, 1,
0.7325613, 1.360355, 0.03576921, 0.6901961, 0, 1, 1,
0.735991, -0.7457243, 2.798105, 0.6980392, 0, 1, 1,
0.7388803, -0.3087656, 0.415141, 0.7058824, 0, 1, 1,
0.7642285, 1.008256, 2.413813, 0.7098039, 0, 1, 1,
0.7651698, 0.4789677, 0.6429783, 0.7176471, 0, 1, 1,
0.7678205, -0.7557166, 1.909879, 0.7215686, 0, 1, 1,
0.7731212, -0.8320724, 2.143366, 0.7294118, 0, 1, 1,
0.773582, -0.03166308, 0.4320562, 0.7333333, 0, 1, 1,
0.7889799, 0.2633027, 1.452966, 0.7411765, 0, 1, 1,
0.7909375, -1.238882, 2.307683, 0.7450981, 0, 1, 1,
0.7909594, 1.468043, 0.1930276, 0.7529412, 0, 1, 1,
0.7924147, -0.9486063, 2.744102, 0.7568628, 0, 1, 1,
0.7994977, 1.366579, 0.1015078, 0.7647059, 0, 1, 1,
0.8004121, -0.3020561, 2.640176, 0.7686275, 0, 1, 1,
0.8106182, 2.521269, -0.9197311, 0.7764706, 0, 1, 1,
0.8127638, 0.4519066, 2.222348, 0.7803922, 0, 1, 1,
0.8169127, 0.2528924, 2.460392, 0.7882353, 0, 1, 1,
0.8175473, -0.2296056, 2.254981, 0.7921569, 0, 1, 1,
0.8208173, 0.6306479, 0.6806619, 0.8, 0, 1, 1,
0.8216755, -0.3823348, 2.673393, 0.8078431, 0, 1, 1,
0.8235728, -1.399237, 1.641703, 0.8117647, 0, 1, 1,
0.8275272, 0.8786567, 0.2892523, 0.8196079, 0, 1, 1,
0.8299744, 3.003644, 1.336558, 0.8235294, 0, 1, 1,
0.8376184, -1.085981, 2.553402, 0.8313726, 0, 1, 1,
0.83777, 0.1383222, 1.88877, 0.8352941, 0, 1, 1,
0.8422533, -0.649659, 0.2248615, 0.8431373, 0, 1, 1,
0.8436443, -0.2769556, 2.433095, 0.8470588, 0, 1, 1,
0.8467119, -0.2594378, 1.539665, 0.854902, 0, 1, 1,
0.8483012, 1.295201, 0.8569767, 0.8588235, 0, 1, 1,
0.8537704, 1.680779, 0.6025856, 0.8666667, 0, 1, 1,
0.8537962, -2.710959, 2.753931, 0.8705882, 0, 1, 1,
0.8552262, 0.966396, -0.7167275, 0.8784314, 0, 1, 1,
0.8614494, 0.04691041, 2.549009, 0.8823529, 0, 1, 1,
0.8689339, 0.8558148, 0.7302196, 0.8901961, 0, 1, 1,
0.8705299, 1.211252, 2.018516, 0.8941177, 0, 1, 1,
0.8858313, 0.5730399, 0.4615604, 0.9019608, 0, 1, 1,
0.8867042, 0.2005018, 2.467354, 0.9098039, 0, 1, 1,
0.8974368, 1.573838, 0.928164, 0.9137255, 0, 1, 1,
0.9043946, -0.1076805, 2.128154, 0.9215686, 0, 1, 1,
0.9058365, -0.5095388, 1.5791, 0.9254902, 0, 1, 1,
0.9091733, 0.9589866, 0.4750331, 0.9333333, 0, 1, 1,
0.9146689, 0.433093, 0.7133312, 0.9372549, 0, 1, 1,
0.9148566, 0.1915246, 0.5224365, 0.945098, 0, 1, 1,
0.9174587, -0.4095113, 4.138747, 0.9490196, 0, 1, 1,
0.9273458, 0.4577568, 0.363444, 0.9568627, 0, 1, 1,
0.928234, -0.4094117, 1.629444, 0.9607843, 0, 1, 1,
0.9393529, 0.2134592, 2.90262, 0.9686275, 0, 1, 1,
0.9447682, 0.5783244, 1.802397, 0.972549, 0, 1, 1,
0.9478896, -0.2503235, 0.6297036, 0.9803922, 0, 1, 1,
0.951004, -1.228725, 2.572817, 0.9843137, 0, 1, 1,
0.9541691, 0.4401755, 1.009683, 0.9921569, 0, 1, 1,
0.9554084, 0.1242499, 2.152384, 0.9960784, 0, 1, 1,
0.9557515, -1.025803, 4.079894, 1, 0, 0.9960784, 1,
0.9678337, -0.6671683, 1.603956, 1, 0, 0.9882353, 1,
0.9684569, 1.149589, 1.095288, 1, 0, 0.9843137, 1,
0.9737312, -0.02591702, 2.827521, 1, 0, 0.9764706, 1,
0.9752541, 0.7733585, 1.883118, 1, 0, 0.972549, 1,
0.9781991, -0.06094028, -0.124141, 1, 0, 0.9647059, 1,
0.9885472, 1.146684, 0.8736715, 1, 0, 0.9607843, 1,
0.9917033, 0.5092462, -0.557153, 1, 0, 0.9529412, 1,
0.9938579, -0.8769942, 1.872952, 1, 0, 0.9490196, 1,
0.9940724, 0.87407, 0.7194537, 1, 0, 0.9411765, 1,
0.9945105, -0.05057497, 1.306004, 1, 0, 0.9372549, 1,
1.008767, 0.6108112, 2.343654, 1, 0, 0.9294118, 1,
1.014215, -1.319284, 2.843461, 1, 0, 0.9254902, 1,
1.018666, -0.6591364, 2.548917, 1, 0, 0.9176471, 1,
1.028998, 0.1535691, 2.564308, 1, 0, 0.9137255, 1,
1.034324, 0.02060081, 3.265098, 1, 0, 0.9058824, 1,
1.036116, -0.7872364, 3.171957, 1, 0, 0.9019608, 1,
1.03647, 0.9870605, 2.074705, 1, 0, 0.8941177, 1,
1.039021, -0.1581613, 2.841447, 1, 0, 0.8862745, 1,
1.041426, 0.6135605, -0.3607123, 1, 0, 0.8823529, 1,
1.042625, 1.030048, 0.2315283, 1, 0, 0.8745098, 1,
1.045184, -0.8616603, 4.126324, 1, 0, 0.8705882, 1,
1.052714, -1.710601, 2.293693, 1, 0, 0.8627451, 1,
1.052758, -1.095962, 1.278049, 1, 0, 0.8588235, 1,
1.064871, 0.9266406, 2.123878, 1, 0, 0.8509804, 1,
1.066895, 2.889622, 0.7579489, 1, 0, 0.8470588, 1,
1.068051, 0.2480559, 1.594555, 1, 0, 0.8392157, 1,
1.069532, -0.1648594, 0.6720073, 1, 0, 0.8352941, 1,
1.072081, 0.8560645, -1.739106, 1, 0, 0.827451, 1,
1.073046, -0.7228462, 1.749875, 1, 0, 0.8235294, 1,
1.077771, -0.4943039, 2.797115, 1, 0, 0.8156863, 1,
1.078945, -1.849664, 2.452376, 1, 0, 0.8117647, 1,
1.08502, 0.08131424, 1.275087, 1, 0, 0.8039216, 1,
1.086473, 0.1666466, 0.5920655, 1, 0, 0.7960784, 1,
1.094612, 1.916386, 3.323798, 1, 0, 0.7921569, 1,
1.09534, 0.7705365, 1.566398, 1, 0, 0.7843137, 1,
1.096712, -0.3648408, 3.110948, 1, 0, 0.7803922, 1,
1.100553, -2.405123, 5.063759, 1, 0, 0.772549, 1,
1.105036, 0.4385947, 0.3066603, 1, 0, 0.7686275, 1,
1.11263, -0.7635571, 2.808953, 1, 0, 0.7607843, 1,
1.113051, 0.2719705, 2.311564, 1, 0, 0.7568628, 1,
1.116343, -0.2069614, 0.9027376, 1, 0, 0.7490196, 1,
1.118149, -0.2400498, 3.42583, 1, 0, 0.7450981, 1,
1.121674, -1.606751, 2.541612, 1, 0, 0.7372549, 1,
1.121897, 2.259799, -1.351305, 1, 0, 0.7333333, 1,
1.127614, -0.07063987, 2.153948, 1, 0, 0.7254902, 1,
1.131238, 1.505818, -0.402762, 1, 0, 0.7215686, 1,
1.137147, -1.408029, 3.028068, 1, 0, 0.7137255, 1,
1.137901, -1.679949, 2.612375, 1, 0, 0.7098039, 1,
1.141692, -0.2713867, 2.091176, 1, 0, 0.7019608, 1,
1.153592, -0.1795425, 1.380542, 1, 0, 0.6941177, 1,
1.161379, 1.434755, 0.9784119, 1, 0, 0.6901961, 1,
1.170793, -1.603554, 1.713001, 1, 0, 0.682353, 1,
1.17141, 1.122269, 1.699041, 1, 0, 0.6784314, 1,
1.183949, 0.807551, 1.114668, 1, 0, 0.6705883, 1,
1.190597, 1.762695, 0.2074509, 1, 0, 0.6666667, 1,
1.193277, 2.153756, 1.973784, 1, 0, 0.6588235, 1,
1.197689, -0.9216369, 1.103322, 1, 0, 0.654902, 1,
1.203566, 0.9652772, 2.146182, 1, 0, 0.6470588, 1,
1.20417, -1.559832, 2.502481, 1, 0, 0.6431373, 1,
1.20979, 0.3125952, 0.6202064, 1, 0, 0.6352941, 1,
1.221111, -1.546063, 2.364136, 1, 0, 0.6313726, 1,
1.225002, 0.3707748, 0.5531251, 1, 0, 0.6235294, 1,
1.226093, -0.5518963, 2.702618, 1, 0, 0.6196079, 1,
1.226727, 0.5376037, 0.3202395, 1, 0, 0.6117647, 1,
1.233133, 0.4784268, -0.4469765, 1, 0, 0.6078432, 1,
1.241675, -0.7206413, 2.346483, 1, 0, 0.6, 1,
1.248179, 0.7720436, -1.06337, 1, 0, 0.5921569, 1,
1.248337, 0.02892837, 1.634746, 1, 0, 0.5882353, 1,
1.253036, -0.09928183, 1.010434, 1, 0, 0.5803922, 1,
1.255033, -0.5118704, 2.295249, 1, 0, 0.5764706, 1,
1.28566, -0.3963442, 1.994664, 1, 0, 0.5686275, 1,
1.287604, -0.8083376, 2.648642, 1, 0, 0.5647059, 1,
1.302732, 0.5442307, -0.04857375, 1, 0, 0.5568628, 1,
1.305336, 0.06065223, -0.08392842, 1, 0, 0.5529412, 1,
1.308282, 0.3236665, 2.23683, 1, 0, 0.5450981, 1,
1.312039, 1.965, 1.508663, 1, 0, 0.5411765, 1,
1.328357, -1.066097, 2.488428, 1, 0, 0.5333334, 1,
1.329915, -0.02371356, 0.4055894, 1, 0, 0.5294118, 1,
1.340349, -0.450014, 3.413782, 1, 0, 0.5215687, 1,
1.341649, 0.3176116, -1.980274, 1, 0, 0.5176471, 1,
1.344542, 1.4168, -0.6897201, 1, 0, 0.509804, 1,
1.359066, 0.4781216, 1.632953, 1, 0, 0.5058824, 1,
1.364937, -1.539161, -0.3579518, 1, 0, 0.4980392, 1,
1.370518, 0.1850451, 2.288213, 1, 0, 0.4901961, 1,
1.395865, 0.09450389, 2.219427, 1, 0, 0.4862745, 1,
1.405349, 0.3943642, 0.9368514, 1, 0, 0.4784314, 1,
1.408639, -0.06521456, 0.08289982, 1, 0, 0.4745098, 1,
1.413897, 0.5898969, -0.2793886, 1, 0, 0.4666667, 1,
1.414199, -1.311818, 2.145355, 1, 0, 0.4627451, 1,
1.414297, 1.30034, 0.4397191, 1, 0, 0.454902, 1,
1.421085, 1.249022, -1.571085, 1, 0, 0.4509804, 1,
1.421959, 0.4149118, 2.463689, 1, 0, 0.4431373, 1,
1.434942, -0.1545033, 1.387857, 1, 0, 0.4392157, 1,
1.439672, -0.3293819, 3.0791, 1, 0, 0.4313726, 1,
1.446839, -0.1788954, 3.162208, 1, 0, 0.427451, 1,
1.456113, 0.5579782, 3.108179, 1, 0, 0.4196078, 1,
1.458119, 0.1873007, 2.669714, 1, 0, 0.4156863, 1,
1.463007, -1.489099, 1.432869, 1, 0, 0.4078431, 1,
1.50507, -1.089852, 2.37003, 1, 0, 0.4039216, 1,
1.506208, 0.4165055, 1.297986, 1, 0, 0.3960784, 1,
1.52097, -1.691422, 2.499304, 1, 0, 0.3882353, 1,
1.5374, 0.2478871, 1.187159, 1, 0, 0.3843137, 1,
1.550397, 0.3397069, 0.472333, 1, 0, 0.3764706, 1,
1.551465, 0.697836, -1.152819, 1, 0, 0.372549, 1,
1.553286, 0.7741845, -0.2832479, 1, 0, 0.3647059, 1,
1.574508, 0.5312262, 1.611136, 1, 0, 0.3607843, 1,
1.574711, 2.463, 1.759124, 1, 0, 0.3529412, 1,
1.592607, -1.753521, 2.403045, 1, 0, 0.3490196, 1,
1.593529, -0.1518026, 1.736493, 1, 0, 0.3411765, 1,
1.59806, -0.5021225, 1.154743, 1, 0, 0.3372549, 1,
1.60831, 1.030472, 0.6432199, 1, 0, 0.3294118, 1,
1.614078, -0.289205, 1.255585, 1, 0, 0.3254902, 1,
1.615275, -0.2161225, 1.239347, 1, 0, 0.3176471, 1,
1.619092, 0.7049901, 1.276419, 1, 0, 0.3137255, 1,
1.642533, -1.123738, 2.186571, 1, 0, 0.3058824, 1,
1.648804, -2.571436, 3.412304, 1, 0, 0.2980392, 1,
1.663844, 0.7056504, 0.9300268, 1, 0, 0.2941177, 1,
1.677524, -1.501888, 4.030686, 1, 0, 0.2862745, 1,
1.709548, 0.2716055, 1.262793, 1, 0, 0.282353, 1,
1.725316, 0.7998955, 0.8633175, 1, 0, 0.2745098, 1,
1.734014, 0.7322761, -0.2657496, 1, 0, 0.2705882, 1,
1.74369, 1.161605, 1.473418, 1, 0, 0.2627451, 1,
1.773521, -1.443436, 2.29133, 1, 0, 0.2588235, 1,
1.775428, 0.3412, 0.7297034, 1, 0, 0.2509804, 1,
1.778345, 1.240638, -0.2939264, 1, 0, 0.2470588, 1,
1.816375, 0.09440709, 1.404778, 1, 0, 0.2392157, 1,
1.836145, 0.03258734, 1.373561, 1, 0, 0.2352941, 1,
1.843376, 0.8776608, 1.813204, 1, 0, 0.227451, 1,
1.851279, -0.7841941, 1.630901, 1, 0, 0.2235294, 1,
1.85484, 0.272218, 1.820091, 1, 0, 0.2156863, 1,
1.859889, 0.7766131, 0.9024135, 1, 0, 0.2117647, 1,
1.891563, -0.9673522, 3.628252, 1, 0, 0.2039216, 1,
1.893831, 0.2891182, 1.192019, 1, 0, 0.1960784, 1,
1.899704, 0.6899074, 1.007508, 1, 0, 0.1921569, 1,
1.903779, -0.03213218, 1.278005, 1, 0, 0.1843137, 1,
1.903958, 2.45693, 1.155121, 1, 0, 0.1803922, 1,
1.904331, 1.320768, 1.965543, 1, 0, 0.172549, 1,
1.91141, 1.110261, -0.5061563, 1, 0, 0.1686275, 1,
1.949702, -2.863349, 1.76909, 1, 0, 0.1607843, 1,
1.95054, 0.6475978, 0.4878203, 1, 0, 0.1568628, 1,
1.954146, -0.660969, 2.879322, 1, 0, 0.1490196, 1,
1.959063, 1.14425, 0.8993868, 1, 0, 0.145098, 1,
1.972849, -2.856505, 2.1942, 1, 0, 0.1372549, 1,
1.976966, -0.9371647, 0.7736686, 1, 0, 0.1333333, 1,
1.981886, 1.865, 1.329111, 1, 0, 0.1254902, 1,
2.004634, 1.288143, 1.772835, 1, 0, 0.1215686, 1,
2.005806, -0.1258259, 1.947002, 1, 0, 0.1137255, 1,
2.016544, -0.5829857, 2.75226, 1, 0, 0.1098039, 1,
2.02605, 1.756348, 0.8342094, 1, 0, 0.1019608, 1,
2.040199, 0.8908007, 1.629101, 1, 0, 0.09411765, 1,
2.059643, 0.4873139, 0.6750962, 1, 0, 0.09019608, 1,
2.125664, 0.7952656, 0.465739, 1, 0, 0.08235294, 1,
2.143313, -0.4598348, 1.7716, 1, 0, 0.07843138, 1,
2.204251, -0.1257534, 1.066108, 1, 0, 0.07058824, 1,
2.217786, 1.655526, -0.84334, 1, 0, 0.06666667, 1,
2.229456, 1.517122, 1.495827, 1, 0, 0.05882353, 1,
2.246395, 0.5274817, 1.15067, 1, 0, 0.05490196, 1,
2.271964, -1.79883, 4.281806, 1, 0, 0.04705882, 1,
2.279588, 0.4827049, 1.903206, 1, 0, 0.04313726, 1,
2.286432, -0.08362664, 0.9631262, 1, 0, 0.03529412, 1,
2.35044, -1.853515, 1.395399, 1, 0, 0.03137255, 1,
2.414177, -1.462083, 2.988899, 1, 0, 0.02352941, 1,
2.451042, 1.708345, 0.606736, 1, 0, 0.01960784, 1,
2.473226, 2.376063, 1.367408, 1, 0, 0.01176471, 1,
2.999611, 1.564221, 0.6376075, 1, 0, 0.007843138, 1
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
-0.04147017, -3.985568, -8.691699, 0, -0.5, 0.5, 0.5,
-0.04147017, -3.985568, -8.691699, 1, -0.5, 0.5, 0.5,
-0.04147017, -3.985568, -8.691699, 1, 1.5, 0.5, 0.5,
-0.04147017, -3.985568, -8.691699, 0, 1.5, 0.5, 0.5
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
-4.113478, 0.4470336, -8.691699, 0, -0.5, 0.5, 0.5,
-4.113478, 0.4470336, -8.691699, 1, -0.5, 0.5, 0.5,
-4.113478, 0.4470336, -8.691699, 1, 1.5, 0.5, 0.5,
-4.113478, 0.4470336, -8.691699, 0, 1.5, 0.5, 0.5
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
-4.113478, -3.985568, -0.6129115, 0, -0.5, 0.5, 0.5,
-4.113478, -3.985568, -0.6129115, 1, -0.5, 0.5, 0.5,
-4.113478, -3.985568, -0.6129115, 1, 1.5, 0.5, 0.5,
-4.113478, -3.985568, -0.6129115, 0, 1.5, 0.5, 0.5
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
-3, -2.96266, -6.827363,
2, -2.96266, -6.827363,
-3, -2.96266, -6.827363,
-3, -3.133145, -7.138086,
-2, -2.96266, -6.827363,
-2, -3.133145, -7.138086,
-1, -2.96266, -6.827363,
-1, -3.133145, -7.138086,
0, -2.96266, -6.827363,
0, -3.133145, -7.138086,
1, -2.96266, -6.827363,
1, -3.133145, -7.138086,
2, -2.96266, -6.827363,
2, -3.133145, -7.138086
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
-3, -3.474114, -7.759531, 0, -0.5, 0.5, 0.5,
-3, -3.474114, -7.759531, 1, -0.5, 0.5, 0.5,
-3, -3.474114, -7.759531, 1, 1.5, 0.5, 0.5,
-3, -3.474114, -7.759531, 0, 1.5, 0.5, 0.5,
-2, -3.474114, -7.759531, 0, -0.5, 0.5, 0.5,
-2, -3.474114, -7.759531, 1, -0.5, 0.5, 0.5,
-2, -3.474114, -7.759531, 1, 1.5, 0.5, 0.5,
-2, -3.474114, -7.759531, 0, 1.5, 0.5, 0.5,
-1, -3.474114, -7.759531, 0, -0.5, 0.5, 0.5,
-1, -3.474114, -7.759531, 1, -0.5, 0.5, 0.5,
-1, -3.474114, -7.759531, 1, 1.5, 0.5, 0.5,
-1, -3.474114, -7.759531, 0, 1.5, 0.5, 0.5,
0, -3.474114, -7.759531, 0, -0.5, 0.5, 0.5,
0, -3.474114, -7.759531, 1, -0.5, 0.5, 0.5,
0, -3.474114, -7.759531, 1, 1.5, 0.5, 0.5,
0, -3.474114, -7.759531, 0, 1.5, 0.5, 0.5,
1, -3.474114, -7.759531, 0, -0.5, 0.5, 0.5,
1, -3.474114, -7.759531, 1, -0.5, 0.5, 0.5,
1, -3.474114, -7.759531, 1, 1.5, 0.5, 0.5,
1, -3.474114, -7.759531, 0, 1.5, 0.5, 0.5,
2, -3.474114, -7.759531, 0, -0.5, 0.5, 0.5,
2, -3.474114, -7.759531, 1, -0.5, 0.5, 0.5,
2, -3.474114, -7.759531, 1, 1.5, 0.5, 0.5,
2, -3.474114, -7.759531, 0, 1.5, 0.5, 0.5
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
-3.173784, -2, -6.827363,
-3.173784, 3, -6.827363,
-3.173784, -2, -6.827363,
-3.330399, -2, -7.138086,
-3.173784, -1, -6.827363,
-3.330399, -1, -7.138086,
-3.173784, 0, -6.827363,
-3.330399, 0, -7.138086,
-3.173784, 1, -6.827363,
-3.330399, 1, -7.138086,
-3.173784, 2, -6.827363,
-3.330399, 2, -7.138086,
-3.173784, 3, -6.827363,
-3.330399, 3, -7.138086
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
-3.643631, -2, -7.759531, 0, -0.5, 0.5, 0.5,
-3.643631, -2, -7.759531, 1, -0.5, 0.5, 0.5,
-3.643631, -2, -7.759531, 1, 1.5, 0.5, 0.5,
-3.643631, -2, -7.759531, 0, 1.5, 0.5, 0.5,
-3.643631, -1, -7.759531, 0, -0.5, 0.5, 0.5,
-3.643631, -1, -7.759531, 1, -0.5, 0.5, 0.5,
-3.643631, -1, -7.759531, 1, 1.5, 0.5, 0.5,
-3.643631, -1, -7.759531, 0, 1.5, 0.5, 0.5,
-3.643631, 0, -7.759531, 0, -0.5, 0.5, 0.5,
-3.643631, 0, -7.759531, 1, -0.5, 0.5, 0.5,
-3.643631, 0, -7.759531, 1, 1.5, 0.5, 0.5,
-3.643631, 0, -7.759531, 0, 1.5, 0.5, 0.5,
-3.643631, 1, -7.759531, 0, -0.5, 0.5, 0.5,
-3.643631, 1, -7.759531, 1, -0.5, 0.5, 0.5,
-3.643631, 1, -7.759531, 1, 1.5, 0.5, 0.5,
-3.643631, 1, -7.759531, 0, 1.5, 0.5, 0.5,
-3.643631, 2, -7.759531, 0, -0.5, 0.5, 0.5,
-3.643631, 2, -7.759531, 1, -0.5, 0.5, 0.5,
-3.643631, 2, -7.759531, 1, 1.5, 0.5, 0.5,
-3.643631, 2, -7.759531, 0, 1.5, 0.5, 0.5,
-3.643631, 3, -7.759531, 0, -0.5, 0.5, 0.5,
-3.643631, 3, -7.759531, 1, -0.5, 0.5, 0.5,
-3.643631, 3, -7.759531, 1, 1.5, 0.5, 0.5,
-3.643631, 3, -7.759531, 0, 1.5, 0.5, 0.5
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
-3.173784, -2.96266, -6,
-3.173784, -2.96266, 4,
-3.173784, -2.96266, -6,
-3.330399, -3.133145, -6,
-3.173784, -2.96266, -4,
-3.330399, -3.133145, -4,
-3.173784, -2.96266, -2,
-3.330399, -3.133145, -2,
-3.173784, -2.96266, 0,
-3.330399, -3.133145, 0,
-3.173784, -2.96266, 2,
-3.330399, -3.133145, 2,
-3.173784, -2.96266, 4,
-3.330399, -3.133145, 4
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
-3.643631, -3.474114, -6, 0, -0.5, 0.5, 0.5,
-3.643631, -3.474114, -6, 1, -0.5, 0.5, 0.5,
-3.643631, -3.474114, -6, 1, 1.5, 0.5, 0.5,
-3.643631, -3.474114, -6, 0, 1.5, 0.5, 0.5,
-3.643631, -3.474114, -4, 0, -0.5, 0.5, 0.5,
-3.643631, -3.474114, -4, 1, -0.5, 0.5, 0.5,
-3.643631, -3.474114, -4, 1, 1.5, 0.5, 0.5,
-3.643631, -3.474114, -4, 0, 1.5, 0.5, 0.5,
-3.643631, -3.474114, -2, 0, -0.5, 0.5, 0.5,
-3.643631, -3.474114, -2, 1, -0.5, 0.5, 0.5,
-3.643631, -3.474114, -2, 1, 1.5, 0.5, 0.5,
-3.643631, -3.474114, -2, 0, 1.5, 0.5, 0.5,
-3.643631, -3.474114, 0, 0, -0.5, 0.5, 0.5,
-3.643631, -3.474114, 0, 1, -0.5, 0.5, 0.5,
-3.643631, -3.474114, 0, 1, 1.5, 0.5, 0.5,
-3.643631, -3.474114, 0, 0, 1.5, 0.5, 0.5,
-3.643631, -3.474114, 2, 0, -0.5, 0.5, 0.5,
-3.643631, -3.474114, 2, 1, -0.5, 0.5, 0.5,
-3.643631, -3.474114, 2, 1, 1.5, 0.5, 0.5,
-3.643631, -3.474114, 2, 0, 1.5, 0.5, 0.5,
-3.643631, -3.474114, 4, 0, -0.5, 0.5, 0.5,
-3.643631, -3.474114, 4, 1, -0.5, 0.5, 0.5,
-3.643631, -3.474114, 4, 1, 1.5, 0.5, 0.5,
-3.643631, -3.474114, 4, 0, 1.5, 0.5, 0.5
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
-3.173784, -2.96266, -6.827363,
-3.173784, 3.856728, -6.827363,
-3.173784, -2.96266, 5.601541,
-3.173784, 3.856728, 5.601541,
-3.173784, -2.96266, -6.827363,
-3.173784, -2.96266, 5.601541,
-3.173784, 3.856728, -6.827363,
-3.173784, 3.856728, 5.601541,
-3.173784, -2.96266, -6.827363,
3.090843, -2.96266, -6.827363,
-3.173784, -2.96266, 5.601541,
3.090843, -2.96266, 5.601541,
-3.173784, 3.856728, -6.827363,
3.090843, 3.856728, -6.827363,
-3.173784, 3.856728, 5.601541,
3.090843, 3.856728, 5.601541,
3.090843, -2.96266, -6.827363,
3.090843, 3.856728, -6.827363,
3.090843, -2.96266, 5.601541,
3.090843, 3.856728, 5.601541,
3.090843, -2.96266, -6.827363,
3.090843, -2.96266, 5.601541,
3.090843, 3.856728, -6.827363,
3.090843, 3.856728, 5.601541
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
var radius = 8.276307;
var distance = 36.82223;
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
mvMatrix.translate( 0.04147017, -0.4470336, 0.6129115 );
mvMatrix.scale( 1.428418, 1.312215, 0.7199754 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.82223);
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
xylylcarb<-read.table("xylylcarb.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-xylylcarb$V2
```

```
## Error in eval(expr, envir, enclos): object 'xylylcarb' not found
```

```r
y<-xylylcarb$V3
```

```
## Error in eval(expr, envir, enclos): object 'xylylcarb' not found
```

```r
z<-xylylcarb$V4
```

```
## Error in eval(expr, envir, enclos): object 'xylylcarb' not found
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
-3.082551, 0.8107374, -1.102451, 0, 0, 1, 1, 1,
-3.052314, -1.919053, -0.9985683, 1, 0, 0, 1, 1,
-2.979907, 0.972939, -0.6144355, 1, 0, 0, 1, 1,
-2.898459, -0.1503903, -1.704105, 1, 0, 0, 1, 1,
-2.705699, 0.2646631, -0.7742144, 1, 0, 0, 1, 1,
-2.651416, 0.2002292, 1.081244, 1, 0, 0, 1, 1,
-2.579058, 2.084265, 0.6569693, 0, 0, 0, 1, 1,
-2.476503, -1.133117, -2.916803, 0, 0, 0, 1, 1,
-2.451408, -0.1158952, -2.987964, 0, 0, 0, 1, 1,
-2.412084, -1.286815, -1.965509, 0, 0, 0, 1, 1,
-2.411248, -0.4200974, -1.430282, 0, 0, 0, 1, 1,
-2.371584, -0.4053836, -2.130229, 0, 0, 0, 1, 1,
-2.328472, -0.3894062, -1.186541, 0, 0, 0, 1, 1,
-2.327374, -0.4085637, -0.8715185, 1, 1, 1, 1, 1,
-2.297492, 0.2597153, -2.284445, 1, 1, 1, 1, 1,
-2.255884, -0.7546915, -1.726823, 1, 1, 1, 1, 1,
-2.221865, -0.1619798, -1.108283, 1, 1, 1, 1, 1,
-2.196585, 0.853837, -0.9320254, 1, 1, 1, 1, 1,
-2.129862, -0.3864245, -2.165281, 1, 1, 1, 1, 1,
-2.120833, 0.3786491, -0.6628237, 1, 1, 1, 1, 1,
-2.10429, -0.26004, -0.03276547, 1, 1, 1, 1, 1,
-2.09155, -0.8705279, -1.607137, 1, 1, 1, 1, 1,
-2.089825, -0.07696398, -1.595691, 1, 1, 1, 1, 1,
-2.086254, -0.2766062, -1.536891, 1, 1, 1, 1, 1,
-2.058026, 0.2296067, -0.242414, 1, 1, 1, 1, 1,
-2.022308, 0.704363, -1.145274, 1, 1, 1, 1, 1,
-2.011856, 0.7331229, -0.1145223, 1, 1, 1, 1, 1,
-2.003611, 1.288558, -0.9222617, 1, 1, 1, 1, 1,
-1.981721, 1.845029, -1.604377, 0, 0, 1, 1, 1,
-1.961764, -0.6791803, -3.462063, 1, 0, 0, 1, 1,
-1.933618, 1.142099, -2.40644, 1, 0, 0, 1, 1,
-1.933439, -0.7557316, -1.692308, 1, 0, 0, 1, 1,
-1.922116, -1.161474, -2.040146, 1, 0, 0, 1, 1,
-1.883909, -0.7665026, -1.761288, 1, 0, 0, 1, 1,
-1.873621, 0.3218637, -2.503352, 0, 0, 0, 1, 1,
-1.856327, -0.5202722, -2.908144, 0, 0, 0, 1, 1,
-1.852265, -0.3356003, -1.154704, 0, 0, 0, 1, 1,
-1.841629, -0.1553178, -1.694546, 0, 0, 0, 1, 1,
-1.839432, 1.061894, -1.156802, 0, 0, 0, 1, 1,
-1.801248, 0.4006259, -1.271596, 0, 0, 0, 1, 1,
-1.79732, 0.1805837, -1.563463, 0, 0, 0, 1, 1,
-1.794973, 0.1300578, -1.330292, 1, 1, 1, 1, 1,
-1.764018, -0.06089652, -1.336414, 1, 1, 1, 1, 1,
-1.755184, 0.1809796, -0.8033018, 1, 1, 1, 1, 1,
-1.752656, -0.8805164, -3.415384, 1, 1, 1, 1, 1,
-1.733047, -1.008105, -2.710514, 1, 1, 1, 1, 1,
-1.715494, 1.924162, -0.6757098, 1, 1, 1, 1, 1,
-1.709075, 0.3961627, -1.562265, 1, 1, 1, 1, 1,
-1.697989, 1.315038, -1.761825, 1, 1, 1, 1, 1,
-1.694723, 0.80752, -0.954837, 1, 1, 1, 1, 1,
-1.694, -1.477206, -2.008145, 1, 1, 1, 1, 1,
-1.692565, -0.23054, -0.1729349, 1, 1, 1, 1, 1,
-1.657308, 1.639572, -0.8882764, 1, 1, 1, 1, 1,
-1.626656, -0.3302251, -3.005495, 1, 1, 1, 1, 1,
-1.620944, -1.147118, -2.211989, 1, 1, 1, 1, 1,
-1.615112, -2.451115, -0.501202, 1, 1, 1, 1, 1,
-1.611701, -1.29671, -3.414507, 0, 0, 1, 1, 1,
-1.609203, -0.3164544, -1.927316, 1, 0, 0, 1, 1,
-1.599468, 0.3134555, -2.210656, 1, 0, 0, 1, 1,
-1.578673, 0.8676363, -2.927154, 1, 0, 0, 1, 1,
-1.571633, 1.60544, -0.670222, 1, 0, 0, 1, 1,
-1.570625, -0.4061402, -2.275152, 1, 0, 0, 1, 1,
-1.568324, -0.6690622, -1.084917, 0, 0, 0, 1, 1,
-1.554664, -0.52044, -0.5641858, 0, 0, 0, 1, 1,
-1.544393, 2.239439, 1.053414, 0, 0, 0, 1, 1,
-1.54222, 1.267539, 0.1729601, 0, 0, 0, 1, 1,
-1.533201, 0.8888956, -2.876211, 0, 0, 0, 1, 1,
-1.531498, 0.3698106, -3.11475, 0, 0, 0, 1, 1,
-1.519168, -0.6615938, -1.345502, 0, 0, 0, 1, 1,
-1.510941, -1.109315, -1.686267, 1, 1, 1, 1, 1,
-1.504684, -1.066604, -2.483978, 1, 1, 1, 1, 1,
-1.502721, 0.281113, -1.567459, 1, 1, 1, 1, 1,
-1.483409, 1.071674, -0.1476221, 1, 1, 1, 1, 1,
-1.463911, -0.06316599, -1.938125, 1, 1, 1, 1, 1,
-1.463376, 0.2578698, -1.358749, 1, 1, 1, 1, 1,
-1.450732, 0.6647344, -1.01045, 1, 1, 1, 1, 1,
-1.447882, 1.661269, 0.2484211, 1, 1, 1, 1, 1,
-1.440688, 1.271646, -2.243087, 1, 1, 1, 1, 1,
-1.437436, 1.812012, -1.146717, 1, 1, 1, 1, 1,
-1.435543, -0.3125013, -3.806976, 1, 1, 1, 1, 1,
-1.431043, -2.002998, -0.8816383, 1, 1, 1, 1, 1,
-1.430844, 1.207124, -0.5626716, 1, 1, 1, 1, 1,
-1.430328, -0.05596856, -2.882826, 1, 1, 1, 1, 1,
-1.42406, 1.040289, -1.391706, 1, 1, 1, 1, 1,
-1.420248, 0.1743822, -1.055443, 0, 0, 1, 1, 1,
-1.415837, -0.09872039, -0.9109296, 1, 0, 0, 1, 1,
-1.39728, -0.473459, -1.995309, 1, 0, 0, 1, 1,
-1.386119, 0.5530644, -0.2226203, 1, 0, 0, 1, 1,
-1.38197, -0.9458171, -2.753845, 1, 0, 0, 1, 1,
-1.381224, -0.1641825, -2.249681, 1, 0, 0, 1, 1,
-1.378512, 0.3462727, -1.649062, 0, 0, 0, 1, 1,
-1.373172, 0.6013448, -0.5659854, 0, 0, 0, 1, 1,
-1.367731, -0.7552643, -1.145551, 0, 0, 0, 1, 1,
-1.364417, -1.231814, -1.64037, 0, 0, 0, 1, 1,
-1.359168, 1.076626, -0.8210068, 0, 0, 0, 1, 1,
-1.358878, 0.1294006, -0.7949775, 0, 0, 0, 1, 1,
-1.351583, -1.556723, -2.877486, 0, 0, 0, 1, 1,
-1.335719, 1.143549, -0.4372357, 1, 1, 1, 1, 1,
-1.333114, -0.9109523, -2.028037, 1, 1, 1, 1, 1,
-1.323163, -0.3366609, -1.703859, 1, 1, 1, 1, 1,
-1.320999, -0.6074594, -2.104355, 1, 1, 1, 1, 1,
-1.319195, -0.5479909, -2.366093, 1, 1, 1, 1, 1,
-1.296619, -0.1590203, -1.530602, 1, 1, 1, 1, 1,
-1.294066, 0.4382796, -2.80455, 1, 1, 1, 1, 1,
-1.287673, -0.9132633, -2.382683, 1, 1, 1, 1, 1,
-1.284561, -0.9797881, -2.585219, 1, 1, 1, 1, 1,
-1.274629, -0.04927269, -1.657489, 1, 1, 1, 1, 1,
-1.273093, 0.9505374, 0.03136522, 1, 1, 1, 1, 1,
-1.269199, 1.343172, -0.6120716, 1, 1, 1, 1, 1,
-1.25769, 1.227955, -1.950443, 1, 1, 1, 1, 1,
-1.25665, 0.4060745, -2.216197, 1, 1, 1, 1, 1,
-1.255869, -1.115725, -1.15468, 1, 1, 1, 1, 1,
-1.246636, -1.228045, -2.224328, 0, 0, 1, 1, 1,
-1.24288, -0.6371413, -2.871854, 1, 0, 0, 1, 1,
-1.237681, -1.13367, -1.799447, 1, 0, 0, 1, 1,
-1.223555, 0.5145001, -1.927385, 1, 0, 0, 1, 1,
-1.22102, -2.548916, -3.961802, 1, 0, 0, 1, 1,
-1.214814, -0.4241376, -0.8429266, 1, 0, 0, 1, 1,
-1.196423, -0.5688722, -1.435301, 0, 0, 0, 1, 1,
-1.182393, -0.2975106, -1.660782, 0, 0, 0, 1, 1,
-1.165149, -1.467322, -2.23647, 0, 0, 0, 1, 1,
-1.161508, -0.4210424, -2.311426, 0, 0, 0, 1, 1,
-1.161233, -0.6834371, -0.8350328, 0, 0, 0, 1, 1,
-1.152306, -0.8842109, -3.028493, 0, 0, 0, 1, 1,
-1.149128, 0.9440328, -2.816716, 0, 0, 0, 1, 1,
-1.14013, 1.373015, 0.2931311, 1, 1, 1, 1, 1,
-1.139779, 0.534472, -0.105507, 1, 1, 1, 1, 1,
-1.138945, -1.770567, -4.33386, 1, 1, 1, 1, 1,
-1.135905, 1.139527, -1.461537, 1, 1, 1, 1, 1,
-1.135086, 0.4711503, -1.087523, 1, 1, 1, 1, 1,
-1.131558, -2.026368, -2.671024, 1, 1, 1, 1, 1,
-1.124977, -0.121963, -2.751371, 1, 1, 1, 1, 1,
-1.123765, -0.7594095, -1.422906, 1, 1, 1, 1, 1,
-1.121646, 0.2769727, -2.008897, 1, 1, 1, 1, 1,
-1.11982, 0.6470629, -0.4795893, 1, 1, 1, 1, 1,
-1.110279, 2.089314, -0.6268301, 1, 1, 1, 1, 1,
-1.084017, -1.036783, -4.21957, 1, 1, 1, 1, 1,
-1.076668, -0.2948692, -3.863894, 1, 1, 1, 1, 1,
-1.071225, -1.462776, -2.993835, 1, 1, 1, 1, 1,
-1.071051, 0.4473864, -1.190599, 1, 1, 1, 1, 1,
-1.070189, -0.6266878, -1.251152, 0, 0, 1, 1, 1,
-1.066885, 0.3828846, -1.962536, 1, 0, 0, 1, 1,
-1.062204, -0.2013682, -1.094708, 1, 0, 0, 1, 1,
-1.051946, -0.01068232, -2.01553, 1, 0, 0, 1, 1,
-1.050761, 2.027187, -1.773805, 1, 0, 0, 1, 1,
-1.048005, 0.06068206, -2.167297, 1, 0, 0, 1, 1,
-1.037781, -1.190485, -4.406844, 0, 0, 0, 1, 1,
-1.029364, 1.288059, -2.267762, 0, 0, 0, 1, 1,
-1.022171, 0.4883046, -1.401266, 0, 0, 0, 1, 1,
-1.010572, -0.01213637, -1.733329, 0, 0, 0, 1, 1,
-1.007531, -0.4153699, -1.526655, 0, 0, 0, 1, 1,
-1.006294, 0.6140007, -3.55478, 0, 0, 0, 1, 1,
-1.004844, 2.038062, -1.518316, 0, 0, 0, 1, 1,
-1.003174, -0.325069, -1.871, 1, 1, 1, 1, 1,
-0.9997337, -0.09722366, -1.005335, 1, 1, 1, 1, 1,
-0.9980006, -0.4708443, -1.876127, 1, 1, 1, 1, 1,
-0.9952812, 1.575305, -1.260532, 1, 1, 1, 1, 1,
-0.994603, 0.5120348, -0.8422298, 1, 1, 1, 1, 1,
-0.9846122, 0.3467012, 0.3674059, 1, 1, 1, 1, 1,
-0.9827734, 2.544114, 0.9572443, 1, 1, 1, 1, 1,
-0.9811049, 2.638478, -1.390043, 1, 1, 1, 1, 1,
-0.9802786, -0.5490903, -2.116104, 1, 1, 1, 1, 1,
-0.9759141, 1.917347, -0.2561324, 1, 1, 1, 1, 1,
-0.9755927, 1.301241, -2.062936, 1, 1, 1, 1, 1,
-0.9712548, 0.2821359, -1.466351, 1, 1, 1, 1, 1,
-0.9705838, 0.5258797, -1.546368, 1, 1, 1, 1, 1,
-0.9641595, -0.2714352, -2.989014, 1, 1, 1, 1, 1,
-0.9620807, -0.3503152, -1.711626, 1, 1, 1, 1, 1,
-0.9591205, -0.01559687, -1.904471, 0, 0, 1, 1, 1,
-0.9583127, -1.515452, -1.753261, 1, 0, 0, 1, 1,
-0.9559198, -0.2628032, -2.651135, 1, 0, 0, 1, 1,
-0.9509714, 0.3507847, -1.112216, 1, 0, 0, 1, 1,
-0.9427887, -0.6079324, -1.244524, 1, 0, 0, 1, 1,
-0.9364485, 0.8676003, -0.8106616, 1, 0, 0, 1, 1,
-0.934819, -0.1136689, -3.218459, 0, 0, 0, 1, 1,
-0.9347866, -0.5799859, -2.428961, 0, 0, 0, 1, 1,
-0.9303628, 0.5318031, 0.7708245, 0, 0, 0, 1, 1,
-0.9294942, 0.005765826, -2.85073, 0, 0, 0, 1, 1,
-0.9255561, 0.6759728, 0.8395472, 0, 0, 0, 1, 1,
-0.9208468, 2.02944, 0.3604715, 0, 0, 0, 1, 1,
-0.9197907, -0.3752103, -1.541929, 0, 0, 0, 1, 1,
-0.9190972, -0.1509699, -2.065499, 1, 1, 1, 1, 1,
-0.9190843, 0.08846819, -2.616341, 1, 1, 1, 1, 1,
-0.917437, 0.2074744, -0.7336249, 1, 1, 1, 1, 1,
-0.9129249, -1.100996, -3.410231, 1, 1, 1, 1, 1,
-0.9078696, -1.332927, -2.594069, 1, 1, 1, 1, 1,
-0.9027228, 2.217402, -0.6089035, 1, 1, 1, 1, 1,
-0.8969709, -0.03015918, -3.289763, 1, 1, 1, 1, 1,
-0.8956933, 0.6054121, -2.327307, 1, 1, 1, 1, 1,
-0.8863177, 2.283341, -0.1963281, 1, 1, 1, 1, 1,
-0.8813774, 1.615023, 1.381196, 1, 1, 1, 1, 1,
-0.8764259, 0.8671775, -0.5803919, 1, 1, 1, 1, 1,
-0.8740571, -0.6261385, -0.9144571, 1, 1, 1, 1, 1,
-0.8732501, 2.808918, -0.7977481, 1, 1, 1, 1, 1,
-0.8727777, 0.05589006, -2.646034, 1, 1, 1, 1, 1,
-0.8698119, -0.5211108, -0.315213, 1, 1, 1, 1, 1,
-0.8628057, -0.7681434, -1.443856, 0, 0, 1, 1, 1,
-0.8587042, -0.3216671, -0.5469311, 1, 0, 0, 1, 1,
-0.8580966, 0.4753148, -2.479084, 1, 0, 0, 1, 1,
-0.8578303, 0.9336121, -1.732911, 1, 0, 0, 1, 1,
-0.8528326, -1.450888, -2.005941, 1, 0, 0, 1, 1,
-0.8518788, -0.8755029, -1.891798, 1, 0, 0, 1, 1,
-0.8505614, -0.2685796, -2.888227, 0, 0, 0, 1, 1,
-0.8462769, 0.6365964, -0.4152064, 0, 0, 0, 1, 1,
-0.8457909, -0.460622, -2.643242, 0, 0, 0, 1, 1,
-0.8450409, -0.4799851, -2.067506, 0, 0, 0, 1, 1,
-0.843067, 0.2970217, -0.6856918, 0, 0, 0, 1, 1,
-0.836855, 0.311974, -0.9947885, 0, 0, 0, 1, 1,
-0.8357771, 0.9477597, -2.620622, 0, 0, 0, 1, 1,
-0.8318729, -0.9957061, -1.726661, 1, 1, 1, 1, 1,
-0.8296801, -0.2897746, -2.21523, 1, 1, 1, 1, 1,
-0.8237948, -0.9848983, -2.860137, 1, 1, 1, 1, 1,
-0.8213977, -0.6684682, -2.027215, 1, 1, 1, 1, 1,
-0.8165646, -0.6497314, -1.746004, 1, 1, 1, 1, 1,
-0.8133451, 1.085511, -2.152246, 1, 1, 1, 1, 1,
-0.8093883, 0.5252258, -0.5211598, 1, 1, 1, 1, 1,
-0.8021066, 0.4190884, -1.275272, 1, 1, 1, 1, 1,
-0.7931405, 0.2547903, -0.7383715, 1, 1, 1, 1, 1,
-0.789959, -1.173106, -1.782764, 1, 1, 1, 1, 1,
-0.7892472, 1.295231, 0.34441, 1, 1, 1, 1, 1,
-0.784541, -0.3046517, -3.971247, 1, 1, 1, 1, 1,
-0.7817068, 1.547783, 0.5394475, 1, 1, 1, 1, 1,
-0.7816361, 1.323884, -0.6306598, 1, 1, 1, 1, 1,
-0.7814541, -1.342431, -6.64636, 1, 1, 1, 1, 1,
-0.7798191, 0.2608047, -1.995723, 0, 0, 1, 1, 1,
-0.7767119, -0.56337, -2.044052, 1, 0, 0, 1, 1,
-0.7755643, 1.304629, -0.09600643, 1, 0, 0, 1, 1,
-0.7752724, 0.1808202, -2.409087, 1, 0, 0, 1, 1,
-0.7735031, -0.9574837, -3.992965, 1, 0, 0, 1, 1,
-0.7731594, -0.01908355, 0.455952, 1, 0, 0, 1, 1,
-0.7692038, -0.4731422, -2.135497, 0, 0, 0, 1, 1,
-0.767566, 1.410957, 0.7382877, 0, 0, 0, 1, 1,
-0.7656688, -0.7431723, -2.144222, 0, 0, 0, 1, 1,
-0.7512255, 0.7836131, 0.3254165, 0, 0, 0, 1, 1,
-0.7511445, 0.7091888, -2.269122, 0, 0, 0, 1, 1,
-0.750213, 0.9041411, -0.4503419, 0, 0, 0, 1, 1,
-0.7487463, 0.6047634, -0.8951561, 0, 0, 0, 1, 1,
-0.7478946, -0.799944, -3.906065, 1, 1, 1, 1, 1,
-0.7459568, -1.108388, -1.177416, 1, 1, 1, 1, 1,
-0.7386252, 1.140316, -3.599257, 1, 1, 1, 1, 1,
-0.7349545, -0.9009802, -1.773593, 1, 1, 1, 1, 1,
-0.7348932, 0.2052031, 1.571043, 1, 1, 1, 1, 1,
-0.7291896, -0.06920733, -2.623848, 1, 1, 1, 1, 1,
-0.725206, -0.4958336, -2.066325, 1, 1, 1, 1, 1,
-0.7248875, 1.43948, -0.2948667, 1, 1, 1, 1, 1,
-0.7203154, -0.5729635, -0.4777839, 1, 1, 1, 1, 1,
-0.7178822, -0.03424806, 0.5653217, 1, 1, 1, 1, 1,
-0.7160081, -0.08936714, -2.013384, 1, 1, 1, 1, 1,
-0.711611, -1.385163, -2.417321, 1, 1, 1, 1, 1,
-0.7092618, 0.8322068, -2.037012, 1, 1, 1, 1, 1,
-0.7064403, -1.304471, -1.268851, 1, 1, 1, 1, 1,
-0.7057487, 0.8551546, -0.5879595, 1, 1, 1, 1, 1,
-0.7012565, 1.04375, -0.691852, 0, 0, 1, 1, 1,
-0.6998017, 0.9510486, -0.9733259, 1, 0, 0, 1, 1,
-0.6942939, 0.9676172, -1.803199, 1, 0, 0, 1, 1,
-0.6938754, -1.671348, -1.992758, 1, 0, 0, 1, 1,
-0.6936678, 0.6147187, -1.040151, 1, 0, 0, 1, 1,
-0.6918297, 0.2425532, -2.034611, 1, 0, 0, 1, 1,
-0.6907128, -0.2558826, -2.007543, 0, 0, 0, 1, 1,
-0.6897464, 0.224113, -1.934737, 0, 0, 0, 1, 1,
-0.6885092, 0.2660624, -1.375816, 0, 0, 0, 1, 1,
-0.688078, 0.05883008, -0.3493922, 0, 0, 0, 1, 1,
-0.6837643, 0.3319643, -0.3391568, 0, 0, 0, 1, 1,
-0.677958, -0.4482866, -2.702568, 0, 0, 0, 1, 1,
-0.6727865, 0.9275327, 1.346121, 0, 0, 0, 1, 1,
-0.670225, -1.46279, -3.318604, 1, 1, 1, 1, 1,
-0.6701527, -0.6052334, -1.486738, 1, 1, 1, 1, 1,
-0.6690726, -1.453886, -2.582994, 1, 1, 1, 1, 1,
-0.6656206, -0.1999501, -3.274689, 1, 1, 1, 1, 1,
-0.6653204, 0.07987472, -2.084407, 1, 1, 1, 1, 1,
-0.6637731, -0.4549928, -2.113569, 1, 1, 1, 1, 1,
-0.6619333, 0.9605358, 0.3620523, 1, 1, 1, 1, 1,
-0.6550282, -0.2266385, -3.200035, 1, 1, 1, 1, 1,
-0.6529456, -0.8387016, -3.397305, 1, 1, 1, 1, 1,
-0.6483883, -0.1132177, -2.094102, 1, 1, 1, 1, 1,
-0.6432212, 0.5216422, 1.024582, 1, 1, 1, 1, 1,
-0.6391651, 0.2816835, -1.246876, 1, 1, 1, 1, 1,
-0.6351014, -0.004634258, -1.944441, 1, 1, 1, 1, 1,
-0.6324804, -0.5202251, -3.144452, 1, 1, 1, 1, 1,
-0.6277698, -0.7180627, -1.095724, 1, 1, 1, 1, 1,
-0.6246798, 0.05523274, -0.5679103, 0, 0, 1, 1, 1,
-0.624204, 1.444138, -0.07356373, 1, 0, 0, 1, 1,
-0.6200994, -1.362326, -2.79239, 1, 0, 0, 1, 1,
-0.6143451, 1.223077, -0.7400429, 1, 0, 0, 1, 1,
-0.6070587, -0.9382464, -3.059465, 1, 0, 0, 1, 1,
-0.60655, 0.6680121, -0.8457271, 1, 0, 0, 1, 1,
-0.6053363, 0.5299198, -0.488155, 0, 0, 0, 1, 1,
-0.6047801, 2.321485, -0.3309326, 0, 0, 0, 1, 1,
-0.602459, -0.9884214, -2.634259, 0, 0, 0, 1, 1,
-0.5996421, 0.8745567, 0.1846612, 0, 0, 0, 1, 1,
-0.5994314, -1.167851, -1.079548, 0, 0, 0, 1, 1,
-0.5978751, -0.6439499, -3.073965, 0, 0, 0, 1, 1,
-0.5970009, -1.264861, -2.114482, 0, 0, 0, 1, 1,
-0.5865745, -1.184661, -0.7656925, 1, 1, 1, 1, 1,
-0.5842156, -2.022419, -1.546618, 1, 1, 1, 1, 1,
-0.5832337, -1.013638, -3.925985, 1, 1, 1, 1, 1,
-0.5828888, 0.3448675, -1.084932, 1, 1, 1, 1, 1,
-0.5808696, 0.2172453, -1.853086, 1, 1, 1, 1, 1,
-0.5807233, 0.7310296, -2.1031, 1, 1, 1, 1, 1,
-0.5799605, -0.2056337, -1.556298, 1, 1, 1, 1, 1,
-0.5760765, 0.5263326, -1.069303, 1, 1, 1, 1, 1,
-0.5718879, 0.3974451, 0.4867165, 1, 1, 1, 1, 1,
-0.5712627, 0.3365318, -0.7949476, 1, 1, 1, 1, 1,
-0.5669622, 0.3023809, -2.560139, 1, 1, 1, 1, 1,
-0.564073, 0.9101415, 0.2035801, 1, 1, 1, 1, 1,
-0.5621226, 2.008713, 1.268102, 1, 1, 1, 1, 1,
-0.5607418, 0.9492284, -0.5540631, 1, 1, 1, 1, 1,
-0.5606027, 0.1398479, -0.7360235, 1, 1, 1, 1, 1,
-0.5582838, -0.2105257, -1.861418, 0, 0, 1, 1, 1,
-0.5540651, -1.05883, -4.224904, 1, 0, 0, 1, 1,
-0.5524351, 1.485217, -0.07327133, 1, 0, 0, 1, 1,
-0.5515216, -0.2071, -2.113331, 1, 0, 0, 1, 1,
-0.5511198, 0.3518718, 0.279359, 1, 0, 0, 1, 1,
-0.5505252, -1.411869, -2.61642, 1, 0, 0, 1, 1,
-0.5497149, 0.3339979, 0.1493139, 0, 0, 0, 1, 1,
-0.5385857, -0.432409, -1.530589, 0, 0, 0, 1, 1,
-0.5378727, -1.267167, -2.877473, 0, 0, 0, 1, 1,
-0.5314049, -0.06800018, -1.947466, 0, 0, 0, 1, 1,
-0.5302159, -1.457641, -0.102983, 0, 0, 0, 1, 1,
-0.5302112, -1.035646, -3.757199, 0, 0, 0, 1, 1,
-0.5260078, 0.172139, -1.753749, 0, 0, 0, 1, 1,
-0.5259129, 0.1710068, -0.002190522, 1, 1, 1, 1, 1,
-0.5187861, 0.1279086, -1.824273, 1, 1, 1, 1, 1,
-0.5162981, -0.04554017, -1.796021, 1, 1, 1, 1, 1,
-0.5061061, 0.48709, -0.8506306, 1, 1, 1, 1, 1,
-0.5036578, 0.02963154, -2.697797, 1, 1, 1, 1, 1,
-0.5030233, 0.8027157, -1.369476, 1, 1, 1, 1, 1,
-0.4966073, 0.1194759, -3.245161, 1, 1, 1, 1, 1,
-0.4951077, 0.2516752, -2.375536, 1, 1, 1, 1, 1,
-0.4926076, 1.731459, -0.95164, 1, 1, 1, 1, 1,
-0.4880701, -0.2621635, -4.375661, 1, 1, 1, 1, 1,
-0.4877401, 0.007277483, -1.163154, 1, 1, 1, 1, 1,
-0.4873456, -0.02868385, -1.996265, 1, 1, 1, 1, 1,
-0.4864329, 0.3445523, -1.815354, 1, 1, 1, 1, 1,
-0.4856613, 0.5177076, -1.528756, 1, 1, 1, 1, 1,
-0.4854405, 0.7833579, -0.7983939, 1, 1, 1, 1, 1,
-0.4822901, -1.389204, -1.88291, 0, 0, 1, 1, 1,
-0.4799321, 2.015595, -1.651195, 1, 0, 0, 1, 1,
-0.4767388, 0.7316605, -0.3770642, 1, 0, 0, 1, 1,
-0.4762289, 0.4723073, -0.7163764, 1, 0, 0, 1, 1,
-0.4739559, -0.9470028, -3.593284, 1, 0, 0, 1, 1,
-0.4718465, -0.2605724, -1.200329, 1, 0, 0, 1, 1,
-0.4653012, -0.05961786, -2.20494, 0, 0, 0, 1, 1,
-0.4621246, -1.786851, -2.743627, 0, 0, 0, 1, 1,
-0.4561329, -1.120738, -4.124466, 0, 0, 0, 1, 1,
-0.4529454, 0.5585232, -2.229937, 0, 0, 0, 1, 1,
-0.4503397, 0.8161557, 0.2395585, 0, 0, 0, 1, 1,
-0.4500361, 0.38635, -1.392582, 0, 0, 0, 1, 1,
-0.4429432, -1.391351, -4.239063, 0, 0, 0, 1, 1,
-0.4422331, -0.3130353, -0.4335833, 1, 1, 1, 1, 1,
-0.4420883, -0.06755619, -2.016911, 1, 1, 1, 1, 1,
-0.4411957, 1.076625, -0.6234489, 1, 1, 1, 1, 1,
-0.4403399, 0.6784642, 0.226696, 1, 1, 1, 1, 1,
-0.4335872, -0.3163483, -1.495938, 1, 1, 1, 1, 1,
-0.4286552, -0.3183259, -3.090379, 1, 1, 1, 1, 1,
-0.422976, 1.824263, -0.9726747, 1, 1, 1, 1, 1,
-0.4146657, -0.1918838, -0.9863787, 1, 1, 1, 1, 1,
-0.4136287, -0.8903057, -1.956757, 1, 1, 1, 1, 1,
-0.409996, -0.7062925, -1.969506, 1, 1, 1, 1, 1,
-0.4088414, -0.07233766, -1.131687, 1, 1, 1, 1, 1,
-0.4088059, -0.7185026, -1.729802, 1, 1, 1, 1, 1,
-0.4068713, 0.9873487, 1.230465, 1, 1, 1, 1, 1,
-0.4063144, -1.038787, -2.401744, 1, 1, 1, 1, 1,
-0.4040684, 1.281955, 0.7769142, 1, 1, 1, 1, 1,
-0.3909948, -0.5620404, -1.304053, 0, 0, 1, 1, 1,
-0.3784218, 1.741046, -0.1643555, 1, 0, 0, 1, 1,
-0.3758848, -0.1927342, -1.663654, 1, 0, 0, 1, 1,
-0.3695942, -0.9741753, -3.480751, 1, 0, 0, 1, 1,
-0.3678956, -0.9998019, -2.171334, 1, 0, 0, 1, 1,
-0.3641858, 0.7030119, 1.000691, 1, 0, 0, 1, 1,
-0.36103, 0.5123089, 1.313509, 0, 0, 0, 1, 1,
-0.3584784, 2.232573, 0.3090679, 0, 0, 0, 1, 1,
-0.3575391, -0.1456598, -2.326723, 0, 0, 0, 1, 1,
-0.3514885, 0.50261, -0.7562742, 0, 0, 0, 1, 1,
-0.3497092, -0.6372581, -3.410856, 0, 0, 0, 1, 1,
-0.3483853, -0.7523873, -5.288465, 0, 0, 0, 1, 1,
-0.3469526, 0.4170471, -0.7598817, 0, 0, 0, 1, 1,
-0.3450811, -1.500309, -3.958493, 1, 1, 1, 1, 1,
-0.3441315, 0.1522834, -1.727364, 1, 1, 1, 1, 1,
-0.3404186, -0.1766203, -1.770909, 1, 1, 1, 1, 1,
-0.3393176, -1.231328, -2.396592, 1, 1, 1, 1, 1,
-0.3376978, 0.6305246, -0.5213408, 1, 1, 1, 1, 1,
-0.3341943, 0.7179002, -1.435845, 1, 1, 1, 1, 1,
-0.3308451, -1.678123, -3.764734, 1, 1, 1, 1, 1,
-0.3306281, 1.219603, 0.6446984, 1, 1, 1, 1, 1,
-0.3282976, -0.7371834, -3.451918, 1, 1, 1, 1, 1,
-0.3280285, 0.6665953, -2.142739, 1, 1, 1, 1, 1,
-0.3272803, 0.07071247, -1.759867, 1, 1, 1, 1, 1,
-0.3247508, 0.9982303, -0.5345793, 1, 1, 1, 1, 1,
-0.3241551, -0.1524718, -2.121412, 1, 1, 1, 1, 1,
-0.3234665, -1.13036, -4.794132, 1, 1, 1, 1, 1,
-0.3224067, -0.5457942, -4.619322, 1, 1, 1, 1, 1,
-0.3211603, -0.2646284, -2.731587, 0, 0, 1, 1, 1,
-0.3161444, 0.5473835, 0.1385928, 1, 0, 0, 1, 1,
-0.3151949, 1.225905, 1.644634, 1, 0, 0, 1, 1,
-0.3134819, -0.3194288, -2.621452, 1, 0, 0, 1, 1,
-0.3128825, -1.031653, -5.210322, 1, 0, 0, 1, 1,
-0.3121348, -0.3202947, -1.965611, 1, 0, 0, 1, 1,
-0.3119482, -0.9978942, -2.537181, 0, 0, 0, 1, 1,
-0.3101317, -0.6442453, -3.908912, 0, 0, 0, 1, 1,
-0.3062971, 0.7630674, 0.9991933, 0, 0, 0, 1, 1,
-0.3047084, 0.6193255, -0.07215338, 0, 0, 0, 1, 1,
-0.3045404, -0.1925164, -3.192804, 0, 0, 0, 1, 1,
-0.3006396, -0.5410228, -3.248493, 0, 0, 0, 1, 1,
-0.2922463, -0.5997343, -1.327057, 0, 0, 0, 1, 1,
-0.2909866, -1.361706, -3.516566, 1, 1, 1, 1, 1,
-0.2898546, -1.754809, -2.764385, 1, 1, 1, 1, 1,
-0.2877375, -0.8536553, -2.609121, 1, 1, 1, 1, 1,
-0.2806536, 0.007701739, -2.22103, 1, 1, 1, 1, 1,
-0.270373, 1.579845, 0.4237103, 1, 1, 1, 1, 1,
-0.2629912, 0.6930825, 0.1994614, 1, 1, 1, 1, 1,
-0.2622561, -0.0196751, -0.2938683, 1, 1, 1, 1, 1,
-0.2619973, -0.6947644, -1.956516, 1, 1, 1, 1, 1,
-0.2565724, -0.09756714, -1.903465, 1, 1, 1, 1, 1,
-0.2521689, 0.3124447, -1.232187, 1, 1, 1, 1, 1,
-0.2500692, 0.1211133, -1.263425, 1, 1, 1, 1, 1,
-0.2487752, -0.9499443, -1.701721, 1, 1, 1, 1, 1,
-0.2457097, -0.4338221, -2.593325, 1, 1, 1, 1, 1,
-0.2411202, -0.8723727, -2.210024, 1, 1, 1, 1, 1,
-0.2385366, 0.7597669, 0.9395974, 1, 1, 1, 1, 1,
-0.2369196, -0.1413451, -2.817319, 0, 0, 1, 1, 1,
-0.2334301, 0.7002446, -1.645817, 1, 0, 0, 1, 1,
-0.2326068, 1.148311, -1.683313, 1, 0, 0, 1, 1,
-0.2188111, -0.6119794, -3.159503, 1, 0, 0, 1, 1,
-0.211303, 2.252752, 0.5509229, 1, 0, 0, 1, 1,
-0.21053, 0.3163043, -0.8508619, 1, 0, 0, 1, 1,
-0.2057629, 0.889644, -2.262055, 0, 0, 0, 1, 1,
-0.2052949, -0.9106754, -4.064643, 0, 0, 0, 1, 1,
-0.1996201, 0.5775483, -0.3797189, 0, 0, 0, 1, 1,
-0.1953767, 1.798673, 1.59475, 0, 0, 0, 1, 1,
-0.1942342, -2.033544, -2.49046, 0, 0, 0, 1, 1,
-0.1938822, -0.3896426, -3.229916, 0, 0, 0, 1, 1,
-0.1913532, -0.9619455, -2.274954, 0, 0, 0, 1, 1,
-0.180642, -0.7949224, -4.617904, 1, 1, 1, 1, 1,
-0.1804538, -0.05055426, -1.733753, 1, 1, 1, 1, 1,
-0.1793518, -0.9893485, -1.333186, 1, 1, 1, 1, 1,
-0.1744682, -0.8508836, -2.206179, 1, 1, 1, 1, 1,
-0.1735287, -1.39013, -5.16131, 1, 1, 1, 1, 1,
-0.17241, 1.064441, -1.694205, 1, 1, 1, 1, 1,
-0.1698622, 1.377992, 0.4311848, 1, 1, 1, 1, 1,
-0.1669258, -1.53536, -2.011512, 1, 1, 1, 1, 1,
-0.1666515, 0.8503599, -1.461989, 1, 1, 1, 1, 1,
-0.1644777, 0.8024482, -2.637812, 1, 1, 1, 1, 1,
-0.1632969, -0.7540329, -3.528148, 1, 1, 1, 1, 1,
-0.1555736, -0.7855444, -3.577104, 1, 1, 1, 1, 1,
-0.1519553, 0.5981009, -1.43537, 1, 1, 1, 1, 1,
-0.1508816, 0.06135628, -2.484708, 1, 1, 1, 1, 1,
-0.1498241, -1.404875, -4.993026, 1, 1, 1, 1, 1,
-0.1461483, -0.8656623, -3.869708, 0, 0, 1, 1, 1,
-0.1456947, -1.858964, -3.11501, 1, 0, 0, 1, 1,
-0.1418751, 0.5116829, 0.4341657, 1, 0, 0, 1, 1,
-0.1305784, 2.495357, -1.543354, 1, 0, 0, 1, 1,
-0.1301374, 1.559899, 0.4372701, 1, 0, 0, 1, 1,
-0.1277997, 1.005014, -1.760692, 1, 0, 0, 1, 1,
-0.1269946, 1.223257, 0.3812887, 0, 0, 0, 1, 1,
-0.1219621, 1.281416, 0.3310181, 0, 0, 0, 1, 1,
-0.1205604, -0.3051412, -2.206269, 0, 0, 0, 1, 1,
-0.1197693, 0.1945547, -1.448321, 0, 0, 0, 1, 1,
-0.1172213, 1.809906, -1.677226, 0, 0, 0, 1, 1,
-0.1157141, 0.7123973, -0.6378606, 0, 0, 0, 1, 1,
-0.112711, -0.168996, -1.983186, 0, 0, 0, 1, 1,
-0.1097926, -0.9692759, -1.366895, 1, 1, 1, 1, 1,
-0.103328, 0.2777808, 0.1358965, 1, 1, 1, 1, 1,
-0.09897447, 0.3980136, 0.2623542, 1, 1, 1, 1, 1,
-0.09114388, 0.2478617, -0.8638466, 1, 1, 1, 1, 1,
-0.09105902, -0.5839141, -3.049076, 1, 1, 1, 1, 1,
-0.08783, 0.0350927, -1.494442, 1, 1, 1, 1, 1,
-0.08682781, -0.1747499, 0.4655855, 1, 1, 1, 1, 1,
-0.08671957, 0.1285089, -3.948051, 1, 1, 1, 1, 1,
-0.08087324, -0.5483166, -3.948331, 1, 1, 1, 1, 1,
-0.0776158, -0.8719804, -3.681588, 1, 1, 1, 1, 1,
-0.07664879, -0.3735956, -4.019511, 1, 1, 1, 1, 1,
-0.07415934, -0.1464019, -1.687683, 1, 1, 1, 1, 1,
-0.07386097, -0.9890855, -1.802025, 1, 1, 1, 1, 1,
-0.07348341, -0.4690904, -3.065454, 1, 1, 1, 1, 1,
-0.07262316, -0.9996118, -2.845857, 1, 1, 1, 1, 1,
-0.07220137, 1.857641, -0.8218868, 0, 0, 1, 1, 1,
-0.06942009, 0.07920878, -1.140987, 1, 0, 0, 1, 1,
-0.06912571, 1.029153, -0.6931235, 1, 0, 0, 1, 1,
-0.06135024, 0.7594922, -0.01678762, 1, 0, 0, 1, 1,
-0.06068592, 1.248031, 1.047773, 1, 0, 0, 1, 1,
-0.05972825, 0.2989969, -1.091105, 1, 0, 0, 1, 1,
-0.05742935, -0.48992, -2.043478, 0, 0, 0, 1, 1,
-0.05538454, -1.091946, -4.571758, 0, 0, 0, 1, 1,
-0.05501451, 1.033117, -1.306575, 0, 0, 0, 1, 1,
-0.04831855, -1.235678, -3.776875, 0, 0, 0, 1, 1,
-0.0433473, 0.3280094, -0.8131713, 0, 0, 0, 1, 1,
-0.04119602, -0.3531448, -2.627142, 0, 0, 0, 1, 1,
-0.03866832, 1.540567, 0.004641179, 0, 0, 0, 1, 1,
-0.038392, -0.6303925, -3.875119, 1, 1, 1, 1, 1,
-0.03826595, 0.7258577, -0.1111159, 1, 1, 1, 1, 1,
-0.0345934, 0.8426584, -0.3974924, 1, 1, 1, 1, 1,
-0.03421184, 0.389364, 0.2608867, 1, 1, 1, 1, 1,
-0.03185335, 1.733076, -1.659213, 1, 1, 1, 1, 1,
-0.02974004, -0.56964, -3.133683, 1, 1, 1, 1, 1,
-0.02934724, 0.8182428, -0.4143695, 1, 1, 1, 1, 1,
-0.02928073, -1.397057, -2.14484, 1, 1, 1, 1, 1,
-0.02628146, 0.8164932, -0.3994075, 1, 1, 1, 1, 1,
-0.02292793, 0.03188711, -0.9425591, 1, 1, 1, 1, 1,
-0.01832329, 1.223633, 1.328247, 1, 1, 1, 1, 1,
-0.01774082, 0.516692, -0.01202607, 1, 1, 1, 1, 1,
-0.01711171, -1.196309, -3.703748, 1, 1, 1, 1, 1,
-0.01580321, -0.1528527, -1.32014, 1, 1, 1, 1, 1,
-0.01560905, -0.6293945, -2.428063, 1, 1, 1, 1, 1,
-0.01560291, -0.9182314, -1.54962, 0, 0, 1, 1, 1,
-0.009611481, -0.6218151, -2.714194, 1, 0, 0, 1, 1,
-0.009568257, -1.664683, -3.256751, 1, 0, 0, 1, 1,
-0.007637226, -0.941394, -2.983334, 1, 0, 0, 1, 1,
-0.007333237, 0.3941752, 0.5573816, 1, 0, 0, 1, 1,
-0.002896752, 0.4767751, 1.606773, 1, 0, 0, 1, 1,
-0.001876753, 0.03454858, -3.086362, 0, 0, 0, 1, 1,
0.004966914, -1.16364, 3.064986, 0, 0, 0, 1, 1,
0.00590334, 2.343548, -0.1459669, 0, 0, 0, 1, 1,
0.00719963, -0.4686269, 0.8131713, 0, 0, 0, 1, 1,
0.007590009, 1.023761, -2.667326, 0, 0, 0, 1, 1,
0.008737169, -0.3807131, 3.965098, 0, 0, 0, 1, 1,
0.009268251, -0.9292482, 2.772271, 0, 0, 0, 1, 1,
0.009550121, -0.446445, 3.231025, 1, 1, 1, 1, 1,
0.01248694, -0.1876758, 2.410135, 1, 1, 1, 1, 1,
0.01588616, -0.4502273, 1.564568, 1, 1, 1, 1, 1,
0.02477728, 1.019132, 0.6612052, 1, 1, 1, 1, 1,
0.0313219, -1.785632, 3.386075, 1, 1, 1, 1, 1,
0.03293867, 0.05463595, 0.2315988, 1, 1, 1, 1, 1,
0.03362502, 0.9425911, -0.5124598, 1, 1, 1, 1, 1,
0.03449439, -2.179133, 3.100667, 1, 1, 1, 1, 1,
0.03655203, 0.1840442, 0.4239078, 1, 1, 1, 1, 1,
0.0370142, 2.103543, 0.1157957, 1, 1, 1, 1, 1,
0.03862652, 0.3800008, -0.465883, 1, 1, 1, 1, 1,
0.04101872, 0.005214147, 2.199005, 1, 1, 1, 1, 1,
0.04188064, 1.496597, -1.045293, 1, 1, 1, 1, 1,
0.0418812, -0.2994914, 5.420537, 1, 1, 1, 1, 1,
0.04792487, -0.05898556, 3.099886, 1, 1, 1, 1, 1,
0.05303402, -0.678964, 1.901075, 0, 0, 1, 1, 1,
0.05850556, -1.120206, 2.408213, 1, 0, 0, 1, 1,
0.06083142, 1.112452, 0.1736971, 1, 0, 0, 1, 1,
0.06115706, 1.777601, -0.09627146, 1, 0, 0, 1, 1,
0.06126959, 1.470951, 0.2481869, 1, 0, 0, 1, 1,
0.06575456, 0.8035551, 1.507536, 1, 0, 0, 1, 1,
0.06953076, 0.05579715, 2.845422, 0, 0, 0, 1, 1,
0.07079241, 0.9136041, 0.7637323, 0, 0, 0, 1, 1,
0.07518682, -0.01049539, 1.091062, 0, 0, 0, 1, 1,
0.07693455, -0.8583015, 3.566742, 0, 0, 0, 1, 1,
0.07710641, -1.267206, 2.995579, 0, 0, 0, 1, 1,
0.0781196, 1.077863, 0.0805347, 0, 0, 0, 1, 1,
0.08159561, 1.047789, 0.06957531, 0, 0, 0, 1, 1,
0.08409991, 1.281197, 0.8270445, 1, 1, 1, 1, 1,
0.08455115, 0.7121964, 0.5605972, 1, 1, 1, 1, 1,
0.0862588, -0.2385767, 2.705801, 1, 1, 1, 1, 1,
0.08835531, -0.7031593, 3.284439, 1, 1, 1, 1, 1,
0.09006415, 0.2692372, -0.5829343, 1, 1, 1, 1, 1,
0.09340428, 0.8379653, -0.1784643, 1, 1, 1, 1, 1,
0.09661441, 3.757416, -0.7035078, 1, 1, 1, 1, 1,
0.09740383, 0.5121511, -0.5610958, 1, 1, 1, 1, 1,
0.09810751, 0.6616234, 2.313905, 1, 1, 1, 1, 1,
0.1071953, 0.4052579, -0.04044179, 1, 1, 1, 1, 1,
0.1100004, 0.7634879, 0.1818619, 1, 1, 1, 1, 1,
0.1104422, 2.819537, 1.431085, 1, 1, 1, 1, 1,
0.1179681, 0.7193328, 1.181223, 1, 1, 1, 1, 1,
0.1182658, 0.561547, -0.3720657, 1, 1, 1, 1, 1,
0.1204636, -0.4201243, 2.70372, 1, 1, 1, 1, 1,
0.1211207, 0.01007561, -0.06256355, 0, 0, 1, 1, 1,
0.1259189, -0.6030478, 1.222621, 1, 0, 0, 1, 1,
0.1317165, 0.2975314, -0.1534743, 1, 0, 0, 1, 1,
0.1343621, -1.66127, 2.487958, 1, 0, 0, 1, 1,
0.1346266, -0.5460346, 2.974128, 1, 0, 0, 1, 1,
0.13739, -0.6045035, 1.699448, 1, 0, 0, 1, 1,
0.1419042, -0.338338, 3.189175, 0, 0, 0, 1, 1,
0.1432924, -1.567988, 2.710403, 0, 0, 0, 1, 1,
0.1514223, 1.536481, 0.03376843, 0, 0, 0, 1, 1,
0.1525513, -2.107807, 2.178272, 0, 0, 0, 1, 1,
0.1529656, -0.1662428, 1.128639, 0, 0, 0, 1, 1,
0.1625139, -0.2945979, 2.093003, 0, 0, 0, 1, 1,
0.1634787, -1.195159, 2.936747, 0, 0, 0, 1, 1,
0.1639139, -1.496798, 5.111753, 1, 1, 1, 1, 1,
0.1646768, -0.8394327, 0.8980458, 1, 1, 1, 1, 1,
0.1658183, 0.9554111, 0.5460518, 1, 1, 1, 1, 1,
0.1660412, 1.151695, -0.5460977, 1, 1, 1, 1, 1,
0.1667926, 0.6403141, 2.482376, 1, 1, 1, 1, 1,
0.1684872, 1.013131, -0.9967151, 1, 1, 1, 1, 1,
0.1689737, -0.8707736, 2.217983, 1, 1, 1, 1, 1,
0.1720194, -0.6533754, 3.414093, 1, 1, 1, 1, 1,
0.173754, 0.7543349, -0.1959323, 1, 1, 1, 1, 1,
0.1761544, 1.738374, 0.1696952, 1, 1, 1, 1, 1,
0.1773741, -0.2304006, 1.636612, 1, 1, 1, 1, 1,
0.1784194, -1.638653, 3.288256, 1, 1, 1, 1, 1,
0.1802542, 1.006368, 0.2345903, 1, 1, 1, 1, 1,
0.1835708, 0.01785075, 1.717803, 1, 1, 1, 1, 1,
0.1857529, 1.703194, 0.04202131, 1, 1, 1, 1, 1,
0.1915237, -0.6312358, 3.522369, 0, 0, 1, 1, 1,
0.19439, -0.8559455, 3.188921, 1, 0, 0, 1, 1,
0.1958386, 0.04985961, 0.7024215, 1, 0, 0, 1, 1,
0.2027734, -0.4183746, 1.392508, 1, 0, 0, 1, 1,
0.2066239, -1.763771, 4.279157, 1, 0, 0, 1, 1,
0.208608, 1.450506, 0.6203673, 1, 0, 0, 1, 1,
0.2086255, -0.06865459, 2.375547, 0, 0, 0, 1, 1,
0.2095599, -1.433259, 4.008992, 0, 0, 0, 1, 1,
0.2189154, 0.756676, -0.7730324, 0, 0, 0, 1, 1,
0.2197628, 0.1763698, 2.350769, 0, 0, 0, 1, 1,
0.2201314, -0.520922, 2.61867, 0, 0, 0, 1, 1,
0.2225851, -1.769311, 3.004333, 0, 0, 0, 1, 1,
0.2233166, 0.1019935, 0.2511185, 0, 0, 0, 1, 1,
0.2264123, -0.6676925, 1.892206, 1, 1, 1, 1, 1,
0.2293698, 1.400873, 1.957041, 1, 1, 1, 1, 1,
0.2302988, -0.2780584, 2.538812, 1, 1, 1, 1, 1,
0.2312976, -0.1679224, 3.417176, 1, 1, 1, 1, 1,
0.2330715, 1.816764, 2.165001, 1, 1, 1, 1, 1,
0.2347038, -0.6213964, 5.032096, 1, 1, 1, 1, 1,
0.2361701, 0.009558814, 2.052742, 1, 1, 1, 1, 1,
0.2391178, 0.02080317, 1.369422, 1, 1, 1, 1, 1,
0.2411599, -0.7000079, 4.752881, 1, 1, 1, 1, 1,
0.2418201, 0.1323529, 1.62479, 1, 1, 1, 1, 1,
0.2463382, 0.9082449, 0.4739532, 1, 1, 1, 1, 1,
0.248017, 1.103613, 0.8577057, 1, 1, 1, 1, 1,
0.2502509, 0.2554738, -0.8438486, 1, 1, 1, 1, 1,
0.2506459, -0.9197258, 1.738092, 1, 1, 1, 1, 1,
0.2524815, 1.91331, 1.238945, 1, 1, 1, 1, 1,
0.2552206, 0.1527301, 0.54421, 0, 0, 1, 1, 1,
0.2592245, 2.638414, -1.023357, 1, 0, 0, 1, 1,
0.2594127, -0.4998379, 3.77067, 1, 0, 0, 1, 1,
0.2595845, 2.526268, -1.725253, 1, 0, 0, 1, 1,
0.2619103, 0.2936989, -0.1811933, 1, 0, 0, 1, 1,
0.2642367, 0.7327566, -0.802405, 1, 0, 0, 1, 1,
0.2672326, 1.35988, -0.9998995, 0, 0, 0, 1, 1,
0.2697518, 1.262106, -0.4414848, 0, 0, 0, 1, 1,
0.278661, -0.2409135, 0.2436498, 0, 0, 0, 1, 1,
0.2817101, 1.115341, -0.7880123, 0, 0, 0, 1, 1,
0.284627, 0.03943935, 0.3247297, 0, 0, 0, 1, 1,
0.2973932, -0.3976288, 2.758779, 0, 0, 0, 1, 1,
0.3041484, -0.1228689, 0.6002051, 0, 0, 0, 1, 1,
0.3099882, 0.2641381, 1.818055, 1, 1, 1, 1, 1,
0.3183452, 0.2958731, 1.139818, 1, 1, 1, 1, 1,
0.3234767, -0.5829073, 1.65734, 1, 1, 1, 1, 1,
0.3246919, 0.3606727, 0.9084151, 1, 1, 1, 1, 1,
0.324804, -1.75383, 3.493598, 1, 1, 1, 1, 1,
0.3250855, -1.86327, 3.10725, 1, 1, 1, 1, 1,
0.3254832, -0.2326809, 1.748501, 1, 1, 1, 1, 1,
0.3277396, -0.06143516, -1.487011, 1, 1, 1, 1, 1,
0.3296464, 0.2687367, 0.529744, 1, 1, 1, 1, 1,
0.3312644, 1.203238, -1.059251, 1, 1, 1, 1, 1,
0.3341945, -0.6253216, 2.102835, 1, 1, 1, 1, 1,
0.3410708, 1.07941, -0.4577153, 1, 1, 1, 1, 1,
0.3410781, 1.185975, 0.3434748, 1, 1, 1, 1, 1,
0.3503675, 1.591243, 1.021087, 1, 1, 1, 1, 1,
0.3530074, -0.2226497, 2.88556, 1, 1, 1, 1, 1,
0.3549933, 0.01049088, 1.223059, 0, 0, 1, 1, 1,
0.3580851, -0.4752471, 3.179768, 1, 0, 0, 1, 1,
0.3601995, 0.3997036, 0.6357692, 1, 0, 0, 1, 1,
0.3607825, -0.5047656, 1.78651, 1, 0, 0, 1, 1,
0.3633099, -0.520699, 2.752756, 1, 0, 0, 1, 1,
0.3659042, 0.5305797, 1.751437, 1, 0, 0, 1, 1,
0.3707212, -0.721724, 1.097336, 0, 0, 0, 1, 1,
0.374698, 0.1545391, 1.344782, 0, 0, 0, 1, 1,
0.3761656, -0.3189908, 1.999037, 0, 0, 0, 1, 1,
0.3779172, 0.5525475, -0.4655954, 0, 0, 0, 1, 1,
0.3797369, -0.7439045, 1.520267, 0, 0, 0, 1, 1,
0.3800547, -0.7513722, 1.965962, 0, 0, 0, 1, 1,
0.3801372, -0.1490586, 1.670702, 0, 0, 0, 1, 1,
0.3827709, 1.190543, 0.04870497, 1, 1, 1, 1, 1,
0.3840759, 1.201848, -0.4155281, 1, 1, 1, 1, 1,
0.388265, -0.5516598, 1.929152, 1, 1, 1, 1, 1,
0.3933259, 2.802127, -0.2515129, 1, 1, 1, 1, 1,
0.4014796, 0.1386237, 1.804458, 1, 1, 1, 1, 1,
0.403342, -0.1922139, 1.474901, 1, 1, 1, 1, 1,
0.4095967, -0.9749334, 2.25765, 1, 1, 1, 1, 1,
0.4097742, 2.604391, -0.9923107, 1, 1, 1, 1, 1,
0.4121905, -0.3114906, 2.523095, 1, 1, 1, 1, 1,
0.4175924, -0.5525014, 0.6393107, 1, 1, 1, 1, 1,
0.4186307, 0.4630707, 0.03666935, 1, 1, 1, 1, 1,
0.4202201, -0.4986886, 4.029523, 1, 1, 1, 1, 1,
0.423934, -1.771307, 2.501894, 1, 1, 1, 1, 1,
0.4260401, -0.8629111, 1.612305, 1, 1, 1, 1, 1,
0.4282866, -0.1946276, 1.902001, 1, 1, 1, 1, 1,
0.4348037, 0.7512551, 0.4574611, 0, 0, 1, 1, 1,
0.4362078, 1.059991, 0.9417347, 1, 0, 0, 1, 1,
0.4389038, 2.20143, 0.9368548, 1, 0, 0, 1, 1,
0.4410921, -0.3919, 2.424472, 1, 0, 0, 1, 1,
0.4448594, 0.245723, 0.5885503, 1, 0, 0, 1, 1,
0.4510018, 1.270231, -0.3306921, 1, 0, 0, 1, 1,
0.4526922, -1.814787, 2.476129, 0, 0, 0, 1, 1,
0.4548099, 0.3784779, 1.107045, 0, 0, 0, 1, 1,
0.4560492, 2.178928, -2.113867, 0, 0, 0, 1, 1,
0.4588804, 0.4762709, -0.07510094, 0, 0, 0, 1, 1,
0.4608009, -0.05899079, 3.718365, 0, 0, 0, 1, 1,
0.4622034, -0.896601, 1.440129, 0, 0, 0, 1, 1,
0.4636921, -0.623469, 3.071169, 0, 0, 0, 1, 1,
0.4641026, 0.6451174, 1.43951, 1, 1, 1, 1, 1,
0.4663658, -0.9472828, 3.519113, 1, 1, 1, 1, 1,
0.4680372, 1.655464, 0.4187082, 1, 1, 1, 1, 1,
0.4707943, -0.7906951, 2.142084, 1, 1, 1, 1, 1,
0.4744665, 0.762775, 0.4524375, 1, 1, 1, 1, 1,
0.4811744, -0.6334092, 2.830309, 1, 1, 1, 1, 1,
0.4832443, 1.234614, 1.433549, 1, 1, 1, 1, 1,
0.483634, 0.1715267, 0.3890801, 1, 1, 1, 1, 1,
0.4839574, 0.1406676, -0.01989439, 1, 1, 1, 1, 1,
0.4861523, 0.3171906, 0.5025401, 1, 1, 1, 1, 1,
0.4872689, -0.6691563, 1.343374, 1, 1, 1, 1, 1,
0.4926877, 0.5468563, -0.02176695, 1, 1, 1, 1, 1,
0.4955064, 1.697822, -1.001191, 1, 1, 1, 1, 1,
0.4978079, -0.1896034, 4.107041, 1, 1, 1, 1, 1,
0.4980839, 0.3485405, 0.9533612, 1, 1, 1, 1, 1,
0.4992321, -0.128791, 2.851443, 0, 0, 1, 1, 1,
0.5008419, -1.670125, 3.896724, 1, 0, 0, 1, 1,
0.5068814, 1.925759, 0.4932981, 1, 0, 0, 1, 1,
0.5101761, -0.4540108, 0.5200645, 1, 0, 0, 1, 1,
0.5166197, -0.4493164, 3.029595, 1, 0, 0, 1, 1,
0.5200732, -0.385536, 3.053118, 1, 0, 0, 1, 1,
0.521948, 1.27502, 0.7323356, 0, 0, 0, 1, 1,
0.5258451, -1.845878, 3.186242, 0, 0, 0, 1, 1,
0.5299408, 0.5499218, 0.3861496, 0, 0, 0, 1, 1,
0.5320323, 0.03628186, 1.134454, 0, 0, 0, 1, 1,
0.5329976, -0.1465417, 1.869174, 0, 0, 0, 1, 1,
0.5330867, -1.163027, 3.318814, 0, 0, 0, 1, 1,
0.5356582, -0.5314503, 1.981335, 0, 0, 0, 1, 1,
0.5357294, -0.4780385, 2.68956, 1, 1, 1, 1, 1,
0.5372861, -0.1177526, 2.849195, 1, 1, 1, 1, 1,
0.5377274, -0.7155675, 1.819104, 1, 1, 1, 1, 1,
0.5478554, -1.214435, 1.677827, 1, 1, 1, 1, 1,
0.5480624, 0.2168092, 1.093202, 1, 1, 1, 1, 1,
0.548245, -0.6854998, 3.517982, 1, 1, 1, 1, 1,
0.5490296, -1.967108, 4.633228, 1, 1, 1, 1, 1,
0.5517722, 0.5456372, 1.956061, 1, 1, 1, 1, 1,
0.5533649, 0.486038, -0.7478188, 1, 1, 1, 1, 1,
0.557511, 0.7487543, -0.1918523, 1, 1, 1, 1, 1,
0.5581281, -0.3160119, 0.8638518, 1, 1, 1, 1, 1,
0.5587541, -2.117861, 2.578024, 1, 1, 1, 1, 1,
0.5622176, -0.3666647, 2.037181, 1, 1, 1, 1, 1,
0.5634238, 1.620687, 0.4443339, 1, 1, 1, 1, 1,
0.5720328, -0.4590603, 0.6161069, 1, 1, 1, 1, 1,
0.5720542, -1.105542, 2.711164, 0, 0, 1, 1, 1,
0.5734384, -1.912658, 2.292769, 1, 0, 0, 1, 1,
0.5752235, 0.1605886, 2.047172, 1, 0, 0, 1, 1,
0.5792279, 0.02868939, 0.67811, 1, 0, 0, 1, 1,
0.5821481, 1.162754, 0.03054604, 1, 0, 0, 1, 1,
0.5835212, 1.542215, 0.3699785, 1, 0, 0, 1, 1,
0.5841863, 0.7037258, 0.6895778, 0, 0, 0, 1, 1,
0.5848528, 0.331074, 1.101775, 0, 0, 0, 1, 1,
0.58786, 1.0103, -0.7606144, 0, 0, 0, 1, 1,
0.588559, 0.6507712, 0.3765089, 0, 0, 0, 1, 1,
0.5894471, -0.558122, 2.039234, 0, 0, 0, 1, 1,
0.5931818, -0.4037867, 2.204067, 0, 0, 0, 1, 1,
0.5962291, -1.354608, 2.093724, 0, 0, 0, 1, 1,
0.5986922, -0.5193562, 1.474161, 1, 1, 1, 1, 1,
0.6049765, 1.587921, 1.971932, 1, 1, 1, 1, 1,
0.6085886, 0.1931262, 1.707086, 1, 1, 1, 1, 1,
0.6112506, 0.42867, -0.1207337, 1, 1, 1, 1, 1,
0.6131924, -0.1867258, 2.354158, 1, 1, 1, 1, 1,
0.6168627, 1.700547, -1.262201, 1, 1, 1, 1, 1,
0.6213191, 1.876799, 0.8800534, 1, 1, 1, 1, 1,
0.6235659, 0.5881376, 0.2764148, 1, 1, 1, 1, 1,
0.6255146, 0.3526722, 1.315283, 1, 1, 1, 1, 1,
0.6278676, 1.361121, -0.285074, 1, 1, 1, 1, 1,
0.6305346, -0.2725065, 2.098768, 1, 1, 1, 1, 1,
0.6313898, -0.448713, 2.764808, 1, 1, 1, 1, 1,
0.631519, 1.359639, 0.4668563, 1, 1, 1, 1, 1,
0.6335638, 0.6939026, 1.635228, 1, 1, 1, 1, 1,
0.6403003, -0.4134129, 0.7329474, 1, 1, 1, 1, 1,
0.6461421, -0.2639191, 2.901659, 0, 0, 1, 1, 1,
0.6482109, -0.06781946, 1.595952, 1, 0, 0, 1, 1,
0.6487262, -1.016656, 3.455532, 1, 0, 0, 1, 1,
0.6488627, 1.806189, 0.2400084, 1, 0, 0, 1, 1,
0.6493892, -0.847637, 2.696668, 1, 0, 0, 1, 1,
0.6503672, -1.647385, 1.951995, 1, 0, 0, 1, 1,
0.6522617, -0.9473534, 2.59676, 0, 0, 0, 1, 1,
0.6573744, -0.01316457, 3.689454, 0, 0, 0, 1, 1,
0.6582739, -1.145299, 2.826097, 0, 0, 0, 1, 1,
0.6682199, 0.9946417, 0.3326075, 0, 0, 0, 1, 1,
0.6723659, 0.544192, 1.117019, 0, 0, 0, 1, 1,
0.6763307, -0.2077009, 1.340403, 0, 0, 0, 1, 1,
0.6768155, -0.07655492, 2.274269, 0, 0, 0, 1, 1,
0.6770685, -0.2846061, 2.403707, 1, 1, 1, 1, 1,
0.6821291, -1.334363, 2.607079, 1, 1, 1, 1, 1,
0.686272, -1.87459, 2.070581, 1, 1, 1, 1, 1,
0.6909512, 0.4427326, 0.002769435, 1, 1, 1, 1, 1,
0.6951997, 0.2559379, 2.282441, 1, 1, 1, 1, 1,
0.6970908, 2.392691, 0.3981855, 1, 1, 1, 1, 1,
0.699492, 0.1270051, 1.883313, 1, 1, 1, 1, 1,
0.7030806, 1.154109, 0.9533325, 1, 1, 1, 1, 1,
0.7033097, -0.1086508, 0.67485, 1, 1, 1, 1, 1,
0.7128731, -0.2531048, 0.1644223, 1, 1, 1, 1, 1,
0.7138032, -0.7637673, 2.792759, 1, 1, 1, 1, 1,
0.7189912, -0.1524473, 2.658689, 1, 1, 1, 1, 1,
0.7213826, 0.2836241, 0.7871464, 1, 1, 1, 1, 1,
0.7325613, 1.360355, 0.03576921, 1, 1, 1, 1, 1,
0.735991, -0.7457243, 2.798105, 1, 1, 1, 1, 1,
0.7388803, -0.3087656, 0.415141, 0, 0, 1, 1, 1,
0.7642285, 1.008256, 2.413813, 1, 0, 0, 1, 1,
0.7651698, 0.4789677, 0.6429783, 1, 0, 0, 1, 1,
0.7678205, -0.7557166, 1.909879, 1, 0, 0, 1, 1,
0.7731212, -0.8320724, 2.143366, 1, 0, 0, 1, 1,
0.773582, -0.03166308, 0.4320562, 1, 0, 0, 1, 1,
0.7889799, 0.2633027, 1.452966, 0, 0, 0, 1, 1,
0.7909375, -1.238882, 2.307683, 0, 0, 0, 1, 1,
0.7909594, 1.468043, 0.1930276, 0, 0, 0, 1, 1,
0.7924147, -0.9486063, 2.744102, 0, 0, 0, 1, 1,
0.7994977, 1.366579, 0.1015078, 0, 0, 0, 1, 1,
0.8004121, -0.3020561, 2.640176, 0, 0, 0, 1, 1,
0.8106182, 2.521269, -0.9197311, 0, 0, 0, 1, 1,
0.8127638, 0.4519066, 2.222348, 1, 1, 1, 1, 1,
0.8169127, 0.2528924, 2.460392, 1, 1, 1, 1, 1,
0.8175473, -0.2296056, 2.254981, 1, 1, 1, 1, 1,
0.8208173, 0.6306479, 0.6806619, 1, 1, 1, 1, 1,
0.8216755, -0.3823348, 2.673393, 1, 1, 1, 1, 1,
0.8235728, -1.399237, 1.641703, 1, 1, 1, 1, 1,
0.8275272, 0.8786567, 0.2892523, 1, 1, 1, 1, 1,
0.8299744, 3.003644, 1.336558, 1, 1, 1, 1, 1,
0.8376184, -1.085981, 2.553402, 1, 1, 1, 1, 1,
0.83777, 0.1383222, 1.88877, 1, 1, 1, 1, 1,
0.8422533, -0.649659, 0.2248615, 1, 1, 1, 1, 1,
0.8436443, -0.2769556, 2.433095, 1, 1, 1, 1, 1,
0.8467119, -0.2594378, 1.539665, 1, 1, 1, 1, 1,
0.8483012, 1.295201, 0.8569767, 1, 1, 1, 1, 1,
0.8537704, 1.680779, 0.6025856, 1, 1, 1, 1, 1,
0.8537962, -2.710959, 2.753931, 0, 0, 1, 1, 1,
0.8552262, 0.966396, -0.7167275, 1, 0, 0, 1, 1,
0.8614494, 0.04691041, 2.549009, 1, 0, 0, 1, 1,
0.8689339, 0.8558148, 0.7302196, 1, 0, 0, 1, 1,
0.8705299, 1.211252, 2.018516, 1, 0, 0, 1, 1,
0.8858313, 0.5730399, 0.4615604, 1, 0, 0, 1, 1,
0.8867042, 0.2005018, 2.467354, 0, 0, 0, 1, 1,
0.8974368, 1.573838, 0.928164, 0, 0, 0, 1, 1,
0.9043946, -0.1076805, 2.128154, 0, 0, 0, 1, 1,
0.9058365, -0.5095388, 1.5791, 0, 0, 0, 1, 1,
0.9091733, 0.9589866, 0.4750331, 0, 0, 0, 1, 1,
0.9146689, 0.433093, 0.7133312, 0, 0, 0, 1, 1,
0.9148566, 0.1915246, 0.5224365, 0, 0, 0, 1, 1,
0.9174587, -0.4095113, 4.138747, 1, 1, 1, 1, 1,
0.9273458, 0.4577568, 0.363444, 1, 1, 1, 1, 1,
0.928234, -0.4094117, 1.629444, 1, 1, 1, 1, 1,
0.9393529, 0.2134592, 2.90262, 1, 1, 1, 1, 1,
0.9447682, 0.5783244, 1.802397, 1, 1, 1, 1, 1,
0.9478896, -0.2503235, 0.6297036, 1, 1, 1, 1, 1,
0.951004, -1.228725, 2.572817, 1, 1, 1, 1, 1,
0.9541691, 0.4401755, 1.009683, 1, 1, 1, 1, 1,
0.9554084, 0.1242499, 2.152384, 1, 1, 1, 1, 1,
0.9557515, -1.025803, 4.079894, 1, 1, 1, 1, 1,
0.9678337, -0.6671683, 1.603956, 1, 1, 1, 1, 1,
0.9684569, 1.149589, 1.095288, 1, 1, 1, 1, 1,
0.9737312, -0.02591702, 2.827521, 1, 1, 1, 1, 1,
0.9752541, 0.7733585, 1.883118, 1, 1, 1, 1, 1,
0.9781991, -0.06094028, -0.124141, 1, 1, 1, 1, 1,
0.9885472, 1.146684, 0.8736715, 0, 0, 1, 1, 1,
0.9917033, 0.5092462, -0.557153, 1, 0, 0, 1, 1,
0.9938579, -0.8769942, 1.872952, 1, 0, 0, 1, 1,
0.9940724, 0.87407, 0.7194537, 1, 0, 0, 1, 1,
0.9945105, -0.05057497, 1.306004, 1, 0, 0, 1, 1,
1.008767, 0.6108112, 2.343654, 1, 0, 0, 1, 1,
1.014215, -1.319284, 2.843461, 0, 0, 0, 1, 1,
1.018666, -0.6591364, 2.548917, 0, 0, 0, 1, 1,
1.028998, 0.1535691, 2.564308, 0, 0, 0, 1, 1,
1.034324, 0.02060081, 3.265098, 0, 0, 0, 1, 1,
1.036116, -0.7872364, 3.171957, 0, 0, 0, 1, 1,
1.03647, 0.9870605, 2.074705, 0, 0, 0, 1, 1,
1.039021, -0.1581613, 2.841447, 0, 0, 0, 1, 1,
1.041426, 0.6135605, -0.3607123, 1, 1, 1, 1, 1,
1.042625, 1.030048, 0.2315283, 1, 1, 1, 1, 1,
1.045184, -0.8616603, 4.126324, 1, 1, 1, 1, 1,
1.052714, -1.710601, 2.293693, 1, 1, 1, 1, 1,
1.052758, -1.095962, 1.278049, 1, 1, 1, 1, 1,
1.064871, 0.9266406, 2.123878, 1, 1, 1, 1, 1,
1.066895, 2.889622, 0.7579489, 1, 1, 1, 1, 1,
1.068051, 0.2480559, 1.594555, 1, 1, 1, 1, 1,
1.069532, -0.1648594, 0.6720073, 1, 1, 1, 1, 1,
1.072081, 0.8560645, -1.739106, 1, 1, 1, 1, 1,
1.073046, -0.7228462, 1.749875, 1, 1, 1, 1, 1,
1.077771, -0.4943039, 2.797115, 1, 1, 1, 1, 1,
1.078945, -1.849664, 2.452376, 1, 1, 1, 1, 1,
1.08502, 0.08131424, 1.275087, 1, 1, 1, 1, 1,
1.086473, 0.1666466, 0.5920655, 1, 1, 1, 1, 1,
1.094612, 1.916386, 3.323798, 0, 0, 1, 1, 1,
1.09534, 0.7705365, 1.566398, 1, 0, 0, 1, 1,
1.096712, -0.3648408, 3.110948, 1, 0, 0, 1, 1,
1.100553, -2.405123, 5.063759, 1, 0, 0, 1, 1,
1.105036, 0.4385947, 0.3066603, 1, 0, 0, 1, 1,
1.11263, -0.7635571, 2.808953, 1, 0, 0, 1, 1,
1.113051, 0.2719705, 2.311564, 0, 0, 0, 1, 1,
1.116343, -0.2069614, 0.9027376, 0, 0, 0, 1, 1,
1.118149, -0.2400498, 3.42583, 0, 0, 0, 1, 1,
1.121674, -1.606751, 2.541612, 0, 0, 0, 1, 1,
1.121897, 2.259799, -1.351305, 0, 0, 0, 1, 1,
1.127614, -0.07063987, 2.153948, 0, 0, 0, 1, 1,
1.131238, 1.505818, -0.402762, 0, 0, 0, 1, 1,
1.137147, -1.408029, 3.028068, 1, 1, 1, 1, 1,
1.137901, -1.679949, 2.612375, 1, 1, 1, 1, 1,
1.141692, -0.2713867, 2.091176, 1, 1, 1, 1, 1,
1.153592, -0.1795425, 1.380542, 1, 1, 1, 1, 1,
1.161379, 1.434755, 0.9784119, 1, 1, 1, 1, 1,
1.170793, -1.603554, 1.713001, 1, 1, 1, 1, 1,
1.17141, 1.122269, 1.699041, 1, 1, 1, 1, 1,
1.183949, 0.807551, 1.114668, 1, 1, 1, 1, 1,
1.190597, 1.762695, 0.2074509, 1, 1, 1, 1, 1,
1.193277, 2.153756, 1.973784, 1, 1, 1, 1, 1,
1.197689, -0.9216369, 1.103322, 1, 1, 1, 1, 1,
1.203566, 0.9652772, 2.146182, 1, 1, 1, 1, 1,
1.20417, -1.559832, 2.502481, 1, 1, 1, 1, 1,
1.20979, 0.3125952, 0.6202064, 1, 1, 1, 1, 1,
1.221111, -1.546063, 2.364136, 1, 1, 1, 1, 1,
1.225002, 0.3707748, 0.5531251, 0, 0, 1, 1, 1,
1.226093, -0.5518963, 2.702618, 1, 0, 0, 1, 1,
1.226727, 0.5376037, 0.3202395, 1, 0, 0, 1, 1,
1.233133, 0.4784268, -0.4469765, 1, 0, 0, 1, 1,
1.241675, -0.7206413, 2.346483, 1, 0, 0, 1, 1,
1.248179, 0.7720436, -1.06337, 1, 0, 0, 1, 1,
1.248337, 0.02892837, 1.634746, 0, 0, 0, 1, 1,
1.253036, -0.09928183, 1.010434, 0, 0, 0, 1, 1,
1.255033, -0.5118704, 2.295249, 0, 0, 0, 1, 1,
1.28566, -0.3963442, 1.994664, 0, 0, 0, 1, 1,
1.287604, -0.8083376, 2.648642, 0, 0, 0, 1, 1,
1.302732, 0.5442307, -0.04857375, 0, 0, 0, 1, 1,
1.305336, 0.06065223, -0.08392842, 0, 0, 0, 1, 1,
1.308282, 0.3236665, 2.23683, 1, 1, 1, 1, 1,
1.312039, 1.965, 1.508663, 1, 1, 1, 1, 1,
1.328357, -1.066097, 2.488428, 1, 1, 1, 1, 1,
1.329915, -0.02371356, 0.4055894, 1, 1, 1, 1, 1,
1.340349, -0.450014, 3.413782, 1, 1, 1, 1, 1,
1.341649, 0.3176116, -1.980274, 1, 1, 1, 1, 1,
1.344542, 1.4168, -0.6897201, 1, 1, 1, 1, 1,
1.359066, 0.4781216, 1.632953, 1, 1, 1, 1, 1,
1.364937, -1.539161, -0.3579518, 1, 1, 1, 1, 1,
1.370518, 0.1850451, 2.288213, 1, 1, 1, 1, 1,
1.395865, 0.09450389, 2.219427, 1, 1, 1, 1, 1,
1.405349, 0.3943642, 0.9368514, 1, 1, 1, 1, 1,
1.408639, -0.06521456, 0.08289982, 1, 1, 1, 1, 1,
1.413897, 0.5898969, -0.2793886, 1, 1, 1, 1, 1,
1.414199, -1.311818, 2.145355, 1, 1, 1, 1, 1,
1.414297, 1.30034, 0.4397191, 0, 0, 1, 1, 1,
1.421085, 1.249022, -1.571085, 1, 0, 0, 1, 1,
1.421959, 0.4149118, 2.463689, 1, 0, 0, 1, 1,
1.434942, -0.1545033, 1.387857, 1, 0, 0, 1, 1,
1.439672, -0.3293819, 3.0791, 1, 0, 0, 1, 1,
1.446839, -0.1788954, 3.162208, 1, 0, 0, 1, 1,
1.456113, 0.5579782, 3.108179, 0, 0, 0, 1, 1,
1.458119, 0.1873007, 2.669714, 0, 0, 0, 1, 1,
1.463007, -1.489099, 1.432869, 0, 0, 0, 1, 1,
1.50507, -1.089852, 2.37003, 0, 0, 0, 1, 1,
1.506208, 0.4165055, 1.297986, 0, 0, 0, 1, 1,
1.52097, -1.691422, 2.499304, 0, 0, 0, 1, 1,
1.5374, 0.2478871, 1.187159, 0, 0, 0, 1, 1,
1.550397, 0.3397069, 0.472333, 1, 1, 1, 1, 1,
1.551465, 0.697836, -1.152819, 1, 1, 1, 1, 1,
1.553286, 0.7741845, -0.2832479, 1, 1, 1, 1, 1,
1.574508, 0.5312262, 1.611136, 1, 1, 1, 1, 1,
1.574711, 2.463, 1.759124, 1, 1, 1, 1, 1,
1.592607, -1.753521, 2.403045, 1, 1, 1, 1, 1,
1.593529, -0.1518026, 1.736493, 1, 1, 1, 1, 1,
1.59806, -0.5021225, 1.154743, 1, 1, 1, 1, 1,
1.60831, 1.030472, 0.6432199, 1, 1, 1, 1, 1,
1.614078, -0.289205, 1.255585, 1, 1, 1, 1, 1,
1.615275, -0.2161225, 1.239347, 1, 1, 1, 1, 1,
1.619092, 0.7049901, 1.276419, 1, 1, 1, 1, 1,
1.642533, -1.123738, 2.186571, 1, 1, 1, 1, 1,
1.648804, -2.571436, 3.412304, 1, 1, 1, 1, 1,
1.663844, 0.7056504, 0.9300268, 1, 1, 1, 1, 1,
1.677524, -1.501888, 4.030686, 0, 0, 1, 1, 1,
1.709548, 0.2716055, 1.262793, 1, 0, 0, 1, 1,
1.725316, 0.7998955, 0.8633175, 1, 0, 0, 1, 1,
1.734014, 0.7322761, -0.2657496, 1, 0, 0, 1, 1,
1.74369, 1.161605, 1.473418, 1, 0, 0, 1, 1,
1.773521, -1.443436, 2.29133, 1, 0, 0, 1, 1,
1.775428, 0.3412, 0.7297034, 0, 0, 0, 1, 1,
1.778345, 1.240638, -0.2939264, 0, 0, 0, 1, 1,
1.816375, 0.09440709, 1.404778, 0, 0, 0, 1, 1,
1.836145, 0.03258734, 1.373561, 0, 0, 0, 1, 1,
1.843376, 0.8776608, 1.813204, 0, 0, 0, 1, 1,
1.851279, -0.7841941, 1.630901, 0, 0, 0, 1, 1,
1.85484, 0.272218, 1.820091, 0, 0, 0, 1, 1,
1.859889, 0.7766131, 0.9024135, 1, 1, 1, 1, 1,
1.891563, -0.9673522, 3.628252, 1, 1, 1, 1, 1,
1.893831, 0.2891182, 1.192019, 1, 1, 1, 1, 1,
1.899704, 0.6899074, 1.007508, 1, 1, 1, 1, 1,
1.903779, -0.03213218, 1.278005, 1, 1, 1, 1, 1,
1.903958, 2.45693, 1.155121, 1, 1, 1, 1, 1,
1.904331, 1.320768, 1.965543, 1, 1, 1, 1, 1,
1.91141, 1.110261, -0.5061563, 1, 1, 1, 1, 1,
1.949702, -2.863349, 1.76909, 1, 1, 1, 1, 1,
1.95054, 0.6475978, 0.4878203, 1, 1, 1, 1, 1,
1.954146, -0.660969, 2.879322, 1, 1, 1, 1, 1,
1.959063, 1.14425, 0.8993868, 1, 1, 1, 1, 1,
1.972849, -2.856505, 2.1942, 1, 1, 1, 1, 1,
1.976966, -0.9371647, 0.7736686, 1, 1, 1, 1, 1,
1.981886, 1.865, 1.329111, 1, 1, 1, 1, 1,
2.004634, 1.288143, 1.772835, 0, 0, 1, 1, 1,
2.005806, -0.1258259, 1.947002, 1, 0, 0, 1, 1,
2.016544, -0.5829857, 2.75226, 1, 0, 0, 1, 1,
2.02605, 1.756348, 0.8342094, 1, 0, 0, 1, 1,
2.040199, 0.8908007, 1.629101, 1, 0, 0, 1, 1,
2.059643, 0.4873139, 0.6750962, 1, 0, 0, 1, 1,
2.125664, 0.7952656, 0.465739, 0, 0, 0, 1, 1,
2.143313, -0.4598348, 1.7716, 0, 0, 0, 1, 1,
2.204251, -0.1257534, 1.066108, 0, 0, 0, 1, 1,
2.217786, 1.655526, -0.84334, 0, 0, 0, 1, 1,
2.229456, 1.517122, 1.495827, 0, 0, 0, 1, 1,
2.246395, 0.5274817, 1.15067, 0, 0, 0, 1, 1,
2.271964, -1.79883, 4.281806, 0, 0, 0, 1, 1,
2.279588, 0.4827049, 1.903206, 1, 1, 1, 1, 1,
2.286432, -0.08362664, 0.9631262, 1, 1, 1, 1, 1,
2.35044, -1.853515, 1.395399, 1, 1, 1, 1, 1,
2.414177, -1.462083, 2.988899, 1, 1, 1, 1, 1,
2.451042, 1.708345, 0.606736, 1, 1, 1, 1, 1,
2.473226, 2.376063, 1.367408, 1, 1, 1, 1, 1,
2.999611, 1.564221, 0.6376075, 1, 1, 1, 1, 1
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
var radius = 10.10439;
var distance = 35.49125;
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
mvMatrix.translate( 0.04147005, -0.4470335, 0.6129115 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.49125);
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
